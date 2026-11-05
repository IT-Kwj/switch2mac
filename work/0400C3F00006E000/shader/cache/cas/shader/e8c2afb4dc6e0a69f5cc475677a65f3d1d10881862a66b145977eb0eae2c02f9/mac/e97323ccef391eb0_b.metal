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
    float4 m_64 [[user(locn0)]];
    float4 m_62 [[user(locn1)]];
    float4 m_70 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_68 [[user(locn4)]];
    float4 m_72 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_58 [[attribute(1)]];
    float4 m_56 [[attribute(2)]];
    float4 m_60 [[attribute(3)]];
    float4 m_66 [[attribute(4)]];
    float4 m_42 [[attribute(5)]];
    float4 m_47 [[attribute(6)]];
    float4 m_54 [[attribute(7)]];
    float4 m_52 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _603 = false;
    bool _307 = false;
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
        float _2043 = as_type<float>(_107);
        out.gl_Position.z = _2043;
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
        out.m_45.x = 0.0;
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
        float _2113 = as_type<float>(_145);
        out.gl_Position.z = _2113;
    }
    if (_137)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _147 = as_type<float>(int(gl_VertexIndex));
    float _149 = in.m_52.w;
    bool _151 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _153 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _155 = _151 || _153;
    bool _157 = isnan(1.0);
    bool _159 = _155 || _157;
    float _161 = in.m_47.x;
    float _163 = in.m_47.y;
    float _165 = in.m_47.z;
    float _167 = in.m_42.x;
    float _169 = in.m_42.y;
    float _171 = in.m_42.z;
    int _173 = as_type<int>(_147) & 1;
    bool _175 = _173 != 0;
    int _177 = as_type<int>(_147) & 2;
    bool _179 = _177 != 0;
    float _181 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _183 = 0.0;
    float _185 = _181;
    if (!_159)
    {
        float _187 = _181 * _181;
        float _189 = _187 * 0.5;
        _183 = _189;
    }
    float _191 = _183;
    bool _193 = !_175;
    float _195 = _193 ? (-0.5) : 0.5;
    bool _197 = !_179;
    float _199 = _197 ? (-0.5) : 0.5;
    float _201 = _191;
    if (!_159)
    {
        float _203 = _191 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _201 = _203;
    }
    float _205 = _201;
    bool _207 = !_159;
    float _209 = _205;
    if (!_207)
    {
        float _211 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _213 = log2(_211);
        float _215 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _217 = _215 + 1.0;
        float _219 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _221 = _181 * _213;
        float _223 = 1.0 / _217;
        float _225 = _219 * 0.693147182464599609375;
        float _227 = exp2(_221);
        float _229 = 1.0 / _225;
        float _231 = _227 + (-1.0);
        float _233 = -_231;
        float _235 = fma(_233, _229, _181);
        float _237 = _235 * _223;
        float _239 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _209 = _239;
    }
    float _241 = _209;
    bool _243 = !_159;
    if (!_243)
    {
        float _245 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _247 = log2(_245);
        float _249 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _251 = _249 + 1.0;
        float _253 = 1.0 / _251;
        float _255 = _181 * _247;
        float _257 = exp2(_255);
        float _259 = -_257;
        float _261 = _259 + 1.0;
        float _263 = _261 * _253;
        _185 = _263;
    }
    float _265 = _185;
    bool _267 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _269 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _271 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _273 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _275 = fma(_265, _161, _269);
    float _277 = fma(_265, _163, _271);
    float _279 = fma(_265, _165, _273);
    float _281 = fma(_275, _149, _167);
    float _283 = fma(_277, _149, _169);
    float _285 = fma(_279, _149, _171);
    bool _287 = !_267;
    float _305;
    if (!_287)
    {
        float _289 = in.m_54.x;
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
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _319 = _315 + _317;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _323 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _321;
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _327 = _325 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _331 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _329;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _335 = _333 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _337 = 1.0 / _323;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _341 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _339;
    float _343 = 1.0 / _327;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _347 = _315 + _345;
    bool _349 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _351 = 1.0 / _331;
    float _353 = _347 * _337;
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _357 = _315 + _355;
    bool _359 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _361 = isnan(_315);
    bool _363 = _359 || _361;
    bool _365 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _367 = _363 || _365;
    float _369 = float(_367);
    bool _371 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _373 = isnan(_315);
    bool _375 = _371 || _373;
    bool _377 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _379 = _375 || _377;
    float _381 = float(_379);
    float _383 = 1.0 / _335;
    float _385 = _319 * _343;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _389 = _315 + _387;
    bool _391 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _393 = isnan(_315);
    bool _395 = _391 || _393;
    bool _397 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _399 = _395 || _397;
    float _401 = float(_399);
    float _403 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _405 = _315 + _403;
    float _407 = 1.0 / _341;
    float _409 = _357 * _351;
    bool _411 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _413 = isnan(_315);
    bool _415 = _411 || _413;
    bool _417 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _419 = _415 || _417;
    float _421 = float(_419);
    bool _423 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _425 = isnan(_315);
    bool _427 = _423 || _425;
    bool _429 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _431 = _427 || _429;
    float _433 = float(_431);
    float _435 = -_421;
    float _437 = _435 + 1.0;
    float _439 = _389 * _383;
    float _441 = -_369;
    float _443 = _441 + 1.0;
    float _445 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _447 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _445;
    float _449 = _401 * _437;
    float _451 = -_401;
    float _453 = _451 + 1.0;
    float _455 = _421 * _443;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _457;
    bool _461 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _463 = isnan(_315);
    bool _465 = _461 || _463;
    bool _467 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _469 = _465 || _467;
    float _471 = float(_469);
    float _473 = _405 * _407;
    float _475 = fma(_447, _353, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _477 = fma(_459, _353, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _479 = _381 * _453;
    float _481 = -_381;
    float _483 = _481 + 1.0;
    float _485 = -_471;
    float _487 = _485 + 1.0;
    float _489 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _491 = _489 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _495 = _493 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _497 = _471 * _483;
    float _499 = _433 * _487;
    float _501 = fma(_491, _385, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _505 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _503;
    float _507 = _477 * _499;
    float _509 = -_433;
    float _511 = _509 + 1.0;
    float _513 = _475 * _499;
    float _515 = fma(_495, _385, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _517 = fma(_505, _409, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _521 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _519;
    float _523 = fma(_511, (*spvDescriptorSet0.vp_c9)._m0[143].x, _507);
    float _525 = fma(_511, (*spvDescriptorSet0.vp_c9)._m0[143].y, _513);
    float _527 = in.m_52.x;
    float _529 = in.m_52.y;
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _533 = _531 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _535 = fma(_521, _409, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _537 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _539 = _537 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _541 = fma(_501, _497, _523);
    float _543 = fma(_515, _497, _525);
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _547 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _545;
    float _549 = fma(_533, _439, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _551 = fma(_539, _439, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _555 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _553;
    float _557 = fma(_517, _479, _541);
    float _559 = fma(_535, _479, _543);
    float _561 = fma(_547, _473, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _563 = fma(_555, _473, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _565 = fma(_549, _449, _557);
    float _567 = fma(_551, _449, _559);
    float _569 = fma(_561, _455, _565);
    float _571 = fma(_563, _455, _567);
    float _573 = fma(_369, (*spvDescriptorSet0.vp_c9)._m0[148].x, _569);
    float _575 = fma(_369, (*spvDescriptorSet0.vp_c9)._m0[148].y, _571);
    float _577 = _573 * _527;
    float _579 = _575 * _529;
    bool _581 = !_349;
    float _583 = _565;
    float _601;
    if (!_581)
    {
        float _585 = in.m_54.x;
        float _587 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _589 = _585 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _591 = fma(_589, (*spvDescriptorSet0.vp_c9)._m0[11].y, _125);
        float _593 = _591 * _587;
        float _595 = floor(_593);
        float _597 = -_595;
        float _599 = _593 + _597;
        _601 = _599;
        _603 = true;
    }
    else
    {
        float _605 = float(_91);
        float _607 = 1.0 / _605;
        float _609 = _125 * _607;
        _601 = _609;
    }
    _603 = false;
    float _611 = _601;
    float _613 = in.m_54.z;
    float _615 = in.m_54.x;
    int _617 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _619 = _617 != 0;
    int _621 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _623 = _621 != 0;
    float _625 = in.m_54.w;
    float _627 = in.m_56.x;
    float _629 = in.m_56.y;
    float _631 = in.m_56.z;
    float _633 = in.m_56.w;
    float _635 = in.m_58.x;
    float _637 = in.m_58.y;
    float _639 = in.m_58.z;
    float _641 = in.m_58.w;
    float _643 = _543;
    if (!_619)
    {
        float _645 = in.m_54.y;
        _643 = _645;
    }
    float _647 = _643;
    float _649 = _613 * 2.0;
    float _651 = in.m_60.x;
    float _653 = in.m_60.y;
    float _655 = in.m_60.z;
    float _657 = in.m_60.w;
    bool _659 = _613 > 0.5;
    float _661 = _615 * 2.0;
    float _663 = floor(_649);
    bool _665 = _625 > 0.5;
    float _667 = _283 * _629;
    float _669 = floor(_661);
    float _671 = _283 * _637;
    float _673 = fma(_281, _627, _667);
    float _675 = _637;
    if (!_619)
    {
        _675 = _613;
    }
    float _677 = _675;
    float _679 = _677;
    if (!_619)
    {
        _583 = _647;
    }
    float _681 = _583;
    float _683 = fma(_281, _635, _671);
    bool _685 = _663 > 0.0;
    float _687 = fma(_285, _631, _673);
    bool _689 = _663 >= 0.0;
    bool _691 = isnan(_663);
    bool _693 = _689 || _691;
    bool _695 = isnan(0.0);
    bool _697 = _693 || _695;
    float _699 = _283 * _653;
    float _701 = -_195;
    int _703 = _659 ? as_type<int>(_701) : as_type<int>(_195);
    float _705 = _681;
    float _707 = _647;
    float _709 = _653;
    if (_619)
    {
        float _711 = in.m_54.x;
        float _713 = in.m_54.y;
        _705 = _711;
        _707 = _713;
    }
    float _715 = _705;
    float _717 = _707;
    int _719 = _697 ? 0 : 1;
    float _721 = fma(_285, _639, _683);
    bool _723 = _669 > 0.0;
    float _725 = fma(_281, _651, _699);
    int _727 = ~_719;
    int _729 = _727 + 1;
    int _731 = _729 + 1;
    float _733 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _735 = _611 + _733;
    bool _737 = _669 >= 0.0;
    bool _739 = isnan(_669);
    bool _741 = _737 || _739;
    bool _743 = isnan(0.0);
    bool _745 = _741 || _743;
    float _747 = fma(_285, _655, _725);
    int _749 = _731;
    if (!_685)
    {
        int _751 = ~_719;
        int _753 = _751 + 1;
        _749 = _753;
    }
    int _755 = _749;
    int _757 = _745 ? 0 : 1;
    int _759 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _761 = _759 != 0;
    float _763 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _765 = _763 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _767 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _769 = _767 != 0;
    int _771 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _773 = _771 != 0;
    float _775 = 1.0 / _765;
    int _777 = ~_757;
    int _779 = _777 + 1;
    int _781 = _779 + 1;
    int _783 = _781;
    if (!_723)
    {
        int _785 = ~_757;
        int _787 = _785 + 1;
        _783 = _787;
    }
    int _789 = _783;
    bool _791 = !_623;
    float _793 = _791 ? _195 : as_type<float>(_703);
    float _795 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _797 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _799 = _795 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _801 = _611 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _803 = isnan(_611);
    bool _805 = _801 || _803;
    bool _807 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _809 = _805 || _807;
    float _811 = float(_809);
    float _813 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _815 = _611 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _817 = isnan(_611);
    bool _819 = _815 || _817;
    bool _821 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _823 = _819 || _821;
    float _825 = float(_823);
    float _827 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _829 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _827;
    float _831 = _797 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _833 = -_811;
    float _835 = _833 + 1.0;
    float _837 = _813 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _839 = _829 * _775;
    float _841 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (!_619)
    {
        _709 = _613;
    }
    float _843 = _709;
    float _845 = fma(_839, _735, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _847 = _721 + _641;
    float _849 = _825 * _835;
    out.m_62.x = _837;
    out.m_62.y = _799;
    out.m_62.z = _831;
    float _851 = -_825;
    float _853 = _851 + 1.0;
    float _855 = _845 * _849;
    float _857 = _843;
    if (_619)
    {
        _679 = _717;
    }
    float _859 = _679;
    float _861 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _863 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _865 = fma(_853, (*spvDescriptorSet0.vp_c9)._m0[115].x, _855);
    if (_619)
    {
        _857 = _717;
    }
    float _867 = _857;
    float _869 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _871 = log2(_869);
    int _873 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _875 = _873 != 0;
    int _877 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _879 = _877 != 0;
    int _881 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _883 = _881 != 0;
    float _885 = _859 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _887 = _687 + _633;
    float _889 = _747 + _657;
    float _891 = _715 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _893 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _895 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _897 = -_863;
    float _899 = fma(_891, 2.0, _897);
    float _901 = fma(_811, (*spvDescriptorSet0.vp_c9)._m0[116].x, _865);
    float _903 = _615 + _717;
    float _905 = fma(_715, (*spvDescriptorSet0.vp_c9)._m0[83].z, _895);
    float _907 = fma(_867, (*spvDescriptorSet0.vp_c9)._m0[83].w, _861);
    float _909 = _613 + _717;
    bool _911 = !_875;
    int _913 = _911 ? 0 : 1;
    float _915 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _917 = _903 + (-1.0);
    float _919 = _909 + (-1.0);
    float _921 = _717 * 2.0;
    int _923 = abs(_913);
    float _925 = fma(_885, -2.0, _915);
    float _927 = fma(_917, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _929 = fma(_919, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _931 = _893 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _933 = _793 + 0.5;
    float _935 = -_125;
    float _937 = fma(_935, (*spvDescriptorSet0.vp_c9)._m0[81].x, _899);
    float _939 = float(_923);
    float _941 = floor(_921);
    float _943 = float(_755);
    float _945 = fma(_931, _933, _937);
    bool _947 = !_879;
    int _949 = _947 ? 0 : 1;
    float _951 = _871 * _125;
    float _953 = _939 * _943;
    float _955 = _901 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _957 = exp2(_951);
    int _959 = abs(_949);
    float _961 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _963 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _965 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _967 = float(_959);
    float _969 = _961 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _971 = float(_789);
    float _973 = _963 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _975 = _965 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _977 = _941 > 0.0;
    float _979 = _967 * _971;
    bool _981 = _941 >= 0.0;
    bool _983 = isnan(_941);
    bool _985 = _981 || _983;
    bool _987 = isnan(0.0);
    bool _989 = _985 || _987;
    float _991 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _993 = 1.0 + _991;
    float _995 = -_199;
    int _997 = _665 ? as_type<int>(_995) : as_type<int>(_199);
    float _999 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1001 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1003 = _887 + _1001;
    out.m_64.x = _969;
    out.m_64.y = _973;
    out.m_64.z = _975;
    out.m_64.w = _955;
    bool _1005 = !_761;
    float _1007 = _1005 ? _199 : as_type<float>(_997);
    float _1009 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1011 = _847 + _1009;
    bool _1013 = _615 > 0.5;
    float _1015 = -_957;
    float _1017 = _1015 + 1.0;
    bool _1019 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1021 = isnan(0.0);
    bool _1023 = _1019 || _1021;
    bool _1025 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1027 = _1023 || _1025;
    float _1029 = 1.0 / _993;
    float _1031 = -_195;
    int _1033 = _1013 ? as_type<int>(_1031) : as_type<int>(_195);
    float _1035 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[81].y, _925);
    bool _1037 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1039 = isnan(1.0);
    bool _1041 = _1037 || _1039;
    bool _1043 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1045 = _1041 || _1043;
    float _1047 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[82].w, _907);
    bool _1049 = !_769;
    float _1051 = _1049 ? _195 : as_type<float>(_1033);
    float _1053 = _1003 * _1003;
    bool _1055 = _717 > 0.5;
    float _1057 = _1003 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1059 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1061 = _889 + _1059;
    float _1063 = _999 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1065 = _1007 + (-0.5);
    float _1067 = fma(_1011, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1057);
    float _1069 = _1027 ? _1017 : 0.0;
    float _1071 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1073 = -_1063;
    float _1075 = -_1035;
    float _1077 = fma(_1073, _1065, _1075);
    float _1079 = fma(_1061, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1067);
    float _1081 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[82].z, _905);
    float _1083 = _945;
    if (_1045)
    {
        float _1085 = _1069 * _1029;
        _127 = _1085;
    }
    float _1087 = _127;
    float _1089 = -_199;
    int _1091 = _1055 ? as_type<int>(_1089) : as_type<int>(_199);
    float _1093 = _1051 + 0.5;
    bool _1095 = _1079 >= 0.0;
    float _1097 = fma(_1011, _1011, _1053);
    float _1099 = in.m_66.x;
    float _1101 = in.m_66.y;
    float _1103 = in.m_66.z;
    int _1105 = _989 ? 0 : 1;
    float _1107 = -_1081;
    float _1109 = _1107 + 1.0;
    bool _1111 = !_773;
    float _1113 = _1111 ? _199 : as_type<float>(_1091);
    float _1115 = fma(_1061, _1061, _1097);
    int _1117 = ~_1105;
    int _1119 = _1117 + 1;
    int _1121 = _1119 + 1;
    float _1123 = _1093 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _1125 = _1121;
    if (!_977)
    {
        int _1127 = ~_1105;
        int _1129 = _1127 + 1;
        _1125 = _1129;
    }
    int _1131 = _1125;
    float _1133 = -_1113;
    float _1135 = _1133 + 0.5;
    float _1137 = -_1047;
    float _1139 = _1137 + 1.0;
    float _1141 = -_1109;
    float _1143 = fma(_793, _1141, _945);
    if (_1095)
    {
        _1083 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1145 = _1083;
    float _1147 = _1135 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1149 = fma(_1007, _1139, _1077);
    float _1151 = rsqrt(_1115);
    float _1153 = _953 * (-2.0);
    float _1155 = _1123 * _841;
    float _1157 = _1147 * _1071;
    int _1159 = as_type<int>(_1145);
    if (_1095)
    {
        float _1161 = _1145 * 5.0;
        _1159 = as_type<int>(_1161);
    }
    int _1163 = _1159;
    float _1165 = fma(_927, _1153, _927);
    if (_1095)
    {
        out.m_45.x = 0.0;
    }
    float _1167 = fma(_1153, _1099, _1099);
    float _1169 = _979 * (-2.0);
    out.m_68.x = _1155;
    out.m_68.y = _1157;
    out.m_68.z = _1143;
    out.m_68.w = _1149;
    bool _1171 = !_883;
    int _1173 = _1171 ? 0 : 1;
    float _1175 = fma(_929, _1169, _929);
    if (_1095)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3720 = as_type<float>(_1163);
        out.gl_Position.z = _3720;
    }
    float _1177 = _1003 * _1151;
    float _1179 = _1011 * _1151;
    if (_1095)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1181 = -_1177;
    float _1183 = fma(_1181, (*spvDescriptorSet0.vp_c9)._m0[18].w, _887);
    float _1185 = fma(_1169, _1101, _1101);
    float _1187 = _615 + (-0.5);
    float _1189 = -_1179;
    float _1191 = fma(_1189, (*spvDescriptorSet0.vp_c9)._m0[18].w, _847);
    float _1193 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1195 = _1183 + _1193;
    float _1197 = _717 + (-0.5);
    float _1199 = fma(_1187, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1167);
    float _1201 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1203 = _1191 + _1201;
    float _1205 = _1195 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1207 = _1061 * _1151;
    int _1209 = abs(_1173);
    float _1211 = fma(_1197, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1185);
    float _1213 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1205);
    float _1215 = -_1207;
    float _1217 = fma(_1215, (*spvDescriptorSet0.vp_c9)._m0[18].w, _889);
    float _1219 = -_1177;
    float _1221 = fma(_1219, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1003);
    float _1223 = -_1179;
    float _1225 = fma(_1223, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1011);
    float _1227 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1229 = _1217 + _1227;
    float _1231 = float(_1209);
    float _1233 = _1221 * _1221;
    float _1235 = float(_1131);
    float _1237 = fma(_1229, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1213);
    float _1239 = -_1207;
    float _1241 = fma(_1239, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1061);
    float _1243 = fma(_1225, _1225, _1233);
    float _1245 = _615 + _613;
    float _1247 = _1231 * _1235;
    float _1249 = fma(_1241, _1241, _1243);
    float _1251 = _1245 + (-1.0);
    float _1253 = _1247 * (-2.0);
    float _1255 = _613 + (-0.5);
    bool _1257 = _1237 >= 0.0;
    float _1259 = fma(_1251, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1261 = fma(_1253, _1103, _1103);
    float _1263 = fma(_1165, _1087, _1199);
    float _1265 = fma(_1175, _1087, _1211);
    float _1267 = fma(_1259, _1253, _1259);
    float _1269 = fma(_1255, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1261);
    float _1271 = _1263 * 0.15915493667125701904296875;
    float _1273 = sqrt(_1249);
    float _1275 = _1265 * 0.15915493667125701904296875;
    float _1277 = fma(_1267, _1087, _1269);
    float _1279 = _1261;
    float _1281 = _1217;
    if (_1257)
    {
        _1279 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1283 = _1279;
    float _1285 = _1277 * 0.15915493667125701904296875;
    int _1287 = as_type<int>(_1283);
    if (_1257)
    {
        out.m_45.x = 0.0;
    }
    float _1289 = _1271 * 6.283185482025146484375;
    float _1291 = sin(_1289);
    if (_1257)
    {
        float _1293 = _1283 * 5.0;
        _1287 = as_type<int>(_1293);
    }
    int _1295 = _1287;
    if (_1257)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3932 = as_type<float>(_1295);
        out.gl_Position.z = _3932;
    }
    float _1297 = _1271 * 6.283185482025146484375;
    float _1299 = cos(_1297);
    float _1301 = _1151 * _1273;
    float _1303 = _1275 * 6.283185482025146484375;
    float _1305 = sin(_1303);
    float _1307 = _1275 * 6.283185482025146484375;
    float _1309 = cos(_1307);
    float _1311 = _1285 * 6.283185482025146484375;
    float _1313 = sin(_1311);
    if (_1257)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1315 = _1285 * 6.283185482025146484375;
    float _1317 = cos(_1315);
    float _1319 = _579 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1321 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _199);
    float _1323 = _577 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1325 = _1291 * _1305;
    float _1327 = _1301 * _1319;
    float _1329 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _195);
    float _1331 = _1301 * _1323;
    float _1333 = _1299 * _1305;
    float _1335 = _1321 * _1327;
    float _1337 = _1299 * _1309;
    float _1339 = _1329 * _1331;
    float _1341 = -_1335;
    float _1343 = _1313 * _1341;
    float _1345 = fma(_1313, _1337, _1325);
    float _1347 = fma(_1313, _1325, _1337);
    float _1349 = _1317 * _1335;
    float _1351 = _1305 * _1317;
    float _1353 = _1299 * _1349;
    float _1355 = _1309 * _1317;
    float _1357 = _1291 * _1309;
    float _1359 = _1291 * _1349;
    float _1361 = fma(_1345, _1339, _1353);
    float _1363 = _1301 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1365 = _1363 * 0.5;
    float _1367 = -_1357;
    float _1369 = fma(_1313, _1333, _1367);
    float _1371 = fma(_1355, _1339, _1343);
    float _1373 = -_1333;
    float _1375 = fma(_1313, _1357, _1373);
    float _1377 = fma(_1369, _1365, _1361);
    float _1379 = fma(_1351, _1365, _1371);
    float _1381 = fma(_1375, _1339, _1359);
    float _1383 = _1377 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1385 = _1377 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1387 = fma(_1347, _1365, _1381);
    float _1389 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1383);
    float _1391 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1385);
    float _1393 = fma(_1387, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1389);
    float _1395 = fma(_1387, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1391);
    float _1397 = _1393 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1399 = _1395 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1401 = _889 + _1397;
    float _1403 = _847 + _1399;
    float _1405 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1407 = _1401 + _1405;
    float _1409 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1411 = _1403 + _1409;
    float _1413 = _1407 * _1407;
    float _1415 = fma(_1411, _1411, _1413);
    float _1417 = _1377 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1419 = sqrt(_1415);
    float _1421 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1417);
    float _1423 = fma(_1387, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1421);
    float _1425 = _1423 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1427 = _887 + _1425;
    bool _1429 = _1419 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1431 = _1425;
    float _1433 = _1403;
    float _1435 = _1401;
    float _1437 = _1419;
    float _1439 = _1361;
    if (!_1429)
    {
        _1431 = _1427;
    }
    float _1441 = _1431;
    bool _1443 = !_1429;
    float _1445 = _1441;
    if (!_1443)
    {
        float _1447 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1449 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1451 = _1419 + _1449;
        float _1453 = _1427 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1455 = rsqrt(_1415);
        float _1457 = _1451 * _1447;
        float _1459 = _1457 * 0.15915493667125701904296875;
        float _1461 = _1459 * 6.283185482025146484375;
        float _1463 = cos(_1461);
        float _1465 = _1459 * 6.283185482025146484375;
        float _1467 = sin(_1465);
        float _1469 = _1463 + (-1.0);
        float _1471 = _1469 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1473 = fma(_1467, _1453, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1475 = fma(_1427, _1463, _1471);
        float _1477 = _1455 * _1473;
        float _1479 = fma(_1411, _1477, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1481 = fma(_1407, _1477, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1445 = _1475;
        _1433 = _1479;
        _1435 = _1481;
        _1437 = _1459;
    }
    float _1483 = _1445;
    float _1485 = _1433;
    float _1487 = _1435;
    float _1489 = _1437;
    float _1491 = -_1177;
    float _1493 = fma(_1491, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1483);
    float _1495 = -_1179;
    float _1497 = fma(_1495, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1485);
    float _1499 = -_1207;
    float _1501 = fma(_1499, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1487);
    float _1503 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1505 = _1493 + _1503;
    float _1507 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1509 = _1497 + _1507;
    float _1511 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1513 = _1501 + _1511;
    float _1515 = _1505 * _1505;
    float _1517 = fma(_1509, _1509, _1515);
    float _1519 = fma(_1513, _1513, _1517);
    float _1521 = rsqrt(_1519);
    float _1523 = sqrt(_1519);
    float _1525 = _1521 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1527 = _1509 * _1525;
    float _1529 = _1513 * _1525;
    float _1531 = _1527 * _1527;
    float _1533 = _1529 * _1529;
    float _1535 = _1531 + _1533;
    float _1537 = sqrt(_1535);
    bool _1539 = _1537 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1541 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1543 = _1537 + _1541;
    float _1545 = _1513;
    float _1547 = _1489;
    float _1549 = _1543;
    float _1551 = _1517;
    float _1553 = _1505;
    if (_1539)
    {
        float _1555 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1545 = _1555;
    }
    float _1557 = _1545;
    if (_1539)
    {
        float _1559 = rsqrt(_1535);
        _1547 = _1559;
    }
    float _1561 = _1547;
    float _1563 = _1561;
    if (_1539)
    {
        float _1565 = _1543 * _1557;
        _1549 = _1565;
    }
    float _1567 = _1549;
    if (_1539)
    {
        float _1569 = _1567 * 0.15915493667125701904296875;
        _1551 = _1569;
    }
    float _1571 = _1551;
    float _1573 = _1521;
    if (_1539)
    {
        float _1575 = _1571 * 6.283185482025146484375;
        float _1577 = sin(_1575);
        _1573 = _1577;
    }
    float _1579 = _1573;
    float _1581 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1583 = precise::max(0.0, _1581);
    float _1585 = _1485;
    float _1587 = _1583;
    float _1589 = _1581;
    if (_1539)
    {
        float _1591 = _1571 * 6.283185482025146484375;
        float _1593 = cos(_1591);
        _1585 = _1593;
    }
    float _1595 = _1585;
    float _1597 = -_1525;
    float _1599 = -_1583;
    float _1601 = fma(_1505, _1597, _1599);
    if (!_1539)
    {
        _1587 = _1529;
    }
    float _1603 = _1587;
    float _1605 = _1603;
    if (_1539)
    {
        float _1607 = _1601 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1589 = _1607;
    }
    float _1609 = _1589;
    float _1611 = _1579;
    float _1613 = _1609;
    if (_1539)
    {
        float _1615 = fma(_1579, _1609, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1553 = _1615;
    }
    float _1617 = _1553;
    float _1619 = _1617;
    if (!_1539)
    {
        _1611 = _1601;
    }
    float _1621 = _1611;
    float _1623 = _1621;
    if (_1539)
    {
        float _1625 = _1595 + (-1.0);
        _1613 = _1625;
    }
    float _1627 = _1613;
    float _1629 = _1627;
    if (_1539)
    {
        float _1631 = _1561 * _1617;
        _1439 = _1631;
    }
    float _1633 = _1439;
    if (!_1539)
    {
        _1563 = _1527;
    }
    float _1635 = _1563;
    float _1637 = _1635;
    if (_1539)
    {
        float _1639 = _1627 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1619 = _1639;
    }
    float _1641 = _1619;
    float _1643 = _1641;
    if (_1539)
    {
        float _1645 = _1527 * _1633;
        _1637 = _1645;
    }
    float _1647 = _1637;
    if (!_1539)
    {
        _1629 = _1531;
    }
    float _1649 = _1629;
    float _1651 = _1649;
    if (_1539)
    {
        float _1653 = _1529 * _1633;
        _1605 = _1653;
    }
    float _1655 = _1605;
    if (_1539)
    {
        float _1657 = fma(_1601, _1595, _1641);
        _1623 = _1657;
    }
    float _1659 = _1623;
    if (_1539)
    {
        float _1661 = _1647 * _1647;
        _1651 = _1661;
    }
    float _1663 = _1651;
    if (!_1539)
    {
        _1643 = _1533;
    }
    float _1665 = _1643;
    float _1667 = _1665;
    if (_1539)
    {
        float _1669 = _1655 * _1655;
        _1667 = _1669;
    }
    float _1671 = _1667;
    float _1673 = fma(_1659, _1659, _1663);
    float _1675 = _1493 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1677 = _1673 + _1671;
    float _1679 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1681 = fma(_1523, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1679);
    float _1683 = precise::clamp(_1681, 0.0, 1.0);
    float _1685 = fma(_1497, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1675);
    float _1687 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1689 = rsqrt(_1677);
    float _1691 = -_1683;
    float _1693 = _1691 + 1.0;
    float _1695 = _1493 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1697 = fma(_1501, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1685);
    float _1699 = _1493 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1701 = _1493 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1703 = fma(_1497, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1695);
    float _1705 = _1697 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1707 = abs(_1693);
    float _1709 = log2(_1707);
    float _1711 = fma(_1497, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1699);
    float _1713 = fma(_1501, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1703);
    float _1715 = fma(_1497, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1701);
    float _1717 = _1705 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1719 = fma(_1501, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1711);
    float _1721 = _1713 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1723 = fma(_1501, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1715);
    float _1725 = _1689 * _1647;
    float _1727 = _1719 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1729 = _1721 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1731 = _1723 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1733 = _1689 * _1659;
    float _1735 = _1725 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1737 = fma(_1727, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1729);
    float _1739 = _1689 * _1655;
    float _1741 = _1709 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1743 = -_1735;
    float _1745 = fma(_1733, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1743);
    float _1747 = fma(_1705, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1737);
    float _1749 = -_1717;
    float _1751 = fma(_1749, _1687, 1.0);
    float _1753 = _1721 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1755 = -_1739;
    float _1757 = fma(_1755, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1745);
    float _1759 = exp2(_1741);
    float _1761 = fma(_1731, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1747);
    float _1763 = _1721 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1765 = fma(_1757, -0.5, 0.5);
    float _1767 = fma(_1757, 0.5, 0.5);
    float _1769 = fma(_1727, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1763);
    float _1771 = fma(_1727, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1753);
    float _1773 = log2(_1751);
    float _1775 = _1733 + 1.0;
    float _1777 = fma(_1767, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1779 = fma(_1705, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1769);
    float _1781 = fma(_1705, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1771);
    float _1783 = 1.0 / _1761;
    float _1785 = -_1733;
    float _1787 = fma(_1759, _1775, _1785);
    float _1789 = fma(_1767, _1777, -0.212114393711090087890625);
    float _1791 = fma(_1731, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1779);
    float _1793 = fma(_1731, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1781);
    float _1795 = fma(_1787, 0.5, 0.5);
    float _1797 = fma(_1767, _1789, 1.570728778839111328125);
    float _1799 = sqrt(_1765);
    float _1801 = _1773 * 0.693147182464599609375;
    float _1803 = _1801 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1805 = _1791 * _1783;
    float _1807 = _1793 * _1783;
    float _1809 = fma(_1805, 0.5, 0.5);
    float _1811 = fma(_1807, -0.5, 0.5);
    float _1813 = _1799 * 0.636619746685028076171875;
    float3 _4785 = float3(_1809, _1811, _1803);
    float _1815 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4785, float3(0.0), isnan(_4785)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4785, float3(0.0), isnan(_4785)), level(0.0)).x;
    float3 _4796 = float3(_1809, _1811, _1803);
    float4 _1818 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4796, float3(0.0), isnan(_4796)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4796, float3(0.0), isnan(_4796)), level(0.0)).xyzw;
    float _1820 = _1818.x;
    float _1822 = _1818.y;
    float _1824 = _1818.z;
    float _1826 = _1818.w;
    float _1828 = -_1797;
    float _1830 = fma(_1813, _1828, 1.0);
    float2 _4818 = float2(_1830, _1795);
    float3 _1834 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4818, float2(0.0), isnan(_4818)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4818, float2(0.0), isnan(_4818)), level(0.0)).xyz;
    float _1836 = _1834.x;
    float _1838 = _1834.y;
    float _1840 = _1834.z;
    float _1842 = _1183 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1844 = _1183 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1846 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1848 = isnan(0.5);
    bool _1850 = _1846 || _1848;
    bool _1852 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1854 = _1850 || _1852;
    float _1856 = _1709 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1858 = fma(_1191, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1842);
    float _1860 = fma(_1191, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1844);
    float _1862 = _1721 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1864 = fma(_1217, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1858);
    float _1866 = fma(_1217, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1860);
    float _1868 = exp2(_1856);
    float _1870 = fma(_1727, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1862);
    float _1872 = _1864 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1874 = _1866 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1876 = _1809;
    float _1878 = _1864;
    float _1880 = _1709;
    if (!_1854)
    {
        _1281 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1882 = _1281;
    float _1884 = fma(_1705, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1870);
    float _1886 = _1874 + _1872;
    float _1888 = 1.0 / _1872;
    float _1890 = _1882;
    if (!_1854)
    {
        _1876 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1892 = _1876;
    float _1894 = _1886 * _1888;
    float _1896 = _1894 * 0.5;
    float _1898 = _1888;
    float _1900 = _1896;
    if (_1854)
    {
        _1898 = 1.0;
    }
    float _1902 = _1898;
    float _1904 = _1902;
    if (!_1854)
    {
        float _1906 = -_1882;
        float _1908 = fma(_1896, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1906);
        _1900 = _1908;
    }
    float _1910 = _1900;
    if (!_1854)
    {
        float _1912 = -_1892;
        float _1914 = _1912 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1890 = _1914;
    }
    float _1916 = _1890;
    if (!_1854)
    {
        float _1918 = 1.0 / _1916;
        _1878 = _1918;
    }
    float _1920 = _1878;
    float _1922 = _1910;
    if (!_1854)
    {
        float _1924 = 1.0 / _1910;
        _1922 = _1924;
    }
    float _1926 = _1922;
    if (!_1854)
    {
        float _1928 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1930 = -_1892;
        float _1932 = fma(_1926, _1928, _1930);
        _1880 = _1932;
    }
    float _1934 = _1880;
    if (!_1854)
    {
        float _1936 = _1934 * _1920;
        float _1938 = precise::clamp(_1936, 0.0, 1.0);
        _1904 = _1938;
    }
    float _1940 = _1904;
    float _1942 = fma(_1731, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1884);
    float _1944 = -_1868;
    float _1946 = _1944 + 1.0;
    float _1948 = _1940 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1950 = _1940 > 0.0;
    bool _1952 = isnan(_1940);
    bool _1954 = _1950 || _1952;
    bool _1956 = isnan(0.0);
    bool _1958 = _1954 || _1956;
    float _1960 = _1946 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1962 = _1942 + _1761;
    out.gl_Position.x = _1791;
    out.gl_Position.y = _1793;
    out.gl_Position.z = _1942;
    out.gl_Position.w = _1761;
    float _1964 = _1962 * 0.5;
    float _1966 = _1948 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_70.z = _1964;
    out.m_70.w = _1761;
    out.m_45.x = _1966;
    float _1968 = _1960 * _1815;
    float _1970 = -_1960;
    float _1972 = _1970 + 1.0;
    float _1974 = _1826 * _1968;
    float _1976 = _1840 * _1968;
    float _1978 = fma(_1836, _1974, _1820);
    float _1980 = fma(_1838, _1974, _1822);
    float _1982 = _1826 * _1972;
    float _1984 = fma(_1826, _1976, _1824);
    out.m_72.x = _1978;
    out.m_72.y = _1980;
    out.m_72.z = _1984;
    out.m_72.w = _1982;
    if (_1958)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _1986 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1986;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _603 = false;
    bool _307 = false;
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
        float _2043 = as_type<float>(_107);
        out.gl_Position.z = _2043;
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
        out.m_45.x = 0.0;
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
        float _2113 = as_type<float>(_145);
        out.gl_Position.z = _2113;
    }
    if (_137)
    {
        return out;
    }
    float _147 = as_type<float>(int(gl_VertexIndex));
    float _149 = in.m_52.w;
    bool _151 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _153 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _155 = _151 || _153;
    bool _157 = isnan(1.0);
    bool _159 = _155 || _157;
    float _161 = in.m_47.x;
    float _163 = in.m_47.y;
    float _165 = in.m_47.z;
    float _167 = in.m_42.x;
    float _169 = in.m_42.y;
    float _171 = in.m_42.z;
    int _173 = as_type<int>(_147) & 1;
    bool _175 = _173 != 0;
    int _177 = as_type<int>(_147) & 2;
    bool _179 = _177 != 0;
    float _181 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _183 = 0.0;
    float _185 = _181;
    if (!_159)
    {
        float _187 = _181 * _181;
        float _189 = _187 * 0.5;
        _183 = _189;
    }
    float _191 = _183;
    bool _193 = !_175;
    float _195 = _193 ? (-0.5) : 0.5;
    bool _197 = !_179;
    float _199 = _197 ? (-0.5) : 0.5;
    float _201 = _191;
    if (!_159)
    {
        float _203 = _191 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _201 = _203;
    }
    float _205 = _201;
    bool _207 = !_159;
    float _209 = _205;
    if (!_207)
    {
        float _211 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _213 = log2(_211);
        float _215 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _217 = _215 + 1.0;
        float _219 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _221 = _181 * _213;
        float _223 = 1.0 / _217;
        float _225 = _219 * 0.693147182464599609375;
        float _227 = exp2(_221);
        float _229 = 1.0 / _225;
        float _231 = _227 + (-1.0);
        float _233 = -_231;
        float _235 = fma(_233, _229, _181);
        float _237 = _235 * _223;
        float _239 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _209 = _239;
    }
    float _241 = _209;
    bool _243 = !_159;
    if (!_243)
    {
        float _245 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _247 = log2(_245);
        float _249 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _251 = _249 + 1.0;
        float _253 = 1.0 / _251;
        float _255 = _181 * _247;
        float _257 = exp2(_255);
        float _259 = -_257;
        float _261 = _259 + 1.0;
        float _263 = _261 * _253;
        _185 = _263;
    }
    float _265 = _185;
    bool _267 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _269 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _271 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _273 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _275 = fma(_265, _161, _269);
    float _277 = fma(_265, _163, _271);
    float _279 = fma(_265, _165, _273);
    float _281 = fma(_275, _149, _167);
    float _283 = fma(_277, _149, _169);
    float _285 = fma(_279, _149, _171);
    bool _287 = !_267;
    float _305;
    if (!_287)
    {
        float _289 = in.m_54.x;
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
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _319 = _315 + _317;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _323 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _321;
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _327 = _325 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _331 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _329;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _335 = _333 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _337 = 1.0 / _323;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _341 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _339;
    float _343 = 1.0 / _327;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _347 = _315 + _345;
    bool _349 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _351 = 1.0 / _331;
    float _353 = _347 * _337;
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _357 = _315 + _355;
    bool _359 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _361 = isnan(_315);
    bool _363 = _359 || _361;
    bool _365 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _367 = _363 || _365;
    float _369 = float(_367);
    bool _371 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _373 = isnan(_315);
    bool _375 = _371 || _373;
    bool _377 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _379 = _375 || _377;
    float _381 = float(_379);
    float _383 = 1.0 / _335;
    float _385 = _319 * _343;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _389 = _315 + _387;
    bool _391 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _393 = isnan(_315);
    bool _395 = _391 || _393;
    bool _397 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _399 = _395 || _397;
    float _401 = float(_399);
    float _403 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _405 = _315 + _403;
    float _407 = 1.0 / _341;
    float _409 = _357 * _351;
    bool _411 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _413 = isnan(_315);
    bool _415 = _411 || _413;
    bool _417 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _419 = _415 || _417;
    float _421 = float(_419);
    bool _423 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _425 = isnan(_315);
    bool _427 = _423 || _425;
    bool _429 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _431 = _427 || _429;
    float _433 = float(_431);
    float _435 = -_421;
    float _437 = _435 + 1.0;
    float _439 = _389 * _383;
    float _441 = -_369;
    float _443 = _441 + 1.0;
    float _445 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _447 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _445;
    float _449 = _401 * _437;
    float _451 = -_401;
    float _453 = _451 + 1.0;
    float _455 = _421 * _443;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _457;
    bool _461 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _463 = isnan(_315);
    bool _465 = _461 || _463;
    bool _467 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _469 = _465 || _467;
    float _471 = float(_469);
    float _473 = _405 * _407;
    float _475 = fma(_447, _353, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _477 = fma(_459, _353, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _479 = _381 * _453;
    float _481 = -_381;
    float _483 = _481 + 1.0;
    float _485 = -_471;
    float _487 = _485 + 1.0;
    float _489 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _491 = _489 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _495 = _493 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _497 = _471 * _483;
    float _499 = _433 * _487;
    float _501 = fma(_491, _385, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _505 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _503;
    float _507 = _477 * _499;
    float _509 = -_433;
    float _511 = _509 + 1.0;
    float _513 = _475 * _499;
    float _515 = fma(_495, _385, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _517 = fma(_505, _409, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _521 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _519;
    float _523 = fma(_511, (*spvDescriptorSet0.vp_c9)._m0[143].x, _507);
    float _525 = fma(_511, (*spvDescriptorSet0.vp_c9)._m0[143].y, _513);
    float _527 = in.m_52.x;
    float _529 = in.m_52.y;
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _533 = _531 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _535 = fma(_521, _409, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _537 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _539 = _537 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _541 = fma(_501, _497, _523);
    float _543 = fma(_515, _497, _525);
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _547 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _545;
    float _549 = fma(_533, _439, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _551 = fma(_539, _439, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _555 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _553;
    float _557 = fma(_517, _479, _541);
    float _559 = fma(_535, _479, _543);
    float _561 = fma(_547, _473, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _563 = fma(_555, _473, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _565 = fma(_549, _449, _557);
    float _567 = fma(_551, _449, _559);
    float _569 = fma(_561, _455, _565);
    float _571 = fma(_563, _455, _567);
    float _573 = fma(_369, (*spvDescriptorSet0.vp_c9)._m0[148].x, _569);
    float _575 = fma(_369, (*spvDescriptorSet0.vp_c9)._m0[148].y, _571);
    float _577 = _573 * _527;
    float _579 = _575 * _529;
    bool _581 = !_349;
    float _583 = _565;
    float _601;
    if (!_581)
    {
        float _585 = in.m_54.x;
        float _587 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _589 = _585 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _591 = fma(_589, (*spvDescriptorSet0.vp_c9)._m0[11].y, _125);
        float _593 = _591 * _587;
        float _595 = floor(_593);
        float _597 = -_595;
        float _599 = _593 + _597;
        _601 = _599;
        _603 = true;
    }
    else
    {
        float _605 = float(_91);
        float _607 = 1.0 / _605;
        float _609 = _125 * _607;
        _601 = _609;
    }
    _603 = false;
    float _611 = _601;
    float _613 = in.m_54.z;
    float _615 = in.m_54.x;
    int _617 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _619 = _617 != 0;
    int _621 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _623 = _621 != 0;
    float _625 = in.m_54.w;
    float _627 = in.m_56.x;
    float _629 = in.m_56.y;
    float _631 = in.m_56.z;
    float _633 = in.m_56.w;
    float _635 = in.m_58.x;
    float _637 = in.m_58.y;
    float _639 = in.m_58.z;
    float _641 = in.m_58.w;
    float _643 = _543;
    if (!_619)
    {
        float _645 = in.m_54.y;
        _643 = _645;
    }
    float _647 = _643;
    float _649 = _613 * 2.0;
    float _651 = in.m_60.x;
    float _653 = in.m_60.y;
    float _655 = in.m_60.z;
    float _657 = in.m_60.w;
    bool _659 = _613 > 0.5;
    float _661 = _615 * 2.0;
    float _663 = floor(_649);
    bool _665 = _625 > 0.5;
    float _667 = _283 * _629;
    float _669 = floor(_661);
    float _671 = _283 * _637;
    float _673 = fma(_281, _627, _667);
    float _675 = _637;
    if (!_619)
    {
        _675 = _613;
    }
    float _677 = _675;
    float _679 = _677;
    if (!_619)
    {
        _583 = _647;
    }
    float _681 = _583;
    float _683 = fma(_281, _635, _671);
    bool _685 = _663 > 0.0;
    float _687 = fma(_285, _631, _673);
    bool _689 = _663 >= 0.0;
    bool _691 = isnan(_663);
    bool _693 = _689 || _691;
    bool _695 = isnan(0.0);
    bool _697 = _693 || _695;
    float _699 = _283 * _653;
    float _701 = -_195;
    int _703 = _659 ? as_type<int>(_701) : as_type<int>(_195);
    float _705 = _681;
    float _707 = _647;
    float _709 = _653;
    if (_619)
    {
        float _711 = in.m_54.x;
        float _713 = in.m_54.y;
        _705 = _711;
        _707 = _713;
    }
    float _715 = _705;
    float _717 = _707;
    int _719 = _697 ? 0 : 1;
    float _721 = fma(_285, _639, _683);
    bool _723 = _669 > 0.0;
    float _725 = fma(_281, _651, _699);
    int _727 = ~_719;
    int _729 = _727 + 1;
    int _731 = _729 + 1;
    float _733 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _735 = _611 + _733;
    bool _737 = _669 >= 0.0;
    bool _739 = isnan(_669);
    bool _741 = _737 || _739;
    bool _743 = isnan(0.0);
    bool _745 = _741 || _743;
    float _747 = fma(_285, _655, _725);
    int _749 = _731;
    if (!_685)
    {
        int _751 = ~_719;
        int _753 = _751 + 1;
        _749 = _753;
    }
    int _755 = _749;
    int _757 = _745 ? 0 : 1;
    int _759 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _761 = _759 != 0;
    float _763 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _765 = _763 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _767 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _769 = _767 != 0;
    int _771 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _773 = _771 != 0;
    float _775 = 1.0 / _765;
    int _777 = ~_757;
    int _779 = _777 + 1;
    int _781 = _779 + 1;
    int _783 = _781;
    if (!_723)
    {
        int _785 = ~_757;
        int _787 = _785 + 1;
        _783 = _787;
    }
    int _789 = _783;
    bool _791 = !_623;
    float _793 = _791 ? _195 : as_type<float>(_703);
    float _795 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _797 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _799 = _795 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _801 = _611 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _803 = isnan(_611);
    bool _805 = _801 || _803;
    bool _807 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _809 = _805 || _807;
    float _811 = float(_809);
    float _813 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _815 = _611 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _817 = isnan(_611);
    bool _819 = _815 || _817;
    bool _821 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _823 = _819 || _821;
    float _825 = float(_823);
    float _827 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _829 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _827;
    float _831 = _797 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _833 = -_811;
    float _835 = _833 + 1.0;
    float _837 = _813 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _839 = _829 * _775;
    float _841 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (!_619)
    {
        _709 = _613;
    }
    float _843 = _709;
    float _845 = fma(_839, _735, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _847 = _721 + _641;
    float _849 = _825 * _835;
    out.m_62.x = _837;
    out.m_62.y = _799;
    out.m_62.z = _831;
    float _851 = -_825;
    float _853 = _851 + 1.0;
    float _855 = _845 * _849;
    float _857 = _843;
    if (_619)
    {
        _679 = _717;
    }
    float _859 = _679;
    float _861 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _863 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _865 = fma(_853, (*spvDescriptorSet0.vp_c9)._m0[115].x, _855);
    if (_619)
    {
        _857 = _717;
    }
    float _867 = _857;
    float _869 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _871 = log2(_869);
    int _873 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _875 = _873 != 0;
    int _877 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _879 = _877 != 0;
    int _881 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _883 = _881 != 0;
    float _885 = _859 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _887 = _687 + _633;
    float _889 = _747 + _657;
    float _891 = _715 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _893 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _895 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _897 = -_863;
    float _899 = fma(_891, 2.0, _897);
    float _901 = fma(_811, (*spvDescriptorSet0.vp_c9)._m0[116].x, _865);
    float _903 = _615 + _717;
    float _905 = fma(_715, (*spvDescriptorSet0.vp_c9)._m0[83].z, _895);
    float _907 = fma(_867, (*spvDescriptorSet0.vp_c9)._m0[83].w, _861);
    float _909 = _613 + _717;
    bool _911 = !_875;
    int _913 = _911 ? 0 : 1;
    float _915 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _917 = _903 + (-1.0);
    float _919 = _909 + (-1.0);
    float _921 = _717 * 2.0;
    int _923 = abs(_913);
    float _925 = fma(_885, -2.0, _915);
    float _927 = fma(_917, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _929 = fma(_919, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _931 = _893 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _933 = _793 + 0.5;
    float _935 = -_125;
    float _937 = fma(_935, (*spvDescriptorSet0.vp_c9)._m0[81].x, _899);
    float _939 = float(_923);
    float _941 = floor(_921);
    float _943 = float(_755);
    float _945 = fma(_931, _933, _937);
    bool _947 = !_879;
    int _949 = _947 ? 0 : 1;
    float _951 = _871 * _125;
    float _953 = _939 * _943;
    float _955 = _901 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _957 = exp2(_951);
    int _959 = abs(_949);
    float _961 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _963 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _965 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _967 = float(_959);
    float _969 = _961 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _971 = float(_789);
    float _973 = _963 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _975 = _965 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _977 = _941 > 0.0;
    float _979 = _967 * _971;
    bool _981 = _941 >= 0.0;
    bool _983 = isnan(_941);
    bool _985 = _981 || _983;
    bool _987 = isnan(0.0);
    bool _989 = _985 || _987;
    float _991 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _993 = 1.0 + _991;
    float _995 = -_199;
    int _997 = _665 ? as_type<int>(_995) : as_type<int>(_199);
    float _999 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1001 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1003 = _887 + _1001;
    out.m_64.x = _969;
    out.m_64.y = _973;
    out.m_64.z = _975;
    out.m_64.w = _955;
    bool _1005 = !_761;
    float _1007 = _1005 ? _199 : as_type<float>(_997);
    float _1009 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1011 = _847 + _1009;
    bool _1013 = _615 > 0.5;
    float _1015 = -_957;
    float _1017 = _1015 + 1.0;
    bool _1019 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1021 = isnan(0.0);
    bool _1023 = _1019 || _1021;
    bool _1025 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1027 = _1023 || _1025;
    float _1029 = 1.0 / _993;
    float _1031 = -_195;
    int _1033 = _1013 ? as_type<int>(_1031) : as_type<int>(_195);
    float _1035 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[81].y, _925);
    bool _1037 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1039 = isnan(1.0);
    bool _1041 = _1037 || _1039;
    bool _1043 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1045 = _1041 || _1043;
    float _1047 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[82].w, _907);
    bool _1049 = !_769;
    float _1051 = _1049 ? _195 : as_type<float>(_1033);
    float _1053 = _1003 * _1003;
    bool _1055 = _717 > 0.5;
    float _1057 = _1003 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1059 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1061 = _889 + _1059;
    float _1063 = _999 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1065 = _1007 + (-0.5);
    float _1067 = fma(_1011, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1057);
    float _1069 = _1027 ? _1017 : 0.0;
    float _1071 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1073 = -_1063;
    float _1075 = -_1035;
    float _1077 = fma(_1073, _1065, _1075);
    float _1079 = fma(_1061, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1067);
    float _1081 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[82].z, _905);
    float _1083 = _945;
    if (_1045)
    {
        float _1085 = _1069 * _1029;
        _127 = _1085;
    }
    float _1087 = _127;
    float _1089 = -_199;
    int _1091 = _1055 ? as_type<int>(_1089) : as_type<int>(_199);
    float _1093 = _1051 + 0.5;
    bool _1095 = _1079 >= 0.0;
    float _1097 = fma(_1011, _1011, _1053);
    float _1099 = in.m_66.x;
    float _1101 = in.m_66.y;
    float _1103 = in.m_66.z;
    int _1105 = _989 ? 0 : 1;
    float _1107 = -_1081;
    float _1109 = _1107 + 1.0;
    bool _1111 = !_773;
    float _1113 = _1111 ? _199 : as_type<float>(_1091);
    float _1115 = fma(_1061, _1061, _1097);
    int _1117 = ~_1105;
    int _1119 = _1117 + 1;
    int _1121 = _1119 + 1;
    float _1123 = _1093 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _1125 = _1121;
    if (!_977)
    {
        int _1127 = ~_1105;
        int _1129 = _1127 + 1;
        _1125 = _1129;
    }
    int _1131 = _1125;
    float _1133 = -_1113;
    float _1135 = _1133 + 0.5;
    float _1137 = -_1047;
    float _1139 = _1137 + 1.0;
    float _1141 = -_1109;
    float _1143 = fma(_793, _1141, _945);
    if (_1095)
    {
        _1083 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1145 = _1083;
    float _1147 = _1135 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1149 = fma(_1007, _1139, _1077);
    float _1151 = rsqrt(_1115);
    float _1153 = _953 * (-2.0);
    float _1155 = _1123 * _841;
    float _1157 = _1147 * _1071;
    int _1159 = as_type<int>(_1145);
    if (_1095)
    {
        float _1161 = _1145 * 5.0;
        _1159 = as_type<int>(_1161);
    }
    int _1163 = _1159;
    float _1165 = fma(_927, _1153, _927);
    if (_1095)
    {
        out.m_45.x = 0.0;
    }
    float _1167 = fma(_1153, _1099, _1099);
    float _1169 = _979 * (-2.0);
    out.m_68.x = _1155;
    out.m_68.y = _1157;
    out.m_68.z = _1143;
    out.m_68.w = _1149;
    bool _1171 = !_883;
    int _1173 = _1171 ? 0 : 1;
    float _1175 = fma(_929, _1169, _929);
    if (_1095)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3720 = as_type<float>(_1163);
        out.gl_Position.z = _3720;
    }
    float _1177 = _1003 * _1151;
    float _1179 = _1011 * _1151;
    if (_1095)
    {
        return out;
    }
    float _1181 = -_1177;
    float _1183 = fma(_1181, (*spvDescriptorSet0.vp_c9)._m0[18].w, _887);
    float _1185 = fma(_1169, _1101, _1101);
    float _1187 = _615 + (-0.5);
    float _1189 = -_1179;
    float _1191 = fma(_1189, (*spvDescriptorSet0.vp_c9)._m0[18].w, _847);
    float _1193 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1195 = _1183 + _1193;
    float _1197 = _717 + (-0.5);
    float _1199 = fma(_1187, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1167);
    float _1201 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1203 = _1191 + _1201;
    float _1205 = _1195 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1207 = _1061 * _1151;
    int _1209 = abs(_1173);
    float _1211 = fma(_1197, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1185);
    float _1213 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1205);
    float _1215 = -_1207;
    float _1217 = fma(_1215, (*spvDescriptorSet0.vp_c9)._m0[18].w, _889);
    float _1219 = -_1177;
    float _1221 = fma(_1219, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1003);
    float _1223 = -_1179;
    float _1225 = fma(_1223, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1011);
    float _1227 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1229 = _1217 + _1227;
    float _1231 = float(_1209);
    float _1233 = _1221 * _1221;
    float _1235 = float(_1131);
    float _1237 = fma(_1229, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1213);
    float _1239 = -_1207;
    float _1241 = fma(_1239, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1061);
    float _1243 = fma(_1225, _1225, _1233);
    float _1245 = _615 + _613;
    float _1247 = _1231 * _1235;
    float _1249 = fma(_1241, _1241, _1243);
    float _1251 = _1245 + (-1.0);
    float _1253 = _1247 * (-2.0);
    float _1255 = _613 + (-0.5);
    bool _1257 = _1237 >= 0.0;
    float _1259 = fma(_1251, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1261 = fma(_1253, _1103, _1103);
    float _1263 = fma(_1165, _1087, _1199);
    float _1265 = fma(_1175, _1087, _1211);
    float _1267 = fma(_1259, _1253, _1259);
    float _1269 = fma(_1255, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1261);
    float _1271 = _1263 * 0.15915493667125701904296875;
    float _1273 = sqrt(_1249);
    float _1275 = _1265 * 0.15915493667125701904296875;
    float _1277 = fma(_1267, _1087, _1269);
    float _1279 = _1261;
    float _1281 = _1217;
    if (_1257)
    {
        _1279 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1283 = _1279;
    float _1285 = _1277 * 0.15915493667125701904296875;
    int _1287 = as_type<int>(_1283);
    if (_1257)
    {
        out.m_45.x = 0.0;
    }
    float _1289 = _1271 * 6.283185482025146484375;
    float _1291 = sin(_1289);
    if (_1257)
    {
        float _1293 = _1283 * 5.0;
        _1287 = as_type<int>(_1293);
    }
    int _1295 = _1287;
    if (_1257)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3932 = as_type<float>(_1295);
        out.gl_Position.z = _3932;
    }
    float _1297 = _1271 * 6.283185482025146484375;
    float _1299 = cos(_1297);
    float _1301 = _1151 * _1273;
    float _1303 = _1275 * 6.283185482025146484375;
    float _1305 = sin(_1303);
    float _1307 = _1275 * 6.283185482025146484375;
    float _1309 = cos(_1307);
    float _1311 = _1285 * 6.283185482025146484375;
    float _1313 = sin(_1311);
    if (_1257)
    {
        return out;
    }
    float _1315 = _1285 * 6.283185482025146484375;
    float _1317 = cos(_1315);
    float _1319 = _579 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1321 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _199);
    float _1323 = _577 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1325 = _1291 * _1305;
    float _1327 = _1301 * _1319;
    float _1329 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _195);
    float _1331 = _1301 * _1323;
    float _1333 = _1299 * _1305;
    float _1335 = _1321 * _1327;
    float _1337 = _1299 * _1309;
    float _1339 = _1329 * _1331;
    float _1341 = -_1335;
    float _1343 = _1313 * _1341;
    float _1345 = fma(_1313, _1337, _1325);
    float _1347 = fma(_1313, _1325, _1337);
    float _1349 = _1317 * _1335;
    float _1351 = _1305 * _1317;
    float _1353 = _1299 * _1349;
    float _1355 = _1309 * _1317;
    float _1357 = _1291 * _1309;
    float _1359 = _1291 * _1349;
    float _1361 = fma(_1345, _1339, _1353);
    float _1363 = _1301 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1365 = _1363 * 0.5;
    float _1367 = -_1357;
    float _1369 = fma(_1313, _1333, _1367);
    float _1371 = fma(_1355, _1339, _1343);
    float _1373 = -_1333;
    float _1375 = fma(_1313, _1357, _1373);
    float _1377 = fma(_1369, _1365, _1361);
    float _1379 = fma(_1351, _1365, _1371);
    float _1381 = fma(_1375, _1339, _1359);
    float _1383 = _1377 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1385 = _1377 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1387 = fma(_1347, _1365, _1381);
    float _1389 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1383);
    float _1391 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1385);
    float _1393 = fma(_1387, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1389);
    float _1395 = fma(_1387, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1391);
    float _1397 = _1393 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1399 = _1395 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1401 = _889 + _1397;
    float _1403 = _847 + _1399;
    float _1405 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1407 = _1401 + _1405;
    float _1409 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1411 = _1403 + _1409;
    float _1413 = _1407 * _1407;
    float _1415 = fma(_1411, _1411, _1413);
    float _1417 = _1377 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1419 = sqrt(_1415);
    float _1421 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1417);
    float _1423 = fma(_1387, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1421);
    float _1425 = _1423 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1427 = _887 + _1425;
    bool _1429 = _1419 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1431 = _1425;
    float _1433 = _1403;
    float _1435 = _1401;
    float _1437 = _1419;
    float _1439 = _1361;
    if (!_1429)
    {
        _1431 = _1427;
    }
    float _1441 = _1431;
    bool _1443 = !_1429;
    float _1445 = _1441;
    if (!_1443)
    {
        float _1447 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1449 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1451 = _1419 + _1449;
        float _1453 = _1427 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1455 = rsqrt(_1415);
        float _1457 = _1451 * _1447;
        float _1459 = _1457 * 0.15915493667125701904296875;
        float _1461 = _1459 * 6.283185482025146484375;
        float _1463 = cos(_1461);
        float _1465 = _1459 * 6.283185482025146484375;
        float _1467 = sin(_1465);
        float _1469 = _1463 + (-1.0);
        float _1471 = _1469 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1473 = fma(_1467, _1453, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1475 = fma(_1427, _1463, _1471);
        float _1477 = _1455 * _1473;
        float _1479 = fma(_1411, _1477, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1481 = fma(_1407, _1477, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1445 = _1475;
        _1433 = _1479;
        _1435 = _1481;
        _1437 = _1459;
    }
    float _1483 = _1445;
    float _1485 = _1433;
    float _1487 = _1435;
    float _1489 = _1437;
    float _1491 = -_1177;
    float _1493 = fma(_1491, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1483);
    float _1495 = -_1179;
    float _1497 = fma(_1495, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1485);
    float _1499 = -_1207;
    float _1501 = fma(_1499, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1487);
    float _1503 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1505 = _1493 + _1503;
    float _1507 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1509 = _1497 + _1507;
    float _1511 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1513 = _1501 + _1511;
    float _1515 = _1505 * _1505;
    float _1517 = fma(_1509, _1509, _1515);
    float _1519 = fma(_1513, _1513, _1517);
    float _1521 = rsqrt(_1519);
    float _1523 = sqrt(_1519);
    float _1525 = _1521 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1527 = _1509 * _1525;
    float _1529 = _1513 * _1525;
    float _1531 = _1527 * _1527;
    float _1533 = _1529 * _1529;
    float _1535 = _1531 + _1533;
    float _1537 = sqrt(_1535);
    bool _1539 = _1537 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1541 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1543 = _1537 + _1541;
    float _1545 = _1513;
    float _1547 = _1489;
    float _1549 = _1543;
    float _1551 = _1517;
    float _1553 = _1505;
    if (_1539)
    {
        float _1555 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1545 = _1555;
    }
    float _1557 = _1545;
    if (_1539)
    {
        float _1559 = rsqrt(_1535);
        _1547 = _1559;
    }
    float _1561 = _1547;
    float _1563 = _1561;
    if (_1539)
    {
        float _1565 = _1543 * _1557;
        _1549 = _1565;
    }
    float _1567 = _1549;
    if (_1539)
    {
        float _1569 = _1567 * 0.15915493667125701904296875;
        _1551 = _1569;
    }
    float _1571 = _1551;
    float _1573 = _1521;
    if (_1539)
    {
        float _1575 = _1571 * 6.283185482025146484375;
        float _1577 = sin(_1575);
        _1573 = _1577;
    }
    float _1579 = _1573;
    float _1581 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1583 = precise::max(0.0, _1581);
    float _1585 = _1485;
    float _1587 = _1583;
    float _1589 = _1581;
    if (_1539)
    {
        float _1591 = _1571 * 6.283185482025146484375;
        float _1593 = cos(_1591);
        _1585 = _1593;
    }
    float _1595 = _1585;
    float _1597 = -_1525;
    float _1599 = -_1583;
    float _1601 = fma(_1505, _1597, _1599);
    if (!_1539)
    {
        _1587 = _1529;
    }
    float _1603 = _1587;
    float _1605 = _1603;
    if (_1539)
    {
        float _1607 = _1601 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1589 = _1607;
    }
    float _1609 = _1589;
    float _1611 = _1579;
    float _1613 = _1609;
    if (_1539)
    {
        float _1615 = fma(_1579, _1609, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1553 = _1615;
    }
    float _1617 = _1553;
    float _1619 = _1617;
    if (!_1539)
    {
        _1611 = _1601;
    }
    float _1621 = _1611;
    float _1623 = _1621;
    if (_1539)
    {
        float _1625 = _1595 + (-1.0);
        _1613 = _1625;
    }
    float _1627 = _1613;
    float _1629 = _1627;
    if (_1539)
    {
        float _1631 = _1561 * _1617;
        _1439 = _1631;
    }
    float _1633 = _1439;
    if (!_1539)
    {
        _1563 = _1527;
    }
    float _1635 = _1563;
    float _1637 = _1635;
    if (_1539)
    {
        float _1639 = _1627 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1619 = _1639;
    }
    float _1641 = _1619;
    float _1643 = _1641;
    if (_1539)
    {
        float _1645 = _1527 * _1633;
        _1637 = _1645;
    }
    float _1647 = _1637;
    if (!_1539)
    {
        _1629 = _1531;
    }
    float _1649 = _1629;
    float _1651 = _1649;
    if (_1539)
    {
        float _1653 = _1529 * _1633;
        _1605 = _1653;
    }
    float _1655 = _1605;
    if (_1539)
    {
        float _1657 = fma(_1601, _1595, _1641);
        _1623 = _1657;
    }
    float _1659 = _1623;
    if (_1539)
    {
        float _1661 = _1647 * _1647;
        _1651 = _1661;
    }
    float _1663 = _1651;
    if (!_1539)
    {
        _1643 = _1533;
    }
    float _1665 = _1643;
    float _1667 = _1665;
    if (_1539)
    {
        float _1669 = _1655 * _1655;
        _1667 = _1669;
    }
    float _1671 = _1667;
    float _1673 = fma(_1659, _1659, _1663);
    float _1675 = _1493 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1677 = _1673 + _1671;
    float _1679 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1681 = fma(_1523, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1679);
    float _1683 = precise::clamp(_1681, 0.0, 1.0);
    float _1685 = fma(_1497, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1675);
    float _1687 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1689 = rsqrt(_1677);
    float _1691 = -_1683;
    float _1693 = _1691 + 1.0;
    float _1695 = _1493 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1697 = fma(_1501, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1685);
    float _1699 = _1493 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1701 = _1493 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1703 = fma(_1497, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1695);
    float _1705 = _1697 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1707 = abs(_1693);
    float _1709 = log2(_1707);
    float _1711 = fma(_1497, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1699);
    float _1713 = fma(_1501, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1703);
    float _1715 = fma(_1497, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1701);
    float _1717 = _1705 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1719 = fma(_1501, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1711);
    float _1721 = _1713 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1723 = fma(_1501, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1715);
    float _1725 = _1689 * _1647;
    float _1727 = _1719 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1729 = _1721 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1731 = _1723 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1733 = _1689 * _1659;
    float _1735 = _1725 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1737 = fma(_1727, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1729);
    float _1739 = _1689 * _1655;
    float _1741 = _1709 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1743 = -_1735;
    float _1745 = fma(_1733, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1743);
    float _1747 = fma(_1705, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1737);
    float _1749 = -_1717;
    float _1751 = fma(_1749, _1687, 1.0);
    float _1753 = _1721 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1755 = -_1739;
    float _1757 = fma(_1755, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1745);
    float _1759 = exp2(_1741);
    float _1761 = fma(_1731, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1747);
    float _1763 = _1721 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1765 = fma(_1757, -0.5, 0.5);
    float _1767 = fma(_1757, 0.5, 0.5);
    float _1769 = fma(_1727, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1763);
    float _1771 = fma(_1727, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1753);
    float _1773 = log2(_1751);
    float _1775 = _1733 + 1.0;
    float _1777 = fma(_1767, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1779 = fma(_1705, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1769);
    float _1781 = fma(_1705, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1771);
    float _1783 = 1.0 / _1761;
    float _1785 = -_1733;
    float _1787 = fma(_1759, _1775, _1785);
    float _1789 = fma(_1767, _1777, -0.212114393711090087890625);
    float _1791 = fma(_1731, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1779);
    float _1793 = fma(_1731, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1781);
    float _1795 = fma(_1787, 0.5, 0.5);
    float _1797 = fma(_1767, _1789, 1.570728778839111328125);
    float _1799 = sqrt(_1765);
    float _1801 = _1773 * 0.693147182464599609375;
    float _1803 = _1801 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1805 = _1791 * _1783;
    float _1807 = _1793 * _1783;
    float _1809 = fma(_1805, 0.5, 0.5);
    float _1811 = fma(_1807, -0.5, 0.5);
    float _1813 = _1799 * 0.636619746685028076171875;
    float3 _4785 = float3(_1809, _1811, _1803);
    float _1815 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4785, float3(0.0), isnan(_4785)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4785, float3(0.0), isnan(_4785)), level(0.0)).x;
    float3 _4796 = float3(_1809, _1811, _1803);
    float4 _1818 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4796, float3(0.0), isnan(_4796)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4796, float3(0.0), isnan(_4796)), level(0.0)).xyzw;
    float _1820 = _1818.x;
    float _1822 = _1818.y;
    float _1824 = _1818.z;
    float _1826 = _1818.w;
    float _1828 = -_1797;
    float _1830 = fma(_1813, _1828, 1.0);
    float2 _4818 = float2(_1830, _1795);
    float3 _1834 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4818, float2(0.0), isnan(_4818)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4818, float2(0.0), isnan(_4818)), level(0.0)).xyz;
    float _1836 = _1834.x;
    float _1838 = _1834.y;
    float _1840 = _1834.z;
    float _1842 = _1183 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1844 = _1183 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1846 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1848 = isnan(0.5);
    bool _1850 = _1846 || _1848;
    bool _1852 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1854 = _1850 || _1852;
    float _1856 = _1709 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1858 = fma(_1191, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1842);
    float _1860 = fma(_1191, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1844);
    float _1862 = _1721 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1864 = fma(_1217, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1858);
    float _1866 = fma(_1217, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1860);
    float _1868 = exp2(_1856);
    float _1870 = fma(_1727, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1862);
    float _1872 = _1864 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1874 = _1866 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1876 = _1809;
    float _1878 = _1864;
    float _1880 = _1709;
    if (!_1854)
    {
        _1281 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1882 = _1281;
    float _1884 = fma(_1705, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1870);
    float _1886 = _1874 + _1872;
    float _1888 = 1.0 / _1872;
    float _1890 = _1882;
    if (!_1854)
    {
        _1876 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1892 = _1876;
    float _1894 = _1886 * _1888;
    float _1896 = _1894 * 0.5;
    float _1898 = _1888;
    float _1900 = _1896;
    if (_1854)
    {
        _1898 = 1.0;
    }
    float _1902 = _1898;
    float _1904 = _1902;
    if (!_1854)
    {
        float _1906 = -_1882;
        float _1908 = fma(_1896, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1906);
        _1900 = _1908;
    }
    float _1910 = _1900;
    if (!_1854)
    {
        float _1912 = -_1892;
        float _1914 = _1912 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1890 = _1914;
    }
    float _1916 = _1890;
    if (!_1854)
    {
        float _1918 = 1.0 / _1916;
        _1878 = _1918;
    }
    float _1920 = _1878;
    float _1922 = _1910;
    if (!_1854)
    {
        float _1924 = 1.0 / _1910;
        _1922 = _1924;
    }
    float _1926 = _1922;
    if (!_1854)
    {
        float _1928 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1930 = -_1892;
        float _1932 = fma(_1926, _1928, _1930);
        _1880 = _1932;
    }
    float _1934 = _1880;
    if (!_1854)
    {
        float _1936 = _1934 * _1920;
        float _1938 = precise::clamp(_1936, 0.0, 1.0);
        _1904 = _1938;
    }
    float _1940 = _1904;
    float _1942 = fma(_1731, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1884);
    float _1944 = -_1868;
    float _1946 = _1944 + 1.0;
    float _1948 = _1940 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1950 = _1940 > 0.0;
    bool _1952 = isnan(_1940);
    bool _1954 = _1950 || _1952;
    bool _1956 = isnan(0.0);
    bool _1958 = _1954 || _1956;
    float _1960 = _1946 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1962 = _1942 + _1761;
    out.gl_Position.x = _1791;
    out.gl_Position.y = _1793;
    out.gl_Position.z = _1942;
    out.gl_Position.w = _1761;
    float _1964 = _1962 * 0.5;
    float _1966 = _1948 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_70.z = _1964;
    out.m_70.w = _1761;
    out.m_45.x = _1966;
    float _1968 = _1960 * _1815;
    float _1970 = -_1960;
    float _1972 = _1970 + 1.0;
    float _1974 = _1826 * _1968;
    float _1976 = _1840 * _1968;
    float _1978 = fma(_1836, _1974, _1820);
    float _1980 = fma(_1838, _1974, _1822);
    float _1982 = _1826 * _1972;
    float _1984 = fma(_1826, _1976, _1824);
    out.m_72.x = _1978;
    out.m_72.y = _1980;
    out.m_72.z = _1984;
    out.m_72.w = _1982;
    if (_1958)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _1986 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1986;
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
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _603 = false;
    bool _307 = false;
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
        float _2043 = as_type<float>(_107);
        out.gl_Position.z = _2043;
    }
    if (!_95)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _111 = in.m_47.w;
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
        out.m_45.x = 0.0;
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
        float _2113 = as_type<float>(_145);
        out.gl_Position.z = _2113;
    }
    if (_137)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _147 = as_type<float>(int(gl_VertexIndex));
    float _149 = in.m_52.w;
    bool _151 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _153 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _155 = _151 || _153;
    bool _157 = isnan(1.0);
    bool _159 = _155 || _157;
    float _161 = in.m_47.x;
    float _163 = in.m_47.y;
    float _165 = in.m_47.z;
    float _167 = in.m_42.x;
    float _169 = in.m_42.y;
    float _171 = in.m_42.z;
    int _173 = as_type<int>(_147) & 1;
    bool _175 = _173 != 0;
    int _177 = as_type<int>(_147) & 2;
    bool _179 = _177 != 0;
    float _181 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _183 = 0.0;
    float _185 = _181;
    if (!_159)
    {
        float _187 = _181 * _181;
        float _189 = _187 * 0.5;
        _183 = _189;
    }
    float _191 = _183;
    bool _193 = !_175;
    float _195 = _193 ? (-0.5) : 0.5;
    bool _197 = !_179;
    float _199 = _197 ? (-0.5) : 0.5;
    float _201 = _191;
    if (!_159)
    {
        float _203 = _191 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _201 = _203;
    }
    float _205 = _201;
    bool _207 = !_159;
    float _209 = _205;
    if (!_207)
    {
        float _211 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _213 = log2(_211);
        float _215 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _217 = _215 + 1.0;
        float _219 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _221 = _181 * _213;
        float _223 = 1.0 / _217;
        float _225 = _219 * 0.693147182464599609375;
        float _227 = exp2(_221);
        float _229 = 1.0 / _225;
        float _231 = _227 + (-1.0);
        float _233 = -_231;
        float _235 = fma(_233, _229, _181);
        float _237 = _235 * _223;
        float _239 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _209 = _239;
    }
    float _241 = _209;
    bool _243 = !_159;
    if (!_243)
    {
        float _245 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _247 = log2(_245);
        float _249 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _251 = _249 + 1.0;
        float _253 = 1.0 / _251;
        float _255 = _181 * _247;
        float _257 = exp2(_255);
        float _259 = -_257;
        float _261 = _259 + 1.0;
        float _263 = _261 * _253;
        _185 = _263;
    }
    float _265 = _185;
    bool _267 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _269 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _271 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _273 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _275 = fma(_265, _161, _269);
    float _277 = fma(_265, _163, _271);
    float _279 = fma(_265, _165, _273);
    float _281 = fma(_275, _149, _167);
    float _283 = fma(_277, _149, _169);
    float _285 = fma(_279, _149, _171);
    bool _287 = !_267;
    float _305;
    if (!_287)
    {
        float _289 = in.m_54.x;
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
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _319 = _315 + _317;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _323 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _321;
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _327 = _325 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _331 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _329;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _335 = _333 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _337 = 1.0 / _323;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _341 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _339;
    float _343 = 1.0 / _327;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _347 = _315 + _345;
    bool _349 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _351 = 1.0 / _331;
    float _353 = _347 * _337;
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _357 = _315 + _355;
    bool _359 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _361 = isnan(_315);
    bool _363 = _359 || _361;
    bool _365 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _367 = _363 || _365;
    float _369 = float(_367);
    bool _371 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _373 = isnan(_315);
    bool _375 = _371 || _373;
    bool _377 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _379 = _375 || _377;
    float _381 = float(_379);
    float _383 = 1.0 / _335;
    float _385 = _319 * _343;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _389 = _315 + _387;
    bool _391 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _393 = isnan(_315);
    bool _395 = _391 || _393;
    bool _397 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _399 = _395 || _397;
    float _401 = float(_399);
    float _403 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _405 = _315 + _403;
    float _407 = 1.0 / _341;
    float _409 = _357 * _351;
    bool _411 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _413 = isnan(_315);
    bool _415 = _411 || _413;
    bool _417 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _419 = _415 || _417;
    float _421 = float(_419);
    bool _423 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _425 = isnan(_315);
    bool _427 = _423 || _425;
    bool _429 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _431 = _427 || _429;
    float _433 = float(_431);
    float _435 = -_421;
    float _437 = _435 + 1.0;
    float _439 = _389 * _383;
    float _441 = -_369;
    float _443 = _441 + 1.0;
    float _445 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _447 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _445;
    float _449 = _401 * _437;
    float _451 = -_401;
    float _453 = _451 + 1.0;
    float _455 = _421 * _443;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _457;
    bool _461 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _463 = isnan(_315);
    bool _465 = _461 || _463;
    bool _467 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _469 = _465 || _467;
    float _471 = float(_469);
    float _473 = _405 * _407;
    float _475 = fma(_447, _353, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _477 = fma(_459, _353, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _479 = _381 * _453;
    float _481 = -_381;
    float _483 = _481 + 1.0;
    float _485 = -_471;
    float _487 = _485 + 1.0;
    float _489 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _491 = _489 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _495 = _493 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _497 = _471 * _483;
    float _499 = _433 * _487;
    float _501 = fma(_491, _385, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _505 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _503;
    float _507 = _477 * _499;
    float _509 = -_433;
    float _511 = _509 + 1.0;
    float _513 = _475 * _499;
    float _515 = fma(_495, _385, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _517 = fma(_505, _409, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _521 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _519;
    float _523 = fma(_511, (*spvDescriptorSet0.vp_c9)._m0[143].x, _507);
    float _525 = fma(_511, (*spvDescriptorSet0.vp_c9)._m0[143].y, _513);
    float _527 = in.m_52.x;
    float _529 = in.m_52.y;
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _533 = _531 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _535 = fma(_521, _409, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _537 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _539 = _537 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _541 = fma(_501, _497, _523);
    float _543 = fma(_515, _497, _525);
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _547 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _545;
    float _549 = fma(_533, _439, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _551 = fma(_539, _439, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _555 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _553;
    float _557 = fma(_517, _479, _541);
    float _559 = fma(_535, _479, _543);
    float _561 = fma(_547, _473, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _563 = fma(_555, _473, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _565 = fma(_549, _449, _557);
    float _567 = fma(_551, _449, _559);
    float _569 = fma(_561, _455, _565);
    float _571 = fma(_563, _455, _567);
    float _573 = fma(_369, (*spvDescriptorSet0.vp_c9)._m0[148].x, _569);
    float _575 = fma(_369, (*spvDescriptorSet0.vp_c9)._m0[148].y, _571);
    float _577 = _573 * _527;
    float _579 = _575 * _529;
    bool _581 = !_349;
    float _583 = _565;
    float _601;
    if (!_581)
    {
        float _585 = in.m_54.x;
        float _587 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _589 = _585 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _591 = fma(_589, (*spvDescriptorSet0.vp_c9)._m0[11].y, _125);
        float _593 = _591 * _587;
        float _595 = floor(_593);
        float _597 = -_595;
        float _599 = _593 + _597;
        _601 = _599;
        _603 = true;
    }
    else
    {
        float _605 = float(_91);
        float _607 = 1.0 / _605;
        float _609 = _125 * _607;
        _601 = _609;
    }
    _603 = false;
    float _611 = _601;
    float _613 = in.m_54.z;
    float _615 = in.m_54.x;
    int _617 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _619 = _617 != 0;
    int _621 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _623 = _621 != 0;
    float _625 = in.m_54.w;
    float _627 = in.m_56.x;
    float _629 = in.m_56.y;
    float _631 = in.m_56.z;
    float _633 = in.m_56.w;
    float _635 = in.m_58.x;
    float _637 = in.m_58.y;
    float _639 = in.m_58.z;
    float _641 = in.m_58.w;
    float _643 = _543;
    if (!_619)
    {
        float _645 = in.m_54.y;
        _643 = _645;
    }
    float _647 = _643;
    float _649 = _613 * 2.0;
    float _651 = in.m_60.x;
    float _653 = in.m_60.y;
    float _655 = in.m_60.z;
    float _657 = in.m_60.w;
    bool _659 = _613 > 0.5;
    float _661 = _615 * 2.0;
    float _663 = floor(_649);
    bool _665 = _625 > 0.5;
    float _667 = _283 * _629;
    float _669 = floor(_661);
    float _671 = _283 * _637;
    float _673 = fma(_281, _627, _667);
    float _675 = _637;
    if (!_619)
    {
        _675 = _613;
    }
    float _677 = _675;
    float _679 = _677;
    if (!_619)
    {
        _583 = _647;
    }
    float _681 = _583;
    float _683 = fma(_281, _635, _671);
    bool _685 = _663 > 0.0;
    float _687 = fma(_285, _631, _673);
    bool _689 = _663 >= 0.0;
    bool _691 = isnan(_663);
    bool _693 = _689 || _691;
    bool _695 = isnan(0.0);
    bool _697 = _693 || _695;
    float _699 = _283 * _653;
    float _701 = -_195;
    int _703 = _659 ? as_type<int>(_701) : as_type<int>(_195);
    float _705 = _681;
    float _707 = _647;
    float _709 = _653;
    if (_619)
    {
        float _711 = in.m_54.x;
        float _713 = in.m_54.y;
        _705 = _711;
        _707 = _713;
    }
    float _715 = _705;
    float _717 = _707;
    int _719 = _697 ? 0 : 1;
    float _721 = fma(_285, _639, _683);
    bool _723 = _669 > 0.0;
    float _725 = fma(_281, _651, _699);
    int _727 = ~_719;
    int _729 = _727 + 1;
    int _731 = _729 + 1;
    float _733 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _735 = _611 + _733;
    bool _737 = _669 >= 0.0;
    bool _739 = isnan(_669);
    bool _741 = _737 || _739;
    bool _743 = isnan(0.0);
    bool _745 = _741 || _743;
    float _747 = fma(_285, _655, _725);
    int _749 = _731;
    if (!_685)
    {
        int _751 = ~_719;
        int _753 = _751 + 1;
        _749 = _753;
    }
    int _755 = _749;
    int _757 = _745 ? 0 : 1;
    int _759 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _761 = _759 != 0;
    float _763 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _765 = _763 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _767 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _769 = _767 != 0;
    int _771 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _773 = _771 != 0;
    float _775 = 1.0 / _765;
    int _777 = ~_757;
    int _779 = _777 + 1;
    int _781 = _779 + 1;
    int _783 = _781;
    if (!_723)
    {
        int _785 = ~_757;
        int _787 = _785 + 1;
        _783 = _787;
    }
    int _789 = _783;
    bool _791 = !_623;
    float _793 = _791 ? _195 : as_type<float>(_703);
    float _795 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _797 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _799 = _795 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _801 = _611 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _803 = isnan(_611);
    bool _805 = _801 || _803;
    bool _807 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _809 = _805 || _807;
    float _811 = float(_809);
    float _813 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _815 = _611 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _817 = isnan(_611);
    bool _819 = _815 || _817;
    bool _821 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _823 = _819 || _821;
    float _825 = float(_823);
    float _827 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _829 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _827;
    float _831 = _797 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _833 = -_811;
    float _835 = _833 + 1.0;
    float _837 = _813 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _839 = _829 * _775;
    float _841 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (!_619)
    {
        _709 = _613;
    }
    float _843 = _709;
    float _845 = fma(_839, _735, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _847 = _721 + _641;
    float _849 = _825 * _835;
    out.m_62.x = _837;
    out.m_62.y = _799;
    out.m_62.z = _831;
    float _851 = -_825;
    float _853 = _851 + 1.0;
    float _855 = _845 * _849;
    float _857 = _843;
    if (_619)
    {
        _679 = _717;
    }
    float _859 = _679;
    float _861 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _863 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _865 = fma(_853, (*spvDescriptorSet0.vp_c9)._m0[115].x, _855);
    if (_619)
    {
        _857 = _717;
    }
    float _867 = _857;
    float _869 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _871 = log2(_869);
    int _873 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _875 = _873 != 0;
    int _877 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _879 = _877 != 0;
    int _881 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _883 = _881 != 0;
    float _885 = _859 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _887 = _687 + _633;
    float _889 = _747 + _657;
    float _891 = _715 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _893 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _895 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _897 = -_863;
    float _899 = fma(_891, 2.0, _897);
    float _901 = fma(_811, (*spvDescriptorSet0.vp_c9)._m0[116].x, _865);
    float _903 = _615 + _717;
    float _905 = fma(_715, (*spvDescriptorSet0.vp_c9)._m0[83].z, _895);
    float _907 = fma(_867, (*spvDescriptorSet0.vp_c9)._m0[83].w, _861);
    float _909 = _613 + _717;
    bool _911 = !_875;
    int _913 = _911 ? 0 : 1;
    float _915 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _917 = _903 + (-1.0);
    float _919 = _909 + (-1.0);
    float _921 = _717 * 2.0;
    int _923 = abs(_913);
    float _925 = fma(_885, -2.0, _915);
    float _927 = fma(_917, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _929 = fma(_919, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _931 = _893 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _933 = _793 + 0.5;
    float _935 = -_125;
    float _937 = fma(_935, (*spvDescriptorSet0.vp_c9)._m0[81].x, _899);
    float _939 = float(_923);
    float _941 = floor(_921);
    float _943 = float(_755);
    float _945 = fma(_931, _933, _937);
    bool _947 = !_879;
    int _949 = _947 ? 0 : 1;
    float _951 = _871 * _125;
    float _953 = _939 * _943;
    float _955 = _901 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _957 = exp2(_951);
    int _959 = abs(_949);
    float _961 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _963 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _965 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _967 = float(_959);
    float _969 = _961 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _971 = float(_789);
    float _973 = _963 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _975 = _965 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _977 = _941 > 0.0;
    float _979 = _967 * _971;
    bool _981 = _941 >= 0.0;
    bool _983 = isnan(_941);
    bool _985 = _981 || _983;
    bool _987 = isnan(0.0);
    bool _989 = _985 || _987;
    float _991 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _993 = 1.0 + _991;
    float _995 = -_199;
    int _997 = _665 ? as_type<int>(_995) : as_type<int>(_199);
    float _999 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1001 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1003 = _887 + _1001;
    out.m_64.x = _969;
    out.m_64.y = _973;
    out.m_64.z = _975;
    out.m_64.w = _955;
    bool _1005 = !_761;
    float _1007 = _1005 ? _199 : as_type<float>(_997);
    float _1009 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1011 = _847 + _1009;
    bool _1013 = _615 > 0.5;
    float _1015 = -_957;
    float _1017 = _1015 + 1.0;
    bool _1019 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1021 = isnan(0.0);
    bool _1023 = _1019 || _1021;
    bool _1025 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1027 = _1023 || _1025;
    float _1029 = 1.0 / _993;
    float _1031 = -_195;
    int _1033 = _1013 ? as_type<int>(_1031) : as_type<int>(_195);
    float _1035 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[81].y, _925);
    bool _1037 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1039 = isnan(1.0);
    bool _1041 = _1037 || _1039;
    bool _1043 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1045 = _1041 || _1043;
    float _1047 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[82].w, _907);
    bool _1049 = !_769;
    float _1051 = _1049 ? _195 : as_type<float>(_1033);
    float _1053 = _1003 * _1003;
    bool _1055 = _717 > 0.5;
    float _1057 = _1003 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1059 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1061 = _889 + _1059;
    float _1063 = _999 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1065 = _1007 + (-0.5);
    float _1067 = fma(_1011, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1057);
    float _1069 = _1027 ? _1017 : 0.0;
    float _1071 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1073 = -_1063;
    float _1075 = -_1035;
    float _1077 = fma(_1073, _1065, _1075);
    float _1079 = fma(_1061, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1067);
    float _1081 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[82].z, _905);
    float _1083 = _945;
    if (_1045)
    {
        float _1085 = _1069 * _1029;
        _127 = _1085;
    }
    float _1087 = _127;
    float _1089 = -_199;
    int _1091 = _1055 ? as_type<int>(_1089) : as_type<int>(_199);
    float _1093 = _1051 + 0.5;
    bool _1095 = _1079 >= 0.0;
    float _1097 = fma(_1011, _1011, _1053);
    float _1099 = in.m_66.x;
    float _1101 = in.m_66.y;
    float _1103 = in.m_66.z;
    int _1105 = _989 ? 0 : 1;
    float _1107 = -_1081;
    float _1109 = _1107 + 1.0;
    bool _1111 = !_773;
    float _1113 = _1111 ? _199 : as_type<float>(_1091);
    float _1115 = fma(_1061, _1061, _1097);
    int _1117 = ~_1105;
    int _1119 = _1117 + 1;
    int _1121 = _1119 + 1;
    float _1123 = _1093 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _1125 = _1121;
    if (!_977)
    {
        int _1127 = ~_1105;
        int _1129 = _1127 + 1;
        _1125 = _1129;
    }
    int _1131 = _1125;
    float _1133 = -_1113;
    float _1135 = _1133 + 0.5;
    float _1137 = -_1047;
    float _1139 = _1137 + 1.0;
    float _1141 = -_1109;
    float _1143 = fma(_793, _1141, _945);
    if (_1095)
    {
        _1083 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1145 = _1083;
    float _1147 = _1135 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1149 = fma(_1007, _1139, _1077);
    float _1151 = rsqrt(_1115);
    float _1153 = _953 * (-2.0);
    float _1155 = _1123 * _841;
    float _1157 = _1147 * _1071;
    int _1159 = as_type<int>(_1145);
    if (_1095)
    {
        float _1161 = _1145 * 5.0;
        _1159 = as_type<int>(_1161);
    }
    int _1163 = _1159;
    float _1165 = fma(_927, _1153, _927);
    if (_1095)
    {
        out.m_45.x = 0.0;
    }
    float _1167 = fma(_1153, _1099, _1099);
    float _1169 = _979 * (-2.0);
    out.m_68.x = _1155;
    out.m_68.y = _1157;
    out.m_68.z = _1143;
    out.m_68.w = _1149;
    bool _1171 = !_883;
    int _1173 = _1171 ? 0 : 1;
    float _1175 = fma(_929, _1169, _929);
    if (_1095)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3720 = as_type<float>(_1163);
        out.gl_Position.z = _3720;
    }
    float _1177 = _1003 * _1151;
    float _1179 = _1011 * _1151;
    if (_1095)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1181 = -_1177;
    float _1183 = fma(_1181, (*spvDescriptorSet0.vp_c9)._m0[18].w, _887);
    float _1185 = fma(_1169, _1101, _1101);
    float _1187 = _615 + (-0.5);
    float _1189 = -_1179;
    float _1191 = fma(_1189, (*spvDescriptorSet0.vp_c9)._m0[18].w, _847);
    float _1193 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1195 = _1183 + _1193;
    float _1197 = _717 + (-0.5);
    float _1199 = fma(_1187, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1167);
    float _1201 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1203 = _1191 + _1201;
    float _1205 = _1195 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1207 = _1061 * _1151;
    int _1209 = abs(_1173);
    float _1211 = fma(_1197, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1185);
    float _1213 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1205);
    float _1215 = -_1207;
    float _1217 = fma(_1215, (*spvDescriptorSet0.vp_c9)._m0[18].w, _889);
    float _1219 = -_1177;
    float _1221 = fma(_1219, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1003);
    float _1223 = -_1179;
    float _1225 = fma(_1223, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1011);
    float _1227 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1229 = _1217 + _1227;
    float _1231 = float(_1209);
    float _1233 = _1221 * _1221;
    float _1235 = float(_1131);
    float _1237 = fma(_1229, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1213);
    float _1239 = -_1207;
    float _1241 = fma(_1239, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1061);
    float _1243 = fma(_1225, _1225, _1233);
    float _1245 = _615 + _613;
    float _1247 = _1231 * _1235;
    float _1249 = fma(_1241, _1241, _1243);
    float _1251 = _1245 + (-1.0);
    float _1253 = _1247 * (-2.0);
    float _1255 = _613 + (-0.5);
    bool _1257 = _1237 >= 0.0;
    float _1259 = fma(_1251, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1261 = fma(_1253, _1103, _1103);
    float _1263 = fma(_1165, _1087, _1199);
    float _1265 = fma(_1175, _1087, _1211);
    float _1267 = fma(_1259, _1253, _1259);
    float _1269 = fma(_1255, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1261);
    float _1271 = _1263 * 0.15915493667125701904296875;
    float _1273 = sqrt(_1249);
    float _1275 = _1265 * 0.15915493667125701904296875;
    float _1277 = fma(_1267, _1087, _1269);
    float _1279 = _1261;
    float _1281 = _1217;
    if (_1257)
    {
        _1279 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1283 = _1279;
    float _1285 = _1277 * 0.15915493667125701904296875;
    int _1287 = as_type<int>(_1283);
    if (_1257)
    {
        out.m_45.x = 0.0;
    }
    float _1289 = _1271 * 6.283185482025146484375;
    float _1291 = sin(_1289);
    if (_1257)
    {
        float _1293 = _1283 * 5.0;
        _1287 = as_type<int>(_1293);
    }
    int _1295 = _1287;
    if (_1257)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3932 = as_type<float>(_1295);
        out.gl_Position.z = _3932;
    }
    float _1297 = _1271 * 6.283185482025146484375;
    float _1299 = cos(_1297);
    float _1301 = _1151 * _1273;
    float _1303 = _1275 * 6.283185482025146484375;
    float _1305 = sin(_1303);
    float _1307 = _1275 * 6.283185482025146484375;
    float _1309 = cos(_1307);
    float _1311 = _1285 * 6.283185482025146484375;
    float _1313 = sin(_1311);
    if (_1257)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1315 = _1285 * 6.283185482025146484375;
    float _1317 = cos(_1315);
    float _1319 = _579 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1321 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _199);
    float _1323 = _577 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1325 = _1291 * _1305;
    float _1327 = _1301 * _1319;
    float _1329 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _195);
    float _1331 = _1301 * _1323;
    float _1333 = _1299 * _1305;
    float _1335 = _1321 * _1327;
    float _1337 = _1299 * _1309;
    float _1339 = _1329 * _1331;
    float _1341 = -_1335;
    float _1343 = _1313 * _1341;
    float _1345 = fma(_1313, _1337, _1325);
    float _1347 = fma(_1313, _1325, _1337);
    float _1349 = _1317 * _1335;
    float _1351 = _1305 * _1317;
    float _1353 = _1299 * _1349;
    float _1355 = _1309 * _1317;
    float _1357 = _1291 * _1309;
    float _1359 = _1291 * _1349;
    float _1361 = fma(_1345, _1339, _1353);
    float _1363 = _1301 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1365 = _1363 * 0.5;
    float _1367 = -_1357;
    float _1369 = fma(_1313, _1333, _1367);
    float _1371 = fma(_1355, _1339, _1343);
    float _1373 = -_1333;
    float _1375 = fma(_1313, _1357, _1373);
    float _1377 = fma(_1369, _1365, _1361);
    float _1379 = fma(_1351, _1365, _1371);
    float _1381 = fma(_1375, _1339, _1359);
    float _1383 = _1377 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1385 = _1377 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1387 = fma(_1347, _1365, _1381);
    float _1389 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1383);
    float _1391 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1385);
    float _1393 = fma(_1387, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1389);
    float _1395 = fma(_1387, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1391);
    float _1397 = _1393 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1399 = _1395 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1401 = _889 + _1397;
    float _1403 = _847 + _1399;
    float _1405 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1407 = _1401 + _1405;
    float _1409 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1411 = _1403 + _1409;
    float _1413 = _1407 * _1407;
    float _1415 = fma(_1411, _1411, _1413);
    float _1417 = _1377 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1419 = sqrt(_1415);
    float _1421 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1417);
    float _1423 = fma(_1387, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1421);
    float _1425 = _1423 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1427 = _887 + _1425;
    bool _1429 = _1419 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1431 = _1425;
    float _1433 = _1403;
    float _1435 = _1401;
    float _1437 = _1419;
    float _1439 = _1361;
    if (!_1429)
    {
        _1431 = _1427;
    }
    float _1441 = _1431;
    bool _1443 = !_1429;
    float _1445 = _1441;
    if (!_1443)
    {
        float _1447 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1449 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1451 = _1419 + _1449;
        float _1453 = _1427 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1455 = rsqrt(_1415);
        float _1457 = _1451 * _1447;
        float _1459 = _1457 * 0.15915493667125701904296875;
        float _1461 = _1459 * 6.283185482025146484375;
        float _1463 = cos(_1461);
        float _1465 = _1459 * 6.283185482025146484375;
        float _1467 = sin(_1465);
        float _1469 = _1463 + (-1.0);
        float _1471 = _1469 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1473 = fma(_1467, _1453, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1475 = fma(_1427, _1463, _1471);
        float _1477 = _1455 * _1473;
        float _1479 = fma(_1411, _1477, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1481 = fma(_1407, _1477, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1445 = _1475;
        _1433 = _1479;
        _1435 = _1481;
        _1437 = _1459;
    }
    float _1483 = _1445;
    float _1485 = _1433;
    float _1487 = _1435;
    float _1489 = _1437;
    float _1491 = -_1177;
    float _1493 = fma(_1491, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1483);
    float _1495 = -_1179;
    float _1497 = fma(_1495, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1485);
    float _1499 = -_1207;
    float _1501 = fma(_1499, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1487);
    float _1503 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1505 = _1493 + _1503;
    float _1507 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1509 = _1497 + _1507;
    float _1511 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1513 = _1501 + _1511;
    float _1515 = _1505 * _1505;
    float _1517 = fma(_1509, _1509, _1515);
    float _1519 = fma(_1513, _1513, _1517);
    float _1521 = rsqrt(_1519);
    float _1523 = sqrt(_1519);
    float _1525 = _1521 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1527 = _1509 * _1525;
    float _1529 = _1513 * _1525;
    float _1531 = _1527 * _1527;
    float _1533 = _1529 * _1529;
    float _1535 = _1531 + _1533;
    float _1537 = sqrt(_1535);
    bool _1539 = _1537 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1541 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1543 = _1537 + _1541;
    float _1545 = _1513;
    float _1547 = _1489;
    float _1549 = _1543;
    float _1551 = _1517;
    float _1553 = _1505;
    if (_1539)
    {
        float _1555 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1545 = _1555;
    }
    float _1557 = _1545;
    if (_1539)
    {
        float _1559 = rsqrt(_1535);
        _1547 = _1559;
    }
    float _1561 = _1547;
    float _1563 = _1561;
    if (_1539)
    {
        float _1565 = _1543 * _1557;
        _1549 = _1565;
    }
    float _1567 = _1549;
    if (_1539)
    {
        float _1569 = _1567 * 0.15915493667125701904296875;
        _1551 = _1569;
    }
    float _1571 = _1551;
    float _1573 = _1521;
    if (_1539)
    {
        float _1575 = _1571 * 6.283185482025146484375;
        float _1577 = sin(_1575);
        _1573 = _1577;
    }
    float _1579 = _1573;
    float _1581 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1583 = precise::max(0.0, _1581);
    float _1585 = _1485;
    float _1587 = _1583;
    float _1589 = _1581;
    if (_1539)
    {
        float _1591 = _1571 * 6.283185482025146484375;
        float _1593 = cos(_1591);
        _1585 = _1593;
    }
    float _1595 = _1585;
    float _1597 = -_1525;
    float _1599 = -_1583;
    float _1601 = fma(_1505, _1597, _1599);
    if (!_1539)
    {
        _1587 = _1529;
    }
    float _1603 = _1587;
    float _1605 = _1603;
    if (_1539)
    {
        float _1607 = _1601 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1589 = _1607;
    }
    float _1609 = _1589;
    float _1611 = _1579;
    float _1613 = _1609;
    if (_1539)
    {
        float _1615 = fma(_1579, _1609, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1553 = _1615;
    }
    float _1617 = _1553;
    float _1619 = _1617;
    if (!_1539)
    {
        _1611 = _1601;
    }
    float _1621 = _1611;
    float _1623 = _1621;
    if (_1539)
    {
        float _1625 = _1595 + (-1.0);
        _1613 = _1625;
    }
    float _1627 = _1613;
    float _1629 = _1627;
    if (_1539)
    {
        float _1631 = _1561 * _1617;
        _1439 = _1631;
    }
    float _1633 = _1439;
    if (!_1539)
    {
        _1563 = _1527;
    }
    float _1635 = _1563;
    float _1637 = _1635;
    if (_1539)
    {
        float _1639 = _1627 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1619 = _1639;
    }
    float _1641 = _1619;
    float _1643 = _1641;
    if (_1539)
    {
        float _1645 = _1527 * _1633;
        _1637 = _1645;
    }
    float _1647 = _1637;
    if (!_1539)
    {
        _1629 = _1531;
    }
    float _1649 = _1629;
    float _1651 = _1649;
    if (_1539)
    {
        float _1653 = _1529 * _1633;
        _1605 = _1653;
    }
    float _1655 = _1605;
    if (_1539)
    {
        float _1657 = fma(_1601, _1595, _1641);
        _1623 = _1657;
    }
    float _1659 = _1623;
    if (_1539)
    {
        float _1661 = _1647 * _1647;
        _1651 = _1661;
    }
    float _1663 = _1651;
    if (!_1539)
    {
        _1643 = _1533;
    }
    float _1665 = _1643;
    float _1667 = _1665;
    if (_1539)
    {
        float _1669 = _1655 * _1655;
        _1667 = _1669;
    }
    float _1671 = _1667;
    float _1673 = fma(_1659, _1659, _1663);
    float _1675 = _1493 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1677 = _1673 + _1671;
    float _1679 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1681 = fma(_1523, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1679);
    float _1683 = precise::clamp(_1681, 0.0, 1.0);
    float _1685 = fma(_1497, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1675);
    float _1687 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1689 = rsqrt(_1677);
    float _1691 = -_1683;
    float _1693 = _1691 + 1.0;
    float _1695 = _1493 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1697 = fma(_1501, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1685);
    float _1699 = _1493 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1701 = _1493 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1703 = fma(_1497, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1695);
    float _1705 = _1697 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1707 = abs(_1693);
    float _1709 = log2(_1707);
    float _1711 = fma(_1497, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1699);
    float _1713 = fma(_1501, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1703);
    float _1715 = fma(_1497, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1701);
    float _1717 = _1705 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1719 = fma(_1501, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1711);
    float _1721 = _1713 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1723 = fma(_1501, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1715);
    float _1725 = _1689 * _1647;
    float _1727 = _1719 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1729 = _1721 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1731 = _1723 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1733 = _1689 * _1659;
    float _1735 = _1725 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1737 = fma(_1727, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1729);
    float _1739 = _1689 * _1655;
    float _1741 = _1709 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1743 = -_1735;
    float _1745 = fma(_1733, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1743);
    float _1747 = fma(_1705, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1737);
    float _1749 = -_1717;
    float _1751 = fma(_1749, _1687, 1.0);
    float _1753 = _1721 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1755 = -_1739;
    float _1757 = fma(_1755, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1745);
    float _1759 = exp2(_1741);
    float _1761 = fma(_1731, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1747);
    float _1763 = _1721 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1765 = fma(_1757, -0.5, 0.5);
    float _1767 = fma(_1757, 0.5, 0.5);
    float _1769 = fma(_1727, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1763);
    float _1771 = fma(_1727, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1753);
    float _1773 = log2(_1751);
    float _1775 = _1733 + 1.0;
    float _1777 = fma(_1767, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1779 = fma(_1705, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1769);
    float _1781 = fma(_1705, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1771);
    float _1783 = 1.0 / _1761;
    float _1785 = -_1733;
    float _1787 = fma(_1759, _1775, _1785);
    float _1789 = fma(_1767, _1777, -0.212114393711090087890625);
    float _1791 = fma(_1731, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1779);
    float _1793 = fma(_1731, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1781);
    float _1795 = fma(_1787, 0.5, 0.5);
    float _1797 = fma(_1767, _1789, 1.570728778839111328125);
    float _1799 = sqrt(_1765);
    float _1801 = _1773 * 0.693147182464599609375;
    float _1803 = _1801 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1805 = _1791 * _1783;
    float _1807 = _1793 * _1783;
    float _1809 = fma(_1805, 0.5, 0.5);
    float _1811 = fma(_1807, -0.5, 0.5);
    float _1813 = _1799 * 0.636619746685028076171875;
    float3 _4785 = float3(_1809, _1811, _1803);
    float _1815 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4785, float3(0.0), isnan(_4785)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4785, float3(0.0), isnan(_4785)), level(0.0)).x;
    float3 _4796 = float3(_1809, _1811, _1803);
    float4 _1818 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4796, float3(0.0), isnan(_4796)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4796, float3(0.0), isnan(_4796)), level(0.0)).xyzw;
    float _1820 = _1818.x;
    float _1822 = _1818.y;
    float _1824 = _1818.z;
    float _1826 = _1818.w;
    float _1828 = -_1797;
    float _1830 = fma(_1813, _1828, 1.0);
    float2 _4818 = float2(_1830, _1795);
    float3 _1834 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4818, float2(0.0), isnan(_4818)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4818, float2(0.0), isnan(_4818)), level(0.0)).xyz;
    float _1836 = _1834.x;
    float _1838 = _1834.y;
    float _1840 = _1834.z;
    float _1842 = _1183 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1844 = _1183 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1846 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1848 = isnan(0.5);
    bool _1850 = _1846 || _1848;
    bool _1852 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1854 = _1850 || _1852;
    float _1856 = _1709 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1858 = fma(_1191, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1842);
    float _1860 = fma(_1191, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1844);
    float _1862 = _1721 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1864 = fma(_1217, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1858);
    float _1866 = fma(_1217, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1860);
    float _1868 = exp2(_1856);
    float _1870 = fma(_1727, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1862);
    float _1872 = _1864 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1874 = _1866 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1876 = _1809;
    float _1878 = _1864;
    float _1880 = _1709;
    if (!_1854)
    {
        _1281 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1882 = _1281;
    float _1884 = fma(_1705, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1870);
    float _1886 = _1874 + _1872;
    float _1888 = 1.0 / _1872;
    float _1890 = _1882;
    if (!_1854)
    {
        _1876 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1892 = _1876;
    float _1894 = _1886 * _1888;
    float _1896 = _1894 * 0.5;
    float _1898 = _1888;
    float _1900 = _1896;
    if (_1854)
    {
        _1898 = 1.0;
    }
    float _1902 = _1898;
    float _1904 = _1902;
    if (!_1854)
    {
        float _1906 = -_1882;
        float _1908 = fma(_1896, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1906);
        _1900 = _1908;
    }
    float _1910 = _1900;
    if (!_1854)
    {
        float _1912 = -_1892;
        float _1914 = _1912 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1890 = _1914;
    }
    float _1916 = _1890;
    if (!_1854)
    {
        float _1918 = 1.0 / _1916;
        _1878 = _1918;
    }
    float _1920 = _1878;
    float _1922 = _1910;
    if (!_1854)
    {
        float _1924 = 1.0 / _1910;
        _1922 = _1924;
    }
    float _1926 = _1922;
    if (!_1854)
    {
        float _1928 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1930 = -_1892;
        float _1932 = fma(_1926, _1928, _1930);
        _1880 = _1932;
    }
    float _1934 = _1880;
    if (!_1854)
    {
        float _1936 = _1934 * _1920;
        float _1938 = precise::clamp(_1936, 0.0, 1.0);
        _1904 = _1938;
    }
    float _1940 = _1904;
    float _1942 = fma(_1731, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1884);
    float _1944 = -_1868;
    float _1946 = _1944 + 1.0;
    float _1948 = _1940 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1950 = _1940 > 0.0;
    bool _1952 = isnan(_1940);
    bool _1954 = _1950 || _1952;
    bool _1956 = isnan(0.0);
    bool _1958 = _1954 || _1956;
    float _1960 = _1946 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1962 = _1942 + _1761;
    out.gl_Position.x = _1791;
    out.gl_Position.y = _1793;
    out.gl_Position.z = _1942;
    out.gl_Position.w = _1761;
    float _1964 = _1962 * 0.5;
    float _1966 = _1948 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_70.z = _1964;
    out.m_70.w = _1761;
    out.m_45.x = _1966;
    float _1968 = _1960 * _1815;
    float _1970 = -_1960;
    float _1972 = _1970 + 1.0;
    float _1974 = _1826 * _1968;
    float _1976 = _1840 * _1968;
    float _1978 = fma(_1836, _1974, _1820);
    float _1980 = fma(_1838, _1974, _1822);
    float _1982 = _1826 * _1972;
    float _1984 = fma(_1826, _1976, _1824);
    out.m_72.x = _1978;
    out.m_72.y = _1980;
    out.m_72.z = _1984;
    out.m_72.w = _1982;
    if (_1958)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _1986 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1986;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

