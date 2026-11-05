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
    float4 m_78 [[user(locn0)]];
    float4 m_74 [[user(locn1)]];
    float4 m_76 [[user(locn2)]];
    float4 m_90 [[user(locn3)]];
    float4 m_98 [[user(locn4)]];
    float4 m_61 [[user(locn5)]];
    float4 m_80 [[user(locn6)]];
    float4 m_82 [[user(locn7)]];
    float4 m_86 [[user(locn8)]];
    float4 m_88 [[user(locn9)]];
    float4 m_84 [[user(locn10)]];
    float4 m_96 [[user(locn11)]];
    float4 m_92 [[user(locn12)]];
    float4 m_94 [[user(locn13)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_72 [[attribute(1)]];
    float4 m_58 [[attribute(2)]];
    float4 m_63 [[attribute(3)]];
    float4 m_68 [[attribute(4)]];
    float4 m_70 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2763 = false;
    bool _1449 = false;
    bool _373 = false;
    bool _215 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _112 = in.m_58.w;
    float _114 = trunc(_112);
    int _117 = int(_114);
    bool _121 = _117 >= 1;
    float _123 = 0.0;
    if (!_121)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _125 = _123;
    float _127 = _125;
    if (!_121)
    {
        out.m_61.x = 0.0;
    }
    int _129 = 0;
    if (!_121)
    {
        float _131 = _125 * 5.0;
        _129 = as_type<int>(_131);
    }
    int _133 = _129;
    int _135 = _133;
    if (!_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3062 = as_type<float>(_133);
        out.gl_Position.z = _3062;
    }
    if (!_121)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _137 = in.m_63.w;
    bool _139 = _137 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _141 = isnan(_137);
    bool _143 = _139 || _141;
    bool _145 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _147 = _143 || _145;
    float _149 = -_137;
    float _151 = _149 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _153 = _151;
    if (_147)
    {
        float _155 = float(_117);
        _127 = _155;
    }
    float _157 = _127;
    bool _159 = _151 >= _157;
    bool _161 = !_147;
    bool _163 = _159 || _161;
    float _165 = _157;
    if (_163)
    {
        _165 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _167 = _165;
    if (_163)
    {
        out.m_61.x = 0.0;
    }
    if (_163)
    {
        float _169 = _167 * 5.0;
        _135 = as_type<int>(_169);
    }
    int _171 = _135;
    if (_163)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3132 = as_type<float>(_171);
        out.gl_Position.z = _3132;
    }
    if (_163)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _173 = as_type<float>(int(gl_VertexIndex));
    bool _175 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _177 = as_type<int>(_173) & 1;
    bool _179 = _177 != 0;
    int _181 = as_type<int>(_173) & 2;
    bool _183 = _181 != 0;
    bool _185 = !_179;
    float _187 = _185 ? (-0.5) : 0.5;
    bool _189 = !_183;
    float _191 = _189 ? (-0.5) : 0.5;
    bool _193 = !_175;
    float _195 = _191;
    float _213;
    if (!_193)
    {
        float _197 = in.m_68.x;
        float _199 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _201 = _197 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _203 = fma(_201, (*spvDescriptorSet0.vp_c9)._m0[12].x, _151);
        float _205 = _203 * _199;
        float _207 = floor(_205);
        float _209 = -_207;
        float _211 = _205 + _209;
        _213 = _211;
        _215 = true;
    }
    else
    {
        float _217 = float(_117);
        float _219 = 1.0 / _217;
        float _221 = _151 * _219;
        _213 = _221;
    }
    _215 = false;
    float _223 = _213;
    float _225 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _227 = _223 + _225;
    bool _229 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _231 = isnan(_223);
    bool _233 = _229 || _231;
    bool _235 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _237 = _233 || _235;
    float _239 = float(_237);
    float _241 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _243 = _223 + _241;
    float _245 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _247 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _245;
    float _249 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _251 = _249 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _253 = -_239;
    float _255 = _253 + 1.0;
    float _257 = 1.0 / _247;
    bool _259 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _261 = isnan(_223);
    bool _263 = _259 || _261;
    bool _265 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _267 = _263 || _265;
    float _269 = float(_267);
    bool _271 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _273 = 1.0 / _251;
    float _275 = _227 * _257;
    bool _277 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _279 = isnan(_223);
    bool _281 = _277 || _279;
    bool _283 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _285 = _281 || _283;
    float _287 = float(_285);
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _291 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _289;
    float _293 = in.m_70.x;
    float _295 = in.m_70.y;
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _299 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _297;
    float _301 = _287 * _255;
    float _303 = -_287;
    float _305 = _303 + 1.0;
    float _307 = fma(_291, _275, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _309 = fma(_299, _275, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _311 = _243 * _273;
    float _313 = _269 * _305;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _317 = _315 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _321 = _319 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _323 = -_269;
    float _325 = _323 + 1.0;
    float _327 = _307 * _313;
    float _329 = _309 * _313;
    float _331 = fma(_317, _311, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _333 = fma(_321, _311, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _335 = fma(_325, (*spvDescriptorSet0.vp_c9)._m0[143].y, _327);
    float _337 = fma(_325, (*spvDescriptorSet0.vp_c9)._m0[143].x, _329);
    float _339 = fma(_333, _301, _335);
    float _341 = fma(_331, _301, _337);
    float _343 = fma(_239, (*spvDescriptorSet0.vp_c9)._m0[145].y, _339);
    float _345 = fma(_239, (*spvDescriptorSet0.vp_c9)._m0[145].x, _341);
    float _347 = _343 * _295;
    float _349 = _345 * _293;
    bool _351 = !_271;
    float _353 = _333;
    float _371;
    if (!_351)
    {
        float _355 = in.m_68.x;
        float _357 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _359 = _355 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _361 = fma(_359, (*spvDescriptorSet0.vp_c9)._m0[11].y, _151);
        float _363 = _361 * _357;
        float _365 = floor(_363);
        float _367 = -_365;
        float _369 = _363 + _367;
        _371 = _369;
        _373 = true;
    }
    else
    {
        float _375 = float(_117);
        float _377 = 1.0 / _375;
        float _379 = _151 * _377;
        _371 = _379;
    }
    _373 = false;
    float _381 = _371;
    float _383 = in.m_68.z;
    float _385 = in.m_68.w;
    float _387 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _191);
    float _389 = in.m_68.x;
    int _391 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _393 = _391 != 0;
    float _395 = _349 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _397 = in.m_68.y;
    float _399 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _187);
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _403 = _401 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _405 = _395 * _399;
    float _407 = 1.0 / _403;
    float _409 = _339;
    if (!_393)
    {
        float _411 = in.m_68.z;
        _409 = _411;
    }
    float _413 = _409;
    float _415 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _417 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _419 = _383 * 2.0;
    bool _421 = _383 > 0.5;
    float _423 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _425 = _385 > 0.5;
    float _427 = _389 * 2.0;
    float _429 = -_191;
    int _431 = _421 ? as_type<int>(_429) : as_type<int>(_191);
    float _433 = floor(_419);
    float _435 = -_191;
    int _437 = _425 ? as_type<int>(_435) : as_type<int>(_191);
    float _439 = _397 * 2.0;
    float _441 = _397;
    if (!_393)
    {
        _353 = _397;
    }
    float _443 = _353;
    float _445 = _389 + _383;
    float _447 = _443;
    if (_393)
    {
        _447 = _389;
    }
    float _449 = _447;
    float _451 = floor(_427);
    float _453 = _445 + (-1.0);
    float _455 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[83].z, _415);
    float _457 = _383 + _397;
    float _459 = _383 + (-0.5);
    float _461 = fma(_453, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _463 = _449 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _465 = floor(_439);
    bool _467 = _433 > 0.0;
    float _469 = -_423;
    float _471 = fma(_463, 2.0, _469);
    bool _473 = _433 >= 0.0;
    bool _475 = isnan(_433);
    bool _477 = _473 || _475;
    bool _479 = isnan(0.0);
    bool _481 = _477 || _479;
    float _483 = _389 + _397;
    float _485 = _457 + (-1.0);
    int _487 = _481 ? 0 : 1;
    float _489 = _483 + (-1.0);
    bool _491 = _451 > 0.0;
    int _493 = ~_487;
    int _495 = _493 + 1;
    int _497 = _495 + 1;
    float _499 = fma(_489, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _501 = _451 >= 0.0;
    bool _503 = isnan(_451);
    bool _505 = _501 || _503;
    bool _507 = isnan(0.0);
    bool _509 = _505 || _507;
    int _511 = _497;
    float _513 = _451;
    if (!_467)
    {
        int _515 = ~_487;
        int _517 = _515 + 1;
        _511 = _517;
    }
    int _519 = _511;
    int _521 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _523 = _521 != 0;
    float _525 = -_187;
    int _527 = _421 ? as_type<int>(_525) : as_type<int>(_187);
    int _529 = _509 ? 0 : 1;
    int _531 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _533 = _531 != 0;
    int _535 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _537 = _535 != 0;
    int _539 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _541 = _539 != 0;
    int _543 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _545 = _543 != 0;
    bool _547 = !_523;
    float _549 = _547 ? _187 : as_type<float>(_527);
    bool _551 = _397 > 0.5;
    int _553 = ~_529;
    int _555 = _553 + 1;
    int _557 = _555 + 1;
    int _559 = _557;
    if (!_491)
    {
        int _561 = ~_529;
        int _563 = _561 + 1;
        _559 = _563;
    }
    int _565 = _559;
    bool _567 = !_545;
    float _569 = _567 ? _191 : as_type<float>(_431);
    bool _571 = _465 > 0.0;
    bool _573 = _465 >= 0.0;
    bool _575 = isnan(_465);
    bool _577 = _573 || _575;
    bool _579 = isnan(0.0);
    bool _581 = _577 || _579;
    float _583 = -_187;
    int _585 = _551 ? as_type<int>(_583) : as_type<int>(_187);
    float _587 = _413;
    if (!_393)
    {
        _513 = _413;
    }
    float _589 = _513;
    int _591 = _581 ? 0 : 1;
    float _593 = _589;
    if (_393)
    {
        _593 = _397;
    }
    float _595 = _593;
    if (_393)
    {
        _587 = _397;
    }
    float _597 = _587;
    bool _599 = !_541;
    float _601 = _599 ? _187 : as_type<float>(_585);
    int _603 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _605 = _603 != 0;
    int _607 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _609 = _607 != 0;
    int _611 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _613 = _611 != 0;
    float _615 = _347 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _617 = ~_591;
    int _619 = _617 + 1;
    int _621 = _619 + 1;
    float _623 = fma(_597, (*spvDescriptorSet0.vp_c9)._m0[83].w, _417);
    int _625 = _621;
    bool _627 = _537;
    bool _629 = _533;
    if (!_571)
    {
        int _631 = ~_591;
        int _633 = _631 + 1;
        _625 = _633;
    }
    int _635 = _625;
    float _637 = _615 * _387;
    bool _639 = !_605;
    int _641 = _639 ? 0 : 1;
    float _643 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _645 = log2(_643);
    bool _647 = !_609;
    int _649 = _647 ? 0 : 1;
    float _651 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _653 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _655 = _653 != 0;
    float _657 = _595 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _659 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _661 = _659 != 0;
    int _663 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _665 = _663 != 0;
    float _667 = fma(_657, -2.0, _651);
    int _669 = abs(_641);
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _673 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _671;
    float _675 = in.m_72.x;
    float _677 = in.m_72.y;
    float _679 = in.m_72.z;
    float _681 = _645 * _151;
    int _683 = abs(_649);
    float _685 = _673 * _407;
    float _687 = fma(_485, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _689 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _691 = 1.0 + _689;
    float _693 = exp2(_681);
    bool _695 = !_613;
    int _697 = _695 ? 0 : 1;
    bool _699 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _701 = isnan(0.0);
    bool _703 = _699 || _701;
    bool _705 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _707 = _703 || _705;
    float _709 = float(_519);
    float _711 = float(_669);
    float _713 = 1.0 / _691;
    float _715 = float(_565);
    float _717 = float(_683);
    float _719 = _711 * _709;
    int _721 = abs(_697);
    float _723 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[82].z, _455);
    float _725 = float(_635);
    float _727 = -_693;
    float _729 = _727 + 1.0;
    float _731 = float(_721);
    float _733 = _717 * _715;
    float _735 = _719 * (-2.0);
    float _737 = -_151;
    float _739 = fma(_737, (*spvDescriptorSet0.vp_c9)._m0[81].x, _471);
    float _741 = _707 ? _729 : 0.0;
    float _743 = _733 * (-2.0);
    bool _745 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _747 = isnan(1.0);
    bool _749 = _745 || _747;
    bool _751 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _753 = _749 || _751;
    float _755 = _731 * _725;
    float _757 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[82].w, _623);
    float _759 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[81].y, _667);
    float _761 = fma(_499, _735, _499);
    float _763 = fma(_735, _675, _675);
    float _765 = fma(_743, _677, _677);
    float _767 = _389 + (-0.5);
    float _769 = _675;
    float _771 = _763;
    float _773 = 1.0;
    if (_661)
    {
        float _775 = _389 * 3.1415927410125732421875;
        _769 = _775;
    }
    float _777 = _769;
    float _779 = _755 * (-2.0);
    float _781 = fma(_687, _743, _687);
    float _783 = fma(_767, (*spvDescriptorSet0.vp_c9)._m0[196].x, _763);
    if (_661)
    {
        float _785 = _777 * 0.15915493667125701904296875;
        _771 = _785;
    }
    float _787 = _771;
    if (_753)
    {
        float _789 = _741 * _713;
        _153 = _789;
    }
    float _791 = _153;
    bool _793 = _389 > 0.5;
    float _795 = _397 + (-0.5);
    float _797 = in.m_58.x;
    float _799 = in.m_58.y;
    float _801 = in.m_58.z;
    float _803 = fma(_461, _779, _461);
    float _805 = fma(_779, _679, _679);
    float _807 = fma(_795, (*spvDescriptorSet0.vp_c9)._m0[196].y, _765);
    float _809 = fma(_761, _791, _783);
    float _811 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _813 = _381 + _811;
    float _815 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _817 = fma(_781, _791, _807);
    bool _819 = _381 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _821 = isnan(_381);
    bool _823 = _819 || _821;
    bool _825 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _827 = _823 || _825;
    float _829 = float(_827);
    float _831 = fma(_459, (*spvDescriptorSet0.vp_c9)._m0[196].z, _805);
    float _833 = _809 * 0.15915493667125701904296875;
    float _835 = fma(_685, _813, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    if (_661)
    {
        float _837 = _787 * 6.283185482025146484375;
        float _839 = sin(_837);
        _441 = _839;
    }
    float _841 = _441;
    bool _843 = _381 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _845 = isnan(_381);
    bool _847 = _843 || _845;
    bool _849 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _851 = _847 || _849;
    float _853 = float(_851);
    float _855 = fma(_803, _791, _831);
    float _857 = -_829;
    float _859 = _857 + 1.0;
    float _861 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _863 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _865 = _817 * 0.15915493667125701904296875;
    float _867 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _869 = _853 * _859;
    float _871 = _855 * 0.15915493667125701904296875;
    float _873 = _799 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _875 = _799 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _877 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _879 = _799 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _881 = _861 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _883 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _885 = _863 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _887 = _877 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _889 = _833 * 6.283185482025146484375;
    float _891 = sin(_889);
    float _893 = fma(_797, (*spvDescriptorSet0.vp_c10)._m0[5].x, _875);
    float _895 = fma(_797, (*spvDescriptorSet0.vp_c10)._m0[6].x, _879);
    float _897 = -_853;
    float _899 = _897 + 1.0;
    out.m_74.x = _885;
    out.m_74.y = _881;
    out.m_74.z = _887;
    out.m_74.w = _883;
    float _901 = _867 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _903 = -_757;
    float _905 = _903 + 1.0;
    float _907 = -_723;
    float _909 = _907 + 1.0;
    float _911 = _833 * 6.283185482025146484375;
    float _913 = cos(_911);
    float _915 = _865 * 6.283185482025146484375;
    float _917 = sin(_915);
    float _919 = fma(_797, (*spvDescriptorSet0.vp_c10)._m0[4].x, _873);
    float _921 = _835 * _869;
    float _923 = _815 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _925 = fma(_801, (*spvDescriptorSet0.vp_c10)._m0[5].z, _893);
    float _927 = fma(_801, (*spvDescriptorSet0.vp_c10)._m0[4].z, _919);
    float _929 = fma(_801, (*spvDescriptorSet0.vp_c10)._m0[6].z, _895);
    float _931 = _815;
    if (_655)
    {
        float _933 = in.m_68.w;
        _931 = _933;
    }
    float _935 = _931;
    float _937 = _865 * 6.283185482025146484375;
    float _939 = cos(_937);
    float _941 = fma(_899, (*spvDescriptorSet0.vp_c9)._m0[115].x, _921);
    bool _943 = !_537;
    float _945 = _943 ? _191 : as_type<float>(_437);
    float _947 = _549 + 0.5;
    if (_661)
    {
        bool _949 = _841 > 0.5;
        _627 = _949;
    }
    bool _951 = _627;
    float _953 = fma(_829, (*spvDescriptorSet0.vp_c9)._m0[116].x, _941);
    float _955 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _957 = _945 + (-0.5);
    float _959 = _871 * 6.283185482025146484375;
    float _961 = cos(_959);
    float _963 = fma(_901, _947, _739);
    float _965 = _891 * _917;
    float _967 = _913 * _917;
    float _969 = -_923;
    float _971 = -_759;
    float _973 = fma(_969, _957, _971);
    float _975 = -_187;
    int _977 = _793 ? as_type<int>(_975) : as_type<int>(_187);
    float _979 = -_909;
    float _981 = fma(_549, _979, _963);
    float _983 = _927 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _985 = _871 * 6.283185482025146484375;
    float _987 = sin(_985);
    float _989 = _891 * _939;
    bool _991 = !_665;
    float _993 = _991 ? _187 : as_type<float>(_977);
    float _995 = fma(_945, _905, _973);
    float _997 = _891 * _961;
    float _999 = _913 * _939;
    float _1001 = _913 * _961;
    float _1003 = _939 * _961;
    float _1005 = _917 * _961;
    float _1007 = _997 * _637;
    float _1009 = _1001 * _637;
    float _1011 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1013 = fma(_987, _999, _965);
    float _1015 = -_967;
    float _1017 = fma(_987, _989, _1015);
    float _1019 = -_989;
    float _1021 = fma(_987, _967, _1019);
    float _1023 = -_637;
    float _1025 = _987 * _1023;
    float _1027 = fma(_1013, _405, _1009);
    float _1029 = _993 + 0.5;
    float _1031 = fma(_987, _965, _999);
    float _1033 = _993;
    float _1035 = _1005;
    float _1037 = _1031;
    if (_655)
    {
        float _1039 = _935 * 3.1415927410125732421875;
        _1033 = _1039;
    }
    float _1041 = _1033;
    float _1043 = fma(_1003, _405, _1025);
    float _1045 = fma(_1021, _955, _1027);
    float _1047 = fma(_1017, _405, _1007);
    float _1049 = -_191;
    int _1051 = _551 ? as_type<int>(_1049) : as_type<int>(_191);
    float _1053 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1055 = fma(_1005, _955, _1043);
    float _1057 = _1045 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1059 = _1045 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _1061 = !_533;
    float _1063 = _1061 ? _191 : as_type<float>(_1051);
    float _1065 = fma(_1031, _955, _1047);
    float _1067 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1057);
    float _1069 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1059);
    float _1071 = _1029 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1073 = -_1063;
    float _1075 = _1073 + 0.5;
    float _1077 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1067);
    float _1079 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1069);
    float _1081 = _1047;
    if (_655)
    {
        float _1083 = _1041 * 0.15915493667125701904296875;
        _1081 = _1083;
    }
    float _1085 = _1081;
    float _1087 = _1071 * _1011;
    float _1089 = _1075 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1091 = _929 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1093 = _1077 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1095 = _1079 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1097 = _953 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1099 = _1089 * _1053;
    float _1101 = _983 + _1093;
    float _1103 = _1091 + _1095;
    float _1105 = _909;
    float _1107 = _1103;
    float _1109 = _1101;
    if (_655)
    {
        float _1111 = _1085 * 6.283185482025146484375;
        float _1113 = sin(_1111);
        _1105 = _1113;
    }
    float _1115 = _1105;
    float _1117 = _1001 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1119 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1121 = _1101 + _1119;
    float _1123 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1125 = _1103 + _1123;
    float _1127 = _1001 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1129 = _1001 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1131 = _1121 * _1121;
    out.m_76.x = _1087;
    out.m_76.y = _1099;
    out.m_76.z = _981;
    out.m_76.w = _995;
    float _1133 = _1013 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1135 = _1125 * _1125;
    float _1137 = _1045 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1139 = -_987;
    float _1141 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1117);
    float _1143 = fma(_1003, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1133);
    float _1145 = _1131 + _1135;
    float _1147 = -_987;
    float _1149 = fma(_1147, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1127);
    float _1151 = -_987;
    float _1153 = fma(_1151, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1129);
    float _1155 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1137);
    float _1157 = _1131;
    float _1159 = _1135;
    if (_655)
    {
        bool _1161 = _1115 > 0.5;
        _629 = _1161;
    }
    bool _1163 = _629;
    out.m_78.w = _1097;
    float _1165 = fma(_997, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1141);
    float _1167 = fma(_997, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1149);
    float _1169 = sqrt(_1145);
    float _1171 = _1013 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1173 = _1013 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1175 = _1021 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1177 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1155);
    float _1179 = fma(_1003, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1171);
    float _1181 = fma(_1003, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1173);
    float _1183 = _1021 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1185 = fma(_997, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1153);
    float _1187 = _1021 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1189 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1191 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1183);
    float _1193 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1175);
    float _1195 = _925 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1197 = _1177 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1199 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1187);
    bool _1201 = _1169 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1203 = fma(_1031, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1193);
    float _1205 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1207 = _1195 + _1197;
    float _1209 = fma(_1031, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1191);
    if (!_661)
    {
        _1035 = _191;
    }
    float _1211 = _1035;
    float _1213 = fma(_1031, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1199);
    float _1215 = _1211;
    if (_661)
    {
        float _1217 = -_191;
        float _1219 = _951 ? _1217 : _191;
        _1215 = _1219;
    }
    float _1221 = _1215;
    float _1223 = _191 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    if (!_1201)
    {
        _1037 = _1103;
    }
    float _1225 = _1037;
    float _1227 = _1225;
    if (!_1201)
    {
        _195 = _1101;
    }
    float _1229 = _195;
    float _1231 = _1229;
    if (!_1201)
    {
        _1107 = _1207;
    }
    float _1233 = _1107;
    bool _1235 = !_1201;
    float _1237 = _1233;
    if (!_1235)
    {
        float _1239 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1241 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1243 = _1169 + _1241;
        float _1245 = rsqrt(_1145);
        float _1247 = _1243 * _1239;
        float _1249 = _1207 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1251 = _1247 * 0.15915493667125701904296875;
        float _1253 = _1251 * 6.283185482025146484375;
        float _1255 = sin(_1253);
        float _1257 = _1251 * 6.283185482025146484375;
        float _1259 = cos(_1257);
        float _1261 = fma(_1255, _1249, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1263 = _1245 * _1261;
        float _1265 = _1259 + (-1.0);
        float _1267 = fma(_1121, _1263, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1269 = fma(_1125, _1263, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1271 = _1265 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1273 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1275 = _1267 + _1273;
        float _1277 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1279 = _1269 + _1277;
        float _1281 = fma(_1207, _1259, _1271);
        float _1283 = _1275 * _1275;
        float _1285 = _1279 * _1279;
        _1237 = _1281;
        _1157 = _1283;
        _1159 = _1285;
        _1109 = _1251;
        _1231 = _1267;
        _1227 = _1269;
    }
    float _1287 = _1237;
    float _1289 = _1157;
    float _1291 = _1159;
    float _1293 = _1109;
    float _1295 = _1231;
    float _1297 = _1227;
    float _1299 = fma(_1223, _1223, 1.0);
    float _1301 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _1303 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1305 = _1287 + _1303;
    float _1307 = fma(_1017, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1181);
    float _1309 = _1293;
    if (!_655)
    {
        _1309 = _187;
    }
    float _1311 = _1309;
    float _1313 = fma(_1017, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1179);
    float _1315 = fma(_1017, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1143);
    float _1317 = -_569;
    float _1319 = _1317 + 0.5;
    float _1321 = fma(_1305, _1305, _1289);
    float _1323 = rsqrt(_1299);
    float _1325 = _1311;
    if (_655)
    {
        float _1327 = -_187;
        float _1329 = _1163 ? _1327 : _187;
        _1325 = _1329;
    }
    float _1331 = _1325;
    float _1333 = _187 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1335 = _1223 * _1165;
    float _1337 = _1223 * _1167;
    float _1339 = _1223 * _1185;
    float _1341 = -_1221;
    float _1343 = _1341 + 0.5;
    float _1345 = _601 + 0.5;
    float _1347 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _1349 = _1319 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1351 = fma(_1333, _1313, _1335);
    float _1353 = _1321 + _1291;
    float _1355 = fma(_1333, _1307, _1337);
    float _1357 = fma(_1333, _1315, _1339);
    float _1359 = _1343 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _1361 = _1345 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1363 = _1349 * _1205;
    float _1365 = _1223 * _1323;
    float _1367 = _1331 + 0.5;
    float _1369 = _1359 * _1301;
    float _1371 = _1361 * _1189;
    float _1373 = sqrt(_1353);
    float _1375 = -_1209;
    float _1377 = _1365 * _1375;
    float _1379 = -_1213;
    float _1381 = _1365 * _1379;
    float _1383 = _1367 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _1385 = -_1203;
    float _1387 = _1365 * _1385;
    float _1389 = fma(_1323, _1167, _1377);
    float _1391 = fma(_1323, _1185, _1381);
    float _1393 = _1383 * _1347;
    float _1395 = fma(_1323, _1165, _1387);
    float _1397 = _1203 + _1351;
    float _1399 = _1209 + _1355;
    float _1401 = _1213 + _1357;
    out.m_80.x = _1371;
    out.m_80.y = _1363;
    out.m_82.x = _1393;
    out.m_82.y = _1369;
    bool _1403 = _1373 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1405 = isnan(_1373);
    bool _1407 = _1403 || _1405;
    bool _1409 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1411 = _1407 || _1409;
    out.m_84.x = _1313;
    out.m_84.y = _1307;
    out.m_84.z = _1315;
    out.m_86.x = _1395;
    out.m_86.y = _1389;
    out.m_86.z = _1391;
    out.m_88.x = _1397;
    out.m_88.y = _1399;
    out.m_88.z = _1401;
    float _1413 = _1387;
    if (!_1411)
    {
        _1413 = 1.0;
    }
    float _1415 = _1413;
    bool _1417 = !_1411;
    float _1419 = _1415;
    if (!_1417)
    {
        bool _1421 = _1373 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1423 = isnan(_1373);
        bool _1425 = _1421 || _1423;
        bool _1427 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1429 = _1425 || _1427;
        if (!_1429)
        {
            float _1431 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1433 = _1373 + _1431;
            float _1435 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1437 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1435;
            float _1439 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1441 = _1439 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1443 = 1.0 / _1437;
            float _1445 = _1433 * _1443;
            float _1447 = fma(_1445, _1441, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1419 = _1447;
            _1449 = true;
        }
        else
        {
            bool _1451 = _1373 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1453 = isnan(_1373);
            bool _1455 = _1451 || _1453;
            bool _1457 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1459 = _1455 || _1457;
            if (!_1459)
            {
                float _1461 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1463 = _1373 + _1461;
                float _1465 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1467 = _1465 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1469 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1471 = _1469 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1473 = 1.0 / _1467;
                float _1475 = _1463 * _1473;
                float _1477 = fma(_1475, _1471, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1419 = _1477;
                _1449 = true;
            }
            else
            {
                _1419 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1449 = false;
    float _1479 = _1419;
    float _1481 = fma(_983, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1483 = fma(_1091, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1485 = floor(_1481);
    float _1487 = floor(_1483);
    float _1489 = -_1485;
    float _1491 = _1481 + _1489;
    float _1493 = -_1487;
    float _1495 = _1483 + _1493;
    float2 _5278 = float2(_1491, _1495);
    float _1497 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5278, float2(0.0), isnan(_5278)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5278, float2(0.0), isnan(_5278)), level(0.0)).x;
    float _1499 = _1195 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1501 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1503 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1505 = _1295 + _1503;
    float _1507 = fma(_983, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1499);
    float _1509 = _1195 + _1501;
    float _1511 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1513 = _1287 + _1511;
    float _1515 = fma(_1505, _1479, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1517 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1507);
    float _1519 = _1195 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1521 = _1509 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1523 = _1517 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1525 = fma(_983, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1519);
    float _1527 = _1509 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1529 = fma(_983, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1521);
    float _1531 = 1.0 / _1523;
    float _1533 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1525);
    float _1535 = fma(_983, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1527);
    float _1537 = fma(_1091, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1529);
    float _1539 = fma(_1513, _1479, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1541 = _1533 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1543 = fma(_1091, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1535);
    float _1545 = _1537 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1547 = _1541 + _1523;
    float _1549 = _1543 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1551 = trunc(_1545);
    int _1553 = int(_1551);
    float _1555 = _1547 * _1531;
    float _1557 = _1555 * 0.5;
    float _1559 = trunc(_1549);
    int _1561 = int(_1559);
    float _1563 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1565 = fma(_1557, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1563);
    float _1567 = 1.0 / _1565;
    int _1569 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1571 = _1553 + _1569;
    int _1573 = _1571 + 1;
    int _1575 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1577 = _1561 + _1575;
    int _1579 = _1577 + 1;
    int _1581 = _1573 | _1579;
    float _1583 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1585 = _1567 * _1583;
    bool _1587 = _1585 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1589 = _1585 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1591 = !_1587;
    int _1593 = _1591 ? 0 : 1;
    int _1595 = 2;
    int _1597 = _1573;
    float _1599 = _1505;
    float _1601 = _1479;
    int _1603 = as_type<int>(_1515);
    int _1605 = _1579;
    if (!_1587)
    {
        _1595 = 1;
    }
    int _1607 = _1595;
    int _1609 = _1607;
    if (!_1589)
    {
        _1609 = _1593;
    }
    int _1611 = _1609;
    bool _1613 = _1573 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1615 = _1611 << 6;
    bool _1617 = _1581 < 0;
    bool _1619 = _1617 || _1613;
    int _1621 = _1615 + 48;
    uint _1624 = uint(int(uint(_1621) >> uint(2)));
    uint _1626 = uint(int(uint(int(_1624)) >> uint(2)));
    int _1628 = int(_1624) & 3;
    float _1630 = (*spvDescriptorSet0.vp_c15)._m0[int(_1626)][_1628];
    int _1632 = int(_1624) + 1;
    uint _1634 = uint(int(uint(_1632) >> uint(2)));
    int _1636 = _1632 & 3;
    float _1638 = (*spvDescriptorSet0.vp_c15)._m0[int(_1634)][_1636];
    bool _1640 = _1579 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1642 = _1640 || _1619;
    bool _1644 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1646 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1648 = _1644 || _1646;
    bool _1650 = isnan(0.5);
    bool _1652 = _1648 || _1650;
    float _1654 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1656 = _1297 + _1654;
    int _1658 = _1615 + 56;
    uint _1660 = uint(int(uint(_1658) >> uint(2)));
    uint _1662 = uint(int(uint(int(_1660)) >> uint(2)));
    int _1664 = int(_1660) & 3;
    float _1666 = (*spvDescriptorSet0.vp_c15)._m0[int(_1662)][_1664];
    int _1668 = int(_1660) + 1;
    uint _1670 = uint(int(uint(_1668) >> uint(2)));
    int _1672 = _1668 & 3;
    float _1674 = (*spvDescriptorSet0.vp_c15)._m0[int(_1670)][_1672];
    float _1676 = fma(_1656, _1479, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    int _1678 = _1615 + 64;
    uint _1680 = uint(int(uint(_1678) >> uint(2)));
    uint _1682 = uint(int(uint(int(_1680)) >> uint(2)));
    int _1684 = int(_1680) & 3;
    float _1686 = (*spvDescriptorSet0.vp_c15)._m0[int(_1682)][_1684];
    int _1688 = int(_1680) + 1;
    uint _1690 = uint(int(uint(_1688) >> uint(2)));
    int _1692 = _1688 & 3;
    float _1694 = (*spvDescriptorSet0.vp_c15)._m0[int(_1690)][_1692];
    float _1696 = _1656;
    float _1698 = as_type<float>(_1615);
    float _1700 = as_type<float>(_1611);
    if (!_1642)
    {
        int _1702 = _1579 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1704 = _1702 + _1573;
        _1597 = _1704;
    }
    int _1706 = _1597;
    if (_1652)
    {
        _1599 = _1515;
    }
    float _1708 = _1599;
    float _1710 = _1708;
    if (_1652)
    {
        _1601 = _1539;
    }
    float _1712 = _1601;
    float _1714 = _1712;
    if (_1652)
    {
        _1696 = _1676;
    }
    float _1716 = _1696;
    int _1718 = _1615 + 72;
    uint _1720 = uint(int(uint(_1718) >> uint(2)));
    uint _1722 = uint(int(uint(int(_1720)) >> uint(2)));
    int _1724 = int(_1720) & 3;
    float _1726 = (*spvDescriptorSet0.vp_c15)._m0[int(_1722)][_1724];
    int _1728 = int(_1720) + 1;
    uint _1730 = uint(int(uint(_1728) >> uint(2)));
    int _1732 = _1728 & 3;
    float _1734 = (*spvDescriptorSet0.vp_c15)._m0[int(_1730)][_1732];
    int _1736 = _1615 + 96;
    uint _1738 = uint(int(uint(_1736) >> uint(2)));
    uint _1740 = uint(int(uint(int(_1738)) >> uint(2)));
    int _1742 = int(_1738) & 3;
    float _1744 = (*spvDescriptorSet0.vp_c15)._m0[int(_1740)][_1742];
    int _1746 = int(_1738) + 1;
    uint _1748 = uint(int(uint(_1746) >> uint(2)));
    int _1750 = _1746 & 3;
    float _1752 = (*spvDescriptorSet0.vp_c15)._m0[int(_1748)][_1750];
    int _1754 = _1615 + 104;
    uint _1756 = uint(int(uint(_1754) >> uint(2)));
    uint _1758 = uint(int(uint(int(_1756)) >> uint(2)));
    int _1760 = int(_1756) & 3;
    float _1762 = (*spvDescriptorSet0.vp_c15)._m0[int(_1758)][_1760];
    int _1764 = int(_1756) + 1;
    uint _1766 = uint(int(uint(_1764) >> uint(2)));
    int _1768 = _1764 & 3;
    float _1770 = (*spvDescriptorSet0.vp_c15)._m0[int(_1766)][_1768];
    float _1772 = _1716;
    int _1774 = as_type<int>(_1752);
    if (!_1652)
    {
        float _1776 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1778 = _1195 + _1776;
        float _1780 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1782 = _983 + _1780;
        float _1784 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1786 = _1778 * _1778;
        float _1788 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1790 = _1091 + _1788;
        float _1792 = fma(_1782, _1782, _1786);
        float _1794 = -_1195;
        float _1796 = _1794 + _1539;
        float _1798 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1800 = fma(_1790, _1790, _1792);
        float _1802 = sqrt(_1800);
        float _1804 = _1784 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1806 = precise::min(_1802, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1808 = _1806 * _1798;
        float _1810 = _1804 * _1808;
        float _1812 = -_983;
        float _1814 = _1812 + _1515;
        float _1816 = -_1091;
        float _1818 = _1816 + _1676;
        float _1820 = fma(_1796, _1810, _1195);
        float _1822 = fma(_1814, _1810, _983);
        float _1824 = fma(_1818, _1810, _1091);
        _1714 = _1820;
        _1603 = as_type<int>(_1818);
        _1710 = _1822;
        _1772 = _1824;
    }
    float _1826 = _1714;
    int _1828 = _1603;
    float _1830 = _1710;
    float _1832 = _1772;
    float _1834 = _1509 * _1752;
    int _1836 = _1828;
    if (!_1642)
    {
        int _1838 = _1706 << 2;
        _1836 = _1838;
    }
    int _1840 = _1836;
    float _1842 = _1826 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    int _1844 = _1840;
    if (!_1642)
    {
        uint _1846 = uint(int(uint(_1706) >> uint(2)));
        _1774 = int(_1846);
    }
    int _1848 = _1774;
    float _1850 = fma(_983, _1744, _1834);
    if (!_1642)
    {
        int _1852 = 12 & _1840;
        _1844 = _1852;
    }
    int _1854 = _1844;
    float _1856 = fma(_1830, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1842);
    float _1858 = _1509 * _1694;
    float _1860 = fma(_1091, _1762, _1850);
    if (!_1642)
    {
        int _1862 = _1848 << 4;
        int _1864 = _1862 + _1854;
        _1605 = _1864;
    }
    int _1866 = _1605;
    float _1868 = fma(_1832, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1856);
    int _1870 = _1615 + 80;
    uint _1872 = uint(int(uint(_1870) >> uint(2)));
    uint _1874 = uint(int(uint(int(_1872)) >> uint(2)));
    int _1876 = int(_1872) & 3;
    float _1878 = (*spvDescriptorSet0.vp_c15)._m0[int(_1874)][_1876];
    int _1880 = int(_1872) + 1;
    uint _1882 = uint(int(uint(_1880) >> uint(2)));
    int _1884 = _1880 & 3;
    float _1886 = (*spvDescriptorSet0.vp_c15)._m0[int(_1882)][_1884];
    float _1888 = _1860 + _1770;
    float _1890 = _1509 * _1638;
    float _1892 = _1868 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1894 = fma(_983, _1686, _1858);
    float _1896 = 1.0 / _1888;
    float _1898 = fma(_983, _1630, _1890);
    float _1900 = _1826 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1902 = _1860;
    if (!_1642)
    {
        int _1904 = _1866 + 400;
        uint _1906 = uint(int(uint(_1904) >> uint(2)));
        uint _1908 = uint(int(uint(int(_1906)) >> uint(2)));
        int _1910 = int(_1906) & 3;
        float _1912 = (*spvDescriptorSet0.vp_c15)._m0[int(_1908)][_1910];
        _1902 = _1912;
    }
    float _1914 = _1902;
    float _1916 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1918 = fma(_1091, _1666, _1898);
    float _1920 = _1892 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1922 = fma(_1830, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1900);
    float _1924 = _1826 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1926 = _1918 + _1674;
    float _1928 = -_1920;
    float _1930 = fma(_1928, _1916, 1.0);
    int _1932 = _1615 + 88;
    uint _1934 = uint(int(uint(_1932) >> uint(2)));
    uint _1936 = uint(int(uint(int(_1934)) >> uint(2)));
    int _1938 = int(_1934) & 3;
    float _1940 = (*spvDescriptorSet0.vp_c15)._m0[int(_1936)][_1938];
    int _1942 = int(_1934) + 1;
    uint _1944 = uint(int(uint(_1942) >> uint(2)));
    int _1946 = _1942 & 3;
    float _1948 = (*spvDescriptorSet0.vp_c15)._m0[int(_1944)][_1946];
    float _1950 = fma(_1091, _1726, _1894);
    float _1952 = fma(_1832, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1922);
    float _1954 = _1826 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1956 = fma(_1830, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1924);
    float _1958 = _1926 * _1896;
    float _1960 = _1950 + _1734;
    float _1962 = _1952 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1964 = fma(_1830, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1954);
    float _1966 = fma(_1832, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1956);
    bool _1968 = _1958 >= 0.0;
    float _1970 = _1960 * _1896;
    float _1972 = _1962 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1974 = _1966 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    bool _1976 = _1958 <= 1.0;
    bool _1978 = _1976 && _1968;
    float _1980 = fma(_1832, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1964);
    float _1982 = log2(_1930);
    float _1984 = fma(_1974, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1972);
    bool _1986 = _1970 >= 0.0;
    bool _1988 = _1986 && _1978;
    float _1990 = _1980 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1992 = _1962 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1994 = fma(_1892, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1984);
    bool _1996 = _1970 <= 1.0;
    bool _1998 = _1996 && _1988;
    float _2000 = _1674;
    float _2002 = _1960;
    if (!_1642)
    {
        float _2004 = floor(_1549);
        _2000 = _2004;
    }
    float _2006 = _2000;
    float _2008 = fma(_1990, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1994);
    float _2010 = fma(_1974, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1992);
    float _2012 = _1509 * _1886;
    float _2014 = _1676;
    float _2016 = _2012;
    if (!_1642)
    {
        float _2018 = floor(_1545);
        _2014 = _2018;
    }
    float _2020 = _2014;
    float _2022 = _1962 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2024 = _1982 * 0.693147182464599609375;
    float _2026 = fma(_983, _1878, _2012);
    if (_1998)
    {
        float _2028 = float(_1611);
        _2016 = _2028;
    }
    float _2030 = _2016;
    float _2032 = fma(_1974, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2022);
    if (!_1642)
    {
        float _2034 = -_2006;
        float _2036 = _1549 + _2034;
        _2002 = _2036;
    }
    float _2038 = _2002;
    float _2040 = 1.0 / _2008;
    float _2042 = fma(_1091, _1940, _2026);
    float _2044 = _1914;
    if (!_1642)
    {
        float _2046 = rint(_1914);
        float _2048 = precise::max(_2046, 0.0);
        uint _2050 = uint(_2048);
        uint _2052 = clamp(_2050, 0u, 65535u);
        _2044 = as_type<float>(_2052);
    }
    float _2054 = _2044;
    float _2056 = fma(_1892, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2032);
    float _2058 = fma(_1892, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2010);
    float _2060 = _2042 + _1948;
    if (!_1642)
    {
        float _2062 = -_2020;
        float _2064 = _1545 + _2062;
        _1698 = _2064;
    }
    float _2066 = _1698;
    float _2068 = fma(_1990, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2056);
    float _2070 = fma(_1990, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2058);
    float _2072 = _2060 * _1896;
    float _2074 = _2030;
    float _2076 = _2070;
    if (_1998)
    {
        float _2078 = rint(_2030);
        float _2080 = precise::max(_2078, 0.0);
        uint _2082 = uint(_2080);
        uint _2084 = clamp(_2082, 0u, 65535u);
        _2074 = as_type<float>(_2084);
    }
    float _2086 = _2074;
    float _2088 = _2068 * _2040;
    float _2090 = _2070 * _2040;
    float _2092 = _2024 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2094 = fma(_2088, 0.5, 0.5);
    float _2096 = fma(_2090, -0.5, 0.5);
    float _2098 = _2066;
    float _2100 = _2054;
    if (!_1642)
    {
        float3 _6305 = float3(_2066, _2038, float(as_type<int>(_2054)));
        float3 _6309 = select(_6305, float3(0.0), isnan(_6305));
        float _2102 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6309.xy, uint(rint(_6309.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6309.xy, uint(rint(_6309.z)), level(0.0)).x;
        _2098 = _2102;
    }
    float _2104 = _2098;
    float _2106 = _1970;
    float _2108 = _2086;
    if (_1998)
    {
        float3 _6325 = float3(_1958, _1970, float(as_type<int>(_2086)));
        float3 _6327 = select(_6325, float3(0.0), isnan(_6325));
        float _2110 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6327.xy, uint(rint(_6327.z)), _2072, level(0.0));
        _2106 = _2110;
    }
    float _2112 = _2106;
    float3 _6337 = float3(_2094, _2096, _2092);
    float _2114 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6337, float3(0.0), isnan(_6337)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6337, float3(0.0), isnan(_6337)), level(0.0)).x;
    float3 _6346 = float3(_2094, _2096, _2092);
    float4 _2117 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6346, float3(0.0), isnan(_6346)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6346, float3(0.0), isnan(_6346)), level(0.0)).xyzw;
    float _2119 = _2117.x;
    float _2121 = _2117.y;
    float _2123 = _2117.z;
    float _2125 = _2117.w;
    bool _2127 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2129 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2131 = _2127 || _2129;
    bool _2133 = isnan(0.5);
    bool _2135 = _2131 || _2133;
    if (_2135)
    {
        _1700 = 1.0;
    }
    float _2137 = _1700;
    float _2139 = _2137;
    if (!_2135)
    {
        float _2141 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2143 = _2141 * 0.15915493667125701904296875;
        float _2145 = _2143 * 6.283185482025146484375;
        float _2147 = cos(_2145);
        float _2149 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2151 = _2149 * 0.15915493667125701904296875;
        float _2153 = _2143 * 6.283185482025146484375;
        float _2155 = sin(_2153);
        float _2157 = 1.0 / _2147;
        float _2159 = _2151 * 6.283185482025146484375;
        float _2161 = cos(_2159);
        float _2163 = _2155 * _2157;
        float _2165 = _2151 * 6.283185482025146484375;
        float _2167 = sin(_2165);
        float _2169 = _2161 * _2163;
        float _2171 = 1.0 / _2169;
        float _2173 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2175 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2173;
        float _2177 = 1.0 / _2175;
        float _2179 = _2167 * _2171;
        float _2181 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2183 = fma(_1585, _2179, _2181);
        float _2185 = _2183 * _2177;
        float _2187 = precise::clamp(_2185, 0.0, 1.0);
        _2108 = _2177;
        _2100 = _2151;
        _2139 = _2187;
    }
    float _2189 = _2108;
    float _2191 = _2100;
    float _2193 = _2139;
    float _2195 = _2191;
    float _2197 = _2189;
    if (_1642)
    {
        _2195 = 1.0;
    }
    float _2199 = _2195;
    float _2201 = _2199;
    if (!_1642)
    {
        int _2203 = _1706 << 4;
        int _2205 = _2203 + 2048;
        uint _2207 = uint(int(uint(_2205) >> uint(2)));
        uint _2209 = uint(int(uint(int(_2207)) >> uint(2)));
        int _2211 = int(_2207) & 3;
        float _2213 = (*spvDescriptorSet0.vp_c15)._m0[int(_2209)][_2211];
        int _2215 = int(_2207) + 1;
        uint _2217 = uint(int(uint(_2215) >> uint(2)));
        int _2219 = _2215 & 3;
        float _2221 = (*spvDescriptorSet0.vp_c15)._m0[int(_2217)][_2219];
        int _2223 = _2205 + 8;
        uint _2225 = uint(int(uint(_2223) >> uint(2)));
        uint _2227 = uint(int(uint(int(_2225)) >> uint(2)));
        int _2229 = int(_2225) & 3;
        float _2231 = (*spvDescriptorSet0.vp_c15)._m0[int(_2227)][_2229];
        int _2233 = int(_2225) + 1;
        uint _2235 = uint(int(uint(_2233) >> uint(2)));
        int _2237 = _2233 & 3;
        float _2239 = (*spvDescriptorSet0.vp_c15)._m0[int(_2235)][_2237];
        float _2241 = _1509 * _2221;
        float _2243 = fma(_983, _2213, _2241);
        float _2245 = fma(_1091, _2231, _2243);
        float _2247 = _2245 + _2239;
        float _2249 = precise::clamp(_2247, 0.0, 1.0);
        float _2251 = -_2249;
        float _2253 = _2251 + _2104;
        float _2255 = fma(_2253, 500.0, 1.5);
        float _2257 = exp2(_2255);
        float _2259 = 0.0 + _2257;
        float _2261 = precise::clamp(_2259, 0.0, 1.0);
        _2197 = _2231;
        _2201 = _2261;
    }
    float _2263 = _2197;
    float _2265 = _2201;
    float _2267 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2269 = _1826 + _2267;
    float _2271 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2273 = _1830 + _2271;
    float _2275 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2277 = _1832 + _2275;
    float _2279 = _2269 * _2269;
    float _2281 = fma(_2273, _2273, _2279);
    float _2283 = fma(_2277, _2277, _2281);
    float _2285 = rsqrt(_2283);
    float _2287 = _2285 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2289 = _2273 * _2287;
    float _2291 = _2277 * _2287;
    float _2293 = _2289 * _2289;
    float _2295 = _2291 * _2291;
    float _2297 = _2293 + _2295;
    float _2299 = sqrt(_2297);
    bool _2301 = _2299 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2303 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2305 = _2299 + _2303;
    float _2307 = _2277;
    float _2309 = _2285;
    float _2311 = _2305;
    float _2313 = _2263;
    float _2315 = _2287;
    if (_2301)
    {
        float _2317 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2307 = _2317;
    }
    float _2319 = _2307;
    if (_2301)
    {
        float _2321 = rsqrt(_2297);
        _2309 = _2321;
    }
    float _2323 = _2309;
    float _2325 = _2323;
    if (_2301)
    {
        float _2327 = _2305 * _2319;
        _2311 = _2327;
    }
    float _2329 = _2311;
    if (_2301)
    {
        float _2331 = _2329 * 0.15915493667125701904296875;
        _2313 = _2331;
    }
    float _2333 = _2313;
    float _2335 = _2319;
    float _2337 = _2333;
    if (_2301)
    {
        float _2339 = _2333 * 6.283185482025146484375;
        float _2341 = sin(_2339);
        _2335 = _2341;
    }
    float _2343 = _2335;
    float _2345 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2347 = precise::max(0.0, _2345);
    float _2349 = _2279;
    float _2351 = _2347;
    if (_2301)
    {
        float _2353 = _2333 * 6.283185482025146484375;
        float _2355 = cos(_2353);
        _2349 = _2355;
    }
    float _2357 = _2349;
    float _2359 = -_2287;
    float _2361 = -_2347;
    float _2363 = fma(_2269, _2359, _2361);
    if (_2301)
    {
        float _2365 = _2363 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2351 = _2365;
    }
    float _2367 = _2351;
    float _2369 = _2367;
    if (!_2301)
    {
        _2337 = _2293;
    }
    float _2371 = _2337;
    float _2373 = _2343;
    float _2375 = _2371;
    if (_2301)
    {
        float _2377 = fma(_2343, _2367, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2373 = _2377;
    }
    float _2379 = _2373;
    float _2381 = _2379;
    float _2383 = _2357;
    if (_2301)
    {
        float _2385 = _2357 + (-1.0);
        _2369 = _2385;
    }
    float _2387 = _2369;
    float _2389 = 0.0;
    float _2391 = _2387;
    if (_2301)
    {
        float _2393 = _2323 * _2379;
        _2389 = _2393;
    }
    float _2395 = _2389;
    if (!_2301)
    {
        _2325 = _2289;
    }
    float _2397 = _2325;
    float _2399 = _2397;
    if (_2301)
    {
        float _2401 = _2387 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2315 = _2401;
    }
    float _2403 = _2315;
    if (_2301)
    {
        float _2405 = _2289 * _2395;
        _2399 = _2405;
    }
    float _2407 = _2399;
    if (!_2301)
    {
        _2381 = _2363;
    }
    float _2409 = _2381;
    float _2411 = _2409;
    if (!_2301)
    {
        _2391 = _2291;
    }
    float _2413 = _2391;
    float _2415 = _2413;
    if (_2301)
    {
        float _2417 = fma(_2363, _2357, _2403);
        _2411 = _2417;
    }
    float _2419 = _2411;
    if (_2301)
    {
        float _2421 = _2291 * _2395;
        _2415 = _2421;
    }
    float _2423 = _2415;
    if (_2301)
    {
        float _2425 = _2407 * _2407;
        _2375 = _2425;
    }
    float _2427 = _2375;
    if (!_2301)
    {
        _2383 = _2295;
    }
    float _2429 = _2383;
    float _2431 = sqrt(_2283);
    float _2433 = _2429;
    if (_2301)
    {
        float _2435 = _2423 * _2423;
        _2433 = _2435;
    }
    float _2437 = _2433;
    float _2439 = fma(_2419, _2419, _2427);
    float _2441 = _2439 + _2437;
    float _2443 = rsqrt(_2441);
    float _2445 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2447 = fma(_2431, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2445);
    float _2449 = precise::clamp(_2447, 0.0, 1.0);
    float _2451 = -_2449;
    float _2453 = _2451 + 1.0;
    float _2455 = _2443 * _2407;
    float _2457 = _2443 * _2419;
    float _2459 = _2443 * _2423;
    float _2461 = abs(_2453);
    float _2463 = log2(_2461);
    float _2465 = _2455 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2467 = -_2465;
    float _2469 = fma(_2457, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2467);
    float _2471 = -_2459;
    float _2473 = fma(_2471, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2469);
    float _2475 = fma(_2473, -0.5, 0.5);
    float _2477 = fma(_2473, 0.5, 0.5);
    float _2479 = _2463 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2481 = fma(_2477, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2483 = sqrt(_2475);
    float _2485 = fma(_2477, _2481, -0.212114393711090087890625);
    float _2487 = _2457 + 1.0;
    float _2489 = fma(_2477, _2485, 1.570728778839111328125);
    float _2491 = exp2(_2479);
    float _2493 = _2483 * 0.636619746685028076171875;
    float _2495 = -_2489;
    float _2497 = fma(_2493, _2495, 1.0);
    float _2499 = -_2457;
    float _2501 = fma(_2491, _2487, _2499);
    float _2503 = fma(_2501, 0.5, 0.5);
    float2 _6919 = float2(_2497, _2503);
    float3 _2507 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6919, float2(0.0), isnan(_6919)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6919, float2(0.0), isnan(_6919)), level(0.0)).xyz;
    float _2509 = _2507.x;
    float _2511 = _2507.y;
    float _2513 = _2507.z;
    float _2515 = abs(_1585);
    float _2517 = log2(_2515);
    float _2519 = _1962 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2521 = _2463 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2523 = _2068 + _2008;
    float _2525 = fma(_1974, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2519);
    float _2527 = -_1497;
    float _2529 = _2527 + 1.0;
    float _2531 = _2523 * 0.5;
    float _2533 = exp2(_2521);
    bool _2535 = _1585 <= 8000.0;
    bool _2537 = isnan(_1585);
    bool _2539 = _2535 || _2537;
    bool _2541 = isnan(8000.0);
    bool _2543 = _2539 || _2541;
    float _2545 = float(_2543);
    float _2547 = _2517 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2549 = fma(_1892, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2525);
    float _2551 = _2008 * 0.5;
    float _2553 = fma(_1990, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2549);
    float _2555 = exp2(_2547);
    float _2557 = fma(_2070, -0.5, _2551);
    float _2559 = _2553 + _2008;
    out.gl_Position.x = _2068;
    out.gl_Position.y = _2070;
    out.gl_Position.z = _2553;
    out.gl_Position.w = _2008;
    float _2561 = _2559 * 0.5;
    out.m_90.x = _2531;
    out.m_90.y = _2557;
    out.m_90.z = _2561;
    out.m_90.w = _2008;
    float _2563 = fma(_2555, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2565 = precise::clamp(_2563, 0.0, 1.0);
    float _2567 = -_2533;
    float _2569 = _2567 + 1.0;
    float _2571 = _2553;
    if (!_1998)
    {
        _2076 = 1.0;
    }
    float _2573 = _2076;
    float _2575 = fma(_2565, -2.0, 3.0);
    float _2577 = _2565 * _2565;
    float _2579 = _2573;
    if (_1998)
    {
        bool _2581 = _2112 >= _2072;
        bool _2583 = isnan(_2112);
        bool _2585 = _2581 || _2583;
        bool _2587 = isnan(_2072);
        bool _2589 = _2585 || _2587;
        float _2591 = float(_2589);
        _2579 = _2591;
    }
    float _2593 = _2579;
    float _2595 = _2569 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _2597 = _2431 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2599 = isnan(_2431);
    bool _2601 = _2597 || _2599;
    bool _2603 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2605 = _2601 || _2603;
    float _2607 = _2577 * _2575;
    float _2609 = _2595 * _2114;
    float _2611 = _2593 * _2265;
    float _2613 = -_2607;
    float _2615 = _2613 + 1.0;
    float _2617 = -_2595;
    float _2619 = _2617 + 1.0;
    float _2621 = _2125 * _2609;
    float _2623 = _2193 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2625 = fma(_2615, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2607);
    float _2627 = _2125 * _2619;
    float _2629 = _2545 * _2625;
    float _2631 = _2619;
    float _2633 = _2629;
    if (!_2605)
    {
        _2571 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2635 = _2571;
    float _2637 = _2635;
    float _2639 = _2635;
    if (!_2605)
    {
        _2631 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2641 = _2631;
    float _2643 = _2629 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2645 = _2643;
    float _2647 = _2641;
    float _2649 = _2641;
    if (!_2605)
    {
        _2633 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2651 = _2633;
    float _2653 = _2529 * _2643;
    float _2655 = precise::clamp(_2653, 0.0, 1.0);
    float _2657 = _2651;
    float _2659 = _2651;
    if (!_2605)
    {
        _2645 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2661 = _2645;
    float _2663 = -_2655;
    float _2665 = fma(_2663, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2667 = _2661;
    float _2669 = _2661;
    if (!_2605)
    {
        _773 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2671 = _773;
    float _2673 = -_2611;
    float _2675 = fma(_2673, _2665, 1.0);
    float _2677 = precise::clamp(_2675, 0.0, 1.0);
    float _2679 = _2677 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2681 = _2677;
    float _2683 = _2671;
    float _2685 = _2671;
    if (!_2605)
    {
        _2681 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2687 = _2681;
    out.m_92.x = _2679;
    float _2689 = _2513 * _2609;
    float _2691 = fma(_2509, _2621, _2119);
    float _2693 = fma(_2511, _2621, _2121);
    float _2695 = fma(_2125, _2689, _2123);
    out.m_94.x = _2691;
    out.m_94.y = _2693;
    out.m_94.z = _2695;
    out.m_94.w = _2627;
    bool _2697 = !_2605;
    float _2699 = _2687;
    float _2701 = _2687;
    if (!_2697)
    {
        bool _2703 = _2431 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2705 = isnan(_2431);
        bool _2707 = _2703 || _2705;
        bool _2709 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2711 = _2707 || _2709;
        if (!_2711)
        {
            float _2713 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2715 = _2431 + _2713;
            float _2717 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2719 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2717;
            float _2721 = 1.0 / _2719;
            float _2723 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2725 = _2723 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2727 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2729 = _2727 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2731 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2733 = _2731 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2735 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2737 = _2735 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2739 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2741 = _2739 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2743 = _2715 * _2721;
            float _2745 = precise::clamp(_2743, 0.0, 1.0);
            float _2747 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2749 = _2747 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2751 = fma(_2745, _2725, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2753 = fma(_2745, _2749, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2755 = fma(_2745, _2729, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2757 = fma(_2745, _2733, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2759 = fma(_2745, _2737, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2761 = fma(_2745, _2741, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2669 = _2753;
            _2649 = _2759;
            _2659 = _2751;
            _2701 = _2757;
            _2639 = _2755;
            _2685 = _2761;
            _2763 = true;
        }
        else
        {
            bool _2765 = _2431 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2767 = isnan(_2431);
            bool _2769 = _2765 || _2767;
            bool _2771 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2773 = _2769 || _2771;
            if (!_2773)
            {
                _2657 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2775 = _2657;
            _2659 = _2775;
            if (!_2773)
            {
                _2667 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2777 = _2667;
            _2669 = _2777;
            if (!_2773)
            {
                _2637 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2779 = _2637;
            _2639 = _2779;
            if (!_2773)
            {
                _2699 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2781 = _2699;
            _2701 = _2781;
            if (!_2773)
            {
                _2647 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2783 = _2647;
            _2649 = _2783;
            if (!_2773)
            {
                _2683 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2785 = _2683;
            bool _2787 = !_2773;
            _2685 = _2785;
            if (!_2787)
            {
                bool _2789 = _2431 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2791 = isnan(_2431);
                bool _2793 = _2789 || _2791;
                bool _2795 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2797 = _2793 || _2795;
                if (!_2797)
                {
                    float _2799 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2801 = _2431 + _2799;
                    float _2803 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2805 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2803;
                    float _2807 = 1.0 / _2805;
                    float _2809 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2811 = _2809 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2813 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2815 = _2813 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2817 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2819 = _2817 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2821 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2823 = _2821 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2825 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2827 = _2825 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2829 = _2801 * _2807;
                    float _2831 = precise::clamp(_2829, 0.0, 1.0);
                    float _2833 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2835 = _2833 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2837 = fma(_2831, _2811, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2839 = fma(_2831, _2835, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2841 = fma(_2831, _2815, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2843 = fma(_2831, _2819, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2845 = fma(_2831, _2823, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2847 = fma(_2831, _2827, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2669 = _2839;
                    _2649 = _2845;
                    _2659 = _2837;
                    _2701 = _2843;
                    _2639 = _2841;
                    _2685 = _2847;
                    _2763 = true;
                }
                else
                {
                    _2669 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2649 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2659 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2701 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2639 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2685 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2763 = false;
    float _2849 = _2669;
    float _2851 = _2649;
    float _2853 = _2659;
    float _2855 = _2701;
    float _2857 = _2639;
    float _2859 = _2685;
    float _2861 = fma(_1399, -0.5, 0.5);
    float _2863 = precise::clamp(_2861, 0.0, 1.0);
    float _2865 = -_2849;
    float _2867 = _2865 + _2851;
    float _2869 = _2623 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2871 = -_2853;
    float _2873 = _2871 + _2855;
    float _2875 = fma(_2863, _2867, _2849);
    out.m_96.x = 0.0;
    float _2877 = -_2857;
    float _2879 = _2877 + _2859;
    float _2881 = fma(_2863, _2873, _2853);
    float _2883 = _2875 * 0.586610972881317138671875;
    out.m_61.x = _2869;
    bool _2885 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2887 = fma(_2863, _2879, _2857);
    float _2889 = fma(_2881, 0.298911988735198974609375, _2883);
    bool _2891 = _2193 > 0.0;
    bool _2893 = isnan(_2193);
    bool _2895 = _2891 || _2893;
    bool _2897 = isnan(0.0);
    bool _2899 = _2895 || _2897;
    float _2901 = fma(_2887, 0.114477999508380889892578125, _2889);
    float _2903 = -_2901;
    float _2905 = _2881 + _2903;
    float _2907 = -_2901;
    float _2909 = _2875 + _2907;
    float _2911 = -_2901;
    float _2913 = _2887 + _2911;
    float _2915 = fma(_2905, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2901);
    float _2917 = fma(_2909, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2901);
    float _2919 = fma(_2913, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2901);
    bool _2921 = !_2885;
    if (!_2921)
    {
        float _2923 = -_1826;
        float _2925 = _2923 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2927 = -_1830;
        float _2929 = _2927 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2931 = -_1832;
        float _2933 = _2931 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2935 = _2925 * _2925;
        float _2937 = fma(_2929, _2929, _2935);
        float _2939 = fma(_2933, _2933, _2937);
        float _2941 = sqrt(_2939);
        float _2943 = rsqrt(_2939);
        float _2945 = -_2941;
        float _2947 = _2945 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2949 = _2947 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2951 = precise::clamp(_2949, 0.0, 1.0);
        float _2953 = _2929 * _2943;
        float _2955 = _2925 * _2943;
        float _2957 = abs(_2951);
        float _2959 = log2(_2957);
        float _2961 = _2933 * _2943;
        float _2963 = _2953 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2965 = _1399 * _2955;
        float _2967 = -_2955;
        float _2969 = -_2963;
        float _2971 = fma(_2967, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2969);
        float _2973 = fma(_1397, _2953, _2965);
        float _2975 = -_2961;
        float _2977 = fma(_2975, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2971);
        float _2979 = fma(_1401, _2961, _2973);
        float _2981 = precise::clamp(_2979, 0.0, 1.0);
        float _2983 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2985 = _2977 + _2983;
        float _2987 = _2959 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2989 = _2985 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2991 = precise::clamp(_2989, 0.0, 1.0);
        float _2993 = exp2(_2987);
        float _2995 = _2993 * _2991;
        float _2997 = _2981 * _2995;
        float _2999 = _2997 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3001 = _2997 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3003 = _2997 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_96.x = _2999;
        out.m_96.y = _3001;
        out.m_96.z = _3003;
    }
    out.m_98.x = _2915;
    out.m_98.y = _2917;
    out.m_98.z = _2919;
    if (_2899)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_61.x = 0.0;
    float _3005 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3005;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2763 = false;
    bool _1449 = false;
    bool _373 = false;
    bool _215 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _112 = in.m_58.w;
    float _114 = trunc(_112);
    int _117 = int(_114);
    bool _121 = _117 >= 1;
    float _123 = 0.0;
    if (!_121)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _125 = _123;
    float _127 = _125;
    if (!_121)
    {
        out.m_61.x = 0.0;
    }
    int _129 = 0;
    if (!_121)
    {
        float _131 = _125 * 5.0;
        _129 = as_type<int>(_131);
    }
    int _133 = _129;
    int _135 = _133;
    if (!_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3062 = as_type<float>(_133);
        out.gl_Position.z = _3062;
    }
    if (!_121)
    {
        return out;
    }
    float _137 = in.m_63.w;
    bool _139 = _137 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _141 = isnan(_137);
    bool _143 = _139 || _141;
    bool _145 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _147 = _143 || _145;
    float _149 = -_137;
    float _151 = _149 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _153 = _151;
    if (_147)
    {
        float _155 = float(_117);
        _127 = _155;
    }
    float _157 = _127;
    bool _159 = _151 >= _157;
    bool _161 = !_147;
    bool _163 = _159 || _161;
    float _165 = _157;
    if (_163)
    {
        _165 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _167 = _165;
    if (_163)
    {
        out.m_61.x = 0.0;
    }
    if (_163)
    {
        float _169 = _167 * 5.0;
        _135 = as_type<int>(_169);
    }
    int _171 = _135;
    if (_163)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3132 = as_type<float>(_171);
        out.gl_Position.z = _3132;
    }
    if (_163)
    {
        return out;
    }
    float _173 = as_type<float>(int(gl_VertexIndex));
    bool _175 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _177 = as_type<int>(_173) & 1;
    bool _179 = _177 != 0;
    int _181 = as_type<int>(_173) & 2;
    bool _183 = _181 != 0;
    bool _185 = !_179;
    float _187 = _185 ? (-0.5) : 0.5;
    bool _189 = !_183;
    float _191 = _189 ? (-0.5) : 0.5;
    bool _193 = !_175;
    float _195 = _191;
    float _213;
    if (!_193)
    {
        float _197 = in.m_68.x;
        float _199 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _201 = _197 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _203 = fma(_201, (*spvDescriptorSet0.vp_c9)._m0[12].x, _151);
        float _205 = _203 * _199;
        float _207 = floor(_205);
        float _209 = -_207;
        float _211 = _205 + _209;
        _213 = _211;
        _215 = true;
    }
    else
    {
        float _217 = float(_117);
        float _219 = 1.0 / _217;
        float _221 = _151 * _219;
        _213 = _221;
    }
    _215 = false;
    float _223 = _213;
    float _225 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _227 = _223 + _225;
    bool _229 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _231 = isnan(_223);
    bool _233 = _229 || _231;
    bool _235 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _237 = _233 || _235;
    float _239 = float(_237);
    float _241 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _243 = _223 + _241;
    float _245 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _247 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _245;
    float _249 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _251 = _249 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _253 = -_239;
    float _255 = _253 + 1.0;
    float _257 = 1.0 / _247;
    bool _259 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _261 = isnan(_223);
    bool _263 = _259 || _261;
    bool _265 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _267 = _263 || _265;
    float _269 = float(_267);
    bool _271 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _273 = 1.0 / _251;
    float _275 = _227 * _257;
    bool _277 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _279 = isnan(_223);
    bool _281 = _277 || _279;
    bool _283 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _285 = _281 || _283;
    float _287 = float(_285);
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _291 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _289;
    float _293 = in.m_70.x;
    float _295 = in.m_70.y;
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _299 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _297;
    float _301 = _287 * _255;
    float _303 = -_287;
    float _305 = _303 + 1.0;
    float _307 = fma(_291, _275, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _309 = fma(_299, _275, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _311 = _243 * _273;
    float _313 = _269 * _305;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _317 = _315 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _321 = _319 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _323 = -_269;
    float _325 = _323 + 1.0;
    float _327 = _307 * _313;
    float _329 = _309 * _313;
    float _331 = fma(_317, _311, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _333 = fma(_321, _311, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _335 = fma(_325, (*spvDescriptorSet0.vp_c9)._m0[143].y, _327);
    float _337 = fma(_325, (*spvDescriptorSet0.vp_c9)._m0[143].x, _329);
    float _339 = fma(_333, _301, _335);
    float _341 = fma(_331, _301, _337);
    float _343 = fma(_239, (*spvDescriptorSet0.vp_c9)._m0[145].y, _339);
    float _345 = fma(_239, (*spvDescriptorSet0.vp_c9)._m0[145].x, _341);
    float _347 = _343 * _295;
    float _349 = _345 * _293;
    bool _351 = !_271;
    float _353 = _333;
    float _371;
    if (!_351)
    {
        float _355 = in.m_68.x;
        float _357 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _359 = _355 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _361 = fma(_359, (*spvDescriptorSet0.vp_c9)._m0[11].y, _151);
        float _363 = _361 * _357;
        float _365 = floor(_363);
        float _367 = -_365;
        float _369 = _363 + _367;
        _371 = _369;
        _373 = true;
    }
    else
    {
        float _375 = float(_117);
        float _377 = 1.0 / _375;
        float _379 = _151 * _377;
        _371 = _379;
    }
    _373 = false;
    float _381 = _371;
    float _383 = in.m_68.z;
    float _385 = in.m_68.w;
    float _387 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _191);
    float _389 = in.m_68.x;
    int _391 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _393 = _391 != 0;
    float _395 = _349 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _397 = in.m_68.y;
    float _399 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _187);
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _403 = _401 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _405 = _395 * _399;
    float _407 = 1.0 / _403;
    float _409 = _339;
    if (!_393)
    {
        float _411 = in.m_68.z;
        _409 = _411;
    }
    float _413 = _409;
    float _415 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _417 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _419 = _383 * 2.0;
    bool _421 = _383 > 0.5;
    float _423 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _425 = _385 > 0.5;
    float _427 = _389 * 2.0;
    float _429 = -_191;
    int _431 = _421 ? as_type<int>(_429) : as_type<int>(_191);
    float _433 = floor(_419);
    float _435 = -_191;
    int _437 = _425 ? as_type<int>(_435) : as_type<int>(_191);
    float _439 = _397 * 2.0;
    float _441 = _397;
    if (!_393)
    {
        _353 = _397;
    }
    float _443 = _353;
    float _445 = _389 + _383;
    float _447 = _443;
    if (_393)
    {
        _447 = _389;
    }
    float _449 = _447;
    float _451 = floor(_427);
    float _453 = _445 + (-1.0);
    float _455 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[83].z, _415);
    float _457 = _383 + _397;
    float _459 = _383 + (-0.5);
    float _461 = fma(_453, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _463 = _449 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _465 = floor(_439);
    bool _467 = _433 > 0.0;
    float _469 = -_423;
    float _471 = fma(_463, 2.0, _469);
    bool _473 = _433 >= 0.0;
    bool _475 = isnan(_433);
    bool _477 = _473 || _475;
    bool _479 = isnan(0.0);
    bool _481 = _477 || _479;
    float _483 = _389 + _397;
    float _485 = _457 + (-1.0);
    int _487 = _481 ? 0 : 1;
    float _489 = _483 + (-1.0);
    bool _491 = _451 > 0.0;
    int _493 = ~_487;
    int _495 = _493 + 1;
    int _497 = _495 + 1;
    float _499 = fma(_489, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _501 = _451 >= 0.0;
    bool _503 = isnan(_451);
    bool _505 = _501 || _503;
    bool _507 = isnan(0.0);
    bool _509 = _505 || _507;
    int _511 = _497;
    float _513 = _451;
    if (!_467)
    {
        int _515 = ~_487;
        int _517 = _515 + 1;
        _511 = _517;
    }
    int _519 = _511;
    int _521 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _523 = _521 != 0;
    float _525 = -_187;
    int _527 = _421 ? as_type<int>(_525) : as_type<int>(_187);
    int _529 = _509 ? 0 : 1;
    int _531 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _533 = _531 != 0;
    int _535 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _537 = _535 != 0;
    int _539 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _541 = _539 != 0;
    int _543 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _545 = _543 != 0;
    bool _547 = !_523;
    float _549 = _547 ? _187 : as_type<float>(_527);
    bool _551 = _397 > 0.5;
    int _553 = ~_529;
    int _555 = _553 + 1;
    int _557 = _555 + 1;
    int _559 = _557;
    if (!_491)
    {
        int _561 = ~_529;
        int _563 = _561 + 1;
        _559 = _563;
    }
    int _565 = _559;
    bool _567 = !_545;
    float _569 = _567 ? _191 : as_type<float>(_431);
    bool _571 = _465 > 0.0;
    bool _573 = _465 >= 0.0;
    bool _575 = isnan(_465);
    bool _577 = _573 || _575;
    bool _579 = isnan(0.0);
    bool _581 = _577 || _579;
    float _583 = -_187;
    int _585 = _551 ? as_type<int>(_583) : as_type<int>(_187);
    float _587 = _413;
    if (!_393)
    {
        _513 = _413;
    }
    float _589 = _513;
    int _591 = _581 ? 0 : 1;
    float _593 = _589;
    if (_393)
    {
        _593 = _397;
    }
    float _595 = _593;
    if (_393)
    {
        _587 = _397;
    }
    float _597 = _587;
    bool _599 = !_541;
    float _601 = _599 ? _187 : as_type<float>(_585);
    int _603 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _605 = _603 != 0;
    int _607 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _609 = _607 != 0;
    int _611 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _613 = _611 != 0;
    float _615 = _347 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _617 = ~_591;
    int _619 = _617 + 1;
    int _621 = _619 + 1;
    float _623 = fma(_597, (*spvDescriptorSet0.vp_c9)._m0[83].w, _417);
    int _625 = _621;
    bool _627 = _537;
    bool _629 = _533;
    if (!_571)
    {
        int _631 = ~_591;
        int _633 = _631 + 1;
        _625 = _633;
    }
    int _635 = _625;
    float _637 = _615 * _387;
    bool _639 = !_605;
    int _641 = _639 ? 0 : 1;
    float _643 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _645 = log2(_643);
    bool _647 = !_609;
    int _649 = _647 ? 0 : 1;
    float _651 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _653 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _655 = _653 != 0;
    float _657 = _595 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _659 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _661 = _659 != 0;
    int _663 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _665 = _663 != 0;
    float _667 = fma(_657, -2.0, _651);
    int _669 = abs(_641);
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _673 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _671;
    float _675 = in.m_72.x;
    float _677 = in.m_72.y;
    float _679 = in.m_72.z;
    float _681 = _645 * _151;
    int _683 = abs(_649);
    float _685 = _673 * _407;
    float _687 = fma(_485, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _689 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _691 = 1.0 + _689;
    float _693 = exp2(_681);
    bool _695 = !_613;
    int _697 = _695 ? 0 : 1;
    bool _699 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _701 = isnan(0.0);
    bool _703 = _699 || _701;
    bool _705 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _707 = _703 || _705;
    float _709 = float(_519);
    float _711 = float(_669);
    float _713 = 1.0 / _691;
    float _715 = float(_565);
    float _717 = float(_683);
    float _719 = _711 * _709;
    int _721 = abs(_697);
    float _723 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[82].z, _455);
    float _725 = float(_635);
    float _727 = -_693;
    float _729 = _727 + 1.0;
    float _731 = float(_721);
    float _733 = _717 * _715;
    float _735 = _719 * (-2.0);
    float _737 = -_151;
    float _739 = fma(_737, (*spvDescriptorSet0.vp_c9)._m0[81].x, _471);
    float _741 = _707 ? _729 : 0.0;
    float _743 = _733 * (-2.0);
    bool _745 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _747 = isnan(1.0);
    bool _749 = _745 || _747;
    bool _751 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _753 = _749 || _751;
    float _755 = _731 * _725;
    float _757 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[82].w, _623);
    float _759 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[81].y, _667);
    float _761 = fma(_499, _735, _499);
    float _763 = fma(_735, _675, _675);
    float _765 = fma(_743, _677, _677);
    float _767 = _389 + (-0.5);
    float _769 = _675;
    float _771 = _763;
    float _773 = 1.0;
    if (_661)
    {
        float _775 = _389 * 3.1415927410125732421875;
        _769 = _775;
    }
    float _777 = _769;
    float _779 = _755 * (-2.0);
    float _781 = fma(_687, _743, _687);
    float _783 = fma(_767, (*spvDescriptorSet0.vp_c9)._m0[196].x, _763);
    if (_661)
    {
        float _785 = _777 * 0.15915493667125701904296875;
        _771 = _785;
    }
    float _787 = _771;
    if (_753)
    {
        float _789 = _741 * _713;
        _153 = _789;
    }
    float _791 = _153;
    bool _793 = _389 > 0.5;
    float _795 = _397 + (-0.5);
    float _797 = in.m_58.x;
    float _799 = in.m_58.y;
    float _801 = in.m_58.z;
    float _803 = fma(_461, _779, _461);
    float _805 = fma(_779, _679, _679);
    float _807 = fma(_795, (*spvDescriptorSet0.vp_c9)._m0[196].y, _765);
    float _809 = fma(_761, _791, _783);
    float _811 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _813 = _381 + _811;
    float _815 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _817 = fma(_781, _791, _807);
    bool _819 = _381 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _821 = isnan(_381);
    bool _823 = _819 || _821;
    bool _825 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _827 = _823 || _825;
    float _829 = float(_827);
    float _831 = fma(_459, (*spvDescriptorSet0.vp_c9)._m0[196].z, _805);
    float _833 = _809 * 0.15915493667125701904296875;
    float _835 = fma(_685, _813, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    if (_661)
    {
        float _837 = _787 * 6.283185482025146484375;
        float _839 = sin(_837);
        _441 = _839;
    }
    float _841 = _441;
    bool _843 = _381 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _845 = isnan(_381);
    bool _847 = _843 || _845;
    bool _849 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _851 = _847 || _849;
    float _853 = float(_851);
    float _855 = fma(_803, _791, _831);
    float _857 = -_829;
    float _859 = _857 + 1.0;
    float _861 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _863 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _865 = _817 * 0.15915493667125701904296875;
    float _867 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _869 = _853 * _859;
    float _871 = _855 * 0.15915493667125701904296875;
    float _873 = _799 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _875 = _799 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _877 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _879 = _799 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _881 = _861 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _883 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _885 = _863 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _887 = _877 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _889 = _833 * 6.283185482025146484375;
    float _891 = sin(_889);
    float _893 = fma(_797, (*spvDescriptorSet0.vp_c10)._m0[5].x, _875);
    float _895 = fma(_797, (*spvDescriptorSet0.vp_c10)._m0[6].x, _879);
    float _897 = -_853;
    float _899 = _897 + 1.0;
    out.m_74.x = _885;
    out.m_74.y = _881;
    out.m_74.z = _887;
    out.m_74.w = _883;
    float _901 = _867 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _903 = -_757;
    float _905 = _903 + 1.0;
    float _907 = -_723;
    float _909 = _907 + 1.0;
    float _911 = _833 * 6.283185482025146484375;
    float _913 = cos(_911);
    float _915 = _865 * 6.283185482025146484375;
    float _917 = sin(_915);
    float _919 = fma(_797, (*spvDescriptorSet0.vp_c10)._m0[4].x, _873);
    float _921 = _835 * _869;
    float _923 = _815 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _925 = fma(_801, (*spvDescriptorSet0.vp_c10)._m0[5].z, _893);
    float _927 = fma(_801, (*spvDescriptorSet0.vp_c10)._m0[4].z, _919);
    float _929 = fma(_801, (*spvDescriptorSet0.vp_c10)._m0[6].z, _895);
    float _931 = _815;
    if (_655)
    {
        float _933 = in.m_68.w;
        _931 = _933;
    }
    float _935 = _931;
    float _937 = _865 * 6.283185482025146484375;
    float _939 = cos(_937);
    float _941 = fma(_899, (*spvDescriptorSet0.vp_c9)._m0[115].x, _921);
    bool _943 = !_537;
    float _945 = _943 ? _191 : as_type<float>(_437);
    float _947 = _549 + 0.5;
    if (_661)
    {
        bool _949 = _841 > 0.5;
        _627 = _949;
    }
    bool _951 = _627;
    float _953 = fma(_829, (*spvDescriptorSet0.vp_c9)._m0[116].x, _941);
    float _955 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _957 = _945 + (-0.5);
    float _959 = _871 * 6.283185482025146484375;
    float _961 = cos(_959);
    float _963 = fma(_901, _947, _739);
    float _965 = _891 * _917;
    float _967 = _913 * _917;
    float _969 = -_923;
    float _971 = -_759;
    float _973 = fma(_969, _957, _971);
    float _975 = -_187;
    int _977 = _793 ? as_type<int>(_975) : as_type<int>(_187);
    float _979 = -_909;
    float _981 = fma(_549, _979, _963);
    float _983 = _927 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _985 = _871 * 6.283185482025146484375;
    float _987 = sin(_985);
    float _989 = _891 * _939;
    bool _991 = !_665;
    float _993 = _991 ? _187 : as_type<float>(_977);
    float _995 = fma(_945, _905, _973);
    float _997 = _891 * _961;
    float _999 = _913 * _939;
    float _1001 = _913 * _961;
    float _1003 = _939 * _961;
    float _1005 = _917 * _961;
    float _1007 = _997 * _637;
    float _1009 = _1001 * _637;
    float _1011 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1013 = fma(_987, _999, _965);
    float _1015 = -_967;
    float _1017 = fma(_987, _989, _1015);
    float _1019 = -_989;
    float _1021 = fma(_987, _967, _1019);
    float _1023 = -_637;
    float _1025 = _987 * _1023;
    float _1027 = fma(_1013, _405, _1009);
    float _1029 = _993 + 0.5;
    float _1031 = fma(_987, _965, _999);
    float _1033 = _993;
    float _1035 = _1005;
    float _1037 = _1031;
    if (_655)
    {
        float _1039 = _935 * 3.1415927410125732421875;
        _1033 = _1039;
    }
    float _1041 = _1033;
    float _1043 = fma(_1003, _405, _1025);
    float _1045 = fma(_1021, _955, _1027);
    float _1047 = fma(_1017, _405, _1007);
    float _1049 = -_191;
    int _1051 = _551 ? as_type<int>(_1049) : as_type<int>(_191);
    float _1053 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1055 = fma(_1005, _955, _1043);
    float _1057 = _1045 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1059 = _1045 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _1061 = !_533;
    float _1063 = _1061 ? _191 : as_type<float>(_1051);
    float _1065 = fma(_1031, _955, _1047);
    float _1067 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1057);
    float _1069 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1059);
    float _1071 = _1029 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1073 = -_1063;
    float _1075 = _1073 + 0.5;
    float _1077 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1067);
    float _1079 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1069);
    float _1081 = _1047;
    if (_655)
    {
        float _1083 = _1041 * 0.15915493667125701904296875;
        _1081 = _1083;
    }
    float _1085 = _1081;
    float _1087 = _1071 * _1011;
    float _1089 = _1075 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1091 = _929 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1093 = _1077 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1095 = _1079 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1097 = _953 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1099 = _1089 * _1053;
    float _1101 = _983 + _1093;
    float _1103 = _1091 + _1095;
    float _1105 = _909;
    float _1107 = _1103;
    float _1109 = _1101;
    if (_655)
    {
        float _1111 = _1085 * 6.283185482025146484375;
        float _1113 = sin(_1111);
        _1105 = _1113;
    }
    float _1115 = _1105;
    float _1117 = _1001 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1119 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1121 = _1101 + _1119;
    float _1123 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1125 = _1103 + _1123;
    float _1127 = _1001 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1129 = _1001 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1131 = _1121 * _1121;
    out.m_76.x = _1087;
    out.m_76.y = _1099;
    out.m_76.z = _981;
    out.m_76.w = _995;
    float _1133 = _1013 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1135 = _1125 * _1125;
    float _1137 = _1045 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1139 = -_987;
    float _1141 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1117);
    float _1143 = fma(_1003, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1133);
    float _1145 = _1131 + _1135;
    float _1147 = -_987;
    float _1149 = fma(_1147, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1127);
    float _1151 = -_987;
    float _1153 = fma(_1151, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1129);
    float _1155 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1137);
    float _1157 = _1131;
    float _1159 = _1135;
    if (_655)
    {
        bool _1161 = _1115 > 0.5;
        _629 = _1161;
    }
    bool _1163 = _629;
    out.m_78.w = _1097;
    float _1165 = fma(_997, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1141);
    float _1167 = fma(_997, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1149);
    float _1169 = sqrt(_1145);
    float _1171 = _1013 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1173 = _1013 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1175 = _1021 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1177 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1155);
    float _1179 = fma(_1003, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1171);
    float _1181 = fma(_1003, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1173);
    float _1183 = _1021 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1185 = fma(_997, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1153);
    float _1187 = _1021 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1189 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1191 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1183);
    float _1193 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1175);
    float _1195 = _925 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1197 = _1177 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1199 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1187);
    bool _1201 = _1169 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1203 = fma(_1031, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1193);
    float _1205 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1207 = _1195 + _1197;
    float _1209 = fma(_1031, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1191);
    if (!_661)
    {
        _1035 = _191;
    }
    float _1211 = _1035;
    float _1213 = fma(_1031, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1199);
    float _1215 = _1211;
    if (_661)
    {
        float _1217 = -_191;
        float _1219 = _951 ? _1217 : _191;
        _1215 = _1219;
    }
    float _1221 = _1215;
    float _1223 = _191 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    if (!_1201)
    {
        _1037 = _1103;
    }
    float _1225 = _1037;
    float _1227 = _1225;
    if (!_1201)
    {
        _195 = _1101;
    }
    float _1229 = _195;
    float _1231 = _1229;
    if (!_1201)
    {
        _1107 = _1207;
    }
    float _1233 = _1107;
    bool _1235 = !_1201;
    float _1237 = _1233;
    if (!_1235)
    {
        float _1239 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1241 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1243 = _1169 + _1241;
        float _1245 = rsqrt(_1145);
        float _1247 = _1243 * _1239;
        float _1249 = _1207 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1251 = _1247 * 0.15915493667125701904296875;
        float _1253 = _1251 * 6.283185482025146484375;
        float _1255 = sin(_1253);
        float _1257 = _1251 * 6.283185482025146484375;
        float _1259 = cos(_1257);
        float _1261 = fma(_1255, _1249, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1263 = _1245 * _1261;
        float _1265 = _1259 + (-1.0);
        float _1267 = fma(_1121, _1263, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1269 = fma(_1125, _1263, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1271 = _1265 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1273 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1275 = _1267 + _1273;
        float _1277 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1279 = _1269 + _1277;
        float _1281 = fma(_1207, _1259, _1271);
        float _1283 = _1275 * _1275;
        float _1285 = _1279 * _1279;
        _1237 = _1281;
        _1157 = _1283;
        _1159 = _1285;
        _1109 = _1251;
        _1231 = _1267;
        _1227 = _1269;
    }
    float _1287 = _1237;
    float _1289 = _1157;
    float _1291 = _1159;
    float _1293 = _1109;
    float _1295 = _1231;
    float _1297 = _1227;
    float _1299 = fma(_1223, _1223, 1.0);
    float _1301 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _1303 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1305 = _1287 + _1303;
    float _1307 = fma(_1017, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1181);
    float _1309 = _1293;
    if (!_655)
    {
        _1309 = _187;
    }
    float _1311 = _1309;
    float _1313 = fma(_1017, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1179);
    float _1315 = fma(_1017, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1143);
    float _1317 = -_569;
    float _1319 = _1317 + 0.5;
    float _1321 = fma(_1305, _1305, _1289);
    float _1323 = rsqrt(_1299);
    float _1325 = _1311;
    if (_655)
    {
        float _1327 = -_187;
        float _1329 = _1163 ? _1327 : _187;
        _1325 = _1329;
    }
    float _1331 = _1325;
    float _1333 = _187 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1335 = _1223 * _1165;
    float _1337 = _1223 * _1167;
    float _1339 = _1223 * _1185;
    float _1341 = -_1221;
    float _1343 = _1341 + 0.5;
    float _1345 = _601 + 0.5;
    float _1347 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _1349 = _1319 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1351 = fma(_1333, _1313, _1335);
    float _1353 = _1321 + _1291;
    float _1355 = fma(_1333, _1307, _1337);
    float _1357 = fma(_1333, _1315, _1339);
    float _1359 = _1343 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _1361 = _1345 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1363 = _1349 * _1205;
    float _1365 = _1223 * _1323;
    float _1367 = _1331 + 0.5;
    float _1369 = _1359 * _1301;
    float _1371 = _1361 * _1189;
    float _1373 = sqrt(_1353);
    float _1375 = -_1209;
    float _1377 = _1365 * _1375;
    float _1379 = -_1213;
    float _1381 = _1365 * _1379;
    float _1383 = _1367 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _1385 = -_1203;
    float _1387 = _1365 * _1385;
    float _1389 = fma(_1323, _1167, _1377);
    float _1391 = fma(_1323, _1185, _1381);
    float _1393 = _1383 * _1347;
    float _1395 = fma(_1323, _1165, _1387);
    float _1397 = _1203 + _1351;
    float _1399 = _1209 + _1355;
    float _1401 = _1213 + _1357;
    out.m_80.x = _1371;
    out.m_80.y = _1363;
    out.m_82.x = _1393;
    out.m_82.y = _1369;
    bool _1403 = _1373 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1405 = isnan(_1373);
    bool _1407 = _1403 || _1405;
    bool _1409 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1411 = _1407 || _1409;
    out.m_84.x = _1313;
    out.m_84.y = _1307;
    out.m_84.z = _1315;
    out.m_86.x = _1395;
    out.m_86.y = _1389;
    out.m_86.z = _1391;
    out.m_88.x = _1397;
    out.m_88.y = _1399;
    out.m_88.z = _1401;
    float _1413 = _1387;
    if (!_1411)
    {
        _1413 = 1.0;
    }
    float _1415 = _1413;
    bool _1417 = !_1411;
    float _1419 = _1415;
    if (!_1417)
    {
        bool _1421 = _1373 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1423 = isnan(_1373);
        bool _1425 = _1421 || _1423;
        bool _1427 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1429 = _1425 || _1427;
        if (!_1429)
        {
            float _1431 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1433 = _1373 + _1431;
            float _1435 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1437 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1435;
            float _1439 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1441 = _1439 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1443 = 1.0 / _1437;
            float _1445 = _1433 * _1443;
            float _1447 = fma(_1445, _1441, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1419 = _1447;
            _1449 = true;
        }
        else
        {
            bool _1451 = _1373 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1453 = isnan(_1373);
            bool _1455 = _1451 || _1453;
            bool _1457 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1459 = _1455 || _1457;
            if (!_1459)
            {
                float _1461 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1463 = _1373 + _1461;
                float _1465 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1467 = _1465 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1469 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1471 = _1469 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1473 = 1.0 / _1467;
                float _1475 = _1463 * _1473;
                float _1477 = fma(_1475, _1471, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1419 = _1477;
                _1449 = true;
            }
            else
            {
                _1419 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1449 = false;
    float _1479 = _1419;
    float _1481 = fma(_983, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1483 = fma(_1091, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1485 = floor(_1481);
    float _1487 = floor(_1483);
    float _1489 = -_1485;
    float _1491 = _1481 + _1489;
    float _1493 = -_1487;
    float _1495 = _1483 + _1493;
    float2 _5278 = float2(_1491, _1495);
    float _1497 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5278, float2(0.0), isnan(_5278)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5278, float2(0.0), isnan(_5278)), level(0.0)).x;
    float _1499 = _1195 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1501 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1503 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1505 = _1295 + _1503;
    float _1507 = fma(_983, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1499);
    float _1509 = _1195 + _1501;
    float _1511 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1513 = _1287 + _1511;
    float _1515 = fma(_1505, _1479, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1517 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1507);
    float _1519 = _1195 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1521 = _1509 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1523 = _1517 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1525 = fma(_983, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1519);
    float _1527 = _1509 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1529 = fma(_983, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1521);
    float _1531 = 1.0 / _1523;
    float _1533 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1525);
    float _1535 = fma(_983, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1527);
    float _1537 = fma(_1091, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1529);
    float _1539 = fma(_1513, _1479, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1541 = _1533 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1543 = fma(_1091, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1535);
    float _1545 = _1537 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1547 = _1541 + _1523;
    float _1549 = _1543 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1551 = trunc(_1545);
    int _1553 = int(_1551);
    float _1555 = _1547 * _1531;
    float _1557 = _1555 * 0.5;
    float _1559 = trunc(_1549);
    int _1561 = int(_1559);
    float _1563 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1565 = fma(_1557, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1563);
    float _1567 = 1.0 / _1565;
    int _1569 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1571 = _1553 + _1569;
    int _1573 = _1571 + 1;
    int _1575 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1577 = _1561 + _1575;
    int _1579 = _1577 + 1;
    int _1581 = _1573 | _1579;
    float _1583 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1585 = _1567 * _1583;
    bool _1587 = _1585 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1589 = _1585 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1591 = !_1587;
    int _1593 = _1591 ? 0 : 1;
    int _1595 = 2;
    int _1597 = _1573;
    float _1599 = _1505;
    float _1601 = _1479;
    int _1603 = as_type<int>(_1515);
    int _1605 = _1579;
    if (!_1587)
    {
        _1595 = 1;
    }
    int _1607 = _1595;
    int _1609 = _1607;
    if (!_1589)
    {
        _1609 = _1593;
    }
    int _1611 = _1609;
    bool _1613 = _1573 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1615 = _1611 << 6;
    bool _1617 = _1581 < 0;
    bool _1619 = _1617 || _1613;
    int _1621 = _1615 + 48;
    uint _1624 = uint(int(uint(_1621) >> uint(2)));
    uint _1626 = uint(int(uint(int(_1624)) >> uint(2)));
    int _1628 = int(_1624) & 3;
    float _1630 = (*spvDescriptorSet0.vp_c15)._m0[int(_1626)][_1628];
    int _1632 = int(_1624) + 1;
    uint _1634 = uint(int(uint(_1632) >> uint(2)));
    int _1636 = _1632 & 3;
    float _1638 = (*spvDescriptorSet0.vp_c15)._m0[int(_1634)][_1636];
    bool _1640 = _1579 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1642 = _1640 || _1619;
    bool _1644 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1646 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1648 = _1644 || _1646;
    bool _1650 = isnan(0.5);
    bool _1652 = _1648 || _1650;
    float _1654 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1656 = _1297 + _1654;
    int _1658 = _1615 + 56;
    uint _1660 = uint(int(uint(_1658) >> uint(2)));
    uint _1662 = uint(int(uint(int(_1660)) >> uint(2)));
    int _1664 = int(_1660) & 3;
    float _1666 = (*spvDescriptorSet0.vp_c15)._m0[int(_1662)][_1664];
    int _1668 = int(_1660) + 1;
    uint _1670 = uint(int(uint(_1668) >> uint(2)));
    int _1672 = _1668 & 3;
    float _1674 = (*spvDescriptorSet0.vp_c15)._m0[int(_1670)][_1672];
    float _1676 = fma(_1656, _1479, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    int _1678 = _1615 + 64;
    uint _1680 = uint(int(uint(_1678) >> uint(2)));
    uint _1682 = uint(int(uint(int(_1680)) >> uint(2)));
    int _1684 = int(_1680) & 3;
    float _1686 = (*spvDescriptorSet0.vp_c15)._m0[int(_1682)][_1684];
    int _1688 = int(_1680) + 1;
    uint _1690 = uint(int(uint(_1688) >> uint(2)));
    int _1692 = _1688 & 3;
    float _1694 = (*spvDescriptorSet0.vp_c15)._m0[int(_1690)][_1692];
    float _1696 = _1656;
    float _1698 = as_type<float>(_1615);
    float _1700 = as_type<float>(_1611);
    if (!_1642)
    {
        int _1702 = _1579 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1704 = _1702 + _1573;
        _1597 = _1704;
    }
    int _1706 = _1597;
    if (_1652)
    {
        _1599 = _1515;
    }
    float _1708 = _1599;
    float _1710 = _1708;
    if (_1652)
    {
        _1601 = _1539;
    }
    float _1712 = _1601;
    float _1714 = _1712;
    if (_1652)
    {
        _1696 = _1676;
    }
    float _1716 = _1696;
    int _1718 = _1615 + 72;
    uint _1720 = uint(int(uint(_1718) >> uint(2)));
    uint _1722 = uint(int(uint(int(_1720)) >> uint(2)));
    int _1724 = int(_1720) & 3;
    float _1726 = (*spvDescriptorSet0.vp_c15)._m0[int(_1722)][_1724];
    int _1728 = int(_1720) + 1;
    uint _1730 = uint(int(uint(_1728) >> uint(2)));
    int _1732 = _1728 & 3;
    float _1734 = (*spvDescriptorSet0.vp_c15)._m0[int(_1730)][_1732];
    int _1736 = _1615 + 96;
    uint _1738 = uint(int(uint(_1736) >> uint(2)));
    uint _1740 = uint(int(uint(int(_1738)) >> uint(2)));
    int _1742 = int(_1738) & 3;
    float _1744 = (*spvDescriptorSet0.vp_c15)._m0[int(_1740)][_1742];
    int _1746 = int(_1738) + 1;
    uint _1748 = uint(int(uint(_1746) >> uint(2)));
    int _1750 = _1746 & 3;
    float _1752 = (*spvDescriptorSet0.vp_c15)._m0[int(_1748)][_1750];
    int _1754 = _1615 + 104;
    uint _1756 = uint(int(uint(_1754) >> uint(2)));
    uint _1758 = uint(int(uint(int(_1756)) >> uint(2)));
    int _1760 = int(_1756) & 3;
    float _1762 = (*spvDescriptorSet0.vp_c15)._m0[int(_1758)][_1760];
    int _1764 = int(_1756) + 1;
    uint _1766 = uint(int(uint(_1764) >> uint(2)));
    int _1768 = _1764 & 3;
    float _1770 = (*spvDescriptorSet0.vp_c15)._m0[int(_1766)][_1768];
    float _1772 = _1716;
    int _1774 = as_type<int>(_1752);
    if (!_1652)
    {
        float _1776 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1778 = _1195 + _1776;
        float _1780 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1782 = _983 + _1780;
        float _1784 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1786 = _1778 * _1778;
        float _1788 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1790 = _1091 + _1788;
        float _1792 = fma(_1782, _1782, _1786);
        float _1794 = -_1195;
        float _1796 = _1794 + _1539;
        float _1798 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1800 = fma(_1790, _1790, _1792);
        float _1802 = sqrt(_1800);
        float _1804 = _1784 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1806 = precise::min(_1802, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1808 = _1806 * _1798;
        float _1810 = _1804 * _1808;
        float _1812 = -_983;
        float _1814 = _1812 + _1515;
        float _1816 = -_1091;
        float _1818 = _1816 + _1676;
        float _1820 = fma(_1796, _1810, _1195);
        float _1822 = fma(_1814, _1810, _983);
        float _1824 = fma(_1818, _1810, _1091);
        _1714 = _1820;
        _1603 = as_type<int>(_1818);
        _1710 = _1822;
        _1772 = _1824;
    }
    float _1826 = _1714;
    int _1828 = _1603;
    float _1830 = _1710;
    float _1832 = _1772;
    float _1834 = _1509 * _1752;
    int _1836 = _1828;
    if (!_1642)
    {
        int _1838 = _1706 << 2;
        _1836 = _1838;
    }
    int _1840 = _1836;
    float _1842 = _1826 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    int _1844 = _1840;
    if (!_1642)
    {
        uint _1846 = uint(int(uint(_1706) >> uint(2)));
        _1774 = int(_1846);
    }
    int _1848 = _1774;
    float _1850 = fma(_983, _1744, _1834);
    if (!_1642)
    {
        int _1852 = 12 & _1840;
        _1844 = _1852;
    }
    int _1854 = _1844;
    float _1856 = fma(_1830, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1842);
    float _1858 = _1509 * _1694;
    float _1860 = fma(_1091, _1762, _1850);
    if (!_1642)
    {
        int _1862 = _1848 << 4;
        int _1864 = _1862 + _1854;
        _1605 = _1864;
    }
    int _1866 = _1605;
    float _1868 = fma(_1832, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1856);
    int _1870 = _1615 + 80;
    uint _1872 = uint(int(uint(_1870) >> uint(2)));
    uint _1874 = uint(int(uint(int(_1872)) >> uint(2)));
    int _1876 = int(_1872) & 3;
    float _1878 = (*spvDescriptorSet0.vp_c15)._m0[int(_1874)][_1876];
    int _1880 = int(_1872) + 1;
    uint _1882 = uint(int(uint(_1880) >> uint(2)));
    int _1884 = _1880 & 3;
    float _1886 = (*spvDescriptorSet0.vp_c15)._m0[int(_1882)][_1884];
    float _1888 = _1860 + _1770;
    float _1890 = _1509 * _1638;
    float _1892 = _1868 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1894 = fma(_983, _1686, _1858);
    float _1896 = 1.0 / _1888;
    float _1898 = fma(_983, _1630, _1890);
    float _1900 = _1826 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1902 = _1860;
    if (!_1642)
    {
        int _1904 = _1866 + 400;
        uint _1906 = uint(int(uint(_1904) >> uint(2)));
        uint _1908 = uint(int(uint(int(_1906)) >> uint(2)));
        int _1910 = int(_1906) & 3;
        float _1912 = (*spvDescriptorSet0.vp_c15)._m0[int(_1908)][_1910];
        _1902 = _1912;
    }
    float _1914 = _1902;
    float _1916 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1918 = fma(_1091, _1666, _1898);
    float _1920 = _1892 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1922 = fma(_1830, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1900);
    float _1924 = _1826 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1926 = _1918 + _1674;
    float _1928 = -_1920;
    float _1930 = fma(_1928, _1916, 1.0);
    int _1932 = _1615 + 88;
    uint _1934 = uint(int(uint(_1932) >> uint(2)));
    uint _1936 = uint(int(uint(int(_1934)) >> uint(2)));
    int _1938 = int(_1934) & 3;
    float _1940 = (*spvDescriptorSet0.vp_c15)._m0[int(_1936)][_1938];
    int _1942 = int(_1934) + 1;
    uint _1944 = uint(int(uint(_1942) >> uint(2)));
    int _1946 = _1942 & 3;
    float _1948 = (*spvDescriptorSet0.vp_c15)._m0[int(_1944)][_1946];
    float _1950 = fma(_1091, _1726, _1894);
    float _1952 = fma(_1832, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1922);
    float _1954 = _1826 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1956 = fma(_1830, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1924);
    float _1958 = _1926 * _1896;
    float _1960 = _1950 + _1734;
    float _1962 = _1952 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1964 = fma(_1830, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1954);
    float _1966 = fma(_1832, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1956);
    bool _1968 = _1958 >= 0.0;
    float _1970 = _1960 * _1896;
    float _1972 = _1962 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1974 = _1966 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    bool _1976 = _1958 <= 1.0;
    bool _1978 = _1976 && _1968;
    float _1980 = fma(_1832, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1964);
    float _1982 = log2(_1930);
    float _1984 = fma(_1974, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1972);
    bool _1986 = _1970 >= 0.0;
    bool _1988 = _1986 && _1978;
    float _1990 = _1980 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1992 = _1962 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1994 = fma(_1892, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1984);
    bool _1996 = _1970 <= 1.0;
    bool _1998 = _1996 && _1988;
    float _2000 = _1674;
    float _2002 = _1960;
    if (!_1642)
    {
        float _2004 = floor(_1549);
        _2000 = _2004;
    }
    float _2006 = _2000;
    float _2008 = fma(_1990, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1994);
    float _2010 = fma(_1974, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1992);
    float _2012 = _1509 * _1886;
    float _2014 = _1676;
    float _2016 = _2012;
    if (!_1642)
    {
        float _2018 = floor(_1545);
        _2014 = _2018;
    }
    float _2020 = _2014;
    float _2022 = _1962 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2024 = _1982 * 0.693147182464599609375;
    float _2026 = fma(_983, _1878, _2012);
    if (_1998)
    {
        float _2028 = float(_1611);
        _2016 = _2028;
    }
    float _2030 = _2016;
    float _2032 = fma(_1974, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2022);
    if (!_1642)
    {
        float _2034 = -_2006;
        float _2036 = _1549 + _2034;
        _2002 = _2036;
    }
    float _2038 = _2002;
    float _2040 = 1.0 / _2008;
    float _2042 = fma(_1091, _1940, _2026);
    float _2044 = _1914;
    if (!_1642)
    {
        float _2046 = rint(_1914);
        float _2048 = precise::max(_2046, 0.0);
        uint _2050 = uint(_2048);
        uint _2052 = clamp(_2050, 0u, 65535u);
        _2044 = as_type<float>(_2052);
    }
    float _2054 = _2044;
    float _2056 = fma(_1892, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2032);
    float _2058 = fma(_1892, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2010);
    float _2060 = _2042 + _1948;
    if (!_1642)
    {
        float _2062 = -_2020;
        float _2064 = _1545 + _2062;
        _1698 = _2064;
    }
    float _2066 = _1698;
    float _2068 = fma(_1990, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2056);
    float _2070 = fma(_1990, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2058);
    float _2072 = _2060 * _1896;
    float _2074 = _2030;
    float _2076 = _2070;
    if (_1998)
    {
        float _2078 = rint(_2030);
        float _2080 = precise::max(_2078, 0.0);
        uint _2082 = uint(_2080);
        uint _2084 = clamp(_2082, 0u, 65535u);
        _2074 = as_type<float>(_2084);
    }
    float _2086 = _2074;
    float _2088 = _2068 * _2040;
    float _2090 = _2070 * _2040;
    float _2092 = _2024 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2094 = fma(_2088, 0.5, 0.5);
    float _2096 = fma(_2090, -0.5, 0.5);
    float _2098 = _2066;
    float _2100 = _2054;
    if (!_1642)
    {
        float3 _6305 = float3(_2066, _2038, float(as_type<int>(_2054)));
        float3 _6309 = select(_6305, float3(0.0), isnan(_6305));
        float _2102 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6309.xy, uint(rint(_6309.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6309.xy, uint(rint(_6309.z)), level(0.0)).x;
        _2098 = _2102;
    }
    float _2104 = _2098;
    float _2106 = _1970;
    float _2108 = _2086;
    if (_1998)
    {
        float3 _6325 = float3(_1958, _1970, float(as_type<int>(_2086)));
        float3 _6327 = select(_6325, float3(0.0), isnan(_6325));
        float _2110 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6327.xy, uint(rint(_6327.z)), _2072, level(0.0));
        _2106 = _2110;
    }
    float _2112 = _2106;
    float3 _6337 = float3(_2094, _2096, _2092);
    float _2114 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6337, float3(0.0), isnan(_6337)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6337, float3(0.0), isnan(_6337)), level(0.0)).x;
    float3 _6346 = float3(_2094, _2096, _2092);
    float4 _2117 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6346, float3(0.0), isnan(_6346)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6346, float3(0.0), isnan(_6346)), level(0.0)).xyzw;
    float _2119 = _2117.x;
    float _2121 = _2117.y;
    float _2123 = _2117.z;
    float _2125 = _2117.w;
    bool _2127 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2129 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2131 = _2127 || _2129;
    bool _2133 = isnan(0.5);
    bool _2135 = _2131 || _2133;
    if (_2135)
    {
        _1700 = 1.0;
    }
    float _2137 = _1700;
    float _2139 = _2137;
    if (!_2135)
    {
        float _2141 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2143 = _2141 * 0.15915493667125701904296875;
        float _2145 = _2143 * 6.283185482025146484375;
        float _2147 = cos(_2145);
        float _2149 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2151 = _2149 * 0.15915493667125701904296875;
        float _2153 = _2143 * 6.283185482025146484375;
        float _2155 = sin(_2153);
        float _2157 = 1.0 / _2147;
        float _2159 = _2151 * 6.283185482025146484375;
        float _2161 = cos(_2159);
        float _2163 = _2155 * _2157;
        float _2165 = _2151 * 6.283185482025146484375;
        float _2167 = sin(_2165);
        float _2169 = _2161 * _2163;
        float _2171 = 1.0 / _2169;
        float _2173 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2175 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2173;
        float _2177 = 1.0 / _2175;
        float _2179 = _2167 * _2171;
        float _2181 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2183 = fma(_1585, _2179, _2181);
        float _2185 = _2183 * _2177;
        float _2187 = precise::clamp(_2185, 0.0, 1.0);
        _2108 = _2177;
        _2100 = _2151;
        _2139 = _2187;
    }
    float _2189 = _2108;
    float _2191 = _2100;
    float _2193 = _2139;
    float _2195 = _2191;
    float _2197 = _2189;
    if (_1642)
    {
        _2195 = 1.0;
    }
    float _2199 = _2195;
    float _2201 = _2199;
    if (!_1642)
    {
        int _2203 = _1706 << 4;
        int _2205 = _2203 + 2048;
        uint _2207 = uint(int(uint(_2205) >> uint(2)));
        uint _2209 = uint(int(uint(int(_2207)) >> uint(2)));
        int _2211 = int(_2207) & 3;
        float _2213 = (*spvDescriptorSet0.vp_c15)._m0[int(_2209)][_2211];
        int _2215 = int(_2207) + 1;
        uint _2217 = uint(int(uint(_2215) >> uint(2)));
        int _2219 = _2215 & 3;
        float _2221 = (*spvDescriptorSet0.vp_c15)._m0[int(_2217)][_2219];
        int _2223 = _2205 + 8;
        uint _2225 = uint(int(uint(_2223) >> uint(2)));
        uint _2227 = uint(int(uint(int(_2225)) >> uint(2)));
        int _2229 = int(_2225) & 3;
        float _2231 = (*spvDescriptorSet0.vp_c15)._m0[int(_2227)][_2229];
        int _2233 = int(_2225) + 1;
        uint _2235 = uint(int(uint(_2233) >> uint(2)));
        int _2237 = _2233 & 3;
        float _2239 = (*spvDescriptorSet0.vp_c15)._m0[int(_2235)][_2237];
        float _2241 = _1509 * _2221;
        float _2243 = fma(_983, _2213, _2241);
        float _2245 = fma(_1091, _2231, _2243);
        float _2247 = _2245 + _2239;
        float _2249 = precise::clamp(_2247, 0.0, 1.0);
        float _2251 = -_2249;
        float _2253 = _2251 + _2104;
        float _2255 = fma(_2253, 500.0, 1.5);
        float _2257 = exp2(_2255);
        float _2259 = 0.0 + _2257;
        float _2261 = precise::clamp(_2259, 0.0, 1.0);
        _2197 = _2231;
        _2201 = _2261;
    }
    float _2263 = _2197;
    float _2265 = _2201;
    float _2267 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2269 = _1826 + _2267;
    float _2271 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2273 = _1830 + _2271;
    float _2275 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2277 = _1832 + _2275;
    float _2279 = _2269 * _2269;
    float _2281 = fma(_2273, _2273, _2279);
    float _2283 = fma(_2277, _2277, _2281);
    float _2285 = rsqrt(_2283);
    float _2287 = _2285 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2289 = _2273 * _2287;
    float _2291 = _2277 * _2287;
    float _2293 = _2289 * _2289;
    float _2295 = _2291 * _2291;
    float _2297 = _2293 + _2295;
    float _2299 = sqrt(_2297);
    bool _2301 = _2299 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2303 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2305 = _2299 + _2303;
    float _2307 = _2277;
    float _2309 = _2285;
    float _2311 = _2305;
    float _2313 = _2263;
    float _2315 = _2287;
    if (_2301)
    {
        float _2317 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2307 = _2317;
    }
    float _2319 = _2307;
    if (_2301)
    {
        float _2321 = rsqrt(_2297);
        _2309 = _2321;
    }
    float _2323 = _2309;
    float _2325 = _2323;
    if (_2301)
    {
        float _2327 = _2305 * _2319;
        _2311 = _2327;
    }
    float _2329 = _2311;
    if (_2301)
    {
        float _2331 = _2329 * 0.15915493667125701904296875;
        _2313 = _2331;
    }
    float _2333 = _2313;
    float _2335 = _2319;
    float _2337 = _2333;
    if (_2301)
    {
        float _2339 = _2333 * 6.283185482025146484375;
        float _2341 = sin(_2339);
        _2335 = _2341;
    }
    float _2343 = _2335;
    float _2345 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2347 = precise::max(0.0, _2345);
    float _2349 = _2279;
    float _2351 = _2347;
    if (_2301)
    {
        float _2353 = _2333 * 6.283185482025146484375;
        float _2355 = cos(_2353);
        _2349 = _2355;
    }
    float _2357 = _2349;
    float _2359 = -_2287;
    float _2361 = -_2347;
    float _2363 = fma(_2269, _2359, _2361);
    if (_2301)
    {
        float _2365 = _2363 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2351 = _2365;
    }
    float _2367 = _2351;
    float _2369 = _2367;
    if (!_2301)
    {
        _2337 = _2293;
    }
    float _2371 = _2337;
    float _2373 = _2343;
    float _2375 = _2371;
    if (_2301)
    {
        float _2377 = fma(_2343, _2367, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2373 = _2377;
    }
    float _2379 = _2373;
    float _2381 = _2379;
    float _2383 = _2357;
    if (_2301)
    {
        float _2385 = _2357 + (-1.0);
        _2369 = _2385;
    }
    float _2387 = _2369;
    float _2389 = 0.0;
    float _2391 = _2387;
    if (_2301)
    {
        float _2393 = _2323 * _2379;
        _2389 = _2393;
    }
    float _2395 = _2389;
    if (!_2301)
    {
        _2325 = _2289;
    }
    float _2397 = _2325;
    float _2399 = _2397;
    if (_2301)
    {
        float _2401 = _2387 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2315 = _2401;
    }
    float _2403 = _2315;
    if (_2301)
    {
        float _2405 = _2289 * _2395;
        _2399 = _2405;
    }
    float _2407 = _2399;
    if (!_2301)
    {
        _2381 = _2363;
    }
    float _2409 = _2381;
    float _2411 = _2409;
    if (!_2301)
    {
        _2391 = _2291;
    }
    float _2413 = _2391;
    float _2415 = _2413;
    if (_2301)
    {
        float _2417 = fma(_2363, _2357, _2403);
        _2411 = _2417;
    }
    float _2419 = _2411;
    if (_2301)
    {
        float _2421 = _2291 * _2395;
        _2415 = _2421;
    }
    float _2423 = _2415;
    if (_2301)
    {
        float _2425 = _2407 * _2407;
        _2375 = _2425;
    }
    float _2427 = _2375;
    if (!_2301)
    {
        _2383 = _2295;
    }
    float _2429 = _2383;
    float _2431 = sqrt(_2283);
    float _2433 = _2429;
    if (_2301)
    {
        float _2435 = _2423 * _2423;
        _2433 = _2435;
    }
    float _2437 = _2433;
    float _2439 = fma(_2419, _2419, _2427);
    float _2441 = _2439 + _2437;
    float _2443 = rsqrt(_2441);
    float _2445 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2447 = fma(_2431, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2445);
    float _2449 = precise::clamp(_2447, 0.0, 1.0);
    float _2451 = -_2449;
    float _2453 = _2451 + 1.0;
    float _2455 = _2443 * _2407;
    float _2457 = _2443 * _2419;
    float _2459 = _2443 * _2423;
    float _2461 = abs(_2453);
    float _2463 = log2(_2461);
    float _2465 = _2455 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2467 = -_2465;
    float _2469 = fma(_2457, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2467);
    float _2471 = -_2459;
    float _2473 = fma(_2471, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2469);
    float _2475 = fma(_2473, -0.5, 0.5);
    float _2477 = fma(_2473, 0.5, 0.5);
    float _2479 = _2463 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2481 = fma(_2477, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2483 = sqrt(_2475);
    float _2485 = fma(_2477, _2481, -0.212114393711090087890625);
    float _2487 = _2457 + 1.0;
    float _2489 = fma(_2477, _2485, 1.570728778839111328125);
    float _2491 = exp2(_2479);
    float _2493 = _2483 * 0.636619746685028076171875;
    float _2495 = -_2489;
    float _2497 = fma(_2493, _2495, 1.0);
    float _2499 = -_2457;
    float _2501 = fma(_2491, _2487, _2499);
    float _2503 = fma(_2501, 0.5, 0.5);
    float2 _6919 = float2(_2497, _2503);
    float3 _2507 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6919, float2(0.0), isnan(_6919)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6919, float2(0.0), isnan(_6919)), level(0.0)).xyz;
    float _2509 = _2507.x;
    float _2511 = _2507.y;
    float _2513 = _2507.z;
    float _2515 = abs(_1585);
    float _2517 = log2(_2515);
    float _2519 = _1962 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2521 = _2463 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2523 = _2068 + _2008;
    float _2525 = fma(_1974, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2519);
    float _2527 = -_1497;
    float _2529 = _2527 + 1.0;
    float _2531 = _2523 * 0.5;
    float _2533 = exp2(_2521);
    bool _2535 = _1585 <= 8000.0;
    bool _2537 = isnan(_1585);
    bool _2539 = _2535 || _2537;
    bool _2541 = isnan(8000.0);
    bool _2543 = _2539 || _2541;
    float _2545 = float(_2543);
    float _2547 = _2517 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2549 = fma(_1892, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2525);
    float _2551 = _2008 * 0.5;
    float _2553 = fma(_1990, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2549);
    float _2555 = exp2(_2547);
    float _2557 = fma(_2070, -0.5, _2551);
    float _2559 = _2553 + _2008;
    out.gl_Position.x = _2068;
    out.gl_Position.y = _2070;
    out.gl_Position.z = _2553;
    out.gl_Position.w = _2008;
    float _2561 = _2559 * 0.5;
    out.m_90.x = _2531;
    out.m_90.y = _2557;
    out.m_90.z = _2561;
    out.m_90.w = _2008;
    float _2563 = fma(_2555, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2565 = precise::clamp(_2563, 0.0, 1.0);
    float _2567 = -_2533;
    float _2569 = _2567 + 1.0;
    float _2571 = _2553;
    if (!_1998)
    {
        _2076 = 1.0;
    }
    float _2573 = _2076;
    float _2575 = fma(_2565, -2.0, 3.0);
    float _2577 = _2565 * _2565;
    float _2579 = _2573;
    if (_1998)
    {
        bool _2581 = _2112 >= _2072;
        bool _2583 = isnan(_2112);
        bool _2585 = _2581 || _2583;
        bool _2587 = isnan(_2072);
        bool _2589 = _2585 || _2587;
        float _2591 = float(_2589);
        _2579 = _2591;
    }
    float _2593 = _2579;
    float _2595 = _2569 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _2597 = _2431 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2599 = isnan(_2431);
    bool _2601 = _2597 || _2599;
    bool _2603 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2605 = _2601 || _2603;
    float _2607 = _2577 * _2575;
    float _2609 = _2595 * _2114;
    float _2611 = _2593 * _2265;
    float _2613 = -_2607;
    float _2615 = _2613 + 1.0;
    float _2617 = -_2595;
    float _2619 = _2617 + 1.0;
    float _2621 = _2125 * _2609;
    float _2623 = _2193 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2625 = fma(_2615, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2607);
    float _2627 = _2125 * _2619;
    float _2629 = _2545 * _2625;
    float _2631 = _2619;
    float _2633 = _2629;
    if (!_2605)
    {
        _2571 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2635 = _2571;
    float _2637 = _2635;
    float _2639 = _2635;
    if (!_2605)
    {
        _2631 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2641 = _2631;
    float _2643 = _2629 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2645 = _2643;
    float _2647 = _2641;
    float _2649 = _2641;
    if (!_2605)
    {
        _2633 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2651 = _2633;
    float _2653 = _2529 * _2643;
    float _2655 = precise::clamp(_2653, 0.0, 1.0);
    float _2657 = _2651;
    float _2659 = _2651;
    if (!_2605)
    {
        _2645 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2661 = _2645;
    float _2663 = -_2655;
    float _2665 = fma(_2663, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2667 = _2661;
    float _2669 = _2661;
    if (!_2605)
    {
        _773 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2671 = _773;
    float _2673 = -_2611;
    float _2675 = fma(_2673, _2665, 1.0);
    float _2677 = precise::clamp(_2675, 0.0, 1.0);
    float _2679 = _2677 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2681 = _2677;
    float _2683 = _2671;
    float _2685 = _2671;
    if (!_2605)
    {
        _2681 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2687 = _2681;
    out.m_92.x = _2679;
    float _2689 = _2513 * _2609;
    float _2691 = fma(_2509, _2621, _2119);
    float _2693 = fma(_2511, _2621, _2121);
    float _2695 = fma(_2125, _2689, _2123);
    out.m_94.x = _2691;
    out.m_94.y = _2693;
    out.m_94.z = _2695;
    out.m_94.w = _2627;
    bool _2697 = !_2605;
    float _2699 = _2687;
    float _2701 = _2687;
    if (!_2697)
    {
        bool _2703 = _2431 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2705 = isnan(_2431);
        bool _2707 = _2703 || _2705;
        bool _2709 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2711 = _2707 || _2709;
        if (!_2711)
        {
            float _2713 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2715 = _2431 + _2713;
            float _2717 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2719 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2717;
            float _2721 = 1.0 / _2719;
            float _2723 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2725 = _2723 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2727 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2729 = _2727 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2731 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2733 = _2731 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2735 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2737 = _2735 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2739 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2741 = _2739 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2743 = _2715 * _2721;
            float _2745 = precise::clamp(_2743, 0.0, 1.0);
            float _2747 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2749 = _2747 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2751 = fma(_2745, _2725, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2753 = fma(_2745, _2749, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2755 = fma(_2745, _2729, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2757 = fma(_2745, _2733, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2759 = fma(_2745, _2737, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2761 = fma(_2745, _2741, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2669 = _2753;
            _2649 = _2759;
            _2659 = _2751;
            _2701 = _2757;
            _2639 = _2755;
            _2685 = _2761;
            _2763 = true;
        }
        else
        {
            bool _2765 = _2431 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2767 = isnan(_2431);
            bool _2769 = _2765 || _2767;
            bool _2771 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2773 = _2769 || _2771;
            if (!_2773)
            {
                _2657 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2775 = _2657;
            _2659 = _2775;
            if (!_2773)
            {
                _2667 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2777 = _2667;
            _2669 = _2777;
            if (!_2773)
            {
                _2637 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2779 = _2637;
            _2639 = _2779;
            if (!_2773)
            {
                _2699 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2781 = _2699;
            _2701 = _2781;
            if (!_2773)
            {
                _2647 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2783 = _2647;
            _2649 = _2783;
            if (!_2773)
            {
                _2683 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2785 = _2683;
            bool _2787 = !_2773;
            _2685 = _2785;
            if (!_2787)
            {
                bool _2789 = _2431 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2791 = isnan(_2431);
                bool _2793 = _2789 || _2791;
                bool _2795 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2797 = _2793 || _2795;
                if (!_2797)
                {
                    float _2799 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2801 = _2431 + _2799;
                    float _2803 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2805 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2803;
                    float _2807 = 1.0 / _2805;
                    float _2809 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2811 = _2809 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2813 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2815 = _2813 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2817 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2819 = _2817 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2821 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2823 = _2821 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2825 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2827 = _2825 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2829 = _2801 * _2807;
                    float _2831 = precise::clamp(_2829, 0.0, 1.0);
                    float _2833 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2835 = _2833 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2837 = fma(_2831, _2811, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2839 = fma(_2831, _2835, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2841 = fma(_2831, _2815, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2843 = fma(_2831, _2819, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2845 = fma(_2831, _2823, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2847 = fma(_2831, _2827, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2669 = _2839;
                    _2649 = _2845;
                    _2659 = _2837;
                    _2701 = _2843;
                    _2639 = _2841;
                    _2685 = _2847;
                    _2763 = true;
                }
                else
                {
                    _2669 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2649 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2659 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2701 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2639 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2685 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2763 = false;
    float _2849 = _2669;
    float _2851 = _2649;
    float _2853 = _2659;
    float _2855 = _2701;
    float _2857 = _2639;
    float _2859 = _2685;
    float _2861 = fma(_1399, -0.5, 0.5);
    float _2863 = precise::clamp(_2861, 0.0, 1.0);
    float _2865 = -_2849;
    float _2867 = _2865 + _2851;
    float _2869 = _2623 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2871 = -_2853;
    float _2873 = _2871 + _2855;
    float _2875 = fma(_2863, _2867, _2849);
    out.m_96.x = 0.0;
    float _2877 = -_2857;
    float _2879 = _2877 + _2859;
    float _2881 = fma(_2863, _2873, _2853);
    float _2883 = _2875 * 0.586610972881317138671875;
    out.m_61.x = _2869;
    bool _2885 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2887 = fma(_2863, _2879, _2857);
    float _2889 = fma(_2881, 0.298911988735198974609375, _2883);
    bool _2891 = _2193 > 0.0;
    bool _2893 = isnan(_2193);
    bool _2895 = _2891 || _2893;
    bool _2897 = isnan(0.0);
    bool _2899 = _2895 || _2897;
    float _2901 = fma(_2887, 0.114477999508380889892578125, _2889);
    float _2903 = -_2901;
    float _2905 = _2881 + _2903;
    float _2907 = -_2901;
    float _2909 = _2875 + _2907;
    float _2911 = -_2901;
    float _2913 = _2887 + _2911;
    float _2915 = fma(_2905, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2901);
    float _2917 = fma(_2909, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2901);
    float _2919 = fma(_2913, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2901);
    bool _2921 = !_2885;
    if (!_2921)
    {
        float _2923 = -_1826;
        float _2925 = _2923 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2927 = -_1830;
        float _2929 = _2927 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2931 = -_1832;
        float _2933 = _2931 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2935 = _2925 * _2925;
        float _2937 = fma(_2929, _2929, _2935);
        float _2939 = fma(_2933, _2933, _2937);
        float _2941 = sqrt(_2939);
        float _2943 = rsqrt(_2939);
        float _2945 = -_2941;
        float _2947 = _2945 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2949 = _2947 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2951 = precise::clamp(_2949, 0.0, 1.0);
        float _2953 = _2929 * _2943;
        float _2955 = _2925 * _2943;
        float _2957 = abs(_2951);
        float _2959 = log2(_2957);
        float _2961 = _2933 * _2943;
        float _2963 = _2953 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2965 = _1399 * _2955;
        float _2967 = -_2955;
        float _2969 = -_2963;
        float _2971 = fma(_2967, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2969);
        float _2973 = fma(_1397, _2953, _2965);
        float _2975 = -_2961;
        float _2977 = fma(_2975, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2971);
        float _2979 = fma(_1401, _2961, _2973);
        float _2981 = precise::clamp(_2979, 0.0, 1.0);
        float _2983 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2985 = _2977 + _2983;
        float _2987 = _2959 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2989 = _2985 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2991 = precise::clamp(_2989, 0.0, 1.0);
        float _2993 = exp2(_2987);
        float _2995 = _2993 * _2991;
        float _2997 = _2981 * _2995;
        float _2999 = _2997 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3001 = _2997 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3003 = _2997 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_96.x = _2999;
        out.m_96.y = _3001;
        out.m_96.z = _3003;
    }
    out.m_98.x = _2915;
    out.m_98.y = _2917;
    out.m_98.z = _2919;
    if (_2899)
    {
        return out;
    }
    out.m_61.x = 0.0;
    float _3005 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3005;
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
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2763 = false;
    bool _1449 = false;
    bool _373 = false;
    bool _215 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _112 = in.m_58.w;
    float _114 = trunc(_112);
    int _117 = int(_114);
    bool _121 = _117 >= 1;
    float _123 = 0.0;
    if (!_121)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _125 = _123;
    float _127 = _125;
    if (!_121)
    {
        out.m_61.x = 0.0;
    }
    int _129 = 0;
    if (!_121)
    {
        float _131 = _125 * 5.0;
        _129 = as_type<int>(_131);
    }
    int _133 = _129;
    int _135 = _133;
    if (!_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3062 = as_type<float>(_133);
        out.gl_Position.z = _3062;
    }
    if (!_121)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _137 = in.m_63.w;
    bool _139 = _137 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _141 = isnan(_137);
    bool _143 = _139 || _141;
    bool _145 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _147 = _143 || _145;
    float _149 = -_137;
    float _151 = _149 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _153 = _151;
    if (_147)
    {
        float _155 = float(_117);
        _127 = _155;
    }
    float _157 = _127;
    bool _159 = _151 >= _157;
    bool _161 = !_147;
    bool _163 = _159 || _161;
    float _165 = _157;
    if (_163)
    {
        _165 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _167 = _165;
    if (_163)
    {
        out.m_61.x = 0.0;
    }
    if (_163)
    {
        float _169 = _167 * 5.0;
        _135 = as_type<int>(_169);
    }
    int _171 = _135;
    if (_163)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3132 = as_type<float>(_171);
        out.gl_Position.z = _3132;
    }
    if (_163)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _173 = as_type<float>(int(gl_VertexIndex));
    bool _175 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _177 = as_type<int>(_173) & 1;
    bool _179 = _177 != 0;
    int _181 = as_type<int>(_173) & 2;
    bool _183 = _181 != 0;
    bool _185 = !_179;
    float _187 = _185 ? (-0.5) : 0.5;
    bool _189 = !_183;
    float _191 = _189 ? (-0.5) : 0.5;
    bool _193 = !_175;
    float _195 = _191;
    float _213;
    if (!_193)
    {
        float _197 = in.m_68.x;
        float _199 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _201 = _197 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _203 = fma(_201, (*spvDescriptorSet0.vp_c9)._m0[12].x, _151);
        float _205 = _203 * _199;
        float _207 = floor(_205);
        float _209 = -_207;
        float _211 = _205 + _209;
        _213 = _211;
        _215 = true;
    }
    else
    {
        float _217 = float(_117);
        float _219 = 1.0 / _217;
        float _221 = _151 * _219;
        _213 = _221;
    }
    _215 = false;
    float _223 = _213;
    float _225 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _227 = _223 + _225;
    bool _229 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _231 = isnan(_223);
    bool _233 = _229 || _231;
    bool _235 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _237 = _233 || _235;
    float _239 = float(_237);
    float _241 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _243 = _223 + _241;
    float _245 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _247 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _245;
    float _249 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _251 = _249 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _253 = -_239;
    float _255 = _253 + 1.0;
    float _257 = 1.0 / _247;
    bool _259 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _261 = isnan(_223);
    bool _263 = _259 || _261;
    bool _265 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _267 = _263 || _265;
    float _269 = float(_267);
    bool _271 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _273 = 1.0 / _251;
    float _275 = _227 * _257;
    bool _277 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _279 = isnan(_223);
    bool _281 = _277 || _279;
    bool _283 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _285 = _281 || _283;
    float _287 = float(_285);
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _291 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _289;
    float _293 = in.m_70.x;
    float _295 = in.m_70.y;
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _299 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _297;
    float _301 = _287 * _255;
    float _303 = -_287;
    float _305 = _303 + 1.0;
    float _307 = fma(_291, _275, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _309 = fma(_299, _275, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _311 = _243 * _273;
    float _313 = _269 * _305;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _317 = _315 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _321 = _319 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _323 = -_269;
    float _325 = _323 + 1.0;
    float _327 = _307 * _313;
    float _329 = _309 * _313;
    float _331 = fma(_317, _311, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _333 = fma(_321, _311, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _335 = fma(_325, (*spvDescriptorSet0.vp_c9)._m0[143].y, _327);
    float _337 = fma(_325, (*spvDescriptorSet0.vp_c9)._m0[143].x, _329);
    float _339 = fma(_333, _301, _335);
    float _341 = fma(_331, _301, _337);
    float _343 = fma(_239, (*spvDescriptorSet0.vp_c9)._m0[145].y, _339);
    float _345 = fma(_239, (*spvDescriptorSet0.vp_c9)._m0[145].x, _341);
    float _347 = _343 * _295;
    float _349 = _345 * _293;
    bool _351 = !_271;
    float _353 = _333;
    float _371;
    if (!_351)
    {
        float _355 = in.m_68.x;
        float _357 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _359 = _355 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _361 = fma(_359, (*spvDescriptorSet0.vp_c9)._m0[11].y, _151);
        float _363 = _361 * _357;
        float _365 = floor(_363);
        float _367 = -_365;
        float _369 = _363 + _367;
        _371 = _369;
        _373 = true;
    }
    else
    {
        float _375 = float(_117);
        float _377 = 1.0 / _375;
        float _379 = _151 * _377;
        _371 = _379;
    }
    _373 = false;
    float _381 = _371;
    float _383 = in.m_68.z;
    float _385 = in.m_68.w;
    float _387 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _191);
    float _389 = in.m_68.x;
    int _391 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _393 = _391 != 0;
    float _395 = _349 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _397 = in.m_68.y;
    float _399 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _187);
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _403 = _401 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _405 = _395 * _399;
    float _407 = 1.0 / _403;
    float _409 = _339;
    if (!_393)
    {
        float _411 = in.m_68.z;
        _409 = _411;
    }
    float _413 = _409;
    float _415 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _417 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _419 = _383 * 2.0;
    bool _421 = _383 > 0.5;
    float _423 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _425 = _385 > 0.5;
    float _427 = _389 * 2.0;
    float _429 = -_191;
    int _431 = _421 ? as_type<int>(_429) : as_type<int>(_191);
    float _433 = floor(_419);
    float _435 = -_191;
    int _437 = _425 ? as_type<int>(_435) : as_type<int>(_191);
    float _439 = _397 * 2.0;
    float _441 = _397;
    if (!_393)
    {
        _353 = _397;
    }
    float _443 = _353;
    float _445 = _389 + _383;
    float _447 = _443;
    if (_393)
    {
        _447 = _389;
    }
    float _449 = _447;
    float _451 = floor(_427);
    float _453 = _445 + (-1.0);
    float _455 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[83].z, _415);
    float _457 = _383 + _397;
    float _459 = _383 + (-0.5);
    float _461 = fma(_453, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _463 = _449 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _465 = floor(_439);
    bool _467 = _433 > 0.0;
    float _469 = -_423;
    float _471 = fma(_463, 2.0, _469);
    bool _473 = _433 >= 0.0;
    bool _475 = isnan(_433);
    bool _477 = _473 || _475;
    bool _479 = isnan(0.0);
    bool _481 = _477 || _479;
    float _483 = _389 + _397;
    float _485 = _457 + (-1.0);
    int _487 = _481 ? 0 : 1;
    float _489 = _483 + (-1.0);
    bool _491 = _451 > 0.0;
    int _493 = ~_487;
    int _495 = _493 + 1;
    int _497 = _495 + 1;
    float _499 = fma(_489, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _501 = _451 >= 0.0;
    bool _503 = isnan(_451);
    bool _505 = _501 || _503;
    bool _507 = isnan(0.0);
    bool _509 = _505 || _507;
    int _511 = _497;
    float _513 = _451;
    if (!_467)
    {
        int _515 = ~_487;
        int _517 = _515 + 1;
        _511 = _517;
    }
    int _519 = _511;
    int _521 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _523 = _521 != 0;
    float _525 = -_187;
    int _527 = _421 ? as_type<int>(_525) : as_type<int>(_187);
    int _529 = _509 ? 0 : 1;
    int _531 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _533 = _531 != 0;
    int _535 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _537 = _535 != 0;
    int _539 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _541 = _539 != 0;
    int _543 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _545 = _543 != 0;
    bool _547 = !_523;
    float _549 = _547 ? _187 : as_type<float>(_527);
    bool _551 = _397 > 0.5;
    int _553 = ~_529;
    int _555 = _553 + 1;
    int _557 = _555 + 1;
    int _559 = _557;
    if (!_491)
    {
        int _561 = ~_529;
        int _563 = _561 + 1;
        _559 = _563;
    }
    int _565 = _559;
    bool _567 = !_545;
    float _569 = _567 ? _191 : as_type<float>(_431);
    bool _571 = _465 > 0.0;
    bool _573 = _465 >= 0.0;
    bool _575 = isnan(_465);
    bool _577 = _573 || _575;
    bool _579 = isnan(0.0);
    bool _581 = _577 || _579;
    float _583 = -_187;
    int _585 = _551 ? as_type<int>(_583) : as_type<int>(_187);
    float _587 = _413;
    if (!_393)
    {
        _513 = _413;
    }
    float _589 = _513;
    int _591 = _581 ? 0 : 1;
    float _593 = _589;
    if (_393)
    {
        _593 = _397;
    }
    float _595 = _593;
    if (_393)
    {
        _587 = _397;
    }
    float _597 = _587;
    bool _599 = !_541;
    float _601 = _599 ? _187 : as_type<float>(_585);
    int _603 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _605 = _603 != 0;
    int _607 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _609 = _607 != 0;
    int _611 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _613 = _611 != 0;
    float _615 = _347 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _617 = ~_591;
    int _619 = _617 + 1;
    int _621 = _619 + 1;
    float _623 = fma(_597, (*spvDescriptorSet0.vp_c9)._m0[83].w, _417);
    int _625 = _621;
    bool _627 = _537;
    bool _629 = _533;
    if (!_571)
    {
        int _631 = ~_591;
        int _633 = _631 + 1;
        _625 = _633;
    }
    int _635 = _625;
    float _637 = _615 * _387;
    bool _639 = !_605;
    int _641 = _639 ? 0 : 1;
    float _643 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _645 = log2(_643);
    bool _647 = !_609;
    int _649 = _647 ? 0 : 1;
    float _651 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _653 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _655 = _653 != 0;
    float _657 = _595 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _659 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _661 = _659 != 0;
    int _663 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _665 = _663 != 0;
    float _667 = fma(_657, -2.0, _651);
    int _669 = abs(_641);
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _673 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _671;
    float _675 = in.m_72.x;
    float _677 = in.m_72.y;
    float _679 = in.m_72.z;
    float _681 = _645 * _151;
    int _683 = abs(_649);
    float _685 = _673 * _407;
    float _687 = fma(_485, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _689 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _691 = 1.0 + _689;
    float _693 = exp2(_681);
    bool _695 = !_613;
    int _697 = _695 ? 0 : 1;
    bool _699 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _701 = isnan(0.0);
    bool _703 = _699 || _701;
    bool _705 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _707 = _703 || _705;
    float _709 = float(_519);
    float _711 = float(_669);
    float _713 = 1.0 / _691;
    float _715 = float(_565);
    float _717 = float(_683);
    float _719 = _711 * _709;
    int _721 = abs(_697);
    float _723 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[82].z, _455);
    float _725 = float(_635);
    float _727 = -_693;
    float _729 = _727 + 1.0;
    float _731 = float(_721);
    float _733 = _717 * _715;
    float _735 = _719 * (-2.0);
    float _737 = -_151;
    float _739 = fma(_737, (*spvDescriptorSet0.vp_c9)._m0[81].x, _471);
    float _741 = _707 ? _729 : 0.0;
    float _743 = _733 * (-2.0);
    bool _745 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _747 = isnan(1.0);
    bool _749 = _745 || _747;
    bool _751 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _753 = _749 || _751;
    float _755 = _731 * _725;
    float _757 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[82].w, _623);
    float _759 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[81].y, _667);
    float _761 = fma(_499, _735, _499);
    float _763 = fma(_735, _675, _675);
    float _765 = fma(_743, _677, _677);
    float _767 = _389 + (-0.5);
    float _769 = _675;
    float _771 = _763;
    float _773 = 1.0;
    if (_661)
    {
        float _775 = _389 * 3.1415927410125732421875;
        _769 = _775;
    }
    float _777 = _769;
    float _779 = _755 * (-2.0);
    float _781 = fma(_687, _743, _687);
    float _783 = fma(_767, (*spvDescriptorSet0.vp_c9)._m0[196].x, _763);
    if (_661)
    {
        float _785 = _777 * 0.15915493667125701904296875;
        _771 = _785;
    }
    float _787 = _771;
    if (_753)
    {
        float _789 = _741 * _713;
        _153 = _789;
    }
    float _791 = _153;
    bool _793 = _389 > 0.5;
    float _795 = _397 + (-0.5);
    float _797 = in.m_58.x;
    float _799 = in.m_58.y;
    float _801 = in.m_58.z;
    float _803 = fma(_461, _779, _461);
    float _805 = fma(_779, _679, _679);
    float _807 = fma(_795, (*spvDescriptorSet0.vp_c9)._m0[196].y, _765);
    float _809 = fma(_761, _791, _783);
    float _811 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _813 = _381 + _811;
    float _815 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _817 = fma(_781, _791, _807);
    bool _819 = _381 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _821 = isnan(_381);
    bool _823 = _819 || _821;
    bool _825 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _827 = _823 || _825;
    float _829 = float(_827);
    float _831 = fma(_459, (*spvDescriptorSet0.vp_c9)._m0[196].z, _805);
    float _833 = _809 * 0.15915493667125701904296875;
    float _835 = fma(_685, _813, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    if (_661)
    {
        float _837 = _787 * 6.283185482025146484375;
        float _839 = sin(_837);
        _441 = _839;
    }
    float _841 = _441;
    bool _843 = _381 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _845 = isnan(_381);
    bool _847 = _843 || _845;
    bool _849 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _851 = _847 || _849;
    float _853 = float(_851);
    float _855 = fma(_803, _791, _831);
    float _857 = -_829;
    float _859 = _857 + 1.0;
    float _861 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _863 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _865 = _817 * 0.15915493667125701904296875;
    float _867 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _869 = _853 * _859;
    float _871 = _855 * 0.15915493667125701904296875;
    float _873 = _799 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _875 = _799 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _877 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _879 = _799 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _881 = _861 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _883 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _885 = _863 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _887 = _877 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _889 = _833 * 6.283185482025146484375;
    float _891 = sin(_889);
    float _893 = fma(_797, (*spvDescriptorSet0.vp_c10)._m0[5].x, _875);
    float _895 = fma(_797, (*spvDescriptorSet0.vp_c10)._m0[6].x, _879);
    float _897 = -_853;
    float _899 = _897 + 1.0;
    out.m_74.x = _885;
    out.m_74.y = _881;
    out.m_74.z = _887;
    out.m_74.w = _883;
    float _901 = _867 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _903 = -_757;
    float _905 = _903 + 1.0;
    float _907 = -_723;
    float _909 = _907 + 1.0;
    float _911 = _833 * 6.283185482025146484375;
    float _913 = cos(_911);
    float _915 = _865 * 6.283185482025146484375;
    float _917 = sin(_915);
    float _919 = fma(_797, (*spvDescriptorSet0.vp_c10)._m0[4].x, _873);
    float _921 = _835 * _869;
    float _923 = _815 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _925 = fma(_801, (*spvDescriptorSet0.vp_c10)._m0[5].z, _893);
    float _927 = fma(_801, (*spvDescriptorSet0.vp_c10)._m0[4].z, _919);
    float _929 = fma(_801, (*spvDescriptorSet0.vp_c10)._m0[6].z, _895);
    float _931 = _815;
    if (_655)
    {
        float _933 = in.m_68.w;
        _931 = _933;
    }
    float _935 = _931;
    float _937 = _865 * 6.283185482025146484375;
    float _939 = cos(_937);
    float _941 = fma(_899, (*spvDescriptorSet0.vp_c9)._m0[115].x, _921);
    bool _943 = !_537;
    float _945 = _943 ? _191 : as_type<float>(_437);
    float _947 = _549 + 0.5;
    if (_661)
    {
        bool _949 = _841 > 0.5;
        _627 = _949;
    }
    bool _951 = _627;
    float _953 = fma(_829, (*spvDescriptorSet0.vp_c9)._m0[116].x, _941);
    float _955 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _957 = _945 + (-0.5);
    float _959 = _871 * 6.283185482025146484375;
    float _961 = cos(_959);
    float _963 = fma(_901, _947, _739);
    float _965 = _891 * _917;
    float _967 = _913 * _917;
    float _969 = -_923;
    float _971 = -_759;
    float _973 = fma(_969, _957, _971);
    float _975 = -_187;
    int _977 = _793 ? as_type<int>(_975) : as_type<int>(_187);
    float _979 = -_909;
    float _981 = fma(_549, _979, _963);
    float _983 = _927 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _985 = _871 * 6.283185482025146484375;
    float _987 = sin(_985);
    float _989 = _891 * _939;
    bool _991 = !_665;
    float _993 = _991 ? _187 : as_type<float>(_977);
    float _995 = fma(_945, _905, _973);
    float _997 = _891 * _961;
    float _999 = _913 * _939;
    float _1001 = _913 * _961;
    float _1003 = _939 * _961;
    float _1005 = _917 * _961;
    float _1007 = _997 * _637;
    float _1009 = _1001 * _637;
    float _1011 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1013 = fma(_987, _999, _965);
    float _1015 = -_967;
    float _1017 = fma(_987, _989, _1015);
    float _1019 = -_989;
    float _1021 = fma(_987, _967, _1019);
    float _1023 = -_637;
    float _1025 = _987 * _1023;
    float _1027 = fma(_1013, _405, _1009);
    float _1029 = _993 + 0.5;
    float _1031 = fma(_987, _965, _999);
    float _1033 = _993;
    float _1035 = _1005;
    float _1037 = _1031;
    if (_655)
    {
        float _1039 = _935 * 3.1415927410125732421875;
        _1033 = _1039;
    }
    float _1041 = _1033;
    float _1043 = fma(_1003, _405, _1025);
    float _1045 = fma(_1021, _955, _1027);
    float _1047 = fma(_1017, _405, _1007);
    float _1049 = -_191;
    int _1051 = _551 ? as_type<int>(_1049) : as_type<int>(_191);
    float _1053 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1055 = fma(_1005, _955, _1043);
    float _1057 = _1045 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1059 = _1045 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _1061 = !_533;
    float _1063 = _1061 ? _191 : as_type<float>(_1051);
    float _1065 = fma(_1031, _955, _1047);
    float _1067 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1057);
    float _1069 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1059);
    float _1071 = _1029 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1073 = -_1063;
    float _1075 = _1073 + 0.5;
    float _1077 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1067);
    float _1079 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1069);
    float _1081 = _1047;
    if (_655)
    {
        float _1083 = _1041 * 0.15915493667125701904296875;
        _1081 = _1083;
    }
    float _1085 = _1081;
    float _1087 = _1071 * _1011;
    float _1089 = _1075 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1091 = _929 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1093 = _1077 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1095 = _1079 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1097 = _953 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1099 = _1089 * _1053;
    float _1101 = _983 + _1093;
    float _1103 = _1091 + _1095;
    float _1105 = _909;
    float _1107 = _1103;
    float _1109 = _1101;
    if (_655)
    {
        float _1111 = _1085 * 6.283185482025146484375;
        float _1113 = sin(_1111);
        _1105 = _1113;
    }
    float _1115 = _1105;
    float _1117 = _1001 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1119 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1121 = _1101 + _1119;
    float _1123 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1125 = _1103 + _1123;
    float _1127 = _1001 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1129 = _1001 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1131 = _1121 * _1121;
    out.m_76.x = _1087;
    out.m_76.y = _1099;
    out.m_76.z = _981;
    out.m_76.w = _995;
    float _1133 = _1013 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1135 = _1125 * _1125;
    float _1137 = _1045 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1139 = -_987;
    float _1141 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1117);
    float _1143 = fma(_1003, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1133);
    float _1145 = _1131 + _1135;
    float _1147 = -_987;
    float _1149 = fma(_1147, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1127);
    float _1151 = -_987;
    float _1153 = fma(_1151, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1129);
    float _1155 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1137);
    float _1157 = _1131;
    float _1159 = _1135;
    if (_655)
    {
        bool _1161 = _1115 > 0.5;
        _629 = _1161;
    }
    bool _1163 = _629;
    out.m_78.w = _1097;
    float _1165 = fma(_997, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1141);
    float _1167 = fma(_997, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1149);
    float _1169 = sqrt(_1145);
    float _1171 = _1013 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1173 = _1013 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1175 = _1021 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1177 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1155);
    float _1179 = fma(_1003, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1171);
    float _1181 = fma(_1003, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1173);
    float _1183 = _1021 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1185 = fma(_997, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1153);
    float _1187 = _1021 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1189 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1191 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1183);
    float _1193 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1175);
    float _1195 = _925 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1197 = _1177 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1199 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1187);
    bool _1201 = _1169 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1203 = fma(_1031, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1193);
    float _1205 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1207 = _1195 + _1197;
    float _1209 = fma(_1031, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1191);
    if (!_661)
    {
        _1035 = _191;
    }
    float _1211 = _1035;
    float _1213 = fma(_1031, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1199);
    float _1215 = _1211;
    if (_661)
    {
        float _1217 = -_191;
        float _1219 = _951 ? _1217 : _191;
        _1215 = _1219;
    }
    float _1221 = _1215;
    float _1223 = _191 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    if (!_1201)
    {
        _1037 = _1103;
    }
    float _1225 = _1037;
    float _1227 = _1225;
    if (!_1201)
    {
        _195 = _1101;
    }
    float _1229 = _195;
    float _1231 = _1229;
    if (!_1201)
    {
        _1107 = _1207;
    }
    float _1233 = _1107;
    bool _1235 = !_1201;
    float _1237 = _1233;
    if (!_1235)
    {
        float _1239 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1241 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1243 = _1169 + _1241;
        float _1245 = rsqrt(_1145);
        float _1247 = _1243 * _1239;
        float _1249 = _1207 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1251 = _1247 * 0.15915493667125701904296875;
        float _1253 = _1251 * 6.283185482025146484375;
        float _1255 = sin(_1253);
        float _1257 = _1251 * 6.283185482025146484375;
        float _1259 = cos(_1257);
        float _1261 = fma(_1255, _1249, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1263 = _1245 * _1261;
        float _1265 = _1259 + (-1.0);
        float _1267 = fma(_1121, _1263, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1269 = fma(_1125, _1263, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1271 = _1265 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1273 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1275 = _1267 + _1273;
        float _1277 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1279 = _1269 + _1277;
        float _1281 = fma(_1207, _1259, _1271);
        float _1283 = _1275 * _1275;
        float _1285 = _1279 * _1279;
        _1237 = _1281;
        _1157 = _1283;
        _1159 = _1285;
        _1109 = _1251;
        _1231 = _1267;
        _1227 = _1269;
    }
    float _1287 = _1237;
    float _1289 = _1157;
    float _1291 = _1159;
    float _1293 = _1109;
    float _1295 = _1231;
    float _1297 = _1227;
    float _1299 = fma(_1223, _1223, 1.0);
    float _1301 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _1303 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1305 = _1287 + _1303;
    float _1307 = fma(_1017, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1181);
    float _1309 = _1293;
    if (!_655)
    {
        _1309 = _187;
    }
    float _1311 = _1309;
    float _1313 = fma(_1017, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1179);
    float _1315 = fma(_1017, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1143);
    float _1317 = -_569;
    float _1319 = _1317 + 0.5;
    float _1321 = fma(_1305, _1305, _1289);
    float _1323 = rsqrt(_1299);
    float _1325 = _1311;
    if (_655)
    {
        float _1327 = -_187;
        float _1329 = _1163 ? _1327 : _187;
        _1325 = _1329;
    }
    float _1331 = _1325;
    float _1333 = _187 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1335 = _1223 * _1165;
    float _1337 = _1223 * _1167;
    float _1339 = _1223 * _1185;
    float _1341 = -_1221;
    float _1343 = _1341 + 0.5;
    float _1345 = _601 + 0.5;
    float _1347 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _1349 = _1319 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1351 = fma(_1333, _1313, _1335);
    float _1353 = _1321 + _1291;
    float _1355 = fma(_1333, _1307, _1337);
    float _1357 = fma(_1333, _1315, _1339);
    float _1359 = _1343 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _1361 = _1345 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1363 = _1349 * _1205;
    float _1365 = _1223 * _1323;
    float _1367 = _1331 + 0.5;
    float _1369 = _1359 * _1301;
    float _1371 = _1361 * _1189;
    float _1373 = sqrt(_1353);
    float _1375 = -_1209;
    float _1377 = _1365 * _1375;
    float _1379 = -_1213;
    float _1381 = _1365 * _1379;
    float _1383 = _1367 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _1385 = -_1203;
    float _1387 = _1365 * _1385;
    float _1389 = fma(_1323, _1167, _1377);
    float _1391 = fma(_1323, _1185, _1381);
    float _1393 = _1383 * _1347;
    float _1395 = fma(_1323, _1165, _1387);
    float _1397 = _1203 + _1351;
    float _1399 = _1209 + _1355;
    float _1401 = _1213 + _1357;
    out.m_80.x = _1371;
    out.m_80.y = _1363;
    out.m_82.x = _1393;
    out.m_82.y = _1369;
    bool _1403 = _1373 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1405 = isnan(_1373);
    bool _1407 = _1403 || _1405;
    bool _1409 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1411 = _1407 || _1409;
    out.m_84.x = _1313;
    out.m_84.y = _1307;
    out.m_84.z = _1315;
    out.m_86.x = _1395;
    out.m_86.y = _1389;
    out.m_86.z = _1391;
    out.m_88.x = _1397;
    out.m_88.y = _1399;
    out.m_88.z = _1401;
    float _1413 = _1387;
    if (!_1411)
    {
        _1413 = 1.0;
    }
    float _1415 = _1413;
    bool _1417 = !_1411;
    float _1419 = _1415;
    if (!_1417)
    {
        bool _1421 = _1373 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1423 = isnan(_1373);
        bool _1425 = _1421 || _1423;
        bool _1427 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1429 = _1425 || _1427;
        if (!_1429)
        {
            float _1431 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1433 = _1373 + _1431;
            float _1435 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1437 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1435;
            float _1439 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1441 = _1439 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1443 = 1.0 / _1437;
            float _1445 = _1433 * _1443;
            float _1447 = fma(_1445, _1441, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1419 = _1447;
            _1449 = true;
        }
        else
        {
            bool _1451 = _1373 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1453 = isnan(_1373);
            bool _1455 = _1451 || _1453;
            bool _1457 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1459 = _1455 || _1457;
            if (!_1459)
            {
                float _1461 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1463 = _1373 + _1461;
                float _1465 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1467 = _1465 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1469 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1471 = _1469 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1473 = 1.0 / _1467;
                float _1475 = _1463 * _1473;
                float _1477 = fma(_1475, _1471, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1419 = _1477;
                _1449 = true;
            }
            else
            {
                _1419 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1449 = false;
    float _1479 = _1419;
    float _1481 = fma(_983, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1483 = fma(_1091, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1485 = floor(_1481);
    float _1487 = floor(_1483);
    float _1489 = -_1485;
    float _1491 = _1481 + _1489;
    float _1493 = -_1487;
    float _1495 = _1483 + _1493;
    float2 _5278 = float2(_1491, _1495);
    float _1497 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5278, float2(0.0), isnan(_5278)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5278, float2(0.0), isnan(_5278)), level(0.0)).x;
    float _1499 = _1195 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1501 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1503 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1505 = _1295 + _1503;
    float _1507 = fma(_983, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1499);
    float _1509 = _1195 + _1501;
    float _1511 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1513 = _1287 + _1511;
    float _1515 = fma(_1505, _1479, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1517 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1507);
    float _1519 = _1195 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1521 = _1509 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1523 = _1517 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1525 = fma(_983, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1519);
    float _1527 = _1509 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1529 = fma(_983, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1521);
    float _1531 = 1.0 / _1523;
    float _1533 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1525);
    float _1535 = fma(_983, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1527);
    float _1537 = fma(_1091, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1529);
    float _1539 = fma(_1513, _1479, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1541 = _1533 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1543 = fma(_1091, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1535);
    float _1545 = _1537 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1547 = _1541 + _1523;
    float _1549 = _1543 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1551 = trunc(_1545);
    int _1553 = int(_1551);
    float _1555 = _1547 * _1531;
    float _1557 = _1555 * 0.5;
    float _1559 = trunc(_1549);
    int _1561 = int(_1559);
    float _1563 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1565 = fma(_1557, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1563);
    float _1567 = 1.0 / _1565;
    int _1569 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1571 = _1553 + _1569;
    int _1573 = _1571 + 1;
    int _1575 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1577 = _1561 + _1575;
    int _1579 = _1577 + 1;
    int _1581 = _1573 | _1579;
    float _1583 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1585 = _1567 * _1583;
    bool _1587 = _1585 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1589 = _1585 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1591 = !_1587;
    int _1593 = _1591 ? 0 : 1;
    int _1595 = 2;
    int _1597 = _1573;
    float _1599 = _1505;
    float _1601 = _1479;
    int _1603 = as_type<int>(_1515);
    int _1605 = _1579;
    if (!_1587)
    {
        _1595 = 1;
    }
    int _1607 = _1595;
    int _1609 = _1607;
    if (!_1589)
    {
        _1609 = _1593;
    }
    int _1611 = _1609;
    bool _1613 = _1573 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1615 = _1611 << 6;
    bool _1617 = _1581 < 0;
    bool _1619 = _1617 || _1613;
    int _1621 = _1615 + 48;
    uint _1624 = uint(int(uint(_1621) >> uint(2)));
    uint _1626 = uint(int(uint(int(_1624)) >> uint(2)));
    int _1628 = int(_1624) & 3;
    float _1630 = (*spvDescriptorSet0.vp_c15)._m0[int(_1626)][_1628];
    int _1632 = int(_1624) + 1;
    uint _1634 = uint(int(uint(_1632) >> uint(2)));
    int _1636 = _1632 & 3;
    float _1638 = (*spvDescriptorSet0.vp_c15)._m0[int(_1634)][_1636];
    bool _1640 = _1579 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1642 = _1640 || _1619;
    bool _1644 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1646 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1648 = _1644 || _1646;
    bool _1650 = isnan(0.5);
    bool _1652 = _1648 || _1650;
    float _1654 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1656 = _1297 + _1654;
    int _1658 = _1615 + 56;
    uint _1660 = uint(int(uint(_1658) >> uint(2)));
    uint _1662 = uint(int(uint(int(_1660)) >> uint(2)));
    int _1664 = int(_1660) & 3;
    float _1666 = (*spvDescriptorSet0.vp_c15)._m0[int(_1662)][_1664];
    int _1668 = int(_1660) + 1;
    uint _1670 = uint(int(uint(_1668) >> uint(2)));
    int _1672 = _1668 & 3;
    float _1674 = (*spvDescriptorSet0.vp_c15)._m0[int(_1670)][_1672];
    float _1676 = fma(_1656, _1479, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    int _1678 = _1615 + 64;
    uint _1680 = uint(int(uint(_1678) >> uint(2)));
    uint _1682 = uint(int(uint(int(_1680)) >> uint(2)));
    int _1684 = int(_1680) & 3;
    float _1686 = (*spvDescriptorSet0.vp_c15)._m0[int(_1682)][_1684];
    int _1688 = int(_1680) + 1;
    uint _1690 = uint(int(uint(_1688) >> uint(2)));
    int _1692 = _1688 & 3;
    float _1694 = (*spvDescriptorSet0.vp_c15)._m0[int(_1690)][_1692];
    float _1696 = _1656;
    float _1698 = as_type<float>(_1615);
    float _1700 = as_type<float>(_1611);
    if (!_1642)
    {
        int _1702 = _1579 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1704 = _1702 + _1573;
        _1597 = _1704;
    }
    int _1706 = _1597;
    if (_1652)
    {
        _1599 = _1515;
    }
    float _1708 = _1599;
    float _1710 = _1708;
    if (_1652)
    {
        _1601 = _1539;
    }
    float _1712 = _1601;
    float _1714 = _1712;
    if (_1652)
    {
        _1696 = _1676;
    }
    float _1716 = _1696;
    int _1718 = _1615 + 72;
    uint _1720 = uint(int(uint(_1718) >> uint(2)));
    uint _1722 = uint(int(uint(int(_1720)) >> uint(2)));
    int _1724 = int(_1720) & 3;
    float _1726 = (*spvDescriptorSet0.vp_c15)._m0[int(_1722)][_1724];
    int _1728 = int(_1720) + 1;
    uint _1730 = uint(int(uint(_1728) >> uint(2)));
    int _1732 = _1728 & 3;
    float _1734 = (*spvDescriptorSet0.vp_c15)._m0[int(_1730)][_1732];
    int _1736 = _1615 + 96;
    uint _1738 = uint(int(uint(_1736) >> uint(2)));
    uint _1740 = uint(int(uint(int(_1738)) >> uint(2)));
    int _1742 = int(_1738) & 3;
    float _1744 = (*spvDescriptorSet0.vp_c15)._m0[int(_1740)][_1742];
    int _1746 = int(_1738) + 1;
    uint _1748 = uint(int(uint(_1746) >> uint(2)));
    int _1750 = _1746 & 3;
    float _1752 = (*spvDescriptorSet0.vp_c15)._m0[int(_1748)][_1750];
    int _1754 = _1615 + 104;
    uint _1756 = uint(int(uint(_1754) >> uint(2)));
    uint _1758 = uint(int(uint(int(_1756)) >> uint(2)));
    int _1760 = int(_1756) & 3;
    float _1762 = (*spvDescriptorSet0.vp_c15)._m0[int(_1758)][_1760];
    int _1764 = int(_1756) + 1;
    uint _1766 = uint(int(uint(_1764) >> uint(2)));
    int _1768 = _1764 & 3;
    float _1770 = (*spvDescriptorSet0.vp_c15)._m0[int(_1766)][_1768];
    float _1772 = _1716;
    int _1774 = as_type<int>(_1752);
    if (!_1652)
    {
        float _1776 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1778 = _1195 + _1776;
        float _1780 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1782 = _983 + _1780;
        float _1784 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1786 = _1778 * _1778;
        float _1788 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1790 = _1091 + _1788;
        float _1792 = fma(_1782, _1782, _1786);
        float _1794 = -_1195;
        float _1796 = _1794 + _1539;
        float _1798 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1800 = fma(_1790, _1790, _1792);
        float _1802 = sqrt(_1800);
        float _1804 = _1784 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1806 = precise::min(_1802, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1808 = _1806 * _1798;
        float _1810 = _1804 * _1808;
        float _1812 = -_983;
        float _1814 = _1812 + _1515;
        float _1816 = -_1091;
        float _1818 = _1816 + _1676;
        float _1820 = fma(_1796, _1810, _1195);
        float _1822 = fma(_1814, _1810, _983);
        float _1824 = fma(_1818, _1810, _1091);
        _1714 = _1820;
        _1603 = as_type<int>(_1818);
        _1710 = _1822;
        _1772 = _1824;
    }
    float _1826 = _1714;
    int _1828 = _1603;
    float _1830 = _1710;
    float _1832 = _1772;
    float _1834 = _1509 * _1752;
    int _1836 = _1828;
    if (!_1642)
    {
        int _1838 = _1706 << 2;
        _1836 = _1838;
    }
    int _1840 = _1836;
    float _1842 = _1826 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    int _1844 = _1840;
    if (!_1642)
    {
        uint _1846 = uint(int(uint(_1706) >> uint(2)));
        _1774 = int(_1846);
    }
    int _1848 = _1774;
    float _1850 = fma(_983, _1744, _1834);
    if (!_1642)
    {
        int _1852 = 12 & _1840;
        _1844 = _1852;
    }
    int _1854 = _1844;
    float _1856 = fma(_1830, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1842);
    float _1858 = _1509 * _1694;
    float _1860 = fma(_1091, _1762, _1850);
    if (!_1642)
    {
        int _1862 = _1848 << 4;
        int _1864 = _1862 + _1854;
        _1605 = _1864;
    }
    int _1866 = _1605;
    float _1868 = fma(_1832, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1856);
    int _1870 = _1615 + 80;
    uint _1872 = uint(int(uint(_1870) >> uint(2)));
    uint _1874 = uint(int(uint(int(_1872)) >> uint(2)));
    int _1876 = int(_1872) & 3;
    float _1878 = (*spvDescriptorSet0.vp_c15)._m0[int(_1874)][_1876];
    int _1880 = int(_1872) + 1;
    uint _1882 = uint(int(uint(_1880) >> uint(2)));
    int _1884 = _1880 & 3;
    float _1886 = (*spvDescriptorSet0.vp_c15)._m0[int(_1882)][_1884];
    float _1888 = _1860 + _1770;
    float _1890 = _1509 * _1638;
    float _1892 = _1868 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1894 = fma(_983, _1686, _1858);
    float _1896 = 1.0 / _1888;
    float _1898 = fma(_983, _1630, _1890);
    float _1900 = _1826 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1902 = _1860;
    if (!_1642)
    {
        int _1904 = _1866 + 400;
        uint _1906 = uint(int(uint(_1904) >> uint(2)));
        uint _1908 = uint(int(uint(int(_1906)) >> uint(2)));
        int _1910 = int(_1906) & 3;
        float _1912 = (*spvDescriptorSet0.vp_c15)._m0[int(_1908)][_1910];
        _1902 = _1912;
    }
    float _1914 = _1902;
    float _1916 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1918 = fma(_1091, _1666, _1898);
    float _1920 = _1892 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1922 = fma(_1830, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1900);
    float _1924 = _1826 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1926 = _1918 + _1674;
    float _1928 = -_1920;
    float _1930 = fma(_1928, _1916, 1.0);
    int _1932 = _1615 + 88;
    uint _1934 = uint(int(uint(_1932) >> uint(2)));
    uint _1936 = uint(int(uint(int(_1934)) >> uint(2)));
    int _1938 = int(_1934) & 3;
    float _1940 = (*spvDescriptorSet0.vp_c15)._m0[int(_1936)][_1938];
    int _1942 = int(_1934) + 1;
    uint _1944 = uint(int(uint(_1942) >> uint(2)));
    int _1946 = _1942 & 3;
    float _1948 = (*spvDescriptorSet0.vp_c15)._m0[int(_1944)][_1946];
    float _1950 = fma(_1091, _1726, _1894);
    float _1952 = fma(_1832, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1922);
    float _1954 = _1826 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1956 = fma(_1830, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1924);
    float _1958 = _1926 * _1896;
    float _1960 = _1950 + _1734;
    float _1962 = _1952 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1964 = fma(_1830, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1954);
    float _1966 = fma(_1832, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1956);
    bool _1968 = _1958 >= 0.0;
    float _1970 = _1960 * _1896;
    float _1972 = _1962 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1974 = _1966 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    bool _1976 = _1958 <= 1.0;
    bool _1978 = _1976 && _1968;
    float _1980 = fma(_1832, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1964);
    float _1982 = log2(_1930);
    float _1984 = fma(_1974, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1972);
    bool _1986 = _1970 >= 0.0;
    bool _1988 = _1986 && _1978;
    float _1990 = _1980 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1992 = _1962 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1994 = fma(_1892, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1984);
    bool _1996 = _1970 <= 1.0;
    bool _1998 = _1996 && _1988;
    float _2000 = _1674;
    float _2002 = _1960;
    if (!_1642)
    {
        float _2004 = floor(_1549);
        _2000 = _2004;
    }
    float _2006 = _2000;
    float _2008 = fma(_1990, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1994);
    float _2010 = fma(_1974, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1992);
    float _2012 = _1509 * _1886;
    float _2014 = _1676;
    float _2016 = _2012;
    if (!_1642)
    {
        float _2018 = floor(_1545);
        _2014 = _2018;
    }
    float _2020 = _2014;
    float _2022 = _1962 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2024 = _1982 * 0.693147182464599609375;
    float _2026 = fma(_983, _1878, _2012);
    if (_1998)
    {
        float _2028 = float(_1611);
        _2016 = _2028;
    }
    float _2030 = _2016;
    float _2032 = fma(_1974, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2022);
    if (!_1642)
    {
        float _2034 = -_2006;
        float _2036 = _1549 + _2034;
        _2002 = _2036;
    }
    float _2038 = _2002;
    float _2040 = 1.0 / _2008;
    float _2042 = fma(_1091, _1940, _2026);
    float _2044 = _1914;
    if (!_1642)
    {
        float _2046 = rint(_1914);
        float _2048 = precise::max(_2046, 0.0);
        uint _2050 = uint(_2048);
        uint _2052 = clamp(_2050, 0u, 65535u);
        _2044 = as_type<float>(_2052);
    }
    float _2054 = _2044;
    float _2056 = fma(_1892, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2032);
    float _2058 = fma(_1892, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2010);
    float _2060 = _2042 + _1948;
    if (!_1642)
    {
        float _2062 = -_2020;
        float _2064 = _1545 + _2062;
        _1698 = _2064;
    }
    float _2066 = _1698;
    float _2068 = fma(_1990, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2056);
    float _2070 = fma(_1990, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2058);
    float _2072 = _2060 * _1896;
    float _2074 = _2030;
    float _2076 = _2070;
    if (_1998)
    {
        float _2078 = rint(_2030);
        float _2080 = precise::max(_2078, 0.0);
        uint _2082 = uint(_2080);
        uint _2084 = clamp(_2082, 0u, 65535u);
        _2074 = as_type<float>(_2084);
    }
    float _2086 = _2074;
    float _2088 = _2068 * _2040;
    float _2090 = _2070 * _2040;
    float _2092 = _2024 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2094 = fma(_2088, 0.5, 0.5);
    float _2096 = fma(_2090, -0.5, 0.5);
    float _2098 = _2066;
    float _2100 = _2054;
    if (!_1642)
    {
        float3 _6305 = float3(_2066, _2038, float(as_type<int>(_2054)));
        float3 _6309 = select(_6305, float3(0.0), isnan(_6305));
        float _2102 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6309.xy, uint(rint(_6309.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6309.xy, uint(rint(_6309.z)), level(0.0)).x;
        _2098 = _2102;
    }
    float _2104 = _2098;
    float _2106 = _1970;
    float _2108 = _2086;
    if (_1998)
    {
        float3 _6325 = float3(_1958, _1970, float(as_type<int>(_2086)));
        float3 _6327 = select(_6325, float3(0.0), isnan(_6325));
        float _2110 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6327.xy, uint(rint(_6327.z)), _2072, level(0.0));
        _2106 = _2110;
    }
    float _2112 = _2106;
    float3 _6337 = float3(_2094, _2096, _2092);
    float _2114 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6337, float3(0.0), isnan(_6337)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6337, float3(0.0), isnan(_6337)), level(0.0)).x;
    float3 _6346 = float3(_2094, _2096, _2092);
    float4 _2117 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6346, float3(0.0), isnan(_6346)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6346, float3(0.0), isnan(_6346)), level(0.0)).xyzw;
    float _2119 = _2117.x;
    float _2121 = _2117.y;
    float _2123 = _2117.z;
    float _2125 = _2117.w;
    bool _2127 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2129 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2131 = _2127 || _2129;
    bool _2133 = isnan(0.5);
    bool _2135 = _2131 || _2133;
    if (_2135)
    {
        _1700 = 1.0;
    }
    float _2137 = _1700;
    float _2139 = _2137;
    if (!_2135)
    {
        float _2141 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2143 = _2141 * 0.15915493667125701904296875;
        float _2145 = _2143 * 6.283185482025146484375;
        float _2147 = cos(_2145);
        float _2149 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2151 = _2149 * 0.15915493667125701904296875;
        float _2153 = _2143 * 6.283185482025146484375;
        float _2155 = sin(_2153);
        float _2157 = 1.0 / _2147;
        float _2159 = _2151 * 6.283185482025146484375;
        float _2161 = cos(_2159);
        float _2163 = _2155 * _2157;
        float _2165 = _2151 * 6.283185482025146484375;
        float _2167 = sin(_2165);
        float _2169 = _2161 * _2163;
        float _2171 = 1.0 / _2169;
        float _2173 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2175 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2173;
        float _2177 = 1.0 / _2175;
        float _2179 = _2167 * _2171;
        float _2181 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2183 = fma(_1585, _2179, _2181);
        float _2185 = _2183 * _2177;
        float _2187 = precise::clamp(_2185, 0.0, 1.0);
        _2108 = _2177;
        _2100 = _2151;
        _2139 = _2187;
    }
    float _2189 = _2108;
    float _2191 = _2100;
    float _2193 = _2139;
    float _2195 = _2191;
    float _2197 = _2189;
    if (_1642)
    {
        _2195 = 1.0;
    }
    float _2199 = _2195;
    float _2201 = _2199;
    if (!_1642)
    {
        int _2203 = _1706 << 4;
        int _2205 = _2203 + 2048;
        uint _2207 = uint(int(uint(_2205) >> uint(2)));
        uint _2209 = uint(int(uint(int(_2207)) >> uint(2)));
        int _2211 = int(_2207) & 3;
        float _2213 = (*spvDescriptorSet0.vp_c15)._m0[int(_2209)][_2211];
        int _2215 = int(_2207) + 1;
        uint _2217 = uint(int(uint(_2215) >> uint(2)));
        int _2219 = _2215 & 3;
        float _2221 = (*spvDescriptorSet0.vp_c15)._m0[int(_2217)][_2219];
        int _2223 = _2205 + 8;
        uint _2225 = uint(int(uint(_2223) >> uint(2)));
        uint _2227 = uint(int(uint(int(_2225)) >> uint(2)));
        int _2229 = int(_2225) & 3;
        float _2231 = (*spvDescriptorSet0.vp_c15)._m0[int(_2227)][_2229];
        int _2233 = int(_2225) + 1;
        uint _2235 = uint(int(uint(_2233) >> uint(2)));
        int _2237 = _2233 & 3;
        float _2239 = (*spvDescriptorSet0.vp_c15)._m0[int(_2235)][_2237];
        float _2241 = _1509 * _2221;
        float _2243 = fma(_983, _2213, _2241);
        float _2245 = fma(_1091, _2231, _2243);
        float _2247 = _2245 + _2239;
        float _2249 = precise::clamp(_2247, 0.0, 1.0);
        float _2251 = -_2249;
        float _2253 = _2251 + _2104;
        float _2255 = fma(_2253, 500.0, 1.5);
        float _2257 = exp2(_2255);
        float _2259 = 0.0 + _2257;
        float _2261 = precise::clamp(_2259, 0.0, 1.0);
        _2197 = _2231;
        _2201 = _2261;
    }
    float _2263 = _2197;
    float _2265 = _2201;
    float _2267 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2269 = _1826 + _2267;
    float _2271 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2273 = _1830 + _2271;
    float _2275 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2277 = _1832 + _2275;
    float _2279 = _2269 * _2269;
    float _2281 = fma(_2273, _2273, _2279);
    float _2283 = fma(_2277, _2277, _2281);
    float _2285 = rsqrt(_2283);
    float _2287 = _2285 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2289 = _2273 * _2287;
    float _2291 = _2277 * _2287;
    float _2293 = _2289 * _2289;
    float _2295 = _2291 * _2291;
    float _2297 = _2293 + _2295;
    float _2299 = sqrt(_2297);
    bool _2301 = _2299 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2303 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2305 = _2299 + _2303;
    float _2307 = _2277;
    float _2309 = _2285;
    float _2311 = _2305;
    float _2313 = _2263;
    float _2315 = _2287;
    if (_2301)
    {
        float _2317 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2307 = _2317;
    }
    float _2319 = _2307;
    if (_2301)
    {
        float _2321 = rsqrt(_2297);
        _2309 = _2321;
    }
    float _2323 = _2309;
    float _2325 = _2323;
    if (_2301)
    {
        float _2327 = _2305 * _2319;
        _2311 = _2327;
    }
    float _2329 = _2311;
    if (_2301)
    {
        float _2331 = _2329 * 0.15915493667125701904296875;
        _2313 = _2331;
    }
    float _2333 = _2313;
    float _2335 = _2319;
    float _2337 = _2333;
    if (_2301)
    {
        float _2339 = _2333 * 6.283185482025146484375;
        float _2341 = sin(_2339);
        _2335 = _2341;
    }
    float _2343 = _2335;
    float _2345 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2347 = precise::max(0.0, _2345);
    float _2349 = _2279;
    float _2351 = _2347;
    if (_2301)
    {
        float _2353 = _2333 * 6.283185482025146484375;
        float _2355 = cos(_2353);
        _2349 = _2355;
    }
    float _2357 = _2349;
    float _2359 = -_2287;
    float _2361 = -_2347;
    float _2363 = fma(_2269, _2359, _2361);
    if (_2301)
    {
        float _2365 = _2363 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2351 = _2365;
    }
    float _2367 = _2351;
    float _2369 = _2367;
    if (!_2301)
    {
        _2337 = _2293;
    }
    float _2371 = _2337;
    float _2373 = _2343;
    float _2375 = _2371;
    if (_2301)
    {
        float _2377 = fma(_2343, _2367, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2373 = _2377;
    }
    float _2379 = _2373;
    float _2381 = _2379;
    float _2383 = _2357;
    if (_2301)
    {
        float _2385 = _2357 + (-1.0);
        _2369 = _2385;
    }
    float _2387 = _2369;
    float _2389 = 0.0;
    float _2391 = _2387;
    if (_2301)
    {
        float _2393 = _2323 * _2379;
        _2389 = _2393;
    }
    float _2395 = _2389;
    if (!_2301)
    {
        _2325 = _2289;
    }
    float _2397 = _2325;
    float _2399 = _2397;
    if (_2301)
    {
        float _2401 = _2387 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2315 = _2401;
    }
    float _2403 = _2315;
    if (_2301)
    {
        float _2405 = _2289 * _2395;
        _2399 = _2405;
    }
    float _2407 = _2399;
    if (!_2301)
    {
        _2381 = _2363;
    }
    float _2409 = _2381;
    float _2411 = _2409;
    if (!_2301)
    {
        _2391 = _2291;
    }
    float _2413 = _2391;
    float _2415 = _2413;
    if (_2301)
    {
        float _2417 = fma(_2363, _2357, _2403);
        _2411 = _2417;
    }
    float _2419 = _2411;
    if (_2301)
    {
        float _2421 = _2291 * _2395;
        _2415 = _2421;
    }
    float _2423 = _2415;
    if (_2301)
    {
        float _2425 = _2407 * _2407;
        _2375 = _2425;
    }
    float _2427 = _2375;
    if (!_2301)
    {
        _2383 = _2295;
    }
    float _2429 = _2383;
    float _2431 = sqrt(_2283);
    float _2433 = _2429;
    if (_2301)
    {
        float _2435 = _2423 * _2423;
        _2433 = _2435;
    }
    float _2437 = _2433;
    float _2439 = fma(_2419, _2419, _2427);
    float _2441 = _2439 + _2437;
    float _2443 = rsqrt(_2441);
    float _2445 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2447 = fma(_2431, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2445);
    float _2449 = precise::clamp(_2447, 0.0, 1.0);
    float _2451 = -_2449;
    float _2453 = _2451 + 1.0;
    float _2455 = _2443 * _2407;
    float _2457 = _2443 * _2419;
    float _2459 = _2443 * _2423;
    float _2461 = abs(_2453);
    float _2463 = log2(_2461);
    float _2465 = _2455 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2467 = -_2465;
    float _2469 = fma(_2457, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2467);
    float _2471 = -_2459;
    float _2473 = fma(_2471, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2469);
    float _2475 = fma(_2473, -0.5, 0.5);
    float _2477 = fma(_2473, 0.5, 0.5);
    float _2479 = _2463 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2481 = fma(_2477, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2483 = sqrt(_2475);
    float _2485 = fma(_2477, _2481, -0.212114393711090087890625);
    float _2487 = _2457 + 1.0;
    float _2489 = fma(_2477, _2485, 1.570728778839111328125);
    float _2491 = exp2(_2479);
    float _2493 = _2483 * 0.636619746685028076171875;
    float _2495 = -_2489;
    float _2497 = fma(_2493, _2495, 1.0);
    float _2499 = -_2457;
    float _2501 = fma(_2491, _2487, _2499);
    float _2503 = fma(_2501, 0.5, 0.5);
    float2 _6919 = float2(_2497, _2503);
    float3 _2507 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6919, float2(0.0), isnan(_6919)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6919, float2(0.0), isnan(_6919)), level(0.0)).xyz;
    float _2509 = _2507.x;
    float _2511 = _2507.y;
    float _2513 = _2507.z;
    float _2515 = abs(_1585);
    float _2517 = log2(_2515);
    float _2519 = _1962 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2521 = _2463 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2523 = _2068 + _2008;
    float _2525 = fma(_1974, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2519);
    float _2527 = -_1497;
    float _2529 = _2527 + 1.0;
    float _2531 = _2523 * 0.5;
    float _2533 = exp2(_2521);
    bool _2535 = _1585 <= 8000.0;
    bool _2537 = isnan(_1585);
    bool _2539 = _2535 || _2537;
    bool _2541 = isnan(8000.0);
    bool _2543 = _2539 || _2541;
    float _2545 = float(_2543);
    float _2547 = _2517 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2549 = fma(_1892, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2525);
    float _2551 = _2008 * 0.5;
    float _2553 = fma(_1990, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2549);
    float _2555 = exp2(_2547);
    float _2557 = fma(_2070, -0.5, _2551);
    float _2559 = _2553 + _2008;
    out.gl_Position.x = _2068;
    out.gl_Position.y = _2070;
    out.gl_Position.z = _2553;
    out.gl_Position.w = _2008;
    float _2561 = _2559 * 0.5;
    out.m_90.x = _2531;
    out.m_90.y = _2557;
    out.m_90.z = _2561;
    out.m_90.w = _2008;
    float _2563 = fma(_2555, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2565 = precise::clamp(_2563, 0.0, 1.0);
    float _2567 = -_2533;
    float _2569 = _2567 + 1.0;
    float _2571 = _2553;
    if (!_1998)
    {
        _2076 = 1.0;
    }
    float _2573 = _2076;
    float _2575 = fma(_2565, -2.0, 3.0);
    float _2577 = _2565 * _2565;
    float _2579 = _2573;
    if (_1998)
    {
        bool _2581 = _2112 >= _2072;
        bool _2583 = isnan(_2112);
        bool _2585 = _2581 || _2583;
        bool _2587 = isnan(_2072);
        bool _2589 = _2585 || _2587;
        float _2591 = float(_2589);
        _2579 = _2591;
    }
    float _2593 = _2579;
    float _2595 = _2569 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _2597 = _2431 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2599 = isnan(_2431);
    bool _2601 = _2597 || _2599;
    bool _2603 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2605 = _2601 || _2603;
    float _2607 = _2577 * _2575;
    float _2609 = _2595 * _2114;
    float _2611 = _2593 * _2265;
    float _2613 = -_2607;
    float _2615 = _2613 + 1.0;
    float _2617 = -_2595;
    float _2619 = _2617 + 1.0;
    float _2621 = _2125 * _2609;
    float _2623 = _2193 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2625 = fma(_2615, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2607);
    float _2627 = _2125 * _2619;
    float _2629 = _2545 * _2625;
    float _2631 = _2619;
    float _2633 = _2629;
    if (!_2605)
    {
        _2571 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2635 = _2571;
    float _2637 = _2635;
    float _2639 = _2635;
    if (!_2605)
    {
        _2631 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2641 = _2631;
    float _2643 = _2629 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2645 = _2643;
    float _2647 = _2641;
    float _2649 = _2641;
    if (!_2605)
    {
        _2633 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2651 = _2633;
    float _2653 = _2529 * _2643;
    float _2655 = precise::clamp(_2653, 0.0, 1.0);
    float _2657 = _2651;
    float _2659 = _2651;
    if (!_2605)
    {
        _2645 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2661 = _2645;
    float _2663 = -_2655;
    float _2665 = fma(_2663, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2667 = _2661;
    float _2669 = _2661;
    if (!_2605)
    {
        _773 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2671 = _773;
    float _2673 = -_2611;
    float _2675 = fma(_2673, _2665, 1.0);
    float _2677 = precise::clamp(_2675, 0.0, 1.0);
    float _2679 = _2677 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2681 = _2677;
    float _2683 = _2671;
    float _2685 = _2671;
    if (!_2605)
    {
        _2681 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2687 = _2681;
    out.m_92.x = _2679;
    float _2689 = _2513 * _2609;
    float _2691 = fma(_2509, _2621, _2119);
    float _2693 = fma(_2511, _2621, _2121);
    float _2695 = fma(_2125, _2689, _2123);
    out.m_94.x = _2691;
    out.m_94.y = _2693;
    out.m_94.z = _2695;
    out.m_94.w = _2627;
    bool _2697 = !_2605;
    float _2699 = _2687;
    float _2701 = _2687;
    if (!_2697)
    {
        bool _2703 = _2431 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2705 = isnan(_2431);
        bool _2707 = _2703 || _2705;
        bool _2709 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2711 = _2707 || _2709;
        if (!_2711)
        {
            float _2713 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2715 = _2431 + _2713;
            float _2717 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2719 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2717;
            float _2721 = 1.0 / _2719;
            float _2723 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2725 = _2723 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2727 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2729 = _2727 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2731 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2733 = _2731 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2735 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2737 = _2735 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2739 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2741 = _2739 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2743 = _2715 * _2721;
            float _2745 = precise::clamp(_2743, 0.0, 1.0);
            float _2747 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2749 = _2747 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2751 = fma(_2745, _2725, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2753 = fma(_2745, _2749, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2755 = fma(_2745, _2729, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2757 = fma(_2745, _2733, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2759 = fma(_2745, _2737, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2761 = fma(_2745, _2741, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2669 = _2753;
            _2649 = _2759;
            _2659 = _2751;
            _2701 = _2757;
            _2639 = _2755;
            _2685 = _2761;
            _2763 = true;
        }
        else
        {
            bool _2765 = _2431 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2767 = isnan(_2431);
            bool _2769 = _2765 || _2767;
            bool _2771 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2773 = _2769 || _2771;
            if (!_2773)
            {
                _2657 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2775 = _2657;
            _2659 = _2775;
            if (!_2773)
            {
                _2667 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2777 = _2667;
            _2669 = _2777;
            if (!_2773)
            {
                _2637 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2779 = _2637;
            _2639 = _2779;
            if (!_2773)
            {
                _2699 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2781 = _2699;
            _2701 = _2781;
            if (!_2773)
            {
                _2647 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2783 = _2647;
            _2649 = _2783;
            if (!_2773)
            {
                _2683 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2785 = _2683;
            bool _2787 = !_2773;
            _2685 = _2785;
            if (!_2787)
            {
                bool _2789 = _2431 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2791 = isnan(_2431);
                bool _2793 = _2789 || _2791;
                bool _2795 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2797 = _2793 || _2795;
                if (!_2797)
                {
                    float _2799 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2801 = _2431 + _2799;
                    float _2803 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2805 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2803;
                    float _2807 = 1.0 / _2805;
                    float _2809 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2811 = _2809 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2813 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2815 = _2813 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2817 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2819 = _2817 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2821 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2823 = _2821 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2825 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2827 = _2825 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2829 = _2801 * _2807;
                    float _2831 = precise::clamp(_2829, 0.0, 1.0);
                    float _2833 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2835 = _2833 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2837 = fma(_2831, _2811, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2839 = fma(_2831, _2835, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2841 = fma(_2831, _2815, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2843 = fma(_2831, _2819, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2845 = fma(_2831, _2823, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2847 = fma(_2831, _2827, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2669 = _2839;
                    _2649 = _2845;
                    _2659 = _2837;
                    _2701 = _2843;
                    _2639 = _2841;
                    _2685 = _2847;
                    _2763 = true;
                }
                else
                {
                    _2669 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2649 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2659 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2701 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2639 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2685 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2763 = false;
    float _2849 = _2669;
    float _2851 = _2649;
    float _2853 = _2659;
    float _2855 = _2701;
    float _2857 = _2639;
    float _2859 = _2685;
    float _2861 = fma(_1399, -0.5, 0.5);
    float _2863 = precise::clamp(_2861, 0.0, 1.0);
    float _2865 = -_2849;
    float _2867 = _2865 + _2851;
    float _2869 = _2623 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2871 = -_2853;
    float _2873 = _2871 + _2855;
    float _2875 = fma(_2863, _2867, _2849);
    out.m_96.x = 0.0;
    float _2877 = -_2857;
    float _2879 = _2877 + _2859;
    float _2881 = fma(_2863, _2873, _2853);
    float _2883 = _2875 * 0.586610972881317138671875;
    out.m_61.x = _2869;
    bool _2885 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2887 = fma(_2863, _2879, _2857);
    float _2889 = fma(_2881, 0.298911988735198974609375, _2883);
    bool _2891 = _2193 > 0.0;
    bool _2893 = isnan(_2193);
    bool _2895 = _2891 || _2893;
    bool _2897 = isnan(0.0);
    bool _2899 = _2895 || _2897;
    float _2901 = fma(_2887, 0.114477999508380889892578125, _2889);
    float _2903 = -_2901;
    float _2905 = _2881 + _2903;
    float _2907 = -_2901;
    float _2909 = _2875 + _2907;
    float _2911 = -_2901;
    float _2913 = _2887 + _2911;
    float _2915 = fma(_2905, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2901);
    float _2917 = fma(_2909, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2901);
    float _2919 = fma(_2913, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2901);
    bool _2921 = !_2885;
    if (!_2921)
    {
        float _2923 = -_1826;
        float _2925 = _2923 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2927 = -_1830;
        float _2929 = _2927 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2931 = -_1832;
        float _2933 = _2931 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2935 = _2925 * _2925;
        float _2937 = fma(_2929, _2929, _2935);
        float _2939 = fma(_2933, _2933, _2937);
        float _2941 = sqrt(_2939);
        float _2943 = rsqrt(_2939);
        float _2945 = -_2941;
        float _2947 = _2945 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2949 = _2947 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2951 = precise::clamp(_2949, 0.0, 1.0);
        float _2953 = _2929 * _2943;
        float _2955 = _2925 * _2943;
        float _2957 = abs(_2951);
        float _2959 = log2(_2957);
        float _2961 = _2933 * _2943;
        float _2963 = _2953 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2965 = _1399 * _2955;
        float _2967 = -_2955;
        float _2969 = -_2963;
        float _2971 = fma(_2967, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2969);
        float _2973 = fma(_1397, _2953, _2965);
        float _2975 = -_2961;
        float _2977 = fma(_2975, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2971);
        float _2979 = fma(_1401, _2961, _2973);
        float _2981 = precise::clamp(_2979, 0.0, 1.0);
        float _2983 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2985 = _2977 + _2983;
        float _2987 = _2959 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2989 = _2985 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2991 = precise::clamp(_2989, 0.0, 1.0);
        float _2993 = exp2(_2987);
        float _2995 = _2993 * _2991;
        float _2997 = _2981 * _2995;
        float _2999 = _2997 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3001 = _2997 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3003 = _2997 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_96.x = _2999;
        out.m_96.y = _3001;
        out.m_96.z = _3003;
    }
    out.m_98.x = _2915;
    out.m_98.y = _2917;
    out.m_98.z = _2919;
    if (_2899)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_61.x = 0.0;
    float _3005 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3005;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

