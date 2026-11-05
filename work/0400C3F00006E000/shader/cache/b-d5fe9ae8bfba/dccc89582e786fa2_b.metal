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
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c8 [[id(2)]];
    constant _16* vp_c9 [[id(3)]];
    constant _16* vp_c13 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture2d<float> vp_t_tcb_28 [[id(6)]];
    sampler vp_t_tcb_28Smplr [[id(7)]];
    texture2d<float> vp_t_tcb_24 [[id(8)]];
    sampler vp_t_tcb_24Smplr [[id(9)]];
    texture2d_array<float> vp_t_tcb_14 [[id(10)]];
    sampler vp_t_tcb_14Smplr [[id(11)]];
    texture2d_array<float> vp_t_tcb_16 [[id(12)]];
    sampler vp_t_tcb_16Smplr [[id(13)]];
    sampler vp_t_tcb_28Smplr_w [[id(14)]];
    sampler vp_t_tcb_24Smplr_w [[id(15)]];
    sampler vp_t_tcb_14Smplr_w [[id(16)]];
    constant dm_border_t* dm_border [[id(17)]];
};

struct main0_out
{
    float4 m_68 [[user(locn0)]];
    float4 m_60 [[user(locn1)]];
    float4 m_92 [[user(locn2)]];
    float4 m_78 [[user(locn3)]];
    float4 m_54 [[user(locn4)]];
    float4 m_80 [[user(locn5)]];
    float4 m_56 [[user(locn6)]];
    float4 m_64 [[user(locn7)]];
    float4 m_86 [[user(locn8)]];
    float4 m_90 [[user(locn9)]];
    float4 m_88 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_70 [[attribute(0)]];
    float4 m_72 [[attribute(1)]];
    float4 m_74 [[attribute(3)]];
    float4 m_49 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_84 [[attribute(7)]];
    float4 m_82 [[attribute(8)]];
    float4 m_58 [[attribute(9)]];
    float4 m_66 [[attribute(10)]];
    float4 m_62 [[attribute(12)]];
    float4 m_76 [[attribute(13)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2482 = false;
    bool _619 = false;
    bool _283 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _106 = in.m_49.w;
    float _108 = in.m_51.w;
    float _110 = trunc(_106);
    int _113 = int(_110);
    float _115 = -_108;
    float _117 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_54.y = _117;
    bool _121 = _113 >= 1;
    float _123 = 0.0;
    float _125 = _108;
    if (!_121)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _127 = _123;
    if (!_121)
    {
        out.m_56.x = 0.0;
    }
    int _129 = 0;
    if (!_121)
    {
        float _131 = _127 * 5.0;
        _129 = as_type<int>(_131);
    }
    int _133 = _129;
    int _135 = _133;
    if (!_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2777 = as_type<float>(_133);
        out.gl_Position.z = _2777;
    }
    if (!_121)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _137 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _139 = isnan(_108);
    bool _141 = _137 || _139;
    bool _143 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _145 = _141 || _143;
    float _147 = in.m_58.y;
    float _149 = float(_113);
    bool _151 = _117 >= _149;
    bool _153 = !_145;
    bool _155 = _151 || _153;
    if (_155)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _157 = _125;
    if (_155)
    {
        out.m_56.x = 0.0;
    }
    if (_155)
    {
        float _159 = _157 * 5.0;
        _135 = as_type<int>(_159);
    }
    int _161 = _135;
    out.m_60.y = _147;
    if (_155)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2836 = as_type<float>(_161);
        out.gl_Position.z = _2836;
    }
    if (_155)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _163 = in.m_58.x;
    float _165 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _167 = _117 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _169 = in.m_62.x;
    int _171 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _173 = _171 != 0;
    int _175 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _177 = _175 != 0;
    float _179 = in.m_62.y;
    float _181 = 1.0 / _149;
    float _183 = _167 * _165;
    float _185 = fma(_163, (*spvDescriptorSet0.vp_c9)._m0[20].x, _183);
    float _187 = _117 * _181;
    float _189 = _185 * 6.283185482025146484375;
    float _191 = floor(_185);
    out.m_64.x = _169;
    float _193 = _189 * 0.15915493667125701904296875;
    out.m_64.y = _179;
    int _195 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _197 = _195 != 0;
    float _199 = _193 * 6.283185482025146484375;
    float _201 = cos(_199);
    bool _203 = !_173;
    int _205 = _203 ? 0 : 1;
    int _207 = abs(_205);
    bool _209 = !_197;
    int _211 = _209 ? 0 : 1;
    float _213 = -_191;
    float _215 = _185 + _213;
    bool _217 = !_177;
    int _219 = _217 ? 0 : 1;
    int _221 = abs(_211);
    float _223 = -_215;
    float _225 = fma(_223, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _227 = float(_207);
    bool _229 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _231 = fma(_201, 0.5, 0.5);
    int _233 = abs(_219);
    float _235 = abs(_225);
    float _237 = _227 * _235;
    float _239 = -_231;
    float _241 = fma(_239, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _243 = _215 < 0.5;
    float _245 = float(_243);
    float _247 = float(_221);
    float _249 = float(_233);
    float _251 = -_245;
    float _253 = fma(_251, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _255 = fma(_247, _241, _237);
    float _257 = abs(_253);
    float _259 = fma(_249, _257, _255);
    bool _261 = !_229;
    float _263 = _179;
    float _265 = _169;
    float _281;
    if (!_261)
    {
        float _267 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _269 = _163 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _271 = fma(_269, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _273 = _271 * _267;
        float _275 = floor(_273);
        float _277 = -_275;
        float _279 = _273 + _277;
        _281 = _279;
        _283 = true;
    }
    else
    {
        _281 = _187;
    }
    _283 = false;
    float _285 = _281;
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _289 = _285 + _287;
    float _291 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _293 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _291;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _297 = _295 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _299 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _301 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _299;
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _305 = _303 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _307 = 1.0 / _293;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _311 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _309;
    float _313 = 1.0 / _297;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _317 = _285 + _315;
    bool _319 = _285 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _321 = isnan(_285);
    bool _323 = _319 || _321;
    bool _325 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _327 = _323 || _325;
    float _329 = float(_327);
    float _331 = 1.0 / _301;
    float _333 = _317 * _307;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _337 = _285 + _335;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _341 = _285 + _339;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _345 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _343;
    bool _347 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _349 = 1.0 / _305;
    float _351 = _289 * _313;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _355 = _285 + _353;
    bool _357 = _285 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _359 = isnan(_285);
    bool _361 = _357 || _359;
    bool _363 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _365 = _361 || _363;
    float _367 = float(_365);
    bool _369 = _285 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _371 = isnan(_285);
    bool _373 = _369 || _371;
    bool _375 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _377 = _373 || _375;
    float _379 = float(_377);
    float _381 = 1.0 / _311;
    float _383 = _337 * _331;
    bool _385 = _285 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _387 = isnan(_285);
    bool _389 = _385 || _387;
    bool _391 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _393 = _389 || _391;
    float _395 = float(_393);
    float _397 = -_379;
    float _399 = _397 + 1.0;
    float _401 = _341 * _349;
    bool _403 = _285 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _405 = isnan(_285);
    bool _407 = _403 || _405;
    bool _409 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _411 = _407 || _409;
    float _413 = float(_411);
    bool _415 = _285 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _417 = isnan(_285);
    bool _419 = _415 || _417;
    bool _421 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _423 = _419 || _421;
    float _425 = float(_423);
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _429 = _427 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _431 = -_413;
    float _433 = _431 + 1.0;
    float _435 = _355 * _381;
    float _437 = -_367;
    float _439 = _437 + 1.0;
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _443 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _441;
    float _445 = _379 * _433;
    float _447 = fma(_345, _333, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _449 = _413 * _439;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _453 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _451;
    float _455 = fma(_443, _333, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _457 = _395 * _399;
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _461 = _459 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _463 = fma(_453, _333, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _465 = -_395;
    float _467 = _465 + 1.0;
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _471 = _469 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _473 = fma(_429, _351, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _475 = fma(_461, _351, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _477 = _329 * _467;
    float _479 = -_329;
    float _481 = _479 + 1.0;
    float _483 = fma(_471, _351, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _485 = _425 * _481;
    float _487 = -_425;
    float _489 = _487 + 1.0;
    float _491 = _447 * _485;
    float _493 = _455 * _485;
    float _495 = _463 * _485;
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _499 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _497;
    float _501 = fma(_489, (*spvDescriptorSet0.vp_c9)._m0[143].y, _491);
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _505 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _503;
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _509 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _507;
    float _511 = fma(_499, _383, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _513 = fma(_489, (*spvDescriptorSet0.vp_c9)._m0[143].x, _495);
    float _515 = fma(_483, _477, _501);
    float _517 = fma(_505, _383, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _519 = fma(_509, _383, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _521 = fma(_489, (*spvDescriptorSet0.vp_c9)._m0[143].z, _493);
    float _523 = fma(_473, _477, _513);
    float _525 = fma(_511, _457, _515);
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _529 = _527 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _533 = _531 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _537 = _535 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _539 = fma(_529, _401, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _541 = fma(_517, _457, _523);
    float _543 = fma(_533, _401, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _545 = fma(_537, _401, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _547 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _549 = in.m_66.x;
    float _551 = in.m_66.y;
    float _553 = in.m_66.z;
    float _555 = fma(_475, _477, _521);
    float _557 = fma(_543, _445, _525);
    out.m_68.w = _547;
    float _559 = fma(_519, _457, _555);
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _563 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _561;
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _567 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _565;
    float _569 = fma(_539, _445, _541);
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _573 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _571;
    float _575 = fma(_563, _435, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _577 = fma(_567, _435, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _579 = fma(_545, _445, _559);
    float _581 = fma(_573, _435, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _583 = fma(_575, _449, _569);
    float _585 = fma(_577, _449, _557);
    float _587 = fma(_581, _449, _579);
    float _589 = fma(_367, (*spvDescriptorSet0.vp_c9)._m0[148].x, _583);
    float _591 = fma(_367, (*spvDescriptorSet0.vp_c9)._m0[148].y, _585);
    float _593 = fma(_367, (*spvDescriptorSet0.vp_c9)._m0[148].z, _587);
    float _595 = _589 * _549;
    float _597 = _591 * _551;
    float _599 = _593 * _553;
    bool _601 = !_347;
    float _617;
    if (!_601)
    {
        float _603 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _605 = _163 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _607 = fma(_605, (*spvDescriptorSet0.vp_c9)._m0[14].x, _117);
        float _609 = _607 * _603;
        float _611 = floor(_609);
        float _613 = -_611;
        float _615 = _609 + _613;
        _617 = _615;
        _619 = true;
    }
    else
    {
        _617 = _187;
    }
    _619 = false;
    float _621 = _617;
    float _623 = in.m_49.x;
    float _625 = in.m_49.y;
    float _627 = in.m_49.z;
    bool _629 = _147 > 0.5;
    float _631 = in.m_70.y;
    int _633 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _635 = _633 != 0;
    int _637 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _639 = _637 != 0;
    float _641 = in.m_72.x;
    float _643 = in.m_72.y;
    float _645 = in.m_72.z;
    float _647 = in.m_72.w;
    float _649 = in.m_74.x;
    float _651 = in.m_74.y;
    float _653 = in.m_74.z;
    float _655 = in.m_74.w;
    float _657 = in.m_76.x;
    float _659 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _661 = _659 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _663 = 1.0 / _661;
    float _665 = _625 + _631;
    float _667 = -_179;
    float _669 = _667 + 1.0;
    float _671 = _625 * _643;
    float _673 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _675 = _665 + _673;
    if (_635)
    {
        float _677 = _629 ? _669 : _179;
        _263 = _677;
    }
    float _679 = _263;
    float _681 = _625 * _651;
    bool _683 = _163 > 0.5;
    bool _685 = _683 && _639;
    float _687 = fma(_623, _641, _671);
    float _689 = _163 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _691 = fma(_623, _649, _681);
    float _693 = fma(_627, _645, _687);
    float _695 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _697 = fma(_627, _653, _691);
    float _699 = _147 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _701 = _693 + _647;
    float _703 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _705 = -_695;
    float _707 = fma(_689, 2.0, _705);
    float _709 = _697 + _655;
    float _711 = _695;
    if (!_639)
    {
        _711 = _169;
    }
    float _713 = _711;
    float _715 = _675 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _717 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _719 = _701 + _717;
    float _721 = _713;
    if (_685)
    {
        float _723 = -_169;
        float _725 = _723 + 1.0;
        _265 = _725;
    }
    float _727 = _265;
    float _729 = fma(_699, -2.0, _703);
    float _731 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _733 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _735 = _709 + _733;
    float _737 = fma(_719, (*spvDescriptorSet0.vp_c8)._m0[28].x, _715);
    if (_639)
    {
        _721 = _727;
    }
    float _739 = _721;
    float _741 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _743 = fma(_163, (*spvDescriptorSet0.vp_c9)._m0[78].z, _731);
    float _745 = fma(_735, (*spvDescriptorSet0.vp_c8)._m0[28].z, _737);
    float _747 = -_117;
    float _749 = fma(_747, (*spvDescriptorSet0.vp_c9)._m0[76].x, _707);
    float _751 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[78].w, _741);
    float _753 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].z, _743);
    float _755 = fma(_739, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    bool _757 = _745 >= 0.0;
    float _759 = fma(_679, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _761 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].w, _751);
    float _763 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[76].y, _729);
    float _765 = fma(_753, _755, _749);
    float _767 = _675 * _675;
    float _769 = -_763;
    float _771 = fma(_761, _759, _769);
    float _773 = _765 + 0.5;
    float _775 = fma(_719, _719, _767);
    float _777 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _779 = _777 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _781 = fma(_735, _735, _775);
    float _783 = _743;
    if (_757)
    {
        _783 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _785 = _783;
    float _787 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _789 = _787 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _791 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _793 = _791 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _795 = 1.0 / _779;
    float _797 = _771 + 0.5;
    int _799 = as_type<int>(_785);
    if (_757)
    {
        float _801 = _785 * 5.0;
        _799 = as_type<int>(_801);
    }
    int _803 = _799;
    out.m_78.x = _657;
    float _805 = _259 * _595;
    float _807 = _259 * _597;
    float _809 = rsqrt(_781);
    out.m_80.x = _773;
    out.m_80.y = _797;
    if (_757)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3907 = as_type<float>(_803);
        out.gl_Position.z = _3907;
    }
    float _811 = 1.0 / _789;
    if (_757)
    {
        out.m_56.x = 0.0;
    }
    float _813 = 1.0 / _793;
    float _815 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _817 = _815 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _819 = _675 * _809;
    float _821 = _719 * _809;
    if (_757)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _823 = -_819;
    float _825 = fma(_823, (*spvDescriptorSet0.vp_c9)._m0[18].w, _665);
    float _827 = -_821;
    float _829 = fma(_827, (*spvDescriptorSet0.vp_c9)._m0[18].w, _701);
    float _831 = _735 * _809;
    float _833 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _835 = _833 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _837 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _839 = _825 + _837;
    float _841 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _843 = _829 + _841;
    float _845 = -_831;
    float _847 = fma(_845, (*spvDescriptorSet0.vp_c9)._m0[18].w, _709);
    float _849 = 1.0 / _817;
    float _851 = _839 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _853 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _855 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _853;
    float _857 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _859 = _847 + _857;
    float _861 = _657 * 12.98980045318603515625;
    float _863 = fma(_843, (*spvDescriptorSet0.vp_c8)._m0[28].x, _851);
    float _865 = _259 * _599;
    float _867 = in.m_58.w;
    float _869 = fma(_859, (*spvDescriptorSet0.vp_c8)._m0[28].z, _863);
    float _871 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _873 = _871 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _875 = 1.0 / _835;
    float _877 = _855 * _795;
    float _879 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _881 = _879 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    bool _883 = _869 >= 0.0;
    float _885 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _887 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _885;
    float _889 = _881 * _663;
    float _891 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _893 = _621 + _891;
    float _895 = 1.0 / _873;
    float _897 = _887 * _811;
    float _899 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _901 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _899;
    float _903 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _905 = _903 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _907 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _909 = _907 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _911 = _901 * _849;
    float _913 = fma(_889, _893, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _915 = _905 * _813;
    float _917 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _919 = _621 + _917;
    float _921 = _909 * _875;
    float _923 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _925 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _923;
    float _927 = _875;
    if (_883)
    {
        _927 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _929 = _927;
    float _931 = fma(_867, 78.233001708984375, _861);
    float _933 = fma(_877, _919, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _935 = _621 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _937 = isnan(_621);
    bool _939 = _935 || _937;
    bool _941 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _943 = _939 || _941;
    float _945 = float(_943);
    float _947 = _925 * _895;
    float _949 = _931 * 0.15915493667125701904296875;
    int _951 = as_type<int>(_929);
    if (_883)
    {
        float _953 = _929 * 5.0;
        _951 = as_type<int>(_953);
    }
    int _955 = _951;
    bool _957 = _621 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _959 = isnan(_621);
    bool _961 = _957 || _959;
    bool _963 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _965 = _961 || _963;
    float _967 = float(_965);
    float _969 = -_945;
    float _971 = _969 + 1.0;
    float _973 = -_819;
    float _975 = fma(_973, (*spvDescriptorSet0.vp_c9)._m0[18].w, _675);
    float _977 = _949 * 6.283185482025146484375;
    float _979 = sin(_977);
    if (_883)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4193 = as_type<float>(_955);
        out.gl_Position.z = _4193;
    }
    float _981 = _967 * _971;
    bool _983 = _621 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _985 = isnan(_621);
    bool _987 = _983 || _985;
    bool _989 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _991 = _987 || _989;
    float _993 = float(_991);
    float _995 = -_967;
    float _997 = _995 + 1.0;
    if (_883)
    {
        out.m_56.x = 0.0;
    }
    float _999 = -_821;
    float _1001 = fma(_999, (*spvDescriptorSet0.vp_c9)._m0[18].w, _719);
    float _1003 = _975 * _975;
    if (_883)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1005 = in.m_58.z;
    bool _1007 = _621 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1009 = isnan(_621);
    bool _1011 = _1007 || _1009;
    bool _1013 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1015 = _1011 || _1013;
    float _1017 = float(_1015);
    float _1019 = -_993;
    float _1021 = _1019 + 1.0;
    bool _1023 = _621 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1025 = isnan(_621);
    bool _1027 = _1023 || _1025;
    bool _1029 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1031 = _1027 || _1029;
    float _1033 = float(_1031);
    float _1035 = fma(_1001, _1001, _1003);
    float _1037 = -_831;
    float _1039 = fma(_1037, (*spvDescriptorSet0.vp_c9)._m0[18].w, _735);
    float _1041 = _993 * _997;
    float _1043 = -_1017;
    float _1045 = _1043 + 1.0;
    float _1047 = _1017 * _1021;
    bool _1049 = _621 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1051 = isnan(_621);
    bool _1053 = _1049 || _1051;
    bool _1055 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1057 = _1053 || _1055;
    float _1059 = float(_1057);
    float _1061 = fma(_1039, _1039, _1035);
    float _1063 = -_1033;
    float _1065 = _1063 + 1.0;
    float _1067 = _1033 * _1045;
    float _1069 = -_665;
    float _1071 = _1069 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    bool _1073 = _621 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1075 = isnan(_621);
    bool _1077 = _1073 || _1075;
    bool _1079 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1081 = _1077 || _1079;
    float _1083 = float(_1081);
    float _1085 = _1059 * _1065;
    float _1087 = fma(_163, 78.233001708984375, _861);
    float _1089 = -_1059;
    float _1091 = _1089 + 1.0;
    float _1093 = -_701;
    float _1095 = _1093 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1097 = _1071 * _1071;
    float _1099 = _979 * 43758.546875;
    float _1101 = _1087 * 0.15915493667125701904296875;
    float _1103 = _1083 * _1091;
    float _1105 = -_1083;
    float _1107 = _1105 + 1.0;
    bool _1109 = _621 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1111 = isnan(_621);
    bool _1113 = _1109 || _1111;
    bool _1115 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1117 = _1113 || _1115;
    float _1119 = float(_1117);
    float _1121 = -_709;
    float _1123 = _1121 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1125 = fma(_1095, _1095, _1097);
    float _1127 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1129 = _621 + _1127;
    float _1131 = fma(_1005, 78.233001708984375, _861);
    float _1133 = floor(_1099);
    float _1135 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1137 = _621 + _1135;
    float _1139 = _1119 * _1107;
    float _1141 = fma(_897, _1129, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1143 = fma(_147, 78.233001708984375, _861);
    float _1145 = fma(_915, _1137, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1147 = _933 * _1139;
    float _1149 = -_1119;
    float _1151 = _1149 + 1.0;
    float _1153 = _1101 * 6.283185482025146484375;
    float _1155 = sin(_1153);
    float _1157 = _1131 * 0.15915493667125701904296875;
    float _1159 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1161 = _621 + _1159;
    float _1163 = fma(_1151, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1147);
    float _1165 = _1143 * 0.15915493667125701904296875;
    float _1167 = _865 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1169 = fma(_911, _1161, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1171 = fma(_913, _1103, _1163);
    float _1173 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1175 = _621 + _1173;
    float _1177 = fma(_1123, _1123, _1125);
    float _1179 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1181 = _621 + _1179;
    float _1183 = _1157 * 6.283185482025146484375;
    float _1185 = sin(_1183);
    float _1187 = fma(_1141, _1085, _1171);
    float _1189 = fma(_921, _1181, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1191 = -_1133;
    float _1193 = _1099 + _1191;
    float _1195 = fma(_947, _1175, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1197 = in.m_82.x;
    float _1199 = in.m_82.y;
    float _1201 = in.m_82.z;
    float _1203 = fma(_1145, _1067, _1187);
    float _1205 = rsqrt(_1177);
    float _1207 = fma(_1193, 0.5, _187);
    float _1209 = precise::clamp(_1207, 0.0, 1.0);
    float _1211 = _1155 * 43758.546875;
    float _1213 = fma(_1169, _1047, _1203);
    float _1215 = -_1209;
    float _1217 = fma(_1215, _1209, 1.0);
    float _1219 = fma(_1189, _1041, _1213);
    float _1221 = _1165 * 6.283185482025146484375;
    float _1223 = sin(_1221);
    float _1225 = _1185 * 43758.546875;
    float _1227 = _805 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1229 = fma(_1195, _981, _1219);
    float _1231 = fma(_945, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1229);
    float _1233 = _1095 * _1205;
    float _1235 = _1123 * _1205;
    float _1237 = _1071 * _1205;
    float _1239 = sqrt(_1061);
    float _1241 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1243 = _1233 * _1241;
    float _1245 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1247 = _1235 * _1245;
    float _1249 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1251 = _1237 * _1249;
    float _1253 = _1217 * _1197;
    float _1255 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1257 = -_1243;
    float _1259 = fma(_1235, _1255, _1257);
    float _1261 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1263 = -_1247;
    float _1265 = fma(_1237, _1261, _1263);
    float _1267 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1269 = -_1251;
    float _1271 = fma(_1233, _1267, _1269);
    float _1273 = floor(_1225);
    float _1275 = _1259 * _1259;
    float _1277 = _1223 * 43758.546875;
    float _1279 = _1217 * _1199;
    float _1281 = _1217 * _1201;
    float _1283 = fma(_1265, _1265, _1275);
    float _1285 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1253);
    float _1287 = floor(_1277);
    float _1289 = fma(_1271, _1271, _1283);
    float _1291 = _809 * _1239;
    float _1293 = _807 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1295 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1279);
    float _1297 = _1291 * _1227;
    float _1299 = _1291 * _1293;
    float _1301 = rsqrt(_1289);
    float _1303 = -_1273;
    float _1305 = _1225 + _1303;
    float _1307 = _1285 * _1297;
    float _1309 = _1295 * _1299;
    float _1311 = _1291 * _1167;
    float _1313 = fma(_1305, 0.4000000059604644775390625, 0.100000001490116119384765625);
    float _1315 = floor(_1211);
    float _1317 = -_1287;
    float _1319 = _1277 + _1317;
    float _1321 = _117 * _1313;
    float _1323 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1281);
    float _1325 = fma(_1319, 6.283185482025146484375, _1321);
    float _1327 = _1265 * _1301;
    float _1329 = _1271 * _1301;
    float _1331 = _1323 * _1311;
    float _1333 = _1325 * 0.15915493667125701904296875;
    float _1335 = _1237 * _1327;
    float _1337 = _1233 * _1329;
    float _1339 = fma(_1319, 2.0, -1.0);
    float _1341 = -_1315;
    float _1343 = _1211 + _1341;
    float _1345 = _1259 * _1301;
    float _1347 = _1333 * 6.283185482025146484375;
    float _1349 = sin(_1347);
    float _1351 = fma(_1305, 0.60000002384185791015625, -0.300000011920928955078125);
    float _1353 = fma(_1343, 6.283185482025146484375, _1321);
    float _1355 = _1235 * _1345;
    float _1357 = -_1335;
    float _1359 = fma(_1233, _1345, _1357);
    float _1361 = fma(_1343, 0.60000002384185791015625, -0.300000011920928955078125);
    float _1363 = _1353 * 0.15915493667125701904296875;
    float _1365 = -_1355;
    float _1367 = fma(_1237, _1329, _1365);
    float _1369 = _1309 * _1359;
    float _1371 = -_1337;
    float _1373 = fma(_1235, _1327, _1371);
    float _1375 = _1309 * _1367;
    float _1377 = fma(_1307, _1329, _1369);
    float _1379 = _1363 * 6.283185482025146484375;
    float _1381 = sin(_1379);
    float _1383 = fma(_1307, _1327, _1375);
    float _1385 = fma(_1331, _1235, _1377);
    float _1387 = fma(_1331, _1233, _1383);
    float _1389 = _709 + _1385;
    float _1391 = _701 + _1387;
    float _1393 = fma(_1231, _1351, _1389);
    float _1395 = fma(_1231, _1361, _1391);
    float _1397 = fma(_1349, 0.039999999105930328369140625, _1393);
    float _1399 = fma(_1381, 0.039999999105930328369140625, _1395);
    float _1401 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1403 = _1397 + _1401;
    float _1405 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1407 = _1399 + _1405;
    float _1409 = _1403 * _1403;
    float _1411 = fma(_1407, _1407, _1409);
    float _1413 = sqrt(_1411);
    bool _1415 = _1413 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1417 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1419 = _1413 + _1417;
    float _1421 = _1229;
    float _1423 = _1397;
    float _1425 = _1399;
    if (_1415)
    {
        float _1427 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1421 = _1427;
    }
    float _1429 = _1421;
    float _1431 = _1429;
    if (_1415)
    {
        float _1433 = _1419 * _1429;
        _1431 = _1433;
    }
    float _1435 = _1431;
    float _1437 = _1309 * _1373;
    float _1439 = _1435;
    if (_1415)
    {
        float _1441 = _1435 * 0.15915493667125701904296875;
        _1439 = _1441;
    }
    float _1443 = _1439;
    float _1445 = fma(_1307, _1345, _1437);
    float _1447 = _1437;
    float _1449 = _1445;
    if (_1415)
    {
        float _1451 = _1443 * 6.283185482025146484375;
        float _1453 = sin(_1451);
        _1447 = _1453;
    }
    float _1455 = _1447;
    float _1457 = fma(_1331, _1237, _1445);
    float _1459 = _665 + _1457;
    float _1461 = _1457;
    if (_1415)
    {
        float _1463 = rsqrt(_1411);
        _1461 = _1463;
    }
    float _1465 = _1461;
    float _1467 = fma(_1231, _1339, _1459);
    float _1469 = _1467;
    if (_1415)
    {
        float _1471 = _1467 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1449 = _1471;
    }
    float _1473 = _1449;
    float _1475 = _1473;
    if (_1415)
    {
        float _1477 = fma(_1455, _1473, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1475 = _1477;
    }
    float _1479 = _1475;
    float _1481 = _1465;
    if (_1415)
    {
        float _1483 = _1465 * _1479;
        _1481 = _1483;
    }
    float _1485 = _1481;
    if (_1415)
    {
        float _1487 = fma(_1403, _1485, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1423 = _1487;
    }
    float _1489 = _1423;
    if (_1415)
    {
        float _1491 = fma(_1407, _1485, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1425 = _1491;
    }
    float _1493 = _1425;
    float _1495 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _1497 = _1489 + _1495;
    float _1499 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _1501 = _1493 + _1499;
    float _1503 = fma(_1497, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1505 = fma(_1501, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _4990 = float2(_1505, _1503);
    float _1507 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_4990, float2(0.0), isnan(_4990)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_4990, float2(0.0), isnan(_4990)), level(0.0)).x;
    float _1509 = fma(_1507, 100.0, _665);
    float _1511 = -_819;
    float _1513 = fma(_1511, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1509);
    float _1515 = _1513 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1517 = fma(_829, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1515);
    float _1519 = fma(_847, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1517);
    float _1521 = _1513 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1523 = _1519 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1525 = fma(_829, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1521);
    float _1527 = 1.0 / _1523;
    float _1529 = fma(_847, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1525);
    float _1531 = _1529 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1533 = _1531 + _1523;
    float _1535 = _1533 * _1527;
    float _1537 = _1535 * 0.5;
    float _1539 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1541 = fma(_1537, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1539);
    float _1543 = 1.0 / _1541;
    float _1545 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _1547 = _1513 + _1545;
    float _1549 = _1547 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1551 = _1547 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1553 = fma(_829, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1549);
    float _1555 = fma(_829, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1551);
    float _1557 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1559 = _1543 * _1557;
    float _1561 = fma(_847, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1553);
    float _1563 = fma(_847, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1555);
    bool _1565 = _1559 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1567 = _1561 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _1569 = _1559 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1571 = _1563 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    bool _1573 = !_1565;
    int _1575 = _1573 ? 0 : 1;
    float _1577 = trunc(_1571);
    int _1579 = int(_1577);
    int _1581 = 2;
    if (!_1565)
    {
        _1581 = 1;
    }
    int _1583 = _1581;
    int _1585 = _1583;
    if (!_1569)
    {
        _1585 = _1575;
    }
    int _1587 = _1585;
    float _1589 = trunc(_1567);
    int _1591 = int(_1589);
    int _1593 = _1587 << 6;
    int _1595 = _1593 + 96;
    uint _1598 = uint(int(uint(_1595) >> uint(2)));
    uint _1600 = uint(int(uint(int(_1598)) >> uint(2)));
    int _1602 = int(_1598) & 3;
    float _1604 = (*spvDescriptorSet0.vp_c15)._m0[int(_1600)][_1602];
    int _1606 = int(_1598) + 1;
    uint _1608 = uint(int(uint(_1606) >> uint(2)));
    int _1610 = _1606 & 3;
    float _1612 = (*spvDescriptorSet0.vp_c15)._m0[int(_1608)][_1610];
    int _1614 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1616 = _1579 + _1614;
    int _1618 = _1616 + 1;
    int _1620 = _1593 + 104;
    uint _1622 = uint(int(uint(_1620) >> uint(2)));
    uint _1624 = uint(int(uint(int(_1622)) >> uint(2)));
    int _1626 = int(_1622) & 3;
    float _1628 = (*spvDescriptorSet0.vp_c15)._m0[int(_1624)][_1626];
    int _1630 = int(_1622) + 1;
    uint _1632 = uint(int(uint(_1630) >> uint(2)));
    int _1634 = _1630 & 3;
    float _1636 = (*spvDescriptorSet0.vp_c15)._m0[int(_1632)][_1634];
    int _1638 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1640 = _1591 + _1638;
    int _1642 = _1640 + 1;
    int _1644 = _1642 | _1618;
    int _1646 = _1593 + 48;
    uint _1648 = uint(int(uint(_1646) >> uint(2)));
    uint _1650 = uint(int(uint(int(_1648)) >> uint(2)));
    int _1652 = int(_1648) & 3;
    float _1654 = (*spvDescriptorSet0.vp_c15)._m0[int(_1650)][_1652];
    int _1656 = int(_1648) + 1;
    uint _1658 = uint(int(uint(_1656) >> uint(2)));
    int _1660 = _1656 & 3;
    float _1662 = (*spvDescriptorSet0.vp_c15)._m0[int(_1658)][_1660];
    bool _1664 = _1642 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1666 = _1644 < 0;
    bool _1668 = _1666 || _1664;
    int _1670 = _1593 + 64;
    uint _1672 = uint(int(uint(_1670) >> uint(2)));
    uint _1674 = uint(int(uint(int(_1672)) >> uint(2)));
    int _1676 = int(_1672) & 3;
    float _1678 = (*spvDescriptorSet0.vp_c15)._m0[int(_1674)][_1676];
    int _1680 = int(_1672) + 1;
    uint _1682 = uint(int(uint(_1680) >> uint(2)));
    int _1684 = _1680 & 3;
    float _1686 = (*spvDescriptorSet0.vp_c15)._m0[int(_1682)][_1684];
    bool _1688 = _1618 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1690 = _1688 || _1668;
    int _1692 = _1593 + 56;
    uint _1694 = uint(int(uint(_1692) >> uint(2)));
    uint _1696 = uint(int(uint(int(_1694)) >> uint(2)));
    int _1698 = int(_1694) & 3;
    float _1700 = (*spvDescriptorSet0.vp_c15)._m0[int(_1696)][_1698];
    int _1702 = int(_1694) + 1;
    uint _1704 = uint(int(uint(_1702) >> uint(2)));
    int _1706 = _1702 & 3;
    float _1708 = (*spvDescriptorSet0.vp_c15)._m0[int(_1704)][_1706];
    int _1710 = _1642;
    int _1712 = _1618;
    float _1714 = as_type<float>(_1587);
    if (!_1690)
    {
        int _1716 = _1618 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1718 = _1716 + _1642;
        _1710 = _1718;
    }
    int _1720 = _1710;
    int _1722 = _1593 + 72;
    uint _1724 = uint(int(uint(_1722) >> uint(2)));
    uint _1726 = uint(int(uint(int(_1724)) >> uint(2)));
    int _1728 = int(_1724) & 3;
    float _1730 = (*spvDescriptorSet0.vp_c15)._m0[int(_1726)][_1728];
    int _1732 = int(_1724) + 1;
    uint _1734 = uint(int(uint(_1732) >> uint(2)));
    int _1736 = _1732 & 3;
    float _1738 = (*spvDescriptorSet0.vp_c15)._m0[int(_1734)][_1736];
    if (!_1690)
    {
        int _1740 = _1720 << 2;
        _1712 = _1740;
    }
    int _1742 = _1712;
    float _1744 = _1547 * _1612;
    int _1746 = as_type<int>(_1612);
    int _1748 = as_type<int>(_1744);
    if (!_1690)
    {
        uint _1750 = uint(int(uint(_1720) >> uint(2)));
        _1746 = int(_1750);
    }
    int _1752 = _1746;
    float _1754 = fma(_829, _1604, _1744);
    if (!_1690)
    {
        int _1756 = 12 & _1742;
        _1748 = _1756;
    }
    int _1758 = _1748;
    float _1760 = fma(_847, _1628, _1754);
    float _1762 = _1628;
    if (!_1690)
    {
        int _1764 = _1752 << 4;
        int _1766 = _1764 + _1758;
        _1762 = as_type<float>(_1766);
    }
    float _1768 = _1762;
    float _1770 = _1760 + _1636;
    int _1772 = _1593 + 80;
    uint _1774 = uint(int(uint(_1772) >> uint(2)));
    uint _1776 = uint(int(uint(int(_1774)) >> uint(2)));
    int _1778 = int(_1774) & 3;
    float _1780 = (*spvDescriptorSet0.vp_c15)._m0[int(_1776)][_1778];
    int _1782 = int(_1774) + 1;
    uint _1784 = uint(int(uint(_1782) >> uint(2)));
    int _1786 = _1782 & 3;
    float _1788 = (*spvDescriptorSet0.vp_c15)._m0[int(_1784)][_1786];
    float _1790 = _1547 * _1662;
    float _1792 = 1.0 / _1770;
    float _1794 = fma(_829, _1654, _1790);
    float _1796 = _1768;
    float _1798 = _1770;
    if (!_1690)
    {
        int _1800 = as_type<int>(_1768) + 400;
        uint _1802 = uint(int(uint(_1800) >> uint(2)));
        uint _1804 = uint(int(uint(int(_1802)) >> uint(2)));
        int _1806 = int(_1802) & 3;
        float _1808 = (*spvDescriptorSet0.vp_c15)._m0[int(_1804)][_1806];
        _1796 = _1808;
    }
    float _1810 = _1796;
    float _1812 = _1547 * _1686;
    float _1814 = fma(_829, _1678, _1812);
    int _1816 = _1593 + 88;
    uint _1818 = uint(int(uint(_1816) >> uint(2)));
    uint _1820 = uint(int(uint(int(_1818)) >> uint(2)));
    int _1822 = int(_1818) & 3;
    float _1824 = (*spvDescriptorSet0.vp_c15)._m0[int(_1820)][_1822];
    int _1826 = int(_1818) + 1;
    uint _1828 = uint(int(uint(_1826) >> uint(2)));
    int _1830 = _1826 & 3;
    float _1832 = (*spvDescriptorSet0.vp_c15)._m0[int(_1828)][_1830];
    float _1834 = _1812;
    if (!_1690)
    {
        float _1836 = floor(_1571);
        _1834 = _1836;
    }
    float _1838 = _1834;
    float _1840 = fma(_847, _1700, _1794);
    float _1842 = _1840 + _1708;
    float _1844 = _1794;
    if (!_1690)
    {
        float _1846 = floor(_1567);
        _1844 = _1846;
    }
    float _1848 = _1844;
    float _1850 = fma(_847, _1730, _1814);
    float _1852 = _1842 * _1792;
    float _1854 = _1850 + _1738;
    bool _1856 = _1852 >= 0.0;
    float _1858 = fma(_829, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1860 = _1854 * _1792;
    float _1862 = _1838;
    float _1864 = _1860;
    if (!_1690)
    {
        float _1866 = -_1838;
        float _1868 = _1571 + _1866;
        _1862 = _1868;
    }
    float _1870 = _1862;
    float _1872 = floor(_1858);
    bool _1874 = _1852 <= 1.0;
    bool _1876 = _1874 && _1856;
    float _1878 = fma(_847, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    if (!_1690)
    {
        float _1880 = -_1848;
        float _1882 = _1567 + _1880;
        _1798 = _1882;
    }
    float _1884 = _1798;
    bool _1886 = _1860 >= 0.0;
    bool _1888 = _1886 && _1876;
    float _1890 = floor(_1878);
    bool _1892 = _1860 <= 1.0;
    bool _1894 = _1892 && _1888;
    float _1896 = _1547 * _1788;
    float _1898 = fma(_829, _1780, _1896);
    float _1900 = -_1872;
    float _1902 = _1858 + _1900;
    float _1904 = _1810;
    if (!_1690)
    {
        float _1906 = rint(_1810);
        float _1908 = precise::max(_1906, 0.0);
        uint _1910 = uint(_1908);
        uint _1912 = clamp(_1910, 0u, 65535u);
        _1904 = as_type<float>(_1912);
    }
    float _1914 = _1904;
    if (_1894)
    {
        float _1916 = float(_1587);
        _1714 = _1916;
    }
    float _1918 = _1714;
    float _1920 = -_1890;
    float _1922 = _1878 + _1920;
    float _1924 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_1894)
    {
        float _1926 = rint(_1918);
        float _1928 = precise::max(_1926, 0.0);
        uint _1930 = uint(_1928);
        uint _1932 = clamp(_1930, 0u, 65535u);
        _1924 = as_type<float>(_1932);
    }
    float _1934 = _1924;
    float2 _5713 = float2(_1902, _1922);
    float _1936 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5713, float2(0.0), isnan(_5713)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5713, float2(0.0), isnan(_5713)), level(0.0)).x;
    float _1938 = fma(_847, _1824, _1898);
    float _1940 = _1938 + _1832;
    float _1942 = _1940 * _1792;
    float _1944 = _1571;
    if (!_1690)
    {
        float3 _5739 = float3(_1884, _1870, float(as_type<int>(_1914)));
        float3 _5743 = select(_5739, float3(0.0), isnan(_5739));
        float _1946 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5743.xy, uint(rint(_5743.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5743.xy, uint(rint(_5743.z)), level(0.0)).x;
        _1944 = _1946;
    }
    float _1948 = _1944;
    float _1950 = _1934;
    if (_1894)
    {
        float3 _5758 = float3(_1852, _1860, float(as_type<int>(_1934)));
        float3 _5760 = select(_5758, float3(0.0), isnan(_5758));
        float _1952 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5760.xy, uint(rint(_5760.z)), _1942, level(0.0));
        _1950 = _1952;
    }
    float _1954 = _1950;
    float _1956 = in.m_84.x;
    float _1958 = in.m_84.y;
    float _1960 = in.m_84.z;
    bool _1962 = _1279 != 0.0;
    bool _1964 = isnan(_1279);
    bool _1966 = _1962 || _1964;
    bool _1968 = isnan(0.0);
    bool _1970 = _1966 || _1968;
    float _1972 = _1824;
    if (_1415)
    {
        float _1974 = _1443 * 6.283185482025146484375;
        float _1976 = cos(_1974);
        _1972 = _1976;
    }
    float _1978 = _1972;
    float _1980 = -_821;
    float _1982 = fma(_1980, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1493);
    out.m_68.w = _547;
    bool _1984 = _1253 == 0.0;
    bool _1986 = !_1970;
    bool _1988 = _1984 && _1986;
    bool _1990 = _1281 == 0.0;
    bool _1992 = _1990 && _1988;
    float _1994 = -_831;
    float _1996 = fma(_1994, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1489);
    float _1998 = _1996;
    if (_1415)
    {
        float _2000 = _1978 + (-1.0);
        _1864 = _2000;
    }
    float _2002 = _1864;
    float _2004 = _2002;
    if (_1415)
    {
        float _2006 = _2002 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2004 = _2006;
    }
    float _2008 = _2004;
    float _2010 = _1958;
    float _2012 = _1956;
    float _2014 = _1960;
    if (!_1992)
    {
        float _2016 = fma(_1279, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1958);
        _2010 = _2016;
    }
    float _2018 = _2010;
    if (!_1992)
    {
        float _2020 = fma(_1253, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1956);
        _2012 = _2020;
    }
    float _2022 = _2012;
    if (!_1992)
    {
        float _2024 = fma(_1281, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1960);
        _2014 = _2024;
    }
    float _2026 = _2014;
    bool _2028 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2030 = isnan(0.5);
    bool _2032 = _2028 || _2030;
    bool _2034 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2036 = _2032 || _2034;
    float _2038 = _1367 * _2018;
    float _2040 = _1373 * _2018;
    if (_1415)
    {
        float _2042 = fma(_1467, _1978, _2008);
        _1469 = _2042;
    }
    float _2044 = _1469;
    float _2046 = _1359 * _2018;
    float _2048 = fma(_1327, _2022, _2038);
    float _2050 = fma(_1345, _2022, _2040);
    float _2052 = fma(_1507, 100.0, _2044);
    float _2054 = fma(_1329, _2022, _2046);
    float _2056 = fma(_1233, _2026, _2048);
    float _2058 = fma(_1237, _2026, _2050);
    float _2060 = -_819;
    float _2062 = fma(_2060, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2052);
    float _2064 = fma(_1235, _2026, _2054);
    float _2066 = _2052;
    float _2068 = _2062;
    if (_2036)
    {
        _2066 = _1982;
    }
    float _2070 = _2066;
    float _2072 = _2070;
    float _2074 = _1954;
    if (!_2036)
    {
        float _2076 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2078 = _1513 + _2076;
        float _2080 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2082 = -_709;
        float _2084 = _2082 + _1489;
        float _2086 = -_665;
        float _2088 = _2086 + _2044;
        float _2090 = _2078 * _2078;
        float _2092 = -_701;
        float _2094 = _2092 + _1493;
        float _2096 = fma(_843, _843, _2090);
        float _2098 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2100 = fma(_859, _859, _2096);
        float _2102 = 1.0 / _1291;
        float _2104 = sqrt(_2100);
        float _2106 = _2098 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2108 = precise::min(_2104, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2110 = _2108 * _2080;
        float _2112 = _2110 * _2102;
        float _2114 = _2106 * _2112;
        float _2116 = _2084 * _2112;
        float _2118 = fma(_2088, _2114, _1513);
        float _2120 = fma(_2094, _2114, _829);
        float _2122 = fma(_2106, _2116, _847);
        _2068 = _2118;
        _2072 = _2120;
        _1998 = _2122;
    }
    float _2124 = _2068;
    float _2126 = _2072;
    float _2128 = _1998;
    float _2130 = abs(_1559);
    float _2132 = log2(_2130);
    float _2134 = _2124 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2136 = _2124 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2138 = _2124 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2140 = _2124 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2142 = fma(_2126, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2134);
    float _2144 = fma(_2126, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2136);
    float _2146 = fma(_2126, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2138);
    float _2148 = fma(_2126, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2140);
    float _2150 = fma(_2128, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2142);
    float _2152 = fma(_2128, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2144);
    float _2154 = fma(_2128, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2146);
    float _2156 = fma(_2128, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2148);
    float _2158 = _2150 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2160 = _2152 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2162 = _2154 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2164 = _2132 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2166 = _2158 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2168 = _2158 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2170 = _2158 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2172 = _2158 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2174 = fma(_2160, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2166);
    float _2176 = exp2(_2164);
    float _2178 = fma(_2160, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2168);
    float _2180 = fma(_2160, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2170);
    float _2182 = fma(_2160, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2172);
    float _2184 = _2156 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2186 = fma(_2162, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2174);
    float _2188 = fma(_2162, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2178);
    float _2190 = fma(_2162, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2180);
    float _2192 = fma(_2162, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2182);
    float _2194 = fma(_2184, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2186);
    float _2196 = fma(_2184, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2188);
    float _2198 = fma(_2184, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2190);
    float _2200 = fma(_2184, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2192);
    bool _2202 = _1559 <= 8000.0;
    bool _2204 = isnan(_1559);
    bool _2206 = _2202 || _2204;
    bool _2208 = isnan(8000.0);
    bool _2210 = _2206 || _2208;
    float _2212 = float(_2210);
    float _2214 = fma(_2176, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2216 = precise::clamp(_2214, 0.0, 1.0);
    float _2218 = _2162;
    if (_1690)
    {
        _2218 = 1.0;
    }
    float _2220 = _2218;
    out.gl_Position.x = _2194;
    out.gl_Position.y = _2196;
    out.gl_Position.z = _2198;
    out.gl_Position.w = _2200;
    float _2222 = fma(_2216, -2.0, 3.0);
    float _2224 = _2216 * _2216;
    float _2226 = _2224 * _2222;
    float _2228 = -_2226;
    float _2230 = _2228 + 1.0;
    float _2232 = fma(_2230, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2226);
    float _2234 = _2212 * _2232;
    float _2236 = _2220;
    if (!_1690)
    {
        int _2238 = _1720 << 4;
        int _2240 = _2238 + 2048;
        uint _2242 = uint(int(uint(_2240) >> uint(2)));
        uint _2244 = uint(int(uint(int(_2242)) >> uint(2)));
        int _2246 = int(_2242) & 3;
        float _2248 = (*spvDescriptorSet0.vp_c15)._m0[int(_2244)][_2246];
        int _2250 = int(_2242) + 1;
        uint _2252 = uint(int(uint(_2250) >> uint(2)));
        int _2254 = _2250 & 3;
        float _2256 = (*spvDescriptorSet0.vp_c15)._m0[int(_2252)][_2254];
        int _2258 = _2240 + 8;
        uint _2260 = uint(int(uint(_2258) >> uint(2)));
        uint _2262 = uint(int(uint(int(_2260)) >> uint(2)));
        int _2264 = int(_2260) & 3;
        float _2266 = (*spvDescriptorSet0.vp_c15)._m0[int(_2262)][_2264];
        int _2268 = int(_2260) + 1;
        uint _2270 = uint(int(uint(_2268) >> uint(2)));
        int _2272 = _2268 & 3;
        float _2274 = (*spvDescriptorSet0.vp_c15)._m0[int(_2270)][_2272];
        float _2276 = _1547 * _2256;
        float _2278 = fma(_829, _2248, _2276);
        float _2280 = fma(_847, _2266, _2278);
        float _2282 = _2280 + _2274;
        float _2284 = precise::clamp(_2282, 0.0, 1.0);
        float _2286 = -_2284;
        float _2288 = _2286 + _1948;
        float _2290 = fma(_2288, 500.0, 1.5);
        float _2292 = exp2(_2290);
        float _2294 = 0.0 + _2292;
        float _2296 = precise::clamp(_2294, 0.0, 1.0);
        _2236 = _2296;
    }
    float _2298 = _2236;
    float _2300 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2302 = _2124 + _2300;
    float _2304 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2306 = _2126 + _2304;
    float _2308 = _2234 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2310 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2312 = _2128 + _2310;
    float _2314 = _2302 * _2302;
    out.m_86.x = _2056;
    out.m_86.y = _2058;
    out.m_86.z = _2064;
    float _2316 = fma(_2306, _2306, _2314);
    float _2318 = -_1936;
    float _2320 = _2318 + 1.0;
    float _2322 = _2314;
    float _2324 = _2316;
    float _2326 = _2312;
    if (!_1894)
    {
        _2322 = 1.0;
    }
    float _2328 = _2322;
    float _2330 = _2328;
    if (_1894)
    {
        bool _2332 = _1954 >= _1942;
        bool _2334 = isnan(_1954);
        bool _2336 = _2332 || _2334;
        bool _2338 = isnan(_1942);
        bool _2340 = _2336 || _2338;
        float _2342 = float(_2340);
        _2330 = _2342;
    }
    float _2344 = _2330;
    float _2346 = _2320 * _2308;
    float _2348 = precise::clamp(_2346, 0.0, 1.0);
    float _2350 = fma(_2312, _2312, _2316);
    float _2352 = _2344 * _2298;
    float _2354 = -_2348;
    float _2356 = fma(_2354, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2358 = sqrt(_2350);
    float _2360 = -_2352;
    float _2362 = fma(_2360, _2356, 1.0);
    float _2364 = precise::clamp(_2362, 0.0, 1.0);
    float _2366 = _2364 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_88.x = _2366;
    bool _2368 = _2358 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2370 = isnan(_2358);
    bool _2372 = _2368 || _2370;
    bool _2374 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2376 = _2372 || _2374;
    float _2378 = _2352;
    float _2380 = _2364;
    float _2382 = _2350;
    if (!_2376)
    {
        _2324 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2384 = _2324;
    float _2386 = _2384;
    float _2388 = _2384;
    if (!_2376)
    {
        _2378 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2390 = _2378;
    float _2392 = _2390;
    float _2394 = _2390;
    if (!_2376)
    {
        _2326 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2396 = _2326;
    float _2398 = _2396;
    float _2400 = _2396;
    if (!_2376)
    {
        _2380 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2402 = _2380;
    float _2404 = _2402;
    float _2406 = _2402;
    if (!_2376)
    {
        _2074 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2408 = _2074;
    float _2410 = _2408;
    float _2412 = _2408;
    if (!_2376)
    {
        _2382 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2414 = _2382;
    bool _2416 = !_2376;
    float _2418 = _2414;
    float _2420 = _2414;
    if (!_2416)
    {
        bool _2422 = _2358 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2424 = isnan(_2358);
        bool _2426 = _2422 || _2424;
        bool _2428 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2430 = _2426 || _2428;
        if (!_2430)
        {
            float _2432 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2434 = _2358 + _2432;
            float _2436 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2438 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2436;
            float _2440 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2442 = _2440 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2444 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2446 = _2444 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2448 = 1.0 / _2438;
            float _2450 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2452 = _2450 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2454 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2456 = _2454 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2458 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2460 = _2458 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2462 = _2434 * _2448;
            float _2464 = precise::clamp(_2462, 0.0, 1.0);
            float _2466 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2468 = _2466 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2470 = fma(_2464, _2442, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2472 = fma(_2464, _2446, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2474 = fma(_2464, _2468, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2476 = fma(_2464, _2452, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2478 = fma(_2464, _2456, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2480 = fma(_2464, _2460, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2394 = _2470;
            _2412 = _2478;
            _2388 = _2472;
            _2406 = _2476;
            _2400 = _2474;
            _2420 = _2480;
            _2482 = true;
        }
        else
        {
            bool _2484 = _2358 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2486 = isnan(_2358);
            bool _2488 = _2484 || _2486;
            bool _2490 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2492 = _2488 || _2490;
            if (!_2492)
            {
                _2386 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2494 = _2386;
            _2388 = _2494;
            if (!_2492)
            {
                _2392 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2496 = _2392;
            _2394 = _2496;
            if (!_2492)
            {
                _2398 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2498 = _2398;
            _2400 = _2498;
            if (!_2492)
            {
                _2404 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2500 = _2404;
            _2406 = _2500;
            if (!_2492)
            {
                _2410 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2502 = _2410;
            _2412 = _2502;
            if (!_2492)
            {
                _2418 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2504 = _2418;
            bool _2506 = !_2492;
            _2420 = _2504;
            if (!_2506)
            {
                bool _2508 = _2358 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2510 = isnan(_2358);
                bool _2512 = _2508 || _2510;
                bool _2514 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2516 = _2512 || _2514;
                if (!_2516)
                {
                    float _2518 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2520 = _2358 + _2518;
                    float _2522 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2524 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2522;
                    float _2526 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2528 = _2526 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2530 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2532 = _2530 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2534 = 1.0 / _2524;
                    float _2536 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2538 = _2536 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2540 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2542 = _2540 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2544 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2546 = _2544 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2548 = _2520 * _2534;
                    float _2550 = precise::clamp(_2548, 0.0, 1.0);
                    float _2552 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2554 = _2552 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2556 = fma(_2550, _2528, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2558 = fma(_2550, _2532, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2560 = fma(_2550, _2554, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2562 = fma(_2550, _2538, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2564 = fma(_2550, _2542, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2566 = fma(_2550, _2546, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2394 = _2556;
                    _2412 = _2564;
                    _2388 = _2558;
                    _2406 = _2562;
                    _2400 = _2560;
                    _2420 = _2566;
                    _2482 = true;
                }
                else
                {
                    _2394 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2412 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2388 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2406 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2400 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2420 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2482 = false;
    float _2568 = _2394;
    float _2570 = _2412;
    float _2572 = _2388;
    float _2574 = _2406;
    float _2576 = _2400;
    float _2578 = _2420;
    float _2580 = fma(_2058, -0.5, 0.5);
    float _2582 = precise::clamp(_2580, 0.0, 1.0);
    float _2584 = -_2568;
    float _2586 = _2584 + _2570;
    float _2588 = -_2572;
    float _2590 = _2588 + _2574;
    float _2592 = -_2576;
    float _2594 = _2592 + _2578;
    bool _2596 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2598 = fma(_2582, _2586, _2568);
    float _2600 = fma(_2582, _2590, _2572);
    float _2602 = fma(_2582, _2594, _2576);
    float _2604 = _2598 * 0.586610972881317138671875;
    out.m_56.x = 1.0;
    float _2606 = fma(_2600, 0.298911988735198974609375, _2604);
    float _2608 = fma(_2602, 0.114477999508380889892578125, _2606);
    out.m_90.x = 0.0;
    float _2610 = -_2608;
    float _2612 = _2600 + _2610;
    float _2614 = -_2608;
    float _2616 = _2598 + _2614;
    float _2618 = -_2608;
    float _2620 = _2602 + _2618;
    float _2622 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2624 = fma(_2612, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2608);
    float _2626 = fma(_2616, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2608);
    float _2628 = fma(_2620, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2608);
    out.m_88.w = _2622;
    out.m_92.x = _2624;
    out.m_92.y = _2626;
    out.m_92.z = _2628;
    if (!_2596)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2630 = -_2124;
    float _2632 = _2630 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2634 = -_2126;
    float _2636 = _2634 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2638 = -_2128;
    float _2640 = _2638 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2642 = _2632 * _2632;
    float _2644 = fma(_2636, _2636, _2642);
    float _2646 = fma(_2640, _2640, _2644);
    float _2648 = sqrt(_2646);
    float _2650 = rsqrt(_2646);
    float _2652 = -_2648;
    float _2654 = _2652 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2656 = _2654 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2658 = precise::clamp(_2656, 0.0, 1.0);
    float _2660 = _2636 * _2650;
    float _2662 = _2632 * _2650;
    float _2664 = abs(_2658);
    float _2666 = log2(_2664);
    float _2668 = _2640 * _2650;
    float _2670 = _2660 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2672 = _2058 * _2662;
    float _2674 = -_2662;
    float _2676 = -_2670;
    float _2678 = fma(_2674, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2676);
    float _2680 = fma(_2056, _2660, _2672);
    float _2682 = -_2668;
    float _2684 = fma(_2682, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2678);
    float _2686 = fma(_2064, _2668, _2680);
    float _2688 = precise::clamp(_2686, 0.0, 1.0);
    float _2690 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2692 = _2684 + _2690;
    float _2694 = _2666 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2696 = _2692 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2698 = precise::clamp(_2696, 0.0, 1.0);
    float _2700 = exp2(_2694);
    float _2702 = _2700 * _2698;
    float _2704 = _2688 * _2702;
    float _2706 = _2704 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2708 = _2704 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2710 = _2704 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_90.x = _2706;
    out.m_90.y = _2708;
    out.m_90.z = _2710;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2482 = false;
    bool _619 = false;
    bool _283 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _106 = in.m_49.w;
    float _108 = in.m_51.w;
    float _110 = trunc(_106);
    int _113 = int(_110);
    float _115 = -_108;
    float _117 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_54.y = _117;
    bool _121 = _113 >= 1;
    float _123 = 0.0;
    float _125 = _108;
    if (!_121)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _127 = _123;
    if (!_121)
    {
        out.m_56.x = 0.0;
    }
    int _129 = 0;
    if (!_121)
    {
        float _131 = _127 * 5.0;
        _129 = as_type<int>(_131);
    }
    int _133 = _129;
    int _135 = _133;
    if (!_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2777 = as_type<float>(_133);
        out.gl_Position.z = _2777;
    }
    if (!_121)
    {
        return out;
    }
    bool _137 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _139 = isnan(_108);
    bool _141 = _137 || _139;
    bool _143 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _145 = _141 || _143;
    float _147 = in.m_58.y;
    float _149 = float(_113);
    bool _151 = _117 >= _149;
    bool _153 = !_145;
    bool _155 = _151 || _153;
    if (_155)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _157 = _125;
    if (_155)
    {
        out.m_56.x = 0.0;
    }
    if (_155)
    {
        float _159 = _157 * 5.0;
        _135 = as_type<int>(_159);
    }
    int _161 = _135;
    out.m_60.y = _147;
    if (_155)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2836 = as_type<float>(_161);
        out.gl_Position.z = _2836;
    }
    if (_155)
    {
        return out;
    }
    float _163 = in.m_58.x;
    float _165 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _167 = _117 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _169 = in.m_62.x;
    int _171 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _173 = _171 != 0;
    int _175 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _177 = _175 != 0;
    float _179 = in.m_62.y;
    float _181 = 1.0 / _149;
    float _183 = _167 * _165;
    float _185 = fma(_163, (*spvDescriptorSet0.vp_c9)._m0[20].x, _183);
    float _187 = _117 * _181;
    float _189 = _185 * 6.283185482025146484375;
    float _191 = floor(_185);
    out.m_64.x = _169;
    float _193 = _189 * 0.15915493667125701904296875;
    out.m_64.y = _179;
    int _195 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _197 = _195 != 0;
    float _199 = _193 * 6.283185482025146484375;
    float _201 = cos(_199);
    bool _203 = !_173;
    int _205 = _203 ? 0 : 1;
    int _207 = abs(_205);
    bool _209 = !_197;
    int _211 = _209 ? 0 : 1;
    float _213 = -_191;
    float _215 = _185 + _213;
    bool _217 = !_177;
    int _219 = _217 ? 0 : 1;
    int _221 = abs(_211);
    float _223 = -_215;
    float _225 = fma(_223, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _227 = float(_207);
    bool _229 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _231 = fma(_201, 0.5, 0.5);
    int _233 = abs(_219);
    float _235 = abs(_225);
    float _237 = _227 * _235;
    float _239 = -_231;
    float _241 = fma(_239, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _243 = _215 < 0.5;
    float _245 = float(_243);
    float _247 = float(_221);
    float _249 = float(_233);
    float _251 = -_245;
    float _253 = fma(_251, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _255 = fma(_247, _241, _237);
    float _257 = abs(_253);
    float _259 = fma(_249, _257, _255);
    bool _261 = !_229;
    float _263 = _179;
    float _265 = _169;
    float _281;
    if (!_261)
    {
        float _267 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _269 = _163 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _271 = fma(_269, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _273 = _271 * _267;
        float _275 = floor(_273);
        float _277 = -_275;
        float _279 = _273 + _277;
        _281 = _279;
        _283 = true;
    }
    else
    {
        _281 = _187;
    }
    _283 = false;
    float _285 = _281;
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _289 = _285 + _287;
    float _291 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _293 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _291;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _297 = _295 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _299 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _301 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _299;
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _305 = _303 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _307 = 1.0 / _293;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _311 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _309;
    float _313 = 1.0 / _297;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _317 = _285 + _315;
    bool _319 = _285 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _321 = isnan(_285);
    bool _323 = _319 || _321;
    bool _325 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _327 = _323 || _325;
    float _329 = float(_327);
    float _331 = 1.0 / _301;
    float _333 = _317 * _307;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _337 = _285 + _335;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _341 = _285 + _339;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _345 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _343;
    bool _347 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _349 = 1.0 / _305;
    float _351 = _289 * _313;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _355 = _285 + _353;
    bool _357 = _285 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _359 = isnan(_285);
    bool _361 = _357 || _359;
    bool _363 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _365 = _361 || _363;
    float _367 = float(_365);
    bool _369 = _285 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _371 = isnan(_285);
    bool _373 = _369 || _371;
    bool _375 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _377 = _373 || _375;
    float _379 = float(_377);
    float _381 = 1.0 / _311;
    float _383 = _337 * _331;
    bool _385 = _285 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _387 = isnan(_285);
    bool _389 = _385 || _387;
    bool _391 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _393 = _389 || _391;
    float _395 = float(_393);
    float _397 = -_379;
    float _399 = _397 + 1.0;
    float _401 = _341 * _349;
    bool _403 = _285 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _405 = isnan(_285);
    bool _407 = _403 || _405;
    bool _409 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _411 = _407 || _409;
    float _413 = float(_411);
    bool _415 = _285 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _417 = isnan(_285);
    bool _419 = _415 || _417;
    bool _421 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _423 = _419 || _421;
    float _425 = float(_423);
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _429 = _427 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _431 = -_413;
    float _433 = _431 + 1.0;
    float _435 = _355 * _381;
    float _437 = -_367;
    float _439 = _437 + 1.0;
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _443 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _441;
    float _445 = _379 * _433;
    float _447 = fma(_345, _333, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _449 = _413 * _439;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _453 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _451;
    float _455 = fma(_443, _333, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _457 = _395 * _399;
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _461 = _459 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _463 = fma(_453, _333, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _465 = -_395;
    float _467 = _465 + 1.0;
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _471 = _469 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _473 = fma(_429, _351, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _475 = fma(_461, _351, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _477 = _329 * _467;
    float _479 = -_329;
    float _481 = _479 + 1.0;
    float _483 = fma(_471, _351, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _485 = _425 * _481;
    float _487 = -_425;
    float _489 = _487 + 1.0;
    float _491 = _447 * _485;
    float _493 = _455 * _485;
    float _495 = _463 * _485;
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _499 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _497;
    float _501 = fma(_489, (*spvDescriptorSet0.vp_c9)._m0[143].y, _491);
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _505 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _503;
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _509 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _507;
    float _511 = fma(_499, _383, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _513 = fma(_489, (*spvDescriptorSet0.vp_c9)._m0[143].x, _495);
    float _515 = fma(_483, _477, _501);
    float _517 = fma(_505, _383, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _519 = fma(_509, _383, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _521 = fma(_489, (*spvDescriptorSet0.vp_c9)._m0[143].z, _493);
    float _523 = fma(_473, _477, _513);
    float _525 = fma(_511, _457, _515);
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _529 = _527 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _533 = _531 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _537 = _535 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _539 = fma(_529, _401, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _541 = fma(_517, _457, _523);
    float _543 = fma(_533, _401, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _545 = fma(_537, _401, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _547 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _549 = in.m_66.x;
    float _551 = in.m_66.y;
    float _553 = in.m_66.z;
    float _555 = fma(_475, _477, _521);
    float _557 = fma(_543, _445, _525);
    out.m_68.w = _547;
    float _559 = fma(_519, _457, _555);
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _563 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _561;
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _567 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _565;
    float _569 = fma(_539, _445, _541);
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _573 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _571;
    float _575 = fma(_563, _435, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _577 = fma(_567, _435, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _579 = fma(_545, _445, _559);
    float _581 = fma(_573, _435, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _583 = fma(_575, _449, _569);
    float _585 = fma(_577, _449, _557);
    float _587 = fma(_581, _449, _579);
    float _589 = fma(_367, (*spvDescriptorSet0.vp_c9)._m0[148].x, _583);
    float _591 = fma(_367, (*spvDescriptorSet0.vp_c9)._m0[148].y, _585);
    float _593 = fma(_367, (*spvDescriptorSet0.vp_c9)._m0[148].z, _587);
    float _595 = _589 * _549;
    float _597 = _591 * _551;
    float _599 = _593 * _553;
    bool _601 = !_347;
    float _617;
    if (!_601)
    {
        float _603 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _605 = _163 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _607 = fma(_605, (*spvDescriptorSet0.vp_c9)._m0[14].x, _117);
        float _609 = _607 * _603;
        float _611 = floor(_609);
        float _613 = -_611;
        float _615 = _609 + _613;
        _617 = _615;
        _619 = true;
    }
    else
    {
        _617 = _187;
    }
    _619 = false;
    float _621 = _617;
    float _623 = in.m_49.x;
    float _625 = in.m_49.y;
    float _627 = in.m_49.z;
    bool _629 = _147 > 0.5;
    float _631 = in.m_70.y;
    int _633 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _635 = _633 != 0;
    int _637 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _639 = _637 != 0;
    float _641 = in.m_72.x;
    float _643 = in.m_72.y;
    float _645 = in.m_72.z;
    float _647 = in.m_72.w;
    float _649 = in.m_74.x;
    float _651 = in.m_74.y;
    float _653 = in.m_74.z;
    float _655 = in.m_74.w;
    float _657 = in.m_76.x;
    float _659 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _661 = _659 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _663 = 1.0 / _661;
    float _665 = _625 + _631;
    float _667 = -_179;
    float _669 = _667 + 1.0;
    float _671 = _625 * _643;
    float _673 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _675 = _665 + _673;
    if (_635)
    {
        float _677 = _629 ? _669 : _179;
        _263 = _677;
    }
    float _679 = _263;
    float _681 = _625 * _651;
    bool _683 = _163 > 0.5;
    bool _685 = _683 && _639;
    float _687 = fma(_623, _641, _671);
    float _689 = _163 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _691 = fma(_623, _649, _681);
    float _693 = fma(_627, _645, _687);
    float _695 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _697 = fma(_627, _653, _691);
    float _699 = _147 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _701 = _693 + _647;
    float _703 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _705 = -_695;
    float _707 = fma(_689, 2.0, _705);
    float _709 = _697 + _655;
    float _711 = _695;
    if (!_639)
    {
        _711 = _169;
    }
    float _713 = _711;
    float _715 = _675 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _717 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _719 = _701 + _717;
    float _721 = _713;
    if (_685)
    {
        float _723 = -_169;
        float _725 = _723 + 1.0;
        _265 = _725;
    }
    float _727 = _265;
    float _729 = fma(_699, -2.0, _703);
    float _731 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _733 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _735 = _709 + _733;
    float _737 = fma(_719, (*spvDescriptorSet0.vp_c8)._m0[28].x, _715);
    if (_639)
    {
        _721 = _727;
    }
    float _739 = _721;
    float _741 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _743 = fma(_163, (*spvDescriptorSet0.vp_c9)._m0[78].z, _731);
    float _745 = fma(_735, (*spvDescriptorSet0.vp_c8)._m0[28].z, _737);
    float _747 = -_117;
    float _749 = fma(_747, (*spvDescriptorSet0.vp_c9)._m0[76].x, _707);
    float _751 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[78].w, _741);
    float _753 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].z, _743);
    float _755 = fma(_739, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    bool _757 = _745 >= 0.0;
    float _759 = fma(_679, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _761 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].w, _751);
    float _763 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[76].y, _729);
    float _765 = fma(_753, _755, _749);
    float _767 = _675 * _675;
    float _769 = -_763;
    float _771 = fma(_761, _759, _769);
    float _773 = _765 + 0.5;
    float _775 = fma(_719, _719, _767);
    float _777 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _779 = _777 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _781 = fma(_735, _735, _775);
    float _783 = _743;
    if (_757)
    {
        _783 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _785 = _783;
    float _787 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _789 = _787 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _791 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _793 = _791 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _795 = 1.0 / _779;
    float _797 = _771 + 0.5;
    int _799 = as_type<int>(_785);
    if (_757)
    {
        float _801 = _785 * 5.0;
        _799 = as_type<int>(_801);
    }
    int _803 = _799;
    out.m_78.x = _657;
    float _805 = _259 * _595;
    float _807 = _259 * _597;
    float _809 = rsqrt(_781);
    out.m_80.x = _773;
    out.m_80.y = _797;
    if (_757)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3907 = as_type<float>(_803);
        out.gl_Position.z = _3907;
    }
    float _811 = 1.0 / _789;
    if (_757)
    {
        out.m_56.x = 0.0;
    }
    float _813 = 1.0 / _793;
    float _815 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _817 = _815 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _819 = _675 * _809;
    float _821 = _719 * _809;
    if (_757)
    {
        return out;
    }
    float _823 = -_819;
    float _825 = fma(_823, (*spvDescriptorSet0.vp_c9)._m0[18].w, _665);
    float _827 = -_821;
    float _829 = fma(_827, (*spvDescriptorSet0.vp_c9)._m0[18].w, _701);
    float _831 = _735 * _809;
    float _833 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _835 = _833 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _837 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _839 = _825 + _837;
    float _841 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _843 = _829 + _841;
    float _845 = -_831;
    float _847 = fma(_845, (*spvDescriptorSet0.vp_c9)._m0[18].w, _709);
    float _849 = 1.0 / _817;
    float _851 = _839 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _853 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _855 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _853;
    float _857 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _859 = _847 + _857;
    float _861 = _657 * 12.98980045318603515625;
    float _863 = fma(_843, (*spvDescriptorSet0.vp_c8)._m0[28].x, _851);
    float _865 = _259 * _599;
    float _867 = in.m_58.w;
    float _869 = fma(_859, (*spvDescriptorSet0.vp_c8)._m0[28].z, _863);
    float _871 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _873 = _871 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _875 = 1.0 / _835;
    float _877 = _855 * _795;
    float _879 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _881 = _879 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    bool _883 = _869 >= 0.0;
    float _885 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _887 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _885;
    float _889 = _881 * _663;
    float _891 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _893 = _621 + _891;
    float _895 = 1.0 / _873;
    float _897 = _887 * _811;
    float _899 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _901 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _899;
    float _903 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _905 = _903 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _907 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _909 = _907 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _911 = _901 * _849;
    float _913 = fma(_889, _893, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _915 = _905 * _813;
    float _917 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _919 = _621 + _917;
    float _921 = _909 * _875;
    float _923 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _925 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _923;
    float _927 = _875;
    if (_883)
    {
        _927 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _929 = _927;
    float _931 = fma(_867, 78.233001708984375, _861);
    float _933 = fma(_877, _919, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _935 = _621 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _937 = isnan(_621);
    bool _939 = _935 || _937;
    bool _941 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _943 = _939 || _941;
    float _945 = float(_943);
    float _947 = _925 * _895;
    float _949 = _931 * 0.15915493667125701904296875;
    int _951 = as_type<int>(_929);
    if (_883)
    {
        float _953 = _929 * 5.0;
        _951 = as_type<int>(_953);
    }
    int _955 = _951;
    bool _957 = _621 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _959 = isnan(_621);
    bool _961 = _957 || _959;
    bool _963 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _965 = _961 || _963;
    float _967 = float(_965);
    float _969 = -_945;
    float _971 = _969 + 1.0;
    float _973 = -_819;
    float _975 = fma(_973, (*spvDescriptorSet0.vp_c9)._m0[18].w, _675);
    float _977 = _949 * 6.283185482025146484375;
    float _979 = sin(_977);
    if (_883)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4193 = as_type<float>(_955);
        out.gl_Position.z = _4193;
    }
    float _981 = _967 * _971;
    bool _983 = _621 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _985 = isnan(_621);
    bool _987 = _983 || _985;
    bool _989 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _991 = _987 || _989;
    float _993 = float(_991);
    float _995 = -_967;
    float _997 = _995 + 1.0;
    if (_883)
    {
        out.m_56.x = 0.0;
    }
    float _999 = -_821;
    float _1001 = fma(_999, (*spvDescriptorSet0.vp_c9)._m0[18].w, _719);
    float _1003 = _975 * _975;
    if (_883)
    {
        return out;
    }
    float _1005 = in.m_58.z;
    bool _1007 = _621 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1009 = isnan(_621);
    bool _1011 = _1007 || _1009;
    bool _1013 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1015 = _1011 || _1013;
    float _1017 = float(_1015);
    float _1019 = -_993;
    float _1021 = _1019 + 1.0;
    bool _1023 = _621 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1025 = isnan(_621);
    bool _1027 = _1023 || _1025;
    bool _1029 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1031 = _1027 || _1029;
    float _1033 = float(_1031);
    float _1035 = fma(_1001, _1001, _1003);
    float _1037 = -_831;
    float _1039 = fma(_1037, (*spvDescriptorSet0.vp_c9)._m0[18].w, _735);
    float _1041 = _993 * _997;
    float _1043 = -_1017;
    float _1045 = _1043 + 1.0;
    float _1047 = _1017 * _1021;
    bool _1049 = _621 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1051 = isnan(_621);
    bool _1053 = _1049 || _1051;
    bool _1055 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1057 = _1053 || _1055;
    float _1059 = float(_1057);
    float _1061 = fma(_1039, _1039, _1035);
    float _1063 = -_1033;
    float _1065 = _1063 + 1.0;
    float _1067 = _1033 * _1045;
    float _1069 = -_665;
    float _1071 = _1069 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    bool _1073 = _621 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1075 = isnan(_621);
    bool _1077 = _1073 || _1075;
    bool _1079 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1081 = _1077 || _1079;
    float _1083 = float(_1081);
    float _1085 = _1059 * _1065;
    float _1087 = fma(_163, 78.233001708984375, _861);
    float _1089 = -_1059;
    float _1091 = _1089 + 1.0;
    float _1093 = -_701;
    float _1095 = _1093 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1097 = _1071 * _1071;
    float _1099 = _979 * 43758.546875;
    float _1101 = _1087 * 0.15915493667125701904296875;
    float _1103 = _1083 * _1091;
    float _1105 = -_1083;
    float _1107 = _1105 + 1.0;
    bool _1109 = _621 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1111 = isnan(_621);
    bool _1113 = _1109 || _1111;
    bool _1115 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1117 = _1113 || _1115;
    float _1119 = float(_1117);
    float _1121 = -_709;
    float _1123 = _1121 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1125 = fma(_1095, _1095, _1097);
    float _1127 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1129 = _621 + _1127;
    float _1131 = fma(_1005, 78.233001708984375, _861);
    float _1133 = floor(_1099);
    float _1135 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1137 = _621 + _1135;
    float _1139 = _1119 * _1107;
    float _1141 = fma(_897, _1129, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1143 = fma(_147, 78.233001708984375, _861);
    float _1145 = fma(_915, _1137, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1147 = _933 * _1139;
    float _1149 = -_1119;
    float _1151 = _1149 + 1.0;
    float _1153 = _1101 * 6.283185482025146484375;
    float _1155 = sin(_1153);
    float _1157 = _1131 * 0.15915493667125701904296875;
    float _1159 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1161 = _621 + _1159;
    float _1163 = fma(_1151, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1147);
    float _1165 = _1143 * 0.15915493667125701904296875;
    float _1167 = _865 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1169 = fma(_911, _1161, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1171 = fma(_913, _1103, _1163);
    float _1173 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1175 = _621 + _1173;
    float _1177 = fma(_1123, _1123, _1125);
    float _1179 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1181 = _621 + _1179;
    float _1183 = _1157 * 6.283185482025146484375;
    float _1185 = sin(_1183);
    float _1187 = fma(_1141, _1085, _1171);
    float _1189 = fma(_921, _1181, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1191 = -_1133;
    float _1193 = _1099 + _1191;
    float _1195 = fma(_947, _1175, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1197 = in.m_82.x;
    float _1199 = in.m_82.y;
    float _1201 = in.m_82.z;
    float _1203 = fma(_1145, _1067, _1187);
    float _1205 = rsqrt(_1177);
    float _1207 = fma(_1193, 0.5, _187);
    float _1209 = precise::clamp(_1207, 0.0, 1.0);
    float _1211 = _1155 * 43758.546875;
    float _1213 = fma(_1169, _1047, _1203);
    float _1215 = -_1209;
    float _1217 = fma(_1215, _1209, 1.0);
    float _1219 = fma(_1189, _1041, _1213);
    float _1221 = _1165 * 6.283185482025146484375;
    float _1223 = sin(_1221);
    float _1225 = _1185 * 43758.546875;
    float _1227 = _805 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1229 = fma(_1195, _981, _1219);
    float _1231 = fma(_945, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1229);
    float _1233 = _1095 * _1205;
    float _1235 = _1123 * _1205;
    float _1237 = _1071 * _1205;
    float _1239 = sqrt(_1061);
    float _1241 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1243 = _1233 * _1241;
    float _1245 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1247 = _1235 * _1245;
    float _1249 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1251 = _1237 * _1249;
    float _1253 = _1217 * _1197;
    float _1255 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1257 = -_1243;
    float _1259 = fma(_1235, _1255, _1257);
    float _1261 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1263 = -_1247;
    float _1265 = fma(_1237, _1261, _1263);
    float _1267 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1269 = -_1251;
    float _1271 = fma(_1233, _1267, _1269);
    float _1273 = floor(_1225);
    float _1275 = _1259 * _1259;
    float _1277 = _1223 * 43758.546875;
    float _1279 = _1217 * _1199;
    float _1281 = _1217 * _1201;
    float _1283 = fma(_1265, _1265, _1275);
    float _1285 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1253);
    float _1287 = floor(_1277);
    float _1289 = fma(_1271, _1271, _1283);
    float _1291 = _809 * _1239;
    float _1293 = _807 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1295 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1279);
    float _1297 = _1291 * _1227;
    float _1299 = _1291 * _1293;
    float _1301 = rsqrt(_1289);
    float _1303 = -_1273;
    float _1305 = _1225 + _1303;
    float _1307 = _1285 * _1297;
    float _1309 = _1295 * _1299;
    float _1311 = _1291 * _1167;
    float _1313 = fma(_1305, 0.4000000059604644775390625, 0.100000001490116119384765625);
    float _1315 = floor(_1211);
    float _1317 = -_1287;
    float _1319 = _1277 + _1317;
    float _1321 = _117 * _1313;
    float _1323 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1281);
    float _1325 = fma(_1319, 6.283185482025146484375, _1321);
    float _1327 = _1265 * _1301;
    float _1329 = _1271 * _1301;
    float _1331 = _1323 * _1311;
    float _1333 = _1325 * 0.15915493667125701904296875;
    float _1335 = _1237 * _1327;
    float _1337 = _1233 * _1329;
    float _1339 = fma(_1319, 2.0, -1.0);
    float _1341 = -_1315;
    float _1343 = _1211 + _1341;
    float _1345 = _1259 * _1301;
    float _1347 = _1333 * 6.283185482025146484375;
    float _1349 = sin(_1347);
    float _1351 = fma(_1305, 0.60000002384185791015625, -0.300000011920928955078125);
    float _1353 = fma(_1343, 6.283185482025146484375, _1321);
    float _1355 = _1235 * _1345;
    float _1357 = -_1335;
    float _1359 = fma(_1233, _1345, _1357);
    float _1361 = fma(_1343, 0.60000002384185791015625, -0.300000011920928955078125);
    float _1363 = _1353 * 0.15915493667125701904296875;
    float _1365 = -_1355;
    float _1367 = fma(_1237, _1329, _1365);
    float _1369 = _1309 * _1359;
    float _1371 = -_1337;
    float _1373 = fma(_1235, _1327, _1371);
    float _1375 = _1309 * _1367;
    float _1377 = fma(_1307, _1329, _1369);
    float _1379 = _1363 * 6.283185482025146484375;
    float _1381 = sin(_1379);
    float _1383 = fma(_1307, _1327, _1375);
    float _1385 = fma(_1331, _1235, _1377);
    float _1387 = fma(_1331, _1233, _1383);
    float _1389 = _709 + _1385;
    float _1391 = _701 + _1387;
    float _1393 = fma(_1231, _1351, _1389);
    float _1395 = fma(_1231, _1361, _1391);
    float _1397 = fma(_1349, 0.039999999105930328369140625, _1393);
    float _1399 = fma(_1381, 0.039999999105930328369140625, _1395);
    float _1401 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1403 = _1397 + _1401;
    float _1405 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1407 = _1399 + _1405;
    float _1409 = _1403 * _1403;
    float _1411 = fma(_1407, _1407, _1409);
    float _1413 = sqrt(_1411);
    bool _1415 = _1413 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1417 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1419 = _1413 + _1417;
    float _1421 = _1229;
    float _1423 = _1397;
    float _1425 = _1399;
    if (_1415)
    {
        float _1427 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1421 = _1427;
    }
    float _1429 = _1421;
    float _1431 = _1429;
    if (_1415)
    {
        float _1433 = _1419 * _1429;
        _1431 = _1433;
    }
    float _1435 = _1431;
    float _1437 = _1309 * _1373;
    float _1439 = _1435;
    if (_1415)
    {
        float _1441 = _1435 * 0.15915493667125701904296875;
        _1439 = _1441;
    }
    float _1443 = _1439;
    float _1445 = fma(_1307, _1345, _1437);
    float _1447 = _1437;
    float _1449 = _1445;
    if (_1415)
    {
        float _1451 = _1443 * 6.283185482025146484375;
        float _1453 = sin(_1451);
        _1447 = _1453;
    }
    float _1455 = _1447;
    float _1457 = fma(_1331, _1237, _1445);
    float _1459 = _665 + _1457;
    float _1461 = _1457;
    if (_1415)
    {
        float _1463 = rsqrt(_1411);
        _1461 = _1463;
    }
    float _1465 = _1461;
    float _1467 = fma(_1231, _1339, _1459);
    float _1469 = _1467;
    if (_1415)
    {
        float _1471 = _1467 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1449 = _1471;
    }
    float _1473 = _1449;
    float _1475 = _1473;
    if (_1415)
    {
        float _1477 = fma(_1455, _1473, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1475 = _1477;
    }
    float _1479 = _1475;
    float _1481 = _1465;
    if (_1415)
    {
        float _1483 = _1465 * _1479;
        _1481 = _1483;
    }
    float _1485 = _1481;
    if (_1415)
    {
        float _1487 = fma(_1403, _1485, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1423 = _1487;
    }
    float _1489 = _1423;
    if (_1415)
    {
        float _1491 = fma(_1407, _1485, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1425 = _1491;
    }
    float _1493 = _1425;
    float _1495 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _1497 = _1489 + _1495;
    float _1499 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _1501 = _1493 + _1499;
    float _1503 = fma(_1497, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1505 = fma(_1501, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _4990 = float2(_1505, _1503);
    float _1507 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_4990, float2(0.0), isnan(_4990)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_4990, float2(0.0), isnan(_4990)), level(0.0)).x;
    float _1509 = fma(_1507, 100.0, _665);
    float _1511 = -_819;
    float _1513 = fma(_1511, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1509);
    float _1515 = _1513 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1517 = fma(_829, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1515);
    float _1519 = fma(_847, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1517);
    float _1521 = _1513 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1523 = _1519 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1525 = fma(_829, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1521);
    float _1527 = 1.0 / _1523;
    float _1529 = fma(_847, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1525);
    float _1531 = _1529 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1533 = _1531 + _1523;
    float _1535 = _1533 * _1527;
    float _1537 = _1535 * 0.5;
    float _1539 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1541 = fma(_1537, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1539);
    float _1543 = 1.0 / _1541;
    float _1545 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _1547 = _1513 + _1545;
    float _1549 = _1547 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1551 = _1547 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1553 = fma(_829, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1549);
    float _1555 = fma(_829, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1551);
    float _1557 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1559 = _1543 * _1557;
    float _1561 = fma(_847, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1553);
    float _1563 = fma(_847, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1555);
    bool _1565 = _1559 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1567 = _1561 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _1569 = _1559 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1571 = _1563 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    bool _1573 = !_1565;
    int _1575 = _1573 ? 0 : 1;
    float _1577 = trunc(_1571);
    int _1579 = int(_1577);
    int _1581 = 2;
    if (!_1565)
    {
        _1581 = 1;
    }
    int _1583 = _1581;
    int _1585 = _1583;
    if (!_1569)
    {
        _1585 = _1575;
    }
    int _1587 = _1585;
    float _1589 = trunc(_1567);
    int _1591 = int(_1589);
    int _1593 = _1587 << 6;
    int _1595 = _1593 + 96;
    uint _1598 = uint(int(uint(_1595) >> uint(2)));
    uint _1600 = uint(int(uint(int(_1598)) >> uint(2)));
    int _1602 = int(_1598) & 3;
    float _1604 = (*spvDescriptorSet0.vp_c15)._m0[int(_1600)][_1602];
    int _1606 = int(_1598) + 1;
    uint _1608 = uint(int(uint(_1606) >> uint(2)));
    int _1610 = _1606 & 3;
    float _1612 = (*spvDescriptorSet0.vp_c15)._m0[int(_1608)][_1610];
    int _1614 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1616 = _1579 + _1614;
    int _1618 = _1616 + 1;
    int _1620 = _1593 + 104;
    uint _1622 = uint(int(uint(_1620) >> uint(2)));
    uint _1624 = uint(int(uint(int(_1622)) >> uint(2)));
    int _1626 = int(_1622) & 3;
    float _1628 = (*spvDescriptorSet0.vp_c15)._m0[int(_1624)][_1626];
    int _1630 = int(_1622) + 1;
    uint _1632 = uint(int(uint(_1630) >> uint(2)));
    int _1634 = _1630 & 3;
    float _1636 = (*spvDescriptorSet0.vp_c15)._m0[int(_1632)][_1634];
    int _1638 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1640 = _1591 + _1638;
    int _1642 = _1640 + 1;
    int _1644 = _1642 | _1618;
    int _1646 = _1593 + 48;
    uint _1648 = uint(int(uint(_1646) >> uint(2)));
    uint _1650 = uint(int(uint(int(_1648)) >> uint(2)));
    int _1652 = int(_1648) & 3;
    float _1654 = (*spvDescriptorSet0.vp_c15)._m0[int(_1650)][_1652];
    int _1656 = int(_1648) + 1;
    uint _1658 = uint(int(uint(_1656) >> uint(2)));
    int _1660 = _1656 & 3;
    float _1662 = (*spvDescriptorSet0.vp_c15)._m0[int(_1658)][_1660];
    bool _1664 = _1642 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1666 = _1644 < 0;
    bool _1668 = _1666 || _1664;
    int _1670 = _1593 + 64;
    uint _1672 = uint(int(uint(_1670) >> uint(2)));
    uint _1674 = uint(int(uint(int(_1672)) >> uint(2)));
    int _1676 = int(_1672) & 3;
    float _1678 = (*spvDescriptorSet0.vp_c15)._m0[int(_1674)][_1676];
    int _1680 = int(_1672) + 1;
    uint _1682 = uint(int(uint(_1680) >> uint(2)));
    int _1684 = _1680 & 3;
    float _1686 = (*spvDescriptorSet0.vp_c15)._m0[int(_1682)][_1684];
    bool _1688 = _1618 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1690 = _1688 || _1668;
    int _1692 = _1593 + 56;
    uint _1694 = uint(int(uint(_1692) >> uint(2)));
    uint _1696 = uint(int(uint(int(_1694)) >> uint(2)));
    int _1698 = int(_1694) & 3;
    float _1700 = (*spvDescriptorSet0.vp_c15)._m0[int(_1696)][_1698];
    int _1702 = int(_1694) + 1;
    uint _1704 = uint(int(uint(_1702) >> uint(2)));
    int _1706 = _1702 & 3;
    float _1708 = (*spvDescriptorSet0.vp_c15)._m0[int(_1704)][_1706];
    int _1710 = _1642;
    int _1712 = _1618;
    float _1714 = as_type<float>(_1587);
    if (!_1690)
    {
        int _1716 = _1618 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1718 = _1716 + _1642;
        _1710 = _1718;
    }
    int _1720 = _1710;
    int _1722 = _1593 + 72;
    uint _1724 = uint(int(uint(_1722) >> uint(2)));
    uint _1726 = uint(int(uint(int(_1724)) >> uint(2)));
    int _1728 = int(_1724) & 3;
    float _1730 = (*spvDescriptorSet0.vp_c15)._m0[int(_1726)][_1728];
    int _1732 = int(_1724) + 1;
    uint _1734 = uint(int(uint(_1732) >> uint(2)));
    int _1736 = _1732 & 3;
    float _1738 = (*spvDescriptorSet0.vp_c15)._m0[int(_1734)][_1736];
    if (!_1690)
    {
        int _1740 = _1720 << 2;
        _1712 = _1740;
    }
    int _1742 = _1712;
    float _1744 = _1547 * _1612;
    int _1746 = as_type<int>(_1612);
    int _1748 = as_type<int>(_1744);
    if (!_1690)
    {
        uint _1750 = uint(int(uint(_1720) >> uint(2)));
        _1746 = int(_1750);
    }
    int _1752 = _1746;
    float _1754 = fma(_829, _1604, _1744);
    if (!_1690)
    {
        int _1756 = 12 & _1742;
        _1748 = _1756;
    }
    int _1758 = _1748;
    float _1760 = fma(_847, _1628, _1754);
    float _1762 = _1628;
    if (!_1690)
    {
        int _1764 = _1752 << 4;
        int _1766 = _1764 + _1758;
        _1762 = as_type<float>(_1766);
    }
    float _1768 = _1762;
    float _1770 = _1760 + _1636;
    int _1772 = _1593 + 80;
    uint _1774 = uint(int(uint(_1772) >> uint(2)));
    uint _1776 = uint(int(uint(int(_1774)) >> uint(2)));
    int _1778 = int(_1774) & 3;
    float _1780 = (*spvDescriptorSet0.vp_c15)._m0[int(_1776)][_1778];
    int _1782 = int(_1774) + 1;
    uint _1784 = uint(int(uint(_1782) >> uint(2)));
    int _1786 = _1782 & 3;
    float _1788 = (*spvDescriptorSet0.vp_c15)._m0[int(_1784)][_1786];
    float _1790 = _1547 * _1662;
    float _1792 = 1.0 / _1770;
    float _1794 = fma(_829, _1654, _1790);
    float _1796 = _1768;
    float _1798 = _1770;
    if (!_1690)
    {
        int _1800 = as_type<int>(_1768) + 400;
        uint _1802 = uint(int(uint(_1800) >> uint(2)));
        uint _1804 = uint(int(uint(int(_1802)) >> uint(2)));
        int _1806 = int(_1802) & 3;
        float _1808 = (*spvDescriptorSet0.vp_c15)._m0[int(_1804)][_1806];
        _1796 = _1808;
    }
    float _1810 = _1796;
    float _1812 = _1547 * _1686;
    float _1814 = fma(_829, _1678, _1812);
    int _1816 = _1593 + 88;
    uint _1818 = uint(int(uint(_1816) >> uint(2)));
    uint _1820 = uint(int(uint(int(_1818)) >> uint(2)));
    int _1822 = int(_1818) & 3;
    float _1824 = (*spvDescriptorSet0.vp_c15)._m0[int(_1820)][_1822];
    int _1826 = int(_1818) + 1;
    uint _1828 = uint(int(uint(_1826) >> uint(2)));
    int _1830 = _1826 & 3;
    float _1832 = (*spvDescriptorSet0.vp_c15)._m0[int(_1828)][_1830];
    float _1834 = _1812;
    if (!_1690)
    {
        float _1836 = floor(_1571);
        _1834 = _1836;
    }
    float _1838 = _1834;
    float _1840 = fma(_847, _1700, _1794);
    float _1842 = _1840 + _1708;
    float _1844 = _1794;
    if (!_1690)
    {
        float _1846 = floor(_1567);
        _1844 = _1846;
    }
    float _1848 = _1844;
    float _1850 = fma(_847, _1730, _1814);
    float _1852 = _1842 * _1792;
    float _1854 = _1850 + _1738;
    bool _1856 = _1852 >= 0.0;
    float _1858 = fma(_829, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1860 = _1854 * _1792;
    float _1862 = _1838;
    float _1864 = _1860;
    if (!_1690)
    {
        float _1866 = -_1838;
        float _1868 = _1571 + _1866;
        _1862 = _1868;
    }
    float _1870 = _1862;
    float _1872 = floor(_1858);
    bool _1874 = _1852 <= 1.0;
    bool _1876 = _1874 && _1856;
    float _1878 = fma(_847, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    if (!_1690)
    {
        float _1880 = -_1848;
        float _1882 = _1567 + _1880;
        _1798 = _1882;
    }
    float _1884 = _1798;
    bool _1886 = _1860 >= 0.0;
    bool _1888 = _1886 && _1876;
    float _1890 = floor(_1878);
    bool _1892 = _1860 <= 1.0;
    bool _1894 = _1892 && _1888;
    float _1896 = _1547 * _1788;
    float _1898 = fma(_829, _1780, _1896);
    float _1900 = -_1872;
    float _1902 = _1858 + _1900;
    float _1904 = _1810;
    if (!_1690)
    {
        float _1906 = rint(_1810);
        float _1908 = precise::max(_1906, 0.0);
        uint _1910 = uint(_1908);
        uint _1912 = clamp(_1910, 0u, 65535u);
        _1904 = as_type<float>(_1912);
    }
    float _1914 = _1904;
    if (_1894)
    {
        float _1916 = float(_1587);
        _1714 = _1916;
    }
    float _1918 = _1714;
    float _1920 = -_1890;
    float _1922 = _1878 + _1920;
    float _1924 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_1894)
    {
        float _1926 = rint(_1918);
        float _1928 = precise::max(_1926, 0.0);
        uint _1930 = uint(_1928);
        uint _1932 = clamp(_1930, 0u, 65535u);
        _1924 = as_type<float>(_1932);
    }
    float _1934 = _1924;
    float2 _5713 = float2(_1902, _1922);
    float _1936 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5713, float2(0.0), isnan(_5713)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5713, float2(0.0), isnan(_5713)), level(0.0)).x;
    float _1938 = fma(_847, _1824, _1898);
    float _1940 = _1938 + _1832;
    float _1942 = _1940 * _1792;
    float _1944 = _1571;
    if (!_1690)
    {
        float3 _5739 = float3(_1884, _1870, float(as_type<int>(_1914)));
        float3 _5743 = select(_5739, float3(0.0), isnan(_5739));
        float _1946 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5743.xy, uint(rint(_5743.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5743.xy, uint(rint(_5743.z)), level(0.0)).x;
        _1944 = _1946;
    }
    float _1948 = _1944;
    float _1950 = _1934;
    if (_1894)
    {
        float3 _5758 = float3(_1852, _1860, float(as_type<int>(_1934)));
        float3 _5760 = select(_5758, float3(0.0), isnan(_5758));
        float _1952 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5760.xy, uint(rint(_5760.z)), _1942, level(0.0));
        _1950 = _1952;
    }
    float _1954 = _1950;
    float _1956 = in.m_84.x;
    float _1958 = in.m_84.y;
    float _1960 = in.m_84.z;
    bool _1962 = _1279 != 0.0;
    bool _1964 = isnan(_1279);
    bool _1966 = _1962 || _1964;
    bool _1968 = isnan(0.0);
    bool _1970 = _1966 || _1968;
    float _1972 = _1824;
    if (_1415)
    {
        float _1974 = _1443 * 6.283185482025146484375;
        float _1976 = cos(_1974);
        _1972 = _1976;
    }
    float _1978 = _1972;
    float _1980 = -_821;
    float _1982 = fma(_1980, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1493);
    out.m_68.w = _547;
    bool _1984 = _1253 == 0.0;
    bool _1986 = !_1970;
    bool _1988 = _1984 && _1986;
    bool _1990 = _1281 == 0.0;
    bool _1992 = _1990 && _1988;
    float _1994 = -_831;
    float _1996 = fma(_1994, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1489);
    float _1998 = _1996;
    if (_1415)
    {
        float _2000 = _1978 + (-1.0);
        _1864 = _2000;
    }
    float _2002 = _1864;
    float _2004 = _2002;
    if (_1415)
    {
        float _2006 = _2002 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2004 = _2006;
    }
    float _2008 = _2004;
    float _2010 = _1958;
    float _2012 = _1956;
    float _2014 = _1960;
    if (!_1992)
    {
        float _2016 = fma(_1279, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1958);
        _2010 = _2016;
    }
    float _2018 = _2010;
    if (!_1992)
    {
        float _2020 = fma(_1253, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1956);
        _2012 = _2020;
    }
    float _2022 = _2012;
    if (!_1992)
    {
        float _2024 = fma(_1281, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1960);
        _2014 = _2024;
    }
    float _2026 = _2014;
    bool _2028 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2030 = isnan(0.5);
    bool _2032 = _2028 || _2030;
    bool _2034 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2036 = _2032 || _2034;
    float _2038 = _1367 * _2018;
    float _2040 = _1373 * _2018;
    if (_1415)
    {
        float _2042 = fma(_1467, _1978, _2008);
        _1469 = _2042;
    }
    float _2044 = _1469;
    float _2046 = _1359 * _2018;
    float _2048 = fma(_1327, _2022, _2038);
    float _2050 = fma(_1345, _2022, _2040);
    float _2052 = fma(_1507, 100.0, _2044);
    float _2054 = fma(_1329, _2022, _2046);
    float _2056 = fma(_1233, _2026, _2048);
    float _2058 = fma(_1237, _2026, _2050);
    float _2060 = -_819;
    float _2062 = fma(_2060, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2052);
    float _2064 = fma(_1235, _2026, _2054);
    float _2066 = _2052;
    float _2068 = _2062;
    if (_2036)
    {
        _2066 = _1982;
    }
    float _2070 = _2066;
    float _2072 = _2070;
    float _2074 = _1954;
    if (!_2036)
    {
        float _2076 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2078 = _1513 + _2076;
        float _2080 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2082 = -_709;
        float _2084 = _2082 + _1489;
        float _2086 = -_665;
        float _2088 = _2086 + _2044;
        float _2090 = _2078 * _2078;
        float _2092 = -_701;
        float _2094 = _2092 + _1493;
        float _2096 = fma(_843, _843, _2090);
        float _2098 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2100 = fma(_859, _859, _2096);
        float _2102 = 1.0 / _1291;
        float _2104 = sqrt(_2100);
        float _2106 = _2098 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2108 = precise::min(_2104, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2110 = _2108 * _2080;
        float _2112 = _2110 * _2102;
        float _2114 = _2106 * _2112;
        float _2116 = _2084 * _2112;
        float _2118 = fma(_2088, _2114, _1513);
        float _2120 = fma(_2094, _2114, _829);
        float _2122 = fma(_2106, _2116, _847);
        _2068 = _2118;
        _2072 = _2120;
        _1998 = _2122;
    }
    float _2124 = _2068;
    float _2126 = _2072;
    float _2128 = _1998;
    float _2130 = abs(_1559);
    float _2132 = log2(_2130);
    float _2134 = _2124 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2136 = _2124 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2138 = _2124 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2140 = _2124 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2142 = fma(_2126, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2134);
    float _2144 = fma(_2126, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2136);
    float _2146 = fma(_2126, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2138);
    float _2148 = fma(_2126, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2140);
    float _2150 = fma(_2128, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2142);
    float _2152 = fma(_2128, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2144);
    float _2154 = fma(_2128, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2146);
    float _2156 = fma(_2128, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2148);
    float _2158 = _2150 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2160 = _2152 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2162 = _2154 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2164 = _2132 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2166 = _2158 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2168 = _2158 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2170 = _2158 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2172 = _2158 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2174 = fma(_2160, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2166);
    float _2176 = exp2(_2164);
    float _2178 = fma(_2160, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2168);
    float _2180 = fma(_2160, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2170);
    float _2182 = fma(_2160, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2172);
    float _2184 = _2156 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2186 = fma(_2162, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2174);
    float _2188 = fma(_2162, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2178);
    float _2190 = fma(_2162, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2180);
    float _2192 = fma(_2162, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2182);
    float _2194 = fma(_2184, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2186);
    float _2196 = fma(_2184, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2188);
    float _2198 = fma(_2184, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2190);
    float _2200 = fma(_2184, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2192);
    bool _2202 = _1559 <= 8000.0;
    bool _2204 = isnan(_1559);
    bool _2206 = _2202 || _2204;
    bool _2208 = isnan(8000.0);
    bool _2210 = _2206 || _2208;
    float _2212 = float(_2210);
    float _2214 = fma(_2176, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2216 = precise::clamp(_2214, 0.0, 1.0);
    float _2218 = _2162;
    if (_1690)
    {
        _2218 = 1.0;
    }
    float _2220 = _2218;
    out.gl_Position.x = _2194;
    out.gl_Position.y = _2196;
    out.gl_Position.z = _2198;
    out.gl_Position.w = _2200;
    float _2222 = fma(_2216, -2.0, 3.0);
    float _2224 = _2216 * _2216;
    float _2226 = _2224 * _2222;
    float _2228 = -_2226;
    float _2230 = _2228 + 1.0;
    float _2232 = fma(_2230, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2226);
    float _2234 = _2212 * _2232;
    float _2236 = _2220;
    if (!_1690)
    {
        int _2238 = _1720 << 4;
        int _2240 = _2238 + 2048;
        uint _2242 = uint(int(uint(_2240) >> uint(2)));
        uint _2244 = uint(int(uint(int(_2242)) >> uint(2)));
        int _2246 = int(_2242) & 3;
        float _2248 = (*spvDescriptorSet0.vp_c15)._m0[int(_2244)][_2246];
        int _2250 = int(_2242) + 1;
        uint _2252 = uint(int(uint(_2250) >> uint(2)));
        int _2254 = _2250 & 3;
        float _2256 = (*spvDescriptorSet0.vp_c15)._m0[int(_2252)][_2254];
        int _2258 = _2240 + 8;
        uint _2260 = uint(int(uint(_2258) >> uint(2)));
        uint _2262 = uint(int(uint(int(_2260)) >> uint(2)));
        int _2264 = int(_2260) & 3;
        float _2266 = (*spvDescriptorSet0.vp_c15)._m0[int(_2262)][_2264];
        int _2268 = int(_2260) + 1;
        uint _2270 = uint(int(uint(_2268) >> uint(2)));
        int _2272 = _2268 & 3;
        float _2274 = (*spvDescriptorSet0.vp_c15)._m0[int(_2270)][_2272];
        float _2276 = _1547 * _2256;
        float _2278 = fma(_829, _2248, _2276);
        float _2280 = fma(_847, _2266, _2278);
        float _2282 = _2280 + _2274;
        float _2284 = precise::clamp(_2282, 0.0, 1.0);
        float _2286 = -_2284;
        float _2288 = _2286 + _1948;
        float _2290 = fma(_2288, 500.0, 1.5);
        float _2292 = exp2(_2290);
        float _2294 = 0.0 + _2292;
        float _2296 = precise::clamp(_2294, 0.0, 1.0);
        _2236 = _2296;
    }
    float _2298 = _2236;
    float _2300 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2302 = _2124 + _2300;
    float _2304 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2306 = _2126 + _2304;
    float _2308 = _2234 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2310 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2312 = _2128 + _2310;
    float _2314 = _2302 * _2302;
    out.m_86.x = _2056;
    out.m_86.y = _2058;
    out.m_86.z = _2064;
    float _2316 = fma(_2306, _2306, _2314);
    float _2318 = -_1936;
    float _2320 = _2318 + 1.0;
    float _2322 = _2314;
    float _2324 = _2316;
    float _2326 = _2312;
    if (!_1894)
    {
        _2322 = 1.0;
    }
    float _2328 = _2322;
    float _2330 = _2328;
    if (_1894)
    {
        bool _2332 = _1954 >= _1942;
        bool _2334 = isnan(_1954);
        bool _2336 = _2332 || _2334;
        bool _2338 = isnan(_1942);
        bool _2340 = _2336 || _2338;
        float _2342 = float(_2340);
        _2330 = _2342;
    }
    float _2344 = _2330;
    float _2346 = _2320 * _2308;
    float _2348 = precise::clamp(_2346, 0.0, 1.0);
    float _2350 = fma(_2312, _2312, _2316);
    float _2352 = _2344 * _2298;
    float _2354 = -_2348;
    float _2356 = fma(_2354, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2358 = sqrt(_2350);
    float _2360 = -_2352;
    float _2362 = fma(_2360, _2356, 1.0);
    float _2364 = precise::clamp(_2362, 0.0, 1.0);
    float _2366 = _2364 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_88.x = _2366;
    bool _2368 = _2358 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2370 = isnan(_2358);
    bool _2372 = _2368 || _2370;
    bool _2374 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2376 = _2372 || _2374;
    float _2378 = _2352;
    float _2380 = _2364;
    float _2382 = _2350;
    if (!_2376)
    {
        _2324 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2384 = _2324;
    float _2386 = _2384;
    float _2388 = _2384;
    if (!_2376)
    {
        _2378 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2390 = _2378;
    float _2392 = _2390;
    float _2394 = _2390;
    if (!_2376)
    {
        _2326 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2396 = _2326;
    float _2398 = _2396;
    float _2400 = _2396;
    if (!_2376)
    {
        _2380 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2402 = _2380;
    float _2404 = _2402;
    float _2406 = _2402;
    if (!_2376)
    {
        _2074 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2408 = _2074;
    float _2410 = _2408;
    float _2412 = _2408;
    if (!_2376)
    {
        _2382 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2414 = _2382;
    bool _2416 = !_2376;
    float _2418 = _2414;
    float _2420 = _2414;
    if (!_2416)
    {
        bool _2422 = _2358 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2424 = isnan(_2358);
        bool _2426 = _2422 || _2424;
        bool _2428 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2430 = _2426 || _2428;
        if (!_2430)
        {
            float _2432 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2434 = _2358 + _2432;
            float _2436 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2438 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2436;
            float _2440 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2442 = _2440 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2444 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2446 = _2444 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2448 = 1.0 / _2438;
            float _2450 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2452 = _2450 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2454 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2456 = _2454 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2458 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2460 = _2458 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2462 = _2434 * _2448;
            float _2464 = precise::clamp(_2462, 0.0, 1.0);
            float _2466 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2468 = _2466 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2470 = fma(_2464, _2442, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2472 = fma(_2464, _2446, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2474 = fma(_2464, _2468, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2476 = fma(_2464, _2452, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2478 = fma(_2464, _2456, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2480 = fma(_2464, _2460, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2394 = _2470;
            _2412 = _2478;
            _2388 = _2472;
            _2406 = _2476;
            _2400 = _2474;
            _2420 = _2480;
            _2482 = true;
        }
        else
        {
            bool _2484 = _2358 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2486 = isnan(_2358);
            bool _2488 = _2484 || _2486;
            bool _2490 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2492 = _2488 || _2490;
            if (!_2492)
            {
                _2386 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2494 = _2386;
            _2388 = _2494;
            if (!_2492)
            {
                _2392 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2496 = _2392;
            _2394 = _2496;
            if (!_2492)
            {
                _2398 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2498 = _2398;
            _2400 = _2498;
            if (!_2492)
            {
                _2404 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2500 = _2404;
            _2406 = _2500;
            if (!_2492)
            {
                _2410 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2502 = _2410;
            _2412 = _2502;
            if (!_2492)
            {
                _2418 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2504 = _2418;
            bool _2506 = !_2492;
            _2420 = _2504;
            if (!_2506)
            {
                bool _2508 = _2358 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2510 = isnan(_2358);
                bool _2512 = _2508 || _2510;
                bool _2514 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2516 = _2512 || _2514;
                if (!_2516)
                {
                    float _2518 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2520 = _2358 + _2518;
                    float _2522 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2524 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2522;
                    float _2526 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2528 = _2526 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2530 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2532 = _2530 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2534 = 1.0 / _2524;
                    float _2536 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2538 = _2536 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2540 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2542 = _2540 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2544 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2546 = _2544 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2548 = _2520 * _2534;
                    float _2550 = precise::clamp(_2548, 0.0, 1.0);
                    float _2552 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2554 = _2552 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2556 = fma(_2550, _2528, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2558 = fma(_2550, _2532, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2560 = fma(_2550, _2554, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2562 = fma(_2550, _2538, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2564 = fma(_2550, _2542, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2566 = fma(_2550, _2546, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2394 = _2556;
                    _2412 = _2564;
                    _2388 = _2558;
                    _2406 = _2562;
                    _2400 = _2560;
                    _2420 = _2566;
                    _2482 = true;
                }
                else
                {
                    _2394 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2412 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2388 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2406 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2400 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2420 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2482 = false;
    float _2568 = _2394;
    float _2570 = _2412;
    float _2572 = _2388;
    float _2574 = _2406;
    float _2576 = _2400;
    float _2578 = _2420;
    float _2580 = fma(_2058, -0.5, 0.5);
    float _2582 = precise::clamp(_2580, 0.0, 1.0);
    float _2584 = -_2568;
    float _2586 = _2584 + _2570;
    float _2588 = -_2572;
    float _2590 = _2588 + _2574;
    float _2592 = -_2576;
    float _2594 = _2592 + _2578;
    bool _2596 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2598 = fma(_2582, _2586, _2568);
    float _2600 = fma(_2582, _2590, _2572);
    float _2602 = fma(_2582, _2594, _2576);
    float _2604 = _2598 * 0.586610972881317138671875;
    out.m_56.x = 1.0;
    float _2606 = fma(_2600, 0.298911988735198974609375, _2604);
    float _2608 = fma(_2602, 0.114477999508380889892578125, _2606);
    out.m_90.x = 0.0;
    float _2610 = -_2608;
    float _2612 = _2600 + _2610;
    float _2614 = -_2608;
    float _2616 = _2598 + _2614;
    float _2618 = -_2608;
    float _2620 = _2602 + _2618;
    float _2622 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2624 = fma(_2612, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2608);
    float _2626 = fma(_2616, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2608);
    float _2628 = fma(_2620, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2608);
    out.m_88.w = _2622;
    out.m_92.x = _2624;
    out.m_92.y = _2626;
    out.m_92.z = _2628;
    if (!_2596)
    {
        return out;
    }
    float _2630 = -_2124;
    float _2632 = _2630 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2634 = -_2126;
    float _2636 = _2634 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2638 = -_2128;
    float _2640 = _2638 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2642 = _2632 * _2632;
    float _2644 = fma(_2636, _2636, _2642);
    float _2646 = fma(_2640, _2640, _2644);
    float _2648 = sqrt(_2646);
    float _2650 = rsqrt(_2646);
    float _2652 = -_2648;
    float _2654 = _2652 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2656 = _2654 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2658 = precise::clamp(_2656, 0.0, 1.0);
    float _2660 = _2636 * _2650;
    float _2662 = _2632 * _2650;
    float _2664 = abs(_2658);
    float _2666 = log2(_2664);
    float _2668 = _2640 * _2650;
    float _2670 = _2660 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2672 = _2058 * _2662;
    float _2674 = -_2662;
    float _2676 = -_2670;
    float _2678 = fma(_2674, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2676);
    float _2680 = fma(_2056, _2660, _2672);
    float _2682 = -_2668;
    float _2684 = fma(_2682, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2678);
    float _2686 = fma(_2064, _2668, _2680);
    float _2688 = precise::clamp(_2686, 0.0, 1.0);
    float _2690 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2692 = _2684 + _2690;
    float _2694 = _2666 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2696 = _2692 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2698 = precise::clamp(_2696, 0.0, 1.0);
    float _2700 = exp2(_2694);
    float _2702 = _2700 * _2698;
    float _2704 = _2688 * _2702;
    float _2706 = _2704 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2708 = _2704 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2710 = _2704 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_90.x = _2706;
    out.m_90.y = _2708;
    out.m_90.z = _2710;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint dm_vid [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2482 = false;
    bool _619 = false;
    bool _283 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _106 = in.m_49.w;
    float _108 = in.m_51.w;
    float _110 = trunc(_106);
    int _113 = int(_110);
    float _115 = -_108;
    float _117 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_54.y = _117;
    bool _121 = _113 >= 1;
    float _123 = 0.0;
    float _125 = _108;
    if (!_121)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _127 = _123;
    if (!_121)
    {
        out.m_56.x = 0.0;
    }
    int _129 = 0;
    if (!_121)
    {
        float _131 = _127 * 5.0;
        _129 = as_type<int>(_131);
    }
    int _133 = _129;
    int _135 = _133;
    if (!_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2777 = as_type<float>(_133);
        out.gl_Position.z = _2777;
    }
    if (!_121)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _137 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _139 = isnan(_108);
    bool _141 = _137 || _139;
    bool _143 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _145 = _141 || _143;
    float _147 = in.m_58.y;
    float _149 = float(_113);
    bool _151 = _117 >= _149;
    bool _153 = !_145;
    bool _155 = _151 || _153;
    if (_155)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _157 = _125;
    if (_155)
    {
        out.m_56.x = 0.0;
    }
    if (_155)
    {
        float _159 = _157 * 5.0;
        _135 = as_type<int>(_159);
    }
    int _161 = _135;
    out.m_60.y = _147;
    if (_155)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2836 = as_type<float>(_161);
        out.gl_Position.z = _2836;
    }
    if (_155)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _163 = in.m_58.x;
    float _165 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _167 = _117 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _169 = in.m_62.x;
    int _171 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _173 = _171 != 0;
    int _175 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _177 = _175 != 0;
    float _179 = in.m_62.y;
    float _181 = 1.0 / _149;
    float _183 = _167 * _165;
    float _185 = fma(_163, (*spvDescriptorSet0.vp_c9)._m0[20].x, _183);
    float _187 = _117 * _181;
    float _189 = _185 * 6.283185482025146484375;
    float _191 = floor(_185);
    out.m_64.x = _169;
    float _193 = _189 * 0.15915493667125701904296875;
    out.m_64.y = _179;
    int _195 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _197 = _195 != 0;
    float _199 = _193 * 6.283185482025146484375;
    float _201 = cos(_199);
    bool _203 = !_173;
    int _205 = _203 ? 0 : 1;
    int _207 = abs(_205);
    bool _209 = !_197;
    int _211 = _209 ? 0 : 1;
    float _213 = -_191;
    float _215 = _185 + _213;
    bool _217 = !_177;
    int _219 = _217 ? 0 : 1;
    int _221 = abs(_211);
    float _223 = -_215;
    float _225 = fma(_223, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _227 = float(_207);
    bool _229 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _231 = fma(_201, 0.5, 0.5);
    int _233 = abs(_219);
    float _235 = abs(_225);
    float _237 = _227 * _235;
    float _239 = -_231;
    float _241 = fma(_239, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _243 = _215 < 0.5;
    float _245 = float(_243);
    float _247 = float(_221);
    float _249 = float(_233);
    float _251 = -_245;
    float _253 = fma(_251, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _255 = fma(_247, _241, _237);
    float _257 = abs(_253);
    float _259 = fma(_249, _257, _255);
    bool _261 = !_229;
    float _263 = _179;
    float _265 = _169;
    float _281;
    if (!_261)
    {
        float _267 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _269 = _163 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _271 = fma(_269, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _273 = _271 * _267;
        float _275 = floor(_273);
        float _277 = -_275;
        float _279 = _273 + _277;
        _281 = _279;
        _283 = true;
    }
    else
    {
        _281 = _187;
    }
    _283 = false;
    float _285 = _281;
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _289 = _285 + _287;
    float _291 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _293 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _291;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _297 = _295 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _299 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _301 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _299;
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _305 = _303 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _307 = 1.0 / _293;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _311 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _309;
    float _313 = 1.0 / _297;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _317 = _285 + _315;
    bool _319 = _285 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _321 = isnan(_285);
    bool _323 = _319 || _321;
    bool _325 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _327 = _323 || _325;
    float _329 = float(_327);
    float _331 = 1.0 / _301;
    float _333 = _317 * _307;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _337 = _285 + _335;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _341 = _285 + _339;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _345 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _343;
    bool _347 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _349 = 1.0 / _305;
    float _351 = _289 * _313;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _355 = _285 + _353;
    bool _357 = _285 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _359 = isnan(_285);
    bool _361 = _357 || _359;
    bool _363 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _365 = _361 || _363;
    float _367 = float(_365);
    bool _369 = _285 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _371 = isnan(_285);
    bool _373 = _369 || _371;
    bool _375 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _377 = _373 || _375;
    float _379 = float(_377);
    float _381 = 1.0 / _311;
    float _383 = _337 * _331;
    bool _385 = _285 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _387 = isnan(_285);
    bool _389 = _385 || _387;
    bool _391 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _393 = _389 || _391;
    float _395 = float(_393);
    float _397 = -_379;
    float _399 = _397 + 1.0;
    float _401 = _341 * _349;
    bool _403 = _285 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _405 = isnan(_285);
    bool _407 = _403 || _405;
    bool _409 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _411 = _407 || _409;
    float _413 = float(_411);
    bool _415 = _285 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _417 = isnan(_285);
    bool _419 = _415 || _417;
    bool _421 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _423 = _419 || _421;
    float _425 = float(_423);
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _429 = _427 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _431 = -_413;
    float _433 = _431 + 1.0;
    float _435 = _355 * _381;
    float _437 = -_367;
    float _439 = _437 + 1.0;
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _443 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _441;
    float _445 = _379 * _433;
    float _447 = fma(_345, _333, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _449 = _413 * _439;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _453 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _451;
    float _455 = fma(_443, _333, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _457 = _395 * _399;
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _461 = _459 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _463 = fma(_453, _333, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _465 = -_395;
    float _467 = _465 + 1.0;
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _471 = _469 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _473 = fma(_429, _351, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _475 = fma(_461, _351, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _477 = _329 * _467;
    float _479 = -_329;
    float _481 = _479 + 1.0;
    float _483 = fma(_471, _351, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _485 = _425 * _481;
    float _487 = -_425;
    float _489 = _487 + 1.0;
    float _491 = _447 * _485;
    float _493 = _455 * _485;
    float _495 = _463 * _485;
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _499 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _497;
    float _501 = fma(_489, (*spvDescriptorSet0.vp_c9)._m0[143].y, _491);
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _505 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _503;
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _509 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _507;
    float _511 = fma(_499, _383, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _513 = fma(_489, (*spvDescriptorSet0.vp_c9)._m0[143].x, _495);
    float _515 = fma(_483, _477, _501);
    float _517 = fma(_505, _383, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _519 = fma(_509, _383, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _521 = fma(_489, (*spvDescriptorSet0.vp_c9)._m0[143].z, _493);
    float _523 = fma(_473, _477, _513);
    float _525 = fma(_511, _457, _515);
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _529 = _527 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _533 = _531 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _537 = _535 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _539 = fma(_529, _401, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _541 = fma(_517, _457, _523);
    float _543 = fma(_533, _401, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _545 = fma(_537, _401, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _547 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _549 = in.m_66.x;
    float _551 = in.m_66.y;
    float _553 = in.m_66.z;
    float _555 = fma(_475, _477, _521);
    float _557 = fma(_543, _445, _525);
    out.m_68.w = _547;
    float _559 = fma(_519, _457, _555);
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _563 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _561;
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _567 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _565;
    float _569 = fma(_539, _445, _541);
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _573 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _571;
    float _575 = fma(_563, _435, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _577 = fma(_567, _435, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _579 = fma(_545, _445, _559);
    float _581 = fma(_573, _435, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _583 = fma(_575, _449, _569);
    float _585 = fma(_577, _449, _557);
    float _587 = fma(_581, _449, _579);
    float _589 = fma(_367, (*spvDescriptorSet0.vp_c9)._m0[148].x, _583);
    float _591 = fma(_367, (*spvDescriptorSet0.vp_c9)._m0[148].y, _585);
    float _593 = fma(_367, (*spvDescriptorSet0.vp_c9)._m0[148].z, _587);
    float _595 = _589 * _549;
    float _597 = _591 * _551;
    float _599 = _593 * _553;
    bool _601 = !_347;
    float _617;
    if (!_601)
    {
        float _603 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _605 = _163 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _607 = fma(_605, (*spvDescriptorSet0.vp_c9)._m0[14].x, _117);
        float _609 = _607 * _603;
        float _611 = floor(_609);
        float _613 = -_611;
        float _615 = _609 + _613;
        _617 = _615;
        _619 = true;
    }
    else
    {
        _617 = _187;
    }
    _619 = false;
    float _621 = _617;
    float _623 = in.m_49.x;
    float _625 = in.m_49.y;
    float _627 = in.m_49.z;
    bool _629 = _147 > 0.5;
    float _631 = in.m_70.y;
    int _633 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _635 = _633 != 0;
    int _637 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _639 = _637 != 0;
    float _641 = in.m_72.x;
    float _643 = in.m_72.y;
    float _645 = in.m_72.z;
    float _647 = in.m_72.w;
    float _649 = in.m_74.x;
    float _651 = in.m_74.y;
    float _653 = in.m_74.z;
    float _655 = in.m_74.w;
    float _657 = in.m_76.x;
    float _659 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _661 = _659 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _663 = 1.0 / _661;
    float _665 = _625 + _631;
    float _667 = -_179;
    float _669 = _667 + 1.0;
    float _671 = _625 * _643;
    float _673 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _675 = _665 + _673;
    if (_635)
    {
        float _677 = _629 ? _669 : _179;
        _263 = _677;
    }
    float _679 = _263;
    float _681 = _625 * _651;
    bool _683 = _163 > 0.5;
    bool _685 = _683 && _639;
    float _687 = fma(_623, _641, _671);
    float _689 = _163 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _691 = fma(_623, _649, _681);
    float _693 = fma(_627, _645, _687);
    float _695 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _697 = fma(_627, _653, _691);
    float _699 = _147 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _701 = _693 + _647;
    float _703 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _705 = -_695;
    float _707 = fma(_689, 2.0, _705);
    float _709 = _697 + _655;
    float _711 = _695;
    if (!_639)
    {
        _711 = _169;
    }
    float _713 = _711;
    float _715 = _675 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _717 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _719 = _701 + _717;
    float _721 = _713;
    if (_685)
    {
        float _723 = -_169;
        float _725 = _723 + 1.0;
        _265 = _725;
    }
    float _727 = _265;
    float _729 = fma(_699, -2.0, _703);
    float _731 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _733 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _735 = _709 + _733;
    float _737 = fma(_719, (*spvDescriptorSet0.vp_c8)._m0[28].x, _715);
    if (_639)
    {
        _721 = _727;
    }
    float _739 = _721;
    float _741 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _743 = fma(_163, (*spvDescriptorSet0.vp_c9)._m0[78].z, _731);
    float _745 = fma(_735, (*spvDescriptorSet0.vp_c8)._m0[28].z, _737);
    float _747 = -_117;
    float _749 = fma(_747, (*spvDescriptorSet0.vp_c9)._m0[76].x, _707);
    float _751 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[78].w, _741);
    float _753 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].z, _743);
    float _755 = fma(_739, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    bool _757 = _745 >= 0.0;
    float _759 = fma(_679, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _761 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].w, _751);
    float _763 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[76].y, _729);
    float _765 = fma(_753, _755, _749);
    float _767 = _675 * _675;
    float _769 = -_763;
    float _771 = fma(_761, _759, _769);
    float _773 = _765 + 0.5;
    float _775 = fma(_719, _719, _767);
    float _777 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _779 = _777 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _781 = fma(_735, _735, _775);
    float _783 = _743;
    if (_757)
    {
        _783 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _785 = _783;
    float _787 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _789 = _787 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _791 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _793 = _791 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _795 = 1.0 / _779;
    float _797 = _771 + 0.5;
    int _799 = as_type<int>(_785);
    if (_757)
    {
        float _801 = _785 * 5.0;
        _799 = as_type<int>(_801);
    }
    int _803 = _799;
    out.m_78.x = _657;
    float _805 = _259 * _595;
    float _807 = _259 * _597;
    float _809 = rsqrt(_781);
    out.m_80.x = _773;
    out.m_80.y = _797;
    if (_757)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3907 = as_type<float>(_803);
        out.gl_Position.z = _3907;
    }
    float _811 = 1.0 / _789;
    if (_757)
    {
        out.m_56.x = 0.0;
    }
    float _813 = 1.0 / _793;
    float _815 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _817 = _815 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _819 = _675 * _809;
    float _821 = _719 * _809;
    if (_757)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _823 = -_819;
    float _825 = fma(_823, (*spvDescriptorSet0.vp_c9)._m0[18].w, _665);
    float _827 = -_821;
    float _829 = fma(_827, (*spvDescriptorSet0.vp_c9)._m0[18].w, _701);
    float _831 = _735 * _809;
    float _833 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _835 = _833 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _837 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _839 = _825 + _837;
    float _841 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _843 = _829 + _841;
    float _845 = -_831;
    float _847 = fma(_845, (*spvDescriptorSet0.vp_c9)._m0[18].w, _709);
    float _849 = 1.0 / _817;
    float _851 = _839 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _853 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _855 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _853;
    float _857 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _859 = _847 + _857;
    float _861 = _657 * 12.98980045318603515625;
    float _863 = fma(_843, (*spvDescriptorSet0.vp_c8)._m0[28].x, _851);
    float _865 = _259 * _599;
    float _867 = in.m_58.w;
    float _869 = fma(_859, (*spvDescriptorSet0.vp_c8)._m0[28].z, _863);
    float _871 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _873 = _871 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _875 = 1.0 / _835;
    float _877 = _855 * _795;
    float _879 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _881 = _879 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    bool _883 = _869 >= 0.0;
    float _885 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _887 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _885;
    float _889 = _881 * _663;
    float _891 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _893 = _621 + _891;
    float _895 = 1.0 / _873;
    float _897 = _887 * _811;
    float _899 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _901 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _899;
    float _903 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _905 = _903 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _907 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _909 = _907 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _911 = _901 * _849;
    float _913 = fma(_889, _893, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _915 = _905 * _813;
    float _917 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _919 = _621 + _917;
    float _921 = _909 * _875;
    float _923 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _925 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _923;
    float _927 = _875;
    if (_883)
    {
        _927 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _929 = _927;
    float _931 = fma(_867, 78.233001708984375, _861);
    float _933 = fma(_877, _919, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _935 = _621 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _937 = isnan(_621);
    bool _939 = _935 || _937;
    bool _941 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _943 = _939 || _941;
    float _945 = float(_943);
    float _947 = _925 * _895;
    float _949 = _931 * 0.15915493667125701904296875;
    int _951 = as_type<int>(_929);
    if (_883)
    {
        float _953 = _929 * 5.0;
        _951 = as_type<int>(_953);
    }
    int _955 = _951;
    bool _957 = _621 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _959 = isnan(_621);
    bool _961 = _957 || _959;
    bool _963 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _965 = _961 || _963;
    float _967 = float(_965);
    float _969 = -_945;
    float _971 = _969 + 1.0;
    float _973 = -_819;
    float _975 = fma(_973, (*spvDescriptorSet0.vp_c9)._m0[18].w, _675);
    float _977 = _949 * 6.283185482025146484375;
    float _979 = sin(_977);
    if (_883)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4193 = as_type<float>(_955);
        out.gl_Position.z = _4193;
    }
    float _981 = _967 * _971;
    bool _983 = _621 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _985 = isnan(_621);
    bool _987 = _983 || _985;
    bool _989 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _991 = _987 || _989;
    float _993 = float(_991);
    float _995 = -_967;
    float _997 = _995 + 1.0;
    if (_883)
    {
        out.m_56.x = 0.0;
    }
    float _999 = -_821;
    float _1001 = fma(_999, (*spvDescriptorSet0.vp_c9)._m0[18].w, _719);
    float _1003 = _975 * _975;
    if (_883)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1005 = in.m_58.z;
    bool _1007 = _621 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1009 = isnan(_621);
    bool _1011 = _1007 || _1009;
    bool _1013 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1015 = _1011 || _1013;
    float _1017 = float(_1015);
    float _1019 = -_993;
    float _1021 = _1019 + 1.0;
    bool _1023 = _621 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1025 = isnan(_621);
    bool _1027 = _1023 || _1025;
    bool _1029 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1031 = _1027 || _1029;
    float _1033 = float(_1031);
    float _1035 = fma(_1001, _1001, _1003);
    float _1037 = -_831;
    float _1039 = fma(_1037, (*spvDescriptorSet0.vp_c9)._m0[18].w, _735);
    float _1041 = _993 * _997;
    float _1043 = -_1017;
    float _1045 = _1043 + 1.0;
    float _1047 = _1017 * _1021;
    bool _1049 = _621 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1051 = isnan(_621);
    bool _1053 = _1049 || _1051;
    bool _1055 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1057 = _1053 || _1055;
    float _1059 = float(_1057);
    float _1061 = fma(_1039, _1039, _1035);
    float _1063 = -_1033;
    float _1065 = _1063 + 1.0;
    float _1067 = _1033 * _1045;
    float _1069 = -_665;
    float _1071 = _1069 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    bool _1073 = _621 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1075 = isnan(_621);
    bool _1077 = _1073 || _1075;
    bool _1079 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1081 = _1077 || _1079;
    float _1083 = float(_1081);
    float _1085 = _1059 * _1065;
    float _1087 = fma(_163, 78.233001708984375, _861);
    float _1089 = -_1059;
    float _1091 = _1089 + 1.0;
    float _1093 = -_701;
    float _1095 = _1093 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1097 = _1071 * _1071;
    float _1099 = _979 * 43758.546875;
    float _1101 = _1087 * 0.15915493667125701904296875;
    float _1103 = _1083 * _1091;
    float _1105 = -_1083;
    float _1107 = _1105 + 1.0;
    bool _1109 = _621 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1111 = isnan(_621);
    bool _1113 = _1109 || _1111;
    bool _1115 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1117 = _1113 || _1115;
    float _1119 = float(_1117);
    float _1121 = -_709;
    float _1123 = _1121 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1125 = fma(_1095, _1095, _1097);
    float _1127 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1129 = _621 + _1127;
    float _1131 = fma(_1005, 78.233001708984375, _861);
    float _1133 = floor(_1099);
    float _1135 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1137 = _621 + _1135;
    float _1139 = _1119 * _1107;
    float _1141 = fma(_897, _1129, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1143 = fma(_147, 78.233001708984375, _861);
    float _1145 = fma(_915, _1137, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1147 = _933 * _1139;
    float _1149 = -_1119;
    float _1151 = _1149 + 1.0;
    float _1153 = _1101 * 6.283185482025146484375;
    float _1155 = sin(_1153);
    float _1157 = _1131 * 0.15915493667125701904296875;
    float _1159 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1161 = _621 + _1159;
    float _1163 = fma(_1151, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1147);
    float _1165 = _1143 * 0.15915493667125701904296875;
    float _1167 = _865 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1169 = fma(_911, _1161, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1171 = fma(_913, _1103, _1163);
    float _1173 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1175 = _621 + _1173;
    float _1177 = fma(_1123, _1123, _1125);
    float _1179 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1181 = _621 + _1179;
    float _1183 = _1157 * 6.283185482025146484375;
    float _1185 = sin(_1183);
    float _1187 = fma(_1141, _1085, _1171);
    float _1189 = fma(_921, _1181, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1191 = -_1133;
    float _1193 = _1099 + _1191;
    float _1195 = fma(_947, _1175, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1197 = in.m_82.x;
    float _1199 = in.m_82.y;
    float _1201 = in.m_82.z;
    float _1203 = fma(_1145, _1067, _1187);
    float _1205 = rsqrt(_1177);
    float _1207 = fma(_1193, 0.5, _187);
    float _1209 = precise::clamp(_1207, 0.0, 1.0);
    float _1211 = _1155 * 43758.546875;
    float _1213 = fma(_1169, _1047, _1203);
    float _1215 = -_1209;
    float _1217 = fma(_1215, _1209, 1.0);
    float _1219 = fma(_1189, _1041, _1213);
    float _1221 = _1165 * 6.283185482025146484375;
    float _1223 = sin(_1221);
    float _1225 = _1185 * 43758.546875;
    float _1227 = _805 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1229 = fma(_1195, _981, _1219);
    float _1231 = fma(_945, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1229);
    float _1233 = _1095 * _1205;
    float _1235 = _1123 * _1205;
    float _1237 = _1071 * _1205;
    float _1239 = sqrt(_1061);
    float _1241 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1243 = _1233 * _1241;
    float _1245 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1247 = _1235 * _1245;
    float _1249 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1251 = _1237 * _1249;
    float _1253 = _1217 * _1197;
    float _1255 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1257 = -_1243;
    float _1259 = fma(_1235, _1255, _1257);
    float _1261 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1263 = -_1247;
    float _1265 = fma(_1237, _1261, _1263);
    float _1267 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1269 = -_1251;
    float _1271 = fma(_1233, _1267, _1269);
    float _1273 = floor(_1225);
    float _1275 = _1259 * _1259;
    float _1277 = _1223 * 43758.546875;
    float _1279 = _1217 * _1199;
    float _1281 = _1217 * _1201;
    float _1283 = fma(_1265, _1265, _1275);
    float _1285 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1253);
    float _1287 = floor(_1277);
    float _1289 = fma(_1271, _1271, _1283);
    float _1291 = _809 * _1239;
    float _1293 = _807 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1295 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1279);
    float _1297 = _1291 * _1227;
    float _1299 = _1291 * _1293;
    float _1301 = rsqrt(_1289);
    float _1303 = -_1273;
    float _1305 = _1225 + _1303;
    float _1307 = _1285 * _1297;
    float _1309 = _1295 * _1299;
    float _1311 = _1291 * _1167;
    float _1313 = fma(_1305, 0.4000000059604644775390625, 0.100000001490116119384765625);
    float _1315 = floor(_1211);
    float _1317 = -_1287;
    float _1319 = _1277 + _1317;
    float _1321 = _117 * _1313;
    float _1323 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1281);
    float _1325 = fma(_1319, 6.283185482025146484375, _1321);
    float _1327 = _1265 * _1301;
    float _1329 = _1271 * _1301;
    float _1331 = _1323 * _1311;
    float _1333 = _1325 * 0.15915493667125701904296875;
    float _1335 = _1237 * _1327;
    float _1337 = _1233 * _1329;
    float _1339 = fma(_1319, 2.0, -1.0);
    float _1341 = -_1315;
    float _1343 = _1211 + _1341;
    float _1345 = _1259 * _1301;
    float _1347 = _1333 * 6.283185482025146484375;
    float _1349 = sin(_1347);
    float _1351 = fma(_1305, 0.60000002384185791015625, -0.300000011920928955078125);
    float _1353 = fma(_1343, 6.283185482025146484375, _1321);
    float _1355 = _1235 * _1345;
    float _1357 = -_1335;
    float _1359 = fma(_1233, _1345, _1357);
    float _1361 = fma(_1343, 0.60000002384185791015625, -0.300000011920928955078125);
    float _1363 = _1353 * 0.15915493667125701904296875;
    float _1365 = -_1355;
    float _1367 = fma(_1237, _1329, _1365);
    float _1369 = _1309 * _1359;
    float _1371 = -_1337;
    float _1373 = fma(_1235, _1327, _1371);
    float _1375 = _1309 * _1367;
    float _1377 = fma(_1307, _1329, _1369);
    float _1379 = _1363 * 6.283185482025146484375;
    float _1381 = sin(_1379);
    float _1383 = fma(_1307, _1327, _1375);
    float _1385 = fma(_1331, _1235, _1377);
    float _1387 = fma(_1331, _1233, _1383);
    float _1389 = _709 + _1385;
    float _1391 = _701 + _1387;
    float _1393 = fma(_1231, _1351, _1389);
    float _1395 = fma(_1231, _1361, _1391);
    float _1397 = fma(_1349, 0.039999999105930328369140625, _1393);
    float _1399 = fma(_1381, 0.039999999105930328369140625, _1395);
    float _1401 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1403 = _1397 + _1401;
    float _1405 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1407 = _1399 + _1405;
    float _1409 = _1403 * _1403;
    float _1411 = fma(_1407, _1407, _1409);
    float _1413 = sqrt(_1411);
    bool _1415 = _1413 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1417 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1419 = _1413 + _1417;
    float _1421 = _1229;
    float _1423 = _1397;
    float _1425 = _1399;
    if (_1415)
    {
        float _1427 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1421 = _1427;
    }
    float _1429 = _1421;
    float _1431 = _1429;
    if (_1415)
    {
        float _1433 = _1419 * _1429;
        _1431 = _1433;
    }
    float _1435 = _1431;
    float _1437 = _1309 * _1373;
    float _1439 = _1435;
    if (_1415)
    {
        float _1441 = _1435 * 0.15915493667125701904296875;
        _1439 = _1441;
    }
    float _1443 = _1439;
    float _1445 = fma(_1307, _1345, _1437);
    float _1447 = _1437;
    float _1449 = _1445;
    if (_1415)
    {
        float _1451 = _1443 * 6.283185482025146484375;
        float _1453 = sin(_1451);
        _1447 = _1453;
    }
    float _1455 = _1447;
    float _1457 = fma(_1331, _1237, _1445);
    float _1459 = _665 + _1457;
    float _1461 = _1457;
    if (_1415)
    {
        float _1463 = rsqrt(_1411);
        _1461 = _1463;
    }
    float _1465 = _1461;
    float _1467 = fma(_1231, _1339, _1459);
    float _1469 = _1467;
    if (_1415)
    {
        float _1471 = _1467 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1449 = _1471;
    }
    float _1473 = _1449;
    float _1475 = _1473;
    if (_1415)
    {
        float _1477 = fma(_1455, _1473, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1475 = _1477;
    }
    float _1479 = _1475;
    float _1481 = _1465;
    if (_1415)
    {
        float _1483 = _1465 * _1479;
        _1481 = _1483;
    }
    float _1485 = _1481;
    if (_1415)
    {
        float _1487 = fma(_1403, _1485, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1423 = _1487;
    }
    float _1489 = _1423;
    if (_1415)
    {
        float _1491 = fma(_1407, _1485, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1425 = _1491;
    }
    float _1493 = _1425;
    float _1495 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _1497 = _1489 + _1495;
    float _1499 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _1501 = _1493 + _1499;
    float _1503 = fma(_1497, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1505 = fma(_1501, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _4990 = float2(_1505, _1503);
    float _1507 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_4990, float2(0.0), isnan(_4990)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_4990, float2(0.0), isnan(_4990)), level(0.0)).x;
    float _1509 = fma(_1507, 100.0, _665);
    float _1511 = -_819;
    float _1513 = fma(_1511, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1509);
    float _1515 = _1513 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1517 = fma(_829, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1515);
    float _1519 = fma(_847, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1517);
    float _1521 = _1513 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1523 = _1519 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1525 = fma(_829, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1521);
    float _1527 = 1.0 / _1523;
    float _1529 = fma(_847, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1525);
    float _1531 = _1529 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1533 = _1531 + _1523;
    float _1535 = _1533 * _1527;
    float _1537 = _1535 * 0.5;
    float _1539 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1541 = fma(_1537, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1539);
    float _1543 = 1.0 / _1541;
    float _1545 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _1547 = _1513 + _1545;
    float _1549 = _1547 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1551 = _1547 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1553 = fma(_829, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1549);
    float _1555 = fma(_829, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1551);
    float _1557 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1559 = _1543 * _1557;
    float _1561 = fma(_847, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1553);
    float _1563 = fma(_847, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1555);
    bool _1565 = _1559 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1567 = _1561 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _1569 = _1559 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1571 = _1563 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    bool _1573 = !_1565;
    int _1575 = _1573 ? 0 : 1;
    float _1577 = trunc(_1571);
    int _1579 = int(_1577);
    int _1581 = 2;
    if (!_1565)
    {
        _1581 = 1;
    }
    int _1583 = _1581;
    int _1585 = _1583;
    if (!_1569)
    {
        _1585 = _1575;
    }
    int _1587 = _1585;
    float _1589 = trunc(_1567);
    int _1591 = int(_1589);
    int _1593 = _1587 << 6;
    int _1595 = _1593 + 96;
    uint _1598 = uint(int(uint(_1595) >> uint(2)));
    uint _1600 = uint(int(uint(int(_1598)) >> uint(2)));
    int _1602 = int(_1598) & 3;
    float _1604 = (*spvDescriptorSet0.vp_c15)._m0[int(_1600)][_1602];
    int _1606 = int(_1598) + 1;
    uint _1608 = uint(int(uint(_1606) >> uint(2)));
    int _1610 = _1606 & 3;
    float _1612 = (*spvDescriptorSet0.vp_c15)._m0[int(_1608)][_1610];
    int _1614 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1616 = _1579 + _1614;
    int _1618 = _1616 + 1;
    int _1620 = _1593 + 104;
    uint _1622 = uint(int(uint(_1620) >> uint(2)));
    uint _1624 = uint(int(uint(int(_1622)) >> uint(2)));
    int _1626 = int(_1622) & 3;
    float _1628 = (*spvDescriptorSet0.vp_c15)._m0[int(_1624)][_1626];
    int _1630 = int(_1622) + 1;
    uint _1632 = uint(int(uint(_1630) >> uint(2)));
    int _1634 = _1630 & 3;
    float _1636 = (*spvDescriptorSet0.vp_c15)._m0[int(_1632)][_1634];
    int _1638 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1640 = _1591 + _1638;
    int _1642 = _1640 + 1;
    int _1644 = _1642 | _1618;
    int _1646 = _1593 + 48;
    uint _1648 = uint(int(uint(_1646) >> uint(2)));
    uint _1650 = uint(int(uint(int(_1648)) >> uint(2)));
    int _1652 = int(_1648) & 3;
    float _1654 = (*spvDescriptorSet0.vp_c15)._m0[int(_1650)][_1652];
    int _1656 = int(_1648) + 1;
    uint _1658 = uint(int(uint(_1656) >> uint(2)));
    int _1660 = _1656 & 3;
    float _1662 = (*spvDescriptorSet0.vp_c15)._m0[int(_1658)][_1660];
    bool _1664 = _1642 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1666 = _1644 < 0;
    bool _1668 = _1666 || _1664;
    int _1670 = _1593 + 64;
    uint _1672 = uint(int(uint(_1670) >> uint(2)));
    uint _1674 = uint(int(uint(int(_1672)) >> uint(2)));
    int _1676 = int(_1672) & 3;
    float _1678 = (*spvDescriptorSet0.vp_c15)._m0[int(_1674)][_1676];
    int _1680 = int(_1672) + 1;
    uint _1682 = uint(int(uint(_1680) >> uint(2)));
    int _1684 = _1680 & 3;
    float _1686 = (*spvDescriptorSet0.vp_c15)._m0[int(_1682)][_1684];
    bool _1688 = _1618 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1690 = _1688 || _1668;
    int _1692 = _1593 + 56;
    uint _1694 = uint(int(uint(_1692) >> uint(2)));
    uint _1696 = uint(int(uint(int(_1694)) >> uint(2)));
    int _1698 = int(_1694) & 3;
    float _1700 = (*spvDescriptorSet0.vp_c15)._m0[int(_1696)][_1698];
    int _1702 = int(_1694) + 1;
    uint _1704 = uint(int(uint(_1702) >> uint(2)));
    int _1706 = _1702 & 3;
    float _1708 = (*spvDescriptorSet0.vp_c15)._m0[int(_1704)][_1706];
    int _1710 = _1642;
    int _1712 = _1618;
    float _1714 = as_type<float>(_1587);
    if (!_1690)
    {
        int _1716 = _1618 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1718 = _1716 + _1642;
        _1710 = _1718;
    }
    int _1720 = _1710;
    int _1722 = _1593 + 72;
    uint _1724 = uint(int(uint(_1722) >> uint(2)));
    uint _1726 = uint(int(uint(int(_1724)) >> uint(2)));
    int _1728 = int(_1724) & 3;
    float _1730 = (*spvDescriptorSet0.vp_c15)._m0[int(_1726)][_1728];
    int _1732 = int(_1724) + 1;
    uint _1734 = uint(int(uint(_1732) >> uint(2)));
    int _1736 = _1732 & 3;
    float _1738 = (*spvDescriptorSet0.vp_c15)._m0[int(_1734)][_1736];
    if (!_1690)
    {
        int _1740 = _1720 << 2;
        _1712 = _1740;
    }
    int _1742 = _1712;
    float _1744 = _1547 * _1612;
    int _1746 = as_type<int>(_1612);
    int _1748 = as_type<int>(_1744);
    if (!_1690)
    {
        uint _1750 = uint(int(uint(_1720) >> uint(2)));
        _1746 = int(_1750);
    }
    int _1752 = _1746;
    float _1754 = fma(_829, _1604, _1744);
    if (!_1690)
    {
        int _1756 = 12 & _1742;
        _1748 = _1756;
    }
    int _1758 = _1748;
    float _1760 = fma(_847, _1628, _1754);
    float _1762 = _1628;
    if (!_1690)
    {
        int _1764 = _1752 << 4;
        int _1766 = _1764 + _1758;
        _1762 = as_type<float>(_1766);
    }
    float _1768 = _1762;
    float _1770 = _1760 + _1636;
    int _1772 = _1593 + 80;
    uint _1774 = uint(int(uint(_1772) >> uint(2)));
    uint _1776 = uint(int(uint(int(_1774)) >> uint(2)));
    int _1778 = int(_1774) & 3;
    float _1780 = (*spvDescriptorSet0.vp_c15)._m0[int(_1776)][_1778];
    int _1782 = int(_1774) + 1;
    uint _1784 = uint(int(uint(_1782) >> uint(2)));
    int _1786 = _1782 & 3;
    float _1788 = (*spvDescriptorSet0.vp_c15)._m0[int(_1784)][_1786];
    float _1790 = _1547 * _1662;
    float _1792 = 1.0 / _1770;
    float _1794 = fma(_829, _1654, _1790);
    float _1796 = _1768;
    float _1798 = _1770;
    if (!_1690)
    {
        int _1800 = as_type<int>(_1768) + 400;
        uint _1802 = uint(int(uint(_1800) >> uint(2)));
        uint _1804 = uint(int(uint(int(_1802)) >> uint(2)));
        int _1806 = int(_1802) & 3;
        float _1808 = (*spvDescriptorSet0.vp_c15)._m0[int(_1804)][_1806];
        _1796 = _1808;
    }
    float _1810 = _1796;
    float _1812 = _1547 * _1686;
    float _1814 = fma(_829, _1678, _1812);
    int _1816 = _1593 + 88;
    uint _1818 = uint(int(uint(_1816) >> uint(2)));
    uint _1820 = uint(int(uint(int(_1818)) >> uint(2)));
    int _1822 = int(_1818) & 3;
    float _1824 = (*spvDescriptorSet0.vp_c15)._m0[int(_1820)][_1822];
    int _1826 = int(_1818) + 1;
    uint _1828 = uint(int(uint(_1826) >> uint(2)));
    int _1830 = _1826 & 3;
    float _1832 = (*spvDescriptorSet0.vp_c15)._m0[int(_1828)][_1830];
    float _1834 = _1812;
    if (!_1690)
    {
        float _1836 = floor(_1571);
        _1834 = _1836;
    }
    float _1838 = _1834;
    float _1840 = fma(_847, _1700, _1794);
    float _1842 = _1840 + _1708;
    float _1844 = _1794;
    if (!_1690)
    {
        float _1846 = floor(_1567);
        _1844 = _1846;
    }
    float _1848 = _1844;
    float _1850 = fma(_847, _1730, _1814);
    float _1852 = _1842 * _1792;
    float _1854 = _1850 + _1738;
    bool _1856 = _1852 >= 0.0;
    float _1858 = fma(_829, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1860 = _1854 * _1792;
    float _1862 = _1838;
    float _1864 = _1860;
    if (!_1690)
    {
        float _1866 = -_1838;
        float _1868 = _1571 + _1866;
        _1862 = _1868;
    }
    float _1870 = _1862;
    float _1872 = floor(_1858);
    bool _1874 = _1852 <= 1.0;
    bool _1876 = _1874 && _1856;
    float _1878 = fma(_847, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    if (!_1690)
    {
        float _1880 = -_1848;
        float _1882 = _1567 + _1880;
        _1798 = _1882;
    }
    float _1884 = _1798;
    bool _1886 = _1860 >= 0.0;
    bool _1888 = _1886 && _1876;
    float _1890 = floor(_1878);
    bool _1892 = _1860 <= 1.0;
    bool _1894 = _1892 && _1888;
    float _1896 = _1547 * _1788;
    float _1898 = fma(_829, _1780, _1896);
    float _1900 = -_1872;
    float _1902 = _1858 + _1900;
    float _1904 = _1810;
    if (!_1690)
    {
        float _1906 = rint(_1810);
        float _1908 = precise::max(_1906, 0.0);
        uint _1910 = uint(_1908);
        uint _1912 = clamp(_1910, 0u, 65535u);
        _1904 = as_type<float>(_1912);
    }
    float _1914 = _1904;
    if (_1894)
    {
        float _1916 = float(_1587);
        _1714 = _1916;
    }
    float _1918 = _1714;
    float _1920 = -_1890;
    float _1922 = _1878 + _1920;
    float _1924 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_1894)
    {
        float _1926 = rint(_1918);
        float _1928 = precise::max(_1926, 0.0);
        uint _1930 = uint(_1928);
        uint _1932 = clamp(_1930, 0u, 65535u);
        _1924 = as_type<float>(_1932);
    }
    float _1934 = _1924;
    float2 _5713 = float2(_1902, _1922);
    float _1936 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5713, float2(0.0), isnan(_5713)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5713, float2(0.0), isnan(_5713)), level(0.0)).x;
    float _1938 = fma(_847, _1824, _1898);
    float _1940 = _1938 + _1832;
    float _1942 = _1940 * _1792;
    float _1944 = _1571;
    if (!_1690)
    {
        float3 _5739 = float3(_1884, _1870, float(as_type<int>(_1914)));
        float3 _5743 = select(_5739, float3(0.0), isnan(_5739));
        float _1946 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5743.xy, uint(rint(_5743.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5743.xy, uint(rint(_5743.z)), level(0.0)).x;
        _1944 = _1946;
    }
    float _1948 = _1944;
    float _1950 = _1934;
    if (_1894)
    {
        float3 _5758 = float3(_1852, _1860, float(as_type<int>(_1934)));
        float3 _5760 = select(_5758, float3(0.0), isnan(_5758));
        float _1952 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5760.xy, uint(rint(_5760.z)), _1942, level(0.0));
        _1950 = _1952;
    }
    float _1954 = _1950;
    float _1956 = in.m_84.x;
    float _1958 = in.m_84.y;
    float _1960 = in.m_84.z;
    bool _1962 = _1279 != 0.0;
    bool _1964 = isnan(_1279);
    bool _1966 = _1962 || _1964;
    bool _1968 = isnan(0.0);
    bool _1970 = _1966 || _1968;
    float _1972 = _1824;
    if (_1415)
    {
        float _1974 = _1443 * 6.283185482025146484375;
        float _1976 = cos(_1974);
        _1972 = _1976;
    }
    float _1978 = _1972;
    float _1980 = -_821;
    float _1982 = fma(_1980, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1493);
    out.m_68.w = _547;
    bool _1984 = _1253 == 0.0;
    bool _1986 = !_1970;
    bool _1988 = _1984 && _1986;
    bool _1990 = _1281 == 0.0;
    bool _1992 = _1990 && _1988;
    float _1994 = -_831;
    float _1996 = fma(_1994, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1489);
    float _1998 = _1996;
    if (_1415)
    {
        float _2000 = _1978 + (-1.0);
        _1864 = _2000;
    }
    float _2002 = _1864;
    float _2004 = _2002;
    if (_1415)
    {
        float _2006 = _2002 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2004 = _2006;
    }
    float _2008 = _2004;
    float _2010 = _1958;
    float _2012 = _1956;
    float _2014 = _1960;
    if (!_1992)
    {
        float _2016 = fma(_1279, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1958);
        _2010 = _2016;
    }
    float _2018 = _2010;
    if (!_1992)
    {
        float _2020 = fma(_1253, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1956);
        _2012 = _2020;
    }
    float _2022 = _2012;
    if (!_1992)
    {
        float _2024 = fma(_1281, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1960);
        _2014 = _2024;
    }
    float _2026 = _2014;
    bool _2028 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2030 = isnan(0.5);
    bool _2032 = _2028 || _2030;
    bool _2034 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2036 = _2032 || _2034;
    float _2038 = _1367 * _2018;
    float _2040 = _1373 * _2018;
    if (_1415)
    {
        float _2042 = fma(_1467, _1978, _2008);
        _1469 = _2042;
    }
    float _2044 = _1469;
    float _2046 = _1359 * _2018;
    float _2048 = fma(_1327, _2022, _2038);
    float _2050 = fma(_1345, _2022, _2040);
    float _2052 = fma(_1507, 100.0, _2044);
    float _2054 = fma(_1329, _2022, _2046);
    float _2056 = fma(_1233, _2026, _2048);
    float _2058 = fma(_1237, _2026, _2050);
    float _2060 = -_819;
    float _2062 = fma(_2060, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2052);
    float _2064 = fma(_1235, _2026, _2054);
    float _2066 = _2052;
    float _2068 = _2062;
    if (_2036)
    {
        _2066 = _1982;
    }
    float _2070 = _2066;
    float _2072 = _2070;
    float _2074 = _1954;
    if (!_2036)
    {
        float _2076 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2078 = _1513 + _2076;
        float _2080 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2082 = -_709;
        float _2084 = _2082 + _1489;
        float _2086 = -_665;
        float _2088 = _2086 + _2044;
        float _2090 = _2078 * _2078;
        float _2092 = -_701;
        float _2094 = _2092 + _1493;
        float _2096 = fma(_843, _843, _2090);
        float _2098 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2100 = fma(_859, _859, _2096);
        float _2102 = 1.0 / _1291;
        float _2104 = sqrt(_2100);
        float _2106 = _2098 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2108 = precise::min(_2104, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2110 = _2108 * _2080;
        float _2112 = _2110 * _2102;
        float _2114 = _2106 * _2112;
        float _2116 = _2084 * _2112;
        float _2118 = fma(_2088, _2114, _1513);
        float _2120 = fma(_2094, _2114, _829);
        float _2122 = fma(_2106, _2116, _847);
        _2068 = _2118;
        _2072 = _2120;
        _1998 = _2122;
    }
    float _2124 = _2068;
    float _2126 = _2072;
    float _2128 = _1998;
    float _2130 = abs(_1559);
    float _2132 = log2(_2130);
    float _2134 = _2124 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2136 = _2124 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2138 = _2124 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2140 = _2124 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2142 = fma(_2126, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2134);
    float _2144 = fma(_2126, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2136);
    float _2146 = fma(_2126, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2138);
    float _2148 = fma(_2126, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2140);
    float _2150 = fma(_2128, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2142);
    float _2152 = fma(_2128, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2144);
    float _2154 = fma(_2128, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2146);
    float _2156 = fma(_2128, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2148);
    float _2158 = _2150 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2160 = _2152 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2162 = _2154 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2164 = _2132 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2166 = _2158 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2168 = _2158 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2170 = _2158 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2172 = _2158 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2174 = fma(_2160, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2166);
    float _2176 = exp2(_2164);
    float _2178 = fma(_2160, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2168);
    float _2180 = fma(_2160, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2170);
    float _2182 = fma(_2160, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2172);
    float _2184 = _2156 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2186 = fma(_2162, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2174);
    float _2188 = fma(_2162, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2178);
    float _2190 = fma(_2162, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2180);
    float _2192 = fma(_2162, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2182);
    float _2194 = fma(_2184, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2186);
    float _2196 = fma(_2184, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2188);
    float _2198 = fma(_2184, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2190);
    float _2200 = fma(_2184, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2192);
    bool _2202 = _1559 <= 8000.0;
    bool _2204 = isnan(_1559);
    bool _2206 = _2202 || _2204;
    bool _2208 = isnan(8000.0);
    bool _2210 = _2206 || _2208;
    float _2212 = float(_2210);
    float _2214 = fma(_2176, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2216 = precise::clamp(_2214, 0.0, 1.0);
    float _2218 = _2162;
    if (_1690)
    {
        _2218 = 1.0;
    }
    float _2220 = _2218;
    out.gl_Position.x = _2194;
    out.gl_Position.y = _2196;
    out.gl_Position.z = _2198;
    out.gl_Position.w = _2200;
    float _2222 = fma(_2216, -2.0, 3.0);
    float _2224 = _2216 * _2216;
    float _2226 = _2224 * _2222;
    float _2228 = -_2226;
    float _2230 = _2228 + 1.0;
    float _2232 = fma(_2230, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2226);
    float _2234 = _2212 * _2232;
    float _2236 = _2220;
    if (!_1690)
    {
        int _2238 = _1720 << 4;
        int _2240 = _2238 + 2048;
        uint _2242 = uint(int(uint(_2240) >> uint(2)));
        uint _2244 = uint(int(uint(int(_2242)) >> uint(2)));
        int _2246 = int(_2242) & 3;
        float _2248 = (*spvDescriptorSet0.vp_c15)._m0[int(_2244)][_2246];
        int _2250 = int(_2242) + 1;
        uint _2252 = uint(int(uint(_2250) >> uint(2)));
        int _2254 = _2250 & 3;
        float _2256 = (*spvDescriptorSet0.vp_c15)._m0[int(_2252)][_2254];
        int _2258 = _2240 + 8;
        uint _2260 = uint(int(uint(_2258) >> uint(2)));
        uint _2262 = uint(int(uint(int(_2260)) >> uint(2)));
        int _2264 = int(_2260) & 3;
        float _2266 = (*spvDescriptorSet0.vp_c15)._m0[int(_2262)][_2264];
        int _2268 = int(_2260) + 1;
        uint _2270 = uint(int(uint(_2268) >> uint(2)));
        int _2272 = _2268 & 3;
        float _2274 = (*spvDescriptorSet0.vp_c15)._m0[int(_2270)][_2272];
        float _2276 = _1547 * _2256;
        float _2278 = fma(_829, _2248, _2276);
        float _2280 = fma(_847, _2266, _2278);
        float _2282 = _2280 + _2274;
        float _2284 = precise::clamp(_2282, 0.0, 1.0);
        float _2286 = -_2284;
        float _2288 = _2286 + _1948;
        float _2290 = fma(_2288, 500.0, 1.5);
        float _2292 = exp2(_2290);
        float _2294 = 0.0 + _2292;
        float _2296 = precise::clamp(_2294, 0.0, 1.0);
        _2236 = _2296;
    }
    float _2298 = _2236;
    float _2300 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2302 = _2124 + _2300;
    float _2304 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2306 = _2126 + _2304;
    float _2308 = _2234 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2310 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2312 = _2128 + _2310;
    float _2314 = _2302 * _2302;
    out.m_86.x = _2056;
    out.m_86.y = _2058;
    out.m_86.z = _2064;
    float _2316 = fma(_2306, _2306, _2314);
    float _2318 = -_1936;
    float _2320 = _2318 + 1.0;
    float _2322 = _2314;
    float _2324 = _2316;
    float _2326 = _2312;
    if (!_1894)
    {
        _2322 = 1.0;
    }
    float _2328 = _2322;
    float _2330 = _2328;
    if (_1894)
    {
        bool _2332 = _1954 >= _1942;
        bool _2334 = isnan(_1954);
        bool _2336 = _2332 || _2334;
        bool _2338 = isnan(_1942);
        bool _2340 = _2336 || _2338;
        float _2342 = float(_2340);
        _2330 = _2342;
    }
    float _2344 = _2330;
    float _2346 = _2320 * _2308;
    float _2348 = precise::clamp(_2346, 0.0, 1.0);
    float _2350 = fma(_2312, _2312, _2316);
    float _2352 = _2344 * _2298;
    float _2354 = -_2348;
    float _2356 = fma(_2354, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2358 = sqrt(_2350);
    float _2360 = -_2352;
    float _2362 = fma(_2360, _2356, 1.0);
    float _2364 = precise::clamp(_2362, 0.0, 1.0);
    float _2366 = _2364 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_88.x = _2366;
    bool _2368 = _2358 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2370 = isnan(_2358);
    bool _2372 = _2368 || _2370;
    bool _2374 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2376 = _2372 || _2374;
    float _2378 = _2352;
    float _2380 = _2364;
    float _2382 = _2350;
    if (!_2376)
    {
        _2324 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2384 = _2324;
    float _2386 = _2384;
    float _2388 = _2384;
    if (!_2376)
    {
        _2378 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2390 = _2378;
    float _2392 = _2390;
    float _2394 = _2390;
    if (!_2376)
    {
        _2326 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2396 = _2326;
    float _2398 = _2396;
    float _2400 = _2396;
    if (!_2376)
    {
        _2380 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2402 = _2380;
    float _2404 = _2402;
    float _2406 = _2402;
    if (!_2376)
    {
        _2074 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2408 = _2074;
    float _2410 = _2408;
    float _2412 = _2408;
    if (!_2376)
    {
        _2382 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2414 = _2382;
    bool _2416 = !_2376;
    float _2418 = _2414;
    float _2420 = _2414;
    if (!_2416)
    {
        bool _2422 = _2358 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2424 = isnan(_2358);
        bool _2426 = _2422 || _2424;
        bool _2428 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2430 = _2426 || _2428;
        if (!_2430)
        {
            float _2432 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2434 = _2358 + _2432;
            float _2436 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2438 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2436;
            float _2440 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2442 = _2440 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2444 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2446 = _2444 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2448 = 1.0 / _2438;
            float _2450 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2452 = _2450 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2454 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2456 = _2454 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2458 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2460 = _2458 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2462 = _2434 * _2448;
            float _2464 = precise::clamp(_2462, 0.0, 1.0);
            float _2466 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2468 = _2466 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2470 = fma(_2464, _2442, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2472 = fma(_2464, _2446, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2474 = fma(_2464, _2468, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2476 = fma(_2464, _2452, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2478 = fma(_2464, _2456, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2480 = fma(_2464, _2460, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2394 = _2470;
            _2412 = _2478;
            _2388 = _2472;
            _2406 = _2476;
            _2400 = _2474;
            _2420 = _2480;
            _2482 = true;
        }
        else
        {
            bool _2484 = _2358 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2486 = isnan(_2358);
            bool _2488 = _2484 || _2486;
            bool _2490 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2492 = _2488 || _2490;
            if (!_2492)
            {
                _2386 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2494 = _2386;
            _2388 = _2494;
            if (!_2492)
            {
                _2392 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2496 = _2392;
            _2394 = _2496;
            if (!_2492)
            {
                _2398 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2498 = _2398;
            _2400 = _2498;
            if (!_2492)
            {
                _2404 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2500 = _2404;
            _2406 = _2500;
            if (!_2492)
            {
                _2410 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2502 = _2410;
            _2412 = _2502;
            if (!_2492)
            {
                _2418 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2504 = _2418;
            bool _2506 = !_2492;
            _2420 = _2504;
            if (!_2506)
            {
                bool _2508 = _2358 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2510 = isnan(_2358);
                bool _2512 = _2508 || _2510;
                bool _2514 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2516 = _2512 || _2514;
                if (!_2516)
                {
                    float _2518 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2520 = _2358 + _2518;
                    float _2522 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2524 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2522;
                    float _2526 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2528 = _2526 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2530 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2532 = _2530 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2534 = 1.0 / _2524;
                    float _2536 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2538 = _2536 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2540 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2542 = _2540 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2544 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2546 = _2544 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2548 = _2520 * _2534;
                    float _2550 = precise::clamp(_2548, 0.0, 1.0);
                    float _2552 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2554 = _2552 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2556 = fma(_2550, _2528, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2558 = fma(_2550, _2532, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2560 = fma(_2550, _2554, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2562 = fma(_2550, _2538, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2564 = fma(_2550, _2542, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2566 = fma(_2550, _2546, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2394 = _2556;
                    _2412 = _2564;
                    _2388 = _2558;
                    _2406 = _2562;
                    _2400 = _2560;
                    _2420 = _2566;
                    _2482 = true;
                }
                else
                {
                    _2394 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2412 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2388 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2406 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2400 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2420 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2482 = false;
    float _2568 = _2394;
    float _2570 = _2412;
    float _2572 = _2388;
    float _2574 = _2406;
    float _2576 = _2400;
    float _2578 = _2420;
    float _2580 = fma(_2058, -0.5, 0.5);
    float _2582 = precise::clamp(_2580, 0.0, 1.0);
    float _2584 = -_2568;
    float _2586 = _2584 + _2570;
    float _2588 = -_2572;
    float _2590 = _2588 + _2574;
    float _2592 = -_2576;
    float _2594 = _2592 + _2578;
    bool _2596 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2598 = fma(_2582, _2586, _2568);
    float _2600 = fma(_2582, _2590, _2572);
    float _2602 = fma(_2582, _2594, _2576);
    float _2604 = _2598 * 0.586610972881317138671875;
    out.m_56.x = 1.0;
    float _2606 = fma(_2600, 0.298911988735198974609375, _2604);
    float _2608 = fma(_2602, 0.114477999508380889892578125, _2606);
    out.m_90.x = 0.0;
    float _2610 = -_2608;
    float _2612 = _2600 + _2610;
    float _2614 = -_2608;
    float _2616 = _2598 + _2614;
    float _2618 = -_2608;
    float _2620 = _2602 + _2618;
    float _2622 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2624 = fma(_2612, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2608);
    float _2626 = fma(_2616, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2608);
    float _2628 = fma(_2620, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2608);
    out.m_88.w = _2622;
    out.m_92.x = _2624;
    out.m_92.y = _2626;
    out.m_92.z = _2628;
    if (!_2596)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2630 = -_2124;
    float _2632 = _2630 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2634 = -_2126;
    float _2636 = _2634 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2638 = -_2128;
    float _2640 = _2638 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2642 = _2632 * _2632;
    float _2644 = fma(_2636, _2636, _2642);
    float _2646 = fma(_2640, _2640, _2644);
    float _2648 = sqrt(_2646);
    float _2650 = rsqrt(_2646);
    float _2652 = -_2648;
    float _2654 = _2652 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2656 = _2654 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2658 = precise::clamp(_2656, 0.0, 1.0);
    float _2660 = _2636 * _2650;
    float _2662 = _2632 * _2650;
    float _2664 = abs(_2658);
    float _2666 = log2(_2664);
    float _2668 = _2640 * _2650;
    float _2670 = _2660 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2672 = _2058 * _2662;
    float _2674 = -_2662;
    float _2676 = -_2670;
    float _2678 = fma(_2674, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2676);
    float _2680 = fma(_2056, _2660, _2672);
    float _2682 = -_2668;
    float _2684 = fma(_2682, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2678);
    float _2686 = fma(_2064, _2668, _2680);
    float _2688 = precise::clamp(_2686, 0.0, 1.0);
    float _2690 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2692 = _2684 + _2690;
    float _2694 = _2666 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2696 = _2692 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2698 = precise::clamp(_2696, 0.0, 1.0);
    float _2700 = exp2(_2694);
    float _2702 = _2700 * _2698;
    float _2704 = _2688 * _2702;
    float _2706 = _2704 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2708 = _2704 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2710 = _2704 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_90.x = _2706;
    out.m_90.y = _2708;
    out.m_90.z = _2710;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

