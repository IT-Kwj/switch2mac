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
    sampler vp_t_tcb_24Smplr_w [[id(14)]];
    sampler vp_t_tcb_32Smplr_w [[id(15)]];
    sampler vp_t_tcb_30Smplr_w [[id(16)]];
    sampler vp_t_tcb_1CSmplr_w [[id(17)]];
    constant dm_border_t* dm_border [[id(18)]];
};

struct main0_out
{
    float4 m_68 [[user(locn0)]];
    float4 m_74 [[user(locn1)]];
    float4 m_72 [[user(locn2)]];
    float4 m_80 [[user(locn3)]];
    float4 m_90 [[user(locn4)]];
    float4 m_49 [[user(locn5)]];
    float4 m_78 [[user(locn6)]];
    float4 m_82 [[user(locn7)]];
    float4 m_88 [[user(locn8)]];
    float4 m_84 [[user(locn9)]];
    float4 m_86 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_76 [[attribute(0)]];
    float4 m_58 [[attribute(1)]];
    float4 m_60 [[attribute(2)]];
    float4 m_62 [[attribute(3)]];
    float4 m_70 [[attribute(4)]];
    float4 m_56 [[attribute(5)]];
    float4 m_46 [[attribute(6)]];
    float4 m_51 [[attribute(7)]];
    float4 m_64 [[attribute(8)]];
    float4 m_66 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2839 = false;
    bool _591 = false;
    bool _399 = false;
    bool _251 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _104 = in.m_46.w;
    float _106 = trunc(_104);
    int _109 = int(_106);
    bool _113 = _109 >= 1;
    float _115 = 0.0;
    if (!_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _115;
    float _119 = _117;
    if (!_113)
    {
        out.m_49.x = 0.0;
    }
    int _121 = 0;
    if (!_113)
    {
        float _123 = _117 * 5.0;
        _121 = as_type<int>(_123);
    }
    int _125 = _121;
    int _127 = _125;
    if (!_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3092 = as_type<float>(_125);
        out.gl_Position.z = _3092;
    }
    if (!_113)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _129 = in.m_51.w;
    bool _131 = _129 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _133 = isnan(_129);
    bool _135 = _131 || _133;
    bool _137 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _139 = _135 || _137;
    float _141 = -_129;
    float _143 = _141 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _145 = _143;
    if (_139)
    {
        float _147 = float(_109);
        _119 = _147;
    }
    float _149 = _119;
    bool _151 = _143 >= _149;
    bool _153 = !_139;
    bool _155 = _151 || _153;
    float _157 = _149;
    if (_155)
    {
        _157 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _159 = _157;
    if (_155)
    {
        out.m_49.x = 0.0;
    }
    if (_155)
    {
        float _161 = _159 * 5.0;
        _127 = as_type<int>(_161);
    }
    int _163 = _127;
    if (_155)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3162 = as_type<float>(_163);
        out.gl_Position.z = _3162;
    }
    if (_155)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _165 = as_type<float>(int(gl_VertexIndex));
    float _167 = in.m_56.x;
    float _169 = in.m_56.y;
    float _171 = in.m_56.z;
    float _173 = in.m_58.x;
    float _175 = in.m_58.y;
    float _177 = in.m_58.z;
    float _179 = in.m_60.x;
    float _181 = in.m_60.y;
    float _183 = in.m_60.z;
    float _185 = in.m_62.x;
    float _187 = in.m_62.y;
    float _189 = in.m_62.z;
    int _191 = as_type<int>(_165) & 1;
    bool _193 = _191 != 0;
    int _195 = as_type<int>(_165) & 2;
    bool _197 = _195 != 0;
    bool _199 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _201 = !_193;
    float _203 = _201 ? (-0.5) : 0.5;
    bool _205 = !_197;
    float _207 = _205 ? (-0.5) : 0.5;
    float _209 = _169 * _175;
    float _211 = _169 * _181;
    float _213 = fma(_167, _173, _209);
    float _215 = _169 * _187;
    float _217 = fma(_167, _179, _211);
    float _219 = fma(_167, _185, _215);
    float _221 = fma(_171, _177, _213);
    float _223 = fma(_171, _183, _217);
    float _225 = fma(_171, _189, _219);
    bool _227 = !_199;
    float _229 = _225;
    float _231 = _223;
    float _249;
    if (!_227)
    {
        float _233 = in.m_64.x;
        float _235 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _237 = _233 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _239 = fma(_237, (*spvDescriptorSet0.vp_c9)._m0[12].x, _143);
        float _241 = _239 * _235;
        float _243 = floor(_241);
        float _245 = -_243;
        float _247 = _241 + _245;
        _249 = _247;
        _251 = true;
    }
    else
    {
        float _253 = float(_109);
        float _255 = 1.0 / _253;
        float _257 = _143 * _255;
        _249 = _257;
    }
    _251 = false;
    float _259 = _249;
    float _261 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _263 = _259 + _261;
    bool _265 = _259 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _267 = isnan(_259);
    bool _269 = _265 || _267;
    bool _271 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _273 = _269 || _271;
    float _275 = float(_273);
    bool _277 = _259 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _279 = isnan(_259);
    bool _281 = _277 || _279;
    bool _283 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _285 = _281 || _283;
    float _287 = float(_285);
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _291 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _289;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _295 = _293 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _297 = -_275;
    float _299 = _297 + 1.0;
    float _301 = 1.0 / _291;
    bool _303 = _259 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _305 = isnan(_259);
    bool _307 = _303 || _305;
    bool _309 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _311 = _307 || _309;
    float _313 = float(_311);
    float _315 = _287 * _299;
    float _317 = -_287;
    float _319 = _317 + 1.0;
    bool _321 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _323 = _313 * _319;
    float _325 = 1.0 / _295;
    float _327 = -_313;
    float _329 = _327 + 1.0;
    float _331 = _263 * _301;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _335 = _259 + _333;
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _339 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _337;
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _343 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _341;
    float _345 = fma(_339, _331, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _347 = fma(_343, _331, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _349 = _335 * _325;
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _353 = _351 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _355 = _345 * _323;
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _359 = _357 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _361 = _347 * _323;
    float _363 = fma(_353, _349, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _365 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[143].x, _355);
    float _367 = fma(_359, _349, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _369 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[143].y, _361);
    float _371 = fma(_363, _315, _365);
    float _373 = fma(_367, _315, _369);
    float _375 = fma(_275, (*spvDescriptorSet0.vp_c9)._m0[145].x, _371);
    float _377 = fma(_275, (*spvDescriptorSet0.vp_c9)._m0[145].y, _373);
    bool _379 = !_321;
    float _397;
    if (!_379)
    {
        float _381 = in.m_64.x;
        float _383 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _385 = _381 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _387 = fma(_385, (*spvDescriptorSet0.vp_c9)._m0[11].y, _143);
        float _389 = _387 * _383;
        float _391 = floor(_389);
        float _393 = -_391;
        float _395 = _389 + _393;
        _397 = _395;
        _399 = true;
    }
    else
    {
        float _401 = float(_109);
        float _403 = 1.0 / _401;
        float _405 = _143 * _403;
        _397 = _405;
    }
    _399 = false;
    float _407 = _397;
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _411 = _407 + _409;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _415 = _413 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _419 = _417 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _421 = _407 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _423 = isnan(_407);
    bool _425 = _421 || _423;
    bool _427 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _429 = _425 || _427;
    float _431 = float(_429);
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _435 = _433 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _437 = _407 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _439 = isnan(_407);
    bool _441 = _437 || _439;
    bool _443 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _445 = _441 || _443;
    float _447 = float(_445);
    float _449 = 1.0 / _415;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _453 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _451;
    float _455 = -_431;
    float _457 = _455 + 1.0;
    bool _459 = _407 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _461 = isnan(_407);
    bool _463 = _459 || _461;
    bool _465 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _467 = _463 || _465;
    float _469 = float(_467);
    float _471 = _447 * _457;
    bool _473 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _475 = 1.0 / _419;
    float _477 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _479 = _477 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _481 = 1.0 / _435;
    float _483 = _453 * _449;
    float _485 = -_447;
    float _487 = _485 + 1.0;
    float _489 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _491 = _489 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _493 = fma(_483, _411, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _495 = _469 * _487;
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _499 = _407 + _497;
    float _501 = _491 * _475;
    bool _503 = _407 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _505 = isnan(_407);
    bool _507 = _503 || _505;
    bool _509 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _511 = _507 || _509;
    float _513 = float(_511);
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _517 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _515;
    float _519 = _493 * _495;
    float _521 = -_469;
    float _523 = _521 + 1.0;
    float _525 = fma(_501, _499, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _527 = -_513;
    float _529 = _527 + 1.0;
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _533 = _407 + _531;
    float _535 = _517 * _481;
    float _537 = fma(_523, (*spvDescriptorSet0.vp_c9)._m0[115].x, _519);
    float _539 = _431 * _529;
    float _541 = fma(_535, _533, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _543 = fma(_525, _471, _537);
    float _545 = in.m_66.x;
    float _547 = in.m_66.y;
    float _549 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _551 = fma(_541, _539, _543);
    float _553 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _555 = _549 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _557 = fma(_513, (*spvDescriptorSet0.vp_c9)._m0[118].x, _551);
    float _559 = _553 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _561 = _557 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_68.x = _555;
    out.m_68.y = _479;
    out.m_68.z = _559;
    out.m_68.w = _561;
    float _563 = _377 * _547;
    float _565 = _375 * _545;
    bool _567 = !_473;
    float _587;
    float _589;
    if (!_567)
    {
        float _569 = in.m_64.x;
        float _571 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _573 = float(_109);
        float _575 = _569 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _577 = fma(_575, (*spvDescriptorSet0.vp_c9)._m0[11].w, _143);
        float _579 = _577 * _571;
        float _581 = floor(_579);
        float _583 = -_581;
        float _585 = _579 + _583;
        _587 = _573;
        _589 = _585;
        _591 = true;
    }
    else
    {
        float _593 = float(_109);
        float _595 = 1.0 / _593;
        float _597 = _143 * _595;
        _587 = _593;
        _589 = _597;
    }
    _591 = false;
    float _599 = _587;
    float _601 = _589;
    float _603 = in.m_64.x;
    float _605 = in.m_64.y;
    float _607 = in.m_64.z;
    float _609 = in.m_64.w;
    float _611 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _613 = int(_611);
    float _615 = _565 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _617 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _619 = _617 != 0;
    float _621 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    int _623 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _625 = _623 != 0;
    int _627 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _629 = _627 != 0;
    int _631 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _633 = _631 != 0;
    float _635 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _637 = !_629;
    int _639 = _637 ? 0 : 1;
    float _641 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _643 = !_625;
    int _645 = _643 ? 0 : 1;
    float _647 = _603 * 2.0;
    float _649 = _607 * 2.0;
    float _651 = _605 * 2.0;
    float _653 = _603 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _655 = floor(_647);
    float _657 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _659 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _661 = -_635;
    float _663 = fma(_653, 2.0, _661);
    float _665 = _605 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _667 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _669 = _603 + (-0.5);
    float _671 = floor(_649);
    float _673 = _605 + _603;
    float _675 = fma(_665, -2.0, _641);
    float _677 = _665;
    if (!_619)
    {
        _677 = _605;
    }
    float _679 = _677;
    float _681 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _683 = _673 + (-1.0);
    float _685 = _679;
    float _687 = _683;
    if (_619)
    {
        _685 = _603;
    }
    float _689 = _685;
    float _691 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[76].y, _675);
    float _693 = floor(_651);
    bool _695 = _655 > 0.0;
    float _697 = fma(_683, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _699 = _655 >= 0.0;
    bool _701 = isnan(_655);
    bool _703 = _699 || _701;
    bool _705 = isnan(0.0);
    bool _707 = _703 || _705;
    float _709 = _689 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _711 = !_633;
    int _713 = _711 ? 0 : 1;
    float _715 = fma(_689, (*spvDescriptorSet0.vp_c9)._m0[83].z, _667);
    if (!_619)
    {
        _687 = _607;
    }
    float _717 = _687;
    float _719 = -_659;
    float _721 = fma(_709, 2.0, _719);
    bool _723 = _671 >= 0.0;
    bool _725 = isnan(_671);
    bool _727 = _723 || _725;
    bool _729 = isnan(0.0);
    bool _731 = _727 || _729;
    float _733 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _735 = int(_733);
    float _737 = _717;
    if (_619)
    {
        _737 = _605;
    }
    float _739 = _737;
    float _741 = -_143;
    float _743 = fma(_741, (*spvDescriptorSet0.vp_c9)._m0[76].x, _663);
    int _745 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _747 = _745 != 0;
    int _749 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _751 = _749 != 0;
    int _753 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _755 = _753 != 0;
    int _757 = _707 ? 0 : 1;
    float _759 = fma(_739, (*spvDescriptorSet0.vp_c9)._m0[83].w, _657);
    bool _761 = _693 > 0.0;
    bool _763 = !_747;
    int _765 = _763 ? 0 : 1;
    float _767 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[82].w, _759);
    bool _769 = _671 > 0.0;
    float _771 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _773 = log2(_771);
    int _775 = _731 ? 0 : 1;
    bool _777 = _693 >= 0.0;
    bool _779 = isnan(_693);
    bool _781 = _777 || _779;
    bool _783 = isnan(0.0);
    bool _785 = _781 || _783;
    float _787 = _739;
    if (!_619)
    {
        _787 = _607;
    }
    float _789 = _787;
    float _791 = _789;
    if (_619)
    {
        _791 = _605;
    }
    float _793 = _791;
    int _795 = ~_775;
    int _797 = _795 + 1;
    int _799 = _797 + 1;
    int _801 = _799;
    if (!_769)
    {
        int _803 = ~_775;
        int _805 = _803 + 1;
        _801 = _805;
    }
    int _807 = _801;
    float _809 = _793 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _811 = abs(_765);
    int _813 = _785 ? 0 : 1;
    float _815 = fma(_809, -2.0, _681);
    float _817 = float(_613);
    float _819 = float(_811);
    float _821 = float(_807);
    float _823 = 1.0 / _817;
    int _825 = ~_813;
    int _827 = _825 + 1;
    int _829 = _827 + 1;
    int _831 = _829;
    if (!_761)
    {
        int _833 = ~_813;
        int _835 = _833 + 1;
        _831 = _835;
    }
    int _837 = _831;
    float _839 = _773 * _143;
    float _841 = _819 * _821;
    float _843 = exp2(_839);
    float _845 = in.m_70.x;
    float _847 = in.m_70.y;
    float _849 = in.m_70.z;
    float _851 = _841 * (-2.0);
    bool _853 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _855 = isnan(1.0);
    bool _857 = _853 || _855;
    bool _859 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _861 = _857 || _859;
    float _863 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _865 = 1.0 + _863;
    int _867 = ~_757;
    int _869 = _867 + 1;
    int _871 = _869 + 1;
    float _873 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _875 = _871;
    if (!_695)
    {
        int _877 = ~_757;
        int _879 = _877 + 1;
        _875 = _879;
    }
    int _881 = _875;
    float _883 = 1.0 / _865;
    float _885 = fma(_603, (*spvDescriptorSet0.vp_c9)._m0[78].z, _873);
    bool _887 = !_751;
    int _889 = _887 ? 0 : 1;
    float _891 = _823 * _143;
    bool _893 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _895 = isnan(0.0);
    bool _897 = _893 || _895;
    bool _899 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _901 = _897 || _899;
    float _903 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _905 = -_843;
    float _907 = _905 + 1.0;
    float _909 = float(_735);
    float _911 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[77].z, _885);
    int _913 = abs(_889);
    float _915 = fma(_605, (*spvDescriptorSet0.vp_c9)._m0[78].w, _903);
    float _917 = _901 ? _907 : 0.0;
    float _919 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[82].z, _715);
    float _921 = _909 * _143;
    float _923 = fma(_851, _845, _845);
    bool _925 = !_755;
    int _927 = _925 ? 0 : 1;
    float _929 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[77].w, _915);
    float _931 = float(_881);
    float _933 = -_143;
    float _935 = fma(_933, (*spvDescriptorSet0.vp_c9)._m0[81].x, _721);
    float _937 = float(_913);
    float _939 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[81].y, _815);
    if (_861)
    {
        float _941 = _917 * _883;
        _145 = _941;
    }
    float _943 = _145;
    float _945 = fma(_697, _851, _697);
    float _947 = fma(_669, (*spvDescriptorSet0.vp_c9)._m0[196].x, _923);
    int _949 = abs(_927);
    float _951 = _937 * _931;
    float _953 = _605 + _607;
    float _955 = fma(_945, _943, _947);
    float _957 = _951 * (-2.0);
    float _959 = _953 + (-1.0);
    float _961 = float(_837);
    float _963 = fma(_957, _847, _847);
    float _965 = float(_949);
    float _967 = fma(_959, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _969 = _607 + _603;
    float _971 = _955 * 0.15915493667125701904296875;
    float _973 = _965 * _961;
    float _975 = _605 + (-0.5);
    float _977 = _969 + (-1.0);
    float _979 = fma(_967, _957, _967);
    float _981 = _973 * (-2.0);
    float _983 = fma(_975, (*spvDescriptorSet0.vp_c9)._m0[196].y, _963);
    float _985 = fma(_977, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _987 = _607 + (-0.5);
    float _989 = fma(_981, _849, _849);
    float _991 = fma(_979, _943, _983);
    float _993 = fma(_985, _981, _985);
    float _995 = _971 * 6.283185482025146484375;
    float _997 = sin(_995);
    float _999 = fma(_987, (*spvDescriptorSet0.vp_c9)._m0[196].z, _989);
    float _1001 = _991 * 0.15915493667125701904296875;
    float _1003 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _203);
    float _1005 = in.m_46.x;
    float _1007 = in.m_46.y;
    float _1009 = in.m_46.z;
    float _1011 = fma(_993, _943, _999);
    float _1013 = _563 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1015 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _207);
    float _1017 = _971 * 6.283185482025146484375;
    float _1019 = cos(_1017);
    float _1021 = _1011 * 0.15915493667125701904296875;
    float _1023 = _615 * _1003;
    float _1025 = _1013 * _1015;
    float _1027 = in.m_58.w;
    float _1029 = _1001 * 6.283185482025146484375;
    float _1031 = sin(_1029);
    float _1033 = _1001 * 6.283185482025146484375;
    float _1035 = cos(_1033);
    float _1037 = _187 * _1007;
    float _1039 = _181 * _1007;
    float _1041 = _1021 * 6.283185482025146484375;
    float _1043 = cos(_1041);
    float _1045 = _997 * _1031;
    float _1047 = _1019 * _1031;
    float _1049 = fma(_185, _1005, _1037);
    float _1051 = fma(_179, _1005, _1039);
    float _1053 = in.m_62.w;
    float _1055 = _1021 * 6.283185482025146484375;
    float _1057 = sin(_1055);
    float _1059 = _1019 * _1035;
    float _1061 = _997 * _1035;
    float _1063 = _1019 * _1043;
    float _1065 = _997 * _1043;
    float _1067 = _1035 * _1043;
    float _1069 = _1031 * _1043;
    float _1071 = _1063 * _1025;
    float _1073 = _1065 * _1025;
    float _1075 = fma(_1057, _1059, _1045);
    float _1077 = -_1025;
    float _1079 = _1057 * _1077;
    float _1081 = -_1061;
    float _1083 = fma(_1057, _1047, _1081);
    float _1085 = fma(_1057, _1045, _1059);
    float _1087 = fma(_1075, _1023, _1071);
    float _1089 = -_1047;
    float _1091 = fma(_1057, _1061, _1089);
    float _1093 = fma(_1067, _1023, _1079);
    float _1095 = _175 * _1007;
    float _1097 = fma(_1083, _621, _1087);
    float _1099 = fma(_1091, _1023, _1073);
    float _1101 = fma(_1069, _621, _1093);
    float _1103 = fma(_173, _1005, _1095);
    float _1105 = _1097 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1107 = fma(_1085, _621, _1099);
    float _1109 = _1097 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1111 = fma(_189, _1009, _1049);
    float _1113 = fma(_1101, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1105);
    float _1115 = fma(_177, _1009, _1103);
    float _1117 = fma(_1101, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1109);
    float _1119 = _1111 + _1053;
    float _1121 = fma(_1107, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1113);
    float _1123 = _1115 + _1027;
    float _1125 = fma(_1107, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1117);
    float _1127 = in.m_60.w;
    float _1129 = _1121 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1131 = _1097 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1133 = _1125 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1135 = fma(_183, _1009, _1051);
    float _1137 = _1119 + _1129;
    float _1139 = fma(_1101, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1131);
    float _1141 = _1123 + _1133;
    float _1143 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1145 = _1137 + _1143;
    float _1147 = fma(_1107, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1139);
    float _1149 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1151 = _1141 + _1149;
    float _1153 = _1145 * _1145;
    float _1155 = _1147 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1157 = fma(_1151, _1151, _1153);
    float _1159 = sqrt(_1157);
    float _1161 = _1135 + _1127;
    float _1163 = _1161 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1165 = _1161 + _1155;
    float _1167 = fma(_1123, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1163);
    float _1169 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1167);
    bool _1171 = _1159 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1173 = _1147;
    float _1175 = _1155;
    float _1177 = _1163;
    float _1179 = _1159;
    if (!_1171)
    {
        _1173 = _1141;
    }
    float _1181 = _1173;
    float _1183 = _1181;
    if (!_1171)
    {
        _1175 = _1137;
    }
    float _1185 = _1175;
    float _1187 = _1185;
    if (!_1171)
    {
        _1177 = _1165;
    }
    float _1189 = _1177;
    bool _1191 = !_1171;
    float _1193 = _1189;
    if (!_1191)
    {
        float _1195 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1197 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1199 = _1159 + _1197;
        float _1201 = rsqrt(_1157);
        float _1203 = _1199 * _1195;
        float _1205 = _1165 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1207 = _1203 * 0.15915493667125701904296875;
        float _1209 = _1207 * 6.283185482025146484375;
        float _1211 = sin(_1209);
        float _1213 = _1207 * 6.283185482025146484375;
        float _1215 = cos(_1213);
        float _1217 = fma(_1211, _1205, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1219 = _1201 * _1217;
        float _1221 = _1215 + (-1.0);
        float _1223 = fma(_1151, _1219, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1225 = fma(_1145, _1219, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1227 = _1221 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1229 = fma(_1165, _1215, _1227);
        _1193 = _1229;
        _1183 = _1223;
        _1187 = _1225;
    }
    float _1231 = _1193;
    float _1233 = _1183;
    float _1235 = _1187;
    float _1237 = -_1161;
    float _1239 = _1237 + _1231;
    float _1241 = -_1123;
    float _1243 = _1241 + _1233;
    float _1245 = _1169 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1247 = _1161 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1249 = _1239 * _1239;
    float _1251 = -_1119;
    float _1253 = _1251 + _1235;
    float _1255 = 1.0 / _1245;
    float _1257 = fma(_1123, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1247);
    float _1259 = fma(_1243, _1243, _1249);
    float _1261 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1257);
    float _1263 = fma(_1253, _1253, _1259);
    bool _1265 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1267 = isnan(0.5);
    bool _1269 = _1265 || _1267;
    bool _1271 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1273 = _1269 || _1271;
    float _1275 = _1261 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1277 = sqrt(_1263);
    bool _1279 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1281 = isnan(0.5);
    bool _1283 = _1279 || _1281;
    bool _1285 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1287 = _1283 || _1285;
    float _1289 = _1275 + _1245;
    float _1291 = _1289 * _1255;
    float _1293 = _1291 * 0.5;
    float _1295 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1297 = fma(_1293, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1295);
    float _1299 = 1.0 / _1297;
    bool _1301 = _1277 > 0.0;
    bool _1303 = !_1301;
    float _1305 = _1233;
    float _1307 = _1231;
    float _1309 = _1235;
    float _1311 = _1239;
    float _1313 = _1245;
    float _1315 = _1297;
    float _1317 = _1277;
    float _1319 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1321 = _1243;
    if (!_1303)
    {
        float _1323 = _223 * _223;
        float _1325 = fma(_221, _221, _1323);
        float _1327 = rsqrt(_1263);
        float _1329 = fma(_225, _225, _1325);
        float _1331 = sqrt(_1329);
        float _1333 = _1243 * _1327;
        float _1335 = _1239 * _1327;
        float _1337 = _1253 * _1327;
        bool _1339 = _1331 > 0.0;
        bool _1341 = !_1339;
        _1313 = _1337;
        _1315 = _1329;
        _1317 = _1327;
        _1319 = _1331;
        _1321 = _1333;
        if (!_1341)
        {
            float _1343 = rsqrt(_1329);
            float _1345 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1347 = _223 * _1343;
            float _1349 = _221 * _1343;
            float _1351 = _225 * _1343;
            float _1353 = _1335 * _1347;
            float _1355 = fma(_1333, _1349, _1353);
            float _1357 = _1345 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1359 = fma(_1337, _1351, _1355);
            float _1361 = _1359 * _1357;
            float _1363 = fma(_221, _1361, _1233);
            float _1365 = fma(_223, _1361, _1231);
            float _1367 = fma(_225, _1361, _1235);
            _1305 = _1363;
            _1307 = _1365;
            _1309 = _1367;
            _1311 = _1361;
            _1317 = _1353;
            _1319 = _1345;
            _1321 = _1357;
        }
    }
    float _1369 = _1305;
    float _1371 = _1307;
    float _1373 = _1309;
    float _1375 = _1311;
    float _1377 = _1313;
    float _1379 = _1315;
    float _1381 = _1317;
    float _1383 = _1319;
    float _1385 = _1321;
    float _1387 = _1383;
    float _1389 = _1379;
    float _1391 = _1377;
    float _1393 = _1375;
    float _1395 = _1381;
    float _1397 = _1385;
    if (_1287)
    {
        _1387 = 1.0;
    }
    float _1399 = _1387;
    float _1401 = _1399;
    if (_1273)
    {
        _1389 = _1369;
    }
    float _1403 = _1389;
    float _1405 = _1403;
    if (_1273)
    {
        _1391 = _1371;
    }
    float _1407 = _1391;
    float _1409 = _1407;
    if (_1273)
    {
        _229 = _1373;
    }
    float _1411 = _229;
    float _1413 = _1411;
    if (!_1273)
    {
        float _1415 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1417 = _1161 + _1415;
        float _1419 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1421 = _1123 + _1419;
        float _1423 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1425 = -_1161;
        float _1427 = _1425 + _1371;
        float _1429 = _1417 * _1417;
        float _1431 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1433 = _1119 + _1431;
        float _1435 = -_1123;
        float _1437 = _1435 + _1369;
        float _1439 = -_1119;
        float _1441 = _1439 + _1373;
        float _1443 = fma(_1421, _1421, _1429);
        float _1445 = fma(_1433, _1433, _1443);
        float _1447 = sqrt(_1445);
        float _1449 = precise::min(_1447, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1451 = _1449 * _1423;
        float _1453 = fma(_1427, _1451, _1161);
        float _1455 = fma(_1437, _1451, _1123);
        float _1457 = fma(_1441, _1451, _1119);
        _1393 = _1451;
        _1409 = _1453;
        _1405 = _1455;
        _1413 = _1457;
        _231 = _1423;
        _1395 = _1429;
    }
    float _1459 = _1393;
    float _1461 = _1409;
    float _1463 = _1405;
    float _1465 = _1413;
    float _1467 = _231;
    float _1469 = _1395;
    float _1471 = _1459;
    if (_1287)
    {
        _1397 = 1.0;
    }
    float _1473 = _1397;
    float _1475 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1477 = _1299 * _1475;
    float _1479 = _1473;
    if (!_1287)
    {
        float _1481 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1483 = _1481 * 0.15915493667125701904296875;
        float _1485 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1487 = _1483 * 6.283185482025146484375;
        float _1489 = cos(_1487);
        float _1491 = _1485 * 0.15915493667125701904296875;
        float _1493 = _1483 * 6.283185482025146484375;
        float _1495 = sin(_1493);
        float _1497 = 1.0 / _1489;
        float _1499 = _1491 * 6.283185482025146484375;
        float _1501 = cos(_1499);
        float _1503 = _1495 * _1497;
        float _1505 = _1491 * 6.283185482025146484375;
        float _1507 = sin(_1505);
        float _1509 = _1501 * _1503;
        float _1511 = 1.0 / _1509;
        float _1513 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1515 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1513;
        float _1517 = 1.0 / _1515;
        float _1519 = _1507 * _1511;
        float _1521 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1523 = fma(_1477, _1519, _1521);
        float _1525 = _1523 * _1517;
        float _1527 = precise::clamp(_1525, 0.0, 1.0);
        _1471 = _1483;
        _1401 = _1527;
    }
    float _1529 = _1471;
    float _1531 = _1401;
    float _1533 = _1529;
    if (!_1287)
    {
        float _1535 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1537 = _1535 * 0.15915493667125701904296875;
        float _1539 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1541 = _1537 * 6.283185482025146484375;
        float _1543 = cos(_1541);
        float _1545 = _1539 * 0.15915493667125701904296875;
        float _1547 = _1537 * 6.283185482025146484375;
        float _1549 = sin(_1547);
        float _1551 = 1.0 / _1543;
        float _1553 = _1545 * 6.283185482025146484375;
        float _1555 = cos(_1553);
        float _1557 = _1549 * _1551;
        float _1559 = _1545 * 6.283185482025146484375;
        float _1561 = sin(_1559);
        float _1563 = _1555 * _1557;
        float _1565 = 1.0 / _1563;
        float _1567 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1569 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1567;
        float _1571 = 1.0 / _1569;
        float _1573 = _1561 * _1565;
        float _1575 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1577 = fma(_1477, _1573, _1575);
        float _1579 = _1577 * _1571;
        float _1581 = precise::clamp(_1579, 0.0, 1.0);
        float _1583 = -_1581;
        float _1585 = _1583 + 1.0;
        _1533 = _1543;
        _1479 = _1585;
    }
    float _1587 = _1533;
    float _1589 = _1479;
    float _1591 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1593 = _1461 + _1591;
    float _1595 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1597 = _1463 + _1595;
    float _1599 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1601 = _1465 + _1599;
    float _1603 = _1593 * _1593;
    float _1605 = fma(_1597, _1597, _1603);
    float _1607 = fma(_1123, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1609 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1611 = fma(_1601, _1601, _1605);
    float _1613 = rsqrt(_1611);
    float _1615 = sqrt(_1611);
    float _1617 = _1613 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1619 = _1597 * _1617;
    float _1621 = _1601 * _1617;
    float _1623 = _1619 * _1619;
    float _1625 = _1621 * _1621;
    float _1627 = _1623 + _1625;
    float _1629 = sqrt(_1627);
    bool _1631 = _1629 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1633 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1635 = _1629 + _1633;
    float _1637 = _1467;
    float _1639 = _1627;
    float _1641 = _1635;
    float _1643 = _1593;
    float _1645 = _1619;
    float _1647 = _1621;
    float _1649 = _1623;
    float _1651 = _1625;
    if (_1631)
    {
        float _1653 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1637 = _1653;
    }
    float _1655 = _1637;
    if (_1631)
    {
        float _1657 = rsqrt(_1627);
        _1639 = _1657;
    }
    float _1659 = _1639;
    float _1661 = _1655;
    if (_1631)
    {
        float _1663 = _1635 * _1655;
        _1641 = _1663;
    }
    float _1665 = _1641;
    if (_1631)
    {
        float _1667 = _1665 * 0.15915493667125701904296875;
        _1179 = _1667;
    }
    float _1669 = _1179;
    float _1671 = _1469;
    if (_1631)
    {
        float _1673 = _1669 * 6.283185482025146484375;
        float _1675 = sin(_1673);
        _1671 = _1675;
    }
    float _1677 = _1671;
    float _1679 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1681 = precise::max(0.0, _1679);
    float _1683 = _1587;
    float _1685 = _1681;
    if (_1631)
    {
        float _1687 = _1669 * 6.283185482025146484375;
        float _1689 = cos(_1687);
        _1683 = _1689;
    }
    float _1691 = _1683;
    float _1693 = -_1617;
    float _1695 = -_1681;
    float _1697 = fma(_1593, _1693, _1695);
    if (_1631)
    {
        float _1699 = _1697 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1643 = _1699;
    }
    float _1701 = _1643;
    float _1703 = _1677;
    float _1705 = _1701;
    if (_1631)
    {
        float _1707 = fma(_1677, _1701, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1703 = _1707;
    }
    float _1709 = _1703;
    float _1711 = _1709;
    if (!_1631)
    {
        _1705 = _1697;
    }
    float _1713 = _1705;
    float _1715 = _1713;
    if (_1631)
    {
        float _1717 = _1691 + (-1.0);
        _1685 = _1717;
    }
    float _1719 = _1685;
    if (_1631)
    {
        float _1721 = _1659 * _1709;
        _1711 = _1721;
    }
    float _1723 = _1711;
    if (_1631)
    {
        float _1725 = _1719 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1661 = _1725;
    }
    float _1727 = _1661;
    if (_1631)
    {
        float _1729 = _1619 * _1723;
        _1645 = _1729;
    }
    float _1731 = _1645;
    if (_1631)
    {
        float _1733 = _1621 * _1723;
        _1647 = _1733;
    }
    float _1735 = _1647;
    float _1737 = floor(_1607);
    if (_1631)
    {
        float _1739 = fma(_1697, _1691, _1727);
        _1715 = _1739;
    }
    float _1741 = _1715;
    if (_1631)
    {
        float _1743 = _1731 * _1731;
        _1649 = _1743;
    }
    float _1745 = _1649;
    if (_1631)
    {
        float _1747 = _1735 * _1735;
        _1651 = _1747;
    }
    float _1749 = _1651;
    float _1751 = _1461 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1753 = fma(_1119, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1755 = fma(_1741, _1741, _1745);
    float _1757 = floor(_1753);
    float _1759 = _1755 + _1749;
    float _1761 = fma(_1463, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1751);
    float _1763 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1765 = fma(_1615, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1763);
    float _1767 = precise::clamp(_1765, 0.0, 1.0);
    float _1769 = _1461 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1771 = fma(_1465, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1761);
    float _1773 = -_1767;
    float _1775 = _1773 + 1.0;
    float _1777 = rsqrt(_1759);
    float _1779 = _1461 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1781 = fma(_1463, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1769);
    float _1783 = _1771 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1785 = _1461 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1787 = fma(_1463, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1779);
    float _1789 = fma(_1465, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1781);
    float _1791 = _1783 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1793 = abs(_1775);
    float _1795 = log2(_1793);
    float _1797 = fma(_1465, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1787);
    float _1799 = _1789 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1801 = fma(_1463, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1785);
    float _1803 = -_1791;
    float _1805 = fma(_1803, _1609, 1.0);
    float _1807 = _1797 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1809 = _1799 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1811 = fma(_1465, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1801);
    float _1813 = _1777 * _1731;
    float _1815 = _1777 * _1741;
    float _1817 = fma(_1807, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1809);
    float _1819 = _1777 * _1735;
    float _1821 = _1813 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1823 = _1811 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1825 = fma(_1783, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1817);
    float _1827 = -_1737;
    float _1829 = _1607 + _1827;
    float _1831 = -_1821;
    float _1833 = fma(_1815, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1831);
    float _1835 = _1795 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1837 = fma(_1823, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1825);
    float _1839 = log2(_1805);
    float _1841 = -_1819;
    float _1843 = fma(_1841, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1833);
    float _1845 = -_1757;
    float _1847 = _1753 + _1845;
    float _1849 = _1799 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1851 = _1799 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1853 = fma(_1843, -0.5, 0.5);
    float _1855 = _1815 + 1.0;
    float _1857 = fma(_1807, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1849);
    float _1859 = 1.0 / _1837;
    float _1861 = fma(_1783, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1857);
    float _1863 = fma(_1823, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1861);
    float _1865 = exp2(_1835);
    float _1867 = _1839 * 0.693147182464599609375;
    float _1869 = _1867 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1871 = sqrt(_1853);
    float _1873 = fma(_1843, 0.5, 0.5);
    float _1875 = fma(_1807, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1851);
    float _1877 = fma(_1873, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1879 = fma(_1783, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1875);
    float _1881 = _1863 * _1859;
    float _1883 = -_1815;
    float _1885 = fma(_1865, _1855, _1883);
    float _1887 = fma(_1873, _1877, -0.212114393711090087890625);
    float _1889 = fma(_1823, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1879);
    float _1891 = fma(_1881, 0.5, 0.5);
    float _1893 = fma(_1885, 0.5, 0.5);
    float _1895 = fma(_1873, _1887, 1.570728778839111328125);
    float _1897 = _1889 * _1859;
    float _1899 = _1871 * 0.636619746685028076171875;
    float _1901 = fma(_1897, -0.5, 0.5);
    float _1903 = -_1895;
    float _1905 = fma(_1899, _1903, 1.0);
    float2 _5825 = float2(_1829, _1847);
    float _1907 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5825, float2(0.0), isnan(_5825)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5825, float2(0.0), isnan(_5825)), level(0.0)).x;
    float3 _5836 = float3(_1891, _1901, _1869);
    float _1909 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5836, float3(0.0), isnan(_5836)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5836, float3(0.0), isnan(_5836)), level(0.0)).x;
    float3 _5847 = float3(_1891, _1901, _1869);
    float4 _1912 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5847, float3(0.0), isnan(_5847)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5847, float3(0.0), isnan(_5847)), level(0.0)).xyzw;
    float _1914 = _1912.x;
    float _1916 = _1912.y;
    float _1918 = _1912.z;
    float _1920 = _1912.w;
    float2 _5863 = float2(_1905, _1893);
    float3 _1924 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5863, float2(0.0), isnan(_5863)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5863, float2(0.0), isnan(_5863)), level(0.0)).xyz;
    float _1926 = _1924.x;
    float _1928 = _1924.y;
    float _1930 = _1924.z;
    float _1932 = float(uint(_735));
    float _1934 = trunc(_891);
    int _1936 = int(_1934);
    int _1938 = abs(_645);
    float _1940 = -_911;
    float _1942 = _1940 + 1.0;
    bool _1944 = _605 > 0.5;
    float _1946 = -_929;
    float _1948 = _1946 + 1.0;
    int _1950 = ~_735;
    int _1952 = _1950 + 1;
    float _1954 = -_919;
    float _1956 = _1954 + 1.0;
    float _1958 = -_207;
    int _1960 = _1944 ? as_type<int>(_1958) : as_type<int>(_207);
    float _1962 = 1.0 / _1932;
    bool _1964 = _603 > 0.5;
    float _1966 = -_767;
    float _1968 = _1966 + 1.0;
    bool _1970 = _607 > 0.5;
    float _1972 = _1795 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1974 = float(uint(_1936));
    float _1976 = 1.0 / _599;
    int _1978 = as_type<int>(_1962) + (-2);
    float _1980 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1982 = as_type<float>(_1978) * _1974;
    float _1984 = trunc(_1982);
    float _1986 = precise::max(_1984, 0.0);
    uint _1989 = uint(_1986);
    float _1991 = _921 * _1976;
    bool _1993 = !_619;
    float _1995 = _1993 ? 7.345489978790283203125 : 1.0;
    float _1997 = trunc(_1991);
    int _1999 = int(_1997);
    int _2001 = ~_735;
    int _2003 = _2001 + 1;
    float _2005 = _1980 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _2007 = _1952 * int(_1989);
    int _2009 = _2007 + _1936;
    float _2011 = exp2(_1972);
    float _2013 = float(uint(_2009));
    float _2015 = as_type<float>(_1978) * _2013;
    float _2017 = _1995 * _603;
    float _2019 = float(_1936);
    float _2021 = -_203;
    int _2023 = _1964 ? as_type<int>(_2021) : as_type<int>(_203);
    float _2025 = floor(_2017);
    bool _2027 = _2019 >= _909;
    bool _2029 = isnan(_2019);
    bool _2031 = _2027 || _2029;
    bool _2033 = isnan(_909);
    bool _2035 = _2031 || _2033;
    float _2037 = float(_2035);
    float _2039 = -_2011;
    float _2041 = _2039 + 1.0;
    float _2043 = trunc(_2015);
    float _2045 = precise::max(_2043, 0.0);
    uint _2047 = uint(_2045);
    float _2049 = trunc(_2037);
    int _2051 = int(_2049);
    float _2053 = -_2025;
    float _2055 = _2017 + _2053;
    float _2057 = _2055 * _909;
    int _2059 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2061 = _2059 != 0;
    int _2063 = int(_1989) + int(_2047);
    float _2065 = trunc(_2057);
    int _2067 = int(_2065);
    int _2069 = _735 + (-1);
    int _2071 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2073 = _2071 != 0;
    int _2075 = _2003 * _2063;
    int _2077 = _2075 + _1936;
    int _2079 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2081 = _2079 != 0;
    int _2083 = ~_2051;
    int _2085 = _2083 + 1;
    int _2087 = _2085 + 1;
    bool _2089 = uint(_2077) >= uint(_735);
    bool _2091 = !_2061;
    int _2093 = _2091 ? 0 : 1;
    bool _2095 = !_2089;
    int _2097 = _2095 ? 0 : (-1);
    bool _2099 = _735 == 0;
    int _2101 = ~_2063;
    int _2103 = _2101 + _2097;
    int _2105 = _2103 + 1;
    int _2107 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2109 = _2107 != 0;
    int _2111 = abs(_639);
    int _2113 = _735 * _2105;
    int _2115 = _2113 + _1936;
    int _2117 = abs(_2093);
    bool _2119 = !_2073;
    float _2121 = _2119 ? _207 : as_type<float>(_1960);
    bool _2123 = !_2099;
    int _2125 = _2123 ? _2115 : (-1);
    int _2127 = _2067 * _2117;
    int _2129 = _2127 + _1936;
    bool _2131 = !_2081;
    float _2133 = _2131 ? _203 : as_type<float>(_2023);
    int _2135 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2137 = _2135 != 0;
    int _2139 = _2125 * _2087;
    int _2141 = ~_735;
    int _2143 = _2141 + 1;
    int _2145 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2147 = _2145 != 0;
    int _2149 = _2051 * _2069;
    int _2151 = _2149 + _2139;
    bool _2153 = !_2109;
    int _2155 = _2153 ? 0 : 1;
    int _2157 = abs(_713);
    int _2159 = _2151 * _2111;
    int _2161 = abs(_2155);
    int _2163 = _1999 * _1938;
    int _2165 = _2163 + _2159;
    float _2167 = float(uint(_2129));
    int _2169 = ~_735;
    int _2171 = _2169 + 1;
    int _2173 = _2129 * _2157;
    int _2175 = _2173 + _2165;
    bool _2177 = _609 > 0.5;
    int _2179 = _2067 * _2161;
    int _2181 = _2179 + _2175;
    int _2183 = ~_735;
    int _2185 = _2183 + 1;
    float _2187 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2189 = _2187 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2191 = float(uint(_2181));
    float _2193 = as_type<float>(_1978) * _2191;
    float _2195 = 1.0 / _2189;
    float _2197 = trunc(_2193);
    float _2199 = precise::max(_2197, 0.0);
    uint _2201 = uint(_2199);
    int _2203 = _2185 * int(_2201);
    int _2205 = _2203 + _2181;
    float _2207 = float(uint(_2205));
    float _2209 = as_type<float>(_1978) * _2207;
    float _2211 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2213 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2211;
    float _2215 = _2133 + 0.5;
    float _2217 = trunc(_2209);
    float _2219 = precise::max(_2217, 0.0);
    uint _2221 = uint(_2219);
    float _2223 = _2213 * _2195;
    float _2225 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2227 = _601 + _2225;
    float _2229 = fma(_2223, _2227, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _2231 = as_type<float>(_1978) * _2167;
    float _2233 = _2121 + (-0.5);
    float _2235 = trunc(_2231);
    float _2237 = precise::max(_2235, 0.0);
    uint _2239 = uint(_2237);
    int _2241 = int(_2201) + int(_2221);
    bool _2243 = _601 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2245 = isnan(_601);
    bool _2247 = _2243 || _2245;
    bool _2249 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2251 = _2247 || _2249;
    float _2253 = float(_2251);
    bool _2255 = _601 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2257 = isnan(_601);
    bool _2259 = _2255 || _2257;
    bool _2261 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2263 = _2259 || _2261;
    float _2265 = float(_2263);
    int _2267 = _2171 * _2241;
    int _2269 = _2267 + _2181;
    float _2271 = -_2265;
    float _2273 = _2271 + 1.0;
    bool _2275 = uint(_2269) >= uint(_735);
    float _2277 = _2253 * _2273;
    bool _2279 = !_2275;
    int _2281 = _2279 ? 0 : (-1);
    float _2283 = _2229 * _2277;
    float _2285 = -_2233;
    float _2287 = -_691;
    float _2289 = fma(_2285, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2287);
    float _2291 = -_2253;
    float _2293 = _2291 + 1.0;
    float _2295 = fma(_2215, (*spvDescriptorSet0.vp_c9)._m0[80].x, _743);
    float _2297 = -_203;
    int _2299 = _1970 ? as_type<int>(_2297) : as_type<int>(_203);
    float _2301 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2303 = fma(_2293, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2283);
    int _2305 = ~_2241;
    int _2307 = _2305 + _2281;
    int _2309 = _2307 + 1;
    int _2311 = _2143 * int(_2239);
    int _2313 = _2311 + _2129;
    float _2315 = -_207;
    int _2317 = _2177 ? as_type<int>(_2315) : as_type<int>(_207);
    float _2319 = -_1942;
    float _2321 = fma(_2133, _2319, _2295);
    bool _2323 = !_2147;
    float _2325 = _2323 ? _203 : as_type<float>(_2299);
    int _2327 = _735 * _2309;
    int _2329 = _2327 + _2181;
    float _2331 = float(uint(_2313));
    float _2333 = fma(_2121, _1948, _2289);
    float _2335 = abs(_1477);
    float _2337 = log2(_2335);
    bool _2339 = !_2137;
    float _2341 = _2339 ? _207 : as_type<float>(_2317);
    float _2343 = fma(_2265, (*spvDescriptorSet0.vp_c9)._m0[132].x, _2303);
    int _2345 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2347 = _2345 != 0;
    float _2349 = as_type<float>(_1978) * _2331;
    bool _2351 = !_2099;
    int _2353 = _2351 ? _2329 : (-1);
    float _2355 = _2301 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2357 = _2325 + 0.5;
    float _2359 = _2341 + (-0.5);
    int _2361 = ~_735;
    int _2363 = _2361 + 1;
    float _2365 = trunc(_2349);
    float _2367 = precise::max(_2365, 0.0);
    uint _2369 = uint(_2367);
    float _2371 = fma(_2005, _2357, _935);
    float _2373 = -_2355;
    float _2375 = -_939;
    float _2377 = fma(_2373, _2359, _2375);
    int _2379 = _2353 & 3;
    bool _2381 = _2379 != 0;
    float _2383 = _1083 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2385 = -_1956;
    float _2387 = fma(_2325, _2385, _2371);
    float _2389 = _2337 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _2391 = _2353 >> 31;
    float _2393 = fma(_2341, _1968, _2377);
    float _2395 = _1063 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2397 = _203 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2399 = exp2(_2389);
    int _2401 = _2391 & 3;
    out.m_72.x = _2321;
    out.m_72.y = _2333;
    out.m_72.z = _2387;
    out.m_72.w = _2393;
    float _2403 = _1063 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2405 = _1063 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2407 = -_1057;
    float _2409 = fma(_2407, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2395);
    int _2411 = int(_2239) + int(_2369);
    float _2413 = _1083 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2415 = -_1057;
    float _2417 = fma(_2415, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2405);
    float _2419 = _2343 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _2421 = _2363 * _2411;
    int _2423 = _2421 + _2129;
    float _2425 = fma(_1069, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2413);
    int _2427 = _2381 ? 0 : 1;
    float _2429 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2417);
    bool _2431 = _1477 <= 8000.0;
    bool _2433 = isnan(_1477);
    bool _2435 = _2431 || _2433;
    bool _2437 = isnan(8000.0);
    bool _2439 = _2435 || _2437;
    float _2441 = float(_2439);
    float _2443 = -_1057;
    float _2445 = fma(_2443, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2403);
    int _2447 = _2353 + _2401;
    float _2449 = fma(_2399, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2451 = precise::clamp(_2449, 0.0, 1.0);
    float _2453 = _1075 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2455 = uint(_2423) >= uint(_735);
    float _2457 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2445);
    int _2459 = _2447 >> 2;
    float _2461 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2453);
    float _2463 = _1083 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2465 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2409);
    int _2467 = _2459 << 4;
    int _2469 = _2467 + 368;
    float _2471 = _1075 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2473 = fma(_1069, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2463);
    int _2475 = _2353 & 3;
    bool _2477 = _2475 != 0;
    uint _2479 = uint(int(uint(_2469) >> uint(2)));
    uint _2481 = uint(int(uint(int(_2479)) >> uint(2)));
    int _2483 = int(_2479) & 3;
    float _2485 = (*spvDescriptorSet0.vp_c9)._m0[int(_2481)][_2483];
    int _2487 = int(_2479) + 1;
    uint _2489 = uint(int(uint(_2487) >> uint(2)));
    int _2491 = _2487 & 3;
    float _2493 = (*spvDescriptorSet0.vp_c9)._m0[int(_2489)][_2491];
    float _2495 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2471);
    float _2497 = _207 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2499 = uint(_2475) > 1u;
    float _2501 = fma(_1069, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2383);
    int _2503 = ~_2427;
    int _2505 = _2503 + 1;
    int _2507 = _2505 + 1;
    float _2509 = _2497 * _2465;
    float _2511 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2461);
    int _2513 = _2469 + 8;
    uint _2515 = uint(int(uint(_2513) >> uint(2)));
    uint _2517 = uint(int(uint(int(_2515)) >> uint(2)));
    int _2519 = int(_2515) & 3;
    float _2521 = (*spvDescriptorSet0.vp_c9)._m0[int(_2517)][_2519];
    int _2523 = int(_2515) + 1;
    uint _2525 = uint(int(uint(_2523) >> uint(2)));
    int _2527 = _2523 & 3;
    float _2529 = (*spvDescriptorSet0.vp_c9)._m0[int(_2525)][_2527];
    float _2531 = _2497 * _2429;
    float _2533 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2495);
    float _2535 = fma(_2451, -2.0, 3.0);
    float _2537 = _2451 * _2451;
    bool _2539 = uint(_2475) >= 2u;
    float _2541 = _1075 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2543 = _2497 * _2457;
    int _2545 = _2507;
    if (!_2499)
    {
        int _2547 = ~_2427;
        int _2549 = _2547 + 1;
        _2545 = _2549;
    }
    int _2551 = _2545;
    float _2553 = _2537 * _2535;
    bool _2555 = _2475 != 3;
    float _2557 = fma(_1085, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2473);
    int _2559 = abs(_2551);
    float _2561 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2541);
    int _2563 = _2539 ? 0 : 1;
    float _2565 = -_1907;
    float _2567 = _2565 + 1.0;
    float _2569 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2561);
    bool _2571 = !_2455;
    int _2573 = _2571 ? 0 : (-1);
    float _2575 = fma(_2397, _2511, _2543);
    bool _2577 = !_2477;
    int _2579 = _2577 ? 0 : 1;
    float _2581 = fma(_2397, _2569, _2531);
    bool _2583 = _2475 != 3;
    float _2585 = fma(_1085, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2425);
    int _2587 = ~_2563;
    int _2589 = _2587 + 1;
    int _2591 = _2589 + 1;
    float _2593 = fma(_1085, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2501);
    int _2595 = _2591;
    if (_2555)
    {
        int _2597 = ~_2563;
        int _2599 = _2597 + 1;
        _2595 = _2599;
    }
    int _2601 = _2595;
    out.m_74.w = _2419;
    int _2603 = ~_2559;
    int _2605 = _2603 + 1;
    int _2607 = _2605 + 1;
    int _2609 = ~_2411;
    int _2611 = _2609 + _2573;
    int _2613 = _2611 + 1;
    bool _2615 = !_2583;
    int _2617 = _2615 ? 0 : (-1);
    int _2619 = abs(_2579);
    int _2621 = _735 * _2613;
    int _2623 = _2621 + _2129;
    int _2625 = abs(_2601);
    float _2627 = fma(_2397, _2533, _2509);
    int _2629 = abs(_2617);
    float _2631 = in.m_76.x;
    int _2633 = _2607 * as_type<int>(_2493);
    bool _2635 = !_2347;
    int _2637 = _2635 ? 0 : 1;
    float _2639 = _1837 * 0.5;
    int _2641 = ~_2619;
    int _2643 = _2641 + 1;
    int _2645 = _2643 + 1;
    float _2647 = _2041 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2649 = _2585 + _2627;
    int _2651 = abs(_2637);
    int _2653 = _2645 * as_type<int>(_2485);
    int _2655 = _2653 + _2633;
    int _2657 = ~_2625;
    int _2659 = _2657 + 1;
    int _2661 = _2659 + 1;
    float _2663 = _2647 * _1909;
    float _2665 = _2593 + _2581;
    int _2667 = ~_2629;
    int _2669 = _2667 + 1;
    int _2671 = _2669 + 1;
    int _2673 = _2661 * as_type<int>(_2521);
    int _2675 = _2673 + _2655;
    float _2677 = _1799 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2679 = ~_2651;
    int _2681 = _2679 + 1;
    int _2683 = _2681 + 1;
    float _2685 = -_2553;
    float _2687 = _2685 + 1.0;
    int _2689 = _2671 * as_type<int>(_2529);
    int _2691 = _2689 + _2675;
    float _2693 = fma(_1807, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2677);
    bool _2695 = !_2099;
    int _2697 = _2695 ? _2623 : (-1);
    float _2699 = fma(_2687, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2553);
    int _2701 = _2691 * _2683;
    float _2703 = fma(_1783, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2693);
    float _2705 = _2441 * _2699;
    int _2707 = _2697 * _2651;
    int _2709 = _2707 + _2701;
    float _2711 = fma(_1823, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2703);
    float _2713 = _2705 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2715 = fma(_1889, -0.5, _2639);
    float _2717 = float(_2709);
    float _2719 = _2711 + _1837;
    float _2721 = _1863 + _1837;
    float _2723 = _2567 * _2713;
    float _2725 = precise::clamp(_2723, 0.0, 1.0);
    float _2727 = _1930 * _2663;
    float _2729 = _2719 * 0.5;
    float _2731 = _2721 * 0.5;
    float _2733 = -_2725;
    float _2735 = fma(_2733, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_78.x = _2717;
    float _2737 = _2557 + _2575;
    float _2739 = fma(_1920, _2727, _1918);
    float _2741 = _2735 * _2631;
    out.m_80.x = _2731;
    out.m_80.y = _2715;
    out.m_80.z = _2729;
    out.m_80.w = _1837;
    bool _2743 = _1615 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2745 = isnan(_1615);
    bool _2747 = _2743 || _2745;
    bool _2749 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2751 = _2747 || _2749;
    float _2753 = _2741 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_82.x = _2737;
    out.m_82.y = _2649;
    out.m_82.z = _2665;
    out.m_84.x = _2753;
    out.gl_Position.x = _1863;
    out.gl_Position.y = _1889;
    out.gl_Position.z = _2711;
    out.gl_Position.w = _1837;
    float _2755 = _1920 * _2663;
    float _2757 = -_2647;
    float _2759 = _2757 + 1.0;
    float _2761 = _2729;
    float _2763 = _2755;
    if (!_2751)
    {
        _2761 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2765 = _2761;
    float _2767 = fma(_1926, _2755, _1914);
    float _2769 = fma(_1928, _2755, _1916);
    float _2771 = _1920 * _2759;
    float _2773 = _1531 * _1589;
    float _2775 = _2773;
    float _2777 = _2765;
    float _2779 = _2765;
    if (!_2751)
    {
        _2763 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2781 = _2763;
    out.m_86.x = _2767;
    out.m_86.y = _2769;
    out.m_86.z = _2739;
    out.m_86.w = _2771;
    float _2783 = _2773 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2785 = _2781;
    float _2787 = _2781;
    if (!_2751)
    {
        _2775 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2789 = _2775;
    bool _2791 = !_2751;
    float _2793 = _2789;
    float _2795 = _2789;
    if (!_2791)
    {
        bool _2797 = _1615 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2799 = isnan(_1615);
        bool _2801 = _2797 || _2799;
        bool _2803 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2805 = _2801 || _2803;
        if (!_2805)
        {
            float _2807 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2809 = _1615 + _2807;
            float _2811 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2813 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2811;
            float _2815 = 1.0 / _2813;
            float _2817 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2819 = _2817 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2821 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2823 = _2821 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2825 = _2809 * _2815;
            float _2827 = precise::clamp(_2825, 0.0, 1.0);
            float _2829 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2831 = _2829 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2833 = fma(_2827, _2823, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2835 = fma(_2827, _2831, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2837 = fma(_2827, _2819, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            _2787 = _2837;
            _2779 = _2835;
            _2795 = _2833;
            _2839 = true;
        }
        else
        {
            bool _2841 = _1615 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2843 = isnan(_1615);
            bool _2845 = _2841 || _2843;
            bool _2847 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2849 = _2845 || _2847;
            if (!_2849)
            {
                _2777 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2851 = _2777;
            _2779 = _2851;
            if (!_2849)
            {
                _2785 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2853 = _2785;
            _2787 = _2853;
            if (!_2849)
            {
                _2793 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2855 = _2793;
            bool _2857 = !_2849;
            _2795 = _2855;
            if (!_2857)
            {
                bool _2859 = _1615 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2861 = isnan(_1615);
                bool _2863 = _2859 || _2861;
                bool _2865 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2867 = _2863 || _2865;
                if (!_2867)
                {
                    float _2869 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2871 = _1615 + _2869;
                    float _2873 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2875 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2873;
                    float _2877 = 1.0 / _2875;
                    float _2879 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2881 = _2879 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2883 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2885 = _2883 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2887 = _2871 * _2877;
                    float _2889 = precise::clamp(_2887, 0.0, 1.0);
                    float _2891 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2893 = _2891 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2895 = fma(_2889, _2885, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2897 = fma(_2889, _2893, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2899 = fma(_2889, _2881, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    _2787 = _2899;
                    _2779 = _2897;
                    _2795 = _2895;
                    _2839 = true;
                }
                else
                {
                    _2787 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2779 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2795 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _2839 = false;
    float _2901 = _2787;
    float _2903 = _2779;
    float _2905 = _2795;
    float _2907 = _2783 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_88.x = 0.0;
    float _2909 = _2901 * 0.586610972881317138671875;
    bool _2911 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_49.x = _2907;
    float _2913 = fma(_2903, 0.298911988735198974609375, _2909);
    bool _2915 = _1531 > 0.0;
    bool _2917 = isnan(_1531);
    bool _2919 = _2915 || _2917;
    bool _2921 = isnan(0.0);
    bool _2923 = _2919 || _2921;
    float _2925 = fma(_2905, 0.114477999508380889892578125, _2913);
    bool _2927 = _1589 <= 0.0;
    bool _2929 = !_2923;
    bool _2931 = _2927 || _2929;
    float _2933 = -_2925;
    float _2935 = _2933 + _2903;
    float _2937 = -_2925;
    float _2939 = _2937 + _2901;
    float _2941 = -_2925;
    float _2943 = _2941 + _2905;
    float _2945 = fma(_2935, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2925);
    float _2947 = fma(_2939, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2925);
    float _2949 = fma(_2943, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2925);
    bool _2951 = !_2911;
    if (!_2951)
    {
        float _2953 = -_1461;
        float _2955 = _2953 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2957 = -_1463;
        float _2959 = _2957 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2961 = -_1465;
        float _2963 = _2961 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2965 = _2955 * _2955;
        float _2967 = fma(_2959, _2959, _2965);
        float _2969 = fma(_2963, _2963, _2967);
        float _2971 = sqrt(_2969);
        float _2973 = rsqrt(_2969);
        float _2975 = -_2971;
        float _2977 = _2975 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2979 = _2977 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2981 = precise::clamp(_2979, 0.0, 1.0);
        float _2983 = _2959 * _2973;
        float _2985 = _2955 * _2973;
        float _2987 = abs(_2981);
        float _2989 = log2(_2987);
        float _2991 = _2963 * _2973;
        float _2993 = _2983 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2995 = _2649 * _2985;
        float _2997 = -_2985;
        float _2999 = -_2993;
        float _3001 = fma(_2997, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2999);
        float _3003 = fma(_2737, _2983, _2995);
        float _3005 = -_2991;
        float _3007 = fma(_3005, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3001);
        float _3009 = fma(_2665, _2991, _3003);
        float _3011 = precise::clamp(_3009, 0.0, 1.0);
        float _3013 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3015 = _3007 + _3013;
        float _3017 = _2989 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3019 = _3015 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3021 = precise::clamp(_3019, 0.0, 1.0);
        float _3023 = exp2(_3017);
        float _3025 = _3023 * _3021;
        float _3027 = _3011 * _3025;
        float _3029 = _3027 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3031 = _3027 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3033 = _3027 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_88.x = _3029;
        out.m_88.y = _3031;
        out.m_88.z = _3033;
    }
    out.m_90.x = _2945;
    out.m_90.y = _2947;
    out.m_90.z = _2949;
    if (!_2931)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_49.x = 0.0;
    float _3035 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3035;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2839 = false;
    bool _591 = false;
    bool _399 = false;
    bool _251 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _104 = in.m_46.w;
    float _106 = trunc(_104);
    int _109 = int(_106);
    bool _113 = _109 >= 1;
    float _115 = 0.0;
    if (!_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _115;
    float _119 = _117;
    if (!_113)
    {
        out.m_49.x = 0.0;
    }
    int _121 = 0;
    if (!_113)
    {
        float _123 = _117 * 5.0;
        _121 = as_type<int>(_123);
    }
    int _125 = _121;
    int _127 = _125;
    if (!_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3092 = as_type<float>(_125);
        out.gl_Position.z = _3092;
    }
    if (!_113)
    {
        return out;
    }
    float _129 = in.m_51.w;
    bool _131 = _129 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _133 = isnan(_129);
    bool _135 = _131 || _133;
    bool _137 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _139 = _135 || _137;
    float _141 = -_129;
    float _143 = _141 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _145 = _143;
    if (_139)
    {
        float _147 = float(_109);
        _119 = _147;
    }
    float _149 = _119;
    bool _151 = _143 >= _149;
    bool _153 = !_139;
    bool _155 = _151 || _153;
    float _157 = _149;
    if (_155)
    {
        _157 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _159 = _157;
    if (_155)
    {
        out.m_49.x = 0.0;
    }
    if (_155)
    {
        float _161 = _159 * 5.0;
        _127 = as_type<int>(_161);
    }
    int _163 = _127;
    if (_155)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3162 = as_type<float>(_163);
        out.gl_Position.z = _3162;
    }
    if (_155)
    {
        return out;
    }
    float _165 = as_type<float>(int(gl_VertexIndex));
    float _167 = in.m_56.x;
    float _169 = in.m_56.y;
    float _171 = in.m_56.z;
    float _173 = in.m_58.x;
    float _175 = in.m_58.y;
    float _177 = in.m_58.z;
    float _179 = in.m_60.x;
    float _181 = in.m_60.y;
    float _183 = in.m_60.z;
    float _185 = in.m_62.x;
    float _187 = in.m_62.y;
    float _189 = in.m_62.z;
    int _191 = as_type<int>(_165) & 1;
    bool _193 = _191 != 0;
    int _195 = as_type<int>(_165) & 2;
    bool _197 = _195 != 0;
    bool _199 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _201 = !_193;
    float _203 = _201 ? (-0.5) : 0.5;
    bool _205 = !_197;
    float _207 = _205 ? (-0.5) : 0.5;
    float _209 = _169 * _175;
    float _211 = _169 * _181;
    float _213 = fma(_167, _173, _209);
    float _215 = _169 * _187;
    float _217 = fma(_167, _179, _211);
    float _219 = fma(_167, _185, _215);
    float _221 = fma(_171, _177, _213);
    float _223 = fma(_171, _183, _217);
    float _225 = fma(_171, _189, _219);
    bool _227 = !_199;
    float _229 = _225;
    float _231 = _223;
    float _249;
    if (!_227)
    {
        float _233 = in.m_64.x;
        float _235 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _237 = _233 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _239 = fma(_237, (*spvDescriptorSet0.vp_c9)._m0[12].x, _143);
        float _241 = _239 * _235;
        float _243 = floor(_241);
        float _245 = -_243;
        float _247 = _241 + _245;
        _249 = _247;
        _251 = true;
    }
    else
    {
        float _253 = float(_109);
        float _255 = 1.0 / _253;
        float _257 = _143 * _255;
        _249 = _257;
    }
    _251 = false;
    float _259 = _249;
    float _261 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _263 = _259 + _261;
    bool _265 = _259 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _267 = isnan(_259);
    bool _269 = _265 || _267;
    bool _271 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _273 = _269 || _271;
    float _275 = float(_273);
    bool _277 = _259 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _279 = isnan(_259);
    bool _281 = _277 || _279;
    bool _283 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _285 = _281 || _283;
    float _287 = float(_285);
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _291 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _289;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _295 = _293 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _297 = -_275;
    float _299 = _297 + 1.0;
    float _301 = 1.0 / _291;
    bool _303 = _259 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _305 = isnan(_259);
    bool _307 = _303 || _305;
    bool _309 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _311 = _307 || _309;
    float _313 = float(_311);
    float _315 = _287 * _299;
    float _317 = -_287;
    float _319 = _317 + 1.0;
    bool _321 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _323 = _313 * _319;
    float _325 = 1.0 / _295;
    float _327 = -_313;
    float _329 = _327 + 1.0;
    float _331 = _263 * _301;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _335 = _259 + _333;
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _339 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _337;
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _343 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _341;
    float _345 = fma(_339, _331, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _347 = fma(_343, _331, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _349 = _335 * _325;
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _353 = _351 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _355 = _345 * _323;
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _359 = _357 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _361 = _347 * _323;
    float _363 = fma(_353, _349, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _365 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[143].x, _355);
    float _367 = fma(_359, _349, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _369 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[143].y, _361);
    float _371 = fma(_363, _315, _365);
    float _373 = fma(_367, _315, _369);
    float _375 = fma(_275, (*spvDescriptorSet0.vp_c9)._m0[145].x, _371);
    float _377 = fma(_275, (*spvDescriptorSet0.vp_c9)._m0[145].y, _373);
    bool _379 = !_321;
    float _397;
    if (!_379)
    {
        float _381 = in.m_64.x;
        float _383 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _385 = _381 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _387 = fma(_385, (*spvDescriptorSet0.vp_c9)._m0[11].y, _143);
        float _389 = _387 * _383;
        float _391 = floor(_389);
        float _393 = -_391;
        float _395 = _389 + _393;
        _397 = _395;
        _399 = true;
    }
    else
    {
        float _401 = float(_109);
        float _403 = 1.0 / _401;
        float _405 = _143 * _403;
        _397 = _405;
    }
    _399 = false;
    float _407 = _397;
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _411 = _407 + _409;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _415 = _413 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _419 = _417 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _421 = _407 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _423 = isnan(_407);
    bool _425 = _421 || _423;
    bool _427 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _429 = _425 || _427;
    float _431 = float(_429);
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _435 = _433 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _437 = _407 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _439 = isnan(_407);
    bool _441 = _437 || _439;
    bool _443 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _445 = _441 || _443;
    float _447 = float(_445);
    float _449 = 1.0 / _415;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _453 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _451;
    float _455 = -_431;
    float _457 = _455 + 1.0;
    bool _459 = _407 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _461 = isnan(_407);
    bool _463 = _459 || _461;
    bool _465 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _467 = _463 || _465;
    float _469 = float(_467);
    float _471 = _447 * _457;
    bool _473 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _475 = 1.0 / _419;
    float _477 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _479 = _477 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _481 = 1.0 / _435;
    float _483 = _453 * _449;
    float _485 = -_447;
    float _487 = _485 + 1.0;
    float _489 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _491 = _489 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _493 = fma(_483, _411, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _495 = _469 * _487;
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _499 = _407 + _497;
    float _501 = _491 * _475;
    bool _503 = _407 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _505 = isnan(_407);
    bool _507 = _503 || _505;
    bool _509 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _511 = _507 || _509;
    float _513 = float(_511);
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _517 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _515;
    float _519 = _493 * _495;
    float _521 = -_469;
    float _523 = _521 + 1.0;
    float _525 = fma(_501, _499, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _527 = -_513;
    float _529 = _527 + 1.0;
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _533 = _407 + _531;
    float _535 = _517 * _481;
    float _537 = fma(_523, (*spvDescriptorSet0.vp_c9)._m0[115].x, _519);
    float _539 = _431 * _529;
    float _541 = fma(_535, _533, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _543 = fma(_525, _471, _537);
    float _545 = in.m_66.x;
    float _547 = in.m_66.y;
    float _549 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _551 = fma(_541, _539, _543);
    float _553 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _555 = _549 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _557 = fma(_513, (*spvDescriptorSet0.vp_c9)._m0[118].x, _551);
    float _559 = _553 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _561 = _557 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_68.x = _555;
    out.m_68.y = _479;
    out.m_68.z = _559;
    out.m_68.w = _561;
    float _563 = _377 * _547;
    float _565 = _375 * _545;
    bool _567 = !_473;
    float _587;
    float _589;
    if (!_567)
    {
        float _569 = in.m_64.x;
        float _571 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _573 = float(_109);
        float _575 = _569 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _577 = fma(_575, (*spvDescriptorSet0.vp_c9)._m0[11].w, _143);
        float _579 = _577 * _571;
        float _581 = floor(_579);
        float _583 = -_581;
        float _585 = _579 + _583;
        _587 = _573;
        _589 = _585;
        _591 = true;
    }
    else
    {
        float _593 = float(_109);
        float _595 = 1.0 / _593;
        float _597 = _143 * _595;
        _587 = _593;
        _589 = _597;
    }
    _591 = false;
    float _599 = _587;
    float _601 = _589;
    float _603 = in.m_64.x;
    float _605 = in.m_64.y;
    float _607 = in.m_64.z;
    float _609 = in.m_64.w;
    float _611 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _613 = int(_611);
    float _615 = _565 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _617 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _619 = _617 != 0;
    float _621 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    int _623 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _625 = _623 != 0;
    int _627 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _629 = _627 != 0;
    int _631 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _633 = _631 != 0;
    float _635 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _637 = !_629;
    int _639 = _637 ? 0 : 1;
    float _641 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _643 = !_625;
    int _645 = _643 ? 0 : 1;
    float _647 = _603 * 2.0;
    float _649 = _607 * 2.0;
    float _651 = _605 * 2.0;
    float _653 = _603 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _655 = floor(_647);
    float _657 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _659 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _661 = -_635;
    float _663 = fma(_653, 2.0, _661);
    float _665 = _605 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _667 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _669 = _603 + (-0.5);
    float _671 = floor(_649);
    float _673 = _605 + _603;
    float _675 = fma(_665, -2.0, _641);
    float _677 = _665;
    if (!_619)
    {
        _677 = _605;
    }
    float _679 = _677;
    float _681 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _683 = _673 + (-1.0);
    float _685 = _679;
    float _687 = _683;
    if (_619)
    {
        _685 = _603;
    }
    float _689 = _685;
    float _691 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[76].y, _675);
    float _693 = floor(_651);
    bool _695 = _655 > 0.0;
    float _697 = fma(_683, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _699 = _655 >= 0.0;
    bool _701 = isnan(_655);
    bool _703 = _699 || _701;
    bool _705 = isnan(0.0);
    bool _707 = _703 || _705;
    float _709 = _689 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _711 = !_633;
    int _713 = _711 ? 0 : 1;
    float _715 = fma(_689, (*spvDescriptorSet0.vp_c9)._m0[83].z, _667);
    if (!_619)
    {
        _687 = _607;
    }
    float _717 = _687;
    float _719 = -_659;
    float _721 = fma(_709, 2.0, _719);
    bool _723 = _671 >= 0.0;
    bool _725 = isnan(_671);
    bool _727 = _723 || _725;
    bool _729 = isnan(0.0);
    bool _731 = _727 || _729;
    float _733 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _735 = int(_733);
    float _737 = _717;
    if (_619)
    {
        _737 = _605;
    }
    float _739 = _737;
    float _741 = -_143;
    float _743 = fma(_741, (*spvDescriptorSet0.vp_c9)._m0[76].x, _663);
    int _745 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _747 = _745 != 0;
    int _749 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _751 = _749 != 0;
    int _753 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _755 = _753 != 0;
    int _757 = _707 ? 0 : 1;
    float _759 = fma(_739, (*spvDescriptorSet0.vp_c9)._m0[83].w, _657);
    bool _761 = _693 > 0.0;
    bool _763 = !_747;
    int _765 = _763 ? 0 : 1;
    float _767 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[82].w, _759);
    bool _769 = _671 > 0.0;
    float _771 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _773 = log2(_771);
    int _775 = _731 ? 0 : 1;
    bool _777 = _693 >= 0.0;
    bool _779 = isnan(_693);
    bool _781 = _777 || _779;
    bool _783 = isnan(0.0);
    bool _785 = _781 || _783;
    float _787 = _739;
    if (!_619)
    {
        _787 = _607;
    }
    float _789 = _787;
    float _791 = _789;
    if (_619)
    {
        _791 = _605;
    }
    float _793 = _791;
    int _795 = ~_775;
    int _797 = _795 + 1;
    int _799 = _797 + 1;
    int _801 = _799;
    if (!_769)
    {
        int _803 = ~_775;
        int _805 = _803 + 1;
        _801 = _805;
    }
    int _807 = _801;
    float _809 = _793 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _811 = abs(_765);
    int _813 = _785 ? 0 : 1;
    float _815 = fma(_809, -2.0, _681);
    float _817 = float(_613);
    float _819 = float(_811);
    float _821 = float(_807);
    float _823 = 1.0 / _817;
    int _825 = ~_813;
    int _827 = _825 + 1;
    int _829 = _827 + 1;
    int _831 = _829;
    if (!_761)
    {
        int _833 = ~_813;
        int _835 = _833 + 1;
        _831 = _835;
    }
    int _837 = _831;
    float _839 = _773 * _143;
    float _841 = _819 * _821;
    float _843 = exp2(_839);
    float _845 = in.m_70.x;
    float _847 = in.m_70.y;
    float _849 = in.m_70.z;
    float _851 = _841 * (-2.0);
    bool _853 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _855 = isnan(1.0);
    bool _857 = _853 || _855;
    bool _859 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _861 = _857 || _859;
    float _863 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _865 = 1.0 + _863;
    int _867 = ~_757;
    int _869 = _867 + 1;
    int _871 = _869 + 1;
    float _873 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _875 = _871;
    if (!_695)
    {
        int _877 = ~_757;
        int _879 = _877 + 1;
        _875 = _879;
    }
    int _881 = _875;
    float _883 = 1.0 / _865;
    float _885 = fma(_603, (*spvDescriptorSet0.vp_c9)._m0[78].z, _873);
    bool _887 = !_751;
    int _889 = _887 ? 0 : 1;
    float _891 = _823 * _143;
    bool _893 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _895 = isnan(0.0);
    bool _897 = _893 || _895;
    bool _899 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _901 = _897 || _899;
    float _903 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _905 = -_843;
    float _907 = _905 + 1.0;
    float _909 = float(_735);
    float _911 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[77].z, _885);
    int _913 = abs(_889);
    float _915 = fma(_605, (*spvDescriptorSet0.vp_c9)._m0[78].w, _903);
    float _917 = _901 ? _907 : 0.0;
    float _919 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[82].z, _715);
    float _921 = _909 * _143;
    float _923 = fma(_851, _845, _845);
    bool _925 = !_755;
    int _927 = _925 ? 0 : 1;
    float _929 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[77].w, _915);
    float _931 = float(_881);
    float _933 = -_143;
    float _935 = fma(_933, (*spvDescriptorSet0.vp_c9)._m0[81].x, _721);
    float _937 = float(_913);
    float _939 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[81].y, _815);
    if (_861)
    {
        float _941 = _917 * _883;
        _145 = _941;
    }
    float _943 = _145;
    float _945 = fma(_697, _851, _697);
    float _947 = fma(_669, (*spvDescriptorSet0.vp_c9)._m0[196].x, _923);
    int _949 = abs(_927);
    float _951 = _937 * _931;
    float _953 = _605 + _607;
    float _955 = fma(_945, _943, _947);
    float _957 = _951 * (-2.0);
    float _959 = _953 + (-1.0);
    float _961 = float(_837);
    float _963 = fma(_957, _847, _847);
    float _965 = float(_949);
    float _967 = fma(_959, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _969 = _607 + _603;
    float _971 = _955 * 0.15915493667125701904296875;
    float _973 = _965 * _961;
    float _975 = _605 + (-0.5);
    float _977 = _969 + (-1.0);
    float _979 = fma(_967, _957, _967);
    float _981 = _973 * (-2.0);
    float _983 = fma(_975, (*spvDescriptorSet0.vp_c9)._m0[196].y, _963);
    float _985 = fma(_977, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _987 = _607 + (-0.5);
    float _989 = fma(_981, _849, _849);
    float _991 = fma(_979, _943, _983);
    float _993 = fma(_985, _981, _985);
    float _995 = _971 * 6.283185482025146484375;
    float _997 = sin(_995);
    float _999 = fma(_987, (*spvDescriptorSet0.vp_c9)._m0[196].z, _989);
    float _1001 = _991 * 0.15915493667125701904296875;
    float _1003 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _203);
    float _1005 = in.m_46.x;
    float _1007 = in.m_46.y;
    float _1009 = in.m_46.z;
    float _1011 = fma(_993, _943, _999);
    float _1013 = _563 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1015 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _207);
    float _1017 = _971 * 6.283185482025146484375;
    float _1019 = cos(_1017);
    float _1021 = _1011 * 0.15915493667125701904296875;
    float _1023 = _615 * _1003;
    float _1025 = _1013 * _1015;
    float _1027 = in.m_58.w;
    float _1029 = _1001 * 6.283185482025146484375;
    float _1031 = sin(_1029);
    float _1033 = _1001 * 6.283185482025146484375;
    float _1035 = cos(_1033);
    float _1037 = _187 * _1007;
    float _1039 = _181 * _1007;
    float _1041 = _1021 * 6.283185482025146484375;
    float _1043 = cos(_1041);
    float _1045 = _997 * _1031;
    float _1047 = _1019 * _1031;
    float _1049 = fma(_185, _1005, _1037);
    float _1051 = fma(_179, _1005, _1039);
    float _1053 = in.m_62.w;
    float _1055 = _1021 * 6.283185482025146484375;
    float _1057 = sin(_1055);
    float _1059 = _1019 * _1035;
    float _1061 = _997 * _1035;
    float _1063 = _1019 * _1043;
    float _1065 = _997 * _1043;
    float _1067 = _1035 * _1043;
    float _1069 = _1031 * _1043;
    float _1071 = _1063 * _1025;
    float _1073 = _1065 * _1025;
    float _1075 = fma(_1057, _1059, _1045);
    float _1077 = -_1025;
    float _1079 = _1057 * _1077;
    float _1081 = -_1061;
    float _1083 = fma(_1057, _1047, _1081);
    float _1085 = fma(_1057, _1045, _1059);
    float _1087 = fma(_1075, _1023, _1071);
    float _1089 = -_1047;
    float _1091 = fma(_1057, _1061, _1089);
    float _1093 = fma(_1067, _1023, _1079);
    float _1095 = _175 * _1007;
    float _1097 = fma(_1083, _621, _1087);
    float _1099 = fma(_1091, _1023, _1073);
    float _1101 = fma(_1069, _621, _1093);
    float _1103 = fma(_173, _1005, _1095);
    float _1105 = _1097 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1107 = fma(_1085, _621, _1099);
    float _1109 = _1097 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1111 = fma(_189, _1009, _1049);
    float _1113 = fma(_1101, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1105);
    float _1115 = fma(_177, _1009, _1103);
    float _1117 = fma(_1101, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1109);
    float _1119 = _1111 + _1053;
    float _1121 = fma(_1107, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1113);
    float _1123 = _1115 + _1027;
    float _1125 = fma(_1107, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1117);
    float _1127 = in.m_60.w;
    float _1129 = _1121 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1131 = _1097 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1133 = _1125 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1135 = fma(_183, _1009, _1051);
    float _1137 = _1119 + _1129;
    float _1139 = fma(_1101, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1131);
    float _1141 = _1123 + _1133;
    float _1143 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1145 = _1137 + _1143;
    float _1147 = fma(_1107, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1139);
    float _1149 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1151 = _1141 + _1149;
    float _1153 = _1145 * _1145;
    float _1155 = _1147 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1157 = fma(_1151, _1151, _1153);
    float _1159 = sqrt(_1157);
    float _1161 = _1135 + _1127;
    float _1163 = _1161 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1165 = _1161 + _1155;
    float _1167 = fma(_1123, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1163);
    float _1169 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1167);
    bool _1171 = _1159 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1173 = _1147;
    float _1175 = _1155;
    float _1177 = _1163;
    float _1179 = _1159;
    if (!_1171)
    {
        _1173 = _1141;
    }
    float _1181 = _1173;
    float _1183 = _1181;
    if (!_1171)
    {
        _1175 = _1137;
    }
    float _1185 = _1175;
    float _1187 = _1185;
    if (!_1171)
    {
        _1177 = _1165;
    }
    float _1189 = _1177;
    bool _1191 = !_1171;
    float _1193 = _1189;
    if (!_1191)
    {
        float _1195 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1197 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1199 = _1159 + _1197;
        float _1201 = rsqrt(_1157);
        float _1203 = _1199 * _1195;
        float _1205 = _1165 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1207 = _1203 * 0.15915493667125701904296875;
        float _1209 = _1207 * 6.283185482025146484375;
        float _1211 = sin(_1209);
        float _1213 = _1207 * 6.283185482025146484375;
        float _1215 = cos(_1213);
        float _1217 = fma(_1211, _1205, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1219 = _1201 * _1217;
        float _1221 = _1215 + (-1.0);
        float _1223 = fma(_1151, _1219, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1225 = fma(_1145, _1219, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1227 = _1221 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1229 = fma(_1165, _1215, _1227);
        _1193 = _1229;
        _1183 = _1223;
        _1187 = _1225;
    }
    float _1231 = _1193;
    float _1233 = _1183;
    float _1235 = _1187;
    float _1237 = -_1161;
    float _1239 = _1237 + _1231;
    float _1241 = -_1123;
    float _1243 = _1241 + _1233;
    float _1245 = _1169 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1247 = _1161 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1249 = _1239 * _1239;
    float _1251 = -_1119;
    float _1253 = _1251 + _1235;
    float _1255 = 1.0 / _1245;
    float _1257 = fma(_1123, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1247);
    float _1259 = fma(_1243, _1243, _1249);
    float _1261 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1257);
    float _1263 = fma(_1253, _1253, _1259);
    bool _1265 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1267 = isnan(0.5);
    bool _1269 = _1265 || _1267;
    bool _1271 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1273 = _1269 || _1271;
    float _1275 = _1261 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1277 = sqrt(_1263);
    bool _1279 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1281 = isnan(0.5);
    bool _1283 = _1279 || _1281;
    bool _1285 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1287 = _1283 || _1285;
    float _1289 = _1275 + _1245;
    float _1291 = _1289 * _1255;
    float _1293 = _1291 * 0.5;
    float _1295 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1297 = fma(_1293, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1295);
    float _1299 = 1.0 / _1297;
    bool _1301 = _1277 > 0.0;
    bool _1303 = !_1301;
    float _1305 = _1233;
    float _1307 = _1231;
    float _1309 = _1235;
    float _1311 = _1239;
    float _1313 = _1245;
    float _1315 = _1297;
    float _1317 = _1277;
    float _1319 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1321 = _1243;
    if (!_1303)
    {
        float _1323 = _223 * _223;
        float _1325 = fma(_221, _221, _1323);
        float _1327 = rsqrt(_1263);
        float _1329 = fma(_225, _225, _1325);
        float _1331 = sqrt(_1329);
        float _1333 = _1243 * _1327;
        float _1335 = _1239 * _1327;
        float _1337 = _1253 * _1327;
        bool _1339 = _1331 > 0.0;
        bool _1341 = !_1339;
        _1313 = _1337;
        _1315 = _1329;
        _1317 = _1327;
        _1319 = _1331;
        _1321 = _1333;
        if (!_1341)
        {
            float _1343 = rsqrt(_1329);
            float _1345 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1347 = _223 * _1343;
            float _1349 = _221 * _1343;
            float _1351 = _225 * _1343;
            float _1353 = _1335 * _1347;
            float _1355 = fma(_1333, _1349, _1353);
            float _1357 = _1345 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1359 = fma(_1337, _1351, _1355);
            float _1361 = _1359 * _1357;
            float _1363 = fma(_221, _1361, _1233);
            float _1365 = fma(_223, _1361, _1231);
            float _1367 = fma(_225, _1361, _1235);
            _1305 = _1363;
            _1307 = _1365;
            _1309 = _1367;
            _1311 = _1361;
            _1317 = _1353;
            _1319 = _1345;
            _1321 = _1357;
        }
    }
    float _1369 = _1305;
    float _1371 = _1307;
    float _1373 = _1309;
    float _1375 = _1311;
    float _1377 = _1313;
    float _1379 = _1315;
    float _1381 = _1317;
    float _1383 = _1319;
    float _1385 = _1321;
    float _1387 = _1383;
    float _1389 = _1379;
    float _1391 = _1377;
    float _1393 = _1375;
    float _1395 = _1381;
    float _1397 = _1385;
    if (_1287)
    {
        _1387 = 1.0;
    }
    float _1399 = _1387;
    float _1401 = _1399;
    if (_1273)
    {
        _1389 = _1369;
    }
    float _1403 = _1389;
    float _1405 = _1403;
    if (_1273)
    {
        _1391 = _1371;
    }
    float _1407 = _1391;
    float _1409 = _1407;
    if (_1273)
    {
        _229 = _1373;
    }
    float _1411 = _229;
    float _1413 = _1411;
    if (!_1273)
    {
        float _1415 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1417 = _1161 + _1415;
        float _1419 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1421 = _1123 + _1419;
        float _1423 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1425 = -_1161;
        float _1427 = _1425 + _1371;
        float _1429 = _1417 * _1417;
        float _1431 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1433 = _1119 + _1431;
        float _1435 = -_1123;
        float _1437 = _1435 + _1369;
        float _1439 = -_1119;
        float _1441 = _1439 + _1373;
        float _1443 = fma(_1421, _1421, _1429);
        float _1445 = fma(_1433, _1433, _1443);
        float _1447 = sqrt(_1445);
        float _1449 = precise::min(_1447, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1451 = _1449 * _1423;
        float _1453 = fma(_1427, _1451, _1161);
        float _1455 = fma(_1437, _1451, _1123);
        float _1457 = fma(_1441, _1451, _1119);
        _1393 = _1451;
        _1409 = _1453;
        _1405 = _1455;
        _1413 = _1457;
        _231 = _1423;
        _1395 = _1429;
    }
    float _1459 = _1393;
    float _1461 = _1409;
    float _1463 = _1405;
    float _1465 = _1413;
    float _1467 = _231;
    float _1469 = _1395;
    float _1471 = _1459;
    if (_1287)
    {
        _1397 = 1.0;
    }
    float _1473 = _1397;
    float _1475 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1477 = _1299 * _1475;
    float _1479 = _1473;
    if (!_1287)
    {
        float _1481 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1483 = _1481 * 0.15915493667125701904296875;
        float _1485 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1487 = _1483 * 6.283185482025146484375;
        float _1489 = cos(_1487);
        float _1491 = _1485 * 0.15915493667125701904296875;
        float _1493 = _1483 * 6.283185482025146484375;
        float _1495 = sin(_1493);
        float _1497 = 1.0 / _1489;
        float _1499 = _1491 * 6.283185482025146484375;
        float _1501 = cos(_1499);
        float _1503 = _1495 * _1497;
        float _1505 = _1491 * 6.283185482025146484375;
        float _1507 = sin(_1505);
        float _1509 = _1501 * _1503;
        float _1511 = 1.0 / _1509;
        float _1513 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1515 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1513;
        float _1517 = 1.0 / _1515;
        float _1519 = _1507 * _1511;
        float _1521 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1523 = fma(_1477, _1519, _1521);
        float _1525 = _1523 * _1517;
        float _1527 = precise::clamp(_1525, 0.0, 1.0);
        _1471 = _1483;
        _1401 = _1527;
    }
    float _1529 = _1471;
    float _1531 = _1401;
    float _1533 = _1529;
    if (!_1287)
    {
        float _1535 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1537 = _1535 * 0.15915493667125701904296875;
        float _1539 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1541 = _1537 * 6.283185482025146484375;
        float _1543 = cos(_1541);
        float _1545 = _1539 * 0.15915493667125701904296875;
        float _1547 = _1537 * 6.283185482025146484375;
        float _1549 = sin(_1547);
        float _1551 = 1.0 / _1543;
        float _1553 = _1545 * 6.283185482025146484375;
        float _1555 = cos(_1553);
        float _1557 = _1549 * _1551;
        float _1559 = _1545 * 6.283185482025146484375;
        float _1561 = sin(_1559);
        float _1563 = _1555 * _1557;
        float _1565 = 1.0 / _1563;
        float _1567 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1569 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1567;
        float _1571 = 1.0 / _1569;
        float _1573 = _1561 * _1565;
        float _1575 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1577 = fma(_1477, _1573, _1575);
        float _1579 = _1577 * _1571;
        float _1581 = precise::clamp(_1579, 0.0, 1.0);
        float _1583 = -_1581;
        float _1585 = _1583 + 1.0;
        _1533 = _1543;
        _1479 = _1585;
    }
    float _1587 = _1533;
    float _1589 = _1479;
    float _1591 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1593 = _1461 + _1591;
    float _1595 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1597 = _1463 + _1595;
    float _1599 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1601 = _1465 + _1599;
    float _1603 = _1593 * _1593;
    float _1605 = fma(_1597, _1597, _1603);
    float _1607 = fma(_1123, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1609 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1611 = fma(_1601, _1601, _1605);
    float _1613 = rsqrt(_1611);
    float _1615 = sqrt(_1611);
    float _1617 = _1613 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1619 = _1597 * _1617;
    float _1621 = _1601 * _1617;
    float _1623 = _1619 * _1619;
    float _1625 = _1621 * _1621;
    float _1627 = _1623 + _1625;
    float _1629 = sqrt(_1627);
    bool _1631 = _1629 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1633 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1635 = _1629 + _1633;
    float _1637 = _1467;
    float _1639 = _1627;
    float _1641 = _1635;
    float _1643 = _1593;
    float _1645 = _1619;
    float _1647 = _1621;
    float _1649 = _1623;
    float _1651 = _1625;
    if (_1631)
    {
        float _1653 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1637 = _1653;
    }
    float _1655 = _1637;
    if (_1631)
    {
        float _1657 = rsqrt(_1627);
        _1639 = _1657;
    }
    float _1659 = _1639;
    float _1661 = _1655;
    if (_1631)
    {
        float _1663 = _1635 * _1655;
        _1641 = _1663;
    }
    float _1665 = _1641;
    if (_1631)
    {
        float _1667 = _1665 * 0.15915493667125701904296875;
        _1179 = _1667;
    }
    float _1669 = _1179;
    float _1671 = _1469;
    if (_1631)
    {
        float _1673 = _1669 * 6.283185482025146484375;
        float _1675 = sin(_1673);
        _1671 = _1675;
    }
    float _1677 = _1671;
    float _1679 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1681 = precise::max(0.0, _1679);
    float _1683 = _1587;
    float _1685 = _1681;
    if (_1631)
    {
        float _1687 = _1669 * 6.283185482025146484375;
        float _1689 = cos(_1687);
        _1683 = _1689;
    }
    float _1691 = _1683;
    float _1693 = -_1617;
    float _1695 = -_1681;
    float _1697 = fma(_1593, _1693, _1695);
    if (_1631)
    {
        float _1699 = _1697 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1643 = _1699;
    }
    float _1701 = _1643;
    float _1703 = _1677;
    float _1705 = _1701;
    if (_1631)
    {
        float _1707 = fma(_1677, _1701, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1703 = _1707;
    }
    float _1709 = _1703;
    float _1711 = _1709;
    if (!_1631)
    {
        _1705 = _1697;
    }
    float _1713 = _1705;
    float _1715 = _1713;
    if (_1631)
    {
        float _1717 = _1691 + (-1.0);
        _1685 = _1717;
    }
    float _1719 = _1685;
    if (_1631)
    {
        float _1721 = _1659 * _1709;
        _1711 = _1721;
    }
    float _1723 = _1711;
    if (_1631)
    {
        float _1725 = _1719 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1661 = _1725;
    }
    float _1727 = _1661;
    if (_1631)
    {
        float _1729 = _1619 * _1723;
        _1645 = _1729;
    }
    float _1731 = _1645;
    if (_1631)
    {
        float _1733 = _1621 * _1723;
        _1647 = _1733;
    }
    float _1735 = _1647;
    float _1737 = floor(_1607);
    if (_1631)
    {
        float _1739 = fma(_1697, _1691, _1727);
        _1715 = _1739;
    }
    float _1741 = _1715;
    if (_1631)
    {
        float _1743 = _1731 * _1731;
        _1649 = _1743;
    }
    float _1745 = _1649;
    if (_1631)
    {
        float _1747 = _1735 * _1735;
        _1651 = _1747;
    }
    float _1749 = _1651;
    float _1751 = _1461 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1753 = fma(_1119, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1755 = fma(_1741, _1741, _1745);
    float _1757 = floor(_1753);
    float _1759 = _1755 + _1749;
    float _1761 = fma(_1463, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1751);
    float _1763 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1765 = fma(_1615, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1763);
    float _1767 = precise::clamp(_1765, 0.0, 1.0);
    float _1769 = _1461 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1771 = fma(_1465, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1761);
    float _1773 = -_1767;
    float _1775 = _1773 + 1.0;
    float _1777 = rsqrt(_1759);
    float _1779 = _1461 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1781 = fma(_1463, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1769);
    float _1783 = _1771 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1785 = _1461 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1787 = fma(_1463, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1779);
    float _1789 = fma(_1465, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1781);
    float _1791 = _1783 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1793 = abs(_1775);
    float _1795 = log2(_1793);
    float _1797 = fma(_1465, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1787);
    float _1799 = _1789 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1801 = fma(_1463, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1785);
    float _1803 = -_1791;
    float _1805 = fma(_1803, _1609, 1.0);
    float _1807 = _1797 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1809 = _1799 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1811 = fma(_1465, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1801);
    float _1813 = _1777 * _1731;
    float _1815 = _1777 * _1741;
    float _1817 = fma(_1807, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1809);
    float _1819 = _1777 * _1735;
    float _1821 = _1813 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1823 = _1811 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1825 = fma(_1783, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1817);
    float _1827 = -_1737;
    float _1829 = _1607 + _1827;
    float _1831 = -_1821;
    float _1833 = fma(_1815, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1831);
    float _1835 = _1795 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1837 = fma(_1823, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1825);
    float _1839 = log2(_1805);
    float _1841 = -_1819;
    float _1843 = fma(_1841, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1833);
    float _1845 = -_1757;
    float _1847 = _1753 + _1845;
    float _1849 = _1799 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1851 = _1799 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1853 = fma(_1843, -0.5, 0.5);
    float _1855 = _1815 + 1.0;
    float _1857 = fma(_1807, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1849);
    float _1859 = 1.0 / _1837;
    float _1861 = fma(_1783, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1857);
    float _1863 = fma(_1823, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1861);
    float _1865 = exp2(_1835);
    float _1867 = _1839 * 0.693147182464599609375;
    float _1869 = _1867 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1871 = sqrt(_1853);
    float _1873 = fma(_1843, 0.5, 0.5);
    float _1875 = fma(_1807, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1851);
    float _1877 = fma(_1873, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1879 = fma(_1783, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1875);
    float _1881 = _1863 * _1859;
    float _1883 = -_1815;
    float _1885 = fma(_1865, _1855, _1883);
    float _1887 = fma(_1873, _1877, -0.212114393711090087890625);
    float _1889 = fma(_1823, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1879);
    float _1891 = fma(_1881, 0.5, 0.5);
    float _1893 = fma(_1885, 0.5, 0.5);
    float _1895 = fma(_1873, _1887, 1.570728778839111328125);
    float _1897 = _1889 * _1859;
    float _1899 = _1871 * 0.636619746685028076171875;
    float _1901 = fma(_1897, -0.5, 0.5);
    float _1903 = -_1895;
    float _1905 = fma(_1899, _1903, 1.0);
    float2 _5825 = float2(_1829, _1847);
    float _1907 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5825, float2(0.0), isnan(_5825)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5825, float2(0.0), isnan(_5825)), level(0.0)).x;
    float3 _5836 = float3(_1891, _1901, _1869);
    float _1909 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5836, float3(0.0), isnan(_5836)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5836, float3(0.0), isnan(_5836)), level(0.0)).x;
    float3 _5847 = float3(_1891, _1901, _1869);
    float4 _1912 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5847, float3(0.0), isnan(_5847)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5847, float3(0.0), isnan(_5847)), level(0.0)).xyzw;
    float _1914 = _1912.x;
    float _1916 = _1912.y;
    float _1918 = _1912.z;
    float _1920 = _1912.w;
    float2 _5863 = float2(_1905, _1893);
    float3 _1924 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5863, float2(0.0), isnan(_5863)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5863, float2(0.0), isnan(_5863)), level(0.0)).xyz;
    float _1926 = _1924.x;
    float _1928 = _1924.y;
    float _1930 = _1924.z;
    float _1932 = float(uint(_735));
    float _1934 = trunc(_891);
    int _1936 = int(_1934);
    int _1938 = abs(_645);
    float _1940 = -_911;
    float _1942 = _1940 + 1.0;
    bool _1944 = _605 > 0.5;
    float _1946 = -_929;
    float _1948 = _1946 + 1.0;
    int _1950 = ~_735;
    int _1952 = _1950 + 1;
    float _1954 = -_919;
    float _1956 = _1954 + 1.0;
    float _1958 = -_207;
    int _1960 = _1944 ? as_type<int>(_1958) : as_type<int>(_207);
    float _1962 = 1.0 / _1932;
    bool _1964 = _603 > 0.5;
    float _1966 = -_767;
    float _1968 = _1966 + 1.0;
    bool _1970 = _607 > 0.5;
    float _1972 = _1795 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1974 = float(uint(_1936));
    float _1976 = 1.0 / _599;
    int _1978 = as_type<int>(_1962) + (-2);
    float _1980 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1982 = as_type<float>(_1978) * _1974;
    float _1984 = trunc(_1982);
    float _1986 = precise::max(_1984, 0.0);
    uint _1989 = uint(_1986);
    float _1991 = _921 * _1976;
    bool _1993 = !_619;
    float _1995 = _1993 ? 7.345489978790283203125 : 1.0;
    float _1997 = trunc(_1991);
    int _1999 = int(_1997);
    int _2001 = ~_735;
    int _2003 = _2001 + 1;
    float _2005 = _1980 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _2007 = _1952 * int(_1989);
    int _2009 = _2007 + _1936;
    float _2011 = exp2(_1972);
    float _2013 = float(uint(_2009));
    float _2015 = as_type<float>(_1978) * _2013;
    float _2017 = _1995 * _603;
    float _2019 = float(_1936);
    float _2021 = -_203;
    int _2023 = _1964 ? as_type<int>(_2021) : as_type<int>(_203);
    float _2025 = floor(_2017);
    bool _2027 = _2019 >= _909;
    bool _2029 = isnan(_2019);
    bool _2031 = _2027 || _2029;
    bool _2033 = isnan(_909);
    bool _2035 = _2031 || _2033;
    float _2037 = float(_2035);
    float _2039 = -_2011;
    float _2041 = _2039 + 1.0;
    float _2043 = trunc(_2015);
    float _2045 = precise::max(_2043, 0.0);
    uint _2047 = uint(_2045);
    float _2049 = trunc(_2037);
    int _2051 = int(_2049);
    float _2053 = -_2025;
    float _2055 = _2017 + _2053;
    float _2057 = _2055 * _909;
    int _2059 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2061 = _2059 != 0;
    int _2063 = int(_1989) + int(_2047);
    float _2065 = trunc(_2057);
    int _2067 = int(_2065);
    int _2069 = _735 + (-1);
    int _2071 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2073 = _2071 != 0;
    int _2075 = _2003 * _2063;
    int _2077 = _2075 + _1936;
    int _2079 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2081 = _2079 != 0;
    int _2083 = ~_2051;
    int _2085 = _2083 + 1;
    int _2087 = _2085 + 1;
    bool _2089 = uint(_2077) >= uint(_735);
    bool _2091 = !_2061;
    int _2093 = _2091 ? 0 : 1;
    bool _2095 = !_2089;
    int _2097 = _2095 ? 0 : (-1);
    bool _2099 = _735 == 0;
    int _2101 = ~_2063;
    int _2103 = _2101 + _2097;
    int _2105 = _2103 + 1;
    int _2107 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2109 = _2107 != 0;
    int _2111 = abs(_639);
    int _2113 = _735 * _2105;
    int _2115 = _2113 + _1936;
    int _2117 = abs(_2093);
    bool _2119 = !_2073;
    float _2121 = _2119 ? _207 : as_type<float>(_1960);
    bool _2123 = !_2099;
    int _2125 = _2123 ? _2115 : (-1);
    int _2127 = _2067 * _2117;
    int _2129 = _2127 + _1936;
    bool _2131 = !_2081;
    float _2133 = _2131 ? _203 : as_type<float>(_2023);
    int _2135 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2137 = _2135 != 0;
    int _2139 = _2125 * _2087;
    int _2141 = ~_735;
    int _2143 = _2141 + 1;
    int _2145 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2147 = _2145 != 0;
    int _2149 = _2051 * _2069;
    int _2151 = _2149 + _2139;
    bool _2153 = !_2109;
    int _2155 = _2153 ? 0 : 1;
    int _2157 = abs(_713);
    int _2159 = _2151 * _2111;
    int _2161 = abs(_2155);
    int _2163 = _1999 * _1938;
    int _2165 = _2163 + _2159;
    float _2167 = float(uint(_2129));
    int _2169 = ~_735;
    int _2171 = _2169 + 1;
    int _2173 = _2129 * _2157;
    int _2175 = _2173 + _2165;
    bool _2177 = _609 > 0.5;
    int _2179 = _2067 * _2161;
    int _2181 = _2179 + _2175;
    int _2183 = ~_735;
    int _2185 = _2183 + 1;
    float _2187 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2189 = _2187 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2191 = float(uint(_2181));
    float _2193 = as_type<float>(_1978) * _2191;
    float _2195 = 1.0 / _2189;
    float _2197 = trunc(_2193);
    float _2199 = precise::max(_2197, 0.0);
    uint _2201 = uint(_2199);
    int _2203 = _2185 * int(_2201);
    int _2205 = _2203 + _2181;
    float _2207 = float(uint(_2205));
    float _2209 = as_type<float>(_1978) * _2207;
    float _2211 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2213 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2211;
    float _2215 = _2133 + 0.5;
    float _2217 = trunc(_2209);
    float _2219 = precise::max(_2217, 0.0);
    uint _2221 = uint(_2219);
    float _2223 = _2213 * _2195;
    float _2225 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2227 = _601 + _2225;
    float _2229 = fma(_2223, _2227, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _2231 = as_type<float>(_1978) * _2167;
    float _2233 = _2121 + (-0.5);
    float _2235 = trunc(_2231);
    float _2237 = precise::max(_2235, 0.0);
    uint _2239 = uint(_2237);
    int _2241 = int(_2201) + int(_2221);
    bool _2243 = _601 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2245 = isnan(_601);
    bool _2247 = _2243 || _2245;
    bool _2249 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2251 = _2247 || _2249;
    float _2253 = float(_2251);
    bool _2255 = _601 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2257 = isnan(_601);
    bool _2259 = _2255 || _2257;
    bool _2261 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2263 = _2259 || _2261;
    float _2265 = float(_2263);
    int _2267 = _2171 * _2241;
    int _2269 = _2267 + _2181;
    float _2271 = -_2265;
    float _2273 = _2271 + 1.0;
    bool _2275 = uint(_2269) >= uint(_735);
    float _2277 = _2253 * _2273;
    bool _2279 = !_2275;
    int _2281 = _2279 ? 0 : (-1);
    float _2283 = _2229 * _2277;
    float _2285 = -_2233;
    float _2287 = -_691;
    float _2289 = fma(_2285, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2287);
    float _2291 = -_2253;
    float _2293 = _2291 + 1.0;
    float _2295 = fma(_2215, (*spvDescriptorSet0.vp_c9)._m0[80].x, _743);
    float _2297 = -_203;
    int _2299 = _1970 ? as_type<int>(_2297) : as_type<int>(_203);
    float _2301 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2303 = fma(_2293, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2283);
    int _2305 = ~_2241;
    int _2307 = _2305 + _2281;
    int _2309 = _2307 + 1;
    int _2311 = _2143 * int(_2239);
    int _2313 = _2311 + _2129;
    float _2315 = -_207;
    int _2317 = _2177 ? as_type<int>(_2315) : as_type<int>(_207);
    float _2319 = -_1942;
    float _2321 = fma(_2133, _2319, _2295);
    bool _2323 = !_2147;
    float _2325 = _2323 ? _203 : as_type<float>(_2299);
    int _2327 = _735 * _2309;
    int _2329 = _2327 + _2181;
    float _2331 = float(uint(_2313));
    float _2333 = fma(_2121, _1948, _2289);
    float _2335 = abs(_1477);
    float _2337 = log2(_2335);
    bool _2339 = !_2137;
    float _2341 = _2339 ? _207 : as_type<float>(_2317);
    float _2343 = fma(_2265, (*spvDescriptorSet0.vp_c9)._m0[132].x, _2303);
    int _2345 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2347 = _2345 != 0;
    float _2349 = as_type<float>(_1978) * _2331;
    bool _2351 = !_2099;
    int _2353 = _2351 ? _2329 : (-1);
    float _2355 = _2301 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2357 = _2325 + 0.5;
    float _2359 = _2341 + (-0.5);
    int _2361 = ~_735;
    int _2363 = _2361 + 1;
    float _2365 = trunc(_2349);
    float _2367 = precise::max(_2365, 0.0);
    uint _2369 = uint(_2367);
    float _2371 = fma(_2005, _2357, _935);
    float _2373 = -_2355;
    float _2375 = -_939;
    float _2377 = fma(_2373, _2359, _2375);
    int _2379 = _2353 & 3;
    bool _2381 = _2379 != 0;
    float _2383 = _1083 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2385 = -_1956;
    float _2387 = fma(_2325, _2385, _2371);
    float _2389 = _2337 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _2391 = _2353 >> 31;
    float _2393 = fma(_2341, _1968, _2377);
    float _2395 = _1063 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2397 = _203 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2399 = exp2(_2389);
    int _2401 = _2391 & 3;
    out.m_72.x = _2321;
    out.m_72.y = _2333;
    out.m_72.z = _2387;
    out.m_72.w = _2393;
    float _2403 = _1063 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2405 = _1063 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2407 = -_1057;
    float _2409 = fma(_2407, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2395);
    int _2411 = int(_2239) + int(_2369);
    float _2413 = _1083 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2415 = -_1057;
    float _2417 = fma(_2415, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2405);
    float _2419 = _2343 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _2421 = _2363 * _2411;
    int _2423 = _2421 + _2129;
    float _2425 = fma(_1069, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2413);
    int _2427 = _2381 ? 0 : 1;
    float _2429 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2417);
    bool _2431 = _1477 <= 8000.0;
    bool _2433 = isnan(_1477);
    bool _2435 = _2431 || _2433;
    bool _2437 = isnan(8000.0);
    bool _2439 = _2435 || _2437;
    float _2441 = float(_2439);
    float _2443 = -_1057;
    float _2445 = fma(_2443, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2403);
    int _2447 = _2353 + _2401;
    float _2449 = fma(_2399, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2451 = precise::clamp(_2449, 0.0, 1.0);
    float _2453 = _1075 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2455 = uint(_2423) >= uint(_735);
    float _2457 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2445);
    int _2459 = _2447 >> 2;
    float _2461 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2453);
    float _2463 = _1083 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2465 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2409);
    int _2467 = _2459 << 4;
    int _2469 = _2467 + 368;
    float _2471 = _1075 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2473 = fma(_1069, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2463);
    int _2475 = _2353 & 3;
    bool _2477 = _2475 != 0;
    uint _2479 = uint(int(uint(_2469) >> uint(2)));
    uint _2481 = uint(int(uint(int(_2479)) >> uint(2)));
    int _2483 = int(_2479) & 3;
    float _2485 = (*spvDescriptorSet0.vp_c9)._m0[int(_2481)][_2483];
    int _2487 = int(_2479) + 1;
    uint _2489 = uint(int(uint(_2487) >> uint(2)));
    int _2491 = _2487 & 3;
    float _2493 = (*spvDescriptorSet0.vp_c9)._m0[int(_2489)][_2491];
    float _2495 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2471);
    float _2497 = _207 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2499 = uint(_2475) > 1u;
    float _2501 = fma(_1069, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2383);
    int _2503 = ~_2427;
    int _2505 = _2503 + 1;
    int _2507 = _2505 + 1;
    float _2509 = _2497 * _2465;
    float _2511 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2461);
    int _2513 = _2469 + 8;
    uint _2515 = uint(int(uint(_2513) >> uint(2)));
    uint _2517 = uint(int(uint(int(_2515)) >> uint(2)));
    int _2519 = int(_2515) & 3;
    float _2521 = (*spvDescriptorSet0.vp_c9)._m0[int(_2517)][_2519];
    int _2523 = int(_2515) + 1;
    uint _2525 = uint(int(uint(_2523) >> uint(2)));
    int _2527 = _2523 & 3;
    float _2529 = (*spvDescriptorSet0.vp_c9)._m0[int(_2525)][_2527];
    float _2531 = _2497 * _2429;
    float _2533 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2495);
    float _2535 = fma(_2451, -2.0, 3.0);
    float _2537 = _2451 * _2451;
    bool _2539 = uint(_2475) >= 2u;
    float _2541 = _1075 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2543 = _2497 * _2457;
    int _2545 = _2507;
    if (!_2499)
    {
        int _2547 = ~_2427;
        int _2549 = _2547 + 1;
        _2545 = _2549;
    }
    int _2551 = _2545;
    float _2553 = _2537 * _2535;
    bool _2555 = _2475 != 3;
    float _2557 = fma(_1085, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2473);
    int _2559 = abs(_2551);
    float _2561 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2541);
    int _2563 = _2539 ? 0 : 1;
    float _2565 = -_1907;
    float _2567 = _2565 + 1.0;
    float _2569 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2561);
    bool _2571 = !_2455;
    int _2573 = _2571 ? 0 : (-1);
    float _2575 = fma(_2397, _2511, _2543);
    bool _2577 = !_2477;
    int _2579 = _2577 ? 0 : 1;
    float _2581 = fma(_2397, _2569, _2531);
    bool _2583 = _2475 != 3;
    float _2585 = fma(_1085, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2425);
    int _2587 = ~_2563;
    int _2589 = _2587 + 1;
    int _2591 = _2589 + 1;
    float _2593 = fma(_1085, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2501);
    int _2595 = _2591;
    if (_2555)
    {
        int _2597 = ~_2563;
        int _2599 = _2597 + 1;
        _2595 = _2599;
    }
    int _2601 = _2595;
    out.m_74.w = _2419;
    int _2603 = ~_2559;
    int _2605 = _2603 + 1;
    int _2607 = _2605 + 1;
    int _2609 = ~_2411;
    int _2611 = _2609 + _2573;
    int _2613 = _2611 + 1;
    bool _2615 = !_2583;
    int _2617 = _2615 ? 0 : (-1);
    int _2619 = abs(_2579);
    int _2621 = _735 * _2613;
    int _2623 = _2621 + _2129;
    int _2625 = abs(_2601);
    float _2627 = fma(_2397, _2533, _2509);
    int _2629 = abs(_2617);
    float _2631 = in.m_76.x;
    int _2633 = _2607 * as_type<int>(_2493);
    bool _2635 = !_2347;
    int _2637 = _2635 ? 0 : 1;
    float _2639 = _1837 * 0.5;
    int _2641 = ~_2619;
    int _2643 = _2641 + 1;
    int _2645 = _2643 + 1;
    float _2647 = _2041 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2649 = _2585 + _2627;
    int _2651 = abs(_2637);
    int _2653 = _2645 * as_type<int>(_2485);
    int _2655 = _2653 + _2633;
    int _2657 = ~_2625;
    int _2659 = _2657 + 1;
    int _2661 = _2659 + 1;
    float _2663 = _2647 * _1909;
    float _2665 = _2593 + _2581;
    int _2667 = ~_2629;
    int _2669 = _2667 + 1;
    int _2671 = _2669 + 1;
    int _2673 = _2661 * as_type<int>(_2521);
    int _2675 = _2673 + _2655;
    float _2677 = _1799 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2679 = ~_2651;
    int _2681 = _2679 + 1;
    int _2683 = _2681 + 1;
    float _2685 = -_2553;
    float _2687 = _2685 + 1.0;
    int _2689 = _2671 * as_type<int>(_2529);
    int _2691 = _2689 + _2675;
    float _2693 = fma(_1807, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2677);
    bool _2695 = !_2099;
    int _2697 = _2695 ? _2623 : (-1);
    float _2699 = fma(_2687, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2553);
    int _2701 = _2691 * _2683;
    float _2703 = fma(_1783, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2693);
    float _2705 = _2441 * _2699;
    int _2707 = _2697 * _2651;
    int _2709 = _2707 + _2701;
    float _2711 = fma(_1823, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2703);
    float _2713 = _2705 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2715 = fma(_1889, -0.5, _2639);
    float _2717 = float(_2709);
    float _2719 = _2711 + _1837;
    float _2721 = _1863 + _1837;
    float _2723 = _2567 * _2713;
    float _2725 = precise::clamp(_2723, 0.0, 1.0);
    float _2727 = _1930 * _2663;
    float _2729 = _2719 * 0.5;
    float _2731 = _2721 * 0.5;
    float _2733 = -_2725;
    float _2735 = fma(_2733, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_78.x = _2717;
    float _2737 = _2557 + _2575;
    float _2739 = fma(_1920, _2727, _1918);
    float _2741 = _2735 * _2631;
    out.m_80.x = _2731;
    out.m_80.y = _2715;
    out.m_80.z = _2729;
    out.m_80.w = _1837;
    bool _2743 = _1615 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2745 = isnan(_1615);
    bool _2747 = _2743 || _2745;
    bool _2749 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2751 = _2747 || _2749;
    float _2753 = _2741 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_82.x = _2737;
    out.m_82.y = _2649;
    out.m_82.z = _2665;
    out.m_84.x = _2753;
    out.gl_Position.x = _1863;
    out.gl_Position.y = _1889;
    out.gl_Position.z = _2711;
    out.gl_Position.w = _1837;
    float _2755 = _1920 * _2663;
    float _2757 = -_2647;
    float _2759 = _2757 + 1.0;
    float _2761 = _2729;
    float _2763 = _2755;
    if (!_2751)
    {
        _2761 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2765 = _2761;
    float _2767 = fma(_1926, _2755, _1914);
    float _2769 = fma(_1928, _2755, _1916);
    float _2771 = _1920 * _2759;
    float _2773 = _1531 * _1589;
    float _2775 = _2773;
    float _2777 = _2765;
    float _2779 = _2765;
    if (!_2751)
    {
        _2763 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2781 = _2763;
    out.m_86.x = _2767;
    out.m_86.y = _2769;
    out.m_86.z = _2739;
    out.m_86.w = _2771;
    float _2783 = _2773 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2785 = _2781;
    float _2787 = _2781;
    if (!_2751)
    {
        _2775 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2789 = _2775;
    bool _2791 = !_2751;
    float _2793 = _2789;
    float _2795 = _2789;
    if (!_2791)
    {
        bool _2797 = _1615 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2799 = isnan(_1615);
        bool _2801 = _2797 || _2799;
        bool _2803 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2805 = _2801 || _2803;
        if (!_2805)
        {
            float _2807 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2809 = _1615 + _2807;
            float _2811 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2813 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2811;
            float _2815 = 1.0 / _2813;
            float _2817 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2819 = _2817 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2821 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2823 = _2821 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2825 = _2809 * _2815;
            float _2827 = precise::clamp(_2825, 0.0, 1.0);
            float _2829 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2831 = _2829 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2833 = fma(_2827, _2823, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2835 = fma(_2827, _2831, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2837 = fma(_2827, _2819, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            _2787 = _2837;
            _2779 = _2835;
            _2795 = _2833;
            _2839 = true;
        }
        else
        {
            bool _2841 = _1615 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2843 = isnan(_1615);
            bool _2845 = _2841 || _2843;
            bool _2847 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2849 = _2845 || _2847;
            if (!_2849)
            {
                _2777 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2851 = _2777;
            _2779 = _2851;
            if (!_2849)
            {
                _2785 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2853 = _2785;
            _2787 = _2853;
            if (!_2849)
            {
                _2793 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2855 = _2793;
            bool _2857 = !_2849;
            _2795 = _2855;
            if (!_2857)
            {
                bool _2859 = _1615 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2861 = isnan(_1615);
                bool _2863 = _2859 || _2861;
                bool _2865 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2867 = _2863 || _2865;
                if (!_2867)
                {
                    float _2869 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2871 = _1615 + _2869;
                    float _2873 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2875 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2873;
                    float _2877 = 1.0 / _2875;
                    float _2879 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2881 = _2879 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2883 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2885 = _2883 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2887 = _2871 * _2877;
                    float _2889 = precise::clamp(_2887, 0.0, 1.0);
                    float _2891 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2893 = _2891 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2895 = fma(_2889, _2885, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2897 = fma(_2889, _2893, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2899 = fma(_2889, _2881, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    _2787 = _2899;
                    _2779 = _2897;
                    _2795 = _2895;
                    _2839 = true;
                }
                else
                {
                    _2787 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2779 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2795 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _2839 = false;
    float _2901 = _2787;
    float _2903 = _2779;
    float _2905 = _2795;
    float _2907 = _2783 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_88.x = 0.0;
    float _2909 = _2901 * 0.586610972881317138671875;
    bool _2911 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_49.x = _2907;
    float _2913 = fma(_2903, 0.298911988735198974609375, _2909);
    bool _2915 = _1531 > 0.0;
    bool _2917 = isnan(_1531);
    bool _2919 = _2915 || _2917;
    bool _2921 = isnan(0.0);
    bool _2923 = _2919 || _2921;
    float _2925 = fma(_2905, 0.114477999508380889892578125, _2913);
    bool _2927 = _1589 <= 0.0;
    bool _2929 = !_2923;
    bool _2931 = _2927 || _2929;
    float _2933 = -_2925;
    float _2935 = _2933 + _2903;
    float _2937 = -_2925;
    float _2939 = _2937 + _2901;
    float _2941 = -_2925;
    float _2943 = _2941 + _2905;
    float _2945 = fma(_2935, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2925);
    float _2947 = fma(_2939, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2925);
    float _2949 = fma(_2943, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2925);
    bool _2951 = !_2911;
    if (!_2951)
    {
        float _2953 = -_1461;
        float _2955 = _2953 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2957 = -_1463;
        float _2959 = _2957 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2961 = -_1465;
        float _2963 = _2961 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2965 = _2955 * _2955;
        float _2967 = fma(_2959, _2959, _2965);
        float _2969 = fma(_2963, _2963, _2967);
        float _2971 = sqrt(_2969);
        float _2973 = rsqrt(_2969);
        float _2975 = -_2971;
        float _2977 = _2975 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2979 = _2977 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2981 = precise::clamp(_2979, 0.0, 1.0);
        float _2983 = _2959 * _2973;
        float _2985 = _2955 * _2973;
        float _2987 = abs(_2981);
        float _2989 = log2(_2987);
        float _2991 = _2963 * _2973;
        float _2993 = _2983 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2995 = _2649 * _2985;
        float _2997 = -_2985;
        float _2999 = -_2993;
        float _3001 = fma(_2997, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2999);
        float _3003 = fma(_2737, _2983, _2995);
        float _3005 = -_2991;
        float _3007 = fma(_3005, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3001);
        float _3009 = fma(_2665, _2991, _3003);
        float _3011 = precise::clamp(_3009, 0.0, 1.0);
        float _3013 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3015 = _3007 + _3013;
        float _3017 = _2989 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3019 = _3015 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3021 = precise::clamp(_3019, 0.0, 1.0);
        float _3023 = exp2(_3017);
        float _3025 = _3023 * _3021;
        float _3027 = _3011 * _3025;
        float _3029 = _3027 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3031 = _3027 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3033 = _3027 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_88.x = _3029;
        out.m_88.y = _3031;
        out.m_88.z = _3033;
    }
    out.m_90.x = _2945;
    out.m_90.y = _2947;
    out.m_90.z = _2949;
    if (!_2931)
    {
        return out;
    }
    out.m_49.x = 0.0;
    float _3035 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3035;
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
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2839 = false;
    bool _591 = false;
    bool _399 = false;
    bool _251 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _104 = in.m_46.w;
    float _106 = trunc(_104);
    int _109 = int(_106);
    bool _113 = _109 >= 1;
    float _115 = 0.0;
    if (!_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _115;
    float _119 = _117;
    if (!_113)
    {
        out.m_49.x = 0.0;
    }
    int _121 = 0;
    if (!_113)
    {
        float _123 = _117 * 5.0;
        _121 = as_type<int>(_123);
    }
    int _125 = _121;
    int _127 = _125;
    if (!_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3092 = as_type<float>(_125);
        out.gl_Position.z = _3092;
    }
    if (!_113)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _129 = in.m_51.w;
    bool _131 = _129 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _133 = isnan(_129);
    bool _135 = _131 || _133;
    bool _137 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _139 = _135 || _137;
    float _141 = -_129;
    float _143 = _141 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _145 = _143;
    if (_139)
    {
        float _147 = float(_109);
        _119 = _147;
    }
    float _149 = _119;
    bool _151 = _143 >= _149;
    bool _153 = !_139;
    bool _155 = _151 || _153;
    float _157 = _149;
    if (_155)
    {
        _157 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _159 = _157;
    if (_155)
    {
        out.m_49.x = 0.0;
    }
    if (_155)
    {
        float _161 = _159 * 5.0;
        _127 = as_type<int>(_161);
    }
    int _163 = _127;
    if (_155)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3162 = as_type<float>(_163);
        out.gl_Position.z = _3162;
    }
    if (_155)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _165 = as_type<float>(int(gl_VertexIndex));
    float _167 = in.m_56.x;
    float _169 = in.m_56.y;
    float _171 = in.m_56.z;
    float _173 = in.m_58.x;
    float _175 = in.m_58.y;
    float _177 = in.m_58.z;
    float _179 = in.m_60.x;
    float _181 = in.m_60.y;
    float _183 = in.m_60.z;
    float _185 = in.m_62.x;
    float _187 = in.m_62.y;
    float _189 = in.m_62.z;
    int _191 = as_type<int>(_165) & 1;
    bool _193 = _191 != 0;
    int _195 = as_type<int>(_165) & 2;
    bool _197 = _195 != 0;
    bool _199 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _201 = !_193;
    float _203 = _201 ? (-0.5) : 0.5;
    bool _205 = !_197;
    float _207 = _205 ? (-0.5) : 0.5;
    float _209 = _169 * _175;
    float _211 = _169 * _181;
    float _213 = fma(_167, _173, _209);
    float _215 = _169 * _187;
    float _217 = fma(_167, _179, _211);
    float _219 = fma(_167, _185, _215);
    float _221 = fma(_171, _177, _213);
    float _223 = fma(_171, _183, _217);
    float _225 = fma(_171, _189, _219);
    bool _227 = !_199;
    float _229 = _225;
    float _231 = _223;
    float _249;
    if (!_227)
    {
        float _233 = in.m_64.x;
        float _235 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _237 = _233 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _239 = fma(_237, (*spvDescriptorSet0.vp_c9)._m0[12].x, _143);
        float _241 = _239 * _235;
        float _243 = floor(_241);
        float _245 = -_243;
        float _247 = _241 + _245;
        _249 = _247;
        _251 = true;
    }
    else
    {
        float _253 = float(_109);
        float _255 = 1.0 / _253;
        float _257 = _143 * _255;
        _249 = _257;
    }
    _251 = false;
    float _259 = _249;
    float _261 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _263 = _259 + _261;
    bool _265 = _259 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _267 = isnan(_259);
    bool _269 = _265 || _267;
    bool _271 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _273 = _269 || _271;
    float _275 = float(_273);
    bool _277 = _259 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _279 = isnan(_259);
    bool _281 = _277 || _279;
    bool _283 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _285 = _281 || _283;
    float _287 = float(_285);
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _291 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _289;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _295 = _293 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _297 = -_275;
    float _299 = _297 + 1.0;
    float _301 = 1.0 / _291;
    bool _303 = _259 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _305 = isnan(_259);
    bool _307 = _303 || _305;
    bool _309 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _311 = _307 || _309;
    float _313 = float(_311);
    float _315 = _287 * _299;
    float _317 = -_287;
    float _319 = _317 + 1.0;
    bool _321 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _323 = _313 * _319;
    float _325 = 1.0 / _295;
    float _327 = -_313;
    float _329 = _327 + 1.0;
    float _331 = _263 * _301;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _335 = _259 + _333;
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _339 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _337;
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _343 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _341;
    float _345 = fma(_339, _331, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _347 = fma(_343, _331, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _349 = _335 * _325;
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _353 = _351 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _355 = _345 * _323;
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _359 = _357 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _361 = _347 * _323;
    float _363 = fma(_353, _349, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _365 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[143].x, _355);
    float _367 = fma(_359, _349, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _369 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[143].y, _361);
    float _371 = fma(_363, _315, _365);
    float _373 = fma(_367, _315, _369);
    float _375 = fma(_275, (*spvDescriptorSet0.vp_c9)._m0[145].x, _371);
    float _377 = fma(_275, (*spvDescriptorSet0.vp_c9)._m0[145].y, _373);
    bool _379 = !_321;
    float _397;
    if (!_379)
    {
        float _381 = in.m_64.x;
        float _383 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _385 = _381 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _387 = fma(_385, (*spvDescriptorSet0.vp_c9)._m0[11].y, _143);
        float _389 = _387 * _383;
        float _391 = floor(_389);
        float _393 = -_391;
        float _395 = _389 + _393;
        _397 = _395;
        _399 = true;
    }
    else
    {
        float _401 = float(_109);
        float _403 = 1.0 / _401;
        float _405 = _143 * _403;
        _397 = _405;
    }
    _399 = false;
    float _407 = _397;
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _411 = _407 + _409;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _415 = _413 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _419 = _417 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _421 = _407 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _423 = isnan(_407);
    bool _425 = _421 || _423;
    bool _427 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _429 = _425 || _427;
    float _431 = float(_429);
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _435 = _433 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _437 = _407 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _439 = isnan(_407);
    bool _441 = _437 || _439;
    bool _443 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _445 = _441 || _443;
    float _447 = float(_445);
    float _449 = 1.0 / _415;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _453 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _451;
    float _455 = -_431;
    float _457 = _455 + 1.0;
    bool _459 = _407 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _461 = isnan(_407);
    bool _463 = _459 || _461;
    bool _465 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _467 = _463 || _465;
    float _469 = float(_467);
    float _471 = _447 * _457;
    bool _473 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _475 = 1.0 / _419;
    float _477 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _479 = _477 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _481 = 1.0 / _435;
    float _483 = _453 * _449;
    float _485 = -_447;
    float _487 = _485 + 1.0;
    float _489 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _491 = _489 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _493 = fma(_483, _411, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _495 = _469 * _487;
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _499 = _407 + _497;
    float _501 = _491 * _475;
    bool _503 = _407 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _505 = isnan(_407);
    bool _507 = _503 || _505;
    bool _509 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _511 = _507 || _509;
    float _513 = float(_511);
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _517 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _515;
    float _519 = _493 * _495;
    float _521 = -_469;
    float _523 = _521 + 1.0;
    float _525 = fma(_501, _499, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _527 = -_513;
    float _529 = _527 + 1.0;
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _533 = _407 + _531;
    float _535 = _517 * _481;
    float _537 = fma(_523, (*spvDescriptorSet0.vp_c9)._m0[115].x, _519);
    float _539 = _431 * _529;
    float _541 = fma(_535, _533, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _543 = fma(_525, _471, _537);
    float _545 = in.m_66.x;
    float _547 = in.m_66.y;
    float _549 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _551 = fma(_541, _539, _543);
    float _553 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _555 = _549 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _557 = fma(_513, (*spvDescriptorSet0.vp_c9)._m0[118].x, _551);
    float _559 = _553 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _561 = _557 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_68.x = _555;
    out.m_68.y = _479;
    out.m_68.z = _559;
    out.m_68.w = _561;
    float _563 = _377 * _547;
    float _565 = _375 * _545;
    bool _567 = !_473;
    float _587;
    float _589;
    if (!_567)
    {
        float _569 = in.m_64.x;
        float _571 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _573 = float(_109);
        float _575 = _569 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _577 = fma(_575, (*spvDescriptorSet0.vp_c9)._m0[11].w, _143);
        float _579 = _577 * _571;
        float _581 = floor(_579);
        float _583 = -_581;
        float _585 = _579 + _583;
        _587 = _573;
        _589 = _585;
        _591 = true;
    }
    else
    {
        float _593 = float(_109);
        float _595 = 1.0 / _593;
        float _597 = _143 * _595;
        _587 = _593;
        _589 = _597;
    }
    _591 = false;
    float _599 = _587;
    float _601 = _589;
    float _603 = in.m_64.x;
    float _605 = in.m_64.y;
    float _607 = in.m_64.z;
    float _609 = in.m_64.w;
    float _611 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _613 = int(_611);
    float _615 = _565 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _617 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _619 = _617 != 0;
    float _621 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    int _623 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _625 = _623 != 0;
    int _627 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _629 = _627 != 0;
    int _631 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _633 = _631 != 0;
    float _635 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _637 = !_629;
    int _639 = _637 ? 0 : 1;
    float _641 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _643 = !_625;
    int _645 = _643 ? 0 : 1;
    float _647 = _603 * 2.0;
    float _649 = _607 * 2.0;
    float _651 = _605 * 2.0;
    float _653 = _603 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _655 = floor(_647);
    float _657 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _659 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _661 = -_635;
    float _663 = fma(_653, 2.0, _661);
    float _665 = _605 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _667 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _669 = _603 + (-0.5);
    float _671 = floor(_649);
    float _673 = _605 + _603;
    float _675 = fma(_665, -2.0, _641);
    float _677 = _665;
    if (!_619)
    {
        _677 = _605;
    }
    float _679 = _677;
    float _681 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _683 = _673 + (-1.0);
    float _685 = _679;
    float _687 = _683;
    if (_619)
    {
        _685 = _603;
    }
    float _689 = _685;
    float _691 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[76].y, _675);
    float _693 = floor(_651);
    bool _695 = _655 > 0.0;
    float _697 = fma(_683, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _699 = _655 >= 0.0;
    bool _701 = isnan(_655);
    bool _703 = _699 || _701;
    bool _705 = isnan(0.0);
    bool _707 = _703 || _705;
    float _709 = _689 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _711 = !_633;
    int _713 = _711 ? 0 : 1;
    float _715 = fma(_689, (*spvDescriptorSet0.vp_c9)._m0[83].z, _667);
    if (!_619)
    {
        _687 = _607;
    }
    float _717 = _687;
    float _719 = -_659;
    float _721 = fma(_709, 2.0, _719);
    bool _723 = _671 >= 0.0;
    bool _725 = isnan(_671);
    bool _727 = _723 || _725;
    bool _729 = isnan(0.0);
    bool _731 = _727 || _729;
    float _733 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _735 = int(_733);
    float _737 = _717;
    if (_619)
    {
        _737 = _605;
    }
    float _739 = _737;
    float _741 = -_143;
    float _743 = fma(_741, (*spvDescriptorSet0.vp_c9)._m0[76].x, _663);
    int _745 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _747 = _745 != 0;
    int _749 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _751 = _749 != 0;
    int _753 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _755 = _753 != 0;
    int _757 = _707 ? 0 : 1;
    float _759 = fma(_739, (*spvDescriptorSet0.vp_c9)._m0[83].w, _657);
    bool _761 = _693 > 0.0;
    bool _763 = !_747;
    int _765 = _763 ? 0 : 1;
    float _767 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[82].w, _759);
    bool _769 = _671 > 0.0;
    float _771 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _773 = log2(_771);
    int _775 = _731 ? 0 : 1;
    bool _777 = _693 >= 0.0;
    bool _779 = isnan(_693);
    bool _781 = _777 || _779;
    bool _783 = isnan(0.0);
    bool _785 = _781 || _783;
    float _787 = _739;
    if (!_619)
    {
        _787 = _607;
    }
    float _789 = _787;
    float _791 = _789;
    if (_619)
    {
        _791 = _605;
    }
    float _793 = _791;
    int _795 = ~_775;
    int _797 = _795 + 1;
    int _799 = _797 + 1;
    int _801 = _799;
    if (!_769)
    {
        int _803 = ~_775;
        int _805 = _803 + 1;
        _801 = _805;
    }
    int _807 = _801;
    float _809 = _793 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _811 = abs(_765);
    int _813 = _785 ? 0 : 1;
    float _815 = fma(_809, -2.0, _681);
    float _817 = float(_613);
    float _819 = float(_811);
    float _821 = float(_807);
    float _823 = 1.0 / _817;
    int _825 = ~_813;
    int _827 = _825 + 1;
    int _829 = _827 + 1;
    int _831 = _829;
    if (!_761)
    {
        int _833 = ~_813;
        int _835 = _833 + 1;
        _831 = _835;
    }
    int _837 = _831;
    float _839 = _773 * _143;
    float _841 = _819 * _821;
    float _843 = exp2(_839);
    float _845 = in.m_70.x;
    float _847 = in.m_70.y;
    float _849 = in.m_70.z;
    float _851 = _841 * (-2.0);
    bool _853 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _855 = isnan(1.0);
    bool _857 = _853 || _855;
    bool _859 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _861 = _857 || _859;
    float _863 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _865 = 1.0 + _863;
    int _867 = ~_757;
    int _869 = _867 + 1;
    int _871 = _869 + 1;
    float _873 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _875 = _871;
    if (!_695)
    {
        int _877 = ~_757;
        int _879 = _877 + 1;
        _875 = _879;
    }
    int _881 = _875;
    float _883 = 1.0 / _865;
    float _885 = fma(_603, (*spvDescriptorSet0.vp_c9)._m0[78].z, _873);
    bool _887 = !_751;
    int _889 = _887 ? 0 : 1;
    float _891 = _823 * _143;
    bool _893 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _895 = isnan(0.0);
    bool _897 = _893 || _895;
    bool _899 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _901 = _897 || _899;
    float _903 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _905 = -_843;
    float _907 = _905 + 1.0;
    float _909 = float(_735);
    float _911 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[77].z, _885);
    int _913 = abs(_889);
    float _915 = fma(_605, (*spvDescriptorSet0.vp_c9)._m0[78].w, _903);
    float _917 = _901 ? _907 : 0.0;
    float _919 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[82].z, _715);
    float _921 = _909 * _143;
    float _923 = fma(_851, _845, _845);
    bool _925 = !_755;
    int _927 = _925 ? 0 : 1;
    float _929 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[77].w, _915);
    float _931 = float(_881);
    float _933 = -_143;
    float _935 = fma(_933, (*spvDescriptorSet0.vp_c9)._m0[81].x, _721);
    float _937 = float(_913);
    float _939 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[81].y, _815);
    if (_861)
    {
        float _941 = _917 * _883;
        _145 = _941;
    }
    float _943 = _145;
    float _945 = fma(_697, _851, _697);
    float _947 = fma(_669, (*spvDescriptorSet0.vp_c9)._m0[196].x, _923);
    int _949 = abs(_927);
    float _951 = _937 * _931;
    float _953 = _605 + _607;
    float _955 = fma(_945, _943, _947);
    float _957 = _951 * (-2.0);
    float _959 = _953 + (-1.0);
    float _961 = float(_837);
    float _963 = fma(_957, _847, _847);
    float _965 = float(_949);
    float _967 = fma(_959, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _969 = _607 + _603;
    float _971 = _955 * 0.15915493667125701904296875;
    float _973 = _965 * _961;
    float _975 = _605 + (-0.5);
    float _977 = _969 + (-1.0);
    float _979 = fma(_967, _957, _967);
    float _981 = _973 * (-2.0);
    float _983 = fma(_975, (*spvDescriptorSet0.vp_c9)._m0[196].y, _963);
    float _985 = fma(_977, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _987 = _607 + (-0.5);
    float _989 = fma(_981, _849, _849);
    float _991 = fma(_979, _943, _983);
    float _993 = fma(_985, _981, _985);
    float _995 = _971 * 6.283185482025146484375;
    float _997 = sin(_995);
    float _999 = fma(_987, (*spvDescriptorSet0.vp_c9)._m0[196].z, _989);
    float _1001 = _991 * 0.15915493667125701904296875;
    float _1003 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _203);
    float _1005 = in.m_46.x;
    float _1007 = in.m_46.y;
    float _1009 = in.m_46.z;
    float _1011 = fma(_993, _943, _999);
    float _1013 = _563 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1015 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _207);
    float _1017 = _971 * 6.283185482025146484375;
    float _1019 = cos(_1017);
    float _1021 = _1011 * 0.15915493667125701904296875;
    float _1023 = _615 * _1003;
    float _1025 = _1013 * _1015;
    float _1027 = in.m_58.w;
    float _1029 = _1001 * 6.283185482025146484375;
    float _1031 = sin(_1029);
    float _1033 = _1001 * 6.283185482025146484375;
    float _1035 = cos(_1033);
    float _1037 = _187 * _1007;
    float _1039 = _181 * _1007;
    float _1041 = _1021 * 6.283185482025146484375;
    float _1043 = cos(_1041);
    float _1045 = _997 * _1031;
    float _1047 = _1019 * _1031;
    float _1049 = fma(_185, _1005, _1037);
    float _1051 = fma(_179, _1005, _1039);
    float _1053 = in.m_62.w;
    float _1055 = _1021 * 6.283185482025146484375;
    float _1057 = sin(_1055);
    float _1059 = _1019 * _1035;
    float _1061 = _997 * _1035;
    float _1063 = _1019 * _1043;
    float _1065 = _997 * _1043;
    float _1067 = _1035 * _1043;
    float _1069 = _1031 * _1043;
    float _1071 = _1063 * _1025;
    float _1073 = _1065 * _1025;
    float _1075 = fma(_1057, _1059, _1045);
    float _1077 = -_1025;
    float _1079 = _1057 * _1077;
    float _1081 = -_1061;
    float _1083 = fma(_1057, _1047, _1081);
    float _1085 = fma(_1057, _1045, _1059);
    float _1087 = fma(_1075, _1023, _1071);
    float _1089 = -_1047;
    float _1091 = fma(_1057, _1061, _1089);
    float _1093 = fma(_1067, _1023, _1079);
    float _1095 = _175 * _1007;
    float _1097 = fma(_1083, _621, _1087);
    float _1099 = fma(_1091, _1023, _1073);
    float _1101 = fma(_1069, _621, _1093);
    float _1103 = fma(_173, _1005, _1095);
    float _1105 = _1097 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1107 = fma(_1085, _621, _1099);
    float _1109 = _1097 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1111 = fma(_189, _1009, _1049);
    float _1113 = fma(_1101, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1105);
    float _1115 = fma(_177, _1009, _1103);
    float _1117 = fma(_1101, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1109);
    float _1119 = _1111 + _1053;
    float _1121 = fma(_1107, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1113);
    float _1123 = _1115 + _1027;
    float _1125 = fma(_1107, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1117);
    float _1127 = in.m_60.w;
    float _1129 = _1121 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1131 = _1097 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1133 = _1125 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1135 = fma(_183, _1009, _1051);
    float _1137 = _1119 + _1129;
    float _1139 = fma(_1101, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1131);
    float _1141 = _1123 + _1133;
    float _1143 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1145 = _1137 + _1143;
    float _1147 = fma(_1107, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1139);
    float _1149 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1151 = _1141 + _1149;
    float _1153 = _1145 * _1145;
    float _1155 = _1147 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1157 = fma(_1151, _1151, _1153);
    float _1159 = sqrt(_1157);
    float _1161 = _1135 + _1127;
    float _1163 = _1161 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1165 = _1161 + _1155;
    float _1167 = fma(_1123, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1163);
    float _1169 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1167);
    bool _1171 = _1159 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1173 = _1147;
    float _1175 = _1155;
    float _1177 = _1163;
    float _1179 = _1159;
    if (!_1171)
    {
        _1173 = _1141;
    }
    float _1181 = _1173;
    float _1183 = _1181;
    if (!_1171)
    {
        _1175 = _1137;
    }
    float _1185 = _1175;
    float _1187 = _1185;
    if (!_1171)
    {
        _1177 = _1165;
    }
    float _1189 = _1177;
    bool _1191 = !_1171;
    float _1193 = _1189;
    if (!_1191)
    {
        float _1195 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1197 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1199 = _1159 + _1197;
        float _1201 = rsqrt(_1157);
        float _1203 = _1199 * _1195;
        float _1205 = _1165 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1207 = _1203 * 0.15915493667125701904296875;
        float _1209 = _1207 * 6.283185482025146484375;
        float _1211 = sin(_1209);
        float _1213 = _1207 * 6.283185482025146484375;
        float _1215 = cos(_1213);
        float _1217 = fma(_1211, _1205, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1219 = _1201 * _1217;
        float _1221 = _1215 + (-1.0);
        float _1223 = fma(_1151, _1219, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1225 = fma(_1145, _1219, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1227 = _1221 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1229 = fma(_1165, _1215, _1227);
        _1193 = _1229;
        _1183 = _1223;
        _1187 = _1225;
    }
    float _1231 = _1193;
    float _1233 = _1183;
    float _1235 = _1187;
    float _1237 = -_1161;
    float _1239 = _1237 + _1231;
    float _1241 = -_1123;
    float _1243 = _1241 + _1233;
    float _1245 = _1169 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1247 = _1161 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1249 = _1239 * _1239;
    float _1251 = -_1119;
    float _1253 = _1251 + _1235;
    float _1255 = 1.0 / _1245;
    float _1257 = fma(_1123, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1247);
    float _1259 = fma(_1243, _1243, _1249);
    float _1261 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1257);
    float _1263 = fma(_1253, _1253, _1259);
    bool _1265 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1267 = isnan(0.5);
    bool _1269 = _1265 || _1267;
    bool _1271 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1273 = _1269 || _1271;
    float _1275 = _1261 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1277 = sqrt(_1263);
    bool _1279 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1281 = isnan(0.5);
    bool _1283 = _1279 || _1281;
    bool _1285 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1287 = _1283 || _1285;
    float _1289 = _1275 + _1245;
    float _1291 = _1289 * _1255;
    float _1293 = _1291 * 0.5;
    float _1295 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1297 = fma(_1293, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1295);
    float _1299 = 1.0 / _1297;
    bool _1301 = _1277 > 0.0;
    bool _1303 = !_1301;
    float _1305 = _1233;
    float _1307 = _1231;
    float _1309 = _1235;
    float _1311 = _1239;
    float _1313 = _1245;
    float _1315 = _1297;
    float _1317 = _1277;
    float _1319 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1321 = _1243;
    if (!_1303)
    {
        float _1323 = _223 * _223;
        float _1325 = fma(_221, _221, _1323);
        float _1327 = rsqrt(_1263);
        float _1329 = fma(_225, _225, _1325);
        float _1331 = sqrt(_1329);
        float _1333 = _1243 * _1327;
        float _1335 = _1239 * _1327;
        float _1337 = _1253 * _1327;
        bool _1339 = _1331 > 0.0;
        bool _1341 = !_1339;
        _1313 = _1337;
        _1315 = _1329;
        _1317 = _1327;
        _1319 = _1331;
        _1321 = _1333;
        if (!_1341)
        {
            float _1343 = rsqrt(_1329);
            float _1345 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1347 = _223 * _1343;
            float _1349 = _221 * _1343;
            float _1351 = _225 * _1343;
            float _1353 = _1335 * _1347;
            float _1355 = fma(_1333, _1349, _1353);
            float _1357 = _1345 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1359 = fma(_1337, _1351, _1355);
            float _1361 = _1359 * _1357;
            float _1363 = fma(_221, _1361, _1233);
            float _1365 = fma(_223, _1361, _1231);
            float _1367 = fma(_225, _1361, _1235);
            _1305 = _1363;
            _1307 = _1365;
            _1309 = _1367;
            _1311 = _1361;
            _1317 = _1353;
            _1319 = _1345;
            _1321 = _1357;
        }
    }
    float _1369 = _1305;
    float _1371 = _1307;
    float _1373 = _1309;
    float _1375 = _1311;
    float _1377 = _1313;
    float _1379 = _1315;
    float _1381 = _1317;
    float _1383 = _1319;
    float _1385 = _1321;
    float _1387 = _1383;
    float _1389 = _1379;
    float _1391 = _1377;
    float _1393 = _1375;
    float _1395 = _1381;
    float _1397 = _1385;
    if (_1287)
    {
        _1387 = 1.0;
    }
    float _1399 = _1387;
    float _1401 = _1399;
    if (_1273)
    {
        _1389 = _1369;
    }
    float _1403 = _1389;
    float _1405 = _1403;
    if (_1273)
    {
        _1391 = _1371;
    }
    float _1407 = _1391;
    float _1409 = _1407;
    if (_1273)
    {
        _229 = _1373;
    }
    float _1411 = _229;
    float _1413 = _1411;
    if (!_1273)
    {
        float _1415 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1417 = _1161 + _1415;
        float _1419 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1421 = _1123 + _1419;
        float _1423 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1425 = -_1161;
        float _1427 = _1425 + _1371;
        float _1429 = _1417 * _1417;
        float _1431 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1433 = _1119 + _1431;
        float _1435 = -_1123;
        float _1437 = _1435 + _1369;
        float _1439 = -_1119;
        float _1441 = _1439 + _1373;
        float _1443 = fma(_1421, _1421, _1429);
        float _1445 = fma(_1433, _1433, _1443);
        float _1447 = sqrt(_1445);
        float _1449 = precise::min(_1447, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1451 = _1449 * _1423;
        float _1453 = fma(_1427, _1451, _1161);
        float _1455 = fma(_1437, _1451, _1123);
        float _1457 = fma(_1441, _1451, _1119);
        _1393 = _1451;
        _1409 = _1453;
        _1405 = _1455;
        _1413 = _1457;
        _231 = _1423;
        _1395 = _1429;
    }
    float _1459 = _1393;
    float _1461 = _1409;
    float _1463 = _1405;
    float _1465 = _1413;
    float _1467 = _231;
    float _1469 = _1395;
    float _1471 = _1459;
    if (_1287)
    {
        _1397 = 1.0;
    }
    float _1473 = _1397;
    float _1475 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1477 = _1299 * _1475;
    float _1479 = _1473;
    if (!_1287)
    {
        float _1481 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1483 = _1481 * 0.15915493667125701904296875;
        float _1485 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1487 = _1483 * 6.283185482025146484375;
        float _1489 = cos(_1487);
        float _1491 = _1485 * 0.15915493667125701904296875;
        float _1493 = _1483 * 6.283185482025146484375;
        float _1495 = sin(_1493);
        float _1497 = 1.0 / _1489;
        float _1499 = _1491 * 6.283185482025146484375;
        float _1501 = cos(_1499);
        float _1503 = _1495 * _1497;
        float _1505 = _1491 * 6.283185482025146484375;
        float _1507 = sin(_1505);
        float _1509 = _1501 * _1503;
        float _1511 = 1.0 / _1509;
        float _1513 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1515 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1513;
        float _1517 = 1.0 / _1515;
        float _1519 = _1507 * _1511;
        float _1521 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1523 = fma(_1477, _1519, _1521);
        float _1525 = _1523 * _1517;
        float _1527 = precise::clamp(_1525, 0.0, 1.0);
        _1471 = _1483;
        _1401 = _1527;
    }
    float _1529 = _1471;
    float _1531 = _1401;
    float _1533 = _1529;
    if (!_1287)
    {
        float _1535 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1537 = _1535 * 0.15915493667125701904296875;
        float _1539 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1541 = _1537 * 6.283185482025146484375;
        float _1543 = cos(_1541);
        float _1545 = _1539 * 0.15915493667125701904296875;
        float _1547 = _1537 * 6.283185482025146484375;
        float _1549 = sin(_1547);
        float _1551 = 1.0 / _1543;
        float _1553 = _1545 * 6.283185482025146484375;
        float _1555 = cos(_1553);
        float _1557 = _1549 * _1551;
        float _1559 = _1545 * 6.283185482025146484375;
        float _1561 = sin(_1559);
        float _1563 = _1555 * _1557;
        float _1565 = 1.0 / _1563;
        float _1567 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1569 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1567;
        float _1571 = 1.0 / _1569;
        float _1573 = _1561 * _1565;
        float _1575 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1577 = fma(_1477, _1573, _1575);
        float _1579 = _1577 * _1571;
        float _1581 = precise::clamp(_1579, 0.0, 1.0);
        float _1583 = -_1581;
        float _1585 = _1583 + 1.0;
        _1533 = _1543;
        _1479 = _1585;
    }
    float _1587 = _1533;
    float _1589 = _1479;
    float _1591 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1593 = _1461 + _1591;
    float _1595 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1597 = _1463 + _1595;
    float _1599 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1601 = _1465 + _1599;
    float _1603 = _1593 * _1593;
    float _1605 = fma(_1597, _1597, _1603);
    float _1607 = fma(_1123, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1609 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1611 = fma(_1601, _1601, _1605);
    float _1613 = rsqrt(_1611);
    float _1615 = sqrt(_1611);
    float _1617 = _1613 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1619 = _1597 * _1617;
    float _1621 = _1601 * _1617;
    float _1623 = _1619 * _1619;
    float _1625 = _1621 * _1621;
    float _1627 = _1623 + _1625;
    float _1629 = sqrt(_1627);
    bool _1631 = _1629 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1633 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1635 = _1629 + _1633;
    float _1637 = _1467;
    float _1639 = _1627;
    float _1641 = _1635;
    float _1643 = _1593;
    float _1645 = _1619;
    float _1647 = _1621;
    float _1649 = _1623;
    float _1651 = _1625;
    if (_1631)
    {
        float _1653 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1637 = _1653;
    }
    float _1655 = _1637;
    if (_1631)
    {
        float _1657 = rsqrt(_1627);
        _1639 = _1657;
    }
    float _1659 = _1639;
    float _1661 = _1655;
    if (_1631)
    {
        float _1663 = _1635 * _1655;
        _1641 = _1663;
    }
    float _1665 = _1641;
    if (_1631)
    {
        float _1667 = _1665 * 0.15915493667125701904296875;
        _1179 = _1667;
    }
    float _1669 = _1179;
    float _1671 = _1469;
    if (_1631)
    {
        float _1673 = _1669 * 6.283185482025146484375;
        float _1675 = sin(_1673);
        _1671 = _1675;
    }
    float _1677 = _1671;
    float _1679 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1681 = precise::max(0.0, _1679);
    float _1683 = _1587;
    float _1685 = _1681;
    if (_1631)
    {
        float _1687 = _1669 * 6.283185482025146484375;
        float _1689 = cos(_1687);
        _1683 = _1689;
    }
    float _1691 = _1683;
    float _1693 = -_1617;
    float _1695 = -_1681;
    float _1697 = fma(_1593, _1693, _1695);
    if (_1631)
    {
        float _1699 = _1697 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1643 = _1699;
    }
    float _1701 = _1643;
    float _1703 = _1677;
    float _1705 = _1701;
    if (_1631)
    {
        float _1707 = fma(_1677, _1701, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1703 = _1707;
    }
    float _1709 = _1703;
    float _1711 = _1709;
    if (!_1631)
    {
        _1705 = _1697;
    }
    float _1713 = _1705;
    float _1715 = _1713;
    if (_1631)
    {
        float _1717 = _1691 + (-1.0);
        _1685 = _1717;
    }
    float _1719 = _1685;
    if (_1631)
    {
        float _1721 = _1659 * _1709;
        _1711 = _1721;
    }
    float _1723 = _1711;
    if (_1631)
    {
        float _1725 = _1719 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1661 = _1725;
    }
    float _1727 = _1661;
    if (_1631)
    {
        float _1729 = _1619 * _1723;
        _1645 = _1729;
    }
    float _1731 = _1645;
    if (_1631)
    {
        float _1733 = _1621 * _1723;
        _1647 = _1733;
    }
    float _1735 = _1647;
    float _1737 = floor(_1607);
    if (_1631)
    {
        float _1739 = fma(_1697, _1691, _1727);
        _1715 = _1739;
    }
    float _1741 = _1715;
    if (_1631)
    {
        float _1743 = _1731 * _1731;
        _1649 = _1743;
    }
    float _1745 = _1649;
    if (_1631)
    {
        float _1747 = _1735 * _1735;
        _1651 = _1747;
    }
    float _1749 = _1651;
    float _1751 = _1461 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1753 = fma(_1119, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1755 = fma(_1741, _1741, _1745);
    float _1757 = floor(_1753);
    float _1759 = _1755 + _1749;
    float _1761 = fma(_1463, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1751);
    float _1763 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1765 = fma(_1615, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1763);
    float _1767 = precise::clamp(_1765, 0.0, 1.0);
    float _1769 = _1461 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1771 = fma(_1465, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1761);
    float _1773 = -_1767;
    float _1775 = _1773 + 1.0;
    float _1777 = rsqrt(_1759);
    float _1779 = _1461 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1781 = fma(_1463, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1769);
    float _1783 = _1771 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1785 = _1461 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1787 = fma(_1463, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1779);
    float _1789 = fma(_1465, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1781);
    float _1791 = _1783 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1793 = abs(_1775);
    float _1795 = log2(_1793);
    float _1797 = fma(_1465, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1787);
    float _1799 = _1789 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1801 = fma(_1463, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1785);
    float _1803 = -_1791;
    float _1805 = fma(_1803, _1609, 1.0);
    float _1807 = _1797 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1809 = _1799 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1811 = fma(_1465, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1801);
    float _1813 = _1777 * _1731;
    float _1815 = _1777 * _1741;
    float _1817 = fma(_1807, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1809);
    float _1819 = _1777 * _1735;
    float _1821 = _1813 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1823 = _1811 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1825 = fma(_1783, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1817);
    float _1827 = -_1737;
    float _1829 = _1607 + _1827;
    float _1831 = -_1821;
    float _1833 = fma(_1815, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1831);
    float _1835 = _1795 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1837 = fma(_1823, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1825);
    float _1839 = log2(_1805);
    float _1841 = -_1819;
    float _1843 = fma(_1841, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1833);
    float _1845 = -_1757;
    float _1847 = _1753 + _1845;
    float _1849 = _1799 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1851 = _1799 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1853 = fma(_1843, -0.5, 0.5);
    float _1855 = _1815 + 1.0;
    float _1857 = fma(_1807, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1849);
    float _1859 = 1.0 / _1837;
    float _1861 = fma(_1783, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1857);
    float _1863 = fma(_1823, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1861);
    float _1865 = exp2(_1835);
    float _1867 = _1839 * 0.693147182464599609375;
    float _1869 = _1867 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1871 = sqrt(_1853);
    float _1873 = fma(_1843, 0.5, 0.5);
    float _1875 = fma(_1807, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1851);
    float _1877 = fma(_1873, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1879 = fma(_1783, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1875);
    float _1881 = _1863 * _1859;
    float _1883 = -_1815;
    float _1885 = fma(_1865, _1855, _1883);
    float _1887 = fma(_1873, _1877, -0.212114393711090087890625);
    float _1889 = fma(_1823, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1879);
    float _1891 = fma(_1881, 0.5, 0.5);
    float _1893 = fma(_1885, 0.5, 0.5);
    float _1895 = fma(_1873, _1887, 1.570728778839111328125);
    float _1897 = _1889 * _1859;
    float _1899 = _1871 * 0.636619746685028076171875;
    float _1901 = fma(_1897, -0.5, 0.5);
    float _1903 = -_1895;
    float _1905 = fma(_1899, _1903, 1.0);
    float2 _5825 = float2(_1829, _1847);
    float _1907 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5825, float2(0.0), isnan(_5825)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5825, float2(0.0), isnan(_5825)), level(0.0)).x;
    float3 _5836 = float3(_1891, _1901, _1869);
    float _1909 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5836, float3(0.0), isnan(_5836)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5836, float3(0.0), isnan(_5836)), level(0.0)).x;
    float3 _5847 = float3(_1891, _1901, _1869);
    float4 _1912 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5847, float3(0.0), isnan(_5847)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5847, float3(0.0), isnan(_5847)), level(0.0)).xyzw;
    float _1914 = _1912.x;
    float _1916 = _1912.y;
    float _1918 = _1912.z;
    float _1920 = _1912.w;
    float2 _5863 = float2(_1905, _1893);
    float3 _1924 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5863, float2(0.0), isnan(_5863)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5863, float2(0.0), isnan(_5863)), level(0.0)).xyz;
    float _1926 = _1924.x;
    float _1928 = _1924.y;
    float _1930 = _1924.z;
    float _1932 = float(uint(_735));
    float _1934 = trunc(_891);
    int _1936 = int(_1934);
    int _1938 = abs(_645);
    float _1940 = -_911;
    float _1942 = _1940 + 1.0;
    bool _1944 = _605 > 0.5;
    float _1946 = -_929;
    float _1948 = _1946 + 1.0;
    int _1950 = ~_735;
    int _1952 = _1950 + 1;
    float _1954 = -_919;
    float _1956 = _1954 + 1.0;
    float _1958 = -_207;
    int _1960 = _1944 ? as_type<int>(_1958) : as_type<int>(_207);
    float _1962 = 1.0 / _1932;
    bool _1964 = _603 > 0.5;
    float _1966 = -_767;
    float _1968 = _1966 + 1.0;
    bool _1970 = _607 > 0.5;
    float _1972 = _1795 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1974 = float(uint(_1936));
    float _1976 = 1.0 / _599;
    int _1978 = as_type<int>(_1962) + (-2);
    float _1980 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1982 = as_type<float>(_1978) * _1974;
    float _1984 = trunc(_1982);
    float _1986 = precise::max(_1984, 0.0);
    uint _1989 = uint(_1986);
    float _1991 = _921 * _1976;
    bool _1993 = !_619;
    float _1995 = _1993 ? 7.345489978790283203125 : 1.0;
    float _1997 = trunc(_1991);
    int _1999 = int(_1997);
    int _2001 = ~_735;
    int _2003 = _2001 + 1;
    float _2005 = _1980 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _2007 = _1952 * int(_1989);
    int _2009 = _2007 + _1936;
    float _2011 = exp2(_1972);
    float _2013 = float(uint(_2009));
    float _2015 = as_type<float>(_1978) * _2013;
    float _2017 = _1995 * _603;
    float _2019 = float(_1936);
    float _2021 = -_203;
    int _2023 = _1964 ? as_type<int>(_2021) : as_type<int>(_203);
    float _2025 = floor(_2017);
    bool _2027 = _2019 >= _909;
    bool _2029 = isnan(_2019);
    bool _2031 = _2027 || _2029;
    bool _2033 = isnan(_909);
    bool _2035 = _2031 || _2033;
    float _2037 = float(_2035);
    float _2039 = -_2011;
    float _2041 = _2039 + 1.0;
    float _2043 = trunc(_2015);
    float _2045 = precise::max(_2043, 0.0);
    uint _2047 = uint(_2045);
    float _2049 = trunc(_2037);
    int _2051 = int(_2049);
    float _2053 = -_2025;
    float _2055 = _2017 + _2053;
    float _2057 = _2055 * _909;
    int _2059 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2061 = _2059 != 0;
    int _2063 = int(_1989) + int(_2047);
    float _2065 = trunc(_2057);
    int _2067 = int(_2065);
    int _2069 = _735 + (-1);
    int _2071 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2073 = _2071 != 0;
    int _2075 = _2003 * _2063;
    int _2077 = _2075 + _1936;
    int _2079 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2081 = _2079 != 0;
    int _2083 = ~_2051;
    int _2085 = _2083 + 1;
    int _2087 = _2085 + 1;
    bool _2089 = uint(_2077) >= uint(_735);
    bool _2091 = !_2061;
    int _2093 = _2091 ? 0 : 1;
    bool _2095 = !_2089;
    int _2097 = _2095 ? 0 : (-1);
    bool _2099 = _735 == 0;
    int _2101 = ~_2063;
    int _2103 = _2101 + _2097;
    int _2105 = _2103 + 1;
    int _2107 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2109 = _2107 != 0;
    int _2111 = abs(_639);
    int _2113 = _735 * _2105;
    int _2115 = _2113 + _1936;
    int _2117 = abs(_2093);
    bool _2119 = !_2073;
    float _2121 = _2119 ? _207 : as_type<float>(_1960);
    bool _2123 = !_2099;
    int _2125 = _2123 ? _2115 : (-1);
    int _2127 = _2067 * _2117;
    int _2129 = _2127 + _1936;
    bool _2131 = !_2081;
    float _2133 = _2131 ? _203 : as_type<float>(_2023);
    int _2135 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2137 = _2135 != 0;
    int _2139 = _2125 * _2087;
    int _2141 = ~_735;
    int _2143 = _2141 + 1;
    int _2145 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2147 = _2145 != 0;
    int _2149 = _2051 * _2069;
    int _2151 = _2149 + _2139;
    bool _2153 = !_2109;
    int _2155 = _2153 ? 0 : 1;
    int _2157 = abs(_713);
    int _2159 = _2151 * _2111;
    int _2161 = abs(_2155);
    int _2163 = _1999 * _1938;
    int _2165 = _2163 + _2159;
    float _2167 = float(uint(_2129));
    int _2169 = ~_735;
    int _2171 = _2169 + 1;
    int _2173 = _2129 * _2157;
    int _2175 = _2173 + _2165;
    bool _2177 = _609 > 0.5;
    int _2179 = _2067 * _2161;
    int _2181 = _2179 + _2175;
    int _2183 = ~_735;
    int _2185 = _2183 + 1;
    float _2187 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2189 = _2187 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2191 = float(uint(_2181));
    float _2193 = as_type<float>(_1978) * _2191;
    float _2195 = 1.0 / _2189;
    float _2197 = trunc(_2193);
    float _2199 = precise::max(_2197, 0.0);
    uint _2201 = uint(_2199);
    int _2203 = _2185 * int(_2201);
    int _2205 = _2203 + _2181;
    float _2207 = float(uint(_2205));
    float _2209 = as_type<float>(_1978) * _2207;
    float _2211 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2213 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2211;
    float _2215 = _2133 + 0.5;
    float _2217 = trunc(_2209);
    float _2219 = precise::max(_2217, 0.0);
    uint _2221 = uint(_2219);
    float _2223 = _2213 * _2195;
    float _2225 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2227 = _601 + _2225;
    float _2229 = fma(_2223, _2227, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _2231 = as_type<float>(_1978) * _2167;
    float _2233 = _2121 + (-0.5);
    float _2235 = trunc(_2231);
    float _2237 = precise::max(_2235, 0.0);
    uint _2239 = uint(_2237);
    int _2241 = int(_2201) + int(_2221);
    bool _2243 = _601 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2245 = isnan(_601);
    bool _2247 = _2243 || _2245;
    bool _2249 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2251 = _2247 || _2249;
    float _2253 = float(_2251);
    bool _2255 = _601 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2257 = isnan(_601);
    bool _2259 = _2255 || _2257;
    bool _2261 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2263 = _2259 || _2261;
    float _2265 = float(_2263);
    int _2267 = _2171 * _2241;
    int _2269 = _2267 + _2181;
    float _2271 = -_2265;
    float _2273 = _2271 + 1.0;
    bool _2275 = uint(_2269) >= uint(_735);
    float _2277 = _2253 * _2273;
    bool _2279 = !_2275;
    int _2281 = _2279 ? 0 : (-1);
    float _2283 = _2229 * _2277;
    float _2285 = -_2233;
    float _2287 = -_691;
    float _2289 = fma(_2285, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2287);
    float _2291 = -_2253;
    float _2293 = _2291 + 1.0;
    float _2295 = fma(_2215, (*spvDescriptorSet0.vp_c9)._m0[80].x, _743);
    float _2297 = -_203;
    int _2299 = _1970 ? as_type<int>(_2297) : as_type<int>(_203);
    float _2301 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2303 = fma(_2293, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2283);
    int _2305 = ~_2241;
    int _2307 = _2305 + _2281;
    int _2309 = _2307 + 1;
    int _2311 = _2143 * int(_2239);
    int _2313 = _2311 + _2129;
    float _2315 = -_207;
    int _2317 = _2177 ? as_type<int>(_2315) : as_type<int>(_207);
    float _2319 = -_1942;
    float _2321 = fma(_2133, _2319, _2295);
    bool _2323 = !_2147;
    float _2325 = _2323 ? _203 : as_type<float>(_2299);
    int _2327 = _735 * _2309;
    int _2329 = _2327 + _2181;
    float _2331 = float(uint(_2313));
    float _2333 = fma(_2121, _1948, _2289);
    float _2335 = abs(_1477);
    float _2337 = log2(_2335);
    bool _2339 = !_2137;
    float _2341 = _2339 ? _207 : as_type<float>(_2317);
    float _2343 = fma(_2265, (*spvDescriptorSet0.vp_c9)._m0[132].x, _2303);
    int _2345 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2347 = _2345 != 0;
    float _2349 = as_type<float>(_1978) * _2331;
    bool _2351 = !_2099;
    int _2353 = _2351 ? _2329 : (-1);
    float _2355 = _2301 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2357 = _2325 + 0.5;
    float _2359 = _2341 + (-0.5);
    int _2361 = ~_735;
    int _2363 = _2361 + 1;
    float _2365 = trunc(_2349);
    float _2367 = precise::max(_2365, 0.0);
    uint _2369 = uint(_2367);
    float _2371 = fma(_2005, _2357, _935);
    float _2373 = -_2355;
    float _2375 = -_939;
    float _2377 = fma(_2373, _2359, _2375);
    int _2379 = _2353 & 3;
    bool _2381 = _2379 != 0;
    float _2383 = _1083 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2385 = -_1956;
    float _2387 = fma(_2325, _2385, _2371);
    float _2389 = _2337 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _2391 = _2353 >> 31;
    float _2393 = fma(_2341, _1968, _2377);
    float _2395 = _1063 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2397 = _203 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2399 = exp2(_2389);
    int _2401 = _2391 & 3;
    out.m_72.x = _2321;
    out.m_72.y = _2333;
    out.m_72.z = _2387;
    out.m_72.w = _2393;
    float _2403 = _1063 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2405 = _1063 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2407 = -_1057;
    float _2409 = fma(_2407, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2395);
    int _2411 = int(_2239) + int(_2369);
    float _2413 = _1083 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2415 = -_1057;
    float _2417 = fma(_2415, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2405);
    float _2419 = _2343 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _2421 = _2363 * _2411;
    int _2423 = _2421 + _2129;
    float _2425 = fma(_1069, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2413);
    int _2427 = _2381 ? 0 : 1;
    float _2429 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2417);
    bool _2431 = _1477 <= 8000.0;
    bool _2433 = isnan(_1477);
    bool _2435 = _2431 || _2433;
    bool _2437 = isnan(8000.0);
    bool _2439 = _2435 || _2437;
    float _2441 = float(_2439);
    float _2443 = -_1057;
    float _2445 = fma(_2443, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2403);
    int _2447 = _2353 + _2401;
    float _2449 = fma(_2399, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2451 = precise::clamp(_2449, 0.0, 1.0);
    float _2453 = _1075 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2455 = uint(_2423) >= uint(_735);
    float _2457 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2445);
    int _2459 = _2447 >> 2;
    float _2461 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2453);
    float _2463 = _1083 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2465 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2409);
    int _2467 = _2459 << 4;
    int _2469 = _2467 + 368;
    float _2471 = _1075 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2473 = fma(_1069, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2463);
    int _2475 = _2353 & 3;
    bool _2477 = _2475 != 0;
    uint _2479 = uint(int(uint(_2469) >> uint(2)));
    uint _2481 = uint(int(uint(int(_2479)) >> uint(2)));
    int _2483 = int(_2479) & 3;
    float _2485 = (*spvDescriptorSet0.vp_c9)._m0[int(_2481)][_2483];
    int _2487 = int(_2479) + 1;
    uint _2489 = uint(int(uint(_2487) >> uint(2)));
    int _2491 = _2487 & 3;
    float _2493 = (*spvDescriptorSet0.vp_c9)._m0[int(_2489)][_2491];
    float _2495 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2471);
    float _2497 = _207 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2499 = uint(_2475) > 1u;
    float _2501 = fma(_1069, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2383);
    int _2503 = ~_2427;
    int _2505 = _2503 + 1;
    int _2507 = _2505 + 1;
    float _2509 = _2497 * _2465;
    float _2511 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2461);
    int _2513 = _2469 + 8;
    uint _2515 = uint(int(uint(_2513) >> uint(2)));
    uint _2517 = uint(int(uint(int(_2515)) >> uint(2)));
    int _2519 = int(_2515) & 3;
    float _2521 = (*spvDescriptorSet0.vp_c9)._m0[int(_2517)][_2519];
    int _2523 = int(_2515) + 1;
    uint _2525 = uint(int(uint(_2523) >> uint(2)));
    int _2527 = _2523 & 3;
    float _2529 = (*spvDescriptorSet0.vp_c9)._m0[int(_2525)][_2527];
    float _2531 = _2497 * _2429;
    float _2533 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2495);
    float _2535 = fma(_2451, -2.0, 3.0);
    float _2537 = _2451 * _2451;
    bool _2539 = uint(_2475) >= 2u;
    float _2541 = _1075 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2543 = _2497 * _2457;
    int _2545 = _2507;
    if (!_2499)
    {
        int _2547 = ~_2427;
        int _2549 = _2547 + 1;
        _2545 = _2549;
    }
    int _2551 = _2545;
    float _2553 = _2537 * _2535;
    bool _2555 = _2475 != 3;
    float _2557 = fma(_1085, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2473);
    int _2559 = abs(_2551);
    float _2561 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2541);
    int _2563 = _2539 ? 0 : 1;
    float _2565 = -_1907;
    float _2567 = _2565 + 1.0;
    float _2569 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2561);
    bool _2571 = !_2455;
    int _2573 = _2571 ? 0 : (-1);
    float _2575 = fma(_2397, _2511, _2543);
    bool _2577 = !_2477;
    int _2579 = _2577 ? 0 : 1;
    float _2581 = fma(_2397, _2569, _2531);
    bool _2583 = _2475 != 3;
    float _2585 = fma(_1085, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2425);
    int _2587 = ~_2563;
    int _2589 = _2587 + 1;
    int _2591 = _2589 + 1;
    float _2593 = fma(_1085, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2501);
    int _2595 = _2591;
    if (_2555)
    {
        int _2597 = ~_2563;
        int _2599 = _2597 + 1;
        _2595 = _2599;
    }
    int _2601 = _2595;
    out.m_74.w = _2419;
    int _2603 = ~_2559;
    int _2605 = _2603 + 1;
    int _2607 = _2605 + 1;
    int _2609 = ~_2411;
    int _2611 = _2609 + _2573;
    int _2613 = _2611 + 1;
    bool _2615 = !_2583;
    int _2617 = _2615 ? 0 : (-1);
    int _2619 = abs(_2579);
    int _2621 = _735 * _2613;
    int _2623 = _2621 + _2129;
    int _2625 = abs(_2601);
    float _2627 = fma(_2397, _2533, _2509);
    int _2629 = abs(_2617);
    float _2631 = in.m_76.x;
    int _2633 = _2607 * as_type<int>(_2493);
    bool _2635 = !_2347;
    int _2637 = _2635 ? 0 : 1;
    float _2639 = _1837 * 0.5;
    int _2641 = ~_2619;
    int _2643 = _2641 + 1;
    int _2645 = _2643 + 1;
    float _2647 = _2041 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2649 = _2585 + _2627;
    int _2651 = abs(_2637);
    int _2653 = _2645 * as_type<int>(_2485);
    int _2655 = _2653 + _2633;
    int _2657 = ~_2625;
    int _2659 = _2657 + 1;
    int _2661 = _2659 + 1;
    float _2663 = _2647 * _1909;
    float _2665 = _2593 + _2581;
    int _2667 = ~_2629;
    int _2669 = _2667 + 1;
    int _2671 = _2669 + 1;
    int _2673 = _2661 * as_type<int>(_2521);
    int _2675 = _2673 + _2655;
    float _2677 = _1799 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2679 = ~_2651;
    int _2681 = _2679 + 1;
    int _2683 = _2681 + 1;
    float _2685 = -_2553;
    float _2687 = _2685 + 1.0;
    int _2689 = _2671 * as_type<int>(_2529);
    int _2691 = _2689 + _2675;
    float _2693 = fma(_1807, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2677);
    bool _2695 = !_2099;
    int _2697 = _2695 ? _2623 : (-1);
    float _2699 = fma(_2687, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2553);
    int _2701 = _2691 * _2683;
    float _2703 = fma(_1783, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2693);
    float _2705 = _2441 * _2699;
    int _2707 = _2697 * _2651;
    int _2709 = _2707 + _2701;
    float _2711 = fma(_1823, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2703);
    float _2713 = _2705 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2715 = fma(_1889, -0.5, _2639);
    float _2717 = float(_2709);
    float _2719 = _2711 + _1837;
    float _2721 = _1863 + _1837;
    float _2723 = _2567 * _2713;
    float _2725 = precise::clamp(_2723, 0.0, 1.0);
    float _2727 = _1930 * _2663;
    float _2729 = _2719 * 0.5;
    float _2731 = _2721 * 0.5;
    float _2733 = -_2725;
    float _2735 = fma(_2733, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_78.x = _2717;
    float _2737 = _2557 + _2575;
    float _2739 = fma(_1920, _2727, _1918);
    float _2741 = _2735 * _2631;
    out.m_80.x = _2731;
    out.m_80.y = _2715;
    out.m_80.z = _2729;
    out.m_80.w = _1837;
    bool _2743 = _1615 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2745 = isnan(_1615);
    bool _2747 = _2743 || _2745;
    bool _2749 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2751 = _2747 || _2749;
    float _2753 = _2741 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_82.x = _2737;
    out.m_82.y = _2649;
    out.m_82.z = _2665;
    out.m_84.x = _2753;
    out.gl_Position.x = _1863;
    out.gl_Position.y = _1889;
    out.gl_Position.z = _2711;
    out.gl_Position.w = _1837;
    float _2755 = _1920 * _2663;
    float _2757 = -_2647;
    float _2759 = _2757 + 1.0;
    float _2761 = _2729;
    float _2763 = _2755;
    if (!_2751)
    {
        _2761 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2765 = _2761;
    float _2767 = fma(_1926, _2755, _1914);
    float _2769 = fma(_1928, _2755, _1916);
    float _2771 = _1920 * _2759;
    float _2773 = _1531 * _1589;
    float _2775 = _2773;
    float _2777 = _2765;
    float _2779 = _2765;
    if (!_2751)
    {
        _2763 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2781 = _2763;
    out.m_86.x = _2767;
    out.m_86.y = _2769;
    out.m_86.z = _2739;
    out.m_86.w = _2771;
    float _2783 = _2773 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2785 = _2781;
    float _2787 = _2781;
    if (!_2751)
    {
        _2775 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2789 = _2775;
    bool _2791 = !_2751;
    float _2793 = _2789;
    float _2795 = _2789;
    if (!_2791)
    {
        bool _2797 = _1615 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2799 = isnan(_1615);
        bool _2801 = _2797 || _2799;
        bool _2803 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2805 = _2801 || _2803;
        if (!_2805)
        {
            float _2807 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2809 = _1615 + _2807;
            float _2811 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2813 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2811;
            float _2815 = 1.0 / _2813;
            float _2817 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2819 = _2817 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2821 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2823 = _2821 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2825 = _2809 * _2815;
            float _2827 = precise::clamp(_2825, 0.0, 1.0);
            float _2829 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2831 = _2829 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2833 = fma(_2827, _2823, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2835 = fma(_2827, _2831, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2837 = fma(_2827, _2819, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            _2787 = _2837;
            _2779 = _2835;
            _2795 = _2833;
            _2839 = true;
        }
        else
        {
            bool _2841 = _1615 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2843 = isnan(_1615);
            bool _2845 = _2841 || _2843;
            bool _2847 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2849 = _2845 || _2847;
            if (!_2849)
            {
                _2777 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2851 = _2777;
            _2779 = _2851;
            if (!_2849)
            {
                _2785 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2853 = _2785;
            _2787 = _2853;
            if (!_2849)
            {
                _2793 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2855 = _2793;
            bool _2857 = !_2849;
            _2795 = _2855;
            if (!_2857)
            {
                bool _2859 = _1615 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2861 = isnan(_1615);
                bool _2863 = _2859 || _2861;
                bool _2865 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2867 = _2863 || _2865;
                if (!_2867)
                {
                    float _2869 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2871 = _1615 + _2869;
                    float _2873 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2875 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2873;
                    float _2877 = 1.0 / _2875;
                    float _2879 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2881 = _2879 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2883 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2885 = _2883 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2887 = _2871 * _2877;
                    float _2889 = precise::clamp(_2887, 0.0, 1.0);
                    float _2891 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2893 = _2891 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2895 = fma(_2889, _2885, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2897 = fma(_2889, _2893, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2899 = fma(_2889, _2881, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    _2787 = _2899;
                    _2779 = _2897;
                    _2795 = _2895;
                    _2839 = true;
                }
                else
                {
                    _2787 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2779 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2795 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _2839 = false;
    float _2901 = _2787;
    float _2903 = _2779;
    float _2905 = _2795;
    float _2907 = _2783 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_88.x = 0.0;
    float _2909 = _2901 * 0.586610972881317138671875;
    bool _2911 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_49.x = _2907;
    float _2913 = fma(_2903, 0.298911988735198974609375, _2909);
    bool _2915 = _1531 > 0.0;
    bool _2917 = isnan(_1531);
    bool _2919 = _2915 || _2917;
    bool _2921 = isnan(0.0);
    bool _2923 = _2919 || _2921;
    float _2925 = fma(_2905, 0.114477999508380889892578125, _2913);
    bool _2927 = _1589 <= 0.0;
    bool _2929 = !_2923;
    bool _2931 = _2927 || _2929;
    float _2933 = -_2925;
    float _2935 = _2933 + _2903;
    float _2937 = -_2925;
    float _2939 = _2937 + _2901;
    float _2941 = -_2925;
    float _2943 = _2941 + _2905;
    float _2945 = fma(_2935, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2925);
    float _2947 = fma(_2939, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2925);
    float _2949 = fma(_2943, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2925);
    bool _2951 = !_2911;
    if (!_2951)
    {
        float _2953 = -_1461;
        float _2955 = _2953 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2957 = -_1463;
        float _2959 = _2957 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2961 = -_1465;
        float _2963 = _2961 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2965 = _2955 * _2955;
        float _2967 = fma(_2959, _2959, _2965);
        float _2969 = fma(_2963, _2963, _2967);
        float _2971 = sqrt(_2969);
        float _2973 = rsqrt(_2969);
        float _2975 = -_2971;
        float _2977 = _2975 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2979 = _2977 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2981 = precise::clamp(_2979, 0.0, 1.0);
        float _2983 = _2959 * _2973;
        float _2985 = _2955 * _2973;
        float _2987 = abs(_2981);
        float _2989 = log2(_2987);
        float _2991 = _2963 * _2973;
        float _2993 = _2983 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2995 = _2649 * _2985;
        float _2997 = -_2985;
        float _2999 = -_2993;
        float _3001 = fma(_2997, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2999);
        float _3003 = fma(_2737, _2983, _2995);
        float _3005 = -_2991;
        float _3007 = fma(_3005, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3001);
        float _3009 = fma(_2665, _2991, _3003);
        float _3011 = precise::clamp(_3009, 0.0, 1.0);
        float _3013 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3015 = _3007 + _3013;
        float _3017 = _2989 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3019 = _3015 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3021 = precise::clamp(_3019, 0.0, 1.0);
        float _3023 = exp2(_3017);
        float _3025 = _3023 * _3021;
        float _3027 = _3011 * _3025;
        float _3029 = _3027 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3031 = _3027 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3033 = _3027 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_88.x = _3029;
        out.m_88.y = _3031;
        out.m_88.z = _3033;
    }
    out.m_90.x = _2945;
    out.m_90.y = _2947;
    out.m_90.z = _2949;
    if (!_2931)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_49.x = 0.0;
    float _3035 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3035;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

