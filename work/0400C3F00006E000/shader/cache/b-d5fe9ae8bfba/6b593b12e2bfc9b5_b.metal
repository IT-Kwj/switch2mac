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
    float4 m_66 [[user(locn0)]];
    float4 m_60 [[user(locn1)]];
    float4 m_70 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_64 [[user(locn4)]];
    float4 m_72 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_58 [[attribute(1)]];
    float4 m_54 [[attribute(2)]];
    float4 m_56 [[attribute(3)]];
    float4 m_62 [[attribute(4)]];
    float4 m_42 [[attribute(5)]];
    float4 m_47 [[attribute(6)]];
    float4 m_49 [[attribute(7)]];
    float4 m_68 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _513 = false;
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
        float _2050 = as_type<float>(_107);
        out.gl_Position.z = _2050;
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
        float _2119 = as_type<float>(_145);
        out.gl_Position.z = _2119;
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
    bool _193 = !_179;
    int _195 = _193 ? 0 : 1;
    bool _197 = !_187;
    int _199 = _197 ? 0 : 1;
    int _201 = abs(_195);
    float _203 = -_169;
    float _205 = _157 + _203;
    int _207 = abs(_199);
    float _209 = -_205;
    float _211 = fma(_209, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _213 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _215 = float(_201);
    float _217 = fma(_191, 0.5, 0.5);
    bool _219 = !_183;
    int _221 = _219 ? 0 : 1;
    float _223 = abs(_211);
    float _225 = _215 * _223;
    int _227 = abs(_221);
    float _229 = -_217;
    float _231 = fma(_229, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _233 = _205 < 0.5;
    float _235 = float(_233);
    float _237 = float(_207);
    float _239 = float(_227);
    float _241 = -_235;
    float _243 = fma(_241, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _245 = !_161;
    float _247 = _245 ? (-0.5) : 0.5;
    float _249 = fma(_237, _231, _225);
    float _251 = abs(_243);
    float _253 = fma(_239, _251, _249);
    bool _255 = !_213;
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
    float _291 = _283 + _289;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _295 = _283 + _293;
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _299 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _297;
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _303 = _301 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _307 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _305;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _311 = _309 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _313 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _315 = isnan(_283);
    bool _317 = _313 || _315;
    bool _319 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _321 = _317 || _319;
    float _323 = float(_321);
    float _325 = 1.0 / _299;
    bool _327 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _329 = 1.0 / _303;
    float _331 = 1.0 / _307;
    float _333 = _291 * _325;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _337 = _283 + _335;
    float _339 = 1.0 / _311;
    float _341 = _287 * _329;
    bool _343 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _345 = isnan(_283);
    bool _347 = _343 || _345;
    bool _349 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _351 = _347 || _349;
    float _353 = float(_351);
    bool _355 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _357 = isnan(_283);
    bool _359 = _355 || _357;
    bool _361 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _363 = _359 || _361;
    float _365 = float(_363);
    float _367 = _295 * _331;
    float _369 = -_323;
    float _371 = _369 + 1.0;
    float _373 = -_353;
    float _375 = _373 + 1.0;
    float _377 = _353 * _371;
    bool _379 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _381 = isnan(_283);
    bool _383 = _379 || _381;
    bool _385 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _387 = _383 || _385;
    float _389 = float(_387);
    float _391 = _365 * _375;
    float _393 = _337 * _339;
    float _395 = -_365;
    float _397 = _395 + 1.0;
    bool _399 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _401 = isnan(_283);
    bool _403 = _399 || _401;
    bool _405 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _407 = _403 || _405;
    float _409 = float(_407);
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _413 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _411;
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _417 = _415 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _421 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _419;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _425 = _423 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _427 = _389 * _397;
    float _429 = -_389;
    float _431 = _429 + 1.0;
    float _433 = fma(_421, _333, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _435 = fma(_413, _333, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _437 = -_409;
    float _439 = _437 + 1.0;
    float _441 = _409 * _431;
    float _443 = fma(_425, _341, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _445 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _447 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _445;
    float _449 = fma(_417, _341, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _451 = _433 * _441;
    float _453 = _435 * _441;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _457 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _455;
    float _459 = fma(_447, _367, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _461 = fma(_439, (*spvDescriptorSet0.vp_c9)._m0[143].x, _451);
    float _463 = fma(_439, (*spvDescriptorSet0.vp_c9)._m0[143].y, _453);
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _467 = _465 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _469 = fma(_457, _367, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _471 = fma(_443, _427, _461);
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _475 = _473 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _477 = fma(_449, _427, _463);
    float _479 = fma(_467, _393, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _481 = fma(_459, _391, _471);
    float _483 = fma(_475, _393, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _485 = fma(_469, _391, _477);
    float _487 = fma(_479, _377, _481);
    float _489 = fma(_483, _377, _485);
    float _491 = fma(_323, (*spvDescriptorSet0.vp_c9)._m0[147].x, _487);
    float _493 = fma(_323, (*spvDescriptorSet0.vp_c9)._m0[147].y, _489);
    bool _495 = !_327;
    float _511;
    if (!_495)
    {
        float _497 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _499 = _147 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _501 = fma(_499, (*spvDescriptorSet0.vp_c9)._m0[11].y, _125);
        float _503 = _501 * _497;
        float _505 = floor(_503);
        float _507 = -_505;
        float _509 = _503 + _507;
        _511 = _509;
        _513 = true;
    }
    else
    {
        float _515 = float(_91);
        float _517 = 1.0 / _515;
        float _519 = _125 * _517;
        _511 = _519;
    }
    _513 = false;
    float _521 = _511;
    float _523 = in.m_42.x;
    float _525 = in.m_42.y;
    float _527 = in.m_42.z;
    float _529 = _147 * 2.0;
    float _531 = in.m_54.x;
    float _533 = in.m_54.y;
    float _535 = in.m_54.z;
    float _537 = in.m_54.w;
    float _539 = floor(_529);
    float _541 = in.m_56.x;
    float _543 = in.m_56.y;
    float _545 = in.m_56.z;
    float _547 = in.m_56.w;
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _551 = _549 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _553 = in.m_58.x;
    float _555 = in.m_58.y;
    float _557 = in.m_58.z;
    float _559 = in.m_58.w;
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _563 = _561 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _565 = in.m_49.y;
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _569 = _567 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _571 = 1.0 / _563;
    int _573 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _575 = _573 != 0;
    int _577 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _579 = _577 != 0;
    int _581 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _583 = _581 != 0;
    float _585 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _587 = _585 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _589 = _539 > 0.0;
    bool _591 = _539 >= 0.0;
    bool _593 = isnan(_539);
    bool _595 = _591 || _593;
    bool _597 = isnan(0.0);
    bool _599 = _595 || _597;
    float _601 = 1.0 / _551;
    int _603 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _605 = _603 != 0;
    float _607 = _525 * _533;
    int _609 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _611 = _609 != 0;
    int _613 = _599 ? 0 : 1;
    float _615 = fma(_523, _531, _607);
    float _617 = _525 * _543;
    float _619 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _621 = 1.0 / _569;
    float _623 = _525 * _555;
    float _625 = fma(_523, _541, _617);
    float _627 = _619 * _147;
    float _629 = fma(_523, _553, _623);
    float _631 = _565 * 2.0;
    float _633 = in.m_49.z;
    float _635 = 1.0 / _587;
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _639 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _637;
    float _641 = fma(_527, _535, _615);
    float _643 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _645 = _643 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _647 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _649 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _647;
    float _651 = _639 * _571;
    float _653 = fma(_527, _545, _625);
    float _655 = _645 * _601;
    float _657 = trunc(_627);
    int _659 = int(_657);
    float _661 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _663 = _661 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _665 = _649 * _621;
    float _667 = _147 + _565;
    float _669 = fma(_527, _557, _629);
    int _671 = ~_613;
    int _673 = _671 + 1;
    int _675 = _673 + 1;
    float _677 = _667 + (-1.0);
    float _679 = floor(_631);
    float _681 = _663 * _635;
    int _683 = _675;
    if (!_589)
    {
        int _685 = ~_613;
        int _687 = _685 + 1;
        _683 = _687;
    }
    int _689 = _683;
    float _691 = fma(_677, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _693 = _669 + _559;
    bool _695 = _521 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _697 = isnan(_521);
    bool _699 = _695 || _697;
    bool _701 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _703 = _699 || _701;
    float _705 = float(_703);
    float _707 = _633 * 2.0;
    int _709 = _659 << 4;
    int _711 = _709 + 1968;
    float _713 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _715 = log2(_713);
    float _717 = _565 + _633;
    float _719 = _641 + _537;
    int _721 = _711 + 8;
    uint _724 = uint(int(uint(_721) >> uint(2)));
    uint _726 = uint(int(uint(int(_724)) >> uint(2)));
    int _728 = int(_724) & 3;
    float _730 = (*spvDescriptorSet0.vp_c9)._m0[int(_726)][_728];
    float _732 = _717 + (-1.0);
    bool _734 = _679 >= 0.0;
    bool _736 = isnan(_679);
    bool _738 = _734 || _736;
    bool _740 = isnan(0.0);
    bool _742 = _738 || _740;
    float _744 = floor(_707);
    float _746 = fma(_732, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _748 = _742 ? 0 : 1;
    uint _750 = uint(int(uint(_711) >> uint(2)));
    uint _752 = uint(int(uint(int(_750)) >> uint(2)));
    int _754 = int(_750) & 3;
    float _756 = (*spvDescriptorSet0.vp_c9)._m0[int(_752)][_754];
    int _758 = int(_750) + 1;
    uint _760 = uint(int(uint(_758) >> uint(2)));
    int _762 = _758 & 3;
    float _764 = (*spvDescriptorSet0.vp_c9)._m0[int(_760)][_762];
    bool _766 = _679 > 0.0;
    int _768 = ~_748;
    int _770 = _768 + 1;
    int _772 = _770 + 1;
    float _774 = _715 * _125;
    float _776 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _778 = _521 + _776;
    float _780 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _782 = _521 + _780;
    float _784 = exp2(_774);
    float _786 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _788 = _521 + _786;
    float _790 = fma(_655, _782, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _792 = _744 > 0.0;
    float _794 = fma(_651, _788, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    int _796 = _772;
    if (!_766)
    {
        int _798 = ~_748;
        int _800 = _798 + 1;
        _796 = _800;
    }
    int _802 = _796;
    float _804 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _806 = _521 + _804;
    bool _808 = _744 >= 0.0;
    bool _810 = isnan(_744);
    bool _812 = _808 || _810;
    bool _814 = isnan(0.0);
    bool _816 = _812 || _814;
    float _818 = fma(_665, _778, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _820 = _521 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _822 = isnan(_521);
    bool _824 = _820 || _822;
    bool _826 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _828 = _824 || _826;
    float _830 = float(_828);
    float _832 = fma(_681, _806, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    bool _834 = _521 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _836 = isnan(_521);
    bool _838 = _834 || _836;
    bool _840 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _842 = _838 || _840;
    float _844 = float(_842);
    float _846 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _848 = _521 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _850 = isnan(_521);
    bool _852 = _848 || _850;
    bool _854 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _856 = _852 || _854;
    float _858 = float(_856);
    float _860 = -_830;
    float _862 = _860 + 1.0;
    int _864 = _816 ? 0 : 1;
    float _866 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _868 = 1.0 + _866;
    float _870 = -_784;
    float _872 = _870 + 1.0;
    float _874 = _844 * _862;
    float _876 = -_844;
    float _878 = _876 + 1.0;
    float _880 = -_705;
    float _882 = _880 + 1.0;
    int _884 = ~_864;
    int _886 = _884 + 1;
    int _888 = _886 + 1;
    float _890 = 1.0 / _868;
    float _892 = _705 * _878;
    bool _894 = _521 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _896 = isnan(_521);
    bool _898 = _894 || _896;
    bool _900 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _902 = _898 || _900;
    float _904 = float(_902);
    float _906 = _858 * _882;
    float _908 = -_858;
    float _910 = _908 + 1.0;
    int _912 = _888;
    if (!_792)
    {
        int _914 = ~_864;
        int _916 = _914 + 1;
        _912 = _916;
    }
    int _918 = _912;
    float _920 = _653 + _547;
    bool _922 = _147 > 0.5;
    float _924 = _904 * _910;
    float _926 = -_904;
    float _928 = _926 + 1.0;
    float _930 = _730 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _932 = -_247;
    int _934 = _922 ? as_type<int>(_932) : as_type<int>(_247);
    float _936 = _818 * _924;
    bool _938 = _565 > 0.5;
    float _940 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _942 = !_579;
    int _944 = _942 ? 0 : 1;
    float _946 = fma(_928, (*spvDescriptorSet0.vp_c9)._m0[115].x, _936);
    float _948 = -_175;
    int _950 = _938 ? as_type<int>(_948) : as_type<int>(_175);
    float _952 = _756 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _954 = !_605;
    float _956 = _954 ? _247 : as_type<float>(_934);
    float _958 = fma(_790, _906, _946);
    int _960 = abs(_944);
    float _962 = _764 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _964 = !_611;
    float _966 = _964 ? _175 : as_type<float>(_950);
    float _968 = _956 + 0.5;
    float _970 = float(_689);
    float _972 = fma(_794, _892, _958);
    float _974 = float(_960);
    float _976 = -_966;
    float _978 = _976 + 0.5;
    bool _980 = !_575;
    int _982 = _980 ? 0 : 1;
    float _984 = _968 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _986 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _988 = isnan(0.0);
    bool _990 = _986 || _988;
    bool _992 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _994 = _990 || _992;
    float _996 = _974 * _970;
    int _998 = abs(_982);
    float _1000 = _978 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1002 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1004 = _719 + _1002;
    float _1006 = _984 * _846;
    float _1008 = _1000 * _940;
    float _1010 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1012 = _693 + _1010;
    float _1014 = _1004 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1016 = float(_998);
    float _1018 = _952 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1020 = float(_918);
    float _1022 = _962 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1024 = _930 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1026 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1028 = _920 + _1026;
    float _1030 = fma(_1012, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1014);
    float _1032 = fma(_832, _874, _972);
    float _1034 = _994 ? _872 : 0.0;
    float _1036 = _1016 * _1020;
    bool _1038 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1040 = isnan(1.0);
    bool _1042 = _1038 || _1040;
    bool _1044 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1046 = _1042 || _1044;
    out.m_60.x = _1018;
    out.m_60.y = _1022;
    out.m_60.z = _1024;
    float _1048 = fma(_1028, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1030);
    float _1050 = fma(_830, (*spvDescriptorSet0.vp_c9)._m0[119].x, _1032);
    float _1052 = _1004 * _1004;
    float _1054 = in.m_62.x;
    float _1056 = in.m_62.y;
    float _1058 = in.m_62.z;
    float _1060 = _996 * (-2.0);
    bool _1062 = _1048 >= 0.0;
    float _1064 = fma(_1012, _1012, _1052);
    float _1066 = fma(_1028, _1028, _1064);
    float _1068 = _1036;
    if (_1046)
    {
        float _1070 = _1034 * _890;
        _129 = _1070;
    }
    float _1072 = _129;
    float _1074 = fma(_746, _1060, _746);
    float _1076 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1078 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1080 = rsqrt(_1066);
    float _1082 = _1036 * (-2.0);
    if (_1062)
    {
        _1068 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1084 = _1068;
    float _1086 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1088 = _1076 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1090 = _1078 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1092 = _1050 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1094 = _1086 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1096 = as_type<int>(_1084);
    if (_1062)
    {
        float _1098 = _1084 * 5.0;
        _1096 = as_type<int>(_1098);
    }
    int _1100 = _1096;
    float _1102 = _565 + (-0.5);
    out.m_64.x = _1006;
    out.m_64.y = _1008;
    float _1104 = fma(_1060, _1056, _1056);
    float _1106 = _147 + (-0.5);
    float _1108 = fma(_1082, _1054, _1054);
    out.m_66.x = _1094;
    out.m_66.y = _1088;
    out.m_66.z = _1090;
    out.m_66.w = _1092;
    float _1110 = fma(_1102, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1104);
    float _1112 = _1004 * _1080;
    float _1114 = _1112;
    if (_1062)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3594 = as_type<float>(_1100);
        out.gl_Position.z = _3594;
    }
    float _1116 = fma(_691, _1082, _691);
    float _1118 = fma(_1106, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1108);
    if (_1062)
    {
        out.m_45.x = 0.0;
    }
    bool _1120 = !_583;
    int _1122 = _1120 ? 0 : 1;
    float _1124 = _1012 * _1080;
    if (_1062)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1126 = -_1112;
    float _1128 = fma(_1126, (*spvDescriptorSet0.vp_c9)._m0[18].w, _719);
    float _1130 = fma(_1074, _1072, _1110);
    float _1132 = _1028 * _1080;
    float _1134 = -_1124;
    float _1136 = fma(_1134, (*spvDescriptorSet0.vp_c9)._m0[18].w, _693);
    float _1138 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1140 = _1128 + _1138;
    int _1142 = abs(_1122);
    float _1144 = -_1132;
    float _1146 = fma(_1144, (*spvDescriptorSet0.vp_c9)._m0[18].w, _920);
    float _1148 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1150 = _1136 + _1148;
    float _1152 = _1140 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1154 = float(_1142);
    float _1156 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1158 = _1146 + _1156;
    float _1160 = fma(_1150, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1152);
    float _1162 = float(_802);
    float _1164 = fma(_1116, _1072, _1118);
    float _1166 = -_1124;
    float _1168 = fma(_1166, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1012);
    float _1170 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1160);
    float _1172 = -_1132;
    float _1174 = fma(_1172, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1028);
    float _1176 = _1154 * _1162;
    float _1178 = _147 + _633;
    float _1180 = _1164 * 0.15915493667125701904296875;
    bool _1182 = _1170 >= 0.0;
    float _1184 = _1176 * (-2.0);
    float _1186 = in.m_68.x;
    float _1188 = in.m_68.y;
    float _1190 = _1178 + (-1.0);
    float _1192 = -_1112;
    float _1194 = fma(_1192, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1004);
    float _1196 = _1130 * 0.15915493667125701904296875;
    float _1198 = _1180 * 6.283185482025146484375;
    float _1200 = sin(_1198);
    float _1202 = fma(_1190, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1204 = fma(_1184, _1058, _1058);
    float _1206 = _633 + (-0.5);
    float _1208 = _1194 * _1194;
    float _1210 = fma(_1202, _1184, _1202);
    float _1212 = fma(_1206, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1204);
    float _1214 = fma(_1168, _1168, _1208);
    float _1216 = _1168;
    int _1218 = as_type<int>(_1210);
    float _1220 = _1146;
    if (_1182)
    {
        _1216 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1222 = _1216;
    float _1224 = _1196 * 6.283185482025146484375;
    float _1226 = sin(_1224);
    float _1228 = fma(_1210, _1072, _1212);
    float _1230 = fma(_1174, _1174, _1214);
    if (_1182)
    {
        float _1232 = _1222 * 5.0;
        _1218 = as_type<int>(_1232);
    }
    int _1234 = _1218;
    float _1236 = _1228 * 0.15915493667125701904296875;
    if (_1182)
    {
        out.m_45.x = 0.0;
    }
    float _1238 = _1196 * 6.283185482025146484375;
    float _1240 = cos(_1238);
    float _1242 = _493 * _1188;
    if (_1182)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3812 = as_type<float>(_1234);
        out.gl_Position.z = _3812;
    }
    float _1244 = _1180 * 6.283185482025146484375;
    float _1246 = cos(_1244);
    float _1248 = sqrt(_1230);
    float _1250 = _1236 * 6.283185482025146484375;
    float _1252 = sin(_1250);
    if (_1182)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1254 = _253 * _1242;
    float _1256 = _1236 * 6.283185482025146484375;
    float _1258 = cos(_1256);
    float _1260 = _1080 * _1248;
    float _1262 = _491 * _1186;
    float _1264 = _1254 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1266 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _175);
    float _1268 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _247);
    float _1270 = _1260 * _1264;
    float _1272 = _253 * _1262;
    bool _1274 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1276 = isnan(0.5);
    bool _1278 = _1274 || _1276;
    bool _1280 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1282 = _1278 || _1280;
    float _1284 = _1266 * _1270;
    float _1286 = _1272 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1288 = _1200 * _1226;
    float _1290 = _1246 * _1240;
    float _1292 = _1260 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1294 = _1292 * 0.5;
    float _1296 = _1260 * _1286;
    float _1298 = _1258 * _1284;
    float _1300 = _1246 * _1226;
    float _1302 = _1226 * _1258;
    float _1304 = _1240 * _1258;
    float _1306 = fma(_1252, _1290, _1288);
    float _1308 = _1268 * _1296;
    float _1310 = _1246 * _1298;
    float _1312 = _1200 * _1240;
    float _1314 = -_1284;
    float _1316 = _1252 * _1314;
    float _1318 = fma(_1252, _1288, _1290);
    float _1320 = fma(_1306, _1308, _1310);
    float _1322 = -_1312;
    float _1324 = fma(_1252, _1300, _1322);
    float _1326 = -_1300;
    float _1328 = fma(_1252, _1312, _1326);
    float _1330 = _1200 * _1298;
    float _1332 = fma(_1304, _1308, _1316);
    float _1334 = fma(_1324, _1294, _1320);
    float _1336 = fma(_1328, _1308, _1330);
    float _1338 = fma(_1302, _1294, _1332);
    float _1340 = _1334 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1342 = fma(_1318, _1294, _1336);
    float _1344 = _1334 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1346 = fma(_1338, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1340);
    float _1348 = fma(_1338, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1344);
    float _1350 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1346);
    float _1352 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1348);
    float _1354 = _1350 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1356 = _1352 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1358 = _920 + _1354;
    float _1360 = _693 + _1356;
    float _1362 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1364 = _1358 + _1362;
    float _1366 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1368 = _1360 + _1366;
    float _1370 = _1364 * _1364;
    float _1372 = fma(_1368, _1368, _1370);
    float _1374 = _1334 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1376 = sqrt(_1372);
    float _1378 = fma(_1338, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1374);
    float _1380 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1378);
    float _1382 = _1380 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1384 = _719 + _1382;
    bool _1386 = _1376 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1388 = _1382;
    float _1390 = _1308;
    float _1392 = _1360;
    if (!_1386)
    {
        _1388 = _1358;
    }
    float _1394 = _1388;
    float _1396 = _1394;
    if (!_1386)
    {
        _1390 = _1384;
    }
    float _1398 = _1390;
    bool _1400 = !_1386;
    float _1402 = _1398;
    if (!_1400)
    {
        float _1404 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1406 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1408 = _1376 + _1406;
        float _1410 = rsqrt(_1372);
        float _1412 = _1408 * _1404;
        float _1414 = _1384 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1416 = _1412 * 0.15915493667125701904296875;
        float _1418 = _1416 * 6.283185482025146484375;
        float _1420 = cos(_1418);
        float _1422 = _1416 * 6.283185482025146484375;
        float _1424 = sin(_1422);
        float _1426 = _1420 + (-1.0);
        float _1428 = _1426 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1430 = fma(_1424, _1414, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1432 = fma(_1384, _1420, _1428);
        float _1434 = _1410 * _1430;
        float _1436 = fma(_1368, _1434, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1438 = fma(_1364, _1434, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1392 = _1436;
        _1402 = _1432;
        _1396 = _1438;
    }
    float _1440 = _1392;
    float _1442 = _1402;
    float _1444 = _1396;
    float _1446 = -_1124;
    float _1448 = fma(_1446, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1440);
    float _1450 = -_1112;
    float _1452 = fma(_1450, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1442);
    float _1454 = -_1132;
    float _1456 = fma(_1454, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1444);
    float _1458 = _1452;
    float _1460 = _1448;
    float _1462 = _1456;
    float _1464 = _1442;
    if (!_1282)
    {
        float _1466 = _1140 * _1140;
        float _1468 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1470 = -_920;
        float _1472 = _1470 + _1444;
        float _1474 = -_693;
        float _1476 = _1474 + _1440;
        float _1478 = fma(_1150, _1150, _1466);
        float _1480 = -_719;
        float _1482 = _1480 + _1442;
        float _1484 = fma(_1158, _1158, _1478);
        float _1486 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1488 = sqrt(_1484);
        float _1490 = 1.0 / _1260;
        float _1492 = precise::min(_1488, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1494 = _1492 * _1468;
        float _1496 = _1486 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1498 = _1494 * _1490;
        float _1500 = _1496 * _1498;
        float _1502 = _1472 * _1498;
        float _1504 = fma(_1476, _1500, _1136);
        float _1506 = fma(_1482, _1500, _1128);
        float _1508 = fma(_1496, _1502, _1146);
        _1458 = _1506;
        _1460 = _1504;
        _1462 = _1508;
    }
    float _1510 = _1458;
    float _1512 = _1460;
    float _1514 = _1462;
    float _1516 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1518 = _1510 + _1516;
    float _1520 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1522 = _1512 + _1520;
    float _1524 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1526 = _1514 + _1524;
    float _1528 = _1518 * _1518;
    float _1530 = fma(_1522, _1522, _1528);
    float _1532 = fma(_1526, _1526, _1530);
    float _1534 = rsqrt(_1532);
    float _1536 = _1534 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1538 = _1522 * _1536;
    float _1540 = _1526 * _1536;
    float _1542 = _1538 * _1538;
    float _1544 = _1540 * _1540;
    float _1546 = _1542 + _1544;
    float _1548 = sqrt(_1546);
    bool _1550 = _1548 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1552 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1554 = _1548 + _1552;
    float _1556 = _1526;
    float _1558 = _1530;
    float _1560 = _1554;
    float _1562 = _1538;
    if (_1550)
    {
        float _1564 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1556 = _1564;
    }
    float _1566 = _1556;
    if (_1550)
    {
        float _1568 = rsqrt(_1546);
        _1558 = _1568;
    }
    float _1570 = _1558;
    float _1572 = _1570;
    if (_1550)
    {
        float _1574 = _1554 * _1566;
        _1560 = _1574;
    }
    float _1576 = _1560;
    if (_1550)
    {
        float _1578 = _1576 * 0.15915493667125701904296875;
        _1464 = _1578;
    }
    float _1580 = _1464;
    float _1582 = _1534;
    float _1584 = _1580;
    if (_1550)
    {
        float _1586 = _1580 * 6.283185482025146484375;
        float _1588 = sin(_1586);
        _1582 = _1588;
    }
    float _1590 = _1582;
    float _1592 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1594 = precise::max(0.0, _1592);
    float _1596 = _1364;
    float _1598 = _1594;
    float _1600 = _1592;
    if (_1550)
    {
        float _1602 = _1580 * 6.283185482025146484375;
        float _1604 = cos(_1602);
        _1596 = _1604;
    }
    float _1606 = _1596;
    float _1608 = -_1536;
    float _1610 = -_1594;
    float _1612 = fma(_1518, _1608, _1610);
    if (!_1550)
    {
        _1598 = _1540;
    }
    float _1614 = _1598;
    float _1616 = _1614;
    if (_1550)
    {
        float _1618 = _1612 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1600 = _1618;
    }
    float _1620 = _1600;
    float _1622 = sqrt(_1532);
    float _1624 = _1590;
    float _1626 = _1620;
    if (_1550)
    {
        float _1628 = fma(_1590, _1620, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1624 = _1628;
    }
    float _1630 = _1624;
    float _1632 = _1630;
    if (_1550)
    {
        float _1634 = _1606 + (-1.0);
        _1626 = _1634;
    }
    float _1636 = _1626;
    float _1638 = _1636;
    if (_1550)
    {
        float _1640 = _1570 * _1630;
        _1114 = _1640;
    }
    float _1642 = _1114;
    if (!_1550)
    {
        _1572 = _1612;
    }
    float _1644 = _1572;
    float _1646 = _1644;
    if (_1550)
    {
        float _1648 = _1636 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1584 = _1648;
    }
    float _1650 = _1584;
    if (_1550)
    {
        float _1652 = _1538 * _1642;
        _1562 = _1652;
    }
    float _1654 = _1562;
    if (!_1550)
    {
        _1632 = _1542;
    }
    float _1656 = _1632;
    float _1658 = _1656;
    if (_1550)
    {
        float _1660 = _1540 * _1642;
        _1616 = _1660;
    }
    float _1662 = _1616;
    if (_1550)
    {
        float _1664 = fma(_1612, _1606, _1650);
        _1646 = _1664;
    }
    float _1666 = _1646;
    if (_1550)
    {
        float _1668 = _1654 * _1654;
        _1658 = _1668;
    }
    float _1670 = _1658;
    if (!_1550)
    {
        _1638 = _1544;
    }
    float _1672 = _1638;
    float _1674 = _1672;
    if (_1550)
    {
        float _1676 = _1662 * _1662;
        _1674 = _1676;
    }
    float _1678 = _1674;
    float _1680 = fma(_1666, _1666, _1670);
    float _1682 = _1510 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1684 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1686 = _1680 + _1678;
    float _1688 = _1510 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1690 = fma(_1512, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1682);
    float _1692 = _1510 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1694 = rsqrt(_1686);
    float _1696 = fma(_1512, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1688);
    float _1698 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1700 = fma(_1622, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1698);
    float _1702 = precise::clamp(_1700, 0.0, 1.0);
    float _1704 = fma(_1512, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1692);
    float _1706 = _1510 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1708 = fma(_1514, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1696);
    float _1710 = -_1702;
    float _1712 = _1710 + 1.0;
    float _1714 = fma(_1514, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1704);
    float _1716 = fma(_1512, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1706);
    float _1718 = _1708 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1720 = fma(_1514, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1690);
    float _1722 = _1714 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1724 = abs(_1712);
    float _1726 = log2(_1724);
    float _1728 = _1718 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1730 = fma(_1514, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1716);
    float _1732 = _1720 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1734 = _1694 * _1654;
    float _1736 = fma(_1722, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1728);
    float _1738 = _1694 * _1666;
    float _1740 = _1694 * _1662;
    float _1742 = _1734 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1744 = _1732 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1746 = _1730 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1748 = fma(_1732, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1736);
    float _1750 = -_1742;
    float _1752 = fma(_1738, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1750);
    float _1754 = -_1744;
    float _1756 = fma(_1754, _1684, 1.0);
    float _1758 = _1718 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1760 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1748);
    float _1762 = -_1740;
    float _1764 = fma(_1762, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1752);
    float _1766 = _1726 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1768 = _1718 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1770 = log2(_1756);
    float _1772 = fma(_1764, -0.5, 0.5);
    float _1774 = fma(_1722, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1758);
    float _1776 = fma(_1764, 0.5, 0.5);
    float _1778 = _1738 + 1.0;
    float _1780 = fma(_1732, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1774);
    float _1782 = fma(_1776, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1784 = exp2(_1766);
    float _1786 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1780);
    float _1788 = fma(_1776, _1782, -0.212114393711090087890625);
    float _1790 = fma(_1776, _1788, 1.570728778839111328125);
    float _1792 = 1.0 / _1760;
    float _1794 = fma(_1722, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1768);
    float _1796 = _1770 * 0.693147182464599609375;
    float _1798 = fma(_1732, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1794);
    float _1800 = sqrt(_1772);
    float _1802 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1798);
    float _1804 = -_1738;
    float _1806 = fma(_1784, _1778, _1804);
    float _1808 = fma(_1806, 0.5, 0.5);
    float _1810 = _1786 * _1792;
    float _1812 = _1802 * _1792;
    float _1814 = _1796 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1816 = fma(_1810, 0.5, 0.5);
    float _1818 = fma(_1812, -0.5, 0.5);
    float _1820 = _1800 * 0.636619746685028076171875;
    float3 _4760 = float3(_1816, _1818, _1814);
    float _1822 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4760, float3(0.0), isnan(_4760)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4760, float3(0.0), isnan(_4760)), level(0.0)).x;
    float _1824 = -_1790;
    float _1826 = fma(_1820, _1824, 1.0);
    float3 _4776 = float3(_1816, _1818, _1814);
    float4 _1829 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4776, float3(0.0), isnan(_4776)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4776, float3(0.0), isnan(_4776)), level(0.0)).xyzw;
    float _1831 = _1829.x;
    float _1833 = _1829.y;
    float _1835 = _1829.z;
    float _1837 = _1829.w;
    float2 _4793 = float2(_1826, _1808);
    float3 _1841 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4793, float2(0.0), isnan(_4793)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4793, float2(0.0), isnan(_4793)), level(0.0)).xyz;
    float _1843 = _1841.x;
    float _1845 = _1841.y;
    float _1847 = _1841.z;
    float _1849 = _1128 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1851 = _1128 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1853 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1855 = isnan(0.5);
    bool _1857 = _1853 || _1855;
    bool _1859 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1861 = _1857 || _1859;
    float _1863 = fma(_1136, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1849);
    float _1865 = fma(_1136, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1851);
    float _1867 = fma(_1146, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1863);
    float _1869 = fma(_1146, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1865);
    float _1871 = _1867 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1873 = _1869 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1875 = _1726 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    if (!_1861)
    {
        _1220 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1877 = _1220;
    float _1879 = 1.0 / _1871;
    float _1881 = _1873 + _1871;
    float _1883 = _1718 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1885 = fma(_1722, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1883);
    float _1887 = exp2(_1875);
    float _1889 = fma(_1732, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1885);
    float _1891 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1889);
    float _1893 = _1881 * _1879;
    float _1895 = _1893 * 0.5;
    float _1897 = _1879;
    float _1899 = _1895;
    float _1901 = _1877;
    if (!_1861)
    {
        _1897 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1903 = _1897;
    out.gl_Position.x = _1786;
    out.gl_Position.y = _1802;
    out.gl_Position.z = _1891;
    out.gl_Position.w = _1760;
    float _1905 = _1903;
    if (!_1861)
    {
        float _1907 = -_1877;
        float _1909 = fma(_1895, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1907);
        _1899 = _1909;
    }
    float _1911 = _1899;
    if (_1861)
    {
        _1901 = 1.0;
    }
    float _1913 = _1901;
    float _1915 = _1913;
    if (!_1861)
    {
        float _1917 = -_1903;
        float _1919 = _1917 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _257 = _1919;
    }
    float _1921 = _257;
    float _1923 = _1911;
    if (!_1861)
    {
        float _1925 = 1.0 / _1911;
        _1923 = _1925;
    }
    float _1927 = _1923;
    float _1929 = _1921;
    if (!_1861)
    {
        float _1931 = 1.0 / _1921;
        _1929 = _1931;
    }
    float _1933 = _1929;
    if (!_1861)
    {
        float _1935 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1937 = -_1903;
        float _1939 = fma(_1927, _1935, _1937);
        _1905 = _1939;
    }
    float _1941 = _1905;
    if (!_1861)
    {
        float _1943 = _1941 * _1933;
        float _1945 = precise::clamp(_1943, 0.0, 1.0);
        _1915 = _1945;
    }
    float _1947 = _1915;
    float _1949 = _1947 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1951 = _1947 > 0.0;
    bool _1953 = isnan(_1947);
    bool _1955 = _1951 || _1953;
    bool _1957 = isnan(0.0);
    bool _1959 = _1955 || _1957;
    float _1961 = _253 * _1949;
    float _1963 = -_1887;
    float _1965 = _1963 + 1.0;
    float _1967 = _1891 + _1760;
    float _1969 = _1961 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1971 = _1965 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1973 = _1967 * 0.5;
    out.m_45.x = _1969;
    out.m_70.z = _1973;
    out.m_70.w = _1760;
    float _1975 = _1971 * _1822;
    float _1977 = -_1971;
    float _1979 = _1977 + 1.0;
    float _1981 = _1837 * _1975;
    float _1983 = _1847 * _1975;
    float _1985 = fma(_1843, _1981, _1831);
    float _1987 = fma(_1845, _1981, _1833);
    float _1989 = _1837 * _1979;
    float _1991 = fma(_1837, _1983, _1835);
    out.m_72.x = _1985;
    out.m_72.y = _1987;
    out.m_72.z = _1991;
    out.m_72.w = _1989;
    if (_1959)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _1993 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1993;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _513 = false;
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
        float _2050 = as_type<float>(_107);
        out.gl_Position.z = _2050;
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
        float _2119 = as_type<float>(_145);
        out.gl_Position.z = _2119;
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
    bool _193 = !_179;
    int _195 = _193 ? 0 : 1;
    bool _197 = !_187;
    int _199 = _197 ? 0 : 1;
    int _201 = abs(_195);
    float _203 = -_169;
    float _205 = _157 + _203;
    int _207 = abs(_199);
    float _209 = -_205;
    float _211 = fma(_209, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _213 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _215 = float(_201);
    float _217 = fma(_191, 0.5, 0.5);
    bool _219 = !_183;
    int _221 = _219 ? 0 : 1;
    float _223 = abs(_211);
    float _225 = _215 * _223;
    int _227 = abs(_221);
    float _229 = -_217;
    float _231 = fma(_229, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _233 = _205 < 0.5;
    float _235 = float(_233);
    float _237 = float(_207);
    float _239 = float(_227);
    float _241 = -_235;
    float _243 = fma(_241, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _245 = !_161;
    float _247 = _245 ? (-0.5) : 0.5;
    float _249 = fma(_237, _231, _225);
    float _251 = abs(_243);
    float _253 = fma(_239, _251, _249);
    bool _255 = !_213;
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
    float _291 = _283 + _289;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _295 = _283 + _293;
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _299 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _297;
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _303 = _301 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _307 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _305;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _311 = _309 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _313 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _315 = isnan(_283);
    bool _317 = _313 || _315;
    bool _319 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _321 = _317 || _319;
    float _323 = float(_321);
    float _325 = 1.0 / _299;
    bool _327 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _329 = 1.0 / _303;
    float _331 = 1.0 / _307;
    float _333 = _291 * _325;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _337 = _283 + _335;
    float _339 = 1.0 / _311;
    float _341 = _287 * _329;
    bool _343 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _345 = isnan(_283);
    bool _347 = _343 || _345;
    bool _349 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _351 = _347 || _349;
    float _353 = float(_351);
    bool _355 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _357 = isnan(_283);
    bool _359 = _355 || _357;
    bool _361 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _363 = _359 || _361;
    float _365 = float(_363);
    float _367 = _295 * _331;
    float _369 = -_323;
    float _371 = _369 + 1.0;
    float _373 = -_353;
    float _375 = _373 + 1.0;
    float _377 = _353 * _371;
    bool _379 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _381 = isnan(_283);
    bool _383 = _379 || _381;
    bool _385 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _387 = _383 || _385;
    float _389 = float(_387);
    float _391 = _365 * _375;
    float _393 = _337 * _339;
    float _395 = -_365;
    float _397 = _395 + 1.0;
    bool _399 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _401 = isnan(_283);
    bool _403 = _399 || _401;
    bool _405 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _407 = _403 || _405;
    float _409 = float(_407);
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _413 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _411;
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _417 = _415 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _421 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _419;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _425 = _423 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _427 = _389 * _397;
    float _429 = -_389;
    float _431 = _429 + 1.0;
    float _433 = fma(_421, _333, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _435 = fma(_413, _333, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _437 = -_409;
    float _439 = _437 + 1.0;
    float _441 = _409 * _431;
    float _443 = fma(_425, _341, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _445 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _447 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _445;
    float _449 = fma(_417, _341, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _451 = _433 * _441;
    float _453 = _435 * _441;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _457 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _455;
    float _459 = fma(_447, _367, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _461 = fma(_439, (*spvDescriptorSet0.vp_c9)._m0[143].x, _451);
    float _463 = fma(_439, (*spvDescriptorSet0.vp_c9)._m0[143].y, _453);
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _467 = _465 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _469 = fma(_457, _367, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _471 = fma(_443, _427, _461);
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _475 = _473 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _477 = fma(_449, _427, _463);
    float _479 = fma(_467, _393, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _481 = fma(_459, _391, _471);
    float _483 = fma(_475, _393, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _485 = fma(_469, _391, _477);
    float _487 = fma(_479, _377, _481);
    float _489 = fma(_483, _377, _485);
    float _491 = fma(_323, (*spvDescriptorSet0.vp_c9)._m0[147].x, _487);
    float _493 = fma(_323, (*spvDescriptorSet0.vp_c9)._m0[147].y, _489);
    bool _495 = !_327;
    float _511;
    if (!_495)
    {
        float _497 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _499 = _147 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _501 = fma(_499, (*spvDescriptorSet0.vp_c9)._m0[11].y, _125);
        float _503 = _501 * _497;
        float _505 = floor(_503);
        float _507 = -_505;
        float _509 = _503 + _507;
        _511 = _509;
        _513 = true;
    }
    else
    {
        float _515 = float(_91);
        float _517 = 1.0 / _515;
        float _519 = _125 * _517;
        _511 = _519;
    }
    _513 = false;
    float _521 = _511;
    float _523 = in.m_42.x;
    float _525 = in.m_42.y;
    float _527 = in.m_42.z;
    float _529 = _147 * 2.0;
    float _531 = in.m_54.x;
    float _533 = in.m_54.y;
    float _535 = in.m_54.z;
    float _537 = in.m_54.w;
    float _539 = floor(_529);
    float _541 = in.m_56.x;
    float _543 = in.m_56.y;
    float _545 = in.m_56.z;
    float _547 = in.m_56.w;
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _551 = _549 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _553 = in.m_58.x;
    float _555 = in.m_58.y;
    float _557 = in.m_58.z;
    float _559 = in.m_58.w;
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _563 = _561 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _565 = in.m_49.y;
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _569 = _567 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _571 = 1.0 / _563;
    int _573 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _575 = _573 != 0;
    int _577 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _579 = _577 != 0;
    int _581 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _583 = _581 != 0;
    float _585 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _587 = _585 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _589 = _539 > 0.0;
    bool _591 = _539 >= 0.0;
    bool _593 = isnan(_539);
    bool _595 = _591 || _593;
    bool _597 = isnan(0.0);
    bool _599 = _595 || _597;
    float _601 = 1.0 / _551;
    int _603 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _605 = _603 != 0;
    float _607 = _525 * _533;
    int _609 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _611 = _609 != 0;
    int _613 = _599 ? 0 : 1;
    float _615 = fma(_523, _531, _607);
    float _617 = _525 * _543;
    float _619 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _621 = 1.0 / _569;
    float _623 = _525 * _555;
    float _625 = fma(_523, _541, _617);
    float _627 = _619 * _147;
    float _629 = fma(_523, _553, _623);
    float _631 = _565 * 2.0;
    float _633 = in.m_49.z;
    float _635 = 1.0 / _587;
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _639 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _637;
    float _641 = fma(_527, _535, _615);
    float _643 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _645 = _643 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _647 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _649 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _647;
    float _651 = _639 * _571;
    float _653 = fma(_527, _545, _625);
    float _655 = _645 * _601;
    float _657 = trunc(_627);
    int _659 = int(_657);
    float _661 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _663 = _661 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _665 = _649 * _621;
    float _667 = _147 + _565;
    float _669 = fma(_527, _557, _629);
    int _671 = ~_613;
    int _673 = _671 + 1;
    int _675 = _673 + 1;
    float _677 = _667 + (-1.0);
    float _679 = floor(_631);
    float _681 = _663 * _635;
    int _683 = _675;
    if (!_589)
    {
        int _685 = ~_613;
        int _687 = _685 + 1;
        _683 = _687;
    }
    int _689 = _683;
    float _691 = fma(_677, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _693 = _669 + _559;
    bool _695 = _521 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _697 = isnan(_521);
    bool _699 = _695 || _697;
    bool _701 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _703 = _699 || _701;
    float _705 = float(_703);
    float _707 = _633 * 2.0;
    int _709 = _659 << 4;
    int _711 = _709 + 1968;
    float _713 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _715 = log2(_713);
    float _717 = _565 + _633;
    float _719 = _641 + _537;
    int _721 = _711 + 8;
    uint _724 = uint(int(uint(_721) >> uint(2)));
    uint _726 = uint(int(uint(int(_724)) >> uint(2)));
    int _728 = int(_724) & 3;
    float _730 = (*spvDescriptorSet0.vp_c9)._m0[int(_726)][_728];
    float _732 = _717 + (-1.0);
    bool _734 = _679 >= 0.0;
    bool _736 = isnan(_679);
    bool _738 = _734 || _736;
    bool _740 = isnan(0.0);
    bool _742 = _738 || _740;
    float _744 = floor(_707);
    float _746 = fma(_732, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _748 = _742 ? 0 : 1;
    uint _750 = uint(int(uint(_711) >> uint(2)));
    uint _752 = uint(int(uint(int(_750)) >> uint(2)));
    int _754 = int(_750) & 3;
    float _756 = (*spvDescriptorSet0.vp_c9)._m0[int(_752)][_754];
    int _758 = int(_750) + 1;
    uint _760 = uint(int(uint(_758) >> uint(2)));
    int _762 = _758 & 3;
    float _764 = (*spvDescriptorSet0.vp_c9)._m0[int(_760)][_762];
    bool _766 = _679 > 0.0;
    int _768 = ~_748;
    int _770 = _768 + 1;
    int _772 = _770 + 1;
    float _774 = _715 * _125;
    float _776 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _778 = _521 + _776;
    float _780 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _782 = _521 + _780;
    float _784 = exp2(_774);
    float _786 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _788 = _521 + _786;
    float _790 = fma(_655, _782, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _792 = _744 > 0.0;
    float _794 = fma(_651, _788, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    int _796 = _772;
    if (!_766)
    {
        int _798 = ~_748;
        int _800 = _798 + 1;
        _796 = _800;
    }
    int _802 = _796;
    float _804 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _806 = _521 + _804;
    bool _808 = _744 >= 0.0;
    bool _810 = isnan(_744);
    bool _812 = _808 || _810;
    bool _814 = isnan(0.0);
    bool _816 = _812 || _814;
    float _818 = fma(_665, _778, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _820 = _521 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _822 = isnan(_521);
    bool _824 = _820 || _822;
    bool _826 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _828 = _824 || _826;
    float _830 = float(_828);
    float _832 = fma(_681, _806, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    bool _834 = _521 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _836 = isnan(_521);
    bool _838 = _834 || _836;
    bool _840 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _842 = _838 || _840;
    float _844 = float(_842);
    float _846 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _848 = _521 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _850 = isnan(_521);
    bool _852 = _848 || _850;
    bool _854 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _856 = _852 || _854;
    float _858 = float(_856);
    float _860 = -_830;
    float _862 = _860 + 1.0;
    int _864 = _816 ? 0 : 1;
    float _866 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _868 = 1.0 + _866;
    float _870 = -_784;
    float _872 = _870 + 1.0;
    float _874 = _844 * _862;
    float _876 = -_844;
    float _878 = _876 + 1.0;
    float _880 = -_705;
    float _882 = _880 + 1.0;
    int _884 = ~_864;
    int _886 = _884 + 1;
    int _888 = _886 + 1;
    float _890 = 1.0 / _868;
    float _892 = _705 * _878;
    bool _894 = _521 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _896 = isnan(_521);
    bool _898 = _894 || _896;
    bool _900 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _902 = _898 || _900;
    float _904 = float(_902);
    float _906 = _858 * _882;
    float _908 = -_858;
    float _910 = _908 + 1.0;
    int _912 = _888;
    if (!_792)
    {
        int _914 = ~_864;
        int _916 = _914 + 1;
        _912 = _916;
    }
    int _918 = _912;
    float _920 = _653 + _547;
    bool _922 = _147 > 0.5;
    float _924 = _904 * _910;
    float _926 = -_904;
    float _928 = _926 + 1.0;
    float _930 = _730 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _932 = -_247;
    int _934 = _922 ? as_type<int>(_932) : as_type<int>(_247);
    float _936 = _818 * _924;
    bool _938 = _565 > 0.5;
    float _940 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _942 = !_579;
    int _944 = _942 ? 0 : 1;
    float _946 = fma(_928, (*spvDescriptorSet0.vp_c9)._m0[115].x, _936);
    float _948 = -_175;
    int _950 = _938 ? as_type<int>(_948) : as_type<int>(_175);
    float _952 = _756 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _954 = !_605;
    float _956 = _954 ? _247 : as_type<float>(_934);
    float _958 = fma(_790, _906, _946);
    int _960 = abs(_944);
    float _962 = _764 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _964 = !_611;
    float _966 = _964 ? _175 : as_type<float>(_950);
    float _968 = _956 + 0.5;
    float _970 = float(_689);
    float _972 = fma(_794, _892, _958);
    float _974 = float(_960);
    float _976 = -_966;
    float _978 = _976 + 0.5;
    bool _980 = !_575;
    int _982 = _980 ? 0 : 1;
    float _984 = _968 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _986 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _988 = isnan(0.0);
    bool _990 = _986 || _988;
    bool _992 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _994 = _990 || _992;
    float _996 = _974 * _970;
    int _998 = abs(_982);
    float _1000 = _978 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1002 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1004 = _719 + _1002;
    float _1006 = _984 * _846;
    float _1008 = _1000 * _940;
    float _1010 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1012 = _693 + _1010;
    float _1014 = _1004 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1016 = float(_998);
    float _1018 = _952 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1020 = float(_918);
    float _1022 = _962 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1024 = _930 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1026 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1028 = _920 + _1026;
    float _1030 = fma(_1012, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1014);
    float _1032 = fma(_832, _874, _972);
    float _1034 = _994 ? _872 : 0.0;
    float _1036 = _1016 * _1020;
    bool _1038 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1040 = isnan(1.0);
    bool _1042 = _1038 || _1040;
    bool _1044 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1046 = _1042 || _1044;
    out.m_60.x = _1018;
    out.m_60.y = _1022;
    out.m_60.z = _1024;
    float _1048 = fma(_1028, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1030);
    float _1050 = fma(_830, (*spvDescriptorSet0.vp_c9)._m0[119].x, _1032);
    float _1052 = _1004 * _1004;
    float _1054 = in.m_62.x;
    float _1056 = in.m_62.y;
    float _1058 = in.m_62.z;
    float _1060 = _996 * (-2.0);
    bool _1062 = _1048 >= 0.0;
    float _1064 = fma(_1012, _1012, _1052);
    float _1066 = fma(_1028, _1028, _1064);
    float _1068 = _1036;
    if (_1046)
    {
        float _1070 = _1034 * _890;
        _129 = _1070;
    }
    float _1072 = _129;
    float _1074 = fma(_746, _1060, _746);
    float _1076 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1078 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1080 = rsqrt(_1066);
    float _1082 = _1036 * (-2.0);
    if (_1062)
    {
        _1068 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1084 = _1068;
    float _1086 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1088 = _1076 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1090 = _1078 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1092 = _1050 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1094 = _1086 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1096 = as_type<int>(_1084);
    if (_1062)
    {
        float _1098 = _1084 * 5.0;
        _1096 = as_type<int>(_1098);
    }
    int _1100 = _1096;
    float _1102 = _565 + (-0.5);
    out.m_64.x = _1006;
    out.m_64.y = _1008;
    float _1104 = fma(_1060, _1056, _1056);
    float _1106 = _147 + (-0.5);
    float _1108 = fma(_1082, _1054, _1054);
    out.m_66.x = _1094;
    out.m_66.y = _1088;
    out.m_66.z = _1090;
    out.m_66.w = _1092;
    float _1110 = fma(_1102, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1104);
    float _1112 = _1004 * _1080;
    float _1114 = _1112;
    if (_1062)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3594 = as_type<float>(_1100);
        out.gl_Position.z = _3594;
    }
    float _1116 = fma(_691, _1082, _691);
    float _1118 = fma(_1106, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1108);
    if (_1062)
    {
        out.m_45.x = 0.0;
    }
    bool _1120 = !_583;
    int _1122 = _1120 ? 0 : 1;
    float _1124 = _1012 * _1080;
    if (_1062)
    {
        return out;
    }
    float _1126 = -_1112;
    float _1128 = fma(_1126, (*spvDescriptorSet0.vp_c9)._m0[18].w, _719);
    float _1130 = fma(_1074, _1072, _1110);
    float _1132 = _1028 * _1080;
    float _1134 = -_1124;
    float _1136 = fma(_1134, (*spvDescriptorSet0.vp_c9)._m0[18].w, _693);
    float _1138 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1140 = _1128 + _1138;
    int _1142 = abs(_1122);
    float _1144 = -_1132;
    float _1146 = fma(_1144, (*spvDescriptorSet0.vp_c9)._m0[18].w, _920);
    float _1148 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1150 = _1136 + _1148;
    float _1152 = _1140 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1154 = float(_1142);
    float _1156 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1158 = _1146 + _1156;
    float _1160 = fma(_1150, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1152);
    float _1162 = float(_802);
    float _1164 = fma(_1116, _1072, _1118);
    float _1166 = -_1124;
    float _1168 = fma(_1166, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1012);
    float _1170 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1160);
    float _1172 = -_1132;
    float _1174 = fma(_1172, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1028);
    float _1176 = _1154 * _1162;
    float _1178 = _147 + _633;
    float _1180 = _1164 * 0.15915493667125701904296875;
    bool _1182 = _1170 >= 0.0;
    float _1184 = _1176 * (-2.0);
    float _1186 = in.m_68.x;
    float _1188 = in.m_68.y;
    float _1190 = _1178 + (-1.0);
    float _1192 = -_1112;
    float _1194 = fma(_1192, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1004);
    float _1196 = _1130 * 0.15915493667125701904296875;
    float _1198 = _1180 * 6.283185482025146484375;
    float _1200 = sin(_1198);
    float _1202 = fma(_1190, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1204 = fma(_1184, _1058, _1058);
    float _1206 = _633 + (-0.5);
    float _1208 = _1194 * _1194;
    float _1210 = fma(_1202, _1184, _1202);
    float _1212 = fma(_1206, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1204);
    float _1214 = fma(_1168, _1168, _1208);
    float _1216 = _1168;
    int _1218 = as_type<int>(_1210);
    float _1220 = _1146;
    if (_1182)
    {
        _1216 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1222 = _1216;
    float _1224 = _1196 * 6.283185482025146484375;
    float _1226 = sin(_1224);
    float _1228 = fma(_1210, _1072, _1212);
    float _1230 = fma(_1174, _1174, _1214);
    if (_1182)
    {
        float _1232 = _1222 * 5.0;
        _1218 = as_type<int>(_1232);
    }
    int _1234 = _1218;
    float _1236 = _1228 * 0.15915493667125701904296875;
    if (_1182)
    {
        out.m_45.x = 0.0;
    }
    float _1238 = _1196 * 6.283185482025146484375;
    float _1240 = cos(_1238);
    float _1242 = _493 * _1188;
    if (_1182)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3812 = as_type<float>(_1234);
        out.gl_Position.z = _3812;
    }
    float _1244 = _1180 * 6.283185482025146484375;
    float _1246 = cos(_1244);
    float _1248 = sqrt(_1230);
    float _1250 = _1236 * 6.283185482025146484375;
    float _1252 = sin(_1250);
    if (_1182)
    {
        return out;
    }
    float _1254 = _253 * _1242;
    float _1256 = _1236 * 6.283185482025146484375;
    float _1258 = cos(_1256);
    float _1260 = _1080 * _1248;
    float _1262 = _491 * _1186;
    float _1264 = _1254 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1266 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _175);
    float _1268 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _247);
    float _1270 = _1260 * _1264;
    float _1272 = _253 * _1262;
    bool _1274 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1276 = isnan(0.5);
    bool _1278 = _1274 || _1276;
    bool _1280 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1282 = _1278 || _1280;
    float _1284 = _1266 * _1270;
    float _1286 = _1272 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1288 = _1200 * _1226;
    float _1290 = _1246 * _1240;
    float _1292 = _1260 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1294 = _1292 * 0.5;
    float _1296 = _1260 * _1286;
    float _1298 = _1258 * _1284;
    float _1300 = _1246 * _1226;
    float _1302 = _1226 * _1258;
    float _1304 = _1240 * _1258;
    float _1306 = fma(_1252, _1290, _1288);
    float _1308 = _1268 * _1296;
    float _1310 = _1246 * _1298;
    float _1312 = _1200 * _1240;
    float _1314 = -_1284;
    float _1316 = _1252 * _1314;
    float _1318 = fma(_1252, _1288, _1290);
    float _1320 = fma(_1306, _1308, _1310);
    float _1322 = -_1312;
    float _1324 = fma(_1252, _1300, _1322);
    float _1326 = -_1300;
    float _1328 = fma(_1252, _1312, _1326);
    float _1330 = _1200 * _1298;
    float _1332 = fma(_1304, _1308, _1316);
    float _1334 = fma(_1324, _1294, _1320);
    float _1336 = fma(_1328, _1308, _1330);
    float _1338 = fma(_1302, _1294, _1332);
    float _1340 = _1334 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1342 = fma(_1318, _1294, _1336);
    float _1344 = _1334 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1346 = fma(_1338, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1340);
    float _1348 = fma(_1338, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1344);
    float _1350 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1346);
    float _1352 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1348);
    float _1354 = _1350 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1356 = _1352 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1358 = _920 + _1354;
    float _1360 = _693 + _1356;
    float _1362 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1364 = _1358 + _1362;
    float _1366 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1368 = _1360 + _1366;
    float _1370 = _1364 * _1364;
    float _1372 = fma(_1368, _1368, _1370);
    float _1374 = _1334 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1376 = sqrt(_1372);
    float _1378 = fma(_1338, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1374);
    float _1380 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1378);
    float _1382 = _1380 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1384 = _719 + _1382;
    bool _1386 = _1376 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1388 = _1382;
    float _1390 = _1308;
    float _1392 = _1360;
    if (!_1386)
    {
        _1388 = _1358;
    }
    float _1394 = _1388;
    float _1396 = _1394;
    if (!_1386)
    {
        _1390 = _1384;
    }
    float _1398 = _1390;
    bool _1400 = !_1386;
    float _1402 = _1398;
    if (!_1400)
    {
        float _1404 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1406 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1408 = _1376 + _1406;
        float _1410 = rsqrt(_1372);
        float _1412 = _1408 * _1404;
        float _1414 = _1384 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1416 = _1412 * 0.15915493667125701904296875;
        float _1418 = _1416 * 6.283185482025146484375;
        float _1420 = cos(_1418);
        float _1422 = _1416 * 6.283185482025146484375;
        float _1424 = sin(_1422);
        float _1426 = _1420 + (-1.0);
        float _1428 = _1426 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1430 = fma(_1424, _1414, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1432 = fma(_1384, _1420, _1428);
        float _1434 = _1410 * _1430;
        float _1436 = fma(_1368, _1434, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1438 = fma(_1364, _1434, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1392 = _1436;
        _1402 = _1432;
        _1396 = _1438;
    }
    float _1440 = _1392;
    float _1442 = _1402;
    float _1444 = _1396;
    float _1446 = -_1124;
    float _1448 = fma(_1446, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1440);
    float _1450 = -_1112;
    float _1452 = fma(_1450, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1442);
    float _1454 = -_1132;
    float _1456 = fma(_1454, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1444);
    float _1458 = _1452;
    float _1460 = _1448;
    float _1462 = _1456;
    float _1464 = _1442;
    if (!_1282)
    {
        float _1466 = _1140 * _1140;
        float _1468 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1470 = -_920;
        float _1472 = _1470 + _1444;
        float _1474 = -_693;
        float _1476 = _1474 + _1440;
        float _1478 = fma(_1150, _1150, _1466);
        float _1480 = -_719;
        float _1482 = _1480 + _1442;
        float _1484 = fma(_1158, _1158, _1478);
        float _1486 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1488 = sqrt(_1484);
        float _1490 = 1.0 / _1260;
        float _1492 = precise::min(_1488, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1494 = _1492 * _1468;
        float _1496 = _1486 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1498 = _1494 * _1490;
        float _1500 = _1496 * _1498;
        float _1502 = _1472 * _1498;
        float _1504 = fma(_1476, _1500, _1136);
        float _1506 = fma(_1482, _1500, _1128);
        float _1508 = fma(_1496, _1502, _1146);
        _1458 = _1506;
        _1460 = _1504;
        _1462 = _1508;
    }
    float _1510 = _1458;
    float _1512 = _1460;
    float _1514 = _1462;
    float _1516 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1518 = _1510 + _1516;
    float _1520 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1522 = _1512 + _1520;
    float _1524 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1526 = _1514 + _1524;
    float _1528 = _1518 * _1518;
    float _1530 = fma(_1522, _1522, _1528);
    float _1532 = fma(_1526, _1526, _1530);
    float _1534 = rsqrt(_1532);
    float _1536 = _1534 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1538 = _1522 * _1536;
    float _1540 = _1526 * _1536;
    float _1542 = _1538 * _1538;
    float _1544 = _1540 * _1540;
    float _1546 = _1542 + _1544;
    float _1548 = sqrt(_1546);
    bool _1550 = _1548 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1552 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1554 = _1548 + _1552;
    float _1556 = _1526;
    float _1558 = _1530;
    float _1560 = _1554;
    float _1562 = _1538;
    if (_1550)
    {
        float _1564 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1556 = _1564;
    }
    float _1566 = _1556;
    if (_1550)
    {
        float _1568 = rsqrt(_1546);
        _1558 = _1568;
    }
    float _1570 = _1558;
    float _1572 = _1570;
    if (_1550)
    {
        float _1574 = _1554 * _1566;
        _1560 = _1574;
    }
    float _1576 = _1560;
    if (_1550)
    {
        float _1578 = _1576 * 0.15915493667125701904296875;
        _1464 = _1578;
    }
    float _1580 = _1464;
    float _1582 = _1534;
    float _1584 = _1580;
    if (_1550)
    {
        float _1586 = _1580 * 6.283185482025146484375;
        float _1588 = sin(_1586);
        _1582 = _1588;
    }
    float _1590 = _1582;
    float _1592 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1594 = precise::max(0.0, _1592);
    float _1596 = _1364;
    float _1598 = _1594;
    float _1600 = _1592;
    if (_1550)
    {
        float _1602 = _1580 * 6.283185482025146484375;
        float _1604 = cos(_1602);
        _1596 = _1604;
    }
    float _1606 = _1596;
    float _1608 = -_1536;
    float _1610 = -_1594;
    float _1612 = fma(_1518, _1608, _1610);
    if (!_1550)
    {
        _1598 = _1540;
    }
    float _1614 = _1598;
    float _1616 = _1614;
    if (_1550)
    {
        float _1618 = _1612 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1600 = _1618;
    }
    float _1620 = _1600;
    float _1622 = sqrt(_1532);
    float _1624 = _1590;
    float _1626 = _1620;
    if (_1550)
    {
        float _1628 = fma(_1590, _1620, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1624 = _1628;
    }
    float _1630 = _1624;
    float _1632 = _1630;
    if (_1550)
    {
        float _1634 = _1606 + (-1.0);
        _1626 = _1634;
    }
    float _1636 = _1626;
    float _1638 = _1636;
    if (_1550)
    {
        float _1640 = _1570 * _1630;
        _1114 = _1640;
    }
    float _1642 = _1114;
    if (!_1550)
    {
        _1572 = _1612;
    }
    float _1644 = _1572;
    float _1646 = _1644;
    if (_1550)
    {
        float _1648 = _1636 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1584 = _1648;
    }
    float _1650 = _1584;
    if (_1550)
    {
        float _1652 = _1538 * _1642;
        _1562 = _1652;
    }
    float _1654 = _1562;
    if (!_1550)
    {
        _1632 = _1542;
    }
    float _1656 = _1632;
    float _1658 = _1656;
    if (_1550)
    {
        float _1660 = _1540 * _1642;
        _1616 = _1660;
    }
    float _1662 = _1616;
    if (_1550)
    {
        float _1664 = fma(_1612, _1606, _1650);
        _1646 = _1664;
    }
    float _1666 = _1646;
    if (_1550)
    {
        float _1668 = _1654 * _1654;
        _1658 = _1668;
    }
    float _1670 = _1658;
    if (!_1550)
    {
        _1638 = _1544;
    }
    float _1672 = _1638;
    float _1674 = _1672;
    if (_1550)
    {
        float _1676 = _1662 * _1662;
        _1674 = _1676;
    }
    float _1678 = _1674;
    float _1680 = fma(_1666, _1666, _1670);
    float _1682 = _1510 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1684 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1686 = _1680 + _1678;
    float _1688 = _1510 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1690 = fma(_1512, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1682);
    float _1692 = _1510 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1694 = rsqrt(_1686);
    float _1696 = fma(_1512, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1688);
    float _1698 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1700 = fma(_1622, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1698);
    float _1702 = precise::clamp(_1700, 0.0, 1.0);
    float _1704 = fma(_1512, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1692);
    float _1706 = _1510 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1708 = fma(_1514, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1696);
    float _1710 = -_1702;
    float _1712 = _1710 + 1.0;
    float _1714 = fma(_1514, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1704);
    float _1716 = fma(_1512, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1706);
    float _1718 = _1708 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1720 = fma(_1514, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1690);
    float _1722 = _1714 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1724 = abs(_1712);
    float _1726 = log2(_1724);
    float _1728 = _1718 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1730 = fma(_1514, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1716);
    float _1732 = _1720 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1734 = _1694 * _1654;
    float _1736 = fma(_1722, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1728);
    float _1738 = _1694 * _1666;
    float _1740 = _1694 * _1662;
    float _1742 = _1734 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1744 = _1732 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1746 = _1730 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1748 = fma(_1732, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1736);
    float _1750 = -_1742;
    float _1752 = fma(_1738, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1750);
    float _1754 = -_1744;
    float _1756 = fma(_1754, _1684, 1.0);
    float _1758 = _1718 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1760 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1748);
    float _1762 = -_1740;
    float _1764 = fma(_1762, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1752);
    float _1766 = _1726 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1768 = _1718 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1770 = log2(_1756);
    float _1772 = fma(_1764, -0.5, 0.5);
    float _1774 = fma(_1722, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1758);
    float _1776 = fma(_1764, 0.5, 0.5);
    float _1778 = _1738 + 1.0;
    float _1780 = fma(_1732, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1774);
    float _1782 = fma(_1776, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1784 = exp2(_1766);
    float _1786 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1780);
    float _1788 = fma(_1776, _1782, -0.212114393711090087890625);
    float _1790 = fma(_1776, _1788, 1.570728778839111328125);
    float _1792 = 1.0 / _1760;
    float _1794 = fma(_1722, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1768);
    float _1796 = _1770 * 0.693147182464599609375;
    float _1798 = fma(_1732, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1794);
    float _1800 = sqrt(_1772);
    float _1802 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1798);
    float _1804 = -_1738;
    float _1806 = fma(_1784, _1778, _1804);
    float _1808 = fma(_1806, 0.5, 0.5);
    float _1810 = _1786 * _1792;
    float _1812 = _1802 * _1792;
    float _1814 = _1796 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1816 = fma(_1810, 0.5, 0.5);
    float _1818 = fma(_1812, -0.5, 0.5);
    float _1820 = _1800 * 0.636619746685028076171875;
    float3 _4760 = float3(_1816, _1818, _1814);
    float _1822 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4760, float3(0.0), isnan(_4760)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4760, float3(0.0), isnan(_4760)), level(0.0)).x;
    float _1824 = -_1790;
    float _1826 = fma(_1820, _1824, 1.0);
    float3 _4776 = float3(_1816, _1818, _1814);
    float4 _1829 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4776, float3(0.0), isnan(_4776)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4776, float3(0.0), isnan(_4776)), level(0.0)).xyzw;
    float _1831 = _1829.x;
    float _1833 = _1829.y;
    float _1835 = _1829.z;
    float _1837 = _1829.w;
    float2 _4793 = float2(_1826, _1808);
    float3 _1841 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4793, float2(0.0), isnan(_4793)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4793, float2(0.0), isnan(_4793)), level(0.0)).xyz;
    float _1843 = _1841.x;
    float _1845 = _1841.y;
    float _1847 = _1841.z;
    float _1849 = _1128 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1851 = _1128 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1853 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1855 = isnan(0.5);
    bool _1857 = _1853 || _1855;
    bool _1859 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1861 = _1857 || _1859;
    float _1863 = fma(_1136, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1849);
    float _1865 = fma(_1136, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1851);
    float _1867 = fma(_1146, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1863);
    float _1869 = fma(_1146, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1865);
    float _1871 = _1867 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1873 = _1869 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1875 = _1726 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    if (!_1861)
    {
        _1220 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1877 = _1220;
    float _1879 = 1.0 / _1871;
    float _1881 = _1873 + _1871;
    float _1883 = _1718 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1885 = fma(_1722, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1883);
    float _1887 = exp2(_1875);
    float _1889 = fma(_1732, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1885);
    float _1891 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1889);
    float _1893 = _1881 * _1879;
    float _1895 = _1893 * 0.5;
    float _1897 = _1879;
    float _1899 = _1895;
    float _1901 = _1877;
    if (!_1861)
    {
        _1897 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1903 = _1897;
    out.gl_Position.x = _1786;
    out.gl_Position.y = _1802;
    out.gl_Position.z = _1891;
    out.gl_Position.w = _1760;
    float _1905 = _1903;
    if (!_1861)
    {
        float _1907 = -_1877;
        float _1909 = fma(_1895, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1907);
        _1899 = _1909;
    }
    float _1911 = _1899;
    if (_1861)
    {
        _1901 = 1.0;
    }
    float _1913 = _1901;
    float _1915 = _1913;
    if (!_1861)
    {
        float _1917 = -_1903;
        float _1919 = _1917 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _257 = _1919;
    }
    float _1921 = _257;
    float _1923 = _1911;
    if (!_1861)
    {
        float _1925 = 1.0 / _1911;
        _1923 = _1925;
    }
    float _1927 = _1923;
    float _1929 = _1921;
    if (!_1861)
    {
        float _1931 = 1.0 / _1921;
        _1929 = _1931;
    }
    float _1933 = _1929;
    if (!_1861)
    {
        float _1935 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1937 = -_1903;
        float _1939 = fma(_1927, _1935, _1937);
        _1905 = _1939;
    }
    float _1941 = _1905;
    if (!_1861)
    {
        float _1943 = _1941 * _1933;
        float _1945 = precise::clamp(_1943, 0.0, 1.0);
        _1915 = _1945;
    }
    float _1947 = _1915;
    float _1949 = _1947 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1951 = _1947 > 0.0;
    bool _1953 = isnan(_1947);
    bool _1955 = _1951 || _1953;
    bool _1957 = isnan(0.0);
    bool _1959 = _1955 || _1957;
    float _1961 = _253 * _1949;
    float _1963 = -_1887;
    float _1965 = _1963 + 1.0;
    float _1967 = _1891 + _1760;
    float _1969 = _1961 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1971 = _1965 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1973 = _1967 * 0.5;
    out.m_45.x = _1969;
    out.m_70.z = _1973;
    out.m_70.w = _1760;
    float _1975 = _1971 * _1822;
    float _1977 = -_1971;
    float _1979 = _1977 + 1.0;
    float _1981 = _1837 * _1975;
    float _1983 = _1847 * _1975;
    float _1985 = fma(_1843, _1981, _1831);
    float _1987 = fma(_1845, _1981, _1833);
    float _1989 = _1837 * _1979;
    float _1991 = fma(_1837, _1983, _1835);
    out.m_72.x = _1985;
    out.m_72.y = _1987;
    out.m_72.z = _1991;
    out.m_72.w = _1989;
    if (_1959)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _1993 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1993;
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
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _513 = false;
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
        float _2050 = as_type<float>(_107);
        out.gl_Position.z = _2050;
    }
    if (!_95)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _2119 = as_type<float>(_145);
        out.gl_Position.z = _2119;
    }
    if (_139)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    bool _193 = !_179;
    int _195 = _193 ? 0 : 1;
    bool _197 = !_187;
    int _199 = _197 ? 0 : 1;
    int _201 = abs(_195);
    float _203 = -_169;
    float _205 = _157 + _203;
    int _207 = abs(_199);
    float _209 = -_205;
    float _211 = fma(_209, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _213 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _215 = float(_201);
    float _217 = fma(_191, 0.5, 0.5);
    bool _219 = !_183;
    int _221 = _219 ? 0 : 1;
    float _223 = abs(_211);
    float _225 = _215 * _223;
    int _227 = abs(_221);
    float _229 = -_217;
    float _231 = fma(_229, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _233 = _205 < 0.5;
    float _235 = float(_233);
    float _237 = float(_207);
    float _239 = float(_227);
    float _241 = -_235;
    float _243 = fma(_241, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _245 = !_161;
    float _247 = _245 ? (-0.5) : 0.5;
    float _249 = fma(_237, _231, _225);
    float _251 = abs(_243);
    float _253 = fma(_239, _251, _249);
    bool _255 = !_213;
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
    float _291 = _283 + _289;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _295 = _283 + _293;
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _299 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _297;
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _303 = _301 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _307 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _305;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _311 = _309 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _313 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _315 = isnan(_283);
    bool _317 = _313 || _315;
    bool _319 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _321 = _317 || _319;
    float _323 = float(_321);
    float _325 = 1.0 / _299;
    bool _327 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _329 = 1.0 / _303;
    float _331 = 1.0 / _307;
    float _333 = _291 * _325;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _337 = _283 + _335;
    float _339 = 1.0 / _311;
    float _341 = _287 * _329;
    bool _343 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _345 = isnan(_283);
    bool _347 = _343 || _345;
    bool _349 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _351 = _347 || _349;
    float _353 = float(_351);
    bool _355 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _357 = isnan(_283);
    bool _359 = _355 || _357;
    bool _361 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _363 = _359 || _361;
    float _365 = float(_363);
    float _367 = _295 * _331;
    float _369 = -_323;
    float _371 = _369 + 1.0;
    float _373 = -_353;
    float _375 = _373 + 1.0;
    float _377 = _353 * _371;
    bool _379 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _381 = isnan(_283);
    bool _383 = _379 || _381;
    bool _385 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _387 = _383 || _385;
    float _389 = float(_387);
    float _391 = _365 * _375;
    float _393 = _337 * _339;
    float _395 = -_365;
    float _397 = _395 + 1.0;
    bool _399 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _401 = isnan(_283);
    bool _403 = _399 || _401;
    bool _405 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _407 = _403 || _405;
    float _409 = float(_407);
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _413 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _411;
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _417 = _415 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _421 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _419;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _425 = _423 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _427 = _389 * _397;
    float _429 = -_389;
    float _431 = _429 + 1.0;
    float _433 = fma(_421, _333, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _435 = fma(_413, _333, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _437 = -_409;
    float _439 = _437 + 1.0;
    float _441 = _409 * _431;
    float _443 = fma(_425, _341, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _445 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _447 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _445;
    float _449 = fma(_417, _341, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _451 = _433 * _441;
    float _453 = _435 * _441;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _457 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _455;
    float _459 = fma(_447, _367, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _461 = fma(_439, (*spvDescriptorSet0.vp_c9)._m0[143].x, _451);
    float _463 = fma(_439, (*spvDescriptorSet0.vp_c9)._m0[143].y, _453);
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _467 = _465 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _469 = fma(_457, _367, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _471 = fma(_443, _427, _461);
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _475 = _473 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _477 = fma(_449, _427, _463);
    float _479 = fma(_467, _393, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _481 = fma(_459, _391, _471);
    float _483 = fma(_475, _393, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _485 = fma(_469, _391, _477);
    float _487 = fma(_479, _377, _481);
    float _489 = fma(_483, _377, _485);
    float _491 = fma(_323, (*spvDescriptorSet0.vp_c9)._m0[147].x, _487);
    float _493 = fma(_323, (*spvDescriptorSet0.vp_c9)._m0[147].y, _489);
    bool _495 = !_327;
    float _511;
    if (!_495)
    {
        float _497 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _499 = _147 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _501 = fma(_499, (*spvDescriptorSet0.vp_c9)._m0[11].y, _125);
        float _503 = _501 * _497;
        float _505 = floor(_503);
        float _507 = -_505;
        float _509 = _503 + _507;
        _511 = _509;
        _513 = true;
    }
    else
    {
        float _515 = float(_91);
        float _517 = 1.0 / _515;
        float _519 = _125 * _517;
        _511 = _519;
    }
    _513 = false;
    float _521 = _511;
    float _523 = in.m_42.x;
    float _525 = in.m_42.y;
    float _527 = in.m_42.z;
    float _529 = _147 * 2.0;
    float _531 = in.m_54.x;
    float _533 = in.m_54.y;
    float _535 = in.m_54.z;
    float _537 = in.m_54.w;
    float _539 = floor(_529);
    float _541 = in.m_56.x;
    float _543 = in.m_56.y;
    float _545 = in.m_56.z;
    float _547 = in.m_56.w;
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _551 = _549 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _553 = in.m_58.x;
    float _555 = in.m_58.y;
    float _557 = in.m_58.z;
    float _559 = in.m_58.w;
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _563 = _561 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _565 = in.m_49.y;
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _569 = _567 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _571 = 1.0 / _563;
    int _573 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _575 = _573 != 0;
    int _577 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _579 = _577 != 0;
    int _581 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _583 = _581 != 0;
    float _585 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _587 = _585 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _589 = _539 > 0.0;
    bool _591 = _539 >= 0.0;
    bool _593 = isnan(_539);
    bool _595 = _591 || _593;
    bool _597 = isnan(0.0);
    bool _599 = _595 || _597;
    float _601 = 1.0 / _551;
    int _603 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _605 = _603 != 0;
    float _607 = _525 * _533;
    int _609 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _611 = _609 != 0;
    int _613 = _599 ? 0 : 1;
    float _615 = fma(_523, _531, _607);
    float _617 = _525 * _543;
    float _619 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _621 = 1.0 / _569;
    float _623 = _525 * _555;
    float _625 = fma(_523, _541, _617);
    float _627 = _619 * _147;
    float _629 = fma(_523, _553, _623);
    float _631 = _565 * 2.0;
    float _633 = in.m_49.z;
    float _635 = 1.0 / _587;
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _639 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _637;
    float _641 = fma(_527, _535, _615);
    float _643 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _645 = _643 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _647 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _649 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _647;
    float _651 = _639 * _571;
    float _653 = fma(_527, _545, _625);
    float _655 = _645 * _601;
    float _657 = trunc(_627);
    int _659 = int(_657);
    float _661 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _663 = _661 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _665 = _649 * _621;
    float _667 = _147 + _565;
    float _669 = fma(_527, _557, _629);
    int _671 = ~_613;
    int _673 = _671 + 1;
    int _675 = _673 + 1;
    float _677 = _667 + (-1.0);
    float _679 = floor(_631);
    float _681 = _663 * _635;
    int _683 = _675;
    if (!_589)
    {
        int _685 = ~_613;
        int _687 = _685 + 1;
        _683 = _687;
    }
    int _689 = _683;
    float _691 = fma(_677, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _693 = _669 + _559;
    bool _695 = _521 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _697 = isnan(_521);
    bool _699 = _695 || _697;
    bool _701 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _703 = _699 || _701;
    float _705 = float(_703);
    float _707 = _633 * 2.0;
    int _709 = _659 << 4;
    int _711 = _709 + 1968;
    float _713 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _715 = log2(_713);
    float _717 = _565 + _633;
    float _719 = _641 + _537;
    int _721 = _711 + 8;
    uint _724 = uint(int(uint(_721) >> uint(2)));
    uint _726 = uint(int(uint(int(_724)) >> uint(2)));
    int _728 = int(_724) & 3;
    float _730 = (*spvDescriptorSet0.vp_c9)._m0[int(_726)][_728];
    float _732 = _717 + (-1.0);
    bool _734 = _679 >= 0.0;
    bool _736 = isnan(_679);
    bool _738 = _734 || _736;
    bool _740 = isnan(0.0);
    bool _742 = _738 || _740;
    float _744 = floor(_707);
    float _746 = fma(_732, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _748 = _742 ? 0 : 1;
    uint _750 = uint(int(uint(_711) >> uint(2)));
    uint _752 = uint(int(uint(int(_750)) >> uint(2)));
    int _754 = int(_750) & 3;
    float _756 = (*spvDescriptorSet0.vp_c9)._m0[int(_752)][_754];
    int _758 = int(_750) + 1;
    uint _760 = uint(int(uint(_758) >> uint(2)));
    int _762 = _758 & 3;
    float _764 = (*spvDescriptorSet0.vp_c9)._m0[int(_760)][_762];
    bool _766 = _679 > 0.0;
    int _768 = ~_748;
    int _770 = _768 + 1;
    int _772 = _770 + 1;
    float _774 = _715 * _125;
    float _776 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _778 = _521 + _776;
    float _780 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _782 = _521 + _780;
    float _784 = exp2(_774);
    float _786 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _788 = _521 + _786;
    float _790 = fma(_655, _782, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _792 = _744 > 0.0;
    float _794 = fma(_651, _788, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    int _796 = _772;
    if (!_766)
    {
        int _798 = ~_748;
        int _800 = _798 + 1;
        _796 = _800;
    }
    int _802 = _796;
    float _804 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _806 = _521 + _804;
    bool _808 = _744 >= 0.0;
    bool _810 = isnan(_744);
    bool _812 = _808 || _810;
    bool _814 = isnan(0.0);
    bool _816 = _812 || _814;
    float _818 = fma(_665, _778, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _820 = _521 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _822 = isnan(_521);
    bool _824 = _820 || _822;
    bool _826 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _828 = _824 || _826;
    float _830 = float(_828);
    float _832 = fma(_681, _806, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    bool _834 = _521 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _836 = isnan(_521);
    bool _838 = _834 || _836;
    bool _840 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _842 = _838 || _840;
    float _844 = float(_842);
    float _846 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _848 = _521 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _850 = isnan(_521);
    bool _852 = _848 || _850;
    bool _854 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _856 = _852 || _854;
    float _858 = float(_856);
    float _860 = -_830;
    float _862 = _860 + 1.0;
    int _864 = _816 ? 0 : 1;
    float _866 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _868 = 1.0 + _866;
    float _870 = -_784;
    float _872 = _870 + 1.0;
    float _874 = _844 * _862;
    float _876 = -_844;
    float _878 = _876 + 1.0;
    float _880 = -_705;
    float _882 = _880 + 1.0;
    int _884 = ~_864;
    int _886 = _884 + 1;
    int _888 = _886 + 1;
    float _890 = 1.0 / _868;
    float _892 = _705 * _878;
    bool _894 = _521 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _896 = isnan(_521);
    bool _898 = _894 || _896;
    bool _900 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _902 = _898 || _900;
    float _904 = float(_902);
    float _906 = _858 * _882;
    float _908 = -_858;
    float _910 = _908 + 1.0;
    int _912 = _888;
    if (!_792)
    {
        int _914 = ~_864;
        int _916 = _914 + 1;
        _912 = _916;
    }
    int _918 = _912;
    float _920 = _653 + _547;
    bool _922 = _147 > 0.5;
    float _924 = _904 * _910;
    float _926 = -_904;
    float _928 = _926 + 1.0;
    float _930 = _730 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _932 = -_247;
    int _934 = _922 ? as_type<int>(_932) : as_type<int>(_247);
    float _936 = _818 * _924;
    bool _938 = _565 > 0.5;
    float _940 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _942 = !_579;
    int _944 = _942 ? 0 : 1;
    float _946 = fma(_928, (*spvDescriptorSet0.vp_c9)._m0[115].x, _936);
    float _948 = -_175;
    int _950 = _938 ? as_type<int>(_948) : as_type<int>(_175);
    float _952 = _756 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _954 = !_605;
    float _956 = _954 ? _247 : as_type<float>(_934);
    float _958 = fma(_790, _906, _946);
    int _960 = abs(_944);
    float _962 = _764 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _964 = !_611;
    float _966 = _964 ? _175 : as_type<float>(_950);
    float _968 = _956 + 0.5;
    float _970 = float(_689);
    float _972 = fma(_794, _892, _958);
    float _974 = float(_960);
    float _976 = -_966;
    float _978 = _976 + 0.5;
    bool _980 = !_575;
    int _982 = _980 ? 0 : 1;
    float _984 = _968 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _986 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _988 = isnan(0.0);
    bool _990 = _986 || _988;
    bool _992 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _994 = _990 || _992;
    float _996 = _974 * _970;
    int _998 = abs(_982);
    float _1000 = _978 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1002 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1004 = _719 + _1002;
    float _1006 = _984 * _846;
    float _1008 = _1000 * _940;
    float _1010 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1012 = _693 + _1010;
    float _1014 = _1004 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1016 = float(_998);
    float _1018 = _952 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1020 = float(_918);
    float _1022 = _962 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1024 = _930 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1026 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1028 = _920 + _1026;
    float _1030 = fma(_1012, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1014);
    float _1032 = fma(_832, _874, _972);
    float _1034 = _994 ? _872 : 0.0;
    float _1036 = _1016 * _1020;
    bool _1038 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1040 = isnan(1.0);
    bool _1042 = _1038 || _1040;
    bool _1044 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1046 = _1042 || _1044;
    out.m_60.x = _1018;
    out.m_60.y = _1022;
    out.m_60.z = _1024;
    float _1048 = fma(_1028, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1030);
    float _1050 = fma(_830, (*spvDescriptorSet0.vp_c9)._m0[119].x, _1032);
    float _1052 = _1004 * _1004;
    float _1054 = in.m_62.x;
    float _1056 = in.m_62.y;
    float _1058 = in.m_62.z;
    float _1060 = _996 * (-2.0);
    bool _1062 = _1048 >= 0.0;
    float _1064 = fma(_1012, _1012, _1052);
    float _1066 = fma(_1028, _1028, _1064);
    float _1068 = _1036;
    if (_1046)
    {
        float _1070 = _1034 * _890;
        _129 = _1070;
    }
    float _1072 = _129;
    float _1074 = fma(_746, _1060, _746);
    float _1076 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1078 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1080 = rsqrt(_1066);
    float _1082 = _1036 * (-2.0);
    if (_1062)
    {
        _1068 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1084 = _1068;
    float _1086 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1088 = _1076 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1090 = _1078 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1092 = _1050 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1094 = _1086 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1096 = as_type<int>(_1084);
    if (_1062)
    {
        float _1098 = _1084 * 5.0;
        _1096 = as_type<int>(_1098);
    }
    int _1100 = _1096;
    float _1102 = _565 + (-0.5);
    out.m_64.x = _1006;
    out.m_64.y = _1008;
    float _1104 = fma(_1060, _1056, _1056);
    float _1106 = _147 + (-0.5);
    float _1108 = fma(_1082, _1054, _1054);
    out.m_66.x = _1094;
    out.m_66.y = _1088;
    out.m_66.z = _1090;
    out.m_66.w = _1092;
    float _1110 = fma(_1102, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1104);
    float _1112 = _1004 * _1080;
    float _1114 = _1112;
    if (_1062)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3594 = as_type<float>(_1100);
        out.gl_Position.z = _3594;
    }
    float _1116 = fma(_691, _1082, _691);
    float _1118 = fma(_1106, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1108);
    if (_1062)
    {
        out.m_45.x = 0.0;
    }
    bool _1120 = !_583;
    int _1122 = _1120 ? 0 : 1;
    float _1124 = _1012 * _1080;
    if (_1062)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1126 = -_1112;
    float _1128 = fma(_1126, (*spvDescriptorSet0.vp_c9)._m0[18].w, _719);
    float _1130 = fma(_1074, _1072, _1110);
    float _1132 = _1028 * _1080;
    float _1134 = -_1124;
    float _1136 = fma(_1134, (*spvDescriptorSet0.vp_c9)._m0[18].w, _693);
    float _1138 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1140 = _1128 + _1138;
    int _1142 = abs(_1122);
    float _1144 = -_1132;
    float _1146 = fma(_1144, (*spvDescriptorSet0.vp_c9)._m0[18].w, _920);
    float _1148 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1150 = _1136 + _1148;
    float _1152 = _1140 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1154 = float(_1142);
    float _1156 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1158 = _1146 + _1156;
    float _1160 = fma(_1150, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1152);
    float _1162 = float(_802);
    float _1164 = fma(_1116, _1072, _1118);
    float _1166 = -_1124;
    float _1168 = fma(_1166, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1012);
    float _1170 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1160);
    float _1172 = -_1132;
    float _1174 = fma(_1172, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1028);
    float _1176 = _1154 * _1162;
    float _1178 = _147 + _633;
    float _1180 = _1164 * 0.15915493667125701904296875;
    bool _1182 = _1170 >= 0.0;
    float _1184 = _1176 * (-2.0);
    float _1186 = in.m_68.x;
    float _1188 = in.m_68.y;
    float _1190 = _1178 + (-1.0);
    float _1192 = -_1112;
    float _1194 = fma(_1192, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1004);
    float _1196 = _1130 * 0.15915493667125701904296875;
    float _1198 = _1180 * 6.283185482025146484375;
    float _1200 = sin(_1198);
    float _1202 = fma(_1190, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1204 = fma(_1184, _1058, _1058);
    float _1206 = _633 + (-0.5);
    float _1208 = _1194 * _1194;
    float _1210 = fma(_1202, _1184, _1202);
    float _1212 = fma(_1206, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1204);
    float _1214 = fma(_1168, _1168, _1208);
    float _1216 = _1168;
    int _1218 = as_type<int>(_1210);
    float _1220 = _1146;
    if (_1182)
    {
        _1216 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1222 = _1216;
    float _1224 = _1196 * 6.283185482025146484375;
    float _1226 = sin(_1224);
    float _1228 = fma(_1210, _1072, _1212);
    float _1230 = fma(_1174, _1174, _1214);
    if (_1182)
    {
        float _1232 = _1222 * 5.0;
        _1218 = as_type<int>(_1232);
    }
    int _1234 = _1218;
    float _1236 = _1228 * 0.15915493667125701904296875;
    if (_1182)
    {
        out.m_45.x = 0.0;
    }
    float _1238 = _1196 * 6.283185482025146484375;
    float _1240 = cos(_1238);
    float _1242 = _493 * _1188;
    if (_1182)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3812 = as_type<float>(_1234);
        out.gl_Position.z = _3812;
    }
    float _1244 = _1180 * 6.283185482025146484375;
    float _1246 = cos(_1244);
    float _1248 = sqrt(_1230);
    float _1250 = _1236 * 6.283185482025146484375;
    float _1252 = sin(_1250);
    if (_1182)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1254 = _253 * _1242;
    float _1256 = _1236 * 6.283185482025146484375;
    float _1258 = cos(_1256);
    float _1260 = _1080 * _1248;
    float _1262 = _491 * _1186;
    float _1264 = _1254 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1266 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _175);
    float _1268 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _247);
    float _1270 = _1260 * _1264;
    float _1272 = _253 * _1262;
    bool _1274 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1276 = isnan(0.5);
    bool _1278 = _1274 || _1276;
    bool _1280 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1282 = _1278 || _1280;
    float _1284 = _1266 * _1270;
    float _1286 = _1272 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1288 = _1200 * _1226;
    float _1290 = _1246 * _1240;
    float _1292 = _1260 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1294 = _1292 * 0.5;
    float _1296 = _1260 * _1286;
    float _1298 = _1258 * _1284;
    float _1300 = _1246 * _1226;
    float _1302 = _1226 * _1258;
    float _1304 = _1240 * _1258;
    float _1306 = fma(_1252, _1290, _1288);
    float _1308 = _1268 * _1296;
    float _1310 = _1246 * _1298;
    float _1312 = _1200 * _1240;
    float _1314 = -_1284;
    float _1316 = _1252 * _1314;
    float _1318 = fma(_1252, _1288, _1290);
    float _1320 = fma(_1306, _1308, _1310);
    float _1322 = -_1312;
    float _1324 = fma(_1252, _1300, _1322);
    float _1326 = -_1300;
    float _1328 = fma(_1252, _1312, _1326);
    float _1330 = _1200 * _1298;
    float _1332 = fma(_1304, _1308, _1316);
    float _1334 = fma(_1324, _1294, _1320);
    float _1336 = fma(_1328, _1308, _1330);
    float _1338 = fma(_1302, _1294, _1332);
    float _1340 = _1334 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1342 = fma(_1318, _1294, _1336);
    float _1344 = _1334 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1346 = fma(_1338, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1340);
    float _1348 = fma(_1338, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1344);
    float _1350 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1346);
    float _1352 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1348);
    float _1354 = _1350 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1356 = _1352 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1358 = _920 + _1354;
    float _1360 = _693 + _1356;
    float _1362 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1364 = _1358 + _1362;
    float _1366 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1368 = _1360 + _1366;
    float _1370 = _1364 * _1364;
    float _1372 = fma(_1368, _1368, _1370);
    float _1374 = _1334 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1376 = sqrt(_1372);
    float _1378 = fma(_1338, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1374);
    float _1380 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1378);
    float _1382 = _1380 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1384 = _719 + _1382;
    bool _1386 = _1376 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1388 = _1382;
    float _1390 = _1308;
    float _1392 = _1360;
    if (!_1386)
    {
        _1388 = _1358;
    }
    float _1394 = _1388;
    float _1396 = _1394;
    if (!_1386)
    {
        _1390 = _1384;
    }
    float _1398 = _1390;
    bool _1400 = !_1386;
    float _1402 = _1398;
    if (!_1400)
    {
        float _1404 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1406 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1408 = _1376 + _1406;
        float _1410 = rsqrt(_1372);
        float _1412 = _1408 * _1404;
        float _1414 = _1384 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1416 = _1412 * 0.15915493667125701904296875;
        float _1418 = _1416 * 6.283185482025146484375;
        float _1420 = cos(_1418);
        float _1422 = _1416 * 6.283185482025146484375;
        float _1424 = sin(_1422);
        float _1426 = _1420 + (-1.0);
        float _1428 = _1426 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1430 = fma(_1424, _1414, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1432 = fma(_1384, _1420, _1428);
        float _1434 = _1410 * _1430;
        float _1436 = fma(_1368, _1434, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1438 = fma(_1364, _1434, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1392 = _1436;
        _1402 = _1432;
        _1396 = _1438;
    }
    float _1440 = _1392;
    float _1442 = _1402;
    float _1444 = _1396;
    float _1446 = -_1124;
    float _1448 = fma(_1446, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1440);
    float _1450 = -_1112;
    float _1452 = fma(_1450, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1442);
    float _1454 = -_1132;
    float _1456 = fma(_1454, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1444);
    float _1458 = _1452;
    float _1460 = _1448;
    float _1462 = _1456;
    float _1464 = _1442;
    if (!_1282)
    {
        float _1466 = _1140 * _1140;
        float _1468 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1470 = -_920;
        float _1472 = _1470 + _1444;
        float _1474 = -_693;
        float _1476 = _1474 + _1440;
        float _1478 = fma(_1150, _1150, _1466);
        float _1480 = -_719;
        float _1482 = _1480 + _1442;
        float _1484 = fma(_1158, _1158, _1478);
        float _1486 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1488 = sqrt(_1484);
        float _1490 = 1.0 / _1260;
        float _1492 = precise::min(_1488, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1494 = _1492 * _1468;
        float _1496 = _1486 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1498 = _1494 * _1490;
        float _1500 = _1496 * _1498;
        float _1502 = _1472 * _1498;
        float _1504 = fma(_1476, _1500, _1136);
        float _1506 = fma(_1482, _1500, _1128);
        float _1508 = fma(_1496, _1502, _1146);
        _1458 = _1506;
        _1460 = _1504;
        _1462 = _1508;
    }
    float _1510 = _1458;
    float _1512 = _1460;
    float _1514 = _1462;
    float _1516 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1518 = _1510 + _1516;
    float _1520 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1522 = _1512 + _1520;
    float _1524 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1526 = _1514 + _1524;
    float _1528 = _1518 * _1518;
    float _1530 = fma(_1522, _1522, _1528);
    float _1532 = fma(_1526, _1526, _1530);
    float _1534 = rsqrt(_1532);
    float _1536 = _1534 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1538 = _1522 * _1536;
    float _1540 = _1526 * _1536;
    float _1542 = _1538 * _1538;
    float _1544 = _1540 * _1540;
    float _1546 = _1542 + _1544;
    float _1548 = sqrt(_1546);
    bool _1550 = _1548 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1552 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1554 = _1548 + _1552;
    float _1556 = _1526;
    float _1558 = _1530;
    float _1560 = _1554;
    float _1562 = _1538;
    if (_1550)
    {
        float _1564 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1556 = _1564;
    }
    float _1566 = _1556;
    if (_1550)
    {
        float _1568 = rsqrt(_1546);
        _1558 = _1568;
    }
    float _1570 = _1558;
    float _1572 = _1570;
    if (_1550)
    {
        float _1574 = _1554 * _1566;
        _1560 = _1574;
    }
    float _1576 = _1560;
    if (_1550)
    {
        float _1578 = _1576 * 0.15915493667125701904296875;
        _1464 = _1578;
    }
    float _1580 = _1464;
    float _1582 = _1534;
    float _1584 = _1580;
    if (_1550)
    {
        float _1586 = _1580 * 6.283185482025146484375;
        float _1588 = sin(_1586);
        _1582 = _1588;
    }
    float _1590 = _1582;
    float _1592 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1594 = precise::max(0.0, _1592);
    float _1596 = _1364;
    float _1598 = _1594;
    float _1600 = _1592;
    if (_1550)
    {
        float _1602 = _1580 * 6.283185482025146484375;
        float _1604 = cos(_1602);
        _1596 = _1604;
    }
    float _1606 = _1596;
    float _1608 = -_1536;
    float _1610 = -_1594;
    float _1612 = fma(_1518, _1608, _1610);
    if (!_1550)
    {
        _1598 = _1540;
    }
    float _1614 = _1598;
    float _1616 = _1614;
    if (_1550)
    {
        float _1618 = _1612 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1600 = _1618;
    }
    float _1620 = _1600;
    float _1622 = sqrt(_1532);
    float _1624 = _1590;
    float _1626 = _1620;
    if (_1550)
    {
        float _1628 = fma(_1590, _1620, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1624 = _1628;
    }
    float _1630 = _1624;
    float _1632 = _1630;
    if (_1550)
    {
        float _1634 = _1606 + (-1.0);
        _1626 = _1634;
    }
    float _1636 = _1626;
    float _1638 = _1636;
    if (_1550)
    {
        float _1640 = _1570 * _1630;
        _1114 = _1640;
    }
    float _1642 = _1114;
    if (!_1550)
    {
        _1572 = _1612;
    }
    float _1644 = _1572;
    float _1646 = _1644;
    if (_1550)
    {
        float _1648 = _1636 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1584 = _1648;
    }
    float _1650 = _1584;
    if (_1550)
    {
        float _1652 = _1538 * _1642;
        _1562 = _1652;
    }
    float _1654 = _1562;
    if (!_1550)
    {
        _1632 = _1542;
    }
    float _1656 = _1632;
    float _1658 = _1656;
    if (_1550)
    {
        float _1660 = _1540 * _1642;
        _1616 = _1660;
    }
    float _1662 = _1616;
    if (_1550)
    {
        float _1664 = fma(_1612, _1606, _1650);
        _1646 = _1664;
    }
    float _1666 = _1646;
    if (_1550)
    {
        float _1668 = _1654 * _1654;
        _1658 = _1668;
    }
    float _1670 = _1658;
    if (!_1550)
    {
        _1638 = _1544;
    }
    float _1672 = _1638;
    float _1674 = _1672;
    if (_1550)
    {
        float _1676 = _1662 * _1662;
        _1674 = _1676;
    }
    float _1678 = _1674;
    float _1680 = fma(_1666, _1666, _1670);
    float _1682 = _1510 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1684 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1686 = _1680 + _1678;
    float _1688 = _1510 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1690 = fma(_1512, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1682);
    float _1692 = _1510 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1694 = rsqrt(_1686);
    float _1696 = fma(_1512, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1688);
    float _1698 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1700 = fma(_1622, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1698);
    float _1702 = precise::clamp(_1700, 0.0, 1.0);
    float _1704 = fma(_1512, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1692);
    float _1706 = _1510 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1708 = fma(_1514, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1696);
    float _1710 = -_1702;
    float _1712 = _1710 + 1.0;
    float _1714 = fma(_1514, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1704);
    float _1716 = fma(_1512, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1706);
    float _1718 = _1708 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1720 = fma(_1514, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1690);
    float _1722 = _1714 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1724 = abs(_1712);
    float _1726 = log2(_1724);
    float _1728 = _1718 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1730 = fma(_1514, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1716);
    float _1732 = _1720 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1734 = _1694 * _1654;
    float _1736 = fma(_1722, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1728);
    float _1738 = _1694 * _1666;
    float _1740 = _1694 * _1662;
    float _1742 = _1734 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1744 = _1732 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1746 = _1730 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1748 = fma(_1732, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1736);
    float _1750 = -_1742;
    float _1752 = fma(_1738, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1750);
    float _1754 = -_1744;
    float _1756 = fma(_1754, _1684, 1.0);
    float _1758 = _1718 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1760 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1748);
    float _1762 = -_1740;
    float _1764 = fma(_1762, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1752);
    float _1766 = _1726 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1768 = _1718 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1770 = log2(_1756);
    float _1772 = fma(_1764, -0.5, 0.5);
    float _1774 = fma(_1722, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1758);
    float _1776 = fma(_1764, 0.5, 0.5);
    float _1778 = _1738 + 1.0;
    float _1780 = fma(_1732, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1774);
    float _1782 = fma(_1776, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1784 = exp2(_1766);
    float _1786 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1780);
    float _1788 = fma(_1776, _1782, -0.212114393711090087890625);
    float _1790 = fma(_1776, _1788, 1.570728778839111328125);
    float _1792 = 1.0 / _1760;
    float _1794 = fma(_1722, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1768);
    float _1796 = _1770 * 0.693147182464599609375;
    float _1798 = fma(_1732, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1794);
    float _1800 = sqrt(_1772);
    float _1802 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1798);
    float _1804 = -_1738;
    float _1806 = fma(_1784, _1778, _1804);
    float _1808 = fma(_1806, 0.5, 0.5);
    float _1810 = _1786 * _1792;
    float _1812 = _1802 * _1792;
    float _1814 = _1796 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1816 = fma(_1810, 0.5, 0.5);
    float _1818 = fma(_1812, -0.5, 0.5);
    float _1820 = _1800 * 0.636619746685028076171875;
    float3 _4760 = float3(_1816, _1818, _1814);
    float _1822 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4760, float3(0.0), isnan(_4760)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4760, float3(0.0), isnan(_4760)), level(0.0)).x;
    float _1824 = -_1790;
    float _1826 = fma(_1820, _1824, 1.0);
    float3 _4776 = float3(_1816, _1818, _1814);
    float4 _1829 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4776, float3(0.0), isnan(_4776)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4776, float3(0.0), isnan(_4776)), level(0.0)).xyzw;
    float _1831 = _1829.x;
    float _1833 = _1829.y;
    float _1835 = _1829.z;
    float _1837 = _1829.w;
    float2 _4793 = float2(_1826, _1808);
    float3 _1841 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4793, float2(0.0), isnan(_4793)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4793, float2(0.0), isnan(_4793)), level(0.0)).xyz;
    float _1843 = _1841.x;
    float _1845 = _1841.y;
    float _1847 = _1841.z;
    float _1849 = _1128 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1851 = _1128 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1853 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1855 = isnan(0.5);
    bool _1857 = _1853 || _1855;
    bool _1859 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1861 = _1857 || _1859;
    float _1863 = fma(_1136, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1849);
    float _1865 = fma(_1136, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1851);
    float _1867 = fma(_1146, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1863);
    float _1869 = fma(_1146, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1865);
    float _1871 = _1867 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1873 = _1869 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1875 = _1726 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    if (!_1861)
    {
        _1220 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1877 = _1220;
    float _1879 = 1.0 / _1871;
    float _1881 = _1873 + _1871;
    float _1883 = _1718 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1885 = fma(_1722, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1883);
    float _1887 = exp2(_1875);
    float _1889 = fma(_1732, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1885);
    float _1891 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1889);
    float _1893 = _1881 * _1879;
    float _1895 = _1893 * 0.5;
    float _1897 = _1879;
    float _1899 = _1895;
    float _1901 = _1877;
    if (!_1861)
    {
        _1897 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1903 = _1897;
    out.gl_Position.x = _1786;
    out.gl_Position.y = _1802;
    out.gl_Position.z = _1891;
    out.gl_Position.w = _1760;
    float _1905 = _1903;
    if (!_1861)
    {
        float _1907 = -_1877;
        float _1909 = fma(_1895, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1907);
        _1899 = _1909;
    }
    float _1911 = _1899;
    if (_1861)
    {
        _1901 = 1.0;
    }
    float _1913 = _1901;
    float _1915 = _1913;
    if (!_1861)
    {
        float _1917 = -_1903;
        float _1919 = _1917 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _257 = _1919;
    }
    float _1921 = _257;
    float _1923 = _1911;
    if (!_1861)
    {
        float _1925 = 1.0 / _1911;
        _1923 = _1925;
    }
    float _1927 = _1923;
    float _1929 = _1921;
    if (!_1861)
    {
        float _1931 = 1.0 / _1921;
        _1929 = _1931;
    }
    float _1933 = _1929;
    if (!_1861)
    {
        float _1935 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1937 = -_1903;
        float _1939 = fma(_1927, _1935, _1937);
        _1905 = _1939;
    }
    float _1941 = _1905;
    if (!_1861)
    {
        float _1943 = _1941 * _1933;
        float _1945 = precise::clamp(_1943, 0.0, 1.0);
        _1915 = _1945;
    }
    float _1947 = _1915;
    float _1949 = _1947 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1951 = _1947 > 0.0;
    bool _1953 = isnan(_1947);
    bool _1955 = _1951 || _1953;
    bool _1957 = isnan(0.0);
    bool _1959 = _1955 || _1957;
    float _1961 = _253 * _1949;
    float _1963 = -_1887;
    float _1965 = _1963 + 1.0;
    float _1967 = _1891 + _1760;
    float _1969 = _1961 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1971 = _1965 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1973 = _1967 * 0.5;
    out.m_45.x = _1969;
    out.m_70.z = _1973;
    out.m_70.w = _1760;
    float _1975 = _1971 * _1822;
    float _1977 = -_1971;
    float _1979 = _1977 + 1.0;
    float _1981 = _1837 * _1975;
    float _1983 = _1847 * _1975;
    float _1985 = fma(_1843, _1981, _1831);
    float _1987 = fma(_1845, _1981, _1833);
    float _1989 = _1837 * _1979;
    float _1991 = fma(_1837, _1983, _1835);
    out.m_72.x = _1985;
    out.m_72.y = _1987;
    out.m_72.z = _1991;
    out.m_72.w = _1989;
    if (_1959)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _1993 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1993;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

