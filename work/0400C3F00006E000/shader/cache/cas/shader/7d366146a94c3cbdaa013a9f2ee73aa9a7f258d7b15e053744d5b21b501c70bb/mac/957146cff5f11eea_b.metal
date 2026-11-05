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
    float4 m_60 [[user(locn0)]];
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
    float4 m_62 [[attribute(4)]];
    float4 m_42 [[attribute(5)]];
    float4 m_47 [[attribute(6)]];
    float4 m_49 [[attribute(7)]];
    float4 m_66 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
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
        float _1951 = as_type<float>(_107);
        out.gl_Position.z = _1951;
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
        float _2020 = as_type<float>(_145);
        out.gl_Position.z = _2020;
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
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _291 = _283 + _289;
    bool _293 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _295 = isnan(_283);
    bool _297 = _293 || _295;
    bool _299 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _301 = _297 || _299;
    float _303 = float(_301);
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _307 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _305;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _311 = _309 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _315 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _313;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _319 = _317 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _321 = 1.0 / _307;
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _325 = _283 + _323;
    bool _327 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _329 = 1.0 / _311;
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _333 = _283 + _331;
    float _335 = 1.0 / _315;
    float _337 = _325 * _321;
    float _339 = 1.0 / _319;
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
    float _367 = _291 * _335;
    float _369 = -_303;
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
    float _393 = _333 * _339;
    float _395 = -_365;
    float _397 = _395 + 1.0;
    float _399 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _401 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _399;
    bool _403 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _405 = isnan(_283);
    bool _407 = _403 || _405;
    bool _409 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _411 = _407 || _409;
    float _413 = float(_411);
    float _415 = _389 * _397;
    float _417 = -_389;
    float _419 = _417 + 1.0;
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _423 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _421;
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _427 = _425 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _429 = fma(_401, _337, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _431 = _413 * _419;
    float _433 = fma(_423, _337, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _437 = _435 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _439 = -_413;
    float _441 = _439 + 1.0;
    float _443 = _429 * _431;
    float _445 = _433 * _431;
    float _447 = fma(_437, _341, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _449 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _451 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _449;
    float _453 = fma(_441, (*spvDescriptorSet0.vp_c9)._m0[143].x, _443);
    float _455 = fma(_427, _341, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _457;
    float _461 = fma(_441, (*spvDescriptorSet0.vp_c9)._m0[143].y, _445);
    float _463 = fma(_451, _367, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _467 = _465 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _469 = fma(_447, _415, _453);
    float _471 = fma(_459, _367, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _475 = _473 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _477 = fma(_455, _415, _461);
    float _479 = fma(_467, _393, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _481 = fma(_463, _391, _469);
    float _483 = fma(_475, _393, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _485 = fma(_471, _391, _477);
    float _487 = fma(_479, _377, _481);
    float _489 = fma(_483, _377, _485);
    float _491 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[147].x, _487);
    float _493 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[147].y, _489);
    bool _495 = !_327;
    float _511;
    if (!_495)
    {
        float _497 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _499 = _147 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _501 = fma(_499, (*spvDescriptorSet0.vp_c9)._m0[11].z, _125);
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
    int _531 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _533 = _531 != 0;
    int _535 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _537 = _535 != 0;
    int _539 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _541 = _539 != 0;
    float _543 = in.m_54.x;
    float _545 = in.m_54.y;
    float _547 = in.m_54.z;
    bool _549 = _147 > 0.5;
    float _551 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _553 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _551;
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _557 = _555 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _559 = in.m_56.x;
    float _561 = in.m_56.y;
    float _563 = in.m_56.z;
    float _565 = floor(_529);
    float _567 = in.m_58.x;
    float _569 = in.m_58.y;
    float _571 = in.m_58.z;
    int _573 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _575 = _573 != 0;
    float _577 = in.m_49.z;
    float _579 = 1.0 / _553;
    int _581 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _583 = _581 != 0;
    float _585 = in.m_49.y;
    float _587 = 1.0 / _557;
    bool _589 = _565 > 0.0;
    float _591 = _525 * _545;
    bool _593 = _521 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _595 = isnan(_521);
    bool _597 = _593 || _595;
    bool _599 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _601 = _597 || _599;
    float _603 = float(_601);
    float _605 = _525 * _561;
    float _607 = fma(_523, _543, _591);
    float _609 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _611 = _525 * _569;
    float _613 = fma(_523, _559, _605);
    float _615 = fma(_527, _547, _607);
    float _617 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _619 = _521 + _617;
    float _621 = fma(_523, _567, _611);
    float _623 = fma(_527, _563, _613);
    float _625 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _627 = log2(_625);
    float _629 = _577 * 2.0;
    float _631 = fma(_527, _571, _621);
    float _633 = _585 * 2.0;
    float _635 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _637 = _521 + _635;
    float _639 = -_195;
    int _641 = _549 ? as_type<int>(_639) : as_type<int>(_195);
    float _643 = _619 * _587;
    bool _645 = _565 >= 0.0;
    bool _647 = isnan(_565);
    bool _649 = _645 || _647;
    bool _651 = isnan(0.0);
    bool _653 = _649 || _651;
    float _655 = floor(_629);
    float _657 = _637 * _579;
    float _659 = _147 + _585;
    float _661 = _585 + _577;
    int _663 = _653 ? 0 : 1;
    float _665 = _659 + (-1.0);
    float _667 = _627 * _125;
    float _669 = floor(_633);
    float _671 = _661 + (-1.0);
    bool _673 = _585 > 0.5;
    float _675 = _615 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _677 = _585 + (-0.5);
    float _679 = fma(_671, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _681 = !_575;
    float _683 = _681 ? _195 : as_type<float>(_641);
    float _685 = exp2(_667);
    float _687 = fma(_665, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _689 = ~_663;
    int _691 = _689 + 1;
    int _693 = _691 + 1;
    float _695 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _697 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _695;
    int _699 = _693;
    float _701 = _675;
    if (!_589)
    {
        int _703 = ~_663;
        int _705 = _703 + 1;
        _699 = _705;
    }
    int _707 = _699;
    float _709 = _683 + 0.5;
    bool _711 = _655 >= 0.0;
    bool _713 = isnan(_655);
    bool _715 = _711 || _713;
    bool _717 = isnan(0.0);
    bool _719 = _715 || _717;
    float _721 = fma(_697, _657, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _723 = _669 >= 0.0;
    bool _725 = isnan(_669);
    bool _727 = _723 || _725;
    bool _729 = isnan(0.0);
    bool _731 = _727 || _729;
    float _733 = _709 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _735 = _719 ? 0 : 1;
    bool _737 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _739 = isnan(0.0);
    bool _741 = _737 || _739;
    bool _743 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _745 = _741 || _743;
    int _747 = _731 ? 0 : 1;
    float _749 = -_685;
    float _751 = _749 + 1.0;
    bool _753 = _521 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _755 = isnan(_521);
    bool _757 = _753 || _755;
    bool _759 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _761 = _757 || _759;
    float _763 = float(_761);
    bool _765 = _655 > 0.0;
    float _767 = -_763;
    float _769 = _767 + 1.0;
    float _771 = _745 ? _751 : 0.0;
    float _773 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _775 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _773;
    bool _777 = _521 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _779 = isnan(_521);
    bool _781 = _777 || _779;
    bool _783 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _785 = _781 || _783;
    float _787 = float(_785);
    float _789 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _791 = 1.0 + _789;
    float _793 = -_175;
    int _795 = _673 ? as_type<int>(_793) : as_type<int>(_175);
    float _797 = fma(_775, _657, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    bool _799 = _669 > 0.0;
    float _801 = _787 * _769;
    float _803 = -_787;
    float _805 = _803 + 1.0;
    float _807 = 1.0 / _791;
    float _809 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _811 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _809;
    float _813 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _815 = _813 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _817 = _603 * _805;
    float _819 = -_603;
    float _821 = _819 + 1.0;
    float _823 = fma(_811, _657, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _825 = fma(_815, _643, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _827 = _721 * _817;
    float _829 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _831 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _833 = _831 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _835 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _837 = _835 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    bool _839 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _841 = isnan(1.0);
    bool _843 = _839 || _841;
    bool _845 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _847 = _843 || _845;
    float _849 = fma(_833, _643, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _851 = fma(_837, _643, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _853 = _797 * _817;
    bool _855 = !_583;
    float _857 = _855 ? _175 : as_type<float>(_795);
    int _859 = ~_747;
    int _861 = _859 + 1;
    int _863 = _861 + 1;
    float _865 = fma(_821, (*spvDescriptorSet0.vp_c9)._m0[123].x, _853);
    bool _867 = !_537;
    int _869 = _867 ? 0 : 1;
    float _871 = -_857;
    float _873 = _871 + 0.5;
    int _875 = _863;
    if (!_799)
    {
        int _877 = ~_747;
        int _879 = _877 + 1;
        _875 = _879;
    }
    int _881 = _875;
    float _883 = fma(_825, _801, _865);
    int _885 = abs(_869);
    float _887 = _733 * _829;
    float _889 = float(_707);
    if (_847)
    {
        float _891 = _771 * _807;
        _129 = _891;
    }
    float _893 = _129;
    float _895 = float(_885);
    float _897 = _823 * _817;
    bool _899 = !_541;
    int _901 = _899 ? 0 : 1;
    float _903 = _873 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _905 = !_533;
    int _907 = _905 ? 0 : 1;
    float _909 = _895 * _889;
    int _911 = abs(_901);
    float _913 = _623 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _915 = abs(_907);
    float _917 = fma(_821, (*spvDescriptorSet0.vp_c9)._m0[123].y, _897);
    float _919 = _903 * _609;
    float _921 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _923 = _913 + _921;
    float _925 = fma(_821, (*spvDescriptorSet0.vp_c9)._m0[123].z, _827);
    float _927 = _631 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _929 = fma(_849, _801, _917);
    float _931 = float(_915);
    float _933 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _935 = _675 + _933;
    float _937 = _923 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _939 = fma(_851, _801, _925);
    out.m_60.x = _887;
    out.m_60.y = _919;
    float _941 = fma(_763, (*spvDescriptorSet0.vp_c9)._m0[125].x, _883);
    float _943 = fma(_935, (*spvDescriptorSet0.vp_c8)._m0[28].x, _937);
    float _945 = fma(_763, (*spvDescriptorSet0.vp_c9)._m0[125].y, _929);
    float _947 = in.m_62.x;
    float _949 = in.m_62.y;
    float _951 = in.m_62.z;
    float _953 = fma(_763, (*spvDescriptorSet0.vp_c9)._m0[125].z, _939);
    int _955 = ~_735;
    int _957 = _955 + 1;
    int _959 = _957 + 1;
    int _961 = _959;
    if (!_765)
    {
        int _963 = ~_735;
        int _965 = _963 + 1;
        _961 = _965;
    }
    int _967 = _961;
    float _969 = float(_911);
    float _971 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _973 = _927 + _971;
    float _975 = float(_881);
    float _977 = float(_967);
    float _979 = fma(_973, (*spvDescriptorSet0.vp_c8)._m0[28].z, _943);
    float _981 = _923 * _923;
    float _983 = _969 * _975;
    float _985 = _931 * _977;
    float _987 = fma(_935, _935, _981);
    bool _989 = _979 >= 0.0;
    float _991 = _909 * (-2.0);
    float _993 = _945 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _995 = fma(_973, _973, _987);
    float _997 = fma(_679, _991, _679);
    float _999 = _941 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1001 = fma(_991, _949, _949);
    float _1003 = rsqrt(_995);
    float _1005 = _953 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1007 = fma(_677, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1001);
    float _1009 = _999 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1011 = _987;
    if (_989)
    {
        _1011 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1013 = _1011;
    float _1015 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1017 = _985 * (-2.0);
    float _1019 = _993 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1021 = _1005 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1023 = as_type<int>(_1013);
    if (_989)
    {
        float _1025 = _1013 * 5.0;
        _1023 = as_type<int>(_1025);
    }
    int _1027 = _1023;
    float _1029 = fma(_687, _1017, _687);
    if (_989)
    {
        out.m_45.x = 0.0;
    }
    float _1031 = fma(_1017, _947, _947);
    float _1033 = fma(_997, _893, _1007);
    float _1035 = _147 + (-0.5);
    float _1037 = _923 * _1003;
    out.m_64.x = _1009;
    out.m_64.y = _1019;
    out.m_64.z = _1021;
    out.m_64.w = _1015;
    float _1039 = _935 * _1003;
    float _1041 = _973 * _1003;
    float _1043 = -_1037;
    float _1045 = fma(_1043, (*spvDescriptorSet0.vp_c9)._m0[18].w, _923);
    if (_989)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3403 = as_type<float>(_1027);
        out.gl_Position.z = _3403;
    }
    if (_989)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1047 = -_1037;
    float _1049 = fma(_1047, (*spvDescriptorSet0.vp_c9)._m0[18].w, _913);
    float _1051 = -_1039;
    float _1053 = fma(_1051, (*spvDescriptorSet0.vp_c9)._m0[18].w, _675);
    float _1055 = -_1041;
    float _1057 = fma(_1055, (*spvDescriptorSet0.vp_c9)._m0[18].w, _927);
    float _1059 = -_1039;
    float _1061 = fma(_1059, (*spvDescriptorSet0.vp_c9)._m0[18].w, _935);
    float _1063 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1065 = _1049 + _1063;
    float _1067 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1069 = _1053 + _1067;
    float _1071 = _1045 * _1045;
    float _1073 = fma(_1035, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1031);
    float _1075 = _1065 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1077 = _147 + _577;
    float _1079 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1081 = _1057 + _1079;
    float _1083 = fma(_1061, _1061, _1071);
    float _1085 = fma(_1069, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1075);
    float _1087 = -_1041;
    float _1089 = fma(_1087, (*spvDescriptorSet0.vp_c9)._m0[18].w, _973);
    float _1091 = fma(_1029, _893, _1073);
    float _1093 = _1077 + (-1.0);
    float _1095 = _983 * (-2.0);
    float _1097 = fma(_1081, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1085);
    float _1099 = fma(_1089, _1089, _1083);
    float _1101 = in.m_66.x;
    float _1103 = in.m_66.y;
    float _1105 = fma(_1093, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1107 = fma(_1095, _951, _951);
    float _1109 = _577 + (-0.5);
    bool _1111 = _1097 >= 0.0;
    float _1113 = fma(_1105, _1095, _1105);
    float _1115 = _1033 * 0.15915493667125701904296875;
    float _1117 = fma(_1109, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1107);
    float _1119 = sqrt(_1099);
    float _1121 = _1091 * 0.15915493667125701904296875;
    float _1123 = fma(_1113, _893, _1117);
    float _1125 = _1123 * 0.15915493667125701904296875;
    float _1127 = _1115 * 6.283185482025146484375;
    float _1129 = sin(_1127);
    float _1131 = _1107;
    float _1133 = _1049;
    if (_1111)
    {
        _1131 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1135 = _1131;
    int _1137 = as_type<int>(_1135);
    if (_1111)
    {
        out.m_45.x = 0.0;
    }
    if (_1111)
    {
        float _1139 = _1135 * 5.0;
        _1137 = as_type<int>(_1139);
    }
    int _1141 = _1137;
    float _1143 = _1115 * 6.283185482025146484375;
    float _1145 = cos(_1143);
    float _1147 = _493 * _1103;
    float _1149 = _1003 * _1119;
    if (_1111)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3583 = as_type<float>(_1141);
        out.gl_Position.z = _3583;
    }
    float _1151 = _253 * _1147;
    float _1153 = _1121 * 6.283185482025146484375;
    float _1155 = sin(_1153);
    float _1157 = _1121 * 6.283185482025146484375;
    float _1159 = cos(_1157);
    float _1161 = _1125 * 6.283185482025146484375;
    float _1163 = sin(_1161);
    if (_1111)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1165 = _1125 * 6.283185482025146484375;
    float _1167 = cos(_1165);
    float _1169 = _1151 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1171 = _491 * _1101;
    float _1173 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _175);
    float _1175 = _1155 * _1129;
    float _1177 = _1149 * _1169;
    float _1179 = _253 * _1171;
    float _1181 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _195);
    float _1183 = _1173 * _1177;
    float _1185 = _1179 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1187 = _1159 * _1145;
    float _1189 = _1159 * _1129;
    bool _1191 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1193 = isnan(0.5);
    bool _1195 = _1191 || _1193;
    bool _1197 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1199 = _1195 || _1197;
    float _1201 = _1149 * _1185;
    float _1203 = fma(_1163, _1187, _1175);
    float _1205 = _1167 * _1183;
    float _1207 = _1129 * _1167;
    float _1209 = _1181 * _1201;
    float _1211 = _1145 * _1167;
    float _1213 = _1159 * _1205;
    float _1215 = _1155 * _1145;
    float _1217 = -_1183;
    float _1219 = _1163 * _1217;
    float _1221 = fma(_1163, _1175, _1187);
    float _1223 = fma(_1203, _1209, _1213);
    float _1225 = _1149 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1227 = _1225 * 0.5;
    float _1229 = -_1215;
    float _1231 = fma(_1163, _1189, _1229);
    float _1233 = -_1189;
    float _1235 = fma(_1163, _1215, _1233);
    float _1237 = _1155 * _1205;
    float _1239 = fma(_1211, _1209, _1219);
    float _1241 = fma(_1231, _1227, _1223);
    float _1243 = fma(_1235, _1209, _1237);
    float _1245 = fma(_1207, _1227, _1239);
    float _1247 = _1241 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1249 = _1241 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1251 = fma(_1221, _1227, _1243);
    float _1253 = _1241 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1255 = fma(_1245, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1247);
    float _1257 = fma(_1245, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1249);
    float _1259 = fma(_1245, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1253);
    float _1261 = fma(_1251, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1255);
    float _1263 = fma(_1251, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1257);
    float _1265 = fma(_1251, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1259);
    float _1267 = _1261 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1269 = _1263 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1271 = _1265 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1273 = _927 + _1267;
    float _1275 = _675 + _1269;
    float _1277 = _913 + _1271;
    float _1279 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1281 = _1273 + _1279;
    float _1283 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1285 = _1275 + _1283;
    float _1287 = _1281 * _1281;
    float _1289 = fma(_1285, _1285, _1287);
    float _1291 = sqrt(_1289);
    bool _1293 = _1291 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1295 = _1269;
    float _1297 = _1247;
    float _1299 = _1275;
    if (!_1293)
    {
        _1295 = _1273;
    }
    float _1301 = _1295;
    float _1303 = _1301;
    if (!_1293)
    {
        _1297 = _1277;
    }
    float _1305 = _1297;
    bool _1307 = !_1293;
    float _1309 = _1305;
    if (!_1307)
    {
        float _1311 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1313 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1315 = _1291 + _1313;
        float _1317 = rsqrt(_1289);
        float _1319 = _1315 * _1311;
        float _1321 = _1277 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1323 = _1319 * 0.15915493667125701904296875;
        float _1325 = _1323 * 6.283185482025146484375;
        float _1327 = sin(_1325);
        float _1329 = _1323 * 6.283185482025146484375;
        float _1331 = cos(_1329);
        float _1333 = fma(_1327, _1321, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1335 = _1317 * _1333;
        float _1337 = _1331 + (-1.0);
        float _1339 = fma(_1285, _1335, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1341 = fma(_1281, _1335, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1343 = _1337 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1345 = fma(_1277, _1331, _1343);
        _1299 = _1339;
        _1309 = _1345;
        _1303 = _1341;
    }
    float _1347 = _1299;
    float _1349 = _1309;
    float _1351 = _1303;
    float _1353 = -_1039;
    float _1355 = fma(_1353, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1347);
    float _1357 = -_1037;
    float _1359 = fma(_1357, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1349);
    float _1361 = -_1041;
    float _1363 = fma(_1361, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1351);
    float _1365 = _1359;
    float _1367 = _1355;
    float _1369 = _1363;
    float _1371 = _1347;
    if (!_1199)
    {
        float _1373 = _1065 * _1065;
        float _1375 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1377 = -_675;
        float _1379 = _1377 + _1347;
        float _1381 = -_913;
        float _1383 = _1381 + _1349;
        float _1385 = fma(_1069, _1069, _1373);
        float _1387 = -_927;
        float _1389 = _1387 + _1351;
        float _1391 = fma(_1081, _1081, _1385);
        float _1393 = 1.0 / _1149;
        float _1395 = sqrt(_1391);
        float _1397 = precise::min(_1395, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1399 = _1397 * _1375;
        float _1401 = _1399 * _1393;
        float _1403 = fma(_1379, _1401, _1053);
        float _1405 = fma(_1383, _1401, _1049);
        float _1407 = fma(_1389, _1401, _1057);
        _1365 = _1405;
        _1367 = _1403;
        _1369 = _1407;
        _1371 = _1379;
    }
    float _1409 = _1365;
    float _1411 = _1367;
    float _1413 = _1369;
    float _1415 = _1371;
    float _1417 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1419 = _1409 + _1417;
    float _1421 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1423 = _1411 + _1421;
    float _1425 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1427 = _1413 + _1425;
    float _1429 = _1419 * _1419;
    float _1431 = fma(_1423, _1423, _1429);
    float _1433 = fma(_1427, _1427, _1431);
    float _1435 = rsqrt(_1433);
    float _1437 = sqrt(_1433);
    float _1439 = _1435 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1441 = _1423 * _1439;
    float _1443 = _1427 * _1439;
    float _1445 = _1441 * _1441;
    float _1447 = _1443 * _1443;
    float _1449 = _1445 + _1447;
    float _1451 = sqrt(_1449);
    bool _1453 = _1451 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1455 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1457 = _1451 + _1455;
    float _1459 = _1435;
    float _1461 = _1457;
    float _1463 = _1415;
    float _1465 = _1419;
    float _1467 = _1441;
    if (_1453)
    {
        float _1469 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1459 = _1469;
    }
    float _1471 = _1459;
    float _1473 = _1471;
    if (_1453)
    {
        float _1475 = _1457 * _1471;
        _1461 = _1475;
    }
    float _1477 = _1461;
    if (_1453)
    {
        float _1479 = rsqrt(_1449);
        _1473 = _1479;
    }
    float _1481 = _1473;
    float _1483 = _1481;
    if (_1453)
    {
        float _1485 = _1477 * 0.15915493667125701904296875;
        _1463 = _1485;
    }
    float _1487 = _1463;
    float _1489 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1491 = _1427;
    float _1493 = _1487;
    if (_1453)
    {
        float _1495 = _1487 * 6.283185482025146484375;
        float _1497 = sin(_1495);
        _1491 = _1497;
    }
    float _1499 = _1491;
    float _1501 = precise::max(0.0, _1489);
    float _1503 = _1281;
    float _1505 = _1501;
    if (_1453)
    {
        float _1507 = _1487 * 6.283185482025146484375;
        float _1509 = cos(_1507);
        _1503 = _1509;
    }
    float _1511 = _1503;
    float _1513 = -_1439;
    float _1515 = -_1501;
    float _1517 = fma(_1419, _1513, _1515);
    if (_1453)
    {
        float _1519 = _1517 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1465 = _1519;
    }
    float _1521 = _1465;
    float _1523 = _1499;
    float _1525 = _1521;
    if (_1453)
    {
        float _1527 = fma(_1499, _1521, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1523 = _1527;
    }
    float _1529 = _1523;
    float _1531 = _1529;
    if (!_1453)
    {
        _1525 = _1447;
    }
    float _1533 = _1525;
    float _1535 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1537 = _1533;
    if (_1453)
    {
        float _1539 = _1481 * _1529;
        _701 = _1539;
    }
    float _1541 = _701;
    if (!_1453)
    {
        _1483 = _1517;
    }
    float _1543 = _1483;
    float _1545 = _1543;
    if (_1453)
    {
        float _1547 = _1511 + (-1.0);
        _1505 = _1547;
    }
    float _1549 = _1505;
    float _1551 = _1549;
    if (_1453)
    {
        float _1553 = _1441 * _1541;
        _1467 = _1553;
    }
    float _1555 = _1467;
    if (!_1453)
    {
        _1531 = _1443;
    }
    float _1557 = _1531;
    float _1559 = _1557;
    if (_1453)
    {
        float _1561 = _1443 * _1541;
        _1559 = _1561;
    }
    float _1563 = _1559;
    if (_1453)
    {
        float _1565 = _1549 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1493 = _1565;
    }
    float _1567 = _1493;
    if (!_1453)
    {
        _1551 = _1445;
    }
    float _1569 = _1551;
    float _1571 = _1569;
    if (_1453)
    {
        float _1573 = _1555 * _1555;
        _1571 = _1573;
    }
    float _1575 = _1571;
    if (_1453)
    {
        float _1577 = _1563 * _1563;
        _1537 = _1577;
    }
    float _1579 = _1537;
    if (_1453)
    {
        float _1581 = fma(_1517, _1511, _1567);
        _1545 = _1581;
    }
    float _1583 = _1545;
    float _1585 = fma(_1583, _1583, _1575);
    float _1587 = _1409 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1589 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1591 = fma(_1437, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1589);
    float _1593 = precise::clamp(_1591, 0.0, 1.0);
    float _1595 = _1409 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1597 = _1585 + _1579;
    float _1599 = fma(_1411, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1587);
    float _1601 = _1409 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1603 = -_1593;
    float _1605 = _1603 + 1.0;
    float _1607 = rsqrt(_1597);
    float _1609 = fma(_1413, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1599);
    float _1611 = fma(_1411, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1601);
    float _1613 = _1409 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1615 = _1609 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1617 = fma(_1413, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1611);
    float _1619 = fma(_1411, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1613);
    float _1621 = abs(_1605);
    float _1623 = log2(_1621);
    float _1625 = fma(_1411, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1595);
    float _1627 = _1617 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1629 = fma(_1413, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1619);
    float _1631 = _1615 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1633 = fma(_1413, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1625);
    float _1635 = _1629 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1637 = _1607 * _1555;
    float _1639 = _1627 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1641 = _1607 * _1583;
    float _1643 = _1607 * _1563;
    float _1645 = _1637 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1647 = fma(_1635, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1639);
    float _1649 = -_1631;
    float _1651 = fma(_1649, _1535, 1.0);
    float _1653 = _1633 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1655 = _1623 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1657 = -_1645;
    float _1659 = fma(_1641, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1657);
    float _1661 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1647);
    float _1663 = _1627 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1665 = log2(_1651);
    float _1667 = -_1643;
    float _1669 = fma(_1667, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1659);
    float _1671 = fma(_1653, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1661);
    float _1673 = _1627 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1675 = fma(_1635, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1663);
    float _1677 = fma(_1669, -0.5, 0.5);
    float _1679 = fma(_1669, 0.5, 0.5);
    float _1681 = fma(_1635, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1673);
    float _1683 = exp2(_1655);
    float _1685 = _1641 + 1.0;
    float _1687 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1675);
    float _1689 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1681);
    float _1691 = fma(_1679, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1693 = 1.0 / _1671;
    float _1695 = fma(_1679, _1691, -0.212114393711090087890625);
    float _1697 = _1665 * 0.693147182464599609375;
    float _1699 = fma(_1679, _1695, 1.570728778839111328125);
    float _1701 = _1697 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1703 = sqrt(_1677);
    float _1705 = -_1641;
    float _1707 = fma(_1683, _1685, _1705);
    float _1709 = fma(_1653, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1689);
    float _1711 = fma(_1653, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1687);
    float _1713 = fma(_1707, 0.5, 0.5);
    float _1715 = _1709 * _1693;
    float _1717 = _1711 * _1693;
    float _1719 = fma(_1715, 0.5, 0.5);
    float _1721 = fma(_1717, -0.5, 0.5);
    float _1723 = _1703 * 0.636619746685028076171875;
    float3 _4518 = float3(_1719, _1721, _1701);
    float _1725 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4518, float3(0.0), isnan(_4518)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4518, float3(0.0), isnan(_4518)), level(0.0)).x;
    float3 _4529 = float3(_1719, _1721, _1701);
    float4 _1728 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4529, float3(0.0), isnan(_4529)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4529, float3(0.0), isnan(_4529)), level(0.0)).xyzw;
    float _1730 = _1728.x;
    float _1732 = _1728.y;
    float _1734 = _1728.z;
    float _1736 = _1728.w;
    float _1738 = -_1699;
    float _1740 = fma(_1723, _1738, 1.0);
    float2 _4551 = float2(_1740, _1713);
    float3 _1744 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4551, float2(0.0), isnan(_4551)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4551, float2(0.0), isnan(_4551)), level(0.0)).xyz;
    float _1746 = _1744.x;
    float _1748 = _1744.y;
    float _1750 = _1744.z;
    float _1752 = _1049 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _1754 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1756 = isnan(0.5);
    bool _1758 = _1754 || _1756;
    bool _1760 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1762 = _1758 || _1760;
    float _1764 = _1627 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_68.y = _1409;
    float _1766 = fma(_1053, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1752);
    float _1768 = _1049 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1770 = fma(_1635, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1764);
    float _1772 = fma(_1057, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1766);
    float _1774 = fma(_1053, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1768);
    float _1776 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1770);
    float _1778 = _1772 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1780 = fma(_1057, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1774);
    float _1782 = _1772;
    float _1784 = _1623;
    if (!_1762)
    {
        _257 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1786 = _257;
    float _1788 = _1623 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1790 = 1.0 / _1778;
    float _1792 = _1780 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    if (!_1762)
    {
        _1782 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1794 = _1782;
    float _1796 = fma(_1653, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1776);
    if (_1762)
    {
        _1784 = 1.0;
    }
    float _1798 = _1784;
    float _1800 = _1792 + _1778;
    float _1802 = _1798;
    if (!_1762)
    {
        float _1804 = -_1794;
        float _1806 = _1804 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1133 = _1806;
    }
    float _1808 = _1133;
    float _1810 = exp2(_1788);
    float _1812 = _1796 + _1671;
    float _1814 = _1800 * _1790;
    float _1816 = _1814 * 0.5;
    float _1818 = _1808;
    float _1820 = _1816;
    if (!_1762)
    {
        float _1822 = 1.0 / _1808;
        _1818 = _1822;
    }
    float _1824 = _1818;
    if (!_1762)
    {
        float _1826 = -_1786;
        float _1828 = fma(_1816, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1826);
        _1820 = _1828;
    }
    float _1830 = _1820;
    float _1832 = _1786;
    if (!_1762)
    {
        float _1834 = 1.0 / _1830;
        _1832 = _1834;
    }
    float _1836 = _1832;
    float _1838 = _1812 * 0.5;
    float _1840 = _1836;
    if (!_1762)
    {
        float _1842 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1844 = -_1794;
        float _1846 = fma(_1836, _1842, _1844);
        _1840 = _1846;
    }
    float _1848 = _1840;
    if (!_1762)
    {
        float _1850 = _1848 * _1824;
        float _1852 = precise::clamp(_1850, 0.0, 1.0);
        _1802 = _1852;
    }
    float _1854 = _1802;
    float _1856 = -_1810;
    float _1858 = _1856 + 1.0;
    float _1860 = _1854 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1862 = _1858 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _1864 = _1854 > 0.0;
    bool _1866 = isnan(_1854);
    bool _1868 = _1864 || _1866;
    bool _1870 = isnan(0.0);
    bool _1872 = _1868 || _1870;
    out.gl_Position.x = _1709;
    out.gl_Position.y = _1711;
    out.gl_Position.z = _1796;
    out.gl_Position.w = _1671;
    float _1874 = -_1862;
    float _1876 = _1874 + 1.0;
    float _1878 = _1860 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_70.z = _1838;
    out.m_70.w = _1671;
    out.m_45.x = _1878;
    float _1880 = _1862 * _1725;
    float _1882 = _1736 * _1880;
    float _1884 = _1736 * _1876;
    float _1886 = _1750 * _1880;
    float _1888 = fma(_1746, _1882, _1730);
    float _1890 = fma(_1748, _1882, _1732);
    float _1892 = fma(_1736, _1886, _1734);
    out.m_72.x = _1888;
    out.m_72.y = _1890;
    out.m_72.z = _1892;
    out.m_72.w = _1884;
    if (_1872)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _1894 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1894;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
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
        float _1951 = as_type<float>(_107);
        out.gl_Position.z = _1951;
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
        float _2020 = as_type<float>(_145);
        out.gl_Position.z = _2020;
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
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _291 = _283 + _289;
    bool _293 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _295 = isnan(_283);
    bool _297 = _293 || _295;
    bool _299 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _301 = _297 || _299;
    float _303 = float(_301);
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _307 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _305;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _311 = _309 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _315 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _313;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _319 = _317 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _321 = 1.0 / _307;
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _325 = _283 + _323;
    bool _327 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _329 = 1.0 / _311;
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _333 = _283 + _331;
    float _335 = 1.0 / _315;
    float _337 = _325 * _321;
    float _339 = 1.0 / _319;
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
    float _367 = _291 * _335;
    float _369 = -_303;
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
    float _393 = _333 * _339;
    float _395 = -_365;
    float _397 = _395 + 1.0;
    float _399 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _401 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _399;
    bool _403 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _405 = isnan(_283);
    bool _407 = _403 || _405;
    bool _409 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _411 = _407 || _409;
    float _413 = float(_411);
    float _415 = _389 * _397;
    float _417 = -_389;
    float _419 = _417 + 1.0;
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _423 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _421;
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _427 = _425 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _429 = fma(_401, _337, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _431 = _413 * _419;
    float _433 = fma(_423, _337, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _437 = _435 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _439 = -_413;
    float _441 = _439 + 1.0;
    float _443 = _429 * _431;
    float _445 = _433 * _431;
    float _447 = fma(_437, _341, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _449 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _451 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _449;
    float _453 = fma(_441, (*spvDescriptorSet0.vp_c9)._m0[143].x, _443);
    float _455 = fma(_427, _341, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _457;
    float _461 = fma(_441, (*spvDescriptorSet0.vp_c9)._m0[143].y, _445);
    float _463 = fma(_451, _367, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _467 = _465 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _469 = fma(_447, _415, _453);
    float _471 = fma(_459, _367, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _475 = _473 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _477 = fma(_455, _415, _461);
    float _479 = fma(_467, _393, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _481 = fma(_463, _391, _469);
    float _483 = fma(_475, _393, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _485 = fma(_471, _391, _477);
    float _487 = fma(_479, _377, _481);
    float _489 = fma(_483, _377, _485);
    float _491 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[147].x, _487);
    float _493 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[147].y, _489);
    bool _495 = !_327;
    float _511;
    if (!_495)
    {
        float _497 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _499 = _147 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _501 = fma(_499, (*spvDescriptorSet0.vp_c9)._m0[11].z, _125);
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
    int _531 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _533 = _531 != 0;
    int _535 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _537 = _535 != 0;
    int _539 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _541 = _539 != 0;
    float _543 = in.m_54.x;
    float _545 = in.m_54.y;
    float _547 = in.m_54.z;
    bool _549 = _147 > 0.5;
    float _551 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _553 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _551;
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _557 = _555 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _559 = in.m_56.x;
    float _561 = in.m_56.y;
    float _563 = in.m_56.z;
    float _565 = floor(_529);
    float _567 = in.m_58.x;
    float _569 = in.m_58.y;
    float _571 = in.m_58.z;
    int _573 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _575 = _573 != 0;
    float _577 = in.m_49.z;
    float _579 = 1.0 / _553;
    int _581 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _583 = _581 != 0;
    float _585 = in.m_49.y;
    float _587 = 1.0 / _557;
    bool _589 = _565 > 0.0;
    float _591 = _525 * _545;
    bool _593 = _521 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _595 = isnan(_521);
    bool _597 = _593 || _595;
    bool _599 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _601 = _597 || _599;
    float _603 = float(_601);
    float _605 = _525 * _561;
    float _607 = fma(_523, _543, _591);
    float _609 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _611 = _525 * _569;
    float _613 = fma(_523, _559, _605);
    float _615 = fma(_527, _547, _607);
    float _617 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _619 = _521 + _617;
    float _621 = fma(_523, _567, _611);
    float _623 = fma(_527, _563, _613);
    float _625 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _627 = log2(_625);
    float _629 = _577 * 2.0;
    float _631 = fma(_527, _571, _621);
    float _633 = _585 * 2.0;
    float _635 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _637 = _521 + _635;
    float _639 = -_195;
    int _641 = _549 ? as_type<int>(_639) : as_type<int>(_195);
    float _643 = _619 * _587;
    bool _645 = _565 >= 0.0;
    bool _647 = isnan(_565);
    bool _649 = _645 || _647;
    bool _651 = isnan(0.0);
    bool _653 = _649 || _651;
    float _655 = floor(_629);
    float _657 = _637 * _579;
    float _659 = _147 + _585;
    float _661 = _585 + _577;
    int _663 = _653 ? 0 : 1;
    float _665 = _659 + (-1.0);
    float _667 = _627 * _125;
    float _669 = floor(_633);
    float _671 = _661 + (-1.0);
    bool _673 = _585 > 0.5;
    float _675 = _615 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _677 = _585 + (-0.5);
    float _679 = fma(_671, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _681 = !_575;
    float _683 = _681 ? _195 : as_type<float>(_641);
    float _685 = exp2(_667);
    float _687 = fma(_665, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _689 = ~_663;
    int _691 = _689 + 1;
    int _693 = _691 + 1;
    float _695 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _697 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _695;
    int _699 = _693;
    float _701 = _675;
    if (!_589)
    {
        int _703 = ~_663;
        int _705 = _703 + 1;
        _699 = _705;
    }
    int _707 = _699;
    float _709 = _683 + 0.5;
    bool _711 = _655 >= 0.0;
    bool _713 = isnan(_655);
    bool _715 = _711 || _713;
    bool _717 = isnan(0.0);
    bool _719 = _715 || _717;
    float _721 = fma(_697, _657, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _723 = _669 >= 0.0;
    bool _725 = isnan(_669);
    bool _727 = _723 || _725;
    bool _729 = isnan(0.0);
    bool _731 = _727 || _729;
    float _733 = _709 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _735 = _719 ? 0 : 1;
    bool _737 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _739 = isnan(0.0);
    bool _741 = _737 || _739;
    bool _743 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _745 = _741 || _743;
    int _747 = _731 ? 0 : 1;
    float _749 = -_685;
    float _751 = _749 + 1.0;
    bool _753 = _521 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _755 = isnan(_521);
    bool _757 = _753 || _755;
    bool _759 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _761 = _757 || _759;
    float _763 = float(_761);
    bool _765 = _655 > 0.0;
    float _767 = -_763;
    float _769 = _767 + 1.0;
    float _771 = _745 ? _751 : 0.0;
    float _773 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _775 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _773;
    bool _777 = _521 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _779 = isnan(_521);
    bool _781 = _777 || _779;
    bool _783 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _785 = _781 || _783;
    float _787 = float(_785);
    float _789 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _791 = 1.0 + _789;
    float _793 = -_175;
    int _795 = _673 ? as_type<int>(_793) : as_type<int>(_175);
    float _797 = fma(_775, _657, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    bool _799 = _669 > 0.0;
    float _801 = _787 * _769;
    float _803 = -_787;
    float _805 = _803 + 1.0;
    float _807 = 1.0 / _791;
    float _809 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _811 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _809;
    float _813 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _815 = _813 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _817 = _603 * _805;
    float _819 = -_603;
    float _821 = _819 + 1.0;
    float _823 = fma(_811, _657, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _825 = fma(_815, _643, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _827 = _721 * _817;
    float _829 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _831 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _833 = _831 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _835 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _837 = _835 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    bool _839 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _841 = isnan(1.0);
    bool _843 = _839 || _841;
    bool _845 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _847 = _843 || _845;
    float _849 = fma(_833, _643, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _851 = fma(_837, _643, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _853 = _797 * _817;
    bool _855 = !_583;
    float _857 = _855 ? _175 : as_type<float>(_795);
    int _859 = ~_747;
    int _861 = _859 + 1;
    int _863 = _861 + 1;
    float _865 = fma(_821, (*spvDescriptorSet0.vp_c9)._m0[123].x, _853);
    bool _867 = !_537;
    int _869 = _867 ? 0 : 1;
    float _871 = -_857;
    float _873 = _871 + 0.5;
    int _875 = _863;
    if (!_799)
    {
        int _877 = ~_747;
        int _879 = _877 + 1;
        _875 = _879;
    }
    int _881 = _875;
    float _883 = fma(_825, _801, _865);
    int _885 = abs(_869);
    float _887 = _733 * _829;
    float _889 = float(_707);
    if (_847)
    {
        float _891 = _771 * _807;
        _129 = _891;
    }
    float _893 = _129;
    float _895 = float(_885);
    float _897 = _823 * _817;
    bool _899 = !_541;
    int _901 = _899 ? 0 : 1;
    float _903 = _873 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _905 = !_533;
    int _907 = _905 ? 0 : 1;
    float _909 = _895 * _889;
    int _911 = abs(_901);
    float _913 = _623 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _915 = abs(_907);
    float _917 = fma(_821, (*spvDescriptorSet0.vp_c9)._m0[123].y, _897);
    float _919 = _903 * _609;
    float _921 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _923 = _913 + _921;
    float _925 = fma(_821, (*spvDescriptorSet0.vp_c9)._m0[123].z, _827);
    float _927 = _631 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _929 = fma(_849, _801, _917);
    float _931 = float(_915);
    float _933 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _935 = _675 + _933;
    float _937 = _923 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _939 = fma(_851, _801, _925);
    out.m_60.x = _887;
    out.m_60.y = _919;
    float _941 = fma(_763, (*spvDescriptorSet0.vp_c9)._m0[125].x, _883);
    float _943 = fma(_935, (*spvDescriptorSet0.vp_c8)._m0[28].x, _937);
    float _945 = fma(_763, (*spvDescriptorSet0.vp_c9)._m0[125].y, _929);
    float _947 = in.m_62.x;
    float _949 = in.m_62.y;
    float _951 = in.m_62.z;
    float _953 = fma(_763, (*spvDescriptorSet0.vp_c9)._m0[125].z, _939);
    int _955 = ~_735;
    int _957 = _955 + 1;
    int _959 = _957 + 1;
    int _961 = _959;
    if (!_765)
    {
        int _963 = ~_735;
        int _965 = _963 + 1;
        _961 = _965;
    }
    int _967 = _961;
    float _969 = float(_911);
    float _971 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _973 = _927 + _971;
    float _975 = float(_881);
    float _977 = float(_967);
    float _979 = fma(_973, (*spvDescriptorSet0.vp_c8)._m0[28].z, _943);
    float _981 = _923 * _923;
    float _983 = _969 * _975;
    float _985 = _931 * _977;
    float _987 = fma(_935, _935, _981);
    bool _989 = _979 >= 0.0;
    float _991 = _909 * (-2.0);
    float _993 = _945 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _995 = fma(_973, _973, _987);
    float _997 = fma(_679, _991, _679);
    float _999 = _941 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1001 = fma(_991, _949, _949);
    float _1003 = rsqrt(_995);
    float _1005 = _953 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1007 = fma(_677, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1001);
    float _1009 = _999 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1011 = _987;
    if (_989)
    {
        _1011 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1013 = _1011;
    float _1015 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1017 = _985 * (-2.0);
    float _1019 = _993 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1021 = _1005 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1023 = as_type<int>(_1013);
    if (_989)
    {
        float _1025 = _1013 * 5.0;
        _1023 = as_type<int>(_1025);
    }
    int _1027 = _1023;
    float _1029 = fma(_687, _1017, _687);
    if (_989)
    {
        out.m_45.x = 0.0;
    }
    float _1031 = fma(_1017, _947, _947);
    float _1033 = fma(_997, _893, _1007);
    float _1035 = _147 + (-0.5);
    float _1037 = _923 * _1003;
    out.m_64.x = _1009;
    out.m_64.y = _1019;
    out.m_64.z = _1021;
    out.m_64.w = _1015;
    float _1039 = _935 * _1003;
    float _1041 = _973 * _1003;
    float _1043 = -_1037;
    float _1045 = fma(_1043, (*spvDescriptorSet0.vp_c9)._m0[18].w, _923);
    if (_989)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3403 = as_type<float>(_1027);
        out.gl_Position.z = _3403;
    }
    if (_989)
    {
        return out;
    }
    float _1047 = -_1037;
    float _1049 = fma(_1047, (*spvDescriptorSet0.vp_c9)._m0[18].w, _913);
    float _1051 = -_1039;
    float _1053 = fma(_1051, (*spvDescriptorSet0.vp_c9)._m0[18].w, _675);
    float _1055 = -_1041;
    float _1057 = fma(_1055, (*spvDescriptorSet0.vp_c9)._m0[18].w, _927);
    float _1059 = -_1039;
    float _1061 = fma(_1059, (*spvDescriptorSet0.vp_c9)._m0[18].w, _935);
    float _1063 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1065 = _1049 + _1063;
    float _1067 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1069 = _1053 + _1067;
    float _1071 = _1045 * _1045;
    float _1073 = fma(_1035, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1031);
    float _1075 = _1065 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1077 = _147 + _577;
    float _1079 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1081 = _1057 + _1079;
    float _1083 = fma(_1061, _1061, _1071);
    float _1085 = fma(_1069, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1075);
    float _1087 = -_1041;
    float _1089 = fma(_1087, (*spvDescriptorSet0.vp_c9)._m0[18].w, _973);
    float _1091 = fma(_1029, _893, _1073);
    float _1093 = _1077 + (-1.0);
    float _1095 = _983 * (-2.0);
    float _1097 = fma(_1081, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1085);
    float _1099 = fma(_1089, _1089, _1083);
    float _1101 = in.m_66.x;
    float _1103 = in.m_66.y;
    float _1105 = fma(_1093, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1107 = fma(_1095, _951, _951);
    float _1109 = _577 + (-0.5);
    bool _1111 = _1097 >= 0.0;
    float _1113 = fma(_1105, _1095, _1105);
    float _1115 = _1033 * 0.15915493667125701904296875;
    float _1117 = fma(_1109, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1107);
    float _1119 = sqrt(_1099);
    float _1121 = _1091 * 0.15915493667125701904296875;
    float _1123 = fma(_1113, _893, _1117);
    float _1125 = _1123 * 0.15915493667125701904296875;
    float _1127 = _1115 * 6.283185482025146484375;
    float _1129 = sin(_1127);
    float _1131 = _1107;
    float _1133 = _1049;
    if (_1111)
    {
        _1131 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1135 = _1131;
    int _1137 = as_type<int>(_1135);
    if (_1111)
    {
        out.m_45.x = 0.0;
    }
    if (_1111)
    {
        float _1139 = _1135 * 5.0;
        _1137 = as_type<int>(_1139);
    }
    int _1141 = _1137;
    float _1143 = _1115 * 6.283185482025146484375;
    float _1145 = cos(_1143);
    float _1147 = _493 * _1103;
    float _1149 = _1003 * _1119;
    if (_1111)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3583 = as_type<float>(_1141);
        out.gl_Position.z = _3583;
    }
    float _1151 = _253 * _1147;
    float _1153 = _1121 * 6.283185482025146484375;
    float _1155 = sin(_1153);
    float _1157 = _1121 * 6.283185482025146484375;
    float _1159 = cos(_1157);
    float _1161 = _1125 * 6.283185482025146484375;
    float _1163 = sin(_1161);
    if (_1111)
    {
        return out;
    }
    float _1165 = _1125 * 6.283185482025146484375;
    float _1167 = cos(_1165);
    float _1169 = _1151 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1171 = _491 * _1101;
    float _1173 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _175);
    float _1175 = _1155 * _1129;
    float _1177 = _1149 * _1169;
    float _1179 = _253 * _1171;
    float _1181 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _195);
    float _1183 = _1173 * _1177;
    float _1185 = _1179 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1187 = _1159 * _1145;
    float _1189 = _1159 * _1129;
    bool _1191 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1193 = isnan(0.5);
    bool _1195 = _1191 || _1193;
    bool _1197 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1199 = _1195 || _1197;
    float _1201 = _1149 * _1185;
    float _1203 = fma(_1163, _1187, _1175);
    float _1205 = _1167 * _1183;
    float _1207 = _1129 * _1167;
    float _1209 = _1181 * _1201;
    float _1211 = _1145 * _1167;
    float _1213 = _1159 * _1205;
    float _1215 = _1155 * _1145;
    float _1217 = -_1183;
    float _1219 = _1163 * _1217;
    float _1221 = fma(_1163, _1175, _1187);
    float _1223 = fma(_1203, _1209, _1213);
    float _1225 = _1149 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1227 = _1225 * 0.5;
    float _1229 = -_1215;
    float _1231 = fma(_1163, _1189, _1229);
    float _1233 = -_1189;
    float _1235 = fma(_1163, _1215, _1233);
    float _1237 = _1155 * _1205;
    float _1239 = fma(_1211, _1209, _1219);
    float _1241 = fma(_1231, _1227, _1223);
    float _1243 = fma(_1235, _1209, _1237);
    float _1245 = fma(_1207, _1227, _1239);
    float _1247 = _1241 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1249 = _1241 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1251 = fma(_1221, _1227, _1243);
    float _1253 = _1241 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1255 = fma(_1245, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1247);
    float _1257 = fma(_1245, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1249);
    float _1259 = fma(_1245, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1253);
    float _1261 = fma(_1251, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1255);
    float _1263 = fma(_1251, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1257);
    float _1265 = fma(_1251, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1259);
    float _1267 = _1261 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1269 = _1263 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1271 = _1265 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1273 = _927 + _1267;
    float _1275 = _675 + _1269;
    float _1277 = _913 + _1271;
    float _1279 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1281 = _1273 + _1279;
    float _1283 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1285 = _1275 + _1283;
    float _1287 = _1281 * _1281;
    float _1289 = fma(_1285, _1285, _1287);
    float _1291 = sqrt(_1289);
    bool _1293 = _1291 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1295 = _1269;
    float _1297 = _1247;
    float _1299 = _1275;
    if (!_1293)
    {
        _1295 = _1273;
    }
    float _1301 = _1295;
    float _1303 = _1301;
    if (!_1293)
    {
        _1297 = _1277;
    }
    float _1305 = _1297;
    bool _1307 = !_1293;
    float _1309 = _1305;
    if (!_1307)
    {
        float _1311 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1313 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1315 = _1291 + _1313;
        float _1317 = rsqrt(_1289);
        float _1319 = _1315 * _1311;
        float _1321 = _1277 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1323 = _1319 * 0.15915493667125701904296875;
        float _1325 = _1323 * 6.283185482025146484375;
        float _1327 = sin(_1325);
        float _1329 = _1323 * 6.283185482025146484375;
        float _1331 = cos(_1329);
        float _1333 = fma(_1327, _1321, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1335 = _1317 * _1333;
        float _1337 = _1331 + (-1.0);
        float _1339 = fma(_1285, _1335, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1341 = fma(_1281, _1335, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1343 = _1337 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1345 = fma(_1277, _1331, _1343);
        _1299 = _1339;
        _1309 = _1345;
        _1303 = _1341;
    }
    float _1347 = _1299;
    float _1349 = _1309;
    float _1351 = _1303;
    float _1353 = -_1039;
    float _1355 = fma(_1353, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1347);
    float _1357 = -_1037;
    float _1359 = fma(_1357, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1349);
    float _1361 = -_1041;
    float _1363 = fma(_1361, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1351);
    float _1365 = _1359;
    float _1367 = _1355;
    float _1369 = _1363;
    float _1371 = _1347;
    if (!_1199)
    {
        float _1373 = _1065 * _1065;
        float _1375 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1377 = -_675;
        float _1379 = _1377 + _1347;
        float _1381 = -_913;
        float _1383 = _1381 + _1349;
        float _1385 = fma(_1069, _1069, _1373);
        float _1387 = -_927;
        float _1389 = _1387 + _1351;
        float _1391 = fma(_1081, _1081, _1385);
        float _1393 = 1.0 / _1149;
        float _1395 = sqrt(_1391);
        float _1397 = precise::min(_1395, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1399 = _1397 * _1375;
        float _1401 = _1399 * _1393;
        float _1403 = fma(_1379, _1401, _1053);
        float _1405 = fma(_1383, _1401, _1049);
        float _1407 = fma(_1389, _1401, _1057);
        _1365 = _1405;
        _1367 = _1403;
        _1369 = _1407;
        _1371 = _1379;
    }
    float _1409 = _1365;
    float _1411 = _1367;
    float _1413 = _1369;
    float _1415 = _1371;
    float _1417 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1419 = _1409 + _1417;
    float _1421 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1423 = _1411 + _1421;
    float _1425 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1427 = _1413 + _1425;
    float _1429 = _1419 * _1419;
    float _1431 = fma(_1423, _1423, _1429);
    float _1433 = fma(_1427, _1427, _1431);
    float _1435 = rsqrt(_1433);
    float _1437 = sqrt(_1433);
    float _1439 = _1435 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1441 = _1423 * _1439;
    float _1443 = _1427 * _1439;
    float _1445 = _1441 * _1441;
    float _1447 = _1443 * _1443;
    float _1449 = _1445 + _1447;
    float _1451 = sqrt(_1449);
    bool _1453 = _1451 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1455 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1457 = _1451 + _1455;
    float _1459 = _1435;
    float _1461 = _1457;
    float _1463 = _1415;
    float _1465 = _1419;
    float _1467 = _1441;
    if (_1453)
    {
        float _1469 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1459 = _1469;
    }
    float _1471 = _1459;
    float _1473 = _1471;
    if (_1453)
    {
        float _1475 = _1457 * _1471;
        _1461 = _1475;
    }
    float _1477 = _1461;
    if (_1453)
    {
        float _1479 = rsqrt(_1449);
        _1473 = _1479;
    }
    float _1481 = _1473;
    float _1483 = _1481;
    if (_1453)
    {
        float _1485 = _1477 * 0.15915493667125701904296875;
        _1463 = _1485;
    }
    float _1487 = _1463;
    float _1489 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1491 = _1427;
    float _1493 = _1487;
    if (_1453)
    {
        float _1495 = _1487 * 6.283185482025146484375;
        float _1497 = sin(_1495);
        _1491 = _1497;
    }
    float _1499 = _1491;
    float _1501 = precise::max(0.0, _1489);
    float _1503 = _1281;
    float _1505 = _1501;
    if (_1453)
    {
        float _1507 = _1487 * 6.283185482025146484375;
        float _1509 = cos(_1507);
        _1503 = _1509;
    }
    float _1511 = _1503;
    float _1513 = -_1439;
    float _1515 = -_1501;
    float _1517 = fma(_1419, _1513, _1515);
    if (_1453)
    {
        float _1519 = _1517 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1465 = _1519;
    }
    float _1521 = _1465;
    float _1523 = _1499;
    float _1525 = _1521;
    if (_1453)
    {
        float _1527 = fma(_1499, _1521, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1523 = _1527;
    }
    float _1529 = _1523;
    float _1531 = _1529;
    if (!_1453)
    {
        _1525 = _1447;
    }
    float _1533 = _1525;
    float _1535 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1537 = _1533;
    if (_1453)
    {
        float _1539 = _1481 * _1529;
        _701 = _1539;
    }
    float _1541 = _701;
    if (!_1453)
    {
        _1483 = _1517;
    }
    float _1543 = _1483;
    float _1545 = _1543;
    if (_1453)
    {
        float _1547 = _1511 + (-1.0);
        _1505 = _1547;
    }
    float _1549 = _1505;
    float _1551 = _1549;
    if (_1453)
    {
        float _1553 = _1441 * _1541;
        _1467 = _1553;
    }
    float _1555 = _1467;
    if (!_1453)
    {
        _1531 = _1443;
    }
    float _1557 = _1531;
    float _1559 = _1557;
    if (_1453)
    {
        float _1561 = _1443 * _1541;
        _1559 = _1561;
    }
    float _1563 = _1559;
    if (_1453)
    {
        float _1565 = _1549 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1493 = _1565;
    }
    float _1567 = _1493;
    if (!_1453)
    {
        _1551 = _1445;
    }
    float _1569 = _1551;
    float _1571 = _1569;
    if (_1453)
    {
        float _1573 = _1555 * _1555;
        _1571 = _1573;
    }
    float _1575 = _1571;
    if (_1453)
    {
        float _1577 = _1563 * _1563;
        _1537 = _1577;
    }
    float _1579 = _1537;
    if (_1453)
    {
        float _1581 = fma(_1517, _1511, _1567);
        _1545 = _1581;
    }
    float _1583 = _1545;
    float _1585 = fma(_1583, _1583, _1575);
    float _1587 = _1409 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1589 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1591 = fma(_1437, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1589);
    float _1593 = precise::clamp(_1591, 0.0, 1.0);
    float _1595 = _1409 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1597 = _1585 + _1579;
    float _1599 = fma(_1411, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1587);
    float _1601 = _1409 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1603 = -_1593;
    float _1605 = _1603 + 1.0;
    float _1607 = rsqrt(_1597);
    float _1609 = fma(_1413, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1599);
    float _1611 = fma(_1411, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1601);
    float _1613 = _1409 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1615 = _1609 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1617 = fma(_1413, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1611);
    float _1619 = fma(_1411, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1613);
    float _1621 = abs(_1605);
    float _1623 = log2(_1621);
    float _1625 = fma(_1411, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1595);
    float _1627 = _1617 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1629 = fma(_1413, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1619);
    float _1631 = _1615 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1633 = fma(_1413, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1625);
    float _1635 = _1629 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1637 = _1607 * _1555;
    float _1639 = _1627 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1641 = _1607 * _1583;
    float _1643 = _1607 * _1563;
    float _1645 = _1637 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1647 = fma(_1635, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1639);
    float _1649 = -_1631;
    float _1651 = fma(_1649, _1535, 1.0);
    float _1653 = _1633 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1655 = _1623 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1657 = -_1645;
    float _1659 = fma(_1641, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1657);
    float _1661 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1647);
    float _1663 = _1627 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1665 = log2(_1651);
    float _1667 = -_1643;
    float _1669 = fma(_1667, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1659);
    float _1671 = fma(_1653, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1661);
    float _1673 = _1627 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1675 = fma(_1635, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1663);
    float _1677 = fma(_1669, -0.5, 0.5);
    float _1679 = fma(_1669, 0.5, 0.5);
    float _1681 = fma(_1635, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1673);
    float _1683 = exp2(_1655);
    float _1685 = _1641 + 1.0;
    float _1687 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1675);
    float _1689 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1681);
    float _1691 = fma(_1679, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1693 = 1.0 / _1671;
    float _1695 = fma(_1679, _1691, -0.212114393711090087890625);
    float _1697 = _1665 * 0.693147182464599609375;
    float _1699 = fma(_1679, _1695, 1.570728778839111328125);
    float _1701 = _1697 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1703 = sqrt(_1677);
    float _1705 = -_1641;
    float _1707 = fma(_1683, _1685, _1705);
    float _1709 = fma(_1653, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1689);
    float _1711 = fma(_1653, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1687);
    float _1713 = fma(_1707, 0.5, 0.5);
    float _1715 = _1709 * _1693;
    float _1717 = _1711 * _1693;
    float _1719 = fma(_1715, 0.5, 0.5);
    float _1721 = fma(_1717, -0.5, 0.5);
    float _1723 = _1703 * 0.636619746685028076171875;
    float3 _4518 = float3(_1719, _1721, _1701);
    float _1725 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4518, float3(0.0), isnan(_4518)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4518, float3(0.0), isnan(_4518)), level(0.0)).x;
    float3 _4529 = float3(_1719, _1721, _1701);
    float4 _1728 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4529, float3(0.0), isnan(_4529)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4529, float3(0.0), isnan(_4529)), level(0.0)).xyzw;
    float _1730 = _1728.x;
    float _1732 = _1728.y;
    float _1734 = _1728.z;
    float _1736 = _1728.w;
    float _1738 = -_1699;
    float _1740 = fma(_1723, _1738, 1.0);
    float2 _4551 = float2(_1740, _1713);
    float3 _1744 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4551, float2(0.0), isnan(_4551)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4551, float2(0.0), isnan(_4551)), level(0.0)).xyz;
    float _1746 = _1744.x;
    float _1748 = _1744.y;
    float _1750 = _1744.z;
    float _1752 = _1049 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _1754 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1756 = isnan(0.5);
    bool _1758 = _1754 || _1756;
    bool _1760 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1762 = _1758 || _1760;
    float _1764 = _1627 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_68.y = _1409;
    float _1766 = fma(_1053, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1752);
    float _1768 = _1049 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1770 = fma(_1635, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1764);
    float _1772 = fma(_1057, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1766);
    float _1774 = fma(_1053, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1768);
    float _1776 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1770);
    float _1778 = _1772 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1780 = fma(_1057, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1774);
    float _1782 = _1772;
    float _1784 = _1623;
    if (!_1762)
    {
        _257 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1786 = _257;
    float _1788 = _1623 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1790 = 1.0 / _1778;
    float _1792 = _1780 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    if (!_1762)
    {
        _1782 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1794 = _1782;
    float _1796 = fma(_1653, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1776);
    if (_1762)
    {
        _1784 = 1.0;
    }
    float _1798 = _1784;
    float _1800 = _1792 + _1778;
    float _1802 = _1798;
    if (!_1762)
    {
        float _1804 = -_1794;
        float _1806 = _1804 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1133 = _1806;
    }
    float _1808 = _1133;
    float _1810 = exp2(_1788);
    float _1812 = _1796 + _1671;
    float _1814 = _1800 * _1790;
    float _1816 = _1814 * 0.5;
    float _1818 = _1808;
    float _1820 = _1816;
    if (!_1762)
    {
        float _1822 = 1.0 / _1808;
        _1818 = _1822;
    }
    float _1824 = _1818;
    if (!_1762)
    {
        float _1826 = -_1786;
        float _1828 = fma(_1816, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1826);
        _1820 = _1828;
    }
    float _1830 = _1820;
    float _1832 = _1786;
    if (!_1762)
    {
        float _1834 = 1.0 / _1830;
        _1832 = _1834;
    }
    float _1836 = _1832;
    float _1838 = _1812 * 0.5;
    float _1840 = _1836;
    if (!_1762)
    {
        float _1842 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1844 = -_1794;
        float _1846 = fma(_1836, _1842, _1844);
        _1840 = _1846;
    }
    float _1848 = _1840;
    if (!_1762)
    {
        float _1850 = _1848 * _1824;
        float _1852 = precise::clamp(_1850, 0.0, 1.0);
        _1802 = _1852;
    }
    float _1854 = _1802;
    float _1856 = -_1810;
    float _1858 = _1856 + 1.0;
    float _1860 = _1854 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1862 = _1858 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _1864 = _1854 > 0.0;
    bool _1866 = isnan(_1854);
    bool _1868 = _1864 || _1866;
    bool _1870 = isnan(0.0);
    bool _1872 = _1868 || _1870;
    out.gl_Position.x = _1709;
    out.gl_Position.y = _1711;
    out.gl_Position.z = _1796;
    out.gl_Position.w = _1671;
    float _1874 = -_1862;
    float _1876 = _1874 + 1.0;
    float _1878 = _1860 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_70.z = _1838;
    out.m_70.w = _1671;
    out.m_45.x = _1878;
    float _1880 = _1862 * _1725;
    float _1882 = _1736 * _1880;
    float _1884 = _1736 * _1876;
    float _1886 = _1750 * _1880;
    float _1888 = fma(_1746, _1882, _1730);
    float _1890 = fma(_1748, _1882, _1732);
    float _1892 = fma(_1736, _1886, _1734);
    out.m_72.x = _1888;
    out.m_72.y = _1890;
    out.m_72.z = _1892;
    out.m_72.w = _1884;
    if (_1872)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _1894 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1894;
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
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
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
        float _1951 = as_type<float>(_107);
        out.gl_Position.z = _1951;
    }
    if (!_95)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _2020 = as_type<float>(_145);
        out.gl_Position.z = _2020;
    }
    if (_139)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _291 = _283 + _289;
    bool _293 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _295 = isnan(_283);
    bool _297 = _293 || _295;
    bool _299 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _301 = _297 || _299;
    float _303 = float(_301);
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _307 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _305;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _311 = _309 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _315 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _313;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _319 = _317 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _321 = 1.0 / _307;
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _325 = _283 + _323;
    bool _327 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _329 = 1.0 / _311;
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _333 = _283 + _331;
    float _335 = 1.0 / _315;
    float _337 = _325 * _321;
    float _339 = 1.0 / _319;
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
    float _367 = _291 * _335;
    float _369 = -_303;
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
    float _393 = _333 * _339;
    float _395 = -_365;
    float _397 = _395 + 1.0;
    float _399 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _401 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _399;
    bool _403 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _405 = isnan(_283);
    bool _407 = _403 || _405;
    bool _409 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _411 = _407 || _409;
    float _413 = float(_411);
    float _415 = _389 * _397;
    float _417 = -_389;
    float _419 = _417 + 1.0;
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _423 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _421;
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _427 = _425 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _429 = fma(_401, _337, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _431 = _413 * _419;
    float _433 = fma(_423, _337, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _437 = _435 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _439 = -_413;
    float _441 = _439 + 1.0;
    float _443 = _429 * _431;
    float _445 = _433 * _431;
    float _447 = fma(_437, _341, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _449 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _451 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _449;
    float _453 = fma(_441, (*spvDescriptorSet0.vp_c9)._m0[143].x, _443);
    float _455 = fma(_427, _341, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _457;
    float _461 = fma(_441, (*spvDescriptorSet0.vp_c9)._m0[143].y, _445);
    float _463 = fma(_451, _367, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _467 = _465 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _469 = fma(_447, _415, _453);
    float _471 = fma(_459, _367, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _475 = _473 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _477 = fma(_455, _415, _461);
    float _479 = fma(_467, _393, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _481 = fma(_463, _391, _469);
    float _483 = fma(_475, _393, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _485 = fma(_471, _391, _477);
    float _487 = fma(_479, _377, _481);
    float _489 = fma(_483, _377, _485);
    float _491 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[147].x, _487);
    float _493 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[147].y, _489);
    bool _495 = !_327;
    float _511;
    if (!_495)
    {
        float _497 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _499 = _147 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _501 = fma(_499, (*spvDescriptorSet0.vp_c9)._m0[11].z, _125);
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
    int _531 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _533 = _531 != 0;
    int _535 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _537 = _535 != 0;
    int _539 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _541 = _539 != 0;
    float _543 = in.m_54.x;
    float _545 = in.m_54.y;
    float _547 = in.m_54.z;
    bool _549 = _147 > 0.5;
    float _551 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _553 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _551;
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _557 = _555 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _559 = in.m_56.x;
    float _561 = in.m_56.y;
    float _563 = in.m_56.z;
    float _565 = floor(_529);
    float _567 = in.m_58.x;
    float _569 = in.m_58.y;
    float _571 = in.m_58.z;
    int _573 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _575 = _573 != 0;
    float _577 = in.m_49.z;
    float _579 = 1.0 / _553;
    int _581 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _583 = _581 != 0;
    float _585 = in.m_49.y;
    float _587 = 1.0 / _557;
    bool _589 = _565 > 0.0;
    float _591 = _525 * _545;
    bool _593 = _521 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _595 = isnan(_521);
    bool _597 = _593 || _595;
    bool _599 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _601 = _597 || _599;
    float _603 = float(_601);
    float _605 = _525 * _561;
    float _607 = fma(_523, _543, _591);
    float _609 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _611 = _525 * _569;
    float _613 = fma(_523, _559, _605);
    float _615 = fma(_527, _547, _607);
    float _617 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _619 = _521 + _617;
    float _621 = fma(_523, _567, _611);
    float _623 = fma(_527, _563, _613);
    float _625 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _627 = log2(_625);
    float _629 = _577 * 2.0;
    float _631 = fma(_527, _571, _621);
    float _633 = _585 * 2.0;
    float _635 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _637 = _521 + _635;
    float _639 = -_195;
    int _641 = _549 ? as_type<int>(_639) : as_type<int>(_195);
    float _643 = _619 * _587;
    bool _645 = _565 >= 0.0;
    bool _647 = isnan(_565);
    bool _649 = _645 || _647;
    bool _651 = isnan(0.0);
    bool _653 = _649 || _651;
    float _655 = floor(_629);
    float _657 = _637 * _579;
    float _659 = _147 + _585;
    float _661 = _585 + _577;
    int _663 = _653 ? 0 : 1;
    float _665 = _659 + (-1.0);
    float _667 = _627 * _125;
    float _669 = floor(_633);
    float _671 = _661 + (-1.0);
    bool _673 = _585 > 0.5;
    float _675 = _615 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _677 = _585 + (-0.5);
    float _679 = fma(_671, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _681 = !_575;
    float _683 = _681 ? _195 : as_type<float>(_641);
    float _685 = exp2(_667);
    float _687 = fma(_665, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _689 = ~_663;
    int _691 = _689 + 1;
    int _693 = _691 + 1;
    float _695 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _697 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _695;
    int _699 = _693;
    float _701 = _675;
    if (!_589)
    {
        int _703 = ~_663;
        int _705 = _703 + 1;
        _699 = _705;
    }
    int _707 = _699;
    float _709 = _683 + 0.5;
    bool _711 = _655 >= 0.0;
    bool _713 = isnan(_655);
    bool _715 = _711 || _713;
    bool _717 = isnan(0.0);
    bool _719 = _715 || _717;
    float _721 = fma(_697, _657, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _723 = _669 >= 0.0;
    bool _725 = isnan(_669);
    bool _727 = _723 || _725;
    bool _729 = isnan(0.0);
    bool _731 = _727 || _729;
    float _733 = _709 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _735 = _719 ? 0 : 1;
    bool _737 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _739 = isnan(0.0);
    bool _741 = _737 || _739;
    bool _743 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _745 = _741 || _743;
    int _747 = _731 ? 0 : 1;
    float _749 = -_685;
    float _751 = _749 + 1.0;
    bool _753 = _521 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _755 = isnan(_521);
    bool _757 = _753 || _755;
    bool _759 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _761 = _757 || _759;
    float _763 = float(_761);
    bool _765 = _655 > 0.0;
    float _767 = -_763;
    float _769 = _767 + 1.0;
    float _771 = _745 ? _751 : 0.0;
    float _773 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _775 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _773;
    bool _777 = _521 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _779 = isnan(_521);
    bool _781 = _777 || _779;
    bool _783 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _785 = _781 || _783;
    float _787 = float(_785);
    float _789 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _791 = 1.0 + _789;
    float _793 = -_175;
    int _795 = _673 ? as_type<int>(_793) : as_type<int>(_175);
    float _797 = fma(_775, _657, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    bool _799 = _669 > 0.0;
    float _801 = _787 * _769;
    float _803 = -_787;
    float _805 = _803 + 1.0;
    float _807 = 1.0 / _791;
    float _809 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _811 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _809;
    float _813 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _815 = _813 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _817 = _603 * _805;
    float _819 = -_603;
    float _821 = _819 + 1.0;
    float _823 = fma(_811, _657, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _825 = fma(_815, _643, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _827 = _721 * _817;
    float _829 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _831 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _833 = _831 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _835 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _837 = _835 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    bool _839 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _841 = isnan(1.0);
    bool _843 = _839 || _841;
    bool _845 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _847 = _843 || _845;
    float _849 = fma(_833, _643, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _851 = fma(_837, _643, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _853 = _797 * _817;
    bool _855 = !_583;
    float _857 = _855 ? _175 : as_type<float>(_795);
    int _859 = ~_747;
    int _861 = _859 + 1;
    int _863 = _861 + 1;
    float _865 = fma(_821, (*spvDescriptorSet0.vp_c9)._m0[123].x, _853);
    bool _867 = !_537;
    int _869 = _867 ? 0 : 1;
    float _871 = -_857;
    float _873 = _871 + 0.5;
    int _875 = _863;
    if (!_799)
    {
        int _877 = ~_747;
        int _879 = _877 + 1;
        _875 = _879;
    }
    int _881 = _875;
    float _883 = fma(_825, _801, _865);
    int _885 = abs(_869);
    float _887 = _733 * _829;
    float _889 = float(_707);
    if (_847)
    {
        float _891 = _771 * _807;
        _129 = _891;
    }
    float _893 = _129;
    float _895 = float(_885);
    float _897 = _823 * _817;
    bool _899 = !_541;
    int _901 = _899 ? 0 : 1;
    float _903 = _873 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _905 = !_533;
    int _907 = _905 ? 0 : 1;
    float _909 = _895 * _889;
    int _911 = abs(_901);
    float _913 = _623 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _915 = abs(_907);
    float _917 = fma(_821, (*spvDescriptorSet0.vp_c9)._m0[123].y, _897);
    float _919 = _903 * _609;
    float _921 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _923 = _913 + _921;
    float _925 = fma(_821, (*spvDescriptorSet0.vp_c9)._m0[123].z, _827);
    float _927 = _631 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _929 = fma(_849, _801, _917);
    float _931 = float(_915);
    float _933 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _935 = _675 + _933;
    float _937 = _923 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _939 = fma(_851, _801, _925);
    out.m_60.x = _887;
    out.m_60.y = _919;
    float _941 = fma(_763, (*spvDescriptorSet0.vp_c9)._m0[125].x, _883);
    float _943 = fma(_935, (*spvDescriptorSet0.vp_c8)._m0[28].x, _937);
    float _945 = fma(_763, (*spvDescriptorSet0.vp_c9)._m0[125].y, _929);
    float _947 = in.m_62.x;
    float _949 = in.m_62.y;
    float _951 = in.m_62.z;
    float _953 = fma(_763, (*spvDescriptorSet0.vp_c9)._m0[125].z, _939);
    int _955 = ~_735;
    int _957 = _955 + 1;
    int _959 = _957 + 1;
    int _961 = _959;
    if (!_765)
    {
        int _963 = ~_735;
        int _965 = _963 + 1;
        _961 = _965;
    }
    int _967 = _961;
    float _969 = float(_911);
    float _971 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _973 = _927 + _971;
    float _975 = float(_881);
    float _977 = float(_967);
    float _979 = fma(_973, (*spvDescriptorSet0.vp_c8)._m0[28].z, _943);
    float _981 = _923 * _923;
    float _983 = _969 * _975;
    float _985 = _931 * _977;
    float _987 = fma(_935, _935, _981);
    bool _989 = _979 >= 0.0;
    float _991 = _909 * (-2.0);
    float _993 = _945 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _995 = fma(_973, _973, _987);
    float _997 = fma(_679, _991, _679);
    float _999 = _941 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1001 = fma(_991, _949, _949);
    float _1003 = rsqrt(_995);
    float _1005 = _953 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1007 = fma(_677, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1001);
    float _1009 = _999 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1011 = _987;
    if (_989)
    {
        _1011 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1013 = _1011;
    float _1015 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1017 = _985 * (-2.0);
    float _1019 = _993 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1021 = _1005 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1023 = as_type<int>(_1013);
    if (_989)
    {
        float _1025 = _1013 * 5.0;
        _1023 = as_type<int>(_1025);
    }
    int _1027 = _1023;
    float _1029 = fma(_687, _1017, _687);
    if (_989)
    {
        out.m_45.x = 0.0;
    }
    float _1031 = fma(_1017, _947, _947);
    float _1033 = fma(_997, _893, _1007);
    float _1035 = _147 + (-0.5);
    float _1037 = _923 * _1003;
    out.m_64.x = _1009;
    out.m_64.y = _1019;
    out.m_64.z = _1021;
    out.m_64.w = _1015;
    float _1039 = _935 * _1003;
    float _1041 = _973 * _1003;
    float _1043 = -_1037;
    float _1045 = fma(_1043, (*spvDescriptorSet0.vp_c9)._m0[18].w, _923);
    if (_989)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3403 = as_type<float>(_1027);
        out.gl_Position.z = _3403;
    }
    if (_989)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1047 = -_1037;
    float _1049 = fma(_1047, (*spvDescriptorSet0.vp_c9)._m0[18].w, _913);
    float _1051 = -_1039;
    float _1053 = fma(_1051, (*spvDescriptorSet0.vp_c9)._m0[18].w, _675);
    float _1055 = -_1041;
    float _1057 = fma(_1055, (*spvDescriptorSet0.vp_c9)._m0[18].w, _927);
    float _1059 = -_1039;
    float _1061 = fma(_1059, (*spvDescriptorSet0.vp_c9)._m0[18].w, _935);
    float _1063 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1065 = _1049 + _1063;
    float _1067 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1069 = _1053 + _1067;
    float _1071 = _1045 * _1045;
    float _1073 = fma(_1035, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1031);
    float _1075 = _1065 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1077 = _147 + _577;
    float _1079 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1081 = _1057 + _1079;
    float _1083 = fma(_1061, _1061, _1071);
    float _1085 = fma(_1069, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1075);
    float _1087 = -_1041;
    float _1089 = fma(_1087, (*spvDescriptorSet0.vp_c9)._m0[18].w, _973);
    float _1091 = fma(_1029, _893, _1073);
    float _1093 = _1077 + (-1.0);
    float _1095 = _983 * (-2.0);
    float _1097 = fma(_1081, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1085);
    float _1099 = fma(_1089, _1089, _1083);
    float _1101 = in.m_66.x;
    float _1103 = in.m_66.y;
    float _1105 = fma(_1093, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1107 = fma(_1095, _951, _951);
    float _1109 = _577 + (-0.5);
    bool _1111 = _1097 >= 0.0;
    float _1113 = fma(_1105, _1095, _1105);
    float _1115 = _1033 * 0.15915493667125701904296875;
    float _1117 = fma(_1109, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1107);
    float _1119 = sqrt(_1099);
    float _1121 = _1091 * 0.15915493667125701904296875;
    float _1123 = fma(_1113, _893, _1117);
    float _1125 = _1123 * 0.15915493667125701904296875;
    float _1127 = _1115 * 6.283185482025146484375;
    float _1129 = sin(_1127);
    float _1131 = _1107;
    float _1133 = _1049;
    if (_1111)
    {
        _1131 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1135 = _1131;
    int _1137 = as_type<int>(_1135);
    if (_1111)
    {
        out.m_45.x = 0.0;
    }
    if (_1111)
    {
        float _1139 = _1135 * 5.0;
        _1137 = as_type<int>(_1139);
    }
    int _1141 = _1137;
    float _1143 = _1115 * 6.283185482025146484375;
    float _1145 = cos(_1143);
    float _1147 = _493 * _1103;
    float _1149 = _1003 * _1119;
    if (_1111)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3583 = as_type<float>(_1141);
        out.gl_Position.z = _3583;
    }
    float _1151 = _253 * _1147;
    float _1153 = _1121 * 6.283185482025146484375;
    float _1155 = sin(_1153);
    float _1157 = _1121 * 6.283185482025146484375;
    float _1159 = cos(_1157);
    float _1161 = _1125 * 6.283185482025146484375;
    float _1163 = sin(_1161);
    if (_1111)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1165 = _1125 * 6.283185482025146484375;
    float _1167 = cos(_1165);
    float _1169 = _1151 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1171 = _491 * _1101;
    float _1173 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _175);
    float _1175 = _1155 * _1129;
    float _1177 = _1149 * _1169;
    float _1179 = _253 * _1171;
    float _1181 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _195);
    float _1183 = _1173 * _1177;
    float _1185 = _1179 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1187 = _1159 * _1145;
    float _1189 = _1159 * _1129;
    bool _1191 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1193 = isnan(0.5);
    bool _1195 = _1191 || _1193;
    bool _1197 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1199 = _1195 || _1197;
    float _1201 = _1149 * _1185;
    float _1203 = fma(_1163, _1187, _1175);
    float _1205 = _1167 * _1183;
    float _1207 = _1129 * _1167;
    float _1209 = _1181 * _1201;
    float _1211 = _1145 * _1167;
    float _1213 = _1159 * _1205;
    float _1215 = _1155 * _1145;
    float _1217 = -_1183;
    float _1219 = _1163 * _1217;
    float _1221 = fma(_1163, _1175, _1187);
    float _1223 = fma(_1203, _1209, _1213);
    float _1225 = _1149 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1227 = _1225 * 0.5;
    float _1229 = -_1215;
    float _1231 = fma(_1163, _1189, _1229);
    float _1233 = -_1189;
    float _1235 = fma(_1163, _1215, _1233);
    float _1237 = _1155 * _1205;
    float _1239 = fma(_1211, _1209, _1219);
    float _1241 = fma(_1231, _1227, _1223);
    float _1243 = fma(_1235, _1209, _1237);
    float _1245 = fma(_1207, _1227, _1239);
    float _1247 = _1241 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1249 = _1241 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1251 = fma(_1221, _1227, _1243);
    float _1253 = _1241 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1255 = fma(_1245, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1247);
    float _1257 = fma(_1245, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1249);
    float _1259 = fma(_1245, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1253);
    float _1261 = fma(_1251, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1255);
    float _1263 = fma(_1251, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1257);
    float _1265 = fma(_1251, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1259);
    float _1267 = _1261 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1269 = _1263 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1271 = _1265 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1273 = _927 + _1267;
    float _1275 = _675 + _1269;
    float _1277 = _913 + _1271;
    float _1279 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1281 = _1273 + _1279;
    float _1283 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1285 = _1275 + _1283;
    float _1287 = _1281 * _1281;
    float _1289 = fma(_1285, _1285, _1287);
    float _1291 = sqrt(_1289);
    bool _1293 = _1291 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1295 = _1269;
    float _1297 = _1247;
    float _1299 = _1275;
    if (!_1293)
    {
        _1295 = _1273;
    }
    float _1301 = _1295;
    float _1303 = _1301;
    if (!_1293)
    {
        _1297 = _1277;
    }
    float _1305 = _1297;
    bool _1307 = !_1293;
    float _1309 = _1305;
    if (!_1307)
    {
        float _1311 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1313 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1315 = _1291 + _1313;
        float _1317 = rsqrt(_1289);
        float _1319 = _1315 * _1311;
        float _1321 = _1277 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1323 = _1319 * 0.15915493667125701904296875;
        float _1325 = _1323 * 6.283185482025146484375;
        float _1327 = sin(_1325);
        float _1329 = _1323 * 6.283185482025146484375;
        float _1331 = cos(_1329);
        float _1333 = fma(_1327, _1321, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1335 = _1317 * _1333;
        float _1337 = _1331 + (-1.0);
        float _1339 = fma(_1285, _1335, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1341 = fma(_1281, _1335, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1343 = _1337 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1345 = fma(_1277, _1331, _1343);
        _1299 = _1339;
        _1309 = _1345;
        _1303 = _1341;
    }
    float _1347 = _1299;
    float _1349 = _1309;
    float _1351 = _1303;
    float _1353 = -_1039;
    float _1355 = fma(_1353, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1347);
    float _1357 = -_1037;
    float _1359 = fma(_1357, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1349);
    float _1361 = -_1041;
    float _1363 = fma(_1361, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1351);
    float _1365 = _1359;
    float _1367 = _1355;
    float _1369 = _1363;
    float _1371 = _1347;
    if (!_1199)
    {
        float _1373 = _1065 * _1065;
        float _1375 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1377 = -_675;
        float _1379 = _1377 + _1347;
        float _1381 = -_913;
        float _1383 = _1381 + _1349;
        float _1385 = fma(_1069, _1069, _1373);
        float _1387 = -_927;
        float _1389 = _1387 + _1351;
        float _1391 = fma(_1081, _1081, _1385);
        float _1393 = 1.0 / _1149;
        float _1395 = sqrt(_1391);
        float _1397 = precise::min(_1395, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1399 = _1397 * _1375;
        float _1401 = _1399 * _1393;
        float _1403 = fma(_1379, _1401, _1053);
        float _1405 = fma(_1383, _1401, _1049);
        float _1407 = fma(_1389, _1401, _1057);
        _1365 = _1405;
        _1367 = _1403;
        _1369 = _1407;
        _1371 = _1379;
    }
    float _1409 = _1365;
    float _1411 = _1367;
    float _1413 = _1369;
    float _1415 = _1371;
    float _1417 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1419 = _1409 + _1417;
    float _1421 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1423 = _1411 + _1421;
    float _1425 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1427 = _1413 + _1425;
    float _1429 = _1419 * _1419;
    float _1431 = fma(_1423, _1423, _1429);
    float _1433 = fma(_1427, _1427, _1431);
    float _1435 = rsqrt(_1433);
    float _1437 = sqrt(_1433);
    float _1439 = _1435 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1441 = _1423 * _1439;
    float _1443 = _1427 * _1439;
    float _1445 = _1441 * _1441;
    float _1447 = _1443 * _1443;
    float _1449 = _1445 + _1447;
    float _1451 = sqrt(_1449);
    bool _1453 = _1451 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1455 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1457 = _1451 + _1455;
    float _1459 = _1435;
    float _1461 = _1457;
    float _1463 = _1415;
    float _1465 = _1419;
    float _1467 = _1441;
    if (_1453)
    {
        float _1469 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1459 = _1469;
    }
    float _1471 = _1459;
    float _1473 = _1471;
    if (_1453)
    {
        float _1475 = _1457 * _1471;
        _1461 = _1475;
    }
    float _1477 = _1461;
    if (_1453)
    {
        float _1479 = rsqrt(_1449);
        _1473 = _1479;
    }
    float _1481 = _1473;
    float _1483 = _1481;
    if (_1453)
    {
        float _1485 = _1477 * 0.15915493667125701904296875;
        _1463 = _1485;
    }
    float _1487 = _1463;
    float _1489 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1491 = _1427;
    float _1493 = _1487;
    if (_1453)
    {
        float _1495 = _1487 * 6.283185482025146484375;
        float _1497 = sin(_1495);
        _1491 = _1497;
    }
    float _1499 = _1491;
    float _1501 = precise::max(0.0, _1489);
    float _1503 = _1281;
    float _1505 = _1501;
    if (_1453)
    {
        float _1507 = _1487 * 6.283185482025146484375;
        float _1509 = cos(_1507);
        _1503 = _1509;
    }
    float _1511 = _1503;
    float _1513 = -_1439;
    float _1515 = -_1501;
    float _1517 = fma(_1419, _1513, _1515);
    if (_1453)
    {
        float _1519 = _1517 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1465 = _1519;
    }
    float _1521 = _1465;
    float _1523 = _1499;
    float _1525 = _1521;
    if (_1453)
    {
        float _1527 = fma(_1499, _1521, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1523 = _1527;
    }
    float _1529 = _1523;
    float _1531 = _1529;
    if (!_1453)
    {
        _1525 = _1447;
    }
    float _1533 = _1525;
    float _1535 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1537 = _1533;
    if (_1453)
    {
        float _1539 = _1481 * _1529;
        _701 = _1539;
    }
    float _1541 = _701;
    if (!_1453)
    {
        _1483 = _1517;
    }
    float _1543 = _1483;
    float _1545 = _1543;
    if (_1453)
    {
        float _1547 = _1511 + (-1.0);
        _1505 = _1547;
    }
    float _1549 = _1505;
    float _1551 = _1549;
    if (_1453)
    {
        float _1553 = _1441 * _1541;
        _1467 = _1553;
    }
    float _1555 = _1467;
    if (!_1453)
    {
        _1531 = _1443;
    }
    float _1557 = _1531;
    float _1559 = _1557;
    if (_1453)
    {
        float _1561 = _1443 * _1541;
        _1559 = _1561;
    }
    float _1563 = _1559;
    if (_1453)
    {
        float _1565 = _1549 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1493 = _1565;
    }
    float _1567 = _1493;
    if (!_1453)
    {
        _1551 = _1445;
    }
    float _1569 = _1551;
    float _1571 = _1569;
    if (_1453)
    {
        float _1573 = _1555 * _1555;
        _1571 = _1573;
    }
    float _1575 = _1571;
    if (_1453)
    {
        float _1577 = _1563 * _1563;
        _1537 = _1577;
    }
    float _1579 = _1537;
    if (_1453)
    {
        float _1581 = fma(_1517, _1511, _1567);
        _1545 = _1581;
    }
    float _1583 = _1545;
    float _1585 = fma(_1583, _1583, _1575);
    float _1587 = _1409 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1589 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1591 = fma(_1437, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1589);
    float _1593 = precise::clamp(_1591, 0.0, 1.0);
    float _1595 = _1409 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1597 = _1585 + _1579;
    float _1599 = fma(_1411, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1587);
    float _1601 = _1409 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1603 = -_1593;
    float _1605 = _1603 + 1.0;
    float _1607 = rsqrt(_1597);
    float _1609 = fma(_1413, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1599);
    float _1611 = fma(_1411, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1601);
    float _1613 = _1409 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1615 = _1609 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1617 = fma(_1413, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1611);
    float _1619 = fma(_1411, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1613);
    float _1621 = abs(_1605);
    float _1623 = log2(_1621);
    float _1625 = fma(_1411, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1595);
    float _1627 = _1617 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1629 = fma(_1413, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1619);
    float _1631 = _1615 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1633 = fma(_1413, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1625);
    float _1635 = _1629 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1637 = _1607 * _1555;
    float _1639 = _1627 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1641 = _1607 * _1583;
    float _1643 = _1607 * _1563;
    float _1645 = _1637 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1647 = fma(_1635, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1639);
    float _1649 = -_1631;
    float _1651 = fma(_1649, _1535, 1.0);
    float _1653 = _1633 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1655 = _1623 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1657 = -_1645;
    float _1659 = fma(_1641, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1657);
    float _1661 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1647);
    float _1663 = _1627 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1665 = log2(_1651);
    float _1667 = -_1643;
    float _1669 = fma(_1667, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1659);
    float _1671 = fma(_1653, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1661);
    float _1673 = _1627 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1675 = fma(_1635, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1663);
    float _1677 = fma(_1669, -0.5, 0.5);
    float _1679 = fma(_1669, 0.5, 0.5);
    float _1681 = fma(_1635, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1673);
    float _1683 = exp2(_1655);
    float _1685 = _1641 + 1.0;
    float _1687 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1675);
    float _1689 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1681);
    float _1691 = fma(_1679, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1693 = 1.0 / _1671;
    float _1695 = fma(_1679, _1691, -0.212114393711090087890625);
    float _1697 = _1665 * 0.693147182464599609375;
    float _1699 = fma(_1679, _1695, 1.570728778839111328125);
    float _1701 = _1697 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1703 = sqrt(_1677);
    float _1705 = -_1641;
    float _1707 = fma(_1683, _1685, _1705);
    float _1709 = fma(_1653, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1689);
    float _1711 = fma(_1653, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1687);
    float _1713 = fma(_1707, 0.5, 0.5);
    float _1715 = _1709 * _1693;
    float _1717 = _1711 * _1693;
    float _1719 = fma(_1715, 0.5, 0.5);
    float _1721 = fma(_1717, -0.5, 0.5);
    float _1723 = _1703 * 0.636619746685028076171875;
    float3 _4518 = float3(_1719, _1721, _1701);
    float _1725 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4518, float3(0.0), isnan(_4518)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4518, float3(0.0), isnan(_4518)), level(0.0)).x;
    float3 _4529 = float3(_1719, _1721, _1701);
    float4 _1728 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4529, float3(0.0), isnan(_4529)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4529, float3(0.0), isnan(_4529)), level(0.0)).xyzw;
    float _1730 = _1728.x;
    float _1732 = _1728.y;
    float _1734 = _1728.z;
    float _1736 = _1728.w;
    float _1738 = -_1699;
    float _1740 = fma(_1723, _1738, 1.0);
    float2 _4551 = float2(_1740, _1713);
    float3 _1744 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4551, float2(0.0), isnan(_4551)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4551, float2(0.0), isnan(_4551)), level(0.0)).xyz;
    float _1746 = _1744.x;
    float _1748 = _1744.y;
    float _1750 = _1744.z;
    float _1752 = _1049 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _1754 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1756 = isnan(0.5);
    bool _1758 = _1754 || _1756;
    bool _1760 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1762 = _1758 || _1760;
    float _1764 = _1627 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_68.y = _1409;
    float _1766 = fma(_1053, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1752);
    float _1768 = _1049 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1770 = fma(_1635, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1764);
    float _1772 = fma(_1057, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1766);
    float _1774 = fma(_1053, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1768);
    float _1776 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1770);
    float _1778 = _1772 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1780 = fma(_1057, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1774);
    float _1782 = _1772;
    float _1784 = _1623;
    if (!_1762)
    {
        _257 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1786 = _257;
    float _1788 = _1623 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1790 = 1.0 / _1778;
    float _1792 = _1780 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    if (!_1762)
    {
        _1782 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1794 = _1782;
    float _1796 = fma(_1653, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1776);
    if (_1762)
    {
        _1784 = 1.0;
    }
    float _1798 = _1784;
    float _1800 = _1792 + _1778;
    float _1802 = _1798;
    if (!_1762)
    {
        float _1804 = -_1794;
        float _1806 = _1804 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1133 = _1806;
    }
    float _1808 = _1133;
    float _1810 = exp2(_1788);
    float _1812 = _1796 + _1671;
    float _1814 = _1800 * _1790;
    float _1816 = _1814 * 0.5;
    float _1818 = _1808;
    float _1820 = _1816;
    if (!_1762)
    {
        float _1822 = 1.0 / _1808;
        _1818 = _1822;
    }
    float _1824 = _1818;
    if (!_1762)
    {
        float _1826 = -_1786;
        float _1828 = fma(_1816, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1826);
        _1820 = _1828;
    }
    float _1830 = _1820;
    float _1832 = _1786;
    if (!_1762)
    {
        float _1834 = 1.0 / _1830;
        _1832 = _1834;
    }
    float _1836 = _1832;
    float _1838 = _1812 * 0.5;
    float _1840 = _1836;
    if (!_1762)
    {
        float _1842 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1844 = -_1794;
        float _1846 = fma(_1836, _1842, _1844);
        _1840 = _1846;
    }
    float _1848 = _1840;
    if (!_1762)
    {
        float _1850 = _1848 * _1824;
        float _1852 = precise::clamp(_1850, 0.0, 1.0);
        _1802 = _1852;
    }
    float _1854 = _1802;
    float _1856 = -_1810;
    float _1858 = _1856 + 1.0;
    float _1860 = _1854 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1862 = _1858 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _1864 = _1854 > 0.0;
    bool _1866 = isnan(_1854);
    bool _1868 = _1864 || _1866;
    bool _1870 = isnan(0.0);
    bool _1872 = _1868 || _1870;
    out.gl_Position.x = _1709;
    out.gl_Position.y = _1711;
    out.gl_Position.z = _1796;
    out.gl_Position.w = _1671;
    float _1874 = -_1862;
    float _1876 = _1874 + 1.0;
    float _1878 = _1860 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_70.z = _1838;
    out.m_70.w = _1671;
    out.m_45.x = _1878;
    float _1880 = _1862 * _1725;
    float _1882 = _1736 * _1880;
    float _1884 = _1736 * _1876;
    float _1886 = _1750 * _1880;
    float _1888 = fma(_1746, _1882, _1730);
    float _1890 = fma(_1748, _1882, _1732);
    float _1892 = fma(_1736, _1886, _1734);
    out.m_72.x = _1888;
    out.m_72.y = _1890;
    out.m_72.z = _1892;
    out.m_72.w = _1884;
    if (_1872)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _1894 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1894;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

