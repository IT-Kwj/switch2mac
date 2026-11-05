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
    float4 m_66 [[user(locn1)]];
    float4 m_52 [[user(locn2)]];
    float4 m_70 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_68 [[user(locn5)]];
    float4 m_72 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_60 [[attribute(1)]];
    float4 m_62 [[attribute(2)]];
    float4 m_56 [[attribute(3)]];
    float4 m_42 [[attribute(5)]];
    float4 m_47 [[attribute(6)]];
    float4 m_54 [[attribute(7)]];
    float4 m_58 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _191 = false;
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
    if (!_95)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1244 = as_type<float>(_107);
        out.gl_Position.z = _1244;
    }
    if (!_95)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _109 = in.m_47.w;
    bool _111 = _109 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _113 = isnan(_109);
    bool _115 = _111 || _113;
    bool _117 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _119 = _115 || _117;
    float _121 = -_109;
    float _123 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _125 = 0.0;
    if (_119)
    {
        float _127 = float(_91);
        _125 = _127;
    }
    float _129 = _125;
    bool _131 = _123 >= _129;
    bool _133 = !_119;
    bool _135 = _131 || _133;
    if (_135)
    {
        _101 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _137 = _101;
    if (_135)
    {
        out.m_45.x = 0.0;
    }
    int _139 = 0;
    if (_135)
    {
        float _141 = _137 * 5.0;
        _139 = as_type<int>(_141);
    }
    int _143 = _139;
    if (_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1312 = as_type<float>(_143);
        out.gl_Position.z = _1312;
    }
    if (_135)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _145 = in.m_42.x;
    float _147 = in.m_42.y;
    float _149 = in.m_42.z;
    float _151 = as_type<float>(int(gl_VertexIndex));
    out.m_52.x = _145;
    out.m_52.y = _147;
    out.m_52.z = _149;
    int _153 = as_type<int>(_151) & 1;
    bool _155 = _153 != 0;
    int _157 = as_type<int>(_151) & 2;
    bool _159 = _157 != 0;
    bool _161 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _163 = !_155;
    float _165 = _163 ? (-0.5) : 0.5;
    bool _167 = !_159;
    float _169 = _167 ? (-0.5) : 0.5;
    bool _171 = !_161;
    float _189;
    if (!_171)
    {
        float _173 = in.m_54.x;
        float _175 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _177 = _173 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _179 = fma(_177, (*spvDescriptorSet0.vp_c9)._m0[12].x, _123);
        float _181 = _179 * _175;
        float _183 = floor(_181);
        float _185 = -_183;
        float _187 = _181 + _185;
        _189 = _187;
        _191 = true;
    }
    else
    {
        float _193 = float(_91);
        float _195 = 1.0 / _193;
        float _197 = _123 * _195;
        _189 = _197;
    }
    _191 = false;
    float _199 = _189;
    float _201 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _203 = _199 + _201;
    float _205 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _207 = _199 + _205;
    bool _209 = _199 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _211 = isnan(_199);
    bool _213 = _209 || _211;
    bool _215 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _217 = _213 || _215;
    float _219 = float(_217);
    float _221 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _223 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _221;
    float _225 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _227 = _225 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _229 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _231 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _229;
    float _233 = -_219;
    float _235 = _233 + 1.0;
    float _237 = 1.0 / _223;
    float _239 = in.m_56.x;
    float _241 = in.m_56.y;
    float _243 = in.m_56.z;
    float _245 = in.m_56.w;
    float _247 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _249 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _247;
    bool _251 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _253 = isnan(0.5);
    bool _255 = _251 || _253;
    bool _257 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _259 = _255 || _257;
    bool _261 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _263 = isnan(0.5);
    bool _265 = _261 || _263;
    bool _267 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _269 = _265 || _267;
    float _271 = 1.0 / _227;
    float _273 = 1.0 / _231;
    float _275 = _203 * _237;
    bool _277 = _199 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _279 = isnan(_199);
    bool _281 = _277 || _279;
    bool _283 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _285 = _281 || _283;
    float _287 = float(_285);
    bool _289 = _199 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _291 = isnan(_199);
    bool _293 = _289 || _291;
    bool _295 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _297 = _293 || _295;
    float _299 = float(_297);
    float _301 = _287 * _235;
    float _303 = _207 * _271;
    float _305 = -_287;
    float _307 = _305 + 1.0;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _311 = _199 + _309;
    bool _313 = _199 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _315 = isnan(_199);
    bool _317 = _313 || _315;
    bool _319 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _321 = _317 || _319;
    float _323 = float(_321);
    float _325 = _299 * _307;
    float _327 = -_299;
    float _329 = _327 + 1.0;
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _333 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _331;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _337 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _335;
    float _339 = _311 * _273;
    float _341 = _323 * _329;
    float _343 = fma(_333, _275, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _347 = _345 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _349 = fma(_337, _275, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _351 = -_323;
    float _353 = _351 + 1.0;
    float _355 = _343 * _341;
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _359 = _357 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _361 = in.m_58.x;
    float _363 = in.m_58.y;
    float _365 = fma(_347, _303, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _367 = fma(_353, (*spvDescriptorSet0.vp_c9)._m0[143].y, _355);
    float _369 = _349 * _341;
    float _371 = fma(_359, _303, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _373 = fma(_249, _339, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _375 = fma(_365, _325, _367);
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _377;
    float _381 = in.m_60.x;
    float _383 = in.m_60.y;
    float _385 = in.m_60.z;
    float _387 = in.m_60.w;
    float _389 = fma(_353, (*spvDescriptorSet0.vp_c9)._m0[143].x, _369);
    float _391 = fma(_373, _301, _375);
    float _393 = fma(_379, _339, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _395 = in.m_62.x;
    float _397 = in.m_62.y;
    float _399 = in.m_62.z;
    float _401 = in.m_62.w;
    float _403 = fma(_371, _325, _389);
    float _405 = fma(_219, (*spvDescriptorSet0.vp_c9)._m0[146].y, _391);
    float _407 = fma(_393, _301, _403);
    float _409 = _147 * _241;
    float _411 = fma(_219, (*spvDescriptorSet0.vp_c9)._m0[146].x, _407);
    float _413 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _169);
    float _415 = fma(_145, _239, _409);
    float _417 = _405 * _363;
    float _419 = _411 * _361;
    float _421 = fma(_149, _243, _415);
    float _423 = _417 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _425 = _419 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _427 = _421 + _245;
    float _429 = _423 * _413;
    float _431 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _165);
    float _433 = _147 * _383;
    float _435 = _147 * _397;
    float _437 = _425 * _431;
    float _439 = _429 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _441 = _429 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _443 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _445 = fma(_145, _381, _433);
    float _447 = fma(_437, (*spvDescriptorSet0.vp_c8)._m0[26].x, _439);
    float _449 = fma(_437, (*spvDescriptorSet0.vp_c8)._m0[24].x, _441);
    float _451 = fma(_145, _395, _435);
    float _453 = fma(_149, _385, _445);
    float _455 = fma(_443, (*spvDescriptorSet0.vp_c8)._m0[26].z, _447);
    float _457 = fma(_443, (*spvDescriptorSet0.vp_c8)._m0[24].z, _449);
    float _459 = fma(_149, _399, _451);
    float _461 = _453 + _387;
    float _463 = _455 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _465 = _457 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _467 = _459 + _401;
    float _469 = _427 + _463;
    float _471 = _461 + _465;
    float _473 = _467 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _475 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _477 = _469 + _475;
    float _479 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _481 = _471 + _479;
    float _483 = fma(_461, (*spvDescriptorSet0.vp_c8)._m0[11].x, _473);
    float _485 = _477 * _477;
    float _487 = fma(_481, _481, _485);
    float _489 = fma(_427, (*spvDescriptorSet0.vp_c8)._m0[11].z, _483);
    float _491 = _467 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _493 = sqrt(_487);
    float _495 = _489 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _497 = fma(_461, (*spvDescriptorSet0.vp_c8)._m0[10].x, _491);
    float _499 = _429 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _501 = fma(_427, (*spvDescriptorSet0.vp_c8)._m0[10].z, _497);
    float _503 = fma(_437, (*spvDescriptorSet0.vp_c8)._m0[25].x, _499);
    float _505 = 1.0 / _495;
    float _507 = _501 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _509 = fma(_443, (*spvDescriptorSet0.vp_c8)._m0[25].z, _503);
    float _511 = _507 + _495;
    float _513 = _509 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _515 = _493 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _517 = _467 + _513;
    float _519 = _511 * _505;
    float _521 = _519 * 0.5;
    float _523 = _505;
    float _525 = _495;
    float _527 = _511;
    float _529 = _493;
    float _531 = _471;
    float _533 = _517;
    float _535 = _429;
    if (!_515)
    {
        _523 = _471;
    }
    float _537 = _523;
    float _539 = _537;
    if (!_515)
    {
        _525 = _469;
    }
    float _541 = _525;
    float _543 = _541;
    if (!_515)
    {
        _527 = _517;
    }
    float _545 = _527;
    bool _547 = !_515;
    float _549 = _545;
    if (!_547)
    {
        float _551 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _553 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _555 = _493 + _553;
        float _557 = rsqrt(_487);
        float _559 = _555 * _551;
        float _561 = _517 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _563 = _559 * 0.15915493667125701904296875;
        float _565 = _563 * 6.283185482025146484375;
        float _567 = cos(_565);
        float _569 = _563 * 6.283185482025146484375;
        float _571 = sin(_569);
        float _573 = _567 + (-1.0);
        float _575 = _573 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _577 = fma(_571, _561, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _579 = fma(_517, _567, _575);
        float _581 = _557 * _577;
        float _583 = fma(_481, _581, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _585 = fma(_477, _581, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _549 = _579;
        _539 = _583;
        _543 = _585;
        _529 = _563;
    }
    float _587 = _549;
    float _589 = _539;
    float _591 = _543;
    float _593 = _529;
    float _595 = _593;
    float _597 = _587;
    float _599 = _589;
    float _601 = _591;
    if (_269)
    {
        _595 = 1.0;
    }
    float _603 = _595;
    float _605 = _603;
    if (!_259)
    {
        float _607 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _609 = _467 + _607;
        float _611 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _613 = _461 + _611;
        float _615 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _617 = -_467;
        float _619 = _617 + _587;
        float _621 = _609 * _609;
        float _623 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _625 = _427 + _623;
        float _627 = fma(_613, _613, _621);
        float _629 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _631 = fma(_625, _625, _627);
        float _633 = sqrt(_631);
        float _635 = _615 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _637 = precise::min(_633, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _639 = _637 * _629;
        float _641 = -_461;
        float _643 = _641 + _589;
        float _645 = _635 * _639;
        float _647 = -_427;
        float _649 = _647 + _591;
        float _651 = fma(_643, _645, _461);
        float _653 = fma(_619, _645, _467);
        float _655 = fma(_649, _645, _427);
        _531 = _615;
        _597 = _653;
        _599 = _651;
        _601 = _655;
    }
    float _657 = _531;
    float _659 = _597;
    float _661 = _599;
    float _663 = _601;
    float _665 = _657;
    if (!_269)
    {
        float _667 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _669 = _667 * 0.15915493667125701904296875;
        float _671 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _673 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _675 = fma(_521, (*spvDescriptorSet0.vp_c8)._m0[30].w, _673);
        float _677 = _669 * 6.283185482025146484375;
        float _679 = cos(_677);
        float _681 = _671 * 0.15915493667125701904296875;
        float _683 = _669 * 6.283185482025146484375;
        float _685 = sin(_683);
        float _687 = 1.0 / _679;
        float _689 = _681 * 6.283185482025146484375;
        float _691 = cos(_689);
        float _693 = _685 * _687;
        float _695 = _681 * 6.283185482025146484375;
        float _697 = sin(_695);
        float _699 = _691 * _693;
        float _701 = 1.0 / _675;
        float _703 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _705 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _703;
        float _707 = 1.0 / _699;
        float _709 = 1.0 / _705;
        float _711 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _713 = _701 * _711;
        float _715 = _697 * _707;
        float _717 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _719 = fma(_715, _713, _717);
        float _721 = _719 * _709;
        float _723 = precise::clamp(_721, 0.0, 1.0);
        _665 = _709;
        _605 = _723;
    }
    float _725 = _665;
    float _727 = _605;
    float _729 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _731 = _659 + _729;
    float _733 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _735 = _661 + _733;
    float _737 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _739 = _663 + _737;
    float _741 = _731 * _731;
    float _743 = fma(_735, _735, _741);
    float _745 = fma(_739, _739, _743);
    float _747 = rsqrt(_745);
    float _749 = _747 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _751 = _735 * _749;
    float _753 = _739 * _749;
    float _755 = _751 * _751;
    float _757 = _753 * _753;
    float _759 = _755 + _757;
    float _761 = sqrt(_759);
    bool _763 = _761 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _765 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _767 = _761 + _765;
    float _769 = _739;
    float _771 = _725;
    float _773 = _767;
    float _775 = _751;
    if (_763)
    {
        float _777 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _769 = _777;
    }
    float _779 = _769;
    if (_763)
    {
        float _781 = rsqrt(_759);
        _771 = _781;
    }
    float _783 = _771;
    float _785 = _783;
    if (_763)
    {
        float _787 = _767 * _779;
        _773 = _787;
    }
    float _789 = _773;
    if (_763)
    {
        float _791 = _789 * 0.15915493667125701904296875;
        _533 = _791;
    }
    float _793 = _533;
    float _795 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _797 = _747;
    if (_763)
    {
        float _799 = _793 * 6.283185482025146484375;
        float _801 = sin(_799);
        _797 = _801;
    }
    float _803 = _797;
    float _805 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _807 = precise::max(0.0, _805);
    float _809 = _741;
    float _811 = _807;
    float _813 = _805;
    if (_763)
    {
        float _815 = _793 * 6.283185482025146484375;
        float _817 = cos(_815);
        _809 = _817;
    }
    float _819 = _809;
    float _821 = -_749;
    float _823 = -_807;
    float _825 = fma(_731, _821, _823);
    if (_763)
    {
        float _827 = _825 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _811 = _827;
    }
    float _829 = _811;
    float _831 = sqrt(_745);
    float _833 = _659 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _835 = _829;
    float _837 = _803;
    if (_763)
    {
        float _839 = fma(_803, _829, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _835 = _839;
    }
    float _841 = _835;
    float _843 = _841;
    if (!_763)
    {
        _837 = _753;
    }
    float _845 = _837;
    float _847 = fma(_661, (*spvDescriptorSet0.vp_c8)._m0[0].x, _833);
    float _849 = _845;
    if (_763)
    {
        float _851 = _819 + (-1.0);
        _813 = _851;
    }
    float _853 = _813;
    float _855 = _853;
    if (_763)
    {
        float _857 = _783 * _841;
        _535 = _857;
    }
    float _859 = _535;
    if (!_763)
    {
        _785 = _825;
    }
    float _861 = _785;
    float _863 = _861;
    if (_763)
    {
        float _865 = _853 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _855 = _865;
    }
    float _867 = _855;
    float _869 = _867;
    if (_763)
    {
        float _871 = _751 * _859;
        _775 = _871;
    }
    float _873 = _775;
    if (!_763)
    {
        _843 = _755;
    }
    float _875 = _843;
    float _877 = _875;
    if (_763)
    {
        float _879 = _753 * _859;
        _849 = _879;
    }
    float _881 = _849;
    if (_763)
    {
        float _883 = fma(_825, _819, _867);
        _863 = _883;
    }
    float _885 = _863;
    if (_763)
    {
        float _887 = _873 * _873;
        _877 = _887;
    }
    float _889 = _877;
    if (!_763)
    {
        _869 = _757;
    }
    float _891 = _869;
    float _893 = _891;
    if (_763)
    {
        float _895 = _881 * _881;
        _893 = _895;
    }
    float _897 = _893;
    float _899 = fma(_885, _885, _889);
    float _901 = _659 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _903 = _899 + _897;
    float _905 = _659 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _907 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _909 = fma(_831, (*spvDescriptorSet0.vp_c15)._m0[23].w, _907);
    float _911 = precise::clamp(_909, 0.0, 1.0);
    float _913 = fma(_661, (*spvDescriptorSet0.vp_c8)._m0[3].x, _901);
    float _915 = rsqrt(_903);
    float _917 = fma(_661, (*spvDescriptorSet0.vp_c8)._m0[2].x, _905);
    float _919 = _659 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _921 = -_911;
    float _923 = _921 + 1.0;
    float _925 = fma(_663, (*spvDescriptorSet0.vp_c8)._m0[2].z, _917);
    float _927 = fma(_661, (*spvDescriptorSet0.vp_c8)._m0[1].x, _919);
    float _929 = abs(_923);
    float _931 = log2(_929);
    float _933 = _925 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _935 = fma(_663, (*spvDescriptorSet0.vp_c8)._m0[1].z, _927);
    float _937 = fma(_663, (*spvDescriptorSet0.vp_c8)._m0[0].z, _847);
    float _939 = _933 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _941 = _935 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _943 = _937 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _945 = _915 * _873;
    float _947 = -_939;
    float _949 = fma(_947, _795, 1.0);
    float _951 = _941 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _953 = fma(_663, (*spvDescriptorSet0.vp_c8)._m0[3].z, _913);
    float _955 = _945 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _957 = _915 * _881;
    float _959 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[7].x, _951);
    float _961 = _915 * _885;
    float _963 = _953 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _965 = _931 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _967 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[7].z, _959);
    float _969 = -_955;
    float _971 = fma(_961, (*spvDescriptorSet0.vp_c15)._m0[21].y, _969);
    float _973 = log2(_949);
    float _975 = fma(_963, (*spvDescriptorSet0.vp_c8)._m0[7].w, _967);
    float _977 = -_957;
    float _979 = fma(_977, (*spvDescriptorSet0.vp_c15)._m0[21].z, _971);
    float _981 = _941 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _983 = _941 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _985 = fma(_979, -0.5, 0.5);
    float _987 = exp2(_965);
    float _989 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[4].x, _981);
    float _991 = fma(_979, 0.5, 0.5);
    float _993 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[5].x, _983);
    float _995 = _961 + 1.0;
    float _997 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[4].z, _989);
    float _999 = fma(_991, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1001 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[5].z, _993);
    float _1003 = 1.0 / _975;
    float _1005 = fma(_963, (*spvDescriptorSet0.vp_c8)._m0[4].w, _997);
    float _1007 = fma(_991, _999, -0.212114393711090087890625);
    float _1009 = fma(_963, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1001);
    float _1011 = _973 * 0.693147182464599609375;
    float _1013 = fma(_991, _1007, 1.570728778839111328125);
    float _1015 = sqrt(_985);
    float _1017 = -_961;
    float _1019 = fma(_987, _995, _1017);
    float _1021 = _1011 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1023 = fma(_1019, 0.5, 0.5);
    float _1025 = _1005 * _1003;
    float _1027 = _1009 * _1003;
    float _1029 = fma(_1025, 0.5, 0.5);
    float _1031 = fma(_1027, -0.5, 0.5);
    float _1033 = _1015 * 0.636619746685028076171875;
    float3 _2737 = float3(_1029, _1031, _1021);
    float _1035 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2737, float3(0.0), isnan(_2737)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2737, float3(0.0), isnan(_2737)), level(0.0)).x;
    float _1037 = -_1013;
    float _1039 = fma(_1033, _1037, 1.0);
    float3 _2753 = float3(_1029, _1031, _1021);
    float4 _1042 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2753, float3(0.0), isnan(_2753)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2753, float3(0.0), isnan(_2753)), level(0.0)).xyzw;
    float _1044 = _1042.x;
    float _1046 = _1042.y;
    float _1048 = _1042.z;
    float _1050 = _1042.w;
    float2 _2770 = float2(_1039, _1023);
    float3 _1054 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2770, float2(0.0), isnan(_2770)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2770, float2(0.0), isnan(_2770)), level(0.0)).xyz;
    float _1056 = _1054.x;
    float _1058 = _1054.y;
    float _1060 = _1054.z;
    float _1062 = in.m_54.x;
    float _1064 = in.m_54.y;
    float _1066 = _941 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1068 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1070 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1072 = _1070 != 0;
    float _1074 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1066);
    int _1076 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1078 = _1076 != 0;
    float _1080 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1082 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1084 = _1080 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1086 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1088 = _1086 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1090 = _1062 > 0.5;
    float _1092 = _931 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1094 = _1064 > 0.5;
    float _1096 = -_165;
    int _1098 = _1090 ? as_type<int>(_1096) : as_type<int>(_165);
    float _1100 = exp2(_1092);
    float _1102 = -_169;
    int _1104 = _1094 ? as_type<int>(_1102) : as_type<int>(_169);
    bool _1106 = !_1072;
    float _1108 = _1106 ? _165 : as_type<float>(_1098);
    bool _1110 = !_1078;
    float _1112 = _1110 ? _169 : as_type<float>(_1104);
    float _1114 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1074);
    float _1116 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1118 = _1108 + 0.5;
    float _1120 = _1116 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1122 = -_1100;
    float _1124 = _1122 + 1.0;
    float _1126 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1128 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1130 = -_1112;
    float _1132 = _1130 + 0.5;
    float _1134 = _1124 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1136 = _1126 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1138 = _1128 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1140 = fma(_963, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1114);
    bool _1142 = _727 > 0.0;
    bool _1144 = isnan(_727);
    bool _1146 = _1142 || _1144;
    bool _1148 = isnan(0.0);
    bool _1150 = _1146 || _1148;
    float _1152 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1154 = _1118 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    out.m_64.x = _1120;
    out.m_64.y = _1136;
    out.m_64.z = _1138;
    float _1156 = _1132 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1158 = _1140 + _975;
    float _1160 = _1152 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.gl_Position.x = _1005;
    out.gl_Position.y = _1009;
    out.gl_Position.z = _1140;
    out.gl_Position.w = _975;
    float _1162 = _1154 * _1068;
    float _1164 = _1156 * _1082;
    float _1166 = _1158 * 0.5;
    out.m_66.x = _1088;
    out.m_66.y = _1160;
    out.m_66.z = _1084;
    float _1168 = _727 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_68.x = _1162;
    out.m_68.y = _1164;
    out.m_70.z = _1166;
    out.m_70.w = _975;
    out.m_45.x = _1168;
    float _1170 = _1134 * _1035;
    float _1172 = -_1134;
    float _1174 = _1172 + 1.0;
    float _1176 = _1050 * _1170;
    float _1178 = _1060 * _1170;
    float _1180 = _1050 * _1174;
    float _1182 = fma(_1056, _1176, _1044);
    float _1184 = fma(_1058, _1176, _1046);
    float _1186 = fma(_1050, _1178, _1048);
    out.m_72.x = _1182;
    out.m_72.y = _1184;
    out.m_72.z = _1186;
    out.m_72.w = _1180;
    if (_1150)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _1188 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1188;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _191 = false;
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
    if (!_95)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1244 = as_type<float>(_107);
        out.gl_Position.z = _1244;
    }
    if (!_95)
    {
        return out;
    }
    float _109 = in.m_47.w;
    bool _111 = _109 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _113 = isnan(_109);
    bool _115 = _111 || _113;
    bool _117 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _119 = _115 || _117;
    float _121 = -_109;
    float _123 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _125 = 0.0;
    if (_119)
    {
        float _127 = float(_91);
        _125 = _127;
    }
    float _129 = _125;
    bool _131 = _123 >= _129;
    bool _133 = !_119;
    bool _135 = _131 || _133;
    if (_135)
    {
        _101 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _137 = _101;
    if (_135)
    {
        out.m_45.x = 0.0;
    }
    int _139 = 0;
    if (_135)
    {
        float _141 = _137 * 5.0;
        _139 = as_type<int>(_141);
    }
    int _143 = _139;
    if (_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1312 = as_type<float>(_143);
        out.gl_Position.z = _1312;
    }
    if (_135)
    {
        return out;
    }
    float _145 = in.m_42.x;
    float _147 = in.m_42.y;
    float _149 = in.m_42.z;
    float _151 = as_type<float>(int(gl_VertexIndex));
    out.m_52.x = _145;
    out.m_52.y = _147;
    out.m_52.z = _149;
    int _153 = as_type<int>(_151) & 1;
    bool _155 = _153 != 0;
    int _157 = as_type<int>(_151) & 2;
    bool _159 = _157 != 0;
    bool _161 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _163 = !_155;
    float _165 = _163 ? (-0.5) : 0.5;
    bool _167 = !_159;
    float _169 = _167 ? (-0.5) : 0.5;
    bool _171 = !_161;
    float _189;
    if (!_171)
    {
        float _173 = in.m_54.x;
        float _175 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _177 = _173 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _179 = fma(_177, (*spvDescriptorSet0.vp_c9)._m0[12].x, _123);
        float _181 = _179 * _175;
        float _183 = floor(_181);
        float _185 = -_183;
        float _187 = _181 + _185;
        _189 = _187;
        _191 = true;
    }
    else
    {
        float _193 = float(_91);
        float _195 = 1.0 / _193;
        float _197 = _123 * _195;
        _189 = _197;
    }
    _191 = false;
    float _199 = _189;
    float _201 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _203 = _199 + _201;
    float _205 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _207 = _199 + _205;
    bool _209 = _199 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _211 = isnan(_199);
    bool _213 = _209 || _211;
    bool _215 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _217 = _213 || _215;
    float _219 = float(_217);
    float _221 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _223 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _221;
    float _225 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _227 = _225 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _229 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _231 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _229;
    float _233 = -_219;
    float _235 = _233 + 1.0;
    float _237 = 1.0 / _223;
    float _239 = in.m_56.x;
    float _241 = in.m_56.y;
    float _243 = in.m_56.z;
    float _245 = in.m_56.w;
    float _247 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _249 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _247;
    bool _251 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _253 = isnan(0.5);
    bool _255 = _251 || _253;
    bool _257 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _259 = _255 || _257;
    bool _261 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _263 = isnan(0.5);
    bool _265 = _261 || _263;
    bool _267 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _269 = _265 || _267;
    float _271 = 1.0 / _227;
    float _273 = 1.0 / _231;
    float _275 = _203 * _237;
    bool _277 = _199 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _279 = isnan(_199);
    bool _281 = _277 || _279;
    bool _283 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _285 = _281 || _283;
    float _287 = float(_285);
    bool _289 = _199 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _291 = isnan(_199);
    bool _293 = _289 || _291;
    bool _295 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _297 = _293 || _295;
    float _299 = float(_297);
    float _301 = _287 * _235;
    float _303 = _207 * _271;
    float _305 = -_287;
    float _307 = _305 + 1.0;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _311 = _199 + _309;
    bool _313 = _199 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _315 = isnan(_199);
    bool _317 = _313 || _315;
    bool _319 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _321 = _317 || _319;
    float _323 = float(_321);
    float _325 = _299 * _307;
    float _327 = -_299;
    float _329 = _327 + 1.0;
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _333 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _331;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _337 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _335;
    float _339 = _311 * _273;
    float _341 = _323 * _329;
    float _343 = fma(_333, _275, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _347 = _345 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _349 = fma(_337, _275, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _351 = -_323;
    float _353 = _351 + 1.0;
    float _355 = _343 * _341;
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _359 = _357 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _361 = in.m_58.x;
    float _363 = in.m_58.y;
    float _365 = fma(_347, _303, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _367 = fma(_353, (*spvDescriptorSet0.vp_c9)._m0[143].y, _355);
    float _369 = _349 * _341;
    float _371 = fma(_359, _303, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _373 = fma(_249, _339, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _375 = fma(_365, _325, _367);
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _377;
    float _381 = in.m_60.x;
    float _383 = in.m_60.y;
    float _385 = in.m_60.z;
    float _387 = in.m_60.w;
    float _389 = fma(_353, (*spvDescriptorSet0.vp_c9)._m0[143].x, _369);
    float _391 = fma(_373, _301, _375);
    float _393 = fma(_379, _339, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _395 = in.m_62.x;
    float _397 = in.m_62.y;
    float _399 = in.m_62.z;
    float _401 = in.m_62.w;
    float _403 = fma(_371, _325, _389);
    float _405 = fma(_219, (*spvDescriptorSet0.vp_c9)._m0[146].y, _391);
    float _407 = fma(_393, _301, _403);
    float _409 = _147 * _241;
    float _411 = fma(_219, (*spvDescriptorSet0.vp_c9)._m0[146].x, _407);
    float _413 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _169);
    float _415 = fma(_145, _239, _409);
    float _417 = _405 * _363;
    float _419 = _411 * _361;
    float _421 = fma(_149, _243, _415);
    float _423 = _417 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _425 = _419 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _427 = _421 + _245;
    float _429 = _423 * _413;
    float _431 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _165);
    float _433 = _147 * _383;
    float _435 = _147 * _397;
    float _437 = _425 * _431;
    float _439 = _429 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _441 = _429 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _443 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _445 = fma(_145, _381, _433);
    float _447 = fma(_437, (*spvDescriptorSet0.vp_c8)._m0[26].x, _439);
    float _449 = fma(_437, (*spvDescriptorSet0.vp_c8)._m0[24].x, _441);
    float _451 = fma(_145, _395, _435);
    float _453 = fma(_149, _385, _445);
    float _455 = fma(_443, (*spvDescriptorSet0.vp_c8)._m0[26].z, _447);
    float _457 = fma(_443, (*spvDescriptorSet0.vp_c8)._m0[24].z, _449);
    float _459 = fma(_149, _399, _451);
    float _461 = _453 + _387;
    float _463 = _455 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _465 = _457 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _467 = _459 + _401;
    float _469 = _427 + _463;
    float _471 = _461 + _465;
    float _473 = _467 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _475 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _477 = _469 + _475;
    float _479 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _481 = _471 + _479;
    float _483 = fma(_461, (*spvDescriptorSet0.vp_c8)._m0[11].x, _473);
    float _485 = _477 * _477;
    float _487 = fma(_481, _481, _485);
    float _489 = fma(_427, (*spvDescriptorSet0.vp_c8)._m0[11].z, _483);
    float _491 = _467 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _493 = sqrt(_487);
    float _495 = _489 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _497 = fma(_461, (*spvDescriptorSet0.vp_c8)._m0[10].x, _491);
    float _499 = _429 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _501 = fma(_427, (*spvDescriptorSet0.vp_c8)._m0[10].z, _497);
    float _503 = fma(_437, (*spvDescriptorSet0.vp_c8)._m0[25].x, _499);
    float _505 = 1.0 / _495;
    float _507 = _501 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _509 = fma(_443, (*spvDescriptorSet0.vp_c8)._m0[25].z, _503);
    float _511 = _507 + _495;
    float _513 = _509 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _515 = _493 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _517 = _467 + _513;
    float _519 = _511 * _505;
    float _521 = _519 * 0.5;
    float _523 = _505;
    float _525 = _495;
    float _527 = _511;
    float _529 = _493;
    float _531 = _471;
    float _533 = _517;
    float _535 = _429;
    if (!_515)
    {
        _523 = _471;
    }
    float _537 = _523;
    float _539 = _537;
    if (!_515)
    {
        _525 = _469;
    }
    float _541 = _525;
    float _543 = _541;
    if (!_515)
    {
        _527 = _517;
    }
    float _545 = _527;
    bool _547 = !_515;
    float _549 = _545;
    if (!_547)
    {
        float _551 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _553 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _555 = _493 + _553;
        float _557 = rsqrt(_487);
        float _559 = _555 * _551;
        float _561 = _517 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _563 = _559 * 0.15915493667125701904296875;
        float _565 = _563 * 6.283185482025146484375;
        float _567 = cos(_565);
        float _569 = _563 * 6.283185482025146484375;
        float _571 = sin(_569);
        float _573 = _567 + (-1.0);
        float _575 = _573 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _577 = fma(_571, _561, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _579 = fma(_517, _567, _575);
        float _581 = _557 * _577;
        float _583 = fma(_481, _581, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _585 = fma(_477, _581, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _549 = _579;
        _539 = _583;
        _543 = _585;
        _529 = _563;
    }
    float _587 = _549;
    float _589 = _539;
    float _591 = _543;
    float _593 = _529;
    float _595 = _593;
    float _597 = _587;
    float _599 = _589;
    float _601 = _591;
    if (_269)
    {
        _595 = 1.0;
    }
    float _603 = _595;
    float _605 = _603;
    if (!_259)
    {
        float _607 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _609 = _467 + _607;
        float _611 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _613 = _461 + _611;
        float _615 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _617 = -_467;
        float _619 = _617 + _587;
        float _621 = _609 * _609;
        float _623 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _625 = _427 + _623;
        float _627 = fma(_613, _613, _621);
        float _629 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _631 = fma(_625, _625, _627);
        float _633 = sqrt(_631);
        float _635 = _615 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _637 = precise::min(_633, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _639 = _637 * _629;
        float _641 = -_461;
        float _643 = _641 + _589;
        float _645 = _635 * _639;
        float _647 = -_427;
        float _649 = _647 + _591;
        float _651 = fma(_643, _645, _461);
        float _653 = fma(_619, _645, _467);
        float _655 = fma(_649, _645, _427);
        _531 = _615;
        _597 = _653;
        _599 = _651;
        _601 = _655;
    }
    float _657 = _531;
    float _659 = _597;
    float _661 = _599;
    float _663 = _601;
    float _665 = _657;
    if (!_269)
    {
        float _667 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _669 = _667 * 0.15915493667125701904296875;
        float _671 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _673 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _675 = fma(_521, (*spvDescriptorSet0.vp_c8)._m0[30].w, _673);
        float _677 = _669 * 6.283185482025146484375;
        float _679 = cos(_677);
        float _681 = _671 * 0.15915493667125701904296875;
        float _683 = _669 * 6.283185482025146484375;
        float _685 = sin(_683);
        float _687 = 1.0 / _679;
        float _689 = _681 * 6.283185482025146484375;
        float _691 = cos(_689);
        float _693 = _685 * _687;
        float _695 = _681 * 6.283185482025146484375;
        float _697 = sin(_695);
        float _699 = _691 * _693;
        float _701 = 1.0 / _675;
        float _703 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _705 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _703;
        float _707 = 1.0 / _699;
        float _709 = 1.0 / _705;
        float _711 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _713 = _701 * _711;
        float _715 = _697 * _707;
        float _717 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _719 = fma(_715, _713, _717);
        float _721 = _719 * _709;
        float _723 = precise::clamp(_721, 0.0, 1.0);
        _665 = _709;
        _605 = _723;
    }
    float _725 = _665;
    float _727 = _605;
    float _729 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _731 = _659 + _729;
    float _733 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _735 = _661 + _733;
    float _737 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _739 = _663 + _737;
    float _741 = _731 * _731;
    float _743 = fma(_735, _735, _741);
    float _745 = fma(_739, _739, _743);
    float _747 = rsqrt(_745);
    float _749 = _747 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _751 = _735 * _749;
    float _753 = _739 * _749;
    float _755 = _751 * _751;
    float _757 = _753 * _753;
    float _759 = _755 + _757;
    float _761 = sqrt(_759);
    bool _763 = _761 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _765 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _767 = _761 + _765;
    float _769 = _739;
    float _771 = _725;
    float _773 = _767;
    float _775 = _751;
    if (_763)
    {
        float _777 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _769 = _777;
    }
    float _779 = _769;
    if (_763)
    {
        float _781 = rsqrt(_759);
        _771 = _781;
    }
    float _783 = _771;
    float _785 = _783;
    if (_763)
    {
        float _787 = _767 * _779;
        _773 = _787;
    }
    float _789 = _773;
    if (_763)
    {
        float _791 = _789 * 0.15915493667125701904296875;
        _533 = _791;
    }
    float _793 = _533;
    float _795 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _797 = _747;
    if (_763)
    {
        float _799 = _793 * 6.283185482025146484375;
        float _801 = sin(_799);
        _797 = _801;
    }
    float _803 = _797;
    float _805 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _807 = precise::max(0.0, _805);
    float _809 = _741;
    float _811 = _807;
    float _813 = _805;
    if (_763)
    {
        float _815 = _793 * 6.283185482025146484375;
        float _817 = cos(_815);
        _809 = _817;
    }
    float _819 = _809;
    float _821 = -_749;
    float _823 = -_807;
    float _825 = fma(_731, _821, _823);
    if (_763)
    {
        float _827 = _825 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _811 = _827;
    }
    float _829 = _811;
    float _831 = sqrt(_745);
    float _833 = _659 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _835 = _829;
    float _837 = _803;
    if (_763)
    {
        float _839 = fma(_803, _829, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _835 = _839;
    }
    float _841 = _835;
    float _843 = _841;
    if (!_763)
    {
        _837 = _753;
    }
    float _845 = _837;
    float _847 = fma(_661, (*spvDescriptorSet0.vp_c8)._m0[0].x, _833);
    float _849 = _845;
    if (_763)
    {
        float _851 = _819 + (-1.0);
        _813 = _851;
    }
    float _853 = _813;
    float _855 = _853;
    if (_763)
    {
        float _857 = _783 * _841;
        _535 = _857;
    }
    float _859 = _535;
    if (!_763)
    {
        _785 = _825;
    }
    float _861 = _785;
    float _863 = _861;
    if (_763)
    {
        float _865 = _853 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _855 = _865;
    }
    float _867 = _855;
    float _869 = _867;
    if (_763)
    {
        float _871 = _751 * _859;
        _775 = _871;
    }
    float _873 = _775;
    if (!_763)
    {
        _843 = _755;
    }
    float _875 = _843;
    float _877 = _875;
    if (_763)
    {
        float _879 = _753 * _859;
        _849 = _879;
    }
    float _881 = _849;
    if (_763)
    {
        float _883 = fma(_825, _819, _867);
        _863 = _883;
    }
    float _885 = _863;
    if (_763)
    {
        float _887 = _873 * _873;
        _877 = _887;
    }
    float _889 = _877;
    if (!_763)
    {
        _869 = _757;
    }
    float _891 = _869;
    float _893 = _891;
    if (_763)
    {
        float _895 = _881 * _881;
        _893 = _895;
    }
    float _897 = _893;
    float _899 = fma(_885, _885, _889);
    float _901 = _659 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _903 = _899 + _897;
    float _905 = _659 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _907 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _909 = fma(_831, (*spvDescriptorSet0.vp_c15)._m0[23].w, _907);
    float _911 = precise::clamp(_909, 0.0, 1.0);
    float _913 = fma(_661, (*spvDescriptorSet0.vp_c8)._m0[3].x, _901);
    float _915 = rsqrt(_903);
    float _917 = fma(_661, (*spvDescriptorSet0.vp_c8)._m0[2].x, _905);
    float _919 = _659 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _921 = -_911;
    float _923 = _921 + 1.0;
    float _925 = fma(_663, (*spvDescriptorSet0.vp_c8)._m0[2].z, _917);
    float _927 = fma(_661, (*spvDescriptorSet0.vp_c8)._m0[1].x, _919);
    float _929 = abs(_923);
    float _931 = log2(_929);
    float _933 = _925 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _935 = fma(_663, (*spvDescriptorSet0.vp_c8)._m0[1].z, _927);
    float _937 = fma(_663, (*spvDescriptorSet0.vp_c8)._m0[0].z, _847);
    float _939 = _933 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _941 = _935 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _943 = _937 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _945 = _915 * _873;
    float _947 = -_939;
    float _949 = fma(_947, _795, 1.0);
    float _951 = _941 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _953 = fma(_663, (*spvDescriptorSet0.vp_c8)._m0[3].z, _913);
    float _955 = _945 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _957 = _915 * _881;
    float _959 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[7].x, _951);
    float _961 = _915 * _885;
    float _963 = _953 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _965 = _931 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _967 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[7].z, _959);
    float _969 = -_955;
    float _971 = fma(_961, (*spvDescriptorSet0.vp_c15)._m0[21].y, _969);
    float _973 = log2(_949);
    float _975 = fma(_963, (*spvDescriptorSet0.vp_c8)._m0[7].w, _967);
    float _977 = -_957;
    float _979 = fma(_977, (*spvDescriptorSet0.vp_c15)._m0[21].z, _971);
    float _981 = _941 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _983 = _941 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _985 = fma(_979, -0.5, 0.5);
    float _987 = exp2(_965);
    float _989 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[4].x, _981);
    float _991 = fma(_979, 0.5, 0.5);
    float _993 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[5].x, _983);
    float _995 = _961 + 1.0;
    float _997 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[4].z, _989);
    float _999 = fma(_991, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1001 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[5].z, _993);
    float _1003 = 1.0 / _975;
    float _1005 = fma(_963, (*spvDescriptorSet0.vp_c8)._m0[4].w, _997);
    float _1007 = fma(_991, _999, -0.212114393711090087890625);
    float _1009 = fma(_963, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1001);
    float _1011 = _973 * 0.693147182464599609375;
    float _1013 = fma(_991, _1007, 1.570728778839111328125);
    float _1015 = sqrt(_985);
    float _1017 = -_961;
    float _1019 = fma(_987, _995, _1017);
    float _1021 = _1011 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1023 = fma(_1019, 0.5, 0.5);
    float _1025 = _1005 * _1003;
    float _1027 = _1009 * _1003;
    float _1029 = fma(_1025, 0.5, 0.5);
    float _1031 = fma(_1027, -0.5, 0.5);
    float _1033 = _1015 * 0.636619746685028076171875;
    float3 _2737 = float3(_1029, _1031, _1021);
    float _1035 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2737, float3(0.0), isnan(_2737)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2737, float3(0.0), isnan(_2737)), level(0.0)).x;
    float _1037 = -_1013;
    float _1039 = fma(_1033, _1037, 1.0);
    float3 _2753 = float3(_1029, _1031, _1021);
    float4 _1042 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2753, float3(0.0), isnan(_2753)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2753, float3(0.0), isnan(_2753)), level(0.0)).xyzw;
    float _1044 = _1042.x;
    float _1046 = _1042.y;
    float _1048 = _1042.z;
    float _1050 = _1042.w;
    float2 _2770 = float2(_1039, _1023);
    float3 _1054 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2770, float2(0.0), isnan(_2770)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2770, float2(0.0), isnan(_2770)), level(0.0)).xyz;
    float _1056 = _1054.x;
    float _1058 = _1054.y;
    float _1060 = _1054.z;
    float _1062 = in.m_54.x;
    float _1064 = in.m_54.y;
    float _1066 = _941 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1068 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1070 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1072 = _1070 != 0;
    float _1074 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1066);
    int _1076 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1078 = _1076 != 0;
    float _1080 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1082 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1084 = _1080 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1086 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1088 = _1086 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1090 = _1062 > 0.5;
    float _1092 = _931 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1094 = _1064 > 0.5;
    float _1096 = -_165;
    int _1098 = _1090 ? as_type<int>(_1096) : as_type<int>(_165);
    float _1100 = exp2(_1092);
    float _1102 = -_169;
    int _1104 = _1094 ? as_type<int>(_1102) : as_type<int>(_169);
    bool _1106 = !_1072;
    float _1108 = _1106 ? _165 : as_type<float>(_1098);
    bool _1110 = !_1078;
    float _1112 = _1110 ? _169 : as_type<float>(_1104);
    float _1114 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1074);
    float _1116 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1118 = _1108 + 0.5;
    float _1120 = _1116 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1122 = -_1100;
    float _1124 = _1122 + 1.0;
    float _1126 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1128 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1130 = -_1112;
    float _1132 = _1130 + 0.5;
    float _1134 = _1124 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1136 = _1126 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1138 = _1128 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1140 = fma(_963, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1114);
    bool _1142 = _727 > 0.0;
    bool _1144 = isnan(_727);
    bool _1146 = _1142 || _1144;
    bool _1148 = isnan(0.0);
    bool _1150 = _1146 || _1148;
    float _1152 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1154 = _1118 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    out.m_64.x = _1120;
    out.m_64.y = _1136;
    out.m_64.z = _1138;
    float _1156 = _1132 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1158 = _1140 + _975;
    float _1160 = _1152 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.gl_Position.x = _1005;
    out.gl_Position.y = _1009;
    out.gl_Position.z = _1140;
    out.gl_Position.w = _975;
    float _1162 = _1154 * _1068;
    float _1164 = _1156 * _1082;
    float _1166 = _1158 * 0.5;
    out.m_66.x = _1088;
    out.m_66.y = _1160;
    out.m_66.z = _1084;
    float _1168 = _727 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_68.x = _1162;
    out.m_68.y = _1164;
    out.m_70.z = _1166;
    out.m_70.w = _975;
    out.m_45.x = _1168;
    float _1170 = _1134 * _1035;
    float _1172 = -_1134;
    float _1174 = _1172 + 1.0;
    float _1176 = _1050 * _1170;
    float _1178 = _1060 * _1170;
    float _1180 = _1050 * _1174;
    float _1182 = fma(_1056, _1176, _1044);
    float _1184 = fma(_1058, _1176, _1046);
    float _1186 = fma(_1050, _1178, _1048);
    out.m_72.x = _1182;
    out.m_72.y = _1184;
    out.m_72.z = _1186;
    out.m_72.w = _1180;
    if (_1150)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _1188 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1188;
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
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _191 = false;
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
    if (!_95)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1244 = as_type<float>(_107);
        out.gl_Position.z = _1244;
    }
    if (!_95)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _109 = in.m_47.w;
    bool _111 = _109 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _113 = isnan(_109);
    bool _115 = _111 || _113;
    bool _117 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _119 = _115 || _117;
    float _121 = -_109;
    float _123 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _125 = 0.0;
    if (_119)
    {
        float _127 = float(_91);
        _125 = _127;
    }
    float _129 = _125;
    bool _131 = _123 >= _129;
    bool _133 = !_119;
    bool _135 = _131 || _133;
    if (_135)
    {
        _101 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _137 = _101;
    if (_135)
    {
        out.m_45.x = 0.0;
    }
    int _139 = 0;
    if (_135)
    {
        float _141 = _137 * 5.0;
        _139 = as_type<int>(_141);
    }
    int _143 = _139;
    if (_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1312 = as_type<float>(_143);
        out.gl_Position.z = _1312;
    }
    if (_135)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _145 = in.m_42.x;
    float _147 = in.m_42.y;
    float _149 = in.m_42.z;
    float _151 = as_type<float>(int(gl_VertexIndex));
    out.m_52.x = _145;
    out.m_52.y = _147;
    out.m_52.z = _149;
    int _153 = as_type<int>(_151) & 1;
    bool _155 = _153 != 0;
    int _157 = as_type<int>(_151) & 2;
    bool _159 = _157 != 0;
    bool _161 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _163 = !_155;
    float _165 = _163 ? (-0.5) : 0.5;
    bool _167 = !_159;
    float _169 = _167 ? (-0.5) : 0.5;
    bool _171 = !_161;
    float _189;
    if (!_171)
    {
        float _173 = in.m_54.x;
        float _175 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _177 = _173 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _179 = fma(_177, (*spvDescriptorSet0.vp_c9)._m0[12].x, _123);
        float _181 = _179 * _175;
        float _183 = floor(_181);
        float _185 = -_183;
        float _187 = _181 + _185;
        _189 = _187;
        _191 = true;
    }
    else
    {
        float _193 = float(_91);
        float _195 = 1.0 / _193;
        float _197 = _123 * _195;
        _189 = _197;
    }
    _191 = false;
    float _199 = _189;
    float _201 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _203 = _199 + _201;
    float _205 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _207 = _199 + _205;
    bool _209 = _199 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _211 = isnan(_199);
    bool _213 = _209 || _211;
    bool _215 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _217 = _213 || _215;
    float _219 = float(_217);
    float _221 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _223 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _221;
    float _225 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _227 = _225 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _229 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _231 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _229;
    float _233 = -_219;
    float _235 = _233 + 1.0;
    float _237 = 1.0 / _223;
    float _239 = in.m_56.x;
    float _241 = in.m_56.y;
    float _243 = in.m_56.z;
    float _245 = in.m_56.w;
    float _247 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _249 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _247;
    bool _251 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _253 = isnan(0.5);
    bool _255 = _251 || _253;
    bool _257 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _259 = _255 || _257;
    bool _261 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _263 = isnan(0.5);
    bool _265 = _261 || _263;
    bool _267 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _269 = _265 || _267;
    float _271 = 1.0 / _227;
    float _273 = 1.0 / _231;
    float _275 = _203 * _237;
    bool _277 = _199 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _279 = isnan(_199);
    bool _281 = _277 || _279;
    bool _283 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _285 = _281 || _283;
    float _287 = float(_285);
    bool _289 = _199 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _291 = isnan(_199);
    bool _293 = _289 || _291;
    bool _295 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _297 = _293 || _295;
    float _299 = float(_297);
    float _301 = _287 * _235;
    float _303 = _207 * _271;
    float _305 = -_287;
    float _307 = _305 + 1.0;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _311 = _199 + _309;
    bool _313 = _199 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _315 = isnan(_199);
    bool _317 = _313 || _315;
    bool _319 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _321 = _317 || _319;
    float _323 = float(_321);
    float _325 = _299 * _307;
    float _327 = -_299;
    float _329 = _327 + 1.0;
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _333 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _331;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _337 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _335;
    float _339 = _311 * _273;
    float _341 = _323 * _329;
    float _343 = fma(_333, _275, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _347 = _345 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _349 = fma(_337, _275, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _351 = -_323;
    float _353 = _351 + 1.0;
    float _355 = _343 * _341;
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _359 = _357 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _361 = in.m_58.x;
    float _363 = in.m_58.y;
    float _365 = fma(_347, _303, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _367 = fma(_353, (*spvDescriptorSet0.vp_c9)._m0[143].y, _355);
    float _369 = _349 * _341;
    float _371 = fma(_359, _303, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _373 = fma(_249, _339, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _375 = fma(_365, _325, _367);
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _377;
    float _381 = in.m_60.x;
    float _383 = in.m_60.y;
    float _385 = in.m_60.z;
    float _387 = in.m_60.w;
    float _389 = fma(_353, (*spvDescriptorSet0.vp_c9)._m0[143].x, _369);
    float _391 = fma(_373, _301, _375);
    float _393 = fma(_379, _339, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _395 = in.m_62.x;
    float _397 = in.m_62.y;
    float _399 = in.m_62.z;
    float _401 = in.m_62.w;
    float _403 = fma(_371, _325, _389);
    float _405 = fma(_219, (*spvDescriptorSet0.vp_c9)._m0[146].y, _391);
    float _407 = fma(_393, _301, _403);
    float _409 = _147 * _241;
    float _411 = fma(_219, (*spvDescriptorSet0.vp_c9)._m0[146].x, _407);
    float _413 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _169);
    float _415 = fma(_145, _239, _409);
    float _417 = _405 * _363;
    float _419 = _411 * _361;
    float _421 = fma(_149, _243, _415);
    float _423 = _417 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _425 = _419 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _427 = _421 + _245;
    float _429 = _423 * _413;
    float _431 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _165);
    float _433 = _147 * _383;
    float _435 = _147 * _397;
    float _437 = _425 * _431;
    float _439 = _429 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _441 = _429 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _443 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _445 = fma(_145, _381, _433);
    float _447 = fma(_437, (*spvDescriptorSet0.vp_c8)._m0[26].x, _439);
    float _449 = fma(_437, (*spvDescriptorSet0.vp_c8)._m0[24].x, _441);
    float _451 = fma(_145, _395, _435);
    float _453 = fma(_149, _385, _445);
    float _455 = fma(_443, (*spvDescriptorSet0.vp_c8)._m0[26].z, _447);
    float _457 = fma(_443, (*spvDescriptorSet0.vp_c8)._m0[24].z, _449);
    float _459 = fma(_149, _399, _451);
    float _461 = _453 + _387;
    float _463 = _455 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _465 = _457 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _467 = _459 + _401;
    float _469 = _427 + _463;
    float _471 = _461 + _465;
    float _473 = _467 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _475 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _477 = _469 + _475;
    float _479 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _481 = _471 + _479;
    float _483 = fma(_461, (*spvDescriptorSet0.vp_c8)._m0[11].x, _473);
    float _485 = _477 * _477;
    float _487 = fma(_481, _481, _485);
    float _489 = fma(_427, (*spvDescriptorSet0.vp_c8)._m0[11].z, _483);
    float _491 = _467 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _493 = sqrt(_487);
    float _495 = _489 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _497 = fma(_461, (*spvDescriptorSet0.vp_c8)._m0[10].x, _491);
    float _499 = _429 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _501 = fma(_427, (*spvDescriptorSet0.vp_c8)._m0[10].z, _497);
    float _503 = fma(_437, (*spvDescriptorSet0.vp_c8)._m0[25].x, _499);
    float _505 = 1.0 / _495;
    float _507 = _501 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _509 = fma(_443, (*spvDescriptorSet0.vp_c8)._m0[25].z, _503);
    float _511 = _507 + _495;
    float _513 = _509 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _515 = _493 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _517 = _467 + _513;
    float _519 = _511 * _505;
    float _521 = _519 * 0.5;
    float _523 = _505;
    float _525 = _495;
    float _527 = _511;
    float _529 = _493;
    float _531 = _471;
    float _533 = _517;
    float _535 = _429;
    if (!_515)
    {
        _523 = _471;
    }
    float _537 = _523;
    float _539 = _537;
    if (!_515)
    {
        _525 = _469;
    }
    float _541 = _525;
    float _543 = _541;
    if (!_515)
    {
        _527 = _517;
    }
    float _545 = _527;
    bool _547 = !_515;
    float _549 = _545;
    if (!_547)
    {
        float _551 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _553 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _555 = _493 + _553;
        float _557 = rsqrt(_487);
        float _559 = _555 * _551;
        float _561 = _517 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _563 = _559 * 0.15915493667125701904296875;
        float _565 = _563 * 6.283185482025146484375;
        float _567 = cos(_565);
        float _569 = _563 * 6.283185482025146484375;
        float _571 = sin(_569);
        float _573 = _567 + (-1.0);
        float _575 = _573 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _577 = fma(_571, _561, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _579 = fma(_517, _567, _575);
        float _581 = _557 * _577;
        float _583 = fma(_481, _581, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _585 = fma(_477, _581, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _549 = _579;
        _539 = _583;
        _543 = _585;
        _529 = _563;
    }
    float _587 = _549;
    float _589 = _539;
    float _591 = _543;
    float _593 = _529;
    float _595 = _593;
    float _597 = _587;
    float _599 = _589;
    float _601 = _591;
    if (_269)
    {
        _595 = 1.0;
    }
    float _603 = _595;
    float _605 = _603;
    if (!_259)
    {
        float _607 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _609 = _467 + _607;
        float _611 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _613 = _461 + _611;
        float _615 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _617 = -_467;
        float _619 = _617 + _587;
        float _621 = _609 * _609;
        float _623 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _625 = _427 + _623;
        float _627 = fma(_613, _613, _621);
        float _629 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _631 = fma(_625, _625, _627);
        float _633 = sqrt(_631);
        float _635 = _615 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _637 = precise::min(_633, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _639 = _637 * _629;
        float _641 = -_461;
        float _643 = _641 + _589;
        float _645 = _635 * _639;
        float _647 = -_427;
        float _649 = _647 + _591;
        float _651 = fma(_643, _645, _461);
        float _653 = fma(_619, _645, _467);
        float _655 = fma(_649, _645, _427);
        _531 = _615;
        _597 = _653;
        _599 = _651;
        _601 = _655;
    }
    float _657 = _531;
    float _659 = _597;
    float _661 = _599;
    float _663 = _601;
    float _665 = _657;
    if (!_269)
    {
        float _667 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _669 = _667 * 0.15915493667125701904296875;
        float _671 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _673 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _675 = fma(_521, (*spvDescriptorSet0.vp_c8)._m0[30].w, _673);
        float _677 = _669 * 6.283185482025146484375;
        float _679 = cos(_677);
        float _681 = _671 * 0.15915493667125701904296875;
        float _683 = _669 * 6.283185482025146484375;
        float _685 = sin(_683);
        float _687 = 1.0 / _679;
        float _689 = _681 * 6.283185482025146484375;
        float _691 = cos(_689);
        float _693 = _685 * _687;
        float _695 = _681 * 6.283185482025146484375;
        float _697 = sin(_695);
        float _699 = _691 * _693;
        float _701 = 1.0 / _675;
        float _703 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _705 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _703;
        float _707 = 1.0 / _699;
        float _709 = 1.0 / _705;
        float _711 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _713 = _701 * _711;
        float _715 = _697 * _707;
        float _717 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _719 = fma(_715, _713, _717);
        float _721 = _719 * _709;
        float _723 = precise::clamp(_721, 0.0, 1.0);
        _665 = _709;
        _605 = _723;
    }
    float _725 = _665;
    float _727 = _605;
    float _729 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _731 = _659 + _729;
    float _733 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _735 = _661 + _733;
    float _737 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _739 = _663 + _737;
    float _741 = _731 * _731;
    float _743 = fma(_735, _735, _741);
    float _745 = fma(_739, _739, _743);
    float _747 = rsqrt(_745);
    float _749 = _747 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _751 = _735 * _749;
    float _753 = _739 * _749;
    float _755 = _751 * _751;
    float _757 = _753 * _753;
    float _759 = _755 + _757;
    float _761 = sqrt(_759);
    bool _763 = _761 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _765 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _767 = _761 + _765;
    float _769 = _739;
    float _771 = _725;
    float _773 = _767;
    float _775 = _751;
    if (_763)
    {
        float _777 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _769 = _777;
    }
    float _779 = _769;
    if (_763)
    {
        float _781 = rsqrt(_759);
        _771 = _781;
    }
    float _783 = _771;
    float _785 = _783;
    if (_763)
    {
        float _787 = _767 * _779;
        _773 = _787;
    }
    float _789 = _773;
    if (_763)
    {
        float _791 = _789 * 0.15915493667125701904296875;
        _533 = _791;
    }
    float _793 = _533;
    float _795 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _797 = _747;
    if (_763)
    {
        float _799 = _793 * 6.283185482025146484375;
        float _801 = sin(_799);
        _797 = _801;
    }
    float _803 = _797;
    float _805 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _807 = precise::max(0.0, _805);
    float _809 = _741;
    float _811 = _807;
    float _813 = _805;
    if (_763)
    {
        float _815 = _793 * 6.283185482025146484375;
        float _817 = cos(_815);
        _809 = _817;
    }
    float _819 = _809;
    float _821 = -_749;
    float _823 = -_807;
    float _825 = fma(_731, _821, _823);
    if (_763)
    {
        float _827 = _825 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _811 = _827;
    }
    float _829 = _811;
    float _831 = sqrt(_745);
    float _833 = _659 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _835 = _829;
    float _837 = _803;
    if (_763)
    {
        float _839 = fma(_803, _829, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _835 = _839;
    }
    float _841 = _835;
    float _843 = _841;
    if (!_763)
    {
        _837 = _753;
    }
    float _845 = _837;
    float _847 = fma(_661, (*spvDescriptorSet0.vp_c8)._m0[0].x, _833);
    float _849 = _845;
    if (_763)
    {
        float _851 = _819 + (-1.0);
        _813 = _851;
    }
    float _853 = _813;
    float _855 = _853;
    if (_763)
    {
        float _857 = _783 * _841;
        _535 = _857;
    }
    float _859 = _535;
    if (!_763)
    {
        _785 = _825;
    }
    float _861 = _785;
    float _863 = _861;
    if (_763)
    {
        float _865 = _853 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _855 = _865;
    }
    float _867 = _855;
    float _869 = _867;
    if (_763)
    {
        float _871 = _751 * _859;
        _775 = _871;
    }
    float _873 = _775;
    if (!_763)
    {
        _843 = _755;
    }
    float _875 = _843;
    float _877 = _875;
    if (_763)
    {
        float _879 = _753 * _859;
        _849 = _879;
    }
    float _881 = _849;
    if (_763)
    {
        float _883 = fma(_825, _819, _867);
        _863 = _883;
    }
    float _885 = _863;
    if (_763)
    {
        float _887 = _873 * _873;
        _877 = _887;
    }
    float _889 = _877;
    if (!_763)
    {
        _869 = _757;
    }
    float _891 = _869;
    float _893 = _891;
    if (_763)
    {
        float _895 = _881 * _881;
        _893 = _895;
    }
    float _897 = _893;
    float _899 = fma(_885, _885, _889);
    float _901 = _659 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _903 = _899 + _897;
    float _905 = _659 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _907 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _909 = fma(_831, (*spvDescriptorSet0.vp_c15)._m0[23].w, _907);
    float _911 = precise::clamp(_909, 0.0, 1.0);
    float _913 = fma(_661, (*spvDescriptorSet0.vp_c8)._m0[3].x, _901);
    float _915 = rsqrt(_903);
    float _917 = fma(_661, (*spvDescriptorSet0.vp_c8)._m0[2].x, _905);
    float _919 = _659 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _921 = -_911;
    float _923 = _921 + 1.0;
    float _925 = fma(_663, (*spvDescriptorSet0.vp_c8)._m0[2].z, _917);
    float _927 = fma(_661, (*spvDescriptorSet0.vp_c8)._m0[1].x, _919);
    float _929 = abs(_923);
    float _931 = log2(_929);
    float _933 = _925 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _935 = fma(_663, (*spvDescriptorSet0.vp_c8)._m0[1].z, _927);
    float _937 = fma(_663, (*spvDescriptorSet0.vp_c8)._m0[0].z, _847);
    float _939 = _933 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _941 = _935 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _943 = _937 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _945 = _915 * _873;
    float _947 = -_939;
    float _949 = fma(_947, _795, 1.0);
    float _951 = _941 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _953 = fma(_663, (*spvDescriptorSet0.vp_c8)._m0[3].z, _913);
    float _955 = _945 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _957 = _915 * _881;
    float _959 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[7].x, _951);
    float _961 = _915 * _885;
    float _963 = _953 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _965 = _931 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _967 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[7].z, _959);
    float _969 = -_955;
    float _971 = fma(_961, (*spvDescriptorSet0.vp_c15)._m0[21].y, _969);
    float _973 = log2(_949);
    float _975 = fma(_963, (*spvDescriptorSet0.vp_c8)._m0[7].w, _967);
    float _977 = -_957;
    float _979 = fma(_977, (*spvDescriptorSet0.vp_c15)._m0[21].z, _971);
    float _981 = _941 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _983 = _941 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _985 = fma(_979, -0.5, 0.5);
    float _987 = exp2(_965);
    float _989 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[4].x, _981);
    float _991 = fma(_979, 0.5, 0.5);
    float _993 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[5].x, _983);
    float _995 = _961 + 1.0;
    float _997 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[4].z, _989);
    float _999 = fma(_991, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1001 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[5].z, _993);
    float _1003 = 1.0 / _975;
    float _1005 = fma(_963, (*spvDescriptorSet0.vp_c8)._m0[4].w, _997);
    float _1007 = fma(_991, _999, -0.212114393711090087890625);
    float _1009 = fma(_963, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1001);
    float _1011 = _973 * 0.693147182464599609375;
    float _1013 = fma(_991, _1007, 1.570728778839111328125);
    float _1015 = sqrt(_985);
    float _1017 = -_961;
    float _1019 = fma(_987, _995, _1017);
    float _1021 = _1011 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1023 = fma(_1019, 0.5, 0.5);
    float _1025 = _1005 * _1003;
    float _1027 = _1009 * _1003;
    float _1029 = fma(_1025, 0.5, 0.5);
    float _1031 = fma(_1027, -0.5, 0.5);
    float _1033 = _1015 * 0.636619746685028076171875;
    float3 _2737 = float3(_1029, _1031, _1021);
    float _1035 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2737, float3(0.0), isnan(_2737)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2737, float3(0.0), isnan(_2737)), level(0.0)).x;
    float _1037 = -_1013;
    float _1039 = fma(_1033, _1037, 1.0);
    float3 _2753 = float3(_1029, _1031, _1021);
    float4 _1042 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2753, float3(0.0), isnan(_2753)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2753, float3(0.0), isnan(_2753)), level(0.0)).xyzw;
    float _1044 = _1042.x;
    float _1046 = _1042.y;
    float _1048 = _1042.z;
    float _1050 = _1042.w;
    float2 _2770 = float2(_1039, _1023);
    float3 _1054 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2770, float2(0.0), isnan(_2770)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2770, float2(0.0), isnan(_2770)), level(0.0)).xyz;
    float _1056 = _1054.x;
    float _1058 = _1054.y;
    float _1060 = _1054.z;
    float _1062 = in.m_54.x;
    float _1064 = in.m_54.y;
    float _1066 = _941 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1068 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1070 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1072 = _1070 != 0;
    float _1074 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1066);
    int _1076 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1078 = _1076 != 0;
    float _1080 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1082 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1084 = _1080 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1086 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1088 = _1086 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1090 = _1062 > 0.5;
    float _1092 = _931 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1094 = _1064 > 0.5;
    float _1096 = -_165;
    int _1098 = _1090 ? as_type<int>(_1096) : as_type<int>(_165);
    float _1100 = exp2(_1092);
    float _1102 = -_169;
    int _1104 = _1094 ? as_type<int>(_1102) : as_type<int>(_169);
    bool _1106 = !_1072;
    float _1108 = _1106 ? _165 : as_type<float>(_1098);
    bool _1110 = !_1078;
    float _1112 = _1110 ? _169 : as_type<float>(_1104);
    float _1114 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1074);
    float _1116 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1118 = _1108 + 0.5;
    float _1120 = _1116 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1122 = -_1100;
    float _1124 = _1122 + 1.0;
    float _1126 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1128 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1130 = -_1112;
    float _1132 = _1130 + 0.5;
    float _1134 = _1124 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1136 = _1126 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1138 = _1128 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1140 = fma(_963, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1114);
    bool _1142 = _727 > 0.0;
    bool _1144 = isnan(_727);
    bool _1146 = _1142 || _1144;
    bool _1148 = isnan(0.0);
    bool _1150 = _1146 || _1148;
    float _1152 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1154 = _1118 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    out.m_64.x = _1120;
    out.m_64.y = _1136;
    out.m_64.z = _1138;
    float _1156 = _1132 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1158 = _1140 + _975;
    float _1160 = _1152 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.gl_Position.x = _1005;
    out.gl_Position.y = _1009;
    out.gl_Position.z = _1140;
    out.gl_Position.w = _975;
    float _1162 = _1154 * _1068;
    float _1164 = _1156 * _1082;
    float _1166 = _1158 * 0.5;
    out.m_66.x = _1088;
    out.m_66.y = _1160;
    out.m_66.z = _1084;
    float _1168 = _727 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_68.x = _1162;
    out.m_68.y = _1164;
    out.m_70.z = _1166;
    out.m_70.w = _975;
    out.m_45.x = _1168;
    float _1170 = _1134 * _1035;
    float _1172 = -_1134;
    float _1174 = _1172 + 1.0;
    float _1176 = _1050 * _1170;
    float _1178 = _1060 * _1170;
    float _1180 = _1050 * _1174;
    float _1182 = fma(_1056, _1176, _1044);
    float _1184 = fma(_1058, _1176, _1046);
    float _1186 = fma(_1050, _1178, _1048);
    out.m_72.x = _1182;
    out.m_72.y = _1184;
    out.m_72.z = _1186;
    out.m_72.w = _1180;
    if (_1150)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _1188 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1188;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

