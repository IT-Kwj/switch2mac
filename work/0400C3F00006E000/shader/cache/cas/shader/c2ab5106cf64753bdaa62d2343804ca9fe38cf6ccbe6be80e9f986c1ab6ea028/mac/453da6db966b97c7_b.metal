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

struct _33
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _16* vp_c9 [[id(0)]];
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c10 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c11 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    const device _33* vp_s0 [[id(7)]];
    texture2d<float> vp_t_tcb_24 [[id(8)]];
    sampler vp_t_tcb_24Smplr [[id(9)]];
    texture3d<float> vp_t_tcb_32 [[id(10)]];
    sampler vp_t_tcb_32Smplr [[id(11)]];
    texture3d<float> vp_t_tcb_30 [[id(12)]];
    sampler vp_t_tcb_30Smplr [[id(13)]];
    texture2d<float> vp_t_tcb_1C [[id(14)]];
    sampler vp_t_tcb_1CSmplr [[id(15)]];
    sampler vp_t_tcb_24Smplr_w [[id(16)]];
    sampler vp_t_tcb_32Smplr_w [[id(17)]];
    sampler vp_t_tcb_30Smplr_w [[id(18)]];
    sampler vp_t_tcb_1CSmplr_w [[id(19)]];
    constant dm_border_t* dm_border [[id(20)]];
};

struct main0_out
{
    float4 m_87 [[user(locn0)]];
    float4 m_77 [[user(locn1)]];
    float4 m_79 [[user(locn2)]];
    float4 m_85 [[user(locn3)]];
    float4 m_95 [[user(locn4)]];
    float4 m_56 [[user(locn5)]];
    float4 m_83 [[user(locn6)]];
    float4 m_75 [[user(locn7)]];
    float4 m_93 [[user(locn8)]];
    float4 m_89 [[user(locn9)]];
    float4 m_91 [[user(locn10)]];
    float4 m_97 [[user(locn11)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_81 [[attribute(0)]];
    float4 m_62 [[attribute(1)]];
    float4 m_60 [[attribute(2)]];
    float4 m_64 [[attribute(3)]];
    float4 m_68 [[attribute(4)]];
    float4 m_53 [[attribute(5)]];
    float4 m_58 [[attribute(6)]];
    float4 m_66 [[attribute(7)]];
    float4 m_73 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1840 = false;
    bool _360 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _111 = in.m_53.w;
    float _113 = trunc(_111);
    int _116 = int(_113);
    bool _120 = _116 >= 1;
    float _122 = 0.0;
    if (!_120)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _124 = _122;
    float _126 = _124;
    if (!_120)
    {
        out.m_56.x = 0.0;
    }
    int _128 = 0;
    if (!_120)
    {
        float _130 = _124 * 5.0;
        _128 = as_type<int>(_130);
    }
    int _132 = _128;
    int _134 = _132;
    if (!_120)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2185 = as_type<float>(_132);
        out.gl_Position.z = _2185;
    }
    if (!_120)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _136 = in.m_58.w;
    bool _138 = _136 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _140 = isnan(_136);
    bool _142 = _138 || _140;
    bool _144 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _146 = _142 || _144;
    float _148 = -_136;
    float _150 = _148 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_146)
    {
        float _152 = float(_116);
        _126 = _152;
    }
    float _154 = _126;
    bool _156 = _150 >= _154;
    bool _158 = !_146;
    bool _160 = _156 || _158;
    float _162 = _154;
    if (_160)
    {
        _162 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _164 = _162;
    if (_160)
    {
        out.m_56.x = 0.0;
    }
    if (_160)
    {
        float _166 = _164 * 5.0;
        _134 = as_type<int>(_166);
    }
    int _168 = _134;
    if (_160)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2254 = as_type<float>(_168);
        out.gl_Position.z = _2254;
    }
    if (_160)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _170 = in.m_60.x;
    float _172 = in.m_60.y;
    float _174 = in.m_60.z;
    float _176 = in.m_62.x;
    float _178 = in.m_62.y;
    float _180 = in.m_62.z;
    float _182 = in.m_64.x;
    float _184 = in.m_64.y;
    float _186 = in.m_64.z;
    float _188 = in.m_66.x;
    float _190 = _170 * _170;
    float _192 = _172 * _172;
    float _194 = _174 * _174;
    float _196 = fma(_176, _176, _190);
    float _198 = fma(_178, _178, _192);
    float _200 = fma(_180, _180, _194);
    float _202 = fma(_182, _182, _196);
    float _204 = fma(_184, _184, _198);
    float _206 = fma(_186, _186, _200);
    float _208 = sqrt(_202);
    float _210 = sqrt(_204);
    float _212 = sqrt(_206);
    bool _214 = _208 > 0.0;
    bool _216 = _210 > 0.0;
    float _218 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _220 = _202;
    if (_214)
    {
        float _222 = rsqrt(_202);
        _220 = _222;
    }
    float _224 = _220;
    float _226 = _218 * _188;
    bool _228 = _212 > 0.0;
    float _230 = 0.0;
    if (!_214)
    {
        _230 = 0.0;
    }
    float _232 = _230;
    float _234 = 0.0;
    float _236 = _232;
    if (!_214)
    {
        _234 = 0.0;
    }
    float _238 = _234;
    float _240 = 0.0;
    float _242 = 0.0;
    float _244 = _238;
    if (!_216)
    {
        _240 = 0.0;
        _242 = 0.0;
    }
    float _246 = _240;
    float _248 = _242;
    float _250 = 0.0;
    float _252 = _248;
    float _254 = _246;
    if (!_214)
    {
        _250 = 0.0;
    }
    float _256 = _250;
    float _258 = _212;
    float _260 = _256;
    if (_216)
    {
        float _262 = rsqrt(_204);
        _258 = _262;
    }
    float _264 = _258;
    float _266 = 0.0;
    if (!_216)
    {
        _266 = 0.0;
    }
    float _268 = _266;
    float _270 = 0.0;
    float _272 = 0.0;
    float _274 = _268;
    if (!_228)
    {
        _270 = 0.0;
        _272 = 0.0;
    }
    float _276 = _270;
    float _278 = _272;
    float _280 = _278;
    float _282 = _276;
    if (_214)
    {
        float _284 = _224 * _176;
        _236 = _284;
    }
    float _286 = _236;
    float _288 = _208;
    if (_228)
    {
        float _290 = rsqrt(_206);
        _288 = _290;
    }
    float _292 = _288;
    if (_214)
    {
        float _294 = _224 * _170;
        _244 = _294;
    }
    float _296 = _244;
    if (_214)
    {
        float _298 = _224 * _182;
        _260 = _298;
    }
    float _300 = _260;
    bool _302 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _304 = 0.0;
    if (!_228)
    {
        _304 = 0.0;
    }
    float _306 = _304;
    float _308 = trunc(_226);
    int _310 = int(_308);
    float _312 = _306;
    if (_216)
    {
        float _314 = _264 * _178;
        _274 = _314;
    }
    float _316 = _274;
    if (_216)
    {
        float _318 = _264 * _172;
        _252 = _318;
    }
    float _320 = _252;
    if (_216)
    {
        float _322 = _264 * _184;
        _254 = _322;
    }
    float _324 = _254;
    if (_228)
    {
        float _326 = _292 * _180;
        _280 = _326;
    }
    float _328 = _280;
    if (_228)
    {
        float _330 = _292 * _174;
        _312 = _330;
    }
    float _332 = _312;
    if (_228)
    {
        float _334 = _292 * _186;
        _282 = _334;
    }
    float _336 = _282;
    int _338 = _310 << 4;
    int _340 = _338 + 1712;
    bool _342 = !_302;
    float _358;
    if (!_342)
    {
        float _344 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _346 = _188 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _348 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[11].y, _150);
        float _350 = _348 * _344;
        float _352 = floor(_350);
        float _354 = -_352;
        float _356 = _350 + _354;
        _358 = _356;
        _360 = true;
    }
    else
    {
        float _362 = float(_116);
        float _364 = 1.0 / _362;
        float _366 = _150 * _364;
        _358 = _366;
    }
    _360 = false;
    float _368 = _358;
    float _370 = in.m_68.w;
    float _372 = in.m_53.x;
    float _374 = in.m_53.y;
    float _376 = in.m_53.z;
    float _378 = in.m_60.w;
    float _380 = in.m_62.w;
    float _382 = in.m_64.w;
    float _384 = trunc(_370);
    int _386 = int(_384);
    int _388 = _386 << 5;
    uint _391 = uint(int(uint(_388) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_391)];
    float _393 = as_type<float>(_dmw0.x);
    int _395 = _388 + 4;
    uint _397 = uint(int(uint(_395) >> uint(2)));
    float _399 = as_type<float>(_dmw0.y);
    int _401 = _388 + 8;
    uint _403 = uint(int(uint(_401) >> uint(2)));
    float _405 = as_type<float>(_dmw0.z);
    int _407 = _388 + 12;
    uint _409 = uint(int(uint(_407) >> uint(2)));
    float _411 = as_type<float>(_dmw0.w);
    float _413 = _172 * _374;
    float _415 = _178 * _374;
    float _417 = _184 * _374;
    float _419 = fma(_170, _372, _413);
    float _421 = fma(_176, _372, _415);
    float _423 = fma(_182, _372, _417);
    float _425 = as_type<float>(int(gl_VertexIndex));
    float _427 = fma(_174, _376, _419);
    float _429 = fma(_180, _376, _421);
    float _431 = fma(_186, _376, _423);
    float _433 = _427 + _378;
    float _435 = _429 + _380;
    float _437 = _431 + _382;
    float _439 = in.m_73.x;
    float _441 = in.m_73.y;
    float _443 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _445 = _433 + _443;
    float _447 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _449 = _435 + _447;
    float _451 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _453 = _437 + _451;
    float _455 = _445 * _445;
    float _457 = fma(_449, _449, _455);
    float _459 = fma(_453, _453, _457);
    int _461 = as_type<int>(_425) & 1;
    bool _463 = _461 != 0;
    int _465 = as_type<int>(_425) & 2;
    bool _467 = _465 != 0;
    float _469 = rsqrt(_459);
    bool _471 = !_463;
    float _473 = _471 ? (-0.5) : 0.5;
    bool _475 = !_467;
    float _477 = _475 ? (-0.5) : 0.5;
    float _479 = _441 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _481 = _479 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _483 = _445 * _469;
    float _485 = _449 * _469;
    float _487 = -_483;
    float _489 = fma(_487, (*spvDescriptorSet0.vp_c9)._m0[18].w, _445);
    float _491 = -_485;
    float _493 = fma(_491, (*spvDescriptorSet0.vp_c9)._m0[18].w, _449);
    float _495 = _453 * _469;
    float _497 = _489 * _489;
    float _499 = -_495;
    float _501 = fma(_499, (*spvDescriptorSet0.vp_c9)._m0[18].w, _453);
    float _503 = fma(_493, _493, _497);
    float _505 = fma(_501, _501, _503);
    float _507 = _439 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _509 = sqrt(_505);
    float _511 = _507 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _513 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _477);
    float _515 = _469 * _509;
    float _517 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _473);
    float _519 = _511 * _515;
    float _521 = _515 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _523 = _521 * 0.5;
    float _525 = _481 * _515;
    float _527 = _519 * _517;
    float _529 = _523 * _324;
    float _531 = _525 * _513;
    float _533 = _523 * _316;
    float _535 = _523 * _320;
    float _537 = fma(_527, _300, _529);
    float _539 = fma(_527, _286, _533);
    float _541 = -_531;
    float _543 = fma(_541, _336, _537);
    float _545 = -_531;
    float _547 = fma(_545, _328, _539);
    float _549 = _437 + _543;
    float _551 = fma(_527, _296, _535);
    float _553 = _435 + _547;
    float _555 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _557 = _549 + _555;
    float _559 = -_531;
    float _561 = fma(_559, _332, _551);
    float _563 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _565 = _553 + _563;
    float _567 = _557 * _557;
    float _569 = _433 + _561;
    float _571 = fma(_565, _565, _567);
    float _573 = sqrt(_571);
    bool _575 = _573 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _577 = _561;
    float _579 = _437;
    if (!_575)
    {
        _577 = _553;
    }
    float _581 = _577;
    float _583 = _411 * 2.0;
    float _585 = _393 * 2.0;
    float _587 = _399 * 2.0;
    float _589 = _393 * _393;
    float _591 = _405 * _583;
    float _593 = _393 * _583;
    float _595 = _399 * _583;
    float _597 = _405 * _405;
    float _599 = -_591;
    float _601 = fma(_399, _585, _599);
    float _603 = fma(_399, _585, _591);
    float _605 = fma(_405, _585, _595);
    float _607 = -_595;
    float _609 = fma(_405, _585, _607);
    float _611 = -_593;
    float _613 = fma(_405, _587, _611);
    float _615 = _399 * _399;
    float _617 = fma(_405, _587, _593);
    float _619 = _393;
    float _621 = _399;
    float _623 = _581;
    if (!_575)
    {
        _619 = _549;
    }
    float _625 = _619;
    float _627 = _625;
    if (!_575)
    {
        _621 = _569;
    }
    float _629 = _621;
    bool _631 = !_575;
    float _633 = _629;
    if (!_631)
    {
        float _635 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _637 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _639 = _573 + _637;
        float _641 = _569 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _643 = rsqrt(_571);
        float _645 = _639 * _635;
        float _647 = _645 * 0.15915493667125701904296875;
        float _649 = _647 * 6.283185482025146484375;
        float _651 = cos(_649);
        float _653 = _647 * 6.283185482025146484375;
        float _655 = sin(_653);
        float _657 = _651 + (-1.0);
        float _659 = _657 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _661 = fma(_655, _641, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _663 = fma(_569, _651, _659);
        float _665 = _643 * _661;
        float _667 = fma(_565, _665, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _669 = fma(_557, _665, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _633 = _663;
        _623 = _667;
        _627 = _669;
    }
    float _671 = _633;
    float _673 = _623;
    float _675 = _627;
    float _677 = -_433;
    float _679 = _677 + _671;
    float _681 = -_435;
    float _683 = _681 + _673;
    float _685 = fma(_615, -2.0, 1.0);
    float _687 = fma(_589, -2.0, 1.0);
    float _689 = _679 * _320;
    float _691 = _679 * _296;
    float _693 = _679 * _332;
    float _695 = -_437;
    float _697 = _695 + _675;
    float _699 = fma(_683, _316, _689);
    float _701 = fma(_597, -2.0, _685);
    float _703 = fma(_683, _286, _691);
    float _705 = fma(_597, -2.0, _687);
    float _707 = fma(_697, _324, _699);
    float _709 = fma(_683, _328, _693);
    float _711 = fma(_697, _300, _703);
    float _713 = _707 * _601;
    float _715 = _707 * _705;
    float _717 = _707 * _617;
    float _719 = fma(_697, _336, _709);
    float _721 = fma(_711, _701, _713);
    float _723 = fma(_711, _603, _715);
    float _725 = fma(_615, -2.0, _687);
    float _727 = fma(_711, _609, _717);
    bool _729 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _731 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _733 = _729 || _731;
    bool _735 = isnan(0.5);
    bool _737 = _733 || _735;
    float _739 = fma(_719, _613, _723);
    float _741 = fma(_719, _605, _721);
    float _743 = fma(_719, _725, _727);
    float _745 = -_495;
    float _747 = fma(_745, (*spvDescriptorSet0.vp_c9)._m0[18].w, _437);
    float _749 = _433 + _739;
    float _751 = -_483;
    float _753 = fma(_751, (*spvDescriptorSet0.vp_c9)._m0[18].w, _433);
    float _755 = _437 + _743;
    float _757 = _435 + _741;
    float _759 = -_483;
    float _761 = fma(_759, (*spvDescriptorSet0.vp_c9)._m0[18].w, _749);
    float _763 = -_495;
    float _765 = fma(_763, (*spvDescriptorSet0.vp_c9)._m0[18].w, _755);
    float _767 = -_485;
    float _769 = fma(_767, (*spvDescriptorSet0.vp_c9)._m0[18].w, _757);
    float _771 = -_485;
    float _773 = fma(_771, (*spvDescriptorSet0.vp_c9)._m0[18].w, _435);
    float _775 = _755;
    float _777 = _761;
    float _779 = _769;
    float _781 = _739;
    float _783 = _741;
    if (_737)
    {
        _775 = _761;
    }
    float _785 = _775;
    float _787 = _785;
    if (_737)
    {
        _777 = _765;
    }
    float _789 = _777;
    float _791 = _789;
    if (!_737)
    {
        float _793 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _795 = _753 + _793;
        float _797 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _799 = _773 + _797;
        float _801 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _803 = _795 * _795;
        float _805 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _807 = _747 + _805;
        float _809 = fma(_799, _799, _803);
        float _811 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _813 = fma(_807, _807, _809);
        float _815 = sqrt(_813);
        float _817 = 1.0 / _515;
        float _819 = precise::min(_815, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _821 = _819 * _801;
        float _823 = _811 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _825 = _821 * _817;
        float _827 = _823 * _825;
        float _829 = fma(_741, _827, _773);
        float _831 = fma(_739, _827, _753);
        float _833 = fma(_743, _827, _747);
        _787 = _831;
        _779 = _829;
        _791 = _833;
    }
    float _835 = _787;
    float _837 = _779;
    float _839 = _791;
    float _841 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _843 = _835 + _841;
    float _845 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _847 = _837 + _845;
    float _849 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _851 = _839 + _849;
    float _853 = _843 * _843;
    float _855 = fma(_847, _847, _853);
    float _857 = fma(_851, _851, _855);
    float _859 = rsqrt(_857);
    float _861 = sqrt(_857);
    float _863 = _847 * _859;
    float _865 = _851 * _859;
    float _867 = _843 * _859;
    float _869 = _863 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _871 = _865 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _873 = _869 * _869;
    float _875 = _871 * _871;
    float _877 = _873 + _875;
    float _879 = sqrt(_877);
    bool _881 = _879 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _883 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _885 = _879 + _883;
    float _887 = _743;
    float _889 = _877;
    float _891 = _885;
    if (_881)
    {
        float _893 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _887 = _893;
    }
    float _895 = _887;
    if (_881)
    {
        float _897 = rsqrt(_877);
        _889 = _897;
    }
    float _899 = _889;
    float _901 = _899;
    if (_881)
    {
        float _903 = _885 * _895;
        _891 = _903;
    }
    float _905 = _891;
    if (_881)
    {
        float _907 = _905 * 0.15915493667125701904296875;
        _781 = _907;
    }
    float _909 = _781;
    float _911 = _515;
    float _913 = _909;
    if (_881)
    {
        float _915 = _909 * 6.283185482025146484375;
        float _917 = sin(_915);
        _911 = _917;
    }
    float _919 = _911;
    float _921 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _923 = precise::max(0.0, _921);
    float _925 = _895;
    float _927 = _923;
    float _929 = _921;
    if (_881)
    {
        float _931 = _909 * 6.283185482025146484375;
        float _933 = cos(_931);
        _925 = _933;
    }
    float _935 = _925;
    float _937 = -_867;
    float _939 = -_923;
    float _941 = fma(_937, (*spvDescriptorSet0.vp_c15)._m0[24].y, _939);
    if (_881)
    {
        float _943 = _941 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _927 = _943;
    }
    float _945 = _927;
    float _947 = _945;
    if (!_881)
    {
        _913 = _871;
    }
    float _949 = _913;
    float _951 = _919;
    float _953 = _949;
    if (_881)
    {
        float _955 = fma(_919, _945, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _783 = _955;
    }
    float _957 = _783;
    float _959 = _957;
    if (!_881)
    {
        _951 = _869;
    }
    float _961 = _951;
    float _963 = _961;
    if (!_881)
    {
        _947 = _941;
    }
    float _965 = _947;
    float _967 = _965;
    if (_881)
    {
        float _969 = _935 + (-1.0);
        _929 = _969;
    }
    float _971 = _929;
    float _973 = 0.0;
    float _975 = _971;
    if (_881)
    {
        float _977 = _899 * _957;
        _973 = _977;
    }
    float _979 = _973;
    if (!_881)
    {
        _901 = _873;
    }
    float _981 = _901;
    float _983 = _981;
    if (_881)
    {
        float _985 = _971 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _975 = _985;
    }
    float _987 = _975;
    if (_881)
    {
        float _989 = _869 * _979;
        _963 = _989;
    }
    float _991 = _963;
    if (_881)
    {
        float _993 = _871 * _979;
        _953 = _993;
    }
    float _995 = _953;
    if (!_881)
    {
        _959 = _875;
    }
    float _997 = _959;
    float _999 = _997;
    if (_881)
    {
        float _1001 = fma(_941, _935, _987);
        _967 = _1001;
    }
    float _1003 = _967;
    if (_881)
    {
        float _1005 = _991 * _991;
        _983 = _1005;
    }
    float _1007 = _983;
    if (_881)
    {
        float _1009 = _995 * _995;
        _999 = _1009;
    }
    float _1011 = _999;
    float _1013 = _835 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1015 = fma(_1003, _1003, _1007);
    float _1017 = _835 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1019 = fma(_837, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1013);
    float _1021 = _1015 + _1011;
    float _1023 = fma(_837, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1017);
    float _1025 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1027 = fma(_861, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1025);
    float _1029 = precise::clamp(_1027, 0.0, 1.0);
    float _1031 = _835 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1033 = fma(_839, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1023);
    float _1035 = -_1029;
    float _1037 = _1035 + 1.0;
    float _1039 = rsqrt(_1021);
    float _1041 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1043 = _1033 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1045 = fma(_747, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1047 = fma(_837, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1031);
    float _1049 = _1043 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1051 = fma(_839, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1019);
    float _1053 = abs(_1037);
    float _1055 = log2(_1053);
    float _1057 = fma(_839, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1047);
    float _1059 = -_1049;
    float _1061 = fma(_1059, _1041, 1.0);
    float _1063 = _835 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1065 = fma(_773, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1067 = _1057 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1069 = _1051 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1071 = fma(_837, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1063);
    float _1073 = floor(_1065);
    float _1075 = _1039 * _991;
    float _1077 = _1039 * _1003;
    float _1079 = fma(_839, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1071);
    float _1081 = _1039 * _995;
    float _1083 = _1067 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1085 = _1075 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1087 = _1079 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1089 = log2(_1061);
    float _1091 = _1055 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1093 = -_1085;
    float _1095 = fma(_1077, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1093);
    float _1097 = fma(_1087, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1083);
    float _1099 = -_1081;
    float _1101 = fma(_1099, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1095);
    float _1103 = floor(_1045);
    float _1105 = fma(_1043, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1097);
    float _1107 = fma(_1101, -0.5, 0.5);
    float _1109 = -_1073;
    float _1111 = _1065 + _1109;
    float _1113 = _1067 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1115 = fma(_1069, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1105);
    float _1117 = _1067 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1119 = fma(_1101, 0.5, 0.5);
    float _1121 = exp2(_1091);
    float _1123 = fma(_1087, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1113);
    float _1125 = fma(_1087, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1117);
    float _1127 = _1077 + 1.0;
    float _1129 = fma(_1043, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1123);
    float _1131 = fma(_1043, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1125);
    float _1133 = 1.0 / _1115;
    float _1135 = -_1103;
    float _1137 = _1045 + _1135;
    float _1139 = fma(_1119, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1141 = fma(_1119, _1139, -0.212114393711090087890625);
    float _1143 = sqrt(_1107);
    float _1145 = -_1077;
    float _1147 = fma(_1121, _1127, _1145);
    float _1149 = fma(_1069, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1129);
    float _1151 = fma(_1069, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1131);
    float _1153 = _1089 * 0.693147182464599609375;
    float2 _3793 = float2(_1111, _1137);
    float _1155 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3793, float2(0.0), isnan(_3793)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3793, float2(0.0), isnan(_3793)), level(0.0)).x;
    float _1157 = fma(_1119, _1141, 1.570728778839111328125);
    float _1159 = fma(_1147, 0.5, 0.5);
    float _1161 = _1149 * _1133;
    float _1163 = _1151 * _1133;
    float _1165 = _1153 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1167 = fma(_1161, 0.5, 0.5);
    float _1169 = fma(_1163, -0.5, 0.5);
    float _1171 = _1143 * 0.636619746685028076171875;
    float3 _3827 = float3(_1167, _1169, _1165);
    float _1173 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3827, float3(0.0), isnan(_3827)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3827, float3(0.0), isnan(_3827)), level(0.0)).x;
    float _1175 = -_1157;
    float _1177 = fma(_1171, _1175, 1.0);
    float3 _3843 = float3(_1167, _1169, _1165);
    float4 _1180 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3843, float3(0.0), isnan(_3843)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3843, float3(0.0), isnan(_3843)), level(0.0)).xyzw;
    float _1182 = _1180.x;
    float _1184 = _1180.y;
    float _1186 = _1180.z;
    float _1188 = _1180.w;
    float2 _3859 = float2(_1177, _1159);
    float3 _1192 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3859, float2(0.0), isnan(_3859)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3859, float2(0.0), isnan(_3859)), level(0.0)).xyz;
    float _1194 = _1192.x;
    float _1196 = _1192.y;
    float _1198 = _1192.z;
    float _1200 = in.m_66.y;
    float _1202 = _1055 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1204 = _1067 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1206 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1208 = _1206 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1210 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _1212 = _753 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1214 = _753 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1216 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1218 = _1216 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1220 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1222 = _1220 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1224 = 1.0 / _1208;
    float _1226 = fma(_773, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1214);
    float _1228 = _1210 * _188;
    float _1230 = fma(_773, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1212);
    float _1232 = fma(_747, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1226);
    float _1234 = fma(_747, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1230);
    float _1236 = 1.0 / _1218;
    float _1238 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1240 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1238;
    int _1242 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1244 = _1242 != 0;
    float _1246 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1248 = _1246 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    bool _1250 = _1200 > 0.5;
    float _1252 = _1232 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    int _1254 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1256 = _1254 != 0;
    float _1258 = 1.0 / _1222;
    float _1260 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.300000011920928955078125;
    float _1262 = _1248 * _1224;
    float _1264 = _1234 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1266 = _188 > 0.5;
    float _1268 = trunc(_1228);
    int _1270 = int(_1268);
    float _1272 = _1240 * _1236;
    float _1274 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1276 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1274;
    float _1278 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1280 = fma(_1260, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1278);
    float _1282 = _473 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1284 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1286 = fma(_1260, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1284);
    float _1288 = _1264 + _1252;
    out.m_75.x = _837;
    out.m_75.y = _835;
    out.m_75.z = _839;
    float _1290 = 1.0 / _1252;
    float _1292 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _1286);
    float _1294 = _437 + _1292;
    int _1296 = _1270 << 4;
    int _1298 = _1296 + 1968;
    float _1300 = _1276 * _1258;
    float _1302 = fma(_1282, _286, _316);
    int _1304 = _1298 + 8;
    uint _1306 = uint(int(uint(_1304) >> uint(2)));
    uint _1308 = uint(int(uint(int(_1306)) >> uint(2)));
    int _1310 = int(_1306) & 3;
    float _1312 = (*spvDescriptorSet0.vp_c9)._m0[int(_1308)][_1310];
    float _1314 = _477 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1316 = exp2(_1202);
    float _1318 = _1288 * _1290;
    float _1320 = _1318 * 0.5;
    float _1322 = fma(_1282, _296, _320);
    float _1324 = fma(_1282, _300, _324);
    float _1326 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1328 = _368 + _1326;
    float _1330 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1332 = fma(_1320, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1330);
    uint _1334 = uint(int(uint(_1298) >> uint(2)));
    uint _1336 = uint(int(uint(int(_1334)) >> uint(2)));
    int _1338 = int(_1334) & 3;
    float _1340 = (*spvDescriptorSet0.vp_c9)._m0[int(_1336)][_1338];
    int _1342 = int(_1334) + 1;
    uint _1344 = uint(int(uint(_1342) >> uint(2)));
    int _1346 = _1342 & 3;
    float _1348 = (*spvDescriptorSet0.vp_c9)._m0[int(_1344)][_1346];
    float _1350 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1352 = _368 + _1350;
    float _1354 = fma(_1262, _1328, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1356 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1358 = _368 + _1356;
    float _1360 = -_473;
    int _1362 = _1266 ? as_type<int>(_1360) : as_type<int>(_473);
    float _1364 = 1.0 / _1332;
    float _1366 = fma(_1272, _1352, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1368 = fma(_1300, _1358, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    bool _1370 = !_1244;
    float _1372 = _1370 ? _473 : as_type<float>(_1362);
    float _1374 = -_1314;
    float _1376 = fma(_1374, _332, _1322);
    bool _1378 = _368 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1380 = isnan(_368);
    bool _1382 = _1378 || _1380;
    bool _1384 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1386 = _1382 || _1384;
    float _1388 = float(_1386);
    float _1390 = -_1316;
    float _1392 = _1390 + 1.0;
    bool _1394 = _368 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1396 = isnan(_368);
    bool _1398 = _1394 || _1396;
    bool _1400 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1402 = _1398 || _1400;
    float _1404 = float(_1402);
    float _1406 = _1372 + 0.5;
    bool _1408 = _368 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1410 = isnan(_368);
    bool _1412 = _1408 || _1410;
    bool _1414 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1416 = _1412 || _1414;
    float _1418 = float(_1416);
    float _1420 = -_1388;
    float _1422 = _1420 + 1.0;
    bool _1424 = _368 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1426 = isnan(_368);
    bool _1428 = _1424 || _1426;
    bool _1430 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1432 = _1428 || _1430;
    float _1434 = float(_1432);
    float _1436 = -_1404;
    float _1438 = _1436 + 1.0;
    bool _1440 = 0.0 != (*spvDescriptorSet0.vp_c11)._m0[20].z;
    bool _1442 = isnan(0.0);
    bool _1444 = _1440 || _1442;
    bool _1446 = isnan((*spvDescriptorSet0.vp_c11)._m0[20].z);
    bool _1448 = _1444 || _1446;
    float _1450 = _1404 * _1422;
    float _1452 = -_477;
    int _1454 = _1250 ? as_type<int>(_1452) : as_type<int>(_477);
    float _1456 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1458 = _1364 * _1456;
    float _1460 = _1418 * _1438;
    float _1462 = -_1418;
    float _1464 = _1462 + 1.0;
    bool _1466 = !_1256;
    float _1468 = _1466 ? _477 : as_type<float>(_1454);
    float _1470 = abs(_1458);
    float _1472 = log2(_1470);
    float _1474 = -_1314;
    float _1476 = fma(_1474, _328, _1302);
    float _1478 = -_1314;
    float _1480 = fma(_1478, _336, _1324);
    float _1482 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _1280);
    uint _1484 = uint(int(uint(_340) >> uint(2)));
    uint _1486 = uint(int(uint(int(_1484)) >> uint(2)));
    int _1488 = int(_1484) & 3;
    float _1490 = (*spvDescriptorSet0.vp_c9)._m0[int(_1486)][_1488];
    int _1492 = int(_1484) + 1;
    uint _1494 = uint(int(uint(_1492) >> uint(2)));
    int _1496 = _1492 & 3;
    float _1498 = (*spvDescriptorSet0.vp_c9)._m0[int(_1494)][_1496];
    float _1500 = _1434 * _1464;
    float _1502 = (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _1504 = _1115;
    if (_1448)
    {
        float _1506 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.20000000298023223876953125;
        _1502 = _1506;
    }
    float _1508 = _1502;
    float _1510 = _435 + _1482;
    float _1512 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1514 = _1366 * _1500;
    float _1516 = -_1468;
    float _1518 = _1516 + 0.5;
    if (_1448)
    {
        float _1520 = precise::min(_1508, 20.0);
        _579 = _1520;
    }
    float _1522 = _579;
    int _1524 = _340 + 8;
    uint _1526 = uint(int(uint(_1524) >> uint(2)));
    uint _1528 = uint(int(uint(int(_1526)) >> uint(2)));
    int _1530 = int(_1526) & 3;
    float _1532 = (*spvDescriptorSet0.vp_c9)._m0[int(_1528)][_1530];
    float _1534 = -_1510;
    float _1536 = _1534 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _1538 = _1312 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1540 = _1472 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1542 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1544 = _1538 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1546 = precise::min(_1510, _1536);
    float _1548 = -_1294;
    float _1550 = _1548 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _1552 = _1406 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1554 = _1518 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1556 = _1340 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1558 = _1348 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1560 = exp2(_1540);
    float _1562 = precise::min(_1294, _1550);
    float _1564 = _1556 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1566 = _1558 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1568 = _1458 <= 8000.0;
    bool _1570 = isnan(_1458);
    bool _1572 = _1568 || _1570;
    bool _1574 = isnan(8000.0);
    bool _1576 = _1572 || _1574;
    float _1578 = float(_1576);
    float _1580 = -_1434;
    float _1582 = _1580 + 1.0;
    float _1584 = precise::min(_1546, _1562);
    float _1586 = _1376 * _601;
    float _1588 = _1522;
    float _1590 = _1552;
    if (_1448)
    {
        float _1592 = 1.0 / _1522;
        _1588 = _1592;
    }
    float _1594 = _1588;
    out.m_77.x = _1564;
    out.m_77.y = _1566;
    out.m_77.z = _1544;
    float _1596 = _1376 * _705;
    float _1598 = fma(_1582, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1514);
    float _1600 = fma(_1476, _603, _1596);
    float _1602 = fma(_1354, _1460, _1598);
    float _1604 = fma(_1560, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1606 = precise::clamp(_1604, 0.0, 1.0);
    float _1608 = fma(_1480, _613, _1600);
    float _1610 = _1392 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1612 = fma(_1606, -2.0, 3.0);
    float _1614 = _1606 * _1606;
    float _1616 = _1552 * _1512;
    float _1618 = _1554 * _1542;
    float _1620 = _1610;
    if (!_1448)
    {
        _1590 = 1.0;
    }
    float _1622 = _1590;
    float _1624 = _1614 * _1612;
    float _1626 = _1622;
    if (_1448)
    {
        float _1628 = _1584 * _1594;
        float _1630 = precise::clamp(_1628, 0.0, 1.0);
        _1626 = _1630;
    }
    float _1632 = _1626;
    float _1634 = fma(_1087, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1204);
    out.m_79.x = _1616;
    out.m_79.y = _1618;
    float _1636 = _1376 * _617;
    float _1638 = fma(_1476, _701, _1586);
    float _1640 = fma(_1043, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1634);
    float _1642 = in.m_81.x;
    float _1644 = fma(_1476, _609, _1636);
    float _1646 = fma(_1480, _605, _1638);
    float _1648 = fma(_1069, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1640);
    float _1650 = fma(_1480, _725, _1644);
    float _1652 = -_1624;
    float _1654 = _1652 + 1.0;
    float _1656 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _1658 = _1648 + _1656;
    float _1660 = _1498 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1662 = fma(_1654, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1624);
    float _1664 = _1490 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1666 = _1115 + _1658;
    out.gl_Position.x = _1149;
    out.gl_Position.y = _1151;
    out.gl_Position.z = _1658;
    out.gl_Position.w = _1115;
    float _1668 = _1578 * _1662;
    bool _1670 = _861 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1672 = isnan(_861);
    bool _1674 = _1670 || _1672;
    bool _1676 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1678 = _1674 || _1676;
    float _1680 = _1666 * 0.5;
    out.m_83.x = _1646;
    out.m_83.y = _1608;
    out.m_83.z = _1650;
    float _1682 = _1668 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1684 = fma(_1368, _1450, _1602);
    float _1686 = _1532 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    out.m_85.z = _1680;
    out.m_85.w = _1115;
    float _1688 = _1664 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1690 = fma(_1388, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1684);
    float _1692 = _1660 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1694 = _1686 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1696 = _1632 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1698 = -_1610;
    float _1700 = _1698 + 1.0;
    float _1702 = _1690 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1704 = _1658;
    float _1706 = _1688;
    float _1708 = _1700;
    if (!_1678)
    {
        _1504 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1710 = _1504;
    float _1712 = _1710;
    float _1714 = _1710;
    if (!_1678)
    {
        _1704 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1716 = _1704;
    out.m_87.x = _1688;
    out.m_87.y = _1692;
    out.m_87.z = _1694;
    out.m_87.w = _1702;
    float _1718 = _1716;
    float _1720 = _1716;
    if (!_1678)
    {
        _1706 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1722 = _1706;
    float _1724 = -_1155;
    float _1726 = _1724 + 1.0;
    float _1728 = _1726 * _1682;
    float _1730 = precise::clamp(_1728, 0.0, 1.0);
    float _1732 = -_1730;
    float _1734 = fma(_1732, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1736 = _1610 * _1173;
    float _1738 = _1734 * _1642;
    float _1740 = _1722;
    float _1742 = _1722;
    if (!_1678)
    {
        _1620 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1744 = _1620;
    float _1746 = _1188 * _1736;
    float _1748 = _1738 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1750 = _1188 * _1700;
    float _1752 = _1746;
    float _1754 = _1744;
    float _1756 = _1744;
    if (!_1678)
    {
        _1708 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1758 = _1708;
    float _1760 = _1198 * _1736;
    float _1762 = fma(_1194, _1746, _1182);
    float _1764 = fma(_1196, _1746, _1184);
    out.m_89.x = _1748;
    float _1766 = fma(_1188, _1760, _1186);
    float _1768 = _1758;
    float _1770 = _1758;
    if (!_1678)
    {
        _1752 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1772 = _1752;
    out.m_91.x = _1762;
    out.m_91.y = _1764;
    out.m_91.z = _1766;
    out.m_91.w = _1750;
    bool _1774 = !_1678;
    float _1776 = _1772;
    float _1778 = _1772;
    if (!_1774)
    {
        bool _1780 = _861 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1782 = isnan(_861);
        bool _1784 = _1780 || _1782;
        bool _1786 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1788 = _1784 || _1786;
        if (!_1788)
        {
            float _1790 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1792 = _861 + _1790;
            float _1794 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1796 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1794;
            float _1798 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1800 = _1798 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1802 = 1.0 / _1796;
            float _1804 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1806 = _1804 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1808 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1810 = _1808 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1812 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1814 = _1812 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1816 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1818 = _1816 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1820 = _1792 * _1802;
            float _1822 = precise::clamp(_1820, 0.0, 1.0);
            float _1824 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1826 = _1824 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1828 = fma(_1822, _1800, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1830 = fma(_1822, _1826, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1832 = fma(_1822, _1806, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1834 = fma(_1822, _1810, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1836 = fma(_1822, _1814, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1838 = fma(_1822, _1818, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1714 = _1832;
            _1770 = _1836;
            _1742 = _1828;
            _1778 = _1834;
            _1720 = _1830;
            _1756 = _1838;
            _1840 = true;
        }
        else
        {
            bool _1842 = _861 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1844 = isnan(_861);
            bool _1846 = _1842 || _1844;
            bool _1848 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1850 = _1846 || _1848;
            if (!_1850)
            {
                _1740 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1852 = _1740;
            _1742 = _1852;
            if (!_1850)
            {
                _1712 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1854 = _1712;
            _1714 = _1854;
            if (!_1850)
            {
                _1718 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1856 = _1718;
            _1720 = _1856;
            if (!_1850)
            {
                _1776 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1858 = _1776;
            _1778 = _1858;
            if (!_1850)
            {
                _1768 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1860 = _1768;
            _1770 = _1860;
            if (!_1850)
            {
                _1754 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1862 = _1754;
            bool _1864 = !_1850;
            _1756 = _1862;
            if (!_1864)
            {
                bool _1866 = _861 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1868 = isnan(_861);
                bool _1870 = _1866 || _1868;
                bool _1872 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1874 = _1870 || _1872;
                if (!_1874)
                {
                    float _1876 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1878 = _861 + _1876;
                    float _1880 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1882 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1880;
                    float _1884 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1886 = _1884 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1888 = 1.0 / _1882;
                    float _1890 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1892 = _1890 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1894 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1896 = _1894 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1898 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1900 = _1898 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1902 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1904 = _1902 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1906 = _1878 * _1888;
                    float _1908 = precise::clamp(_1906, 0.0, 1.0);
                    float _1910 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1912 = _1910 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1914 = fma(_1908, _1886, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1916 = fma(_1908, _1912, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1918 = fma(_1908, _1892, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1920 = fma(_1908, _1896, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1922 = fma(_1908, _1900, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1924 = fma(_1908, _1904, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1714 = _1918;
                    _1770 = _1922;
                    _1742 = _1914;
                    _1778 = _1920;
                    _1720 = _1916;
                    _1756 = _1924;
                    _1840 = true;
                }
                else
                {
                    _1714 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1770 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1742 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1778 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1720 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1756 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1840 = false;
    float _1926 = _1714;
    float _1928 = _1770;
    float _1930 = _1742;
    float _1932 = _1778;
    float _1934 = _1720;
    float _1936 = _1756;
    float _1938 = fma(_1608, -0.5, 0.5);
    float _1940 = precise::clamp(_1938, 0.0, 1.0);
    float _1942 = -_1926;
    float _1944 = _1942 + _1928;
    float _1946 = -_1930;
    float _1948 = _1946 + _1932;
    float _1950 = -_1934;
    float _1952 = _1950 + _1936;
    bool _1954 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1956 = fma(_1940, _1944, _1926);
    float _1958 = fma(_1940, _1948, _1930);
    float _1960 = fma(_1940, _1952, _1934);
    float _1962 = _1696 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1964 = _1956 * 0.586610972881317138671875;
    out.m_93.x = 0.0;
    float _1966 = fma(_1958, 0.298911988735198974609375, _1964);
    out.m_89.w = _1962;
    float _1968 = fma(_1960, 0.114477999508380889892578125, _1966);
    out.m_56.x = 1.0;
    float _1970 = -_1968;
    float _1972 = _1958 + _1970;
    float _1974 = -_1968;
    float _1976 = _1956 + _1974;
    float _1978 = -_1968;
    float _1980 = _1960 + _1978;
    float _1982 = fma(_1972, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1968);
    float _1984 = fma(_1976, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1968);
    float _1986 = fma(_1980, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1968);
    out.m_95.x = 0.0;
    out.m_97.x = _1982;
    out.m_97.y = _1984;
    out.m_97.z = _1986;
    if (!_1954)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1988 = -_835;
    float _1990 = _1988 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1992 = -_837;
    float _1994 = _1992 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1996 = -_839;
    float _1998 = _1996 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2000 = _1990 * _1990;
    float _2002 = fma(_1994, _1994, _2000);
    float _2004 = fma(_1998, _1998, _2002);
    float _2006 = rsqrt(_2004);
    float _2008 = _1990 * _2006;
    float _2010 = _1994 * _2006;
    float _2012 = _1998 * _2006;
    float _2014 = sqrt(_2004);
    float _2016 = -_867;
    float _2018 = _2016 + _2008;
    float _2020 = -_863;
    float _2022 = _2020 + _2010;
    float _2024 = -_865;
    float _2026 = _2024 + _2012;
    float _2028 = _2018 * _2018;
    float _2030 = fma(_2022, _2022, _2028);
    float _2032 = fma(_2026, _2026, _2030);
    float _2034 = -_2014;
    float _2036 = _2034 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2038 = rsqrt(_2032);
    float _2040 = _2036 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2042 = precise::clamp(_2040, 0.0, 1.0);
    float _2044 = abs(_2042);
    float _2046 = log2(_2044);
    float _2048 = _2018 * _2038;
    float _2050 = _2022 * _2038;
    float _2052 = _2026 * _2038;
    float _2054 = _1608 * _2048;
    float _2056 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
    float _2058 = precise::clamp(_2056, 0.0, 1.0);
    float _2060 = _1608 * _2008;
    float _2062 = fma(_1646, _2050, _2054);
    float _2064 = _2058 * _2058;
    float _2066 = _2046 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2068 = fma(_1646, _2010, _2060);
    float _2070 = fma(_1650, _2052, _2062);
    float _2072 = precise::clamp(_2070, 0.0, 1.0);
    float _2074 = _2064 + (-1.0);
    float _2076 = fma(_1650, _2012, _2068);
    float _2078 = precise::clamp(_2076, 0.0, 1.0);
    float _2080 = _2072 * _2072;
    float _2082 = _2010 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2084 = exp2(_2066);
    float _2086 = fma(_2080, _2074, 1.0);
    float _2088 = -_2008;
    float _2090 = -_2082;
    float _2092 = fma(_2088, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2090);
    float _2094 = _2086 * _2086;
    float _2096 = -_2012;
    float _2098 = fma(_2096, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2092);
    float _2100 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2102 = _2098 + _2100;
    float _2104 = 1.0 / _2094;
    float _2106 = _2102 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2108 = precise::clamp(_2106, 0.0, 1.0);
    float _2110 = _2084 * _2108;
    float _2112 = _2078 * _2110;
    float _2114 = _2112 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2116 = _2064 * _2104;
    float _2118 = _2112 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2120 = _2112 * _2116;
    float _2122 = _2112 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    float _2124 = _2120 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2126 = _2120 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2128 = _2120 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_93.x = _2114;
    out.m_93.y = _2118;
    out.m_93.z = _2122;
    out.m_95.x = _2124;
    out.m_95.y = _2126;
    out.m_95.z = _2128;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1840 = false;
    bool _360 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _111 = in.m_53.w;
    float _113 = trunc(_111);
    int _116 = int(_113);
    bool _120 = _116 >= 1;
    float _122 = 0.0;
    if (!_120)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _124 = _122;
    float _126 = _124;
    if (!_120)
    {
        out.m_56.x = 0.0;
    }
    int _128 = 0;
    if (!_120)
    {
        float _130 = _124 * 5.0;
        _128 = as_type<int>(_130);
    }
    int _132 = _128;
    int _134 = _132;
    if (!_120)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2185 = as_type<float>(_132);
        out.gl_Position.z = _2185;
    }
    if (!_120)
    {
        return out;
    }
    float _136 = in.m_58.w;
    bool _138 = _136 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _140 = isnan(_136);
    bool _142 = _138 || _140;
    bool _144 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _146 = _142 || _144;
    float _148 = -_136;
    float _150 = _148 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_146)
    {
        float _152 = float(_116);
        _126 = _152;
    }
    float _154 = _126;
    bool _156 = _150 >= _154;
    bool _158 = !_146;
    bool _160 = _156 || _158;
    float _162 = _154;
    if (_160)
    {
        _162 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _164 = _162;
    if (_160)
    {
        out.m_56.x = 0.0;
    }
    if (_160)
    {
        float _166 = _164 * 5.0;
        _134 = as_type<int>(_166);
    }
    int _168 = _134;
    if (_160)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2254 = as_type<float>(_168);
        out.gl_Position.z = _2254;
    }
    if (_160)
    {
        return out;
    }
    float _170 = in.m_60.x;
    float _172 = in.m_60.y;
    float _174 = in.m_60.z;
    float _176 = in.m_62.x;
    float _178 = in.m_62.y;
    float _180 = in.m_62.z;
    float _182 = in.m_64.x;
    float _184 = in.m_64.y;
    float _186 = in.m_64.z;
    float _188 = in.m_66.x;
    float _190 = _170 * _170;
    float _192 = _172 * _172;
    float _194 = _174 * _174;
    float _196 = fma(_176, _176, _190);
    float _198 = fma(_178, _178, _192);
    float _200 = fma(_180, _180, _194);
    float _202 = fma(_182, _182, _196);
    float _204 = fma(_184, _184, _198);
    float _206 = fma(_186, _186, _200);
    float _208 = sqrt(_202);
    float _210 = sqrt(_204);
    float _212 = sqrt(_206);
    bool _214 = _208 > 0.0;
    bool _216 = _210 > 0.0;
    float _218 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _220 = _202;
    if (_214)
    {
        float _222 = rsqrt(_202);
        _220 = _222;
    }
    float _224 = _220;
    float _226 = _218 * _188;
    bool _228 = _212 > 0.0;
    float _230 = 0.0;
    if (!_214)
    {
        _230 = 0.0;
    }
    float _232 = _230;
    float _234 = 0.0;
    float _236 = _232;
    if (!_214)
    {
        _234 = 0.0;
    }
    float _238 = _234;
    float _240 = 0.0;
    float _242 = 0.0;
    float _244 = _238;
    if (!_216)
    {
        _240 = 0.0;
        _242 = 0.0;
    }
    float _246 = _240;
    float _248 = _242;
    float _250 = 0.0;
    float _252 = _248;
    float _254 = _246;
    if (!_214)
    {
        _250 = 0.0;
    }
    float _256 = _250;
    float _258 = _212;
    float _260 = _256;
    if (_216)
    {
        float _262 = rsqrt(_204);
        _258 = _262;
    }
    float _264 = _258;
    float _266 = 0.0;
    if (!_216)
    {
        _266 = 0.0;
    }
    float _268 = _266;
    float _270 = 0.0;
    float _272 = 0.0;
    float _274 = _268;
    if (!_228)
    {
        _270 = 0.0;
        _272 = 0.0;
    }
    float _276 = _270;
    float _278 = _272;
    float _280 = _278;
    float _282 = _276;
    if (_214)
    {
        float _284 = _224 * _176;
        _236 = _284;
    }
    float _286 = _236;
    float _288 = _208;
    if (_228)
    {
        float _290 = rsqrt(_206);
        _288 = _290;
    }
    float _292 = _288;
    if (_214)
    {
        float _294 = _224 * _170;
        _244 = _294;
    }
    float _296 = _244;
    if (_214)
    {
        float _298 = _224 * _182;
        _260 = _298;
    }
    float _300 = _260;
    bool _302 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _304 = 0.0;
    if (!_228)
    {
        _304 = 0.0;
    }
    float _306 = _304;
    float _308 = trunc(_226);
    int _310 = int(_308);
    float _312 = _306;
    if (_216)
    {
        float _314 = _264 * _178;
        _274 = _314;
    }
    float _316 = _274;
    if (_216)
    {
        float _318 = _264 * _172;
        _252 = _318;
    }
    float _320 = _252;
    if (_216)
    {
        float _322 = _264 * _184;
        _254 = _322;
    }
    float _324 = _254;
    if (_228)
    {
        float _326 = _292 * _180;
        _280 = _326;
    }
    float _328 = _280;
    if (_228)
    {
        float _330 = _292 * _174;
        _312 = _330;
    }
    float _332 = _312;
    if (_228)
    {
        float _334 = _292 * _186;
        _282 = _334;
    }
    float _336 = _282;
    int _338 = _310 << 4;
    int _340 = _338 + 1712;
    bool _342 = !_302;
    float _358;
    if (!_342)
    {
        float _344 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _346 = _188 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _348 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[11].y, _150);
        float _350 = _348 * _344;
        float _352 = floor(_350);
        float _354 = -_352;
        float _356 = _350 + _354;
        _358 = _356;
        _360 = true;
    }
    else
    {
        float _362 = float(_116);
        float _364 = 1.0 / _362;
        float _366 = _150 * _364;
        _358 = _366;
    }
    _360 = false;
    float _368 = _358;
    float _370 = in.m_68.w;
    float _372 = in.m_53.x;
    float _374 = in.m_53.y;
    float _376 = in.m_53.z;
    float _378 = in.m_60.w;
    float _380 = in.m_62.w;
    float _382 = in.m_64.w;
    float _384 = trunc(_370);
    int _386 = int(_384);
    int _388 = _386 << 5;
    uint _391 = uint(int(uint(_388) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_391)];
    float _393 = as_type<float>(_dmw0.x);
    int _395 = _388 + 4;
    uint _397 = uint(int(uint(_395) >> uint(2)));
    float _399 = as_type<float>(_dmw0.y);
    int _401 = _388 + 8;
    uint _403 = uint(int(uint(_401) >> uint(2)));
    float _405 = as_type<float>(_dmw0.z);
    int _407 = _388 + 12;
    uint _409 = uint(int(uint(_407) >> uint(2)));
    float _411 = as_type<float>(_dmw0.w);
    float _413 = _172 * _374;
    float _415 = _178 * _374;
    float _417 = _184 * _374;
    float _419 = fma(_170, _372, _413);
    float _421 = fma(_176, _372, _415);
    float _423 = fma(_182, _372, _417);
    float _425 = as_type<float>(int(gl_VertexIndex));
    float _427 = fma(_174, _376, _419);
    float _429 = fma(_180, _376, _421);
    float _431 = fma(_186, _376, _423);
    float _433 = _427 + _378;
    float _435 = _429 + _380;
    float _437 = _431 + _382;
    float _439 = in.m_73.x;
    float _441 = in.m_73.y;
    float _443 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _445 = _433 + _443;
    float _447 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _449 = _435 + _447;
    float _451 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _453 = _437 + _451;
    float _455 = _445 * _445;
    float _457 = fma(_449, _449, _455);
    float _459 = fma(_453, _453, _457);
    int _461 = as_type<int>(_425) & 1;
    bool _463 = _461 != 0;
    int _465 = as_type<int>(_425) & 2;
    bool _467 = _465 != 0;
    float _469 = rsqrt(_459);
    bool _471 = !_463;
    float _473 = _471 ? (-0.5) : 0.5;
    bool _475 = !_467;
    float _477 = _475 ? (-0.5) : 0.5;
    float _479 = _441 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _481 = _479 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _483 = _445 * _469;
    float _485 = _449 * _469;
    float _487 = -_483;
    float _489 = fma(_487, (*spvDescriptorSet0.vp_c9)._m0[18].w, _445);
    float _491 = -_485;
    float _493 = fma(_491, (*spvDescriptorSet0.vp_c9)._m0[18].w, _449);
    float _495 = _453 * _469;
    float _497 = _489 * _489;
    float _499 = -_495;
    float _501 = fma(_499, (*spvDescriptorSet0.vp_c9)._m0[18].w, _453);
    float _503 = fma(_493, _493, _497);
    float _505 = fma(_501, _501, _503);
    float _507 = _439 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _509 = sqrt(_505);
    float _511 = _507 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _513 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _477);
    float _515 = _469 * _509;
    float _517 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _473);
    float _519 = _511 * _515;
    float _521 = _515 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _523 = _521 * 0.5;
    float _525 = _481 * _515;
    float _527 = _519 * _517;
    float _529 = _523 * _324;
    float _531 = _525 * _513;
    float _533 = _523 * _316;
    float _535 = _523 * _320;
    float _537 = fma(_527, _300, _529);
    float _539 = fma(_527, _286, _533);
    float _541 = -_531;
    float _543 = fma(_541, _336, _537);
    float _545 = -_531;
    float _547 = fma(_545, _328, _539);
    float _549 = _437 + _543;
    float _551 = fma(_527, _296, _535);
    float _553 = _435 + _547;
    float _555 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _557 = _549 + _555;
    float _559 = -_531;
    float _561 = fma(_559, _332, _551);
    float _563 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _565 = _553 + _563;
    float _567 = _557 * _557;
    float _569 = _433 + _561;
    float _571 = fma(_565, _565, _567);
    float _573 = sqrt(_571);
    bool _575 = _573 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _577 = _561;
    float _579 = _437;
    if (!_575)
    {
        _577 = _553;
    }
    float _581 = _577;
    float _583 = _411 * 2.0;
    float _585 = _393 * 2.0;
    float _587 = _399 * 2.0;
    float _589 = _393 * _393;
    float _591 = _405 * _583;
    float _593 = _393 * _583;
    float _595 = _399 * _583;
    float _597 = _405 * _405;
    float _599 = -_591;
    float _601 = fma(_399, _585, _599);
    float _603 = fma(_399, _585, _591);
    float _605 = fma(_405, _585, _595);
    float _607 = -_595;
    float _609 = fma(_405, _585, _607);
    float _611 = -_593;
    float _613 = fma(_405, _587, _611);
    float _615 = _399 * _399;
    float _617 = fma(_405, _587, _593);
    float _619 = _393;
    float _621 = _399;
    float _623 = _581;
    if (!_575)
    {
        _619 = _549;
    }
    float _625 = _619;
    float _627 = _625;
    if (!_575)
    {
        _621 = _569;
    }
    float _629 = _621;
    bool _631 = !_575;
    float _633 = _629;
    if (!_631)
    {
        float _635 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _637 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _639 = _573 + _637;
        float _641 = _569 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _643 = rsqrt(_571);
        float _645 = _639 * _635;
        float _647 = _645 * 0.15915493667125701904296875;
        float _649 = _647 * 6.283185482025146484375;
        float _651 = cos(_649);
        float _653 = _647 * 6.283185482025146484375;
        float _655 = sin(_653);
        float _657 = _651 + (-1.0);
        float _659 = _657 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _661 = fma(_655, _641, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _663 = fma(_569, _651, _659);
        float _665 = _643 * _661;
        float _667 = fma(_565, _665, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _669 = fma(_557, _665, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _633 = _663;
        _623 = _667;
        _627 = _669;
    }
    float _671 = _633;
    float _673 = _623;
    float _675 = _627;
    float _677 = -_433;
    float _679 = _677 + _671;
    float _681 = -_435;
    float _683 = _681 + _673;
    float _685 = fma(_615, -2.0, 1.0);
    float _687 = fma(_589, -2.0, 1.0);
    float _689 = _679 * _320;
    float _691 = _679 * _296;
    float _693 = _679 * _332;
    float _695 = -_437;
    float _697 = _695 + _675;
    float _699 = fma(_683, _316, _689);
    float _701 = fma(_597, -2.0, _685);
    float _703 = fma(_683, _286, _691);
    float _705 = fma(_597, -2.0, _687);
    float _707 = fma(_697, _324, _699);
    float _709 = fma(_683, _328, _693);
    float _711 = fma(_697, _300, _703);
    float _713 = _707 * _601;
    float _715 = _707 * _705;
    float _717 = _707 * _617;
    float _719 = fma(_697, _336, _709);
    float _721 = fma(_711, _701, _713);
    float _723 = fma(_711, _603, _715);
    float _725 = fma(_615, -2.0, _687);
    float _727 = fma(_711, _609, _717);
    bool _729 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _731 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _733 = _729 || _731;
    bool _735 = isnan(0.5);
    bool _737 = _733 || _735;
    float _739 = fma(_719, _613, _723);
    float _741 = fma(_719, _605, _721);
    float _743 = fma(_719, _725, _727);
    float _745 = -_495;
    float _747 = fma(_745, (*spvDescriptorSet0.vp_c9)._m0[18].w, _437);
    float _749 = _433 + _739;
    float _751 = -_483;
    float _753 = fma(_751, (*spvDescriptorSet0.vp_c9)._m0[18].w, _433);
    float _755 = _437 + _743;
    float _757 = _435 + _741;
    float _759 = -_483;
    float _761 = fma(_759, (*spvDescriptorSet0.vp_c9)._m0[18].w, _749);
    float _763 = -_495;
    float _765 = fma(_763, (*spvDescriptorSet0.vp_c9)._m0[18].w, _755);
    float _767 = -_485;
    float _769 = fma(_767, (*spvDescriptorSet0.vp_c9)._m0[18].w, _757);
    float _771 = -_485;
    float _773 = fma(_771, (*spvDescriptorSet0.vp_c9)._m0[18].w, _435);
    float _775 = _755;
    float _777 = _761;
    float _779 = _769;
    float _781 = _739;
    float _783 = _741;
    if (_737)
    {
        _775 = _761;
    }
    float _785 = _775;
    float _787 = _785;
    if (_737)
    {
        _777 = _765;
    }
    float _789 = _777;
    float _791 = _789;
    if (!_737)
    {
        float _793 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _795 = _753 + _793;
        float _797 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _799 = _773 + _797;
        float _801 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _803 = _795 * _795;
        float _805 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _807 = _747 + _805;
        float _809 = fma(_799, _799, _803);
        float _811 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _813 = fma(_807, _807, _809);
        float _815 = sqrt(_813);
        float _817 = 1.0 / _515;
        float _819 = precise::min(_815, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _821 = _819 * _801;
        float _823 = _811 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _825 = _821 * _817;
        float _827 = _823 * _825;
        float _829 = fma(_741, _827, _773);
        float _831 = fma(_739, _827, _753);
        float _833 = fma(_743, _827, _747);
        _787 = _831;
        _779 = _829;
        _791 = _833;
    }
    float _835 = _787;
    float _837 = _779;
    float _839 = _791;
    float _841 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _843 = _835 + _841;
    float _845 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _847 = _837 + _845;
    float _849 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _851 = _839 + _849;
    float _853 = _843 * _843;
    float _855 = fma(_847, _847, _853);
    float _857 = fma(_851, _851, _855);
    float _859 = rsqrt(_857);
    float _861 = sqrt(_857);
    float _863 = _847 * _859;
    float _865 = _851 * _859;
    float _867 = _843 * _859;
    float _869 = _863 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _871 = _865 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _873 = _869 * _869;
    float _875 = _871 * _871;
    float _877 = _873 + _875;
    float _879 = sqrt(_877);
    bool _881 = _879 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _883 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _885 = _879 + _883;
    float _887 = _743;
    float _889 = _877;
    float _891 = _885;
    if (_881)
    {
        float _893 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _887 = _893;
    }
    float _895 = _887;
    if (_881)
    {
        float _897 = rsqrt(_877);
        _889 = _897;
    }
    float _899 = _889;
    float _901 = _899;
    if (_881)
    {
        float _903 = _885 * _895;
        _891 = _903;
    }
    float _905 = _891;
    if (_881)
    {
        float _907 = _905 * 0.15915493667125701904296875;
        _781 = _907;
    }
    float _909 = _781;
    float _911 = _515;
    float _913 = _909;
    if (_881)
    {
        float _915 = _909 * 6.283185482025146484375;
        float _917 = sin(_915);
        _911 = _917;
    }
    float _919 = _911;
    float _921 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _923 = precise::max(0.0, _921);
    float _925 = _895;
    float _927 = _923;
    float _929 = _921;
    if (_881)
    {
        float _931 = _909 * 6.283185482025146484375;
        float _933 = cos(_931);
        _925 = _933;
    }
    float _935 = _925;
    float _937 = -_867;
    float _939 = -_923;
    float _941 = fma(_937, (*spvDescriptorSet0.vp_c15)._m0[24].y, _939);
    if (_881)
    {
        float _943 = _941 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _927 = _943;
    }
    float _945 = _927;
    float _947 = _945;
    if (!_881)
    {
        _913 = _871;
    }
    float _949 = _913;
    float _951 = _919;
    float _953 = _949;
    if (_881)
    {
        float _955 = fma(_919, _945, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _783 = _955;
    }
    float _957 = _783;
    float _959 = _957;
    if (!_881)
    {
        _951 = _869;
    }
    float _961 = _951;
    float _963 = _961;
    if (!_881)
    {
        _947 = _941;
    }
    float _965 = _947;
    float _967 = _965;
    if (_881)
    {
        float _969 = _935 + (-1.0);
        _929 = _969;
    }
    float _971 = _929;
    float _973 = 0.0;
    float _975 = _971;
    if (_881)
    {
        float _977 = _899 * _957;
        _973 = _977;
    }
    float _979 = _973;
    if (!_881)
    {
        _901 = _873;
    }
    float _981 = _901;
    float _983 = _981;
    if (_881)
    {
        float _985 = _971 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _975 = _985;
    }
    float _987 = _975;
    if (_881)
    {
        float _989 = _869 * _979;
        _963 = _989;
    }
    float _991 = _963;
    if (_881)
    {
        float _993 = _871 * _979;
        _953 = _993;
    }
    float _995 = _953;
    if (!_881)
    {
        _959 = _875;
    }
    float _997 = _959;
    float _999 = _997;
    if (_881)
    {
        float _1001 = fma(_941, _935, _987);
        _967 = _1001;
    }
    float _1003 = _967;
    if (_881)
    {
        float _1005 = _991 * _991;
        _983 = _1005;
    }
    float _1007 = _983;
    if (_881)
    {
        float _1009 = _995 * _995;
        _999 = _1009;
    }
    float _1011 = _999;
    float _1013 = _835 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1015 = fma(_1003, _1003, _1007);
    float _1017 = _835 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1019 = fma(_837, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1013);
    float _1021 = _1015 + _1011;
    float _1023 = fma(_837, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1017);
    float _1025 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1027 = fma(_861, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1025);
    float _1029 = precise::clamp(_1027, 0.0, 1.0);
    float _1031 = _835 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1033 = fma(_839, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1023);
    float _1035 = -_1029;
    float _1037 = _1035 + 1.0;
    float _1039 = rsqrt(_1021);
    float _1041 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1043 = _1033 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1045 = fma(_747, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1047 = fma(_837, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1031);
    float _1049 = _1043 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1051 = fma(_839, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1019);
    float _1053 = abs(_1037);
    float _1055 = log2(_1053);
    float _1057 = fma(_839, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1047);
    float _1059 = -_1049;
    float _1061 = fma(_1059, _1041, 1.0);
    float _1063 = _835 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1065 = fma(_773, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1067 = _1057 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1069 = _1051 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1071 = fma(_837, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1063);
    float _1073 = floor(_1065);
    float _1075 = _1039 * _991;
    float _1077 = _1039 * _1003;
    float _1079 = fma(_839, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1071);
    float _1081 = _1039 * _995;
    float _1083 = _1067 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1085 = _1075 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1087 = _1079 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1089 = log2(_1061);
    float _1091 = _1055 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1093 = -_1085;
    float _1095 = fma(_1077, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1093);
    float _1097 = fma(_1087, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1083);
    float _1099 = -_1081;
    float _1101 = fma(_1099, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1095);
    float _1103 = floor(_1045);
    float _1105 = fma(_1043, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1097);
    float _1107 = fma(_1101, -0.5, 0.5);
    float _1109 = -_1073;
    float _1111 = _1065 + _1109;
    float _1113 = _1067 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1115 = fma(_1069, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1105);
    float _1117 = _1067 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1119 = fma(_1101, 0.5, 0.5);
    float _1121 = exp2(_1091);
    float _1123 = fma(_1087, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1113);
    float _1125 = fma(_1087, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1117);
    float _1127 = _1077 + 1.0;
    float _1129 = fma(_1043, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1123);
    float _1131 = fma(_1043, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1125);
    float _1133 = 1.0 / _1115;
    float _1135 = -_1103;
    float _1137 = _1045 + _1135;
    float _1139 = fma(_1119, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1141 = fma(_1119, _1139, -0.212114393711090087890625);
    float _1143 = sqrt(_1107);
    float _1145 = -_1077;
    float _1147 = fma(_1121, _1127, _1145);
    float _1149 = fma(_1069, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1129);
    float _1151 = fma(_1069, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1131);
    float _1153 = _1089 * 0.693147182464599609375;
    float2 _3793 = float2(_1111, _1137);
    float _1155 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3793, float2(0.0), isnan(_3793)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3793, float2(0.0), isnan(_3793)), level(0.0)).x;
    float _1157 = fma(_1119, _1141, 1.570728778839111328125);
    float _1159 = fma(_1147, 0.5, 0.5);
    float _1161 = _1149 * _1133;
    float _1163 = _1151 * _1133;
    float _1165 = _1153 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1167 = fma(_1161, 0.5, 0.5);
    float _1169 = fma(_1163, -0.5, 0.5);
    float _1171 = _1143 * 0.636619746685028076171875;
    float3 _3827 = float3(_1167, _1169, _1165);
    float _1173 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3827, float3(0.0), isnan(_3827)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3827, float3(0.0), isnan(_3827)), level(0.0)).x;
    float _1175 = -_1157;
    float _1177 = fma(_1171, _1175, 1.0);
    float3 _3843 = float3(_1167, _1169, _1165);
    float4 _1180 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3843, float3(0.0), isnan(_3843)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3843, float3(0.0), isnan(_3843)), level(0.0)).xyzw;
    float _1182 = _1180.x;
    float _1184 = _1180.y;
    float _1186 = _1180.z;
    float _1188 = _1180.w;
    float2 _3859 = float2(_1177, _1159);
    float3 _1192 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3859, float2(0.0), isnan(_3859)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3859, float2(0.0), isnan(_3859)), level(0.0)).xyz;
    float _1194 = _1192.x;
    float _1196 = _1192.y;
    float _1198 = _1192.z;
    float _1200 = in.m_66.y;
    float _1202 = _1055 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1204 = _1067 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1206 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1208 = _1206 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1210 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _1212 = _753 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1214 = _753 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1216 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1218 = _1216 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1220 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1222 = _1220 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1224 = 1.0 / _1208;
    float _1226 = fma(_773, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1214);
    float _1228 = _1210 * _188;
    float _1230 = fma(_773, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1212);
    float _1232 = fma(_747, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1226);
    float _1234 = fma(_747, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1230);
    float _1236 = 1.0 / _1218;
    float _1238 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1240 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1238;
    int _1242 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1244 = _1242 != 0;
    float _1246 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1248 = _1246 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    bool _1250 = _1200 > 0.5;
    float _1252 = _1232 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    int _1254 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1256 = _1254 != 0;
    float _1258 = 1.0 / _1222;
    float _1260 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.300000011920928955078125;
    float _1262 = _1248 * _1224;
    float _1264 = _1234 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1266 = _188 > 0.5;
    float _1268 = trunc(_1228);
    int _1270 = int(_1268);
    float _1272 = _1240 * _1236;
    float _1274 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1276 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1274;
    float _1278 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1280 = fma(_1260, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1278);
    float _1282 = _473 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1284 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1286 = fma(_1260, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1284);
    float _1288 = _1264 + _1252;
    out.m_75.x = _837;
    out.m_75.y = _835;
    out.m_75.z = _839;
    float _1290 = 1.0 / _1252;
    float _1292 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _1286);
    float _1294 = _437 + _1292;
    int _1296 = _1270 << 4;
    int _1298 = _1296 + 1968;
    float _1300 = _1276 * _1258;
    float _1302 = fma(_1282, _286, _316);
    int _1304 = _1298 + 8;
    uint _1306 = uint(int(uint(_1304) >> uint(2)));
    uint _1308 = uint(int(uint(int(_1306)) >> uint(2)));
    int _1310 = int(_1306) & 3;
    float _1312 = (*spvDescriptorSet0.vp_c9)._m0[int(_1308)][_1310];
    float _1314 = _477 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1316 = exp2(_1202);
    float _1318 = _1288 * _1290;
    float _1320 = _1318 * 0.5;
    float _1322 = fma(_1282, _296, _320);
    float _1324 = fma(_1282, _300, _324);
    float _1326 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1328 = _368 + _1326;
    float _1330 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1332 = fma(_1320, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1330);
    uint _1334 = uint(int(uint(_1298) >> uint(2)));
    uint _1336 = uint(int(uint(int(_1334)) >> uint(2)));
    int _1338 = int(_1334) & 3;
    float _1340 = (*spvDescriptorSet0.vp_c9)._m0[int(_1336)][_1338];
    int _1342 = int(_1334) + 1;
    uint _1344 = uint(int(uint(_1342) >> uint(2)));
    int _1346 = _1342 & 3;
    float _1348 = (*spvDescriptorSet0.vp_c9)._m0[int(_1344)][_1346];
    float _1350 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1352 = _368 + _1350;
    float _1354 = fma(_1262, _1328, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1356 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1358 = _368 + _1356;
    float _1360 = -_473;
    int _1362 = _1266 ? as_type<int>(_1360) : as_type<int>(_473);
    float _1364 = 1.0 / _1332;
    float _1366 = fma(_1272, _1352, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1368 = fma(_1300, _1358, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    bool _1370 = !_1244;
    float _1372 = _1370 ? _473 : as_type<float>(_1362);
    float _1374 = -_1314;
    float _1376 = fma(_1374, _332, _1322);
    bool _1378 = _368 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1380 = isnan(_368);
    bool _1382 = _1378 || _1380;
    bool _1384 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1386 = _1382 || _1384;
    float _1388 = float(_1386);
    float _1390 = -_1316;
    float _1392 = _1390 + 1.0;
    bool _1394 = _368 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1396 = isnan(_368);
    bool _1398 = _1394 || _1396;
    bool _1400 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1402 = _1398 || _1400;
    float _1404 = float(_1402);
    float _1406 = _1372 + 0.5;
    bool _1408 = _368 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1410 = isnan(_368);
    bool _1412 = _1408 || _1410;
    bool _1414 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1416 = _1412 || _1414;
    float _1418 = float(_1416);
    float _1420 = -_1388;
    float _1422 = _1420 + 1.0;
    bool _1424 = _368 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1426 = isnan(_368);
    bool _1428 = _1424 || _1426;
    bool _1430 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1432 = _1428 || _1430;
    float _1434 = float(_1432);
    float _1436 = -_1404;
    float _1438 = _1436 + 1.0;
    bool _1440 = 0.0 != (*spvDescriptorSet0.vp_c11)._m0[20].z;
    bool _1442 = isnan(0.0);
    bool _1444 = _1440 || _1442;
    bool _1446 = isnan((*spvDescriptorSet0.vp_c11)._m0[20].z);
    bool _1448 = _1444 || _1446;
    float _1450 = _1404 * _1422;
    float _1452 = -_477;
    int _1454 = _1250 ? as_type<int>(_1452) : as_type<int>(_477);
    float _1456 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1458 = _1364 * _1456;
    float _1460 = _1418 * _1438;
    float _1462 = -_1418;
    float _1464 = _1462 + 1.0;
    bool _1466 = !_1256;
    float _1468 = _1466 ? _477 : as_type<float>(_1454);
    float _1470 = abs(_1458);
    float _1472 = log2(_1470);
    float _1474 = -_1314;
    float _1476 = fma(_1474, _328, _1302);
    float _1478 = -_1314;
    float _1480 = fma(_1478, _336, _1324);
    float _1482 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _1280);
    uint _1484 = uint(int(uint(_340) >> uint(2)));
    uint _1486 = uint(int(uint(int(_1484)) >> uint(2)));
    int _1488 = int(_1484) & 3;
    float _1490 = (*spvDescriptorSet0.vp_c9)._m0[int(_1486)][_1488];
    int _1492 = int(_1484) + 1;
    uint _1494 = uint(int(uint(_1492) >> uint(2)));
    int _1496 = _1492 & 3;
    float _1498 = (*spvDescriptorSet0.vp_c9)._m0[int(_1494)][_1496];
    float _1500 = _1434 * _1464;
    float _1502 = (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _1504 = _1115;
    if (_1448)
    {
        float _1506 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.20000000298023223876953125;
        _1502 = _1506;
    }
    float _1508 = _1502;
    float _1510 = _435 + _1482;
    float _1512 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1514 = _1366 * _1500;
    float _1516 = -_1468;
    float _1518 = _1516 + 0.5;
    if (_1448)
    {
        float _1520 = precise::min(_1508, 20.0);
        _579 = _1520;
    }
    float _1522 = _579;
    int _1524 = _340 + 8;
    uint _1526 = uint(int(uint(_1524) >> uint(2)));
    uint _1528 = uint(int(uint(int(_1526)) >> uint(2)));
    int _1530 = int(_1526) & 3;
    float _1532 = (*spvDescriptorSet0.vp_c9)._m0[int(_1528)][_1530];
    float _1534 = -_1510;
    float _1536 = _1534 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _1538 = _1312 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1540 = _1472 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1542 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1544 = _1538 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1546 = precise::min(_1510, _1536);
    float _1548 = -_1294;
    float _1550 = _1548 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _1552 = _1406 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1554 = _1518 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1556 = _1340 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1558 = _1348 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1560 = exp2(_1540);
    float _1562 = precise::min(_1294, _1550);
    float _1564 = _1556 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1566 = _1558 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1568 = _1458 <= 8000.0;
    bool _1570 = isnan(_1458);
    bool _1572 = _1568 || _1570;
    bool _1574 = isnan(8000.0);
    bool _1576 = _1572 || _1574;
    float _1578 = float(_1576);
    float _1580 = -_1434;
    float _1582 = _1580 + 1.0;
    float _1584 = precise::min(_1546, _1562);
    float _1586 = _1376 * _601;
    float _1588 = _1522;
    float _1590 = _1552;
    if (_1448)
    {
        float _1592 = 1.0 / _1522;
        _1588 = _1592;
    }
    float _1594 = _1588;
    out.m_77.x = _1564;
    out.m_77.y = _1566;
    out.m_77.z = _1544;
    float _1596 = _1376 * _705;
    float _1598 = fma(_1582, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1514);
    float _1600 = fma(_1476, _603, _1596);
    float _1602 = fma(_1354, _1460, _1598);
    float _1604 = fma(_1560, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1606 = precise::clamp(_1604, 0.0, 1.0);
    float _1608 = fma(_1480, _613, _1600);
    float _1610 = _1392 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1612 = fma(_1606, -2.0, 3.0);
    float _1614 = _1606 * _1606;
    float _1616 = _1552 * _1512;
    float _1618 = _1554 * _1542;
    float _1620 = _1610;
    if (!_1448)
    {
        _1590 = 1.0;
    }
    float _1622 = _1590;
    float _1624 = _1614 * _1612;
    float _1626 = _1622;
    if (_1448)
    {
        float _1628 = _1584 * _1594;
        float _1630 = precise::clamp(_1628, 0.0, 1.0);
        _1626 = _1630;
    }
    float _1632 = _1626;
    float _1634 = fma(_1087, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1204);
    out.m_79.x = _1616;
    out.m_79.y = _1618;
    float _1636 = _1376 * _617;
    float _1638 = fma(_1476, _701, _1586);
    float _1640 = fma(_1043, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1634);
    float _1642 = in.m_81.x;
    float _1644 = fma(_1476, _609, _1636);
    float _1646 = fma(_1480, _605, _1638);
    float _1648 = fma(_1069, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1640);
    float _1650 = fma(_1480, _725, _1644);
    float _1652 = -_1624;
    float _1654 = _1652 + 1.0;
    float _1656 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _1658 = _1648 + _1656;
    float _1660 = _1498 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1662 = fma(_1654, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1624);
    float _1664 = _1490 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1666 = _1115 + _1658;
    out.gl_Position.x = _1149;
    out.gl_Position.y = _1151;
    out.gl_Position.z = _1658;
    out.gl_Position.w = _1115;
    float _1668 = _1578 * _1662;
    bool _1670 = _861 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1672 = isnan(_861);
    bool _1674 = _1670 || _1672;
    bool _1676 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1678 = _1674 || _1676;
    float _1680 = _1666 * 0.5;
    out.m_83.x = _1646;
    out.m_83.y = _1608;
    out.m_83.z = _1650;
    float _1682 = _1668 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1684 = fma(_1368, _1450, _1602);
    float _1686 = _1532 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    out.m_85.z = _1680;
    out.m_85.w = _1115;
    float _1688 = _1664 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1690 = fma(_1388, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1684);
    float _1692 = _1660 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1694 = _1686 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1696 = _1632 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1698 = -_1610;
    float _1700 = _1698 + 1.0;
    float _1702 = _1690 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1704 = _1658;
    float _1706 = _1688;
    float _1708 = _1700;
    if (!_1678)
    {
        _1504 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1710 = _1504;
    float _1712 = _1710;
    float _1714 = _1710;
    if (!_1678)
    {
        _1704 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1716 = _1704;
    out.m_87.x = _1688;
    out.m_87.y = _1692;
    out.m_87.z = _1694;
    out.m_87.w = _1702;
    float _1718 = _1716;
    float _1720 = _1716;
    if (!_1678)
    {
        _1706 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1722 = _1706;
    float _1724 = -_1155;
    float _1726 = _1724 + 1.0;
    float _1728 = _1726 * _1682;
    float _1730 = precise::clamp(_1728, 0.0, 1.0);
    float _1732 = -_1730;
    float _1734 = fma(_1732, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1736 = _1610 * _1173;
    float _1738 = _1734 * _1642;
    float _1740 = _1722;
    float _1742 = _1722;
    if (!_1678)
    {
        _1620 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1744 = _1620;
    float _1746 = _1188 * _1736;
    float _1748 = _1738 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1750 = _1188 * _1700;
    float _1752 = _1746;
    float _1754 = _1744;
    float _1756 = _1744;
    if (!_1678)
    {
        _1708 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1758 = _1708;
    float _1760 = _1198 * _1736;
    float _1762 = fma(_1194, _1746, _1182);
    float _1764 = fma(_1196, _1746, _1184);
    out.m_89.x = _1748;
    float _1766 = fma(_1188, _1760, _1186);
    float _1768 = _1758;
    float _1770 = _1758;
    if (!_1678)
    {
        _1752 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1772 = _1752;
    out.m_91.x = _1762;
    out.m_91.y = _1764;
    out.m_91.z = _1766;
    out.m_91.w = _1750;
    bool _1774 = !_1678;
    float _1776 = _1772;
    float _1778 = _1772;
    if (!_1774)
    {
        bool _1780 = _861 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1782 = isnan(_861);
        bool _1784 = _1780 || _1782;
        bool _1786 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1788 = _1784 || _1786;
        if (!_1788)
        {
            float _1790 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1792 = _861 + _1790;
            float _1794 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1796 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1794;
            float _1798 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1800 = _1798 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1802 = 1.0 / _1796;
            float _1804 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1806 = _1804 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1808 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1810 = _1808 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1812 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1814 = _1812 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1816 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1818 = _1816 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1820 = _1792 * _1802;
            float _1822 = precise::clamp(_1820, 0.0, 1.0);
            float _1824 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1826 = _1824 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1828 = fma(_1822, _1800, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1830 = fma(_1822, _1826, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1832 = fma(_1822, _1806, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1834 = fma(_1822, _1810, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1836 = fma(_1822, _1814, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1838 = fma(_1822, _1818, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1714 = _1832;
            _1770 = _1836;
            _1742 = _1828;
            _1778 = _1834;
            _1720 = _1830;
            _1756 = _1838;
            _1840 = true;
        }
        else
        {
            bool _1842 = _861 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1844 = isnan(_861);
            bool _1846 = _1842 || _1844;
            bool _1848 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1850 = _1846 || _1848;
            if (!_1850)
            {
                _1740 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1852 = _1740;
            _1742 = _1852;
            if (!_1850)
            {
                _1712 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1854 = _1712;
            _1714 = _1854;
            if (!_1850)
            {
                _1718 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1856 = _1718;
            _1720 = _1856;
            if (!_1850)
            {
                _1776 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1858 = _1776;
            _1778 = _1858;
            if (!_1850)
            {
                _1768 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1860 = _1768;
            _1770 = _1860;
            if (!_1850)
            {
                _1754 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1862 = _1754;
            bool _1864 = !_1850;
            _1756 = _1862;
            if (!_1864)
            {
                bool _1866 = _861 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1868 = isnan(_861);
                bool _1870 = _1866 || _1868;
                bool _1872 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1874 = _1870 || _1872;
                if (!_1874)
                {
                    float _1876 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1878 = _861 + _1876;
                    float _1880 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1882 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1880;
                    float _1884 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1886 = _1884 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1888 = 1.0 / _1882;
                    float _1890 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1892 = _1890 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1894 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1896 = _1894 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1898 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1900 = _1898 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1902 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1904 = _1902 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1906 = _1878 * _1888;
                    float _1908 = precise::clamp(_1906, 0.0, 1.0);
                    float _1910 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1912 = _1910 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1914 = fma(_1908, _1886, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1916 = fma(_1908, _1912, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1918 = fma(_1908, _1892, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1920 = fma(_1908, _1896, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1922 = fma(_1908, _1900, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1924 = fma(_1908, _1904, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1714 = _1918;
                    _1770 = _1922;
                    _1742 = _1914;
                    _1778 = _1920;
                    _1720 = _1916;
                    _1756 = _1924;
                    _1840 = true;
                }
                else
                {
                    _1714 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1770 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1742 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1778 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1720 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1756 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1840 = false;
    float _1926 = _1714;
    float _1928 = _1770;
    float _1930 = _1742;
    float _1932 = _1778;
    float _1934 = _1720;
    float _1936 = _1756;
    float _1938 = fma(_1608, -0.5, 0.5);
    float _1940 = precise::clamp(_1938, 0.0, 1.0);
    float _1942 = -_1926;
    float _1944 = _1942 + _1928;
    float _1946 = -_1930;
    float _1948 = _1946 + _1932;
    float _1950 = -_1934;
    float _1952 = _1950 + _1936;
    bool _1954 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1956 = fma(_1940, _1944, _1926);
    float _1958 = fma(_1940, _1948, _1930);
    float _1960 = fma(_1940, _1952, _1934);
    float _1962 = _1696 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1964 = _1956 * 0.586610972881317138671875;
    out.m_93.x = 0.0;
    float _1966 = fma(_1958, 0.298911988735198974609375, _1964);
    out.m_89.w = _1962;
    float _1968 = fma(_1960, 0.114477999508380889892578125, _1966);
    out.m_56.x = 1.0;
    float _1970 = -_1968;
    float _1972 = _1958 + _1970;
    float _1974 = -_1968;
    float _1976 = _1956 + _1974;
    float _1978 = -_1968;
    float _1980 = _1960 + _1978;
    float _1982 = fma(_1972, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1968);
    float _1984 = fma(_1976, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1968);
    float _1986 = fma(_1980, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1968);
    out.m_95.x = 0.0;
    out.m_97.x = _1982;
    out.m_97.y = _1984;
    out.m_97.z = _1986;
    if (!_1954)
    {
        return out;
    }
    float _1988 = -_835;
    float _1990 = _1988 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1992 = -_837;
    float _1994 = _1992 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1996 = -_839;
    float _1998 = _1996 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2000 = _1990 * _1990;
    float _2002 = fma(_1994, _1994, _2000);
    float _2004 = fma(_1998, _1998, _2002);
    float _2006 = rsqrt(_2004);
    float _2008 = _1990 * _2006;
    float _2010 = _1994 * _2006;
    float _2012 = _1998 * _2006;
    float _2014 = sqrt(_2004);
    float _2016 = -_867;
    float _2018 = _2016 + _2008;
    float _2020 = -_863;
    float _2022 = _2020 + _2010;
    float _2024 = -_865;
    float _2026 = _2024 + _2012;
    float _2028 = _2018 * _2018;
    float _2030 = fma(_2022, _2022, _2028);
    float _2032 = fma(_2026, _2026, _2030);
    float _2034 = -_2014;
    float _2036 = _2034 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2038 = rsqrt(_2032);
    float _2040 = _2036 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2042 = precise::clamp(_2040, 0.0, 1.0);
    float _2044 = abs(_2042);
    float _2046 = log2(_2044);
    float _2048 = _2018 * _2038;
    float _2050 = _2022 * _2038;
    float _2052 = _2026 * _2038;
    float _2054 = _1608 * _2048;
    float _2056 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
    float _2058 = precise::clamp(_2056, 0.0, 1.0);
    float _2060 = _1608 * _2008;
    float _2062 = fma(_1646, _2050, _2054);
    float _2064 = _2058 * _2058;
    float _2066 = _2046 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2068 = fma(_1646, _2010, _2060);
    float _2070 = fma(_1650, _2052, _2062);
    float _2072 = precise::clamp(_2070, 0.0, 1.0);
    float _2074 = _2064 + (-1.0);
    float _2076 = fma(_1650, _2012, _2068);
    float _2078 = precise::clamp(_2076, 0.0, 1.0);
    float _2080 = _2072 * _2072;
    float _2082 = _2010 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2084 = exp2(_2066);
    float _2086 = fma(_2080, _2074, 1.0);
    float _2088 = -_2008;
    float _2090 = -_2082;
    float _2092 = fma(_2088, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2090);
    float _2094 = _2086 * _2086;
    float _2096 = -_2012;
    float _2098 = fma(_2096, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2092);
    float _2100 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2102 = _2098 + _2100;
    float _2104 = 1.0 / _2094;
    float _2106 = _2102 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2108 = precise::clamp(_2106, 0.0, 1.0);
    float _2110 = _2084 * _2108;
    float _2112 = _2078 * _2110;
    float _2114 = _2112 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2116 = _2064 * _2104;
    float _2118 = _2112 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2120 = _2112 * _2116;
    float _2122 = _2112 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    float _2124 = _2120 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2126 = _2120 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2128 = _2120 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_93.x = _2114;
    out.m_93.y = _2118;
    out.m_93.z = _2122;
    out.m_95.x = _2124;
    out.m_95.y = _2126;
    out.m_95.z = _2128;
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
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1840 = false;
    bool _360 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _111 = in.m_53.w;
    float _113 = trunc(_111);
    int _116 = int(_113);
    bool _120 = _116 >= 1;
    float _122 = 0.0;
    if (!_120)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _124 = _122;
    float _126 = _124;
    if (!_120)
    {
        out.m_56.x = 0.0;
    }
    int _128 = 0;
    if (!_120)
    {
        float _130 = _124 * 5.0;
        _128 = as_type<int>(_130);
    }
    int _132 = _128;
    int _134 = _132;
    if (!_120)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2185 = as_type<float>(_132);
        out.gl_Position.z = _2185;
    }
    if (!_120)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _136 = in.m_58.w;
    bool _138 = _136 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _140 = isnan(_136);
    bool _142 = _138 || _140;
    bool _144 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _146 = _142 || _144;
    float _148 = -_136;
    float _150 = _148 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_146)
    {
        float _152 = float(_116);
        _126 = _152;
    }
    float _154 = _126;
    bool _156 = _150 >= _154;
    bool _158 = !_146;
    bool _160 = _156 || _158;
    float _162 = _154;
    if (_160)
    {
        _162 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _164 = _162;
    if (_160)
    {
        out.m_56.x = 0.0;
    }
    if (_160)
    {
        float _166 = _164 * 5.0;
        _134 = as_type<int>(_166);
    }
    int _168 = _134;
    if (_160)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2254 = as_type<float>(_168);
        out.gl_Position.z = _2254;
    }
    if (_160)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _170 = in.m_60.x;
    float _172 = in.m_60.y;
    float _174 = in.m_60.z;
    float _176 = in.m_62.x;
    float _178 = in.m_62.y;
    float _180 = in.m_62.z;
    float _182 = in.m_64.x;
    float _184 = in.m_64.y;
    float _186 = in.m_64.z;
    float _188 = in.m_66.x;
    float _190 = _170 * _170;
    float _192 = _172 * _172;
    float _194 = _174 * _174;
    float _196 = fma(_176, _176, _190);
    float _198 = fma(_178, _178, _192);
    float _200 = fma(_180, _180, _194);
    float _202 = fma(_182, _182, _196);
    float _204 = fma(_184, _184, _198);
    float _206 = fma(_186, _186, _200);
    float _208 = sqrt(_202);
    float _210 = sqrt(_204);
    float _212 = sqrt(_206);
    bool _214 = _208 > 0.0;
    bool _216 = _210 > 0.0;
    float _218 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _220 = _202;
    if (_214)
    {
        float _222 = rsqrt(_202);
        _220 = _222;
    }
    float _224 = _220;
    float _226 = _218 * _188;
    bool _228 = _212 > 0.0;
    float _230 = 0.0;
    if (!_214)
    {
        _230 = 0.0;
    }
    float _232 = _230;
    float _234 = 0.0;
    float _236 = _232;
    if (!_214)
    {
        _234 = 0.0;
    }
    float _238 = _234;
    float _240 = 0.0;
    float _242 = 0.0;
    float _244 = _238;
    if (!_216)
    {
        _240 = 0.0;
        _242 = 0.0;
    }
    float _246 = _240;
    float _248 = _242;
    float _250 = 0.0;
    float _252 = _248;
    float _254 = _246;
    if (!_214)
    {
        _250 = 0.0;
    }
    float _256 = _250;
    float _258 = _212;
    float _260 = _256;
    if (_216)
    {
        float _262 = rsqrt(_204);
        _258 = _262;
    }
    float _264 = _258;
    float _266 = 0.0;
    if (!_216)
    {
        _266 = 0.0;
    }
    float _268 = _266;
    float _270 = 0.0;
    float _272 = 0.0;
    float _274 = _268;
    if (!_228)
    {
        _270 = 0.0;
        _272 = 0.0;
    }
    float _276 = _270;
    float _278 = _272;
    float _280 = _278;
    float _282 = _276;
    if (_214)
    {
        float _284 = _224 * _176;
        _236 = _284;
    }
    float _286 = _236;
    float _288 = _208;
    if (_228)
    {
        float _290 = rsqrt(_206);
        _288 = _290;
    }
    float _292 = _288;
    if (_214)
    {
        float _294 = _224 * _170;
        _244 = _294;
    }
    float _296 = _244;
    if (_214)
    {
        float _298 = _224 * _182;
        _260 = _298;
    }
    float _300 = _260;
    bool _302 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _304 = 0.0;
    if (!_228)
    {
        _304 = 0.0;
    }
    float _306 = _304;
    float _308 = trunc(_226);
    int _310 = int(_308);
    float _312 = _306;
    if (_216)
    {
        float _314 = _264 * _178;
        _274 = _314;
    }
    float _316 = _274;
    if (_216)
    {
        float _318 = _264 * _172;
        _252 = _318;
    }
    float _320 = _252;
    if (_216)
    {
        float _322 = _264 * _184;
        _254 = _322;
    }
    float _324 = _254;
    if (_228)
    {
        float _326 = _292 * _180;
        _280 = _326;
    }
    float _328 = _280;
    if (_228)
    {
        float _330 = _292 * _174;
        _312 = _330;
    }
    float _332 = _312;
    if (_228)
    {
        float _334 = _292 * _186;
        _282 = _334;
    }
    float _336 = _282;
    int _338 = _310 << 4;
    int _340 = _338 + 1712;
    bool _342 = !_302;
    float _358;
    if (!_342)
    {
        float _344 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _346 = _188 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _348 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[11].y, _150);
        float _350 = _348 * _344;
        float _352 = floor(_350);
        float _354 = -_352;
        float _356 = _350 + _354;
        _358 = _356;
        _360 = true;
    }
    else
    {
        float _362 = float(_116);
        float _364 = 1.0 / _362;
        float _366 = _150 * _364;
        _358 = _366;
    }
    _360 = false;
    float _368 = _358;
    float _370 = in.m_68.w;
    float _372 = in.m_53.x;
    float _374 = in.m_53.y;
    float _376 = in.m_53.z;
    float _378 = in.m_60.w;
    float _380 = in.m_62.w;
    float _382 = in.m_64.w;
    float _384 = trunc(_370);
    int _386 = int(_384);
    int _388 = _386 << 5;
    uint _391 = uint(int(uint(_388) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_391)];
    float _393 = as_type<float>(_dmw0.x);
    int _395 = _388 + 4;
    uint _397 = uint(int(uint(_395) >> uint(2)));
    float _399 = as_type<float>(_dmw0.y);
    int _401 = _388 + 8;
    uint _403 = uint(int(uint(_401) >> uint(2)));
    float _405 = as_type<float>(_dmw0.z);
    int _407 = _388 + 12;
    uint _409 = uint(int(uint(_407) >> uint(2)));
    float _411 = as_type<float>(_dmw0.w);
    float _413 = _172 * _374;
    float _415 = _178 * _374;
    float _417 = _184 * _374;
    float _419 = fma(_170, _372, _413);
    float _421 = fma(_176, _372, _415);
    float _423 = fma(_182, _372, _417);
    float _425 = as_type<float>(int(gl_VertexIndex));
    float _427 = fma(_174, _376, _419);
    float _429 = fma(_180, _376, _421);
    float _431 = fma(_186, _376, _423);
    float _433 = _427 + _378;
    float _435 = _429 + _380;
    float _437 = _431 + _382;
    float _439 = in.m_73.x;
    float _441 = in.m_73.y;
    float _443 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _445 = _433 + _443;
    float _447 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _449 = _435 + _447;
    float _451 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _453 = _437 + _451;
    float _455 = _445 * _445;
    float _457 = fma(_449, _449, _455);
    float _459 = fma(_453, _453, _457);
    int _461 = as_type<int>(_425) & 1;
    bool _463 = _461 != 0;
    int _465 = as_type<int>(_425) & 2;
    bool _467 = _465 != 0;
    float _469 = rsqrt(_459);
    bool _471 = !_463;
    float _473 = _471 ? (-0.5) : 0.5;
    bool _475 = !_467;
    float _477 = _475 ? (-0.5) : 0.5;
    float _479 = _441 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _481 = _479 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _483 = _445 * _469;
    float _485 = _449 * _469;
    float _487 = -_483;
    float _489 = fma(_487, (*spvDescriptorSet0.vp_c9)._m0[18].w, _445);
    float _491 = -_485;
    float _493 = fma(_491, (*spvDescriptorSet0.vp_c9)._m0[18].w, _449);
    float _495 = _453 * _469;
    float _497 = _489 * _489;
    float _499 = -_495;
    float _501 = fma(_499, (*spvDescriptorSet0.vp_c9)._m0[18].w, _453);
    float _503 = fma(_493, _493, _497);
    float _505 = fma(_501, _501, _503);
    float _507 = _439 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _509 = sqrt(_505);
    float _511 = _507 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _513 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _477);
    float _515 = _469 * _509;
    float _517 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _473);
    float _519 = _511 * _515;
    float _521 = _515 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _523 = _521 * 0.5;
    float _525 = _481 * _515;
    float _527 = _519 * _517;
    float _529 = _523 * _324;
    float _531 = _525 * _513;
    float _533 = _523 * _316;
    float _535 = _523 * _320;
    float _537 = fma(_527, _300, _529);
    float _539 = fma(_527, _286, _533);
    float _541 = -_531;
    float _543 = fma(_541, _336, _537);
    float _545 = -_531;
    float _547 = fma(_545, _328, _539);
    float _549 = _437 + _543;
    float _551 = fma(_527, _296, _535);
    float _553 = _435 + _547;
    float _555 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _557 = _549 + _555;
    float _559 = -_531;
    float _561 = fma(_559, _332, _551);
    float _563 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _565 = _553 + _563;
    float _567 = _557 * _557;
    float _569 = _433 + _561;
    float _571 = fma(_565, _565, _567);
    float _573 = sqrt(_571);
    bool _575 = _573 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _577 = _561;
    float _579 = _437;
    if (!_575)
    {
        _577 = _553;
    }
    float _581 = _577;
    float _583 = _411 * 2.0;
    float _585 = _393 * 2.0;
    float _587 = _399 * 2.0;
    float _589 = _393 * _393;
    float _591 = _405 * _583;
    float _593 = _393 * _583;
    float _595 = _399 * _583;
    float _597 = _405 * _405;
    float _599 = -_591;
    float _601 = fma(_399, _585, _599);
    float _603 = fma(_399, _585, _591);
    float _605 = fma(_405, _585, _595);
    float _607 = -_595;
    float _609 = fma(_405, _585, _607);
    float _611 = -_593;
    float _613 = fma(_405, _587, _611);
    float _615 = _399 * _399;
    float _617 = fma(_405, _587, _593);
    float _619 = _393;
    float _621 = _399;
    float _623 = _581;
    if (!_575)
    {
        _619 = _549;
    }
    float _625 = _619;
    float _627 = _625;
    if (!_575)
    {
        _621 = _569;
    }
    float _629 = _621;
    bool _631 = !_575;
    float _633 = _629;
    if (!_631)
    {
        float _635 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _637 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _639 = _573 + _637;
        float _641 = _569 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _643 = rsqrt(_571);
        float _645 = _639 * _635;
        float _647 = _645 * 0.15915493667125701904296875;
        float _649 = _647 * 6.283185482025146484375;
        float _651 = cos(_649);
        float _653 = _647 * 6.283185482025146484375;
        float _655 = sin(_653);
        float _657 = _651 + (-1.0);
        float _659 = _657 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _661 = fma(_655, _641, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _663 = fma(_569, _651, _659);
        float _665 = _643 * _661;
        float _667 = fma(_565, _665, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _669 = fma(_557, _665, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _633 = _663;
        _623 = _667;
        _627 = _669;
    }
    float _671 = _633;
    float _673 = _623;
    float _675 = _627;
    float _677 = -_433;
    float _679 = _677 + _671;
    float _681 = -_435;
    float _683 = _681 + _673;
    float _685 = fma(_615, -2.0, 1.0);
    float _687 = fma(_589, -2.0, 1.0);
    float _689 = _679 * _320;
    float _691 = _679 * _296;
    float _693 = _679 * _332;
    float _695 = -_437;
    float _697 = _695 + _675;
    float _699 = fma(_683, _316, _689);
    float _701 = fma(_597, -2.0, _685);
    float _703 = fma(_683, _286, _691);
    float _705 = fma(_597, -2.0, _687);
    float _707 = fma(_697, _324, _699);
    float _709 = fma(_683, _328, _693);
    float _711 = fma(_697, _300, _703);
    float _713 = _707 * _601;
    float _715 = _707 * _705;
    float _717 = _707 * _617;
    float _719 = fma(_697, _336, _709);
    float _721 = fma(_711, _701, _713);
    float _723 = fma(_711, _603, _715);
    float _725 = fma(_615, -2.0, _687);
    float _727 = fma(_711, _609, _717);
    bool _729 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _731 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _733 = _729 || _731;
    bool _735 = isnan(0.5);
    bool _737 = _733 || _735;
    float _739 = fma(_719, _613, _723);
    float _741 = fma(_719, _605, _721);
    float _743 = fma(_719, _725, _727);
    float _745 = -_495;
    float _747 = fma(_745, (*spvDescriptorSet0.vp_c9)._m0[18].w, _437);
    float _749 = _433 + _739;
    float _751 = -_483;
    float _753 = fma(_751, (*spvDescriptorSet0.vp_c9)._m0[18].w, _433);
    float _755 = _437 + _743;
    float _757 = _435 + _741;
    float _759 = -_483;
    float _761 = fma(_759, (*spvDescriptorSet0.vp_c9)._m0[18].w, _749);
    float _763 = -_495;
    float _765 = fma(_763, (*spvDescriptorSet0.vp_c9)._m0[18].w, _755);
    float _767 = -_485;
    float _769 = fma(_767, (*spvDescriptorSet0.vp_c9)._m0[18].w, _757);
    float _771 = -_485;
    float _773 = fma(_771, (*spvDescriptorSet0.vp_c9)._m0[18].w, _435);
    float _775 = _755;
    float _777 = _761;
    float _779 = _769;
    float _781 = _739;
    float _783 = _741;
    if (_737)
    {
        _775 = _761;
    }
    float _785 = _775;
    float _787 = _785;
    if (_737)
    {
        _777 = _765;
    }
    float _789 = _777;
    float _791 = _789;
    if (!_737)
    {
        float _793 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _795 = _753 + _793;
        float _797 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _799 = _773 + _797;
        float _801 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _803 = _795 * _795;
        float _805 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _807 = _747 + _805;
        float _809 = fma(_799, _799, _803);
        float _811 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _813 = fma(_807, _807, _809);
        float _815 = sqrt(_813);
        float _817 = 1.0 / _515;
        float _819 = precise::min(_815, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _821 = _819 * _801;
        float _823 = _811 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _825 = _821 * _817;
        float _827 = _823 * _825;
        float _829 = fma(_741, _827, _773);
        float _831 = fma(_739, _827, _753);
        float _833 = fma(_743, _827, _747);
        _787 = _831;
        _779 = _829;
        _791 = _833;
    }
    float _835 = _787;
    float _837 = _779;
    float _839 = _791;
    float _841 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _843 = _835 + _841;
    float _845 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _847 = _837 + _845;
    float _849 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _851 = _839 + _849;
    float _853 = _843 * _843;
    float _855 = fma(_847, _847, _853);
    float _857 = fma(_851, _851, _855);
    float _859 = rsqrt(_857);
    float _861 = sqrt(_857);
    float _863 = _847 * _859;
    float _865 = _851 * _859;
    float _867 = _843 * _859;
    float _869 = _863 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _871 = _865 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _873 = _869 * _869;
    float _875 = _871 * _871;
    float _877 = _873 + _875;
    float _879 = sqrt(_877);
    bool _881 = _879 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _883 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _885 = _879 + _883;
    float _887 = _743;
    float _889 = _877;
    float _891 = _885;
    if (_881)
    {
        float _893 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _887 = _893;
    }
    float _895 = _887;
    if (_881)
    {
        float _897 = rsqrt(_877);
        _889 = _897;
    }
    float _899 = _889;
    float _901 = _899;
    if (_881)
    {
        float _903 = _885 * _895;
        _891 = _903;
    }
    float _905 = _891;
    if (_881)
    {
        float _907 = _905 * 0.15915493667125701904296875;
        _781 = _907;
    }
    float _909 = _781;
    float _911 = _515;
    float _913 = _909;
    if (_881)
    {
        float _915 = _909 * 6.283185482025146484375;
        float _917 = sin(_915);
        _911 = _917;
    }
    float _919 = _911;
    float _921 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _923 = precise::max(0.0, _921);
    float _925 = _895;
    float _927 = _923;
    float _929 = _921;
    if (_881)
    {
        float _931 = _909 * 6.283185482025146484375;
        float _933 = cos(_931);
        _925 = _933;
    }
    float _935 = _925;
    float _937 = -_867;
    float _939 = -_923;
    float _941 = fma(_937, (*spvDescriptorSet0.vp_c15)._m0[24].y, _939);
    if (_881)
    {
        float _943 = _941 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _927 = _943;
    }
    float _945 = _927;
    float _947 = _945;
    if (!_881)
    {
        _913 = _871;
    }
    float _949 = _913;
    float _951 = _919;
    float _953 = _949;
    if (_881)
    {
        float _955 = fma(_919, _945, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _783 = _955;
    }
    float _957 = _783;
    float _959 = _957;
    if (!_881)
    {
        _951 = _869;
    }
    float _961 = _951;
    float _963 = _961;
    if (!_881)
    {
        _947 = _941;
    }
    float _965 = _947;
    float _967 = _965;
    if (_881)
    {
        float _969 = _935 + (-1.0);
        _929 = _969;
    }
    float _971 = _929;
    float _973 = 0.0;
    float _975 = _971;
    if (_881)
    {
        float _977 = _899 * _957;
        _973 = _977;
    }
    float _979 = _973;
    if (!_881)
    {
        _901 = _873;
    }
    float _981 = _901;
    float _983 = _981;
    if (_881)
    {
        float _985 = _971 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _975 = _985;
    }
    float _987 = _975;
    if (_881)
    {
        float _989 = _869 * _979;
        _963 = _989;
    }
    float _991 = _963;
    if (_881)
    {
        float _993 = _871 * _979;
        _953 = _993;
    }
    float _995 = _953;
    if (!_881)
    {
        _959 = _875;
    }
    float _997 = _959;
    float _999 = _997;
    if (_881)
    {
        float _1001 = fma(_941, _935, _987);
        _967 = _1001;
    }
    float _1003 = _967;
    if (_881)
    {
        float _1005 = _991 * _991;
        _983 = _1005;
    }
    float _1007 = _983;
    if (_881)
    {
        float _1009 = _995 * _995;
        _999 = _1009;
    }
    float _1011 = _999;
    float _1013 = _835 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1015 = fma(_1003, _1003, _1007);
    float _1017 = _835 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1019 = fma(_837, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1013);
    float _1021 = _1015 + _1011;
    float _1023 = fma(_837, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1017);
    float _1025 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1027 = fma(_861, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1025);
    float _1029 = precise::clamp(_1027, 0.0, 1.0);
    float _1031 = _835 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1033 = fma(_839, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1023);
    float _1035 = -_1029;
    float _1037 = _1035 + 1.0;
    float _1039 = rsqrt(_1021);
    float _1041 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1043 = _1033 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1045 = fma(_747, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1047 = fma(_837, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1031);
    float _1049 = _1043 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1051 = fma(_839, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1019);
    float _1053 = abs(_1037);
    float _1055 = log2(_1053);
    float _1057 = fma(_839, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1047);
    float _1059 = -_1049;
    float _1061 = fma(_1059, _1041, 1.0);
    float _1063 = _835 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1065 = fma(_773, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1067 = _1057 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1069 = _1051 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1071 = fma(_837, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1063);
    float _1073 = floor(_1065);
    float _1075 = _1039 * _991;
    float _1077 = _1039 * _1003;
    float _1079 = fma(_839, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1071);
    float _1081 = _1039 * _995;
    float _1083 = _1067 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1085 = _1075 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1087 = _1079 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1089 = log2(_1061);
    float _1091 = _1055 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1093 = -_1085;
    float _1095 = fma(_1077, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1093);
    float _1097 = fma(_1087, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1083);
    float _1099 = -_1081;
    float _1101 = fma(_1099, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1095);
    float _1103 = floor(_1045);
    float _1105 = fma(_1043, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1097);
    float _1107 = fma(_1101, -0.5, 0.5);
    float _1109 = -_1073;
    float _1111 = _1065 + _1109;
    float _1113 = _1067 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1115 = fma(_1069, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1105);
    float _1117 = _1067 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1119 = fma(_1101, 0.5, 0.5);
    float _1121 = exp2(_1091);
    float _1123 = fma(_1087, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1113);
    float _1125 = fma(_1087, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1117);
    float _1127 = _1077 + 1.0;
    float _1129 = fma(_1043, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1123);
    float _1131 = fma(_1043, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1125);
    float _1133 = 1.0 / _1115;
    float _1135 = -_1103;
    float _1137 = _1045 + _1135;
    float _1139 = fma(_1119, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1141 = fma(_1119, _1139, -0.212114393711090087890625);
    float _1143 = sqrt(_1107);
    float _1145 = -_1077;
    float _1147 = fma(_1121, _1127, _1145);
    float _1149 = fma(_1069, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1129);
    float _1151 = fma(_1069, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1131);
    float _1153 = _1089 * 0.693147182464599609375;
    float2 _3793 = float2(_1111, _1137);
    float _1155 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3793, float2(0.0), isnan(_3793)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3793, float2(0.0), isnan(_3793)), level(0.0)).x;
    float _1157 = fma(_1119, _1141, 1.570728778839111328125);
    float _1159 = fma(_1147, 0.5, 0.5);
    float _1161 = _1149 * _1133;
    float _1163 = _1151 * _1133;
    float _1165 = _1153 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1167 = fma(_1161, 0.5, 0.5);
    float _1169 = fma(_1163, -0.5, 0.5);
    float _1171 = _1143 * 0.636619746685028076171875;
    float3 _3827 = float3(_1167, _1169, _1165);
    float _1173 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3827, float3(0.0), isnan(_3827)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3827, float3(0.0), isnan(_3827)), level(0.0)).x;
    float _1175 = -_1157;
    float _1177 = fma(_1171, _1175, 1.0);
    float3 _3843 = float3(_1167, _1169, _1165);
    float4 _1180 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3843, float3(0.0), isnan(_3843)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3843, float3(0.0), isnan(_3843)), level(0.0)).xyzw;
    float _1182 = _1180.x;
    float _1184 = _1180.y;
    float _1186 = _1180.z;
    float _1188 = _1180.w;
    float2 _3859 = float2(_1177, _1159);
    float3 _1192 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3859, float2(0.0), isnan(_3859)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3859, float2(0.0), isnan(_3859)), level(0.0)).xyz;
    float _1194 = _1192.x;
    float _1196 = _1192.y;
    float _1198 = _1192.z;
    float _1200 = in.m_66.y;
    float _1202 = _1055 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1204 = _1067 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1206 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1208 = _1206 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1210 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _1212 = _753 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1214 = _753 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1216 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1218 = _1216 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1220 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1222 = _1220 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1224 = 1.0 / _1208;
    float _1226 = fma(_773, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1214);
    float _1228 = _1210 * _188;
    float _1230 = fma(_773, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1212);
    float _1232 = fma(_747, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1226);
    float _1234 = fma(_747, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1230);
    float _1236 = 1.0 / _1218;
    float _1238 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1240 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1238;
    int _1242 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1244 = _1242 != 0;
    float _1246 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1248 = _1246 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    bool _1250 = _1200 > 0.5;
    float _1252 = _1232 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    int _1254 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1256 = _1254 != 0;
    float _1258 = 1.0 / _1222;
    float _1260 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.300000011920928955078125;
    float _1262 = _1248 * _1224;
    float _1264 = _1234 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1266 = _188 > 0.5;
    float _1268 = trunc(_1228);
    int _1270 = int(_1268);
    float _1272 = _1240 * _1236;
    float _1274 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1276 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1274;
    float _1278 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1280 = fma(_1260, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1278);
    float _1282 = _473 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1284 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1286 = fma(_1260, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1284);
    float _1288 = _1264 + _1252;
    out.m_75.x = _837;
    out.m_75.y = _835;
    out.m_75.z = _839;
    float _1290 = 1.0 / _1252;
    float _1292 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _1286);
    float _1294 = _437 + _1292;
    int _1296 = _1270 << 4;
    int _1298 = _1296 + 1968;
    float _1300 = _1276 * _1258;
    float _1302 = fma(_1282, _286, _316);
    int _1304 = _1298 + 8;
    uint _1306 = uint(int(uint(_1304) >> uint(2)));
    uint _1308 = uint(int(uint(int(_1306)) >> uint(2)));
    int _1310 = int(_1306) & 3;
    float _1312 = (*spvDescriptorSet0.vp_c9)._m0[int(_1308)][_1310];
    float _1314 = _477 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1316 = exp2(_1202);
    float _1318 = _1288 * _1290;
    float _1320 = _1318 * 0.5;
    float _1322 = fma(_1282, _296, _320);
    float _1324 = fma(_1282, _300, _324);
    float _1326 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1328 = _368 + _1326;
    float _1330 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1332 = fma(_1320, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1330);
    uint _1334 = uint(int(uint(_1298) >> uint(2)));
    uint _1336 = uint(int(uint(int(_1334)) >> uint(2)));
    int _1338 = int(_1334) & 3;
    float _1340 = (*spvDescriptorSet0.vp_c9)._m0[int(_1336)][_1338];
    int _1342 = int(_1334) + 1;
    uint _1344 = uint(int(uint(_1342) >> uint(2)));
    int _1346 = _1342 & 3;
    float _1348 = (*spvDescriptorSet0.vp_c9)._m0[int(_1344)][_1346];
    float _1350 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1352 = _368 + _1350;
    float _1354 = fma(_1262, _1328, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1356 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1358 = _368 + _1356;
    float _1360 = -_473;
    int _1362 = _1266 ? as_type<int>(_1360) : as_type<int>(_473);
    float _1364 = 1.0 / _1332;
    float _1366 = fma(_1272, _1352, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1368 = fma(_1300, _1358, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    bool _1370 = !_1244;
    float _1372 = _1370 ? _473 : as_type<float>(_1362);
    float _1374 = -_1314;
    float _1376 = fma(_1374, _332, _1322);
    bool _1378 = _368 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1380 = isnan(_368);
    bool _1382 = _1378 || _1380;
    bool _1384 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1386 = _1382 || _1384;
    float _1388 = float(_1386);
    float _1390 = -_1316;
    float _1392 = _1390 + 1.0;
    bool _1394 = _368 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1396 = isnan(_368);
    bool _1398 = _1394 || _1396;
    bool _1400 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1402 = _1398 || _1400;
    float _1404 = float(_1402);
    float _1406 = _1372 + 0.5;
    bool _1408 = _368 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1410 = isnan(_368);
    bool _1412 = _1408 || _1410;
    bool _1414 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1416 = _1412 || _1414;
    float _1418 = float(_1416);
    float _1420 = -_1388;
    float _1422 = _1420 + 1.0;
    bool _1424 = _368 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1426 = isnan(_368);
    bool _1428 = _1424 || _1426;
    bool _1430 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1432 = _1428 || _1430;
    float _1434 = float(_1432);
    float _1436 = -_1404;
    float _1438 = _1436 + 1.0;
    bool _1440 = 0.0 != (*spvDescriptorSet0.vp_c11)._m0[20].z;
    bool _1442 = isnan(0.0);
    bool _1444 = _1440 || _1442;
    bool _1446 = isnan((*spvDescriptorSet0.vp_c11)._m0[20].z);
    bool _1448 = _1444 || _1446;
    float _1450 = _1404 * _1422;
    float _1452 = -_477;
    int _1454 = _1250 ? as_type<int>(_1452) : as_type<int>(_477);
    float _1456 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1458 = _1364 * _1456;
    float _1460 = _1418 * _1438;
    float _1462 = -_1418;
    float _1464 = _1462 + 1.0;
    bool _1466 = !_1256;
    float _1468 = _1466 ? _477 : as_type<float>(_1454);
    float _1470 = abs(_1458);
    float _1472 = log2(_1470);
    float _1474 = -_1314;
    float _1476 = fma(_1474, _328, _1302);
    float _1478 = -_1314;
    float _1480 = fma(_1478, _336, _1324);
    float _1482 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _1280);
    uint _1484 = uint(int(uint(_340) >> uint(2)));
    uint _1486 = uint(int(uint(int(_1484)) >> uint(2)));
    int _1488 = int(_1484) & 3;
    float _1490 = (*spvDescriptorSet0.vp_c9)._m0[int(_1486)][_1488];
    int _1492 = int(_1484) + 1;
    uint _1494 = uint(int(uint(_1492) >> uint(2)));
    int _1496 = _1492 & 3;
    float _1498 = (*spvDescriptorSet0.vp_c9)._m0[int(_1494)][_1496];
    float _1500 = _1434 * _1464;
    float _1502 = (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _1504 = _1115;
    if (_1448)
    {
        float _1506 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.20000000298023223876953125;
        _1502 = _1506;
    }
    float _1508 = _1502;
    float _1510 = _435 + _1482;
    float _1512 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1514 = _1366 * _1500;
    float _1516 = -_1468;
    float _1518 = _1516 + 0.5;
    if (_1448)
    {
        float _1520 = precise::min(_1508, 20.0);
        _579 = _1520;
    }
    float _1522 = _579;
    int _1524 = _340 + 8;
    uint _1526 = uint(int(uint(_1524) >> uint(2)));
    uint _1528 = uint(int(uint(int(_1526)) >> uint(2)));
    int _1530 = int(_1526) & 3;
    float _1532 = (*spvDescriptorSet0.vp_c9)._m0[int(_1528)][_1530];
    float _1534 = -_1510;
    float _1536 = _1534 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _1538 = _1312 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1540 = _1472 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1542 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1544 = _1538 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1546 = precise::min(_1510, _1536);
    float _1548 = -_1294;
    float _1550 = _1548 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _1552 = _1406 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1554 = _1518 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1556 = _1340 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1558 = _1348 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1560 = exp2(_1540);
    float _1562 = precise::min(_1294, _1550);
    float _1564 = _1556 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1566 = _1558 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1568 = _1458 <= 8000.0;
    bool _1570 = isnan(_1458);
    bool _1572 = _1568 || _1570;
    bool _1574 = isnan(8000.0);
    bool _1576 = _1572 || _1574;
    float _1578 = float(_1576);
    float _1580 = -_1434;
    float _1582 = _1580 + 1.0;
    float _1584 = precise::min(_1546, _1562);
    float _1586 = _1376 * _601;
    float _1588 = _1522;
    float _1590 = _1552;
    if (_1448)
    {
        float _1592 = 1.0 / _1522;
        _1588 = _1592;
    }
    float _1594 = _1588;
    out.m_77.x = _1564;
    out.m_77.y = _1566;
    out.m_77.z = _1544;
    float _1596 = _1376 * _705;
    float _1598 = fma(_1582, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1514);
    float _1600 = fma(_1476, _603, _1596);
    float _1602 = fma(_1354, _1460, _1598);
    float _1604 = fma(_1560, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1606 = precise::clamp(_1604, 0.0, 1.0);
    float _1608 = fma(_1480, _613, _1600);
    float _1610 = _1392 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1612 = fma(_1606, -2.0, 3.0);
    float _1614 = _1606 * _1606;
    float _1616 = _1552 * _1512;
    float _1618 = _1554 * _1542;
    float _1620 = _1610;
    if (!_1448)
    {
        _1590 = 1.0;
    }
    float _1622 = _1590;
    float _1624 = _1614 * _1612;
    float _1626 = _1622;
    if (_1448)
    {
        float _1628 = _1584 * _1594;
        float _1630 = precise::clamp(_1628, 0.0, 1.0);
        _1626 = _1630;
    }
    float _1632 = _1626;
    float _1634 = fma(_1087, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1204);
    out.m_79.x = _1616;
    out.m_79.y = _1618;
    float _1636 = _1376 * _617;
    float _1638 = fma(_1476, _701, _1586);
    float _1640 = fma(_1043, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1634);
    float _1642 = in.m_81.x;
    float _1644 = fma(_1476, _609, _1636);
    float _1646 = fma(_1480, _605, _1638);
    float _1648 = fma(_1069, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1640);
    float _1650 = fma(_1480, _725, _1644);
    float _1652 = -_1624;
    float _1654 = _1652 + 1.0;
    float _1656 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _1658 = _1648 + _1656;
    float _1660 = _1498 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1662 = fma(_1654, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1624);
    float _1664 = _1490 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1666 = _1115 + _1658;
    out.gl_Position.x = _1149;
    out.gl_Position.y = _1151;
    out.gl_Position.z = _1658;
    out.gl_Position.w = _1115;
    float _1668 = _1578 * _1662;
    bool _1670 = _861 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1672 = isnan(_861);
    bool _1674 = _1670 || _1672;
    bool _1676 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1678 = _1674 || _1676;
    float _1680 = _1666 * 0.5;
    out.m_83.x = _1646;
    out.m_83.y = _1608;
    out.m_83.z = _1650;
    float _1682 = _1668 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1684 = fma(_1368, _1450, _1602);
    float _1686 = _1532 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    out.m_85.z = _1680;
    out.m_85.w = _1115;
    float _1688 = _1664 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1690 = fma(_1388, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1684);
    float _1692 = _1660 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1694 = _1686 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1696 = _1632 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1698 = -_1610;
    float _1700 = _1698 + 1.0;
    float _1702 = _1690 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1704 = _1658;
    float _1706 = _1688;
    float _1708 = _1700;
    if (!_1678)
    {
        _1504 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1710 = _1504;
    float _1712 = _1710;
    float _1714 = _1710;
    if (!_1678)
    {
        _1704 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1716 = _1704;
    out.m_87.x = _1688;
    out.m_87.y = _1692;
    out.m_87.z = _1694;
    out.m_87.w = _1702;
    float _1718 = _1716;
    float _1720 = _1716;
    if (!_1678)
    {
        _1706 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1722 = _1706;
    float _1724 = -_1155;
    float _1726 = _1724 + 1.0;
    float _1728 = _1726 * _1682;
    float _1730 = precise::clamp(_1728, 0.0, 1.0);
    float _1732 = -_1730;
    float _1734 = fma(_1732, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1736 = _1610 * _1173;
    float _1738 = _1734 * _1642;
    float _1740 = _1722;
    float _1742 = _1722;
    if (!_1678)
    {
        _1620 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1744 = _1620;
    float _1746 = _1188 * _1736;
    float _1748 = _1738 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1750 = _1188 * _1700;
    float _1752 = _1746;
    float _1754 = _1744;
    float _1756 = _1744;
    if (!_1678)
    {
        _1708 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1758 = _1708;
    float _1760 = _1198 * _1736;
    float _1762 = fma(_1194, _1746, _1182);
    float _1764 = fma(_1196, _1746, _1184);
    out.m_89.x = _1748;
    float _1766 = fma(_1188, _1760, _1186);
    float _1768 = _1758;
    float _1770 = _1758;
    if (!_1678)
    {
        _1752 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1772 = _1752;
    out.m_91.x = _1762;
    out.m_91.y = _1764;
    out.m_91.z = _1766;
    out.m_91.w = _1750;
    bool _1774 = !_1678;
    float _1776 = _1772;
    float _1778 = _1772;
    if (!_1774)
    {
        bool _1780 = _861 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1782 = isnan(_861);
        bool _1784 = _1780 || _1782;
        bool _1786 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1788 = _1784 || _1786;
        if (!_1788)
        {
            float _1790 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1792 = _861 + _1790;
            float _1794 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1796 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1794;
            float _1798 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1800 = _1798 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1802 = 1.0 / _1796;
            float _1804 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1806 = _1804 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1808 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1810 = _1808 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1812 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1814 = _1812 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1816 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1818 = _1816 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1820 = _1792 * _1802;
            float _1822 = precise::clamp(_1820, 0.0, 1.0);
            float _1824 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1826 = _1824 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1828 = fma(_1822, _1800, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1830 = fma(_1822, _1826, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1832 = fma(_1822, _1806, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1834 = fma(_1822, _1810, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1836 = fma(_1822, _1814, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1838 = fma(_1822, _1818, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1714 = _1832;
            _1770 = _1836;
            _1742 = _1828;
            _1778 = _1834;
            _1720 = _1830;
            _1756 = _1838;
            _1840 = true;
        }
        else
        {
            bool _1842 = _861 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1844 = isnan(_861);
            bool _1846 = _1842 || _1844;
            bool _1848 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1850 = _1846 || _1848;
            if (!_1850)
            {
                _1740 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1852 = _1740;
            _1742 = _1852;
            if (!_1850)
            {
                _1712 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1854 = _1712;
            _1714 = _1854;
            if (!_1850)
            {
                _1718 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1856 = _1718;
            _1720 = _1856;
            if (!_1850)
            {
                _1776 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1858 = _1776;
            _1778 = _1858;
            if (!_1850)
            {
                _1768 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1860 = _1768;
            _1770 = _1860;
            if (!_1850)
            {
                _1754 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1862 = _1754;
            bool _1864 = !_1850;
            _1756 = _1862;
            if (!_1864)
            {
                bool _1866 = _861 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1868 = isnan(_861);
                bool _1870 = _1866 || _1868;
                bool _1872 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1874 = _1870 || _1872;
                if (!_1874)
                {
                    float _1876 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1878 = _861 + _1876;
                    float _1880 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1882 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1880;
                    float _1884 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1886 = _1884 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1888 = 1.0 / _1882;
                    float _1890 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1892 = _1890 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1894 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1896 = _1894 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1898 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1900 = _1898 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1902 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1904 = _1902 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1906 = _1878 * _1888;
                    float _1908 = precise::clamp(_1906, 0.0, 1.0);
                    float _1910 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1912 = _1910 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1914 = fma(_1908, _1886, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1916 = fma(_1908, _1912, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1918 = fma(_1908, _1892, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1920 = fma(_1908, _1896, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1922 = fma(_1908, _1900, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1924 = fma(_1908, _1904, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1714 = _1918;
                    _1770 = _1922;
                    _1742 = _1914;
                    _1778 = _1920;
                    _1720 = _1916;
                    _1756 = _1924;
                    _1840 = true;
                }
                else
                {
                    _1714 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1770 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1742 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1778 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1720 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1756 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1840 = false;
    float _1926 = _1714;
    float _1928 = _1770;
    float _1930 = _1742;
    float _1932 = _1778;
    float _1934 = _1720;
    float _1936 = _1756;
    float _1938 = fma(_1608, -0.5, 0.5);
    float _1940 = precise::clamp(_1938, 0.0, 1.0);
    float _1942 = -_1926;
    float _1944 = _1942 + _1928;
    float _1946 = -_1930;
    float _1948 = _1946 + _1932;
    float _1950 = -_1934;
    float _1952 = _1950 + _1936;
    bool _1954 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1956 = fma(_1940, _1944, _1926);
    float _1958 = fma(_1940, _1948, _1930);
    float _1960 = fma(_1940, _1952, _1934);
    float _1962 = _1696 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1964 = _1956 * 0.586610972881317138671875;
    out.m_93.x = 0.0;
    float _1966 = fma(_1958, 0.298911988735198974609375, _1964);
    out.m_89.w = _1962;
    float _1968 = fma(_1960, 0.114477999508380889892578125, _1966);
    out.m_56.x = 1.0;
    float _1970 = -_1968;
    float _1972 = _1958 + _1970;
    float _1974 = -_1968;
    float _1976 = _1956 + _1974;
    float _1978 = -_1968;
    float _1980 = _1960 + _1978;
    float _1982 = fma(_1972, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1968);
    float _1984 = fma(_1976, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1968);
    float _1986 = fma(_1980, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1968);
    out.m_95.x = 0.0;
    out.m_97.x = _1982;
    out.m_97.y = _1984;
    out.m_97.z = _1986;
    if (!_1954)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1988 = -_835;
    float _1990 = _1988 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1992 = -_837;
    float _1994 = _1992 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1996 = -_839;
    float _1998 = _1996 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2000 = _1990 * _1990;
    float _2002 = fma(_1994, _1994, _2000);
    float _2004 = fma(_1998, _1998, _2002);
    float _2006 = rsqrt(_2004);
    float _2008 = _1990 * _2006;
    float _2010 = _1994 * _2006;
    float _2012 = _1998 * _2006;
    float _2014 = sqrt(_2004);
    float _2016 = -_867;
    float _2018 = _2016 + _2008;
    float _2020 = -_863;
    float _2022 = _2020 + _2010;
    float _2024 = -_865;
    float _2026 = _2024 + _2012;
    float _2028 = _2018 * _2018;
    float _2030 = fma(_2022, _2022, _2028);
    float _2032 = fma(_2026, _2026, _2030);
    float _2034 = -_2014;
    float _2036 = _2034 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2038 = rsqrt(_2032);
    float _2040 = _2036 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2042 = precise::clamp(_2040, 0.0, 1.0);
    float _2044 = abs(_2042);
    float _2046 = log2(_2044);
    float _2048 = _2018 * _2038;
    float _2050 = _2022 * _2038;
    float _2052 = _2026 * _2038;
    float _2054 = _1608 * _2048;
    float _2056 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
    float _2058 = precise::clamp(_2056, 0.0, 1.0);
    float _2060 = _1608 * _2008;
    float _2062 = fma(_1646, _2050, _2054);
    float _2064 = _2058 * _2058;
    float _2066 = _2046 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2068 = fma(_1646, _2010, _2060);
    float _2070 = fma(_1650, _2052, _2062);
    float _2072 = precise::clamp(_2070, 0.0, 1.0);
    float _2074 = _2064 + (-1.0);
    float _2076 = fma(_1650, _2012, _2068);
    float _2078 = precise::clamp(_2076, 0.0, 1.0);
    float _2080 = _2072 * _2072;
    float _2082 = _2010 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2084 = exp2(_2066);
    float _2086 = fma(_2080, _2074, 1.0);
    float _2088 = -_2008;
    float _2090 = -_2082;
    float _2092 = fma(_2088, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2090);
    float _2094 = _2086 * _2086;
    float _2096 = -_2012;
    float _2098 = fma(_2096, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2092);
    float _2100 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2102 = _2098 + _2100;
    float _2104 = 1.0 / _2094;
    float _2106 = _2102 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2108 = precise::clamp(_2106, 0.0, 1.0);
    float _2110 = _2084 * _2108;
    float _2112 = _2078 * _2110;
    float _2114 = _2112 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2116 = _2064 * _2104;
    float _2118 = _2112 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2120 = _2112 * _2116;
    float _2122 = _2112 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    float _2124 = _2120 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2126 = _2120 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2128 = _2120 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_93.x = _2114;
    out.m_93.y = _2118;
    out.m_93.z = _2122;
    out.m_95.x = _2124;
    out.m_95.y = _2126;
    out.m_95.z = _2128;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

