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
    float4 m_80 [[user(locn0)]];
    float4 m_86 [[user(locn1)]];
    float4 m_82 [[user(locn2)]];
    float4 m_92 [[user(locn3)]];
    float4 m_100 [[user(locn4)]];
    float4 m_61 [[user(locn5)]];
    float4 m_88 [[user(locn6)]];
    float4 m_90 [[user(locn7)]];
    float4 m_98 [[user(locn8)]];
    float4 m_94 [[user(locn9)]];
    float4 m_96 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_72 [[attribute(1)]];
    float4 m_74 [[attribute(2)]];
    float4 m_76 [[attribute(3)]];
    float4 m_84 [[attribute(4)]];
    float4 m_70 [[attribute(5)]];
    float4 m_58 [[attribute(6)]];
    float4 m_63 [[attribute(7)]];
    float4 m_65 [[attribute(8)]];
    float4 m_78 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3941 = false;
    bool _2486 = false;
    bool _961 = false;
    bool _769 = false;
    bool _393 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _114 = in.m_58.w;
    float _116 = trunc(_114);
    int _119 = int(_116);
    bool _123 = _119 >= 1;
    float _125 = 0.0;
    if (!_123)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _127 = _125;
    float _129 = _127;
    if (!_123)
    {
        out.m_61.x = 0.0;
    }
    int _131 = 0;
    if (!_123)
    {
        float _133 = _127 * 5.0;
        _131 = as_type<int>(_133);
    }
    int _135 = _131;
    int _137 = _135;
    if (!_123)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4246 = as_type<float>(_135);
        out.gl_Position.z = _4246;
    }
    if (!_123)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _139 = in.m_63.w;
    bool _141 = _139 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _143 = isnan(_139);
    bool _145 = _141 || _143;
    bool _147 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _149 = _145 || _147;
    float _151 = -_139;
    float _153 = _151 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _155 = _153;
    if (_149)
    {
        float _157 = float(_119);
        _129 = _157;
    }
    float _159 = _129;
    bool _161 = _153 >= _159;
    bool _163 = !_149;
    bool _165 = _161 || _163;
    float _167 = _159;
    if (_165)
    {
        _167 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _169 = _167;
    if (_165)
    {
        out.m_61.x = 0.0;
    }
    if (_165)
    {
        float _171 = _169 * 5.0;
        _137 = as_type<int>(_171);
    }
    int _173 = _137;
    if (_165)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4316 = as_type<float>(_173);
        out.gl_Position.z = _4316;
    }
    if (_165)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _175 = in.m_65.x;
    float _177 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _179 = _153 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _181 = _153 + (*spvDescriptorSet0.vp_c9)._m0[20].w;
    float _183 = as_type<float>(int(gl_VertexIndex));
    float _185 = in.m_70.x;
    float _187 = in.m_70.y;
    float _189 = in.m_70.z;
    float _191 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].w;
    float _193 = in.m_72.x;
    float _195 = in.m_72.y;
    float _197 = in.m_72.z;
    float _199 = in.m_74.x;
    float _201 = in.m_74.y;
    float _203 = in.m_74.z;
    float _205 = _179 * _177;
    float _207 = in.m_76.x;
    float _209 = in.m_76.y;
    float _211 = in.m_76.z;
    float _213 = fma(_175, (*spvDescriptorSet0.vp_c9)._m0[20].x, _205);
    float _215 = _181 * _191;
    float _217 = floor(_213);
    float _219 = fma(_175, (*spvDescriptorSet0.vp_c9)._m0[20].y, _215);
    float _221 = _213 * 6.283185482025146484375;
    int _223 = as_type<int>(_183) & 1;
    bool _225 = _223 != 0;
    int _227 = as_type<int>(_183) & 2;
    bool _229 = _227 != 0;
    int _231 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _233 = _231 != 0;
    float _235 = _221 * 0.15915493667125701904296875;
    float _237 = floor(_219);
    float _239 = _187 * _195;
    float _241 = _187 * _201;
    float _243 = fma(_185, _193, _239);
    float _245 = -_217;
    float _247 = _213 + _245;
    float _249 = _219 * 6.283185482025146484375;
    float _251 = _187 * _209;
    float _253 = _235 * 6.283185482025146484375;
    float _255 = cos(_253);
    float _257 = fma(_185, _199, _241);
    float _259 = _249 * 0.15915493667125701904296875;
    float _261 = fma(_185, _207, _251);
    float _263 = -_237;
    float _265 = _219 + _263;
    float _267 = -_247;
    float _269 = fma(_267, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _271 = !_229;
    float _273 = _271 ? (-0.5) : 0.5;
    float _275 = _259 * 6.283185482025146484375;
    float _277 = cos(_275);
    int _279 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _281 = _279 != 0;
    int _283 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _285 = _283 != 0;
    float _287 = fma(_189, _203, _257);
    bool _289 = _247 < 0.5;
    float _291 = float(_289);
    bool _293 = !_233;
    int _295 = _293 ? 0 : 1;
    bool _297 = !_281;
    int _299 = _297 ? 0 : 1;
    float _301 = fma(_255, 0.5, 0.5);
    float _303 = -_291;
    float _305 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _307 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _309 = abs(_299);
    float _311 = -_301;
    float _313 = fma(_311, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _315 = abs(_295);
    float _317 = -_265;
    float _319 = fma(_317, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    bool _321 = !_285;
    int _323 = _321 ? 0 : 1;
    float _325 = fma(_277, 0.5, 0.5);
    float _327 = float(_309);
    bool _329 = _265 < 0.5;
    float _331 = float(_329);
    float _333 = float(_315);
    float _335 = abs(_319);
    float _337 = _327 * _335;
    int _339 = abs(_323);
    float _341 = abs(_269);
    float _343 = _327 * _341;
    float _345 = -_325;
    float _347 = fma(_345, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _349 = -_331;
    float _351 = fma(_349, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _353 = float(_339);
    float _355 = fma(_333, _313, _343);
    float _357 = fma(_333, _347, _337);
    float _359 = fma(_189, _197, _243);
    float _361 = fma(_189, _211, _261);
    float _363 = abs(_305);
    float _365 = fma(_353, _363, _355);
    float _367 = abs(_351);
    float _369 = fma(_353, _367, _357);
    bool _371 = !_225;
    float _373 = _371 ? (-0.5) : 0.5;
    bool _375 = !_307;
    float _391;
    if (!_375)
    {
        float _377 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _379 = _175 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _381 = fma(_379, (*spvDescriptorSet0.vp_c9)._m0[12].x, _153);
        float _383 = _381 * _377;
        float _385 = floor(_383);
        float _387 = -_385;
        float _389 = _383 + _387;
        _391 = _389;
        _393 = true;
    }
    else
    {
        float _395 = float(_119);
        float _397 = 1.0 / _395;
        float _399 = _153 * _397;
        _391 = _399;
    }
    _393 = false;
    float _401 = _391;
    float _403 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _405 = _401 + _403;
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _409 = _401 + _407;
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _413 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _411;
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _417 = _415 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _421 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _419;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _425 = _423 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _427 = 1.0 / _413;
    float _429 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _431 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _429;
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _435 = _433 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _437 = 1.0 / _417;
    float _439 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _441 = _401 + _439;
    bool _443 = _401 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _445 = isnan(_401);
    bool _447 = _443 || _445;
    bool _449 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _451 = _447 || _449;
    float _453 = float(_451);
    bool _455 = _401 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _457 = isnan(_401);
    bool _459 = _455 || _457;
    bool _461 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _463 = _459 || _461;
    float _465 = float(_463);
    bool _467 = _401 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _469 = isnan(_401);
    bool _471 = _467 || _469;
    bool _473 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _475 = _471 || _473;
    float _477 = float(_475);
    float _479 = -_453;
    float _481 = _479 + 1.0;
    float _483 = 1.0 / _421;
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _487 = (*spvDescriptorSet0.vp_c9)._m0[150].w + _485;
    float _489 = _441 * _427;
    bool _491 = _401 >= (*spvDescriptorSet0.vp_c9)._m0[150].w;
    bool _493 = isnan(_401);
    bool _495 = _491 || _493;
    bool _497 = isnan((*spvDescriptorSet0.vp_c9)._m0[150].w);
    bool _499 = _495 || _497;
    float _501 = float(_499);
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _505 = _401 + _503;
    float _507 = 1.0 / _425;
    float _509 = _405 * _437;
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _513 = _401 + _511;
    float _515 = -_501;
    float _517 = _515 + 1.0;
    bool _519 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _521 = 1.0 / _431;
    float _523 = _409 * _483;
    bool _525 = _401 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _527 = isnan(_401);
    bool _529 = _525 || _527;
    bool _531 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _533 = _529 || _531;
    float _535 = float(_533);
    float _537 = 1.0 / _487;
    float _539 = _505 * _507;
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _543 = _401 + _541;
    float _545 = 1.0 / _435;
    float _547 = _513 * _521;
    bool _549 = _401 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _551 = isnan(_401);
    bool _553 = _549 || _551;
    bool _555 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _557 = _553 || _555;
    float _559 = float(_557);
    float _561 = _535 * _517;
    float _563 = -_535;
    float _565 = _563 + 1.0;
    float _567 = _543 * _537;
    bool _569 = _401 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _571 = isnan(_401);
    bool _573 = _569 || _571;
    bool _575 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _577 = _573 || _575;
    float _579 = float(_577);
    float _581 = _559 * _565;
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _585 = _401 + _583;
    float _587 = -_559;
    float _589 = _587 + 1.0;
    float _591 = -_579;
    float _593 = _591 + 1.0;
    float _595 = _585 * _545;
    float _597 = _579 * _589;
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _601 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _599;
    float _603 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _605 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _603;
    float _607 = _453 * _593;
    float _609 = -_465;
    float _611 = _609 + 1.0;
    float _613 = fma(_601, _489, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _615 = fma(_605, _489, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _617 = _401 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _619 = isnan(_401);
    bool _621 = _617 || _619;
    bool _623 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _625 = _621 || _623;
    float _627 = float(_625);
    float _629 = _465 * _481;
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _633 = _631 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _635 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _637 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _635;
    float _639 = -_627;
    float _641 = _639 + 1.0;
    float _643 = _627 * _611;
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _647 = _645 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _649 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _651 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _649;
    float _653 = _477 * _641;
    float _655 = -_477;
    float _657 = _655 + 1.0;
    float _659 = fma(_633, _509, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _661 = fma(_647, _509, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _663 = _613 * _653;
    float _665 = _615 * _653;
    float _667 = fma(_651, _523, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _669 = fma(_637, _523, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _671 = fma(_657, (*spvDescriptorSet0.vp_c9)._m0[143].x, _663);
    float _673 = fma(_657, (*spvDescriptorSet0.vp_c9)._m0[143].y, _665);
    float _675 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _677 = _675 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _679 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _681 = _679 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _683 = fma(_659, _643, _671);
    float _685 = fma(_661, _643, _673);
    float _687 = fma(_677, _539, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _689 = fma(_681, _539, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _693 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _691;
    float _695 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _697 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _695;
    float _699 = fma(_667, _629, _683);
    float _701 = fma(_669, _629, _685);
    float _703 = fma(_693, _547, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _705 = fma(_697, _547, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _707 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _709 = _707 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _711 = fma(_687, _607, _699);
    float _713 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _715 = _713 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _717 = fma(_689, _607, _701);
    float _719 = fma(_709, _595, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _721 = -(*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _723 = (*spvDescriptorSet0.vp_c9)._m0[150].x + _721;
    float _725 = fma(_703, _597, _711);
    float _727 = fma(_715, _595, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _729 = -(*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _731 = (*spvDescriptorSet0.vp_c9)._m0[150].y + _729;
    float _733 = fma(_705, _597, _717);
    float _735 = fma(_723, _567, (*spvDescriptorSet0.vp_c9)._m0[149].x);
    float _737 = fma(_719, _581, _725);
    float _739 = fma(_731, _567, (*spvDescriptorSet0.vp_c9)._m0[149].y);
    float _741 = fma(_727, _581, _733);
    float _743 = fma(_735, _561, _737);
    float _745 = fma(_739, _561, _741);
    float _747 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[150].x, _743);
    float _749 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[150].y, _745);
    bool _751 = !_519;
    float _767;
    if (!_751)
    {
        float _753 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _755 = _175 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _757 = fma(_755, (*spvDescriptorSet0.vp_c9)._m0[11].x, _153);
        float _759 = _757 * _753;
        float _761 = floor(_759);
        float _763 = -_761;
        float _765 = _759 + _763;
        _767 = _765;
        _769 = true;
    }
    else
    {
        float _771 = float(_119);
        float _773 = 1.0 / _771;
        float _775 = _153 * _773;
        _767 = _775;
    }
    _769 = false;
    float _777 = _767;
    float _779 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _781 = _777 + _779;
    bool _783 = _777 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _785 = isnan(_777);
    bool _787 = _783 || _785;
    bool _789 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _791 = _787 || _789;
    float _793 = float(_791);
    float _795 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _797 = _777 + _795;
    float _799 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _801 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _799;
    float _803 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _805 = _803 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _807 = 1.0 / _801;
    bool _809 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _811 = 1.0 / _805;
    float _813 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _815 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _813;
    float _817 = _781 * _807;
    bool _819 = _777 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _821 = isnan(_777);
    bool _823 = _819 || _821;
    bool _825 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _827 = _823 || _825;
    float _829 = float(_827);
    float _831 = -_793;
    float _833 = _831 + 1.0;
    bool _835 = _777 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _837 = isnan(_777);
    bool _839 = _835 || _837;
    bool _841 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _843 = _839 || _841;
    float _845 = float(_843);
    float _847 = fma(_815, _817, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _849 = _845 * _833;
    float _851 = -_845;
    float _853 = _851 + 1.0;
    float _855 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _857 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _855;
    float _859 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _861 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _859;
    float _863 = _797 * _811;
    float _865 = _829 * _853;
    float _867 = fma(_857, _817, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _869 = fma(_861, _817, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _871 = -_829;
    float _873 = _871 + 1.0;
    float _875 = _847 * _865;
    float _877 = _867 * _865;
    float _879 = _869 * _865;
    float _881 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _883 = _881 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _885 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _887 = _885 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _889 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _891 = _889 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _893 = fma(_873, (*spvDescriptorSet0.vp_c9)._m0[107].x, _877);
    float _895 = fma(_873, (*spvDescriptorSet0.vp_c9)._m0[107].y, _875);
    float _897 = fma(_883, _863, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _899 = fma(_887, _863, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _901 = fma(_891, _863, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _903 = fma(_873, (*spvDescriptorSet0.vp_c9)._m0[107].z, _879);
    float _905 = fma(_897, _849, _893);
    float _907 = fma(_899, _849, _895);
    float _909 = in.m_78.x;
    float _911 = in.m_78.y;
    float _913 = fma(_901, _849, _903);
    float _915 = fma(_793, (*spvDescriptorSet0.vp_c9)._m0[109].x, _905);
    float _917 = fma(_793, (*spvDescriptorSet0.vp_c9)._m0[109].y, _907);
    float _919 = fma(_793, (*spvDescriptorSet0.vp_c9)._m0[109].z, _913);
    float _921 = _915 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _923 = _917 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _925 = _919 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _927 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _929 = _921 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _931 = _923 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _933 = _925 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_80.x = _929;
    out.m_80.y = _931;
    out.m_80.z = _933;
    out.m_80.w = _927;
    float _935 = _749 * _911;
    float _937 = _747 * _909;
    bool _939 = !_809;
    float _957;
    float _959;
    if (!_939)
    {
        float _941 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _943 = _175 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _945 = float(_119);
        float _947 = fma(_943, (*spvDescriptorSet0.vp_c9)._m0[11].z, _153);
        float _949 = _947 * _941;
        float _951 = floor(_949);
        float _953 = -_951;
        float _955 = _949 + _953;
        _957 = _945;
        _959 = _955;
        _961 = true;
    }
    else
    {
        float _963 = float(_119);
        float _965 = 1.0 / _963;
        float _967 = _153 * _965;
        _957 = _963;
        _959 = _967;
    }
    _961 = false;
    float _969 = _957;
    float _971 = _959;
    float _973 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _975 = int(_973);
    float _977 = in.m_72.w;
    float _979 = in.m_76.w;
    float _981 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _983 = int(_981);
    float _985 = in.m_74.w;
    float _987 = float(_975);
    float _989 = 1.0 / _987;
    float _991 = float(uint(_983));
    int _993 = ~_983;
    int _995 = _993 + 1;
    int _997 = ~_983;
    int _999 = _997 + 1;
    float _1001 = 1.0 / _991;
    float _1003 = _989 * _153;
    float _1005 = trunc(_1003);
    int _1007 = int(_1005);
    int _1009 = as_type<int>(_1001) + (-2);
    float _1011 = float(uint(_1007));
    float _1013 = as_type<float>(_1009) * _1011;
    float _1015 = trunc(_1013);
    float _1017 = precise::max(_1015, 0.0);
    uint _1020 = uint(_1017);
    int _1022 = _995 * int(_1020);
    int _1024 = _1022 + _1007;
    float _1026 = float(uint(_1024));
    float _1028 = as_type<float>(_1009) * _1026;
    int _1030 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1032 = _1030 != 0;
    float _1034 = 1.0 / _969;
    bool _1036 = !_1032;
    float _1038 = _1036 ? 7.345489978790283203125 : 1.0;
    float _1040 = trunc(_1028);
    float _1042 = precise::max(_1040, 0.0);
    uint _1044 = uint(_1042);
    float _1046 = _1038 * _175;
    float _1048 = floor(_1046);
    int _1050 = int(_1020) + int(_1044);
    float _1052 = float(_983);
    float _1054 = float(_1007);
    int _1056 = _999 * _1050;
    int _1058 = _1056 + _1007;
    bool _1060 = _1054 >= _1052;
    bool _1062 = isnan(_1054);
    bool _1064 = _1060 || _1062;
    bool _1066 = isnan(_1052);
    bool _1068 = _1064 || _1066;
    float _1070 = float(_1068);
    float _1072 = -_1048;
    float _1074 = _1046 + _1072;
    bool _1076 = uint(_1058) >= uint(_983);
    float _1078 = _1074 * _1052;
    float _1080 = trunc(_1070);
    int _1082 = int(_1080);
    bool _1084 = !_1076;
    int _1086 = _1084 ? 0 : (-1);
    float _1088 = _1052 * _153;
    int _1090 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1092 = _1090 != 0;
    int _1094 = ~_1050;
    int _1096 = _1094 + _1086;
    int _1098 = _1096 + 1;
    float _1100 = _1088 * _1034;
    bool _1102 = !_1092;
    int _1104 = _1102 ? 0 : 1;
    float _1106 = trunc(_1078);
    int _1108 = int(_1106);
    bool _1110 = _983 == 0;
    int _1112 = abs(_1104);
    int _1114 = _983 * _1098;
    int _1116 = _1114 + _1007;
    int _1118 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1120 = _1118 != 0;
    int _1122 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1124 = _1122 != 0;
    int _1126 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1128 = _1126 != 0;
    int _1130 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1132 = _1130 != 0;
    float _1134 = trunc(_1100);
    int _1136 = int(_1134);
    int _1138 = ~_1082;
    int _1140 = _1138 + 1;
    int _1142 = _1140 + 1;
    bool _1144 = !_1110;
    int _1146 = _1144 ? _1116 : (-1);
    int _1148 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1150 = _1148 != 0;
    int _1152 = _1146 * _1142;
    bool _1154 = !_1124;
    int _1156 = _1154 ? 0 : 1;
    int _1158 = _1108 * _1112;
    int _1160 = _1158 + _1007;
    bool _1162 = !_1120;
    int _1164 = _1162 ? 0 : 1;
    int _1166 = _983 + (-1);
    int _1168 = abs(_1156);
    int _1170 = abs(_1164);
    int _1172 = _1082 * _1166;
    int _1174 = _1172 + _1152;
    bool _1176 = !_1128;
    int _1178 = _1176 ? 0 : 1;
    bool _1180 = !_1132;
    int _1182 = _1180 ? 0 : 1;
    int _1184 = abs(_1178);
    int _1186 = _1174 * _1168;
    float _1188 = in.m_58.x;
    float _1190 = in.m_58.y;
    float _1192 = in.m_58.z;
    int _1194 = abs(_1182);
    int _1196 = _1136 * _1170;
    int _1198 = _1196 + _1186;
    int _1200 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1202 = _1200 != 0;
    int _1204 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1206 = _1204 != 0;
    int _1208 = _1160 * _1184;
    int _1210 = _1208 + _1198;
    float _1212 = in.m_65.y;
    bool _1214 = _175 > 0.5;
    int _1216 = _1108 * _1194;
    int _1218 = _1216 + _1210;
    float _1220 = _175 * 2.0;
    float _1222 = float(uint(_1218));
    float _1224 = floor(_1220);
    float _1226 = as_type<float>(_1009) * _1222;
    float _1228 = _195 * _1190;
    float _1230 = _201 * _1190;
    float _1232 = trunc(_1226);
    float _1234 = precise::max(_1232, 0.0);
    uint _1236 = uint(_1234);
    float _1238 = _209 * _1190;
    float _1240 = fma(_193, _1188, _1228);
    float _1242 = fma(_199, _1188, _1230);
    float _1244 = fma(_207, _1188, _1238);
    float _1246 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1248 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1246;
    int _1250 = ~_983;
    int _1252 = _1250 + 1;
    float _1254 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1256 = _1254 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1258 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1260 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1262 = in.m_65.z;
    float _1264 = 1.0 / _1248;
    float _1266 = _175 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1268 = _1224 > 0.0;
    int _1270 = _1252 * int(_1236);
    int _1272 = _1270 + _1218;
    bool _1274 = _1224 >= 0.0;
    bool _1276 = isnan(_1224);
    bool _1278 = _1274 || _1276;
    bool _1280 = isnan(0.0);
    bool _1282 = _1278 || _1280;
    float _1284 = -_1258;
    float _1286 = fma(_1266, 2.0, _1284);
    float _1288 = _1212 * 2.0;
    float _1290 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1292 = _971 + _1290;
    float _1294 = 1.0 / _1256;
    float _1296 = float(uint(_1272));
    float _1298 = _1212 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1300 = -_153;
    float _1302 = fma(_1300, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1286);
    float _1304 = as_type<float>(_1009) * _1296;
    int _1306 = _1282 ? 0 : 1;
    float _1308 = floor(_1288);
    float _1310 = -_373;
    int _1312 = _1214 ? as_type<int>(_1310) : as_type<int>(_373);
    float _1314 = _1292 * _1264;
    bool _1316 = _1212 > 0.5;
    float _1318 = fma(_1298, -2.0, _1260);
    bool _1320 = !_1206;
    float _1322 = _1320 ? _373 : as_type<float>(_1312);
    float _1324 = fma(_203, _1192, _1242);
    float _1326 = -_273;
    int _1328 = _1316 ? as_type<int>(_1326) : as_type<int>(_273);
    float _1330 = trunc(_1304);
    float _1332 = precise::max(_1330, 0.0);
    uint _1334 = uint(_1332);
    int _1336 = ~_1306;
    int _1338 = _1336 + 1;
    int _1340 = _1338 + 1;
    float _1342 = _1324 + _985;
    int _1344 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1346 = _1344 != 0;
    int _1348 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1350 = _1348 != 0;
    int _1352 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1354 = _1352 != 0;
    float _1356 = fma(_197, _1192, _1240);
    int _1358 = _1340;
    float _1360 = _1342;
    if (!_1268)
    {
        int _1362 = ~_1306;
        int _1364 = _1362 + 1;
        _1358 = _1364;
    }
    int _1366 = _1358;
    float _1368 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1370 = _971 + _1368;
    float _1372 = _175 + _1212;
    bool _1374 = _1308 >= 0.0;
    bool _1376 = isnan(_1308);
    bool _1378 = _1374 || _1376;
    bool _1380 = isnan(0.0);
    bool _1382 = _1378 || _1380;
    float _1384 = fma(_211, _1192, _1244);
    float _1386 = _1212 + _1262;
    float _1388 = _1370 * _1294;
    int _1390 = _1382 ? 0 : 1;
    float _1392 = _1372 + (-1.0);
    float _1394 = _1386 + (-1.0);
    bool _1396 = _1308 > 0.0;
    float _1398 = _1262 * 2.0;
    int _1400 = int(_1236) + int(_1334);
    float _1402 = _1384 + _979;
    float _1404 = floor(_1398);
    int _1406 = ~_983;
    int _1408 = _1406 + 1;
    float _1410 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1318);
    float _1412 = fma(_1394, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1414 = ~_1390;
    int _1416 = _1414 + 1;
    int _1418 = _1416 + 1;
    int _1420 = _1408 * _1400;
    int _1422 = _1420 + _1218;
    float _1424 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1426 = log2(_1424);
    float _1428 = fma(_1392, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1430 = !_1150;
    float _1432 = _1430 ? _273 : as_type<float>(_1328);
    float _1434 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1436 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1434;
    bool _1438 = uint(_1422) >= uint(_983);
    int _1440 = _1418;
    float _1442 = _1412;
    if (!_1396)
    {
        int _1444 = ~_1390;
        int _1446 = _1444 + 1;
        _1440 = _1446;
    }
    int _1448 = _1440;
    float _1450 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1452 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1450;
    bool _1454 = !_1438;
    int _1456 = _1454 ? 0 : (-1);
    float _1458 = fma(_1452, _1314, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    bool _1460 = _1404 > 0.0;
    bool _1462 = _1404 >= 0.0;
    bool _1464 = isnan(_1404);
    bool _1466 = _1462 || _1464;
    bool _1468 = isnan(0.0);
    bool _1470 = _1466 || _1468;
    float _1472 = _1322 + 0.5;
    float _1474 = _1426 * _153;
    float _1476 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1478 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1476;
    float _1480 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1482 = _1480 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1484 = fma(_1472, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1302);
    float _1486 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1488 = _1486 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1490 = _1356 + _977;
    float _1492 = exp2(_1474);
    float _1494 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1496 = _1494 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1498 = fma(_1478, _1314, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1500 = fma(_1436, _1314, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1502 = fma(_1482, _1388, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    int _1504 = ~_1400;
    int _1506 = _1504 + _1456;
    int _1508 = _1506 + 1;
    float _1510 = fma(_1488, _1388, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1512 = fma(_1496, _1388, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1514 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1516 = 1.0 + _1514;
    bool _1518 = _971 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1520 = isnan(_971);
    bool _1522 = _1518 || _1520;
    bool _1524 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1526 = _1522 || _1524;
    float _1528 = float(_1526);
    int _1530 = _983 * _1508;
    int _1532 = _1530 + _1218;
    int _1534 = _1470 ? 0 : 1;
    float _1536 = 1.0 / _1516;
    bool _1538 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1540 = isnan(0.0);
    bool _1542 = _1538 || _1540;
    bool _1544 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1546 = _1542 || _1544;
    float _1548 = -_1528;
    float _1550 = _1548 + 1.0;
    float _1552 = -_1492;
    float _1554 = _1552 + 1.0;
    bool _1556 = _971 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1558 = isnan(_971);
    bool _1560 = _1556 || _1558;
    bool _1562 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1564 = _1560 || _1562;
    float _1566 = float(_1564);
    float _1568 = _1546 ? _1554 : 0.0;
    float _1570 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1572 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1574 = isnan(1.0);
    bool _1576 = _1572 || _1574;
    bool _1578 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1580 = _1576 || _1578;
    float _1582 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1584 = _971 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1586 = isnan(_971);
    bool _1588 = _1584 || _1586;
    bool _1590 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1592 = _1588 || _1590;
    float _1594 = float(_1592);
    float _1596 = _1566 * _1550;
    float _1598 = -_1566;
    float _1600 = _1598 + 1.0;
    float _1602 = float(uint(_1160));
    float _1604 = fma(_1212, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1570);
    float _1606 = fma(_175, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1582);
    float _1608 = _1594 * _1600;
    bool _1610 = !_1110;
    int _1612 = _1610 ? _1532 : (-1);
    float _1614 = as_type<float>(_1009) * _1602;
    float _1616 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1606);
    float _1618 = _1498 * _1608;
    float _1620 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1604);
    int _1622 = _1612 >> 31;
    if (_1580)
    {
        float _1624 = _1568 * _1536;
        _155 = _1624;
    }
    float _1626 = _155;
    float _1628 = _1432 + (-0.5);
    float _1630 = _1458 * _1608;
    float _1632 = _1500 * _1608;
    int _1634 = ~_983;
    int _1636 = _1634 + 1;
    float _1638 = trunc(_1614);
    float _1640 = precise::max(_1638, 0.0);
    uint _1642 = uint(_1640);
    int _1644 = _1622 & 3;
    float _1646 = -_1628;
    float _1648 = -_1410;
    float _1650 = fma(_1646, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1648);
    float _1652 = -_1594;
    float _1654 = _1652 + 1.0;
    int _1656 = _1612 + _1644;
    float _1658 = -_1616;
    float _1660 = _1658 + 1.0;
    int _1662 = ~_1534;
    int _1664 = _1662 + 1;
    int _1666 = _1664 + 1;
    float _1668 = fma(_1654, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1618);
    int _1670 = _1656 >> 2;
    float _1672 = fma(_1654, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1630);
    float _1674 = fma(_1654, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1632);
    int _1676 = _1666;
    if (!_1460)
    {
        int _1678 = ~_1534;
        int _1680 = _1678 + 1;
        _1676 = _1680;
    }
    int _1682 = _1676;
    float _1684 = fma(_1502, _1596, _1668);
    int _1686 = _1670 << 4;
    int _1688 = _1686 + 368;
    float _1690 = -_1660;
    float _1692 = fma(_1322, _1690, _1484);
    bool _1694 = !_1350;
    int _1696 = _1694 ? 0 : 1;
    int _1698 = _1636 * int(_1642);
    int _1700 = _1698 + _1160;
    uint _1702 = uint(int(uint(_1688) >> uint(2)));
    uint _1704 = uint(int(uint(int(_1702)) >> uint(2)));
    int _1706 = int(_1702) & 3;
    float _1708 = (*spvDescriptorSet0.vp_c9)._m0[int(_1704)][_1706];
    int _1710 = int(_1702) + 1;
    uint _1712 = uint(int(uint(_1710) >> uint(2)));
    int _1714 = _1710 & 3;
    float _1716 = (*spvDescriptorSet0.vp_c9)._m0[int(_1712)][_1714];
    float _1718 = fma(_1510, _1596, _1672);
    int _1720 = abs(_1696);
    float _1722 = fma(_1512, _1596, _1674);
    float _1724 = float(uint(_1700));
    float _1726 = -_1620;
    float _1728 = _1726 + 1.0;
    float _1730 = _1212 + (-0.5);
    int _1732 = _1612 & 3;
    bool _1734 = _1732 != 0;
    float _1736 = as_type<float>(_1009) * _1724;
    float _1738 = float(_1366);
    float _1740 = fma(_1432, _1728, _1650);
    float _1742 = float(_1720);
    float _1744 = trunc(_1736);
    float _1746 = precise::max(_1744, 0.0);
    uint _1748 = uint(_1746);
    bool _1750 = !_1346;
    int _1752 = _1750 ? 0 : 1;
    bool _1754 = uint(_1732) > 1u;
    float _1756 = _1742 * _1738;
    int _1758 = abs(_1752);
    out.m_82.x = _1692;
    out.m_82.y = _1740;
    int _1760 = _1688 + 8;
    uint _1762 = uint(int(uint(_1760) >> uint(2)));
    uint _1764 = uint(int(uint(int(_1762)) >> uint(2)));
    int _1766 = int(_1762) & 3;
    float _1768 = (*spvDescriptorSet0.vp_c9)._m0[int(_1764)][_1766];
    int _1770 = int(_1762) + 1;
    uint _1772 = uint(int(uint(_1770) >> uint(2)));
    int _1774 = _1770 & 3;
    float _1776 = (*spvDescriptorSet0.vp_c9)._m0[int(_1772)][_1774];
    int _1778 = _1612 & 3;
    bool _1780 = _1778 != 0;
    float _1782 = fma(_1528, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1684);
    int _1784 = ~_983;
    int _1786 = _1784 + 1;
    float _1788 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1790 = _1490 + _1788;
    float _1792 = float(_1682);
    int _1794 = _1780 ? 0 : 1;
    int _1796 = int(_1642) + int(_1748);
    int _1798 = ~_1794;
    int _1800 = _1798 + 1;
    int _1802 = _1800 + 1;
    int _1804 = _1802;
    if (!_1754)
    {
        int _1806 = ~_1794;
        int _1808 = _1806 + 1;
        _1804 = _1808;
    }
    int _1810 = _1804;
    bool _1812 = !_1734;
    int _1814 = _1812 ? 0 : 1;
    float _1816 = float(_1758);
    float _1818 = fma(_1528, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1718);
    int _1820 = abs(_1810);
    int _1822 = _1786 * _1796;
    int _1824 = _1822 + _1160;
    bool _1826 = _1732 != 3;
    float _1828 = _1816 * _1792;
    int _1830 = abs(_1814);
    float _1832 = fma(_1528, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1722);
    float _1834 = _1828 * (-2.0);
    bool _1836 = uint(_1732) >= 2u;
    bool _1838 = uint(_1824) >= uint(_983);
    int _1840 = ~_1820;
    int _1842 = _1840 + 1;
    int _1844 = _1842 + 1;
    int _1846 = _1836 ? 0 : 1;
    bool _1848 = !_1838;
    int _1850 = _1848 ? 0 : (-1);
    int _1852 = _1844 * as_type<int>(_1716);
    int _1854 = ~_1830;
    int _1856 = _1854 + 1;
    int _1858 = _1856 + 1;
    bool _1860 = _1732 != 3;
    int _1862 = ~_1846;
    int _1864 = _1862 + 1;
    int _1866 = _1864 + 1;
    int _1868 = _1866;
    if (_1826)
    {
        int _1870 = ~_1846;
        int _1872 = _1870 + 1;
        _1868 = _1872;
    }
    int _1874 = _1868;
    int _1876 = ~_1796;
    int _1878 = _1876 + _1850;
    int _1880 = _1878 + 1;
    int _1882 = _1858 * as_type<int>(_1708);
    int _1884 = _1882 + _1852;
    bool _1886 = !_1860;
    int _1888 = _1886 ? 0 : (-1);
    float _1890 = in.m_84.x;
    float _1892 = in.m_84.y;
    float _1894 = in.m_84.z;
    int _1896 = abs(_1874);
    float _1898 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1900 = _1342 + _1898;
    int _1902 = abs(_1888);
    float _1904 = _1900 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _1906 = !_1202;
    int _1908 = _1906 ? 0 : 1;
    float _1910 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1912 = _1402 + _1910;
    int _1914 = ~_1896;
    int _1916 = _1914 + 1;
    int _1918 = _1916 + 1;
    float _1920 = fma(_1790, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1904);
    int _1922 = abs(_1908);
    int _1924 = ~_1902;
    int _1926 = _1924 + 1;
    int _1928 = _1926 + 1;
    int _1930 = _1918 * as_type<int>(_1768);
    int _1932 = _1930 + _1884;
    float _1934 = fma(_1912, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1920);
    float _1936 = _1756 * (-2.0);
    int _1938 = _1928 * as_type<int>(_1776);
    int _1940 = _1938 + _1932;
    int _1942 = ~_1922;
    int _1944 = _1942 + 1;
    int _1946 = _1944 + 1;
    bool _1948 = _1934 >= 0.0;
    float _1950 = fma(_1412, _1936, _1412);
    int _1952 = _1940 * _1946;
    float _1954 = _1900 * _1900;
    float _1956 = fma(_1936, _1892, _1892);
    int _1958 = _983 * _1880;
    int _1960 = _1958 + _1160;
    float _1962 = fma(_1428, _1834, _1428);
    float _1964 = fma(_1790, _1790, _1954);
    float _1966 = _1832 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1968 = fma(_1730, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1956);
    bool _1970 = !_1110;
    int _1972 = _1970 ? _1960 : (-1);
    float _1974 = fma(_1912, _1912, _1964);
    if (_1948)
    {
        _1442 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1976 = _1442;
    float _1978 = _1818 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1980 = _1966 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1982 = _1972 * _1922;
    int _1984 = _1982 + _1952;
    float _1986 = _1782 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1988 = rsqrt(_1974);
    float _1990 = _1978 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1992 = _1986 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1994 = as_type<int>(_1976);
    if (_1948)
    {
        float _1996 = _1976 * 5.0;
        _1994 = as_type<int>(_1996);
    }
    int _1998 = _1994;
    float _2000 = float(_1984);
    if (_1948)
    {
        out.m_61.x = 0.0;
    }
    bool _2002 = !_1354;
    int _2004 = _2002 ? 0 : 1;
    float _2006 = fma(_1834, _1890, _1890);
    float _2008 = fma(_1950, _1626, _1968);
    out.m_86.x = _1992;
    out.m_86.y = _1990;
    out.m_86.z = _1980;
    float _2010 = _175 + (-0.5);
    if (_1948)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7075 = as_type<float>(_1998);
        out.gl_Position.z = _7075;
    }
    float _2012 = _1900 * _1988;
    float _2014 = _1790 * _1988;
    out.m_88.x = _2000;
    int _2016 = abs(_2004);
    if (_1948)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2018 = -_2012;
    float _2020 = fma(_2018, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1342);
    float _2022 = _1912 * _1988;
    float _2024 = -_2014;
    float _2026 = fma(_2024, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1490);
    float _2028 = float(_2016);
    float _2030 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2032 = _2020 + _2030;
    float _2034 = -_2022;
    float _2036 = fma(_2034, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1402);
    float _2038 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2040 = _2026 + _2038;
    float _2042 = float(_1448);
    float _2044 = _2032 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2046 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2048 = _2036 + _2046;
    float _2050 = _175 + _1262;
    float _2052 = fma(_2040, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2044);
    float _2054 = _2028 * _2042;
    float _2056 = _2050 + (-1.0);
    float _2058 = -_2012;
    float _2060 = fma(_2058, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1900);
    float _2062 = fma(_2048, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2052);
    float _2064 = _2054 * (-2.0);
    float _2066 = fma(_2056, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2068 = _1262 + (-0.5);
    float _2070 = fma(_2010, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2006);
    bool _2072 = _2062 >= 0.0;
    float _2074 = fma(_2064, _1894, _1894);
    float _2076 = -_2014;
    float _2078 = fma(_2076, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1790);
    float _2080 = _2060 * _2060;
    float _2082 = fma(_2066, _2064, _2066);
    float _2084 = fma(_2068, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2074);
    float _2086 = fma(_1962, _1626, _2070);
    float _2088 = fma(_2078, _2078, _2080);
    float _2090 = -_2022;
    float _2092 = fma(_2090, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1912);
    float _2094 = _2008 * 0.15915493667125701904296875;
    float _2096 = fma(_2082, _1626, _2084);
    float _2098 = _2086 * 0.15915493667125701904296875;
    float _2100 = fma(_2092, _2092, _2088);
    float _2102 = _2094 * 6.283185482025146484375;
    float _2104 = sin(_2102);
    float _2106 = (*spvDescriptorSet0.vp_c9)._m0[198].z;
    int _2108 = as_type<int>(_2074);
    float _2110 = _2020;
    if (_2072)
    {
        _2106 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2112 = _2106;
    if (_2072)
    {
        out.m_61.x = 0.0;
    }
    float _2114 = _369 * _935;
    if (_2072)
    {
        float _2116 = _2112 * 5.0;
        _2108 = as_type<int>(_2116);
    }
    int _2118 = _2108;
    float _2120 = _2094 * 6.283185482025146484375;
    float _2122 = cos(_2120);
    if (_2072)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7273 = as_type<float>(_2118);
        out.gl_Position.z = _7273;
    }
    float _2124 = _2098 * 6.283185482025146484375;
    float _2126 = sin(_2124);
    float _2128 = _2096 * 0.15915493667125701904296875;
    float _2130 = sqrt(_2100);
    float _2132 = _2098 * 6.283185482025146484375;
    float _2134 = cos(_2132);
    if (_2072)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2136 = _2114 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2138 = _1988 * _2130;
    float _2140 = _2128 * 6.283185482025146484375;
    float _2142 = cos(_2140);
    float _2144 = _365 * _937;
    float _2146 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _273);
    float _2148 = _2138 * _2136;
    float _2150 = _2134 * _2122;
    float _2152 = _2144 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2154 = _2134 * _2104;
    float _2156 = _2146 * _2148;
    float _2158 = _2128 * 6.283185482025146484375;
    float _2160 = sin(_2158);
    float _2162 = _2126 * _2104;
    float _2164 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _373);
    float _2166 = _2138 * _2152;
    float _2168 = _2126 * _2122;
    float _2170 = _2164 * _2166;
    float _2172 = _2134 * _2142;
    float _2174 = _2126 * _2142;
    float _2176 = _2122 * _2142;
    float _2178 = _2104 * _2142;
    float _2180 = _2172 * _2156;
    float _2182 = _2138 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2184 = _2182 * 0.5;
    float _2186 = _2172 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2188 = _2172 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2190 = fma(_2160, _2150, _2162);
    float _2192 = -_2168;
    float _2194 = fma(_2160, _2154, _2192);
    float _2196 = -_2156;
    float _2198 = _2160 * _2196;
    float _2200 = -_2154;
    float _2202 = fma(_2160, _2168, _2200);
    float _2204 = fma(_2190, _2170, _2180);
    float _2206 = _2174 * _2156;
    float _2208 = fma(_2176, _2170, _2198);
    float _2210 = fma(_2160, _2162, _2150);
    float _2212 = fma(_2194, _2184, _2204);
    float _2214 = fma(_2202, _2170, _2206);
    float _2216 = fma(_2178, _2184, _2208);
    float _2218 = _2190 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2220 = _2212 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2222 = _2212 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2224 = fma(_2210, _2184, _2214);
    float _2226 = _2212 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2228 = fma(_2216, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2220);
    float _2230 = fma(_2216, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2222);
    float _2232 = _2190 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2234 = fma(_2216, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2226);
    float _2236 = fma(_2224, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2228);
    float _2238 = fma(_2224, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2230);
    float _2240 = _2190 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2242 = fma(_2224, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2234);
    float _2244 = _2236 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2246 = _2238 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2248 = _2172 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2250 = _2242 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2252 = _1490 + _2244;
    float _2254 = _1402 + _2246;
    float _2256 = fma(_2176, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2218);
    float _2258 = fma(_2176, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2232);
    float _2260 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2262 = _2252 + _2260;
    float _2264 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2266 = _2254 + _2264;
    float _2268 = _2194 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2270 = _2194 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2272 = _2262 * _2262;
    float _2274 = _2266 * _2266;
    float _2276 = _2194 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2278 = _1342 + _2250;
    float _2280 = fma(_2176, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2240);
    float _2282 = _2272 + _2274;
    float _2284 = -_2160;
    float _2286 = fma(_2284, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2186);
    float _2288 = -_2160;
    float _2290 = fma(_2288, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2188);
    float _2292 = -_2160;
    float _2294 = fma(_2292, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2248);
    float _2296 = sqrt(_2282);
    float _2298 = fma(_2202, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2256);
    float _2300 = fma(_2202, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2258);
    float _2302 = fma(_2178, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2268);
    float _2304 = fma(_2178, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2270);
    float _2306 = fma(_2178, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2276);
    float _2308 = fma(_2202, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2280);
    bool _2310 = _2296 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2312 = _2178;
    float _2314 = _2194;
    float _2316 = _2272;
    float _2318 = _2274;
    float _2320 = _2254;
    int _2322 = as_type<int>(_2286);
    float _2324 = _2186;
    if (!_2310)
    {
        _2312 = _2252;
    }
    float _2326 = _2312;
    float _2328 = _2326;
    if (!_2310)
    {
        _2314 = _2278;
    }
    float _2330 = _2314;
    bool _2332 = !_2310;
    float _2334 = _2330;
    if (!_2332)
    {
        float _2336 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2338 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2340 = _2296 + _2338;
        float _2342 = _2278 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2344 = rsqrt(_2282);
        float _2346 = _2340 * _2336;
        float _2348 = _2346 * 0.15915493667125701904296875;
        float _2350 = _2348 * 6.283185482025146484375;
        float _2352 = sin(_2350);
        float _2354 = _2348 * 6.283185482025146484375;
        float _2356 = cos(_2354);
        float _2358 = fma(_2352, _2342, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2360 = _2344 * _2358;
        float _2362 = fma(_2262, _2360, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2364 = _2356 + (-1.0);
        float _2366 = fma(_2266, _2360, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2368 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2370 = _2362 + _2368;
        float _2372 = _2364 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2374 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2376 = _2366 + _2374;
        float _2378 = _2370 * _2370;
        float _2380 = fma(_2278, _2356, _2372);
        float _2382 = _2376 * _2376;
        _2334 = _2380;
        _2316 = _2378;
        _2318 = _2382;
        _2320 = _2366;
        _2328 = _2362;
    }
    float _2384 = _2334;
    float _2386 = _2316;
    float _2388 = _2318;
    float _2390 = _2320;
    float _2392 = _2328;
    float _2394 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2396 = _2384 + _2394;
    float _2398 = fma(_2174, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2286);
    float _2400 = fma(_2174, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2290);
    float _2402 = fma(_2174, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2294);
    float _2404 = fma(_2396, _2396, _2386);
    float _2406 = _273 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2408 = _373 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2410 = fma(_2210, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2302);
    float _2412 = _2404 + _2388;
    float _2414 = _2406 * _2398;
    float _2416 = _2406 * _2400;
    float _2418 = _2406 * _2402;
    float _2420 = fma(_2210, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2304);
    float _2422 = fma(_2210, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2306);
    float _2424 = sqrt(_2412);
    float _2426 = fma(_2408, _2298, _2414);
    float _2428 = fma(_2408, _2300, _2416);
    float _2430 = fma(_2408, _2308, _2418);
    float _2432 = _2410 + _2426;
    float _2434 = _2420 + _2428;
    float _2436 = _2422 + _2430;
    out.m_90.x = _2432;
    out.m_90.y = _2434;
    out.m_90.z = _2436;
    bool _2438 = _2424 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2440 = isnan(_2424);
    bool _2442 = _2438 || _2440;
    bool _2444 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2446 = _2442 || _2444;
    float _2448 = 0.0;
    int _2450 = as_type<int>(_2392);
    if (!_2446)
    {
        _2448 = 1.0;
    }
    float _2452 = _2448;
    bool _2454 = !_2446;
    float _2456 = _2452;
    if (!_2454)
    {
        bool _2458 = _2424 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2460 = isnan(_2424);
        bool _2462 = _2458 || _2460;
        bool _2464 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2466 = _2462 || _2464;
        if (!_2466)
        {
            float _2468 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2470 = _2424 + _2468;
            float _2472 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2474 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2472;
            float _2476 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2478 = _2476 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2480 = 1.0 / _2474;
            float _2482 = _2470 * _2480;
            float _2484 = fma(_2482, _2478, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2456 = _2484;
            _2486 = true;
        }
        else
        {
            bool _2488 = _2424 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2490 = isnan(_2424);
            bool _2492 = _2488 || _2490;
            bool _2494 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2496 = _2492 || _2494;
            if (!_2496)
            {
                float _2498 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2500 = _2424 + _2498;
                float _2502 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2504 = _2502 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2506 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2508 = _2506 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2510 = 1.0 / _2504;
                float _2512 = _2500 * _2510;
                float _2514 = fma(_2512, _2508, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2456 = _2514;
                _2486 = true;
            }
            else
            {
                _2456 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2486 = false;
    float _2516 = _2456;
    float _2518 = fma(_2026, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2520 = fma(_2036, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2522 = floor(_2518);
    float _2524 = floor(_2520);
    float _2526 = -_2522;
    float _2528 = _2518 + _2526;
    float _2530 = -_2524;
    float _2532 = _2520 + _2530;
    float2 _7979 = float2(_2528, _2532);
    float _2534 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7979, float2(0.0), isnan(_7979)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7979, float2(0.0), isnan(_7979)), level(0.0)).x;
    float _2536 = _2020 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2538 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _2540 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2542 = _2384 + _2540;
    float _2544 = fma(_2026, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2536);
    float _2546 = _2020 + _2538;
    float _2548 = fma(_2542, _2516, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2550 = fma(_2036, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2544);
    float _2552 = _2020 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2554 = _2546 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _2556 = -_1342;
    float _2558 = _2556 + _2548;
    float _2560 = _2550 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2562 = fma(_2026, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2552);
    float _2564 = fma(_2026, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2554);
    float _2566 = 1.0 / _2560;
    float _2568 = fma(_2036, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2562);
    float _2570 = fma(_2036, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2564);
    float _2572 = _2568 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2574 = _2570 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _2576 = _2546 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2578 = _2572 + _2560;
    float _2580 = fma(_2026, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2576);
    float _2582 = trunc(_2574);
    int _2584 = int(_2582);
    float _2586 = fma(_2036, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2580);
    float _2588 = _2578 * _2566;
    float _2590 = _2588 * 0.5;
    float _2592 = _2586 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _2594 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2596 = fma(_2590, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2594);
    float _2598 = trunc(_2592);
    int _2600 = int(_2598);
    int _2602 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2604 = _2584 + _2602;
    int _2606 = _2604 + 1;
    float _2608 = 1.0 / _2596;
    bool _2610 = _2606 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _2612 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2614 = _2600 + _2612;
    int _2616 = _2614 + 1;
    int _2618 = _2606 | _2616;
    float _2620 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2622 = _2608 * _2620;
    bool _2624 = _2618 < 0;
    bool _2626 = _2624 || _2610;
    float _2628 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2630 = _2390 + _2628;
    bool _2632 = _2622 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _2634 = _2622 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _2636 = _2616 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2638 = _2636 || _2626;
    bool _2640 = !_2632;
    int _2642 = _2640 ? 0 : 1;
    int _2644 = 2;
    int _2646 = _2642;
    int _2648 = as_type<int>(_2542);
    float _2650 = _2548;
    float _2652 = _2558;
    float _2654 = _2592;
    float _2656 = _2574;
    if (!_2632)
    {
        _2644 = 1;
    }
    int _2658 = _2644;
    int _2660 = _2658;
    if (!_2634)
    {
        _2660 = _2642;
    }
    int _2662 = _2660;
    float _2664 = as_type<float>(_2662);
    if (!_2638)
    {
        int _2666 = _2616 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _2668 = _2666 + _2606;
        _2322 = _2668;
    }
    int _2670 = _2322;
    float _2672 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2674 = _2392 + _2672;
    int _2676 = _2662 << 6;
    if (!_2638)
    {
        int _2678 = _2670 << 2;
        _2646 = _2678;
    }
    int _2680 = _2646;
    int _2682 = _2676 + 96;
    uint _2684 = uint(int(uint(_2682) >> uint(2)));
    uint _2686 = uint(int(uint(int(_2684)) >> uint(2)));
    int _2688 = int(_2684) & 3;
    float _2690 = (*spvDescriptorSet0.vp_c15)._m0[int(_2686)][_2688];
    int _2692 = int(_2684) + 1;
    uint _2694 = uint(int(uint(_2692) >> uint(2)));
    int _2696 = _2692 & 3;
    float _2698 = (*spvDescriptorSet0.vp_c15)._m0[int(_2694)][_2696];
    if (!_2638)
    {
        uint _2700 = uint(int(uint(_2670) >> uint(2)));
        _2450 = int(_2700);
    }
    int _2702 = _2450;
    float _2704 = fma(_2674, _2516, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2706 = _2704;
    if (!_2638)
    {
        int _2708 = 12 & _2680;
        _2648 = _2708;
    }
    int _2710 = _2648;
    float _2712 = fma(_2630, _2516, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2714 = -_1490;
    float _2716 = _2714 + _2704;
    float _2718 = _2712;
    if (!_2638)
    {
        int _2720 = _2702 << 4;
        int _2722 = _2720 + _2710;
        _2324 = as_type<float>(_2722);
    }
    float _2724 = _2324;
    int _2726 = _2676 + 104;
    uint _2728 = uint(int(uint(_2726) >> uint(2)));
    uint _2730 = uint(int(uint(int(_2728)) >> uint(2)));
    int _2732 = int(_2728) & 3;
    float _2734 = (*spvDescriptorSet0.vp_c15)._m0[int(_2730)][_2732];
    int _2736 = int(_2728) + 1;
    uint _2738 = uint(int(uint(_2736) >> uint(2)));
    int _2740 = _2736 & 3;
    float _2742 = (*spvDescriptorSet0.vp_c15)._m0[int(_2738)][_2740];
    float _2744 = _2558 * _2558;
    float _2746 = -_1402;
    float _2748 = _2746 + _2712;
    float _2750 = fma(_2716, _2716, _2744);
    int _2752 = _2676 + 48;
    uint _2754 = uint(int(uint(_2752) >> uint(2)));
    uint _2756 = uint(int(uint(int(_2754)) >> uint(2)));
    int _2758 = int(_2754) & 3;
    float _2760 = (*spvDescriptorSet0.vp_c15)._m0[int(_2756)][_2758];
    int _2762 = int(_2754) + 1;
    uint _2764 = uint(int(uint(_2762) >> uint(2)));
    int _2766 = _2762 & 3;
    float _2768 = (*spvDescriptorSet0.vp_c15)._m0[int(_2764)][_2766];
    float _2770 = fma(_2748, _2748, _2750);
    float _2772 = sqrt(_2770);
    int _2774 = _2676 + 64;
    uint _2776 = uint(int(uint(_2774) >> uint(2)));
    uint _2778 = uint(int(uint(int(_2776)) >> uint(2)));
    int _2780 = int(_2776) & 3;
    float _2782 = (*spvDescriptorSet0.vp_c15)._m0[int(_2778)][_2780];
    int _2784 = int(_2776) + 1;
    uint _2786 = uint(int(uint(_2784) >> uint(2)));
    int _2788 = _2784 & 3;
    float _2790 = (*spvDescriptorSet0.vp_c15)._m0[int(_2786)][_2788];
    int _2792 = _2676 + 56;
    uint _2794 = uint(int(uint(_2792) >> uint(2)));
    uint _2796 = uint(int(uint(int(_2794)) >> uint(2)));
    int _2798 = int(_2794) & 3;
    float _2800 = (*spvDescriptorSet0.vp_c15)._m0[int(_2796)][_2798];
    int _2802 = int(_2794) + 1;
    uint _2804 = uint(int(uint(_2802) >> uint(2)));
    int _2806 = _2802 & 3;
    float _2808 = (*spvDescriptorSet0.vp_c15)._m0[int(_2804)][_2806];
    bool _2810 = _2772 > 0.0;
    int _2812 = _2676 + 72;
    uint _2814 = uint(int(uint(_2812) >> uint(2)));
    uint _2816 = uint(int(uint(int(_2814)) >> uint(2)));
    int _2818 = int(_2814) & 3;
    float _2820 = (*spvDescriptorSet0.vp_c15)._m0[int(_2816)][_2818];
    int _2822 = int(_2814) + 1;
    uint _2824 = uint(int(uint(_2822) >> uint(2)));
    int _2826 = _2822 & 3;
    float _2828 = (*spvDescriptorSet0.vp_c15)._m0[int(_2824)][_2826];
    int _2830 = _2676 + 80;
    uint _2832 = uint(int(uint(_2830) >> uint(2)));
    uint _2834 = uint(int(uint(int(_2832)) >> uint(2)));
    int _2836 = int(_2832) & 3;
    float _2838 = (*spvDescriptorSet0.vp_c15)._m0[int(_2834)][_2836];
    int _2840 = int(_2832) + 1;
    uint _2842 = uint(int(uint(_2840) >> uint(2)));
    int _2844 = _2840 & 3;
    float _2846 = (*spvDescriptorSet0.vp_c15)._m0[int(_2842)][_2844];
    float _2848 = _2546 * _2698;
    float _2850 = fma(_2026, _2690, _2848);
    bool _2852 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2854 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2856 = _2852 || _2854;
    bool _2858 = isnan(0.5);
    bool _2860 = _2856 || _2858;
    float _2862 = _2690;
    if (!_2638)
    {
        float _2864 = floor(_2574);
        _2862 = _2864;
    }
    float _2866 = _2862;
    int _2868 = _2676 + 88;
    uint _2870 = uint(int(uint(_2868) >> uint(2)));
    uint _2872 = uint(int(uint(int(_2870)) >> uint(2)));
    int _2874 = int(_2870) & 3;
    float _2876 = (*spvDescriptorSet0.vp_c15)._m0[int(_2872)][_2874];
    int _2878 = int(_2870) + 1;
    uint _2880 = uint(int(uint(_2878) >> uint(2)));
    int _2882 = _2878 & 3;
    float _2884 = (*spvDescriptorSet0.vp_c15)._m0[int(_2880)][_2882];
    float _2886 = fma(_2036, _2734, _2850);
    float _2888 = _2886 + _2742;
    float _2890 = _2724;
    if (!_2638)
    {
        int _2892 = as_type<int>(_2724) + 400;
        uint _2894 = uint(int(uint(_2892) >> uint(2)));
        uint _2896 = uint(int(uint(int(_2894)) >> uint(2)));
        int _2898 = int(_2894) & 3;
        float _2900 = (*spvDescriptorSet0.vp_c15)._m0[int(_2896)][_2898];
        _2890 = _2900;
    }
    float _2902 = _2890;
    float _2904 = _2546 * _2768;
    float _2906 = _2546 * _2790;
    bool _2908 = !_2810;
    float _2910 = _2820;
    float _2912 = _2800;
    if (!_2908)
    {
        float _2914 = _287 * _287;
        float _2916 = fma(_359, _359, _2914);
        float _2918 = fma(_361, _361, _2916);
        float _2920 = rsqrt(_2770);
        float _2922 = sqrt(_2918);
        float _2924 = _2716 * _2920;
        float _2926 = _2558 * _2920;
        float _2928 = _2748 * _2920;
        bool _2930 = _2922 > 0.0;
        bool _2932 = !_2930;
        if (!_2932)
        {
            float _2934 = rsqrt(_2918);
            float _2936 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2938 = _287 * _2934;
            float _2940 = _359 * _2934;
            float _2942 = _361 * _2934;
            float _2944 = _2926 * _2938;
            float _2946 = fma(_2924, _2940, _2944);
            float _2948 = _2936 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2950 = fma(_2928, _2942, _2946);
            float _2952 = _2950 * _2948;
            float _2954 = fma(_359, _2952, _2704);
            float _2956 = fma(_287, _2952, _2548);
            float _2958 = fma(_361, _2952, _2712);
            _2706 = _2954;
            _2650 = _2956;
            _2718 = _2958;
            _2652 = _2938;
        }
    }
    float _2960 = _2706;
    float _2962 = _2650;
    float _2964 = _2718;
    float _2966 = _2652;
    float _2968 = 1.0 / _2888;
    float _2970 = fma(_2026, _2760, _2904);
    float _2972 = fma(_2026, _2782, _2906);
    float _2974 = -_2014;
    float _2976 = fma(_2974, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2960);
    float _2978 = -_2012;
    float _2980 = fma(_2978, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2962);
    float _2982 = fma(_2036, _2800, _2970);
    float _2984 = fma(_2036, _2820, _2972);
    float _2986 = -_2022;
    float _2988 = fma(_2986, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2964);
    float _2990 = _2988;
    float _2992 = _2966;
    float _2994 = _2976;
    if (_2860)
    {
        _2910 = _2976;
    }
    float _2996 = _2910;
    float _2998 = _2996;
    if (_2860)
    {
        _2912 = _2980;
    }
    float _3000 = _2912;
    float _3002 = _3000;
    if (!_2860)
    {
        float _3004 = _2032 * _2032;
        float _3006 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3008 = -_1342;
        float _3010 = _3008 + _2962;
        float _3012 = -_1490;
        float _3014 = _3012 + _2960;
        float _3016 = fma(_2040, _2040, _3004);
        float _3018 = -_1402;
        float _3020 = _3018 + _2964;
        float _3022 = fma(_2048, _2048, _3016);
        float _3024 = 1.0 / _2138;
        float _3026 = sqrt(_3022);
        float _3028 = precise::min(_3026, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3030 = _3028 * _3006;
        float _3032 = _3030 * _3024;
        float _3034 = fma(_3010, _3032, _2020);
        float _3036 = fma(_3014, _3032, _2026);
        float _3038 = fma(_3020, _3032, _2036);
        _3002 = _3034;
        _2998 = _3036;
        _2990 = _3038;
        _1360 = _3010;
    }
    float _3040 = _3002;
    float _3042 = _2998;
    float _3044 = _2990;
    float _3046 = _1360;
    float _3048 = _2982 + _2808;
    float _3050 = _3040 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3052 = _3040 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3054 = _2984 + _2828;
    float _3056 = _3048 * _2968;
    float _3058 = fma(_3042, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3050);
    float _3060 = _3040 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3062 = fma(_3042, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3052);
    float _3064 = _3040 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3066 = fma(_3044, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3058);
    float _3068 = fma(_3042, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3060);
    bool _3070 = _3056 >= 0.0;
    float _3072 = fma(_3044, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3062);
    float _3074 = _3066 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3076 = _3054 * _2968;
    float _3078 = fma(_3044, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3068);
    bool _3080 = _3056 <= 1.0;
    bool _3082 = _3080 && _3070;
    float _3084 = fma(_3042, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3064);
    float _3086 = _3072 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3088 = _3074 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3090 = _3078 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _3092 = _3076 >= 0.0;
    bool _3094 = _3092 && _3082;
    float _3096 = fma(_3044, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3084);
    float _3098 = fma(_3086, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3088);
    float _3100 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3102 = _3090 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _3104 = _3076 <= 1.0;
    bool _3106 = _3104 && _3094;
    float _3108 = _3096 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3110 = fma(_3090, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3098);
    float _3112 = -_3102;
    float _3114 = fma(_3112, _3100, 1.0);
    float _3116 = _3046;
    float _3118 = _3056;
    if (!_2638)
    {
        float _3120 = floor(_2592);
        _3116 = _3120;
    }
    float _3122 = _3116;
    float _3124 = _3074 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3126 = fma(_3108, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3110);
    float _3128 = _2546 * _2846;
    float _3130 = _3074 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3132 = _3126;
    if (!_2638)
    {
        float _3134 = -_2866;
        float _3136 = _2574 + _3134;
        _2992 = _3136;
    }
    float _3138 = _2992;
    float _3140 = fma(_2026, _2838, _3128);
    float _3142 = log2(_3114);
    if (_3106)
    {
        float _3144 = float(_2662);
        _2664 = _3144;
    }
    float _3146 = _2664;
    float _3148 = fma(_3086, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3130);
    float _3150 = fma(_3086, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3124);
    float _3152 = fma(_2036, _2876, _3140);
    float _3154 = fma(_3090, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3148);
    float _3156 = fma(_3090, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3150);
    float _3158 = 1.0 / _3126;
    if (!_2638)
    {
        float _3160 = -_3122;
        float _3162 = _2592 + _3160;
        _2654 = _3162;
    }
    float _3164 = _2654;
    float _3166 = fma(_3108, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3154);
    float _3168 = fma(_3108, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3156);
    float _3170 = _3152 + _2884;
    float _3172 = _2902;
    float _3174 = _3168;
    if (!_2638)
    {
        float _3176 = rint(_2902);
        float _3178 = precise::max(_3176, 0.0);
        uint _3180 = uint(_3178);
        uint _3182 = clamp(_3180, 0u, 65535u);
        _3172 = as_type<float>(_3182);
    }
    float _3184 = _3172;
    float _3186 = _3142 * 0.693147182464599609375;
    float _3188 = _3170 * _2968;
    float _3190 = _3186 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3192 = _3140;
    float _3194 = _3186;
    if (_3106)
    {
        float _3196 = rint(_3146);
        float _3198 = precise::max(_3196, 0.0);
        uint _3200 = uint(_3198);
        uint _3202 = clamp(_3200, 0u, 65535u);
        _3192 = as_type<float>(_3202);
    }
    float _3204 = _3192;
    float _3206 = _3166 * _3158;
    float _3208 = _3168 * _3158;
    float _3210 = fma(_3206, 0.5, 0.5);
    float _3212 = fma(_3208, -0.5, 0.5);
    float _3214 = _3184;
    float _3216 = _3210;
    if (!_2638)
    {
        float3 _9119 = float3(_3138, _3164, float(as_type<int>(_3184)));
        float3 _9123 = select(_9119, float3(0.0), isnan(_9119));
        float _3218 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _9123.xy, uint(rint(_9123.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _9123.xy, uint(rint(_9123.z)), level(0.0)).x;
        _3214 = _3218;
    }
    float _3220 = _3214;
    float _3222 = _3076;
    if (_3106)
    {
        float3 _9138 = float3(_3056, _3076, float(as_type<int>(_3204)));
        float3 _9140 = select(_9138, float3(0.0), isnan(_9138));
        float _3224 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _9140.xy, uint(rint(_9140.z)), _3188, level(0.0));
        _3222 = _3224;
    }
    float _3226 = _3222;
    float3 _9150 = float3(_3210, _3212, _3190);
    float _3228 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9150, float3(0.0), isnan(_9150)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9150, float3(0.0), isnan(_9150)), level(0.0)).x;
    float3 _9159 = float3(_3210, _3212, _3190);
    float4 _3231 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9159, float3(0.0), isnan(_9159)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9159, float3(0.0), isnan(_9159)), level(0.0)).xyzw;
    float _3233 = _3231.x;
    float _3235 = _3231.y;
    float _3237 = _3231.z;
    float _3239 = _3231.w;
    if (_2638)
    {
        _2110 = 1.0;
    }
    float _3241 = _2110;
    bool _3243 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _3245 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3247 = _3243 || _3245;
    bool _3249 = isnan(0.5);
    bool _3251 = _3247 || _3249;
    float _3253 = _3241;
    if (_3251)
    {
        _3194 = 1.0;
    }
    float _3255 = _3194;
    float _3257 = _3255;
    if (_3251)
    {
        _2994 = 1.0;
    }
    float _3259 = _2994;
    float _3261 = _3259;
    float _3263 = _3235;
    float _3265 = _3233;
    if (!_3251)
    {
        float _3267 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _3269 = _3267 * 0.15915493667125701904296875;
        float _3271 = _3269 * 6.283185482025146484375;
        float _3273 = cos(_3271);
        float _3275 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _3277 = _3275 * 0.15915493667125701904296875;
        float _3279 = _3269 * 6.283185482025146484375;
        float _3281 = sin(_3279);
        float _3283 = 1.0 / _3273;
        float _3285 = _3277 * 6.283185482025146484375;
        float _3287 = cos(_3285);
        float _3289 = _3281 * _3283;
        float _3291 = _3277 * 6.283185482025146484375;
        float _3293 = sin(_3291);
        float _3295 = _3287 * _3289;
        float _3297 = 1.0 / _3295;
        float _3299 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3301 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3299;
        float _3303 = 1.0 / _3301;
        float _3305 = _3293 * _3297;
        float _3307 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3309 = fma(_2622, _3305, _3307);
        float _3311 = _3309 * _3303;
        float _3313 = precise::clamp(_3311, 0.0, 1.0);
        _3118 = _3283;
        _3216 = _3277;
        _3261 = _3313;
    }
    float _3315 = _3118;
    float _3317 = _3216;
    float _3319 = _3261;
    float _3321 = _3315;
    float _3323 = _3317;
    if (!_3251)
    {
        float _3325 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _3327 = _3325 * 0.15915493667125701904296875;
        float _3329 = _3327 * 6.283185482025146484375;
        float _3331 = cos(_3329);
        float _3333 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _3335 = _3333 * 0.15915493667125701904296875;
        float _3337 = _3327 * 6.283185482025146484375;
        float _3339 = sin(_3337);
        float _3341 = 1.0 / _3331;
        float _3343 = _3335 * 6.283185482025146484375;
        float _3345 = cos(_3343);
        float _3347 = _3339 * _3341;
        float _3349 = _3335 * 6.283185482025146484375;
        float _3351 = sin(_3349);
        float _3353 = _3345 * _3347;
        float _3355 = 1.0 / _3353;
        float _3357 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3359 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _3357;
        float _3361 = 1.0 / _3359;
        float _3363 = _3351 * _3355;
        float _3365 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3367 = fma(_2622, _3363, _3365);
        float _3369 = _3367 * _3361;
        float _3371 = precise::clamp(_3369, 0.0, 1.0);
        float _3373 = -_3371;
        float _3375 = _3373 + 1.0;
        _3321 = _3327;
        _3323 = _3353;
        _3257 = _3375;
    }
    float _3377 = _3321;
    float _3379 = _3323;
    float _3381 = _3257;
    float _3383 = _3377;
    float _3385 = _3379;
    if (!_2638)
    {
        int _3387 = _2670 << 4;
        int _3389 = _3387 + 2048;
        uint _3391 = uint(int(uint(_3389) >> uint(2)));
        uint _3393 = uint(int(uint(int(_3391)) >> uint(2)));
        int _3395 = int(_3391) & 3;
        float _3397 = (*spvDescriptorSet0.vp_c15)._m0[int(_3393)][_3395];
        int _3399 = int(_3391) + 1;
        uint _3401 = uint(int(uint(_3399) >> uint(2)));
        int _3403 = _3399 & 3;
        float _3405 = (*spvDescriptorSet0.vp_c15)._m0[int(_3401)][_3403];
        int _3407 = _3389 + 8;
        uint _3409 = uint(int(uint(_3407) >> uint(2)));
        uint _3411 = uint(int(uint(int(_3409)) >> uint(2)));
        int _3413 = int(_3409) & 3;
        float _3415 = (*spvDescriptorSet0.vp_c15)._m0[int(_3411)][_3413];
        int _3417 = int(_3409) + 1;
        uint _3419 = uint(int(uint(_3417) >> uint(2)));
        int _3421 = _3417 & 3;
        float _3423 = (*spvDescriptorSet0.vp_c15)._m0[int(_3419)][_3421];
        float _3425 = _2546 * _3405;
        float _3427 = fma(_2026, _3397, _3425);
        float _3429 = fma(_2036, _3415, _3427);
        float _3431 = _3429 + _3423;
        float _3433 = precise::clamp(_3431, 0.0, 1.0);
        float _3435 = -_3433;
        float _3437 = _3435 + _3220;
        float _3439 = fma(_3437, 500.0, 1.5);
        float _3441 = exp2(_3439);
        float _3443 = 0.0 + _3441;
        float _3445 = precise::clamp(_3443, 0.0, 1.0);
        _3383 = _3423;
        _3253 = _3445;
    }
    float _3447 = _3383;
    float _3449 = _3253;
    float _3451 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3453 = _3040 + _3451;
    float _3455 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3457 = _3042 + _3455;
    float _3459 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3461 = _3044 + _3459;
    float _3463 = _3453 * _3453;
    float _3465 = fma(_3457, _3457, _3463);
    float _3467 = fma(_3461, _3461, _3465);
    float _3469 = rsqrt(_3467);
    float _3471 = _3469 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3473 = _3457 * _3471;
    float _3475 = _3461 * _3471;
    float _3477 = _3473 * _3473;
    float _3479 = _3475 * _3475;
    float _3481 = _3477 + _3479;
    float _3483 = sqrt(_3481);
    bool _3485 = _3483 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3487 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3489 = _3483 + _3487;
    float _3491 = _3469;
    float _3493 = _3489;
    float _3495 = _3453;
    float _3497 = _3471;
    if (_3485)
    {
        float _3499 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3491 = _3499;
    }
    float _3501 = _3491;
    float _3503 = _3501;
    if (_3485)
    {
        float _3505 = _3489 * _3501;
        _3493 = _3505;
    }
    float _3507 = _3493;
    if (_3485)
    {
        float _3509 = rsqrt(_3481);
        _3503 = _3509;
    }
    float _3511 = _3503;
    float _3513 = _3511;
    if (_3485)
    {
        float _3515 = _3507 * 0.15915493667125701904296875;
        _3385 = _3515;
    }
    float _3517 = _3385;
    float _3519 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3521 = _3461;
    float _3523 = _3517;
    if (_3485)
    {
        float _3525 = _3517 * 6.283185482025146484375;
        float _3527 = sin(_3525);
        _3521 = _3527;
    }
    float _3529 = _3521;
    float _3531 = precise::max(0.0, _3519);
    float _3533 = _3447;
    float _3535 = _3531;
    if (_3485)
    {
        float _3537 = _3517 * 6.283185482025146484375;
        float _3539 = cos(_3537);
        _3533 = _3539;
    }
    float _3541 = _3533;
    float _3543 = -_3471;
    float _3545 = -_3531;
    float _3547 = fma(_3453, _3543, _3545);
    if (_3485)
    {
        float _3549 = _3547 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3495 = _3549;
    }
    float _3551 = _3495;
    float _3553 = _3529;
    float _3555 = _3551;
    if (_3485)
    {
        float _3557 = fma(_3529, _3551, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3553 = _3557;
    }
    float _3559 = _3553;
    float _3561 = _3559;
    if (!_3485)
    {
        _3555 = _3475;
    }
    float _3563 = _3555;
    float _3565 = _3563;
    if (!_3485)
    {
        _3523 = _3477;
    }
    float _3567 = _3523;
    float _3569 = _3567;
    if (_3485)
    {
        float _3571 = _3511 * _3559;
        _2656 = _3571;
    }
    float _3573 = _2656;
    if (!_3485)
    {
        _3513 = _3473;
    }
    float _3575 = _3513;
    float _3577 = _3575;
    float _3579 = _3541;
    if (_3485)
    {
        float _3581 = _3541 + (-1.0);
        _3535 = _3581;
    }
    float _3583 = _3535;
    if (_3485)
    {
        float _3585 = _3473 * _3573;
        _3577 = _3585;
    }
    float _3587 = _3577;
    if (!_3485)
    {
        _3561 = _3547;
    }
    float _3589 = _3561;
    float _3591 = _3589;
    if (_3485)
    {
        float _3593 = _3475 * _3573;
        _3565 = _3593;
    }
    float _3595 = _3565;
    if (_3485)
    {
        float _3597 = _3583 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3497 = _3597;
    }
    float _3599 = _3497;
    if (_3485)
    {
        float _3601 = _3587 * _3587;
        _3569 = _3601;
    }
    float _3603 = _3569;
    float _3605 = sqrt(_3467);
    if (_3485)
    {
        float _3607 = fma(_3547, _3541, _3599);
        _3591 = _3607;
    }
    float _3609 = _3591;
    if (!_3485)
    {
        _3579 = _3479;
    }
    float _3611 = _3579;
    float _3613 = _3611;
    if (_3485)
    {
        float _3615 = _3595 * _3595;
        _3613 = _3615;
    }
    float _3617 = _3613;
    float _3619 = fma(_3609, _3609, _3603);
    float _3621 = _3619 + _3617;
    float _3623 = rsqrt(_3621);
    float _3625 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3627 = fma(_3605, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3625);
    float _3629 = precise::clamp(_3627, 0.0, 1.0);
    float _3631 = -_3629;
    float _3633 = _3631 + 1.0;
    float _3635 = abs(_3633);
    float _3637 = log2(_3635);
    float _3639 = _3623 * _3587;
    float _3641 = _3623 * _3609;
    float _3643 = _3623 * _3595;
    float _3645 = _3639 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3647 = -_3645;
    float _3649 = fma(_3641, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3647);
    float _3651 = -_3643;
    float _3653 = fma(_3651, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3649);
    float _3655 = _3637 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3657 = fma(_3653, -0.5, 0.5);
    float _3659 = fma(_3653, 0.5, 0.5);
    float _3661 = exp2(_3655);
    float _3663 = fma(_3659, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3665 = fma(_3659, _3663, -0.212114393711090087890625);
    float _3667 = _3641 + 1.0;
    float _3669 = sqrt(_3657);
    float _3671 = fma(_3659, _3665, 1.570728778839111328125);
    float _3673 = -_3641;
    float _3675 = fma(_3661, _3667, _3673);
    float _3677 = fma(_3675, 0.5, 0.5);
    float _3679 = _3669 * 0.636619746685028076171875;
    float _3681 = -_3671;
    float _3683 = fma(_3679, _3681, 1.0);
    float2 _9814 = float2(_3683, _3677);
    float3 _3687 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9814, float2(0.0), isnan(_9814)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9814, float2(0.0), isnan(_9814)), level(0.0)).xyz;
    float _3689 = _3687.x;
    float _3691 = _3687.y;
    float _3693 = _3687.z;
    float _3695 = abs(_2622);
    float _3697 = log2(_3695);
    float _3699 = _3074 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3701 = _3637 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3703 = _3126 * 0.5;
    float _3705 = -_2534;
    float _3707 = _3705 + 1.0;
    float _3709 = fma(_3086, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3699);
    float _3711 = fma(_3168, -0.5, _3703);
    float _3713 = exp2(_3701);
    float _3715 = fma(_3090, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3709);
    bool _3717 = _2622 <= 8000.0;
    bool _3719 = isnan(_2622);
    bool _3721 = _3717 || _3719;
    bool _3723 = isnan(8000.0);
    bool _3725 = _3721 || _3723;
    float _3727 = float(_3725);
    float _3729 = fma(_3108, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3715);
    float _3731 = _3697 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3733 = _3729 + _3126;
    out.gl_Position.x = _3166;
    out.gl_Position.y = _3168;
    out.gl_Position.z = _3729;
    out.gl_Position.w = _3126;
    float _3735 = _3166 + _3126;
    bool _3737 = _3605 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3739 = isnan(_3605);
    bool _3741 = _3737 || _3739;
    bool _3743 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3745 = _3741 || _3743;
    float _3747 = _3733 * 0.5;
    float _3749 = exp2(_3731);
    float _3751 = _3735 * 0.5;
    out.m_92.x = _3751;
    out.m_92.y = _3711;
    out.m_92.z = _3747;
    out.m_92.w = _3126;
    float _3753 = -_3713;
    float _3755 = _3753 + 1.0;
    if (!_3106)
    {
        _3174 = 1.0;
    }
    float _3757 = _3174;
    float _3759 = _3757;
    if (_3106)
    {
        bool _3761 = _3226 >= _3188;
        bool _3763 = isnan(_3226);
        bool _3765 = _3761 || _3763;
        bool _3767 = isnan(_3188);
        bool _3769 = _3765 || _3767;
        float _3771 = float(_3769);
        _3759 = _3771;
    }
    float _3773 = _3759;
    float _3775 = _3755 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (!_3745)
    {
        _3132 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3777 = _3132;
    float _3779 = fma(_3749, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3781 = precise::clamp(_3779, 0.0, 1.0);
    float _3783 = _3775 * _3228;
    float _3785 = _3773 * _3449;
    float _3787 = fma(_3781, -2.0, 3.0);
    float _3789 = _3781 * _3781;
    float _3791 = _3239 * _3783;
    float _3793 = -_3775;
    float _3795 = _3793 + 1.0;
    float _3797 = _3789 * _3787;
    float _3799 = _3239 * _3795;
    float _3801 = _3795;
    float _3803 = _3785;
    float _3805 = _3777;
    float _3807 = _3777;
    if (!_3745)
    {
        _3801 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3809 = _3801;
    float _3811 = -_3797;
    float _3813 = _3811 + 1.0;
    float _3815 = fma(_3813, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3797);
    float _3817 = _3727 * _3815;
    float _3819 = _3817 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3821 = _3707 * _3819;
    float _3823 = precise::clamp(_3821, 0.0, 1.0);
    float _3825 = -_3823;
    float _3827 = fma(_3825, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3829 = -_3785;
    float _3831 = fma(_3829, _3827, 1.0);
    float _3833 = precise::clamp(_3831, 0.0, 1.0);
    float _3835 = _3809;
    float _3837 = _3809;
    if (!_3745)
    {
        _3803 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3839 = _3803;
    float _3841 = _3833 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3843 = _3319 * _3381;
    out.m_94.x = _3841;
    float _3845 = _3843 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3847 = _3843;
    float _3849 = _3839;
    float _3851 = _3839;
    if (!_3745)
    {
        _3847 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3853 = _3847;
    float _3855 = _3693 * _3783;
    float _3857 = fma(_3689, _3791, _3233);
    float _3859 = fma(_3691, _3791, _3235);
    float _3861 = _3853;
    float _3863 = _3853;
    if (!_3745)
    {
        _3263 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3865 = _3263;
    float _3867 = fma(_3239, _3855, _3237);
    float _3869 = _3865;
    float _3871 = _3865;
    if (!_3745)
    {
        _3265 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3873 = _3265;
    out.m_96.x = _3857;
    out.m_96.y = _3859;
    out.m_96.z = _3867;
    out.m_96.w = _3799;
    bool _3875 = !_3745;
    float _3877 = _3873;
    float _3879 = _3873;
    if (!_3875)
    {
        bool _3881 = _3605 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3883 = isnan(_3605);
        bool _3885 = _3881 || _3883;
        bool _3887 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3889 = _3885 || _3887;
        if (!_3889)
        {
            float _3891 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3893 = _3605 + _3891;
            float _3895 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3897 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3895;
            float _3899 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3901 = _3899 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3903 = 1.0 / _3897;
            float _3905 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3907 = _3905 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3909 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3911 = _3909 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3913 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3915 = _3913 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3917 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3919 = _3917 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3921 = _3893 * _3903;
            float _3923 = precise::clamp(_3921, 0.0, 1.0);
            float _3925 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3927 = _3925 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3929 = fma(_3923, _3901, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3931 = fma(_3923, _3927, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3933 = fma(_3923, _3907, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3935 = fma(_3923, _3911, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3937 = fma(_3923, _3915, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3939 = fma(_3923, _3919, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3879 = _3933;
            _3851 = _3937;
            _3871 = _3929;
            _3837 = _3935;
            _3807 = _3931;
            _3863 = _3939;
            _3941 = true;
        }
        else
        {
            bool _3943 = _3605 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3945 = isnan(_3605);
            bool _3947 = _3943 || _3945;
            bool _3949 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3951 = _3947 || _3949;
            if (!_3951)
            {
                _3869 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3953 = _3869;
            _3871 = _3953;
            if (!_3951)
            {
                _3877 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3955 = _3877;
            _3879 = _3955;
            if (!_3951)
            {
                _3805 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3957 = _3805;
            _3807 = _3957;
            if (!_3951)
            {
                _3835 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3959 = _3835;
            _3837 = _3959;
            if (!_3951)
            {
                _3849 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3961 = _3849;
            _3851 = _3961;
            if (!_3951)
            {
                _3861 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3963 = _3861;
            bool _3965 = !_3951;
            _3863 = _3963;
            if (!_3965)
            {
                bool _3967 = _3605 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3969 = isnan(_3605);
                bool _3971 = _3967 || _3969;
                bool _3973 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3975 = _3971 || _3973;
                if (!_3975)
                {
                    float _3977 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3979 = _3605 + _3977;
                    float _3981 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3983 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3981;
                    float _3985 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3987 = _3985 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3989 = 1.0 / _3983;
                    float _3991 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3993 = _3991 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3995 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3997 = _3995 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3999 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4001 = _3999 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4003 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4005 = _4003 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4007 = _3979 * _3989;
                    float _4009 = precise::clamp(_4007, 0.0, 1.0);
                    float _4011 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4013 = _4011 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4015 = fma(_4009, _3987, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4017 = fma(_4009, _4013, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4019 = fma(_4009, _3993, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4021 = fma(_4009, _3997, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4023 = fma(_4009, _4001, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4025 = fma(_4009, _4005, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3879 = _4019;
                    _3851 = _4023;
                    _3871 = _4015;
                    _3837 = _4021;
                    _3807 = _4017;
                    _3863 = _4025;
                    _3941 = true;
                }
                else
                {
                    _3879 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3851 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3871 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3837 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3807 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3863 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3941 = false;
    float _4027 = _3879;
    float _4029 = _3851;
    float _4031 = _3871;
    float _4033 = _3837;
    float _4035 = _3807;
    float _4037 = _3863;
    float _4039 = _3845 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4041 = fma(_2434, -0.5, 0.5);
    float _4043 = precise::clamp(_4041, 0.0, 1.0);
    float _4045 = -_4027;
    float _4047 = _4045 + _4029;
    float _4049 = -_4031;
    float _4051 = _4049 + _4033;
    out.m_98.x = 0.0;
    float _4053 = fma(_4043, _4047, _4027);
    float _4055 = -_4035;
    float _4057 = _4055 + _4037;
    float _4059 = fma(_4043, _4051, _4031);
    float _4061 = _4053 * 0.586610972881317138671875;
    bool _4063 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4065 = fma(_4043, _4057, _4035);
    out.m_61.x = _4039;
    float _4067 = fma(_4059, 0.298911988735198974609375, _4061);
    bool _4069 = _3319 > 0.0;
    bool _4071 = isnan(_3319);
    bool _4073 = _4069 || _4071;
    bool _4075 = isnan(0.0);
    bool _4077 = _4073 || _4075;
    float _4079 = fma(_4065, 0.114477999508380889892578125, _4067);
    bool _4081 = _3381 <= 0.0;
    bool _4083 = !_4077;
    bool _4085 = _4081 || _4083;
    float _4087 = -_4079;
    float _4089 = _4059 + _4087;
    float _4091 = -_4079;
    float _4093 = _4053 + _4091;
    float _4095 = -_4079;
    float _4097 = _4065 + _4095;
    float _4099 = fma(_4089, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4079);
    float _4101 = fma(_4093, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4079);
    float _4103 = fma(_4097, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4079);
    bool _4105 = !_4063;
    if (!_4105)
    {
        float _4107 = -_3040;
        float _4109 = _4107 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4111 = -_3042;
        float _4113 = _4111 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4115 = -_3044;
        float _4117 = _4115 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4119 = _4109 * _4109;
        float _4121 = fma(_4113, _4113, _4119);
        float _4123 = fma(_4117, _4117, _4121);
        float _4125 = sqrt(_4123);
        float _4127 = rsqrt(_4123);
        float _4129 = -_4125;
        float _4131 = _4129 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4133 = _4131 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4135 = precise::clamp(_4133, 0.0, 1.0);
        float _4137 = _4113 * _4127;
        float _4139 = _4109 * _4127;
        float _4141 = abs(_4135);
        float _4143 = log2(_4141);
        float _4145 = _4117 * _4127;
        float _4147 = _4137 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4149 = _2434 * _4139;
        float _4151 = -_4139;
        float _4153 = -_4147;
        float _4155 = fma(_4151, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4153);
        float _4157 = fma(_2432, _4137, _4149);
        float _4159 = -_4145;
        float _4161 = fma(_4159, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4155);
        float _4163 = fma(_2436, _4145, _4157);
        float _4165 = precise::clamp(_4163, 0.0, 1.0);
        float _4167 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4169 = _4161 + _4167;
        float _4171 = _4143 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4173 = _4169 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4175 = precise::clamp(_4173, 0.0, 1.0);
        float _4177 = exp2(_4171);
        float _4179 = _4177 * _4175;
        float _4181 = _4165 * _4179;
        float _4183 = _4181 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4185 = _4181 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4187 = _4181 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_98.x = _4183;
        out.m_98.y = _4185;
        out.m_98.z = _4187;
    }
    out.m_100.x = _4099;
    out.m_100.y = _4101;
    out.m_100.z = _4103;
    if (!_4085)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_61.x = 0.0;
    float _4189 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4189;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3941 = false;
    bool _2486 = false;
    bool _961 = false;
    bool _769 = false;
    bool _393 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _114 = in.m_58.w;
    float _116 = trunc(_114);
    int _119 = int(_116);
    bool _123 = _119 >= 1;
    float _125 = 0.0;
    if (!_123)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _127 = _125;
    float _129 = _127;
    if (!_123)
    {
        out.m_61.x = 0.0;
    }
    int _131 = 0;
    if (!_123)
    {
        float _133 = _127 * 5.0;
        _131 = as_type<int>(_133);
    }
    int _135 = _131;
    int _137 = _135;
    if (!_123)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4246 = as_type<float>(_135);
        out.gl_Position.z = _4246;
    }
    if (!_123)
    {
        return out;
    }
    float _139 = in.m_63.w;
    bool _141 = _139 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _143 = isnan(_139);
    bool _145 = _141 || _143;
    bool _147 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _149 = _145 || _147;
    float _151 = -_139;
    float _153 = _151 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _155 = _153;
    if (_149)
    {
        float _157 = float(_119);
        _129 = _157;
    }
    float _159 = _129;
    bool _161 = _153 >= _159;
    bool _163 = !_149;
    bool _165 = _161 || _163;
    float _167 = _159;
    if (_165)
    {
        _167 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _169 = _167;
    if (_165)
    {
        out.m_61.x = 0.0;
    }
    if (_165)
    {
        float _171 = _169 * 5.0;
        _137 = as_type<int>(_171);
    }
    int _173 = _137;
    if (_165)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4316 = as_type<float>(_173);
        out.gl_Position.z = _4316;
    }
    if (_165)
    {
        return out;
    }
    float _175 = in.m_65.x;
    float _177 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _179 = _153 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _181 = _153 + (*spvDescriptorSet0.vp_c9)._m0[20].w;
    float _183 = as_type<float>(int(gl_VertexIndex));
    float _185 = in.m_70.x;
    float _187 = in.m_70.y;
    float _189 = in.m_70.z;
    float _191 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].w;
    float _193 = in.m_72.x;
    float _195 = in.m_72.y;
    float _197 = in.m_72.z;
    float _199 = in.m_74.x;
    float _201 = in.m_74.y;
    float _203 = in.m_74.z;
    float _205 = _179 * _177;
    float _207 = in.m_76.x;
    float _209 = in.m_76.y;
    float _211 = in.m_76.z;
    float _213 = fma(_175, (*spvDescriptorSet0.vp_c9)._m0[20].x, _205);
    float _215 = _181 * _191;
    float _217 = floor(_213);
    float _219 = fma(_175, (*spvDescriptorSet0.vp_c9)._m0[20].y, _215);
    float _221 = _213 * 6.283185482025146484375;
    int _223 = as_type<int>(_183) & 1;
    bool _225 = _223 != 0;
    int _227 = as_type<int>(_183) & 2;
    bool _229 = _227 != 0;
    int _231 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _233 = _231 != 0;
    float _235 = _221 * 0.15915493667125701904296875;
    float _237 = floor(_219);
    float _239 = _187 * _195;
    float _241 = _187 * _201;
    float _243 = fma(_185, _193, _239);
    float _245 = -_217;
    float _247 = _213 + _245;
    float _249 = _219 * 6.283185482025146484375;
    float _251 = _187 * _209;
    float _253 = _235 * 6.283185482025146484375;
    float _255 = cos(_253);
    float _257 = fma(_185, _199, _241);
    float _259 = _249 * 0.15915493667125701904296875;
    float _261 = fma(_185, _207, _251);
    float _263 = -_237;
    float _265 = _219 + _263;
    float _267 = -_247;
    float _269 = fma(_267, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _271 = !_229;
    float _273 = _271 ? (-0.5) : 0.5;
    float _275 = _259 * 6.283185482025146484375;
    float _277 = cos(_275);
    int _279 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _281 = _279 != 0;
    int _283 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _285 = _283 != 0;
    float _287 = fma(_189, _203, _257);
    bool _289 = _247 < 0.5;
    float _291 = float(_289);
    bool _293 = !_233;
    int _295 = _293 ? 0 : 1;
    bool _297 = !_281;
    int _299 = _297 ? 0 : 1;
    float _301 = fma(_255, 0.5, 0.5);
    float _303 = -_291;
    float _305 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _307 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _309 = abs(_299);
    float _311 = -_301;
    float _313 = fma(_311, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _315 = abs(_295);
    float _317 = -_265;
    float _319 = fma(_317, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    bool _321 = !_285;
    int _323 = _321 ? 0 : 1;
    float _325 = fma(_277, 0.5, 0.5);
    float _327 = float(_309);
    bool _329 = _265 < 0.5;
    float _331 = float(_329);
    float _333 = float(_315);
    float _335 = abs(_319);
    float _337 = _327 * _335;
    int _339 = abs(_323);
    float _341 = abs(_269);
    float _343 = _327 * _341;
    float _345 = -_325;
    float _347 = fma(_345, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _349 = -_331;
    float _351 = fma(_349, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _353 = float(_339);
    float _355 = fma(_333, _313, _343);
    float _357 = fma(_333, _347, _337);
    float _359 = fma(_189, _197, _243);
    float _361 = fma(_189, _211, _261);
    float _363 = abs(_305);
    float _365 = fma(_353, _363, _355);
    float _367 = abs(_351);
    float _369 = fma(_353, _367, _357);
    bool _371 = !_225;
    float _373 = _371 ? (-0.5) : 0.5;
    bool _375 = !_307;
    float _391;
    if (!_375)
    {
        float _377 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _379 = _175 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _381 = fma(_379, (*spvDescriptorSet0.vp_c9)._m0[12].x, _153);
        float _383 = _381 * _377;
        float _385 = floor(_383);
        float _387 = -_385;
        float _389 = _383 + _387;
        _391 = _389;
        _393 = true;
    }
    else
    {
        float _395 = float(_119);
        float _397 = 1.0 / _395;
        float _399 = _153 * _397;
        _391 = _399;
    }
    _393 = false;
    float _401 = _391;
    float _403 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _405 = _401 + _403;
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _409 = _401 + _407;
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _413 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _411;
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _417 = _415 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _421 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _419;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _425 = _423 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _427 = 1.0 / _413;
    float _429 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _431 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _429;
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _435 = _433 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _437 = 1.0 / _417;
    float _439 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _441 = _401 + _439;
    bool _443 = _401 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _445 = isnan(_401);
    bool _447 = _443 || _445;
    bool _449 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _451 = _447 || _449;
    float _453 = float(_451);
    bool _455 = _401 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _457 = isnan(_401);
    bool _459 = _455 || _457;
    bool _461 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _463 = _459 || _461;
    float _465 = float(_463);
    bool _467 = _401 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _469 = isnan(_401);
    bool _471 = _467 || _469;
    bool _473 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _475 = _471 || _473;
    float _477 = float(_475);
    float _479 = -_453;
    float _481 = _479 + 1.0;
    float _483 = 1.0 / _421;
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _487 = (*spvDescriptorSet0.vp_c9)._m0[150].w + _485;
    float _489 = _441 * _427;
    bool _491 = _401 >= (*spvDescriptorSet0.vp_c9)._m0[150].w;
    bool _493 = isnan(_401);
    bool _495 = _491 || _493;
    bool _497 = isnan((*spvDescriptorSet0.vp_c9)._m0[150].w);
    bool _499 = _495 || _497;
    float _501 = float(_499);
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _505 = _401 + _503;
    float _507 = 1.0 / _425;
    float _509 = _405 * _437;
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _513 = _401 + _511;
    float _515 = -_501;
    float _517 = _515 + 1.0;
    bool _519 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _521 = 1.0 / _431;
    float _523 = _409 * _483;
    bool _525 = _401 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _527 = isnan(_401);
    bool _529 = _525 || _527;
    bool _531 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _533 = _529 || _531;
    float _535 = float(_533);
    float _537 = 1.0 / _487;
    float _539 = _505 * _507;
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _543 = _401 + _541;
    float _545 = 1.0 / _435;
    float _547 = _513 * _521;
    bool _549 = _401 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _551 = isnan(_401);
    bool _553 = _549 || _551;
    bool _555 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _557 = _553 || _555;
    float _559 = float(_557);
    float _561 = _535 * _517;
    float _563 = -_535;
    float _565 = _563 + 1.0;
    float _567 = _543 * _537;
    bool _569 = _401 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _571 = isnan(_401);
    bool _573 = _569 || _571;
    bool _575 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _577 = _573 || _575;
    float _579 = float(_577);
    float _581 = _559 * _565;
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _585 = _401 + _583;
    float _587 = -_559;
    float _589 = _587 + 1.0;
    float _591 = -_579;
    float _593 = _591 + 1.0;
    float _595 = _585 * _545;
    float _597 = _579 * _589;
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _601 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _599;
    float _603 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _605 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _603;
    float _607 = _453 * _593;
    float _609 = -_465;
    float _611 = _609 + 1.0;
    float _613 = fma(_601, _489, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _615 = fma(_605, _489, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _617 = _401 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _619 = isnan(_401);
    bool _621 = _617 || _619;
    bool _623 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _625 = _621 || _623;
    float _627 = float(_625);
    float _629 = _465 * _481;
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _633 = _631 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _635 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _637 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _635;
    float _639 = -_627;
    float _641 = _639 + 1.0;
    float _643 = _627 * _611;
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _647 = _645 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _649 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _651 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _649;
    float _653 = _477 * _641;
    float _655 = -_477;
    float _657 = _655 + 1.0;
    float _659 = fma(_633, _509, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _661 = fma(_647, _509, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _663 = _613 * _653;
    float _665 = _615 * _653;
    float _667 = fma(_651, _523, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _669 = fma(_637, _523, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _671 = fma(_657, (*spvDescriptorSet0.vp_c9)._m0[143].x, _663);
    float _673 = fma(_657, (*spvDescriptorSet0.vp_c9)._m0[143].y, _665);
    float _675 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _677 = _675 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _679 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _681 = _679 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _683 = fma(_659, _643, _671);
    float _685 = fma(_661, _643, _673);
    float _687 = fma(_677, _539, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _689 = fma(_681, _539, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _693 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _691;
    float _695 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _697 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _695;
    float _699 = fma(_667, _629, _683);
    float _701 = fma(_669, _629, _685);
    float _703 = fma(_693, _547, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _705 = fma(_697, _547, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _707 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _709 = _707 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _711 = fma(_687, _607, _699);
    float _713 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _715 = _713 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _717 = fma(_689, _607, _701);
    float _719 = fma(_709, _595, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _721 = -(*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _723 = (*spvDescriptorSet0.vp_c9)._m0[150].x + _721;
    float _725 = fma(_703, _597, _711);
    float _727 = fma(_715, _595, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _729 = -(*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _731 = (*spvDescriptorSet0.vp_c9)._m0[150].y + _729;
    float _733 = fma(_705, _597, _717);
    float _735 = fma(_723, _567, (*spvDescriptorSet0.vp_c9)._m0[149].x);
    float _737 = fma(_719, _581, _725);
    float _739 = fma(_731, _567, (*spvDescriptorSet0.vp_c9)._m0[149].y);
    float _741 = fma(_727, _581, _733);
    float _743 = fma(_735, _561, _737);
    float _745 = fma(_739, _561, _741);
    float _747 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[150].x, _743);
    float _749 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[150].y, _745);
    bool _751 = !_519;
    float _767;
    if (!_751)
    {
        float _753 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _755 = _175 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _757 = fma(_755, (*spvDescriptorSet0.vp_c9)._m0[11].x, _153);
        float _759 = _757 * _753;
        float _761 = floor(_759);
        float _763 = -_761;
        float _765 = _759 + _763;
        _767 = _765;
        _769 = true;
    }
    else
    {
        float _771 = float(_119);
        float _773 = 1.0 / _771;
        float _775 = _153 * _773;
        _767 = _775;
    }
    _769 = false;
    float _777 = _767;
    float _779 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _781 = _777 + _779;
    bool _783 = _777 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _785 = isnan(_777);
    bool _787 = _783 || _785;
    bool _789 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _791 = _787 || _789;
    float _793 = float(_791);
    float _795 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _797 = _777 + _795;
    float _799 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _801 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _799;
    float _803 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _805 = _803 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _807 = 1.0 / _801;
    bool _809 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _811 = 1.0 / _805;
    float _813 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _815 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _813;
    float _817 = _781 * _807;
    bool _819 = _777 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _821 = isnan(_777);
    bool _823 = _819 || _821;
    bool _825 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _827 = _823 || _825;
    float _829 = float(_827);
    float _831 = -_793;
    float _833 = _831 + 1.0;
    bool _835 = _777 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _837 = isnan(_777);
    bool _839 = _835 || _837;
    bool _841 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _843 = _839 || _841;
    float _845 = float(_843);
    float _847 = fma(_815, _817, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _849 = _845 * _833;
    float _851 = -_845;
    float _853 = _851 + 1.0;
    float _855 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _857 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _855;
    float _859 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _861 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _859;
    float _863 = _797 * _811;
    float _865 = _829 * _853;
    float _867 = fma(_857, _817, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _869 = fma(_861, _817, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _871 = -_829;
    float _873 = _871 + 1.0;
    float _875 = _847 * _865;
    float _877 = _867 * _865;
    float _879 = _869 * _865;
    float _881 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _883 = _881 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _885 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _887 = _885 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _889 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _891 = _889 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _893 = fma(_873, (*spvDescriptorSet0.vp_c9)._m0[107].x, _877);
    float _895 = fma(_873, (*spvDescriptorSet0.vp_c9)._m0[107].y, _875);
    float _897 = fma(_883, _863, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _899 = fma(_887, _863, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _901 = fma(_891, _863, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _903 = fma(_873, (*spvDescriptorSet0.vp_c9)._m0[107].z, _879);
    float _905 = fma(_897, _849, _893);
    float _907 = fma(_899, _849, _895);
    float _909 = in.m_78.x;
    float _911 = in.m_78.y;
    float _913 = fma(_901, _849, _903);
    float _915 = fma(_793, (*spvDescriptorSet0.vp_c9)._m0[109].x, _905);
    float _917 = fma(_793, (*spvDescriptorSet0.vp_c9)._m0[109].y, _907);
    float _919 = fma(_793, (*spvDescriptorSet0.vp_c9)._m0[109].z, _913);
    float _921 = _915 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _923 = _917 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _925 = _919 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _927 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _929 = _921 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _931 = _923 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _933 = _925 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_80.x = _929;
    out.m_80.y = _931;
    out.m_80.z = _933;
    out.m_80.w = _927;
    float _935 = _749 * _911;
    float _937 = _747 * _909;
    bool _939 = !_809;
    float _957;
    float _959;
    if (!_939)
    {
        float _941 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _943 = _175 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _945 = float(_119);
        float _947 = fma(_943, (*spvDescriptorSet0.vp_c9)._m0[11].z, _153);
        float _949 = _947 * _941;
        float _951 = floor(_949);
        float _953 = -_951;
        float _955 = _949 + _953;
        _957 = _945;
        _959 = _955;
        _961 = true;
    }
    else
    {
        float _963 = float(_119);
        float _965 = 1.0 / _963;
        float _967 = _153 * _965;
        _957 = _963;
        _959 = _967;
    }
    _961 = false;
    float _969 = _957;
    float _971 = _959;
    float _973 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _975 = int(_973);
    float _977 = in.m_72.w;
    float _979 = in.m_76.w;
    float _981 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _983 = int(_981);
    float _985 = in.m_74.w;
    float _987 = float(_975);
    float _989 = 1.0 / _987;
    float _991 = float(uint(_983));
    int _993 = ~_983;
    int _995 = _993 + 1;
    int _997 = ~_983;
    int _999 = _997 + 1;
    float _1001 = 1.0 / _991;
    float _1003 = _989 * _153;
    float _1005 = trunc(_1003);
    int _1007 = int(_1005);
    int _1009 = as_type<int>(_1001) + (-2);
    float _1011 = float(uint(_1007));
    float _1013 = as_type<float>(_1009) * _1011;
    float _1015 = trunc(_1013);
    float _1017 = precise::max(_1015, 0.0);
    uint _1020 = uint(_1017);
    int _1022 = _995 * int(_1020);
    int _1024 = _1022 + _1007;
    float _1026 = float(uint(_1024));
    float _1028 = as_type<float>(_1009) * _1026;
    int _1030 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1032 = _1030 != 0;
    float _1034 = 1.0 / _969;
    bool _1036 = !_1032;
    float _1038 = _1036 ? 7.345489978790283203125 : 1.0;
    float _1040 = trunc(_1028);
    float _1042 = precise::max(_1040, 0.0);
    uint _1044 = uint(_1042);
    float _1046 = _1038 * _175;
    float _1048 = floor(_1046);
    int _1050 = int(_1020) + int(_1044);
    float _1052 = float(_983);
    float _1054 = float(_1007);
    int _1056 = _999 * _1050;
    int _1058 = _1056 + _1007;
    bool _1060 = _1054 >= _1052;
    bool _1062 = isnan(_1054);
    bool _1064 = _1060 || _1062;
    bool _1066 = isnan(_1052);
    bool _1068 = _1064 || _1066;
    float _1070 = float(_1068);
    float _1072 = -_1048;
    float _1074 = _1046 + _1072;
    bool _1076 = uint(_1058) >= uint(_983);
    float _1078 = _1074 * _1052;
    float _1080 = trunc(_1070);
    int _1082 = int(_1080);
    bool _1084 = !_1076;
    int _1086 = _1084 ? 0 : (-1);
    float _1088 = _1052 * _153;
    int _1090 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1092 = _1090 != 0;
    int _1094 = ~_1050;
    int _1096 = _1094 + _1086;
    int _1098 = _1096 + 1;
    float _1100 = _1088 * _1034;
    bool _1102 = !_1092;
    int _1104 = _1102 ? 0 : 1;
    float _1106 = trunc(_1078);
    int _1108 = int(_1106);
    bool _1110 = _983 == 0;
    int _1112 = abs(_1104);
    int _1114 = _983 * _1098;
    int _1116 = _1114 + _1007;
    int _1118 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1120 = _1118 != 0;
    int _1122 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1124 = _1122 != 0;
    int _1126 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1128 = _1126 != 0;
    int _1130 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1132 = _1130 != 0;
    float _1134 = trunc(_1100);
    int _1136 = int(_1134);
    int _1138 = ~_1082;
    int _1140 = _1138 + 1;
    int _1142 = _1140 + 1;
    bool _1144 = !_1110;
    int _1146 = _1144 ? _1116 : (-1);
    int _1148 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1150 = _1148 != 0;
    int _1152 = _1146 * _1142;
    bool _1154 = !_1124;
    int _1156 = _1154 ? 0 : 1;
    int _1158 = _1108 * _1112;
    int _1160 = _1158 + _1007;
    bool _1162 = !_1120;
    int _1164 = _1162 ? 0 : 1;
    int _1166 = _983 + (-1);
    int _1168 = abs(_1156);
    int _1170 = abs(_1164);
    int _1172 = _1082 * _1166;
    int _1174 = _1172 + _1152;
    bool _1176 = !_1128;
    int _1178 = _1176 ? 0 : 1;
    bool _1180 = !_1132;
    int _1182 = _1180 ? 0 : 1;
    int _1184 = abs(_1178);
    int _1186 = _1174 * _1168;
    float _1188 = in.m_58.x;
    float _1190 = in.m_58.y;
    float _1192 = in.m_58.z;
    int _1194 = abs(_1182);
    int _1196 = _1136 * _1170;
    int _1198 = _1196 + _1186;
    int _1200 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1202 = _1200 != 0;
    int _1204 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1206 = _1204 != 0;
    int _1208 = _1160 * _1184;
    int _1210 = _1208 + _1198;
    float _1212 = in.m_65.y;
    bool _1214 = _175 > 0.5;
    int _1216 = _1108 * _1194;
    int _1218 = _1216 + _1210;
    float _1220 = _175 * 2.0;
    float _1222 = float(uint(_1218));
    float _1224 = floor(_1220);
    float _1226 = as_type<float>(_1009) * _1222;
    float _1228 = _195 * _1190;
    float _1230 = _201 * _1190;
    float _1232 = trunc(_1226);
    float _1234 = precise::max(_1232, 0.0);
    uint _1236 = uint(_1234);
    float _1238 = _209 * _1190;
    float _1240 = fma(_193, _1188, _1228);
    float _1242 = fma(_199, _1188, _1230);
    float _1244 = fma(_207, _1188, _1238);
    float _1246 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1248 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1246;
    int _1250 = ~_983;
    int _1252 = _1250 + 1;
    float _1254 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1256 = _1254 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1258 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1260 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1262 = in.m_65.z;
    float _1264 = 1.0 / _1248;
    float _1266 = _175 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1268 = _1224 > 0.0;
    int _1270 = _1252 * int(_1236);
    int _1272 = _1270 + _1218;
    bool _1274 = _1224 >= 0.0;
    bool _1276 = isnan(_1224);
    bool _1278 = _1274 || _1276;
    bool _1280 = isnan(0.0);
    bool _1282 = _1278 || _1280;
    float _1284 = -_1258;
    float _1286 = fma(_1266, 2.0, _1284);
    float _1288 = _1212 * 2.0;
    float _1290 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1292 = _971 + _1290;
    float _1294 = 1.0 / _1256;
    float _1296 = float(uint(_1272));
    float _1298 = _1212 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1300 = -_153;
    float _1302 = fma(_1300, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1286);
    float _1304 = as_type<float>(_1009) * _1296;
    int _1306 = _1282 ? 0 : 1;
    float _1308 = floor(_1288);
    float _1310 = -_373;
    int _1312 = _1214 ? as_type<int>(_1310) : as_type<int>(_373);
    float _1314 = _1292 * _1264;
    bool _1316 = _1212 > 0.5;
    float _1318 = fma(_1298, -2.0, _1260);
    bool _1320 = !_1206;
    float _1322 = _1320 ? _373 : as_type<float>(_1312);
    float _1324 = fma(_203, _1192, _1242);
    float _1326 = -_273;
    int _1328 = _1316 ? as_type<int>(_1326) : as_type<int>(_273);
    float _1330 = trunc(_1304);
    float _1332 = precise::max(_1330, 0.0);
    uint _1334 = uint(_1332);
    int _1336 = ~_1306;
    int _1338 = _1336 + 1;
    int _1340 = _1338 + 1;
    float _1342 = _1324 + _985;
    int _1344 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1346 = _1344 != 0;
    int _1348 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1350 = _1348 != 0;
    int _1352 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1354 = _1352 != 0;
    float _1356 = fma(_197, _1192, _1240);
    int _1358 = _1340;
    float _1360 = _1342;
    if (!_1268)
    {
        int _1362 = ~_1306;
        int _1364 = _1362 + 1;
        _1358 = _1364;
    }
    int _1366 = _1358;
    float _1368 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1370 = _971 + _1368;
    float _1372 = _175 + _1212;
    bool _1374 = _1308 >= 0.0;
    bool _1376 = isnan(_1308);
    bool _1378 = _1374 || _1376;
    bool _1380 = isnan(0.0);
    bool _1382 = _1378 || _1380;
    float _1384 = fma(_211, _1192, _1244);
    float _1386 = _1212 + _1262;
    float _1388 = _1370 * _1294;
    int _1390 = _1382 ? 0 : 1;
    float _1392 = _1372 + (-1.0);
    float _1394 = _1386 + (-1.0);
    bool _1396 = _1308 > 0.0;
    float _1398 = _1262 * 2.0;
    int _1400 = int(_1236) + int(_1334);
    float _1402 = _1384 + _979;
    float _1404 = floor(_1398);
    int _1406 = ~_983;
    int _1408 = _1406 + 1;
    float _1410 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1318);
    float _1412 = fma(_1394, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1414 = ~_1390;
    int _1416 = _1414 + 1;
    int _1418 = _1416 + 1;
    int _1420 = _1408 * _1400;
    int _1422 = _1420 + _1218;
    float _1424 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1426 = log2(_1424);
    float _1428 = fma(_1392, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1430 = !_1150;
    float _1432 = _1430 ? _273 : as_type<float>(_1328);
    float _1434 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1436 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1434;
    bool _1438 = uint(_1422) >= uint(_983);
    int _1440 = _1418;
    float _1442 = _1412;
    if (!_1396)
    {
        int _1444 = ~_1390;
        int _1446 = _1444 + 1;
        _1440 = _1446;
    }
    int _1448 = _1440;
    float _1450 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1452 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1450;
    bool _1454 = !_1438;
    int _1456 = _1454 ? 0 : (-1);
    float _1458 = fma(_1452, _1314, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    bool _1460 = _1404 > 0.0;
    bool _1462 = _1404 >= 0.0;
    bool _1464 = isnan(_1404);
    bool _1466 = _1462 || _1464;
    bool _1468 = isnan(0.0);
    bool _1470 = _1466 || _1468;
    float _1472 = _1322 + 0.5;
    float _1474 = _1426 * _153;
    float _1476 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1478 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1476;
    float _1480 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1482 = _1480 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1484 = fma(_1472, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1302);
    float _1486 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1488 = _1486 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1490 = _1356 + _977;
    float _1492 = exp2(_1474);
    float _1494 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1496 = _1494 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1498 = fma(_1478, _1314, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1500 = fma(_1436, _1314, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1502 = fma(_1482, _1388, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    int _1504 = ~_1400;
    int _1506 = _1504 + _1456;
    int _1508 = _1506 + 1;
    float _1510 = fma(_1488, _1388, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1512 = fma(_1496, _1388, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1514 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1516 = 1.0 + _1514;
    bool _1518 = _971 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1520 = isnan(_971);
    bool _1522 = _1518 || _1520;
    bool _1524 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1526 = _1522 || _1524;
    float _1528 = float(_1526);
    int _1530 = _983 * _1508;
    int _1532 = _1530 + _1218;
    int _1534 = _1470 ? 0 : 1;
    float _1536 = 1.0 / _1516;
    bool _1538 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1540 = isnan(0.0);
    bool _1542 = _1538 || _1540;
    bool _1544 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1546 = _1542 || _1544;
    float _1548 = -_1528;
    float _1550 = _1548 + 1.0;
    float _1552 = -_1492;
    float _1554 = _1552 + 1.0;
    bool _1556 = _971 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1558 = isnan(_971);
    bool _1560 = _1556 || _1558;
    bool _1562 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1564 = _1560 || _1562;
    float _1566 = float(_1564);
    float _1568 = _1546 ? _1554 : 0.0;
    float _1570 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1572 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1574 = isnan(1.0);
    bool _1576 = _1572 || _1574;
    bool _1578 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1580 = _1576 || _1578;
    float _1582 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1584 = _971 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1586 = isnan(_971);
    bool _1588 = _1584 || _1586;
    bool _1590 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1592 = _1588 || _1590;
    float _1594 = float(_1592);
    float _1596 = _1566 * _1550;
    float _1598 = -_1566;
    float _1600 = _1598 + 1.0;
    float _1602 = float(uint(_1160));
    float _1604 = fma(_1212, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1570);
    float _1606 = fma(_175, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1582);
    float _1608 = _1594 * _1600;
    bool _1610 = !_1110;
    int _1612 = _1610 ? _1532 : (-1);
    float _1614 = as_type<float>(_1009) * _1602;
    float _1616 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1606);
    float _1618 = _1498 * _1608;
    float _1620 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1604);
    int _1622 = _1612 >> 31;
    if (_1580)
    {
        float _1624 = _1568 * _1536;
        _155 = _1624;
    }
    float _1626 = _155;
    float _1628 = _1432 + (-0.5);
    float _1630 = _1458 * _1608;
    float _1632 = _1500 * _1608;
    int _1634 = ~_983;
    int _1636 = _1634 + 1;
    float _1638 = trunc(_1614);
    float _1640 = precise::max(_1638, 0.0);
    uint _1642 = uint(_1640);
    int _1644 = _1622 & 3;
    float _1646 = -_1628;
    float _1648 = -_1410;
    float _1650 = fma(_1646, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1648);
    float _1652 = -_1594;
    float _1654 = _1652 + 1.0;
    int _1656 = _1612 + _1644;
    float _1658 = -_1616;
    float _1660 = _1658 + 1.0;
    int _1662 = ~_1534;
    int _1664 = _1662 + 1;
    int _1666 = _1664 + 1;
    float _1668 = fma(_1654, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1618);
    int _1670 = _1656 >> 2;
    float _1672 = fma(_1654, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1630);
    float _1674 = fma(_1654, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1632);
    int _1676 = _1666;
    if (!_1460)
    {
        int _1678 = ~_1534;
        int _1680 = _1678 + 1;
        _1676 = _1680;
    }
    int _1682 = _1676;
    float _1684 = fma(_1502, _1596, _1668);
    int _1686 = _1670 << 4;
    int _1688 = _1686 + 368;
    float _1690 = -_1660;
    float _1692 = fma(_1322, _1690, _1484);
    bool _1694 = !_1350;
    int _1696 = _1694 ? 0 : 1;
    int _1698 = _1636 * int(_1642);
    int _1700 = _1698 + _1160;
    uint _1702 = uint(int(uint(_1688) >> uint(2)));
    uint _1704 = uint(int(uint(int(_1702)) >> uint(2)));
    int _1706 = int(_1702) & 3;
    float _1708 = (*spvDescriptorSet0.vp_c9)._m0[int(_1704)][_1706];
    int _1710 = int(_1702) + 1;
    uint _1712 = uint(int(uint(_1710) >> uint(2)));
    int _1714 = _1710 & 3;
    float _1716 = (*spvDescriptorSet0.vp_c9)._m0[int(_1712)][_1714];
    float _1718 = fma(_1510, _1596, _1672);
    int _1720 = abs(_1696);
    float _1722 = fma(_1512, _1596, _1674);
    float _1724 = float(uint(_1700));
    float _1726 = -_1620;
    float _1728 = _1726 + 1.0;
    float _1730 = _1212 + (-0.5);
    int _1732 = _1612 & 3;
    bool _1734 = _1732 != 0;
    float _1736 = as_type<float>(_1009) * _1724;
    float _1738 = float(_1366);
    float _1740 = fma(_1432, _1728, _1650);
    float _1742 = float(_1720);
    float _1744 = trunc(_1736);
    float _1746 = precise::max(_1744, 0.0);
    uint _1748 = uint(_1746);
    bool _1750 = !_1346;
    int _1752 = _1750 ? 0 : 1;
    bool _1754 = uint(_1732) > 1u;
    float _1756 = _1742 * _1738;
    int _1758 = abs(_1752);
    out.m_82.x = _1692;
    out.m_82.y = _1740;
    int _1760 = _1688 + 8;
    uint _1762 = uint(int(uint(_1760) >> uint(2)));
    uint _1764 = uint(int(uint(int(_1762)) >> uint(2)));
    int _1766 = int(_1762) & 3;
    float _1768 = (*spvDescriptorSet0.vp_c9)._m0[int(_1764)][_1766];
    int _1770 = int(_1762) + 1;
    uint _1772 = uint(int(uint(_1770) >> uint(2)));
    int _1774 = _1770 & 3;
    float _1776 = (*spvDescriptorSet0.vp_c9)._m0[int(_1772)][_1774];
    int _1778 = _1612 & 3;
    bool _1780 = _1778 != 0;
    float _1782 = fma(_1528, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1684);
    int _1784 = ~_983;
    int _1786 = _1784 + 1;
    float _1788 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1790 = _1490 + _1788;
    float _1792 = float(_1682);
    int _1794 = _1780 ? 0 : 1;
    int _1796 = int(_1642) + int(_1748);
    int _1798 = ~_1794;
    int _1800 = _1798 + 1;
    int _1802 = _1800 + 1;
    int _1804 = _1802;
    if (!_1754)
    {
        int _1806 = ~_1794;
        int _1808 = _1806 + 1;
        _1804 = _1808;
    }
    int _1810 = _1804;
    bool _1812 = !_1734;
    int _1814 = _1812 ? 0 : 1;
    float _1816 = float(_1758);
    float _1818 = fma(_1528, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1718);
    int _1820 = abs(_1810);
    int _1822 = _1786 * _1796;
    int _1824 = _1822 + _1160;
    bool _1826 = _1732 != 3;
    float _1828 = _1816 * _1792;
    int _1830 = abs(_1814);
    float _1832 = fma(_1528, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1722);
    float _1834 = _1828 * (-2.0);
    bool _1836 = uint(_1732) >= 2u;
    bool _1838 = uint(_1824) >= uint(_983);
    int _1840 = ~_1820;
    int _1842 = _1840 + 1;
    int _1844 = _1842 + 1;
    int _1846 = _1836 ? 0 : 1;
    bool _1848 = !_1838;
    int _1850 = _1848 ? 0 : (-1);
    int _1852 = _1844 * as_type<int>(_1716);
    int _1854 = ~_1830;
    int _1856 = _1854 + 1;
    int _1858 = _1856 + 1;
    bool _1860 = _1732 != 3;
    int _1862 = ~_1846;
    int _1864 = _1862 + 1;
    int _1866 = _1864 + 1;
    int _1868 = _1866;
    if (_1826)
    {
        int _1870 = ~_1846;
        int _1872 = _1870 + 1;
        _1868 = _1872;
    }
    int _1874 = _1868;
    int _1876 = ~_1796;
    int _1878 = _1876 + _1850;
    int _1880 = _1878 + 1;
    int _1882 = _1858 * as_type<int>(_1708);
    int _1884 = _1882 + _1852;
    bool _1886 = !_1860;
    int _1888 = _1886 ? 0 : (-1);
    float _1890 = in.m_84.x;
    float _1892 = in.m_84.y;
    float _1894 = in.m_84.z;
    int _1896 = abs(_1874);
    float _1898 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1900 = _1342 + _1898;
    int _1902 = abs(_1888);
    float _1904 = _1900 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _1906 = !_1202;
    int _1908 = _1906 ? 0 : 1;
    float _1910 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1912 = _1402 + _1910;
    int _1914 = ~_1896;
    int _1916 = _1914 + 1;
    int _1918 = _1916 + 1;
    float _1920 = fma(_1790, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1904);
    int _1922 = abs(_1908);
    int _1924 = ~_1902;
    int _1926 = _1924 + 1;
    int _1928 = _1926 + 1;
    int _1930 = _1918 * as_type<int>(_1768);
    int _1932 = _1930 + _1884;
    float _1934 = fma(_1912, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1920);
    float _1936 = _1756 * (-2.0);
    int _1938 = _1928 * as_type<int>(_1776);
    int _1940 = _1938 + _1932;
    int _1942 = ~_1922;
    int _1944 = _1942 + 1;
    int _1946 = _1944 + 1;
    bool _1948 = _1934 >= 0.0;
    float _1950 = fma(_1412, _1936, _1412);
    int _1952 = _1940 * _1946;
    float _1954 = _1900 * _1900;
    float _1956 = fma(_1936, _1892, _1892);
    int _1958 = _983 * _1880;
    int _1960 = _1958 + _1160;
    float _1962 = fma(_1428, _1834, _1428);
    float _1964 = fma(_1790, _1790, _1954);
    float _1966 = _1832 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1968 = fma(_1730, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1956);
    bool _1970 = !_1110;
    int _1972 = _1970 ? _1960 : (-1);
    float _1974 = fma(_1912, _1912, _1964);
    if (_1948)
    {
        _1442 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1976 = _1442;
    float _1978 = _1818 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1980 = _1966 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1982 = _1972 * _1922;
    int _1984 = _1982 + _1952;
    float _1986 = _1782 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1988 = rsqrt(_1974);
    float _1990 = _1978 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1992 = _1986 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1994 = as_type<int>(_1976);
    if (_1948)
    {
        float _1996 = _1976 * 5.0;
        _1994 = as_type<int>(_1996);
    }
    int _1998 = _1994;
    float _2000 = float(_1984);
    if (_1948)
    {
        out.m_61.x = 0.0;
    }
    bool _2002 = !_1354;
    int _2004 = _2002 ? 0 : 1;
    float _2006 = fma(_1834, _1890, _1890);
    float _2008 = fma(_1950, _1626, _1968);
    out.m_86.x = _1992;
    out.m_86.y = _1990;
    out.m_86.z = _1980;
    float _2010 = _175 + (-0.5);
    if (_1948)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7075 = as_type<float>(_1998);
        out.gl_Position.z = _7075;
    }
    float _2012 = _1900 * _1988;
    float _2014 = _1790 * _1988;
    out.m_88.x = _2000;
    int _2016 = abs(_2004);
    if (_1948)
    {
        return out;
    }
    float _2018 = -_2012;
    float _2020 = fma(_2018, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1342);
    float _2022 = _1912 * _1988;
    float _2024 = -_2014;
    float _2026 = fma(_2024, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1490);
    float _2028 = float(_2016);
    float _2030 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2032 = _2020 + _2030;
    float _2034 = -_2022;
    float _2036 = fma(_2034, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1402);
    float _2038 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2040 = _2026 + _2038;
    float _2042 = float(_1448);
    float _2044 = _2032 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2046 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2048 = _2036 + _2046;
    float _2050 = _175 + _1262;
    float _2052 = fma(_2040, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2044);
    float _2054 = _2028 * _2042;
    float _2056 = _2050 + (-1.0);
    float _2058 = -_2012;
    float _2060 = fma(_2058, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1900);
    float _2062 = fma(_2048, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2052);
    float _2064 = _2054 * (-2.0);
    float _2066 = fma(_2056, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2068 = _1262 + (-0.5);
    float _2070 = fma(_2010, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2006);
    bool _2072 = _2062 >= 0.0;
    float _2074 = fma(_2064, _1894, _1894);
    float _2076 = -_2014;
    float _2078 = fma(_2076, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1790);
    float _2080 = _2060 * _2060;
    float _2082 = fma(_2066, _2064, _2066);
    float _2084 = fma(_2068, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2074);
    float _2086 = fma(_1962, _1626, _2070);
    float _2088 = fma(_2078, _2078, _2080);
    float _2090 = -_2022;
    float _2092 = fma(_2090, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1912);
    float _2094 = _2008 * 0.15915493667125701904296875;
    float _2096 = fma(_2082, _1626, _2084);
    float _2098 = _2086 * 0.15915493667125701904296875;
    float _2100 = fma(_2092, _2092, _2088);
    float _2102 = _2094 * 6.283185482025146484375;
    float _2104 = sin(_2102);
    float _2106 = (*spvDescriptorSet0.vp_c9)._m0[198].z;
    int _2108 = as_type<int>(_2074);
    float _2110 = _2020;
    if (_2072)
    {
        _2106 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2112 = _2106;
    if (_2072)
    {
        out.m_61.x = 0.0;
    }
    float _2114 = _369 * _935;
    if (_2072)
    {
        float _2116 = _2112 * 5.0;
        _2108 = as_type<int>(_2116);
    }
    int _2118 = _2108;
    float _2120 = _2094 * 6.283185482025146484375;
    float _2122 = cos(_2120);
    if (_2072)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7273 = as_type<float>(_2118);
        out.gl_Position.z = _7273;
    }
    float _2124 = _2098 * 6.283185482025146484375;
    float _2126 = sin(_2124);
    float _2128 = _2096 * 0.15915493667125701904296875;
    float _2130 = sqrt(_2100);
    float _2132 = _2098 * 6.283185482025146484375;
    float _2134 = cos(_2132);
    if (_2072)
    {
        return out;
    }
    float _2136 = _2114 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2138 = _1988 * _2130;
    float _2140 = _2128 * 6.283185482025146484375;
    float _2142 = cos(_2140);
    float _2144 = _365 * _937;
    float _2146 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _273);
    float _2148 = _2138 * _2136;
    float _2150 = _2134 * _2122;
    float _2152 = _2144 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2154 = _2134 * _2104;
    float _2156 = _2146 * _2148;
    float _2158 = _2128 * 6.283185482025146484375;
    float _2160 = sin(_2158);
    float _2162 = _2126 * _2104;
    float _2164 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _373);
    float _2166 = _2138 * _2152;
    float _2168 = _2126 * _2122;
    float _2170 = _2164 * _2166;
    float _2172 = _2134 * _2142;
    float _2174 = _2126 * _2142;
    float _2176 = _2122 * _2142;
    float _2178 = _2104 * _2142;
    float _2180 = _2172 * _2156;
    float _2182 = _2138 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2184 = _2182 * 0.5;
    float _2186 = _2172 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2188 = _2172 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2190 = fma(_2160, _2150, _2162);
    float _2192 = -_2168;
    float _2194 = fma(_2160, _2154, _2192);
    float _2196 = -_2156;
    float _2198 = _2160 * _2196;
    float _2200 = -_2154;
    float _2202 = fma(_2160, _2168, _2200);
    float _2204 = fma(_2190, _2170, _2180);
    float _2206 = _2174 * _2156;
    float _2208 = fma(_2176, _2170, _2198);
    float _2210 = fma(_2160, _2162, _2150);
    float _2212 = fma(_2194, _2184, _2204);
    float _2214 = fma(_2202, _2170, _2206);
    float _2216 = fma(_2178, _2184, _2208);
    float _2218 = _2190 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2220 = _2212 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2222 = _2212 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2224 = fma(_2210, _2184, _2214);
    float _2226 = _2212 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2228 = fma(_2216, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2220);
    float _2230 = fma(_2216, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2222);
    float _2232 = _2190 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2234 = fma(_2216, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2226);
    float _2236 = fma(_2224, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2228);
    float _2238 = fma(_2224, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2230);
    float _2240 = _2190 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2242 = fma(_2224, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2234);
    float _2244 = _2236 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2246 = _2238 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2248 = _2172 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2250 = _2242 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2252 = _1490 + _2244;
    float _2254 = _1402 + _2246;
    float _2256 = fma(_2176, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2218);
    float _2258 = fma(_2176, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2232);
    float _2260 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2262 = _2252 + _2260;
    float _2264 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2266 = _2254 + _2264;
    float _2268 = _2194 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2270 = _2194 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2272 = _2262 * _2262;
    float _2274 = _2266 * _2266;
    float _2276 = _2194 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2278 = _1342 + _2250;
    float _2280 = fma(_2176, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2240);
    float _2282 = _2272 + _2274;
    float _2284 = -_2160;
    float _2286 = fma(_2284, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2186);
    float _2288 = -_2160;
    float _2290 = fma(_2288, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2188);
    float _2292 = -_2160;
    float _2294 = fma(_2292, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2248);
    float _2296 = sqrt(_2282);
    float _2298 = fma(_2202, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2256);
    float _2300 = fma(_2202, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2258);
    float _2302 = fma(_2178, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2268);
    float _2304 = fma(_2178, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2270);
    float _2306 = fma(_2178, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2276);
    float _2308 = fma(_2202, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2280);
    bool _2310 = _2296 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2312 = _2178;
    float _2314 = _2194;
    float _2316 = _2272;
    float _2318 = _2274;
    float _2320 = _2254;
    int _2322 = as_type<int>(_2286);
    float _2324 = _2186;
    if (!_2310)
    {
        _2312 = _2252;
    }
    float _2326 = _2312;
    float _2328 = _2326;
    if (!_2310)
    {
        _2314 = _2278;
    }
    float _2330 = _2314;
    bool _2332 = !_2310;
    float _2334 = _2330;
    if (!_2332)
    {
        float _2336 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2338 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2340 = _2296 + _2338;
        float _2342 = _2278 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2344 = rsqrt(_2282);
        float _2346 = _2340 * _2336;
        float _2348 = _2346 * 0.15915493667125701904296875;
        float _2350 = _2348 * 6.283185482025146484375;
        float _2352 = sin(_2350);
        float _2354 = _2348 * 6.283185482025146484375;
        float _2356 = cos(_2354);
        float _2358 = fma(_2352, _2342, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2360 = _2344 * _2358;
        float _2362 = fma(_2262, _2360, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2364 = _2356 + (-1.0);
        float _2366 = fma(_2266, _2360, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2368 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2370 = _2362 + _2368;
        float _2372 = _2364 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2374 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2376 = _2366 + _2374;
        float _2378 = _2370 * _2370;
        float _2380 = fma(_2278, _2356, _2372);
        float _2382 = _2376 * _2376;
        _2334 = _2380;
        _2316 = _2378;
        _2318 = _2382;
        _2320 = _2366;
        _2328 = _2362;
    }
    float _2384 = _2334;
    float _2386 = _2316;
    float _2388 = _2318;
    float _2390 = _2320;
    float _2392 = _2328;
    float _2394 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2396 = _2384 + _2394;
    float _2398 = fma(_2174, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2286);
    float _2400 = fma(_2174, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2290);
    float _2402 = fma(_2174, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2294);
    float _2404 = fma(_2396, _2396, _2386);
    float _2406 = _273 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2408 = _373 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2410 = fma(_2210, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2302);
    float _2412 = _2404 + _2388;
    float _2414 = _2406 * _2398;
    float _2416 = _2406 * _2400;
    float _2418 = _2406 * _2402;
    float _2420 = fma(_2210, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2304);
    float _2422 = fma(_2210, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2306);
    float _2424 = sqrt(_2412);
    float _2426 = fma(_2408, _2298, _2414);
    float _2428 = fma(_2408, _2300, _2416);
    float _2430 = fma(_2408, _2308, _2418);
    float _2432 = _2410 + _2426;
    float _2434 = _2420 + _2428;
    float _2436 = _2422 + _2430;
    out.m_90.x = _2432;
    out.m_90.y = _2434;
    out.m_90.z = _2436;
    bool _2438 = _2424 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2440 = isnan(_2424);
    bool _2442 = _2438 || _2440;
    bool _2444 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2446 = _2442 || _2444;
    float _2448 = 0.0;
    int _2450 = as_type<int>(_2392);
    if (!_2446)
    {
        _2448 = 1.0;
    }
    float _2452 = _2448;
    bool _2454 = !_2446;
    float _2456 = _2452;
    if (!_2454)
    {
        bool _2458 = _2424 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2460 = isnan(_2424);
        bool _2462 = _2458 || _2460;
        bool _2464 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2466 = _2462 || _2464;
        if (!_2466)
        {
            float _2468 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2470 = _2424 + _2468;
            float _2472 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2474 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2472;
            float _2476 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2478 = _2476 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2480 = 1.0 / _2474;
            float _2482 = _2470 * _2480;
            float _2484 = fma(_2482, _2478, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2456 = _2484;
            _2486 = true;
        }
        else
        {
            bool _2488 = _2424 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2490 = isnan(_2424);
            bool _2492 = _2488 || _2490;
            bool _2494 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2496 = _2492 || _2494;
            if (!_2496)
            {
                float _2498 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2500 = _2424 + _2498;
                float _2502 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2504 = _2502 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2506 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2508 = _2506 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2510 = 1.0 / _2504;
                float _2512 = _2500 * _2510;
                float _2514 = fma(_2512, _2508, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2456 = _2514;
                _2486 = true;
            }
            else
            {
                _2456 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2486 = false;
    float _2516 = _2456;
    float _2518 = fma(_2026, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2520 = fma(_2036, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2522 = floor(_2518);
    float _2524 = floor(_2520);
    float _2526 = -_2522;
    float _2528 = _2518 + _2526;
    float _2530 = -_2524;
    float _2532 = _2520 + _2530;
    float2 _7979 = float2(_2528, _2532);
    float _2534 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7979, float2(0.0), isnan(_7979)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7979, float2(0.0), isnan(_7979)), level(0.0)).x;
    float _2536 = _2020 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2538 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _2540 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2542 = _2384 + _2540;
    float _2544 = fma(_2026, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2536);
    float _2546 = _2020 + _2538;
    float _2548 = fma(_2542, _2516, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2550 = fma(_2036, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2544);
    float _2552 = _2020 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2554 = _2546 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _2556 = -_1342;
    float _2558 = _2556 + _2548;
    float _2560 = _2550 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2562 = fma(_2026, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2552);
    float _2564 = fma(_2026, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2554);
    float _2566 = 1.0 / _2560;
    float _2568 = fma(_2036, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2562);
    float _2570 = fma(_2036, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2564);
    float _2572 = _2568 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2574 = _2570 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _2576 = _2546 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2578 = _2572 + _2560;
    float _2580 = fma(_2026, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2576);
    float _2582 = trunc(_2574);
    int _2584 = int(_2582);
    float _2586 = fma(_2036, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2580);
    float _2588 = _2578 * _2566;
    float _2590 = _2588 * 0.5;
    float _2592 = _2586 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _2594 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2596 = fma(_2590, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2594);
    float _2598 = trunc(_2592);
    int _2600 = int(_2598);
    int _2602 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2604 = _2584 + _2602;
    int _2606 = _2604 + 1;
    float _2608 = 1.0 / _2596;
    bool _2610 = _2606 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _2612 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2614 = _2600 + _2612;
    int _2616 = _2614 + 1;
    int _2618 = _2606 | _2616;
    float _2620 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2622 = _2608 * _2620;
    bool _2624 = _2618 < 0;
    bool _2626 = _2624 || _2610;
    float _2628 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2630 = _2390 + _2628;
    bool _2632 = _2622 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _2634 = _2622 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _2636 = _2616 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2638 = _2636 || _2626;
    bool _2640 = !_2632;
    int _2642 = _2640 ? 0 : 1;
    int _2644 = 2;
    int _2646 = _2642;
    int _2648 = as_type<int>(_2542);
    float _2650 = _2548;
    float _2652 = _2558;
    float _2654 = _2592;
    float _2656 = _2574;
    if (!_2632)
    {
        _2644 = 1;
    }
    int _2658 = _2644;
    int _2660 = _2658;
    if (!_2634)
    {
        _2660 = _2642;
    }
    int _2662 = _2660;
    float _2664 = as_type<float>(_2662);
    if (!_2638)
    {
        int _2666 = _2616 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _2668 = _2666 + _2606;
        _2322 = _2668;
    }
    int _2670 = _2322;
    float _2672 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2674 = _2392 + _2672;
    int _2676 = _2662 << 6;
    if (!_2638)
    {
        int _2678 = _2670 << 2;
        _2646 = _2678;
    }
    int _2680 = _2646;
    int _2682 = _2676 + 96;
    uint _2684 = uint(int(uint(_2682) >> uint(2)));
    uint _2686 = uint(int(uint(int(_2684)) >> uint(2)));
    int _2688 = int(_2684) & 3;
    float _2690 = (*spvDescriptorSet0.vp_c15)._m0[int(_2686)][_2688];
    int _2692 = int(_2684) + 1;
    uint _2694 = uint(int(uint(_2692) >> uint(2)));
    int _2696 = _2692 & 3;
    float _2698 = (*spvDescriptorSet0.vp_c15)._m0[int(_2694)][_2696];
    if (!_2638)
    {
        uint _2700 = uint(int(uint(_2670) >> uint(2)));
        _2450 = int(_2700);
    }
    int _2702 = _2450;
    float _2704 = fma(_2674, _2516, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2706 = _2704;
    if (!_2638)
    {
        int _2708 = 12 & _2680;
        _2648 = _2708;
    }
    int _2710 = _2648;
    float _2712 = fma(_2630, _2516, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2714 = -_1490;
    float _2716 = _2714 + _2704;
    float _2718 = _2712;
    if (!_2638)
    {
        int _2720 = _2702 << 4;
        int _2722 = _2720 + _2710;
        _2324 = as_type<float>(_2722);
    }
    float _2724 = _2324;
    int _2726 = _2676 + 104;
    uint _2728 = uint(int(uint(_2726) >> uint(2)));
    uint _2730 = uint(int(uint(int(_2728)) >> uint(2)));
    int _2732 = int(_2728) & 3;
    float _2734 = (*spvDescriptorSet0.vp_c15)._m0[int(_2730)][_2732];
    int _2736 = int(_2728) + 1;
    uint _2738 = uint(int(uint(_2736) >> uint(2)));
    int _2740 = _2736 & 3;
    float _2742 = (*spvDescriptorSet0.vp_c15)._m0[int(_2738)][_2740];
    float _2744 = _2558 * _2558;
    float _2746 = -_1402;
    float _2748 = _2746 + _2712;
    float _2750 = fma(_2716, _2716, _2744);
    int _2752 = _2676 + 48;
    uint _2754 = uint(int(uint(_2752) >> uint(2)));
    uint _2756 = uint(int(uint(int(_2754)) >> uint(2)));
    int _2758 = int(_2754) & 3;
    float _2760 = (*spvDescriptorSet0.vp_c15)._m0[int(_2756)][_2758];
    int _2762 = int(_2754) + 1;
    uint _2764 = uint(int(uint(_2762) >> uint(2)));
    int _2766 = _2762 & 3;
    float _2768 = (*spvDescriptorSet0.vp_c15)._m0[int(_2764)][_2766];
    float _2770 = fma(_2748, _2748, _2750);
    float _2772 = sqrt(_2770);
    int _2774 = _2676 + 64;
    uint _2776 = uint(int(uint(_2774) >> uint(2)));
    uint _2778 = uint(int(uint(int(_2776)) >> uint(2)));
    int _2780 = int(_2776) & 3;
    float _2782 = (*spvDescriptorSet0.vp_c15)._m0[int(_2778)][_2780];
    int _2784 = int(_2776) + 1;
    uint _2786 = uint(int(uint(_2784) >> uint(2)));
    int _2788 = _2784 & 3;
    float _2790 = (*spvDescriptorSet0.vp_c15)._m0[int(_2786)][_2788];
    int _2792 = _2676 + 56;
    uint _2794 = uint(int(uint(_2792) >> uint(2)));
    uint _2796 = uint(int(uint(int(_2794)) >> uint(2)));
    int _2798 = int(_2794) & 3;
    float _2800 = (*spvDescriptorSet0.vp_c15)._m0[int(_2796)][_2798];
    int _2802 = int(_2794) + 1;
    uint _2804 = uint(int(uint(_2802) >> uint(2)));
    int _2806 = _2802 & 3;
    float _2808 = (*spvDescriptorSet0.vp_c15)._m0[int(_2804)][_2806];
    bool _2810 = _2772 > 0.0;
    int _2812 = _2676 + 72;
    uint _2814 = uint(int(uint(_2812) >> uint(2)));
    uint _2816 = uint(int(uint(int(_2814)) >> uint(2)));
    int _2818 = int(_2814) & 3;
    float _2820 = (*spvDescriptorSet0.vp_c15)._m0[int(_2816)][_2818];
    int _2822 = int(_2814) + 1;
    uint _2824 = uint(int(uint(_2822) >> uint(2)));
    int _2826 = _2822 & 3;
    float _2828 = (*spvDescriptorSet0.vp_c15)._m0[int(_2824)][_2826];
    int _2830 = _2676 + 80;
    uint _2832 = uint(int(uint(_2830) >> uint(2)));
    uint _2834 = uint(int(uint(int(_2832)) >> uint(2)));
    int _2836 = int(_2832) & 3;
    float _2838 = (*spvDescriptorSet0.vp_c15)._m0[int(_2834)][_2836];
    int _2840 = int(_2832) + 1;
    uint _2842 = uint(int(uint(_2840) >> uint(2)));
    int _2844 = _2840 & 3;
    float _2846 = (*spvDescriptorSet0.vp_c15)._m0[int(_2842)][_2844];
    float _2848 = _2546 * _2698;
    float _2850 = fma(_2026, _2690, _2848);
    bool _2852 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2854 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2856 = _2852 || _2854;
    bool _2858 = isnan(0.5);
    bool _2860 = _2856 || _2858;
    float _2862 = _2690;
    if (!_2638)
    {
        float _2864 = floor(_2574);
        _2862 = _2864;
    }
    float _2866 = _2862;
    int _2868 = _2676 + 88;
    uint _2870 = uint(int(uint(_2868) >> uint(2)));
    uint _2872 = uint(int(uint(int(_2870)) >> uint(2)));
    int _2874 = int(_2870) & 3;
    float _2876 = (*spvDescriptorSet0.vp_c15)._m0[int(_2872)][_2874];
    int _2878 = int(_2870) + 1;
    uint _2880 = uint(int(uint(_2878) >> uint(2)));
    int _2882 = _2878 & 3;
    float _2884 = (*spvDescriptorSet0.vp_c15)._m0[int(_2880)][_2882];
    float _2886 = fma(_2036, _2734, _2850);
    float _2888 = _2886 + _2742;
    float _2890 = _2724;
    if (!_2638)
    {
        int _2892 = as_type<int>(_2724) + 400;
        uint _2894 = uint(int(uint(_2892) >> uint(2)));
        uint _2896 = uint(int(uint(int(_2894)) >> uint(2)));
        int _2898 = int(_2894) & 3;
        float _2900 = (*spvDescriptorSet0.vp_c15)._m0[int(_2896)][_2898];
        _2890 = _2900;
    }
    float _2902 = _2890;
    float _2904 = _2546 * _2768;
    float _2906 = _2546 * _2790;
    bool _2908 = !_2810;
    float _2910 = _2820;
    float _2912 = _2800;
    if (!_2908)
    {
        float _2914 = _287 * _287;
        float _2916 = fma(_359, _359, _2914);
        float _2918 = fma(_361, _361, _2916);
        float _2920 = rsqrt(_2770);
        float _2922 = sqrt(_2918);
        float _2924 = _2716 * _2920;
        float _2926 = _2558 * _2920;
        float _2928 = _2748 * _2920;
        bool _2930 = _2922 > 0.0;
        bool _2932 = !_2930;
        if (!_2932)
        {
            float _2934 = rsqrt(_2918);
            float _2936 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2938 = _287 * _2934;
            float _2940 = _359 * _2934;
            float _2942 = _361 * _2934;
            float _2944 = _2926 * _2938;
            float _2946 = fma(_2924, _2940, _2944);
            float _2948 = _2936 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2950 = fma(_2928, _2942, _2946);
            float _2952 = _2950 * _2948;
            float _2954 = fma(_359, _2952, _2704);
            float _2956 = fma(_287, _2952, _2548);
            float _2958 = fma(_361, _2952, _2712);
            _2706 = _2954;
            _2650 = _2956;
            _2718 = _2958;
            _2652 = _2938;
        }
    }
    float _2960 = _2706;
    float _2962 = _2650;
    float _2964 = _2718;
    float _2966 = _2652;
    float _2968 = 1.0 / _2888;
    float _2970 = fma(_2026, _2760, _2904);
    float _2972 = fma(_2026, _2782, _2906);
    float _2974 = -_2014;
    float _2976 = fma(_2974, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2960);
    float _2978 = -_2012;
    float _2980 = fma(_2978, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2962);
    float _2982 = fma(_2036, _2800, _2970);
    float _2984 = fma(_2036, _2820, _2972);
    float _2986 = -_2022;
    float _2988 = fma(_2986, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2964);
    float _2990 = _2988;
    float _2992 = _2966;
    float _2994 = _2976;
    if (_2860)
    {
        _2910 = _2976;
    }
    float _2996 = _2910;
    float _2998 = _2996;
    if (_2860)
    {
        _2912 = _2980;
    }
    float _3000 = _2912;
    float _3002 = _3000;
    if (!_2860)
    {
        float _3004 = _2032 * _2032;
        float _3006 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3008 = -_1342;
        float _3010 = _3008 + _2962;
        float _3012 = -_1490;
        float _3014 = _3012 + _2960;
        float _3016 = fma(_2040, _2040, _3004);
        float _3018 = -_1402;
        float _3020 = _3018 + _2964;
        float _3022 = fma(_2048, _2048, _3016);
        float _3024 = 1.0 / _2138;
        float _3026 = sqrt(_3022);
        float _3028 = precise::min(_3026, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3030 = _3028 * _3006;
        float _3032 = _3030 * _3024;
        float _3034 = fma(_3010, _3032, _2020);
        float _3036 = fma(_3014, _3032, _2026);
        float _3038 = fma(_3020, _3032, _2036);
        _3002 = _3034;
        _2998 = _3036;
        _2990 = _3038;
        _1360 = _3010;
    }
    float _3040 = _3002;
    float _3042 = _2998;
    float _3044 = _2990;
    float _3046 = _1360;
    float _3048 = _2982 + _2808;
    float _3050 = _3040 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3052 = _3040 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3054 = _2984 + _2828;
    float _3056 = _3048 * _2968;
    float _3058 = fma(_3042, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3050);
    float _3060 = _3040 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3062 = fma(_3042, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3052);
    float _3064 = _3040 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3066 = fma(_3044, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3058);
    float _3068 = fma(_3042, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3060);
    bool _3070 = _3056 >= 0.0;
    float _3072 = fma(_3044, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3062);
    float _3074 = _3066 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3076 = _3054 * _2968;
    float _3078 = fma(_3044, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3068);
    bool _3080 = _3056 <= 1.0;
    bool _3082 = _3080 && _3070;
    float _3084 = fma(_3042, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3064);
    float _3086 = _3072 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3088 = _3074 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3090 = _3078 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _3092 = _3076 >= 0.0;
    bool _3094 = _3092 && _3082;
    float _3096 = fma(_3044, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3084);
    float _3098 = fma(_3086, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3088);
    float _3100 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3102 = _3090 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _3104 = _3076 <= 1.0;
    bool _3106 = _3104 && _3094;
    float _3108 = _3096 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3110 = fma(_3090, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3098);
    float _3112 = -_3102;
    float _3114 = fma(_3112, _3100, 1.0);
    float _3116 = _3046;
    float _3118 = _3056;
    if (!_2638)
    {
        float _3120 = floor(_2592);
        _3116 = _3120;
    }
    float _3122 = _3116;
    float _3124 = _3074 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3126 = fma(_3108, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3110);
    float _3128 = _2546 * _2846;
    float _3130 = _3074 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3132 = _3126;
    if (!_2638)
    {
        float _3134 = -_2866;
        float _3136 = _2574 + _3134;
        _2992 = _3136;
    }
    float _3138 = _2992;
    float _3140 = fma(_2026, _2838, _3128);
    float _3142 = log2(_3114);
    if (_3106)
    {
        float _3144 = float(_2662);
        _2664 = _3144;
    }
    float _3146 = _2664;
    float _3148 = fma(_3086, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3130);
    float _3150 = fma(_3086, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3124);
    float _3152 = fma(_2036, _2876, _3140);
    float _3154 = fma(_3090, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3148);
    float _3156 = fma(_3090, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3150);
    float _3158 = 1.0 / _3126;
    if (!_2638)
    {
        float _3160 = -_3122;
        float _3162 = _2592 + _3160;
        _2654 = _3162;
    }
    float _3164 = _2654;
    float _3166 = fma(_3108, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3154);
    float _3168 = fma(_3108, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3156);
    float _3170 = _3152 + _2884;
    float _3172 = _2902;
    float _3174 = _3168;
    if (!_2638)
    {
        float _3176 = rint(_2902);
        float _3178 = precise::max(_3176, 0.0);
        uint _3180 = uint(_3178);
        uint _3182 = clamp(_3180, 0u, 65535u);
        _3172 = as_type<float>(_3182);
    }
    float _3184 = _3172;
    float _3186 = _3142 * 0.693147182464599609375;
    float _3188 = _3170 * _2968;
    float _3190 = _3186 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3192 = _3140;
    float _3194 = _3186;
    if (_3106)
    {
        float _3196 = rint(_3146);
        float _3198 = precise::max(_3196, 0.0);
        uint _3200 = uint(_3198);
        uint _3202 = clamp(_3200, 0u, 65535u);
        _3192 = as_type<float>(_3202);
    }
    float _3204 = _3192;
    float _3206 = _3166 * _3158;
    float _3208 = _3168 * _3158;
    float _3210 = fma(_3206, 0.5, 0.5);
    float _3212 = fma(_3208, -0.5, 0.5);
    float _3214 = _3184;
    float _3216 = _3210;
    if (!_2638)
    {
        float3 _9119 = float3(_3138, _3164, float(as_type<int>(_3184)));
        float3 _9123 = select(_9119, float3(0.0), isnan(_9119));
        float _3218 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _9123.xy, uint(rint(_9123.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _9123.xy, uint(rint(_9123.z)), level(0.0)).x;
        _3214 = _3218;
    }
    float _3220 = _3214;
    float _3222 = _3076;
    if (_3106)
    {
        float3 _9138 = float3(_3056, _3076, float(as_type<int>(_3204)));
        float3 _9140 = select(_9138, float3(0.0), isnan(_9138));
        float _3224 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _9140.xy, uint(rint(_9140.z)), _3188, level(0.0));
        _3222 = _3224;
    }
    float _3226 = _3222;
    float3 _9150 = float3(_3210, _3212, _3190);
    float _3228 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9150, float3(0.0), isnan(_9150)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9150, float3(0.0), isnan(_9150)), level(0.0)).x;
    float3 _9159 = float3(_3210, _3212, _3190);
    float4 _3231 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9159, float3(0.0), isnan(_9159)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9159, float3(0.0), isnan(_9159)), level(0.0)).xyzw;
    float _3233 = _3231.x;
    float _3235 = _3231.y;
    float _3237 = _3231.z;
    float _3239 = _3231.w;
    if (_2638)
    {
        _2110 = 1.0;
    }
    float _3241 = _2110;
    bool _3243 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _3245 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3247 = _3243 || _3245;
    bool _3249 = isnan(0.5);
    bool _3251 = _3247 || _3249;
    float _3253 = _3241;
    if (_3251)
    {
        _3194 = 1.0;
    }
    float _3255 = _3194;
    float _3257 = _3255;
    if (_3251)
    {
        _2994 = 1.0;
    }
    float _3259 = _2994;
    float _3261 = _3259;
    float _3263 = _3235;
    float _3265 = _3233;
    if (!_3251)
    {
        float _3267 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _3269 = _3267 * 0.15915493667125701904296875;
        float _3271 = _3269 * 6.283185482025146484375;
        float _3273 = cos(_3271);
        float _3275 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _3277 = _3275 * 0.15915493667125701904296875;
        float _3279 = _3269 * 6.283185482025146484375;
        float _3281 = sin(_3279);
        float _3283 = 1.0 / _3273;
        float _3285 = _3277 * 6.283185482025146484375;
        float _3287 = cos(_3285);
        float _3289 = _3281 * _3283;
        float _3291 = _3277 * 6.283185482025146484375;
        float _3293 = sin(_3291);
        float _3295 = _3287 * _3289;
        float _3297 = 1.0 / _3295;
        float _3299 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3301 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3299;
        float _3303 = 1.0 / _3301;
        float _3305 = _3293 * _3297;
        float _3307 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3309 = fma(_2622, _3305, _3307);
        float _3311 = _3309 * _3303;
        float _3313 = precise::clamp(_3311, 0.0, 1.0);
        _3118 = _3283;
        _3216 = _3277;
        _3261 = _3313;
    }
    float _3315 = _3118;
    float _3317 = _3216;
    float _3319 = _3261;
    float _3321 = _3315;
    float _3323 = _3317;
    if (!_3251)
    {
        float _3325 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _3327 = _3325 * 0.15915493667125701904296875;
        float _3329 = _3327 * 6.283185482025146484375;
        float _3331 = cos(_3329);
        float _3333 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _3335 = _3333 * 0.15915493667125701904296875;
        float _3337 = _3327 * 6.283185482025146484375;
        float _3339 = sin(_3337);
        float _3341 = 1.0 / _3331;
        float _3343 = _3335 * 6.283185482025146484375;
        float _3345 = cos(_3343);
        float _3347 = _3339 * _3341;
        float _3349 = _3335 * 6.283185482025146484375;
        float _3351 = sin(_3349);
        float _3353 = _3345 * _3347;
        float _3355 = 1.0 / _3353;
        float _3357 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3359 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _3357;
        float _3361 = 1.0 / _3359;
        float _3363 = _3351 * _3355;
        float _3365 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3367 = fma(_2622, _3363, _3365);
        float _3369 = _3367 * _3361;
        float _3371 = precise::clamp(_3369, 0.0, 1.0);
        float _3373 = -_3371;
        float _3375 = _3373 + 1.0;
        _3321 = _3327;
        _3323 = _3353;
        _3257 = _3375;
    }
    float _3377 = _3321;
    float _3379 = _3323;
    float _3381 = _3257;
    float _3383 = _3377;
    float _3385 = _3379;
    if (!_2638)
    {
        int _3387 = _2670 << 4;
        int _3389 = _3387 + 2048;
        uint _3391 = uint(int(uint(_3389) >> uint(2)));
        uint _3393 = uint(int(uint(int(_3391)) >> uint(2)));
        int _3395 = int(_3391) & 3;
        float _3397 = (*spvDescriptorSet0.vp_c15)._m0[int(_3393)][_3395];
        int _3399 = int(_3391) + 1;
        uint _3401 = uint(int(uint(_3399) >> uint(2)));
        int _3403 = _3399 & 3;
        float _3405 = (*spvDescriptorSet0.vp_c15)._m0[int(_3401)][_3403];
        int _3407 = _3389 + 8;
        uint _3409 = uint(int(uint(_3407) >> uint(2)));
        uint _3411 = uint(int(uint(int(_3409)) >> uint(2)));
        int _3413 = int(_3409) & 3;
        float _3415 = (*spvDescriptorSet0.vp_c15)._m0[int(_3411)][_3413];
        int _3417 = int(_3409) + 1;
        uint _3419 = uint(int(uint(_3417) >> uint(2)));
        int _3421 = _3417 & 3;
        float _3423 = (*spvDescriptorSet0.vp_c15)._m0[int(_3419)][_3421];
        float _3425 = _2546 * _3405;
        float _3427 = fma(_2026, _3397, _3425);
        float _3429 = fma(_2036, _3415, _3427);
        float _3431 = _3429 + _3423;
        float _3433 = precise::clamp(_3431, 0.0, 1.0);
        float _3435 = -_3433;
        float _3437 = _3435 + _3220;
        float _3439 = fma(_3437, 500.0, 1.5);
        float _3441 = exp2(_3439);
        float _3443 = 0.0 + _3441;
        float _3445 = precise::clamp(_3443, 0.0, 1.0);
        _3383 = _3423;
        _3253 = _3445;
    }
    float _3447 = _3383;
    float _3449 = _3253;
    float _3451 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3453 = _3040 + _3451;
    float _3455 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3457 = _3042 + _3455;
    float _3459 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3461 = _3044 + _3459;
    float _3463 = _3453 * _3453;
    float _3465 = fma(_3457, _3457, _3463);
    float _3467 = fma(_3461, _3461, _3465);
    float _3469 = rsqrt(_3467);
    float _3471 = _3469 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3473 = _3457 * _3471;
    float _3475 = _3461 * _3471;
    float _3477 = _3473 * _3473;
    float _3479 = _3475 * _3475;
    float _3481 = _3477 + _3479;
    float _3483 = sqrt(_3481);
    bool _3485 = _3483 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3487 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3489 = _3483 + _3487;
    float _3491 = _3469;
    float _3493 = _3489;
    float _3495 = _3453;
    float _3497 = _3471;
    if (_3485)
    {
        float _3499 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3491 = _3499;
    }
    float _3501 = _3491;
    float _3503 = _3501;
    if (_3485)
    {
        float _3505 = _3489 * _3501;
        _3493 = _3505;
    }
    float _3507 = _3493;
    if (_3485)
    {
        float _3509 = rsqrt(_3481);
        _3503 = _3509;
    }
    float _3511 = _3503;
    float _3513 = _3511;
    if (_3485)
    {
        float _3515 = _3507 * 0.15915493667125701904296875;
        _3385 = _3515;
    }
    float _3517 = _3385;
    float _3519 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3521 = _3461;
    float _3523 = _3517;
    if (_3485)
    {
        float _3525 = _3517 * 6.283185482025146484375;
        float _3527 = sin(_3525);
        _3521 = _3527;
    }
    float _3529 = _3521;
    float _3531 = precise::max(0.0, _3519);
    float _3533 = _3447;
    float _3535 = _3531;
    if (_3485)
    {
        float _3537 = _3517 * 6.283185482025146484375;
        float _3539 = cos(_3537);
        _3533 = _3539;
    }
    float _3541 = _3533;
    float _3543 = -_3471;
    float _3545 = -_3531;
    float _3547 = fma(_3453, _3543, _3545);
    if (_3485)
    {
        float _3549 = _3547 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3495 = _3549;
    }
    float _3551 = _3495;
    float _3553 = _3529;
    float _3555 = _3551;
    if (_3485)
    {
        float _3557 = fma(_3529, _3551, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3553 = _3557;
    }
    float _3559 = _3553;
    float _3561 = _3559;
    if (!_3485)
    {
        _3555 = _3475;
    }
    float _3563 = _3555;
    float _3565 = _3563;
    if (!_3485)
    {
        _3523 = _3477;
    }
    float _3567 = _3523;
    float _3569 = _3567;
    if (_3485)
    {
        float _3571 = _3511 * _3559;
        _2656 = _3571;
    }
    float _3573 = _2656;
    if (!_3485)
    {
        _3513 = _3473;
    }
    float _3575 = _3513;
    float _3577 = _3575;
    float _3579 = _3541;
    if (_3485)
    {
        float _3581 = _3541 + (-1.0);
        _3535 = _3581;
    }
    float _3583 = _3535;
    if (_3485)
    {
        float _3585 = _3473 * _3573;
        _3577 = _3585;
    }
    float _3587 = _3577;
    if (!_3485)
    {
        _3561 = _3547;
    }
    float _3589 = _3561;
    float _3591 = _3589;
    if (_3485)
    {
        float _3593 = _3475 * _3573;
        _3565 = _3593;
    }
    float _3595 = _3565;
    if (_3485)
    {
        float _3597 = _3583 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3497 = _3597;
    }
    float _3599 = _3497;
    if (_3485)
    {
        float _3601 = _3587 * _3587;
        _3569 = _3601;
    }
    float _3603 = _3569;
    float _3605 = sqrt(_3467);
    if (_3485)
    {
        float _3607 = fma(_3547, _3541, _3599);
        _3591 = _3607;
    }
    float _3609 = _3591;
    if (!_3485)
    {
        _3579 = _3479;
    }
    float _3611 = _3579;
    float _3613 = _3611;
    if (_3485)
    {
        float _3615 = _3595 * _3595;
        _3613 = _3615;
    }
    float _3617 = _3613;
    float _3619 = fma(_3609, _3609, _3603);
    float _3621 = _3619 + _3617;
    float _3623 = rsqrt(_3621);
    float _3625 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3627 = fma(_3605, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3625);
    float _3629 = precise::clamp(_3627, 0.0, 1.0);
    float _3631 = -_3629;
    float _3633 = _3631 + 1.0;
    float _3635 = abs(_3633);
    float _3637 = log2(_3635);
    float _3639 = _3623 * _3587;
    float _3641 = _3623 * _3609;
    float _3643 = _3623 * _3595;
    float _3645 = _3639 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3647 = -_3645;
    float _3649 = fma(_3641, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3647);
    float _3651 = -_3643;
    float _3653 = fma(_3651, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3649);
    float _3655 = _3637 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3657 = fma(_3653, -0.5, 0.5);
    float _3659 = fma(_3653, 0.5, 0.5);
    float _3661 = exp2(_3655);
    float _3663 = fma(_3659, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3665 = fma(_3659, _3663, -0.212114393711090087890625);
    float _3667 = _3641 + 1.0;
    float _3669 = sqrt(_3657);
    float _3671 = fma(_3659, _3665, 1.570728778839111328125);
    float _3673 = -_3641;
    float _3675 = fma(_3661, _3667, _3673);
    float _3677 = fma(_3675, 0.5, 0.5);
    float _3679 = _3669 * 0.636619746685028076171875;
    float _3681 = -_3671;
    float _3683 = fma(_3679, _3681, 1.0);
    float2 _9814 = float2(_3683, _3677);
    float3 _3687 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9814, float2(0.0), isnan(_9814)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9814, float2(0.0), isnan(_9814)), level(0.0)).xyz;
    float _3689 = _3687.x;
    float _3691 = _3687.y;
    float _3693 = _3687.z;
    float _3695 = abs(_2622);
    float _3697 = log2(_3695);
    float _3699 = _3074 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3701 = _3637 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3703 = _3126 * 0.5;
    float _3705 = -_2534;
    float _3707 = _3705 + 1.0;
    float _3709 = fma(_3086, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3699);
    float _3711 = fma(_3168, -0.5, _3703);
    float _3713 = exp2(_3701);
    float _3715 = fma(_3090, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3709);
    bool _3717 = _2622 <= 8000.0;
    bool _3719 = isnan(_2622);
    bool _3721 = _3717 || _3719;
    bool _3723 = isnan(8000.0);
    bool _3725 = _3721 || _3723;
    float _3727 = float(_3725);
    float _3729 = fma(_3108, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3715);
    float _3731 = _3697 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3733 = _3729 + _3126;
    out.gl_Position.x = _3166;
    out.gl_Position.y = _3168;
    out.gl_Position.z = _3729;
    out.gl_Position.w = _3126;
    float _3735 = _3166 + _3126;
    bool _3737 = _3605 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3739 = isnan(_3605);
    bool _3741 = _3737 || _3739;
    bool _3743 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3745 = _3741 || _3743;
    float _3747 = _3733 * 0.5;
    float _3749 = exp2(_3731);
    float _3751 = _3735 * 0.5;
    out.m_92.x = _3751;
    out.m_92.y = _3711;
    out.m_92.z = _3747;
    out.m_92.w = _3126;
    float _3753 = -_3713;
    float _3755 = _3753 + 1.0;
    if (!_3106)
    {
        _3174 = 1.0;
    }
    float _3757 = _3174;
    float _3759 = _3757;
    if (_3106)
    {
        bool _3761 = _3226 >= _3188;
        bool _3763 = isnan(_3226);
        bool _3765 = _3761 || _3763;
        bool _3767 = isnan(_3188);
        bool _3769 = _3765 || _3767;
        float _3771 = float(_3769);
        _3759 = _3771;
    }
    float _3773 = _3759;
    float _3775 = _3755 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (!_3745)
    {
        _3132 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3777 = _3132;
    float _3779 = fma(_3749, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3781 = precise::clamp(_3779, 0.0, 1.0);
    float _3783 = _3775 * _3228;
    float _3785 = _3773 * _3449;
    float _3787 = fma(_3781, -2.0, 3.0);
    float _3789 = _3781 * _3781;
    float _3791 = _3239 * _3783;
    float _3793 = -_3775;
    float _3795 = _3793 + 1.0;
    float _3797 = _3789 * _3787;
    float _3799 = _3239 * _3795;
    float _3801 = _3795;
    float _3803 = _3785;
    float _3805 = _3777;
    float _3807 = _3777;
    if (!_3745)
    {
        _3801 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3809 = _3801;
    float _3811 = -_3797;
    float _3813 = _3811 + 1.0;
    float _3815 = fma(_3813, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3797);
    float _3817 = _3727 * _3815;
    float _3819 = _3817 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3821 = _3707 * _3819;
    float _3823 = precise::clamp(_3821, 0.0, 1.0);
    float _3825 = -_3823;
    float _3827 = fma(_3825, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3829 = -_3785;
    float _3831 = fma(_3829, _3827, 1.0);
    float _3833 = precise::clamp(_3831, 0.0, 1.0);
    float _3835 = _3809;
    float _3837 = _3809;
    if (!_3745)
    {
        _3803 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3839 = _3803;
    float _3841 = _3833 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3843 = _3319 * _3381;
    out.m_94.x = _3841;
    float _3845 = _3843 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3847 = _3843;
    float _3849 = _3839;
    float _3851 = _3839;
    if (!_3745)
    {
        _3847 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3853 = _3847;
    float _3855 = _3693 * _3783;
    float _3857 = fma(_3689, _3791, _3233);
    float _3859 = fma(_3691, _3791, _3235);
    float _3861 = _3853;
    float _3863 = _3853;
    if (!_3745)
    {
        _3263 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3865 = _3263;
    float _3867 = fma(_3239, _3855, _3237);
    float _3869 = _3865;
    float _3871 = _3865;
    if (!_3745)
    {
        _3265 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3873 = _3265;
    out.m_96.x = _3857;
    out.m_96.y = _3859;
    out.m_96.z = _3867;
    out.m_96.w = _3799;
    bool _3875 = !_3745;
    float _3877 = _3873;
    float _3879 = _3873;
    if (!_3875)
    {
        bool _3881 = _3605 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3883 = isnan(_3605);
        bool _3885 = _3881 || _3883;
        bool _3887 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3889 = _3885 || _3887;
        if (!_3889)
        {
            float _3891 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3893 = _3605 + _3891;
            float _3895 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3897 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3895;
            float _3899 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3901 = _3899 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3903 = 1.0 / _3897;
            float _3905 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3907 = _3905 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3909 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3911 = _3909 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3913 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3915 = _3913 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3917 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3919 = _3917 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3921 = _3893 * _3903;
            float _3923 = precise::clamp(_3921, 0.0, 1.0);
            float _3925 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3927 = _3925 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3929 = fma(_3923, _3901, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3931 = fma(_3923, _3927, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3933 = fma(_3923, _3907, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3935 = fma(_3923, _3911, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3937 = fma(_3923, _3915, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3939 = fma(_3923, _3919, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3879 = _3933;
            _3851 = _3937;
            _3871 = _3929;
            _3837 = _3935;
            _3807 = _3931;
            _3863 = _3939;
            _3941 = true;
        }
        else
        {
            bool _3943 = _3605 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3945 = isnan(_3605);
            bool _3947 = _3943 || _3945;
            bool _3949 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3951 = _3947 || _3949;
            if (!_3951)
            {
                _3869 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3953 = _3869;
            _3871 = _3953;
            if (!_3951)
            {
                _3877 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3955 = _3877;
            _3879 = _3955;
            if (!_3951)
            {
                _3805 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3957 = _3805;
            _3807 = _3957;
            if (!_3951)
            {
                _3835 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3959 = _3835;
            _3837 = _3959;
            if (!_3951)
            {
                _3849 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3961 = _3849;
            _3851 = _3961;
            if (!_3951)
            {
                _3861 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3963 = _3861;
            bool _3965 = !_3951;
            _3863 = _3963;
            if (!_3965)
            {
                bool _3967 = _3605 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3969 = isnan(_3605);
                bool _3971 = _3967 || _3969;
                bool _3973 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3975 = _3971 || _3973;
                if (!_3975)
                {
                    float _3977 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3979 = _3605 + _3977;
                    float _3981 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3983 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3981;
                    float _3985 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3987 = _3985 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3989 = 1.0 / _3983;
                    float _3991 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3993 = _3991 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3995 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3997 = _3995 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3999 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4001 = _3999 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4003 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4005 = _4003 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4007 = _3979 * _3989;
                    float _4009 = precise::clamp(_4007, 0.0, 1.0);
                    float _4011 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4013 = _4011 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4015 = fma(_4009, _3987, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4017 = fma(_4009, _4013, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4019 = fma(_4009, _3993, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4021 = fma(_4009, _3997, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4023 = fma(_4009, _4001, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4025 = fma(_4009, _4005, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3879 = _4019;
                    _3851 = _4023;
                    _3871 = _4015;
                    _3837 = _4021;
                    _3807 = _4017;
                    _3863 = _4025;
                    _3941 = true;
                }
                else
                {
                    _3879 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3851 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3871 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3837 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3807 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3863 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3941 = false;
    float _4027 = _3879;
    float _4029 = _3851;
    float _4031 = _3871;
    float _4033 = _3837;
    float _4035 = _3807;
    float _4037 = _3863;
    float _4039 = _3845 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4041 = fma(_2434, -0.5, 0.5);
    float _4043 = precise::clamp(_4041, 0.0, 1.0);
    float _4045 = -_4027;
    float _4047 = _4045 + _4029;
    float _4049 = -_4031;
    float _4051 = _4049 + _4033;
    out.m_98.x = 0.0;
    float _4053 = fma(_4043, _4047, _4027);
    float _4055 = -_4035;
    float _4057 = _4055 + _4037;
    float _4059 = fma(_4043, _4051, _4031);
    float _4061 = _4053 * 0.586610972881317138671875;
    bool _4063 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4065 = fma(_4043, _4057, _4035);
    out.m_61.x = _4039;
    float _4067 = fma(_4059, 0.298911988735198974609375, _4061);
    bool _4069 = _3319 > 0.0;
    bool _4071 = isnan(_3319);
    bool _4073 = _4069 || _4071;
    bool _4075 = isnan(0.0);
    bool _4077 = _4073 || _4075;
    float _4079 = fma(_4065, 0.114477999508380889892578125, _4067);
    bool _4081 = _3381 <= 0.0;
    bool _4083 = !_4077;
    bool _4085 = _4081 || _4083;
    float _4087 = -_4079;
    float _4089 = _4059 + _4087;
    float _4091 = -_4079;
    float _4093 = _4053 + _4091;
    float _4095 = -_4079;
    float _4097 = _4065 + _4095;
    float _4099 = fma(_4089, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4079);
    float _4101 = fma(_4093, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4079);
    float _4103 = fma(_4097, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4079);
    bool _4105 = !_4063;
    if (!_4105)
    {
        float _4107 = -_3040;
        float _4109 = _4107 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4111 = -_3042;
        float _4113 = _4111 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4115 = -_3044;
        float _4117 = _4115 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4119 = _4109 * _4109;
        float _4121 = fma(_4113, _4113, _4119);
        float _4123 = fma(_4117, _4117, _4121);
        float _4125 = sqrt(_4123);
        float _4127 = rsqrt(_4123);
        float _4129 = -_4125;
        float _4131 = _4129 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4133 = _4131 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4135 = precise::clamp(_4133, 0.0, 1.0);
        float _4137 = _4113 * _4127;
        float _4139 = _4109 * _4127;
        float _4141 = abs(_4135);
        float _4143 = log2(_4141);
        float _4145 = _4117 * _4127;
        float _4147 = _4137 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4149 = _2434 * _4139;
        float _4151 = -_4139;
        float _4153 = -_4147;
        float _4155 = fma(_4151, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4153);
        float _4157 = fma(_2432, _4137, _4149);
        float _4159 = -_4145;
        float _4161 = fma(_4159, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4155);
        float _4163 = fma(_2436, _4145, _4157);
        float _4165 = precise::clamp(_4163, 0.0, 1.0);
        float _4167 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4169 = _4161 + _4167;
        float _4171 = _4143 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4173 = _4169 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4175 = precise::clamp(_4173, 0.0, 1.0);
        float _4177 = exp2(_4171);
        float _4179 = _4177 * _4175;
        float _4181 = _4165 * _4179;
        float _4183 = _4181 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4185 = _4181 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4187 = _4181 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_98.x = _4183;
        out.m_98.y = _4185;
        out.m_98.z = _4187;
    }
    out.m_100.x = _4099;
    out.m_100.y = _4101;
    out.m_100.z = _4103;
    if (!_4085)
    {
        return out;
    }
    out.m_61.x = 0.0;
    float _4189 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4189;
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
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3941 = false;
    bool _2486 = false;
    bool _961 = false;
    bool _769 = false;
    bool _393 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _114 = in.m_58.w;
    float _116 = trunc(_114);
    int _119 = int(_116);
    bool _123 = _119 >= 1;
    float _125 = 0.0;
    if (!_123)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _127 = _125;
    float _129 = _127;
    if (!_123)
    {
        out.m_61.x = 0.0;
    }
    int _131 = 0;
    if (!_123)
    {
        float _133 = _127 * 5.0;
        _131 = as_type<int>(_133);
    }
    int _135 = _131;
    int _137 = _135;
    if (!_123)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4246 = as_type<float>(_135);
        out.gl_Position.z = _4246;
    }
    if (!_123)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _139 = in.m_63.w;
    bool _141 = _139 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _143 = isnan(_139);
    bool _145 = _141 || _143;
    bool _147 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _149 = _145 || _147;
    float _151 = -_139;
    float _153 = _151 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _155 = _153;
    if (_149)
    {
        float _157 = float(_119);
        _129 = _157;
    }
    float _159 = _129;
    bool _161 = _153 >= _159;
    bool _163 = !_149;
    bool _165 = _161 || _163;
    float _167 = _159;
    if (_165)
    {
        _167 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _169 = _167;
    if (_165)
    {
        out.m_61.x = 0.0;
    }
    if (_165)
    {
        float _171 = _169 * 5.0;
        _137 = as_type<int>(_171);
    }
    int _173 = _137;
    if (_165)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4316 = as_type<float>(_173);
        out.gl_Position.z = _4316;
    }
    if (_165)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _175 = in.m_65.x;
    float _177 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _179 = _153 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _181 = _153 + (*spvDescriptorSet0.vp_c9)._m0[20].w;
    float _183 = as_type<float>(int(gl_VertexIndex));
    float _185 = in.m_70.x;
    float _187 = in.m_70.y;
    float _189 = in.m_70.z;
    float _191 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].w;
    float _193 = in.m_72.x;
    float _195 = in.m_72.y;
    float _197 = in.m_72.z;
    float _199 = in.m_74.x;
    float _201 = in.m_74.y;
    float _203 = in.m_74.z;
    float _205 = _179 * _177;
    float _207 = in.m_76.x;
    float _209 = in.m_76.y;
    float _211 = in.m_76.z;
    float _213 = fma(_175, (*spvDescriptorSet0.vp_c9)._m0[20].x, _205);
    float _215 = _181 * _191;
    float _217 = floor(_213);
    float _219 = fma(_175, (*spvDescriptorSet0.vp_c9)._m0[20].y, _215);
    float _221 = _213 * 6.283185482025146484375;
    int _223 = as_type<int>(_183) & 1;
    bool _225 = _223 != 0;
    int _227 = as_type<int>(_183) & 2;
    bool _229 = _227 != 0;
    int _231 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _233 = _231 != 0;
    float _235 = _221 * 0.15915493667125701904296875;
    float _237 = floor(_219);
    float _239 = _187 * _195;
    float _241 = _187 * _201;
    float _243 = fma(_185, _193, _239);
    float _245 = -_217;
    float _247 = _213 + _245;
    float _249 = _219 * 6.283185482025146484375;
    float _251 = _187 * _209;
    float _253 = _235 * 6.283185482025146484375;
    float _255 = cos(_253);
    float _257 = fma(_185, _199, _241);
    float _259 = _249 * 0.15915493667125701904296875;
    float _261 = fma(_185, _207, _251);
    float _263 = -_237;
    float _265 = _219 + _263;
    float _267 = -_247;
    float _269 = fma(_267, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _271 = !_229;
    float _273 = _271 ? (-0.5) : 0.5;
    float _275 = _259 * 6.283185482025146484375;
    float _277 = cos(_275);
    int _279 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _281 = _279 != 0;
    int _283 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _285 = _283 != 0;
    float _287 = fma(_189, _203, _257);
    bool _289 = _247 < 0.5;
    float _291 = float(_289);
    bool _293 = !_233;
    int _295 = _293 ? 0 : 1;
    bool _297 = !_281;
    int _299 = _297 ? 0 : 1;
    float _301 = fma(_255, 0.5, 0.5);
    float _303 = -_291;
    float _305 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _307 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _309 = abs(_299);
    float _311 = -_301;
    float _313 = fma(_311, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _315 = abs(_295);
    float _317 = -_265;
    float _319 = fma(_317, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    bool _321 = !_285;
    int _323 = _321 ? 0 : 1;
    float _325 = fma(_277, 0.5, 0.5);
    float _327 = float(_309);
    bool _329 = _265 < 0.5;
    float _331 = float(_329);
    float _333 = float(_315);
    float _335 = abs(_319);
    float _337 = _327 * _335;
    int _339 = abs(_323);
    float _341 = abs(_269);
    float _343 = _327 * _341;
    float _345 = -_325;
    float _347 = fma(_345, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _349 = -_331;
    float _351 = fma(_349, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _353 = float(_339);
    float _355 = fma(_333, _313, _343);
    float _357 = fma(_333, _347, _337);
    float _359 = fma(_189, _197, _243);
    float _361 = fma(_189, _211, _261);
    float _363 = abs(_305);
    float _365 = fma(_353, _363, _355);
    float _367 = abs(_351);
    float _369 = fma(_353, _367, _357);
    bool _371 = !_225;
    float _373 = _371 ? (-0.5) : 0.5;
    bool _375 = !_307;
    float _391;
    if (!_375)
    {
        float _377 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _379 = _175 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _381 = fma(_379, (*spvDescriptorSet0.vp_c9)._m0[12].x, _153);
        float _383 = _381 * _377;
        float _385 = floor(_383);
        float _387 = -_385;
        float _389 = _383 + _387;
        _391 = _389;
        _393 = true;
    }
    else
    {
        float _395 = float(_119);
        float _397 = 1.0 / _395;
        float _399 = _153 * _397;
        _391 = _399;
    }
    _393 = false;
    float _401 = _391;
    float _403 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _405 = _401 + _403;
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _409 = _401 + _407;
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _413 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _411;
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _417 = _415 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _421 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _419;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _425 = _423 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _427 = 1.0 / _413;
    float _429 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _431 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _429;
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _435 = _433 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _437 = 1.0 / _417;
    float _439 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _441 = _401 + _439;
    bool _443 = _401 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _445 = isnan(_401);
    bool _447 = _443 || _445;
    bool _449 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _451 = _447 || _449;
    float _453 = float(_451);
    bool _455 = _401 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _457 = isnan(_401);
    bool _459 = _455 || _457;
    bool _461 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _463 = _459 || _461;
    float _465 = float(_463);
    bool _467 = _401 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _469 = isnan(_401);
    bool _471 = _467 || _469;
    bool _473 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _475 = _471 || _473;
    float _477 = float(_475);
    float _479 = -_453;
    float _481 = _479 + 1.0;
    float _483 = 1.0 / _421;
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _487 = (*spvDescriptorSet0.vp_c9)._m0[150].w + _485;
    float _489 = _441 * _427;
    bool _491 = _401 >= (*spvDescriptorSet0.vp_c9)._m0[150].w;
    bool _493 = isnan(_401);
    bool _495 = _491 || _493;
    bool _497 = isnan((*spvDescriptorSet0.vp_c9)._m0[150].w);
    bool _499 = _495 || _497;
    float _501 = float(_499);
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _505 = _401 + _503;
    float _507 = 1.0 / _425;
    float _509 = _405 * _437;
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _513 = _401 + _511;
    float _515 = -_501;
    float _517 = _515 + 1.0;
    bool _519 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _521 = 1.0 / _431;
    float _523 = _409 * _483;
    bool _525 = _401 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _527 = isnan(_401);
    bool _529 = _525 || _527;
    bool _531 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _533 = _529 || _531;
    float _535 = float(_533);
    float _537 = 1.0 / _487;
    float _539 = _505 * _507;
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _543 = _401 + _541;
    float _545 = 1.0 / _435;
    float _547 = _513 * _521;
    bool _549 = _401 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _551 = isnan(_401);
    bool _553 = _549 || _551;
    bool _555 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _557 = _553 || _555;
    float _559 = float(_557);
    float _561 = _535 * _517;
    float _563 = -_535;
    float _565 = _563 + 1.0;
    float _567 = _543 * _537;
    bool _569 = _401 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _571 = isnan(_401);
    bool _573 = _569 || _571;
    bool _575 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _577 = _573 || _575;
    float _579 = float(_577);
    float _581 = _559 * _565;
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _585 = _401 + _583;
    float _587 = -_559;
    float _589 = _587 + 1.0;
    float _591 = -_579;
    float _593 = _591 + 1.0;
    float _595 = _585 * _545;
    float _597 = _579 * _589;
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _601 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _599;
    float _603 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _605 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _603;
    float _607 = _453 * _593;
    float _609 = -_465;
    float _611 = _609 + 1.0;
    float _613 = fma(_601, _489, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _615 = fma(_605, _489, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _617 = _401 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _619 = isnan(_401);
    bool _621 = _617 || _619;
    bool _623 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _625 = _621 || _623;
    float _627 = float(_625);
    float _629 = _465 * _481;
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _633 = _631 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _635 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _637 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _635;
    float _639 = -_627;
    float _641 = _639 + 1.0;
    float _643 = _627 * _611;
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _647 = _645 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _649 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _651 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _649;
    float _653 = _477 * _641;
    float _655 = -_477;
    float _657 = _655 + 1.0;
    float _659 = fma(_633, _509, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _661 = fma(_647, _509, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _663 = _613 * _653;
    float _665 = _615 * _653;
    float _667 = fma(_651, _523, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _669 = fma(_637, _523, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _671 = fma(_657, (*spvDescriptorSet0.vp_c9)._m0[143].x, _663);
    float _673 = fma(_657, (*spvDescriptorSet0.vp_c9)._m0[143].y, _665);
    float _675 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _677 = _675 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _679 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _681 = _679 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _683 = fma(_659, _643, _671);
    float _685 = fma(_661, _643, _673);
    float _687 = fma(_677, _539, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _689 = fma(_681, _539, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _693 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _691;
    float _695 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _697 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _695;
    float _699 = fma(_667, _629, _683);
    float _701 = fma(_669, _629, _685);
    float _703 = fma(_693, _547, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _705 = fma(_697, _547, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _707 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _709 = _707 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _711 = fma(_687, _607, _699);
    float _713 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _715 = _713 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _717 = fma(_689, _607, _701);
    float _719 = fma(_709, _595, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _721 = -(*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _723 = (*spvDescriptorSet0.vp_c9)._m0[150].x + _721;
    float _725 = fma(_703, _597, _711);
    float _727 = fma(_715, _595, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _729 = -(*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _731 = (*spvDescriptorSet0.vp_c9)._m0[150].y + _729;
    float _733 = fma(_705, _597, _717);
    float _735 = fma(_723, _567, (*spvDescriptorSet0.vp_c9)._m0[149].x);
    float _737 = fma(_719, _581, _725);
    float _739 = fma(_731, _567, (*spvDescriptorSet0.vp_c9)._m0[149].y);
    float _741 = fma(_727, _581, _733);
    float _743 = fma(_735, _561, _737);
    float _745 = fma(_739, _561, _741);
    float _747 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[150].x, _743);
    float _749 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[150].y, _745);
    bool _751 = !_519;
    float _767;
    if (!_751)
    {
        float _753 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _755 = _175 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _757 = fma(_755, (*spvDescriptorSet0.vp_c9)._m0[11].x, _153);
        float _759 = _757 * _753;
        float _761 = floor(_759);
        float _763 = -_761;
        float _765 = _759 + _763;
        _767 = _765;
        _769 = true;
    }
    else
    {
        float _771 = float(_119);
        float _773 = 1.0 / _771;
        float _775 = _153 * _773;
        _767 = _775;
    }
    _769 = false;
    float _777 = _767;
    float _779 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _781 = _777 + _779;
    bool _783 = _777 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _785 = isnan(_777);
    bool _787 = _783 || _785;
    bool _789 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _791 = _787 || _789;
    float _793 = float(_791);
    float _795 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _797 = _777 + _795;
    float _799 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _801 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _799;
    float _803 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _805 = _803 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _807 = 1.0 / _801;
    bool _809 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _811 = 1.0 / _805;
    float _813 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _815 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _813;
    float _817 = _781 * _807;
    bool _819 = _777 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _821 = isnan(_777);
    bool _823 = _819 || _821;
    bool _825 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _827 = _823 || _825;
    float _829 = float(_827);
    float _831 = -_793;
    float _833 = _831 + 1.0;
    bool _835 = _777 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _837 = isnan(_777);
    bool _839 = _835 || _837;
    bool _841 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _843 = _839 || _841;
    float _845 = float(_843);
    float _847 = fma(_815, _817, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _849 = _845 * _833;
    float _851 = -_845;
    float _853 = _851 + 1.0;
    float _855 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _857 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _855;
    float _859 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _861 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _859;
    float _863 = _797 * _811;
    float _865 = _829 * _853;
    float _867 = fma(_857, _817, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _869 = fma(_861, _817, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _871 = -_829;
    float _873 = _871 + 1.0;
    float _875 = _847 * _865;
    float _877 = _867 * _865;
    float _879 = _869 * _865;
    float _881 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _883 = _881 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _885 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _887 = _885 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _889 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _891 = _889 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _893 = fma(_873, (*spvDescriptorSet0.vp_c9)._m0[107].x, _877);
    float _895 = fma(_873, (*spvDescriptorSet0.vp_c9)._m0[107].y, _875);
    float _897 = fma(_883, _863, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _899 = fma(_887, _863, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _901 = fma(_891, _863, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _903 = fma(_873, (*spvDescriptorSet0.vp_c9)._m0[107].z, _879);
    float _905 = fma(_897, _849, _893);
    float _907 = fma(_899, _849, _895);
    float _909 = in.m_78.x;
    float _911 = in.m_78.y;
    float _913 = fma(_901, _849, _903);
    float _915 = fma(_793, (*spvDescriptorSet0.vp_c9)._m0[109].x, _905);
    float _917 = fma(_793, (*spvDescriptorSet0.vp_c9)._m0[109].y, _907);
    float _919 = fma(_793, (*spvDescriptorSet0.vp_c9)._m0[109].z, _913);
    float _921 = _915 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _923 = _917 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _925 = _919 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _927 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _929 = _921 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _931 = _923 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _933 = _925 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_80.x = _929;
    out.m_80.y = _931;
    out.m_80.z = _933;
    out.m_80.w = _927;
    float _935 = _749 * _911;
    float _937 = _747 * _909;
    bool _939 = !_809;
    float _957;
    float _959;
    if (!_939)
    {
        float _941 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _943 = _175 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _945 = float(_119);
        float _947 = fma(_943, (*spvDescriptorSet0.vp_c9)._m0[11].z, _153);
        float _949 = _947 * _941;
        float _951 = floor(_949);
        float _953 = -_951;
        float _955 = _949 + _953;
        _957 = _945;
        _959 = _955;
        _961 = true;
    }
    else
    {
        float _963 = float(_119);
        float _965 = 1.0 / _963;
        float _967 = _153 * _965;
        _957 = _963;
        _959 = _967;
    }
    _961 = false;
    float _969 = _957;
    float _971 = _959;
    float _973 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _975 = int(_973);
    float _977 = in.m_72.w;
    float _979 = in.m_76.w;
    float _981 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _983 = int(_981);
    float _985 = in.m_74.w;
    float _987 = float(_975);
    float _989 = 1.0 / _987;
    float _991 = float(uint(_983));
    int _993 = ~_983;
    int _995 = _993 + 1;
    int _997 = ~_983;
    int _999 = _997 + 1;
    float _1001 = 1.0 / _991;
    float _1003 = _989 * _153;
    float _1005 = trunc(_1003);
    int _1007 = int(_1005);
    int _1009 = as_type<int>(_1001) + (-2);
    float _1011 = float(uint(_1007));
    float _1013 = as_type<float>(_1009) * _1011;
    float _1015 = trunc(_1013);
    float _1017 = precise::max(_1015, 0.0);
    uint _1020 = uint(_1017);
    int _1022 = _995 * int(_1020);
    int _1024 = _1022 + _1007;
    float _1026 = float(uint(_1024));
    float _1028 = as_type<float>(_1009) * _1026;
    int _1030 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1032 = _1030 != 0;
    float _1034 = 1.0 / _969;
    bool _1036 = !_1032;
    float _1038 = _1036 ? 7.345489978790283203125 : 1.0;
    float _1040 = trunc(_1028);
    float _1042 = precise::max(_1040, 0.0);
    uint _1044 = uint(_1042);
    float _1046 = _1038 * _175;
    float _1048 = floor(_1046);
    int _1050 = int(_1020) + int(_1044);
    float _1052 = float(_983);
    float _1054 = float(_1007);
    int _1056 = _999 * _1050;
    int _1058 = _1056 + _1007;
    bool _1060 = _1054 >= _1052;
    bool _1062 = isnan(_1054);
    bool _1064 = _1060 || _1062;
    bool _1066 = isnan(_1052);
    bool _1068 = _1064 || _1066;
    float _1070 = float(_1068);
    float _1072 = -_1048;
    float _1074 = _1046 + _1072;
    bool _1076 = uint(_1058) >= uint(_983);
    float _1078 = _1074 * _1052;
    float _1080 = trunc(_1070);
    int _1082 = int(_1080);
    bool _1084 = !_1076;
    int _1086 = _1084 ? 0 : (-1);
    float _1088 = _1052 * _153;
    int _1090 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1092 = _1090 != 0;
    int _1094 = ~_1050;
    int _1096 = _1094 + _1086;
    int _1098 = _1096 + 1;
    float _1100 = _1088 * _1034;
    bool _1102 = !_1092;
    int _1104 = _1102 ? 0 : 1;
    float _1106 = trunc(_1078);
    int _1108 = int(_1106);
    bool _1110 = _983 == 0;
    int _1112 = abs(_1104);
    int _1114 = _983 * _1098;
    int _1116 = _1114 + _1007;
    int _1118 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1120 = _1118 != 0;
    int _1122 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1124 = _1122 != 0;
    int _1126 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1128 = _1126 != 0;
    int _1130 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1132 = _1130 != 0;
    float _1134 = trunc(_1100);
    int _1136 = int(_1134);
    int _1138 = ~_1082;
    int _1140 = _1138 + 1;
    int _1142 = _1140 + 1;
    bool _1144 = !_1110;
    int _1146 = _1144 ? _1116 : (-1);
    int _1148 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1150 = _1148 != 0;
    int _1152 = _1146 * _1142;
    bool _1154 = !_1124;
    int _1156 = _1154 ? 0 : 1;
    int _1158 = _1108 * _1112;
    int _1160 = _1158 + _1007;
    bool _1162 = !_1120;
    int _1164 = _1162 ? 0 : 1;
    int _1166 = _983 + (-1);
    int _1168 = abs(_1156);
    int _1170 = abs(_1164);
    int _1172 = _1082 * _1166;
    int _1174 = _1172 + _1152;
    bool _1176 = !_1128;
    int _1178 = _1176 ? 0 : 1;
    bool _1180 = !_1132;
    int _1182 = _1180 ? 0 : 1;
    int _1184 = abs(_1178);
    int _1186 = _1174 * _1168;
    float _1188 = in.m_58.x;
    float _1190 = in.m_58.y;
    float _1192 = in.m_58.z;
    int _1194 = abs(_1182);
    int _1196 = _1136 * _1170;
    int _1198 = _1196 + _1186;
    int _1200 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1202 = _1200 != 0;
    int _1204 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1206 = _1204 != 0;
    int _1208 = _1160 * _1184;
    int _1210 = _1208 + _1198;
    float _1212 = in.m_65.y;
    bool _1214 = _175 > 0.5;
    int _1216 = _1108 * _1194;
    int _1218 = _1216 + _1210;
    float _1220 = _175 * 2.0;
    float _1222 = float(uint(_1218));
    float _1224 = floor(_1220);
    float _1226 = as_type<float>(_1009) * _1222;
    float _1228 = _195 * _1190;
    float _1230 = _201 * _1190;
    float _1232 = trunc(_1226);
    float _1234 = precise::max(_1232, 0.0);
    uint _1236 = uint(_1234);
    float _1238 = _209 * _1190;
    float _1240 = fma(_193, _1188, _1228);
    float _1242 = fma(_199, _1188, _1230);
    float _1244 = fma(_207, _1188, _1238);
    float _1246 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1248 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1246;
    int _1250 = ~_983;
    int _1252 = _1250 + 1;
    float _1254 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1256 = _1254 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1258 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1260 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1262 = in.m_65.z;
    float _1264 = 1.0 / _1248;
    float _1266 = _175 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1268 = _1224 > 0.0;
    int _1270 = _1252 * int(_1236);
    int _1272 = _1270 + _1218;
    bool _1274 = _1224 >= 0.0;
    bool _1276 = isnan(_1224);
    bool _1278 = _1274 || _1276;
    bool _1280 = isnan(0.0);
    bool _1282 = _1278 || _1280;
    float _1284 = -_1258;
    float _1286 = fma(_1266, 2.0, _1284);
    float _1288 = _1212 * 2.0;
    float _1290 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1292 = _971 + _1290;
    float _1294 = 1.0 / _1256;
    float _1296 = float(uint(_1272));
    float _1298 = _1212 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1300 = -_153;
    float _1302 = fma(_1300, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1286);
    float _1304 = as_type<float>(_1009) * _1296;
    int _1306 = _1282 ? 0 : 1;
    float _1308 = floor(_1288);
    float _1310 = -_373;
    int _1312 = _1214 ? as_type<int>(_1310) : as_type<int>(_373);
    float _1314 = _1292 * _1264;
    bool _1316 = _1212 > 0.5;
    float _1318 = fma(_1298, -2.0, _1260);
    bool _1320 = !_1206;
    float _1322 = _1320 ? _373 : as_type<float>(_1312);
    float _1324 = fma(_203, _1192, _1242);
    float _1326 = -_273;
    int _1328 = _1316 ? as_type<int>(_1326) : as_type<int>(_273);
    float _1330 = trunc(_1304);
    float _1332 = precise::max(_1330, 0.0);
    uint _1334 = uint(_1332);
    int _1336 = ~_1306;
    int _1338 = _1336 + 1;
    int _1340 = _1338 + 1;
    float _1342 = _1324 + _985;
    int _1344 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1346 = _1344 != 0;
    int _1348 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1350 = _1348 != 0;
    int _1352 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1354 = _1352 != 0;
    float _1356 = fma(_197, _1192, _1240);
    int _1358 = _1340;
    float _1360 = _1342;
    if (!_1268)
    {
        int _1362 = ~_1306;
        int _1364 = _1362 + 1;
        _1358 = _1364;
    }
    int _1366 = _1358;
    float _1368 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1370 = _971 + _1368;
    float _1372 = _175 + _1212;
    bool _1374 = _1308 >= 0.0;
    bool _1376 = isnan(_1308);
    bool _1378 = _1374 || _1376;
    bool _1380 = isnan(0.0);
    bool _1382 = _1378 || _1380;
    float _1384 = fma(_211, _1192, _1244);
    float _1386 = _1212 + _1262;
    float _1388 = _1370 * _1294;
    int _1390 = _1382 ? 0 : 1;
    float _1392 = _1372 + (-1.0);
    float _1394 = _1386 + (-1.0);
    bool _1396 = _1308 > 0.0;
    float _1398 = _1262 * 2.0;
    int _1400 = int(_1236) + int(_1334);
    float _1402 = _1384 + _979;
    float _1404 = floor(_1398);
    int _1406 = ~_983;
    int _1408 = _1406 + 1;
    float _1410 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1318);
    float _1412 = fma(_1394, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1414 = ~_1390;
    int _1416 = _1414 + 1;
    int _1418 = _1416 + 1;
    int _1420 = _1408 * _1400;
    int _1422 = _1420 + _1218;
    float _1424 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1426 = log2(_1424);
    float _1428 = fma(_1392, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1430 = !_1150;
    float _1432 = _1430 ? _273 : as_type<float>(_1328);
    float _1434 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1436 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1434;
    bool _1438 = uint(_1422) >= uint(_983);
    int _1440 = _1418;
    float _1442 = _1412;
    if (!_1396)
    {
        int _1444 = ~_1390;
        int _1446 = _1444 + 1;
        _1440 = _1446;
    }
    int _1448 = _1440;
    float _1450 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1452 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1450;
    bool _1454 = !_1438;
    int _1456 = _1454 ? 0 : (-1);
    float _1458 = fma(_1452, _1314, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    bool _1460 = _1404 > 0.0;
    bool _1462 = _1404 >= 0.0;
    bool _1464 = isnan(_1404);
    bool _1466 = _1462 || _1464;
    bool _1468 = isnan(0.0);
    bool _1470 = _1466 || _1468;
    float _1472 = _1322 + 0.5;
    float _1474 = _1426 * _153;
    float _1476 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1478 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1476;
    float _1480 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1482 = _1480 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1484 = fma(_1472, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1302);
    float _1486 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1488 = _1486 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1490 = _1356 + _977;
    float _1492 = exp2(_1474);
    float _1494 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1496 = _1494 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1498 = fma(_1478, _1314, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1500 = fma(_1436, _1314, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1502 = fma(_1482, _1388, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    int _1504 = ~_1400;
    int _1506 = _1504 + _1456;
    int _1508 = _1506 + 1;
    float _1510 = fma(_1488, _1388, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1512 = fma(_1496, _1388, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1514 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1516 = 1.0 + _1514;
    bool _1518 = _971 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1520 = isnan(_971);
    bool _1522 = _1518 || _1520;
    bool _1524 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1526 = _1522 || _1524;
    float _1528 = float(_1526);
    int _1530 = _983 * _1508;
    int _1532 = _1530 + _1218;
    int _1534 = _1470 ? 0 : 1;
    float _1536 = 1.0 / _1516;
    bool _1538 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1540 = isnan(0.0);
    bool _1542 = _1538 || _1540;
    bool _1544 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1546 = _1542 || _1544;
    float _1548 = -_1528;
    float _1550 = _1548 + 1.0;
    float _1552 = -_1492;
    float _1554 = _1552 + 1.0;
    bool _1556 = _971 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1558 = isnan(_971);
    bool _1560 = _1556 || _1558;
    bool _1562 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1564 = _1560 || _1562;
    float _1566 = float(_1564);
    float _1568 = _1546 ? _1554 : 0.0;
    float _1570 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1572 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1574 = isnan(1.0);
    bool _1576 = _1572 || _1574;
    bool _1578 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1580 = _1576 || _1578;
    float _1582 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1584 = _971 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1586 = isnan(_971);
    bool _1588 = _1584 || _1586;
    bool _1590 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1592 = _1588 || _1590;
    float _1594 = float(_1592);
    float _1596 = _1566 * _1550;
    float _1598 = -_1566;
    float _1600 = _1598 + 1.0;
    float _1602 = float(uint(_1160));
    float _1604 = fma(_1212, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1570);
    float _1606 = fma(_175, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1582);
    float _1608 = _1594 * _1600;
    bool _1610 = !_1110;
    int _1612 = _1610 ? _1532 : (-1);
    float _1614 = as_type<float>(_1009) * _1602;
    float _1616 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1606);
    float _1618 = _1498 * _1608;
    float _1620 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1604);
    int _1622 = _1612 >> 31;
    if (_1580)
    {
        float _1624 = _1568 * _1536;
        _155 = _1624;
    }
    float _1626 = _155;
    float _1628 = _1432 + (-0.5);
    float _1630 = _1458 * _1608;
    float _1632 = _1500 * _1608;
    int _1634 = ~_983;
    int _1636 = _1634 + 1;
    float _1638 = trunc(_1614);
    float _1640 = precise::max(_1638, 0.0);
    uint _1642 = uint(_1640);
    int _1644 = _1622 & 3;
    float _1646 = -_1628;
    float _1648 = -_1410;
    float _1650 = fma(_1646, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1648);
    float _1652 = -_1594;
    float _1654 = _1652 + 1.0;
    int _1656 = _1612 + _1644;
    float _1658 = -_1616;
    float _1660 = _1658 + 1.0;
    int _1662 = ~_1534;
    int _1664 = _1662 + 1;
    int _1666 = _1664 + 1;
    float _1668 = fma(_1654, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1618);
    int _1670 = _1656 >> 2;
    float _1672 = fma(_1654, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1630);
    float _1674 = fma(_1654, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1632);
    int _1676 = _1666;
    if (!_1460)
    {
        int _1678 = ~_1534;
        int _1680 = _1678 + 1;
        _1676 = _1680;
    }
    int _1682 = _1676;
    float _1684 = fma(_1502, _1596, _1668);
    int _1686 = _1670 << 4;
    int _1688 = _1686 + 368;
    float _1690 = -_1660;
    float _1692 = fma(_1322, _1690, _1484);
    bool _1694 = !_1350;
    int _1696 = _1694 ? 0 : 1;
    int _1698 = _1636 * int(_1642);
    int _1700 = _1698 + _1160;
    uint _1702 = uint(int(uint(_1688) >> uint(2)));
    uint _1704 = uint(int(uint(int(_1702)) >> uint(2)));
    int _1706 = int(_1702) & 3;
    float _1708 = (*spvDescriptorSet0.vp_c9)._m0[int(_1704)][_1706];
    int _1710 = int(_1702) + 1;
    uint _1712 = uint(int(uint(_1710) >> uint(2)));
    int _1714 = _1710 & 3;
    float _1716 = (*spvDescriptorSet0.vp_c9)._m0[int(_1712)][_1714];
    float _1718 = fma(_1510, _1596, _1672);
    int _1720 = abs(_1696);
    float _1722 = fma(_1512, _1596, _1674);
    float _1724 = float(uint(_1700));
    float _1726 = -_1620;
    float _1728 = _1726 + 1.0;
    float _1730 = _1212 + (-0.5);
    int _1732 = _1612 & 3;
    bool _1734 = _1732 != 0;
    float _1736 = as_type<float>(_1009) * _1724;
    float _1738 = float(_1366);
    float _1740 = fma(_1432, _1728, _1650);
    float _1742 = float(_1720);
    float _1744 = trunc(_1736);
    float _1746 = precise::max(_1744, 0.0);
    uint _1748 = uint(_1746);
    bool _1750 = !_1346;
    int _1752 = _1750 ? 0 : 1;
    bool _1754 = uint(_1732) > 1u;
    float _1756 = _1742 * _1738;
    int _1758 = abs(_1752);
    out.m_82.x = _1692;
    out.m_82.y = _1740;
    int _1760 = _1688 + 8;
    uint _1762 = uint(int(uint(_1760) >> uint(2)));
    uint _1764 = uint(int(uint(int(_1762)) >> uint(2)));
    int _1766 = int(_1762) & 3;
    float _1768 = (*spvDescriptorSet0.vp_c9)._m0[int(_1764)][_1766];
    int _1770 = int(_1762) + 1;
    uint _1772 = uint(int(uint(_1770) >> uint(2)));
    int _1774 = _1770 & 3;
    float _1776 = (*spvDescriptorSet0.vp_c9)._m0[int(_1772)][_1774];
    int _1778 = _1612 & 3;
    bool _1780 = _1778 != 0;
    float _1782 = fma(_1528, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1684);
    int _1784 = ~_983;
    int _1786 = _1784 + 1;
    float _1788 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1790 = _1490 + _1788;
    float _1792 = float(_1682);
    int _1794 = _1780 ? 0 : 1;
    int _1796 = int(_1642) + int(_1748);
    int _1798 = ~_1794;
    int _1800 = _1798 + 1;
    int _1802 = _1800 + 1;
    int _1804 = _1802;
    if (!_1754)
    {
        int _1806 = ~_1794;
        int _1808 = _1806 + 1;
        _1804 = _1808;
    }
    int _1810 = _1804;
    bool _1812 = !_1734;
    int _1814 = _1812 ? 0 : 1;
    float _1816 = float(_1758);
    float _1818 = fma(_1528, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1718);
    int _1820 = abs(_1810);
    int _1822 = _1786 * _1796;
    int _1824 = _1822 + _1160;
    bool _1826 = _1732 != 3;
    float _1828 = _1816 * _1792;
    int _1830 = abs(_1814);
    float _1832 = fma(_1528, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1722);
    float _1834 = _1828 * (-2.0);
    bool _1836 = uint(_1732) >= 2u;
    bool _1838 = uint(_1824) >= uint(_983);
    int _1840 = ~_1820;
    int _1842 = _1840 + 1;
    int _1844 = _1842 + 1;
    int _1846 = _1836 ? 0 : 1;
    bool _1848 = !_1838;
    int _1850 = _1848 ? 0 : (-1);
    int _1852 = _1844 * as_type<int>(_1716);
    int _1854 = ~_1830;
    int _1856 = _1854 + 1;
    int _1858 = _1856 + 1;
    bool _1860 = _1732 != 3;
    int _1862 = ~_1846;
    int _1864 = _1862 + 1;
    int _1866 = _1864 + 1;
    int _1868 = _1866;
    if (_1826)
    {
        int _1870 = ~_1846;
        int _1872 = _1870 + 1;
        _1868 = _1872;
    }
    int _1874 = _1868;
    int _1876 = ~_1796;
    int _1878 = _1876 + _1850;
    int _1880 = _1878 + 1;
    int _1882 = _1858 * as_type<int>(_1708);
    int _1884 = _1882 + _1852;
    bool _1886 = !_1860;
    int _1888 = _1886 ? 0 : (-1);
    float _1890 = in.m_84.x;
    float _1892 = in.m_84.y;
    float _1894 = in.m_84.z;
    int _1896 = abs(_1874);
    float _1898 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1900 = _1342 + _1898;
    int _1902 = abs(_1888);
    float _1904 = _1900 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _1906 = !_1202;
    int _1908 = _1906 ? 0 : 1;
    float _1910 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1912 = _1402 + _1910;
    int _1914 = ~_1896;
    int _1916 = _1914 + 1;
    int _1918 = _1916 + 1;
    float _1920 = fma(_1790, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1904);
    int _1922 = abs(_1908);
    int _1924 = ~_1902;
    int _1926 = _1924 + 1;
    int _1928 = _1926 + 1;
    int _1930 = _1918 * as_type<int>(_1768);
    int _1932 = _1930 + _1884;
    float _1934 = fma(_1912, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1920);
    float _1936 = _1756 * (-2.0);
    int _1938 = _1928 * as_type<int>(_1776);
    int _1940 = _1938 + _1932;
    int _1942 = ~_1922;
    int _1944 = _1942 + 1;
    int _1946 = _1944 + 1;
    bool _1948 = _1934 >= 0.0;
    float _1950 = fma(_1412, _1936, _1412);
    int _1952 = _1940 * _1946;
    float _1954 = _1900 * _1900;
    float _1956 = fma(_1936, _1892, _1892);
    int _1958 = _983 * _1880;
    int _1960 = _1958 + _1160;
    float _1962 = fma(_1428, _1834, _1428);
    float _1964 = fma(_1790, _1790, _1954);
    float _1966 = _1832 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1968 = fma(_1730, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1956);
    bool _1970 = !_1110;
    int _1972 = _1970 ? _1960 : (-1);
    float _1974 = fma(_1912, _1912, _1964);
    if (_1948)
    {
        _1442 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1976 = _1442;
    float _1978 = _1818 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1980 = _1966 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1982 = _1972 * _1922;
    int _1984 = _1982 + _1952;
    float _1986 = _1782 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1988 = rsqrt(_1974);
    float _1990 = _1978 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1992 = _1986 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1994 = as_type<int>(_1976);
    if (_1948)
    {
        float _1996 = _1976 * 5.0;
        _1994 = as_type<int>(_1996);
    }
    int _1998 = _1994;
    float _2000 = float(_1984);
    if (_1948)
    {
        out.m_61.x = 0.0;
    }
    bool _2002 = !_1354;
    int _2004 = _2002 ? 0 : 1;
    float _2006 = fma(_1834, _1890, _1890);
    float _2008 = fma(_1950, _1626, _1968);
    out.m_86.x = _1992;
    out.m_86.y = _1990;
    out.m_86.z = _1980;
    float _2010 = _175 + (-0.5);
    if (_1948)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7075 = as_type<float>(_1998);
        out.gl_Position.z = _7075;
    }
    float _2012 = _1900 * _1988;
    float _2014 = _1790 * _1988;
    out.m_88.x = _2000;
    int _2016 = abs(_2004);
    if (_1948)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2018 = -_2012;
    float _2020 = fma(_2018, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1342);
    float _2022 = _1912 * _1988;
    float _2024 = -_2014;
    float _2026 = fma(_2024, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1490);
    float _2028 = float(_2016);
    float _2030 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2032 = _2020 + _2030;
    float _2034 = -_2022;
    float _2036 = fma(_2034, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1402);
    float _2038 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2040 = _2026 + _2038;
    float _2042 = float(_1448);
    float _2044 = _2032 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2046 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2048 = _2036 + _2046;
    float _2050 = _175 + _1262;
    float _2052 = fma(_2040, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2044);
    float _2054 = _2028 * _2042;
    float _2056 = _2050 + (-1.0);
    float _2058 = -_2012;
    float _2060 = fma(_2058, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1900);
    float _2062 = fma(_2048, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2052);
    float _2064 = _2054 * (-2.0);
    float _2066 = fma(_2056, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2068 = _1262 + (-0.5);
    float _2070 = fma(_2010, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2006);
    bool _2072 = _2062 >= 0.0;
    float _2074 = fma(_2064, _1894, _1894);
    float _2076 = -_2014;
    float _2078 = fma(_2076, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1790);
    float _2080 = _2060 * _2060;
    float _2082 = fma(_2066, _2064, _2066);
    float _2084 = fma(_2068, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2074);
    float _2086 = fma(_1962, _1626, _2070);
    float _2088 = fma(_2078, _2078, _2080);
    float _2090 = -_2022;
    float _2092 = fma(_2090, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1912);
    float _2094 = _2008 * 0.15915493667125701904296875;
    float _2096 = fma(_2082, _1626, _2084);
    float _2098 = _2086 * 0.15915493667125701904296875;
    float _2100 = fma(_2092, _2092, _2088);
    float _2102 = _2094 * 6.283185482025146484375;
    float _2104 = sin(_2102);
    float _2106 = (*spvDescriptorSet0.vp_c9)._m0[198].z;
    int _2108 = as_type<int>(_2074);
    float _2110 = _2020;
    if (_2072)
    {
        _2106 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2112 = _2106;
    if (_2072)
    {
        out.m_61.x = 0.0;
    }
    float _2114 = _369 * _935;
    if (_2072)
    {
        float _2116 = _2112 * 5.0;
        _2108 = as_type<int>(_2116);
    }
    int _2118 = _2108;
    float _2120 = _2094 * 6.283185482025146484375;
    float _2122 = cos(_2120);
    if (_2072)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7273 = as_type<float>(_2118);
        out.gl_Position.z = _7273;
    }
    float _2124 = _2098 * 6.283185482025146484375;
    float _2126 = sin(_2124);
    float _2128 = _2096 * 0.15915493667125701904296875;
    float _2130 = sqrt(_2100);
    float _2132 = _2098 * 6.283185482025146484375;
    float _2134 = cos(_2132);
    if (_2072)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2136 = _2114 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2138 = _1988 * _2130;
    float _2140 = _2128 * 6.283185482025146484375;
    float _2142 = cos(_2140);
    float _2144 = _365 * _937;
    float _2146 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _273);
    float _2148 = _2138 * _2136;
    float _2150 = _2134 * _2122;
    float _2152 = _2144 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2154 = _2134 * _2104;
    float _2156 = _2146 * _2148;
    float _2158 = _2128 * 6.283185482025146484375;
    float _2160 = sin(_2158);
    float _2162 = _2126 * _2104;
    float _2164 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _373);
    float _2166 = _2138 * _2152;
    float _2168 = _2126 * _2122;
    float _2170 = _2164 * _2166;
    float _2172 = _2134 * _2142;
    float _2174 = _2126 * _2142;
    float _2176 = _2122 * _2142;
    float _2178 = _2104 * _2142;
    float _2180 = _2172 * _2156;
    float _2182 = _2138 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2184 = _2182 * 0.5;
    float _2186 = _2172 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2188 = _2172 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2190 = fma(_2160, _2150, _2162);
    float _2192 = -_2168;
    float _2194 = fma(_2160, _2154, _2192);
    float _2196 = -_2156;
    float _2198 = _2160 * _2196;
    float _2200 = -_2154;
    float _2202 = fma(_2160, _2168, _2200);
    float _2204 = fma(_2190, _2170, _2180);
    float _2206 = _2174 * _2156;
    float _2208 = fma(_2176, _2170, _2198);
    float _2210 = fma(_2160, _2162, _2150);
    float _2212 = fma(_2194, _2184, _2204);
    float _2214 = fma(_2202, _2170, _2206);
    float _2216 = fma(_2178, _2184, _2208);
    float _2218 = _2190 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2220 = _2212 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2222 = _2212 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2224 = fma(_2210, _2184, _2214);
    float _2226 = _2212 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2228 = fma(_2216, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2220);
    float _2230 = fma(_2216, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2222);
    float _2232 = _2190 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2234 = fma(_2216, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2226);
    float _2236 = fma(_2224, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2228);
    float _2238 = fma(_2224, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2230);
    float _2240 = _2190 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2242 = fma(_2224, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2234);
    float _2244 = _2236 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2246 = _2238 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2248 = _2172 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2250 = _2242 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2252 = _1490 + _2244;
    float _2254 = _1402 + _2246;
    float _2256 = fma(_2176, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2218);
    float _2258 = fma(_2176, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2232);
    float _2260 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2262 = _2252 + _2260;
    float _2264 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2266 = _2254 + _2264;
    float _2268 = _2194 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2270 = _2194 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2272 = _2262 * _2262;
    float _2274 = _2266 * _2266;
    float _2276 = _2194 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2278 = _1342 + _2250;
    float _2280 = fma(_2176, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2240);
    float _2282 = _2272 + _2274;
    float _2284 = -_2160;
    float _2286 = fma(_2284, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2186);
    float _2288 = -_2160;
    float _2290 = fma(_2288, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2188);
    float _2292 = -_2160;
    float _2294 = fma(_2292, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2248);
    float _2296 = sqrt(_2282);
    float _2298 = fma(_2202, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2256);
    float _2300 = fma(_2202, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2258);
    float _2302 = fma(_2178, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2268);
    float _2304 = fma(_2178, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2270);
    float _2306 = fma(_2178, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2276);
    float _2308 = fma(_2202, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2280);
    bool _2310 = _2296 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2312 = _2178;
    float _2314 = _2194;
    float _2316 = _2272;
    float _2318 = _2274;
    float _2320 = _2254;
    int _2322 = as_type<int>(_2286);
    float _2324 = _2186;
    if (!_2310)
    {
        _2312 = _2252;
    }
    float _2326 = _2312;
    float _2328 = _2326;
    if (!_2310)
    {
        _2314 = _2278;
    }
    float _2330 = _2314;
    bool _2332 = !_2310;
    float _2334 = _2330;
    if (!_2332)
    {
        float _2336 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2338 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2340 = _2296 + _2338;
        float _2342 = _2278 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2344 = rsqrt(_2282);
        float _2346 = _2340 * _2336;
        float _2348 = _2346 * 0.15915493667125701904296875;
        float _2350 = _2348 * 6.283185482025146484375;
        float _2352 = sin(_2350);
        float _2354 = _2348 * 6.283185482025146484375;
        float _2356 = cos(_2354);
        float _2358 = fma(_2352, _2342, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2360 = _2344 * _2358;
        float _2362 = fma(_2262, _2360, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2364 = _2356 + (-1.0);
        float _2366 = fma(_2266, _2360, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2368 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2370 = _2362 + _2368;
        float _2372 = _2364 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2374 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2376 = _2366 + _2374;
        float _2378 = _2370 * _2370;
        float _2380 = fma(_2278, _2356, _2372);
        float _2382 = _2376 * _2376;
        _2334 = _2380;
        _2316 = _2378;
        _2318 = _2382;
        _2320 = _2366;
        _2328 = _2362;
    }
    float _2384 = _2334;
    float _2386 = _2316;
    float _2388 = _2318;
    float _2390 = _2320;
    float _2392 = _2328;
    float _2394 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2396 = _2384 + _2394;
    float _2398 = fma(_2174, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2286);
    float _2400 = fma(_2174, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2290);
    float _2402 = fma(_2174, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2294);
    float _2404 = fma(_2396, _2396, _2386);
    float _2406 = _273 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2408 = _373 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2410 = fma(_2210, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2302);
    float _2412 = _2404 + _2388;
    float _2414 = _2406 * _2398;
    float _2416 = _2406 * _2400;
    float _2418 = _2406 * _2402;
    float _2420 = fma(_2210, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2304);
    float _2422 = fma(_2210, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2306);
    float _2424 = sqrt(_2412);
    float _2426 = fma(_2408, _2298, _2414);
    float _2428 = fma(_2408, _2300, _2416);
    float _2430 = fma(_2408, _2308, _2418);
    float _2432 = _2410 + _2426;
    float _2434 = _2420 + _2428;
    float _2436 = _2422 + _2430;
    out.m_90.x = _2432;
    out.m_90.y = _2434;
    out.m_90.z = _2436;
    bool _2438 = _2424 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2440 = isnan(_2424);
    bool _2442 = _2438 || _2440;
    bool _2444 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2446 = _2442 || _2444;
    float _2448 = 0.0;
    int _2450 = as_type<int>(_2392);
    if (!_2446)
    {
        _2448 = 1.0;
    }
    float _2452 = _2448;
    bool _2454 = !_2446;
    float _2456 = _2452;
    if (!_2454)
    {
        bool _2458 = _2424 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2460 = isnan(_2424);
        bool _2462 = _2458 || _2460;
        bool _2464 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2466 = _2462 || _2464;
        if (!_2466)
        {
            float _2468 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2470 = _2424 + _2468;
            float _2472 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2474 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2472;
            float _2476 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2478 = _2476 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2480 = 1.0 / _2474;
            float _2482 = _2470 * _2480;
            float _2484 = fma(_2482, _2478, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2456 = _2484;
            _2486 = true;
        }
        else
        {
            bool _2488 = _2424 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2490 = isnan(_2424);
            bool _2492 = _2488 || _2490;
            bool _2494 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2496 = _2492 || _2494;
            if (!_2496)
            {
                float _2498 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2500 = _2424 + _2498;
                float _2502 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2504 = _2502 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2506 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2508 = _2506 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2510 = 1.0 / _2504;
                float _2512 = _2500 * _2510;
                float _2514 = fma(_2512, _2508, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2456 = _2514;
                _2486 = true;
            }
            else
            {
                _2456 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2486 = false;
    float _2516 = _2456;
    float _2518 = fma(_2026, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2520 = fma(_2036, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2522 = floor(_2518);
    float _2524 = floor(_2520);
    float _2526 = -_2522;
    float _2528 = _2518 + _2526;
    float _2530 = -_2524;
    float _2532 = _2520 + _2530;
    float2 _7979 = float2(_2528, _2532);
    float _2534 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7979, float2(0.0), isnan(_7979)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7979, float2(0.0), isnan(_7979)), level(0.0)).x;
    float _2536 = _2020 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2538 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _2540 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2542 = _2384 + _2540;
    float _2544 = fma(_2026, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2536);
    float _2546 = _2020 + _2538;
    float _2548 = fma(_2542, _2516, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2550 = fma(_2036, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2544);
    float _2552 = _2020 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2554 = _2546 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _2556 = -_1342;
    float _2558 = _2556 + _2548;
    float _2560 = _2550 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2562 = fma(_2026, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2552);
    float _2564 = fma(_2026, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2554);
    float _2566 = 1.0 / _2560;
    float _2568 = fma(_2036, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2562);
    float _2570 = fma(_2036, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2564);
    float _2572 = _2568 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2574 = _2570 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _2576 = _2546 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2578 = _2572 + _2560;
    float _2580 = fma(_2026, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2576);
    float _2582 = trunc(_2574);
    int _2584 = int(_2582);
    float _2586 = fma(_2036, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2580);
    float _2588 = _2578 * _2566;
    float _2590 = _2588 * 0.5;
    float _2592 = _2586 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _2594 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2596 = fma(_2590, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2594);
    float _2598 = trunc(_2592);
    int _2600 = int(_2598);
    int _2602 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2604 = _2584 + _2602;
    int _2606 = _2604 + 1;
    float _2608 = 1.0 / _2596;
    bool _2610 = _2606 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _2612 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2614 = _2600 + _2612;
    int _2616 = _2614 + 1;
    int _2618 = _2606 | _2616;
    float _2620 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2622 = _2608 * _2620;
    bool _2624 = _2618 < 0;
    bool _2626 = _2624 || _2610;
    float _2628 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2630 = _2390 + _2628;
    bool _2632 = _2622 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _2634 = _2622 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _2636 = _2616 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2638 = _2636 || _2626;
    bool _2640 = !_2632;
    int _2642 = _2640 ? 0 : 1;
    int _2644 = 2;
    int _2646 = _2642;
    int _2648 = as_type<int>(_2542);
    float _2650 = _2548;
    float _2652 = _2558;
    float _2654 = _2592;
    float _2656 = _2574;
    if (!_2632)
    {
        _2644 = 1;
    }
    int _2658 = _2644;
    int _2660 = _2658;
    if (!_2634)
    {
        _2660 = _2642;
    }
    int _2662 = _2660;
    float _2664 = as_type<float>(_2662);
    if (!_2638)
    {
        int _2666 = _2616 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _2668 = _2666 + _2606;
        _2322 = _2668;
    }
    int _2670 = _2322;
    float _2672 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2674 = _2392 + _2672;
    int _2676 = _2662 << 6;
    if (!_2638)
    {
        int _2678 = _2670 << 2;
        _2646 = _2678;
    }
    int _2680 = _2646;
    int _2682 = _2676 + 96;
    uint _2684 = uint(int(uint(_2682) >> uint(2)));
    uint _2686 = uint(int(uint(int(_2684)) >> uint(2)));
    int _2688 = int(_2684) & 3;
    float _2690 = (*spvDescriptorSet0.vp_c15)._m0[int(_2686)][_2688];
    int _2692 = int(_2684) + 1;
    uint _2694 = uint(int(uint(_2692) >> uint(2)));
    int _2696 = _2692 & 3;
    float _2698 = (*spvDescriptorSet0.vp_c15)._m0[int(_2694)][_2696];
    if (!_2638)
    {
        uint _2700 = uint(int(uint(_2670) >> uint(2)));
        _2450 = int(_2700);
    }
    int _2702 = _2450;
    float _2704 = fma(_2674, _2516, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2706 = _2704;
    if (!_2638)
    {
        int _2708 = 12 & _2680;
        _2648 = _2708;
    }
    int _2710 = _2648;
    float _2712 = fma(_2630, _2516, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2714 = -_1490;
    float _2716 = _2714 + _2704;
    float _2718 = _2712;
    if (!_2638)
    {
        int _2720 = _2702 << 4;
        int _2722 = _2720 + _2710;
        _2324 = as_type<float>(_2722);
    }
    float _2724 = _2324;
    int _2726 = _2676 + 104;
    uint _2728 = uint(int(uint(_2726) >> uint(2)));
    uint _2730 = uint(int(uint(int(_2728)) >> uint(2)));
    int _2732 = int(_2728) & 3;
    float _2734 = (*spvDescriptorSet0.vp_c15)._m0[int(_2730)][_2732];
    int _2736 = int(_2728) + 1;
    uint _2738 = uint(int(uint(_2736) >> uint(2)));
    int _2740 = _2736 & 3;
    float _2742 = (*spvDescriptorSet0.vp_c15)._m0[int(_2738)][_2740];
    float _2744 = _2558 * _2558;
    float _2746 = -_1402;
    float _2748 = _2746 + _2712;
    float _2750 = fma(_2716, _2716, _2744);
    int _2752 = _2676 + 48;
    uint _2754 = uint(int(uint(_2752) >> uint(2)));
    uint _2756 = uint(int(uint(int(_2754)) >> uint(2)));
    int _2758 = int(_2754) & 3;
    float _2760 = (*spvDescriptorSet0.vp_c15)._m0[int(_2756)][_2758];
    int _2762 = int(_2754) + 1;
    uint _2764 = uint(int(uint(_2762) >> uint(2)));
    int _2766 = _2762 & 3;
    float _2768 = (*spvDescriptorSet0.vp_c15)._m0[int(_2764)][_2766];
    float _2770 = fma(_2748, _2748, _2750);
    float _2772 = sqrt(_2770);
    int _2774 = _2676 + 64;
    uint _2776 = uint(int(uint(_2774) >> uint(2)));
    uint _2778 = uint(int(uint(int(_2776)) >> uint(2)));
    int _2780 = int(_2776) & 3;
    float _2782 = (*spvDescriptorSet0.vp_c15)._m0[int(_2778)][_2780];
    int _2784 = int(_2776) + 1;
    uint _2786 = uint(int(uint(_2784) >> uint(2)));
    int _2788 = _2784 & 3;
    float _2790 = (*spvDescriptorSet0.vp_c15)._m0[int(_2786)][_2788];
    int _2792 = _2676 + 56;
    uint _2794 = uint(int(uint(_2792) >> uint(2)));
    uint _2796 = uint(int(uint(int(_2794)) >> uint(2)));
    int _2798 = int(_2794) & 3;
    float _2800 = (*spvDescriptorSet0.vp_c15)._m0[int(_2796)][_2798];
    int _2802 = int(_2794) + 1;
    uint _2804 = uint(int(uint(_2802) >> uint(2)));
    int _2806 = _2802 & 3;
    float _2808 = (*spvDescriptorSet0.vp_c15)._m0[int(_2804)][_2806];
    bool _2810 = _2772 > 0.0;
    int _2812 = _2676 + 72;
    uint _2814 = uint(int(uint(_2812) >> uint(2)));
    uint _2816 = uint(int(uint(int(_2814)) >> uint(2)));
    int _2818 = int(_2814) & 3;
    float _2820 = (*spvDescriptorSet0.vp_c15)._m0[int(_2816)][_2818];
    int _2822 = int(_2814) + 1;
    uint _2824 = uint(int(uint(_2822) >> uint(2)));
    int _2826 = _2822 & 3;
    float _2828 = (*spvDescriptorSet0.vp_c15)._m0[int(_2824)][_2826];
    int _2830 = _2676 + 80;
    uint _2832 = uint(int(uint(_2830) >> uint(2)));
    uint _2834 = uint(int(uint(int(_2832)) >> uint(2)));
    int _2836 = int(_2832) & 3;
    float _2838 = (*spvDescriptorSet0.vp_c15)._m0[int(_2834)][_2836];
    int _2840 = int(_2832) + 1;
    uint _2842 = uint(int(uint(_2840) >> uint(2)));
    int _2844 = _2840 & 3;
    float _2846 = (*spvDescriptorSet0.vp_c15)._m0[int(_2842)][_2844];
    float _2848 = _2546 * _2698;
    float _2850 = fma(_2026, _2690, _2848);
    bool _2852 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2854 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2856 = _2852 || _2854;
    bool _2858 = isnan(0.5);
    bool _2860 = _2856 || _2858;
    float _2862 = _2690;
    if (!_2638)
    {
        float _2864 = floor(_2574);
        _2862 = _2864;
    }
    float _2866 = _2862;
    int _2868 = _2676 + 88;
    uint _2870 = uint(int(uint(_2868) >> uint(2)));
    uint _2872 = uint(int(uint(int(_2870)) >> uint(2)));
    int _2874 = int(_2870) & 3;
    float _2876 = (*spvDescriptorSet0.vp_c15)._m0[int(_2872)][_2874];
    int _2878 = int(_2870) + 1;
    uint _2880 = uint(int(uint(_2878) >> uint(2)));
    int _2882 = _2878 & 3;
    float _2884 = (*spvDescriptorSet0.vp_c15)._m0[int(_2880)][_2882];
    float _2886 = fma(_2036, _2734, _2850);
    float _2888 = _2886 + _2742;
    float _2890 = _2724;
    if (!_2638)
    {
        int _2892 = as_type<int>(_2724) + 400;
        uint _2894 = uint(int(uint(_2892) >> uint(2)));
        uint _2896 = uint(int(uint(int(_2894)) >> uint(2)));
        int _2898 = int(_2894) & 3;
        float _2900 = (*spvDescriptorSet0.vp_c15)._m0[int(_2896)][_2898];
        _2890 = _2900;
    }
    float _2902 = _2890;
    float _2904 = _2546 * _2768;
    float _2906 = _2546 * _2790;
    bool _2908 = !_2810;
    float _2910 = _2820;
    float _2912 = _2800;
    if (!_2908)
    {
        float _2914 = _287 * _287;
        float _2916 = fma(_359, _359, _2914);
        float _2918 = fma(_361, _361, _2916);
        float _2920 = rsqrt(_2770);
        float _2922 = sqrt(_2918);
        float _2924 = _2716 * _2920;
        float _2926 = _2558 * _2920;
        float _2928 = _2748 * _2920;
        bool _2930 = _2922 > 0.0;
        bool _2932 = !_2930;
        if (!_2932)
        {
            float _2934 = rsqrt(_2918);
            float _2936 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2938 = _287 * _2934;
            float _2940 = _359 * _2934;
            float _2942 = _361 * _2934;
            float _2944 = _2926 * _2938;
            float _2946 = fma(_2924, _2940, _2944);
            float _2948 = _2936 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2950 = fma(_2928, _2942, _2946);
            float _2952 = _2950 * _2948;
            float _2954 = fma(_359, _2952, _2704);
            float _2956 = fma(_287, _2952, _2548);
            float _2958 = fma(_361, _2952, _2712);
            _2706 = _2954;
            _2650 = _2956;
            _2718 = _2958;
            _2652 = _2938;
        }
    }
    float _2960 = _2706;
    float _2962 = _2650;
    float _2964 = _2718;
    float _2966 = _2652;
    float _2968 = 1.0 / _2888;
    float _2970 = fma(_2026, _2760, _2904);
    float _2972 = fma(_2026, _2782, _2906);
    float _2974 = -_2014;
    float _2976 = fma(_2974, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2960);
    float _2978 = -_2012;
    float _2980 = fma(_2978, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2962);
    float _2982 = fma(_2036, _2800, _2970);
    float _2984 = fma(_2036, _2820, _2972);
    float _2986 = -_2022;
    float _2988 = fma(_2986, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2964);
    float _2990 = _2988;
    float _2992 = _2966;
    float _2994 = _2976;
    if (_2860)
    {
        _2910 = _2976;
    }
    float _2996 = _2910;
    float _2998 = _2996;
    if (_2860)
    {
        _2912 = _2980;
    }
    float _3000 = _2912;
    float _3002 = _3000;
    if (!_2860)
    {
        float _3004 = _2032 * _2032;
        float _3006 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3008 = -_1342;
        float _3010 = _3008 + _2962;
        float _3012 = -_1490;
        float _3014 = _3012 + _2960;
        float _3016 = fma(_2040, _2040, _3004);
        float _3018 = -_1402;
        float _3020 = _3018 + _2964;
        float _3022 = fma(_2048, _2048, _3016);
        float _3024 = 1.0 / _2138;
        float _3026 = sqrt(_3022);
        float _3028 = precise::min(_3026, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3030 = _3028 * _3006;
        float _3032 = _3030 * _3024;
        float _3034 = fma(_3010, _3032, _2020);
        float _3036 = fma(_3014, _3032, _2026);
        float _3038 = fma(_3020, _3032, _2036);
        _3002 = _3034;
        _2998 = _3036;
        _2990 = _3038;
        _1360 = _3010;
    }
    float _3040 = _3002;
    float _3042 = _2998;
    float _3044 = _2990;
    float _3046 = _1360;
    float _3048 = _2982 + _2808;
    float _3050 = _3040 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3052 = _3040 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3054 = _2984 + _2828;
    float _3056 = _3048 * _2968;
    float _3058 = fma(_3042, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3050);
    float _3060 = _3040 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3062 = fma(_3042, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3052);
    float _3064 = _3040 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3066 = fma(_3044, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3058);
    float _3068 = fma(_3042, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3060);
    bool _3070 = _3056 >= 0.0;
    float _3072 = fma(_3044, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3062);
    float _3074 = _3066 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3076 = _3054 * _2968;
    float _3078 = fma(_3044, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3068);
    bool _3080 = _3056 <= 1.0;
    bool _3082 = _3080 && _3070;
    float _3084 = fma(_3042, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3064);
    float _3086 = _3072 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3088 = _3074 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3090 = _3078 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _3092 = _3076 >= 0.0;
    bool _3094 = _3092 && _3082;
    float _3096 = fma(_3044, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3084);
    float _3098 = fma(_3086, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3088);
    float _3100 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3102 = _3090 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _3104 = _3076 <= 1.0;
    bool _3106 = _3104 && _3094;
    float _3108 = _3096 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3110 = fma(_3090, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3098);
    float _3112 = -_3102;
    float _3114 = fma(_3112, _3100, 1.0);
    float _3116 = _3046;
    float _3118 = _3056;
    if (!_2638)
    {
        float _3120 = floor(_2592);
        _3116 = _3120;
    }
    float _3122 = _3116;
    float _3124 = _3074 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3126 = fma(_3108, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3110);
    float _3128 = _2546 * _2846;
    float _3130 = _3074 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3132 = _3126;
    if (!_2638)
    {
        float _3134 = -_2866;
        float _3136 = _2574 + _3134;
        _2992 = _3136;
    }
    float _3138 = _2992;
    float _3140 = fma(_2026, _2838, _3128);
    float _3142 = log2(_3114);
    if (_3106)
    {
        float _3144 = float(_2662);
        _2664 = _3144;
    }
    float _3146 = _2664;
    float _3148 = fma(_3086, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3130);
    float _3150 = fma(_3086, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3124);
    float _3152 = fma(_2036, _2876, _3140);
    float _3154 = fma(_3090, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3148);
    float _3156 = fma(_3090, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3150);
    float _3158 = 1.0 / _3126;
    if (!_2638)
    {
        float _3160 = -_3122;
        float _3162 = _2592 + _3160;
        _2654 = _3162;
    }
    float _3164 = _2654;
    float _3166 = fma(_3108, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3154);
    float _3168 = fma(_3108, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3156);
    float _3170 = _3152 + _2884;
    float _3172 = _2902;
    float _3174 = _3168;
    if (!_2638)
    {
        float _3176 = rint(_2902);
        float _3178 = precise::max(_3176, 0.0);
        uint _3180 = uint(_3178);
        uint _3182 = clamp(_3180, 0u, 65535u);
        _3172 = as_type<float>(_3182);
    }
    float _3184 = _3172;
    float _3186 = _3142 * 0.693147182464599609375;
    float _3188 = _3170 * _2968;
    float _3190 = _3186 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3192 = _3140;
    float _3194 = _3186;
    if (_3106)
    {
        float _3196 = rint(_3146);
        float _3198 = precise::max(_3196, 0.0);
        uint _3200 = uint(_3198);
        uint _3202 = clamp(_3200, 0u, 65535u);
        _3192 = as_type<float>(_3202);
    }
    float _3204 = _3192;
    float _3206 = _3166 * _3158;
    float _3208 = _3168 * _3158;
    float _3210 = fma(_3206, 0.5, 0.5);
    float _3212 = fma(_3208, -0.5, 0.5);
    float _3214 = _3184;
    float _3216 = _3210;
    if (!_2638)
    {
        float3 _9119 = float3(_3138, _3164, float(as_type<int>(_3184)));
        float3 _9123 = select(_9119, float3(0.0), isnan(_9119));
        float _3218 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _9123.xy, uint(rint(_9123.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _9123.xy, uint(rint(_9123.z)), level(0.0)).x;
        _3214 = _3218;
    }
    float _3220 = _3214;
    float _3222 = _3076;
    if (_3106)
    {
        float3 _9138 = float3(_3056, _3076, float(as_type<int>(_3204)));
        float3 _9140 = select(_9138, float3(0.0), isnan(_9138));
        float _3224 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _9140.xy, uint(rint(_9140.z)), _3188, level(0.0));
        _3222 = _3224;
    }
    float _3226 = _3222;
    float3 _9150 = float3(_3210, _3212, _3190);
    float _3228 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9150, float3(0.0), isnan(_9150)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9150, float3(0.0), isnan(_9150)), level(0.0)).x;
    float3 _9159 = float3(_3210, _3212, _3190);
    float4 _3231 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9159, float3(0.0), isnan(_9159)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9159, float3(0.0), isnan(_9159)), level(0.0)).xyzw;
    float _3233 = _3231.x;
    float _3235 = _3231.y;
    float _3237 = _3231.z;
    float _3239 = _3231.w;
    if (_2638)
    {
        _2110 = 1.0;
    }
    float _3241 = _2110;
    bool _3243 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _3245 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3247 = _3243 || _3245;
    bool _3249 = isnan(0.5);
    bool _3251 = _3247 || _3249;
    float _3253 = _3241;
    if (_3251)
    {
        _3194 = 1.0;
    }
    float _3255 = _3194;
    float _3257 = _3255;
    if (_3251)
    {
        _2994 = 1.0;
    }
    float _3259 = _2994;
    float _3261 = _3259;
    float _3263 = _3235;
    float _3265 = _3233;
    if (!_3251)
    {
        float _3267 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _3269 = _3267 * 0.15915493667125701904296875;
        float _3271 = _3269 * 6.283185482025146484375;
        float _3273 = cos(_3271);
        float _3275 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _3277 = _3275 * 0.15915493667125701904296875;
        float _3279 = _3269 * 6.283185482025146484375;
        float _3281 = sin(_3279);
        float _3283 = 1.0 / _3273;
        float _3285 = _3277 * 6.283185482025146484375;
        float _3287 = cos(_3285);
        float _3289 = _3281 * _3283;
        float _3291 = _3277 * 6.283185482025146484375;
        float _3293 = sin(_3291);
        float _3295 = _3287 * _3289;
        float _3297 = 1.0 / _3295;
        float _3299 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3301 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3299;
        float _3303 = 1.0 / _3301;
        float _3305 = _3293 * _3297;
        float _3307 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3309 = fma(_2622, _3305, _3307);
        float _3311 = _3309 * _3303;
        float _3313 = precise::clamp(_3311, 0.0, 1.0);
        _3118 = _3283;
        _3216 = _3277;
        _3261 = _3313;
    }
    float _3315 = _3118;
    float _3317 = _3216;
    float _3319 = _3261;
    float _3321 = _3315;
    float _3323 = _3317;
    if (!_3251)
    {
        float _3325 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _3327 = _3325 * 0.15915493667125701904296875;
        float _3329 = _3327 * 6.283185482025146484375;
        float _3331 = cos(_3329);
        float _3333 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _3335 = _3333 * 0.15915493667125701904296875;
        float _3337 = _3327 * 6.283185482025146484375;
        float _3339 = sin(_3337);
        float _3341 = 1.0 / _3331;
        float _3343 = _3335 * 6.283185482025146484375;
        float _3345 = cos(_3343);
        float _3347 = _3339 * _3341;
        float _3349 = _3335 * 6.283185482025146484375;
        float _3351 = sin(_3349);
        float _3353 = _3345 * _3347;
        float _3355 = 1.0 / _3353;
        float _3357 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3359 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _3357;
        float _3361 = 1.0 / _3359;
        float _3363 = _3351 * _3355;
        float _3365 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3367 = fma(_2622, _3363, _3365);
        float _3369 = _3367 * _3361;
        float _3371 = precise::clamp(_3369, 0.0, 1.0);
        float _3373 = -_3371;
        float _3375 = _3373 + 1.0;
        _3321 = _3327;
        _3323 = _3353;
        _3257 = _3375;
    }
    float _3377 = _3321;
    float _3379 = _3323;
    float _3381 = _3257;
    float _3383 = _3377;
    float _3385 = _3379;
    if (!_2638)
    {
        int _3387 = _2670 << 4;
        int _3389 = _3387 + 2048;
        uint _3391 = uint(int(uint(_3389) >> uint(2)));
        uint _3393 = uint(int(uint(int(_3391)) >> uint(2)));
        int _3395 = int(_3391) & 3;
        float _3397 = (*spvDescriptorSet0.vp_c15)._m0[int(_3393)][_3395];
        int _3399 = int(_3391) + 1;
        uint _3401 = uint(int(uint(_3399) >> uint(2)));
        int _3403 = _3399 & 3;
        float _3405 = (*spvDescriptorSet0.vp_c15)._m0[int(_3401)][_3403];
        int _3407 = _3389 + 8;
        uint _3409 = uint(int(uint(_3407) >> uint(2)));
        uint _3411 = uint(int(uint(int(_3409)) >> uint(2)));
        int _3413 = int(_3409) & 3;
        float _3415 = (*spvDescriptorSet0.vp_c15)._m0[int(_3411)][_3413];
        int _3417 = int(_3409) + 1;
        uint _3419 = uint(int(uint(_3417) >> uint(2)));
        int _3421 = _3417 & 3;
        float _3423 = (*spvDescriptorSet0.vp_c15)._m0[int(_3419)][_3421];
        float _3425 = _2546 * _3405;
        float _3427 = fma(_2026, _3397, _3425);
        float _3429 = fma(_2036, _3415, _3427);
        float _3431 = _3429 + _3423;
        float _3433 = precise::clamp(_3431, 0.0, 1.0);
        float _3435 = -_3433;
        float _3437 = _3435 + _3220;
        float _3439 = fma(_3437, 500.0, 1.5);
        float _3441 = exp2(_3439);
        float _3443 = 0.0 + _3441;
        float _3445 = precise::clamp(_3443, 0.0, 1.0);
        _3383 = _3423;
        _3253 = _3445;
    }
    float _3447 = _3383;
    float _3449 = _3253;
    float _3451 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3453 = _3040 + _3451;
    float _3455 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3457 = _3042 + _3455;
    float _3459 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3461 = _3044 + _3459;
    float _3463 = _3453 * _3453;
    float _3465 = fma(_3457, _3457, _3463);
    float _3467 = fma(_3461, _3461, _3465);
    float _3469 = rsqrt(_3467);
    float _3471 = _3469 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3473 = _3457 * _3471;
    float _3475 = _3461 * _3471;
    float _3477 = _3473 * _3473;
    float _3479 = _3475 * _3475;
    float _3481 = _3477 + _3479;
    float _3483 = sqrt(_3481);
    bool _3485 = _3483 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3487 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3489 = _3483 + _3487;
    float _3491 = _3469;
    float _3493 = _3489;
    float _3495 = _3453;
    float _3497 = _3471;
    if (_3485)
    {
        float _3499 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3491 = _3499;
    }
    float _3501 = _3491;
    float _3503 = _3501;
    if (_3485)
    {
        float _3505 = _3489 * _3501;
        _3493 = _3505;
    }
    float _3507 = _3493;
    if (_3485)
    {
        float _3509 = rsqrt(_3481);
        _3503 = _3509;
    }
    float _3511 = _3503;
    float _3513 = _3511;
    if (_3485)
    {
        float _3515 = _3507 * 0.15915493667125701904296875;
        _3385 = _3515;
    }
    float _3517 = _3385;
    float _3519 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3521 = _3461;
    float _3523 = _3517;
    if (_3485)
    {
        float _3525 = _3517 * 6.283185482025146484375;
        float _3527 = sin(_3525);
        _3521 = _3527;
    }
    float _3529 = _3521;
    float _3531 = precise::max(0.0, _3519);
    float _3533 = _3447;
    float _3535 = _3531;
    if (_3485)
    {
        float _3537 = _3517 * 6.283185482025146484375;
        float _3539 = cos(_3537);
        _3533 = _3539;
    }
    float _3541 = _3533;
    float _3543 = -_3471;
    float _3545 = -_3531;
    float _3547 = fma(_3453, _3543, _3545);
    if (_3485)
    {
        float _3549 = _3547 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3495 = _3549;
    }
    float _3551 = _3495;
    float _3553 = _3529;
    float _3555 = _3551;
    if (_3485)
    {
        float _3557 = fma(_3529, _3551, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3553 = _3557;
    }
    float _3559 = _3553;
    float _3561 = _3559;
    if (!_3485)
    {
        _3555 = _3475;
    }
    float _3563 = _3555;
    float _3565 = _3563;
    if (!_3485)
    {
        _3523 = _3477;
    }
    float _3567 = _3523;
    float _3569 = _3567;
    if (_3485)
    {
        float _3571 = _3511 * _3559;
        _2656 = _3571;
    }
    float _3573 = _2656;
    if (!_3485)
    {
        _3513 = _3473;
    }
    float _3575 = _3513;
    float _3577 = _3575;
    float _3579 = _3541;
    if (_3485)
    {
        float _3581 = _3541 + (-1.0);
        _3535 = _3581;
    }
    float _3583 = _3535;
    if (_3485)
    {
        float _3585 = _3473 * _3573;
        _3577 = _3585;
    }
    float _3587 = _3577;
    if (!_3485)
    {
        _3561 = _3547;
    }
    float _3589 = _3561;
    float _3591 = _3589;
    if (_3485)
    {
        float _3593 = _3475 * _3573;
        _3565 = _3593;
    }
    float _3595 = _3565;
    if (_3485)
    {
        float _3597 = _3583 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3497 = _3597;
    }
    float _3599 = _3497;
    if (_3485)
    {
        float _3601 = _3587 * _3587;
        _3569 = _3601;
    }
    float _3603 = _3569;
    float _3605 = sqrt(_3467);
    if (_3485)
    {
        float _3607 = fma(_3547, _3541, _3599);
        _3591 = _3607;
    }
    float _3609 = _3591;
    if (!_3485)
    {
        _3579 = _3479;
    }
    float _3611 = _3579;
    float _3613 = _3611;
    if (_3485)
    {
        float _3615 = _3595 * _3595;
        _3613 = _3615;
    }
    float _3617 = _3613;
    float _3619 = fma(_3609, _3609, _3603);
    float _3621 = _3619 + _3617;
    float _3623 = rsqrt(_3621);
    float _3625 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3627 = fma(_3605, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3625);
    float _3629 = precise::clamp(_3627, 0.0, 1.0);
    float _3631 = -_3629;
    float _3633 = _3631 + 1.0;
    float _3635 = abs(_3633);
    float _3637 = log2(_3635);
    float _3639 = _3623 * _3587;
    float _3641 = _3623 * _3609;
    float _3643 = _3623 * _3595;
    float _3645 = _3639 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3647 = -_3645;
    float _3649 = fma(_3641, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3647);
    float _3651 = -_3643;
    float _3653 = fma(_3651, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3649);
    float _3655 = _3637 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3657 = fma(_3653, -0.5, 0.5);
    float _3659 = fma(_3653, 0.5, 0.5);
    float _3661 = exp2(_3655);
    float _3663 = fma(_3659, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3665 = fma(_3659, _3663, -0.212114393711090087890625);
    float _3667 = _3641 + 1.0;
    float _3669 = sqrt(_3657);
    float _3671 = fma(_3659, _3665, 1.570728778839111328125);
    float _3673 = -_3641;
    float _3675 = fma(_3661, _3667, _3673);
    float _3677 = fma(_3675, 0.5, 0.5);
    float _3679 = _3669 * 0.636619746685028076171875;
    float _3681 = -_3671;
    float _3683 = fma(_3679, _3681, 1.0);
    float2 _9814 = float2(_3683, _3677);
    float3 _3687 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9814, float2(0.0), isnan(_9814)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9814, float2(0.0), isnan(_9814)), level(0.0)).xyz;
    float _3689 = _3687.x;
    float _3691 = _3687.y;
    float _3693 = _3687.z;
    float _3695 = abs(_2622);
    float _3697 = log2(_3695);
    float _3699 = _3074 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3701 = _3637 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3703 = _3126 * 0.5;
    float _3705 = -_2534;
    float _3707 = _3705 + 1.0;
    float _3709 = fma(_3086, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3699);
    float _3711 = fma(_3168, -0.5, _3703);
    float _3713 = exp2(_3701);
    float _3715 = fma(_3090, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3709);
    bool _3717 = _2622 <= 8000.0;
    bool _3719 = isnan(_2622);
    bool _3721 = _3717 || _3719;
    bool _3723 = isnan(8000.0);
    bool _3725 = _3721 || _3723;
    float _3727 = float(_3725);
    float _3729 = fma(_3108, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3715);
    float _3731 = _3697 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3733 = _3729 + _3126;
    out.gl_Position.x = _3166;
    out.gl_Position.y = _3168;
    out.gl_Position.z = _3729;
    out.gl_Position.w = _3126;
    float _3735 = _3166 + _3126;
    bool _3737 = _3605 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3739 = isnan(_3605);
    bool _3741 = _3737 || _3739;
    bool _3743 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3745 = _3741 || _3743;
    float _3747 = _3733 * 0.5;
    float _3749 = exp2(_3731);
    float _3751 = _3735 * 0.5;
    out.m_92.x = _3751;
    out.m_92.y = _3711;
    out.m_92.z = _3747;
    out.m_92.w = _3126;
    float _3753 = -_3713;
    float _3755 = _3753 + 1.0;
    if (!_3106)
    {
        _3174 = 1.0;
    }
    float _3757 = _3174;
    float _3759 = _3757;
    if (_3106)
    {
        bool _3761 = _3226 >= _3188;
        bool _3763 = isnan(_3226);
        bool _3765 = _3761 || _3763;
        bool _3767 = isnan(_3188);
        bool _3769 = _3765 || _3767;
        float _3771 = float(_3769);
        _3759 = _3771;
    }
    float _3773 = _3759;
    float _3775 = _3755 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (!_3745)
    {
        _3132 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3777 = _3132;
    float _3779 = fma(_3749, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3781 = precise::clamp(_3779, 0.0, 1.0);
    float _3783 = _3775 * _3228;
    float _3785 = _3773 * _3449;
    float _3787 = fma(_3781, -2.0, 3.0);
    float _3789 = _3781 * _3781;
    float _3791 = _3239 * _3783;
    float _3793 = -_3775;
    float _3795 = _3793 + 1.0;
    float _3797 = _3789 * _3787;
    float _3799 = _3239 * _3795;
    float _3801 = _3795;
    float _3803 = _3785;
    float _3805 = _3777;
    float _3807 = _3777;
    if (!_3745)
    {
        _3801 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3809 = _3801;
    float _3811 = -_3797;
    float _3813 = _3811 + 1.0;
    float _3815 = fma(_3813, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3797);
    float _3817 = _3727 * _3815;
    float _3819 = _3817 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3821 = _3707 * _3819;
    float _3823 = precise::clamp(_3821, 0.0, 1.0);
    float _3825 = -_3823;
    float _3827 = fma(_3825, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3829 = -_3785;
    float _3831 = fma(_3829, _3827, 1.0);
    float _3833 = precise::clamp(_3831, 0.0, 1.0);
    float _3835 = _3809;
    float _3837 = _3809;
    if (!_3745)
    {
        _3803 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3839 = _3803;
    float _3841 = _3833 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3843 = _3319 * _3381;
    out.m_94.x = _3841;
    float _3845 = _3843 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3847 = _3843;
    float _3849 = _3839;
    float _3851 = _3839;
    if (!_3745)
    {
        _3847 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3853 = _3847;
    float _3855 = _3693 * _3783;
    float _3857 = fma(_3689, _3791, _3233);
    float _3859 = fma(_3691, _3791, _3235);
    float _3861 = _3853;
    float _3863 = _3853;
    if (!_3745)
    {
        _3263 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3865 = _3263;
    float _3867 = fma(_3239, _3855, _3237);
    float _3869 = _3865;
    float _3871 = _3865;
    if (!_3745)
    {
        _3265 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3873 = _3265;
    out.m_96.x = _3857;
    out.m_96.y = _3859;
    out.m_96.z = _3867;
    out.m_96.w = _3799;
    bool _3875 = !_3745;
    float _3877 = _3873;
    float _3879 = _3873;
    if (!_3875)
    {
        bool _3881 = _3605 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3883 = isnan(_3605);
        bool _3885 = _3881 || _3883;
        bool _3887 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3889 = _3885 || _3887;
        if (!_3889)
        {
            float _3891 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3893 = _3605 + _3891;
            float _3895 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3897 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3895;
            float _3899 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3901 = _3899 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3903 = 1.0 / _3897;
            float _3905 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3907 = _3905 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3909 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3911 = _3909 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3913 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3915 = _3913 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3917 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3919 = _3917 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3921 = _3893 * _3903;
            float _3923 = precise::clamp(_3921, 0.0, 1.0);
            float _3925 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3927 = _3925 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3929 = fma(_3923, _3901, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3931 = fma(_3923, _3927, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3933 = fma(_3923, _3907, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3935 = fma(_3923, _3911, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3937 = fma(_3923, _3915, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3939 = fma(_3923, _3919, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3879 = _3933;
            _3851 = _3937;
            _3871 = _3929;
            _3837 = _3935;
            _3807 = _3931;
            _3863 = _3939;
            _3941 = true;
        }
        else
        {
            bool _3943 = _3605 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3945 = isnan(_3605);
            bool _3947 = _3943 || _3945;
            bool _3949 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3951 = _3947 || _3949;
            if (!_3951)
            {
                _3869 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3953 = _3869;
            _3871 = _3953;
            if (!_3951)
            {
                _3877 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3955 = _3877;
            _3879 = _3955;
            if (!_3951)
            {
                _3805 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3957 = _3805;
            _3807 = _3957;
            if (!_3951)
            {
                _3835 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3959 = _3835;
            _3837 = _3959;
            if (!_3951)
            {
                _3849 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3961 = _3849;
            _3851 = _3961;
            if (!_3951)
            {
                _3861 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3963 = _3861;
            bool _3965 = !_3951;
            _3863 = _3963;
            if (!_3965)
            {
                bool _3967 = _3605 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3969 = isnan(_3605);
                bool _3971 = _3967 || _3969;
                bool _3973 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3975 = _3971 || _3973;
                if (!_3975)
                {
                    float _3977 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3979 = _3605 + _3977;
                    float _3981 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3983 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3981;
                    float _3985 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3987 = _3985 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3989 = 1.0 / _3983;
                    float _3991 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3993 = _3991 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3995 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3997 = _3995 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3999 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4001 = _3999 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4003 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4005 = _4003 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4007 = _3979 * _3989;
                    float _4009 = precise::clamp(_4007, 0.0, 1.0);
                    float _4011 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4013 = _4011 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4015 = fma(_4009, _3987, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4017 = fma(_4009, _4013, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4019 = fma(_4009, _3993, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4021 = fma(_4009, _3997, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4023 = fma(_4009, _4001, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4025 = fma(_4009, _4005, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3879 = _4019;
                    _3851 = _4023;
                    _3871 = _4015;
                    _3837 = _4021;
                    _3807 = _4017;
                    _3863 = _4025;
                    _3941 = true;
                }
                else
                {
                    _3879 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3851 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3871 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3837 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3807 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3863 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3941 = false;
    float _4027 = _3879;
    float _4029 = _3851;
    float _4031 = _3871;
    float _4033 = _3837;
    float _4035 = _3807;
    float _4037 = _3863;
    float _4039 = _3845 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4041 = fma(_2434, -0.5, 0.5);
    float _4043 = precise::clamp(_4041, 0.0, 1.0);
    float _4045 = -_4027;
    float _4047 = _4045 + _4029;
    float _4049 = -_4031;
    float _4051 = _4049 + _4033;
    out.m_98.x = 0.0;
    float _4053 = fma(_4043, _4047, _4027);
    float _4055 = -_4035;
    float _4057 = _4055 + _4037;
    float _4059 = fma(_4043, _4051, _4031);
    float _4061 = _4053 * 0.586610972881317138671875;
    bool _4063 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4065 = fma(_4043, _4057, _4035);
    out.m_61.x = _4039;
    float _4067 = fma(_4059, 0.298911988735198974609375, _4061);
    bool _4069 = _3319 > 0.0;
    bool _4071 = isnan(_3319);
    bool _4073 = _4069 || _4071;
    bool _4075 = isnan(0.0);
    bool _4077 = _4073 || _4075;
    float _4079 = fma(_4065, 0.114477999508380889892578125, _4067);
    bool _4081 = _3381 <= 0.0;
    bool _4083 = !_4077;
    bool _4085 = _4081 || _4083;
    float _4087 = -_4079;
    float _4089 = _4059 + _4087;
    float _4091 = -_4079;
    float _4093 = _4053 + _4091;
    float _4095 = -_4079;
    float _4097 = _4065 + _4095;
    float _4099 = fma(_4089, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4079);
    float _4101 = fma(_4093, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4079);
    float _4103 = fma(_4097, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4079);
    bool _4105 = !_4063;
    if (!_4105)
    {
        float _4107 = -_3040;
        float _4109 = _4107 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4111 = -_3042;
        float _4113 = _4111 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4115 = -_3044;
        float _4117 = _4115 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4119 = _4109 * _4109;
        float _4121 = fma(_4113, _4113, _4119);
        float _4123 = fma(_4117, _4117, _4121);
        float _4125 = sqrt(_4123);
        float _4127 = rsqrt(_4123);
        float _4129 = -_4125;
        float _4131 = _4129 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4133 = _4131 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4135 = precise::clamp(_4133, 0.0, 1.0);
        float _4137 = _4113 * _4127;
        float _4139 = _4109 * _4127;
        float _4141 = abs(_4135);
        float _4143 = log2(_4141);
        float _4145 = _4117 * _4127;
        float _4147 = _4137 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4149 = _2434 * _4139;
        float _4151 = -_4139;
        float _4153 = -_4147;
        float _4155 = fma(_4151, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4153);
        float _4157 = fma(_2432, _4137, _4149);
        float _4159 = -_4145;
        float _4161 = fma(_4159, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4155);
        float _4163 = fma(_2436, _4145, _4157);
        float _4165 = precise::clamp(_4163, 0.0, 1.0);
        float _4167 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4169 = _4161 + _4167;
        float _4171 = _4143 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4173 = _4169 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4175 = precise::clamp(_4173, 0.0, 1.0);
        float _4177 = exp2(_4171);
        float _4179 = _4177 * _4175;
        float _4181 = _4165 * _4179;
        float _4183 = _4181 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4185 = _4181 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4187 = _4181 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_98.x = _4183;
        out.m_98.y = _4185;
        out.m_98.z = _4187;
    }
    out.m_100.x = _4099;
    out.m_100.y = _4101;
    out.m_100.z = _4103;
    if (!_4085)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_61.x = 0.0;
    float _4189 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4189;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

