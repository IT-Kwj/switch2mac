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
    texture2d_array<float> vp_t_tcb_14 [[id(9)]];
    sampler vp_t_tcb_14Smplr [[id(10)]];
    texture2d_array<float> vp_t_tcb_16 [[id(11)]];
    sampler vp_t_tcb_16Smplr [[id(12)]];
    texture3d<float> vp_t_tcb_32 [[id(13)]];
    sampler vp_t_tcb_32Smplr [[id(14)]];
    texture3d<float> vp_t_tcb_30 [[id(15)]];
    sampler vp_t_tcb_30Smplr [[id(16)]];
    texture2d<float> vp_t_tcb_1C [[id(17)]];
    sampler vp_t_tcb_1CSmplr [[id(18)]];
    sampler vp_t_tcb_24Smplr_w [[id(19)]];
    sampler vp_t_tcb_14Smplr_w [[id(20)]];
    sampler vp_t_tcb_32Smplr_w [[id(21)]];
    sampler vp_t_tcb_30Smplr_w [[id(22)]];
    sampler vp_t_tcb_1CSmplr_w [[id(23)]];
    constant dm_border_t* dm_border [[id(24)]];
};

struct main0_out
{
    float4 m_72 [[user(locn0)]];
    float4 m_74 [[user(locn1)]];
    float4 m_78 [[user(locn2)]];
    float4 m_84 [[user(locn3)]];
    float4 m_92 [[user(locn4)]];
    float4 m_61 [[user(locn5)]];
    float4 m_80 [[user(locn6)]];
    float4 m_82 [[user(locn7)]];
    float4 m_90 [[user(locn8)]];
    float4 m_86 [[user(locn9)]];
    float4 m_88 [[user(locn10)]];
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
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4151 = false;
    bool _2530 = false;
    bool _991 = false;
    bool _807 = false;
    bool _693 = false;
    bool _491 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _106 = in.m_58.w;
    float _108 = trunc(_106);
    int _111 = int(_108);
    bool _115 = _111 >= 1;
    float _117 = 0.0;
    if (!_115)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _119 = _117;
    float _121 = _119;
    if (!_115)
    {
        out.m_61.x = 0.0;
    }
    int _123 = 0;
    if (!_115)
    {
        float _125 = _119 * 5.0;
        _123 = as_type<int>(_125);
    }
    int _127 = _123;
    int _129 = _127;
    if (!_115)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4456 = as_type<float>(_127);
        out.gl_Position.z = _4456;
    }
    if (!_115)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _131 = in.m_63.w;
    bool _133 = _131 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _135 = isnan(_131);
    bool _137 = _133 || _135;
    bool _139 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _141 = _137 || _139;
    float _143 = -_131;
    float _145 = _143 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _147 = _145;
    if (_141)
    {
        float _149 = float(_111);
        _121 = _149;
    }
    float _151 = _121;
    bool _153 = _145 >= _151;
    bool _155 = !_141;
    bool _157 = _153 || _155;
    float _159 = _151;
    if (_157)
    {
        _159 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _159;
    if (_157)
    {
        out.m_61.x = 0.0;
    }
    if (_157)
    {
        float _163 = _161 * 5.0;
        _129 = as_type<int>(_163);
    }
    int _165 = _129;
    if (_157)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4526 = as_type<float>(_165);
        out.gl_Position.z = _4526;
    }
    if (_157)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _167 = as_type<float>(int(gl_VertexIndex));
    float _169 = _145 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _171 = in.m_68.w;
    bool _173 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _175 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _177 = _173 || _175;
    bool _179 = isnan(1.0);
    bool _181 = _177 || _179;
    float _183 = in.m_63.x;
    float _185 = in.m_63.y;
    float _187 = in.m_63.z;
    float _189 = in.m_58.x;
    float _191 = in.m_58.y;
    float _193 = in.m_58.z;
    int _195 = as_type<int>(_167) & 1;
    bool _197 = _195 != 0;
    int _199 = as_type<int>(_167) & 2;
    bool _201 = _199 != 0;
    float _203 = _167;
    float _205 = _169;
    if (!_181)
    {
        float _207 = _169 * _169;
        float _209 = _207 * 0.5;
        _203 = _209;
    }
    float _211 = _203;
    bool _213 = !_197;
    float _215 = _213 ? (-0.5) : 0.5;
    float _217 = _211;
    if (!_181)
    {
        float _219 = _211 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _217 = _219;
    }
    float _221 = _217;
    bool _223 = !_201;
    float _225 = _223 ? (-0.5) : 0.5;
    bool _227 = !_181;
    float _229 = _221;
    if (!_227)
    {
        float _231 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _233 = log2(_231);
        float _235 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _237 = _235 + 1.0;
        float _239 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _241 = _169 * _233;
        float _243 = 1.0 / _237;
        float _245 = _239 * 0.693147182464599609375;
        float _247 = exp2(_241);
        float _249 = 1.0 / _245;
        float _251 = _247 + (-1.0);
        float _253 = -_251;
        float _255 = fma(_253, _249, _169);
        float _257 = _255 * _243;
        float _259 = _257 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _229 = _259;
    }
    float _261 = _229;
    float _263 = _261 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _265 = !_181;
    float _267 = _263;
    float _269 = _261;
    if (!_265)
    {
        float _271 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _273 = log2(_271);
        float _275 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _277 = _275 + 1.0;
        float _279 = 1.0 / _277;
        float _281 = _169 * _273;
        float _283 = exp2(_281);
        float _285 = -_283;
        float _287 = _285 + 1.0;
        float _289 = _287 * _279;
        _205 = _289;
    }
    float _291 = _205;
    float _293 = _261 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _295 = _263 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _297 = _263 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _299 = _263 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    if (!_181)
    {
        float _301 = _145 * _145;
        float _303 = _301 * 0.5;
        _267 = _303;
    }
    float _305 = _267;
    float _307 = fma(_293, (*spvDescriptorSet0.vp_c10)._m0[8].x, _295);
    float _309 = fma(_293, (*spvDescriptorSet0.vp_c10)._m0[8].y, _297);
    float _311 = fma(_293, (*spvDescriptorSet0.vp_c10)._m0[8].z, _299);
    float _313 = _261 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_181)
    {
        float _315 = _305 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _269 = _315;
    }
    float _317 = _269;
    bool _319 = !_181;
    float _321 = _317;
    if (!_319)
    {
        float _323 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _325 = log2(_323);
        float _327 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _329 = _327 + 1.0;
        float _331 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _333 = _145 * _325;
        float _335 = exp2(_333);
        float _337 = _331 * 0.693147182464599609375;
        float _339 = 1.0 / _337;
        float _341 = 1.0 / _329;
        float _343 = _335 + (-1.0);
        float _345 = -_343;
        float _347 = fma(_345, _339, _145);
        float _349 = _347 * _341;
        float _351 = _349 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _321 = _351;
    }
    float _353 = _321;
    float _355 = _353 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _357 = fma(_313, (*spvDescriptorSet0.vp_c10)._m0[10].x, _307);
    float _359 = fma(_313, (*spvDescriptorSet0.vp_c10)._m0[10].y, _309);
    float _361 = _353 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _363 = _355 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _365 = _355 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _367 = _355 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _369 = fma(_313, (*spvDescriptorSet0.vp_c10)._m0[10].z, _311);
    float _371 = fma(_361, (*spvDescriptorSet0.vp_c10)._m0[8].x, _363);
    float _373 = fma(_361, (*spvDescriptorSet0.vp_c10)._m0[8].y, _365);
    float _375 = fma(_361, (*spvDescriptorSet0.vp_c10)._m0[8].z, _367);
    float _377 = _353 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _379 = fma(_291, _183, _357);
    float _381 = fma(_291, _185, _359);
    float _383 = fma(_291, _187, _369);
    float _385 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[10].x, _371);
    float _387 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[10].y, _373);
    float _389 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[10].z, _375);
    float _391 = _377;
    if (!_181)
    {
        _391 = _145;
    }
    float _393 = _391;
    bool _395 = !_181;
    float _397 = _393;
    if (!_395)
    {
        float _399 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _401 = log2(_399);
        float _403 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _405 = _403 + 1.0;
        float _407 = 1.0 / _405;
        float _409 = _145 * _401;
        float _411 = exp2(_409);
        float _413 = -_411;
        float _415 = _413 + 1.0;
        float _417 = _415 * _407;
        _397 = _417;
    }
    float _419 = _397;
    float _421 = fma(_419, _185, _387);
    float _423 = fma(_419, _183, _385);
    float _425 = fma(_419, _187, _389);
    bool _427 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _429 = fma(_381, _171, _191);
    float _431 = -_421;
    float _433 = _381 + _431;
    float _435 = fma(_379, _171, _189);
    float _437 = -_423;
    float _439 = _379 + _437;
    float _441 = -_425;
    float _443 = _383 + _441;
    float _445 = _433 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _447 = _433 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _449 = _433 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _451 = fma(_439, (*spvDescriptorSet0.vp_c10)._m0[4].x, _445);
    float _453 = fma(_439, (*spvDescriptorSet0.vp_c10)._m0[5].x, _447);
    float _455 = fma(_439, (*spvDescriptorSet0.vp_c10)._m0[6].x, _449);
    float _457 = fma(_383, _171, _193);
    float _459 = fma(_443, (*spvDescriptorSet0.vp_c10)._m0[4].z, _451);
    float _461 = fma(_443, (*spvDescriptorSet0.vp_c10)._m0[5].z, _453);
    float _463 = fma(_443, (*spvDescriptorSet0.vp_c10)._m0[6].z, _455);
    bool _465 = !_427;
    float _467 = _461;
    float _469 = _459;
    float _471 = _463;
    float _489;
    if (!_465)
    {
        float _473 = in.m_70.x;
        float _475 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _477 = _473 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _479 = fma(_477, (*spvDescriptorSet0.vp_c9)._m0[12].x, _145);
        float _481 = _479 * _475;
        float _483 = floor(_481);
        float _485 = -_483;
        float _487 = _481 + _485;
        _489 = _487;
        _491 = true;
    }
    else
    {
        float _493 = float(_111);
        float _495 = 1.0 / _493;
        float _497 = _145 * _495;
        _489 = _497;
    }
    _491 = false;
    float _499 = _489;
    float _501 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _503 = _499 + _501;
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _507 = _499 + _505;
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _511 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _509;
    float _513 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _515 = _513 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _517 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _519 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _517;
    bool _521 = _499 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _523 = isnan(_499);
    bool _525 = _521 || _523;
    bool _527 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _529 = _525 || _527;
    float _531 = float(_529);
    float _533 = 1.0 / _511;
    float _535 = -_531;
    float _537 = _535 + 1.0;
    bool _539 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _541 = 1.0 / _515;
    float _543 = 1.0 / _519;
    float _545 = _503 * _533;
    float _547 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _549 = _499 + _547;
    float _551 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _553 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _551;
    float _555 = _549 * _541;
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _559 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _557;
    float _561 = fma(_553, _545, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _565 = _563 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _567 = fma(_559, _545, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _569 = _507 * _543;
    bool _571 = _499 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _573 = isnan(_499);
    bool _575 = _571 || _573;
    bool _577 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _579 = _575 || _577;
    float _581 = float(_579);
    bool _583 = _499 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _585 = isnan(_499);
    bool _587 = _583 || _585;
    bool _589 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _591 = _587 || _589;
    float _593 = float(_591);
    float _595 = _581 * _537;
    bool _597 = _499 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _599 = isnan(_499);
    bool _601 = _597 || _599;
    bool _603 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _605 = _601 || _603;
    float _607 = float(_605);
    float _609 = -_581;
    float _611 = _609 + 1.0;
    float _613 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _615 = _613 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _617 = -_593;
    float _619 = _617 + 1.0;
    float _621 = _593 * _611;
    float _623 = fma(_615, _555, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _625 = fma(_565, _555, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _627 = _607 * _619;
    float _629 = in.m_68.x;
    float _631 = in.m_68.y;
    float _633 = -_607;
    float _635 = _633 + 1.0;
    float _637 = _561 * _627;
    float _639 = _567 * _627;
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _643 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _641;
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _647 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _645;
    float _649 = fma(_635, (*spvDescriptorSet0.vp_c9)._m0[143].x, _637);
    float _651 = fma(_635, (*spvDescriptorSet0.vp_c9)._m0[143].y, _639);
    float _653 = fma(_643, _569, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _655 = fma(_647, _569, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _657 = fma(_623, _621, _649);
    float _659 = fma(_625, _621, _651);
    float _661 = fma(_653, _595, _657);
    float _663 = fma(_655, _595, _659);
    float _665 = fma(_531, (*spvDescriptorSet0.vp_c9)._m0[146].x, _661);
    float _667 = fma(_531, (*spvDescriptorSet0.vp_c9)._m0[146].y, _663);
    float _669 = _665 * _629;
    float _671 = _667 * _631;
    bool _673 = !_539;
    float _691;
    if (!_673)
    {
        float _675 = in.m_70.x;
        float _677 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _679 = _675 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _681 = fma(_679, (*spvDescriptorSet0.vp_c9)._m0[11].x, _145);
        float _683 = _681 * _677;
        float _685 = floor(_683);
        float _687 = -_685;
        float _689 = _683 + _687;
        _691 = _689;
        _693 = true;
    }
    else
    {
        float _695 = float(_111);
        float _697 = 1.0 / _695;
        float _699 = _145 * _697;
        _691 = _699;
    }
    _693 = false;
    float _701 = _691;
    float _703 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _705 = _701 + _703;
    bool _707 = _701 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _709 = isnan(_701);
    bool _711 = _707 || _709;
    bool _713 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _715 = _711 || _713;
    float _717 = float(_715);
    float _719 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _721 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _719;
    bool _723 = _701 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _725 = isnan(_701);
    bool _727 = _723 || _725;
    bool _729 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _731 = _727 || _729;
    float _733 = float(_731);
    float _735 = -_717;
    float _737 = _735 + 1.0;
    float _739 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _741 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _739;
    float _743 = 1.0 / _721;
    bool _745 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _747 = _733 * _737;
    float _749 = -_733;
    float _751 = _749 + 1.0;
    float _753 = _705 * _743;
    float _755 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _757 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _755;
    float _759 = fma(_741, _753, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _761 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _763 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _761;
    float _765 = fma(_757, _753, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _767 = _759 * _747;
    float _769 = fma(_763, _753, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _771 = _765 * _747;
    float _773 = _769 * _747;
    float _775 = fma(_751, (*spvDescriptorSet0.vp_c9)._m0[107].x, _767);
    float _777 = fma(_751, (*spvDescriptorSet0.vp_c9)._m0[107].y, _773);
    float _779 = fma(_751, (*spvDescriptorSet0.vp_c9)._m0[107].z, _771);
    float _781 = fma(_717, (*spvDescriptorSet0.vp_c9)._m0[108].x, _775);
    float _783 = fma(_717, (*spvDescriptorSet0.vp_c9)._m0[108].y, _777);
    float _785 = fma(_717, (*spvDescriptorSet0.vp_c9)._m0[108].z, _779);
    bool _787 = !_745;
    float _805;
    if (!_787)
    {
        float _789 = in.m_70.x;
        float _791 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _793 = _789 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _795 = fma(_793, (*spvDescriptorSet0.vp_c9)._m0[11].y, _145);
        float _797 = _795 * _791;
        float _799 = floor(_797);
        float _801 = -_799;
        float _803 = _797 + _801;
        _805 = _803;
        _807 = true;
    }
    else
    {
        float _809 = float(_111);
        float _811 = 1.0 / _809;
        float _813 = _145 * _811;
        _805 = _813;
    }
    _807 = false;
    float _815 = _805;
    float _817 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _819 = _815 + _817;
    float _821 = _781 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _823 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _825 = _823 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _827 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _829 = _827 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _831 = _815 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _833 = isnan(_815);
    bool _835 = _831 || _833;
    bool _837 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _839 = _835 || _837;
    float _841 = float(_839);
    float _843 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _845 = _843 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _847 = _815 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _849 = isnan(_815);
    bool _851 = _847 || _849;
    bool _853 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _855 = _851 || _853;
    float _857 = float(_855);
    float _859 = 1.0 / _825;
    float _861 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _863 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _861;
    float _865 = -_841;
    float _867 = _865 + 1.0;
    bool _869 = _815 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _871 = isnan(_815);
    bool _873 = _869 || _871;
    bool _875 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _877 = _873 || _875;
    float _879 = float(_877);
    float _881 = _783 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _883 = _785 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _885 = _821 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _887 = 1.0 / _829;
    float _889 = _881 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _891 = _883 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _893 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _895 = 1.0 / _845;
    float _897 = _863 * _859;
    float _899 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _901 = _899 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _903 = _857 * _867;
    float _905 = -_857;
    float _907 = _905 + 1.0;
    float _909 = fma(_897, _819, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _911 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _913 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _911;
    float _915 = _879 * _907;
    float _917 = _901 * _887;
    float _919 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _921 = _815 + _919;
    bool _923 = _815 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _925 = isnan(_815);
    bool _927 = _923 || _925;
    bool _929 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _931 = _927 || _929;
    float _933 = float(_931);
    float _935 = _909 * _915;
    float _937 = -_879;
    float _939 = _937 + 1.0;
    float _941 = fma(_917, _921, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _943 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _945 = _815 + _943;
    float _947 = _913 * _895;
    float _949 = -_933;
    float _951 = _949 + 1.0;
    float _953 = fma(_939, (*spvDescriptorSet0.vp_c9)._m0[115].x, _935);
    float _955 = fma(_947, _945, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _957 = _841 * _951;
    float _959 = fma(_941, _903, _953);
    float _961 = fma(_955, _957, _959);
    float _963 = fma(_933, (*spvDescriptorSet0.vp_c9)._m0[118].x, _961);
    float _965 = _963 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_72.x = _885;
    out.m_72.y = _889;
    out.m_72.z = _891;
    out.m_72.w = _965;
    bool _967 = !_893;
    float _987;
    float _989;
    if (!_967)
    {
        float _969 = in.m_70.x;
        float _971 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _973 = float(_111);
        float _975 = _969 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _977 = fma(_975, (*spvDescriptorSet0.vp_c9)._m0[11].w, _145);
        float _979 = _977 * _971;
        float _981 = floor(_979);
        float _983 = -_981;
        float _985 = _979 + _983;
        _987 = _973;
        _989 = _985;
        _991 = true;
    }
    else
    {
        float _993 = float(_111);
        float _995 = 1.0 / _993;
        float _997 = _145 * _995;
        _987 = _993;
        _989 = _997;
    }
    _991 = false;
    float _999 = _987;
    float _1001 = _989;
    float _1003 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1005 = int(_1003);
    int _1007 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1009 = _1007 != 0;
    float _1011 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1013 = int(_1011);
    float _1015 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1017 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1015;
    float _1019 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1021 = 1.0 / _999;
    float _1023 = float(_1005);
    float _1025 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1027 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1029 = 1.0 / _1023;
    float _1031 = float(uint(_1013));
    bool _1033 = _1013 == 0;
    int _1035 = ~_1013;
    int _1037 = _1035 + 1;
    float _1039 = 1.0 / _1031;
    float _1041 = _145 * _1029;
    float _1043 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1045 = log2(_1043);
    int _1047 = as_type<int>(_1039) + (-2);
    float _1049 = trunc(_1041);
    int _1051 = int(_1049);
    float _1053 = _145 * _1045;
    float _1055 = exp2(_1053);
    float _1057 = float(uint(_1051));
    float _1059 = as_type<float>(_1047) * _1057;
    int _1061 = ~_1013;
    int _1063 = _1061 + 1;
    float _1065 = trunc(_1059);
    float _1067 = precise::max(_1065, 0.0);
    uint _1070 = uint(_1067);
    int _1072 = ~_1013;
    int _1074 = _1072 + 1;
    int _1076 = _1063 * int(_1070);
    int _1078 = _1076 + _1051;
    float _1080 = float(uint(_1078));
    float _1082 = as_type<float>(_1047) * _1080;
    float _1084 = in.m_70.x;
    float _1086 = in.m_70.y;
    float _1088 = in.m_70.z;
    float _1090 = in.m_70.w;
    float _1092 = trunc(_1082);
    float _1094 = precise::max(_1092, 0.0);
    uint _1096 = uint(_1094);
    int _1098 = int(_1070) + int(_1096);
    float _1100 = float(_1013);
    float _1102 = float(_1051);
    int _1104 = _1074 * _1098;
    int _1106 = _1104 + _1051;
    float _1108 = 0.0;
    if (!_1009)
    {
        _1108 = _1088;
    }
    float _1110 = _1108;
    bool _1112 = _1102 >= _1100;
    bool _1114 = isnan(_1102);
    bool _1116 = _1112 || _1114;
    bool _1118 = isnan(_1100);
    bool _1120 = _1116 || _1118;
    float _1122 = float(_1120);
    bool _1124 = !_1009;
    float _1126 = _1124 ? 7.345489978790283203125 : 1.0;
    bool _1128 = uint(_1106) >= uint(_1013);
    float _1130 = trunc(_1122);
    int _1132 = int(_1130);
    float _1134 = _1126 * _1084;
    bool _1136 = !_1128;
    int _1138 = _1136 ? 0 : (-1);
    float _1140 = _1110;
    if (_1009)
    {
        _1140 = _1086;
    }
    float _1142 = _1140;
    int _1144 = ~_1098;
    int _1146 = _1144 + _1138;
    int _1148 = _1146 + 1;
    float _1150 = floor(_1134);
    float _1152 = fma(_1142, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1025);
    int _1154 = _1013 * _1148;
    int _1156 = _1154 + _1051;
    int _1158 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1160 = _1158 != 0;
    int _1162 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1164 = _1162 != 0;
    int _1166 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1168 = _1166 != 0;
    float _1170 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1152);
    int _1172 = ~_1132;
    int _1174 = _1172 + 1;
    int _1176 = _1174 + 1;
    bool _1178 = !_1033;
    int _1180 = _1178 ? _1156 : (-1);
    bool _1182 = !_1160;
    int _1184 = _1182 ? 0 : 1;
    int _1186 = _1180 * _1176;
    float _1188 = -_1150;
    float _1190 = _1134 + _1188;
    int _1192 = _1013 + (-1);
    float _1194 = _1190 * _1100;
    float _1196 = _145 * _1100;
    int _1198 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1200 = _1198 != 0;
    float _1202 = trunc(_1194);
    int _1204 = int(_1202);
    float _1206 = _1196 * _1021;
    bool _1208 = !_1164;
    int _1210 = _1208 ? 0 : 1;
    int _1212 = _1132 * _1192;
    int _1214 = _1212 + _1186;
    bool _1216 = !_1200;
    int _1218 = _1216 ? 0 : 1;
    float _1220 = _429 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _1222 = abs(_1210);
    float _1224 = trunc(_1206);
    int _1226 = int(_1224);
    int _1228 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1230 = _1228 != 0;
    bool _1232 = !_1168;
    int _1234 = _1232 ? 0 : 1;
    int _1236 = _1214 * _1222;
    int _1238 = abs(_1184);
    int _1240 = abs(_1218);
    bool _1242 = !_1230;
    int _1244 = _1242 ? 0 : 1;
    int _1246 = abs(_1234);
    int _1248 = _1204 * _1240;
    int _1250 = _1248 + _1051;
    float _1252 = fma(_435, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1220);
    int _1254 = abs(_1244);
    int _1256 = _1226 * _1238;
    int _1258 = _1256 + _1236;
    int _1260 = ~_1013;
    int _1262 = _1260 + 1;
    int _1264 = _1250 * _1246;
    int _1266 = _1264 + _1258;
    int _1268 = ~_1013;
    int _1270 = _1268 + 1;
    bool _1272 = _1001 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1274 = isnan(_1001);
    bool _1276 = _1272 || _1274;
    bool _1278 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1280 = _1276 || _1278;
    float _1282 = float(_1280);
    int _1284 = _1204 * _1254;
    int _1286 = _1284 + _1266;
    float _1288 = _429 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1290 = float(uint(_1286));
    float _1292 = as_type<float>(_1047) * _1290;
    float _1294 = trunc(_1292);
    float _1296 = precise::max(_1294, 0.0);
    uint _1298 = uint(_1296);
    int _1300 = _1262 * int(_1298);
    int _1302 = _1300 + _1286;
    float _1304 = float(uint(_1302));
    float _1306 = as_type<float>(_1047) * _1304;
    float _1308 = trunc(_1306);
    float _1310 = precise::max(_1308, 0.0);
    uint _1312 = uint(_1310);
    int _1314 = int(_1298) + int(_1312);
    int _1316 = _1270 * _1314;
    int _1318 = _1316 + _1286;
    bool _1320 = uint(_1318) >= uint(_1013);
    float _1322 = _1084 * 2.0;
    bool _1324 = !_1320;
    int _1326 = _1324 ? 0 : (-1);
    float _1328 = floor(_1322);
    int _1330 = ~_1314;
    int _1332 = _1330 + _1326;
    int _1334 = _1332 + 1;
    float _1336 = _1086 * 2.0;
    int _1338 = _1013 * _1334;
    int _1340 = _1338 + _1286;
    float _1342 = floor(_1336);
    bool _1344 = !_1033;
    int _1346 = _1344 ? _1340 : (-1);
    int _1348 = _1346 & 3;
    bool _1350 = _1348 != 0;
    int _1352 = _1346 & 3;
    bool _1354 = _1352 != 0;
    bool _1356 = uint(_1348) > 1u;
    int _1358 = _1354 ? 0 : 1;
    bool _1360 = _1328 >= 0.0;
    bool _1362 = isnan(_1328);
    bool _1364 = _1360 || _1362;
    bool _1366 = isnan(0.0);
    bool _1368 = _1364 || _1366;
    int _1370 = ~_1358;
    int _1372 = _1370 + 1;
    int _1374 = _1372 + 1;
    bool _1376 = _1090 > 0.5;
    int _1378 = _1368 ? 0 : 1;
    int _1380 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1382 = _1380 != 0;
    int _1384 = _1374;
    float _1386 = _1252;
    if (!_1356)
    {
        int _1388 = ~_1358;
        int _1390 = _1388 + 1;
        _1384 = _1390;
    }
    int _1392 = _1384;
    bool _1394 = _1084 > 0.5;
    int _1396 = ~_1378;
    int _1398 = _1396 + 1;
    int _1400 = _1398 + 1;
    float _1402 = -_215;
    int _1404 = _1394 ? as_type<int>(_1402) : as_type<int>(_215);
    bool _1406 = _1328 > 0.0;
    float _1408 = -_225;
    int _1410 = _1376 ? as_type<int>(_1408) : as_type<int>(_225);
    bool _1412 = _1086 > 0.5;
    float _1414 = -_225;
    int _1416 = _1412 ? as_type<int>(_1414) : as_type<int>(_225);
    int _1418 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1420 = _1418 != 0;
    float _1422 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _1424 = !_1382;
    float _1426 = _1424 ? _215 : as_type<float>(_1404);
    int _1428 = _1400;
    if (!_1406)
    {
        int _1430 = ~_1378;
        int _1432 = _1430 + 1;
        _1428 = _1432;
    }
    int _1434 = _1428;
    float _1436 = _1426 + 0.5;
    bool _1438 = !_1420;
    float _1440 = _1438 ? _225 : as_type<float>(_1410);
    float _1442 = fma(_435, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1288);
    bool _1444 = _1088 > 0.5;
    float _1446 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1448 = _1446 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1450 = _1342 >= 0.0;
    bool _1452 = isnan(_1342);
    bool _1454 = _1450 || _1452;
    bool _1456 = isnan(0.0);
    bool _1458 = _1454 || _1456;
    float _1460 = -_215;
    int _1462 = _1444 ? as_type<int>(_1460) : as_type<int>(_215);
    float _1464 = 1.0 / _1448;
    int _1466 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1468 = _1466 != 0;
    int _1470 = _1458 ? 0 : 1;
    bool _1472 = !_1468;
    float _1474 = _1472 ? _225 : as_type<float>(_1416);
    int _1476 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1478 = _1476 != 0;
    bool _1480 = _1342 > 0.0;
    float _1482 = _429 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1484 = _1084 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1486 = ~_1470;
    int _1488 = _1486 + 1;
    int _1490 = _1488 + 1;
    float _1492 = fma(_457, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1252);
    float _1494 = fma(_435, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1482);
    float _1496 = _1086 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1498 = _1017 * _1464;
    bool _1500 = !_1478;
    float _1502 = _1500 ? _215 : as_type<float>(_1462);
    float _1504 = _1088 * 2.0;
    float _1506 = float(uint(_1250));
    float _1508 = -_1019;
    float _1510 = fma(_1484, 2.0, _1508);
    float _1512 = fma(_1496, -2.0, _1422);
    float _1514 = _1086 + _1084;
    float _1516 = fma(_457, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1494);
    float _1518 = as_type<float>(_1047) * _1506;
    float _1520 = fma(_457, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1442);
    int _1522 = _1490;
    float _1524 = _1442;
    if (!_1480)
    {
        int _1526 = ~_1470;
        int _1528 = _1526 + 1;
        _1522 = _1528;
    }
    int _1530 = _1522;
    float _1532 = _1086 + _1088;
    int _1534 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1536 = _1534 != 0;
    int _1538 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1540 = _1538 != 0;
    int _1542 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1544 = _1542 != 0;
    float _1546 = _1514 + (-1.0);
    float _1548 = trunc(_1518);
    float _1550 = precise::max(_1548, 0.0);
    uint _1552 = uint(_1550);
    float _1554 = _1532 + (-1.0);
    float _1556 = -_1055;
    float _1558 = _1556 + 1.0;
    if (!_1009)
    {
        _1386 = _1086;
    }
    float _1560 = _1386;
    float _1562 = -_145;
    float _1564 = fma(_1562, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1510);
    float _1566 = fma(_1546, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1568 = floor(_1504);
    float _1570 = fma(_1554, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1572 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1574 = _1001 + _1572;
    bool _1576 = _1001 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1578 = isnan(_1001);
    bool _1580 = _1576 || _1578;
    bool _1582 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1584 = _1580 || _1582;
    float _1586 = float(_1584);
    float _1588 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1590 = 1.0 + _1588;
    float _1592 = _1560;
    if (!_1009)
    {
        _1524 = _1088;
    }
    float _1594 = _1524;
    float _1596 = fma(_1498, _1574, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1598 = _1594;
    if (_1009)
    {
        _1592 = _1084;
    }
    float _1600 = _1592;
    float _1602 = -_1586;
    float _1604 = _1602 + 1.0;
    int _1606 = _1037 * int(_1552);
    int _1608 = _1606 + _1250;
    if (_1009)
    {
        _1598 = _1086;
    }
    float _1610 = _1598;
    float _1612 = 1.0 / _1590;
    float _1614 = _1282 * _1604;
    float _1616 = -_1282;
    float _1618 = _1616 + 1.0;
    float _1620 = float(uint(_1608));
    float _1622 = _1596 * _1614;
    bool _1624 = _1568 >= 0.0;
    bool _1626 = isnan(_1568);
    bool _1628 = _1624 || _1626;
    bool _1630 = isnan(0.0);
    bool _1632 = _1628 || _1630;
    float _1634 = fma(_1436, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1564);
    float _1636 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1638 = as_type<float>(_1047) * _1620;
    int _1640 = _1632 ? 0 : 1;
    float _1642 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _1644 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1646 = isnan(0.0);
    bool _1648 = _1644 || _1646;
    bool _1650 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1652 = _1648 || _1650;
    float _1654 = fma(_1600, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1636);
    float _1656 = _1600 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _1658 = _1346 >> 31;
    float _1660 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1512);
    float _1662 = _1652 ? _1558 : 0.0;
    float _1664 = _1474 + (-0.5);
    bool _1666 = _1568 > 0.0;
    float _1668 = trunc(_1638);
    float _1670 = precise::max(_1668, 0.0);
    uint _1672 = uint(_1670);
    float _1674 = _1662 * _1612;
    int _1676 = _1658 & 3;
    float _1678 = _1610 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1680 = -_1027;
    float _1682 = fma(_1656, 2.0, _1680);
    float _1684 = -_1664;
    float _1686 = -_1660;
    float _1688 = fma(_1684, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1686);
    int _1690 = _1346 + _1676;
    float _1692 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1694 = fma(_1618, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1622);
    float _1696 = _1502 + 0.5;
    int _1698 = _1690 >> 2;
    float _1700 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1702 = -_145;
    float _1704 = fma(_1702, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1682);
    int _1706 = ~_1013;
    int _1708 = _1706 + 1;
    float _1710 = _1642 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _1712 = _1698 << 4;
    int _1714 = _1712 + 368;
    float _1716 = fma(_1678, -2.0, _1700);
    int _1718 = int(_1552) + int(_1672);
    float _1720 = _1440 + (-0.5);
    int _1722 = ~_1640;
    int _1724 = _1722 + 1;
    int _1726 = _1724 + 1;
    float _1728 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1716);
    int _1730 = _1726;
    if (!_1666)
    {
        int _1732 = ~_1640;
        int _1734 = _1732 + 1;
        _1730 = _1734;
    }
    int _1736 = _1730;
    float _1738 = _1520 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1740 = _1692 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1742 = -_1710;
    float _1744 = -_1728;
    float _1746 = fma(_1742, _1720, _1744);
    bool _1748 = !_1540;
    int _1750 = _1748 ? 0 : 1;
    float _1752 = _1516 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1754 = fma(_1740, _1696, _1704);
    int _1756 = _1708 * _1718;
    int _1758 = _1756 + _1250;
    uint _1760 = uint(int(uint(_1714) >> uint(2)));
    uint _1762 = uint(int(uint(int(_1760)) >> uint(2)));
    int _1764 = int(_1760) & 3;
    float _1766 = (*spvDescriptorSet0.vp_c9)._m0[int(_1762)][_1764];
    int _1768 = int(_1760) + 1;
    uint _1770 = uint(int(uint(_1768) >> uint(2)));
    int _1772 = _1768 & 3;
    float _1774 = (*spvDescriptorSet0.vp_c9)._m0[int(_1770)][_1772];
    bool _1776 = !_1536;
    int _1778 = _1776 ? 0 : 1;
    float _1780 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1782 = _1738 + _1780;
    int _1784 = abs(_1750);
    float _1786 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1788 = _1752 + _1786;
    bool _1790 = uint(_1758) >= uint(_1013);
    float _1792 = fma(_1586, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1694);
    int _1794 = abs(_1778);
    int _1796 = _1714 + 8;
    uint _1798 = uint(int(uint(_1796) >> uint(2)));
    uint _1800 = uint(int(uint(int(_1798)) >> uint(2)));
    int _1802 = int(_1798) & 3;
    float _1804 = (*spvDescriptorSet0.vp_c9)._m0[int(_1800)][_1802];
    int _1806 = int(_1798) + 1;
    uint _1808 = uint(int(uint(_1806) >> uint(2)));
    int _1810 = _1806 & 3;
    float _1812 = (*spvDescriptorSet0.vp_c9)._m0[int(_1808)][_1810];
    bool _1814 = !_1790;
    int _1816 = _1814 ? 0 : (-1);
    float _1818 = _1782 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _1820 = uint(_1348) >= 2u;
    float _1822 = _1492 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1824 = float(_1434);
    float _1826 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1818);
    int _1828 = _1820 ? 0 : 1;
    float _1830 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1832 = _1822 + _1830;
    bool _1834 = _1348 != 3;
    float _1836 = _1792 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1838 = float(_1794);
    float _1840 = fma(_1832, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1826);
    float _1842 = float(_1736);
    float _1844 = float(_1784);
    out.m_74.w = _1836;
    int _1846 = ~_1828;
    int _1848 = _1846 + 1;
    int _1850 = _1848 + 1;
    float _1852 = _1838 * _1842;
    int _1854 = abs(_1392);
    float _1856 = _1844 * _1824;
    int _1858 = ~_1718;
    int _1860 = _1858 + _1816;
    int _1862 = _1860 + 1;
    int _1864 = _1850;
    int _1866 = as_type<int>(_1782);
    if (_1834)
    {
        int _1868 = ~_1828;
        int _1870 = _1868 + 1;
        _1864 = _1870;
    }
    int _1872 = _1864;
    int _1874 = _1013 * _1862;
    int _1876 = _1874 + _1250;
    bool _1878 = !_1350;
    int _1880 = _1878 ? 0 : 1;
    float _1882 = _1852 * (-2.0);
    float _1884 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1886 = _1348 != 3;
    float _1888 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1890 = abs(_1880);
    float _1892 = fma(_1084, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1884);
    int _1894 = abs(_1872);
    float _1896 = fma(_1086, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1888);
    int _1898 = ~_1854;
    int _1900 = _1898 + 1;
    int _1902 = _1900 + 1;
    float _1904 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1892);
    int _1906 = ~_1890;
    int _1908 = _1906 + 1;
    int _1910 = _1908 + 1;
    float _1912 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1896);
    int _1914 = _1902 * as_type<int>(_1774);
    int _1916 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1918 = _1916 != 0;
    float _1920 = -_1912;
    float _1922 = _1920 + 1.0;
    int _1924 = ~_1894;
    int _1926 = _1924 + 1;
    int _1928 = _1926 + 1;
    int _1930 = _1910 * as_type<int>(_1766);
    int _1932 = _1930 + _1914;
    float _1934 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1654);
    float _1936 = fma(_1474, _1922, _1688);
    float _1938 = _1782 * _1782;
    int _1940 = _1928 * as_type<int>(_1804);
    int _1942 = _1940 + _1932;
    float _1944 = -_1934;
    float _1946 = _1944 + 1.0;
    bool _1948 = !_1886;
    int _1950 = _1948 ? 0 : (-1);
    float _1952 = -_1904;
    float _1954 = _1952 + 1.0;
    bool _1956 = !_1918;
    int _1958 = _1956 ? 0 : 1;
    float _1960 = -_1946;
    float _1962 = fma(_1502, _1960, _1754);
    int _1964 = abs(_1950);
    float _1966 = fma(_1788, _1788, _1938);
    float _1968 = -_1954;
    float _1970 = fma(_1426, _1968, _1634);
    int _1972 = abs(_1958);
    float _1974 = in.m_76.x;
    float _1976 = in.m_76.y;
    float _1978 = in.m_76.z;
    float _1980 = -_1170;
    float _1982 = _1980 + 1.0;
    float _1984 = fma(_1832, _1832, _1966);
    bool _1986 = _1840 >= 0.0;
    float _1988 = fma(_1440, _1982, _1746);
    int _1990 = ~_1964;
    int _1992 = _1990 + 1;
    int _1994 = _1992 + 1;
    float _1996 = rsqrt(_1984);
    float _1998 = fma(_1566, _1882, _1566);
    bool _2000 = !_1033;
    int _2002 = _2000 ? _1876 : (-1);
    int _2004 = _1994 * as_type<int>(_1812);
    int _2006 = _2004 + _1942;
    int _2008 = ~_1972;
    int _2010 = _2008 + 1;
    int _2012 = _2010 + 1;
    out.m_78.x = _1970;
    out.m_78.y = _1936;
    out.m_78.z = _1962;
    out.m_78.w = _1988;
    bool _2014 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2016 = isnan(1.0);
    bool _2018 = _2014 || _2016;
    bool _2020 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2022 = _2018 || _2020;
    int _2024 = _2006 * _2012;
    float _2026 = _1856 * (-2.0);
    float _2028 = _1962;
    if (_1986)
    {
        out.m_61.x = 0.0;
    }
    int _2030 = _2002 * _1972;
    int _2032 = _2030 + _2024;
    float _2034 = _1782 * _1996;
    float _2036 = fma(_1882, _1974, _1974);
    float _2038 = _1788 * _1996;
    if (_1986)
    {
        _2028 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2040 = _2028;
    float _2042 = -_2034;
    float _2044 = fma(_2042, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1782);
    float _2046 = _1084 + (-0.5);
    float _2048 = -_2038;
    float _2050 = fma(_2048, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1788);
    float _2052 = fma(_1570, _2026, _1570);
    if (_1986)
    {
        float _2054 = _2040 * 5.0;
        _1866 = as_type<int>(_2054);
    }
    int _2056 = _1866;
    float _2058 = _2044 * _2044;
    float _2060 = float(_2032);
    float _2062 = fma(_2046, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2036);
    float _2064 = fma(_2026, _1976, _1976);
    if (_1986)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7418 = as_type<float>(_2056);
        out.gl_Position.z = _7418;
    }
    float _2066 = fma(_2050, _2050, _2058);
    bool _2068 = !_1544;
    int _2070 = _2068 ? 0 : 1;
    out.m_80.x = _2060;
    if (_1986)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2072 = -_2034;
    float _2074 = fma(_2072, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1738);
    float _2076 = _1832 * _1996;
    bool _2078 = !_2022;
    float _2080 = _2078 ? _145 : _1674;
    float _2082 = -_2038;
    float _2084 = fma(_2082, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1752);
    float _2086 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2088 = _2074 + _2086;
    float _2090 = -_2076;
    float _2092 = fma(_2090, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1832);
    float _2094 = -_2076;
    float _2096 = fma(_2094, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1822);
    float _2098 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2100 = _2084 + _2098;
    float _2102 = _2088 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2104 = fma(_2092, _2092, _2066);
    float _2106 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2108 = _2096 + _2106;
    int _2110 = abs(_2070);
    float _2112 = fma(_2100, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2102);
    float _2114 = float(_1530);
    float _2116 = _1086 + (-0.5);
    float _2118 = _1088 + _1084;
    float _2120 = fma(_2108, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2112);
    float _2122 = float(_2110);
    float _2124 = fma(_2116, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2064);
    float _2126 = fma(_2080, _1998, _2062);
    float _2128 = _1088 + (-0.5);
    bool _2130 = _2120 >= 0.0;
    float _2132 = _2122 * _2114;
    float _2134 = fma(_2080, _2052, _2124);
    float _2136 = _2118 + (-1.0);
    float _2138 = _2126 * 0.15915493667125701904296875;
    float _2140 = _2132 * (-2.0);
    float _2142 = sqrt(_2104);
    float _2144 = fma(_2136, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2146 = fma(_2140, _1978, _1978);
    float _2148 = _2134 * 0.15915493667125701904296875;
    float _2150 = fma(_2144, _2140, _2144);
    float _2152 = _2114;
    int _2154 = as_type<int>(_2128);
    float _2156 = _2088;
    float _2158 = _2100;
    if (_2130)
    {
        _2152 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2160 = _2152;
    float _2162 = fma(_2128, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2146);
    float _2164 = _2138 * 6.283185482025146484375;
    float _2166 = sin(_2164);
    if (_2130)
    {
        out.m_61.x = 0.0;
    }
    if (_2130)
    {
        float _2168 = _2160 * 5.0;
        _2154 = as_type<int>(_2168);
    }
    int _2170 = _2154;
    float _2172 = fma(_2080, _2150, _2162);
    float _2174 = _2138 * 6.283185482025146484375;
    float _2176 = cos(_2174);
    if (_2130)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7609 = as_type<float>(_2170);
        out.gl_Position.z = _7609;
    }
    float _2178 = _2172 * 0.15915493667125701904296875;
    float _2180 = _2148 * 6.283185482025146484375;
    float _2182 = sin(_2180);
    float _2184 = _2148 * 6.283185482025146484375;
    float _2186 = cos(_2184);
    if (_2130)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2188 = _2178 * 6.283185482025146484375;
    float _2190 = cos(_2188);
    float _2192 = _1996 * _2142;
    float _2194 = _671 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2196 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _225);
    float _2198 = _669 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2200 = _2176 * _2182;
    float _2202 = _2192 * _2194;
    float _2204 = _2166 * _2182;
    float _2206 = _2178 * 6.283185482025146484375;
    float _2208 = sin(_2206);
    float _2210 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _215);
    float _2212 = _2196 * _2202;
    float _2214 = _2176 * _2186;
    float _2216 = _2192 * _2198;
    float _2218 = _2166 * _2186;
    float _2220 = _2176 * _2190;
    float _2222 = _2210 * _2216;
    float _2224 = _2166 * _2190;
    float _2226 = _2186 * _2190;
    float _2228 = _2220 * _2212;
    float _2230 = _2182 * _2190;
    float _2232 = _2192 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2234 = _2232 * 0.5;
    float _2236 = _2220 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2238 = fma(_2208, _2214, _2204);
    float _2240 = -_2218;
    float _2242 = fma(_2208, _2200, _2240);
    float _2244 = -_2212;
    float _2246 = _2208 * _2244;
    float _2248 = -_2200;
    float _2250 = fma(_2208, _2218, _2248);
    float _2252 = fma(_2238, _2222, _2228);
    float _2254 = _2224 * _2212;
    float _2256 = fma(_2226, _2222, _2246);
    float _2258 = fma(_2208, _2204, _2214);
    float _2260 = fma(_2242, _2234, _2252);
    float _2262 = fma(_2250, _2222, _2254);
    float _2264 = fma(_2230, _2234, _2256);
    float _2266 = _2238 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2268 = _2260 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2270 = _2260 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2272 = fma(_2258, _2234, _2262);
    float _2274 = _2238 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2276 = fma(_2264, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2268);
    float _2278 = fma(_2264, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2270);
    float _2280 = _2238 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2282 = _2260 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2284 = fma(_2272, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2276);
    float _2286 = fma(_2272, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2278);
    float _2288 = fma(_2226, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2266);
    float _2290 = fma(_2226, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2274);
    float _2292 = _2284 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2294 = _2286 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2296 = fma(_2226, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2280);
    float _2298 = _2220 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2300 = _1752 + _2292;
    float _2302 = _1822 + _2294;
    float _2304 = _2220 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2306 = fma(_2264, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2282);
    float _2308 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2310 = _2300 + _2308;
    float _2312 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2314 = _2302 + _2312;
    float _2316 = -_2208;
    float _2318 = fma(_2316, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2298);
    float _2320 = -_2208;
    float _2322 = fma(_2320, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2304);
    float _2324 = _2310 * _2310;
    float _2326 = _2314 * _2314;
    float _2328 = fma(_2272, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2306);
    float _2330 = -_2208;
    float _2332 = fma(_2330, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2236);
    float _2334 = fma(_2250, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2288);
    float _2336 = _2324 + _2326;
    float _2338 = _2242 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2340 = _2242 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2342 = _2242 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2344 = sqrt(_2336);
    float _2346 = _2328 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2348 = fma(_2250, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2290);
    float _2350 = fma(_2230, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2338);
    float _2352 = fma(_2230, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2340);
    float _2354 = fma(_2230, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2342);
    float _2356 = fma(_2250, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2296);
    float _2358 = _1738 + _2346;
    bool _2360 = _2344 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _2362 = !_2360;
    float _2364 = _2358;
    float _2366 = _2324;
    float _2368 = _2326;
    float _2370 = _2300;
    float _2372 = _2302;
    float _2374 = _2242;
    float _2376 = _2258;
    if (!_2362)
    {
        float _2378 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2380 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2382 = _2344 + _2380;
        float _2384 = _2358 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2386 = rsqrt(_2336);
        float _2388 = _2382 * _2378;
        float _2390 = _2388 * 0.15915493667125701904296875;
        float _2392 = _2390 * 6.283185482025146484375;
        float _2394 = sin(_2392);
        float _2396 = _2390 * 6.283185482025146484375;
        float _2398 = cos(_2396);
        float _2400 = fma(_2394, _2384, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2402 = _2386 * _2400;
        float _2404 = _2398 + (-1.0);
        float _2406 = fma(_2310, _2402, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2408 = fma(_2314, _2402, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2410 = _2404 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2412 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2414 = _2406 + _2412;
        float _2416 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2418 = _2408 + _2416;
        float _2420 = fma(_2358, _2398, _2410);
        float _2422 = _2414 * _2414;
        float _2424 = _2418 * _2418;
        _2364 = _2420;
        _2366 = _2422;
        _2368 = _2424;
        _2370 = _2406;
        _2372 = _2408;
        _2374 = _2390;
    }
    float _2426 = _2364;
    float _2428 = _2366;
    float _2430 = _2368;
    float _2432 = _2370;
    float _2434 = _2372;
    float _2436 = _2374;
    float _2438 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2440 = _2426 + _2438;
    float _2442 = fma(_2224, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2318);
    float _2444 = fma(_2224, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2322);
    float _2446 = _225 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2448 = fma(_2440, _2440, _2428);
    float _2450 = fma(_2224, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2332);
    float _2452 = _215 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2454 = _2446 * _2442;
    float _2456 = _2448 + _2430;
    float _2458 = _2446 * _2444;
    float _2460 = _2446 * _2450;
    float _2462 = fma(_2258, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2350);
    float _2464 = fma(_2258, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2352);
    float _2466 = fma(_2258, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2354);
    float _2468 = sqrt(_2456);
    float _2470 = fma(_2452, _2334, _2454);
    float _2472 = fma(_2452, _2348, _2458);
    float _2474 = fma(_2452, _2356, _2460);
    float _2476 = _2462 + _2470;
    float _2478 = _2464 + _2472;
    float _2480 = _2466 + _2474;
    out.m_82.x = _2476;
    out.m_82.y = _2478;
    out.m_82.z = _2480;
    bool _2482 = _2468 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2484 = isnan(_2468);
    bool _2486 = _2482 || _2484;
    bool _2488 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2490 = _2486 || _2488;
    float _2492 = _2436;
    float _2494 = _2474;
    if (!_2490)
    {
        _2376 = 1.0;
    }
    float _2496 = _2376;
    bool _2498 = !_2490;
    float _2500 = _2496;
    if (!_2498)
    {
        bool _2502 = _2468 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2504 = isnan(_2468);
        bool _2506 = _2502 || _2504;
        bool _2508 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2510 = _2506 || _2508;
        if (!_2510)
        {
            float _2512 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2514 = _2468 + _2512;
            float _2516 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2518 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2516;
            float _2520 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2522 = _2520 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2524 = 1.0 / _2518;
            float _2526 = _2514 * _2524;
            float _2528 = fma(_2526, _2522, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2500 = _2528;
            _2530 = true;
        }
        else
        {
            bool _2532 = _2468 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2534 = isnan(_2468);
            bool _2536 = _2532 || _2534;
            bool _2538 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2540 = _2536 || _2538;
            if (!_2540)
            {
                float _2542 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2544 = _2468 + _2542;
                float _2546 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2548 = _2546 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2550 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2552 = _2550 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2554 = 1.0 / _2548;
                float _2556 = _2544 * _2554;
                float _2558 = fma(_2556, _2552, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2500 = _2558;
                _2530 = true;
            }
            else
            {
                _2500 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2530 = false;
    float _2560 = _2500;
    float _2562 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2564 = _2426 + _2562;
    float _2566 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2568 = _2432 + _2566;
    float _2570 = fma(_2564, _2560, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2572 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2574 = _2434 + _2572;
    float _2576 = fma(_2568, _2560, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2578 = -_1738;
    float _2580 = _2578 + _2570;
    float _2582 = fma(_2574, _2560, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2584 = -_1752;
    float _2586 = _2584 + _2576;
    float _2588 = _2580 * _2580;
    float _2590 = -_1822;
    float _2592 = _2590 + _2582;
    float _2594 = fma(_2586, _2586, _2588);
    float _2596 = fma(_2592, _2592, _2594);
    float _2598 = sqrt(_2596);
    bool _2600 = _2598 > 0.0;
    bool _2602 = !_2600;
    float _2604 = _2576;
    float _2606 = _2570;
    float _2608 = _2582;
    if (!_2602)
    {
        bool _2610 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2612 = _2598;
        if (_2610)
        {
            float _2614 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2612 = _2614;
        }
        float _2616 = _2612;
        float _2618 = _2616;
        if (_2610)
        {
            float _2620 = _459 * _2616;
            _2492 = _2620;
        }
        float _2622 = _2492;
        float _2624 = _2622;
        if (_2610)
        {
            float _2626 = _461 * _2616;
            _2494 = _2626;
        }
        float _2628 = _2494;
        float _2630 = _2628;
        if (_2610)
        {
            float _2632 = _463 * _2616;
            _2618 = _2632;
        }
        float _2634 = _2618;
        float _2636 = _2634;
        if (!_2610)
        {
            float _2638 = _145 + 1.0;
            if (!_181)
            {
                float _2640 = _2638 * _2638;
                float _2642 = _2640 * 0.5;
                _147 = _2642;
            }
            float _2644 = _147;
            float _2646 = _2644;
            if (!_181)
            {
                float _2648 = _2644 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2646 = _2648;
            }
            float _2650 = _2646;
            bool _2652 = !_181;
            float _2654 = _2650;
            if (!_2652)
            {
                float _2656 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2658 = log2(_2656);
                float _2660 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2662 = _2660 + 1.0;
                float _2664 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2666 = _2658 * _2638;
                float _2668 = exp2(_2666);
                float _2670 = _2664 * 0.693147182464599609375;
                float _2672 = 1.0 / _2670;
                float _2674 = 1.0 / _2662;
                float _2676 = _2668 + (-1.0);
                float _2678 = -_2676;
                float _2680 = fma(_2678, _2672, _2638);
                float _2682 = _2680 * _2674;
                float _2684 = _2682 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2654 = _2684;
            }
            float _2686 = _2654;
            float _2688 = _2686 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _2690 = _2686 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2692 = _2686 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2694 = _2688 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
            float _2696 = _2688 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
            float _2698 = fma(_2690, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2694);
            float _2700 = _2688 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
            float _2702 = fma(_2690, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2696);
            float _2704 = _2696;
            if (!_181)
            {
                _2704 = _2638;
            }
            float _2706 = _2704;
            float _2708 = fma(_2692, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2698);
            bool _2710 = !_181;
            float _2712 = _2706;
            if (!_2710)
            {
                float _2714 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2716 = log2(_2714);
                float _2718 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2720 = _2718 + 1.0;
                float _2722 = 1.0 / _2720;
                float _2724 = _2716 * _2638;
                float _2726 = exp2(_2724);
                float _2728 = -_2726;
                float _2730 = _2728 + 1.0;
                float _2732 = _2730 * _2722;
                _2712 = _2732;
            }
            float _2734 = _2712;
            float _2736 = fma(_2692, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2702);
            float _2738 = fma(_2734, _185, _2708);
            float _2740 = fma(_2690, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2700);
            float _2742 = fma(_2734, _183, _2736);
            float _2744 = -_421;
            float _2746 = _2744 + _2738;
            float _2748 = fma(_2692, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2740);
            float _2750 = -_423;
            float _2752 = _2750 + _2742;
            float _2754 = _2746 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _2756 = _2746 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _2758 = fma(_2734, _187, _2748);
            float _2760 = _2746 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _2762 = fma(_2752, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2754);
            float _2764 = fma(_2752, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2756);
            float _2766 = -_425;
            float _2768 = _2766 + _2758;
            float _2770 = fma(_2752, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2760);
            float _2772 = fma(_2768, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2762);
            float _2774 = fma(_2768, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2764);
            float _2776 = fma(_2768, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2770);
            _467 = _2774;
            _469 = _2772;
            _471 = _2776;
            _2624 = _2772;
            _2630 = _2774;
            _2636 = _2776;
        }
        float _2778 = _467;
        float _2780 = _469;
        float _2782 = _471;
        float _2784 = _2624;
        float _2786 = _2630;
        float _2788 = _2636;
        float _2790 = _2778 * _2778;
        float _2792 = fma(_2780, _2780, _2790);
        float _2794 = fma(_2782, _2782, _2792);
        float _2796 = rsqrt(_2596);
        float _2798 = sqrt(_2794);
        float _2800 = _2586 * _2796;
        float _2802 = _2580 * _2796;
        float _2804 = _2592 * _2796;
        bool _2806 = _2798 > 0.0;
        bool _2808 = !_2806;
        if (!_2808)
        {
            float _2810 = rsqrt(_2794);
            float _2812 = _2810 * _2778;
            float _2814 = _2810 * _2780;
            float _2816 = _2810 * _2782;
            float _2818 = _2802 * _2812;
            float _2820 = fma(_2800, _2814, _2818);
            float _2822 = fma(_2804, _2816, _2820);
            float _2824 = _2822 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2826 = fma(_2784, _2824, _2576);
            float _2828 = fma(_2786, _2824, _2570);
            float _2830 = fma(_2788, _2824, _2582);
            _2604 = _2826;
            _2606 = _2828;
            _2608 = _2830;
        }
    }
    float _2832 = _2604;
    float _2834 = _2606;
    float _2836 = _2608;
    float _2838 = fma(_2084, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2840 = fma(_2096, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2842 = floor(_2838);
    float _2844 = floor(_2840);
    float _2846 = -_2842;
    float _2848 = _2838 + _2846;
    float _2850 = -_2844;
    float _2852 = _2840 + _2850;
    float2 _8736 = float2(_2848, _2852);
    float _2854 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8736, float2(0.0), isnan(_8736)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8736, float2(0.0), isnan(_8736)), level(0.0)).x;
    float _2856 = _2074 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2858 = -_2038;
    float _2860 = fma(_2858, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2832);
    float _2862 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2856);
    float _2864 = -_2034;
    float _2866 = fma(_2864, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2834);
    float _2868 = fma(_2096, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2862);
    float _2870 = _2074 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2872 = _2868 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2874 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2870);
    float _2876 = 1.0 / _2872;
    float _2878 = fma(_2096, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2874);
    float _2880 = _2878 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2882 = _2880 + _2872;
    float _2884 = _2882 * _2876;
    float _2886 = _2884 * 0.5;
    float _2888 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2890 = fma(_2886, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2888);
    float _2892 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _2894 = _2074 + _2892;
    float _2896 = 1.0 / _2890;
    float _2898 = _2894 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _2900 = _2894 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2902 = fma(_2084, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2898);
    float _2904 = fma(_2084, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2900);
    float _2906 = fma(_2096, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2902);
    float _2908 = fma(_2096, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2904);
    float _2910 = _2906 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _2912 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2914 = _2896 * _2912;
    float _2916 = _2908 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _2918 = trunc(_2910);
    int _2920 = int(_2918);
    bool _2922 = _2914 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _2924 = _2914 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _2926 = !_2922;
    int _2928 = _2926 ? 0 : 1;
    float _2930 = trunc(_2916);
    int _2932 = int(_2930);
    int _2934 = 2;
    float _2936 = _2866;
    float _2938 = _2860;
    float _2940 = _2834;
    float _2942 = _2910;
    float _2944 = _2916;
    float _2946 = _2894;
    if (!_2922)
    {
        _2934 = 1;
    }
    int _2948 = _2934;
    int _2950 = _2948;
    if (!_2924)
    {
        _2950 = _2928;
    }
    int _2952 = _2950;
    int _2954 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2956 = _2920 + _2954;
    int _2958 = _2956 + 1;
    int _2960 = _2952 << 6;
    bool _2962 = _2958 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _2964 = _2960 + 48;
    uint _2966 = uint(int(uint(_2964) >> uint(2)));
    uint _2968 = uint(int(uint(int(_2966)) >> uint(2)));
    int _2970 = int(_2966) & 3;
    float _2972 = (*spvDescriptorSet0.vp_c15)._m0[int(_2968)][_2970];
    int _2974 = int(_2966) + 1;
    uint _2976 = uint(int(uint(_2974) >> uint(2)));
    int _2978 = _2974 & 3;
    float _2980 = (*spvDescriptorSet0.vp_c15)._m0[int(_2976)][_2978];
    int _2982 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2984 = _2932 + _2982;
    int _2986 = _2984 + 1;
    int _2988 = _2958 | _2986;
    int _2990 = _2960 + 56;
    uint _2992 = uint(int(uint(_2990) >> uint(2)));
    uint _2994 = uint(int(uint(int(_2992)) >> uint(2)));
    int _2996 = int(_2992) & 3;
    float _2998 = (*spvDescriptorSet0.vp_c15)._m0[int(_2994)][_2996];
    int _3000 = int(_2992) + 1;
    uint _3002 = uint(int(uint(_3000) >> uint(2)));
    int _3004 = _3000 & 3;
    float _3006 = (*spvDescriptorSet0.vp_c15)._m0[int(_3002)][_3004];
    bool _3008 = _2988 < 0;
    bool _3010 = _3008 || _2962;
    bool _3012 = _2986 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _3014 = _3012 || _3010;
    bool _3016 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _3018 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _3020 = _3016 || _3018;
    bool _3022 = isnan(0.5);
    bool _3024 = _3020 || _3022;
    int _3026 = _2960 + 64;
    uint _3028 = uint(int(uint(_3026) >> uint(2)));
    uint _3030 = uint(int(uint(int(_3028)) >> uint(2)));
    int _3032 = int(_3028) & 3;
    float _3034 = (*spvDescriptorSet0.vp_c15)._m0[int(_3030)][_3032];
    int _3036 = int(_3028) + 1;
    uint _3038 = uint(int(uint(_3036) >> uint(2)));
    int _3040 = _3036 & 3;
    float _3042 = (*spvDescriptorSet0.vp_c15)._m0[int(_3038)][_3040];
    float _3044 = -_2076;
    float _3046 = fma(_3044, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2836);
    int _3048 = _2960 + 72;
    uint _3050 = uint(int(uint(_3048) >> uint(2)));
    uint _3052 = uint(int(uint(int(_3050)) >> uint(2)));
    int _3054 = int(_3050) & 3;
    float _3056 = (*spvDescriptorSet0.vp_c15)._m0[int(_3052)][_3054];
    int _3058 = int(_3050) + 1;
    uint _3060 = uint(int(uint(_3058) >> uint(2)));
    int _3062 = _3058 & 3;
    float _3064 = (*spvDescriptorSet0.vp_c15)._m0[int(_3060)][_3062];
    int _3066 = _2986;
    float _3068 = _3046;
    float _3070 = as_type<float>(_2952);
    if (!_3014)
    {
        int _3072 = _2986 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _3074 = _3072 + _2958;
        _3066 = _3074;
    }
    int _3076 = _3066;
    int _3078 = _2960 + 96;
    uint _3080 = uint(int(uint(_3078) >> uint(2)));
    uint _3082 = uint(int(uint(int(_3080)) >> uint(2)));
    int _3084 = int(_3080) & 3;
    float _3086 = (*spvDescriptorSet0.vp_c15)._m0[int(_3082)][_3084];
    int _3088 = int(_3080) + 1;
    uint _3090 = uint(int(uint(_3088) >> uint(2)));
    int _3092 = _3088 & 3;
    float _3094 = (*spvDescriptorSet0.vp_c15)._m0[int(_3090)][_3092];
    int _3096 = _2960 + 104;
    uint _3098 = uint(int(uint(_3096) >> uint(2)));
    uint _3100 = uint(int(uint(int(_3098)) >> uint(2)));
    int _3102 = int(_3098) & 3;
    float _3104 = (*spvDescriptorSet0.vp_c15)._m0[int(_3100)][_3102];
    int _3106 = int(_3098) + 1;
    uint _3108 = uint(int(uint(_3106) >> uint(2)));
    int _3110 = _3106 & 3;
    float _3112 = (*spvDescriptorSet0.vp_c15)._m0[int(_3108)][_3110];
    int _3114 = as_type<int>(_3094);
    int _3116 = as_type<int>(_3086);
    if (!_3024)
    {
        float _3118 = _2088 * _2088;
        float _3120 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3122 = -_1822;
        float _3124 = _3122 + _2836;
        float _3126 = fma(_2100, _2100, _3118);
        float _3128 = fma(_2108, _2108, _3126);
        float _3130 = 1.0 / _2192;
        float _3132 = sqrt(_3128);
        float _3134 = precise::min(_3132, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3136 = _3134 * _3120;
        float _3138 = -_1738;
        float _3140 = _3138 + _2834;
        float _3142 = _3136 * _3130;
        float _3144 = -_1752;
        float _3146 = _3144 + _2832;
        float _3148 = fma(_3140, _3142, _2074);
        float _3150 = fma(_3146, _3142, _2084);
        float _3152 = fma(_3124, _3142, _2096);
        _2936 = _3148;
        _2938 = _3150;
        _3068 = _3152;
        _2156 = _3118;
        _2158 = _3132;
    }
    float _3154 = _2936;
    float _3156 = _2938;
    float _3158 = _3068;
    float _3160 = _2156;
    float _3162 = _2158;
    float _3164 = _2894 * _3094;
    float _3166 = _3160;
    float _3168 = _3162;
    if (!_3014)
    {
        int _3170 = _3076 << 2;
        _3114 = _3170;
    }
    int _3172 = _3114;
    float _3174 = _3154 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3176 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3178 = fma(_2084, _3086, _3164);
    int _3180 = _3172;
    if (!_3014)
    {
        uint _3182 = uint(int(uint(_3076) >> uint(2)));
        _3116 = int(_3182);
    }
    int _3184 = _3116;
    float _3186 = fma(_3156, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3174);
    if (!_3014)
    {
        int _3188 = 12 & _3172;
        _3180 = _3188;
    }
    int _3190 = _3180;
    float _3192 = fma(_2096, _3104, _3178);
    float _3194 = fma(_3158, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3186);
    if (!_3014)
    {
        int _3196 = _3184 << 4;
        int _3198 = _3196 + _3190;
        _2940 = as_type<float>(_3198);
    }
    float _3200 = _2940;
    float _3202 = _3192 + _3112;
    int _3204 = _2960 + 80;
    uint _3206 = uint(int(uint(_3204) >> uint(2)));
    uint _3208 = uint(int(uint(int(_3206)) >> uint(2)));
    int _3210 = int(_3206) & 3;
    float _3212 = (*spvDescriptorSet0.vp_c15)._m0[int(_3208)][_3210];
    int _3214 = int(_3206) + 1;
    uint _3216 = uint(int(uint(_3214) >> uint(2)));
    int _3218 = _3214 & 3;
    float _3220 = (*spvDescriptorSet0.vp_c15)._m0[int(_3216)][_3218];
    float _3222 = _2894 * _2980;
    float _3224 = _2894 * _3042;
    float _3226 = _3194 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3228 = 1.0 / _3202;
    float _3230 = fma(_2084, _2972, _3222);
    float _3232 = fma(_2084, _3034, _3224);
    float _3234 = _3226 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3236 = _3200;
    if (!_3014)
    {
        int _3238 = as_type<int>(_3200) + 400;
        uint _3240 = uint(int(uint(_3238) >> uint(2)));
        uint _3242 = uint(int(uint(int(_3240)) >> uint(2)));
        int _3244 = int(_3240) & 3;
        float _3246 = (*spvDescriptorSet0.vp_c15)._m0[int(_3242)][_3244];
        _3236 = _3246;
    }
    float _3248 = _3236;
    float _3250 = _3154 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3252 = fma(_2096, _2998, _3230);
    float _3254 = -_3234;
    float _3256 = fma(_3254, _3176, 1.0);
    float _3258 = _3154 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3260 = fma(_3156, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3250);
    float _3262 = _3252 + _3006;
    float _3264 = fma(_2096, _3056, _3232);
    int _3266 = _2960 + 88;
    uint _3268 = uint(int(uint(_3266) >> uint(2)));
    uint _3270 = uint(int(uint(int(_3268)) >> uint(2)));
    int _3272 = int(_3268) & 3;
    float _3274 = (*spvDescriptorSet0.vp_c15)._m0[int(_3270)][_3272];
    int _3276 = int(_3268) + 1;
    uint _3278 = uint(int(uint(_3276) >> uint(2)));
    int _3280 = _3276 & 3;
    float _3282 = (*spvDescriptorSet0.vp_c15)._m0[int(_3278)][_3280];
    float _3284 = fma(_3156, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3258);
    float _3286 = fma(_3158, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3260);
    float _3288 = _3264 + _3064;
    float _3290 = _3262 * _3228;
    float _3292 = fma(_3158, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3284);
    float _3294 = _3154 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3296 = _3288 * _3228;
    float _3298 = _3286 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    bool _3300 = _3290 >= 0.0;
    float _3302 = _3292 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3304 = fma(_3156, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3294);
    float _3306 = log2(_3256);
    bool _3308 = _3290 <= 1.0;
    bool _3310 = _3308 && _3300;
    float _3312 = _3302 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3314 = fma(_3158, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3304);
    bool _3316 = _3296 >= 0.0;
    bool _3318 = _3316 && _3310;
    float _3320 = fma(_3298, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3312);
    float _3322 = _3314 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3324 = _3302 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    bool _3326 = _3296 <= 1.0;
    bool _3328 = _3326 && _3318;
    float _3330 = fma(_3226, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3320);
    float _3332 = _3176;
    if (!_3014)
    {
        float _3334 = floor(_2910);
        _3332 = _3334;
    }
    float _3336 = _3332;
    float _3338 = fma(_3322, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3330);
    float _3340 = _3306 * 0.693147182464599609375;
    float _3342 = 1.0 / _3338;
    float _3344 = _2894 * _3220;
    float _3346 = _3302 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3348 = _3340;
    if (_3328)
    {
        float _3350 = float(_2952);
        _3070 = _3350;
    }
    float _3352 = _3070;
    float _3354 = _3340 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3356 = fma(_2084, _3212, _3344);
    float _3358 = fma(_3298, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3324);
    float _3360 = fma(_3298, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3346);
    float _3362 = _3256;
    if (!_3014)
    {
        float _3364 = floor(_2916);
        _3362 = _3364;
    }
    float _3366 = _3362;
    if (!_3014)
    {
        float _3368 = -_3336;
        float _3370 = _2910 + _3368;
        _2942 = _3370;
    }
    float _3372 = _2942;
    float _3374 = fma(_3226, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3358);
    float _3376 = fma(_3226, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3360);
    float _3378 = fma(_3322, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3374);
    float _3380 = fma(_3322, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3376);
    float _3382 = _3248;
    float _3384 = _3378;
    if (!_3014)
    {
        float _3386 = rint(_3248);
        float _3388 = precise::max(_3386, 0.0);
        uint _3390 = uint(_3388);
        uint _3392 = clamp(_3390, 0u, 65535u);
        _3382 = as_type<float>(_3392);
    }
    float _3394 = _3382;
    float _3396 = fma(_2096, _3274, _3356);
    float _3398 = _3380 * _3342;
    float _3400 = _3396 + _3282;
    float _3402 = _3378 * _3342;
    float _3404 = fma(_3398, -0.5, 0.5);
    float _3406 = _3356;
    float _3408 = _3402;
    if (_3328)
    {
        float _3410 = rint(_3352);
        float _3412 = precise::max(_3410, 0.0);
        uint _3414 = uint(_3412);
        uint _3416 = clamp(_3414, 0u, 65535u);
        _3406 = as_type<float>(_3416);
    }
    float _3418 = _3406;
    if (!_3014)
    {
        float _3420 = -_3366;
        float _3422 = _2916 + _3420;
        _3166 = _3422;
    }
    float _3424 = _3166;
    float _3426 = _3400 * _3228;
    float _3428 = fma(_3402, 0.5, 0.5);
    float _3430 = _3394;
    if (!_3014)
    {
        float3 _9710 = float3(_3372, _3424, float(as_type<int>(_3394)));
        float3 _9714 = select(_9710, float3(0.0), isnan(_9710));
        float _3432 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _9714.xy, uint(rint(_9714.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _9714.xy, uint(rint(_9714.z)), level(0.0)).x;
        _3430 = _3432;
    }
    float _3434 = _3430;
    float _3436 = _3296;
    if (_3328)
    {
        float3 _9729 = float3(_3290, _3296, float(as_type<int>(_3418)));
        float3 _9731 = select(_9729, float3(0.0), isnan(_9729));
        float _3438 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _9731.xy, uint(rint(_9731.z)), _3426, level(0.0));
        _3436 = _3438;
    }
    float _3440 = _3436;
    float3 _9741 = float3(_3428, _3404, _3354);
    float _3442 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9741, float3(0.0), isnan(_9741)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9741, float3(0.0), isnan(_9741)), level(0.0)).x;
    float3 _9750 = float3(_3428, _3404, _3354);
    float4 _3445 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9750, float3(0.0), isnan(_9750)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9750, float3(0.0), isnan(_9750)), level(0.0)).xyzw;
    float _3447 = _3445.x;
    float _3449 = _3445.y;
    float _3451 = _3445.z;
    float _3453 = _3445.w;
    if (_3014)
    {
        _2944 = 1.0;
    }
    float _3455 = _2944;
    bool _3457 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _3459 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3461 = _3457 || _3459;
    bool _3463 = isnan(0.5);
    bool _3465 = _3461 || _3463;
    float _3467 = _3455;
    if (_3465)
    {
        _3348 = 1.0;
    }
    float _3469 = _3348;
    float _3471 = _3469;
    if (_3465)
    {
        _3168 = 1.0;
    }
    float _3473 = _3168;
    float _3475 = _3473;
    if (!_3465)
    {
        float _3477 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _3479 = _3477 * 0.15915493667125701904296875;
        float _3481 = _3479 * 6.283185482025146484375;
        float _3483 = cos(_3481);
        float _3485 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _3487 = _3485 * 0.15915493667125701904296875;
        float _3489 = _3479 * 6.283185482025146484375;
        float _3491 = sin(_3489);
        float _3493 = 1.0 / _3483;
        float _3495 = _3487 * 6.283185482025146484375;
        float _3497 = cos(_3495);
        float _3499 = _3491 * _3493;
        float _3501 = _3487 * 6.283185482025146484375;
        float _3503 = sin(_3501);
        float _3505 = _3497 * _3499;
        float _3507 = 1.0 / _3505;
        float _3509 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3511 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3509;
        float _3513 = 1.0 / _3511;
        float _3515 = _3503 * _3507;
        float _3517 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3519 = fma(_2914, _3515, _3517);
        float _3521 = _3519 * _3513;
        float _3523 = precise::clamp(_3521, 0.0, 1.0);
        _3408 = _3493;
        _3475 = _3523;
    }
    float _3525 = _3408;
    float _3527 = _3475;
    float _3529 = _3525;
    if (!_3465)
    {
        float _3531 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _3533 = _3531 * 0.15915493667125701904296875;
        float _3535 = _3533 * 6.283185482025146484375;
        float _3537 = cos(_3535);
        float _3539 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _3541 = _3539 * 0.15915493667125701904296875;
        float _3543 = _3533 * 6.283185482025146484375;
        float _3545 = sin(_3543);
        float _3547 = 1.0 / _3537;
        float _3549 = _3541 * 6.283185482025146484375;
        float _3551 = cos(_3549);
        float _3553 = _3545 * _3547;
        float _3555 = _3541 * 6.283185482025146484375;
        float _3557 = sin(_3555);
        float _3559 = _3551 * _3553;
        float _3561 = 1.0 / _3559;
        float _3563 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3565 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _3563;
        float _3567 = 1.0 / _3565;
        float _3569 = _3557 * _3561;
        float _3571 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3573 = fma(_2914, _3569, _3571);
        float _3575 = _3573 * _3567;
        float _3577 = precise::clamp(_3575, 0.0, 1.0);
        float _3579 = -_3577;
        float _3581 = _3579 + 1.0;
        _3529 = _3533;
        _3471 = _3581;
    }
    float _3583 = _3529;
    float _3585 = _3471;
    float _3587 = _3583;
    if (!_3014)
    {
        int _3589 = _3076 << 4;
        int _3591 = _3589 + 2048;
        uint _3593 = uint(int(uint(_3591) >> uint(2)));
        uint _3595 = uint(int(uint(int(_3593)) >> uint(2)));
        int _3597 = int(_3593) & 3;
        float _3599 = (*spvDescriptorSet0.vp_c15)._m0[int(_3595)][_3597];
        int _3601 = int(_3593) + 1;
        uint _3603 = uint(int(uint(_3601) >> uint(2)));
        int _3605 = _3601 & 3;
        float _3607 = (*spvDescriptorSet0.vp_c15)._m0[int(_3603)][_3605];
        int _3609 = _3591 + 8;
        uint _3611 = uint(int(uint(_3609) >> uint(2)));
        uint _3613 = uint(int(uint(int(_3611)) >> uint(2)));
        int _3615 = int(_3611) & 3;
        float _3617 = (*spvDescriptorSet0.vp_c15)._m0[int(_3613)][_3615];
        int _3619 = int(_3611) + 1;
        uint _3621 = uint(int(uint(_3619) >> uint(2)));
        int _3623 = _3619 & 3;
        float _3625 = (*spvDescriptorSet0.vp_c15)._m0[int(_3621)][_3623];
        float _3627 = _2894 * _3607;
        float _3629 = fma(_2084, _3599, _3627);
        float _3631 = fma(_2096, _3617, _3629);
        float _3633 = _3631 + _3625;
        float _3635 = precise::clamp(_3633, 0.0, 1.0);
        float _3637 = -_3635;
        float _3639 = _3637 + _3434;
        float _3641 = fma(_3639, 500.0, 1.5);
        float _3643 = exp2(_3641);
        float _3645 = 0.0 + _3643;
        float _3647 = precise::clamp(_3645, 0.0, 1.0);
        _2946 = _3631;
        _3587 = _3625;
        _3467 = _3647;
    }
    float _3649 = _2946;
    float _3651 = _3587;
    float _3653 = _3467;
    float _3655 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3657 = _3154 + _3655;
    float _3659 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3661 = _3156 + _3659;
    float _3663 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3665 = _3158 + _3663;
    float _3667 = _3657 * _3657;
    float _3669 = fma(_3661, _3661, _3667);
    float _3671 = fma(_3665, _3665, _3669);
    float _3673 = rsqrt(_3671);
    float _3675 = _3673 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3677 = _3661 * _3675;
    float _3679 = _3665 * _3675;
    float _3681 = _3677 * _3677;
    float _3683 = _3679 * _3679;
    float _3685 = _3681 + _3683;
    float _3687 = sqrt(_3685);
    bool _3689 = _3687 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3691 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3693 = _3687 + _3691;
    float _3695 = _3665;
    float _3697 = _3667;
    float _3699 = _3693;
    float _3701 = _3649;
    float _3703 = _3675;
    if (_3689)
    {
        float _3705 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3695 = _3705;
    }
    float _3707 = _3695;
    if (_3689)
    {
        float _3709 = rsqrt(_3685);
        _3697 = _3709;
    }
    float _3711 = _3697;
    float _3713 = _3711;
    if (_3689)
    {
        float _3715 = _3693 * _3707;
        _3699 = _3715;
    }
    float _3717 = _3699;
    if (_3689)
    {
        float _3719 = _3717 * 0.15915493667125701904296875;
        _3701 = _3719;
    }
    float _3721 = _3701;
    float _3723 = _3673;
    float _3725 = _3721;
    if (_3689)
    {
        float _3727 = _3721 * 6.283185482025146484375;
        float _3729 = sin(_3727);
        _3723 = _3729;
    }
    float _3731 = _3723;
    float _3733 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3735 = precise::max(0.0, _3733);
    float _3737 = _3651;
    float _3739 = _3735;
    float _3741 = _3733;
    if (_3689)
    {
        float _3743 = _3721 * 6.283185482025146484375;
        float _3745 = cos(_3743);
        _3737 = _3745;
    }
    float _3747 = _3737;
    float _3749 = -_3675;
    float _3751 = -_3735;
    float _3753 = fma(_3657, _3749, _3751);
    float _3755 = _3753;
    if (_3689)
    {
        float _3757 = _3753 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3739 = _3757;
    }
    float _3759 = _3739;
    float _3761 = _3731;
    float _3763 = _3759;
    if (_3689)
    {
        float _3765 = fma(_3731, _3759, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3761 = _3765;
    }
    float _3767 = _3761;
    float _3769 = _3767;
    if (!_3689)
    {
        _3763 = _3679;
    }
    float _3771 = _3763;
    float _3773 = _3771;
    float _3775 = _3747;
    if (_3689)
    {
        float _3777 = _3747 + (-1.0);
        _3741 = _3777;
    }
    float _3779 = _3741;
    if (_3689)
    {
        float _3781 = _3711 * _3767;
        _3703 = _3781;
    }
    float _3783 = _3703;
    if (!_3689)
    {
        _3769 = _3677;
    }
    float _3785 = _3769;
    float _3787 = _3785;
    if (_3689)
    {
        float _3789 = _3779 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3725 = _3789;
    }
    float _3791 = _3725;
    if (_3689)
    {
        float _3793 = _3677 * _3783;
        _3787 = _3793;
    }
    float _3795 = _3787;
    if (!_3689)
    {
        _3713 = _3681;
    }
    float _3797 = _3713;
    float _3799 = _3797;
    if (_3689)
    {
        float _3801 = _3679 * _3783;
        _3773 = _3801;
    }
    float _3803 = _3773;
    if (_3689)
    {
        float _3805 = fma(_3753, _3747, _3791);
        _3755 = _3805;
    }
    float _3807 = _3755;
    if (_3689)
    {
        float _3809 = _3795 * _3795;
        _3799 = _3809;
    }
    float _3811 = _3799;
    if (!_3689)
    {
        _3775 = _3683;
    }
    float _3813 = _3775;
    float _3815 = _3813;
    if (_3689)
    {
        float _3817 = _3803 * _3803;
        _3815 = _3817;
    }
    float _3819 = _3815;
    float _3821 = sqrt(_3671);
    float _3823 = fma(_3807, _3807, _3811);
    float _3825 = _3823 + _3819;
    float _3827 = rsqrt(_3825);
    float _3829 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3831 = fma(_3821, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3829);
    float _3833 = precise::clamp(_3831, 0.0, 1.0);
    float _3835 = -_3833;
    float _3837 = _3835 + 1.0;
    float _3839 = _3827 * _3807;
    float _3841 = _3827 * _3795;
    float _3843 = abs(_3837);
    float _3845 = log2(_3843);
    float _3847 = _3827 * _3803;
    float _3849 = _3841 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3851 = -_3849;
    float _3853 = fma(_3839, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3851);
    float _3855 = -_3847;
    float _3857 = fma(_3855, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3853);
    float _3859 = fma(_3857, -0.5, 0.5);
    float _3861 = _3845 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3863 = fma(_3857, 0.5, 0.5);
    float _3865 = sqrt(_3859);
    float _3867 = fma(_3863, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3869 = fma(_3863, _3867, -0.212114393711090087890625);
    float _3871 = _3839 + 1.0;
    float _3873 = exp2(_3861);
    float _3875 = fma(_3863, _3869, 1.570728778839111328125);
    float _3877 = _3865 * 0.636619746685028076171875;
    float _3879 = -_3875;
    float _3881 = fma(_3877, _3879, 1.0);
    float _3883 = -_3839;
    float _3885 = fma(_3873, _3871, _3883);
    float _3887 = fma(_3885, 0.5, 0.5);
    float2 _10394 = float2(_3881, _3887);
    float3 _3891 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_10394, float2(0.0), isnan(_10394)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_10394, float2(0.0), isnan(_10394)), level(0.0)).xyz;
    float _3893 = _3891.x;
    float _3895 = _3891.y;
    float _3897 = _3891.z;
    float _3899 = abs(_2914);
    float _3901 = log2(_3899);
    float _3903 = _3302 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3905 = _3845 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3907 = -_2854;
    float _3909 = _3907 + 1.0;
    float _3911 = fma(_3298, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3903);
    float _3913 = exp2(_3905);
    float _3915 = fma(_3226, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3911);
    float _3917 = _3338 * 0.5;
    bool _3919 = _2914 <= 8000.0;
    bool _3921 = isnan(_2914);
    bool _3923 = _3919 || _3921;
    bool _3925 = isnan(8000.0);
    bool _3927 = _3923 || _3925;
    float _3929 = float(_3927);
    float _3931 = fma(_3322, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3915);
    float _3933 = fma(_3380, -0.5, _3917);
    float _3935 = _3901 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3937 = _3931 + _3338;
    out.gl_Position.x = _3378;
    out.gl_Position.y = _3380;
    out.gl_Position.z = _3931;
    out.gl_Position.w = _3338;
    float _3939 = _3378 + _3338;
    float _3941 = _3937 * 0.5;
    float _3943 = exp2(_3935);
    float _3945 = _3939 * 0.5;
    out.m_84.x = _3945;
    out.m_84.y = _3933;
    out.m_84.z = _3941;
    out.m_84.w = _3338;
    float _3947 = -_3913;
    float _3949 = _3947 + 1.0;
    float _3951 = _3929;
    if (!_3328)
    {
        _3384 = 1.0;
    }
    float _3953 = _3384;
    float _3955 = _3953;
    if (_3328)
    {
        bool _3957 = _3440 >= _3426;
        bool _3959 = isnan(_3440);
        bool _3961 = _3957 || _3959;
        bool _3963 = isnan(_3426);
        bool _3965 = _3961 || _3963;
        float _3967 = float(_3965);
        _3955 = _3967;
    }
    float _3969 = _3955;
    float _3971 = _3949 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _3973 = _3821 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3975 = isnan(_3821);
    bool _3977 = _3973 || _3975;
    bool _3979 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3981 = _3977 || _3979;
    float _3983 = fma(_3943, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3985 = precise::clamp(_3983, 0.0, 1.0);
    float _3987 = _3969 * _3653;
    float _3989 = _3971 * _3442;
    float _3991 = fma(_3985, -2.0, 3.0);
    float _3993 = _3985 * _3985;
    float _3995 = _3453 * _3989;
    float _3997 = _3993 * _3991;
    float _3999 = -_3997;
    float _4001 = _3999 + 1.0;
    float _4003 = fma(_4001, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3997);
    float _4005 = _3929 * _4003;
    float _4007 = _4005;
    float _4009 = _3971;
    float _4011 = _3995;
    if (!_3981)
    {
        _3951 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4013 = _3951;
    float _4015 = _4005 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _4017 = _4013;
    float _4019 = _4013;
    if (!_3981)
    {
        _4007 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4021 = _4007;
    float _4023 = _3909 * _4015;
    float _4025 = precise::clamp(_4023, 0.0, 1.0);
    float _4027 = -_4025;
    float _4029 = fma(_4027, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4031 = -_3971;
    float _4033 = _4031 + 1.0;
    float _4035 = _4033;
    float _4037 = _4021;
    float _4039 = _4021;
    if (!_3981)
    {
        _4009 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4041 = _4009;
    float _4043 = -_3987;
    float _4045 = fma(_4043, _4029, 1.0);
    float _4047 = precise::clamp(_4045, 0.0, 1.0);
    float _4049 = _3453 * _4033;
    float _4051 = _4041;
    float _4053 = _4041;
    if (!_3981)
    {
        _4035 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4055 = _4035;
    float _4057 = _4047 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4059 = _3527 * _3585;
    out.m_86.x = _4057;
    float _4061 = _4059 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4063 = _4059;
    float _4065 = _4055;
    float _4067 = _4055;
    if (!_3981)
    {
        _4063 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4069 = _4063;
    float _4071 = _3897 * _3989;
    float _4073 = fma(_3893, _3995, _3447);
    float _4075 = fma(_3895, _3995, _3449);
    float _4077 = _4069;
    float _4079 = _4069;
    if (!_3981)
    {
        _4011 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4081 = _4011;
    float _4083 = fma(_3453, _4071, _3451);
    out.m_88.x = _4073;
    out.m_88.y = _4075;
    out.m_88.z = _4083;
    out.m_88.w = _4049;
    bool _4085 = !_3981;
    float _4087 = _4081;
    float _4089 = _4081;
    if (!_4085)
    {
        bool _4091 = _3821 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4093 = isnan(_3821);
        bool _4095 = _4091 || _4093;
        bool _4097 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4099 = _4095 || _4097;
        if (!_4099)
        {
            float _4101 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4103 = _3821 + _4101;
            float _4105 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4107 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4105;
            float _4109 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4111 = _4109 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4113 = 1.0 / _4107;
            float _4115 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4117 = _4115 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4119 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4121 = _4119 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4123 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4125 = _4123 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4127 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4129 = _4127 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4131 = _4103 * _4113;
            float _4133 = precise::clamp(_4131, 0.0, 1.0);
            float _4135 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4137 = _4135 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4139 = fma(_4133, _4111, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4141 = fma(_4133, _4137, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4143 = fma(_4133, _4117, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4145 = fma(_4133, _4121, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4147 = fma(_4133, _4125, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4149 = fma(_4133, _4129, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4019 = _4143;
            _4053 = _4147;
            _4039 = _4139;
            _4067 = _4145;
            _4089 = _4141;
            _4079 = _4149;
            _4151 = true;
        }
        else
        {
            bool _4153 = _3821 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4155 = isnan(_3821);
            bool _4157 = _4153 || _4155;
            bool _4159 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4161 = _4157 || _4159;
            if (!_4161)
            {
                _4037 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4163 = _4037;
            _4039 = _4163;
            if (!_4161)
            {
                _4017 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4165 = _4017;
            _4019 = _4165;
            if (!_4161)
            {
                _4087 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4167 = _4087;
            _4089 = _4167;
            if (!_4161)
            {
                _4065 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4169 = _4065;
            _4067 = _4169;
            if (!_4161)
            {
                _4051 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4171 = _4051;
            _4053 = _4171;
            if (!_4161)
            {
                _4077 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4173 = _4077;
            bool _4175 = !_4161;
            _4079 = _4173;
            if (!_4175)
            {
                bool _4177 = _3821 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4179 = isnan(_3821);
                bool _4181 = _4177 || _4179;
                bool _4183 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4185 = _4181 || _4183;
                if (!_4185)
                {
                    float _4187 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4189 = _3821 + _4187;
                    float _4191 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4193 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4191;
                    float _4195 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4197 = _4195 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4199 = 1.0 / _4193;
                    float _4201 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4203 = _4201 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4205 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4207 = _4205 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4209 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4211 = _4209 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4213 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4215 = _4213 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4217 = _4189 * _4199;
                    float _4219 = precise::clamp(_4217, 0.0, 1.0);
                    float _4221 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4223 = _4221 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4225 = fma(_4219, _4197, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4227 = fma(_4219, _4223, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4229 = fma(_4219, _4203, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4231 = fma(_4219, _4207, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4233 = fma(_4219, _4211, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4235 = fma(_4219, _4215, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4019 = _4229;
                    _4053 = _4233;
                    _4039 = _4225;
                    _4067 = _4231;
                    _4089 = _4227;
                    _4079 = _4235;
                    _4151 = true;
                }
                else
                {
                    _4019 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4053 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4039 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4067 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4089 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4079 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4151 = false;
    float _4237 = _4019;
    float _4239 = _4053;
    float _4241 = _4039;
    float _4243 = _4067;
    float _4245 = _4089;
    float _4247 = _4079;
    float _4249 = _4061 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4251 = fma(_2478, -0.5, 0.5);
    float _4253 = precise::clamp(_4251, 0.0, 1.0);
    float _4255 = -_4237;
    float _4257 = _4255 + _4239;
    float _4259 = -_4241;
    float _4261 = _4259 + _4243;
    out.m_61.x = _4249;
    float _4263 = fma(_4253, _4257, _4237);
    float _4265 = -_4245;
    float _4267 = _4265 + _4247;
    float _4269 = fma(_4253, _4261, _4241);
    float _4271 = _4263 * 0.586610972881317138671875;
    bool _4273 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4275 = fma(_4253, _4267, _4245);
    out.m_90.x = 0.0;
    float _4277 = fma(_4269, 0.298911988735198974609375, _4271);
    bool _4279 = _3527 > 0.0;
    bool _4281 = isnan(_3527);
    bool _4283 = _4279 || _4281;
    bool _4285 = isnan(0.0);
    bool _4287 = _4283 || _4285;
    float _4289 = fma(_4275, 0.114477999508380889892578125, _4277);
    bool _4291 = _3585 <= 0.0;
    bool _4293 = !_4287;
    bool _4295 = _4291 || _4293;
    float _4297 = -_4289;
    float _4299 = _4269 + _4297;
    float _4301 = -_4289;
    float _4303 = _4263 + _4301;
    float _4305 = -_4289;
    float _4307 = _4275 + _4305;
    float _4309 = fma(_4299, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4289);
    float _4311 = fma(_4303, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4289);
    float _4313 = fma(_4307, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4289);
    bool _4315 = !_4273;
    if (!_4315)
    {
        float _4317 = -_3154;
        float _4319 = _4317 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4321 = -_3156;
        float _4323 = _4321 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4325 = -_3158;
        float _4327 = _4325 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4329 = _4319 * _4319;
        float _4331 = fma(_4323, _4323, _4329);
        float _4333 = fma(_4327, _4327, _4331);
        float _4335 = sqrt(_4333);
        float _4337 = rsqrt(_4333);
        float _4339 = -_4335;
        float _4341 = _4339 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4343 = _4341 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4345 = precise::clamp(_4343, 0.0, 1.0);
        float _4347 = _4323 * _4337;
        float _4349 = _4319 * _4337;
        float _4351 = abs(_4345);
        float _4353 = log2(_4351);
        float _4355 = _4327 * _4337;
        float _4357 = _4347 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4359 = _2478 * _4349;
        float _4361 = -_4349;
        float _4363 = -_4357;
        float _4365 = fma(_4361, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4363);
        float _4367 = fma(_2476, _4347, _4359);
        float _4369 = -_4355;
        float _4371 = fma(_4369, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4365);
        float _4373 = fma(_2480, _4355, _4367);
        float _4375 = precise::clamp(_4373, 0.0, 1.0);
        float _4377 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4379 = _4371 + _4377;
        float _4381 = _4353 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4383 = _4379 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4385 = precise::clamp(_4383, 0.0, 1.0);
        float _4387 = exp2(_4381);
        float _4389 = _4387 * _4385;
        float _4391 = _4375 * _4389;
        float _4393 = _4391 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4395 = _4391 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4397 = _4391 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_90.x = _4393;
        out.m_90.y = _4395;
        out.m_90.z = _4397;
    }
    out.m_92.x = _4309;
    out.m_92.y = _4311;
    out.m_92.z = _4313;
    if (!_4295)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_61.x = 0.0;
    float _4399 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4399;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4151 = false;
    bool _2530 = false;
    bool _991 = false;
    bool _807 = false;
    bool _693 = false;
    bool _491 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _106 = in.m_58.w;
    float _108 = trunc(_106);
    int _111 = int(_108);
    bool _115 = _111 >= 1;
    float _117 = 0.0;
    if (!_115)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _119 = _117;
    float _121 = _119;
    if (!_115)
    {
        out.m_61.x = 0.0;
    }
    int _123 = 0;
    if (!_115)
    {
        float _125 = _119 * 5.0;
        _123 = as_type<int>(_125);
    }
    int _127 = _123;
    int _129 = _127;
    if (!_115)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4456 = as_type<float>(_127);
        out.gl_Position.z = _4456;
    }
    if (!_115)
    {
        return out;
    }
    float _131 = in.m_63.w;
    bool _133 = _131 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _135 = isnan(_131);
    bool _137 = _133 || _135;
    bool _139 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _141 = _137 || _139;
    float _143 = -_131;
    float _145 = _143 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _147 = _145;
    if (_141)
    {
        float _149 = float(_111);
        _121 = _149;
    }
    float _151 = _121;
    bool _153 = _145 >= _151;
    bool _155 = !_141;
    bool _157 = _153 || _155;
    float _159 = _151;
    if (_157)
    {
        _159 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _159;
    if (_157)
    {
        out.m_61.x = 0.0;
    }
    if (_157)
    {
        float _163 = _161 * 5.0;
        _129 = as_type<int>(_163);
    }
    int _165 = _129;
    if (_157)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4526 = as_type<float>(_165);
        out.gl_Position.z = _4526;
    }
    if (_157)
    {
        return out;
    }
    float _167 = as_type<float>(int(gl_VertexIndex));
    float _169 = _145 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _171 = in.m_68.w;
    bool _173 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _175 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _177 = _173 || _175;
    bool _179 = isnan(1.0);
    bool _181 = _177 || _179;
    float _183 = in.m_63.x;
    float _185 = in.m_63.y;
    float _187 = in.m_63.z;
    float _189 = in.m_58.x;
    float _191 = in.m_58.y;
    float _193 = in.m_58.z;
    int _195 = as_type<int>(_167) & 1;
    bool _197 = _195 != 0;
    int _199 = as_type<int>(_167) & 2;
    bool _201 = _199 != 0;
    float _203 = _167;
    float _205 = _169;
    if (!_181)
    {
        float _207 = _169 * _169;
        float _209 = _207 * 0.5;
        _203 = _209;
    }
    float _211 = _203;
    bool _213 = !_197;
    float _215 = _213 ? (-0.5) : 0.5;
    float _217 = _211;
    if (!_181)
    {
        float _219 = _211 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _217 = _219;
    }
    float _221 = _217;
    bool _223 = !_201;
    float _225 = _223 ? (-0.5) : 0.5;
    bool _227 = !_181;
    float _229 = _221;
    if (!_227)
    {
        float _231 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _233 = log2(_231);
        float _235 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _237 = _235 + 1.0;
        float _239 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _241 = _169 * _233;
        float _243 = 1.0 / _237;
        float _245 = _239 * 0.693147182464599609375;
        float _247 = exp2(_241);
        float _249 = 1.0 / _245;
        float _251 = _247 + (-1.0);
        float _253 = -_251;
        float _255 = fma(_253, _249, _169);
        float _257 = _255 * _243;
        float _259 = _257 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _229 = _259;
    }
    float _261 = _229;
    float _263 = _261 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _265 = !_181;
    float _267 = _263;
    float _269 = _261;
    if (!_265)
    {
        float _271 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _273 = log2(_271);
        float _275 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _277 = _275 + 1.0;
        float _279 = 1.0 / _277;
        float _281 = _169 * _273;
        float _283 = exp2(_281);
        float _285 = -_283;
        float _287 = _285 + 1.0;
        float _289 = _287 * _279;
        _205 = _289;
    }
    float _291 = _205;
    float _293 = _261 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _295 = _263 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _297 = _263 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _299 = _263 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    if (!_181)
    {
        float _301 = _145 * _145;
        float _303 = _301 * 0.5;
        _267 = _303;
    }
    float _305 = _267;
    float _307 = fma(_293, (*spvDescriptorSet0.vp_c10)._m0[8].x, _295);
    float _309 = fma(_293, (*spvDescriptorSet0.vp_c10)._m0[8].y, _297);
    float _311 = fma(_293, (*spvDescriptorSet0.vp_c10)._m0[8].z, _299);
    float _313 = _261 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_181)
    {
        float _315 = _305 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _269 = _315;
    }
    float _317 = _269;
    bool _319 = !_181;
    float _321 = _317;
    if (!_319)
    {
        float _323 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _325 = log2(_323);
        float _327 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _329 = _327 + 1.0;
        float _331 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _333 = _145 * _325;
        float _335 = exp2(_333);
        float _337 = _331 * 0.693147182464599609375;
        float _339 = 1.0 / _337;
        float _341 = 1.0 / _329;
        float _343 = _335 + (-1.0);
        float _345 = -_343;
        float _347 = fma(_345, _339, _145);
        float _349 = _347 * _341;
        float _351 = _349 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _321 = _351;
    }
    float _353 = _321;
    float _355 = _353 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _357 = fma(_313, (*spvDescriptorSet0.vp_c10)._m0[10].x, _307);
    float _359 = fma(_313, (*spvDescriptorSet0.vp_c10)._m0[10].y, _309);
    float _361 = _353 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _363 = _355 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _365 = _355 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _367 = _355 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _369 = fma(_313, (*spvDescriptorSet0.vp_c10)._m0[10].z, _311);
    float _371 = fma(_361, (*spvDescriptorSet0.vp_c10)._m0[8].x, _363);
    float _373 = fma(_361, (*spvDescriptorSet0.vp_c10)._m0[8].y, _365);
    float _375 = fma(_361, (*spvDescriptorSet0.vp_c10)._m0[8].z, _367);
    float _377 = _353 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _379 = fma(_291, _183, _357);
    float _381 = fma(_291, _185, _359);
    float _383 = fma(_291, _187, _369);
    float _385 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[10].x, _371);
    float _387 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[10].y, _373);
    float _389 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[10].z, _375);
    float _391 = _377;
    if (!_181)
    {
        _391 = _145;
    }
    float _393 = _391;
    bool _395 = !_181;
    float _397 = _393;
    if (!_395)
    {
        float _399 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _401 = log2(_399);
        float _403 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _405 = _403 + 1.0;
        float _407 = 1.0 / _405;
        float _409 = _145 * _401;
        float _411 = exp2(_409);
        float _413 = -_411;
        float _415 = _413 + 1.0;
        float _417 = _415 * _407;
        _397 = _417;
    }
    float _419 = _397;
    float _421 = fma(_419, _185, _387);
    float _423 = fma(_419, _183, _385);
    float _425 = fma(_419, _187, _389);
    bool _427 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _429 = fma(_381, _171, _191);
    float _431 = -_421;
    float _433 = _381 + _431;
    float _435 = fma(_379, _171, _189);
    float _437 = -_423;
    float _439 = _379 + _437;
    float _441 = -_425;
    float _443 = _383 + _441;
    float _445 = _433 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _447 = _433 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _449 = _433 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _451 = fma(_439, (*spvDescriptorSet0.vp_c10)._m0[4].x, _445);
    float _453 = fma(_439, (*spvDescriptorSet0.vp_c10)._m0[5].x, _447);
    float _455 = fma(_439, (*spvDescriptorSet0.vp_c10)._m0[6].x, _449);
    float _457 = fma(_383, _171, _193);
    float _459 = fma(_443, (*spvDescriptorSet0.vp_c10)._m0[4].z, _451);
    float _461 = fma(_443, (*spvDescriptorSet0.vp_c10)._m0[5].z, _453);
    float _463 = fma(_443, (*spvDescriptorSet0.vp_c10)._m0[6].z, _455);
    bool _465 = !_427;
    float _467 = _461;
    float _469 = _459;
    float _471 = _463;
    float _489;
    if (!_465)
    {
        float _473 = in.m_70.x;
        float _475 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _477 = _473 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _479 = fma(_477, (*spvDescriptorSet0.vp_c9)._m0[12].x, _145);
        float _481 = _479 * _475;
        float _483 = floor(_481);
        float _485 = -_483;
        float _487 = _481 + _485;
        _489 = _487;
        _491 = true;
    }
    else
    {
        float _493 = float(_111);
        float _495 = 1.0 / _493;
        float _497 = _145 * _495;
        _489 = _497;
    }
    _491 = false;
    float _499 = _489;
    float _501 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _503 = _499 + _501;
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _507 = _499 + _505;
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _511 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _509;
    float _513 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _515 = _513 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _517 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _519 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _517;
    bool _521 = _499 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _523 = isnan(_499);
    bool _525 = _521 || _523;
    bool _527 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _529 = _525 || _527;
    float _531 = float(_529);
    float _533 = 1.0 / _511;
    float _535 = -_531;
    float _537 = _535 + 1.0;
    bool _539 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _541 = 1.0 / _515;
    float _543 = 1.0 / _519;
    float _545 = _503 * _533;
    float _547 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _549 = _499 + _547;
    float _551 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _553 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _551;
    float _555 = _549 * _541;
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _559 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _557;
    float _561 = fma(_553, _545, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _565 = _563 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _567 = fma(_559, _545, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _569 = _507 * _543;
    bool _571 = _499 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _573 = isnan(_499);
    bool _575 = _571 || _573;
    bool _577 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _579 = _575 || _577;
    float _581 = float(_579);
    bool _583 = _499 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _585 = isnan(_499);
    bool _587 = _583 || _585;
    bool _589 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _591 = _587 || _589;
    float _593 = float(_591);
    float _595 = _581 * _537;
    bool _597 = _499 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _599 = isnan(_499);
    bool _601 = _597 || _599;
    bool _603 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _605 = _601 || _603;
    float _607 = float(_605);
    float _609 = -_581;
    float _611 = _609 + 1.0;
    float _613 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _615 = _613 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _617 = -_593;
    float _619 = _617 + 1.0;
    float _621 = _593 * _611;
    float _623 = fma(_615, _555, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _625 = fma(_565, _555, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _627 = _607 * _619;
    float _629 = in.m_68.x;
    float _631 = in.m_68.y;
    float _633 = -_607;
    float _635 = _633 + 1.0;
    float _637 = _561 * _627;
    float _639 = _567 * _627;
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _643 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _641;
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _647 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _645;
    float _649 = fma(_635, (*spvDescriptorSet0.vp_c9)._m0[143].x, _637);
    float _651 = fma(_635, (*spvDescriptorSet0.vp_c9)._m0[143].y, _639);
    float _653 = fma(_643, _569, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _655 = fma(_647, _569, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _657 = fma(_623, _621, _649);
    float _659 = fma(_625, _621, _651);
    float _661 = fma(_653, _595, _657);
    float _663 = fma(_655, _595, _659);
    float _665 = fma(_531, (*spvDescriptorSet0.vp_c9)._m0[146].x, _661);
    float _667 = fma(_531, (*spvDescriptorSet0.vp_c9)._m0[146].y, _663);
    float _669 = _665 * _629;
    float _671 = _667 * _631;
    bool _673 = !_539;
    float _691;
    if (!_673)
    {
        float _675 = in.m_70.x;
        float _677 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _679 = _675 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _681 = fma(_679, (*spvDescriptorSet0.vp_c9)._m0[11].x, _145);
        float _683 = _681 * _677;
        float _685 = floor(_683);
        float _687 = -_685;
        float _689 = _683 + _687;
        _691 = _689;
        _693 = true;
    }
    else
    {
        float _695 = float(_111);
        float _697 = 1.0 / _695;
        float _699 = _145 * _697;
        _691 = _699;
    }
    _693 = false;
    float _701 = _691;
    float _703 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _705 = _701 + _703;
    bool _707 = _701 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _709 = isnan(_701);
    bool _711 = _707 || _709;
    bool _713 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _715 = _711 || _713;
    float _717 = float(_715);
    float _719 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _721 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _719;
    bool _723 = _701 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _725 = isnan(_701);
    bool _727 = _723 || _725;
    bool _729 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _731 = _727 || _729;
    float _733 = float(_731);
    float _735 = -_717;
    float _737 = _735 + 1.0;
    float _739 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _741 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _739;
    float _743 = 1.0 / _721;
    bool _745 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _747 = _733 * _737;
    float _749 = -_733;
    float _751 = _749 + 1.0;
    float _753 = _705 * _743;
    float _755 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _757 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _755;
    float _759 = fma(_741, _753, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _761 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _763 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _761;
    float _765 = fma(_757, _753, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _767 = _759 * _747;
    float _769 = fma(_763, _753, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _771 = _765 * _747;
    float _773 = _769 * _747;
    float _775 = fma(_751, (*spvDescriptorSet0.vp_c9)._m0[107].x, _767);
    float _777 = fma(_751, (*spvDescriptorSet0.vp_c9)._m0[107].y, _773);
    float _779 = fma(_751, (*spvDescriptorSet0.vp_c9)._m0[107].z, _771);
    float _781 = fma(_717, (*spvDescriptorSet0.vp_c9)._m0[108].x, _775);
    float _783 = fma(_717, (*spvDescriptorSet0.vp_c9)._m0[108].y, _777);
    float _785 = fma(_717, (*spvDescriptorSet0.vp_c9)._m0[108].z, _779);
    bool _787 = !_745;
    float _805;
    if (!_787)
    {
        float _789 = in.m_70.x;
        float _791 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _793 = _789 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _795 = fma(_793, (*spvDescriptorSet0.vp_c9)._m0[11].y, _145);
        float _797 = _795 * _791;
        float _799 = floor(_797);
        float _801 = -_799;
        float _803 = _797 + _801;
        _805 = _803;
        _807 = true;
    }
    else
    {
        float _809 = float(_111);
        float _811 = 1.0 / _809;
        float _813 = _145 * _811;
        _805 = _813;
    }
    _807 = false;
    float _815 = _805;
    float _817 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _819 = _815 + _817;
    float _821 = _781 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _823 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _825 = _823 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _827 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _829 = _827 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _831 = _815 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _833 = isnan(_815);
    bool _835 = _831 || _833;
    bool _837 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _839 = _835 || _837;
    float _841 = float(_839);
    float _843 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _845 = _843 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _847 = _815 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _849 = isnan(_815);
    bool _851 = _847 || _849;
    bool _853 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _855 = _851 || _853;
    float _857 = float(_855);
    float _859 = 1.0 / _825;
    float _861 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _863 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _861;
    float _865 = -_841;
    float _867 = _865 + 1.0;
    bool _869 = _815 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _871 = isnan(_815);
    bool _873 = _869 || _871;
    bool _875 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _877 = _873 || _875;
    float _879 = float(_877);
    float _881 = _783 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _883 = _785 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _885 = _821 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _887 = 1.0 / _829;
    float _889 = _881 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _891 = _883 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _893 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _895 = 1.0 / _845;
    float _897 = _863 * _859;
    float _899 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _901 = _899 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _903 = _857 * _867;
    float _905 = -_857;
    float _907 = _905 + 1.0;
    float _909 = fma(_897, _819, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _911 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _913 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _911;
    float _915 = _879 * _907;
    float _917 = _901 * _887;
    float _919 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _921 = _815 + _919;
    bool _923 = _815 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _925 = isnan(_815);
    bool _927 = _923 || _925;
    bool _929 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _931 = _927 || _929;
    float _933 = float(_931);
    float _935 = _909 * _915;
    float _937 = -_879;
    float _939 = _937 + 1.0;
    float _941 = fma(_917, _921, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _943 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _945 = _815 + _943;
    float _947 = _913 * _895;
    float _949 = -_933;
    float _951 = _949 + 1.0;
    float _953 = fma(_939, (*spvDescriptorSet0.vp_c9)._m0[115].x, _935);
    float _955 = fma(_947, _945, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _957 = _841 * _951;
    float _959 = fma(_941, _903, _953);
    float _961 = fma(_955, _957, _959);
    float _963 = fma(_933, (*spvDescriptorSet0.vp_c9)._m0[118].x, _961);
    float _965 = _963 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_72.x = _885;
    out.m_72.y = _889;
    out.m_72.z = _891;
    out.m_72.w = _965;
    bool _967 = !_893;
    float _987;
    float _989;
    if (!_967)
    {
        float _969 = in.m_70.x;
        float _971 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _973 = float(_111);
        float _975 = _969 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _977 = fma(_975, (*spvDescriptorSet0.vp_c9)._m0[11].w, _145);
        float _979 = _977 * _971;
        float _981 = floor(_979);
        float _983 = -_981;
        float _985 = _979 + _983;
        _987 = _973;
        _989 = _985;
        _991 = true;
    }
    else
    {
        float _993 = float(_111);
        float _995 = 1.0 / _993;
        float _997 = _145 * _995;
        _987 = _993;
        _989 = _997;
    }
    _991 = false;
    float _999 = _987;
    float _1001 = _989;
    float _1003 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1005 = int(_1003);
    int _1007 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1009 = _1007 != 0;
    float _1011 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1013 = int(_1011);
    float _1015 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1017 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1015;
    float _1019 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1021 = 1.0 / _999;
    float _1023 = float(_1005);
    float _1025 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1027 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1029 = 1.0 / _1023;
    float _1031 = float(uint(_1013));
    bool _1033 = _1013 == 0;
    int _1035 = ~_1013;
    int _1037 = _1035 + 1;
    float _1039 = 1.0 / _1031;
    float _1041 = _145 * _1029;
    float _1043 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1045 = log2(_1043);
    int _1047 = as_type<int>(_1039) + (-2);
    float _1049 = trunc(_1041);
    int _1051 = int(_1049);
    float _1053 = _145 * _1045;
    float _1055 = exp2(_1053);
    float _1057 = float(uint(_1051));
    float _1059 = as_type<float>(_1047) * _1057;
    int _1061 = ~_1013;
    int _1063 = _1061 + 1;
    float _1065 = trunc(_1059);
    float _1067 = precise::max(_1065, 0.0);
    uint _1070 = uint(_1067);
    int _1072 = ~_1013;
    int _1074 = _1072 + 1;
    int _1076 = _1063 * int(_1070);
    int _1078 = _1076 + _1051;
    float _1080 = float(uint(_1078));
    float _1082 = as_type<float>(_1047) * _1080;
    float _1084 = in.m_70.x;
    float _1086 = in.m_70.y;
    float _1088 = in.m_70.z;
    float _1090 = in.m_70.w;
    float _1092 = trunc(_1082);
    float _1094 = precise::max(_1092, 0.0);
    uint _1096 = uint(_1094);
    int _1098 = int(_1070) + int(_1096);
    float _1100 = float(_1013);
    float _1102 = float(_1051);
    int _1104 = _1074 * _1098;
    int _1106 = _1104 + _1051;
    float _1108 = 0.0;
    if (!_1009)
    {
        _1108 = _1088;
    }
    float _1110 = _1108;
    bool _1112 = _1102 >= _1100;
    bool _1114 = isnan(_1102);
    bool _1116 = _1112 || _1114;
    bool _1118 = isnan(_1100);
    bool _1120 = _1116 || _1118;
    float _1122 = float(_1120);
    bool _1124 = !_1009;
    float _1126 = _1124 ? 7.345489978790283203125 : 1.0;
    bool _1128 = uint(_1106) >= uint(_1013);
    float _1130 = trunc(_1122);
    int _1132 = int(_1130);
    float _1134 = _1126 * _1084;
    bool _1136 = !_1128;
    int _1138 = _1136 ? 0 : (-1);
    float _1140 = _1110;
    if (_1009)
    {
        _1140 = _1086;
    }
    float _1142 = _1140;
    int _1144 = ~_1098;
    int _1146 = _1144 + _1138;
    int _1148 = _1146 + 1;
    float _1150 = floor(_1134);
    float _1152 = fma(_1142, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1025);
    int _1154 = _1013 * _1148;
    int _1156 = _1154 + _1051;
    int _1158 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1160 = _1158 != 0;
    int _1162 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1164 = _1162 != 0;
    int _1166 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1168 = _1166 != 0;
    float _1170 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1152);
    int _1172 = ~_1132;
    int _1174 = _1172 + 1;
    int _1176 = _1174 + 1;
    bool _1178 = !_1033;
    int _1180 = _1178 ? _1156 : (-1);
    bool _1182 = !_1160;
    int _1184 = _1182 ? 0 : 1;
    int _1186 = _1180 * _1176;
    float _1188 = -_1150;
    float _1190 = _1134 + _1188;
    int _1192 = _1013 + (-1);
    float _1194 = _1190 * _1100;
    float _1196 = _145 * _1100;
    int _1198 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1200 = _1198 != 0;
    float _1202 = trunc(_1194);
    int _1204 = int(_1202);
    float _1206 = _1196 * _1021;
    bool _1208 = !_1164;
    int _1210 = _1208 ? 0 : 1;
    int _1212 = _1132 * _1192;
    int _1214 = _1212 + _1186;
    bool _1216 = !_1200;
    int _1218 = _1216 ? 0 : 1;
    float _1220 = _429 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _1222 = abs(_1210);
    float _1224 = trunc(_1206);
    int _1226 = int(_1224);
    int _1228 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1230 = _1228 != 0;
    bool _1232 = !_1168;
    int _1234 = _1232 ? 0 : 1;
    int _1236 = _1214 * _1222;
    int _1238 = abs(_1184);
    int _1240 = abs(_1218);
    bool _1242 = !_1230;
    int _1244 = _1242 ? 0 : 1;
    int _1246 = abs(_1234);
    int _1248 = _1204 * _1240;
    int _1250 = _1248 + _1051;
    float _1252 = fma(_435, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1220);
    int _1254 = abs(_1244);
    int _1256 = _1226 * _1238;
    int _1258 = _1256 + _1236;
    int _1260 = ~_1013;
    int _1262 = _1260 + 1;
    int _1264 = _1250 * _1246;
    int _1266 = _1264 + _1258;
    int _1268 = ~_1013;
    int _1270 = _1268 + 1;
    bool _1272 = _1001 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1274 = isnan(_1001);
    bool _1276 = _1272 || _1274;
    bool _1278 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1280 = _1276 || _1278;
    float _1282 = float(_1280);
    int _1284 = _1204 * _1254;
    int _1286 = _1284 + _1266;
    float _1288 = _429 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1290 = float(uint(_1286));
    float _1292 = as_type<float>(_1047) * _1290;
    float _1294 = trunc(_1292);
    float _1296 = precise::max(_1294, 0.0);
    uint _1298 = uint(_1296);
    int _1300 = _1262 * int(_1298);
    int _1302 = _1300 + _1286;
    float _1304 = float(uint(_1302));
    float _1306 = as_type<float>(_1047) * _1304;
    float _1308 = trunc(_1306);
    float _1310 = precise::max(_1308, 0.0);
    uint _1312 = uint(_1310);
    int _1314 = int(_1298) + int(_1312);
    int _1316 = _1270 * _1314;
    int _1318 = _1316 + _1286;
    bool _1320 = uint(_1318) >= uint(_1013);
    float _1322 = _1084 * 2.0;
    bool _1324 = !_1320;
    int _1326 = _1324 ? 0 : (-1);
    float _1328 = floor(_1322);
    int _1330 = ~_1314;
    int _1332 = _1330 + _1326;
    int _1334 = _1332 + 1;
    float _1336 = _1086 * 2.0;
    int _1338 = _1013 * _1334;
    int _1340 = _1338 + _1286;
    float _1342 = floor(_1336);
    bool _1344 = !_1033;
    int _1346 = _1344 ? _1340 : (-1);
    int _1348 = _1346 & 3;
    bool _1350 = _1348 != 0;
    int _1352 = _1346 & 3;
    bool _1354 = _1352 != 0;
    bool _1356 = uint(_1348) > 1u;
    int _1358 = _1354 ? 0 : 1;
    bool _1360 = _1328 >= 0.0;
    bool _1362 = isnan(_1328);
    bool _1364 = _1360 || _1362;
    bool _1366 = isnan(0.0);
    bool _1368 = _1364 || _1366;
    int _1370 = ~_1358;
    int _1372 = _1370 + 1;
    int _1374 = _1372 + 1;
    bool _1376 = _1090 > 0.5;
    int _1378 = _1368 ? 0 : 1;
    int _1380 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1382 = _1380 != 0;
    int _1384 = _1374;
    float _1386 = _1252;
    if (!_1356)
    {
        int _1388 = ~_1358;
        int _1390 = _1388 + 1;
        _1384 = _1390;
    }
    int _1392 = _1384;
    bool _1394 = _1084 > 0.5;
    int _1396 = ~_1378;
    int _1398 = _1396 + 1;
    int _1400 = _1398 + 1;
    float _1402 = -_215;
    int _1404 = _1394 ? as_type<int>(_1402) : as_type<int>(_215);
    bool _1406 = _1328 > 0.0;
    float _1408 = -_225;
    int _1410 = _1376 ? as_type<int>(_1408) : as_type<int>(_225);
    bool _1412 = _1086 > 0.5;
    float _1414 = -_225;
    int _1416 = _1412 ? as_type<int>(_1414) : as_type<int>(_225);
    int _1418 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1420 = _1418 != 0;
    float _1422 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _1424 = !_1382;
    float _1426 = _1424 ? _215 : as_type<float>(_1404);
    int _1428 = _1400;
    if (!_1406)
    {
        int _1430 = ~_1378;
        int _1432 = _1430 + 1;
        _1428 = _1432;
    }
    int _1434 = _1428;
    float _1436 = _1426 + 0.5;
    bool _1438 = !_1420;
    float _1440 = _1438 ? _225 : as_type<float>(_1410);
    float _1442 = fma(_435, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1288);
    bool _1444 = _1088 > 0.5;
    float _1446 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1448 = _1446 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1450 = _1342 >= 0.0;
    bool _1452 = isnan(_1342);
    bool _1454 = _1450 || _1452;
    bool _1456 = isnan(0.0);
    bool _1458 = _1454 || _1456;
    float _1460 = -_215;
    int _1462 = _1444 ? as_type<int>(_1460) : as_type<int>(_215);
    float _1464 = 1.0 / _1448;
    int _1466 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1468 = _1466 != 0;
    int _1470 = _1458 ? 0 : 1;
    bool _1472 = !_1468;
    float _1474 = _1472 ? _225 : as_type<float>(_1416);
    int _1476 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1478 = _1476 != 0;
    bool _1480 = _1342 > 0.0;
    float _1482 = _429 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1484 = _1084 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1486 = ~_1470;
    int _1488 = _1486 + 1;
    int _1490 = _1488 + 1;
    float _1492 = fma(_457, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1252);
    float _1494 = fma(_435, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1482);
    float _1496 = _1086 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1498 = _1017 * _1464;
    bool _1500 = !_1478;
    float _1502 = _1500 ? _215 : as_type<float>(_1462);
    float _1504 = _1088 * 2.0;
    float _1506 = float(uint(_1250));
    float _1508 = -_1019;
    float _1510 = fma(_1484, 2.0, _1508);
    float _1512 = fma(_1496, -2.0, _1422);
    float _1514 = _1086 + _1084;
    float _1516 = fma(_457, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1494);
    float _1518 = as_type<float>(_1047) * _1506;
    float _1520 = fma(_457, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1442);
    int _1522 = _1490;
    float _1524 = _1442;
    if (!_1480)
    {
        int _1526 = ~_1470;
        int _1528 = _1526 + 1;
        _1522 = _1528;
    }
    int _1530 = _1522;
    float _1532 = _1086 + _1088;
    int _1534 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1536 = _1534 != 0;
    int _1538 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1540 = _1538 != 0;
    int _1542 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1544 = _1542 != 0;
    float _1546 = _1514 + (-1.0);
    float _1548 = trunc(_1518);
    float _1550 = precise::max(_1548, 0.0);
    uint _1552 = uint(_1550);
    float _1554 = _1532 + (-1.0);
    float _1556 = -_1055;
    float _1558 = _1556 + 1.0;
    if (!_1009)
    {
        _1386 = _1086;
    }
    float _1560 = _1386;
    float _1562 = -_145;
    float _1564 = fma(_1562, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1510);
    float _1566 = fma(_1546, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1568 = floor(_1504);
    float _1570 = fma(_1554, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1572 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1574 = _1001 + _1572;
    bool _1576 = _1001 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1578 = isnan(_1001);
    bool _1580 = _1576 || _1578;
    bool _1582 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1584 = _1580 || _1582;
    float _1586 = float(_1584);
    float _1588 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1590 = 1.0 + _1588;
    float _1592 = _1560;
    if (!_1009)
    {
        _1524 = _1088;
    }
    float _1594 = _1524;
    float _1596 = fma(_1498, _1574, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1598 = _1594;
    if (_1009)
    {
        _1592 = _1084;
    }
    float _1600 = _1592;
    float _1602 = -_1586;
    float _1604 = _1602 + 1.0;
    int _1606 = _1037 * int(_1552);
    int _1608 = _1606 + _1250;
    if (_1009)
    {
        _1598 = _1086;
    }
    float _1610 = _1598;
    float _1612 = 1.0 / _1590;
    float _1614 = _1282 * _1604;
    float _1616 = -_1282;
    float _1618 = _1616 + 1.0;
    float _1620 = float(uint(_1608));
    float _1622 = _1596 * _1614;
    bool _1624 = _1568 >= 0.0;
    bool _1626 = isnan(_1568);
    bool _1628 = _1624 || _1626;
    bool _1630 = isnan(0.0);
    bool _1632 = _1628 || _1630;
    float _1634 = fma(_1436, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1564);
    float _1636 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1638 = as_type<float>(_1047) * _1620;
    int _1640 = _1632 ? 0 : 1;
    float _1642 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _1644 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1646 = isnan(0.0);
    bool _1648 = _1644 || _1646;
    bool _1650 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1652 = _1648 || _1650;
    float _1654 = fma(_1600, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1636);
    float _1656 = _1600 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _1658 = _1346 >> 31;
    float _1660 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1512);
    float _1662 = _1652 ? _1558 : 0.0;
    float _1664 = _1474 + (-0.5);
    bool _1666 = _1568 > 0.0;
    float _1668 = trunc(_1638);
    float _1670 = precise::max(_1668, 0.0);
    uint _1672 = uint(_1670);
    float _1674 = _1662 * _1612;
    int _1676 = _1658 & 3;
    float _1678 = _1610 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1680 = -_1027;
    float _1682 = fma(_1656, 2.0, _1680);
    float _1684 = -_1664;
    float _1686 = -_1660;
    float _1688 = fma(_1684, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1686);
    int _1690 = _1346 + _1676;
    float _1692 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1694 = fma(_1618, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1622);
    float _1696 = _1502 + 0.5;
    int _1698 = _1690 >> 2;
    float _1700 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1702 = -_145;
    float _1704 = fma(_1702, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1682);
    int _1706 = ~_1013;
    int _1708 = _1706 + 1;
    float _1710 = _1642 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _1712 = _1698 << 4;
    int _1714 = _1712 + 368;
    float _1716 = fma(_1678, -2.0, _1700);
    int _1718 = int(_1552) + int(_1672);
    float _1720 = _1440 + (-0.5);
    int _1722 = ~_1640;
    int _1724 = _1722 + 1;
    int _1726 = _1724 + 1;
    float _1728 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1716);
    int _1730 = _1726;
    if (!_1666)
    {
        int _1732 = ~_1640;
        int _1734 = _1732 + 1;
        _1730 = _1734;
    }
    int _1736 = _1730;
    float _1738 = _1520 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1740 = _1692 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1742 = -_1710;
    float _1744 = -_1728;
    float _1746 = fma(_1742, _1720, _1744);
    bool _1748 = !_1540;
    int _1750 = _1748 ? 0 : 1;
    float _1752 = _1516 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1754 = fma(_1740, _1696, _1704);
    int _1756 = _1708 * _1718;
    int _1758 = _1756 + _1250;
    uint _1760 = uint(int(uint(_1714) >> uint(2)));
    uint _1762 = uint(int(uint(int(_1760)) >> uint(2)));
    int _1764 = int(_1760) & 3;
    float _1766 = (*spvDescriptorSet0.vp_c9)._m0[int(_1762)][_1764];
    int _1768 = int(_1760) + 1;
    uint _1770 = uint(int(uint(_1768) >> uint(2)));
    int _1772 = _1768 & 3;
    float _1774 = (*spvDescriptorSet0.vp_c9)._m0[int(_1770)][_1772];
    bool _1776 = !_1536;
    int _1778 = _1776 ? 0 : 1;
    float _1780 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1782 = _1738 + _1780;
    int _1784 = abs(_1750);
    float _1786 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1788 = _1752 + _1786;
    bool _1790 = uint(_1758) >= uint(_1013);
    float _1792 = fma(_1586, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1694);
    int _1794 = abs(_1778);
    int _1796 = _1714 + 8;
    uint _1798 = uint(int(uint(_1796) >> uint(2)));
    uint _1800 = uint(int(uint(int(_1798)) >> uint(2)));
    int _1802 = int(_1798) & 3;
    float _1804 = (*spvDescriptorSet0.vp_c9)._m0[int(_1800)][_1802];
    int _1806 = int(_1798) + 1;
    uint _1808 = uint(int(uint(_1806) >> uint(2)));
    int _1810 = _1806 & 3;
    float _1812 = (*spvDescriptorSet0.vp_c9)._m0[int(_1808)][_1810];
    bool _1814 = !_1790;
    int _1816 = _1814 ? 0 : (-1);
    float _1818 = _1782 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _1820 = uint(_1348) >= 2u;
    float _1822 = _1492 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1824 = float(_1434);
    float _1826 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1818);
    int _1828 = _1820 ? 0 : 1;
    float _1830 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1832 = _1822 + _1830;
    bool _1834 = _1348 != 3;
    float _1836 = _1792 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1838 = float(_1794);
    float _1840 = fma(_1832, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1826);
    float _1842 = float(_1736);
    float _1844 = float(_1784);
    out.m_74.w = _1836;
    int _1846 = ~_1828;
    int _1848 = _1846 + 1;
    int _1850 = _1848 + 1;
    float _1852 = _1838 * _1842;
    int _1854 = abs(_1392);
    float _1856 = _1844 * _1824;
    int _1858 = ~_1718;
    int _1860 = _1858 + _1816;
    int _1862 = _1860 + 1;
    int _1864 = _1850;
    int _1866 = as_type<int>(_1782);
    if (_1834)
    {
        int _1868 = ~_1828;
        int _1870 = _1868 + 1;
        _1864 = _1870;
    }
    int _1872 = _1864;
    int _1874 = _1013 * _1862;
    int _1876 = _1874 + _1250;
    bool _1878 = !_1350;
    int _1880 = _1878 ? 0 : 1;
    float _1882 = _1852 * (-2.0);
    float _1884 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1886 = _1348 != 3;
    float _1888 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1890 = abs(_1880);
    float _1892 = fma(_1084, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1884);
    int _1894 = abs(_1872);
    float _1896 = fma(_1086, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1888);
    int _1898 = ~_1854;
    int _1900 = _1898 + 1;
    int _1902 = _1900 + 1;
    float _1904 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1892);
    int _1906 = ~_1890;
    int _1908 = _1906 + 1;
    int _1910 = _1908 + 1;
    float _1912 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1896);
    int _1914 = _1902 * as_type<int>(_1774);
    int _1916 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1918 = _1916 != 0;
    float _1920 = -_1912;
    float _1922 = _1920 + 1.0;
    int _1924 = ~_1894;
    int _1926 = _1924 + 1;
    int _1928 = _1926 + 1;
    int _1930 = _1910 * as_type<int>(_1766);
    int _1932 = _1930 + _1914;
    float _1934 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1654);
    float _1936 = fma(_1474, _1922, _1688);
    float _1938 = _1782 * _1782;
    int _1940 = _1928 * as_type<int>(_1804);
    int _1942 = _1940 + _1932;
    float _1944 = -_1934;
    float _1946 = _1944 + 1.0;
    bool _1948 = !_1886;
    int _1950 = _1948 ? 0 : (-1);
    float _1952 = -_1904;
    float _1954 = _1952 + 1.0;
    bool _1956 = !_1918;
    int _1958 = _1956 ? 0 : 1;
    float _1960 = -_1946;
    float _1962 = fma(_1502, _1960, _1754);
    int _1964 = abs(_1950);
    float _1966 = fma(_1788, _1788, _1938);
    float _1968 = -_1954;
    float _1970 = fma(_1426, _1968, _1634);
    int _1972 = abs(_1958);
    float _1974 = in.m_76.x;
    float _1976 = in.m_76.y;
    float _1978 = in.m_76.z;
    float _1980 = -_1170;
    float _1982 = _1980 + 1.0;
    float _1984 = fma(_1832, _1832, _1966);
    bool _1986 = _1840 >= 0.0;
    float _1988 = fma(_1440, _1982, _1746);
    int _1990 = ~_1964;
    int _1992 = _1990 + 1;
    int _1994 = _1992 + 1;
    float _1996 = rsqrt(_1984);
    float _1998 = fma(_1566, _1882, _1566);
    bool _2000 = !_1033;
    int _2002 = _2000 ? _1876 : (-1);
    int _2004 = _1994 * as_type<int>(_1812);
    int _2006 = _2004 + _1942;
    int _2008 = ~_1972;
    int _2010 = _2008 + 1;
    int _2012 = _2010 + 1;
    out.m_78.x = _1970;
    out.m_78.y = _1936;
    out.m_78.z = _1962;
    out.m_78.w = _1988;
    bool _2014 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2016 = isnan(1.0);
    bool _2018 = _2014 || _2016;
    bool _2020 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2022 = _2018 || _2020;
    int _2024 = _2006 * _2012;
    float _2026 = _1856 * (-2.0);
    float _2028 = _1962;
    if (_1986)
    {
        out.m_61.x = 0.0;
    }
    int _2030 = _2002 * _1972;
    int _2032 = _2030 + _2024;
    float _2034 = _1782 * _1996;
    float _2036 = fma(_1882, _1974, _1974);
    float _2038 = _1788 * _1996;
    if (_1986)
    {
        _2028 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2040 = _2028;
    float _2042 = -_2034;
    float _2044 = fma(_2042, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1782);
    float _2046 = _1084 + (-0.5);
    float _2048 = -_2038;
    float _2050 = fma(_2048, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1788);
    float _2052 = fma(_1570, _2026, _1570);
    if (_1986)
    {
        float _2054 = _2040 * 5.0;
        _1866 = as_type<int>(_2054);
    }
    int _2056 = _1866;
    float _2058 = _2044 * _2044;
    float _2060 = float(_2032);
    float _2062 = fma(_2046, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2036);
    float _2064 = fma(_2026, _1976, _1976);
    if (_1986)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7418 = as_type<float>(_2056);
        out.gl_Position.z = _7418;
    }
    float _2066 = fma(_2050, _2050, _2058);
    bool _2068 = !_1544;
    int _2070 = _2068 ? 0 : 1;
    out.m_80.x = _2060;
    if (_1986)
    {
        return out;
    }
    float _2072 = -_2034;
    float _2074 = fma(_2072, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1738);
    float _2076 = _1832 * _1996;
    bool _2078 = !_2022;
    float _2080 = _2078 ? _145 : _1674;
    float _2082 = -_2038;
    float _2084 = fma(_2082, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1752);
    float _2086 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2088 = _2074 + _2086;
    float _2090 = -_2076;
    float _2092 = fma(_2090, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1832);
    float _2094 = -_2076;
    float _2096 = fma(_2094, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1822);
    float _2098 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2100 = _2084 + _2098;
    float _2102 = _2088 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2104 = fma(_2092, _2092, _2066);
    float _2106 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2108 = _2096 + _2106;
    int _2110 = abs(_2070);
    float _2112 = fma(_2100, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2102);
    float _2114 = float(_1530);
    float _2116 = _1086 + (-0.5);
    float _2118 = _1088 + _1084;
    float _2120 = fma(_2108, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2112);
    float _2122 = float(_2110);
    float _2124 = fma(_2116, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2064);
    float _2126 = fma(_2080, _1998, _2062);
    float _2128 = _1088 + (-0.5);
    bool _2130 = _2120 >= 0.0;
    float _2132 = _2122 * _2114;
    float _2134 = fma(_2080, _2052, _2124);
    float _2136 = _2118 + (-1.0);
    float _2138 = _2126 * 0.15915493667125701904296875;
    float _2140 = _2132 * (-2.0);
    float _2142 = sqrt(_2104);
    float _2144 = fma(_2136, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2146 = fma(_2140, _1978, _1978);
    float _2148 = _2134 * 0.15915493667125701904296875;
    float _2150 = fma(_2144, _2140, _2144);
    float _2152 = _2114;
    int _2154 = as_type<int>(_2128);
    float _2156 = _2088;
    float _2158 = _2100;
    if (_2130)
    {
        _2152 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2160 = _2152;
    float _2162 = fma(_2128, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2146);
    float _2164 = _2138 * 6.283185482025146484375;
    float _2166 = sin(_2164);
    if (_2130)
    {
        out.m_61.x = 0.0;
    }
    if (_2130)
    {
        float _2168 = _2160 * 5.0;
        _2154 = as_type<int>(_2168);
    }
    int _2170 = _2154;
    float _2172 = fma(_2080, _2150, _2162);
    float _2174 = _2138 * 6.283185482025146484375;
    float _2176 = cos(_2174);
    if (_2130)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7609 = as_type<float>(_2170);
        out.gl_Position.z = _7609;
    }
    float _2178 = _2172 * 0.15915493667125701904296875;
    float _2180 = _2148 * 6.283185482025146484375;
    float _2182 = sin(_2180);
    float _2184 = _2148 * 6.283185482025146484375;
    float _2186 = cos(_2184);
    if (_2130)
    {
        return out;
    }
    float _2188 = _2178 * 6.283185482025146484375;
    float _2190 = cos(_2188);
    float _2192 = _1996 * _2142;
    float _2194 = _671 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2196 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _225);
    float _2198 = _669 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2200 = _2176 * _2182;
    float _2202 = _2192 * _2194;
    float _2204 = _2166 * _2182;
    float _2206 = _2178 * 6.283185482025146484375;
    float _2208 = sin(_2206);
    float _2210 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _215);
    float _2212 = _2196 * _2202;
    float _2214 = _2176 * _2186;
    float _2216 = _2192 * _2198;
    float _2218 = _2166 * _2186;
    float _2220 = _2176 * _2190;
    float _2222 = _2210 * _2216;
    float _2224 = _2166 * _2190;
    float _2226 = _2186 * _2190;
    float _2228 = _2220 * _2212;
    float _2230 = _2182 * _2190;
    float _2232 = _2192 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2234 = _2232 * 0.5;
    float _2236 = _2220 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2238 = fma(_2208, _2214, _2204);
    float _2240 = -_2218;
    float _2242 = fma(_2208, _2200, _2240);
    float _2244 = -_2212;
    float _2246 = _2208 * _2244;
    float _2248 = -_2200;
    float _2250 = fma(_2208, _2218, _2248);
    float _2252 = fma(_2238, _2222, _2228);
    float _2254 = _2224 * _2212;
    float _2256 = fma(_2226, _2222, _2246);
    float _2258 = fma(_2208, _2204, _2214);
    float _2260 = fma(_2242, _2234, _2252);
    float _2262 = fma(_2250, _2222, _2254);
    float _2264 = fma(_2230, _2234, _2256);
    float _2266 = _2238 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2268 = _2260 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2270 = _2260 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2272 = fma(_2258, _2234, _2262);
    float _2274 = _2238 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2276 = fma(_2264, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2268);
    float _2278 = fma(_2264, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2270);
    float _2280 = _2238 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2282 = _2260 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2284 = fma(_2272, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2276);
    float _2286 = fma(_2272, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2278);
    float _2288 = fma(_2226, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2266);
    float _2290 = fma(_2226, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2274);
    float _2292 = _2284 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2294 = _2286 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2296 = fma(_2226, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2280);
    float _2298 = _2220 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2300 = _1752 + _2292;
    float _2302 = _1822 + _2294;
    float _2304 = _2220 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2306 = fma(_2264, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2282);
    float _2308 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2310 = _2300 + _2308;
    float _2312 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2314 = _2302 + _2312;
    float _2316 = -_2208;
    float _2318 = fma(_2316, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2298);
    float _2320 = -_2208;
    float _2322 = fma(_2320, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2304);
    float _2324 = _2310 * _2310;
    float _2326 = _2314 * _2314;
    float _2328 = fma(_2272, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2306);
    float _2330 = -_2208;
    float _2332 = fma(_2330, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2236);
    float _2334 = fma(_2250, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2288);
    float _2336 = _2324 + _2326;
    float _2338 = _2242 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2340 = _2242 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2342 = _2242 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2344 = sqrt(_2336);
    float _2346 = _2328 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2348 = fma(_2250, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2290);
    float _2350 = fma(_2230, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2338);
    float _2352 = fma(_2230, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2340);
    float _2354 = fma(_2230, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2342);
    float _2356 = fma(_2250, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2296);
    float _2358 = _1738 + _2346;
    bool _2360 = _2344 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _2362 = !_2360;
    float _2364 = _2358;
    float _2366 = _2324;
    float _2368 = _2326;
    float _2370 = _2300;
    float _2372 = _2302;
    float _2374 = _2242;
    float _2376 = _2258;
    if (!_2362)
    {
        float _2378 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2380 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2382 = _2344 + _2380;
        float _2384 = _2358 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2386 = rsqrt(_2336);
        float _2388 = _2382 * _2378;
        float _2390 = _2388 * 0.15915493667125701904296875;
        float _2392 = _2390 * 6.283185482025146484375;
        float _2394 = sin(_2392);
        float _2396 = _2390 * 6.283185482025146484375;
        float _2398 = cos(_2396);
        float _2400 = fma(_2394, _2384, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2402 = _2386 * _2400;
        float _2404 = _2398 + (-1.0);
        float _2406 = fma(_2310, _2402, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2408 = fma(_2314, _2402, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2410 = _2404 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2412 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2414 = _2406 + _2412;
        float _2416 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2418 = _2408 + _2416;
        float _2420 = fma(_2358, _2398, _2410);
        float _2422 = _2414 * _2414;
        float _2424 = _2418 * _2418;
        _2364 = _2420;
        _2366 = _2422;
        _2368 = _2424;
        _2370 = _2406;
        _2372 = _2408;
        _2374 = _2390;
    }
    float _2426 = _2364;
    float _2428 = _2366;
    float _2430 = _2368;
    float _2432 = _2370;
    float _2434 = _2372;
    float _2436 = _2374;
    float _2438 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2440 = _2426 + _2438;
    float _2442 = fma(_2224, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2318);
    float _2444 = fma(_2224, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2322);
    float _2446 = _225 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2448 = fma(_2440, _2440, _2428);
    float _2450 = fma(_2224, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2332);
    float _2452 = _215 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2454 = _2446 * _2442;
    float _2456 = _2448 + _2430;
    float _2458 = _2446 * _2444;
    float _2460 = _2446 * _2450;
    float _2462 = fma(_2258, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2350);
    float _2464 = fma(_2258, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2352);
    float _2466 = fma(_2258, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2354);
    float _2468 = sqrt(_2456);
    float _2470 = fma(_2452, _2334, _2454);
    float _2472 = fma(_2452, _2348, _2458);
    float _2474 = fma(_2452, _2356, _2460);
    float _2476 = _2462 + _2470;
    float _2478 = _2464 + _2472;
    float _2480 = _2466 + _2474;
    out.m_82.x = _2476;
    out.m_82.y = _2478;
    out.m_82.z = _2480;
    bool _2482 = _2468 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2484 = isnan(_2468);
    bool _2486 = _2482 || _2484;
    bool _2488 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2490 = _2486 || _2488;
    float _2492 = _2436;
    float _2494 = _2474;
    if (!_2490)
    {
        _2376 = 1.0;
    }
    float _2496 = _2376;
    bool _2498 = !_2490;
    float _2500 = _2496;
    if (!_2498)
    {
        bool _2502 = _2468 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2504 = isnan(_2468);
        bool _2506 = _2502 || _2504;
        bool _2508 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2510 = _2506 || _2508;
        if (!_2510)
        {
            float _2512 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2514 = _2468 + _2512;
            float _2516 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2518 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2516;
            float _2520 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2522 = _2520 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2524 = 1.0 / _2518;
            float _2526 = _2514 * _2524;
            float _2528 = fma(_2526, _2522, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2500 = _2528;
            _2530 = true;
        }
        else
        {
            bool _2532 = _2468 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2534 = isnan(_2468);
            bool _2536 = _2532 || _2534;
            bool _2538 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2540 = _2536 || _2538;
            if (!_2540)
            {
                float _2542 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2544 = _2468 + _2542;
                float _2546 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2548 = _2546 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2550 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2552 = _2550 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2554 = 1.0 / _2548;
                float _2556 = _2544 * _2554;
                float _2558 = fma(_2556, _2552, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2500 = _2558;
                _2530 = true;
            }
            else
            {
                _2500 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2530 = false;
    float _2560 = _2500;
    float _2562 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2564 = _2426 + _2562;
    float _2566 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2568 = _2432 + _2566;
    float _2570 = fma(_2564, _2560, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2572 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2574 = _2434 + _2572;
    float _2576 = fma(_2568, _2560, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2578 = -_1738;
    float _2580 = _2578 + _2570;
    float _2582 = fma(_2574, _2560, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2584 = -_1752;
    float _2586 = _2584 + _2576;
    float _2588 = _2580 * _2580;
    float _2590 = -_1822;
    float _2592 = _2590 + _2582;
    float _2594 = fma(_2586, _2586, _2588);
    float _2596 = fma(_2592, _2592, _2594);
    float _2598 = sqrt(_2596);
    bool _2600 = _2598 > 0.0;
    bool _2602 = !_2600;
    float _2604 = _2576;
    float _2606 = _2570;
    float _2608 = _2582;
    if (!_2602)
    {
        bool _2610 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2612 = _2598;
        if (_2610)
        {
            float _2614 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2612 = _2614;
        }
        float _2616 = _2612;
        float _2618 = _2616;
        if (_2610)
        {
            float _2620 = _459 * _2616;
            _2492 = _2620;
        }
        float _2622 = _2492;
        float _2624 = _2622;
        if (_2610)
        {
            float _2626 = _461 * _2616;
            _2494 = _2626;
        }
        float _2628 = _2494;
        float _2630 = _2628;
        if (_2610)
        {
            float _2632 = _463 * _2616;
            _2618 = _2632;
        }
        float _2634 = _2618;
        float _2636 = _2634;
        if (!_2610)
        {
            float _2638 = _145 + 1.0;
            if (!_181)
            {
                float _2640 = _2638 * _2638;
                float _2642 = _2640 * 0.5;
                _147 = _2642;
            }
            float _2644 = _147;
            float _2646 = _2644;
            if (!_181)
            {
                float _2648 = _2644 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2646 = _2648;
            }
            float _2650 = _2646;
            bool _2652 = !_181;
            float _2654 = _2650;
            if (!_2652)
            {
                float _2656 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2658 = log2(_2656);
                float _2660 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2662 = _2660 + 1.0;
                float _2664 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2666 = _2658 * _2638;
                float _2668 = exp2(_2666);
                float _2670 = _2664 * 0.693147182464599609375;
                float _2672 = 1.0 / _2670;
                float _2674 = 1.0 / _2662;
                float _2676 = _2668 + (-1.0);
                float _2678 = -_2676;
                float _2680 = fma(_2678, _2672, _2638);
                float _2682 = _2680 * _2674;
                float _2684 = _2682 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2654 = _2684;
            }
            float _2686 = _2654;
            float _2688 = _2686 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _2690 = _2686 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2692 = _2686 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2694 = _2688 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
            float _2696 = _2688 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
            float _2698 = fma(_2690, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2694);
            float _2700 = _2688 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
            float _2702 = fma(_2690, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2696);
            float _2704 = _2696;
            if (!_181)
            {
                _2704 = _2638;
            }
            float _2706 = _2704;
            float _2708 = fma(_2692, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2698);
            bool _2710 = !_181;
            float _2712 = _2706;
            if (!_2710)
            {
                float _2714 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2716 = log2(_2714);
                float _2718 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2720 = _2718 + 1.0;
                float _2722 = 1.0 / _2720;
                float _2724 = _2716 * _2638;
                float _2726 = exp2(_2724);
                float _2728 = -_2726;
                float _2730 = _2728 + 1.0;
                float _2732 = _2730 * _2722;
                _2712 = _2732;
            }
            float _2734 = _2712;
            float _2736 = fma(_2692, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2702);
            float _2738 = fma(_2734, _185, _2708);
            float _2740 = fma(_2690, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2700);
            float _2742 = fma(_2734, _183, _2736);
            float _2744 = -_421;
            float _2746 = _2744 + _2738;
            float _2748 = fma(_2692, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2740);
            float _2750 = -_423;
            float _2752 = _2750 + _2742;
            float _2754 = _2746 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _2756 = _2746 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _2758 = fma(_2734, _187, _2748);
            float _2760 = _2746 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _2762 = fma(_2752, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2754);
            float _2764 = fma(_2752, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2756);
            float _2766 = -_425;
            float _2768 = _2766 + _2758;
            float _2770 = fma(_2752, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2760);
            float _2772 = fma(_2768, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2762);
            float _2774 = fma(_2768, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2764);
            float _2776 = fma(_2768, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2770);
            _467 = _2774;
            _469 = _2772;
            _471 = _2776;
            _2624 = _2772;
            _2630 = _2774;
            _2636 = _2776;
        }
        float _2778 = _467;
        float _2780 = _469;
        float _2782 = _471;
        float _2784 = _2624;
        float _2786 = _2630;
        float _2788 = _2636;
        float _2790 = _2778 * _2778;
        float _2792 = fma(_2780, _2780, _2790);
        float _2794 = fma(_2782, _2782, _2792);
        float _2796 = rsqrt(_2596);
        float _2798 = sqrt(_2794);
        float _2800 = _2586 * _2796;
        float _2802 = _2580 * _2796;
        float _2804 = _2592 * _2796;
        bool _2806 = _2798 > 0.0;
        bool _2808 = !_2806;
        if (!_2808)
        {
            float _2810 = rsqrt(_2794);
            float _2812 = _2810 * _2778;
            float _2814 = _2810 * _2780;
            float _2816 = _2810 * _2782;
            float _2818 = _2802 * _2812;
            float _2820 = fma(_2800, _2814, _2818);
            float _2822 = fma(_2804, _2816, _2820);
            float _2824 = _2822 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2826 = fma(_2784, _2824, _2576);
            float _2828 = fma(_2786, _2824, _2570);
            float _2830 = fma(_2788, _2824, _2582);
            _2604 = _2826;
            _2606 = _2828;
            _2608 = _2830;
        }
    }
    float _2832 = _2604;
    float _2834 = _2606;
    float _2836 = _2608;
    float _2838 = fma(_2084, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2840 = fma(_2096, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2842 = floor(_2838);
    float _2844 = floor(_2840);
    float _2846 = -_2842;
    float _2848 = _2838 + _2846;
    float _2850 = -_2844;
    float _2852 = _2840 + _2850;
    float2 _8736 = float2(_2848, _2852);
    float _2854 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8736, float2(0.0), isnan(_8736)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8736, float2(0.0), isnan(_8736)), level(0.0)).x;
    float _2856 = _2074 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2858 = -_2038;
    float _2860 = fma(_2858, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2832);
    float _2862 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2856);
    float _2864 = -_2034;
    float _2866 = fma(_2864, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2834);
    float _2868 = fma(_2096, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2862);
    float _2870 = _2074 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2872 = _2868 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2874 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2870);
    float _2876 = 1.0 / _2872;
    float _2878 = fma(_2096, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2874);
    float _2880 = _2878 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2882 = _2880 + _2872;
    float _2884 = _2882 * _2876;
    float _2886 = _2884 * 0.5;
    float _2888 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2890 = fma(_2886, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2888);
    float _2892 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _2894 = _2074 + _2892;
    float _2896 = 1.0 / _2890;
    float _2898 = _2894 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _2900 = _2894 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2902 = fma(_2084, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2898);
    float _2904 = fma(_2084, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2900);
    float _2906 = fma(_2096, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2902);
    float _2908 = fma(_2096, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2904);
    float _2910 = _2906 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _2912 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2914 = _2896 * _2912;
    float _2916 = _2908 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _2918 = trunc(_2910);
    int _2920 = int(_2918);
    bool _2922 = _2914 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _2924 = _2914 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _2926 = !_2922;
    int _2928 = _2926 ? 0 : 1;
    float _2930 = trunc(_2916);
    int _2932 = int(_2930);
    int _2934 = 2;
    float _2936 = _2866;
    float _2938 = _2860;
    float _2940 = _2834;
    float _2942 = _2910;
    float _2944 = _2916;
    float _2946 = _2894;
    if (!_2922)
    {
        _2934 = 1;
    }
    int _2948 = _2934;
    int _2950 = _2948;
    if (!_2924)
    {
        _2950 = _2928;
    }
    int _2952 = _2950;
    int _2954 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2956 = _2920 + _2954;
    int _2958 = _2956 + 1;
    int _2960 = _2952 << 6;
    bool _2962 = _2958 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _2964 = _2960 + 48;
    uint _2966 = uint(int(uint(_2964) >> uint(2)));
    uint _2968 = uint(int(uint(int(_2966)) >> uint(2)));
    int _2970 = int(_2966) & 3;
    float _2972 = (*spvDescriptorSet0.vp_c15)._m0[int(_2968)][_2970];
    int _2974 = int(_2966) + 1;
    uint _2976 = uint(int(uint(_2974) >> uint(2)));
    int _2978 = _2974 & 3;
    float _2980 = (*spvDescriptorSet0.vp_c15)._m0[int(_2976)][_2978];
    int _2982 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2984 = _2932 + _2982;
    int _2986 = _2984 + 1;
    int _2988 = _2958 | _2986;
    int _2990 = _2960 + 56;
    uint _2992 = uint(int(uint(_2990) >> uint(2)));
    uint _2994 = uint(int(uint(int(_2992)) >> uint(2)));
    int _2996 = int(_2992) & 3;
    float _2998 = (*spvDescriptorSet0.vp_c15)._m0[int(_2994)][_2996];
    int _3000 = int(_2992) + 1;
    uint _3002 = uint(int(uint(_3000) >> uint(2)));
    int _3004 = _3000 & 3;
    float _3006 = (*spvDescriptorSet0.vp_c15)._m0[int(_3002)][_3004];
    bool _3008 = _2988 < 0;
    bool _3010 = _3008 || _2962;
    bool _3012 = _2986 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _3014 = _3012 || _3010;
    bool _3016 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _3018 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _3020 = _3016 || _3018;
    bool _3022 = isnan(0.5);
    bool _3024 = _3020 || _3022;
    int _3026 = _2960 + 64;
    uint _3028 = uint(int(uint(_3026) >> uint(2)));
    uint _3030 = uint(int(uint(int(_3028)) >> uint(2)));
    int _3032 = int(_3028) & 3;
    float _3034 = (*spvDescriptorSet0.vp_c15)._m0[int(_3030)][_3032];
    int _3036 = int(_3028) + 1;
    uint _3038 = uint(int(uint(_3036) >> uint(2)));
    int _3040 = _3036 & 3;
    float _3042 = (*spvDescriptorSet0.vp_c15)._m0[int(_3038)][_3040];
    float _3044 = -_2076;
    float _3046 = fma(_3044, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2836);
    int _3048 = _2960 + 72;
    uint _3050 = uint(int(uint(_3048) >> uint(2)));
    uint _3052 = uint(int(uint(int(_3050)) >> uint(2)));
    int _3054 = int(_3050) & 3;
    float _3056 = (*spvDescriptorSet0.vp_c15)._m0[int(_3052)][_3054];
    int _3058 = int(_3050) + 1;
    uint _3060 = uint(int(uint(_3058) >> uint(2)));
    int _3062 = _3058 & 3;
    float _3064 = (*spvDescriptorSet0.vp_c15)._m0[int(_3060)][_3062];
    int _3066 = _2986;
    float _3068 = _3046;
    float _3070 = as_type<float>(_2952);
    if (!_3014)
    {
        int _3072 = _2986 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _3074 = _3072 + _2958;
        _3066 = _3074;
    }
    int _3076 = _3066;
    int _3078 = _2960 + 96;
    uint _3080 = uint(int(uint(_3078) >> uint(2)));
    uint _3082 = uint(int(uint(int(_3080)) >> uint(2)));
    int _3084 = int(_3080) & 3;
    float _3086 = (*spvDescriptorSet0.vp_c15)._m0[int(_3082)][_3084];
    int _3088 = int(_3080) + 1;
    uint _3090 = uint(int(uint(_3088) >> uint(2)));
    int _3092 = _3088 & 3;
    float _3094 = (*spvDescriptorSet0.vp_c15)._m0[int(_3090)][_3092];
    int _3096 = _2960 + 104;
    uint _3098 = uint(int(uint(_3096) >> uint(2)));
    uint _3100 = uint(int(uint(int(_3098)) >> uint(2)));
    int _3102 = int(_3098) & 3;
    float _3104 = (*spvDescriptorSet0.vp_c15)._m0[int(_3100)][_3102];
    int _3106 = int(_3098) + 1;
    uint _3108 = uint(int(uint(_3106) >> uint(2)));
    int _3110 = _3106 & 3;
    float _3112 = (*spvDescriptorSet0.vp_c15)._m0[int(_3108)][_3110];
    int _3114 = as_type<int>(_3094);
    int _3116 = as_type<int>(_3086);
    if (!_3024)
    {
        float _3118 = _2088 * _2088;
        float _3120 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3122 = -_1822;
        float _3124 = _3122 + _2836;
        float _3126 = fma(_2100, _2100, _3118);
        float _3128 = fma(_2108, _2108, _3126);
        float _3130 = 1.0 / _2192;
        float _3132 = sqrt(_3128);
        float _3134 = precise::min(_3132, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3136 = _3134 * _3120;
        float _3138 = -_1738;
        float _3140 = _3138 + _2834;
        float _3142 = _3136 * _3130;
        float _3144 = -_1752;
        float _3146 = _3144 + _2832;
        float _3148 = fma(_3140, _3142, _2074);
        float _3150 = fma(_3146, _3142, _2084);
        float _3152 = fma(_3124, _3142, _2096);
        _2936 = _3148;
        _2938 = _3150;
        _3068 = _3152;
        _2156 = _3118;
        _2158 = _3132;
    }
    float _3154 = _2936;
    float _3156 = _2938;
    float _3158 = _3068;
    float _3160 = _2156;
    float _3162 = _2158;
    float _3164 = _2894 * _3094;
    float _3166 = _3160;
    float _3168 = _3162;
    if (!_3014)
    {
        int _3170 = _3076 << 2;
        _3114 = _3170;
    }
    int _3172 = _3114;
    float _3174 = _3154 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3176 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3178 = fma(_2084, _3086, _3164);
    int _3180 = _3172;
    if (!_3014)
    {
        uint _3182 = uint(int(uint(_3076) >> uint(2)));
        _3116 = int(_3182);
    }
    int _3184 = _3116;
    float _3186 = fma(_3156, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3174);
    if (!_3014)
    {
        int _3188 = 12 & _3172;
        _3180 = _3188;
    }
    int _3190 = _3180;
    float _3192 = fma(_2096, _3104, _3178);
    float _3194 = fma(_3158, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3186);
    if (!_3014)
    {
        int _3196 = _3184 << 4;
        int _3198 = _3196 + _3190;
        _2940 = as_type<float>(_3198);
    }
    float _3200 = _2940;
    float _3202 = _3192 + _3112;
    int _3204 = _2960 + 80;
    uint _3206 = uint(int(uint(_3204) >> uint(2)));
    uint _3208 = uint(int(uint(int(_3206)) >> uint(2)));
    int _3210 = int(_3206) & 3;
    float _3212 = (*spvDescriptorSet0.vp_c15)._m0[int(_3208)][_3210];
    int _3214 = int(_3206) + 1;
    uint _3216 = uint(int(uint(_3214) >> uint(2)));
    int _3218 = _3214 & 3;
    float _3220 = (*spvDescriptorSet0.vp_c15)._m0[int(_3216)][_3218];
    float _3222 = _2894 * _2980;
    float _3224 = _2894 * _3042;
    float _3226 = _3194 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3228 = 1.0 / _3202;
    float _3230 = fma(_2084, _2972, _3222);
    float _3232 = fma(_2084, _3034, _3224);
    float _3234 = _3226 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3236 = _3200;
    if (!_3014)
    {
        int _3238 = as_type<int>(_3200) + 400;
        uint _3240 = uint(int(uint(_3238) >> uint(2)));
        uint _3242 = uint(int(uint(int(_3240)) >> uint(2)));
        int _3244 = int(_3240) & 3;
        float _3246 = (*spvDescriptorSet0.vp_c15)._m0[int(_3242)][_3244];
        _3236 = _3246;
    }
    float _3248 = _3236;
    float _3250 = _3154 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3252 = fma(_2096, _2998, _3230);
    float _3254 = -_3234;
    float _3256 = fma(_3254, _3176, 1.0);
    float _3258 = _3154 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3260 = fma(_3156, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3250);
    float _3262 = _3252 + _3006;
    float _3264 = fma(_2096, _3056, _3232);
    int _3266 = _2960 + 88;
    uint _3268 = uint(int(uint(_3266) >> uint(2)));
    uint _3270 = uint(int(uint(int(_3268)) >> uint(2)));
    int _3272 = int(_3268) & 3;
    float _3274 = (*spvDescriptorSet0.vp_c15)._m0[int(_3270)][_3272];
    int _3276 = int(_3268) + 1;
    uint _3278 = uint(int(uint(_3276) >> uint(2)));
    int _3280 = _3276 & 3;
    float _3282 = (*spvDescriptorSet0.vp_c15)._m0[int(_3278)][_3280];
    float _3284 = fma(_3156, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3258);
    float _3286 = fma(_3158, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3260);
    float _3288 = _3264 + _3064;
    float _3290 = _3262 * _3228;
    float _3292 = fma(_3158, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3284);
    float _3294 = _3154 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3296 = _3288 * _3228;
    float _3298 = _3286 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    bool _3300 = _3290 >= 0.0;
    float _3302 = _3292 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3304 = fma(_3156, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3294);
    float _3306 = log2(_3256);
    bool _3308 = _3290 <= 1.0;
    bool _3310 = _3308 && _3300;
    float _3312 = _3302 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3314 = fma(_3158, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3304);
    bool _3316 = _3296 >= 0.0;
    bool _3318 = _3316 && _3310;
    float _3320 = fma(_3298, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3312);
    float _3322 = _3314 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3324 = _3302 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    bool _3326 = _3296 <= 1.0;
    bool _3328 = _3326 && _3318;
    float _3330 = fma(_3226, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3320);
    float _3332 = _3176;
    if (!_3014)
    {
        float _3334 = floor(_2910);
        _3332 = _3334;
    }
    float _3336 = _3332;
    float _3338 = fma(_3322, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3330);
    float _3340 = _3306 * 0.693147182464599609375;
    float _3342 = 1.0 / _3338;
    float _3344 = _2894 * _3220;
    float _3346 = _3302 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3348 = _3340;
    if (_3328)
    {
        float _3350 = float(_2952);
        _3070 = _3350;
    }
    float _3352 = _3070;
    float _3354 = _3340 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3356 = fma(_2084, _3212, _3344);
    float _3358 = fma(_3298, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3324);
    float _3360 = fma(_3298, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3346);
    float _3362 = _3256;
    if (!_3014)
    {
        float _3364 = floor(_2916);
        _3362 = _3364;
    }
    float _3366 = _3362;
    if (!_3014)
    {
        float _3368 = -_3336;
        float _3370 = _2910 + _3368;
        _2942 = _3370;
    }
    float _3372 = _2942;
    float _3374 = fma(_3226, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3358);
    float _3376 = fma(_3226, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3360);
    float _3378 = fma(_3322, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3374);
    float _3380 = fma(_3322, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3376);
    float _3382 = _3248;
    float _3384 = _3378;
    if (!_3014)
    {
        float _3386 = rint(_3248);
        float _3388 = precise::max(_3386, 0.0);
        uint _3390 = uint(_3388);
        uint _3392 = clamp(_3390, 0u, 65535u);
        _3382 = as_type<float>(_3392);
    }
    float _3394 = _3382;
    float _3396 = fma(_2096, _3274, _3356);
    float _3398 = _3380 * _3342;
    float _3400 = _3396 + _3282;
    float _3402 = _3378 * _3342;
    float _3404 = fma(_3398, -0.5, 0.5);
    float _3406 = _3356;
    float _3408 = _3402;
    if (_3328)
    {
        float _3410 = rint(_3352);
        float _3412 = precise::max(_3410, 0.0);
        uint _3414 = uint(_3412);
        uint _3416 = clamp(_3414, 0u, 65535u);
        _3406 = as_type<float>(_3416);
    }
    float _3418 = _3406;
    if (!_3014)
    {
        float _3420 = -_3366;
        float _3422 = _2916 + _3420;
        _3166 = _3422;
    }
    float _3424 = _3166;
    float _3426 = _3400 * _3228;
    float _3428 = fma(_3402, 0.5, 0.5);
    float _3430 = _3394;
    if (!_3014)
    {
        float3 _9710 = float3(_3372, _3424, float(as_type<int>(_3394)));
        float3 _9714 = select(_9710, float3(0.0), isnan(_9710));
        float _3432 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _9714.xy, uint(rint(_9714.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _9714.xy, uint(rint(_9714.z)), level(0.0)).x;
        _3430 = _3432;
    }
    float _3434 = _3430;
    float _3436 = _3296;
    if (_3328)
    {
        float3 _9729 = float3(_3290, _3296, float(as_type<int>(_3418)));
        float3 _9731 = select(_9729, float3(0.0), isnan(_9729));
        float _3438 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _9731.xy, uint(rint(_9731.z)), _3426, level(0.0));
        _3436 = _3438;
    }
    float _3440 = _3436;
    float3 _9741 = float3(_3428, _3404, _3354);
    float _3442 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9741, float3(0.0), isnan(_9741)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9741, float3(0.0), isnan(_9741)), level(0.0)).x;
    float3 _9750 = float3(_3428, _3404, _3354);
    float4 _3445 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9750, float3(0.0), isnan(_9750)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9750, float3(0.0), isnan(_9750)), level(0.0)).xyzw;
    float _3447 = _3445.x;
    float _3449 = _3445.y;
    float _3451 = _3445.z;
    float _3453 = _3445.w;
    if (_3014)
    {
        _2944 = 1.0;
    }
    float _3455 = _2944;
    bool _3457 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _3459 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3461 = _3457 || _3459;
    bool _3463 = isnan(0.5);
    bool _3465 = _3461 || _3463;
    float _3467 = _3455;
    if (_3465)
    {
        _3348 = 1.0;
    }
    float _3469 = _3348;
    float _3471 = _3469;
    if (_3465)
    {
        _3168 = 1.0;
    }
    float _3473 = _3168;
    float _3475 = _3473;
    if (!_3465)
    {
        float _3477 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _3479 = _3477 * 0.15915493667125701904296875;
        float _3481 = _3479 * 6.283185482025146484375;
        float _3483 = cos(_3481);
        float _3485 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _3487 = _3485 * 0.15915493667125701904296875;
        float _3489 = _3479 * 6.283185482025146484375;
        float _3491 = sin(_3489);
        float _3493 = 1.0 / _3483;
        float _3495 = _3487 * 6.283185482025146484375;
        float _3497 = cos(_3495);
        float _3499 = _3491 * _3493;
        float _3501 = _3487 * 6.283185482025146484375;
        float _3503 = sin(_3501);
        float _3505 = _3497 * _3499;
        float _3507 = 1.0 / _3505;
        float _3509 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3511 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3509;
        float _3513 = 1.0 / _3511;
        float _3515 = _3503 * _3507;
        float _3517 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3519 = fma(_2914, _3515, _3517);
        float _3521 = _3519 * _3513;
        float _3523 = precise::clamp(_3521, 0.0, 1.0);
        _3408 = _3493;
        _3475 = _3523;
    }
    float _3525 = _3408;
    float _3527 = _3475;
    float _3529 = _3525;
    if (!_3465)
    {
        float _3531 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _3533 = _3531 * 0.15915493667125701904296875;
        float _3535 = _3533 * 6.283185482025146484375;
        float _3537 = cos(_3535);
        float _3539 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _3541 = _3539 * 0.15915493667125701904296875;
        float _3543 = _3533 * 6.283185482025146484375;
        float _3545 = sin(_3543);
        float _3547 = 1.0 / _3537;
        float _3549 = _3541 * 6.283185482025146484375;
        float _3551 = cos(_3549);
        float _3553 = _3545 * _3547;
        float _3555 = _3541 * 6.283185482025146484375;
        float _3557 = sin(_3555);
        float _3559 = _3551 * _3553;
        float _3561 = 1.0 / _3559;
        float _3563 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3565 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _3563;
        float _3567 = 1.0 / _3565;
        float _3569 = _3557 * _3561;
        float _3571 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3573 = fma(_2914, _3569, _3571);
        float _3575 = _3573 * _3567;
        float _3577 = precise::clamp(_3575, 0.0, 1.0);
        float _3579 = -_3577;
        float _3581 = _3579 + 1.0;
        _3529 = _3533;
        _3471 = _3581;
    }
    float _3583 = _3529;
    float _3585 = _3471;
    float _3587 = _3583;
    if (!_3014)
    {
        int _3589 = _3076 << 4;
        int _3591 = _3589 + 2048;
        uint _3593 = uint(int(uint(_3591) >> uint(2)));
        uint _3595 = uint(int(uint(int(_3593)) >> uint(2)));
        int _3597 = int(_3593) & 3;
        float _3599 = (*spvDescriptorSet0.vp_c15)._m0[int(_3595)][_3597];
        int _3601 = int(_3593) + 1;
        uint _3603 = uint(int(uint(_3601) >> uint(2)));
        int _3605 = _3601 & 3;
        float _3607 = (*spvDescriptorSet0.vp_c15)._m0[int(_3603)][_3605];
        int _3609 = _3591 + 8;
        uint _3611 = uint(int(uint(_3609) >> uint(2)));
        uint _3613 = uint(int(uint(int(_3611)) >> uint(2)));
        int _3615 = int(_3611) & 3;
        float _3617 = (*spvDescriptorSet0.vp_c15)._m0[int(_3613)][_3615];
        int _3619 = int(_3611) + 1;
        uint _3621 = uint(int(uint(_3619) >> uint(2)));
        int _3623 = _3619 & 3;
        float _3625 = (*spvDescriptorSet0.vp_c15)._m0[int(_3621)][_3623];
        float _3627 = _2894 * _3607;
        float _3629 = fma(_2084, _3599, _3627);
        float _3631 = fma(_2096, _3617, _3629);
        float _3633 = _3631 + _3625;
        float _3635 = precise::clamp(_3633, 0.0, 1.0);
        float _3637 = -_3635;
        float _3639 = _3637 + _3434;
        float _3641 = fma(_3639, 500.0, 1.5);
        float _3643 = exp2(_3641);
        float _3645 = 0.0 + _3643;
        float _3647 = precise::clamp(_3645, 0.0, 1.0);
        _2946 = _3631;
        _3587 = _3625;
        _3467 = _3647;
    }
    float _3649 = _2946;
    float _3651 = _3587;
    float _3653 = _3467;
    float _3655 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3657 = _3154 + _3655;
    float _3659 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3661 = _3156 + _3659;
    float _3663 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3665 = _3158 + _3663;
    float _3667 = _3657 * _3657;
    float _3669 = fma(_3661, _3661, _3667);
    float _3671 = fma(_3665, _3665, _3669);
    float _3673 = rsqrt(_3671);
    float _3675 = _3673 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3677 = _3661 * _3675;
    float _3679 = _3665 * _3675;
    float _3681 = _3677 * _3677;
    float _3683 = _3679 * _3679;
    float _3685 = _3681 + _3683;
    float _3687 = sqrt(_3685);
    bool _3689 = _3687 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3691 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3693 = _3687 + _3691;
    float _3695 = _3665;
    float _3697 = _3667;
    float _3699 = _3693;
    float _3701 = _3649;
    float _3703 = _3675;
    if (_3689)
    {
        float _3705 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3695 = _3705;
    }
    float _3707 = _3695;
    if (_3689)
    {
        float _3709 = rsqrt(_3685);
        _3697 = _3709;
    }
    float _3711 = _3697;
    float _3713 = _3711;
    if (_3689)
    {
        float _3715 = _3693 * _3707;
        _3699 = _3715;
    }
    float _3717 = _3699;
    if (_3689)
    {
        float _3719 = _3717 * 0.15915493667125701904296875;
        _3701 = _3719;
    }
    float _3721 = _3701;
    float _3723 = _3673;
    float _3725 = _3721;
    if (_3689)
    {
        float _3727 = _3721 * 6.283185482025146484375;
        float _3729 = sin(_3727);
        _3723 = _3729;
    }
    float _3731 = _3723;
    float _3733 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3735 = precise::max(0.0, _3733);
    float _3737 = _3651;
    float _3739 = _3735;
    float _3741 = _3733;
    if (_3689)
    {
        float _3743 = _3721 * 6.283185482025146484375;
        float _3745 = cos(_3743);
        _3737 = _3745;
    }
    float _3747 = _3737;
    float _3749 = -_3675;
    float _3751 = -_3735;
    float _3753 = fma(_3657, _3749, _3751);
    float _3755 = _3753;
    if (_3689)
    {
        float _3757 = _3753 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3739 = _3757;
    }
    float _3759 = _3739;
    float _3761 = _3731;
    float _3763 = _3759;
    if (_3689)
    {
        float _3765 = fma(_3731, _3759, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3761 = _3765;
    }
    float _3767 = _3761;
    float _3769 = _3767;
    if (!_3689)
    {
        _3763 = _3679;
    }
    float _3771 = _3763;
    float _3773 = _3771;
    float _3775 = _3747;
    if (_3689)
    {
        float _3777 = _3747 + (-1.0);
        _3741 = _3777;
    }
    float _3779 = _3741;
    if (_3689)
    {
        float _3781 = _3711 * _3767;
        _3703 = _3781;
    }
    float _3783 = _3703;
    if (!_3689)
    {
        _3769 = _3677;
    }
    float _3785 = _3769;
    float _3787 = _3785;
    if (_3689)
    {
        float _3789 = _3779 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3725 = _3789;
    }
    float _3791 = _3725;
    if (_3689)
    {
        float _3793 = _3677 * _3783;
        _3787 = _3793;
    }
    float _3795 = _3787;
    if (!_3689)
    {
        _3713 = _3681;
    }
    float _3797 = _3713;
    float _3799 = _3797;
    if (_3689)
    {
        float _3801 = _3679 * _3783;
        _3773 = _3801;
    }
    float _3803 = _3773;
    if (_3689)
    {
        float _3805 = fma(_3753, _3747, _3791);
        _3755 = _3805;
    }
    float _3807 = _3755;
    if (_3689)
    {
        float _3809 = _3795 * _3795;
        _3799 = _3809;
    }
    float _3811 = _3799;
    if (!_3689)
    {
        _3775 = _3683;
    }
    float _3813 = _3775;
    float _3815 = _3813;
    if (_3689)
    {
        float _3817 = _3803 * _3803;
        _3815 = _3817;
    }
    float _3819 = _3815;
    float _3821 = sqrt(_3671);
    float _3823 = fma(_3807, _3807, _3811);
    float _3825 = _3823 + _3819;
    float _3827 = rsqrt(_3825);
    float _3829 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3831 = fma(_3821, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3829);
    float _3833 = precise::clamp(_3831, 0.0, 1.0);
    float _3835 = -_3833;
    float _3837 = _3835 + 1.0;
    float _3839 = _3827 * _3807;
    float _3841 = _3827 * _3795;
    float _3843 = abs(_3837);
    float _3845 = log2(_3843);
    float _3847 = _3827 * _3803;
    float _3849 = _3841 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3851 = -_3849;
    float _3853 = fma(_3839, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3851);
    float _3855 = -_3847;
    float _3857 = fma(_3855, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3853);
    float _3859 = fma(_3857, -0.5, 0.5);
    float _3861 = _3845 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3863 = fma(_3857, 0.5, 0.5);
    float _3865 = sqrt(_3859);
    float _3867 = fma(_3863, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3869 = fma(_3863, _3867, -0.212114393711090087890625);
    float _3871 = _3839 + 1.0;
    float _3873 = exp2(_3861);
    float _3875 = fma(_3863, _3869, 1.570728778839111328125);
    float _3877 = _3865 * 0.636619746685028076171875;
    float _3879 = -_3875;
    float _3881 = fma(_3877, _3879, 1.0);
    float _3883 = -_3839;
    float _3885 = fma(_3873, _3871, _3883);
    float _3887 = fma(_3885, 0.5, 0.5);
    float2 _10394 = float2(_3881, _3887);
    float3 _3891 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_10394, float2(0.0), isnan(_10394)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_10394, float2(0.0), isnan(_10394)), level(0.0)).xyz;
    float _3893 = _3891.x;
    float _3895 = _3891.y;
    float _3897 = _3891.z;
    float _3899 = abs(_2914);
    float _3901 = log2(_3899);
    float _3903 = _3302 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3905 = _3845 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3907 = -_2854;
    float _3909 = _3907 + 1.0;
    float _3911 = fma(_3298, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3903);
    float _3913 = exp2(_3905);
    float _3915 = fma(_3226, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3911);
    float _3917 = _3338 * 0.5;
    bool _3919 = _2914 <= 8000.0;
    bool _3921 = isnan(_2914);
    bool _3923 = _3919 || _3921;
    bool _3925 = isnan(8000.0);
    bool _3927 = _3923 || _3925;
    float _3929 = float(_3927);
    float _3931 = fma(_3322, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3915);
    float _3933 = fma(_3380, -0.5, _3917);
    float _3935 = _3901 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3937 = _3931 + _3338;
    out.gl_Position.x = _3378;
    out.gl_Position.y = _3380;
    out.gl_Position.z = _3931;
    out.gl_Position.w = _3338;
    float _3939 = _3378 + _3338;
    float _3941 = _3937 * 0.5;
    float _3943 = exp2(_3935);
    float _3945 = _3939 * 0.5;
    out.m_84.x = _3945;
    out.m_84.y = _3933;
    out.m_84.z = _3941;
    out.m_84.w = _3338;
    float _3947 = -_3913;
    float _3949 = _3947 + 1.0;
    float _3951 = _3929;
    if (!_3328)
    {
        _3384 = 1.0;
    }
    float _3953 = _3384;
    float _3955 = _3953;
    if (_3328)
    {
        bool _3957 = _3440 >= _3426;
        bool _3959 = isnan(_3440);
        bool _3961 = _3957 || _3959;
        bool _3963 = isnan(_3426);
        bool _3965 = _3961 || _3963;
        float _3967 = float(_3965);
        _3955 = _3967;
    }
    float _3969 = _3955;
    float _3971 = _3949 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _3973 = _3821 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3975 = isnan(_3821);
    bool _3977 = _3973 || _3975;
    bool _3979 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3981 = _3977 || _3979;
    float _3983 = fma(_3943, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3985 = precise::clamp(_3983, 0.0, 1.0);
    float _3987 = _3969 * _3653;
    float _3989 = _3971 * _3442;
    float _3991 = fma(_3985, -2.0, 3.0);
    float _3993 = _3985 * _3985;
    float _3995 = _3453 * _3989;
    float _3997 = _3993 * _3991;
    float _3999 = -_3997;
    float _4001 = _3999 + 1.0;
    float _4003 = fma(_4001, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3997);
    float _4005 = _3929 * _4003;
    float _4007 = _4005;
    float _4009 = _3971;
    float _4011 = _3995;
    if (!_3981)
    {
        _3951 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4013 = _3951;
    float _4015 = _4005 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _4017 = _4013;
    float _4019 = _4013;
    if (!_3981)
    {
        _4007 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4021 = _4007;
    float _4023 = _3909 * _4015;
    float _4025 = precise::clamp(_4023, 0.0, 1.0);
    float _4027 = -_4025;
    float _4029 = fma(_4027, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4031 = -_3971;
    float _4033 = _4031 + 1.0;
    float _4035 = _4033;
    float _4037 = _4021;
    float _4039 = _4021;
    if (!_3981)
    {
        _4009 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4041 = _4009;
    float _4043 = -_3987;
    float _4045 = fma(_4043, _4029, 1.0);
    float _4047 = precise::clamp(_4045, 0.0, 1.0);
    float _4049 = _3453 * _4033;
    float _4051 = _4041;
    float _4053 = _4041;
    if (!_3981)
    {
        _4035 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4055 = _4035;
    float _4057 = _4047 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4059 = _3527 * _3585;
    out.m_86.x = _4057;
    float _4061 = _4059 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4063 = _4059;
    float _4065 = _4055;
    float _4067 = _4055;
    if (!_3981)
    {
        _4063 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4069 = _4063;
    float _4071 = _3897 * _3989;
    float _4073 = fma(_3893, _3995, _3447);
    float _4075 = fma(_3895, _3995, _3449);
    float _4077 = _4069;
    float _4079 = _4069;
    if (!_3981)
    {
        _4011 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4081 = _4011;
    float _4083 = fma(_3453, _4071, _3451);
    out.m_88.x = _4073;
    out.m_88.y = _4075;
    out.m_88.z = _4083;
    out.m_88.w = _4049;
    bool _4085 = !_3981;
    float _4087 = _4081;
    float _4089 = _4081;
    if (!_4085)
    {
        bool _4091 = _3821 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4093 = isnan(_3821);
        bool _4095 = _4091 || _4093;
        bool _4097 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4099 = _4095 || _4097;
        if (!_4099)
        {
            float _4101 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4103 = _3821 + _4101;
            float _4105 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4107 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4105;
            float _4109 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4111 = _4109 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4113 = 1.0 / _4107;
            float _4115 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4117 = _4115 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4119 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4121 = _4119 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4123 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4125 = _4123 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4127 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4129 = _4127 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4131 = _4103 * _4113;
            float _4133 = precise::clamp(_4131, 0.0, 1.0);
            float _4135 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4137 = _4135 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4139 = fma(_4133, _4111, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4141 = fma(_4133, _4137, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4143 = fma(_4133, _4117, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4145 = fma(_4133, _4121, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4147 = fma(_4133, _4125, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4149 = fma(_4133, _4129, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4019 = _4143;
            _4053 = _4147;
            _4039 = _4139;
            _4067 = _4145;
            _4089 = _4141;
            _4079 = _4149;
            _4151 = true;
        }
        else
        {
            bool _4153 = _3821 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4155 = isnan(_3821);
            bool _4157 = _4153 || _4155;
            bool _4159 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4161 = _4157 || _4159;
            if (!_4161)
            {
                _4037 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4163 = _4037;
            _4039 = _4163;
            if (!_4161)
            {
                _4017 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4165 = _4017;
            _4019 = _4165;
            if (!_4161)
            {
                _4087 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4167 = _4087;
            _4089 = _4167;
            if (!_4161)
            {
                _4065 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4169 = _4065;
            _4067 = _4169;
            if (!_4161)
            {
                _4051 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4171 = _4051;
            _4053 = _4171;
            if (!_4161)
            {
                _4077 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4173 = _4077;
            bool _4175 = !_4161;
            _4079 = _4173;
            if (!_4175)
            {
                bool _4177 = _3821 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4179 = isnan(_3821);
                bool _4181 = _4177 || _4179;
                bool _4183 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4185 = _4181 || _4183;
                if (!_4185)
                {
                    float _4187 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4189 = _3821 + _4187;
                    float _4191 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4193 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4191;
                    float _4195 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4197 = _4195 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4199 = 1.0 / _4193;
                    float _4201 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4203 = _4201 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4205 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4207 = _4205 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4209 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4211 = _4209 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4213 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4215 = _4213 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4217 = _4189 * _4199;
                    float _4219 = precise::clamp(_4217, 0.0, 1.0);
                    float _4221 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4223 = _4221 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4225 = fma(_4219, _4197, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4227 = fma(_4219, _4223, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4229 = fma(_4219, _4203, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4231 = fma(_4219, _4207, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4233 = fma(_4219, _4211, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4235 = fma(_4219, _4215, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4019 = _4229;
                    _4053 = _4233;
                    _4039 = _4225;
                    _4067 = _4231;
                    _4089 = _4227;
                    _4079 = _4235;
                    _4151 = true;
                }
                else
                {
                    _4019 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4053 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4039 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4067 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4089 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4079 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4151 = false;
    float _4237 = _4019;
    float _4239 = _4053;
    float _4241 = _4039;
    float _4243 = _4067;
    float _4245 = _4089;
    float _4247 = _4079;
    float _4249 = _4061 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4251 = fma(_2478, -0.5, 0.5);
    float _4253 = precise::clamp(_4251, 0.0, 1.0);
    float _4255 = -_4237;
    float _4257 = _4255 + _4239;
    float _4259 = -_4241;
    float _4261 = _4259 + _4243;
    out.m_61.x = _4249;
    float _4263 = fma(_4253, _4257, _4237);
    float _4265 = -_4245;
    float _4267 = _4265 + _4247;
    float _4269 = fma(_4253, _4261, _4241);
    float _4271 = _4263 * 0.586610972881317138671875;
    bool _4273 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4275 = fma(_4253, _4267, _4245);
    out.m_90.x = 0.0;
    float _4277 = fma(_4269, 0.298911988735198974609375, _4271);
    bool _4279 = _3527 > 0.0;
    bool _4281 = isnan(_3527);
    bool _4283 = _4279 || _4281;
    bool _4285 = isnan(0.0);
    bool _4287 = _4283 || _4285;
    float _4289 = fma(_4275, 0.114477999508380889892578125, _4277);
    bool _4291 = _3585 <= 0.0;
    bool _4293 = !_4287;
    bool _4295 = _4291 || _4293;
    float _4297 = -_4289;
    float _4299 = _4269 + _4297;
    float _4301 = -_4289;
    float _4303 = _4263 + _4301;
    float _4305 = -_4289;
    float _4307 = _4275 + _4305;
    float _4309 = fma(_4299, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4289);
    float _4311 = fma(_4303, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4289);
    float _4313 = fma(_4307, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4289);
    bool _4315 = !_4273;
    if (!_4315)
    {
        float _4317 = -_3154;
        float _4319 = _4317 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4321 = -_3156;
        float _4323 = _4321 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4325 = -_3158;
        float _4327 = _4325 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4329 = _4319 * _4319;
        float _4331 = fma(_4323, _4323, _4329);
        float _4333 = fma(_4327, _4327, _4331);
        float _4335 = sqrt(_4333);
        float _4337 = rsqrt(_4333);
        float _4339 = -_4335;
        float _4341 = _4339 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4343 = _4341 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4345 = precise::clamp(_4343, 0.0, 1.0);
        float _4347 = _4323 * _4337;
        float _4349 = _4319 * _4337;
        float _4351 = abs(_4345);
        float _4353 = log2(_4351);
        float _4355 = _4327 * _4337;
        float _4357 = _4347 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4359 = _2478 * _4349;
        float _4361 = -_4349;
        float _4363 = -_4357;
        float _4365 = fma(_4361, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4363);
        float _4367 = fma(_2476, _4347, _4359);
        float _4369 = -_4355;
        float _4371 = fma(_4369, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4365);
        float _4373 = fma(_2480, _4355, _4367);
        float _4375 = precise::clamp(_4373, 0.0, 1.0);
        float _4377 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4379 = _4371 + _4377;
        float _4381 = _4353 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4383 = _4379 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4385 = precise::clamp(_4383, 0.0, 1.0);
        float _4387 = exp2(_4381);
        float _4389 = _4387 * _4385;
        float _4391 = _4375 * _4389;
        float _4393 = _4391 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4395 = _4391 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4397 = _4391 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_90.x = _4393;
        out.m_90.y = _4395;
        out.m_90.z = _4397;
    }
    out.m_92.x = _4309;
    out.m_92.y = _4311;
    out.m_92.z = _4313;
    if (!_4295)
    {
        return out;
    }
    out.m_61.x = 0.0;
    float _4399 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4399;
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
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4151 = false;
    bool _2530 = false;
    bool _991 = false;
    bool _807 = false;
    bool _693 = false;
    bool _491 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _106 = in.m_58.w;
    float _108 = trunc(_106);
    int _111 = int(_108);
    bool _115 = _111 >= 1;
    float _117 = 0.0;
    if (!_115)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _119 = _117;
    float _121 = _119;
    if (!_115)
    {
        out.m_61.x = 0.0;
    }
    int _123 = 0;
    if (!_115)
    {
        float _125 = _119 * 5.0;
        _123 = as_type<int>(_125);
    }
    int _127 = _123;
    int _129 = _127;
    if (!_115)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4456 = as_type<float>(_127);
        out.gl_Position.z = _4456;
    }
    if (!_115)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _131 = in.m_63.w;
    bool _133 = _131 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _135 = isnan(_131);
    bool _137 = _133 || _135;
    bool _139 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _141 = _137 || _139;
    float _143 = -_131;
    float _145 = _143 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _147 = _145;
    if (_141)
    {
        float _149 = float(_111);
        _121 = _149;
    }
    float _151 = _121;
    bool _153 = _145 >= _151;
    bool _155 = !_141;
    bool _157 = _153 || _155;
    float _159 = _151;
    if (_157)
    {
        _159 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _159;
    if (_157)
    {
        out.m_61.x = 0.0;
    }
    if (_157)
    {
        float _163 = _161 * 5.0;
        _129 = as_type<int>(_163);
    }
    int _165 = _129;
    if (_157)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4526 = as_type<float>(_165);
        out.gl_Position.z = _4526;
    }
    if (_157)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _167 = as_type<float>(int(gl_VertexIndex));
    float _169 = _145 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _171 = in.m_68.w;
    bool _173 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _175 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _177 = _173 || _175;
    bool _179 = isnan(1.0);
    bool _181 = _177 || _179;
    float _183 = in.m_63.x;
    float _185 = in.m_63.y;
    float _187 = in.m_63.z;
    float _189 = in.m_58.x;
    float _191 = in.m_58.y;
    float _193 = in.m_58.z;
    int _195 = as_type<int>(_167) & 1;
    bool _197 = _195 != 0;
    int _199 = as_type<int>(_167) & 2;
    bool _201 = _199 != 0;
    float _203 = _167;
    float _205 = _169;
    if (!_181)
    {
        float _207 = _169 * _169;
        float _209 = _207 * 0.5;
        _203 = _209;
    }
    float _211 = _203;
    bool _213 = !_197;
    float _215 = _213 ? (-0.5) : 0.5;
    float _217 = _211;
    if (!_181)
    {
        float _219 = _211 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _217 = _219;
    }
    float _221 = _217;
    bool _223 = !_201;
    float _225 = _223 ? (-0.5) : 0.5;
    bool _227 = !_181;
    float _229 = _221;
    if (!_227)
    {
        float _231 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _233 = log2(_231);
        float _235 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _237 = _235 + 1.0;
        float _239 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _241 = _169 * _233;
        float _243 = 1.0 / _237;
        float _245 = _239 * 0.693147182464599609375;
        float _247 = exp2(_241);
        float _249 = 1.0 / _245;
        float _251 = _247 + (-1.0);
        float _253 = -_251;
        float _255 = fma(_253, _249, _169);
        float _257 = _255 * _243;
        float _259 = _257 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _229 = _259;
    }
    float _261 = _229;
    float _263 = _261 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _265 = !_181;
    float _267 = _263;
    float _269 = _261;
    if (!_265)
    {
        float _271 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _273 = log2(_271);
        float _275 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _277 = _275 + 1.0;
        float _279 = 1.0 / _277;
        float _281 = _169 * _273;
        float _283 = exp2(_281);
        float _285 = -_283;
        float _287 = _285 + 1.0;
        float _289 = _287 * _279;
        _205 = _289;
    }
    float _291 = _205;
    float _293 = _261 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _295 = _263 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _297 = _263 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _299 = _263 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    if (!_181)
    {
        float _301 = _145 * _145;
        float _303 = _301 * 0.5;
        _267 = _303;
    }
    float _305 = _267;
    float _307 = fma(_293, (*spvDescriptorSet0.vp_c10)._m0[8].x, _295);
    float _309 = fma(_293, (*spvDescriptorSet0.vp_c10)._m0[8].y, _297);
    float _311 = fma(_293, (*spvDescriptorSet0.vp_c10)._m0[8].z, _299);
    float _313 = _261 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_181)
    {
        float _315 = _305 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _269 = _315;
    }
    float _317 = _269;
    bool _319 = !_181;
    float _321 = _317;
    if (!_319)
    {
        float _323 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _325 = log2(_323);
        float _327 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _329 = _327 + 1.0;
        float _331 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _333 = _145 * _325;
        float _335 = exp2(_333);
        float _337 = _331 * 0.693147182464599609375;
        float _339 = 1.0 / _337;
        float _341 = 1.0 / _329;
        float _343 = _335 + (-1.0);
        float _345 = -_343;
        float _347 = fma(_345, _339, _145);
        float _349 = _347 * _341;
        float _351 = _349 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _321 = _351;
    }
    float _353 = _321;
    float _355 = _353 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _357 = fma(_313, (*spvDescriptorSet0.vp_c10)._m0[10].x, _307);
    float _359 = fma(_313, (*spvDescriptorSet0.vp_c10)._m0[10].y, _309);
    float _361 = _353 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _363 = _355 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _365 = _355 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _367 = _355 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _369 = fma(_313, (*spvDescriptorSet0.vp_c10)._m0[10].z, _311);
    float _371 = fma(_361, (*spvDescriptorSet0.vp_c10)._m0[8].x, _363);
    float _373 = fma(_361, (*spvDescriptorSet0.vp_c10)._m0[8].y, _365);
    float _375 = fma(_361, (*spvDescriptorSet0.vp_c10)._m0[8].z, _367);
    float _377 = _353 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _379 = fma(_291, _183, _357);
    float _381 = fma(_291, _185, _359);
    float _383 = fma(_291, _187, _369);
    float _385 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[10].x, _371);
    float _387 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[10].y, _373);
    float _389 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[10].z, _375);
    float _391 = _377;
    if (!_181)
    {
        _391 = _145;
    }
    float _393 = _391;
    bool _395 = !_181;
    float _397 = _393;
    if (!_395)
    {
        float _399 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _401 = log2(_399);
        float _403 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _405 = _403 + 1.0;
        float _407 = 1.0 / _405;
        float _409 = _145 * _401;
        float _411 = exp2(_409);
        float _413 = -_411;
        float _415 = _413 + 1.0;
        float _417 = _415 * _407;
        _397 = _417;
    }
    float _419 = _397;
    float _421 = fma(_419, _185, _387);
    float _423 = fma(_419, _183, _385);
    float _425 = fma(_419, _187, _389);
    bool _427 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _429 = fma(_381, _171, _191);
    float _431 = -_421;
    float _433 = _381 + _431;
    float _435 = fma(_379, _171, _189);
    float _437 = -_423;
    float _439 = _379 + _437;
    float _441 = -_425;
    float _443 = _383 + _441;
    float _445 = _433 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _447 = _433 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _449 = _433 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _451 = fma(_439, (*spvDescriptorSet0.vp_c10)._m0[4].x, _445);
    float _453 = fma(_439, (*spvDescriptorSet0.vp_c10)._m0[5].x, _447);
    float _455 = fma(_439, (*spvDescriptorSet0.vp_c10)._m0[6].x, _449);
    float _457 = fma(_383, _171, _193);
    float _459 = fma(_443, (*spvDescriptorSet0.vp_c10)._m0[4].z, _451);
    float _461 = fma(_443, (*spvDescriptorSet0.vp_c10)._m0[5].z, _453);
    float _463 = fma(_443, (*spvDescriptorSet0.vp_c10)._m0[6].z, _455);
    bool _465 = !_427;
    float _467 = _461;
    float _469 = _459;
    float _471 = _463;
    float _489;
    if (!_465)
    {
        float _473 = in.m_70.x;
        float _475 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _477 = _473 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _479 = fma(_477, (*spvDescriptorSet0.vp_c9)._m0[12].x, _145);
        float _481 = _479 * _475;
        float _483 = floor(_481);
        float _485 = -_483;
        float _487 = _481 + _485;
        _489 = _487;
        _491 = true;
    }
    else
    {
        float _493 = float(_111);
        float _495 = 1.0 / _493;
        float _497 = _145 * _495;
        _489 = _497;
    }
    _491 = false;
    float _499 = _489;
    float _501 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _503 = _499 + _501;
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _507 = _499 + _505;
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _511 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _509;
    float _513 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _515 = _513 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _517 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _519 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _517;
    bool _521 = _499 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _523 = isnan(_499);
    bool _525 = _521 || _523;
    bool _527 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _529 = _525 || _527;
    float _531 = float(_529);
    float _533 = 1.0 / _511;
    float _535 = -_531;
    float _537 = _535 + 1.0;
    bool _539 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _541 = 1.0 / _515;
    float _543 = 1.0 / _519;
    float _545 = _503 * _533;
    float _547 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _549 = _499 + _547;
    float _551 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _553 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _551;
    float _555 = _549 * _541;
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _559 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _557;
    float _561 = fma(_553, _545, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _565 = _563 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _567 = fma(_559, _545, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _569 = _507 * _543;
    bool _571 = _499 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _573 = isnan(_499);
    bool _575 = _571 || _573;
    bool _577 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _579 = _575 || _577;
    float _581 = float(_579);
    bool _583 = _499 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _585 = isnan(_499);
    bool _587 = _583 || _585;
    bool _589 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _591 = _587 || _589;
    float _593 = float(_591);
    float _595 = _581 * _537;
    bool _597 = _499 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _599 = isnan(_499);
    bool _601 = _597 || _599;
    bool _603 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _605 = _601 || _603;
    float _607 = float(_605);
    float _609 = -_581;
    float _611 = _609 + 1.0;
    float _613 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _615 = _613 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _617 = -_593;
    float _619 = _617 + 1.0;
    float _621 = _593 * _611;
    float _623 = fma(_615, _555, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _625 = fma(_565, _555, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _627 = _607 * _619;
    float _629 = in.m_68.x;
    float _631 = in.m_68.y;
    float _633 = -_607;
    float _635 = _633 + 1.0;
    float _637 = _561 * _627;
    float _639 = _567 * _627;
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _643 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _641;
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _647 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _645;
    float _649 = fma(_635, (*spvDescriptorSet0.vp_c9)._m0[143].x, _637);
    float _651 = fma(_635, (*spvDescriptorSet0.vp_c9)._m0[143].y, _639);
    float _653 = fma(_643, _569, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _655 = fma(_647, _569, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _657 = fma(_623, _621, _649);
    float _659 = fma(_625, _621, _651);
    float _661 = fma(_653, _595, _657);
    float _663 = fma(_655, _595, _659);
    float _665 = fma(_531, (*spvDescriptorSet0.vp_c9)._m0[146].x, _661);
    float _667 = fma(_531, (*spvDescriptorSet0.vp_c9)._m0[146].y, _663);
    float _669 = _665 * _629;
    float _671 = _667 * _631;
    bool _673 = !_539;
    float _691;
    if (!_673)
    {
        float _675 = in.m_70.x;
        float _677 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _679 = _675 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _681 = fma(_679, (*spvDescriptorSet0.vp_c9)._m0[11].x, _145);
        float _683 = _681 * _677;
        float _685 = floor(_683);
        float _687 = -_685;
        float _689 = _683 + _687;
        _691 = _689;
        _693 = true;
    }
    else
    {
        float _695 = float(_111);
        float _697 = 1.0 / _695;
        float _699 = _145 * _697;
        _691 = _699;
    }
    _693 = false;
    float _701 = _691;
    float _703 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _705 = _701 + _703;
    bool _707 = _701 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _709 = isnan(_701);
    bool _711 = _707 || _709;
    bool _713 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _715 = _711 || _713;
    float _717 = float(_715);
    float _719 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _721 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _719;
    bool _723 = _701 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _725 = isnan(_701);
    bool _727 = _723 || _725;
    bool _729 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _731 = _727 || _729;
    float _733 = float(_731);
    float _735 = -_717;
    float _737 = _735 + 1.0;
    float _739 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _741 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _739;
    float _743 = 1.0 / _721;
    bool _745 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _747 = _733 * _737;
    float _749 = -_733;
    float _751 = _749 + 1.0;
    float _753 = _705 * _743;
    float _755 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _757 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _755;
    float _759 = fma(_741, _753, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _761 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _763 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _761;
    float _765 = fma(_757, _753, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _767 = _759 * _747;
    float _769 = fma(_763, _753, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _771 = _765 * _747;
    float _773 = _769 * _747;
    float _775 = fma(_751, (*spvDescriptorSet0.vp_c9)._m0[107].x, _767);
    float _777 = fma(_751, (*spvDescriptorSet0.vp_c9)._m0[107].y, _773);
    float _779 = fma(_751, (*spvDescriptorSet0.vp_c9)._m0[107].z, _771);
    float _781 = fma(_717, (*spvDescriptorSet0.vp_c9)._m0[108].x, _775);
    float _783 = fma(_717, (*spvDescriptorSet0.vp_c9)._m0[108].y, _777);
    float _785 = fma(_717, (*spvDescriptorSet0.vp_c9)._m0[108].z, _779);
    bool _787 = !_745;
    float _805;
    if (!_787)
    {
        float _789 = in.m_70.x;
        float _791 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _793 = _789 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _795 = fma(_793, (*spvDescriptorSet0.vp_c9)._m0[11].y, _145);
        float _797 = _795 * _791;
        float _799 = floor(_797);
        float _801 = -_799;
        float _803 = _797 + _801;
        _805 = _803;
        _807 = true;
    }
    else
    {
        float _809 = float(_111);
        float _811 = 1.0 / _809;
        float _813 = _145 * _811;
        _805 = _813;
    }
    _807 = false;
    float _815 = _805;
    float _817 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _819 = _815 + _817;
    float _821 = _781 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _823 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _825 = _823 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _827 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _829 = _827 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _831 = _815 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _833 = isnan(_815);
    bool _835 = _831 || _833;
    bool _837 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _839 = _835 || _837;
    float _841 = float(_839);
    float _843 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _845 = _843 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _847 = _815 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _849 = isnan(_815);
    bool _851 = _847 || _849;
    bool _853 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _855 = _851 || _853;
    float _857 = float(_855);
    float _859 = 1.0 / _825;
    float _861 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _863 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _861;
    float _865 = -_841;
    float _867 = _865 + 1.0;
    bool _869 = _815 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _871 = isnan(_815);
    bool _873 = _869 || _871;
    bool _875 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _877 = _873 || _875;
    float _879 = float(_877);
    float _881 = _783 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _883 = _785 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _885 = _821 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _887 = 1.0 / _829;
    float _889 = _881 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _891 = _883 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _893 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _895 = 1.0 / _845;
    float _897 = _863 * _859;
    float _899 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _901 = _899 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _903 = _857 * _867;
    float _905 = -_857;
    float _907 = _905 + 1.0;
    float _909 = fma(_897, _819, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _911 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _913 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _911;
    float _915 = _879 * _907;
    float _917 = _901 * _887;
    float _919 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _921 = _815 + _919;
    bool _923 = _815 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _925 = isnan(_815);
    bool _927 = _923 || _925;
    bool _929 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _931 = _927 || _929;
    float _933 = float(_931);
    float _935 = _909 * _915;
    float _937 = -_879;
    float _939 = _937 + 1.0;
    float _941 = fma(_917, _921, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _943 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _945 = _815 + _943;
    float _947 = _913 * _895;
    float _949 = -_933;
    float _951 = _949 + 1.0;
    float _953 = fma(_939, (*spvDescriptorSet0.vp_c9)._m0[115].x, _935);
    float _955 = fma(_947, _945, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _957 = _841 * _951;
    float _959 = fma(_941, _903, _953);
    float _961 = fma(_955, _957, _959);
    float _963 = fma(_933, (*spvDescriptorSet0.vp_c9)._m0[118].x, _961);
    float _965 = _963 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_72.x = _885;
    out.m_72.y = _889;
    out.m_72.z = _891;
    out.m_72.w = _965;
    bool _967 = !_893;
    float _987;
    float _989;
    if (!_967)
    {
        float _969 = in.m_70.x;
        float _971 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _973 = float(_111);
        float _975 = _969 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _977 = fma(_975, (*spvDescriptorSet0.vp_c9)._m0[11].w, _145);
        float _979 = _977 * _971;
        float _981 = floor(_979);
        float _983 = -_981;
        float _985 = _979 + _983;
        _987 = _973;
        _989 = _985;
        _991 = true;
    }
    else
    {
        float _993 = float(_111);
        float _995 = 1.0 / _993;
        float _997 = _145 * _995;
        _987 = _993;
        _989 = _997;
    }
    _991 = false;
    float _999 = _987;
    float _1001 = _989;
    float _1003 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1005 = int(_1003);
    int _1007 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1009 = _1007 != 0;
    float _1011 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1013 = int(_1011);
    float _1015 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1017 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1015;
    float _1019 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1021 = 1.0 / _999;
    float _1023 = float(_1005);
    float _1025 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1027 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1029 = 1.0 / _1023;
    float _1031 = float(uint(_1013));
    bool _1033 = _1013 == 0;
    int _1035 = ~_1013;
    int _1037 = _1035 + 1;
    float _1039 = 1.0 / _1031;
    float _1041 = _145 * _1029;
    float _1043 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1045 = log2(_1043);
    int _1047 = as_type<int>(_1039) + (-2);
    float _1049 = trunc(_1041);
    int _1051 = int(_1049);
    float _1053 = _145 * _1045;
    float _1055 = exp2(_1053);
    float _1057 = float(uint(_1051));
    float _1059 = as_type<float>(_1047) * _1057;
    int _1061 = ~_1013;
    int _1063 = _1061 + 1;
    float _1065 = trunc(_1059);
    float _1067 = precise::max(_1065, 0.0);
    uint _1070 = uint(_1067);
    int _1072 = ~_1013;
    int _1074 = _1072 + 1;
    int _1076 = _1063 * int(_1070);
    int _1078 = _1076 + _1051;
    float _1080 = float(uint(_1078));
    float _1082 = as_type<float>(_1047) * _1080;
    float _1084 = in.m_70.x;
    float _1086 = in.m_70.y;
    float _1088 = in.m_70.z;
    float _1090 = in.m_70.w;
    float _1092 = trunc(_1082);
    float _1094 = precise::max(_1092, 0.0);
    uint _1096 = uint(_1094);
    int _1098 = int(_1070) + int(_1096);
    float _1100 = float(_1013);
    float _1102 = float(_1051);
    int _1104 = _1074 * _1098;
    int _1106 = _1104 + _1051;
    float _1108 = 0.0;
    if (!_1009)
    {
        _1108 = _1088;
    }
    float _1110 = _1108;
    bool _1112 = _1102 >= _1100;
    bool _1114 = isnan(_1102);
    bool _1116 = _1112 || _1114;
    bool _1118 = isnan(_1100);
    bool _1120 = _1116 || _1118;
    float _1122 = float(_1120);
    bool _1124 = !_1009;
    float _1126 = _1124 ? 7.345489978790283203125 : 1.0;
    bool _1128 = uint(_1106) >= uint(_1013);
    float _1130 = trunc(_1122);
    int _1132 = int(_1130);
    float _1134 = _1126 * _1084;
    bool _1136 = !_1128;
    int _1138 = _1136 ? 0 : (-1);
    float _1140 = _1110;
    if (_1009)
    {
        _1140 = _1086;
    }
    float _1142 = _1140;
    int _1144 = ~_1098;
    int _1146 = _1144 + _1138;
    int _1148 = _1146 + 1;
    float _1150 = floor(_1134);
    float _1152 = fma(_1142, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1025);
    int _1154 = _1013 * _1148;
    int _1156 = _1154 + _1051;
    int _1158 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1160 = _1158 != 0;
    int _1162 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1164 = _1162 != 0;
    int _1166 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1168 = _1166 != 0;
    float _1170 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1152);
    int _1172 = ~_1132;
    int _1174 = _1172 + 1;
    int _1176 = _1174 + 1;
    bool _1178 = !_1033;
    int _1180 = _1178 ? _1156 : (-1);
    bool _1182 = !_1160;
    int _1184 = _1182 ? 0 : 1;
    int _1186 = _1180 * _1176;
    float _1188 = -_1150;
    float _1190 = _1134 + _1188;
    int _1192 = _1013 + (-1);
    float _1194 = _1190 * _1100;
    float _1196 = _145 * _1100;
    int _1198 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1200 = _1198 != 0;
    float _1202 = trunc(_1194);
    int _1204 = int(_1202);
    float _1206 = _1196 * _1021;
    bool _1208 = !_1164;
    int _1210 = _1208 ? 0 : 1;
    int _1212 = _1132 * _1192;
    int _1214 = _1212 + _1186;
    bool _1216 = !_1200;
    int _1218 = _1216 ? 0 : 1;
    float _1220 = _429 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _1222 = abs(_1210);
    float _1224 = trunc(_1206);
    int _1226 = int(_1224);
    int _1228 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1230 = _1228 != 0;
    bool _1232 = !_1168;
    int _1234 = _1232 ? 0 : 1;
    int _1236 = _1214 * _1222;
    int _1238 = abs(_1184);
    int _1240 = abs(_1218);
    bool _1242 = !_1230;
    int _1244 = _1242 ? 0 : 1;
    int _1246 = abs(_1234);
    int _1248 = _1204 * _1240;
    int _1250 = _1248 + _1051;
    float _1252 = fma(_435, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1220);
    int _1254 = abs(_1244);
    int _1256 = _1226 * _1238;
    int _1258 = _1256 + _1236;
    int _1260 = ~_1013;
    int _1262 = _1260 + 1;
    int _1264 = _1250 * _1246;
    int _1266 = _1264 + _1258;
    int _1268 = ~_1013;
    int _1270 = _1268 + 1;
    bool _1272 = _1001 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1274 = isnan(_1001);
    bool _1276 = _1272 || _1274;
    bool _1278 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1280 = _1276 || _1278;
    float _1282 = float(_1280);
    int _1284 = _1204 * _1254;
    int _1286 = _1284 + _1266;
    float _1288 = _429 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1290 = float(uint(_1286));
    float _1292 = as_type<float>(_1047) * _1290;
    float _1294 = trunc(_1292);
    float _1296 = precise::max(_1294, 0.0);
    uint _1298 = uint(_1296);
    int _1300 = _1262 * int(_1298);
    int _1302 = _1300 + _1286;
    float _1304 = float(uint(_1302));
    float _1306 = as_type<float>(_1047) * _1304;
    float _1308 = trunc(_1306);
    float _1310 = precise::max(_1308, 0.0);
    uint _1312 = uint(_1310);
    int _1314 = int(_1298) + int(_1312);
    int _1316 = _1270 * _1314;
    int _1318 = _1316 + _1286;
    bool _1320 = uint(_1318) >= uint(_1013);
    float _1322 = _1084 * 2.0;
    bool _1324 = !_1320;
    int _1326 = _1324 ? 0 : (-1);
    float _1328 = floor(_1322);
    int _1330 = ~_1314;
    int _1332 = _1330 + _1326;
    int _1334 = _1332 + 1;
    float _1336 = _1086 * 2.0;
    int _1338 = _1013 * _1334;
    int _1340 = _1338 + _1286;
    float _1342 = floor(_1336);
    bool _1344 = !_1033;
    int _1346 = _1344 ? _1340 : (-1);
    int _1348 = _1346 & 3;
    bool _1350 = _1348 != 0;
    int _1352 = _1346 & 3;
    bool _1354 = _1352 != 0;
    bool _1356 = uint(_1348) > 1u;
    int _1358 = _1354 ? 0 : 1;
    bool _1360 = _1328 >= 0.0;
    bool _1362 = isnan(_1328);
    bool _1364 = _1360 || _1362;
    bool _1366 = isnan(0.0);
    bool _1368 = _1364 || _1366;
    int _1370 = ~_1358;
    int _1372 = _1370 + 1;
    int _1374 = _1372 + 1;
    bool _1376 = _1090 > 0.5;
    int _1378 = _1368 ? 0 : 1;
    int _1380 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1382 = _1380 != 0;
    int _1384 = _1374;
    float _1386 = _1252;
    if (!_1356)
    {
        int _1388 = ~_1358;
        int _1390 = _1388 + 1;
        _1384 = _1390;
    }
    int _1392 = _1384;
    bool _1394 = _1084 > 0.5;
    int _1396 = ~_1378;
    int _1398 = _1396 + 1;
    int _1400 = _1398 + 1;
    float _1402 = -_215;
    int _1404 = _1394 ? as_type<int>(_1402) : as_type<int>(_215);
    bool _1406 = _1328 > 0.0;
    float _1408 = -_225;
    int _1410 = _1376 ? as_type<int>(_1408) : as_type<int>(_225);
    bool _1412 = _1086 > 0.5;
    float _1414 = -_225;
    int _1416 = _1412 ? as_type<int>(_1414) : as_type<int>(_225);
    int _1418 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1420 = _1418 != 0;
    float _1422 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _1424 = !_1382;
    float _1426 = _1424 ? _215 : as_type<float>(_1404);
    int _1428 = _1400;
    if (!_1406)
    {
        int _1430 = ~_1378;
        int _1432 = _1430 + 1;
        _1428 = _1432;
    }
    int _1434 = _1428;
    float _1436 = _1426 + 0.5;
    bool _1438 = !_1420;
    float _1440 = _1438 ? _225 : as_type<float>(_1410);
    float _1442 = fma(_435, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1288);
    bool _1444 = _1088 > 0.5;
    float _1446 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1448 = _1446 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1450 = _1342 >= 0.0;
    bool _1452 = isnan(_1342);
    bool _1454 = _1450 || _1452;
    bool _1456 = isnan(0.0);
    bool _1458 = _1454 || _1456;
    float _1460 = -_215;
    int _1462 = _1444 ? as_type<int>(_1460) : as_type<int>(_215);
    float _1464 = 1.0 / _1448;
    int _1466 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1468 = _1466 != 0;
    int _1470 = _1458 ? 0 : 1;
    bool _1472 = !_1468;
    float _1474 = _1472 ? _225 : as_type<float>(_1416);
    int _1476 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1478 = _1476 != 0;
    bool _1480 = _1342 > 0.0;
    float _1482 = _429 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1484 = _1084 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1486 = ~_1470;
    int _1488 = _1486 + 1;
    int _1490 = _1488 + 1;
    float _1492 = fma(_457, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1252);
    float _1494 = fma(_435, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1482);
    float _1496 = _1086 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1498 = _1017 * _1464;
    bool _1500 = !_1478;
    float _1502 = _1500 ? _215 : as_type<float>(_1462);
    float _1504 = _1088 * 2.0;
    float _1506 = float(uint(_1250));
    float _1508 = -_1019;
    float _1510 = fma(_1484, 2.0, _1508);
    float _1512 = fma(_1496, -2.0, _1422);
    float _1514 = _1086 + _1084;
    float _1516 = fma(_457, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1494);
    float _1518 = as_type<float>(_1047) * _1506;
    float _1520 = fma(_457, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1442);
    int _1522 = _1490;
    float _1524 = _1442;
    if (!_1480)
    {
        int _1526 = ~_1470;
        int _1528 = _1526 + 1;
        _1522 = _1528;
    }
    int _1530 = _1522;
    float _1532 = _1086 + _1088;
    int _1534 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1536 = _1534 != 0;
    int _1538 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1540 = _1538 != 0;
    int _1542 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1544 = _1542 != 0;
    float _1546 = _1514 + (-1.0);
    float _1548 = trunc(_1518);
    float _1550 = precise::max(_1548, 0.0);
    uint _1552 = uint(_1550);
    float _1554 = _1532 + (-1.0);
    float _1556 = -_1055;
    float _1558 = _1556 + 1.0;
    if (!_1009)
    {
        _1386 = _1086;
    }
    float _1560 = _1386;
    float _1562 = -_145;
    float _1564 = fma(_1562, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1510);
    float _1566 = fma(_1546, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1568 = floor(_1504);
    float _1570 = fma(_1554, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1572 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1574 = _1001 + _1572;
    bool _1576 = _1001 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1578 = isnan(_1001);
    bool _1580 = _1576 || _1578;
    bool _1582 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1584 = _1580 || _1582;
    float _1586 = float(_1584);
    float _1588 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1590 = 1.0 + _1588;
    float _1592 = _1560;
    if (!_1009)
    {
        _1524 = _1088;
    }
    float _1594 = _1524;
    float _1596 = fma(_1498, _1574, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1598 = _1594;
    if (_1009)
    {
        _1592 = _1084;
    }
    float _1600 = _1592;
    float _1602 = -_1586;
    float _1604 = _1602 + 1.0;
    int _1606 = _1037 * int(_1552);
    int _1608 = _1606 + _1250;
    if (_1009)
    {
        _1598 = _1086;
    }
    float _1610 = _1598;
    float _1612 = 1.0 / _1590;
    float _1614 = _1282 * _1604;
    float _1616 = -_1282;
    float _1618 = _1616 + 1.0;
    float _1620 = float(uint(_1608));
    float _1622 = _1596 * _1614;
    bool _1624 = _1568 >= 0.0;
    bool _1626 = isnan(_1568);
    bool _1628 = _1624 || _1626;
    bool _1630 = isnan(0.0);
    bool _1632 = _1628 || _1630;
    float _1634 = fma(_1436, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1564);
    float _1636 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1638 = as_type<float>(_1047) * _1620;
    int _1640 = _1632 ? 0 : 1;
    float _1642 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _1644 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1646 = isnan(0.0);
    bool _1648 = _1644 || _1646;
    bool _1650 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1652 = _1648 || _1650;
    float _1654 = fma(_1600, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1636);
    float _1656 = _1600 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _1658 = _1346 >> 31;
    float _1660 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1512);
    float _1662 = _1652 ? _1558 : 0.0;
    float _1664 = _1474 + (-0.5);
    bool _1666 = _1568 > 0.0;
    float _1668 = trunc(_1638);
    float _1670 = precise::max(_1668, 0.0);
    uint _1672 = uint(_1670);
    float _1674 = _1662 * _1612;
    int _1676 = _1658 & 3;
    float _1678 = _1610 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1680 = -_1027;
    float _1682 = fma(_1656, 2.0, _1680);
    float _1684 = -_1664;
    float _1686 = -_1660;
    float _1688 = fma(_1684, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1686);
    int _1690 = _1346 + _1676;
    float _1692 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1694 = fma(_1618, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1622);
    float _1696 = _1502 + 0.5;
    int _1698 = _1690 >> 2;
    float _1700 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1702 = -_145;
    float _1704 = fma(_1702, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1682);
    int _1706 = ~_1013;
    int _1708 = _1706 + 1;
    float _1710 = _1642 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _1712 = _1698 << 4;
    int _1714 = _1712 + 368;
    float _1716 = fma(_1678, -2.0, _1700);
    int _1718 = int(_1552) + int(_1672);
    float _1720 = _1440 + (-0.5);
    int _1722 = ~_1640;
    int _1724 = _1722 + 1;
    int _1726 = _1724 + 1;
    float _1728 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1716);
    int _1730 = _1726;
    if (!_1666)
    {
        int _1732 = ~_1640;
        int _1734 = _1732 + 1;
        _1730 = _1734;
    }
    int _1736 = _1730;
    float _1738 = _1520 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1740 = _1692 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1742 = -_1710;
    float _1744 = -_1728;
    float _1746 = fma(_1742, _1720, _1744);
    bool _1748 = !_1540;
    int _1750 = _1748 ? 0 : 1;
    float _1752 = _1516 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1754 = fma(_1740, _1696, _1704);
    int _1756 = _1708 * _1718;
    int _1758 = _1756 + _1250;
    uint _1760 = uint(int(uint(_1714) >> uint(2)));
    uint _1762 = uint(int(uint(int(_1760)) >> uint(2)));
    int _1764 = int(_1760) & 3;
    float _1766 = (*spvDescriptorSet0.vp_c9)._m0[int(_1762)][_1764];
    int _1768 = int(_1760) + 1;
    uint _1770 = uint(int(uint(_1768) >> uint(2)));
    int _1772 = _1768 & 3;
    float _1774 = (*spvDescriptorSet0.vp_c9)._m0[int(_1770)][_1772];
    bool _1776 = !_1536;
    int _1778 = _1776 ? 0 : 1;
    float _1780 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1782 = _1738 + _1780;
    int _1784 = abs(_1750);
    float _1786 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1788 = _1752 + _1786;
    bool _1790 = uint(_1758) >= uint(_1013);
    float _1792 = fma(_1586, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1694);
    int _1794 = abs(_1778);
    int _1796 = _1714 + 8;
    uint _1798 = uint(int(uint(_1796) >> uint(2)));
    uint _1800 = uint(int(uint(int(_1798)) >> uint(2)));
    int _1802 = int(_1798) & 3;
    float _1804 = (*spvDescriptorSet0.vp_c9)._m0[int(_1800)][_1802];
    int _1806 = int(_1798) + 1;
    uint _1808 = uint(int(uint(_1806) >> uint(2)));
    int _1810 = _1806 & 3;
    float _1812 = (*spvDescriptorSet0.vp_c9)._m0[int(_1808)][_1810];
    bool _1814 = !_1790;
    int _1816 = _1814 ? 0 : (-1);
    float _1818 = _1782 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _1820 = uint(_1348) >= 2u;
    float _1822 = _1492 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1824 = float(_1434);
    float _1826 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1818);
    int _1828 = _1820 ? 0 : 1;
    float _1830 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1832 = _1822 + _1830;
    bool _1834 = _1348 != 3;
    float _1836 = _1792 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1838 = float(_1794);
    float _1840 = fma(_1832, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1826);
    float _1842 = float(_1736);
    float _1844 = float(_1784);
    out.m_74.w = _1836;
    int _1846 = ~_1828;
    int _1848 = _1846 + 1;
    int _1850 = _1848 + 1;
    float _1852 = _1838 * _1842;
    int _1854 = abs(_1392);
    float _1856 = _1844 * _1824;
    int _1858 = ~_1718;
    int _1860 = _1858 + _1816;
    int _1862 = _1860 + 1;
    int _1864 = _1850;
    int _1866 = as_type<int>(_1782);
    if (_1834)
    {
        int _1868 = ~_1828;
        int _1870 = _1868 + 1;
        _1864 = _1870;
    }
    int _1872 = _1864;
    int _1874 = _1013 * _1862;
    int _1876 = _1874 + _1250;
    bool _1878 = !_1350;
    int _1880 = _1878 ? 0 : 1;
    float _1882 = _1852 * (-2.0);
    float _1884 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1886 = _1348 != 3;
    float _1888 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1890 = abs(_1880);
    float _1892 = fma(_1084, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1884);
    int _1894 = abs(_1872);
    float _1896 = fma(_1086, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1888);
    int _1898 = ~_1854;
    int _1900 = _1898 + 1;
    int _1902 = _1900 + 1;
    float _1904 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1892);
    int _1906 = ~_1890;
    int _1908 = _1906 + 1;
    int _1910 = _1908 + 1;
    float _1912 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1896);
    int _1914 = _1902 * as_type<int>(_1774);
    int _1916 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1918 = _1916 != 0;
    float _1920 = -_1912;
    float _1922 = _1920 + 1.0;
    int _1924 = ~_1894;
    int _1926 = _1924 + 1;
    int _1928 = _1926 + 1;
    int _1930 = _1910 * as_type<int>(_1766);
    int _1932 = _1930 + _1914;
    float _1934 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1654);
    float _1936 = fma(_1474, _1922, _1688);
    float _1938 = _1782 * _1782;
    int _1940 = _1928 * as_type<int>(_1804);
    int _1942 = _1940 + _1932;
    float _1944 = -_1934;
    float _1946 = _1944 + 1.0;
    bool _1948 = !_1886;
    int _1950 = _1948 ? 0 : (-1);
    float _1952 = -_1904;
    float _1954 = _1952 + 1.0;
    bool _1956 = !_1918;
    int _1958 = _1956 ? 0 : 1;
    float _1960 = -_1946;
    float _1962 = fma(_1502, _1960, _1754);
    int _1964 = abs(_1950);
    float _1966 = fma(_1788, _1788, _1938);
    float _1968 = -_1954;
    float _1970 = fma(_1426, _1968, _1634);
    int _1972 = abs(_1958);
    float _1974 = in.m_76.x;
    float _1976 = in.m_76.y;
    float _1978 = in.m_76.z;
    float _1980 = -_1170;
    float _1982 = _1980 + 1.0;
    float _1984 = fma(_1832, _1832, _1966);
    bool _1986 = _1840 >= 0.0;
    float _1988 = fma(_1440, _1982, _1746);
    int _1990 = ~_1964;
    int _1992 = _1990 + 1;
    int _1994 = _1992 + 1;
    float _1996 = rsqrt(_1984);
    float _1998 = fma(_1566, _1882, _1566);
    bool _2000 = !_1033;
    int _2002 = _2000 ? _1876 : (-1);
    int _2004 = _1994 * as_type<int>(_1812);
    int _2006 = _2004 + _1942;
    int _2008 = ~_1972;
    int _2010 = _2008 + 1;
    int _2012 = _2010 + 1;
    out.m_78.x = _1970;
    out.m_78.y = _1936;
    out.m_78.z = _1962;
    out.m_78.w = _1988;
    bool _2014 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2016 = isnan(1.0);
    bool _2018 = _2014 || _2016;
    bool _2020 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2022 = _2018 || _2020;
    int _2024 = _2006 * _2012;
    float _2026 = _1856 * (-2.0);
    float _2028 = _1962;
    if (_1986)
    {
        out.m_61.x = 0.0;
    }
    int _2030 = _2002 * _1972;
    int _2032 = _2030 + _2024;
    float _2034 = _1782 * _1996;
    float _2036 = fma(_1882, _1974, _1974);
    float _2038 = _1788 * _1996;
    if (_1986)
    {
        _2028 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2040 = _2028;
    float _2042 = -_2034;
    float _2044 = fma(_2042, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1782);
    float _2046 = _1084 + (-0.5);
    float _2048 = -_2038;
    float _2050 = fma(_2048, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1788);
    float _2052 = fma(_1570, _2026, _1570);
    if (_1986)
    {
        float _2054 = _2040 * 5.0;
        _1866 = as_type<int>(_2054);
    }
    int _2056 = _1866;
    float _2058 = _2044 * _2044;
    float _2060 = float(_2032);
    float _2062 = fma(_2046, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2036);
    float _2064 = fma(_2026, _1976, _1976);
    if (_1986)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7418 = as_type<float>(_2056);
        out.gl_Position.z = _7418;
    }
    float _2066 = fma(_2050, _2050, _2058);
    bool _2068 = !_1544;
    int _2070 = _2068 ? 0 : 1;
    out.m_80.x = _2060;
    if (_1986)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2072 = -_2034;
    float _2074 = fma(_2072, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1738);
    float _2076 = _1832 * _1996;
    bool _2078 = !_2022;
    float _2080 = _2078 ? _145 : _1674;
    float _2082 = -_2038;
    float _2084 = fma(_2082, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1752);
    float _2086 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2088 = _2074 + _2086;
    float _2090 = -_2076;
    float _2092 = fma(_2090, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1832);
    float _2094 = -_2076;
    float _2096 = fma(_2094, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1822);
    float _2098 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2100 = _2084 + _2098;
    float _2102 = _2088 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2104 = fma(_2092, _2092, _2066);
    float _2106 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2108 = _2096 + _2106;
    int _2110 = abs(_2070);
    float _2112 = fma(_2100, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2102);
    float _2114 = float(_1530);
    float _2116 = _1086 + (-0.5);
    float _2118 = _1088 + _1084;
    float _2120 = fma(_2108, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2112);
    float _2122 = float(_2110);
    float _2124 = fma(_2116, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2064);
    float _2126 = fma(_2080, _1998, _2062);
    float _2128 = _1088 + (-0.5);
    bool _2130 = _2120 >= 0.0;
    float _2132 = _2122 * _2114;
    float _2134 = fma(_2080, _2052, _2124);
    float _2136 = _2118 + (-1.0);
    float _2138 = _2126 * 0.15915493667125701904296875;
    float _2140 = _2132 * (-2.0);
    float _2142 = sqrt(_2104);
    float _2144 = fma(_2136, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2146 = fma(_2140, _1978, _1978);
    float _2148 = _2134 * 0.15915493667125701904296875;
    float _2150 = fma(_2144, _2140, _2144);
    float _2152 = _2114;
    int _2154 = as_type<int>(_2128);
    float _2156 = _2088;
    float _2158 = _2100;
    if (_2130)
    {
        _2152 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2160 = _2152;
    float _2162 = fma(_2128, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2146);
    float _2164 = _2138 * 6.283185482025146484375;
    float _2166 = sin(_2164);
    if (_2130)
    {
        out.m_61.x = 0.0;
    }
    if (_2130)
    {
        float _2168 = _2160 * 5.0;
        _2154 = as_type<int>(_2168);
    }
    int _2170 = _2154;
    float _2172 = fma(_2080, _2150, _2162);
    float _2174 = _2138 * 6.283185482025146484375;
    float _2176 = cos(_2174);
    if (_2130)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7609 = as_type<float>(_2170);
        out.gl_Position.z = _7609;
    }
    float _2178 = _2172 * 0.15915493667125701904296875;
    float _2180 = _2148 * 6.283185482025146484375;
    float _2182 = sin(_2180);
    float _2184 = _2148 * 6.283185482025146484375;
    float _2186 = cos(_2184);
    if (_2130)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2188 = _2178 * 6.283185482025146484375;
    float _2190 = cos(_2188);
    float _2192 = _1996 * _2142;
    float _2194 = _671 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2196 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _225);
    float _2198 = _669 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2200 = _2176 * _2182;
    float _2202 = _2192 * _2194;
    float _2204 = _2166 * _2182;
    float _2206 = _2178 * 6.283185482025146484375;
    float _2208 = sin(_2206);
    float _2210 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _215);
    float _2212 = _2196 * _2202;
    float _2214 = _2176 * _2186;
    float _2216 = _2192 * _2198;
    float _2218 = _2166 * _2186;
    float _2220 = _2176 * _2190;
    float _2222 = _2210 * _2216;
    float _2224 = _2166 * _2190;
    float _2226 = _2186 * _2190;
    float _2228 = _2220 * _2212;
    float _2230 = _2182 * _2190;
    float _2232 = _2192 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2234 = _2232 * 0.5;
    float _2236 = _2220 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2238 = fma(_2208, _2214, _2204);
    float _2240 = -_2218;
    float _2242 = fma(_2208, _2200, _2240);
    float _2244 = -_2212;
    float _2246 = _2208 * _2244;
    float _2248 = -_2200;
    float _2250 = fma(_2208, _2218, _2248);
    float _2252 = fma(_2238, _2222, _2228);
    float _2254 = _2224 * _2212;
    float _2256 = fma(_2226, _2222, _2246);
    float _2258 = fma(_2208, _2204, _2214);
    float _2260 = fma(_2242, _2234, _2252);
    float _2262 = fma(_2250, _2222, _2254);
    float _2264 = fma(_2230, _2234, _2256);
    float _2266 = _2238 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2268 = _2260 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2270 = _2260 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2272 = fma(_2258, _2234, _2262);
    float _2274 = _2238 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2276 = fma(_2264, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2268);
    float _2278 = fma(_2264, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2270);
    float _2280 = _2238 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2282 = _2260 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2284 = fma(_2272, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2276);
    float _2286 = fma(_2272, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2278);
    float _2288 = fma(_2226, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2266);
    float _2290 = fma(_2226, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2274);
    float _2292 = _2284 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2294 = _2286 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2296 = fma(_2226, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2280);
    float _2298 = _2220 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2300 = _1752 + _2292;
    float _2302 = _1822 + _2294;
    float _2304 = _2220 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2306 = fma(_2264, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2282);
    float _2308 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2310 = _2300 + _2308;
    float _2312 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2314 = _2302 + _2312;
    float _2316 = -_2208;
    float _2318 = fma(_2316, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2298);
    float _2320 = -_2208;
    float _2322 = fma(_2320, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2304);
    float _2324 = _2310 * _2310;
    float _2326 = _2314 * _2314;
    float _2328 = fma(_2272, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2306);
    float _2330 = -_2208;
    float _2332 = fma(_2330, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2236);
    float _2334 = fma(_2250, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2288);
    float _2336 = _2324 + _2326;
    float _2338 = _2242 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2340 = _2242 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2342 = _2242 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2344 = sqrt(_2336);
    float _2346 = _2328 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2348 = fma(_2250, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2290);
    float _2350 = fma(_2230, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2338);
    float _2352 = fma(_2230, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2340);
    float _2354 = fma(_2230, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2342);
    float _2356 = fma(_2250, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2296);
    float _2358 = _1738 + _2346;
    bool _2360 = _2344 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _2362 = !_2360;
    float _2364 = _2358;
    float _2366 = _2324;
    float _2368 = _2326;
    float _2370 = _2300;
    float _2372 = _2302;
    float _2374 = _2242;
    float _2376 = _2258;
    if (!_2362)
    {
        float _2378 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2380 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2382 = _2344 + _2380;
        float _2384 = _2358 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2386 = rsqrt(_2336);
        float _2388 = _2382 * _2378;
        float _2390 = _2388 * 0.15915493667125701904296875;
        float _2392 = _2390 * 6.283185482025146484375;
        float _2394 = sin(_2392);
        float _2396 = _2390 * 6.283185482025146484375;
        float _2398 = cos(_2396);
        float _2400 = fma(_2394, _2384, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2402 = _2386 * _2400;
        float _2404 = _2398 + (-1.0);
        float _2406 = fma(_2310, _2402, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2408 = fma(_2314, _2402, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2410 = _2404 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2412 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2414 = _2406 + _2412;
        float _2416 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2418 = _2408 + _2416;
        float _2420 = fma(_2358, _2398, _2410);
        float _2422 = _2414 * _2414;
        float _2424 = _2418 * _2418;
        _2364 = _2420;
        _2366 = _2422;
        _2368 = _2424;
        _2370 = _2406;
        _2372 = _2408;
        _2374 = _2390;
    }
    float _2426 = _2364;
    float _2428 = _2366;
    float _2430 = _2368;
    float _2432 = _2370;
    float _2434 = _2372;
    float _2436 = _2374;
    float _2438 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2440 = _2426 + _2438;
    float _2442 = fma(_2224, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2318);
    float _2444 = fma(_2224, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2322);
    float _2446 = _225 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2448 = fma(_2440, _2440, _2428);
    float _2450 = fma(_2224, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2332);
    float _2452 = _215 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2454 = _2446 * _2442;
    float _2456 = _2448 + _2430;
    float _2458 = _2446 * _2444;
    float _2460 = _2446 * _2450;
    float _2462 = fma(_2258, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2350);
    float _2464 = fma(_2258, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2352);
    float _2466 = fma(_2258, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2354);
    float _2468 = sqrt(_2456);
    float _2470 = fma(_2452, _2334, _2454);
    float _2472 = fma(_2452, _2348, _2458);
    float _2474 = fma(_2452, _2356, _2460);
    float _2476 = _2462 + _2470;
    float _2478 = _2464 + _2472;
    float _2480 = _2466 + _2474;
    out.m_82.x = _2476;
    out.m_82.y = _2478;
    out.m_82.z = _2480;
    bool _2482 = _2468 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2484 = isnan(_2468);
    bool _2486 = _2482 || _2484;
    bool _2488 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2490 = _2486 || _2488;
    float _2492 = _2436;
    float _2494 = _2474;
    if (!_2490)
    {
        _2376 = 1.0;
    }
    float _2496 = _2376;
    bool _2498 = !_2490;
    float _2500 = _2496;
    if (!_2498)
    {
        bool _2502 = _2468 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2504 = isnan(_2468);
        bool _2506 = _2502 || _2504;
        bool _2508 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2510 = _2506 || _2508;
        if (!_2510)
        {
            float _2512 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2514 = _2468 + _2512;
            float _2516 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2518 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2516;
            float _2520 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2522 = _2520 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2524 = 1.0 / _2518;
            float _2526 = _2514 * _2524;
            float _2528 = fma(_2526, _2522, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2500 = _2528;
            _2530 = true;
        }
        else
        {
            bool _2532 = _2468 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2534 = isnan(_2468);
            bool _2536 = _2532 || _2534;
            bool _2538 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2540 = _2536 || _2538;
            if (!_2540)
            {
                float _2542 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2544 = _2468 + _2542;
                float _2546 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2548 = _2546 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2550 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2552 = _2550 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2554 = 1.0 / _2548;
                float _2556 = _2544 * _2554;
                float _2558 = fma(_2556, _2552, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2500 = _2558;
                _2530 = true;
            }
            else
            {
                _2500 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2530 = false;
    float _2560 = _2500;
    float _2562 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2564 = _2426 + _2562;
    float _2566 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2568 = _2432 + _2566;
    float _2570 = fma(_2564, _2560, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2572 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2574 = _2434 + _2572;
    float _2576 = fma(_2568, _2560, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2578 = -_1738;
    float _2580 = _2578 + _2570;
    float _2582 = fma(_2574, _2560, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2584 = -_1752;
    float _2586 = _2584 + _2576;
    float _2588 = _2580 * _2580;
    float _2590 = -_1822;
    float _2592 = _2590 + _2582;
    float _2594 = fma(_2586, _2586, _2588);
    float _2596 = fma(_2592, _2592, _2594);
    float _2598 = sqrt(_2596);
    bool _2600 = _2598 > 0.0;
    bool _2602 = !_2600;
    float _2604 = _2576;
    float _2606 = _2570;
    float _2608 = _2582;
    if (!_2602)
    {
        bool _2610 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2612 = _2598;
        if (_2610)
        {
            float _2614 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2612 = _2614;
        }
        float _2616 = _2612;
        float _2618 = _2616;
        if (_2610)
        {
            float _2620 = _459 * _2616;
            _2492 = _2620;
        }
        float _2622 = _2492;
        float _2624 = _2622;
        if (_2610)
        {
            float _2626 = _461 * _2616;
            _2494 = _2626;
        }
        float _2628 = _2494;
        float _2630 = _2628;
        if (_2610)
        {
            float _2632 = _463 * _2616;
            _2618 = _2632;
        }
        float _2634 = _2618;
        float _2636 = _2634;
        if (!_2610)
        {
            float _2638 = _145 + 1.0;
            if (!_181)
            {
                float _2640 = _2638 * _2638;
                float _2642 = _2640 * 0.5;
                _147 = _2642;
            }
            float _2644 = _147;
            float _2646 = _2644;
            if (!_181)
            {
                float _2648 = _2644 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2646 = _2648;
            }
            float _2650 = _2646;
            bool _2652 = !_181;
            float _2654 = _2650;
            if (!_2652)
            {
                float _2656 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2658 = log2(_2656);
                float _2660 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2662 = _2660 + 1.0;
                float _2664 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2666 = _2658 * _2638;
                float _2668 = exp2(_2666);
                float _2670 = _2664 * 0.693147182464599609375;
                float _2672 = 1.0 / _2670;
                float _2674 = 1.0 / _2662;
                float _2676 = _2668 + (-1.0);
                float _2678 = -_2676;
                float _2680 = fma(_2678, _2672, _2638);
                float _2682 = _2680 * _2674;
                float _2684 = _2682 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2654 = _2684;
            }
            float _2686 = _2654;
            float _2688 = _2686 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _2690 = _2686 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2692 = _2686 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2694 = _2688 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
            float _2696 = _2688 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
            float _2698 = fma(_2690, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2694);
            float _2700 = _2688 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
            float _2702 = fma(_2690, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2696);
            float _2704 = _2696;
            if (!_181)
            {
                _2704 = _2638;
            }
            float _2706 = _2704;
            float _2708 = fma(_2692, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2698);
            bool _2710 = !_181;
            float _2712 = _2706;
            if (!_2710)
            {
                float _2714 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2716 = log2(_2714);
                float _2718 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2720 = _2718 + 1.0;
                float _2722 = 1.0 / _2720;
                float _2724 = _2716 * _2638;
                float _2726 = exp2(_2724);
                float _2728 = -_2726;
                float _2730 = _2728 + 1.0;
                float _2732 = _2730 * _2722;
                _2712 = _2732;
            }
            float _2734 = _2712;
            float _2736 = fma(_2692, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2702);
            float _2738 = fma(_2734, _185, _2708);
            float _2740 = fma(_2690, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2700);
            float _2742 = fma(_2734, _183, _2736);
            float _2744 = -_421;
            float _2746 = _2744 + _2738;
            float _2748 = fma(_2692, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2740);
            float _2750 = -_423;
            float _2752 = _2750 + _2742;
            float _2754 = _2746 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _2756 = _2746 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _2758 = fma(_2734, _187, _2748);
            float _2760 = _2746 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _2762 = fma(_2752, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2754);
            float _2764 = fma(_2752, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2756);
            float _2766 = -_425;
            float _2768 = _2766 + _2758;
            float _2770 = fma(_2752, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2760);
            float _2772 = fma(_2768, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2762);
            float _2774 = fma(_2768, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2764);
            float _2776 = fma(_2768, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2770);
            _467 = _2774;
            _469 = _2772;
            _471 = _2776;
            _2624 = _2772;
            _2630 = _2774;
            _2636 = _2776;
        }
        float _2778 = _467;
        float _2780 = _469;
        float _2782 = _471;
        float _2784 = _2624;
        float _2786 = _2630;
        float _2788 = _2636;
        float _2790 = _2778 * _2778;
        float _2792 = fma(_2780, _2780, _2790);
        float _2794 = fma(_2782, _2782, _2792);
        float _2796 = rsqrt(_2596);
        float _2798 = sqrt(_2794);
        float _2800 = _2586 * _2796;
        float _2802 = _2580 * _2796;
        float _2804 = _2592 * _2796;
        bool _2806 = _2798 > 0.0;
        bool _2808 = !_2806;
        if (!_2808)
        {
            float _2810 = rsqrt(_2794);
            float _2812 = _2810 * _2778;
            float _2814 = _2810 * _2780;
            float _2816 = _2810 * _2782;
            float _2818 = _2802 * _2812;
            float _2820 = fma(_2800, _2814, _2818);
            float _2822 = fma(_2804, _2816, _2820);
            float _2824 = _2822 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2826 = fma(_2784, _2824, _2576);
            float _2828 = fma(_2786, _2824, _2570);
            float _2830 = fma(_2788, _2824, _2582);
            _2604 = _2826;
            _2606 = _2828;
            _2608 = _2830;
        }
    }
    float _2832 = _2604;
    float _2834 = _2606;
    float _2836 = _2608;
    float _2838 = fma(_2084, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2840 = fma(_2096, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2842 = floor(_2838);
    float _2844 = floor(_2840);
    float _2846 = -_2842;
    float _2848 = _2838 + _2846;
    float _2850 = -_2844;
    float _2852 = _2840 + _2850;
    float2 _8736 = float2(_2848, _2852);
    float _2854 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8736, float2(0.0), isnan(_8736)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8736, float2(0.0), isnan(_8736)), level(0.0)).x;
    float _2856 = _2074 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2858 = -_2038;
    float _2860 = fma(_2858, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2832);
    float _2862 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2856);
    float _2864 = -_2034;
    float _2866 = fma(_2864, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2834);
    float _2868 = fma(_2096, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2862);
    float _2870 = _2074 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2872 = _2868 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2874 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2870);
    float _2876 = 1.0 / _2872;
    float _2878 = fma(_2096, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2874);
    float _2880 = _2878 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2882 = _2880 + _2872;
    float _2884 = _2882 * _2876;
    float _2886 = _2884 * 0.5;
    float _2888 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2890 = fma(_2886, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2888);
    float _2892 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _2894 = _2074 + _2892;
    float _2896 = 1.0 / _2890;
    float _2898 = _2894 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _2900 = _2894 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2902 = fma(_2084, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2898);
    float _2904 = fma(_2084, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2900);
    float _2906 = fma(_2096, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2902);
    float _2908 = fma(_2096, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2904);
    float _2910 = _2906 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _2912 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2914 = _2896 * _2912;
    float _2916 = _2908 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _2918 = trunc(_2910);
    int _2920 = int(_2918);
    bool _2922 = _2914 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _2924 = _2914 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _2926 = !_2922;
    int _2928 = _2926 ? 0 : 1;
    float _2930 = trunc(_2916);
    int _2932 = int(_2930);
    int _2934 = 2;
    float _2936 = _2866;
    float _2938 = _2860;
    float _2940 = _2834;
    float _2942 = _2910;
    float _2944 = _2916;
    float _2946 = _2894;
    if (!_2922)
    {
        _2934 = 1;
    }
    int _2948 = _2934;
    int _2950 = _2948;
    if (!_2924)
    {
        _2950 = _2928;
    }
    int _2952 = _2950;
    int _2954 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2956 = _2920 + _2954;
    int _2958 = _2956 + 1;
    int _2960 = _2952 << 6;
    bool _2962 = _2958 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _2964 = _2960 + 48;
    uint _2966 = uint(int(uint(_2964) >> uint(2)));
    uint _2968 = uint(int(uint(int(_2966)) >> uint(2)));
    int _2970 = int(_2966) & 3;
    float _2972 = (*spvDescriptorSet0.vp_c15)._m0[int(_2968)][_2970];
    int _2974 = int(_2966) + 1;
    uint _2976 = uint(int(uint(_2974) >> uint(2)));
    int _2978 = _2974 & 3;
    float _2980 = (*spvDescriptorSet0.vp_c15)._m0[int(_2976)][_2978];
    int _2982 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2984 = _2932 + _2982;
    int _2986 = _2984 + 1;
    int _2988 = _2958 | _2986;
    int _2990 = _2960 + 56;
    uint _2992 = uint(int(uint(_2990) >> uint(2)));
    uint _2994 = uint(int(uint(int(_2992)) >> uint(2)));
    int _2996 = int(_2992) & 3;
    float _2998 = (*spvDescriptorSet0.vp_c15)._m0[int(_2994)][_2996];
    int _3000 = int(_2992) + 1;
    uint _3002 = uint(int(uint(_3000) >> uint(2)));
    int _3004 = _3000 & 3;
    float _3006 = (*spvDescriptorSet0.vp_c15)._m0[int(_3002)][_3004];
    bool _3008 = _2988 < 0;
    bool _3010 = _3008 || _2962;
    bool _3012 = _2986 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _3014 = _3012 || _3010;
    bool _3016 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _3018 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _3020 = _3016 || _3018;
    bool _3022 = isnan(0.5);
    bool _3024 = _3020 || _3022;
    int _3026 = _2960 + 64;
    uint _3028 = uint(int(uint(_3026) >> uint(2)));
    uint _3030 = uint(int(uint(int(_3028)) >> uint(2)));
    int _3032 = int(_3028) & 3;
    float _3034 = (*spvDescriptorSet0.vp_c15)._m0[int(_3030)][_3032];
    int _3036 = int(_3028) + 1;
    uint _3038 = uint(int(uint(_3036) >> uint(2)));
    int _3040 = _3036 & 3;
    float _3042 = (*spvDescriptorSet0.vp_c15)._m0[int(_3038)][_3040];
    float _3044 = -_2076;
    float _3046 = fma(_3044, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2836);
    int _3048 = _2960 + 72;
    uint _3050 = uint(int(uint(_3048) >> uint(2)));
    uint _3052 = uint(int(uint(int(_3050)) >> uint(2)));
    int _3054 = int(_3050) & 3;
    float _3056 = (*spvDescriptorSet0.vp_c15)._m0[int(_3052)][_3054];
    int _3058 = int(_3050) + 1;
    uint _3060 = uint(int(uint(_3058) >> uint(2)));
    int _3062 = _3058 & 3;
    float _3064 = (*spvDescriptorSet0.vp_c15)._m0[int(_3060)][_3062];
    int _3066 = _2986;
    float _3068 = _3046;
    float _3070 = as_type<float>(_2952);
    if (!_3014)
    {
        int _3072 = _2986 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _3074 = _3072 + _2958;
        _3066 = _3074;
    }
    int _3076 = _3066;
    int _3078 = _2960 + 96;
    uint _3080 = uint(int(uint(_3078) >> uint(2)));
    uint _3082 = uint(int(uint(int(_3080)) >> uint(2)));
    int _3084 = int(_3080) & 3;
    float _3086 = (*spvDescriptorSet0.vp_c15)._m0[int(_3082)][_3084];
    int _3088 = int(_3080) + 1;
    uint _3090 = uint(int(uint(_3088) >> uint(2)));
    int _3092 = _3088 & 3;
    float _3094 = (*spvDescriptorSet0.vp_c15)._m0[int(_3090)][_3092];
    int _3096 = _2960 + 104;
    uint _3098 = uint(int(uint(_3096) >> uint(2)));
    uint _3100 = uint(int(uint(int(_3098)) >> uint(2)));
    int _3102 = int(_3098) & 3;
    float _3104 = (*spvDescriptorSet0.vp_c15)._m0[int(_3100)][_3102];
    int _3106 = int(_3098) + 1;
    uint _3108 = uint(int(uint(_3106) >> uint(2)));
    int _3110 = _3106 & 3;
    float _3112 = (*spvDescriptorSet0.vp_c15)._m0[int(_3108)][_3110];
    int _3114 = as_type<int>(_3094);
    int _3116 = as_type<int>(_3086);
    if (!_3024)
    {
        float _3118 = _2088 * _2088;
        float _3120 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3122 = -_1822;
        float _3124 = _3122 + _2836;
        float _3126 = fma(_2100, _2100, _3118);
        float _3128 = fma(_2108, _2108, _3126);
        float _3130 = 1.0 / _2192;
        float _3132 = sqrt(_3128);
        float _3134 = precise::min(_3132, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3136 = _3134 * _3120;
        float _3138 = -_1738;
        float _3140 = _3138 + _2834;
        float _3142 = _3136 * _3130;
        float _3144 = -_1752;
        float _3146 = _3144 + _2832;
        float _3148 = fma(_3140, _3142, _2074);
        float _3150 = fma(_3146, _3142, _2084);
        float _3152 = fma(_3124, _3142, _2096);
        _2936 = _3148;
        _2938 = _3150;
        _3068 = _3152;
        _2156 = _3118;
        _2158 = _3132;
    }
    float _3154 = _2936;
    float _3156 = _2938;
    float _3158 = _3068;
    float _3160 = _2156;
    float _3162 = _2158;
    float _3164 = _2894 * _3094;
    float _3166 = _3160;
    float _3168 = _3162;
    if (!_3014)
    {
        int _3170 = _3076 << 2;
        _3114 = _3170;
    }
    int _3172 = _3114;
    float _3174 = _3154 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3176 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3178 = fma(_2084, _3086, _3164);
    int _3180 = _3172;
    if (!_3014)
    {
        uint _3182 = uint(int(uint(_3076) >> uint(2)));
        _3116 = int(_3182);
    }
    int _3184 = _3116;
    float _3186 = fma(_3156, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3174);
    if (!_3014)
    {
        int _3188 = 12 & _3172;
        _3180 = _3188;
    }
    int _3190 = _3180;
    float _3192 = fma(_2096, _3104, _3178);
    float _3194 = fma(_3158, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3186);
    if (!_3014)
    {
        int _3196 = _3184 << 4;
        int _3198 = _3196 + _3190;
        _2940 = as_type<float>(_3198);
    }
    float _3200 = _2940;
    float _3202 = _3192 + _3112;
    int _3204 = _2960 + 80;
    uint _3206 = uint(int(uint(_3204) >> uint(2)));
    uint _3208 = uint(int(uint(int(_3206)) >> uint(2)));
    int _3210 = int(_3206) & 3;
    float _3212 = (*spvDescriptorSet0.vp_c15)._m0[int(_3208)][_3210];
    int _3214 = int(_3206) + 1;
    uint _3216 = uint(int(uint(_3214) >> uint(2)));
    int _3218 = _3214 & 3;
    float _3220 = (*spvDescriptorSet0.vp_c15)._m0[int(_3216)][_3218];
    float _3222 = _2894 * _2980;
    float _3224 = _2894 * _3042;
    float _3226 = _3194 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3228 = 1.0 / _3202;
    float _3230 = fma(_2084, _2972, _3222);
    float _3232 = fma(_2084, _3034, _3224);
    float _3234 = _3226 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3236 = _3200;
    if (!_3014)
    {
        int _3238 = as_type<int>(_3200) + 400;
        uint _3240 = uint(int(uint(_3238) >> uint(2)));
        uint _3242 = uint(int(uint(int(_3240)) >> uint(2)));
        int _3244 = int(_3240) & 3;
        float _3246 = (*spvDescriptorSet0.vp_c15)._m0[int(_3242)][_3244];
        _3236 = _3246;
    }
    float _3248 = _3236;
    float _3250 = _3154 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3252 = fma(_2096, _2998, _3230);
    float _3254 = -_3234;
    float _3256 = fma(_3254, _3176, 1.0);
    float _3258 = _3154 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3260 = fma(_3156, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3250);
    float _3262 = _3252 + _3006;
    float _3264 = fma(_2096, _3056, _3232);
    int _3266 = _2960 + 88;
    uint _3268 = uint(int(uint(_3266) >> uint(2)));
    uint _3270 = uint(int(uint(int(_3268)) >> uint(2)));
    int _3272 = int(_3268) & 3;
    float _3274 = (*spvDescriptorSet0.vp_c15)._m0[int(_3270)][_3272];
    int _3276 = int(_3268) + 1;
    uint _3278 = uint(int(uint(_3276) >> uint(2)));
    int _3280 = _3276 & 3;
    float _3282 = (*spvDescriptorSet0.vp_c15)._m0[int(_3278)][_3280];
    float _3284 = fma(_3156, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3258);
    float _3286 = fma(_3158, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3260);
    float _3288 = _3264 + _3064;
    float _3290 = _3262 * _3228;
    float _3292 = fma(_3158, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3284);
    float _3294 = _3154 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3296 = _3288 * _3228;
    float _3298 = _3286 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    bool _3300 = _3290 >= 0.0;
    float _3302 = _3292 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3304 = fma(_3156, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3294);
    float _3306 = log2(_3256);
    bool _3308 = _3290 <= 1.0;
    bool _3310 = _3308 && _3300;
    float _3312 = _3302 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3314 = fma(_3158, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3304);
    bool _3316 = _3296 >= 0.0;
    bool _3318 = _3316 && _3310;
    float _3320 = fma(_3298, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3312);
    float _3322 = _3314 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3324 = _3302 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    bool _3326 = _3296 <= 1.0;
    bool _3328 = _3326 && _3318;
    float _3330 = fma(_3226, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3320);
    float _3332 = _3176;
    if (!_3014)
    {
        float _3334 = floor(_2910);
        _3332 = _3334;
    }
    float _3336 = _3332;
    float _3338 = fma(_3322, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3330);
    float _3340 = _3306 * 0.693147182464599609375;
    float _3342 = 1.0 / _3338;
    float _3344 = _2894 * _3220;
    float _3346 = _3302 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3348 = _3340;
    if (_3328)
    {
        float _3350 = float(_2952);
        _3070 = _3350;
    }
    float _3352 = _3070;
    float _3354 = _3340 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3356 = fma(_2084, _3212, _3344);
    float _3358 = fma(_3298, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3324);
    float _3360 = fma(_3298, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3346);
    float _3362 = _3256;
    if (!_3014)
    {
        float _3364 = floor(_2916);
        _3362 = _3364;
    }
    float _3366 = _3362;
    if (!_3014)
    {
        float _3368 = -_3336;
        float _3370 = _2910 + _3368;
        _2942 = _3370;
    }
    float _3372 = _2942;
    float _3374 = fma(_3226, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3358);
    float _3376 = fma(_3226, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3360);
    float _3378 = fma(_3322, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3374);
    float _3380 = fma(_3322, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3376);
    float _3382 = _3248;
    float _3384 = _3378;
    if (!_3014)
    {
        float _3386 = rint(_3248);
        float _3388 = precise::max(_3386, 0.0);
        uint _3390 = uint(_3388);
        uint _3392 = clamp(_3390, 0u, 65535u);
        _3382 = as_type<float>(_3392);
    }
    float _3394 = _3382;
    float _3396 = fma(_2096, _3274, _3356);
    float _3398 = _3380 * _3342;
    float _3400 = _3396 + _3282;
    float _3402 = _3378 * _3342;
    float _3404 = fma(_3398, -0.5, 0.5);
    float _3406 = _3356;
    float _3408 = _3402;
    if (_3328)
    {
        float _3410 = rint(_3352);
        float _3412 = precise::max(_3410, 0.0);
        uint _3414 = uint(_3412);
        uint _3416 = clamp(_3414, 0u, 65535u);
        _3406 = as_type<float>(_3416);
    }
    float _3418 = _3406;
    if (!_3014)
    {
        float _3420 = -_3366;
        float _3422 = _2916 + _3420;
        _3166 = _3422;
    }
    float _3424 = _3166;
    float _3426 = _3400 * _3228;
    float _3428 = fma(_3402, 0.5, 0.5);
    float _3430 = _3394;
    if (!_3014)
    {
        float3 _9710 = float3(_3372, _3424, float(as_type<int>(_3394)));
        float3 _9714 = select(_9710, float3(0.0), isnan(_9710));
        float _3432 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _9714.xy, uint(rint(_9714.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _9714.xy, uint(rint(_9714.z)), level(0.0)).x;
        _3430 = _3432;
    }
    float _3434 = _3430;
    float _3436 = _3296;
    if (_3328)
    {
        float3 _9729 = float3(_3290, _3296, float(as_type<int>(_3418)));
        float3 _9731 = select(_9729, float3(0.0), isnan(_9729));
        float _3438 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _9731.xy, uint(rint(_9731.z)), _3426, level(0.0));
        _3436 = _3438;
    }
    float _3440 = _3436;
    float3 _9741 = float3(_3428, _3404, _3354);
    float _3442 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9741, float3(0.0), isnan(_9741)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9741, float3(0.0), isnan(_9741)), level(0.0)).x;
    float3 _9750 = float3(_3428, _3404, _3354);
    float4 _3445 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9750, float3(0.0), isnan(_9750)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9750, float3(0.0), isnan(_9750)), level(0.0)).xyzw;
    float _3447 = _3445.x;
    float _3449 = _3445.y;
    float _3451 = _3445.z;
    float _3453 = _3445.w;
    if (_3014)
    {
        _2944 = 1.0;
    }
    float _3455 = _2944;
    bool _3457 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _3459 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3461 = _3457 || _3459;
    bool _3463 = isnan(0.5);
    bool _3465 = _3461 || _3463;
    float _3467 = _3455;
    if (_3465)
    {
        _3348 = 1.0;
    }
    float _3469 = _3348;
    float _3471 = _3469;
    if (_3465)
    {
        _3168 = 1.0;
    }
    float _3473 = _3168;
    float _3475 = _3473;
    if (!_3465)
    {
        float _3477 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _3479 = _3477 * 0.15915493667125701904296875;
        float _3481 = _3479 * 6.283185482025146484375;
        float _3483 = cos(_3481);
        float _3485 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _3487 = _3485 * 0.15915493667125701904296875;
        float _3489 = _3479 * 6.283185482025146484375;
        float _3491 = sin(_3489);
        float _3493 = 1.0 / _3483;
        float _3495 = _3487 * 6.283185482025146484375;
        float _3497 = cos(_3495);
        float _3499 = _3491 * _3493;
        float _3501 = _3487 * 6.283185482025146484375;
        float _3503 = sin(_3501);
        float _3505 = _3497 * _3499;
        float _3507 = 1.0 / _3505;
        float _3509 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3511 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3509;
        float _3513 = 1.0 / _3511;
        float _3515 = _3503 * _3507;
        float _3517 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3519 = fma(_2914, _3515, _3517);
        float _3521 = _3519 * _3513;
        float _3523 = precise::clamp(_3521, 0.0, 1.0);
        _3408 = _3493;
        _3475 = _3523;
    }
    float _3525 = _3408;
    float _3527 = _3475;
    float _3529 = _3525;
    if (!_3465)
    {
        float _3531 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _3533 = _3531 * 0.15915493667125701904296875;
        float _3535 = _3533 * 6.283185482025146484375;
        float _3537 = cos(_3535);
        float _3539 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _3541 = _3539 * 0.15915493667125701904296875;
        float _3543 = _3533 * 6.283185482025146484375;
        float _3545 = sin(_3543);
        float _3547 = 1.0 / _3537;
        float _3549 = _3541 * 6.283185482025146484375;
        float _3551 = cos(_3549);
        float _3553 = _3545 * _3547;
        float _3555 = _3541 * 6.283185482025146484375;
        float _3557 = sin(_3555);
        float _3559 = _3551 * _3553;
        float _3561 = 1.0 / _3559;
        float _3563 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3565 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _3563;
        float _3567 = 1.0 / _3565;
        float _3569 = _3557 * _3561;
        float _3571 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3573 = fma(_2914, _3569, _3571);
        float _3575 = _3573 * _3567;
        float _3577 = precise::clamp(_3575, 0.0, 1.0);
        float _3579 = -_3577;
        float _3581 = _3579 + 1.0;
        _3529 = _3533;
        _3471 = _3581;
    }
    float _3583 = _3529;
    float _3585 = _3471;
    float _3587 = _3583;
    if (!_3014)
    {
        int _3589 = _3076 << 4;
        int _3591 = _3589 + 2048;
        uint _3593 = uint(int(uint(_3591) >> uint(2)));
        uint _3595 = uint(int(uint(int(_3593)) >> uint(2)));
        int _3597 = int(_3593) & 3;
        float _3599 = (*spvDescriptorSet0.vp_c15)._m0[int(_3595)][_3597];
        int _3601 = int(_3593) + 1;
        uint _3603 = uint(int(uint(_3601) >> uint(2)));
        int _3605 = _3601 & 3;
        float _3607 = (*spvDescriptorSet0.vp_c15)._m0[int(_3603)][_3605];
        int _3609 = _3591 + 8;
        uint _3611 = uint(int(uint(_3609) >> uint(2)));
        uint _3613 = uint(int(uint(int(_3611)) >> uint(2)));
        int _3615 = int(_3611) & 3;
        float _3617 = (*spvDescriptorSet0.vp_c15)._m0[int(_3613)][_3615];
        int _3619 = int(_3611) + 1;
        uint _3621 = uint(int(uint(_3619) >> uint(2)));
        int _3623 = _3619 & 3;
        float _3625 = (*spvDescriptorSet0.vp_c15)._m0[int(_3621)][_3623];
        float _3627 = _2894 * _3607;
        float _3629 = fma(_2084, _3599, _3627);
        float _3631 = fma(_2096, _3617, _3629);
        float _3633 = _3631 + _3625;
        float _3635 = precise::clamp(_3633, 0.0, 1.0);
        float _3637 = -_3635;
        float _3639 = _3637 + _3434;
        float _3641 = fma(_3639, 500.0, 1.5);
        float _3643 = exp2(_3641);
        float _3645 = 0.0 + _3643;
        float _3647 = precise::clamp(_3645, 0.0, 1.0);
        _2946 = _3631;
        _3587 = _3625;
        _3467 = _3647;
    }
    float _3649 = _2946;
    float _3651 = _3587;
    float _3653 = _3467;
    float _3655 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3657 = _3154 + _3655;
    float _3659 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3661 = _3156 + _3659;
    float _3663 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3665 = _3158 + _3663;
    float _3667 = _3657 * _3657;
    float _3669 = fma(_3661, _3661, _3667);
    float _3671 = fma(_3665, _3665, _3669);
    float _3673 = rsqrt(_3671);
    float _3675 = _3673 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3677 = _3661 * _3675;
    float _3679 = _3665 * _3675;
    float _3681 = _3677 * _3677;
    float _3683 = _3679 * _3679;
    float _3685 = _3681 + _3683;
    float _3687 = sqrt(_3685);
    bool _3689 = _3687 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3691 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3693 = _3687 + _3691;
    float _3695 = _3665;
    float _3697 = _3667;
    float _3699 = _3693;
    float _3701 = _3649;
    float _3703 = _3675;
    if (_3689)
    {
        float _3705 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3695 = _3705;
    }
    float _3707 = _3695;
    if (_3689)
    {
        float _3709 = rsqrt(_3685);
        _3697 = _3709;
    }
    float _3711 = _3697;
    float _3713 = _3711;
    if (_3689)
    {
        float _3715 = _3693 * _3707;
        _3699 = _3715;
    }
    float _3717 = _3699;
    if (_3689)
    {
        float _3719 = _3717 * 0.15915493667125701904296875;
        _3701 = _3719;
    }
    float _3721 = _3701;
    float _3723 = _3673;
    float _3725 = _3721;
    if (_3689)
    {
        float _3727 = _3721 * 6.283185482025146484375;
        float _3729 = sin(_3727);
        _3723 = _3729;
    }
    float _3731 = _3723;
    float _3733 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3735 = precise::max(0.0, _3733);
    float _3737 = _3651;
    float _3739 = _3735;
    float _3741 = _3733;
    if (_3689)
    {
        float _3743 = _3721 * 6.283185482025146484375;
        float _3745 = cos(_3743);
        _3737 = _3745;
    }
    float _3747 = _3737;
    float _3749 = -_3675;
    float _3751 = -_3735;
    float _3753 = fma(_3657, _3749, _3751);
    float _3755 = _3753;
    if (_3689)
    {
        float _3757 = _3753 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3739 = _3757;
    }
    float _3759 = _3739;
    float _3761 = _3731;
    float _3763 = _3759;
    if (_3689)
    {
        float _3765 = fma(_3731, _3759, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3761 = _3765;
    }
    float _3767 = _3761;
    float _3769 = _3767;
    if (!_3689)
    {
        _3763 = _3679;
    }
    float _3771 = _3763;
    float _3773 = _3771;
    float _3775 = _3747;
    if (_3689)
    {
        float _3777 = _3747 + (-1.0);
        _3741 = _3777;
    }
    float _3779 = _3741;
    if (_3689)
    {
        float _3781 = _3711 * _3767;
        _3703 = _3781;
    }
    float _3783 = _3703;
    if (!_3689)
    {
        _3769 = _3677;
    }
    float _3785 = _3769;
    float _3787 = _3785;
    if (_3689)
    {
        float _3789 = _3779 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3725 = _3789;
    }
    float _3791 = _3725;
    if (_3689)
    {
        float _3793 = _3677 * _3783;
        _3787 = _3793;
    }
    float _3795 = _3787;
    if (!_3689)
    {
        _3713 = _3681;
    }
    float _3797 = _3713;
    float _3799 = _3797;
    if (_3689)
    {
        float _3801 = _3679 * _3783;
        _3773 = _3801;
    }
    float _3803 = _3773;
    if (_3689)
    {
        float _3805 = fma(_3753, _3747, _3791);
        _3755 = _3805;
    }
    float _3807 = _3755;
    if (_3689)
    {
        float _3809 = _3795 * _3795;
        _3799 = _3809;
    }
    float _3811 = _3799;
    if (!_3689)
    {
        _3775 = _3683;
    }
    float _3813 = _3775;
    float _3815 = _3813;
    if (_3689)
    {
        float _3817 = _3803 * _3803;
        _3815 = _3817;
    }
    float _3819 = _3815;
    float _3821 = sqrt(_3671);
    float _3823 = fma(_3807, _3807, _3811);
    float _3825 = _3823 + _3819;
    float _3827 = rsqrt(_3825);
    float _3829 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3831 = fma(_3821, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3829);
    float _3833 = precise::clamp(_3831, 0.0, 1.0);
    float _3835 = -_3833;
    float _3837 = _3835 + 1.0;
    float _3839 = _3827 * _3807;
    float _3841 = _3827 * _3795;
    float _3843 = abs(_3837);
    float _3845 = log2(_3843);
    float _3847 = _3827 * _3803;
    float _3849 = _3841 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3851 = -_3849;
    float _3853 = fma(_3839, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3851);
    float _3855 = -_3847;
    float _3857 = fma(_3855, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3853);
    float _3859 = fma(_3857, -0.5, 0.5);
    float _3861 = _3845 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3863 = fma(_3857, 0.5, 0.5);
    float _3865 = sqrt(_3859);
    float _3867 = fma(_3863, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3869 = fma(_3863, _3867, -0.212114393711090087890625);
    float _3871 = _3839 + 1.0;
    float _3873 = exp2(_3861);
    float _3875 = fma(_3863, _3869, 1.570728778839111328125);
    float _3877 = _3865 * 0.636619746685028076171875;
    float _3879 = -_3875;
    float _3881 = fma(_3877, _3879, 1.0);
    float _3883 = -_3839;
    float _3885 = fma(_3873, _3871, _3883);
    float _3887 = fma(_3885, 0.5, 0.5);
    float2 _10394 = float2(_3881, _3887);
    float3 _3891 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_10394, float2(0.0), isnan(_10394)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_10394, float2(0.0), isnan(_10394)), level(0.0)).xyz;
    float _3893 = _3891.x;
    float _3895 = _3891.y;
    float _3897 = _3891.z;
    float _3899 = abs(_2914);
    float _3901 = log2(_3899);
    float _3903 = _3302 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3905 = _3845 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3907 = -_2854;
    float _3909 = _3907 + 1.0;
    float _3911 = fma(_3298, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3903);
    float _3913 = exp2(_3905);
    float _3915 = fma(_3226, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3911);
    float _3917 = _3338 * 0.5;
    bool _3919 = _2914 <= 8000.0;
    bool _3921 = isnan(_2914);
    bool _3923 = _3919 || _3921;
    bool _3925 = isnan(8000.0);
    bool _3927 = _3923 || _3925;
    float _3929 = float(_3927);
    float _3931 = fma(_3322, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3915);
    float _3933 = fma(_3380, -0.5, _3917);
    float _3935 = _3901 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3937 = _3931 + _3338;
    out.gl_Position.x = _3378;
    out.gl_Position.y = _3380;
    out.gl_Position.z = _3931;
    out.gl_Position.w = _3338;
    float _3939 = _3378 + _3338;
    float _3941 = _3937 * 0.5;
    float _3943 = exp2(_3935);
    float _3945 = _3939 * 0.5;
    out.m_84.x = _3945;
    out.m_84.y = _3933;
    out.m_84.z = _3941;
    out.m_84.w = _3338;
    float _3947 = -_3913;
    float _3949 = _3947 + 1.0;
    float _3951 = _3929;
    if (!_3328)
    {
        _3384 = 1.0;
    }
    float _3953 = _3384;
    float _3955 = _3953;
    if (_3328)
    {
        bool _3957 = _3440 >= _3426;
        bool _3959 = isnan(_3440);
        bool _3961 = _3957 || _3959;
        bool _3963 = isnan(_3426);
        bool _3965 = _3961 || _3963;
        float _3967 = float(_3965);
        _3955 = _3967;
    }
    float _3969 = _3955;
    float _3971 = _3949 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _3973 = _3821 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3975 = isnan(_3821);
    bool _3977 = _3973 || _3975;
    bool _3979 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3981 = _3977 || _3979;
    float _3983 = fma(_3943, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3985 = precise::clamp(_3983, 0.0, 1.0);
    float _3987 = _3969 * _3653;
    float _3989 = _3971 * _3442;
    float _3991 = fma(_3985, -2.0, 3.0);
    float _3993 = _3985 * _3985;
    float _3995 = _3453 * _3989;
    float _3997 = _3993 * _3991;
    float _3999 = -_3997;
    float _4001 = _3999 + 1.0;
    float _4003 = fma(_4001, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3997);
    float _4005 = _3929 * _4003;
    float _4007 = _4005;
    float _4009 = _3971;
    float _4011 = _3995;
    if (!_3981)
    {
        _3951 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4013 = _3951;
    float _4015 = _4005 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _4017 = _4013;
    float _4019 = _4013;
    if (!_3981)
    {
        _4007 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4021 = _4007;
    float _4023 = _3909 * _4015;
    float _4025 = precise::clamp(_4023, 0.0, 1.0);
    float _4027 = -_4025;
    float _4029 = fma(_4027, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4031 = -_3971;
    float _4033 = _4031 + 1.0;
    float _4035 = _4033;
    float _4037 = _4021;
    float _4039 = _4021;
    if (!_3981)
    {
        _4009 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4041 = _4009;
    float _4043 = -_3987;
    float _4045 = fma(_4043, _4029, 1.0);
    float _4047 = precise::clamp(_4045, 0.0, 1.0);
    float _4049 = _3453 * _4033;
    float _4051 = _4041;
    float _4053 = _4041;
    if (!_3981)
    {
        _4035 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4055 = _4035;
    float _4057 = _4047 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4059 = _3527 * _3585;
    out.m_86.x = _4057;
    float _4061 = _4059 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4063 = _4059;
    float _4065 = _4055;
    float _4067 = _4055;
    if (!_3981)
    {
        _4063 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4069 = _4063;
    float _4071 = _3897 * _3989;
    float _4073 = fma(_3893, _3995, _3447);
    float _4075 = fma(_3895, _3995, _3449);
    float _4077 = _4069;
    float _4079 = _4069;
    if (!_3981)
    {
        _4011 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4081 = _4011;
    float _4083 = fma(_3453, _4071, _3451);
    out.m_88.x = _4073;
    out.m_88.y = _4075;
    out.m_88.z = _4083;
    out.m_88.w = _4049;
    bool _4085 = !_3981;
    float _4087 = _4081;
    float _4089 = _4081;
    if (!_4085)
    {
        bool _4091 = _3821 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4093 = isnan(_3821);
        bool _4095 = _4091 || _4093;
        bool _4097 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4099 = _4095 || _4097;
        if (!_4099)
        {
            float _4101 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4103 = _3821 + _4101;
            float _4105 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4107 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4105;
            float _4109 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4111 = _4109 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4113 = 1.0 / _4107;
            float _4115 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4117 = _4115 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4119 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4121 = _4119 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4123 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4125 = _4123 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4127 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4129 = _4127 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4131 = _4103 * _4113;
            float _4133 = precise::clamp(_4131, 0.0, 1.0);
            float _4135 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4137 = _4135 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4139 = fma(_4133, _4111, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4141 = fma(_4133, _4137, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4143 = fma(_4133, _4117, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4145 = fma(_4133, _4121, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4147 = fma(_4133, _4125, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4149 = fma(_4133, _4129, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4019 = _4143;
            _4053 = _4147;
            _4039 = _4139;
            _4067 = _4145;
            _4089 = _4141;
            _4079 = _4149;
            _4151 = true;
        }
        else
        {
            bool _4153 = _3821 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4155 = isnan(_3821);
            bool _4157 = _4153 || _4155;
            bool _4159 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4161 = _4157 || _4159;
            if (!_4161)
            {
                _4037 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4163 = _4037;
            _4039 = _4163;
            if (!_4161)
            {
                _4017 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4165 = _4017;
            _4019 = _4165;
            if (!_4161)
            {
                _4087 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4167 = _4087;
            _4089 = _4167;
            if (!_4161)
            {
                _4065 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4169 = _4065;
            _4067 = _4169;
            if (!_4161)
            {
                _4051 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4171 = _4051;
            _4053 = _4171;
            if (!_4161)
            {
                _4077 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4173 = _4077;
            bool _4175 = !_4161;
            _4079 = _4173;
            if (!_4175)
            {
                bool _4177 = _3821 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4179 = isnan(_3821);
                bool _4181 = _4177 || _4179;
                bool _4183 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4185 = _4181 || _4183;
                if (!_4185)
                {
                    float _4187 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4189 = _3821 + _4187;
                    float _4191 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4193 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4191;
                    float _4195 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4197 = _4195 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4199 = 1.0 / _4193;
                    float _4201 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4203 = _4201 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4205 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4207 = _4205 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4209 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4211 = _4209 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4213 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4215 = _4213 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4217 = _4189 * _4199;
                    float _4219 = precise::clamp(_4217, 0.0, 1.0);
                    float _4221 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4223 = _4221 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4225 = fma(_4219, _4197, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4227 = fma(_4219, _4223, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4229 = fma(_4219, _4203, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4231 = fma(_4219, _4207, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4233 = fma(_4219, _4211, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4235 = fma(_4219, _4215, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4019 = _4229;
                    _4053 = _4233;
                    _4039 = _4225;
                    _4067 = _4231;
                    _4089 = _4227;
                    _4079 = _4235;
                    _4151 = true;
                }
                else
                {
                    _4019 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4053 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4039 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4067 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4089 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4079 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4151 = false;
    float _4237 = _4019;
    float _4239 = _4053;
    float _4241 = _4039;
    float _4243 = _4067;
    float _4245 = _4089;
    float _4247 = _4079;
    float _4249 = _4061 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4251 = fma(_2478, -0.5, 0.5);
    float _4253 = precise::clamp(_4251, 0.0, 1.0);
    float _4255 = -_4237;
    float _4257 = _4255 + _4239;
    float _4259 = -_4241;
    float _4261 = _4259 + _4243;
    out.m_61.x = _4249;
    float _4263 = fma(_4253, _4257, _4237);
    float _4265 = -_4245;
    float _4267 = _4265 + _4247;
    float _4269 = fma(_4253, _4261, _4241);
    float _4271 = _4263 * 0.586610972881317138671875;
    bool _4273 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4275 = fma(_4253, _4267, _4245);
    out.m_90.x = 0.0;
    float _4277 = fma(_4269, 0.298911988735198974609375, _4271);
    bool _4279 = _3527 > 0.0;
    bool _4281 = isnan(_3527);
    bool _4283 = _4279 || _4281;
    bool _4285 = isnan(0.0);
    bool _4287 = _4283 || _4285;
    float _4289 = fma(_4275, 0.114477999508380889892578125, _4277);
    bool _4291 = _3585 <= 0.0;
    bool _4293 = !_4287;
    bool _4295 = _4291 || _4293;
    float _4297 = -_4289;
    float _4299 = _4269 + _4297;
    float _4301 = -_4289;
    float _4303 = _4263 + _4301;
    float _4305 = -_4289;
    float _4307 = _4275 + _4305;
    float _4309 = fma(_4299, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4289);
    float _4311 = fma(_4303, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4289);
    float _4313 = fma(_4307, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4289);
    bool _4315 = !_4273;
    if (!_4315)
    {
        float _4317 = -_3154;
        float _4319 = _4317 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4321 = -_3156;
        float _4323 = _4321 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4325 = -_3158;
        float _4327 = _4325 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4329 = _4319 * _4319;
        float _4331 = fma(_4323, _4323, _4329);
        float _4333 = fma(_4327, _4327, _4331);
        float _4335 = sqrt(_4333);
        float _4337 = rsqrt(_4333);
        float _4339 = -_4335;
        float _4341 = _4339 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4343 = _4341 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4345 = precise::clamp(_4343, 0.0, 1.0);
        float _4347 = _4323 * _4337;
        float _4349 = _4319 * _4337;
        float _4351 = abs(_4345);
        float _4353 = log2(_4351);
        float _4355 = _4327 * _4337;
        float _4357 = _4347 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4359 = _2478 * _4349;
        float _4361 = -_4349;
        float _4363 = -_4357;
        float _4365 = fma(_4361, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4363);
        float _4367 = fma(_2476, _4347, _4359);
        float _4369 = -_4355;
        float _4371 = fma(_4369, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4365);
        float _4373 = fma(_2480, _4355, _4367);
        float _4375 = precise::clamp(_4373, 0.0, 1.0);
        float _4377 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4379 = _4371 + _4377;
        float _4381 = _4353 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4383 = _4379 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4385 = precise::clamp(_4383, 0.0, 1.0);
        float _4387 = exp2(_4381);
        float _4389 = _4387 * _4385;
        float _4391 = _4375 * _4389;
        float _4393 = _4391 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4395 = _4391 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4397 = _4391 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_90.x = _4393;
        out.m_90.y = _4395;
        out.m_90.z = _4397;
    }
    out.m_92.x = _4309;
    out.m_92.y = _4311;
    out.m_92.z = _4313;
    if (!_4295)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_61.x = 0.0;
    float _4399 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4399;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

