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
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c10 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c13 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture2d<float> vp_t_tcb_24 [[id(6)]];
    sampler vp_t_tcb_24Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_32 [[id(8)]];
    sampler vp_t_tcb_32Smplr [[id(9)]];
    texture3d<float> vp_t_tcb_30 [[id(10)]];
    sampler vp_t_tcb_30Smplr [[id(11)]];
    texture2d<float> vp_t_tcb_1C [[id(12)]];
    sampler vp_t_tcb_1CSmplr [[id(13)]];
    texture2d<float> vp_t_tcb_20 [[id(14)]];
    sampler vp_t_tcb_20Smplr [[id(15)]];
    sampler vp_t_tcb_24Smplr_w [[id(16)]];
    sampler vp_t_tcb_32Smplr_w [[id(17)]];
    sampler vp_t_tcb_30Smplr_w [[id(18)]];
    sampler vp_t_tcb_1CSmplr_w [[id(19)]];
    sampler vp_t_tcb_20Smplr_w [[id(20)]];
    constant dm_border_t* dm_border [[id(21)]];
};

struct main0_out
{
    float4 m_72 [[user(locn0)]];
    float4 m_74 [[user(locn1)]];
    float4 m_86 [[user(locn2)]];
    float4 m_82 [[user(locn3)]];
    float4 m_96 [[user(locn4)]];
    float4 m_51 [[user(locn5)]];
    float4 m_80 [[user(locn6)]];
    float4 m_88 [[user(locn7)]];
    float4 m_70 [[user(locn8)]];
    float4 m_76 [[user(locn9)]];
    float4 m_94 [[user(locn10)]];
    float4 m_84 [[user(locn11)]];
    float4 m_90 [[user(locn12)]];
    float4 m_92 [[user(locn13)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_78 [[attribute(0)]];
    float4 m_66 [[attribute(1)]];
    float4 m_68 [[attribute(2)]];
    float4 m_64 [[attribute(3)]];
    float4 m_60 [[attribute(4)]];
    float4 m_48 [[attribute(5)]];
    float4 m_53 [[attribute(6)]];
    float4 m_58 [[attribute(7)]];
    float4 m_62 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3209 = false;
    bool _211 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _110 = in.m_48.w;
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
        out.m_51.x = 0.0;
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
        float _3494 = as_type<float>(_131);
        out.gl_Position.z = _3494;
    }
    if (!_119)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _135 = in.m_53.w;
    bool _137 = _135 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _139 = isnan(_135);
    bool _141 = _137 || _139;
    bool _143 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _145 = _141 || _143;
    float _147 = -_135;
    float _149 = _147 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _151 = _149;
    if (_145)
    {
        float _153 = float(_115);
        _125 = _153;
    }
    float _155 = _125;
    bool _157 = _149 >= _155;
    bool _159 = !_145;
    bool _161 = _157 || _159;
    float _163 = _155;
    if (_161)
    {
        _163 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _165 = _163;
    if (_161)
    {
        out.m_51.x = 0.0;
    }
    if (_161)
    {
        float _167 = _165 * 5.0;
        _133 = as_type<int>(_167);
    }
    int _169 = _133;
    if (_161)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3564 = as_type<float>(_169);
        out.gl_Position.z = _3564;
    }
    if (_161)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _171 = as_type<float>(int(gl_VertexIndex));
    bool _173 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _175 = as_type<int>(_171) & 1;
    bool _177 = _175 != 0;
    int _179 = as_type<int>(_171) & 2;
    bool _181 = _179 != 0;
    bool _183 = !_177;
    float _185 = _183 ? (-0.5) : 0.5;
    bool _187 = !_181;
    float _189 = _187 ? (-0.5) : 0.5;
    bool _191 = !_173;
    float _209;
    if (!_191)
    {
        float _193 = in.m_58.x;
        float _195 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _197 = _193 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _199 = fma(_197, (*spvDescriptorSet0.vp_c9)._m0[12].x, _149);
        float _201 = _199 * _195;
        float _203 = floor(_201);
        float _205 = -_203;
        float _207 = _201 + _205;
        _209 = _207;
        _211 = true;
    }
    else
    {
        float _213 = float(_115);
        float _215 = 1.0 / _213;
        float _217 = _149 * _215;
        _209 = _217;
    }
    _211 = false;
    float _219 = _209;
    float _221 = in.m_58.x;
    float _223 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _225 = log2(_223);
    float _227 = in.m_58.y;
    float _229 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _231 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _229;
    float _233 = in.m_58.z;
    int _235 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _237 = _235 != 0;
    float _239 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _241 = 1.0 / _231;
    float _243 = float(_115);
    float _245 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _247 = _225 * _149;
    float _249 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _251 = _219 + _249;
    float _253 = 1.0 / _243;
    float _255 = _221 * 2.0;
    float _257 = _221 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _259 = _251 * _241;
    float _261 = _227 * 2.0;
    float _263 = floor(_255);
    float _265 = -_239;
    float _267 = fma(_257, 2.0, _265);
    float _269 = _227 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _271 = _221 + _233;
    float _273 = _221 + _227;
    float _275 = fma(_269, -2.0, _245);
    float _277 = _271 + (-1.0);
    float _279 = floor(_261);
    float _281 = _233 * 2.0;
    int _283 = as_type<int>(_271);
    float _285 = _243;
    if (_237)
    {
        _283 = 0;
    }
    int _287 = _283;
    float _289 = fma(_277, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _291 = _287;
    if (!_237)
    {
        _291 = 1;
    }
    int _293 = _291;
    float _295 = _273 + (-1.0);
    float _297 = -_149;
    float _299 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[76].x, _267);
    float _301 = floor(_281);
    bool _303 = _263 >= 0.0;
    bool _305 = isnan(_263);
    bool _307 = _303 || _305;
    bool _309 = isnan(0.0);
    bool _311 = _307 || _309;
    float _313 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[76].y, _275);
    bool _315 = _293 != 1;
    float _317 = _233 + _227;
    int _319 = _311 ? 0 : 1;
    float _321 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _323 = _263 > 0.0;
    float _325 = _317 + (-1.0);
    bool _327 = _279 > 0.0;
    bool _329 = _279 >= 0.0;
    bool _331 = isnan(_279);
    bool _333 = _329 || _331;
    bool _335 = isnan(0.0);
    bool _337 = _333 || _335;
    float _339 = fma(_325, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _341 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _343 = int(_341);
    bool _345 = _301 > 0.0;
    int _347 = _337 ? 0 : 1;
    float _349 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _351 = _301 >= 0.0;
    bool _353 = isnan(_301);
    bool _355 = _351 || _353;
    bool _357 = isnan(0.0);
    bool _359 = _355 || _357;
    int _361 = ~_347;
    int _363 = _361 + 1;
    int _365 = _363 + 1;
    int _367 = _359 ? 0 : 1;
    int _369 = _365;
    float _371 = _325;
    float _373 = _301;
    if (!_327)
    {
        int _375 = ~_347;
        int _377 = _375 + 1;
        _369 = _377;
    }
    int _379 = _369;
    int _381 = ~_367;
    int _383 = _381 + 1;
    int _385 = _383 + 1;
    int _387 = _385;
    if (!_345)
    {
        int _389 = ~_367;
        int _391 = _389 + 1;
        _387 = _391;
    }
    int _393 = _387;
    int _395 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _397 = _395 != 0;
    int _399 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _401 = _399 != 0;
    int _403 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _405 = _403 != 0;
    float _407 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    if (!_315)
    {
        _371 = _233;
    }
    float _409 = _371;
    float _411 = _409;
    if (!_315)
    {
        _373 = _227;
    }
    float _413 = _373;
    float _415 = _413;
    if (_315)
    {
        _411 = _227;
    }
    float _417 = _411;
    float _419 = _417;
    if (_315)
    {
        _415 = _221;
    }
    float _421 = _415;
    bool _423 = !_401;
    int _425 = _423 ? 0 : 1;
    float _427 = fma(_417, (*spvDescriptorSet0.vp_c9)._m0[83].w, _349);
    bool _429 = !_397;
    int _431 = _429 ? 0 : 1;
    float _433 = fma(_421, (*spvDescriptorSet0.vp_c9)._m0[83].z, _407);
    bool _435 = !_405;
    int _437 = _435 ? 0 : 1;
    float _439 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[82].w, _427);
    int _441 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _443 = _441 != 0;
    int _445 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _447 = _445 != 0;
    int _449 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _451 = _449 != 0;
    float _453 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[82].z, _433);
    if (!_315)
    {
        _419 = _227;
    }
    float _455 = _419;
    float _457 = _455;
    if (!_315)
    {
        _285 = _233;
    }
    float _459 = _285;
    float _461 = _459;
    if (_315)
    {
        _457 = _221;
    }
    float _463 = _457;
    if (_315)
    {
        _461 = _227;
    }
    float _465 = _461;
    float _467 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _469 = _463 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _471 = !_447;
    int _473 = _471 ? 0 : 1;
    float _475 = _465 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _477 = float(_343);
    float _479 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _481 = !_443;
    int _483 = _481 ? 0 : 1;
    float _485 = -_467;
    float _487 = fma(_469, 2.0, _485);
    int _489 = abs(_473);
    float _491 = 1.0 / _477;
    int _493 = ~_319;
    int _495 = _493 + 1;
    int _497 = _495 + 1;
    float _499 = fma(_475, -2.0, _479);
    int _501 = _497;
    if (!_323)
    {
        int _503 = ~_319;
        int _505 = _503 + 1;
        _501 = _505;
    }
    int _507 = _501;
    float _509 = in.m_60.x;
    float _511 = in.m_60.y;
    float _513 = in.m_60.z;
    bool _515 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _517 = isnan(1.0);
    bool _519 = _515 || _517;
    bool _521 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _523 = _519 || _521;
    float _525 = _221 + (-0.5);
    float _527 = float(_507);
    float _529 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _531 = int(_529);
    int _533 = abs(_483);
    float _535 = -_149;
    float _537 = fma(_535, (*spvDescriptorSet0.vp_c9)._m0[81].x, _487);
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _541 = 1.0 + _539;
    float _543 = float(_533);
    float _545 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[81].y, _499);
    float _547 = float(_489);
    float _549 = 1.0 / _541;
    float _551 = float(_393);
    float _553 = _491 * _149;
    bool _555 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _557 = isnan(0.0);
    bool _559 = _555 || _557;
    bool _561 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _563 = _559 || _561;
    float _565 = _547 * _527;
    float _567 = _543 * _551;
    float _569 = exp2(_247);
    float _571 = float(_531);
    float _573 = _567 * (-2.0);
    float _575 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _577 = _565 * (-2.0);
    float _579 = fma(_573, _509, _509);
    float _581 = fma(_321, _573, _321);
    float _583 = 1.0 / _571;
    float _585 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _587 = !_451;
    int _589 = _587 ? 0 : 1;
    float _591 = fma(_221, (*spvDescriptorSet0.vp_c9)._m0[78].z, _575);
    float _593 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[196].x, _579);
    float _595 = fma(_339, _577, _339);
    float _597 = fma(_577, _511, _511);
    float _599 = -_569;
    float _601 = _599 + 1.0;
    float _603 = _253 * _149;
    float _605 = fma(_227, (*spvDescriptorSet0.vp_c9)._m0[78].w, _585);
    int _607 = abs(_589);
    float _609 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[77].z, _591);
    float _611 = _563 ? _601 : 0.0;
    float _613 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[77].w, _605);
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _617 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _615;
    float _619 = _583 * _149;
    if (_523)
    {
        float _621 = _611 * _549;
        _151 = _621;
    }
    float _623 = _151;
    float _625 = _227 + (-0.5);
    float _627 = float(_379);
    float _629 = fma(_581, _623, _593);
    float _631 = float(_607);
    float _633 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _635 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _633;
    float _637 = fma(_625, (*spvDescriptorSet0.vp_c9)._m0[196].y, _597);
    bool _639 = _219 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _641 = isnan(_219);
    bool _643 = _639 || _641;
    bool _645 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _647 = _643 || _645;
    float _649 = float(_647);
    float _651 = fma(_617, _259, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _653 = _631 * _627;
    float _655 = fma(_635, _259, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _657 = fma(_595, _623, _637);
    bool _659 = _219 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _661 = isnan(_219);
    bool _663 = _659 || _661;
    bool _665 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _667 = _663 || _665;
    float _669 = float(_667);
    float _671 = in.m_62.x;
    float _673 = in.m_62.y;
    float _675 = _653 * (-2.0);
    float _677 = -_649;
    float _679 = _677 + 1.0;
    float _681 = _629 * 0.15915493667125701904296875;
    float _683 = in.m_48.x;
    float _685 = in.m_48.y;
    float _687 = in.m_48.z;
    float _689 = fma(_675, _513, _513);
    float _691 = _233 + (-0.5);
    float _693 = _669 * _679;
    float _695 = in.m_64.x;
    float _697 = in.m_64.y;
    float _699 = in.m_64.z;
    float _701 = in.m_64.w;
    float _703 = fma(_289, _675, _289);
    float _705 = fma(_691, (*spvDescriptorSet0.vp_c9)._m0[196].z, _689);
    float _707 = -_669;
    float _709 = _707 + 1.0;
    float _711 = _651 * _693;
    float _713 = _655 * _693;
    float _715 = fma(_703, _623, _705);
    float _717 = _657 * 0.15915493667125701904296875;
    float _719 = fma(_709, (*spvDescriptorSet0.vp_c9)._m0[143].x, _711);
    float _721 = fma(_709, (*spvDescriptorSet0.vp_c9)._m0[143].y, _713);
    float _723 = _715 * 0.15915493667125701904296875;
    float _725 = _681 * 6.283185482025146484375;
    float _727 = sin(_725);
    float _729 = fma(_649, (*spvDescriptorSet0.vp_c9)._m0[144].x, _719);
    float _731 = fma(_649, (*spvDescriptorSet0.vp_c9)._m0[144].y, _721);
    float _733 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _189);
    float _735 = _729 * _671;
    float _737 = _731 * _673;
    float _739 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _185);
    float _741 = _681 * 6.283185482025146484375;
    float _743 = cos(_741);
    float _745 = _735 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _747 = _685 * _697;
    float _749 = _737 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _751 = _717 * 6.283185482025146484375;
    float _753 = sin(_751);
    float _755 = fma(_683, _695, _747);
    float _757 = _745 * _739;
    float _759 = _749 * _733;
    float _761 = in.m_66.x;
    float _763 = in.m_66.y;
    float _765 = in.m_66.z;
    float _767 = in.m_66.w;
    float _769 = fma(_687, _699, _755);
    float _771 = _717 * 6.283185482025146484375;
    float _773 = cos(_771);
    float _775 = _723 * 6.283185482025146484375;
    float _777 = cos(_775);
    float _779 = _727 * _753;
    float _781 = _743 * _753;
    float _783 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _785 = _723 * 6.283185482025146484375;
    float _787 = sin(_785);
    float _789 = _743 * _773;
    float _791 = _727 * _773;
    float _793 = _685 * _763;
    float _795 = _743 * _777;
    float _797 = _727 * _777;
    float _799 = _773 * _777;
    float _801 = _753 * _777;
    float _803 = _795 * _759;
    float _805 = fma(_683, _761, _793);
    float _807 = fma(_787, _789, _779);
    float _809 = -_759;
    float _811 = _787 * _809;
    float _813 = -_791;
    float _815 = fma(_787, _781, _813);
    float _817 = -_781;
    float _819 = fma(_787, _791, _817);
    float _821 = fma(_807, _757, _803);
    float _823 = _797 * _759;
    float _825 = fma(_799, _757, _811);
    float _827 = fma(_787, _779, _789);
    float _829 = fma(_815, _783, _821);
    float _831 = fma(_819, _757, _823);
    float _833 = fma(_801, _783, _825);
    float _835 = fma(_687, _765, _805);
    float _837 = _829 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _839 = fma(_827, _783, _831);
    float _841 = _829 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _843 = _769 + _701;
    float _845 = fma(_833, (*spvDescriptorSet0.vp_c8)._m0[26].x, _837);
    float _847 = _835 + _767;
    float _849 = fma(_833, (*spvDescriptorSet0.vp_c8)._m0[24].x, _841);
    float _851 = fma(_839, (*spvDescriptorSet0.vp_c8)._m0[26].z, _845);
    float _853 = fma(_839, (*spvDescriptorSet0.vp_c8)._m0[24].z, _849);
    float _855 = _851 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _857 = _853 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _859 = _843 + _855;
    float _861 = _847 + _857;
    float _863 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _865 = _859 + _863;
    float _867 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _869 = _861 + _867;
    float _871 = _865 * _865;
    float _873 = fma(_869, _869, _871);
    float _875 = in.m_68.x;
    float _877 = in.m_68.y;
    float _879 = in.m_68.z;
    float _881 = in.m_68.w;
    float _883 = sqrt(_873);
    bool _885 = _883 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _887 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _889 = _883 + _887;
    float _891 = _685 * _877;
    float _893 = _829 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _895 = fma(_683, _875, _891);
    float _897 = fma(_833, (*spvDescriptorSet0.vp_c8)._m0[25].x, _893);
    float _899 = _855;
    float _901 = _875;
    float _903 = _889;
    float _905 = _687;
    float _907 = _895;
    float _909 = _881;
    float _911 = _839;
    float _913 = _865;
    if (_885)
    {
        float _915 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _899 = _915;
    }
    float _917 = _899;
    float _919 = fma(_687, _879, _895);
    float _921 = fma(_839, (*spvDescriptorSet0.vp_c8)._m0[25].z, _897);
    float _923 = _919 + _881;
    float _925 = _921 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _927 = _925;
    if (_885)
    {
        float _929 = rsqrt(_873);
        _901 = _929;
    }
    float _931 = _901;
    float _933 = _923 + _925;
    float _935 = _931;
    if (_885)
    {
        float _937 = _933 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _927 = _937;
    }
    float _939 = _927;
    float _941 = _917;
    float _943 = _939;
    if (_885)
    {
        float _945 = _889 * _917;
        _903 = _945;
    }
    float _947 = _903;
    if (_885)
    {
        float _949 = _947 * 0.15915493667125701904296875;
        _941 = _949;
    }
    float _951 = _941;
    float _953 = _947;
    if (_885)
    {
        float _955 = _951 * 6.283185482025146484375;
        float _957 = cos(_955);
        _953 = _957;
    }
    float _959 = _953;
    float _961 = _683;
    if (_885)
    {
        float _963 = _951 * 6.283185482025146484375;
        float _965 = sin(_963);
        _961 = _965;
    }
    float _967 = _961;
    if (_885)
    {
        float _969 = _959 + (-1.0);
        _905 = _969;
    }
    float _971 = _905;
    float _973 = _971;
    if (_885)
    {
        float _975 = _971 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _907 = _975;
    }
    float _977 = _907;
    if (!_885)
    {
        _973 = _859;
    }
    float _979 = _973;
    float _981 = _967;
    float _983 = _979;
    if (_885)
    {
        float _985 = fma(_967, _939, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _909 = _985;
    }
    float _987 = _909;
    if (!_885)
    {
        _943 = _933;
    }
    float _989 = _943;
    float _991 = _989;
    if (_885)
    {
        float _993 = fma(_933, _959, _977);
        _991 = _993;
    }
    float _995 = _991;
    if (!_885)
    {
        _981 = _861;
    }
    float _997 = _981;
    float _999 = _997;
    if (_885)
    {
        float _1001 = _931 * _987;
        _935 = _1001;
    }
    float _1003 = _935;
    float _1005 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1007 = _995 + _1005;
    float _1009 = _1007;
    if (_885)
    {
        float _1011 = fma(_869, _1003, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _999 = _1011;
    }
    float _1013 = _999;
    if (_885)
    {
        float _1015 = fma(_865, _1003, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _983 = _1015;
    }
    float _1017 = _983;
    float _1019 = _1007 * _1007;
    float _1021 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1023 = _1013 + _1021;
    float _1025 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1027 = _1017 + _1025;
    float _1029 = fma(_1023, _1023, _1019);
    float _1031 = fma(_1027, _1027, _1029);
    float _1033 = rsqrt(_1031);
    float _1035 = sqrt(_1031);
    float _1037 = _1033 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1039 = _1023 * _1037;
    float _1041 = _1027 * _1037;
    float _1043 = _1039 * _1039;
    float _1045 = _1041 * _1041;
    float _1047 = _1043 + _1045;
    float _1049 = sqrt(_1047);
    bool _1051 = _1049 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1053 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1055 = _1049 + _1053;
    float _1057 = _1033;
    float _1059 = _1047;
    float _1061 = _1055;
    if (_1051)
    {
        float _1063 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1057 = _1063;
    }
    float _1065 = _1057;
    if (_1051)
    {
        float _1067 = rsqrt(_1047);
        _1059 = _1067;
    }
    float _1069 = _1059;
    if (_1051)
    {
        float _1071 = _1055 * _1065;
        _1061 = _1071;
    }
    float _1073 = _1061;
    if (_1051)
    {
        float _1075 = _1073 * 0.15915493667125701904296875;
        _911 = _1075;
    }
    float _1077 = _911;
    float _1079 = _1065;
    float _1081 = _1077;
    if (_1051)
    {
        float _1083 = _1077 * 6.283185482025146484375;
        float _1085 = sin(_1083);
        _1079 = _1085;
    }
    float _1087 = _1079;
    float _1089 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1091 = precise::max(0.0, _1089);
    float _1093 = _1027;
    float _1095 = _1091;
    if (_1051)
    {
        float _1097 = _1077 * 6.283185482025146484375;
        float _1099 = cos(_1097);
        _1093 = _1099;
    }
    float _1101 = _1093;
    float _1103 = -_1037;
    float _1105 = -_1091;
    float _1107 = fma(_1007, _1103, _1105);
    float _1109 = _995 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1111 = _1107;
    if (_1051)
    {
        float _1113 = _1107 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1095 = _1113;
    }
    float _1115 = _1095;
    float _1117 = _1115;
    if (!_1051)
    {
        _1081 = _1043;
    }
    float _1119 = _1081;
    float _1121 = fma(_1013, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1109);
    float _1123 = _1087;
    float _1125 = _1119;
    if (_1051)
    {
        float _1127 = fma(_1087, _1115, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1123 = _1127;
    }
    float _1129 = _1123;
    float _1131 = _1129;
    if (!_1051)
    {
        _1117 = _1045;
    }
    float _1133 = _1117;
    float _1135 = _995 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1137 = _1101;
    float _1139 = _1133;
    if (_1051)
    {
        float _1141 = _1101 + (-1.0);
        _1009 = _1141;
    }
    float _1143 = _1009;
    float _1145 = _1143;
    if (_1051)
    {
        float _1147 = _1069 * _1129;
        _913 = _1147;
    }
    float _1149 = _913;
    if (!_1051)
    {
        _1131 = _1039;
    }
    float _1151 = _1131;
    float _1153 = fma(_1013, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1135);
    float _1155 = _1151;
    if (_1051)
    {
        float _1157 = _1143 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1145 = _1157;
    }
    float _1159 = _1145;
    if (_1051)
    {
        float _1161 = _1039 * _1149;
        _1155 = _1161;
    }
    float _1163 = _1155;
    float _1165 = fma(_1017, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1153);
    if (_1051)
    {
        float _1167 = fma(_1107, _1101, _1159);
        _1111 = _1167;
    }
    float _1169 = _1111;
    if (!_1051)
    {
        _1137 = _1041;
    }
    float _1171 = _1137;
    float _1173 = _1171;
    if (_1051)
    {
        float _1175 = _1163 * _1163;
        _1125 = _1175;
    }
    float _1177 = _1125;
    if (_1051)
    {
        float _1179 = _1041 * _1149;
        _1173 = _1179;
    }
    float _1181 = _1173;
    float _1183 = _1165 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1185 = fma(_1169, _1169, _1177);
    if (_1051)
    {
        float _1187 = _1181 * _1181;
        _1139 = _1187;
    }
    float _1189 = _1139;
    float _1191 = _995 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1193 = fma(_847, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1195 = _1185 + _1189;
    float _1197 = fma(_1013, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1191);
    float _1199 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1201 = fma(_1035, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1199);
    float _1203 = precise::clamp(_1201, 0.0, 1.0);
    float _1205 = rsqrt(_1195);
    float _1207 = fma(_1017, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1197);
    float _1209 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1211 = -_1203;
    float _1213 = _1211 + 1.0;
    float _1215 = _1207 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1217 = floor(_1193);
    float _1219 = _1215 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1221 = fma(_843, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1223 = -_1219;
    float _1225 = fma(_1223, _1209, 1.0);
    float _1227 = _995 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1229 = _1205 * _1163;
    float _1231 = _1205 * _1169;
    float _1233 = fma(_1013, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1227);
    float _1235 = _1205 * _1181;
    float _1237 = abs(_1213);
    float _1239 = log2(_1237);
    float _1241 = _1229 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1243 = fma(_1017, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1233);
    float _1245 = -_1217;
    float _1247 = _1193 + _1245;
    float _1249 = -_1241;
    float _1251 = fma(_1231, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1249);
    float _1253 = _1243 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1255 = _1183 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1257 = floor(_1221);
    float _1259 = -_1235;
    float _1261 = fma(_1259, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1251);
    float _1263 = fma(_1017, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1121);
    float _1265 = fma(_1253, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1255);
    float _1267 = _1183 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1269 = _1263 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1271 = fma(_1215, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1265);
    float _1273 = log2(_1225);
    float _1275 = _1239 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1277 = fma(_1253, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1267);
    float _1279 = fma(_1269, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1271);
    float _1281 = _1231 + 1.0;
    float _1283 = fma(_1215, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1277);
    float _1285 = fma(_1013, 6.2500002968590706586837768554688e-05, 0.5);
    float _1287 = exp2(_1275);
    float _1289 = fma(_1261, -0.5, 0.5);
    float _1291 = fma(_1261, 0.5, 0.5);
    float _1293 = -_1257;
    float _1295 = _1221 + _1293;
    float _1297 = fma(_1269, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1283);
    float _1299 = fma(_1291, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1301 = sqrt(_1289);
    float _1303 = _1183 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1305 = fma(_1291, _1299, -0.212114393711090087890625);
    float _1307 = _1273 * 0.693147182464599609375;
    float _1309 = fma(_1253, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1303);
    float _1311 = fma(_1291, _1305, 1.570728778839111328125);
    float _1313 = _1307 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1315 = 1.0 / _1279;
    float _1317 = fma(_1215, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1309);
    float _1319 = -_1231;
    float _1321 = fma(_1287, _1281, _1319);
    float _1323 = fma(_1269, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1317);
    float _1325 = fma(_1017, 6.2500002968590706586837768554688e-05, 0.5);
    float _1327 = _1301 * 0.636619746685028076171875;
    float _1329 = -_1311;
    float _1331 = fma(_1327, _1329, 1.0);
    float _1333 = fma(_1321, 0.5, 0.5);
    float _1335 = _1297 * _1315;
    float _1337 = _1323 * _1315;
    float _1339 = fma(_1335, 0.5, 0.5);
    float _1341 = fma(_1337, -0.5, 0.5);
    float2 _5400 = float2(_1247, _1295);
    float _1343 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5400, float2(0.0), isnan(_5400)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5400, float2(0.0), isnan(_5400)), level(0.0)).x;
    float3 _5411 = float3(_1339, _1341, _1313);
    float _1345 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5411, float3(0.0), isnan(_5411)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5411, float3(0.0), isnan(_5411)), level(0.0)).x;
    float3 _5422 = float3(_1339, _1341, _1313);
    float4 _1348 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5422, float3(0.0), isnan(_5422)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5422, float3(0.0), isnan(_5422)), level(0.0)).xyzw;
    float _1350 = _1348.x;
    float _1352 = _1348.y;
    float _1354 = _1348.z;
    float _1356 = _1348.w;
    float2 _5438 = float2(_1331, _1333);
    float3 _1360 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5438, float2(0.0), isnan(_5438)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5438, float2(0.0), isnan(_5438)), level(0.0)).xyz;
    float _1362 = _1360.x;
    float _1364 = _1360.y;
    float _1366 = _1360.z;
    float2 _5452 = float2(_1285, _1325);
    float3 _1368 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_5452, float2(0.0), isnan(_5452)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_5452, float2(0.0), isnan(_5452)), level(0.0)).xyz;
    float _1370 = _1368.x;
    float _1372 = _1368.y;
    float _1374 = _1368.z;
    float _1376 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1378 = int(_1376);
    int _1380 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1382 = _1380 != 0;
    float _1384 = -_439;
    float _1386 = _1384 + 1.0;
    int _1388 = abs(_437);
    out.m_70.x = _1013;
    out.m_70.y = _995;
    out.m_70.z = _1017;
    float _1390 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1392 = int(_1390);
    float _1394 = float(uint(_1378));
    float _1396 = trunc(_553);
    int _1398 = int(_1396);
    int _1400 = ~_1378;
    int _1402 = _1400 + 1;
    float _1404 = float(uint(_1392));
    float _1406 = 1.0 / _1394;
    int _1408 = ~_1378;
    int _1410 = _1408 + 1;
    int _1412 = ~_1392;
    int _1414 = _1412 + 1;
    float _1416 = 1.0 / _1404;
    float _1418 = trunc(_619);
    int _1420 = int(_1418);
    int _1422 = as_type<int>(_1406) + (-2);
    float _1424 = float(uint(_1398));
    int _1426 = ~_1392;
    int _1428 = _1426 + 1;
    float _1430 = as_type<float>(_1422) * _1424;
    int _1432 = as_type<int>(_1416) + (-2);
    float _1434 = _1424;
    float _1436 = _1279;
    if (_237)
    {
        _1434 = 1.0;
    }
    float _1438 = _1434;
    float _1440 = _1438;
    if (!_237)
    {
        _1440 = 7.345489978790283203125;
    }
    float _1442 = _1440;
    float _1444 = trunc(_1430);
    float _1446 = precise::max(_1444, 0.0);
    uint _1449 = uint(_1446);
    float _1451 = float(uint(_1420));
    float _1453 = as_type<float>(_1432) * _1451;
    float _1455 = _1442 * _221;
    float _1457 = trunc(_1453);
    float _1459 = precise::max(_1457, 0.0);
    uint _1461 = uint(_1459);
    int _1463 = _1410 * int(_1449);
    int _1465 = _1463 + _1398;
    float _1467 = float(uint(_1465));
    float _1469 = floor(_1455);
    float _1471 = as_type<float>(_1422) * _1467;
    float _1473 = _1467;
    if (_237)
    {
        _1473 = _221;
    }
    float _1475 = _1473;
    int _1477 = _1428 * int(_1461);
    int _1479 = _1477 + _1420;
    float _1481 = _1475;
    if (!_237)
    {
        _1481 = _227;
    }
    float _1483 = _1481;
    float _1485 = trunc(_1471);
    float _1487 = precise::max(_1485, 0.0);
    uint _1489 = uint(_1487);
    float _1491 = float(uint(_1479));
    float _1493 = -_1469;
    float _1495 = _1455 + _1493;
    float _1497 = as_type<float>(_1432) * _1491;
    float _1499 = _1491;
    if (_237)
    {
        _1499 = 1.0;
    }
    float _1501 = _1499;
    float _1503 = _1501;
    if (!_237)
    {
        _1503 = 1.2345600128173828125;
    }
    float _1505 = _1503;
    int _1507 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1509 = _1507 != 0;
    int _1511 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1513 = _1511 != 0;
    int _1515 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1517 = _1515 != 0;
    int _1519 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1521 = _1519 != 0;
    float _1523 = trunc(_1497);
    float _1525 = precise::max(_1523, 0.0);
    uint _1527 = uint(_1525);
    float _1529 = float(_1420);
    float _1531 = _1505 * _1483;
    int _1533 = int(_1449) + int(_1489);
    float _1535 = float(_1378);
    float _1537 = float(_1398);
    int _1539 = _1402 * _1533;
    int _1541 = _1539 + _1398;
    float _1543 = floor(_1531);
    float _1545 = _1495 * _1535;
    bool _1547 = _1537 >= _1535;
    bool _1549 = isnan(_1537);
    bool _1551 = _1547 || _1549;
    bool _1553 = isnan(_1535);
    bool _1555 = _1551 || _1553;
    float _1557 = float(_1555);
    float _1559 = _1535 * _603;
    bool _1561 = uint(_1541) >= uint(_1378);
    int _1563 = int(_1461) + int(_1527);
    float _1565 = trunc(_1557);
    int _1567 = int(_1565);
    float _1569 = float(_1392);
    bool _1571 = !_1561;
    int _1573 = _1571 ? 0 : (-1);
    int _1575 = _1414 * _1563;
    int _1577 = _1575 + _1420;
    bool _1579 = _1529 >= _1569;
    bool _1581 = isnan(_1529);
    bool _1583 = _1579 || _1581;
    bool _1585 = isnan(_1569);
    bool _1587 = _1583 || _1585;
    float _1589 = float(_1587);
    float _1591 = _1569 * _603;
    int _1593 = ~_1533;
    int _1595 = _1593 + _1573;
    int _1597 = _1595 + 1;
    float _1599 = -_1543;
    float _1601 = _1531 + _1599;
    bool _1603 = uint(_1577) >= uint(_1392);
    float _1605 = trunc(_1559);
    int _1607 = int(_1605);
    int _1609 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1611 = _1609 != 0;
    int _1613 = _1378 * _1597;
    int _1615 = _1613 + _1398;
    bool _1617 = !_1603;
    int _1619 = _1617 ? 0 : (-1);
    float _1621 = _1601 * _1569;
    bool _1623 = !_1611;
    int _1625 = _1623 ? 0 : 1;
    int _1627 = ~_1563;
    int _1629 = _1627 + _1619;
    int _1631 = _1629 + 1;
    float _1633 = trunc(_1589);
    int _1635 = int(_1633);
    bool _1637 = _1378 == 0;
    int _1639 = abs(_1625);
    int _1641 = _1392 * _1631;
    int _1643 = _1641 + _1420;
    int _1645 = ~_1567;
    int _1647 = _1645 + 1;
    int _1649 = _1647 + 1;
    bool _1651 = !_1637;
    int _1653 = _1651 ? _1615 : (-1);
    float _1655 = trunc(_1545);
    int _1657 = int(_1655);
    bool _1659 = _1392 == 0;
    int _1661 = _1378 + (-1);
    int _1663 = _1653 * _1649;
    bool _1665 = !_1659;
    int _1667 = _1665 ? _1643 : (-1);
    bool _1669 = !_1513;
    int _1671 = _1669 ? 0 : 1;
    int _1673 = _1567 * _1661;
    int _1675 = _1673 + _1663;
    int _1677 = ~_1635;
    int _1679 = _1677 + 1;
    int _1681 = _1679 + 1;
    float _1683 = trunc(_1591);
    int _1685 = int(_1683);
    int _1687 = abs(_1671);
    int _1689 = abs(_425);
    int _1691 = _1667 * _1681;
    int _1693 = _1392 + (-1);
    int _1695 = _1657 * _1639;
    int _1697 = _1695 + _1398;
    int _1699 = abs(_431);
    int _1701 = _1675 * _1689;
    int _1703 = _1635 * _1693;
    int _1705 = _1703 + _1691;
    int _1707 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1709 = _1707 != 0;
    int _1711 = _1607 * _1699;
    int _1713 = _1711 + _1701;
    int _1715 = _1705 * _1687;
    bool _1717 = !_1382;
    int _1719 = _1717 ? 0 : 1;
    float _1721 = trunc(_1621);
    int _1723 = int(_1721);
    bool _1725 = !_1509;
    int _1727 = _1725 ? 0 : 1;
    int _1729 = _1697 * _1388;
    int _1731 = _1729 + _1713;
    int _1733 = abs(_1719);
    bool _1735 = !_1709;
    int _1737 = _1735 ? 0 : 1;
    int _1739 = abs(_1727);
    int _1741 = _1657 * _1733;
    int _1743 = _1741 + _1731;
    int _1745 = abs(_1737);
    bool _1747 = !_1517;
    int _1749 = _1747 ? 0 : 1;
    bool _1751 = !_1521;
    int _1753 = _1751 ? 0 : 1;
    float _1755 = float(uint(_1743));
    int _1757 = _1685 * _1739;
    int _1759 = _1757 + _1715;
    int _1761 = abs(_1749);
    int _1763 = _1723 * _1745;
    int _1765 = _1763 + _1420;
    int _1767 = abs(_1753);
    float _1769 = as_type<float>(_1422) * _1755;
    float _1771 = float(uint(_1697));
    int _1773 = ~_1392;
    int _1775 = _1773 + 1;
    int _1777 = _1765 * _1761;
    int _1779 = _1777 + _1759;
    float _1781 = trunc(_1769);
    float _1783 = precise::max(_1781, 0.0);
    uint _1785 = uint(_1783);
    float _1787 = as_type<float>(_1422) * _1771;
    int _1789 = ~_1378;
    int _1791 = _1789 + 1;
    int _1793 = _1723 * _1767;
    int _1795 = _1793 + _1779;
    int _1797 = ~_1378;
    int _1799 = _1797 + 1;
    int _1801 = ~_1378;
    int _1803 = _1801 + 1;
    float _1805 = float(uint(_1795));
    float _1807 = trunc(_1787);
    float _1809 = precise::max(_1807, 0.0);
    uint _1811 = uint(_1809);
    float _1813 = float(uint(_1765));
    int _1815 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1817 = _1815 != 0;
    float _1819 = as_type<float>(_1432) * _1805;
    float _1821 = as_type<float>(_1432) * _1813;
    int _1823 = _1799 * int(_1785);
    int _1825 = _1823 + _1743;
    float _1827 = trunc(_1819);
    float _1829 = precise::max(_1827, 0.0);
    uint _1831 = uint(_1829);
    float _1833 = float(uint(_1825));
    int _1835 = _1791 * int(_1811);
    int _1837 = _1835 + _1697;
    float _1839 = as_type<float>(_1422) * _1833;
    float _1841 = trunc(_1839);
    float _1843 = precise::max(_1841, 0.0);
    uint _1845 = uint(_1843);
    float _1847 = float(uint(_1837));
    int _1849 = _1775 * int(_1831);
    int _1851 = _1849 + _1795;
    float _1853 = as_type<float>(_1422) * _1847;
    float _1855 = float(uint(_1851));
    float _1857 = trunc(_1853);
    float _1859 = precise::max(_1857, 0.0);
    uint _1861 = uint(_1859);
    float _1863 = as_type<float>(_1432) * _1855;
    int _1865 = int(_1785) + int(_1845);
    float _1867 = trunc(_1863);
    float _1869 = precise::max(_1867, 0.0);
    uint _1871 = uint(_1869);
    int _1873 = ~_1378;
    int _1875 = _1873 + 1;
    int _1877 = ~_1392;
    int _1879 = _1877 + 1;
    int _1881 = _1803 * _1865;
    int _1883 = _1881 + _1743;
    int _1885 = int(_1811) + int(_1861);
    bool _1887 = uint(_1883) >= uint(_1378);
    float _1889 = trunc(_1821);
    float _1891 = precise::max(_1889, 0.0);
    uint _1893 = uint(_1891);
    int _1895 = ~_1392;
    int _1897 = _1895 + 1;
    bool _1899 = !_1887;
    int _1901 = _1899 ? 0 : (-1);
    int _1903 = int(_1831) + int(_1871);
    int _1905 = ~_1865;
    int _1907 = _1905 + _1901;
    int _1909 = _1907 + 1;
    int _1911 = _1378 * _1909;
    int _1913 = _1911 + _1743;
    int _1915 = _1897 * _1903;
    int _1917 = _1915 + _1795;
    int _1919 = _1875 * _1885;
    int _1921 = _1919 + _1697;
    bool _1923 = !_1637;
    int _1925 = _1923 ? _1913 : (-1);
    bool _1927 = uint(_1917) >= uint(_1392);
    int _1929 = _1879 * int(_1893);
    int _1931 = _1929 + _1765;
    int _1933 = _1925 & 3;
    bool _1935 = _1933 != 0;
    bool _1937 = !_1927;
    int _1939 = _1937 ? 0 : (-1);
    bool _1941 = uint(_1921) >= uint(_1378);
    int _1943 = _1925 & 3;
    bool _1945 = _1943 != 0;
    bool _1947 = _1933 != 3;
    float _1949 = -_1343;
    float _1951 = _1949 + 1.0;
    int _1953 = ~_1903;
    int _1955 = _1953 + _1939;
    int _1957 = _1955 + 1;
    bool _1959 = !_1941;
    int _1961 = _1959 ? 0 : (-1);
    float _1963 = float(uint(_1931));
    int _1965 = _1392 * _1957;
    int _1967 = _1965 + _1795;
    int _1969 = _1945 ? 0 : 1;
    bool _1971 = uint(_1933) >= 2u;
    float _1973 = as_type<float>(_1432) * _1963;
    int _1975 = ~_1885;
    int _1977 = _1975 + _1961;
    int _1979 = _1977 + 1;
    int _1981 = _1971 ? 0 : 1;
    bool _1983 = !_1659;
    int _1985 = _1983 ? _1967 : (-1);
    int _1987 = _1378 * _1979;
    int _1989 = _1987 + _1697;
    bool _1991 = uint(_1933) > 1u;
    float _1993 = trunc(_1973);
    float _1995 = precise::max(_1993, 0.0);
    uint _1997 = uint(_1995);
    int _1999 = ~_1981;
    int _2001 = _1999 + 1;
    int _2003 = _2001 + 1;
    int _2005 = _2003;
    if (_1947)
    {
        int _2007 = ~_1981;
        int _2009 = _2007 + 1;
        _2005 = _2009;
    }
    int _2011 = _2005;
    int _2013 = _1985 & 3;
    bool _2015 = _2013 != 0;
    bool _2017 = !_1817;
    int _2019 = _2017 ? 0 : 1;
    bool _2021 = !_1935;
    int _2023 = _2021 ? 0 : 1;
    bool _2025 = uint(_2013) > 1u;
    int _2027 = _1985 & 3;
    bool _2029 = _2027 != 0;
    int _2031 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2033 = _2031 != 0;
    int _2035 = _2029 ? 0 : 1;
    int _2037 = ~_1969;
    int _2039 = _2037 + 1;
    int _2041 = _2039 + 1;
    bool _2043 = _1933 != 3;
    int _2045 = _2041;
    if (!_1991)
    {
        int _2047 = ~_1969;
        int _2049 = _2047 + 1;
        _2045 = _2049;
    }
    int _2051 = _2045;
    bool _2053 = !_1637;
    int _2055 = _2053 ? _1989 : (-1);
    bool _2057 = !_2033;
    int _2059 = _2057 ? 0 : 1;
    int _2061 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2063 = _2061 != 0;
    int _2065 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2067 = _2065 != 0;
    int _2069 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2071 = _2069 != 0;
    int _2073 = ~_1392;
    int _2075 = _2073 + 1;
    int _2077 = int(_1893) + int(_1997);
    bool _2079 = !_2043;
    int _2081 = _2079 ? 0 : (-1);
    bool _2083 = !_2015;
    int _2085 = _2083 ? 0 : 1;
    int _2087 = _2075 * _2077;
    int _2089 = _2087 + _1765;
    bool _2091 = uint(_2013) >= 2u;
    int _2093 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2095 = _2093 != 0;
    float _2097 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    int _2099 = ~_2035;
    int _2101 = _2099 + 1;
    int _2103 = _2101 + 1;
    int _2105 = _1925 >> 31;
    int _2107 = _2103;
    if (!_2025)
    {
        int _2109 = ~_2035;
        int _2111 = _2109 + 1;
        _2107 = _2111;
    }
    int _2113 = _2107;
    bool _2115 = _2013 != 3;
    int _2117 = _2091 ? 0 : 1;
    bool _2119 = _221 > 0.5;
    float _2121 = _2097 * _221;
    int _2123 = _1985 >> 31;
    float _2125 = _923 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _2127 = _2105 & 3;
    bool _2129 = !_2115;
    int _2131 = _2129 ? 0 : (-1);
    float _2133 = fma(_847, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2125);
    bool _2135 = uint(_2089) >= uint(_1392);
    float _2137 = trunc(_2121);
    int _2139 = int(_2137);
    int _2141 = _2123 & 3;
    int _2143 = _1925 + _2127;
    bool _2145 = !_2135;
    int _2147 = _2145 ? 0 : (-1);
    bool _2149 = _2013 != 3;
    float _2151 = fma(_843, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2133);
    int _2153 = _1985 + _2141;
    float _2155 = _923 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    int _2157 = _2143 >> 2;
    float _2159 = _2151 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    int _2161 = _2153 >> 2;
    float _2163 = fma(_847, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2155);
    int _2165 = _2157 << 4;
    int _2167 = _2165 + 368;
    float _2169 = 1.0 / _2159;
    int _2171 = ~_2077;
    int _2173 = _2171 + _2147;
    int _2175 = _2173 + 1;
    float _2177 = fma(_843, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2163);
    int _2179 = _2161 << 4;
    int _2181 = _2179 + 512;
    uint _2183 = uint(int(uint(_2167) >> uint(2)));
    uint _2185 = uint(int(uint(int(_2183)) >> uint(2)));
    int _2187 = int(_2183) & 3;
    float _2189 = (*spvDescriptorSet0.vp_c9)._m0[int(_2185)][_2187];
    int _2191 = int(_2183) + 1;
    uint _2193 = uint(int(uint(_2191) >> uint(2)));
    int _2195 = _2191 & 3;
    float _2197 = (*spvDescriptorSet0.vp_c9)._m0[int(_2193)][_2195];
    float _2199 = _2177 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    int _2201 = _1392 * _2175;
    int _2203 = _2201 + _1765;
    int _2205 = ~_2117;
    int _2207 = _2205 + 1;
    int _2209 = _2207 + 1;
    float _2211 = in.m_58.w;
    int _2213 = _2209;
    if (_2149)
    {
        int _2215 = ~_2117;
        int _2217 = _2215 + 1;
        _2213 = _2217;
    }
    int _2219 = _2213;
    float _2221 = _2199 + _2159;
    uint _2223 = uint(int(uint(_2181) >> uint(2)));
    uint _2225 = uint(int(uint(int(_2223)) >> uint(2)));
    int _2227 = int(_2223) & 3;
    float _2229 = (*spvDescriptorSet0.vp_c9)._m0[int(_2225)][_2227];
    int _2231 = int(_2223) + 1;
    uint _2233 = uint(int(uint(_2231) >> uint(2)));
    int _2235 = _2231 & 3;
    float _2237 = (*spvDescriptorSet0.vp_c9)._m0[int(_2233)][_2235];
    bool _2239 = !_1659;
    int _2241 = _2239 ? _2203 : (-1);
    float _2243 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _2245 = _2139 << 4;
    int _2247 = _2245 + 1968;
    float _2249 = _2221 * _2169;
    float _2251 = _2249 * 0.5;
    bool _2253 = _227 > 0.5;
    float _2255 = _2243 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2257 = _233 > 0.5;
    int _2259 = _2167 + 8;
    uint _2261 = uint(int(uint(_2259) >> uint(2)));
    uint _2263 = uint(int(uint(int(_2261)) >> uint(2)));
    int _2265 = int(_2261) & 3;
    float _2267 = (*spvDescriptorSet0.vp_c9)._m0[int(_2263)][_2265];
    int _2269 = int(_2261) + 1;
    uint _2271 = uint(int(uint(_2269) >> uint(2)));
    int _2273 = _2269 & 3;
    float _2275 = (*spvDescriptorSet0.vp_c9)._m0[int(_2271)][_2273];
    float _2277 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2279 = int(_2277);
    float _2281 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _2283 = abs(_2023);
    int _2285 = _2181 + 8;
    uint _2287 = uint(int(uint(_2285) >> uint(2)));
    uint _2289 = uint(int(uint(int(_2287)) >> uint(2)));
    int _2291 = int(_2287) & 3;
    float _2293 = (*spvDescriptorSet0.vp_c9)._m0[int(_2289)][_2291];
    int _2295 = int(_2287) + 1;
    uint _2297 = uint(int(uint(_2295) >> uint(2)));
    int _2299 = _2295 & 3;
    float _2301 = (*spvDescriptorSet0.vp_c9)._m0[int(_2297)][_2299];
    float _2303 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2305 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2307 = _2281 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2309 = abs(_2113);
    float _2311 = _2303 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2313 = abs(_2085);
    uint _2315 = uint(int(uint(_2247) >> uint(2)));
    uint _2317 = uint(int(uint(int(_2315)) >> uint(2)));
    int _2319 = int(_2315) & 3;
    float _2321 = (*spvDescriptorSet0.vp_c9)._m0[int(_2317)][_2319];
    int _2323 = int(_2315) + 1;
    uint _2325 = uint(int(uint(_2323) >> uint(2)));
    int _2327 = _2323 & 3;
    float _2329 = (*spvDescriptorSet0.vp_c9)._m0[int(_2325)][_2327];
    out.m_72.x = _2307;
    out.m_72.y = _2311;
    out.m_72.z = _2255;
    out.m_72.w = _2305;
    float _2331 = -_185;
    int _2333 = _2119 ? as_type<int>(_2331) : as_type<int>(_185);
    float _2335 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2337 = fma(_2251, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2335);
    int _2339 = abs(_2051);
    bool _2341 = _2211 > 0.5;
    int _2343 = _2247 + 8;
    uint _2345 = uint(int(uint(_2343) >> uint(2)));
    uint _2347 = uint(int(uint(int(_2345)) >> uint(2)));
    int _2349 = int(_2345) & 3;
    float _2351 = (*spvDescriptorSet0.vp_c9)._m0[int(_2347)][_2349];
    float _2353 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2355 = int(_2353);
    int _2357 = abs(_2019);
    float _2359 = _1183 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2361 = !_2095;
    float _2363 = _2361 ? _185 : as_type<float>(_2333);
    int _2365 = ~_2339;
    int _2367 = _2365 + 1;
    int _2369 = _2367 + 1;
    float _2371 = fma(_1253, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2359);
    int _2373 = ~_2309;
    int _2375 = _2373 + 1;
    int _2377 = _2375 + 1;
    float _2379 = 1.0 / _2337;
    int _2381 = ~_2283;
    int _2383 = _2381 + 1;
    int _2385 = _2383 + 1;
    int _2387 = _2369 * as_type<int>(_2197);
    int _2389 = ~_2313;
    int _2391 = _2389 + 1;
    int _2393 = _2391 + 1;
    float _2395 = fma(_1215, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2371);
    int _2397 = _2377 * as_type<int>(_2237);
    int _2399 = abs(_2219);
    int _2401 = _2385 * as_type<int>(_2189);
    int _2403 = _2401 + _2387;
    int _2405 = abs(_2011);
    int _2407 = _2393 * as_type<int>(_2229);
    int _2409 = _2407 + _2397;
    int _2411 = abs(_2081);
    float _2413 = fma(_1269, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2395);
    int _2415 = ~_2405;
    int _2417 = _2415 + 1;
    int _2419 = _2417 + 1;
    int _2421 = ~_2399;
    int _2423 = _2421 + 1;
    int _2425 = _2423 + 1;
    float _2427 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2429 = _2379 * _2427;
    int _2431 = abs(_2131);
    int _2433 = _2419 * as_type<int>(_2267);
    int _2435 = _2433 + _2403;
    float _2437 = float(uint(_2279));
    float _2439 = abs(_2429);
    float _2441 = log2(_2439);
    int _2443 = ~_2411;
    int _2445 = _2443 + 1;
    int _2447 = _2445 + 1;
    int _2449 = _2425 * as_type<int>(_2293);
    int _2451 = _2449 + _2409;
    int _2453 = ~_2431;
    int _2455 = _2453 + 1;
    int _2457 = _2455 + 1;
    float _2459 = float(uint(_2355));
    int _2461 = _2447 * as_type<int>(_2275);
    int _2463 = _2461 + _2435;
    int _2465 = abs(_2279);
    float _2467 = 1.0 / _2437;
    int _2469 = ~_2357;
    int _2471 = _2469 + 1;
    int _2473 = _2471 + 1;
    float _2475 = _2329 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _2477 = _2457 * as_type<int>(_2301);
    int _2479 = _2477 + _2451;
    int _2481 = abs(_2059);
    float _2483 = _2321 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2485 = float(uint(_2465));
    int _2487 = _2463 * _2473;
    int _2489 = abs(_2355);
    float _2491 = 1.0 / _2459;
    float _2493 = _2351 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2495 = _2441 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _2497 = ~_2481;
    int _2499 = _2497 + 1;
    int _2501 = _2499 + 1;
    int _2503 = _2055 * _2357;
    int _2505 = _2503 + _2487;
    float _2507 = _2483 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2509 = _2475 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2511 = 1.0 / _2485;
    float _2513 = _2493 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2515 = _2479 * _2501;
    float _2517 = float(uint(_2489));
    float _2519 = _795 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2521 = as_type<int>(_2467) + (-2);
    int _2523 = _2241 * _2481;
    int _2525 = _2523 + _2515;
    out.m_74.x = _2507;
    out.m_74.y = _2509;
    out.m_74.z = _2513;
    float _2527 = exp2(_2495);
    float _2529 = _795 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2531 = _795 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2533 = -_787;
    float _2535 = fma(_2533, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2529);
    int _2537 = as_type<int>(_2491) + (-2);
    float _2539 = 1.0 / _2517;
    float _2541 = float(uint(_2525));
    float _2543 = fma(_797, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2535);
    float _2545 = float(uint(_2505));
    float _2547 = -_787;
    float _2549 = fma(_2547, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2519);
    int _2551 = abs(_2505);
    float _2553 = -_787;
    float _2555 = fma(_2553, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2531);
    float _2557 = as_type<float>(_2537) * _2541;
    float _2559 = as_type<float>(_2521) * _2545;
    float _2561 = fma(_2527, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2563 = precise::clamp(_2561, 0.0, 1.0);
    int _2565 = as_type<int>(_2511) + (-2);
    float _2567 = fma(_797, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2549);
    float _2569 = float(uint(_2551));
    float _2571 = trunc(_2559);
    float _2573 = precise::max(_2571, 0.0);
    uint _2575 = uint(_2573);
    float _2577 = fma(_797, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2555);
    int _2579 = ~_2279;
    int _2581 = _2579 + 1;
    float _2583 = _807 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2585 = as_type<float>(_2565) * _2569;
    float _2587 = _807 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2589 = ~_2465;
    int _2591 = _2589 + 1;
    float _2593 = trunc(_2557);
    float _2595 = precise::max(_2593, 0.0);
    uint _2597 = uint(_2595);
    float _2599 = _807 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2601 = as_type<int>(_2539) + (-2);
    float _2603 = fma(_799, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2587);
    int _2605 = abs(_2525);
    float _2607 = fma(_799, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2599);
    float _2609 = _815 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2611 = ~_2355;
    int _2613 = _2611 + 1;
    float _2615 = trunc(_2585);
    float _2617 = precise::max(_2615, 0.0);
    uint _2619 = uint(_2617);
    float _2621 = fma(_801, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2609);
    float _2623 = fma(_799, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2583);
    float _2625 = _815 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2627 = _815 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2629 = float(uint(_2605));
    int _2631 = _2581 * int(_2575);
    int _2633 = _2631 + _2505;
    int _2635 = ~_2489;
    int _2637 = _2635 + 1;
    int _2639 = _2613 * int(_2597);
    int _2641 = _2639 + _2525;
    float _2643 = fma(_801, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2625);
    float _2645 = fma(_801, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2627);
    float _2647 = as_type<float>(_2601) * _2629;
    float _2649 = float(uint(_2633));
    int _2651 = _2591 * int(_2619);
    int _2653 = _2651 + _2551;
    float _2655 = float(uint(_2641));
    float _2657 = fma(_819, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2603);
    float _2659 = trunc(_2647);
    float _2661 = precise::max(_2659, 0.0);
    uint _2663 = uint(_2661);
    float _2665 = float(uint(_2653));
    float _2667 = as_type<float>(_2521) * _2649;
    float _2669 = -_185;
    int _2671 = _2257 ? as_type<int>(_2669) : as_type<int>(_185);
    float _2673 = as_type<float>(_2537) * _2655;
    float _2675 = _185 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2677 = as_type<float>(_2565) * _2665;
    bool _2679 = !_2067;
    float _2681 = _2679 ? _185 : as_type<float>(_2671);
    float _2683 = fma(_819, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2623);
    float _2685 = -_189;
    int _2687 = _2253 ? as_type<int>(_2685) : as_type<int>(_189);
    float _2689 = fma(_819, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2607);
    float _2691 = -_189;
    int _2693 = _2341 ? as_type<int>(_2691) : as_type<int>(_189);
    float _2695 = trunc(_2667);
    float _2697 = precise::max(_2695, 0.0);
    uint _2699 = uint(_2697);
    bool _2701 = !_2063;
    float _2703 = _2701 ? _189 : as_type<float>(_2687);
    float _2705 = fma(_827, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2643);
    bool _2707 = !_2071;
    float _2709 = _2707 ? _189 : as_type<float>(_2693);
    int _2711 = _2637 * int(_2663);
    int _2713 = _2711 + _2605;
    float _2715 = _189 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2717 = fma(_827, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2621);
    float _2719 = fma(_2563, -2.0, 3.0);
    float _2721 = trunc(_2677);
    float _2723 = precise::max(_2721, 0.0);
    uint _2725 = uint(_2723);
    float _2727 = float(uint(_2713));
    float _2729 = _2563 * _2563;
    float _2731 = _2715 * _2543;
    out.m_76.x = _2689;
    out.m_76.y = _2657;
    out.m_76.z = _2683;
    float _2733 = _2715 * _2577;
    float _2735 = as_type<float>(_2601) * _2727;
    float _2737 = _2729 * _2719;
    float _2739 = trunc(_2673);
    float _2741 = precise::max(_2739, 0.0);
    uint _2743 = uint(_2741);
    float _2745 = fma(_2675, _2689, _2731);
    float _2747 = _2715 * _2567;
    int _2749 = int(_2575) + int(_2699);
    float _2751 = -_2737;
    float _2753 = _2751 + 1.0;
    int _2755 = ~_2279;
    int _2757 = _2755 + 1;
    float _2759 = fma(_2675, _2657, _2747);
    int _2761 = ~_2465;
    int _2763 = _2761 + 1;
    float _2765 = trunc(_2735);
    float _2767 = precise::max(_2765, 0.0);
    uint _2769 = uint(_2767);
    int _2771 = int(_2619) + int(_2725);
    int _2773 = _2757 * _2749;
    int _2775 = _2773 + _2505;
    int _2777 = ~_2355;
    int _2779 = _2777 + 1;
    float _2781 = fma(_2675, _2683, _2733);
    int _2783 = ~_2489;
    int _2785 = _2783 + 1;
    int _2787 = _2763 * _2771;
    int _2789 = _2787 + _2551;
    bool _2791 = uint(_2775) >= uint(_2279);
    float _2793 = fma(_827, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2645);
    int _2795 = int(_2597) + int(_2743);
    float _2797 = fma(_2753, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2737);
    float _2799 = _2705 + _2759;
    float _2801 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _2803 = _2779 * _2795;
    int _2805 = _2803 + _2525;
    bool _2807 = uint(_2789) >= uint(_2465);
    int _2809 = int(_2663) + int(_2769);
    bool _2811 = uint(_2805) >= uint(_2355);
    float _2813 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2815 = _2785 * _2809;
    int _2817 = _2815 + _2605;
    bool _2819 = !_2791;
    int _2821 = _2819 ? 0 : (-1);
    bool _2823 = !_2811;
    int _2825 = _2823 ? 0 : (-1);
    int _2827 = ~_2749;
    int _2829 = _2827 + _2821;
    int _2831 = _2829 + 1;
    bool _2833 = uint(_2817) >= uint(_2489);
    float _2835 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2837 = _2505 ^ _2279;
    int _2839 = ~_2795;
    int _2841 = _2839 + _2825;
    int _2843 = _2841 + 1;
    int _2845 = _2279 * _2831;
    int _2847 = _2845 + _2505;
    bool _2849 = _2279 == 0;
    bool _2851 = !_2807;
    int _2853 = _2851 ? 0 : (-1);
    uint _2855 = uint(int(uint(_2837) >> uint(31)));
    int _2857 = _2525 ^ _2355;
    int _2859 = _2355 * _2843;
    int _2861 = _2859 + _2525;
    bool _2863 = !_2849;
    int _2865 = _2863 ? _2847 : (-1);
    float _2867 = fma(_2715, _2715, 1.0);
    int _2869 = ~_2853;
    int _2871 = _2771 + _2869;
    int _2873 = _2871 + 1;
    float _2875 = _2801 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _2877 = ~int(_2855);
    int _2879 = _2877 + 1;
    float _2881 = _2835 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _2883 = !_2833;
    int _2885 = _2883 ? 0 : (-1);
    float _2887 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    uint _2889 = uint(int(uint(_2857) >> uint(31)));
    float _2891 = float(_2865);
    int _2893 = _2873 ^ _2879;
    bool _2895 = _2355 == 0;
    float _2897 = fma(_2875, _2891, _299);
    int _2899 = ~_2885;
    int _2901 = _2809 + _2899;
    int _2903 = _2901 + 1;
    float _2905 = rsqrt(_2867);
    int _2907 = ~int(_2889);
    int _2909 = _2907 + 1;
    int _2911 = ~_2879;
    int _2913 = _2911 + _2893;
    int _2915 = _2913 + 1;
    bool _2917 = _2279 == 0;
    float _2919 = _2887 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _2921 = _2903 ^ _2909;
    bool _2923 = !_2895;
    int _2925 = _2923 ? _2861 : (-1);
    int _2927 = ~_2909;
    int _2929 = _2927 + _2921;
    int _2931 = _2929 + 1;
    float _2933 = _2813 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _2935 = !_2917;
    int _2937 = _2935 ? _2915 : (-1);
    float _2939 = _2363 + 0.5;
    float _2941 = float(_2925);
    float _2943 = _2715 * _2905;
    bool _2945 = _2355 == 0;
    float _2947 = fma(_2875, _2939, _2897);
    float _2949 = float(_2937);
    float _2951 = fma(_2933, _2941, _537);
    bool _2953 = !_2945;
    int _2955 = _2953 ? _2931 : (-1);
    float _2957 = -_2705;
    float _2959 = _2943 * _2957;
    float _2961 = _2681 + 0.5;
    float _2963 = -_313;
    float _2965 = fma(_2881, _2949, _2963);
    float _2967 = float(_2955);
    float _2969 = _2703 + (-0.5);
    float _2971 = fma(_2933, _2961, _2951);
    float _2973 = -_453;
    float _2975 = _2973 + 1.0;
    bool _2977 = _2429 <= 8000.0;
    bool _2979 = isnan(_2429);
    bool _2981 = _2977 || _2979;
    bool _2983 = isnan(8000.0);
    bool _2985 = _2981 || _2983;
    float _2987 = float(_2985);
    float _2989 = -_2881;
    float _2991 = fma(_2989, _2969, _2965);
    float _2993 = -_545;
    float _2995 = fma(_2919, _2967, _2993);
    float _2997 = _2709 + (-0.5);
    float _2999 = -_2717;
    float _3001 = _2943 * _2999;
    float _3003 = -_2975;
    float _3005 = fma(_2681, _3003, _2971);
    float _3007 = -_2793;
    float _3009 = _2943 * _3007;
    float _3011 = -_2919;
    float _3013 = fma(_3011, _2997, _2995);
    float _3015 = fma(_2905, _2543, _3001);
    float _3017 = fma(_2905, _2567, _2959);
    float _3019 = _1239 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3021 = in.m_78.x;
    float _3023 = _2987 * _2797;
    float _3025 = fma(_2905, _2577, _3009);
    float _3027 = -_609;
    float _3029 = _3027 + 1.0;
    float _3031 = exp2(_3019);
    float _3033 = _3023 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_80.x = _3015;
    out.m_80.y = _3017;
    out.m_80.z = _3025;
    float _3035 = -_3029;
    float _3037 = fma(_2363, _3035, _2947);
    float _3039 = _2413 + _1279;
    float _3041 = _1951 * _3033;
    float _3043 = precise::clamp(_3041, 0.0, 1.0);
    out.gl_Position.x = _1297;
    out.gl_Position.y = _1323;
    out.gl_Position.z = _2413;
    out.gl_Position.w = _1279;
    float _3045 = _3039 * 0.5;
    float _3047 = -_613;
    float _3049 = _3047 + 1.0;
    float _3051 = fma(_2709, _1386, _3013);
    float _3053 = _2717 + _2745;
    float _3055 = _2793 + _2781;
    out.m_82.z = _3045;
    out.m_82.w = _1279;
    float _3057 = fma(_2703, _3049, _2991);
    float _3059 = -_3031;
    float _3061 = _3059 + 1.0;
    out.m_84.x = _1370;
    out.m_84.y = _1372;
    out.m_84.z = _1374;
    bool _3063 = _1035 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3065 = isnan(_1035);
    bool _3067 = _3063 || _3065;
    bool _3069 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3071 = _3067 || _3069;
    float _3073 = -_3043;
    float _3075 = fma(_3073, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3077 = _3061 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_86.x = _3037;
    out.m_86.y = _3057;
    out.m_86.z = _3005;
    out.m_86.w = _3051;
    float _3079 = _3075 * _3021;
    float _3081 = _3077 * _1345;
    float _3083 = -_3077;
    float _3085 = _3083 + 1.0;
    out.m_88.x = _3053;
    out.m_88.y = _2799;
    out.m_88.z = _3055;
    float _3087 = _3079 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3089 = _1356 * _3081;
    float _3091 = _1366 * _3081;
    float _3093 = _1356 * _3085;
    float _3095 = _3017;
    float _3097 = _3085;
    float _3099 = _2413;
    float _3101 = _3089;
    float _3103 = _3081;
    if (!_3071)
    {
        _3095 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3105 = _3095;
    float _3107 = fma(_1362, _3089, _1350);
    float _3109 = fma(_1364, _3089, _1352);
    float _3111 = fma(_1356, _3091, _1354);
    out.m_90.x = _3087;
    float _3113 = _3105;
    float _3115 = _3105;
    if (!_3071)
    {
        _3097 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3117 = _3097;
    float _3119 = _3117;
    float _3121 = _3117;
    if (!_3071)
    {
        _1436 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3123 = _1436;
    out.m_92.x = _3107;
    out.m_92.y = _3109;
    out.m_92.z = _3111;
    out.m_92.w = _3093;
    float _3125 = _3123;
    float _3127 = _3123;
    if (!_3071)
    {
        _3099 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3129 = _3099;
    float _3131 = _3129;
    float _3133 = _3129;
    if (!_3071)
    {
        _3101 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3135 = _3101;
    float _3137 = _3135;
    float _3139 = _3135;
    if (!_3071)
    {
        _3103 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3141 = _3103;
    bool _3143 = !_3071;
    float _3145 = _3141;
    float _3147 = _3141;
    if (!_3143)
    {
        bool _3149 = _1035 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3151 = isnan(_1035);
        bool _3153 = _3149 || _3151;
        bool _3155 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3157 = _3153 || _3155;
        if (!_3157)
        {
            float _3159 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3161 = _1035 + _3159;
            float _3163 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3165 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3163;
            float _3167 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3169 = _3167 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3171 = 1.0 / _3165;
            float _3173 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3175 = _3173 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3177 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3179 = _3177 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3181 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3183 = _3181 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3185 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3187 = _3185 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3189 = _3161 * _3171;
            float _3191 = precise::clamp(_3189, 0.0, 1.0);
            float _3193 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3195 = _3193 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3197 = fma(_3191, _3169, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3199 = fma(_3191, _3195, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3201 = fma(_3191, _3175, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3203 = fma(_3191, _3179, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3205 = fma(_3191, _3183, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3207 = fma(_3191, _3187, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3121 = _3201;
            _3139 = _3205;
            _3115 = _3197;
            _3133 = _3203;
            _3127 = _3199;
            _3147 = _3207;
            _3209 = true;
        }
        else
        {
            bool _3211 = _1035 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3213 = isnan(_1035);
            bool _3215 = _3211 || _3213;
            bool _3217 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3219 = _3215 || _3217;
            if (!_3219)
            {
                _3113 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3221 = _3113;
            _3115 = _3221;
            if (!_3219)
            {
                _3119 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3223 = _3119;
            _3121 = _3223;
            if (!_3219)
            {
                _3125 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3225 = _3125;
            _3127 = _3225;
            if (!_3219)
            {
                _3131 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3227 = _3131;
            _3133 = _3227;
            if (!_3219)
            {
                _3137 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3229 = _3137;
            _3139 = _3229;
            if (!_3219)
            {
                _3145 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3231 = _3145;
            bool _3233 = !_3219;
            _3147 = _3231;
            if (!_3233)
            {
                bool _3235 = _1035 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3237 = isnan(_1035);
                bool _3239 = _3235 || _3237;
                bool _3241 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3243 = _3239 || _3241;
                if (!_3243)
                {
                    float _3245 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3247 = _1035 + _3245;
                    float _3249 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3251 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3249;
                    float _3253 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3255 = _3253 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3257 = 1.0 / _3251;
                    float _3259 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3261 = _3259 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3263 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3265 = _3263 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3267 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3269 = _3267 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3271 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3273 = _3271 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3275 = _3247 * _3257;
                    float _3277 = precise::clamp(_3275, 0.0, 1.0);
                    float _3279 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3281 = _3279 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3283 = fma(_3277, _3255, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3285 = fma(_3277, _3281, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3287 = fma(_3277, _3261, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3289 = fma(_3277, _3265, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3291 = fma(_3277, _3269, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3293 = fma(_3277, _3273, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3121 = _3287;
                    _3139 = _3291;
                    _3115 = _3283;
                    _3133 = _3289;
                    _3127 = _3285;
                    _3147 = _3293;
                    _3209 = true;
                }
                else
                {
                    _3121 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3139 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3115 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3133 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3127 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3147 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3209 = false;
    float _3295 = _3121;
    float _3297 = _3139;
    float _3299 = _3115;
    float _3301 = _3133;
    float _3303 = _3127;
    float _3305 = _3147;
    float _3307 = fma(_2799, -0.5, 0.5);
    float _3309 = precise::clamp(_3307, 0.0, 1.0);
    float _3311 = -_3295;
    float _3313 = _3311 + _3297;
    float _3315 = -_3299;
    float _3317 = _3315 + _3301;
    float _3319 = -_3303;
    float _3321 = _3319 + _3305;
    bool _3323 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3325 = fma(_3309, _3313, _3295);
    float _3327 = fma(_3309, _3317, _3299);
    float _3329 = fma(_3309, _3321, _3303);
    float _3331 = _3325 * 0.586610972881317138671875;
    out.m_51.x = 1.0;
    float _3333 = fma(_3327, 0.298911988735198974609375, _3331);
    float _3335 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3337 = fma(_3329, 0.114477999508380889892578125, _3333);
    out.m_90.w = _3335;
    float _3339 = -_3337;
    float _3341 = _3327 + _3339;
    float _3343 = -_3337;
    float _3345 = _3325 + _3343;
    float _3347 = -_3337;
    float _3349 = _3329 + _3347;
    out.m_94.x = 0.0;
    float _3351 = fma(_3341, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3337);
    float _3353 = fma(_3345, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3337);
    float _3355 = fma(_3349, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3337);
    out.m_96.x = _3351;
    out.m_96.y = _3353;
    out.m_96.z = _3355;
    if (!_3323)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3357 = -_995;
    float _3359 = _3357 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3361 = -_1013;
    float _3363 = _3361 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3365 = -_1017;
    float _3367 = _3365 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3369 = _3359 * _3359;
    float _3371 = fma(_3363, _3363, _3369);
    float _3373 = fma(_3367, _3367, _3371);
    float _3375 = sqrt(_3373);
    float _3377 = rsqrt(_3373);
    float _3379 = -_3375;
    float _3381 = _3379 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3383 = _3381 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3385 = precise::clamp(_3383, 0.0, 1.0);
    float _3387 = _3363 * _3377;
    float _3389 = _3359 * _3377;
    float _3391 = abs(_3385);
    float _3393 = log2(_3391);
    float _3395 = _3367 * _3377;
    float _3397 = _3387 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3399 = _2799 * _3389;
    float _3401 = -_3389;
    float _3403 = -_3397;
    float _3405 = fma(_3401, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3403);
    float _3407 = fma(_3053, _3387, _3399);
    float _3409 = -_3395;
    float _3411 = fma(_3409, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3405);
    float _3413 = fma(_3055, _3395, _3407);
    float _3415 = precise::clamp(_3413, 0.0, 1.0);
    float _3417 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3419 = _3411 + _3417;
    float _3421 = _3393 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3423 = _3419 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3425 = precise::clamp(_3423, 0.0, 1.0);
    float _3427 = exp2(_3421);
    float _3429 = _3427 * _3425;
    float _3431 = _3415 * _3429;
    float _3433 = _3431 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3435 = _3431 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3437 = _3431 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_94.x = _3433;
    out.m_94.y = _3435;
    out.m_94.z = _3437;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3209 = false;
    bool _211 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _110 = in.m_48.w;
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
        out.m_51.x = 0.0;
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
        float _3494 = as_type<float>(_131);
        out.gl_Position.z = _3494;
    }
    if (!_119)
    {
        return out;
    }
    float _135 = in.m_53.w;
    bool _137 = _135 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _139 = isnan(_135);
    bool _141 = _137 || _139;
    bool _143 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _145 = _141 || _143;
    float _147 = -_135;
    float _149 = _147 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _151 = _149;
    if (_145)
    {
        float _153 = float(_115);
        _125 = _153;
    }
    float _155 = _125;
    bool _157 = _149 >= _155;
    bool _159 = !_145;
    bool _161 = _157 || _159;
    float _163 = _155;
    if (_161)
    {
        _163 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _165 = _163;
    if (_161)
    {
        out.m_51.x = 0.0;
    }
    if (_161)
    {
        float _167 = _165 * 5.0;
        _133 = as_type<int>(_167);
    }
    int _169 = _133;
    if (_161)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3564 = as_type<float>(_169);
        out.gl_Position.z = _3564;
    }
    if (_161)
    {
        return out;
    }
    float _171 = as_type<float>(int(gl_VertexIndex));
    bool _173 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _175 = as_type<int>(_171) & 1;
    bool _177 = _175 != 0;
    int _179 = as_type<int>(_171) & 2;
    bool _181 = _179 != 0;
    bool _183 = !_177;
    float _185 = _183 ? (-0.5) : 0.5;
    bool _187 = !_181;
    float _189 = _187 ? (-0.5) : 0.5;
    bool _191 = !_173;
    float _209;
    if (!_191)
    {
        float _193 = in.m_58.x;
        float _195 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _197 = _193 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _199 = fma(_197, (*spvDescriptorSet0.vp_c9)._m0[12].x, _149);
        float _201 = _199 * _195;
        float _203 = floor(_201);
        float _205 = -_203;
        float _207 = _201 + _205;
        _209 = _207;
        _211 = true;
    }
    else
    {
        float _213 = float(_115);
        float _215 = 1.0 / _213;
        float _217 = _149 * _215;
        _209 = _217;
    }
    _211 = false;
    float _219 = _209;
    float _221 = in.m_58.x;
    float _223 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _225 = log2(_223);
    float _227 = in.m_58.y;
    float _229 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _231 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _229;
    float _233 = in.m_58.z;
    int _235 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _237 = _235 != 0;
    float _239 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _241 = 1.0 / _231;
    float _243 = float(_115);
    float _245 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _247 = _225 * _149;
    float _249 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _251 = _219 + _249;
    float _253 = 1.0 / _243;
    float _255 = _221 * 2.0;
    float _257 = _221 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _259 = _251 * _241;
    float _261 = _227 * 2.0;
    float _263 = floor(_255);
    float _265 = -_239;
    float _267 = fma(_257, 2.0, _265);
    float _269 = _227 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _271 = _221 + _233;
    float _273 = _221 + _227;
    float _275 = fma(_269, -2.0, _245);
    float _277 = _271 + (-1.0);
    float _279 = floor(_261);
    float _281 = _233 * 2.0;
    int _283 = as_type<int>(_271);
    float _285 = _243;
    if (_237)
    {
        _283 = 0;
    }
    int _287 = _283;
    float _289 = fma(_277, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _291 = _287;
    if (!_237)
    {
        _291 = 1;
    }
    int _293 = _291;
    float _295 = _273 + (-1.0);
    float _297 = -_149;
    float _299 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[76].x, _267);
    float _301 = floor(_281);
    bool _303 = _263 >= 0.0;
    bool _305 = isnan(_263);
    bool _307 = _303 || _305;
    bool _309 = isnan(0.0);
    bool _311 = _307 || _309;
    float _313 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[76].y, _275);
    bool _315 = _293 != 1;
    float _317 = _233 + _227;
    int _319 = _311 ? 0 : 1;
    float _321 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _323 = _263 > 0.0;
    float _325 = _317 + (-1.0);
    bool _327 = _279 > 0.0;
    bool _329 = _279 >= 0.0;
    bool _331 = isnan(_279);
    bool _333 = _329 || _331;
    bool _335 = isnan(0.0);
    bool _337 = _333 || _335;
    float _339 = fma(_325, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _341 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _343 = int(_341);
    bool _345 = _301 > 0.0;
    int _347 = _337 ? 0 : 1;
    float _349 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _351 = _301 >= 0.0;
    bool _353 = isnan(_301);
    bool _355 = _351 || _353;
    bool _357 = isnan(0.0);
    bool _359 = _355 || _357;
    int _361 = ~_347;
    int _363 = _361 + 1;
    int _365 = _363 + 1;
    int _367 = _359 ? 0 : 1;
    int _369 = _365;
    float _371 = _325;
    float _373 = _301;
    if (!_327)
    {
        int _375 = ~_347;
        int _377 = _375 + 1;
        _369 = _377;
    }
    int _379 = _369;
    int _381 = ~_367;
    int _383 = _381 + 1;
    int _385 = _383 + 1;
    int _387 = _385;
    if (!_345)
    {
        int _389 = ~_367;
        int _391 = _389 + 1;
        _387 = _391;
    }
    int _393 = _387;
    int _395 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _397 = _395 != 0;
    int _399 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _401 = _399 != 0;
    int _403 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _405 = _403 != 0;
    float _407 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    if (!_315)
    {
        _371 = _233;
    }
    float _409 = _371;
    float _411 = _409;
    if (!_315)
    {
        _373 = _227;
    }
    float _413 = _373;
    float _415 = _413;
    if (_315)
    {
        _411 = _227;
    }
    float _417 = _411;
    float _419 = _417;
    if (_315)
    {
        _415 = _221;
    }
    float _421 = _415;
    bool _423 = !_401;
    int _425 = _423 ? 0 : 1;
    float _427 = fma(_417, (*spvDescriptorSet0.vp_c9)._m0[83].w, _349);
    bool _429 = !_397;
    int _431 = _429 ? 0 : 1;
    float _433 = fma(_421, (*spvDescriptorSet0.vp_c9)._m0[83].z, _407);
    bool _435 = !_405;
    int _437 = _435 ? 0 : 1;
    float _439 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[82].w, _427);
    int _441 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _443 = _441 != 0;
    int _445 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _447 = _445 != 0;
    int _449 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _451 = _449 != 0;
    float _453 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[82].z, _433);
    if (!_315)
    {
        _419 = _227;
    }
    float _455 = _419;
    float _457 = _455;
    if (!_315)
    {
        _285 = _233;
    }
    float _459 = _285;
    float _461 = _459;
    if (_315)
    {
        _457 = _221;
    }
    float _463 = _457;
    if (_315)
    {
        _461 = _227;
    }
    float _465 = _461;
    float _467 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _469 = _463 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _471 = !_447;
    int _473 = _471 ? 0 : 1;
    float _475 = _465 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _477 = float(_343);
    float _479 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _481 = !_443;
    int _483 = _481 ? 0 : 1;
    float _485 = -_467;
    float _487 = fma(_469, 2.0, _485);
    int _489 = abs(_473);
    float _491 = 1.0 / _477;
    int _493 = ~_319;
    int _495 = _493 + 1;
    int _497 = _495 + 1;
    float _499 = fma(_475, -2.0, _479);
    int _501 = _497;
    if (!_323)
    {
        int _503 = ~_319;
        int _505 = _503 + 1;
        _501 = _505;
    }
    int _507 = _501;
    float _509 = in.m_60.x;
    float _511 = in.m_60.y;
    float _513 = in.m_60.z;
    bool _515 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _517 = isnan(1.0);
    bool _519 = _515 || _517;
    bool _521 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _523 = _519 || _521;
    float _525 = _221 + (-0.5);
    float _527 = float(_507);
    float _529 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _531 = int(_529);
    int _533 = abs(_483);
    float _535 = -_149;
    float _537 = fma(_535, (*spvDescriptorSet0.vp_c9)._m0[81].x, _487);
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _541 = 1.0 + _539;
    float _543 = float(_533);
    float _545 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[81].y, _499);
    float _547 = float(_489);
    float _549 = 1.0 / _541;
    float _551 = float(_393);
    float _553 = _491 * _149;
    bool _555 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _557 = isnan(0.0);
    bool _559 = _555 || _557;
    bool _561 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _563 = _559 || _561;
    float _565 = _547 * _527;
    float _567 = _543 * _551;
    float _569 = exp2(_247);
    float _571 = float(_531);
    float _573 = _567 * (-2.0);
    float _575 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _577 = _565 * (-2.0);
    float _579 = fma(_573, _509, _509);
    float _581 = fma(_321, _573, _321);
    float _583 = 1.0 / _571;
    float _585 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _587 = !_451;
    int _589 = _587 ? 0 : 1;
    float _591 = fma(_221, (*spvDescriptorSet0.vp_c9)._m0[78].z, _575);
    float _593 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[196].x, _579);
    float _595 = fma(_339, _577, _339);
    float _597 = fma(_577, _511, _511);
    float _599 = -_569;
    float _601 = _599 + 1.0;
    float _603 = _253 * _149;
    float _605 = fma(_227, (*spvDescriptorSet0.vp_c9)._m0[78].w, _585);
    int _607 = abs(_589);
    float _609 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[77].z, _591);
    float _611 = _563 ? _601 : 0.0;
    float _613 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[77].w, _605);
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _617 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _615;
    float _619 = _583 * _149;
    if (_523)
    {
        float _621 = _611 * _549;
        _151 = _621;
    }
    float _623 = _151;
    float _625 = _227 + (-0.5);
    float _627 = float(_379);
    float _629 = fma(_581, _623, _593);
    float _631 = float(_607);
    float _633 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _635 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _633;
    float _637 = fma(_625, (*spvDescriptorSet0.vp_c9)._m0[196].y, _597);
    bool _639 = _219 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _641 = isnan(_219);
    bool _643 = _639 || _641;
    bool _645 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _647 = _643 || _645;
    float _649 = float(_647);
    float _651 = fma(_617, _259, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _653 = _631 * _627;
    float _655 = fma(_635, _259, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _657 = fma(_595, _623, _637);
    bool _659 = _219 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _661 = isnan(_219);
    bool _663 = _659 || _661;
    bool _665 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _667 = _663 || _665;
    float _669 = float(_667);
    float _671 = in.m_62.x;
    float _673 = in.m_62.y;
    float _675 = _653 * (-2.0);
    float _677 = -_649;
    float _679 = _677 + 1.0;
    float _681 = _629 * 0.15915493667125701904296875;
    float _683 = in.m_48.x;
    float _685 = in.m_48.y;
    float _687 = in.m_48.z;
    float _689 = fma(_675, _513, _513);
    float _691 = _233 + (-0.5);
    float _693 = _669 * _679;
    float _695 = in.m_64.x;
    float _697 = in.m_64.y;
    float _699 = in.m_64.z;
    float _701 = in.m_64.w;
    float _703 = fma(_289, _675, _289);
    float _705 = fma(_691, (*spvDescriptorSet0.vp_c9)._m0[196].z, _689);
    float _707 = -_669;
    float _709 = _707 + 1.0;
    float _711 = _651 * _693;
    float _713 = _655 * _693;
    float _715 = fma(_703, _623, _705);
    float _717 = _657 * 0.15915493667125701904296875;
    float _719 = fma(_709, (*spvDescriptorSet0.vp_c9)._m0[143].x, _711);
    float _721 = fma(_709, (*spvDescriptorSet0.vp_c9)._m0[143].y, _713);
    float _723 = _715 * 0.15915493667125701904296875;
    float _725 = _681 * 6.283185482025146484375;
    float _727 = sin(_725);
    float _729 = fma(_649, (*spvDescriptorSet0.vp_c9)._m0[144].x, _719);
    float _731 = fma(_649, (*spvDescriptorSet0.vp_c9)._m0[144].y, _721);
    float _733 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _189);
    float _735 = _729 * _671;
    float _737 = _731 * _673;
    float _739 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _185);
    float _741 = _681 * 6.283185482025146484375;
    float _743 = cos(_741);
    float _745 = _735 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _747 = _685 * _697;
    float _749 = _737 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _751 = _717 * 6.283185482025146484375;
    float _753 = sin(_751);
    float _755 = fma(_683, _695, _747);
    float _757 = _745 * _739;
    float _759 = _749 * _733;
    float _761 = in.m_66.x;
    float _763 = in.m_66.y;
    float _765 = in.m_66.z;
    float _767 = in.m_66.w;
    float _769 = fma(_687, _699, _755);
    float _771 = _717 * 6.283185482025146484375;
    float _773 = cos(_771);
    float _775 = _723 * 6.283185482025146484375;
    float _777 = cos(_775);
    float _779 = _727 * _753;
    float _781 = _743 * _753;
    float _783 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _785 = _723 * 6.283185482025146484375;
    float _787 = sin(_785);
    float _789 = _743 * _773;
    float _791 = _727 * _773;
    float _793 = _685 * _763;
    float _795 = _743 * _777;
    float _797 = _727 * _777;
    float _799 = _773 * _777;
    float _801 = _753 * _777;
    float _803 = _795 * _759;
    float _805 = fma(_683, _761, _793);
    float _807 = fma(_787, _789, _779);
    float _809 = -_759;
    float _811 = _787 * _809;
    float _813 = -_791;
    float _815 = fma(_787, _781, _813);
    float _817 = -_781;
    float _819 = fma(_787, _791, _817);
    float _821 = fma(_807, _757, _803);
    float _823 = _797 * _759;
    float _825 = fma(_799, _757, _811);
    float _827 = fma(_787, _779, _789);
    float _829 = fma(_815, _783, _821);
    float _831 = fma(_819, _757, _823);
    float _833 = fma(_801, _783, _825);
    float _835 = fma(_687, _765, _805);
    float _837 = _829 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _839 = fma(_827, _783, _831);
    float _841 = _829 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _843 = _769 + _701;
    float _845 = fma(_833, (*spvDescriptorSet0.vp_c8)._m0[26].x, _837);
    float _847 = _835 + _767;
    float _849 = fma(_833, (*spvDescriptorSet0.vp_c8)._m0[24].x, _841);
    float _851 = fma(_839, (*spvDescriptorSet0.vp_c8)._m0[26].z, _845);
    float _853 = fma(_839, (*spvDescriptorSet0.vp_c8)._m0[24].z, _849);
    float _855 = _851 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _857 = _853 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _859 = _843 + _855;
    float _861 = _847 + _857;
    float _863 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _865 = _859 + _863;
    float _867 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _869 = _861 + _867;
    float _871 = _865 * _865;
    float _873 = fma(_869, _869, _871);
    float _875 = in.m_68.x;
    float _877 = in.m_68.y;
    float _879 = in.m_68.z;
    float _881 = in.m_68.w;
    float _883 = sqrt(_873);
    bool _885 = _883 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _887 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _889 = _883 + _887;
    float _891 = _685 * _877;
    float _893 = _829 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _895 = fma(_683, _875, _891);
    float _897 = fma(_833, (*spvDescriptorSet0.vp_c8)._m0[25].x, _893);
    float _899 = _855;
    float _901 = _875;
    float _903 = _889;
    float _905 = _687;
    float _907 = _895;
    float _909 = _881;
    float _911 = _839;
    float _913 = _865;
    if (_885)
    {
        float _915 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _899 = _915;
    }
    float _917 = _899;
    float _919 = fma(_687, _879, _895);
    float _921 = fma(_839, (*spvDescriptorSet0.vp_c8)._m0[25].z, _897);
    float _923 = _919 + _881;
    float _925 = _921 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _927 = _925;
    if (_885)
    {
        float _929 = rsqrt(_873);
        _901 = _929;
    }
    float _931 = _901;
    float _933 = _923 + _925;
    float _935 = _931;
    if (_885)
    {
        float _937 = _933 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _927 = _937;
    }
    float _939 = _927;
    float _941 = _917;
    float _943 = _939;
    if (_885)
    {
        float _945 = _889 * _917;
        _903 = _945;
    }
    float _947 = _903;
    if (_885)
    {
        float _949 = _947 * 0.15915493667125701904296875;
        _941 = _949;
    }
    float _951 = _941;
    float _953 = _947;
    if (_885)
    {
        float _955 = _951 * 6.283185482025146484375;
        float _957 = cos(_955);
        _953 = _957;
    }
    float _959 = _953;
    float _961 = _683;
    if (_885)
    {
        float _963 = _951 * 6.283185482025146484375;
        float _965 = sin(_963);
        _961 = _965;
    }
    float _967 = _961;
    if (_885)
    {
        float _969 = _959 + (-1.0);
        _905 = _969;
    }
    float _971 = _905;
    float _973 = _971;
    if (_885)
    {
        float _975 = _971 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _907 = _975;
    }
    float _977 = _907;
    if (!_885)
    {
        _973 = _859;
    }
    float _979 = _973;
    float _981 = _967;
    float _983 = _979;
    if (_885)
    {
        float _985 = fma(_967, _939, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _909 = _985;
    }
    float _987 = _909;
    if (!_885)
    {
        _943 = _933;
    }
    float _989 = _943;
    float _991 = _989;
    if (_885)
    {
        float _993 = fma(_933, _959, _977);
        _991 = _993;
    }
    float _995 = _991;
    if (!_885)
    {
        _981 = _861;
    }
    float _997 = _981;
    float _999 = _997;
    if (_885)
    {
        float _1001 = _931 * _987;
        _935 = _1001;
    }
    float _1003 = _935;
    float _1005 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1007 = _995 + _1005;
    float _1009 = _1007;
    if (_885)
    {
        float _1011 = fma(_869, _1003, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _999 = _1011;
    }
    float _1013 = _999;
    if (_885)
    {
        float _1015 = fma(_865, _1003, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _983 = _1015;
    }
    float _1017 = _983;
    float _1019 = _1007 * _1007;
    float _1021 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1023 = _1013 + _1021;
    float _1025 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1027 = _1017 + _1025;
    float _1029 = fma(_1023, _1023, _1019);
    float _1031 = fma(_1027, _1027, _1029);
    float _1033 = rsqrt(_1031);
    float _1035 = sqrt(_1031);
    float _1037 = _1033 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1039 = _1023 * _1037;
    float _1041 = _1027 * _1037;
    float _1043 = _1039 * _1039;
    float _1045 = _1041 * _1041;
    float _1047 = _1043 + _1045;
    float _1049 = sqrt(_1047);
    bool _1051 = _1049 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1053 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1055 = _1049 + _1053;
    float _1057 = _1033;
    float _1059 = _1047;
    float _1061 = _1055;
    if (_1051)
    {
        float _1063 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1057 = _1063;
    }
    float _1065 = _1057;
    if (_1051)
    {
        float _1067 = rsqrt(_1047);
        _1059 = _1067;
    }
    float _1069 = _1059;
    if (_1051)
    {
        float _1071 = _1055 * _1065;
        _1061 = _1071;
    }
    float _1073 = _1061;
    if (_1051)
    {
        float _1075 = _1073 * 0.15915493667125701904296875;
        _911 = _1075;
    }
    float _1077 = _911;
    float _1079 = _1065;
    float _1081 = _1077;
    if (_1051)
    {
        float _1083 = _1077 * 6.283185482025146484375;
        float _1085 = sin(_1083);
        _1079 = _1085;
    }
    float _1087 = _1079;
    float _1089 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1091 = precise::max(0.0, _1089);
    float _1093 = _1027;
    float _1095 = _1091;
    if (_1051)
    {
        float _1097 = _1077 * 6.283185482025146484375;
        float _1099 = cos(_1097);
        _1093 = _1099;
    }
    float _1101 = _1093;
    float _1103 = -_1037;
    float _1105 = -_1091;
    float _1107 = fma(_1007, _1103, _1105);
    float _1109 = _995 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1111 = _1107;
    if (_1051)
    {
        float _1113 = _1107 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1095 = _1113;
    }
    float _1115 = _1095;
    float _1117 = _1115;
    if (!_1051)
    {
        _1081 = _1043;
    }
    float _1119 = _1081;
    float _1121 = fma(_1013, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1109);
    float _1123 = _1087;
    float _1125 = _1119;
    if (_1051)
    {
        float _1127 = fma(_1087, _1115, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1123 = _1127;
    }
    float _1129 = _1123;
    float _1131 = _1129;
    if (!_1051)
    {
        _1117 = _1045;
    }
    float _1133 = _1117;
    float _1135 = _995 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1137 = _1101;
    float _1139 = _1133;
    if (_1051)
    {
        float _1141 = _1101 + (-1.0);
        _1009 = _1141;
    }
    float _1143 = _1009;
    float _1145 = _1143;
    if (_1051)
    {
        float _1147 = _1069 * _1129;
        _913 = _1147;
    }
    float _1149 = _913;
    if (!_1051)
    {
        _1131 = _1039;
    }
    float _1151 = _1131;
    float _1153 = fma(_1013, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1135);
    float _1155 = _1151;
    if (_1051)
    {
        float _1157 = _1143 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1145 = _1157;
    }
    float _1159 = _1145;
    if (_1051)
    {
        float _1161 = _1039 * _1149;
        _1155 = _1161;
    }
    float _1163 = _1155;
    float _1165 = fma(_1017, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1153);
    if (_1051)
    {
        float _1167 = fma(_1107, _1101, _1159);
        _1111 = _1167;
    }
    float _1169 = _1111;
    if (!_1051)
    {
        _1137 = _1041;
    }
    float _1171 = _1137;
    float _1173 = _1171;
    if (_1051)
    {
        float _1175 = _1163 * _1163;
        _1125 = _1175;
    }
    float _1177 = _1125;
    if (_1051)
    {
        float _1179 = _1041 * _1149;
        _1173 = _1179;
    }
    float _1181 = _1173;
    float _1183 = _1165 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1185 = fma(_1169, _1169, _1177);
    if (_1051)
    {
        float _1187 = _1181 * _1181;
        _1139 = _1187;
    }
    float _1189 = _1139;
    float _1191 = _995 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1193 = fma(_847, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1195 = _1185 + _1189;
    float _1197 = fma(_1013, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1191);
    float _1199 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1201 = fma(_1035, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1199);
    float _1203 = precise::clamp(_1201, 0.0, 1.0);
    float _1205 = rsqrt(_1195);
    float _1207 = fma(_1017, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1197);
    float _1209 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1211 = -_1203;
    float _1213 = _1211 + 1.0;
    float _1215 = _1207 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1217 = floor(_1193);
    float _1219 = _1215 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1221 = fma(_843, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1223 = -_1219;
    float _1225 = fma(_1223, _1209, 1.0);
    float _1227 = _995 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1229 = _1205 * _1163;
    float _1231 = _1205 * _1169;
    float _1233 = fma(_1013, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1227);
    float _1235 = _1205 * _1181;
    float _1237 = abs(_1213);
    float _1239 = log2(_1237);
    float _1241 = _1229 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1243 = fma(_1017, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1233);
    float _1245 = -_1217;
    float _1247 = _1193 + _1245;
    float _1249 = -_1241;
    float _1251 = fma(_1231, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1249);
    float _1253 = _1243 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1255 = _1183 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1257 = floor(_1221);
    float _1259 = -_1235;
    float _1261 = fma(_1259, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1251);
    float _1263 = fma(_1017, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1121);
    float _1265 = fma(_1253, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1255);
    float _1267 = _1183 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1269 = _1263 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1271 = fma(_1215, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1265);
    float _1273 = log2(_1225);
    float _1275 = _1239 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1277 = fma(_1253, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1267);
    float _1279 = fma(_1269, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1271);
    float _1281 = _1231 + 1.0;
    float _1283 = fma(_1215, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1277);
    float _1285 = fma(_1013, 6.2500002968590706586837768554688e-05, 0.5);
    float _1287 = exp2(_1275);
    float _1289 = fma(_1261, -0.5, 0.5);
    float _1291 = fma(_1261, 0.5, 0.5);
    float _1293 = -_1257;
    float _1295 = _1221 + _1293;
    float _1297 = fma(_1269, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1283);
    float _1299 = fma(_1291, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1301 = sqrt(_1289);
    float _1303 = _1183 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1305 = fma(_1291, _1299, -0.212114393711090087890625);
    float _1307 = _1273 * 0.693147182464599609375;
    float _1309 = fma(_1253, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1303);
    float _1311 = fma(_1291, _1305, 1.570728778839111328125);
    float _1313 = _1307 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1315 = 1.0 / _1279;
    float _1317 = fma(_1215, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1309);
    float _1319 = -_1231;
    float _1321 = fma(_1287, _1281, _1319);
    float _1323 = fma(_1269, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1317);
    float _1325 = fma(_1017, 6.2500002968590706586837768554688e-05, 0.5);
    float _1327 = _1301 * 0.636619746685028076171875;
    float _1329 = -_1311;
    float _1331 = fma(_1327, _1329, 1.0);
    float _1333 = fma(_1321, 0.5, 0.5);
    float _1335 = _1297 * _1315;
    float _1337 = _1323 * _1315;
    float _1339 = fma(_1335, 0.5, 0.5);
    float _1341 = fma(_1337, -0.5, 0.5);
    float2 _5400 = float2(_1247, _1295);
    float _1343 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5400, float2(0.0), isnan(_5400)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5400, float2(0.0), isnan(_5400)), level(0.0)).x;
    float3 _5411 = float3(_1339, _1341, _1313);
    float _1345 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5411, float3(0.0), isnan(_5411)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5411, float3(0.0), isnan(_5411)), level(0.0)).x;
    float3 _5422 = float3(_1339, _1341, _1313);
    float4 _1348 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5422, float3(0.0), isnan(_5422)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5422, float3(0.0), isnan(_5422)), level(0.0)).xyzw;
    float _1350 = _1348.x;
    float _1352 = _1348.y;
    float _1354 = _1348.z;
    float _1356 = _1348.w;
    float2 _5438 = float2(_1331, _1333);
    float3 _1360 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5438, float2(0.0), isnan(_5438)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5438, float2(0.0), isnan(_5438)), level(0.0)).xyz;
    float _1362 = _1360.x;
    float _1364 = _1360.y;
    float _1366 = _1360.z;
    float2 _5452 = float2(_1285, _1325);
    float3 _1368 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_5452, float2(0.0), isnan(_5452)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_5452, float2(0.0), isnan(_5452)), level(0.0)).xyz;
    float _1370 = _1368.x;
    float _1372 = _1368.y;
    float _1374 = _1368.z;
    float _1376 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1378 = int(_1376);
    int _1380 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1382 = _1380 != 0;
    float _1384 = -_439;
    float _1386 = _1384 + 1.0;
    int _1388 = abs(_437);
    out.m_70.x = _1013;
    out.m_70.y = _995;
    out.m_70.z = _1017;
    float _1390 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1392 = int(_1390);
    float _1394 = float(uint(_1378));
    float _1396 = trunc(_553);
    int _1398 = int(_1396);
    int _1400 = ~_1378;
    int _1402 = _1400 + 1;
    float _1404 = float(uint(_1392));
    float _1406 = 1.0 / _1394;
    int _1408 = ~_1378;
    int _1410 = _1408 + 1;
    int _1412 = ~_1392;
    int _1414 = _1412 + 1;
    float _1416 = 1.0 / _1404;
    float _1418 = trunc(_619);
    int _1420 = int(_1418);
    int _1422 = as_type<int>(_1406) + (-2);
    float _1424 = float(uint(_1398));
    int _1426 = ~_1392;
    int _1428 = _1426 + 1;
    float _1430 = as_type<float>(_1422) * _1424;
    int _1432 = as_type<int>(_1416) + (-2);
    float _1434 = _1424;
    float _1436 = _1279;
    if (_237)
    {
        _1434 = 1.0;
    }
    float _1438 = _1434;
    float _1440 = _1438;
    if (!_237)
    {
        _1440 = 7.345489978790283203125;
    }
    float _1442 = _1440;
    float _1444 = trunc(_1430);
    float _1446 = precise::max(_1444, 0.0);
    uint _1449 = uint(_1446);
    float _1451 = float(uint(_1420));
    float _1453 = as_type<float>(_1432) * _1451;
    float _1455 = _1442 * _221;
    float _1457 = trunc(_1453);
    float _1459 = precise::max(_1457, 0.0);
    uint _1461 = uint(_1459);
    int _1463 = _1410 * int(_1449);
    int _1465 = _1463 + _1398;
    float _1467 = float(uint(_1465));
    float _1469 = floor(_1455);
    float _1471 = as_type<float>(_1422) * _1467;
    float _1473 = _1467;
    if (_237)
    {
        _1473 = _221;
    }
    float _1475 = _1473;
    int _1477 = _1428 * int(_1461);
    int _1479 = _1477 + _1420;
    float _1481 = _1475;
    if (!_237)
    {
        _1481 = _227;
    }
    float _1483 = _1481;
    float _1485 = trunc(_1471);
    float _1487 = precise::max(_1485, 0.0);
    uint _1489 = uint(_1487);
    float _1491 = float(uint(_1479));
    float _1493 = -_1469;
    float _1495 = _1455 + _1493;
    float _1497 = as_type<float>(_1432) * _1491;
    float _1499 = _1491;
    if (_237)
    {
        _1499 = 1.0;
    }
    float _1501 = _1499;
    float _1503 = _1501;
    if (!_237)
    {
        _1503 = 1.2345600128173828125;
    }
    float _1505 = _1503;
    int _1507 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1509 = _1507 != 0;
    int _1511 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1513 = _1511 != 0;
    int _1515 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1517 = _1515 != 0;
    int _1519 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1521 = _1519 != 0;
    float _1523 = trunc(_1497);
    float _1525 = precise::max(_1523, 0.0);
    uint _1527 = uint(_1525);
    float _1529 = float(_1420);
    float _1531 = _1505 * _1483;
    int _1533 = int(_1449) + int(_1489);
    float _1535 = float(_1378);
    float _1537 = float(_1398);
    int _1539 = _1402 * _1533;
    int _1541 = _1539 + _1398;
    float _1543 = floor(_1531);
    float _1545 = _1495 * _1535;
    bool _1547 = _1537 >= _1535;
    bool _1549 = isnan(_1537);
    bool _1551 = _1547 || _1549;
    bool _1553 = isnan(_1535);
    bool _1555 = _1551 || _1553;
    float _1557 = float(_1555);
    float _1559 = _1535 * _603;
    bool _1561 = uint(_1541) >= uint(_1378);
    int _1563 = int(_1461) + int(_1527);
    float _1565 = trunc(_1557);
    int _1567 = int(_1565);
    float _1569 = float(_1392);
    bool _1571 = !_1561;
    int _1573 = _1571 ? 0 : (-1);
    int _1575 = _1414 * _1563;
    int _1577 = _1575 + _1420;
    bool _1579 = _1529 >= _1569;
    bool _1581 = isnan(_1529);
    bool _1583 = _1579 || _1581;
    bool _1585 = isnan(_1569);
    bool _1587 = _1583 || _1585;
    float _1589 = float(_1587);
    float _1591 = _1569 * _603;
    int _1593 = ~_1533;
    int _1595 = _1593 + _1573;
    int _1597 = _1595 + 1;
    float _1599 = -_1543;
    float _1601 = _1531 + _1599;
    bool _1603 = uint(_1577) >= uint(_1392);
    float _1605 = trunc(_1559);
    int _1607 = int(_1605);
    int _1609 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1611 = _1609 != 0;
    int _1613 = _1378 * _1597;
    int _1615 = _1613 + _1398;
    bool _1617 = !_1603;
    int _1619 = _1617 ? 0 : (-1);
    float _1621 = _1601 * _1569;
    bool _1623 = !_1611;
    int _1625 = _1623 ? 0 : 1;
    int _1627 = ~_1563;
    int _1629 = _1627 + _1619;
    int _1631 = _1629 + 1;
    float _1633 = trunc(_1589);
    int _1635 = int(_1633);
    bool _1637 = _1378 == 0;
    int _1639 = abs(_1625);
    int _1641 = _1392 * _1631;
    int _1643 = _1641 + _1420;
    int _1645 = ~_1567;
    int _1647 = _1645 + 1;
    int _1649 = _1647 + 1;
    bool _1651 = !_1637;
    int _1653 = _1651 ? _1615 : (-1);
    float _1655 = trunc(_1545);
    int _1657 = int(_1655);
    bool _1659 = _1392 == 0;
    int _1661 = _1378 + (-1);
    int _1663 = _1653 * _1649;
    bool _1665 = !_1659;
    int _1667 = _1665 ? _1643 : (-1);
    bool _1669 = !_1513;
    int _1671 = _1669 ? 0 : 1;
    int _1673 = _1567 * _1661;
    int _1675 = _1673 + _1663;
    int _1677 = ~_1635;
    int _1679 = _1677 + 1;
    int _1681 = _1679 + 1;
    float _1683 = trunc(_1591);
    int _1685 = int(_1683);
    int _1687 = abs(_1671);
    int _1689 = abs(_425);
    int _1691 = _1667 * _1681;
    int _1693 = _1392 + (-1);
    int _1695 = _1657 * _1639;
    int _1697 = _1695 + _1398;
    int _1699 = abs(_431);
    int _1701 = _1675 * _1689;
    int _1703 = _1635 * _1693;
    int _1705 = _1703 + _1691;
    int _1707 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1709 = _1707 != 0;
    int _1711 = _1607 * _1699;
    int _1713 = _1711 + _1701;
    int _1715 = _1705 * _1687;
    bool _1717 = !_1382;
    int _1719 = _1717 ? 0 : 1;
    float _1721 = trunc(_1621);
    int _1723 = int(_1721);
    bool _1725 = !_1509;
    int _1727 = _1725 ? 0 : 1;
    int _1729 = _1697 * _1388;
    int _1731 = _1729 + _1713;
    int _1733 = abs(_1719);
    bool _1735 = !_1709;
    int _1737 = _1735 ? 0 : 1;
    int _1739 = abs(_1727);
    int _1741 = _1657 * _1733;
    int _1743 = _1741 + _1731;
    int _1745 = abs(_1737);
    bool _1747 = !_1517;
    int _1749 = _1747 ? 0 : 1;
    bool _1751 = !_1521;
    int _1753 = _1751 ? 0 : 1;
    float _1755 = float(uint(_1743));
    int _1757 = _1685 * _1739;
    int _1759 = _1757 + _1715;
    int _1761 = abs(_1749);
    int _1763 = _1723 * _1745;
    int _1765 = _1763 + _1420;
    int _1767 = abs(_1753);
    float _1769 = as_type<float>(_1422) * _1755;
    float _1771 = float(uint(_1697));
    int _1773 = ~_1392;
    int _1775 = _1773 + 1;
    int _1777 = _1765 * _1761;
    int _1779 = _1777 + _1759;
    float _1781 = trunc(_1769);
    float _1783 = precise::max(_1781, 0.0);
    uint _1785 = uint(_1783);
    float _1787 = as_type<float>(_1422) * _1771;
    int _1789 = ~_1378;
    int _1791 = _1789 + 1;
    int _1793 = _1723 * _1767;
    int _1795 = _1793 + _1779;
    int _1797 = ~_1378;
    int _1799 = _1797 + 1;
    int _1801 = ~_1378;
    int _1803 = _1801 + 1;
    float _1805 = float(uint(_1795));
    float _1807 = trunc(_1787);
    float _1809 = precise::max(_1807, 0.0);
    uint _1811 = uint(_1809);
    float _1813 = float(uint(_1765));
    int _1815 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1817 = _1815 != 0;
    float _1819 = as_type<float>(_1432) * _1805;
    float _1821 = as_type<float>(_1432) * _1813;
    int _1823 = _1799 * int(_1785);
    int _1825 = _1823 + _1743;
    float _1827 = trunc(_1819);
    float _1829 = precise::max(_1827, 0.0);
    uint _1831 = uint(_1829);
    float _1833 = float(uint(_1825));
    int _1835 = _1791 * int(_1811);
    int _1837 = _1835 + _1697;
    float _1839 = as_type<float>(_1422) * _1833;
    float _1841 = trunc(_1839);
    float _1843 = precise::max(_1841, 0.0);
    uint _1845 = uint(_1843);
    float _1847 = float(uint(_1837));
    int _1849 = _1775 * int(_1831);
    int _1851 = _1849 + _1795;
    float _1853 = as_type<float>(_1422) * _1847;
    float _1855 = float(uint(_1851));
    float _1857 = trunc(_1853);
    float _1859 = precise::max(_1857, 0.0);
    uint _1861 = uint(_1859);
    float _1863 = as_type<float>(_1432) * _1855;
    int _1865 = int(_1785) + int(_1845);
    float _1867 = trunc(_1863);
    float _1869 = precise::max(_1867, 0.0);
    uint _1871 = uint(_1869);
    int _1873 = ~_1378;
    int _1875 = _1873 + 1;
    int _1877 = ~_1392;
    int _1879 = _1877 + 1;
    int _1881 = _1803 * _1865;
    int _1883 = _1881 + _1743;
    int _1885 = int(_1811) + int(_1861);
    bool _1887 = uint(_1883) >= uint(_1378);
    float _1889 = trunc(_1821);
    float _1891 = precise::max(_1889, 0.0);
    uint _1893 = uint(_1891);
    int _1895 = ~_1392;
    int _1897 = _1895 + 1;
    bool _1899 = !_1887;
    int _1901 = _1899 ? 0 : (-1);
    int _1903 = int(_1831) + int(_1871);
    int _1905 = ~_1865;
    int _1907 = _1905 + _1901;
    int _1909 = _1907 + 1;
    int _1911 = _1378 * _1909;
    int _1913 = _1911 + _1743;
    int _1915 = _1897 * _1903;
    int _1917 = _1915 + _1795;
    int _1919 = _1875 * _1885;
    int _1921 = _1919 + _1697;
    bool _1923 = !_1637;
    int _1925 = _1923 ? _1913 : (-1);
    bool _1927 = uint(_1917) >= uint(_1392);
    int _1929 = _1879 * int(_1893);
    int _1931 = _1929 + _1765;
    int _1933 = _1925 & 3;
    bool _1935 = _1933 != 0;
    bool _1937 = !_1927;
    int _1939 = _1937 ? 0 : (-1);
    bool _1941 = uint(_1921) >= uint(_1378);
    int _1943 = _1925 & 3;
    bool _1945 = _1943 != 0;
    bool _1947 = _1933 != 3;
    float _1949 = -_1343;
    float _1951 = _1949 + 1.0;
    int _1953 = ~_1903;
    int _1955 = _1953 + _1939;
    int _1957 = _1955 + 1;
    bool _1959 = !_1941;
    int _1961 = _1959 ? 0 : (-1);
    float _1963 = float(uint(_1931));
    int _1965 = _1392 * _1957;
    int _1967 = _1965 + _1795;
    int _1969 = _1945 ? 0 : 1;
    bool _1971 = uint(_1933) >= 2u;
    float _1973 = as_type<float>(_1432) * _1963;
    int _1975 = ~_1885;
    int _1977 = _1975 + _1961;
    int _1979 = _1977 + 1;
    int _1981 = _1971 ? 0 : 1;
    bool _1983 = !_1659;
    int _1985 = _1983 ? _1967 : (-1);
    int _1987 = _1378 * _1979;
    int _1989 = _1987 + _1697;
    bool _1991 = uint(_1933) > 1u;
    float _1993 = trunc(_1973);
    float _1995 = precise::max(_1993, 0.0);
    uint _1997 = uint(_1995);
    int _1999 = ~_1981;
    int _2001 = _1999 + 1;
    int _2003 = _2001 + 1;
    int _2005 = _2003;
    if (_1947)
    {
        int _2007 = ~_1981;
        int _2009 = _2007 + 1;
        _2005 = _2009;
    }
    int _2011 = _2005;
    int _2013 = _1985 & 3;
    bool _2015 = _2013 != 0;
    bool _2017 = !_1817;
    int _2019 = _2017 ? 0 : 1;
    bool _2021 = !_1935;
    int _2023 = _2021 ? 0 : 1;
    bool _2025 = uint(_2013) > 1u;
    int _2027 = _1985 & 3;
    bool _2029 = _2027 != 0;
    int _2031 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2033 = _2031 != 0;
    int _2035 = _2029 ? 0 : 1;
    int _2037 = ~_1969;
    int _2039 = _2037 + 1;
    int _2041 = _2039 + 1;
    bool _2043 = _1933 != 3;
    int _2045 = _2041;
    if (!_1991)
    {
        int _2047 = ~_1969;
        int _2049 = _2047 + 1;
        _2045 = _2049;
    }
    int _2051 = _2045;
    bool _2053 = !_1637;
    int _2055 = _2053 ? _1989 : (-1);
    bool _2057 = !_2033;
    int _2059 = _2057 ? 0 : 1;
    int _2061 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2063 = _2061 != 0;
    int _2065 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2067 = _2065 != 0;
    int _2069 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2071 = _2069 != 0;
    int _2073 = ~_1392;
    int _2075 = _2073 + 1;
    int _2077 = int(_1893) + int(_1997);
    bool _2079 = !_2043;
    int _2081 = _2079 ? 0 : (-1);
    bool _2083 = !_2015;
    int _2085 = _2083 ? 0 : 1;
    int _2087 = _2075 * _2077;
    int _2089 = _2087 + _1765;
    bool _2091 = uint(_2013) >= 2u;
    int _2093 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2095 = _2093 != 0;
    float _2097 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    int _2099 = ~_2035;
    int _2101 = _2099 + 1;
    int _2103 = _2101 + 1;
    int _2105 = _1925 >> 31;
    int _2107 = _2103;
    if (!_2025)
    {
        int _2109 = ~_2035;
        int _2111 = _2109 + 1;
        _2107 = _2111;
    }
    int _2113 = _2107;
    bool _2115 = _2013 != 3;
    int _2117 = _2091 ? 0 : 1;
    bool _2119 = _221 > 0.5;
    float _2121 = _2097 * _221;
    int _2123 = _1985 >> 31;
    float _2125 = _923 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _2127 = _2105 & 3;
    bool _2129 = !_2115;
    int _2131 = _2129 ? 0 : (-1);
    float _2133 = fma(_847, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2125);
    bool _2135 = uint(_2089) >= uint(_1392);
    float _2137 = trunc(_2121);
    int _2139 = int(_2137);
    int _2141 = _2123 & 3;
    int _2143 = _1925 + _2127;
    bool _2145 = !_2135;
    int _2147 = _2145 ? 0 : (-1);
    bool _2149 = _2013 != 3;
    float _2151 = fma(_843, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2133);
    int _2153 = _1985 + _2141;
    float _2155 = _923 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    int _2157 = _2143 >> 2;
    float _2159 = _2151 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    int _2161 = _2153 >> 2;
    float _2163 = fma(_847, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2155);
    int _2165 = _2157 << 4;
    int _2167 = _2165 + 368;
    float _2169 = 1.0 / _2159;
    int _2171 = ~_2077;
    int _2173 = _2171 + _2147;
    int _2175 = _2173 + 1;
    float _2177 = fma(_843, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2163);
    int _2179 = _2161 << 4;
    int _2181 = _2179 + 512;
    uint _2183 = uint(int(uint(_2167) >> uint(2)));
    uint _2185 = uint(int(uint(int(_2183)) >> uint(2)));
    int _2187 = int(_2183) & 3;
    float _2189 = (*spvDescriptorSet0.vp_c9)._m0[int(_2185)][_2187];
    int _2191 = int(_2183) + 1;
    uint _2193 = uint(int(uint(_2191) >> uint(2)));
    int _2195 = _2191 & 3;
    float _2197 = (*spvDescriptorSet0.vp_c9)._m0[int(_2193)][_2195];
    float _2199 = _2177 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    int _2201 = _1392 * _2175;
    int _2203 = _2201 + _1765;
    int _2205 = ~_2117;
    int _2207 = _2205 + 1;
    int _2209 = _2207 + 1;
    float _2211 = in.m_58.w;
    int _2213 = _2209;
    if (_2149)
    {
        int _2215 = ~_2117;
        int _2217 = _2215 + 1;
        _2213 = _2217;
    }
    int _2219 = _2213;
    float _2221 = _2199 + _2159;
    uint _2223 = uint(int(uint(_2181) >> uint(2)));
    uint _2225 = uint(int(uint(int(_2223)) >> uint(2)));
    int _2227 = int(_2223) & 3;
    float _2229 = (*spvDescriptorSet0.vp_c9)._m0[int(_2225)][_2227];
    int _2231 = int(_2223) + 1;
    uint _2233 = uint(int(uint(_2231) >> uint(2)));
    int _2235 = _2231 & 3;
    float _2237 = (*spvDescriptorSet0.vp_c9)._m0[int(_2233)][_2235];
    bool _2239 = !_1659;
    int _2241 = _2239 ? _2203 : (-1);
    float _2243 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _2245 = _2139 << 4;
    int _2247 = _2245 + 1968;
    float _2249 = _2221 * _2169;
    float _2251 = _2249 * 0.5;
    bool _2253 = _227 > 0.5;
    float _2255 = _2243 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2257 = _233 > 0.5;
    int _2259 = _2167 + 8;
    uint _2261 = uint(int(uint(_2259) >> uint(2)));
    uint _2263 = uint(int(uint(int(_2261)) >> uint(2)));
    int _2265 = int(_2261) & 3;
    float _2267 = (*spvDescriptorSet0.vp_c9)._m0[int(_2263)][_2265];
    int _2269 = int(_2261) + 1;
    uint _2271 = uint(int(uint(_2269) >> uint(2)));
    int _2273 = _2269 & 3;
    float _2275 = (*spvDescriptorSet0.vp_c9)._m0[int(_2271)][_2273];
    float _2277 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2279 = int(_2277);
    float _2281 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _2283 = abs(_2023);
    int _2285 = _2181 + 8;
    uint _2287 = uint(int(uint(_2285) >> uint(2)));
    uint _2289 = uint(int(uint(int(_2287)) >> uint(2)));
    int _2291 = int(_2287) & 3;
    float _2293 = (*spvDescriptorSet0.vp_c9)._m0[int(_2289)][_2291];
    int _2295 = int(_2287) + 1;
    uint _2297 = uint(int(uint(_2295) >> uint(2)));
    int _2299 = _2295 & 3;
    float _2301 = (*spvDescriptorSet0.vp_c9)._m0[int(_2297)][_2299];
    float _2303 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2305 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2307 = _2281 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2309 = abs(_2113);
    float _2311 = _2303 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2313 = abs(_2085);
    uint _2315 = uint(int(uint(_2247) >> uint(2)));
    uint _2317 = uint(int(uint(int(_2315)) >> uint(2)));
    int _2319 = int(_2315) & 3;
    float _2321 = (*spvDescriptorSet0.vp_c9)._m0[int(_2317)][_2319];
    int _2323 = int(_2315) + 1;
    uint _2325 = uint(int(uint(_2323) >> uint(2)));
    int _2327 = _2323 & 3;
    float _2329 = (*spvDescriptorSet0.vp_c9)._m0[int(_2325)][_2327];
    out.m_72.x = _2307;
    out.m_72.y = _2311;
    out.m_72.z = _2255;
    out.m_72.w = _2305;
    float _2331 = -_185;
    int _2333 = _2119 ? as_type<int>(_2331) : as_type<int>(_185);
    float _2335 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2337 = fma(_2251, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2335);
    int _2339 = abs(_2051);
    bool _2341 = _2211 > 0.5;
    int _2343 = _2247 + 8;
    uint _2345 = uint(int(uint(_2343) >> uint(2)));
    uint _2347 = uint(int(uint(int(_2345)) >> uint(2)));
    int _2349 = int(_2345) & 3;
    float _2351 = (*spvDescriptorSet0.vp_c9)._m0[int(_2347)][_2349];
    float _2353 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2355 = int(_2353);
    int _2357 = abs(_2019);
    float _2359 = _1183 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2361 = !_2095;
    float _2363 = _2361 ? _185 : as_type<float>(_2333);
    int _2365 = ~_2339;
    int _2367 = _2365 + 1;
    int _2369 = _2367 + 1;
    float _2371 = fma(_1253, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2359);
    int _2373 = ~_2309;
    int _2375 = _2373 + 1;
    int _2377 = _2375 + 1;
    float _2379 = 1.0 / _2337;
    int _2381 = ~_2283;
    int _2383 = _2381 + 1;
    int _2385 = _2383 + 1;
    int _2387 = _2369 * as_type<int>(_2197);
    int _2389 = ~_2313;
    int _2391 = _2389 + 1;
    int _2393 = _2391 + 1;
    float _2395 = fma(_1215, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2371);
    int _2397 = _2377 * as_type<int>(_2237);
    int _2399 = abs(_2219);
    int _2401 = _2385 * as_type<int>(_2189);
    int _2403 = _2401 + _2387;
    int _2405 = abs(_2011);
    int _2407 = _2393 * as_type<int>(_2229);
    int _2409 = _2407 + _2397;
    int _2411 = abs(_2081);
    float _2413 = fma(_1269, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2395);
    int _2415 = ~_2405;
    int _2417 = _2415 + 1;
    int _2419 = _2417 + 1;
    int _2421 = ~_2399;
    int _2423 = _2421 + 1;
    int _2425 = _2423 + 1;
    float _2427 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2429 = _2379 * _2427;
    int _2431 = abs(_2131);
    int _2433 = _2419 * as_type<int>(_2267);
    int _2435 = _2433 + _2403;
    float _2437 = float(uint(_2279));
    float _2439 = abs(_2429);
    float _2441 = log2(_2439);
    int _2443 = ~_2411;
    int _2445 = _2443 + 1;
    int _2447 = _2445 + 1;
    int _2449 = _2425 * as_type<int>(_2293);
    int _2451 = _2449 + _2409;
    int _2453 = ~_2431;
    int _2455 = _2453 + 1;
    int _2457 = _2455 + 1;
    float _2459 = float(uint(_2355));
    int _2461 = _2447 * as_type<int>(_2275);
    int _2463 = _2461 + _2435;
    int _2465 = abs(_2279);
    float _2467 = 1.0 / _2437;
    int _2469 = ~_2357;
    int _2471 = _2469 + 1;
    int _2473 = _2471 + 1;
    float _2475 = _2329 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _2477 = _2457 * as_type<int>(_2301);
    int _2479 = _2477 + _2451;
    int _2481 = abs(_2059);
    float _2483 = _2321 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2485 = float(uint(_2465));
    int _2487 = _2463 * _2473;
    int _2489 = abs(_2355);
    float _2491 = 1.0 / _2459;
    float _2493 = _2351 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2495 = _2441 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _2497 = ~_2481;
    int _2499 = _2497 + 1;
    int _2501 = _2499 + 1;
    int _2503 = _2055 * _2357;
    int _2505 = _2503 + _2487;
    float _2507 = _2483 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2509 = _2475 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2511 = 1.0 / _2485;
    float _2513 = _2493 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2515 = _2479 * _2501;
    float _2517 = float(uint(_2489));
    float _2519 = _795 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2521 = as_type<int>(_2467) + (-2);
    int _2523 = _2241 * _2481;
    int _2525 = _2523 + _2515;
    out.m_74.x = _2507;
    out.m_74.y = _2509;
    out.m_74.z = _2513;
    float _2527 = exp2(_2495);
    float _2529 = _795 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2531 = _795 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2533 = -_787;
    float _2535 = fma(_2533, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2529);
    int _2537 = as_type<int>(_2491) + (-2);
    float _2539 = 1.0 / _2517;
    float _2541 = float(uint(_2525));
    float _2543 = fma(_797, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2535);
    float _2545 = float(uint(_2505));
    float _2547 = -_787;
    float _2549 = fma(_2547, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2519);
    int _2551 = abs(_2505);
    float _2553 = -_787;
    float _2555 = fma(_2553, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2531);
    float _2557 = as_type<float>(_2537) * _2541;
    float _2559 = as_type<float>(_2521) * _2545;
    float _2561 = fma(_2527, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2563 = precise::clamp(_2561, 0.0, 1.0);
    int _2565 = as_type<int>(_2511) + (-2);
    float _2567 = fma(_797, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2549);
    float _2569 = float(uint(_2551));
    float _2571 = trunc(_2559);
    float _2573 = precise::max(_2571, 0.0);
    uint _2575 = uint(_2573);
    float _2577 = fma(_797, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2555);
    int _2579 = ~_2279;
    int _2581 = _2579 + 1;
    float _2583 = _807 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2585 = as_type<float>(_2565) * _2569;
    float _2587 = _807 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2589 = ~_2465;
    int _2591 = _2589 + 1;
    float _2593 = trunc(_2557);
    float _2595 = precise::max(_2593, 0.0);
    uint _2597 = uint(_2595);
    float _2599 = _807 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2601 = as_type<int>(_2539) + (-2);
    float _2603 = fma(_799, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2587);
    int _2605 = abs(_2525);
    float _2607 = fma(_799, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2599);
    float _2609 = _815 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2611 = ~_2355;
    int _2613 = _2611 + 1;
    float _2615 = trunc(_2585);
    float _2617 = precise::max(_2615, 0.0);
    uint _2619 = uint(_2617);
    float _2621 = fma(_801, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2609);
    float _2623 = fma(_799, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2583);
    float _2625 = _815 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2627 = _815 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2629 = float(uint(_2605));
    int _2631 = _2581 * int(_2575);
    int _2633 = _2631 + _2505;
    int _2635 = ~_2489;
    int _2637 = _2635 + 1;
    int _2639 = _2613 * int(_2597);
    int _2641 = _2639 + _2525;
    float _2643 = fma(_801, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2625);
    float _2645 = fma(_801, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2627);
    float _2647 = as_type<float>(_2601) * _2629;
    float _2649 = float(uint(_2633));
    int _2651 = _2591 * int(_2619);
    int _2653 = _2651 + _2551;
    float _2655 = float(uint(_2641));
    float _2657 = fma(_819, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2603);
    float _2659 = trunc(_2647);
    float _2661 = precise::max(_2659, 0.0);
    uint _2663 = uint(_2661);
    float _2665 = float(uint(_2653));
    float _2667 = as_type<float>(_2521) * _2649;
    float _2669 = -_185;
    int _2671 = _2257 ? as_type<int>(_2669) : as_type<int>(_185);
    float _2673 = as_type<float>(_2537) * _2655;
    float _2675 = _185 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2677 = as_type<float>(_2565) * _2665;
    bool _2679 = !_2067;
    float _2681 = _2679 ? _185 : as_type<float>(_2671);
    float _2683 = fma(_819, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2623);
    float _2685 = -_189;
    int _2687 = _2253 ? as_type<int>(_2685) : as_type<int>(_189);
    float _2689 = fma(_819, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2607);
    float _2691 = -_189;
    int _2693 = _2341 ? as_type<int>(_2691) : as_type<int>(_189);
    float _2695 = trunc(_2667);
    float _2697 = precise::max(_2695, 0.0);
    uint _2699 = uint(_2697);
    bool _2701 = !_2063;
    float _2703 = _2701 ? _189 : as_type<float>(_2687);
    float _2705 = fma(_827, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2643);
    bool _2707 = !_2071;
    float _2709 = _2707 ? _189 : as_type<float>(_2693);
    int _2711 = _2637 * int(_2663);
    int _2713 = _2711 + _2605;
    float _2715 = _189 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2717 = fma(_827, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2621);
    float _2719 = fma(_2563, -2.0, 3.0);
    float _2721 = trunc(_2677);
    float _2723 = precise::max(_2721, 0.0);
    uint _2725 = uint(_2723);
    float _2727 = float(uint(_2713));
    float _2729 = _2563 * _2563;
    float _2731 = _2715 * _2543;
    out.m_76.x = _2689;
    out.m_76.y = _2657;
    out.m_76.z = _2683;
    float _2733 = _2715 * _2577;
    float _2735 = as_type<float>(_2601) * _2727;
    float _2737 = _2729 * _2719;
    float _2739 = trunc(_2673);
    float _2741 = precise::max(_2739, 0.0);
    uint _2743 = uint(_2741);
    float _2745 = fma(_2675, _2689, _2731);
    float _2747 = _2715 * _2567;
    int _2749 = int(_2575) + int(_2699);
    float _2751 = -_2737;
    float _2753 = _2751 + 1.0;
    int _2755 = ~_2279;
    int _2757 = _2755 + 1;
    float _2759 = fma(_2675, _2657, _2747);
    int _2761 = ~_2465;
    int _2763 = _2761 + 1;
    float _2765 = trunc(_2735);
    float _2767 = precise::max(_2765, 0.0);
    uint _2769 = uint(_2767);
    int _2771 = int(_2619) + int(_2725);
    int _2773 = _2757 * _2749;
    int _2775 = _2773 + _2505;
    int _2777 = ~_2355;
    int _2779 = _2777 + 1;
    float _2781 = fma(_2675, _2683, _2733);
    int _2783 = ~_2489;
    int _2785 = _2783 + 1;
    int _2787 = _2763 * _2771;
    int _2789 = _2787 + _2551;
    bool _2791 = uint(_2775) >= uint(_2279);
    float _2793 = fma(_827, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2645);
    int _2795 = int(_2597) + int(_2743);
    float _2797 = fma(_2753, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2737);
    float _2799 = _2705 + _2759;
    float _2801 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _2803 = _2779 * _2795;
    int _2805 = _2803 + _2525;
    bool _2807 = uint(_2789) >= uint(_2465);
    int _2809 = int(_2663) + int(_2769);
    bool _2811 = uint(_2805) >= uint(_2355);
    float _2813 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2815 = _2785 * _2809;
    int _2817 = _2815 + _2605;
    bool _2819 = !_2791;
    int _2821 = _2819 ? 0 : (-1);
    bool _2823 = !_2811;
    int _2825 = _2823 ? 0 : (-1);
    int _2827 = ~_2749;
    int _2829 = _2827 + _2821;
    int _2831 = _2829 + 1;
    bool _2833 = uint(_2817) >= uint(_2489);
    float _2835 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2837 = _2505 ^ _2279;
    int _2839 = ~_2795;
    int _2841 = _2839 + _2825;
    int _2843 = _2841 + 1;
    int _2845 = _2279 * _2831;
    int _2847 = _2845 + _2505;
    bool _2849 = _2279 == 0;
    bool _2851 = !_2807;
    int _2853 = _2851 ? 0 : (-1);
    uint _2855 = uint(int(uint(_2837) >> uint(31)));
    int _2857 = _2525 ^ _2355;
    int _2859 = _2355 * _2843;
    int _2861 = _2859 + _2525;
    bool _2863 = !_2849;
    int _2865 = _2863 ? _2847 : (-1);
    float _2867 = fma(_2715, _2715, 1.0);
    int _2869 = ~_2853;
    int _2871 = _2771 + _2869;
    int _2873 = _2871 + 1;
    float _2875 = _2801 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _2877 = ~int(_2855);
    int _2879 = _2877 + 1;
    float _2881 = _2835 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _2883 = !_2833;
    int _2885 = _2883 ? 0 : (-1);
    float _2887 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    uint _2889 = uint(int(uint(_2857) >> uint(31)));
    float _2891 = float(_2865);
    int _2893 = _2873 ^ _2879;
    bool _2895 = _2355 == 0;
    float _2897 = fma(_2875, _2891, _299);
    int _2899 = ~_2885;
    int _2901 = _2809 + _2899;
    int _2903 = _2901 + 1;
    float _2905 = rsqrt(_2867);
    int _2907 = ~int(_2889);
    int _2909 = _2907 + 1;
    int _2911 = ~_2879;
    int _2913 = _2911 + _2893;
    int _2915 = _2913 + 1;
    bool _2917 = _2279 == 0;
    float _2919 = _2887 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _2921 = _2903 ^ _2909;
    bool _2923 = !_2895;
    int _2925 = _2923 ? _2861 : (-1);
    int _2927 = ~_2909;
    int _2929 = _2927 + _2921;
    int _2931 = _2929 + 1;
    float _2933 = _2813 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _2935 = !_2917;
    int _2937 = _2935 ? _2915 : (-1);
    float _2939 = _2363 + 0.5;
    float _2941 = float(_2925);
    float _2943 = _2715 * _2905;
    bool _2945 = _2355 == 0;
    float _2947 = fma(_2875, _2939, _2897);
    float _2949 = float(_2937);
    float _2951 = fma(_2933, _2941, _537);
    bool _2953 = !_2945;
    int _2955 = _2953 ? _2931 : (-1);
    float _2957 = -_2705;
    float _2959 = _2943 * _2957;
    float _2961 = _2681 + 0.5;
    float _2963 = -_313;
    float _2965 = fma(_2881, _2949, _2963);
    float _2967 = float(_2955);
    float _2969 = _2703 + (-0.5);
    float _2971 = fma(_2933, _2961, _2951);
    float _2973 = -_453;
    float _2975 = _2973 + 1.0;
    bool _2977 = _2429 <= 8000.0;
    bool _2979 = isnan(_2429);
    bool _2981 = _2977 || _2979;
    bool _2983 = isnan(8000.0);
    bool _2985 = _2981 || _2983;
    float _2987 = float(_2985);
    float _2989 = -_2881;
    float _2991 = fma(_2989, _2969, _2965);
    float _2993 = -_545;
    float _2995 = fma(_2919, _2967, _2993);
    float _2997 = _2709 + (-0.5);
    float _2999 = -_2717;
    float _3001 = _2943 * _2999;
    float _3003 = -_2975;
    float _3005 = fma(_2681, _3003, _2971);
    float _3007 = -_2793;
    float _3009 = _2943 * _3007;
    float _3011 = -_2919;
    float _3013 = fma(_3011, _2997, _2995);
    float _3015 = fma(_2905, _2543, _3001);
    float _3017 = fma(_2905, _2567, _2959);
    float _3019 = _1239 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3021 = in.m_78.x;
    float _3023 = _2987 * _2797;
    float _3025 = fma(_2905, _2577, _3009);
    float _3027 = -_609;
    float _3029 = _3027 + 1.0;
    float _3031 = exp2(_3019);
    float _3033 = _3023 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_80.x = _3015;
    out.m_80.y = _3017;
    out.m_80.z = _3025;
    float _3035 = -_3029;
    float _3037 = fma(_2363, _3035, _2947);
    float _3039 = _2413 + _1279;
    float _3041 = _1951 * _3033;
    float _3043 = precise::clamp(_3041, 0.0, 1.0);
    out.gl_Position.x = _1297;
    out.gl_Position.y = _1323;
    out.gl_Position.z = _2413;
    out.gl_Position.w = _1279;
    float _3045 = _3039 * 0.5;
    float _3047 = -_613;
    float _3049 = _3047 + 1.0;
    float _3051 = fma(_2709, _1386, _3013);
    float _3053 = _2717 + _2745;
    float _3055 = _2793 + _2781;
    out.m_82.z = _3045;
    out.m_82.w = _1279;
    float _3057 = fma(_2703, _3049, _2991);
    float _3059 = -_3031;
    float _3061 = _3059 + 1.0;
    out.m_84.x = _1370;
    out.m_84.y = _1372;
    out.m_84.z = _1374;
    bool _3063 = _1035 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3065 = isnan(_1035);
    bool _3067 = _3063 || _3065;
    bool _3069 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3071 = _3067 || _3069;
    float _3073 = -_3043;
    float _3075 = fma(_3073, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3077 = _3061 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_86.x = _3037;
    out.m_86.y = _3057;
    out.m_86.z = _3005;
    out.m_86.w = _3051;
    float _3079 = _3075 * _3021;
    float _3081 = _3077 * _1345;
    float _3083 = -_3077;
    float _3085 = _3083 + 1.0;
    out.m_88.x = _3053;
    out.m_88.y = _2799;
    out.m_88.z = _3055;
    float _3087 = _3079 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3089 = _1356 * _3081;
    float _3091 = _1366 * _3081;
    float _3093 = _1356 * _3085;
    float _3095 = _3017;
    float _3097 = _3085;
    float _3099 = _2413;
    float _3101 = _3089;
    float _3103 = _3081;
    if (!_3071)
    {
        _3095 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3105 = _3095;
    float _3107 = fma(_1362, _3089, _1350);
    float _3109 = fma(_1364, _3089, _1352);
    float _3111 = fma(_1356, _3091, _1354);
    out.m_90.x = _3087;
    float _3113 = _3105;
    float _3115 = _3105;
    if (!_3071)
    {
        _3097 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3117 = _3097;
    float _3119 = _3117;
    float _3121 = _3117;
    if (!_3071)
    {
        _1436 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3123 = _1436;
    out.m_92.x = _3107;
    out.m_92.y = _3109;
    out.m_92.z = _3111;
    out.m_92.w = _3093;
    float _3125 = _3123;
    float _3127 = _3123;
    if (!_3071)
    {
        _3099 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3129 = _3099;
    float _3131 = _3129;
    float _3133 = _3129;
    if (!_3071)
    {
        _3101 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3135 = _3101;
    float _3137 = _3135;
    float _3139 = _3135;
    if (!_3071)
    {
        _3103 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3141 = _3103;
    bool _3143 = !_3071;
    float _3145 = _3141;
    float _3147 = _3141;
    if (!_3143)
    {
        bool _3149 = _1035 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3151 = isnan(_1035);
        bool _3153 = _3149 || _3151;
        bool _3155 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3157 = _3153 || _3155;
        if (!_3157)
        {
            float _3159 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3161 = _1035 + _3159;
            float _3163 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3165 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3163;
            float _3167 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3169 = _3167 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3171 = 1.0 / _3165;
            float _3173 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3175 = _3173 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3177 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3179 = _3177 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3181 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3183 = _3181 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3185 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3187 = _3185 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3189 = _3161 * _3171;
            float _3191 = precise::clamp(_3189, 0.0, 1.0);
            float _3193 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3195 = _3193 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3197 = fma(_3191, _3169, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3199 = fma(_3191, _3195, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3201 = fma(_3191, _3175, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3203 = fma(_3191, _3179, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3205 = fma(_3191, _3183, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3207 = fma(_3191, _3187, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3121 = _3201;
            _3139 = _3205;
            _3115 = _3197;
            _3133 = _3203;
            _3127 = _3199;
            _3147 = _3207;
            _3209 = true;
        }
        else
        {
            bool _3211 = _1035 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3213 = isnan(_1035);
            bool _3215 = _3211 || _3213;
            bool _3217 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3219 = _3215 || _3217;
            if (!_3219)
            {
                _3113 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3221 = _3113;
            _3115 = _3221;
            if (!_3219)
            {
                _3119 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3223 = _3119;
            _3121 = _3223;
            if (!_3219)
            {
                _3125 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3225 = _3125;
            _3127 = _3225;
            if (!_3219)
            {
                _3131 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3227 = _3131;
            _3133 = _3227;
            if (!_3219)
            {
                _3137 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3229 = _3137;
            _3139 = _3229;
            if (!_3219)
            {
                _3145 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3231 = _3145;
            bool _3233 = !_3219;
            _3147 = _3231;
            if (!_3233)
            {
                bool _3235 = _1035 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3237 = isnan(_1035);
                bool _3239 = _3235 || _3237;
                bool _3241 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3243 = _3239 || _3241;
                if (!_3243)
                {
                    float _3245 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3247 = _1035 + _3245;
                    float _3249 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3251 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3249;
                    float _3253 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3255 = _3253 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3257 = 1.0 / _3251;
                    float _3259 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3261 = _3259 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3263 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3265 = _3263 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3267 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3269 = _3267 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3271 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3273 = _3271 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3275 = _3247 * _3257;
                    float _3277 = precise::clamp(_3275, 0.0, 1.0);
                    float _3279 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3281 = _3279 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3283 = fma(_3277, _3255, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3285 = fma(_3277, _3281, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3287 = fma(_3277, _3261, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3289 = fma(_3277, _3265, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3291 = fma(_3277, _3269, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3293 = fma(_3277, _3273, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3121 = _3287;
                    _3139 = _3291;
                    _3115 = _3283;
                    _3133 = _3289;
                    _3127 = _3285;
                    _3147 = _3293;
                    _3209 = true;
                }
                else
                {
                    _3121 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3139 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3115 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3133 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3127 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3147 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3209 = false;
    float _3295 = _3121;
    float _3297 = _3139;
    float _3299 = _3115;
    float _3301 = _3133;
    float _3303 = _3127;
    float _3305 = _3147;
    float _3307 = fma(_2799, -0.5, 0.5);
    float _3309 = precise::clamp(_3307, 0.0, 1.0);
    float _3311 = -_3295;
    float _3313 = _3311 + _3297;
    float _3315 = -_3299;
    float _3317 = _3315 + _3301;
    float _3319 = -_3303;
    float _3321 = _3319 + _3305;
    bool _3323 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3325 = fma(_3309, _3313, _3295);
    float _3327 = fma(_3309, _3317, _3299);
    float _3329 = fma(_3309, _3321, _3303);
    float _3331 = _3325 * 0.586610972881317138671875;
    out.m_51.x = 1.0;
    float _3333 = fma(_3327, 0.298911988735198974609375, _3331);
    float _3335 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3337 = fma(_3329, 0.114477999508380889892578125, _3333);
    out.m_90.w = _3335;
    float _3339 = -_3337;
    float _3341 = _3327 + _3339;
    float _3343 = -_3337;
    float _3345 = _3325 + _3343;
    float _3347 = -_3337;
    float _3349 = _3329 + _3347;
    out.m_94.x = 0.0;
    float _3351 = fma(_3341, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3337);
    float _3353 = fma(_3345, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3337);
    float _3355 = fma(_3349, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3337);
    out.m_96.x = _3351;
    out.m_96.y = _3353;
    out.m_96.z = _3355;
    if (!_3323)
    {
        return out;
    }
    float _3357 = -_995;
    float _3359 = _3357 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3361 = -_1013;
    float _3363 = _3361 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3365 = -_1017;
    float _3367 = _3365 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3369 = _3359 * _3359;
    float _3371 = fma(_3363, _3363, _3369);
    float _3373 = fma(_3367, _3367, _3371);
    float _3375 = sqrt(_3373);
    float _3377 = rsqrt(_3373);
    float _3379 = -_3375;
    float _3381 = _3379 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3383 = _3381 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3385 = precise::clamp(_3383, 0.0, 1.0);
    float _3387 = _3363 * _3377;
    float _3389 = _3359 * _3377;
    float _3391 = abs(_3385);
    float _3393 = log2(_3391);
    float _3395 = _3367 * _3377;
    float _3397 = _3387 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3399 = _2799 * _3389;
    float _3401 = -_3389;
    float _3403 = -_3397;
    float _3405 = fma(_3401, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3403);
    float _3407 = fma(_3053, _3387, _3399);
    float _3409 = -_3395;
    float _3411 = fma(_3409, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3405);
    float _3413 = fma(_3055, _3395, _3407);
    float _3415 = precise::clamp(_3413, 0.0, 1.0);
    float _3417 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3419 = _3411 + _3417;
    float _3421 = _3393 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3423 = _3419 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3425 = precise::clamp(_3423, 0.0, 1.0);
    float _3427 = exp2(_3421);
    float _3429 = _3427 * _3425;
    float _3431 = _3415 * _3429;
    float _3433 = _3431 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3435 = _3431 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3437 = _3431 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_94.x = _3433;
    out.m_94.y = _3435;
    out.m_94.z = _3437;
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
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3209 = false;
    bool _211 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _110 = in.m_48.w;
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
        out.m_51.x = 0.0;
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
        float _3494 = as_type<float>(_131);
        out.gl_Position.z = _3494;
    }
    if (!_119)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _135 = in.m_53.w;
    bool _137 = _135 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _139 = isnan(_135);
    bool _141 = _137 || _139;
    bool _143 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _145 = _141 || _143;
    float _147 = -_135;
    float _149 = _147 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _151 = _149;
    if (_145)
    {
        float _153 = float(_115);
        _125 = _153;
    }
    float _155 = _125;
    bool _157 = _149 >= _155;
    bool _159 = !_145;
    bool _161 = _157 || _159;
    float _163 = _155;
    if (_161)
    {
        _163 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _165 = _163;
    if (_161)
    {
        out.m_51.x = 0.0;
    }
    if (_161)
    {
        float _167 = _165 * 5.0;
        _133 = as_type<int>(_167);
    }
    int _169 = _133;
    if (_161)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3564 = as_type<float>(_169);
        out.gl_Position.z = _3564;
    }
    if (_161)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _171 = as_type<float>(int(gl_VertexIndex));
    bool _173 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _175 = as_type<int>(_171) & 1;
    bool _177 = _175 != 0;
    int _179 = as_type<int>(_171) & 2;
    bool _181 = _179 != 0;
    bool _183 = !_177;
    float _185 = _183 ? (-0.5) : 0.5;
    bool _187 = !_181;
    float _189 = _187 ? (-0.5) : 0.5;
    bool _191 = !_173;
    float _209;
    if (!_191)
    {
        float _193 = in.m_58.x;
        float _195 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _197 = _193 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _199 = fma(_197, (*spvDescriptorSet0.vp_c9)._m0[12].x, _149);
        float _201 = _199 * _195;
        float _203 = floor(_201);
        float _205 = -_203;
        float _207 = _201 + _205;
        _209 = _207;
        _211 = true;
    }
    else
    {
        float _213 = float(_115);
        float _215 = 1.0 / _213;
        float _217 = _149 * _215;
        _209 = _217;
    }
    _211 = false;
    float _219 = _209;
    float _221 = in.m_58.x;
    float _223 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _225 = log2(_223);
    float _227 = in.m_58.y;
    float _229 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _231 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _229;
    float _233 = in.m_58.z;
    int _235 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _237 = _235 != 0;
    float _239 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _241 = 1.0 / _231;
    float _243 = float(_115);
    float _245 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _247 = _225 * _149;
    float _249 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _251 = _219 + _249;
    float _253 = 1.0 / _243;
    float _255 = _221 * 2.0;
    float _257 = _221 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _259 = _251 * _241;
    float _261 = _227 * 2.0;
    float _263 = floor(_255);
    float _265 = -_239;
    float _267 = fma(_257, 2.0, _265);
    float _269 = _227 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _271 = _221 + _233;
    float _273 = _221 + _227;
    float _275 = fma(_269, -2.0, _245);
    float _277 = _271 + (-1.0);
    float _279 = floor(_261);
    float _281 = _233 * 2.0;
    int _283 = as_type<int>(_271);
    float _285 = _243;
    if (_237)
    {
        _283 = 0;
    }
    int _287 = _283;
    float _289 = fma(_277, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _291 = _287;
    if (!_237)
    {
        _291 = 1;
    }
    int _293 = _291;
    float _295 = _273 + (-1.0);
    float _297 = -_149;
    float _299 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[76].x, _267);
    float _301 = floor(_281);
    bool _303 = _263 >= 0.0;
    bool _305 = isnan(_263);
    bool _307 = _303 || _305;
    bool _309 = isnan(0.0);
    bool _311 = _307 || _309;
    float _313 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[76].y, _275);
    bool _315 = _293 != 1;
    float _317 = _233 + _227;
    int _319 = _311 ? 0 : 1;
    float _321 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _323 = _263 > 0.0;
    float _325 = _317 + (-1.0);
    bool _327 = _279 > 0.0;
    bool _329 = _279 >= 0.0;
    bool _331 = isnan(_279);
    bool _333 = _329 || _331;
    bool _335 = isnan(0.0);
    bool _337 = _333 || _335;
    float _339 = fma(_325, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _341 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _343 = int(_341);
    bool _345 = _301 > 0.0;
    int _347 = _337 ? 0 : 1;
    float _349 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _351 = _301 >= 0.0;
    bool _353 = isnan(_301);
    bool _355 = _351 || _353;
    bool _357 = isnan(0.0);
    bool _359 = _355 || _357;
    int _361 = ~_347;
    int _363 = _361 + 1;
    int _365 = _363 + 1;
    int _367 = _359 ? 0 : 1;
    int _369 = _365;
    float _371 = _325;
    float _373 = _301;
    if (!_327)
    {
        int _375 = ~_347;
        int _377 = _375 + 1;
        _369 = _377;
    }
    int _379 = _369;
    int _381 = ~_367;
    int _383 = _381 + 1;
    int _385 = _383 + 1;
    int _387 = _385;
    if (!_345)
    {
        int _389 = ~_367;
        int _391 = _389 + 1;
        _387 = _391;
    }
    int _393 = _387;
    int _395 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _397 = _395 != 0;
    int _399 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _401 = _399 != 0;
    int _403 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _405 = _403 != 0;
    float _407 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    if (!_315)
    {
        _371 = _233;
    }
    float _409 = _371;
    float _411 = _409;
    if (!_315)
    {
        _373 = _227;
    }
    float _413 = _373;
    float _415 = _413;
    if (_315)
    {
        _411 = _227;
    }
    float _417 = _411;
    float _419 = _417;
    if (_315)
    {
        _415 = _221;
    }
    float _421 = _415;
    bool _423 = !_401;
    int _425 = _423 ? 0 : 1;
    float _427 = fma(_417, (*spvDescriptorSet0.vp_c9)._m0[83].w, _349);
    bool _429 = !_397;
    int _431 = _429 ? 0 : 1;
    float _433 = fma(_421, (*spvDescriptorSet0.vp_c9)._m0[83].z, _407);
    bool _435 = !_405;
    int _437 = _435 ? 0 : 1;
    float _439 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[82].w, _427);
    int _441 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _443 = _441 != 0;
    int _445 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _447 = _445 != 0;
    int _449 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _451 = _449 != 0;
    float _453 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[82].z, _433);
    if (!_315)
    {
        _419 = _227;
    }
    float _455 = _419;
    float _457 = _455;
    if (!_315)
    {
        _285 = _233;
    }
    float _459 = _285;
    float _461 = _459;
    if (_315)
    {
        _457 = _221;
    }
    float _463 = _457;
    if (_315)
    {
        _461 = _227;
    }
    float _465 = _461;
    float _467 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _469 = _463 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _471 = !_447;
    int _473 = _471 ? 0 : 1;
    float _475 = _465 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _477 = float(_343);
    float _479 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _481 = !_443;
    int _483 = _481 ? 0 : 1;
    float _485 = -_467;
    float _487 = fma(_469, 2.0, _485);
    int _489 = abs(_473);
    float _491 = 1.0 / _477;
    int _493 = ~_319;
    int _495 = _493 + 1;
    int _497 = _495 + 1;
    float _499 = fma(_475, -2.0, _479);
    int _501 = _497;
    if (!_323)
    {
        int _503 = ~_319;
        int _505 = _503 + 1;
        _501 = _505;
    }
    int _507 = _501;
    float _509 = in.m_60.x;
    float _511 = in.m_60.y;
    float _513 = in.m_60.z;
    bool _515 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _517 = isnan(1.0);
    bool _519 = _515 || _517;
    bool _521 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _523 = _519 || _521;
    float _525 = _221 + (-0.5);
    float _527 = float(_507);
    float _529 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _531 = int(_529);
    int _533 = abs(_483);
    float _535 = -_149;
    float _537 = fma(_535, (*spvDescriptorSet0.vp_c9)._m0[81].x, _487);
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _541 = 1.0 + _539;
    float _543 = float(_533);
    float _545 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[81].y, _499);
    float _547 = float(_489);
    float _549 = 1.0 / _541;
    float _551 = float(_393);
    float _553 = _491 * _149;
    bool _555 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _557 = isnan(0.0);
    bool _559 = _555 || _557;
    bool _561 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _563 = _559 || _561;
    float _565 = _547 * _527;
    float _567 = _543 * _551;
    float _569 = exp2(_247);
    float _571 = float(_531);
    float _573 = _567 * (-2.0);
    float _575 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _577 = _565 * (-2.0);
    float _579 = fma(_573, _509, _509);
    float _581 = fma(_321, _573, _321);
    float _583 = 1.0 / _571;
    float _585 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _587 = !_451;
    int _589 = _587 ? 0 : 1;
    float _591 = fma(_221, (*spvDescriptorSet0.vp_c9)._m0[78].z, _575);
    float _593 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[196].x, _579);
    float _595 = fma(_339, _577, _339);
    float _597 = fma(_577, _511, _511);
    float _599 = -_569;
    float _601 = _599 + 1.0;
    float _603 = _253 * _149;
    float _605 = fma(_227, (*spvDescriptorSet0.vp_c9)._m0[78].w, _585);
    int _607 = abs(_589);
    float _609 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[77].z, _591);
    float _611 = _563 ? _601 : 0.0;
    float _613 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[77].w, _605);
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _617 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _615;
    float _619 = _583 * _149;
    if (_523)
    {
        float _621 = _611 * _549;
        _151 = _621;
    }
    float _623 = _151;
    float _625 = _227 + (-0.5);
    float _627 = float(_379);
    float _629 = fma(_581, _623, _593);
    float _631 = float(_607);
    float _633 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _635 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _633;
    float _637 = fma(_625, (*spvDescriptorSet0.vp_c9)._m0[196].y, _597);
    bool _639 = _219 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _641 = isnan(_219);
    bool _643 = _639 || _641;
    bool _645 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _647 = _643 || _645;
    float _649 = float(_647);
    float _651 = fma(_617, _259, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _653 = _631 * _627;
    float _655 = fma(_635, _259, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _657 = fma(_595, _623, _637);
    bool _659 = _219 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _661 = isnan(_219);
    bool _663 = _659 || _661;
    bool _665 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _667 = _663 || _665;
    float _669 = float(_667);
    float _671 = in.m_62.x;
    float _673 = in.m_62.y;
    float _675 = _653 * (-2.0);
    float _677 = -_649;
    float _679 = _677 + 1.0;
    float _681 = _629 * 0.15915493667125701904296875;
    float _683 = in.m_48.x;
    float _685 = in.m_48.y;
    float _687 = in.m_48.z;
    float _689 = fma(_675, _513, _513);
    float _691 = _233 + (-0.5);
    float _693 = _669 * _679;
    float _695 = in.m_64.x;
    float _697 = in.m_64.y;
    float _699 = in.m_64.z;
    float _701 = in.m_64.w;
    float _703 = fma(_289, _675, _289);
    float _705 = fma(_691, (*spvDescriptorSet0.vp_c9)._m0[196].z, _689);
    float _707 = -_669;
    float _709 = _707 + 1.0;
    float _711 = _651 * _693;
    float _713 = _655 * _693;
    float _715 = fma(_703, _623, _705);
    float _717 = _657 * 0.15915493667125701904296875;
    float _719 = fma(_709, (*spvDescriptorSet0.vp_c9)._m0[143].x, _711);
    float _721 = fma(_709, (*spvDescriptorSet0.vp_c9)._m0[143].y, _713);
    float _723 = _715 * 0.15915493667125701904296875;
    float _725 = _681 * 6.283185482025146484375;
    float _727 = sin(_725);
    float _729 = fma(_649, (*spvDescriptorSet0.vp_c9)._m0[144].x, _719);
    float _731 = fma(_649, (*spvDescriptorSet0.vp_c9)._m0[144].y, _721);
    float _733 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _189);
    float _735 = _729 * _671;
    float _737 = _731 * _673;
    float _739 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _185);
    float _741 = _681 * 6.283185482025146484375;
    float _743 = cos(_741);
    float _745 = _735 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _747 = _685 * _697;
    float _749 = _737 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _751 = _717 * 6.283185482025146484375;
    float _753 = sin(_751);
    float _755 = fma(_683, _695, _747);
    float _757 = _745 * _739;
    float _759 = _749 * _733;
    float _761 = in.m_66.x;
    float _763 = in.m_66.y;
    float _765 = in.m_66.z;
    float _767 = in.m_66.w;
    float _769 = fma(_687, _699, _755);
    float _771 = _717 * 6.283185482025146484375;
    float _773 = cos(_771);
    float _775 = _723 * 6.283185482025146484375;
    float _777 = cos(_775);
    float _779 = _727 * _753;
    float _781 = _743 * _753;
    float _783 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _785 = _723 * 6.283185482025146484375;
    float _787 = sin(_785);
    float _789 = _743 * _773;
    float _791 = _727 * _773;
    float _793 = _685 * _763;
    float _795 = _743 * _777;
    float _797 = _727 * _777;
    float _799 = _773 * _777;
    float _801 = _753 * _777;
    float _803 = _795 * _759;
    float _805 = fma(_683, _761, _793);
    float _807 = fma(_787, _789, _779);
    float _809 = -_759;
    float _811 = _787 * _809;
    float _813 = -_791;
    float _815 = fma(_787, _781, _813);
    float _817 = -_781;
    float _819 = fma(_787, _791, _817);
    float _821 = fma(_807, _757, _803);
    float _823 = _797 * _759;
    float _825 = fma(_799, _757, _811);
    float _827 = fma(_787, _779, _789);
    float _829 = fma(_815, _783, _821);
    float _831 = fma(_819, _757, _823);
    float _833 = fma(_801, _783, _825);
    float _835 = fma(_687, _765, _805);
    float _837 = _829 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _839 = fma(_827, _783, _831);
    float _841 = _829 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _843 = _769 + _701;
    float _845 = fma(_833, (*spvDescriptorSet0.vp_c8)._m0[26].x, _837);
    float _847 = _835 + _767;
    float _849 = fma(_833, (*spvDescriptorSet0.vp_c8)._m0[24].x, _841);
    float _851 = fma(_839, (*spvDescriptorSet0.vp_c8)._m0[26].z, _845);
    float _853 = fma(_839, (*spvDescriptorSet0.vp_c8)._m0[24].z, _849);
    float _855 = _851 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _857 = _853 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _859 = _843 + _855;
    float _861 = _847 + _857;
    float _863 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _865 = _859 + _863;
    float _867 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _869 = _861 + _867;
    float _871 = _865 * _865;
    float _873 = fma(_869, _869, _871);
    float _875 = in.m_68.x;
    float _877 = in.m_68.y;
    float _879 = in.m_68.z;
    float _881 = in.m_68.w;
    float _883 = sqrt(_873);
    bool _885 = _883 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _887 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _889 = _883 + _887;
    float _891 = _685 * _877;
    float _893 = _829 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _895 = fma(_683, _875, _891);
    float _897 = fma(_833, (*spvDescriptorSet0.vp_c8)._m0[25].x, _893);
    float _899 = _855;
    float _901 = _875;
    float _903 = _889;
    float _905 = _687;
    float _907 = _895;
    float _909 = _881;
    float _911 = _839;
    float _913 = _865;
    if (_885)
    {
        float _915 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _899 = _915;
    }
    float _917 = _899;
    float _919 = fma(_687, _879, _895);
    float _921 = fma(_839, (*spvDescriptorSet0.vp_c8)._m0[25].z, _897);
    float _923 = _919 + _881;
    float _925 = _921 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _927 = _925;
    if (_885)
    {
        float _929 = rsqrt(_873);
        _901 = _929;
    }
    float _931 = _901;
    float _933 = _923 + _925;
    float _935 = _931;
    if (_885)
    {
        float _937 = _933 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _927 = _937;
    }
    float _939 = _927;
    float _941 = _917;
    float _943 = _939;
    if (_885)
    {
        float _945 = _889 * _917;
        _903 = _945;
    }
    float _947 = _903;
    if (_885)
    {
        float _949 = _947 * 0.15915493667125701904296875;
        _941 = _949;
    }
    float _951 = _941;
    float _953 = _947;
    if (_885)
    {
        float _955 = _951 * 6.283185482025146484375;
        float _957 = cos(_955);
        _953 = _957;
    }
    float _959 = _953;
    float _961 = _683;
    if (_885)
    {
        float _963 = _951 * 6.283185482025146484375;
        float _965 = sin(_963);
        _961 = _965;
    }
    float _967 = _961;
    if (_885)
    {
        float _969 = _959 + (-1.0);
        _905 = _969;
    }
    float _971 = _905;
    float _973 = _971;
    if (_885)
    {
        float _975 = _971 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _907 = _975;
    }
    float _977 = _907;
    if (!_885)
    {
        _973 = _859;
    }
    float _979 = _973;
    float _981 = _967;
    float _983 = _979;
    if (_885)
    {
        float _985 = fma(_967, _939, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _909 = _985;
    }
    float _987 = _909;
    if (!_885)
    {
        _943 = _933;
    }
    float _989 = _943;
    float _991 = _989;
    if (_885)
    {
        float _993 = fma(_933, _959, _977);
        _991 = _993;
    }
    float _995 = _991;
    if (!_885)
    {
        _981 = _861;
    }
    float _997 = _981;
    float _999 = _997;
    if (_885)
    {
        float _1001 = _931 * _987;
        _935 = _1001;
    }
    float _1003 = _935;
    float _1005 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1007 = _995 + _1005;
    float _1009 = _1007;
    if (_885)
    {
        float _1011 = fma(_869, _1003, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _999 = _1011;
    }
    float _1013 = _999;
    if (_885)
    {
        float _1015 = fma(_865, _1003, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _983 = _1015;
    }
    float _1017 = _983;
    float _1019 = _1007 * _1007;
    float _1021 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1023 = _1013 + _1021;
    float _1025 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1027 = _1017 + _1025;
    float _1029 = fma(_1023, _1023, _1019);
    float _1031 = fma(_1027, _1027, _1029);
    float _1033 = rsqrt(_1031);
    float _1035 = sqrt(_1031);
    float _1037 = _1033 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1039 = _1023 * _1037;
    float _1041 = _1027 * _1037;
    float _1043 = _1039 * _1039;
    float _1045 = _1041 * _1041;
    float _1047 = _1043 + _1045;
    float _1049 = sqrt(_1047);
    bool _1051 = _1049 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1053 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1055 = _1049 + _1053;
    float _1057 = _1033;
    float _1059 = _1047;
    float _1061 = _1055;
    if (_1051)
    {
        float _1063 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1057 = _1063;
    }
    float _1065 = _1057;
    if (_1051)
    {
        float _1067 = rsqrt(_1047);
        _1059 = _1067;
    }
    float _1069 = _1059;
    if (_1051)
    {
        float _1071 = _1055 * _1065;
        _1061 = _1071;
    }
    float _1073 = _1061;
    if (_1051)
    {
        float _1075 = _1073 * 0.15915493667125701904296875;
        _911 = _1075;
    }
    float _1077 = _911;
    float _1079 = _1065;
    float _1081 = _1077;
    if (_1051)
    {
        float _1083 = _1077 * 6.283185482025146484375;
        float _1085 = sin(_1083);
        _1079 = _1085;
    }
    float _1087 = _1079;
    float _1089 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1091 = precise::max(0.0, _1089);
    float _1093 = _1027;
    float _1095 = _1091;
    if (_1051)
    {
        float _1097 = _1077 * 6.283185482025146484375;
        float _1099 = cos(_1097);
        _1093 = _1099;
    }
    float _1101 = _1093;
    float _1103 = -_1037;
    float _1105 = -_1091;
    float _1107 = fma(_1007, _1103, _1105);
    float _1109 = _995 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1111 = _1107;
    if (_1051)
    {
        float _1113 = _1107 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1095 = _1113;
    }
    float _1115 = _1095;
    float _1117 = _1115;
    if (!_1051)
    {
        _1081 = _1043;
    }
    float _1119 = _1081;
    float _1121 = fma(_1013, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1109);
    float _1123 = _1087;
    float _1125 = _1119;
    if (_1051)
    {
        float _1127 = fma(_1087, _1115, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1123 = _1127;
    }
    float _1129 = _1123;
    float _1131 = _1129;
    if (!_1051)
    {
        _1117 = _1045;
    }
    float _1133 = _1117;
    float _1135 = _995 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1137 = _1101;
    float _1139 = _1133;
    if (_1051)
    {
        float _1141 = _1101 + (-1.0);
        _1009 = _1141;
    }
    float _1143 = _1009;
    float _1145 = _1143;
    if (_1051)
    {
        float _1147 = _1069 * _1129;
        _913 = _1147;
    }
    float _1149 = _913;
    if (!_1051)
    {
        _1131 = _1039;
    }
    float _1151 = _1131;
    float _1153 = fma(_1013, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1135);
    float _1155 = _1151;
    if (_1051)
    {
        float _1157 = _1143 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1145 = _1157;
    }
    float _1159 = _1145;
    if (_1051)
    {
        float _1161 = _1039 * _1149;
        _1155 = _1161;
    }
    float _1163 = _1155;
    float _1165 = fma(_1017, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1153);
    if (_1051)
    {
        float _1167 = fma(_1107, _1101, _1159);
        _1111 = _1167;
    }
    float _1169 = _1111;
    if (!_1051)
    {
        _1137 = _1041;
    }
    float _1171 = _1137;
    float _1173 = _1171;
    if (_1051)
    {
        float _1175 = _1163 * _1163;
        _1125 = _1175;
    }
    float _1177 = _1125;
    if (_1051)
    {
        float _1179 = _1041 * _1149;
        _1173 = _1179;
    }
    float _1181 = _1173;
    float _1183 = _1165 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1185 = fma(_1169, _1169, _1177);
    if (_1051)
    {
        float _1187 = _1181 * _1181;
        _1139 = _1187;
    }
    float _1189 = _1139;
    float _1191 = _995 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1193 = fma(_847, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1195 = _1185 + _1189;
    float _1197 = fma(_1013, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1191);
    float _1199 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1201 = fma(_1035, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1199);
    float _1203 = precise::clamp(_1201, 0.0, 1.0);
    float _1205 = rsqrt(_1195);
    float _1207 = fma(_1017, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1197);
    float _1209 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1211 = -_1203;
    float _1213 = _1211 + 1.0;
    float _1215 = _1207 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1217 = floor(_1193);
    float _1219 = _1215 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1221 = fma(_843, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1223 = -_1219;
    float _1225 = fma(_1223, _1209, 1.0);
    float _1227 = _995 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1229 = _1205 * _1163;
    float _1231 = _1205 * _1169;
    float _1233 = fma(_1013, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1227);
    float _1235 = _1205 * _1181;
    float _1237 = abs(_1213);
    float _1239 = log2(_1237);
    float _1241 = _1229 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1243 = fma(_1017, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1233);
    float _1245 = -_1217;
    float _1247 = _1193 + _1245;
    float _1249 = -_1241;
    float _1251 = fma(_1231, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1249);
    float _1253 = _1243 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1255 = _1183 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1257 = floor(_1221);
    float _1259 = -_1235;
    float _1261 = fma(_1259, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1251);
    float _1263 = fma(_1017, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1121);
    float _1265 = fma(_1253, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1255);
    float _1267 = _1183 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1269 = _1263 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1271 = fma(_1215, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1265);
    float _1273 = log2(_1225);
    float _1275 = _1239 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1277 = fma(_1253, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1267);
    float _1279 = fma(_1269, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1271);
    float _1281 = _1231 + 1.0;
    float _1283 = fma(_1215, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1277);
    float _1285 = fma(_1013, 6.2500002968590706586837768554688e-05, 0.5);
    float _1287 = exp2(_1275);
    float _1289 = fma(_1261, -0.5, 0.5);
    float _1291 = fma(_1261, 0.5, 0.5);
    float _1293 = -_1257;
    float _1295 = _1221 + _1293;
    float _1297 = fma(_1269, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1283);
    float _1299 = fma(_1291, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1301 = sqrt(_1289);
    float _1303 = _1183 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1305 = fma(_1291, _1299, -0.212114393711090087890625);
    float _1307 = _1273 * 0.693147182464599609375;
    float _1309 = fma(_1253, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1303);
    float _1311 = fma(_1291, _1305, 1.570728778839111328125);
    float _1313 = _1307 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1315 = 1.0 / _1279;
    float _1317 = fma(_1215, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1309);
    float _1319 = -_1231;
    float _1321 = fma(_1287, _1281, _1319);
    float _1323 = fma(_1269, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1317);
    float _1325 = fma(_1017, 6.2500002968590706586837768554688e-05, 0.5);
    float _1327 = _1301 * 0.636619746685028076171875;
    float _1329 = -_1311;
    float _1331 = fma(_1327, _1329, 1.0);
    float _1333 = fma(_1321, 0.5, 0.5);
    float _1335 = _1297 * _1315;
    float _1337 = _1323 * _1315;
    float _1339 = fma(_1335, 0.5, 0.5);
    float _1341 = fma(_1337, -0.5, 0.5);
    float2 _5400 = float2(_1247, _1295);
    float _1343 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5400, float2(0.0), isnan(_5400)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5400, float2(0.0), isnan(_5400)), level(0.0)).x;
    float3 _5411 = float3(_1339, _1341, _1313);
    float _1345 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5411, float3(0.0), isnan(_5411)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5411, float3(0.0), isnan(_5411)), level(0.0)).x;
    float3 _5422 = float3(_1339, _1341, _1313);
    float4 _1348 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5422, float3(0.0), isnan(_5422)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5422, float3(0.0), isnan(_5422)), level(0.0)).xyzw;
    float _1350 = _1348.x;
    float _1352 = _1348.y;
    float _1354 = _1348.z;
    float _1356 = _1348.w;
    float2 _5438 = float2(_1331, _1333);
    float3 _1360 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5438, float2(0.0), isnan(_5438)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5438, float2(0.0), isnan(_5438)), level(0.0)).xyz;
    float _1362 = _1360.x;
    float _1364 = _1360.y;
    float _1366 = _1360.z;
    float2 _5452 = float2(_1285, _1325);
    float3 _1368 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_5452, float2(0.0), isnan(_5452)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_5452, float2(0.0), isnan(_5452)), level(0.0)).xyz;
    float _1370 = _1368.x;
    float _1372 = _1368.y;
    float _1374 = _1368.z;
    float _1376 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1378 = int(_1376);
    int _1380 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1382 = _1380 != 0;
    float _1384 = -_439;
    float _1386 = _1384 + 1.0;
    int _1388 = abs(_437);
    out.m_70.x = _1013;
    out.m_70.y = _995;
    out.m_70.z = _1017;
    float _1390 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1392 = int(_1390);
    float _1394 = float(uint(_1378));
    float _1396 = trunc(_553);
    int _1398 = int(_1396);
    int _1400 = ~_1378;
    int _1402 = _1400 + 1;
    float _1404 = float(uint(_1392));
    float _1406 = 1.0 / _1394;
    int _1408 = ~_1378;
    int _1410 = _1408 + 1;
    int _1412 = ~_1392;
    int _1414 = _1412 + 1;
    float _1416 = 1.0 / _1404;
    float _1418 = trunc(_619);
    int _1420 = int(_1418);
    int _1422 = as_type<int>(_1406) + (-2);
    float _1424 = float(uint(_1398));
    int _1426 = ~_1392;
    int _1428 = _1426 + 1;
    float _1430 = as_type<float>(_1422) * _1424;
    int _1432 = as_type<int>(_1416) + (-2);
    float _1434 = _1424;
    float _1436 = _1279;
    if (_237)
    {
        _1434 = 1.0;
    }
    float _1438 = _1434;
    float _1440 = _1438;
    if (!_237)
    {
        _1440 = 7.345489978790283203125;
    }
    float _1442 = _1440;
    float _1444 = trunc(_1430);
    float _1446 = precise::max(_1444, 0.0);
    uint _1449 = uint(_1446);
    float _1451 = float(uint(_1420));
    float _1453 = as_type<float>(_1432) * _1451;
    float _1455 = _1442 * _221;
    float _1457 = trunc(_1453);
    float _1459 = precise::max(_1457, 0.0);
    uint _1461 = uint(_1459);
    int _1463 = _1410 * int(_1449);
    int _1465 = _1463 + _1398;
    float _1467 = float(uint(_1465));
    float _1469 = floor(_1455);
    float _1471 = as_type<float>(_1422) * _1467;
    float _1473 = _1467;
    if (_237)
    {
        _1473 = _221;
    }
    float _1475 = _1473;
    int _1477 = _1428 * int(_1461);
    int _1479 = _1477 + _1420;
    float _1481 = _1475;
    if (!_237)
    {
        _1481 = _227;
    }
    float _1483 = _1481;
    float _1485 = trunc(_1471);
    float _1487 = precise::max(_1485, 0.0);
    uint _1489 = uint(_1487);
    float _1491 = float(uint(_1479));
    float _1493 = -_1469;
    float _1495 = _1455 + _1493;
    float _1497 = as_type<float>(_1432) * _1491;
    float _1499 = _1491;
    if (_237)
    {
        _1499 = 1.0;
    }
    float _1501 = _1499;
    float _1503 = _1501;
    if (!_237)
    {
        _1503 = 1.2345600128173828125;
    }
    float _1505 = _1503;
    int _1507 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1509 = _1507 != 0;
    int _1511 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1513 = _1511 != 0;
    int _1515 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1517 = _1515 != 0;
    int _1519 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1521 = _1519 != 0;
    float _1523 = trunc(_1497);
    float _1525 = precise::max(_1523, 0.0);
    uint _1527 = uint(_1525);
    float _1529 = float(_1420);
    float _1531 = _1505 * _1483;
    int _1533 = int(_1449) + int(_1489);
    float _1535 = float(_1378);
    float _1537 = float(_1398);
    int _1539 = _1402 * _1533;
    int _1541 = _1539 + _1398;
    float _1543 = floor(_1531);
    float _1545 = _1495 * _1535;
    bool _1547 = _1537 >= _1535;
    bool _1549 = isnan(_1537);
    bool _1551 = _1547 || _1549;
    bool _1553 = isnan(_1535);
    bool _1555 = _1551 || _1553;
    float _1557 = float(_1555);
    float _1559 = _1535 * _603;
    bool _1561 = uint(_1541) >= uint(_1378);
    int _1563 = int(_1461) + int(_1527);
    float _1565 = trunc(_1557);
    int _1567 = int(_1565);
    float _1569 = float(_1392);
    bool _1571 = !_1561;
    int _1573 = _1571 ? 0 : (-1);
    int _1575 = _1414 * _1563;
    int _1577 = _1575 + _1420;
    bool _1579 = _1529 >= _1569;
    bool _1581 = isnan(_1529);
    bool _1583 = _1579 || _1581;
    bool _1585 = isnan(_1569);
    bool _1587 = _1583 || _1585;
    float _1589 = float(_1587);
    float _1591 = _1569 * _603;
    int _1593 = ~_1533;
    int _1595 = _1593 + _1573;
    int _1597 = _1595 + 1;
    float _1599 = -_1543;
    float _1601 = _1531 + _1599;
    bool _1603 = uint(_1577) >= uint(_1392);
    float _1605 = trunc(_1559);
    int _1607 = int(_1605);
    int _1609 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1611 = _1609 != 0;
    int _1613 = _1378 * _1597;
    int _1615 = _1613 + _1398;
    bool _1617 = !_1603;
    int _1619 = _1617 ? 0 : (-1);
    float _1621 = _1601 * _1569;
    bool _1623 = !_1611;
    int _1625 = _1623 ? 0 : 1;
    int _1627 = ~_1563;
    int _1629 = _1627 + _1619;
    int _1631 = _1629 + 1;
    float _1633 = trunc(_1589);
    int _1635 = int(_1633);
    bool _1637 = _1378 == 0;
    int _1639 = abs(_1625);
    int _1641 = _1392 * _1631;
    int _1643 = _1641 + _1420;
    int _1645 = ~_1567;
    int _1647 = _1645 + 1;
    int _1649 = _1647 + 1;
    bool _1651 = !_1637;
    int _1653 = _1651 ? _1615 : (-1);
    float _1655 = trunc(_1545);
    int _1657 = int(_1655);
    bool _1659 = _1392 == 0;
    int _1661 = _1378 + (-1);
    int _1663 = _1653 * _1649;
    bool _1665 = !_1659;
    int _1667 = _1665 ? _1643 : (-1);
    bool _1669 = !_1513;
    int _1671 = _1669 ? 0 : 1;
    int _1673 = _1567 * _1661;
    int _1675 = _1673 + _1663;
    int _1677 = ~_1635;
    int _1679 = _1677 + 1;
    int _1681 = _1679 + 1;
    float _1683 = trunc(_1591);
    int _1685 = int(_1683);
    int _1687 = abs(_1671);
    int _1689 = abs(_425);
    int _1691 = _1667 * _1681;
    int _1693 = _1392 + (-1);
    int _1695 = _1657 * _1639;
    int _1697 = _1695 + _1398;
    int _1699 = abs(_431);
    int _1701 = _1675 * _1689;
    int _1703 = _1635 * _1693;
    int _1705 = _1703 + _1691;
    int _1707 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1709 = _1707 != 0;
    int _1711 = _1607 * _1699;
    int _1713 = _1711 + _1701;
    int _1715 = _1705 * _1687;
    bool _1717 = !_1382;
    int _1719 = _1717 ? 0 : 1;
    float _1721 = trunc(_1621);
    int _1723 = int(_1721);
    bool _1725 = !_1509;
    int _1727 = _1725 ? 0 : 1;
    int _1729 = _1697 * _1388;
    int _1731 = _1729 + _1713;
    int _1733 = abs(_1719);
    bool _1735 = !_1709;
    int _1737 = _1735 ? 0 : 1;
    int _1739 = abs(_1727);
    int _1741 = _1657 * _1733;
    int _1743 = _1741 + _1731;
    int _1745 = abs(_1737);
    bool _1747 = !_1517;
    int _1749 = _1747 ? 0 : 1;
    bool _1751 = !_1521;
    int _1753 = _1751 ? 0 : 1;
    float _1755 = float(uint(_1743));
    int _1757 = _1685 * _1739;
    int _1759 = _1757 + _1715;
    int _1761 = abs(_1749);
    int _1763 = _1723 * _1745;
    int _1765 = _1763 + _1420;
    int _1767 = abs(_1753);
    float _1769 = as_type<float>(_1422) * _1755;
    float _1771 = float(uint(_1697));
    int _1773 = ~_1392;
    int _1775 = _1773 + 1;
    int _1777 = _1765 * _1761;
    int _1779 = _1777 + _1759;
    float _1781 = trunc(_1769);
    float _1783 = precise::max(_1781, 0.0);
    uint _1785 = uint(_1783);
    float _1787 = as_type<float>(_1422) * _1771;
    int _1789 = ~_1378;
    int _1791 = _1789 + 1;
    int _1793 = _1723 * _1767;
    int _1795 = _1793 + _1779;
    int _1797 = ~_1378;
    int _1799 = _1797 + 1;
    int _1801 = ~_1378;
    int _1803 = _1801 + 1;
    float _1805 = float(uint(_1795));
    float _1807 = trunc(_1787);
    float _1809 = precise::max(_1807, 0.0);
    uint _1811 = uint(_1809);
    float _1813 = float(uint(_1765));
    int _1815 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1817 = _1815 != 0;
    float _1819 = as_type<float>(_1432) * _1805;
    float _1821 = as_type<float>(_1432) * _1813;
    int _1823 = _1799 * int(_1785);
    int _1825 = _1823 + _1743;
    float _1827 = trunc(_1819);
    float _1829 = precise::max(_1827, 0.0);
    uint _1831 = uint(_1829);
    float _1833 = float(uint(_1825));
    int _1835 = _1791 * int(_1811);
    int _1837 = _1835 + _1697;
    float _1839 = as_type<float>(_1422) * _1833;
    float _1841 = trunc(_1839);
    float _1843 = precise::max(_1841, 0.0);
    uint _1845 = uint(_1843);
    float _1847 = float(uint(_1837));
    int _1849 = _1775 * int(_1831);
    int _1851 = _1849 + _1795;
    float _1853 = as_type<float>(_1422) * _1847;
    float _1855 = float(uint(_1851));
    float _1857 = trunc(_1853);
    float _1859 = precise::max(_1857, 0.0);
    uint _1861 = uint(_1859);
    float _1863 = as_type<float>(_1432) * _1855;
    int _1865 = int(_1785) + int(_1845);
    float _1867 = trunc(_1863);
    float _1869 = precise::max(_1867, 0.0);
    uint _1871 = uint(_1869);
    int _1873 = ~_1378;
    int _1875 = _1873 + 1;
    int _1877 = ~_1392;
    int _1879 = _1877 + 1;
    int _1881 = _1803 * _1865;
    int _1883 = _1881 + _1743;
    int _1885 = int(_1811) + int(_1861);
    bool _1887 = uint(_1883) >= uint(_1378);
    float _1889 = trunc(_1821);
    float _1891 = precise::max(_1889, 0.0);
    uint _1893 = uint(_1891);
    int _1895 = ~_1392;
    int _1897 = _1895 + 1;
    bool _1899 = !_1887;
    int _1901 = _1899 ? 0 : (-1);
    int _1903 = int(_1831) + int(_1871);
    int _1905 = ~_1865;
    int _1907 = _1905 + _1901;
    int _1909 = _1907 + 1;
    int _1911 = _1378 * _1909;
    int _1913 = _1911 + _1743;
    int _1915 = _1897 * _1903;
    int _1917 = _1915 + _1795;
    int _1919 = _1875 * _1885;
    int _1921 = _1919 + _1697;
    bool _1923 = !_1637;
    int _1925 = _1923 ? _1913 : (-1);
    bool _1927 = uint(_1917) >= uint(_1392);
    int _1929 = _1879 * int(_1893);
    int _1931 = _1929 + _1765;
    int _1933 = _1925 & 3;
    bool _1935 = _1933 != 0;
    bool _1937 = !_1927;
    int _1939 = _1937 ? 0 : (-1);
    bool _1941 = uint(_1921) >= uint(_1378);
    int _1943 = _1925 & 3;
    bool _1945 = _1943 != 0;
    bool _1947 = _1933 != 3;
    float _1949 = -_1343;
    float _1951 = _1949 + 1.0;
    int _1953 = ~_1903;
    int _1955 = _1953 + _1939;
    int _1957 = _1955 + 1;
    bool _1959 = !_1941;
    int _1961 = _1959 ? 0 : (-1);
    float _1963 = float(uint(_1931));
    int _1965 = _1392 * _1957;
    int _1967 = _1965 + _1795;
    int _1969 = _1945 ? 0 : 1;
    bool _1971 = uint(_1933) >= 2u;
    float _1973 = as_type<float>(_1432) * _1963;
    int _1975 = ~_1885;
    int _1977 = _1975 + _1961;
    int _1979 = _1977 + 1;
    int _1981 = _1971 ? 0 : 1;
    bool _1983 = !_1659;
    int _1985 = _1983 ? _1967 : (-1);
    int _1987 = _1378 * _1979;
    int _1989 = _1987 + _1697;
    bool _1991 = uint(_1933) > 1u;
    float _1993 = trunc(_1973);
    float _1995 = precise::max(_1993, 0.0);
    uint _1997 = uint(_1995);
    int _1999 = ~_1981;
    int _2001 = _1999 + 1;
    int _2003 = _2001 + 1;
    int _2005 = _2003;
    if (_1947)
    {
        int _2007 = ~_1981;
        int _2009 = _2007 + 1;
        _2005 = _2009;
    }
    int _2011 = _2005;
    int _2013 = _1985 & 3;
    bool _2015 = _2013 != 0;
    bool _2017 = !_1817;
    int _2019 = _2017 ? 0 : 1;
    bool _2021 = !_1935;
    int _2023 = _2021 ? 0 : 1;
    bool _2025 = uint(_2013) > 1u;
    int _2027 = _1985 & 3;
    bool _2029 = _2027 != 0;
    int _2031 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2033 = _2031 != 0;
    int _2035 = _2029 ? 0 : 1;
    int _2037 = ~_1969;
    int _2039 = _2037 + 1;
    int _2041 = _2039 + 1;
    bool _2043 = _1933 != 3;
    int _2045 = _2041;
    if (!_1991)
    {
        int _2047 = ~_1969;
        int _2049 = _2047 + 1;
        _2045 = _2049;
    }
    int _2051 = _2045;
    bool _2053 = !_1637;
    int _2055 = _2053 ? _1989 : (-1);
    bool _2057 = !_2033;
    int _2059 = _2057 ? 0 : 1;
    int _2061 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2063 = _2061 != 0;
    int _2065 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2067 = _2065 != 0;
    int _2069 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2071 = _2069 != 0;
    int _2073 = ~_1392;
    int _2075 = _2073 + 1;
    int _2077 = int(_1893) + int(_1997);
    bool _2079 = !_2043;
    int _2081 = _2079 ? 0 : (-1);
    bool _2083 = !_2015;
    int _2085 = _2083 ? 0 : 1;
    int _2087 = _2075 * _2077;
    int _2089 = _2087 + _1765;
    bool _2091 = uint(_2013) >= 2u;
    int _2093 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2095 = _2093 != 0;
    float _2097 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    int _2099 = ~_2035;
    int _2101 = _2099 + 1;
    int _2103 = _2101 + 1;
    int _2105 = _1925 >> 31;
    int _2107 = _2103;
    if (!_2025)
    {
        int _2109 = ~_2035;
        int _2111 = _2109 + 1;
        _2107 = _2111;
    }
    int _2113 = _2107;
    bool _2115 = _2013 != 3;
    int _2117 = _2091 ? 0 : 1;
    bool _2119 = _221 > 0.5;
    float _2121 = _2097 * _221;
    int _2123 = _1985 >> 31;
    float _2125 = _923 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _2127 = _2105 & 3;
    bool _2129 = !_2115;
    int _2131 = _2129 ? 0 : (-1);
    float _2133 = fma(_847, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2125);
    bool _2135 = uint(_2089) >= uint(_1392);
    float _2137 = trunc(_2121);
    int _2139 = int(_2137);
    int _2141 = _2123 & 3;
    int _2143 = _1925 + _2127;
    bool _2145 = !_2135;
    int _2147 = _2145 ? 0 : (-1);
    bool _2149 = _2013 != 3;
    float _2151 = fma(_843, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2133);
    int _2153 = _1985 + _2141;
    float _2155 = _923 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    int _2157 = _2143 >> 2;
    float _2159 = _2151 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    int _2161 = _2153 >> 2;
    float _2163 = fma(_847, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2155);
    int _2165 = _2157 << 4;
    int _2167 = _2165 + 368;
    float _2169 = 1.0 / _2159;
    int _2171 = ~_2077;
    int _2173 = _2171 + _2147;
    int _2175 = _2173 + 1;
    float _2177 = fma(_843, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2163);
    int _2179 = _2161 << 4;
    int _2181 = _2179 + 512;
    uint _2183 = uint(int(uint(_2167) >> uint(2)));
    uint _2185 = uint(int(uint(int(_2183)) >> uint(2)));
    int _2187 = int(_2183) & 3;
    float _2189 = (*spvDescriptorSet0.vp_c9)._m0[int(_2185)][_2187];
    int _2191 = int(_2183) + 1;
    uint _2193 = uint(int(uint(_2191) >> uint(2)));
    int _2195 = _2191 & 3;
    float _2197 = (*spvDescriptorSet0.vp_c9)._m0[int(_2193)][_2195];
    float _2199 = _2177 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    int _2201 = _1392 * _2175;
    int _2203 = _2201 + _1765;
    int _2205 = ~_2117;
    int _2207 = _2205 + 1;
    int _2209 = _2207 + 1;
    float _2211 = in.m_58.w;
    int _2213 = _2209;
    if (_2149)
    {
        int _2215 = ~_2117;
        int _2217 = _2215 + 1;
        _2213 = _2217;
    }
    int _2219 = _2213;
    float _2221 = _2199 + _2159;
    uint _2223 = uint(int(uint(_2181) >> uint(2)));
    uint _2225 = uint(int(uint(int(_2223)) >> uint(2)));
    int _2227 = int(_2223) & 3;
    float _2229 = (*spvDescriptorSet0.vp_c9)._m0[int(_2225)][_2227];
    int _2231 = int(_2223) + 1;
    uint _2233 = uint(int(uint(_2231) >> uint(2)));
    int _2235 = _2231 & 3;
    float _2237 = (*spvDescriptorSet0.vp_c9)._m0[int(_2233)][_2235];
    bool _2239 = !_1659;
    int _2241 = _2239 ? _2203 : (-1);
    float _2243 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _2245 = _2139 << 4;
    int _2247 = _2245 + 1968;
    float _2249 = _2221 * _2169;
    float _2251 = _2249 * 0.5;
    bool _2253 = _227 > 0.5;
    float _2255 = _2243 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2257 = _233 > 0.5;
    int _2259 = _2167 + 8;
    uint _2261 = uint(int(uint(_2259) >> uint(2)));
    uint _2263 = uint(int(uint(int(_2261)) >> uint(2)));
    int _2265 = int(_2261) & 3;
    float _2267 = (*spvDescriptorSet0.vp_c9)._m0[int(_2263)][_2265];
    int _2269 = int(_2261) + 1;
    uint _2271 = uint(int(uint(_2269) >> uint(2)));
    int _2273 = _2269 & 3;
    float _2275 = (*spvDescriptorSet0.vp_c9)._m0[int(_2271)][_2273];
    float _2277 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2279 = int(_2277);
    float _2281 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _2283 = abs(_2023);
    int _2285 = _2181 + 8;
    uint _2287 = uint(int(uint(_2285) >> uint(2)));
    uint _2289 = uint(int(uint(int(_2287)) >> uint(2)));
    int _2291 = int(_2287) & 3;
    float _2293 = (*spvDescriptorSet0.vp_c9)._m0[int(_2289)][_2291];
    int _2295 = int(_2287) + 1;
    uint _2297 = uint(int(uint(_2295) >> uint(2)));
    int _2299 = _2295 & 3;
    float _2301 = (*spvDescriptorSet0.vp_c9)._m0[int(_2297)][_2299];
    float _2303 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2305 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2307 = _2281 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2309 = abs(_2113);
    float _2311 = _2303 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2313 = abs(_2085);
    uint _2315 = uint(int(uint(_2247) >> uint(2)));
    uint _2317 = uint(int(uint(int(_2315)) >> uint(2)));
    int _2319 = int(_2315) & 3;
    float _2321 = (*spvDescriptorSet0.vp_c9)._m0[int(_2317)][_2319];
    int _2323 = int(_2315) + 1;
    uint _2325 = uint(int(uint(_2323) >> uint(2)));
    int _2327 = _2323 & 3;
    float _2329 = (*spvDescriptorSet0.vp_c9)._m0[int(_2325)][_2327];
    out.m_72.x = _2307;
    out.m_72.y = _2311;
    out.m_72.z = _2255;
    out.m_72.w = _2305;
    float _2331 = -_185;
    int _2333 = _2119 ? as_type<int>(_2331) : as_type<int>(_185);
    float _2335 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2337 = fma(_2251, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2335);
    int _2339 = abs(_2051);
    bool _2341 = _2211 > 0.5;
    int _2343 = _2247 + 8;
    uint _2345 = uint(int(uint(_2343) >> uint(2)));
    uint _2347 = uint(int(uint(int(_2345)) >> uint(2)));
    int _2349 = int(_2345) & 3;
    float _2351 = (*spvDescriptorSet0.vp_c9)._m0[int(_2347)][_2349];
    float _2353 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2355 = int(_2353);
    int _2357 = abs(_2019);
    float _2359 = _1183 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2361 = !_2095;
    float _2363 = _2361 ? _185 : as_type<float>(_2333);
    int _2365 = ~_2339;
    int _2367 = _2365 + 1;
    int _2369 = _2367 + 1;
    float _2371 = fma(_1253, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2359);
    int _2373 = ~_2309;
    int _2375 = _2373 + 1;
    int _2377 = _2375 + 1;
    float _2379 = 1.0 / _2337;
    int _2381 = ~_2283;
    int _2383 = _2381 + 1;
    int _2385 = _2383 + 1;
    int _2387 = _2369 * as_type<int>(_2197);
    int _2389 = ~_2313;
    int _2391 = _2389 + 1;
    int _2393 = _2391 + 1;
    float _2395 = fma(_1215, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2371);
    int _2397 = _2377 * as_type<int>(_2237);
    int _2399 = abs(_2219);
    int _2401 = _2385 * as_type<int>(_2189);
    int _2403 = _2401 + _2387;
    int _2405 = abs(_2011);
    int _2407 = _2393 * as_type<int>(_2229);
    int _2409 = _2407 + _2397;
    int _2411 = abs(_2081);
    float _2413 = fma(_1269, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2395);
    int _2415 = ~_2405;
    int _2417 = _2415 + 1;
    int _2419 = _2417 + 1;
    int _2421 = ~_2399;
    int _2423 = _2421 + 1;
    int _2425 = _2423 + 1;
    float _2427 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2429 = _2379 * _2427;
    int _2431 = abs(_2131);
    int _2433 = _2419 * as_type<int>(_2267);
    int _2435 = _2433 + _2403;
    float _2437 = float(uint(_2279));
    float _2439 = abs(_2429);
    float _2441 = log2(_2439);
    int _2443 = ~_2411;
    int _2445 = _2443 + 1;
    int _2447 = _2445 + 1;
    int _2449 = _2425 * as_type<int>(_2293);
    int _2451 = _2449 + _2409;
    int _2453 = ~_2431;
    int _2455 = _2453 + 1;
    int _2457 = _2455 + 1;
    float _2459 = float(uint(_2355));
    int _2461 = _2447 * as_type<int>(_2275);
    int _2463 = _2461 + _2435;
    int _2465 = abs(_2279);
    float _2467 = 1.0 / _2437;
    int _2469 = ~_2357;
    int _2471 = _2469 + 1;
    int _2473 = _2471 + 1;
    float _2475 = _2329 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _2477 = _2457 * as_type<int>(_2301);
    int _2479 = _2477 + _2451;
    int _2481 = abs(_2059);
    float _2483 = _2321 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2485 = float(uint(_2465));
    int _2487 = _2463 * _2473;
    int _2489 = abs(_2355);
    float _2491 = 1.0 / _2459;
    float _2493 = _2351 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2495 = _2441 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _2497 = ~_2481;
    int _2499 = _2497 + 1;
    int _2501 = _2499 + 1;
    int _2503 = _2055 * _2357;
    int _2505 = _2503 + _2487;
    float _2507 = _2483 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2509 = _2475 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2511 = 1.0 / _2485;
    float _2513 = _2493 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2515 = _2479 * _2501;
    float _2517 = float(uint(_2489));
    float _2519 = _795 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2521 = as_type<int>(_2467) + (-2);
    int _2523 = _2241 * _2481;
    int _2525 = _2523 + _2515;
    out.m_74.x = _2507;
    out.m_74.y = _2509;
    out.m_74.z = _2513;
    float _2527 = exp2(_2495);
    float _2529 = _795 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2531 = _795 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2533 = -_787;
    float _2535 = fma(_2533, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2529);
    int _2537 = as_type<int>(_2491) + (-2);
    float _2539 = 1.0 / _2517;
    float _2541 = float(uint(_2525));
    float _2543 = fma(_797, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2535);
    float _2545 = float(uint(_2505));
    float _2547 = -_787;
    float _2549 = fma(_2547, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2519);
    int _2551 = abs(_2505);
    float _2553 = -_787;
    float _2555 = fma(_2553, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2531);
    float _2557 = as_type<float>(_2537) * _2541;
    float _2559 = as_type<float>(_2521) * _2545;
    float _2561 = fma(_2527, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2563 = precise::clamp(_2561, 0.0, 1.0);
    int _2565 = as_type<int>(_2511) + (-2);
    float _2567 = fma(_797, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2549);
    float _2569 = float(uint(_2551));
    float _2571 = trunc(_2559);
    float _2573 = precise::max(_2571, 0.0);
    uint _2575 = uint(_2573);
    float _2577 = fma(_797, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2555);
    int _2579 = ~_2279;
    int _2581 = _2579 + 1;
    float _2583 = _807 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2585 = as_type<float>(_2565) * _2569;
    float _2587 = _807 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2589 = ~_2465;
    int _2591 = _2589 + 1;
    float _2593 = trunc(_2557);
    float _2595 = precise::max(_2593, 0.0);
    uint _2597 = uint(_2595);
    float _2599 = _807 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2601 = as_type<int>(_2539) + (-2);
    float _2603 = fma(_799, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2587);
    int _2605 = abs(_2525);
    float _2607 = fma(_799, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2599);
    float _2609 = _815 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2611 = ~_2355;
    int _2613 = _2611 + 1;
    float _2615 = trunc(_2585);
    float _2617 = precise::max(_2615, 0.0);
    uint _2619 = uint(_2617);
    float _2621 = fma(_801, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2609);
    float _2623 = fma(_799, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2583);
    float _2625 = _815 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2627 = _815 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2629 = float(uint(_2605));
    int _2631 = _2581 * int(_2575);
    int _2633 = _2631 + _2505;
    int _2635 = ~_2489;
    int _2637 = _2635 + 1;
    int _2639 = _2613 * int(_2597);
    int _2641 = _2639 + _2525;
    float _2643 = fma(_801, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2625);
    float _2645 = fma(_801, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2627);
    float _2647 = as_type<float>(_2601) * _2629;
    float _2649 = float(uint(_2633));
    int _2651 = _2591 * int(_2619);
    int _2653 = _2651 + _2551;
    float _2655 = float(uint(_2641));
    float _2657 = fma(_819, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2603);
    float _2659 = trunc(_2647);
    float _2661 = precise::max(_2659, 0.0);
    uint _2663 = uint(_2661);
    float _2665 = float(uint(_2653));
    float _2667 = as_type<float>(_2521) * _2649;
    float _2669 = -_185;
    int _2671 = _2257 ? as_type<int>(_2669) : as_type<int>(_185);
    float _2673 = as_type<float>(_2537) * _2655;
    float _2675 = _185 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2677 = as_type<float>(_2565) * _2665;
    bool _2679 = !_2067;
    float _2681 = _2679 ? _185 : as_type<float>(_2671);
    float _2683 = fma(_819, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2623);
    float _2685 = -_189;
    int _2687 = _2253 ? as_type<int>(_2685) : as_type<int>(_189);
    float _2689 = fma(_819, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2607);
    float _2691 = -_189;
    int _2693 = _2341 ? as_type<int>(_2691) : as_type<int>(_189);
    float _2695 = trunc(_2667);
    float _2697 = precise::max(_2695, 0.0);
    uint _2699 = uint(_2697);
    bool _2701 = !_2063;
    float _2703 = _2701 ? _189 : as_type<float>(_2687);
    float _2705 = fma(_827, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2643);
    bool _2707 = !_2071;
    float _2709 = _2707 ? _189 : as_type<float>(_2693);
    int _2711 = _2637 * int(_2663);
    int _2713 = _2711 + _2605;
    float _2715 = _189 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2717 = fma(_827, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2621);
    float _2719 = fma(_2563, -2.0, 3.0);
    float _2721 = trunc(_2677);
    float _2723 = precise::max(_2721, 0.0);
    uint _2725 = uint(_2723);
    float _2727 = float(uint(_2713));
    float _2729 = _2563 * _2563;
    float _2731 = _2715 * _2543;
    out.m_76.x = _2689;
    out.m_76.y = _2657;
    out.m_76.z = _2683;
    float _2733 = _2715 * _2577;
    float _2735 = as_type<float>(_2601) * _2727;
    float _2737 = _2729 * _2719;
    float _2739 = trunc(_2673);
    float _2741 = precise::max(_2739, 0.0);
    uint _2743 = uint(_2741);
    float _2745 = fma(_2675, _2689, _2731);
    float _2747 = _2715 * _2567;
    int _2749 = int(_2575) + int(_2699);
    float _2751 = -_2737;
    float _2753 = _2751 + 1.0;
    int _2755 = ~_2279;
    int _2757 = _2755 + 1;
    float _2759 = fma(_2675, _2657, _2747);
    int _2761 = ~_2465;
    int _2763 = _2761 + 1;
    float _2765 = trunc(_2735);
    float _2767 = precise::max(_2765, 0.0);
    uint _2769 = uint(_2767);
    int _2771 = int(_2619) + int(_2725);
    int _2773 = _2757 * _2749;
    int _2775 = _2773 + _2505;
    int _2777 = ~_2355;
    int _2779 = _2777 + 1;
    float _2781 = fma(_2675, _2683, _2733);
    int _2783 = ~_2489;
    int _2785 = _2783 + 1;
    int _2787 = _2763 * _2771;
    int _2789 = _2787 + _2551;
    bool _2791 = uint(_2775) >= uint(_2279);
    float _2793 = fma(_827, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2645);
    int _2795 = int(_2597) + int(_2743);
    float _2797 = fma(_2753, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2737);
    float _2799 = _2705 + _2759;
    float _2801 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _2803 = _2779 * _2795;
    int _2805 = _2803 + _2525;
    bool _2807 = uint(_2789) >= uint(_2465);
    int _2809 = int(_2663) + int(_2769);
    bool _2811 = uint(_2805) >= uint(_2355);
    float _2813 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2815 = _2785 * _2809;
    int _2817 = _2815 + _2605;
    bool _2819 = !_2791;
    int _2821 = _2819 ? 0 : (-1);
    bool _2823 = !_2811;
    int _2825 = _2823 ? 0 : (-1);
    int _2827 = ~_2749;
    int _2829 = _2827 + _2821;
    int _2831 = _2829 + 1;
    bool _2833 = uint(_2817) >= uint(_2489);
    float _2835 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2837 = _2505 ^ _2279;
    int _2839 = ~_2795;
    int _2841 = _2839 + _2825;
    int _2843 = _2841 + 1;
    int _2845 = _2279 * _2831;
    int _2847 = _2845 + _2505;
    bool _2849 = _2279 == 0;
    bool _2851 = !_2807;
    int _2853 = _2851 ? 0 : (-1);
    uint _2855 = uint(int(uint(_2837) >> uint(31)));
    int _2857 = _2525 ^ _2355;
    int _2859 = _2355 * _2843;
    int _2861 = _2859 + _2525;
    bool _2863 = !_2849;
    int _2865 = _2863 ? _2847 : (-1);
    float _2867 = fma(_2715, _2715, 1.0);
    int _2869 = ~_2853;
    int _2871 = _2771 + _2869;
    int _2873 = _2871 + 1;
    float _2875 = _2801 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _2877 = ~int(_2855);
    int _2879 = _2877 + 1;
    float _2881 = _2835 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _2883 = !_2833;
    int _2885 = _2883 ? 0 : (-1);
    float _2887 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    uint _2889 = uint(int(uint(_2857) >> uint(31)));
    float _2891 = float(_2865);
    int _2893 = _2873 ^ _2879;
    bool _2895 = _2355 == 0;
    float _2897 = fma(_2875, _2891, _299);
    int _2899 = ~_2885;
    int _2901 = _2809 + _2899;
    int _2903 = _2901 + 1;
    float _2905 = rsqrt(_2867);
    int _2907 = ~int(_2889);
    int _2909 = _2907 + 1;
    int _2911 = ~_2879;
    int _2913 = _2911 + _2893;
    int _2915 = _2913 + 1;
    bool _2917 = _2279 == 0;
    float _2919 = _2887 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _2921 = _2903 ^ _2909;
    bool _2923 = !_2895;
    int _2925 = _2923 ? _2861 : (-1);
    int _2927 = ~_2909;
    int _2929 = _2927 + _2921;
    int _2931 = _2929 + 1;
    float _2933 = _2813 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _2935 = !_2917;
    int _2937 = _2935 ? _2915 : (-1);
    float _2939 = _2363 + 0.5;
    float _2941 = float(_2925);
    float _2943 = _2715 * _2905;
    bool _2945 = _2355 == 0;
    float _2947 = fma(_2875, _2939, _2897);
    float _2949 = float(_2937);
    float _2951 = fma(_2933, _2941, _537);
    bool _2953 = !_2945;
    int _2955 = _2953 ? _2931 : (-1);
    float _2957 = -_2705;
    float _2959 = _2943 * _2957;
    float _2961 = _2681 + 0.5;
    float _2963 = -_313;
    float _2965 = fma(_2881, _2949, _2963);
    float _2967 = float(_2955);
    float _2969 = _2703 + (-0.5);
    float _2971 = fma(_2933, _2961, _2951);
    float _2973 = -_453;
    float _2975 = _2973 + 1.0;
    bool _2977 = _2429 <= 8000.0;
    bool _2979 = isnan(_2429);
    bool _2981 = _2977 || _2979;
    bool _2983 = isnan(8000.0);
    bool _2985 = _2981 || _2983;
    float _2987 = float(_2985);
    float _2989 = -_2881;
    float _2991 = fma(_2989, _2969, _2965);
    float _2993 = -_545;
    float _2995 = fma(_2919, _2967, _2993);
    float _2997 = _2709 + (-0.5);
    float _2999 = -_2717;
    float _3001 = _2943 * _2999;
    float _3003 = -_2975;
    float _3005 = fma(_2681, _3003, _2971);
    float _3007 = -_2793;
    float _3009 = _2943 * _3007;
    float _3011 = -_2919;
    float _3013 = fma(_3011, _2997, _2995);
    float _3015 = fma(_2905, _2543, _3001);
    float _3017 = fma(_2905, _2567, _2959);
    float _3019 = _1239 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3021 = in.m_78.x;
    float _3023 = _2987 * _2797;
    float _3025 = fma(_2905, _2577, _3009);
    float _3027 = -_609;
    float _3029 = _3027 + 1.0;
    float _3031 = exp2(_3019);
    float _3033 = _3023 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_80.x = _3015;
    out.m_80.y = _3017;
    out.m_80.z = _3025;
    float _3035 = -_3029;
    float _3037 = fma(_2363, _3035, _2947);
    float _3039 = _2413 + _1279;
    float _3041 = _1951 * _3033;
    float _3043 = precise::clamp(_3041, 0.0, 1.0);
    out.gl_Position.x = _1297;
    out.gl_Position.y = _1323;
    out.gl_Position.z = _2413;
    out.gl_Position.w = _1279;
    float _3045 = _3039 * 0.5;
    float _3047 = -_613;
    float _3049 = _3047 + 1.0;
    float _3051 = fma(_2709, _1386, _3013);
    float _3053 = _2717 + _2745;
    float _3055 = _2793 + _2781;
    out.m_82.z = _3045;
    out.m_82.w = _1279;
    float _3057 = fma(_2703, _3049, _2991);
    float _3059 = -_3031;
    float _3061 = _3059 + 1.0;
    out.m_84.x = _1370;
    out.m_84.y = _1372;
    out.m_84.z = _1374;
    bool _3063 = _1035 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3065 = isnan(_1035);
    bool _3067 = _3063 || _3065;
    bool _3069 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3071 = _3067 || _3069;
    float _3073 = -_3043;
    float _3075 = fma(_3073, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3077 = _3061 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_86.x = _3037;
    out.m_86.y = _3057;
    out.m_86.z = _3005;
    out.m_86.w = _3051;
    float _3079 = _3075 * _3021;
    float _3081 = _3077 * _1345;
    float _3083 = -_3077;
    float _3085 = _3083 + 1.0;
    out.m_88.x = _3053;
    out.m_88.y = _2799;
    out.m_88.z = _3055;
    float _3087 = _3079 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3089 = _1356 * _3081;
    float _3091 = _1366 * _3081;
    float _3093 = _1356 * _3085;
    float _3095 = _3017;
    float _3097 = _3085;
    float _3099 = _2413;
    float _3101 = _3089;
    float _3103 = _3081;
    if (!_3071)
    {
        _3095 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3105 = _3095;
    float _3107 = fma(_1362, _3089, _1350);
    float _3109 = fma(_1364, _3089, _1352);
    float _3111 = fma(_1356, _3091, _1354);
    out.m_90.x = _3087;
    float _3113 = _3105;
    float _3115 = _3105;
    if (!_3071)
    {
        _3097 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3117 = _3097;
    float _3119 = _3117;
    float _3121 = _3117;
    if (!_3071)
    {
        _1436 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3123 = _1436;
    out.m_92.x = _3107;
    out.m_92.y = _3109;
    out.m_92.z = _3111;
    out.m_92.w = _3093;
    float _3125 = _3123;
    float _3127 = _3123;
    if (!_3071)
    {
        _3099 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3129 = _3099;
    float _3131 = _3129;
    float _3133 = _3129;
    if (!_3071)
    {
        _3101 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3135 = _3101;
    float _3137 = _3135;
    float _3139 = _3135;
    if (!_3071)
    {
        _3103 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3141 = _3103;
    bool _3143 = !_3071;
    float _3145 = _3141;
    float _3147 = _3141;
    if (!_3143)
    {
        bool _3149 = _1035 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3151 = isnan(_1035);
        bool _3153 = _3149 || _3151;
        bool _3155 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3157 = _3153 || _3155;
        if (!_3157)
        {
            float _3159 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3161 = _1035 + _3159;
            float _3163 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3165 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3163;
            float _3167 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3169 = _3167 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3171 = 1.0 / _3165;
            float _3173 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3175 = _3173 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3177 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3179 = _3177 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3181 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3183 = _3181 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3185 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3187 = _3185 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3189 = _3161 * _3171;
            float _3191 = precise::clamp(_3189, 0.0, 1.0);
            float _3193 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3195 = _3193 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3197 = fma(_3191, _3169, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3199 = fma(_3191, _3195, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3201 = fma(_3191, _3175, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3203 = fma(_3191, _3179, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3205 = fma(_3191, _3183, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3207 = fma(_3191, _3187, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3121 = _3201;
            _3139 = _3205;
            _3115 = _3197;
            _3133 = _3203;
            _3127 = _3199;
            _3147 = _3207;
            _3209 = true;
        }
        else
        {
            bool _3211 = _1035 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3213 = isnan(_1035);
            bool _3215 = _3211 || _3213;
            bool _3217 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3219 = _3215 || _3217;
            if (!_3219)
            {
                _3113 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3221 = _3113;
            _3115 = _3221;
            if (!_3219)
            {
                _3119 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3223 = _3119;
            _3121 = _3223;
            if (!_3219)
            {
                _3125 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3225 = _3125;
            _3127 = _3225;
            if (!_3219)
            {
                _3131 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3227 = _3131;
            _3133 = _3227;
            if (!_3219)
            {
                _3137 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3229 = _3137;
            _3139 = _3229;
            if (!_3219)
            {
                _3145 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3231 = _3145;
            bool _3233 = !_3219;
            _3147 = _3231;
            if (!_3233)
            {
                bool _3235 = _1035 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3237 = isnan(_1035);
                bool _3239 = _3235 || _3237;
                bool _3241 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3243 = _3239 || _3241;
                if (!_3243)
                {
                    float _3245 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3247 = _1035 + _3245;
                    float _3249 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3251 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3249;
                    float _3253 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3255 = _3253 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3257 = 1.0 / _3251;
                    float _3259 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3261 = _3259 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3263 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3265 = _3263 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3267 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3269 = _3267 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3271 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3273 = _3271 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3275 = _3247 * _3257;
                    float _3277 = precise::clamp(_3275, 0.0, 1.0);
                    float _3279 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3281 = _3279 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3283 = fma(_3277, _3255, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3285 = fma(_3277, _3281, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3287 = fma(_3277, _3261, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3289 = fma(_3277, _3265, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3291 = fma(_3277, _3269, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3293 = fma(_3277, _3273, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3121 = _3287;
                    _3139 = _3291;
                    _3115 = _3283;
                    _3133 = _3289;
                    _3127 = _3285;
                    _3147 = _3293;
                    _3209 = true;
                }
                else
                {
                    _3121 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3139 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3115 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3133 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3127 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3147 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3209 = false;
    float _3295 = _3121;
    float _3297 = _3139;
    float _3299 = _3115;
    float _3301 = _3133;
    float _3303 = _3127;
    float _3305 = _3147;
    float _3307 = fma(_2799, -0.5, 0.5);
    float _3309 = precise::clamp(_3307, 0.0, 1.0);
    float _3311 = -_3295;
    float _3313 = _3311 + _3297;
    float _3315 = -_3299;
    float _3317 = _3315 + _3301;
    float _3319 = -_3303;
    float _3321 = _3319 + _3305;
    bool _3323 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3325 = fma(_3309, _3313, _3295);
    float _3327 = fma(_3309, _3317, _3299);
    float _3329 = fma(_3309, _3321, _3303);
    float _3331 = _3325 * 0.586610972881317138671875;
    out.m_51.x = 1.0;
    float _3333 = fma(_3327, 0.298911988735198974609375, _3331);
    float _3335 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3337 = fma(_3329, 0.114477999508380889892578125, _3333);
    out.m_90.w = _3335;
    float _3339 = -_3337;
    float _3341 = _3327 + _3339;
    float _3343 = -_3337;
    float _3345 = _3325 + _3343;
    float _3347 = -_3337;
    float _3349 = _3329 + _3347;
    out.m_94.x = 0.0;
    float _3351 = fma(_3341, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3337);
    float _3353 = fma(_3345, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3337);
    float _3355 = fma(_3349, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3337);
    out.m_96.x = _3351;
    out.m_96.y = _3353;
    out.m_96.z = _3355;
    if (!_3323)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3357 = -_995;
    float _3359 = _3357 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3361 = -_1013;
    float _3363 = _3361 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3365 = -_1017;
    float _3367 = _3365 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3369 = _3359 * _3359;
    float _3371 = fma(_3363, _3363, _3369);
    float _3373 = fma(_3367, _3367, _3371);
    float _3375 = sqrt(_3373);
    float _3377 = rsqrt(_3373);
    float _3379 = -_3375;
    float _3381 = _3379 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3383 = _3381 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3385 = precise::clamp(_3383, 0.0, 1.0);
    float _3387 = _3363 * _3377;
    float _3389 = _3359 * _3377;
    float _3391 = abs(_3385);
    float _3393 = log2(_3391);
    float _3395 = _3367 * _3377;
    float _3397 = _3387 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3399 = _2799 * _3389;
    float _3401 = -_3389;
    float _3403 = -_3397;
    float _3405 = fma(_3401, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3403);
    float _3407 = fma(_3053, _3387, _3399);
    float _3409 = -_3395;
    float _3411 = fma(_3409, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3405);
    float _3413 = fma(_3055, _3395, _3407);
    float _3415 = precise::clamp(_3413, 0.0, 1.0);
    float _3417 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3419 = _3411 + _3417;
    float _3421 = _3393 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3423 = _3419 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3425 = precise::clamp(_3423, 0.0, 1.0);
    float _3427 = exp2(_3421);
    float _3429 = _3427 * _3425;
    float _3431 = _3415 * _3429;
    float _3433 = _3431 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3435 = _3431 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3437 = _3431 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_94.x = _3433;
    out.m_94.y = _3435;
    out.m_94.z = _3437;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

