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
    constant _16* vp_c8 [[id(0)]];
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c9 [[id(2)]];
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
    float4 m_81 [[user(locn2)]];
    float4 m_83 [[user(locn3)]];
    float4 m_95 [[user(locn4)]];
    float4 m_56 [[user(locn5)]];
    float4 m_85 [[user(locn6)]];
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
    float4 m_79 [[attribute(0)]];
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
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1762 = false;
    bool _348 = false;
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
        float _2107 = as_type<float>(_132);
        out.gl_Position.z = _2107;
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
    float _152 = 0.0;
    if (_146)
    {
        float _154 = float(_116);
        _152 = _154;
    }
    float _156 = _152;
    bool _158 = _150 >= _156;
    bool _160 = !_146;
    bool _162 = _158 || _160;
    if (_162)
    {
        _126 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _164 = _126;
    if (_162)
    {
        out.m_56.x = 0.0;
    }
    if (_162)
    {
        float _166 = _164 * 5.0;
        _134 = as_type<int>(_166);
    }
    int _168 = _134;
    if (_162)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2175 = as_type<float>(_168);
        out.gl_Position.z = _2175;
    }
    if (_162)
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
    float _188 = _170 * _170;
    float _190 = _172 * _172;
    float _192 = _174 * _174;
    float _194 = fma(_176, _176, _188);
    float _196 = fma(_178, _178, _190);
    float _198 = fma(_180, _180, _192);
    float _200 = fma(_182, _182, _194);
    float _202 = fma(_184, _184, _196);
    float _204 = fma(_186, _186, _198);
    float _206 = sqrt(_200);
    float _208 = sqrt(_202);
    float _210 = sqrt(_204);
    bool _212 = _206 > 0.0;
    bool _214 = _208 > 0.0;
    float _216 = _208;
    if (_212)
    {
        float _218 = rsqrt(_200);
        _216 = _218;
    }
    float _220 = _216;
    float _222 = 0.0;
    if (!_212)
    {
        _222 = 0.0;
    }
    float _224 = _222;
    bool _226 = _210 > 0.0;
    float _228 = 0.0;
    float _230 = _224;
    if (!_212)
    {
        _228 = 0.0;
    }
    float _232 = _228;
    float _234 = 0.0;
    float _236 = _232;
    if (!_212)
    {
        _234 = 0.0;
    }
    float _238 = _234;
    float _240 = _210;
    float _242 = _238;
    if (_214)
    {
        float _244 = rsqrt(_202);
        _240 = _244;
    }
    float _246 = _240;
    float _248 = 0.0;
    if (!_214)
    {
        _248 = 0.0;
    }
    float _250 = _248;
    float _252 = 0.0;
    float _254 = _250;
    if (!_214)
    {
        _252 = 0.0;
    }
    float _256 = _252;
    float _258 = 0.0;
    float _260 = _256;
    if (!_214)
    {
        _258 = 0.0;
    }
    float _262 = _258;
    float _264 = _206;
    float _266 = _262;
    if (_226)
    {
        float _268 = rsqrt(_204);
        _264 = _268;
    }
    float _270 = _264;
    if (_212)
    {
        float _272 = _220 * _176;
        _230 = _272;
    }
    float _274 = _230;
    if (_212)
    {
        float _276 = _220 * _170;
        _236 = _276;
    }
    float _278 = _236;
    if (_212)
    {
        float _280 = _220 * _182;
        _242 = _280;
    }
    float _282 = _242;
    bool _284 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _286 = 0.0;
    if (!_226)
    {
        _286 = 0.0;
    }
    float _288 = _286;
    float _290 = 0.0;
    float _292 = _288;
    if (!_226)
    {
        _290 = 0.0;
    }
    float _294 = _290;
    float _296 = _294;
    if (_214)
    {
        float _298 = _246 * _178;
        _254 = _298;
    }
    float _300 = _254;
    float _302 = 0.0;
    if (!_226)
    {
        _302 = 0.0;
    }
    float _304 = _302;
    float _306 = _304;
    if (_214)
    {
        float _308 = _246 * _172;
        _260 = _308;
    }
    float _310 = _260;
    if (_214)
    {
        float _312 = _246 * _184;
        _266 = _312;
    }
    float _314 = _266;
    if (_226)
    {
        float _316 = _270 * _180;
        _292 = _316;
    }
    float _318 = _292;
    if (_226)
    {
        float _320 = _270 * _174;
        _296 = _320;
    }
    float _322 = _296;
    if (_226)
    {
        float _324 = _270 * _186;
        _306 = _324;
    }
    float _326 = _306;
    bool _328 = !_284;
    float _346;
    if (!_328)
    {
        float _330 = in.m_66.x;
        float _332 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _334 = _330 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _336 = fma(_334, (*spvDescriptorSet0.vp_c9)._m0[11].y, _150);
        float _338 = _336 * _332;
        float _340 = floor(_338);
        float _342 = -_340;
        float _344 = _338 + _342;
        _346 = _344;
        _348 = true;
    }
    else
    {
        float _350 = float(_116);
        float _352 = 1.0 / _350;
        float _354 = _150 * _352;
        _346 = _354;
    }
    _348 = false;
    float _356 = _346;
    float _358 = in.m_68.w;
    float _360 = in.m_53.x;
    float _362 = in.m_53.y;
    float _364 = in.m_53.z;
    float _366 = in.m_60.w;
    float _368 = in.m_62.w;
    float _370 = in.m_64.w;
    float _372 = as_type<float>(int(gl_VertexIndex));
    float _374 = trunc(_358);
    int _376 = int(_374);
    int _378 = _376 << 5;
    uint _381 = uint(int(uint(_378) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_381)];
    float _383 = as_type<float>(_dmw0.x);
    int _385 = _378 + 4;
    uint _387 = uint(int(uint(_385) >> uint(2)));
    float _389 = as_type<float>(_dmw0.y);
    int _391 = _378 + 8;
    uint _393 = uint(int(uint(_391) >> uint(2)));
    float _395 = as_type<float>(_dmw0.z);
    int _397 = _378 + 12;
    uint _399 = uint(int(uint(_397) >> uint(2)));
    float _401 = as_type<float>(_dmw0.w);
    float _403 = _172 * _362;
    float _405 = _178 * _362;
    float _407 = _184 * _362;
    int _409 = as_type<int>(_372) & 1;
    bool _411 = _409 != 0;
    int _413 = as_type<int>(_372) & 2;
    bool _415 = _413 != 0;
    float _417 = fma(_170, _360, _403);
    float _419 = fma(_176, _360, _405);
    float _421 = fma(_182, _360, _407);
    float _423 = fma(_174, _364, _417);
    float _425 = fma(_180, _364, _419);
    float _427 = fma(_186, _364, _421);
    float _429 = _423 + _366;
    float _431 = _425 + _368;
    float _433 = _427 + _370;
    float _435 = in.m_73.x;
    float _437 = in.m_73.y;
    float _439 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _441 = _429 + _439;
    float _443 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _445 = _431 + _443;
    float _447 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _449 = _433 + _447;
    bool _451 = !_411;
    float _453 = _451 ? (-0.5) : 0.5;
    float _455 = _441 * _441;
    bool _457 = !_415;
    float _459 = _457 ? (-0.5) : 0.5;
    float _461 = fma(_445, _445, _455);
    float _463 = fma(_449, _449, _461);
    float _465 = rsqrt(_463);
    float _467 = _441 * _465;
    float _469 = _445 * _465;
    float _471 = _449 * _465;
    float _473 = -_467;
    float _475 = fma(_473, (*spvDescriptorSet0.vp_c9)._m0[18].w, _441);
    float _477 = -_469;
    float _479 = fma(_477, (*spvDescriptorSet0.vp_c9)._m0[18].w, _445);
    float _481 = -_471;
    float _483 = fma(_481, (*spvDescriptorSet0.vp_c9)._m0[18].w, _449);
    float _485 = _475 * _475;
    float _487 = _437 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _489 = fma(_479, _479, _485);
    float _491 = fma(_483, _483, _489);
    float _493 = _435 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _495 = sqrt(_491);
    float _497 = _493 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _499 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _459);
    float _501 = _465 * _495;
    float _503 = _487 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _505 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _453);
    float _507 = _497 * _501;
    float _509 = _501 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _511 = _509 * 0.5;
    float _513 = _503 * _501;
    float _515 = _507 * _505;
    float _517 = _511 * _314;
    float _519 = _513 * _499;
    float _521 = _511 * _300;
    float _523 = _511 * _310;
    float _525 = fma(_515, _282, _517);
    float _527 = fma(_515, _274, _521);
    float _529 = -_519;
    float _531 = fma(_529, _326, _525);
    float _533 = -_519;
    float _535 = fma(_533, _318, _527);
    float _537 = _433 + _531;
    float _539 = _431 + _535;
    float _541 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _543 = _537 + _541;
    float _545 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _547 = _539 + _545;
    float _549 = _543 * _543;
    float _551 = fma(_547, _547, _549);
    float _553 = fma(_515, _278, _523);
    float _555 = sqrt(_551);
    float _557 = -_519;
    float _559 = fma(_557, _322, _553);
    float _561 = _429 + _559;
    bool _563 = _555 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _565 = _559;
    float _567 = _519;
    float _569 = _539;
    if (!_563)
    {
        _565 = _539;
    }
    float _571 = _565;
    float _573 = _571;
    if (!_563)
    {
        _567 = _537;
    }
    float _575 = _567;
    float _577 = _401 * 2.0;
    float _579 = _383 * 2.0;
    float _581 = _389 * 2.0;
    float _583 = _383 * _383;
    float _585 = _395 * _577;
    float _587 = _383 * _577;
    float _589 = _389 * _577;
    float _591 = _383;
    float _593 = _575;
    if (!_563)
    {
        _591 = _561;
    }
    float _595 = _591;
    float _597 = -_585;
    float _599 = fma(_389, _579, _597);
    float _601 = fma(_389, _579, _585);
    float _603 = fma(_395, _579, _589);
    float _605 = -_589;
    float _607 = fma(_395, _579, _605);
    float _609 = -_587;
    float _611 = fma(_395, _581, _609);
    float _613 = fma(_395, _581, _587);
    float _615 = _389 * _389;
    float _617 = _395 * _395;
    bool _619 = !_563;
    float _621 = _595;
    if (!_619)
    {
        float _623 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _625 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _627 = _555 + _625;
        float _629 = _561 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _631 = rsqrt(_551);
        float _633 = _627 * _623;
        float _635 = _633 * 0.15915493667125701904296875;
        float _637 = _635 * 6.283185482025146484375;
        float _639 = sin(_637);
        float _641 = _635 * 6.283185482025146484375;
        float _643 = cos(_641);
        float _645 = fma(_639, _629, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _647 = _631 * _645;
        float _649 = _643 + (-1.0);
        float _651 = fma(_547, _647, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _653 = fma(_543, _647, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _655 = _649 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _657 = fma(_561, _643, _655);
        _621 = _657;
        _573 = _651;
        _593 = _653;
        _569 = _635;
    }
    float _659 = _621;
    float _661 = _573;
    float _663 = _593;
    float _665 = _569;
    float _667 = -_429;
    float _669 = _667 + _659;
    float _671 = -_431;
    float _673 = _671 + _661;
    float _675 = fma(_583, -2.0, 1.0);
    float _677 = -_433;
    float _679 = _677 + _663;
    float _681 = _669 * _310;
    float _683 = _669 * _278;
    float _685 = _669 * _322;
    float _687 = fma(_615, -2.0, 1.0);
    float _689 = fma(_673, _300, _681);
    float _691 = fma(_673, _274, _683);
    float _693 = fma(_673, _318, _685);
    float _695 = fma(_617, -2.0, _675);
    float _697 = fma(_679, _314, _689);
    float _699 = fma(_617, -2.0, _687);
    float _701 = fma(_615, -2.0, _675);
    float _703 = fma(_679, _282, _691);
    float _705 = fma(_679, _326, _693);
    float _707 = _697 * _599;
    float _709 = _697 * _695;
    float _711 = _697 * _613;
    float _713 = fma(_703, _699, _707);
    float _715 = fma(_703, _601, _709);
    float _717 = fma(_703, _607, _711);
    bool _719 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _721 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _723 = _719 || _721;
    bool _725 = isnan(0.5);
    bool _727 = _723 || _725;
    float _729 = fma(_705, _603, _713);
    float _731 = fma(_705, _611, _715);
    float _733 = fma(_705, _701, _717);
    float _735 = _431 + _729;
    float _737 = _429 + _731;
    float _739 = _433 + _733;
    float _741 = -_467;
    float _743 = fma(_741, (*spvDescriptorSet0.vp_c9)._m0[18].w, _429);
    float _745 = -_469;
    float _747 = fma(_745, (*spvDescriptorSet0.vp_c9)._m0[18].w, _735);
    float _749 = -_467;
    float _751 = fma(_749, (*spvDescriptorSet0.vp_c9)._m0[18].w, _737);
    float _753 = -_471;
    float _755 = fma(_753, (*spvDescriptorSet0.vp_c9)._m0[18].w, _739);
    float _757 = -_469;
    float _759 = fma(_757, (*spvDescriptorSet0.vp_c9)._m0[18].w, _431);
    float _761 = -_471;
    float _763 = fma(_761, (*spvDescriptorSet0.vp_c9)._m0[18].w, _433);
    float _765 = _739;
    float _767 = _747;
    float _769 = _755;
    float _771 = _693;
    float _773 = _687;
    float _775 = _665;
    if (_727)
    {
        _765 = _747;
    }
    float _777 = _765;
    float _779 = _777;
    if (_727)
    {
        _767 = _751;
    }
    float _781 = _767;
    float _783 = _781;
    if (!_727)
    {
        float _785 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _787 = _743 + _785;
        float _789 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _791 = _759 + _789;
        float _793 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _795 = _787 * _787;
        float _797 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _799 = _763 + _797;
        float _801 = fma(_791, _791, _795);
        float _803 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _805 = fma(_799, _799, _801);
        float _807 = sqrt(_805);
        float _809 = 1.0 / _501;
        float _811 = precise::min(_807, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _813 = _811 * _793;
        float _815 = _803 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _817 = _813 * _809;
        float _819 = _815 * _817;
        float _821 = fma(_729, _819, _759);
        float _823 = fma(_731, _819, _743);
        float _825 = fma(_733, _819, _763);
        _783 = _823;
        _779 = _821;
        _769 = _825;
    }
    float _827 = _783;
    float _829 = _779;
    float _831 = _769;
    float _833 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _835 = _827 + _833;
    float _837 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _839 = _829 + _837;
    float _841 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _843 = _831 + _841;
    float _845 = _835 * _835;
    float _847 = fma(_839, _839, _845);
    float _849 = fma(_843, _843, _847);
    float _851 = rsqrt(_849);
    float _853 = sqrt(_849);
    float _855 = _839 * _851;
    float _857 = _843 * _851;
    float _859 = _835 * _851;
    float _861 = _855 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _863 = _857 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _865 = _861 * _861;
    float _867 = _863 * _863;
    float _869 = _865 + _867;
    float _871 = sqrt(_869);
    bool _873 = _871 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _875 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _877 = _871 + _875;
    float _879 = _731;
    float _881 = _877;
    float _883 = _861;
    float _885 = _863;
    if (_873)
    {
        float _887 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _879 = _887;
    }
    float _889 = _879;
    if (_873)
    {
        float _891 = rsqrt(_869);
        _771 = _891;
    }
    float _893 = _771;
    if (_873)
    {
        float _895 = _877 * _889;
        _881 = _895;
    }
    float _897 = _881;
    float _899 = _827 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_873)
    {
        float _901 = _897 * 0.15915493667125701904296875;
        _773 = _901;
    }
    float _903 = _773;
    float _905 = fma(_829, (*spvDescriptorSet0.vp_c8)._m0[3].x, _899);
    float _907 = _889;
    if (_873)
    {
        float _909 = _903 * 6.283185482025146484375;
        float _911 = sin(_909);
        _907 = _911;
    }
    float _913 = _907;
    float _915 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _917 = fma(_831, (*spvDescriptorSet0.vp_c8)._m0[3].z, _905);
    float _919 = precise::max(0.0, _915);
    float _921 = _733;
    float _923 = _915;
    float _925 = _919;
    if (_873)
    {
        float _927 = _903 * 6.283185482025146484375;
        float _929 = cos(_927);
        _921 = _929;
    }
    float _931 = _921;
    float _933 = _917 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _935 = -_859;
    float _937 = -_919;
    float _939 = fma(_935, (*spvDescriptorSet0.vp_c15)._m0[24].y, _937);
    if (_873)
    {
        float _941 = _939 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _923 = _941;
    }
    float _943 = _923;
    float _945 = _913;
    float _947 = _943;
    if (_873)
    {
        float _949 = fma(_913, _943, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _775 = _949;
    }
    float _951 = _775;
    float _953 = _951;
    if (!_873)
    {
        _945 = _939;
    }
    float _955 = _945;
    float _957 = _955;
    if (_873)
    {
        float _959 = _931 + (-1.0);
        _925 = _959;
    }
    float _961 = _925;
    float _963 = _961;
    if (_873)
    {
        float _965 = _893 * _951;
        _953 = _965;
    }
    float _967 = _953;
    if (_873)
    {
        float _969 = _961 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _947 = _969;
    }
    float _971 = _947;
    float _973 = _971;
    if (_873)
    {
        float _975 = _861 * _967;
        _883 = _975;
    }
    float _977 = _883;
    if (_873)
    {
        float _979 = _863 * _967;
        _885 = _979;
    }
    float _981 = _885;
    if (!_873)
    {
        _963 = _867;
    }
    float _983 = _963;
    float _985 = _983;
    if (_873)
    {
        float _987 = fma(_939, _931, _971);
        _957 = _987;
    }
    float _989 = _957;
    if (!_873)
    {
        _973 = _865;
    }
    float _991 = _973;
    float _993 = _991;
    if (_873)
    {
        float _995 = _977 * _977;
        _993 = _995;
    }
    float _997 = _993;
    float _999 = fma(_759, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (_873)
    {
        float _1001 = _981 * _981;
        _985 = _1001;
    }
    float _1003 = _985;
    float _1005 = fma(_989, _989, _997);
    float _1007 = _827 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1009 = floor(_999);
    float _1011 = _1005 + _1003;
    float _1013 = fma(_829, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1007);
    float _1015 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1017 = fma(_853, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1015);
    float _1019 = precise::clamp(_1017, 0.0, 1.0);
    float _1021 = _827 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1023 = fma(_831, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1013);
    float _1025 = -_1019;
    float _1027 = _1025 + 1.0;
    float _1029 = rsqrt(_1011);
    float _1031 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1033 = _1023 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1035 = fma(_763, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1037 = fma(_829, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1021);
    float _1039 = _1033 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1041 = -_1009;
    float _1043 = _999 + _1041;
    float _1045 = abs(_1027);
    float _1047 = log2(_1045);
    float _1049 = fma(_831, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1037);
    float _1051 = -_1039;
    float _1053 = fma(_1051, _1031, 1.0);
    float _1055 = _827 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1057 = _1049 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1059 = fma(_829, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1055);
    float _1061 = _1029 * _977;
    float _1063 = _1029 * _989;
    float _1065 = _1029 * _981;
    float _1067 = fma(_831, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1059);
    float _1069 = _1057 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1071 = _1061 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1073 = floor(_1035);
    float _1075 = _1067 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1077 = _1047 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1079 = -_1071;
    float _1081 = fma(_1063, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1079);
    float _1083 = _1057 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1085 = fma(_1075, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1069);
    float _1087 = _1063 + 1.0;
    float _1089 = -_1065;
    float _1091 = fma(_1089, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1081);
    float _1093 = log2(_1053);
    float _1095 = _1057 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1097 = fma(_1075, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1083);
    float _1099 = fma(_1091, -0.5, 0.5);
    float _1101 = fma(_1091, 0.5, 0.5);
    float _1103 = fma(_1075, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1095);
    float _1105 = fma(_1033, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1097);
    float _1107 = exp2(_1077);
    float _1109 = fma(_1033, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1085);
    float _1111 = -_1073;
    float _1113 = _1035 + _1111;
    float _1115 = fma(_1101, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1117 = fma(_1033, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1103);
    float _1119 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1109);
    float _1121 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1105);
    float _1123 = fma(_1101, _1115, -0.212114393711090087890625);
    float _1125 = sqrt(_1099);
    float _1127 = fma(_1101, _1123, 1.570728778839111328125);
    float _1129 = _1093 * 0.693147182464599609375;
    float _1131 = 1.0 / _1119;
    float _1133 = -_1063;
    float _1135 = fma(_1107, _1087, _1133);
    float _1137 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1117);
    float2 _3699 = float2(_1043, _1113);
    float _1139 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3699, float2(0.0), isnan(_3699)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3699, float2(0.0), isnan(_3699)), level(0.0)).x;
    float _1141 = _1129 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1143 = fma(_1135, 0.5, 0.5);
    float _1145 = _1125 * 0.636619746685028076171875;
    float _1147 = -_1127;
    float _1149 = fma(_1145, _1147, 1.0);
    float _1151 = _1121 * _1131;
    float _1153 = _1137 * _1131;
    float _1155 = fma(_1151, 0.5, 0.5);
    float _1157 = fma(_1153, -0.5, 0.5);
    float3 _3734 = float3(_1155, _1157, _1141);
    float _1159 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3734, float3(0.0), isnan(_3734)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3734, float3(0.0), isnan(_3734)), level(0.0)).x;
    float3 _3745 = float3(_1155, _1157, _1141);
    float4 _1162 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3745, float3(0.0), isnan(_3745)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3745, float3(0.0), isnan(_3745)), level(0.0)).xyzw;
    float _1164 = _1162.x;
    float _1166 = _1162.y;
    float _1168 = _1162.z;
    float _1170 = _1162.w;
    float2 _3761 = float2(_1149, _1143);
    float3 _1174 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3761, float2(0.0), isnan(_3761)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3761, float2(0.0), isnan(_3761)), level(0.0)).xyz;
    float _1176 = _1174.x;
    float _1178 = _1174.y;
    float _1180 = _1174.z;
    float _1182 = _743 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1184 = in.m_66.x;
    float _1186 = in.m_66.y;
    float _1188 = _743 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1190 = fma(_759, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1182);
    bool _1192 = 0.0 != (*spvDescriptorSet0.vp_c11)._m0[20].z;
    bool _1194 = isnan(0.0);
    bool _1196 = _1192 || _1194;
    bool _1198 = isnan((*spvDescriptorSet0.vp_c11)._m0[20].z);
    bool _1200 = _1196 || _1198;
    float _1202 = fma(_759, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1188);
    float _1204 = fma(_763, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1190);
    float _1206 = _1047 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1208 = fma(_763, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1202);
    float _1210 = _1204 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1212 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1214 = _1212 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1216 = _1208 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1218 = 1.0 / _1210;
    float _1220 = _1216 + _1210;
    float _1222 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1224 = _1057 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_75.x = _829;
    out.m_75.y = _827;
    out.m_75.z = _831;
    float _1226 = 1.0 / _1214;
    bool _1228 = _1184 > 0.5;
    float _1230 = _1222 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1232 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.300000011920928955078125;
    bool _1234 = _1186 > 0.5;
    float _1236 = fma(_1075, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1224);
    int _1238 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1240 = _1238 != 0;
    float _1242 = _1220 * _1218;
    float _1244 = _1242 * 0.5;
    float _1246 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1248 = fma(_1232, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1246);
    int _1250 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1252 = _1250 != 0;
    float _1254 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1256 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1254);
    float _1258 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1260 = _1258 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1262 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1264 = fma(_1232, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1262);
    float _1266 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1268 = 1.0 / _1256;
    float _1270 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1272 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1274 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1272;
    float _1276 = _1266 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1278 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1280 = _1278 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1282 = _1270 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1284 = _1274 * _1226;
    float _1286 = 1.0 / _1260;
    float _1288 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _1264);
    out.m_77.x = _1276;
    out.m_77.y = _1282;
    out.m_77.z = _1230;
    float _1290 = -_459;
    int _1292 = _1234 ? as_type<int>(_1290) : as_type<int>(_459);
    float _1294 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1296 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1294;
    float _1298 = _433 + _1288;
    float _1300 = _1288;
    float _1302 = _1119;
    float _1304 = _1137;
    float _1306 = _1121;
    if (_1200)
    {
        float _1308 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.20000000298023223876953125;
        _1300 = _1308;
    }
    float _1310 = _1300;
    float _1312 = fma(_1033, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1236);
    float _1314 = 1.0 / _1280;
    float _1316 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1318 = _1316 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1320 = _453 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1322 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1324 = _356 + _1322;
    bool _1326 = _356 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1328 = isnan(_356);
    bool _1330 = _1326 || _1328;
    bool _1332 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1334 = _1330 || _1332;
    float _1336 = float(_1334);
    float _1338 = _1318 * _1286;
    float _1340 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1342 = _356 + _1340;
    float _1344 = fma(_1320, _282, _314);
    float _1346 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1348 = _1268 * _1346;
    float _1350 = fma(_1320, _278, _310);
    float _1352 = fma(_1284, _1324, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1354 = fma(_1338, _1342, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1356 = _1296 * _1314;
    float _1358 = abs(_1348);
    float _1360 = log2(_1358);
    bool _1362 = _356 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1364 = isnan(_356);
    bool _1366 = _1362 || _1364;
    bool _1368 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1370 = _1366 || _1368;
    float _1372 = float(_1370);
    float _1374 = -_1336;
    float _1376 = _1374 + 1.0;
    bool _1378 = _356 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1380 = isnan(_356);
    bool _1382 = _1378 || _1380;
    bool _1384 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1386 = _1382 || _1384;
    float _1388 = float(_1386);
    float _1390 = fma(_1320, _274, _300);
    bool _1392 = _356 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1394 = isnan(_356);
    bool _1396 = _1392 || _1394;
    bool _1398 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1400 = _1396 || _1398;
    float _1402 = float(_1400);
    float _1404 = _1372 * _1376;
    float _1406 = -_1372;
    float _1408 = _1406 + 1.0;
    float _1410 = -_1388;
    float _1412 = _1410 + 1.0;
    float _1414 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1416 = _356 + _1414;
    float _1418 = exp2(_1206);
    float _1420 = _1388 * _1408;
    float _1422 = _1402 * _1412;
    float _1424 = _459 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1426 = fma(_1356, _1416, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1428 = -_453;
    int _1430 = _1228 ? as_type<int>(_1428) : as_type<int>(_453);
    float _1432 = _1360 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1434 = _1352 * _1422;
    float _1436 = -_1424;
    float _1438 = fma(_1436, _326, _1344);
    float _1440 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _1248);
    float _1442 = _1344;
    if (_1200)
    {
        float _1444 = precise::min(_1310, 20.0);
        _1442 = _1444;
    }
    float _1446 = _1442;
    float _1448 = -_1424;
    float _1450 = fma(_1448, _322, _1350);
    float _1452 = exp2(_1432);
    float _1454 = _431 + _1440;
    float _1456 = -_1402;
    float _1458 = _1456 + 1.0;
    float _1460 = -_1298;
    float _1462 = _1460 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    bool _1464 = !_1240;
    float _1466 = _1464 ? _453 : as_type<float>(_1430);
    float _1468 = -_1454;
    float _1470 = _1468 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _1472 = fma(_1458, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1434);
    float _1474 = _1446;
    if (_1200)
    {
        float _1476 = 1.0 / _1446;
        _1474 = _1476;
    }
    float _1478 = _1474;
    float _1480 = precise::min(_1298, _1462);
    float _1482 = fma(_1354, _1420, _1472);
    float _1484 = precise::min(_1454, _1470);
    float _1486 = _1466 + 0.5;
    float _1488 = -_1424;
    float _1490 = fma(_1488, _318, _1390);
    float _1492 = fma(_1426, _1404, _1482);
    float _1494 = precise::min(_1484, _1480);
    float _1496 = fma(_1452, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1498 = precise::clamp(_1496, 0.0, 1.0);
    float _1500 = _1486 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1502 = _1486;
    if (!_1200)
    {
        _1502 = 1.0;
    }
    float _1504 = _1502;
    float _1506 = fma(_1336, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1492);
    float _1508 = fma(_1498, -2.0, 3.0);
    float _1510 = _1498 * _1498;
    float _1512 = _1450 * _599;
    float _1514 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1516 = _1504;
    if (_1200)
    {
        float _1518 = _1494 * _1478;
        float _1520 = precise::clamp(_1518, 0.0, 1.0);
        _1516 = _1520;
    }
    float _1522 = _1516;
    float _1524 = _1450 * _695;
    float _1526 = _1510 * _1508;
    bool _1528 = !_1252;
    float _1530 = _1528 ? _459 : as_type<float>(_1292);
    float _1532 = fma(_1490, _699, _1512);
    float _1534 = fma(_1490, _601, _1524);
    float _1536 = -_1526;
    float _1538 = _1536 + 1.0;
    float _1540 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1542 = in.m_79.x;
    bool _1544 = _1348 <= 8000.0;
    bool _1546 = isnan(_1348);
    bool _1548 = _1544 || _1546;
    bool _1550 = isnan(8000.0);
    bool _1552 = _1548 || _1550;
    float _1554 = float(_1552);
    float _1556 = -_1530;
    float _1558 = _1556 + 0.5;
    float _1560 = fma(_1538, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1526);
    float _1562 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1312);
    float _1564 = -_1418;
    float _1566 = _1564 + 1.0;
    float _1568 = _1558 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1570 = _1554 * _1560;
    float _1572 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _1574 = _1562 + _1572;
    float _1576 = _1450 * _613;
    float _1578 = _1568 * _1514;
    float _1580 = _1570 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1582 = _1119 + _1574;
    float _1584 = fma(_1438, _611, _1534);
    float _1586 = _1566 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1588 = _1500 * _1540;
    float _1590 = _1582 * 0.5;
    float _1592 = fma(_1490, _607, _1576);
    float _1594 = fma(_1438, _603, _1532);
    out.m_81.x = _1588;
    out.m_81.y = _1578;
    float _1596 = fma(_1438, _701, _1592);
    bool _1598 = _853 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1600 = isnan(_853);
    bool _1602 = _1598 || _1600;
    bool _1604 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1606 = _1602 || _1604;
    out.m_83.z = _1590;
    out.m_83.w = _1119;
    float _1608 = _1506 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1610 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1612 = _1522 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_85.x = _1594;
    out.m_85.y = _1584;
    out.m_85.z = _1596;
    float _1614 = _1610 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.gl_Position.x = _1121;
    out.gl_Position.y = _1137;
    out.gl_Position.z = _1574;
    out.gl_Position.w = _1119;
    float _1616 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1618 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1620 = _1616 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1622 = _1618 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_87.x = _1620;
    out.m_87.y = _1622;
    out.m_87.z = _1614;
    out.m_87.w = _1608;
    float _1624 = _1574;
    float _1626 = _1620;
    float _1628 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    if (!_1606)
    {
        _1302 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1630 = _1302;
    float _1632 = _1630;
    float _1634 = _1630;
    if (!_1606)
    {
        _1624 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1636 = _1624;
    float _1638 = _1636;
    float _1640 = _1636;
    if (!_1606)
    {
        _1304 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1642 = _1304;
    float _1644 = _1642;
    float _1646 = _1642;
    if (!_1606)
    {
        _1306 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1648 = _1306;
    float _1650 = _1648;
    float _1652 = _1648;
    if (!_1606)
    {
        _1626 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1654 = _1626;
    float _1656 = -_1139;
    float _1658 = _1656 + 1.0;
    float _1660 = _1658 * _1580;
    float _1662 = precise::clamp(_1660, 0.0, 1.0);
    float _1664 = -_1662;
    float _1666 = fma(_1664, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1668 = _1654;
    float _1670 = _1654;
    if (!_1606)
    {
        _1628 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1672 = _1628;
    float _1674 = _1666 * _1542;
    float _1676 = _1674 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_89.x = _1676;
    float _1678 = _1586 * _1159;
    float _1680 = -_1586;
    float _1682 = _1680 + 1.0;
    float _1684 = _1170 * _1678;
    float _1686 = _1180 * _1678;
    float _1688 = _1170 * _1682;
    float _1690 = fma(_1176, _1684, _1164);
    float _1692 = fma(_1178, _1684, _1166);
    float _1694 = fma(_1170, _1686, _1168);
    out.m_91.x = _1690;
    out.m_91.y = _1692;
    out.m_91.z = _1694;
    out.m_91.w = _1688;
    bool _1696 = !_1606;
    float _1698 = _1672;
    float _1700 = _1672;
    if (!_1696)
    {
        bool _1702 = _853 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1704 = isnan(_853);
        bool _1706 = _1702 || _1704;
        bool _1708 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1710 = _1706 || _1708;
        if (!_1710)
        {
            float _1712 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1714 = _853 + _1712;
            float _1716 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1718 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1716;
            float _1720 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1722 = _1720 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1724 = 1.0 / _1718;
            float _1726 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1728 = _1726 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1730 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1732 = _1730 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1734 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1736 = _1734 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1738 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1740 = _1738 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1742 = _1714 * _1724;
            float _1744 = precise::clamp(_1742, 0.0, 1.0);
            float _1746 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1748 = _1746 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1750 = fma(_1744, _1722, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1752 = fma(_1744, _1748, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1754 = fma(_1744, _1728, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1756 = fma(_1744, _1732, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1758 = fma(_1744, _1736, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1760 = fma(_1744, _1740, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1634 = _1754;
            _1652 = _1758;
            _1670 = _1750;
            _1646 = _1756;
            _1640 = _1752;
            _1700 = _1760;
            _1762 = true;
        }
        else
        {
            bool _1764 = _853 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1766 = isnan(_853);
            bool _1768 = _1764 || _1766;
            bool _1770 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1772 = _1768 || _1770;
            if (!_1772)
            {
                _1668 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1774 = _1668;
            _1670 = _1774;
            if (!_1772)
            {
                _1632 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1776 = _1632;
            _1634 = _1776;
            if (!_1772)
            {
                _1638 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1778 = _1638;
            _1640 = _1778;
            if (!_1772)
            {
                _1644 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1780 = _1644;
            _1646 = _1780;
            if (!_1772)
            {
                _1650 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1782 = _1650;
            _1652 = _1782;
            if (!_1772)
            {
                _1698 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1784 = _1698;
            bool _1786 = !_1772;
            _1700 = _1784;
            if (!_1786)
            {
                bool _1788 = _853 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1790 = isnan(_853);
                bool _1792 = _1788 || _1790;
                bool _1794 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1796 = _1792 || _1794;
                if (!_1796)
                {
                    float _1798 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1800 = _853 + _1798;
                    float _1802 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1804 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1802;
                    float _1806 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1808 = _1806 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1810 = 1.0 / _1804;
                    float _1812 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1814 = _1812 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1816 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1818 = _1816 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1820 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1822 = _1820 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1824 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1826 = _1824 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1828 = _1800 * _1810;
                    float _1830 = precise::clamp(_1828, 0.0, 1.0);
                    float _1832 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1834 = _1832 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1836 = fma(_1830, _1808, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1838 = fma(_1830, _1834, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1840 = fma(_1830, _1814, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1842 = fma(_1830, _1818, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1844 = fma(_1830, _1822, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1846 = fma(_1830, _1826, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1634 = _1840;
                    _1652 = _1844;
                    _1670 = _1836;
                    _1646 = _1842;
                    _1640 = _1838;
                    _1700 = _1846;
                    _1762 = true;
                }
                else
                {
                    _1634 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1652 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1670 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1646 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1640 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1700 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1762 = false;
    float _1848 = _1634;
    float _1850 = _1652;
    float _1852 = _1670;
    float _1854 = _1646;
    float _1856 = _1640;
    float _1858 = _1700;
    float _1860 = fma(_1584, -0.5, 0.5);
    float _1862 = precise::clamp(_1860, 0.0, 1.0);
    float _1864 = -_1848;
    float _1866 = _1864 + _1850;
    float _1868 = -_1852;
    float _1870 = _1868 + _1854;
    float _1872 = -_1856;
    float _1874 = _1872 + _1858;
    bool _1876 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1878 = fma(_1862, _1866, _1848);
    float _1880 = fma(_1862, _1870, _1852);
    float _1882 = fma(_1862, _1874, _1856);
    float _1884 = _1612 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1886 = _1878 * 0.586610972881317138671875;
    out.m_93.x = 0.0;
    float _1888 = fma(_1880, 0.298911988735198974609375, _1886);
    out.m_89.w = _1884;
    float _1890 = fma(_1882, 0.114477999508380889892578125, _1888);
    out.m_56.x = 1.0;
    float _1892 = -_1890;
    float _1894 = _1880 + _1892;
    float _1896 = -_1890;
    float _1898 = _1878 + _1896;
    float _1900 = -_1890;
    float _1902 = _1882 + _1900;
    float _1904 = fma(_1894, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1890);
    float _1906 = fma(_1898, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1890);
    float _1908 = fma(_1902, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1890);
    out.m_95.x = 0.0;
    out.m_97.x = _1904;
    out.m_97.y = _1906;
    out.m_97.z = _1908;
    if (!_1876)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1910 = -_827;
    float _1912 = _1910 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1914 = -_829;
    float _1916 = _1914 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1918 = -_831;
    float _1920 = _1918 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1922 = _1912 * _1912;
    float _1924 = fma(_1916, _1916, _1922);
    float _1926 = fma(_1920, _1920, _1924);
    float _1928 = rsqrt(_1926);
    float _1930 = _1912 * _1928;
    float _1932 = _1916 * _1928;
    float _1934 = _1920 * _1928;
    float _1936 = sqrt(_1926);
    float _1938 = -_859;
    float _1940 = _1938 + _1930;
    float _1942 = -_855;
    float _1944 = _1942 + _1932;
    float _1946 = -_857;
    float _1948 = _1946 + _1934;
    float _1950 = _1940 * _1940;
    float _1952 = fma(_1944, _1944, _1950);
    float _1954 = fma(_1948, _1948, _1952);
    float _1956 = -_1936;
    float _1958 = _1956 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1960 = rsqrt(_1954);
    float _1962 = _1958 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1964 = precise::clamp(_1962, 0.0, 1.0);
    float _1966 = abs(_1964);
    float _1968 = log2(_1966);
    float _1970 = _1940 * _1960;
    float _1972 = _1944 * _1960;
    float _1974 = _1948 * _1960;
    float _1976 = _1584 * _1970;
    float _1978 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
    float _1980 = precise::clamp(_1978, 0.0, 1.0);
    float _1982 = _1584 * _1930;
    float _1984 = fma(_1594, _1972, _1976);
    float _1986 = _1980 * _1980;
    float _1988 = _1968 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1990 = fma(_1594, _1932, _1982);
    float _1992 = fma(_1596, _1974, _1984);
    float _1994 = precise::clamp(_1992, 0.0, 1.0);
    float _1996 = _1986 + (-1.0);
    float _1998 = fma(_1596, _1934, _1990);
    float _2000 = precise::clamp(_1998, 0.0, 1.0);
    float _2002 = _1994 * _1994;
    float _2004 = _1932 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2006 = exp2(_1988);
    float _2008 = fma(_2002, _1996, 1.0);
    float _2010 = -_1930;
    float _2012 = -_2004;
    float _2014 = fma(_2010, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2012);
    float _2016 = _2008 * _2008;
    float _2018 = -_1934;
    float _2020 = fma(_2018, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2014);
    float _2022 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2024 = _2020 + _2022;
    float _2026 = 1.0 / _2016;
    float _2028 = _2024 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2030 = precise::clamp(_2028, 0.0, 1.0);
    float _2032 = _2006 * _2030;
    float _2034 = _2000 * _2032;
    float _2036 = _2034 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2038 = _1986 * _2026;
    float _2040 = _2034 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2042 = _2034 * _2038;
    float _2044 = _2034 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    float _2046 = _2042 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2048 = _2042 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2050 = _2042 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_93.x = _2036;
    out.m_93.y = _2040;
    out.m_93.z = _2044;
    out.m_95.x = _2046;
    out.m_95.y = _2048;
    out.m_95.z = _2050;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1762 = false;
    bool _348 = false;
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
        float _2107 = as_type<float>(_132);
        out.gl_Position.z = _2107;
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
    float _152 = 0.0;
    if (_146)
    {
        float _154 = float(_116);
        _152 = _154;
    }
    float _156 = _152;
    bool _158 = _150 >= _156;
    bool _160 = !_146;
    bool _162 = _158 || _160;
    if (_162)
    {
        _126 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _164 = _126;
    if (_162)
    {
        out.m_56.x = 0.0;
    }
    if (_162)
    {
        float _166 = _164 * 5.0;
        _134 = as_type<int>(_166);
    }
    int _168 = _134;
    if (_162)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2175 = as_type<float>(_168);
        out.gl_Position.z = _2175;
    }
    if (_162)
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
    float _188 = _170 * _170;
    float _190 = _172 * _172;
    float _192 = _174 * _174;
    float _194 = fma(_176, _176, _188);
    float _196 = fma(_178, _178, _190);
    float _198 = fma(_180, _180, _192);
    float _200 = fma(_182, _182, _194);
    float _202 = fma(_184, _184, _196);
    float _204 = fma(_186, _186, _198);
    float _206 = sqrt(_200);
    float _208 = sqrt(_202);
    float _210 = sqrt(_204);
    bool _212 = _206 > 0.0;
    bool _214 = _208 > 0.0;
    float _216 = _208;
    if (_212)
    {
        float _218 = rsqrt(_200);
        _216 = _218;
    }
    float _220 = _216;
    float _222 = 0.0;
    if (!_212)
    {
        _222 = 0.0;
    }
    float _224 = _222;
    bool _226 = _210 > 0.0;
    float _228 = 0.0;
    float _230 = _224;
    if (!_212)
    {
        _228 = 0.0;
    }
    float _232 = _228;
    float _234 = 0.0;
    float _236 = _232;
    if (!_212)
    {
        _234 = 0.0;
    }
    float _238 = _234;
    float _240 = _210;
    float _242 = _238;
    if (_214)
    {
        float _244 = rsqrt(_202);
        _240 = _244;
    }
    float _246 = _240;
    float _248 = 0.0;
    if (!_214)
    {
        _248 = 0.0;
    }
    float _250 = _248;
    float _252 = 0.0;
    float _254 = _250;
    if (!_214)
    {
        _252 = 0.0;
    }
    float _256 = _252;
    float _258 = 0.0;
    float _260 = _256;
    if (!_214)
    {
        _258 = 0.0;
    }
    float _262 = _258;
    float _264 = _206;
    float _266 = _262;
    if (_226)
    {
        float _268 = rsqrt(_204);
        _264 = _268;
    }
    float _270 = _264;
    if (_212)
    {
        float _272 = _220 * _176;
        _230 = _272;
    }
    float _274 = _230;
    if (_212)
    {
        float _276 = _220 * _170;
        _236 = _276;
    }
    float _278 = _236;
    if (_212)
    {
        float _280 = _220 * _182;
        _242 = _280;
    }
    float _282 = _242;
    bool _284 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _286 = 0.0;
    if (!_226)
    {
        _286 = 0.0;
    }
    float _288 = _286;
    float _290 = 0.0;
    float _292 = _288;
    if (!_226)
    {
        _290 = 0.0;
    }
    float _294 = _290;
    float _296 = _294;
    if (_214)
    {
        float _298 = _246 * _178;
        _254 = _298;
    }
    float _300 = _254;
    float _302 = 0.0;
    if (!_226)
    {
        _302 = 0.0;
    }
    float _304 = _302;
    float _306 = _304;
    if (_214)
    {
        float _308 = _246 * _172;
        _260 = _308;
    }
    float _310 = _260;
    if (_214)
    {
        float _312 = _246 * _184;
        _266 = _312;
    }
    float _314 = _266;
    if (_226)
    {
        float _316 = _270 * _180;
        _292 = _316;
    }
    float _318 = _292;
    if (_226)
    {
        float _320 = _270 * _174;
        _296 = _320;
    }
    float _322 = _296;
    if (_226)
    {
        float _324 = _270 * _186;
        _306 = _324;
    }
    float _326 = _306;
    bool _328 = !_284;
    float _346;
    if (!_328)
    {
        float _330 = in.m_66.x;
        float _332 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _334 = _330 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _336 = fma(_334, (*spvDescriptorSet0.vp_c9)._m0[11].y, _150);
        float _338 = _336 * _332;
        float _340 = floor(_338);
        float _342 = -_340;
        float _344 = _338 + _342;
        _346 = _344;
        _348 = true;
    }
    else
    {
        float _350 = float(_116);
        float _352 = 1.0 / _350;
        float _354 = _150 * _352;
        _346 = _354;
    }
    _348 = false;
    float _356 = _346;
    float _358 = in.m_68.w;
    float _360 = in.m_53.x;
    float _362 = in.m_53.y;
    float _364 = in.m_53.z;
    float _366 = in.m_60.w;
    float _368 = in.m_62.w;
    float _370 = in.m_64.w;
    float _372 = as_type<float>(int(gl_VertexIndex));
    float _374 = trunc(_358);
    int _376 = int(_374);
    int _378 = _376 << 5;
    uint _381 = uint(int(uint(_378) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_381)];
    float _383 = as_type<float>(_dmw0.x);
    int _385 = _378 + 4;
    uint _387 = uint(int(uint(_385) >> uint(2)));
    float _389 = as_type<float>(_dmw0.y);
    int _391 = _378 + 8;
    uint _393 = uint(int(uint(_391) >> uint(2)));
    float _395 = as_type<float>(_dmw0.z);
    int _397 = _378 + 12;
    uint _399 = uint(int(uint(_397) >> uint(2)));
    float _401 = as_type<float>(_dmw0.w);
    float _403 = _172 * _362;
    float _405 = _178 * _362;
    float _407 = _184 * _362;
    int _409 = as_type<int>(_372) & 1;
    bool _411 = _409 != 0;
    int _413 = as_type<int>(_372) & 2;
    bool _415 = _413 != 0;
    float _417 = fma(_170, _360, _403);
    float _419 = fma(_176, _360, _405);
    float _421 = fma(_182, _360, _407);
    float _423 = fma(_174, _364, _417);
    float _425 = fma(_180, _364, _419);
    float _427 = fma(_186, _364, _421);
    float _429 = _423 + _366;
    float _431 = _425 + _368;
    float _433 = _427 + _370;
    float _435 = in.m_73.x;
    float _437 = in.m_73.y;
    float _439 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _441 = _429 + _439;
    float _443 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _445 = _431 + _443;
    float _447 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _449 = _433 + _447;
    bool _451 = !_411;
    float _453 = _451 ? (-0.5) : 0.5;
    float _455 = _441 * _441;
    bool _457 = !_415;
    float _459 = _457 ? (-0.5) : 0.5;
    float _461 = fma(_445, _445, _455);
    float _463 = fma(_449, _449, _461);
    float _465 = rsqrt(_463);
    float _467 = _441 * _465;
    float _469 = _445 * _465;
    float _471 = _449 * _465;
    float _473 = -_467;
    float _475 = fma(_473, (*spvDescriptorSet0.vp_c9)._m0[18].w, _441);
    float _477 = -_469;
    float _479 = fma(_477, (*spvDescriptorSet0.vp_c9)._m0[18].w, _445);
    float _481 = -_471;
    float _483 = fma(_481, (*spvDescriptorSet0.vp_c9)._m0[18].w, _449);
    float _485 = _475 * _475;
    float _487 = _437 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _489 = fma(_479, _479, _485);
    float _491 = fma(_483, _483, _489);
    float _493 = _435 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _495 = sqrt(_491);
    float _497 = _493 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _499 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _459);
    float _501 = _465 * _495;
    float _503 = _487 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _505 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _453);
    float _507 = _497 * _501;
    float _509 = _501 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _511 = _509 * 0.5;
    float _513 = _503 * _501;
    float _515 = _507 * _505;
    float _517 = _511 * _314;
    float _519 = _513 * _499;
    float _521 = _511 * _300;
    float _523 = _511 * _310;
    float _525 = fma(_515, _282, _517);
    float _527 = fma(_515, _274, _521);
    float _529 = -_519;
    float _531 = fma(_529, _326, _525);
    float _533 = -_519;
    float _535 = fma(_533, _318, _527);
    float _537 = _433 + _531;
    float _539 = _431 + _535;
    float _541 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _543 = _537 + _541;
    float _545 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _547 = _539 + _545;
    float _549 = _543 * _543;
    float _551 = fma(_547, _547, _549);
    float _553 = fma(_515, _278, _523);
    float _555 = sqrt(_551);
    float _557 = -_519;
    float _559 = fma(_557, _322, _553);
    float _561 = _429 + _559;
    bool _563 = _555 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _565 = _559;
    float _567 = _519;
    float _569 = _539;
    if (!_563)
    {
        _565 = _539;
    }
    float _571 = _565;
    float _573 = _571;
    if (!_563)
    {
        _567 = _537;
    }
    float _575 = _567;
    float _577 = _401 * 2.0;
    float _579 = _383 * 2.0;
    float _581 = _389 * 2.0;
    float _583 = _383 * _383;
    float _585 = _395 * _577;
    float _587 = _383 * _577;
    float _589 = _389 * _577;
    float _591 = _383;
    float _593 = _575;
    if (!_563)
    {
        _591 = _561;
    }
    float _595 = _591;
    float _597 = -_585;
    float _599 = fma(_389, _579, _597);
    float _601 = fma(_389, _579, _585);
    float _603 = fma(_395, _579, _589);
    float _605 = -_589;
    float _607 = fma(_395, _579, _605);
    float _609 = -_587;
    float _611 = fma(_395, _581, _609);
    float _613 = fma(_395, _581, _587);
    float _615 = _389 * _389;
    float _617 = _395 * _395;
    bool _619 = !_563;
    float _621 = _595;
    if (!_619)
    {
        float _623 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _625 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _627 = _555 + _625;
        float _629 = _561 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _631 = rsqrt(_551);
        float _633 = _627 * _623;
        float _635 = _633 * 0.15915493667125701904296875;
        float _637 = _635 * 6.283185482025146484375;
        float _639 = sin(_637);
        float _641 = _635 * 6.283185482025146484375;
        float _643 = cos(_641);
        float _645 = fma(_639, _629, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _647 = _631 * _645;
        float _649 = _643 + (-1.0);
        float _651 = fma(_547, _647, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _653 = fma(_543, _647, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _655 = _649 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _657 = fma(_561, _643, _655);
        _621 = _657;
        _573 = _651;
        _593 = _653;
        _569 = _635;
    }
    float _659 = _621;
    float _661 = _573;
    float _663 = _593;
    float _665 = _569;
    float _667 = -_429;
    float _669 = _667 + _659;
    float _671 = -_431;
    float _673 = _671 + _661;
    float _675 = fma(_583, -2.0, 1.0);
    float _677 = -_433;
    float _679 = _677 + _663;
    float _681 = _669 * _310;
    float _683 = _669 * _278;
    float _685 = _669 * _322;
    float _687 = fma(_615, -2.0, 1.0);
    float _689 = fma(_673, _300, _681);
    float _691 = fma(_673, _274, _683);
    float _693 = fma(_673, _318, _685);
    float _695 = fma(_617, -2.0, _675);
    float _697 = fma(_679, _314, _689);
    float _699 = fma(_617, -2.0, _687);
    float _701 = fma(_615, -2.0, _675);
    float _703 = fma(_679, _282, _691);
    float _705 = fma(_679, _326, _693);
    float _707 = _697 * _599;
    float _709 = _697 * _695;
    float _711 = _697 * _613;
    float _713 = fma(_703, _699, _707);
    float _715 = fma(_703, _601, _709);
    float _717 = fma(_703, _607, _711);
    bool _719 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _721 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _723 = _719 || _721;
    bool _725 = isnan(0.5);
    bool _727 = _723 || _725;
    float _729 = fma(_705, _603, _713);
    float _731 = fma(_705, _611, _715);
    float _733 = fma(_705, _701, _717);
    float _735 = _431 + _729;
    float _737 = _429 + _731;
    float _739 = _433 + _733;
    float _741 = -_467;
    float _743 = fma(_741, (*spvDescriptorSet0.vp_c9)._m0[18].w, _429);
    float _745 = -_469;
    float _747 = fma(_745, (*spvDescriptorSet0.vp_c9)._m0[18].w, _735);
    float _749 = -_467;
    float _751 = fma(_749, (*spvDescriptorSet0.vp_c9)._m0[18].w, _737);
    float _753 = -_471;
    float _755 = fma(_753, (*spvDescriptorSet0.vp_c9)._m0[18].w, _739);
    float _757 = -_469;
    float _759 = fma(_757, (*spvDescriptorSet0.vp_c9)._m0[18].w, _431);
    float _761 = -_471;
    float _763 = fma(_761, (*spvDescriptorSet0.vp_c9)._m0[18].w, _433);
    float _765 = _739;
    float _767 = _747;
    float _769 = _755;
    float _771 = _693;
    float _773 = _687;
    float _775 = _665;
    if (_727)
    {
        _765 = _747;
    }
    float _777 = _765;
    float _779 = _777;
    if (_727)
    {
        _767 = _751;
    }
    float _781 = _767;
    float _783 = _781;
    if (!_727)
    {
        float _785 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _787 = _743 + _785;
        float _789 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _791 = _759 + _789;
        float _793 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _795 = _787 * _787;
        float _797 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _799 = _763 + _797;
        float _801 = fma(_791, _791, _795);
        float _803 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _805 = fma(_799, _799, _801);
        float _807 = sqrt(_805);
        float _809 = 1.0 / _501;
        float _811 = precise::min(_807, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _813 = _811 * _793;
        float _815 = _803 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _817 = _813 * _809;
        float _819 = _815 * _817;
        float _821 = fma(_729, _819, _759);
        float _823 = fma(_731, _819, _743);
        float _825 = fma(_733, _819, _763);
        _783 = _823;
        _779 = _821;
        _769 = _825;
    }
    float _827 = _783;
    float _829 = _779;
    float _831 = _769;
    float _833 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _835 = _827 + _833;
    float _837 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _839 = _829 + _837;
    float _841 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _843 = _831 + _841;
    float _845 = _835 * _835;
    float _847 = fma(_839, _839, _845);
    float _849 = fma(_843, _843, _847);
    float _851 = rsqrt(_849);
    float _853 = sqrt(_849);
    float _855 = _839 * _851;
    float _857 = _843 * _851;
    float _859 = _835 * _851;
    float _861 = _855 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _863 = _857 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _865 = _861 * _861;
    float _867 = _863 * _863;
    float _869 = _865 + _867;
    float _871 = sqrt(_869);
    bool _873 = _871 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _875 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _877 = _871 + _875;
    float _879 = _731;
    float _881 = _877;
    float _883 = _861;
    float _885 = _863;
    if (_873)
    {
        float _887 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _879 = _887;
    }
    float _889 = _879;
    if (_873)
    {
        float _891 = rsqrt(_869);
        _771 = _891;
    }
    float _893 = _771;
    if (_873)
    {
        float _895 = _877 * _889;
        _881 = _895;
    }
    float _897 = _881;
    float _899 = _827 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_873)
    {
        float _901 = _897 * 0.15915493667125701904296875;
        _773 = _901;
    }
    float _903 = _773;
    float _905 = fma(_829, (*spvDescriptorSet0.vp_c8)._m0[3].x, _899);
    float _907 = _889;
    if (_873)
    {
        float _909 = _903 * 6.283185482025146484375;
        float _911 = sin(_909);
        _907 = _911;
    }
    float _913 = _907;
    float _915 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _917 = fma(_831, (*spvDescriptorSet0.vp_c8)._m0[3].z, _905);
    float _919 = precise::max(0.0, _915);
    float _921 = _733;
    float _923 = _915;
    float _925 = _919;
    if (_873)
    {
        float _927 = _903 * 6.283185482025146484375;
        float _929 = cos(_927);
        _921 = _929;
    }
    float _931 = _921;
    float _933 = _917 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _935 = -_859;
    float _937 = -_919;
    float _939 = fma(_935, (*spvDescriptorSet0.vp_c15)._m0[24].y, _937);
    if (_873)
    {
        float _941 = _939 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _923 = _941;
    }
    float _943 = _923;
    float _945 = _913;
    float _947 = _943;
    if (_873)
    {
        float _949 = fma(_913, _943, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _775 = _949;
    }
    float _951 = _775;
    float _953 = _951;
    if (!_873)
    {
        _945 = _939;
    }
    float _955 = _945;
    float _957 = _955;
    if (_873)
    {
        float _959 = _931 + (-1.0);
        _925 = _959;
    }
    float _961 = _925;
    float _963 = _961;
    if (_873)
    {
        float _965 = _893 * _951;
        _953 = _965;
    }
    float _967 = _953;
    if (_873)
    {
        float _969 = _961 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _947 = _969;
    }
    float _971 = _947;
    float _973 = _971;
    if (_873)
    {
        float _975 = _861 * _967;
        _883 = _975;
    }
    float _977 = _883;
    if (_873)
    {
        float _979 = _863 * _967;
        _885 = _979;
    }
    float _981 = _885;
    if (!_873)
    {
        _963 = _867;
    }
    float _983 = _963;
    float _985 = _983;
    if (_873)
    {
        float _987 = fma(_939, _931, _971);
        _957 = _987;
    }
    float _989 = _957;
    if (!_873)
    {
        _973 = _865;
    }
    float _991 = _973;
    float _993 = _991;
    if (_873)
    {
        float _995 = _977 * _977;
        _993 = _995;
    }
    float _997 = _993;
    float _999 = fma(_759, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (_873)
    {
        float _1001 = _981 * _981;
        _985 = _1001;
    }
    float _1003 = _985;
    float _1005 = fma(_989, _989, _997);
    float _1007 = _827 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1009 = floor(_999);
    float _1011 = _1005 + _1003;
    float _1013 = fma(_829, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1007);
    float _1015 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1017 = fma(_853, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1015);
    float _1019 = precise::clamp(_1017, 0.0, 1.0);
    float _1021 = _827 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1023 = fma(_831, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1013);
    float _1025 = -_1019;
    float _1027 = _1025 + 1.0;
    float _1029 = rsqrt(_1011);
    float _1031 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1033 = _1023 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1035 = fma(_763, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1037 = fma(_829, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1021);
    float _1039 = _1033 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1041 = -_1009;
    float _1043 = _999 + _1041;
    float _1045 = abs(_1027);
    float _1047 = log2(_1045);
    float _1049 = fma(_831, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1037);
    float _1051 = -_1039;
    float _1053 = fma(_1051, _1031, 1.0);
    float _1055 = _827 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1057 = _1049 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1059 = fma(_829, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1055);
    float _1061 = _1029 * _977;
    float _1063 = _1029 * _989;
    float _1065 = _1029 * _981;
    float _1067 = fma(_831, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1059);
    float _1069 = _1057 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1071 = _1061 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1073 = floor(_1035);
    float _1075 = _1067 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1077 = _1047 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1079 = -_1071;
    float _1081 = fma(_1063, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1079);
    float _1083 = _1057 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1085 = fma(_1075, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1069);
    float _1087 = _1063 + 1.0;
    float _1089 = -_1065;
    float _1091 = fma(_1089, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1081);
    float _1093 = log2(_1053);
    float _1095 = _1057 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1097 = fma(_1075, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1083);
    float _1099 = fma(_1091, -0.5, 0.5);
    float _1101 = fma(_1091, 0.5, 0.5);
    float _1103 = fma(_1075, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1095);
    float _1105 = fma(_1033, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1097);
    float _1107 = exp2(_1077);
    float _1109 = fma(_1033, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1085);
    float _1111 = -_1073;
    float _1113 = _1035 + _1111;
    float _1115 = fma(_1101, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1117 = fma(_1033, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1103);
    float _1119 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1109);
    float _1121 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1105);
    float _1123 = fma(_1101, _1115, -0.212114393711090087890625);
    float _1125 = sqrt(_1099);
    float _1127 = fma(_1101, _1123, 1.570728778839111328125);
    float _1129 = _1093 * 0.693147182464599609375;
    float _1131 = 1.0 / _1119;
    float _1133 = -_1063;
    float _1135 = fma(_1107, _1087, _1133);
    float _1137 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1117);
    float2 _3699 = float2(_1043, _1113);
    float _1139 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3699, float2(0.0), isnan(_3699)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3699, float2(0.0), isnan(_3699)), level(0.0)).x;
    float _1141 = _1129 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1143 = fma(_1135, 0.5, 0.5);
    float _1145 = _1125 * 0.636619746685028076171875;
    float _1147 = -_1127;
    float _1149 = fma(_1145, _1147, 1.0);
    float _1151 = _1121 * _1131;
    float _1153 = _1137 * _1131;
    float _1155 = fma(_1151, 0.5, 0.5);
    float _1157 = fma(_1153, -0.5, 0.5);
    float3 _3734 = float3(_1155, _1157, _1141);
    float _1159 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3734, float3(0.0), isnan(_3734)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3734, float3(0.0), isnan(_3734)), level(0.0)).x;
    float3 _3745 = float3(_1155, _1157, _1141);
    float4 _1162 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3745, float3(0.0), isnan(_3745)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3745, float3(0.0), isnan(_3745)), level(0.0)).xyzw;
    float _1164 = _1162.x;
    float _1166 = _1162.y;
    float _1168 = _1162.z;
    float _1170 = _1162.w;
    float2 _3761 = float2(_1149, _1143);
    float3 _1174 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3761, float2(0.0), isnan(_3761)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3761, float2(0.0), isnan(_3761)), level(0.0)).xyz;
    float _1176 = _1174.x;
    float _1178 = _1174.y;
    float _1180 = _1174.z;
    float _1182 = _743 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1184 = in.m_66.x;
    float _1186 = in.m_66.y;
    float _1188 = _743 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1190 = fma(_759, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1182);
    bool _1192 = 0.0 != (*spvDescriptorSet0.vp_c11)._m0[20].z;
    bool _1194 = isnan(0.0);
    bool _1196 = _1192 || _1194;
    bool _1198 = isnan((*spvDescriptorSet0.vp_c11)._m0[20].z);
    bool _1200 = _1196 || _1198;
    float _1202 = fma(_759, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1188);
    float _1204 = fma(_763, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1190);
    float _1206 = _1047 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1208 = fma(_763, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1202);
    float _1210 = _1204 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1212 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1214 = _1212 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1216 = _1208 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1218 = 1.0 / _1210;
    float _1220 = _1216 + _1210;
    float _1222 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1224 = _1057 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_75.x = _829;
    out.m_75.y = _827;
    out.m_75.z = _831;
    float _1226 = 1.0 / _1214;
    bool _1228 = _1184 > 0.5;
    float _1230 = _1222 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1232 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.300000011920928955078125;
    bool _1234 = _1186 > 0.5;
    float _1236 = fma(_1075, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1224);
    int _1238 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1240 = _1238 != 0;
    float _1242 = _1220 * _1218;
    float _1244 = _1242 * 0.5;
    float _1246 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1248 = fma(_1232, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1246);
    int _1250 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1252 = _1250 != 0;
    float _1254 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1256 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1254);
    float _1258 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1260 = _1258 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1262 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1264 = fma(_1232, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1262);
    float _1266 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1268 = 1.0 / _1256;
    float _1270 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1272 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1274 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1272;
    float _1276 = _1266 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1278 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1280 = _1278 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1282 = _1270 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1284 = _1274 * _1226;
    float _1286 = 1.0 / _1260;
    float _1288 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _1264);
    out.m_77.x = _1276;
    out.m_77.y = _1282;
    out.m_77.z = _1230;
    float _1290 = -_459;
    int _1292 = _1234 ? as_type<int>(_1290) : as_type<int>(_459);
    float _1294 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1296 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1294;
    float _1298 = _433 + _1288;
    float _1300 = _1288;
    float _1302 = _1119;
    float _1304 = _1137;
    float _1306 = _1121;
    if (_1200)
    {
        float _1308 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.20000000298023223876953125;
        _1300 = _1308;
    }
    float _1310 = _1300;
    float _1312 = fma(_1033, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1236);
    float _1314 = 1.0 / _1280;
    float _1316 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1318 = _1316 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1320 = _453 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1322 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1324 = _356 + _1322;
    bool _1326 = _356 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1328 = isnan(_356);
    bool _1330 = _1326 || _1328;
    bool _1332 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1334 = _1330 || _1332;
    float _1336 = float(_1334);
    float _1338 = _1318 * _1286;
    float _1340 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1342 = _356 + _1340;
    float _1344 = fma(_1320, _282, _314);
    float _1346 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1348 = _1268 * _1346;
    float _1350 = fma(_1320, _278, _310);
    float _1352 = fma(_1284, _1324, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1354 = fma(_1338, _1342, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1356 = _1296 * _1314;
    float _1358 = abs(_1348);
    float _1360 = log2(_1358);
    bool _1362 = _356 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1364 = isnan(_356);
    bool _1366 = _1362 || _1364;
    bool _1368 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1370 = _1366 || _1368;
    float _1372 = float(_1370);
    float _1374 = -_1336;
    float _1376 = _1374 + 1.0;
    bool _1378 = _356 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1380 = isnan(_356);
    bool _1382 = _1378 || _1380;
    bool _1384 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1386 = _1382 || _1384;
    float _1388 = float(_1386);
    float _1390 = fma(_1320, _274, _300);
    bool _1392 = _356 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1394 = isnan(_356);
    bool _1396 = _1392 || _1394;
    bool _1398 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1400 = _1396 || _1398;
    float _1402 = float(_1400);
    float _1404 = _1372 * _1376;
    float _1406 = -_1372;
    float _1408 = _1406 + 1.0;
    float _1410 = -_1388;
    float _1412 = _1410 + 1.0;
    float _1414 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1416 = _356 + _1414;
    float _1418 = exp2(_1206);
    float _1420 = _1388 * _1408;
    float _1422 = _1402 * _1412;
    float _1424 = _459 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1426 = fma(_1356, _1416, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1428 = -_453;
    int _1430 = _1228 ? as_type<int>(_1428) : as_type<int>(_453);
    float _1432 = _1360 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1434 = _1352 * _1422;
    float _1436 = -_1424;
    float _1438 = fma(_1436, _326, _1344);
    float _1440 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _1248);
    float _1442 = _1344;
    if (_1200)
    {
        float _1444 = precise::min(_1310, 20.0);
        _1442 = _1444;
    }
    float _1446 = _1442;
    float _1448 = -_1424;
    float _1450 = fma(_1448, _322, _1350);
    float _1452 = exp2(_1432);
    float _1454 = _431 + _1440;
    float _1456 = -_1402;
    float _1458 = _1456 + 1.0;
    float _1460 = -_1298;
    float _1462 = _1460 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    bool _1464 = !_1240;
    float _1466 = _1464 ? _453 : as_type<float>(_1430);
    float _1468 = -_1454;
    float _1470 = _1468 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _1472 = fma(_1458, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1434);
    float _1474 = _1446;
    if (_1200)
    {
        float _1476 = 1.0 / _1446;
        _1474 = _1476;
    }
    float _1478 = _1474;
    float _1480 = precise::min(_1298, _1462);
    float _1482 = fma(_1354, _1420, _1472);
    float _1484 = precise::min(_1454, _1470);
    float _1486 = _1466 + 0.5;
    float _1488 = -_1424;
    float _1490 = fma(_1488, _318, _1390);
    float _1492 = fma(_1426, _1404, _1482);
    float _1494 = precise::min(_1484, _1480);
    float _1496 = fma(_1452, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1498 = precise::clamp(_1496, 0.0, 1.0);
    float _1500 = _1486 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1502 = _1486;
    if (!_1200)
    {
        _1502 = 1.0;
    }
    float _1504 = _1502;
    float _1506 = fma(_1336, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1492);
    float _1508 = fma(_1498, -2.0, 3.0);
    float _1510 = _1498 * _1498;
    float _1512 = _1450 * _599;
    float _1514 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1516 = _1504;
    if (_1200)
    {
        float _1518 = _1494 * _1478;
        float _1520 = precise::clamp(_1518, 0.0, 1.0);
        _1516 = _1520;
    }
    float _1522 = _1516;
    float _1524 = _1450 * _695;
    float _1526 = _1510 * _1508;
    bool _1528 = !_1252;
    float _1530 = _1528 ? _459 : as_type<float>(_1292);
    float _1532 = fma(_1490, _699, _1512);
    float _1534 = fma(_1490, _601, _1524);
    float _1536 = -_1526;
    float _1538 = _1536 + 1.0;
    float _1540 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1542 = in.m_79.x;
    bool _1544 = _1348 <= 8000.0;
    bool _1546 = isnan(_1348);
    bool _1548 = _1544 || _1546;
    bool _1550 = isnan(8000.0);
    bool _1552 = _1548 || _1550;
    float _1554 = float(_1552);
    float _1556 = -_1530;
    float _1558 = _1556 + 0.5;
    float _1560 = fma(_1538, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1526);
    float _1562 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1312);
    float _1564 = -_1418;
    float _1566 = _1564 + 1.0;
    float _1568 = _1558 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1570 = _1554 * _1560;
    float _1572 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _1574 = _1562 + _1572;
    float _1576 = _1450 * _613;
    float _1578 = _1568 * _1514;
    float _1580 = _1570 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1582 = _1119 + _1574;
    float _1584 = fma(_1438, _611, _1534);
    float _1586 = _1566 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1588 = _1500 * _1540;
    float _1590 = _1582 * 0.5;
    float _1592 = fma(_1490, _607, _1576);
    float _1594 = fma(_1438, _603, _1532);
    out.m_81.x = _1588;
    out.m_81.y = _1578;
    float _1596 = fma(_1438, _701, _1592);
    bool _1598 = _853 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1600 = isnan(_853);
    bool _1602 = _1598 || _1600;
    bool _1604 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1606 = _1602 || _1604;
    out.m_83.z = _1590;
    out.m_83.w = _1119;
    float _1608 = _1506 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1610 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1612 = _1522 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_85.x = _1594;
    out.m_85.y = _1584;
    out.m_85.z = _1596;
    float _1614 = _1610 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.gl_Position.x = _1121;
    out.gl_Position.y = _1137;
    out.gl_Position.z = _1574;
    out.gl_Position.w = _1119;
    float _1616 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1618 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1620 = _1616 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1622 = _1618 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_87.x = _1620;
    out.m_87.y = _1622;
    out.m_87.z = _1614;
    out.m_87.w = _1608;
    float _1624 = _1574;
    float _1626 = _1620;
    float _1628 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    if (!_1606)
    {
        _1302 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1630 = _1302;
    float _1632 = _1630;
    float _1634 = _1630;
    if (!_1606)
    {
        _1624 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1636 = _1624;
    float _1638 = _1636;
    float _1640 = _1636;
    if (!_1606)
    {
        _1304 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1642 = _1304;
    float _1644 = _1642;
    float _1646 = _1642;
    if (!_1606)
    {
        _1306 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1648 = _1306;
    float _1650 = _1648;
    float _1652 = _1648;
    if (!_1606)
    {
        _1626 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1654 = _1626;
    float _1656 = -_1139;
    float _1658 = _1656 + 1.0;
    float _1660 = _1658 * _1580;
    float _1662 = precise::clamp(_1660, 0.0, 1.0);
    float _1664 = -_1662;
    float _1666 = fma(_1664, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1668 = _1654;
    float _1670 = _1654;
    if (!_1606)
    {
        _1628 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1672 = _1628;
    float _1674 = _1666 * _1542;
    float _1676 = _1674 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_89.x = _1676;
    float _1678 = _1586 * _1159;
    float _1680 = -_1586;
    float _1682 = _1680 + 1.0;
    float _1684 = _1170 * _1678;
    float _1686 = _1180 * _1678;
    float _1688 = _1170 * _1682;
    float _1690 = fma(_1176, _1684, _1164);
    float _1692 = fma(_1178, _1684, _1166);
    float _1694 = fma(_1170, _1686, _1168);
    out.m_91.x = _1690;
    out.m_91.y = _1692;
    out.m_91.z = _1694;
    out.m_91.w = _1688;
    bool _1696 = !_1606;
    float _1698 = _1672;
    float _1700 = _1672;
    if (!_1696)
    {
        bool _1702 = _853 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1704 = isnan(_853);
        bool _1706 = _1702 || _1704;
        bool _1708 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1710 = _1706 || _1708;
        if (!_1710)
        {
            float _1712 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1714 = _853 + _1712;
            float _1716 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1718 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1716;
            float _1720 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1722 = _1720 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1724 = 1.0 / _1718;
            float _1726 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1728 = _1726 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1730 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1732 = _1730 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1734 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1736 = _1734 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1738 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1740 = _1738 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1742 = _1714 * _1724;
            float _1744 = precise::clamp(_1742, 0.0, 1.0);
            float _1746 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1748 = _1746 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1750 = fma(_1744, _1722, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1752 = fma(_1744, _1748, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1754 = fma(_1744, _1728, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1756 = fma(_1744, _1732, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1758 = fma(_1744, _1736, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1760 = fma(_1744, _1740, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1634 = _1754;
            _1652 = _1758;
            _1670 = _1750;
            _1646 = _1756;
            _1640 = _1752;
            _1700 = _1760;
            _1762 = true;
        }
        else
        {
            bool _1764 = _853 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1766 = isnan(_853);
            bool _1768 = _1764 || _1766;
            bool _1770 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1772 = _1768 || _1770;
            if (!_1772)
            {
                _1668 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1774 = _1668;
            _1670 = _1774;
            if (!_1772)
            {
                _1632 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1776 = _1632;
            _1634 = _1776;
            if (!_1772)
            {
                _1638 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1778 = _1638;
            _1640 = _1778;
            if (!_1772)
            {
                _1644 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1780 = _1644;
            _1646 = _1780;
            if (!_1772)
            {
                _1650 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1782 = _1650;
            _1652 = _1782;
            if (!_1772)
            {
                _1698 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1784 = _1698;
            bool _1786 = !_1772;
            _1700 = _1784;
            if (!_1786)
            {
                bool _1788 = _853 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1790 = isnan(_853);
                bool _1792 = _1788 || _1790;
                bool _1794 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1796 = _1792 || _1794;
                if (!_1796)
                {
                    float _1798 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1800 = _853 + _1798;
                    float _1802 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1804 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1802;
                    float _1806 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1808 = _1806 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1810 = 1.0 / _1804;
                    float _1812 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1814 = _1812 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1816 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1818 = _1816 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1820 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1822 = _1820 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1824 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1826 = _1824 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1828 = _1800 * _1810;
                    float _1830 = precise::clamp(_1828, 0.0, 1.0);
                    float _1832 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1834 = _1832 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1836 = fma(_1830, _1808, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1838 = fma(_1830, _1834, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1840 = fma(_1830, _1814, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1842 = fma(_1830, _1818, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1844 = fma(_1830, _1822, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1846 = fma(_1830, _1826, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1634 = _1840;
                    _1652 = _1844;
                    _1670 = _1836;
                    _1646 = _1842;
                    _1640 = _1838;
                    _1700 = _1846;
                    _1762 = true;
                }
                else
                {
                    _1634 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1652 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1670 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1646 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1640 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1700 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1762 = false;
    float _1848 = _1634;
    float _1850 = _1652;
    float _1852 = _1670;
    float _1854 = _1646;
    float _1856 = _1640;
    float _1858 = _1700;
    float _1860 = fma(_1584, -0.5, 0.5);
    float _1862 = precise::clamp(_1860, 0.0, 1.0);
    float _1864 = -_1848;
    float _1866 = _1864 + _1850;
    float _1868 = -_1852;
    float _1870 = _1868 + _1854;
    float _1872 = -_1856;
    float _1874 = _1872 + _1858;
    bool _1876 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1878 = fma(_1862, _1866, _1848);
    float _1880 = fma(_1862, _1870, _1852);
    float _1882 = fma(_1862, _1874, _1856);
    float _1884 = _1612 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1886 = _1878 * 0.586610972881317138671875;
    out.m_93.x = 0.0;
    float _1888 = fma(_1880, 0.298911988735198974609375, _1886);
    out.m_89.w = _1884;
    float _1890 = fma(_1882, 0.114477999508380889892578125, _1888);
    out.m_56.x = 1.0;
    float _1892 = -_1890;
    float _1894 = _1880 + _1892;
    float _1896 = -_1890;
    float _1898 = _1878 + _1896;
    float _1900 = -_1890;
    float _1902 = _1882 + _1900;
    float _1904 = fma(_1894, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1890);
    float _1906 = fma(_1898, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1890);
    float _1908 = fma(_1902, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1890);
    out.m_95.x = 0.0;
    out.m_97.x = _1904;
    out.m_97.y = _1906;
    out.m_97.z = _1908;
    if (!_1876)
    {
        return out;
    }
    float _1910 = -_827;
    float _1912 = _1910 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1914 = -_829;
    float _1916 = _1914 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1918 = -_831;
    float _1920 = _1918 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1922 = _1912 * _1912;
    float _1924 = fma(_1916, _1916, _1922);
    float _1926 = fma(_1920, _1920, _1924);
    float _1928 = rsqrt(_1926);
    float _1930 = _1912 * _1928;
    float _1932 = _1916 * _1928;
    float _1934 = _1920 * _1928;
    float _1936 = sqrt(_1926);
    float _1938 = -_859;
    float _1940 = _1938 + _1930;
    float _1942 = -_855;
    float _1944 = _1942 + _1932;
    float _1946 = -_857;
    float _1948 = _1946 + _1934;
    float _1950 = _1940 * _1940;
    float _1952 = fma(_1944, _1944, _1950);
    float _1954 = fma(_1948, _1948, _1952);
    float _1956 = -_1936;
    float _1958 = _1956 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1960 = rsqrt(_1954);
    float _1962 = _1958 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1964 = precise::clamp(_1962, 0.0, 1.0);
    float _1966 = abs(_1964);
    float _1968 = log2(_1966);
    float _1970 = _1940 * _1960;
    float _1972 = _1944 * _1960;
    float _1974 = _1948 * _1960;
    float _1976 = _1584 * _1970;
    float _1978 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
    float _1980 = precise::clamp(_1978, 0.0, 1.0);
    float _1982 = _1584 * _1930;
    float _1984 = fma(_1594, _1972, _1976);
    float _1986 = _1980 * _1980;
    float _1988 = _1968 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1990 = fma(_1594, _1932, _1982);
    float _1992 = fma(_1596, _1974, _1984);
    float _1994 = precise::clamp(_1992, 0.0, 1.0);
    float _1996 = _1986 + (-1.0);
    float _1998 = fma(_1596, _1934, _1990);
    float _2000 = precise::clamp(_1998, 0.0, 1.0);
    float _2002 = _1994 * _1994;
    float _2004 = _1932 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2006 = exp2(_1988);
    float _2008 = fma(_2002, _1996, 1.0);
    float _2010 = -_1930;
    float _2012 = -_2004;
    float _2014 = fma(_2010, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2012);
    float _2016 = _2008 * _2008;
    float _2018 = -_1934;
    float _2020 = fma(_2018, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2014);
    float _2022 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2024 = _2020 + _2022;
    float _2026 = 1.0 / _2016;
    float _2028 = _2024 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2030 = precise::clamp(_2028, 0.0, 1.0);
    float _2032 = _2006 * _2030;
    float _2034 = _2000 * _2032;
    float _2036 = _2034 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2038 = _1986 * _2026;
    float _2040 = _2034 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2042 = _2034 * _2038;
    float _2044 = _2034 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    float _2046 = _2042 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2048 = _2042 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2050 = _2042 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_93.x = _2036;
    out.m_93.y = _2040;
    out.m_93.z = _2044;
    out.m_95.x = _2046;
    out.m_95.y = _2048;
    out.m_95.z = _2050;
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
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1762 = false;
    bool _348 = false;
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
        float _2107 = as_type<float>(_132);
        out.gl_Position.z = _2107;
    }
    if (!_120)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _136 = in.m_58.w;
    bool _138 = _136 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _140 = isnan(_136);
    bool _142 = _138 || _140;
    bool _144 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _146 = _142 || _144;
    float _148 = -_136;
    float _150 = _148 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _152 = 0.0;
    if (_146)
    {
        float _154 = float(_116);
        _152 = _154;
    }
    float _156 = _152;
    bool _158 = _150 >= _156;
    bool _160 = !_146;
    bool _162 = _158 || _160;
    if (_162)
    {
        _126 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _164 = _126;
    if (_162)
    {
        out.m_56.x = 0.0;
    }
    if (_162)
    {
        float _166 = _164 * 5.0;
        _134 = as_type<int>(_166);
    }
    int _168 = _134;
    if (_162)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2175 = as_type<float>(_168);
        out.gl_Position.z = _2175;
    }
    if (_162)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    float _188 = _170 * _170;
    float _190 = _172 * _172;
    float _192 = _174 * _174;
    float _194 = fma(_176, _176, _188);
    float _196 = fma(_178, _178, _190);
    float _198 = fma(_180, _180, _192);
    float _200 = fma(_182, _182, _194);
    float _202 = fma(_184, _184, _196);
    float _204 = fma(_186, _186, _198);
    float _206 = sqrt(_200);
    float _208 = sqrt(_202);
    float _210 = sqrt(_204);
    bool _212 = _206 > 0.0;
    bool _214 = _208 > 0.0;
    float _216 = _208;
    if (_212)
    {
        float _218 = rsqrt(_200);
        _216 = _218;
    }
    float _220 = _216;
    float _222 = 0.0;
    if (!_212)
    {
        _222 = 0.0;
    }
    float _224 = _222;
    bool _226 = _210 > 0.0;
    float _228 = 0.0;
    float _230 = _224;
    if (!_212)
    {
        _228 = 0.0;
    }
    float _232 = _228;
    float _234 = 0.0;
    float _236 = _232;
    if (!_212)
    {
        _234 = 0.0;
    }
    float _238 = _234;
    float _240 = _210;
    float _242 = _238;
    if (_214)
    {
        float _244 = rsqrt(_202);
        _240 = _244;
    }
    float _246 = _240;
    float _248 = 0.0;
    if (!_214)
    {
        _248 = 0.0;
    }
    float _250 = _248;
    float _252 = 0.0;
    float _254 = _250;
    if (!_214)
    {
        _252 = 0.0;
    }
    float _256 = _252;
    float _258 = 0.0;
    float _260 = _256;
    if (!_214)
    {
        _258 = 0.0;
    }
    float _262 = _258;
    float _264 = _206;
    float _266 = _262;
    if (_226)
    {
        float _268 = rsqrt(_204);
        _264 = _268;
    }
    float _270 = _264;
    if (_212)
    {
        float _272 = _220 * _176;
        _230 = _272;
    }
    float _274 = _230;
    if (_212)
    {
        float _276 = _220 * _170;
        _236 = _276;
    }
    float _278 = _236;
    if (_212)
    {
        float _280 = _220 * _182;
        _242 = _280;
    }
    float _282 = _242;
    bool _284 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _286 = 0.0;
    if (!_226)
    {
        _286 = 0.0;
    }
    float _288 = _286;
    float _290 = 0.0;
    float _292 = _288;
    if (!_226)
    {
        _290 = 0.0;
    }
    float _294 = _290;
    float _296 = _294;
    if (_214)
    {
        float _298 = _246 * _178;
        _254 = _298;
    }
    float _300 = _254;
    float _302 = 0.0;
    if (!_226)
    {
        _302 = 0.0;
    }
    float _304 = _302;
    float _306 = _304;
    if (_214)
    {
        float _308 = _246 * _172;
        _260 = _308;
    }
    float _310 = _260;
    if (_214)
    {
        float _312 = _246 * _184;
        _266 = _312;
    }
    float _314 = _266;
    if (_226)
    {
        float _316 = _270 * _180;
        _292 = _316;
    }
    float _318 = _292;
    if (_226)
    {
        float _320 = _270 * _174;
        _296 = _320;
    }
    float _322 = _296;
    if (_226)
    {
        float _324 = _270 * _186;
        _306 = _324;
    }
    float _326 = _306;
    bool _328 = !_284;
    float _346;
    if (!_328)
    {
        float _330 = in.m_66.x;
        float _332 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _334 = _330 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _336 = fma(_334, (*spvDescriptorSet0.vp_c9)._m0[11].y, _150);
        float _338 = _336 * _332;
        float _340 = floor(_338);
        float _342 = -_340;
        float _344 = _338 + _342;
        _346 = _344;
        _348 = true;
    }
    else
    {
        float _350 = float(_116);
        float _352 = 1.0 / _350;
        float _354 = _150 * _352;
        _346 = _354;
    }
    _348 = false;
    float _356 = _346;
    float _358 = in.m_68.w;
    float _360 = in.m_53.x;
    float _362 = in.m_53.y;
    float _364 = in.m_53.z;
    float _366 = in.m_60.w;
    float _368 = in.m_62.w;
    float _370 = in.m_64.w;
    float _372 = as_type<float>(int(gl_VertexIndex));
    float _374 = trunc(_358);
    int _376 = int(_374);
    int _378 = _376 << 5;
    uint _381 = uint(int(uint(_378) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_381)];
    float _383 = as_type<float>(_dmw0.x);
    int _385 = _378 + 4;
    uint _387 = uint(int(uint(_385) >> uint(2)));
    float _389 = as_type<float>(_dmw0.y);
    int _391 = _378 + 8;
    uint _393 = uint(int(uint(_391) >> uint(2)));
    float _395 = as_type<float>(_dmw0.z);
    int _397 = _378 + 12;
    uint _399 = uint(int(uint(_397) >> uint(2)));
    float _401 = as_type<float>(_dmw0.w);
    float _403 = _172 * _362;
    float _405 = _178 * _362;
    float _407 = _184 * _362;
    int _409 = as_type<int>(_372) & 1;
    bool _411 = _409 != 0;
    int _413 = as_type<int>(_372) & 2;
    bool _415 = _413 != 0;
    float _417 = fma(_170, _360, _403);
    float _419 = fma(_176, _360, _405);
    float _421 = fma(_182, _360, _407);
    float _423 = fma(_174, _364, _417);
    float _425 = fma(_180, _364, _419);
    float _427 = fma(_186, _364, _421);
    float _429 = _423 + _366;
    float _431 = _425 + _368;
    float _433 = _427 + _370;
    float _435 = in.m_73.x;
    float _437 = in.m_73.y;
    float _439 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _441 = _429 + _439;
    float _443 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _445 = _431 + _443;
    float _447 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _449 = _433 + _447;
    bool _451 = !_411;
    float _453 = _451 ? (-0.5) : 0.5;
    float _455 = _441 * _441;
    bool _457 = !_415;
    float _459 = _457 ? (-0.5) : 0.5;
    float _461 = fma(_445, _445, _455);
    float _463 = fma(_449, _449, _461);
    float _465 = rsqrt(_463);
    float _467 = _441 * _465;
    float _469 = _445 * _465;
    float _471 = _449 * _465;
    float _473 = -_467;
    float _475 = fma(_473, (*spvDescriptorSet0.vp_c9)._m0[18].w, _441);
    float _477 = -_469;
    float _479 = fma(_477, (*spvDescriptorSet0.vp_c9)._m0[18].w, _445);
    float _481 = -_471;
    float _483 = fma(_481, (*spvDescriptorSet0.vp_c9)._m0[18].w, _449);
    float _485 = _475 * _475;
    float _487 = _437 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _489 = fma(_479, _479, _485);
    float _491 = fma(_483, _483, _489);
    float _493 = _435 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _495 = sqrt(_491);
    float _497 = _493 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _499 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _459);
    float _501 = _465 * _495;
    float _503 = _487 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _505 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _453);
    float _507 = _497 * _501;
    float _509 = _501 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _511 = _509 * 0.5;
    float _513 = _503 * _501;
    float _515 = _507 * _505;
    float _517 = _511 * _314;
    float _519 = _513 * _499;
    float _521 = _511 * _300;
    float _523 = _511 * _310;
    float _525 = fma(_515, _282, _517);
    float _527 = fma(_515, _274, _521);
    float _529 = -_519;
    float _531 = fma(_529, _326, _525);
    float _533 = -_519;
    float _535 = fma(_533, _318, _527);
    float _537 = _433 + _531;
    float _539 = _431 + _535;
    float _541 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _543 = _537 + _541;
    float _545 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _547 = _539 + _545;
    float _549 = _543 * _543;
    float _551 = fma(_547, _547, _549);
    float _553 = fma(_515, _278, _523);
    float _555 = sqrt(_551);
    float _557 = -_519;
    float _559 = fma(_557, _322, _553);
    float _561 = _429 + _559;
    bool _563 = _555 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _565 = _559;
    float _567 = _519;
    float _569 = _539;
    if (!_563)
    {
        _565 = _539;
    }
    float _571 = _565;
    float _573 = _571;
    if (!_563)
    {
        _567 = _537;
    }
    float _575 = _567;
    float _577 = _401 * 2.0;
    float _579 = _383 * 2.0;
    float _581 = _389 * 2.0;
    float _583 = _383 * _383;
    float _585 = _395 * _577;
    float _587 = _383 * _577;
    float _589 = _389 * _577;
    float _591 = _383;
    float _593 = _575;
    if (!_563)
    {
        _591 = _561;
    }
    float _595 = _591;
    float _597 = -_585;
    float _599 = fma(_389, _579, _597);
    float _601 = fma(_389, _579, _585);
    float _603 = fma(_395, _579, _589);
    float _605 = -_589;
    float _607 = fma(_395, _579, _605);
    float _609 = -_587;
    float _611 = fma(_395, _581, _609);
    float _613 = fma(_395, _581, _587);
    float _615 = _389 * _389;
    float _617 = _395 * _395;
    bool _619 = !_563;
    float _621 = _595;
    if (!_619)
    {
        float _623 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _625 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _627 = _555 + _625;
        float _629 = _561 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _631 = rsqrt(_551);
        float _633 = _627 * _623;
        float _635 = _633 * 0.15915493667125701904296875;
        float _637 = _635 * 6.283185482025146484375;
        float _639 = sin(_637);
        float _641 = _635 * 6.283185482025146484375;
        float _643 = cos(_641);
        float _645 = fma(_639, _629, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _647 = _631 * _645;
        float _649 = _643 + (-1.0);
        float _651 = fma(_547, _647, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _653 = fma(_543, _647, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _655 = _649 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _657 = fma(_561, _643, _655);
        _621 = _657;
        _573 = _651;
        _593 = _653;
        _569 = _635;
    }
    float _659 = _621;
    float _661 = _573;
    float _663 = _593;
    float _665 = _569;
    float _667 = -_429;
    float _669 = _667 + _659;
    float _671 = -_431;
    float _673 = _671 + _661;
    float _675 = fma(_583, -2.0, 1.0);
    float _677 = -_433;
    float _679 = _677 + _663;
    float _681 = _669 * _310;
    float _683 = _669 * _278;
    float _685 = _669 * _322;
    float _687 = fma(_615, -2.0, 1.0);
    float _689 = fma(_673, _300, _681);
    float _691 = fma(_673, _274, _683);
    float _693 = fma(_673, _318, _685);
    float _695 = fma(_617, -2.0, _675);
    float _697 = fma(_679, _314, _689);
    float _699 = fma(_617, -2.0, _687);
    float _701 = fma(_615, -2.0, _675);
    float _703 = fma(_679, _282, _691);
    float _705 = fma(_679, _326, _693);
    float _707 = _697 * _599;
    float _709 = _697 * _695;
    float _711 = _697 * _613;
    float _713 = fma(_703, _699, _707);
    float _715 = fma(_703, _601, _709);
    float _717 = fma(_703, _607, _711);
    bool _719 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _721 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _723 = _719 || _721;
    bool _725 = isnan(0.5);
    bool _727 = _723 || _725;
    float _729 = fma(_705, _603, _713);
    float _731 = fma(_705, _611, _715);
    float _733 = fma(_705, _701, _717);
    float _735 = _431 + _729;
    float _737 = _429 + _731;
    float _739 = _433 + _733;
    float _741 = -_467;
    float _743 = fma(_741, (*spvDescriptorSet0.vp_c9)._m0[18].w, _429);
    float _745 = -_469;
    float _747 = fma(_745, (*spvDescriptorSet0.vp_c9)._m0[18].w, _735);
    float _749 = -_467;
    float _751 = fma(_749, (*spvDescriptorSet0.vp_c9)._m0[18].w, _737);
    float _753 = -_471;
    float _755 = fma(_753, (*spvDescriptorSet0.vp_c9)._m0[18].w, _739);
    float _757 = -_469;
    float _759 = fma(_757, (*spvDescriptorSet0.vp_c9)._m0[18].w, _431);
    float _761 = -_471;
    float _763 = fma(_761, (*spvDescriptorSet0.vp_c9)._m0[18].w, _433);
    float _765 = _739;
    float _767 = _747;
    float _769 = _755;
    float _771 = _693;
    float _773 = _687;
    float _775 = _665;
    if (_727)
    {
        _765 = _747;
    }
    float _777 = _765;
    float _779 = _777;
    if (_727)
    {
        _767 = _751;
    }
    float _781 = _767;
    float _783 = _781;
    if (!_727)
    {
        float _785 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _787 = _743 + _785;
        float _789 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _791 = _759 + _789;
        float _793 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _795 = _787 * _787;
        float _797 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _799 = _763 + _797;
        float _801 = fma(_791, _791, _795);
        float _803 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _805 = fma(_799, _799, _801);
        float _807 = sqrt(_805);
        float _809 = 1.0 / _501;
        float _811 = precise::min(_807, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _813 = _811 * _793;
        float _815 = _803 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _817 = _813 * _809;
        float _819 = _815 * _817;
        float _821 = fma(_729, _819, _759);
        float _823 = fma(_731, _819, _743);
        float _825 = fma(_733, _819, _763);
        _783 = _823;
        _779 = _821;
        _769 = _825;
    }
    float _827 = _783;
    float _829 = _779;
    float _831 = _769;
    float _833 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _835 = _827 + _833;
    float _837 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _839 = _829 + _837;
    float _841 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _843 = _831 + _841;
    float _845 = _835 * _835;
    float _847 = fma(_839, _839, _845);
    float _849 = fma(_843, _843, _847);
    float _851 = rsqrt(_849);
    float _853 = sqrt(_849);
    float _855 = _839 * _851;
    float _857 = _843 * _851;
    float _859 = _835 * _851;
    float _861 = _855 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _863 = _857 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _865 = _861 * _861;
    float _867 = _863 * _863;
    float _869 = _865 + _867;
    float _871 = sqrt(_869);
    bool _873 = _871 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _875 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _877 = _871 + _875;
    float _879 = _731;
    float _881 = _877;
    float _883 = _861;
    float _885 = _863;
    if (_873)
    {
        float _887 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _879 = _887;
    }
    float _889 = _879;
    if (_873)
    {
        float _891 = rsqrt(_869);
        _771 = _891;
    }
    float _893 = _771;
    if (_873)
    {
        float _895 = _877 * _889;
        _881 = _895;
    }
    float _897 = _881;
    float _899 = _827 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_873)
    {
        float _901 = _897 * 0.15915493667125701904296875;
        _773 = _901;
    }
    float _903 = _773;
    float _905 = fma(_829, (*spvDescriptorSet0.vp_c8)._m0[3].x, _899);
    float _907 = _889;
    if (_873)
    {
        float _909 = _903 * 6.283185482025146484375;
        float _911 = sin(_909);
        _907 = _911;
    }
    float _913 = _907;
    float _915 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _917 = fma(_831, (*spvDescriptorSet0.vp_c8)._m0[3].z, _905);
    float _919 = precise::max(0.0, _915);
    float _921 = _733;
    float _923 = _915;
    float _925 = _919;
    if (_873)
    {
        float _927 = _903 * 6.283185482025146484375;
        float _929 = cos(_927);
        _921 = _929;
    }
    float _931 = _921;
    float _933 = _917 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _935 = -_859;
    float _937 = -_919;
    float _939 = fma(_935, (*spvDescriptorSet0.vp_c15)._m0[24].y, _937);
    if (_873)
    {
        float _941 = _939 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _923 = _941;
    }
    float _943 = _923;
    float _945 = _913;
    float _947 = _943;
    if (_873)
    {
        float _949 = fma(_913, _943, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _775 = _949;
    }
    float _951 = _775;
    float _953 = _951;
    if (!_873)
    {
        _945 = _939;
    }
    float _955 = _945;
    float _957 = _955;
    if (_873)
    {
        float _959 = _931 + (-1.0);
        _925 = _959;
    }
    float _961 = _925;
    float _963 = _961;
    if (_873)
    {
        float _965 = _893 * _951;
        _953 = _965;
    }
    float _967 = _953;
    if (_873)
    {
        float _969 = _961 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _947 = _969;
    }
    float _971 = _947;
    float _973 = _971;
    if (_873)
    {
        float _975 = _861 * _967;
        _883 = _975;
    }
    float _977 = _883;
    if (_873)
    {
        float _979 = _863 * _967;
        _885 = _979;
    }
    float _981 = _885;
    if (!_873)
    {
        _963 = _867;
    }
    float _983 = _963;
    float _985 = _983;
    if (_873)
    {
        float _987 = fma(_939, _931, _971);
        _957 = _987;
    }
    float _989 = _957;
    if (!_873)
    {
        _973 = _865;
    }
    float _991 = _973;
    float _993 = _991;
    if (_873)
    {
        float _995 = _977 * _977;
        _993 = _995;
    }
    float _997 = _993;
    float _999 = fma(_759, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (_873)
    {
        float _1001 = _981 * _981;
        _985 = _1001;
    }
    float _1003 = _985;
    float _1005 = fma(_989, _989, _997);
    float _1007 = _827 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1009 = floor(_999);
    float _1011 = _1005 + _1003;
    float _1013 = fma(_829, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1007);
    float _1015 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1017 = fma(_853, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1015);
    float _1019 = precise::clamp(_1017, 0.0, 1.0);
    float _1021 = _827 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1023 = fma(_831, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1013);
    float _1025 = -_1019;
    float _1027 = _1025 + 1.0;
    float _1029 = rsqrt(_1011);
    float _1031 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1033 = _1023 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1035 = fma(_763, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1037 = fma(_829, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1021);
    float _1039 = _1033 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1041 = -_1009;
    float _1043 = _999 + _1041;
    float _1045 = abs(_1027);
    float _1047 = log2(_1045);
    float _1049 = fma(_831, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1037);
    float _1051 = -_1039;
    float _1053 = fma(_1051, _1031, 1.0);
    float _1055 = _827 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1057 = _1049 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1059 = fma(_829, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1055);
    float _1061 = _1029 * _977;
    float _1063 = _1029 * _989;
    float _1065 = _1029 * _981;
    float _1067 = fma(_831, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1059);
    float _1069 = _1057 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1071 = _1061 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1073 = floor(_1035);
    float _1075 = _1067 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1077 = _1047 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1079 = -_1071;
    float _1081 = fma(_1063, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1079);
    float _1083 = _1057 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1085 = fma(_1075, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1069);
    float _1087 = _1063 + 1.0;
    float _1089 = -_1065;
    float _1091 = fma(_1089, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1081);
    float _1093 = log2(_1053);
    float _1095 = _1057 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1097 = fma(_1075, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1083);
    float _1099 = fma(_1091, -0.5, 0.5);
    float _1101 = fma(_1091, 0.5, 0.5);
    float _1103 = fma(_1075, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1095);
    float _1105 = fma(_1033, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1097);
    float _1107 = exp2(_1077);
    float _1109 = fma(_1033, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1085);
    float _1111 = -_1073;
    float _1113 = _1035 + _1111;
    float _1115 = fma(_1101, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1117 = fma(_1033, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1103);
    float _1119 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1109);
    float _1121 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1105);
    float _1123 = fma(_1101, _1115, -0.212114393711090087890625);
    float _1125 = sqrt(_1099);
    float _1127 = fma(_1101, _1123, 1.570728778839111328125);
    float _1129 = _1093 * 0.693147182464599609375;
    float _1131 = 1.0 / _1119;
    float _1133 = -_1063;
    float _1135 = fma(_1107, _1087, _1133);
    float _1137 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1117);
    float2 _3699 = float2(_1043, _1113);
    float _1139 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3699, float2(0.0), isnan(_3699)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3699, float2(0.0), isnan(_3699)), level(0.0)).x;
    float _1141 = _1129 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1143 = fma(_1135, 0.5, 0.5);
    float _1145 = _1125 * 0.636619746685028076171875;
    float _1147 = -_1127;
    float _1149 = fma(_1145, _1147, 1.0);
    float _1151 = _1121 * _1131;
    float _1153 = _1137 * _1131;
    float _1155 = fma(_1151, 0.5, 0.5);
    float _1157 = fma(_1153, -0.5, 0.5);
    float3 _3734 = float3(_1155, _1157, _1141);
    float _1159 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3734, float3(0.0), isnan(_3734)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3734, float3(0.0), isnan(_3734)), level(0.0)).x;
    float3 _3745 = float3(_1155, _1157, _1141);
    float4 _1162 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3745, float3(0.0), isnan(_3745)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3745, float3(0.0), isnan(_3745)), level(0.0)).xyzw;
    float _1164 = _1162.x;
    float _1166 = _1162.y;
    float _1168 = _1162.z;
    float _1170 = _1162.w;
    float2 _3761 = float2(_1149, _1143);
    float3 _1174 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3761, float2(0.0), isnan(_3761)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3761, float2(0.0), isnan(_3761)), level(0.0)).xyz;
    float _1176 = _1174.x;
    float _1178 = _1174.y;
    float _1180 = _1174.z;
    float _1182 = _743 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1184 = in.m_66.x;
    float _1186 = in.m_66.y;
    float _1188 = _743 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1190 = fma(_759, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1182);
    bool _1192 = 0.0 != (*spvDescriptorSet0.vp_c11)._m0[20].z;
    bool _1194 = isnan(0.0);
    bool _1196 = _1192 || _1194;
    bool _1198 = isnan((*spvDescriptorSet0.vp_c11)._m0[20].z);
    bool _1200 = _1196 || _1198;
    float _1202 = fma(_759, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1188);
    float _1204 = fma(_763, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1190);
    float _1206 = _1047 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1208 = fma(_763, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1202);
    float _1210 = _1204 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1212 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1214 = _1212 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1216 = _1208 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1218 = 1.0 / _1210;
    float _1220 = _1216 + _1210;
    float _1222 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1224 = _1057 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_75.x = _829;
    out.m_75.y = _827;
    out.m_75.z = _831;
    float _1226 = 1.0 / _1214;
    bool _1228 = _1184 > 0.5;
    float _1230 = _1222 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1232 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.300000011920928955078125;
    bool _1234 = _1186 > 0.5;
    float _1236 = fma(_1075, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1224);
    int _1238 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1240 = _1238 != 0;
    float _1242 = _1220 * _1218;
    float _1244 = _1242 * 0.5;
    float _1246 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1248 = fma(_1232, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1246);
    int _1250 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1252 = _1250 != 0;
    float _1254 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1256 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1254);
    float _1258 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1260 = _1258 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1262 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1264 = fma(_1232, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1262);
    float _1266 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1268 = 1.0 / _1256;
    float _1270 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1272 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1274 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1272;
    float _1276 = _1266 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1278 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1280 = _1278 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1282 = _1270 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1284 = _1274 * _1226;
    float _1286 = 1.0 / _1260;
    float _1288 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _1264);
    out.m_77.x = _1276;
    out.m_77.y = _1282;
    out.m_77.z = _1230;
    float _1290 = -_459;
    int _1292 = _1234 ? as_type<int>(_1290) : as_type<int>(_459);
    float _1294 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1296 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1294;
    float _1298 = _433 + _1288;
    float _1300 = _1288;
    float _1302 = _1119;
    float _1304 = _1137;
    float _1306 = _1121;
    if (_1200)
    {
        float _1308 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.20000000298023223876953125;
        _1300 = _1308;
    }
    float _1310 = _1300;
    float _1312 = fma(_1033, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1236);
    float _1314 = 1.0 / _1280;
    float _1316 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1318 = _1316 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1320 = _453 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1322 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1324 = _356 + _1322;
    bool _1326 = _356 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1328 = isnan(_356);
    bool _1330 = _1326 || _1328;
    bool _1332 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1334 = _1330 || _1332;
    float _1336 = float(_1334);
    float _1338 = _1318 * _1286;
    float _1340 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1342 = _356 + _1340;
    float _1344 = fma(_1320, _282, _314);
    float _1346 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1348 = _1268 * _1346;
    float _1350 = fma(_1320, _278, _310);
    float _1352 = fma(_1284, _1324, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1354 = fma(_1338, _1342, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1356 = _1296 * _1314;
    float _1358 = abs(_1348);
    float _1360 = log2(_1358);
    bool _1362 = _356 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1364 = isnan(_356);
    bool _1366 = _1362 || _1364;
    bool _1368 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1370 = _1366 || _1368;
    float _1372 = float(_1370);
    float _1374 = -_1336;
    float _1376 = _1374 + 1.0;
    bool _1378 = _356 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1380 = isnan(_356);
    bool _1382 = _1378 || _1380;
    bool _1384 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1386 = _1382 || _1384;
    float _1388 = float(_1386);
    float _1390 = fma(_1320, _274, _300);
    bool _1392 = _356 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1394 = isnan(_356);
    bool _1396 = _1392 || _1394;
    bool _1398 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1400 = _1396 || _1398;
    float _1402 = float(_1400);
    float _1404 = _1372 * _1376;
    float _1406 = -_1372;
    float _1408 = _1406 + 1.0;
    float _1410 = -_1388;
    float _1412 = _1410 + 1.0;
    float _1414 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1416 = _356 + _1414;
    float _1418 = exp2(_1206);
    float _1420 = _1388 * _1408;
    float _1422 = _1402 * _1412;
    float _1424 = _459 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1426 = fma(_1356, _1416, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1428 = -_453;
    int _1430 = _1228 ? as_type<int>(_1428) : as_type<int>(_453);
    float _1432 = _1360 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1434 = _1352 * _1422;
    float _1436 = -_1424;
    float _1438 = fma(_1436, _326, _1344);
    float _1440 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _1248);
    float _1442 = _1344;
    if (_1200)
    {
        float _1444 = precise::min(_1310, 20.0);
        _1442 = _1444;
    }
    float _1446 = _1442;
    float _1448 = -_1424;
    float _1450 = fma(_1448, _322, _1350);
    float _1452 = exp2(_1432);
    float _1454 = _431 + _1440;
    float _1456 = -_1402;
    float _1458 = _1456 + 1.0;
    float _1460 = -_1298;
    float _1462 = _1460 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    bool _1464 = !_1240;
    float _1466 = _1464 ? _453 : as_type<float>(_1430);
    float _1468 = -_1454;
    float _1470 = _1468 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _1472 = fma(_1458, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1434);
    float _1474 = _1446;
    if (_1200)
    {
        float _1476 = 1.0 / _1446;
        _1474 = _1476;
    }
    float _1478 = _1474;
    float _1480 = precise::min(_1298, _1462);
    float _1482 = fma(_1354, _1420, _1472);
    float _1484 = precise::min(_1454, _1470);
    float _1486 = _1466 + 0.5;
    float _1488 = -_1424;
    float _1490 = fma(_1488, _318, _1390);
    float _1492 = fma(_1426, _1404, _1482);
    float _1494 = precise::min(_1484, _1480);
    float _1496 = fma(_1452, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1498 = precise::clamp(_1496, 0.0, 1.0);
    float _1500 = _1486 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1502 = _1486;
    if (!_1200)
    {
        _1502 = 1.0;
    }
    float _1504 = _1502;
    float _1506 = fma(_1336, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1492);
    float _1508 = fma(_1498, -2.0, 3.0);
    float _1510 = _1498 * _1498;
    float _1512 = _1450 * _599;
    float _1514 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1516 = _1504;
    if (_1200)
    {
        float _1518 = _1494 * _1478;
        float _1520 = precise::clamp(_1518, 0.0, 1.0);
        _1516 = _1520;
    }
    float _1522 = _1516;
    float _1524 = _1450 * _695;
    float _1526 = _1510 * _1508;
    bool _1528 = !_1252;
    float _1530 = _1528 ? _459 : as_type<float>(_1292);
    float _1532 = fma(_1490, _699, _1512);
    float _1534 = fma(_1490, _601, _1524);
    float _1536 = -_1526;
    float _1538 = _1536 + 1.0;
    float _1540 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1542 = in.m_79.x;
    bool _1544 = _1348 <= 8000.0;
    bool _1546 = isnan(_1348);
    bool _1548 = _1544 || _1546;
    bool _1550 = isnan(8000.0);
    bool _1552 = _1548 || _1550;
    float _1554 = float(_1552);
    float _1556 = -_1530;
    float _1558 = _1556 + 0.5;
    float _1560 = fma(_1538, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1526);
    float _1562 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1312);
    float _1564 = -_1418;
    float _1566 = _1564 + 1.0;
    float _1568 = _1558 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1570 = _1554 * _1560;
    float _1572 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _1574 = _1562 + _1572;
    float _1576 = _1450 * _613;
    float _1578 = _1568 * _1514;
    float _1580 = _1570 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1582 = _1119 + _1574;
    float _1584 = fma(_1438, _611, _1534);
    float _1586 = _1566 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1588 = _1500 * _1540;
    float _1590 = _1582 * 0.5;
    float _1592 = fma(_1490, _607, _1576);
    float _1594 = fma(_1438, _603, _1532);
    out.m_81.x = _1588;
    out.m_81.y = _1578;
    float _1596 = fma(_1438, _701, _1592);
    bool _1598 = _853 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1600 = isnan(_853);
    bool _1602 = _1598 || _1600;
    bool _1604 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1606 = _1602 || _1604;
    out.m_83.z = _1590;
    out.m_83.w = _1119;
    float _1608 = _1506 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1610 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1612 = _1522 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_85.x = _1594;
    out.m_85.y = _1584;
    out.m_85.z = _1596;
    float _1614 = _1610 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.gl_Position.x = _1121;
    out.gl_Position.y = _1137;
    out.gl_Position.z = _1574;
    out.gl_Position.w = _1119;
    float _1616 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1618 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1620 = _1616 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1622 = _1618 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_87.x = _1620;
    out.m_87.y = _1622;
    out.m_87.z = _1614;
    out.m_87.w = _1608;
    float _1624 = _1574;
    float _1626 = _1620;
    float _1628 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    if (!_1606)
    {
        _1302 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1630 = _1302;
    float _1632 = _1630;
    float _1634 = _1630;
    if (!_1606)
    {
        _1624 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1636 = _1624;
    float _1638 = _1636;
    float _1640 = _1636;
    if (!_1606)
    {
        _1304 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1642 = _1304;
    float _1644 = _1642;
    float _1646 = _1642;
    if (!_1606)
    {
        _1306 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1648 = _1306;
    float _1650 = _1648;
    float _1652 = _1648;
    if (!_1606)
    {
        _1626 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1654 = _1626;
    float _1656 = -_1139;
    float _1658 = _1656 + 1.0;
    float _1660 = _1658 * _1580;
    float _1662 = precise::clamp(_1660, 0.0, 1.0);
    float _1664 = -_1662;
    float _1666 = fma(_1664, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1668 = _1654;
    float _1670 = _1654;
    if (!_1606)
    {
        _1628 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1672 = _1628;
    float _1674 = _1666 * _1542;
    float _1676 = _1674 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_89.x = _1676;
    float _1678 = _1586 * _1159;
    float _1680 = -_1586;
    float _1682 = _1680 + 1.0;
    float _1684 = _1170 * _1678;
    float _1686 = _1180 * _1678;
    float _1688 = _1170 * _1682;
    float _1690 = fma(_1176, _1684, _1164);
    float _1692 = fma(_1178, _1684, _1166);
    float _1694 = fma(_1170, _1686, _1168);
    out.m_91.x = _1690;
    out.m_91.y = _1692;
    out.m_91.z = _1694;
    out.m_91.w = _1688;
    bool _1696 = !_1606;
    float _1698 = _1672;
    float _1700 = _1672;
    if (!_1696)
    {
        bool _1702 = _853 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1704 = isnan(_853);
        bool _1706 = _1702 || _1704;
        bool _1708 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1710 = _1706 || _1708;
        if (!_1710)
        {
            float _1712 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1714 = _853 + _1712;
            float _1716 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1718 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1716;
            float _1720 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1722 = _1720 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1724 = 1.0 / _1718;
            float _1726 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1728 = _1726 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1730 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1732 = _1730 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1734 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1736 = _1734 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1738 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1740 = _1738 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1742 = _1714 * _1724;
            float _1744 = precise::clamp(_1742, 0.0, 1.0);
            float _1746 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1748 = _1746 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1750 = fma(_1744, _1722, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1752 = fma(_1744, _1748, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1754 = fma(_1744, _1728, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1756 = fma(_1744, _1732, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1758 = fma(_1744, _1736, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1760 = fma(_1744, _1740, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1634 = _1754;
            _1652 = _1758;
            _1670 = _1750;
            _1646 = _1756;
            _1640 = _1752;
            _1700 = _1760;
            _1762 = true;
        }
        else
        {
            bool _1764 = _853 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1766 = isnan(_853);
            bool _1768 = _1764 || _1766;
            bool _1770 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1772 = _1768 || _1770;
            if (!_1772)
            {
                _1668 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1774 = _1668;
            _1670 = _1774;
            if (!_1772)
            {
                _1632 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1776 = _1632;
            _1634 = _1776;
            if (!_1772)
            {
                _1638 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1778 = _1638;
            _1640 = _1778;
            if (!_1772)
            {
                _1644 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1780 = _1644;
            _1646 = _1780;
            if (!_1772)
            {
                _1650 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1782 = _1650;
            _1652 = _1782;
            if (!_1772)
            {
                _1698 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1784 = _1698;
            bool _1786 = !_1772;
            _1700 = _1784;
            if (!_1786)
            {
                bool _1788 = _853 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1790 = isnan(_853);
                bool _1792 = _1788 || _1790;
                bool _1794 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1796 = _1792 || _1794;
                if (!_1796)
                {
                    float _1798 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1800 = _853 + _1798;
                    float _1802 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1804 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1802;
                    float _1806 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1808 = _1806 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1810 = 1.0 / _1804;
                    float _1812 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1814 = _1812 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1816 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1818 = _1816 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1820 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1822 = _1820 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1824 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1826 = _1824 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1828 = _1800 * _1810;
                    float _1830 = precise::clamp(_1828, 0.0, 1.0);
                    float _1832 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1834 = _1832 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1836 = fma(_1830, _1808, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1838 = fma(_1830, _1834, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1840 = fma(_1830, _1814, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1842 = fma(_1830, _1818, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1844 = fma(_1830, _1822, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1846 = fma(_1830, _1826, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1634 = _1840;
                    _1652 = _1844;
                    _1670 = _1836;
                    _1646 = _1842;
                    _1640 = _1838;
                    _1700 = _1846;
                    _1762 = true;
                }
                else
                {
                    _1634 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1652 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1670 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1646 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1640 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1700 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1762 = false;
    float _1848 = _1634;
    float _1850 = _1652;
    float _1852 = _1670;
    float _1854 = _1646;
    float _1856 = _1640;
    float _1858 = _1700;
    float _1860 = fma(_1584, -0.5, 0.5);
    float _1862 = precise::clamp(_1860, 0.0, 1.0);
    float _1864 = -_1848;
    float _1866 = _1864 + _1850;
    float _1868 = -_1852;
    float _1870 = _1868 + _1854;
    float _1872 = -_1856;
    float _1874 = _1872 + _1858;
    bool _1876 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1878 = fma(_1862, _1866, _1848);
    float _1880 = fma(_1862, _1870, _1852);
    float _1882 = fma(_1862, _1874, _1856);
    float _1884 = _1612 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1886 = _1878 * 0.586610972881317138671875;
    out.m_93.x = 0.0;
    float _1888 = fma(_1880, 0.298911988735198974609375, _1886);
    out.m_89.w = _1884;
    float _1890 = fma(_1882, 0.114477999508380889892578125, _1888);
    out.m_56.x = 1.0;
    float _1892 = -_1890;
    float _1894 = _1880 + _1892;
    float _1896 = -_1890;
    float _1898 = _1878 + _1896;
    float _1900 = -_1890;
    float _1902 = _1882 + _1900;
    float _1904 = fma(_1894, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1890);
    float _1906 = fma(_1898, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1890);
    float _1908 = fma(_1902, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1890);
    out.m_95.x = 0.0;
    out.m_97.x = _1904;
    out.m_97.y = _1906;
    out.m_97.z = _1908;
    if (!_1876)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1910 = -_827;
    float _1912 = _1910 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1914 = -_829;
    float _1916 = _1914 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1918 = -_831;
    float _1920 = _1918 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1922 = _1912 * _1912;
    float _1924 = fma(_1916, _1916, _1922);
    float _1926 = fma(_1920, _1920, _1924);
    float _1928 = rsqrt(_1926);
    float _1930 = _1912 * _1928;
    float _1932 = _1916 * _1928;
    float _1934 = _1920 * _1928;
    float _1936 = sqrt(_1926);
    float _1938 = -_859;
    float _1940 = _1938 + _1930;
    float _1942 = -_855;
    float _1944 = _1942 + _1932;
    float _1946 = -_857;
    float _1948 = _1946 + _1934;
    float _1950 = _1940 * _1940;
    float _1952 = fma(_1944, _1944, _1950);
    float _1954 = fma(_1948, _1948, _1952);
    float _1956 = -_1936;
    float _1958 = _1956 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1960 = rsqrt(_1954);
    float _1962 = _1958 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1964 = precise::clamp(_1962, 0.0, 1.0);
    float _1966 = abs(_1964);
    float _1968 = log2(_1966);
    float _1970 = _1940 * _1960;
    float _1972 = _1944 * _1960;
    float _1974 = _1948 * _1960;
    float _1976 = _1584 * _1970;
    float _1978 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
    float _1980 = precise::clamp(_1978, 0.0, 1.0);
    float _1982 = _1584 * _1930;
    float _1984 = fma(_1594, _1972, _1976);
    float _1986 = _1980 * _1980;
    float _1988 = _1968 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1990 = fma(_1594, _1932, _1982);
    float _1992 = fma(_1596, _1974, _1984);
    float _1994 = precise::clamp(_1992, 0.0, 1.0);
    float _1996 = _1986 + (-1.0);
    float _1998 = fma(_1596, _1934, _1990);
    float _2000 = precise::clamp(_1998, 0.0, 1.0);
    float _2002 = _1994 * _1994;
    float _2004 = _1932 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2006 = exp2(_1988);
    float _2008 = fma(_2002, _1996, 1.0);
    float _2010 = -_1930;
    float _2012 = -_2004;
    float _2014 = fma(_2010, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2012);
    float _2016 = _2008 * _2008;
    float _2018 = -_1934;
    float _2020 = fma(_2018, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2014);
    float _2022 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2024 = _2020 + _2022;
    float _2026 = 1.0 / _2016;
    float _2028 = _2024 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2030 = precise::clamp(_2028, 0.0, 1.0);
    float _2032 = _2006 * _2030;
    float _2034 = _2000 * _2032;
    float _2036 = _2034 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2038 = _1986 * _2026;
    float _2040 = _2034 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2042 = _2034 * _2038;
    float _2044 = _2034 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    float _2046 = _2042 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2048 = _2042 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2050 = _2042 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_93.x = _2036;
    out.m_93.y = _2040;
    out.m_93.z = _2044;
    out.m_95.x = _2046;
    out.m_95.y = _2048;
    out.m_95.z = _2050;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

