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
    constant _16* vp_c7 [[id(4)]];
    texture3d<float> vp_t_tcb_32 [[id(5)]];
    sampler vp_t_tcb_32Smplr [[id(6)]];
    texture3d<float> vp_t_tcb_30 [[id(7)]];
    sampler vp_t_tcb_30Smplr [[id(8)]];
    texture2d<float> vp_t_tcb_1C [[id(9)]];
    sampler vp_t_tcb_1CSmplr [[id(10)]];
    sampler vp_t_tcb_32Smplr_w [[id(11)]];
    sampler vp_t_tcb_30Smplr_w [[id(12)]];
    sampler vp_t_tcb_1CSmplr_w [[id(13)]];
    constant dm_border_t* dm_border [[id(14)]];
};

struct main0_out
{
    float4 m_68 [[user(locn0)]];
    float4 m_66 [[user(locn1)]];
    float4 m_70 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_64 [[user(locn4)]];
    float4 m_72 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_54 [[attribute(1)]];
    float4 m_56 [[attribute(2)]];
    float4 m_58 [[attribute(3)]];
    float4 m_52 [[attribute(5)]];
    float4 m_42 [[attribute(6)]];
    float4 m_47 [[attribute(7)]];
    float4 m_60 [[attribute(8)]];
    float4 m_62 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _505 = false;
    bool _329 = false;
    bool _227 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _86 = in.m_42.w;
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
        out.m_45.x = 0.0;
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
        float _1563 = as_type<float>(_107);
        out.gl_Position.z = _1563;
    }
    if (!_95)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _111 = in.m_47.w;
    bool _113 = _111 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _115 = isnan(_111);
    bool _117 = _113 || _115;
    bool _119 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _121 = _117 || _119;
    float _123 = -_111;
    float _125 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_121)
    {
        float _127 = float(_91);
        _101 = _127;
    }
    float _129 = _101;
    bool _131 = _125 >= _129;
    bool _133 = !_121;
    bool _135 = _131 || _133;
    float _137 = _129;
    if (_135)
    {
        _137 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _137;
    if (_135)
    {
        out.m_45.x = 0.0;
    }
    if (_135)
    {
        float _141 = _139 * 5.0;
        _109 = as_type<int>(_141);
    }
    int _143 = _109;
    if (_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1632 = as_type<float>(_143);
        out.gl_Position.z = _1632;
    }
    if (_135)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _145 = as_type<float>(int(gl_VertexIndex));
    float _147 = in.m_52.x;
    float _149 = in.m_52.y;
    float _151 = in.m_52.z;
    float _153 = in.m_54.x;
    float _155 = in.m_54.y;
    float _157 = in.m_54.z;
    float _159 = in.m_56.x;
    float _161 = in.m_56.y;
    float _163 = in.m_56.z;
    float _165 = in.m_58.x;
    float _167 = in.m_58.y;
    float _169 = in.m_58.z;
    int _171 = as_type<int>(_145) & 1;
    bool _173 = _171 != 0;
    int _175 = as_type<int>(_145) & 2;
    bool _177 = _175 != 0;
    bool _179 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _181 = _149 * _155;
    float _183 = _149 * _161;
    float _185 = fma(_147, _153, _181);
    float _187 = _149 * _167;
    float _189 = fma(_147, _159, _183);
    bool _191 = !_177;
    float _193 = _191 ? (-0.5) : 0.5;
    float _195 = fma(_147, _165, _187);
    float _197 = fma(_151, _157, _185);
    float _199 = fma(_151, _163, _189);
    float _201 = fma(_151, _169, _195);
    bool _203 = !_173;
    float _205 = _203 ? (-0.5) : 0.5;
    bool _207 = !_179;
    float _225;
    if (!_207)
    {
        float _209 = in.m_60.x;
        float _211 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _213 = _209 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _215 = fma(_213, (*spvDescriptorSet0.vp_c9)._m0[12].x, _125);
        float _217 = _215 * _211;
        float _219 = floor(_217);
        float _221 = -_219;
        float _223 = _217 + _221;
        _225 = _223;
        _227 = true;
    }
    else
    {
        float _229 = float(_91);
        float _231 = 1.0 / _229;
        float _233 = _125 * _231;
        _225 = _233;
    }
    _227 = false;
    float _235 = _225;
    float _237 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _239 = _235 + _237;
    bool _241 = _235 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _243 = isnan(_235);
    bool _245 = _241 || _243;
    bool _247 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _249 = _245 || _247;
    float _251 = float(_249);
    float _253 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _255 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _253;
    float _257 = -_251;
    float _259 = _257 + 1.0;
    bool _261 = _235 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _263 = isnan(_235);
    bool _265 = _261 || _263;
    bool _267 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _269 = _265 || _267;
    float _271 = float(_269);
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _275 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _273;
    bool _277 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _279 = 1.0 / _255;
    float _281 = _271 * _259;
    float _283 = -_271;
    float _285 = _283 + 1.0;
    float _287 = _239 * _279;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _291 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _289;
    float _293 = fma(_275, _287, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _295 = fma(_291, _287, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _297 = _293 * _281;
    float _299 = _295 * _281;
    float _301 = fma(_285, (*spvDescriptorSet0.vp_c9)._m0[143].x, _297);
    float _303 = fma(_285, (*spvDescriptorSet0.vp_c9)._m0[143].y, _299);
    float _305 = fma(_251, (*spvDescriptorSet0.vp_c9)._m0[144].x, _301);
    float _307 = fma(_251, (*spvDescriptorSet0.vp_c9)._m0[144].y, _303);
    bool _309 = !_277;
    float _327;
    if (!_309)
    {
        float _311 = in.m_60.x;
        float _313 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _315 = _311 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _317 = fma(_315, (*spvDescriptorSet0.vp_c9)._m0[11].x, _125);
        float _319 = _317 * _313;
        float _321 = floor(_319);
        float _323 = -_321;
        float _325 = _319 + _323;
        _327 = _325;
        _329 = true;
    }
    else
    {
        float _331 = float(_91);
        float _333 = 1.0 / _331;
        float _335 = _125 * _333;
        _327 = _335;
    }
    _329 = false;
    float _337 = _327;
    float _339 = in.m_62.x;
    float _341 = in.m_62.y;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _345 = _337 + _343;
    bool _347 = _337 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _349 = isnan(_337);
    bool _351 = _347 || _349;
    bool _353 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _355 = _351 || _353;
    float _357 = float(_355);
    bool _359 = _337 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _361 = isnan(_337);
    bool _363 = _359 || _361;
    bool _365 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _367 = _363 || _365;
    float _369 = float(_367);
    float _371 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _373 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _371;
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _377 = _375 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _379 = -_357;
    float _381 = _379 + 1.0;
    float _383 = 1.0 / _377;
    bool _385 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _387 = 1.0 / _373;
    float _389 = _307 * _341;
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _393 = _337 + _391;
    bool _395 = _337 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _397 = isnan(_337);
    bool _399 = _395 || _397;
    bool _401 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _403 = _399 || _401;
    float _405 = float(_403);
    float _407 = _305 * _339;
    float _409 = _393 * _383;
    float _411 = _405 * _381;
    float _413 = -_405;
    float _415 = _413 + 1.0;
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _419 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _417;
    float _421 = _345 * _387;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _425 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _423;
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _429 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _427;
    float _431 = _369 * _415;
    float _433 = fma(_419, _421, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _435 = fma(_425, _421, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _437 = fma(_429, _421, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _439 = -_369;
    float _441 = _439 + 1.0;
    float _443 = _433 * _431;
    float _445 = _435 * _431;
    float _447 = _437 * _431;
    float _449 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _451 = _449 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _455 = _453 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _459 = _457 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _461 = fma(_441, (*spvDescriptorSet0.vp_c9)._m0[107].x, _443);
    float _463 = fma(_451, _409, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _465 = fma(_441, (*spvDescriptorSet0.vp_c9)._m0[107].y, _445);
    float _467 = fma(_455, _409, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _469 = fma(_459, _409, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _471 = fma(_441, (*spvDescriptorSet0.vp_c9)._m0[107].z, _447);
    float _473 = fma(_463, _411, _461);
    float _475 = fma(_467, _411, _465);
    float _477 = fma(_469, _411, _471);
    float _479 = fma(_357, (*spvDescriptorSet0.vp_c9)._m0[109].x, _473);
    float _481 = fma(_357, (*spvDescriptorSet0.vp_c9)._m0[109].y, _475);
    float _483 = fma(_357, (*spvDescriptorSet0.vp_c9)._m0[109].z, _477);
    bool _485 = !_385;
    float _503;
    if (!_485)
    {
        float _487 = in.m_60.x;
        float _489 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _491 = _487 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _493 = fma(_491, (*spvDescriptorSet0.vp_c9)._m0[11].y, _125);
        float _495 = _493 * _489;
        float _497 = floor(_495);
        float _499 = -_497;
        float _501 = _495 + _499;
        _503 = _501;
        _505 = true;
    }
    else
    {
        float _507 = float(_91);
        float _509 = 1.0 / _507;
        float _511 = _125 * _509;
        _503 = _511;
    }
    _505 = false;
    float _513 = _503;
    float _515 = in.m_42.x;
    float _517 = in.m_42.y;
    float _519 = in.m_42.z;
    float _521 = in.m_60.x;
    float _523 = in.m_60.y;
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _527 = _525 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _529 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _531 = _529 != 0;
    float _533 = in.m_56.w;
    int _535 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _537 = _535 != 0;
    float _539 = 1.0 / _527;
    float _541 = in.m_58.w;
    float _543 = in.m_54.w;
    float _545 = _155 * _517;
    float _547 = _161 * _517;
    float _549 = _167 * _517;
    float _551 = fma(_153, _515, _545);
    float _553 = fma(_159, _515, _547);
    float _555 = fma(_165, _515, _549);
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _559 = _513 + _557;
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _563 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _561;
    float _565 = fma(_163, _519, _553);
    bool _567 = _521 > 0.5;
    float _569 = fma(_157, _519, _551);
    float _571 = _563 * _539;
    bool _573 = _513 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _575 = isnan(_513);
    bool _577 = _573 || _575;
    bool _579 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _581 = _577 || _579;
    float _583 = float(_581);
    float _585 = fma(_169, _519, _555);
    float _587 = _565 + _533;
    float _589 = fma(_571, _559, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _591 = -_205;
    int _593 = _567 ? as_type<int>(_591) : as_type<int>(_205);
    float _595 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _597 = _513 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _599 = isnan(_513);
    bool _601 = _597 || _599;
    bool _603 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _605 = _601 || _603;
    float _607 = float(_605);
    float _609 = -_583;
    float _611 = _609 + 1.0;
    float _613 = _585 + _541;
    float _615 = _569 + _543;
    float _617 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _619 = _587 + _617;
    bool _621 = !_531;
    float _623 = _621 ? _205 : as_type<float>(_593);
    float _625 = _607 * _611;
    float _627 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _629 = _615 + _627;
    float _631 = _619 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _633 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _635 = _613 + _633;
    float _637 = _623 + 0.5;
    float _639 = _589 * _625;
    float _641 = fma(_629, (*spvDescriptorSet0.vp_c8)._m0[28].x, _631);
    bool _643 = _523 > 0.5;
    float _645 = _637 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _647 = -_607;
    float _649 = _647 + 1.0;
    float _651 = fma(_635, (*spvDescriptorSet0.vp_c8)._m0[28].z, _641);
    float _653 = -_193;
    int _655 = _643 ? as_type<int>(_653) : as_type<int>(_193);
    float _657 = _645 * _595;
    float _659 = _619 * _619;
    float _661 = fma(_649, (*spvDescriptorSet0.vp_c9)._m0[115].x, _639);
    bool _663 = _651 >= 0.0;
    float _665 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _667 = fma(_629, _629, _659);
    bool _669 = !_537;
    float _671 = _669 ? _193 : as_type<float>(_655);
    float _673 = fma(_583, (*spvDescriptorSet0.vp_c9)._m0[116].x, _661);
    float _675 = _481 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _677 = fma(_635, _635, _667);
    float _679 = _479 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _681 = -_671;
    float _683 = _681 + 0.5;
    float _685 = rsqrt(_677);
    float _687 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _689 = _683 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _693 = (*spvDescriptorSet0.vp_c9)._m0[123].y;
    if (_663)
    {
        _693 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _695 = _693;
    float _697 = _483 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _699 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _701 = _689 * _665;
    float _703 = _679 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _705 = _675 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _707 = _691 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _709 = _687 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _711 = _699 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _713 = _697 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _715 = _673 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _717 = as_type<int>(_695);
    if (_663)
    {
        float _719 = _695 * 5.0;
        _717 = as_type<int>(_719);
    }
    int _721 = _717;
    out.m_64.x = _657;
    out.m_64.y = _701;
    float _723 = _619 * _685;
    float _725 = _629 * _685;
    out.m_66.x = _707;
    out.m_66.y = _709;
    out.m_66.z = _711;
    out.m_68.x = _703;
    out.m_68.y = _705;
    out.m_68.z = _713;
    out.m_68.w = _715;
    if (_663)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2584 = as_type<float>(_721);
        out.gl_Position.z = _2584;
    }
    if (_663)
    {
        out.m_45.x = 0.0;
    }
    if (_663)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _727 = -_723;
    float _729 = fma(_727, (*spvDescriptorSet0.vp_c9)._m0[18].w, _587);
    float _731 = _635 * _685;
    float _733 = -_725;
    float _735 = fma(_733, (*spvDescriptorSet0.vp_c9)._m0[18].w, _615);
    float _737 = -_723;
    float _739 = fma(_737, (*spvDescriptorSet0.vp_c9)._m0[18].w, _619);
    float _741 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _743 = _729 + _741;
    float _745 = -_731;
    float _747 = fma(_745, (*spvDescriptorSet0.vp_c9)._m0[18].w, _613);
    float _749 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _751 = _735 + _749;
    float _753 = -_725;
    float _755 = fma(_753, (*spvDescriptorSet0.vp_c9)._m0[18].w, _629);
    float _757 = _743 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _759 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _761 = _747 + _759;
    float _763 = -_731;
    float _765 = fma(_763, (*spvDescriptorSet0.vp_c9)._m0[18].w, _635);
    float _767 = fma(_751, (*spvDescriptorSet0.vp_c8)._m0[28].x, _757);
    float _769 = _739 * _739;
    float _771 = fma(_761, (*spvDescriptorSet0.vp_c8)._m0[28].z, _767);
    float _773 = fma(_755, _755, _769);
    bool _775 = _771 >= 0.0;
    float _777 = fma(_765, _765, _773);
    float _779 = sqrt(_777);
    float _781 = _771;
    float _783 = _747;
    if (_775)
    {
        _781 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _785 = _781;
    int _787 = as_type<int>(_785);
    if (_775)
    {
        out.m_45.x = 0.0;
    }
    if (_775)
    {
        float _789 = _785 * 5.0;
        _787 = as_type<int>(_789);
    }
    int _791 = _787;
    if (_775)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2714 = as_type<float>(_791);
        out.gl_Position.z = _2714;
    }
    float _793 = _685 * _779;
    if (_775)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _795 = _389 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _797 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _193);
    float _799 = _407 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _801 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _205);
    float _803 = _793 * _795;
    float _805 = _793 * _799;
    float _807 = _793 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _809 = _807 * 0.5;
    float _811 = _797 * _803;
    float _813 = _801 * _805;
    float _815 = _811 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _817 = _811 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _819 = fma(_813, (*spvDescriptorSet0.vp_c8)._m0[26].x, _815);
    float _821 = fma(_813, (*spvDescriptorSet0.vp_c8)._m0[24].x, _817);
    float _823 = fma(_809, (*spvDescriptorSet0.vp_c8)._m0[26].z, _819);
    float _825 = fma(_809, (*spvDescriptorSet0.vp_c8)._m0[24].z, _821);
    float _827 = _823 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _829 = _825 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _831 = _613 + _827;
    float _833 = _615 + _829;
    float _835 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _837 = _831 + _835;
    float _839 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _841 = _833 + _839;
    float _843 = _837 * _837;
    float _845 = fma(_841, _841, _843);
    float _847 = _811 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _849 = sqrt(_845);
    float _851 = fma(_813, (*spvDescriptorSet0.vp_c8)._m0[25].x, _847);
    float _853 = fma(_809, (*spvDescriptorSet0.vp_c8)._m0[25].z, _851);
    float _855 = _853 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _857 = _587 + _855;
    bool _859 = _849 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _861 = _853;
    float _863 = _823;
    float _865 = _833;
    float _867 = _849;
    if (!_859)
    {
        _861 = _831;
    }
    float _869 = _861;
    float _871 = _869;
    if (!_859)
    {
        _863 = _857;
    }
    float _873 = _863;
    bool _875 = !_859;
    float _877 = _873;
    if (!_875)
    {
        float _879 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _881 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _883 = _849 + _881;
        float _885 = rsqrt(_845);
        float _887 = _883 * _879;
        float _889 = _857 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _891 = _887 * 0.15915493667125701904296875;
        float _893 = _891 * 6.283185482025146484375;
        float _895 = sin(_893);
        float _897 = _891 * 6.283185482025146484375;
        float _899 = cos(_897);
        float _901 = fma(_895, _889, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _903 = _885 * _901;
        float _905 = _899 + (-1.0);
        float _907 = _905 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _909 = fma(_841, _903, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _911 = fma(_837, _903, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _913 = fma(_857, _899, _907);
        _877 = _913;
        _865 = _909;
        _871 = _911;
        _867 = _891;
    }
    float _915 = _877;
    float _917 = _865;
    float _919 = _871;
    float _921 = _867;
    float _923 = -_587;
    float _925 = _923 + _915;
    float _927 = -_615;
    float _929 = _927 + _917;
    float _931 = -_613;
    float _933 = _931 + _919;
    float _935 = _925 * _925;
    float _937 = fma(_929, _929, _935);
    float _939 = fma(_933, _933, _937);
    float _941 = sqrt(_939);
    bool _943 = _941 > 0.0;
    bool _945 = !_943;
    float _947 = _915;
    float _949 = _917;
    float _951 = _919;
    float _953 = _921;
    float _955 = _939;
    if (!_945)
    {
        float _957 = _199 * _199;
        float _959 = fma(_197, _197, _957);
        float _961 = rsqrt(_939);
        float _963 = fma(_201, _201, _959);
        float _965 = sqrt(_963);
        float _967 = _929 * _961;
        float _969 = _925 * _961;
        float _971 = _933 * _961;
        bool _973 = _965 > 0.0;
        bool _975 = !_973;
        _953 = _963;
        if (!_975)
        {
            float _977 = rsqrt(_963);
            float _979 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _981 = _199 * _977;
            float _983 = _197 * _977;
            float _985 = _969 * _981;
            float _987 = _201 * _977;
            float _989 = fma(_967, _983, _985);
            float _991 = _979 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _993 = fma(_971, _987, _989);
            float _995 = _993 * _991;
            float _997 = fma(_197, _995, _917);
            float _999 = fma(_199, _995, _915);
            float _1001 = fma(_201, _995, _919);
            _947 = _999;
            _949 = _997;
            _951 = _1001;
            _953 = _977;
            _955 = _995;
        }
    }
    float _1003 = _947;
    float _1005 = _949;
    float _1007 = _951;
    float _1009 = _953;
    float _1011 = _955;
    float _1013 = -_723;
    float _1015 = fma(_1013, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1003);
    float _1017 = -_725;
    float _1019 = fma(_1017, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1005);
    float _1021 = -_731;
    float _1023 = fma(_1021, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1007);
    float _1025 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1027 = _1015 + _1025;
    float _1029 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1031 = _1019 + _1029;
    float _1033 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1035 = _1023 + _1033;
    float _1037 = _1027 * _1027;
    float _1039 = fma(_1031, _1031, _1037);
    float _1041 = fma(_1035, _1035, _1039);
    float _1043 = rsqrt(_1041);
    float _1045 = _1043 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1047 = _1031 * _1045;
    float _1049 = _1035 * _1045;
    float _1051 = _1047 * _1047;
    float _1053 = _1049 * _1049;
    float _1055 = _1051 + _1053;
    float _1057 = sqrt(_1055);
    bool _1059 = _1057 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1061 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1063 = _1057 + _1061;
    float _1065 = _1043;
    float _1067 = _1011;
    float _1069 = _1063;
    float _1071 = _1009;
    float _1073 = _1027;
    float _1075 = _1045;
    float _1077 = _1047;
    if (_1059)
    {
        float _1079 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1065 = _1079;
    }
    float _1081 = _1065;
    if (_1059)
    {
        float _1083 = rsqrt(_1055);
        _1067 = _1083;
    }
    float _1085 = _1067;
    float _1087 = _1085;
    if (_1059)
    {
        float _1089 = _1063 * _1081;
        _1069 = _1089;
    }
    float _1091 = _1069;
    if (_1059)
    {
        float _1093 = _1091 * 0.15915493667125701904296875;
        _1071 = _1093;
    }
    float _1095 = _1071;
    float _1097 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1099 = _1081;
    if (_1059)
    {
        float _1101 = _1095 * 6.283185482025146484375;
        float _1103 = sin(_1101);
        _1099 = _1103;
    }
    float _1105 = _1099;
    float _1107 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1109 = precise::max(0.0, _1107);
    float _1111 = _1035;
    float _1113 = _1109;
    if (_1059)
    {
        float _1115 = _1095 * 6.283185482025146484375;
        float _1117 = cos(_1115);
        _1111 = _1117;
    }
    float _1119 = _1111;
    float _1121 = -_1045;
    float _1123 = -_1109;
    float _1125 = fma(_1027, _1121, _1123);
    if (!_1059)
    {
        _1073 = _1051;
    }
    float _1127 = _1073;
    float _1129 = _1127;
    if (_1059)
    {
        float _1131 = _1125 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1113 = _1131;
    }
    float _1133 = _1113;
    float _1135 = sqrt(_1041);
    float _1137 = _1105;
    float _1139 = _1133;
    if (_1059)
    {
        float _1141 = fma(_1105, _1133, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1137 = _1141;
    }
    float _1143 = _1137;
    float _1145 = _1143;
    float _1147 = _1119;
    if (_1059)
    {
        float _1149 = _1119 + (-1.0);
        _1139 = _1149;
    }
    float _1151 = _1139;
    float _1153 = _1151;
    if (_1059)
    {
        float _1155 = _1085 * _1143;
        _1075 = _1155;
    }
    float _1157 = _1075;
    if (!_1059)
    {
        _1087 = _1125;
    }
    float _1159 = _1087;
    float _1161 = _1159;
    if (_1059)
    {
        float _1163 = _1151 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1145 = _1163;
    }
    float _1165 = _1145;
    if (_1059)
    {
        float _1167 = _1047 * _1157;
        _1077 = _1167;
    }
    float _1169 = _1077;
    if (!_1059)
    {
        _1153 = _1049;
    }
    float _1171 = _1153;
    float _1173 = _1171;
    if (_1059)
    {
        float _1175 = _1049 * _1157;
        _1173 = _1175;
    }
    float _1177 = _1173;
    if (_1059)
    {
        float _1179 = fma(_1125, _1119, _1165);
        _1161 = _1179;
    }
    float _1181 = _1161;
    if (_1059)
    {
        float _1183 = _1169 * _1169;
        _1129 = _1183;
    }
    float _1185 = _1129;
    if (!_1059)
    {
        _1147 = _1053;
    }
    float _1187 = _1147;
    float _1189 = _1187;
    if (_1059)
    {
        float _1191 = _1177 * _1177;
        _1189 = _1191;
    }
    float _1193 = _1189;
    float _1195 = fma(_1181, _1181, _1185);
    float _1197 = _1015 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1199 = _1195 + _1193;
    float _1201 = _1015 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1203 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1205 = fma(_1135, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1203);
    float _1207 = precise::clamp(_1205, 0.0, 1.0);
    float _1209 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1197);
    float _1211 = rsqrt(_1199);
    float _1213 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1201);
    float _1215 = _1015 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1217 = -_1207;
    float _1219 = _1217 + 1.0;
    float _1221 = _1015 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1223 = fma(_1023, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1213);
    float _1225 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1215);
    float _1227 = fma(_1023, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1209);
    float _1229 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1221);
    float _1231 = _1223 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1233 = fma(_1023, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1225);
    float _1235 = abs(_1219);
    float _1237 = log2(_1235);
    float _1239 = fma(_1023, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1229);
    float _1241 = _1227 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1243 = _1233 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1245 = _1231 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1247 = _1211 * _1169;
    float _1249 = _1211 * _1181;
    float _1251 = _1243 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1253 = _1211 * _1177;
    float _1255 = _1247 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1257 = _1239 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1259 = fma(_1241, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1251);
    float _1261 = -_1245;
    float _1263 = fma(_1261, _1097, 1.0);
    float _1265 = -_1255;
    float _1267 = fma(_1249, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1265);
    float _1269 = _1243 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1271 = fma(_1231, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1259);
    float _1273 = _1237 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1275 = -_1253;
    float _1277 = fma(_1275, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1267);
    float _1279 = log2(_1263);
    float _1281 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1271);
    float _1283 = _1243 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1285 = fma(_1277, -0.5, 0.5);
    float _1287 = fma(_1277, 0.5, 0.5);
    float _1289 = fma(_1241, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1283);
    float _1291 = fma(_1241, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1269);
    float _1293 = exp2(_1273);
    float _1295 = _1249 + 1.0;
    float _1297 = fma(_1287, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1299 = fma(_1231, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1289);
    float _1301 = fma(_1231, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1291);
    float _1303 = 1.0 / _1281;
    float _1305 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1301);
    float _1307 = sqrt(_1285);
    float _1309 = -_1249;
    float _1311 = fma(_1293, _1295, _1309);
    float _1313 = fma(_1287, _1297, -0.212114393711090087890625);
    float _1315 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1299);
    float _1317 = _1279 * 0.693147182464599609375;
    float _1319 = fma(_1311, 0.5, 0.5);
    float _1321 = fma(_1287, _1313, 1.570728778839111328125);
    float _1323 = _1315 * _1303;
    float _1325 = _1305 * _1303;
    float _1327 = _1317 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1329 = fma(_1323, 0.5, 0.5);
    float _1331 = fma(_1325, -0.5, 0.5);
    float _1333 = _1307 * 0.636619746685028076171875;
    float3 _3605 = float3(_1329, _1331, _1327);
    float _1335 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3605, float3(0.0), isnan(_3605)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3605, float3(0.0), isnan(_3605)), level(0.0)).x;
    float3 _3616 = float3(_1329, _1331, _1327);
    float4 _1338 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3616, float3(0.0), isnan(_3616)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3616, float3(0.0), isnan(_3616)), level(0.0)).xyzw;
    float _1340 = _1338.x;
    float _1342 = _1338.y;
    float _1344 = _1338.z;
    float _1346 = _1338.w;
    float _1348 = -_1321;
    float _1350 = fma(_1333, _1348, 1.0);
    float2 _3638 = float2(_1350, _1319);
    float3 _1354 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3638, float2(0.0), isnan(_3638)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3638, float2(0.0), isnan(_3638)), level(0.0)).xyz;
    float _1356 = _1354.x;
    float _1358 = _1354.y;
    float _1360 = _1354.z;
    float _1362 = _729 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1364 = _729 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1366 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1368 = isnan(0.5);
    bool _1370 = _1366 || _1368;
    bool _1372 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1374 = _1370 || _1372;
    float _1376 = _1237 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1378 = fma(_735, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1362);
    float _1380 = fma(_735, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1364);
    float _1382 = _1243 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1384 = fma(_747, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1378);
    float _1386 = fma(_747, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1380);
    float _1388 = exp2(_1376);
    float _1390 = _1384 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1392 = _1386 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1394 = _1331;
    float _1396 = _1384;
    float _1398 = _1382;
    if (!_1374)
    {
        _783 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1400 = _783;
    float _1402 = _1392 + _1390;
    float _1404 = 1.0 / _1390;
    float _1406 = _1400;
    if (!_1374)
    {
        _1394 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1408 = _1394;
    if (!_1374)
    {
        float _1410 = -_1408;
        float _1412 = _1410 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1396 = _1412;
    }
    float _1414 = _1396;
    float _1416 = _1414;
    if (!_1374)
    {
        float _1418 = 1.0 / _1414;
        _1416 = _1418;
    }
    float _1420 = _1416;
    float _1422 = _1402 * _1404;
    float _1424 = _1422 * 0.5;
    float _1426 = _1404;
    if (!_1374)
    {
        float _1428 = -_1400;
        float _1430 = fma(_1424, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1428);
        _1426 = _1430;
    }
    float _1432 = _1426;
    float _1434 = fma(_1241, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1382);
    if (_1374)
    {
        _1398 = 1.0;
    }
    float _1436 = _1398;
    float _1438 = fma(_1231, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1434);
    float _1440 = _1432;
    float _1442 = _1436;
    if (!_1374)
    {
        float _1444 = 1.0 / _1432;
        _1440 = _1444;
    }
    float _1446 = _1440;
    float _1448 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1438);
    float _1450 = _1448 + _1281;
    out.gl_Position.x = _1315;
    out.gl_Position.y = _1305;
    out.gl_Position.z = _1448;
    out.gl_Position.w = _1281;
    if (!_1374)
    {
        float _1452 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1454 = -_1408;
        float _1456 = fma(_1446, _1452, _1454);
        _1406 = _1456;
    }
    float _1458 = _1406;
    float _1460 = _1450 * 0.5;
    if (!_1374)
    {
        float _1462 = _1458 * _1420;
        float _1464 = precise::clamp(_1462, 0.0, 1.0);
        _1442 = _1464;
    }
    float _1466 = _1442;
    float _1468 = -_1388;
    float _1470 = _1468 + 1.0;
    out.m_70.z = _1460;
    out.m_70.w = _1281;
    float _1472 = _1466 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1474 = _1470 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _1476 = _1466 > 0.0;
    bool _1478 = isnan(_1466);
    bool _1480 = _1476 || _1478;
    bool _1482 = isnan(0.0);
    bool _1484 = _1480 || _1482;
    float _1486 = _1472 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_45.x = _1486;
    float _1488 = _1474 * _1335;
    float _1490 = -_1474;
    float _1492 = _1490 + 1.0;
    float _1494 = _1346 * _1488;
    float _1496 = _1346 * _1492;
    float _1498 = _1360 * _1488;
    float _1500 = fma(_1356, _1494, _1340);
    float _1502 = fma(_1358, _1494, _1342);
    float _1504 = fma(_1346, _1498, _1344);
    out.m_72.x = _1500;
    out.m_72.y = _1502;
    out.m_72.z = _1504;
    out.m_72.w = _1496;
    if (_1484)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _1506 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1506;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _505 = false;
    bool _329 = false;
    bool _227 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _86 = in.m_42.w;
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
        out.m_45.x = 0.0;
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
        float _1563 = as_type<float>(_107);
        out.gl_Position.z = _1563;
    }
    if (!_95)
    {
        return out;
    }
    float _111 = in.m_47.w;
    bool _113 = _111 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _115 = isnan(_111);
    bool _117 = _113 || _115;
    bool _119 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _121 = _117 || _119;
    float _123 = -_111;
    float _125 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_121)
    {
        float _127 = float(_91);
        _101 = _127;
    }
    float _129 = _101;
    bool _131 = _125 >= _129;
    bool _133 = !_121;
    bool _135 = _131 || _133;
    float _137 = _129;
    if (_135)
    {
        _137 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _137;
    if (_135)
    {
        out.m_45.x = 0.0;
    }
    if (_135)
    {
        float _141 = _139 * 5.0;
        _109 = as_type<int>(_141);
    }
    int _143 = _109;
    if (_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1632 = as_type<float>(_143);
        out.gl_Position.z = _1632;
    }
    if (_135)
    {
        return out;
    }
    float _145 = as_type<float>(int(gl_VertexIndex));
    float _147 = in.m_52.x;
    float _149 = in.m_52.y;
    float _151 = in.m_52.z;
    float _153 = in.m_54.x;
    float _155 = in.m_54.y;
    float _157 = in.m_54.z;
    float _159 = in.m_56.x;
    float _161 = in.m_56.y;
    float _163 = in.m_56.z;
    float _165 = in.m_58.x;
    float _167 = in.m_58.y;
    float _169 = in.m_58.z;
    int _171 = as_type<int>(_145) & 1;
    bool _173 = _171 != 0;
    int _175 = as_type<int>(_145) & 2;
    bool _177 = _175 != 0;
    bool _179 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _181 = _149 * _155;
    float _183 = _149 * _161;
    float _185 = fma(_147, _153, _181);
    float _187 = _149 * _167;
    float _189 = fma(_147, _159, _183);
    bool _191 = !_177;
    float _193 = _191 ? (-0.5) : 0.5;
    float _195 = fma(_147, _165, _187);
    float _197 = fma(_151, _157, _185);
    float _199 = fma(_151, _163, _189);
    float _201 = fma(_151, _169, _195);
    bool _203 = !_173;
    float _205 = _203 ? (-0.5) : 0.5;
    bool _207 = !_179;
    float _225;
    if (!_207)
    {
        float _209 = in.m_60.x;
        float _211 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _213 = _209 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _215 = fma(_213, (*spvDescriptorSet0.vp_c9)._m0[12].x, _125);
        float _217 = _215 * _211;
        float _219 = floor(_217);
        float _221 = -_219;
        float _223 = _217 + _221;
        _225 = _223;
        _227 = true;
    }
    else
    {
        float _229 = float(_91);
        float _231 = 1.0 / _229;
        float _233 = _125 * _231;
        _225 = _233;
    }
    _227 = false;
    float _235 = _225;
    float _237 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _239 = _235 + _237;
    bool _241 = _235 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _243 = isnan(_235);
    bool _245 = _241 || _243;
    bool _247 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _249 = _245 || _247;
    float _251 = float(_249);
    float _253 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _255 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _253;
    float _257 = -_251;
    float _259 = _257 + 1.0;
    bool _261 = _235 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _263 = isnan(_235);
    bool _265 = _261 || _263;
    bool _267 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _269 = _265 || _267;
    float _271 = float(_269);
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _275 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _273;
    bool _277 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _279 = 1.0 / _255;
    float _281 = _271 * _259;
    float _283 = -_271;
    float _285 = _283 + 1.0;
    float _287 = _239 * _279;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _291 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _289;
    float _293 = fma(_275, _287, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _295 = fma(_291, _287, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _297 = _293 * _281;
    float _299 = _295 * _281;
    float _301 = fma(_285, (*spvDescriptorSet0.vp_c9)._m0[143].x, _297);
    float _303 = fma(_285, (*spvDescriptorSet0.vp_c9)._m0[143].y, _299);
    float _305 = fma(_251, (*spvDescriptorSet0.vp_c9)._m0[144].x, _301);
    float _307 = fma(_251, (*spvDescriptorSet0.vp_c9)._m0[144].y, _303);
    bool _309 = !_277;
    float _327;
    if (!_309)
    {
        float _311 = in.m_60.x;
        float _313 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _315 = _311 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _317 = fma(_315, (*spvDescriptorSet0.vp_c9)._m0[11].x, _125);
        float _319 = _317 * _313;
        float _321 = floor(_319);
        float _323 = -_321;
        float _325 = _319 + _323;
        _327 = _325;
        _329 = true;
    }
    else
    {
        float _331 = float(_91);
        float _333 = 1.0 / _331;
        float _335 = _125 * _333;
        _327 = _335;
    }
    _329 = false;
    float _337 = _327;
    float _339 = in.m_62.x;
    float _341 = in.m_62.y;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _345 = _337 + _343;
    bool _347 = _337 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _349 = isnan(_337);
    bool _351 = _347 || _349;
    bool _353 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _355 = _351 || _353;
    float _357 = float(_355);
    bool _359 = _337 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _361 = isnan(_337);
    bool _363 = _359 || _361;
    bool _365 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _367 = _363 || _365;
    float _369 = float(_367);
    float _371 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _373 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _371;
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _377 = _375 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _379 = -_357;
    float _381 = _379 + 1.0;
    float _383 = 1.0 / _377;
    bool _385 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _387 = 1.0 / _373;
    float _389 = _307 * _341;
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _393 = _337 + _391;
    bool _395 = _337 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _397 = isnan(_337);
    bool _399 = _395 || _397;
    bool _401 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _403 = _399 || _401;
    float _405 = float(_403);
    float _407 = _305 * _339;
    float _409 = _393 * _383;
    float _411 = _405 * _381;
    float _413 = -_405;
    float _415 = _413 + 1.0;
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _419 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _417;
    float _421 = _345 * _387;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _425 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _423;
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _429 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _427;
    float _431 = _369 * _415;
    float _433 = fma(_419, _421, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _435 = fma(_425, _421, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _437 = fma(_429, _421, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _439 = -_369;
    float _441 = _439 + 1.0;
    float _443 = _433 * _431;
    float _445 = _435 * _431;
    float _447 = _437 * _431;
    float _449 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _451 = _449 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _455 = _453 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _459 = _457 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _461 = fma(_441, (*spvDescriptorSet0.vp_c9)._m0[107].x, _443);
    float _463 = fma(_451, _409, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _465 = fma(_441, (*spvDescriptorSet0.vp_c9)._m0[107].y, _445);
    float _467 = fma(_455, _409, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _469 = fma(_459, _409, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _471 = fma(_441, (*spvDescriptorSet0.vp_c9)._m0[107].z, _447);
    float _473 = fma(_463, _411, _461);
    float _475 = fma(_467, _411, _465);
    float _477 = fma(_469, _411, _471);
    float _479 = fma(_357, (*spvDescriptorSet0.vp_c9)._m0[109].x, _473);
    float _481 = fma(_357, (*spvDescriptorSet0.vp_c9)._m0[109].y, _475);
    float _483 = fma(_357, (*spvDescriptorSet0.vp_c9)._m0[109].z, _477);
    bool _485 = !_385;
    float _503;
    if (!_485)
    {
        float _487 = in.m_60.x;
        float _489 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _491 = _487 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _493 = fma(_491, (*spvDescriptorSet0.vp_c9)._m0[11].y, _125);
        float _495 = _493 * _489;
        float _497 = floor(_495);
        float _499 = -_497;
        float _501 = _495 + _499;
        _503 = _501;
        _505 = true;
    }
    else
    {
        float _507 = float(_91);
        float _509 = 1.0 / _507;
        float _511 = _125 * _509;
        _503 = _511;
    }
    _505 = false;
    float _513 = _503;
    float _515 = in.m_42.x;
    float _517 = in.m_42.y;
    float _519 = in.m_42.z;
    float _521 = in.m_60.x;
    float _523 = in.m_60.y;
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _527 = _525 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _529 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _531 = _529 != 0;
    float _533 = in.m_56.w;
    int _535 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _537 = _535 != 0;
    float _539 = 1.0 / _527;
    float _541 = in.m_58.w;
    float _543 = in.m_54.w;
    float _545 = _155 * _517;
    float _547 = _161 * _517;
    float _549 = _167 * _517;
    float _551 = fma(_153, _515, _545);
    float _553 = fma(_159, _515, _547);
    float _555 = fma(_165, _515, _549);
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _559 = _513 + _557;
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _563 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _561;
    float _565 = fma(_163, _519, _553);
    bool _567 = _521 > 0.5;
    float _569 = fma(_157, _519, _551);
    float _571 = _563 * _539;
    bool _573 = _513 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _575 = isnan(_513);
    bool _577 = _573 || _575;
    bool _579 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _581 = _577 || _579;
    float _583 = float(_581);
    float _585 = fma(_169, _519, _555);
    float _587 = _565 + _533;
    float _589 = fma(_571, _559, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _591 = -_205;
    int _593 = _567 ? as_type<int>(_591) : as_type<int>(_205);
    float _595 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _597 = _513 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _599 = isnan(_513);
    bool _601 = _597 || _599;
    bool _603 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _605 = _601 || _603;
    float _607 = float(_605);
    float _609 = -_583;
    float _611 = _609 + 1.0;
    float _613 = _585 + _541;
    float _615 = _569 + _543;
    float _617 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _619 = _587 + _617;
    bool _621 = !_531;
    float _623 = _621 ? _205 : as_type<float>(_593);
    float _625 = _607 * _611;
    float _627 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _629 = _615 + _627;
    float _631 = _619 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _633 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _635 = _613 + _633;
    float _637 = _623 + 0.5;
    float _639 = _589 * _625;
    float _641 = fma(_629, (*spvDescriptorSet0.vp_c8)._m0[28].x, _631);
    bool _643 = _523 > 0.5;
    float _645 = _637 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _647 = -_607;
    float _649 = _647 + 1.0;
    float _651 = fma(_635, (*spvDescriptorSet0.vp_c8)._m0[28].z, _641);
    float _653 = -_193;
    int _655 = _643 ? as_type<int>(_653) : as_type<int>(_193);
    float _657 = _645 * _595;
    float _659 = _619 * _619;
    float _661 = fma(_649, (*spvDescriptorSet0.vp_c9)._m0[115].x, _639);
    bool _663 = _651 >= 0.0;
    float _665 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _667 = fma(_629, _629, _659);
    bool _669 = !_537;
    float _671 = _669 ? _193 : as_type<float>(_655);
    float _673 = fma(_583, (*spvDescriptorSet0.vp_c9)._m0[116].x, _661);
    float _675 = _481 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _677 = fma(_635, _635, _667);
    float _679 = _479 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _681 = -_671;
    float _683 = _681 + 0.5;
    float _685 = rsqrt(_677);
    float _687 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _689 = _683 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _693 = (*spvDescriptorSet0.vp_c9)._m0[123].y;
    if (_663)
    {
        _693 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _695 = _693;
    float _697 = _483 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _699 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _701 = _689 * _665;
    float _703 = _679 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _705 = _675 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _707 = _691 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _709 = _687 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _711 = _699 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _713 = _697 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _715 = _673 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _717 = as_type<int>(_695);
    if (_663)
    {
        float _719 = _695 * 5.0;
        _717 = as_type<int>(_719);
    }
    int _721 = _717;
    out.m_64.x = _657;
    out.m_64.y = _701;
    float _723 = _619 * _685;
    float _725 = _629 * _685;
    out.m_66.x = _707;
    out.m_66.y = _709;
    out.m_66.z = _711;
    out.m_68.x = _703;
    out.m_68.y = _705;
    out.m_68.z = _713;
    out.m_68.w = _715;
    if (_663)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2584 = as_type<float>(_721);
        out.gl_Position.z = _2584;
    }
    if (_663)
    {
        out.m_45.x = 0.0;
    }
    if (_663)
    {
        return out;
    }
    float _727 = -_723;
    float _729 = fma(_727, (*spvDescriptorSet0.vp_c9)._m0[18].w, _587);
    float _731 = _635 * _685;
    float _733 = -_725;
    float _735 = fma(_733, (*spvDescriptorSet0.vp_c9)._m0[18].w, _615);
    float _737 = -_723;
    float _739 = fma(_737, (*spvDescriptorSet0.vp_c9)._m0[18].w, _619);
    float _741 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _743 = _729 + _741;
    float _745 = -_731;
    float _747 = fma(_745, (*spvDescriptorSet0.vp_c9)._m0[18].w, _613);
    float _749 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _751 = _735 + _749;
    float _753 = -_725;
    float _755 = fma(_753, (*spvDescriptorSet0.vp_c9)._m0[18].w, _629);
    float _757 = _743 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _759 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _761 = _747 + _759;
    float _763 = -_731;
    float _765 = fma(_763, (*spvDescriptorSet0.vp_c9)._m0[18].w, _635);
    float _767 = fma(_751, (*spvDescriptorSet0.vp_c8)._m0[28].x, _757);
    float _769 = _739 * _739;
    float _771 = fma(_761, (*spvDescriptorSet0.vp_c8)._m0[28].z, _767);
    float _773 = fma(_755, _755, _769);
    bool _775 = _771 >= 0.0;
    float _777 = fma(_765, _765, _773);
    float _779 = sqrt(_777);
    float _781 = _771;
    float _783 = _747;
    if (_775)
    {
        _781 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _785 = _781;
    int _787 = as_type<int>(_785);
    if (_775)
    {
        out.m_45.x = 0.0;
    }
    if (_775)
    {
        float _789 = _785 * 5.0;
        _787 = as_type<int>(_789);
    }
    int _791 = _787;
    if (_775)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2714 = as_type<float>(_791);
        out.gl_Position.z = _2714;
    }
    float _793 = _685 * _779;
    if (_775)
    {
        return out;
    }
    float _795 = _389 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _797 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _193);
    float _799 = _407 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _801 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _205);
    float _803 = _793 * _795;
    float _805 = _793 * _799;
    float _807 = _793 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _809 = _807 * 0.5;
    float _811 = _797 * _803;
    float _813 = _801 * _805;
    float _815 = _811 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _817 = _811 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _819 = fma(_813, (*spvDescriptorSet0.vp_c8)._m0[26].x, _815);
    float _821 = fma(_813, (*spvDescriptorSet0.vp_c8)._m0[24].x, _817);
    float _823 = fma(_809, (*spvDescriptorSet0.vp_c8)._m0[26].z, _819);
    float _825 = fma(_809, (*spvDescriptorSet0.vp_c8)._m0[24].z, _821);
    float _827 = _823 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _829 = _825 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _831 = _613 + _827;
    float _833 = _615 + _829;
    float _835 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _837 = _831 + _835;
    float _839 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _841 = _833 + _839;
    float _843 = _837 * _837;
    float _845 = fma(_841, _841, _843);
    float _847 = _811 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _849 = sqrt(_845);
    float _851 = fma(_813, (*spvDescriptorSet0.vp_c8)._m0[25].x, _847);
    float _853 = fma(_809, (*spvDescriptorSet0.vp_c8)._m0[25].z, _851);
    float _855 = _853 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _857 = _587 + _855;
    bool _859 = _849 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _861 = _853;
    float _863 = _823;
    float _865 = _833;
    float _867 = _849;
    if (!_859)
    {
        _861 = _831;
    }
    float _869 = _861;
    float _871 = _869;
    if (!_859)
    {
        _863 = _857;
    }
    float _873 = _863;
    bool _875 = !_859;
    float _877 = _873;
    if (!_875)
    {
        float _879 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _881 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _883 = _849 + _881;
        float _885 = rsqrt(_845);
        float _887 = _883 * _879;
        float _889 = _857 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _891 = _887 * 0.15915493667125701904296875;
        float _893 = _891 * 6.283185482025146484375;
        float _895 = sin(_893);
        float _897 = _891 * 6.283185482025146484375;
        float _899 = cos(_897);
        float _901 = fma(_895, _889, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _903 = _885 * _901;
        float _905 = _899 + (-1.0);
        float _907 = _905 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _909 = fma(_841, _903, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _911 = fma(_837, _903, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _913 = fma(_857, _899, _907);
        _877 = _913;
        _865 = _909;
        _871 = _911;
        _867 = _891;
    }
    float _915 = _877;
    float _917 = _865;
    float _919 = _871;
    float _921 = _867;
    float _923 = -_587;
    float _925 = _923 + _915;
    float _927 = -_615;
    float _929 = _927 + _917;
    float _931 = -_613;
    float _933 = _931 + _919;
    float _935 = _925 * _925;
    float _937 = fma(_929, _929, _935);
    float _939 = fma(_933, _933, _937);
    float _941 = sqrt(_939);
    bool _943 = _941 > 0.0;
    bool _945 = !_943;
    float _947 = _915;
    float _949 = _917;
    float _951 = _919;
    float _953 = _921;
    float _955 = _939;
    if (!_945)
    {
        float _957 = _199 * _199;
        float _959 = fma(_197, _197, _957);
        float _961 = rsqrt(_939);
        float _963 = fma(_201, _201, _959);
        float _965 = sqrt(_963);
        float _967 = _929 * _961;
        float _969 = _925 * _961;
        float _971 = _933 * _961;
        bool _973 = _965 > 0.0;
        bool _975 = !_973;
        _953 = _963;
        if (!_975)
        {
            float _977 = rsqrt(_963);
            float _979 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _981 = _199 * _977;
            float _983 = _197 * _977;
            float _985 = _969 * _981;
            float _987 = _201 * _977;
            float _989 = fma(_967, _983, _985);
            float _991 = _979 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _993 = fma(_971, _987, _989);
            float _995 = _993 * _991;
            float _997 = fma(_197, _995, _917);
            float _999 = fma(_199, _995, _915);
            float _1001 = fma(_201, _995, _919);
            _947 = _999;
            _949 = _997;
            _951 = _1001;
            _953 = _977;
            _955 = _995;
        }
    }
    float _1003 = _947;
    float _1005 = _949;
    float _1007 = _951;
    float _1009 = _953;
    float _1011 = _955;
    float _1013 = -_723;
    float _1015 = fma(_1013, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1003);
    float _1017 = -_725;
    float _1019 = fma(_1017, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1005);
    float _1021 = -_731;
    float _1023 = fma(_1021, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1007);
    float _1025 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1027 = _1015 + _1025;
    float _1029 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1031 = _1019 + _1029;
    float _1033 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1035 = _1023 + _1033;
    float _1037 = _1027 * _1027;
    float _1039 = fma(_1031, _1031, _1037);
    float _1041 = fma(_1035, _1035, _1039);
    float _1043 = rsqrt(_1041);
    float _1045 = _1043 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1047 = _1031 * _1045;
    float _1049 = _1035 * _1045;
    float _1051 = _1047 * _1047;
    float _1053 = _1049 * _1049;
    float _1055 = _1051 + _1053;
    float _1057 = sqrt(_1055);
    bool _1059 = _1057 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1061 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1063 = _1057 + _1061;
    float _1065 = _1043;
    float _1067 = _1011;
    float _1069 = _1063;
    float _1071 = _1009;
    float _1073 = _1027;
    float _1075 = _1045;
    float _1077 = _1047;
    if (_1059)
    {
        float _1079 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1065 = _1079;
    }
    float _1081 = _1065;
    if (_1059)
    {
        float _1083 = rsqrt(_1055);
        _1067 = _1083;
    }
    float _1085 = _1067;
    float _1087 = _1085;
    if (_1059)
    {
        float _1089 = _1063 * _1081;
        _1069 = _1089;
    }
    float _1091 = _1069;
    if (_1059)
    {
        float _1093 = _1091 * 0.15915493667125701904296875;
        _1071 = _1093;
    }
    float _1095 = _1071;
    float _1097 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1099 = _1081;
    if (_1059)
    {
        float _1101 = _1095 * 6.283185482025146484375;
        float _1103 = sin(_1101);
        _1099 = _1103;
    }
    float _1105 = _1099;
    float _1107 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1109 = precise::max(0.0, _1107);
    float _1111 = _1035;
    float _1113 = _1109;
    if (_1059)
    {
        float _1115 = _1095 * 6.283185482025146484375;
        float _1117 = cos(_1115);
        _1111 = _1117;
    }
    float _1119 = _1111;
    float _1121 = -_1045;
    float _1123 = -_1109;
    float _1125 = fma(_1027, _1121, _1123);
    if (!_1059)
    {
        _1073 = _1051;
    }
    float _1127 = _1073;
    float _1129 = _1127;
    if (_1059)
    {
        float _1131 = _1125 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1113 = _1131;
    }
    float _1133 = _1113;
    float _1135 = sqrt(_1041);
    float _1137 = _1105;
    float _1139 = _1133;
    if (_1059)
    {
        float _1141 = fma(_1105, _1133, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1137 = _1141;
    }
    float _1143 = _1137;
    float _1145 = _1143;
    float _1147 = _1119;
    if (_1059)
    {
        float _1149 = _1119 + (-1.0);
        _1139 = _1149;
    }
    float _1151 = _1139;
    float _1153 = _1151;
    if (_1059)
    {
        float _1155 = _1085 * _1143;
        _1075 = _1155;
    }
    float _1157 = _1075;
    if (!_1059)
    {
        _1087 = _1125;
    }
    float _1159 = _1087;
    float _1161 = _1159;
    if (_1059)
    {
        float _1163 = _1151 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1145 = _1163;
    }
    float _1165 = _1145;
    if (_1059)
    {
        float _1167 = _1047 * _1157;
        _1077 = _1167;
    }
    float _1169 = _1077;
    if (!_1059)
    {
        _1153 = _1049;
    }
    float _1171 = _1153;
    float _1173 = _1171;
    if (_1059)
    {
        float _1175 = _1049 * _1157;
        _1173 = _1175;
    }
    float _1177 = _1173;
    if (_1059)
    {
        float _1179 = fma(_1125, _1119, _1165);
        _1161 = _1179;
    }
    float _1181 = _1161;
    if (_1059)
    {
        float _1183 = _1169 * _1169;
        _1129 = _1183;
    }
    float _1185 = _1129;
    if (!_1059)
    {
        _1147 = _1053;
    }
    float _1187 = _1147;
    float _1189 = _1187;
    if (_1059)
    {
        float _1191 = _1177 * _1177;
        _1189 = _1191;
    }
    float _1193 = _1189;
    float _1195 = fma(_1181, _1181, _1185);
    float _1197 = _1015 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1199 = _1195 + _1193;
    float _1201 = _1015 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1203 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1205 = fma(_1135, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1203);
    float _1207 = precise::clamp(_1205, 0.0, 1.0);
    float _1209 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1197);
    float _1211 = rsqrt(_1199);
    float _1213 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1201);
    float _1215 = _1015 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1217 = -_1207;
    float _1219 = _1217 + 1.0;
    float _1221 = _1015 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1223 = fma(_1023, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1213);
    float _1225 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1215);
    float _1227 = fma(_1023, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1209);
    float _1229 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1221);
    float _1231 = _1223 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1233 = fma(_1023, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1225);
    float _1235 = abs(_1219);
    float _1237 = log2(_1235);
    float _1239 = fma(_1023, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1229);
    float _1241 = _1227 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1243 = _1233 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1245 = _1231 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1247 = _1211 * _1169;
    float _1249 = _1211 * _1181;
    float _1251 = _1243 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1253 = _1211 * _1177;
    float _1255 = _1247 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1257 = _1239 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1259 = fma(_1241, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1251);
    float _1261 = -_1245;
    float _1263 = fma(_1261, _1097, 1.0);
    float _1265 = -_1255;
    float _1267 = fma(_1249, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1265);
    float _1269 = _1243 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1271 = fma(_1231, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1259);
    float _1273 = _1237 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1275 = -_1253;
    float _1277 = fma(_1275, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1267);
    float _1279 = log2(_1263);
    float _1281 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1271);
    float _1283 = _1243 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1285 = fma(_1277, -0.5, 0.5);
    float _1287 = fma(_1277, 0.5, 0.5);
    float _1289 = fma(_1241, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1283);
    float _1291 = fma(_1241, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1269);
    float _1293 = exp2(_1273);
    float _1295 = _1249 + 1.0;
    float _1297 = fma(_1287, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1299 = fma(_1231, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1289);
    float _1301 = fma(_1231, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1291);
    float _1303 = 1.0 / _1281;
    float _1305 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1301);
    float _1307 = sqrt(_1285);
    float _1309 = -_1249;
    float _1311 = fma(_1293, _1295, _1309);
    float _1313 = fma(_1287, _1297, -0.212114393711090087890625);
    float _1315 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1299);
    float _1317 = _1279 * 0.693147182464599609375;
    float _1319 = fma(_1311, 0.5, 0.5);
    float _1321 = fma(_1287, _1313, 1.570728778839111328125);
    float _1323 = _1315 * _1303;
    float _1325 = _1305 * _1303;
    float _1327 = _1317 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1329 = fma(_1323, 0.5, 0.5);
    float _1331 = fma(_1325, -0.5, 0.5);
    float _1333 = _1307 * 0.636619746685028076171875;
    float3 _3605 = float3(_1329, _1331, _1327);
    float _1335 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3605, float3(0.0), isnan(_3605)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3605, float3(0.0), isnan(_3605)), level(0.0)).x;
    float3 _3616 = float3(_1329, _1331, _1327);
    float4 _1338 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3616, float3(0.0), isnan(_3616)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3616, float3(0.0), isnan(_3616)), level(0.0)).xyzw;
    float _1340 = _1338.x;
    float _1342 = _1338.y;
    float _1344 = _1338.z;
    float _1346 = _1338.w;
    float _1348 = -_1321;
    float _1350 = fma(_1333, _1348, 1.0);
    float2 _3638 = float2(_1350, _1319);
    float3 _1354 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3638, float2(0.0), isnan(_3638)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3638, float2(0.0), isnan(_3638)), level(0.0)).xyz;
    float _1356 = _1354.x;
    float _1358 = _1354.y;
    float _1360 = _1354.z;
    float _1362 = _729 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1364 = _729 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1366 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1368 = isnan(0.5);
    bool _1370 = _1366 || _1368;
    bool _1372 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1374 = _1370 || _1372;
    float _1376 = _1237 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1378 = fma(_735, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1362);
    float _1380 = fma(_735, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1364);
    float _1382 = _1243 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1384 = fma(_747, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1378);
    float _1386 = fma(_747, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1380);
    float _1388 = exp2(_1376);
    float _1390 = _1384 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1392 = _1386 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1394 = _1331;
    float _1396 = _1384;
    float _1398 = _1382;
    if (!_1374)
    {
        _783 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1400 = _783;
    float _1402 = _1392 + _1390;
    float _1404 = 1.0 / _1390;
    float _1406 = _1400;
    if (!_1374)
    {
        _1394 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1408 = _1394;
    if (!_1374)
    {
        float _1410 = -_1408;
        float _1412 = _1410 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1396 = _1412;
    }
    float _1414 = _1396;
    float _1416 = _1414;
    if (!_1374)
    {
        float _1418 = 1.0 / _1414;
        _1416 = _1418;
    }
    float _1420 = _1416;
    float _1422 = _1402 * _1404;
    float _1424 = _1422 * 0.5;
    float _1426 = _1404;
    if (!_1374)
    {
        float _1428 = -_1400;
        float _1430 = fma(_1424, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1428);
        _1426 = _1430;
    }
    float _1432 = _1426;
    float _1434 = fma(_1241, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1382);
    if (_1374)
    {
        _1398 = 1.0;
    }
    float _1436 = _1398;
    float _1438 = fma(_1231, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1434);
    float _1440 = _1432;
    float _1442 = _1436;
    if (!_1374)
    {
        float _1444 = 1.0 / _1432;
        _1440 = _1444;
    }
    float _1446 = _1440;
    float _1448 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1438);
    float _1450 = _1448 + _1281;
    out.gl_Position.x = _1315;
    out.gl_Position.y = _1305;
    out.gl_Position.z = _1448;
    out.gl_Position.w = _1281;
    if (!_1374)
    {
        float _1452 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1454 = -_1408;
        float _1456 = fma(_1446, _1452, _1454);
        _1406 = _1456;
    }
    float _1458 = _1406;
    float _1460 = _1450 * 0.5;
    if (!_1374)
    {
        float _1462 = _1458 * _1420;
        float _1464 = precise::clamp(_1462, 0.0, 1.0);
        _1442 = _1464;
    }
    float _1466 = _1442;
    float _1468 = -_1388;
    float _1470 = _1468 + 1.0;
    out.m_70.z = _1460;
    out.m_70.w = _1281;
    float _1472 = _1466 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1474 = _1470 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _1476 = _1466 > 0.0;
    bool _1478 = isnan(_1466);
    bool _1480 = _1476 || _1478;
    bool _1482 = isnan(0.0);
    bool _1484 = _1480 || _1482;
    float _1486 = _1472 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_45.x = _1486;
    float _1488 = _1474 * _1335;
    float _1490 = -_1474;
    float _1492 = _1490 + 1.0;
    float _1494 = _1346 * _1488;
    float _1496 = _1346 * _1492;
    float _1498 = _1360 * _1488;
    float _1500 = fma(_1356, _1494, _1340);
    float _1502 = fma(_1358, _1494, _1342);
    float _1504 = fma(_1346, _1498, _1344);
    out.m_72.x = _1500;
    out.m_72.y = _1502;
    out.m_72.z = _1504;
    out.m_72.w = _1496;
    if (_1484)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _1506 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1506;
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
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _505 = false;
    bool _329 = false;
    bool _227 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _86 = in.m_42.w;
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
        out.m_45.x = 0.0;
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
        float _1563 = as_type<float>(_107);
        out.gl_Position.z = _1563;
    }
    if (!_95)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _111 = in.m_47.w;
    bool _113 = _111 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _115 = isnan(_111);
    bool _117 = _113 || _115;
    bool _119 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _121 = _117 || _119;
    float _123 = -_111;
    float _125 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_121)
    {
        float _127 = float(_91);
        _101 = _127;
    }
    float _129 = _101;
    bool _131 = _125 >= _129;
    bool _133 = !_121;
    bool _135 = _131 || _133;
    float _137 = _129;
    if (_135)
    {
        _137 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _137;
    if (_135)
    {
        out.m_45.x = 0.0;
    }
    if (_135)
    {
        float _141 = _139 * 5.0;
        _109 = as_type<int>(_141);
    }
    int _143 = _109;
    if (_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1632 = as_type<float>(_143);
        out.gl_Position.z = _1632;
    }
    if (_135)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _145 = as_type<float>(int(gl_VertexIndex));
    float _147 = in.m_52.x;
    float _149 = in.m_52.y;
    float _151 = in.m_52.z;
    float _153 = in.m_54.x;
    float _155 = in.m_54.y;
    float _157 = in.m_54.z;
    float _159 = in.m_56.x;
    float _161 = in.m_56.y;
    float _163 = in.m_56.z;
    float _165 = in.m_58.x;
    float _167 = in.m_58.y;
    float _169 = in.m_58.z;
    int _171 = as_type<int>(_145) & 1;
    bool _173 = _171 != 0;
    int _175 = as_type<int>(_145) & 2;
    bool _177 = _175 != 0;
    bool _179 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _181 = _149 * _155;
    float _183 = _149 * _161;
    float _185 = fma(_147, _153, _181);
    float _187 = _149 * _167;
    float _189 = fma(_147, _159, _183);
    bool _191 = !_177;
    float _193 = _191 ? (-0.5) : 0.5;
    float _195 = fma(_147, _165, _187);
    float _197 = fma(_151, _157, _185);
    float _199 = fma(_151, _163, _189);
    float _201 = fma(_151, _169, _195);
    bool _203 = !_173;
    float _205 = _203 ? (-0.5) : 0.5;
    bool _207 = !_179;
    float _225;
    if (!_207)
    {
        float _209 = in.m_60.x;
        float _211 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _213 = _209 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _215 = fma(_213, (*spvDescriptorSet0.vp_c9)._m0[12].x, _125);
        float _217 = _215 * _211;
        float _219 = floor(_217);
        float _221 = -_219;
        float _223 = _217 + _221;
        _225 = _223;
        _227 = true;
    }
    else
    {
        float _229 = float(_91);
        float _231 = 1.0 / _229;
        float _233 = _125 * _231;
        _225 = _233;
    }
    _227 = false;
    float _235 = _225;
    float _237 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _239 = _235 + _237;
    bool _241 = _235 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _243 = isnan(_235);
    bool _245 = _241 || _243;
    bool _247 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _249 = _245 || _247;
    float _251 = float(_249);
    float _253 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _255 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _253;
    float _257 = -_251;
    float _259 = _257 + 1.0;
    bool _261 = _235 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _263 = isnan(_235);
    bool _265 = _261 || _263;
    bool _267 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _269 = _265 || _267;
    float _271 = float(_269);
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _275 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _273;
    bool _277 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _279 = 1.0 / _255;
    float _281 = _271 * _259;
    float _283 = -_271;
    float _285 = _283 + 1.0;
    float _287 = _239 * _279;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _291 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _289;
    float _293 = fma(_275, _287, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _295 = fma(_291, _287, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _297 = _293 * _281;
    float _299 = _295 * _281;
    float _301 = fma(_285, (*spvDescriptorSet0.vp_c9)._m0[143].x, _297);
    float _303 = fma(_285, (*spvDescriptorSet0.vp_c9)._m0[143].y, _299);
    float _305 = fma(_251, (*spvDescriptorSet0.vp_c9)._m0[144].x, _301);
    float _307 = fma(_251, (*spvDescriptorSet0.vp_c9)._m0[144].y, _303);
    bool _309 = !_277;
    float _327;
    if (!_309)
    {
        float _311 = in.m_60.x;
        float _313 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _315 = _311 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _317 = fma(_315, (*spvDescriptorSet0.vp_c9)._m0[11].x, _125);
        float _319 = _317 * _313;
        float _321 = floor(_319);
        float _323 = -_321;
        float _325 = _319 + _323;
        _327 = _325;
        _329 = true;
    }
    else
    {
        float _331 = float(_91);
        float _333 = 1.0 / _331;
        float _335 = _125 * _333;
        _327 = _335;
    }
    _329 = false;
    float _337 = _327;
    float _339 = in.m_62.x;
    float _341 = in.m_62.y;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _345 = _337 + _343;
    bool _347 = _337 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _349 = isnan(_337);
    bool _351 = _347 || _349;
    bool _353 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _355 = _351 || _353;
    float _357 = float(_355);
    bool _359 = _337 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _361 = isnan(_337);
    bool _363 = _359 || _361;
    bool _365 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _367 = _363 || _365;
    float _369 = float(_367);
    float _371 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _373 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _371;
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _377 = _375 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _379 = -_357;
    float _381 = _379 + 1.0;
    float _383 = 1.0 / _377;
    bool _385 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _387 = 1.0 / _373;
    float _389 = _307 * _341;
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _393 = _337 + _391;
    bool _395 = _337 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _397 = isnan(_337);
    bool _399 = _395 || _397;
    bool _401 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _403 = _399 || _401;
    float _405 = float(_403);
    float _407 = _305 * _339;
    float _409 = _393 * _383;
    float _411 = _405 * _381;
    float _413 = -_405;
    float _415 = _413 + 1.0;
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _419 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _417;
    float _421 = _345 * _387;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _425 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _423;
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _429 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _427;
    float _431 = _369 * _415;
    float _433 = fma(_419, _421, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _435 = fma(_425, _421, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _437 = fma(_429, _421, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _439 = -_369;
    float _441 = _439 + 1.0;
    float _443 = _433 * _431;
    float _445 = _435 * _431;
    float _447 = _437 * _431;
    float _449 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _451 = _449 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _455 = _453 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _459 = _457 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _461 = fma(_441, (*spvDescriptorSet0.vp_c9)._m0[107].x, _443);
    float _463 = fma(_451, _409, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _465 = fma(_441, (*spvDescriptorSet0.vp_c9)._m0[107].y, _445);
    float _467 = fma(_455, _409, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _469 = fma(_459, _409, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _471 = fma(_441, (*spvDescriptorSet0.vp_c9)._m0[107].z, _447);
    float _473 = fma(_463, _411, _461);
    float _475 = fma(_467, _411, _465);
    float _477 = fma(_469, _411, _471);
    float _479 = fma(_357, (*spvDescriptorSet0.vp_c9)._m0[109].x, _473);
    float _481 = fma(_357, (*spvDescriptorSet0.vp_c9)._m0[109].y, _475);
    float _483 = fma(_357, (*spvDescriptorSet0.vp_c9)._m0[109].z, _477);
    bool _485 = !_385;
    float _503;
    if (!_485)
    {
        float _487 = in.m_60.x;
        float _489 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _491 = _487 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _493 = fma(_491, (*spvDescriptorSet0.vp_c9)._m0[11].y, _125);
        float _495 = _493 * _489;
        float _497 = floor(_495);
        float _499 = -_497;
        float _501 = _495 + _499;
        _503 = _501;
        _505 = true;
    }
    else
    {
        float _507 = float(_91);
        float _509 = 1.0 / _507;
        float _511 = _125 * _509;
        _503 = _511;
    }
    _505 = false;
    float _513 = _503;
    float _515 = in.m_42.x;
    float _517 = in.m_42.y;
    float _519 = in.m_42.z;
    float _521 = in.m_60.x;
    float _523 = in.m_60.y;
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _527 = _525 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _529 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _531 = _529 != 0;
    float _533 = in.m_56.w;
    int _535 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _537 = _535 != 0;
    float _539 = 1.0 / _527;
    float _541 = in.m_58.w;
    float _543 = in.m_54.w;
    float _545 = _155 * _517;
    float _547 = _161 * _517;
    float _549 = _167 * _517;
    float _551 = fma(_153, _515, _545);
    float _553 = fma(_159, _515, _547);
    float _555 = fma(_165, _515, _549);
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _559 = _513 + _557;
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _563 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _561;
    float _565 = fma(_163, _519, _553);
    bool _567 = _521 > 0.5;
    float _569 = fma(_157, _519, _551);
    float _571 = _563 * _539;
    bool _573 = _513 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _575 = isnan(_513);
    bool _577 = _573 || _575;
    bool _579 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _581 = _577 || _579;
    float _583 = float(_581);
    float _585 = fma(_169, _519, _555);
    float _587 = _565 + _533;
    float _589 = fma(_571, _559, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _591 = -_205;
    int _593 = _567 ? as_type<int>(_591) : as_type<int>(_205);
    float _595 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _597 = _513 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _599 = isnan(_513);
    bool _601 = _597 || _599;
    bool _603 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _605 = _601 || _603;
    float _607 = float(_605);
    float _609 = -_583;
    float _611 = _609 + 1.0;
    float _613 = _585 + _541;
    float _615 = _569 + _543;
    float _617 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _619 = _587 + _617;
    bool _621 = !_531;
    float _623 = _621 ? _205 : as_type<float>(_593);
    float _625 = _607 * _611;
    float _627 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _629 = _615 + _627;
    float _631 = _619 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _633 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _635 = _613 + _633;
    float _637 = _623 + 0.5;
    float _639 = _589 * _625;
    float _641 = fma(_629, (*spvDescriptorSet0.vp_c8)._m0[28].x, _631);
    bool _643 = _523 > 0.5;
    float _645 = _637 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _647 = -_607;
    float _649 = _647 + 1.0;
    float _651 = fma(_635, (*spvDescriptorSet0.vp_c8)._m0[28].z, _641);
    float _653 = -_193;
    int _655 = _643 ? as_type<int>(_653) : as_type<int>(_193);
    float _657 = _645 * _595;
    float _659 = _619 * _619;
    float _661 = fma(_649, (*spvDescriptorSet0.vp_c9)._m0[115].x, _639);
    bool _663 = _651 >= 0.0;
    float _665 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _667 = fma(_629, _629, _659);
    bool _669 = !_537;
    float _671 = _669 ? _193 : as_type<float>(_655);
    float _673 = fma(_583, (*spvDescriptorSet0.vp_c9)._m0[116].x, _661);
    float _675 = _481 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _677 = fma(_635, _635, _667);
    float _679 = _479 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _681 = -_671;
    float _683 = _681 + 0.5;
    float _685 = rsqrt(_677);
    float _687 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _689 = _683 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _693 = (*spvDescriptorSet0.vp_c9)._m0[123].y;
    if (_663)
    {
        _693 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _695 = _693;
    float _697 = _483 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _699 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _701 = _689 * _665;
    float _703 = _679 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _705 = _675 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _707 = _691 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _709 = _687 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _711 = _699 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _713 = _697 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _715 = _673 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _717 = as_type<int>(_695);
    if (_663)
    {
        float _719 = _695 * 5.0;
        _717 = as_type<int>(_719);
    }
    int _721 = _717;
    out.m_64.x = _657;
    out.m_64.y = _701;
    float _723 = _619 * _685;
    float _725 = _629 * _685;
    out.m_66.x = _707;
    out.m_66.y = _709;
    out.m_66.z = _711;
    out.m_68.x = _703;
    out.m_68.y = _705;
    out.m_68.z = _713;
    out.m_68.w = _715;
    if (_663)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2584 = as_type<float>(_721);
        out.gl_Position.z = _2584;
    }
    if (_663)
    {
        out.m_45.x = 0.0;
    }
    if (_663)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _727 = -_723;
    float _729 = fma(_727, (*spvDescriptorSet0.vp_c9)._m0[18].w, _587);
    float _731 = _635 * _685;
    float _733 = -_725;
    float _735 = fma(_733, (*spvDescriptorSet0.vp_c9)._m0[18].w, _615);
    float _737 = -_723;
    float _739 = fma(_737, (*spvDescriptorSet0.vp_c9)._m0[18].w, _619);
    float _741 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _743 = _729 + _741;
    float _745 = -_731;
    float _747 = fma(_745, (*spvDescriptorSet0.vp_c9)._m0[18].w, _613);
    float _749 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _751 = _735 + _749;
    float _753 = -_725;
    float _755 = fma(_753, (*spvDescriptorSet0.vp_c9)._m0[18].w, _629);
    float _757 = _743 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _759 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _761 = _747 + _759;
    float _763 = -_731;
    float _765 = fma(_763, (*spvDescriptorSet0.vp_c9)._m0[18].w, _635);
    float _767 = fma(_751, (*spvDescriptorSet0.vp_c8)._m0[28].x, _757);
    float _769 = _739 * _739;
    float _771 = fma(_761, (*spvDescriptorSet0.vp_c8)._m0[28].z, _767);
    float _773 = fma(_755, _755, _769);
    bool _775 = _771 >= 0.0;
    float _777 = fma(_765, _765, _773);
    float _779 = sqrt(_777);
    float _781 = _771;
    float _783 = _747;
    if (_775)
    {
        _781 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _785 = _781;
    int _787 = as_type<int>(_785);
    if (_775)
    {
        out.m_45.x = 0.0;
    }
    if (_775)
    {
        float _789 = _785 * 5.0;
        _787 = as_type<int>(_789);
    }
    int _791 = _787;
    if (_775)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2714 = as_type<float>(_791);
        out.gl_Position.z = _2714;
    }
    float _793 = _685 * _779;
    if (_775)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _795 = _389 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _797 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _193);
    float _799 = _407 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _801 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _205);
    float _803 = _793 * _795;
    float _805 = _793 * _799;
    float _807 = _793 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _809 = _807 * 0.5;
    float _811 = _797 * _803;
    float _813 = _801 * _805;
    float _815 = _811 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _817 = _811 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _819 = fma(_813, (*spvDescriptorSet0.vp_c8)._m0[26].x, _815);
    float _821 = fma(_813, (*spvDescriptorSet0.vp_c8)._m0[24].x, _817);
    float _823 = fma(_809, (*spvDescriptorSet0.vp_c8)._m0[26].z, _819);
    float _825 = fma(_809, (*spvDescriptorSet0.vp_c8)._m0[24].z, _821);
    float _827 = _823 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _829 = _825 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _831 = _613 + _827;
    float _833 = _615 + _829;
    float _835 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _837 = _831 + _835;
    float _839 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _841 = _833 + _839;
    float _843 = _837 * _837;
    float _845 = fma(_841, _841, _843);
    float _847 = _811 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _849 = sqrt(_845);
    float _851 = fma(_813, (*spvDescriptorSet0.vp_c8)._m0[25].x, _847);
    float _853 = fma(_809, (*spvDescriptorSet0.vp_c8)._m0[25].z, _851);
    float _855 = _853 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _857 = _587 + _855;
    bool _859 = _849 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _861 = _853;
    float _863 = _823;
    float _865 = _833;
    float _867 = _849;
    if (!_859)
    {
        _861 = _831;
    }
    float _869 = _861;
    float _871 = _869;
    if (!_859)
    {
        _863 = _857;
    }
    float _873 = _863;
    bool _875 = !_859;
    float _877 = _873;
    if (!_875)
    {
        float _879 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _881 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _883 = _849 + _881;
        float _885 = rsqrt(_845);
        float _887 = _883 * _879;
        float _889 = _857 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _891 = _887 * 0.15915493667125701904296875;
        float _893 = _891 * 6.283185482025146484375;
        float _895 = sin(_893);
        float _897 = _891 * 6.283185482025146484375;
        float _899 = cos(_897);
        float _901 = fma(_895, _889, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _903 = _885 * _901;
        float _905 = _899 + (-1.0);
        float _907 = _905 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _909 = fma(_841, _903, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _911 = fma(_837, _903, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _913 = fma(_857, _899, _907);
        _877 = _913;
        _865 = _909;
        _871 = _911;
        _867 = _891;
    }
    float _915 = _877;
    float _917 = _865;
    float _919 = _871;
    float _921 = _867;
    float _923 = -_587;
    float _925 = _923 + _915;
    float _927 = -_615;
    float _929 = _927 + _917;
    float _931 = -_613;
    float _933 = _931 + _919;
    float _935 = _925 * _925;
    float _937 = fma(_929, _929, _935);
    float _939 = fma(_933, _933, _937);
    float _941 = sqrt(_939);
    bool _943 = _941 > 0.0;
    bool _945 = !_943;
    float _947 = _915;
    float _949 = _917;
    float _951 = _919;
    float _953 = _921;
    float _955 = _939;
    if (!_945)
    {
        float _957 = _199 * _199;
        float _959 = fma(_197, _197, _957);
        float _961 = rsqrt(_939);
        float _963 = fma(_201, _201, _959);
        float _965 = sqrt(_963);
        float _967 = _929 * _961;
        float _969 = _925 * _961;
        float _971 = _933 * _961;
        bool _973 = _965 > 0.0;
        bool _975 = !_973;
        _953 = _963;
        if (!_975)
        {
            float _977 = rsqrt(_963);
            float _979 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _981 = _199 * _977;
            float _983 = _197 * _977;
            float _985 = _969 * _981;
            float _987 = _201 * _977;
            float _989 = fma(_967, _983, _985);
            float _991 = _979 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _993 = fma(_971, _987, _989);
            float _995 = _993 * _991;
            float _997 = fma(_197, _995, _917);
            float _999 = fma(_199, _995, _915);
            float _1001 = fma(_201, _995, _919);
            _947 = _999;
            _949 = _997;
            _951 = _1001;
            _953 = _977;
            _955 = _995;
        }
    }
    float _1003 = _947;
    float _1005 = _949;
    float _1007 = _951;
    float _1009 = _953;
    float _1011 = _955;
    float _1013 = -_723;
    float _1015 = fma(_1013, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1003);
    float _1017 = -_725;
    float _1019 = fma(_1017, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1005);
    float _1021 = -_731;
    float _1023 = fma(_1021, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1007);
    float _1025 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1027 = _1015 + _1025;
    float _1029 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1031 = _1019 + _1029;
    float _1033 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1035 = _1023 + _1033;
    float _1037 = _1027 * _1027;
    float _1039 = fma(_1031, _1031, _1037);
    float _1041 = fma(_1035, _1035, _1039);
    float _1043 = rsqrt(_1041);
    float _1045 = _1043 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1047 = _1031 * _1045;
    float _1049 = _1035 * _1045;
    float _1051 = _1047 * _1047;
    float _1053 = _1049 * _1049;
    float _1055 = _1051 + _1053;
    float _1057 = sqrt(_1055);
    bool _1059 = _1057 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1061 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1063 = _1057 + _1061;
    float _1065 = _1043;
    float _1067 = _1011;
    float _1069 = _1063;
    float _1071 = _1009;
    float _1073 = _1027;
    float _1075 = _1045;
    float _1077 = _1047;
    if (_1059)
    {
        float _1079 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1065 = _1079;
    }
    float _1081 = _1065;
    if (_1059)
    {
        float _1083 = rsqrt(_1055);
        _1067 = _1083;
    }
    float _1085 = _1067;
    float _1087 = _1085;
    if (_1059)
    {
        float _1089 = _1063 * _1081;
        _1069 = _1089;
    }
    float _1091 = _1069;
    if (_1059)
    {
        float _1093 = _1091 * 0.15915493667125701904296875;
        _1071 = _1093;
    }
    float _1095 = _1071;
    float _1097 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1099 = _1081;
    if (_1059)
    {
        float _1101 = _1095 * 6.283185482025146484375;
        float _1103 = sin(_1101);
        _1099 = _1103;
    }
    float _1105 = _1099;
    float _1107 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1109 = precise::max(0.0, _1107);
    float _1111 = _1035;
    float _1113 = _1109;
    if (_1059)
    {
        float _1115 = _1095 * 6.283185482025146484375;
        float _1117 = cos(_1115);
        _1111 = _1117;
    }
    float _1119 = _1111;
    float _1121 = -_1045;
    float _1123 = -_1109;
    float _1125 = fma(_1027, _1121, _1123);
    if (!_1059)
    {
        _1073 = _1051;
    }
    float _1127 = _1073;
    float _1129 = _1127;
    if (_1059)
    {
        float _1131 = _1125 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1113 = _1131;
    }
    float _1133 = _1113;
    float _1135 = sqrt(_1041);
    float _1137 = _1105;
    float _1139 = _1133;
    if (_1059)
    {
        float _1141 = fma(_1105, _1133, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1137 = _1141;
    }
    float _1143 = _1137;
    float _1145 = _1143;
    float _1147 = _1119;
    if (_1059)
    {
        float _1149 = _1119 + (-1.0);
        _1139 = _1149;
    }
    float _1151 = _1139;
    float _1153 = _1151;
    if (_1059)
    {
        float _1155 = _1085 * _1143;
        _1075 = _1155;
    }
    float _1157 = _1075;
    if (!_1059)
    {
        _1087 = _1125;
    }
    float _1159 = _1087;
    float _1161 = _1159;
    if (_1059)
    {
        float _1163 = _1151 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1145 = _1163;
    }
    float _1165 = _1145;
    if (_1059)
    {
        float _1167 = _1047 * _1157;
        _1077 = _1167;
    }
    float _1169 = _1077;
    if (!_1059)
    {
        _1153 = _1049;
    }
    float _1171 = _1153;
    float _1173 = _1171;
    if (_1059)
    {
        float _1175 = _1049 * _1157;
        _1173 = _1175;
    }
    float _1177 = _1173;
    if (_1059)
    {
        float _1179 = fma(_1125, _1119, _1165);
        _1161 = _1179;
    }
    float _1181 = _1161;
    if (_1059)
    {
        float _1183 = _1169 * _1169;
        _1129 = _1183;
    }
    float _1185 = _1129;
    if (!_1059)
    {
        _1147 = _1053;
    }
    float _1187 = _1147;
    float _1189 = _1187;
    if (_1059)
    {
        float _1191 = _1177 * _1177;
        _1189 = _1191;
    }
    float _1193 = _1189;
    float _1195 = fma(_1181, _1181, _1185);
    float _1197 = _1015 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1199 = _1195 + _1193;
    float _1201 = _1015 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1203 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1205 = fma(_1135, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1203);
    float _1207 = precise::clamp(_1205, 0.0, 1.0);
    float _1209 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1197);
    float _1211 = rsqrt(_1199);
    float _1213 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1201);
    float _1215 = _1015 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1217 = -_1207;
    float _1219 = _1217 + 1.0;
    float _1221 = _1015 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1223 = fma(_1023, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1213);
    float _1225 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1215);
    float _1227 = fma(_1023, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1209);
    float _1229 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1221);
    float _1231 = _1223 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1233 = fma(_1023, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1225);
    float _1235 = abs(_1219);
    float _1237 = log2(_1235);
    float _1239 = fma(_1023, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1229);
    float _1241 = _1227 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1243 = _1233 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1245 = _1231 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1247 = _1211 * _1169;
    float _1249 = _1211 * _1181;
    float _1251 = _1243 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1253 = _1211 * _1177;
    float _1255 = _1247 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1257 = _1239 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1259 = fma(_1241, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1251);
    float _1261 = -_1245;
    float _1263 = fma(_1261, _1097, 1.0);
    float _1265 = -_1255;
    float _1267 = fma(_1249, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1265);
    float _1269 = _1243 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1271 = fma(_1231, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1259);
    float _1273 = _1237 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1275 = -_1253;
    float _1277 = fma(_1275, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1267);
    float _1279 = log2(_1263);
    float _1281 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1271);
    float _1283 = _1243 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1285 = fma(_1277, -0.5, 0.5);
    float _1287 = fma(_1277, 0.5, 0.5);
    float _1289 = fma(_1241, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1283);
    float _1291 = fma(_1241, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1269);
    float _1293 = exp2(_1273);
    float _1295 = _1249 + 1.0;
    float _1297 = fma(_1287, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1299 = fma(_1231, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1289);
    float _1301 = fma(_1231, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1291);
    float _1303 = 1.0 / _1281;
    float _1305 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1301);
    float _1307 = sqrt(_1285);
    float _1309 = -_1249;
    float _1311 = fma(_1293, _1295, _1309);
    float _1313 = fma(_1287, _1297, -0.212114393711090087890625);
    float _1315 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1299);
    float _1317 = _1279 * 0.693147182464599609375;
    float _1319 = fma(_1311, 0.5, 0.5);
    float _1321 = fma(_1287, _1313, 1.570728778839111328125);
    float _1323 = _1315 * _1303;
    float _1325 = _1305 * _1303;
    float _1327 = _1317 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1329 = fma(_1323, 0.5, 0.5);
    float _1331 = fma(_1325, -0.5, 0.5);
    float _1333 = _1307 * 0.636619746685028076171875;
    float3 _3605 = float3(_1329, _1331, _1327);
    float _1335 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3605, float3(0.0), isnan(_3605)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3605, float3(0.0), isnan(_3605)), level(0.0)).x;
    float3 _3616 = float3(_1329, _1331, _1327);
    float4 _1338 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3616, float3(0.0), isnan(_3616)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3616, float3(0.0), isnan(_3616)), level(0.0)).xyzw;
    float _1340 = _1338.x;
    float _1342 = _1338.y;
    float _1344 = _1338.z;
    float _1346 = _1338.w;
    float _1348 = -_1321;
    float _1350 = fma(_1333, _1348, 1.0);
    float2 _3638 = float2(_1350, _1319);
    float3 _1354 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3638, float2(0.0), isnan(_3638)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3638, float2(0.0), isnan(_3638)), level(0.0)).xyz;
    float _1356 = _1354.x;
    float _1358 = _1354.y;
    float _1360 = _1354.z;
    float _1362 = _729 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1364 = _729 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1366 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1368 = isnan(0.5);
    bool _1370 = _1366 || _1368;
    bool _1372 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1374 = _1370 || _1372;
    float _1376 = _1237 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1378 = fma(_735, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1362);
    float _1380 = fma(_735, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1364);
    float _1382 = _1243 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1384 = fma(_747, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1378);
    float _1386 = fma(_747, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1380);
    float _1388 = exp2(_1376);
    float _1390 = _1384 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1392 = _1386 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1394 = _1331;
    float _1396 = _1384;
    float _1398 = _1382;
    if (!_1374)
    {
        _783 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1400 = _783;
    float _1402 = _1392 + _1390;
    float _1404 = 1.0 / _1390;
    float _1406 = _1400;
    if (!_1374)
    {
        _1394 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1408 = _1394;
    if (!_1374)
    {
        float _1410 = -_1408;
        float _1412 = _1410 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1396 = _1412;
    }
    float _1414 = _1396;
    float _1416 = _1414;
    if (!_1374)
    {
        float _1418 = 1.0 / _1414;
        _1416 = _1418;
    }
    float _1420 = _1416;
    float _1422 = _1402 * _1404;
    float _1424 = _1422 * 0.5;
    float _1426 = _1404;
    if (!_1374)
    {
        float _1428 = -_1400;
        float _1430 = fma(_1424, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1428);
        _1426 = _1430;
    }
    float _1432 = _1426;
    float _1434 = fma(_1241, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1382);
    if (_1374)
    {
        _1398 = 1.0;
    }
    float _1436 = _1398;
    float _1438 = fma(_1231, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1434);
    float _1440 = _1432;
    float _1442 = _1436;
    if (!_1374)
    {
        float _1444 = 1.0 / _1432;
        _1440 = _1444;
    }
    float _1446 = _1440;
    float _1448 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1438);
    float _1450 = _1448 + _1281;
    out.gl_Position.x = _1315;
    out.gl_Position.y = _1305;
    out.gl_Position.z = _1448;
    out.gl_Position.w = _1281;
    if (!_1374)
    {
        float _1452 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1454 = -_1408;
        float _1456 = fma(_1446, _1452, _1454);
        _1406 = _1456;
    }
    float _1458 = _1406;
    float _1460 = _1450 * 0.5;
    if (!_1374)
    {
        float _1462 = _1458 * _1420;
        float _1464 = precise::clamp(_1462, 0.0, 1.0);
        _1442 = _1464;
    }
    float _1466 = _1442;
    float _1468 = -_1388;
    float _1470 = _1468 + 1.0;
    out.m_70.z = _1460;
    out.m_70.w = _1281;
    float _1472 = _1466 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1474 = _1470 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _1476 = _1466 > 0.0;
    bool _1478 = isnan(_1466);
    bool _1480 = _1476 || _1478;
    bool _1482 = isnan(0.0);
    bool _1484 = _1480 || _1482;
    float _1486 = _1472 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_45.x = _1486;
    float _1488 = _1474 * _1335;
    float _1490 = -_1474;
    float _1492 = _1490 + 1.0;
    float _1494 = _1346 * _1488;
    float _1496 = _1346 * _1492;
    float _1498 = _1360 * _1488;
    float _1500 = fma(_1356, _1494, _1340);
    float _1502 = fma(_1358, _1494, _1342);
    float _1504 = fma(_1346, _1498, _1344);
    out.m_72.x = _1500;
    out.m_72.y = _1502;
    out.m_72.z = _1504;
    out.m_72.w = _1496;
    if (_1484)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _1506 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1506;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

