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
    float4 m_76 [[user(locn1)]];
    float4 m_74 [[user(locn2)]];
    float4 m_82 [[user(locn3)]];
    float4 m_92 [[user(locn4)]];
    float4 m_59 [[user(locn5)]];
    float4 m_78 [[user(locn6)]];
    float4 m_84 [[user(locn7)]];
    float4 m_90 [[user(locn8)]];
    float4 m_86 [[user(locn9)]];
    float4 m_88 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_80 [[attribute(1)]];
    float4 m_68 [[attribute(2)]];
    float4 m_56 [[attribute(3)]];
    float4 m_61 [[attribute(4)]];
    float4 m_63 [[attribute(5)]];
    float4 m_70 [[attribute(6)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3807 = false;
    bool _935 = false;
    bool _743 = false;
    bool _367 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _106 = in.m_56.w;
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
        out.m_59.x = 0.0;
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
        float _4112 = as_type<float>(_127);
        out.gl_Position.z = _4112;
    }
    if (!_115)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _131 = in.m_61.w;
    bool _133 = _131 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _135 = isnan(_131);
    bool _137 = _133 || _135;
    bool _139 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _141 = _137 || _139;
    float _143 = -_131;
    float _145 = _143 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _147 = 0.0;
    float _149 = _145;
    if (_141)
    {
        float _151 = float(_111);
        _147 = _151;
    }
    float _153 = _147;
    bool _155 = _145 >= _153;
    bool _157 = !_141;
    bool _159 = _155 || _157;
    if (_159)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _121;
    if (_159)
    {
        out.m_59.x = 0.0;
    }
    if (_159)
    {
        float _163 = _161 * 5.0;
        _129 = as_type<int>(_163);
    }
    int _165 = _129;
    if (_159)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4181 = as_type<float>(_165);
        out.gl_Position.z = _4181;
    }
    if (_159)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _167 = in.m_63.x;
    float _169 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _171 = _145 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _173 = as_type<float>(int(gl_VertexIndex));
    float _175 = in.m_68.x;
    float _177 = in.m_68.y;
    float _179 = in.m_68.z;
    float _181 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].w;
    float _183 = _171 * _169;
    float _185 = _145 + (*spvDescriptorSet0.vp_c9)._m0[20].w;
    float _187 = fma(_167, (*spvDescriptorSet0.vp_c9)._m0[20].x, _183);
    float _189 = _185 * _181;
    float _191 = floor(_187);
    float _193 = fma(_167, (*spvDescriptorSet0.vp_c9)._m0[20].y, _189);
    float _195 = _187 * 6.283185482025146484375;
    int _197 = as_type<int>(_173) & 1;
    bool _199 = _197 != 0;
    int _201 = as_type<int>(_173) & 2;
    bool _203 = _201 != 0;
    float _205 = _177 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _207 = _193 * 6.283185482025146484375;
    float _209 = _195 * 0.15915493667125701904296875;
    int _211 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _213 = _211 != 0;
    float _215 = floor(_193);
    bool _217 = !_203;
    float _219 = _217 ? (-0.5) : 0.5;
    float _221 = _177 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _223 = !_213;
    int _225 = _223 ? 0 : 1;
    float _227 = _177 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _229 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _231 = _229 != 0;
    int _233 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _235 = _233 != 0;
    float _237 = fma(_175, (*spvDescriptorSet0.vp_c10)._m0[4].x, _221);
    int _239 = abs(_225);
    float _241 = -_191;
    float _243 = _187 + _241;
    float _245 = _207 * 0.15915493667125701904296875;
    float _247 = _209 * 6.283185482025146484375;
    float _249 = cos(_247);
    bool _251 = !_231;
    int _253 = _251 ? 0 : 1;
    float _255 = fma(_175, (*spvDescriptorSet0.vp_c10)._m0[5].x, _205);
    bool _257 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _259 = fma(_175, (*spvDescriptorSet0.vp_c10)._m0[6].x, _227);
    int _261 = abs(_253);
    float _263 = -_215;
    float _265 = _193 + _263;
    bool _267 = _243 < 0.5;
    float _269 = float(_267);
    float _271 = _245 * 6.283185482025146484375;
    float _273 = cos(_271);
    float _275 = -_243;
    float _277 = fma(_275, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _279 = !_235;
    int _281 = _279 ? 0 : 1;
    float _283 = -_265;
    float _285 = fma(_283, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _287 = -_269;
    float _289 = fma(_287, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _291 = float(_239);
    float _293 = fma(_179, (*spvDescriptorSet0.vp_c10)._m0[4].z, _237);
    int _295 = abs(_281);
    float _297 = fma(_249, 0.5, 0.5);
    float _299 = float(_261);
    float _301 = fma(_179, (*spvDescriptorSet0.vp_c10)._m0[5].z, _255);
    bool _303 = _265 < 0.5;
    float _305 = float(_303);
    float _307 = -_297;
    float _309 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _311 = fma(_179, (*spvDescriptorSet0.vp_c10)._m0[6].z, _259);
    float _313 = abs(_277);
    float _315 = _299 * _313;
    float _317 = abs(_285);
    float _319 = _299 * _317;
    float _321 = fma(_273, 0.5, 0.5);
    float _323 = -_305;
    float _325 = fma(_323, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _327 = fma(_291, _309, _315);
    float _329 = float(_295);
    float _331 = -_321;
    float _333 = fma(_331, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    bool _335 = !_199;
    float _337 = _335 ? (-0.5) : 0.5;
    float _339 = fma(_291, _333, _319);
    float _341 = abs(_289);
    float _343 = fma(_329, _341, _327);
    float _345 = abs(_325);
    float _347 = fma(_329, _345, _339);
    bool _349 = !_257;
    float _365;
    if (!_349)
    {
        float _351 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _353 = _167 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _355 = fma(_353, (*spvDescriptorSet0.vp_c9)._m0[12].x, _145);
        float _357 = _355 * _351;
        float _359 = floor(_357);
        float _361 = -_359;
        float _363 = _357 + _361;
        _365 = _363;
        _367 = true;
    }
    else
    {
        float _369 = float(_111);
        float _371 = 1.0 / _369;
        float _373 = _145 * _371;
        _365 = _373;
    }
    _367 = false;
    float _375 = _365;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _377;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _383 = _381 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _387 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _385;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _391 = _389 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _393 = 1.0 / _379;
    float _395 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _397 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _395;
    float _399 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _401 = _399 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _403 = 1.0 / _383;
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _407 = _375 + _405;
    bool _409 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _411 = isnan(_375);
    bool _413 = _409 || _411;
    bool _415 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _417 = _413 || _415;
    float _419 = float(_417);
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _423 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _421;
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _427 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _425;
    float _429 = 1.0 / _387;
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _433 = _375 + _431;
    float _435 = _407 * _393;
    bool _437 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[150].w;
    bool _439 = isnan(_375);
    bool _441 = _437 || _439;
    bool _443 = isnan((*spvDescriptorSet0.vp_c9)._m0[150].w);
    bool _445 = _441 || _443;
    float _447 = float(_445);
    bool _449 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _451 = isnan(_375);
    bool _453 = _449 || _451;
    bool _455 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _457 = _453 || _455;
    float _459 = float(_457);
    float _461 = fma(_423, _435, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _463 = fma(_427, _435, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _465 = 1.0 / _397;
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _469 = (*spvDescriptorSet0.vp_c9)._m0[150].w + _467;
    float _471 = _433 * _403;
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _475 = _375 + _473;
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _479 = _375 + _477;
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _483 = _375 + _481;
    bool _485 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _487 = 1.0 / _391;
    float _489 = _475 * _429;
    float _491 = -_447;
    float _493 = _491 + 1.0;
    float _495 = _459 * _493;
    float _497 = -_459;
    float _499 = _497 + 1.0;
    float _501 = 1.0 / _401;
    float _503 = _479 * _465;
    bool _505 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _507 = isnan(_375);
    bool _509 = _505 || _507;
    bool _511 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _513 = _509 || _511;
    float _515 = float(_513);
    bool _517 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _519 = isnan(_375);
    bool _521 = _517 || _519;
    bool _523 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _525 = _521 || _523;
    float _527 = float(_525);
    float _529 = 1.0 / _469;
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _533 = _375 + _531;
    float _535 = _483 * _487;
    float _537 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _539 = _375 + _537;
    float _541 = _533 * _501;
    float _543 = -_515;
    float _545 = _543 + 1.0;
    float _547 = _539 * _529;
    float _549 = _515 * _499;
    bool _551 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _553 = isnan(_375);
    bool _555 = _551 || _553;
    bool _557 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _559 = _555 || _557;
    float _561 = float(_559);
    float _563 = _527 * _545;
    float _565 = -_527;
    float _567 = _565 + 1.0;
    bool _569 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _571 = isnan(_375);
    bool _573 = _569 || _571;
    bool _575 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _577 = _573 || _575;
    float _579 = float(_577);
    float _581 = -_561;
    float _583 = _581 + 1.0;
    float _585 = _561 * _567;
    bool _587 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _589 = isnan(_375);
    bool _591 = _587 || _589;
    bool _593 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _595 = _591 || _593;
    float _597 = float(_595);
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _601 = _599 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _603 = _579 * _583;
    float _605 = -_579;
    float _607 = _605 + 1.0;
    float _609 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _611 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _609;
    float _613 = -_597;
    float _615 = _613 + 1.0;
    float _617 = fma(_601, _471, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _619 = _597 * _607;
    float _621 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _623 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _621;
    float _625 = _419 * _615;
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _629 = _627 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _631 = fma(_611, _489, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _633 = fma(_623, _489, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _635 = _461 * _625;
    float _637 = -_419;
    float _639 = _637 + 1.0;
    float _641 = _463 * _625;
    float _643 = fma(_629, _471, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _645 = fma(_639, (*spvDescriptorSet0.vp_c9)._m0[143].x, _635);
    float _647 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _649 = _647 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _653 = _651 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _655 = fma(_639, (*spvDescriptorSet0.vp_c9)._m0[143].y, _641);
    float _657 = fma(_649, _535, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _659 = fma(_653, _535, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _661 = fma(_617, _619, _645);
    float _663 = fma(_643, _619, _655);
    float _665 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _667 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _665;
    float _669 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _671 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _669;
    float _673 = fma(_631, _603, _661);
    float _675 = fma(_633, _603, _663);
    float _677 = fma(_667, _503, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _679 = fma(_671, _503, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _681 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _683 = _681 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _685 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _687 = _685 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _689 = fma(_657, _585, _673);
    float _691 = fma(_659, _585, _675);
    float _693 = fma(_683, _541, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _695 = fma(_687, _541, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _697 = -(*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _699 = (*spvDescriptorSet0.vp_c9)._m0[150].x + _697;
    float _701 = -(*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _703 = (*spvDescriptorSet0.vp_c9)._m0[150].y + _701;
    float _705 = fma(_677, _563, _689);
    float _707 = fma(_679, _563, _691);
    float _709 = fma(_699, _547, (*spvDescriptorSet0.vp_c9)._m0[149].x);
    float _711 = fma(_703, _547, (*spvDescriptorSet0.vp_c9)._m0[149].y);
    float _713 = fma(_693, _549, _705);
    float _715 = fma(_695, _549, _707);
    float _717 = fma(_709, _495, _713);
    float _719 = fma(_711, _495, _715);
    float _721 = fma(_447, (*spvDescriptorSet0.vp_c9)._m0[150].x, _717);
    float _723 = fma(_447, (*spvDescriptorSet0.vp_c9)._m0[150].y, _719);
    bool _725 = !_485;
    float _741;
    if (!_725)
    {
        float _727 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _729 = _167 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _731 = fma(_729, (*spvDescriptorSet0.vp_c9)._m0[11].x, _145);
        float _733 = _731 * _727;
        float _735 = floor(_733);
        float _737 = -_735;
        float _739 = _733 + _737;
        _741 = _739;
        _743 = true;
    }
    else
    {
        float _745 = float(_111);
        float _747 = 1.0 / _745;
        float _749 = _145 * _747;
        _741 = _749;
    }
    _743 = false;
    float _751 = _741;
    float _753 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _755 = _751 + _753;
    bool _757 = _751 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _759 = isnan(_751);
    bool _761 = _757 || _759;
    bool _763 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _765 = _761 || _763;
    float _767 = float(_765);
    float _769 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _771 = _751 + _769;
    bool _773 = _751 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _775 = isnan(_751);
    bool _777 = _773 || _775;
    bool _779 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _781 = _777 || _779;
    float _783 = float(_781);
    float _785 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _787 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _785;
    float _789 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _791 = _789 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _793 = _751 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _795 = isnan(_751);
    bool _797 = _793 || _795;
    bool _799 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _801 = _797 || _799;
    float _803 = float(_801);
    float _805 = 1.0 / _787;
    float _807 = 1.0 / _791;
    float _809 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _811 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _809;
    bool _813 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _815 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _817 = _755 * _805;
    float _819 = -_767;
    float _821 = _819 + 1.0;
    float _823 = -_803;
    float _825 = _823 + 1.0;
    float _827 = fma(_811, _817, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _829 = _803 * _821;
    float _831 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _833 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _831;
    float _835 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _837 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _835;
    float _839 = _783 * _825;
    float _841 = _771 * _807;
    float _843 = fma(_833, _817, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _845 = fma(_837, _817, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _847 = _827 * _839;
    float _849 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _851 = _849 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _853 = _843 * _839;
    float _855 = _845 * _839;
    float _857 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _859 = _857 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _861 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _863 = _861 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _865 = -_783;
    float _867 = _865 + 1.0;
    float _869 = fma(_851, _841, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _871 = fma(_859, _841, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _873 = fma(_863, _841, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _875 = fma(_867, (*spvDescriptorSet0.vp_c9)._m0[107].x, _853);
    float _877 = fma(_867, (*spvDescriptorSet0.vp_c9)._m0[107].y, _847);
    float _879 = fma(_867, (*spvDescriptorSet0.vp_c9)._m0[107].z, _855);
    float _881 = fma(_871, _829, _875);
    float _883 = fma(_869, _829, _877);
    float _885 = fma(_873, _829, _879);
    float _887 = fma(_767, (*spvDescriptorSet0.vp_c9)._m0[109].x, _881);
    float _889 = fma(_767, (*spvDescriptorSet0.vp_c9)._m0[109].y, _883);
    float _891 = fma(_767, (*spvDescriptorSet0.vp_c9)._m0[109].z, _885);
    float _893 = in.m_70.x;
    float _895 = in.m_70.y;
    float _897 = _887 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _899 = _889 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _901 = _891 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _903 = _897 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _905 = _899 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _907 = _901 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_72.x = _903;
    out.m_72.y = _905;
    out.m_72.z = _907;
    out.m_72.w = _815;
    float _909 = _723 * _895;
    float _911 = _721 * _893;
    bool _913 = !_813;
    float _931;
    float _933;
    if (!_913)
    {
        float _915 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _917 = _167 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _919 = float(_111);
        float _921 = fma(_917, (*spvDescriptorSet0.vp_c9)._m0[11].z, _145);
        float _923 = _921 * _915;
        float _925 = floor(_923);
        float _927 = -_925;
        float _929 = _923 + _927;
        _931 = _919;
        _933 = _929;
        _935 = true;
    }
    else
    {
        float _937 = float(_111);
        float _939 = 1.0 / _937;
        float _941 = _145 * _939;
        _931 = _937;
        _933 = _941;
    }
    _935 = false;
    float _943 = _931;
    float _945 = _933;
    float _947 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _949 = int(_947);
    float _951 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _953 = int(_951);
    float _955 = float(_949);
    float _957 = 1.0 / _943;
    float _959 = float(uint(_953));
    float _961 = 1.0 / _955;
    int _963 = ~_953;
    int _965 = _963 + 1;
    int _967 = ~_953;
    int _969 = _967 + 1;
    int _971 = ~_953;
    int _973 = _971 + 1;
    int _975 = ~_953;
    int _977 = _975 + 1;
    float _979 = 1.0 / _959;
    float _981 = _961 * _145;
    float _983 = trunc(_981);
    int _985 = int(_983);
    int _987 = as_type<int>(_979) + (-2);
    int _989 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _991 = _989 != 0;
    float _993 = float(uint(_985));
    bool _995 = !_991;
    float _997 = _995 ? 7.345489978790283203125 : 1.0;
    float _999 = float(_953);
    float _1001 = as_type<float>(_987) * _993;
    float _1003 = _997 * _167;
    float _1005 = trunc(_1001);
    float _1007 = precise::max(_1005, 0.0);
    uint _1010 = uint(_1007);
    float _1012 = float(_985);
    bool _1014 = _1012 >= _999;
    bool _1016 = isnan(_1012);
    bool _1018 = _1014 || _1016;
    bool _1020 = isnan(_999);
    bool _1022 = _1018 || _1020;
    float _1024 = float(_1022);
    int _1026 = _965 * int(_1010);
    int _1028 = _1026 + _985;
    float _1030 = trunc(_1024);
    int _1032 = int(_1030);
    float _1034 = float(uint(_1028));
    float _1036 = as_type<float>(_987) * _1034;
    float _1038 = trunc(_1036);
    float _1040 = precise::max(_1038, 0.0);
    uint _1042 = uint(_1040);
    int _1044 = int(_1010) + int(_1042);
    float _1046 = floor(_1003);
    int _1048 = _969 * _1044;
    int _1050 = _1048 + _985;
    bool _1052 = uint(_1050) >= uint(_953);
    bool _1054 = !_1052;
    int _1056 = _1054 ? 0 : (-1);
    bool _1058 = _953 == 0;
    int _1060 = ~_1044;
    int _1062 = _1060 + _1056;
    int _1064 = _1062 + 1;
    float _1066 = -_1046;
    float _1068 = _1003 + _1066;
    int _1070 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1072 = _1070 != 0;
    int _1074 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1076 = _1074 != 0;
    int _1078 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1080 = _1078 != 0;
    int _1082 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1084 = _1082 != 0;
    int _1086 = _953 * _1064;
    int _1088 = _1086 + _985;
    int _1090 = ~_1032;
    int _1092 = _1090 + 1;
    int _1094 = _1092 + 1;
    bool _1096 = !_1072;
    int _1098 = _1096 ? 0 : 1;
    bool _1100 = !_1058;
    int _1102 = _1100 ? _1088 : (-1);
    float _1104 = _1068 * _999;
    float _1106 = _999 * _145;
    bool _1108 = !_1076;
    int _1110 = _1108 ? 0 : 1;
    int _1112 = _1102 * _1094;
    float _1114 = _1106 * _957;
    int _1116 = _953 + (-1);
    float _1118 = trunc(_1104);
    int _1120 = int(_1118);
    int _1122 = abs(_1098);
    int _1124 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1126 = _1124 != 0;
    int _1128 = _1032 * _1116;
    int _1130 = _1128 + _1112;
    bool _1132 = !_1084;
    int _1134 = _1132 ? 0 : 1;
    int _1136 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1138 = _1136 != 0;
    float _1140 = trunc(_1114);
    int _1142 = int(_1140);
    int _1144 = abs(_1110);
    bool _1146 = !_1080;
    int _1148 = _1146 ? 0 : 1;
    bool _1150 = !_1138;
    int _1152 = _1150 ? 0 : 1;
    int _1154 = abs(_1134);
    int _1156 = abs(_1148);
    int _1158 = _1130 * _1144;
    int _1160 = abs(_1152);
    int _1162 = _1120 * _1154;
    int _1164 = _1162 + _985;
    float _1166 = _167 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1168 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1170 = _1168 != 0;
    int _1172 = _1142 * _1122;
    int _1174 = _1172 + _1158;
    int _1176 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1178 = _1176 != 0;
    int _1180 = _1164 * _1156;
    int _1182 = _1180 + _1174;
    int _1184 = ~_953;
    int _1186 = _1184 + 1;
    float _1188 = in.m_63.y;
    float _1190 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1192 = _1120 * _1160;
    int _1194 = _1192 + _1182;
    float _1196 = -_1190;
    float _1198 = fma(_1166, 2.0, _1196);
    float _1200 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1202 = _945 + _1200;
    float _1204 = float(uint(_1194));
    float _1206 = as_type<float>(_987) * _1204;
    float _1208 = trunc(_1206);
    float _1210 = precise::max(_1208, 0.0);
    uint _1212 = uint(_1210);
    float _1214 = _1188 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1216 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1218 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1216;
    float _1220 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1222 = _1220 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1224 = 1.0 / _1218;
    int _1226 = _1186 * int(_1212);
    int _1228 = _1226 + _1194;
    float _1230 = float(uint(_1228));
    float _1232 = 1.0 / _1222;
    float _1234 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1236 = _945 + _1234;
    float _1238 = as_type<float>(_987) * _1230;
    float _1240 = in.m_56.x;
    float _1242 = in.m_56.y;
    float _1244 = in.m_56.z;
    float _1246 = _1236 * _1224;
    float _1248 = trunc(_1238);
    float _1250 = precise::max(_1248, 0.0);
    uint _1252 = uint(_1250);
    float _1254 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1256 = ~_953;
    int _1258 = _1256 + 1;
    float _1260 = fma(_1214, -2.0, _1254);
    int _1262 = int(_1212) + int(_1252);
    float _1264 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1260);
    int _1266 = _1258 * _1262;
    int _1268 = _1266 + _1194;
    float _1270 = _1242 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1272 = _1242 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1274 = _1242 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _1276 = uint(_1268) >= uint(_953);
    float _1278 = _1202 * _1232;
    float _1280 = fma(_1240, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1274);
    float _1282 = fma(_1240, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1270);
    bool _1284 = !_1276;
    int _1286 = _1284 ? 0 : (-1);
    float _1288 = fma(_1244, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1280);
    float _1290 = float(uint(_1164));
    float _1292 = fma(_1240, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1272);
    int _1294 = ~_1262;
    int _1296 = _1294 + _1286;
    int _1298 = _1296 + 1;
    float _1300 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1302 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1300;
    float _1304 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1306 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1304;
    bool _1308 = _167 > 0.5;
    float _1310 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1312 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1310;
    float _1314 = as_type<float>(_987) * _1290;
    float _1316 = fma(_1244, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1282);
    float _1318 = fma(_1244, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1292);
    float _1320 = fma(_1302, _1246, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1322 = fma(_1306, _1246, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1324 = fma(_1312, _1246, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1326 = -_337;
    int _1328 = _1308 ? as_type<int>(_1326) : as_type<int>(_337);
    float _1330 = trunc(_1314);
    float _1332 = precise::max(_1330, 0.0);
    uint _1334 = uint(_1332);
    int _1336 = _953 * _1298;
    int _1338 = _1336 + _1194;
    float _1340 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1342 = _1340 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    bool _1344 = !_1170;
    float _1346 = _1344 ? _337 : as_type<float>(_1328);
    float _1348 = -_145;
    float _1350 = fma(_1348, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1198);
    float _1352 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1354 = _1352 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    bool _1356 = !_1058;
    int _1358 = _1356 ? _1338 : (-1);
    float _1360 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1362 = _1360 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1364 = _1346 + 0.5;
    bool _1366 = _945 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1368 = isnan(_945);
    bool _1370 = _1366 || _1368;
    bool _1372 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1374 = _1370 || _1372;
    float _1376 = float(_1374);
    float _1378 = fma(_1354, _1278, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    int _1380 = _1358 >> 31;
    float _1382 = fma(_1364, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1350);
    bool _1384 = _945 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1386 = isnan(_945);
    bool _1388 = _1384 || _1386;
    bool _1390 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1392 = _1388 || _1390;
    float _1394 = float(_1392);
    float _1396 = fma(_1362, _1278, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    int _1398 = _1380 & 3;
    int _1400 = _973 * int(_1334);
    int _1402 = _1400 + _1164;
    float _1404 = fma(_1342, _1278, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    bool _1406 = _945 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1408 = isnan(_945);
    bool _1410 = _1406 || _1408;
    bool _1412 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1414 = _1410 || _1412;
    float _1416 = float(_1414);
    float _1418 = -_1394;
    float _1420 = _1418 + 1.0;
    bool _1422 = _1188 > 0.5;
    float _1424 = _1318 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1426 = _1358 + _1398;
    float _1428 = _1416 * _1420;
    float _1430 = float(uint(_1402));
    float _1432 = -_1416;
    float _1434 = _1432 + 1.0;
    float _1436 = -_219;
    int _1438 = _1422 ? as_type<int>(_1436) : as_type<int>(_219);
    float _1440 = _1316 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1442 = _1426 >> 2;
    float _1444 = as_type<float>(_987) * _1430;
    float _1446 = _1376 * _1434;
    bool _1448 = !_1178;
    float _1450 = _1448 ? _219 : as_type<float>(_1438);
    float _1452 = -_1376;
    float _1454 = _1452 + 1.0;
    int _1456 = _1442 << 4;
    int _1458 = _1456 + 368;
    float _1460 = _1320 * _1446;
    float _1462 = trunc(_1444);
    float _1464 = precise::max(_1462, 0.0);
    uint _1466 = uint(_1464);
    float _1468 = _1324 * _1446;
    uint _1470 = uint(int(uint(_1458) >> uint(2)));
    uint _1472 = uint(int(uint(int(_1470)) >> uint(2)));
    int _1474 = int(_1470) & 3;
    float _1476 = (*spvDescriptorSet0.vp_c9)._m0[int(_1472)][_1474];
    int _1478 = int(_1470) + 1;
    uint _1480 = uint(int(uint(_1478) >> uint(2)));
    int _1482 = _1478 & 3;
    float _1484 = (*spvDescriptorSet0.vp_c9)._m0[int(_1480)][_1482];
    float _1486 = _1450 + (-0.5);
    int _1488 = _1358 & 3;
    bool _1490 = _1488 != 0;
    float _1492 = _1322 * _1446;
    int _1494 = _1358 & 3;
    bool _1496 = _1494 != 0;
    float _1498 = -_1486;
    float _1500 = -_1264;
    float _1502 = fma(_1498, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1500);
    float _1504 = fma(_1454, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1460);
    float _1506 = fma(_1454, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1468);
    bool _1508 = uint(_1494) > 1u;
    int _1510 = _1458 + 8;
    uint _1512 = uint(int(uint(_1510) >> uint(2)));
    uint _1514 = uint(int(uint(int(_1512)) >> uint(2)));
    int _1516 = int(_1512) & 3;
    float _1518 = (*spvDescriptorSet0.vp_c9)._m0[int(_1514)][_1516];
    int _1520 = int(_1512) + 1;
    uint _1522 = uint(int(uint(_1520) >> uint(2)));
    int _1524 = _1520 & 3;
    float _1526 = (*spvDescriptorSet0.vp_c9)._m0[int(_1522)][_1524];
    float _1528 = fma(_1454, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1492);
    float _1530 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1532 = _1424 + _1530;
    float _1534 = fma(_1378, _1428, _1504);
    float _1536 = fma(_1404, _1428, _1506);
    int _1538 = int(_1334) + int(_1466);
    float _1540 = fma(_1396, _1428, _1528);
    int _1542 = _1490 ? 0 : 1;
    float _1544 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1546 = _1440 + _1544;
    float _1548 = _1532 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1550 = _977 * _1538;
    int _1552 = _1550 + _1164;
    int _1554 = ~_1542;
    int _1556 = _1554 + 1;
    int _1558 = _1556 + 1;
    float _1560 = fma(_1394, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1540);
    float _1562 = fma(_1546, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1548);
    int _1564 = _1558;
    float _1566 = _1450;
    if (!_1508)
    {
        int _1568 = ~_1542;
        int _1570 = _1568 + 1;
        _1564 = _1570;
    }
    int _1572 = _1564;
    float _1574 = fma(_1394, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1534);
    bool _1576 = !_1496;
    int _1578 = _1576 ? 0 : 1;
    float _1580 = fma(_1394, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1536);
    bool _1582 = _1494 != 3;
    float _1584 = _1288 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1586 = uint(_1552) >= uint(_953);
    int _1588 = abs(_1572);
    float _1590 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1592 = _1584 + _1590;
    bool _1594 = uint(_1494) >= 2u;
    int _1596 = abs(_1578);
    float _1598 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1562);
    bool _1600 = !_1586;
    int _1602 = _1600 ? 0 : (-1);
    int _1604 = ~_1588;
    int _1606 = _1604 + 1;
    int _1608 = _1606 + 1;
    int _1610 = _1594 ? 0 : 1;
    int _1612 = ~_1538;
    int _1614 = _1612 + _1602;
    int _1616 = _1614 + 1;
    int _1618 = ~_1596;
    int _1620 = _1618 + 1;
    int _1622 = _1620 + 1;
    int _1624 = ~_1610;
    int _1626 = _1624 + 1;
    int _1628 = _1626 + 1;
    int _1630 = _1608 * as_type<int>(_1484);
    bool _1632 = _1494 != 3;
    int _1634 = _953 * _1616;
    int _1636 = _1634 + _1164;
    int _1638 = _1628;
    if (_1582)
    {
        int _1640 = ~_1610;
        int _1642 = _1640 + 1;
        _1638 = _1642;
    }
    int _1644 = _1638;
    int _1646 = _1622 * as_type<int>(_1476);
    int _1648 = _1646 + _1630;
    bool _1650 = !_1632;
    int _1652 = _1650 ? 0 : (-1);
    int _1654 = abs(_1644);
    bool _1656 = !_1126;
    int _1658 = _1656 ? 0 : 1;
    int _1660 = abs(_1652);
    int _1662 = abs(_1658);
    float _1664 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1666 = ~_1654;
    int _1668 = _1666 + 1;
    int _1670 = _1668 + 1;
    float _1672 = _1532 * _1532;
    int _1674 = ~_1660;
    int _1676 = _1674 + 1;
    int _1678 = _1676 + 1;
    int _1680 = _1670 * as_type<int>(_1518);
    int _1682 = _1680 + _1648;
    float _1684 = fma(_1188, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1664);
    int _1686 = ~_1662;
    int _1688 = _1686 + 1;
    int _1690 = _1688 + 1;
    int _1692 = _1678 * as_type<int>(_1526);
    int _1694 = _1692 + _1682;
    bool _1696 = !_1058;
    int _1698 = _1696 ? _1636 : (-1);
    float _1700 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1702 = _1598 >= 0.0;
    int _1704 = _1694 * _1690;
    float _1706 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1684);
    float _1708 = fma(_167, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1700);
    int _1710 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1712 = _1710 != 0;
    int _1714 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1716 = _1714 != 0;
    int _1718 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1720 = _1718 != 0;
    int _1722 = _1698 * _1662;
    int _1724 = _1722 + _1704;
    float _1726 = fma(_1546, _1546, _1672);
    float _1728 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1708);
    float _1730 = -_1706;
    float _1732 = _1730 + 1.0;
    float _1734 = _1574 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1736 = fma(_1592, _1592, _1726);
    float _1738 = -_1728;
    float _1740 = _1738 + 1.0;
    float _1742 = fma(_1450, _1732, _1502);
    if (_1702)
    {
        _1566 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1744 = _1566;
    float _1746 = _1560 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1748 = -_1740;
    float _1750 = fma(_1346, _1748, _1382);
    float _1752 = rsqrt(_1736);
    float _1754 = _1580 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1756 = _1734 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1758 = _1746 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1760 = _1754 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1762 = as_type<int>(_1744);
    float _1764 = _1760;
    if (_1702)
    {
        float _1766 = _1744 * 5.0;
        _1762 = as_type<int>(_1766);
    }
    int _1768 = _1762;
    float _1770 = float(_1724);
    out.m_74.x = _1750;
    out.m_74.y = _1742;
    bool _1772 = !_1716;
    int _1774 = _1772 ? 0 : 1;
    bool _1776 = !_1720;
    int _1778 = _1776 ? 0 : 1;
    out.m_76.x = _1756;
    out.m_76.y = _1758;
    out.m_76.z = _1760;
    bool _1780 = !_1712;
    int _1782 = _1780 ? 0 : 1;
    if (_1702)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6684 = as_type<float>(_1768);
        out.gl_Position.z = _6684;
    }
    float _1784 = _1532 * _1752;
    float _1786 = _1546 * _1752;
    out.m_78.x = _1770;
    float _1788 = _1786;
    if (_1702)
    {
        out.m_59.x = 0.0;
    }
    if (_1702)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1790 = -_1784;
    float _1792 = fma(_1790, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1424);
    float _1794 = _1592 * _1752;
    float _1796 = -_1786;
    float _1798 = fma(_1796, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1440);
    float _1800 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1802 = _1792 + _1800;
    float _1804 = -_1794;
    float _1806 = fma(_1804, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1584);
    float _1808 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1810 = _1798 + _1808;
    float _1812 = _1802 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1814 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1816 = _1806 + _1814;
    float _1818 = fma(_1810, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1812);
    float _1820 = fma(_1816, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1818);
    bool _1822 = _1820 >= 0.0;
    float _1824 = _1802;
    float _1826 = _1792;
    float _1828 = _1806;
    if (_1822)
    {
        _1764 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1830 = _1764;
    int _1832 = as_type<int>(_1830);
    if (_1822)
    {
        out.m_59.x = 0.0;
    }
    if (_1822)
    {
        float _1834 = _1830 * 5.0;
        _1832 = as_type<int>(_1834);
    }
    int _1836 = _1832;
    if (_1822)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6790 = as_type<float>(_1836);
        out.gl_Position.z = _6790;
    }
    if (_1822)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1838 = fma(_1798, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1840 = fma(_1806, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1842 = floor(_1838);
    float _1844 = floor(_1840);
    float _1846 = -_1842;
    float _1848 = _1838 + _1846;
    float _1850 = -_1844;
    float _1852 = _1840 + _1850;
    float2 _6826 = float2(_1848, _1852);
    float _1854 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6826, float2(0.0), isnan(_6826)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6826, float2(0.0), isnan(_6826)), level(0.0)).x;
    float _1856 = in.m_63.z;
    float _1858 = _167 * 2.0;
    float _1860 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1862 = log2(_1860);
    float _1864 = _167 + _1188;
    float _1866 = _1188 * 2.0;
    float _1868 = _1864 + (-1.0);
    int _1870 = abs(_1774);
    float _1872 = -_1784;
    float _1874 = fma(_1872, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1532);
    float _1876 = floor(_1858);
    int _1878 = abs(_1782);
    float _1880 = -_1786;
    float _1882 = fma(_1880, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1546);
    float _1884 = float(_1870);
    float _1886 = _1874 * _1874;
    float _1888 = float(_1878);
    float _1890 = -_1794;
    float _1892 = fma(_1890, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1592);
    float _1894 = _347 * _909;
    float _1896 = _1862 * _145;
    float _1898 = floor(_1866);
    float _1900 = fma(_1882, _1882, _1886);
    float _1902 = _343 * _911;
    float _1904 = _1856 * 2.0;
    float _1906 = _1188 + _1856;
    bool _1908 = _1876 > 0.0;
    float _1910 = exp2(_1896);
    bool _1912 = _1876 >= 0.0;
    bool _1914 = isnan(_1876);
    bool _1916 = _1912 || _1914;
    bool _1918 = isnan(0.0);
    bool _1920 = _1916 || _1918;
    float _1922 = _1906 + (-1.0);
    float _1924 = _1188 + (-0.5);
    float _1926 = fma(_1892, _1892, _1900);
    float _1928 = floor(_1904);
    float _1930 = fma(_1922, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1932 = _1920 ? 0 : 1;
    float _1934 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    int _1936 = ~_1932;
    int _1938 = _1936 + 1;
    int _1940 = _1938 + 1;
    float _1942 = fma(_1868, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1944 = _1940;
    int _1946 = 2;
    if (!_1908)
    {
        int _1948 = ~_1932;
        int _1950 = _1948 + 1;
        _1944 = _1950;
    }
    int _1952 = _1944;
    float _1954 = in.m_80.x;
    float _1956 = in.m_80.y;
    float _1958 = in.m_80.z;
    float _1960 = -_1910;
    float _1962 = _1960 + 1.0;
    bool _1964 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1966 = isnan(0.0);
    bool _1968 = _1964 || _1966;
    bool _1970 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1972 = _1968 || _1970;
    float _1974 = _1792 + _1934;
    float _1976 = float(_1952);
    bool _1978 = _1928 > 0.0;
    float _1980 = _1974 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    bool _1982 = _1928 >= 0.0;
    bool _1984 = isnan(_1928);
    bool _1986 = _1982 || _1984;
    bool _1988 = isnan(0.0);
    bool _1990 = _1986 || _1988;
    float _1992 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1994 = 1.0 + _1992;
    float _1996 = _1884 * _1976;
    float _1998 = _1972 ? _1962 : 0.0;
    float _2000 = fma(_1798, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1980);
    int _2002 = _1990 ? 0 : 1;
    float _2004 = _1996 * (-2.0);
    float _2006 = 1.0 / _1994;
    bool _2008 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2010 = isnan(1.0);
    bool _2012 = _2008 || _2010;
    bool _2014 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2016 = _2012 || _2014;
    float _2018 = fma(_1806, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2000);
    int _2020 = ~_2002;
    int _2022 = _2020 + 1;
    int _2024 = _2022 + 1;
    int _2026 = _2024;
    if (!_1978)
    {
        int _2028 = ~_2002;
        int _2030 = _2028 + 1;
        _2026 = _2030;
    }
    int _2032 = _2026;
    float _2034 = _2018 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    bool _2036 = _1898 > 0.0;
    bool _2038 = _1898 >= 0.0;
    bool _2040 = isnan(_1898);
    bool _2042 = _2038 || _2040;
    bool _2044 = isnan(0.0);
    bool _2046 = _2042 || _2044;
    float _2048 = fma(_2004, _1956, _1956);
    float _2050 = float(_2032);
    float _2052 = fma(_1930, _2004, _1930);
    int _2054 = abs(_1778);
    float _2056 = fma(_1924, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2048);
    float _2058 = trunc(_2034);
    int _2060 = int(_2058);
    if (_2016)
    {
        float _2062 = _1998 * _2006;
        _149 = _2062;
    }
    float _2064 = _149;
    int _2066 = _2046 ? 0 : 1;
    float _2068 = _1888 * _2050;
    float _2070 = fma(_2052, _2064, _2056);
    int _2072 = ~_2066;
    int _2074 = _2072 + 1;
    int _2076 = _2074 + 1;
    float _2078 = _2068 * (-2.0);
    int _2080 = _2076;
    if (!_2036)
    {
        int _2082 = ~_2066;
        int _2084 = _2082 + 1;
        _2080 = _2084;
    }
    int _2086 = _2080;
    float _2088 = _2070 * 0.15915493667125701904296875;
    float _2090 = float(_2054);
    float _2092 = fma(_1942, _2078, _1942);
    float _2094 = float(_2086);
    float _2096 = fma(_2078, _1954, _1954);
    float _2098 = _167 + (-0.5);
    float _2100 = _167 + _1856;
    float _2102 = _1856 + (-0.5);
    float _2104 = _2090 * _2094;
    float _2106 = fma(_2098, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2096);
    float _2108 = _2100 + (-1.0);
    float _2110 = _2104 * (-2.0);
    float _2112 = fma(_2092, _2064, _2106);
    float _2114 = _2088 * 6.283185482025146484375;
    float _2116 = sin(_2114);
    float _2118 = fma(_2108, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2120 = fma(_2110, _1958, _1958);
    float _2122 = _2112 * 0.15915493667125701904296875;
    int _2124 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2126 = _2060 + _2124;
    int _2128 = _2126 + 1;
    float _2130 = fma(_2118, _2110, _2118);
    float _2132 = fma(_2102, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2120);
    float _2134 = _2088 * 6.283185482025146484375;
    float _2136 = cos(_2134);
    float _2138 = fma(_2130, _2064, _2132);
    float _2140 = _2138 * 0.15915493667125701904296875;
    float _2142 = _1792 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2144 = _2122 * 6.283185482025146484375;
    float _2146 = sin(_2144);
    float _2148 = fma(_1798, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2142);
    float _2150 = fma(_1806, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2148);
    float _2152 = _2122 * 6.283185482025146484375;
    float _2154 = cos(_2152);
    float _2156 = _2150 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2158 = _1792 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2160 = _2140 * 6.283185482025146484375;
    float _2162 = sin(_2160);
    float _2164 = fma(_1798, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2158);
    float _2166 = _2146 * _2136;
    float _2168 = fma(_1806, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2164);
    float _2170 = 1.0 / _2156;
    float _2172 = _2168 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2174 = _2146 * _2116;
    float _2176 = _2154 * _2136;
    float _2178 = _2172 + _2156;
    float _2180 = _2140 * 6.283185482025146484375;
    float _2182 = cos(_2180);
    float _2184 = fma(_2162, _2176, _2174);
    float _2186 = fma(_2162, _2174, _2176);
    float _2188 = _2154 * _2116;
    float _2190 = -_2188;
    float _2192 = fma(_2162, _2166, _2190);
    float _2194 = sqrt(_1926);
    float _2196 = _2178 * _2170;
    float _2198 = _2196 * 0.5;
    float _2200 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _219);
    float _2202 = -_2166;
    float _2204 = fma(_2162, _2188, _2202);
    float _2206 = _2154 * _2182;
    float _2208 = _2136 * _2182;
    float _2210 = _2146 * _2182;
    float _2212 = _2116 * _2182;
    float _2214 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2216 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2214);
    float _2218 = _1752 * _2194;
    float _2220 = _1894 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2222 = 1.0 / _2216;
    float _2224 = _2218 * _2220;
    float _2226 = _1902 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2228 = _2200 * _2224;
    float _2230 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _337);
    float _2232 = _2218 * _2226;
    float _2234 = _2206 * _2228;
    float _2236 = -_2228;
    float _2238 = _2162 * _2236;
    float _2240 = _2230 * _2232;
    float _2242 = _1974 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _2244 = _2210 * _2228;
    float _2246 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2248 = _2222 * _2246;
    float _2250 = fma(_2184, _2240, _2234);
    float _2252 = fma(_1798, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2242);
    float _2254 = _2218 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2256 = _2254 * 0.5;
    float _2258 = fma(_2208, _2240, _2238);
    bool _2260 = _2248 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _2262 = fma(_1806, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2252);
    float _2264 = fma(_2204, _2256, _2250);
    bool _2266 = _2248 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _2268 = fma(_2192, _2240, _2244);
    float _2270 = fma(_2212, _2256, _2258);
    float _2272 = _2264 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2274 = _2264 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2276 = _2262 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _2278 = fma(_2186, _2256, _2268);
    float _2280 = fma(_2270, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2272);
    float _2282 = fma(_2270, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2274);
    float _2284 = trunc(_2276);
    int _2286 = int(_2284);
    bool _2288 = !_2260;
    int _2290 = _2288 ? 0 : 1;
    float _2292 = fma(_2278, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2280);
    float _2294 = fma(_2278, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2282);
    int _2296 = as_type<int>(_2278);
    if (!_2260)
    {
        _1946 = 1;
    }
    int _2298 = _1946;
    float _2300 = _2264 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2302 = _2298;
    int _2304 = as_type<int>(_2300);
    if (!_2266)
    {
        _2302 = _2290;
    }
    int _2306 = _2302;
    float _2308 = _2292 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2310 = _2294 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2312 = fma(_2270, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2300);
    int _2314 = _2306 << 6;
    float _2316 = _1584 + _2308;
    float _2318 = _1440 + _2310;
    float _2320 = fma(_2278, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2312);
    int _2322 = _2314 + 48;
    uint _2324 = uint(int(uint(_2322) >> uint(2)));
    uint _2326 = uint(int(uint(int(_2324)) >> uint(2)));
    int _2328 = int(_2324) & 3;
    float _2330 = (*spvDescriptorSet0.vp_c15)._m0[int(_2326)][_2328];
    int _2332 = int(_2324) + 1;
    uint _2334 = uint(int(uint(_2332) >> uint(2)));
    int _2336 = _2332 & 3;
    float _2338 = (*spvDescriptorSet0.vp_c15)._m0[int(_2334)][_2336];
    float _2340 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2342 = _2316 + _2340;
    int _2344 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2346 = _2286 + _2344;
    int _2348 = _2346 + 1;
    float _2350 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2352 = _2318 + _2350;
    float _2354 = _2342 * _2342;
    int _2356 = _2348 | _2128;
    int _2358 = _2314 + 56;
    uint _2360 = uint(int(uint(_2358) >> uint(2)));
    uint _2362 = uint(int(uint(int(_2360)) >> uint(2)));
    int _2364 = int(_2360) & 3;
    float _2366 = (*spvDescriptorSet0.vp_c15)._m0[int(_2362)][_2364];
    int _2368 = int(_2360) + 1;
    uint _2370 = uint(int(uint(_2368) >> uint(2)));
    int _2372 = _2368 & 3;
    float _2374 = (*spvDescriptorSet0.vp_c15)._m0[int(_2370)][_2372];
    bool _2376 = _2348 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _2378 = fma(_2352, _2352, _2354);
    bool _2380 = _2356 < 0;
    bool _2382 = _2380 || _2376;
    float _2384 = sqrt(_2378);
    int _2386 = _2314 + 64;
    uint _2388 = uint(int(uint(_2386) >> uint(2)));
    uint _2390 = uint(int(uint(int(_2388)) >> uint(2)));
    int _2392 = int(_2388) & 3;
    float _2394 = (*spvDescriptorSet0.vp_c15)._m0[int(_2390)][_2392];
    int _2396 = int(_2388) + 1;
    uint _2398 = uint(int(uint(_2396) >> uint(2)));
    int _2400 = _2396 & 3;
    float _2402 = (*spvDescriptorSet0.vp_c15)._m0[int(_2398)][_2400];
    bool _2404 = _2128 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2406 = _2404 || _2382;
    int _2408 = _2314 + 72;
    uint _2410 = uint(int(uint(_2408) >> uint(2)));
    uint _2412 = uint(int(uint(int(_2410)) >> uint(2)));
    int _2414 = int(_2410) & 3;
    float _2416 = (*spvDescriptorSet0.vp_c15)._m0[int(_2412)][_2414];
    int _2418 = int(_2410) + 1;
    uint _2420 = uint(int(uint(_2418) >> uint(2)));
    int _2422 = _2418 & 3;
    float _2424 = (*spvDescriptorSet0.vp_c15)._m0[int(_2420)][_2422];
    int _2426 = as_type<int>(_2354);
    float _2428 = _2318;
    float _2430 = _2316;
    if (!_2406)
    {
        int _2432 = _2128 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _2434 = _2432 + _2348;
        _2304 = _2434;
    }
    int _2436 = _2304;
    bool _2438 = _2384 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _2440 = _2314 + 96;
    uint _2442 = uint(int(uint(_2440) >> uint(2)));
    uint _2444 = uint(int(uint(int(_2442)) >> uint(2)));
    int _2446 = int(_2442) & 3;
    float _2448 = (*spvDescriptorSet0.vp_c15)._m0[int(_2444)][_2446];
    int _2450 = int(_2442) + 1;
    uint _2452 = uint(int(uint(_2450) >> uint(2)));
    int _2454 = _2450 & 3;
    float _2456 = (*spvDescriptorSet0.vp_c15)._m0[int(_2452)][_2454];
    float _2458 = _2320 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2460 = _2384;
    if (!_2406)
    {
        int _2462 = _2436 << 2;
        _2296 = _2462;
    }
    int _2464 = _2296;
    int _2466 = _2464;
    if (!_2406)
    {
        uint _2468 = uint(int(uint(_2436) >> uint(2)));
        _2426 = int(_2468);
    }
    int _2470 = _2426;
    float _2472 = _1424 + _2458;
    float _2474 = as_type<float>(_2470);
    float _2476 = _2472;
    if (!_2406)
    {
        int _2478 = 12 & _2464;
        _2466 = _2478;
    }
    int _2480 = _2466;
    int _2482 = _2314 + 104;
    uint _2484 = uint(int(uint(_2482) >> uint(2)));
    uint _2486 = uint(int(uint(int(_2484)) >> uint(2)));
    int _2488 = int(_2484) & 3;
    float _2490 = (*spvDescriptorSet0.vp_c15)._m0[int(_2486)][_2488];
    int _2492 = int(_2484) + 1;
    uint _2494 = uint(int(uint(_2492) >> uint(2)));
    int _2496 = _2492 & 3;
    float _2498 = (*spvDescriptorSet0.vp_c15)._m0[int(_2494)][_2496];
    float _2500 = as_type<float>(_2480);
    if (!_2406)
    {
        int _2502 = _2470 << 4;
        int _2504 = _2502 + _2480;
        _2474 = as_type<float>(_2504);
    }
    float _2506 = _2474;
    bool _2508 = !_2438;
    if (!_2508)
    {
        float _2510 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2512 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2514 = _2384 + _2512;
        float _2516 = _2472 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2518 = rsqrt(_2378);
        float _2520 = _2514 * _2510;
        float _2522 = _2520 * 0.15915493667125701904296875;
        float _2524 = _2522 * 6.283185482025146484375;
        float _2526 = cos(_2524);
        float _2528 = _2522 * 6.283185482025146484375;
        float _2530 = sin(_2528);
        float _2532 = _2526 + (-1.0);
        float _2534 = fma(_2530, _2516, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2536 = _2532 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2538 = _2518 * _2534;
        float _2540 = fma(_2472, _2526, _2536);
        float _2542 = fma(_2352, _2538, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2544 = fma(_2342, _2538, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2476 = _2540;
        _2428 = _2542;
        _2430 = _2544;
        _2460 = _2532;
        _2500 = _2530;
    }
    float _2546 = _2476;
    float _2548 = _2428;
    float _2550 = _2430;
    float _2552 = _2460;
    float _2554 = _2500;
    float _2556 = -_1424;
    float _2558 = _2556 + _2546;
    int _2560 = _2314 + 80;
    uint _2562 = uint(int(uint(_2560) >> uint(2)));
    uint _2564 = uint(int(uint(int(_2562)) >> uint(2)));
    int _2566 = int(_2562) & 3;
    float _2568 = (*spvDescriptorSet0.vp_c15)._m0[int(_2564)][_2566];
    int _2570 = int(_2562) + 1;
    uint _2572 = uint(int(uint(_2570) >> uint(2)));
    int _2574 = _2570 & 3;
    float _2576 = (*spvDescriptorSet0.vp_c15)._m0[int(_2572)][_2574];
    float _2578 = -_1440;
    float _2580 = _2578 + _2548;
    float _2582 = -_1584;
    float _2584 = _2582 + _2550;
    float _2586 = _2558 * _2558;
    float _2588 = _1974 * _2456;
    float _2590 = _2554;
    float _2592 = _2552;
    float _2594 = _2548;
    float _2596 = _2546;
    float _2598 = _2550;
    if (!_2406)
    {
        float _2600 = floor(_2276);
        _2590 = _2600;
    }
    float _2602 = _2590;
    float _2604 = _1974 * _2402;
    float _2606 = fma(_2580, _2580, _2586);
    int _2608 = _2314 + 88;
    uint _2610 = uint(int(uint(_2608) >> uint(2)));
    uint _2612 = uint(int(uint(int(_2610)) >> uint(2)));
    int _2614 = int(_2610) & 3;
    float _2616 = (*spvDescriptorSet0.vp_c15)._m0[int(_2612)][_2614];
    int _2618 = int(_2610) + 1;
    uint _2620 = uint(int(uint(_2618) >> uint(2)));
    int _2622 = _2618 & 3;
    float _2624 = (*spvDescriptorSet0.vp_c15)._m0[int(_2620)][_2622];
    float _2626 = fma(_1798, _2448, _2588);
    float _2628 = fma(_1798, _2394, _2604);
    float _2630 = fma(_2584, _2584, _2606);
    float _2632 = fma(_1806, _2490, _2626);
    if (!_2406)
    {
        float _2634 = floor(_2034);
        _2592 = _2634;
    }
    float _2636 = _2592;
    bool _2638 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2640 = isnan(0.5);
    bool _2642 = _2638 || _2640;
    bool _2644 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2646 = _2642 || _2644;
    float _2648 = _2506;
    if (!_2406)
    {
        int _2650 = as_type<int>(_2506) + 400;
        uint _2652 = uint(int(uint(_2650) >> uint(2)));
        uint _2654 = uint(int(uint(int(_2652)) >> uint(2)));
        int _2656 = int(_2652) & 3;
        float _2658 = (*spvDescriptorSet0.vp_c15)._m0[int(_2654)][_2656];
        _2648 = _2658;
    }
    float _2660 = _2648;
    float _2662 = _2632 + _2498;
    float _2664 = _1974 * _2338;
    float _2666 = fma(_1806, _2416, _2628);
    float _2668 = sqrt(_2630);
    float _2670 = fma(_1798, _2330, _2664);
    float _2672 = fma(_1806, _2366, _2670);
    float _2674 = 1.0 / _2662;
    bool _2676 = _2668 > 0.0;
    bool _2678 = !_2676;
    float _2680 = _2666;
    float _2682 = _2674;
    if (!_2678)
    {
        float _2684 = _301 * _301;
        float _2686 = rsqrt(_2630);
        float _2688 = fma(_293, _293, _2684);
        float _2690 = fma(_311, _311, _2688);
        float _2692 = sqrt(_2690);
        float _2694 = _2580 * _2686;
        float _2696 = _2558 * _2686;
        float _2698 = _2584 * _2686;
        bool _2700 = _2692 > 0.0;
        bool _2702 = !_2700;
        if (!_2702)
        {
            float _2704 = rsqrt(_2690);
            float _2706 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2708 = _301 * _2704;
            float _2710 = _293 * _2704;
            float _2712 = _2696 * _2708;
            float _2714 = _311 * _2704;
            float _2716 = fma(_2694, _2710, _2712);
            float _2718 = _2706 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2720 = fma(_2698, _2714, _2716);
            float _2722 = _2720 * _2718;
            float _2724 = fma(_293, _2722, _2548);
            float _2726 = fma(_301, _2722, _2546);
            float _2728 = fma(_311, _2722, _2550);
            _2594 = _2724;
            _2596 = _2726;
            _2598 = _2728;
        }
    }
    float _2730 = _2594;
    float _2732 = _2596;
    float _2734 = _2598;
    float _2736 = -_1786;
    float _2738 = fma(_2736, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2730);
    float _2740 = -_1784;
    float _2742 = fma(_2740, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2732);
    float _2744 = -_1794;
    float _2746 = fma(_2744, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2734);
    float _2748 = _2672 + _2374;
    float _2750 = _2666 + _2424;
    float _2752 = _2742;
    float _2754 = _2738;
    float _2756 = _2746;
    if (!_2646)
    {
        float _2758 = _1802 * _1802;
        float _2760 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2762 = -_1424;
        float _2764 = _2762 + _2732;
        float _2766 = -_1440;
        float _2768 = _2766 + _2730;
        float _2770 = fma(_1810, _1810, _2758);
        float _2772 = -_1584;
        float _2774 = _2772 + _2734;
        float _2776 = fma(_1816, _1816, _2770);
        float _2778 = 1.0 / _2218;
        float _2780 = sqrt(_2776);
        float _2782 = _2764 * _2778;
        float _2784 = _2768 * _2778;
        float _2786 = _2774 * _2778;
        bool _2788 = _2780 > (*spvDescriptorSet0.vp_c9)._m0[199].x;
        bool _2790 = isnan(_2780);
        bool _2792 = _2788 || _2790;
        bool _2794 = isnan((*spvDescriptorSet0.vp_c9)._m0[199].x);
        bool _2796 = _2792 || _2794;
        float _2798 = precise::min(_2780, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2800 = _2798 * _2760;
        float _2802 = fma(_2782, _2800, _1792);
        float _2804 = fma(_2784, _2800, _1798);
        float _2806 = _2666;
        float _2808 = _2780;
        float _2810 = _2800;
        float _2812 = _2802;
        float _2814 = _2804;
        _1824 = _2758;
        if (_2796)
        {
            float _2816 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].y;
            _2806 = _2816;
        }
        float _2818 = _2806;
        if (_2796)
        {
            float _2820 = precise::max(_2780, (*spvDescriptorSet0.vp_c9)._m0[199].y);
            _2808 = _2820;
        }
        float _2822 = _2808;
        float _2824 = fma(_2786, _2800, _1806);
        _2756 = _2824;
        _2680 = _2818;
        if (_2796)
        {
            float _2826 = _2822 * _2818;
            _2810 = _2826;
        }
        float _2828 = _2810;
        if (_2796)
        {
            float _2830 = fma(_2782, _2828, _1792);
            _2812 = _2830;
        }
        float _2832 = _2812;
        _2752 = _2832;
        if (_2796)
        {
            float _2834 = fma(_2784, _2828, _1798);
            _2814 = _2834;
        }
        float _2836 = _2814;
        _2754 = _2836;
        if (_2796)
        {
            float _2838 = fma(_2786, _2828, _1806);
            _2756 = _2838;
        }
    }
    float _2840 = _2752;
    float _2842 = _2754;
    float _2844 = _2756;
    float _2846 = _2680;
    float _2848 = _1824;
    float _2850 = _2840 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2852 = _2748 * _2674;
    float _2854 = _2840 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2856 = _2840 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2858 = fma(_2842, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2850);
    float _2860 = _2750 * _2674;
    float _2862 = fma(_2842, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2854);
    bool _2864 = _2852 >= 0.0;
    float _2866 = fma(_2844, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2858);
    float _2868 = fma(_2842, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2856);
    float _2870 = _2840 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2872 = fma(_2844, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2862);
    float _2874 = _2866 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _2876 = _2852 <= 1.0;
    bool _2878 = _2876 && _2864;
    float _2880 = fma(_2844, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2868);
    float _2882 = fma(_2842, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2870);
    float _2884 = _2872 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2886 = _2874 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _2888 = _2860 >= 0.0;
    bool _2890 = _2888 && _2878;
    float _2892 = _2880 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2894 = fma(_2844, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2882);
    float _2896 = fma(_2884, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2886);
    bool _2898 = _2860 <= 1.0;
    bool _2900 = _2898 && _2890;
    float _2902 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2904 = _2892 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2906 = _2894 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2908 = fma(_2892, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2896);
    float _2910 = _2846;
    float _2912 = _2848;
    if (!_2406)
    {
        float _2914 = rint(_2660);
        float _2916 = precise::max(_2914, 0.0);
        uint _2918 = uint(_2916);
        uint _2920 = clamp(_2918, 0u, 65535u);
        _2910 = as_type<float>(_2920);
    }
    float _2922 = _2910;
    float _2924 = -_2904;
    float _2926 = fma(_2924, _2902, 1.0);
    float _2928 = _1974 * _2576;
    float _2930 = fma(_2906, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2908);
    float _2932 = _2874 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2934 = _2874 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2936 = fma(_1798, _2568, _2928);
    float _2938 = _2928;
    float _2940 = _2926;
    float _2942 = _2930;
    if (!_2406)
    {
        float _2944 = -_2636;
        float _2946 = _2034 + _2944;
        _1788 = _2946;
    }
    float _2948 = _1788;
    float _2950 = 1.0 / _2930;
    if (_2900)
    {
        float _2952 = float(_2306);
        _2938 = _2952;
    }
    float _2954 = _2938;
    float _2956 = fma(_2884, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2932);
    float _2958 = fma(_2884, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2934);
    float _2960 = fma(_1806, _2616, _2936);
    float _2962 = fma(_2892, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2956);
    float _2964 = fma(_2892, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2958);
    float _2966 = log2(_2926);
    float _2968 = _2960 + _2624;
    float _2970 = fma(_2906, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2962);
    float _2972 = fma(_2906, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2964);
    float _2974 = _2968 * _2674;
    float _2976 = _2954;
    float _2978 = _2970;
    if (_2900)
    {
        float _2980 = rint(_2954);
        float _2982 = precise::max(_2980, 0.0);
        uint _2984 = uint(_2982);
        uint _2986 = clamp(_2984, 0u, 65535u);
        _2976 = as_type<float>(_2986);
    }
    float _2988 = _2976;
    float _2990 = _2970 * _2950;
    float _2992 = _2972 * _2950;
    if (!_2406)
    {
        float _2994 = -_2602;
        float _2996 = _2276 + _2994;
        _2940 = _2996;
    }
    float _2998 = _2940;
    float _3000 = fma(_2990, 0.5, 0.5);
    float _3002 = fma(_2992, -0.5, 0.5);
    float _3004 = _2966 * 0.693147182464599609375;
    float _3006 = _2948;
    float _3008 = _3000;
    float _3010 = _3002;
    if (!_2406)
    {
        float3 _8651 = float3(_2998, _2948, float(as_type<int>(_2922)));
        float3 _8655 = select(_8651, float3(0.0), isnan(_8651));
        float _3012 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _8655.xy, uint(rint(_8655.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _8655.xy, uint(rint(_8655.z)), level(0.0)).x;
        _3006 = _3012;
    }
    float _3014 = _3006;
    float _3016 = _3004 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3018 = _2860;
    if (_2900)
    {
        float3 _8674 = float3(_2852, _2860, float(as_type<int>(_2988)));
        float3 _8676 = select(_8674, float3(0.0), isnan(_8674));
        float _3020 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _8676.xy, uint(rint(_8676.z)), _2974, level(0.0));
        _3018 = _3020;
    }
    float _3022 = _3018;
    float3 _8686 = float3(_3000, _3002, _3016);
    float _3024 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8686, float3(0.0), isnan(_8686)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8686, float3(0.0), isnan(_8686)), level(0.0)).x;
    float3 _8695 = float3(_3000, _3002, _3016);
    float4 _3027 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8695, float3(0.0), isnan(_8695)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8695, float3(0.0), isnan(_8695)), level(0.0)).xyzw;
    float _3029 = _3027.x;
    float _3031 = _3027.y;
    float _3033 = _3027.z;
    float _3035 = _3027.w;
    bool _3037 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _3039 = isnan(0.5);
    bool _3041 = _3037 || _3039;
    bool _3043 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3045 = _3041 || _3043;
    if (_2406)
    {
        _1826 = 1.0;
    }
    float _3047 = _1826;
    float _3049 = _3047;
    if (_3045)
    {
        _2682 = 1.0;
    }
    float _3051 = _2682;
    float _3053 = _3051;
    if (_3045)
    {
        _2912 = 1.0;
    }
    float _3055 = _2912;
    float _3057 = _3055;
    float _3059 = _3031;
    float _3061 = _3029;
    if (!_3045)
    {
        float _3063 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3065 = _3063 * 0.15915493667125701904296875;
        float _3067 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3069 = _3065 * 6.283185482025146484375;
        float _3071 = cos(_3069);
        float _3073 = _3067 * 0.15915493667125701904296875;
        float _3075 = _3065 * 6.283185482025146484375;
        float _3077 = sin(_3075);
        float _3079 = 1.0 / _3071;
        float _3081 = _3073 * 6.283185482025146484375;
        float _3083 = cos(_3081);
        float _3085 = _3077 * _3079;
        float _3087 = _3073 * 6.283185482025146484375;
        float _3089 = sin(_3087);
        float _3091 = _3083 * _3085;
        float _3093 = 1.0 / _3091;
        float _3095 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3097 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3095;
        float _3099 = 1.0 / _3097;
        float _3101 = _3089 * _3093;
        float _3103 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3105 = fma(_2248, _3101, _3103);
        float _3107 = _3105 * _3099;
        float _3109 = precise::clamp(_3107, 0.0, 1.0);
        _3008 = _3073;
        _3010 = _3099;
        _3057 = _3109;
    }
    float _3111 = _3008;
    float _3113 = _3010;
    float _3115 = _3057;
    float _3117 = _3111;
    float _3119 = _3113;
    if (!_3045)
    {
        float _3121 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3123 = _3121 * 0.15915493667125701904296875;
        float _3125 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3127 = _3123 * 6.283185482025146484375;
        float _3129 = cos(_3127);
        float _3131 = _3125 * 0.15915493667125701904296875;
        float _3133 = _3123 * 6.283185482025146484375;
        float _3135 = sin(_3133);
        float _3137 = 1.0 / _3129;
        float _3139 = _3131 * 6.283185482025146484375;
        float _3141 = cos(_3139);
        float _3143 = _3135 * _3137;
        float _3145 = _3131 * 6.283185482025146484375;
        float _3147 = sin(_3145);
        float _3149 = _3141 * _3143;
        float _3151 = 1.0 / _3149;
        float _3153 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3155 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _3153;
        float _3157 = 1.0 / _3155;
        float _3159 = _3147 * _3151;
        float _3161 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3163 = fma(_2248, _3159, _3161);
        float _3165 = _3163 * _3157;
        float _3167 = precise::clamp(_3165, 0.0, 1.0);
        float _3169 = -_3167;
        float _3171 = _3169 + 1.0;
        _3117 = _3137;
        _3053 = _3171;
    }
    float _3173 = _3117;
    float _3175 = _3053;
    float _3177 = _3173;
    if (!_2406)
    {
        int _3179 = _2436 << 4;
        int _3181 = _3179 + 2048;
        uint _3183 = uint(int(uint(_3181) >> uint(2)));
        uint _3185 = uint(int(uint(int(_3183)) >> uint(2)));
        int _3187 = int(_3183) & 3;
        float _3189 = (*spvDescriptorSet0.vp_c15)._m0[int(_3185)][_3187];
        int _3191 = int(_3183) + 1;
        uint _3193 = uint(int(uint(_3191) >> uint(2)));
        int _3195 = _3191 & 3;
        float _3197 = (*spvDescriptorSet0.vp_c15)._m0[int(_3193)][_3195];
        int _3199 = _3181 + 8;
        uint _3201 = uint(int(uint(_3199) >> uint(2)));
        uint _3203 = uint(int(uint(int(_3201)) >> uint(2)));
        int _3205 = int(_3201) & 3;
        float _3207 = (*spvDescriptorSet0.vp_c15)._m0[int(_3203)][_3205];
        int _3209 = int(_3201) + 1;
        uint _3211 = uint(int(uint(_3209) >> uint(2)));
        int _3213 = _3209 & 3;
        float _3215 = (*spvDescriptorSet0.vp_c15)._m0[int(_3211)][_3213];
        float _3217 = _1974 * _3197;
        float _3219 = fma(_1798, _3189, _3217);
        float _3221 = fma(_1806, _3207, _3219);
        float _3223 = _3221 + _3215;
        float _3225 = precise::clamp(_3223, 0.0, 1.0);
        float _3227 = -_3225;
        float _3229 = _3227 + _3014;
        float _3231 = fma(_3229, 500.0, 1.5);
        float _3233 = exp2(_3231);
        float _3235 = 0.0 + _3233;
        float _3237 = precise::clamp(_3235, 0.0, 1.0);
        _3049 = _3237;
    }
    float _3239 = _3049;
    float _3241 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3243 = _2840 + _3241;
    float _3245 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3247 = _2842 + _3245;
    float _3249 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3251 = _2844 + _3249;
    float _3253 = _3243 * _3243;
    float _3255 = fma(_3247, _3247, _3253);
    float _3257 = fma(_3251, _3251, _3255);
    float _3259 = rsqrt(_3257);
    float _3261 = _3259 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3263 = _3247 * _3261;
    float _3265 = _3251 * _3261;
    float _3267 = _3263 * _3263;
    float _3269 = _3265 * _3265;
    float _3271 = _3267 + _3269;
    float _3273 = sqrt(_3271);
    bool _3275 = _3273 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3277 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3279 = _3273 + _3277;
    float _3281 = _3259;
    float _3283 = _3279;
    float _3285 = _3261;
    if (_3275)
    {
        float _3287 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3281 = _3287;
    }
    float _3289 = _3281;
    if (_3275)
    {
        float _3291 = rsqrt(_3271);
        _1828 = _3291;
    }
    float _3293 = _1828;
    float _3295 = _3293;
    if (_3275)
    {
        float _3297 = _3279 * _3289;
        _3283 = _3297;
    }
    float _3299 = _3283;
    if (_3275)
    {
        float _3301 = _3299 * 0.15915493667125701904296875;
        _3119 = _3301;
    }
    float _3303 = _3119;
    float _3305 = _3289;
    if (_3275)
    {
        float _3307 = _3303 * 6.283185482025146484375;
        float _3309 = sin(_3307);
        _3305 = _3309;
    }
    float _3311 = _3305;
    float _3313 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3315 = precise::max(0.0, _3313);
    float _3317 = _3251;
    float _3319 = _3315;
    if (_3275)
    {
        float _3321 = _3303 * 6.283185482025146484375;
        float _3323 = cos(_3321);
        _3317 = _3323;
    }
    float _3325 = _3317;
    float _3327 = -_3261;
    float _3329 = -_3315;
    float _3331 = fma(_3243, _3327, _3329);
    float _3333 = _3331;
    if (_3275)
    {
        float _3335 = _3331 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3319 = _3335;
    }
    float _3337 = _3319;
    float _3339 = _3311;
    float _3341 = _3337;
    if (_3275)
    {
        float _3343 = fma(_3311, _3337, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3177 = _3343;
    }
    float _3345 = _3177;
    float _3347 = _3345;
    if (!_3275)
    {
        _3339 = _3263;
    }
    float _3349 = _3339;
    float _3351 = _3349;
    if (_3275)
    {
        float _3353 = _3325 + (-1.0);
        _3341 = _3353;
    }
    float _3355 = _3341;
    float _3357 = _3355;
    if (_3275)
    {
        float _3359 = _3293 * _3345;
        _3285 = _3359;
    }
    float _3361 = _3285;
    if (!_3275)
    {
        _3347 = _3267;
    }
    float _3363 = _3347;
    float _3365 = _3363;
    if (_3275)
    {
        float _3367 = _3355 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3295 = _3367;
    }
    float _3369 = _3295;
    float _3371 = _3369;
    if (_3275)
    {
        float _3373 = _3263 * _3361;
        _3351 = _3373;
    }
    float _3375 = _3351;
    if (!_3275)
    {
        _3357 = _3265;
    }
    float _3377 = _3357;
    float _3379 = _3377;
    if (_3275)
    {
        float _3381 = _3265 * _3361;
        _3379 = _3381;
    }
    float _3383 = _3379;
    if (_3275)
    {
        float _3385 = fma(_3331, _3325, _3369);
        _3333 = _3385;
    }
    float _3387 = _3333;
    if (_3275)
    {
        float _3389 = _3375 * _3375;
        _3365 = _3389;
    }
    float _3391 = _3365;
    float _3393 = sqrt(_3257);
    if (!_3275)
    {
        _3371 = _3269;
    }
    float _3395 = _3371;
    float _3397 = _3395;
    if (_3275)
    {
        float _3399 = _3383 * _3383;
        _3397 = _3399;
    }
    float _3401 = _3397;
    float _3403 = fma(_3387, _3387, _3391);
    float _3405 = _3403 + _3401;
    float _3407 = rsqrt(_3405);
    float _3409 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3411 = fma(_3393, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3409);
    float _3413 = precise::clamp(_3411, 0.0, 1.0);
    float _3415 = -_3413;
    float _3417 = _3415 + 1.0;
    float _3419 = abs(_3417);
    float _3421 = log2(_3419);
    float _3423 = _3407 * _3375;
    float _3425 = _3407 * _3387;
    float _3427 = _3407 * _3383;
    float _3429 = _3423 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3431 = -_3429;
    float _3433 = fma(_3425, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3431);
    float _3435 = -_3427;
    float _3437 = fma(_3435, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3433);
    float _3439 = _3421 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3441 = fma(_3437, -0.5, 0.5);
    float _3443 = fma(_3437, 0.5, 0.5);
    float _3445 = _3425 + 1.0;
    float _3447 = exp2(_3439);
    float _3449 = fma(_3443, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3451 = fma(_3443, _3449, -0.212114393711090087890625);
    float _3453 = sqrt(_3441);
    float _3455 = fma(_3443, _3451, 1.570728778839111328125);
    float _3457 = -_3425;
    float _3459 = fma(_3447, _3445, _3457);
    float _3461 = fma(_3459, 0.5, 0.5);
    float _3463 = _3453 * 0.636619746685028076171875;
    float _3465 = -_3455;
    float _3467 = fma(_3463, _3465, 1.0);
    float2 _9337 = float2(_3467, _3461);
    float3 _3471 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9337, float2(0.0), isnan(_9337)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9337, float2(0.0), isnan(_9337)), level(0.0)).xyz;
    float _3473 = _3471.x;
    float _3475 = _3471.y;
    float _3477 = _3471.z;
    float _3479 = abs(_2248);
    float _3481 = log2(_3479);
    float _3483 = _2184 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3485 = _2184 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3487 = _2184 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3489 = _219 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3491 = fma(_2208, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3483);
    float _3493 = fma(_2208, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3485);
    float _3495 = _2206 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3497 = _2206 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3499 = _2206 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3501 = fma(_2208, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3487);
    float _3503 = -_2162;
    float _3505 = fma(_3503, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3495);
    float _3507 = -_2162;
    float _3509 = fma(_3507, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3497);
    float _3511 = -_2162;
    float _3513 = fma(_3511, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3499);
    float _3515 = _2204 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3517 = fma(_2192, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3491);
    float _3519 = _3481 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3521 = _2874 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3523 = fma(_2210, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3505);
    float _3525 = fma(_2212, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3515);
    float _3527 = fma(_2210, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3509);
    float _3529 = fma(_2884, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3521);
    float _3531 = exp2(_3519);
    float _3533 = fma(_2210, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3513);
    float _3535 = _2204 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3537 = _2204 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3539 = _337 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3541 = _3489 * _3523;
    float _3543 = fma(_2192, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3493);
    float _3545 = fma(_2892, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3529);
    float _3547 = _3489 * _3527;
    float _3549 = _3489 * _3533;
    float _3551 = fma(_2212, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3535);
    float _3553 = fma(_2212, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3537);
    float _3555 = fma(_3539, _3517, _3541);
    float _3557 = _2930 * 0.5;
    float _3559 = fma(_2186, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3525);
    float _3561 = fma(_2186, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3551);
    float _3563 = fma(_2186, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3553);
    float _3565 = fma(_2972, -0.5, _3557);
    float _3567 = fma(_3539, _3543, _3547);
    float _3569 = fma(_3531, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3571 = precise::clamp(_3569, 0.0, 1.0);
    float _3573 = _3421 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3575 = _3561 + _3567;
    float _3577 = fma(_2906, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3545);
    float _3579 = fma(_3571, -2.0, 3.0);
    float _3581 = _3571 * _3571;
    bool _3583 = _2248 <= 8000.0;
    bool _3585 = isnan(_2248);
    bool _3587 = _3583 || _3585;
    bool _3589 = isnan(8000.0);
    bool _3591 = _3587 || _3589;
    float _3593 = float(_3591);
    float _3595 = exp2(_3573);
    out.gl_Position.x = _2970;
    out.gl_Position.y = _2972;
    out.gl_Position.z = _3577;
    out.gl_Position.w = _2930;
    float _3597 = _3581 * _3579;
    float _3599 = _3577 + _2930;
    float _3601 = -_1854;
    float _3603 = _3601 + 1.0;
    float _3605 = _2970 + _2930;
    float _3607 = fma(_2192, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3501);
    float _3609 = _3599 * 0.5;
    float _3611 = _3605 * 0.5;
    float _3613 = fma(_3539, _3607, _3549);
    float _3615 = _3559 + _3555;
    bool _3617 = _3393 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3619 = isnan(_3393);
    bool _3621 = _3617 || _3619;
    bool _3623 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3625 = _3621 || _3623;
    float _3627 = _3563 + _3613;
    float _3629 = -_3597;
    float _3631 = _3629 + 1.0;
    float _3633 = -_3595;
    float _3635 = _3633 + 1.0;
    if (!_2900)
    {
        _2978 = 1.0;
    }
    float _3637 = _2978;
    out.m_82.x = _3611;
    out.m_82.y = _3565;
    out.m_82.z = _3609;
    out.m_82.w = _2930;
    float _3639 = fma(_3631, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3597);
    float _3641 = _3637;
    if (_2900)
    {
        bool _3643 = _3022 >= _2974;
        bool _3645 = isnan(_3022);
        bool _3647 = _3643 || _3645;
        bool _3649 = isnan(_2974);
        bool _3651 = _3647 || _3649;
        float _3653 = float(_3651);
        _3641 = _3653;
    }
    float _3655 = _3641;
    float _3657 = _3635 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_84.x = _3615;
    out.m_84.y = _3575;
    out.m_84.z = _3627;
    float _3659 = _3593 * _3639;
    float _3661 = _3657 * _3024;
    float _3663 = _3655 * _3239;
    float _3665 = _3659 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3667 = -_3657;
    float _3669 = _3667 + 1.0;
    float _3671 = _3035 * _3661;
    float _3673 = _3669;
    if (!_3625)
    {
        _2942 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3675 = _2942;
    float _3677 = _3603 * _3665;
    float _3679 = precise::clamp(_3677, 0.0, 1.0);
    float _3681 = _3035 * _3669;
    float _3683 = _3675;
    float _3685 = _3675;
    if (!_3625)
    {
        _3673 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3687 = _3673;
    float _3689 = -_3679;
    float _3691 = fma(_3689, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3693 = -_3663;
    float _3695 = fma(_3693, _3691, 1.0);
    float _3697 = precise::clamp(_3695, 0.0, 1.0);
    float _3699 = _3691;
    float _3701 = _3687;
    float _3703 = _3687;
    if (!_3625)
    {
        _3699 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3705 = _3699;
    float _3707 = _3477 * _3661;
    float _3709 = fma(_3473, _3671, _3029);
    float _3711 = fma(_3475, _3671, _3031);
    float _3713 = _3697 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3715 = fma(_3035, _3707, _3033);
    float _3717 = _3115 * _3175;
    float _3719 = _3717;
    float _3721 = _3705;
    float _3723 = _3705;
    if (!_3625)
    {
        _3059 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3725 = _3059;
    out.m_86.x = _3713;
    float _3727 = _3717 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3729 = _3725;
    float _3731 = _3725;
    if (!_3625)
    {
        _3061 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3733 = _3061;
    out.m_88.x = _3709;
    out.m_88.y = _3711;
    out.m_88.z = _3715;
    out.m_88.w = _3681;
    float _3735 = _3733;
    float _3737 = _3733;
    if (!_3625)
    {
        _3719 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3739 = _3719;
    bool _3741 = !_3625;
    float _3743 = _3739;
    float _3745 = _3739;
    if (!_3741)
    {
        bool _3747 = _3393 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3749 = isnan(_3393);
        bool _3751 = _3747 || _3749;
        bool _3753 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3755 = _3751 || _3753;
        if (!_3755)
        {
            float _3757 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3759 = _3393 + _3757;
            float _3761 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3763 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3761;
            float _3765 = 1.0 / _3763;
            float _3767 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3769 = _3767 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3771 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3773 = _3771 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3775 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3777 = _3775 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3779 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3781 = _3779 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3783 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3785 = _3783 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3787 = _3759 * _3765;
            float _3789 = precise::clamp(_3787, 0.0, 1.0);
            float _3791 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3793 = _3791 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3795 = fma(_3789, _3769, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3797 = fma(_3789, _3793, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3799 = fma(_3789, _3773, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3801 = fma(_3789, _3777, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3803 = fma(_3789, _3781, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3805 = fma(_3789, _3785, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3737 = _3797;
            _3723 = _3803;
            _3731 = _3795;
            _3703 = _3801;
            _3685 = _3799;
            _3745 = _3805;
            _3807 = true;
        }
        else
        {
            bool _3809 = _3393 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3811 = isnan(_3393);
            bool _3813 = _3809 || _3811;
            bool _3815 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3817 = _3813 || _3815;
            if (!_3817)
            {
                _3729 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3819 = _3729;
            _3731 = _3819;
            if (!_3817)
            {
                _3735 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3821 = _3735;
            _3737 = _3821;
            if (!_3817)
            {
                _3683 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3823 = _3683;
            _3685 = _3823;
            if (!_3817)
            {
                _3701 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3825 = _3701;
            _3703 = _3825;
            if (!_3817)
            {
                _3721 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3827 = _3721;
            _3723 = _3827;
            if (!_3817)
            {
                _3743 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3829 = _3743;
            bool _3831 = !_3817;
            _3745 = _3829;
            if (!_3831)
            {
                bool _3833 = _3393 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3835 = isnan(_3393);
                bool _3837 = _3833 || _3835;
                bool _3839 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3841 = _3837 || _3839;
                if (!_3841)
                {
                    float _3843 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3845 = _3393 + _3843;
                    float _3847 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3849 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3847;
                    float _3851 = 1.0 / _3849;
                    float _3853 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3855 = _3853 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3857 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3859 = _3857 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3861 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3863 = _3861 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3865 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3867 = _3865 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3869 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3871 = _3869 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3873 = _3845 * _3851;
                    float _3875 = precise::clamp(_3873, 0.0, 1.0);
                    float _3877 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3879 = _3877 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3881 = fma(_3875, _3855, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3883 = fma(_3875, _3879, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3885 = fma(_3875, _3859, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3887 = fma(_3875, _3863, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3889 = fma(_3875, _3867, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3891 = fma(_3875, _3871, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3737 = _3883;
                    _3723 = _3889;
                    _3731 = _3881;
                    _3703 = _3887;
                    _3685 = _3885;
                    _3745 = _3891;
                    _3807 = true;
                }
                else
                {
                    _3737 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3723 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3731 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3703 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3685 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3745 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3807 = false;
    float _3893 = _3737;
    float _3895 = _3723;
    float _3897 = _3731;
    float _3899 = _3703;
    float _3901 = _3685;
    float _3903 = _3745;
    float _3905 = fma(_3575, -0.5, 0.5);
    float _3907 = precise::clamp(_3905, 0.0, 1.0);
    float _3909 = -_3893;
    float _3911 = _3909 + _3895;
    float _3913 = -_3897;
    float _3915 = _3913 + _3899;
    out.m_90.x = 0.0;
    float _3917 = fma(_3907, _3911, _3893);
    float _3919 = -_3901;
    float _3921 = _3919 + _3903;
    float _3923 = fma(_3907, _3915, _3897);
    float _3925 = _3917 * 0.586610972881317138671875;
    bool _3927 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3929 = fma(_3907, _3921, _3901);
    float _3931 = _3727 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3933 = fma(_3923, 0.298911988735198974609375, _3925);
    bool _3935 = _3115 > 0.0;
    bool _3937 = isnan(_3115);
    bool _3939 = _3935 || _3937;
    bool _3941 = isnan(0.0);
    bool _3943 = _3939 || _3941;
    float _3945 = fma(_3929, 0.114477999508380889892578125, _3933);
    out.m_59.x = _3931;
    bool _3947 = _3175 <= 0.0;
    bool _3949 = !_3943;
    bool _3951 = _3947 || _3949;
    float _3953 = -_3945;
    float _3955 = _3923 + _3953;
    float _3957 = -_3945;
    float _3959 = _3917 + _3957;
    float _3961 = -_3945;
    float _3963 = _3929 + _3961;
    float _3965 = fma(_3955, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3945);
    float _3967 = fma(_3959, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3945);
    float _3969 = fma(_3963, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3945);
    bool _3971 = !_3927;
    if (!_3971)
    {
        float _3973 = -_2840;
        float _3975 = _3973 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3977 = -_2842;
        float _3979 = _3977 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3981 = -_2844;
        float _3983 = _3981 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3985 = _3975 * _3975;
        float _3987 = fma(_3979, _3979, _3985);
        float _3989 = fma(_3983, _3983, _3987);
        float _3991 = sqrt(_3989);
        float _3993 = rsqrt(_3989);
        float _3995 = -_3991;
        float _3997 = _3995 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3999 = _3997 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4001 = precise::clamp(_3999, 0.0, 1.0);
        float _4003 = _3979 * _3993;
        float _4005 = _3975 * _3993;
        float _4007 = abs(_4001);
        float _4009 = log2(_4007);
        float _4011 = _3983 * _3993;
        float _4013 = _4003 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4015 = _3575 * _4005;
        float _4017 = -_4005;
        float _4019 = -_4013;
        float _4021 = fma(_4017, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4019);
        float _4023 = fma(_3615, _4003, _4015);
        float _4025 = -_4011;
        float _4027 = fma(_4025, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4021);
        float _4029 = fma(_3627, _4011, _4023);
        float _4031 = precise::clamp(_4029, 0.0, 1.0);
        float _4033 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4035 = _4027 + _4033;
        float _4037 = _4009 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4039 = _4035 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4041 = precise::clamp(_4039, 0.0, 1.0);
        float _4043 = exp2(_4037);
        float _4045 = _4043 * _4041;
        float _4047 = _4031 * _4045;
        float _4049 = _4047 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4051 = _4047 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4053 = _4047 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_90.x = _4049;
        out.m_90.y = _4051;
        out.m_90.z = _4053;
    }
    out.m_92.x = _3965;
    out.m_92.y = _3967;
    out.m_92.z = _3969;
    if (!_3951)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _4055 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_59.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4055;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3807 = false;
    bool _935 = false;
    bool _743 = false;
    bool _367 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _106 = in.m_56.w;
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
        out.m_59.x = 0.0;
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
        float _4112 = as_type<float>(_127);
        out.gl_Position.z = _4112;
    }
    if (!_115)
    {
        return out;
    }
    float _131 = in.m_61.w;
    bool _133 = _131 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _135 = isnan(_131);
    bool _137 = _133 || _135;
    bool _139 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _141 = _137 || _139;
    float _143 = -_131;
    float _145 = _143 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _147 = 0.0;
    float _149 = _145;
    if (_141)
    {
        float _151 = float(_111);
        _147 = _151;
    }
    float _153 = _147;
    bool _155 = _145 >= _153;
    bool _157 = !_141;
    bool _159 = _155 || _157;
    if (_159)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _121;
    if (_159)
    {
        out.m_59.x = 0.0;
    }
    if (_159)
    {
        float _163 = _161 * 5.0;
        _129 = as_type<int>(_163);
    }
    int _165 = _129;
    if (_159)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4181 = as_type<float>(_165);
        out.gl_Position.z = _4181;
    }
    if (_159)
    {
        return out;
    }
    float _167 = in.m_63.x;
    float _169 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _171 = _145 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _173 = as_type<float>(int(gl_VertexIndex));
    float _175 = in.m_68.x;
    float _177 = in.m_68.y;
    float _179 = in.m_68.z;
    float _181 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].w;
    float _183 = _171 * _169;
    float _185 = _145 + (*spvDescriptorSet0.vp_c9)._m0[20].w;
    float _187 = fma(_167, (*spvDescriptorSet0.vp_c9)._m0[20].x, _183);
    float _189 = _185 * _181;
    float _191 = floor(_187);
    float _193 = fma(_167, (*spvDescriptorSet0.vp_c9)._m0[20].y, _189);
    float _195 = _187 * 6.283185482025146484375;
    int _197 = as_type<int>(_173) & 1;
    bool _199 = _197 != 0;
    int _201 = as_type<int>(_173) & 2;
    bool _203 = _201 != 0;
    float _205 = _177 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _207 = _193 * 6.283185482025146484375;
    float _209 = _195 * 0.15915493667125701904296875;
    int _211 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _213 = _211 != 0;
    float _215 = floor(_193);
    bool _217 = !_203;
    float _219 = _217 ? (-0.5) : 0.5;
    float _221 = _177 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _223 = !_213;
    int _225 = _223 ? 0 : 1;
    float _227 = _177 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _229 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _231 = _229 != 0;
    int _233 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _235 = _233 != 0;
    float _237 = fma(_175, (*spvDescriptorSet0.vp_c10)._m0[4].x, _221);
    int _239 = abs(_225);
    float _241 = -_191;
    float _243 = _187 + _241;
    float _245 = _207 * 0.15915493667125701904296875;
    float _247 = _209 * 6.283185482025146484375;
    float _249 = cos(_247);
    bool _251 = !_231;
    int _253 = _251 ? 0 : 1;
    float _255 = fma(_175, (*spvDescriptorSet0.vp_c10)._m0[5].x, _205);
    bool _257 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _259 = fma(_175, (*spvDescriptorSet0.vp_c10)._m0[6].x, _227);
    int _261 = abs(_253);
    float _263 = -_215;
    float _265 = _193 + _263;
    bool _267 = _243 < 0.5;
    float _269 = float(_267);
    float _271 = _245 * 6.283185482025146484375;
    float _273 = cos(_271);
    float _275 = -_243;
    float _277 = fma(_275, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _279 = !_235;
    int _281 = _279 ? 0 : 1;
    float _283 = -_265;
    float _285 = fma(_283, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _287 = -_269;
    float _289 = fma(_287, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _291 = float(_239);
    float _293 = fma(_179, (*spvDescriptorSet0.vp_c10)._m0[4].z, _237);
    int _295 = abs(_281);
    float _297 = fma(_249, 0.5, 0.5);
    float _299 = float(_261);
    float _301 = fma(_179, (*spvDescriptorSet0.vp_c10)._m0[5].z, _255);
    bool _303 = _265 < 0.5;
    float _305 = float(_303);
    float _307 = -_297;
    float _309 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _311 = fma(_179, (*spvDescriptorSet0.vp_c10)._m0[6].z, _259);
    float _313 = abs(_277);
    float _315 = _299 * _313;
    float _317 = abs(_285);
    float _319 = _299 * _317;
    float _321 = fma(_273, 0.5, 0.5);
    float _323 = -_305;
    float _325 = fma(_323, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _327 = fma(_291, _309, _315);
    float _329 = float(_295);
    float _331 = -_321;
    float _333 = fma(_331, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    bool _335 = !_199;
    float _337 = _335 ? (-0.5) : 0.5;
    float _339 = fma(_291, _333, _319);
    float _341 = abs(_289);
    float _343 = fma(_329, _341, _327);
    float _345 = abs(_325);
    float _347 = fma(_329, _345, _339);
    bool _349 = !_257;
    float _365;
    if (!_349)
    {
        float _351 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _353 = _167 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _355 = fma(_353, (*spvDescriptorSet0.vp_c9)._m0[12].x, _145);
        float _357 = _355 * _351;
        float _359 = floor(_357);
        float _361 = -_359;
        float _363 = _357 + _361;
        _365 = _363;
        _367 = true;
    }
    else
    {
        float _369 = float(_111);
        float _371 = 1.0 / _369;
        float _373 = _145 * _371;
        _365 = _373;
    }
    _367 = false;
    float _375 = _365;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _377;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _383 = _381 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _387 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _385;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _391 = _389 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _393 = 1.0 / _379;
    float _395 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _397 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _395;
    float _399 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _401 = _399 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _403 = 1.0 / _383;
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _407 = _375 + _405;
    bool _409 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _411 = isnan(_375);
    bool _413 = _409 || _411;
    bool _415 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _417 = _413 || _415;
    float _419 = float(_417);
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _423 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _421;
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _427 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _425;
    float _429 = 1.0 / _387;
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _433 = _375 + _431;
    float _435 = _407 * _393;
    bool _437 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[150].w;
    bool _439 = isnan(_375);
    bool _441 = _437 || _439;
    bool _443 = isnan((*spvDescriptorSet0.vp_c9)._m0[150].w);
    bool _445 = _441 || _443;
    float _447 = float(_445);
    bool _449 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _451 = isnan(_375);
    bool _453 = _449 || _451;
    bool _455 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _457 = _453 || _455;
    float _459 = float(_457);
    float _461 = fma(_423, _435, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _463 = fma(_427, _435, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _465 = 1.0 / _397;
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _469 = (*spvDescriptorSet0.vp_c9)._m0[150].w + _467;
    float _471 = _433 * _403;
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _475 = _375 + _473;
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _479 = _375 + _477;
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _483 = _375 + _481;
    bool _485 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _487 = 1.0 / _391;
    float _489 = _475 * _429;
    float _491 = -_447;
    float _493 = _491 + 1.0;
    float _495 = _459 * _493;
    float _497 = -_459;
    float _499 = _497 + 1.0;
    float _501 = 1.0 / _401;
    float _503 = _479 * _465;
    bool _505 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _507 = isnan(_375);
    bool _509 = _505 || _507;
    bool _511 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _513 = _509 || _511;
    float _515 = float(_513);
    bool _517 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _519 = isnan(_375);
    bool _521 = _517 || _519;
    bool _523 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _525 = _521 || _523;
    float _527 = float(_525);
    float _529 = 1.0 / _469;
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _533 = _375 + _531;
    float _535 = _483 * _487;
    float _537 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _539 = _375 + _537;
    float _541 = _533 * _501;
    float _543 = -_515;
    float _545 = _543 + 1.0;
    float _547 = _539 * _529;
    float _549 = _515 * _499;
    bool _551 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _553 = isnan(_375);
    bool _555 = _551 || _553;
    bool _557 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _559 = _555 || _557;
    float _561 = float(_559);
    float _563 = _527 * _545;
    float _565 = -_527;
    float _567 = _565 + 1.0;
    bool _569 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _571 = isnan(_375);
    bool _573 = _569 || _571;
    bool _575 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _577 = _573 || _575;
    float _579 = float(_577);
    float _581 = -_561;
    float _583 = _581 + 1.0;
    float _585 = _561 * _567;
    bool _587 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _589 = isnan(_375);
    bool _591 = _587 || _589;
    bool _593 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _595 = _591 || _593;
    float _597 = float(_595);
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _601 = _599 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _603 = _579 * _583;
    float _605 = -_579;
    float _607 = _605 + 1.0;
    float _609 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _611 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _609;
    float _613 = -_597;
    float _615 = _613 + 1.0;
    float _617 = fma(_601, _471, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _619 = _597 * _607;
    float _621 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _623 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _621;
    float _625 = _419 * _615;
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _629 = _627 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _631 = fma(_611, _489, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _633 = fma(_623, _489, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _635 = _461 * _625;
    float _637 = -_419;
    float _639 = _637 + 1.0;
    float _641 = _463 * _625;
    float _643 = fma(_629, _471, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _645 = fma(_639, (*spvDescriptorSet0.vp_c9)._m0[143].x, _635);
    float _647 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _649 = _647 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _653 = _651 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _655 = fma(_639, (*spvDescriptorSet0.vp_c9)._m0[143].y, _641);
    float _657 = fma(_649, _535, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _659 = fma(_653, _535, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _661 = fma(_617, _619, _645);
    float _663 = fma(_643, _619, _655);
    float _665 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _667 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _665;
    float _669 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _671 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _669;
    float _673 = fma(_631, _603, _661);
    float _675 = fma(_633, _603, _663);
    float _677 = fma(_667, _503, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _679 = fma(_671, _503, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _681 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _683 = _681 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _685 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _687 = _685 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _689 = fma(_657, _585, _673);
    float _691 = fma(_659, _585, _675);
    float _693 = fma(_683, _541, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _695 = fma(_687, _541, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _697 = -(*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _699 = (*spvDescriptorSet0.vp_c9)._m0[150].x + _697;
    float _701 = -(*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _703 = (*spvDescriptorSet0.vp_c9)._m0[150].y + _701;
    float _705 = fma(_677, _563, _689);
    float _707 = fma(_679, _563, _691);
    float _709 = fma(_699, _547, (*spvDescriptorSet0.vp_c9)._m0[149].x);
    float _711 = fma(_703, _547, (*spvDescriptorSet0.vp_c9)._m0[149].y);
    float _713 = fma(_693, _549, _705);
    float _715 = fma(_695, _549, _707);
    float _717 = fma(_709, _495, _713);
    float _719 = fma(_711, _495, _715);
    float _721 = fma(_447, (*spvDescriptorSet0.vp_c9)._m0[150].x, _717);
    float _723 = fma(_447, (*spvDescriptorSet0.vp_c9)._m0[150].y, _719);
    bool _725 = !_485;
    float _741;
    if (!_725)
    {
        float _727 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _729 = _167 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _731 = fma(_729, (*spvDescriptorSet0.vp_c9)._m0[11].x, _145);
        float _733 = _731 * _727;
        float _735 = floor(_733);
        float _737 = -_735;
        float _739 = _733 + _737;
        _741 = _739;
        _743 = true;
    }
    else
    {
        float _745 = float(_111);
        float _747 = 1.0 / _745;
        float _749 = _145 * _747;
        _741 = _749;
    }
    _743 = false;
    float _751 = _741;
    float _753 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _755 = _751 + _753;
    bool _757 = _751 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _759 = isnan(_751);
    bool _761 = _757 || _759;
    bool _763 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _765 = _761 || _763;
    float _767 = float(_765);
    float _769 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _771 = _751 + _769;
    bool _773 = _751 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _775 = isnan(_751);
    bool _777 = _773 || _775;
    bool _779 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _781 = _777 || _779;
    float _783 = float(_781);
    float _785 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _787 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _785;
    float _789 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _791 = _789 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _793 = _751 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _795 = isnan(_751);
    bool _797 = _793 || _795;
    bool _799 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _801 = _797 || _799;
    float _803 = float(_801);
    float _805 = 1.0 / _787;
    float _807 = 1.0 / _791;
    float _809 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _811 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _809;
    bool _813 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _815 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _817 = _755 * _805;
    float _819 = -_767;
    float _821 = _819 + 1.0;
    float _823 = -_803;
    float _825 = _823 + 1.0;
    float _827 = fma(_811, _817, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _829 = _803 * _821;
    float _831 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _833 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _831;
    float _835 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _837 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _835;
    float _839 = _783 * _825;
    float _841 = _771 * _807;
    float _843 = fma(_833, _817, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _845 = fma(_837, _817, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _847 = _827 * _839;
    float _849 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _851 = _849 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _853 = _843 * _839;
    float _855 = _845 * _839;
    float _857 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _859 = _857 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _861 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _863 = _861 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _865 = -_783;
    float _867 = _865 + 1.0;
    float _869 = fma(_851, _841, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _871 = fma(_859, _841, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _873 = fma(_863, _841, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _875 = fma(_867, (*spvDescriptorSet0.vp_c9)._m0[107].x, _853);
    float _877 = fma(_867, (*spvDescriptorSet0.vp_c9)._m0[107].y, _847);
    float _879 = fma(_867, (*spvDescriptorSet0.vp_c9)._m0[107].z, _855);
    float _881 = fma(_871, _829, _875);
    float _883 = fma(_869, _829, _877);
    float _885 = fma(_873, _829, _879);
    float _887 = fma(_767, (*spvDescriptorSet0.vp_c9)._m0[109].x, _881);
    float _889 = fma(_767, (*spvDescriptorSet0.vp_c9)._m0[109].y, _883);
    float _891 = fma(_767, (*spvDescriptorSet0.vp_c9)._m0[109].z, _885);
    float _893 = in.m_70.x;
    float _895 = in.m_70.y;
    float _897 = _887 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _899 = _889 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _901 = _891 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _903 = _897 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _905 = _899 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _907 = _901 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_72.x = _903;
    out.m_72.y = _905;
    out.m_72.z = _907;
    out.m_72.w = _815;
    float _909 = _723 * _895;
    float _911 = _721 * _893;
    bool _913 = !_813;
    float _931;
    float _933;
    if (!_913)
    {
        float _915 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _917 = _167 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _919 = float(_111);
        float _921 = fma(_917, (*spvDescriptorSet0.vp_c9)._m0[11].z, _145);
        float _923 = _921 * _915;
        float _925 = floor(_923);
        float _927 = -_925;
        float _929 = _923 + _927;
        _931 = _919;
        _933 = _929;
        _935 = true;
    }
    else
    {
        float _937 = float(_111);
        float _939 = 1.0 / _937;
        float _941 = _145 * _939;
        _931 = _937;
        _933 = _941;
    }
    _935 = false;
    float _943 = _931;
    float _945 = _933;
    float _947 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _949 = int(_947);
    float _951 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _953 = int(_951);
    float _955 = float(_949);
    float _957 = 1.0 / _943;
    float _959 = float(uint(_953));
    float _961 = 1.0 / _955;
    int _963 = ~_953;
    int _965 = _963 + 1;
    int _967 = ~_953;
    int _969 = _967 + 1;
    int _971 = ~_953;
    int _973 = _971 + 1;
    int _975 = ~_953;
    int _977 = _975 + 1;
    float _979 = 1.0 / _959;
    float _981 = _961 * _145;
    float _983 = trunc(_981);
    int _985 = int(_983);
    int _987 = as_type<int>(_979) + (-2);
    int _989 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _991 = _989 != 0;
    float _993 = float(uint(_985));
    bool _995 = !_991;
    float _997 = _995 ? 7.345489978790283203125 : 1.0;
    float _999 = float(_953);
    float _1001 = as_type<float>(_987) * _993;
    float _1003 = _997 * _167;
    float _1005 = trunc(_1001);
    float _1007 = precise::max(_1005, 0.0);
    uint _1010 = uint(_1007);
    float _1012 = float(_985);
    bool _1014 = _1012 >= _999;
    bool _1016 = isnan(_1012);
    bool _1018 = _1014 || _1016;
    bool _1020 = isnan(_999);
    bool _1022 = _1018 || _1020;
    float _1024 = float(_1022);
    int _1026 = _965 * int(_1010);
    int _1028 = _1026 + _985;
    float _1030 = trunc(_1024);
    int _1032 = int(_1030);
    float _1034 = float(uint(_1028));
    float _1036 = as_type<float>(_987) * _1034;
    float _1038 = trunc(_1036);
    float _1040 = precise::max(_1038, 0.0);
    uint _1042 = uint(_1040);
    int _1044 = int(_1010) + int(_1042);
    float _1046 = floor(_1003);
    int _1048 = _969 * _1044;
    int _1050 = _1048 + _985;
    bool _1052 = uint(_1050) >= uint(_953);
    bool _1054 = !_1052;
    int _1056 = _1054 ? 0 : (-1);
    bool _1058 = _953 == 0;
    int _1060 = ~_1044;
    int _1062 = _1060 + _1056;
    int _1064 = _1062 + 1;
    float _1066 = -_1046;
    float _1068 = _1003 + _1066;
    int _1070 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1072 = _1070 != 0;
    int _1074 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1076 = _1074 != 0;
    int _1078 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1080 = _1078 != 0;
    int _1082 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1084 = _1082 != 0;
    int _1086 = _953 * _1064;
    int _1088 = _1086 + _985;
    int _1090 = ~_1032;
    int _1092 = _1090 + 1;
    int _1094 = _1092 + 1;
    bool _1096 = !_1072;
    int _1098 = _1096 ? 0 : 1;
    bool _1100 = !_1058;
    int _1102 = _1100 ? _1088 : (-1);
    float _1104 = _1068 * _999;
    float _1106 = _999 * _145;
    bool _1108 = !_1076;
    int _1110 = _1108 ? 0 : 1;
    int _1112 = _1102 * _1094;
    float _1114 = _1106 * _957;
    int _1116 = _953 + (-1);
    float _1118 = trunc(_1104);
    int _1120 = int(_1118);
    int _1122 = abs(_1098);
    int _1124 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1126 = _1124 != 0;
    int _1128 = _1032 * _1116;
    int _1130 = _1128 + _1112;
    bool _1132 = !_1084;
    int _1134 = _1132 ? 0 : 1;
    int _1136 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1138 = _1136 != 0;
    float _1140 = trunc(_1114);
    int _1142 = int(_1140);
    int _1144 = abs(_1110);
    bool _1146 = !_1080;
    int _1148 = _1146 ? 0 : 1;
    bool _1150 = !_1138;
    int _1152 = _1150 ? 0 : 1;
    int _1154 = abs(_1134);
    int _1156 = abs(_1148);
    int _1158 = _1130 * _1144;
    int _1160 = abs(_1152);
    int _1162 = _1120 * _1154;
    int _1164 = _1162 + _985;
    float _1166 = _167 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1168 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1170 = _1168 != 0;
    int _1172 = _1142 * _1122;
    int _1174 = _1172 + _1158;
    int _1176 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1178 = _1176 != 0;
    int _1180 = _1164 * _1156;
    int _1182 = _1180 + _1174;
    int _1184 = ~_953;
    int _1186 = _1184 + 1;
    float _1188 = in.m_63.y;
    float _1190 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1192 = _1120 * _1160;
    int _1194 = _1192 + _1182;
    float _1196 = -_1190;
    float _1198 = fma(_1166, 2.0, _1196);
    float _1200 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1202 = _945 + _1200;
    float _1204 = float(uint(_1194));
    float _1206 = as_type<float>(_987) * _1204;
    float _1208 = trunc(_1206);
    float _1210 = precise::max(_1208, 0.0);
    uint _1212 = uint(_1210);
    float _1214 = _1188 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1216 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1218 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1216;
    float _1220 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1222 = _1220 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1224 = 1.0 / _1218;
    int _1226 = _1186 * int(_1212);
    int _1228 = _1226 + _1194;
    float _1230 = float(uint(_1228));
    float _1232 = 1.0 / _1222;
    float _1234 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1236 = _945 + _1234;
    float _1238 = as_type<float>(_987) * _1230;
    float _1240 = in.m_56.x;
    float _1242 = in.m_56.y;
    float _1244 = in.m_56.z;
    float _1246 = _1236 * _1224;
    float _1248 = trunc(_1238);
    float _1250 = precise::max(_1248, 0.0);
    uint _1252 = uint(_1250);
    float _1254 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1256 = ~_953;
    int _1258 = _1256 + 1;
    float _1260 = fma(_1214, -2.0, _1254);
    int _1262 = int(_1212) + int(_1252);
    float _1264 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1260);
    int _1266 = _1258 * _1262;
    int _1268 = _1266 + _1194;
    float _1270 = _1242 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1272 = _1242 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1274 = _1242 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _1276 = uint(_1268) >= uint(_953);
    float _1278 = _1202 * _1232;
    float _1280 = fma(_1240, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1274);
    float _1282 = fma(_1240, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1270);
    bool _1284 = !_1276;
    int _1286 = _1284 ? 0 : (-1);
    float _1288 = fma(_1244, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1280);
    float _1290 = float(uint(_1164));
    float _1292 = fma(_1240, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1272);
    int _1294 = ~_1262;
    int _1296 = _1294 + _1286;
    int _1298 = _1296 + 1;
    float _1300 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1302 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1300;
    float _1304 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1306 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1304;
    bool _1308 = _167 > 0.5;
    float _1310 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1312 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1310;
    float _1314 = as_type<float>(_987) * _1290;
    float _1316 = fma(_1244, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1282);
    float _1318 = fma(_1244, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1292);
    float _1320 = fma(_1302, _1246, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1322 = fma(_1306, _1246, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1324 = fma(_1312, _1246, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1326 = -_337;
    int _1328 = _1308 ? as_type<int>(_1326) : as_type<int>(_337);
    float _1330 = trunc(_1314);
    float _1332 = precise::max(_1330, 0.0);
    uint _1334 = uint(_1332);
    int _1336 = _953 * _1298;
    int _1338 = _1336 + _1194;
    float _1340 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1342 = _1340 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    bool _1344 = !_1170;
    float _1346 = _1344 ? _337 : as_type<float>(_1328);
    float _1348 = -_145;
    float _1350 = fma(_1348, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1198);
    float _1352 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1354 = _1352 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    bool _1356 = !_1058;
    int _1358 = _1356 ? _1338 : (-1);
    float _1360 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1362 = _1360 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1364 = _1346 + 0.5;
    bool _1366 = _945 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1368 = isnan(_945);
    bool _1370 = _1366 || _1368;
    bool _1372 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1374 = _1370 || _1372;
    float _1376 = float(_1374);
    float _1378 = fma(_1354, _1278, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    int _1380 = _1358 >> 31;
    float _1382 = fma(_1364, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1350);
    bool _1384 = _945 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1386 = isnan(_945);
    bool _1388 = _1384 || _1386;
    bool _1390 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1392 = _1388 || _1390;
    float _1394 = float(_1392);
    float _1396 = fma(_1362, _1278, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    int _1398 = _1380 & 3;
    int _1400 = _973 * int(_1334);
    int _1402 = _1400 + _1164;
    float _1404 = fma(_1342, _1278, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    bool _1406 = _945 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1408 = isnan(_945);
    bool _1410 = _1406 || _1408;
    bool _1412 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1414 = _1410 || _1412;
    float _1416 = float(_1414);
    float _1418 = -_1394;
    float _1420 = _1418 + 1.0;
    bool _1422 = _1188 > 0.5;
    float _1424 = _1318 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1426 = _1358 + _1398;
    float _1428 = _1416 * _1420;
    float _1430 = float(uint(_1402));
    float _1432 = -_1416;
    float _1434 = _1432 + 1.0;
    float _1436 = -_219;
    int _1438 = _1422 ? as_type<int>(_1436) : as_type<int>(_219);
    float _1440 = _1316 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1442 = _1426 >> 2;
    float _1444 = as_type<float>(_987) * _1430;
    float _1446 = _1376 * _1434;
    bool _1448 = !_1178;
    float _1450 = _1448 ? _219 : as_type<float>(_1438);
    float _1452 = -_1376;
    float _1454 = _1452 + 1.0;
    int _1456 = _1442 << 4;
    int _1458 = _1456 + 368;
    float _1460 = _1320 * _1446;
    float _1462 = trunc(_1444);
    float _1464 = precise::max(_1462, 0.0);
    uint _1466 = uint(_1464);
    float _1468 = _1324 * _1446;
    uint _1470 = uint(int(uint(_1458) >> uint(2)));
    uint _1472 = uint(int(uint(int(_1470)) >> uint(2)));
    int _1474 = int(_1470) & 3;
    float _1476 = (*spvDescriptorSet0.vp_c9)._m0[int(_1472)][_1474];
    int _1478 = int(_1470) + 1;
    uint _1480 = uint(int(uint(_1478) >> uint(2)));
    int _1482 = _1478 & 3;
    float _1484 = (*spvDescriptorSet0.vp_c9)._m0[int(_1480)][_1482];
    float _1486 = _1450 + (-0.5);
    int _1488 = _1358 & 3;
    bool _1490 = _1488 != 0;
    float _1492 = _1322 * _1446;
    int _1494 = _1358 & 3;
    bool _1496 = _1494 != 0;
    float _1498 = -_1486;
    float _1500 = -_1264;
    float _1502 = fma(_1498, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1500);
    float _1504 = fma(_1454, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1460);
    float _1506 = fma(_1454, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1468);
    bool _1508 = uint(_1494) > 1u;
    int _1510 = _1458 + 8;
    uint _1512 = uint(int(uint(_1510) >> uint(2)));
    uint _1514 = uint(int(uint(int(_1512)) >> uint(2)));
    int _1516 = int(_1512) & 3;
    float _1518 = (*spvDescriptorSet0.vp_c9)._m0[int(_1514)][_1516];
    int _1520 = int(_1512) + 1;
    uint _1522 = uint(int(uint(_1520) >> uint(2)));
    int _1524 = _1520 & 3;
    float _1526 = (*spvDescriptorSet0.vp_c9)._m0[int(_1522)][_1524];
    float _1528 = fma(_1454, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1492);
    float _1530 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1532 = _1424 + _1530;
    float _1534 = fma(_1378, _1428, _1504);
    float _1536 = fma(_1404, _1428, _1506);
    int _1538 = int(_1334) + int(_1466);
    float _1540 = fma(_1396, _1428, _1528);
    int _1542 = _1490 ? 0 : 1;
    float _1544 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1546 = _1440 + _1544;
    float _1548 = _1532 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1550 = _977 * _1538;
    int _1552 = _1550 + _1164;
    int _1554 = ~_1542;
    int _1556 = _1554 + 1;
    int _1558 = _1556 + 1;
    float _1560 = fma(_1394, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1540);
    float _1562 = fma(_1546, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1548);
    int _1564 = _1558;
    float _1566 = _1450;
    if (!_1508)
    {
        int _1568 = ~_1542;
        int _1570 = _1568 + 1;
        _1564 = _1570;
    }
    int _1572 = _1564;
    float _1574 = fma(_1394, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1534);
    bool _1576 = !_1496;
    int _1578 = _1576 ? 0 : 1;
    float _1580 = fma(_1394, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1536);
    bool _1582 = _1494 != 3;
    float _1584 = _1288 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1586 = uint(_1552) >= uint(_953);
    int _1588 = abs(_1572);
    float _1590 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1592 = _1584 + _1590;
    bool _1594 = uint(_1494) >= 2u;
    int _1596 = abs(_1578);
    float _1598 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1562);
    bool _1600 = !_1586;
    int _1602 = _1600 ? 0 : (-1);
    int _1604 = ~_1588;
    int _1606 = _1604 + 1;
    int _1608 = _1606 + 1;
    int _1610 = _1594 ? 0 : 1;
    int _1612 = ~_1538;
    int _1614 = _1612 + _1602;
    int _1616 = _1614 + 1;
    int _1618 = ~_1596;
    int _1620 = _1618 + 1;
    int _1622 = _1620 + 1;
    int _1624 = ~_1610;
    int _1626 = _1624 + 1;
    int _1628 = _1626 + 1;
    int _1630 = _1608 * as_type<int>(_1484);
    bool _1632 = _1494 != 3;
    int _1634 = _953 * _1616;
    int _1636 = _1634 + _1164;
    int _1638 = _1628;
    if (_1582)
    {
        int _1640 = ~_1610;
        int _1642 = _1640 + 1;
        _1638 = _1642;
    }
    int _1644 = _1638;
    int _1646 = _1622 * as_type<int>(_1476);
    int _1648 = _1646 + _1630;
    bool _1650 = !_1632;
    int _1652 = _1650 ? 0 : (-1);
    int _1654 = abs(_1644);
    bool _1656 = !_1126;
    int _1658 = _1656 ? 0 : 1;
    int _1660 = abs(_1652);
    int _1662 = abs(_1658);
    float _1664 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1666 = ~_1654;
    int _1668 = _1666 + 1;
    int _1670 = _1668 + 1;
    float _1672 = _1532 * _1532;
    int _1674 = ~_1660;
    int _1676 = _1674 + 1;
    int _1678 = _1676 + 1;
    int _1680 = _1670 * as_type<int>(_1518);
    int _1682 = _1680 + _1648;
    float _1684 = fma(_1188, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1664);
    int _1686 = ~_1662;
    int _1688 = _1686 + 1;
    int _1690 = _1688 + 1;
    int _1692 = _1678 * as_type<int>(_1526);
    int _1694 = _1692 + _1682;
    bool _1696 = !_1058;
    int _1698 = _1696 ? _1636 : (-1);
    float _1700 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1702 = _1598 >= 0.0;
    int _1704 = _1694 * _1690;
    float _1706 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1684);
    float _1708 = fma(_167, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1700);
    int _1710 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1712 = _1710 != 0;
    int _1714 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1716 = _1714 != 0;
    int _1718 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1720 = _1718 != 0;
    int _1722 = _1698 * _1662;
    int _1724 = _1722 + _1704;
    float _1726 = fma(_1546, _1546, _1672);
    float _1728 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1708);
    float _1730 = -_1706;
    float _1732 = _1730 + 1.0;
    float _1734 = _1574 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1736 = fma(_1592, _1592, _1726);
    float _1738 = -_1728;
    float _1740 = _1738 + 1.0;
    float _1742 = fma(_1450, _1732, _1502);
    if (_1702)
    {
        _1566 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1744 = _1566;
    float _1746 = _1560 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1748 = -_1740;
    float _1750 = fma(_1346, _1748, _1382);
    float _1752 = rsqrt(_1736);
    float _1754 = _1580 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1756 = _1734 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1758 = _1746 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1760 = _1754 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1762 = as_type<int>(_1744);
    float _1764 = _1760;
    if (_1702)
    {
        float _1766 = _1744 * 5.0;
        _1762 = as_type<int>(_1766);
    }
    int _1768 = _1762;
    float _1770 = float(_1724);
    out.m_74.x = _1750;
    out.m_74.y = _1742;
    bool _1772 = !_1716;
    int _1774 = _1772 ? 0 : 1;
    bool _1776 = !_1720;
    int _1778 = _1776 ? 0 : 1;
    out.m_76.x = _1756;
    out.m_76.y = _1758;
    out.m_76.z = _1760;
    bool _1780 = !_1712;
    int _1782 = _1780 ? 0 : 1;
    if (_1702)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6684 = as_type<float>(_1768);
        out.gl_Position.z = _6684;
    }
    float _1784 = _1532 * _1752;
    float _1786 = _1546 * _1752;
    out.m_78.x = _1770;
    float _1788 = _1786;
    if (_1702)
    {
        out.m_59.x = 0.0;
    }
    if (_1702)
    {
        return out;
    }
    float _1790 = -_1784;
    float _1792 = fma(_1790, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1424);
    float _1794 = _1592 * _1752;
    float _1796 = -_1786;
    float _1798 = fma(_1796, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1440);
    float _1800 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1802 = _1792 + _1800;
    float _1804 = -_1794;
    float _1806 = fma(_1804, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1584);
    float _1808 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1810 = _1798 + _1808;
    float _1812 = _1802 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1814 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1816 = _1806 + _1814;
    float _1818 = fma(_1810, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1812);
    float _1820 = fma(_1816, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1818);
    bool _1822 = _1820 >= 0.0;
    float _1824 = _1802;
    float _1826 = _1792;
    float _1828 = _1806;
    if (_1822)
    {
        _1764 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1830 = _1764;
    int _1832 = as_type<int>(_1830);
    if (_1822)
    {
        out.m_59.x = 0.0;
    }
    if (_1822)
    {
        float _1834 = _1830 * 5.0;
        _1832 = as_type<int>(_1834);
    }
    int _1836 = _1832;
    if (_1822)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6790 = as_type<float>(_1836);
        out.gl_Position.z = _6790;
    }
    if (_1822)
    {
        return out;
    }
    float _1838 = fma(_1798, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1840 = fma(_1806, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1842 = floor(_1838);
    float _1844 = floor(_1840);
    float _1846 = -_1842;
    float _1848 = _1838 + _1846;
    float _1850 = -_1844;
    float _1852 = _1840 + _1850;
    float2 _6826 = float2(_1848, _1852);
    float _1854 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6826, float2(0.0), isnan(_6826)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6826, float2(0.0), isnan(_6826)), level(0.0)).x;
    float _1856 = in.m_63.z;
    float _1858 = _167 * 2.0;
    float _1860 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1862 = log2(_1860);
    float _1864 = _167 + _1188;
    float _1866 = _1188 * 2.0;
    float _1868 = _1864 + (-1.0);
    int _1870 = abs(_1774);
    float _1872 = -_1784;
    float _1874 = fma(_1872, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1532);
    float _1876 = floor(_1858);
    int _1878 = abs(_1782);
    float _1880 = -_1786;
    float _1882 = fma(_1880, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1546);
    float _1884 = float(_1870);
    float _1886 = _1874 * _1874;
    float _1888 = float(_1878);
    float _1890 = -_1794;
    float _1892 = fma(_1890, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1592);
    float _1894 = _347 * _909;
    float _1896 = _1862 * _145;
    float _1898 = floor(_1866);
    float _1900 = fma(_1882, _1882, _1886);
    float _1902 = _343 * _911;
    float _1904 = _1856 * 2.0;
    float _1906 = _1188 + _1856;
    bool _1908 = _1876 > 0.0;
    float _1910 = exp2(_1896);
    bool _1912 = _1876 >= 0.0;
    bool _1914 = isnan(_1876);
    bool _1916 = _1912 || _1914;
    bool _1918 = isnan(0.0);
    bool _1920 = _1916 || _1918;
    float _1922 = _1906 + (-1.0);
    float _1924 = _1188 + (-0.5);
    float _1926 = fma(_1892, _1892, _1900);
    float _1928 = floor(_1904);
    float _1930 = fma(_1922, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1932 = _1920 ? 0 : 1;
    float _1934 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    int _1936 = ~_1932;
    int _1938 = _1936 + 1;
    int _1940 = _1938 + 1;
    float _1942 = fma(_1868, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1944 = _1940;
    int _1946 = 2;
    if (!_1908)
    {
        int _1948 = ~_1932;
        int _1950 = _1948 + 1;
        _1944 = _1950;
    }
    int _1952 = _1944;
    float _1954 = in.m_80.x;
    float _1956 = in.m_80.y;
    float _1958 = in.m_80.z;
    float _1960 = -_1910;
    float _1962 = _1960 + 1.0;
    bool _1964 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1966 = isnan(0.0);
    bool _1968 = _1964 || _1966;
    bool _1970 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1972 = _1968 || _1970;
    float _1974 = _1792 + _1934;
    float _1976 = float(_1952);
    bool _1978 = _1928 > 0.0;
    float _1980 = _1974 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    bool _1982 = _1928 >= 0.0;
    bool _1984 = isnan(_1928);
    bool _1986 = _1982 || _1984;
    bool _1988 = isnan(0.0);
    bool _1990 = _1986 || _1988;
    float _1992 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1994 = 1.0 + _1992;
    float _1996 = _1884 * _1976;
    float _1998 = _1972 ? _1962 : 0.0;
    float _2000 = fma(_1798, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1980);
    int _2002 = _1990 ? 0 : 1;
    float _2004 = _1996 * (-2.0);
    float _2006 = 1.0 / _1994;
    bool _2008 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2010 = isnan(1.0);
    bool _2012 = _2008 || _2010;
    bool _2014 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2016 = _2012 || _2014;
    float _2018 = fma(_1806, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2000);
    int _2020 = ~_2002;
    int _2022 = _2020 + 1;
    int _2024 = _2022 + 1;
    int _2026 = _2024;
    if (!_1978)
    {
        int _2028 = ~_2002;
        int _2030 = _2028 + 1;
        _2026 = _2030;
    }
    int _2032 = _2026;
    float _2034 = _2018 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    bool _2036 = _1898 > 0.0;
    bool _2038 = _1898 >= 0.0;
    bool _2040 = isnan(_1898);
    bool _2042 = _2038 || _2040;
    bool _2044 = isnan(0.0);
    bool _2046 = _2042 || _2044;
    float _2048 = fma(_2004, _1956, _1956);
    float _2050 = float(_2032);
    float _2052 = fma(_1930, _2004, _1930);
    int _2054 = abs(_1778);
    float _2056 = fma(_1924, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2048);
    float _2058 = trunc(_2034);
    int _2060 = int(_2058);
    if (_2016)
    {
        float _2062 = _1998 * _2006;
        _149 = _2062;
    }
    float _2064 = _149;
    int _2066 = _2046 ? 0 : 1;
    float _2068 = _1888 * _2050;
    float _2070 = fma(_2052, _2064, _2056);
    int _2072 = ~_2066;
    int _2074 = _2072 + 1;
    int _2076 = _2074 + 1;
    float _2078 = _2068 * (-2.0);
    int _2080 = _2076;
    if (!_2036)
    {
        int _2082 = ~_2066;
        int _2084 = _2082 + 1;
        _2080 = _2084;
    }
    int _2086 = _2080;
    float _2088 = _2070 * 0.15915493667125701904296875;
    float _2090 = float(_2054);
    float _2092 = fma(_1942, _2078, _1942);
    float _2094 = float(_2086);
    float _2096 = fma(_2078, _1954, _1954);
    float _2098 = _167 + (-0.5);
    float _2100 = _167 + _1856;
    float _2102 = _1856 + (-0.5);
    float _2104 = _2090 * _2094;
    float _2106 = fma(_2098, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2096);
    float _2108 = _2100 + (-1.0);
    float _2110 = _2104 * (-2.0);
    float _2112 = fma(_2092, _2064, _2106);
    float _2114 = _2088 * 6.283185482025146484375;
    float _2116 = sin(_2114);
    float _2118 = fma(_2108, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2120 = fma(_2110, _1958, _1958);
    float _2122 = _2112 * 0.15915493667125701904296875;
    int _2124 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2126 = _2060 + _2124;
    int _2128 = _2126 + 1;
    float _2130 = fma(_2118, _2110, _2118);
    float _2132 = fma(_2102, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2120);
    float _2134 = _2088 * 6.283185482025146484375;
    float _2136 = cos(_2134);
    float _2138 = fma(_2130, _2064, _2132);
    float _2140 = _2138 * 0.15915493667125701904296875;
    float _2142 = _1792 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2144 = _2122 * 6.283185482025146484375;
    float _2146 = sin(_2144);
    float _2148 = fma(_1798, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2142);
    float _2150 = fma(_1806, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2148);
    float _2152 = _2122 * 6.283185482025146484375;
    float _2154 = cos(_2152);
    float _2156 = _2150 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2158 = _1792 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2160 = _2140 * 6.283185482025146484375;
    float _2162 = sin(_2160);
    float _2164 = fma(_1798, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2158);
    float _2166 = _2146 * _2136;
    float _2168 = fma(_1806, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2164);
    float _2170 = 1.0 / _2156;
    float _2172 = _2168 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2174 = _2146 * _2116;
    float _2176 = _2154 * _2136;
    float _2178 = _2172 + _2156;
    float _2180 = _2140 * 6.283185482025146484375;
    float _2182 = cos(_2180);
    float _2184 = fma(_2162, _2176, _2174);
    float _2186 = fma(_2162, _2174, _2176);
    float _2188 = _2154 * _2116;
    float _2190 = -_2188;
    float _2192 = fma(_2162, _2166, _2190);
    float _2194 = sqrt(_1926);
    float _2196 = _2178 * _2170;
    float _2198 = _2196 * 0.5;
    float _2200 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _219);
    float _2202 = -_2166;
    float _2204 = fma(_2162, _2188, _2202);
    float _2206 = _2154 * _2182;
    float _2208 = _2136 * _2182;
    float _2210 = _2146 * _2182;
    float _2212 = _2116 * _2182;
    float _2214 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2216 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2214);
    float _2218 = _1752 * _2194;
    float _2220 = _1894 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2222 = 1.0 / _2216;
    float _2224 = _2218 * _2220;
    float _2226 = _1902 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2228 = _2200 * _2224;
    float _2230 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _337);
    float _2232 = _2218 * _2226;
    float _2234 = _2206 * _2228;
    float _2236 = -_2228;
    float _2238 = _2162 * _2236;
    float _2240 = _2230 * _2232;
    float _2242 = _1974 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _2244 = _2210 * _2228;
    float _2246 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2248 = _2222 * _2246;
    float _2250 = fma(_2184, _2240, _2234);
    float _2252 = fma(_1798, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2242);
    float _2254 = _2218 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2256 = _2254 * 0.5;
    float _2258 = fma(_2208, _2240, _2238);
    bool _2260 = _2248 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _2262 = fma(_1806, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2252);
    float _2264 = fma(_2204, _2256, _2250);
    bool _2266 = _2248 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _2268 = fma(_2192, _2240, _2244);
    float _2270 = fma(_2212, _2256, _2258);
    float _2272 = _2264 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2274 = _2264 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2276 = _2262 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _2278 = fma(_2186, _2256, _2268);
    float _2280 = fma(_2270, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2272);
    float _2282 = fma(_2270, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2274);
    float _2284 = trunc(_2276);
    int _2286 = int(_2284);
    bool _2288 = !_2260;
    int _2290 = _2288 ? 0 : 1;
    float _2292 = fma(_2278, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2280);
    float _2294 = fma(_2278, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2282);
    int _2296 = as_type<int>(_2278);
    if (!_2260)
    {
        _1946 = 1;
    }
    int _2298 = _1946;
    float _2300 = _2264 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2302 = _2298;
    int _2304 = as_type<int>(_2300);
    if (!_2266)
    {
        _2302 = _2290;
    }
    int _2306 = _2302;
    float _2308 = _2292 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2310 = _2294 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2312 = fma(_2270, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2300);
    int _2314 = _2306 << 6;
    float _2316 = _1584 + _2308;
    float _2318 = _1440 + _2310;
    float _2320 = fma(_2278, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2312);
    int _2322 = _2314 + 48;
    uint _2324 = uint(int(uint(_2322) >> uint(2)));
    uint _2326 = uint(int(uint(int(_2324)) >> uint(2)));
    int _2328 = int(_2324) & 3;
    float _2330 = (*spvDescriptorSet0.vp_c15)._m0[int(_2326)][_2328];
    int _2332 = int(_2324) + 1;
    uint _2334 = uint(int(uint(_2332) >> uint(2)));
    int _2336 = _2332 & 3;
    float _2338 = (*spvDescriptorSet0.vp_c15)._m0[int(_2334)][_2336];
    float _2340 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2342 = _2316 + _2340;
    int _2344 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2346 = _2286 + _2344;
    int _2348 = _2346 + 1;
    float _2350 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2352 = _2318 + _2350;
    float _2354 = _2342 * _2342;
    int _2356 = _2348 | _2128;
    int _2358 = _2314 + 56;
    uint _2360 = uint(int(uint(_2358) >> uint(2)));
    uint _2362 = uint(int(uint(int(_2360)) >> uint(2)));
    int _2364 = int(_2360) & 3;
    float _2366 = (*spvDescriptorSet0.vp_c15)._m0[int(_2362)][_2364];
    int _2368 = int(_2360) + 1;
    uint _2370 = uint(int(uint(_2368) >> uint(2)));
    int _2372 = _2368 & 3;
    float _2374 = (*spvDescriptorSet0.vp_c15)._m0[int(_2370)][_2372];
    bool _2376 = _2348 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _2378 = fma(_2352, _2352, _2354);
    bool _2380 = _2356 < 0;
    bool _2382 = _2380 || _2376;
    float _2384 = sqrt(_2378);
    int _2386 = _2314 + 64;
    uint _2388 = uint(int(uint(_2386) >> uint(2)));
    uint _2390 = uint(int(uint(int(_2388)) >> uint(2)));
    int _2392 = int(_2388) & 3;
    float _2394 = (*spvDescriptorSet0.vp_c15)._m0[int(_2390)][_2392];
    int _2396 = int(_2388) + 1;
    uint _2398 = uint(int(uint(_2396) >> uint(2)));
    int _2400 = _2396 & 3;
    float _2402 = (*spvDescriptorSet0.vp_c15)._m0[int(_2398)][_2400];
    bool _2404 = _2128 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2406 = _2404 || _2382;
    int _2408 = _2314 + 72;
    uint _2410 = uint(int(uint(_2408) >> uint(2)));
    uint _2412 = uint(int(uint(int(_2410)) >> uint(2)));
    int _2414 = int(_2410) & 3;
    float _2416 = (*spvDescriptorSet0.vp_c15)._m0[int(_2412)][_2414];
    int _2418 = int(_2410) + 1;
    uint _2420 = uint(int(uint(_2418) >> uint(2)));
    int _2422 = _2418 & 3;
    float _2424 = (*spvDescriptorSet0.vp_c15)._m0[int(_2420)][_2422];
    int _2426 = as_type<int>(_2354);
    float _2428 = _2318;
    float _2430 = _2316;
    if (!_2406)
    {
        int _2432 = _2128 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _2434 = _2432 + _2348;
        _2304 = _2434;
    }
    int _2436 = _2304;
    bool _2438 = _2384 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _2440 = _2314 + 96;
    uint _2442 = uint(int(uint(_2440) >> uint(2)));
    uint _2444 = uint(int(uint(int(_2442)) >> uint(2)));
    int _2446 = int(_2442) & 3;
    float _2448 = (*spvDescriptorSet0.vp_c15)._m0[int(_2444)][_2446];
    int _2450 = int(_2442) + 1;
    uint _2452 = uint(int(uint(_2450) >> uint(2)));
    int _2454 = _2450 & 3;
    float _2456 = (*spvDescriptorSet0.vp_c15)._m0[int(_2452)][_2454];
    float _2458 = _2320 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2460 = _2384;
    if (!_2406)
    {
        int _2462 = _2436 << 2;
        _2296 = _2462;
    }
    int _2464 = _2296;
    int _2466 = _2464;
    if (!_2406)
    {
        uint _2468 = uint(int(uint(_2436) >> uint(2)));
        _2426 = int(_2468);
    }
    int _2470 = _2426;
    float _2472 = _1424 + _2458;
    float _2474 = as_type<float>(_2470);
    float _2476 = _2472;
    if (!_2406)
    {
        int _2478 = 12 & _2464;
        _2466 = _2478;
    }
    int _2480 = _2466;
    int _2482 = _2314 + 104;
    uint _2484 = uint(int(uint(_2482) >> uint(2)));
    uint _2486 = uint(int(uint(int(_2484)) >> uint(2)));
    int _2488 = int(_2484) & 3;
    float _2490 = (*spvDescriptorSet0.vp_c15)._m0[int(_2486)][_2488];
    int _2492 = int(_2484) + 1;
    uint _2494 = uint(int(uint(_2492) >> uint(2)));
    int _2496 = _2492 & 3;
    float _2498 = (*spvDescriptorSet0.vp_c15)._m0[int(_2494)][_2496];
    float _2500 = as_type<float>(_2480);
    if (!_2406)
    {
        int _2502 = _2470 << 4;
        int _2504 = _2502 + _2480;
        _2474 = as_type<float>(_2504);
    }
    float _2506 = _2474;
    bool _2508 = !_2438;
    if (!_2508)
    {
        float _2510 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2512 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2514 = _2384 + _2512;
        float _2516 = _2472 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2518 = rsqrt(_2378);
        float _2520 = _2514 * _2510;
        float _2522 = _2520 * 0.15915493667125701904296875;
        float _2524 = _2522 * 6.283185482025146484375;
        float _2526 = cos(_2524);
        float _2528 = _2522 * 6.283185482025146484375;
        float _2530 = sin(_2528);
        float _2532 = _2526 + (-1.0);
        float _2534 = fma(_2530, _2516, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2536 = _2532 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2538 = _2518 * _2534;
        float _2540 = fma(_2472, _2526, _2536);
        float _2542 = fma(_2352, _2538, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2544 = fma(_2342, _2538, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2476 = _2540;
        _2428 = _2542;
        _2430 = _2544;
        _2460 = _2532;
        _2500 = _2530;
    }
    float _2546 = _2476;
    float _2548 = _2428;
    float _2550 = _2430;
    float _2552 = _2460;
    float _2554 = _2500;
    float _2556 = -_1424;
    float _2558 = _2556 + _2546;
    int _2560 = _2314 + 80;
    uint _2562 = uint(int(uint(_2560) >> uint(2)));
    uint _2564 = uint(int(uint(int(_2562)) >> uint(2)));
    int _2566 = int(_2562) & 3;
    float _2568 = (*spvDescriptorSet0.vp_c15)._m0[int(_2564)][_2566];
    int _2570 = int(_2562) + 1;
    uint _2572 = uint(int(uint(_2570) >> uint(2)));
    int _2574 = _2570 & 3;
    float _2576 = (*spvDescriptorSet0.vp_c15)._m0[int(_2572)][_2574];
    float _2578 = -_1440;
    float _2580 = _2578 + _2548;
    float _2582 = -_1584;
    float _2584 = _2582 + _2550;
    float _2586 = _2558 * _2558;
    float _2588 = _1974 * _2456;
    float _2590 = _2554;
    float _2592 = _2552;
    float _2594 = _2548;
    float _2596 = _2546;
    float _2598 = _2550;
    if (!_2406)
    {
        float _2600 = floor(_2276);
        _2590 = _2600;
    }
    float _2602 = _2590;
    float _2604 = _1974 * _2402;
    float _2606 = fma(_2580, _2580, _2586);
    int _2608 = _2314 + 88;
    uint _2610 = uint(int(uint(_2608) >> uint(2)));
    uint _2612 = uint(int(uint(int(_2610)) >> uint(2)));
    int _2614 = int(_2610) & 3;
    float _2616 = (*spvDescriptorSet0.vp_c15)._m0[int(_2612)][_2614];
    int _2618 = int(_2610) + 1;
    uint _2620 = uint(int(uint(_2618) >> uint(2)));
    int _2622 = _2618 & 3;
    float _2624 = (*spvDescriptorSet0.vp_c15)._m0[int(_2620)][_2622];
    float _2626 = fma(_1798, _2448, _2588);
    float _2628 = fma(_1798, _2394, _2604);
    float _2630 = fma(_2584, _2584, _2606);
    float _2632 = fma(_1806, _2490, _2626);
    if (!_2406)
    {
        float _2634 = floor(_2034);
        _2592 = _2634;
    }
    float _2636 = _2592;
    bool _2638 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2640 = isnan(0.5);
    bool _2642 = _2638 || _2640;
    bool _2644 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2646 = _2642 || _2644;
    float _2648 = _2506;
    if (!_2406)
    {
        int _2650 = as_type<int>(_2506) + 400;
        uint _2652 = uint(int(uint(_2650) >> uint(2)));
        uint _2654 = uint(int(uint(int(_2652)) >> uint(2)));
        int _2656 = int(_2652) & 3;
        float _2658 = (*spvDescriptorSet0.vp_c15)._m0[int(_2654)][_2656];
        _2648 = _2658;
    }
    float _2660 = _2648;
    float _2662 = _2632 + _2498;
    float _2664 = _1974 * _2338;
    float _2666 = fma(_1806, _2416, _2628);
    float _2668 = sqrt(_2630);
    float _2670 = fma(_1798, _2330, _2664);
    float _2672 = fma(_1806, _2366, _2670);
    float _2674 = 1.0 / _2662;
    bool _2676 = _2668 > 0.0;
    bool _2678 = !_2676;
    float _2680 = _2666;
    float _2682 = _2674;
    if (!_2678)
    {
        float _2684 = _301 * _301;
        float _2686 = rsqrt(_2630);
        float _2688 = fma(_293, _293, _2684);
        float _2690 = fma(_311, _311, _2688);
        float _2692 = sqrt(_2690);
        float _2694 = _2580 * _2686;
        float _2696 = _2558 * _2686;
        float _2698 = _2584 * _2686;
        bool _2700 = _2692 > 0.0;
        bool _2702 = !_2700;
        if (!_2702)
        {
            float _2704 = rsqrt(_2690);
            float _2706 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2708 = _301 * _2704;
            float _2710 = _293 * _2704;
            float _2712 = _2696 * _2708;
            float _2714 = _311 * _2704;
            float _2716 = fma(_2694, _2710, _2712);
            float _2718 = _2706 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2720 = fma(_2698, _2714, _2716);
            float _2722 = _2720 * _2718;
            float _2724 = fma(_293, _2722, _2548);
            float _2726 = fma(_301, _2722, _2546);
            float _2728 = fma(_311, _2722, _2550);
            _2594 = _2724;
            _2596 = _2726;
            _2598 = _2728;
        }
    }
    float _2730 = _2594;
    float _2732 = _2596;
    float _2734 = _2598;
    float _2736 = -_1786;
    float _2738 = fma(_2736, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2730);
    float _2740 = -_1784;
    float _2742 = fma(_2740, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2732);
    float _2744 = -_1794;
    float _2746 = fma(_2744, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2734);
    float _2748 = _2672 + _2374;
    float _2750 = _2666 + _2424;
    float _2752 = _2742;
    float _2754 = _2738;
    float _2756 = _2746;
    if (!_2646)
    {
        float _2758 = _1802 * _1802;
        float _2760 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2762 = -_1424;
        float _2764 = _2762 + _2732;
        float _2766 = -_1440;
        float _2768 = _2766 + _2730;
        float _2770 = fma(_1810, _1810, _2758);
        float _2772 = -_1584;
        float _2774 = _2772 + _2734;
        float _2776 = fma(_1816, _1816, _2770);
        float _2778 = 1.0 / _2218;
        float _2780 = sqrt(_2776);
        float _2782 = _2764 * _2778;
        float _2784 = _2768 * _2778;
        float _2786 = _2774 * _2778;
        bool _2788 = _2780 > (*spvDescriptorSet0.vp_c9)._m0[199].x;
        bool _2790 = isnan(_2780);
        bool _2792 = _2788 || _2790;
        bool _2794 = isnan((*spvDescriptorSet0.vp_c9)._m0[199].x);
        bool _2796 = _2792 || _2794;
        float _2798 = precise::min(_2780, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2800 = _2798 * _2760;
        float _2802 = fma(_2782, _2800, _1792);
        float _2804 = fma(_2784, _2800, _1798);
        float _2806 = _2666;
        float _2808 = _2780;
        float _2810 = _2800;
        float _2812 = _2802;
        float _2814 = _2804;
        _1824 = _2758;
        if (_2796)
        {
            float _2816 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].y;
            _2806 = _2816;
        }
        float _2818 = _2806;
        if (_2796)
        {
            float _2820 = precise::max(_2780, (*spvDescriptorSet0.vp_c9)._m0[199].y);
            _2808 = _2820;
        }
        float _2822 = _2808;
        float _2824 = fma(_2786, _2800, _1806);
        _2756 = _2824;
        _2680 = _2818;
        if (_2796)
        {
            float _2826 = _2822 * _2818;
            _2810 = _2826;
        }
        float _2828 = _2810;
        if (_2796)
        {
            float _2830 = fma(_2782, _2828, _1792);
            _2812 = _2830;
        }
        float _2832 = _2812;
        _2752 = _2832;
        if (_2796)
        {
            float _2834 = fma(_2784, _2828, _1798);
            _2814 = _2834;
        }
        float _2836 = _2814;
        _2754 = _2836;
        if (_2796)
        {
            float _2838 = fma(_2786, _2828, _1806);
            _2756 = _2838;
        }
    }
    float _2840 = _2752;
    float _2842 = _2754;
    float _2844 = _2756;
    float _2846 = _2680;
    float _2848 = _1824;
    float _2850 = _2840 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2852 = _2748 * _2674;
    float _2854 = _2840 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2856 = _2840 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2858 = fma(_2842, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2850);
    float _2860 = _2750 * _2674;
    float _2862 = fma(_2842, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2854);
    bool _2864 = _2852 >= 0.0;
    float _2866 = fma(_2844, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2858);
    float _2868 = fma(_2842, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2856);
    float _2870 = _2840 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2872 = fma(_2844, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2862);
    float _2874 = _2866 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _2876 = _2852 <= 1.0;
    bool _2878 = _2876 && _2864;
    float _2880 = fma(_2844, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2868);
    float _2882 = fma(_2842, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2870);
    float _2884 = _2872 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2886 = _2874 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _2888 = _2860 >= 0.0;
    bool _2890 = _2888 && _2878;
    float _2892 = _2880 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2894 = fma(_2844, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2882);
    float _2896 = fma(_2884, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2886);
    bool _2898 = _2860 <= 1.0;
    bool _2900 = _2898 && _2890;
    float _2902 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2904 = _2892 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2906 = _2894 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2908 = fma(_2892, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2896);
    float _2910 = _2846;
    float _2912 = _2848;
    if (!_2406)
    {
        float _2914 = rint(_2660);
        float _2916 = precise::max(_2914, 0.0);
        uint _2918 = uint(_2916);
        uint _2920 = clamp(_2918, 0u, 65535u);
        _2910 = as_type<float>(_2920);
    }
    float _2922 = _2910;
    float _2924 = -_2904;
    float _2926 = fma(_2924, _2902, 1.0);
    float _2928 = _1974 * _2576;
    float _2930 = fma(_2906, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2908);
    float _2932 = _2874 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2934 = _2874 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2936 = fma(_1798, _2568, _2928);
    float _2938 = _2928;
    float _2940 = _2926;
    float _2942 = _2930;
    if (!_2406)
    {
        float _2944 = -_2636;
        float _2946 = _2034 + _2944;
        _1788 = _2946;
    }
    float _2948 = _1788;
    float _2950 = 1.0 / _2930;
    if (_2900)
    {
        float _2952 = float(_2306);
        _2938 = _2952;
    }
    float _2954 = _2938;
    float _2956 = fma(_2884, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2932);
    float _2958 = fma(_2884, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2934);
    float _2960 = fma(_1806, _2616, _2936);
    float _2962 = fma(_2892, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2956);
    float _2964 = fma(_2892, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2958);
    float _2966 = log2(_2926);
    float _2968 = _2960 + _2624;
    float _2970 = fma(_2906, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2962);
    float _2972 = fma(_2906, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2964);
    float _2974 = _2968 * _2674;
    float _2976 = _2954;
    float _2978 = _2970;
    if (_2900)
    {
        float _2980 = rint(_2954);
        float _2982 = precise::max(_2980, 0.0);
        uint _2984 = uint(_2982);
        uint _2986 = clamp(_2984, 0u, 65535u);
        _2976 = as_type<float>(_2986);
    }
    float _2988 = _2976;
    float _2990 = _2970 * _2950;
    float _2992 = _2972 * _2950;
    if (!_2406)
    {
        float _2994 = -_2602;
        float _2996 = _2276 + _2994;
        _2940 = _2996;
    }
    float _2998 = _2940;
    float _3000 = fma(_2990, 0.5, 0.5);
    float _3002 = fma(_2992, -0.5, 0.5);
    float _3004 = _2966 * 0.693147182464599609375;
    float _3006 = _2948;
    float _3008 = _3000;
    float _3010 = _3002;
    if (!_2406)
    {
        float3 _8651 = float3(_2998, _2948, float(as_type<int>(_2922)));
        float3 _8655 = select(_8651, float3(0.0), isnan(_8651));
        float _3012 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _8655.xy, uint(rint(_8655.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _8655.xy, uint(rint(_8655.z)), level(0.0)).x;
        _3006 = _3012;
    }
    float _3014 = _3006;
    float _3016 = _3004 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3018 = _2860;
    if (_2900)
    {
        float3 _8674 = float3(_2852, _2860, float(as_type<int>(_2988)));
        float3 _8676 = select(_8674, float3(0.0), isnan(_8674));
        float _3020 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _8676.xy, uint(rint(_8676.z)), _2974, level(0.0));
        _3018 = _3020;
    }
    float _3022 = _3018;
    float3 _8686 = float3(_3000, _3002, _3016);
    float _3024 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8686, float3(0.0), isnan(_8686)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8686, float3(0.0), isnan(_8686)), level(0.0)).x;
    float3 _8695 = float3(_3000, _3002, _3016);
    float4 _3027 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8695, float3(0.0), isnan(_8695)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8695, float3(0.0), isnan(_8695)), level(0.0)).xyzw;
    float _3029 = _3027.x;
    float _3031 = _3027.y;
    float _3033 = _3027.z;
    float _3035 = _3027.w;
    bool _3037 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _3039 = isnan(0.5);
    bool _3041 = _3037 || _3039;
    bool _3043 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3045 = _3041 || _3043;
    if (_2406)
    {
        _1826 = 1.0;
    }
    float _3047 = _1826;
    float _3049 = _3047;
    if (_3045)
    {
        _2682 = 1.0;
    }
    float _3051 = _2682;
    float _3053 = _3051;
    if (_3045)
    {
        _2912 = 1.0;
    }
    float _3055 = _2912;
    float _3057 = _3055;
    float _3059 = _3031;
    float _3061 = _3029;
    if (!_3045)
    {
        float _3063 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3065 = _3063 * 0.15915493667125701904296875;
        float _3067 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3069 = _3065 * 6.283185482025146484375;
        float _3071 = cos(_3069);
        float _3073 = _3067 * 0.15915493667125701904296875;
        float _3075 = _3065 * 6.283185482025146484375;
        float _3077 = sin(_3075);
        float _3079 = 1.0 / _3071;
        float _3081 = _3073 * 6.283185482025146484375;
        float _3083 = cos(_3081);
        float _3085 = _3077 * _3079;
        float _3087 = _3073 * 6.283185482025146484375;
        float _3089 = sin(_3087);
        float _3091 = _3083 * _3085;
        float _3093 = 1.0 / _3091;
        float _3095 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3097 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3095;
        float _3099 = 1.0 / _3097;
        float _3101 = _3089 * _3093;
        float _3103 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3105 = fma(_2248, _3101, _3103);
        float _3107 = _3105 * _3099;
        float _3109 = precise::clamp(_3107, 0.0, 1.0);
        _3008 = _3073;
        _3010 = _3099;
        _3057 = _3109;
    }
    float _3111 = _3008;
    float _3113 = _3010;
    float _3115 = _3057;
    float _3117 = _3111;
    float _3119 = _3113;
    if (!_3045)
    {
        float _3121 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3123 = _3121 * 0.15915493667125701904296875;
        float _3125 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3127 = _3123 * 6.283185482025146484375;
        float _3129 = cos(_3127);
        float _3131 = _3125 * 0.15915493667125701904296875;
        float _3133 = _3123 * 6.283185482025146484375;
        float _3135 = sin(_3133);
        float _3137 = 1.0 / _3129;
        float _3139 = _3131 * 6.283185482025146484375;
        float _3141 = cos(_3139);
        float _3143 = _3135 * _3137;
        float _3145 = _3131 * 6.283185482025146484375;
        float _3147 = sin(_3145);
        float _3149 = _3141 * _3143;
        float _3151 = 1.0 / _3149;
        float _3153 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3155 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _3153;
        float _3157 = 1.0 / _3155;
        float _3159 = _3147 * _3151;
        float _3161 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3163 = fma(_2248, _3159, _3161);
        float _3165 = _3163 * _3157;
        float _3167 = precise::clamp(_3165, 0.0, 1.0);
        float _3169 = -_3167;
        float _3171 = _3169 + 1.0;
        _3117 = _3137;
        _3053 = _3171;
    }
    float _3173 = _3117;
    float _3175 = _3053;
    float _3177 = _3173;
    if (!_2406)
    {
        int _3179 = _2436 << 4;
        int _3181 = _3179 + 2048;
        uint _3183 = uint(int(uint(_3181) >> uint(2)));
        uint _3185 = uint(int(uint(int(_3183)) >> uint(2)));
        int _3187 = int(_3183) & 3;
        float _3189 = (*spvDescriptorSet0.vp_c15)._m0[int(_3185)][_3187];
        int _3191 = int(_3183) + 1;
        uint _3193 = uint(int(uint(_3191) >> uint(2)));
        int _3195 = _3191 & 3;
        float _3197 = (*spvDescriptorSet0.vp_c15)._m0[int(_3193)][_3195];
        int _3199 = _3181 + 8;
        uint _3201 = uint(int(uint(_3199) >> uint(2)));
        uint _3203 = uint(int(uint(int(_3201)) >> uint(2)));
        int _3205 = int(_3201) & 3;
        float _3207 = (*spvDescriptorSet0.vp_c15)._m0[int(_3203)][_3205];
        int _3209 = int(_3201) + 1;
        uint _3211 = uint(int(uint(_3209) >> uint(2)));
        int _3213 = _3209 & 3;
        float _3215 = (*spvDescriptorSet0.vp_c15)._m0[int(_3211)][_3213];
        float _3217 = _1974 * _3197;
        float _3219 = fma(_1798, _3189, _3217);
        float _3221 = fma(_1806, _3207, _3219);
        float _3223 = _3221 + _3215;
        float _3225 = precise::clamp(_3223, 0.0, 1.0);
        float _3227 = -_3225;
        float _3229 = _3227 + _3014;
        float _3231 = fma(_3229, 500.0, 1.5);
        float _3233 = exp2(_3231);
        float _3235 = 0.0 + _3233;
        float _3237 = precise::clamp(_3235, 0.0, 1.0);
        _3049 = _3237;
    }
    float _3239 = _3049;
    float _3241 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3243 = _2840 + _3241;
    float _3245 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3247 = _2842 + _3245;
    float _3249 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3251 = _2844 + _3249;
    float _3253 = _3243 * _3243;
    float _3255 = fma(_3247, _3247, _3253);
    float _3257 = fma(_3251, _3251, _3255);
    float _3259 = rsqrt(_3257);
    float _3261 = _3259 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3263 = _3247 * _3261;
    float _3265 = _3251 * _3261;
    float _3267 = _3263 * _3263;
    float _3269 = _3265 * _3265;
    float _3271 = _3267 + _3269;
    float _3273 = sqrt(_3271);
    bool _3275 = _3273 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3277 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3279 = _3273 + _3277;
    float _3281 = _3259;
    float _3283 = _3279;
    float _3285 = _3261;
    if (_3275)
    {
        float _3287 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3281 = _3287;
    }
    float _3289 = _3281;
    if (_3275)
    {
        float _3291 = rsqrt(_3271);
        _1828 = _3291;
    }
    float _3293 = _1828;
    float _3295 = _3293;
    if (_3275)
    {
        float _3297 = _3279 * _3289;
        _3283 = _3297;
    }
    float _3299 = _3283;
    if (_3275)
    {
        float _3301 = _3299 * 0.15915493667125701904296875;
        _3119 = _3301;
    }
    float _3303 = _3119;
    float _3305 = _3289;
    if (_3275)
    {
        float _3307 = _3303 * 6.283185482025146484375;
        float _3309 = sin(_3307);
        _3305 = _3309;
    }
    float _3311 = _3305;
    float _3313 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3315 = precise::max(0.0, _3313);
    float _3317 = _3251;
    float _3319 = _3315;
    if (_3275)
    {
        float _3321 = _3303 * 6.283185482025146484375;
        float _3323 = cos(_3321);
        _3317 = _3323;
    }
    float _3325 = _3317;
    float _3327 = -_3261;
    float _3329 = -_3315;
    float _3331 = fma(_3243, _3327, _3329);
    float _3333 = _3331;
    if (_3275)
    {
        float _3335 = _3331 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3319 = _3335;
    }
    float _3337 = _3319;
    float _3339 = _3311;
    float _3341 = _3337;
    if (_3275)
    {
        float _3343 = fma(_3311, _3337, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3177 = _3343;
    }
    float _3345 = _3177;
    float _3347 = _3345;
    if (!_3275)
    {
        _3339 = _3263;
    }
    float _3349 = _3339;
    float _3351 = _3349;
    if (_3275)
    {
        float _3353 = _3325 + (-1.0);
        _3341 = _3353;
    }
    float _3355 = _3341;
    float _3357 = _3355;
    if (_3275)
    {
        float _3359 = _3293 * _3345;
        _3285 = _3359;
    }
    float _3361 = _3285;
    if (!_3275)
    {
        _3347 = _3267;
    }
    float _3363 = _3347;
    float _3365 = _3363;
    if (_3275)
    {
        float _3367 = _3355 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3295 = _3367;
    }
    float _3369 = _3295;
    float _3371 = _3369;
    if (_3275)
    {
        float _3373 = _3263 * _3361;
        _3351 = _3373;
    }
    float _3375 = _3351;
    if (!_3275)
    {
        _3357 = _3265;
    }
    float _3377 = _3357;
    float _3379 = _3377;
    if (_3275)
    {
        float _3381 = _3265 * _3361;
        _3379 = _3381;
    }
    float _3383 = _3379;
    if (_3275)
    {
        float _3385 = fma(_3331, _3325, _3369);
        _3333 = _3385;
    }
    float _3387 = _3333;
    if (_3275)
    {
        float _3389 = _3375 * _3375;
        _3365 = _3389;
    }
    float _3391 = _3365;
    float _3393 = sqrt(_3257);
    if (!_3275)
    {
        _3371 = _3269;
    }
    float _3395 = _3371;
    float _3397 = _3395;
    if (_3275)
    {
        float _3399 = _3383 * _3383;
        _3397 = _3399;
    }
    float _3401 = _3397;
    float _3403 = fma(_3387, _3387, _3391);
    float _3405 = _3403 + _3401;
    float _3407 = rsqrt(_3405);
    float _3409 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3411 = fma(_3393, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3409);
    float _3413 = precise::clamp(_3411, 0.0, 1.0);
    float _3415 = -_3413;
    float _3417 = _3415 + 1.0;
    float _3419 = abs(_3417);
    float _3421 = log2(_3419);
    float _3423 = _3407 * _3375;
    float _3425 = _3407 * _3387;
    float _3427 = _3407 * _3383;
    float _3429 = _3423 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3431 = -_3429;
    float _3433 = fma(_3425, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3431);
    float _3435 = -_3427;
    float _3437 = fma(_3435, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3433);
    float _3439 = _3421 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3441 = fma(_3437, -0.5, 0.5);
    float _3443 = fma(_3437, 0.5, 0.5);
    float _3445 = _3425 + 1.0;
    float _3447 = exp2(_3439);
    float _3449 = fma(_3443, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3451 = fma(_3443, _3449, -0.212114393711090087890625);
    float _3453 = sqrt(_3441);
    float _3455 = fma(_3443, _3451, 1.570728778839111328125);
    float _3457 = -_3425;
    float _3459 = fma(_3447, _3445, _3457);
    float _3461 = fma(_3459, 0.5, 0.5);
    float _3463 = _3453 * 0.636619746685028076171875;
    float _3465 = -_3455;
    float _3467 = fma(_3463, _3465, 1.0);
    float2 _9337 = float2(_3467, _3461);
    float3 _3471 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9337, float2(0.0), isnan(_9337)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9337, float2(0.0), isnan(_9337)), level(0.0)).xyz;
    float _3473 = _3471.x;
    float _3475 = _3471.y;
    float _3477 = _3471.z;
    float _3479 = abs(_2248);
    float _3481 = log2(_3479);
    float _3483 = _2184 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3485 = _2184 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3487 = _2184 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3489 = _219 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3491 = fma(_2208, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3483);
    float _3493 = fma(_2208, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3485);
    float _3495 = _2206 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3497 = _2206 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3499 = _2206 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3501 = fma(_2208, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3487);
    float _3503 = -_2162;
    float _3505 = fma(_3503, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3495);
    float _3507 = -_2162;
    float _3509 = fma(_3507, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3497);
    float _3511 = -_2162;
    float _3513 = fma(_3511, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3499);
    float _3515 = _2204 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3517 = fma(_2192, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3491);
    float _3519 = _3481 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3521 = _2874 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3523 = fma(_2210, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3505);
    float _3525 = fma(_2212, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3515);
    float _3527 = fma(_2210, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3509);
    float _3529 = fma(_2884, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3521);
    float _3531 = exp2(_3519);
    float _3533 = fma(_2210, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3513);
    float _3535 = _2204 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3537 = _2204 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3539 = _337 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3541 = _3489 * _3523;
    float _3543 = fma(_2192, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3493);
    float _3545 = fma(_2892, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3529);
    float _3547 = _3489 * _3527;
    float _3549 = _3489 * _3533;
    float _3551 = fma(_2212, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3535);
    float _3553 = fma(_2212, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3537);
    float _3555 = fma(_3539, _3517, _3541);
    float _3557 = _2930 * 0.5;
    float _3559 = fma(_2186, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3525);
    float _3561 = fma(_2186, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3551);
    float _3563 = fma(_2186, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3553);
    float _3565 = fma(_2972, -0.5, _3557);
    float _3567 = fma(_3539, _3543, _3547);
    float _3569 = fma(_3531, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3571 = precise::clamp(_3569, 0.0, 1.0);
    float _3573 = _3421 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3575 = _3561 + _3567;
    float _3577 = fma(_2906, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3545);
    float _3579 = fma(_3571, -2.0, 3.0);
    float _3581 = _3571 * _3571;
    bool _3583 = _2248 <= 8000.0;
    bool _3585 = isnan(_2248);
    bool _3587 = _3583 || _3585;
    bool _3589 = isnan(8000.0);
    bool _3591 = _3587 || _3589;
    float _3593 = float(_3591);
    float _3595 = exp2(_3573);
    out.gl_Position.x = _2970;
    out.gl_Position.y = _2972;
    out.gl_Position.z = _3577;
    out.gl_Position.w = _2930;
    float _3597 = _3581 * _3579;
    float _3599 = _3577 + _2930;
    float _3601 = -_1854;
    float _3603 = _3601 + 1.0;
    float _3605 = _2970 + _2930;
    float _3607 = fma(_2192, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3501);
    float _3609 = _3599 * 0.5;
    float _3611 = _3605 * 0.5;
    float _3613 = fma(_3539, _3607, _3549);
    float _3615 = _3559 + _3555;
    bool _3617 = _3393 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3619 = isnan(_3393);
    bool _3621 = _3617 || _3619;
    bool _3623 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3625 = _3621 || _3623;
    float _3627 = _3563 + _3613;
    float _3629 = -_3597;
    float _3631 = _3629 + 1.0;
    float _3633 = -_3595;
    float _3635 = _3633 + 1.0;
    if (!_2900)
    {
        _2978 = 1.0;
    }
    float _3637 = _2978;
    out.m_82.x = _3611;
    out.m_82.y = _3565;
    out.m_82.z = _3609;
    out.m_82.w = _2930;
    float _3639 = fma(_3631, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3597);
    float _3641 = _3637;
    if (_2900)
    {
        bool _3643 = _3022 >= _2974;
        bool _3645 = isnan(_3022);
        bool _3647 = _3643 || _3645;
        bool _3649 = isnan(_2974);
        bool _3651 = _3647 || _3649;
        float _3653 = float(_3651);
        _3641 = _3653;
    }
    float _3655 = _3641;
    float _3657 = _3635 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_84.x = _3615;
    out.m_84.y = _3575;
    out.m_84.z = _3627;
    float _3659 = _3593 * _3639;
    float _3661 = _3657 * _3024;
    float _3663 = _3655 * _3239;
    float _3665 = _3659 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3667 = -_3657;
    float _3669 = _3667 + 1.0;
    float _3671 = _3035 * _3661;
    float _3673 = _3669;
    if (!_3625)
    {
        _2942 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3675 = _2942;
    float _3677 = _3603 * _3665;
    float _3679 = precise::clamp(_3677, 0.0, 1.0);
    float _3681 = _3035 * _3669;
    float _3683 = _3675;
    float _3685 = _3675;
    if (!_3625)
    {
        _3673 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3687 = _3673;
    float _3689 = -_3679;
    float _3691 = fma(_3689, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3693 = -_3663;
    float _3695 = fma(_3693, _3691, 1.0);
    float _3697 = precise::clamp(_3695, 0.0, 1.0);
    float _3699 = _3691;
    float _3701 = _3687;
    float _3703 = _3687;
    if (!_3625)
    {
        _3699 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3705 = _3699;
    float _3707 = _3477 * _3661;
    float _3709 = fma(_3473, _3671, _3029);
    float _3711 = fma(_3475, _3671, _3031);
    float _3713 = _3697 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3715 = fma(_3035, _3707, _3033);
    float _3717 = _3115 * _3175;
    float _3719 = _3717;
    float _3721 = _3705;
    float _3723 = _3705;
    if (!_3625)
    {
        _3059 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3725 = _3059;
    out.m_86.x = _3713;
    float _3727 = _3717 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3729 = _3725;
    float _3731 = _3725;
    if (!_3625)
    {
        _3061 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3733 = _3061;
    out.m_88.x = _3709;
    out.m_88.y = _3711;
    out.m_88.z = _3715;
    out.m_88.w = _3681;
    float _3735 = _3733;
    float _3737 = _3733;
    if (!_3625)
    {
        _3719 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3739 = _3719;
    bool _3741 = !_3625;
    float _3743 = _3739;
    float _3745 = _3739;
    if (!_3741)
    {
        bool _3747 = _3393 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3749 = isnan(_3393);
        bool _3751 = _3747 || _3749;
        bool _3753 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3755 = _3751 || _3753;
        if (!_3755)
        {
            float _3757 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3759 = _3393 + _3757;
            float _3761 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3763 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3761;
            float _3765 = 1.0 / _3763;
            float _3767 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3769 = _3767 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3771 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3773 = _3771 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3775 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3777 = _3775 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3779 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3781 = _3779 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3783 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3785 = _3783 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3787 = _3759 * _3765;
            float _3789 = precise::clamp(_3787, 0.0, 1.0);
            float _3791 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3793 = _3791 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3795 = fma(_3789, _3769, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3797 = fma(_3789, _3793, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3799 = fma(_3789, _3773, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3801 = fma(_3789, _3777, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3803 = fma(_3789, _3781, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3805 = fma(_3789, _3785, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3737 = _3797;
            _3723 = _3803;
            _3731 = _3795;
            _3703 = _3801;
            _3685 = _3799;
            _3745 = _3805;
            _3807 = true;
        }
        else
        {
            bool _3809 = _3393 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3811 = isnan(_3393);
            bool _3813 = _3809 || _3811;
            bool _3815 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3817 = _3813 || _3815;
            if (!_3817)
            {
                _3729 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3819 = _3729;
            _3731 = _3819;
            if (!_3817)
            {
                _3735 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3821 = _3735;
            _3737 = _3821;
            if (!_3817)
            {
                _3683 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3823 = _3683;
            _3685 = _3823;
            if (!_3817)
            {
                _3701 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3825 = _3701;
            _3703 = _3825;
            if (!_3817)
            {
                _3721 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3827 = _3721;
            _3723 = _3827;
            if (!_3817)
            {
                _3743 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3829 = _3743;
            bool _3831 = !_3817;
            _3745 = _3829;
            if (!_3831)
            {
                bool _3833 = _3393 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3835 = isnan(_3393);
                bool _3837 = _3833 || _3835;
                bool _3839 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3841 = _3837 || _3839;
                if (!_3841)
                {
                    float _3843 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3845 = _3393 + _3843;
                    float _3847 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3849 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3847;
                    float _3851 = 1.0 / _3849;
                    float _3853 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3855 = _3853 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3857 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3859 = _3857 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3861 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3863 = _3861 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3865 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3867 = _3865 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3869 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3871 = _3869 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3873 = _3845 * _3851;
                    float _3875 = precise::clamp(_3873, 0.0, 1.0);
                    float _3877 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3879 = _3877 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3881 = fma(_3875, _3855, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3883 = fma(_3875, _3879, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3885 = fma(_3875, _3859, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3887 = fma(_3875, _3863, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3889 = fma(_3875, _3867, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3891 = fma(_3875, _3871, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3737 = _3883;
                    _3723 = _3889;
                    _3731 = _3881;
                    _3703 = _3887;
                    _3685 = _3885;
                    _3745 = _3891;
                    _3807 = true;
                }
                else
                {
                    _3737 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3723 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3731 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3703 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3685 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3745 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3807 = false;
    float _3893 = _3737;
    float _3895 = _3723;
    float _3897 = _3731;
    float _3899 = _3703;
    float _3901 = _3685;
    float _3903 = _3745;
    float _3905 = fma(_3575, -0.5, 0.5);
    float _3907 = precise::clamp(_3905, 0.0, 1.0);
    float _3909 = -_3893;
    float _3911 = _3909 + _3895;
    float _3913 = -_3897;
    float _3915 = _3913 + _3899;
    out.m_90.x = 0.0;
    float _3917 = fma(_3907, _3911, _3893);
    float _3919 = -_3901;
    float _3921 = _3919 + _3903;
    float _3923 = fma(_3907, _3915, _3897);
    float _3925 = _3917 * 0.586610972881317138671875;
    bool _3927 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3929 = fma(_3907, _3921, _3901);
    float _3931 = _3727 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3933 = fma(_3923, 0.298911988735198974609375, _3925);
    bool _3935 = _3115 > 0.0;
    bool _3937 = isnan(_3115);
    bool _3939 = _3935 || _3937;
    bool _3941 = isnan(0.0);
    bool _3943 = _3939 || _3941;
    float _3945 = fma(_3929, 0.114477999508380889892578125, _3933);
    out.m_59.x = _3931;
    bool _3947 = _3175 <= 0.0;
    bool _3949 = !_3943;
    bool _3951 = _3947 || _3949;
    float _3953 = -_3945;
    float _3955 = _3923 + _3953;
    float _3957 = -_3945;
    float _3959 = _3917 + _3957;
    float _3961 = -_3945;
    float _3963 = _3929 + _3961;
    float _3965 = fma(_3955, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3945);
    float _3967 = fma(_3959, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3945);
    float _3969 = fma(_3963, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3945);
    bool _3971 = !_3927;
    if (!_3971)
    {
        float _3973 = -_2840;
        float _3975 = _3973 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3977 = -_2842;
        float _3979 = _3977 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3981 = -_2844;
        float _3983 = _3981 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3985 = _3975 * _3975;
        float _3987 = fma(_3979, _3979, _3985);
        float _3989 = fma(_3983, _3983, _3987);
        float _3991 = sqrt(_3989);
        float _3993 = rsqrt(_3989);
        float _3995 = -_3991;
        float _3997 = _3995 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3999 = _3997 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4001 = precise::clamp(_3999, 0.0, 1.0);
        float _4003 = _3979 * _3993;
        float _4005 = _3975 * _3993;
        float _4007 = abs(_4001);
        float _4009 = log2(_4007);
        float _4011 = _3983 * _3993;
        float _4013 = _4003 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4015 = _3575 * _4005;
        float _4017 = -_4005;
        float _4019 = -_4013;
        float _4021 = fma(_4017, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4019);
        float _4023 = fma(_3615, _4003, _4015);
        float _4025 = -_4011;
        float _4027 = fma(_4025, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4021);
        float _4029 = fma(_3627, _4011, _4023);
        float _4031 = precise::clamp(_4029, 0.0, 1.0);
        float _4033 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4035 = _4027 + _4033;
        float _4037 = _4009 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4039 = _4035 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4041 = precise::clamp(_4039, 0.0, 1.0);
        float _4043 = exp2(_4037);
        float _4045 = _4043 * _4041;
        float _4047 = _4031 * _4045;
        float _4049 = _4047 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4051 = _4047 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4053 = _4047 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_90.x = _4049;
        out.m_90.y = _4051;
        out.m_90.z = _4053;
    }
    out.m_92.x = _3965;
    out.m_92.y = _3967;
    out.m_92.z = _3969;
    if (!_3951)
    {
        return out;
    }
    float _4055 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_59.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4055;
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
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3807 = false;
    bool _935 = false;
    bool _743 = false;
    bool _367 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _106 = in.m_56.w;
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
        out.m_59.x = 0.0;
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
        float _4112 = as_type<float>(_127);
        out.gl_Position.z = _4112;
    }
    if (!_115)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _131 = in.m_61.w;
    bool _133 = _131 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _135 = isnan(_131);
    bool _137 = _133 || _135;
    bool _139 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _141 = _137 || _139;
    float _143 = -_131;
    float _145 = _143 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _147 = 0.0;
    float _149 = _145;
    if (_141)
    {
        float _151 = float(_111);
        _147 = _151;
    }
    float _153 = _147;
    bool _155 = _145 >= _153;
    bool _157 = !_141;
    bool _159 = _155 || _157;
    if (_159)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _121;
    if (_159)
    {
        out.m_59.x = 0.0;
    }
    if (_159)
    {
        float _163 = _161 * 5.0;
        _129 = as_type<int>(_163);
    }
    int _165 = _129;
    if (_159)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4181 = as_type<float>(_165);
        out.gl_Position.z = _4181;
    }
    if (_159)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _167 = in.m_63.x;
    float _169 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _171 = _145 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _173 = as_type<float>(int(gl_VertexIndex));
    float _175 = in.m_68.x;
    float _177 = in.m_68.y;
    float _179 = in.m_68.z;
    float _181 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].w;
    float _183 = _171 * _169;
    float _185 = _145 + (*spvDescriptorSet0.vp_c9)._m0[20].w;
    float _187 = fma(_167, (*spvDescriptorSet0.vp_c9)._m0[20].x, _183);
    float _189 = _185 * _181;
    float _191 = floor(_187);
    float _193 = fma(_167, (*spvDescriptorSet0.vp_c9)._m0[20].y, _189);
    float _195 = _187 * 6.283185482025146484375;
    int _197 = as_type<int>(_173) & 1;
    bool _199 = _197 != 0;
    int _201 = as_type<int>(_173) & 2;
    bool _203 = _201 != 0;
    float _205 = _177 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _207 = _193 * 6.283185482025146484375;
    float _209 = _195 * 0.15915493667125701904296875;
    int _211 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _213 = _211 != 0;
    float _215 = floor(_193);
    bool _217 = !_203;
    float _219 = _217 ? (-0.5) : 0.5;
    float _221 = _177 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _223 = !_213;
    int _225 = _223 ? 0 : 1;
    float _227 = _177 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _229 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _231 = _229 != 0;
    int _233 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _235 = _233 != 0;
    float _237 = fma(_175, (*spvDescriptorSet0.vp_c10)._m0[4].x, _221);
    int _239 = abs(_225);
    float _241 = -_191;
    float _243 = _187 + _241;
    float _245 = _207 * 0.15915493667125701904296875;
    float _247 = _209 * 6.283185482025146484375;
    float _249 = cos(_247);
    bool _251 = !_231;
    int _253 = _251 ? 0 : 1;
    float _255 = fma(_175, (*spvDescriptorSet0.vp_c10)._m0[5].x, _205);
    bool _257 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _259 = fma(_175, (*spvDescriptorSet0.vp_c10)._m0[6].x, _227);
    int _261 = abs(_253);
    float _263 = -_215;
    float _265 = _193 + _263;
    bool _267 = _243 < 0.5;
    float _269 = float(_267);
    float _271 = _245 * 6.283185482025146484375;
    float _273 = cos(_271);
    float _275 = -_243;
    float _277 = fma(_275, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _279 = !_235;
    int _281 = _279 ? 0 : 1;
    float _283 = -_265;
    float _285 = fma(_283, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _287 = -_269;
    float _289 = fma(_287, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _291 = float(_239);
    float _293 = fma(_179, (*spvDescriptorSet0.vp_c10)._m0[4].z, _237);
    int _295 = abs(_281);
    float _297 = fma(_249, 0.5, 0.5);
    float _299 = float(_261);
    float _301 = fma(_179, (*spvDescriptorSet0.vp_c10)._m0[5].z, _255);
    bool _303 = _265 < 0.5;
    float _305 = float(_303);
    float _307 = -_297;
    float _309 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _311 = fma(_179, (*spvDescriptorSet0.vp_c10)._m0[6].z, _259);
    float _313 = abs(_277);
    float _315 = _299 * _313;
    float _317 = abs(_285);
    float _319 = _299 * _317;
    float _321 = fma(_273, 0.5, 0.5);
    float _323 = -_305;
    float _325 = fma(_323, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _327 = fma(_291, _309, _315);
    float _329 = float(_295);
    float _331 = -_321;
    float _333 = fma(_331, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    bool _335 = !_199;
    float _337 = _335 ? (-0.5) : 0.5;
    float _339 = fma(_291, _333, _319);
    float _341 = abs(_289);
    float _343 = fma(_329, _341, _327);
    float _345 = abs(_325);
    float _347 = fma(_329, _345, _339);
    bool _349 = !_257;
    float _365;
    if (!_349)
    {
        float _351 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _353 = _167 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _355 = fma(_353, (*spvDescriptorSet0.vp_c9)._m0[12].x, _145);
        float _357 = _355 * _351;
        float _359 = floor(_357);
        float _361 = -_359;
        float _363 = _357 + _361;
        _365 = _363;
        _367 = true;
    }
    else
    {
        float _369 = float(_111);
        float _371 = 1.0 / _369;
        float _373 = _145 * _371;
        _365 = _373;
    }
    _367 = false;
    float _375 = _365;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _377;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _383 = _381 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _387 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _385;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _391 = _389 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _393 = 1.0 / _379;
    float _395 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _397 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _395;
    float _399 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _401 = _399 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _403 = 1.0 / _383;
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _407 = _375 + _405;
    bool _409 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _411 = isnan(_375);
    bool _413 = _409 || _411;
    bool _415 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _417 = _413 || _415;
    float _419 = float(_417);
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _423 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _421;
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _427 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _425;
    float _429 = 1.0 / _387;
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _433 = _375 + _431;
    float _435 = _407 * _393;
    bool _437 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[150].w;
    bool _439 = isnan(_375);
    bool _441 = _437 || _439;
    bool _443 = isnan((*spvDescriptorSet0.vp_c9)._m0[150].w);
    bool _445 = _441 || _443;
    float _447 = float(_445);
    bool _449 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _451 = isnan(_375);
    bool _453 = _449 || _451;
    bool _455 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _457 = _453 || _455;
    float _459 = float(_457);
    float _461 = fma(_423, _435, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _463 = fma(_427, _435, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _465 = 1.0 / _397;
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _469 = (*spvDescriptorSet0.vp_c9)._m0[150].w + _467;
    float _471 = _433 * _403;
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _475 = _375 + _473;
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _479 = _375 + _477;
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _483 = _375 + _481;
    bool _485 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _487 = 1.0 / _391;
    float _489 = _475 * _429;
    float _491 = -_447;
    float _493 = _491 + 1.0;
    float _495 = _459 * _493;
    float _497 = -_459;
    float _499 = _497 + 1.0;
    float _501 = 1.0 / _401;
    float _503 = _479 * _465;
    bool _505 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _507 = isnan(_375);
    bool _509 = _505 || _507;
    bool _511 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _513 = _509 || _511;
    float _515 = float(_513);
    bool _517 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _519 = isnan(_375);
    bool _521 = _517 || _519;
    bool _523 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _525 = _521 || _523;
    float _527 = float(_525);
    float _529 = 1.0 / _469;
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _533 = _375 + _531;
    float _535 = _483 * _487;
    float _537 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _539 = _375 + _537;
    float _541 = _533 * _501;
    float _543 = -_515;
    float _545 = _543 + 1.0;
    float _547 = _539 * _529;
    float _549 = _515 * _499;
    bool _551 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _553 = isnan(_375);
    bool _555 = _551 || _553;
    bool _557 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _559 = _555 || _557;
    float _561 = float(_559);
    float _563 = _527 * _545;
    float _565 = -_527;
    float _567 = _565 + 1.0;
    bool _569 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _571 = isnan(_375);
    bool _573 = _569 || _571;
    bool _575 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _577 = _573 || _575;
    float _579 = float(_577);
    float _581 = -_561;
    float _583 = _581 + 1.0;
    float _585 = _561 * _567;
    bool _587 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _589 = isnan(_375);
    bool _591 = _587 || _589;
    bool _593 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _595 = _591 || _593;
    float _597 = float(_595);
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _601 = _599 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _603 = _579 * _583;
    float _605 = -_579;
    float _607 = _605 + 1.0;
    float _609 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _611 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _609;
    float _613 = -_597;
    float _615 = _613 + 1.0;
    float _617 = fma(_601, _471, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _619 = _597 * _607;
    float _621 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _623 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _621;
    float _625 = _419 * _615;
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _629 = _627 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _631 = fma(_611, _489, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _633 = fma(_623, _489, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _635 = _461 * _625;
    float _637 = -_419;
    float _639 = _637 + 1.0;
    float _641 = _463 * _625;
    float _643 = fma(_629, _471, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _645 = fma(_639, (*spvDescriptorSet0.vp_c9)._m0[143].x, _635);
    float _647 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _649 = _647 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _653 = _651 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _655 = fma(_639, (*spvDescriptorSet0.vp_c9)._m0[143].y, _641);
    float _657 = fma(_649, _535, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _659 = fma(_653, _535, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _661 = fma(_617, _619, _645);
    float _663 = fma(_643, _619, _655);
    float _665 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _667 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _665;
    float _669 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _671 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _669;
    float _673 = fma(_631, _603, _661);
    float _675 = fma(_633, _603, _663);
    float _677 = fma(_667, _503, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _679 = fma(_671, _503, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _681 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _683 = _681 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _685 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _687 = _685 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _689 = fma(_657, _585, _673);
    float _691 = fma(_659, _585, _675);
    float _693 = fma(_683, _541, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _695 = fma(_687, _541, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _697 = -(*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _699 = (*spvDescriptorSet0.vp_c9)._m0[150].x + _697;
    float _701 = -(*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _703 = (*spvDescriptorSet0.vp_c9)._m0[150].y + _701;
    float _705 = fma(_677, _563, _689);
    float _707 = fma(_679, _563, _691);
    float _709 = fma(_699, _547, (*spvDescriptorSet0.vp_c9)._m0[149].x);
    float _711 = fma(_703, _547, (*spvDescriptorSet0.vp_c9)._m0[149].y);
    float _713 = fma(_693, _549, _705);
    float _715 = fma(_695, _549, _707);
    float _717 = fma(_709, _495, _713);
    float _719 = fma(_711, _495, _715);
    float _721 = fma(_447, (*spvDescriptorSet0.vp_c9)._m0[150].x, _717);
    float _723 = fma(_447, (*spvDescriptorSet0.vp_c9)._m0[150].y, _719);
    bool _725 = !_485;
    float _741;
    if (!_725)
    {
        float _727 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _729 = _167 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _731 = fma(_729, (*spvDescriptorSet0.vp_c9)._m0[11].x, _145);
        float _733 = _731 * _727;
        float _735 = floor(_733);
        float _737 = -_735;
        float _739 = _733 + _737;
        _741 = _739;
        _743 = true;
    }
    else
    {
        float _745 = float(_111);
        float _747 = 1.0 / _745;
        float _749 = _145 * _747;
        _741 = _749;
    }
    _743 = false;
    float _751 = _741;
    float _753 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _755 = _751 + _753;
    bool _757 = _751 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _759 = isnan(_751);
    bool _761 = _757 || _759;
    bool _763 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _765 = _761 || _763;
    float _767 = float(_765);
    float _769 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _771 = _751 + _769;
    bool _773 = _751 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _775 = isnan(_751);
    bool _777 = _773 || _775;
    bool _779 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _781 = _777 || _779;
    float _783 = float(_781);
    float _785 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _787 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _785;
    float _789 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _791 = _789 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _793 = _751 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _795 = isnan(_751);
    bool _797 = _793 || _795;
    bool _799 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _801 = _797 || _799;
    float _803 = float(_801);
    float _805 = 1.0 / _787;
    float _807 = 1.0 / _791;
    float _809 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _811 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _809;
    bool _813 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _815 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _817 = _755 * _805;
    float _819 = -_767;
    float _821 = _819 + 1.0;
    float _823 = -_803;
    float _825 = _823 + 1.0;
    float _827 = fma(_811, _817, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _829 = _803 * _821;
    float _831 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _833 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _831;
    float _835 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _837 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _835;
    float _839 = _783 * _825;
    float _841 = _771 * _807;
    float _843 = fma(_833, _817, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _845 = fma(_837, _817, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _847 = _827 * _839;
    float _849 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _851 = _849 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _853 = _843 * _839;
    float _855 = _845 * _839;
    float _857 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _859 = _857 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _861 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _863 = _861 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _865 = -_783;
    float _867 = _865 + 1.0;
    float _869 = fma(_851, _841, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _871 = fma(_859, _841, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _873 = fma(_863, _841, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _875 = fma(_867, (*spvDescriptorSet0.vp_c9)._m0[107].x, _853);
    float _877 = fma(_867, (*spvDescriptorSet0.vp_c9)._m0[107].y, _847);
    float _879 = fma(_867, (*spvDescriptorSet0.vp_c9)._m0[107].z, _855);
    float _881 = fma(_871, _829, _875);
    float _883 = fma(_869, _829, _877);
    float _885 = fma(_873, _829, _879);
    float _887 = fma(_767, (*spvDescriptorSet0.vp_c9)._m0[109].x, _881);
    float _889 = fma(_767, (*spvDescriptorSet0.vp_c9)._m0[109].y, _883);
    float _891 = fma(_767, (*spvDescriptorSet0.vp_c9)._m0[109].z, _885);
    float _893 = in.m_70.x;
    float _895 = in.m_70.y;
    float _897 = _887 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _899 = _889 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _901 = _891 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _903 = _897 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _905 = _899 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _907 = _901 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_72.x = _903;
    out.m_72.y = _905;
    out.m_72.z = _907;
    out.m_72.w = _815;
    float _909 = _723 * _895;
    float _911 = _721 * _893;
    bool _913 = !_813;
    float _931;
    float _933;
    if (!_913)
    {
        float _915 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _917 = _167 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _919 = float(_111);
        float _921 = fma(_917, (*spvDescriptorSet0.vp_c9)._m0[11].z, _145);
        float _923 = _921 * _915;
        float _925 = floor(_923);
        float _927 = -_925;
        float _929 = _923 + _927;
        _931 = _919;
        _933 = _929;
        _935 = true;
    }
    else
    {
        float _937 = float(_111);
        float _939 = 1.0 / _937;
        float _941 = _145 * _939;
        _931 = _937;
        _933 = _941;
    }
    _935 = false;
    float _943 = _931;
    float _945 = _933;
    float _947 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _949 = int(_947);
    float _951 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _953 = int(_951);
    float _955 = float(_949);
    float _957 = 1.0 / _943;
    float _959 = float(uint(_953));
    float _961 = 1.0 / _955;
    int _963 = ~_953;
    int _965 = _963 + 1;
    int _967 = ~_953;
    int _969 = _967 + 1;
    int _971 = ~_953;
    int _973 = _971 + 1;
    int _975 = ~_953;
    int _977 = _975 + 1;
    float _979 = 1.0 / _959;
    float _981 = _961 * _145;
    float _983 = trunc(_981);
    int _985 = int(_983);
    int _987 = as_type<int>(_979) + (-2);
    int _989 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _991 = _989 != 0;
    float _993 = float(uint(_985));
    bool _995 = !_991;
    float _997 = _995 ? 7.345489978790283203125 : 1.0;
    float _999 = float(_953);
    float _1001 = as_type<float>(_987) * _993;
    float _1003 = _997 * _167;
    float _1005 = trunc(_1001);
    float _1007 = precise::max(_1005, 0.0);
    uint _1010 = uint(_1007);
    float _1012 = float(_985);
    bool _1014 = _1012 >= _999;
    bool _1016 = isnan(_1012);
    bool _1018 = _1014 || _1016;
    bool _1020 = isnan(_999);
    bool _1022 = _1018 || _1020;
    float _1024 = float(_1022);
    int _1026 = _965 * int(_1010);
    int _1028 = _1026 + _985;
    float _1030 = trunc(_1024);
    int _1032 = int(_1030);
    float _1034 = float(uint(_1028));
    float _1036 = as_type<float>(_987) * _1034;
    float _1038 = trunc(_1036);
    float _1040 = precise::max(_1038, 0.0);
    uint _1042 = uint(_1040);
    int _1044 = int(_1010) + int(_1042);
    float _1046 = floor(_1003);
    int _1048 = _969 * _1044;
    int _1050 = _1048 + _985;
    bool _1052 = uint(_1050) >= uint(_953);
    bool _1054 = !_1052;
    int _1056 = _1054 ? 0 : (-1);
    bool _1058 = _953 == 0;
    int _1060 = ~_1044;
    int _1062 = _1060 + _1056;
    int _1064 = _1062 + 1;
    float _1066 = -_1046;
    float _1068 = _1003 + _1066;
    int _1070 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1072 = _1070 != 0;
    int _1074 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1076 = _1074 != 0;
    int _1078 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1080 = _1078 != 0;
    int _1082 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1084 = _1082 != 0;
    int _1086 = _953 * _1064;
    int _1088 = _1086 + _985;
    int _1090 = ~_1032;
    int _1092 = _1090 + 1;
    int _1094 = _1092 + 1;
    bool _1096 = !_1072;
    int _1098 = _1096 ? 0 : 1;
    bool _1100 = !_1058;
    int _1102 = _1100 ? _1088 : (-1);
    float _1104 = _1068 * _999;
    float _1106 = _999 * _145;
    bool _1108 = !_1076;
    int _1110 = _1108 ? 0 : 1;
    int _1112 = _1102 * _1094;
    float _1114 = _1106 * _957;
    int _1116 = _953 + (-1);
    float _1118 = trunc(_1104);
    int _1120 = int(_1118);
    int _1122 = abs(_1098);
    int _1124 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1126 = _1124 != 0;
    int _1128 = _1032 * _1116;
    int _1130 = _1128 + _1112;
    bool _1132 = !_1084;
    int _1134 = _1132 ? 0 : 1;
    int _1136 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1138 = _1136 != 0;
    float _1140 = trunc(_1114);
    int _1142 = int(_1140);
    int _1144 = abs(_1110);
    bool _1146 = !_1080;
    int _1148 = _1146 ? 0 : 1;
    bool _1150 = !_1138;
    int _1152 = _1150 ? 0 : 1;
    int _1154 = abs(_1134);
    int _1156 = abs(_1148);
    int _1158 = _1130 * _1144;
    int _1160 = abs(_1152);
    int _1162 = _1120 * _1154;
    int _1164 = _1162 + _985;
    float _1166 = _167 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1168 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1170 = _1168 != 0;
    int _1172 = _1142 * _1122;
    int _1174 = _1172 + _1158;
    int _1176 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1178 = _1176 != 0;
    int _1180 = _1164 * _1156;
    int _1182 = _1180 + _1174;
    int _1184 = ~_953;
    int _1186 = _1184 + 1;
    float _1188 = in.m_63.y;
    float _1190 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1192 = _1120 * _1160;
    int _1194 = _1192 + _1182;
    float _1196 = -_1190;
    float _1198 = fma(_1166, 2.0, _1196);
    float _1200 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1202 = _945 + _1200;
    float _1204 = float(uint(_1194));
    float _1206 = as_type<float>(_987) * _1204;
    float _1208 = trunc(_1206);
    float _1210 = precise::max(_1208, 0.0);
    uint _1212 = uint(_1210);
    float _1214 = _1188 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1216 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1218 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1216;
    float _1220 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1222 = _1220 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1224 = 1.0 / _1218;
    int _1226 = _1186 * int(_1212);
    int _1228 = _1226 + _1194;
    float _1230 = float(uint(_1228));
    float _1232 = 1.0 / _1222;
    float _1234 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1236 = _945 + _1234;
    float _1238 = as_type<float>(_987) * _1230;
    float _1240 = in.m_56.x;
    float _1242 = in.m_56.y;
    float _1244 = in.m_56.z;
    float _1246 = _1236 * _1224;
    float _1248 = trunc(_1238);
    float _1250 = precise::max(_1248, 0.0);
    uint _1252 = uint(_1250);
    float _1254 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1256 = ~_953;
    int _1258 = _1256 + 1;
    float _1260 = fma(_1214, -2.0, _1254);
    int _1262 = int(_1212) + int(_1252);
    float _1264 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1260);
    int _1266 = _1258 * _1262;
    int _1268 = _1266 + _1194;
    float _1270 = _1242 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1272 = _1242 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1274 = _1242 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _1276 = uint(_1268) >= uint(_953);
    float _1278 = _1202 * _1232;
    float _1280 = fma(_1240, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1274);
    float _1282 = fma(_1240, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1270);
    bool _1284 = !_1276;
    int _1286 = _1284 ? 0 : (-1);
    float _1288 = fma(_1244, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1280);
    float _1290 = float(uint(_1164));
    float _1292 = fma(_1240, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1272);
    int _1294 = ~_1262;
    int _1296 = _1294 + _1286;
    int _1298 = _1296 + 1;
    float _1300 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1302 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1300;
    float _1304 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1306 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1304;
    bool _1308 = _167 > 0.5;
    float _1310 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1312 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1310;
    float _1314 = as_type<float>(_987) * _1290;
    float _1316 = fma(_1244, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1282);
    float _1318 = fma(_1244, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1292);
    float _1320 = fma(_1302, _1246, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1322 = fma(_1306, _1246, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1324 = fma(_1312, _1246, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1326 = -_337;
    int _1328 = _1308 ? as_type<int>(_1326) : as_type<int>(_337);
    float _1330 = trunc(_1314);
    float _1332 = precise::max(_1330, 0.0);
    uint _1334 = uint(_1332);
    int _1336 = _953 * _1298;
    int _1338 = _1336 + _1194;
    float _1340 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1342 = _1340 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    bool _1344 = !_1170;
    float _1346 = _1344 ? _337 : as_type<float>(_1328);
    float _1348 = -_145;
    float _1350 = fma(_1348, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1198);
    float _1352 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1354 = _1352 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    bool _1356 = !_1058;
    int _1358 = _1356 ? _1338 : (-1);
    float _1360 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1362 = _1360 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1364 = _1346 + 0.5;
    bool _1366 = _945 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1368 = isnan(_945);
    bool _1370 = _1366 || _1368;
    bool _1372 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1374 = _1370 || _1372;
    float _1376 = float(_1374);
    float _1378 = fma(_1354, _1278, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    int _1380 = _1358 >> 31;
    float _1382 = fma(_1364, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1350);
    bool _1384 = _945 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1386 = isnan(_945);
    bool _1388 = _1384 || _1386;
    bool _1390 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1392 = _1388 || _1390;
    float _1394 = float(_1392);
    float _1396 = fma(_1362, _1278, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    int _1398 = _1380 & 3;
    int _1400 = _973 * int(_1334);
    int _1402 = _1400 + _1164;
    float _1404 = fma(_1342, _1278, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    bool _1406 = _945 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1408 = isnan(_945);
    bool _1410 = _1406 || _1408;
    bool _1412 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1414 = _1410 || _1412;
    float _1416 = float(_1414);
    float _1418 = -_1394;
    float _1420 = _1418 + 1.0;
    bool _1422 = _1188 > 0.5;
    float _1424 = _1318 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1426 = _1358 + _1398;
    float _1428 = _1416 * _1420;
    float _1430 = float(uint(_1402));
    float _1432 = -_1416;
    float _1434 = _1432 + 1.0;
    float _1436 = -_219;
    int _1438 = _1422 ? as_type<int>(_1436) : as_type<int>(_219);
    float _1440 = _1316 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1442 = _1426 >> 2;
    float _1444 = as_type<float>(_987) * _1430;
    float _1446 = _1376 * _1434;
    bool _1448 = !_1178;
    float _1450 = _1448 ? _219 : as_type<float>(_1438);
    float _1452 = -_1376;
    float _1454 = _1452 + 1.0;
    int _1456 = _1442 << 4;
    int _1458 = _1456 + 368;
    float _1460 = _1320 * _1446;
    float _1462 = trunc(_1444);
    float _1464 = precise::max(_1462, 0.0);
    uint _1466 = uint(_1464);
    float _1468 = _1324 * _1446;
    uint _1470 = uint(int(uint(_1458) >> uint(2)));
    uint _1472 = uint(int(uint(int(_1470)) >> uint(2)));
    int _1474 = int(_1470) & 3;
    float _1476 = (*spvDescriptorSet0.vp_c9)._m0[int(_1472)][_1474];
    int _1478 = int(_1470) + 1;
    uint _1480 = uint(int(uint(_1478) >> uint(2)));
    int _1482 = _1478 & 3;
    float _1484 = (*spvDescriptorSet0.vp_c9)._m0[int(_1480)][_1482];
    float _1486 = _1450 + (-0.5);
    int _1488 = _1358 & 3;
    bool _1490 = _1488 != 0;
    float _1492 = _1322 * _1446;
    int _1494 = _1358 & 3;
    bool _1496 = _1494 != 0;
    float _1498 = -_1486;
    float _1500 = -_1264;
    float _1502 = fma(_1498, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1500);
    float _1504 = fma(_1454, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1460);
    float _1506 = fma(_1454, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1468);
    bool _1508 = uint(_1494) > 1u;
    int _1510 = _1458 + 8;
    uint _1512 = uint(int(uint(_1510) >> uint(2)));
    uint _1514 = uint(int(uint(int(_1512)) >> uint(2)));
    int _1516 = int(_1512) & 3;
    float _1518 = (*spvDescriptorSet0.vp_c9)._m0[int(_1514)][_1516];
    int _1520 = int(_1512) + 1;
    uint _1522 = uint(int(uint(_1520) >> uint(2)));
    int _1524 = _1520 & 3;
    float _1526 = (*spvDescriptorSet0.vp_c9)._m0[int(_1522)][_1524];
    float _1528 = fma(_1454, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1492);
    float _1530 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1532 = _1424 + _1530;
    float _1534 = fma(_1378, _1428, _1504);
    float _1536 = fma(_1404, _1428, _1506);
    int _1538 = int(_1334) + int(_1466);
    float _1540 = fma(_1396, _1428, _1528);
    int _1542 = _1490 ? 0 : 1;
    float _1544 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1546 = _1440 + _1544;
    float _1548 = _1532 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1550 = _977 * _1538;
    int _1552 = _1550 + _1164;
    int _1554 = ~_1542;
    int _1556 = _1554 + 1;
    int _1558 = _1556 + 1;
    float _1560 = fma(_1394, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1540);
    float _1562 = fma(_1546, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1548);
    int _1564 = _1558;
    float _1566 = _1450;
    if (!_1508)
    {
        int _1568 = ~_1542;
        int _1570 = _1568 + 1;
        _1564 = _1570;
    }
    int _1572 = _1564;
    float _1574 = fma(_1394, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1534);
    bool _1576 = !_1496;
    int _1578 = _1576 ? 0 : 1;
    float _1580 = fma(_1394, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1536);
    bool _1582 = _1494 != 3;
    float _1584 = _1288 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1586 = uint(_1552) >= uint(_953);
    int _1588 = abs(_1572);
    float _1590 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1592 = _1584 + _1590;
    bool _1594 = uint(_1494) >= 2u;
    int _1596 = abs(_1578);
    float _1598 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1562);
    bool _1600 = !_1586;
    int _1602 = _1600 ? 0 : (-1);
    int _1604 = ~_1588;
    int _1606 = _1604 + 1;
    int _1608 = _1606 + 1;
    int _1610 = _1594 ? 0 : 1;
    int _1612 = ~_1538;
    int _1614 = _1612 + _1602;
    int _1616 = _1614 + 1;
    int _1618 = ~_1596;
    int _1620 = _1618 + 1;
    int _1622 = _1620 + 1;
    int _1624 = ~_1610;
    int _1626 = _1624 + 1;
    int _1628 = _1626 + 1;
    int _1630 = _1608 * as_type<int>(_1484);
    bool _1632 = _1494 != 3;
    int _1634 = _953 * _1616;
    int _1636 = _1634 + _1164;
    int _1638 = _1628;
    if (_1582)
    {
        int _1640 = ~_1610;
        int _1642 = _1640 + 1;
        _1638 = _1642;
    }
    int _1644 = _1638;
    int _1646 = _1622 * as_type<int>(_1476);
    int _1648 = _1646 + _1630;
    bool _1650 = !_1632;
    int _1652 = _1650 ? 0 : (-1);
    int _1654 = abs(_1644);
    bool _1656 = !_1126;
    int _1658 = _1656 ? 0 : 1;
    int _1660 = abs(_1652);
    int _1662 = abs(_1658);
    float _1664 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1666 = ~_1654;
    int _1668 = _1666 + 1;
    int _1670 = _1668 + 1;
    float _1672 = _1532 * _1532;
    int _1674 = ~_1660;
    int _1676 = _1674 + 1;
    int _1678 = _1676 + 1;
    int _1680 = _1670 * as_type<int>(_1518);
    int _1682 = _1680 + _1648;
    float _1684 = fma(_1188, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1664);
    int _1686 = ~_1662;
    int _1688 = _1686 + 1;
    int _1690 = _1688 + 1;
    int _1692 = _1678 * as_type<int>(_1526);
    int _1694 = _1692 + _1682;
    bool _1696 = !_1058;
    int _1698 = _1696 ? _1636 : (-1);
    float _1700 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1702 = _1598 >= 0.0;
    int _1704 = _1694 * _1690;
    float _1706 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1684);
    float _1708 = fma(_167, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1700);
    int _1710 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1712 = _1710 != 0;
    int _1714 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1716 = _1714 != 0;
    int _1718 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1720 = _1718 != 0;
    int _1722 = _1698 * _1662;
    int _1724 = _1722 + _1704;
    float _1726 = fma(_1546, _1546, _1672);
    float _1728 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1708);
    float _1730 = -_1706;
    float _1732 = _1730 + 1.0;
    float _1734 = _1574 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1736 = fma(_1592, _1592, _1726);
    float _1738 = -_1728;
    float _1740 = _1738 + 1.0;
    float _1742 = fma(_1450, _1732, _1502);
    if (_1702)
    {
        _1566 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1744 = _1566;
    float _1746 = _1560 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1748 = -_1740;
    float _1750 = fma(_1346, _1748, _1382);
    float _1752 = rsqrt(_1736);
    float _1754 = _1580 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1756 = _1734 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1758 = _1746 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1760 = _1754 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1762 = as_type<int>(_1744);
    float _1764 = _1760;
    if (_1702)
    {
        float _1766 = _1744 * 5.0;
        _1762 = as_type<int>(_1766);
    }
    int _1768 = _1762;
    float _1770 = float(_1724);
    out.m_74.x = _1750;
    out.m_74.y = _1742;
    bool _1772 = !_1716;
    int _1774 = _1772 ? 0 : 1;
    bool _1776 = !_1720;
    int _1778 = _1776 ? 0 : 1;
    out.m_76.x = _1756;
    out.m_76.y = _1758;
    out.m_76.z = _1760;
    bool _1780 = !_1712;
    int _1782 = _1780 ? 0 : 1;
    if (_1702)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6684 = as_type<float>(_1768);
        out.gl_Position.z = _6684;
    }
    float _1784 = _1532 * _1752;
    float _1786 = _1546 * _1752;
    out.m_78.x = _1770;
    float _1788 = _1786;
    if (_1702)
    {
        out.m_59.x = 0.0;
    }
    if (_1702)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1790 = -_1784;
    float _1792 = fma(_1790, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1424);
    float _1794 = _1592 * _1752;
    float _1796 = -_1786;
    float _1798 = fma(_1796, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1440);
    float _1800 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1802 = _1792 + _1800;
    float _1804 = -_1794;
    float _1806 = fma(_1804, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1584);
    float _1808 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1810 = _1798 + _1808;
    float _1812 = _1802 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1814 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1816 = _1806 + _1814;
    float _1818 = fma(_1810, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1812);
    float _1820 = fma(_1816, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1818);
    bool _1822 = _1820 >= 0.0;
    float _1824 = _1802;
    float _1826 = _1792;
    float _1828 = _1806;
    if (_1822)
    {
        _1764 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1830 = _1764;
    int _1832 = as_type<int>(_1830);
    if (_1822)
    {
        out.m_59.x = 0.0;
    }
    if (_1822)
    {
        float _1834 = _1830 * 5.0;
        _1832 = as_type<int>(_1834);
    }
    int _1836 = _1832;
    if (_1822)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6790 = as_type<float>(_1836);
        out.gl_Position.z = _6790;
    }
    if (_1822)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1838 = fma(_1798, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1840 = fma(_1806, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1842 = floor(_1838);
    float _1844 = floor(_1840);
    float _1846 = -_1842;
    float _1848 = _1838 + _1846;
    float _1850 = -_1844;
    float _1852 = _1840 + _1850;
    float2 _6826 = float2(_1848, _1852);
    float _1854 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6826, float2(0.0), isnan(_6826)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6826, float2(0.0), isnan(_6826)), level(0.0)).x;
    float _1856 = in.m_63.z;
    float _1858 = _167 * 2.0;
    float _1860 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1862 = log2(_1860);
    float _1864 = _167 + _1188;
    float _1866 = _1188 * 2.0;
    float _1868 = _1864 + (-1.0);
    int _1870 = abs(_1774);
    float _1872 = -_1784;
    float _1874 = fma(_1872, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1532);
    float _1876 = floor(_1858);
    int _1878 = abs(_1782);
    float _1880 = -_1786;
    float _1882 = fma(_1880, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1546);
    float _1884 = float(_1870);
    float _1886 = _1874 * _1874;
    float _1888 = float(_1878);
    float _1890 = -_1794;
    float _1892 = fma(_1890, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1592);
    float _1894 = _347 * _909;
    float _1896 = _1862 * _145;
    float _1898 = floor(_1866);
    float _1900 = fma(_1882, _1882, _1886);
    float _1902 = _343 * _911;
    float _1904 = _1856 * 2.0;
    float _1906 = _1188 + _1856;
    bool _1908 = _1876 > 0.0;
    float _1910 = exp2(_1896);
    bool _1912 = _1876 >= 0.0;
    bool _1914 = isnan(_1876);
    bool _1916 = _1912 || _1914;
    bool _1918 = isnan(0.0);
    bool _1920 = _1916 || _1918;
    float _1922 = _1906 + (-1.0);
    float _1924 = _1188 + (-0.5);
    float _1926 = fma(_1892, _1892, _1900);
    float _1928 = floor(_1904);
    float _1930 = fma(_1922, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1932 = _1920 ? 0 : 1;
    float _1934 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    int _1936 = ~_1932;
    int _1938 = _1936 + 1;
    int _1940 = _1938 + 1;
    float _1942 = fma(_1868, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1944 = _1940;
    int _1946 = 2;
    if (!_1908)
    {
        int _1948 = ~_1932;
        int _1950 = _1948 + 1;
        _1944 = _1950;
    }
    int _1952 = _1944;
    float _1954 = in.m_80.x;
    float _1956 = in.m_80.y;
    float _1958 = in.m_80.z;
    float _1960 = -_1910;
    float _1962 = _1960 + 1.0;
    bool _1964 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1966 = isnan(0.0);
    bool _1968 = _1964 || _1966;
    bool _1970 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1972 = _1968 || _1970;
    float _1974 = _1792 + _1934;
    float _1976 = float(_1952);
    bool _1978 = _1928 > 0.0;
    float _1980 = _1974 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    bool _1982 = _1928 >= 0.0;
    bool _1984 = isnan(_1928);
    bool _1986 = _1982 || _1984;
    bool _1988 = isnan(0.0);
    bool _1990 = _1986 || _1988;
    float _1992 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1994 = 1.0 + _1992;
    float _1996 = _1884 * _1976;
    float _1998 = _1972 ? _1962 : 0.0;
    float _2000 = fma(_1798, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1980);
    int _2002 = _1990 ? 0 : 1;
    float _2004 = _1996 * (-2.0);
    float _2006 = 1.0 / _1994;
    bool _2008 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2010 = isnan(1.0);
    bool _2012 = _2008 || _2010;
    bool _2014 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2016 = _2012 || _2014;
    float _2018 = fma(_1806, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2000);
    int _2020 = ~_2002;
    int _2022 = _2020 + 1;
    int _2024 = _2022 + 1;
    int _2026 = _2024;
    if (!_1978)
    {
        int _2028 = ~_2002;
        int _2030 = _2028 + 1;
        _2026 = _2030;
    }
    int _2032 = _2026;
    float _2034 = _2018 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    bool _2036 = _1898 > 0.0;
    bool _2038 = _1898 >= 0.0;
    bool _2040 = isnan(_1898);
    bool _2042 = _2038 || _2040;
    bool _2044 = isnan(0.0);
    bool _2046 = _2042 || _2044;
    float _2048 = fma(_2004, _1956, _1956);
    float _2050 = float(_2032);
    float _2052 = fma(_1930, _2004, _1930);
    int _2054 = abs(_1778);
    float _2056 = fma(_1924, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2048);
    float _2058 = trunc(_2034);
    int _2060 = int(_2058);
    if (_2016)
    {
        float _2062 = _1998 * _2006;
        _149 = _2062;
    }
    float _2064 = _149;
    int _2066 = _2046 ? 0 : 1;
    float _2068 = _1888 * _2050;
    float _2070 = fma(_2052, _2064, _2056);
    int _2072 = ~_2066;
    int _2074 = _2072 + 1;
    int _2076 = _2074 + 1;
    float _2078 = _2068 * (-2.0);
    int _2080 = _2076;
    if (!_2036)
    {
        int _2082 = ~_2066;
        int _2084 = _2082 + 1;
        _2080 = _2084;
    }
    int _2086 = _2080;
    float _2088 = _2070 * 0.15915493667125701904296875;
    float _2090 = float(_2054);
    float _2092 = fma(_1942, _2078, _1942);
    float _2094 = float(_2086);
    float _2096 = fma(_2078, _1954, _1954);
    float _2098 = _167 + (-0.5);
    float _2100 = _167 + _1856;
    float _2102 = _1856 + (-0.5);
    float _2104 = _2090 * _2094;
    float _2106 = fma(_2098, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2096);
    float _2108 = _2100 + (-1.0);
    float _2110 = _2104 * (-2.0);
    float _2112 = fma(_2092, _2064, _2106);
    float _2114 = _2088 * 6.283185482025146484375;
    float _2116 = sin(_2114);
    float _2118 = fma(_2108, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2120 = fma(_2110, _1958, _1958);
    float _2122 = _2112 * 0.15915493667125701904296875;
    int _2124 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2126 = _2060 + _2124;
    int _2128 = _2126 + 1;
    float _2130 = fma(_2118, _2110, _2118);
    float _2132 = fma(_2102, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2120);
    float _2134 = _2088 * 6.283185482025146484375;
    float _2136 = cos(_2134);
    float _2138 = fma(_2130, _2064, _2132);
    float _2140 = _2138 * 0.15915493667125701904296875;
    float _2142 = _1792 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2144 = _2122 * 6.283185482025146484375;
    float _2146 = sin(_2144);
    float _2148 = fma(_1798, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2142);
    float _2150 = fma(_1806, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2148);
    float _2152 = _2122 * 6.283185482025146484375;
    float _2154 = cos(_2152);
    float _2156 = _2150 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2158 = _1792 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2160 = _2140 * 6.283185482025146484375;
    float _2162 = sin(_2160);
    float _2164 = fma(_1798, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2158);
    float _2166 = _2146 * _2136;
    float _2168 = fma(_1806, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2164);
    float _2170 = 1.0 / _2156;
    float _2172 = _2168 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2174 = _2146 * _2116;
    float _2176 = _2154 * _2136;
    float _2178 = _2172 + _2156;
    float _2180 = _2140 * 6.283185482025146484375;
    float _2182 = cos(_2180);
    float _2184 = fma(_2162, _2176, _2174);
    float _2186 = fma(_2162, _2174, _2176);
    float _2188 = _2154 * _2116;
    float _2190 = -_2188;
    float _2192 = fma(_2162, _2166, _2190);
    float _2194 = sqrt(_1926);
    float _2196 = _2178 * _2170;
    float _2198 = _2196 * 0.5;
    float _2200 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _219);
    float _2202 = -_2166;
    float _2204 = fma(_2162, _2188, _2202);
    float _2206 = _2154 * _2182;
    float _2208 = _2136 * _2182;
    float _2210 = _2146 * _2182;
    float _2212 = _2116 * _2182;
    float _2214 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2216 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2214);
    float _2218 = _1752 * _2194;
    float _2220 = _1894 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2222 = 1.0 / _2216;
    float _2224 = _2218 * _2220;
    float _2226 = _1902 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2228 = _2200 * _2224;
    float _2230 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _337);
    float _2232 = _2218 * _2226;
    float _2234 = _2206 * _2228;
    float _2236 = -_2228;
    float _2238 = _2162 * _2236;
    float _2240 = _2230 * _2232;
    float _2242 = _1974 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _2244 = _2210 * _2228;
    float _2246 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2248 = _2222 * _2246;
    float _2250 = fma(_2184, _2240, _2234);
    float _2252 = fma(_1798, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2242);
    float _2254 = _2218 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2256 = _2254 * 0.5;
    float _2258 = fma(_2208, _2240, _2238);
    bool _2260 = _2248 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _2262 = fma(_1806, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2252);
    float _2264 = fma(_2204, _2256, _2250);
    bool _2266 = _2248 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _2268 = fma(_2192, _2240, _2244);
    float _2270 = fma(_2212, _2256, _2258);
    float _2272 = _2264 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2274 = _2264 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2276 = _2262 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _2278 = fma(_2186, _2256, _2268);
    float _2280 = fma(_2270, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2272);
    float _2282 = fma(_2270, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2274);
    float _2284 = trunc(_2276);
    int _2286 = int(_2284);
    bool _2288 = !_2260;
    int _2290 = _2288 ? 0 : 1;
    float _2292 = fma(_2278, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2280);
    float _2294 = fma(_2278, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2282);
    int _2296 = as_type<int>(_2278);
    if (!_2260)
    {
        _1946 = 1;
    }
    int _2298 = _1946;
    float _2300 = _2264 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2302 = _2298;
    int _2304 = as_type<int>(_2300);
    if (!_2266)
    {
        _2302 = _2290;
    }
    int _2306 = _2302;
    float _2308 = _2292 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2310 = _2294 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2312 = fma(_2270, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2300);
    int _2314 = _2306 << 6;
    float _2316 = _1584 + _2308;
    float _2318 = _1440 + _2310;
    float _2320 = fma(_2278, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2312);
    int _2322 = _2314 + 48;
    uint _2324 = uint(int(uint(_2322) >> uint(2)));
    uint _2326 = uint(int(uint(int(_2324)) >> uint(2)));
    int _2328 = int(_2324) & 3;
    float _2330 = (*spvDescriptorSet0.vp_c15)._m0[int(_2326)][_2328];
    int _2332 = int(_2324) + 1;
    uint _2334 = uint(int(uint(_2332) >> uint(2)));
    int _2336 = _2332 & 3;
    float _2338 = (*spvDescriptorSet0.vp_c15)._m0[int(_2334)][_2336];
    float _2340 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2342 = _2316 + _2340;
    int _2344 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2346 = _2286 + _2344;
    int _2348 = _2346 + 1;
    float _2350 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2352 = _2318 + _2350;
    float _2354 = _2342 * _2342;
    int _2356 = _2348 | _2128;
    int _2358 = _2314 + 56;
    uint _2360 = uint(int(uint(_2358) >> uint(2)));
    uint _2362 = uint(int(uint(int(_2360)) >> uint(2)));
    int _2364 = int(_2360) & 3;
    float _2366 = (*spvDescriptorSet0.vp_c15)._m0[int(_2362)][_2364];
    int _2368 = int(_2360) + 1;
    uint _2370 = uint(int(uint(_2368) >> uint(2)));
    int _2372 = _2368 & 3;
    float _2374 = (*spvDescriptorSet0.vp_c15)._m0[int(_2370)][_2372];
    bool _2376 = _2348 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _2378 = fma(_2352, _2352, _2354);
    bool _2380 = _2356 < 0;
    bool _2382 = _2380 || _2376;
    float _2384 = sqrt(_2378);
    int _2386 = _2314 + 64;
    uint _2388 = uint(int(uint(_2386) >> uint(2)));
    uint _2390 = uint(int(uint(int(_2388)) >> uint(2)));
    int _2392 = int(_2388) & 3;
    float _2394 = (*spvDescriptorSet0.vp_c15)._m0[int(_2390)][_2392];
    int _2396 = int(_2388) + 1;
    uint _2398 = uint(int(uint(_2396) >> uint(2)));
    int _2400 = _2396 & 3;
    float _2402 = (*spvDescriptorSet0.vp_c15)._m0[int(_2398)][_2400];
    bool _2404 = _2128 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2406 = _2404 || _2382;
    int _2408 = _2314 + 72;
    uint _2410 = uint(int(uint(_2408) >> uint(2)));
    uint _2412 = uint(int(uint(int(_2410)) >> uint(2)));
    int _2414 = int(_2410) & 3;
    float _2416 = (*spvDescriptorSet0.vp_c15)._m0[int(_2412)][_2414];
    int _2418 = int(_2410) + 1;
    uint _2420 = uint(int(uint(_2418) >> uint(2)));
    int _2422 = _2418 & 3;
    float _2424 = (*spvDescriptorSet0.vp_c15)._m0[int(_2420)][_2422];
    int _2426 = as_type<int>(_2354);
    float _2428 = _2318;
    float _2430 = _2316;
    if (!_2406)
    {
        int _2432 = _2128 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _2434 = _2432 + _2348;
        _2304 = _2434;
    }
    int _2436 = _2304;
    bool _2438 = _2384 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _2440 = _2314 + 96;
    uint _2442 = uint(int(uint(_2440) >> uint(2)));
    uint _2444 = uint(int(uint(int(_2442)) >> uint(2)));
    int _2446 = int(_2442) & 3;
    float _2448 = (*spvDescriptorSet0.vp_c15)._m0[int(_2444)][_2446];
    int _2450 = int(_2442) + 1;
    uint _2452 = uint(int(uint(_2450) >> uint(2)));
    int _2454 = _2450 & 3;
    float _2456 = (*spvDescriptorSet0.vp_c15)._m0[int(_2452)][_2454];
    float _2458 = _2320 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2460 = _2384;
    if (!_2406)
    {
        int _2462 = _2436 << 2;
        _2296 = _2462;
    }
    int _2464 = _2296;
    int _2466 = _2464;
    if (!_2406)
    {
        uint _2468 = uint(int(uint(_2436) >> uint(2)));
        _2426 = int(_2468);
    }
    int _2470 = _2426;
    float _2472 = _1424 + _2458;
    float _2474 = as_type<float>(_2470);
    float _2476 = _2472;
    if (!_2406)
    {
        int _2478 = 12 & _2464;
        _2466 = _2478;
    }
    int _2480 = _2466;
    int _2482 = _2314 + 104;
    uint _2484 = uint(int(uint(_2482) >> uint(2)));
    uint _2486 = uint(int(uint(int(_2484)) >> uint(2)));
    int _2488 = int(_2484) & 3;
    float _2490 = (*spvDescriptorSet0.vp_c15)._m0[int(_2486)][_2488];
    int _2492 = int(_2484) + 1;
    uint _2494 = uint(int(uint(_2492) >> uint(2)));
    int _2496 = _2492 & 3;
    float _2498 = (*spvDescriptorSet0.vp_c15)._m0[int(_2494)][_2496];
    float _2500 = as_type<float>(_2480);
    if (!_2406)
    {
        int _2502 = _2470 << 4;
        int _2504 = _2502 + _2480;
        _2474 = as_type<float>(_2504);
    }
    float _2506 = _2474;
    bool _2508 = !_2438;
    if (!_2508)
    {
        float _2510 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2512 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2514 = _2384 + _2512;
        float _2516 = _2472 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2518 = rsqrt(_2378);
        float _2520 = _2514 * _2510;
        float _2522 = _2520 * 0.15915493667125701904296875;
        float _2524 = _2522 * 6.283185482025146484375;
        float _2526 = cos(_2524);
        float _2528 = _2522 * 6.283185482025146484375;
        float _2530 = sin(_2528);
        float _2532 = _2526 + (-1.0);
        float _2534 = fma(_2530, _2516, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2536 = _2532 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2538 = _2518 * _2534;
        float _2540 = fma(_2472, _2526, _2536);
        float _2542 = fma(_2352, _2538, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2544 = fma(_2342, _2538, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2476 = _2540;
        _2428 = _2542;
        _2430 = _2544;
        _2460 = _2532;
        _2500 = _2530;
    }
    float _2546 = _2476;
    float _2548 = _2428;
    float _2550 = _2430;
    float _2552 = _2460;
    float _2554 = _2500;
    float _2556 = -_1424;
    float _2558 = _2556 + _2546;
    int _2560 = _2314 + 80;
    uint _2562 = uint(int(uint(_2560) >> uint(2)));
    uint _2564 = uint(int(uint(int(_2562)) >> uint(2)));
    int _2566 = int(_2562) & 3;
    float _2568 = (*spvDescriptorSet0.vp_c15)._m0[int(_2564)][_2566];
    int _2570 = int(_2562) + 1;
    uint _2572 = uint(int(uint(_2570) >> uint(2)));
    int _2574 = _2570 & 3;
    float _2576 = (*spvDescriptorSet0.vp_c15)._m0[int(_2572)][_2574];
    float _2578 = -_1440;
    float _2580 = _2578 + _2548;
    float _2582 = -_1584;
    float _2584 = _2582 + _2550;
    float _2586 = _2558 * _2558;
    float _2588 = _1974 * _2456;
    float _2590 = _2554;
    float _2592 = _2552;
    float _2594 = _2548;
    float _2596 = _2546;
    float _2598 = _2550;
    if (!_2406)
    {
        float _2600 = floor(_2276);
        _2590 = _2600;
    }
    float _2602 = _2590;
    float _2604 = _1974 * _2402;
    float _2606 = fma(_2580, _2580, _2586);
    int _2608 = _2314 + 88;
    uint _2610 = uint(int(uint(_2608) >> uint(2)));
    uint _2612 = uint(int(uint(int(_2610)) >> uint(2)));
    int _2614 = int(_2610) & 3;
    float _2616 = (*spvDescriptorSet0.vp_c15)._m0[int(_2612)][_2614];
    int _2618 = int(_2610) + 1;
    uint _2620 = uint(int(uint(_2618) >> uint(2)));
    int _2622 = _2618 & 3;
    float _2624 = (*spvDescriptorSet0.vp_c15)._m0[int(_2620)][_2622];
    float _2626 = fma(_1798, _2448, _2588);
    float _2628 = fma(_1798, _2394, _2604);
    float _2630 = fma(_2584, _2584, _2606);
    float _2632 = fma(_1806, _2490, _2626);
    if (!_2406)
    {
        float _2634 = floor(_2034);
        _2592 = _2634;
    }
    float _2636 = _2592;
    bool _2638 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2640 = isnan(0.5);
    bool _2642 = _2638 || _2640;
    bool _2644 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2646 = _2642 || _2644;
    float _2648 = _2506;
    if (!_2406)
    {
        int _2650 = as_type<int>(_2506) + 400;
        uint _2652 = uint(int(uint(_2650) >> uint(2)));
        uint _2654 = uint(int(uint(int(_2652)) >> uint(2)));
        int _2656 = int(_2652) & 3;
        float _2658 = (*spvDescriptorSet0.vp_c15)._m0[int(_2654)][_2656];
        _2648 = _2658;
    }
    float _2660 = _2648;
    float _2662 = _2632 + _2498;
    float _2664 = _1974 * _2338;
    float _2666 = fma(_1806, _2416, _2628);
    float _2668 = sqrt(_2630);
    float _2670 = fma(_1798, _2330, _2664);
    float _2672 = fma(_1806, _2366, _2670);
    float _2674 = 1.0 / _2662;
    bool _2676 = _2668 > 0.0;
    bool _2678 = !_2676;
    float _2680 = _2666;
    float _2682 = _2674;
    if (!_2678)
    {
        float _2684 = _301 * _301;
        float _2686 = rsqrt(_2630);
        float _2688 = fma(_293, _293, _2684);
        float _2690 = fma(_311, _311, _2688);
        float _2692 = sqrt(_2690);
        float _2694 = _2580 * _2686;
        float _2696 = _2558 * _2686;
        float _2698 = _2584 * _2686;
        bool _2700 = _2692 > 0.0;
        bool _2702 = !_2700;
        if (!_2702)
        {
            float _2704 = rsqrt(_2690);
            float _2706 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2708 = _301 * _2704;
            float _2710 = _293 * _2704;
            float _2712 = _2696 * _2708;
            float _2714 = _311 * _2704;
            float _2716 = fma(_2694, _2710, _2712);
            float _2718 = _2706 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2720 = fma(_2698, _2714, _2716);
            float _2722 = _2720 * _2718;
            float _2724 = fma(_293, _2722, _2548);
            float _2726 = fma(_301, _2722, _2546);
            float _2728 = fma(_311, _2722, _2550);
            _2594 = _2724;
            _2596 = _2726;
            _2598 = _2728;
        }
    }
    float _2730 = _2594;
    float _2732 = _2596;
    float _2734 = _2598;
    float _2736 = -_1786;
    float _2738 = fma(_2736, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2730);
    float _2740 = -_1784;
    float _2742 = fma(_2740, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2732);
    float _2744 = -_1794;
    float _2746 = fma(_2744, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2734);
    float _2748 = _2672 + _2374;
    float _2750 = _2666 + _2424;
    float _2752 = _2742;
    float _2754 = _2738;
    float _2756 = _2746;
    if (!_2646)
    {
        float _2758 = _1802 * _1802;
        float _2760 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2762 = -_1424;
        float _2764 = _2762 + _2732;
        float _2766 = -_1440;
        float _2768 = _2766 + _2730;
        float _2770 = fma(_1810, _1810, _2758);
        float _2772 = -_1584;
        float _2774 = _2772 + _2734;
        float _2776 = fma(_1816, _1816, _2770);
        float _2778 = 1.0 / _2218;
        float _2780 = sqrt(_2776);
        float _2782 = _2764 * _2778;
        float _2784 = _2768 * _2778;
        float _2786 = _2774 * _2778;
        bool _2788 = _2780 > (*spvDescriptorSet0.vp_c9)._m0[199].x;
        bool _2790 = isnan(_2780);
        bool _2792 = _2788 || _2790;
        bool _2794 = isnan((*spvDescriptorSet0.vp_c9)._m0[199].x);
        bool _2796 = _2792 || _2794;
        float _2798 = precise::min(_2780, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2800 = _2798 * _2760;
        float _2802 = fma(_2782, _2800, _1792);
        float _2804 = fma(_2784, _2800, _1798);
        float _2806 = _2666;
        float _2808 = _2780;
        float _2810 = _2800;
        float _2812 = _2802;
        float _2814 = _2804;
        _1824 = _2758;
        if (_2796)
        {
            float _2816 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].y;
            _2806 = _2816;
        }
        float _2818 = _2806;
        if (_2796)
        {
            float _2820 = precise::max(_2780, (*spvDescriptorSet0.vp_c9)._m0[199].y);
            _2808 = _2820;
        }
        float _2822 = _2808;
        float _2824 = fma(_2786, _2800, _1806);
        _2756 = _2824;
        _2680 = _2818;
        if (_2796)
        {
            float _2826 = _2822 * _2818;
            _2810 = _2826;
        }
        float _2828 = _2810;
        if (_2796)
        {
            float _2830 = fma(_2782, _2828, _1792);
            _2812 = _2830;
        }
        float _2832 = _2812;
        _2752 = _2832;
        if (_2796)
        {
            float _2834 = fma(_2784, _2828, _1798);
            _2814 = _2834;
        }
        float _2836 = _2814;
        _2754 = _2836;
        if (_2796)
        {
            float _2838 = fma(_2786, _2828, _1806);
            _2756 = _2838;
        }
    }
    float _2840 = _2752;
    float _2842 = _2754;
    float _2844 = _2756;
    float _2846 = _2680;
    float _2848 = _1824;
    float _2850 = _2840 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2852 = _2748 * _2674;
    float _2854 = _2840 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2856 = _2840 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2858 = fma(_2842, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2850);
    float _2860 = _2750 * _2674;
    float _2862 = fma(_2842, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2854);
    bool _2864 = _2852 >= 0.0;
    float _2866 = fma(_2844, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2858);
    float _2868 = fma(_2842, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2856);
    float _2870 = _2840 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2872 = fma(_2844, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2862);
    float _2874 = _2866 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _2876 = _2852 <= 1.0;
    bool _2878 = _2876 && _2864;
    float _2880 = fma(_2844, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2868);
    float _2882 = fma(_2842, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2870);
    float _2884 = _2872 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2886 = _2874 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _2888 = _2860 >= 0.0;
    bool _2890 = _2888 && _2878;
    float _2892 = _2880 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2894 = fma(_2844, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2882);
    float _2896 = fma(_2884, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2886);
    bool _2898 = _2860 <= 1.0;
    bool _2900 = _2898 && _2890;
    float _2902 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2904 = _2892 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2906 = _2894 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2908 = fma(_2892, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2896);
    float _2910 = _2846;
    float _2912 = _2848;
    if (!_2406)
    {
        float _2914 = rint(_2660);
        float _2916 = precise::max(_2914, 0.0);
        uint _2918 = uint(_2916);
        uint _2920 = clamp(_2918, 0u, 65535u);
        _2910 = as_type<float>(_2920);
    }
    float _2922 = _2910;
    float _2924 = -_2904;
    float _2926 = fma(_2924, _2902, 1.0);
    float _2928 = _1974 * _2576;
    float _2930 = fma(_2906, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2908);
    float _2932 = _2874 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2934 = _2874 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2936 = fma(_1798, _2568, _2928);
    float _2938 = _2928;
    float _2940 = _2926;
    float _2942 = _2930;
    if (!_2406)
    {
        float _2944 = -_2636;
        float _2946 = _2034 + _2944;
        _1788 = _2946;
    }
    float _2948 = _1788;
    float _2950 = 1.0 / _2930;
    if (_2900)
    {
        float _2952 = float(_2306);
        _2938 = _2952;
    }
    float _2954 = _2938;
    float _2956 = fma(_2884, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2932);
    float _2958 = fma(_2884, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2934);
    float _2960 = fma(_1806, _2616, _2936);
    float _2962 = fma(_2892, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2956);
    float _2964 = fma(_2892, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2958);
    float _2966 = log2(_2926);
    float _2968 = _2960 + _2624;
    float _2970 = fma(_2906, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2962);
    float _2972 = fma(_2906, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2964);
    float _2974 = _2968 * _2674;
    float _2976 = _2954;
    float _2978 = _2970;
    if (_2900)
    {
        float _2980 = rint(_2954);
        float _2982 = precise::max(_2980, 0.0);
        uint _2984 = uint(_2982);
        uint _2986 = clamp(_2984, 0u, 65535u);
        _2976 = as_type<float>(_2986);
    }
    float _2988 = _2976;
    float _2990 = _2970 * _2950;
    float _2992 = _2972 * _2950;
    if (!_2406)
    {
        float _2994 = -_2602;
        float _2996 = _2276 + _2994;
        _2940 = _2996;
    }
    float _2998 = _2940;
    float _3000 = fma(_2990, 0.5, 0.5);
    float _3002 = fma(_2992, -0.5, 0.5);
    float _3004 = _2966 * 0.693147182464599609375;
    float _3006 = _2948;
    float _3008 = _3000;
    float _3010 = _3002;
    if (!_2406)
    {
        float3 _8651 = float3(_2998, _2948, float(as_type<int>(_2922)));
        float3 _8655 = select(_8651, float3(0.0), isnan(_8651));
        float _3012 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _8655.xy, uint(rint(_8655.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _8655.xy, uint(rint(_8655.z)), level(0.0)).x;
        _3006 = _3012;
    }
    float _3014 = _3006;
    float _3016 = _3004 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3018 = _2860;
    if (_2900)
    {
        float3 _8674 = float3(_2852, _2860, float(as_type<int>(_2988)));
        float3 _8676 = select(_8674, float3(0.0), isnan(_8674));
        float _3020 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _8676.xy, uint(rint(_8676.z)), _2974, level(0.0));
        _3018 = _3020;
    }
    float _3022 = _3018;
    float3 _8686 = float3(_3000, _3002, _3016);
    float _3024 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8686, float3(0.0), isnan(_8686)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8686, float3(0.0), isnan(_8686)), level(0.0)).x;
    float3 _8695 = float3(_3000, _3002, _3016);
    float4 _3027 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8695, float3(0.0), isnan(_8695)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8695, float3(0.0), isnan(_8695)), level(0.0)).xyzw;
    float _3029 = _3027.x;
    float _3031 = _3027.y;
    float _3033 = _3027.z;
    float _3035 = _3027.w;
    bool _3037 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _3039 = isnan(0.5);
    bool _3041 = _3037 || _3039;
    bool _3043 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3045 = _3041 || _3043;
    if (_2406)
    {
        _1826 = 1.0;
    }
    float _3047 = _1826;
    float _3049 = _3047;
    if (_3045)
    {
        _2682 = 1.0;
    }
    float _3051 = _2682;
    float _3053 = _3051;
    if (_3045)
    {
        _2912 = 1.0;
    }
    float _3055 = _2912;
    float _3057 = _3055;
    float _3059 = _3031;
    float _3061 = _3029;
    if (!_3045)
    {
        float _3063 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3065 = _3063 * 0.15915493667125701904296875;
        float _3067 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3069 = _3065 * 6.283185482025146484375;
        float _3071 = cos(_3069);
        float _3073 = _3067 * 0.15915493667125701904296875;
        float _3075 = _3065 * 6.283185482025146484375;
        float _3077 = sin(_3075);
        float _3079 = 1.0 / _3071;
        float _3081 = _3073 * 6.283185482025146484375;
        float _3083 = cos(_3081);
        float _3085 = _3077 * _3079;
        float _3087 = _3073 * 6.283185482025146484375;
        float _3089 = sin(_3087);
        float _3091 = _3083 * _3085;
        float _3093 = 1.0 / _3091;
        float _3095 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3097 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3095;
        float _3099 = 1.0 / _3097;
        float _3101 = _3089 * _3093;
        float _3103 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3105 = fma(_2248, _3101, _3103);
        float _3107 = _3105 * _3099;
        float _3109 = precise::clamp(_3107, 0.0, 1.0);
        _3008 = _3073;
        _3010 = _3099;
        _3057 = _3109;
    }
    float _3111 = _3008;
    float _3113 = _3010;
    float _3115 = _3057;
    float _3117 = _3111;
    float _3119 = _3113;
    if (!_3045)
    {
        float _3121 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3123 = _3121 * 0.15915493667125701904296875;
        float _3125 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3127 = _3123 * 6.283185482025146484375;
        float _3129 = cos(_3127);
        float _3131 = _3125 * 0.15915493667125701904296875;
        float _3133 = _3123 * 6.283185482025146484375;
        float _3135 = sin(_3133);
        float _3137 = 1.0 / _3129;
        float _3139 = _3131 * 6.283185482025146484375;
        float _3141 = cos(_3139);
        float _3143 = _3135 * _3137;
        float _3145 = _3131 * 6.283185482025146484375;
        float _3147 = sin(_3145);
        float _3149 = _3141 * _3143;
        float _3151 = 1.0 / _3149;
        float _3153 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3155 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _3153;
        float _3157 = 1.0 / _3155;
        float _3159 = _3147 * _3151;
        float _3161 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3163 = fma(_2248, _3159, _3161);
        float _3165 = _3163 * _3157;
        float _3167 = precise::clamp(_3165, 0.0, 1.0);
        float _3169 = -_3167;
        float _3171 = _3169 + 1.0;
        _3117 = _3137;
        _3053 = _3171;
    }
    float _3173 = _3117;
    float _3175 = _3053;
    float _3177 = _3173;
    if (!_2406)
    {
        int _3179 = _2436 << 4;
        int _3181 = _3179 + 2048;
        uint _3183 = uint(int(uint(_3181) >> uint(2)));
        uint _3185 = uint(int(uint(int(_3183)) >> uint(2)));
        int _3187 = int(_3183) & 3;
        float _3189 = (*spvDescriptorSet0.vp_c15)._m0[int(_3185)][_3187];
        int _3191 = int(_3183) + 1;
        uint _3193 = uint(int(uint(_3191) >> uint(2)));
        int _3195 = _3191 & 3;
        float _3197 = (*spvDescriptorSet0.vp_c15)._m0[int(_3193)][_3195];
        int _3199 = _3181 + 8;
        uint _3201 = uint(int(uint(_3199) >> uint(2)));
        uint _3203 = uint(int(uint(int(_3201)) >> uint(2)));
        int _3205 = int(_3201) & 3;
        float _3207 = (*spvDescriptorSet0.vp_c15)._m0[int(_3203)][_3205];
        int _3209 = int(_3201) + 1;
        uint _3211 = uint(int(uint(_3209) >> uint(2)));
        int _3213 = _3209 & 3;
        float _3215 = (*spvDescriptorSet0.vp_c15)._m0[int(_3211)][_3213];
        float _3217 = _1974 * _3197;
        float _3219 = fma(_1798, _3189, _3217);
        float _3221 = fma(_1806, _3207, _3219);
        float _3223 = _3221 + _3215;
        float _3225 = precise::clamp(_3223, 0.0, 1.0);
        float _3227 = -_3225;
        float _3229 = _3227 + _3014;
        float _3231 = fma(_3229, 500.0, 1.5);
        float _3233 = exp2(_3231);
        float _3235 = 0.0 + _3233;
        float _3237 = precise::clamp(_3235, 0.0, 1.0);
        _3049 = _3237;
    }
    float _3239 = _3049;
    float _3241 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3243 = _2840 + _3241;
    float _3245 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3247 = _2842 + _3245;
    float _3249 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3251 = _2844 + _3249;
    float _3253 = _3243 * _3243;
    float _3255 = fma(_3247, _3247, _3253);
    float _3257 = fma(_3251, _3251, _3255);
    float _3259 = rsqrt(_3257);
    float _3261 = _3259 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3263 = _3247 * _3261;
    float _3265 = _3251 * _3261;
    float _3267 = _3263 * _3263;
    float _3269 = _3265 * _3265;
    float _3271 = _3267 + _3269;
    float _3273 = sqrt(_3271);
    bool _3275 = _3273 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3277 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3279 = _3273 + _3277;
    float _3281 = _3259;
    float _3283 = _3279;
    float _3285 = _3261;
    if (_3275)
    {
        float _3287 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3281 = _3287;
    }
    float _3289 = _3281;
    if (_3275)
    {
        float _3291 = rsqrt(_3271);
        _1828 = _3291;
    }
    float _3293 = _1828;
    float _3295 = _3293;
    if (_3275)
    {
        float _3297 = _3279 * _3289;
        _3283 = _3297;
    }
    float _3299 = _3283;
    if (_3275)
    {
        float _3301 = _3299 * 0.15915493667125701904296875;
        _3119 = _3301;
    }
    float _3303 = _3119;
    float _3305 = _3289;
    if (_3275)
    {
        float _3307 = _3303 * 6.283185482025146484375;
        float _3309 = sin(_3307);
        _3305 = _3309;
    }
    float _3311 = _3305;
    float _3313 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3315 = precise::max(0.0, _3313);
    float _3317 = _3251;
    float _3319 = _3315;
    if (_3275)
    {
        float _3321 = _3303 * 6.283185482025146484375;
        float _3323 = cos(_3321);
        _3317 = _3323;
    }
    float _3325 = _3317;
    float _3327 = -_3261;
    float _3329 = -_3315;
    float _3331 = fma(_3243, _3327, _3329);
    float _3333 = _3331;
    if (_3275)
    {
        float _3335 = _3331 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3319 = _3335;
    }
    float _3337 = _3319;
    float _3339 = _3311;
    float _3341 = _3337;
    if (_3275)
    {
        float _3343 = fma(_3311, _3337, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3177 = _3343;
    }
    float _3345 = _3177;
    float _3347 = _3345;
    if (!_3275)
    {
        _3339 = _3263;
    }
    float _3349 = _3339;
    float _3351 = _3349;
    if (_3275)
    {
        float _3353 = _3325 + (-1.0);
        _3341 = _3353;
    }
    float _3355 = _3341;
    float _3357 = _3355;
    if (_3275)
    {
        float _3359 = _3293 * _3345;
        _3285 = _3359;
    }
    float _3361 = _3285;
    if (!_3275)
    {
        _3347 = _3267;
    }
    float _3363 = _3347;
    float _3365 = _3363;
    if (_3275)
    {
        float _3367 = _3355 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3295 = _3367;
    }
    float _3369 = _3295;
    float _3371 = _3369;
    if (_3275)
    {
        float _3373 = _3263 * _3361;
        _3351 = _3373;
    }
    float _3375 = _3351;
    if (!_3275)
    {
        _3357 = _3265;
    }
    float _3377 = _3357;
    float _3379 = _3377;
    if (_3275)
    {
        float _3381 = _3265 * _3361;
        _3379 = _3381;
    }
    float _3383 = _3379;
    if (_3275)
    {
        float _3385 = fma(_3331, _3325, _3369);
        _3333 = _3385;
    }
    float _3387 = _3333;
    if (_3275)
    {
        float _3389 = _3375 * _3375;
        _3365 = _3389;
    }
    float _3391 = _3365;
    float _3393 = sqrt(_3257);
    if (!_3275)
    {
        _3371 = _3269;
    }
    float _3395 = _3371;
    float _3397 = _3395;
    if (_3275)
    {
        float _3399 = _3383 * _3383;
        _3397 = _3399;
    }
    float _3401 = _3397;
    float _3403 = fma(_3387, _3387, _3391);
    float _3405 = _3403 + _3401;
    float _3407 = rsqrt(_3405);
    float _3409 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3411 = fma(_3393, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3409);
    float _3413 = precise::clamp(_3411, 0.0, 1.0);
    float _3415 = -_3413;
    float _3417 = _3415 + 1.0;
    float _3419 = abs(_3417);
    float _3421 = log2(_3419);
    float _3423 = _3407 * _3375;
    float _3425 = _3407 * _3387;
    float _3427 = _3407 * _3383;
    float _3429 = _3423 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3431 = -_3429;
    float _3433 = fma(_3425, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3431);
    float _3435 = -_3427;
    float _3437 = fma(_3435, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3433);
    float _3439 = _3421 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3441 = fma(_3437, -0.5, 0.5);
    float _3443 = fma(_3437, 0.5, 0.5);
    float _3445 = _3425 + 1.0;
    float _3447 = exp2(_3439);
    float _3449 = fma(_3443, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3451 = fma(_3443, _3449, -0.212114393711090087890625);
    float _3453 = sqrt(_3441);
    float _3455 = fma(_3443, _3451, 1.570728778839111328125);
    float _3457 = -_3425;
    float _3459 = fma(_3447, _3445, _3457);
    float _3461 = fma(_3459, 0.5, 0.5);
    float _3463 = _3453 * 0.636619746685028076171875;
    float _3465 = -_3455;
    float _3467 = fma(_3463, _3465, 1.0);
    float2 _9337 = float2(_3467, _3461);
    float3 _3471 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9337, float2(0.0), isnan(_9337)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9337, float2(0.0), isnan(_9337)), level(0.0)).xyz;
    float _3473 = _3471.x;
    float _3475 = _3471.y;
    float _3477 = _3471.z;
    float _3479 = abs(_2248);
    float _3481 = log2(_3479);
    float _3483 = _2184 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3485 = _2184 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3487 = _2184 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3489 = _219 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3491 = fma(_2208, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3483);
    float _3493 = fma(_2208, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3485);
    float _3495 = _2206 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3497 = _2206 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3499 = _2206 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3501 = fma(_2208, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3487);
    float _3503 = -_2162;
    float _3505 = fma(_3503, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3495);
    float _3507 = -_2162;
    float _3509 = fma(_3507, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3497);
    float _3511 = -_2162;
    float _3513 = fma(_3511, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3499);
    float _3515 = _2204 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3517 = fma(_2192, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3491);
    float _3519 = _3481 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3521 = _2874 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3523 = fma(_2210, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3505);
    float _3525 = fma(_2212, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3515);
    float _3527 = fma(_2210, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3509);
    float _3529 = fma(_2884, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3521);
    float _3531 = exp2(_3519);
    float _3533 = fma(_2210, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3513);
    float _3535 = _2204 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3537 = _2204 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3539 = _337 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3541 = _3489 * _3523;
    float _3543 = fma(_2192, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3493);
    float _3545 = fma(_2892, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3529);
    float _3547 = _3489 * _3527;
    float _3549 = _3489 * _3533;
    float _3551 = fma(_2212, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3535);
    float _3553 = fma(_2212, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3537);
    float _3555 = fma(_3539, _3517, _3541);
    float _3557 = _2930 * 0.5;
    float _3559 = fma(_2186, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3525);
    float _3561 = fma(_2186, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3551);
    float _3563 = fma(_2186, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3553);
    float _3565 = fma(_2972, -0.5, _3557);
    float _3567 = fma(_3539, _3543, _3547);
    float _3569 = fma(_3531, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3571 = precise::clamp(_3569, 0.0, 1.0);
    float _3573 = _3421 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3575 = _3561 + _3567;
    float _3577 = fma(_2906, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3545);
    float _3579 = fma(_3571, -2.0, 3.0);
    float _3581 = _3571 * _3571;
    bool _3583 = _2248 <= 8000.0;
    bool _3585 = isnan(_2248);
    bool _3587 = _3583 || _3585;
    bool _3589 = isnan(8000.0);
    bool _3591 = _3587 || _3589;
    float _3593 = float(_3591);
    float _3595 = exp2(_3573);
    out.gl_Position.x = _2970;
    out.gl_Position.y = _2972;
    out.gl_Position.z = _3577;
    out.gl_Position.w = _2930;
    float _3597 = _3581 * _3579;
    float _3599 = _3577 + _2930;
    float _3601 = -_1854;
    float _3603 = _3601 + 1.0;
    float _3605 = _2970 + _2930;
    float _3607 = fma(_2192, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3501);
    float _3609 = _3599 * 0.5;
    float _3611 = _3605 * 0.5;
    float _3613 = fma(_3539, _3607, _3549);
    float _3615 = _3559 + _3555;
    bool _3617 = _3393 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3619 = isnan(_3393);
    bool _3621 = _3617 || _3619;
    bool _3623 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3625 = _3621 || _3623;
    float _3627 = _3563 + _3613;
    float _3629 = -_3597;
    float _3631 = _3629 + 1.0;
    float _3633 = -_3595;
    float _3635 = _3633 + 1.0;
    if (!_2900)
    {
        _2978 = 1.0;
    }
    float _3637 = _2978;
    out.m_82.x = _3611;
    out.m_82.y = _3565;
    out.m_82.z = _3609;
    out.m_82.w = _2930;
    float _3639 = fma(_3631, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3597);
    float _3641 = _3637;
    if (_2900)
    {
        bool _3643 = _3022 >= _2974;
        bool _3645 = isnan(_3022);
        bool _3647 = _3643 || _3645;
        bool _3649 = isnan(_2974);
        bool _3651 = _3647 || _3649;
        float _3653 = float(_3651);
        _3641 = _3653;
    }
    float _3655 = _3641;
    float _3657 = _3635 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_84.x = _3615;
    out.m_84.y = _3575;
    out.m_84.z = _3627;
    float _3659 = _3593 * _3639;
    float _3661 = _3657 * _3024;
    float _3663 = _3655 * _3239;
    float _3665 = _3659 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3667 = -_3657;
    float _3669 = _3667 + 1.0;
    float _3671 = _3035 * _3661;
    float _3673 = _3669;
    if (!_3625)
    {
        _2942 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3675 = _2942;
    float _3677 = _3603 * _3665;
    float _3679 = precise::clamp(_3677, 0.0, 1.0);
    float _3681 = _3035 * _3669;
    float _3683 = _3675;
    float _3685 = _3675;
    if (!_3625)
    {
        _3673 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3687 = _3673;
    float _3689 = -_3679;
    float _3691 = fma(_3689, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3693 = -_3663;
    float _3695 = fma(_3693, _3691, 1.0);
    float _3697 = precise::clamp(_3695, 0.0, 1.0);
    float _3699 = _3691;
    float _3701 = _3687;
    float _3703 = _3687;
    if (!_3625)
    {
        _3699 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3705 = _3699;
    float _3707 = _3477 * _3661;
    float _3709 = fma(_3473, _3671, _3029);
    float _3711 = fma(_3475, _3671, _3031);
    float _3713 = _3697 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3715 = fma(_3035, _3707, _3033);
    float _3717 = _3115 * _3175;
    float _3719 = _3717;
    float _3721 = _3705;
    float _3723 = _3705;
    if (!_3625)
    {
        _3059 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3725 = _3059;
    out.m_86.x = _3713;
    float _3727 = _3717 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3729 = _3725;
    float _3731 = _3725;
    if (!_3625)
    {
        _3061 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3733 = _3061;
    out.m_88.x = _3709;
    out.m_88.y = _3711;
    out.m_88.z = _3715;
    out.m_88.w = _3681;
    float _3735 = _3733;
    float _3737 = _3733;
    if (!_3625)
    {
        _3719 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3739 = _3719;
    bool _3741 = !_3625;
    float _3743 = _3739;
    float _3745 = _3739;
    if (!_3741)
    {
        bool _3747 = _3393 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3749 = isnan(_3393);
        bool _3751 = _3747 || _3749;
        bool _3753 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3755 = _3751 || _3753;
        if (!_3755)
        {
            float _3757 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3759 = _3393 + _3757;
            float _3761 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3763 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3761;
            float _3765 = 1.0 / _3763;
            float _3767 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3769 = _3767 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3771 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3773 = _3771 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3775 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3777 = _3775 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3779 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3781 = _3779 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3783 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3785 = _3783 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3787 = _3759 * _3765;
            float _3789 = precise::clamp(_3787, 0.0, 1.0);
            float _3791 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3793 = _3791 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3795 = fma(_3789, _3769, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3797 = fma(_3789, _3793, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3799 = fma(_3789, _3773, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3801 = fma(_3789, _3777, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3803 = fma(_3789, _3781, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3805 = fma(_3789, _3785, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3737 = _3797;
            _3723 = _3803;
            _3731 = _3795;
            _3703 = _3801;
            _3685 = _3799;
            _3745 = _3805;
            _3807 = true;
        }
        else
        {
            bool _3809 = _3393 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3811 = isnan(_3393);
            bool _3813 = _3809 || _3811;
            bool _3815 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3817 = _3813 || _3815;
            if (!_3817)
            {
                _3729 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3819 = _3729;
            _3731 = _3819;
            if (!_3817)
            {
                _3735 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3821 = _3735;
            _3737 = _3821;
            if (!_3817)
            {
                _3683 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3823 = _3683;
            _3685 = _3823;
            if (!_3817)
            {
                _3701 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3825 = _3701;
            _3703 = _3825;
            if (!_3817)
            {
                _3721 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3827 = _3721;
            _3723 = _3827;
            if (!_3817)
            {
                _3743 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3829 = _3743;
            bool _3831 = !_3817;
            _3745 = _3829;
            if (!_3831)
            {
                bool _3833 = _3393 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3835 = isnan(_3393);
                bool _3837 = _3833 || _3835;
                bool _3839 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3841 = _3837 || _3839;
                if (!_3841)
                {
                    float _3843 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3845 = _3393 + _3843;
                    float _3847 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3849 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3847;
                    float _3851 = 1.0 / _3849;
                    float _3853 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3855 = _3853 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3857 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3859 = _3857 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3861 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3863 = _3861 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3865 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3867 = _3865 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3869 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3871 = _3869 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3873 = _3845 * _3851;
                    float _3875 = precise::clamp(_3873, 0.0, 1.0);
                    float _3877 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3879 = _3877 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3881 = fma(_3875, _3855, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3883 = fma(_3875, _3879, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3885 = fma(_3875, _3859, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3887 = fma(_3875, _3863, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3889 = fma(_3875, _3867, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3891 = fma(_3875, _3871, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3737 = _3883;
                    _3723 = _3889;
                    _3731 = _3881;
                    _3703 = _3887;
                    _3685 = _3885;
                    _3745 = _3891;
                    _3807 = true;
                }
                else
                {
                    _3737 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3723 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3731 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3703 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3685 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3745 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3807 = false;
    float _3893 = _3737;
    float _3895 = _3723;
    float _3897 = _3731;
    float _3899 = _3703;
    float _3901 = _3685;
    float _3903 = _3745;
    float _3905 = fma(_3575, -0.5, 0.5);
    float _3907 = precise::clamp(_3905, 0.0, 1.0);
    float _3909 = -_3893;
    float _3911 = _3909 + _3895;
    float _3913 = -_3897;
    float _3915 = _3913 + _3899;
    out.m_90.x = 0.0;
    float _3917 = fma(_3907, _3911, _3893);
    float _3919 = -_3901;
    float _3921 = _3919 + _3903;
    float _3923 = fma(_3907, _3915, _3897);
    float _3925 = _3917 * 0.586610972881317138671875;
    bool _3927 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3929 = fma(_3907, _3921, _3901);
    float _3931 = _3727 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3933 = fma(_3923, 0.298911988735198974609375, _3925);
    bool _3935 = _3115 > 0.0;
    bool _3937 = isnan(_3115);
    bool _3939 = _3935 || _3937;
    bool _3941 = isnan(0.0);
    bool _3943 = _3939 || _3941;
    float _3945 = fma(_3929, 0.114477999508380889892578125, _3933);
    out.m_59.x = _3931;
    bool _3947 = _3175 <= 0.0;
    bool _3949 = !_3943;
    bool _3951 = _3947 || _3949;
    float _3953 = -_3945;
    float _3955 = _3923 + _3953;
    float _3957 = -_3945;
    float _3959 = _3917 + _3957;
    float _3961 = -_3945;
    float _3963 = _3929 + _3961;
    float _3965 = fma(_3955, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3945);
    float _3967 = fma(_3959, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3945);
    float _3969 = fma(_3963, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3945);
    bool _3971 = !_3927;
    if (!_3971)
    {
        float _3973 = -_2840;
        float _3975 = _3973 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3977 = -_2842;
        float _3979 = _3977 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3981 = -_2844;
        float _3983 = _3981 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3985 = _3975 * _3975;
        float _3987 = fma(_3979, _3979, _3985);
        float _3989 = fma(_3983, _3983, _3987);
        float _3991 = sqrt(_3989);
        float _3993 = rsqrt(_3989);
        float _3995 = -_3991;
        float _3997 = _3995 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3999 = _3997 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4001 = precise::clamp(_3999, 0.0, 1.0);
        float _4003 = _3979 * _3993;
        float _4005 = _3975 * _3993;
        float _4007 = abs(_4001);
        float _4009 = log2(_4007);
        float _4011 = _3983 * _3993;
        float _4013 = _4003 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4015 = _3575 * _4005;
        float _4017 = -_4005;
        float _4019 = -_4013;
        float _4021 = fma(_4017, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4019);
        float _4023 = fma(_3615, _4003, _4015);
        float _4025 = -_4011;
        float _4027 = fma(_4025, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4021);
        float _4029 = fma(_3627, _4011, _4023);
        float _4031 = precise::clamp(_4029, 0.0, 1.0);
        float _4033 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4035 = _4027 + _4033;
        float _4037 = _4009 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4039 = _4035 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4041 = precise::clamp(_4039, 0.0, 1.0);
        float _4043 = exp2(_4037);
        float _4045 = _4043 * _4041;
        float _4047 = _4031 * _4045;
        float _4049 = _4047 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4051 = _4047 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4053 = _4047 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_90.x = _4049;
        out.m_90.y = _4051;
        out.m_90.z = _4053;
    }
    out.m_92.x = _3965;
    out.m_92.y = _3967;
    out.m_92.z = _3969;
    if (!_3951)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _4055 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_59.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4055;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

