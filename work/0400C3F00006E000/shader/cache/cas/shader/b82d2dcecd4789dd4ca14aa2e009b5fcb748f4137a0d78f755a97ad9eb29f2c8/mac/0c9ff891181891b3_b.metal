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
    texture3d<float> vp_t_tcb_32 [[id(6)]];
    sampler vp_t_tcb_32Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_30 [[id(8)]];
    sampler vp_t_tcb_30Smplr [[id(9)]];
    texture2d<float> vp_t_tcb_1C [[id(10)]];
    sampler vp_t_tcb_1CSmplr [[id(11)]];
    sampler vp_t_tcb_32Smplr_w [[id(12)]];
    sampler vp_t_tcb_30Smplr_w [[id(13)]];
    sampler vp_t_tcb_1CSmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_64 [[user(locn0)]];
    float4 m_66 [[user(locn1)]];
    float4 m_70 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_68 [[user(locn4)]];
    float4 m_72 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_60 [[attribute(1)]];
    float4 m_58 [[attribute(2)]];
    float4 m_62 [[attribute(3)]];
    float4 m_44 [[attribute(5)]];
    float4 m_49 [[attribute(6)]];
    float4 m_56 [[attribute(7)]];
    float4 m_54 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1261 = false;
    bool _307 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _86 = in.m_44.w;
    float _88 = trunc(_86);
    int _91 = int(_88);
    bool _95 = _91 >= 1;
    float _97 = 0.0;
    if (!_95)
    {
        _97 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _99 = _97;
    float _101 = _99;
    if (!_95)
    {
        out.m_47.x = 0.0;
    }
    int _103 = 0;
    if (!_95)
    {
        float _105 = _99 * 5.0;
        _103 = as_type<int>(_105);
    }
    int _107 = _103;
    int _109 = _107;
    if (!_95)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1751 = as_type<float>(_107);
        out.gl_Position.z = _1751;
    }
    if (!_95)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _111 = in.m_49.w;
    bool _113 = _111 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _115 = isnan(_111);
    bool _117 = _113 || _115;
    bool _119 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _121 = _117 || _119;
    float _123 = -_111;
    float _125 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _127 = _125;
    if (_121)
    {
        float _129 = float(_91);
        _101 = _129;
    }
    float _131 = _101;
    bool _133 = _125 >= _131;
    bool _135 = !_121;
    bool _137 = _133 || _135;
    float _139 = _131;
    if (_137)
    {
        _139 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _141 = _139;
    if (_137)
    {
        out.m_47.x = 0.0;
    }
    if (_137)
    {
        float _143 = _141 * 5.0;
        _109 = as_type<int>(_143);
    }
    int _145 = _109;
    if (_137)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1821 = as_type<float>(_145);
        out.gl_Position.z = _1821;
    }
    if (_137)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _147 = as_type<float>(int(gl_VertexIndex));
    float _149 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _151 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _153 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _155 = _151 || _153;
    bool _157 = isnan(1.0);
    bool _159 = _155 || _157;
    float _161 = in.m_54.w;
    float _163 = in.m_49.x;
    float _165 = in.m_49.y;
    float _167 = in.m_49.z;
    float _169 = in.m_44.x;
    float _171 = in.m_44.y;
    float _173 = in.m_44.z;
    float _175 = 0.0;
    float _177 = _149;
    if (!_159)
    {
        float _179 = _149 * _149;
        float _181 = _179 * 0.5;
        _175 = _181;
    }
    float _183 = _175;
    float _185 = _183;
    if (!_159)
    {
        float _187 = _183 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _185 = _187;
    }
    float _189 = _185;
    bool _191 = !_159;
    float _193 = _189;
    if (!_191)
    {
        float _195 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _197 = log2(_195);
        float _199 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _201 = _199 + 1.0;
        float _203 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _205 = _149 * _197;
        float _207 = 1.0 / _201;
        float _209 = _203 * 0.693147182464599609375;
        float _211 = exp2(_205);
        float _213 = 1.0 / _209;
        float _215 = _211 + (-1.0);
        float _217 = -_215;
        float _219 = fma(_217, _213, _149);
        float _221 = _219 * _207;
        float _223 = _221 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _193 = _223;
    }
    float _225 = _193;
    bool _227 = !_159;
    if (!_227)
    {
        float _229 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _231 = log2(_229);
        float _233 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _235 = _233 + 1.0;
        float _237 = 1.0 / _235;
        float _239 = _149 * _231;
        float _241 = exp2(_239);
        float _243 = -_241;
        float _245 = _243 + 1.0;
        float _247 = _245 * _237;
        _177 = _247;
    }
    float _249 = _177;
    bool _251 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _253 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _255 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _257 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _259 = as_type<int>(_147) & 1;
    bool _261 = _259 != 0;
    float _263 = fma(_249, _163, _253);
    float _265 = fma(_249, _165, _255);
    float _267 = fma(_249, _167, _257);
    int _269 = as_type<int>(_147) & 2;
    bool _271 = _269 != 0;
    float _273 = fma(_263, _161, _169);
    float _275 = fma(_265, _161, _171);
    float _277 = fma(_267, _161, _173);
    bool _279 = !_261;
    float _281 = _279 ? (-0.5) : 0.5;
    bool _283 = !_271;
    float _285 = _283 ? (-0.5) : 0.5;
    bool _287 = !_251;
    float _305;
    if (!_287)
    {
        float _289 = in.m_56.x;
        float _291 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _293 = _289 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _295 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[12].x, _125);
        float _297 = _295 * _291;
        float _299 = floor(_297);
        float _301 = -_299;
        float _303 = _297 + _301;
        _305 = _303;
        _307 = true;
    }
    else
    {
        float _309 = float(_91);
        float _311 = 1.0 / _309;
        float _313 = _125 * _311;
        _305 = _313;
    }
    _307 = false;
    float _315 = _305;
    float _317 = in.m_58.x;
    float _319 = in.m_58.y;
    float _321 = in.m_58.z;
    float _323 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _325 = log2(_323);
    float _327 = in.m_60.x;
    float _329 = in.m_60.y;
    float _331 = in.m_60.z;
    int _333 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _335 = _333 != 0;
    int _337 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _339 = _337 != 0;
    float _341 = in.m_62.x;
    float _343 = in.m_62.y;
    float _345 = in.m_62.z;
    float _347 = (*spvDescriptorSet0.vp_c8)._m0[28].z * (*spvDescriptorSet0.vp_c8)._m0[1].x;
    int _349 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _351 = _349 != 0;
    int _353 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _355 = _353 != 0;
    int _357 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _359 = _357 != 0;
    float _361 = _325 * _125;
    float _363 = _275 * _319;
    float _365 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _367 = exp2(_361);
    float _369 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _371 = _275 * _329;
    float _373 = fma(_273, _317, _363);
    float _375 = (*spvDescriptorSet0.vp_c8)._m0[1].y * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _377 = in.m_56.x;
    float _379 = in.m_56.y;
    float _381 = fma(_273, _327, _371);
    float _383 = _275 * _343;
    float _385 = in.m_56.z;
    float _387 = fma(_273, _341, _383);
    float _389 = (*spvDescriptorSet0.vp_c8)._m0[1].z * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _391 = -_347;
    float _393 = fma((*spvDescriptorSet0.vp_c8)._m0[1].z, (*spvDescriptorSet0.vp_c8)._m0[28].x, _391);
    float _395 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _397 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _395;
    float _399 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _401 = _399 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _403 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _405 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _407 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _409 = -_389;
    float _411 = fma((*spvDescriptorSet0.vp_c8)._m0[1].y, (*spvDescriptorSet0.vp_c8)._m0[28].z, _409);
    float _413 = -_375;
    float _415 = fma((*spvDescriptorSet0.vp_c8)._m0[1].x, (*spvDescriptorSet0.vp_c8)._m0[28].y, _413);
    float _417 = 1.0 / _401;
    float _419 = _403 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _421 = _405 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _423 = _407 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _425 = _377 > 0.5;
    float _427 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _429 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    out.m_64.x = _419;
    out.m_64.y = _421;
    out.m_64.z = _423;
    out.m_64.w = _365;
    float _431 = -_281;
    int _433 = _425 ? as_type<int>(_431) : as_type<int>(_281);
    float _435 = _427 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _437 = _369 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _439 = _429 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _441 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _443 = isnan(1.0);
    bool _445 = _441 || _443;
    bool _447 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _449 = _445 || _447;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _453 = 1.0 + _451;
    float _455 = fma(_277, _331, _381);
    float _457 = fma(_277, _321, _373);
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _461 = _315 + _459;
    float _463 = fma(_277, _345, _387);
    out.m_66.x = _435;
    out.m_66.y = _437;
    out.m_66.z = _439;
    float _465 = 1.0 / _453;
    float _467 = _379 + _385;
    float _469 = _385 * 2.0;
    float _471 = _377 * 2.0;
    float _473 = _467 + (-1.0);
    float _475 = -_367;
    float _477 = _475 + 1.0;
    float _479 = floor(_469);
    float _481 = fma(_473, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _483 = _461 * _417;
    bool _485 = !_335;
    float _487 = _485 ? _281 : as_type<float>(_433);
    float _489 = _385 + _377;
    bool _491 = _379 > 0.5;
    float _493 = _379 * 2.0;
    float _495 = 1.0 / _397;
    float _497 = _489 + (-1.0);
    float _499 = -_285;
    int _501 = _491 ? as_type<int>(_499) : as_type<int>(_285);
    float _503 = _487 + 0.5;
    bool _505 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _507 = isnan(0.0);
    bool _509 = _505 || _507;
    bool _511 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _513 = _509 || _511;
    float _515 = fma(_497, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _517 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _519 = isnan(_315);
    bool _521 = _517 || _519;
    bool _523 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _525 = _521 || _523;
    float _527 = float(_525);
    float _529 = _503 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _531 = floor(_471);
    float _533 = _513 ? _477 : 0.0;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _537 = _315 + _535;
    bool _539 = !_339;
    float _541 = _539 ? _285 : as_type<float>(_501);
    float _543 = _455 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _545 = _479 > 0.0;
    if (_449)
    {
        float _547 = _533 * _465;
        _127 = _547;
    }
    float _549 = _127;
    bool _551 = _479 >= 0.0;
    bool _553 = isnan(_479);
    bool _555 = _551 || _553;
    bool _557 = isnan(0.0);
    bool _559 = _555 || _557;
    float _561 = floor(_493);
    bool _563 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _565 = isnan(_315);
    bool _567 = _563 || _565;
    bool _569 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _571 = _567 || _569;
    float _573 = float(_571);
    float _575 = _537 * _495;
    float _577 = -_527;
    float _579 = _577 + 1.0;
    float _581 = _379 + _377;
    int _583 = _559 ? 0 : 1;
    float _585 = -_541;
    float _587 = _585 + 0.5;
    float _589 = _573 * _579;
    bool _591 = _531 > 0.0;
    float _593 = _581 + (-1.0);
    bool _595 = _531 >= 0.0;
    bool _597 = isnan(_531);
    bool _599 = _595 || _597;
    bool _601 = isnan(0.0);
    bool _603 = _599 || _601;
    float _605 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _607 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _605;
    float _609 = -_573;
    float _611 = _609 + 1.0;
    bool _613 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _615 = isnan(_315);
    bool _617 = _613 || _615;
    bool _619 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _621 = _617 || _619;
    float _623 = float(_621);
    float _625 = fma(_593, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _627 = fma(_607, _575, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _631 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _629;
    int _633 = ~_583;
    int _635 = _633 + 1;
    int _637 = _635 + 1;
    float _639 = _623 * _611;
    int _641 = _637;
    if (!_545)
    {
        int _643 = ~_583;
        int _645 = _643 + 1;
        _641 = _645;
    }
    int _647 = _641;
    float _649 = fma(_631, _575, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    int _651 = _603 ? 0 : 1;
    float _653 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _655 = _561 > 0.0;
    float _657 = -_623;
    float _659 = _657 + 1.0;
    bool _661 = _561 >= 0.0;
    bool _663 = isnan(_561);
    bool _665 = _661 || _663;
    bool _667 = isnan(0.0);
    bool _669 = _665 || _667;
    float _671 = _627 * _639;
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _675 = _673 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _677 = _649 * _639;
    float _679 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _681 = _679 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _683 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _685 = fma(_675, _483, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _687 = fma(_659, (*spvDescriptorSet0.vp_c9)._m0[143].x, _671);
    float _689 = _393 * _393;
    float _691 = fma(_681, _483, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _693 = fma(_659, (*spvDescriptorSet0.vp_c9)._m0[143].y, _677);
    int _695 = _669 ? 0 : 1;
    float _697 = fma(_411, _411, _689);
    float _699 = _529 * _653;
    bool _701 = !_351;
    int _703 = _701 ? 0 : 1;
    float _705 = _587 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _707 = fma(_415, _415, _697);
    int _709 = ~_651;
    int _711 = _709 + 1;
    int _713 = _711 + 1;
    float _715 = _377 + (-0.5);
    int _717 = _713;
    if (!_591)
    {
        int _719 = ~_651;
        int _721 = _719 + 1;
        _717 = _721;
    }
    int _723 = _717;
    int _725 = ~_695;
    int _727 = _725 + 1;
    int _729 = _727 + 1;
    float _731 = rsqrt(_707);
    int _733 = abs(_703);
    float _735 = _457 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _737 = _729;
    if (!_655)
    {
        int _739 = ~_695;
        int _741 = _739 + 1;
        _737 = _741;
    }
    int _743 = _737;
    float _745 = _705 * _683;
    bool _747 = !_355;
    int _749 = _747 ? 0 : 1;
    float _751 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _753 = _735 + _751;
    float _755 = float(_647);
    int _757 = abs(_749);
    float _759 = _463 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _761 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _763 = _543 + _761;
    float _765 = _753 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _767 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _769 = _759 + _767;
    float _771 = float(_733);
    out.m_68.x = _699;
    out.m_68.y = _745;
    float _773 = fma(_763, (*spvDescriptorSet0.vp_c8)._m0[28].x, _765);
    float _775 = _393 * _731;
    float _777 = _411 * _731;
    float _779 = _771 * _755;
    float _781 = fma(_769, (*spvDescriptorSet0.vp_c8)._m0[28].z, _773);
    float _783 = _775 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _785 = float(_723);
    float _787 = _415 * _731;
    bool _789 = !_359;
    int _791 = _789 ? 0 : 1;
    float _793 = _753 * _753;
    float _795 = float(_757);
    float _797 = fma(_777, (*spvDescriptorSet0.vp_c10)._m0[8].x, _783);
    bool _799 = _781 >= 0.0;
    float _801 = fma(_763, _763, _793);
    int _803 = abs(_791);
    float _805 = _795 * _785;
    float _807 = fma(_787, (*spvDescriptorSet0.vp_c10)._m0[10].x, _797);
    float _809 = fma(_769, _769, _801);
    float _811 = _779 * (-2.0);
    float _813 = float(_803);
    float _815 = _805 * (-2.0);
    float _817 = rsqrt(_809);
    float _819 = float(_743);
    float _821 = fma(_625, _811, _625);
    float _823 = _715 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    float _825 = _797;
    if (_799)
    {
        _825 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _827 = _825;
    float _829 = _813 * _819;
    int _831 = as_type<int>(_827);
    if (_799)
    {
        out.m_47.x = 0.0;
    }
    float _833 = fma(_481, _815, _481);
    if (_799)
    {
        float _835 = _827 * 5.0;
        _831 = as_type<int>(_835);
    }
    int _837 = _831;
    float _839 = _273 * _807;
    float _841 = fma(_821, _549, _823);
    if (_799)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2911 = as_type<float>(_837);
        out.gl_Position.z = _2911;
    }
    float _843 = _753 * _817;
    float _845 = _763 * _817;
    float _847 = _769 * _817;
    float _849 = -_843;
    float _851 = fma(_849, (*spvDescriptorSet0.vp_c9)._m0[18].w, _753);
    float _853 = _845;
    if (_799)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _855 = -_843;
    float _857 = fma(_855, (*spvDescriptorSet0.vp_c9)._m0[18].w, _735);
    float _859 = -_845;
    float _861 = fma(_859, (*spvDescriptorSet0.vp_c9)._m0[18].w, _543);
    float _863 = -_845;
    float _865 = fma(_863, (*spvDescriptorSet0.vp_c9)._m0[18].w, _763);
    float _867 = _379 + (-0.5);
    float _869 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _871 = _857 + _869;
    float _873 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _875 = _861 + _873;
    float _877 = _851 * _851;
    float _879 = _839 * (-1.60000002384185791015625);
    float _881 = _871 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _883 = -_847;
    float _885 = fma(_883, (*spvDescriptorSet0.vp_c9)._m0[18].w, _759);
    float _887 = fma(_865, _865, _877);
    float _889 = _867 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    float _891 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[28].x, _881);
    float _893 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _895 = _885 + _893;
    float _897 = -_847;
    float _899 = fma(_897, (*spvDescriptorSet0.vp_c9)._m0[18].w, _769);
    float _901 = fma(_833, _549, _889);
    bool _903 = _285 > 0.0;
    float _905 = fma(_895, (*spvDescriptorSet0.vp_c8)._m0[28].z, _891);
    float _907 = _829 * (-2.0);
    float _909 = fma(_899, _899, _887);
    float _911 = _385 + (-0.5);
    float _913 = in.m_54.x;
    float _915 = in.m_54.y;
    bool _917 = _905 >= 0.0;
    float _919 = fma(_879, _907, _879);
    float _921 = fma(_515, _907, _515);
    float _923 = _841 * 0.15915493667125701904296875;
    float _925 = sqrt(_909);
    float _927 = fma(_911, (*spvDescriptorSet0.vp_c9)._m0[196].z, _919);
    float _929 = _901 * 0.15915493667125701904296875;
    int _931 = _271 ? 0 : 1;
    float _933 = fma(_691, _589, _693);
    float _935 = fma(_921, _549, _927);
    float _937 = fma(_685, _589, _687);
    int _939 = ~_931;
    int _941 = _939 + 1;
    int _943 = _941 + 1;
    float _945 = _923 * 6.283185482025146484375;
    float _947 = sin(_945);
    float _949 = _935 * 0.15915493667125701904296875;
    float _951 = _919;
    int _953 = _943;
    if (_917)
    {
        _951 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _955 = _951;
    float _957 = fma(_527, (*spvDescriptorSet0.vp_c9)._m0[145].y, _933);
    int _959 = as_type<int>(_955);
    if (!_903)
    {
        int _961 = ~_931;
        int _963 = _961 + 1;
        _953 = _963;
    }
    int _965 = _953;
    if (_917)
    {
        out.m_47.x = 0.0;
    }
    if (_917)
    {
        float _967 = _955 * 5.0;
        _959 = as_type<int>(_967);
    }
    int _969 = _959;
    float _971 = _923 * 6.283185482025146484375;
    float _973 = cos(_971);
    float _975 = fma(_527, (*spvDescriptorSet0.vp_c9)._m0[145].x, _937);
    float _977 = _817 * _925;
    float _979 = _957 * _915;
    if (_917)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3142 = as_type<float>(_969);
        out.gl_Position.z = _3142;
    }
    float _981 = float(_965);
    float _983 = _929 * 6.283185482025146484375;
    float _985 = sin(_983);
    float _987 = _929 * 6.283185482025146484375;
    float _989 = cos(_987);
    float _991 = _949 * 6.283185482025146484375;
    float _993 = sin(_991);
    if (_917)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _995 = _949 * 6.283185482025146484375;
    float _997 = cos(_995);
    float _999 = _979 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1001 = _281 * 0.5;
    float _1003 = 0.0 + _981;
    float _1005 = precise::clamp(_1003, 0.0, 1.0);
    float _1007 = _975 * _913;
    float _1009 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _285);
    float _1011 = _977 * _999;
    float _1013 = fma(_1001, _1005, _1001);
    float _1015 = _1007 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1017 = _947 * _985;
    float _1019 = _1009 * _1011;
    float _1021 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1013);
    float _1023 = _977 * _1015;
    float _1025 = _973 * _989;
    float _1027 = _977 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1029 = _1027 * 0.5;
    float _1031 = -_1019;
    float _1033 = _993 * _1031;
    float _1035 = _997 * _1019;
    float _1037 = _1021 * _1023;
    float _1039 = _973 * _985;
    float _1041 = _985 * _997;
    float _1043 = _989 * _997;
    float _1045 = fma(_993, _1025, _1017);
    float _1047 = _973 * _1035;
    float _1049 = _947 * _989;
    float _1051 = _947 * _1035;
    float _1053 = fma(_1043, _1037, _1033);
    float _1055 = fma(_1045, _1037, _1047);
    float _1057 = -_1049;
    float _1059 = fma(_993, _1039, _1057);
    float _1061 = -_1039;
    float _1063 = fma(_993, _1049, _1061);
    float _1065 = fma(_1041, _1029, _1053);
    float _1067 = fma(_1059, _1029, _1055);
    float _1069 = fma(_993, _1017, _1025);
    float _1071 = fma(_1063, _1037, _1051);
    float _1073 = _1067 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1075 = _1067 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1077 = fma(_1069, _1029, _1071);
    float _1079 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1073);
    float _1081 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1075);
    float _1083 = fma(_1077, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1079);
    float _1085 = fma(_1077, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1081);
    float _1087 = _1083 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1089 = _1085 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1091 = _543 + _1087;
    float _1093 = _759 + _1089;
    float _1095 = _1067 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1097 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1099 = _1091 + _1097;
    float _1101 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1103 = _1093 + _1101;
    float _1105 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1095);
    float _1107 = _1099 * _1099;
    float _1109 = _1103 * _1103;
    float _1111 = fma(_1077, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1105);
    float _1113 = _1107 + _1109;
    float _1115 = _1111 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1117 = sqrt(_1113);
    float _1119 = _735 + _1115;
    bool _1121 = _1117 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1123 = _1115;
    float _1125 = _1077;
    float _1127 = _1107;
    float _1129 = _1109;
    float _1131 = _1091;
    float _1133 = _1099;
    float _1135 = _1103;
    if (!_1121)
    {
        _1123 = _1093;
    }
    float _1137 = _1123;
    float _1139 = _1137;
    if (!_1121)
    {
        _1125 = _1119;
    }
    float _1141 = _1125;
    bool _1143 = !_1121;
    float _1145 = _1141;
    if (!_1143)
    {
        float _1147 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1149 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1151 = _1117 + _1149;
        float _1153 = _1119 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1155 = rsqrt(_1113);
        float _1157 = _1151 * _1147;
        float _1159 = _1157 * 0.15915493667125701904296875;
        float _1161 = _1159 * 6.283185482025146484375;
        float _1163 = sin(_1161);
        float _1165 = _1159 * 6.283185482025146484375;
        float _1167 = cos(_1165);
        float _1169 = fma(_1163, _1153, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1171 = _1155 * _1169;
        float _1173 = _1167 + (-1.0);
        float _1175 = fma(_1099, _1171, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1177 = fma(_1103, _1171, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1179 = _1173 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1181 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1183 = _1175 + _1181;
        float _1185 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1187 = _1177 + _1185;
        float _1189 = fma(_1119, _1167, _1179);
        float _1191 = _1183 * _1183;
        float _1193 = _1187 * _1187;
        _1145 = _1189;
        _1127 = _1191;
        _1129 = _1193;
        _1131 = _1175;
        _1139 = _1177;
    }
    float _1195 = _1145;
    float _1197 = _1127;
    float _1199 = _1129;
    float _1201 = _1131;
    float _1203 = _1139;
    float _1205 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1207 = _1195 + _1205;
    float _1209 = fma(_1207, _1207, _1197);
    float _1211 = _1209 + _1199;
    float _1213 = sqrt(_1211);
    bool _1215 = _1213 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1217 = isnan(_1213);
    bool _1219 = _1215 || _1217;
    bool _1221 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1223 = _1219 || _1221;
    float _1225 = _1209;
    if (!_1223)
    {
        _1225 = 1.0;
    }
    float _1227 = _1225;
    bool _1229 = !_1223;
    float _1231 = _1227;
    if (!_1229)
    {
        bool _1233 = _1213 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1235 = isnan(_1213);
        bool _1237 = _1233 || _1235;
        bool _1239 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1241 = _1237 || _1239;
        if (!_1241)
        {
            float _1243 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1245 = _1213 + _1243;
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
            bool _1263 = _1213 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1265 = isnan(_1213);
            bool _1267 = _1263 || _1265;
            bool _1269 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1271 = _1267 || _1269;
            if (!_1271)
            {
                float _1273 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1275 = _1213 + _1273;
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
    float _1293 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1295 = _1195 + _1293;
    float _1297 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1299 = _1201 + _1297;
    float _1301 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1303 = _1203 + _1301;
    float _1305 = fma(_1295, _1291, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1307 = fma(_1299, _1291, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1309 = fma(_1303, _1291, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1311 = -_843;
    float _1313 = fma(_1311, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1305);
    float _1315 = -_845;
    float _1317 = fma(_1315, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1307);
    float _1319 = -_847;
    float _1321 = fma(_1319, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1309);
    float _1323 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1325 = _1313 + _1323;
    float _1327 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1329 = _1317 + _1327;
    float _1331 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1333 = _1321 + _1331;
    float _1335 = _1325 * _1325;
    float _1337 = fma(_1329, _1329, _1335);
    float _1339 = fma(_1333, _1333, _1337);
    float _1341 = rsqrt(_1339);
    float _1343 = _1341 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1345 = _1329 * _1343;
    float _1347 = _1333 * _1343;
    float _1349 = _1345 * _1345;
    float _1351 = _1347 * _1347;
    float _1353 = _1349 + _1351;
    float _1355 = sqrt(_1353);
    bool _1357 = _1355 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1359 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1361 = _1355 + _1359;
    float _1363 = _1333;
    float _1365 = _1335;
    float _1367 = _1361;
    float _1369 = _1325;
    float _1371 = _1345;
    if (_1357)
    {
        float _1373 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1363 = _1373;
    }
    float _1375 = _1363;
    if (_1357)
    {
        float _1377 = rsqrt(_1353);
        _1365 = _1377;
    }
    float _1379 = _1365;
    float _1381 = _1379;
    if (_1357)
    {
        float _1383 = _1361 * _1375;
        _1367 = _1383;
    }
    float _1385 = _1367;
    if (_1357)
    {
        float _1387 = _1385 * 0.15915493667125701904296875;
        _1133 = _1387;
    }
    float _1389 = _1133;
    float _1391 = _1375;
    if (_1357)
    {
        float _1393 = _1389 * 6.283185482025146484375;
        float _1395 = sin(_1393);
        _1391 = _1395;
    }
    float _1397 = _1391;
    float _1399 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1401 = precise::max(0.0, _1399);
    float _1403 = _1341;
    float _1405 = _1401;
    if (_1357)
    {
        float _1407 = _1389 * 6.283185482025146484375;
        float _1409 = cos(_1407);
        _1403 = _1409;
    }
    float _1411 = _1403;
    float _1413 = -_1343;
    float _1415 = -_1401;
    float _1417 = fma(_1325, _1413, _1415);
    if (_1357)
    {
        float _1419 = _1417 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1405 = _1419;
    }
    float _1421 = _1405;
    float _1423 = sqrt(_1339);
    float _1425 = _1397;
    float _1427 = _1421;
    if (_1357)
    {
        float _1429 = fma(_1397, _1421, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1135 = _1429;
    }
    float _1431 = _1135;
    if (!_1357)
    {
        _1425 = _1347;
    }
    float _1433 = _1425;
    float _1435 = _1433;
    if (_1357)
    {
        float _1437 = _1411 + (-1.0);
        _1427 = _1437;
    }
    float _1439 = _1427;
    float _1441 = _1439;
    if (_1357)
    {
        float _1443 = _1379 * _1431;
        _853 = _1443;
    }
    float _1445 = _853;
    if (!_1357)
    {
        _1381 = _1417;
    }
    float _1447 = _1381;
    float _1449 = _1313 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1451 = _1447;
    if (_1357)
    {
        float _1453 = _1439 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1369 = _1453;
    }
    float _1455 = _1369;
    float _1457 = _1455;
    if (_1357)
    {
        float _1459 = _1345 * _1445;
        _1371 = _1459;
    }
    float _1461 = _1371;
    if (!_1357)
    {
        _1441 = _1349;
    }
    float _1463 = _1441;
    float _1465 = _1463;
    if (_1357)
    {
        float _1467 = _1347 * _1445;
        _1435 = _1467;
    }
    float _1469 = _1435;
    if (_1357)
    {
        float _1471 = fma(_1417, _1411, _1455);
        _1451 = _1471;
    }
    float _1473 = _1451;
    if (_1357)
    {
        float _1475 = _1461 * _1461;
        _1465 = _1475;
    }
    float _1477 = _1465;
    if (!_1357)
    {
        _1457 = _1351;
    }
    float _1479 = _1457;
    float _1481 = _1479;
    if (_1357)
    {
        float _1483 = _1469 * _1469;
        _1481 = _1483;
    }
    float _1485 = _1481;
    float _1487 = fma(_1473, _1473, _1477);
    float _1489 = _1487 + _1485;
    float _1491 = _1313 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1493 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1495 = fma(_1423, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1493);
    float _1497 = precise::clamp(_1495, 0.0, 1.0);
    float _1499 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1501 = rsqrt(_1489);
    float _1503 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1491);
    float _1505 = _1313 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1507 = -_1497;
    float _1509 = _1507 + 1.0;
    float _1511 = _1313 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1513 = fma(_1321, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1503);
    float _1515 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1505);
    float _1517 = abs(_1509);
    float _1519 = log2(_1517);
    float _1521 = _1513 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1523 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1511);
    float _1525 = fma(_1321, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1515);
    float _1527 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1449);
    float _1529 = _1521 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1531 = fma(_1321, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1523);
    float _1533 = _1525 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1535 = _1501 * _1461;
    float _1537 = -_1529;
    float _1539 = fma(_1537, _1499, 1.0);
    float _1541 = _1531 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1543 = _1533 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1545 = fma(_1321, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1527);
    float _1547 = _1501 * _1473;
    float _1549 = _1535 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1551 = fma(_1541, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1543);
    float _1553 = _1519 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1555 = _1501 * _1469;
    float _1557 = -_1549;
    float _1559 = fma(_1547, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1557);
    float _1561 = _1545 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1563 = fma(_1521, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1551);
    float _1565 = log2(_1539);
    float _1567 = -_1555;
    float _1569 = fma(_1567, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1559);
    float _1571 = _1533 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1573 = fma(_1561, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1563);
    float _1575 = _1533 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1577 = fma(_1569, -0.5, 0.5);
    float _1579 = fma(_1541, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1571);
    float _1581 = fma(_1569, 0.5, 0.5);
    float _1583 = exp2(_1553);
    float _1585 = fma(_1541, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1575);
    float _1587 = _1547 + 1.0;
    float _1589 = fma(_1521, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1579);
    float _1591 = fma(_1581, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1593 = fma(_1521, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1585);
    float _1595 = 1.0 / _1573;
    float _1597 = fma(_1581, _1591, -0.212114393711090087890625);
    float _1599 = fma(_1581, _1597, 1.570728778839111328125);
    float _1601 = sqrt(_1577);
    float _1603 = -_1547;
    float _1605 = fma(_1583, _1587, _1603);
    float _1607 = fma(_1561, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1589);
    float _1609 = fma(_1561, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1593);
    float _1611 = _1565 * 0.693147182464599609375;
    float _1613 = fma(_1605, 0.5, 0.5);
    float _1615 = _1607 * _1595;
    float _1617 = _1609 * _1595;
    float _1619 = _1611 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1621 = fma(_1615, 0.5, 0.5);
    float _1623 = fma(_1617, -0.5, 0.5);
    float _1625 = _1601 * 0.636619746685028076171875;
    float3 _4205 = float3(_1621, _1623, _1619);
    float _1627 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4205, float3(0.0), isnan(_4205)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4205, float3(0.0), isnan(_4205)), level(0.0)).x;
    float3 _4216 = float3(_1621, _1623, _1619);
    float4 _1630 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4216, float3(0.0), isnan(_4216)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4216, float3(0.0), isnan(_4216)), level(0.0)).xyzw;
    float _1632 = _1630.x;
    float _1634 = _1630.y;
    float _1636 = _1630.z;
    float _1638 = _1630.w;
    float _1640 = -_1599;
    float _1642 = fma(_1625, _1640, 1.0);
    float2 _4238 = float2(_1642, _1613);
    float3 _1646 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4238, float2(0.0), isnan(_4238)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4238, float2(0.0), isnan(_4238)), level(0.0)).xyz;
    float _1648 = _1646.x;
    float _1650 = _1646.y;
    float _1652 = _1646.z;
    float _1654 = _1519 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1656 = _1533 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1658 = fma(_1541, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1656);
    float _1660 = exp2(_1654);
    float _1662 = fma(_1521, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1658);
    float _1664 = fma(_1561, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1662);
    float _1666 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1668 = _1664 + _1573;
    out.gl_Position.x = _1607;
    out.gl_Position.y = _1609;
    out.gl_Position.z = _1664;
    out.gl_Position.w = _1573;
    float _1670 = _1668 * 0.5;
    float _1672 = -_1660;
    float _1674 = _1672 + 1.0;
    out.m_47.x = _1666;
    float _1676 = _1674 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_70.z = _1670;
    out.m_70.w = _1573;
    float _1678 = _1676 * _1627;
    float _1680 = -_1676;
    float _1682 = _1680 + 1.0;
    float _1684 = _1638 * _1678;
    float _1686 = _1652 * _1678;
    float _1688 = fma(_1648, _1684, _1632);
    float _1690 = fma(_1650, _1684, _1634);
    float _1692 = _1638 * _1682;
    float _1694 = fma(_1638, _1686, _1636);
    out.m_72.x = _1688;
    out.m_72.y = _1690;
    out.m_72.z = _1694;
    out.m_72.w = _1692;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1261 = false;
    bool _307 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _86 = in.m_44.w;
    float _88 = trunc(_86);
    int _91 = int(_88);
    bool _95 = _91 >= 1;
    float _97 = 0.0;
    if (!_95)
    {
        _97 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _99 = _97;
    float _101 = _99;
    if (!_95)
    {
        out.m_47.x = 0.0;
    }
    int _103 = 0;
    if (!_95)
    {
        float _105 = _99 * 5.0;
        _103 = as_type<int>(_105);
    }
    int _107 = _103;
    int _109 = _107;
    if (!_95)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1751 = as_type<float>(_107);
        out.gl_Position.z = _1751;
    }
    if (!_95)
    {
        return out;
    }
    float _111 = in.m_49.w;
    bool _113 = _111 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _115 = isnan(_111);
    bool _117 = _113 || _115;
    bool _119 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _121 = _117 || _119;
    float _123 = -_111;
    float _125 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _127 = _125;
    if (_121)
    {
        float _129 = float(_91);
        _101 = _129;
    }
    float _131 = _101;
    bool _133 = _125 >= _131;
    bool _135 = !_121;
    bool _137 = _133 || _135;
    float _139 = _131;
    if (_137)
    {
        _139 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _141 = _139;
    if (_137)
    {
        out.m_47.x = 0.0;
    }
    if (_137)
    {
        float _143 = _141 * 5.0;
        _109 = as_type<int>(_143);
    }
    int _145 = _109;
    if (_137)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1821 = as_type<float>(_145);
        out.gl_Position.z = _1821;
    }
    if (_137)
    {
        return out;
    }
    float _147 = as_type<float>(int(gl_VertexIndex));
    float _149 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _151 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _153 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _155 = _151 || _153;
    bool _157 = isnan(1.0);
    bool _159 = _155 || _157;
    float _161 = in.m_54.w;
    float _163 = in.m_49.x;
    float _165 = in.m_49.y;
    float _167 = in.m_49.z;
    float _169 = in.m_44.x;
    float _171 = in.m_44.y;
    float _173 = in.m_44.z;
    float _175 = 0.0;
    float _177 = _149;
    if (!_159)
    {
        float _179 = _149 * _149;
        float _181 = _179 * 0.5;
        _175 = _181;
    }
    float _183 = _175;
    float _185 = _183;
    if (!_159)
    {
        float _187 = _183 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _185 = _187;
    }
    float _189 = _185;
    bool _191 = !_159;
    float _193 = _189;
    if (!_191)
    {
        float _195 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _197 = log2(_195);
        float _199 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _201 = _199 + 1.0;
        float _203 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _205 = _149 * _197;
        float _207 = 1.0 / _201;
        float _209 = _203 * 0.693147182464599609375;
        float _211 = exp2(_205);
        float _213 = 1.0 / _209;
        float _215 = _211 + (-1.0);
        float _217 = -_215;
        float _219 = fma(_217, _213, _149);
        float _221 = _219 * _207;
        float _223 = _221 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _193 = _223;
    }
    float _225 = _193;
    bool _227 = !_159;
    if (!_227)
    {
        float _229 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _231 = log2(_229);
        float _233 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _235 = _233 + 1.0;
        float _237 = 1.0 / _235;
        float _239 = _149 * _231;
        float _241 = exp2(_239);
        float _243 = -_241;
        float _245 = _243 + 1.0;
        float _247 = _245 * _237;
        _177 = _247;
    }
    float _249 = _177;
    bool _251 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _253 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _255 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _257 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _259 = as_type<int>(_147) & 1;
    bool _261 = _259 != 0;
    float _263 = fma(_249, _163, _253);
    float _265 = fma(_249, _165, _255);
    float _267 = fma(_249, _167, _257);
    int _269 = as_type<int>(_147) & 2;
    bool _271 = _269 != 0;
    float _273 = fma(_263, _161, _169);
    float _275 = fma(_265, _161, _171);
    float _277 = fma(_267, _161, _173);
    bool _279 = !_261;
    float _281 = _279 ? (-0.5) : 0.5;
    bool _283 = !_271;
    float _285 = _283 ? (-0.5) : 0.5;
    bool _287 = !_251;
    float _305;
    if (!_287)
    {
        float _289 = in.m_56.x;
        float _291 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _293 = _289 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _295 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[12].x, _125);
        float _297 = _295 * _291;
        float _299 = floor(_297);
        float _301 = -_299;
        float _303 = _297 + _301;
        _305 = _303;
        _307 = true;
    }
    else
    {
        float _309 = float(_91);
        float _311 = 1.0 / _309;
        float _313 = _125 * _311;
        _305 = _313;
    }
    _307 = false;
    float _315 = _305;
    float _317 = in.m_58.x;
    float _319 = in.m_58.y;
    float _321 = in.m_58.z;
    float _323 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _325 = log2(_323);
    float _327 = in.m_60.x;
    float _329 = in.m_60.y;
    float _331 = in.m_60.z;
    int _333 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _335 = _333 != 0;
    int _337 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _339 = _337 != 0;
    float _341 = in.m_62.x;
    float _343 = in.m_62.y;
    float _345 = in.m_62.z;
    float _347 = (*spvDescriptorSet0.vp_c8)._m0[28].z * (*spvDescriptorSet0.vp_c8)._m0[1].x;
    int _349 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _351 = _349 != 0;
    int _353 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _355 = _353 != 0;
    int _357 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _359 = _357 != 0;
    float _361 = _325 * _125;
    float _363 = _275 * _319;
    float _365 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _367 = exp2(_361);
    float _369 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _371 = _275 * _329;
    float _373 = fma(_273, _317, _363);
    float _375 = (*spvDescriptorSet0.vp_c8)._m0[1].y * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _377 = in.m_56.x;
    float _379 = in.m_56.y;
    float _381 = fma(_273, _327, _371);
    float _383 = _275 * _343;
    float _385 = in.m_56.z;
    float _387 = fma(_273, _341, _383);
    float _389 = (*spvDescriptorSet0.vp_c8)._m0[1].z * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _391 = -_347;
    float _393 = fma((*spvDescriptorSet0.vp_c8)._m0[1].z, (*spvDescriptorSet0.vp_c8)._m0[28].x, _391);
    float _395 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _397 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _395;
    float _399 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _401 = _399 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _403 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _405 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _407 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _409 = -_389;
    float _411 = fma((*spvDescriptorSet0.vp_c8)._m0[1].y, (*spvDescriptorSet0.vp_c8)._m0[28].z, _409);
    float _413 = -_375;
    float _415 = fma((*spvDescriptorSet0.vp_c8)._m0[1].x, (*spvDescriptorSet0.vp_c8)._m0[28].y, _413);
    float _417 = 1.0 / _401;
    float _419 = _403 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _421 = _405 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _423 = _407 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _425 = _377 > 0.5;
    float _427 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _429 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    out.m_64.x = _419;
    out.m_64.y = _421;
    out.m_64.z = _423;
    out.m_64.w = _365;
    float _431 = -_281;
    int _433 = _425 ? as_type<int>(_431) : as_type<int>(_281);
    float _435 = _427 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _437 = _369 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _439 = _429 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _441 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _443 = isnan(1.0);
    bool _445 = _441 || _443;
    bool _447 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _449 = _445 || _447;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _453 = 1.0 + _451;
    float _455 = fma(_277, _331, _381);
    float _457 = fma(_277, _321, _373);
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _461 = _315 + _459;
    float _463 = fma(_277, _345, _387);
    out.m_66.x = _435;
    out.m_66.y = _437;
    out.m_66.z = _439;
    float _465 = 1.0 / _453;
    float _467 = _379 + _385;
    float _469 = _385 * 2.0;
    float _471 = _377 * 2.0;
    float _473 = _467 + (-1.0);
    float _475 = -_367;
    float _477 = _475 + 1.0;
    float _479 = floor(_469);
    float _481 = fma(_473, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _483 = _461 * _417;
    bool _485 = !_335;
    float _487 = _485 ? _281 : as_type<float>(_433);
    float _489 = _385 + _377;
    bool _491 = _379 > 0.5;
    float _493 = _379 * 2.0;
    float _495 = 1.0 / _397;
    float _497 = _489 + (-1.0);
    float _499 = -_285;
    int _501 = _491 ? as_type<int>(_499) : as_type<int>(_285);
    float _503 = _487 + 0.5;
    bool _505 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _507 = isnan(0.0);
    bool _509 = _505 || _507;
    bool _511 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _513 = _509 || _511;
    float _515 = fma(_497, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _517 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _519 = isnan(_315);
    bool _521 = _517 || _519;
    bool _523 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _525 = _521 || _523;
    float _527 = float(_525);
    float _529 = _503 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _531 = floor(_471);
    float _533 = _513 ? _477 : 0.0;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _537 = _315 + _535;
    bool _539 = !_339;
    float _541 = _539 ? _285 : as_type<float>(_501);
    float _543 = _455 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _545 = _479 > 0.0;
    if (_449)
    {
        float _547 = _533 * _465;
        _127 = _547;
    }
    float _549 = _127;
    bool _551 = _479 >= 0.0;
    bool _553 = isnan(_479);
    bool _555 = _551 || _553;
    bool _557 = isnan(0.0);
    bool _559 = _555 || _557;
    float _561 = floor(_493);
    bool _563 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _565 = isnan(_315);
    bool _567 = _563 || _565;
    bool _569 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _571 = _567 || _569;
    float _573 = float(_571);
    float _575 = _537 * _495;
    float _577 = -_527;
    float _579 = _577 + 1.0;
    float _581 = _379 + _377;
    int _583 = _559 ? 0 : 1;
    float _585 = -_541;
    float _587 = _585 + 0.5;
    float _589 = _573 * _579;
    bool _591 = _531 > 0.0;
    float _593 = _581 + (-1.0);
    bool _595 = _531 >= 0.0;
    bool _597 = isnan(_531);
    bool _599 = _595 || _597;
    bool _601 = isnan(0.0);
    bool _603 = _599 || _601;
    float _605 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _607 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _605;
    float _609 = -_573;
    float _611 = _609 + 1.0;
    bool _613 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _615 = isnan(_315);
    bool _617 = _613 || _615;
    bool _619 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _621 = _617 || _619;
    float _623 = float(_621);
    float _625 = fma(_593, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _627 = fma(_607, _575, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _631 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _629;
    int _633 = ~_583;
    int _635 = _633 + 1;
    int _637 = _635 + 1;
    float _639 = _623 * _611;
    int _641 = _637;
    if (!_545)
    {
        int _643 = ~_583;
        int _645 = _643 + 1;
        _641 = _645;
    }
    int _647 = _641;
    float _649 = fma(_631, _575, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    int _651 = _603 ? 0 : 1;
    float _653 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _655 = _561 > 0.0;
    float _657 = -_623;
    float _659 = _657 + 1.0;
    bool _661 = _561 >= 0.0;
    bool _663 = isnan(_561);
    bool _665 = _661 || _663;
    bool _667 = isnan(0.0);
    bool _669 = _665 || _667;
    float _671 = _627 * _639;
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _675 = _673 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _677 = _649 * _639;
    float _679 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _681 = _679 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _683 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _685 = fma(_675, _483, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _687 = fma(_659, (*spvDescriptorSet0.vp_c9)._m0[143].x, _671);
    float _689 = _393 * _393;
    float _691 = fma(_681, _483, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _693 = fma(_659, (*spvDescriptorSet0.vp_c9)._m0[143].y, _677);
    int _695 = _669 ? 0 : 1;
    float _697 = fma(_411, _411, _689);
    float _699 = _529 * _653;
    bool _701 = !_351;
    int _703 = _701 ? 0 : 1;
    float _705 = _587 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _707 = fma(_415, _415, _697);
    int _709 = ~_651;
    int _711 = _709 + 1;
    int _713 = _711 + 1;
    float _715 = _377 + (-0.5);
    int _717 = _713;
    if (!_591)
    {
        int _719 = ~_651;
        int _721 = _719 + 1;
        _717 = _721;
    }
    int _723 = _717;
    int _725 = ~_695;
    int _727 = _725 + 1;
    int _729 = _727 + 1;
    float _731 = rsqrt(_707);
    int _733 = abs(_703);
    float _735 = _457 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _737 = _729;
    if (!_655)
    {
        int _739 = ~_695;
        int _741 = _739 + 1;
        _737 = _741;
    }
    int _743 = _737;
    float _745 = _705 * _683;
    bool _747 = !_355;
    int _749 = _747 ? 0 : 1;
    float _751 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _753 = _735 + _751;
    float _755 = float(_647);
    int _757 = abs(_749);
    float _759 = _463 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _761 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _763 = _543 + _761;
    float _765 = _753 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _767 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _769 = _759 + _767;
    float _771 = float(_733);
    out.m_68.x = _699;
    out.m_68.y = _745;
    float _773 = fma(_763, (*spvDescriptorSet0.vp_c8)._m0[28].x, _765);
    float _775 = _393 * _731;
    float _777 = _411 * _731;
    float _779 = _771 * _755;
    float _781 = fma(_769, (*spvDescriptorSet0.vp_c8)._m0[28].z, _773);
    float _783 = _775 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _785 = float(_723);
    float _787 = _415 * _731;
    bool _789 = !_359;
    int _791 = _789 ? 0 : 1;
    float _793 = _753 * _753;
    float _795 = float(_757);
    float _797 = fma(_777, (*spvDescriptorSet0.vp_c10)._m0[8].x, _783);
    bool _799 = _781 >= 0.0;
    float _801 = fma(_763, _763, _793);
    int _803 = abs(_791);
    float _805 = _795 * _785;
    float _807 = fma(_787, (*spvDescriptorSet0.vp_c10)._m0[10].x, _797);
    float _809 = fma(_769, _769, _801);
    float _811 = _779 * (-2.0);
    float _813 = float(_803);
    float _815 = _805 * (-2.0);
    float _817 = rsqrt(_809);
    float _819 = float(_743);
    float _821 = fma(_625, _811, _625);
    float _823 = _715 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    float _825 = _797;
    if (_799)
    {
        _825 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _827 = _825;
    float _829 = _813 * _819;
    int _831 = as_type<int>(_827);
    if (_799)
    {
        out.m_47.x = 0.0;
    }
    float _833 = fma(_481, _815, _481);
    if (_799)
    {
        float _835 = _827 * 5.0;
        _831 = as_type<int>(_835);
    }
    int _837 = _831;
    float _839 = _273 * _807;
    float _841 = fma(_821, _549, _823);
    if (_799)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2911 = as_type<float>(_837);
        out.gl_Position.z = _2911;
    }
    float _843 = _753 * _817;
    float _845 = _763 * _817;
    float _847 = _769 * _817;
    float _849 = -_843;
    float _851 = fma(_849, (*spvDescriptorSet0.vp_c9)._m0[18].w, _753);
    float _853 = _845;
    if (_799)
    {
        return out;
    }
    float _855 = -_843;
    float _857 = fma(_855, (*spvDescriptorSet0.vp_c9)._m0[18].w, _735);
    float _859 = -_845;
    float _861 = fma(_859, (*spvDescriptorSet0.vp_c9)._m0[18].w, _543);
    float _863 = -_845;
    float _865 = fma(_863, (*spvDescriptorSet0.vp_c9)._m0[18].w, _763);
    float _867 = _379 + (-0.5);
    float _869 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _871 = _857 + _869;
    float _873 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _875 = _861 + _873;
    float _877 = _851 * _851;
    float _879 = _839 * (-1.60000002384185791015625);
    float _881 = _871 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _883 = -_847;
    float _885 = fma(_883, (*spvDescriptorSet0.vp_c9)._m0[18].w, _759);
    float _887 = fma(_865, _865, _877);
    float _889 = _867 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    float _891 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[28].x, _881);
    float _893 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _895 = _885 + _893;
    float _897 = -_847;
    float _899 = fma(_897, (*spvDescriptorSet0.vp_c9)._m0[18].w, _769);
    float _901 = fma(_833, _549, _889);
    bool _903 = _285 > 0.0;
    float _905 = fma(_895, (*spvDescriptorSet0.vp_c8)._m0[28].z, _891);
    float _907 = _829 * (-2.0);
    float _909 = fma(_899, _899, _887);
    float _911 = _385 + (-0.5);
    float _913 = in.m_54.x;
    float _915 = in.m_54.y;
    bool _917 = _905 >= 0.0;
    float _919 = fma(_879, _907, _879);
    float _921 = fma(_515, _907, _515);
    float _923 = _841 * 0.15915493667125701904296875;
    float _925 = sqrt(_909);
    float _927 = fma(_911, (*spvDescriptorSet0.vp_c9)._m0[196].z, _919);
    float _929 = _901 * 0.15915493667125701904296875;
    int _931 = _271 ? 0 : 1;
    float _933 = fma(_691, _589, _693);
    float _935 = fma(_921, _549, _927);
    float _937 = fma(_685, _589, _687);
    int _939 = ~_931;
    int _941 = _939 + 1;
    int _943 = _941 + 1;
    float _945 = _923 * 6.283185482025146484375;
    float _947 = sin(_945);
    float _949 = _935 * 0.15915493667125701904296875;
    float _951 = _919;
    int _953 = _943;
    if (_917)
    {
        _951 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _955 = _951;
    float _957 = fma(_527, (*spvDescriptorSet0.vp_c9)._m0[145].y, _933);
    int _959 = as_type<int>(_955);
    if (!_903)
    {
        int _961 = ~_931;
        int _963 = _961 + 1;
        _953 = _963;
    }
    int _965 = _953;
    if (_917)
    {
        out.m_47.x = 0.0;
    }
    if (_917)
    {
        float _967 = _955 * 5.0;
        _959 = as_type<int>(_967);
    }
    int _969 = _959;
    float _971 = _923 * 6.283185482025146484375;
    float _973 = cos(_971);
    float _975 = fma(_527, (*spvDescriptorSet0.vp_c9)._m0[145].x, _937);
    float _977 = _817 * _925;
    float _979 = _957 * _915;
    if (_917)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3142 = as_type<float>(_969);
        out.gl_Position.z = _3142;
    }
    float _981 = float(_965);
    float _983 = _929 * 6.283185482025146484375;
    float _985 = sin(_983);
    float _987 = _929 * 6.283185482025146484375;
    float _989 = cos(_987);
    float _991 = _949 * 6.283185482025146484375;
    float _993 = sin(_991);
    if (_917)
    {
        return out;
    }
    float _995 = _949 * 6.283185482025146484375;
    float _997 = cos(_995);
    float _999 = _979 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1001 = _281 * 0.5;
    float _1003 = 0.0 + _981;
    float _1005 = precise::clamp(_1003, 0.0, 1.0);
    float _1007 = _975 * _913;
    float _1009 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _285);
    float _1011 = _977 * _999;
    float _1013 = fma(_1001, _1005, _1001);
    float _1015 = _1007 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1017 = _947 * _985;
    float _1019 = _1009 * _1011;
    float _1021 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1013);
    float _1023 = _977 * _1015;
    float _1025 = _973 * _989;
    float _1027 = _977 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1029 = _1027 * 0.5;
    float _1031 = -_1019;
    float _1033 = _993 * _1031;
    float _1035 = _997 * _1019;
    float _1037 = _1021 * _1023;
    float _1039 = _973 * _985;
    float _1041 = _985 * _997;
    float _1043 = _989 * _997;
    float _1045 = fma(_993, _1025, _1017);
    float _1047 = _973 * _1035;
    float _1049 = _947 * _989;
    float _1051 = _947 * _1035;
    float _1053 = fma(_1043, _1037, _1033);
    float _1055 = fma(_1045, _1037, _1047);
    float _1057 = -_1049;
    float _1059 = fma(_993, _1039, _1057);
    float _1061 = -_1039;
    float _1063 = fma(_993, _1049, _1061);
    float _1065 = fma(_1041, _1029, _1053);
    float _1067 = fma(_1059, _1029, _1055);
    float _1069 = fma(_993, _1017, _1025);
    float _1071 = fma(_1063, _1037, _1051);
    float _1073 = _1067 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1075 = _1067 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1077 = fma(_1069, _1029, _1071);
    float _1079 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1073);
    float _1081 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1075);
    float _1083 = fma(_1077, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1079);
    float _1085 = fma(_1077, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1081);
    float _1087 = _1083 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1089 = _1085 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1091 = _543 + _1087;
    float _1093 = _759 + _1089;
    float _1095 = _1067 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1097 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1099 = _1091 + _1097;
    float _1101 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1103 = _1093 + _1101;
    float _1105 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1095);
    float _1107 = _1099 * _1099;
    float _1109 = _1103 * _1103;
    float _1111 = fma(_1077, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1105);
    float _1113 = _1107 + _1109;
    float _1115 = _1111 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1117 = sqrt(_1113);
    float _1119 = _735 + _1115;
    bool _1121 = _1117 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1123 = _1115;
    float _1125 = _1077;
    float _1127 = _1107;
    float _1129 = _1109;
    float _1131 = _1091;
    float _1133 = _1099;
    float _1135 = _1103;
    if (!_1121)
    {
        _1123 = _1093;
    }
    float _1137 = _1123;
    float _1139 = _1137;
    if (!_1121)
    {
        _1125 = _1119;
    }
    float _1141 = _1125;
    bool _1143 = !_1121;
    float _1145 = _1141;
    if (!_1143)
    {
        float _1147 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1149 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1151 = _1117 + _1149;
        float _1153 = _1119 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1155 = rsqrt(_1113);
        float _1157 = _1151 * _1147;
        float _1159 = _1157 * 0.15915493667125701904296875;
        float _1161 = _1159 * 6.283185482025146484375;
        float _1163 = sin(_1161);
        float _1165 = _1159 * 6.283185482025146484375;
        float _1167 = cos(_1165);
        float _1169 = fma(_1163, _1153, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1171 = _1155 * _1169;
        float _1173 = _1167 + (-1.0);
        float _1175 = fma(_1099, _1171, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1177 = fma(_1103, _1171, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1179 = _1173 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1181 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1183 = _1175 + _1181;
        float _1185 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1187 = _1177 + _1185;
        float _1189 = fma(_1119, _1167, _1179);
        float _1191 = _1183 * _1183;
        float _1193 = _1187 * _1187;
        _1145 = _1189;
        _1127 = _1191;
        _1129 = _1193;
        _1131 = _1175;
        _1139 = _1177;
    }
    float _1195 = _1145;
    float _1197 = _1127;
    float _1199 = _1129;
    float _1201 = _1131;
    float _1203 = _1139;
    float _1205 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1207 = _1195 + _1205;
    float _1209 = fma(_1207, _1207, _1197);
    float _1211 = _1209 + _1199;
    float _1213 = sqrt(_1211);
    bool _1215 = _1213 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1217 = isnan(_1213);
    bool _1219 = _1215 || _1217;
    bool _1221 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1223 = _1219 || _1221;
    float _1225 = _1209;
    if (!_1223)
    {
        _1225 = 1.0;
    }
    float _1227 = _1225;
    bool _1229 = !_1223;
    float _1231 = _1227;
    if (!_1229)
    {
        bool _1233 = _1213 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1235 = isnan(_1213);
        bool _1237 = _1233 || _1235;
        bool _1239 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1241 = _1237 || _1239;
        if (!_1241)
        {
            float _1243 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1245 = _1213 + _1243;
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
            bool _1263 = _1213 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1265 = isnan(_1213);
            bool _1267 = _1263 || _1265;
            bool _1269 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1271 = _1267 || _1269;
            if (!_1271)
            {
                float _1273 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1275 = _1213 + _1273;
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
    float _1293 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1295 = _1195 + _1293;
    float _1297 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1299 = _1201 + _1297;
    float _1301 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1303 = _1203 + _1301;
    float _1305 = fma(_1295, _1291, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1307 = fma(_1299, _1291, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1309 = fma(_1303, _1291, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1311 = -_843;
    float _1313 = fma(_1311, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1305);
    float _1315 = -_845;
    float _1317 = fma(_1315, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1307);
    float _1319 = -_847;
    float _1321 = fma(_1319, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1309);
    float _1323 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1325 = _1313 + _1323;
    float _1327 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1329 = _1317 + _1327;
    float _1331 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1333 = _1321 + _1331;
    float _1335 = _1325 * _1325;
    float _1337 = fma(_1329, _1329, _1335);
    float _1339 = fma(_1333, _1333, _1337);
    float _1341 = rsqrt(_1339);
    float _1343 = _1341 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1345 = _1329 * _1343;
    float _1347 = _1333 * _1343;
    float _1349 = _1345 * _1345;
    float _1351 = _1347 * _1347;
    float _1353 = _1349 + _1351;
    float _1355 = sqrt(_1353);
    bool _1357 = _1355 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1359 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1361 = _1355 + _1359;
    float _1363 = _1333;
    float _1365 = _1335;
    float _1367 = _1361;
    float _1369 = _1325;
    float _1371 = _1345;
    if (_1357)
    {
        float _1373 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1363 = _1373;
    }
    float _1375 = _1363;
    if (_1357)
    {
        float _1377 = rsqrt(_1353);
        _1365 = _1377;
    }
    float _1379 = _1365;
    float _1381 = _1379;
    if (_1357)
    {
        float _1383 = _1361 * _1375;
        _1367 = _1383;
    }
    float _1385 = _1367;
    if (_1357)
    {
        float _1387 = _1385 * 0.15915493667125701904296875;
        _1133 = _1387;
    }
    float _1389 = _1133;
    float _1391 = _1375;
    if (_1357)
    {
        float _1393 = _1389 * 6.283185482025146484375;
        float _1395 = sin(_1393);
        _1391 = _1395;
    }
    float _1397 = _1391;
    float _1399 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1401 = precise::max(0.0, _1399);
    float _1403 = _1341;
    float _1405 = _1401;
    if (_1357)
    {
        float _1407 = _1389 * 6.283185482025146484375;
        float _1409 = cos(_1407);
        _1403 = _1409;
    }
    float _1411 = _1403;
    float _1413 = -_1343;
    float _1415 = -_1401;
    float _1417 = fma(_1325, _1413, _1415);
    if (_1357)
    {
        float _1419 = _1417 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1405 = _1419;
    }
    float _1421 = _1405;
    float _1423 = sqrt(_1339);
    float _1425 = _1397;
    float _1427 = _1421;
    if (_1357)
    {
        float _1429 = fma(_1397, _1421, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1135 = _1429;
    }
    float _1431 = _1135;
    if (!_1357)
    {
        _1425 = _1347;
    }
    float _1433 = _1425;
    float _1435 = _1433;
    if (_1357)
    {
        float _1437 = _1411 + (-1.0);
        _1427 = _1437;
    }
    float _1439 = _1427;
    float _1441 = _1439;
    if (_1357)
    {
        float _1443 = _1379 * _1431;
        _853 = _1443;
    }
    float _1445 = _853;
    if (!_1357)
    {
        _1381 = _1417;
    }
    float _1447 = _1381;
    float _1449 = _1313 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1451 = _1447;
    if (_1357)
    {
        float _1453 = _1439 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1369 = _1453;
    }
    float _1455 = _1369;
    float _1457 = _1455;
    if (_1357)
    {
        float _1459 = _1345 * _1445;
        _1371 = _1459;
    }
    float _1461 = _1371;
    if (!_1357)
    {
        _1441 = _1349;
    }
    float _1463 = _1441;
    float _1465 = _1463;
    if (_1357)
    {
        float _1467 = _1347 * _1445;
        _1435 = _1467;
    }
    float _1469 = _1435;
    if (_1357)
    {
        float _1471 = fma(_1417, _1411, _1455);
        _1451 = _1471;
    }
    float _1473 = _1451;
    if (_1357)
    {
        float _1475 = _1461 * _1461;
        _1465 = _1475;
    }
    float _1477 = _1465;
    if (!_1357)
    {
        _1457 = _1351;
    }
    float _1479 = _1457;
    float _1481 = _1479;
    if (_1357)
    {
        float _1483 = _1469 * _1469;
        _1481 = _1483;
    }
    float _1485 = _1481;
    float _1487 = fma(_1473, _1473, _1477);
    float _1489 = _1487 + _1485;
    float _1491 = _1313 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1493 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1495 = fma(_1423, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1493);
    float _1497 = precise::clamp(_1495, 0.0, 1.0);
    float _1499 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1501 = rsqrt(_1489);
    float _1503 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1491);
    float _1505 = _1313 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1507 = -_1497;
    float _1509 = _1507 + 1.0;
    float _1511 = _1313 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1513 = fma(_1321, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1503);
    float _1515 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1505);
    float _1517 = abs(_1509);
    float _1519 = log2(_1517);
    float _1521 = _1513 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1523 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1511);
    float _1525 = fma(_1321, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1515);
    float _1527 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1449);
    float _1529 = _1521 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1531 = fma(_1321, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1523);
    float _1533 = _1525 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1535 = _1501 * _1461;
    float _1537 = -_1529;
    float _1539 = fma(_1537, _1499, 1.0);
    float _1541 = _1531 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1543 = _1533 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1545 = fma(_1321, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1527);
    float _1547 = _1501 * _1473;
    float _1549 = _1535 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1551 = fma(_1541, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1543);
    float _1553 = _1519 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1555 = _1501 * _1469;
    float _1557 = -_1549;
    float _1559 = fma(_1547, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1557);
    float _1561 = _1545 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1563 = fma(_1521, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1551);
    float _1565 = log2(_1539);
    float _1567 = -_1555;
    float _1569 = fma(_1567, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1559);
    float _1571 = _1533 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1573 = fma(_1561, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1563);
    float _1575 = _1533 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1577 = fma(_1569, -0.5, 0.5);
    float _1579 = fma(_1541, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1571);
    float _1581 = fma(_1569, 0.5, 0.5);
    float _1583 = exp2(_1553);
    float _1585 = fma(_1541, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1575);
    float _1587 = _1547 + 1.0;
    float _1589 = fma(_1521, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1579);
    float _1591 = fma(_1581, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1593 = fma(_1521, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1585);
    float _1595 = 1.0 / _1573;
    float _1597 = fma(_1581, _1591, -0.212114393711090087890625);
    float _1599 = fma(_1581, _1597, 1.570728778839111328125);
    float _1601 = sqrt(_1577);
    float _1603 = -_1547;
    float _1605 = fma(_1583, _1587, _1603);
    float _1607 = fma(_1561, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1589);
    float _1609 = fma(_1561, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1593);
    float _1611 = _1565 * 0.693147182464599609375;
    float _1613 = fma(_1605, 0.5, 0.5);
    float _1615 = _1607 * _1595;
    float _1617 = _1609 * _1595;
    float _1619 = _1611 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1621 = fma(_1615, 0.5, 0.5);
    float _1623 = fma(_1617, -0.5, 0.5);
    float _1625 = _1601 * 0.636619746685028076171875;
    float3 _4205 = float3(_1621, _1623, _1619);
    float _1627 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4205, float3(0.0), isnan(_4205)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4205, float3(0.0), isnan(_4205)), level(0.0)).x;
    float3 _4216 = float3(_1621, _1623, _1619);
    float4 _1630 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4216, float3(0.0), isnan(_4216)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4216, float3(0.0), isnan(_4216)), level(0.0)).xyzw;
    float _1632 = _1630.x;
    float _1634 = _1630.y;
    float _1636 = _1630.z;
    float _1638 = _1630.w;
    float _1640 = -_1599;
    float _1642 = fma(_1625, _1640, 1.0);
    float2 _4238 = float2(_1642, _1613);
    float3 _1646 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4238, float2(0.0), isnan(_4238)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4238, float2(0.0), isnan(_4238)), level(0.0)).xyz;
    float _1648 = _1646.x;
    float _1650 = _1646.y;
    float _1652 = _1646.z;
    float _1654 = _1519 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1656 = _1533 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1658 = fma(_1541, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1656);
    float _1660 = exp2(_1654);
    float _1662 = fma(_1521, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1658);
    float _1664 = fma(_1561, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1662);
    float _1666 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1668 = _1664 + _1573;
    out.gl_Position.x = _1607;
    out.gl_Position.y = _1609;
    out.gl_Position.z = _1664;
    out.gl_Position.w = _1573;
    float _1670 = _1668 * 0.5;
    float _1672 = -_1660;
    float _1674 = _1672 + 1.0;
    out.m_47.x = _1666;
    float _1676 = _1674 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_70.z = _1670;
    out.m_70.w = _1573;
    float _1678 = _1676 * _1627;
    float _1680 = -_1676;
    float _1682 = _1680 + 1.0;
    float _1684 = _1638 * _1678;
    float _1686 = _1652 * _1678;
    float _1688 = fma(_1648, _1684, _1632);
    float _1690 = fma(_1650, _1684, _1634);
    float _1692 = _1638 * _1682;
    float _1694 = fma(_1638, _1686, _1636);
    out.m_72.x = _1688;
    out.m_72.y = _1690;
    out.m_72.z = _1694;
    out.m_72.w = _1692;
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
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1261 = false;
    bool _307 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _86 = in.m_44.w;
    float _88 = trunc(_86);
    int _91 = int(_88);
    bool _95 = _91 >= 1;
    float _97 = 0.0;
    if (!_95)
    {
        _97 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _99 = _97;
    float _101 = _99;
    if (!_95)
    {
        out.m_47.x = 0.0;
    }
    int _103 = 0;
    if (!_95)
    {
        float _105 = _99 * 5.0;
        _103 = as_type<int>(_105);
    }
    int _107 = _103;
    int _109 = _107;
    if (!_95)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1751 = as_type<float>(_107);
        out.gl_Position.z = _1751;
    }
    if (!_95)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _111 = in.m_49.w;
    bool _113 = _111 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _115 = isnan(_111);
    bool _117 = _113 || _115;
    bool _119 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _121 = _117 || _119;
    float _123 = -_111;
    float _125 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _127 = _125;
    if (_121)
    {
        float _129 = float(_91);
        _101 = _129;
    }
    float _131 = _101;
    bool _133 = _125 >= _131;
    bool _135 = !_121;
    bool _137 = _133 || _135;
    float _139 = _131;
    if (_137)
    {
        _139 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _141 = _139;
    if (_137)
    {
        out.m_47.x = 0.0;
    }
    if (_137)
    {
        float _143 = _141 * 5.0;
        _109 = as_type<int>(_143);
    }
    int _145 = _109;
    if (_137)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1821 = as_type<float>(_145);
        out.gl_Position.z = _1821;
    }
    if (_137)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _147 = as_type<float>(int(gl_VertexIndex));
    float _149 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _151 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _153 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _155 = _151 || _153;
    bool _157 = isnan(1.0);
    bool _159 = _155 || _157;
    float _161 = in.m_54.w;
    float _163 = in.m_49.x;
    float _165 = in.m_49.y;
    float _167 = in.m_49.z;
    float _169 = in.m_44.x;
    float _171 = in.m_44.y;
    float _173 = in.m_44.z;
    float _175 = 0.0;
    float _177 = _149;
    if (!_159)
    {
        float _179 = _149 * _149;
        float _181 = _179 * 0.5;
        _175 = _181;
    }
    float _183 = _175;
    float _185 = _183;
    if (!_159)
    {
        float _187 = _183 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _185 = _187;
    }
    float _189 = _185;
    bool _191 = !_159;
    float _193 = _189;
    if (!_191)
    {
        float _195 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _197 = log2(_195);
        float _199 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _201 = _199 + 1.0;
        float _203 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _205 = _149 * _197;
        float _207 = 1.0 / _201;
        float _209 = _203 * 0.693147182464599609375;
        float _211 = exp2(_205);
        float _213 = 1.0 / _209;
        float _215 = _211 + (-1.0);
        float _217 = -_215;
        float _219 = fma(_217, _213, _149);
        float _221 = _219 * _207;
        float _223 = _221 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _193 = _223;
    }
    float _225 = _193;
    bool _227 = !_159;
    if (!_227)
    {
        float _229 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _231 = log2(_229);
        float _233 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _235 = _233 + 1.0;
        float _237 = 1.0 / _235;
        float _239 = _149 * _231;
        float _241 = exp2(_239);
        float _243 = -_241;
        float _245 = _243 + 1.0;
        float _247 = _245 * _237;
        _177 = _247;
    }
    float _249 = _177;
    bool _251 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _253 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _255 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _257 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _259 = as_type<int>(_147) & 1;
    bool _261 = _259 != 0;
    float _263 = fma(_249, _163, _253);
    float _265 = fma(_249, _165, _255);
    float _267 = fma(_249, _167, _257);
    int _269 = as_type<int>(_147) & 2;
    bool _271 = _269 != 0;
    float _273 = fma(_263, _161, _169);
    float _275 = fma(_265, _161, _171);
    float _277 = fma(_267, _161, _173);
    bool _279 = !_261;
    float _281 = _279 ? (-0.5) : 0.5;
    bool _283 = !_271;
    float _285 = _283 ? (-0.5) : 0.5;
    bool _287 = !_251;
    float _305;
    if (!_287)
    {
        float _289 = in.m_56.x;
        float _291 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _293 = _289 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _295 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[12].x, _125);
        float _297 = _295 * _291;
        float _299 = floor(_297);
        float _301 = -_299;
        float _303 = _297 + _301;
        _305 = _303;
        _307 = true;
    }
    else
    {
        float _309 = float(_91);
        float _311 = 1.0 / _309;
        float _313 = _125 * _311;
        _305 = _313;
    }
    _307 = false;
    float _315 = _305;
    float _317 = in.m_58.x;
    float _319 = in.m_58.y;
    float _321 = in.m_58.z;
    float _323 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _325 = log2(_323);
    float _327 = in.m_60.x;
    float _329 = in.m_60.y;
    float _331 = in.m_60.z;
    int _333 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _335 = _333 != 0;
    int _337 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _339 = _337 != 0;
    float _341 = in.m_62.x;
    float _343 = in.m_62.y;
    float _345 = in.m_62.z;
    float _347 = (*spvDescriptorSet0.vp_c8)._m0[28].z * (*spvDescriptorSet0.vp_c8)._m0[1].x;
    int _349 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _351 = _349 != 0;
    int _353 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _355 = _353 != 0;
    int _357 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _359 = _357 != 0;
    float _361 = _325 * _125;
    float _363 = _275 * _319;
    float _365 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _367 = exp2(_361);
    float _369 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _371 = _275 * _329;
    float _373 = fma(_273, _317, _363);
    float _375 = (*spvDescriptorSet0.vp_c8)._m0[1].y * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _377 = in.m_56.x;
    float _379 = in.m_56.y;
    float _381 = fma(_273, _327, _371);
    float _383 = _275 * _343;
    float _385 = in.m_56.z;
    float _387 = fma(_273, _341, _383);
    float _389 = (*spvDescriptorSet0.vp_c8)._m0[1].z * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _391 = -_347;
    float _393 = fma((*spvDescriptorSet0.vp_c8)._m0[1].z, (*spvDescriptorSet0.vp_c8)._m0[28].x, _391);
    float _395 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _397 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _395;
    float _399 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _401 = _399 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _403 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _405 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _407 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _409 = -_389;
    float _411 = fma((*spvDescriptorSet0.vp_c8)._m0[1].y, (*spvDescriptorSet0.vp_c8)._m0[28].z, _409);
    float _413 = -_375;
    float _415 = fma((*spvDescriptorSet0.vp_c8)._m0[1].x, (*spvDescriptorSet0.vp_c8)._m0[28].y, _413);
    float _417 = 1.0 / _401;
    float _419 = _403 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _421 = _405 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _423 = _407 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _425 = _377 > 0.5;
    float _427 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _429 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    out.m_64.x = _419;
    out.m_64.y = _421;
    out.m_64.z = _423;
    out.m_64.w = _365;
    float _431 = -_281;
    int _433 = _425 ? as_type<int>(_431) : as_type<int>(_281);
    float _435 = _427 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _437 = _369 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _439 = _429 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _441 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _443 = isnan(1.0);
    bool _445 = _441 || _443;
    bool _447 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _449 = _445 || _447;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _453 = 1.0 + _451;
    float _455 = fma(_277, _331, _381);
    float _457 = fma(_277, _321, _373);
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _461 = _315 + _459;
    float _463 = fma(_277, _345, _387);
    out.m_66.x = _435;
    out.m_66.y = _437;
    out.m_66.z = _439;
    float _465 = 1.0 / _453;
    float _467 = _379 + _385;
    float _469 = _385 * 2.0;
    float _471 = _377 * 2.0;
    float _473 = _467 + (-1.0);
    float _475 = -_367;
    float _477 = _475 + 1.0;
    float _479 = floor(_469);
    float _481 = fma(_473, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _483 = _461 * _417;
    bool _485 = !_335;
    float _487 = _485 ? _281 : as_type<float>(_433);
    float _489 = _385 + _377;
    bool _491 = _379 > 0.5;
    float _493 = _379 * 2.0;
    float _495 = 1.0 / _397;
    float _497 = _489 + (-1.0);
    float _499 = -_285;
    int _501 = _491 ? as_type<int>(_499) : as_type<int>(_285);
    float _503 = _487 + 0.5;
    bool _505 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _507 = isnan(0.0);
    bool _509 = _505 || _507;
    bool _511 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _513 = _509 || _511;
    float _515 = fma(_497, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _517 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _519 = isnan(_315);
    bool _521 = _517 || _519;
    bool _523 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _525 = _521 || _523;
    float _527 = float(_525);
    float _529 = _503 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _531 = floor(_471);
    float _533 = _513 ? _477 : 0.0;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _537 = _315 + _535;
    bool _539 = !_339;
    float _541 = _539 ? _285 : as_type<float>(_501);
    float _543 = _455 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _545 = _479 > 0.0;
    if (_449)
    {
        float _547 = _533 * _465;
        _127 = _547;
    }
    float _549 = _127;
    bool _551 = _479 >= 0.0;
    bool _553 = isnan(_479);
    bool _555 = _551 || _553;
    bool _557 = isnan(0.0);
    bool _559 = _555 || _557;
    float _561 = floor(_493);
    bool _563 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _565 = isnan(_315);
    bool _567 = _563 || _565;
    bool _569 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _571 = _567 || _569;
    float _573 = float(_571);
    float _575 = _537 * _495;
    float _577 = -_527;
    float _579 = _577 + 1.0;
    float _581 = _379 + _377;
    int _583 = _559 ? 0 : 1;
    float _585 = -_541;
    float _587 = _585 + 0.5;
    float _589 = _573 * _579;
    bool _591 = _531 > 0.0;
    float _593 = _581 + (-1.0);
    bool _595 = _531 >= 0.0;
    bool _597 = isnan(_531);
    bool _599 = _595 || _597;
    bool _601 = isnan(0.0);
    bool _603 = _599 || _601;
    float _605 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _607 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _605;
    float _609 = -_573;
    float _611 = _609 + 1.0;
    bool _613 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _615 = isnan(_315);
    bool _617 = _613 || _615;
    bool _619 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _621 = _617 || _619;
    float _623 = float(_621);
    float _625 = fma(_593, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _627 = fma(_607, _575, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _631 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _629;
    int _633 = ~_583;
    int _635 = _633 + 1;
    int _637 = _635 + 1;
    float _639 = _623 * _611;
    int _641 = _637;
    if (!_545)
    {
        int _643 = ~_583;
        int _645 = _643 + 1;
        _641 = _645;
    }
    int _647 = _641;
    float _649 = fma(_631, _575, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    int _651 = _603 ? 0 : 1;
    float _653 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _655 = _561 > 0.0;
    float _657 = -_623;
    float _659 = _657 + 1.0;
    bool _661 = _561 >= 0.0;
    bool _663 = isnan(_561);
    bool _665 = _661 || _663;
    bool _667 = isnan(0.0);
    bool _669 = _665 || _667;
    float _671 = _627 * _639;
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _675 = _673 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _677 = _649 * _639;
    float _679 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _681 = _679 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _683 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _685 = fma(_675, _483, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _687 = fma(_659, (*spvDescriptorSet0.vp_c9)._m0[143].x, _671);
    float _689 = _393 * _393;
    float _691 = fma(_681, _483, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _693 = fma(_659, (*spvDescriptorSet0.vp_c9)._m0[143].y, _677);
    int _695 = _669 ? 0 : 1;
    float _697 = fma(_411, _411, _689);
    float _699 = _529 * _653;
    bool _701 = !_351;
    int _703 = _701 ? 0 : 1;
    float _705 = _587 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _707 = fma(_415, _415, _697);
    int _709 = ~_651;
    int _711 = _709 + 1;
    int _713 = _711 + 1;
    float _715 = _377 + (-0.5);
    int _717 = _713;
    if (!_591)
    {
        int _719 = ~_651;
        int _721 = _719 + 1;
        _717 = _721;
    }
    int _723 = _717;
    int _725 = ~_695;
    int _727 = _725 + 1;
    int _729 = _727 + 1;
    float _731 = rsqrt(_707);
    int _733 = abs(_703);
    float _735 = _457 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _737 = _729;
    if (!_655)
    {
        int _739 = ~_695;
        int _741 = _739 + 1;
        _737 = _741;
    }
    int _743 = _737;
    float _745 = _705 * _683;
    bool _747 = !_355;
    int _749 = _747 ? 0 : 1;
    float _751 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _753 = _735 + _751;
    float _755 = float(_647);
    int _757 = abs(_749);
    float _759 = _463 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _761 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _763 = _543 + _761;
    float _765 = _753 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _767 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _769 = _759 + _767;
    float _771 = float(_733);
    out.m_68.x = _699;
    out.m_68.y = _745;
    float _773 = fma(_763, (*spvDescriptorSet0.vp_c8)._m0[28].x, _765);
    float _775 = _393 * _731;
    float _777 = _411 * _731;
    float _779 = _771 * _755;
    float _781 = fma(_769, (*spvDescriptorSet0.vp_c8)._m0[28].z, _773);
    float _783 = _775 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _785 = float(_723);
    float _787 = _415 * _731;
    bool _789 = !_359;
    int _791 = _789 ? 0 : 1;
    float _793 = _753 * _753;
    float _795 = float(_757);
    float _797 = fma(_777, (*spvDescriptorSet0.vp_c10)._m0[8].x, _783);
    bool _799 = _781 >= 0.0;
    float _801 = fma(_763, _763, _793);
    int _803 = abs(_791);
    float _805 = _795 * _785;
    float _807 = fma(_787, (*spvDescriptorSet0.vp_c10)._m0[10].x, _797);
    float _809 = fma(_769, _769, _801);
    float _811 = _779 * (-2.0);
    float _813 = float(_803);
    float _815 = _805 * (-2.0);
    float _817 = rsqrt(_809);
    float _819 = float(_743);
    float _821 = fma(_625, _811, _625);
    float _823 = _715 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    float _825 = _797;
    if (_799)
    {
        _825 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _827 = _825;
    float _829 = _813 * _819;
    int _831 = as_type<int>(_827);
    if (_799)
    {
        out.m_47.x = 0.0;
    }
    float _833 = fma(_481, _815, _481);
    if (_799)
    {
        float _835 = _827 * 5.0;
        _831 = as_type<int>(_835);
    }
    int _837 = _831;
    float _839 = _273 * _807;
    float _841 = fma(_821, _549, _823);
    if (_799)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2911 = as_type<float>(_837);
        out.gl_Position.z = _2911;
    }
    float _843 = _753 * _817;
    float _845 = _763 * _817;
    float _847 = _769 * _817;
    float _849 = -_843;
    float _851 = fma(_849, (*spvDescriptorSet0.vp_c9)._m0[18].w, _753);
    float _853 = _845;
    if (_799)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _855 = -_843;
    float _857 = fma(_855, (*spvDescriptorSet0.vp_c9)._m0[18].w, _735);
    float _859 = -_845;
    float _861 = fma(_859, (*spvDescriptorSet0.vp_c9)._m0[18].w, _543);
    float _863 = -_845;
    float _865 = fma(_863, (*spvDescriptorSet0.vp_c9)._m0[18].w, _763);
    float _867 = _379 + (-0.5);
    float _869 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _871 = _857 + _869;
    float _873 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _875 = _861 + _873;
    float _877 = _851 * _851;
    float _879 = _839 * (-1.60000002384185791015625);
    float _881 = _871 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _883 = -_847;
    float _885 = fma(_883, (*spvDescriptorSet0.vp_c9)._m0[18].w, _759);
    float _887 = fma(_865, _865, _877);
    float _889 = _867 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    float _891 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[28].x, _881);
    float _893 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _895 = _885 + _893;
    float _897 = -_847;
    float _899 = fma(_897, (*spvDescriptorSet0.vp_c9)._m0[18].w, _769);
    float _901 = fma(_833, _549, _889);
    bool _903 = _285 > 0.0;
    float _905 = fma(_895, (*spvDescriptorSet0.vp_c8)._m0[28].z, _891);
    float _907 = _829 * (-2.0);
    float _909 = fma(_899, _899, _887);
    float _911 = _385 + (-0.5);
    float _913 = in.m_54.x;
    float _915 = in.m_54.y;
    bool _917 = _905 >= 0.0;
    float _919 = fma(_879, _907, _879);
    float _921 = fma(_515, _907, _515);
    float _923 = _841 * 0.15915493667125701904296875;
    float _925 = sqrt(_909);
    float _927 = fma(_911, (*spvDescriptorSet0.vp_c9)._m0[196].z, _919);
    float _929 = _901 * 0.15915493667125701904296875;
    int _931 = _271 ? 0 : 1;
    float _933 = fma(_691, _589, _693);
    float _935 = fma(_921, _549, _927);
    float _937 = fma(_685, _589, _687);
    int _939 = ~_931;
    int _941 = _939 + 1;
    int _943 = _941 + 1;
    float _945 = _923 * 6.283185482025146484375;
    float _947 = sin(_945);
    float _949 = _935 * 0.15915493667125701904296875;
    float _951 = _919;
    int _953 = _943;
    if (_917)
    {
        _951 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _955 = _951;
    float _957 = fma(_527, (*spvDescriptorSet0.vp_c9)._m0[145].y, _933);
    int _959 = as_type<int>(_955);
    if (!_903)
    {
        int _961 = ~_931;
        int _963 = _961 + 1;
        _953 = _963;
    }
    int _965 = _953;
    if (_917)
    {
        out.m_47.x = 0.0;
    }
    if (_917)
    {
        float _967 = _955 * 5.0;
        _959 = as_type<int>(_967);
    }
    int _969 = _959;
    float _971 = _923 * 6.283185482025146484375;
    float _973 = cos(_971);
    float _975 = fma(_527, (*spvDescriptorSet0.vp_c9)._m0[145].x, _937);
    float _977 = _817 * _925;
    float _979 = _957 * _915;
    if (_917)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3142 = as_type<float>(_969);
        out.gl_Position.z = _3142;
    }
    float _981 = float(_965);
    float _983 = _929 * 6.283185482025146484375;
    float _985 = sin(_983);
    float _987 = _929 * 6.283185482025146484375;
    float _989 = cos(_987);
    float _991 = _949 * 6.283185482025146484375;
    float _993 = sin(_991);
    if (_917)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _995 = _949 * 6.283185482025146484375;
    float _997 = cos(_995);
    float _999 = _979 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1001 = _281 * 0.5;
    float _1003 = 0.0 + _981;
    float _1005 = precise::clamp(_1003, 0.0, 1.0);
    float _1007 = _975 * _913;
    float _1009 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _285);
    float _1011 = _977 * _999;
    float _1013 = fma(_1001, _1005, _1001);
    float _1015 = _1007 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1017 = _947 * _985;
    float _1019 = _1009 * _1011;
    float _1021 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1013);
    float _1023 = _977 * _1015;
    float _1025 = _973 * _989;
    float _1027 = _977 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1029 = _1027 * 0.5;
    float _1031 = -_1019;
    float _1033 = _993 * _1031;
    float _1035 = _997 * _1019;
    float _1037 = _1021 * _1023;
    float _1039 = _973 * _985;
    float _1041 = _985 * _997;
    float _1043 = _989 * _997;
    float _1045 = fma(_993, _1025, _1017);
    float _1047 = _973 * _1035;
    float _1049 = _947 * _989;
    float _1051 = _947 * _1035;
    float _1053 = fma(_1043, _1037, _1033);
    float _1055 = fma(_1045, _1037, _1047);
    float _1057 = -_1049;
    float _1059 = fma(_993, _1039, _1057);
    float _1061 = -_1039;
    float _1063 = fma(_993, _1049, _1061);
    float _1065 = fma(_1041, _1029, _1053);
    float _1067 = fma(_1059, _1029, _1055);
    float _1069 = fma(_993, _1017, _1025);
    float _1071 = fma(_1063, _1037, _1051);
    float _1073 = _1067 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1075 = _1067 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1077 = fma(_1069, _1029, _1071);
    float _1079 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1073);
    float _1081 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1075);
    float _1083 = fma(_1077, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1079);
    float _1085 = fma(_1077, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1081);
    float _1087 = _1083 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1089 = _1085 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1091 = _543 + _1087;
    float _1093 = _759 + _1089;
    float _1095 = _1067 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1097 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1099 = _1091 + _1097;
    float _1101 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1103 = _1093 + _1101;
    float _1105 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1095);
    float _1107 = _1099 * _1099;
    float _1109 = _1103 * _1103;
    float _1111 = fma(_1077, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1105);
    float _1113 = _1107 + _1109;
    float _1115 = _1111 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1117 = sqrt(_1113);
    float _1119 = _735 + _1115;
    bool _1121 = _1117 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1123 = _1115;
    float _1125 = _1077;
    float _1127 = _1107;
    float _1129 = _1109;
    float _1131 = _1091;
    float _1133 = _1099;
    float _1135 = _1103;
    if (!_1121)
    {
        _1123 = _1093;
    }
    float _1137 = _1123;
    float _1139 = _1137;
    if (!_1121)
    {
        _1125 = _1119;
    }
    float _1141 = _1125;
    bool _1143 = !_1121;
    float _1145 = _1141;
    if (!_1143)
    {
        float _1147 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1149 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1151 = _1117 + _1149;
        float _1153 = _1119 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1155 = rsqrt(_1113);
        float _1157 = _1151 * _1147;
        float _1159 = _1157 * 0.15915493667125701904296875;
        float _1161 = _1159 * 6.283185482025146484375;
        float _1163 = sin(_1161);
        float _1165 = _1159 * 6.283185482025146484375;
        float _1167 = cos(_1165);
        float _1169 = fma(_1163, _1153, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1171 = _1155 * _1169;
        float _1173 = _1167 + (-1.0);
        float _1175 = fma(_1099, _1171, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1177 = fma(_1103, _1171, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1179 = _1173 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1181 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1183 = _1175 + _1181;
        float _1185 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1187 = _1177 + _1185;
        float _1189 = fma(_1119, _1167, _1179);
        float _1191 = _1183 * _1183;
        float _1193 = _1187 * _1187;
        _1145 = _1189;
        _1127 = _1191;
        _1129 = _1193;
        _1131 = _1175;
        _1139 = _1177;
    }
    float _1195 = _1145;
    float _1197 = _1127;
    float _1199 = _1129;
    float _1201 = _1131;
    float _1203 = _1139;
    float _1205 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1207 = _1195 + _1205;
    float _1209 = fma(_1207, _1207, _1197);
    float _1211 = _1209 + _1199;
    float _1213 = sqrt(_1211);
    bool _1215 = _1213 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1217 = isnan(_1213);
    bool _1219 = _1215 || _1217;
    bool _1221 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1223 = _1219 || _1221;
    float _1225 = _1209;
    if (!_1223)
    {
        _1225 = 1.0;
    }
    float _1227 = _1225;
    bool _1229 = !_1223;
    float _1231 = _1227;
    if (!_1229)
    {
        bool _1233 = _1213 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1235 = isnan(_1213);
        bool _1237 = _1233 || _1235;
        bool _1239 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1241 = _1237 || _1239;
        if (!_1241)
        {
            float _1243 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1245 = _1213 + _1243;
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
            bool _1263 = _1213 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1265 = isnan(_1213);
            bool _1267 = _1263 || _1265;
            bool _1269 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1271 = _1267 || _1269;
            if (!_1271)
            {
                float _1273 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1275 = _1213 + _1273;
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
    float _1293 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1295 = _1195 + _1293;
    float _1297 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1299 = _1201 + _1297;
    float _1301 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1303 = _1203 + _1301;
    float _1305 = fma(_1295, _1291, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1307 = fma(_1299, _1291, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1309 = fma(_1303, _1291, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1311 = -_843;
    float _1313 = fma(_1311, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1305);
    float _1315 = -_845;
    float _1317 = fma(_1315, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1307);
    float _1319 = -_847;
    float _1321 = fma(_1319, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1309);
    float _1323 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1325 = _1313 + _1323;
    float _1327 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1329 = _1317 + _1327;
    float _1331 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1333 = _1321 + _1331;
    float _1335 = _1325 * _1325;
    float _1337 = fma(_1329, _1329, _1335);
    float _1339 = fma(_1333, _1333, _1337);
    float _1341 = rsqrt(_1339);
    float _1343 = _1341 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1345 = _1329 * _1343;
    float _1347 = _1333 * _1343;
    float _1349 = _1345 * _1345;
    float _1351 = _1347 * _1347;
    float _1353 = _1349 + _1351;
    float _1355 = sqrt(_1353);
    bool _1357 = _1355 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1359 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1361 = _1355 + _1359;
    float _1363 = _1333;
    float _1365 = _1335;
    float _1367 = _1361;
    float _1369 = _1325;
    float _1371 = _1345;
    if (_1357)
    {
        float _1373 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1363 = _1373;
    }
    float _1375 = _1363;
    if (_1357)
    {
        float _1377 = rsqrt(_1353);
        _1365 = _1377;
    }
    float _1379 = _1365;
    float _1381 = _1379;
    if (_1357)
    {
        float _1383 = _1361 * _1375;
        _1367 = _1383;
    }
    float _1385 = _1367;
    if (_1357)
    {
        float _1387 = _1385 * 0.15915493667125701904296875;
        _1133 = _1387;
    }
    float _1389 = _1133;
    float _1391 = _1375;
    if (_1357)
    {
        float _1393 = _1389 * 6.283185482025146484375;
        float _1395 = sin(_1393);
        _1391 = _1395;
    }
    float _1397 = _1391;
    float _1399 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1401 = precise::max(0.0, _1399);
    float _1403 = _1341;
    float _1405 = _1401;
    if (_1357)
    {
        float _1407 = _1389 * 6.283185482025146484375;
        float _1409 = cos(_1407);
        _1403 = _1409;
    }
    float _1411 = _1403;
    float _1413 = -_1343;
    float _1415 = -_1401;
    float _1417 = fma(_1325, _1413, _1415);
    if (_1357)
    {
        float _1419 = _1417 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1405 = _1419;
    }
    float _1421 = _1405;
    float _1423 = sqrt(_1339);
    float _1425 = _1397;
    float _1427 = _1421;
    if (_1357)
    {
        float _1429 = fma(_1397, _1421, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1135 = _1429;
    }
    float _1431 = _1135;
    if (!_1357)
    {
        _1425 = _1347;
    }
    float _1433 = _1425;
    float _1435 = _1433;
    if (_1357)
    {
        float _1437 = _1411 + (-1.0);
        _1427 = _1437;
    }
    float _1439 = _1427;
    float _1441 = _1439;
    if (_1357)
    {
        float _1443 = _1379 * _1431;
        _853 = _1443;
    }
    float _1445 = _853;
    if (!_1357)
    {
        _1381 = _1417;
    }
    float _1447 = _1381;
    float _1449 = _1313 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1451 = _1447;
    if (_1357)
    {
        float _1453 = _1439 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1369 = _1453;
    }
    float _1455 = _1369;
    float _1457 = _1455;
    if (_1357)
    {
        float _1459 = _1345 * _1445;
        _1371 = _1459;
    }
    float _1461 = _1371;
    if (!_1357)
    {
        _1441 = _1349;
    }
    float _1463 = _1441;
    float _1465 = _1463;
    if (_1357)
    {
        float _1467 = _1347 * _1445;
        _1435 = _1467;
    }
    float _1469 = _1435;
    if (_1357)
    {
        float _1471 = fma(_1417, _1411, _1455);
        _1451 = _1471;
    }
    float _1473 = _1451;
    if (_1357)
    {
        float _1475 = _1461 * _1461;
        _1465 = _1475;
    }
    float _1477 = _1465;
    if (!_1357)
    {
        _1457 = _1351;
    }
    float _1479 = _1457;
    float _1481 = _1479;
    if (_1357)
    {
        float _1483 = _1469 * _1469;
        _1481 = _1483;
    }
    float _1485 = _1481;
    float _1487 = fma(_1473, _1473, _1477);
    float _1489 = _1487 + _1485;
    float _1491 = _1313 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1493 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1495 = fma(_1423, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1493);
    float _1497 = precise::clamp(_1495, 0.0, 1.0);
    float _1499 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1501 = rsqrt(_1489);
    float _1503 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1491);
    float _1505 = _1313 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1507 = -_1497;
    float _1509 = _1507 + 1.0;
    float _1511 = _1313 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1513 = fma(_1321, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1503);
    float _1515 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1505);
    float _1517 = abs(_1509);
    float _1519 = log2(_1517);
    float _1521 = _1513 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1523 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1511);
    float _1525 = fma(_1321, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1515);
    float _1527 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1449);
    float _1529 = _1521 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1531 = fma(_1321, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1523);
    float _1533 = _1525 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1535 = _1501 * _1461;
    float _1537 = -_1529;
    float _1539 = fma(_1537, _1499, 1.0);
    float _1541 = _1531 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1543 = _1533 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1545 = fma(_1321, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1527);
    float _1547 = _1501 * _1473;
    float _1549 = _1535 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1551 = fma(_1541, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1543);
    float _1553 = _1519 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1555 = _1501 * _1469;
    float _1557 = -_1549;
    float _1559 = fma(_1547, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1557);
    float _1561 = _1545 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1563 = fma(_1521, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1551);
    float _1565 = log2(_1539);
    float _1567 = -_1555;
    float _1569 = fma(_1567, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1559);
    float _1571 = _1533 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1573 = fma(_1561, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1563);
    float _1575 = _1533 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1577 = fma(_1569, -0.5, 0.5);
    float _1579 = fma(_1541, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1571);
    float _1581 = fma(_1569, 0.5, 0.5);
    float _1583 = exp2(_1553);
    float _1585 = fma(_1541, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1575);
    float _1587 = _1547 + 1.0;
    float _1589 = fma(_1521, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1579);
    float _1591 = fma(_1581, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1593 = fma(_1521, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1585);
    float _1595 = 1.0 / _1573;
    float _1597 = fma(_1581, _1591, -0.212114393711090087890625);
    float _1599 = fma(_1581, _1597, 1.570728778839111328125);
    float _1601 = sqrt(_1577);
    float _1603 = -_1547;
    float _1605 = fma(_1583, _1587, _1603);
    float _1607 = fma(_1561, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1589);
    float _1609 = fma(_1561, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1593);
    float _1611 = _1565 * 0.693147182464599609375;
    float _1613 = fma(_1605, 0.5, 0.5);
    float _1615 = _1607 * _1595;
    float _1617 = _1609 * _1595;
    float _1619 = _1611 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1621 = fma(_1615, 0.5, 0.5);
    float _1623 = fma(_1617, -0.5, 0.5);
    float _1625 = _1601 * 0.636619746685028076171875;
    float3 _4205 = float3(_1621, _1623, _1619);
    float _1627 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4205, float3(0.0), isnan(_4205)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4205, float3(0.0), isnan(_4205)), level(0.0)).x;
    float3 _4216 = float3(_1621, _1623, _1619);
    float4 _1630 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4216, float3(0.0), isnan(_4216)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4216, float3(0.0), isnan(_4216)), level(0.0)).xyzw;
    float _1632 = _1630.x;
    float _1634 = _1630.y;
    float _1636 = _1630.z;
    float _1638 = _1630.w;
    float _1640 = -_1599;
    float _1642 = fma(_1625, _1640, 1.0);
    float2 _4238 = float2(_1642, _1613);
    float3 _1646 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4238, float2(0.0), isnan(_4238)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4238, float2(0.0), isnan(_4238)), level(0.0)).xyz;
    float _1648 = _1646.x;
    float _1650 = _1646.y;
    float _1652 = _1646.z;
    float _1654 = _1519 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1656 = _1533 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1658 = fma(_1541, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1656);
    float _1660 = exp2(_1654);
    float _1662 = fma(_1521, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1658);
    float _1664 = fma(_1561, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1662);
    float _1666 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1668 = _1664 + _1573;
    out.gl_Position.x = _1607;
    out.gl_Position.y = _1609;
    out.gl_Position.z = _1664;
    out.gl_Position.w = _1573;
    float _1670 = _1668 * 0.5;
    float _1672 = -_1660;
    float _1674 = _1672 + 1.0;
    out.m_47.x = _1666;
    float _1676 = _1674 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_70.z = _1670;
    out.m_70.w = _1573;
    float _1678 = _1676 * _1627;
    float _1680 = -_1676;
    float _1682 = _1680 + 1.0;
    float _1684 = _1638 * _1678;
    float _1686 = _1652 * _1678;
    float _1688 = fma(_1648, _1684, _1632);
    float _1690 = fma(_1650, _1684, _1634);
    float _1692 = _1638 * _1682;
    float _1694 = fma(_1638, _1686, _1636);
    out.m_72.x = _1688;
    out.m_72.y = _1690;
    out.m_72.z = _1694;
    out.m_72.w = _1692;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

