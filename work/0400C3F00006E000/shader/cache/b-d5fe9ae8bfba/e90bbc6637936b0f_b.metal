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
    constant _16* vp_c8 [[id(0)]];
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c9 [[id(2)]];
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
    float4 m_57 [[user(locn0)]];
    float4 m_66 [[user(locn1)]];
    float4 m_64 [[user(locn2)]];
    float4 m_70 [[user(locn3)]];
    float4 m_80 [[user(locn4)]];
    float4 m_49 [[user(locn5)]];
    float4 m_72 [[user(locn6)]];
    float4 m_78 [[user(locn7)]];
    float4 m_74 [[user(locn8)]];
    float4 m_76 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_68 [[attribute(0)]];
    float4 m_59 [[attribute(1)]];
    float4 m_46 [[attribute(2)]];
    float4 m_51 [[attribute(3)]];
    float4 m_53 [[attribute(4)]];
    float4 m_55 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2206 = false;
    bool _605 = false;
    bool _417 = false;
    bool _177 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _94 = in.m_46.w;
    float _96 = trunc(_94);
    int _99 = int(_96);
    bool _103 = _99 >= 1;
    float _105 = 0.0;
    if (!_103)
    {
        _105 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _107 = _105;
    if (!_103)
    {
        out.m_49.x = 0.0;
    }
    int _109 = 0;
    if (!_103)
    {
        float _111 = _107 * 5.0;
        _109 = as_type<int>(_111);
    }
    int _113 = _109;
    int _115 = _113;
    if (!_103)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2452 = as_type<float>(_113);
        out.gl_Position.z = _2452;
    }
    if (!_103)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _117 = in.m_51.w;
    bool _119 = _117 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _121 = isnan(_117);
    bool _123 = _119 || _121;
    bool _125 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _127 = _123 || _125;
    float _129 = -_117;
    float _131 = _129 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _133 = 0.0;
    float _135 = _131;
    if (_127)
    {
        float _137 = float(_99);
        _133 = _137;
    }
    float _139 = _133;
    bool _141 = _131 >= _139;
    bool _143 = !_127;
    bool _145 = _141 || _143;
    float _147 = 0.0;
    if (_145)
    {
        _147 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _149 = _147;
    if (_145)
    {
        out.m_49.x = 0.0;
    }
    if (_145)
    {
        float _151 = _149 * 5.0;
        _115 = as_type<int>(_151);
    }
    int _153 = _115;
    if (_145)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2521 = as_type<float>(_153);
        out.gl_Position.z = _2521;
    }
    if (_145)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _155 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _157 = !_155;
    float _175;
    if (!_157)
    {
        float _159 = in.m_53.x;
        float _161 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _163 = _159 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _165 = fma(_163, (*spvDescriptorSet0.vp_c9)._m0[12].x, _131);
        float _167 = _165 * _161;
        float _169 = floor(_167);
        float _171 = -_169;
        float _173 = _167 + _171;
        _175 = _173;
        _177 = true;
    }
    else
    {
        float _179 = float(_99);
        float _181 = 1.0 / _179;
        float _183 = _131 * _181;
        _175 = _183;
    }
    _177 = false;
    float _185 = _175;
    float _187 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _189 = _185 + _187;
    float _191 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _193 = _185 + _191;
    float _195 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _197 = _185 + _195;
    float _199 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _201 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _199;
    float _203 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _205 = _203 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _207 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _209 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _207;
    float _211 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _213 = _211 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _215 = 1.0 / _201;
    bool _217 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _219 = 1.0 / _209;
    float _221 = 1.0 / _205;
    float _223 = _193 * _215;
    float _225 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _227 = _185 + _225;
    float _229 = 1.0 / _213;
    float _231 = _189 * _219;
    bool _233 = _185 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _235 = isnan(_185);
    bool _237 = _233 || _235;
    bool _239 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _241 = _237 || _239;
    float _243 = float(_241);
    float _245 = -_243;
    float _247 = _245 + 1.0;
    float _249 = _197 * _221;
    bool _251 = _185 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _253 = isnan(_185);
    bool _255 = _251 || _253;
    bool _257 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _259 = _255 || _257;
    float _261 = float(_259);
    bool _263 = _185 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _265 = isnan(_185);
    bool _267 = _263 || _265;
    bool _269 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _271 = _267 || _269;
    float _273 = float(_271);
    float _275 = _261 * _247;
    bool _277 = _185 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _279 = isnan(_185);
    bool _281 = _277 || _279;
    bool _283 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _285 = _281 || _283;
    float _287 = float(_285);
    float _289 = _227 * _229;
    float _291 = -_261;
    float _293 = _291 + 1.0;
    bool _295 = _185 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _297 = isnan(_185);
    bool _299 = _295 || _297;
    bool _301 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _303 = _299 || _301;
    float _305 = float(_303);
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _309 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _307;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _313 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _311;
    float _315 = _273 * _293;
    float _317 = -_273;
    float _319 = _317 + 1.0;
    float _321 = fma(_309, _223, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _323 = fma(_313, _223, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _327 = _325 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _329 = _287 * _319;
    float _331 = -_287;
    float _333 = _331 + 1.0;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _337 = _335 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _339 = -_305;
    float _341 = _339 + 1.0;
    float _343 = fma(_327, _249, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _345 = _305 * _333;
    float _347 = fma(_337, _249, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _351 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _349;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _355 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _353;
    float _357 = _321 * _345;
    float _359 = _323 * _345;
    float _361 = fma(_351, _231, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _363 = fma(_355, _231, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _365 = fma(_341, (*spvDescriptorSet0.vp_c9)._m0[143].x, _357);
    float _367 = fma(_341, (*spvDescriptorSet0.vp_c9)._m0[143].y, _359);
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _371 = _369 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _375 = _373 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _377 = fma(_347, _329, _365);
    float _379 = fma(_343, _329, _367);
    float _381 = fma(_371, _289, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _383 = fma(_375, _289, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _385 = fma(_361, _315, _377);
    float _387 = fma(_363, _315, _379);
    float _389 = fma(_381, _275, _385);
    float _391 = fma(_383, _275, _387);
    float _393 = fma(_243, (*spvDescriptorSet0.vp_c9)._m0[147].x, _389);
    float _395 = fma(_243, (*spvDescriptorSet0.vp_c9)._m0[147].y, _391);
    bool _397 = !_217;
    float _415;
    if (!_397)
    {
        float _399 = in.m_53.x;
        float _401 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _403 = _399 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _405 = fma(_403, (*spvDescriptorSet0.vp_c9)._m0[11].y, _131);
        float _407 = _405 * _401;
        float _409 = floor(_407);
        float _411 = -_409;
        float _413 = _407 + _411;
        _415 = _413;
        _417 = true;
    }
    else
    {
        float _419 = float(_99);
        float _421 = 1.0 / _419;
        float _423 = _131 * _421;
        _415 = _423;
    }
    _417 = false;
    float _425 = _415;
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _429 = _425 + _427;
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _433 = _431 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _437 = _435 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _439 = _425 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _441 = isnan(_425);
    bool _443 = _439 || _441;
    bool _445 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _447 = _443 || _445;
    float _449 = float(_447);
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _453 = _451 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _455 = _425 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _457 = isnan(_425);
    bool _459 = _455 || _457;
    bool _461 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _463 = _459 || _461;
    float _465 = float(_463);
    float _467 = 1.0 / _433;
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _471 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _469;
    float _473 = -_449;
    float _475 = _473 + 1.0;
    bool _477 = _425 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _479 = isnan(_425);
    bool _481 = _477 || _479;
    bool _483 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _485 = _481 || _483;
    float _487 = float(_485);
    bool _489 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _491 = 1.0 / _437;
    float _493 = 1.0 / _453;
    float _495 = _471 * _467;
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _499 = _497 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _501 = _465 * _475;
    float _503 = -_465;
    float _505 = _503 + 1.0;
    float _507 = fma(_495, _429, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _511 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _509;
    float _513 = _487 * _505;
    float _515 = _499 * _491;
    float _517 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _519 = _425 + _517;
    bool _521 = _425 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _523 = isnan(_425);
    bool _525 = _521 || _523;
    bool _527 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _529 = _525 || _527;
    float _531 = float(_529);
    float _533 = _507 * _513;
    float _535 = -_487;
    float _537 = _535 + 1.0;
    float _539 = fma(_515, _519, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _543 = _425 + _541;
    float _545 = _511 * _493;
    float _547 = -_531;
    float _549 = _547 + 1.0;
    float _551 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[115].x, _533);
    float _553 = fma(_545, _543, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _555 = _449 * _549;
    float _557 = fma(_539, _501, _551);
    float _559 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _561 = in.m_55.x;
    float _563 = in.m_55.y;
    float _565 = fma(_553, _555, _557);
    float _567 = _559 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _569 = fma(_531, (*spvDescriptorSet0.vp_c9)._m0[118].x, _565);
    float _571 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _573 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _575 = _569 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _577 = _571 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _579 = _573 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_57.x = _567;
    out.m_57.y = _577;
    out.m_57.z = _579;
    out.m_57.w = _575;
    float _581 = _395 * _563;
    float _583 = _393 * _561;
    bool _585 = !_489;
    float _603;
    if (!_585)
    {
        float _587 = in.m_53.x;
        float _589 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _591 = _587 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _593 = fma(_591, (*spvDescriptorSet0.vp_c9)._m0[11].w, _131);
        float _595 = _593 * _589;
        float _597 = floor(_595);
        float _599 = -_597;
        float _601 = _595 + _599;
        _603 = _601;
        _605 = true;
    }
    else
    {
        float _607 = float(_99);
        float _609 = 1.0 / _607;
        float _611 = _131 * _609;
        _603 = _611;
    }
    _605 = false;
    float _613 = _603;
    float _615 = in.m_53.x;
    float _617 = in.m_53.y;
    float _619 = in.m_53.z;
    float _621 = in.m_53.w;
    float _623 = _583 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _625 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _627 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _629 = _627 != 0;
    int _631 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _633 = _631 != 0;
    int _635 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _637 = _635 != 0;
    float _639 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _641 = !_633;
    int _643 = _641 ? 0 : 1;
    int _645 = abs(_643);
    float _647 = _619 * 2.0;
    float _649 = _615 * 2.0;
    float _651 = _615 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _653 = _617 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _655 = floor(_647);
    float _657 = _617 * 2.0;
    float _659 = -_625;
    float _661 = fma(_651, 2.0, _659);
    float _663 = _617 + _615;
    bool _665 = !_629;
    int _667 = _665 ? 0 : 1;
    float _669 = fma(_653, -2.0, _639);
    float _671 = -_131;
    float _673 = fma(_671, (*spvDescriptorSet0.vp_c9)._m0[76].x, _661);
    float _675 = _663 + (-1.0);
    float _677 = floor(_649);
    float _679 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[76].y, _669);
    float _681 = fma(_675, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _683 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _685 = log2(_683);
    bool _687 = _655 > 0.0;
    bool _689 = _655 >= 0.0;
    bool _691 = isnan(_655);
    bool _693 = _689 || _691;
    bool _695 = isnan(0.0);
    bool _697 = _693 || _695;
    int _699 = abs(_667);
    int _701 = _697 ? 0 : 1;
    float _703 = floor(_657);
    bool _705 = _677 > 0.0;
    bool _707 = _677 >= 0.0;
    bool _709 = isnan(_677);
    bool _711 = _707 || _709;
    bool _713 = isnan(0.0);
    bool _715 = _711 || _713;
    int _717 = ~_701;
    int _719 = _717 + 1;
    int _721 = _719 + 1;
    float _723 = _685 * _131;
    int _725 = _721;
    if (!_687)
    {
        int _727 = ~_701;
        int _729 = _727 + 1;
        _725 = _729;
    }
    int _731 = _725;
    int _733 = _715 ? 0 : 1;
    float _735 = float(_699);
    float _737 = exp2(_723);
    float _739 = float(_731);
    int _741 = ~_733;
    int _743 = _741 + 1;
    int _745 = _743 + 1;
    int _747 = _745;
    if (!_705)
    {
        int _749 = ~_733;
        int _751 = _749 + 1;
        _747 = _751;
    }
    int _753 = _747;
    float _755 = _735 * _739;
    bool _757 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _759 = isnan(1.0);
    bool _761 = _757 || _759;
    bool _763 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _765 = _761 || _763;
    float _767 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _769 = 1.0 + _767;
    float _771 = in.m_59.x;
    float _773 = in.m_59.y;
    float _775 = in.m_59.z;
    float _777 = _755 * (-2.0);
    bool _779 = _703 > 0.0;
    float _781 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _783 = 1.0 / _769;
    float _785 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _787 = _703 >= 0.0;
    bool _789 = isnan(_703);
    bool _791 = _787 || _789;
    bool _793 = isnan(0.0);
    bool _795 = _791 || _793;
    float _797 = fma(_615, (*spvDescriptorSet0.vp_c9)._m0[78].z, _781);
    bool _799 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _801 = isnan(0.0);
    bool _803 = _799 || _801;
    bool _805 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _807 = _803 || _805;
    float _809 = fma(_617, (*spvDescriptorSet0.vp_c9)._m0[78].w, _785);
    float _811 = -_737;
    float _813 = _811 + 1.0;
    int _815 = _795 ? 0 : 1;
    float _817 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].z, _797);
    float _819 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].w, _809);
    float _821 = _807 ? _813 : 0.0;
    int _823 = ~_815;
    int _825 = _823 + 1;
    int _827 = _825 + 1;
    int _829 = _827;
    if (!_779)
    {
        int _831 = ~_815;
        int _833 = _831 + 1;
        _829 = _833;
    }
    int _835 = _829;
    if (_765)
    {
        float _837 = _821 * _783;
        _135 = _837;
    }
    float _839 = _135;
    float _841 = float(_645);
    float _843 = _615 + (-0.5);
    float _845 = float(_753);
    bool _847 = !_637;
    int _849 = _847 ? 0 : 1;
    float _851 = float(_835);
    float _853 = _841 * _845;
    int _855 = abs(_849);
    float _857 = fma(_777, _771, _771);
    float _859 = _617 + _619;
    float _861 = fma(_681, _777, _681);
    float _863 = fma(_843, (*spvDescriptorSet0.vp_c9)._m0[196].x, _857);
    float _865 = _859 + (-1.0);
    float _867 = float(_855);
    float _869 = _853 * (-2.0);
    float _871 = fma(_861, _839, _863);
    float _873 = fma(_865, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _875 = _867 * _851;
    float _877 = _871 * 0.15915493667125701904296875;
    float _879 = _617 + (-0.5);
    float _881 = fma(_869, _773, _773);
    float _883 = fma(_873, _869, _873);
    float _885 = _619 + _615;
    float _887 = as_type<float>(int(gl_VertexIndex));
    float _889 = fma(_879, (*spvDescriptorSet0.vp_c9)._m0[196].y, _881);
    float _891 = _875 * (-2.0);
    float _893 = _885 + (-1.0);
    float _895 = _877 * 6.283185482025146484375;
    float _897 = cos(_895);
    float _899 = fma(_883, _839, _889);
    float _901 = fma(_891, _775, _775);
    float _903 = fma(_893, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _905 = _619 + (-0.5);
    float _907 = _899 * 0.15915493667125701904296875;
    float _909 = fma(_903, _891, _903);
    float _911 = fma(_905, (*spvDescriptorSet0.vp_c9)._m0[196].z, _901);
    float _913 = _907 * 6.283185482025146484375;
    float _915 = sin(_913);
    float _917 = _581 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _919 = fma(_909, _839, _911);
    float _921 = in.m_46.x;
    float _923 = in.m_46.y;
    float _925 = in.m_46.z;
    float _927 = _919 * 0.15915493667125701904296875;
    float _929 = _907 * 6.283185482025146484375;
    float _931 = cos(_929);
    int _933 = as_type<int>(_887) & 1;
    bool _935 = _933 != 0;
    int _937 = as_type<int>(_887) & 2;
    bool _939 = _937 != 0;
    float _941 = _877 * 6.283185482025146484375;
    float _943 = sin(_941);
    bool _945 = !_939;
    float _947 = _945 ? (-0.5) : 0.5;
    float _949 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    bool _951 = !_935;
    float _953 = _951 ? (-0.5) : 0.5;
    bool _955 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _957 = isnan(0.5);
    bool _959 = _955 || _957;
    bool _961 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _963 = _959 || _961;
    float _965 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _947);
    float _967 = _927 * 6.283185482025146484375;
    float _969 = cos(_967);
    float _971 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _953);
    float _973 = _917 * _965;
    float _975 = _897 * _931;
    float _977 = _897 * _915;
    float _979 = _623 * _971;
    float _981 = _927 * 6.283185482025146484375;
    float _983 = sin(_981);
    float _985 = _943 * _915;
    float _987 = _943 * _931;
    float _989 = _897 * _969;
    float _991 = _943 * _969;
    float _993 = _931 * _969;
    float _995 = _915 * _969;
    float _997 = _989 * _973;
    float _999 = _991 * _973;
    float _1001 = fma(_983, _975, _985);
    float _1003 = -_977;
    float _1005 = fma(_983, _987, _1003);
    float _1007 = -_987;
    float _1009 = fma(_983, _977, _1007);
    float _1011 = -_973;
    float _1013 = _983 * _1011;
    float _1015 = fma(_1001, _979, _997);
    float _1017 = fma(_983, _985, _975);
    float _1019 = fma(_1005, _979, _999);
    float _1021 = fma(_993, _979, _1013);
    float _1023 = fma(_1009, _949, _1015);
    float _1025 = _923 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1027 = fma(_995, _949, _1021);
    float _1029 = _1023 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1031 = fma(_1017, _949, _1019);
    float _1033 = _923 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1035 = fma(_921, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1025);
    float _1037 = _1023 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1039 = fma(_1027, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1029);
    float _1041 = fma(_921, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1033);
    float _1043 = fma(_925, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1035);
    float _1045 = fma(_1027, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1037);
    float _1047 = fma(_1031, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1039);
    float _1049 = fma(_925, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1041);
    float _1051 = _1043 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1053 = fma(_1031, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1045);
    float _1055 = _1047 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1057 = _1049 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1059 = _923 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1061 = _1053 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1063 = _1051 + _1055;
    float _1065 = fma(_921, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1059);
    float _1067 = _1057 + _1061;
    float _1069 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1071 = _1063 + _1069;
    float _1073 = fma(_925, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1065);
    float _1075 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1077 = _1067 + _1075;
    float _1079 = _1071 * _1071;
    float _1081 = _1073 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1083 = fma(_1077, _1077, _1079);
    float _1085 = _1023 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1087 = sqrt(_1083);
    float _1089 = fma(_1027, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1085);
    float _1091 = fma(_1031, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1089);
    float _1093 = _1091 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1095 = _1081 + _1093;
    bool _1097 = _1087 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1099 = _861;
    float _1101 = _1063;
    float _1103 = _1067;
    float _1105 = _1023;
    float _1107 = _1029;
    if (!_1097)
    {
        _1099 = _1095;
    }
    float _1109 = _1099;
    bool _1111 = !_1097;
    float _1113 = _1109;
    if (!_1111)
    {
        float _1115 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1117 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1119 = _1087 + _1117;
        float _1121 = _1095 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1123 = rsqrt(_1083);
        float _1125 = _1119 * _1115;
        float _1127 = _1125 * 0.15915493667125701904296875;
        float _1129 = _1127 * 6.283185482025146484375;
        float _1131 = cos(_1129);
        float _1133 = _1127 * 6.283185482025146484375;
        float _1135 = sin(_1133);
        float _1137 = _1131 + (-1.0);
        float _1139 = _1137 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1141 = fma(_1135, _1121, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1143 = fma(_1095, _1131, _1139);
        float _1145 = _1123 * _1141;
        float _1147 = fma(_1077, _1145, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1149 = fma(_1071, _1145, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1113 = _1143;
        _1101 = _1149;
        _1103 = _1147;
    }
    float _1151 = _1113;
    float _1153 = _1101;
    float _1155 = _1103;
    float _1157 = _1151;
    float _1159 = _1155;
    float _1161 = _1153;
    if (!_963)
    {
        float _1163 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1165 = _1081 + _1163;
        float _1167 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1169 = _1057 + _1167;
        float _1171 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1173 = -_1081;
        float _1175 = _1173 + _1151;
        float _1177 = _1165 * _1165;
        float _1179 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1181 = _1051 + _1179;
        float _1183 = -_1051;
        float _1185 = _1183 + _1153;
        float _1187 = fma(_1169, _1169, _1177);
        float _1189 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1191 = fma(_1181, _1181, _1187);
        float _1193 = sqrt(_1191);
        float _1195 = _1171 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1197 = precise::min(_1193, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1199 = _1197 * _1189;
        float _1201 = -_1057;
        float _1203 = _1201 + _1155;
        float _1205 = _1195 * _1199;
        float _1207 = fma(_1203, _1205, _1057);
        float _1209 = fma(_1175, _1205, _1081);
        float _1211 = fma(_1185, _1205, _1051);
        _1157 = _1209;
        _1159 = _1207;
        _1161 = _1211;
    }
    float _1213 = _1157;
    float _1215 = _1159;
    float _1217 = _1161;
    float _1219 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1221 = _1213 + _1219;
    float _1223 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1225 = _1215 + _1223;
    float _1227 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1229 = _1217 + _1227;
    float _1231 = _1213 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1233 = _1221 * _1221;
    float _1235 = fma(_1215, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1231);
    float _1237 = fma(_1225, _1225, _1233);
    float _1239 = fma(_1217, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1235);
    float _1241 = fma(_1229, _1229, _1237);
    float _1243 = _1239 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1245 = rsqrt(_1241);
    float _1247 = sqrt(_1241);
    float _1249 = _1245 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1251 = _1225 * _1249;
    float _1253 = _1229 * _1249;
    float _1255 = _1251 * _1251;
    float _1257 = _1253 * _1253;
    float _1259 = _1255 + _1257;
    float _1261 = sqrt(_1259);
    bool _1263 = _1261 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1265 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1267 = _1261 + _1265;
    float _1269 = _1245;
    float _1271 = _1259;
    float _1273 = _1267;
    float _1275 = _1221;
    if (_1263)
    {
        float _1277 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1269 = _1277;
    }
    float _1279 = _1269;
    if (_1263)
    {
        float _1281 = rsqrt(_1259);
        _1271 = _1281;
    }
    float _1283 = _1271;
    float _1285 = _1283;
    if (_1263)
    {
        float _1287 = _1267 * _1279;
        _1273 = _1287;
    }
    float _1289 = _1273;
    if (_1263)
    {
        float _1291 = _1289 * 0.15915493667125701904296875;
        _1105 = _1291;
    }
    float _1293 = _1105;
    float _1295 = _1229;
    float _1297 = _1293;
    if (_1263)
    {
        float _1299 = _1293 * 6.283185482025146484375;
        float _1301 = sin(_1299);
        _1295 = _1301;
    }
    float _1303 = _1295;
    float _1305 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1307 = precise::max(0.0, _1305);
    float _1309 = _1279;
    float _1311 = _1307;
    if (_1263)
    {
        float _1313 = _1293 * 6.283185482025146484375;
        float _1315 = cos(_1313);
        _1309 = _1315;
    }
    float _1317 = _1309;
    float _1319 = -_1249;
    float _1321 = -_1307;
    float _1323 = fma(_1221, _1319, _1321);
    float _1325 = _1323;
    if (_1263)
    {
        float _1327 = _1323 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1275 = _1327;
    }
    float _1329 = _1275;
    float _1331 = _1329;
    if (!_1263)
    {
        _1297 = _1257;
    }
    float _1333 = _1297;
    float _1335 = _1303;
    float _1337 = _1333;
    if (_1263)
    {
        float _1339 = fma(_1303, _1329, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1331 = _1339;
    }
    float _1341 = _1331;
    if (!_1263)
    {
        _1335 = _1251;
    }
    float _1343 = _1335;
    float _1345 = _1343;
    float _1347 = _1317;
    if (_1263)
    {
        float _1349 = _1317 + (-1.0);
        _1311 = _1349;
    }
    float _1351 = _1311;
    float _1353 = _1351;
    if (_1263)
    {
        float _1355 = _1283 * _1341;
        _1107 = _1355;
    }
    float _1357 = _1107;
    if (!_1263)
    {
        _1285 = _1255;
    }
    float _1359 = _1285;
    float _1361 = _1359;
    if (_1263)
    {
        float _1363 = _1351 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1353 = _1363;
    }
    float _1365 = _1353;
    if (_1263)
    {
        float _1367 = _1251 * _1357;
        _1345 = _1367;
    }
    float _1369 = _1345;
    float _1371 = _1213 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1263)
    {
        float _1373 = fma(_1323, _1317, _1365);
        _1325 = _1373;
    }
    float _1375 = _1325;
    if (!_1263)
    {
        _1347 = _1253;
    }
    float _1377 = _1347;
    float _1379 = _1377;
    if (_1263)
    {
        float _1381 = _1253 * _1357;
        _1379 = _1381;
    }
    float _1383 = _1379;
    if (_1263)
    {
        float _1385 = _1369 * _1369;
        _1361 = _1385;
    }
    float _1387 = _1361;
    float _1389 = _1213 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1391 = fma(_1215, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1371);
    if (_1263)
    {
        float _1393 = _1383 * _1383;
        _1337 = _1393;
    }
    float _1395 = _1337;
    float _1397 = fma(_1375, _1375, _1387);
    float _1399 = fma(_1215, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1389);
    float _1401 = fma(_1217, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1391);
    float _1403 = _1397 + _1395;
    float _1405 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1407 = fma(_1247, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1405);
    float _1409 = precise::clamp(_1407, 0.0, 1.0);
    float _1411 = fma(_1057, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1413 = rsqrt(_1403);
    float _1415 = _1401 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1417 = -_1409;
    float _1419 = _1417 + 1.0;
    float _1421 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1423 = _1415 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1425 = abs(_1419);
    float _1427 = log2(_1425);
    float _1429 = _1213 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1431 = fma(_1051, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1433 = -_1423;
    float _1435 = fma(_1433, _1421, 1.0);
    float _1437 = fma(_1215, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1429);
    float _1439 = _1413 * _1369;
    float _1441 = fma(_1217, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1399);
    float _1443 = _1413 * _1375;
    float _1445 = fma(_1217, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1437);
    float _1447 = _1439 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1449 = _1441 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1451 = floor(_1411);
    float _1453 = _1413 * _1383;
    float _1455 = -_1447;
    float _1457 = fma(_1443, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1455);
    float _1459 = _1445 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1461 = _1449 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1463 = _1427 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1465 = -_1453;
    float _1467 = fma(_1465, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1457);
    float _1469 = floor(_1431);
    float _1471 = fma(_1459, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1461);
    float _1473 = fma(_1467, -0.5, 0.5);
    float _1475 = fma(_1467, 0.5, 0.5);
    float _1477 = fma(_1415, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1471);
    float _1479 = -_1451;
    float _1481 = _1411 + _1479;
    float _1483 = fma(_1243, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1477);
    float _1485 = exp2(_1463);
    float _1487 = _1449 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1489 = _1449 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1491 = -_1469;
    float _1493 = _1431 + _1491;
    float _1495 = fma(_1459, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1489);
    float _1497 = log2(_1435);
    float _1499 = fma(_1475, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1501 = fma(_1459, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1487);
    float _1503 = fma(_1415, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1495);
    float _1505 = fma(_1475, _1499, -0.212114393711090087890625);
    float _1507 = fma(_1415, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1501);
    float _1509 = fma(_1243, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1503);
    float _1511 = 1.0 / _1483;
    float _1513 = sqrt(_1473);
    float _1515 = fma(_1243, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1507);
    float2 _4682 = float2(_1481, _1493);
    float _1517 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4682, float2(0.0), isnan(_4682)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4682, float2(0.0), isnan(_4682)), level(0.0)).x;
    float _1519 = fma(_1475, _1505, 1.570728778839111328125);
    float _1521 = _1515 * _1511;
    float _1523 = _1443 + 1.0;
    float _1525 = fma(_1521, 0.5, 0.5);
    float _1527 = -_1443;
    float _1529 = fma(_1485, _1523, _1527);
    float _1531 = _1497 * 0.693147182464599609375;
    float _1533 = _1509 * _1511;
    float _1535 = _1513 * 0.636619746685028076171875;
    float _1537 = fma(_1529, 0.5, 0.5);
    float _1539 = _1531 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1541 = fma(_1533, -0.5, 0.5);
    float _1543 = -_1519;
    float _1545 = fma(_1535, _1543, 1.0);
    float3 _4732 = float3(_1525, _1541, _1539);
    float _1547 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4732, float3(0.0), isnan(_4732)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4732, float3(0.0), isnan(_4732)), level(0.0)).x;
    float3 _4743 = float3(_1525, _1541, _1539);
    float4 _1550 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4743, float3(0.0), isnan(_4743)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4743, float3(0.0), isnan(_4743)), level(0.0)).xyzw;
    float _1552 = _1550.x;
    float _1554 = _1550.y;
    float _1556 = _1550.z;
    float _1558 = _1550.w;
    float2 _4759 = float2(_1545, _1537);
    float3 _1562 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4759, float2(0.0), isnan(_4759)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4759, float2(0.0), isnan(_4759)), level(0.0)).xyz;
    float _1564 = _1562.x;
    float _1566 = _1562.y;
    float _1568 = _1562.z;
    float _1570 = _1081 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1572 = -_817;
    float _1574 = _1572 + 1.0;
    bool _1576 = _621 > 0.5;
    float _1578 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1580 = _1578 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1582 = _615 > 0.5;
    float _1584 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1586 = _1584 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1588 = _1081 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1590 = 1.0 / _1580;
    bool _1592 = _617 > 0.5;
    float _1594 = fma(_1057, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1588);
    float _1596 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1598 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1596;
    float _1600 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1602 = _1600 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    int _1604 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1606 = _1604 != 0;
    float _1608 = fma(_1057, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1570);
    float _1610 = 1.0 / _1586;
    int _1612 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1614 = _1612 != 0;
    float _1616 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1618 = _1616 + (*spvDescriptorSet0.vp_c9)._m0[135].w;
    int _1620 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1622 = _1620 != 0;
    float _1624 = fma(_1051, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1608);
    int _1626 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1628 = _1626 != 0;
    float _1630 = fma(_1051, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1594);
    float _1632 = -_953;
    int _1634 = _1582 ? as_type<int>(_1632) : as_type<int>(_953);
    float _1636 = _1602 * _1590;
    float _1638 = 1.0 / _1618;
    bool _1640 = _613 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1642 = isnan(_613);
    bool _1644 = _1640 || _1642;
    bool _1646 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1648 = _1644 || _1646;
    float _1650 = float(_1648);
    float _1652 = -_819;
    float _1654 = _1652 + 1.0;
    bool _1656 = !_1606;
    float _1658 = _1656 ? _953 : as_type<float>(_1634);
    float _1660 = _1427 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1662 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1664 = isnan(0.5);
    bool _1666 = _1662 || _1664;
    bool _1668 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1670 = _1666 || _1668;
    float _1672 = _1598 * _1610;
    float _1674 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1676 = _1674 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1678 = _613 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1680 = isnan(_613);
    bool _1682 = _1678 || _1680;
    bool _1684 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1686 = _1682 || _1684;
    float _1688 = float(_1686);
    float _1690 = -_1650;
    float _1692 = _1690 + 1.0;
    bool _1694 = _613 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1696 = isnan(_613);
    bool _1698 = _1694 || _1696;
    bool _1700 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1702 = _1698 || _1700;
    float _1704 = float(_1702);
    float _1706 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1708 = _1688 * _1692;
    float _1710 = -_1688;
    float _1712 = _1710 + 1.0;
    float _1714 = _1624 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1716 = -_1704;
    float _1718 = _1716 + 1.0;
    bool _1720 = _619 > 0.5;
    float _1722 = _1704 * _1712;
    float _1724 = -(*spvDescriptorSet0.vp_c9)._m0[134].x;
    float _1726 = _1724 + (*spvDescriptorSet0.vp_c9)._m0[135].x;
    float _1728 = 1.0 / _1714;
    bool _1730 = _613 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1732 = isnan(_613);
    bool _1734 = _1730 || _1732;
    bool _1736 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1738 = _1734 || _1736;
    float _1740 = float(_1738);
    float _1742 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1744 = _613 + _1742;
    float _1746 = _1726 * _1638;
    float _1748 = _1630 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1750 = _613 >= (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _1752 = isnan(_613);
    bool _1754 = _1750 || _1752;
    bool _1756 = isnan((*spvDescriptorSet0.vp_c9)._m0[135].w);
    bool _1758 = _1754 || _1756;
    float _1760 = float(_1758);
    float _1762 = fma(_1672, _1744, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1764 = _1740 * _1718;
    float _1766 = 1.0 / _1676;
    float _1768 = _1748 + _1714;
    float _1770 = -_1760;
    float _1772 = _1770 + 1.0;
    float _1774 = _1762 * _1764;
    float _1776 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1778 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1776;
    float _1780 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1782 = _613 + _1780;
    float _1784 = _1650 * _1772;
    float _1786 = -_1740;
    float _1788 = _1786 + 1.0;
    float _1790 = _1768 * _1728;
    float _1792 = _1790 * 0.5;
    float _1794 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1796 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1798 = _613 + _1796;
    float _1800 = fma(_1636, _1782, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1802 = fma(_1788, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1774);
    float _1804 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1806 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1804);
    float _1808 = -_947;
    int _1810 = _1592 ? as_type<int>(_1808) : as_type<int>(_947);
    float _1812 = _1778 * _1766;
    float _1814 = fma(_1800, _1722, _1802);
    float _1816 = _1706 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1818 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1820 = fma(_1812, _1798, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1822 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1824 = _613 + _1822;
    float _1826 = -_953;
    int _1828 = _1720 ? as_type<int>(_1826) : as_type<int>(_953);
    float _1830 = _1449 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1832 = fma(_1820, _1708, _1814);
    bool _1834 = !_1614;
    float _1836 = _1834 ? _947 : as_type<float>(_1810);
    float _1838 = fma(_1746, _1824, (*spvDescriptorSet0.vp_c9)._m0[134].x);
    float _1840 = 1.0 / _1806;
    float _1842 = _1794 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1844 = _1658 + 0.5;
    float _1846 = _1836 + (-0.5);
    float _1848 = fma(_1838, _1784, _1832);
    bool _1850 = !_1622;
    float _1852 = _1850 ? _953 : as_type<float>(_1828);
    float _1854 = fma(_1842, _1844, _673);
    float _1856 = -_1816;
    float _1858 = -_679;
    float _1860 = fma(_1856, _1846, _1858);
    float _1862 = fma(_1760, (*spvDescriptorSet0.vp_c9)._m0[135].x, _1848);
    float _1864 = -_947;
    int _1866 = _1576 ? as_type<int>(_1864) : as_type<int>(_947);
    float _1868 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1870 = -_1574;
    float _1872 = fma(_1658, _1870, _1854);
    float _1874 = _1852 + 0.5;
    bool _1876 = !_1628;
    float _1878 = _1876 ? _947 : as_type<float>(_1866);
    float _1880 = fma(_1836, _1654, _1860);
    float _1882 = _1654;
    float _1884 = _1862;
    float _1886 = _1509;
    float _1888 = _1515;
    if (!_1670)
    {
        _1882 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _1890 = _1882;
    float _1892 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1894 = _1840 * _1892;
    float _1896 = _1874 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1898 = -_1878;
    float _1900 = _1898 + 0.5;
    float _1902 = abs(_1894);
    float _1904 = log2(_1902);
    float _1906 = _1896 * _1818;
    float _1908 = _1900 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1910 = _1890;
    if (!_1670)
    {
        float _1912 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1914 = _1890 + _1912;
        _1910 = _1914;
    }
    float _1916 = _1910;
    float _1918 = _989 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1920 = _1908 * _1868;
    float _1922 = as_type<float>(_1810);
    float _1924 = _1916;
    if (!_1670)
    {
        float _1926 = 1.0 / _1916;
        _1922 = _1926;
    }
    float _1928 = _1922;
    float _1930 = _989 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1932 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1934 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1936 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    out.m_64.x = _1872;
    out.m_64.y = _1880;
    out.m_64.z = _1906;
    out.m_64.w = _1920;
    float _1938 = _989 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1940 = -_983;
    float _1942 = fma(_1940, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1918);
    float _1944 = _1904 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    if (!_1670)
    {
        float _1946 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1948 = _1894 + _1946;
        _1924 = _1948;
    }
    float _1950 = _1924;
    float _1952 = _1862 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    if (_1670)
    {
        _1884 = 1.0;
    }
    float _1954 = _1884;
    float _1956 = _1932 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1958 = _1936 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1960 = exp2(_1944);
    float _1962 = _1934 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1964 = _1954;
    if (!_1670)
    {
        float _1966 = _1950 * _1928;
        float _1968 = precise::clamp(_1966, 0.0, 1.0);
        _1964 = _1968;
    }
    float _1970 = _1964;
    float _1972 = -_983;
    float _1974 = fma(_1972, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1930);
    float _1976 = _1001 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1978 = -_983;
    float _1980 = fma(_1978, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1938);
    float _1982 = fma(_991, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1942);
    float _1984 = fma(_991, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1974);
    float _1986 = fma(_993, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1976);
    float _1988 = _1009 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1990 = _947 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1992 = fma(_991, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1980);
    out.m_66.x = _1956;
    out.m_66.y = _1958;
    out.m_66.z = _1962;
    out.m_66.w = _1952;
    float _1994 = _1990 * _1982;
    float _1996 = fma(_1960, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1998 = precise::clamp(_1996, 0.0, 1.0);
    float _2000 = exp2(_1660);
    float _2002 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1986);
    float _2004 = fma(_1459, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1830);
    bool _2006 = _1894 <= 8000.0;
    bool _2008 = isnan(_1894);
    bool _2010 = _2006 || _2008;
    bool _2012 = isnan(8000.0);
    bool _2014 = _2010 || _2012;
    float _2016 = float(_2014);
    float _2018 = _953 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2020 = _1009 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2022 = fma(_1415, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2004);
    float _2024 = _1009 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2026 = fma(_2018, _2002, _1994);
    bool _2028 = _1247 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2030 = isnan(_1247);
    bool _2032 = _2028 || _2030;
    bool _2034 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2036 = _2032 || _2034;
    float _2038 = fma(_1243, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2022);
    float _2040 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1988);
    float _2042 = _1990 * _1984;
    float _2044 = _1001 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2046 = _1001 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2048 = _1990 * _1992;
    float _2050 = fma(_1998, -2.0, 3.0);
    float _2052 = _1998 * _1998;
    float _2054 = fma(_993, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2044);
    float _2056 = fma(_993, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2046);
    float _2058 = -_2000;
    float _2060 = _2058 + 1.0;
    float _2062 = _2052 * _2050;
    float _2064 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2054);
    float _2066 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2056);
    float _2068 = fma(_1017, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2040);
    float _2070 = -_2062;
    float _2072 = _2070 + 1.0;
    float _2074 = in.m_68.x;
    float _2076 = _2038 + _1483;
    float _2078 = _2060 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2080 = fma(_2072, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2062);
    float _2082 = fma(_2018, _2064, _2042);
    float _2084 = _2076 * 0.5;
    float _2086 = _2016 * _2080;
    float _2088 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2020);
    float _2090 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2024);
    float _2092 = _2086 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2094 = fma(_2018, _2066, _2048);
    out.m_70.z = _2084;
    out.m_70.w = _1483;
    float _2096 = fma(_1017, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2090);
    float _2098 = fma(_1017, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2088);
    float _2100 = _2068 + _2026;
    float _2102 = _2096 + _2094;
    float _2104 = _2098 + _2082;
    out.gl_Position.x = _1515;
    out.gl_Position.y = _1509;
    out.gl_Position.z = _2038;
    out.gl_Position.w = _1483;
    out.m_72.x = _2100;
    out.m_72.y = _2104;
    out.m_72.z = _2102;
    float _2106 = _2038;
    if (!_2036)
    {
        _2106 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2108 = _2106;
    float _2110 = _2108;
    float _2112 = _2108;
    if (!_2036)
    {
        _1886 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2114 = _1886;
    float _2116 = _2114;
    float _2118 = _2114;
    if (!_2036)
    {
        _1888 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2120 = _1888;
    float _2122 = -_1517;
    float _2124 = _2122 + 1.0;
    float _2126 = _2124 * _2092;
    float _2128 = precise::clamp(_2126, 0.0, 1.0);
    float _2130 = -_2128;
    float _2132 = fma(_2130, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2134 = _1970 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2136 = _2132 * _2074;
    float _2138 = _2136 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2140 = _2078 * _1547;
    float _2142 = -_2078;
    float _2144 = _2142 + 1.0;
    out.m_74.x = _2138;
    float _2146 = _1558 * _2140;
    float _2148 = _1568 * _2140;
    float _2150 = _1558 * _2144;
    float _2152 = fma(_1564, _2146, _1552);
    float _2154 = fma(_1566, _2146, _1554);
    float _2156 = fma(_1558, _2148, _1556);
    out.m_76.x = _2152;
    out.m_76.y = _2154;
    out.m_76.z = _2156;
    out.m_76.w = _2150;
    bool _2158 = !_2036;
    float _2160 = _2120;
    float _2162 = _2120;
    if (!_2158)
    {
        bool _2164 = _1247 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2166 = isnan(_1247);
        bool _2168 = _2164 || _2166;
        bool _2170 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2172 = _2168 || _2170;
        if (!_2172)
        {
            float _2174 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2176 = _1247 + _2174;
            float _2178 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2180 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2178;
            float _2182 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2184 = _2182 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2186 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2188 = _2186 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2190 = 1.0 / _2180;
            float _2192 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2194 = _2192 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2196 = _2176 * _2190;
            float _2198 = precise::clamp(_2196, 0.0, 1.0);
            float _2200 = fma(_2198, _2184, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2202 = fma(_2198, _2188, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2204 = fma(_2198, _2194, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _2118 = _2202;
            _2112 = _2200;
            _2162 = _2204;
            _2206 = true;
        }
        else
        {
            bool _2208 = _1247 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2210 = isnan(_1247);
            bool _2212 = _2208 || _2210;
            bool _2214 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2216 = _2212 || _2214;
            if (!_2216)
            {
                _2110 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2218 = _2110;
            _2112 = _2218;
            if (!_2216)
            {
                _2116 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2220 = _2116;
            _2118 = _2220;
            if (!_2216)
            {
                _2160 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2222 = _2160;
            bool _2224 = !_2216;
            _2162 = _2222;
            if (!_2224)
            {
                bool _2226 = _1247 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2228 = isnan(_1247);
                bool _2230 = _2226 || _2228;
                bool _2232 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2234 = _2230 || _2232;
                if (!_2234)
                {
                    float _2236 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2238 = _1247 + _2236;
                    float _2240 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2242 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2240;
                    float _2244 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2246 = _2244 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2248 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2250 = _2248 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2252 = 1.0 / _2242;
                    float _2254 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2256 = _2254 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2258 = _2238 * _2252;
                    float _2260 = precise::clamp(_2258, 0.0, 1.0);
                    float _2262 = fma(_2260, _2246, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2264 = fma(_2260, _2250, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2266 = fma(_2260, _2256, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _2118 = _2264;
                    _2112 = _2262;
                    _2162 = _2266;
                    _2206 = true;
                }
                else
                {
                    _2118 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2112 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2162 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _2206 = false;
    float _2268 = _2118;
    float _2270 = _2112;
    float _2272 = _2162;
    float _2274 = _2134 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_78.x = 0.0;
    float _2276 = _2268 * 0.586610972881317138671875;
    bool _2278 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_49.x = _2274;
    float _2280 = fma(_2270, 0.298911988735198974609375, _2276);
    bool _2282 = _1970 > 0.0;
    bool _2284 = isnan(_1970);
    bool _2286 = _2282 || _2284;
    bool _2288 = isnan(0.0);
    bool _2290 = _2286 || _2288;
    float _2292 = fma(_2272, 0.114477999508380889892578125, _2280);
    float _2294 = -_2292;
    float _2296 = _2294 + _2270;
    float _2298 = -_2292;
    float _2300 = _2298 + _2268;
    float _2302 = -_2292;
    float _2304 = _2302 + _2272;
    float _2306 = fma(_2296, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2292);
    float _2308 = fma(_2300, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2292);
    float _2310 = fma(_2304, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2292);
    bool _2312 = !_2278;
    if (!_2312)
    {
        float _2314 = -_1213;
        float _2316 = _2314 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2318 = -_1215;
        float _2320 = _2318 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2322 = -_1217;
        float _2324 = _2322 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2326 = _2316 * _2316;
        float _2328 = fma(_2320, _2320, _2326);
        float _2330 = fma(_2324, _2324, _2328);
        float _2332 = sqrt(_2330);
        float _2334 = rsqrt(_2330);
        float _2336 = -_2332;
        float _2338 = _2336 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2340 = _2338 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2342 = precise::clamp(_2340, 0.0, 1.0);
        float _2344 = _2320 * _2334;
        float _2346 = _2316 * _2334;
        float _2348 = abs(_2342);
        float _2350 = log2(_2348);
        float _2352 = _2324 * _2334;
        float _2354 = _2344 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2356 = _2104 * _2346;
        float _2358 = -_2346;
        float _2360 = -_2354;
        float _2362 = fma(_2358, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2360);
        float _2364 = fma(_2100, _2344, _2356);
        float _2366 = -_2352;
        float _2368 = fma(_2366, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2362);
        float _2370 = fma(_2102, _2352, _2364);
        float _2372 = precise::clamp(_2370, 0.0, 1.0);
        float _2374 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2376 = _2368 + _2374;
        float _2378 = _2350 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2380 = _2376 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2382 = precise::clamp(_2380, 0.0, 1.0);
        float _2384 = exp2(_2378);
        float _2386 = _2384 * _2382;
        float _2388 = _2372 * _2386;
        float _2390 = _2388 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2392 = _2388 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2394 = _2388 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_78.x = _2390;
        out.m_78.y = _2392;
        out.m_78.z = _2394;
    }
    out.m_80.x = _2306;
    out.m_80.y = _2308;
    out.m_80.z = _2310;
    if (_2290)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_49.x = 0.0;
    float _2396 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2396;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2206 = false;
    bool _605 = false;
    bool _417 = false;
    bool _177 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _94 = in.m_46.w;
    float _96 = trunc(_94);
    int _99 = int(_96);
    bool _103 = _99 >= 1;
    float _105 = 0.0;
    if (!_103)
    {
        _105 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _107 = _105;
    if (!_103)
    {
        out.m_49.x = 0.0;
    }
    int _109 = 0;
    if (!_103)
    {
        float _111 = _107 * 5.0;
        _109 = as_type<int>(_111);
    }
    int _113 = _109;
    int _115 = _113;
    if (!_103)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2452 = as_type<float>(_113);
        out.gl_Position.z = _2452;
    }
    if (!_103)
    {
        return out;
    }
    float _117 = in.m_51.w;
    bool _119 = _117 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _121 = isnan(_117);
    bool _123 = _119 || _121;
    bool _125 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _127 = _123 || _125;
    float _129 = -_117;
    float _131 = _129 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _133 = 0.0;
    float _135 = _131;
    if (_127)
    {
        float _137 = float(_99);
        _133 = _137;
    }
    float _139 = _133;
    bool _141 = _131 >= _139;
    bool _143 = !_127;
    bool _145 = _141 || _143;
    float _147 = 0.0;
    if (_145)
    {
        _147 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _149 = _147;
    if (_145)
    {
        out.m_49.x = 0.0;
    }
    if (_145)
    {
        float _151 = _149 * 5.0;
        _115 = as_type<int>(_151);
    }
    int _153 = _115;
    if (_145)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2521 = as_type<float>(_153);
        out.gl_Position.z = _2521;
    }
    if (_145)
    {
        return out;
    }
    bool _155 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _157 = !_155;
    float _175;
    if (!_157)
    {
        float _159 = in.m_53.x;
        float _161 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _163 = _159 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _165 = fma(_163, (*spvDescriptorSet0.vp_c9)._m0[12].x, _131);
        float _167 = _165 * _161;
        float _169 = floor(_167);
        float _171 = -_169;
        float _173 = _167 + _171;
        _175 = _173;
        _177 = true;
    }
    else
    {
        float _179 = float(_99);
        float _181 = 1.0 / _179;
        float _183 = _131 * _181;
        _175 = _183;
    }
    _177 = false;
    float _185 = _175;
    float _187 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _189 = _185 + _187;
    float _191 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _193 = _185 + _191;
    float _195 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _197 = _185 + _195;
    float _199 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _201 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _199;
    float _203 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _205 = _203 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _207 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _209 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _207;
    float _211 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _213 = _211 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _215 = 1.0 / _201;
    bool _217 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _219 = 1.0 / _209;
    float _221 = 1.0 / _205;
    float _223 = _193 * _215;
    float _225 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _227 = _185 + _225;
    float _229 = 1.0 / _213;
    float _231 = _189 * _219;
    bool _233 = _185 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _235 = isnan(_185);
    bool _237 = _233 || _235;
    bool _239 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _241 = _237 || _239;
    float _243 = float(_241);
    float _245 = -_243;
    float _247 = _245 + 1.0;
    float _249 = _197 * _221;
    bool _251 = _185 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _253 = isnan(_185);
    bool _255 = _251 || _253;
    bool _257 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _259 = _255 || _257;
    float _261 = float(_259);
    bool _263 = _185 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _265 = isnan(_185);
    bool _267 = _263 || _265;
    bool _269 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _271 = _267 || _269;
    float _273 = float(_271);
    float _275 = _261 * _247;
    bool _277 = _185 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _279 = isnan(_185);
    bool _281 = _277 || _279;
    bool _283 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _285 = _281 || _283;
    float _287 = float(_285);
    float _289 = _227 * _229;
    float _291 = -_261;
    float _293 = _291 + 1.0;
    bool _295 = _185 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _297 = isnan(_185);
    bool _299 = _295 || _297;
    bool _301 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _303 = _299 || _301;
    float _305 = float(_303);
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _309 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _307;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _313 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _311;
    float _315 = _273 * _293;
    float _317 = -_273;
    float _319 = _317 + 1.0;
    float _321 = fma(_309, _223, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _323 = fma(_313, _223, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _327 = _325 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _329 = _287 * _319;
    float _331 = -_287;
    float _333 = _331 + 1.0;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _337 = _335 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _339 = -_305;
    float _341 = _339 + 1.0;
    float _343 = fma(_327, _249, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _345 = _305 * _333;
    float _347 = fma(_337, _249, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _351 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _349;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _355 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _353;
    float _357 = _321 * _345;
    float _359 = _323 * _345;
    float _361 = fma(_351, _231, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _363 = fma(_355, _231, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _365 = fma(_341, (*spvDescriptorSet0.vp_c9)._m0[143].x, _357);
    float _367 = fma(_341, (*spvDescriptorSet0.vp_c9)._m0[143].y, _359);
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _371 = _369 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _375 = _373 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _377 = fma(_347, _329, _365);
    float _379 = fma(_343, _329, _367);
    float _381 = fma(_371, _289, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _383 = fma(_375, _289, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _385 = fma(_361, _315, _377);
    float _387 = fma(_363, _315, _379);
    float _389 = fma(_381, _275, _385);
    float _391 = fma(_383, _275, _387);
    float _393 = fma(_243, (*spvDescriptorSet0.vp_c9)._m0[147].x, _389);
    float _395 = fma(_243, (*spvDescriptorSet0.vp_c9)._m0[147].y, _391);
    bool _397 = !_217;
    float _415;
    if (!_397)
    {
        float _399 = in.m_53.x;
        float _401 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _403 = _399 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _405 = fma(_403, (*spvDescriptorSet0.vp_c9)._m0[11].y, _131);
        float _407 = _405 * _401;
        float _409 = floor(_407);
        float _411 = -_409;
        float _413 = _407 + _411;
        _415 = _413;
        _417 = true;
    }
    else
    {
        float _419 = float(_99);
        float _421 = 1.0 / _419;
        float _423 = _131 * _421;
        _415 = _423;
    }
    _417 = false;
    float _425 = _415;
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _429 = _425 + _427;
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _433 = _431 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _437 = _435 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _439 = _425 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _441 = isnan(_425);
    bool _443 = _439 || _441;
    bool _445 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _447 = _443 || _445;
    float _449 = float(_447);
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _453 = _451 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _455 = _425 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _457 = isnan(_425);
    bool _459 = _455 || _457;
    bool _461 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _463 = _459 || _461;
    float _465 = float(_463);
    float _467 = 1.0 / _433;
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _471 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _469;
    float _473 = -_449;
    float _475 = _473 + 1.0;
    bool _477 = _425 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _479 = isnan(_425);
    bool _481 = _477 || _479;
    bool _483 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _485 = _481 || _483;
    float _487 = float(_485);
    bool _489 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _491 = 1.0 / _437;
    float _493 = 1.0 / _453;
    float _495 = _471 * _467;
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _499 = _497 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _501 = _465 * _475;
    float _503 = -_465;
    float _505 = _503 + 1.0;
    float _507 = fma(_495, _429, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _511 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _509;
    float _513 = _487 * _505;
    float _515 = _499 * _491;
    float _517 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _519 = _425 + _517;
    bool _521 = _425 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _523 = isnan(_425);
    bool _525 = _521 || _523;
    bool _527 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _529 = _525 || _527;
    float _531 = float(_529);
    float _533 = _507 * _513;
    float _535 = -_487;
    float _537 = _535 + 1.0;
    float _539 = fma(_515, _519, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _543 = _425 + _541;
    float _545 = _511 * _493;
    float _547 = -_531;
    float _549 = _547 + 1.0;
    float _551 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[115].x, _533);
    float _553 = fma(_545, _543, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _555 = _449 * _549;
    float _557 = fma(_539, _501, _551);
    float _559 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _561 = in.m_55.x;
    float _563 = in.m_55.y;
    float _565 = fma(_553, _555, _557);
    float _567 = _559 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _569 = fma(_531, (*spvDescriptorSet0.vp_c9)._m0[118].x, _565);
    float _571 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _573 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _575 = _569 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _577 = _571 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _579 = _573 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_57.x = _567;
    out.m_57.y = _577;
    out.m_57.z = _579;
    out.m_57.w = _575;
    float _581 = _395 * _563;
    float _583 = _393 * _561;
    bool _585 = !_489;
    float _603;
    if (!_585)
    {
        float _587 = in.m_53.x;
        float _589 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _591 = _587 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _593 = fma(_591, (*spvDescriptorSet0.vp_c9)._m0[11].w, _131);
        float _595 = _593 * _589;
        float _597 = floor(_595);
        float _599 = -_597;
        float _601 = _595 + _599;
        _603 = _601;
        _605 = true;
    }
    else
    {
        float _607 = float(_99);
        float _609 = 1.0 / _607;
        float _611 = _131 * _609;
        _603 = _611;
    }
    _605 = false;
    float _613 = _603;
    float _615 = in.m_53.x;
    float _617 = in.m_53.y;
    float _619 = in.m_53.z;
    float _621 = in.m_53.w;
    float _623 = _583 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _625 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _627 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _629 = _627 != 0;
    int _631 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _633 = _631 != 0;
    int _635 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _637 = _635 != 0;
    float _639 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _641 = !_633;
    int _643 = _641 ? 0 : 1;
    int _645 = abs(_643);
    float _647 = _619 * 2.0;
    float _649 = _615 * 2.0;
    float _651 = _615 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _653 = _617 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _655 = floor(_647);
    float _657 = _617 * 2.0;
    float _659 = -_625;
    float _661 = fma(_651, 2.0, _659);
    float _663 = _617 + _615;
    bool _665 = !_629;
    int _667 = _665 ? 0 : 1;
    float _669 = fma(_653, -2.0, _639);
    float _671 = -_131;
    float _673 = fma(_671, (*spvDescriptorSet0.vp_c9)._m0[76].x, _661);
    float _675 = _663 + (-1.0);
    float _677 = floor(_649);
    float _679 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[76].y, _669);
    float _681 = fma(_675, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _683 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _685 = log2(_683);
    bool _687 = _655 > 0.0;
    bool _689 = _655 >= 0.0;
    bool _691 = isnan(_655);
    bool _693 = _689 || _691;
    bool _695 = isnan(0.0);
    bool _697 = _693 || _695;
    int _699 = abs(_667);
    int _701 = _697 ? 0 : 1;
    float _703 = floor(_657);
    bool _705 = _677 > 0.0;
    bool _707 = _677 >= 0.0;
    bool _709 = isnan(_677);
    bool _711 = _707 || _709;
    bool _713 = isnan(0.0);
    bool _715 = _711 || _713;
    int _717 = ~_701;
    int _719 = _717 + 1;
    int _721 = _719 + 1;
    float _723 = _685 * _131;
    int _725 = _721;
    if (!_687)
    {
        int _727 = ~_701;
        int _729 = _727 + 1;
        _725 = _729;
    }
    int _731 = _725;
    int _733 = _715 ? 0 : 1;
    float _735 = float(_699);
    float _737 = exp2(_723);
    float _739 = float(_731);
    int _741 = ~_733;
    int _743 = _741 + 1;
    int _745 = _743 + 1;
    int _747 = _745;
    if (!_705)
    {
        int _749 = ~_733;
        int _751 = _749 + 1;
        _747 = _751;
    }
    int _753 = _747;
    float _755 = _735 * _739;
    bool _757 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _759 = isnan(1.0);
    bool _761 = _757 || _759;
    bool _763 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _765 = _761 || _763;
    float _767 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _769 = 1.0 + _767;
    float _771 = in.m_59.x;
    float _773 = in.m_59.y;
    float _775 = in.m_59.z;
    float _777 = _755 * (-2.0);
    bool _779 = _703 > 0.0;
    float _781 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _783 = 1.0 / _769;
    float _785 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _787 = _703 >= 0.0;
    bool _789 = isnan(_703);
    bool _791 = _787 || _789;
    bool _793 = isnan(0.0);
    bool _795 = _791 || _793;
    float _797 = fma(_615, (*spvDescriptorSet0.vp_c9)._m0[78].z, _781);
    bool _799 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _801 = isnan(0.0);
    bool _803 = _799 || _801;
    bool _805 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _807 = _803 || _805;
    float _809 = fma(_617, (*spvDescriptorSet0.vp_c9)._m0[78].w, _785);
    float _811 = -_737;
    float _813 = _811 + 1.0;
    int _815 = _795 ? 0 : 1;
    float _817 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].z, _797);
    float _819 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].w, _809);
    float _821 = _807 ? _813 : 0.0;
    int _823 = ~_815;
    int _825 = _823 + 1;
    int _827 = _825 + 1;
    int _829 = _827;
    if (!_779)
    {
        int _831 = ~_815;
        int _833 = _831 + 1;
        _829 = _833;
    }
    int _835 = _829;
    if (_765)
    {
        float _837 = _821 * _783;
        _135 = _837;
    }
    float _839 = _135;
    float _841 = float(_645);
    float _843 = _615 + (-0.5);
    float _845 = float(_753);
    bool _847 = !_637;
    int _849 = _847 ? 0 : 1;
    float _851 = float(_835);
    float _853 = _841 * _845;
    int _855 = abs(_849);
    float _857 = fma(_777, _771, _771);
    float _859 = _617 + _619;
    float _861 = fma(_681, _777, _681);
    float _863 = fma(_843, (*spvDescriptorSet0.vp_c9)._m0[196].x, _857);
    float _865 = _859 + (-1.0);
    float _867 = float(_855);
    float _869 = _853 * (-2.0);
    float _871 = fma(_861, _839, _863);
    float _873 = fma(_865, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _875 = _867 * _851;
    float _877 = _871 * 0.15915493667125701904296875;
    float _879 = _617 + (-0.5);
    float _881 = fma(_869, _773, _773);
    float _883 = fma(_873, _869, _873);
    float _885 = _619 + _615;
    float _887 = as_type<float>(int(gl_VertexIndex));
    float _889 = fma(_879, (*spvDescriptorSet0.vp_c9)._m0[196].y, _881);
    float _891 = _875 * (-2.0);
    float _893 = _885 + (-1.0);
    float _895 = _877 * 6.283185482025146484375;
    float _897 = cos(_895);
    float _899 = fma(_883, _839, _889);
    float _901 = fma(_891, _775, _775);
    float _903 = fma(_893, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _905 = _619 + (-0.5);
    float _907 = _899 * 0.15915493667125701904296875;
    float _909 = fma(_903, _891, _903);
    float _911 = fma(_905, (*spvDescriptorSet0.vp_c9)._m0[196].z, _901);
    float _913 = _907 * 6.283185482025146484375;
    float _915 = sin(_913);
    float _917 = _581 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _919 = fma(_909, _839, _911);
    float _921 = in.m_46.x;
    float _923 = in.m_46.y;
    float _925 = in.m_46.z;
    float _927 = _919 * 0.15915493667125701904296875;
    float _929 = _907 * 6.283185482025146484375;
    float _931 = cos(_929);
    int _933 = as_type<int>(_887) & 1;
    bool _935 = _933 != 0;
    int _937 = as_type<int>(_887) & 2;
    bool _939 = _937 != 0;
    float _941 = _877 * 6.283185482025146484375;
    float _943 = sin(_941);
    bool _945 = !_939;
    float _947 = _945 ? (-0.5) : 0.5;
    float _949 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    bool _951 = !_935;
    float _953 = _951 ? (-0.5) : 0.5;
    bool _955 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _957 = isnan(0.5);
    bool _959 = _955 || _957;
    bool _961 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _963 = _959 || _961;
    float _965 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _947);
    float _967 = _927 * 6.283185482025146484375;
    float _969 = cos(_967);
    float _971 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _953);
    float _973 = _917 * _965;
    float _975 = _897 * _931;
    float _977 = _897 * _915;
    float _979 = _623 * _971;
    float _981 = _927 * 6.283185482025146484375;
    float _983 = sin(_981);
    float _985 = _943 * _915;
    float _987 = _943 * _931;
    float _989 = _897 * _969;
    float _991 = _943 * _969;
    float _993 = _931 * _969;
    float _995 = _915 * _969;
    float _997 = _989 * _973;
    float _999 = _991 * _973;
    float _1001 = fma(_983, _975, _985);
    float _1003 = -_977;
    float _1005 = fma(_983, _987, _1003);
    float _1007 = -_987;
    float _1009 = fma(_983, _977, _1007);
    float _1011 = -_973;
    float _1013 = _983 * _1011;
    float _1015 = fma(_1001, _979, _997);
    float _1017 = fma(_983, _985, _975);
    float _1019 = fma(_1005, _979, _999);
    float _1021 = fma(_993, _979, _1013);
    float _1023 = fma(_1009, _949, _1015);
    float _1025 = _923 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1027 = fma(_995, _949, _1021);
    float _1029 = _1023 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1031 = fma(_1017, _949, _1019);
    float _1033 = _923 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1035 = fma(_921, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1025);
    float _1037 = _1023 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1039 = fma(_1027, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1029);
    float _1041 = fma(_921, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1033);
    float _1043 = fma(_925, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1035);
    float _1045 = fma(_1027, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1037);
    float _1047 = fma(_1031, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1039);
    float _1049 = fma(_925, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1041);
    float _1051 = _1043 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1053 = fma(_1031, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1045);
    float _1055 = _1047 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1057 = _1049 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1059 = _923 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1061 = _1053 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1063 = _1051 + _1055;
    float _1065 = fma(_921, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1059);
    float _1067 = _1057 + _1061;
    float _1069 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1071 = _1063 + _1069;
    float _1073 = fma(_925, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1065);
    float _1075 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1077 = _1067 + _1075;
    float _1079 = _1071 * _1071;
    float _1081 = _1073 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1083 = fma(_1077, _1077, _1079);
    float _1085 = _1023 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1087 = sqrt(_1083);
    float _1089 = fma(_1027, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1085);
    float _1091 = fma(_1031, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1089);
    float _1093 = _1091 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1095 = _1081 + _1093;
    bool _1097 = _1087 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1099 = _861;
    float _1101 = _1063;
    float _1103 = _1067;
    float _1105 = _1023;
    float _1107 = _1029;
    if (!_1097)
    {
        _1099 = _1095;
    }
    float _1109 = _1099;
    bool _1111 = !_1097;
    float _1113 = _1109;
    if (!_1111)
    {
        float _1115 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1117 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1119 = _1087 + _1117;
        float _1121 = _1095 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1123 = rsqrt(_1083);
        float _1125 = _1119 * _1115;
        float _1127 = _1125 * 0.15915493667125701904296875;
        float _1129 = _1127 * 6.283185482025146484375;
        float _1131 = cos(_1129);
        float _1133 = _1127 * 6.283185482025146484375;
        float _1135 = sin(_1133);
        float _1137 = _1131 + (-1.0);
        float _1139 = _1137 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1141 = fma(_1135, _1121, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1143 = fma(_1095, _1131, _1139);
        float _1145 = _1123 * _1141;
        float _1147 = fma(_1077, _1145, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1149 = fma(_1071, _1145, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1113 = _1143;
        _1101 = _1149;
        _1103 = _1147;
    }
    float _1151 = _1113;
    float _1153 = _1101;
    float _1155 = _1103;
    float _1157 = _1151;
    float _1159 = _1155;
    float _1161 = _1153;
    if (!_963)
    {
        float _1163 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1165 = _1081 + _1163;
        float _1167 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1169 = _1057 + _1167;
        float _1171 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1173 = -_1081;
        float _1175 = _1173 + _1151;
        float _1177 = _1165 * _1165;
        float _1179 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1181 = _1051 + _1179;
        float _1183 = -_1051;
        float _1185 = _1183 + _1153;
        float _1187 = fma(_1169, _1169, _1177);
        float _1189 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1191 = fma(_1181, _1181, _1187);
        float _1193 = sqrt(_1191);
        float _1195 = _1171 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1197 = precise::min(_1193, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1199 = _1197 * _1189;
        float _1201 = -_1057;
        float _1203 = _1201 + _1155;
        float _1205 = _1195 * _1199;
        float _1207 = fma(_1203, _1205, _1057);
        float _1209 = fma(_1175, _1205, _1081);
        float _1211 = fma(_1185, _1205, _1051);
        _1157 = _1209;
        _1159 = _1207;
        _1161 = _1211;
    }
    float _1213 = _1157;
    float _1215 = _1159;
    float _1217 = _1161;
    float _1219 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1221 = _1213 + _1219;
    float _1223 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1225 = _1215 + _1223;
    float _1227 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1229 = _1217 + _1227;
    float _1231 = _1213 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1233 = _1221 * _1221;
    float _1235 = fma(_1215, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1231);
    float _1237 = fma(_1225, _1225, _1233);
    float _1239 = fma(_1217, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1235);
    float _1241 = fma(_1229, _1229, _1237);
    float _1243 = _1239 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1245 = rsqrt(_1241);
    float _1247 = sqrt(_1241);
    float _1249 = _1245 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1251 = _1225 * _1249;
    float _1253 = _1229 * _1249;
    float _1255 = _1251 * _1251;
    float _1257 = _1253 * _1253;
    float _1259 = _1255 + _1257;
    float _1261 = sqrt(_1259);
    bool _1263 = _1261 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1265 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1267 = _1261 + _1265;
    float _1269 = _1245;
    float _1271 = _1259;
    float _1273 = _1267;
    float _1275 = _1221;
    if (_1263)
    {
        float _1277 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1269 = _1277;
    }
    float _1279 = _1269;
    if (_1263)
    {
        float _1281 = rsqrt(_1259);
        _1271 = _1281;
    }
    float _1283 = _1271;
    float _1285 = _1283;
    if (_1263)
    {
        float _1287 = _1267 * _1279;
        _1273 = _1287;
    }
    float _1289 = _1273;
    if (_1263)
    {
        float _1291 = _1289 * 0.15915493667125701904296875;
        _1105 = _1291;
    }
    float _1293 = _1105;
    float _1295 = _1229;
    float _1297 = _1293;
    if (_1263)
    {
        float _1299 = _1293 * 6.283185482025146484375;
        float _1301 = sin(_1299);
        _1295 = _1301;
    }
    float _1303 = _1295;
    float _1305 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1307 = precise::max(0.0, _1305);
    float _1309 = _1279;
    float _1311 = _1307;
    if (_1263)
    {
        float _1313 = _1293 * 6.283185482025146484375;
        float _1315 = cos(_1313);
        _1309 = _1315;
    }
    float _1317 = _1309;
    float _1319 = -_1249;
    float _1321 = -_1307;
    float _1323 = fma(_1221, _1319, _1321);
    float _1325 = _1323;
    if (_1263)
    {
        float _1327 = _1323 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1275 = _1327;
    }
    float _1329 = _1275;
    float _1331 = _1329;
    if (!_1263)
    {
        _1297 = _1257;
    }
    float _1333 = _1297;
    float _1335 = _1303;
    float _1337 = _1333;
    if (_1263)
    {
        float _1339 = fma(_1303, _1329, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1331 = _1339;
    }
    float _1341 = _1331;
    if (!_1263)
    {
        _1335 = _1251;
    }
    float _1343 = _1335;
    float _1345 = _1343;
    float _1347 = _1317;
    if (_1263)
    {
        float _1349 = _1317 + (-1.0);
        _1311 = _1349;
    }
    float _1351 = _1311;
    float _1353 = _1351;
    if (_1263)
    {
        float _1355 = _1283 * _1341;
        _1107 = _1355;
    }
    float _1357 = _1107;
    if (!_1263)
    {
        _1285 = _1255;
    }
    float _1359 = _1285;
    float _1361 = _1359;
    if (_1263)
    {
        float _1363 = _1351 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1353 = _1363;
    }
    float _1365 = _1353;
    if (_1263)
    {
        float _1367 = _1251 * _1357;
        _1345 = _1367;
    }
    float _1369 = _1345;
    float _1371 = _1213 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1263)
    {
        float _1373 = fma(_1323, _1317, _1365);
        _1325 = _1373;
    }
    float _1375 = _1325;
    if (!_1263)
    {
        _1347 = _1253;
    }
    float _1377 = _1347;
    float _1379 = _1377;
    if (_1263)
    {
        float _1381 = _1253 * _1357;
        _1379 = _1381;
    }
    float _1383 = _1379;
    if (_1263)
    {
        float _1385 = _1369 * _1369;
        _1361 = _1385;
    }
    float _1387 = _1361;
    float _1389 = _1213 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1391 = fma(_1215, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1371);
    if (_1263)
    {
        float _1393 = _1383 * _1383;
        _1337 = _1393;
    }
    float _1395 = _1337;
    float _1397 = fma(_1375, _1375, _1387);
    float _1399 = fma(_1215, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1389);
    float _1401 = fma(_1217, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1391);
    float _1403 = _1397 + _1395;
    float _1405 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1407 = fma(_1247, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1405);
    float _1409 = precise::clamp(_1407, 0.0, 1.0);
    float _1411 = fma(_1057, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1413 = rsqrt(_1403);
    float _1415 = _1401 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1417 = -_1409;
    float _1419 = _1417 + 1.0;
    float _1421 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1423 = _1415 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1425 = abs(_1419);
    float _1427 = log2(_1425);
    float _1429 = _1213 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1431 = fma(_1051, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1433 = -_1423;
    float _1435 = fma(_1433, _1421, 1.0);
    float _1437 = fma(_1215, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1429);
    float _1439 = _1413 * _1369;
    float _1441 = fma(_1217, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1399);
    float _1443 = _1413 * _1375;
    float _1445 = fma(_1217, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1437);
    float _1447 = _1439 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1449 = _1441 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1451 = floor(_1411);
    float _1453 = _1413 * _1383;
    float _1455 = -_1447;
    float _1457 = fma(_1443, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1455);
    float _1459 = _1445 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1461 = _1449 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1463 = _1427 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1465 = -_1453;
    float _1467 = fma(_1465, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1457);
    float _1469 = floor(_1431);
    float _1471 = fma(_1459, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1461);
    float _1473 = fma(_1467, -0.5, 0.5);
    float _1475 = fma(_1467, 0.5, 0.5);
    float _1477 = fma(_1415, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1471);
    float _1479 = -_1451;
    float _1481 = _1411 + _1479;
    float _1483 = fma(_1243, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1477);
    float _1485 = exp2(_1463);
    float _1487 = _1449 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1489 = _1449 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1491 = -_1469;
    float _1493 = _1431 + _1491;
    float _1495 = fma(_1459, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1489);
    float _1497 = log2(_1435);
    float _1499 = fma(_1475, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1501 = fma(_1459, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1487);
    float _1503 = fma(_1415, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1495);
    float _1505 = fma(_1475, _1499, -0.212114393711090087890625);
    float _1507 = fma(_1415, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1501);
    float _1509 = fma(_1243, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1503);
    float _1511 = 1.0 / _1483;
    float _1513 = sqrt(_1473);
    float _1515 = fma(_1243, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1507);
    float2 _4682 = float2(_1481, _1493);
    float _1517 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4682, float2(0.0), isnan(_4682)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4682, float2(0.0), isnan(_4682)), level(0.0)).x;
    float _1519 = fma(_1475, _1505, 1.570728778839111328125);
    float _1521 = _1515 * _1511;
    float _1523 = _1443 + 1.0;
    float _1525 = fma(_1521, 0.5, 0.5);
    float _1527 = -_1443;
    float _1529 = fma(_1485, _1523, _1527);
    float _1531 = _1497 * 0.693147182464599609375;
    float _1533 = _1509 * _1511;
    float _1535 = _1513 * 0.636619746685028076171875;
    float _1537 = fma(_1529, 0.5, 0.5);
    float _1539 = _1531 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1541 = fma(_1533, -0.5, 0.5);
    float _1543 = -_1519;
    float _1545 = fma(_1535, _1543, 1.0);
    float3 _4732 = float3(_1525, _1541, _1539);
    float _1547 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4732, float3(0.0), isnan(_4732)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4732, float3(0.0), isnan(_4732)), level(0.0)).x;
    float3 _4743 = float3(_1525, _1541, _1539);
    float4 _1550 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4743, float3(0.0), isnan(_4743)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4743, float3(0.0), isnan(_4743)), level(0.0)).xyzw;
    float _1552 = _1550.x;
    float _1554 = _1550.y;
    float _1556 = _1550.z;
    float _1558 = _1550.w;
    float2 _4759 = float2(_1545, _1537);
    float3 _1562 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4759, float2(0.0), isnan(_4759)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4759, float2(0.0), isnan(_4759)), level(0.0)).xyz;
    float _1564 = _1562.x;
    float _1566 = _1562.y;
    float _1568 = _1562.z;
    float _1570 = _1081 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1572 = -_817;
    float _1574 = _1572 + 1.0;
    bool _1576 = _621 > 0.5;
    float _1578 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1580 = _1578 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1582 = _615 > 0.5;
    float _1584 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1586 = _1584 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1588 = _1081 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1590 = 1.0 / _1580;
    bool _1592 = _617 > 0.5;
    float _1594 = fma(_1057, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1588);
    float _1596 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1598 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1596;
    float _1600 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1602 = _1600 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    int _1604 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1606 = _1604 != 0;
    float _1608 = fma(_1057, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1570);
    float _1610 = 1.0 / _1586;
    int _1612 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1614 = _1612 != 0;
    float _1616 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1618 = _1616 + (*spvDescriptorSet0.vp_c9)._m0[135].w;
    int _1620 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1622 = _1620 != 0;
    float _1624 = fma(_1051, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1608);
    int _1626 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1628 = _1626 != 0;
    float _1630 = fma(_1051, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1594);
    float _1632 = -_953;
    int _1634 = _1582 ? as_type<int>(_1632) : as_type<int>(_953);
    float _1636 = _1602 * _1590;
    float _1638 = 1.0 / _1618;
    bool _1640 = _613 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1642 = isnan(_613);
    bool _1644 = _1640 || _1642;
    bool _1646 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1648 = _1644 || _1646;
    float _1650 = float(_1648);
    float _1652 = -_819;
    float _1654 = _1652 + 1.0;
    bool _1656 = !_1606;
    float _1658 = _1656 ? _953 : as_type<float>(_1634);
    float _1660 = _1427 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1662 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1664 = isnan(0.5);
    bool _1666 = _1662 || _1664;
    bool _1668 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1670 = _1666 || _1668;
    float _1672 = _1598 * _1610;
    float _1674 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1676 = _1674 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1678 = _613 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1680 = isnan(_613);
    bool _1682 = _1678 || _1680;
    bool _1684 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1686 = _1682 || _1684;
    float _1688 = float(_1686);
    float _1690 = -_1650;
    float _1692 = _1690 + 1.0;
    bool _1694 = _613 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1696 = isnan(_613);
    bool _1698 = _1694 || _1696;
    bool _1700 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1702 = _1698 || _1700;
    float _1704 = float(_1702);
    float _1706 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1708 = _1688 * _1692;
    float _1710 = -_1688;
    float _1712 = _1710 + 1.0;
    float _1714 = _1624 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1716 = -_1704;
    float _1718 = _1716 + 1.0;
    bool _1720 = _619 > 0.5;
    float _1722 = _1704 * _1712;
    float _1724 = -(*spvDescriptorSet0.vp_c9)._m0[134].x;
    float _1726 = _1724 + (*spvDescriptorSet0.vp_c9)._m0[135].x;
    float _1728 = 1.0 / _1714;
    bool _1730 = _613 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1732 = isnan(_613);
    bool _1734 = _1730 || _1732;
    bool _1736 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1738 = _1734 || _1736;
    float _1740 = float(_1738);
    float _1742 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1744 = _613 + _1742;
    float _1746 = _1726 * _1638;
    float _1748 = _1630 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1750 = _613 >= (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _1752 = isnan(_613);
    bool _1754 = _1750 || _1752;
    bool _1756 = isnan((*spvDescriptorSet0.vp_c9)._m0[135].w);
    bool _1758 = _1754 || _1756;
    float _1760 = float(_1758);
    float _1762 = fma(_1672, _1744, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1764 = _1740 * _1718;
    float _1766 = 1.0 / _1676;
    float _1768 = _1748 + _1714;
    float _1770 = -_1760;
    float _1772 = _1770 + 1.0;
    float _1774 = _1762 * _1764;
    float _1776 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1778 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1776;
    float _1780 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1782 = _613 + _1780;
    float _1784 = _1650 * _1772;
    float _1786 = -_1740;
    float _1788 = _1786 + 1.0;
    float _1790 = _1768 * _1728;
    float _1792 = _1790 * 0.5;
    float _1794 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1796 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1798 = _613 + _1796;
    float _1800 = fma(_1636, _1782, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1802 = fma(_1788, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1774);
    float _1804 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1806 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1804);
    float _1808 = -_947;
    int _1810 = _1592 ? as_type<int>(_1808) : as_type<int>(_947);
    float _1812 = _1778 * _1766;
    float _1814 = fma(_1800, _1722, _1802);
    float _1816 = _1706 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1818 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1820 = fma(_1812, _1798, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1822 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1824 = _613 + _1822;
    float _1826 = -_953;
    int _1828 = _1720 ? as_type<int>(_1826) : as_type<int>(_953);
    float _1830 = _1449 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1832 = fma(_1820, _1708, _1814);
    bool _1834 = !_1614;
    float _1836 = _1834 ? _947 : as_type<float>(_1810);
    float _1838 = fma(_1746, _1824, (*spvDescriptorSet0.vp_c9)._m0[134].x);
    float _1840 = 1.0 / _1806;
    float _1842 = _1794 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1844 = _1658 + 0.5;
    float _1846 = _1836 + (-0.5);
    float _1848 = fma(_1838, _1784, _1832);
    bool _1850 = !_1622;
    float _1852 = _1850 ? _953 : as_type<float>(_1828);
    float _1854 = fma(_1842, _1844, _673);
    float _1856 = -_1816;
    float _1858 = -_679;
    float _1860 = fma(_1856, _1846, _1858);
    float _1862 = fma(_1760, (*spvDescriptorSet0.vp_c9)._m0[135].x, _1848);
    float _1864 = -_947;
    int _1866 = _1576 ? as_type<int>(_1864) : as_type<int>(_947);
    float _1868 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1870 = -_1574;
    float _1872 = fma(_1658, _1870, _1854);
    float _1874 = _1852 + 0.5;
    bool _1876 = !_1628;
    float _1878 = _1876 ? _947 : as_type<float>(_1866);
    float _1880 = fma(_1836, _1654, _1860);
    float _1882 = _1654;
    float _1884 = _1862;
    float _1886 = _1509;
    float _1888 = _1515;
    if (!_1670)
    {
        _1882 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _1890 = _1882;
    float _1892 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1894 = _1840 * _1892;
    float _1896 = _1874 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1898 = -_1878;
    float _1900 = _1898 + 0.5;
    float _1902 = abs(_1894);
    float _1904 = log2(_1902);
    float _1906 = _1896 * _1818;
    float _1908 = _1900 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1910 = _1890;
    if (!_1670)
    {
        float _1912 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1914 = _1890 + _1912;
        _1910 = _1914;
    }
    float _1916 = _1910;
    float _1918 = _989 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1920 = _1908 * _1868;
    float _1922 = as_type<float>(_1810);
    float _1924 = _1916;
    if (!_1670)
    {
        float _1926 = 1.0 / _1916;
        _1922 = _1926;
    }
    float _1928 = _1922;
    float _1930 = _989 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1932 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1934 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1936 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    out.m_64.x = _1872;
    out.m_64.y = _1880;
    out.m_64.z = _1906;
    out.m_64.w = _1920;
    float _1938 = _989 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1940 = -_983;
    float _1942 = fma(_1940, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1918);
    float _1944 = _1904 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    if (!_1670)
    {
        float _1946 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1948 = _1894 + _1946;
        _1924 = _1948;
    }
    float _1950 = _1924;
    float _1952 = _1862 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    if (_1670)
    {
        _1884 = 1.0;
    }
    float _1954 = _1884;
    float _1956 = _1932 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1958 = _1936 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1960 = exp2(_1944);
    float _1962 = _1934 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1964 = _1954;
    if (!_1670)
    {
        float _1966 = _1950 * _1928;
        float _1968 = precise::clamp(_1966, 0.0, 1.0);
        _1964 = _1968;
    }
    float _1970 = _1964;
    float _1972 = -_983;
    float _1974 = fma(_1972, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1930);
    float _1976 = _1001 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1978 = -_983;
    float _1980 = fma(_1978, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1938);
    float _1982 = fma(_991, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1942);
    float _1984 = fma(_991, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1974);
    float _1986 = fma(_993, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1976);
    float _1988 = _1009 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1990 = _947 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1992 = fma(_991, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1980);
    out.m_66.x = _1956;
    out.m_66.y = _1958;
    out.m_66.z = _1962;
    out.m_66.w = _1952;
    float _1994 = _1990 * _1982;
    float _1996 = fma(_1960, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1998 = precise::clamp(_1996, 0.0, 1.0);
    float _2000 = exp2(_1660);
    float _2002 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1986);
    float _2004 = fma(_1459, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1830);
    bool _2006 = _1894 <= 8000.0;
    bool _2008 = isnan(_1894);
    bool _2010 = _2006 || _2008;
    bool _2012 = isnan(8000.0);
    bool _2014 = _2010 || _2012;
    float _2016 = float(_2014);
    float _2018 = _953 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2020 = _1009 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2022 = fma(_1415, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2004);
    float _2024 = _1009 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2026 = fma(_2018, _2002, _1994);
    bool _2028 = _1247 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2030 = isnan(_1247);
    bool _2032 = _2028 || _2030;
    bool _2034 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2036 = _2032 || _2034;
    float _2038 = fma(_1243, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2022);
    float _2040 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1988);
    float _2042 = _1990 * _1984;
    float _2044 = _1001 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2046 = _1001 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2048 = _1990 * _1992;
    float _2050 = fma(_1998, -2.0, 3.0);
    float _2052 = _1998 * _1998;
    float _2054 = fma(_993, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2044);
    float _2056 = fma(_993, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2046);
    float _2058 = -_2000;
    float _2060 = _2058 + 1.0;
    float _2062 = _2052 * _2050;
    float _2064 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2054);
    float _2066 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2056);
    float _2068 = fma(_1017, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2040);
    float _2070 = -_2062;
    float _2072 = _2070 + 1.0;
    float _2074 = in.m_68.x;
    float _2076 = _2038 + _1483;
    float _2078 = _2060 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2080 = fma(_2072, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2062);
    float _2082 = fma(_2018, _2064, _2042);
    float _2084 = _2076 * 0.5;
    float _2086 = _2016 * _2080;
    float _2088 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2020);
    float _2090 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2024);
    float _2092 = _2086 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2094 = fma(_2018, _2066, _2048);
    out.m_70.z = _2084;
    out.m_70.w = _1483;
    float _2096 = fma(_1017, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2090);
    float _2098 = fma(_1017, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2088);
    float _2100 = _2068 + _2026;
    float _2102 = _2096 + _2094;
    float _2104 = _2098 + _2082;
    out.gl_Position.x = _1515;
    out.gl_Position.y = _1509;
    out.gl_Position.z = _2038;
    out.gl_Position.w = _1483;
    out.m_72.x = _2100;
    out.m_72.y = _2104;
    out.m_72.z = _2102;
    float _2106 = _2038;
    if (!_2036)
    {
        _2106 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2108 = _2106;
    float _2110 = _2108;
    float _2112 = _2108;
    if (!_2036)
    {
        _1886 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2114 = _1886;
    float _2116 = _2114;
    float _2118 = _2114;
    if (!_2036)
    {
        _1888 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2120 = _1888;
    float _2122 = -_1517;
    float _2124 = _2122 + 1.0;
    float _2126 = _2124 * _2092;
    float _2128 = precise::clamp(_2126, 0.0, 1.0);
    float _2130 = -_2128;
    float _2132 = fma(_2130, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2134 = _1970 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2136 = _2132 * _2074;
    float _2138 = _2136 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2140 = _2078 * _1547;
    float _2142 = -_2078;
    float _2144 = _2142 + 1.0;
    out.m_74.x = _2138;
    float _2146 = _1558 * _2140;
    float _2148 = _1568 * _2140;
    float _2150 = _1558 * _2144;
    float _2152 = fma(_1564, _2146, _1552);
    float _2154 = fma(_1566, _2146, _1554);
    float _2156 = fma(_1558, _2148, _1556);
    out.m_76.x = _2152;
    out.m_76.y = _2154;
    out.m_76.z = _2156;
    out.m_76.w = _2150;
    bool _2158 = !_2036;
    float _2160 = _2120;
    float _2162 = _2120;
    if (!_2158)
    {
        bool _2164 = _1247 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2166 = isnan(_1247);
        bool _2168 = _2164 || _2166;
        bool _2170 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2172 = _2168 || _2170;
        if (!_2172)
        {
            float _2174 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2176 = _1247 + _2174;
            float _2178 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2180 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2178;
            float _2182 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2184 = _2182 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2186 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2188 = _2186 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2190 = 1.0 / _2180;
            float _2192 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2194 = _2192 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2196 = _2176 * _2190;
            float _2198 = precise::clamp(_2196, 0.0, 1.0);
            float _2200 = fma(_2198, _2184, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2202 = fma(_2198, _2188, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2204 = fma(_2198, _2194, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _2118 = _2202;
            _2112 = _2200;
            _2162 = _2204;
            _2206 = true;
        }
        else
        {
            bool _2208 = _1247 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2210 = isnan(_1247);
            bool _2212 = _2208 || _2210;
            bool _2214 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2216 = _2212 || _2214;
            if (!_2216)
            {
                _2110 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2218 = _2110;
            _2112 = _2218;
            if (!_2216)
            {
                _2116 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2220 = _2116;
            _2118 = _2220;
            if (!_2216)
            {
                _2160 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2222 = _2160;
            bool _2224 = !_2216;
            _2162 = _2222;
            if (!_2224)
            {
                bool _2226 = _1247 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2228 = isnan(_1247);
                bool _2230 = _2226 || _2228;
                bool _2232 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2234 = _2230 || _2232;
                if (!_2234)
                {
                    float _2236 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2238 = _1247 + _2236;
                    float _2240 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2242 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2240;
                    float _2244 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2246 = _2244 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2248 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2250 = _2248 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2252 = 1.0 / _2242;
                    float _2254 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2256 = _2254 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2258 = _2238 * _2252;
                    float _2260 = precise::clamp(_2258, 0.0, 1.0);
                    float _2262 = fma(_2260, _2246, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2264 = fma(_2260, _2250, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2266 = fma(_2260, _2256, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _2118 = _2264;
                    _2112 = _2262;
                    _2162 = _2266;
                    _2206 = true;
                }
                else
                {
                    _2118 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2112 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2162 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _2206 = false;
    float _2268 = _2118;
    float _2270 = _2112;
    float _2272 = _2162;
    float _2274 = _2134 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_78.x = 0.0;
    float _2276 = _2268 * 0.586610972881317138671875;
    bool _2278 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_49.x = _2274;
    float _2280 = fma(_2270, 0.298911988735198974609375, _2276);
    bool _2282 = _1970 > 0.0;
    bool _2284 = isnan(_1970);
    bool _2286 = _2282 || _2284;
    bool _2288 = isnan(0.0);
    bool _2290 = _2286 || _2288;
    float _2292 = fma(_2272, 0.114477999508380889892578125, _2280);
    float _2294 = -_2292;
    float _2296 = _2294 + _2270;
    float _2298 = -_2292;
    float _2300 = _2298 + _2268;
    float _2302 = -_2292;
    float _2304 = _2302 + _2272;
    float _2306 = fma(_2296, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2292);
    float _2308 = fma(_2300, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2292);
    float _2310 = fma(_2304, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2292);
    bool _2312 = !_2278;
    if (!_2312)
    {
        float _2314 = -_1213;
        float _2316 = _2314 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2318 = -_1215;
        float _2320 = _2318 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2322 = -_1217;
        float _2324 = _2322 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2326 = _2316 * _2316;
        float _2328 = fma(_2320, _2320, _2326);
        float _2330 = fma(_2324, _2324, _2328);
        float _2332 = sqrt(_2330);
        float _2334 = rsqrt(_2330);
        float _2336 = -_2332;
        float _2338 = _2336 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2340 = _2338 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2342 = precise::clamp(_2340, 0.0, 1.0);
        float _2344 = _2320 * _2334;
        float _2346 = _2316 * _2334;
        float _2348 = abs(_2342);
        float _2350 = log2(_2348);
        float _2352 = _2324 * _2334;
        float _2354 = _2344 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2356 = _2104 * _2346;
        float _2358 = -_2346;
        float _2360 = -_2354;
        float _2362 = fma(_2358, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2360);
        float _2364 = fma(_2100, _2344, _2356);
        float _2366 = -_2352;
        float _2368 = fma(_2366, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2362);
        float _2370 = fma(_2102, _2352, _2364);
        float _2372 = precise::clamp(_2370, 0.0, 1.0);
        float _2374 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2376 = _2368 + _2374;
        float _2378 = _2350 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2380 = _2376 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2382 = precise::clamp(_2380, 0.0, 1.0);
        float _2384 = exp2(_2378);
        float _2386 = _2384 * _2382;
        float _2388 = _2372 * _2386;
        float _2390 = _2388 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2392 = _2388 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2394 = _2388 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_78.x = _2390;
        out.m_78.y = _2392;
        out.m_78.z = _2394;
    }
    out.m_80.x = _2306;
    out.m_80.y = _2308;
    out.m_80.z = _2310;
    if (_2290)
    {
        return out;
    }
    out.m_49.x = 0.0;
    float _2396 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2396;
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
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2206 = false;
    bool _605 = false;
    bool _417 = false;
    bool _177 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _94 = in.m_46.w;
    float _96 = trunc(_94);
    int _99 = int(_96);
    bool _103 = _99 >= 1;
    float _105 = 0.0;
    if (!_103)
    {
        _105 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _107 = _105;
    if (!_103)
    {
        out.m_49.x = 0.0;
    }
    int _109 = 0;
    if (!_103)
    {
        float _111 = _107 * 5.0;
        _109 = as_type<int>(_111);
    }
    int _113 = _109;
    int _115 = _113;
    if (!_103)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2452 = as_type<float>(_113);
        out.gl_Position.z = _2452;
    }
    if (!_103)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _117 = in.m_51.w;
    bool _119 = _117 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _121 = isnan(_117);
    bool _123 = _119 || _121;
    bool _125 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _127 = _123 || _125;
    float _129 = -_117;
    float _131 = _129 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _133 = 0.0;
    float _135 = _131;
    if (_127)
    {
        float _137 = float(_99);
        _133 = _137;
    }
    float _139 = _133;
    bool _141 = _131 >= _139;
    bool _143 = !_127;
    bool _145 = _141 || _143;
    float _147 = 0.0;
    if (_145)
    {
        _147 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _149 = _147;
    if (_145)
    {
        out.m_49.x = 0.0;
    }
    if (_145)
    {
        float _151 = _149 * 5.0;
        _115 = as_type<int>(_151);
    }
    int _153 = _115;
    if (_145)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2521 = as_type<float>(_153);
        out.gl_Position.z = _2521;
    }
    if (_145)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _155 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _157 = !_155;
    float _175;
    if (!_157)
    {
        float _159 = in.m_53.x;
        float _161 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _163 = _159 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _165 = fma(_163, (*spvDescriptorSet0.vp_c9)._m0[12].x, _131);
        float _167 = _165 * _161;
        float _169 = floor(_167);
        float _171 = -_169;
        float _173 = _167 + _171;
        _175 = _173;
        _177 = true;
    }
    else
    {
        float _179 = float(_99);
        float _181 = 1.0 / _179;
        float _183 = _131 * _181;
        _175 = _183;
    }
    _177 = false;
    float _185 = _175;
    float _187 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _189 = _185 + _187;
    float _191 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _193 = _185 + _191;
    float _195 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _197 = _185 + _195;
    float _199 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _201 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _199;
    float _203 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _205 = _203 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _207 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _209 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _207;
    float _211 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _213 = _211 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _215 = 1.0 / _201;
    bool _217 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _219 = 1.0 / _209;
    float _221 = 1.0 / _205;
    float _223 = _193 * _215;
    float _225 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _227 = _185 + _225;
    float _229 = 1.0 / _213;
    float _231 = _189 * _219;
    bool _233 = _185 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _235 = isnan(_185);
    bool _237 = _233 || _235;
    bool _239 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _241 = _237 || _239;
    float _243 = float(_241);
    float _245 = -_243;
    float _247 = _245 + 1.0;
    float _249 = _197 * _221;
    bool _251 = _185 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _253 = isnan(_185);
    bool _255 = _251 || _253;
    bool _257 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _259 = _255 || _257;
    float _261 = float(_259);
    bool _263 = _185 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _265 = isnan(_185);
    bool _267 = _263 || _265;
    bool _269 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _271 = _267 || _269;
    float _273 = float(_271);
    float _275 = _261 * _247;
    bool _277 = _185 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _279 = isnan(_185);
    bool _281 = _277 || _279;
    bool _283 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _285 = _281 || _283;
    float _287 = float(_285);
    float _289 = _227 * _229;
    float _291 = -_261;
    float _293 = _291 + 1.0;
    bool _295 = _185 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _297 = isnan(_185);
    bool _299 = _295 || _297;
    bool _301 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _303 = _299 || _301;
    float _305 = float(_303);
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _309 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _307;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _313 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _311;
    float _315 = _273 * _293;
    float _317 = -_273;
    float _319 = _317 + 1.0;
    float _321 = fma(_309, _223, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _323 = fma(_313, _223, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _327 = _325 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _329 = _287 * _319;
    float _331 = -_287;
    float _333 = _331 + 1.0;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _337 = _335 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _339 = -_305;
    float _341 = _339 + 1.0;
    float _343 = fma(_327, _249, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _345 = _305 * _333;
    float _347 = fma(_337, _249, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _351 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _349;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _355 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _353;
    float _357 = _321 * _345;
    float _359 = _323 * _345;
    float _361 = fma(_351, _231, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _363 = fma(_355, _231, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _365 = fma(_341, (*spvDescriptorSet0.vp_c9)._m0[143].x, _357);
    float _367 = fma(_341, (*spvDescriptorSet0.vp_c9)._m0[143].y, _359);
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _371 = _369 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _375 = _373 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _377 = fma(_347, _329, _365);
    float _379 = fma(_343, _329, _367);
    float _381 = fma(_371, _289, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _383 = fma(_375, _289, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _385 = fma(_361, _315, _377);
    float _387 = fma(_363, _315, _379);
    float _389 = fma(_381, _275, _385);
    float _391 = fma(_383, _275, _387);
    float _393 = fma(_243, (*spvDescriptorSet0.vp_c9)._m0[147].x, _389);
    float _395 = fma(_243, (*spvDescriptorSet0.vp_c9)._m0[147].y, _391);
    bool _397 = !_217;
    float _415;
    if (!_397)
    {
        float _399 = in.m_53.x;
        float _401 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _403 = _399 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _405 = fma(_403, (*spvDescriptorSet0.vp_c9)._m0[11].y, _131);
        float _407 = _405 * _401;
        float _409 = floor(_407);
        float _411 = -_409;
        float _413 = _407 + _411;
        _415 = _413;
        _417 = true;
    }
    else
    {
        float _419 = float(_99);
        float _421 = 1.0 / _419;
        float _423 = _131 * _421;
        _415 = _423;
    }
    _417 = false;
    float _425 = _415;
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _429 = _425 + _427;
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _433 = _431 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _437 = _435 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _439 = _425 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _441 = isnan(_425);
    bool _443 = _439 || _441;
    bool _445 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _447 = _443 || _445;
    float _449 = float(_447);
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _453 = _451 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _455 = _425 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _457 = isnan(_425);
    bool _459 = _455 || _457;
    bool _461 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _463 = _459 || _461;
    float _465 = float(_463);
    float _467 = 1.0 / _433;
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _471 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _469;
    float _473 = -_449;
    float _475 = _473 + 1.0;
    bool _477 = _425 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _479 = isnan(_425);
    bool _481 = _477 || _479;
    bool _483 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _485 = _481 || _483;
    float _487 = float(_485);
    bool _489 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _491 = 1.0 / _437;
    float _493 = 1.0 / _453;
    float _495 = _471 * _467;
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _499 = _497 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _501 = _465 * _475;
    float _503 = -_465;
    float _505 = _503 + 1.0;
    float _507 = fma(_495, _429, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _511 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _509;
    float _513 = _487 * _505;
    float _515 = _499 * _491;
    float _517 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _519 = _425 + _517;
    bool _521 = _425 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _523 = isnan(_425);
    bool _525 = _521 || _523;
    bool _527 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _529 = _525 || _527;
    float _531 = float(_529);
    float _533 = _507 * _513;
    float _535 = -_487;
    float _537 = _535 + 1.0;
    float _539 = fma(_515, _519, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _543 = _425 + _541;
    float _545 = _511 * _493;
    float _547 = -_531;
    float _549 = _547 + 1.0;
    float _551 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[115].x, _533);
    float _553 = fma(_545, _543, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _555 = _449 * _549;
    float _557 = fma(_539, _501, _551);
    float _559 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _561 = in.m_55.x;
    float _563 = in.m_55.y;
    float _565 = fma(_553, _555, _557);
    float _567 = _559 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _569 = fma(_531, (*spvDescriptorSet0.vp_c9)._m0[118].x, _565);
    float _571 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _573 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _575 = _569 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _577 = _571 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _579 = _573 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_57.x = _567;
    out.m_57.y = _577;
    out.m_57.z = _579;
    out.m_57.w = _575;
    float _581 = _395 * _563;
    float _583 = _393 * _561;
    bool _585 = !_489;
    float _603;
    if (!_585)
    {
        float _587 = in.m_53.x;
        float _589 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _591 = _587 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _593 = fma(_591, (*spvDescriptorSet0.vp_c9)._m0[11].w, _131);
        float _595 = _593 * _589;
        float _597 = floor(_595);
        float _599 = -_597;
        float _601 = _595 + _599;
        _603 = _601;
        _605 = true;
    }
    else
    {
        float _607 = float(_99);
        float _609 = 1.0 / _607;
        float _611 = _131 * _609;
        _603 = _611;
    }
    _605 = false;
    float _613 = _603;
    float _615 = in.m_53.x;
    float _617 = in.m_53.y;
    float _619 = in.m_53.z;
    float _621 = in.m_53.w;
    float _623 = _583 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _625 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _627 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _629 = _627 != 0;
    int _631 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _633 = _631 != 0;
    int _635 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _637 = _635 != 0;
    float _639 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _641 = !_633;
    int _643 = _641 ? 0 : 1;
    int _645 = abs(_643);
    float _647 = _619 * 2.0;
    float _649 = _615 * 2.0;
    float _651 = _615 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _653 = _617 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _655 = floor(_647);
    float _657 = _617 * 2.0;
    float _659 = -_625;
    float _661 = fma(_651, 2.0, _659);
    float _663 = _617 + _615;
    bool _665 = !_629;
    int _667 = _665 ? 0 : 1;
    float _669 = fma(_653, -2.0, _639);
    float _671 = -_131;
    float _673 = fma(_671, (*spvDescriptorSet0.vp_c9)._m0[76].x, _661);
    float _675 = _663 + (-1.0);
    float _677 = floor(_649);
    float _679 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[76].y, _669);
    float _681 = fma(_675, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _683 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _685 = log2(_683);
    bool _687 = _655 > 0.0;
    bool _689 = _655 >= 0.0;
    bool _691 = isnan(_655);
    bool _693 = _689 || _691;
    bool _695 = isnan(0.0);
    bool _697 = _693 || _695;
    int _699 = abs(_667);
    int _701 = _697 ? 0 : 1;
    float _703 = floor(_657);
    bool _705 = _677 > 0.0;
    bool _707 = _677 >= 0.0;
    bool _709 = isnan(_677);
    bool _711 = _707 || _709;
    bool _713 = isnan(0.0);
    bool _715 = _711 || _713;
    int _717 = ~_701;
    int _719 = _717 + 1;
    int _721 = _719 + 1;
    float _723 = _685 * _131;
    int _725 = _721;
    if (!_687)
    {
        int _727 = ~_701;
        int _729 = _727 + 1;
        _725 = _729;
    }
    int _731 = _725;
    int _733 = _715 ? 0 : 1;
    float _735 = float(_699);
    float _737 = exp2(_723);
    float _739 = float(_731);
    int _741 = ~_733;
    int _743 = _741 + 1;
    int _745 = _743 + 1;
    int _747 = _745;
    if (!_705)
    {
        int _749 = ~_733;
        int _751 = _749 + 1;
        _747 = _751;
    }
    int _753 = _747;
    float _755 = _735 * _739;
    bool _757 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _759 = isnan(1.0);
    bool _761 = _757 || _759;
    bool _763 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _765 = _761 || _763;
    float _767 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _769 = 1.0 + _767;
    float _771 = in.m_59.x;
    float _773 = in.m_59.y;
    float _775 = in.m_59.z;
    float _777 = _755 * (-2.0);
    bool _779 = _703 > 0.0;
    float _781 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _783 = 1.0 / _769;
    float _785 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _787 = _703 >= 0.0;
    bool _789 = isnan(_703);
    bool _791 = _787 || _789;
    bool _793 = isnan(0.0);
    bool _795 = _791 || _793;
    float _797 = fma(_615, (*spvDescriptorSet0.vp_c9)._m0[78].z, _781);
    bool _799 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _801 = isnan(0.0);
    bool _803 = _799 || _801;
    bool _805 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _807 = _803 || _805;
    float _809 = fma(_617, (*spvDescriptorSet0.vp_c9)._m0[78].w, _785);
    float _811 = -_737;
    float _813 = _811 + 1.0;
    int _815 = _795 ? 0 : 1;
    float _817 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].z, _797);
    float _819 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].w, _809);
    float _821 = _807 ? _813 : 0.0;
    int _823 = ~_815;
    int _825 = _823 + 1;
    int _827 = _825 + 1;
    int _829 = _827;
    if (!_779)
    {
        int _831 = ~_815;
        int _833 = _831 + 1;
        _829 = _833;
    }
    int _835 = _829;
    if (_765)
    {
        float _837 = _821 * _783;
        _135 = _837;
    }
    float _839 = _135;
    float _841 = float(_645);
    float _843 = _615 + (-0.5);
    float _845 = float(_753);
    bool _847 = !_637;
    int _849 = _847 ? 0 : 1;
    float _851 = float(_835);
    float _853 = _841 * _845;
    int _855 = abs(_849);
    float _857 = fma(_777, _771, _771);
    float _859 = _617 + _619;
    float _861 = fma(_681, _777, _681);
    float _863 = fma(_843, (*spvDescriptorSet0.vp_c9)._m0[196].x, _857);
    float _865 = _859 + (-1.0);
    float _867 = float(_855);
    float _869 = _853 * (-2.0);
    float _871 = fma(_861, _839, _863);
    float _873 = fma(_865, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _875 = _867 * _851;
    float _877 = _871 * 0.15915493667125701904296875;
    float _879 = _617 + (-0.5);
    float _881 = fma(_869, _773, _773);
    float _883 = fma(_873, _869, _873);
    float _885 = _619 + _615;
    float _887 = as_type<float>(int(gl_VertexIndex));
    float _889 = fma(_879, (*spvDescriptorSet0.vp_c9)._m0[196].y, _881);
    float _891 = _875 * (-2.0);
    float _893 = _885 + (-1.0);
    float _895 = _877 * 6.283185482025146484375;
    float _897 = cos(_895);
    float _899 = fma(_883, _839, _889);
    float _901 = fma(_891, _775, _775);
    float _903 = fma(_893, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _905 = _619 + (-0.5);
    float _907 = _899 * 0.15915493667125701904296875;
    float _909 = fma(_903, _891, _903);
    float _911 = fma(_905, (*spvDescriptorSet0.vp_c9)._m0[196].z, _901);
    float _913 = _907 * 6.283185482025146484375;
    float _915 = sin(_913);
    float _917 = _581 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _919 = fma(_909, _839, _911);
    float _921 = in.m_46.x;
    float _923 = in.m_46.y;
    float _925 = in.m_46.z;
    float _927 = _919 * 0.15915493667125701904296875;
    float _929 = _907 * 6.283185482025146484375;
    float _931 = cos(_929);
    int _933 = as_type<int>(_887) & 1;
    bool _935 = _933 != 0;
    int _937 = as_type<int>(_887) & 2;
    bool _939 = _937 != 0;
    float _941 = _877 * 6.283185482025146484375;
    float _943 = sin(_941);
    bool _945 = !_939;
    float _947 = _945 ? (-0.5) : 0.5;
    float _949 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    bool _951 = !_935;
    float _953 = _951 ? (-0.5) : 0.5;
    bool _955 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _957 = isnan(0.5);
    bool _959 = _955 || _957;
    bool _961 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _963 = _959 || _961;
    float _965 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _947);
    float _967 = _927 * 6.283185482025146484375;
    float _969 = cos(_967);
    float _971 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _953);
    float _973 = _917 * _965;
    float _975 = _897 * _931;
    float _977 = _897 * _915;
    float _979 = _623 * _971;
    float _981 = _927 * 6.283185482025146484375;
    float _983 = sin(_981);
    float _985 = _943 * _915;
    float _987 = _943 * _931;
    float _989 = _897 * _969;
    float _991 = _943 * _969;
    float _993 = _931 * _969;
    float _995 = _915 * _969;
    float _997 = _989 * _973;
    float _999 = _991 * _973;
    float _1001 = fma(_983, _975, _985);
    float _1003 = -_977;
    float _1005 = fma(_983, _987, _1003);
    float _1007 = -_987;
    float _1009 = fma(_983, _977, _1007);
    float _1011 = -_973;
    float _1013 = _983 * _1011;
    float _1015 = fma(_1001, _979, _997);
    float _1017 = fma(_983, _985, _975);
    float _1019 = fma(_1005, _979, _999);
    float _1021 = fma(_993, _979, _1013);
    float _1023 = fma(_1009, _949, _1015);
    float _1025 = _923 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1027 = fma(_995, _949, _1021);
    float _1029 = _1023 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1031 = fma(_1017, _949, _1019);
    float _1033 = _923 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1035 = fma(_921, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1025);
    float _1037 = _1023 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1039 = fma(_1027, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1029);
    float _1041 = fma(_921, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1033);
    float _1043 = fma(_925, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1035);
    float _1045 = fma(_1027, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1037);
    float _1047 = fma(_1031, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1039);
    float _1049 = fma(_925, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1041);
    float _1051 = _1043 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1053 = fma(_1031, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1045);
    float _1055 = _1047 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1057 = _1049 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1059 = _923 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1061 = _1053 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1063 = _1051 + _1055;
    float _1065 = fma(_921, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1059);
    float _1067 = _1057 + _1061;
    float _1069 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1071 = _1063 + _1069;
    float _1073 = fma(_925, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1065);
    float _1075 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1077 = _1067 + _1075;
    float _1079 = _1071 * _1071;
    float _1081 = _1073 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1083 = fma(_1077, _1077, _1079);
    float _1085 = _1023 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1087 = sqrt(_1083);
    float _1089 = fma(_1027, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1085);
    float _1091 = fma(_1031, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1089);
    float _1093 = _1091 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1095 = _1081 + _1093;
    bool _1097 = _1087 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1099 = _861;
    float _1101 = _1063;
    float _1103 = _1067;
    float _1105 = _1023;
    float _1107 = _1029;
    if (!_1097)
    {
        _1099 = _1095;
    }
    float _1109 = _1099;
    bool _1111 = !_1097;
    float _1113 = _1109;
    if (!_1111)
    {
        float _1115 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1117 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1119 = _1087 + _1117;
        float _1121 = _1095 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1123 = rsqrt(_1083);
        float _1125 = _1119 * _1115;
        float _1127 = _1125 * 0.15915493667125701904296875;
        float _1129 = _1127 * 6.283185482025146484375;
        float _1131 = cos(_1129);
        float _1133 = _1127 * 6.283185482025146484375;
        float _1135 = sin(_1133);
        float _1137 = _1131 + (-1.0);
        float _1139 = _1137 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1141 = fma(_1135, _1121, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1143 = fma(_1095, _1131, _1139);
        float _1145 = _1123 * _1141;
        float _1147 = fma(_1077, _1145, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1149 = fma(_1071, _1145, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1113 = _1143;
        _1101 = _1149;
        _1103 = _1147;
    }
    float _1151 = _1113;
    float _1153 = _1101;
    float _1155 = _1103;
    float _1157 = _1151;
    float _1159 = _1155;
    float _1161 = _1153;
    if (!_963)
    {
        float _1163 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1165 = _1081 + _1163;
        float _1167 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1169 = _1057 + _1167;
        float _1171 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1173 = -_1081;
        float _1175 = _1173 + _1151;
        float _1177 = _1165 * _1165;
        float _1179 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1181 = _1051 + _1179;
        float _1183 = -_1051;
        float _1185 = _1183 + _1153;
        float _1187 = fma(_1169, _1169, _1177);
        float _1189 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1191 = fma(_1181, _1181, _1187);
        float _1193 = sqrt(_1191);
        float _1195 = _1171 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1197 = precise::min(_1193, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1199 = _1197 * _1189;
        float _1201 = -_1057;
        float _1203 = _1201 + _1155;
        float _1205 = _1195 * _1199;
        float _1207 = fma(_1203, _1205, _1057);
        float _1209 = fma(_1175, _1205, _1081);
        float _1211 = fma(_1185, _1205, _1051);
        _1157 = _1209;
        _1159 = _1207;
        _1161 = _1211;
    }
    float _1213 = _1157;
    float _1215 = _1159;
    float _1217 = _1161;
    float _1219 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1221 = _1213 + _1219;
    float _1223 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1225 = _1215 + _1223;
    float _1227 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1229 = _1217 + _1227;
    float _1231 = _1213 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1233 = _1221 * _1221;
    float _1235 = fma(_1215, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1231);
    float _1237 = fma(_1225, _1225, _1233);
    float _1239 = fma(_1217, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1235);
    float _1241 = fma(_1229, _1229, _1237);
    float _1243 = _1239 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1245 = rsqrt(_1241);
    float _1247 = sqrt(_1241);
    float _1249 = _1245 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1251 = _1225 * _1249;
    float _1253 = _1229 * _1249;
    float _1255 = _1251 * _1251;
    float _1257 = _1253 * _1253;
    float _1259 = _1255 + _1257;
    float _1261 = sqrt(_1259);
    bool _1263 = _1261 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1265 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1267 = _1261 + _1265;
    float _1269 = _1245;
    float _1271 = _1259;
    float _1273 = _1267;
    float _1275 = _1221;
    if (_1263)
    {
        float _1277 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1269 = _1277;
    }
    float _1279 = _1269;
    if (_1263)
    {
        float _1281 = rsqrt(_1259);
        _1271 = _1281;
    }
    float _1283 = _1271;
    float _1285 = _1283;
    if (_1263)
    {
        float _1287 = _1267 * _1279;
        _1273 = _1287;
    }
    float _1289 = _1273;
    if (_1263)
    {
        float _1291 = _1289 * 0.15915493667125701904296875;
        _1105 = _1291;
    }
    float _1293 = _1105;
    float _1295 = _1229;
    float _1297 = _1293;
    if (_1263)
    {
        float _1299 = _1293 * 6.283185482025146484375;
        float _1301 = sin(_1299);
        _1295 = _1301;
    }
    float _1303 = _1295;
    float _1305 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1307 = precise::max(0.0, _1305);
    float _1309 = _1279;
    float _1311 = _1307;
    if (_1263)
    {
        float _1313 = _1293 * 6.283185482025146484375;
        float _1315 = cos(_1313);
        _1309 = _1315;
    }
    float _1317 = _1309;
    float _1319 = -_1249;
    float _1321 = -_1307;
    float _1323 = fma(_1221, _1319, _1321);
    float _1325 = _1323;
    if (_1263)
    {
        float _1327 = _1323 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1275 = _1327;
    }
    float _1329 = _1275;
    float _1331 = _1329;
    if (!_1263)
    {
        _1297 = _1257;
    }
    float _1333 = _1297;
    float _1335 = _1303;
    float _1337 = _1333;
    if (_1263)
    {
        float _1339 = fma(_1303, _1329, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1331 = _1339;
    }
    float _1341 = _1331;
    if (!_1263)
    {
        _1335 = _1251;
    }
    float _1343 = _1335;
    float _1345 = _1343;
    float _1347 = _1317;
    if (_1263)
    {
        float _1349 = _1317 + (-1.0);
        _1311 = _1349;
    }
    float _1351 = _1311;
    float _1353 = _1351;
    if (_1263)
    {
        float _1355 = _1283 * _1341;
        _1107 = _1355;
    }
    float _1357 = _1107;
    if (!_1263)
    {
        _1285 = _1255;
    }
    float _1359 = _1285;
    float _1361 = _1359;
    if (_1263)
    {
        float _1363 = _1351 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1353 = _1363;
    }
    float _1365 = _1353;
    if (_1263)
    {
        float _1367 = _1251 * _1357;
        _1345 = _1367;
    }
    float _1369 = _1345;
    float _1371 = _1213 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1263)
    {
        float _1373 = fma(_1323, _1317, _1365);
        _1325 = _1373;
    }
    float _1375 = _1325;
    if (!_1263)
    {
        _1347 = _1253;
    }
    float _1377 = _1347;
    float _1379 = _1377;
    if (_1263)
    {
        float _1381 = _1253 * _1357;
        _1379 = _1381;
    }
    float _1383 = _1379;
    if (_1263)
    {
        float _1385 = _1369 * _1369;
        _1361 = _1385;
    }
    float _1387 = _1361;
    float _1389 = _1213 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1391 = fma(_1215, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1371);
    if (_1263)
    {
        float _1393 = _1383 * _1383;
        _1337 = _1393;
    }
    float _1395 = _1337;
    float _1397 = fma(_1375, _1375, _1387);
    float _1399 = fma(_1215, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1389);
    float _1401 = fma(_1217, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1391);
    float _1403 = _1397 + _1395;
    float _1405 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1407 = fma(_1247, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1405);
    float _1409 = precise::clamp(_1407, 0.0, 1.0);
    float _1411 = fma(_1057, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1413 = rsqrt(_1403);
    float _1415 = _1401 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1417 = -_1409;
    float _1419 = _1417 + 1.0;
    float _1421 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1423 = _1415 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1425 = abs(_1419);
    float _1427 = log2(_1425);
    float _1429 = _1213 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1431 = fma(_1051, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1433 = -_1423;
    float _1435 = fma(_1433, _1421, 1.0);
    float _1437 = fma(_1215, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1429);
    float _1439 = _1413 * _1369;
    float _1441 = fma(_1217, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1399);
    float _1443 = _1413 * _1375;
    float _1445 = fma(_1217, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1437);
    float _1447 = _1439 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1449 = _1441 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1451 = floor(_1411);
    float _1453 = _1413 * _1383;
    float _1455 = -_1447;
    float _1457 = fma(_1443, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1455);
    float _1459 = _1445 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1461 = _1449 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1463 = _1427 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1465 = -_1453;
    float _1467 = fma(_1465, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1457);
    float _1469 = floor(_1431);
    float _1471 = fma(_1459, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1461);
    float _1473 = fma(_1467, -0.5, 0.5);
    float _1475 = fma(_1467, 0.5, 0.5);
    float _1477 = fma(_1415, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1471);
    float _1479 = -_1451;
    float _1481 = _1411 + _1479;
    float _1483 = fma(_1243, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1477);
    float _1485 = exp2(_1463);
    float _1487 = _1449 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1489 = _1449 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1491 = -_1469;
    float _1493 = _1431 + _1491;
    float _1495 = fma(_1459, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1489);
    float _1497 = log2(_1435);
    float _1499 = fma(_1475, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1501 = fma(_1459, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1487);
    float _1503 = fma(_1415, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1495);
    float _1505 = fma(_1475, _1499, -0.212114393711090087890625);
    float _1507 = fma(_1415, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1501);
    float _1509 = fma(_1243, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1503);
    float _1511 = 1.0 / _1483;
    float _1513 = sqrt(_1473);
    float _1515 = fma(_1243, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1507);
    float2 _4682 = float2(_1481, _1493);
    float _1517 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4682, float2(0.0), isnan(_4682)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4682, float2(0.0), isnan(_4682)), level(0.0)).x;
    float _1519 = fma(_1475, _1505, 1.570728778839111328125);
    float _1521 = _1515 * _1511;
    float _1523 = _1443 + 1.0;
    float _1525 = fma(_1521, 0.5, 0.5);
    float _1527 = -_1443;
    float _1529 = fma(_1485, _1523, _1527);
    float _1531 = _1497 * 0.693147182464599609375;
    float _1533 = _1509 * _1511;
    float _1535 = _1513 * 0.636619746685028076171875;
    float _1537 = fma(_1529, 0.5, 0.5);
    float _1539 = _1531 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1541 = fma(_1533, -0.5, 0.5);
    float _1543 = -_1519;
    float _1545 = fma(_1535, _1543, 1.0);
    float3 _4732 = float3(_1525, _1541, _1539);
    float _1547 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4732, float3(0.0), isnan(_4732)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4732, float3(0.0), isnan(_4732)), level(0.0)).x;
    float3 _4743 = float3(_1525, _1541, _1539);
    float4 _1550 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4743, float3(0.0), isnan(_4743)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4743, float3(0.0), isnan(_4743)), level(0.0)).xyzw;
    float _1552 = _1550.x;
    float _1554 = _1550.y;
    float _1556 = _1550.z;
    float _1558 = _1550.w;
    float2 _4759 = float2(_1545, _1537);
    float3 _1562 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4759, float2(0.0), isnan(_4759)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4759, float2(0.0), isnan(_4759)), level(0.0)).xyz;
    float _1564 = _1562.x;
    float _1566 = _1562.y;
    float _1568 = _1562.z;
    float _1570 = _1081 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1572 = -_817;
    float _1574 = _1572 + 1.0;
    bool _1576 = _621 > 0.5;
    float _1578 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1580 = _1578 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1582 = _615 > 0.5;
    float _1584 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1586 = _1584 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1588 = _1081 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1590 = 1.0 / _1580;
    bool _1592 = _617 > 0.5;
    float _1594 = fma(_1057, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1588);
    float _1596 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1598 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1596;
    float _1600 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1602 = _1600 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    int _1604 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1606 = _1604 != 0;
    float _1608 = fma(_1057, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1570);
    float _1610 = 1.0 / _1586;
    int _1612 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1614 = _1612 != 0;
    float _1616 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1618 = _1616 + (*spvDescriptorSet0.vp_c9)._m0[135].w;
    int _1620 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1622 = _1620 != 0;
    float _1624 = fma(_1051, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1608);
    int _1626 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1628 = _1626 != 0;
    float _1630 = fma(_1051, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1594);
    float _1632 = -_953;
    int _1634 = _1582 ? as_type<int>(_1632) : as_type<int>(_953);
    float _1636 = _1602 * _1590;
    float _1638 = 1.0 / _1618;
    bool _1640 = _613 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1642 = isnan(_613);
    bool _1644 = _1640 || _1642;
    bool _1646 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1648 = _1644 || _1646;
    float _1650 = float(_1648);
    float _1652 = -_819;
    float _1654 = _1652 + 1.0;
    bool _1656 = !_1606;
    float _1658 = _1656 ? _953 : as_type<float>(_1634);
    float _1660 = _1427 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1662 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1664 = isnan(0.5);
    bool _1666 = _1662 || _1664;
    bool _1668 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1670 = _1666 || _1668;
    float _1672 = _1598 * _1610;
    float _1674 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1676 = _1674 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1678 = _613 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1680 = isnan(_613);
    bool _1682 = _1678 || _1680;
    bool _1684 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1686 = _1682 || _1684;
    float _1688 = float(_1686);
    float _1690 = -_1650;
    float _1692 = _1690 + 1.0;
    bool _1694 = _613 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1696 = isnan(_613);
    bool _1698 = _1694 || _1696;
    bool _1700 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1702 = _1698 || _1700;
    float _1704 = float(_1702);
    float _1706 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1708 = _1688 * _1692;
    float _1710 = -_1688;
    float _1712 = _1710 + 1.0;
    float _1714 = _1624 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1716 = -_1704;
    float _1718 = _1716 + 1.0;
    bool _1720 = _619 > 0.5;
    float _1722 = _1704 * _1712;
    float _1724 = -(*spvDescriptorSet0.vp_c9)._m0[134].x;
    float _1726 = _1724 + (*spvDescriptorSet0.vp_c9)._m0[135].x;
    float _1728 = 1.0 / _1714;
    bool _1730 = _613 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1732 = isnan(_613);
    bool _1734 = _1730 || _1732;
    bool _1736 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1738 = _1734 || _1736;
    float _1740 = float(_1738);
    float _1742 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1744 = _613 + _1742;
    float _1746 = _1726 * _1638;
    float _1748 = _1630 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1750 = _613 >= (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _1752 = isnan(_613);
    bool _1754 = _1750 || _1752;
    bool _1756 = isnan((*spvDescriptorSet0.vp_c9)._m0[135].w);
    bool _1758 = _1754 || _1756;
    float _1760 = float(_1758);
    float _1762 = fma(_1672, _1744, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1764 = _1740 * _1718;
    float _1766 = 1.0 / _1676;
    float _1768 = _1748 + _1714;
    float _1770 = -_1760;
    float _1772 = _1770 + 1.0;
    float _1774 = _1762 * _1764;
    float _1776 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1778 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1776;
    float _1780 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1782 = _613 + _1780;
    float _1784 = _1650 * _1772;
    float _1786 = -_1740;
    float _1788 = _1786 + 1.0;
    float _1790 = _1768 * _1728;
    float _1792 = _1790 * 0.5;
    float _1794 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1796 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1798 = _613 + _1796;
    float _1800 = fma(_1636, _1782, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1802 = fma(_1788, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1774);
    float _1804 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1806 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1804);
    float _1808 = -_947;
    int _1810 = _1592 ? as_type<int>(_1808) : as_type<int>(_947);
    float _1812 = _1778 * _1766;
    float _1814 = fma(_1800, _1722, _1802);
    float _1816 = _1706 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1818 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1820 = fma(_1812, _1798, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1822 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1824 = _613 + _1822;
    float _1826 = -_953;
    int _1828 = _1720 ? as_type<int>(_1826) : as_type<int>(_953);
    float _1830 = _1449 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1832 = fma(_1820, _1708, _1814);
    bool _1834 = !_1614;
    float _1836 = _1834 ? _947 : as_type<float>(_1810);
    float _1838 = fma(_1746, _1824, (*spvDescriptorSet0.vp_c9)._m0[134].x);
    float _1840 = 1.0 / _1806;
    float _1842 = _1794 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1844 = _1658 + 0.5;
    float _1846 = _1836 + (-0.5);
    float _1848 = fma(_1838, _1784, _1832);
    bool _1850 = !_1622;
    float _1852 = _1850 ? _953 : as_type<float>(_1828);
    float _1854 = fma(_1842, _1844, _673);
    float _1856 = -_1816;
    float _1858 = -_679;
    float _1860 = fma(_1856, _1846, _1858);
    float _1862 = fma(_1760, (*spvDescriptorSet0.vp_c9)._m0[135].x, _1848);
    float _1864 = -_947;
    int _1866 = _1576 ? as_type<int>(_1864) : as_type<int>(_947);
    float _1868 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1870 = -_1574;
    float _1872 = fma(_1658, _1870, _1854);
    float _1874 = _1852 + 0.5;
    bool _1876 = !_1628;
    float _1878 = _1876 ? _947 : as_type<float>(_1866);
    float _1880 = fma(_1836, _1654, _1860);
    float _1882 = _1654;
    float _1884 = _1862;
    float _1886 = _1509;
    float _1888 = _1515;
    if (!_1670)
    {
        _1882 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _1890 = _1882;
    float _1892 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1894 = _1840 * _1892;
    float _1896 = _1874 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1898 = -_1878;
    float _1900 = _1898 + 0.5;
    float _1902 = abs(_1894);
    float _1904 = log2(_1902);
    float _1906 = _1896 * _1818;
    float _1908 = _1900 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1910 = _1890;
    if (!_1670)
    {
        float _1912 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1914 = _1890 + _1912;
        _1910 = _1914;
    }
    float _1916 = _1910;
    float _1918 = _989 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1920 = _1908 * _1868;
    float _1922 = as_type<float>(_1810);
    float _1924 = _1916;
    if (!_1670)
    {
        float _1926 = 1.0 / _1916;
        _1922 = _1926;
    }
    float _1928 = _1922;
    float _1930 = _989 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1932 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1934 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1936 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    out.m_64.x = _1872;
    out.m_64.y = _1880;
    out.m_64.z = _1906;
    out.m_64.w = _1920;
    float _1938 = _989 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1940 = -_983;
    float _1942 = fma(_1940, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1918);
    float _1944 = _1904 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    if (!_1670)
    {
        float _1946 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1948 = _1894 + _1946;
        _1924 = _1948;
    }
    float _1950 = _1924;
    float _1952 = _1862 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    if (_1670)
    {
        _1884 = 1.0;
    }
    float _1954 = _1884;
    float _1956 = _1932 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1958 = _1936 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1960 = exp2(_1944);
    float _1962 = _1934 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1964 = _1954;
    if (!_1670)
    {
        float _1966 = _1950 * _1928;
        float _1968 = precise::clamp(_1966, 0.0, 1.0);
        _1964 = _1968;
    }
    float _1970 = _1964;
    float _1972 = -_983;
    float _1974 = fma(_1972, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1930);
    float _1976 = _1001 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1978 = -_983;
    float _1980 = fma(_1978, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1938);
    float _1982 = fma(_991, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1942);
    float _1984 = fma(_991, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1974);
    float _1986 = fma(_993, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1976);
    float _1988 = _1009 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1990 = _947 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1992 = fma(_991, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1980);
    out.m_66.x = _1956;
    out.m_66.y = _1958;
    out.m_66.z = _1962;
    out.m_66.w = _1952;
    float _1994 = _1990 * _1982;
    float _1996 = fma(_1960, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1998 = precise::clamp(_1996, 0.0, 1.0);
    float _2000 = exp2(_1660);
    float _2002 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1986);
    float _2004 = fma(_1459, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1830);
    bool _2006 = _1894 <= 8000.0;
    bool _2008 = isnan(_1894);
    bool _2010 = _2006 || _2008;
    bool _2012 = isnan(8000.0);
    bool _2014 = _2010 || _2012;
    float _2016 = float(_2014);
    float _2018 = _953 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2020 = _1009 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2022 = fma(_1415, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2004);
    float _2024 = _1009 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2026 = fma(_2018, _2002, _1994);
    bool _2028 = _1247 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2030 = isnan(_1247);
    bool _2032 = _2028 || _2030;
    bool _2034 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2036 = _2032 || _2034;
    float _2038 = fma(_1243, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2022);
    float _2040 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1988);
    float _2042 = _1990 * _1984;
    float _2044 = _1001 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2046 = _1001 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2048 = _1990 * _1992;
    float _2050 = fma(_1998, -2.0, 3.0);
    float _2052 = _1998 * _1998;
    float _2054 = fma(_993, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2044);
    float _2056 = fma(_993, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2046);
    float _2058 = -_2000;
    float _2060 = _2058 + 1.0;
    float _2062 = _2052 * _2050;
    float _2064 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2054);
    float _2066 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2056);
    float _2068 = fma(_1017, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2040);
    float _2070 = -_2062;
    float _2072 = _2070 + 1.0;
    float _2074 = in.m_68.x;
    float _2076 = _2038 + _1483;
    float _2078 = _2060 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2080 = fma(_2072, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2062);
    float _2082 = fma(_2018, _2064, _2042);
    float _2084 = _2076 * 0.5;
    float _2086 = _2016 * _2080;
    float _2088 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2020);
    float _2090 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2024);
    float _2092 = _2086 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2094 = fma(_2018, _2066, _2048);
    out.m_70.z = _2084;
    out.m_70.w = _1483;
    float _2096 = fma(_1017, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2090);
    float _2098 = fma(_1017, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2088);
    float _2100 = _2068 + _2026;
    float _2102 = _2096 + _2094;
    float _2104 = _2098 + _2082;
    out.gl_Position.x = _1515;
    out.gl_Position.y = _1509;
    out.gl_Position.z = _2038;
    out.gl_Position.w = _1483;
    out.m_72.x = _2100;
    out.m_72.y = _2104;
    out.m_72.z = _2102;
    float _2106 = _2038;
    if (!_2036)
    {
        _2106 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2108 = _2106;
    float _2110 = _2108;
    float _2112 = _2108;
    if (!_2036)
    {
        _1886 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2114 = _1886;
    float _2116 = _2114;
    float _2118 = _2114;
    if (!_2036)
    {
        _1888 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2120 = _1888;
    float _2122 = -_1517;
    float _2124 = _2122 + 1.0;
    float _2126 = _2124 * _2092;
    float _2128 = precise::clamp(_2126, 0.0, 1.0);
    float _2130 = -_2128;
    float _2132 = fma(_2130, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2134 = _1970 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2136 = _2132 * _2074;
    float _2138 = _2136 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2140 = _2078 * _1547;
    float _2142 = -_2078;
    float _2144 = _2142 + 1.0;
    out.m_74.x = _2138;
    float _2146 = _1558 * _2140;
    float _2148 = _1568 * _2140;
    float _2150 = _1558 * _2144;
    float _2152 = fma(_1564, _2146, _1552);
    float _2154 = fma(_1566, _2146, _1554);
    float _2156 = fma(_1558, _2148, _1556);
    out.m_76.x = _2152;
    out.m_76.y = _2154;
    out.m_76.z = _2156;
    out.m_76.w = _2150;
    bool _2158 = !_2036;
    float _2160 = _2120;
    float _2162 = _2120;
    if (!_2158)
    {
        bool _2164 = _1247 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2166 = isnan(_1247);
        bool _2168 = _2164 || _2166;
        bool _2170 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2172 = _2168 || _2170;
        if (!_2172)
        {
            float _2174 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2176 = _1247 + _2174;
            float _2178 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2180 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2178;
            float _2182 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2184 = _2182 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2186 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2188 = _2186 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2190 = 1.0 / _2180;
            float _2192 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2194 = _2192 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2196 = _2176 * _2190;
            float _2198 = precise::clamp(_2196, 0.0, 1.0);
            float _2200 = fma(_2198, _2184, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2202 = fma(_2198, _2188, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2204 = fma(_2198, _2194, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _2118 = _2202;
            _2112 = _2200;
            _2162 = _2204;
            _2206 = true;
        }
        else
        {
            bool _2208 = _1247 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2210 = isnan(_1247);
            bool _2212 = _2208 || _2210;
            bool _2214 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2216 = _2212 || _2214;
            if (!_2216)
            {
                _2110 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2218 = _2110;
            _2112 = _2218;
            if (!_2216)
            {
                _2116 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2220 = _2116;
            _2118 = _2220;
            if (!_2216)
            {
                _2160 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2222 = _2160;
            bool _2224 = !_2216;
            _2162 = _2222;
            if (!_2224)
            {
                bool _2226 = _1247 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2228 = isnan(_1247);
                bool _2230 = _2226 || _2228;
                bool _2232 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2234 = _2230 || _2232;
                if (!_2234)
                {
                    float _2236 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2238 = _1247 + _2236;
                    float _2240 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2242 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2240;
                    float _2244 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2246 = _2244 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2248 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2250 = _2248 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2252 = 1.0 / _2242;
                    float _2254 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2256 = _2254 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2258 = _2238 * _2252;
                    float _2260 = precise::clamp(_2258, 0.0, 1.0);
                    float _2262 = fma(_2260, _2246, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2264 = fma(_2260, _2250, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2266 = fma(_2260, _2256, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _2118 = _2264;
                    _2112 = _2262;
                    _2162 = _2266;
                    _2206 = true;
                }
                else
                {
                    _2118 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2112 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2162 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _2206 = false;
    float _2268 = _2118;
    float _2270 = _2112;
    float _2272 = _2162;
    float _2274 = _2134 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_78.x = 0.0;
    float _2276 = _2268 * 0.586610972881317138671875;
    bool _2278 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_49.x = _2274;
    float _2280 = fma(_2270, 0.298911988735198974609375, _2276);
    bool _2282 = _1970 > 0.0;
    bool _2284 = isnan(_1970);
    bool _2286 = _2282 || _2284;
    bool _2288 = isnan(0.0);
    bool _2290 = _2286 || _2288;
    float _2292 = fma(_2272, 0.114477999508380889892578125, _2280);
    float _2294 = -_2292;
    float _2296 = _2294 + _2270;
    float _2298 = -_2292;
    float _2300 = _2298 + _2268;
    float _2302 = -_2292;
    float _2304 = _2302 + _2272;
    float _2306 = fma(_2296, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2292);
    float _2308 = fma(_2300, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2292);
    float _2310 = fma(_2304, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2292);
    bool _2312 = !_2278;
    if (!_2312)
    {
        float _2314 = -_1213;
        float _2316 = _2314 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2318 = -_1215;
        float _2320 = _2318 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2322 = -_1217;
        float _2324 = _2322 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2326 = _2316 * _2316;
        float _2328 = fma(_2320, _2320, _2326);
        float _2330 = fma(_2324, _2324, _2328);
        float _2332 = sqrt(_2330);
        float _2334 = rsqrt(_2330);
        float _2336 = -_2332;
        float _2338 = _2336 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2340 = _2338 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2342 = precise::clamp(_2340, 0.0, 1.0);
        float _2344 = _2320 * _2334;
        float _2346 = _2316 * _2334;
        float _2348 = abs(_2342);
        float _2350 = log2(_2348);
        float _2352 = _2324 * _2334;
        float _2354 = _2344 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2356 = _2104 * _2346;
        float _2358 = -_2346;
        float _2360 = -_2354;
        float _2362 = fma(_2358, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2360);
        float _2364 = fma(_2100, _2344, _2356);
        float _2366 = -_2352;
        float _2368 = fma(_2366, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2362);
        float _2370 = fma(_2102, _2352, _2364);
        float _2372 = precise::clamp(_2370, 0.0, 1.0);
        float _2374 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2376 = _2368 + _2374;
        float _2378 = _2350 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2380 = _2376 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2382 = precise::clamp(_2380, 0.0, 1.0);
        float _2384 = exp2(_2378);
        float _2386 = _2384 * _2382;
        float _2388 = _2372 * _2386;
        float _2390 = _2388 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2392 = _2388 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2394 = _2388 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_78.x = _2390;
        out.m_78.y = _2392;
        out.m_78.z = _2394;
    }
    out.m_80.x = _2306;
    out.m_80.y = _2308;
    out.m_80.z = _2310;
    if (_2290)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_49.x = 0.0;
    float _2396 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2396;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

