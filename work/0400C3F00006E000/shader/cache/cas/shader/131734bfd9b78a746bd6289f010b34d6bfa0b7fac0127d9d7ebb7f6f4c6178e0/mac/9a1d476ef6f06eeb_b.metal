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
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    constant _16* vp_c13 [[id(6)]];
    texture2d<float> vp_t_tcb_28 [[id(7)]];
    sampler vp_t_tcb_28Smplr [[id(8)]];
    texture3d<float> vp_t_tcb_32 [[id(9)]];
    sampler vp_t_tcb_32Smplr [[id(10)]];
    texture3d<float> vp_t_tcb_30 [[id(11)]];
    sampler vp_t_tcb_30Smplr [[id(12)]];
    texture2d<float> vp_t_tcb_1C [[id(13)]];
    sampler vp_t_tcb_1CSmplr [[id(14)]];
    sampler vp_t_tcb_28Smplr_w [[id(15)]];
    sampler vp_t_tcb_32Smplr_w [[id(16)]];
    sampler vp_t_tcb_30Smplr_w [[id(17)]];
    sampler vp_t_tcb_1CSmplr_w [[id(18)]];
    constant dm_border_t* dm_border [[id(19)]];
};

struct main0_out
{
    float4 m_63 [[user(locn0)]];
    float4 m_74 [[user(locn1)]];
    float4 m_51 [[user(locn2)]];
    float4 m_84 [[user(locn3)]];
    float4 m_55 [[user(locn4)]];
    float4 m_72 [[user(locn5)]];
    float4 m_78 [[user(locn6)]];
    float4 m_76 [[user(locn7)]];
    float4 m_82 [[user(locn8)]];
    float4 m_80 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_68 [[attribute(0)]];
    float4 m_70 [[attribute(1)]];
    float4 m_57 [[attribute(2)]];
    float4 m_48 [[attribute(3)]];
    float4 m_53 [[attribute(4)]];
    float4 m_59 [[attribute(5)]];
    float4 m_61 [[attribute(6)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2126 = false;
    bool _1261 = false;
    bool _309 = false;
    bool _213 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _98 = in.m_48.w;
    float _100 = trunc(_98);
    int _103 = int(_100);
    bool _107 = _103 >= 1;
    float _109 = 0.0;
    float _111 = as_type<float>(_103);
    if (!_107)
    {
        _109 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _113 = _109;
    if (!_107)
    {
        out.m_51.x = 0.0;
    }
    int _115 = 0;
    if (!_107)
    {
        float _117 = _113 * 5.0;
        _115 = as_type<int>(_117);
    }
    int _119 = _115;
    int _121 = _119;
    if (!_107)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2426 = as_type<float>(_119);
        out.gl_Position.z = _2426;
    }
    if (!_107)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _123 = in.m_53.w;
    float _125 = float(_103);
    float _127 = 1.0 / _125;
    float _129 = -_123;
    float _131 = _129 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _133 = _123 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _135 = isnan(_123);
    bool _137 = _133 || _135;
    bool _139 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _141 = _137 || _139;
    float _143 = _131 * _127;
    bool _145 = _131 >= _125;
    bool _147 = !_141;
    bool _149 = _145 || _147;
    out.m_55.x = _143;
    float _151 = _143;
    float _153 = _131;
    if (_149)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _155 = _111;
    if (_149)
    {
        out.m_51.x = 0.0;
    }
    if (_149)
    {
        float _157 = _155 * 5.0;
        _121 = as_type<int>(_157);
    }
    int _159 = _121;
    if (_149)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2498 = as_type<float>(_159);
        out.gl_Position.z = _2498;
    }
    if (_149)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _161 = in.m_57.x;
    float _163 = in.m_57.y;
    float _165 = in.m_57.z;
    bool _167 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _169 = _163 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _171 = _163 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _173 = _163 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _175 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[4].x, _169);
    float _177 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[5].x, _171);
    float _179 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[6].x, _173);
    float _181 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[4].z, _175);
    float _183 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[5].z, _177);
    float _185 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[6].z, _179);
    bool _187 = !_167;
    float _189 = _185;
    float _191 = _183;
    float _193 = _181;
    float _211;
    if (!_187)
    {
        float _195 = in.m_59.x;
        float _197 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _199 = _195 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _201 = fma(_199, (*spvDescriptorSet0.vp_c9)._m0[12].x, _131);
        float _203 = _201 * _197;
        float _205 = floor(_203);
        float _207 = -_205;
        float _209 = _203 + _207;
        _211 = _209;
        _213 = true;
    }
    else
    {
        _211 = _143;
    }
    _213 = false;
    float _215 = _211;
    float _217 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _219 = _215 + _217;
    bool _221 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _223 = isnan(_215);
    bool _225 = _221 || _223;
    bool _227 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _229 = _225 || _227;
    float _231 = float(_229);
    float _233 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _235 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _233;
    float _237 = -_231;
    float _239 = _237 + 1.0;
    bool _241 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _243 = isnan(_215);
    bool _245 = _241 || _243;
    bool _247 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _249 = _245 || _247;
    float _251 = float(_249);
    float _253 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _255 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _253;
    bool _257 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _259 = 1.0 / _235;
    float _261 = _251 * _239;
    float _263 = -_251;
    float _265 = _263 + 1.0;
    float _267 = _219 * _259;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _271 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _269;
    float _273 = fma(_255, _267, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _275 = fma(_271, _267, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _277 = _273 * _261;
    float _279 = _275 * _261;
    float _281 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[143].x, _277);
    float _283 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[143].y, _279);
    float _285 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[144].x, _281);
    float _287 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[144].y, _283);
    bool _289 = !_257;
    float _307;
    if (!_289)
    {
        float _291 = in.m_59.x;
        float _293 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _295 = _291 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _297 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[11].y, _131);
        float _299 = _297 * _293;
        float _301 = floor(_299);
        float _303 = -_301;
        float _305 = _299 + _303;
        _307 = _305;
        _309 = true;
    }
    else
    {
        _307 = _143;
    }
    _309 = false;
    float _311 = _307;
    float _313 = in.m_61.x;
    float _315 = in.m_61.y;
    bool _317 = _311 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _319 = isnan(_311);
    bool _321 = _317 || _319;
    bool _323 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _325 = _321 || _323;
    float _327 = float(_325);
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _331 = _329 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _333 = _311 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _335 = isnan(_311);
    bool _337 = _333 || _335;
    bool _339 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _341 = _337 || _339;
    float _343 = float(_341);
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _347 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _345;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _351 = _311 + _349;
    float _353 = -_327;
    float _355 = _353 + 1.0;
    bool _357 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _359 = 1.0 / _331;
    float _361 = _343 * _355;
    float _363 = -_343;
    float _365 = _363 + 1.0;
    float _367 = _287 * _315;
    float _369 = _285 * _313;
    float _371 = _347 * _359;
    float _373 = fma(_371, _351, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _375 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _377 = _373 * _361;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _381 = _375 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _383 = fma(_365, (*spvDescriptorSet0.vp_c9)._m0[115].x, _377);
    float _385 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _387 = _379 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _389 = fma(_327, (*spvDescriptorSet0.vp_c9)._m0[116].x, _383);
    float _391 = _385 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _393 = _389 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_63.x = _391;
    out.m_63.y = _387;
    out.m_63.z = _381;
    out.m_63.w = _393;
    bool _395 = !_357;
    if (!_395)
    {
        float _397 = in.m_59.x;
        float _399 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _401 = _397 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _403 = fma(_401, (*spvDescriptorSet0.vp_c9)._m0[11].z, _131);
        float _405 = _403 * _399;
        float _407 = floor(_405);
        float _409 = -_407;
        float _411 = _405 + _409;
        _151 = _411;
    }
    float _413 = _151;
    float _415 = in.m_59.x;
    float _417 = in.m_59.y;
    float _419 = in.m_59.z;
    float _421 = in.m_59.w;
    float _423 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _425 = log2(_423);
    float _427 = _369 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _429 = as_type<float>(int(gl_VertexIndex));
    bool _431 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _433 = isnan(0.0);
    bool _435 = _431 || _433;
    bool _437 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _439 = _435 || _437;
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _443 = 1.0 + _441;
    bool _445 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _447 = isnan(1.0);
    bool _449 = _445 || _447;
    bool _451 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _453 = _449 || _451;
    float _455 = in.m_68.y;
    float _457 = 1.0 / _443;
    float _459 = _425 * _131;
    float _461 = exp2(_459);
    float _463 = _419 * 2.0;
    float _465 = _415 * 2.0;
    float _467 = floor(_463);
    float _469 = floor(_465);
    float _471 = -_461;
    float _473 = _471 + 1.0;
    float _475 = _439 ? _473 : 0.0;
    bool _477 = _467 > 0.0;
    bool _479 = _467 >= 0.0;
    bool _481 = isnan(_467);
    bool _483 = _479 || _481;
    bool _485 = isnan(0.0);
    bool _487 = _483 || _485;
    if (_453)
    {
        float _489 = _475 * _457;
        _153 = _489;
    }
    float _491 = _153;
    float _493 = _417 + _419;
    int _495 = _487 ? 0 : 1;
    bool _497 = _469 > 0.0;
    float _499 = _493 + (-1.0);
    bool _501 = _469 >= 0.0;
    bool _503 = isnan(_469);
    bool _505 = _501 || _503;
    bool _507 = isnan(0.0);
    bool _509 = _505 || _507;
    float _511 = fma(_499, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _513 = as_type<int>(_429) & 1;
    bool _515 = _513 != 0;
    int _517 = as_type<int>(_429) & 2;
    bool _519 = _517 != 0;
    float _521 = _417 + _415;
    bool _523 = _421 > 0.5;
    float _525 = _521 + (-1.0);
    int _527 = ~_495;
    int _529 = _527 + 1;
    int _531 = _529 + 1;
    int _533 = _509 ? 0 : 1;
    int _535 = _531;
    if (!_477)
    {
        int _537 = ~_495;
        int _539 = _537 + 1;
        _535 = _539;
    }
    int _541 = _535;
    float _543 = _417 * 2.0;
    int _545 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _547 = _545 != 0;
    int _549 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _551 = _549 != 0;
    int _553 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _555 = _553 != 0;
    int _557 = ~_533;
    int _559 = _557 + 1;
    int _561 = _559 + 1;
    float _563 = floor(_543);
    int _565 = _561;
    if (!_497)
    {
        int _567 = ~_533;
        int _569 = _567 + 1;
        _565 = _569;
    }
    int _571 = _565;
    float _573 = in.m_70.x;
    float _575 = in.m_70.y;
    float _577 = in.m_70.z;
    bool _579 = !_547;
    int _581 = _579 ? 0 : 1;
    bool _583 = !_515;
    float _585 = _583 ? (-0.5) : 0.5;
    bool _587 = !_519;
    float _589 = _587 ? (-0.5) : 0.5;
    int _591 = abs(_581);
    bool _593 = !_551;
    int _595 = _593 ? 0 : 1;
    int _597 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _599 = _597 != 0;
    int _601 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _603 = _601 != 0;
    int _605 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _607 = _605 != 0;
    int _609 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _611 = _609 != 0;
    int _613 = abs(_595);
    float _615 = float(_591);
    float _617 = float(_541);
    bool _619 = _563 >= 0.0;
    bool _621 = isnan(_563);
    bool _623 = _619 || _621;
    bool _625 = isnan(0.0);
    bool _627 = _623 || _625;
    float _629 = _615 * _617;
    float _631 = float(_613);
    float _633 = float(_571);
    float _635 = _629 * (-2.0);
    float _637 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _639 = _415 + (-0.5);
    int _641 = _627 ? 0 : 1;
    float _643 = fma(_635, _573, _573);
    bool _645 = _563 > 0.0;
    float _647 = _631 * _633;
    float _649 = fma(_637, _635, _637);
    float _651 = fma(_639, (*spvDescriptorSet0.vp_c9)._m0[196].x, _643);
    int _653 = ~_641;
    int _655 = _653 + 1;
    int _657 = _655 + 1;
    float _659 = in.m_48.x;
    float _661 = in.m_48.y;
    float _663 = in.m_48.z;
    float _665 = _647 * (-2.0);
    bool _667 = !_555;
    int _669 = _667 ? 0 : 1;
    float _671 = fma(_649, _491, _651);
    bool _673 = _415 > 0.5;
    float _675 = fma(_511, _665, _511);
    int _677 = abs(_669);
    float _679 = _419 + _415;
    int _681 = _657;
    if (!_645)
    {
        int _683 = ~_641;
        int _685 = _683 + 1;
        _681 = _685;
    }
    int _687 = _681;
    float _689 = fma(_665, _575, _575);
    float _691 = _679 + (-1.0);
    bool _693 = _417 > 0.5;
    float _695 = _417 + (-0.5);
    float _697 = float(_677);
    float _699 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _701 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _699;
    float _703 = float(_687);
    float _705 = fma(_695, (*spvDescriptorSet0.vp_c9)._m0[196].y, _689);
    float _707 = -_589;
    int _709 = _523 ? as_type<int>(_707) : as_type<int>(_589);
    float _711 = 1.0 / _701;
    bool _713 = _419 > 0.5;
    float _715 = _697 * _703;
    float _717 = fma(_675, _491, _705);
    float _719 = _419 + (-0.5);
    float _721 = _661 + _455;
    float _723 = _661 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _725 = _717 * 0.15915493667125701904296875;
    float _727 = fma(_691, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _729 = _661 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _731 = _671 * 0.15915493667125701904296875;
    float _733 = fma(_659, (*spvDescriptorSet0.vp_c10)._m0[6].x, _723);
    bool _735 = !_611;
    float _737 = _735 ? _589 : as_type<float>(_709);
    float _739 = fma(_659, (*spvDescriptorSet0.vp_c10)._m0[4].x, _729);
    float _741 = _715 * (-2.0);
    float _743 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _745 = _413 + _743;
    float _747 = _731 * 6.283185482025146484375;
    float _749 = cos(_747);
    float _751 = fma(_663, (*spvDescriptorSet0.vp_c10)._m0[4].z, _739);
    float _753 = fma(_741, _577, _577);
    float _755 = fma(_727, _741, _727);
    bool _757 = _413 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _759 = isnan(_413);
    bool _761 = _757 || _759;
    bool _763 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _765 = _761 || _763;
    float _767 = float(_765);
    float _769 = _745 * _711;
    float _771 = fma(_719, (*spvDescriptorSet0.vp_c9)._m0[196].z, _753);
    float _773 = fma(_663, (*spvDescriptorSet0.vp_c10)._m0[6].z, _733);
    float _775 = _725 * 6.283185482025146484375;
    float _777 = sin(_775);
    float _779 = fma(_755, _491, _771);
    bool _781 = _413 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _783 = isnan(_413);
    bool _785 = _781 || _783;
    bool _787 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _789 = _785 || _787;
    float _791 = float(_789);
    float _793 = _367 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _795 = _779 * 0.15915493667125701904296875;
    float _797 = -_767;
    float _799 = _797 + 1.0;
    float _801 = _725 * 6.283185482025146484375;
    float _803 = cos(_801);
    float _805 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _807 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _805;
    float _809 = _791 * _799;
    float _811 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _813 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _811;
    float _815 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _585);
    float _817 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _819 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _817;
    float _821 = fma(_807, _769, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _823 = _731 * 6.283185482025146484375;
    float _825 = sin(_823);
    float _827 = fma(_813, _769, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _829 = fma(_819, _769, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _831 = _427 * _815;
    float _833 = _821 * _809;
    float _835 = _749 * _777;
    float _837 = _827 * _809;
    float _839 = _829 * _809;
    float _841 = _795 * 6.283185482025146484375;
    float _843 = cos(_841);
    float _845 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _589);
    float _847 = -_791;
    float _849 = _847 + 1.0;
    float _851 = _793 * _845;
    float _853 = _749 * _803;
    float _855 = fma(_849, (*spvDescriptorSet0.vp_c9)._m0[123].x, _833);
    float _857 = _795 * 6.283185482025146484375;
    float _859 = sin(_857);
    float _861 = _825 * _777;
    float _863 = _825 * _803;
    float _865 = fma(_849, (*spvDescriptorSet0.vp_c9)._m0[123].y, _837);
    float _867 = _749 * _843;
    float _869 = _825 * _843;
    float _871 = _777 * _843;
    float _873 = _803 * _843;
    float _875 = _867 * _851;
    float _877 = _869 * _851;
    float _879 = _867 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _881 = _867 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _883 = fma(_859, _853, _861);
    float _885 = -_835;
    float _887 = fma(_859, _863, _885);
    float _889 = -_863;
    float _891 = fma(_859, _835, _889);
    float _893 = -_851;
    float _895 = _859 * _893;
    float _897 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _899 = fma(_883, _831, _875);
    float _901 = fma(_887, _831, _877);
    float _903 = fma(_873, _831, _895);
    float _905 = fma(_859, _861, _853);
    float _907 = fma(_891, _897, _899);
    float _909 = _867 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _911 = fma(_871, _897, _903);
    float _913 = fma(_905, _897, _901);
    float _915 = _907 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _917 = _907 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _919 = fma(_849, (*spvDescriptorSet0.vp_c9)._m0[123].z, _839);
    float _921 = _751 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _923 = fma(_911, (*spvDescriptorSet0.vp_c8)._m0[24].x, _915);
    float _925 = fma(_911, (*spvDescriptorSet0.vp_c8)._m0[26].x, _917);
    float _927 = _773 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _929 = fma(_767, (*spvDescriptorSet0.vp_c9)._m0[124].x, _855);
    float _931 = fma(_913, (*spvDescriptorSet0.vp_c8)._m0[24].z, _923);
    float _933 = fma(_913, (*spvDescriptorSet0.vp_c8)._m0[26].z, _925);
    float _935 = fma(_767, (*spvDescriptorSet0.vp_c9)._m0[124].y, _865);
    float _937 = fma(_767, (*spvDescriptorSet0.vp_c9)._m0[124].z, _919);
    float _939 = _931 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _941 = _933 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _943 = -_859;
    float _945 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[24].x, _879);
    float _947 = -_859;
    float _949 = fma(_947, (*spvDescriptorSet0.vp_c8)._m0[25].x, _881);
    float _951 = _921 + _939;
    float _953 = _927 + _941;
    float _955 = -_859;
    float _957 = fma(_955, (*spvDescriptorSet0.vp_c8)._m0[26].x, _909);
    float _959 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[24].z, _945);
    float _961 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _963 = _951 + _961;
    float _965 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _967 = _953 + _965;
    float _969 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[25].z, _949);
    float _971 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[26].z, _957);
    float _973 = _963 * _963;
    float _975 = _967 * _967;
    float _977 = _883 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _979 = _883 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _981 = _883 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _983 = _973 + _975;
    float _985 = -_589;
    int _987 = _693 ? as_type<int>(_985) : as_type<int>(_589);
    float _989 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[24].x, _977);
    float _991 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[25].x, _979);
    float _993 = sqrt(_983);
    float _995 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[26].x, _981);
    bool _997 = !_603;
    float _999 = _997 ? _589 : as_type<float>(_987);
    float _1001 = _891 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1003 = _891 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1005 = _891 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1007 = _907 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1009 = fma(_871, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1001);
    float _1011 = fma(_871, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1003);
    float _1013 = fma(_871, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1005);
    float _1015 = fma(_911, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1007);
    float _1017 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1019 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[25].z, _991);
    float _1021 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[26].z, _995);
    float _1023 = fma(_913, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1015);
    float _1025 = _589 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _1027 = _993 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1029 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[24].z, _989);
    float _1031 = _1023 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1033 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1035 = _1025 * _959;
    float _1037 = _1025 * _969;
    float _1039 = _721 + _1031;
    float _1041 = _1025 * _971;
    float _1043 = -_585;
    int _1045 = _673 ? as_type<int>(_1043) : as_type<int>(_585);
    float _1047 = -_585;
    int _1049 = _713 ? as_type<int>(_1047) : as_type<int>(_585);
    float _1051 = _1031;
    float _1053 = _1025;
    float _1055 = _973;
    float _1057 = _975;
    float _1059 = _953;
    float _1061 = _927;
    if (!_1027)
    {
        _1051 = _951;
    }
    float _1063 = _1051;
    float _1065 = _1063;
    if (!_1027)
    {
        _1053 = _1039;
    }
    float _1067 = _1053;
    bool _1069 = !_1027;
    float _1071 = _1067;
    if (!_1069)
    {
        float _1073 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1075 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1077 = _993 + _1075;
        float _1079 = _1039 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1081 = rsqrt(_983);
        float _1083 = _1077 * _1073;
        float _1085 = _1083 * 0.15915493667125701904296875;
        float _1087 = _1085 * 6.283185482025146484375;
        float _1089 = sin(_1087);
        float _1091 = _1085 * 6.283185482025146484375;
        float _1093 = cos(_1091);
        float _1095 = fma(_1089, _1079, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1097 = _1081 * _1095;
        float _1099 = fma(_963, _1097, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1101 = _1093 + (-1.0);
        float _1103 = fma(_967, _1097, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1105 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1107 = _1099 + _1105;
        float _1109 = _1101 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1111 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1113 = _1103 + _1111;
        float _1115 = _1107 * _1107;
        float _1117 = fma(_1039, _1093, _1109);
        float _1119 = _1113 * _1113;
        _1071 = _1117;
        _1055 = _1115;
        _1057 = _1119;
        _1059 = _1103;
        _1065 = _1099;
    }
    float _1121 = _1071;
    float _1123 = _1055;
    float _1125 = _1057;
    float _1127 = _1059;
    float _1129 = _1065;
    float _1131 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1133 = _1121 + _1131;
    float _1135 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1137 = !_599;
    float _1139 = _1137 ? _585 : as_type<float>(_1045);
    float _1141 = -_737;
    float _1143 = _1141 + 0.5;
    float _1145 = fma(_1133, _1133, _1123);
    bool _1147 = !_607;
    float _1149 = _1147 ? _585 : as_type<float>(_1049);
    float _1151 = _585 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1153 = _1139 + 0.5;
    float _1155 = _1145 + _1125;
    float _1157 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1159 = _1149 + 0.5;
    float _1161 = _1153 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1163 = fma(_1151, _1029, _1035);
    float _1165 = fma(_1151, _1019, _1037);
    float _1167 = fma(_1151, _1021, _1041);
    float _1169 = _1159 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1171 = -_999;
    float _1173 = _1171 + 0.5;
    float _1175 = _1143 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1177 = fma(_905, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1009);
    float _1179 = fma(_905, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1011);
    float _1181 = fma(_905, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1013);
    float _1183 = _1169 * _1135;
    float _1185 = sqrt(_1155);
    float _1187 = _1173 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1189 = _1175 * _1157;
    float _1191 = _929 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1193 = _935 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1195 = _937 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1197 = _1161 * _1017;
    float _1199 = _1187 * _1033;
    float _1201 = _1191 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1203 = _1177 + _1163;
    float _1205 = _1179 + _1165;
    float _1207 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1209 = _1193 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1211 = _1195 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1213 = _1181 + _1167;
    out.m_72.x = _1197;
    out.m_72.y = _1199;
    out.m_72.z = _1183;
    out.m_72.w = _1189;
    bool _1215 = _1185 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1217 = isnan(_1185);
    bool _1219 = _1215 || _1217;
    bool _1221 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1223 = _1219 || _1221;
    out.m_74.x = _1201;
    out.m_74.y = _1209;
    out.m_74.z = _1211;
    out.m_74.w = _1207;
    out.m_76.x = _1203;
    out.m_76.y = _1205;
    out.m_76.z = _1213;
    float _1225 = _1193;
    if (!_1223)
    {
        _1225 = 1.0;
    }
    float _1227 = _1225;
    bool _1229 = !_1223;
    float _1231 = _1227;
    if (!_1229)
    {
        bool _1233 = _1185 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1235 = isnan(_1185);
        bool _1237 = _1233 || _1235;
        bool _1239 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1241 = _1237 || _1239;
        if (!_1241)
        {
            float _1243 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1245 = _1185 + _1243;
            float _1247 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1249 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1247;
            float _1251 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1253 = _1251 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1255 = 1.0 / _1249;
            float _1257 = _1245 * _1255;
            float _1259 = fma(_1257, _1253, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1231 = _1259;
            _1261 = true;
        }
        else
        {
            bool _1263 = _1185 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1265 = isnan(_1185);
            bool _1267 = _1263 || _1265;
            bool _1269 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1271 = _1267 || _1269;
            if (!_1271)
            {
                float _1273 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1275 = _1185 + _1273;
                float _1277 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1279 = _1277 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1281 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1283 = _1281 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1285 = 1.0 / _1279;
                float _1287 = _1275 * _1285;
                float _1289 = fma(_1287, _1283, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1231 = _1289;
                _1261 = true;
            }
            else
            {
                _1231 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1261 = false;
    float _1291 = _1231;
    float _1293 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1295 = _1127 + _1293;
    float _1297 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1299 = _1129 + _1297;
    float _1301 = fma(_1295, _1291, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1303 = fma(_1299, _1291, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1305 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _1307 = _1301 + _1305;
    float _1309 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _1311 = _1303 + _1309;
    float _1313 = fma(_1307, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1315 = fma(_1311, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _4383 = float2(_1315, _1313);
    float _1317 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_4383, float2(0.0), isnan(_4383)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_4383, float2(0.0), isnan(_4383)), level(0.0)).x;
    float _1319 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1321 = _1121 + _1319;
    float _1323 = -_921;
    float _1325 = _1323 + _1303;
    float _1327 = -_927;
    float _1329 = _1327 + _1301;
    float _1331 = fma(_1321, _1291, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1333 = -_721;
    float _1335 = _1333 + _1331;
    float _1337 = _1335 * _1335;
    float _1339 = fma(_1325, _1325, _1337);
    float _1341 = fma(_1329, _1329, _1339);
    float _1343 = sqrt(_1341);
    bool _1345 = _1343 > 0.0;
    bool _1347 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1349 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1351 = _1347 || _1349;
    bool _1353 = isnan(0.5);
    bool _1355 = _1351 || _1353;
    float _1357 = fma(_1317, 100.0, _721);
    float _1359 = fma(_1317, 100.0, _1331);
    float _1361 = _1357 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1363 = _1317;
    float _1365 = _1303;
    float _1367 = _1301;
    float _1369 = _1331;
    float _1371 = _1329;
    if (!_1345)
    {
        _1363 = _1359;
    }
    float _1373 = _1363;
    float _1375 = fma(_921, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1361);
    float _1377 = _1357 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1379 = fma(_927, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1375);
    float _1381 = fma(_921, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1377);
    float _1383 = _1379 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1385 = fma(_927, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1381);
    bool _1387 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1389 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1391 = _1387 || _1389;
    bool _1393 = isnan(0.5);
    bool _1395 = _1391 || _1393;
    float _1397 = 1.0 / _1383;
    float _1399 = _1385 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1401 = _1399 + _1383;
    bool _1403 = !_1345;
    float _1405 = _1373;
    float _1407 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _1409 = _1401;
    if (!_1403)
    {
        float _1411 = _183 * _183;
        float _1413 = fma(_181, _181, _1411);
        float _1415 = rsqrt(_1341);
        float _1417 = fma(_185, _185, _1413);
        float _1419 = sqrt(_1417);
        float _1421 = _1325 * _1415;
        float _1423 = _1335 * _1415;
        float _1425 = _1329 * _1415;
        bool _1427 = _1419 > 0.0;
        float _1429 = _1415;
        _1407 = _1419;
        _1369 = _1417;
        _1371 = _1425;
        if (!_1427)
        {
            _1429 = _1359;
        }
        float _1431 = _1429;
        bool _1433 = !_1427;
        _1405 = _1431;
        if (!_1433)
        {
            float _1435 = rsqrt(_1417);
            float _1437 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1439 = _183 * _1435;
            float _1441 = _181 * _1435;
            float _1443 = _1423 * _1439;
            float _1445 = _185 * _1435;
            float _1447 = fma(_1421, _1441, _1443);
            float _1449 = _1437 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1451 = fma(_1425, _1445, _1447);
            float _1453 = _1451 * _1449;
            float _1455 = fma(_181, _1453, _1303);
            float _1457 = fma(_183, _1453, _1359);
            float _1459 = fma(_185, _1453, _1301);
            _1365 = _1455;
            _1405 = _1457;
            _1367 = _1459;
            _1407 = _1453;
            _1369 = _1435;
        }
    }
    float _1461 = _1365;
    float _1463 = _1405;
    float _1465 = _1367;
    float _1467 = _1407;
    float _1469 = _1369;
    float _1471 = _1371;
    float _1473 = _1401 * _1397;
    float _1475 = _1473 * 0.5;
    float _1477 = _1467;
    float _1479 = _1469;
    float _1481 = _1471;
    if (_1355)
    {
        _189 = 1.0;
    }
    float _1483 = _189;
    float _1485 = _1483;
    if (_1395)
    {
        _191 = _1461;
    }
    float _1487 = _191;
    float _1489 = _1487;
    if (_1395)
    {
        _193 = _1463;
    }
    float _1491 = _193;
    float _1493 = _1491;
    if (_1395)
    {
        _1477 = _1465;
    }
    float _1495 = _1477;
    float _1497 = _1495;
    if (!_1395)
    {
        float _1499 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1501 = _1357 + _1499;
        float _1503 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1505 = _921 + _1503;
        float _1507 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1509 = -_921;
        float _1511 = _1509 + _1461;
        float _1513 = _1501 * _1501;
        float _1515 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1517 = _927 + _1515;
        float _1519 = -_1357;
        float _1521 = _1519 + _1463;
        float _1523 = -_927;
        float _1525 = _1523 + _1465;
        float _1527 = fma(_1505, _1505, _1513);
        float _1529 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1531 = fma(_1517, _1517, _1527);
        float _1533 = sqrt(_1531);
        float _1535 = _1507 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1537 = precise::min(_1533, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1539 = _1537 * _1529;
        float _1541 = _1535 * _1539;
        float _1543 = fma(_1511, _1541, _921);
        float _1545 = fma(_1521, _1541, _1357);
        float _1547 = fma(_1525, _1541, _927);
        _1493 = _1545;
        _1489 = _1543;
        _1497 = _1547;
        _1409 = _1507;
        _1479 = _1541;
    }
    float _1549 = _1493;
    float _1551 = _1489;
    float _1553 = _1497;
    float _1555 = _1409;
    float _1557 = _1479;
    float _1559 = _1557;
    float _1561 = _1555;
    if (!_1355)
    {
        float _1563 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1565 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1567 = fma(_1475, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1565);
        float _1569 = _1563 * 0.15915493667125701904296875;
        float _1571 = _1569 * 6.283185482025146484375;
        float _1573 = cos(_1571);
        float _1575 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1577 = _1575 * 0.15915493667125701904296875;
        float _1579 = _1569 * 6.283185482025146484375;
        float _1581 = sin(_1579);
        float _1583 = 1.0 / _1573;
        float _1585 = _1577 * 6.283185482025146484375;
        float _1587 = cos(_1585);
        float _1589 = _1581 * _1583;
        float _1591 = 1.0 / _1567;
        float _1593 = _1587 * _1589;
        float _1595 = _1577 * 6.283185482025146484375;
        float _1597 = sin(_1595);
        float _1599 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1601 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1599;
        float _1603 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1605 = _1591 * _1603;
        float _1607 = 1.0 / _1593;
        float _1609 = 1.0 / _1601;
        float _1611 = _1597 * _1607;
        float _1613 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1615 = fma(_1611, _1605, _1613);
        float _1617 = _1615 * _1609;
        float _1619 = precise::clamp(_1617, 0.0, 1.0);
        _1061 = _1577;
        _1485 = _1619;
    }
    float _1621 = _1061;
    float _1623 = _1485;
    float _1625 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1627 = _1549 + _1625;
    float _1629 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1631 = _1551 + _1629;
    float _1633 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1635 = _1553 + _1633;
    float _1637 = _1627 * _1627;
    float _1639 = fma(_1631, _1631, _1637);
    float _1641 = fma(_1635, _1635, _1639);
    float _1643 = rsqrt(_1641);
    float _1645 = sqrt(_1641);
    float _1647 = _1643 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1649 = _1631 * _1647;
    float _1651 = _1635 * _1647;
    float _1653 = _1649 * _1649;
    float _1655 = _1651 * _1651;
    float _1657 = _1653 + _1655;
    float _1659 = sqrt(_1657);
    bool _1661 = _1659 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1663 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1665 = _1659 + _1663;
    float _1667 = _1621;
    float _1669 = _1665;
    float _1671 = _1627;
    float _1673 = _1649;
    if (_1661)
    {
        float _1675 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1667 = _1675;
    }
    float _1677 = _1667;
    if (_1661)
    {
        float _1679 = rsqrt(_1657);
        _1559 = _1679;
    }
    float _1681 = _1559;
    float _1683 = _1681;
    if (_1661)
    {
        float _1685 = _1665 * _1677;
        _1669 = _1685;
    }
    float _1687 = _1669;
    if (_1661)
    {
        float _1689 = _1687 * 0.15915493667125701904296875;
        _1561 = _1689;
    }
    float _1691 = _1561;
    float _1693 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1695 = _1635;
    if (_1661)
    {
        float _1697 = _1691 * 6.283185482025146484375;
        float _1699 = sin(_1697);
        _1695 = _1699;
    }
    float _1701 = _1695;
    float _1703 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1705 = precise::max(0.0, _1703);
    float _1707 = _1677;
    float _1709 = _1705;
    if (_1661)
    {
        float _1711 = _1691 * 6.283185482025146484375;
        float _1713 = cos(_1711);
        _1707 = _1713;
    }
    float _1715 = _1707;
    float _1717 = -_1647;
    float _1719 = -_1705;
    float _1721 = fma(_1627, _1717, _1719);
    if (_1661)
    {
        float _1723 = _1721 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1671 = _1723;
    }
    float _1725 = _1671;
    float _1727 = _1725;
    float _1729 = _1701;
    if (_1661)
    {
        float _1731 = fma(_1701, _1725, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1727 = _1731;
    }
    float _1733 = _1727;
    float _1735 = _1733;
    if (!_1661)
    {
        _1729 = _1653;
    }
    float _1737 = _1729;
    float _1739 = _1549 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1741 = _1737;
    float _1743 = _1715;
    if (_1661)
    {
        float _1745 = _1715 + (-1.0);
        _1709 = _1745;
    }
    float _1747 = _1709;
    float _1749 = _1747;
    if (_1661)
    {
        float _1751 = _1681 * _1733;
        _1481 = _1751;
    }
    float _1753 = _1481;
    if (!_1661)
    {
        _1735 = _1721;
    }
    float _1755 = _1735;
    float _1757 = fma(_1551, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1739);
    float _1759 = _1755;
    if (_1661)
    {
        float _1761 = _1747 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1683 = _1761;
    }
    float _1763 = _1683;
    if (_1661)
    {
        float _1765 = _1649 * _1753;
        _1673 = _1765;
    }
    float _1767 = _1673;
    if (!_1661)
    {
        _1749 = _1651;
    }
    float _1769 = _1749;
    float _1771 = _1769;
    if (_1661)
    {
        float _1773 = _1651 * _1753;
        _1771 = _1773;
    }
    float _1775 = _1771;
    if (_1661)
    {
        float _1777 = fma(_1721, _1715, _1763);
        _1759 = _1777;
    }
    float _1779 = _1759;
    if (_1661)
    {
        float _1781 = _1767 * _1767;
        _1741 = _1781;
    }
    float _1783 = _1741;
    if (!_1661)
    {
        _1743 = _1655;
    }
    float _1785 = _1743;
    float _1787 = _1785;
    if (_1661)
    {
        float _1789 = _1775 * _1775;
        _1787 = _1789;
    }
    float _1791 = _1787;
    float _1793 = fma(_1779, _1779, _1783);
    float _1795 = _1549 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1797 = _1793 + _1791;
    float _1799 = fma(_1551, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1795);
    float _1801 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1803 = fma(_1645, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1801);
    float _1805 = precise::clamp(_1803, 0.0, 1.0);
    float _1807 = _1549 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1809 = rsqrt(_1797);
    float _1811 = fma(_1553, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1799);
    float _1813 = -_1805;
    float _1815 = _1813 + 1.0;
    float _1817 = fma(_1551, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1807);
    float _1819 = _1549 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1821 = _1811 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1823 = fma(_1553, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1817);
    float _1825 = abs(_1815);
    float _1827 = log2(_1825);
    float _1829 = fma(_1551, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1819);
    float _1831 = _1821 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1833 = fma(_1553, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1829);
    float _1835 = -_1831;
    float _1837 = fma(_1835, _1693, 1.0);
    float _1839 = _1823 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1841 = _1809 * _1767;
    float _1843 = fma(_1553, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1757);
    float _1845 = _1833 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1847 = _1839 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1849 = _1809 * _1779;
    float _1851 = _1841 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1853 = _1809 * _1775;
    float _1855 = fma(_1845, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1847);
    float _1857 = _1827 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1859 = -_1851;
    float _1861 = fma(_1849, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1859);
    float _1863 = _1843 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1865 = fma(_1821, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1855);
    float _1867 = exp2(_1857);
    float _1869 = -_1853;
    float _1871 = fma(_1869, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1861);
    float _1873 = _1839 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1875 = fma(_1863, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1865);
    float _1877 = _1839 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1879 = fma(_1871, -0.5, 0.5);
    float _1881 = fma(_1871, 0.5, 0.5);
    float _1883 = fma(_1845, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1873);
    float _1885 = log2(_1837);
    float _1887 = _1849 + 1.0;
    float _1889 = fma(_1881, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1891 = fma(_1821, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1883);
    float _1893 = fma(_1881, _1889, -0.212114393711090087890625);
    float _1895 = 1.0 / _1875;
    float _1897 = fma(_1845, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1877);
    float _1899 = -_1849;
    float _1901 = fma(_1867, _1887, _1899);
    float _1903 = fma(_1863, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1891);
    float _1905 = fma(_1881, _1893, 1.570728778839111328125);
    float _1907 = fma(_1821, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1897);
    float _1909 = fma(_1901, 0.5, 0.5);
    float _1911 = sqrt(_1879);
    float _1913 = fma(_1863, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1907);
    float _1915 = _1885 * 0.693147182464599609375;
    float _1917 = _1915 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1919 = _1903 * _1895;
    float _1921 = _1913 * _1895;
    float _1923 = fma(_1919, 0.5, 0.5);
    float _1925 = fma(_1921, -0.5, 0.5);
    float _1927 = _1911 * 0.636619746685028076171875;
    float3 _5353 = float3(_1923, _1925, _1917);
    float _1929 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5353, float3(0.0), isnan(_5353)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5353, float3(0.0), isnan(_5353)), level(0.0)).x;
    float _1931 = -_1905;
    float _1933 = fma(_1927, _1931, 1.0);
    float3 _5369 = float3(_1923, _1925, _1917);
    float4 _1936 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5369, float3(0.0), isnan(_5369)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5369, float3(0.0), isnan(_5369)), level(0.0)).xyzw;
    float _1938 = _1936.x;
    float _1940 = _1936.y;
    float _1942 = _1936.z;
    float _1944 = _1936.w;
    float2 _5385 = float2(_1933, _1909);
    float3 _1948 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5385, float2(0.0), isnan(_5385)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5385, float2(0.0), isnan(_5385)), level(0.0)).xyz;
    float _1950 = _1948.x;
    float _1952 = _1948.y;
    float _1954 = _1948.z;
    float _1956 = _1827 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1958 = _1839 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1960 = _1645 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1962 = isnan(_1645);
    bool _1964 = _1960 || _1962;
    bool _1966 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1968 = _1964 || _1966;
    float _1970 = fma(_1845, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1958);
    float _1972 = exp2(_1956);
    float _1974 = _1875 * 0.5;
    float _1976 = fma(_1821, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1970);
    float _1978 = fma(_1913, -0.5, _1974);
    float _1980 = fma(_1863, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1976);
    float _1982 = _1903 + _1875;
    float _1984 = _1980 + _1875;
    float _1986 = _1982 * 0.5;
    out.gl_Position.x = _1903;
    out.gl_Position.y = _1913;
    out.gl_Position.z = _1980;
    out.gl_Position.w = _1875;
    float _1988 = _1984 * 0.5;
    float _1990 = -_1972;
    float _1992 = _1990 + 1.0;
    float _1994 = _1992 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_78.x = _1986;
    out.m_78.y = _1978;
    out.m_78.z = _1988;
    out.m_78.w = _1875;
    float _1996 = -_1994;
    float _1998 = _1996 + 1.0;
    float _2000 = _1875;
    float _2002 = _1980;
    float _2004 = _1913;
    float _2006 = _1903;
    float _2008 = _1998;
    if (!_1968)
    {
        _2000 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2010 = _2000;
    float _2012 = _2010;
    float _2014 = _2010;
    if (!_1968)
    {
        _2002 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2016 = _2002;
    float _2018 = _2016;
    float _2020 = _2016;
    if (!_1968)
    {
        _2004 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2022 = _2004;
    float _2024 = _2022;
    float _2026 = _2022;
    if (!_1968)
    {
        _2006 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2028 = _2006;
    float _2030 = _1623 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2032 = _1994 * _1929;
    float _2034 = _1944 * _2032;
    float _2036 = _1944 * _1998;
    float _2038 = _2034;
    float _2040 = _2028;
    float _2042 = _2028;
    if (!_1968)
    {
        _2008 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2044 = _2008;
    float _2046 = _1954 * _2032;
    float _2048 = fma(_1950, _2034, _1938);
    float _2050 = fma(_1952, _2034, _1940);
    float _2052 = _2044;
    float _2054 = _2044;
    if (!_1968)
    {
        _2038 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2056 = _2038;
    float _2058 = fma(_1944, _2046, _1942);
    out.m_80.x = _2048;
    out.m_80.y = _2050;
    out.m_80.z = _2058;
    out.m_80.w = _2036;
    bool _2060 = !_1968;
    float _2062 = _2056;
    float _2064 = _2056;
    if (!_2060)
    {
        bool _2066 = _1645 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2068 = isnan(_1645);
        bool _2070 = _2066 || _2068;
        bool _2072 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2074 = _2070 || _2072;
        if (!_2074)
        {
            float _2076 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2078 = _1645 + _2076;
            float _2080 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2082 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2080;
            float _2084 = 1.0 / _2082;
            float _2086 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2088 = _2086 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2090 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2092 = _2090 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2094 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2096 = _2094 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2098 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2100 = _2098 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2102 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2104 = _2102 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2106 = _2078 * _2084;
            float _2108 = precise::clamp(_2106, 0.0, 1.0);
            float _2110 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2112 = _2110 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2114 = fma(_2108, _2088, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2116 = fma(_2108, _2112, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2118 = fma(_2108, _2092, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2120 = fma(_2108, _2096, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2122 = fma(_2108, _2100, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2124 = fma(_2108, _2104, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2054 = _2116;
            _2026 = _2122;
            _2064 = _2114;
            _2020 = _2120;
            _2014 = _2118;
            _2042 = _2124;
            _2126 = true;
        }
        else
        {
            bool _2128 = _1645 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2130 = isnan(_1645);
            bool _2132 = _2128 || _2130;
            bool _2134 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2136 = _2132 || _2134;
            if (!_2136)
            {
                _2062 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2138 = _2062;
            _2064 = _2138;
            if (!_2136)
            {
                _2052 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2140 = _2052;
            _2054 = _2140;
            if (!_2136)
            {
                _2012 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2142 = _2012;
            _2014 = _2142;
            if (!_2136)
            {
                _2018 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2144 = _2018;
            _2020 = _2144;
            if (!_2136)
            {
                _2024 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2146 = _2024;
            _2026 = _2146;
            if (!_2136)
            {
                _2040 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2148 = _2040;
            bool _2150 = !_2136;
            _2042 = _2148;
            if (!_2150)
            {
                bool _2152 = _1645 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2154 = isnan(_1645);
                bool _2156 = _2152 || _2154;
                bool _2158 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2160 = _2156 || _2158;
                if (!_2160)
                {
                    float _2162 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2164 = _1645 + _2162;
                    float _2166 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2168 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2166;
                    float _2170 = 1.0 / _2168;
                    float _2172 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2174 = _2172 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2176 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2178 = _2176 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2180 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2182 = _2180 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2184 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2186 = _2184 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2188 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2190 = _2188 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2192 = _2164 * _2170;
                    float _2194 = precise::clamp(_2192, 0.0, 1.0);
                    float _2196 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2198 = _2196 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2200 = fma(_2194, _2174, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2202 = fma(_2194, _2198, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2204 = fma(_2194, _2178, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2206 = fma(_2194, _2182, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2208 = fma(_2194, _2186, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2210 = fma(_2194, _2190, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2054 = _2202;
                    _2026 = _2208;
                    _2064 = _2200;
                    _2020 = _2206;
                    _2014 = _2204;
                    _2042 = _2210;
                    _2126 = true;
                }
                else
                {
                    _2054 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2026 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2064 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2020 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2014 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2042 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2126 = false;
    float _2212 = _2054;
    float _2214 = _2026;
    float _2216 = _2064;
    float _2218 = _2020;
    float _2220 = _2014;
    float _2222 = _2042;
    float _2224 = fma(_1205, -0.5, 0.5);
    float _2226 = precise::clamp(_2224, 0.0, 1.0);
    float _2228 = -_2212;
    float _2230 = _2228 + _2214;
    float _2232 = -_2216;
    float _2234 = _2232 + _2218;
    out.m_82.x = 0.0;
    float _2236 = -_2220;
    float _2238 = _2236 + _2222;
    float _2240 = fma(_2226, _2230, _2212);
    float _2242 = fma(_2226, _2234, _2216);
    bool _2244 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2246 = _2240 * 0.586610972881317138671875;
    float _2248 = fma(_2226, _2238, _2220);
    float _2250 = _2030 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2252 = fma(_2242, 0.298911988735198974609375, _2246);
    bool _2254 = _1623 > 0.0;
    bool _2256 = isnan(_1623);
    bool _2258 = _2254 || _2256;
    bool _2260 = isnan(0.0);
    bool _2262 = _2258 || _2260;
    float _2264 = fma(_2248, 0.114477999508380889892578125, _2252);
    out.m_51.x = _2250;
    float _2266 = -_2264;
    float _2268 = _2242 + _2266;
    float _2270 = -_2264;
    float _2272 = _2240 + _2270;
    float _2274 = -_2264;
    float _2276 = _2248 + _2274;
    float _2278 = fma(_2268, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2264);
    float _2280 = fma(_2272, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2264);
    float _2282 = fma(_2276, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2264);
    bool _2284 = !_2244;
    if (!_2284)
    {
        float _2286 = -_1549;
        float _2288 = _2286 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2290 = -_1551;
        float _2292 = _2290 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2294 = -_1553;
        float _2296 = _2294 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2298 = _2288 * _2288;
        float _2300 = fma(_2292, _2292, _2298);
        float _2302 = fma(_2296, _2296, _2300);
        float _2304 = sqrt(_2302);
        float _2306 = rsqrt(_2302);
        float _2308 = -_2304;
        float _2310 = _2308 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2312 = _2310 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2314 = precise::clamp(_2312, 0.0, 1.0);
        float _2316 = _2292 * _2306;
        float _2318 = _2288 * _2306;
        float _2320 = abs(_2314);
        float _2322 = log2(_2320);
        float _2324 = _2296 * _2306;
        float _2326 = _2316 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2328 = _1205 * _2318;
        float _2330 = -_2318;
        float _2332 = -_2326;
        float _2334 = fma(_2330, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2332);
        float _2336 = fma(_1203, _2316, _2328);
        float _2338 = -_2324;
        float _2340 = fma(_2338, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2334);
        float _2342 = fma(_1213, _2324, _2336);
        float _2344 = precise::clamp(_2342, 0.0, 1.0);
        float _2346 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2348 = _2340 + _2346;
        float _2350 = _2322 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2352 = _2348 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2354 = precise::clamp(_2352, 0.0, 1.0);
        float _2356 = exp2(_2350);
        float _2358 = _2356 * _2354;
        float _2360 = _2344 * _2358;
        float _2362 = _2360 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2364 = _2360 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2366 = _2360 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_82.x = _2362;
        out.m_82.y = _2364;
        out.m_82.z = _2366;
    }
    out.m_84.x = _2278;
    out.m_84.y = _2280;
    out.m_84.z = _2282;
    if (_2262)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_51.x = 0.0;
    float _2368 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2368;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2126 = false;
    bool _1261 = false;
    bool _309 = false;
    bool _213 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _98 = in.m_48.w;
    float _100 = trunc(_98);
    int _103 = int(_100);
    bool _107 = _103 >= 1;
    float _109 = 0.0;
    float _111 = as_type<float>(_103);
    if (!_107)
    {
        _109 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _113 = _109;
    if (!_107)
    {
        out.m_51.x = 0.0;
    }
    int _115 = 0;
    if (!_107)
    {
        float _117 = _113 * 5.0;
        _115 = as_type<int>(_117);
    }
    int _119 = _115;
    int _121 = _119;
    if (!_107)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2426 = as_type<float>(_119);
        out.gl_Position.z = _2426;
    }
    if (!_107)
    {
        return out;
    }
    float _123 = in.m_53.w;
    float _125 = float(_103);
    float _127 = 1.0 / _125;
    float _129 = -_123;
    float _131 = _129 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _133 = _123 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _135 = isnan(_123);
    bool _137 = _133 || _135;
    bool _139 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _141 = _137 || _139;
    float _143 = _131 * _127;
    bool _145 = _131 >= _125;
    bool _147 = !_141;
    bool _149 = _145 || _147;
    out.m_55.x = _143;
    float _151 = _143;
    float _153 = _131;
    if (_149)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _155 = _111;
    if (_149)
    {
        out.m_51.x = 0.0;
    }
    if (_149)
    {
        float _157 = _155 * 5.0;
        _121 = as_type<int>(_157);
    }
    int _159 = _121;
    if (_149)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2498 = as_type<float>(_159);
        out.gl_Position.z = _2498;
    }
    if (_149)
    {
        return out;
    }
    float _161 = in.m_57.x;
    float _163 = in.m_57.y;
    float _165 = in.m_57.z;
    bool _167 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _169 = _163 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _171 = _163 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _173 = _163 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _175 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[4].x, _169);
    float _177 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[5].x, _171);
    float _179 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[6].x, _173);
    float _181 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[4].z, _175);
    float _183 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[5].z, _177);
    float _185 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[6].z, _179);
    bool _187 = !_167;
    float _189 = _185;
    float _191 = _183;
    float _193 = _181;
    float _211;
    if (!_187)
    {
        float _195 = in.m_59.x;
        float _197 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _199 = _195 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _201 = fma(_199, (*spvDescriptorSet0.vp_c9)._m0[12].x, _131);
        float _203 = _201 * _197;
        float _205 = floor(_203);
        float _207 = -_205;
        float _209 = _203 + _207;
        _211 = _209;
        _213 = true;
    }
    else
    {
        _211 = _143;
    }
    _213 = false;
    float _215 = _211;
    float _217 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _219 = _215 + _217;
    bool _221 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _223 = isnan(_215);
    bool _225 = _221 || _223;
    bool _227 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _229 = _225 || _227;
    float _231 = float(_229);
    float _233 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _235 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _233;
    float _237 = -_231;
    float _239 = _237 + 1.0;
    bool _241 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _243 = isnan(_215);
    bool _245 = _241 || _243;
    bool _247 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _249 = _245 || _247;
    float _251 = float(_249);
    float _253 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _255 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _253;
    bool _257 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _259 = 1.0 / _235;
    float _261 = _251 * _239;
    float _263 = -_251;
    float _265 = _263 + 1.0;
    float _267 = _219 * _259;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _271 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _269;
    float _273 = fma(_255, _267, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _275 = fma(_271, _267, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _277 = _273 * _261;
    float _279 = _275 * _261;
    float _281 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[143].x, _277);
    float _283 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[143].y, _279);
    float _285 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[144].x, _281);
    float _287 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[144].y, _283);
    bool _289 = !_257;
    float _307;
    if (!_289)
    {
        float _291 = in.m_59.x;
        float _293 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _295 = _291 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _297 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[11].y, _131);
        float _299 = _297 * _293;
        float _301 = floor(_299);
        float _303 = -_301;
        float _305 = _299 + _303;
        _307 = _305;
        _309 = true;
    }
    else
    {
        _307 = _143;
    }
    _309 = false;
    float _311 = _307;
    float _313 = in.m_61.x;
    float _315 = in.m_61.y;
    bool _317 = _311 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _319 = isnan(_311);
    bool _321 = _317 || _319;
    bool _323 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _325 = _321 || _323;
    float _327 = float(_325);
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _331 = _329 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _333 = _311 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _335 = isnan(_311);
    bool _337 = _333 || _335;
    bool _339 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _341 = _337 || _339;
    float _343 = float(_341);
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _347 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _345;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _351 = _311 + _349;
    float _353 = -_327;
    float _355 = _353 + 1.0;
    bool _357 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _359 = 1.0 / _331;
    float _361 = _343 * _355;
    float _363 = -_343;
    float _365 = _363 + 1.0;
    float _367 = _287 * _315;
    float _369 = _285 * _313;
    float _371 = _347 * _359;
    float _373 = fma(_371, _351, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _375 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _377 = _373 * _361;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _381 = _375 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _383 = fma(_365, (*spvDescriptorSet0.vp_c9)._m0[115].x, _377);
    float _385 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _387 = _379 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _389 = fma(_327, (*spvDescriptorSet0.vp_c9)._m0[116].x, _383);
    float _391 = _385 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _393 = _389 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_63.x = _391;
    out.m_63.y = _387;
    out.m_63.z = _381;
    out.m_63.w = _393;
    bool _395 = !_357;
    if (!_395)
    {
        float _397 = in.m_59.x;
        float _399 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _401 = _397 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _403 = fma(_401, (*spvDescriptorSet0.vp_c9)._m0[11].z, _131);
        float _405 = _403 * _399;
        float _407 = floor(_405);
        float _409 = -_407;
        float _411 = _405 + _409;
        _151 = _411;
    }
    float _413 = _151;
    float _415 = in.m_59.x;
    float _417 = in.m_59.y;
    float _419 = in.m_59.z;
    float _421 = in.m_59.w;
    float _423 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _425 = log2(_423);
    float _427 = _369 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _429 = as_type<float>(int(gl_VertexIndex));
    bool _431 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _433 = isnan(0.0);
    bool _435 = _431 || _433;
    bool _437 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _439 = _435 || _437;
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _443 = 1.0 + _441;
    bool _445 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _447 = isnan(1.0);
    bool _449 = _445 || _447;
    bool _451 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _453 = _449 || _451;
    float _455 = in.m_68.y;
    float _457 = 1.0 / _443;
    float _459 = _425 * _131;
    float _461 = exp2(_459);
    float _463 = _419 * 2.0;
    float _465 = _415 * 2.0;
    float _467 = floor(_463);
    float _469 = floor(_465);
    float _471 = -_461;
    float _473 = _471 + 1.0;
    float _475 = _439 ? _473 : 0.0;
    bool _477 = _467 > 0.0;
    bool _479 = _467 >= 0.0;
    bool _481 = isnan(_467);
    bool _483 = _479 || _481;
    bool _485 = isnan(0.0);
    bool _487 = _483 || _485;
    if (_453)
    {
        float _489 = _475 * _457;
        _153 = _489;
    }
    float _491 = _153;
    float _493 = _417 + _419;
    int _495 = _487 ? 0 : 1;
    bool _497 = _469 > 0.0;
    float _499 = _493 + (-1.0);
    bool _501 = _469 >= 0.0;
    bool _503 = isnan(_469);
    bool _505 = _501 || _503;
    bool _507 = isnan(0.0);
    bool _509 = _505 || _507;
    float _511 = fma(_499, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _513 = as_type<int>(_429) & 1;
    bool _515 = _513 != 0;
    int _517 = as_type<int>(_429) & 2;
    bool _519 = _517 != 0;
    float _521 = _417 + _415;
    bool _523 = _421 > 0.5;
    float _525 = _521 + (-1.0);
    int _527 = ~_495;
    int _529 = _527 + 1;
    int _531 = _529 + 1;
    int _533 = _509 ? 0 : 1;
    int _535 = _531;
    if (!_477)
    {
        int _537 = ~_495;
        int _539 = _537 + 1;
        _535 = _539;
    }
    int _541 = _535;
    float _543 = _417 * 2.0;
    int _545 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _547 = _545 != 0;
    int _549 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _551 = _549 != 0;
    int _553 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _555 = _553 != 0;
    int _557 = ~_533;
    int _559 = _557 + 1;
    int _561 = _559 + 1;
    float _563 = floor(_543);
    int _565 = _561;
    if (!_497)
    {
        int _567 = ~_533;
        int _569 = _567 + 1;
        _565 = _569;
    }
    int _571 = _565;
    float _573 = in.m_70.x;
    float _575 = in.m_70.y;
    float _577 = in.m_70.z;
    bool _579 = !_547;
    int _581 = _579 ? 0 : 1;
    bool _583 = !_515;
    float _585 = _583 ? (-0.5) : 0.5;
    bool _587 = !_519;
    float _589 = _587 ? (-0.5) : 0.5;
    int _591 = abs(_581);
    bool _593 = !_551;
    int _595 = _593 ? 0 : 1;
    int _597 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _599 = _597 != 0;
    int _601 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _603 = _601 != 0;
    int _605 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _607 = _605 != 0;
    int _609 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _611 = _609 != 0;
    int _613 = abs(_595);
    float _615 = float(_591);
    float _617 = float(_541);
    bool _619 = _563 >= 0.0;
    bool _621 = isnan(_563);
    bool _623 = _619 || _621;
    bool _625 = isnan(0.0);
    bool _627 = _623 || _625;
    float _629 = _615 * _617;
    float _631 = float(_613);
    float _633 = float(_571);
    float _635 = _629 * (-2.0);
    float _637 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _639 = _415 + (-0.5);
    int _641 = _627 ? 0 : 1;
    float _643 = fma(_635, _573, _573);
    bool _645 = _563 > 0.0;
    float _647 = _631 * _633;
    float _649 = fma(_637, _635, _637);
    float _651 = fma(_639, (*spvDescriptorSet0.vp_c9)._m0[196].x, _643);
    int _653 = ~_641;
    int _655 = _653 + 1;
    int _657 = _655 + 1;
    float _659 = in.m_48.x;
    float _661 = in.m_48.y;
    float _663 = in.m_48.z;
    float _665 = _647 * (-2.0);
    bool _667 = !_555;
    int _669 = _667 ? 0 : 1;
    float _671 = fma(_649, _491, _651);
    bool _673 = _415 > 0.5;
    float _675 = fma(_511, _665, _511);
    int _677 = abs(_669);
    float _679 = _419 + _415;
    int _681 = _657;
    if (!_645)
    {
        int _683 = ~_641;
        int _685 = _683 + 1;
        _681 = _685;
    }
    int _687 = _681;
    float _689 = fma(_665, _575, _575);
    float _691 = _679 + (-1.0);
    bool _693 = _417 > 0.5;
    float _695 = _417 + (-0.5);
    float _697 = float(_677);
    float _699 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _701 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _699;
    float _703 = float(_687);
    float _705 = fma(_695, (*spvDescriptorSet0.vp_c9)._m0[196].y, _689);
    float _707 = -_589;
    int _709 = _523 ? as_type<int>(_707) : as_type<int>(_589);
    float _711 = 1.0 / _701;
    bool _713 = _419 > 0.5;
    float _715 = _697 * _703;
    float _717 = fma(_675, _491, _705);
    float _719 = _419 + (-0.5);
    float _721 = _661 + _455;
    float _723 = _661 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _725 = _717 * 0.15915493667125701904296875;
    float _727 = fma(_691, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _729 = _661 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _731 = _671 * 0.15915493667125701904296875;
    float _733 = fma(_659, (*spvDescriptorSet0.vp_c10)._m0[6].x, _723);
    bool _735 = !_611;
    float _737 = _735 ? _589 : as_type<float>(_709);
    float _739 = fma(_659, (*spvDescriptorSet0.vp_c10)._m0[4].x, _729);
    float _741 = _715 * (-2.0);
    float _743 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _745 = _413 + _743;
    float _747 = _731 * 6.283185482025146484375;
    float _749 = cos(_747);
    float _751 = fma(_663, (*spvDescriptorSet0.vp_c10)._m0[4].z, _739);
    float _753 = fma(_741, _577, _577);
    float _755 = fma(_727, _741, _727);
    bool _757 = _413 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _759 = isnan(_413);
    bool _761 = _757 || _759;
    bool _763 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _765 = _761 || _763;
    float _767 = float(_765);
    float _769 = _745 * _711;
    float _771 = fma(_719, (*spvDescriptorSet0.vp_c9)._m0[196].z, _753);
    float _773 = fma(_663, (*spvDescriptorSet0.vp_c10)._m0[6].z, _733);
    float _775 = _725 * 6.283185482025146484375;
    float _777 = sin(_775);
    float _779 = fma(_755, _491, _771);
    bool _781 = _413 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _783 = isnan(_413);
    bool _785 = _781 || _783;
    bool _787 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _789 = _785 || _787;
    float _791 = float(_789);
    float _793 = _367 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _795 = _779 * 0.15915493667125701904296875;
    float _797 = -_767;
    float _799 = _797 + 1.0;
    float _801 = _725 * 6.283185482025146484375;
    float _803 = cos(_801);
    float _805 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _807 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _805;
    float _809 = _791 * _799;
    float _811 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _813 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _811;
    float _815 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _585);
    float _817 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _819 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _817;
    float _821 = fma(_807, _769, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _823 = _731 * 6.283185482025146484375;
    float _825 = sin(_823);
    float _827 = fma(_813, _769, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _829 = fma(_819, _769, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _831 = _427 * _815;
    float _833 = _821 * _809;
    float _835 = _749 * _777;
    float _837 = _827 * _809;
    float _839 = _829 * _809;
    float _841 = _795 * 6.283185482025146484375;
    float _843 = cos(_841);
    float _845 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _589);
    float _847 = -_791;
    float _849 = _847 + 1.0;
    float _851 = _793 * _845;
    float _853 = _749 * _803;
    float _855 = fma(_849, (*spvDescriptorSet0.vp_c9)._m0[123].x, _833);
    float _857 = _795 * 6.283185482025146484375;
    float _859 = sin(_857);
    float _861 = _825 * _777;
    float _863 = _825 * _803;
    float _865 = fma(_849, (*spvDescriptorSet0.vp_c9)._m0[123].y, _837);
    float _867 = _749 * _843;
    float _869 = _825 * _843;
    float _871 = _777 * _843;
    float _873 = _803 * _843;
    float _875 = _867 * _851;
    float _877 = _869 * _851;
    float _879 = _867 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _881 = _867 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _883 = fma(_859, _853, _861);
    float _885 = -_835;
    float _887 = fma(_859, _863, _885);
    float _889 = -_863;
    float _891 = fma(_859, _835, _889);
    float _893 = -_851;
    float _895 = _859 * _893;
    float _897 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _899 = fma(_883, _831, _875);
    float _901 = fma(_887, _831, _877);
    float _903 = fma(_873, _831, _895);
    float _905 = fma(_859, _861, _853);
    float _907 = fma(_891, _897, _899);
    float _909 = _867 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _911 = fma(_871, _897, _903);
    float _913 = fma(_905, _897, _901);
    float _915 = _907 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _917 = _907 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _919 = fma(_849, (*spvDescriptorSet0.vp_c9)._m0[123].z, _839);
    float _921 = _751 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _923 = fma(_911, (*spvDescriptorSet0.vp_c8)._m0[24].x, _915);
    float _925 = fma(_911, (*spvDescriptorSet0.vp_c8)._m0[26].x, _917);
    float _927 = _773 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _929 = fma(_767, (*spvDescriptorSet0.vp_c9)._m0[124].x, _855);
    float _931 = fma(_913, (*spvDescriptorSet0.vp_c8)._m0[24].z, _923);
    float _933 = fma(_913, (*spvDescriptorSet0.vp_c8)._m0[26].z, _925);
    float _935 = fma(_767, (*spvDescriptorSet0.vp_c9)._m0[124].y, _865);
    float _937 = fma(_767, (*spvDescriptorSet0.vp_c9)._m0[124].z, _919);
    float _939 = _931 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _941 = _933 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _943 = -_859;
    float _945 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[24].x, _879);
    float _947 = -_859;
    float _949 = fma(_947, (*spvDescriptorSet0.vp_c8)._m0[25].x, _881);
    float _951 = _921 + _939;
    float _953 = _927 + _941;
    float _955 = -_859;
    float _957 = fma(_955, (*spvDescriptorSet0.vp_c8)._m0[26].x, _909);
    float _959 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[24].z, _945);
    float _961 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _963 = _951 + _961;
    float _965 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _967 = _953 + _965;
    float _969 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[25].z, _949);
    float _971 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[26].z, _957);
    float _973 = _963 * _963;
    float _975 = _967 * _967;
    float _977 = _883 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _979 = _883 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _981 = _883 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _983 = _973 + _975;
    float _985 = -_589;
    int _987 = _693 ? as_type<int>(_985) : as_type<int>(_589);
    float _989 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[24].x, _977);
    float _991 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[25].x, _979);
    float _993 = sqrt(_983);
    float _995 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[26].x, _981);
    bool _997 = !_603;
    float _999 = _997 ? _589 : as_type<float>(_987);
    float _1001 = _891 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1003 = _891 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1005 = _891 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1007 = _907 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1009 = fma(_871, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1001);
    float _1011 = fma(_871, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1003);
    float _1013 = fma(_871, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1005);
    float _1015 = fma(_911, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1007);
    float _1017 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1019 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[25].z, _991);
    float _1021 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[26].z, _995);
    float _1023 = fma(_913, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1015);
    float _1025 = _589 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _1027 = _993 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1029 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[24].z, _989);
    float _1031 = _1023 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1033 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1035 = _1025 * _959;
    float _1037 = _1025 * _969;
    float _1039 = _721 + _1031;
    float _1041 = _1025 * _971;
    float _1043 = -_585;
    int _1045 = _673 ? as_type<int>(_1043) : as_type<int>(_585);
    float _1047 = -_585;
    int _1049 = _713 ? as_type<int>(_1047) : as_type<int>(_585);
    float _1051 = _1031;
    float _1053 = _1025;
    float _1055 = _973;
    float _1057 = _975;
    float _1059 = _953;
    float _1061 = _927;
    if (!_1027)
    {
        _1051 = _951;
    }
    float _1063 = _1051;
    float _1065 = _1063;
    if (!_1027)
    {
        _1053 = _1039;
    }
    float _1067 = _1053;
    bool _1069 = !_1027;
    float _1071 = _1067;
    if (!_1069)
    {
        float _1073 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1075 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1077 = _993 + _1075;
        float _1079 = _1039 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1081 = rsqrt(_983);
        float _1083 = _1077 * _1073;
        float _1085 = _1083 * 0.15915493667125701904296875;
        float _1087 = _1085 * 6.283185482025146484375;
        float _1089 = sin(_1087);
        float _1091 = _1085 * 6.283185482025146484375;
        float _1093 = cos(_1091);
        float _1095 = fma(_1089, _1079, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1097 = _1081 * _1095;
        float _1099 = fma(_963, _1097, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1101 = _1093 + (-1.0);
        float _1103 = fma(_967, _1097, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1105 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1107 = _1099 + _1105;
        float _1109 = _1101 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1111 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1113 = _1103 + _1111;
        float _1115 = _1107 * _1107;
        float _1117 = fma(_1039, _1093, _1109);
        float _1119 = _1113 * _1113;
        _1071 = _1117;
        _1055 = _1115;
        _1057 = _1119;
        _1059 = _1103;
        _1065 = _1099;
    }
    float _1121 = _1071;
    float _1123 = _1055;
    float _1125 = _1057;
    float _1127 = _1059;
    float _1129 = _1065;
    float _1131 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1133 = _1121 + _1131;
    float _1135 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1137 = !_599;
    float _1139 = _1137 ? _585 : as_type<float>(_1045);
    float _1141 = -_737;
    float _1143 = _1141 + 0.5;
    float _1145 = fma(_1133, _1133, _1123);
    bool _1147 = !_607;
    float _1149 = _1147 ? _585 : as_type<float>(_1049);
    float _1151 = _585 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1153 = _1139 + 0.5;
    float _1155 = _1145 + _1125;
    float _1157 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1159 = _1149 + 0.5;
    float _1161 = _1153 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1163 = fma(_1151, _1029, _1035);
    float _1165 = fma(_1151, _1019, _1037);
    float _1167 = fma(_1151, _1021, _1041);
    float _1169 = _1159 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1171 = -_999;
    float _1173 = _1171 + 0.5;
    float _1175 = _1143 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1177 = fma(_905, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1009);
    float _1179 = fma(_905, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1011);
    float _1181 = fma(_905, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1013);
    float _1183 = _1169 * _1135;
    float _1185 = sqrt(_1155);
    float _1187 = _1173 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1189 = _1175 * _1157;
    float _1191 = _929 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1193 = _935 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1195 = _937 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1197 = _1161 * _1017;
    float _1199 = _1187 * _1033;
    float _1201 = _1191 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1203 = _1177 + _1163;
    float _1205 = _1179 + _1165;
    float _1207 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1209 = _1193 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1211 = _1195 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1213 = _1181 + _1167;
    out.m_72.x = _1197;
    out.m_72.y = _1199;
    out.m_72.z = _1183;
    out.m_72.w = _1189;
    bool _1215 = _1185 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1217 = isnan(_1185);
    bool _1219 = _1215 || _1217;
    bool _1221 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1223 = _1219 || _1221;
    out.m_74.x = _1201;
    out.m_74.y = _1209;
    out.m_74.z = _1211;
    out.m_74.w = _1207;
    out.m_76.x = _1203;
    out.m_76.y = _1205;
    out.m_76.z = _1213;
    float _1225 = _1193;
    if (!_1223)
    {
        _1225 = 1.0;
    }
    float _1227 = _1225;
    bool _1229 = !_1223;
    float _1231 = _1227;
    if (!_1229)
    {
        bool _1233 = _1185 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1235 = isnan(_1185);
        bool _1237 = _1233 || _1235;
        bool _1239 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1241 = _1237 || _1239;
        if (!_1241)
        {
            float _1243 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1245 = _1185 + _1243;
            float _1247 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1249 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1247;
            float _1251 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1253 = _1251 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1255 = 1.0 / _1249;
            float _1257 = _1245 * _1255;
            float _1259 = fma(_1257, _1253, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1231 = _1259;
            _1261 = true;
        }
        else
        {
            bool _1263 = _1185 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1265 = isnan(_1185);
            bool _1267 = _1263 || _1265;
            bool _1269 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1271 = _1267 || _1269;
            if (!_1271)
            {
                float _1273 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1275 = _1185 + _1273;
                float _1277 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1279 = _1277 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1281 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1283 = _1281 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1285 = 1.0 / _1279;
                float _1287 = _1275 * _1285;
                float _1289 = fma(_1287, _1283, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1231 = _1289;
                _1261 = true;
            }
            else
            {
                _1231 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1261 = false;
    float _1291 = _1231;
    float _1293 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1295 = _1127 + _1293;
    float _1297 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1299 = _1129 + _1297;
    float _1301 = fma(_1295, _1291, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1303 = fma(_1299, _1291, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1305 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _1307 = _1301 + _1305;
    float _1309 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _1311 = _1303 + _1309;
    float _1313 = fma(_1307, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1315 = fma(_1311, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _4383 = float2(_1315, _1313);
    float _1317 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_4383, float2(0.0), isnan(_4383)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_4383, float2(0.0), isnan(_4383)), level(0.0)).x;
    float _1319 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1321 = _1121 + _1319;
    float _1323 = -_921;
    float _1325 = _1323 + _1303;
    float _1327 = -_927;
    float _1329 = _1327 + _1301;
    float _1331 = fma(_1321, _1291, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1333 = -_721;
    float _1335 = _1333 + _1331;
    float _1337 = _1335 * _1335;
    float _1339 = fma(_1325, _1325, _1337);
    float _1341 = fma(_1329, _1329, _1339);
    float _1343 = sqrt(_1341);
    bool _1345 = _1343 > 0.0;
    bool _1347 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1349 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1351 = _1347 || _1349;
    bool _1353 = isnan(0.5);
    bool _1355 = _1351 || _1353;
    float _1357 = fma(_1317, 100.0, _721);
    float _1359 = fma(_1317, 100.0, _1331);
    float _1361 = _1357 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1363 = _1317;
    float _1365 = _1303;
    float _1367 = _1301;
    float _1369 = _1331;
    float _1371 = _1329;
    if (!_1345)
    {
        _1363 = _1359;
    }
    float _1373 = _1363;
    float _1375 = fma(_921, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1361);
    float _1377 = _1357 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1379 = fma(_927, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1375);
    float _1381 = fma(_921, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1377);
    float _1383 = _1379 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1385 = fma(_927, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1381);
    bool _1387 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1389 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1391 = _1387 || _1389;
    bool _1393 = isnan(0.5);
    bool _1395 = _1391 || _1393;
    float _1397 = 1.0 / _1383;
    float _1399 = _1385 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1401 = _1399 + _1383;
    bool _1403 = !_1345;
    float _1405 = _1373;
    float _1407 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _1409 = _1401;
    if (!_1403)
    {
        float _1411 = _183 * _183;
        float _1413 = fma(_181, _181, _1411);
        float _1415 = rsqrt(_1341);
        float _1417 = fma(_185, _185, _1413);
        float _1419 = sqrt(_1417);
        float _1421 = _1325 * _1415;
        float _1423 = _1335 * _1415;
        float _1425 = _1329 * _1415;
        bool _1427 = _1419 > 0.0;
        float _1429 = _1415;
        _1407 = _1419;
        _1369 = _1417;
        _1371 = _1425;
        if (!_1427)
        {
            _1429 = _1359;
        }
        float _1431 = _1429;
        bool _1433 = !_1427;
        _1405 = _1431;
        if (!_1433)
        {
            float _1435 = rsqrt(_1417);
            float _1437 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1439 = _183 * _1435;
            float _1441 = _181 * _1435;
            float _1443 = _1423 * _1439;
            float _1445 = _185 * _1435;
            float _1447 = fma(_1421, _1441, _1443);
            float _1449 = _1437 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1451 = fma(_1425, _1445, _1447);
            float _1453 = _1451 * _1449;
            float _1455 = fma(_181, _1453, _1303);
            float _1457 = fma(_183, _1453, _1359);
            float _1459 = fma(_185, _1453, _1301);
            _1365 = _1455;
            _1405 = _1457;
            _1367 = _1459;
            _1407 = _1453;
            _1369 = _1435;
        }
    }
    float _1461 = _1365;
    float _1463 = _1405;
    float _1465 = _1367;
    float _1467 = _1407;
    float _1469 = _1369;
    float _1471 = _1371;
    float _1473 = _1401 * _1397;
    float _1475 = _1473 * 0.5;
    float _1477 = _1467;
    float _1479 = _1469;
    float _1481 = _1471;
    if (_1355)
    {
        _189 = 1.0;
    }
    float _1483 = _189;
    float _1485 = _1483;
    if (_1395)
    {
        _191 = _1461;
    }
    float _1487 = _191;
    float _1489 = _1487;
    if (_1395)
    {
        _193 = _1463;
    }
    float _1491 = _193;
    float _1493 = _1491;
    if (_1395)
    {
        _1477 = _1465;
    }
    float _1495 = _1477;
    float _1497 = _1495;
    if (!_1395)
    {
        float _1499 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1501 = _1357 + _1499;
        float _1503 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1505 = _921 + _1503;
        float _1507 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1509 = -_921;
        float _1511 = _1509 + _1461;
        float _1513 = _1501 * _1501;
        float _1515 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1517 = _927 + _1515;
        float _1519 = -_1357;
        float _1521 = _1519 + _1463;
        float _1523 = -_927;
        float _1525 = _1523 + _1465;
        float _1527 = fma(_1505, _1505, _1513);
        float _1529 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1531 = fma(_1517, _1517, _1527);
        float _1533 = sqrt(_1531);
        float _1535 = _1507 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1537 = precise::min(_1533, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1539 = _1537 * _1529;
        float _1541 = _1535 * _1539;
        float _1543 = fma(_1511, _1541, _921);
        float _1545 = fma(_1521, _1541, _1357);
        float _1547 = fma(_1525, _1541, _927);
        _1493 = _1545;
        _1489 = _1543;
        _1497 = _1547;
        _1409 = _1507;
        _1479 = _1541;
    }
    float _1549 = _1493;
    float _1551 = _1489;
    float _1553 = _1497;
    float _1555 = _1409;
    float _1557 = _1479;
    float _1559 = _1557;
    float _1561 = _1555;
    if (!_1355)
    {
        float _1563 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1565 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1567 = fma(_1475, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1565);
        float _1569 = _1563 * 0.15915493667125701904296875;
        float _1571 = _1569 * 6.283185482025146484375;
        float _1573 = cos(_1571);
        float _1575 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1577 = _1575 * 0.15915493667125701904296875;
        float _1579 = _1569 * 6.283185482025146484375;
        float _1581 = sin(_1579);
        float _1583 = 1.0 / _1573;
        float _1585 = _1577 * 6.283185482025146484375;
        float _1587 = cos(_1585);
        float _1589 = _1581 * _1583;
        float _1591 = 1.0 / _1567;
        float _1593 = _1587 * _1589;
        float _1595 = _1577 * 6.283185482025146484375;
        float _1597 = sin(_1595);
        float _1599 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1601 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1599;
        float _1603 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1605 = _1591 * _1603;
        float _1607 = 1.0 / _1593;
        float _1609 = 1.0 / _1601;
        float _1611 = _1597 * _1607;
        float _1613 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1615 = fma(_1611, _1605, _1613);
        float _1617 = _1615 * _1609;
        float _1619 = precise::clamp(_1617, 0.0, 1.0);
        _1061 = _1577;
        _1485 = _1619;
    }
    float _1621 = _1061;
    float _1623 = _1485;
    float _1625 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1627 = _1549 + _1625;
    float _1629 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1631 = _1551 + _1629;
    float _1633 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1635 = _1553 + _1633;
    float _1637 = _1627 * _1627;
    float _1639 = fma(_1631, _1631, _1637);
    float _1641 = fma(_1635, _1635, _1639);
    float _1643 = rsqrt(_1641);
    float _1645 = sqrt(_1641);
    float _1647 = _1643 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1649 = _1631 * _1647;
    float _1651 = _1635 * _1647;
    float _1653 = _1649 * _1649;
    float _1655 = _1651 * _1651;
    float _1657 = _1653 + _1655;
    float _1659 = sqrt(_1657);
    bool _1661 = _1659 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1663 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1665 = _1659 + _1663;
    float _1667 = _1621;
    float _1669 = _1665;
    float _1671 = _1627;
    float _1673 = _1649;
    if (_1661)
    {
        float _1675 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1667 = _1675;
    }
    float _1677 = _1667;
    if (_1661)
    {
        float _1679 = rsqrt(_1657);
        _1559 = _1679;
    }
    float _1681 = _1559;
    float _1683 = _1681;
    if (_1661)
    {
        float _1685 = _1665 * _1677;
        _1669 = _1685;
    }
    float _1687 = _1669;
    if (_1661)
    {
        float _1689 = _1687 * 0.15915493667125701904296875;
        _1561 = _1689;
    }
    float _1691 = _1561;
    float _1693 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1695 = _1635;
    if (_1661)
    {
        float _1697 = _1691 * 6.283185482025146484375;
        float _1699 = sin(_1697);
        _1695 = _1699;
    }
    float _1701 = _1695;
    float _1703 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1705 = precise::max(0.0, _1703);
    float _1707 = _1677;
    float _1709 = _1705;
    if (_1661)
    {
        float _1711 = _1691 * 6.283185482025146484375;
        float _1713 = cos(_1711);
        _1707 = _1713;
    }
    float _1715 = _1707;
    float _1717 = -_1647;
    float _1719 = -_1705;
    float _1721 = fma(_1627, _1717, _1719);
    if (_1661)
    {
        float _1723 = _1721 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1671 = _1723;
    }
    float _1725 = _1671;
    float _1727 = _1725;
    float _1729 = _1701;
    if (_1661)
    {
        float _1731 = fma(_1701, _1725, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1727 = _1731;
    }
    float _1733 = _1727;
    float _1735 = _1733;
    if (!_1661)
    {
        _1729 = _1653;
    }
    float _1737 = _1729;
    float _1739 = _1549 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1741 = _1737;
    float _1743 = _1715;
    if (_1661)
    {
        float _1745 = _1715 + (-1.0);
        _1709 = _1745;
    }
    float _1747 = _1709;
    float _1749 = _1747;
    if (_1661)
    {
        float _1751 = _1681 * _1733;
        _1481 = _1751;
    }
    float _1753 = _1481;
    if (!_1661)
    {
        _1735 = _1721;
    }
    float _1755 = _1735;
    float _1757 = fma(_1551, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1739);
    float _1759 = _1755;
    if (_1661)
    {
        float _1761 = _1747 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1683 = _1761;
    }
    float _1763 = _1683;
    if (_1661)
    {
        float _1765 = _1649 * _1753;
        _1673 = _1765;
    }
    float _1767 = _1673;
    if (!_1661)
    {
        _1749 = _1651;
    }
    float _1769 = _1749;
    float _1771 = _1769;
    if (_1661)
    {
        float _1773 = _1651 * _1753;
        _1771 = _1773;
    }
    float _1775 = _1771;
    if (_1661)
    {
        float _1777 = fma(_1721, _1715, _1763);
        _1759 = _1777;
    }
    float _1779 = _1759;
    if (_1661)
    {
        float _1781 = _1767 * _1767;
        _1741 = _1781;
    }
    float _1783 = _1741;
    if (!_1661)
    {
        _1743 = _1655;
    }
    float _1785 = _1743;
    float _1787 = _1785;
    if (_1661)
    {
        float _1789 = _1775 * _1775;
        _1787 = _1789;
    }
    float _1791 = _1787;
    float _1793 = fma(_1779, _1779, _1783);
    float _1795 = _1549 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1797 = _1793 + _1791;
    float _1799 = fma(_1551, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1795);
    float _1801 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1803 = fma(_1645, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1801);
    float _1805 = precise::clamp(_1803, 0.0, 1.0);
    float _1807 = _1549 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1809 = rsqrt(_1797);
    float _1811 = fma(_1553, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1799);
    float _1813 = -_1805;
    float _1815 = _1813 + 1.0;
    float _1817 = fma(_1551, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1807);
    float _1819 = _1549 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1821 = _1811 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1823 = fma(_1553, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1817);
    float _1825 = abs(_1815);
    float _1827 = log2(_1825);
    float _1829 = fma(_1551, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1819);
    float _1831 = _1821 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1833 = fma(_1553, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1829);
    float _1835 = -_1831;
    float _1837 = fma(_1835, _1693, 1.0);
    float _1839 = _1823 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1841 = _1809 * _1767;
    float _1843 = fma(_1553, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1757);
    float _1845 = _1833 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1847 = _1839 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1849 = _1809 * _1779;
    float _1851 = _1841 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1853 = _1809 * _1775;
    float _1855 = fma(_1845, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1847);
    float _1857 = _1827 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1859 = -_1851;
    float _1861 = fma(_1849, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1859);
    float _1863 = _1843 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1865 = fma(_1821, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1855);
    float _1867 = exp2(_1857);
    float _1869 = -_1853;
    float _1871 = fma(_1869, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1861);
    float _1873 = _1839 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1875 = fma(_1863, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1865);
    float _1877 = _1839 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1879 = fma(_1871, -0.5, 0.5);
    float _1881 = fma(_1871, 0.5, 0.5);
    float _1883 = fma(_1845, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1873);
    float _1885 = log2(_1837);
    float _1887 = _1849 + 1.0;
    float _1889 = fma(_1881, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1891 = fma(_1821, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1883);
    float _1893 = fma(_1881, _1889, -0.212114393711090087890625);
    float _1895 = 1.0 / _1875;
    float _1897 = fma(_1845, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1877);
    float _1899 = -_1849;
    float _1901 = fma(_1867, _1887, _1899);
    float _1903 = fma(_1863, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1891);
    float _1905 = fma(_1881, _1893, 1.570728778839111328125);
    float _1907 = fma(_1821, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1897);
    float _1909 = fma(_1901, 0.5, 0.5);
    float _1911 = sqrt(_1879);
    float _1913 = fma(_1863, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1907);
    float _1915 = _1885 * 0.693147182464599609375;
    float _1917 = _1915 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1919 = _1903 * _1895;
    float _1921 = _1913 * _1895;
    float _1923 = fma(_1919, 0.5, 0.5);
    float _1925 = fma(_1921, -0.5, 0.5);
    float _1927 = _1911 * 0.636619746685028076171875;
    float3 _5353 = float3(_1923, _1925, _1917);
    float _1929 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5353, float3(0.0), isnan(_5353)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5353, float3(0.0), isnan(_5353)), level(0.0)).x;
    float _1931 = -_1905;
    float _1933 = fma(_1927, _1931, 1.0);
    float3 _5369 = float3(_1923, _1925, _1917);
    float4 _1936 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5369, float3(0.0), isnan(_5369)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5369, float3(0.0), isnan(_5369)), level(0.0)).xyzw;
    float _1938 = _1936.x;
    float _1940 = _1936.y;
    float _1942 = _1936.z;
    float _1944 = _1936.w;
    float2 _5385 = float2(_1933, _1909);
    float3 _1948 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5385, float2(0.0), isnan(_5385)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5385, float2(0.0), isnan(_5385)), level(0.0)).xyz;
    float _1950 = _1948.x;
    float _1952 = _1948.y;
    float _1954 = _1948.z;
    float _1956 = _1827 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1958 = _1839 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1960 = _1645 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1962 = isnan(_1645);
    bool _1964 = _1960 || _1962;
    bool _1966 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1968 = _1964 || _1966;
    float _1970 = fma(_1845, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1958);
    float _1972 = exp2(_1956);
    float _1974 = _1875 * 0.5;
    float _1976 = fma(_1821, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1970);
    float _1978 = fma(_1913, -0.5, _1974);
    float _1980 = fma(_1863, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1976);
    float _1982 = _1903 + _1875;
    float _1984 = _1980 + _1875;
    float _1986 = _1982 * 0.5;
    out.gl_Position.x = _1903;
    out.gl_Position.y = _1913;
    out.gl_Position.z = _1980;
    out.gl_Position.w = _1875;
    float _1988 = _1984 * 0.5;
    float _1990 = -_1972;
    float _1992 = _1990 + 1.0;
    float _1994 = _1992 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_78.x = _1986;
    out.m_78.y = _1978;
    out.m_78.z = _1988;
    out.m_78.w = _1875;
    float _1996 = -_1994;
    float _1998 = _1996 + 1.0;
    float _2000 = _1875;
    float _2002 = _1980;
    float _2004 = _1913;
    float _2006 = _1903;
    float _2008 = _1998;
    if (!_1968)
    {
        _2000 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2010 = _2000;
    float _2012 = _2010;
    float _2014 = _2010;
    if (!_1968)
    {
        _2002 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2016 = _2002;
    float _2018 = _2016;
    float _2020 = _2016;
    if (!_1968)
    {
        _2004 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2022 = _2004;
    float _2024 = _2022;
    float _2026 = _2022;
    if (!_1968)
    {
        _2006 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2028 = _2006;
    float _2030 = _1623 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2032 = _1994 * _1929;
    float _2034 = _1944 * _2032;
    float _2036 = _1944 * _1998;
    float _2038 = _2034;
    float _2040 = _2028;
    float _2042 = _2028;
    if (!_1968)
    {
        _2008 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2044 = _2008;
    float _2046 = _1954 * _2032;
    float _2048 = fma(_1950, _2034, _1938);
    float _2050 = fma(_1952, _2034, _1940);
    float _2052 = _2044;
    float _2054 = _2044;
    if (!_1968)
    {
        _2038 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2056 = _2038;
    float _2058 = fma(_1944, _2046, _1942);
    out.m_80.x = _2048;
    out.m_80.y = _2050;
    out.m_80.z = _2058;
    out.m_80.w = _2036;
    bool _2060 = !_1968;
    float _2062 = _2056;
    float _2064 = _2056;
    if (!_2060)
    {
        bool _2066 = _1645 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2068 = isnan(_1645);
        bool _2070 = _2066 || _2068;
        bool _2072 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2074 = _2070 || _2072;
        if (!_2074)
        {
            float _2076 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2078 = _1645 + _2076;
            float _2080 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2082 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2080;
            float _2084 = 1.0 / _2082;
            float _2086 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2088 = _2086 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2090 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2092 = _2090 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2094 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2096 = _2094 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2098 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2100 = _2098 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2102 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2104 = _2102 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2106 = _2078 * _2084;
            float _2108 = precise::clamp(_2106, 0.0, 1.0);
            float _2110 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2112 = _2110 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2114 = fma(_2108, _2088, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2116 = fma(_2108, _2112, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2118 = fma(_2108, _2092, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2120 = fma(_2108, _2096, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2122 = fma(_2108, _2100, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2124 = fma(_2108, _2104, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2054 = _2116;
            _2026 = _2122;
            _2064 = _2114;
            _2020 = _2120;
            _2014 = _2118;
            _2042 = _2124;
            _2126 = true;
        }
        else
        {
            bool _2128 = _1645 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2130 = isnan(_1645);
            bool _2132 = _2128 || _2130;
            bool _2134 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2136 = _2132 || _2134;
            if (!_2136)
            {
                _2062 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2138 = _2062;
            _2064 = _2138;
            if (!_2136)
            {
                _2052 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2140 = _2052;
            _2054 = _2140;
            if (!_2136)
            {
                _2012 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2142 = _2012;
            _2014 = _2142;
            if (!_2136)
            {
                _2018 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2144 = _2018;
            _2020 = _2144;
            if (!_2136)
            {
                _2024 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2146 = _2024;
            _2026 = _2146;
            if (!_2136)
            {
                _2040 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2148 = _2040;
            bool _2150 = !_2136;
            _2042 = _2148;
            if (!_2150)
            {
                bool _2152 = _1645 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2154 = isnan(_1645);
                bool _2156 = _2152 || _2154;
                bool _2158 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2160 = _2156 || _2158;
                if (!_2160)
                {
                    float _2162 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2164 = _1645 + _2162;
                    float _2166 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2168 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2166;
                    float _2170 = 1.0 / _2168;
                    float _2172 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2174 = _2172 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2176 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2178 = _2176 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2180 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2182 = _2180 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2184 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2186 = _2184 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2188 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2190 = _2188 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2192 = _2164 * _2170;
                    float _2194 = precise::clamp(_2192, 0.0, 1.0);
                    float _2196 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2198 = _2196 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2200 = fma(_2194, _2174, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2202 = fma(_2194, _2198, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2204 = fma(_2194, _2178, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2206 = fma(_2194, _2182, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2208 = fma(_2194, _2186, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2210 = fma(_2194, _2190, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2054 = _2202;
                    _2026 = _2208;
                    _2064 = _2200;
                    _2020 = _2206;
                    _2014 = _2204;
                    _2042 = _2210;
                    _2126 = true;
                }
                else
                {
                    _2054 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2026 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2064 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2020 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2014 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2042 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2126 = false;
    float _2212 = _2054;
    float _2214 = _2026;
    float _2216 = _2064;
    float _2218 = _2020;
    float _2220 = _2014;
    float _2222 = _2042;
    float _2224 = fma(_1205, -0.5, 0.5);
    float _2226 = precise::clamp(_2224, 0.0, 1.0);
    float _2228 = -_2212;
    float _2230 = _2228 + _2214;
    float _2232 = -_2216;
    float _2234 = _2232 + _2218;
    out.m_82.x = 0.0;
    float _2236 = -_2220;
    float _2238 = _2236 + _2222;
    float _2240 = fma(_2226, _2230, _2212);
    float _2242 = fma(_2226, _2234, _2216);
    bool _2244 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2246 = _2240 * 0.586610972881317138671875;
    float _2248 = fma(_2226, _2238, _2220);
    float _2250 = _2030 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2252 = fma(_2242, 0.298911988735198974609375, _2246);
    bool _2254 = _1623 > 0.0;
    bool _2256 = isnan(_1623);
    bool _2258 = _2254 || _2256;
    bool _2260 = isnan(0.0);
    bool _2262 = _2258 || _2260;
    float _2264 = fma(_2248, 0.114477999508380889892578125, _2252);
    out.m_51.x = _2250;
    float _2266 = -_2264;
    float _2268 = _2242 + _2266;
    float _2270 = -_2264;
    float _2272 = _2240 + _2270;
    float _2274 = -_2264;
    float _2276 = _2248 + _2274;
    float _2278 = fma(_2268, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2264);
    float _2280 = fma(_2272, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2264);
    float _2282 = fma(_2276, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2264);
    bool _2284 = !_2244;
    if (!_2284)
    {
        float _2286 = -_1549;
        float _2288 = _2286 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2290 = -_1551;
        float _2292 = _2290 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2294 = -_1553;
        float _2296 = _2294 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2298 = _2288 * _2288;
        float _2300 = fma(_2292, _2292, _2298);
        float _2302 = fma(_2296, _2296, _2300);
        float _2304 = sqrt(_2302);
        float _2306 = rsqrt(_2302);
        float _2308 = -_2304;
        float _2310 = _2308 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2312 = _2310 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2314 = precise::clamp(_2312, 0.0, 1.0);
        float _2316 = _2292 * _2306;
        float _2318 = _2288 * _2306;
        float _2320 = abs(_2314);
        float _2322 = log2(_2320);
        float _2324 = _2296 * _2306;
        float _2326 = _2316 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2328 = _1205 * _2318;
        float _2330 = -_2318;
        float _2332 = -_2326;
        float _2334 = fma(_2330, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2332);
        float _2336 = fma(_1203, _2316, _2328);
        float _2338 = -_2324;
        float _2340 = fma(_2338, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2334);
        float _2342 = fma(_1213, _2324, _2336);
        float _2344 = precise::clamp(_2342, 0.0, 1.0);
        float _2346 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2348 = _2340 + _2346;
        float _2350 = _2322 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2352 = _2348 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2354 = precise::clamp(_2352, 0.0, 1.0);
        float _2356 = exp2(_2350);
        float _2358 = _2356 * _2354;
        float _2360 = _2344 * _2358;
        float _2362 = _2360 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2364 = _2360 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2366 = _2360 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_82.x = _2362;
        out.m_82.y = _2364;
        out.m_82.z = _2366;
    }
    out.m_84.x = _2278;
    out.m_84.y = _2280;
    out.m_84.z = _2282;
    if (_2262)
    {
        return out;
    }
    out.m_51.x = 0.0;
    float _2368 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2368;
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
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2126 = false;
    bool _1261 = false;
    bool _309 = false;
    bool _213 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _98 = in.m_48.w;
    float _100 = trunc(_98);
    int _103 = int(_100);
    bool _107 = _103 >= 1;
    float _109 = 0.0;
    float _111 = as_type<float>(_103);
    if (!_107)
    {
        _109 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _113 = _109;
    if (!_107)
    {
        out.m_51.x = 0.0;
    }
    int _115 = 0;
    if (!_107)
    {
        float _117 = _113 * 5.0;
        _115 = as_type<int>(_117);
    }
    int _119 = _115;
    int _121 = _119;
    if (!_107)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2426 = as_type<float>(_119);
        out.gl_Position.z = _2426;
    }
    if (!_107)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _123 = in.m_53.w;
    float _125 = float(_103);
    float _127 = 1.0 / _125;
    float _129 = -_123;
    float _131 = _129 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _133 = _123 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _135 = isnan(_123);
    bool _137 = _133 || _135;
    bool _139 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _141 = _137 || _139;
    float _143 = _131 * _127;
    bool _145 = _131 >= _125;
    bool _147 = !_141;
    bool _149 = _145 || _147;
    out.m_55.x = _143;
    float _151 = _143;
    float _153 = _131;
    if (_149)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _155 = _111;
    if (_149)
    {
        out.m_51.x = 0.0;
    }
    if (_149)
    {
        float _157 = _155 * 5.0;
        _121 = as_type<int>(_157);
    }
    int _159 = _121;
    if (_149)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2498 = as_type<float>(_159);
        out.gl_Position.z = _2498;
    }
    if (_149)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _161 = in.m_57.x;
    float _163 = in.m_57.y;
    float _165 = in.m_57.z;
    bool _167 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _169 = _163 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _171 = _163 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _173 = _163 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _175 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[4].x, _169);
    float _177 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[5].x, _171);
    float _179 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[6].x, _173);
    float _181 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[4].z, _175);
    float _183 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[5].z, _177);
    float _185 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[6].z, _179);
    bool _187 = !_167;
    float _189 = _185;
    float _191 = _183;
    float _193 = _181;
    float _211;
    if (!_187)
    {
        float _195 = in.m_59.x;
        float _197 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _199 = _195 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _201 = fma(_199, (*spvDescriptorSet0.vp_c9)._m0[12].x, _131);
        float _203 = _201 * _197;
        float _205 = floor(_203);
        float _207 = -_205;
        float _209 = _203 + _207;
        _211 = _209;
        _213 = true;
    }
    else
    {
        _211 = _143;
    }
    _213 = false;
    float _215 = _211;
    float _217 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _219 = _215 + _217;
    bool _221 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _223 = isnan(_215);
    bool _225 = _221 || _223;
    bool _227 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _229 = _225 || _227;
    float _231 = float(_229);
    float _233 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _235 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _233;
    float _237 = -_231;
    float _239 = _237 + 1.0;
    bool _241 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _243 = isnan(_215);
    bool _245 = _241 || _243;
    bool _247 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _249 = _245 || _247;
    float _251 = float(_249);
    float _253 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _255 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _253;
    bool _257 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _259 = 1.0 / _235;
    float _261 = _251 * _239;
    float _263 = -_251;
    float _265 = _263 + 1.0;
    float _267 = _219 * _259;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _271 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _269;
    float _273 = fma(_255, _267, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _275 = fma(_271, _267, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _277 = _273 * _261;
    float _279 = _275 * _261;
    float _281 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[143].x, _277);
    float _283 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[143].y, _279);
    float _285 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[144].x, _281);
    float _287 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[144].y, _283);
    bool _289 = !_257;
    float _307;
    if (!_289)
    {
        float _291 = in.m_59.x;
        float _293 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _295 = _291 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _297 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[11].y, _131);
        float _299 = _297 * _293;
        float _301 = floor(_299);
        float _303 = -_301;
        float _305 = _299 + _303;
        _307 = _305;
        _309 = true;
    }
    else
    {
        _307 = _143;
    }
    _309 = false;
    float _311 = _307;
    float _313 = in.m_61.x;
    float _315 = in.m_61.y;
    bool _317 = _311 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _319 = isnan(_311);
    bool _321 = _317 || _319;
    bool _323 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _325 = _321 || _323;
    float _327 = float(_325);
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _331 = _329 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _333 = _311 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _335 = isnan(_311);
    bool _337 = _333 || _335;
    bool _339 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _341 = _337 || _339;
    float _343 = float(_341);
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _347 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _345;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _351 = _311 + _349;
    float _353 = -_327;
    float _355 = _353 + 1.0;
    bool _357 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _359 = 1.0 / _331;
    float _361 = _343 * _355;
    float _363 = -_343;
    float _365 = _363 + 1.0;
    float _367 = _287 * _315;
    float _369 = _285 * _313;
    float _371 = _347 * _359;
    float _373 = fma(_371, _351, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _375 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _377 = _373 * _361;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _381 = _375 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _383 = fma(_365, (*spvDescriptorSet0.vp_c9)._m0[115].x, _377);
    float _385 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _387 = _379 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _389 = fma(_327, (*spvDescriptorSet0.vp_c9)._m0[116].x, _383);
    float _391 = _385 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _393 = _389 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_63.x = _391;
    out.m_63.y = _387;
    out.m_63.z = _381;
    out.m_63.w = _393;
    bool _395 = !_357;
    if (!_395)
    {
        float _397 = in.m_59.x;
        float _399 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _401 = _397 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _403 = fma(_401, (*spvDescriptorSet0.vp_c9)._m0[11].z, _131);
        float _405 = _403 * _399;
        float _407 = floor(_405);
        float _409 = -_407;
        float _411 = _405 + _409;
        _151 = _411;
    }
    float _413 = _151;
    float _415 = in.m_59.x;
    float _417 = in.m_59.y;
    float _419 = in.m_59.z;
    float _421 = in.m_59.w;
    float _423 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _425 = log2(_423);
    float _427 = _369 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _429 = as_type<float>(int(gl_VertexIndex));
    bool _431 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _433 = isnan(0.0);
    bool _435 = _431 || _433;
    bool _437 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _439 = _435 || _437;
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _443 = 1.0 + _441;
    bool _445 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _447 = isnan(1.0);
    bool _449 = _445 || _447;
    bool _451 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _453 = _449 || _451;
    float _455 = in.m_68.y;
    float _457 = 1.0 / _443;
    float _459 = _425 * _131;
    float _461 = exp2(_459);
    float _463 = _419 * 2.0;
    float _465 = _415 * 2.0;
    float _467 = floor(_463);
    float _469 = floor(_465);
    float _471 = -_461;
    float _473 = _471 + 1.0;
    float _475 = _439 ? _473 : 0.0;
    bool _477 = _467 > 0.0;
    bool _479 = _467 >= 0.0;
    bool _481 = isnan(_467);
    bool _483 = _479 || _481;
    bool _485 = isnan(0.0);
    bool _487 = _483 || _485;
    if (_453)
    {
        float _489 = _475 * _457;
        _153 = _489;
    }
    float _491 = _153;
    float _493 = _417 + _419;
    int _495 = _487 ? 0 : 1;
    bool _497 = _469 > 0.0;
    float _499 = _493 + (-1.0);
    bool _501 = _469 >= 0.0;
    bool _503 = isnan(_469);
    bool _505 = _501 || _503;
    bool _507 = isnan(0.0);
    bool _509 = _505 || _507;
    float _511 = fma(_499, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _513 = as_type<int>(_429) & 1;
    bool _515 = _513 != 0;
    int _517 = as_type<int>(_429) & 2;
    bool _519 = _517 != 0;
    float _521 = _417 + _415;
    bool _523 = _421 > 0.5;
    float _525 = _521 + (-1.0);
    int _527 = ~_495;
    int _529 = _527 + 1;
    int _531 = _529 + 1;
    int _533 = _509 ? 0 : 1;
    int _535 = _531;
    if (!_477)
    {
        int _537 = ~_495;
        int _539 = _537 + 1;
        _535 = _539;
    }
    int _541 = _535;
    float _543 = _417 * 2.0;
    int _545 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _547 = _545 != 0;
    int _549 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _551 = _549 != 0;
    int _553 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _555 = _553 != 0;
    int _557 = ~_533;
    int _559 = _557 + 1;
    int _561 = _559 + 1;
    float _563 = floor(_543);
    int _565 = _561;
    if (!_497)
    {
        int _567 = ~_533;
        int _569 = _567 + 1;
        _565 = _569;
    }
    int _571 = _565;
    float _573 = in.m_70.x;
    float _575 = in.m_70.y;
    float _577 = in.m_70.z;
    bool _579 = !_547;
    int _581 = _579 ? 0 : 1;
    bool _583 = !_515;
    float _585 = _583 ? (-0.5) : 0.5;
    bool _587 = !_519;
    float _589 = _587 ? (-0.5) : 0.5;
    int _591 = abs(_581);
    bool _593 = !_551;
    int _595 = _593 ? 0 : 1;
    int _597 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _599 = _597 != 0;
    int _601 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _603 = _601 != 0;
    int _605 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _607 = _605 != 0;
    int _609 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _611 = _609 != 0;
    int _613 = abs(_595);
    float _615 = float(_591);
    float _617 = float(_541);
    bool _619 = _563 >= 0.0;
    bool _621 = isnan(_563);
    bool _623 = _619 || _621;
    bool _625 = isnan(0.0);
    bool _627 = _623 || _625;
    float _629 = _615 * _617;
    float _631 = float(_613);
    float _633 = float(_571);
    float _635 = _629 * (-2.0);
    float _637 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _639 = _415 + (-0.5);
    int _641 = _627 ? 0 : 1;
    float _643 = fma(_635, _573, _573);
    bool _645 = _563 > 0.0;
    float _647 = _631 * _633;
    float _649 = fma(_637, _635, _637);
    float _651 = fma(_639, (*spvDescriptorSet0.vp_c9)._m0[196].x, _643);
    int _653 = ~_641;
    int _655 = _653 + 1;
    int _657 = _655 + 1;
    float _659 = in.m_48.x;
    float _661 = in.m_48.y;
    float _663 = in.m_48.z;
    float _665 = _647 * (-2.0);
    bool _667 = !_555;
    int _669 = _667 ? 0 : 1;
    float _671 = fma(_649, _491, _651);
    bool _673 = _415 > 0.5;
    float _675 = fma(_511, _665, _511);
    int _677 = abs(_669);
    float _679 = _419 + _415;
    int _681 = _657;
    if (!_645)
    {
        int _683 = ~_641;
        int _685 = _683 + 1;
        _681 = _685;
    }
    int _687 = _681;
    float _689 = fma(_665, _575, _575);
    float _691 = _679 + (-1.0);
    bool _693 = _417 > 0.5;
    float _695 = _417 + (-0.5);
    float _697 = float(_677);
    float _699 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _701 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _699;
    float _703 = float(_687);
    float _705 = fma(_695, (*spvDescriptorSet0.vp_c9)._m0[196].y, _689);
    float _707 = -_589;
    int _709 = _523 ? as_type<int>(_707) : as_type<int>(_589);
    float _711 = 1.0 / _701;
    bool _713 = _419 > 0.5;
    float _715 = _697 * _703;
    float _717 = fma(_675, _491, _705);
    float _719 = _419 + (-0.5);
    float _721 = _661 + _455;
    float _723 = _661 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _725 = _717 * 0.15915493667125701904296875;
    float _727 = fma(_691, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _729 = _661 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _731 = _671 * 0.15915493667125701904296875;
    float _733 = fma(_659, (*spvDescriptorSet0.vp_c10)._m0[6].x, _723);
    bool _735 = !_611;
    float _737 = _735 ? _589 : as_type<float>(_709);
    float _739 = fma(_659, (*spvDescriptorSet0.vp_c10)._m0[4].x, _729);
    float _741 = _715 * (-2.0);
    float _743 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _745 = _413 + _743;
    float _747 = _731 * 6.283185482025146484375;
    float _749 = cos(_747);
    float _751 = fma(_663, (*spvDescriptorSet0.vp_c10)._m0[4].z, _739);
    float _753 = fma(_741, _577, _577);
    float _755 = fma(_727, _741, _727);
    bool _757 = _413 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _759 = isnan(_413);
    bool _761 = _757 || _759;
    bool _763 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _765 = _761 || _763;
    float _767 = float(_765);
    float _769 = _745 * _711;
    float _771 = fma(_719, (*spvDescriptorSet0.vp_c9)._m0[196].z, _753);
    float _773 = fma(_663, (*spvDescriptorSet0.vp_c10)._m0[6].z, _733);
    float _775 = _725 * 6.283185482025146484375;
    float _777 = sin(_775);
    float _779 = fma(_755, _491, _771);
    bool _781 = _413 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _783 = isnan(_413);
    bool _785 = _781 || _783;
    bool _787 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _789 = _785 || _787;
    float _791 = float(_789);
    float _793 = _367 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _795 = _779 * 0.15915493667125701904296875;
    float _797 = -_767;
    float _799 = _797 + 1.0;
    float _801 = _725 * 6.283185482025146484375;
    float _803 = cos(_801);
    float _805 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _807 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _805;
    float _809 = _791 * _799;
    float _811 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _813 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _811;
    float _815 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _585);
    float _817 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _819 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _817;
    float _821 = fma(_807, _769, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _823 = _731 * 6.283185482025146484375;
    float _825 = sin(_823);
    float _827 = fma(_813, _769, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _829 = fma(_819, _769, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _831 = _427 * _815;
    float _833 = _821 * _809;
    float _835 = _749 * _777;
    float _837 = _827 * _809;
    float _839 = _829 * _809;
    float _841 = _795 * 6.283185482025146484375;
    float _843 = cos(_841);
    float _845 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _589);
    float _847 = -_791;
    float _849 = _847 + 1.0;
    float _851 = _793 * _845;
    float _853 = _749 * _803;
    float _855 = fma(_849, (*spvDescriptorSet0.vp_c9)._m0[123].x, _833);
    float _857 = _795 * 6.283185482025146484375;
    float _859 = sin(_857);
    float _861 = _825 * _777;
    float _863 = _825 * _803;
    float _865 = fma(_849, (*spvDescriptorSet0.vp_c9)._m0[123].y, _837);
    float _867 = _749 * _843;
    float _869 = _825 * _843;
    float _871 = _777 * _843;
    float _873 = _803 * _843;
    float _875 = _867 * _851;
    float _877 = _869 * _851;
    float _879 = _867 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _881 = _867 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _883 = fma(_859, _853, _861);
    float _885 = -_835;
    float _887 = fma(_859, _863, _885);
    float _889 = -_863;
    float _891 = fma(_859, _835, _889);
    float _893 = -_851;
    float _895 = _859 * _893;
    float _897 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _899 = fma(_883, _831, _875);
    float _901 = fma(_887, _831, _877);
    float _903 = fma(_873, _831, _895);
    float _905 = fma(_859, _861, _853);
    float _907 = fma(_891, _897, _899);
    float _909 = _867 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _911 = fma(_871, _897, _903);
    float _913 = fma(_905, _897, _901);
    float _915 = _907 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _917 = _907 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _919 = fma(_849, (*spvDescriptorSet0.vp_c9)._m0[123].z, _839);
    float _921 = _751 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _923 = fma(_911, (*spvDescriptorSet0.vp_c8)._m0[24].x, _915);
    float _925 = fma(_911, (*spvDescriptorSet0.vp_c8)._m0[26].x, _917);
    float _927 = _773 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _929 = fma(_767, (*spvDescriptorSet0.vp_c9)._m0[124].x, _855);
    float _931 = fma(_913, (*spvDescriptorSet0.vp_c8)._m0[24].z, _923);
    float _933 = fma(_913, (*spvDescriptorSet0.vp_c8)._m0[26].z, _925);
    float _935 = fma(_767, (*spvDescriptorSet0.vp_c9)._m0[124].y, _865);
    float _937 = fma(_767, (*spvDescriptorSet0.vp_c9)._m0[124].z, _919);
    float _939 = _931 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _941 = _933 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _943 = -_859;
    float _945 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[24].x, _879);
    float _947 = -_859;
    float _949 = fma(_947, (*spvDescriptorSet0.vp_c8)._m0[25].x, _881);
    float _951 = _921 + _939;
    float _953 = _927 + _941;
    float _955 = -_859;
    float _957 = fma(_955, (*spvDescriptorSet0.vp_c8)._m0[26].x, _909);
    float _959 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[24].z, _945);
    float _961 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _963 = _951 + _961;
    float _965 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _967 = _953 + _965;
    float _969 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[25].z, _949);
    float _971 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[26].z, _957);
    float _973 = _963 * _963;
    float _975 = _967 * _967;
    float _977 = _883 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _979 = _883 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _981 = _883 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _983 = _973 + _975;
    float _985 = -_589;
    int _987 = _693 ? as_type<int>(_985) : as_type<int>(_589);
    float _989 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[24].x, _977);
    float _991 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[25].x, _979);
    float _993 = sqrt(_983);
    float _995 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[26].x, _981);
    bool _997 = !_603;
    float _999 = _997 ? _589 : as_type<float>(_987);
    float _1001 = _891 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1003 = _891 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1005 = _891 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1007 = _907 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1009 = fma(_871, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1001);
    float _1011 = fma(_871, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1003);
    float _1013 = fma(_871, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1005);
    float _1015 = fma(_911, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1007);
    float _1017 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1019 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[25].z, _991);
    float _1021 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[26].z, _995);
    float _1023 = fma(_913, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1015);
    float _1025 = _589 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _1027 = _993 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1029 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[24].z, _989);
    float _1031 = _1023 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1033 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1035 = _1025 * _959;
    float _1037 = _1025 * _969;
    float _1039 = _721 + _1031;
    float _1041 = _1025 * _971;
    float _1043 = -_585;
    int _1045 = _673 ? as_type<int>(_1043) : as_type<int>(_585);
    float _1047 = -_585;
    int _1049 = _713 ? as_type<int>(_1047) : as_type<int>(_585);
    float _1051 = _1031;
    float _1053 = _1025;
    float _1055 = _973;
    float _1057 = _975;
    float _1059 = _953;
    float _1061 = _927;
    if (!_1027)
    {
        _1051 = _951;
    }
    float _1063 = _1051;
    float _1065 = _1063;
    if (!_1027)
    {
        _1053 = _1039;
    }
    float _1067 = _1053;
    bool _1069 = !_1027;
    float _1071 = _1067;
    if (!_1069)
    {
        float _1073 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1075 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1077 = _993 + _1075;
        float _1079 = _1039 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1081 = rsqrt(_983);
        float _1083 = _1077 * _1073;
        float _1085 = _1083 * 0.15915493667125701904296875;
        float _1087 = _1085 * 6.283185482025146484375;
        float _1089 = sin(_1087);
        float _1091 = _1085 * 6.283185482025146484375;
        float _1093 = cos(_1091);
        float _1095 = fma(_1089, _1079, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1097 = _1081 * _1095;
        float _1099 = fma(_963, _1097, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1101 = _1093 + (-1.0);
        float _1103 = fma(_967, _1097, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1105 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1107 = _1099 + _1105;
        float _1109 = _1101 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1111 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1113 = _1103 + _1111;
        float _1115 = _1107 * _1107;
        float _1117 = fma(_1039, _1093, _1109);
        float _1119 = _1113 * _1113;
        _1071 = _1117;
        _1055 = _1115;
        _1057 = _1119;
        _1059 = _1103;
        _1065 = _1099;
    }
    float _1121 = _1071;
    float _1123 = _1055;
    float _1125 = _1057;
    float _1127 = _1059;
    float _1129 = _1065;
    float _1131 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1133 = _1121 + _1131;
    float _1135 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1137 = !_599;
    float _1139 = _1137 ? _585 : as_type<float>(_1045);
    float _1141 = -_737;
    float _1143 = _1141 + 0.5;
    float _1145 = fma(_1133, _1133, _1123);
    bool _1147 = !_607;
    float _1149 = _1147 ? _585 : as_type<float>(_1049);
    float _1151 = _585 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1153 = _1139 + 0.5;
    float _1155 = _1145 + _1125;
    float _1157 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1159 = _1149 + 0.5;
    float _1161 = _1153 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1163 = fma(_1151, _1029, _1035);
    float _1165 = fma(_1151, _1019, _1037);
    float _1167 = fma(_1151, _1021, _1041);
    float _1169 = _1159 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1171 = -_999;
    float _1173 = _1171 + 0.5;
    float _1175 = _1143 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1177 = fma(_905, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1009);
    float _1179 = fma(_905, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1011);
    float _1181 = fma(_905, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1013);
    float _1183 = _1169 * _1135;
    float _1185 = sqrt(_1155);
    float _1187 = _1173 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1189 = _1175 * _1157;
    float _1191 = _929 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1193 = _935 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1195 = _937 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1197 = _1161 * _1017;
    float _1199 = _1187 * _1033;
    float _1201 = _1191 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1203 = _1177 + _1163;
    float _1205 = _1179 + _1165;
    float _1207 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1209 = _1193 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1211 = _1195 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1213 = _1181 + _1167;
    out.m_72.x = _1197;
    out.m_72.y = _1199;
    out.m_72.z = _1183;
    out.m_72.w = _1189;
    bool _1215 = _1185 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1217 = isnan(_1185);
    bool _1219 = _1215 || _1217;
    bool _1221 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1223 = _1219 || _1221;
    out.m_74.x = _1201;
    out.m_74.y = _1209;
    out.m_74.z = _1211;
    out.m_74.w = _1207;
    out.m_76.x = _1203;
    out.m_76.y = _1205;
    out.m_76.z = _1213;
    float _1225 = _1193;
    if (!_1223)
    {
        _1225 = 1.0;
    }
    float _1227 = _1225;
    bool _1229 = !_1223;
    float _1231 = _1227;
    if (!_1229)
    {
        bool _1233 = _1185 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1235 = isnan(_1185);
        bool _1237 = _1233 || _1235;
        bool _1239 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1241 = _1237 || _1239;
        if (!_1241)
        {
            float _1243 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1245 = _1185 + _1243;
            float _1247 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1249 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1247;
            float _1251 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1253 = _1251 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1255 = 1.0 / _1249;
            float _1257 = _1245 * _1255;
            float _1259 = fma(_1257, _1253, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1231 = _1259;
            _1261 = true;
        }
        else
        {
            bool _1263 = _1185 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1265 = isnan(_1185);
            bool _1267 = _1263 || _1265;
            bool _1269 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1271 = _1267 || _1269;
            if (!_1271)
            {
                float _1273 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1275 = _1185 + _1273;
                float _1277 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1279 = _1277 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1281 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1283 = _1281 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1285 = 1.0 / _1279;
                float _1287 = _1275 * _1285;
                float _1289 = fma(_1287, _1283, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1231 = _1289;
                _1261 = true;
            }
            else
            {
                _1231 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1261 = false;
    float _1291 = _1231;
    float _1293 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1295 = _1127 + _1293;
    float _1297 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1299 = _1129 + _1297;
    float _1301 = fma(_1295, _1291, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1303 = fma(_1299, _1291, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1305 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _1307 = _1301 + _1305;
    float _1309 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _1311 = _1303 + _1309;
    float _1313 = fma(_1307, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1315 = fma(_1311, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _4383 = float2(_1315, _1313);
    float _1317 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_4383, float2(0.0), isnan(_4383)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_4383, float2(0.0), isnan(_4383)), level(0.0)).x;
    float _1319 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1321 = _1121 + _1319;
    float _1323 = -_921;
    float _1325 = _1323 + _1303;
    float _1327 = -_927;
    float _1329 = _1327 + _1301;
    float _1331 = fma(_1321, _1291, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1333 = -_721;
    float _1335 = _1333 + _1331;
    float _1337 = _1335 * _1335;
    float _1339 = fma(_1325, _1325, _1337);
    float _1341 = fma(_1329, _1329, _1339);
    float _1343 = sqrt(_1341);
    bool _1345 = _1343 > 0.0;
    bool _1347 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1349 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1351 = _1347 || _1349;
    bool _1353 = isnan(0.5);
    bool _1355 = _1351 || _1353;
    float _1357 = fma(_1317, 100.0, _721);
    float _1359 = fma(_1317, 100.0, _1331);
    float _1361 = _1357 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1363 = _1317;
    float _1365 = _1303;
    float _1367 = _1301;
    float _1369 = _1331;
    float _1371 = _1329;
    if (!_1345)
    {
        _1363 = _1359;
    }
    float _1373 = _1363;
    float _1375 = fma(_921, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1361);
    float _1377 = _1357 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1379 = fma(_927, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1375);
    float _1381 = fma(_921, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1377);
    float _1383 = _1379 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1385 = fma(_927, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1381);
    bool _1387 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1389 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1391 = _1387 || _1389;
    bool _1393 = isnan(0.5);
    bool _1395 = _1391 || _1393;
    float _1397 = 1.0 / _1383;
    float _1399 = _1385 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1401 = _1399 + _1383;
    bool _1403 = !_1345;
    float _1405 = _1373;
    float _1407 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _1409 = _1401;
    if (!_1403)
    {
        float _1411 = _183 * _183;
        float _1413 = fma(_181, _181, _1411);
        float _1415 = rsqrt(_1341);
        float _1417 = fma(_185, _185, _1413);
        float _1419 = sqrt(_1417);
        float _1421 = _1325 * _1415;
        float _1423 = _1335 * _1415;
        float _1425 = _1329 * _1415;
        bool _1427 = _1419 > 0.0;
        float _1429 = _1415;
        _1407 = _1419;
        _1369 = _1417;
        _1371 = _1425;
        if (!_1427)
        {
            _1429 = _1359;
        }
        float _1431 = _1429;
        bool _1433 = !_1427;
        _1405 = _1431;
        if (!_1433)
        {
            float _1435 = rsqrt(_1417);
            float _1437 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1439 = _183 * _1435;
            float _1441 = _181 * _1435;
            float _1443 = _1423 * _1439;
            float _1445 = _185 * _1435;
            float _1447 = fma(_1421, _1441, _1443);
            float _1449 = _1437 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1451 = fma(_1425, _1445, _1447);
            float _1453 = _1451 * _1449;
            float _1455 = fma(_181, _1453, _1303);
            float _1457 = fma(_183, _1453, _1359);
            float _1459 = fma(_185, _1453, _1301);
            _1365 = _1455;
            _1405 = _1457;
            _1367 = _1459;
            _1407 = _1453;
            _1369 = _1435;
        }
    }
    float _1461 = _1365;
    float _1463 = _1405;
    float _1465 = _1367;
    float _1467 = _1407;
    float _1469 = _1369;
    float _1471 = _1371;
    float _1473 = _1401 * _1397;
    float _1475 = _1473 * 0.5;
    float _1477 = _1467;
    float _1479 = _1469;
    float _1481 = _1471;
    if (_1355)
    {
        _189 = 1.0;
    }
    float _1483 = _189;
    float _1485 = _1483;
    if (_1395)
    {
        _191 = _1461;
    }
    float _1487 = _191;
    float _1489 = _1487;
    if (_1395)
    {
        _193 = _1463;
    }
    float _1491 = _193;
    float _1493 = _1491;
    if (_1395)
    {
        _1477 = _1465;
    }
    float _1495 = _1477;
    float _1497 = _1495;
    if (!_1395)
    {
        float _1499 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1501 = _1357 + _1499;
        float _1503 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1505 = _921 + _1503;
        float _1507 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1509 = -_921;
        float _1511 = _1509 + _1461;
        float _1513 = _1501 * _1501;
        float _1515 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1517 = _927 + _1515;
        float _1519 = -_1357;
        float _1521 = _1519 + _1463;
        float _1523 = -_927;
        float _1525 = _1523 + _1465;
        float _1527 = fma(_1505, _1505, _1513);
        float _1529 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1531 = fma(_1517, _1517, _1527);
        float _1533 = sqrt(_1531);
        float _1535 = _1507 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1537 = precise::min(_1533, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1539 = _1537 * _1529;
        float _1541 = _1535 * _1539;
        float _1543 = fma(_1511, _1541, _921);
        float _1545 = fma(_1521, _1541, _1357);
        float _1547 = fma(_1525, _1541, _927);
        _1493 = _1545;
        _1489 = _1543;
        _1497 = _1547;
        _1409 = _1507;
        _1479 = _1541;
    }
    float _1549 = _1493;
    float _1551 = _1489;
    float _1553 = _1497;
    float _1555 = _1409;
    float _1557 = _1479;
    float _1559 = _1557;
    float _1561 = _1555;
    if (!_1355)
    {
        float _1563 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1565 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1567 = fma(_1475, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1565);
        float _1569 = _1563 * 0.15915493667125701904296875;
        float _1571 = _1569 * 6.283185482025146484375;
        float _1573 = cos(_1571);
        float _1575 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1577 = _1575 * 0.15915493667125701904296875;
        float _1579 = _1569 * 6.283185482025146484375;
        float _1581 = sin(_1579);
        float _1583 = 1.0 / _1573;
        float _1585 = _1577 * 6.283185482025146484375;
        float _1587 = cos(_1585);
        float _1589 = _1581 * _1583;
        float _1591 = 1.0 / _1567;
        float _1593 = _1587 * _1589;
        float _1595 = _1577 * 6.283185482025146484375;
        float _1597 = sin(_1595);
        float _1599 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1601 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1599;
        float _1603 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1605 = _1591 * _1603;
        float _1607 = 1.0 / _1593;
        float _1609 = 1.0 / _1601;
        float _1611 = _1597 * _1607;
        float _1613 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1615 = fma(_1611, _1605, _1613);
        float _1617 = _1615 * _1609;
        float _1619 = precise::clamp(_1617, 0.0, 1.0);
        _1061 = _1577;
        _1485 = _1619;
    }
    float _1621 = _1061;
    float _1623 = _1485;
    float _1625 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1627 = _1549 + _1625;
    float _1629 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1631 = _1551 + _1629;
    float _1633 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1635 = _1553 + _1633;
    float _1637 = _1627 * _1627;
    float _1639 = fma(_1631, _1631, _1637);
    float _1641 = fma(_1635, _1635, _1639);
    float _1643 = rsqrt(_1641);
    float _1645 = sqrt(_1641);
    float _1647 = _1643 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1649 = _1631 * _1647;
    float _1651 = _1635 * _1647;
    float _1653 = _1649 * _1649;
    float _1655 = _1651 * _1651;
    float _1657 = _1653 + _1655;
    float _1659 = sqrt(_1657);
    bool _1661 = _1659 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1663 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1665 = _1659 + _1663;
    float _1667 = _1621;
    float _1669 = _1665;
    float _1671 = _1627;
    float _1673 = _1649;
    if (_1661)
    {
        float _1675 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1667 = _1675;
    }
    float _1677 = _1667;
    if (_1661)
    {
        float _1679 = rsqrt(_1657);
        _1559 = _1679;
    }
    float _1681 = _1559;
    float _1683 = _1681;
    if (_1661)
    {
        float _1685 = _1665 * _1677;
        _1669 = _1685;
    }
    float _1687 = _1669;
    if (_1661)
    {
        float _1689 = _1687 * 0.15915493667125701904296875;
        _1561 = _1689;
    }
    float _1691 = _1561;
    float _1693 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1695 = _1635;
    if (_1661)
    {
        float _1697 = _1691 * 6.283185482025146484375;
        float _1699 = sin(_1697);
        _1695 = _1699;
    }
    float _1701 = _1695;
    float _1703 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1705 = precise::max(0.0, _1703);
    float _1707 = _1677;
    float _1709 = _1705;
    if (_1661)
    {
        float _1711 = _1691 * 6.283185482025146484375;
        float _1713 = cos(_1711);
        _1707 = _1713;
    }
    float _1715 = _1707;
    float _1717 = -_1647;
    float _1719 = -_1705;
    float _1721 = fma(_1627, _1717, _1719);
    if (_1661)
    {
        float _1723 = _1721 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1671 = _1723;
    }
    float _1725 = _1671;
    float _1727 = _1725;
    float _1729 = _1701;
    if (_1661)
    {
        float _1731 = fma(_1701, _1725, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1727 = _1731;
    }
    float _1733 = _1727;
    float _1735 = _1733;
    if (!_1661)
    {
        _1729 = _1653;
    }
    float _1737 = _1729;
    float _1739 = _1549 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1741 = _1737;
    float _1743 = _1715;
    if (_1661)
    {
        float _1745 = _1715 + (-1.0);
        _1709 = _1745;
    }
    float _1747 = _1709;
    float _1749 = _1747;
    if (_1661)
    {
        float _1751 = _1681 * _1733;
        _1481 = _1751;
    }
    float _1753 = _1481;
    if (!_1661)
    {
        _1735 = _1721;
    }
    float _1755 = _1735;
    float _1757 = fma(_1551, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1739);
    float _1759 = _1755;
    if (_1661)
    {
        float _1761 = _1747 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1683 = _1761;
    }
    float _1763 = _1683;
    if (_1661)
    {
        float _1765 = _1649 * _1753;
        _1673 = _1765;
    }
    float _1767 = _1673;
    if (!_1661)
    {
        _1749 = _1651;
    }
    float _1769 = _1749;
    float _1771 = _1769;
    if (_1661)
    {
        float _1773 = _1651 * _1753;
        _1771 = _1773;
    }
    float _1775 = _1771;
    if (_1661)
    {
        float _1777 = fma(_1721, _1715, _1763);
        _1759 = _1777;
    }
    float _1779 = _1759;
    if (_1661)
    {
        float _1781 = _1767 * _1767;
        _1741 = _1781;
    }
    float _1783 = _1741;
    if (!_1661)
    {
        _1743 = _1655;
    }
    float _1785 = _1743;
    float _1787 = _1785;
    if (_1661)
    {
        float _1789 = _1775 * _1775;
        _1787 = _1789;
    }
    float _1791 = _1787;
    float _1793 = fma(_1779, _1779, _1783);
    float _1795 = _1549 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1797 = _1793 + _1791;
    float _1799 = fma(_1551, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1795);
    float _1801 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1803 = fma(_1645, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1801);
    float _1805 = precise::clamp(_1803, 0.0, 1.0);
    float _1807 = _1549 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1809 = rsqrt(_1797);
    float _1811 = fma(_1553, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1799);
    float _1813 = -_1805;
    float _1815 = _1813 + 1.0;
    float _1817 = fma(_1551, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1807);
    float _1819 = _1549 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1821 = _1811 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1823 = fma(_1553, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1817);
    float _1825 = abs(_1815);
    float _1827 = log2(_1825);
    float _1829 = fma(_1551, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1819);
    float _1831 = _1821 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1833 = fma(_1553, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1829);
    float _1835 = -_1831;
    float _1837 = fma(_1835, _1693, 1.0);
    float _1839 = _1823 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1841 = _1809 * _1767;
    float _1843 = fma(_1553, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1757);
    float _1845 = _1833 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1847 = _1839 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1849 = _1809 * _1779;
    float _1851 = _1841 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1853 = _1809 * _1775;
    float _1855 = fma(_1845, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1847);
    float _1857 = _1827 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1859 = -_1851;
    float _1861 = fma(_1849, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1859);
    float _1863 = _1843 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1865 = fma(_1821, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1855);
    float _1867 = exp2(_1857);
    float _1869 = -_1853;
    float _1871 = fma(_1869, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1861);
    float _1873 = _1839 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1875 = fma(_1863, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1865);
    float _1877 = _1839 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1879 = fma(_1871, -0.5, 0.5);
    float _1881 = fma(_1871, 0.5, 0.5);
    float _1883 = fma(_1845, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1873);
    float _1885 = log2(_1837);
    float _1887 = _1849 + 1.0;
    float _1889 = fma(_1881, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1891 = fma(_1821, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1883);
    float _1893 = fma(_1881, _1889, -0.212114393711090087890625);
    float _1895 = 1.0 / _1875;
    float _1897 = fma(_1845, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1877);
    float _1899 = -_1849;
    float _1901 = fma(_1867, _1887, _1899);
    float _1903 = fma(_1863, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1891);
    float _1905 = fma(_1881, _1893, 1.570728778839111328125);
    float _1907 = fma(_1821, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1897);
    float _1909 = fma(_1901, 0.5, 0.5);
    float _1911 = sqrt(_1879);
    float _1913 = fma(_1863, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1907);
    float _1915 = _1885 * 0.693147182464599609375;
    float _1917 = _1915 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1919 = _1903 * _1895;
    float _1921 = _1913 * _1895;
    float _1923 = fma(_1919, 0.5, 0.5);
    float _1925 = fma(_1921, -0.5, 0.5);
    float _1927 = _1911 * 0.636619746685028076171875;
    float3 _5353 = float3(_1923, _1925, _1917);
    float _1929 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5353, float3(0.0), isnan(_5353)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5353, float3(0.0), isnan(_5353)), level(0.0)).x;
    float _1931 = -_1905;
    float _1933 = fma(_1927, _1931, 1.0);
    float3 _5369 = float3(_1923, _1925, _1917);
    float4 _1936 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5369, float3(0.0), isnan(_5369)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5369, float3(0.0), isnan(_5369)), level(0.0)).xyzw;
    float _1938 = _1936.x;
    float _1940 = _1936.y;
    float _1942 = _1936.z;
    float _1944 = _1936.w;
    float2 _5385 = float2(_1933, _1909);
    float3 _1948 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5385, float2(0.0), isnan(_5385)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5385, float2(0.0), isnan(_5385)), level(0.0)).xyz;
    float _1950 = _1948.x;
    float _1952 = _1948.y;
    float _1954 = _1948.z;
    float _1956 = _1827 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1958 = _1839 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1960 = _1645 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1962 = isnan(_1645);
    bool _1964 = _1960 || _1962;
    bool _1966 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1968 = _1964 || _1966;
    float _1970 = fma(_1845, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1958);
    float _1972 = exp2(_1956);
    float _1974 = _1875 * 0.5;
    float _1976 = fma(_1821, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1970);
    float _1978 = fma(_1913, -0.5, _1974);
    float _1980 = fma(_1863, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1976);
    float _1982 = _1903 + _1875;
    float _1984 = _1980 + _1875;
    float _1986 = _1982 * 0.5;
    out.gl_Position.x = _1903;
    out.gl_Position.y = _1913;
    out.gl_Position.z = _1980;
    out.gl_Position.w = _1875;
    float _1988 = _1984 * 0.5;
    float _1990 = -_1972;
    float _1992 = _1990 + 1.0;
    float _1994 = _1992 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_78.x = _1986;
    out.m_78.y = _1978;
    out.m_78.z = _1988;
    out.m_78.w = _1875;
    float _1996 = -_1994;
    float _1998 = _1996 + 1.0;
    float _2000 = _1875;
    float _2002 = _1980;
    float _2004 = _1913;
    float _2006 = _1903;
    float _2008 = _1998;
    if (!_1968)
    {
        _2000 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2010 = _2000;
    float _2012 = _2010;
    float _2014 = _2010;
    if (!_1968)
    {
        _2002 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2016 = _2002;
    float _2018 = _2016;
    float _2020 = _2016;
    if (!_1968)
    {
        _2004 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2022 = _2004;
    float _2024 = _2022;
    float _2026 = _2022;
    if (!_1968)
    {
        _2006 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2028 = _2006;
    float _2030 = _1623 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2032 = _1994 * _1929;
    float _2034 = _1944 * _2032;
    float _2036 = _1944 * _1998;
    float _2038 = _2034;
    float _2040 = _2028;
    float _2042 = _2028;
    if (!_1968)
    {
        _2008 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2044 = _2008;
    float _2046 = _1954 * _2032;
    float _2048 = fma(_1950, _2034, _1938);
    float _2050 = fma(_1952, _2034, _1940);
    float _2052 = _2044;
    float _2054 = _2044;
    if (!_1968)
    {
        _2038 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2056 = _2038;
    float _2058 = fma(_1944, _2046, _1942);
    out.m_80.x = _2048;
    out.m_80.y = _2050;
    out.m_80.z = _2058;
    out.m_80.w = _2036;
    bool _2060 = !_1968;
    float _2062 = _2056;
    float _2064 = _2056;
    if (!_2060)
    {
        bool _2066 = _1645 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2068 = isnan(_1645);
        bool _2070 = _2066 || _2068;
        bool _2072 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2074 = _2070 || _2072;
        if (!_2074)
        {
            float _2076 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2078 = _1645 + _2076;
            float _2080 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2082 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2080;
            float _2084 = 1.0 / _2082;
            float _2086 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2088 = _2086 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2090 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2092 = _2090 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2094 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2096 = _2094 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2098 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2100 = _2098 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2102 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2104 = _2102 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2106 = _2078 * _2084;
            float _2108 = precise::clamp(_2106, 0.0, 1.0);
            float _2110 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2112 = _2110 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2114 = fma(_2108, _2088, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2116 = fma(_2108, _2112, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2118 = fma(_2108, _2092, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2120 = fma(_2108, _2096, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2122 = fma(_2108, _2100, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2124 = fma(_2108, _2104, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2054 = _2116;
            _2026 = _2122;
            _2064 = _2114;
            _2020 = _2120;
            _2014 = _2118;
            _2042 = _2124;
            _2126 = true;
        }
        else
        {
            bool _2128 = _1645 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2130 = isnan(_1645);
            bool _2132 = _2128 || _2130;
            bool _2134 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2136 = _2132 || _2134;
            if (!_2136)
            {
                _2062 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2138 = _2062;
            _2064 = _2138;
            if (!_2136)
            {
                _2052 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2140 = _2052;
            _2054 = _2140;
            if (!_2136)
            {
                _2012 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2142 = _2012;
            _2014 = _2142;
            if (!_2136)
            {
                _2018 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2144 = _2018;
            _2020 = _2144;
            if (!_2136)
            {
                _2024 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2146 = _2024;
            _2026 = _2146;
            if (!_2136)
            {
                _2040 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2148 = _2040;
            bool _2150 = !_2136;
            _2042 = _2148;
            if (!_2150)
            {
                bool _2152 = _1645 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2154 = isnan(_1645);
                bool _2156 = _2152 || _2154;
                bool _2158 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2160 = _2156 || _2158;
                if (!_2160)
                {
                    float _2162 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2164 = _1645 + _2162;
                    float _2166 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2168 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2166;
                    float _2170 = 1.0 / _2168;
                    float _2172 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2174 = _2172 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2176 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2178 = _2176 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2180 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2182 = _2180 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2184 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2186 = _2184 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2188 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2190 = _2188 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2192 = _2164 * _2170;
                    float _2194 = precise::clamp(_2192, 0.0, 1.0);
                    float _2196 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2198 = _2196 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2200 = fma(_2194, _2174, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2202 = fma(_2194, _2198, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2204 = fma(_2194, _2178, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2206 = fma(_2194, _2182, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2208 = fma(_2194, _2186, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2210 = fma(_2194, _2190, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2054 = _2202;
                    _2026 = _2208;
                    _2064 = _2200;
                    _2020 = _2206;
                    _2014 = _2204;
                    _2042 = _2210;
                    _2126 = true;
                }
                else
                {
                    _2054 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2026 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2064 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2020 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2014 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2042 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2126 = false;
    float _2212 = _2054;
    float _2214 = _2026;
    float _2216 = _2064;
    float _2218 = _2020;
    float _2220 = _2014;
    float _2222 = _2042;
    float _2224 = fma(_1205, -0.5, 0.5);
    float _2226 = precise::clamp(_2224, 0.0, 1.0);
    float _2228 = -_2212;
    float _2230 = _2228 + _2214;
    float _2232 = -_2216;
    float _2234 = _2232 + _2218;
    out.m_82.x = 0.0;
    float _2236 = -_2220;
    float _2238 = _2236 + _2222;
    float _2240 = fma(_2226, _2230, _2212);
    float _2242 = fma(_2226, _2234, _2216);
    bool _2244 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2246 = _2240 * 0.586610972881317138671875;
    float _2248 = fma(_2226, _2238, _2220);
    float _2250 = _2030 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2252 = fma(_2242, 0.298911988735198974609375, _2246);
    bool _2254 = _1623 > 0.0;
    bool _2256 = isnan(_1623);
    bool _2258 = _2254 || _2256;
    bool _2260 = isnan(0.0);
    bool _2262 = _2258 || _2260;
    float _2264 = fma(_2248, 0.114477999508380889892578125, _2252);
    out.m_51.x = _2250;
    float _2266 = -_2264;
    float _2268 = _2242 + _2266;
    float _2270 = -_2264;
    float _2272 = _2240 + _2270;
    float _2274 = -_2264;
    float _2276 = _2248 + _2274;
    float _2278 = fma(_2268, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2264);
    float _2280 = fma(_2272, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2264);
    float _2282 = fma(_2276, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2264);
    bool _2284 = !_2244;
    if (!_2284)
    {
        float _2286 = -_1549;
        float _2288 = _2286 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2290 = -_1551;
        float _2292 = _2290 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2294 = -_1553;
        float _2296 = _2294 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2298 = _2288 * _2288;
        float _2300 = fma(_2292, _2292, _2298);
        float _2302 = fma(_2296, _2296, _2300);
        float _2304 = sqrt(_2302);
        float _2306 = rsqrt(_2302);
        float _2308 = -_2304;
        float _2310 = _2308 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2312 = _2310 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2314 = precise::clamp(_2312, 0.0, 1.0);
        float _2316 = _2292 * _2306;
        float _2318 = _2288 * _2306;
        float _2320 = abs(_2314);
        float _2322 = log2(_2320);
        float _2324 = _2296 * _2306;
        float _2326 = _2316 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2328 = _1205 * _2318;
        float _2330 = -_2318;
        float _2332 = -_2326;
        float _2334 = fma(_2330, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2332);
        float _2336 = fma(_1203, _2316, _2328);
        float _2338 = -_2324;
        float _2340 = fma(_2338, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2334);
        float _2342 = fma(_1213, _2324, _2336);
        float _2344 = precise::clamp(_2342, 0.0, 1.0);
        float _2346 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2348 = _2340 + _2346;
        float _2350 = _2322 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2352 = _2348 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2354 = precise::clamp(_2352, 0.0, 1.0);
        float _2356 = exp2(_2350);
        float _2358 = _2356 * _2354;
        float _2360 = _2344 * _2358;
        float _2362 = _2360 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2364 = _2360 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2366 = _2360 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_82.x = _2362;
        out.m_82.y = _2364;
        out.m_82.z = _2366;
    }
    out.m_84.x = _2278;
    out.m_84.y = _2280;
    out.m_84.z = _2282;
    if (_2262)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_51.x = 0.0;
    float _2368 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2368;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

