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
    float4 m_84 [[user(locn0)]];
    float4 m_82 [[user(locn1)]];
    float4 m_96 [[user(locn2)]];
    float4 m_86 [[user(locn3)]];
    float4 m_59 [[user(locn4)]];
    float4 m_76 [[user(locn5)]];
    float4 m_92 [[user(locn6)]];
    float4 m_94 [[user(locn7)]];
    float4 m_88 [[user(locn8)]];
    float4 m_90 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_78 [[attribute(0)]];
    float4 m_72 [[attribute(1)]];
    float4 m_70 [[attribute(2)]];
    float4 m_74 [[attribute(3)]];
    float4 m_68 [[attribute(5)]];
    float4 m_56 [[attribute(6)]];
    float4 m_61 [[attribute(7)]];
    float4 m_63 [[attribute(8)]];
    float4 m_80 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2283 = false;
    bool _531 = false;
    bool _339 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _110 = in.m_56.w;
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
        out.m_59.x = 0.0;
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
        float _2588 = as_type<float>(_131);
        out.gl_Position.z = _2588;
    }
    if (!_119)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _135 = in.m_61.w;
    bool _137 = _135 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _139 = isnan(_135);
    bool _141 = _137 || _139;
    bool _143 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _145 = _141 || _143;
    float _147 = -_135;
    float _149 = _147 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _151 = 0.0;
    if (_145)
    {
        float _153 = float(_115);
        _151 = _153;
    }
    float _155 = _151;
    bool _157 = _149 >= _155;
    bool _159 = !_145;
    bool _161 = _157 || _159;
    if (_161)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _163 = _125;
    if (_161)
    {
        out.m_59.x = 0.0;
    }
    if (_161)
    {
        float _165 = _163 * 5.0;
        _133 = as_type<int>(_165);
    }
    int _167 = _133;
    if (_161)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2656 = as_type<float>(_167);
        out.gl_Position.z = _2656;
    }
    if (_161)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _169 = in.m_63.x;
    float _171 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _173 = _149 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _175 = as_type<float>(int(gl_VertexIndex));
    float _177 = in.m_68.x;
    float _179 = in.m_68.y;
    float _181 = in.m_68.z;
    float _183 = in.m_70.x;
    float _185 = in.m_70.y;
    float _187 = in.m_70.z;
    float _189 = in.m_72.x;
    float _191 = in.m_72.y;
    float _193 = in.m_72.z;
    float _195 = _173 * _171;
    float _197 = in.m_74.x;
    float _199 = in.m_74.y;
    float _201 = in.m_74.z;
    float _203 = fma(_169, (*spvDescriptorSet0.vp_c9)._m0[20].x, _195);
    int _205 = as_type<int>(_175) & 1;
    bool _207 = _205 != 0;
    int _209 = as_type<int>(_175) & 2;
    bool _211 = _209 != 0;
    float _213 = _203 * 6.283185482025146484375;
    int _215 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _217 = _215 != 0;
    float _219 = floor(_203);
    float _221 = _213 * 0.15915493667125701904296875;
    float _223 = _179 * _185;
    bool _225 = !_211;
    int _227 = _225 ? (-1090519040) : 1056964608;
    int _229 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _231 = _229 != 0;
    int _233 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _235 = _233 != 0;
    float _237 = _179 * _191;
    float _239 = _221 * 6.283185482025146484375;
    float _241 = cos(_239);
    float _243 = fma(_177, _183, _223);
    bool _245 = !_207;
    int _247 = _245 ? (-1090519040) : 1056964608;
    float _249 = _179 * _199;
    bool _251 = !_231;
    int _253 = _251 ? 0 : 1;
    float _255 = fma(_177, _189, _237);
    float _257 = -_219;
    float _259 = _203 + _257;
    float _261 = fma(_177, _197, _249);
    bool _263 = !_217;
    int _265 = _263 ? 0 : 1;
    out.m_76.x = as_type<float>(_247);
    out.m_76.y = as_type<float>(_227);
    int _267 = abs(_253);
    float _269 = -_259;
    float _271 = fma(_269, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _273 = abs(_265);
    float _275 = fma(_181, _187, _243);
    float _277 = fma(_181, _193, _255);
    bool _279 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _281 = fma(_241, 0.5, 0.5);
    float _283 = float(_267);
    float _285 = fma(_181, _201, _261);
    bool _287 = !_235;
    int _289 = _287 ? 0 : 1;
    bool _291 = _259 < 0.5;
    float _293 = float(_291);
    float _295 = abs(_271);
    float _297 = _283 * _295;
    int _299 = abs(_289);
    float _301 = -_281;
    float _303 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _305 = float(_273);
    float _307 = -_293;
    float _309 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _311 = float(_299);
    float _313 = fma(_305, _303, _297);
    float _315 = abs(_309);
    float _317 = fma(_311, _315, _313);
    bool _319 = !_279;
    float _321 = _275;
    float _337;
    if (!_319)
    {
        float _323 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _325 = _169 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _327 = fma(_325, (*spvDescriptorSet0.vp_c9)._m0[12].x, _149);
        float _329 = _327 * _323;
        float _331 = floor(_329);
        float _333 = -_331;
        float _335 = _329 + _333;
        _337 = _335;
        _339 = true;
    }
    else
    {
        float _341 = float(_115);
        float _343 = 1.0 / _341;
        float _345 = _149 * _343;
        _337 = _345;
    }
    _339 = false;
    float _347 = _337;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _351 = _347 + _349;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _355 = _347 + _353;
    bool _357 = _347 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _359 = isnan(_347);
    bool _361 = _357 || _359;
    bool _363 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _365 = _361 || _363;
    float _367 = float(_365);
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _371 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _369;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _375 = _373 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _377;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _383 = _347 + _381;
    float _385 = 1.0 / _371;
    bool _387 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _389 = 1.0 / _379;
    float _391 = 1.0 / _375;
    float _393 = _351 * _385;
    bool _395 = _347 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _397 = isnan(_347);
    bool _399 = _395 || _397;
    bool _401 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _403 = _399 || _401;
    float _405 = float(_403);
    float _407 = -_367;
    float _409 = _407 + 1.0;
    float _411 = _405 * _409;
    float _413 = _355 * _389;
    bool _415 = _347 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _417 = isnan(_347);
    bool _419 = _415 || _417;
    bool _421 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _423 = _419 || _421;
    float _425 = float(_423);
    float _427 = -_405;
    float _429 = _427 + 1.0;
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _433 = _431 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _435 = _383 * _391;
    bool _437 = _347 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _439 = isnan(_347);
    bool _441 = _437 || _439;
    bool _443 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _445 = _441 || _443;
    float _447 = float(_445);
    float _449 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _451 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _449;
    float _453 = _425 * _429;
    float _455 = -_425;
    float _457 = _455 + 1.0;
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _461 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _459;
    float _463 = fma(_451, _393, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _465 = _447 * _457;
    float _467 = fma(_461, _393, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _469 = -_447;
    float _471 = _469 + 1.0;
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _475 = _473 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _477 = _463 * _465;
    float _479 = _467 * _465;
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _483 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _481;
    float _485 = fma(_433, _435, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _487 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[143].x, _477);
    float _489 = fma(_475, _435, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _493 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _491;
    float _495 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[143].y, _479);
    float _497 = fma(_483, _413, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _499 = fma(_485, _453, _487);
    float _501 = fma(_493, _413, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _503 = fma(_489, _453, _495);
    float _505 = fma(_497, _411, _499);
    float _507 = fma(_501, _411, _503);
    float _509 = fma(_367, (*spvDescriptorSet0.vp_c9)._m0[146].x, _505);
    float _511 = fma(_367, (*spvDescriptorSet0.vp_c9)._m0[146].y, _507);
    bool _513 = !_387;
    float _529;
    if (!_513)
    {
        float _515 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _517 = _169 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _519 = fma(_517, (*spvDescriptorSet0.vp_c9)._m0[11].y, _149);
        float _521 = _519 * _515;
        float _523 = floor(_521);
        float _525 = -_523;
        float _527 = _521 + _525;
        _529 = _527;
        _531 = true;
    }
    else
    {
        float _533 = float(_115);
        float _535 = 1.0 / _533;
        float _537 = _149 * _535;
        _529 = _537;
    }
    _531 = false;
    float _539 = _529;
    float _541 = in.m_56.x;
    float _543 = in.m_56.y;
    float _545 = in.m_56.z;
    float _547 = in.m_72.w;
    float _549 = in.m_74.w;
    float _551 = _191 * _543;
    float _553 = _199 * _543;
    float _555 = fma(_189, _541, _551);
    float _557 = fma(_197, _541, _553);
    float _559 = fma(_193, _545, _555);
    float _561 = fma(_201, _545, _557);
    float _563 = _559 + _547;
    float _565 = _561 + _549;
    float _567 = fma(_563, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _569 = fma(_565, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _571 = floor(_567);
    float _573 = floor(_569);
    float _575 = -_571;
    float _577 = _567 + _575;
    float _579 = -_573;
    float _581 = _569 + _579;
    float2 _3289 = float2(_577, _581);
    float _583 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3289, float2(0.0), isnan(_3289)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3289, float2(0.0), isnan(_3289)), level(0.0)).x;
    float _585 = in.m_78.y;
    float _587 = in.m_80.x;
    float _589 = in.m_80.y;
    float _591 = _543 + _585;
    float _593 = _591 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _595 = _511 * _589;
    float _597 = _509 * _587;
    float _599 = fma(_563, (*spvDescriptorSet0.vp_c8)._m0[11].x, _593);
    float _601 = _595 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _603 = _597 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _605 = fma(_565, (*spvDescriptorSet0.vp_c8)._m0[11].z, _599);
    float _607 = _591 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _609 = _605 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _611 = fma(_563, (*spvDescriptorSet0.vp_c8)._m0[10].x, _607);
    float _613 = 1.0 / _609;
    float _615 = fma(_565, (*spvDescriptorSet0.vp_c8)._m0[10].z, _611);
    float _617 = _615 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _619 = _617 + _609;
    float _621 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, as_type<float>(_227));
    float _623 = _601 * _621;
    float _625 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _627 = _619 * _613;
    float _629 = _627 * 0.5;
    float _631 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _633 = fma(_629, (*spvDescriptorSet0.vp_c8)._m0[30].w, _631);
    float _635 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, as_type<float>(_247));
    float _637 = 1.0 / _633;
    float _639 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _641 = _603 * _635;
    float _643 = _623 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _645 = _591 + _639;
    float _647 = _623 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _649 = _645 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _651 = _645 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _653 = fma(_563, (*spvDescriptorSet0.vp_c15)._m0[126].x, _649);
    float _655 = fma(_563, (*spvDescriptorSet0.vp_c15)._m0[127].x, _651);
    float _657 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _659 = _637 * _657;
    float _661 = fma(_565, (*spvDescriptorSet0.vp_c15)._m0[126].z, _653);
    float _663 = fma(_565, (*spvDescriptorSet0.vp_c15)._m0[127].z, _655);
    float _665 = fma(_641, (*spvDescriptorSet0.vp_c8)._m0[24].x, _643);
    bool _667 = _659 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _669 = _661 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _671 = _659 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _673 = fma(_641, (*spvDescriptorSet0.vp_c8)._m0[26].x, _647);
    float _675 = _663 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _677 = trunc(_669);
    int _679 = int(_677);
    bool _681 = !_667;
    int _683 = _681 ? 0 : 1;
    float _685 = fma(_625, (*spvDescriptorSet0.vp_c8)._m0[26].z, _673);
    float _687 = fma(_625, (*spvDescriptorSet0.vp_c8)._m0[24].z, _665);
    float _689 = _685 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _691 = _687 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _693 = trunc(_675);
    int _695 = int(_693);
    int _697 = 2;
    int _699 = as_type<int>(_623);
    float _701 = _669;
    float _703 = _675;
    float _705 = _645;
    if (!_667)
    {
        _697 = 1;
    }
    int _707 = _697;
    float _709 = _565 + _689;
    int _711 = _707;
    float _713 = _709;
    if (!_671)
    {
        _711 = _683;
    }
    int _715 = _711;
    float _717 = _563 + _691;
    float _719 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _721 = _709 + _719;
    int _723 = _715 << 6;
    float _725 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _727 = _717 + _725;
    int _729 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _731 = _679 + _729;
    int _733 = _731 + 1;
    int _735 = _723 + 48;
    uint _738 = uint(int(uint(_735) >> uint(2)));
    uint _740 = uint(int(uint(int(_738)) >> uint(2)));
    int _742 = int(_738) & 3;
    float _744 = (*spvDescriptorSet0.vp_c15)._m0[int(_740)][_742];
    int _746 = int(_738) + 1;
    uint _748 = uint(int(uint(_746) >> uint(2)));
    int _750 = _746 & 3;
    float _752 = (*spvDescriptorSet0.vp_c15)._m0[int(_748)][_750];
    bool _754 = _733 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _756 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _758 = _695 + _756;
    int _760 = _758 + 1;
    float _762 = _721 * _721;
    int _764 = _723 + 56;
    uint _766 = uint(int(uint(_764) >> uint(2)));
    uint _768 = uint(int(uint(int(_766)) >> uint(2)));
    int _770 = int(_766) & 3;
    float _772 = (*spvDescriptorSet0.vp_c15)._m0[int(_768)][_770];
    int _774 = int(_766) + 1;
    uint _776 = uint(int(uint(_774) >> uint(2)));
    int _778 = _774 & 3;
    float _780 = (*spvDescriptorSet0.vp_c15)._m0[int(_776)][_778];
    int _782 = _733 | _760;
    float _784 = fma(_727, _727, _762);
    bool _786 = _782 < 0;
    bool _788 = _786 || _754;
    float _790 = sqrt(_784);
    float _792 = _623 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _794 = _723 + 64;
    uint _796 = uint(int(uint(_794) >> uint(2)));
    uint _798 = uint(int(uint(int(_796)) >> uint(2)));
    int _800 = int(_796) & 3;
    float _802 = (*spvDescriptorSet0.vp_c15)._m0[int(_798)][_800];
    int _804 = int(_796) + 1;
    uint _806 = uint(int(uint(_804) >> uint(2)));
    int _808 = _804 & 3;
    float _810 = (*spvDescriptorSet0.vp_c15)._m0[int(_806)][_808];
    bool _812 = _760 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _814 = _812 || _788;
    float _816 = fma(_641, (*spvDescriptorSet0.vp_c8)._m0[25].x, _792);
    float _818 = fma(_625, (*spvDescriptorSet0.vp_c8)._m0[25].z, _816);
    int _820 = _723 + 72;
    uint _822 = uint(int(uint(_820) >> uint(2)));
    uint _824 = uint(int(uint(int(_822)) >> uint(2)));
    int _826 = int(_822) & 3;
    float _828 = (*spvDescriptorSet0.vp_c15)._m0[int(_824)][_826];
    int _830 = int(_822) + 1;
    uint _832 = uint(int(uint(_830) >> uint(2)));
    int _834 = _830 & 3;
    float _836 = (*spvDescriptorSet0.vp_c15)._m0[int(_832)][_834];
    float _838 = _818 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _840 = _790 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _842 = as_type<int>(_792);
    int _844 = as_type<int>(_818);
    float _846 = as_type<float>(_733);
    float _848 = _790;
    float _850 = _717;
    float _852 = as_type<float>(_715);
    if (!_814)
    {
        int _854 = _760 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _856 = _854 + _733;
        _699 = _856;
    }
    int _858 = _699;
    int _860 = _723 + 96;
    uint _862 = uint(int(uint(_860) >> uint(2)));
    uint _864 = uint(int(uint(int(_862)) >> uint(2)));
    int _866 = int(_862) & 3;
    float _868 = (*spvDescriptorSet0.vp_c15)._m0[int(_864)][_866];
    int _870 = int(_862) + 1;
    uint _872 = uint(int(uint(_870) >> uint(2)));
    int _874 = _870 & 3;
    float _876 = (*spvDescriptorSet0.vp_c15)._m0[int(_872)][_874];
    float _878 = _591 + _838;
    if (!_814)
    {
        int _880 = _858 << 2;
        _842 = _880;
    }
    int _882 = _842;
    int _884 = _882;
    if (!_814)
    {
        uint _886 = uint(int(uint(_858) >> uint(2)));
        _844 = int(_886);
    }
    int _888 = _844;
    int _890 = _723 + 104;
    uint _892 = uint(int(uint(_890) >> uint(2)));
    uint _894 = uint(int(uint(int(_892)) >> uint(2)));
    int _896 = int(_892) & 3;
    float _898 = (*spvDescriptorSet0.vp_c15)._m0[int(_894)][_896];
    int _900 = int(_892) + 1;
    uint _902 = uint(int(uint(_900) >> uint(2)));
    int _904 = _900 & 3;
    float _906 = (*spvDescriptorSet0.vp_c15)._m0[int(_902)][_904];
    if (!_814)
    {
        int _908 = 12 & _882;
        _884 = _908;
    }
    int _910 = _884;
    if (!_840)
    {
        _846 = _878;
    }
    float _912 = _846;
    int _914 = 0;
    float _916 = _912;
    if (!_814)
    {
        int _918 = _888 << 4;
        int _920 = _918 + _910;
        _914 = _920;
    }
    int _922 = _914;
    bool _924 = !_840;
    float _926 = _876;
    float _928 = _802;
    if (!_924)
    {
        float _930 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _932 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _934 = _790 + _932;
        float _936 = rsqrt(_784);
        float _938 = _934 * _930;
        float _940 = _878 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _942 = _938 * 0.15915493667125701904296875;
        float _944 = _942 * 6.283185482025146484375;
        float _946 = cos(_944);
        float _948 = _942 * 6.283185482025146484375;
        float _950 = sin(_948);
        float _952 = _946 + (-1.0);
        float _954 = fma(_950, _940, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _956 = _952 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _958 = _936 * _954;
        float _960 = fma(_878, _946, _956);
        float _962 = fma(_727, _958, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _964 = fma(_721, _958, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _916 = _960;
        _848 = _952;
        _850 = _962;
        _713 = _964;
    }
    float _966 = _916;
    float _968 = _848;
    float _970 = _850;
    float _972 = _713;
    float _974 = -_591;
    float _976 = _974 + _966;
    float _978 = _968;
    float _980 = _970;
    float _982 = _966;
    float _984 = _972;
    if (!_814)
    {
        int _986 = _922 + 400;
        uint _988 = uint(int(uint(_986) >> uint(2)));
        uint _990 = uint(int(uint(int(_988)) >> uint(2)));
        int _992 = int(_988) & 3;
        float _994 = (*spvDescriptorSet0.vp_c15)._m0[int(_990)][_992];
        _978 = _994;
    }
    float _996 = _978;
    float _998 = -_563;
    float _1000 = _998 + _970;
    float _1002 = -_565;
    float _1004 = _1002 + _972;
    float _1006 = _976 * _976;
    float _1008 = _645 * _876;
    float _1010 = _645 * _810;
    if (!_814)
    {
        float _1012 = floor(_669);
        _926 = _1012;
    }
    float _1014 = _926;
    float _1016 = fma(_1000, _1000, _1006);
    int _1018 = _723 + 80;
    uint _1020 = uint(int(uint(_1018) >> uint(2)));
    uint _1022 = uint(int(uint(int(_1020)) >> uint(2)));
    int _1024 = int(_1020) & 3;
    float _1026 = (*spvDescriptorSet0.vp_c15)._m0[int(_1022)][_1024];
    int _1028 = int(_1020) + 1;
    uint _1030 = uint(int(uint(_1028) >> uint(2)));
    int _1032 = _1028 & 3;
    float _1034 = (*spvDescriptorSet0.vp_c15)._m0[int(_1030)][_1032];
    float _1036 = fma(_563, _868, _1008);
    float _1038 = fma(_563, _802, _1010);
    float _1040 = fma(_1004, _1004, _1016);
    float _1042 = fma(_565, _898, _1036);
    float _1044 = _645 * _752;
    float _1046 = sqrt(_1040);
    int _1048 = _723 + 88;
    uint _1050 = uint(int(uint(_1048) >> uint(2)));
    uint _1052 = uint(int(uint(int(_1050)) >> uint(2)));
    int _1054 = int(_1050) & 3;
    float _1056 = (*spvDescriptorSet0.vp_c15)._m0[int(_1052)][_1054];
    int _1058 = int(_1050) + 1;
    uint _1060 = uint(int(uint(_1058) >> uint(2)));
    int _1062 = _1058 & 3;
    float _1064 = (*spvDescriptorSet0.vp_c15)._m0[int(_1060)][_1062];
    float _1066 = _1042 + _906;
    float _1068 = fma(_563, _744, _1044);
    float _1070 = fma(_565, _828, _1038);
    bool _1072 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1074 = isnan(0.5);
    bool _1076 = _1072 || _1074;
    bool _1078 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1080 = _1076 || _1078;
    float _1082 = fma(_565, _772, _1068);
    float _1084 = _898;
    float _1086 = _1038;
    float _1088 = _1044;
    float _1090 = _1014;
    if (!_814)
    {
        float _1092 = floor(_675);
        _1084 = _1092;
    }
    float _1094 = _1084;
    float _1096 = _1070 + _836;
    float _1098 = _1082 + _780;
    bool _1100 = _1046 > 0.0;
    float _1102 = 1.0 / _1066;
    bool _1104 = !_1100;
    if (!_1104)
    {
        float _1106 = _275 * _275;
        float _1108 = rsqrt(_1040);
        float _1110 = fma(_277, _277, _1106);
        float _1112 = fma(_285, _285, _1110);
        float _1114 = sqrt(_1112);
        float _1116 = _1000 * _1108;
        float _1118 = _976 * _1108;
        float _1120 = _1004 * _1108;
        bool _1122 = _1114 > 0.0;
        bool _1124 = !_1122;
        _928 = _1112;
        if (!_1124)
        {
            float _1126 = rsqrt(_1112);
            float _1128 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1130 = _275 * _1126;
            float _1132 = _277 * _1126;
            float _1134 = _1118 * _1130;
            float _1136 = _285 * _1126;
            float _1138 = fma(_1116, _1132, _1134);
            float _1140 = _1128 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1142 = fma(_1120, _1136, _1138);
            float _1144 = _1142 * _1140;
            float _1146 = fma(_277, _1144, _970);
            float _1148 = fma(_275, _1144, _966);
            float _1150 = fma(_285, _1144, _972);
            _980 = _1146;
            _982 = _1148;
            _984 = _1150;
            _928 = _1126;
            _1086 = _1128;
            _1088 = _1140;
        }
    }
    float _1152 = _980;
    float _1154 = _982;
    float _1156 = _984;
    float _1158 = _928;
    float _1160 = _1086;
    float _1162 = _1088;
    float _1164 = _1158;
    float _1166 = _1160;
    float _1168 = _1162;
    if (_1080)
    {
        _321 = _1152;
    }
    float _1170 = _321;
    float _1172 = _1170;
    if (_1080)
    {
        _1164 = _1154;
    }
    float _1174 = _1164;
    float _1176 = _1174;
    if (_1080)
    {
        _1166 = _1156;
    }
    float _1178 = _1166;
    float _1180 = _1178;
    if (!_1080)
    {
        float _1182 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1184 = _591 + _1182;
        float _1186 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1188 = _563 + _1186;
        float _1190 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1192 = -_563;
        float _1194 = _1192 + _1152;
        float _1196 = _1184 * _1184;
        float _1198 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1200 = _565 + _1198;
        float _1202 = -_565;
        float _1204 = _1202 + _1156;
        float _1206 = fma(_1188, _1188, _1196);
        float _1208 = fma(_1200, _1200, _1206);
        float _1210 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1212 = _1190 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1214 = sqrt(_1208);
        float _1216 = precise::min(_1214, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1218 = _1216 * _1210;
        float _1220 = -_591;
        float _1222 = _1220 + _1154;
        float _1224 = _1212 * _1218;
        float _1226 = fma(_1222, _1224, _591);
        float _1228 = fma(_1194, _1224, _563);
        float _1230 = fma(_1204, _1224, _565);
        _1176 = _1226;
        _1172 = _1228;
        _1180 = _1230;
    }
    float _1232 = _1176;
    float _1234 = _1172;
    float _1236 = _1180;
    float _1238 = _1232 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1240 = _1098 * _1102;
    float _1242 = _1232 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1244 = _1232 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1246 = fma(_1234, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1238);
    float _1248 = _1096 * _1102;
    float _1250 = fma(_1234, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1242);
    float _1252 = fma(_1234, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1244);
    float _1254 = fma(_1236, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1246);
    bool _1256 = _1240 >= 0.0;
    float _1258 = fma(_1236, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1250);
    float _1260 = _1232 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1262 = fma(_1236, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1252);
    float _1264 = _1254 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _1266 = _1240 <= 1.0;
    bool _1268 = _1266 && _1256;
    if (!_814)
    {
        float _1270 = rint(_996);
        float _1272 = precise::max(_1270, 0.0);
        uint _1274 = uint(_1272);
        uint _1276 = clamp(_1274, 0u, 65535u);
        _1168 = as_type<float>(_1276);
    }
    float _1278 = _1168;
    float _1280 = fma(_1234, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1260);
    float _1282 = _1264 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1284 = _1248 >= 0.0;
    bool _1286 = _1284 && _1268;
    float _1288 = _1258 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1290 = fma(_1236, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1280);
    float _1292 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    bool _1294 = _1248 <= 1.0;
    bool _1296 = _1294 && _1286;
    float _1298 = _1288 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1300 = _1262 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1302 = _1290 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    if (!_814)
    {
        float _1304 = -_1014;
        float _1306 = _669 + _1304;
        _1090 = _1306;
    }
    float _1308 = _1090;
    float _1310 = -_1298;
    float _1312 = fma(_1310, _1292, 1.0);
    float _1314 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1282);
    float _1316 = _1264 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1318 = log2(_1312);
    float _1320 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1314);
    float _1322 = _645 * _1034;
    float _1324 = _1264 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1326 = _1312;
    if (_1296)
    {
        float _1328 = float(_715);
        _852 = _1328;
    }
    float _1330 = _852;
    float _1332 = fma(_1302, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1320);
    float _1334 = fma(_563, _1026, _1322);
    float _1336 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1324);
    float _1338 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1316);
    float _1340 = 1.0 / _1332;
    float _1342 = fma(_565, _1056, _1334);
    float _1344 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1336);
    float _1346 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1338);
    float _1348 = _1332;
    if (!_814)
    {
        float _1350 = -_1094;
        float _1352 = _675 + _1350;
        _1326 = _1352;
    }
    float _1354 = _1326;
    float _1356 = _1342 + _1064;
    float _1358 = fma(_1302, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1344);
    float _1360 = fma(_1302, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1346);
    float _1362 = _1334;
    float _1364 = _1358;
    if (_1296)
    {
        float _1366 = rint(_1330);
        float _1368 = precise::max(_1366, 0.0);
        uint _1370 = uint(_1368);
        uint _1372 = clamp(_1370, 0u, 65535u);
        _1362 = as_type<float>(_1372);
    }
    float _1374 = _1362;
    float _1376 = _1318 * 0.693147182464599609375;
    float _1378 = _1356 * _1102;
    float _1380 = _1354;
    float _1382 = _1378;
    if (!_814)
    {
        float3 _4617 = float3(_1308, _1354, float(as_type<int>(_1278)));
        float3 _4621 = select(_4617, float3(0.0), isnan(_4617));
        float _1384 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _4621.xy, uint(rint(_4621.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _4621.xy, uint(rint(_4621.z)), level(0.0)).x;
        _1380 = _1384;
    }
    float _1386 = _1380;
    float _1388 = _1376 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1390 = _1358 * _1340;
    float _1392 = _1360 * _1340;
    float _1394 = fma(_1390, 0.5, 0.5);
    float _1396 = fma(_1392, -0.5, 0.5);
    float _1398 = _1374;
    float _1400 = _1340;
    if (_1296)
    {
        float3 _4652 = float3(_1240, _1248, float(as_type<int>(_1374)));
        float3 _4654 = select(_4652, float3(0.0), isnan(_4652));
        float _1402 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _4654.xy, uint(rint(_4654.z)), _1378, level(0.0));
        _1398 = _1402;
    }
    float _1404 = _1398;
    float3 _4664 = float3(_1394, _1396, _1388);
    float _1406 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4664, float3(0.0), isnan(_4664)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4664, float3(0.0), isnan(_4664)), level(0.0)).x;
    float3 _4673 = float3(_1394, _1396, _1388);
    float4 _1409 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4673, float3(0.0), isnan(_4673)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4673, float3(0.0), isnan(_4673)), level(0.0)).xyzw;
    float _1411 = _1409.x;
    float _1413 = _1409.y;
    float _1415 = _1409.z;
    float _1417 = _1409.w;
    bool _1419 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1421 = isnan(0.5);
    bool _1423 = _1419 || _1421;
    bool _1425 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1427 = _1423 || _1425;
    if (_814)
    {
        _1400 = 1.0;
    }
    float _1429 = _1400;
    float _1431 = _1429;
    if (_1427)
    {
        _701 = 1.0;
    }
    float _1433 = _701;
    float _1435 = _1433;
    if (_1427)
    {
        _703 = 1.0;
    }
    float _1437 = _703;
    float _1439 = _1437;
    float _1441 = _1411;
    if (!_1427)
    {
        float _1443 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1445 = _1443 * 0.15915493667125701904296875;
        float _1447 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1449 = _1445 * 6.283185482025146484375;
        float _1451 = cos(_1449);
        float _1453 = _1447 * 0.15915493667125701904296875;
        float _1455 = _1445 * 6.283185482025146484375;
        float _1457 = sin(_1455);
        float _1459 = 1.0 / _1451;
        float _1461 = _1453 * 6.283185482025146484375;
        float _1463 = cos(_1461);
        float _1465 = _1457 * _1459;
        float _1467 = _1453 * 6.283185482025146484375;
        float _1469 = sin(_1467);
        float _1471 = _1463 * _1465;
        float _1473 = 1.0 / _1471;
        float _1475 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1477 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1475;
        float _1479 = 1.0 / _1477;
        float _1481 = _1469 * _1473;
        float _1483 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1485 = fma(_659, _1481, _1483);
        float _1487 = _1485 * _1479;
        float _1489 = precise::clamp(_1487, 0.0, 1.0);
        _1439 = _1489;
    }
    float _1491 = _1439;
    if (!_1427)
    {
        float _1493 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1495 = _1493 * 0.15915493667125701904296875;
        float _1497 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1499 = _1495 * 6.283185482025146484375;
        float _1501 = cos(_1499);
        float _1503 = _1497 * 0.15915493667125701904296875;
        float _1505 = _1495 * 6.283185482025146484375;
        float _1507 = sin(_1505);
        float _1509 = 1.0 / _1501;
        float _1511 = _1503 * 6.283185482025146484375;
        float _1513 = cos(_1511);
        float _1515 = _1507 * _1509;
        float _1517 = _1503 * 6.283185482025146484375;
        float _1519 = sin(_1517);
        float _1521 = _1513 * _1515;
        float _1523 = 1.0 / _1521;
        float _1525 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1527 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1525;
        float _1529 = 1.0 / _1527;
        float _1531 = _1519 * _1523;
        float _1533 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1535 = fma(_659, _1531, _1533);
        float _1537 = _1535 * _1529;
        float _1539 = precise::clamp(_1537, 0.0, 1.0);
        float _1541 = -_1539;
        float _1543 = _1541 + 1.0;
        _1435 = _1543;
    }
    float _1545 = _1435;
    if (!_814)
    {
        int _1547 = _858 << 4;
        int _1549 = _1547 + 2048;
        uint _1551 = uint(int(uint(_1549) >> uint(2)));
        uint _1553 = uint(int(uint(int(_1551)) >> uint(2)));
        int _1555 = int(_1551) & 3;
        float _1557 = (*spvDescriptorSet0.vp_c15)._m0[int(_1553)][_1555];
        int _1559 = int(_1551) + 1;
        uint _1561 = uint(int(uint(_1559) >> uint(2)));
        int _1563 = _1559 & 3;
        float _1565 = (*spvDescriptorSet0.vp_c15)._m0[int(_1561)][_1563];
        int _1567 = _1549 + 8;
        uint _1569 = uint(int(uint(_1567) >> uint(2)));
        uint _1571 = uint(int(uint(int(_1569)) >> uint(2)));
        int _1573 = int(_1569) & 3;
        float _1575 = (*spvDescriptorSet0.vp_c15)._m0[int(_1571)][_1573];
        int _1577 = int(_1569) + 1;
        uint _1579 = uint(int(uint(_1577) >> uint(2)));
        int _1581 = _1577 & 3;
        float _1583 = (*spvDescriptorSet0.vp_c15)._m0[int(_1579)][_1581];
        float _1585 = _645 * _1565;
        float _1587 = fma(_563, _1557, _1585);
        float _1589 = fma(_565, _1575, _1587);
        float _1591 = _1589 + _1583;
        float _1593 = precise::clamp(_1591, 0.0, 1.0);
        float _1595 = -_1593;
        float _1597 = _1595 + _1386;
        float _1599 = fma(_1597, 500.0, 1.5);
        float _1601 = exp2(_1599);
        float _1603 = 0.0 + _1601;
        float _1605 = precise::clamp(_1603, 0.0, 1.0);
        _705 = _1585;
        _1431 = _1605;
    }
    float _1607 = _705;
    float _1609 = _1431;
    float _1611 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1613 = _1232 + _1611;
    float _1615 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1617 = _1234 + _1615;
    float _1619 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1621 = _1236 + _1619;
    float _1623 = _1613 * _1613;
    float _1625 = fma(_1617, _1617, _1623);
    float _1627 = fma(_1621, _1621, _1625);
    float _1629 = rsqrt(_1627);
    float _1631 = _1629 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1633 = _1617 * _1631;
    float _1635 = _1621 * _1631;
    float _1637 = _1633 * _1633;
    float _1639 = _1635 * _1635;
    float _1641 = _1637 + _1639;
    float _1643 = sqrt(_1641);
    bool _1645 = _1643 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1647 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1649 = _1643 + _1647;
    float _1651 = _1625;
    float _1653 = _1649;
    float _1655 = _1607;
    float _1657 = _1613;
    float _1659 = _1631;
    if (_1645)
    {
        float _1661 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1651 = _1661;
    }
    float _1663 = _1651;
    float _1665 = _1663;
    if (_1645)
    {
        float _1667 = _1649 * _1663;
        _1653 = _1667;
    }
    float _1669 = _1653;
    if (_1645)
    {
        float _1671 = rsqrt(_1641);
        _1665 = _1671;
    }
    float _1673 = _1665;
    float _1675 = _1673;
    if (_1645)
    {
        float _1677 = _1669 * 0.15915493667125701904296875;
        _1655 = _1677;
    }
    float _1679 = _1655;
    float _1681 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1683 = _1629;
    float _1685 = _1679;
    if (_1645)
    {
        float _1687 = _1679 * 6.283185482025146484375;
        float _1689 = sin(_1687);
        _1683 = _1689;
    }
    float _1691 = _1683;
    float _1693 = precise::max(0.0, _1681);
    float _1695 = _1621;
    float _1697 = _1691;
    float _1699 = _1693;
    if (_1645)
    {
        float _1701 = _1679 * 6.283185482025146484375;
        float _1703 = cos(_1701);
        _1695 = _1703;
    }
    float _1705 = _1695;
    float _1707 = -_1631;
    float _1709 = -_1693;
    float _1711 = fma(_1613, _1707, _1709);
    if (_1645)
    {
        float _1713 = _1711 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1657 = _1713;
    }
    float _1715 = _1657;
    float _1717 = _1715;
    if (_1645)
    {
        float _1719 = fma(_1691, _1715, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1697 = _1719;
    }
    float _1721 = _1697;
    float _1723 = _1721;
    if (!_1645)
    {
        _1717 = _1711;
    }
    float _1725 = _1717;
    float _1727 = _1725;
    if (!_1645)
    {
        _1685 = _1637;
    }
    float _1729 = _1685;
    float _1731 = _1729;
    if (_1645)
    {
        float _1733 = _1673 * _1721;
        _1659 = _1733;
    }
    float _1735 = _1659;
    if (!_1645)
    {
        _1723 = _1633;
    }
    float _1737 = _1723;
    float _1739 = _1737;
    if (_1645)
    {
        float _1741 = _1705 + (-1.0);
        _1699 = _1741;
    }
    float _1743 = _1699;
    float _1745 = _1743;
    if (_1645)
    {
        float _1747 = _1633 * _1735;
        _1739 = _1747;
    }
    float _1749 = _1739;
    if (_1645)
    {
        float _1751 = _1743 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1675 = _1751;
    }
    float _1753 = _1675;
    float _1755 = _1753;
    if (!_1645)
    {
        _1745 = _1635;
    }
    float _1757 = _1745;
    float _1759 = _1757;
    if (_1645)
    {
        float _1761 = _1635 * _1735;
        _1759 = _1761;
    }
    float _1763 = _1759;
    if (_1645)
    {
        float _1765 = _1749 * _1749;
        _1731 = _1765;
    }
    float _1767 = _1731;
    if (_1645)
    {
        float _1769 = fma(_1711, _1705, _1753);
        _1727 = _1769;
    }
    float _1771 = _1727;
    if (!_1645)
    {
        _1755 = _1639;
    }
    float _1773 = _1755;
    float _1775 = _1773;
    if (_1645)
    {
        float _1777 = _1763 * _1763;
        _1775 = _1777;
    }
    float _1779 = _1775;
    float _1781 = sqrt(_1627);
    float _1783 = fma(_1771, _1771, _1767);
    float _1785 = _1783 + _1779;
    float _1787 = rsqrt(_1785);
    float _1789 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1791 = fma(_1781, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1789);
    float _1793 = precise::clamp(_1791, 0.0, 1.0);
    float _1795 = -_1793;
    float _1797 = _1795 + 1.0;
    float _1799 = abs(_1797);
    float _1801 = log2(_1799);
    float _1803 = _1787 * _1749;
    float _1805 = _1787 * _1771;
    float _1807 = _1787 * _1763;
    float _1809 = _1803 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1811 = -_1809;
    float _1813 = fma(_1805, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1811);
    float _1815 = -_1807;
    float _1817 = fma(_1815, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1813);
    float _1819 = _1801 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1821 = fma(_1817, -0.5, 0.5);
    float _1823 = fma(_1817, 0.5, 0.5);
    float _1825 = exp2(_1819);
    float _1827 = fma(_1823, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1829 = fma(_1823, _1827, -0.212114393711090087890625);
    float _1831 = _1805 + 1.0;
    float _1833 = sqrt(_1821);
    float _1835 = fma(_1823, _1829, 1.570728778839111328125);
    float _1837 = -_1805;
    float _1839 = fma(_1825, _1831, _1837);
    float _1841 = _1833 * 0.636619746685028076171875;
    float _1843 = -_1835;
    float _1845 = fma(_1841, _1843, 1.0);
    float _1847 = fma(_1839, 0.5, 0.5);
    float2 _5318 = float2(_1845, _1847);
    float3 _1851 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5318, float2(0.0), isnan(_5318)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5318, float2(0.0), isnan(_5318)), level(0.0)).xyz;
    float _1853 = _1851.x;
    float _1855 = _1851.y;
    float _1857 = _1851.z;
    float _1859 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1861 = _539 + _1859;
    float _1863 = _1264 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1865 = _539 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1867 = isnan(_539);
    bool _1869 = _1865 || _1867;
    bool _1871 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1873 = _1869 || _1871;
    float _1875 = float(_1873);
    float _1877 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1879 = _1877 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1881 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1883 = _1881 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1885 = _539 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1887 = isnan(_539);
    bool _1889 = _1885 || _1887;
    bool _1891 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1893 = _1889 || _1891;
    float _1895 = float(_1893);
    float _1897 = -_1875;
    float _1899 = _1897 + 1.0;
    bool _1901 = _539 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1903 = isnan(_539);
    bool _1905 = _1901 || _1903;
    bool _1907 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1909 = _1905 || _1907;
    float _1911 = float(_1909);
    float _1913 = 1.0 / _1879;
    float _1915 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1917 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1915;
    float _1919 = _1895 * _1899;
    float _1921 = -_1895;
    float _1923 = _1921 + 1.0;
    float _1925 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1863);
    float _1927 = -_583;
    float _1929 = _1927 + 1.0;
    float _1931 = _1911 * _1923;
    float _1933 = 1.0 / _1883;
    float _1935 = -_1911;
    float _1937 = _1935 + 1.0;
    float _1939 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1941 = _1939 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1943 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1925);
    bool _1945 = _1781 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1947 = isnan(_1781);
    bool _1949 = _1945 || _1947;
    bool _1951 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1953 = _1949 || _1951;
    float _1955 = _1917 * _1913;
    float _1957 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1959 = _1957 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1961 = 1.0 / _1941;
    float _1963 = fma(_1955, _1861, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1965 = _539 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1967 = isnan(_539);
    bool _1969 = _1965 || _1967;
    bool _1971 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1973 = _1969 || _1971;
    float _1975 = float(_1973);
    float _1977 = _1959 * _1933;
    float _1979 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1981 = _539 + _1979;
    float _1983 = _1963 * _1931;
    float _1985 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1987 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1985;
    float _1989 = -_1975;
    float _1991 = _1989 + 1.0;
    float _1993 = fma(_1977, _1981, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1995 = fma(_1937, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1983);
    float _1997 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1999 = _539 + _1997;
    float _2001 = _1875 * _1991;
    float _2003 = as_type<float>(_247) * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2005 = fma(_1993, _1919, _1995);
    float _2007 = _1987 * _1961;
    float _2009 = abs(_659);
    float _2011 = log2(_2009);
    float _2013 = as_type<float>(_227) * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2015 = fma(_2007, _1999, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _2017 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2019 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2021 = _2013 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2023 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2025 = fma(_2015, _2001, _2005);
    float _2027 = _2013 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2029 = _2013 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2031 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2033 = _2011 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2035 = _2017 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2037 = _2019 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2039 = _2023 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2041 = fma(_2003, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2021);
    float _2043 = fma(_1975, (*spvDescriptorSet0.vp_c9)._m0[118].x, _2025);
    float _2045 = exp2(_2033);
    float _2047 = fma(_1302, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1943);
    float _2049 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    out.m_82.x = _2035;
    out.m_82.y = _2037;
    out.m_82.z = _2039;
    out.m_82.w = _2031;
    float _2051 = fma(_2003, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2027);
    bool _2053 = _659 <= 8000.0;
    bool _2055 = isnan(_659);
    bool _2057 = _2053 || _2055;
    bool _2059 = isnan(8000.0);
    bool _2061 = _2057 || _2059;
    float _2063 = float(_2061);
    out.gl_Position.x = _1358;
    out.gl_Position.y = _1360;
    out.gl_Position.z = _2047;
    out.gl_Position.w = _1332;
    float _2065 = fma(_2003, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2029);
    float _2067 = fma(_2045, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2069 = precise::clamp(_2067, 0.0, 1.0);
    float _2071 = _2043 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2073 = _2049 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2075 = _1801 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2077 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2079 = _2047 + _1332;
    float _2081 = fma(_2069, -2.0, 3.0);
    float _2083 = _2069 * _2069;
    float _2085 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2087 = exp2(_2075);
    if (!_1296)
    {
        _1364 = 1.0;
    }
    float _2089 = _1364;
    float _2091 = _2083 * _2081;
    float _2093 = _2089;
    if (_1296)
    {
        bool _2095 = _1404 >= _1378;
        bool _2097 = isnan(_1404);
        bool _2099 = _2095 || _2097;
        bool _2101 = isnan(_1378);
        bool _2103 = _2099 || _2101;
        float _2105 = float(_2103);
        _2093 = _2105;
    }
    float _2107 = _2093;
    float _2109 = _2077 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2111 = _2085 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2113 = -_2091;
    float _2115 = _2113 + 1.0;
    float _2117 = _2107 * _1609;
    float _2119 = _2079 * 0.5;
    float _2121 = fma(_2115, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2091);
    out.m_84.x = _2073;
    out.m_84.y = _2109;
    out.m_84.z = _2111;
    out.m_84.w = _2071;
    float _2123 = _1491 * _1545;
    if (!_1953)
    {
        _1382 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2125 = _1382;
    float _2127 = _2063 * _2121;
    out.m_86.z = _2119;
    out.m_86.w = _1332;
    float _2129 = -_2087;
    float _2131 = _2129 + 1.0;
    float _2133 = _2123 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2135 = _2127 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2137 = _2127;
    float _2139 = _2125;
    float _2141 = _2125;
    if (!_1953)
    {
        _2137 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2143 = _2137;
    float _2145 = _2131 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2147 = _317 * _2133;
    float _2149 = _1929 * _2135;
    float _2151 = precise::clamp(_2149, 0.0, 1.0);
    float _2153 = _2041 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _2155 = _2145 * _1406;
    float _2157 = -_2145;
    float _2159 = _2157 + 1.0;
    float _2161 = -_2151;
    float _2163 = fma(_2161, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2165 = _2151;
    float _2167 = _2163;
    float _2169 = _2143;
    float _2171 = _2143;
    if (!_1953)
    {
        _2165 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2173 = _2165;
    float _2175 = _1417 * _2155;
    float _2177 = _1417 * _2159;
    float _2179 = -_2117;
    float _2181 = fma(_2179, _2163, 1.0);
    float _2183 = precise::clamp(_2181, 0.0, 1.0);
    float _2185 = _2065 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _2187 = _2173;
    float _2189 = _2173;
    if (!_1953)
    {
        _2167 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2191 = _2167;
    float _2193 = _2191;
    float _2195 = _2191;
    if (!_1953)
    {
        _1348 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2197 = _1348;
    float _2199 = _1857 * _2155;
    float _2201 = fma(_1853, _2175, _1411);
    float _2203 = fma(_1855, _2175, _1413);
    float _2205 = _2183 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2207 = fma(_1417, _2199, _1415);
    float _2209 = _2051 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _2211 = _2197;
    float _2213 = _2197;
    if (!_1953)
    {
        _1441 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2215 = _1441;
    out.m_88.x = _2205;
    out.m_90.x = _2201;
    out.m_90.y = _2203;
    out.m_90.z = _2207;
    out.m_90.w = _2177;
    out.m_92.x = _2209;
    out.m_92.y = _2153;
    out.m_92.z = _2185;
    bool _2217 = !_1953;
    float _2219 = _2215;
    float _2221 = _2215;
    if (!_2217)
    {
        bool _2223 = _1781 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2225 = isnan(_1781);
        bool _2227 = _2223 || _2225;
        bool _2229 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2231 = _2227 || _2229;
        if (!_2231)
        {
            float _2233 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2235 = _1781 + _2233;
            float _2237 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2239 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2237;
            float _2241 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2243 = _2241 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2245 = 1.0 / _2239;
            float _2247 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2249 = _2247 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2251 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2253 = _2251 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2255 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2257 = _2255 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2259 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2261 = _2259 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2263 = _2235 * _2245;
            float _2265 = precise::clamp(_2263, 0.0, 1.0);
            float _2267 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2269 = _2267 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2271 = fma(_2265, _2243, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2273 = fma(_2265, _2269, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2275 = fma(_2265, _2249, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2277 = fma(_2265, _2253, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2279 = fma(_2265, _2257, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2281 = fma(_2265, _2261, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2221 = _2275;
            _2141 = _2279;
            _2195 = _2271;
            _2189 = _2277;
            _2171 = _2273;
            _2213 = _2281;
            _2283 = true;
        }
        else
        {
            bool _2285 = _1781 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2287 = isnan(_1781);
            bool _2289 = _2285 || _2287;
            bool _2291 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2293 = _2289 || _2291;
            if (!_2293)
            {
                _2193 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2295 = _2193;
            _2195 = _2295;
            if (!_2293)
            {
                _2219 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2297 = _2219;
            _2221 = _2297;
            if (!_2293)
            {
                _2169 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2299 = _2169;
            _2171 = _2299;
            if (!_2293)
            {
                _2187 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2301 = _2187;
            _2189 = _2301;
            if (!_2293)
            {
                _2139 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2303 = _2139;
            _2141 = _2303;
            if (!_2293)
            {
                _2211 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2305 = _2211;
            bool _2307 = !_2293;
            _2213 = _2305;
            if (!_2307)
            {
                bool _2309 = _1781 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2311 = isnan(_1781);
                bool _2313 = _2309 || _2311;
                bool _2315 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2317 = _2313 || _2315;
                if (!_2317)
                {
                    float _2319 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2321 = _1781 + _2319;
                    float _2323 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2325 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2323;
                    float _2327 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2329 = _2327 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2331 = 1.0 / _2325;
                    float _2333 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2335 = _2333 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2337 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2339 = _2337 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2341 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2343 = _2341 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2345 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2347 = _2345 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2349 = _2321 * _2331;
                    float _2351 = precise::clamp(_2349, 0.0, 1.0);
                    float _2353 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2355 = _2353 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2357 = fma(_2351, _2329, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2359 = fma(_2351, _2355, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2361 = fma(_2351, _2335, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2363 = fma(_2351, _2339, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2365 = fma(_2351, _2343, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2367 = fma(_2351, _2347, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2221 = _2361;
                    _2141 = _2365;
                    _2195 = _2357;
                    _2189 = _2363;
                    _2171 = _2359;
                    _2213 = _2367;
                    _2283 = true;
                }
                else
                {
                    _2221 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2141 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2195 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2189 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2171 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2213 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2283 = false;
    float _2369 = _2221;
    float _2371 = _2141;
    float _2373 = _2195;
    float _2375 = _2189;
    float _2377 = _2171;
    float _2379 = _2213;
    float _2381 = fma(_2153, -0.5, 0.5);
    float _2383 = precise::clamp(_2381, 0.0, 1.0);
    float _2385 = -_2369;
    float _2387 = _2385 + _2371;
    float _2389 = _2147 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2391 = -_2373;
    float _2393 = _2391 + _2375;
    float _2395 = fma(_2383, _2387, _2369);
    out.m_94.x = 0.0;
    float _2397 = -_2377;
    float _2399 = _2397 + _2379;
    float _2401 = fma(_2383, _2393, _2373);
    float _2403 = _2395 * 0.586610972881317138671875;
    out.m_59.x = _2389;
    bool _2405 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2407 = fma(_2383, _2399, _2377);
    float _2409 = fma(_2401, 0.298911988735198974609375, _2403);
    bool _2411 = _1491 > 0.0;
    bool _2413 = isnan(_1491);
    bool _2415 = _2411 || _2413;
    bool _2417 = isnan(0.0);
    bool _2419 = _2415 || _2417;
    float _2421 = fma(_2407, 0.114477999508380889892578125, _2409);
    bool _2423 = _1545 <= 0.0;
    bool _2425 = !_2419;
    bool _2427 = _2423 || _2425;
    float _2429 = -_2421;
    float _2431 = _2401 + _2429;
    float _2433 = -_2421;
    float _2435 = _2395 + _2433;
    float _2437 = -_2421;
    float _2439 = _2407 + _2437;
    float _2441 = fma(_2431, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2421);
    float _2443 = fma(_2435, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2421);
    float _2445 = fma(_2439, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2421);
    bool _2447 = !_2405;
    if (!_2447)
    {
        float _2449 = -_1232;
        float _2451 = _2449 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2453 = -_1234;
        float _2455 = _2453 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2457 = -_1236;
        float _2459 = _2457 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2461 = _2451 * _2451;
        float _2463 = fma(_2455, _2455, _2461);
        float _2465 = fma(_2459, _2459, _2463);
        float _2467 = sqrt(_2465);
        float _2469 = rsqrt(_2465);
        float _2471 = -_2467;
        float _2473 = _2471 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2475 = _2473 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2477 = precise::clamp(_2475, 0.0, 1.0);
        float _2479 = _2455 * _2469;
        float _2481 = _2451 * _2469;
        float _2483 = abs(_2477);
        float _2485 = log2(_2483);
        float _2487 = _2459 * _2469;
        float _2489 = _2479 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2491 = _2153 * _2481;
        float _2493 = -_2481;
        float _2495 = -_2489;
        float _2497 = fma(_2493, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2495);
        float _2499 = fma(_2209, _2479, _2491);
        float _2501 = -_2487;
        float _2503 = fma(_2501, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2497);
        float _2505 = fma(_2185, _2487, _2499);
        float _2507 = precise::clamp(_2505, 0.0, 1.0);
        float _2509 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2511 = _2503 + _2509;
        float _2513 = _2485 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2515 = _2511 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2517 = precise::clamp(_2515, 0.0, 1.0);
        float _2519 = exp2(_2513);
        float _2521 = _2519 * _2517;
        float _2523 = _2507 * _2521;
        float _2525 = _2523 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2527 = _2523 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2529 = _2523 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_94.x = _2525;
        out.m_94.y = _2527;
        out.m_94.z = _2529;
    }
    out.m_96.x = _2441;
    out.m_96.y = _2443;
    out.m_96.z = _2445;
    if (!_2427)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_59.x = 0.0;
    float _2531 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2531;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2283 = false;
    bool _531 = false;
    bool _339 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _110 = in.m_56.w;
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
        out.m_59.x = 0.0;
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
        float _2588 = as_type<float>(_131);
        out.gl_Position.z = _2588;
    }
    if (!_119)
    {
        return out;
    }
    float _135 = in.m_61.w;
    bool _137 = _135 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _139 = isnan(_135);
    bool _141 = _137 || _139;
    bool _143 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _145 = _141 || _143;
    float _147 = -_135;
    float _149 = _147 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _151 = 0.0;
    if (_145)
    {
        float _153 = float(_115);
        _151 = _153;
    }
    float _155 = _151;
    bool _157 = _149 >= _155;
    bool _159 = !_145;
    bool _161 = _157 || _159;
    if (_161)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _163 = _125;
    if (_161)
    {
        out.m_59.x = 0.0;
    }
    if (_161)
    {
        float _165 = _163 * 5.0;
        _133 = as_type<int>(_165);
    }
    int _167 = _133;
    if (_161)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2656 = as_type<float>(_167);
        out.gl_Position.z = _2656;
    }
    if (_161)
    {
        return out;
    }
    float _169 = in.m_63.x;
    float _171 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _173 = _149 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _175 = as_type<float>(int(gl_VertexIndex));
    float _177 = in.m_68.x;
    float _179 = in.m_68.y;
    float _181 = in.m_68.z;
    float _183 = in.m_70.x;
    float _185 = in.m_70.y;
    float _187 = in.m_70.z;
    float _189 = in.m_72.x;
    float _191 = in.m_72.y;
    float _193 = in.m_72.z;
    float _195 = _173 * _171;
    float _197 = in.m_74.x;
    float _199 = in.m_74.y;
    float _201 = in.m_74.z;
    float _203 = fma(_169, (*spvDescriptorSet0.vp_c9)._m0[20].x, _195);
    int _205 = as_type<int>(_175) & 1;
    bool _207 = _205 != 0;
    int _209 = as_type<int>(_175) & 2;
    bool _211 = _209 != 0;
    float _213 = _203 * 6.283185482025146484375;
    int _215 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _217 = _215 != 0;
    float _219 = floor(_203);
    float _221 = _213 * 0.15915493667125701904296875;
    float _223 = _179 * _185;
    bool _225 = !_211;
    int _227 = _225 ? (-1090519040) : 1056964608;
    int _229 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _231 = _229 != 0;
    int _233 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _235 = _233 != 0;
    float _237 = _179 * _191;
    float _239 = _221 * 6.283185482025146484375;
    float _241 = cos(_239);
    float _243 = fma(_177, _183, _223);
    bool _245 = !_207;
    int _247 = _245 ? (-1090519040) : 1056964608;
    float _249 = _179 * _199;
    bool _251 = !_231;
    int _253 = _251 ? 0 : 1;
    float _255 = fma(_177, _189, _237);
    float _257 = -_219;
    float _259 = _203 + _257;
    float _261 = fma(_177, _197, _249);
    bool _263 = !_217;
    int _265 = _263 ? 0 : 1;
    out.m_76.x = as_type<float>(_247);
    out.m_76.y = as_type<float>(_227);
    int _267 = abs(_253);
    float _269 = -_259;
    float _271 = fma(_269, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _273 = abs(_265);
    float _275 = fma(_181, _187, _243);
    float _277 = fma(_181, _193, _255);
    bool _279 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _281 = fma(_241, 0.5, 0.5);
    float _283 = float(_267);
    float _285 = fma(_181, _201, _261);
    bool _287 = !_235;
    int _289 = _287 ? 0 : 1;
    bool _291 = _259 < 0.5;
    float _293 = float(_291);
    float _295 = abs(_271);
    float _297 = _283 * _295;
    int _299 = abs(_289);
    float _301 = -_281;
    float _303 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _305 = float(_273);
    float _307 = -_293;
    float _309 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _311 = float(_299);
    float _313 = fma(_305, _303, _297);
    float _315 = abs(_309);
    float _317 = fma(_311, _315, _313);
    bool _319 = !_279;
    float _321 = _275;
    float _337;
    if (!_319)
    {
        float _323 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _325 = _169 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _327 = fma(_325, (*spvDescriptorSet0.vp_c9)._m0[12].x, _149);
        float _329 = _327 * _323;
        float _331 = floor(_329);
        float _333 = -_331;
        float _335 = _329 + _333;
        _337 = _335;
        _339 = true;
    }
    else
    {
        float _341 = float(_115);
        float _343 = 1.0 / _341;
        float _345 = _149 * _343;
        _337 = _345;
    }
    _339 = false;
    float _347 = _337;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _351 = _347 + _349;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _355 = _347 + _353;
    bool _357 = _347 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _359 = isnan(_347);
    bool _361 = _357 || _359;
    bool _363 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _365 = _361 || _363;
    float _367 = float(_365);
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _371 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _369;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _375 = _373 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _377;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _383 = _347 + _381;
    float _385 = 1.0 / _371;
    bool _387 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _389 = 1.0 / _379;
    float _391 = 1.0 / _375;
    float _393 = _351 * _385;
    bool _395 = _347 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _397 = isnan(_347);
    bool _399 = _395 || _397;
    bool _401 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _403 = _399 || _401;
    float _405 = float(_403);
    float _407 = -_367;
    float _409 = _407 + 1.0;
    float _411 = _405 * _409;
    float _413 = _355 * _389;
    bool _415 = _347 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _417 = isnan(_347);
    bool _419 = _415 || _417;
    bool _421 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _423 = _419 || _421;
    float _425 = float(_423);
    float _427 = -_405;
    float _429 = _427 + 1.0;
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _433 = _431 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _435 = _383 * _391;
    bool _437 = _347 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _439 = isnan(_347);
    bool _441 = _437 || _439;
    bool _443 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _445 = _441 || _443;
    float _447 = float(_445);
    float _449 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _451 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _449;
    float _453 = _425 * _429;
    float _455 = -_425;
    float _457 = _455 + 1.0;
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _461 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _459;
    float _463 = fma(_451, _393, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _465 = _447 * _457;
    float _467 = fma(_461, _393, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _469 = -_447;
    float _471 = _469 + 1.0;
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _475 = _473 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _477 = _463 * _465;
    float _479 = _467 * _465;
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _483 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _481;
    float _485 = fma(_433, _435, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _487 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[143].x, _477);
    float _489 = fma(_475, _435, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _493 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _491;
    float _495 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[143].y, _479);
    float _497 = fma(_483, _413, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _499 = fma(_485, _453, _487);
    float _501 = fma(_493, _413, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _503 = fma(_489, _453, _495);
    float _505 = fma(_497, _411, _499);
    float _507 = fma(_501, _411, _503);
    float _509 = fma(_367, (*spvDescriptorSet0.vp_c9)._m0[146].x, _505);
    float _511 = fma(_367, (*spvDescriptorSet0.vp_c9)._m0[146].y, _507);
    bool _513 = !_387;
    float _529;
    if (!_513)
    {
        float _515 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _517 = _169 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _519 = fma(_517, (*spvDescriptorSet0.vp_c9)._m0[11].y, _149);
        float _521 = _519 * _515;
        float _523 = floor(_521);
        float _525 = -_523;
        float _527 = _521 + _525;
        _529 = _527;
        _531 = true;
    }
    else
    {
        float _533 = float(_115);
        float _535 = 1.0 / _533;
        float _537 = _149 * _535;
        _529 = _537;
    }
    _531 = false;
    float _539 = _529;
    float _541 = in.m_56.x;
    float _543 = in.m_56.y;
    float _545 = in.m_56.z;
    float _547 = in.m_72.w;
    float _549 = in.m_74.w;
    float _551 = _191 * _543;
    float _553 = _199 * _543;
    float _555 = fma(_189, _541, _551);
    float _557 = fma(_197, _541, _553);
    float _559 = fma(_193, _545, _555);
    float _561 = fma(_201, _545, _557);
    float _563 = _559 + _547;
    float _565 = _561 + _549;
    float _567 = fma(_563, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _569 = fma(_565, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _571 = floor(_567);
    float _573 = floor(_569);
    float _575 = -_571;
    float _577 = _567 + _575;
    float _579 = -_573;
    float _581 = _569 + _579;
    float2 _3289 = float2(_577, _581);
    float _583 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3289, float2(0.0), isnan(_3289)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3289, float2(0.0), isnan(_3289)), level(0.0)).x;
    float _585 = in.m_78.y;
    float _587 = in.m_80.x;
    float _589 = in.m_80.y;
    float _591 = _543 + _585;
    float _593 = _591 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _595 = _511 * _589;
    float _597 = _509 * _587;
    float _599 = fma(_563, (*spvDescriptorSet0.vp_c8)._m0[11].x, _593);
    float _601 = _595 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _603 = _597 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _605 = fma(_565, (*spvDescriptorSet0.vp_c8)._m0[11].z, _599);
    float _607 = _591 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _609 = _605 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _611 = fma(_563, (*spvDescriptorSet0.vp_c8)._m0[10].x, _607);
    float _613 = 1.0 / _609;
    float _615 = fma(_565, (*spvDescriptorSet0.vp_c8)._m0[10].z, _611);
    float _617 = _615 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _619 = _617 + _609;
    float _621 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, as_type<float>(_227));
    float _623 = _601 * _621;
    float _625 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _627 = _619 * _613;
    float _629 = _627 * 0.5;
    float _631 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _633 = fma(_629, (*spvDescriptorSet0.vp_c8)._m0[30].w, _631);
    float _635 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, as_type<float>(_247));
    float _637 = 1.0 / _633;
    float _639 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _641 = _603 * _635;
    float _643 = _623 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _645 = _591 + _639;
    float _647 = _623 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _649 = _645 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _651 = _645 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _653 = fma(_563, (*spvDescriptorSet0.vp_c15)._m0[126].x, _649);
    float _655 = fma(_563, (*spvDescriptorSet0.vp_c15)._m0[127].x, _651);
    float _657 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _659 = _637 * _657;
    float _661 = fma(_565, (*spvDescriptorSet0.vp_c15)._m0[126].z, _653);
    float _663 = fma(_565, (*spvDescriptorSet0.vp_c15)._m0[127].z, _655);
    float _665 = fma(_641, (*spvDescriptorSet0.vp_c8)._m0[24].x, _643);
    bool _667 = _659 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _669 = _661 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _671 = _659 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _673 = fma(_641, (*spvDescriptorSet0.vp_c8)._m0[26].x, _647);
    float _675 = _663 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _677 = trunc(_669);
    int _679 = int(_677);
    bool _681 = !_667;
    int _683 = _681 ? 0 : 1;
    float _685 = fma(_625, (*spvDescriptorSet0.vp_c8)._m0[26].z, _673);
    float _687 = fma(_625, (*spvDescriptorSet0.vp_c8)._m0[24].z, _665);
    float _689 = _685 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _691 = _687 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _693 = trunc(_675);
    int _695 = int(_693);
    int _697 = 2;
    int _699 = as_type<int>(_623);
    float _701 = _669;
    float _703 = _675;
    float _705 = _645;
    if (!_667)
    {
        _697 = 1;
    }
    int _707 = _697;
    float _709 = _565 + _689;
    int _711 = _707;
    float _713 = _709;
    if (!_671)
    {
        _711 = _683;
    }
    int _715 = _711;
    float _717 = _563 + _691;
    float _719 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _721 = _709 + _719;
    int _723 = _715 << 6;
    float _725 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _727 = _717 + _725;
    int _729 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _731 = _679 + _729;
    int _733 = _731 + 1;
    int _735 = _723 + 48;
    uint _738 = uint(int(uint(_735) >> uint(2)));
    uint _740 = uint(int(uint(int(_738)) >> uint(2)));
    int _742 = int(_738) & 3;
    float _744 = (*spvDescriptorSet0.vp_c15)._m0[int(_740)][_742];
    int _746 = int(_738) + 1;
    uint _748 = uint(int(uint(_746) >> uint(2)));
    int _750 = _746 & 3;
    float _752 = (*spvDescriptorSet0.vp_c15)._m0[int(_748)][_750];
    bool _754 = _733 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _756 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _758 = _695 + _756;
    int _760 = _758 + 1;
    float _762 = _721 * _721;
    int _764 = _723 + 56;
    uint _766 = uint(int(uint(_764) >> uint(2)));
    uint _768 = uint(int(uint(int(_766)) >> uint(2)));
    int _770 = int(_766) & 3;
    float _772 = (*spvDescriptorSet0.vp_c15)._m0[int(_768)][_770];
    int _774 = int(_766) + 1;
    uint _776 = uint(int(uint(_774) >> uint(2)));
    int _778 = _774 & 3;
    float _780 = (*spvDescriptorSet0.vp_c15)._m0[int(_776)][_778];
    int _782 = _733 | _760;
    float _784 = fma(_727, _727, _762);
    bool _786 = _782 < 0;
    bool _788 = _786 || _754;
    float _790 = sqrt(_784);
    float _792 = _623 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _794 = _723 + 64;
    uint _796 = uint(int(uint(_794) >> uint(2)));
    uint _798 = uint(int(uint(int(_796)) >> uint(2)));
    int _800 = int(_796) & 3;
    float _802 = (*spvDescriptorSet0.vp_c15)._m0[int(_798)][_800];
    int _804 = int(_796) + 1;
    uint _806 = uint(int(uint(_804) >> uint(2)));
    int _808 = _804 & 3;
    float _810 = (*spvDescriptorSet0.vp_c15)._m0[int(_806)][_808];
    bool _812 = _760 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _814 = _812 || _788;
    float _816 = fma(_641, (*spvDescriptorSet0.vp_c8)._m0[25].x, _792);
    float _818 = fma(_625, (*spvDescriptorSet0.vp_c8)._m0[25].z, _816);
    int _820 = _723 + 72;
    uint _822 = uint(int(uint(_820) >> uint(2)));
    uint _824 = uint(int(uint(int(_822)) >> uint(2)));
    int _826 = int(_822) & 3;
    float _828 = (*spvDescriptorSet0.vp_c15)._m0[int(_824)][_826];
    int _830 = int(_822) + 1;
    uint _832 = uint(int(uint(_830) >> uint(2)));
    int _834 = _830 & 3;
    float _836 = (*spvDescriptorSet0.vp_c15)._m0[int(_832)][_834];
    float _838 = _818 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _840 = _790 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _842 = as_type<int>(_792);
    int _844 = as_type<int>(_818);
    float _846 = as_type<float>(_733);
    float _848 = _790;
    float _850 = _717;
    float _852 = as_type<float>(_715);
    if (!_814)
    {
        int _854 = _760 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _856 = _854 + _733;
        _699 = _856;
    }
    int _858 = _699;
    int _860 = _723 + 96;
    uint _862 = uint(int(uint(_860) >> uint(2)));
    uint _864 = uint(int(uint(int(_862)) >> uint(2)));
    int _866 = int(_862) & 3;
    float _868 = (*spvDescriptorSet0.vp_c15)._m0[int(_864)][_866];
    int _870 = int(_862) + 1;
    uint _872 = uint(int(uint(_870) >> uint(2)));
    int _874 = _870 & 3;
    float _876 = (*spvDescriptorSet0.vp_c15)._m0[int(_872)][_874];
    float _878 = _591 + _838;
    if (!_814)
    {
        int _880 = _858 << 2;
        _842 = _880;
    }
    int _882 = _842;
    int _884 = _882;
    if (!_814)
    {
        uint _886 = uint(int(uint(_858) >> uint(2)));
        _844 = int(_886);
    }
    int _888 = _844;
    int _890 = _723 + 104;
    uint _892 = uint(int(uint(_890) >> uint(2)));
    uint _894 = uint(int(uint(int(_892)) >> uint(2)));
    int _896 = int(_892) & 3;
    float _898 = (*spvDescriptorSet0.vp_c15)._m0[int(_894)][_896];
    int _900 = int(_892) + 1;
    uint _902 = uint(int(uint(_900) >> uint(2)));
    int _904 = _900 & 3;
    float _906 = (*spvDescriptorSet0.vp_c15)._m0[int(_902)][_904];
    if (!_814)
    {
        int _908 = 12 & _882;
        _884 = _908;
    }
    int _910 = _884;
    if (!_840)
    {
        _846 = _878;
    }
    float _912 = _846;
    int _914 = 0;
    float _916 = _912;
    if (!_814)
    {
        int _918 = _888 << 4;
        int _920 = _918 + _910;
        _914 = _920;
    }
    int _922 = _914;
    bool _924 = !_840;
    float _926 = _876;
    float _928 = _802;
    if (!_924)
    {
        float _930 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _932 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _934 = _790 + _932;
        float _936 = rsqrt(_784);
        float _938 = _934 * _930;
        float _940 = _878 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _942 = _938 * 0.15915493667125701904296875;
        float _944 = _942 * 6.283185482025146484375;
        float _946 = cos(_944);
        float _948 = _942 * 6.283185482025146484375;
        float _950 = sin(_948);
        float _952 = _946 + (-1.0);
        float _954 = fma(_950, _940, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _956 = _952 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _958 = _936 * _954;
        float _960 = fma(_878, _946, _956);
        float _962 = fma(_727, _958, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _964 = fma(_721, _958, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _916 = _960;
        _848 = _952;
        _850 = _962;
        _713 = _964;
    }
    float _966 = _916;
    float _968 = _848;
    float _970 = _850;
    float _972 = _713;
    float _974 = -_591;
    float _976 = _974 + _966;
    float _978 = _968;
    float _980 = _970;
    float _982 = _966;
    float _984 = _972;
    if (!_814)
    {
        int _986 = _922 + 400;
        uint _988 = uint(int(uint(_986) >> uint(2)));
        uint _990 = uint(int(uint(int(_988)) >> uint(2)));
        int _992 = int(_988) & 3;
        float _994 = (*spvDescriptorSet0.vp_c15)._m0[int(_990)][_992];
        _978 = _994;
    }
    float _996 = _978;
    float _998 = -_563;
    float _1000 = _998 + _970;
    float _1002 = -_565;
    float _1004 = _1002 + _972;
    float _1006 = _976 * _976;
    float _1008 = _645 * _876;
    float _1010 = _645 * _810;
    if (!_814)
    {
        float _1012 = floor(_669);
        _926 = _1012;
    }
    float _1014 = _926;
    float _1016 = fma(_1000, _1000, _1006);
    int _1018 = _723 + 80;
    uint _1020 = uint(int(uint(_1018) >> uint(2)));
    uint _1022 = uint(int(uint(int(_1020)) >> uint(2)));
    int _1024 = int(_1020) & 3;
    float _1026 = (*spvDescriptorSet0.vp_c15)._m0[int(_1022)][_1024];
    int _1028 = int(_1020) + 1;
    uint _1030 = uint(int(uint(_1028) >> uint(2)));
    int _1032 = _1028 & 3;
    float _1034 = (*spvDescriptorSet0.vp_c15)._m0[int(_1030)][_1032];
    float _1036 = fma(_563, _868, _1008);
    float _1038 = fma(_563, _802, _1010);
    float _1040 = fma(_1004, _1004, _1016);
    float _1042 = fma(_565, _898, _1036);
    float _1044 = _645 * _752;
    float _1046 = sqrt(_1040);
    int _1048 = _723 + 88;
    uint _1050 = uint(int(uint(_1048) >> uint(2)));
    uint _1052 = uint(int(uint(int(_1050)) >> uint(2)));
    int _1054 = int(_1050) & 3;
    float _1056 = (*spvDescriptorSet0.vp_c15)._m0[int(_1052)][_1054];
    int _1058 = int(_1050) + 1;
    uint _1060 = uint(int(uint(_1058) >> uint(2)));
    int _1062 = _1058 & 3;
    float _1064 = (*spvDescriptorSet0.vp_c15)._m0[int(_1060)][_1062];
    float _1066 = _1042 + _906;
    float _1068 = fma(_563, _744, _1044);
    float _1070 = fma(_565, _828, _1038);
    bool _1072 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1074 = isnan(0.5);
    bool _1076 = _1072 || _1074;
    bool _1078 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1080 = _1076 || _1078;
    float _1082 = fma(_565, _772, _1068);
    float _1084 = _898;
    float _1086 = _1038;
    float _1088 = _1044;
    float _1090 = _1014;
    if (!_814)
    {
        float _1092 = floor(_675);
        _1084 = _1092;
    }
    float _1094 = _1084;
    float _1096 = _1070 + _836;
    float _1098 = _1082 + _780;
    bool _1100 = _1046 > 0.0;
    float _1102 = 1.0 / _1066;
    bool _1104 = !_1100;
    if (!_1104)
    {
        float _1106 = _275 * _275;
        float _1108 = rsqrt(_1040);
        float _1110 = fma(_277, _277, _1106);
        float _1112 = fma(_285, _285, _1110);
        float _1114 = sqrt(_1112);
        float _1116 = _1000 * _1108;
        float _1118 = _976 * _1108;
        float _1120 = _1004 * _1108;
        bool _1122 = _1114 > 0.0;
        bool _1124 = !_1122;
        _928 = _1112;
        if (!_1124)
        {
            float _1126 = rsqrt(_1112);
            float _1128 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1130 = _275 * _1126;
            float _1132 = _277 * _1126;
            float _1134 = _1118 * _1130;
            float _1136 = _285 * _1126;
            float _1138 = fma(_1116, _1132, _1134);
            float _1140 = _1128 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1142 = fma(_1120, _1136, _1138);
            float _1144 = _1142 * _1140;
            float _1146 = fma(_277, _1144, _970);
            float _1148 = fma(_275, _1144, _966);
            float _1150 = fma(_285, _1144, _972);
            _980 = _1146;
            _982 = _1148;
            _984 = _1150;
            _928 = _1126;
            _1086 = _1128;
            _1088 = _1140;
        }
    }
    float _1152 = _980;
    float _1154 = _982;
    float _1156 = _984;
    float _1158 = _928;
    float _1160 = _1086;
    float _1162 = _1088;
    float _1164 = _1158;
    float _1166 = _1160;
    float _1168 = _1162;
    if (_1080)
    {
        _321 = _1152;
    }
    float _1170 = _321;
    float _1172 = _1170;
    if (_1080)
    {
        _1164 = _1154;
    }
    float _1174 = _1164;
    float _1176 = _1174;
    if (_1080)
    {
        _1166 = _1156;
    }
    float _1178 = _1166;
    float _1180 = _1178;
    if (!_1080)
    {
        float _1182 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1184 = _591 + _1182;
        float _1186 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1188 = _563 + _1186;
        float _1190 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1192 = -_563;
        float _1194 = _1192 + _1152;
        float _1196 = _1184 * _1184;
        float _1198 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1200 = _565 + _1198;
        float _1202 = -_565;
        float _1204 = _1202 + _1156;
        float _1206 = fma(_1188, _1188, _1196);
        float _1208 = fma(_1200, _1200, _1206);
        float _1210 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1212 = _1190 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1214 = sqrt(_1208);
        float _1216 = precise::min(_1214, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1218 = _1216 * _1210;
        float _1220 = -_591;
        float _1222 = _1220 + _1154;
        float _1224 = _1212 * _1218;
        float _1226 = fma(_1222, _1224, _591);
        float _1228 = fma(_1194, _1224, _563);
        float _1230 = fma(_1204, _1224, _565);
        _1176 = _1226;
        _1172 = _1228;
        _1180 = _1230;
    }
    float _1232 = _1176;
    float _1234 = _1172;
    float _1236 = _1180;
    float _1238 = _1232 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1240 = _1098 * _1102;
    float _1242 = _1232 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1244 = _1232 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1246 = fma(_1234, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1238);
    float _1248 = _1096 * _1102;
    float _1250 = fma(_1234, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1242);
    float _1252 = fma(_1234, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1244);
    float _1254 = fma(_1236, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1246);
    bool _1256 = _1240 >= 0.0;
    float _1258 = fma(_1236, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1250);
    float _1260 = _1232 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1262 = fma(_1236, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1252);
    float _1264 = _1254 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _1266 = _1240 <= 1.0;
    bool _1268 = _1266 && _1256;
    if (!_814)
    {
        float _1270 = rint(_996);
        float _1272 = precise::max(_1270, 0.0);
        uint _1274 = uint(_1272);
        uint _1276 = clamp(_1274, 0u, 65535u);
        _1168 = as_type<float>(_1276);
    }
    float _1278 = _1168;
    float _1280 = fma(_1234, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1260);
    float _1282 = _1264 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1284 = _1248 >= 0.0;
    bool _1286 = _1284 && _1268;
    float _1288 = _1258 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1290 = fma(_1236, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1280);
    float _1292 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    bool _1294 = _1248 <= 1.0;
    bool _1296 = _1294 && _1286;
    float _1298 = _1288 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1300 = _1262 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1302 = _1290 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    if (!_814)
    {
        float _1304 = -_1014;
        float _1306 = _669 + _1304;
        _1090 = _1306;
    }
    float _1308 = _1090;
    float _1310 = -_1298;
    float _1312 = fma(_1310, _1292, 1.0);
    float _1314 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1282);
    float _1316 = _1264 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1318 = log2(_1312);
    float _1320 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1314);
    float _1322 = _645 * _1034;
    float _1324 = _1264 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1326 = _1312;
    if (_1296)
    {
        float _1328 = float(_715);
        _852 = _1328;
    }
    float _1330 = _852;
    float _1332 = fma(_1302, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1320);
    float _1334 = fma(_563, _1026, _1322);
    float _1336 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1324);
    float _1338 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1316);
    float _1340 = 1.0 / _1332;
    float _1342 = fma(_565, _1056, _1334);
    float _1344 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1336);
    float _1346 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1338);
    float _1348 = _1332;
    if (!_814)
    {
        float _1350 = -_1094;
        float _1352 = _675 + _1350;
        _1326 = _1352;
    }
    float _1354 = _1326;
    float _1356 = _1342 + _1064;
    float _1358 = fma(_1302, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1344);
    float _1360 = fma(_1302, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1346);
    float _1362 = _1334;
    float _1364 = _1358;
    if (_1296)
    {
        float _1366 = rint(_1330);
        float _1368 = precise::max(_1366, 0.0);
        uint _1370 = uint(_1368);
        uint _1372 = clamp(_1370, 0u, 65535u);
        _1362 = as_type<float>(_1372);
    }
    float _1374 = _1362;
    float _1376 = _1318 * 0.693147182464599609375;
    float _1378 = _1356 * _1102;
    float _1380 = _1354;
    float _1382 = _1378;
    if (!_814)
    {
        float3 _4617 = float3(_1308, _1354, float(as_type<int>(_1278)));
        float3 _4621 = select(_4617, float3(0.0), isnan(_4617));
        float _1384 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _4621.xy, uint(rint(_4621.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _4621.xy, uint(rint(_4621.z)), level(0.0)).x;
        _1380 = _1384;
    }
    float _1386 = _1380;
    float _1388 = _1376 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1390 = _1358 * _1340;
    float _1392 = _1360 * _1340;
    float _1394 = fma(_1390, 0.5, 0.5);
    float _1396 = fma(_1392, -0.5, 0.5);
    float _1398 = _1374;
    float _1400 = _1340;
    if (_1296)
    {
        float3 _4652 = float3(_1240, _1248, float(as_type<int>(_1374)));
        float3 _4654 = select(_4652, float3(0.0), isnan(_4652));
        float _1402 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _4654.xy, uint(rint(_4654.z)), _1378, level(0.0));
        _1398 = _1402;
    }
    float _1404 = _1398;
    float3 _4664 = float3(_1394, _1396, _1388);
    float _1406 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4664, float3(0.0), isnan(_4664)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4664, float3(0.0), isnan(_4664)), level(0.0)).x;
    float3 _4673 = float3(_1394, _1396, _1388);
    float4 _1409 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4673, float3(0.0), isnan(_4673)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4673, float3(0.0), isnan(_4673)), level(0.0)).xyzw;
    float _1411 = _1409.x;
    float _1413 = _1409.y;
    float _1415 = _1409.z;
    float _1417 = _1409.w;
    bool _1419 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1421 = isnan(0.5);
    bool _1423 = _1419 || _1421;
    bool _1425 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1427 = _1423 || _1425;
    if (_814)
    {
        _1400 = 1.0;
    }
    float _1429 = _1400;
    float _1431 = _1429;
    if (_1427)
    {
        _701 = 1.0;
    }
    float _1433 = _701;
    float _1435 = _1433;
    if (_1427)
    {
        _703 = 1.0;
    }
    float _1437 = _703;
    float _1439 = _1437;
    float _1441 = _1411;
    if (!_1427)
    {
        float _1443 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1445 = _1443 * 0.15915493667125701904296875;
        float _1447 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1449 = _1445 * 6.283185482025146484375;
        float _1451 = cos(_1449);
        float _1453 = _1447 * 0.15915493667125701904296875;
        float _1455 = _1445 * 6.283185482025146484375;
        float _1457 = sin(_1455);
        float _1459 = 1.0 / _1451;
        float _1461 = _1453 * 6.283185482025146484375;
        float _1463 = cos(_1461);
        float _1465 = _1457 * _1459;
        float _1467 = _1453 * 6.283185482025146484375;
        float _1469 = sin(_1467);
        float _1471 = _1463 * _1465;
        float _1473 = 1.0 / _1471;
        float _1475 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1477 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1475;
        float _1479 = 1.0 / _1477;
        float _1481 = _1469 * _1473;
        float _1483 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1485 = fma(_659, _1481, _1483);
        float _1487 = _1485 * _1479;
        float _1489 = precise::clamp(_1487, 0.0, 1.0);
        _1439 = _1489;
    }
    float _1491 = _1439;
    if (!_1427)
    {
        float _1493 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1495 = _1493 * 0.15915493667125701904296875;
        float _1497 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1499 = _1495 * 6.283185482025146484375;
        float _1501 = cos(_1499);
        float _1503 = _1497 * 0.15915493667125701904296875;
        float _1505 = _1495 * 6.283185482025146484375;
        float _1507 = sin(_1505);
        float _1509 = 1.0 / _1501;
        float _1511 = _1503 * 6.283185482025146484375;
        float _1513 = cos(_1511);
        float _1515 = _1507 * _1509;
        float _1517 = _1503 * 6.283185482025146484375;
        float _1519 = sin(_1517);
        float _1521 = _1513 * _1515;
        float _1523 = 1.0 / _1521;
        float _1525 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1527 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1525;
        float _1529 = 1.0 / _1527;
        float _1531 = _1519 * _1523;
        float _1533 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1535 = fma(_659, _1531, _1533);
        float _1537 = _1535 * _1529;
        float _1539 = precise::clamp(_1537, 0.0, 1.0);
        float _1541 = -_1539;
        float _1543 = _1541 + 1.0;
        _1435 = _1543;
    }
    float _1545 = _1435;
    if (!_814)
    {
        int _1547 = _858 << 4;
        int _1549 = _1547 + 2048;
        uint _1551 = uint(int(uint(_1549) >> uint(2)));
        uint _1553 = uint(int(uint(int(_1551)) >> uint(2)));
        int _1555 = int(_1551) & 3;
        float _1557 = (*spvDescriptorSet0.vp_c15)._m0[int(_1553)][_1555];
        int _1559 = int(_1551) + 1;
        uint _1561 = uint(int(uint(_1559) >> uint(2)));
        int _1563 = _1559 & 3;
        float _1565 = (*spvDescriptorSet0.vp_c15)._m0[int(_1561)][_1563];
        int _1567 = _1549 + 8;
        uint _1569 = uint(int(uint(_1567) >> uint(2)));
        uint _1571 = uint(int(uint(int(_1569)) >> uint(2)));
        int _1573 = int(_1569) & 3;
        float _1575 = (*spvDescriptorSet0.vp_c15)._m0[int(_1571)][_1573];
        int _1577 = int(_1569) + 1;
        uint _1579 = uint(int(uint(_1577) >> uint(2)));
        int _1581 = _1577 & 3;
        float _1583 = (*spvDescriptorSet0.vp_c15)._m0[int(_1579)][_1581];
        float _1585 = _645 * _1565;
        float _1587 = fma(_563, _1557, _1585);
        float _1589 = fma(_565, _1575, _1587);
        float _1591 = _1589 + _1583;
        float _1593 = precise::clamp(_1591, 0.0, 1.0);
        float _1595 = -_1593;
        float _1597 = _1595 + _1386;
        float _1599 = fma(_1597, 500.0, 1.5);
        float _1601 = exp2(_1599);
        float _1603 = 0.0 + _1601;
        float _1605 = precise::clamp(_1603, 0.0, 1.0);
        _705 = _1585;
        _1431 = _1605;
    }
    float _1607 = _705;
    float _1609 = _1431;
    float _1611 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1613 = _1232 + _1611;
    float _1615 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1617 = _1234 + _1615;
    float _1619 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1621 = _1236 + _1619;
    float _1623 = _1613 * _1613;
    float _1625 = fma(_1617, _1617, _1623);
    float _1627 = fma(_1621, _1621, _1625);
    float _1629 = rsqrt(_1627);
    float _1631 = _1629 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1633 = _1617 * _1631;
    float _1635 = _1621 * _1631;
    float _1637 = _1633 * _1633;
    float _1639 = _1635 * _1635;
    float _1641 = _1637 + _1639;
    float _1643 = sqrt(_1641);
    bool _1645 = _1643 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1647 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1649 = _1643 + _1647;
    float _1651 = _1625;
    float _1653 = _1649;
    float _1655 = _1607;
    float _1657 = _1613;
    float _1659 = _1631;
    if (_1645)
    {
        float _1661 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1651 = _1661;
    }
    float _1663 = _1651;
    float _1665 = _1663;
    if (_1645)
    {
        float _1667 = _1649 * _1663;
        _1653 = _1667;
    }
    float _1669 = _1653;
    if (_1645)
    {
        float _1671 = rsqrt(_1641);
        _1665 = _1671;
    }
    float _1673 = _1665;
    float _1675 = _1673;
    if (_1645)
    {
        float _1677 = _1669 * 0.15915493667125701904296875;
        _1655 = _1677;
    }
    float _1679 = _1655;
    float _1681 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1683 = _1629;
    float _1685 = _1679;
    if (_1645)
    {
        float _1687 = _1679 * 6.283185482025146484375;
        float _1689 = sin(_1687);
        _1683 = _1689;
    }
    float _1691 = _1683;
    float _1693 = precise::max(0.0, _1681);
    float _1695 = _1621;
    float _1697 = _1691;
    float _1699 = _1693;
    if (_1645)
    {
        float _1701 = _1679 * 6.283185482025146484375;
        float _1703 = cos(_1701);
        _1695 = _1703;
    }
    float _1705 = _1695;
    float _1707 = -_1631;
    float _1709 = -_1693;
    float _1711 = fma(_1613, _1707, _1709);
    if (_1645)
    {
        float _1713 = _1711 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1657 = _1713;
    }
    float _1715 = _1657;
    float _1717 = _1715;
    if (_1645)
    {
        float _1719 = fma(_1691, _1715, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1697 = _1719;
    }
    float _1721 = _1697;
    float _1723 = _1721;
    if (!_1645)
    {
        _1717 = _1711;
    }
    float _1725 = _1717;
    float _1727 = _1725;
    if (!_1645)
    {
        _1685 = _1637;
    }
    float _1729 = _1685;
    float _1731 = _1729;
    if (_1645)
    {
        float _1733 = _1673 * _1721;
        _1659 = _1733;
    }
    float _1735 = _1659;
    if (!_1645)
    {
        _1723 = _1633;
    }
    float _1737 = _1723;
    float _1739 = _1737;
    if (_1645)
    {
        float _1741 = _1705 + (-1.0);
        _1699 = _1741;
    }
    float _1743 = _1699;
    float _1745 = _1743;
    if (_1645)
    {
        float _1747 = _1633 * _1735;
        _1739 = _1747;
    }
    float _1749 = _1739;
    if (_1645)
    {
        float _1751 = _1743 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1675 = _1751;
    }
    float _1753 = _1675;
    float _1755 = _1753;
    if (!_1645)
    {
        _1745 = _1635;
    }
    float _1757 = _1745;
    float _1759 = _1757;
    if (_1645)
    {
        float _1761 = _1635 * _1735;
        _1759 = _1761;
    }
    float _1763 = _1759;
    if (_1645)
    {
        float _1765 = _1749 * _1749;
        _1731 = _1765;
    }
    float _1767 = _1731;
    if (_1645)
    {
        float _1769 = fma(_1711, _1705, _1753);
        _1727 = _1769;
    }
    float _1771 = _1727;
    if (!_1645)
    {
        _1755 = _1639;
    }
    float _1773 = _1755;
    float _1775 = _1773;
    if (_1645)
    {
        float _1777 = _1763 * _1763;
        _1775 = _1777;
    }
    float _1779 = _1775;
    float _1781 = sqrt(_1627);
    float _1783 = fma(_1771, _1771, _1767);
    float _1785 = _1783 + _1779;
    float _1787 = rsqrt(_1785);
    float _1789 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1791 = fma(_1781, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1789);
    float _1793 = precise::clamp(_1791, 0.0, 1.0);
    float _1795 = -_1793;
    float _1797 = _1795 + 1.0;
    float _1799 = abs(_1797);
    float _1801 = log2(_1799);
    float _1803 = _1787 * _1749;
    float _1805 = _1787 * _1771;
    float _1807 = _1787 * _1763;
    float _1809 = _1803 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1811 = -_1809;
    float _1813 = fma(_1805, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1811);
    float _1815 = -_1807;
    float _1817 = fma(_1815, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1813);
    float _1819 = _1801 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1821 = fma(_1817, -0.5, 0.5);
    float _1823 = fma(_1817, 0.5, 0.5);
    float _1825 = exp2(_1819);
    float _1827 = fma(_1823, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1829 = fma(_1823, _1827, -0.212114393711090087890625);
    float _1831 = _1805 + 1.0;
    float _1833 = sqrt(_1821);
    float _1835 = fma(_1823, _1829, 1.570728778839111328125);
    float _1837 = -_1805;
    float _1839 = fma(_1825, _1831, _1837);
    float _1841 = _1833 * 0.636619746685028076171875;
    float _1843 = -_1835;
    float _1845 = fma(_1841, _1843, 1.0);
    float _1847 = fma(_1839, 0.5, 0.5);
    float2 _5318 = float2(_1845, _1847);
    float3 _1851 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5318, float2(0.0), isnan(_5318)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5318, float2(0.0), isnan(_5318)), level(0.0)).xyz;
    float _1853 = _1851.x;
    float _1855 = _1851.y;
    float _1857 = _1851.z;
    float _1859 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1861 = _539 + _1859;
    float _1863 = _1264 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1865 = _539 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1867 = isnan(_539);
    bool _1869 = _1865 || _1867;
    bool _1871 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1873 = _1869 || _1871;
    float _1875 = float(_1873);
    float _1877 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1879 = _1877 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1881 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1883 = _1881 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1885 = _539 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1887 = isnan(_539);
    bool _1889 = _1885 || _1887;
    bool _1891 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1893 = _1889 || _1891;
    float _1895 = float(_1893);
    float _1897 = -_1875;
    float _1899 = _1897 + 1.0;
    bool _1901 = _539 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1903 = isnan(_539);
    bool _1905 = _1901 || _1903;
    bool _1907 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1909 = _1905 || _1907;
    float _1911 = float(_1909);
    float _1913 = 1.0 / _1879;
    float _1915 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1917 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1915;
    float _1919 = _1895 * _1899;
    float _1921 = -_1895;
    float _1923 = _1921 + 1.0;
    float _1925 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1863);
    float _1927 = -_583;
    float _1929 = _1927 + 1.0;
    float _1931 = _1911 * _1923;
    float _1933 = 1.0 / _1883;
    float _1935 = -_1911;
    float _1937 = _1935 + 1.0;
    float _1939 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1941 = _1939 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1943 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1925);
    bool _1945 = _1781 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1947 = isnan(_1781);
    bool _1949 = _1945 || _1947;
    bool _1951 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1953 = _1949 || _1951;
    float _1955 = _1917 * _1913;
    float _1957 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1959 = _1957 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1961 = 1.0 / _1941;
    float _1963 = fma(_1955, _1861, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1965 = _539 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1967 = isnan(_539);
    bool _1969 = _1965 || _1967;
    bool _1971 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1973 = _1969 || _1971;
    float _1975 = float(_1973);
    float _1977 = _1959 * _1933;
    float _1979 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1981 = _539 + _1979;
    float _1983 = _1963 * _1931;
    float _1985 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1987 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1985;
    float _1989 = -_1975;
    float _1991 = _1989 + 1.0;
    float _1993 = fma(_1977, _1981, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1995 = fma(_1937, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1983);
    float _1997 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1999 = _539 + _1997;
    float _2001 = _1875 * _1991;
    float _2003 = as_type<float>(_247) * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2005 = fma(_1993, _1919, _1995);
    float _2007 = _1987 * _1961;
    float _2009 = abs(_659);
    float _2011 = log2(_2009);
    float _2013 = as_type<float>(_227) * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2015 = fma(_2007, _1999, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _2017 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2019 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2021 = _2013 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2023 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2025 = fma(_2015, _2001, _2005);
    float _2027 = _2013 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2029 = _2013 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2031 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2033 = _2011 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2035 = _2017 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2037 = _2019 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2039 = _2023 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2041 = fma(_2003, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2021);
    float _2043 = fma(_1975, (*spvDescriptorSet0.vp_c9)._m0[118].x, _2025);
    float _2045 = exp2(_2033);
    float _2047 = fma(_1302, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1943);
    float _2049 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    out.m_82.x = _2035;
    out.m_82.y = _2037;
    out.m_82.z = _2039;
    out.m_82.w = _2031;
    float _2051 = fma(_2003, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2027);
    bool _2053 = _659 <= 8000.0;
    bool _2055 = isnan(_659);
    bool _2057 = _2053 || _2055;
    bool _2059 = isnan(8000.0);
    bool _2061 = _2057 || _2059;
    float _2063 = float(_2061);
    out.gl_Position.x = _1358;
    out.gl_Position.y = _1360;
    out.gl_Position.z = _2047;
    out.gl_Position.w = _1332;
    float _2065 = fma(_2003, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2029);
    float _2067 = fma(_2045, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2069 = precise::clamp(_2067, 0.0, 1.0);
    float _2071 = _2043 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2073 = _2049 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2075 = _1801 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2077 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2079 = _2047 + _1332;
    float _2081 = fma(_2069, -2.0, 3.0);
    float _2083 = _2069 * _2069;
    float _2085 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2087 = exp2(_2075);
    if (!_1296)
    {
        _1364 = 1.0;
    }
    float _2089 = _1364;
    float _2091 = _2083 * _2081;
    float _2093 = _2089;
    if (_1296)
    {
        bool _2095 = _1404 >= _1378;
        bool _2097 = isnan(_1404);
        bool _2099 = _2095 || _2097;
        bool _2101 = isnan(_1378);
        bool _2103 = _2099 || _2101;
        float _2105 = float(_2103);
        _2093 = _2105;
    }
    float _2107 = _2093;
    float _2109 = _2077 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2111 = _2085 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2113 = -_2091;
    float _2115 = _2113 + 1.0;
    float _2117 = _2107 * _1609;
    float _2119 = _2079 * 0.5;
    float _2121 = fma(_2115, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2091);
    out.m_84.x = _2073;
    out.m_84.y = _2109;
    out.m_84.z = _2111;
    out.m_84.w = _2071;
    float _2123 = _1491 * _1545;
    if (!_1953)
    {
        _1382 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2125 = _1382;
    float _2127 = _2063 * _2121;
    out.m_86.z = _2119;
    out.m_86.w = _1332;
    float _2129 = -_2087;
    float _2131 = _2129 + 1.0;
    float _2133 = _2123 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2135 = _2127 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2137 = _2127;
    float _2139 = _2125;
    float _2141 = _2125;
    if (!_1953)
    {
        _2137 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2143 = _2137;
    float _2145 = _2131 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2147 = _317 * _2133;
    float _2149 = _1929 * _2135;
    float _2151 = precise::clamp(_2149, 0.0, 1.0);
    float _2153 = _2041 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _2155 = _2145 * _1406;
    float _2157 = -_2145;
    float _2159 = _2157 + 1.0;
    float _2161 = -_2151;
    float _2163 = fma(_2161, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2165 = _2151;
    float _2167 = _2163;
    float _2169 = _2143;
    float _2171 = _2143;
    if (!_1953)
    {
        _2165 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2173 = _2165;
    float _2175 = _1417 * _2155;
    float _2177 = _1417 * _2159;
    float _2179 = -_2117;
    float _2181 = fma(_2179, _2163, 1.0);
    float _2183 = precise::clamp(_2181, 0.0, 1.0);
    float _2185 = _2065 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _2187 = _2173;
    float _2189 = _2173;
    if (!_1953)
    {
        _2167 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2191 = _2167;
    float _2193 = _2191;
    float _2195 = _2191;
    if (!_1953)
    {
        _1348 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2197 = _1348;
    float _2199 = _1857 * _2155;
    float _2201 = fma(_1853, _2175, _1411);
    float _2203 = fma(_1855, _2175, _1413);
    float _2205 = _2183 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2207 = fma(_1417, _2199, _1415);
    float _2209 = _2051 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _2211 = _2197;
    float _2213 = _2197;
    if (!_1953)
    {
        _1441 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2215 = _1441;
    out.m_88.x = _2205;
    out.m_90.x = _2201;
    out.m_90.y = _2203;
    out.m_90.z = _2207;
    out.m_90.w = _2177;
    out.m_92.x = _2209;
    out.m_92.y = _2153;
    out.m_92.z = _2185;
    bool _2217 = !_1953;
    float _2219 = _2215;
    float _2221 = _2215;
    if (!_2217)
    {
        bool _2223 = _1781 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2225 = isnan(_1781);
        bool _2227 = _2223 || _2225;
        bool _2229 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2231 = _2227 || _2229;
        if (!_2231)
        {
            float _2233 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2235 = _1781 + _2233;
            float _2237 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2239 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2237;
            float _2241 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2243 = _2241 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2245 = 1.0 / _2239;
            float _2247 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2249 = _2247 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2251 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2253 = _2251 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2255 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2257 = _2255 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2259 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2261 = _2259 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2263 = _2235 * _2245;
            float _2265 = precise::clamp(_2263, 0.0, 1.0);
            float _2267 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2269 = _2267 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2271 = fma(_2265, _2243, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2273 = fma(_2265, _2269, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2275 = fma(_2265, _2249, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2277 = fma(_2265, _2253, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2279 = fma(_2265, _2257, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2281 = fma(_2265, _2261, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2221 = _2275;
            _2141 = _2279;
            _2195 = _2271;
            _2189 = _2277;
            _2171 = _2273;
            _2213 = _2281;
            _2283 = true;
        }
        else
        {
            bool _2285 = _1781 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2287 = isnan(_1781);
            bool _2289 = _2285 || _2287;
            bool _2291 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2293 = _2289 || _2291;
            if (!_2293)
            {
                _2193 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2295 = _2193;
            _2195 = _2295;
            if (!_2293)
            {
                _2219 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2297 = _2219;
            _2221 = _2297;
            if (!_2293)
            {
                _2169 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2299 = _2169;
            _2171 = _2299;
            if (!_2293)
            {
                _2187 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2301 = _2187;
            _2189 = _2301;
            if (!_2293)
            {
                _2139 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2303 = _2139;
            _2141 = _2303;
            if (!_2293)
            {
                _2211 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2305 = _2211;
            bool _2307 = !_2293;
            _2213 = _2305;
            if (!_2307)
            {
                bool _2309 = _1781 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2311 = isnan(_1781);
                bool _2313 = _2309 || _2311;
                bool _2315 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2317 = _2313 || _2315;
                if (!_2317)
                {
                    float _2319 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2321 = _1781 + _2319;
                    float _2323 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2325 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2323;
                    float _2327 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2329 = _2327 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2331 = 1.0 / _2325;
                    float _2333 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2335 = _2333 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2337 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2339 = _2337 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2341 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2343 = _2341 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2345 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2347 = _2345 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2349 = _2321 * _2331;
                    float _2351 = precise::clamp(_2349, 0.0, 1.0);
                    float _2353 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2355 = _2353 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2357 = fma(_2351, _2329, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2359 = fma(_2351, _2355, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2361 = fma(_2351, _2335, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2363 = fma(_2351, _2339, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2365 = fma(_2351, _2343, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2367 = fma(_2351, _2347, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2221 = _2361;
                    _2141 = _2365;
                    _2195 = _2357;
                    _2189 = _2363;
                    _2171 = _2359;
                    _2213 = _2367;
                    _2283 = true;
                }
                else
                {
                    _2221 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2141 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2195 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2189 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2171 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2213 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2283 = false;
    float _2369 = _2221;
    float _2371 = _2141;
    float _2373 = _2195;
    float _2375 = _2189;
    float _2377 = _2171;
    float _2379 = _2213;
    float _2381 = fma(_2153, -0.5, 0.5);
    float _2383 = precise::clamp(_2381, 0.0, 1.0);
    float _2385 = -_2369;
    float _2387 = _2385 + _2371;
    float _2389 = _2147 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2391 = -_2373;
    float _2393 = _2391 + _2375;
    float _2395 = fma(_2383, _2387, _2369);
    out.m_94.x = 0.0;
    float _2397 = -_2377;
    float _2399 = _2397 + _2379;
    float _2401 = fma(_2383, _2393, _2373);
    float _2403 = _2395 * 0.586610972881317138671875;
    out.m_59.x = _2389;
    bool _2405 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2407 = fma(_2383, _2399, _2377);
    float _2409 = fma(_2401, 0.298911988735198974609375, _2403);
    bool _2411 = _1491 > 0.0;
    bool _2413 = isnan(_1491);
    bool _2415 = _2411 || _2413;
    bool _2417 = isnan(0.0);
    bool _2419 = _2415 || _2417;
    float _2421 = fma(_2407, 0.114477999508380889892578125, _2409);
    bool _2423 = _1545 <= 0.0;
    bool _2425 = !_2419;
    bool _2427 = _2423 || _2425;
    float _2429 = -_2421;
    float _2431 = _2401 + _2429;
    float _2433 = -_2421;
    float _2435 = _2395 + _2433;
    float _2437 = -_2421;
    float _2439 = _2407 + _2437;
    float _2441 = fma(_2431, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2421);
    float _2443 = fma(_2435, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2421);
    float _2445 = fma(_2439, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2421);
    bool _2447 = !_2405;
    if (!_2447)
    {
        float _2449 = -_1232;
        float _2451 = _2449 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2453 = -_1234;
        float _2455 = _2453 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2457 = -_1236;
        float _2459 = _2457 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2461 = _2451 * _2451;
        float _2463 = fma(_2455, _2455, _2461);
        float _2465 = fma(_2459, _2459, _2463);
        float _2467 = sqrt(_2465);
        float _2469 = rsqrt(_2465);
        float _2471 = -_2467;
        float _2473 = _2471 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2475 = _2473 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2477 = precise::clamp(_2475, 0.0, 1.0);
        float _2479 = _2455 * _2469;
        float _2481 = _2451 * _2469;
        float _2483 = abs(_2477);
        float _2485 = log2(_2483);
        float _2487 = _2459 * _2469;
        float _2489 = _2479 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2491 = _2153 * _2481;
        float _2493 = -_2481;
        float _2495 = -_2489;
        float _2497 = fma(_2493, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2495);
        float _2499 = fma(_2209, _2479, _2491);
        float _2501 = -_2487;
        float _2503 = fma(_2501, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2497);
        float _2505 = fma(_2185, _2487, _2499);
        float _2507 = precise::clamp(_2505, 0.0, 1.0);
        float _2509 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2511 = _2503 + _2509;
        float _2513 = _2485 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2515 = _2511 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2517 = precise::clamp(_2515, 0.0, 1.0);
        float _2519 = exp2(_2513);
        float _2521 = _2519 * _2517;
        float _2523 = _2507 * _2521;
        float _2525 = _2523 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2527 = _2523 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2529 = _2523 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_94.x = _2525;
        out.m_94.y = _2527;
        out.m_94.z = _2529;
    }
    out.m_96.x = _2441;
    out.m_96.y = _2443;
    out.m_96.z = _2445;
    if (!_2427)
    {
        return out;
    }
    out.m_59.x = 0.0;
    float _2531 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2531;
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
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2283 = false;
    bool _531 = false;
    bool _339 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _110 = in.m_56.w;
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
        out.m_59.x = 0.0;
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
        float _2588 = as_type<float>(_131);
        out.gl_Position.z = _2588;
    }
    if (!_119)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _135 = in.m_61.w;
    bool _137 = _135 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _139 = isnan(_135);
    bool _141 = _137 || _139;
    bool _143 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _145 = _141 || _143;
    float _147 = -_135;
    float _149 = _147 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _151 = 0.0;
    if (_145)
    {
        float _153 = float(_115);
        _151 = _153;
    }
    float _155 = _151;
    bool _157 = _149 >= _155;
    bool _159 = !_145;
    bool _161 = _157 || _159;
    if (_161)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _163 = _125;
    if (_161)
    {
        out.m_59.x = 0.0;
    }
    if (_161)
    {
        float _165 = _163 * 5.0;
        _133 = as_type<int>(_165);
    }
    int _167 = _133;
    if (_161)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2656 = as_type<float>(_167);
        out.gl_Position.z = _2656;
    }
    if (_161)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _169 = in.m_63.x;
    float _171 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _173 = _149 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _175 = as_type<float>(int(gl_VertexIndex));
    float _177 = in.m_68.x;
    float _179 = in.m_68.y;
    float _181 = in.m_68.z;
    float _183 = in.m_70.x;
    float _185 = in.m_70.y;
    float _187 = in.m_70.z;
    float _189 = in.m_72.x;
    float _191 = in.m_72.y;
    float _193 = in.m_72.z;
    float _195 = _173 * _171;
    float _197 = in.m_74.x;
    float _199 = in.m_74.y;
    float _201 = in.m_74.z;
    float _203 = fma(_169, (*spvDescriptorSet0.vp_c9)._m0[20].x, _195);
    int _205 = as_type<int>(_175) & 1;
    bool _207 = _205 != 0;
    int _209 = as_type<int>(_175) & 2;
    bool _211 = _209 != 0;
    float _213 = _203 * 6.283185482025146484375;
    int _215 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _217 = _215 != 0;
    float _219 = floor(_203);
    float _221 = _213 * 0.15915493667125701904296875;
    float _223 = _179 * _185;
    bool _225 = !_211;
    int _227 = _225 ? (-1090519040) : 1056964608;
    int _229 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _231 = _229 != 0;
    int _233 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _235 = _233 != 0;
    float _237 = _179 * _191;
    float _239 = _221 * 6.283185482025146484375;
    float _241 = cos(_239);
    float _243 = fma(_177, _183, _223);
    bool _245 = !_207;
    int _247 = _245 ? (-1090519040) : 1056964608;
    float _249 = _179 * _199;
    bool _251 = !_231;
    int _253 = _251 ? 0 : 1;
    float _255 = fma(_177, _189, _237);
    float _257 = -_219;
    float _259 = _203 + _257;
    float _261 = fma(_177, _197, _249);
    bool _263 = !_217;
    int _265 = _263 ? 0 : 1;
    out.m_76.x = as_type<float>(_247);
    out.m_76.y = as_type<float>(_227);
    int _267 = abs(_253);
    float _269 = -_259;
    float _271 = fma(_269, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _273 = abs(_265);
    float _275 = fma(_181, _187, _243);
    float _277 = fma(_181, _193, _255);
    bool _279 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _281 = fma(_241, 0.5, 0.5);
    float _283 = float(_267);
    float _285 = fma(_181, _201, _261);
    bool _287 = !_235;
    int _289 = _287 ? 0 : 1;
    bool _291 = _259 < 0.5;
    float _293 = float(_291);
    float _295 = abs(_271);
    float _297 = _283 * _295;
    int _299 = abs(_289);
    float _301 = -_281;
    float _303 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _305 = float(_273);
    float _307 = -_293;
    float _309 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _311 = float(_299);
    float _313 = fma(_305, _303, _297);
    float _315 = abs(_309);
    float _317 = fma(_311, _315, _313);
    bool _319 = !_279;
    float _321 = _275;
    float _337;
    if (!_319)
    {
        float _323 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _325 = _169 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _327 = fma(_325, (*spvDescriptorSet0.vp_c9)._m0[12].x, _149);
        float _329 = _327 * _323;
        float _331 = floor(_329);
        float _333 = -_331;
        float _335 = _329 + _333;
        _337 = _335;
        _339 = true;
    }
    else
    {
        float _341 = float(_115);
        float _343 = 1.0 / _341;
        float _345 = _149 * _343;
        _337 = _345;
    }
    _339 = false;
    float _347 = _337;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _351 = _347 + _349;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _355 = _347 + _353;
    bool _357 = _347 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _359 = isnan(_347);
    bool _361 = _357 || _359;
    bool _363 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _365 = _361 || _363;
    float _367 = float(_365);
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _371 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _369;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _375 = _373 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _377;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _383 = _347 + _381;
    float _385 = 1.0 / _371;
    bool _387 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _389 = 1.0 / _379;
    float _391 = 1.0 / _375;
    float _393 = _351 * _385;
    bool _395 = _347 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _397 = isnan(_347);
    bool _399 = _395 || _397;
    bool _401 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _403 = _399 || _401;
    float _405 = float(_403);
    float _407 = -_367;
    float _409 = _407 + 1.0;
    float _411 = _405 * _409;
    float _413 = _355 * _389;
    bool _415 = _347 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _417 = isnan(_347);
    bool _419 = _415 || _417;
    bool _421 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _423 = _419 || _421;
    float _425 = float(_423);
    float _427 = -_405;
    float _429 = _427 + 1.0;
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _433 = _431 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _435 = _383 * _391;
    bool _437 = _347 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _439 = isnan(_347);
    bool _441 = _437 || _439;
    bool _443 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _445 = _441 || _443;
    float _447 = float(_445);
    float _449 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _451 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _449;
    float _453 = _425 * _429;
    float _455 = -_425;
    float _457 = _455 + 1.0;
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _461 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _459;
    float _463 = fma(_451, _393, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _465 = _447 * _457;
    float _467 = fma(_461, _393, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _469 = -_447;
    float _471 = _469 + 1.0;
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _475 = _473 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _477 = _463 * _465;
    float _479 = _467 * _465;
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _483 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _481;
    float _485 = fma(_433, _435, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _487 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[143].x, _477);
    float _489 = fma(_475, _435, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _493 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _491;
    float _495 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[143].y, _479);
    float _497 = fma(_483, _413, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _499 = fma(_485, _453, _487);
    float _501 = fma(_493, _413, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _503 = fma(_489, _453, _495);
    float _505 = fma(_497, _411, _499);
    float _507 = fma(_501, _411, _503);
    float _509 = fma(_367, (*spvDescriptorSet0.vp_c9)._m0[146].x, _505);
    float _511 = fma(_367, (*spvDescriptorSet0.vp_c9)._m0[146].y, _507);
    bool _513 = !_387;
    float _529;
    if (!_513)
    {
        float _515 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _517 = _169 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _519 = fma(_517, (*spvDescriptorSet0.vp_c9)._m0[11].y, _149);
        float _521 = _519 * _515;
        float _523 = floor(_521);
        float _525 = -_523;
        float _527 = _521 + _525;
        _529 = _527;
        _531 = true;
    }
    else
    {
        float _533 = float(_115);
        float _535 = 1.0 / _533;
        float _537 = _149 * _535;
        _529 = _537;
    }
    _531 = false;
    float _539 = _529;
    float _541 = in.m_56.x;
    float _543 = in.m_56.y;
    float _545 = in.m_56.z;
    float _547 = in.m_72.w;
    float _549 = in.m_74.w;
    float _551 = _191 * _543;
    float _553 = _199 * _543;
    float _555 = fma(_189, _541, _551);
    float _557 = fma(_197, _541, _553);
    float _559 = fma(_193, _545, _555);
    float _561 = fma(_201, _545, _557);
    float _563 = _559 + _547;
    float _565 = _561 + _549;
    float _567 = fma(_563, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _569 = fma(_565, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _571 = floor(_567);
    float _573 = floor(_569);
    float _575 = -_571;
    float _577 = _567 + _575;
    float _579 = -_573;
    float _581 = _569 + _579;
    float2 _3289 = float2(_577, _581);
    float _583 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3289, float2(0.0), isnan(_3289)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3289, float2(0.0), isnan(_3289)), level(0.0)).x;
    float _585 = in.m_78.y;
    float _587 = in.m_80.x;
    float _589 = in.m_80.y;
    float _591 = _543 + _585;
    float _593 = _591 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _595 = _511 * _589;
    float _597 = _509 * _587;
    float _599 = fma(_563, (*spvDescriptorSet0.vp_c8)._m0[11].x, _593);
    float _601 = _595 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _603 = _597 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _605 = fma(_565, (*spvDescriptorSet0.vp_c8)._m0[11].z, _599);
    float _607 = _591 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _609 = _605 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _611 = fma(_563, (*spvDescriptorSet0.vp_c8)._m0[10].x, _607);
    float _613 = 1.0 / _609;
    float _615 = fma(_565, (*spvDescriptorSet0.vp_c8)._m0[10].z, _611);
    float _617 = _615 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _619 = _617 + _609;
    float _621 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, as_type<float>(_227));
    float _623 = _601 * _621;
    float _625 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _627 = _619 * _613;
    float _629 = _627 * 0.5;
    float _631 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _633 = fma(_629, (*spvDescriptorSet0.vp_c8)._m0[30].w, _631);
    float _635 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, as_type<float>(_247));
    float _637 = 1.0 / _633;
    float _639 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _641 = _603 * _635;
    float _643 = _623 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _645 = _591 + _639;
    float _647 = _623 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _649 = _645 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _651 = _645 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _653 = fma(_563, (*spvDescriptorSet0.vp_c15)._m0[126].x, _649);
    float _655 = fma(_563, (*spvDescriptorSet0.vp_c15)._m0[127].x, _651);
    float _657 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _659 = _637 * _657;
    float _661 = fma(_565, (*spvDescriptorSet0.vp_c15)._m0[126].z, _653);
    float _663 = fma(_565, (*spvDescriptorSet0.vp_c15)._m0[127].z, _655);
    float _665 = fma(_641, (*spvDescriptorSet0.vp_c8)._m0[24].x, _643);
    bool _667 = _659 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _669 = _661 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _671 = _659 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _673 = fma(_641, (*spvDescriptorSet0.vp_c8)._m0[26].x, _647);
    float _675 = _663 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _677 = trunc(_669);
    int _679 = int(_677);
    bool _681 = !_667;
    int _683 = _681 ? 0 : 1;
    float _685 = fma(_625, (*spvDescriptorSet0.vp_c8)._m0[26].z, _673);
    float _687 = fma(_625, (*spvDescriptorSet0.vp_c8)._m0[24].z, _665);
    float _689 = _685 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _691 = _687 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _693 = trunc(_675);
    int _695 = int(_693);
    int _697 = 2;
    int _699 = as_type<int>(_623);
    float _701 = _669;
    float _703 = _675;
    float _705 = _645;
    if (!_667)
    {
        _697 = 1;
    }
    int _707 = _697;
    float _709 = _565 + _689;
    int _711 = _707;
    float _713 = _709;
    if (!_671)
    {
        _711 = _683;
    }
    int _715 = _711;
    float _717 = _563 + _691;
    float _719 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _721 = _709 + _719;
    int _723 = _715 << 6;
    float _725 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _727 = _717 + _725;
    int _729 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _731 = _679 + _729;
    int _733 = _731 + 1;
    int _735 = _723 + 48;
    uint _738 = uint(int(uint(_735) >> uint(2)));
    uint _740 = uint(int(uint(int(_738)) >> uint(2)));
    int _742 = int(_738) & 3;
    float _744 = (*spvDescriptorSet0.vp_c15)._m0[int(_740)][_742];
    int _746 = int(_738) + 1;
    uint _748 = uint(int(uint(_746) >> uint(2)));
    int _750 = _746 & 3;
    float _752 = (*spvDescriptorSet0.vp_c15)._m0[int(_748)][_750];
    bool _754 = _733 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _756 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _758 = _695 + _756;
    int _760 = _758 + 1;
    float _762 = _721 * _721;
    int _764 = _723 + 56;
    uint _766 = uint(int(uint(_764) >> uint(2)));
    uint _768 = uint(int(uint(int(_766)) >> uint(2)));
    int _770 = int(_766) & 3;
    float _772 = (*spvDescriptorSet0.vp_c15)._m0[int(_768)][_770];
    int _774 = int(_766) + 1;
    uint _776 = uint(int(uint(_774) >> uint(2)));
    int _778 = _774 & 3;
    float _780 = (*spvDescriptorSet0.vp_c15)._m0[int(_776)][_778];
    int _782 = _733 | _760;
    float _784 = fma(_727, _727, _762);
    bool _786 = _782 < 0;
    bool _788 = _786 || _754;
    float _790 = sqrt(_784);
    float _792 = _623 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _794 = _723 + 64;
    uint _796 = uint(int(uint(_794) >> uint(2)));
    uint _798 = uint(int(uint(int(_796)) >> uint(2)));
    int _800 = int(_796) & 3;
    float _802 = (*spvDescriptorSet0.vp_c15)._m0[int(_798)][_800];
    int _804 = int(_796) + 1;
    uint _806 = uint(int(uint(_804) >> uint(2)));
    int _808 = _804 & 3;
    float _810 = (*spvDescriptorSet0.vp_c15)._m0[int(_806)][_808];
    bool _812 = _760 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _814 = _812 || _788;
    float _816 = fma(_641, (*spvDescriptorSet0.vp_c8)._m0[25].x, _792);
    float _818 = fma(_625, (*spvDescriptorSet0.vp_c8)._m0[25].z, _816);
    int _820 = _723 + 72;
    uint _822 = uint(int(uint(_820) >> uint(2)));
    uint _824 = uint(int(uint(int(_822)) >> uint(2)));
    int _826 = int(_822) & 3;
    float _828 = (*spvDescriptorSet0.vp_c15)._m0[int(_824)][_826];
    int _830 = int(_822) + 1;
    uint _832 = uint(int(uint(_830) >> uint(2)));
    int _834 = _830 & 3;
    float _836 = (*spvDescriptorSet0.vp_c15)._m0[int(_832)][_834];
    float _838 = _818 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _840 = _790 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _842 = as_type<int>(_792);
    int _844 = as_type<int>(_818);
    float _846 = as_type<float>(_733);
    float _848 = _790;
    float _850 = _717;
    float _852 = as_type<float>(_715);
    if (!_814)
    {
        int _854 = _760 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _856 = _854 + _733;
        _699 = _856;
    }
    int _858 = _699;
    int _860 = _723 + 96;
    uint _862 = uint(int(uint(_860) >> uint(2)));
    uint _864 = uint(int(uint(int(_862)) >> uint(2)));
    int _866 = int(_862) & 3;
    float _868 = (*spvDescriptorSet0.vp_c15)._m0[int(_864)][_866];
    int _870 = int(_862) + 1;
    uint _872 = uint(int(uint(_870) >> uint(2)));
    int _874 = _870 & 3;
    float _876 = (*spvDescriptorSet0.vp_c15)._m0[int(_872)][_874];
    float _878 = _591 + _838;
    if (!_814)
    {
        int _880 = _858 << 2;
        _842 = _880;
    }
    int _882 = _842;
    int _884 = _882;
    if (!_814)
    {
        uint _886 = uint(int(uint(_858) >> uint(2)));
        _844 = int(_886);
    }
    int _888 = _844;
    int _890 = _723 + 104;
    uint _892 = uint(int(uint(_890) >> uint(2)));
    uint _894 = uint(int(uint(int(_892)) >> uint(2)));
    int _896 = int(_892) & 3;
    float _898 = (*spvDescriptorSet0.vp_c15)._m0[int(_894)][_896];
    int _900 = int(_892) + 1;
    uint _902 = uint(int(uint(_900) >> uint(2)));
    int _904 = _900 & 3;
    float _906 = (*spvDescriptorSet0.vp_c15)._m0[int(_902)][_904];
    if (!_814)
    {
        int _908 = 12 & _882;
        _884 = _908;
    }
    int _910 = _884;
    if (!_840)
    {
        _846 = _878;
    }
    float _912 = _846;
    int _914 = 0;
    float _916 = _912;
    if (!_814)
    {
        int _918 = _888 << 4;
        int _920 = _918 + _910;
        _914 = _920;
    }
    int _922 = _914;
    bool _924 = !_840;
    float _926 = _876;
    float _928 = _802;
    if (!_924)
    {
        float _930 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _932 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _934 = _790 + _932;
        float _936 = rsqrt(_784);
        float _938 = _934 * _930;
        float _940 = _878 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _942 = _938 * 0.15915493667125701904296875;
        float _944 = _942 * 6.283185482025146484375;
        float _946 = cos(_944);
        float _948 = _942 * 6.283185482025146484375;
        float _950 = sin(_948);
        float _952 = _946 + (-1.0);
        float _954 = fma(_950, _940, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _956 = _952 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _958 = _936 * _954;
        float _960 = fma(_878, _946, _956);
        float _962 = fma(_727, _958, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _964 = fma(_721, _958, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _916 = _960;
        _848 = _952;
        _850 = _962;
        _713 = _964;
    }
    float _966 = _916;
    float _968 = _848;
    float _970 = _850;
    float _972 = _713;
    float _974 = -_591;
    float _976 = _974 + _966;
    float _978 = _968;
    float _980 = _970;
    float _982 = _966;
    float _984 = _972;
    if (!_814)
    {
        int _986 = _922 + 400;
        uint _988 = uint(int(uint(_986) >> uint(2)));
        uint _990 = uint(int(uint(int(_988)) >> uint(2)));
        int _992 = int(_988) & 3;
        float _994 = (*spvDescriptorSet0.vp_c15)._m0[int(_990)][_992];
        _978 = _994;
    }
    float _996 = _978;
    float _998 = -_563;
    float _1000 = _998 + _970;
    float _1002 = -_565;
    float _1004 = _1002 + _972;
    float _1006 = _976 * _976;
    float _1008 = _645 * _876;
    float _1010 = _645 * _810;
    if (!_814)
    {
        float _1012 = floor(_669);
        _926 = _1012;
    }
    float _1014 = _926;
    float _1016 = fma(_1000, _1000, _1006);
    int _1018 = _723 + 80;
    uint _1020 = uint(int(uint(_1018) >> uint(2)));
    uint _1022 = uint(int(uint(int(_1020)) >> uint(2)));
    int _1024 = int(_1020) & 3;
    float _1026 = (*spvDescriptorSet0.vp_c15)._m0[int(_1022)][_1024];
    int _1028 = int(_1020) + 1;
    uint _1030 = uint(int(uint(_1028) >> uint(2)));
    int _1032 = _1028 & 3;
    float _1034 = (*spvDescriptorSet0.vp_c15)._m0[int(_1030)][_1032];
    float _1036 = fma(_563, _868, _1008);
    float _1038 = fma(_563, _802, _1010);
    float _1040 = fma(_1004, _1004, _1016);
    float _1042 = fma(_565, _898, _1036);
    float _1044 = _645 * _752;
    float _1046 = sqrt(_1040);
    int _1048 = _723 + 88;
    uint _1050 = uint(int(uint(_1048) >> uint(2)));
    uint _1052 = uint(int(uint(int(_1050)) >> uint(2)));
    int _1054 = int(_1050) & 3;
    float _1056 = (*spvDescriptorSet0.vp_c15)._m0[int(_1052)][_1054];
    int _1058 = int(_1050) + 1;
    uint _1060 = uint(int(uint(_1058) >> uint(2)));
    int _1062 = _1058 & 3;
    float _1064 = (*spvDescriptorSet0.vp_c15)._m0[int(_1060)][_1062];
    float _1066 = _1042 + _906;
    float _1068 = fma(_563, _744, _1044);
    float _1070 = fma(_565, _828, _1038);
    bool _1072 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1074 = isnan(0.5);
    bool _1076 = _1072 || _1074;
    bool _1078 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1080 = _1076 || _1078;
    float _1082 = fma(_565, _772, _1068);
    float _1084 = _898;
    float _1086 = _1038;
    float _1088 = _1044;
    float _1090 = _1014;
    if (!_814)
    {
        float _1092 = floor(_675);
        _1084 = _1092;
    }
    float _1094 = _1084;
    float _1096 = _1070 + _836;
    float _1098 = _1082 + _780;
    bool _1100 = _1046 > 0.0;
    float _1102 = 1.0 / _1066;
    bool _1104 = !_1100;
    if (!_1104)
    {
        float _1106 = _275 * _275;
        float _1108 = rsqrt(_1040);
        float _1110 = fma(_277, _277, _1106);
        float _1112 = fma(_285, _285, _1110);
        float _1114 = sqrt(_1112);
        float _1116 = _1000 * _1108;
        float _1118 = _976 * _1108;
        float _1120 = _1004 * _1108;
        bool _1122 = _1114 > 0.0;
        bool _1124 = !_1122;
        _928 = _1112;
        if (!_1124)
        {
            float _1126 = rsqrt(_1112);
            float _1128 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1130 = _275 * _1126;
            float _1132 = _277 * _1126;
            float _1134 = _1118 * _1130;
            float _1136 = _285 * _1126;
            float _1138 = fma(_1116, _1132, _1134);
            float _1140 = _1128 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1142 = fma(_1120, _1136, _1138);
            float _1144 = _1142 * _1140;
            float _1146 = fma(_277, _1144, _970);
            float _1148 = fma(_275, _1144, _966);
            float _1150 = fma(_285, _1144, _972);
            _980 = _1146;
            _982 = _1148;
            _984 = _1150;
            _928 = _1126;
            _1086 = _1128;
            _1088 = _1140;
        }
    }
    float _1152 = _980;
    float _1154 = _982;
    float _1156 = _984;
    float _1158 = _928;
    float _1160 = _1086;
    float _1162 = _1088;
    float _1164 = _1158;
    float _1166 = _1160;
    float _1168 = _1162;
    if (_1080)
    {
        _321 = _1152;
    }
    float _1170 = _321;
    float _1172 = _1170;
    if (_1080)
    {
        _1164 = _1154;
    }
    float _1174 = _1164;
    float _1176 = _1174;
    if (_1080)
    {
        _1166 = _1156;
    }
    float _1178 = _1166;
    float _1180 = _1178;
    if (!_1080)
    {
        float _1182 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1184 = _591 + _1182;
        float _1186 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1188 = _563 + _1186;
        float _1190 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1192 = -_563;
        float _1194 = _1192 + _1152;
        float _1196 = _1184 * _1184;
        float _1198 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1200 = _565 + _1198;
        float _1202 = -_565;
        float _1204 = _1202 + _1156;
        float _1206 = fma(_1188, _1188, _1196);
        float _1208 = fma(_1200, _1200, _1206);
        float _1210 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1212 = _1190 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1214 = sqrt(_1208);
        float _1216 = precise::min(_1214, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1218 = _1216 * _1210;
        float _1220 = -_591;
        float _1222 = _1220 + _1154;
        float _1224 = _1212 * _1218;
        float _1226 = fma(_1222, _1224, _591);
        float _1228 = fma(_1194, _1224, _563);
        float _1230 = fma(_1204, _1224, _565);
        _1176 = _1226;
        _1172 = _1228;
        _1180 = _1230;
    }
    float _1232 = _1176;
    float _1234 = _1172;
    float _1236 = _1180;
    float _1238 = _1232 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1240 = _1098 * _1102;
    float _1242 = _1232 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1244 = _1232 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1246 = fma(_1234, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1238);
    float _1248 = _1096 * _1102;
    float _1250 = fma(_1234, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1242);
    float _1252 = fma(_1234, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1244);
    float _1254 = fma(_1236, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1246);
    bool _1256 = _1240 >= 0.0;
    float _1258 = fma(_1236, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1250);
    float _1260 = _1232 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1262 = fma(_1236, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1252);
    float _1264 = _1254 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _1266 = _1240 <= 1.0;
    bool _1268 = _1266 && _1256;
    if (!_814)
    {
        float _1270 = rint(_996);
        float _1272 = precise::max(_1270, 0.0);
        uint _1274 = uint(_1272);
        uint _1276 = clamp(_1274, 0u, 65535u);
        _1168 = as_type<float>(_1276);
    }
    float _1278 = _1168;
    float _1280 = fma(_1234, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1260);
    float _1282 = _1264 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1284 = _1248 >= 0.0;
    bool _1286 = _1284 && _1268;
    float _1288 = _1258 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1290 = fma(_1236, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1280);
    float _1292 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    bool _1294 = _1248 <= 1.0;
    bool _1296 = _1294 && _1286;
    float _1298 = _1288 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1300 = _1262 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1302 = _1290 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    if (!_814)
    {
        float _1304 = -_1014;
        float _1306 = _669 + _1304;
        _1090 = _1306;
    }
    float _1308 = _1090;
    float _1310 = -_1298;
    float _1312 = fma(_1310, _1292, 1.0);
    float _1314 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1282);
    float _1316 = _1264 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1318 = log2(_1312);
    float _1320 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1314);
    float _1322 = _645 * _1034;
    float _1324 = _1264 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1326 = _1312;
    if (_1296)
    {
        float _1328 = float(_715);
        _852 = _1328;
    }
    float _1330 = _852;
    float _1332 = fma(_1302, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1320);
    float _1334 = fma(_563, _1026, _1322);
    float _1336 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1324);
    float _1338 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1316);
    float _1340 = 1.0 / _1332;
    float _1342 = fma(_565, _1056, _1334);
    float _1344 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1336);
    float _1346 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1338);
    float _1348 = _1332;
    if (!_814)
    {
        float _1350 = -_1094;
        float _1352 = _675 + _1350;
        _1326 = _1352;
    }
    float _1354 = _1326;
    float _1356 = _1342 + _1064;
    float _1358 = fma(_1302, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1344);
    float _1360 = fma(_1302, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1346);
    float _1362 = _1334;
    float _1364 = _1358;
    if (_1296)
    {
        float _1366 = rint(_1330);
        float _1368 = precise::max(_1366, 0.0);
        uint _1370 = uint(_1368);
        uint _1372 = clamp(_1370, 0u, 65535u);
        _1362 = as_type<float>(_1372);
    }
    float _1374 = _1362;
    float _1376 = _1318 * 0.693147182464599609375;
    float _1378 = _1356 * _1102;
    float _1380 = _1354;
    float _1382 = _1378;
    if (!_814)
    {
        float3 _4617 = float3(_1308, _1354, float(as_type<int>(_1278)));
        float3 _4621 = select(_4617, float3(0.0), isnan(_4617));
        float _1384 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _4621.xy, uint(rint(_4621.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _4621.xy, uint(rint(_4621.z)), level(0.0)).x;
        _1380 = _1384;
    }
    float _1386 = _1380;
    float _1388 = _1376 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1390 = _1358 * _1340;
    float _1392 = _1360 * _1340;
    float _1394 = fma(_1390, 0.5, 0.5);
    float _1396 = fma(_1392, -0.5, 0.5);
    float _1398 = _1374;
    float _1400 = _1340;
    if (_1296)
    {
        float3 _4652 = float3(_1240, _1248, float(as_type<int>(_1374)));
        float3 _4654 = select(_4652, float3(0.0), isnan(_4652));
        float _1402 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _4654.xy, uint(rint(_4654.z)), _1378, level(0.0));
        _1398 = _1402;
    }
    float _1404 = _1398;
    float3 _4664 = float3(_1394, _1396, _1388);
    float _1406 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4664, float3(0.0), isnan(_4664)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4664, float3(0.0), isnan(_4664)), level(0.0)).x;
    float3 _4673 = float3(_1394, _1396, _1388);
    float4 _1409 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4673, float3(0.0), isnan(_4673)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4673, float3(0.0), isnan(_4673)), level(0.0)).xyzw;
    float _1411 = _1409.x;
    float _1413 = _1409.y;
    float _1415 = _1409.z;
    float _1417 = _1409.w;
    bool _1419 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1421 = isnan(0.5);
    bool _1423 = _1419 || _1421;
    bool _1425 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1427 = _1423 || _1425;
    if (_814)
    {
        _1400 = 1.0;
    }
    float _1429 = _1400;
    float _1431 = _1429;
    if (_1427)
    {
        _701 = 1.0;
    }
    float _1433 = _701;
    float _1435 = _1433;
    if (_1427)
    {
        _703 = 1.0;
    }
    float _1437 = _703;
    float _1439 = _1437;
    float _1441 = _1411;
    if (!_1427)
    {
        float _1443 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1445 = _1443 * 0.15915493667125701904296875;
        float _1447 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1449 = _1445 * 6.283185482025146484375;
        float _1451 = cos(_1449);
        float _1453 = _1447 * 0.15915493667125701904296875;
        float _1455 = _1445 * 6.283185482025146484375;
        float _1457 = sin(_1455);
        float _1459 = 1.0 / _1451;
        float _1461 = _1453 * 6.283185482025146484375;
        float _1463 = cos(_1461);
        float _1465 = _1457 * _1459;
        float _1467 = _1453 * 6.283185482025146484375;
        float _1469 = sin(_1467);
        float _1471 = _1463 * _1465;
        float _1473 = 1.0 / _1471;
        float _1475 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1477 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1475;
        float _1479 = 1.0 / _1477;
        float _1481 = _1469 * _1473;
        float _1483 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1485 = fma(_659, _1481, _1483);
        float _1487 = _1485 * _1479;
        float _1489 = precise::clamp(_1487, 0.0, 1.0);
        _1439 = _1489;
    }
    float _1491 = _1439;
    if (!_1427)
    {
        float _1493 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1495 = _1493 * 0.15915493667125701904296875;
        float _1497 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1499 = _1495 * 6.283185482025146484375;
        float _1501 = cos(_1499);
        float _1503 = _1497 * 0.15915493667125701904296875;
        float _1505 = _1495 * 6.283185482025146484375;
        float _1507 = sin(_1505);
        float _1509 = 1.0 / _1501;
        float _1511 = _1503 * 6.283185482025146484375;
        float _1513 = cos(_1511);
        float _1515 = _1507 * _1509;
        float _1517 = _1503 * 6.283185482025146484375;
        float _1519 = sin(_1517);
        float _1521 = _1513 * _1515;
        float _1523 = 1.0 / _1521;
        float _1525 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1527 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1525;
        float _1529 = 1.0 / _1527;
        float _1531 = _1519 * _1523;
        float _1533 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1535 = fma(_659, _1531, _1533);
        float _1537 = _1535 * _1529;
        float _1539 = precise::clamp(_1537, 0.0, 1.0);
        float _1541 = -_1539;
        float _1543 = _1541 + 1.0;
        _1435 = _1543;
    }
    float _1545 = _1435;
    if (!_814)
    {
        int _1547 = _858 << 4;
        int _1549 = _1547 + 2048;
        uint _1551 = uint(int(uint(_1549) >> uint(2)));
        uint _1553 = uint(int(uint(int(_1551)) >> uint(2)));
        int _1555 = int(_1551) & 3;
        float _1557 = (*spvDescriptorSet0.vp_c15)._m0[int(_1553)][_1555];
        int _1559 = int(_1551) + 1;
        uint _1561 = uint(int(uint(_1559) >> uint(2)));
        int _1563 = _1559 & 3;
        float _1565 = (*spvDescriptorSet0.vp_c15)._m0[int(_1561)][_1563];
        int _1567 = _1549 + 8;
        uint _1569 = uint(int(uint(_1567) >> uint(2)));
        uint _1571 = uint(int(uint(int(_1569)) >> uint(2)));
        int _1573 = int(_1569) & 3;
        float _1575 = (*spvDescriptorSet0.vp_c15)._m0[int(_1571)][_1573];
        int _1577 = int(_1569) + 1;
        uint _1579 = uint(int(uint(_1577) >> uint(2)));
        int _1581 = _1577 & 3;
        float _1583 = (*spvDescriptorSet0.vp_c15)._m0[int(_1579)][_1581];
        float _1585 = _645 * _1565;
        float _1587 = fma(_563, _1557, _1585);
        float _1589 = fma(_565, _1575, _1587);
        float _1591 = _1589 + _1583;
        float _1593 = precise::clamp(_1591, 0.0, 1.0);
        float _1595 = -_1593;
        float _1597 = _1595 + _1386;
        float _1599 = fma(_1597, 500.0, 1.5);
        float _1601 = exp2(_1599);
        float _1603 = 0.0 + _1601;
        float _1605 = precise::clamp(_1603, 0.0, 1.0);
        _705 = _1585;
        _1431 = _1605;
    }
    float _1607 = _705;
    float _1609 = _1431;
    float _1611 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1613 = _1232 + _1611;
    float _1615 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1617 = _1234 + _1615;
    float _1619 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1621 = _1236 + _1619;
    float _1623 = _1613 * _1613;
    float _1625 = fma(_1617, _1617, _1623);
    float _1627 = fma(_1621, _1621, _1625);
    float _1629 = rsqrt(_1627);
    float _1631 = _1629 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1633 = _1617 * _1631;
    float _1635 = _1621 * _1631;
    float _1637 = _1633 * _1633;
    float _1639 = _1635 * _1635;
    float _1641 = _1637 + _1639;
    float _1643 = sqrt(_1641);
    bool _1645 = _1643 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1647 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1649 = _1643 + _1647;
    float _1651 = _1625;
    float _1653 = _1649;
    float _1655 = _1607;
    float _1657 = _1613;
    float _1659 = _1631;
    if (_1645)
    {
        float _1661 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1651 = _1661;
    }
    float _1663 = _1651;
    float _1665 = _1663;
    if (_1645)
    {
        float _1667 = _1649 * _1663;
        _1653 = _1667;
    }
    float _1669 = _1653;
    if (_1645)
    {
        float _1671 = rsqrt(_1641);
        _1665 = _1671;
    }
    float _1673 = _1665;
    float _1675 = _1673;
    if (_1645)
    {
        float _1677 = _1669 * 0.15915493667125701904296875;
        _1655 = _1677;
    }
    float _1679 = _1655;
    float _1681 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1683 = _1629;
    float _1685 = _1679;
    if (_1645)
    {
        float _1687 = _1679 * 6.283185482025146484375;
        float _1689 = sin(_1687);
        _1683 = _1689;
    }
    float _1691 = _1683;
    float _1693 = precise::max(0.0, _1681);
    float _1695 = _1621;
    float _1697 = _1691;
    float _1699 = _1693;
    if (_1645)
    {
        float _1701 = _1679 * 6.283185482025146484375;
        float _1703 = cos(_1701);
        _1695 = _1703;
    }
    float _1705 = _1695;
    float _1707 = -_1631;
    float _1709 = -_1693;
    float _1711 = fma(_1613, _1707, _1709);
    if (_1645)
    {
        float _1713 = _1711 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1657 = _1713;
    }
    float _1715 = _1657;
    float _1717 = _1715;
    if (_1645)
    {
        float _1719 = fma(_1691, _1715, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1697 = _1719;
    }
    float _1721 = _1697;
    float _1723 = _1721;
    if (!_1645)
    {
        _1717 = _1711;
    }
    float _1725 = _1717;
    float _1727 = _1725;
    if (!_1645)
    {
        _1685 = _1637;
    }
    float _1729 = _1685;
    float _1731 = _1729;
    if (_1645)
    {
        float _1733 = _1673 * _1721;
        _1659 = _1733;
    }
    float _1735 = _1659;
    if (!_1645)
    {
        _1723 = _1633;
    }
    float _1737 = _1723;
    float _1739 = _1737;
    if (_1645)
    {
        float _1741 = _1705 + (-1.0);
        _1699 = _1741;
    }
    float _1743 = _1699;
    float _1745 = _1743;
    if (_1645)
    {
        float _1747 = _1633 * _1735;
        _1739 = _1747;
    }
    float _1749 = _1739;
    if (_1645)
    {
        float _1751 = _1743 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1675 = _1751;
    }
    float _1753 = _1675;
    float _1755 = _1753;
    if (!_1645)
    {
        _1745 = _1635;
    }
    float _1757 = _1745;
    float _1759 = _1757;
    if (_1645)
    {
        float _1761 = _1635 * _1735;
        _1759 = _1761;
    }
    float _1763 = _1759;
    if (_1645)
    {
        float _1765 = _1749 * _1749;
        _1731 = _1765;
    }
    float _1767 = _1731;
    if (_1645)
    {
        float _1769 = fma(_1711, _1705, _1753);
        _1727 = _1769;
    }
    float _1771 = _1727;
    if (!_1645)
    {
        _1755 = _1639;
    }
    float _1773 = _1755;
    float _1775 = _1773;
    if (_1645)
    {
        float _1777 = _1763 * _1763;
        _1775 = _1777;
    }
    float _1779 = _1775;
    float _1781 = sqrt(_1627);
    float _1783 = fma(_1771, _1771, _1767);
    float _1785 = _1783 + _1779;
    float _1787 = rsqrt(_1785);
    float _1789 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1791 = fma(_1781, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1789);
    float _1793 = precise::clamp(_1791, 0.0, 1.0);
    float _1795 = -_1793;
    float _1797 = _1795 + 1.0;
    float _1799 = abs(_1797);
    float _1801 = log2(_1799);
    float _1803 = _1787 * _1749;
    float _1805 = _1787 * _1771;
    float _1807 = _1787 * _1763;
    float _1809 = _1803 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1811 = -_1809;
    float _1813 = fma(_1805, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1811);
    float _1815 = -_1807;
    float _1817 = fma(_1815, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1813);
    float _1819 = _1801 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1821 = fma(_1817, -0.5, 0.5);
    float _1823 = fma(_1817, 0.5, 0.5);
    float _1825 = exp2(_1819);
    float _1827 = fma(_1823, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1829 = fma(_1823, _1827, -0.212114393711090087890625);
    float _1831 = _1805 + 1.0;
    float _1833 = sqrt(_1821);
    float _1835 = fma(_1823, _1829, 1.570728778839111328125);
    float _1837 = -_1805;
    float _1839 = fma(_1825, _1831, _1837);
    float _1841 = _1833 * 0.636619746685028076171875;
    float _1843 = -_1835;
    float _1845 = fma(_1841, _1843, 1.0);
    float _1847 = fma(_1839, 0.5, 0.5);
    float2 _5318 = float2(_1845, _1847);
    float3 _1851 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5318, float2(0.0), isnan(_5318)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5318, float2(0.0), isnan(_5318)), level(0.0)).xyz;
    float _1853 = _1851.x;
    float _1855 = _1851.y;
    float _1857 = _1851.z;
    float _1859 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1861 = _539 + _1859;
    float _1863 = _1264 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1865 = _539 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1867 = isnan(_539);
    bool _1869 = _1865 || _1867;
    bool _1871 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1873 = _1869 || _1871;
    float _1875 = float(_1873);
    float _1877 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1879 = _1877 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1881 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1883 = _1881 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1885 = _539 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1887 = isnan(_539);
    bool _1889 = _1885 || _1887;
    bool _1891 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1893 = _1889 || _1891;
    float _1895 = float(_1893);
    float _1897 = -_1875;
    float _1899 = _1897 + 1.0;
    bool _1901 = _539 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1903 = isnan(_539);
    bool _1905 = _1901 || _1903;
    bool _1907 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1909 = _1905 || _1907;
    float _1911 = float(_1909);
    float _1913 = 1.0 / _1879;
    float _1915 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1917 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1915;
    float _1919 = _1895 * _1899;
    float _1921 = -_1895;
    float _1923 = _1921 + 1.0;
    float _1925 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1863);
    float _1927 = -_583;
    float _1929 = _1927 + 1.0;
    float _1931 = _1911 * _1923;
    float _1933 = 1.0 / _1883;
    float _1935 = -_1911;
    float _1937 = _1935 + 1.0;
    float _1939 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1941 = _1939 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1943 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1925);
    bool _1945 = _1781 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1947 = isnan(_1781);
    bool _1949 = _1945 || _1947;
    bool _1951 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1953 = _1949 || _1951;
    float _1955 = _1917 * _1913;
    float _1957 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1959 = _1957 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1961 = 1.0 / _1941;
    float _1963 = fma(_1955, _1861, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1965 = _539 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1967 = isnan(_539);
    bool _1969 = _1965 || _1967;
    bool _1971 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1973 = _1969 || _1971;
    float _1975 = float(_1973);
    float _1977 = _1959 * _1933;
    float _1979 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1981 = _539 + _1979;
    float _1983 = _1963 * _1931;
    float _1985 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1987 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1985;
    float _1989 = -_1975;
    float _1991 = _1989 + 1.0;
    float _1993 = fma(_1977, _1981, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1995 = fma(_1937, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1983);
    float _1997 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1999 = _539 + _1997;
    float _2001 = _1875 * _1991;
    float _2003 = as_type<float>(_247) * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2005 = fma(_1993, _1919, _1995);
    float _2007 = _1987 * _1961;
    float _2009 = abs(_659);
    float _2011 = log2(_2009);
    float _2013 = as_type<float>(_227) * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2015 = fma(_2007, _1999, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _2017 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2019 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2021 = _2013 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2023 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2025 = fma(_2015, _2001, _2005);
    float _2027 = _2013 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2029 = _2013 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2031 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2033 = _2011 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2035 = _2017 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2037 = _2019 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2039 = _2023 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2041 = fma(_2003, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2021);
    float _2043 = fma(_1975, (*spvDescriptorSet0.vp_c9)._m0[118].x, _2025);
    float _2045 = exp2(_2033);
    float _2047 = fma(_1302, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1943);
    float _2049 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    out.m_82.x = _2035;
    out.m_82.y = _2037;
    out.m_82.z = _2039;
    out.m_82.w = _2031;
    float _2051 = fma(_2003, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2027);
    bool _2053 = _659 <= 8000.0;
    bool _2055 = isnan(_659);
    bool _2057 = _2053 || _2055;
    bool _2059 = isnan(8000.0);
    bool _2061 = _2057 || _2059;
    float _2063 = float(_2061);
    out.gl_Position.x = _1358;
    out.gl_Position.y = _1360;
    out.gl_Position.z = _2047;
    out.gl_Position.w = _1332;
    float _2065 = fma(_2003, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2029);
    float _2067 = fma(_2045, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2069 = precise::clamp(_2067, 0.0, 1.0);
    float _2071 = _2043 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2073 = _2049 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2075 = _1801 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2077 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2079 = _2047 + _1332;
    float _2081 = fma(_2069, -2.0, 3.0);
    float _2083 = _2069 * _2069;
    float _2085 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2087 = exp2(_2075);
    if (!_1296)
    {
        _1364 = 1.0;
    }
    float _2089 = _1364;
    float _2091 = _2083 * _2081;
    float _2093 = _2089;
    if (_1296)
    {
        bool _2095 = _1404 >= _1378;
        bool _2097 = isnan(_1404);
        bool _2099 = _2095 || _2097;
        bool _2101 = isnan(_1378);
        bool _2103 = _2099 || _2101;
        float _2105 = float(_2103);
        _2093 = _2105;
    }
    float _2107 = _2093;
    float _2109 = _2077 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2111 = _2085 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2113 = -_2091;
    float _2115 = _2113 + 1.0;
    float _2117 = _2107 * _1609;
    float _2119 = _2079 * 0.5;
    float _2121 = fma(_2115, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2091);
    out.m_84.x = _2073;
    out.m_84.y = _2109;
    out.m_84.z = _2111;
    out.m_84.w = _2071;
    float _2123 = _1491 * _1545;
    if (!_1953)
    {
        _1382 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2125 = _1382;
    float _2127 = _2063 * _2121;
    out.m_86.z = _2119;
    out.m_86.w = _1332;
    float _2129 = -_2087;
    float _2131 = _2129 + 1.0;
    float _2133 = _2123 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2135 = _2127 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2137 = _2127;
    float _2139 = _2125;
    float _2141 = _2125;
    if (!_1953)
    {
        _2137 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2143 = _2137;
    float _2145 = _2131 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2147 = _317 * _2133;
    float _2149 = _1929 * _2135;
    float _2151 = precise::clamp(_2149, 0.0, 1.0);
    float _2153 = _2041 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _2155 = _2145 * _1406;
    float _2157 = -_2145;
    float _2159 = _2157 + 1.0;
    float _2161 = -_2151;
    float _2163 = fma(_2161, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2165 = _2151;
    float _2167 = _2163;
    float _2169 = _2143;
    float _2171 = _2143;
    if (!_1953)
    {
        _2165 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2173 = _2165;
    float _2175 = _1417 * _2155;
    float _2177 = _1417 * _2159;
    float _2179 = -_2117;
    float _2181 = fma(_2179, _2163, 1.0);
    float _2183 = precise::clamp(_2181, 0.0, 1.0);
    float _2185 = _2065 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _2187 = _2173;
    float _2189 = _2173;
    if (!_1953)
    {
        _2167 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2191 = _2167;
    float _2193 = _2191;
    float _2195 = _2191;
    if (!_1953)
    {
        _1348 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2197 = _1348;
    float _2199 = _1857 * _2155;
    float _2201 = fma(_1853, _2175, _1411);
    float _2203 = fma(_1855, _2175, _1413);
    float _2205 = _2183 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2207 = fma(_1417, _2199, _1415);
    float _2209 = _2051 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _2211 = _2197;
    float _2213 = _2197;
    if (!_1953)
    {
        _1441 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2215 = _1441;
    out.m_88.x = _2205;
    out.m_90.x = _2201;
    out.m_90.y = _2203;
    out.m_90.z = _2207;
    out.m_90.w = _2177;
    out.m_92.x = _2209;
    out.m_92.y = _2153;
    out.m_92.z = _2185;
    bool _2217 = !_1953;
    float _2219 = _2215;
    float _2221 = _2215;
    if (!_2217)
    {
        bool _2223 = _1781 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2225 = isnan(_1781);
        bool _2227 = _2223 || _2225;
        bool _2229 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2231 = _2227 || _2229;
        if (!_2231)
        {
            float _2233 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2235 = _1781 + _2233;
            float _2237 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2239 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2237;
            float _2241 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2243 = _2241 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2245 = 1.0 / _2239;
            float _2247 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2249 = _2247 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2251 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2253 = _2251 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2255 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2257 = _2255 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2259 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2261 = _2259 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2263 = _2235 * _2245;
            float _2265 = precise::clamp(_2263, 0.0, 1.0);
            float _2267 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2269 = _2267 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2271 = fma(_2265, _2243, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2273 = fma(_2265, _2269, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2275 = fma(_2265, _2249, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2277 = fma(_2265, _2253, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2279 = fma(_2265, _2257, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2281 = fma(_2265, _2261, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2221 = _2275;
            _2141 = _2279;
            _2195 = _2271;
            _2189 = _2277;
            _2171 = _2273;
            _2213 = _2281;
            _2283 = true;
        }
        else
        {
            bool _2285 = _1781 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2287 = isnan(_1781);
            bool _2289 = _2285 || _2287;
            bool _2291 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2293 = _2289 || _2291;
            if (!_2293)
            {
                _2193 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2295 = _2193;
            _2195 = _2295;
            if (!_2293)
            {
                _2219 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2297 = _2219;
            _2221 = _2297;
            if (!_2293)
            {
                _2169 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2299 = _2169;
            _2171 = _2299;
            if (!_2293)
            {
                _2187 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2301 = _2187;
            _2189 = _2301;
            if (!_2293)
            {
                _2139 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2303 = _2139;
            _2141 = _2303;
            if (!_2293)
            {
                _2211 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2305 = _2211;
            bool _2307 = !_2293;
            _2213 = _2305;
            if (!_2307)
            {
                bool _2309 = _1781 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2311 = isnan(_1781);
                bool _2313 = _2309 || _2311;
                bool _2315 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2317 = _2313 || _2315;
                if (!_2317)
                {
                    float _2319 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2321 = _1781 + _2319;
                    float _2323 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2325 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2323;
                    float _2327 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2329 = _2327 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2331 = 1.0 / _2325;
                    float _2333 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2335 = _2333 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2337 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2339 = _2337 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2341 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2343 = _2341 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2345 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2347 = _2345 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2349 = _2321 * _2331;
                    float _2351 = precise::clamp(_2349, 0.0, 1.0);
                    float _2353 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2355 = _2353 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2357 = fma(_2351, _2329, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2359 = fma(_2351, _2355, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2361 = fma(_2351, _2335, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2363 = fma(_2351, _2339, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2365 = fma(_2351, _2343, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2367 = fma(_2351, _2347, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2221 = _2361;
                    _2141 = _2365;
                    _2195 = _2357;
                    _2189 = _2363;
                    _2171 = _2359;
                    _2213 = _2367;
                    _2283 = true;
                }
                else
                {
                    _2221 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2141 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2195 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2189 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2171 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2213 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2283 = false;
    float _2369 = _2221;
    float _2371 = _2141;
    float _2373 = _2195;
    float _2375 = _2189;
    float _2377 = _2171;
    float _2379 = _2213;
    float _2381 = fma(_2153, -0.5, 0.5);
    float _2383 = precise::clamp(_2381, 0.0, 1.0);
    float _2385 = -_2369;
    float _2387 = _2385 + _2371;
    float _2389 = _2147 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2391 = -_2373;
    float _2393 = _2391 + _2375;
    float _2395 = fma(_2383, _2387, _2369);
    out.m_94.x = 0.0;
    float _2397 = -_2377;
    float _2399 = _2397 + _2379;
    float _2401 = fma(_2383, _2393, _2373);
    float _2403 = _2395 * 0.586610972881317138671875;
    out.m_59.x = _2389;
    bool _2405 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2407 = fma(_2383, _2399, _2377);
    float _2409 = fma(_2401, 0.298911988735198974609375, _2403);
    bool _2411 = _1491 > 0.0;
    bool _2413 = isnan(_1491);
    bool _2415 = _2411 || _2413;
    bool _2417 = isnan(0.0);
    bool _2419 = _2415 || _2417;
    float _2421 = fma(_2407, 0.114477999508380889892578125, _2409);
    bool _2423 = _1545 <= 0.0;
    bool _2425 = !_2419;
    bool _2427 = _2423 || _2425;
    float _2429 = -_2421;
    float _2431 = _2401 + _2429;
    float _2433 = -_2421;
    float _2435 = _2395 + _2433;
    float _2437 = -_2421;
    float _2439 = _2407 + _2437;
    float _2441 = fma(_2431, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2421);
    float _2443 = fma(_2435, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2421);
    float _2445 = fma(_2439, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2421);
    bool _2447 = !_2405;
    if (!_2447)
    {
        float _2449 = -_1232;
        float _2451 = _2449 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2453 = -_1234;
        float _2455 = _2453 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2457 = -_1236;
        float _2459 = _2457 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2461 = _2451 * _2451;
        float _2463 = fma(_2455, _2455, _2461);
        float _2465 = fma(_2459, _2459, _2463);
        float _2467 = sqrt(_2465);
        float _2469 = rsqrt(_2465);
        float _2471 = -_2467;
        float _2473 = _2471 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2475 = _2473 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2477 = precise::clamp(_2475, 0.0, 1.0);
        float _2479 = _2455 * _2469;
        float _2481 = _2451 * _2469;
        float _2483 = abs(_2477);
        float _2485 = log2(_2483);
        float _2487 = _2459 * _2469;
        float _2489 = _2479 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2491 = _2153 * _2481;
        float _2493 = -_2481;
        float _2495 = -_2489;
        float _2497 = fma(_2493, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2495);
        float _2499 = fma(_2209, _2479, _2491);
        float _2501 = -_2487;
        float _2503 = fma(_2501, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2497);
        float _2505 = fma(_2185, _2487, _2499);
        float _2507 = precise::clamp(_2505, 0.0, 1.0);
        float _2509 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2511 = _2503 + _2509;
        float _2513 = _2485 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2515 = _2511 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2517 = precise::clamp(_2515, 0.0, 1.0);
        float _2519 = exp2(_2513);
        float _2521 = _2519 * _2517;
        float _2523 = _2507 * _2521;
        float _2525 = _2523 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2527 = _2523 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2529 = _2523 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_94.x = _2525;
        out.m_94.y = _2527;
        out.m_94.z = _2529;
    }
    out.m_96.x = _2441;
    out.m_96.y = _2443;
    out.m_96.z = _2445;
    if (!_2427)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_59.x = 0.0;
    float _2531 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2531;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

