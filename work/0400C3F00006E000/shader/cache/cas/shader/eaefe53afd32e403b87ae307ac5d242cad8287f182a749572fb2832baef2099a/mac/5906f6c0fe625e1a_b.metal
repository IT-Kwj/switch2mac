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
    float4 m_83 [[user(locn0)]];
    float4 m_77 [[user(locn1)]];
    float4 m_75 [[user(locn2)]];
    float4 m_85 [[user(locn3)]];
    float4 m_97 [[user(locn4)]];
    float4 m_56 [[user(locn5)]];
    float4 m_79 [[user(locn6)]];
    float4 m_87 [[user(locn7)]];
    float4 m_89 [[user(locn8)]];
    float4 m_95 [[user(locn9)]];
    float4 m_91 [[user(locn10)]];
    float4 m_93 [[user(locn11)]];
    float4 m_99 [[user(locn12)]];
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
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1784 = false;
    bool _454 = false;
    bool _352 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _113 = in.m_53.w;
    float _115 = trunc(_113);
    int _118 = int(_115);
    bool _122 = _118 >= 1;
    float _124 = 0.0;
    if (!_122)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _126 = _124;
    float _128 = _126;
    if (!_122)
    {
        out.m_56.x = 0.0;
    }
    int _130 = 0;
    if (!_122)
    {
        float _132 = _126 * 5.0;
        _130 = as_type<int>(_132);
    }
    int _134 = _130;
    int _136 = _134;
    if (!_122)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2097 = as_type<float>(_134);
        out.gl_Position.z = _2097;
    }
    if (!_122)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _138 = in.m_58.w;
    bool _140 = _138 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _142 = isnan(_138);
    bool _144 = _140 || _142;
    bool _146 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _148 = _144 || _146;
    float _150 = -_138;
    float _152 = _150 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _154 = 0.0;
    if (_148)
    {
        float _156 = float(_118);
        _154 = _156;
    }
    float _158 = _154;
    bool _160 = _152 >= _158;
    bool _162 = !_148;
    bool _164 = _160 || _162;
    if (_164)
    {
        _128 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _166 = _128;
    if (_164)
    {
        out.m_56.x = 0.0;
    }
    if (_164)
    {
        float _168 = _166 * 5.0;
        _136 = as_type<int>(_168);
    }
    int _170 = _136;
    if (_164)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2165 = as_type<float>(_170);
        out.gl_Position.z = _2165;
    }
    if (_164)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _172 = in.m_60.x;
    float _174 = in.m_60.y;
    float _176 = in.m_60.z;
    float _178 = in.m_62.x;
    float _180 = in.m_62.y;
    float _182 = in.m_62.z;
    float _184 = in.m_64.x;
    float _186 = in.m_64.y;
    float _188 = in.m_64.z;
    float _190 = _172 * _172;
    float _192 = _174 * _174;
    float _194 = _176 * _176;
    float _196 = fma(_178, _178, _190);
    float _198 = fma(_180, _180, _192);
    float _200 = fma(_182, _182, _194);
    float _202 = fma(_184, _184, _196);
    float _204 = fma(_186, _186, _198);
    float _206 = fma(_188, _188, _200);
    float _208 = sqrt(_202);
    float _210 = sqrt(_204);
    float _212 = sqrt(_206);
    bool _214 = _208 > 0.0;
    bool _216 = _210 > 0.0;
    float _218 = _200;
    float _220 = _208;
    float _222 = _202;
    float _224 = _210;
    float _226 = _204;
    float _228 = _176;
    if (_214)
    {
        float _230 = rsqrt(_202);
        _218 = _230;
    }
    float _232 = _218;
    float _234 = 0.0;
    float _236 = 0.0;
    if (!_214)
    {
        _234 = 0.0;
        _236 = 0.0;
    }
    float _238 = _234;
    float _240 = _236;
    bool _242 = _212 > 0.0;
    float _244 = 0.0;
    float _246 = _238;
    float _248 = _240;
    float _250 = _212;
    if (!_214)
    {
        _244 = 0.0;
    }
    float _252 = _244;
    float _254 = _252;
    if (!_216)
    {
        _220 = 0.0;
    }
    float _256 = _220;
    float _258 = 0.0;
    float _260 = _256;
    if (_216)
    {
        float _262 = rsqrt(_204);
        _258 = _262;
    }
    float _264 = _258;
    if (!_242)
    {
        _222 = 0.0;
        _224 = 0.0;
    }
    float _266 = _222;
    float _268 = _224;
    float _270 = 0.0;
    float _272 = _266;
    float _274 = _268;
    if (_242)
    {
        float _276 = rsqrt(_206);
        _270 = _276;
    }
    float _278 = _270;
    float _280 = _232;
    if (_214)
    {
        float _282 = _232 * _178;
        _246 = _282;
    }
    float _284 = _246;
    if (_214)
    {
        float _286 = _232 * _172;
        _248 = _286;
    }
    float _288 = _248;
    if (_214)
    {
        float _290 = _232 * _184;
        _254 = _290;
    }
    float _292 = _254;
    bool _294 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    if (!_216)
    {
        _250 = 0.0;
        _280 = 0.0;
    }
    float _296 = _250;
    float _298 = _280;
    float _300 = _298;
    float _302 = _296;
    if (!_242)
    {
        _226 = 0.0;
    }
    float _304 = _226;
    float _306 = _304;
    if (_216)
    {
        float _308 = _264 * _180;
        _260 = _308;
    }
    float _310 = _260;
    if (_216)
    {
        float _312 = _264 * _174;
        _300 = _312;
    }
    float _314 = _300;
    if (_216)
    {
        float _316 = _264 * _186;
        _302 = _316;
    }
    float _318 = _302;
    if (_242)
    {
        float _320 = _278 * _182;
        _272 = _320;
    }
    float _322 = _272;
    if (_242)
    {
        float _324 = _278 * _176;
        _274 = _324;
    }
    float _326 = _274;
    if (_242)
    {
        float _328 = _278 * _188;
        _306 = _328;
    }
    float _330 = _306;
    bool _332 = !_294;
    float _350;
    if (!_332)
    {
        float _334 = in.m_66.x;
        float _336 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _338 = _334 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _340 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[12].x, _152);
        float _342 = _340 * _336;
        float _344 = floor(_342);
        float _346 = -_344;
        float _348 = _342 + _346;
        _350 = _348;
        _352 = true;
    }
    else
    {
        float _354 = float(_118);
        float _356 = 1.0 / _354;
        float _358 = _152 * _356;
        _350 = _358;
    }
    _352 = false;
    float _360 = _350;
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _364 = _360 + _362;
    bool _366 = _360 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _368 = isnan(_360);
    bool _370 = _366 || _368;
    bool _372 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _374 = _370 || _372;
    float _376 = float(_374);
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _380 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _378;
    bool _382 = _360 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _384 = isnan(_360);
    bool _386 = _382 || _384;
    bool _388 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _390 = _386 || _388;
    float _392 = float(_390);
    float _394 = 1.0 / _380;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _398 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _396;
    bool _400 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _402 = _364 * _394;
    float _404 = -_376;
    float _406 = _404 + 1.0;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _410 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _408;
    float _412 = fma(_398, _402, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _414 = _392 * _406;
    float _416 = fma(_410, _402, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _418 = -_392;
    float _420 = _418 + 1.0;
    float _422 = _412 * _414;
    float _424 = _416 * _414;
    float _426 = fma(_420, (*spvDescriptorSet0.vp_c9)._m0[143].x, _422);
    float _428 = fma(_420, (*spvDescriptorSet0.vp_c9)._m0[143].y, _424);
    float _430 = fma(_376, (*spvDescriptorSet0.vp_c9)._m0[144].x, _426);
    float _432 = fma(_376, (*spvDescriptorSet0.vp_c9)._m0[144].y, _428);
    bool _434 = !_400;
    float _452;
    if (!_434)
    {
        float _436 = in.m_66.x;
        float _438 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _440 = _436 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _442 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[11].y, _152);
        float _444 = _442 * _438;
        float _446 = floor(_444);
        float _448 = -_446;
        float _450 = _444 + _448;
        _452 = _450;
        _454 = true;
    }
    else
    {
        float _456 = float(_118);
        float _458 = 1.0 / _456;
        float _460 = _152 * _458;
        _452 = _460;
    }
    _454 = false;
    float _462 = _452;
    float _464 = in.m_68.w;
    float _466 = as_type<float>(int(gl_VertexIndex));
    float _468 = in.m_53.x;
    float _470 = in.m_53.y;
    float _472 = in.m_53.z;
    float _474 = in.m_73.x;
    float _476 = in.m_73.y;
    float _478 = in.m_64.w;
    float _480 = in.m_62.w;
    float _482 = trunc(_464);
    int _484 = int(_482);
    float _486 = in.m_60.w;
    int _488 = _484 << 5;
    uint _491 = uint(int(uint(_488) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_491)];
    float _493 = as_type<float>(_dmw0.x);
    int _495 = _488 + 4;
    uint _497 = uint(int(uint(_495) >> uint(2)));
    float _499 = as_type<float>(_dmw0.y);
    int _501 = _488 + 8;
    uint _503 = uint(int(uint(_501) >> uint(2)));
    float _505 = as_type<float>(_dmw0.z);
    int _507 = _488 + 12;
    uint _509 = uint(int(uint(_507) >> uint(2)));
    float _511 = as_type<float>(_dmw0.w);
    int _513 = as_type<int>(_466) & 1;
    bool _515 = _513 != 0;
    int _517 = as_type<int>(_466) & 2;
    bool _519 = _517 != 0;
    float _521 = _186 * _470;
    float _523 = _430 * _474;
    float _525 = _432 * _476;
    float _527 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    bool _529 = !_515;
    float _531 = _529 ? (-0.5) : 0.5;
    float _533 = fma(_184, _468, _521);
    bool _535 = !_519;
    float _537 = _535 ? (-0.5) : 0.5;
    float _539 = _523 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _541 = _180 * _470;
    float _543 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _531);
    float _545 = _525 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _547 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _537);
    float _549 = fma(_178, _468, _541);
    float _551 = _539 * _543;
    float _553 = _527 * _318;
    float _555 = fma(_188, _472, _533);
    float _557 = _545 * _547;
    float _559 = _527 * _310;
    float _561 = fma(_551, _292, _553);
    float _563 = fma(_182, _472, _549);
    float _565 = _555 + _478;
    float _567 = fma(_551, _284, _559);
    float _569 = -_557;
    float _571 = fma(_569, _330, _561);
    float _573 = _563 + _480;
    float _575 = _174 * _470;
    float _577 = -_557;
    float _579 = fma(_577, _322, _567);
    float _581 = _565 + _571;
    float _583 = _527 * _314;
    float _585 = fma(_172, _468, _575);
    float _587 = _573 + _579;
    float _589 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _591 = _581 + _589;
    float _593 = fma(_176, _472, _585);
    float _595 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _597 = _587 + _595;
    float _599 = _591 * _591;
    float _601 = fma(_551, _288, _583);
    bool _603 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _605 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _607 = _603 || _605;
    bool _609 = isnan(0.5);
    bool _611 = _607 || _609;
    float _613 = _593 + _486;
    float _615 = fma(_597, _597, _599);
    float _617 = -_557;
    float _619 = fma(_617, _326, _601);
    float _621 = sqrt(_615);
    bool _623 = _621 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _625 = _619;
    float _627 = _581;
    float _629 = _621;
    float _631 = _587;
    if (!_623)
    {
        _228 = _587;
    }
    float _633 = _228;
    float _635 = _511 * 2.0;
    float _637 = _493 * 2.0;
    float _639 = _499 * 2.0;
    float _641 = _505 * _635;
    float _643 = _499 * _635;
    float _645 = _493 * _635;
    float _647 = _493 * _493;
    float _649 = -_641;
    float _651 = fma(_499, _637, _649);
    float _653 = fma(_499, _637, _641);
    float _655 = fma(_505, _637, _643);
    float _657 = -_643;
    float _659 = fma(_505, _637, _657);
    float _661 = _613 + _619;
    float _663 = -_645;
    float _665 = fma(_505, _639, _663);
    float _667 = fma(_505, _639, _645);
    float _669 = _499 * _499;
    float _671 = _505 * _505;
    float _673 = _633;
    if (!_623)
    {
        _625 = _661;
    }
    float _675 = _625;
    bool _677 = !_623;
    float _679 = _675;
    if (!_677)
    {
        float _681 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _683 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _685 = _621 + _683;
        float _687 = _661 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _689 = rsqrt(_615);
        float _691 = _685 * _681;
        float _693 = _691 * 0.15915493667125701904296875;
        float _695 = _693 * 6.283185482025146484375;
        float _697 = cos(_695);
        float _699 = _693 * 6.283185482025146484375;
        float _701 = sin(_699);
        float _703 = _697 + (-1.0);
        float _705 = fma(_701, _687, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _707 = _703 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _709 = _689 * _705;
        float _711 = fma(_661, _697, _707);
        float _713 = fma(_597, _709, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _715 = fma(_591, _709, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _679 = _711;
        _673 = _713;
        _627 = _715;
        _629 = _685;
    }
    float _717 = _679;
    float _719 = _673;
    float _721 = _627;
    float _723 = _629;
    float _725 = -_613;
    float _727 = _725 + _717;
    float _729 = -_573;
    float _731 = _729 + _719;
    float _733 = fma(_647, -2.0, 1.0);
    float _735 = -_565;
    float _737 = _735 + _721;
    float _739 = _727 * _314;
    float _741 = _727 * _288;
    float _743 = fma(_669, -2.0, 1.0);
    float _745 = fma(_671, -2.0, _733);
    float _747 = fma(_731, _310, _739);
    float _749 = _727 * _326;
    float _751 = fma(_731, _284, _741);
    float _753 = fma(_671, -2.0, _743);
    float _755 = fma(_737, _318, _747);
    float _757 = fma(_731, _322, _749);
    float _759 = fma(_737, _292, _751);
    float _761 = fma(_669, -2.0, _733);
    float _763 = _755 * _651;
    float _765 = _755 * _745;
    float _767 = _755 * _667;
    float _769 = fma(_737, _330, _757);
    float _771 = fma(_759, _753, _763);
    float _773 = fma(_759, _653, _765);
    float _775 = fma(_759, _659, _767);
    float _777 = fma(_769, _655, _771);
    float _779 = fma(_769, _665, _773);
    float _781 = fma(_769, _761, _775);
    float _783 = _573 + _777;
    float _785 = _613 + _779;
    float _787 = _565 + _781;
    float _789 = _785;
    float _791 = _783;
    float _793 = _787;
    if (!_611)
    {
        float _795 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _797 = _613 + _795;
        float _799 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _801 = _573 + _799;
        float _803 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _805 = _797 * _797;
        float _807 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _809 = _565 + _807;
        float _811 = fma(_801, _801, _805);
        float _813 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _815 = fma(_809, _809, _811);
        float _817 = sqrt(_815);
        float _819 = _803 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _821 = precise::min(_817, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _823 = _821 * _813;
        float _825 = _819 * _823;
        float _827 = fma(_777, _825, _573);
        float _829 = fma(_779, _825, _613);
        float _831 = fma(_781, _825, _565);
        _789 = _829;
        _791 = _827;
        _793 = _831;
    }
    float _833 = _789;
    float _835 = _791;
    float _837 = _793;
    float _839 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _841 = _833 + _839;
    float _843 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _845 = _835 + _843;
    float _847 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _849 = _837 + _847;
    float _851 = _841 * _841;
    float _853 = _833 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _855 = fma(_845, _845, _851);
    float _857 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _859 = fma(_835, (*spvDescriptorSet0.vp_c8)._m0[3].x, _853);
    float _861 = fma(_849, _849, _855);
    float _863 = fma(_837, (*spvDescriptorSet0.vp_c8)._m0[3].z, _859);
    float _865 = rsqrt(_861);
    float _867 = sqrt(_861);
    float _869 = _845 * _865;
    float _871 = _849 * _865;
    float _873 = _841 * _865;
    float _875 = _869 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _877 = _871 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _879 = _875 * _875;
    float _881 = _877 * _877;
    float _883 = _879 + _881;
    float _885 = sqrt(_883);
    bool _887 = _885 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _889 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _891 = _885 + _889;
    float _893 = _661;
    float _895 = _891;
    float _897 = _865;
    float _899 = _877;
    if (_887)
    {
        float _901 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _893 = _901;
    }
    float _903 = _893;
    if (_887)
    {
        float _905 = _891 * _903;
        _895 = _905;
    }
    float _907 = _895;
    if (_887)
    {
        float _909 = _907 * 0.15915493667125701904296875;
        _631 = _909;
    }
    float _911 = _631;
    float _913 = _723;
    float _915 = _911;
    if (_887)
    {
        float _917 = _911 * 6.283185482025146484375;
        float _919 = sin(_917);
        _913 = _919;
    }
    float _921 = _913;
    float _923 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _925 = precise::max(0.0, _923);
    float _927 = _601;
    float _929 = _925;
    if (_887)
    {
        float _931 = _911 * 6.283185482025146484375;
        float _933 = cos(_931);
        _927 = _933;
    }
    float _935 = _927;
    float _937 = -_873;
    float _939 = -_925;
    float _941 = fma(_937, (*spvDescriptorSet0.vp_c15)._m0[24].y, _939);
    float _943 = _923;
    if (_887)
    {
        float _945 = rsqrt(_883);
        _943 = _945;
    }
    float _947 = _943;
    if (_887)
    {
        float _949 = _941 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _897 = _949;
    }
    float _951 = _897;
    float _953 = _951;
    if (!_887)
    {
        _915 = _879;
    }
    float _955 = _915;
    float _957 = _921;
    float _959 = _955;
    if (_887)
    {
        float _961 = fma(_921, _951, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _929 = _961;
    }
    float _963 = _929;
    float _965 = _963;
    if (!_887)
    {
        _957 = _941;
    }
    float _967 = _957;
    float _969 = _967;
    float _971 = _935;
    if (_887)
    {
        float _973 = _935 + (-1.0);
        _953 = _973;
    }
    float _975 = _953;
    float _977 = _975;
    if (_887)
    {
        float _979 = _975 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _977 = _979;
    }
    float _981 = _977;
    float _983 = 0.0;
    if (_887)
    {
        float _985 = _947 * _963;
        _983 = _985;
    }
    float _987 = _983;
    if (!_887)
    {
        _965 = _875;
    }
    float _989 = _965;
    float _991 = _989;
    if (_887)
    {
        float _993 = fma(_941, _935, _981);
        _969 = _993;
    }
    float _995 = _969;
    if (!_887)
    {
        _971 = _881;
    }
    float _997 = _971;
    float _999 = _997;
    if (_887)
    {
        float _1001 = _875 * _987;
        _991 = _1001;
    }
    float _1003 = _991;
    if (_887)
    {
        float _1005 = _877 * _987;
        _899 = _1005;
    }
    float _1007 = _899;
    float _1009 = fma(_565, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    if (_887)
    {
        float _1011 = _1003 * _1003;
        _959 = _1011;
    }
    float _1013 = _959;
    if (_887)
    {
        float _1015 = _1007 * _1007;
        _999 = _1015;
    }
    float _1017 = _999;
    float _1019 = fma(_995, _995, _1013);
    float _1021 = _833 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1023 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1025 = fma(_867, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1023);
    float _1027 = precise::clamp(_1025, 0.0, 1.0);
    float _1029 = fma(_573, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1031 = _1019 + _1017;
    float _1033 = fma(_835, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1021);
    float _1035 = _833 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1037 = -_1027;
    float _1039 = _1037 + 1.0;
    float _1041 = floor(_1029);
    float _1043 = fma(_837, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1033);
    float _1045 = _833 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1047 = fma(_835, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1035);
    float _1049 = _1043 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1051 = fma(_835, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1045);
    float _1053 = fma(_837, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1047);
    float _1055 = rsqrt(_1031);
    float _1057 = _1049 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1059 = fma(_837, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1051);
    float _1061 = _1053 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1063 = -_1057;
    float _1065 = fma(_1063, _857, 1.0);
    float _1067 = _1059 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1069 = _1061 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1071 = abs(_1039);
    float _1073 = log2(_1071);
    float _1075 = _863 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1077 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1069);
    float _1079 = _1055 * _1003;
    float _1081 = _1055 * _995;
    float _1083 = floor(_1009);
    float _1085 = _1055 * _1007;
    float _1087 = _1079 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1089 = fma(_1049, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1077);
    float _1091 = -_1087;
    float _1093 = fma(_1081, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1091);
    float _1095 = _1073 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1097 = log2(_1065);
    float _1099 = fma(_1075, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1089);
    float _1101 = -_1085;
    float _1103 = fma(_1101, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1093);
    float _1105 = _1061 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1107 = exp2(_1095);
    float _1109 = -_1041;
    float _1111 = _1029 + _1109;
    float _1113 = fma(_1103, -0.5, 0.5);
    float _1115 = _1061 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1117 = -_1083;
    float _1119 = _1009 + _1117;
    float _1121 = fma(_1103, 0.5, 0.5);
    float _1123 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1105);
    float _1125 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1115);
    float _1127 = 1.0 / _1099;
    float _1129 = fma(_1121, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1131 = _1081 + 1.0;
    float _1133 = fma(_1049, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1125);
    float _1135 = fma(_1049, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1123);
    float _1137 = fma(_1121, _1129, -0.212114393711090087890625);
    float _1139 = _1097 * 0.693147182464599609375;
    float _1141 = fma(_1075, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1133);
    float _1143 = sqrt(_1113);
    float _1145 = -_1081;
    float _1147 = fma(_1107, _1131, _1145);
    float _1149 = fma(_1075, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1135);
    float _1151 = fma(_1121, _1137, 1.570728778839111328125);
    float _1153 = _1139 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1155 = fma(_1147, 0.5, 0.5);
    float _1157 = _1141 * _1127;
    float _1159 = _1149 * _1127;
    float _1161 = fma(_1157, 0.5, 0.5);
    float _1163 = fma(_1159, -0.5, 0.5);
    float _1165 = _1143 * 0.636619746685028076171875;
    float2 _3711 = float2(_1111, _1119);
    float _1167 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3711, float2(0.0), isnan(_3711)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3711, float2(0.0), isnan(_3711)), level(0.0)).x;
    float3 _3722 = float3(_1161, _1163, _1153);
    float _1169 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3722, float3(0.0), isnan(_3722)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3722, float3(0.0), isnan(_3722)), level(0.0)).x;
    float3 _3733 = float3(_1161, _1163, _1153);
    float4 _1172 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3733, float3(0.0), isnan(_3733)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3733, float3(0.0), isnan(_3733)), level(0.0)).xyzw;
    float _1174 = _1172.x;
    float _1176 = _1172.y;
    float _1178 = _1172.z;
    float _1180 = _1172.w;
    float _1182 = -_1151;
    float _1184 = fma(_1165, _1182, 1.0);
    float2 _3754 = float2(_1184, _1155);
    float3 _1188 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3754, float2(0.0), isnan(_3754)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3754, float2(0.0), isnan(_3754)), level(0.0)).xyz;
    float _1190 = _1188.x;
    float _1192 = _1188.y;
    float _1194 = _1188.z;
    float _1196 = _613 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1198 = _613 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1200 = _531 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1202 = _1061 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1204 = fma(_573, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1196);
    out.m_75.x = _845;
    out.m_75.y = _841;
    out.m_75.z = _849;
    float _1206 = fma(_1200, _284, _310);
    float _1208 = fma(_565, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1204);
    float _1210 = in.m_66.x;
    float _1212 = in.m_66.y;
    float _1214 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1216 = _1214 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1218 = _1208 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1220 = fma(_573, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1198);
    float _1222 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1224 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1222;
    float _1226 = 1.0 / _1218;
    float _1228 = fma(_565, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1220);
    bool _1230 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1232 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1234 = _1230 || _1232;
    bool _1236 = isnan(0.5);
    bool _1238 = _1234 || _1236;
    float _1240 = fma(_1200, _288, _314);
    float _1242 = _1228 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1244 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1246 = _462 + _1244;
    float _1248 = 1.0 / _1216;
    float _1250 = _1242 + _1218;
    float _1252 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.300000011920928955078125;
    bool _1254 = _462 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1256 = isnan(_462);
    bool _1258 = _1254 || _1256;
    bool _1260 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1262 = _1258 || _1260;
    float _1264 = float(_1262);
    float _1266 = fma(_1200, _292, _318);
    float _1268 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1202);
    float _1270 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1272 = _1250 * _1226;
    float _1274 = _1272 * 0.5;
    bool _1276 = _1212 > 0.5;
    float _1278 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1280 = fma(_1252, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1278);
    float _1282 = _1270 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1284 = _1210 > 0.5;
    float _1286 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1288 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1286);
    float _1290 = _1224 * _1248;
    int _1292 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1294 = _1292 != 0;
    int _1296 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1298 = _1296 != 0;
    float _1300 = 1.0 / _1288;
    float _1302 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _1304 = _462 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1306 = isnan(_462);
    bool _1308 = _1304 || _1306;
    bool _1310 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1312 = _1308 || _1310;
    float _1314 = float(_1312);
    float _1316 = fma(_1290, _1246, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1318 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1320 = _1302 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1322 = -_1314;
    float _1324 = _1322 + 1.0;
    float _1326 = -_531;
    int _1328 = _1284 ? as_type<int>(_1326) : as_type<int>(_531);
    float _1330 = _1318 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1332 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1334 = fma(_1252, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1332);
    bool _1336 = 0.0 != (*spvDescriptorSet0.vp_c11)._m0[20].z;
    bool _1338 = isnan(0.0);
    bool _1340 = _1336 || _1338;
    bool _1342 = isnan((*spvDescriptorSet0.vp_c11)._m0[20].z);
    bool _1344 = _1340 || _1342;
    bool _1346 = !_1294;
    float _1348 = _1346 ? _531 : as_type<float>(_1328);
    out.m_77.x = _1330;
    out.m_77.y = _1320;
    out.m_77.z = _1282;
    float _1350 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1352 = _1300 * _1350;
    float _1354 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _1334);
    float _1356 = -_537;
    int _1358 = _1276 ? as_type<int>(_1356) : as_type<int>(_537);
    float _1360 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1362 = _1348 + 0.5;
    float _1364 = _565 + _1354;
    float _1366 = _1264 * _1324;
    float _1368 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _1280);
    float _1370 = abs(_1352);
    float _1372 = log2(_1370);
    float _1374 = -_1264;
    float _1376 = _1374 + 1.0;
    float _1378 = _1316 * _1366;
    float _1380 = _573 + _1368;
    float _1382 = _537 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _1384 = !_1298;
    float _1386 = _1384 ? _537 : as_type<float>(_1358);
    float _1388 = -_1364;
    float _1390 = _1388 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _1392 = -_1380;
    float _1394 = _1392 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _1396 = -_1382;
    float _1398 = fma(_1396, _322, _1206);
    float _1400 = (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _1402 = _1364;
    float _1404 = _1398;
    if (_1344)
    {
        float _1406 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.20000000298023223876953125;
        _1400 = _1406;
    }
    float _1408 = _1400;
    float _1410 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1412 = fma(_1376, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1378);
    float _1414 = precise::min(_1380, _1394);
    float _1416 = -_1386;
    float _1418 = _1416 + 0.5;
    float _1420 = precise::min(_1364, _1390);
    float _1422 = -_1382;
    float _1424 = fma(_1422, _326, _1240);
    float _1426 = _1372 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    if (_1344)
    {
        float _1428 = precise::min(_1408, 20.0);
        _1402 = _1428;
    }
    float _1430 = _1402;
    float _1432 = _1362 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1434 = precise::min(_1414, _1420);
    float _1436 = fma(_1314, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1412);
    float _1438 = exp2(_1426);
    float _1440 = _1418 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1442 = _1432 * _1360;
    float _1444 = _1440 * _1410;
    float _1446 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1448 = _1430;
    float _1450 = (*spvDescriptorSet0.vp_c9)._m0[107].z;
    if (_1344)
    {
        float _1452 = 1.0 / _1430;
        _1448 = _1452;
    }
    float _1454 = _1448;
    float _1456 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1458 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1460 = -_1382;
    float _1462 = fma(_1460, _330, _1266);
    float _1464 = _1446 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1466 = _1456 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1468 = _1458 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1470 = _1436 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1472 = fma(_1438, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1474 = precise::clamp(_1472, 0.0, 1.0);
    out.m_79.x = _1442;
    out.m_79.y = _1444;
    float _1476 = _1470;
    if (!_1344)
    {
        _1450 = 1.0;
    }
    float _1478 = _1450;
    float _1480 = _1424 * _745;
    float _1482 = fma(_1474, -2.0, 3.0);
    float _1484 = in.m_81.x;
    float _1486 = _1474 * _1474;
    float _1488 = _1478;
    if (_1344)
    {
        float _1490 = _1434 * _1454;
        float _1492 = precise::clamp(_1490, 0.0, 1.0);
        _1488 = _1492;
    }
    float _1494 = _1488;
    float _1496 = _1424 * _651;
    out.m_83.x = _1464;
    out.m_83.y = _1466;
    out.m_83.z = _1468;
    out.m_83.w = _1470;
    float _1498 = _1486 * _1482;
    float _1500 = _1424 * _667;
    float _1502 = fma(_1049, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1268);
    float _1504 = fma(_1398, _753, _1496);
    float _1506 = fma(_1398, _653, _1480);
    float _1508 = fma(_1398, _659, _1500);
    float _1510 = fma(_1075, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1502);
    if (_1238)
    {
        _1404 = 1.0;
    }
    float _1512 = _1404;
    float _1514 = _1073 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1516 = -_1498;
    float _1518 = _1516 + 1.0;
    float _1520 = _1510 + _1099;
    float _1522 = _1512;
    if (_1238)
    {
        _1476 = 1.0;
    }
    float _1524 = _1476;
    float _1526 = fma(_1518, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1498);
    float _1528 = exp2(_1514);
    bool _1530 = _1352 <= 8000.0;
    bool _1532 = isnan(_1352);
    bool _1534 = _1530 || _1532;
    bool _1536 = isnan(8000.0);
    bool _1538 = _1534 || _1536;
    float _1540 = float(_1538);
    float _1542 = _1520 * 0.5;
    float _1544 = _1540 * _1526;
    float _1546 = _1524;
    if (!_1238)
    {
        float _1548 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1550 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1552 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1550;
        float _1554 = _1548 * 0.15915493667125701904296875;
        float _1556 = _1554 * 6.283185482025146484375;
        float _1558 = cos(_1556);
        float _1560 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1562 = _1560 * 0.15915493667125701904296875;
        float _1564 = _1554 * 6.283185482025146484375;
        float _1566 = sin(_1564);
        float _1568 = 1.0 / _1558;
        float _1570 = _1562 * 6.283185482025146484375;
        float _1572 = cos(_1570);
        float _1574 = _1566 * _1568;
        float _1576 = _1562 * 6.283185482025146484375;
        float _1578 = sin(_1576);
        float _1580 = _1572 * _1574;
        float _1582 = 1.0 / _1552;
        float _1584 = 1.0 / _1580;
        float _1586 = _1578 * _1584;
        float _1588 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1590 = fma(_1352, _1586, _1588);
        float _1592 = _1590 * _1582;
        float _1594 = precise::clamp(_1592, 0.0, 1.0);
        _1522 = _1594;
    }
    float _1596 = _1522;
    if (!_1238)
    {
        float _1598 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1600 = _1598 * 0.15915493667125701904296875;
        float _1602 = _1600 * 6.283185482025146484375;
        float _1604 = cos(_1602);
        float _1606 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1608 = _1606 * 0.15915493667125701904296875;
        float _1610 = _1600 * 6.283185482025146484375;
        float _1612 = sin(_1610);
        float _1614 = 1.0 / _1604;
        float _1616 = _1608 * 6.283185482025146484375;
        float _1618 = cos(_1616);
        float _1620 = _1612 * _1614;
        float _1622 = _1608 * 6.283185482025146484375;
        float _1624 = sin(_1622);
        float _1626 = _1618 * _1620;
        float _1628 = 1.0 / _1626;
        float _1630 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1632 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1630;
        float _1634 = 1.0 / _1632;
        float _1636 = _1624 * _1628;
        float _1638 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1640 = fma(_1352, _1636, _1638);
        float _1642 = _1640 * _1634;
        float _1644 = precise::clamp(_1642, 0.0, 1.0);
        float _1646 = -_1644;
        float _1648 = _1646 + 1.0;
        _1546 = _1648;
    }
    float _1650 = _1546;
    float _1652 = _1544 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1654 = -_1167;
    float _1656 = _1654 + 1.0;
    float _1658 = fma(_1462, _665, _1506);
    float _1660 = -_1528;
    float _1662 = _1660 + 1.0;
    float _1664 = fma(_1462, _655, _1504);
    float _1666 = fma(_1462, _761, _1508);
    float _1668 = _1656 * _1652;
    float _1670 = precise::clamp(_1668, 0.0, 1.0);
    float _1672 = _1662 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_85.z = _1542;
    out.m_85.w = _1099;
    bool _1674 = _867 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1676 = isnan(_867);
    bool _1678 = _1674 || _1676;
    bool _1680 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1682 = _1678 || _1680;
    float _1684 = _1672 * _1169;
    out.gl_Position.x = _1141;
    out.gl_Position.y = _1149;
    out.gl_Position.z = _1510;
    out.gl_Position.w = _1099;
    float _1686 = _1194 * _1684;
    out.m_87.x = _1664;
    out.m_87.y = _1658;
    out.m_87.z = _1666;
    float _1688 = -_1670;
    float _1690 = fma(_1688, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1692 = _1180 * _1684;
    float _1694 = fma(_1180, _1686, _1178);
    out.m_89.x = _835;
    out.m_89.y = _833;
    out.m_89.z = _837;
    float _1696 = _1690 * _1484;
    float _1698 = -_1672;
    float _1700 = _1698 + 1.0;
    float _1702 = fma(_1190, _1692, _1174);
    float _1704 = fma(_1192, _1692, _1176);
    float _1706 = _1696 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1708 = _1180 * _1700;
    float _1710 = _1596 * _1650;
    float _1712 = _1692;
    float _1714 = _1696;
    if (!_1682)
    {
        _1712 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1716 = _1712;
    out.m_91.x = _1706;
    float _1718 = _1710 * _1494;
    float _1720 = _1718;
    float _1722 = _1716;
    float _1724 = _1716;
    if (!_1682)
    {
        _1714 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1726 = _1714;
    out.m_93.x = _1702;
    out.m_93.y = _1704;
    out.m_93.z = _1694;
    out.m_93.w = _1708;
    float _1728 = _1718 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1730 = _1726;
    float _1732 = _1726;
    if (!_1682)
    {
        _1720 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1734 = _1720;
    bool _1736 = !_1682;
    float _1738 = _1734;
    float _1740 = _1734;
    if (!_1736)
    {
        bool _1742 = _867 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1744 = isnan(_867);
        bool _1746 = _1742 || _1744;
        bool _1748 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1750 = _1746 || _1748;
        if (!_1750)
        {
            float _1752 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1754 = _867 + _1752;
            float _1756 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1758 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1756;
            float _1760 = 1.0 / _1758;
            float _1762 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1764 = _1762 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1766 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1768 = _1766 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1770 = _1754 * _1760;
            float _1772 = precise::clamp(_1770, 0.0, 1.0);
            float _1774 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1776 = _1774 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1778 = fma(_1772, _1768, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1780 = fma(_1772, _1776, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1782 = fma(_1772, _1764, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            _1740 = _1782;
            _1724 = _1780;
            _1732 = _1778;
            _1784 = true;
        }
        else
        {
            bool _1786 = _867 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1788 = isnan(_867);
            bool _1790 = _1786 || _1788;
            bool _1792 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1794 = _1790 || _1792;
            if (!_1794)
            {
                _1722 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1796 = _1722;
            _1724 = _1796;
            if (!_1794)
            {
                _1738 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1798 = _1738;
            _1740 = _1798;
            if (!_1794)
            {
                _1730 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1800 = _1730;
            bool _1802 = !_1794;
            _1732 = _1800;
            if (!_1802)
            {
                bool _1804 = _867 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1806 = isnan(_867);
                bool _1808 = _1804 || _1806;
                bool _1810 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1812 = _1808 || _1810;
                if (!_1812)
                {
                    float _1814 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1816 = _867 + _1814;
                    float _1818 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1820 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1818;
                    float _1822 = 1.0 / _1820;
                    float _1824 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1826 = _1824 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1828 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1830 = _1828 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1832 = _1816 * _1822;
                    float _1834 = precise::clamp(_1832, 0.0, 1.0);
                    float _1836 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1838 = _1836 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1840 = fma(_1834, _1830, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1842 = fma(_1834, _1838, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1844 = fma(_1834, _1826, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    _1740 = _1844;
                    _1724 = _1842;
                    _1732 = _1840;
                    _1784 = true;
                }
                else
                {
                    _1740 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1724 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1732 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _1784 = false;
    float _1846 = _1740;
    float _1848 = _1724;
    float _1850 = _1732;
    float _1852 = _1728 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_95.x = 0.0;
    float _1854 = _1846 * 0.586610972881317138671875;
    bool _1856 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_56.x = _1852;
    float _1858 = fma(_1848, 0.298911988735198974609375, _1854);
    bool _1860 = _1596 > 0.0;
    bool _1862 = isnan(_1596);
    bool _1864 = _1860 || _1862;
    bool _1866 = isnan(0.0);
    bool _1868 = _1864 || _1866;
    float _1870 = fma(_1850, 0.114477999508380889892578125, _1858);
    bool _1872 = _1650 <= 0.0;
    bool _1874 = !_1868;
    bool _1876 = _1872 || _1874;
    out.m_97.x = 0.0;
    float _1878 = -_1870;
    float _1880 = _1878 + _1848;
    float _1882 = -_1870;
    float _1884 = _1882 + _1846;
    float _1886 = -_1870;
    float _1888 = _1886 + _1850;
    float _1890 = fma(_1880, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1870);
    float _1892 = fma(_1884, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1870);
    float _1894 = fma(_1888, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1870);
    bool _1896 = !_1856;
    if (!_1896)
    {
        float _1898 = -_833;
        float _1900 = _1898 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _1902 = -_835;
        float _1904 = _1902 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _1906 = -_837;
        float _1908 = _1906 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _1910 = _1900 * _1900;
        float _1912 = fma(_1904, _1904, _1910);
        float _1914 = fma(_1908, _1908, _1912);
        float _1916 = rsqrt(_1914);
        float _1918 = _1900 * _1916;
        float _1920 = _1904 * _1916;
        float _1922 = _1908 * _1916;
        float _1924 = -_873;
        float _1926 = _1924 + _1918;
        float _1928 = -_869;
        float _1930 = _1928 + _1920;
        float _1932 = sqrt(_1914);
        float _1934 = -_871;
        float _1936 = _1934 + _1922;
        float _1938 = _1926 * _1926;
        float _1940 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
        float _1942 = precise::clamp(_1940, 0.0, 1.0);
        float _1944 = fma(_1930, _1930, _1938);
        float _1946 = _1942 * _1942;
        float _1948 = fma(_1936, _1936, _1944);
        float _1950 = _1946 + (-1.0);
        float _1952 = rsqrt(_1948);
        float _1954 = -_1932;
        float _1956 = _1954 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _1958 = _1956 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _1960 = precise::clamp(_1958, 0.0, 1.0);
        float _1962 = _1920 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _1964 = abs(_1960);
        float _1966 = log2(_1964);
        float _1968 = _1926 * _1952;
        float _1970 = _1930 * _1952;
        float _1972 = _1936 * _1952;
        float _1974 = _1658 * _1968;
        float _1976 = _1658 * _1918;
        float _1978 = fma(_1664, _1970, _1974);
        float _1980 = fma(_1664, _1920, _1976);
        float _1982 = fma(_1666, _1972, _1978);
        float _1984 = precise::clamp(_1982, 0.0, 1.0);
        float _1986 = _1966 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _1988 = fma(_1666, _1922, _1980);
        float _1990 = precise::clamp(_1988, 0.0, 1.0);
        float _1992 = _1984 * _1984;
        float _1994 = exp2(_1986);
        float _1996 = fma(_1992, _1950, 1.0);
        float _1998 = -_1918;
        float _2000 = -_1962;
        float _2002 = fma(_1998, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2000);
        float _2004 = _1996 * _1996;
        float _2006 = -_1922;
        float _2008 = fma(_2006, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2002);
        float _2010 = 1.0 / _2004;
        float _2012 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2014 = _2008 + _2012;
        float _2016 = _2014 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2018 = precise::clamp(_2016, 0.0, 1.0);
        float _2020 = _1994 * _2018;
        float _2022 = _1990 * _2020;
        float _2024 = _1946 * _2010;
        float _2026 = _2022 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2028 = _2022 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2030 = _2022 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        float _2032 = _2022 * _2024;
        float _2034 = _2032 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2036 = _2032 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2038 = _2032 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_95.x = _2026;
        out.m_95.y = _2028;
        out.m_95.z = _2030;
        out.m_97.x = _2034;
        out.m_97.y = _2036;
        out.m_97.z = _2038;
    }
    out.m_99.x = _1890;
    out.m_99.y = _1892;
    out.m_99.z = _1894;
    if (!_1876)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_56.x = 0.0;
    float _2040 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2040;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1784 = false;
    bool _454 = false;
    bool _352 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _113 = in.m_53.w;
    float _115 = trunc(_113);
    int _118 = int(_115);
    bool _122 = _118 >= 1;
    float _124 = 0.0;
    if (!_122)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _126 = _124;
    float _128 = _126;
    if (!_122)
    {
        out.m_56.x = 0.0;
    }
    int _130 = 0;
    if (!_122)
    {
        float _132 = _126 * 5.0;
        _130 = as_type<int>(_132);
    }
    int _134 = _130;
    int _136 = _134;
    if (!_122)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2097 = as_type<float>(_134);
        out.gl_Position.z = _2097;
    }
    if (!_122)
    {
        return out;
    }
    float _138 = in.m_58.w;
    bool _140 = _138 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _142 = isnan(_138);
    bool _144 = _140 || _142;
    bool _146 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _148 = _144 || _146;
    float _150 = -_138;
    float _152 = _150 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _154 = 0.0;
    if (_148)
    {
        float _156 = float(_118);
        _154 = _156;
    }
    float _158 = _154;
    bool _160 = _152 >= _158;
    bool _162 = !_148;
    bool _164 = _160 || _162;
    if (_164)
    {
        _128 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _166 = _128;
    if (_164)
    {
        out.m_56.x = 0.0;
    }
    if (_164)
    {
        float _168 = _166 * 5.0;
        _136 = as_type<int>(_168);
    }
    int _170 = _136;
    if (_164)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2165 = as_type<float>(_170);
        out.gl_Position.z = _2165;
    }
    if (_164)
    {
        return out;
    }
    float _172 = in.m_60.x;
    float _174 = in.m_60.y;
    float _176 = in.m_60.z;
    float _178 = in.m_62.x;
    float _180 = in.m_62.y;
    float _182 = in.m_62.z;
    float _184 = in.m_64.x;
    float _186 = in.m_64.y;
    float _188 = in.m_64.z;
    float _190 = _172 * _172;
    float _192 = _174 * _174;
    float _194 = _176 * _176;
    float _196 = fma(_178, _178, _190);
    float _198 = fma(_180, _180, _192);
    float _200 = fma(_182, _182, _194);
    float _202 = fma(_184, _184, _196);
    float _204 = fma(_186, _186, _198);
    float _206 = fma(_188, _188, _200);
    float _208 = sqrt(_202);
    float _210 = sqrt(_204);
    float _212 = sqrt(_206);
    bool _214 = _208 > 0.0;
    bool _216 = _210 > 0.0;
    float _218 = _200;
    float _220 = _208;
    float _222 = _202;
    float _224 = _210;
    float _226 = _204;
    float _228 = _176;
    if (_214)
    {
        float _230 = rsqrt(_202);
        _218 = _230;
    }
    float _232 = _218;
    float _234 = 0.0;
    float _236 = 0.0;
    if (!_214)
    {
        _234 = 0.0;
        _236 = 0.0;
    }
    float _238 = _234;
    float _240 = _236;
    bool _242 = _212 > 0.0;
    float _244 = 0.0;
    float _246 = _238;
    float _248 = _240;
    float _250 = _212;
    if (!_214)
    {
        _244 = 0.0;
    }
    float _252 = _244;
    float _254 = _252;
    if (!_216)
    {
        _220 = 0.0;
    }
    float _256 = _220;
    float _258 = 0.0;
    float _260 = _256;
    if (_216)
    {
        float _262 = rsqrt(_204);
        _258 = _262;
    }
    float _264 = _258;
    if (!_242)
    {
        _222 = 0.0;
        _224 = 0.0;
    }
    float _266 = _222;
    float _268 = _224;
    float _270 = 0.0;
    float _272 = _266;
    float _274 = _268;
    if (_242)
    {
        float _276 = rsqrt(_206);
        _270 = _276;
    }
    float _278 = _270;
    float _280 = _232;
    if (_214)
    {
        float _282 = _232 * _178;
        _246 = _282;
    }
    float _284 = _246;
    if (_214)
    {
        float _286 = _232 * _172;
        _248 = _286;
    }
    float _288 = _248;
    if (_214)
    {
        float _290 = _232 * _184;
        _254 = _290;
    }
    float _292 = _254;
    bool _294 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    if (!_216)
    {
        _250 = 0.0;
        _280 = 0.0;
    }
    float _296 = _250;
    float _298 = _280;
    float _300 = _298;
    float _302 = _296;
    if (!_242)
    {
        _226 = 0.0;
    }
    float _304 = _226;
    float _306 = _304;
    if (_216)
    {
        float _308 = _264 * _180;
        _260 = _308;
    }
    float _310 = _260;
    if (_216)
    {
        float _312 = _264 * _174;
        _300 = _312;
    }
    float _314 = _300;
    if (_216)
    {
        float _316 = _264 * _186;
        _302 = _316;
    }
    float _318 = _302;
    if (_242)
    {
        float _320 = _278 * _182;
        _272 = _320;
    }
    float _322 = _272;
    if (_242)
    {
        float _324 = _278 * _176;
        _274 = _324;
    }
    float _326 = _274;
    if (_242)
    {
        float _328 = _278 * _188;
        _306 = _328;
    }
    float _330 = _306;
    bool _332 = !_294;
    float _350;
    if (!_332)
    {
        float _334 = in.m_66.x;
        float _336 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _338 = _334 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _340 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[12].x, _152);
        float _342 = _340 * _336;
        float _344 = floor(_342);
        float _346 = -_344;
        float _348 = _342 + _346;
        _350 = _348;
        _352 = true;
    }
    else
    {
        float _354 = float(_118);
        float _356 = 1.0 / _354;
        float _358 = _152 * _356;
        _350 = _358;
    }
    _352 = false;
    float _360 = _350;
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _364 = _360 + _362;
    bool _366 = _360 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _368 = isnan(_360);
    bool _370 = _366 || _368;
    bool _372 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _374 = _370 || _372;
    float _376 = float(_374);
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _380 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _378;
    bool _382 = _360 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _384 = isnan(_360);
    bool _386 = _382 || _384;
    bool _388 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _390 = _386 || _388;
    float _392 = float(_390);
    float _394 = 1.0 / _380;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _398 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _396;
    bool _400 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _402 = _364 * _394;
    float _404 = -_376;
    float _406 = _404 + 1.0;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _410 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _408;
    float _412 = fma(_398, _402, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _414 = _392 * _406;
    float _416 = fma(_410, _402, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _418 = -_392;
    float _420 = _418 + 1.0;
    float _422 = _412 * _414;
    float _424 = _416 * _414;
    float _426 = fma(_420, (*spvDescriptorSet0.vp_c9)._m0[143].x, _422);
    float _428 = fma(_420, (*spvDescriptorSet0.vp_c9)._m0[143].y, _424);
    float _430 = fma(_376, (*spvDescriptorSet0.vp_c9)._m0[144].x, _426);
    float _432 = fma(_376, (*spvDescriptorSet0.vp_c9)._m0[144].y, _428);
    bool _434 = !_400;
    float _452;
    if (!_434)
    {
        float _436 = in.m_66.x;
        float _438 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _440 = _436 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _442 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[11].y, _152);
        float _444 = _442 * _438;
        float _446 = floor(_444);
        float _448 = -_446;
        float _450 = _444 + _448;
        _452 = _450;
        _454 = true;
    }
    else
    {
        float _456 = float(_118);
        float _458 = 1.0 / _456;
        float _460 = _152 * _458;
        _452 = _460;
    }
    _454 = false;
    float _462 = _452;
    float _464 = in.m_68.w;
    float _466 = as_type<float>(int(gl_VertexIndex));
    float _468 = in.m_53.x;
    float _470 = in.m_53.y;
    float _472 = in.m_53.z;
    float _474 = in.m_73.x;
    float _476 = in.m_73.y;
    float _478 = in.m_64.w;
    float _480 = in.m_62.w;
    float _482 = trunc(_464);
    int _484 = int(_482);
    float _486 = in.m_60.w;
    int _488 = _484 << 5;
    uint _491 = uint(int(uint(_488) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_491)];
    float _493 = as_type<float>(_dmw0.x);
    int _495 = _488 + 4;
    uint _497 = uint(int(uint(_495) >> uint(2)));
    float _499 = as_type<float>(_dmw0.y);
    int _501 = _488 + 8;
    uint _503 = uint(int(uint(_501) >> uint(2)));
    float _505 = as_type<float>(_dmw0.z);
    int _507 = _488 + 12;
    uint _509 = uint(int(uint(_507) >> uint(2)));
    float _511 = as_type<float>(_dmw0.w);
    int _513 = as_type<int>(_466) & 1;
    bool _515 = _513 != 0;
    int _517 = as_type<int>(_466) & 2;
    bool _519 = _517 != 0;
    float _521 = _186 * _470;
    float _523 = _430 * _474;
    float _525 = _432 * _476;
    float _527 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    bool _529 = !_515;
    float _531 = _529 ? (-0.5) : 0.5;
    float _533 = fma(_184, _468, _521);
    bool _535 = !_519;
    float _537 = _535 ? (-0.5) : 0.5;
    float _539 = _523 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _541 = _180 * _470;
    float _543 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _531);
    float _545 = _525 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _547 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _537);
    float _549 = fma(_178, _468, _541);
    float _551 = _539 * _543;
    float _553 = _527 * _318;
    float _555 = fma(_188, _472, _533);
    float _557 = _545 * _547;
    float _559 = _527 * _310;
    float _561 = fma(_551, _292, _553);
    float _563 = fma(_182, _472, _549);
    float _565 = _555 + _478;
    float _567 = fma(_551, _284, _559);
    float _569 = -_557;
    float _571 = fma(_569, _330, _561);
    float _573 = _563 + _480;
    float _575 = _174 * _470;
    float _577 = -_557;
    float _579 = fma(_577, _322, _567);
    float _581 = _565 + _571;
    float _583 = _527 * _314;
    float _585 = fma(_172, _468, _575);
    float _587 = _573 + _579;
    float _589 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _591 = _581 + _589;
    float _593 = fma(_176, _472, _585);
    float _595 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _597 = _587 + _595;
    float _599 = _591 * _591;
    float _601 = fma(_551, _288, _583);
    bool _603 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _605 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _607 = _603 || _605;
    bool _609 = isnan(0.5);
    bool _611 = _607 || _609;
    float _613 = _593 + _486;
    float _615 = fma(_597, _597, _599);
    float _617 = -_557;
    float _619 = fma(_617, _326, _601);
    float _621 = sqrt(_615);
    bool _623 = _621 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _625 = _619;
    float _627 = _581;
    float _629 = _621;
    float _631 = _587;
    if (!_623)
    {
        _228 = _587;
    }
    float _633 = _228;
    float _635 = _511 * 2.0;
    float _637 = _493 * 2.0;
    float _639 = _499 * 2.0;
    float _641 = _505 * _635;
    float _643 = _499 * _635;
    float _645 = _493 * _635;
    float _647 = _493 * _493;
    float _649 = -_641;
    float _651 = fma(_499, _637, _649);
    float _653 = fma(_499, _637, _641);
    float _655 = fma(_505, _637, _643);
    float _657 = -_643;
    float _659 = fma(_505, _637, _657);
    float _661 = _613 + _619;
    float _663 = -_645;
    float _665 = fma(_505, _639, _663);
    float _667 = fma(_505, _639, _645);
    float _669 = _499 * _499;
    float _671 = _505 * _505;
    float _673 = _633;
    if (!_623)
    {
        _625 = _661;
    }
    float _675 = _625;
    bool _677 = !_623;
    float _679 = _675;
    if (!_677)
    {
        float _681 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _683 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _685 = _621 + _683;
        float _687 = _661 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _689 = rsqrt(_615);
        float _691 = _685 * _681;
        float _693 = _691 * 0.15915493667125701904296875;
        float _695 = _693 * 6.283185482025146484375;
        float _697 = cos(_695);
        float _699 = _693 * 6.283185482025146484375;
        float _701 = sin(_699);
        float _703 = _697 + (-1.0);
        float _705 = fma(_701, _687, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _707 = _703 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _709 = _689 * _705;
        float _711 = fma(_661, _697, _707);
        float _713 = fma(_597, _709, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _715 = fma(_591, _709, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _679 = _711;
        _673 = _713;
        _627 = _715;
        _629 = _685;
    }
    float _717 = _679;
    float _719 = _673;
    float _721 = _627;
    float _723 = _629;
    float _725 = -_613;
    float _727 = _725 + _717;
    float _729 = -_573;
    float _731 = _729 + _719;
    float _733 = fma(_647, -2.0, 1.0);
    float _735 = -_565;
    float _737 = _735 + _721;
    float _739 = _727 * _314;
    float _741 = _727 * _288;
    float _743 = fma(_669, -2.0, 1.0);
    float _745 = fma(_671, -2.0, _733);
    float _747 = fma(_731, _310, _739);
    float _749 = _727 * _326;
    float _751 = fma(_731, _284, _741);
    float _753 = fma(_671, -2.0, _743);
    float _755 = fma(_737, _318, _747);
    float _757 = fma(_731, _322, _749);
    float _759 = fma(_737, _292, _751);
    float _761 = fma(_669, -2.0, _733);
    float _763 = _755 * _651;
    float _765 = _755 * _745;
    float _767 = _755 * _667;
    float _769 = fma(_737, _330, _757);
    float _771 = fma(_759, _753, _763);
    float _773 = fma(_759, _653, _765);
    float _775 = fma(_759, _659, _767);
    float _777 = fma(_769, _655, _771);
    float _779 = fma(_769, _665, _773);
    float _781 = fma(_769, _761, _775);
    float _783 = _573 + _777;
    float _785 = _613 + _779;
    float _787 = _565 + _781;
    float _789 = _785;
    float _791 = _783;
    float _793 = _787;
    if (!_611)
    {
        float _795 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _797 = _613 + _795;
        float _799 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _801 = _573 + _799;
        float _803 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _805 = _797 * _797;
        float _807 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _809 = _565 + _807;
        float _811 = fma(_801, _801, _805);
        float _813 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _815 = fma(_809, _809, _811);
        float _817 = sqrt(_815);
        float _819 = _803 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _821 = precise::min(_817, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _823 = _821 * _813;
        float _825 = _819 * _823;
        float _827 = fma(_777, _825, _573);
        float _829 = fma(_779, _825, _613);
        float _831 = fma(_781, _825, _565);
        _789 = _829;
        _791 = _827;
        _793 = _831;
    }
    float _833 = _789;
    float _835 = _791;
    float _837 = _793;
    float _839 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _841 = _833 + _839;
    float _843 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _845 = _835 + _843;
    float _847 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _849 = _837 + _847;
    float _851 = _841 * _841;
    float _853 = _833 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _855 = fma(_845, _845, _851);
    float _857 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _859 = fma(_835, (*spvDescriptorSet0.vp_c8)._m0[3].x, _853);
    float _861 = fma(_849, _849, _855);
    float _863 = fma(_837, (*spvDescriptorSet0.vp_c8)._m0[3].z, _859);
    float _865 = rsqrt(_861);
    float _867 = sqrt(_861);
    float _869 = _845 * _865;
    float _871 = _849 * _865;
    float _873 = _841 * _865;
    float _875 = _869 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _877 = _871 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _879 = _875 * _875;
    float _881 = _877 * _877;
    float _883 = _879 + _881;
    float _885 = sqrt(_883);
    bool _887 = _885 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _889 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _891 = _885 + _889;
    float _893 = _661;
    float _895 = _891;
    float _897 = _865;
    float _899 = _877;
    if (_887)
    {
        float _901 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _893 = _901;
    }
    float _903 = _893;
    if (_887)
    {
        float _905 = _891 * _903;
        _895 = _905;
    }
    float _907 = _895;
    if (_887)
    {
        float _909 = _907 * 0.15915493667125701904296875;
        _631 = _909;
    }
    float _911 = _631;
    float _913 = _723;
    float _915 = _911;
    if (_887)
    {
        float _917 = _911 * 6.283185482025146484375;
        float _919 = sin(_917);
        _913 = _919;
    }
    float _921 = _913;
    float _923 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _925 = precise::max(0.0, _923);
    float _927 = _601;
    float _929 = _925;
    if (_887)
    {
        float _931 = _911 * 6.283185482025146484375;
        float _933 = cos(_931);
        _927 = _933;
    }
    float _935 = _927;
    float _937 = -_873;
    float _939 = -_925;
    float _941 = fma(_937, (*spvDescriptorSet0.vp_c15)._m0[24].y, _939);
    float _943 = _923;
    if (_887)
    {
        float _945 = rsqrt(_883);
        _943 = _945;
    }
    float _947 = _943;
    if (_887)
    {
        float _949 = _941 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _897 = _949;
    }
    float _951 = _897;
    float _953 = _951;
    if (!_887)
    {
        _915 = _879;
    }
    float _955 = _915;
    float _957 = _921;
    float _959 = _955;
    if (_887)
    {
        float _961 = fma(_921, _951, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _929 = _961;
    }
    float _963 = _929;
    float _965 = _963;
    if (!_887)
    {
        _957 = _941;
    }
    float _967 = _957;
    float _969 = _967;
    float _971 = _935;
    if (_887)
    {
        float _973 = _935 + (-1.0);
        _953 = _973;
    }
    float _975 = _953;
    float _977 = _975;
    if (_887)
    {
        float _979 = _975 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _977 = _979;
    }
    float _981 = _977;
    float _983 = 0.0;
    if (_887)
    {
        float _985 = _947 * _963;
        _983 = _985;
    }
    float _987 = _983;
    if (!_887)
    {
        _965 = _875;
    }
    float _989 = _965;
    float _991 = _989;
    if (_887)
    {
        float _993 = fma(_941, _935, _981);
        _969 = _993;
    }
    float _995 = _969;
    if (!_887)
    {
        _971 = _881;
    }
    float _997 = _971;
    float _999 = _997;
    if (_887)
    {
        float _1001 = _875 * _987;
        _991 = _1001;
    }
    float _1003 = _991;
    if (_887)
    {
        float _1005 = _877 * _987;
        _899 = _1005;
    }
    float _1007 = _899;
    float _1009 = fma(_565, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    if (_887)
    {
        float _1011 = _1003 * _1003;
        _959 = _1011;
    }
    float _1013 = _959;
    if (_887)
    {
        float _1015 = _1007 * _1007;
        _999 = _1015;
    }
    float _1017 = _999;
    float _1019 = fma(_995, _995, _1013);
    float _1021 = _833 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1023 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1025 = fma(_867, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1023);
    float _1027 = precise::clamp(_1025, 0.0, 1.0);
    float _1029 = fma(_573, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1031 = _1019 + _1017;
    float _1033 = fma(_835, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1021);
    float _1035 = _833 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1037 = -_1027;
    float _1039 = _1037 + 1.0;
    float _1041 = floor(_1029);
    float _1043 = fma(_837, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1033);
    float _1045 = _833 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1047 = fma(_835, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1035);
    float _1049 = _1043 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1051 = fma(_835, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1045);
    float _1053 = fma(_837, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1047);
    float _1055 = rsqrt(_1031);
    float _1057 = _1049 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1059 = fma(_837, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1051);
    float _1061 = _1053 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1063 = -_1057;
    float _1065 = fma(_1063, _857, 1.0);
    float _1067 = _1059 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1069 = _1061 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1071 = abs(_1039);
    float _1073 = log2(_1071);
    float _1075 = _863 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1077 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1069);
    float _1079 = _1055 * _1003;
    float _1081 = _1055 * _995;
    float _1083 = floor(_1009);
    float _1085 = _1055 * _1007;
    float _1087 = _1079 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1089 = fma(_1049, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1077);
    float _1091 = -_1087;
    float _1093 = fma(_1081, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1091);
    float _1095 = _1073 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1097 = log2(_1065);
    float _1099 = fma(_1075, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1089);
    float _1101 = -_1085;
    float _1103 = fma(_1101, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1093);
    float _1105 = _1061 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1107 = exp2(_1095);
    float _1109 = -_1041;
    float _1111 = _1029 + _1109;
    float _1113 = fma(_1103, -0.5, 0.5);
    float _1115 = _1061 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1117 = -_1083;
    float _1119 = _1009 + _1117;
    float _1121 = fma(_1103, 0.5, 0.5);
    float _1123 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1105);
    float _1125 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1115);
    float _1127 = 1.0 / _1099;
    float _1129 = fma(_1121, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1131 = _1081 + 1.0;
    float _1133 = fma(_1049, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1125);
    float _1135 = fma(_1049, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1123);
    float _1137 = fma(_1121, _1129, -0.212114393711090087890625);
    float _1139 = _1097 * 0.693147182464599609375;
    float _1141 = fma(_1075, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1133);
    float _1143 = sqrt(_1113);
    float _1145 = -_1081;
    float _1147 = fma(_1107, _1131, _1145);
    float _1149 = fma(_1075, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1135);
    float _1151 = fma(_1121, _1137, 1.570728778839111328125);
    float _1153 = _1139 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1155 = fma(_1147, 0.5, 0.5);
    float _1157 = _1141 * _1127;
    float _1159 = _1149 * _1127;
    float _1161 = fma(_1157, 0.5, 0.5);
    float _1163 = fma(_1159, -0.5, 0.5);
    float _1165 = _1143 * 0.636619746685028076171875;
    float2 _3711 = float2(_1111, _1119);
    float _1167 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3711, float2(0.0), isnan(_3711)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3711, float2(0.0), isnan(_3711)), level(0.0)).x;
    float3 _3722 = float3(_1161, _1163, _1153);
    float _1169 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3722, float3(0.0), isnan(_3722)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3722, float3(0.0), isnan(_3722)), level(0.0)).x;
    float3 _3733 = float3(_1161, _1163, _1153);
    float4 _1172 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3733, float3(0.0), isnan(_3733)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3733, float3(0.0), isnan(_3733)), level(0.0)).xyzw;
    float _1174 = _1172.x;
    float _1176 = _1172.y;
    float _1178 = _1172.z;
    float _1180 = _1172.w;
    float _1182 = -_1151;
    float _1184 = fma(_1165, _1182, 1.0);
    float2 _3754 = float2(_1184, _1155);
    float3 _1188 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3754, float2(0.0), isnan(_3754)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3754, float2(0.0), isnan(_3754)), level(0.0)).xyz;
    float _1190 = _1188.x;
    float _1192 = _1188.y;
    float _1194 = _1188.z;
    float _1196 = _613 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1198 = _613 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1200 = _531 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1202 = _1061 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1204 = fma(_573, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1196);
    out.m_75.x = _845;
    out.m_75.y = _841;
    out.m_75.z = _849;
    float _1206 = fma(_1200, _284, _310);
    float _1208 = fma(_565, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1204);
    float _1210 = in.m_66.x;
    float _1212 = in.m_66.y;
    float _1214 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1216 = _1214 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1218 = _1208 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1220 = fma(_573, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1198);
    float _1222 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1224 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1222;
    float _1226 = 1.0 / _1218;
    float _1228 = fma(_565, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1220);
    bool _1230 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1232 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1234 = _1230 || _1232;
    bool _1236 = isnan(0.5);
    bool _1238 = _1234 || _1236;
    float _1240 = fma(_1200, _288, _314);
    float _1242 = _1228 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1244 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1246 = _462 + _1244;
    float _1248 = 1.0 / _1216;
    float _1250 = _1242 + _1218;
    float _1252 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.300000011920928955078125;
    bool _1254 = _462 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1256 = isnan(_462);
    bool _1258 = _1254 || _1256;
    bool _1260 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1262 = _1258 || _1260;
    float _1264 = float(_1262);
    float _1266 = fma(_1200, _292, _318);
    float _1268 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1202);
    float _1270 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1272 = _1250 * _1226;
    float _1274 = _1272 * 0.5;
    bool _1276 = _1212 > 0.5;
    float _1278 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1280 = fma(_1252, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1278);
    float _1282 = _1270 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1284 = _1210 > 0.5;
    float _1286 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1288 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1286);
    float _1290 = _1224 * _1248;
    int _1292 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1294 = _1292 != 0;
    int _1296 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1298 = _1296 != 0;
    float _1300 = 1.0 / _1288;
    float _1302 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _1304 = _462 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1306 = isnan(_462);
    bool _1308 = _1304 || _1306;
    bool _1310 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1312 = _1308 || _1310;
    float _1314 = float(_1312);
    float _1316 = fma(_1290, _1246, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1318 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1320 = _1302 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1322 = -_1314;
    float _1324 = _1322 + 1.0;
    float _1326 = -_531;
    int _1328 = _1284 ? as_type<int>(_1326) : as_type<int>(_531);
    float _1330 = _1318 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1332 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1334 = fma(_1252, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1332);
    bool _1336 = 0.0 != (*spvDescriptorSet0.vp_c11)._m0[20].z;
    bool _1338 = isnan(0.0);
    bool _1340 = _1336 || _1338;
    bool _1342 = isnan((*spvDescriptorSet0.vp_c11)._m0[20].z);
    bool _1344 = _1340 || _1342;
    bool _1346 = !_1294;
    float _1348 = _1346 ? _531 : as_type<float>(_1328);
    out.m_77.x = _1330;
    out.m_77.y = _1320;
    out.m_77.z = _1282;
    float _1350 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1352 = _1300 * _1350;
    float _1354 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _1334);
    float _1356 = -_537;
    int _1358 = _1276 ? as_type<int>(_1356) : as_type<int>(_537);
    float _1360 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1362 = _1348 + 0.5;
    float _1364 = _565 + _1354;
    float _1366 = _1264 * _1324;
    float _1368 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _1280);
    float _1370 = abs(_1352);
    float _1372 = log2(_1370);
    float _1374 = -_1264;
    float _1376 = _1374 + 1.0;
    float _1378 = _1316 * _1366;
    float _1380 = _573 + _1368;
    float _1382 = _537 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _1384 = !_1298;
    float _1386 = _1384 ? _537 : as_type<float>(_1358);
    float _1388 = -_1364;
    float _1390 = _1388 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _1392 = -_1380;
    float _1394 = _1392 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _1396 = -_1382;
    float _1398 = fma(_1396, _322, _1206);
    float _1400 = (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _1402 = _1364;
    float _1404 = _1398;
    if (_1344)
    {
        float _1406 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.20000000298023223876953125;
        _1400 = _1406;
    }
    float _1408 = _1400;
    float _1410 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1412 = fma(_1376, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1378);
    float _1414 = precise::min(_1380, _1394);
    float _1416 = -_1386;
    float _1418 = _1416 + 0.5;
    float _1420 = precise::min(_1364, _1390);
    float _1422 = -_1382;
    float _1424 = fma(_1422, _326, _1240);
    float _1426 = _1372 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    if (_1344)
    {
        float _1428 = precise::min(_1408, 20.0);
        _1402 = _1428;
    }
    float _1430 = _1402;
    float _1432 = _1362 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1434 = precise::min(_1414, _1420);
    float _1436 = fma(_1314, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1412);
    float _1438 = exp2(_1426);
    float _1440 = _1418 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1442 = _1432 * _1360;
    float _1444 = _1440 * _1410;
    float _1446 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1448 = _1430;
    float _1450 = (*spvDescriptorSet0.vp_c9)._m0[107].z;
    if (_1344)
    {
        float _1452 = 1.0 / _1430;
        _1448 = _1452;
    }
    float _1454 = _1448;
    float _1456 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1458 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1460 = -_1382;
    float _1462 = fma(_1460, _330, _1266);
    float _1464 = _1446 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1466 = _1456 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1468 = _1458 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1470 = _1436 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1472 = fma(_1438, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1474 = precise::clamp(_1472, 0.0, 1.0);
    out.m_79.x = _1442;
    out.m_79.y = _1444;
    float _1476 = _1470;
    if (!_1344)
    {
        _1450 = 1.0;
    }
    float _1478 = _1450;
    float _1480 = _1424 * _745;
    float _1482 = fma(_1474, -2.0, 3.0);
    float _1484 = in.m_81.x;
    float _1486 = _1474 * _1474;
    float _1488 = _1478;
    if (_1344)
    {
        float _1490 = _1434 * _1454;
        float _1492 = precise::clamp(_1490, 0.0, 1.0);
        _1488 = _1492;
    }
    float _1494 = _1488;
    float _1496 = _1424 * _651;
    out.m_83.x = _1464;
    out.m_83.y = _1466;
    out.m_83.z = _1468;
    out.m_83.w = _1470;
    float _1498 = _1486 * _1482;
    float _1500 = _1424 * _667;
    float _1502 = fma(_1049, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1268);
    float _1504 = fma(_1398, _753, _1496);
    float _1506 = fma(_1398, _653, _1480);
    float _1508 = fma(_1398, _659, _1500);
    float _1510 = fma(_1075, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1502);
    if (_1238)
    {
        _1404 = 1.0;
    }
    float _1512 = _1404;
    float _1514 = _1073 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1516 = -_1498;
    float _1518 = _1516 + 1.0;
    float _1520 = _1510 + _1099;
    float _1522 = _1512;
    if (_1238)
    {
        _1476 = 1.0;
    }
    float _1524 = _1476;
    float _1526 = fma(_1518, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1498);
    float _1528 = exp2(_1514);
    bool _1530 = _1352 <= 8000.0;
    bool _1532 = isnan(_1352);
    bool _1534 = _1530 || _1532;
    bool _1536 = isnan(8000.0);
    bool _1538 = _1534 || _1536;
    float _1540 = float(_1538);
    float _1542 = _1520 * 0.5;
    float _1544 = _1540 * _1526;
    float _1546 = _1524;
    if (!_1238)
    {
        float _1548 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1550 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1552 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1550;
        float _1554 = _1548 * 0.15915493667125701904296875;
        float _1556 = _1554 * 6.283185482025146484375;
        float _1558 = cos(_1556);
        float _1560 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1562 = _1560 * 0.15915493667125701904296875;
        float _1564 = _1554 * 6.283185482025146484375;
        float _1566 = sin(_1564);
        float _1568 = 1.0 / _1558;
        float _1570 = _1562 * 6.283185482025146484375;
        float _1572 = cos(_1570);
        float _1574 = _1566 * _1568;
        float _1576 = _1562 * 6.283185482025146484375;
        float _1578 = sin(_1576);
        float _1580 = _1572 * _1574;
        float _1582 = 1.0 / _1552;
        float _1584 = 1.0 / _1580;
        float _1586 = _1578 * _1584;
        float _1588 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1590 = fma(_1352, _1586, _1588);
        float _1592 = _1590 * _1582;
        float _1594 = precise::clamp(_1592, 0.0, 1.0);
        _1522 = _1594;
    }
    float _1596 = _1522;
    if (!_1238)
    {
        float _1598 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1600 = _1598 * 0.15915493667125701904296875;
        float _1602 = _1600 * 6.283185482025146484375;
        float _1604 = cos(_1602);
        float _1606 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1608 = _1606 * 0.15915493667125701904296875;
        float _1610 = _1600 * 6.283185482025146484375;
        float _1612 = sin(_1610);
        float _1614 = 1.0 / _1604;
        float _1616 = _1608 * 6.283185482025146484375;
        float _1618 = cos(_1616);
        float _1620 = _1612 * _1614;
        float _1622 = _1608 * 6.283185482025146484375;
        float _1624 = sin(_1622);
        float _1626 = _1618 * _1620;
        float _1628 = 1.0 / _1626;
        float _1630 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1632 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1630;
        float _1634 = 1.0 / _1632;
        float _1636 = _1624 * _1628;
        float _1638 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1640 = fma(_1352, _1636, _1638);
        float _1642 = _1640 * _1634;
        float _1644 = precise::clamp(_1642, 0.0, 1.0);
        float _1646 = -_1644;
        float _1648 = _1646 + 1.0;
        _1546 = _1648;
    }
    float _1650 = _1546;
    float _1652 = _1544 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1654 = -_1167;
    float _1656 = _1654 + 1.0;
    float _1658 = fma(_1462, _665, _1506);
    float _1660 = -_1528;
    float _1662 = _1660 + 1.0;
    float _1664 = fma(_1462, _655, _1504);
    float _1666 = fma(_1462, _761, _1508);
    float _1668 = _1656 * _1652;
    float _1670 = precise::clamp(_1668, 0.0, 1.0);
    float _1672 = _1662 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_85.z = _1542;
    out.m_85.w = _1099;
    bool _1674 = _867 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1676 = isnan(_867);
    bool _1678 = _1674 || _1676;
    bool _1680 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1682 = _1678 || _1680;
    float _1684 = _1672 * _1169;
    out.gl_Position.x = _1141;
    out.gl_Position.y = _1149;
    out.gl_Position.z = _1510;
    out.gl_Position.w = _1099;
    float _1686 = _1194 * _1684;
    out.m_87.x = _1664;
    out.m_87.y = _1658;
    out.m_87.z = _1666;
    float _1688 = -_1670;
    float _1690 = fma(_1688, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1692 = _1180 * _1684;
    float _1694 = fma(_1180, _1686, _1178);
    out.m_89.x = _835;
    out.m_89.y = _833;
    out.m_89.z = _837;
    float _1696 = _1690 * _1484;
    float _1698 = -_1672;
    float _1700 = _1698 + 1.0;
    float _1702 = fma(_1190, _1692, _1174);
    float _1704 = fma(_1192, _1692, _1176);
    float _1706 = _1696 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1708 = _1180 * _1700;
    float _1710 = _1596 * _1650;
    float _1712 = _1692;
    float _1714 = _1696;
    if (!_1682)
    {
        _1712 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1716 = _1712;
    out.m_91.x = _1706;
    float _1718 = _1710 * _1494;
    float _1720 = _1718;
    float _1722 = _1716;
    float _1724 = _1716;
    if (!_1682)
    {
        _1714 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1726 = _1714;
    out.m_93.x = _1702;
    out.m_93.y = _1704;
    out.m_93.z = _1694;
    out.m_93.w = _1708;
    float _1728 = _1718 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1730 = _1726;
    float _1732 = _1726;
    if (!_1682)
    {
        _1720 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1734 = _1720;
    bool _1736 = !_1682;
    float _1738 = _1734;
    float _1740 = _1734;
    if (!_1736)
    {
        bool _1742 = _867 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1744 = isnan(_867);
        bool _1746 = _1742 || _1744;
        bool _1748 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1750 = _1746 || _1748;
        if (!_1750)
        {
            float _1752 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1754 = _867 + _1752;
            float _1756 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1758 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1756;
            float _1760 = 1.0 / _1758;
            float _1762 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1764 = _1762 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1766 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1768 = _1766 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1770 = _1754 * _1760;
            float _1772 = precise::clamp(_1770, 0.0, 1.0);
            float _1774 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1776 = _1774 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1778 = fma(_1772, _1768, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1780 = fma(_1772, _1776, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1782 = fma(_1772, _1764, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            _1740 = _1782;
            _1724 = _1780;
            _1732 = _1778;
            _1784 = true;
        }
        else
        {
            bool _1786 = _867 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1788 = isnan(_867);
            bool _1790 = _1786 || _1788;
            bool _1792 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1794 = _1790 || _1792;
            if (!_1794)
            {
                _1722 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1796 = _1722;
            _1724 = _1796;
            if (!_1794)
            {
                _1738 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1798 = _1738;
            _1740 = _1798;
            if (!_1794)
            {
                _1730 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1800 = _1730;
            bool _1802 = !_1794;
            _1732 = _1800;
            if (!_1802)
            {
                bool _1804 = _867 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1806 = isnan(_867);
                bool _1808 = _1804 || _1806;
                bool _1810 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1812 = _1808 || _1810;
                if (!_1812)
                {
                    float _1814 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1816 = _867 + _1814;
                    float _1818 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1820 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1818;
                    float _1822 = 1.0 / _1820;
                    float _1824 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1826 = _1824 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1828 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1830 = _1828 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1832 = _1816 * _1822;
                    float _1834 = precise::clamp(_1832, 0.0, 1.0);
                    float _1836 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1838 = _1836 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1840 = fma(_1834, _1830, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1842 = fma(_1834, _1838, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1844 = fma(_1834, _1826, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    _1740 = _1844;
                    _1724 = _1842;
                    _1732 = _1840;
                    _1784 = true;
                }
                else
                {
                    _1740 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1724 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1732 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _1784 = false;
    float _1846 = _1740;
    float _1848 = _1724;
    float _1850 = _1732;
    float _1852 = _1728 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_95.x = 0.0;
    float _1854 = _1846 * 0.586610972881317138671875;
    bool _1856 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_56.x = _1852;
    float _1858 = fma(_1848, 0.298911988735198974609375, _1854);
    bool _1860 = _1596 > 0.0;
    bool _1862 = isnan(_1596);
    bool _1864 = _1860 || _1862;
    bool _1866 = isnan(0.0);
    bool _1868 = _1864 || _1866;
    float _1870 = fma(_1850, 0.114477999508380889892578125, _1858);
    bool _1872 = _1650 <= 0.0;
    bool _1874 = !_1868;
    bool _1876 = _1872 || _1874;
    out.m_97.x = 0.0;
    float _1878 = -_1870;
    float _1880 = _1878 + _1848;
    float _1882 = -_1870;
    float _1884 = _1882 + _1846;
    float _1886 = -_1870;
    float _1888 = _1886 + _1850;
    float _1890 = fma(_1880, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1870);
    float _1892 = fma(_1884, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1870);
    float _1894 = fma(_1888, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1870);
    bool _1896 = !_1856;
    if (!_1896)
    {
        float _1898 = -_833;
        float _1900 = _1898 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _1902 = -_835;
        float _1904 = _1902 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _1906 = -_837;
        float _1908 = _1906 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _1910 = _1900 * _1900;
        float _1912 = fma(_1904, _1904, _1910);
        float _1914 = fma(_1908, _1908, _1912);
        float _1916 = rsqrt(_1914);
        float _1918 = _1900 * _1916;
        float _1920 = _1904 * _1916;
        float _1922 = _1908 * _1916;
        float _1924 = -_873;
        float _1926 = _1924 + _1918;
        float _1928 = -_869;
        float _1930 = _1928 + _1920;
        float _1932 = sqrt(_1914);
        float _1934 = -_871;
        float _1936 = _1934 + _1922;
        float _1938 = _1926 * _1926;
        float _1940 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
        float _1942 = precise::clamp(_1940, 0.0, 1.0);
        float _1944 = fma(_1930, _1930, _1938);
        float _1946 = _1942 * _1942;
        float _1948 = fma(_1936, _1936, _1944);
        float _1950 = _1946 + (-1.0);
        float _1952 = rsqrt(_1948);
        float _1954 = -_1932;
        float _1956 = _1954 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _1958 = _1956 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _1960 = precise::clamp(_1958, 0.0, 1.0);
        float _1962 = _1920 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _1964 = abs(_1960);
        float _1966 = log2(_1964);
        float _1968 = _1926 * _1952;
        float _1970 = _1930 * _1952;
        float _1972 = _1936 * _1952;
        float _1974 = _1658 * _1968;
        float _1976 = _1658 * _1918;
        float _1978 = fma(_1664, _1970, _1974);
        float _1980 = fma(_1664, _1920, _1976);
        float _1982 = fma(_1666, _1972, _1978);
        float _1984 = precise::clamp(_1982, 0.0, 1.0);
        float _1986 = _1966 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _1988 = fma(_1666, _1922, _1980);
        float _1990 = precise::clamp(_1988, 0.0, 1.0);
        float _1992 = _1984 * _1984;
        float _1994 = exp2(_1986);
        float _1996 = fma(_1992, _1950, 1.0);
        float _1998 = -_1918;
        float _2000 = -_1962;
        float _2002 = fma(_1998, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2000);
        float _2004 = _1996 * _1996;
        float _2006 = -_1922;
        float _2008 = fma(_2006, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2002);
        float _2010 = 1.0 / _2004;
        float _2012 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2014 = _2008 + _2012;
        float _2016 = _2014 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2018 = precise::clamp(_2016, 0.0, 1.0);
        float _2020 = _1994 * _2018;
        float _2022 = _1990 * _2020;
        float _2024 = _1946 * _2010;
        float _2026 = _2022 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2028 = _2022 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2030 = _2022 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        float _2032 = _2022 * _2024;
        float _2034 = _2032 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2036 = _2032 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2038 = _2032 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_95.x = _2026;
        out.m_95.y = _2028;
        out.m_95.z = _2030;
        out.m_97.x = _2034;
        out.m_97.y = _2036;
        out.m_97.z = _2038;
    }
    out.m_99.x = _1890;
    out.m_99.y = _1892;
    out.m_99.z = _1894;
    if (!_1876)
    {
        return out;
    }
    out.m_56.x = 0.0;
    float _2040 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2040;
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
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1784 = false;
    bool _454 = false;
    bool _352 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _113 = in.m_53.w;
    float _115 = trunc(_113);
    int _118 = int(_115);
    bool _122 = _118 >= 1;
    float _124 = 0.0;
    if (!_122)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _126 = _124;
    float _128 = _126;
    if (!_122)
    {
        out.m_56.x = 0.0;
    }
    int _130 = 0;
    if (!_122)
    {
        float _132 = _126 * 5.0;
        _130 = as_type<int>(_132);
    }
    int _134 = _130;
    int _136 = _134;
    if (!_122)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2097 = as_type<float>(_134);
        out.gl_Position.z = _2097;
    }
    if (!_122)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _138 = in.m_58.w;
    bool _140 = _138 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _142 = isnan(_138);
    bool _144 = _140 || _142;
    bool _146 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _148 = _144 || _146;
    float _150 = -_138;
    float _152 = _150 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _154 = 0.0;
    if (_148)
    {
        float _156 = float(_118);
        _154 = _156;
    }
    float _158 = _154;
    bool _160 = _152 >= _158;
    bool _162 = !_148;
    bool _164 = _160 || _162;
    if (_164)
    {
        _128 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _166 = _128;
    if (_164)
    {
        out.m_56.x = 0.0;
    }
    if (_164)
    {
        float _168 = _166 * 5.0;
        _136 = as_type<int>(_168);
    }
    int _170 = _136;
    if (_164)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2165 = as_type<float>(_170);
        out.gl_Position.z = _2165;
    }
    if (_164)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _172 = in.m_60.x;
    float _174 = in.m_60.y;
    float _176 = in.m_60.z;
    float _178 = in.m_62.x;
    float _180 = in.m_62.y;
    float _182 = in.m_62.z;
    float _184 = in.m_64.x;
    float _186 = in.m_64.y;
    float _188 = in.m_64.z;
    float _190 = _172 * _172;
    float _192 = _174 * _174;
    float _194 = _176 * _176;
    float _196 = fma(_178, _178, _190);
    float _198 = fma(_180, _180, _192);
    float _200 = fma(_182, _182, _194);
    float _202 = fma(_184, _184, _196);
    float _204 = fma(_186, _186, _198);
    float _206 = fma(_188, _188, _200);
    float _208 = sqrt(_202);
    float _210 = sqrt(_204);
    float _212 = sqrt(_206);
    bool _214 = _208 > 0.0;
    bool _216 = _210 > 0.0;
    float _218 = _200;
    float _220 = _208;
    float _222 = _202;
    float _224 = _210;
    float _226 = _204;
    float _228 = _176;
    if (_214)
    {
        float _230 = rsqrt(_202);
        _218 = _230;
    }
    float _232 = _218;
    float _234 = 0.0;
    float _236 = 0.0;
    if (!_214)
    {
        _234 = 0.0;
        _236 = 0.0;
    }
    float _238 = _234;
    float _240 = _236;
    bool _242 = _212 > 0.0;
    float _244 = 0.0;
    float _246 = _238;
    float _248 = _240;
    float _250 = _212;
    if (!_214)
    {
        _244 = 0.0;
    }
    float _252 = _244;
    float _254 = _252;
    if (!_216)
    {
        _220 = 0.0;
    }
    float _256 = _220;
    float _258 = 0.0;
    float _260 = _256;
    if (_216)
    {
        float _262 = rsqrt(_204);
        _258 = _262;
    }
    float _264 = _258;
    if (!_242)
    {
        _222 = 0.0;
        _224 = 0.0;
    }
    float _266 = _222;
    float _268 = _224;
    float _270 = 0.0;
    float _272 = _266;
    float _274 = _268;
    if (_242)
    {
        float _276 = rsqrt(_206);
        _270 = _276;
    }
    float _278 = _270;
    float _280 = _232;
    if (_214)
    {
        float _282 = _232 * _178;
        _246 = _282;
    }
    float _284 = _246;
    if (_214)
    {
        float _286 = _232 * _172;
        _248 = _286;
    }
    float _288 = _248;
    if (_214)
    {
        float _290 = _232 * _184;
        _254 = _290;
    }
    float _292 = _254;
    bool _294 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    if (!_216)
    {
        _250 = 0.0;
        _280 = 0.0;
    }
    float _296 = _250;
    float _298 = _280;
    float _300 = _298;
    float _302 = _296;
    if (!_242)
    {
        _226 = 0.0;
    }
    float _304 = _226;
    float _306 = _304;
    if (_216)
    {
        float _308 = _264 * _180;
        _260 = _308;
    }
    float _310 = _260;
    if (_216)
    {
        float _312 = _264 * _174;
        _300 = _312;
    }
    float _314 = _300;
    if (_216)
    {
        float _316 = _264 * _186;
        _302 = _316;
    }
    float _318 = _302;
    if (_242)
    {
        float _320 = _278 * _182;
        _272 = _320;
    }
    float _322 = _272;
    if (_242)
    {
        float _324 = _278 * _176;
        _274 = _324;
    }
    float _326 = _274;
    if (_242)
    {
        float _328 = _278 * _188;
        _306 = _328;
    }
    float _330 = _306;
    bool _332 = !_294;
    float _350;
    if (!_332)
    {
        float _334 = in.m_66.x;
        float _336 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _338 = _334 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _340 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[12].x, _152);
        float _342 = _340 * _336;
        float _344 = floor(_342);
        float _346 = -_344;
        float _348 = _342 + _346;
        _350 = _348;
        _352 = true;
    }
    else
    {
        float _354 = float(_118);
        float _356 = 1.0 / _354;
        float _358 = _152 * _356;
        _350 = _358;
    }
    _352 = false;
    float _360 = _350;
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _364 = _360 + _362;
    bool _366 = _360 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _368 = isnan(_360);
    bool _370 = _366 || _368;
    bool _372 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _374 = _370 || _372;
    float _376 = float(_374);
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _380 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _378;
    bool _382 = _360 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _384 = isnan(_360);
    bool _386 = _382 || _384;
    bool _388 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _390 = _386 || _388;
    float _392 = float(_390);
    float _394 = 1.0 / _380;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _398 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _396;
    bool _400 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _402 = _364 * _394;
    float _404 = -_376;
    float _406 = _404 + 1.0;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _410 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _408;
    float _412 = fma(_398, _402, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _414 = _392 * _406;
    float _416 = fma(_410, _402, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _418 = -_392;
    float _420 = _418 + 1.0;
    float _422 = _412 * _414;
    float _424 = _416 * _414;
    float _426 = fma(_420, (*spvDescriptorSet0.vp_c9)._m0[143].x, _422);
    float _428 = fma(_420, (*spvDescriptorSet0.vp_c9)._m0[143].y, _424);
    float _430 = fma(_376, (*spvDescriptorSet0.vp_c9)._m0[144].x, _426);
    float _432 = fma(_376, (*spvDescriptorSet0.vp_c9)._m0[144].y, _428);
    bool _434 = !_400;
    float _452;
    if (!_434)
    {
        float _436 = in.m_66.x;
        float _438 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _440 = _436 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _442 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[11].y, _152);
        float _444 = _442 * _438;
        float _446 = floor(_444);
        float _448 = -_446;
        float _450 = _444 + _448;
        _452 = _450;
        _454 = true;
    }
    else
    {
        float _456 = float(_118);
        float _458 = 1.0 / _456;
        float _460 = _152 * _458;
        _452 = _460;
    }
    _454 = false;
    float _462 = _452;
    float _464 = in.m_68.w;
    float _466 = as_type<float>(int(gl_VertexIndex));
    float _468 = in.m_53.x;
    float _470 = in.m_53.y;
    float _472 = in.m_53.z;
    float _474 = in.m_73.x;
    float _476 = in.m_73.y;
    float _478 = in.m_64.w;
    float _480 = in.m_62.w;
    float _482 = trunc(_464);
    int _484 = int(_482);
    float _486 = in.m_60.w;
    int _488 = _484 << 5;
    uint _491 = uint(int(uint(_488) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_491)];
    float _493 = as_type<float>(_dmw0.x);
    int _495 = _488 + 4;
    uint _497 = uint(int(uint(_495) >> uint(2)));
    float _499 = as_type<float>(_dmw0.y);
    int _501 = _488 + 8;
    uint _503 = uint(int(uint(_501) >> uint(2)));
    float _505 = as_type<float>(_dmw0.z);
    int _507 = _488 + 12;
    uint _509 = uint(int(uint(_507) >> uint(2)));
    float _511 = as_type<float>(_dmw0.w);
    int _513 = as_type<int>(_466) & 1;
    bool _515 = _513 != 0;
    int _517 = as_type<int>(_466) & 2;
    bool _519 = _517 != 0;
    float _521 = _186 * _470;
    float _523 = _430 * _474;
    float _525 = _432 * _476;
    float _527 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    bool _529 = !_515;
    float _531 = _529 ? (-0.5) : 0.5;
    float _533 = fma(_184, _468, _521);
    bool _535 = !_519;
    float _537 = _535 ? (-0.5) : 0.5;
    float _539 = _523 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _541 = _180 * _470;
    float _543 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _531);
    float _545 = _525 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _547 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _537);
    float _549 = fma(_178, _468, _541);
    float _551 = _539 * _543;
    float _553 = _527 * _318;
    float _555 = fma(_188, _472, _533);
    float _557 = _545 * _547;
    float _559 = _527 * _310;
    float _561 = fma(_551, _292, _553);
    float _563 = fma(_182, _472, _549);
    float _565 = _555 + _478;
    float _567 = fma(_551, _284, _559);
    float _569 = -_557;
    float _571 = fma(_569, _330, _561);
    float _573 = _563 + _480;
    float _575 = _174 * _470;
    float _577 = -_557;
    float _579 = fma(_577, _322, _567);
    float _581 = _565 + _571;
    float _583 = _527 * _314;
    float _585 = fma(_172, _468, _575);
    float _587 = _573 + _579;
    float _589 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _591 = _581 + _589;
    float _593 = fma(_176, _472, _585);
    float _595 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _597 = _587 + _595;
    float _599 = _591 * _591;
    float _601 = fma(_551, _288, _583);
    bool _603 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _605 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _607 = _603 || _605;
    bool _609 = isnan(0.5);
    bool _611 = _607 || _609;
    float _613 = _593 + _486;
    float _615 = fma(_597, _597, _599);
    float _617 = -_557;
    float _619 = fma(_617, _326, _601);
    float _621 = sqrt(_615);
    bool _623 = _621 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _625 = _619;
    float _627 = _581;
    float _629 = _621;
    float _631 = _587;
    if (!_623)
    {
        _228 = _587;
    }
    float _633 = _228;
    float _635 = _511 * 2.0;
    float _637 = _493 * 2.0;
    float _639 = _499 * 2.0;
    float _641 = _505 * _635;
    float _643 = _499 * _635;
    float _645 = _493 * _635;
    float _647 = _493 * _493;
    float _649 = -_641;
    float _651 = fma(_499, _637, _649);
    float _653 = fma(_499, _637, _641);
    float _655 = fma(_505, _637, _643);
    float _657 = -_643;
    float _659 = fma(_505, _637, _657);
    float _661 = _613 + _619;
    float _663 = -_645;
    float _665 = fma(_505, _639, _663);
    float _667 = fma(_505, _639, _645);
    float _669 = _499 * _499;
    float _671 = _505 * _505;
    float _673 = _633;
    if (!_623)
    {
        _625 = _661;
    }
    float _675 = _625;
    bool _677 = !_623;
    float _679 = _675;
    if (!_677)
    {
        float _681 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _683 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _685 = _621 + _683;
        float _687 = _661 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _689 = rsqrt(_615);
        float _691 = _685 * _681;
        float _693 = _691 * 0.15915493667125701904296875;
        float _695 = _693 * 6.283185482025146484375;
        float _697 = cos(_695);
        float _699 = _693 * 6.283185482025146484375;
        float _701 = sin(_699);
        float _703 = _697 + (-1.0);
        float _705 = fma(_701, _687, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _707 = _703 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _709 = _689 * _705;
        float _711 = fma(_661, _697, _707);
        float _713 = fma(_597, _709, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _715 = fma(_591, _709, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _679 = _711;
        _673 = _713;
        _627 = _715;
        _629 = _685;
    }
    float _717 = _679;
    float _719 = _673;
    float _721 = _627;
    float _723 = _629;
    float _725 = -_613;
    float _727 = _725 + _717;
    float _729 = -_573;
    float _731 = _729 + _719;
    float _733 = fma(_647, -2.0, 1.0);
    float _735 = -_565;
    float _737 = _735 + _721;
    float _739 = _727 * _314;
    float _741 = _727 * _288;
    float _743 = fma(_669, -2.0, 1.0);
    float _745 = fma(_671, -2.0, _733);
    float _747 = fma(_731, _310, _739);
    float _749 = _727 * _326;
    float _751 = fma(_731, _284, _741);
    float _753 = fma(_671, -2.0, _743);
    float _755 = fma(_737, _318, _747);
    float _757 = fma(_731, _322, _749);
    float _759 = fma(_737, _292, _751);
    float _761 = fma(_669, -2.0, _733);
    float _763 = _755 * _651;
    float _765 = _755 * _745;
    float _767 = _755 * _667;
    float _769 = fma(_737, _330, _757);
    float _771 = fma(_759, _753, _763);
    float _773 = fma(_759, _653, _765);
    float _775 = fma(_759, _659, _767);
    float _777 = fma(_769, _655, _771);
    float _779 = fma(_769, _665, _773);
    float _781 = fma(_769, _761, _775);
    float _783 = _573 + _777;
    float _785 = _613 + _779;
    float _787 = _565 + _781;
    float _789 = _785;
    float _791 = _783;
    float _793 = _787;
    if (!_611)
    {
        float _795 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _797 = _613 + _795;
        float _799 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _801 = _573 + _799;
        float _803 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _805 = _797 * _797;
        float _807 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _809 = _565 + _807;
        float _811 = fma(_801, _801, _805);
        float _813 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _815 = fma(_809, _809, _811);
        float _817 = sqrt(_815);
        float _819 = _803 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _821 = precise::min(_817, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _823 = _821 * _813;
        float _825 = _819 * _823;
        float _827 = fma(_777, _825, _573);
        float _829 = fma(_779, _825, _613);
        float _831 = fma(_781, _825, _565);
        _789 = _829;
        _791 = _827;
        _793 = _831;
    }
    float _833 = _789;
    float _835 = _791;
    float _837 = _793;
    float _839 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _841 = _833 + _839;
    float _843 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _845 = _835 + _843;
    float _847 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _849 = _837 + _847;
    float _851 = _841 * _841;
    float _853 = _833 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _855 = fma(_845, _845, _851);
    float _857 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _859 = fma(_835, (*spvDescriptorSet0.vp_c8)._m0[3].x, _853);
    float _861 = fma(_849, _849, _855);
    float _863 = fma(_837, (*spvDescriptorSet0.vp_c8)._m0[3].z, _859);
    float _865 = rsqrt(_861);
    float _867 = sqrt(_861);
    float _869 = _845 * _865;
    float _871 = _849 * _865;
    float _873 = _841 * _865;
    float _875 = _869 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _877 = _871 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _879 = _875 * _875;
    float _881 = _877 * _877;
    float _883 = _879 + _881;
    float _885 = sqrt(_883);
    bool _887 = _885 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _889 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _891 = _885 + _889;
    float _893 = _661;
    float _895 = _891;
    float _897 = _865;
    float _899 = _877;
    if (_887)
    {
        float _901 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _893 = _901;
    }
    float _903 = _893;
    if (_887)
    {
        float _905 = _891 * _903;
        _895 = _905;
    }
    float _907 = _895;
    if (_887)
    {
        float _909 = _907 * 0.15915493667125701904296875;
        _631 = _909;
    }
    float _911 = _631;
    float _913 = _723;
    float _915 = _911;
    if (_887)
    {
        float _917 = _911 * 6.283185482025146484375;
        float _919 = sin(_917);
        _913 = _919;
    }
    float _921 = _913;
    float _923 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _925 = precise::max(0.0, _923);
    float _927 = _601;
    float _929 = _925;
    if (_887)
    {
        float _931 = _911 * 6.283185482025146484375;
        float _933 = cos(_931);
        _927 = _933;
    }
    float _935 = _927;
    float _937 = -_873;
    float _939 = -_925;
    float _941 = fma(_937, (*spvDescriptorSet0.vp_c15)._m0[24].y, _939);
    float _943 = _923;
    if (_887)
    {
        float _945 = rsqrt(_883);
        _943 = _945;
    }
    float _947 = _943;
    if (_887)
    {
        float _949 = _941 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _897 = _949;
    }
    float _951 = _897;
    float _953 = _951;
    if (!_887)
    {
        _915 = _879;
    }
    float _955 = _915;
    float _957 = _921;
    float _959 = _955;
    if (_887)
    {
        float _961 = fma(_921, _951, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _929 = _961;
    }
    float _963 = _929;
    float _965 = _963;
    if (!_887)
    {
        _957 = _941;
    }
    float _967 = _957;
    float _969 = _967;
    float _971 = _935;
    if (_887)
    {
        float _973 = _935 + (-1.0);
        _953 = _973;
    }
    float _975 = _953;
    float _977 = _975;
    if (_887)
    {
        float _979 = _975 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _977 = _979;
    }
    float _981 = _977;
    float _983 = 0.0;
    if (_887)
    {
        float _985 = _947 * _963;
        _983 = _985;
    }
    float _987 = _983;
    if (!_887)
    {
        _965 = _875;
    }
    float _989 = _965;
    float _991 = _989;
    if (_887)
    {
        float _993 = fma(_941, _935, _981);
        _969 = _993;
    }
    float _995 = _969;
    if (!_887)
    {
        _971 = _881;
    }
    float _997 = _971;
    float _999 = _997;
    if (_887)
    {
        float _1001 = _875 * _987;
        _991 = _1001;
    }
    float _1003 = _991;
    if (_887)
    {
        float _1005 = _877 * _987;
        _899 = _1005;
    }
    float _1007 = _899;
    float _1009 = fma(_565, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    if (_887)
    {
        float _1011 = _1003 * _1003;
        _959 = _1011;
    }
    float _1013 = _959;
    if (_887)
    {
        float _1015 = _1007 * _1007;
        _999 = _1015;
    }
    float _1017 = _999;
    float _1019 = fma(_995, _995, _1013);
    float _1021 = _833 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1023 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1025 = fma(_867, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1023);
    float _1027 = precise::clamp(_1025, 0.0, 1.0);
    float _1029 = fma(_573, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1031 = _1019 + _1017;
    float _1033 = fma(_835, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1021);
    float _1035 = _833 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1037 = -_1027;
    float _1039 = _1037 + 1.0;
    float _1041 = floor(_1029);
    float _1043 = fma(_837, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1033);
    float _1045 = _833 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1047 = fma(_835, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1035);
    float _1049 = _1043 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1051 = fma(_835, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1045);
    float _1053 = fma(_837, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1047);
    float _1055 = rsqrt(_1031);
    float _1057 = _1049 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1059 = fma(_837, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1051);
    float _1061 = _1053 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1063 = -_1057;
    float _1065 = fma(_1063, _857, 1.0);
    float _1067 = _1059 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1069 = _1061 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1071 = abs(_1039);
    float _1073 = log2(_1071);
    float _1075 = _863 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1077 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1069);
    float _1079 = _1055 * _1003;
    float _1081 = _1055 * _995;
    float _1083 = floor(_1009);
    float _1085 = _1055 * _1007;
    float _1087 = _1079 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1089 = fma(_1049, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1077);
    float _1091 = -_1087;
    float _1093 = fma(_1081, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1091);
    float _1095 = _1073 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1097 = log2(_1065);
    float _1099 = fma(_1075, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1089);
    float _1101 = -_1085;
    float _1103 = fma(_1101, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1093);
    float _1105 = _1061 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1107 = exp2(_1095);
    float _1109 = -_1041;
    float _1111 = _1029 + _1109;
    float _1113 = fma(_1103, -0.5, 0.5);
    float _1115 = _1061 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1117 = -_1083;
    float _1119 = _1009 + _1117;
    float _1121 = fma(_1103, 0.5, 0.5);
    float _1123 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1105);
    float _1125 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1115);
    float _1127 = 1.0 / _1099;
    float _1129 = fma(_1121, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1131 = _1081 + 1.0;
    float _1133 = fma(_1049, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1125);
    float _1135 = fma(_1049, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1123);
    float _1137 = fma(_1121, _1129, -0.212114393711090087890625);
    float _1139 = _1097 * 0.693147182464599609375;
    float _1141 = fma(_1075, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1133);
    float _1143 = sqrt(_1113);
    float _1145 = -_1081;
    float _1147 = fma(_1107, _1131, _1145);
    float _1149 = fma(_1075, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1135);
    float _1151 = fma(_1121, _1137, 1.570728778839111328125);
    float _1153 = _1139 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1155 = fma(_1147, 0.5, 0.5);
    float _1157 = _1141 * _1127;
    float _1159 = _1149 * _1127;
    float _1161 = fma(_1157, 0.5, 0.5);
    float _1163 = fma(_1159, -0.5, 0.5);
    float _1165 = _1143 * 0.636619746685028076171875;
    float2 _3711 = float2(_1111, _1119);
    float _1167 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3711, float2(0.0), isnan(_3711)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3711, float2(0.0), isnan(_3711)), level(0.0)).x;
    float3 _3722 = float3(_1161, _1163, _1153);
    float _1169 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3722, float3(0.0), isnan(_3722)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3722, float3(0.0), isnan(_3722)), level(0.0)).x;
    float3 _3733 = float3(_1161, _1163, _1153);
    float4 _1172 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3733, float3(0.0), isnan(_3733)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3733, float3(0.0), isnan(_3733)), level(0.0)).xyzw;
    float _1174 = _1172.x;
    float _1176 = _1172.y;
    float _1178 = _1172.z;
    float _1180 = _1172.w;
    float _1182 = -_1151;
    float _1184 = fma(_1165, _1182, 1.0);
    float2 _3754 = float2(_1184, _1155);
    float3 _1188 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3754, float2(0.0), isnan(_3754)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3754, float2(0.0), isnan(_3754)), level(0.0)).xyz;
    float _1190 = _1188.x;
    float _1192 = _1188.y;
    float _1194 = _1188.z;
    float _1196 = _613 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1198 = _613 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1200 = _531 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1202 = _1061 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1204 = fma(_573, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1196);
    out.m_75.x = _845;
    out.m_75.y = _841;
    out.m_75.z = _849;
    float _1206 = fma(_1200, _284, _310);
    float _1208 = fma(_565, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1204);
    float _1210 = in.m_66.x;
    float _1212 = in.m_66.y;
    float _1214 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1216 = _1214 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1218 = _1208 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1220 = fma(_573, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1198);
    float _1222 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1224 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1222;
    float _1226 = 1.0 / _1218;
    float _1228 = fma(_565, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1220);
    bool _1230 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1232 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1234 = _1230 || _1232;
    bool _1236 = isnan(0.5);
    bool _1238 = _1234 || _1236;
    float _1240 = fma(_1200, _288, _314);
    float _1242 = _1228 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1244 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1246 = _462 + _1244;
    float _1248 = 1.0 / _1216;
    float _1250 = _1242 + _1218;
    float _1252 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.300000011920928955078125;
    bool _1254 = _462 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1256 = isnan(_462);
    bool _1258 = _1254 || _1256;
    bool _1260 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1262 = _1258 || _1260;
    float _1264 = float(_1262);
    float _1266 = fma(_1200, _292, _318);
    float _1268 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1202);
    float _1270 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1272 = _1250 * _1226;
    float _1274 = _1272 * 0.5;
    bool _1276 = _1212 > 0.5;
    float _1278 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1280 = fma(_1252, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1278);
    float _1282 = _1270 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1284 = _1210 > 0.5;
    float _1286 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1288 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1286);
    float _1290 = _1224 * _1248;
    int _1292 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1294 = _1292 != 0;
    int _1296 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1298 = _1296 != 0;
    float _1300 = 1.0 / _1288;
    float _1302 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _1304 = _462 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1306 = isnan(_462);
    bool _1308 = _1304 || _1306;
    bool _1310 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1312 = _1308 || _1310;
    float _1314 = float(_1312);
    float _1316 = fma(_1290, _1246, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1318 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1320 = _1302 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1322 = -_1314;
    float _1324 = _1322 + 1.0;
    float _1326 = -_531;
    int _1328 = _1284 ? as_type<int>(_1326) : as_type<int>(_531);
    float _1330 = _1318 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1332 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1334 = fma(_1252, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1332);
    bool _1336 = 0.0 != (*spvDescriptorSet0.vp_c11)._m0[20].z;
    bool _1338 = isnan(0.0);
    bool _1340 = _1336 || _1338;
    bool _1342 = isnan((*spvDescriptorSet0.vp_c11)._m0[20].z);
    bool _1344 = _1340 || _1342;
    bool _1346 = !_1294;
    float _1348 = _1346 ? _531 : as_type<float>(_1328);
    out.m_77.x = _1330;
    out.m_77.y = _1320;
    out.m_77.z = _1282;
    float _1350 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1352 = _1300 * _1350;
    float _1354 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _1334);
    float _1356 = -_537;
    int _1358 = _1276 ? as_type<int>(_1356) : as_type<int>(_537);
    float _1360 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1362 = _1348 + 0.5;
    float _1364 = _565 + _1354;
    float _1366 = _1264 * _1324;
    float _1368 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _1280);
    float _1370 = abs(_1352);
    float _1372 = log2(_1370);
    float _1374 = -_1264;
    float _1376 = _1374 + 1.0;
    float _1378 = _1316 * _1366;
    float _1380 = _573 + _1368;
    float _1382 = _537 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _1384 = !_1298;
    float _1386 = _1384 ? _537 : as_type<float>(_1358);
    float _1388 = -_1364;
    float _1390 = _1388 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _1392 = -_1380;
    float _1394 = _1392 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _1396 = -_1382;
    float _1398 = fma(_1396, _322, _1206);
    float _1400 = (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _1402 = _1364;
    float _1404 = _1398;
    if (_1344)
    {
        float _1406 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.20000000298023223876953125;
        _1400 = _1406;
    }
    float _1408 = _1400;
    float _1410 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1412 = fma(_1376, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1378);
    float _1414 = precise::min(_1380, _1394);
    float _1416 = -_1386;
    float _1418 = _1416 + 0.5;
    float _1420 = precise::min(_1364, _1390);
    float _1422 = -_1382;
    float _1424 = fma(_1422, _326, _1240);
    float _1426 = _1372 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    if (_1344)
    {
        float _1428 = precise::min(_1408, 20.0);
        _1402 = _1428;
    }
    float _1430 = _1402;
    float _1432 = _1362 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1434 = precise::min(_1414, _1420);
    float _1436 = fma(_1314, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1412);
    float _1438 = exp2(_1426);
    float _1440 = _1418 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1442 = _1432 * _1360;
    float _1444 = _1440 * _1410;
    float _1446 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1448 = _1430;
    float _1450 = (*spvDescriptorSet0.vp_c9)._m0[107].z;
    if (_1344)
    {
        float _1452 = 1.0 / _1430;
        _1448 = _1452;
    }
    float _1454 = _1448;
    float _1456 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1458 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1460 = -_1382;
    float _1462 = fma(_1460, _330, _1266);
    float _1464 = _1446 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1466 = _1456 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1468 = _1458 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1470 = _1436 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1472 = fma(_1438, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1474 = precise::clamp(_1472, 0.0, 1.0);
    out.m_79.x = _1442;
    out.m_79.y = _1444;
    float _1476 = _1470;
    if (!_1344)
    {
        _1450 = 1.0;
    }
    float _1478 = _1450;
    float _1480 = _1424 * _745;
    float _1482 = fma(_1474, -2.0, 3.0);
    float _1484 = in.m_81.x;
    float _1486 = _1474 * _1474;
    float _1488 = _1478;
    if (_1344)
    {
        float _1490 = _1434 * _1454;
        float _1492 = precise::clamp(_1490, 0.0, 1.0);
        _1488 = _1492;
    }
    float _1494 = _1488;
    float _1496 = _1424 * _651;
    out.m_83.x = _1464;
    out.m_83.y = _1466;
    out.m_83.z = _1468;
    out.m_83.w = _1470;
    float _1498 = _1486 * _1482;
    float _1500 = _1424 * _667;
    float _1502 = fma(_1049, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1268);
    float _1504 = fma(_1398, _753, _1496);
    float _1506 = fma(_1398, _653, _1480);
    float _1508 = fma(_1398, _659, _1500);
    float _1510 = fma(_1075, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1502);
    if (_1238)
    {
        _1404 = 1.0;
    }
    float _1512 = _1404;
    float _1514 = _1073 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1516 = -_1498;
    float _1518 = _1516 + 1.0;
    float _1520 = _1510 + _1099;
    float _1522 = _1512;
    if (_1238)
    {
        _1476 = 1.0;
    }
    float _1524 = _1476;
    float _1526 = fma(_1518, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1498);
    float _1528 = exp2(_1514);
    bool _1530 = _1352 <= 8000.0;
    bool _1532 = isnan(_1352);
    bool _1534 = _1530 || _1532;
    bool _1536 = isnan(8000.0);
    bool _1538 = _1534 || _1536;
    float _1540 = float(_1538);
    float _1542 = _1520 * 0.5;
    float _1544 = _1540 * _1526;
    float _1546 = _1524;
    if (!_1238)
    {
        float _1548 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1550 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1552 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1550;
        float _1554 = _1548 * 0.15915493667125701904296875;
        float _1556 = _1554 * 6.283185482025146484375;
        float _1558 = cos(_1556);
        float _1560 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1562 = _1560 * 0.15915493667125701904296875;
        float _1564 = _1554 * 6.283185482025146484375;
        float _1566 = sin(_1564);
        float _1568 = 1.0 / _1558;
        float _1570 = _1562 * 6.283185482025146484375;
        float _1572 = cos(_1570);
        float _1574 = _1566 * _1568;
        float _1576 = _1562 * 6.283185482025146484375;
        float _1578 = sin(_1576);
        float _1580 = _1572 * _1574;
        float _1582 = 1.0 / _1552;
        float _1584 = 1.0 / _1580;
        float _1586 = _1578 * _1584;
        float _1588 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1590 = fma(_1352, _1586, _1588);
        float _1592 = _1590 * _1582;
        float _1594 = precise::clamp(_1592, 0.0, 1.0);
        _1522 = _1594;
    }
    float _1596 = _1522;
    if (!_1238)
    {
        float _1598 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1600 = _1598 * 0.15915493667125701904296875;
        float _1602 = _1600 * 6.283185482025146484375;
        float _1604 = cos(_1602);
        float _1606 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1608 = _1606 * 0.15915493667125701904296875;
        float _1610 = _1600 * 6.283185482025146484375;
        float _1612 = sin(_1610);
        float _1614 = 1.0 / _1604;
        float _1616 = _1608 * 6.283185482025146484375;
        float _1618 = cos(_1616);
        float _1620 = _1612 * _1614;
        float _1622 = _1608 * 6.283185482025146484375;
        float _1624 = sin(_1622);
        float _1626 = _1618 * _1620;
        float _1628 = 1.0 / _1626;
        float _1630 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1632 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1630;
        float _1634 = 1.0 / _1632;
        float _1636 = _1624 * _1628;
        float _1638 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1640 = fma(_1352, _1636, _1638);
        float _1642 = _1640 * _1634;
        float _1644 = precise::clamp(_1642, 0.0, 1.0);
        float _1646 = -_1644;
        float _1648 = _1646 + 1.0;
        _1546 = _1648;
    }
    float _1650 = _1546;
    float _1652 = _1544 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1654 = -_1167;
    float _1656 = _1654 + 1.0;
    float _1658 = fma(_1462, _665, _1506);
    float _1660 = -_1528;
    float _1662 = _1660 + 1.0;
    float _1664 = fma(_1462, _655, _1504);
    float _1666 = fma(_1462, _761, _1508);
    float _1668 = _1656 * _1652;
    float _1670 = precise::clamp(_1668, 0.0, 1.0);
    float _1672 = _1662 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_85.z = _1542;
    out.m_85.w = _1099;
    bool _1674 = _867 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1676 = isnan(_867);
    bool _1678 = _1674 || _1676;
    bool _1680 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1682 = _1678 || _1680;
    float _1684 = _1672 * _1169;
    out.gl_Position.x = _1141;
    out.gl_Position.y = _1149;
    out.gl_Position.z = _1510;
    out.gl_Position.w = _1099;
    float _1686 = _1194 * _1684;
    out.m_87.x = _1664;
    out.m_87.y = _1658;
    out.m_87.z = _1666;
    float _1688 = -_1670;
    float _1690 = fma(_1688, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1692 = _1180 * _1684;
    float _1694 = fma(_1180, _1686, _1178);
    out.m_89.x = _835;
    out.m_89.y = _833;
    out.m_89.z = _837;
    float _1696 = _1690 * _1484;
    float _1698 = -_1672;
    float _1700 = _1698 + 1.0;
    float _1702 = fma(_1190, _1692, _1174);
    float _1704 = fma(_1192, _1692, _1176);
    float _1706 = _1696 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1708 = _1180 * _1700;
    float _1710 = _1596 * _1650;
    float _1712 = _1692;
    float _1714 = _1696;
    if (!_1682)
    {
        _1712 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1716 = _1712;
    out.m_91.x = _1706;
    float _1718 = _1710 * _1494;
    float _1720 = _1718;
    float _1722 = _1716;
    float _1724 = _1716;
    if (!_1682)
    {
        _1714 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1726 = _1714;
    out.m_93.x = _1702;
    out.m_93.y = _1704;
    out.m_93.z = _1694;
    out.m_93.w = _1708;
    float _1728 = _1718 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1730 = _1726;
    float _1732 = _1726;
    if (!_1682)
    {
        _1720 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1734 = _1720;
    bool _1736 = !_1682;
    float _1738 = _1734;
    float _1740 = _1734;
    if (!_1736)
    {
        bool _1742 = _867 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1744 = isnan(_867);
        bool _1746 = _1742 || _1744;
        bool _1748 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1750 = _1746 || _1748;
        if (!_1750)
        {
            float _1752 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1754 = _867 + _1752;
            float _1756 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1758 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1756;
            float _1760 = 1.0 / _1758;
            float _1762 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1764 = _1762 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1766 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1768 = _1766 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1770 = _1754 * _1760;
            float _1772 = precise::clamp(_1770, 0.0, 1.0);
            float _1774 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1776 = _1774 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1778 = fma(_1772, _1768, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1780 = fma(_1772, _1776, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1782 = fma(_1772, _1764, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            _1740 = _1782;
            _1724 = _1780;
            _1732 = _1778;
            _1784 = true;
        }
        else
        {
            bool _1786 = _867 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1788 = isnan(_867);
            bool _1790 = _1786 || _1788;
            bool _1792 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1794 = _1790 || _1792;
            if (!_1794)
            {
                _1722 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1796 = _1722;
            _1724 = _1796;
            if (!_1794)
            {
                _1738 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1798 = _1738;
            _1740 = _1798;
            if (!_1794)
            {
                _1730 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1800 = _1730;
            bool _1802 = !_1794;
            _1732 = _1800;
            if (!_1802)
            {
                bool _1804 = _867 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1806 = isnan(_867);
                bool _1808 = _1804 || _1806;
                bool _1810 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1812 = _1808 || _1810;
                if (!_1812)
                {
                    float _1814 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1816 = _867 + _1814;
                    float _1818 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1820 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1818;
                    float _1822 = 1.0 / _1820;
                    float _1824 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1826 = _1824 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1828 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1830 = _1828 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1832 = _1816 * _1822;
                    float _1834 = precise::clamp(_1832, 0.0, 1.0);
                    float _1836 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1838 = _1836 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1840 = fma(_1834, _1830, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1842 = fma(_1834, _1838, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1844 = fma(_1834, _1826, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    _1740 = _1844;
                    _1724 = _1842;
                    _1732 = _1840;
                    _1784 = true;
                }
                else
                {
                    _1740 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1724 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1732 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _1784 = false;
    float _1846 = _1740;
    float _1848 = _1724;
    float _1850 = _1732;
    float _1852 = _1728 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_95.x = 0.0;
    float _1854 = _1846 * 0.586610972881317138671875;
    bool _1856 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_56.x = _1852;
    float _1858 = fma(_1848, 0.298911988735198974609375, _1854);
    bool _1860 = _1596 > 0.0;
    bool _1862 = isnan(_1596);
    bool _1864 = _1860 || _1862;
    bool _1866 = isnan(0.0);
    bool _1868 = _1864 || _1866;
    float _1870 = fma(_1850, 0.114477999508380889892578125, _1858);
    bool _1872 = _1650 <= 0.0;
    bool _1874 = !_1868;
    bool _1876 = _1872 || _1874;
    out.m_97.x = 0.0;
    float _1878 = -_1870;
    float _1880 = _1878 + _1848;
    float _1882 = -_1870;
    float _1884 = _1882 + _1846;
    float _1886 = -_1870;
    float _1888 = _1886 + _1850;
    float _1890 = fma(_1880, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1870);
    float _1892 = fma(_1884, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1870);
    float _1894 = fma(_1888, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1870);
    bool _1896 = !_1856;
    if (!_1896)
    {
        float _1898 = -_833;
        float _1900 = _1898 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _1902 = -_835;
        float _1904 = _1902 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _1906 = -_837;
        float _1908 = _1906 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _1910 = _1900 * _1900;
        float _1912 = fma(_1904, _1904, _1910);
        float _1914 = fma(_1908, _1908, _1912);
        float _1916 = rsqrt(_1914);
        float _1918 = _1900 * _1916;
        float _1920 = _1904 * _1916;
        float _1922 = _1908 * _1916;
        float _1924 = -_873;
        float _1926 = _1924 + _1918;
        float _1928 = -_869;
        float _1930 = _1928 + _1920;
        float _1932 = sqrt(_1914);
        float _1934 = -_871;
        float _1936 = _1934 + _1922;
        float _1938 = _1926 * _1926;
        float _1940 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
        float _1942 = precise::clamp(_1940, 0.0, 1.0);
        float _1944 = fma(_1930, _1930, _1938);
        float _1946 = _1942 * _1942;
        float _1948 = fma(_1936, _1936, _1944);
        float _1950 = _1946 + (-1.0);
        float _1952 = rsqrt(_1948);
        float _1954 = -_1932;
        float _1956 = _1954 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _1958 = _1956 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _1960 = precise::clamp(_1958, 0.0, 1.0);
        float _1962 = _1920 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _1964 = abs(_1960);
        float _1966 = log2(_1964);
        float _1968 = _1926 * _1952;
        float _1970 = _1930 * _1952;
        float _1972 = _1936 * _1952;
        float _1974 = _1658 * _1968;
        float _1976 = _1658 * _1918;
        float _1978 = fma(_1664, _1970, _1974);
        float _1980 = fma(_1664, _1920, _1976);
        float _1982 = fma(_1666, _1972, _1978);
        float _1984 = precise::clamp(_1982, 0.0, 1.0);
        float _1986 = _1966 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _1988 = fma(_1666, _1922, _1980);
        float _1990 = precise::clamp(_1988, 0.0, 1.0);
        float _1992 = _1984 * _1984;
        float _1994 = exp2(_1986);
        float _1996 = fma(_1992, _1950, 1.0);
        float _1998 = -_1918;
        float _2000 = -_1962;
        float _2002 = fma(_1998, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2000);
        float _2004 = _1996 * _1996;
        float _2006 = -_1922;
        float _2008 = fma(_2006, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2002);
        float _2010 = 1.0 / _2004;
        float _2012 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2014 = _2008 + _2012;
        float _2016 = _2014 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2018 = precise::clamp(_2016, 0.0, 1.0);
        float _2020 = _1994 * _2018;
        float _2022 = _1990 * _2020;
        float _2024 = _1946 * _2010;
        float _2026 = _2022 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2028 = _2022 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2030 = _2022 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        float _2032 = _2022 * _2024;
        float _2034 = _2032 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2036 = _2032 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2038 = _2032 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_95.x = _2026;
        out.m_95.y = _2028;
        out.m_95.z = _2030;
        out.m_97.x = _2034;
        out.m_97.y = _2036;
        out.m_97.z = _2038;
    }
    out.m_99.x = _1890;
    out.m_99.y = _1892;
    out.m_99.z = _1894;
    if (!_1876)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_56.x = 0.0;
    float _2040 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2040;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

