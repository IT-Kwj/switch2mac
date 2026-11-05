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
    float4 m_62 [[user(locn0)]];
    float4 m_64 [[user(locn1)]];
    float4 m_70 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_68 [[user(locn5)]];
    float4 m_72 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_54 [[attribute(1)]];
    float4 m_56 [[attribute(2)]];
    float4 m_58 [[attribute(3)]];
    float4 m_60 [[attribute(4)]];
    float4 m_42 [[attribute(5)]];
    float4 m_47 [[attribute(6)]];
    float4 m_49 [[attribute(7)]];
    float4 m_66 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _559 = false;
    bool _275 = false;
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
        float _1989 = as_type<float>(_107);
        out.gl_Position.z = _1989;
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
    float _127 = 0.0;
    float _129 = _125;
    if (_121)
    {
        float _131 = float(_91);
        _127 = _131;
    }
    float _133 = _127;
    bool _135 = _125 >= _133;
    bool _137 = !_121;
    bool _139 = _135 || _137;
    if (_139)
    {
        _101 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _141 = _101;
    if (_139)
    {
        out.m_45.x = 0.0;
    }
    if (_139)
    {
        float _143 = _141 * 5.0;
        _109 = as_type<int>(_143);
    }
    int _145 = _109;
    if (_139)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2058 = as_type<float>(_145);
        out.gl_Position.z = _2058;
    }
    if (_139)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _147 = in.m_49.x;
    float _149 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _151 = _125 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _153 = as_type<float>(int(gl_VertexIndex));
    float _155 = _151 * _149;
    float _157 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[20].x, _155);
    int _159 = as_type<int>(_153) & 1;
    bool _161 = _159 != 0;
    int _163 = as_type<int>(_153) & 2;
    bool _165 = _163 != 0;
    float _167 = _157 * 6.283185482025146484375;
    float _169 = floor(_157);
    float _171 = _167 * 0.15915493667125701904296875;
    bool _173 = !_165;
    float _175 = _173 ? (-0.5) : 0.5;
    int _177 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _179 = _177 != 0;
    int _181 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _183 = _181 != 0;
    int _185 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _187 = _185 != 0;
    float _189 = _171 * 6.283185482025146484375;
    float _191 = cos(_189);
    bool _193 = !_161;
    float _195 = _193 ? (-0.5) : 0.5;
    bool _197 = !_179;
    int _199 = _197 ? 0 : 1;
    bool _201 = !_187;
    int _203 = _201 ? 0 : 1;
    int _205 = abs(_199);
    float _207 = -_169;
    float _209 = _157 + _207;
    int _211 = abs(_203);
    float _213 = -_209;
    float _215 = fma(_213, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _217 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _219 = float(_205);
    float _221 = fma(_191, 0.5, 0.5);
    bool _223 = !_183;
    int _225 = _223 ? 0 : 1;
    bool _227 = _209 < 0.5;
    float _229 = float(_227);
    float _231 = abs(_215);
    float _233 = _219 * _231;
    int _235 = abs(_225);
    float _237 = -_221;
    float _239 = fma(_237, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _241 = float(_211);
    float _243 = -_229;
    float _245 = fma(_243, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _247 = float(_235);
    float _249 = fma(_241, _239, _233);
    float _251 = abs(_245);
    float _253 = fma(_247, _251, _249);
    bool _255 = !_217;
    float _257 = 0.5;
    float _273;
    if (!_255)
    {
        float _259 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _261 = _147 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _263 = fma(_261, (*spvDescriptorSet0.vp_c9)._m0[12].x, _125);
        float _265 = _263 * _259;
        float _267 = floor(_265);
        float _269 = -_267;
        float _271 = _265 + _269;
        _273 = _271;
        _275 = true;
    }
    else
    {
        float _277 = float(_91);
        float _279 = 1.0 / _277;
        float _281 = _125 * _279;
        _273 = _281;
    }
    _275 = false;
    float _283 = _273;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _287 = _283 + _285;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _291 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _289;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _295 = _293 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _299 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _297;
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _303 = _301 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _305 = 1.0 / _291;
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _309 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _307;
    bool _311 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _313 = isnan(_283);
    bool _315 = _311 || _313;
    bool _317 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _319 = _315 || _317;
    float _321 = float(_319);
    float _323 = 1.0 / _295;
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _327 = _283 + _325;
    bool _329 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _331 = 1.0 / _303;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _335 = _283 + _333;
    float _337 = _327 * _305;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _341 = _283 + _339;
    float _343 = 1.0 / _309;
    float _345 = _287 * _323;
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _349 = _283 + _347;
    bool _351 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _353 = isnan(_283);
    bool _355 = _351 || _353;
    bool _357 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _359 = _355 || _357;
    float _361 = float(_359);
    float _363 = 1.0 / _299;
    float _365 = _335 * _331;
    bool _367 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _369 = isnan(_283);
    bool _371 = _367 || _369;
    bool _373 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _375 = _371 || _373;
    float _377 = float(_375);
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _379;
    float _383 = fma(_381, _337, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _385 = _349 * _343;
    bool _387 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _389 = isnan(_283);
    bool _391 = _387 || _389;
    bool _393 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _395 = _391 || _393;
    float _397 = float(_395);
    float _399 = -_361;
    float _401 = _399 + 1.0;
    float _403 = _377 * _401;
    float _405 = -_377;
    float _407 = _405 + 1.0;
    float _409 = _341 * _363;
    float _411 = -_321;
    float _413 = _411 + 1.0;
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _417 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _415;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _421 = _419 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _423 = _397 * _413;
    float _425 = fma(_417, _337, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _427 = -_397;
    float _429 = _427 + 1.0;
    bool _431 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _433 = isnan(_283);
    bool _435 = _431 || _433;
    bool _437 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _439 = _435 || _437;
    float _441 = float(_439);
    float _443 = fma(_421, _345, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _445 = _361 * _429;
    bool _447 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _449 = isnan(_283);
    bool _451 = _447 || _449;
    bool _453 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _455 = _451 || _453;
    float _457 = float(_455);
    float _459 = _441 * _407;
    float _461 = -_441;
    float _463 = _461 + 1.0;
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _467 = _465 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _469 = -_457;
    float _471 = _469 + 1.0;
    float _473 = _457 * _463;
    float _475 = fma(_467, _345, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _479 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _477;
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _483 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _481;
    float _485 = _425 * _473;
    float _487 = _383 * _473;
    float _489 = fma(_479, _409, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _491 = fma(_483, _409, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _493 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[143].x, _485);
    float _495 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[143].y, _487);
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _499 = _497 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _501 = fma(_475, _459, _493);
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _505 = _503 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _507 = fma(_443, _459, _495);
    float _509 = fma(_499, _365, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _513 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _511;
    float _515 = fma(_489, _403, _501);
    float _517 = fma(_505, _365, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _521 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _519;
    float _523 = fma(_491, _403, _507);
    float _525 = fma(_513, _385, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _527 = fma(_509, _445, _515);
    float _529 = fma(_521, _385, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _531 = fma(_517, _445, _523);
    float _533 = fma(_525, _423, _527);
    float _535 = fma(_529, _423, _531);
    float _537 = fma(_321, (*spvDescriptorSet0.vp_c9)._m0[148].x, _533);
    float _539 = fma(_321, (*spvDescriptorSet0.vp_c9)._m0[148].y, _535);
    bool _541 = !_329;
    float _557;
    if (!_541)
    {
        float _543 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _545 = _147 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _547 = fma(_545, (*spvDescriptorSet0.vp_c9)._m0[11].z, _125);
        float _549 = _547 * _543;
        float _551 = floor(_549);
        float _553 = -_551;
        float _555 = _549 + _553;
        _557 = _555;
        _559 = true;
    }
    else
    {
        float _561 = float(_91);
        float _563 = 1.0 / _561;
        float _565 = _125 * _563;
        _557 = _565;
    }
    _559 = false;
    float _567 = _557;
    float _569 = in.m_42.x;
    float _571 = in.m_42.y;
    float _573 = in.m_42.z;
    float _575 = _147 * 2.0;
    int _577 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _579 = _577 != 0;
    int _581 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _583 = _581 != 0;
    int _585 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _587 = _585 != 0;
    float _589 = in.m_54.x;
    float _591 = in.m_54.y;
    float _593 = in.m_54.z;
    bool _595 = _147 > 0.5;
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _599 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _597;
    float _601 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _603 = _601 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _605 = in.m_56.x;
    float _607 = in.m_56.y;
    float _609 = in.m_56.z;
    float _611 = floor(_575);
    float _613 = in.m_58.x;
    float _615 = in.m_58.y;
    float _617 = in.m_58.z;
    int _619 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _621 = _619 != 0;
    float _623 = in.m_49.z;
    float _625 = 1.0 / _603;
    int _627 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _629 = _627 != 0;
    float _631 = in.m_49.y;
    float _633 = 1.0 / _599;
    bool _635 = _611 > 0.0;
    float _637 = _571 * _591;
    bool _639 = _567 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _641 = isnan(_567);
    bool _643 = _639 || _641;
    bool _645 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _647 = _643 || _645;
    float _649 = float(_647);
    float _651 = _571 * _607;
    float _653 = fma(_569, _589, _637);
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _657 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _655;
    float _659 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _661 = _571 * _615;
    float _663 = fma(_569, _605, _651);
    float _665 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _667 = _567 + _665;
    float _669 = fma(_573, _593, _653);
    float _671 = fma(_569, _613, _661);
    float _673 = fma(_573, _609, _663);
    float _675 = _623 * 2.0;
    float _677 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _679 = log2(_677);
    float _681 = _631 * 2.0;
    float _683 = fma(_573, _617, _671);
    float _685 = -_195;
    int _687 = _595 ? as_type<int>(_685) : as_type<int>(_195);
    float _689 = _667 * _625;
    bool _691 = _611 >= 0.0;
    bool _693 = isnan(_611);
    bool _695 = _691 || _693;
    bool _697 = isnan(0.0);
    bool _699 = _695 || _697;
    float _701 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _703 = _567 + _701;
    float _705 = _631 + _623;
    float _707 = floor(_675);
    float _709 = _703 * _633;
    float _711 = _147 + _631;
    float _713 = _705 + (-1.0);
    int _715 = _699 ? 0 : 1;
    float _717 = _711 + (-1.0);
    float _719 = _679 * _125;
    float _721 = floor(_681);
    float _723 = fma(_713, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _725 = !_621;
    float _727 = _725 ? _195 : as_type<float>(_687);
    float _729 = fma(_657, _709, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _731 = _631 > 0.5;
    float _733 = _669 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _735 = _567 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _737 = isnan(_567);
    bool _739 = _735 || _737;
    bool _741 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _743 = _739 || _741;
    float _745 = float(_743);
    float _747 = _727 + 0.5;
    float _749 = exp2(_719);
    float _751 = fma(_717, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _753 = ~_715;
    int _755 = _753 + 1;
    int _757 = _755 + 1;
    float _759 = _747 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _761 = _757;
    if (!_635)
    {
        int _763 = ~_715;
        int _765 = _763 + 1;
        _761 = _765;
    }
    int _767 = _761;
    float _769 = _631 + (-0.5);
    bool _771 = _707 >= 0.0;
    bool _773 = isnan(_707);
    bool _775 = _771 || _773;
    bool _777 = isnan(0.0);
    bool _779 = _775 || _777;
    bool _781 = _721 >= 0.0;
    bool _783 = isnan(_721);
    bool _785 = _781 || _783;
    bool _787 = isnan(0.0);
    bool _789 = _785 || _787;
    int _791 = _779 ? 0 : 1;
    int _793 = _789 ? 0 : 1;
    bool _795 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _797 = isnan(0.0);
    bool _799 = _795 || _797;
    bool _801 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _803 = _799 || _801;
    float _805 = -_749;
    float _807 = _805 + 1.0;
    bool _809 = _707 > 0.0;
    bool _811 = _567 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _813 = isnan(_567);
    bool _815 = _811 || _813;
    bool _817 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _819 = _815 || _817;
    float _821 = float(_819);
    float _823 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _825 = _803 ? _807 : 0.0;
    float _827 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _829 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _827;
    float _831 = -_821;
    float _833 = _831 + 1.0;
    float _835 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _837 = 1.0 + _835;
    float _839 = -_175;
    int _841 = _731 ? as_type<int>(_839) : as_type<int>(_175);
    float _843 = fma(_829, _709, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    bool _845 = _721 > 0.0;
    float _847 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _849 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _847;
    float _851 = _745 * _833;
    float _853 = 1.0 / _837;
    float _855 = -_745;
    float _857 = _855 + 1.0;
    bool _859 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _861 = isnan(1.0);
    bool _863 = _859 || _861;
    bool _865 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _867 = _863 || _865;
    float _869 = fma(_849, _709, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _871 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _873 = _871 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _875 = _649 * _857;
    float _877 = -_649;
    float _879 = _877 + 1.0;
    bool _881 = !_629;
    float _883 = _881 ? _175 : as_type<float>(_841);
    float _885 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _887 = _885 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _889 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _891 = _889 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _893 = fma(_873, _689, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _895 = _729 * _875;
    float _897 = fma(_887, _689, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _899 = fma(_891, _689, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _901 = _843 * _875;
    int _903 = ~_793;
    int _905 = _903 + 1;
    int _907 = _905 + 1;
    int _909 = _907;
    if (_867)
    {
        float _911 = _825 * _853;
        _129 = _911;
    }
    float _913 = _129;
    if (!_845)
    {
        int _915 = ~_793;
        int _917 = _915 + 1;
        _909 = _917;
    }
    int _919 = _909;
    float _921 = fma(_879, (*spvDescriptorSet0.vp_c9)._m0[123].x, _901);
    bool _923 = !_583;
    int _925 = _923 ? 0 : 1;
    float _927 = _869 * _875;
    float _929 = -_883;
    float _931 = _929 + 0.5;
    float _933 = fma(_893, _851, _921);
    int _935 = abs(_925);
    float _937 = _759 * _823;
    bool _939 = !_587;
    int _941 = _939 ? 0 : 1;
    float _943 = fma(_879, (*spvDescriptorSet0.vp_c9)._m0[123].y, _927);
    float _945 = fma(_879, (*spvDescriptorSet0.vp_c9)._m0[123].z, _895);
    float _947 = float(_767);
    float _949 = _931 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _951 = !_579;
    int _953 = _951 ? 0 : 1;
    float _955 = fma(_899, _851, _945);
    int _957 = abs(_941);
    float _959 = _673 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _961 = float(_935);
    float _963 = _949 * _659;
    int _965 = abs(_953);
    float _967 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _969 = _959 + _967;
    float _971 = fma(_897, _851, _943);
    float _973 = _961 * _947;
    float _975 = in.m_60.x;
    float _977 = in.m_60.y;
    float _979 = in.m_60.z;
    float _981 = _683 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _983 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _985 = _733 + _983;
    float _987 = _969 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    out.m_62.x = _937;
    out.m_62.y = _963;
    float _989 = fma(_821, (*spvDescriptorSet0.vp_c9)._m0[125].x, _933);
    float _991 = fma(_821, (*spvDescriptorSet0.vp_c9)._m0[125].y, _971);
    float _993 = fma(_985, (*spvDescriptorSet0.vp_c8)._m0[28].x, _987);
    float _995 = fma(_821, (*spvDescriptorSet0.vp_c9)._m0[125].z, _955);
    float _997 = _969 * _969;
    int _999 = ~_791;
    int _1001 = _999 + 1;
    int _1003 = _1001 + 1;
    int _1005 = _1003;
    float _1007 = as_type<float>(_965);
    float _1009 = _981;
    if (!_809)
    {
        int _1011 = ~_791;
        int _1013 = _1011 + 1;
        _1005 = _1013;
    }
    int _1015 = _1005;
    float _1017 = fma(_985, _985, _997);
    float _1019 = float(_957);
    float _1021 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1023 = _981 + _1021;
    float _1025 = float(_919);
    float _1027 = float(_1015);
    float _1029 = fma(_1023, (*spvDescriptorSet0.vp_c8)._m0[28].z, _993);
    float _1031 = float(_965);
    float _1033 = _1019 * _1025;
    float _1035 = fma(_1023, _1023, _1017);
    float _1037 = _991 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _1039 = _1029 >= 0.0;
    float _1041 = _1031 * _1027;
    float _1043 = _973 * (-2.0);
    float _1045 = _1037 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1047 = rsqrt(_1035);
    float _1049 = fma(_1043, _977, _977);
    float _1051 = fma(_723, _1043, _723);
    float _1053 = _989 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1055 = _995 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1057 = fma(_769, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1049);
    float _1059 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1061 = _979;
    if (_1039)
    {
        _1007 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1063 = _1007;
    float _1065 = _1041 * (-2.0);
    float _1067 = _1053 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1069 = _1055 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1071 = as_type<int>(_1063);
    if (_1039)
    {
        float _1073 = _1063 * 5.0;
        _1071 = as_type<int>(_1073);
    }
    int _1075 = _1071;
    float _1077 = fma(_751, _1065, _751);
    float _1079 = _969 * _1047;
    out.m_64.x = _1067;
    out.m_64.y = _1045;
    out.m_64.z = _1069;
    out.m_64.w = _1059;
    float _1081 = fma(_1065, _975, _975);
    float _1083 = fma(_1051, _913, _1057);
    float _1085 = _147 + (-0.5);
    if (_1039)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3500 = as_type<float>(_1075);
        out.gl_Position.z = _3500;
    }
    float _1087 = _985 * _1047;
    float _1089 = _1023 * _1047;
    float _1091 = -_1079;
    float _1093 = fma(_1091, (*spvDescriptorSet0.vp_c9)._m0[18].w, _969);
    if (_1039)
    {
        out.m_45.x = 0.0;
    }
    if (_1039)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1095 = -_1079;
    float _1097 = fma(_1095, (*spvDescriptorSet0.vp_c9)._m0[18].w, _959);
    float _1099 = -_1087;
    float _1101 = fma(_1099, (*spvDescriptorSet0.vp_c9)._m0[18].w, _733);
    float _1103 = -_1089;
    float _1105 = fma(_1103, (*spvDescriptorSet0.vp_c9)._m0[18].w, _981);
    float _1107 = -_1087;
    float _1109 = fma(_1107, (*spvDescriptorSet0.vp_c9)._m0[18].w, _985);
    float _1111 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1113 = _1097 + _1111;
    float _1115 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1117 = _1101 + _1115;
    float _1119 = _1093 * _1093;
    float _1121 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1123 = _1105 + _1121;
    float _1125 = _1113 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1127 = fma(_1085, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1081);
    float _1129 = fma(_1109, _1109, _1119);
    float _1131 = -_1089;
    float _1133 = fma(_1131, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1023);
    float _1135 = fma(_1117, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1125);
    float _1137 = _147 + _623;
    float _1139 = fma(_1077, _913, _1127);
    float _1141 = fma(_1133, _1133, _1129);
    float _1143 = fma(_1123, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1135);
    float _1145 = in.m_66.x;
    float _1147 = in.m_66.y;
    float _1149 = _1137 + (-1.0);
    float _1151 = _1033 * (-2.0);
    bool _1153 = _1143 >= 0.0;
    float _1155 = _1139 * 0.15915493667125701904296875;
    float _1157 = fma(_1149, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1159 = fma(_1151, _979, _979);
    float _1161 = _623 + (-0.5);
    float _1163 = _1083 * 0.15915493667125701904296875;
    float _1165 = fma(_1157, _1151, _1157);
    float _1167 = sqrt(_1141);
    float _1169 = fma(_1161, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1159);
    float _1171 = fma(_1165, _913, _1169);
    float _1173 = _1097;
    if (_1153)
    {
        _1061 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1175 = _1061;
    float _1177 = _1163 * 6.283185482025146484375;
    float _1179 = sin(_1177);
    float _1181 = _1171 * 0.15915493667125701904296875;
    int _1183 = as_type<int>(_1175);
    if (_1153)
    {
        out.m_45.x = 0.0;
    }
    if (_1153)
    {
        float _1185 = _1175 * 5.0;
        _1183 = as_type<int>(_1185);
    }
    int _1187 = _1183;
    float _1189 = _539 * _1147;
    float _1191 = _1163 * 6.283185482025146484375;
    float _1193 = cos(_1191);
    if (_1153)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3694 = as_type<float>(_1187);
        out.gl_Position.z = _3694;
    }
    float _1195 = _1047 * _1167;
    float _1197 = _253 * _1189;
    float _1199 = _1155 * 6.283185482025146484375;
    float _1201 = sin(_1199);
    float _1203 = _1155 * 6.283185482025146484375;
    float _1205 = cos(_1203);
    float _1207 = _1181 * 6.283185482025146484375;
    float _1209 = sin(_1207);
    if (_1153)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1211 = _1181 * 6.283185482025146484375;
    float _1213 = cos(_1211);
    float _1215 = _1197 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1217 = _537 * _1145;
    float _1219 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _175);
    float _1221 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _195);
    float _1223 = _1195 * _1215;
    float _1225 = _253 * _1217;
    float _1227 = _1201 * _1179;
    float _1229 = _1219 * _1223;
    float _1231 = _1225 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1233 = _1205 * _1193;
    bool _1235 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1237 = isnan(0.5);
    bool _1239 = _1235 || _1237;
    bool _1241 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1243 = _1239 || _1241;
    float _1245 = _1195 * _1231;
    float _1247 = _1205 * _1179;
    float _1249 = _1213 * _1229;
    float _1251 = fma(_1209, _1233, _1227);
    float _1253 = _1221 * _1245;
    float _1255 = _1179 * _1213;
    float _1257 = _1205 * _1249;
    float _1259 = _1193 * _1213;
    float _1261 = _1201 * _1193;
    float _1263 = -_1229;
    float _1265 = _1209 * _1263;
    float _1267 = fma(_1251, _1253, _1257);
    float _1269 = _1195 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1271 = _1269 * 0.5;
    float _1273 = -_1261;
    float _1275 = fma(_1209, _1247, _1273);
    float _1277 = -_1247;
    float _1279 = fma(_1209, _1261, _1277);
    float _1281 = _1201 * _1249;
    float _1283 = fma(_1259, _1253, _1265);
    float _1285 = fma(_1275, _1271, _1267);
    float _1287 = fma(_1209, _1227, _1233);
    float _1289 = fma(_1279, _1253, _1281);
    float _1291 = fma(_1255, _1271, _1283);
    float _1293 = _1285 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1295 = fma(_1287, _1271, _1289);
    float _1297 = _1285 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1299 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1293);
    float _1301 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1297);
    float _1303 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1299);
    float _1305 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1301);
    float _1307 = _1303 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1309 = _1305 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1311 = _981 + _1307;
    float _1313 = _733 + _1309;
    float _1315 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1317 = _1311 + _1315;
    float _1319 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1321 = _1313 + _1319;
    float _1323 = _1317 * _1317;
    float _1325 = fma(_1321, _1321, _1323);
    float _1327 = _1285 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1329 = sqrt(_1325);
    float _1331 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1327);
    float _1333 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1331);
    float _1335 = _1333 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1337 = _959 + _1335;
    bool _1339 = _1329 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1341 = _1271;
    float _1343 = _1313;
    float _1345 = _1311;
    float _1347 = _1321;
    if (!_1339)
    {
        _1341 = _1337;
    }
    float _1349 = _1341;
    bool _1351 = !_1339;
    float _1353 = _1349;
    if (!_1351)
    {
        float _1355 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1357 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1359 = _1329 + _1357;
        float _1361 = rsqrt(_1325);
        float _1363 = _1359 * _1355;
        float _1365 = _1337 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1367 = _1363 * 0.15915493667125701904296875;
        float _1369 = _1367 * 6.283185482025146484375;
        float _1371 = cos(_1369);
        float _1373 = _1367 * 6.283185482025146484375;
        float _1375 = sin(_1373);
        float _1377 = _1371 + (-1.0);
        float _1379 = fma(_1375, _1365, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1381 = _1377 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1383 = _1361 * _1379;
        float _1385 = fma(_1337, _1371, _1381);
        float _1387 = fma(_1321, _1383, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1389 = fma(_1317, _1383, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1343 = _1387;
        _1353 = _1385;
        _1345 = _1389;
    }
    float _1391 = _1343;
    float _1393 = _1353;
    float _1395 = _1345;
    float _1397 = -_1087;
    float _1399 = fma(_1397, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1391);
    float _1401 = -_1079;
    float _1403 = fma(_1401, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1393);
    float _1405 = -_1089;
    float _1407 = fma(_1405, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1395);
    float _1409 = _1403;
    float _1411 = _1399;
    float _1413 = _1407;
    if (!_1243)
    {
        float _1415 = _1113 * _1113;
        float _1417 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1419 = -_959;
        float _1421 = _1419 + _1393;
        float _1423 = -_981;
        float _1425 = _1423 + _1395;
        float _1427 = fma(_1117, _1117, _1415);
        float _1429 = fma(_1123, _1123, _1427);
        float _1431 = 1.0 / _1195;
        float _1433 = sqrt(_1429);
        float _1435 = precise::min(_1433, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1437 = _1435 * _1417;
        float _1439 = -_733;
        float _1441 = _1439 + _1391;
        float _1443 = _1437 * _1431;
        float _1445 = fma(_1441, _1443, _1101);
        float _1447 = fma(_1421, _1443, _1097);
        float _1449 = fma(_1425, _1443, _1105);
        _1409 = _1447;
        _1411 = _1445;
        _1413 = _1449;
    }
    float _1451 = _1409;
    float _1453 = _1411;
    float _1455 = _1413;
    float _1457 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1459 = _1451 + _1457;
    float _1461 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1463 = _1453 + _1461;
    float _1465 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1467 = _1455 + _1465;
    float _1469 = _1459 * _1459;
    float _1471 = fma(_1463, _1463, _1469);
    float _1473 = fma(_1467, _1467, _1471);
    float _1475 = rsqrt(_1473);
    float _1477 = sqrt(_1473);
    float _1479 = _1475 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1481 = _1463 * _1479;
    float _1483 = _1467 * _1479;
    float _1485 = _1481 * _1481;
    float _1487 = _1483 * _1483;
    float _1489 = _1485 + _1487;
    float _1491 = sqrt(_1489);
    bool _1493 = _1491 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1495 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1497 = _1491 + _1495;
    float _1499 = _1475;
    float _1501 = _1497;
    float _1503 = _1459;
    float _1505 = _1481;
    if (_1493)
    {
        float _1507 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1499 = _1507;
    }
    float _1509 = _1499;
    float _1511 = _1509;
    if (_1493)
    {
        float _1513 = _1497 * _1509;
        _1501 = _1513;
    }
    float _1515 = _1501;
    if (_1493)
    {
        float _1517 = rsqrt(_1489);
        _1511 = _1517;
    }
    float _1519 = _1511;
    float _1521 = _1519;
    if (_1493)
    {
        float _1523 = _1515 * 0.15915493667125701904296875;
        _1347 = _1523;
    }
    float _1525 = _1347;
    float _1527 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1529 = _1467;
    float _1531 = _1525;
    if (_1493)
    {
        float _1533 = _1525 * 6.283185482025146484375;
        float _1535 = sin(_1533);
        _1529 = _1535;
    }
    float _1537 = _1529;
    float _1539 = precise::max(0.0, _1527);
    float _1541 = _1393;
    float _1543 = _1539;
    if (_1493)
    {
        float _1545 = _1525 * 6.283185482025146484375;
        float _1547 = cos(_1545);
        _1541 = _1547;
    }
    float _1549 = _1541;
    float _1551 = -_1479;
    float _1553 = -_1539;
    float _1555 = fma(_1459, _1551, _1553);
    if (_1493)
    {
        float _1557 = _1555 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1503 = _1557;
    }
    float _1559 = _1503;
    float _1561 = _1537;
    float _1563 = _1559;
    if (_1493)
    {
        float _1565 = fma(_1537, _1559, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1561 = _1565;
    }
    float _1567 = _1561;
    float _1569 = _1567;
    if (!_1493)
    {
        _1563 = _1487;
    }
    float _1571 = _1563;
    float _1573 = _1571;
    if (_1493)
    {
        float _1575 = _1519 * _1567;
        _1009 = _1575;
    }
    float _1577 = _1009;
    if (!_1493)
    {
        _1521 = _1555;
    }
    float _1579 = _1521;
    float _1581 = _1579;
    if (_1493)
    {
        float _1583 = _1549 + (-1.0);
        _1543 = _1583;
    }
    float _1585 = _1543;
    float _1587 = _1585;
    if (_1493)
    {
        float _1589 = _1481 * _1577;
        _1505 = _1589;
    }
    float _1591 = _1505;
    if (!_1493)
    {
        _1569 = _1483;
    }
    float _1593 = _1569;
    float _1595 = _1593;
    if (_1493)
    {
        float _1597 = _1483 * _1577;
        _1595 = _1597;
    }
    float _1599 = _1595;
    if (_1493)
    {
        float _1601 = _1585 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1531 = _1601;
    }
    float _1603 = _1531;
    if (!_1493)
    {
        _1587 = _1485;
    }
    float _1605 = _1587;
    float _1607 = _1605;
    if (_1493)
    {
        float _1609 = _1591 * _1591;
        _1607 = _1609;
    }
    float _1611 = _1607;
    if (_1493)
    {
        float _1613 = _1599 * _1599;
        _1573 = _1613;
    }
    float _1615 = _1573;
    if (_1493)
    {
        float _1617 = fma(_1555, _1549, _1603);
        _1581 = _1617;
    }
    float _1619 = _1581;
    float _1621 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1623 = fma(_1619, _1619, _1611);
    float _1625 = _1451 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1627 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1629 = fma(_1477, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1627);
    float _1631 = precise::clamp(_1629, 0.0, 1.0);
    float _1633 = _1451 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1635 = _1623 + _1615;
    float _1637 = fma(_1453, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1625);
    float _1639 = _1451 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1641 = -_1631;
    float _1643 = _1641 + 1.0;
    float _1645 = rsqrt(_1635);
    float _1647 = fma(_1455, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1637);
    float _1649 = fma(_1453, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1639);
    float _1651 = _1451 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1653 = _1647 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1655 = fma(_1455, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1649);
    float _1657 = fma(_1453, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1651);
    float _1659 = abs(_1643);
    float _1661 = log2(_1659);
    float _1663 = fma(_1453, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1633);
    float _1665 = _1655 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1667 = fma(_1455, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1657);
    float _1669 = _1653 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1671 = fma(_1455, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1663);
    float _1673 = _1667 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1675 = _1645 * _1591;
    float _1677 = _1665 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1679 = _1645 * _1619;
    float _1681 = _1645 * _1599;
    float _1683 = _1675 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1685 = fma(_1673, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1677);
    float _1687 = -_1669;
    float _1689 = fma(_1687, _1621, 1.0);
    float _1691 = _1671 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1693 = _1661 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1695 = -_1683;
    float _1697 = fma(_1679, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1695);
    float _1699 = fma(_1653, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1685);
    float _1701 = _1665 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1703 = log2(_1689);
    float _1705 = -_1681;
    float _1707 = fma(_1705, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1697);
    float _1709 = fma(_1691, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1699);
    float _1711 = _1665 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1713 = fma(_1673, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1701);
    float _1715 = fma(_1707, -0.5, 0.5);
    float _1717 = fma(_1707, 0.5, 0.5);
    float _1719 = fma(_1673, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1711);
    float _1721 = exp2(_1693);
    float _1723 = _1679 + 1.0;
    float _1725 = fma(_1653, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1713);
    float _1727 = fma(_1653, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1719);
    float _1729 = fma(_1717, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1731 = 1.0 / _1709;
    float _1733 = fma(_1717, _1729, -0.212114393711090087890625);
    float _1735 = _1703 * 0.693147182464599609375;
    float _1737 = fma(_1717, _1733, 1.570728778839111328125);
    float _1739 = _1735 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1741 = sqrt(_1715);
    float _1743 = -_1679;
    float _1745 = fma(_1721, _1723, _1743);
    float _1747 = fma(_1691, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1727);
    float _1749 = fma(_1691, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1725);
    float _1751 = fma(_1745, 0.5, 0.5);
    float _1753 = _1747 * _1731;
    float _1755 = _1749 * _1731;
    float _1757 = fma(_1753, 0.5, 0.5);
    float _1759 = fma(_1755, -0.5, 0.5);
    float _1761 = _1741 * 0.636619746685028076171875;
    float3 _4622 = float3(_1757, _1759, _1739);
    float _1763 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4622, float3(0.0), isnan(_4622)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4622, float3(0.0), isnan(_4622)), level(0.0)).x;
    float3 _4633 = float3(_1757, _1759, _1739);
    float4 _1766 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4633, float3(0.0), isnan(_4633)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4633, float3(0.0), isnan(_4633)), level(0.0)).xyzw;
    float _1768 = _1766.x;
    float _1770 = _1766.y;
    float _1772 = _1766.z;
    float _1774 = _1766.w;
    float _1776 = -_1737;
    float _1778 = fma(_1761, _1776, 1.0);
    float2 _4655 = float2(_1778, _1751);
    float3 _1782 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4655, float2(0.0), isnan(_4655)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4655, float2(0.0), isnan(_4655)), level(0.0)).xyz;
    float _1784 = _1782.x;
    float _1786 = _1782.y;
    float _1788 = _1782.z;
    float _1790 = _1097 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _1792 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1794 = isnan(0.5);
    bool _1796 = _1792 || _1794;
    bool _1798 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1800 = _1796 || _1798;
    float _1802 = _1665 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_68.y = _1451;
    float _1804 = fma(_1101, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1790);
    float _1806 = _1097 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1808 = fma(_1673, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1802);
    float _1810 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1804);
    float _1812 = fma(_1101, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1806);
    float _1814 = fma(_1653, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1808);
    float _1816 = _1810 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1818 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1812);
    float _1820 = _1810;
    float _1822 = _1661;
    if (!_1800)
    {
        _257 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1824 = _257;
    float _1826 = _1661 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1828 = 1.0 / _1816;
    float _1830 = _1818 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    if (!_1800)
    {
        _1820 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1832 = _1820;
    float _1834 = fma(_1691, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1814);
    if (_1800)
    {
        _1822 = 1.0;
    }
    float _1836 = _1822;
    float _1838 = _1830 + _1816;
    float _1840 = _1836;
    if (!_1800)
    {
        float _1842 = -_1832;
        float _1844 = _1842 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1173 = _1844;
    }
    float _1846 = _1173;
    float _1848 = exp2(_1826);
    float _1850 = _1834 + _1709;
    float _1852 = _1838 * _1828;
    float _1854 = _1852 * 0.5;
    float _1856 = _1846;
    float _1858 = _1854;
    if (!_1800)
    {
        float _1860 = 1.0 / _1846;
        _1856 = _1860;
    }
    float _1862 = _1856;
    if (!_1800)
    {
        float _1864 = -_1824;
        float _1866 = fma(_1854, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1864);
        _1858 = _1866;
    }
    float _1868 = _1858;
    float _1870 = _1824;
    if (!_1800)
    {
        float _1872 = 1.0 / _1868;
        _1870 = _1872;
    }
    float _1874 = _1870;
    float _1876 = _1850 * 0.5;
    float _1878 = _1874;
    if (!_1800)
    {
        float _1880 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1882 = -_1832;
        float _1884 = fma(_1874, _1880, _1882);
        _1878 = _1884;
    }
    float _1886 = _1878;
    if (!_1800)
    {
        float _1888 = _1886 * _1862;
        float _1890 = precise::clamp(_1888, 0.0, 1.0);
        _1840 = _1890;
    }
    float _1892 = _1840;
    float _1894 = -_1848;
    float _1896 = _1894 + 1.0;
    float _1898 = _1892 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1900 = _1896 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _1902 = _1892 > 0.0;
    bool _1904 = isnan(_1892);
    bool _1906 = _1902 || _1904;
    bool _1908 = isnan(0.0);
    bool _1910 = _1906 || _1908;
    out.gl_Position.x = _1747;
    out.gl_Position.y = _1749;
    out.gl_Position.z = _1834;
    out.gl_Position.w = _1709;
    float _1912 = -_1900;
    float _1914 = _1912 + 1.0;
    float _1916 = _1898 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_70.z = _1876;
    out.m_70.w = _1709;
    out.m_45.x = _1916;
    float _1918 = _1900 * _1763;
    float _1920 = _1774 * _1918;
    float _1922 = _1774 * _1914;
    float _1924 = _1788 * _1918;
    float _1926 = fma(_1784, _1920, _1768);
    float _1928 = fma(_1786, _1920, _1770);
    float _1930 = fma(_1774, _1924, _1772);
    out.m_72.x = _1926;
    out.m_72.y = _1928;
    out.m_72.z = _1930;
    out.m_72.w = _1922;
    if (_1910)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _1932 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1932;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _559 = false;
    bool _275 = false;
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
        float _1989 = as_type<float>(_107);
        out.gl_Position.z = _1989;
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
    float _127 = 0.0;
    float _129 = _125;
    if (_121)
    {
        float _131 = float(_91);
        _127 = _131;
    }
    float _133 = _127;
    bool _135 = _125 >= _133;
    bool _137 = !_121;
    bool _139 = _135 || _137;
    if (_139)
    {
        _101 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _141 = _101;
    if (_139)
    {
        out.m_45.x = 0.0;
    }
    if (_139)
    {
        float _143 = _141 * 5.0;
        _109 = as_type<int>(_143);
    }
    int _145 = _109;
    if (_139)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2058 = as_type<float>(_145);
        out.gl_Position.z = _2058;
    }
    if (_139)
    {
        return out;
    }
    float _147 = in.m_49.x;
    float _149 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _151 = _125 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _153 = as_type<float>(int(gl_VertexIndex));
    float _155 = _151 * _149;
    float _157 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[20].x, _155);
    int _159 = as_type<int>(_153) & 1;
    bool _161 = _159 != 0;
    int _163 = as_type<int>(_153) & 2;
    bool _165 = _163 != 0;
    float _167 = _157 * 6.283185482025146484375;
    float _169 = floor(_157);
    float _171 = _167 * 0.15915493667125701904296875;
    bool _173 = !_165;
    float _175 = _173 ? (-0.5) : 0.5;
    int _177 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _179 = _177 != 0;
    int _181 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _183 = _181 != 0;
    int _185 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _187 = _185 != 0;
    float _189 = _171 * 6.283185482025146484375;
    float _191 = cos(_189);
    bool _193 = !_161;
    float _195 = _193 ? (-0.5) : 0.5;
    bool _197 = !_179;
    int _199 = _197 ? 0 : 1;
    bool _201 = !_187;
    int _203 = _201 ? 0 : 1;
    int _205 = abs(_199);
    float _207 = -_169;
    float _209 = _157 + _207;
    int _211 = abs(_203);
    float _213 = -_209;
    float _215 = fma(_213, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _217 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _219 = float(_205);
    float _221 = fma(_191, 0.5, 0.5);
    bool _223 = !_183;
    int _225 = _223 ? 0 : 1;
    bool _227 = _209 < 0.5;
    float _229 = float(_227);
    float _231 = abs(_215);
    float _233 = _219 * _231;
    int _235 = abs(_225);
    float _237 = -_221;
    float _239 = fma(_237, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _241 = float(_211);
    float _243 = -_229;
    float _245 = fma(_243, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _247 = float(_235);
    float _249 = fma(_241, _239, _233);
    float _251 = abs(_245);
    float _253 = fma(_247, _251, _249);
    bool _255 = !_217;
    float _257 = 0.5;
    float _273;
    if (!_255)
    {
        float _259 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _261 = _147 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _263 = fma(_261, (*spvDescriptorSet0.vp_c9)._m0[12].x, _125);
        float _265 = _263 * _259;
        float _267 = floor(_265);
        float _269 = -_267;
        float _271 = _265 + _269;
        _273 = _271;
        _275 = true;
    }
    else
    {
        float _277 = float(_91);
        float _279 = 1.0 / _277;
        float _281 = _125 * _279;
        _273 = _281;
    }
    _275 = false;
    float _283 = _273;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _287 = _283 + _285;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _291 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _289;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _295 = _293 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _299 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _297;
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _303 = _301 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _305 = 1.0 / _291;
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _309 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _307;
    bool _311 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _313 = isnan(_283);
    bool _315 = _311 || _313;
    bool _317 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _319 = _315 || _317;
    float _321 = float(_319);
    float _323 = 1.0 / _295;
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _327 = _283 + _325;
    bool _329 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _331 = 1.0 / _303;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _335 = _283 + _333;
    float _337 = _327 * _305;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _341 = _283 + _339;
    float _343 = 1.0 / _309;
    float _345 = _287 * _323;
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _349 = _283 + _347;
    bool _351 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _353 = isnan(_283);
    bool _355 = _351 || _353;
    bool _357 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _359 = _355 || _357;
    float _361 = float(_359);
    float _363 = 1.0 / _299;
    float _365 = _335 * _331;
    bool _367 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _369 = isnan(_283);
    bool _371 = _367 || _369;
    bool _373 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _375 = _371 || _373;
    float _377 = float(_375);
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _379;
    float _383 = fma(_381, _337, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _385 = _349 * _343;
    bool _387 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _389 = isnan(_283);
    bool _391 = _387 || _389;
    bool _393 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _395 = _391 || _393;
    float _397 = float(_395);
    float _399 = -_361;
    float _401 = _399 + 1.0;
    float _403 = _377 * _401;
    float _405 = -_377;
    float _407 = _405 + 1.0;
    float _409 = _341 * _363;
    float _411 = -_321;
    float _413 = _411 + 1.0;
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _417 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _415;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _421 = _419 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _423 = _397 * _413;
    float _425 = fma(_417, _337, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _427 = -_397;
    float _429 = _427 + 1.0;
    bool _431 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _433 = isnan(_283);
    bool _435 = _431 || _433;
    bool _437 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _439 = _435 || _437;
    float _441 = float(_439);
    float _443 = fma(_421, _345, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _445 = _361 * _429;
    bool _447 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _449 = isnan(_283);
    bool _451 = _447 || _449;
    bool _453 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _455 = _451 || _453;
    float _457 = float(_455);
    float _459 = _441 * _407;
    float _461 = -_441;
    float _463 = _461 + 1.0;
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _467 = _465 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _469 = -_457;
    float _471 = _469 + 1.0;
    float _473 = _457 * _463;
    float _475 = fma(_467, _345, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _479 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _477;
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _483 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _481;
    float _485 = _425 * _473;
    float _487 = _383 * _473;
    float _489 = fma(_479, _409, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _491 = fma(_483, _409, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _493 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[143].x, _485);
    float _495 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[143].y, _487);
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _499 = _497 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _501 = fma(_475, _459, _493);
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _505 = _503 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _507 = fma(_443, _459, _495);
    float _509 = fma(_499, _365, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _513 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _511;
    float _515 = fma(_489, _403, _501);
    float _517 = fma(_505, _365, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _521 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _519;
    float _523 = fma(_491, _403, _507);
    float _525 = fma(_513, _385, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _527 = fma(_509, _445, _515);
    float _529 = fma(_521, _385, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _531 = fma(_517, _445, _523);
    float _533 = fma(_525, _423, _527);
    float _535 = fma(_529, _423, _531);
    float _537 = fma(_321, (*spvDescriptorSet0.vp_c9)._m0[148].x, _533);
    float _539 = fma(_321, (*spvDescriptorSet0.vp_c9)._m0[148].y, _535);
    bool _541 = !_329;
    float _557;
    if (!_541)
    {
        float _543 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _545 = _147 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _547 = fma(_545, (*spvDescriptorSet0.vp_c9)._m0[11].z, _125);
        float _549 = _547 * _543;
        float _551 = floor(_549);
        float _553 = -_551;
        float _555 = _549 + _553;
        _557 = _555;
        _559 = true;
    }
    else
    {
        float _561 = float(_91);
        float _563 = 1.0 / _561;
        float _565 = _125 * _563;
        _557 = _565;
    }
    _559 = false;
    float _567 = _557;
    float _569 = in.m_42.x;
    float _571 = in.m_42.y;
    float _573 = in.m_42.z;
    float _575 = _147 * 2.0;
    int _577 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _579 = _577 != 0;
    int _581 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _583 = _581 != 0;
    int _585 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _587 = _585 != 0;
    float _589 = in.m_54.x;
    float _591 = in.m_54.y;
    float _593 = in.m_54.z;
    bool _595 = _147 > 0.5;
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _599 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _597;
    float _601 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _603 = _601 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _605 = in.m_56.x;
    float _607 = in.m_56.y;
    float _609 = in.m_56.z;
    float _611 = floor(_575);
    float _613 = in.m_58.x;
    float _615 = in.m_58.y;
    float _617 = in.m_58.z;
    int _619 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _621 = _619 != 0;
    float _623 = in.m_49.z;
    float _625 = 1.0 / _603;
    int _627 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _629 = _627 != 0;
    float _631 = in.m_49.y;
    float _633 = 1.0 / _599;
    bool _635 = _611 > 0.0;
    float _637 = _571 * _591;
    bool _639 = _567 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _641 = isnan(_567);
    bool _643 = _639 || _641;
    bool _645 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _647 = _643 || _645;
    float _649 = float(_647);
    float _651 = _571 * _607;
    float _653 = fma(_569, _589, _637);
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _657 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _655;
    float _659 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _661 = _571 * _615;
    float _663 = fma(_569, _605, _651);
    float _665 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _667 = _567 + _665;
    float _669 = fma(_573, _593, _653);
    float _671 = fma(_569, _613, _661);
    float _673 = fma(_573, _609, _663);
    float _675 = _623 * 2.0;
    float _677 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _679 = log2(_677);
    float _681 = _631 * 2.0;
    float _683 = fma(_573, _617, _671);
    float _685 = -_195;
    int _687 = _595 ? as_type<int>(_685) : as_type<int>(_195);
    float _689 = _667 * _625;
    bool _691 = _611 >= 0.0;
    bool _693 = isnan(_611);
    bool _695 = _691 || _693;
    bool _697 = isnan(0.0);
    bool _699 = _695 || _697;
    float _701 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _703 = _567 + _701;
    float _705 = _631 + _623;
    float _707 = floor(_675);
    float _709 = _703 * _633;
    float _711 = _147 + _631;
    float _713 = _705 + (-1.0);
    int _715 = _699 ? 0 : 1;
    float _717 = _711 + (-1.0);
    float _719 = _679 * _125;
    float _721 = floor(_681);
    float _723 = fma(_713, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _725 = !_621;
    float _727 = _725 ? _195 : as_type<float>(_687);
    float _729 = fma(_657, _709, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _731 = _631 > 0.5;
    float _733 = _669 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _735 = _567 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _737 = isnan(_567);
    bool _739 = _735 || _737;
    bool _741 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _743 = _739 || _741;
    float _745 = float(_743);
    float _747 = _727 + 0.5;
    float _749 = exp2(_719);
    float _751 = fma(_717, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _753 = ~_715;
    int _755 = _753 + 1;
    int _757 = _755 + 1;
    float _759 = _747 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _761 = _757;
    if (!_635)
    {
        int _763 = ~_715;
        int _765 = _763 + 1;
        _761 = _765;
    }
    int _767 = _761;
    float _769 = _631 + (-0.5);
    bool _771 = _707 >= 0.0;
    bool _773 = isnan(_707);
    bool _775 = _771 || _773;
    bool _777 = isnan(0.0);
    bool _779 = _775 || _777;
    bool _781 = _721 >= 0.0;
    bool _783 = isnan(_721);
    bool _785 = _781 || _783;
    bool _787 = isnan(0.0);
    bool _789 = _785 || _787;
    int _791 = _779 ? 0 : 1;
    int _793 = _789 ? 0 : 1;
    bool _795 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _797 = isnan(0.0);
    bool _799 = _795 || _797;
    bool _801 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _803 = _799 || _801;
    float _805 = -_749;
    float _807 = _805 + 1.0;
    bool _809 = _707 > 0.0;
    bool _811 = _567 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _813 = isnan(_567);
    bool _815 = _811 || _813;
    bool _817 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _819 = _815 || _817;
    float _821 = float(_819);
    float _823 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _825 = _803 ? _807 : 0.0;
    float _827 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _829 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _827;
    float _831 = -_821;
    float _833 = _831 + 1.0;
    float _835 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _837 = 1.0 + _835;
    float _839 = -_175;
    int _841 = _731 ? as_type<int>(_839) : as_type<int>(_175);
    float _843 = fma(_829, _709, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    bool _845 = _721 > 0.0;
    float _847 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _849 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _847;
    float _851 = _745 * _833;
    float _853 = 1.0 / _837;
    float _855 = -_745;
    float _857 = _855 + 1.0;
    bool _859 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _861 = isnan(1.0);
    bool _863 = _859 || _861;
    bool _865 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _867 = _863 || _865;
    float _869 = fma(_849, _709, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _871 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _873 = _871 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _875 = _649 * _857;
    float _877 = -_649;
    float _879 = _877 + 1.0;
    bool _881 = !_629;
    float _883 = _881 ? _175 : as_type<float>(_841);
    float _885 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _887 = _885 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _889 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _891 = _889 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _893 = fma(_873, _689, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _895 = _729 * _875;
    float _897 = fma(_887, _689, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _899 = fma(_891, _689, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _901 = _843 * _875;
    int _903 = ~_793;
    int _905 = _903 + 1;
    int _907 = _905 + 1;
    int _909 = _907;
    if (_867)
    {
        float _911 = _825 * _853;
        _129 = _911;
    }
    float _913 = _129;
    if (!_845)
    {
        int _915 = ~_793;
        int _917 = _915 + 1;
        _909 = _917;
    }
    int _919 = _909;
    float _921 = fma(_879, (*spvDescriptorSet0.vp_c9)._m0[123].x, _901);
    bool _923 = !_583;
    int _925 = _923 ? 0 : 1;
    float _927 = _869 * _875;
    float _929 = -_883;
    float _931 = _929 + 0.5;
    float _933 = fma(_893, _851, _921);
    int _935 = abs(_925);
    float _937 = _759 * _823;
    bool _939 = !_587;
    int _941 = _939 ? 0 : 1;
    float _943 = fma(_879, (*spvDescriptorSet0.vp_c9)._m0[123].y, _927);
    float _945 = fma(_879, (*spvDescriptorSet0.vp_c9)._m0[123].z, _895);
    float _947 = float(_767);
    float _949 = _931 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _951 = !_579;
    int _953 = _951 ? 0 : 1;
    float _955 = fma(_899, _851, _945);
    int _957 = abs(_941);
    float _959 = _673 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _961 = float(_935);
    float _963 = _949 * _659;
    int _965 = abs(_953);
    float _967 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _969 = _959 + _967;
    float _971 = fma(_897, _851, _943);
    float _973 = _961 * _947;
    float _975 = in.m_60.x;
    float _977 = in.m_60.y;
    float _979 = in.m_60.z;
    float _981 = _683 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _983 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _985 = _733 + _983;
    float _987 = _969 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    out.m_62.x = _937;
    out.m_62.y = _963;
    float _989 = fma(_821, (*spvDescriptorSet0.vp_c9)._m0[125].x, _933);
    float _991 = fma(_821, (*spvDescriptorSet0.vp_c9)._m0[125].y, _971);
    float _993 = fma(_985, (*spvDescriptorSet0.vp_c8)._m0[28].x, _987);
    float _995 = fma(_821, (*spvDescriptorSet0.vp_c9)._m0[125].z, _955);
    float _997 = _969 * _969;
    int _999 = ~_791;
    int _1001 = _999 + 1;
    int _1003 = _1001 + 1;
    int _1005 = _1003;
    float _1007 = as_type<float>(_965);
    float _1009 = _981;
    if (!_809)
    {
        int _1011 = ~_791;
        int _1013 = _1011 + 1;
        _1005 = _1013;
    }
    int _1015 = _1005;
    float _1017 = fma(_985, _985, _997);
    float _1019 = float(_957);
    float _1021 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1023 = _981 + _1021;
    float _1025 = float(_919);
    float _1027 = float(_1015);
    float _1029 = fma(_1023, (*spvDescriptorSet0.vp_c8)._m0[28].z, _993);
    float _1031 = float(_965);
    float _1033 = _1019 * _1025;
    float _1035 = fma(_1023, _1023, _1017);
    float _1037 = _991 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _1039 = _1029 >= 0.0;
    float _1041 = _1031 * _1027;
    float _1043 = _973 * (-2.0);
    float _1045 = _1037 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1047 = rsqrt(_1035);
    float _1049 = fma(_1043, _977, _977);
    float _1051 = fma(_723, _1043, _723);
    float _1053 = _989 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1055 = _995 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1057 = fma(_769, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1049);
    float _1059 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1061 = _979;
    if (_1039)
    {
        _1007 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1063 = _1007;
    float _1065 = _1041 * (-2.0);
    float _1067 = _1053 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1069 = _1055 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1071 = as_type<int>(_1063);
    if (_1039)
    {
        float _1073 = _1063 * 5.0;
        _1071 = as_type<int>(_1073);
    }
    int _1075 = _1071;
    float _1077 = fma(_751, _1065, _751);
    float _1079 = _969 * _1047;
    out.m_64.x = _1067;
    out.m_64.y = _1045;
    out.m_64.z = _1069;
    out.m_64.w = _1059;
    float _1081 = fma(_1065, _975, _975);
    float _1083 = fma(_1051, _913, _1057);
    float _1085 = _147 + (-0.5);
    if (_1039)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3500 = as_type<float>(_1075);
        out.gl_Position.z = _3500;
    }
    float _1087 = _985 * _1047;
    float _1089 = _1023 * _1047;
    float _1091 = -_1079;
    float _1093 = fma(_1091, (*spvDescriptorSet0.vp_c9)._m0[18].w, _969);
    if (_1039)
    {
        out.m_45.x = 0.0;
    }
    if (_1039)
    {
        return out;
    }
    float _1095 = -_1079;
    float _1097 = fma(_1095, (*spvDescriptorSet0.vp_c9)._m0[18].w, _959);
    float _1099 = -_1087;
    float _1101 = fma(_1099, (*spvDescriptorSet0.vp_c9)._m0[18].w, _733);
    float _1103 = -_1089;
    float _1105 = fma(_1103, (*spvDescriptorSet0.vp_c9)._m0[18].w, _981);
    float _1107 = -_1087;
    float _1109 = fma(_1107, (*spvDescriptorSet0.vp_c9)._m0[18].w, _985);
    float _1111 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1113 = _1097 + _1111;
    float _1115 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1117 = _1101 + _1115;
    float _1119 = _1093 * _1093;
    float _1121 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1123 = _1105 + _1121;
    float _1125 = _1113 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1127 = fma(_1085, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1081);
    float _1129 = fma(_1109, _1109, _1119);
    float _1131 = -_1089;
    float _1133 = fma(_1131, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1023);
    float _1135 = fma(_1117, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1125);
    float _1137 = _147 + _623;
    float _1139 = fma(_1077, _913, _1127);
    float _1141 = fma(_1133, _1133, _1129);
    float _1143 = fma(_1123, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1135);
    float _1145 = in.m_66.x;
    float _1147 = in.m_66.y;
    float _1149 = _1137 + (-1.0);
    float _1151 = _1033 * (-2.0);
    bool _1153 = _1143 >= 0.0;
    float _1155 = _1139 * 0.15915493667125701904296875;
    float _1157 = fma(_1149, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1159 = fma(_1151, _979, _979);
    float _1161 = _623 + (-0.5);
    float _1163 = _1083 * 0.15915493667125701904296875;
    float _1165 = fma(_1157, _1151, _1157);
    float _1167 = sqrt(_1141);
    float _1169 = fma(_1161, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1159);
    float _1171 = fma(_1165, _913, _1169);
    float _1173 = _1097;
    if (_1153)
    {
        _1061 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1175 = _1061;
    float _1177 = _1163 * 6.283185482025146484375;
    float _1179 = sin(_1177);
    float _1181 = _1171 * 0.15915493667125701904296875;
    int _1183 = as_type<int>(_1175);
    if (_1153)
    {
        out.m_45.x = 0.0;
    }
    if (_1153)
    {
        float _1185 = _1175 * 5.0;
        _1183 = as_type<int>(_1185);
    }
    int _1187 = _1183;
    float _1189 = _539 * _1147;
    float _1191 = _1163 * 6.283185482025146484375;
    float _1193 = cos(_1191);
    if (_1153)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3694 = as_type<float>(_1187);
        out.gl_Position.z = _3694;
    }
    float _1195 = _1047 * _1167;
    float _1197 = _253 * _1189;
    float _1199 = _1155 * 6.283185482025146484375;
    float _1201 = sin(_1199);
    float _1203 = _1155 * 6.283185482025146484375;
    float _1205 = cos(_1203);
    float _1207 = _1181 * 6.283185482025146484375;
    float _1209 = sin(_1207);
    if (_1153)
    {
        return out;
    }
    float _1211 = _1181 * 6.283185482025146484375;
    float _1213 = cos(_1211);
    float _1215 = _1197 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1217 = _537 * _1145;
    float _1219 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _175);
    float _1221 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _195);
    float _1223 = _1195 * _1215;
    float _1225 = _253 * _1217;
    float _1227 = _1201 * _1179;
    float _1229 = _1219 * _1223;
    float _1231 = _1225 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1233 = _1205 * _1193;
    bool _1235 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1237 = isnan(0.5);
    bool _1239 = _1235 || _1237;
    bool _1241 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1243 = _1239 || _1241;
    float _1245 = _1195 * _1231;
    float _1247 = _1205 * _1179;
    float _1249 = _1213 * _1229;
    float _1251 = fma(_1209, _1233, _1227);
    float _1253 = _1221 * _1245;
    float _1255 = _1179 * _1213;
    float _1257 = _1205 * _1249;
    float _1259 = _1193 * _1213;
    float _1261 = _1201 * _1193;
    float _1263 = -_1229;
    float _1265 = _1209 * _1263;
    float _1267 = fma(_1251, _1253, _1257);
    float _1269 = _1195 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1271 = _1269 * 0.5;
    float _1273 = -_1261;
    float _1275 = fma(_1209, _1247, _1273);
    float _1277 = -_1247;
    float _1279 = fma(_1209, _1261, _1277);
    float _1281 = _1201 * _1249;
    float _1283 = fma(_1259, _1253, _1265);
    float _1285 = fma(_1275, _1271, _1267);
    float _1287 = fma(_1209, _1227, _1233);
    float _1289 = fma(_1279, _1253, _1281);
    float _1291 = fma(_1255, _1271, _1283);
    float _1293 = _1285 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1295 = fma(_1287, _1271, _1289);
    float _1297 = _1285 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1299 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1293);
    float _1301 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1297);
    float _1303 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1299);
    float _1305 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1301);
    float _1307 = _1303 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1309 = _1305 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1311 = _981 + _1307;
    float _1313 = _733 + _1309;
    float _1315 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1317 = _1311 + _1315;
    float _1319 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1321 = _1313 + _1319;
    float _1323 = _1317 * _1317;
    float _1325 = fma(_1321, _1321, _1323);
    float _1327 = _1285 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1329 = sqrt(_1325);
    float _1331 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1327);
    float _1333 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1331);
    float _1335 = _1333 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1337 = _959 + _1335;
    bool _1339 = _1329 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1341 = _1271;
    float _1343 = _1313;
    float _1345 = _1311;
    float _1347 = _1321;
    if (!_1339)
    {
        _1341 = _1337;
    }
    float _1349 = _1341;
    bool _1351 = !_1339;
    float _1353 = _1349;
    if (!_1351)
    {
        float _1355 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1357 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1359 = _1329 + _1357;
        float _1361 = rsqrt(_1325);
        float _1363 = _1359 * _1355;
        float _1365 = _1337 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1367 = _1363 * 0.15915493667125701904296875;
        float _1369 = _1367 * 6.283185482025146484375;
        float _1371 = cos(_1369);
        float _1373 = _1367 * 6.283185482025146484375;
        float _1375 = sin(_1373);
        float _1377 = _1371 + (-1.0);
        float _1379 = fma(_1375, _1365, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1381 = _1377 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1383 = _1361 * _1379;
        float _1385 = fma(_1337, _1371, _1381);
        float _1387 = fma(_1321, _1383, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1389 = fma(_1317, _1383, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1343 = _1387;
        _1353 = _1385;
        _1345 = _1389;
    }
    float _1391 = _1343;
    float _1393 = _1353;
    float _1395 = _1345;
    float _1397 = -_1087;
    float _1399 = fma(_1397, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1391);
    float _1401 = -_1079;
    float _1403 = fma(_1401, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1393);
    float _1405 = -_1089;
    float _1407 = fma(_1405, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1395);
    float _1409 = _1403;
    float _1411 = _1399;
    float _1413 = _1407;
    if (!_1243)
    {
        float _1415 = _1113 * _1113;
        float _1417 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1419 = -_959;
        float _1421 = _1419 + _1393;
        float _1423 = -_981;
        float _1425 = _1423 + _1395;
        float _1427 = fma(_1117, _1117, _1415);
        float _1429 = fma(_1123, _1123, _1427);
        float _1431 = 1.0 / _1195;
        float _1433 = sqrt(_1429);
        float _1435 = precise::min(_1433, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1437 = _1435 * _1417;
        float _1439 = -_733;
        float _1441 = _1439 + _1391;
        float _1443 = _1437 * _1431;
        float _1445 = fma(_1441, _1443, _1101);
        float _1447 = fma(_1421, _1443, _1097);
        float _1449 = fma(_1425, _1443, _1105);
        _1409 = _1447;
        _1411 = _1445;
        _1413 = _1449;
    }
    float _1451 = _1409;
    float _1453 = _1411;
    float _1455 = _1413;
    float _1457 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1459 = _1451 + _1457;
    float _1461 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1463 = _1453 + _1461;
    float _1465 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1467 = _1455 + _1465;
    float _1469 = _1459 * _1459;
    float _1471 = fma(_1463, _1463, _1469);
    float _1473 = fma(_1467, _1467, _1471);
    float _1475 = rsqrt(_1473);
    float _1477 = sqrt(_1473);
    float _1479 = _1475 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1481 = _1463 * _1479;
    float _1483 = _1467 * _1479;
    float _1485 = _1481 * _1481;
    float _1487 = _1483 * _1483;
    float _1489 = _1485 + _1487;
    float _1491 = sqrt(_1489);
    bool _1493 = _1491 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1495 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1497 = _1491 + _1495;
    float _1499 = _1475;
    float _1501 = _1497;
    float _1503 = _1459;
    float _1505 = _1481;
    if (_1493)
    {
        float _1507 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1499 = _1507;
    }
    float _1509 = _1499;
    float _1511 = _1509;
    if (_1493)
    {
        float _1513 = _1497 * _1509;
        _1501 = _1513;
    }
    float _1515 = _1501;
    if (_1493)
    {
        float _1517 = rsqrt(_1489);
        _1511 = _1517;
    }
    float _1519 = _1511;
    float _1521 = _1519;
    if (_1493)
    {
        float _1523 = _1515 * 0.15915493667125701904296875;
        _1347 = _1523;
    }
    float _1525 = _1347;
    float _1527 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1529 = _1467;
    float _1531 = _1525;
    if (_1493)
    {
        float _1533 = _1525 * 6.283185482025146484375;
        float _1535 = sin(_1533);
        _1529 = _1535;
    }
    float _1537 = _1529;
    float _1539 = precise::max(0.0, _1527);
    float _1541 = _1393;
    float _1543 = _1539;
    if (_1493)
    {
        float _1545 = _1525 * 6.283185482025146484375;
        float _1547 = cos(_1545);
        _1541 = _1547;
    }
    float _1549 = _1541;
    float _1551 = -_1479;
    float _1553 = -_1539;
    float _1555 = fma(_1459, _1551, _1553);
    if (_1493)
    {
        float _1557 = _1555 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1503 = _1557;
    }
    float _1559 = _1503;
    float _1561 = _1537;
    float _1563 = _1559;
    if (_1493)
    {
        float _1565 = fma(_1537, _1559, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1561 = _1565;
    }
    float _1567 = _1561;
    float _1569 = _1567;
    if (!_1493)
    {
        _1563 = _1487;
    }
    float _1571 = _1563;
    float _1573 = _1571;
    if (_1493)
    {
        float _1575 = _1519 * _1567;
        _1009 = _1575;
    }
    float _1577 = _1009;
    if (!_1493)
    {
        _1521 = _1555;
    }
    float _1579 = _1521;
    float _1581 = _1579;
    if (_1493)
    {
        float _1583 = _1549 + (-1.0);
        _1543 = _1583;
    }
    float _1585 = _1543;
    float _1587 = _1585;
    if (_1493)
    {
        float _1589 = _1481 * _1577;
        _1505 = _1589;
    }
    float _1591 = _1505;
    if (!_1493)
    {
        _1569 = _1483;
    }
    float _1593 = _1569;
    float _1595 = _1593;
    if (_1493)
    {
        float _1597 = _1483 * _1577;
        _1595 = _1597;
    }
    float _1599 = _1595;
    if (_1493)
    {
        float _1601 = _1585 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1531 = _1601;
    }
    float _1603 = _1531;
    if (!_1493)
    {
        _1587 = _1485;
    }
    float _1605 = _1587;
    float _1607 = _1605;
    if (_1493)
    {
        float _1609 = _1591 * _1591;
        _1607 = _1609;
    }
    float _1611 = _1607;
    if (_1493)
    {
        float _1613 = _1599 * _1599;
        _1573 = _1613;
    }
    float _1615 = _1573;
    if (_1493)
    {
        float _1617 = fma(_1555, _1549, _1603);
        _1581 = _1617;
    }
    float _1619 = _1581;
    float _1621 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1623 = fma(_1619, _1619, _1611);
    float _1625 = _1451 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1627 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1629 = fma(_1477, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1627);
    float _1631 = precise::clamp(_1629, 0.0, 1.0);
    float _1633 = _1451 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1635 = _1623 + _1615;
    float _1637 = fma(_1453, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1625);
    float _1639 = _1451 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1641 = -_1631;
    float _1643 = _1641 + 1.0;
    float _1645 = rsqrt(_1635);
    float _1647 = fma(_1455, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1637);
    float _1649 = fma(_1453, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1639);
    float _1651 = _1451 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1653 = _1647 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1655 = fma(_1455, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1649);
    float _1657 = fma(_1453, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1651);
    float _1659 = abs(_1643);
    float _1661 = log2(_1659);
    float _1663 = fma(_1453, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1633);
    float _1665 = _1655 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1667 = fma(_1455, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1657);
    float _1669 = _1653 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1671 = fma(_1455, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1663);
    float _1673 = _1667 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1675 = _1645 * _1591;
    float _1677 = _1665 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1679 = _1645 * _1619;
    float _1681 = _1645 * _1599;
    float _1683 = _1675 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1685 = fma(_1673, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1677);
    float _1687 = -_1669;
    float _1689 = fma(_1687, _1621, 1.0);
    float _1691 = _1671 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1693 = _1661 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1695 = -_1683;
    float _1697 = fma(_1679, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1695);
    float _1699 = fma(_1653, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1685);
    float _1701 = _1665 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1703 = log2(_1689);
    float _1705 = -_1681;
    float _1707 = fma(_1705, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1697);
    float _1709 = fma(_1691, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1699);
    float _1711 = _1665 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1713 = fma(_1673, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1701);
    float _1715 = fma(_1707, -0.5, 0.5);
    float _1717 = fma(_1707, 0.5, 0.5);
    float _1719 = fma(_1673, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1711);
    float _1721 = exp2(_1693);
    float _1723 = _1679 + 1.0;
    float _1725 = fma(_1653, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1713);
    float _1727 = fma(_1653, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1719);
    float _1729 = fma(_1717, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1731 = 1.0 / _1709;
    float _1733 = fma(_1717, _1729, -0.212114393711090087890625);
    float _1735 = _1703 * 0.693147182464599609375;
    float _1737 = fma(_1717, _1733, 1.570728778839111328125);
    float _1739 = _1735 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1741 = sqrt(_1715);
    float _1743 = -_1679;
    float _1745 = fma(_1721, _1723, _1743);
    float _1747 = fma(_1691, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1727);
    float _1749 = fma(_1691, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1725);
    float _1751 = fma(_1745, 0.5, 0.5);
    float _1753 = _1747 * _1731;
    float _1755 = _1749 * _1731;
    float _1757 = fma(_1753, 0.5, 0.5);
    float _1759 = fma(_1755, -0.5, 0.5);
    float _1761 = _1741 * 0.636619746685028076171875;
    float3 _4622 = float3(_1757, _1759, _1739);
    float _1763 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4622, float3(0.0), isnan(_4622)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4622, float3(0.0), isnan(_4622)), level(0.0)).x;
    float3 _4633 = float3(_1757, _1759, _1739);
    float4 _1766 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4633, float3(0.0), isnan(_4633)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4633, float3(0.0), isnan(_4633)), level(0.0)).xyzw;
    float _1768 = _1766.x;
    float _1770 = _1766.y;
    float _1772 = _1766.z;
    float _1774 = _1766.w;
    float _1776 = -_1737;
    float _1778 = fma(_1761, _1776, 1.0);
    float2 _4655 = float2(_1778, _1751);
    float3 _1782 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4655, float2(0.0), isnan(_4655)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4655, float2(0.0), isnan(_4655)), level(0.0)).xyz;
    float _1784 = _1782.x;
    float _1786 = _1782.y;
    float _1788 = _1782.z;
    float _1790 = _1097 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _1792 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1794 = isnan(0.5);
    bool _1796 = _1792 || _1794;
    bool _1798 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1800 = _1796 || _1798;
    float _1802 = _1665 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_68.y = _1451;
    float _1804 = fma(_1101, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1790);
    float _1806 = _1097 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1808 = fma(_1673, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1802);
    float _1810 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1804);
    float _1812 = fma(_1101, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1806);
    float _1814 = fma(_1653, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1808);
    float _1816 = _1810 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1818 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1812);
    float _1820 = _1810;
    float _1822 = _1661;
    if (!_1800)
    {
        _257 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1824 = _257;
    float _1826 = _1661 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1828 = 1.0 / _1816;
    float _1830 = _1818 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    if (!_1800)
    {
        _1820 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1832 = _1820;
    float _1834 = fma(_1691, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1814);
    if (_1800)
    {
        _1822 = 1.0;
    }
    float _1836 = _1822;
    float _1838 = _1830 + _1816;
    float _1840 = _1836;
    if (!_1800)
    {
        float _1842 = -_1832;
        float _1844 = _1842 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1173 = _1844;
    }
    float _1846 = _1173;
    float _1848 = exp2(_1826);
    float _1850 = _1834 + _1709;
    float _1852 = _1838 * _1828;
    float _1854 = _1852 * 0.5;
    float _1856 = _1846;
    float _1858 = _1854;
    if (!_1800)
    {
        float _1860 = 1.0 / _1846;
        _1856 = _1860;
    }
    float _1862 = _1856;
    if (!_1800)
    {
        float _1864 = -_1824;
        float _1866 = fma(_1854, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1864);
        _1858 = _1866;
    }
    float _1868 = _1858;
    float _1870 = _1824;
    if (!_1800)
    {
        float _1872 = 1.0 / _1868;
        _1870 = _1872;
    }
    float _1874 = _1870;
    float _1876 = _1850 * 0.5;
    float _1878 = _1874;
    if (!_1800)
    {
        float _1880 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1882 = -_1832;
        float _1884 = fma(_1874, _1880, _1882);
        _1878 = _1884;
    }
    float _1886 = _1878;
    if (!_1800)
    {
        float _1888 = _1886 * _1862;
        float _1890 = precise::clamp(_1888, 0.0, 1.0);
        _1840 = _1890;
    }
    float _1892 = _1840;
    float _1894 = -_1848;
    float _1896 = _1894 + 1.0;
    float _1898 = _1892 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1900 = _1896 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _1902 = _1892 > 0.0;
    bool _1904 = isnan(_1892);
    bool _1906 = _1902 || _1904;
    bool _1908 = isnan(0.0);
    bool _1910 = _1906 || _1908;
    out.gl_Position.x = _1747;
    out.gl_Position.y = _1749;
    out.gl_Position.z = _1834;
    out.gl_Position.w = _1709;
    float _1912 = -_1900;
    float _1914 = _1912 + 1.0;
    float _1916 = _1898 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_70.z = _1876;
    out.m_70.w = _1709;
    out.m_45.x = _1916;
    float _1918 = _1900 * _1763;
    float _1920 = _1774 * _1918;
    float _1922 = _1774 * _1914;
    float _1924 = _1788 * _1918;
    float _1926 = fma(_1784, _1920, _1768);
    float _1928 = fma(_1786, _1920, _1770);
    float _1930 = fma(_1774, _1924, _1772);
    out.m_72.x = _1926;
    out.m_72.y = _1928;
    out.m_72.z = _1930;
    out.m_72.w = _1922;
    if (_1910)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _1932 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1932;
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
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _559 = false;
    bool _275 = false;
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
        float _1989 = as_type<float>(_107);
        out.gl_Position.z = _1989;
    }
    if (!_95)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _111 = in.m_47.w;
    bool _113 = _111 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _115 = isnan(_111);
    bool _117 = _113 || _115;
    bool _119 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _121 = _117 || _119;
    float _123 = -_111;
    float _125 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _127 = 0.0;
    float _129 = _125;
    if (_121)
    {
        float _131 = float(_91);
        _127 = _131;
    }
    float _133 = _127;
    bool _135 = _125 >= _133;
    bool _137 = !_121;
    bool _139 = _135 || _137;
    if (_139)
    {
        _101 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _141 = _101;
    if (_139)
    {
        out.m_45.x = 0.0;
    }
    if (_139)
    {
        float _143 = _141 * 5.0;
        _109 = as_type<int>(_143);
    }
    int _145 = _109;
    if (_139)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2058 = as_type<float>(_145);
        out.gl_Position.z = _2058;
    }
    if (_139)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _147 = in.m_49.x;
    float _149 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _151 = _125 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _153 = as_type<float>(int(gl_VertexIndex));
    float _155 = _151 * _149;
    float _157 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[20].x, _155);
    int _159 = as_type<int>(_153) & 1;
    bool _161 = _159 != 0;
    int _163 = as_type<int>(_153) & 2;
    bool _165 = _163 != 0;
    float _167 = _157 * 6.283185482025146484375;
    float _169 = floor(_157);
    float _171 = _167 * 0.15915493667125701904296875;
    bool _173 = !_165;
    float _175 = _173 ? (-0.5) : 0.5;
    int _177 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _179 = _177 != 0;
    int _181 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _183 = _181 != 0;
    int _185 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _187 = _185 != 0;
    float _189 = _171 * 6.283185482025146484375;
    float _191 = cos(_189);
    bool _193 = !_161;
    float _195 = _193 ? (-0.5) : 0.5;
    bool _197 = !_179;
    int _199 = _197 ? 0 : 1;
    bool _201 = !_187;
    int _203 = _201 ? 0 : 1;
    int _205 = abs(_199);
    float _207 = -_169;
    float _209 = _157 + _207;
    int _211 = abs(_203);
    float _213 = -_209;
    float _215 = fma(_213, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _217 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _219 = float(_205);
    float _221 = fma(_191, 0.5, 0.5);
    bool _223 = !_183;
    int _225 = _223 ? 0 : 1;
    bool _227 = _209 < 0.5;
    float _229 = float(_227);
    float _231 = abs(_215);
    float _233 = _219 * _231;
    int _235 = abs(_225);
    float _237 = -_221;
    float _239 = fma(_237, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _241 = float(_211);
    float _243 = -_229;
    float _245 = fma(_243, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _247 = float(_235);
    float _249 = fma(_241, _239, _233);
    float _251 = abs(_245);
    float _253 = fma(_247, _251, _249);
    bool _255 = !_217;
    float _257 = 0.5;
    float _273;
    if (!_255)
    {
        float _259 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _261 = _147 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _263 = fma(_261, (*spvDescriptorSet0.vp_c9)._m0[12].x, _125);
        float _265 = _263 * _259;
        float _267 = floor(_265);
        float _269 = -_267;
        float _271 = _265 + _269;
        _273 = _271;
        _275 = true;
    }
    else
    {
        float _277 = float(_91);
        float _279 = 1.0 / _277;
        float _281 = _125 * _279;
        _273 = _281;
    }
    _275 = false;
    float _283 = _273;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _287 = _283 + _285;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _291 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _289;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _295 = _293 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _299 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _297;
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _303 = _301 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _305 = 1.0 / _291;
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _309 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _307;
    bool _311 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _313 = isnan(_283);
    bool _315 = _311 || _313;
    bool _317 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _319 = _315 || _317;
    float _321 = float(_319);
    float _323 = 1.0 / _295;
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _327 = _283 + _325;
    bool _329 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _331 = 1.0 / _303;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _335 = _283 + _333;
    float _337 = _327 * _305;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _341 = _283 + _339;
    float _343 = 1.0 / _309;
    float _345 = _287 * _323;
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _349 = _283 + _347;
    bool _351 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _353 = isnan(_283);
    bool _355 = _351 || _353;
    bool _357 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _359 = _355 || _357;
    float _361 = float(_359);
    float _363 = 1.0 / _299;
    float _365 = _335 * _331;
    bool _367 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _369 = isnan(_283);
    bool _371 = _367 || _369;
    bool _373 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _375 = _371 || _373;
    float _377 = float(_375);
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _379;
    float _383 = fma(_381, _337, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _385 = _349 * _343;
    bool _387 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _389 = isnan(_283);
    bool _391 = _387 || _389;
    bool _393 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _395 = _391 || _393;
    float _397 = float(_395);
    float _399 = -_361;
    float _401 = _399 + 1.0;
    float _403 = _377 * _401;
    float _405 = -_377;
    float _407 = _405 + 1.0;
    float _409 = _341 * _363;
    float _411 = -_321;
    float _413 = _411 + 1.0;
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _417 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _415;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _421 = _419 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _423 = _397 * _413;
    float _425 = fma(_417, _337, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _427 = -_397;
    float _429 = _427 + 1.0;
    bool _431 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _433 = isnan(_283);
    bool _435 = _431 || _433;
    bool _437 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _439 = _435 || _437;
    float _441 = float(_439);
    float _443 = fma(_421, _345, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _445 = _361 * _429;
    bool _447 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _449 = isnan(_283);
    bool _451 = _447 || _449;
    bool _453 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _455 = _451 || _453;
    float _457 = float(_455);
    float _459 = _441 * _407;
    float _461 = -_441;
    float _463 = _461 + 1.0;
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _467 = _465 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _469 = -_457;
    float _471 = _469 + 1.0;
    float _473 = _457 * _463;
    float _475 = fma(_467, _345, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _479 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _477;
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _483 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _481;
    float _485 = _425 * _473;
    float _487 = _383 * _473;
    float _489 = fma(_479, _409, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _491 = fma(_483, _409, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _493 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[143].x, _485);
    float _495 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[143].y, _487);
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _499 = _497 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _501 = fma(_475, _459, _493);
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _505 = _503 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _507 = fma(_443, _459, _495);
    float _509 = fma(_499, _365, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _513 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _511;
    float _515 = fma(_489, _403, _501);
    float _517 = fma(_505, _365, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _521 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _519;
    float _523 = fma(_491, _403, _507);
    float _525 = fma(_513, _385, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _527 = fma(_509, _445, _515);
    float _529 = fma(_521, _385, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _531 = fma(_517, _445, _523);
    float _533 = fma(_525, _423, _527);
    float _535 = fma(_529, _423, _531);
    float _537 = fma(_321, (*spvDescriptorSet0.vp_c9)._m0[148].x, _533);
    float _539 = fma(_321, (*spvDescriptorSet0.vp_c9)._m0[148].y, _535);
    bool _541 = !_329;
    float _557;
    if (!_541)
    {
        float _543 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _545 = _147 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _547 = fma(_545, (*spvDescriptorSet0.vp_c9)._m0[11].z, _125);
        float _549 = _547 * _543;
        float _551 = floor(_549);
        float _553 = -_551;
        float _555 = _549 + _553;
        _557 = _555;
        _559 = true;
    }
    else
    {
        float _561 = float(_91);
        float _563 = 1.0 / _561;
        float _565 = _125 * _563;
        _557 = _565;
    }
    _559 = false;
    float _567 = _557;
    float _569 = in.m_42.x;
    float _571 = in.m_42.y;
    float _573 = in.m_42.z;
    float _575 = _147 * 2.0;
    int _577 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _579 = _577 != 0;
    int _581 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _583 = _581 != 0;
    int _585 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _587 = _585 != 0;
    float _589 = in.m_54.x;
    float _591 = in.m_54.y;
    float _593 = in.m_54.z;
    bool _595 = _147 > 0.5;
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _599 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _597;
    float _601 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _603 = _601 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _605 = in.m_56.x;
    float _607 = in.m_56.y;
    float _609 = in.m_56.z;
    float _611 = floor(_575);
    float _613 = in.m_58.x;
    float _615 = in.m_58.y;
    float _617 = in.m_58.z;
    int _619 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _621 = _619 != 0;
    float _623 = in.m_49.z;
    float _625 = 1.0 / _603;
    int _627 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _629 = _627 != 0;
    float _631 = in.m_49.y;
    float _633 = 1.0 / _599;
    bool _635 = _611 > 0.0;
    float _637 = _571 * _591;
    bool _639 = _567 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _641 = isnan(_567);
    bool _643 = _639 || _641;
    bool _645 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _647 = _643 || _645;
    float _649 = float(_647);
    float _651 = _571 * _607;
    float _653 = fma(_569, _589, _637);
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _657 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _655;
    float _659 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _661 = _571 * _615;
    float _663 = fma(_569, _605, _651);
    float _665 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _667 = _567 + _665;
    float _669 = fma(_573, _593, _653);
    float _671 = fma(_569, _613, _661);
    float _673 = fma(_573, _609, _663);
    float _675 = _623 * 2.0;
    float _677 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _679 = log2(_677);
    float _681 = _631 * 2.0;
    float _683 = fma(_573, _617, _671);
    float _685 = -_195;
    int _687 = _595 ? as_type<int>(_685) : as_type<int>(_195);
    float _689 = _667 * _625;
    bool _691 = _611 >= 0.0;
    bool _693 = isnan(_611);
    bool _695 = _691 || _693;
    bool _697 = isnan(0.0);
    bool _699 = _695 || _697;
    float _701 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _703 = _567 + _701;
    float _705 = _631 + _623;
    float _707 = floor(_675);
    float _709 = _703 * _633;
    float _711 = _147 + _631;
    float _713 = _705 + (-1.0);
    int _715 = _699 ? 0 : 1;
    float _717 = _711 + (-1.0);
    float _719 = _679 * _125;
    float _721 = floor(_681);
    float _723 = fma(_713, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _725 = !_621;
    float _727 = _725 ? _195 : as_type<float>(_687);
    float _729 = fma(_657, _709, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _731 = _631 > 0.5;
    float _733 = _669 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _735 = _567 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _737 = isnan(_567);
    bool _739 = _735 || _737;
    bool _741 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _743 = _739 || _741;
    float _745 = float(_743);
    float _747 = _727 + 0.5;
    float _749 = exp2(_719);
    float _751 = fma(_717, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _753 = ~_715;
    int _755 = _753 + 1;
    int _757 = _755 + 1;
    float _759 = _747 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _761 = _757;
    if (!_635)
    {
        int _763 = ~_715;
        int _765 = _763 + 1;
        _761 = _765;
    }
    int _767 = _761;
    float _769 = _631 + (-0.5);
    bool _771 = _707 >= 0.0;
    bool _773 = isnan(_707);
    bool _775 = _771 || _773;
    bool _777 = isnan(0.0);
    bool _779 = _775 || _777;
    bool _781 = _721 >= 0.0;
    bool _783 = isnan(_721);
    bool _785 = _781 || _783;
    bool _787 = isnan(0.0);
    bool _789 = _785 || _787;
    int _791 = _779 ? 0 : 1;
    int _793 = _789 ? 0 : 1;
    bool _795 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _797 = isnan(0.0);
    bool _799 = _795 || _797;
    bool _801 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _803 = _799 || _801;
    float _805 = -_749;
    float _807 = _805 + 1.0;
    bool _809 = _707 > 0.0;
    bool _811 = _567 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _813 = isnan(_567);
    bool _815 = _811 || _813;
    bool _817 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _819 = _815 || _817;
    float _821 = float(_819);
    float _823 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _825 = _803 ? _807 : 0.0;
    float _827 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _829 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _827;
    float _831 = -_821;
    float _833 = _831 + 1.0;
    float _835 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _837 = 1.0 + _835;
    float _839 = -_175;
    int _841 = _731 ? as_type<int>(_839) : as_type<int>(_175);
    float _843 = fma(_829, _709, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    bool _845 = _721 > 0.0;
    float _847 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _849 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _847;
    float _851 = _745 * _833;
    float _853 = 1.0 / _837;
    float _855 = -_745;
    float _857 = _855 + 1.0;
    bool _859 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _861 = isnan(1.0);
    bool _863 = _859 || _861;
    bool _865 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _867 = _863 || _865;
    float _869 = fma(_849, _709, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _871 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _873 = _871 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _875 = _649 * _857;
    float _877 = -_649;
    float _879 = _877 + 1.0;
    bool _881 = !_629;
    float _883 = _881 ? _175 : as_type<float>(_841);
    float _885 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _887 = _885 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _889 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _891 = _889 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _893 = fma(_873, _689, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _895 = _729 * _875;
    float _897 = fma(_887, _689, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _899 = fma(_891, _689, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _901 = _843 * _875;
    int _903 = ~_793;
    int _905 = _903 + 1;
    int _907 = _905 + 1;
    int _909 = _907;
    if (_867)
    {
        float _911 = _825 * _853;
        _129 = _911;
    }
    float _913 = _129;
    if (!_845)
    {
        int _915 = ~_793;
        int _917 = _915 + 1;
        _909 = _917;
    }
    int _919 = _909;
    float _921 = fma(_879, (*spvDescriptorSet0.vp_c9)._m0[123].x, _901);
    bool _923 = !_583;
    int _925 = _923 ? 0 : 1;
    float _927 = _869 * _875;
    float _929 = -_883;
    float _931 = _929 + 0.5;
    float _933 = fma(_893, _851, _921);
    int _935 = abs(_925);
    float _937 = _759 * _823;
    bool _939 = !_587;
    int _941 = _939 ? 0 : 1;
    float _943 = fma(_879, (*spvDescriptorSet0.vp_c9)._m0[123].y, _927);
    float _945 = fma(_879, (*spvDescriptorSet0.vp_c9)._m0[123].z, _895);
    float _947 = float(_767);
    float _949 = _931 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _951 = !_579;
    int _953 = _951 ? 0 : 1;
    float _955 = fma(_899, _851, _945);
    int _957 = abs(_941);
    float _959 = _673 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _961 = float(_935);
    float _963 = _949 * _659;
    int _965 = abs(_953);
    float _967 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _969 = _959 + _967;
    float _971 = fma(_897, _851, _943);
    float _973 = _961 * _947;
    float _975 = in.m_60.x;
    float _977 = in.m_60.y;
    float _979 = in.m_60.z;
    float _981 = _683 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _983 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _985 = _733 + _983;
    float _987 = _969 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    out.m_62.x = _937;
    out.m_62.y = _963;
    float _989 = fma(_821, (*spvDescriptorSet0.vp_c9)._m0[125].x, _933);
    float _991 = fma(_821, (*spvDescriptorSet0.vp_c9)._m0[125].y, _971);
    float _993 = fma(_985, (*spvDescriptorSet0.vp_c8)._m0[28].x, _987);
    float _995 = fma(_821, (*spvDescriptorSet0.vp_c9)._m0[125].z, _955);
    float _997 = _969 * _969;
    int _999 = ~_791;
    int _1001 = _999 + 1;
    int _1003 = _1001 + 1;
    int _1005 = _1003;
    float _1007 = as_type<float>(_965);
    float _1009 = _981;
    if (!_809)
    {
        int _1011 = ~_791;
        int _1013 = _1011 + 1;
        _1005 = _1013;
    }
    int _1015 = _1005;
    float _1017 = fma(_985, _985, _997);
    float _1019 = float(_957);
    float _1021 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1023 = _981 + _1021;
    float _1025 = float(_919);
    float _1027 = float(_1015);
    float _1029 = fma(_1023, (*spvDescriptorSet0.vp_c8)._m0[28].z, _993);
    float _1031 = float(_965);
    float _1033 = _1019 * _1025;
    float _1035 = fma(_1023, _1023, _1017);
    float _1037 = _991 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _1039 = _1029 >= 0.0;
    float _1041 = _1031 * _1027;
    float _1043 = _973 * (-2.0);
    float _1045 = _1037 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1047 = rsqrt(_1035);
    float _1049 = fma(_1043, _977, _977);
    float _1051 = fma(_723, _1043, _723);
    float _1053 = _989 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1055 = _995 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1057 = fma(_769, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1049);
    float _1059 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1061 = _979;
    if (_1039)
    {
        _1007 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1063 = _1007;
    float _1065 = _1041 * (-2.0);
    float _1067 = _1053 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1069 = _1055 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1071 = as_type<int>(_1063);
    if (_1039)
    {
        float _1073 = _1063 * 5.0;
        _1071 = as_type<int>(_1073);
    }
    int _1075 = _1071;
    float _1077 = fma(_751, _1065, _751);
    float _1079 = _969 * _1047;
    out.m_64.x = _1067;
    out.m_64.y = _1045;
    out.m_64.z = _1069;
    out.m_64.w = _1059;
    float _1081 = fma(_1065, _975, _975);
    float _1083 = fma(_1051, _913, _1057);
    float _1085 = _147 + (-0.5);
    if (_1039)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3500 = as_type<float>(_1075);
        out.gl_Position.z = _3500;
    }
    float _1087 = _985 * _1047;
    float _1089 = _1023 * _1047;
    float _1091 = -_1079;
    float _1093 = fma(_1091, (*spvDescriptorSet0.vp_c9)._m0[18].w, _969);
    if (_1039)
    {
        out.m_45.x = 0.0;
    }
    if (_1039)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1095 = -_1079;
    float _1097 = fma(_1095, (*spvDescriptorSet0.vp_c9)._m0[18].w, _959);
    float _1099 = -_1087;
    float _1101 = fma(_1099, (*spvDescriptorSet0.vp_c9)._m0[18].w, _733);
    float _1103 = -_1089;
    float _1105 = fma(_1103, (*spvDescriptorSet0.vp_c9)._m0[18].w, _981);
    float _1107 = -_1087;
    float _1109 = fma(_1107, (*spvDescriptorSet0.vp_c9)._m0[18].w, _985);
    float _1111 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1113 = _1097 + _1111;
    float _1115 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1117 = _1101 + _1115;
    float _1119 = _1093 * _1093;
    float _1121 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1123 = _1105 + _1121;
    float _1125 = _1113 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1127 = fma(_1085, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1081);
    float _1129 = fma(_1109, _1109, _1119);
    float _1131 = -_1089;
    float _1133 = fma(_1131, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1023);
    float _1135 = fma(_1117, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1125);
    float _1137 = _147 + _623;
    float _1139 = fma(_1077, _913, _1127);
    float _1141 = fma(_1133, _1133, _1129);
    float _1143 = fma(_1123, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1135);
    float _1145 = in.m_66.x;
    float _1147 = in.m_66.y;
    float _1149 = _1137 + (-1.0);
    float _1151 = _1033 * (-2.0);
    bool _1153 = _1143 >= 0.0;
    float _1155 = _1139 * 0.15915493667125701904296875;
    float _1157 = fma(_1149, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1159 = fma(_1151, _979, _979);
    float _1161 = _623 + (-0.5);
    float _1163 = _1083 * 0.15915493667125701904296875;
    float _1165 = fma(_1157, _1151, _1157);
    float _1167 = sqrt(_1141);
    float _1169 = fma(_1161, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1159);
    float _1171 = fma(_1165, _913, _1169);
    float _1173 = _1097;
    if (_1153)
    {
        _1061 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1175 = _1061;
    float _1177 = _1163 * 6.283185482025146484375;
    float _1179 = sin(_1177);
    float _1181 = _1171 * 0.15915493667125701904296875;
    int _1183 = as_type<int>(_1175);
    if (_1153)
    {
        out.m_45.x = 0.0;
    }
    if (_1153)
    {
        float _1185 = _1175 * 5.0;
        _1183 = as_type<int>(_1185);
    }
    int _1187 = _1183;
    float _1189 = _539 * _1147;
    float _1191 = _1163 * 6.283185482025146484375;
    float _1193 = cos(_1191);
    if (_1153)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3694 = as_type<float>(_1187);
        out.gl_Position.z = _3694;
    }
    float _1195 = _1047 * _1167;
    float _1197 = _253 * _1189;
    float _1199 = _1155 * 6.283185482025146484375;
    float _1201 = sin(_1199);
    float _1203 = _1155 * 6.283185482025146484375;
    float _1205 = cos(_1203);
    float _1207 = _1181 * 6.283185482025146484375;
    float _1209 = sin(_1207);
    if (_1153)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1211 = _1181 * 6.283185482025146484375;
    float _1213 = cos(_1211);
    float _1215 = _1197 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1217 = _537 * _1145;
    float _1219 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _175);
    float _1221 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _195);
    float _1223 = _1195 * _1215;
    float _1225 = _253 * _1217;
    float _1227 = _1201 * _1179;
    float _1229 = _1219 * _1223;
    float _1231 = _1225 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1233 = _1205 * _1193;
    bool _1235 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1237 = isnan(0.5);
    bool _1239 = _1235 || _1237;
    bool _1241 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1243 = _1239 || _1241;
    float _1245 = _1195 * _1231;
    float _1247 = _1205 * _1179;
    float _1249 = _1213 * _1229;
    float _1251 = fma(_1209, _1233, _1227);
    float _1253 = _1221 * _1245;
    float _1255 = _1179 * _1213;
    float _1257 = _1205 * _1249;
    float _1259 = _1193 * _1213;
    float _1261 = _1201 * _1193;
    float _1263 = -_1229;
    float _1265 = _1209 * _1263;
    float _1267 = fma(_1251, _1253, _1257);
    float _1269 = _1195 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1271 = _1269 * 0.5;
    float _1273 = -_1261;
    float _1275 = fma(_1209, _1247, _1273);
    float _1277 = -_1247;
    float _1279 = fma(_1209, _1261, _1277);
    float _1281 = _1201 * _1249;
    float _1283 = fma(_1259, _1253, _1265);
    float _1285 = fma(_1275, _1271, _1267);
    float _1287 = fma(_1209, _1227, _1233);
    float _1289 = fma(_1279, _1253, _1281);
    float _1291 = fma(_1255, _1271, _1283);
    float _1293 = _1285 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1295 = fma(_1287, _1271, _1289);
    float _1297 = _1285 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1299 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1293);
    float _1301 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1297);
    float _1303 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1299);
    float _1305 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1301);
    float _1307 = _1303 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1309 = _1305 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1311 = _981 + _1307;
    float _1313 = _733 + _1309;
    float _1315 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1317 = _1311 + _1315;
    float _1319 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1321 = _1313 + _1319;
    float _1323 = _1317 * _1317;
    float _1325 = fma(_1321, _1321, _1323);
    float _1327 = _1285 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1329 = sqrt(_1325);
    float _1331 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1327);
    float _1333 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1331);
    float _1335 = _1333 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1337 = _959 + _1335;
    bool _1339 = _1329 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1341 = _1271;
    float _1343 = _1313;
    float _1345 = _1311;
    float _1347 = _1321;
    if (!_1339)
    {
        _1341 = _1337;
    }
    float _1349 = _1341;
    bool _1351 = !_1339;
    float _1353 = _1349;
    if (!_1351)
    {
        float _1355 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1357 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1359 = _1329 + _1357;
        float _1361 = rsqrt(_1325);
        float _1363 = _1359 * _1355;
        float _1365 = _1337 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1367 = _1363 * 0.15915493667125701904296875;
        float _1369 = _1367 * 6.283185482025146484375;
        float _1371 = cos(_1369);
        float _1373 = _1367 * 6.283185482025146484375;
        float _1375 = sin(_1373);
        float _1377 = _1371 + (-1.0);
        float _1379 = fma(_1375, _1365, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1381 = _1377 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1383 = _1361 * _1379;
        float _1385 = fma(_1337, _1371, _1381);
        float _1387 = fma(_1321, _1383, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1389 = fma(_1317, _1383, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1343 = _1387;
        _1353 = _1385;
        _1345 = _1389;
    }
    float _1391 = _1343;
    float _1393 = _1353;
    float _1395 = _1345;
    float _1397 = -_1087;
    float _1399 = fma(_1397, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1391);
    float _1401 = -_1079;
    float _1403 = fma(_1401, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1393);
    float _1405 = -_1089;
    float _1407 = fma(_1405, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1395);
    float _1409 = _1403;
    float _1411 = _1399;
    float _1413 = _1407;
    if (!_1243)
    {
        float _1415 = _1113 * _1113;
        float _1417 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1419 = -_959;
        float _1421 = _1419 + _1393;
        float _1423 = -_981;
        float _1425 = _1423 + _1395;
        float _1427 = fma(_1117, _1117, _1415);
        float _1429 = fma(_1123, _1123, _1427);
        float _1431 = 1.0 / _1195;
        float _1433 = sqrt(_1429);
        float _1435 = precise::min(_1433, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1437 = _1435 * _1417;
        float _1439 = -_733;
        float _1441 = _1439 + _1391;
        float _1443 = _1437 * _1431;
        float _1445 = fma(_1441, _1443, _1101);
        float _1447 = fma(_1421, _1443, _1097);
        float _1449 = fma(_1425, _1443, _1105);
        _1409 = _1447;
        _1411 = _1445;
        _1413 = _1449;
    }
    float _1451 = _1409;
    float _1453 = _1411;
    float _1455 = _1413;
    float _1457 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1459 = _1451 + _1457;
    float _1461 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1463 = _1453 + _1461;
    float _1465 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1467 = _1455 + _1465;
    float _1469 = _1459 * _1459;
    float _1471 = fma(_1463, _1463, _1469);
    float _1473 = fma(_1467, _1467, _1471);
    float _1475 = rsqrt(_1473);
    float _1477 = sqrt(_1473);
    float _1479 = _1475 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1481 = _1463 * _1479;
    float _1483 = _1467 * _1479;
    float _1485 = _1481 * _1481;
    float _1487 = _1483 * _1483;
    float _1489 = _1485 + _1487;
    float _1491 = sqrt(_1489);
    bool _1493 = _1491 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1495 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1497 = _1491 + _1495;
    float _1499 = _1475;
    float _1501 = _1497;
    float _1503 = _1459;
    float _1505 = _1481;
    if (_1493)
    {
        float _1507 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1499 = _1507;
    }
    float _1509 = _1499;
    float _1511 = _1509;
    if (_1493)
    {
        float _1513 = _1497 * _1509;
        _1501 = _1513;
    }
    float _1515 = _1501;
    if (_1493)
    {
        float _1517 = rsqrt(_1489);
        _1511 = _1517;
    }
    float _1519 = _1511;
    float _1521 = _1519;
    if (_1493)
    {
        float _1523 = _1515 * 0.15915493667125701904296875;
        _1347 = _1523;
    }
    float _1525 = _1347;
    float _1527 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1529 = _1467;
    float _1531 = _1525;
    if (_1493)
    {
        float _1533 = _1525 * 6.283185482025146484375;
        float _1535 = sin(_1533);
        _1529 = _1535;
    }
    float _1537 = _1529;
    float _1539 = precise::max(0.0, _1527);
    float _1541 = _1393;
    float _1543 = _1539;
    if (_1493)
    {
        float _1545 = _1525 * 6.283185482025146484375;
        float _1547 = cos(_1545);
        _1541 = _1547;
    }
    float _1549 = _1541;
    float _1551 = -_1479;
    float _1553 = -_1539;
    float _1555 = fma(_1459, _1551, _1553);
    if (_1493)
    {
        float _1557 = _1555 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1503 = _1557;
    }
    float _1559 = _1503;
    float _1561 = _1537;
    float _1563 = _1559;
    if (_1493)
    {
        float _1565 = fma(_1537, _1559, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1561 = _1565;
    }
    float _1567 = _1561;
    float _1569 = _1567;
    if (!_1493)
    {
        _1563 = _1487;
    }
    float _1571 = _1563;
    float _1573 = _1571;
    if (_1493)
    {
        float _1575 = _1519 * _1567;
        _1009 = _1575;
    }
    float _1577 = _1009;
    if (!_1493)
    {
        _1521 = _1555;
    }
    float _1579 = _1521;
    float _1581 = _1579;
    if (_1493)
    {
        float _1583 = _1549 + (-1.0);
        _1543 = _1583;
    }
    float _1585 = _1543;
    float _1587 = _1585;
    if (_1493)
    {
        float _1589 = _1481 * _1577;
        _1505 = _1589;
    }
    float _1591 = _1505;
    if (!_1493)
    {
        _1569 = _1483;
    }
    float _1593 = _1569;
    float _1595 = _1593;
    if (_1493)
    {
        float _1597 = _1483 * _1577;
        _1595 = _1597;
    }
    float _1599 = _1595;
    if (_1493)
    {
        float _1601 = _1585 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1531 = _1601;
    }
    float _1603 = _1531;
    if (!_1493)
    {
        _1587 = _1485;
    }
    float _1605 = _1587;
    float _1607 = _1605;
    if (_1493)
    {
        float _1609 = _1591 * _1591;
        _1607 = _1609;
    }
    float _1611 = _1607;
    if (_1493)
    {
        float _1613 = _1599 * _1599;
        _1573 = _1613;
    }
    float _1615 = _1573;
    if (_1493)
    {
        float _1617 = fma(_1555, _1549, _1603);
        _1581 = _1617;
    }
    float _1619 = _1581;
    float _1621 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1623 = fma(_1619, _1619, _1611);
    float _1625 = _1451 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1627 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1629 = fma(_1477, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1627);
    float _1631 = precise::clamp(_1629, 0.0, 1.0);
    float _1633 = _1451 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1635 = _1623 + _1615;
    float _1637 = fma(_1453, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1625);
    float _1639 = _1451 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1641 = -_1631;
    float _1643 = _1641 + 1.0;
    float _1645 = rsqrt(_1635);
    float _1647 = fma(_1455, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1637);
    float _1649 = fma(_1453, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1639);
    float _1651 = _1451 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1653 = _1647 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1655 = fma(_1455, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1649);
    float _1657 = fma(_1453, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1651);
    float _1659 = abs(_1643);
    float _1661 = log2(_1659);
    float _1663 = fma(_1453, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1633);
    float _1665 = _1655 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1667 = fma(_1455, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1657);
    float _1669 = _1653 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1671 = fma(_1455, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1663);
    float _1673 = _1667 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1675 = _1645 * _1591;
    float _1677 = _1665 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1679 = _1645 * _1619;
    float _1681 = _1645 * _1599;
    float _1683 = _1675 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1685 = fma(_1673, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1677);
    float _1687 = -_1669;
    float _1689 = fma(_1687, _1621, 1.0);
    float _1691 = _1671 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1693 = _1661 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1695 = -_1683;
    float _1697 = fma(_1679, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1695);
    float _1699 = fma(_1653, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1685);
    float _1701 = _1665 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1703 = log2(_1689);
    float _1705 = -_1681;
    float _1707 = fma(_1705, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1697);
    float _1709 = fma(_1691, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1699);
    float _1711 = _1665 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1713 = fma(_1673, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1701);
    float _1715 = fma(_1707, -0.5, 0.5);
    float _1717 = fma(_1707, 0.5, 0.5);
    float _1719 = fma(_1673, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1711);
    float _1721 = exp2(_1693);
    float _1723 = _1679 + 1.0;
    float _1725 = fma(_1653, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1713);
    float _1727 = fma(_1653, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1719);
    float _1729 = fma(_1717, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1731 = 1.0 / _1709;
    float _1733 = fma(_1717, _1729, -0.212114393711090087890625);
    float _1735 = _1703 * 0.693147182464599609375;
    float _1737 = fma(_1717, _1733, 1.570728778839111328125);
    float _1739 = _1735 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1741 = sqrt(_1715);
    float _1743 = -_1679;
    float _1745 = fma(_1721, _1723, _1743);
    float _1747 = fma(_1691, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1727);
    float _1749 = fma(_1691, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1725);
    float _1751 = fma(_1745, 0.5, 0.5);
    float _1753 = _1747 * _1731;
    float _1755 = _1749 * _1731;
    float _1757 = fma(_1753, 0.5, 0.5);
    float _1759 = fma(_1755, -0.5, 0.5);
    float _1761 = _1741 * 0.636619746685028076171875;
    float3 _4622 = float3(_1757, _1759, _1739);
    float _1763 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4622, float3(0.0), isnan(_4622)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4622, float3(0.0), isnan(_4622)), level(0.0)).x;
    float3 _4633 = float3(_1757, _1759, _1739);
    float4 _1766 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4633, float3(0.0), isnan(_4633)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4633, float3(0.0), isnan(_4633)), level(0.0)).xyzw;
    float _1768 = _1766.x;
    float _1770 = _1766.y;
    float _1772 = _1766.z;
    float _1774 = _1766.w;
    float _1776 = -_1737;
    float _1778 = fma(_1761, _1776, 1.0);
    float2 _4655 = float2(_1778, _1751);
    float3 _1782 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4655, float2(0.0), isnan(_4655)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4655, float2(0.0), isnan(_4655)), level(0.0)).xyz;
    float _1784 = _1782.x;
    float _1786 = _1782.y;
    float _1788 = _1782.z;
    float _1790 = _1097 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _1792 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1794 = isnan(0.5);
    bool _1796 = _1792 || _1794;
    bool _1798 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1800 = _1796 || _1798;
    float _1802 = _1665 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_68.y = _1451;
    float _1804 = fma(_1101, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1790);
    float _1806 = _1097 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1808 = fma(_1673, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1802);
    float _1810 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1804);
    float _1812 = fma(_1101, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1806);
    float _1814 = fma(_1653, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1808);
    float _1816 = _1810 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1818 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1812);
    float _1820 = _1810;
    float _1822 = _1661;
    if (!_1800)
    {
        _257 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1824 = _257;
    float _1826 = _1661 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1828 = 1.0 / _1816;
    float _1830 = _1818 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    if (!_1800)
    {
        _1820 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1832 = _1820;
    float _1834 = fma(_1691, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1814);
    if (_1800)
    {
        _1822 = 1.0;
    }
    float _1836 = _1822;
    float _1838 = _1830 + _1816;
    float _1840 = _1836;
    if (!_1800)
    {
        float _1842 = -_1832;
        float _1844 = _1842 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1173 = _1844;
    }
    float _1846 = _1173;
    float _1848 = exp2(_1826);
    float _1850 = _1834 + _1709;
    float _1852 = _1838 * _1828;
    float _1854 = _1852 * 0.5;
    float _1856 = _1846;
    float _1858 = _1854;
    if (!_1800)
    {
        float _1860 = 1.0 / _1846;
        _1856 = _1860;
    }
    float _1862 = _1856;
    if (!_1800)
    {
        float _1864 = -_1824;
        float _1866 = fma(_1854, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1864);
        _1858 = _1866;
    }
    float _1868 = _1858;
    float _1870 = _1824;
    if (!_1800)
    {
        float _1872 = 1.0 / _1868;
        _1870 = _1872;
    }
    float _1874 = _1870;
    float _1876 = _1850 * 0.5;
    float _1878 = _1874;
    if (!_1800)
    {
        float _1880 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1882 = -_1832;
        float _1884 = fma(_1874, _1880, _1882);
        _1878 = _1884;
    }
    float _1886 = _1878;
    if (!_1800)
    {
        float _1888 = _1886 * _1862;
        float _1890 = precise::clamp(_1888, 0.0, 1.0);
        _1840 = _1890;
    }
    float _1892 = _1840;
    float _1894 = -_1848;
    float _1896 = _1894 + 1.0;
    float _1898 = _1892 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1900 = _1896 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _1902 = _1892 > 0.0;
    bool _1904 = isnan(_1892);
    bool _1906 = _1902 || _1904;
    bool _1908 = isnan(0.0);
    bool _1910 = _1906 || _1908;
    out.gl_Position.x = _1747;
    out.gl_Position.y = _1749;
    out.gl_Position.z = _1834;
    out.gl_Position.w = _1709;
    float _1912 = -_1900;
    float _1914 = _1912 + 1.0;
    float _1916 = _1898 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_70.z = _1876;
    out.m_70.w = _1709;
    out.m_45.x = _1916;
    float _1918 = _1900 * _1763;
    float _1920 = _1774 * _1918;
    float _1922 = _1774 * _1914;
    float _1924 = _1788 * _1918;
    float _1926 = fma(_1784, _1920, _1768);
    float _1928 = fma(_1786, _1920, _1770);
    float _1930 = fma(_1774, _1924, _1772);
    out.m_72.x = _1926;
    out.m_72.y = _1928;
    out.m_72.z = _1930;
    out.m_72.w = _1922;
    if (_1910)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _1932 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1932;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

