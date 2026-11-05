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

struct _37
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _16* vp_c1 [[id(0)]];
    constant _16* vp_c12 [[id(1)]];
    constant _16* vp_c8 [[id(2)]];
    constant _16* vp_c9 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
    constant _16* vp_c10 [[id(5)]];
    constant _16* vp_c16 [[id(6)]];
    constant _16* vp_c7 [[id(7)]];
    const device _37* vp_s0 [[id(8)]];
    texture3d<float> vp_t_tcb_32 [[id(9)]];
    sampler vp_t_tcb_32Smplr [[id(10)]];
    texture3d<float> vp_t_tcb_30 [[id(11)]];
    sampler vp_t_tcb_30Smplr [[id(12)]];
    texture2d<float> vp_t_tcb_1C [[id(13)]];
    sampler vp_t_tcb_1CSmplr [[id(14)]];
    sampler vp_t_tcb_32Smplr_w [[id(15)]];
    sampler vp_t_tcb_30Smplr_w [[id(16)]];
    sampler vp_t_tcb_1CSmplr_w [[id(17)]];
    constant dm_border_t* dm_border [[id(18)]];
};

struct main0_out
{
    float4 m_58 [[user(locn0)]];
    float4 m_60 [[user(locn1)]];
    float4 m_66 [[user(locn2)]];
    float4 m_68 [[user(locn3)]];
    float4 m_64 [[user(locn4)]];
    float4 m_62 [[user(locn6)]];
    float4 m_70 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

vertex main0_out main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _776 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _84 = trunc((*spvDescriptorSet0.vp_c12)._m0[6].x);
    int _87 = int(_84);
    float _89 = as_type<float>(int(gl_VertexIndex));
    int _91 = max(0, _87);
    int _93 = min(_91, 5);
    int _95 = _93 << 2;
    int _97 = abs(as_type<int>(_89));
    uint _100 = uint(int(uint(_95) >> uint(2)));
    uint _102 = uint(int(uint(int(_100)) >> uint(2)));
    int _104 = int(_100) & 3;
    float _106 = (*spvDescriptorSet0.vp_c1)._m0[int(_102)][_104];
    float _108 = float(uint(_97));
    int _110 = as_type<int>(_106) + 1;
    int _112 = abs(_110);
    float _114 = float(uint(_112));
    float _116 = 1.0 / _114;
    int _118 = as_type<int>(_116) + (-2);
    float _120 = as_type<float>(_118) * _108;
    float _122 = trunc(_120);
    float _124 = precise::max(_122, 0.0);
    uint _126 = uint(_124);
    int _128 = ~int(_126);
    int _130 = _128 + 1;
    int _132 = _130 * _112;
    int _134 = _132 + _97;
    float _136 = float(uint(_134));
    float _138 = as_type<float>(_118) * _136;
    float _140 = trunc(_138);
    float _142 = precise::max(_140, 0.0);
    uint _144 = uint(_142);
    int _146 = int(_126) + int(_144);
    int _148 = as_type<int>(_89) ^ _110;
    int _150 = ~_146;
    int _152 = _150 + 1;
    uint _154 = uint(int(uint(_148) >> uint(31)));
    int _156 = _152 * _112;
    int _158 = _156 + _97;
    int _160 = ~int(_154);
    int _162 = _160 + 1;
    bool _166 = uint(_158) >= uint(_112);
    float _168 = (*spvDescriptorSet0.vp_c12)._m0[4].z * (*spvDescriptorSet0.vp_c12)._m0[5].w;
    bool _170 = !_166;
    int _172 = _170 ? 0 : (-1);
    float _174 = trunc(_168);
    int _176 = int(_174);
    bool _178 = _110 == 0;
    int _180 = ~_172;
    int _182 = _146 + _180;
    int _184 = _182 + 1;
    int _186 = _184 ^ _162;
    int _188 = ~_162;
    int _190 = _188 + _186;
    int _192 = _190 + 1;
    bool _194 = !_178;
    int _196 = _194 ? _192 : (-1);
    int _198 = _196 + _176;
    int _200 = _198 * 96;
    int _202 = _200 + 32;
    uint _204 = uint(int(uint(_200) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_204)];
    float _206 = as_type<float>(_dmw0.x);
    int _208 = _200 + 4;
    uint _210 = uint(int(uint(_208) >> uint(2)));
    float _212 = as_type<float>(_dmw0.y);
    int _214 = _200 + 8;
    uint _216 = uint(int(uint(_214) >> uint(2)));
    float _218 = as_type<float>(_dmw0.z);
    int _220 = _200 + 12;
    uint _222 = uint(int(uint(_220) >> uint(2)));
    float _224 = as_type<float>(_dmw0.w);
    uint _226 = uint(int(uint(_202) >> uint(2)));
    packed_uint3 _dmw2 = *(const device packed_uint3*)&(*spvDescriptorSet0.vp_s0)._m0[int(_226)];
    float _228 = as_type<float>(_dmw2.x);
    int _230 = _202 + 4;
    uint _232 = uint(int(uint(_230) >> uint(2)));
    float _234 = as_type<float>(_dmw2.y);
    int _236 = _202 + 8;
    uint _238 = uint(int(uint(_236) >> uint(2)));
    float _240 = as_type<float>(_dmw2.z);
    int _242 = _200 + 16;
    uint _244 = uint(int(uint(_242) >> uint(2)));
    packed_uint3 _dmw1 = *(const device packed_uint3*)&(*spvDescriptorSet0.vp_s0)._m0[int(_244)];
    float _246 = as_type<float>(_dmw1.x);
    int _248 = _242 + 4;
    uint _250 = uint(int(uint(_248) >> uint(2)));
    float _252 = as_type<float>(_dmw1.y);
    int _254 = _242 + 8;
    uint _256 = uint(int(uint(_254) >> uint(2)));
    float _258 = as_type<float>(_dmw1.z);
    float _260 = float(uint(_110));
    float _262 = float(as_type<uint>(_89));
    int _264 = _200 + 48;
    float _266 = 1.0 / _260;
    int _268 = ~_110;
    int _270 = _268 + 1;
    int _272 = ~_110;
    int _274 = _272 + 1;
    uint _276 = uint(int(uint(_264) >> uint(2)));
    packed_uint2 _dmw3 = *(const device packed_uint2*)&(*spvDescriptorSet0.vp_s0)._m0[int(_276)];
    float _278 = as_type<float>(_dmw3.x);
    int _280 = _264 + 4;
    uint _282 = uint(int(uint(_280) >> uint(2)));
    float _284 = as_type<float>(_dmw3.y);
    float _286 = float(as_type<int>(_106));
    float _288 = 1.0 / _286;
    int _290 = as_type<int>(_266) + (-2);
    float _292 = as_type<float>(_290) * _262;
    float _294 = trunc(_292);
    float _296 = precise::max(_294, 0.0);
    uint _298 = uint(_296);
    int _300 = _270 * int(_298);
    int _302 = _300 + as_type<int>(_89);
    float _304 = float(uint(_302));
    float _306 = as_type<float>(_290) * _304;
    float _308 = trunc(_306);
    float _310 = precise::max(_308, 0.0);
    uint _312 = uint(_310);
    int _314 = int(_298) + int(_312);
    int _316 = _274 * _314;
    int _318 = _316 + as_type<int>(_89);
    bool _320 = uint(_318) >= uint(_110);
    bool _322 = !_320;
    int _324 = _322 ? 0 : (-1);
    bool _326 = _110 == 0;
    int _328 = ~_314;
    int _330 = _328 + _324;
    int _332 = _330 + 1;
    int _334 = _110 * _332;
    int _336 = _334 + as_type<int>(_89);
    float _338 = -_212;
    float _340 = _338 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _342 = -_206;
    float _344 = _342 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _346 = -_218;
    float _348 = _346 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _350 = abs(_224);
    float _352 = _350 * 0.5;
    float _354 = _340 * _340;
    float _356 = _234 * _234;
    float _358 = fma(_344, _344, _354);
    float _360 = fma(_228, _228, _356);
    float _362 = fma(_348, _348, _358);
    float _364 = fma(_240, _240, _360);
    float _366 = _252 * _252;
    float _368 = rsqrt(_362);
    float _370 = fma(_246, _246, _366);
    float _372 = (*spvDescriptorSet0.vp_c12)._m0[4].y + (-1.0);
    float _374 = rsqrt(_364);
    float _376 = _344 * _368;
    float _378 = _348 * _368;
    float _380 = _340 * _368;
    float _382 = 1.0 / _372;
    float _384 = _240 * _374;
    float _386 = _228 * _374;
    float _388 = _234 * _374;
    float _390 = _376 * _384;
    float _392 = _378 * _388;
    float _394 = -_390;
    float _396 = fma(_378, _386, _394);
    float _398 = _380 * _386;
    float _400 = fma(_258, _258, _370);
    float _402 = -_392;
    float _404 = fma(_380, _384, _402);
    float _406 = _396 * _396;
    float _408 = -_398;
    float _410 = fma(_376, _388, _408);
    float _412 = float(_196);
    float _414 = fma(_404, _404, _406);
    float _416 = rsqrt(_400);
    bool _418 = !_326;
    int _420 = _418 ? _336 : (-1);
    float _422 = _412 * _382;
    float _424 = fma(_410, _410, _414);
    float _426 = float(_420);
    float _428 = rsqrt(_424);
    float _430 = _426 * _288;
    float _432 = _430 * 6.283185482025146484375;
    float _434 = _246 * _416;
    float _436 = _258 * _416;
    float _438 = _252 * _416;
    float _440 = -_422;
    float _442 = _440 + 1.0;
    float _444 = _432 * 0.15915493667125701904296875;
    float _446 = abs(_442);
    float _448 = log2(_446);
    float _450 = _410 * _428;
    float _452 = _404 * _428;
    float _454 = _396 * _428;
    float _456 = _434 * _450;
    float _458 = _436 * _454;
    float _460 = _444 * 6.283185482025146484375;
    float _462 = cos(_460);
    float _464 = -_456;
    float _466 = fma(_436, _452, _464);
    float _468 = _438 * _452;
    float _470 = -_458;
    float _472 = fma(_438, _450, _470);
    float _474 = _466 * _466;
    float _476 = -_468;
    float _478 = fma(_434, _454, _476);
    float _480 = _444 * 6.283185482025146484375;
    float _482 = sin(_480);
    float _484 = fma(_472, _472, _474);
    float _486 = fma(_478, _478, _484);
    float _488 = 1.0 + (*spvDescriptorSet0.vp_c12)._m0[6].y;
    float _490 = _462 * _352;
    float _492 = rsqrt(_486);
    float _494 = _488 * _448;
    float _496 = exp2(_494);
    float _498 = _352 * _492;
    float _500 = _482 * _498;
    float _502 = -(*spvDescriptorSet0.vp_c12)._m0[1].z;
    float _504 = _502 + (*spvDescriptorSet0.vp_c12)._m0[1].w;
    float _506 = -_496;
    float _508 = _506 + 1.0;
    float _510 = _472 * _500;
    float _512 = _478 * _500;
    float _514 = _466 * _500;
    float _516 = fma(_508, _504, (*spvDescriptorSet0.vp_c12)._m0[1].z);
    float _518 = fma(_452, _490, _510);
    float _520 = fma(_450, _490, _512);
    float _522 = fma(_454, _490, _514);
    float _524 = fma(_516, _518, _206);
    float _526 = fma(_516, _520, _218);
    int _528 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1048576;
    bool _530 = _528 != 0;
    float _532 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _534 = _524 + _532;
    float _536 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _538 = _526 + _536;
    float _540 = _534 * _534;
    float _542 = _538 * _538;
    float _544 = _540 + _542;
    float _546 = _518;
    float _548 = _496;
    float _550 = _504;
    float _552 = _514;
    float _554 = _520;
    float _556 = _516;
    float _558 = _524;
    if (!_530)
    {
        _546 = 0.0;
        _548 = 0.0;
    }
    float _560 = _546;
    float _562 = _548;
    float _564 = _560;
    float _566 = _562;
    if (!_530)
    {
        _550 = 0.0;
    }
    float _568 = _550;
    float _570 = sqrt(_544);
    bool _572 = _570 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _574 = !_530;
    float _576 = _568;
    float _578 = _284;
    if (!_574)
    {
        float _580 = -(*spvDescriptorSet0.vp_c10)._m0[5].w;
        float _582 = (*spvDescriptorSet0.vp_c8)._m0[29].y + _580;
        float _584 = -(*spvDescriptorSet0.vp_c10)._m0[4].w;
        float _586 = (*spvDescriptorSet0.vp_c8)._m0[29].x + _584;
        float _588 = _582 * _582;
        float _590 = -(*spvDescriptorSet0.vp_c10)._m0[6].w;
        float _592 = (*spvDescriptorSet0.vp_c8)._m0[29].z + _590;
        float _594 = fma(_586, _586, _588);
        float _596 = fma(_592, _592, _594);
        float _598 = rsqrt(_596);
        float _600 = _598 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
        float _602 = _586 * _600;
        float _604 = _582 * _600;
        float _606 = _592 * _600;
        _552 = _600;
        _554 = _598;
        _564 = _604;
        _566 = _602;
        _576 = _606;
    }
    float _608 = _552;
    float _610 = _554;
    float _612 = _564;
    float _614 = _566;
    float _616 = _576;
    float _618 = fma(_516, _522, _212);
    float _620 = _610;
    float _622 = _608;
    float _624 = _618;
    if (!_572)
    {
        _620 = _524;
    }
    float _626 = _620;
    float _628 = _626;
    if (!_572)
    {
        _622 = _542;
    }
    float _630 = _622;
    float _632 = _630;
    if (!_572)
    {
        _556 = _540;
    }
    float _634 = _556;
    float _636 = _634;
    if (!_572)
    {
        _558 = _526;
    }
    float _638 = _558;
    bool _640 = !_572;
    float _642 = _638;
    if (!_640)
    {
        float _644 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _646 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _648 = _570 + _646;
        float _650 = _618 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _652 = rsqrt(_544);
        float _654 = _648 * _644;
        float _656 = _654 * 0.15915493667125701904296875;
        float _658 = _656 * 6.283185482025146484375;
        float _660 = sin(_658);
        float _662 = _656 * 6.283185482025146484375;
        float _664 = cos(_662);
        float _666 = fma(_660, _650, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _668 = _652 * _666;
        float _670 = _664 + (-1.0);
        float _672 = fma(_534, _668, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _674 = fma(_538, _668, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _676 = _670 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _678 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _680 = _672 + _678;
        float _682 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _684 = _674 + _682;
        float _686 = fma(_618, _664, _676);
        float _688 = _680 * _680;
        float _690 = _684 * _684;
        _624 = _686;
        _636 = _688;
        _632 = _690;
        _628 = _672;
        _642 = _674;
    }
    float _692 = _624;
    float _694 = _636;
    float _696 = _632;
    float _698 = _628;
    float _700 = _642;
    float _702 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _704 = _692 + _702;
    float _706 = fma(_704, _704, _694);
    float _708 = (*spvDescriptorSet0.vp_c12)._m0[2].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _710 = _706 + _696;
    float _712 = (*spvDescriptorSet0.vp_c12)._m0[2].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _714 = sqrt(_710);
    float _716 = (*spvDescriptorSet0.vp_c12)._m0[2].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _718 = (*spvDescriptorSet0.vp_c12)._m0[2].w * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _720 = (*spvDescriptorSet0.vp_c12)._m0[3].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _722 = (*spvDescriptorSet0.vp_c12)._m0[3].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _724 = (*spvDescriptorSet0.vp_c12)._m0[3].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _726 = (*spvDescriptorSet0.vp_c12)._m0[3].w * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_58.x = _712;
    out.m_58.y = _708;
    out.m_58.z = _716;
    out.m_58.w = _718;
    out.m_60.x = _720;
    out.m_60.y = _722;
    out.m_60.z = _724;
    out.m_60.w = _726;
    bool _728 = _714 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _730 = isnan(_714);
    bool _732 = _728 || _730;
    bool _734 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _736 = _732 || _734;
    float _738 = (*spvDescriptorSet0.vp_c12)._m0[2].x;
    float _740 = _724;
    if (!_736)
    {
        _738 = 1.0;
    }
    float _742 = _738;
    bool _744 = !_736;
    float _746 = _742;
    if (!_744)
    {
        bool _748 = _714 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _750 = isnan(_714);
        bool _752 = _748 || _750;
        bool _754 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _756 = _752 || _754;
        if (!_756)
        {
            float _758 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _760 = _714 + _758;
            float _762 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _764 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _762;
            float _766 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _768 = _766 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _770 = 1.0 / _764;
            float _772 = _760 * _770;
            float _774 = fma(_772, _768, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _746 = _774;
            _776 = true;
        }
        else
        {
            bool _778 = _714 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _780 = isnan(_714);
            bool _782 = _778 || _780;
            bool _784 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _786 = _782 || _784;
            if (!_786)
            {
                float _788 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _790 = _714 + _788;
                float _792 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _794 = _792 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _796 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _798 = _796 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _800 = 1.0 / _794;
                float _802 = _790 * _800;
                float _804 = fma(_802, _798, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _746 = _804;
                _776 = true;
            }
            else
            {
                _746 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _776 = false;
    float _806 = _746;
    float _808 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _810 = _692 + _808;
    float _812 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _814 = _698 + _812;
    float _816 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _818 = _700 + _816;
    float _820 = fma(_810, _806, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _822 = fma(_814, _806, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _824 = fma(_818, _806, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _826 = _820 + _612;
    float _828 = _822 + _614;
    float _830 = _824 + _616;
    float _832 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _834 = _826 + _832;
    float _836 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _838 = _828 + _836;
    float _840 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _842 = _830 + _840;
    float _844 = _834 * _834;
    float _846 = fma(_838, _838, _844);
    float _848 = fma(_842, _842, _846);
    float _850 = rsqrt(_848);
    float _852 = sqrt(_848);
    float _854 = _850 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _856 = _838 * _854;
    float _858 = _842 * _854;
    float _860 = _856 * _856;
    float _862 = _858 * _858;
    float _864 = _860 + _862;
    float _866 = sqrt(_864);
    bool _868 = _866 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _870 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _872 = _866 + _870;
    float _874 = _842;
    float _876 = _864;
    float _878 = _872;
    float _880 = _820;
    float _882 = _834;
    if (_868)
    {
        float _884 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _874 = _884;
    }
    float _886 = _874;
    if (_868)
    {
        float _888 = rsqrt(_864);
        _876 = _888;
    }
    float _890 = _876;
    float _892 = _890;
    if (_868)
    {
        float _894 = _872 * _886;
        _878 = _894;
    }
    float _896 = _878;
    if (_868)
    {
        float _898 = _896 * 0.15915493667125701904296875;
        _880 = _898;
    }
    float _900 = _880;
    float _902 = _886;
    float _904 = _900;
    if (_868)
    {
        float _906 = _900 * 6.283185482025146484375;
        float _908 = sin(_906);
        _902 = _908;
    }
    float _910 = _902;
    float _912 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _914 = precise::max(0.0, _912);
    float _916 = _844;
    float _918 = _914;
    if (_868)
    {
        float _920 = _900 * 6.283185482025146484375;
        float _922 = cos(_920);
        _916 = _922;
    }
    float _924 = _916;
    float _926 = -_854;
    float _928 = -_914;
    float _930 = fma(_834, _926, _928);
    if (_868)
    {
        float _932 = _930 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _918 = _932;
    }
    float _934 = _918;
    float _936 = _910;
    float _938 = _934;
    if (_868)
    {
        float _940 = fma(_910, _934, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _882 = _940;
    }
    float _942 = _882;
    float _944 = _942;
    if (!_868)
    {
        _936 = _856;
    }
    float _946 = _936;
    float _948 = _946;
    float _950 = _924;
    if (_868)
    {
        float _952 = _924 + (-1.0);
        _938 = _952;
    }
    float _954 = _938;
    float _956 = _954;
    if (_868)
    {
        float _958 = _890 * _942;
        _740 = _958;
    }
    float _960 = _740;
    if (!_868)
    {
        _944 = _930;
    }
    float _962 = _944;
    float _964 = _962;
    if (_868)
    {
        float _966 = _954 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _904 = _966;
    }
    float _968 = _904;
    if (_868)
    {
        float _970 = _856 * _960;
        _948 = _970;
    }
    float _972 = _948;
    if (!_868)
    {
        _956 = _858;
    }
    float _974 = _956;
    float _976 = _974;
    if (_868)
    {
        float _978 = _858 * _960;
        _976 = _978;
    }
    float _980 = _976;
    if (!_868)
    {
        _892 = _860;
    }
    float _982 = _892;
    float _984 = _982;
    if (_868)
    {
        float _986 = fma(_930, _924, _968);
        _964 = _986;
    }
    float _988 = _964;
    if (_868)
    {
        float _990 = _972 * _972;
        _984 = _990;
    }
    float _992 = _984;
    if (!_868)
    {
        _950 = _862;
    }
    float _994 = _950;
    float _996 = _994;
    if (_868)
    {
        float _998 = _980 * _980;
        _996 = _998;
    }
    float _1000 = _996;
    float _1002 = fma(_988, _988, _992);
    float _1004 = _826 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1006 = _1002 + _1000;
    float _1008 = _826 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1010 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1012 = fma(_852, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1010);
    float _1014 = precise::clamp(_1012, 0.0, 1.0);
    float _1016 = _826 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1018 = rsqrt(_1006);
    float _1020 = fma(_828, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1008);
    float _1022 = -_1014;
    float _1024 = _1022 + 1.0;
    float _1026 = fma(_828, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1016);
    float _1028 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1030 = fma(_830, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1020);
    float _1032 = _826 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1034 = fma(_830, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1026);
    float _1036 = abs(_1024);
    float _1038 = log2(_1036);
    float _1040 = _1030 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1042 = fma(_828, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1032);
    float _1044 = _1034 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1046 = fma(_828, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1004);
    float _1048 = _1040 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1050 = fma(_830, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1042);
    float _1052 = _1018 * _972;
    float _1054 = _1018 * _988;
    float _1056 = _1050 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1058 = _1044 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1060 = _1052 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1062 = -_1048;
    float _1064 = fma(_1062, _1028, 1.0);
    float _1066 = _1018 * _980;
    float _1068 = fma(_830, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1046);
    float _1070 = -_1060;
    float _1072 = fma(_1054, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1070);
    float _1074 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1058);
    float _1076 = _1044 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1078 = _1068 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1080 = -_1066;
    float _1082 = fma(_1080, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1072);
    float _1084 = fma(_1040, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1074);
    float _1086 = _1038 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1088 = _1044 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1090 = fma(_1082, -0.5, 0.5);
    float _1092 = fma(_1078, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1084);
    float _1094 = log2(_1064);
    float _1096 = fma(_1082, 0.5, 0.5);
    float _1098 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1088);
    float _1100 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1076);
    float _1102 = _1054 + 1.0;
    float _1104 = fma(_1040, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1098);
    float _1106 = fma(_1040, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1100);
    float _1108 = 1.0 / _1092;
    float _1110 = fma(_1078, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1104);
    float _1112 = fma(_1078, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1106);
    float _1114 = exp2(_1086);
    float _1116 = _1094 * 0.693147182464599609375;
    float _1118 = sqrt(_1090);
    float _1120 = fma(_1096, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1122 = _1110 * _1108;
    float _1124 = _1112 * _1108;
    float _1126 = _1116 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1128 = fma(_1096, _1120, -0.212114393711090087890625);
    float _1130 = fma(_1122, 0.5, 0.5);
    float _1132 = fma(_1124, -0.5, 0.5);
    float _1134 = -_1054;
    float _1136 = fma(_1114, _1102, _1134);
    float _1138 = fma(_1096, _1128, 1.570728778839111328125);
    float _1140 = fma(_1136, 0.5, 0.5);
    float _1142 = _1118 * 0.636619746685028076171875;
    float _1144 = -_1138;
    float _1146 = fma(_1142, _1144, 1.0);
    float3 _3372 = float3(_1130, _1132, _1126);
    float _1148 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3372, float3(0.0), isnan(_3372)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3372, float3(0.0), isnan(_3372)), level(0.0)).x;
    float3 _3383 = float3(_1130, _1132, _1126);
    float4 _1151 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3383, float3(0.0), isnan(_3383)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3383, float3(0.0), isnan(_3383)), level(0.0)).xyzw;
    float _1153 = _1151.x;
    float _1155 = _1151.y;
    float _1157 = _1151.z;
    float _1159 = _1151.w;
    float2 _3400 = float2(_1146, _1140);
    float3 _1163 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3400, float2(0.0), isnan(_3400)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3400, float2(0.0), isnan(_3400)), level(0.0)).xyz;
    float _1165 = _1163.x;
    float _1167 = _1163.y;
    float _1169 = _1163.z;
    int _1171 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1173 = _1171 != 0;
    float _1175 = _212 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    int _1177 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1179 = _1177 != 0;
    float _1181 = _212 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    int _1183 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1185 = _1183 != 0;
    float _1187 = fma(_206, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1175);
    int _1189 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 524288;
    bool _1191 = _1189 != 0;
    float _1193 = fma(_206, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1181);
    int _1195 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1197 = _1195 != 0;
    float _1199 = _212 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1201 = _212 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1203 = fma(_218, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1193);
    float _1205 = 0.0;
    float _1207 = _1199;
    bool _1209 = _1173;
    bool _1211 = _1179;
    float _1213 = _1038;
    if (_1173)
    {
        _1205 = (*spvDescriptorSet0.vp_c12)._m0[0].y;
    }
    float _1215 = _1205;
    float _1217 = fma(_206, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1199);
    float _1219 = _1215;
    if (!_1173)
    {
        float _1221 = -_278;
        float _1223 = (-0.0) + _1221;
        _1207 = _1223;
    }
    float _1225 = _1207;
    bool _1227 = false;
    float _1229 = _1225;
    if (_1173)
    {
        bool _1231 = _1215 > 0.5;
        _1227 = _1231;
    }
    bool _1233 = _1227;
    float _1235 = fma(_218, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1217);
    bool _1237 = _1233;
    if (_1179)
    {
        _1219 = (*spvDescriptorSet0.vp_c12)._m0[0].x;
    }
    float _1239 = _1219;
    if (_1173)
    {
        float _1241 = -_278;
        float _1243 = _1233 ? _278 : _1241;
        _1229 = _1243;
    }
    float _1245 = _1229;
    float _1247 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _1249 = _1245;
    if (_1179)
    {
        bool _1251 = _1239 > 0.5;
        _1209 = _1251;
    }
    bool _1253 = _1209;
    float _1255 = fma(_218, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1187);
    float _1257 = fma((*spvDescriptorSet0.vp_c9)._m0[79].z, (*spvDescriptorSet0.vp_c12)._m0[0].z, _1247);
    float _1259 = _1235 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1261 = _1255 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1263 = fma(_206, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1201);
    float _1265 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[79].x, _1257);
    float _1267 = _1261 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1269 = _1261 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1271 = fma(_218, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1263);
    float _1273 = _1265 * (-0.15915493667125701904296875);
    float _1275 = fma(_1259, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1267);
    float _1277 = fma(_1259, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1269);
    float _1279 = _1203 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1281 = _1271 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1283 = fma(_1279, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1277);
    float _1285 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1287 = (*spvDescriptorSet0.vp_c9)._m0[77].x * (*spvDescriptorSet0.vp_c12)._m0[0].x;
    float _1289 = fma(_1281, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1283);
    float _1291 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1293 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1295 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1297 = _1293 || _1295;
    bool _1299 = isnan(0.5);
    bool _1301 = _1297 || _1299;
    float _1303 = -_1285;
    float _1305 = fma(_1287, 2.0, _1303);
    float _1307 = 1.0 / _1289;
    float _1309 = fma(_1279, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1275);
    float _1311 = fma((*spvDescriptorSet0.vp_c9)._m0[78].z, (*spvDescriptorSet0.vp_c12)._m0[0].x, _1291);
    float _1313 = _1291;
    if (_1185)
    {
        _1313 = (*spvDescriptorSet0.vp_c12)._m0[0].z;
    }
    float _1315 = _1313;
    float _1317 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1319 = (*spvDescriptorSet0.vp_c9)._m0[77].y * (*spvDescriptorSet0.vp_c12)._m0[0].y;
    float _1321 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1323 = _1273 * 6.283185482025146484375;
    float _1325 = sin(_1323);
    float _1327 = fma(_1281, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1309);
    float _1329 = _1315;
    float _1331 = _1321;
    if (_1185)
    {
        bool _1333 = _1315 > 0.5;
        _1237 = _1333;
    }
    bool _1335 = _1237;
    float _1337 = fma((*spvDescriptorSet0.vp_c9)._m0[78].w, (*spvDescriptorSet0.vp_c12)._m0[0].y, _1321);
    if (_1197)
    {
        _1329 = (*spvDescriptorSet0.vp_c12)._m0[0].w;
    }
    float _1339 = _1329;
    float _1341 = -(*spvDescriptorSet0.vp_c12)._m0[1].x;
    float _1343 = _1341 + (*spvDescriptorSet0.vp_c12)._m0[1].y;
    float _1345 = fma(_1319, -2.0, _1317);
    if (!_1179)
    {
        _1331 = _430;
    }
    float _1347 = _1331;
    float _1349 = _1273 * 6.283185482025146484375;
    float _1351 = cos(_1349);
    float _1353 = _1327 + _1289;
    float _1355 = _1347;
    if (_1179)
    {
        float _1357 = -_430;
        float _1359 = _1253 ? _1357 : _430;
        _1355 = _1359;
    }
    float _1361 = _1355;
    float _1363 = _1245 + 0.5;
    if (_1197)
    {
        bool _1365 = _1339 > 0.5;
        _1211 = _1365;
    }
    bool _1367 = _1211;
    float _1369 = fma(_422, _1343, (*spvDescriptorSet0.vp_c12)._m0[1].x);
    float _1371 = _1353 * _1307;
    float _1373 = _1371 * 0.5;
    float _1375 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1377 = _1361 + (-0.5);
    if (!_1185)
    {
        _1249 = _430;
    }
    float _1379 = _1249;
    float _1381 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1383 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1381);
    float _1385 = _1363 * _1325;
    float _1387 = _1379;
    if (_1185)
    {
        float _1389 = -_430;
        float _1391 = _1335 ? _1389 : _430;
        _1387 = _1391;
    }
    float _1393 = _1387;
    float _1395 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1345);
    float _1397 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1305);
    float _1399 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1401 = _1363 * _1351;
    float _1403 = -_1385;
    float _1405 = fma(_1377, _1351, _1403);
    float _1407 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1311);
    float _1409 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1337);
    float _1411 = fma(_1377, _1325, _1401);
    float _1413 = _1405 + 0.5;
    float _1415 = _1393 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1417 = 1.0 / _1383;
    float _1419 = _1375 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1421 = _1044 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1423 = _1411 + (-0.5);
    float _1425 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1421);
    float _1427 = fma(_1419, _1413, _1397);
    float _1429 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1431 = _1399 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1433 = _1399;
    float _1435 = _1431;
    if (!_1197)
    {
        float _1437 = -_284;
        float _1439 = (-0.0) + _1437;
        _1433 = _1439;
    }
    float _1441 = _1433;
    float _1443 = _1441;
    if (_1197)
    {
        float _1445 = -_284;
        float _1447 = _1367 ? _284 : _1445;
        _1443 = _1447;
    }
    float _1449 = _1443;
    float _1451 = fma(_1040, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1425);
    float _1453 = -_1431;
    float _1455 = -_1395;
    float _1457 = fma(_1453, _1423, _1455);
    if (_1301)
    {
        _1435 = 1.0;
    }
    float _1459 = _1435;
    float _1461 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1463 = _1459;
    if (_1301)
    {
        _578 = 1.0;
    }
    float _1465 = _578;
    float _1467 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1469 = _1417 * _1467;
    float _1471 = _1044;
    float _1473 = _1465;
    if (_1191)
    {
        float _1475 = 1.0 / _1092;
        _1471 = _1475;
    }
    float _1477 = _1471;
    float _1479 = _1477;
    if (!_1301)
    {
        float _1481 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1483 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1485 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1483;
        float _1487 = _1481 * 0.15915493667125701904296875;
        float _1489 = _1487 * 6.283185482025146484375;
        float _1491 = cos(_1489);
        float _1493 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1495 = _1493 * 0.15915493667125701904296875;
        float _1497 = _1487 * 6.283185482025146484375;
        float _1499 = sin(_1497);
        float _1501 = 1.0 / _1491;
        float _1503 = _1495 * 6.283185482025146484375;
        float _1505 = cos(_1503);
        float _1507 = _1499 * _1501;
        float _1509 = _1495 * 6.283185482025146484375;
        float _1511 = sin(_1509);
        float _1513 = _1505 * _1507;
        float _1515 = 1.0 / _1485;
        float _1517 = 1.0 / _1513;
        float _1519 = _1511 * _1517;
        float _1521 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1523 = fma(_1469, _1519, _1521);
        float _1525 = _1523 * _1515;
        float _1527 = precise::clamp(_1525, 0.0, 1.0);
        _1463 = _1527;
    }
    float _1529 = _1463;
    if (!_1301)
    {
        float _1531 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1533 = _1531 * 0.15915493667125701904296875;
        float _1535 = _1533 * 6.283185482025146484375;
        float _1537 = cos(_1535);
        float _1539 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1541 = _1539 * 0.15915493667125701904296875;
        float _1543 = _1533 * 6.283185482025146484375;
        float _1545 = sin(_1543);
        float _1547 = 1.0 / _1537;
        float _1549 = _1541 * 6.283185482025146484375;
        float _1551 = cos(_1549);
        float _1553 = _1545 * _1547;
        float _1555 = _1541 * 6.283185482025146484375;
        float _1557 = sin(_1555);
        float _1559 = _1551 * _1553;
        float _1561 = 1.0 / _1559;
        float _1563 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1565 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1563;
        float _1567 = 1.0 / _1565;
        float _1569 = _1557 * _1561;
        float _1571 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1573 = fma(_1469, _1569, _1571);
        float _1575 = _1573 * _1567;
        float _1577 = precise::clamp(_1575, 0.0, 1.0);
        float _1579 = -_1577;
        float _1581 = _1579 + 1.0;
        _1473 = _1581;
    }
    float _1583 = _1473;
    float _1585 = fma(_1078, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1451);
    float _1587 = _1038 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1589 = _1449 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1591 = -_1409;
    float _1593 = _1591 + 1.0;
    float _1595 = -_1407;
    float _1597 = _1595 + 1.0;
    float _1599 = _1415 * _1429;
    if (_1191)
    {
        float _1601 = -_1585;
        float _1603 = fma(_1601, _1477, 1.0);
        _1479 = _1603;
    }
    float _1605 = _1479;
    float _1607 = exp2(_1587);
    float _1609 = _1529 * _1583;
    float _1611 = -_1589;
    float _1613 = fma(_1611, _1461, -0.0);
    float _1615 = fma(_1411, _1593, _1457);
    float _1617 = -_1597;
    float _1619 = fma(_1405, _1617, _1427);
    if (!_1191)
    {
        _1213 = _1585;
    }
    float _1621 = _1213;
    float _1623 = _1621;
    if (_1191)
    {
        float _1625 = -_1605;
        float _1627 = fma(_1625, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1585);
        _1623 = _1627;
    }
    float _1629 = _1623;
    float _1631 = _1609 * _1369;
    out.m_62.x = _828;
    out.m_62.y = _826;
    out.m_62.z = _830;
    float _1633 = _1110 + _1092;
    float _1635 = _1092 * 0.5;
    float _1637 = _1092 + _1629;
    out.m_64.x = _1619;
    out.m_64.y = _1615;
    out.m_64.z = _1599;
    out.m_64.w = _1613;
    float _1639 = _1633 * 0.5;
    float _1641 = fma(_1112, -0.5, _1635);
    float _1643 = -_1607;
    float _1645 = _1643 + 1.0;
    float _1647 = _1637 * 0.5;
    out.gl_Position.x = _1110;
    out.gl_Position.y = _1112;
    out.gl_Position.z = _1585;
    out.gl_Position.w = _1092;
    float _1649 = _1645 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (_1191)
    {
        out.gl_Position.z = _1629;
    }
    float _1651 = _1649 * _1148;
    float _1653 = _1631 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1655 = -_1649;
    float _1657 = _1655 + 1.0;
    float _1659 = _1159 * _1651;
    float _1661 = _1169 * _1651;
    float _1663 = _1653 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1665 = fma(_1165, _1659, _1153);
    float _1667 = fma(_1167, _1659, _1155);
    float _1669 = _1159 * _1657;
    float _1671 = fma(_1159, _1661, _1157);
    out.m_66.x = _1639;
    out.m_66.y = _1641;
    out.m_66.z = _1647;
    out.m_66.w = _1092;
    out.m_68.x = _1663;
    out.m_70.x = _1665;
    out.m_70.y = _1667;
    out.m_70.z = _1671;
    out.m_70.w = _1669;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _776 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _84 = trunc((*spvDescriptorSet0.vp_c12)._m0[6].x);
    int _87 = int(_84);
    float _89 = as_type<float>(int(gl_VertexIndex));
    int _91 = max(0, _87);
    int _93 = min(_91, 5);
    int _95 = _93 << 2;
    int _97 = abs(as_type<int>(_89));
    uint _100 = uint(int(uint(_95) >> uint(2)));
    uint _102 = uint(int(uint(int(_100)) >> uint(2)));
    int _104 = int(_100) & 3;
    float _106 = (*spvDescriptorSet0.vp_c1)._m0[int(_102)][_104];
    float _108 = float(uint(_97));
    int _110 = as_type<int>(_106) + 1;
    int _112 = abs(_110);
    float _114 = float(uint(_112));
    float _116 = 1.0 / _114;
    int _118 = as_type<int>(_116) + (-2);
    float _120 = as_type<float>(_118) * _108;
    float _122 = trunc(_120);
    float _124 = precise::max(_122, 0.0);
    uint _126 = uint(_124);
    int _128 = ~int(_126);
    int _130 = _128 + 1;
    int _132 = _130 * _112;
    int _134 = _132 + _97;
    float _136 = float(uint(_134));
    float _138 = as_type<float>(_118) * _136;
    float _140 = trunc(_138);
    float _142 = precise::max(_140, 0.0);
    uint _144 = uint(_142);
    int _146 = int(_126) + int(_144);
    int _148 = as_type<int>(_89) ^ _110;
    int _150 = ~_146;
    int _152 = _150 + 1;
    uint _154 = uint(int(uint(_148) >> uint(31)));
    int _156 = _152 * _112;
    int _158 = _156 + _97;
    int _160 = ~int(_154);
    int _162 = _160 + 1;
    bool _166 = uint(_158) >= uint(_112);
    float _168 = (*spvDescriptorSet0.vp_c12)._m0[4].z * (*spvDescriptorSet0.vp_c12)._m0[5].w;
    bool _170 = !_166;
    int _172 = _170 ? 0 : (-1);
    float _174 = trunc(_168);
    int _176 = int(_174);
    bool _178 = _110 == 0;
    int _180 = ~_172;
    int _182 = _146 + _180;
    int _184 = _182 + 1;
    int _186 = _184 ^ _162;
    int _188 = ~_162;
    int _190 = _188 + _186;
    int _192 = _190 + 1;
    bool _194 = !_178;
    int _196 = _194 ? _192 : (-1);
    int _198 = _196 + _176;
    int _200 = _198 * 96;
    int _202 = _200 + 32;
    uint _204 = uint(int(uint(_200) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_204)];
    float _206 = as_type<float>(_dmw0.x);
    int _208 = _200 + 4;
    uint _210 = uint(int(uint(_208) >> uint(2)));
    float _212 = as_type<float>(_dmw0.y);
    int _214 = _200 + 8;
    uint _216 = uint(int(uint(_214) >> uint(2)));
    float _218 = as_type<float>(_dmw0.z);
    int _220 = _200 + 12;
    uint _222 = uint(int(uint(_220) >> uint(2)));
    float _224 = as_type<float>(_dmw0.w);
    uint _226 = uint(int(uint(_202) >> uint(2)));
    packed_uint3 _dmw2 = *(const device packed_uint3*)&(*spvDescriptorSet0.vp_s0)._m0[int(_226)];
    float _228 = as_type<float>(_dmw2.x);
    int _230 = _202 + 4;
    uint _232 = uint(int(uint(_230) >> uint(2)));
    float _234 = as_type<float>(_dmw2.y);
    int _236 = _202 + 8;
    uint _238 = uint(int(uint(_236) >> uint(2)));
    float _240 = as_type<float>(_dmw2.z);
    int _242 = _200 + 16;
    uint _244 = uint(int(uint(_242) >> uint(2)));
    packed_uint3 _dmw1 = *(const device packed_uint3*)&(*spvDescriptorSet0.vp_s0)._m0[int(_244)];
    float _246 = as_type<float>(_dmw1.x);
    int _248 = _242 + 4;
    uint _250 = uint(int(uint(_248) >> uint(2)));
    float _252 = as_type<float>(_dmw1.y);
    int _254 = _242 + 8;
    uint _256 = uint(int(uint(_254) >> uint(2)));
    float _258 = as_type<float>(_dmw1.z);
    float _260 = float(uint(_110));
    float _262 = float(as_type<uint>(_89));
    int _264 = _200 + 48;
    float _266 = 1.0 / _260;
    int _268 = ~_110;
    int _270 = _268 + 1;
    int _272 = ~_110;
    int _274 = _272 + 1;
    uint _276 = uint(int(uint(_264) >> uint(2)));
    packed_uint2 _dmw3 = *(const device packed_uint2*)&(*spvDescriptorSet0.vp_s0)._m0[int(_276)];
    float _278 = as_type<float>(_dmw3.x);
    int _280 = _264 + 4;
    uint _282 = uint(int(uint(_280) >> uint(2)));
    float _284 = as_type<float>(_dmw3.y);
    float _286 = float(as_type<int>(_106));
    float _288 = 1.0 / _286;
    int _290 = as_type<int>(_266) + (-2);
    float _292 = as_type<float>(_290) * _262;
    float _294 = trunc(_292);
    float _296 = precise::max(_294, 0.0);
    uint _298 = uint(_296);
    int _300 = _270 * int(_298);
    int _302 = _300 + as_type<int>(_89);
    float _304 = float(uint(_302));
    float _306 = as_type<float>(_290) * _304;
    float _308 = trunc(_306);
    float _310 = precise::max(_308, 0.0);
    uint _312 = uint(_310);
    int _314 = int(_298) + int(_312);
    int _316 = _274 * _314;
    int _318 = _316 + as_type<int>(_89);
    bool _320 = uint(_318) >= uint(_110);
    bool _322 = !_320;
    int _324 = _322 ? 0 : (-1);
    bool _326 = _110 == 0;
    int _328 = ~_314;
    int _330 = _328 + _324;
    int _332 = _330 + 1;
    int _334 = _110 * _332;
    int _336 = _334 + as_type<int>(_89);
    float _338 = -_212;
    float _340 = _338 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _342 = -_206;
    float _344 = _342 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _346 = -_218;
    float _348 = _346 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _350 = abs(_224);
    float _352 = _350 * 0.5;
    float _354 = _340 * _340;
    float _356 = _234 * _234;
    float _358 = fma(_344, _344, _354);
    float _360 = fma(_228, _228, _356);
    float _362 = fma(_348, _348, _358);
    float _364 = fma(_240, _240, _360);
    float _366 = _252 * _252;
    float _368 = rsqrt(_362);
    float _370 = fma(_246, _246, _366);
    float _372 = (*spvDescriptorSet0.vp_c12)._m0[4].y + (-1.0);
    float _374 = rsqrt(_364);
    float _376 = _344 * _368;
    float _378 = _348 * _368;
    float _380 = _340 * _368;
    float _382 = 1.0 / _372;
    float _384 = _240 * _374;
    float _386 = _228 * _374;
    float _388 = _234 * _374;
    float _390 = _376 * _384;
    float _392 = _378 * _388;
    float _394 = -_390;
    float _396 = fma(_378, _386, _394);
    float _398 = _380 * _386;
    float _400 = fma(_258, _258, _370);
    float _402 = -_392;
    float _404 = fma(_380, _384, _402);
    float _406 = _396 * _396;
    float _408 = -_398;
    float _410 = fma(_376, _388, _408);
    float _412 = float(_196);
    float _414 = fma(_404, _404, _406);
    float _416 = rsqrt(_400);
    bool _418 = !_326;
    int _420 = _418 ? _336 : (-1);
    float _422 = _412 * _382;
    float _424 = fma(_410, _410, _414);
    float _426 = float(_420);
    float _428 = rsqrt(_424);
    float _430 = _426 * _288;
    float _432 = _430 * 6.283185482025146484375;
    float _434 = _246 * _416;
    float _436 = _258 * _416;
    float _438 = _252 * _416;
    float _440 = -_422;
    float _442 = _440 + 1.0;
    float _444 = _432 * 0.15915493667125701904296875;
    float _446 = abs(_442);
    float _448 = log2(_446);
    float _450 = _410 * _428;
    float _452 = _404 * _428;
    float _454 = _396 * _428;
    float _456 = _434 * _450;
    float _458 = _436 * _454;
    float _460 = _444 * 6.283185482025146484375;
    float _462 = cos(_460);
    float _464 = -_456;
    float _466 = fma(_436, _452, _464);
    float _468 = _438 * _452;
    float _470 = -_458;
    float _472 = fma(_438, _450, _470);
    float _474 = _466 * _466;
    float _476 = -_468;
    float _478 = fma(_434, _454, _476);
    float _480 = _444 * 6.283185482025146484375;
    float _482 = sin(_480);
    float _484 = fma(_472, _472, _474);
    float _486 = fma(_478, _478, _484);
    float _488 = 1.0 + (*spvDescriptorSet0.vp_c12)._m0[6].y;
    float _490 = _462 * _352;
    float _492 = rsqrt(_486);
    float _494 = _488 * _448;
    float _496 = exp2(_494);
    float _498 = _352 * _492;
    float _500 = _482 * _498;
    float _502 = -(*spvDescriptorSet0.vp_c12)._m0[1].z;
    float _504 = _502 + (*spvDescriptorSet0.vp_c12)._m0[1].w;
    float _506 = -_496;
    float _508 = _506 + 1.0;
    float _510 = _472 * _500;
    float _512 = _478 * _500;
    float _514 = _466 * _500;
    float _516 = fma(_508, _504, (*spvDescriptorSet0.vp_c12)._m0[1].z);
    float _518 = fma(_452, _490, _510);
    float _520 = fma(_450, _490, _512);
    float _522 = fma(_454, _490, _514);
    float _524 = fma(_516, _518, _206);
    float _526 = fma(_516, _520, _218);
    int _528 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1048576;
    bool _530 = _528 != 0;
    float _532 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _534 = _524 + _532;
    float _536 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _538 = _526 + _536;
    float _540 = _534 * _534;
    float _542 = _538 * _538;
    float _544 = _540 + _542;
    float _546 = _518;
    float _548 = _496;
    float _550 = _504;
    float _552 = _514;
    float _554 = _520;
    float _556 = _516;
    float _558 = _524;
    if (!_530)
    {
        _546 = 0.0;
        _548 = 0.0;
    }
    float _560 = _546;
    float _562 = _548;
    float _564 = _560;
    float _566 = _562;
    if (!_530)
    {
        _550 = 0.0;
    }
    float _568 = _550;
    float _570 = sqrt(_544);
    bool _572 = _570 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _574 = !_530;
    float _576 = _568;
    float _578 = _284;
    if (!_574)
    {
        float _580 = -(*spvDescriptorSet0.vp_c10)._m0[5].w;
        float _582 = (*spvDescriptorSet0.vp_c8)._m0[29].y + _580;
        float _584 = -(*spvDescriptorSet0.vp_c10)._m0[4].w;
        float _586 = (*spvDescriptorSet0.vp_c8)._m0[29].x + _584;
        float _588 = _582 * _582;
        float _590 = -(*spvDescriptorSet0.vp_c10)._m0[6].w;
        float _592 = (*spvDescriptorSet0.vp_c8)._m0[29].z + _590;
        float _594 = fma(_586, _586, _588);
        float _596 = fma(_592, _592, _594);
        float _598 = rsqrt(_596);
        float _600 = _598 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
        float _602 = _586 * _600;
        float _604 = _582 * _600;
        float _606 = _592 * _600;
        _552 = _600;
        _554 = _598;
        _564 = _604;
        _566 = _602;
        _576 = _606;
    }
    float _608 = _552;
    float _610 = _554;
    float _612 = _564;
    float _614 = _566;
    float _616 = _576;
    float _618 = fma(_516, _522, _212);
    float _620 = _610;
    float _622 = _608;
    float _624 = _618;
    if (!_572)
    {
        _620 = _524;
    }
    float _626 = _620;
    float _628 = _626;
    if (!_572)
    {
        _622 = _542;
    }
    float _630 = _622;
    float _632 = _630;
    if (!_572)
    {
        _556 = _540;
    }
    float _634 = _556;
    float _636 = _634;
    if (!_572)
    {
        _558 = _526;
    }
    float _638 = _558;
    bool _640 = !_572;
    float _642 = _638;
    if (!_640)
    {
        float _644 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _646 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _648 = _570 + _646;
        float _650 = _618 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _652 = rsqrt(_544);
        float _654 = _648 * _644;
        float _656 = _654 * 0.15915493667125701904296875;
        float _658 = _656 * 6.283185482025146484375;
        float _660 = sin(_658);
        float _662 = _656 * 6.283185482025146484375;
        float _664 = cos(_662);
        float _666 = fma(_660, _650, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _668 = _652 * _666;
        float _670 = _664 + (-1.0);
        float _672 = fma(_534, _668, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _674 = fma(_538, _668, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _676 = _670 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _678 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _680 = _672 + _678;
        float _682 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _684 = _674 + _682;
        float _686 = fma(_618, _664, _676);
        float _688 = _680 * _680;
        float _690 = _684 * _684;
        _624 = _686;
        _636 = _688;
        _632 = _690;
        _628 = _672;
        _642 = _674;
    }
    float _692 = _624;
    float _694 = _636;
    float _696 = _632;
    float _698 = _628;
    float _700 = _642;
    float _702 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _704 = _692 + _702;
    float _706 = fma(_704, _704, _694);
    float _708 = (*spvDescriptorSet0.vp_c12)._m0[2].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _710 = _706 + _696;
    float _712 = (*spvDescriptorSet0.vp_c12)._m0[2].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _714 = sqrt(_710);
    float _716 = (*spvDescriptorSet0.vp_c12)._m0[2].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _718 = (*spvDescriptorSet0.vp_c12)._m0[2].w * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _720 = (*spvDescriptorSet0.vp_c12)._m0[3].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _722 = (*spvDescriptorSet0.vp_c12)._m0[3].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _724 = (*spvDescriptorSet0.vp_c12)._m0[3].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _726 = (*spvDescriptorSet0.vp_c12)._m0[3].w * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_58.x = _712;
    out.m_58.y = _708;
    out.m_58.z = _716;
    out.m_58.w = _718;
    out.m_60.x = _720;
    out.m_60.y = _722;
    out.m_60.z = _724;
    out.m_60.w = _726;
    bool _728 = _714 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _730 = isnan(_714);
    bool _732 = _728 || _730;
    bool _734 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _736 = _732 || _734;
    float _738 = (*spvDescriptorSet0.vp_c12)._m0[2].x;
    float _740 = _724;
    if (!_736)
    {
        _738 = 1.0;
    }
    float _742 = _738;
    bool _744 = !_736;
    float _746 = _742;
    if (!_744)
    {
        bool _748 = _714 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _750 = isnan(_714);
        bool _752 = _748 || _750;
        bool _754 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _756 = _752 || _754;
        if (!_756)
        {
            float _758 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _760 = _714 + _758;
            float _762 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _764 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _762;
            float _766 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _768 = _766 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _770 = 1.0 / _764;
            float _772 = _760 * _770;
            float _774 = fma(_772, _768, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _746 = _774;
            _776 = true;
        }
        else
        {
            bool _778 = _714 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _780 = isnan(_714);
            bool _782 = _778 || _780;
            bool _784 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _786 = _782 || _784;
            if (!_786)
            {
                float _788 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _790 = _714 + _788;
                float _792 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _794 = _792 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _796 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _798 = _796 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _800 = 1.0 / _794;
                float _802 = _790 * _800;
                float _804 = fma(_802, _798, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _746 = _804;
                _776 = true;
            }
            else
            {
                _746 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _776 = false;
    float _806 = _746;
    float _808 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _810 = _692 + _808;
    float _812 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _814 = _698 + _812;
    float _816 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _818 = _700 + _816;
    float _820 = fma(_810, _806, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _822 = fma(_814, _806, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _824 = fma(_818, _806, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _826 = _820 + _612;
    float _828 = _822 + _614;
    float _830 = _824 + _616;
    float _832 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _834 = _826 + _832;
    float _836 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _838 = _828 + _836;
    float _840 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _842 = _830 + _840;
    float _844 = _834 * _834;
    float _846 = fma(_838, _838, _844);
    float _848 = fma(_842, _842, _846);
    float _850 = rsqrt(_848);
    float _852 = sqrt(_848);
    float _854 = _850 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _856 = _838 * _854;
    float _858 = _842 * _854;
    float _860 = _856 * _856;
    float _862 = _858 * _858;
    float _864 = _860 + _862;
    float _866 = sqrt(_864);
    bool _868 = _866 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _870 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _872 = _866 + _870;
    float _874 = _842;
    float _876 = _864;
    float _878 = _872;
    float _880 = _820;
    float _882 = _834;
    if (_868)
    {
        float _884 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _874 = _884;
    }
    float _886 = _874;
    if (_868)
    {
        float _888 = rsqrt(_864);
        _876 = _888;
    }
    float _890 = _876;
    float _892 = _890;
    if (_868)
    {
        float _894 = _872 * _886;
        _878 = _894;
    }
    float _896 = _878;
    if (_868)
    {
        float _898 = _896 * 0.15915493667125701904296875;
        _880 = _898;
    }
    float _900 = _880;
    float _902 = _886;
    float _904 = _900;
    if (_868)
    {
        float _906 = _900 * 6.283185482025146484375;
        float _908 = sin(_906);
        _902 = _908;
    }
    float _910 = _902;
    float _912 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _914 = precise::max(0.0, _912);
    float _916 = _844;
    float _918 = _914;
    if (_868)
    {
        float _920 = _900 * 6.283185482025146484375;
        float _922 = cos(_920);
        _916 = _922;
    }
    float _924 = _916;
    float _926 = -_854;
    float _928 = -_914;
    float _930 = fma(_834, _926, _928);
    if (_868)
    {
        float _932 = _930 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _918 = _932;
    }
    float _934 = _918;
    float _936 = _910;
    float _938 = _934;
    if (_868)
    {
        float _940 = fma(_910, _934, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _882 = _940;
    }
    float _942 = _882;
    float _944 = _942;
    if (!_868)
    {
        _936 = _856;
    }
    float _946 = _936;
    float _948 = _946;
    float _950 = _924;
    if (_868)
    {
        float _952 = _924 + (-1.0);
        _938 = _952;
    }
    float _954 = _938;
    float _956 = _954;
    if (_868)
    {
        float _958 = _890 * _942;
        _740 = _958;
    }
    float _960 = _740;
    if (!_868)
    {
        _944 = _930;
    }
    float _962 = _944;
    float _964 = _962;
    if (_868)
    {
        float _966 = _954 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _904 = _966;
    }
    float _968 = _904;
    if (_868)
    {
        float _970 = _856 * _960;
        _948 = _970;
    }
    float _972 = _948;
    if (!_868)
    {
        _956 = _858;
    }
    float _974 = _956;
    float _976 = _974;
    if (_868)
    {
        float _978 = _858 * _960;
        _976 = _978;
    }
    float _980 = _976;
    if (!_868)
    {
        _892 = _860;
    }
    float _982 = _892;
    float _984 = _982;
    if (_868)
    {
        float _986 = fma(_930, _924, _968);
        _964 = _986;
    }
    float _988 = _964;
    if (_868)
    {
        float _990 = _972 * _972;
        _984 = _990;
    }
    float _992 = _984;
    if (!_868)
    {
        _950 = _862;
    }
    float _994 = _950;
    float _996 = _994;
    if (_868)
    {
        float _998 = _980 * _980;
        _996 = _998;
    }
    float _1000 = _996;
    float _1002 = fma(_988, _988, _992);
    float _1004 = _826 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1006 = _1002 + _1000;
    float _1008 = _826 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1010 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1012 = fma(_852, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1010);
    float _1014 = precise::clamp(_1012, 0.0, 1.0);
    float _1016 = _826 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1018 = rsqrt(_1006);
    float _1020 = fma(_828, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1008);
    float _1022 = -_1014;
    float _1024 = _1022 + 1.0;
    float _1026 = fma(_828, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1016);
    float _1028 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1030 = fma(_830, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1020);
    float _1032 = _826 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1034 = fma(_830, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1026);
    float _1036 = abs(_1024);
    float _1038 = log2(_1036);
    float _1040 = _1030 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1042 = fma(_828, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1032);
    float _1044 = _1034 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1046 = fma(_828, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1004);
    float _1048 = _1040 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1050 = fma(_830, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1042);
    float _1052 = _1018 * _972;
    float _1054 = _1018 * _988;
    float _1056 = _1050 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1058 = _1044 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1060 = _1052 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1062 = -_1048;
    float _1064 = fma(_1062, _1028, 1.0);
    float _1066 = _1018 * _980;
    float _1068 = fma(_830, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1046);
    float _1070 = -_1060;
    float _1072 = fma(_1054, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1070);
    float _1074 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1058);
    float _1076 = _1044 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1078 = _1068 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1080 = -_1066;
    float _1082 = fma(_1080, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1072);
    float _1084 = fma(_1040, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1074);
    float _1086 = _1038 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1088 = _1044 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1090 = fma(_1082, -0.5, 0.5);
    float _1092 = fma(_1078, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1084);
    float _1094 = log2(_1064);
    float _1096 = fma(_1082, 0.5, 0.5);
    float _1098 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1088);
    float _1100 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1076);
    float _1102 = _1054 + 1.0;
    float _1104 = fma(_1040, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1098);
    float _1106 = fma(_1040, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1100);
    float _1108 = 1.0 / _1092;
    float _1110 = fma(_1078, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1104);
    float _1112 = fma(_1078, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1106);
    float _1114 = exp2(_1086);
    float _1116 = _1094 * 0.693147182464599609375;
    float _1118 = sqrt(_1090);
    float _1120 = fma(_1096, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1122 = _1110 * _1108;
    float _1124 = _1112 * _1108;
    float _1126 = _1116 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1128 = fma(_1096, _1120, -0.212114393711090087890625);
    float _1130 = fma(_1122, 0.5, 0.5);
    float _1132 = fma(_1124, -0.5, 0.5);
    float _1134 = -_1054;
    float _1136 = fma(_1114, _1102, _1134);
    float _1138 = fma(_1096, _1128, 1.570728778839111328125);
    float _1140 = fma(_1136, 0.5, 0.5);
    float _1142 = _1118 * 0.636619746685028076171875;
    float _1144 = -_1138;
    float _1146 = fma(_1142, _1144, 1.0);
    float3 _3372 = float3(_1130, _1132, _1126);
    float _1148 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3372, float3(0.0), isnan(_3372)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3372, float3(0.0), isnan(_3372)), level(0.0)).x;
    float3 _3383 = float3(_1130, _1132, _1126);
    float4 _1151 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3383, float3(0.0), isnan(_3383)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3383, float3(0.0), isnan(_3383)), level(0.0)).xyzw;
    float _1153 = _1151.x;
    float _1155 = _1151.y;
    float _1157 = _1151.z;
    float _1159 = _1151.w;
    float2 _3400 = float2(_1146, _1140);
    float3 _1163 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3400, float2(0.0), isnan(_3400)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3400, float2(0.0), isnan(_3400)), level(0.0)).xyz;
    float _1165 = _1163.x;
    float _1167 = _1163.y;
    float _1169 = _1163.z;
    int _1171 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1173 = _1171 != 0;
    float _1175 = _212 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    int _1177 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1179 = _1177 != 0;
    float _1181 = _212 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    int _1183 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1185 = _1183 != 0;
    float _1187 = fma(_206, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1175);
    int _1189 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 524288;
    bool _1191 = _1189 != 0;
    float _1193 = fma(_206, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1181);
    int _1195 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1197 = _1195 != 0;
    float _1199 = _212 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1201 = _212 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1203 = fma(_218, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1193);
    float _1205 = 0.0;
    float _1207 = _1199;
    bool _1209 = _1173;
    bool _1211 = _1179;
    float _1213 = _1038;
    if (_1173)
    {
        _1205 = (*spvDescriptorSet0.vp_c12)._m0[0].y;
    }
    float _1215 = _1205;
    float _1217 = fma(_206, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1199);
    float _1219 = _1215;
    if (!_1173)
    {
        float _1221 = -_278;
        float _1223 = (-0.0) + _1221;
        _1207 = _1223;
    }
    float _1225 = _1207;
    bool _1227 = false;
    float _1229 = _1225;
    if (_1173)
    {
        bool _1231 = _1215 > 0.5;
        _1227 = _1231;
    }
    bool _1233 = _1227;
    float _1235 = fma(_218, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1217);
    bool _1237 = _1233;
    if (_1179)
    {
        _1219 = (*spvDescriptorSet0.vp_c12)._m0[0].x;
    }
    float _1239 = _1219;
    if (_1173)
    {
        float _1241 = -_278;
        float _1243 = _1233 ? _278 : _1241;
        _1229 = _1243;
    }
    float _1245 = _1229;
    float _1247 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _1249 = _1245;
    if (_1179)
    {
        bool _1251 = _1239 > 0.5;
        _1209 = _1251;
    }
    bool _1253 = _1209;
    float _1255 = fma(_218, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1187);
    float _1257 = fma((*spvDescriptorSet0.vp_c9)._m0[79].z, (*spvDescriptorSet0.vp_c12)._m0[0].z, _1247);
    float _1259 = _1235 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1261 = _1255 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1263 = fma(_206, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1201);
    float _1265 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[79].x, _1257);
    float _1267 = _1261 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1269 = _1261 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1271 = fma(_218, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1263);
    float _1273 = _1265 * (-0.15915493667125701904296875);
    float _1275 = fma(_1259, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1267);
    float _1277 = fma(_1259, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1269);
    float _1279 = _1203 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1281 = _1271 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1283 = fma(_1279, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1277);
    float _1285 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1287 = (*spvDescriptorSet0.vp_c9)._m0[77].x * (*spvDescriptorSet0.vp_c12)._m0[0].x;
    float _1289 = fma(_1281, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1283);
    float _1291 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1293 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1295 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1297 = _1293 || _1295;
    bool _1299 = isnan(0.5);
    bool _1301 = _1297 || _1299;
    float _1303 = -_1285;
    float _1305 = fma(_1287, 2.0, _1303);
    float _1307 = 1.0 / _1289;
    float _1309 = fma(_1279, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1275);
    float _1311 = fma((*spvDescriptorSet0.vp_c9)._m0[78].z, (*spvDescriptorSet0.vp_c12)._m0[0].x, _1291);
    float _1313 = _1291;
    if (_1185)
    {
        _1313 = (*spvDescriptorSet0.vp_c12)._m0[0].z;
    }
    float _1315 = _1313;
    float _1317 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1319 = (*spvDescriptorSet0.vp_c9)._m0[77].y * (*spvDescriptorSet0.vp_c12)._m0[0].y;
    float _1321 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1323 = _1273 * 6.283185482025146484375;
    float _1325 = sin(_1323);
    float _1327 = fma(_1281, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1309);
    float _1329 = _1315;
    float _1331 = _1321;
    if (_1185)
    {
        bool _1333 = _1315 > 0.5;
        _1237 = _1333;
    }
    bool _1335 = _1237;
    float _1337 = fma((*spvDescriptorSet0.vp_c9)._m0[78].w, (*spvDescriptorSet0.vp_c12)._m0[0].y, _1321);
    if (_1197)
    {
        _1329 = (*spvDescriptorSet0.vp_c12)._m0[0].w;
    }
    float _1339 = _1329;
    float _1341 = -(*spvDescriptorSet0.vp_c12)._m0[1].x;
    float _1343 = _1341 + (*spvDescriptorSet0.vp_c12)._m0[1].y;
    float _1345 = fma(_1319, -2.0, _1317);
    if (!_1179)
    {
        _1331 = _430;
    }
    float _1347 = _1331;
    float _1349 = _1273 * 6.283185482025146484375;
    float _1351 = cos(_1349);
    float _1353 = _1327 + _1289;
    float _1355 = _1347;
    if (_1179)
    {
        float _1357 = -_430;
        float _1359 = _1253 ? _1357 : _430;
        _1355 = _1359;
    }
    float _1361 = _1355;
    float _1363 = _1245 + 0.5;
    if (_1197)
    {
        bool _1365 = _1339 > 0.5;
        _1211 = _1365;
    }
    bool _1367 = _1211;
    float _1369 = fma(_422, _1343, (*spvDescriptorSet0.vp_c12)._m0[1].x);
    float _1371 = _1353 * _1307;
    float _1373 = _1371 * 0.5;
    float _1375 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1377 = _1361 + (-0.5);
    if (!_1185)
    {
        _1249 = _430;
    }
    float _1379 = _1249;
    float _1381 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1383 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1381);
    float _1385 = _1363 * _1325;
    float _1387 = _1379;
    if (_1185)
    {
        float _1389 = -_430;
        float _1391 = _1335 ? _1389 : _430;
        _1387 = _1391;
    }
    float _1393 = _1387;
    float _1395 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1345);
    float _1397 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1305);
    float _1399 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1401 = _1363 * _1351;
    float _1403 = -_1385;
    float _1405 = fma(_1377, _1351, _1403);
    float _1407 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1311);
    float _1409 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1337);
    float _1411 = fma(_1377, _1325, _1401);
    float _1413 = _1405 + 0.5;
    float _1415 = _1393 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1417 = 1.0 / _1383;
    float _1419 = _1375 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1421 = _1044 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1423 = _1411 + (-0.5);
    float _1425 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1421);
    float _1427 = fma(_1419, _1413, _1397);
    float _1429 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1431 = _1399 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1433 = _1399;
    float _1435 = _1431;
    if (!_1197)
    {
        float _1437 = -_284;
        float _1439 = (-0.0) + _1437;
        _1433 = _1439;
    }
    float _1441 = _1433;
    float _1443 = _1441;
    if (_1197)
    {
        float _1445 = -_284;
        float _1447 = _1367 ? _284 : _1445;
        _1443 = _1447;
    }
    float _1449 = _1443;
    float _1451 = fma(_1040, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1425);
    float _1453 = -_1431;
    float _1455 = -_1395;
    float _1457 = fma(_1453, _1423, _1455);
    if (_1301)
    {
        _1435 = 1.0;
    }
    float _1459 = _1435;
    float _1461 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1463 = _1459;
    if (_1301)
    {
        _578 = 1.0;
    }
    float _1465 = _578;
    float _1467 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1469 = _1417 * _1467;
    float _1471 = _1044;
    float _1473 = _1465;
    if (_1191)
    {
        float _1475 = 1.0 / _1092;
        _1471 = _1475;
    }
    float _1477 = _1471;
    float _1479 = _1477;
    if (!_1301)
    {
        float _1481 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1483 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1485 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1483;
        float _1487 = _1481 * 0.15915493667125701904296875;
        float _1489 = _1487 * 6.283185482025146484375;
        float _1491 = cos(_1489);
        float _1493 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1495 = _1493 * 0.15915493667125701904296875;
        float _1497 = _1487 * 6.283185482025146484375;
        float _1499 = sin(_1497);
        float _1501 = 1.0 / _1491;
        float _1503 = _1495 * 6.283185482025146484375;
        float _1505 = cos(_1503);
        float _1507 = _1499 * _1501;
        float _1509 = _1495 * 6.283185482025146484375;
        float _1511 = sin(_1509);
        float _1513 = _1505 * _1507;
        float _1515 = 1.0 / _1485;
        float _1517 = 1.0 / _1513;
        float _1519 = _1511 * _1517;
        float _1521 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1523 = fma(_1469, _1519, _1521);
        float _1525 = _1523 * _1515;
        float _1527 = precise::clamp(_1525, 0.0, 1.0);
        _1463 = _1527;
    }
    float _1529 = _1463;
    if (!_1301)
    {
        float _1531 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1533 = _1531 * 0.15915493667125701904296875;
        float _1535 = _1533 * 6.283185482025146484375;
        float _1537 = cos(_1535);
        float _1539 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1541 = _1539 * 0.15915493667125701904296875;
        float _1543 = _1533 * 6.283185482025146484375;
        float _1545 = sin(_1543);
        float _1547 = 1.0 / _1537;
        float _1549 = _1541 * 6.283185482025146484375;
        float _1551 = cos(_1549);
        float _1553 = _1545 * _1547;
        float _1555 = _1541 * 6.283185482025146484375;
        float _1557 = sin(_1555);
        float _1559 = _1551 * _1553;
        float _1561 = 1.0 / _1559;
        float _1563 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1565 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1563;
        float _1567 = 1.0 / _1565;
        float _1569 = _1557 * _1561;
        float _1571 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1573 = fma(_1469, _1569, _1571);
        float _1575 = _1573 * _1567;
        float _1577 = precise::clamp(_1575, 0.0, 1.0);
        float _1579 = -_1577;
        float _1581 = _1579 + 1.0;
        _1473 = _1581;
    }
    float _1583 = _1473;
    float _1585 = fma(_1078, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1451);
    float _1587 = _1038 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1589 = _1449 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1591 = -_1409;
    float _1593 = _1591 + 1.0;
    float _1595 = -_1407;
    float _1597 = _1595 + 1.0;
    float _1599 = _1415 * _1429;
    if (_1191)
    {
        float _1601 = -_1585;
        float _1603 = fma(_1601, _1477, 1.0);
        _1479 = _1603;
    }
    float _1605 = _1479;
    float _1607 = exp2(_1587);
    float _1609 = _1529 * _1583;
    float _1611 = -_1589;
    float _1613 = fma(_1611, _1461, -0.0);
    float _1615 = fma(_1411, _1593, _1457);
    float _1617 = -_1597;
    float _1619 = fma(_1405, _1617, _1427);
    if (!_1191)
    {
        _1213 = _1585;
    }
    float _1621 = _1213;
    float _1623 = _1621;
    if (_1191)
    {
        float _1625 = -_1605;
        float _1627 = fma(_1625, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1585);
        _1623 = _1627;
    }
    float _1629 = _1623;
    float _1631 = _1609 * _1369;
    out.m_62.x = _828;
    out.m_62.y = _826;
    out.m_62.z = _830;
    float _1633 = _1110 + _1092;
    float _1635 = _1092 * 0.5;
    float _1637 = _1092 + _1629;
    out.m_64.x = _1619;
    out.m_64.y = _1615;
    out.m_64.z = _1599;
    out.m_64.w = _1613;
    float _1639 = _1633 * 0.5;
    float _1641 = fma(_1112, -0.5, _1635);
    float _1643 = -_1607;
    float _1645 = _1643 + 1.0;
    float _1647 = _1637 * 0.5;
    out.gl_Position.x = _1110;
    out.gl_Position.y = _1112;
    out.gl_Position.z = _1585;
    out.gl_Position.w = _1092;
    float _1649 = _1645 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (_1191)
    {
        out.gl_Position.z = _1629;
    }
    float _1651 = _1649 * _1148;
    float _1653 = _1631 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1655 = -_1649;
    float _1657 = _1655 + 1.0;
    float _1659 = _1159 * _1651;
    float _1661 = _1169 * _1651;
    float _1663 = _1653 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1665 = fma(_1165, _1659, _1153);
    float _1667 = fma(_1167, _1659, _1155);
    float _1669 = _1159 * _1657;
    float _1671 = fma(_1159, _1661, _1157);
    out.m_66.x = _1639;
    out.m_66.y = _1641;
    out.m_66.z = _1647;
    out.m_66.w = _1092;
    out.m_68.x = _1663;
    out.m_70.x = _1665;
    out.m_70.y = _1667;
    out.m_70.z = _1671;
    out.m_70.w = _1669;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint dm_vid = gl_VertexIndex;
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _776 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _84 = trunc((*spvDescriptorSet0.vp_c12)._m0[6].x);
    int _87 = int(_84);
    float _89 = as_type<float>(int(gl_VertexIndex));
    int _91 = max(0, _87);
    int _93 = min(_91, 5);
    int _95 = _93 << 2;
    int _97 = abs(as_type<int>(_89));
    uint _100 = uint(int(uint(_95) >> uint(2)));
    uint _102 = uint(int(uint(int(_100)) >> uint(2)));
    int _104 = int(_100) & 3;
    float _106 = (*spvDescriptorSet0.vp_c1)._m0[int(_102)][_104];
    float _108 = float(uint(_97));
    int _110 = as_type<int>(_106) + 1;
    int _112 = abs(_110);
    float _114 = float(uint(_112));
    float _116 = 1.0 / _114;
    int _118 = as_type<int>(_116) + (-2);
    float _120 = as_type<float>(_118) * _108;
    float _122 = trunc(_120);
    float _124 = precise::max(_122, 0.0);
    uint _126 = uint(_124);
    int _128 = ~int(_126);
    int _130 = _128 + 1;
    int _132 = _130 * _112;
    int _134 = _132 + _97;
    float _136 = float(uint(_134));
    float _138 = as_type<float>(_118) * _136;
    float _140 = trunc(_138);
    float _142 = precise::max(_140, 0.0);
    uint _144 = uint(_142);
    int _146 = int(_126) + int(_144);
    int _148 = as_type<int>(_89) ^ _110;
    int _150 = ~_146;
    int _152 = _150 + 1;
    uint _154 = uint(int(uint(_148) >> uint(31)));
    int _156 = _152 * _112;
    int _158 = _156 + _97;
    int _160 = ~int(_154);
    int _162 = _160 + 1;
    bool _166 = uint(_158) >= uint(_112);
    float _168 = (*spvDescriptorSet0.vp_c12)._m0[4].z * (*spvDescriptorSet0.vp_c12)._m0[5].w;
    bool _170 = !_166;
    int _172 = _170 ? 0 : (-1);
    float _174 = trunc(_168);
    int _176 = int(_174);
    bool _178 = _110 == 0;
    int _180 = ~_172;
    int _182 = _146 + _180;
    int _184 = _182 + 1;
    int _186 = _184 ^ _162;
    int _188 = ~_162;
    int _190 = _188 + _186;
    int _192 = _190 + 1;
    bool _194 = !_178;
    int _196 = _194 ? _192 : (-1);
    int _198 = _196 + _176;
    int _200 = _198 * 96;
    int _202 = _200 + 32;
    uint _204 = uint(int(uint(_200) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_204)];
    float _206 = as_type<float>(_dmw0.x);
    int _208 = _200 + 4;
    uint _210 = uint(int(uint(_208) >> uint(2)));
    float _212 = as_type<float>(_dmw0.y);
    int _214 = _200 + 8;
    uint _216 = uint(int(uint(_214) >> uint(2)));
    float _218 = as_type<float>(_dmw0.z);
    int _220 = _200 + 12;
    uint _222 = uint(int(uint(_220) >> uint(2)));
    float _224 = as_type<float>(_dmw0.w);
    uint _226 = uint(int(uint(_202) >> uint(2)));
    packed_uint3 _dmw2 = *(const device packed_uint3*)&(*spvDescriptorSet0.vp_s0)._m0[int(_226)];
    float _228 = as_type<float>(_dmw2.x);
    int _230 = _202 + 4;
    uint _232 = uint(int(uint(_230) >> uint(2)));
    float _234 = as_type<float>(_dmw2.y);
    int _236 = _202 + 8;
    uint _238 = uint(int(uint(_236) >> uint(2)));
    float _240 = as_type<float>(_dmw2.z);
    int _242 = _200 + 16;
    uint _244 = uint(int(uint(_242) >> uint(2)));
    packed_uint3 _dmw1 = *(const device packed_uint3*)&(*spvDescriptorSet0.vp_s0)._m0[int(_244)];
    float _246 = as_type<float>(_dmw1.x);
    int _248 = _242 + 4;
    uint _250 = uint(int(uint(_248) >> uint(2)));
    float _252 = as_type<float>(_dmw1.y);
    int _254 = _242 + 8;
    uint _256 = uint(int(uint(_254) >> uint(2)));
    float _258 = as_type<float>(_dmw1.z);
    float _260 = float(uint(_110));
    float _262 = float(as_type<uint>(_89));
    int _264 = _200 + 48;
    float _266 = 1.0 / _260;
    int _268 = ~_110;
    int _270 = _268 + 1;
    int _272 = ~_110;
    int _274 = _272 + 1;
    uint _276 = uint(int(uint(_264) >> uint(2)));
    packed_uint2 _dmw3 = *(const device packed_uint2*)&(*spvDescriptorSet0.vp_s0)._m0[int(_276)];
    float _278 = as_type<float>(_dmw3.x);
    int _280 = _264 + 4;
    uint _282 = uint(int(uint(_280) >> uint(2)));
    float _284 = as_type<float>(_dmw3.y);
    float _286 = float(as_type<int>(_106));
    float _288 = 1.0 / _286;
    int _290 = as_type<int>(_266) + (-2);
    float _292 = as_type<float>(_290) * _262;
    float _294 = trunc(_292);
    float _296 = precise::max(_294, 0.0);
    uint _298 = uint(_296);
    int _300 = _270 * int(_298);
    int _302 = _300 + as_type<int>(_89);
    float _304 = float(uint(_302));
    float _306 = as_type<float>(_290) * _304;
    float _308 = trunc(_306);
    float _310 = precise::max(_308, 0.0);
    uint _312 = uint(_310);
    int _314 = int(_298) + int(_312);
    int _316 = _274 * _314;
    int _318 = _316 + as_type<int>(_89);
    bool _320 = uint(_318) >= uint(_110);
    bool _322 = !_320;
    int _324 = _322 ? 0 : (-1);
    bool _326 = _110 == 0;
    int _328 = ~_314;
    int _330 = _328 + _324;
    int _332 = _330 + 1;
    int _334 = _110 * _332;
    int _336 = _334 + as_type<int>(_89);
    float _338 = -_212;
    float _340 = _338 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _342 = -_206;
    float _344 = _342 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _346 = -_218;
    float _348 = _346 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _350 = abs(_224);
    float _352 = _350 * 0.5;
    float _354 = _340 * _340;
    float _356 = _234 * _234;
    float _358 = fma(_344, _344, _354);
    float _360 = fma(_228, _228, _356);
    float _362 = fma(_348, _348, _358);
    float _364 = fma(_240, _240, _360);
    float _366 = _252 * _252;
    float _368 = rsqrt(_362);
    float _370 = fma(_246, _246, _366);
    float _372 = (*spvDescriptorSet0.vp_c12)._m0[4].y + (-1.0);
    float _374 = rsqrt(_364);
    float _376 = _344 * _368;
    float _378 = _348 * _368;
    float _380 = _340 * _368;
    float _382 = 1.0 / _372;
    float _384 = _240 * _374;
    float _386 = _228 * _374;
    float _388 = _234 * _374;
    float _390 = _376 * _384;
    float _392 = _378 * _388;
    float _394 = -_390;
    float _396 = fma(_378, _386, _394);
    float _398 = _380 * _386;
    float _400 = fma(_258, _258, _370);
    float _402 = -_392;
    float _404 = fma(_380, _384, _402);
    float _406 = _396 * _396;
    float _408 = -_398;
    float _410 = fma(_376, _388, _408);
    float _412 = float(_196);
    float _414 = fma(_404, _404, _406);
    float _416 = rsqrt(_400);
    bool _418 = !_326;
    int _420 = _418 ? _336 : (-1);
    float _422 = _412 * _382;
    float _424 = fma(_410, _410, _414);
    float _426 = float(_420);
    float _428 = rsqrt(_424);
    float _430 = _426 * _288;
    float _432 = _430 * 6.283185482025146484375;
    float _434 = _246 * _416;
    float _436 = _258 * _416;
    float _438 = _252 * _416;
    float _440 = -_422;
    float _442 = _440 + 1.0;
    float _444 = _432 * 0.15915493667125701904296875;
    float _446 = abs(_442);
    float _448 = log2(_446);
    float _450 = _410 * _428;
    float _452 = _404 * _428;
    float _454 = _396 * _428;
    float _456 = _434 * _450;
    float _458 = _436 * _454;
    float _460 = _444 * 6.283185482025146484375;
    float _462 = cos(_460);
    float _464 = -_456;
    float _466 = fma(_436, _452, _464);
    float _468 = _438 * _452;
    float _470 = -_458;
    float _472 = fma(_438, _450, _470);
    float _474 = _466 * _466;
    float _476 = -_468;
    float _478 = fma(_434, _454, _476);
    float _480 = _444 * 6.283185482025146484375;
    float _482 = sin(_480);
    float _484 = fma(_472, _472, _474);
    float _486 = fma(_478, _478, _484);
    float _488 = 1.0 + (*spvDescriptorSet0.vp_c12)._m0[6].y;
    float _490 = _462 * _352;
    float _492 = rsqrt(_486);
    float _494 = _488 * _448;
    float _496 = exp2(_494);
    float _498 = _352 * _492;
    float _500 = _482 * _498;
    float _502 = -(*spvDescriptorSet0.vp_c12)._m0[1].z;
    float _504 = _502 + (*spvDescriptorSet0.vp_c12)._m0[1].w;
    float _506 = -_496;
    float _508 = _506 + 1.0;
    float _510 = _472 * _500;
    float _512 = _478 * _500;
    float _514 = _466 * _500;
    float _516 = fma(_508, _504, (*spvDescriptorSet0.vp_c12)._m0[1].z);
    float _518 = fma(_452, _490, _510);
    float _520 = fma(_450, _490, _512);
    float _522 = fma(_454, _490, _514);
    float _524 = fma(_516, _518, _206);
    float _526 = fma(_516, _520, _218);
    int _528 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1048576;
    bool _530 = _528 != 0;
    float _532 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _534 = _524 + _532;
    float _536 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _538 = _526 + _536;
    float _540 = _534 * _534;
    float _542 = _538 * _538;
    float _544 = _540 + _542;
    float _546 = _518;
    float _548 = _496;
    float _550 = _504;
    float _552 = _514;
    float _554 = _520;
    float _556 = _516;
    float _558 = _524;
    if (!_530)
    {
        _546 = 0.0;
        _548 = 0.0;
    }
    float _560 = _546;
    float _562 = _548;
    float _564 = _560;
    float _566 = _562;
    if (!_530)
    {
        _550 = 0.0;
    }
    float _568 = _550;
    float _570 = sqrt(_544);
    bool _572 = _570 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _574 = !_530;
    float _576 = _568;
    float _578 = _284;
    if (!_574)
    {
        float _580 = -(*spvDescriptorSet0.vp_c10)._m0[5].w;
        float _582 = (*spvDescriptorSet0.vp_c8)._m0[29].y + _580;
        float _584 = -(*spvDescriptorSet0.vp_c10)._m0[4].w;
        float _586 = (*spvDescriptorSet0.vp_c8)._m0[29].x + _584;
        float _588 = _582 * _582;
        float _590 = -(*spvDescriptorSet0.vp_c10)._m0[6].w;
        float _592 = (*spvDescriptorSet0.vp_c8)._m0[29].z + _590;
        float _594 = fma(_586, _586, _588);
        float _596 = fma(_592, _592, _594);
        float _598 = rsqrt(_596);
        float _600 = _598 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
        float _602 = _586 * _600;
        float _604 = _582 * _600;
        float _606 = _592 * _600;
        _552 = _600;
        _554 = _598;
        _564 = _604;
        _566 = _602;
        _576 = _606;
    }
    float _608 = _552;
    float _610 = _554;
    float _612 = _564;
    float _614 = _566;
    float _616 = _576;
    float _618 = fma(_516, _522, _212);
    float _620 = _610;
    float _622 = _608;
    float _624 = _618;
    if (!_572)
    {
        _620 = _524;
    }
    float _626 = _620;
    float _628 = _626;
    if (!_572)
    {
        _622 = _542;
    }
    float _630 = _622;
    float _632 = _630;
    if (!_572)
    {
        _556 = _540;
    }
    float _634 = _556;
    float _636 = _634;
    if (!_572)
    {
        _558 = _526;
    }
    float _638 = _558;
    bool _640 = !_572;
    float _642 = _638;
    if (!_640)
    {
        float _644 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _646 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _648 = _570 + _646;
        float _650 = _618 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _652 = rsqrt(_544);
        float _654 = _648 * _644;
        float _656 = _654 * 0.15915493667125701904296875;
        float _658 = _656 * 6.283185482025146484375;
        float _660 = sin(_658);
        float _662 = _656 * 6.283185482025146484375;
        float _664 = cos(_662);
        float _666 = fma(_660, _650, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _668 = _652 * _666;
        float _670 = _664 + (-1.0);
        float _672 = fma(_534, _668, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _674 = fma(_538, _668, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _676 = _670 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _678 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _680 = _672 + _678;
        float _682 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _684 = _674 + _682;
        float _686 = fma(_618, _664, _676);
        float _688 = _680 * _680;
        float _690 = _684 * _684;
        _624 = _686;
        _636 = _688;
        _632 = _690;
        _628 = _672;
        _642 = _674;
    }
    float _692 = _624;
    float _694 = _636;
    float _696 = _632;
    float _698 = _628;
    float _700 = _642;
    float _702 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _704 = _692 + _702;
    float _706 = fma(_704, _704, _694);
    float _708 = (*spvDescriptorSet0.vp_c12)._m0[2].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _710 = _706 + _696;
    float _712 = (*spvDescriptorSet0.vp_c12)._m0[2].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _714 = sqrt(_710);
    float _716 = (*spvDescriptorSet0.vp_c12)._m0[2].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _718 = (*spvDescriptorSet0.vp_c12)._m0[2].w * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _720 = (*spvDescriptorSet0.vp_c12)._m0[3].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _722 = (*spvDescriptorSet0.vp_c12)._m0[3].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _724 = (*spvDescriptorSet0.vp_c12)._m0[3].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _726 = (*spvDescriptorSet0.vp_c12)._m0[3].w * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_58.x = _712;
    out.m_58.y = _708;
    out.m_58.z = _716;
    out.m_58.w = _718;
    out.m_60.x = _720;
    out.m_60.y = _722;
    out.m_60.z = _724;
    out.m_60.w = _726;
    bool _728 = _714 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _730 = isnan(_714);
    bool _732 = _728 || _730;
    bool _734 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _736 = _732 || _734;
    float _738 = (*spvDescriptorSet0.vp_c12)._m0[2].x;
    float _740 = _724;
    if (!_736)
    {
        _738 = 1.0;
    }
    float _742 = _738;
    bool _744 = !_736;
    float _746 = _742;
    if (!_744)
    {
        bool _748 = _714 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _750 = isnan(_714);
        bool _752 = _748 || _750;
        bool _754 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _756 = _752 || _754;
        if (!_756)
        {
            float _758 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _760 = _714 + _758;
            float _762 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _764 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _762;
            float _766 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _768 = _766 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _770 = 1.0 / _764;
            float _772 = _760 * _770;
            float _774 = fma(_772, _768, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _746 = _774;
            _776 = true;
        }
        else
        {
            bool _778 = _714 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _780 = isnan(_714);
            bool _782 = _778 || _780;
            bool _784 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _786 = _782 || _784;
            if (!_786)
            {
                float _788 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _790 = _714 + _788;
                float _792 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _794 = _792 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _796 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _798 = _796 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _800 = 1.0 / _794;
                float _802 = _790 * _800;
                float _804 = fma(_802, _798, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _746 = _804;
                _776 = true;
            }
            else
            {
                _746 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _776 = false;
    float _806 = _746;
    float _808 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _810 = _692 + _808;
    float _812 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _814 = _698 + _812;
    float _816 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _818 = _700 + _816;
    float _820 = fma(_810, _806, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _822 = fma(_814, _806, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _824 = fma(_818, _806, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _826 = _820 + _612;
    float _828 = _822 + _614;
    float _830 = _824 + _616;
    float _832 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _834 = _826 + _832;
    float _836 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _838 = _828 + _836;
    float _840 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _842 = _830 + _840;
    float _844 = _834 * _834;
    float _846 = fma(_838, _838, _844);
    float _848 = fma(_842, _842, _846);
    float _850 = rsqrt(_848);
    float _852 = sqrt(_848);
    float _854 = _850 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _856 = _838 * _854;
    float _858 = _842 * _854;
    float _860 = _856 * _856;
    float _862 = _858 * _858;
    float _864 = _860 + _862;
    float _866 = sqrt(_864);
    bool _868 = _866 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _870 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _872 = _866 + _870;
    float _874 = _842;
    float _876 = _864;
    float _878 = _872;
    float _880 = _820;
    float _882 = _834;
    if (_868)
    {
        float _884 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _874 = _884;
    }
    float _886 = _874;
    if (_868)
    {
        float _888 = rsqrt(_864);
        _876 = _888;
    }
    float _890 = _876;
    float _892 = _890;
    if (_868)
    {
        float _894 = _872 * _886;
        _878 = _894;
    }
    float _896 = _878;
    if (_868)
    {
        float _898 = _896 * 0.15915493667125701904296875;
        _880 = _898;
    }
    float _900 = _880;
    float _902 = _886;
    float _904 = _900;
    if (_868)
    {
        float _906 = _900 * 6.283185482025146484375;
        float _908 = sin(_906);
        _902 = _908;
    }
    float _910 = _902;
    float _912 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _914 = precise::max(0.0, _912);
    float _916 = _844;
    float _918 = _914;
    if (_868)
    {
        float _920 = _900 * 6.283185482025146484375;
        float _922 = cos(_920);
        _916 = _922;
    }
    float _924 = _916;
    float _926 = -_854;
    float _928 = -_914;
    float _930 = fma(_834, _926, _928);
    if (_868)
    {
        float _932 = _930 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _918 = _932;
    }
    float _934 = _918;
    float _936 = _910;
    float _938 = _934;
    if (_868)
    {
        float _940 = fma(_910, _934, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _882 = _940;
    }
    float _942 = _882;
    float _944 = _942;
    if (!_868)
    {
        _936 = _856;
    }
    float _946 = _936;
    float _948 = _946;
    float _950 = _924;
    if (_868)
    {
        float _952 = _924 + (-1.0);
        _938 = _952;
    }
    float _954 = _938;
    float _956 = _954;
    if (_868)
    {
        float _958 = _890 * _942;
        _740 = _958;
    }
    float _960 = _740;
    if (!_868)
    {
        _944 = _930;
    }
    float _962 = _944;
    float _964 = _962;
    if (_868)
    {
        float _966 = _954 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _904 = _966;
    }
    float _968 = _904;
    if (_868)
    {
        float _970 = _856 * _960;
        _948 = _970;
    }
    float _972 = _948;
    if (!_868)
    {
        _956 = _858;
    }
    float _974 = _956;
    float _976 = _974;
    if (_868)
    {
        float _978 = _858 * _960;
        _976 = _978;
    }
    float _980 = _976;
    if (!_868)
    {
        _892 = _860;
    }
    float _982 = _892;
    float _984 = _982;
    if (_868)
    {
        float _986 = fma(_930, _924, _968);
        _964 = _986;
    }
    float _988 = _964;
    if (_868)
    {
        float _990 = _972 * _972;
        _984 = _990;
    }
    float _992 = _984;
    if (!_868)
    {
        _950 = _862;
    }
    float _994 = _950;
    float _996 = _994;
    if (_868)
    {
        float _998 = _980 * _980;
        _996 = _998;
    }
    float _1000 = _996;
    float _1002 = fma(_988, _988, _992);
    float _1004 = _826 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1006 = _1002 + _1000;
    float _1008 = _826 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1010 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1012 = fma(_852, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1010);
    float _1014 = precise::clamp(_1012, 0.0, 1.0);
    float _1016 = _826 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1018 = rsqrt(_1006);
    float _1020 = fma(_828, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1008);
    float _1022 = -_1014;
    float _1024 = _1022 + 1.0;
    float _1026 = fma(_828, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1016);
    float _1028 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1030 = fma(_830, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1020);
    float _1032 = _826 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1034 = fma(_830, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1026);
    float _1036 = abs(_1024);
    float _1038 = log2(_1036);
    float _1040 = _1030 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1042 = fma(_828, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1032);
    float _1044 = _1034 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1046 = fma(_828, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1004);
    float _1048 = _1040 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1050 = fma(_830, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1042);
    float _1052 = _1018 * _972;
    float _1054 = _1018 * _988;
    float _1056 = _1050 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1058 = _1044 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1060 = _1052 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1062 = -_1048;
    float _1064 = fma(_1062, _1028, 1.0);
    float _1066 = _1018 * _980;
    float _1068 = fma(_830, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1046);
    float _1070 = -_1060;
    float _1072 = fma(_1054, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1070);
    float _1074 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1058);
    float _1076 = _1044 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1078 = _1068 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1080 = -_1066;
    float _1082 = fma(_1080, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1072);
    float _1084 = fma(_1040, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1074);
    float _1086 = _1038 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1088 = _1044 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1090 = fma(_1082, -0.5, 0.5);
    float _1092 = fma(_1078, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1084);
    float _1094 = log2(_1064);
    float _1096 = fma(_1082, 0.5, 0.5);
    float _1098 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1088);
    float _1100 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1076);
    float _1102 = _1054 + 1.0;
    float _1104 = fma(_1040, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1098);
    float _1106 = fma(_1040, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1100);
    float _1108 = 1.0 / _1092;
    float _1110 = fma(_1078, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1104);
    float _1112 = fma(_1078, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1106);
    float _1114 = exp2(_1086);
    float _1116 = _1094 * 0.693147182464599609375;
    float _1118 = sqrt(_1090);
    float _1120 = fma(_1096, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1122 = _1110 * _1108;
    float _1124 = _1112 * _1108;
    float _1126 = _1116 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1128 = fma(_1096, _1120, -0.212114393711090087890625);
    float _1130 = fma(_1122, 0.5, 0.5);
    float _1132 = fma(_1124, -0.5, 0.5);
    float _1134 = -_1054;
    float _1136 = fma(_1114, _1102, _1134);
    float _1138 = fma(_1096, _1128, 1.570728778839111328125);
    float _1140 = fma(_1136, 0.5, 0.5);
    float _1142 = _1118 * 0.636619746685028076171875;
    float _1144 = -_1138;
    float _1146 = fma(_1142, _1144, 1.0);
    float3 _3372 = float3(_1130, _1132, _1126);
    float _1148 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3372, float3(0.0), isnan(_3372)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3372, float3(0.0), isnan(_3372)), level(0.0)).x;
    float3 _3383 = float3(_1130, _1132, _1126);
    float4 _1151 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3383, float3(0.0), isnan(_3383)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3383, float3(0.0), isnan(_3383)), level(0.0)).xyzw;
    float _1153 = _1151.x;
    float _1155 = _1151.y;
    float _1157 = _1151.z;
    float _1159 = _1151.w;
    float2 _3400 = float2(_1146, _1140);
    float3 _1163 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3400, float2(0.0), isnan(_3400)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3400, float2(0.0), isnan(_3400)), level(0.0)).xyz;
    float _1165 = _1163.x;
    float _1167 = _1163.y;
    float _1169 = _1163.z;
    int _1171 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1173 = _1171 != 0;
    float _1175 = _212 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    int _1177 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1179 = _1177 != 0;
    float _1181 = _212 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    int _1183 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1185 = _1183 != 0;
    float _1187 = fma(_206, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1175);
    int _1189 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 524288;
    bool _1191 = _1189 != 0;
    float _1193 = fma(_206, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1181);
    int _1195 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1197 = _1195 != 0;
    float _1199 = _212 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1201 = _212 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1203 = fma(_218, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1193);
    float _1205 = 0.0;
    float _1207 = _1199;
    bool _1209 = _1173;
    bool _1211 = _1179;
    float _1213 = _1038;
    if (_1173)
    {
        _1205 = (*spvDescriptorSet0.vp_c12)._m0[0].y;
    }
    float _1215 = _1205;
    float _1217 = fma(_206, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1199);
    float _1219 = _1215;
    if (!_1173)
    {
        float _1221 = -_278;
        float _1223 = (-0.0) + _1221;
        _1207 = _1223;
    }
    float _1225 = _1207;
    bool _1227 = false;
    float _1229 = _1225;
    if (_1173)
    {
        bool _1231 = _1215 > 0.5;
        _1227 = _1231;
    }
    bool _1233 = _1227;
    float _1235 = fma(_218, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1217);
    bool _1237 = _1233;
    if (_1179)
    {
        _1219 = (*spvDescriptorSet0.vp_c12)._m0[0].x;
    }
    float _1239 = _1219;
    if (_1173)
    {
        float _1241 = -_278;
        float _1243 = _1233 ? _278 : _1241;
        _1229 = _1243;
    }
    float _1245 = _1229;
    float _1247 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _1249 = _1245;
    if (_1179)
    {
        bool _1251 = _1239 > 0.5;
        _1209 = _1251;
    }
    bool _1253 = _1209;
    float _1255 = fma(_218, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1187);
    float _1257 = fma((*spvDescriptorSet0.vp_c9)._m0[79].z, (*spvDescriptorSet0.vp_c12)._m0[0].z, _1247);
    float _1259 = _1235 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1261 = _1255 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1263 = fma(_206, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1201);
    float _1265 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[79].x, _1257);
    float _1267 = _1261 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1269 = _1261 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1271 = fma(_218, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1263);
    float _1273 = _1265 * (-0.15915493667125701904296875);
    float _1275 = fma(_1259, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1267);
    float _1277 = fma(_1259, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1269);
    float _1279 = _1203 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1281 = _1271 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1283 = fma(_1279, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1277);
    float _1285 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1287 = (*spvDescriptorSet0.vp_c9)._m0[77].x * (*spvDescriptorSet0.vp_c12)._m0[0].x;
    float _1289 = fma(_1281, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1283);
    float _1291 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1293 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1295 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1297 = _1293 || _1295;
    bool _1299 = isnan(0.5);
    bool _1301 = _1297 || _1299;
    float _1303 = -_1285;
    float _1305 = fma(_1287, 2.0, _1303);
    float _1307 = 1.0 / _1289;
    float _1309 = fma(_1279, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1275);
    float _1311 = fma((*spvDescriptorSet0.vp_c9)._m0[78].z, (*spvDescriptorSet0.vp_c12)._m0[0].x, _1291);
    float _1313 = _1291;
    if (_1185)
    {
        _1313 = (*spvDescriptorSet0.vp_c12)._m0[0].z;
    }
    float _1315 = _1313;
    float _1317 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1319 = (*spvDescriptorSet0.vp_c9)._m0[77].y * (*spvDescriptorSet0.vp_c12)._m0[0].y;
    float _1321 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1323 = _1273 * 6.283185482025146484375;
    float _1325 = sin(_1323);
    float _1327 = fma(_1281, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1309);
    float _1329 = _1315;
    float _1331 = _1321;
    if (_1185)
    {
        bool _1333 = _1315 > 0.5;
        _1237 = _1333;
    }
    bool _1335 = _1237;
    float _1337 = fma((*spvDescriptorSet0.vp_c9)._m0[78].w, (*spvDescriptorSet0.vp_c12)._m0[0].y, _1321);
    if (_1197)
    {
        _1329 = (*spvDescriptorSet0.vp_c12)._m0[0].w;
    }
    float _1339 = _1329;
    float _1341 = -(*spvDescriptorSet0.vp_c12)._m0[1].x;
    float _1343 = _1341 + (*spvDescriptorSet0.vp_c12)._m0[1].y;
    float _1345 = fma(_1319, -2.0, _1317);
    if (!_1179)
    {
        _1331 = _430;
    }
    float _1347 = _1331;
    float _1349 = _1273 * 6.283185482025146484375;
    float _1351 = cos(_1349);
    float _1353 = _1327 + _1289;
    float _1355 = _1347;
    if (_1179)
    {
        float _1357 = -_430;
        float _1359 = _1253 ? _1357 : _430;
        _1355 = _1359;
    }
    float _1361 = _1355;
    float _1363 = _1245 + 0.5;
    if (_1197)
    {
        bool _1365 = _1339 > 0.5;
        _1211 = _1365;
    }
    bool _1367 = _1211;
    float _1369 = fma(_422, _1343, (*spvDescriptorSet0.vp_c12)._m0[1].x);
    float _1371 = _1353 * _1307;
    float _1373 = _1371 * 0.5;
    float _1375 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1377 = _1361 + (-0.5);
    if (!_1185)
    {
        _1249 = _430;
    }
    float _1379 = _1249;
    float _1381 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1383 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1381);
    float _1385 = _1363 * _1325;
    float _1387 = _1379;
    if (_1185)
    {
        float _1389 = -_430;
        float _1391 = _1335 ? _1389 : _430;
        _1387 = _1391;
    }
    float _1393 = _1387;
    float _1395 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1345);
    float _1397 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1305);
    float _1399 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1401 = _1363 * _1351;
    float _1403 = -_1385;
    float _1405 = fma(_1377, _1351, _1403);
    float _1407 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1311);
    float _1409 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1337);
    float _1411 = fma(_1377, _1325, _1401);
    float _1413 = _1405 + 0.5;
    float _1415 = _1393 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1417 = 1.0 / _1383;
    float _1419 = _1375 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1421 = _1044 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1423 = _1411 + (-0.5);
    float _1425 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1421);
    float _1427 = fma(_1419, _1413, _1397);
    float _1429 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1431 = _1399 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1433 = _1399;
    float _1435 = _1431;
    if (!_1197)
    {
        float _1437 = -_284;
        float _1439 = (-0.0) + _1437;
        _1433 = _1439;
    }
    float _1441 = _1433;
    float _1443 = _1441;
    if (_1197)
    {
        float _1445 = -_284;
        float _1447 = _1367 ? _284 : _1445;
        _1443 = _1447;
    }
    float _1449 = _1443;
    float _1451 = fma(_1040, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1425);
    float _1453 = -_1431;
    float _1455 = -_1395;
    float _1457 = fma(_1453, _1423, _1455);
    if (_1301)
    {
        _1435 = 1.0;
    }
    float _1459 = _1435;
    float _1461 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1463 = _1459;
    if (_1301)
    {
        _578 = 1.0;
    }
    float _1465 = _578;
    float _1467 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1469 = _1417 * _1467;
    float _1471 = _1044;
    float _1473 = _1465;
    if (_1191)
    {
        float _1475 = 1.0 / _1092;
        _1471 = _1475;
    }
    float _1477 = _1471;
    float _1479 = _1477;
    if (!_1301)
    {
        float _1481 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1483 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1485 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1483;
        float _1487 = _1481 * 0.15915493667125701904296875;
        float _1489 = _1487 * 6.283185482025146484375;
        float _1491 = cos(_1489);
        float _1493 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1495 = _1493 * 0.15915493667125701904296875;
        float _1497 = _1487 * 6.283185482025146484375;
        float _1499 = sin(_1497);
        float _1501 = 1.0 / _1491;
        float _1503 = _1495 * 6.283185482025146484375;
        float _1505 = cos(_1503);
        float _1507 = _1499 * _1501;
        float _1509 = _1495 * 6.283185482025146484375;
        float _1511 = sin(_1509);
        float _1513 = _1505 * _1507;
        float _1515 = 1.0 / _1485;
        float _1517 = 1.0 / _1513;
        float _1519 = _1511 * _1517;
        float _1521 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1523 = fma(_1469, _1519, _1521);
        float _1525 = _1523 * _1515;
        float _1527 = precise::clamp(_1525, 0.0, 1.0);
        _1463 = _1527;
    }
    float _1529 = _1463;
    if (!_1301)
    {
        float _1531 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1533 = _1531 * 0.15915493667125701904296875;
        float _1535 = _1533 * 6.283185482025146484375;
        float _1537 = cos(_1535);
        float _1539 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1541 = _1539 * 0.15915493667125701904296875;
        float _1543 = _1533 * 6.283185482025146484375;
        float _1545 = sin(_1543);
        float _1547 = 1.0 / _1537;
        float _1549 = _1541 * 6.283185482025146484375;
        float _1551 = cos(_1549);
        float _1553 = _1545 * _1547;
        float _1555 = _1541 * 6.283185482025146484375;
        float _1557 = sin(_1555);
        float _1559 = _1551 * _1553;
        float _1561 = 1.0 / _1559;
        float _1563 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1565 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1563;
        float _1567 = 1.0 / _1565;
        float _1569 = _1557 * _1561;
        float _1571 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1573 = fma(_1469, _1569, _1571);
        float _1575 = _1573 * _1567;
        float _1577 = precise::clamp(_1575, 0.0, 1.0);
        float _1579 = -_1577;
        float _1581 = _1579 + 1.0;
        _1473 = _1581;
    }
    float _1583 = _1473;
    float _1585 = fma(_1078, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1451);
    float _1587 = _1038 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1589 = _1449 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1591 = -_1409;
    float _1593 = _1591 + 1.0;
    float _1595 = -_1407;
    float _1597 = _1595 + 1.0;
    float _1599 = _1415 * _1429;
    if (_1191)
    {
        float _1601 = -_1585;
        float _1603 = fma(_1601, _1477, 1.0);
        _1479 = _1603;
    }
    float _1605 = _1479;
    float _1607 = exp2(_1587);
    float _1609 = _1529 * _1583;
    float _1611 = -_1589;
    float _1613 = fma(_1611, _1461, -0.0);
    float _1615 = fma(_1411, _1593, _1457);
    float _1617 = -_1597;
    float _1619 = fma(_1405, _1617, _1427);
    if (!_1191)
    {
        _1213 = _1585;
    }
    float _1621 = _1213;
    float _1623 = _1621;
    if (_1191)
    {
        float _1625 = -_1605;
        float _1627 = fma(_1625, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1585);
        _1623 = _1627;
    }
    float _1629 = _1623;
    float _1631 = _1609 * _1369;
    out.m_62.x = _828;
    out.m_62.y = _826;
    out.m_62.z = _830;
    float _1633 = _1110 + _1092;
    float _1635 = _1092 * 0.5;
    float _1637 = _1092 + _1629;
    out.m_64.x = _1619;
    out.m_64.y = _1615;
    out.m_64.z = _1599;
    out.m_64.w = _1613;
    float _1639 = _1633 * 0.5;
    float _1641 = fma(_1112, -0.5, _1635);
    float _1643 = -_1607;
    float _1645 = _1643 + 1.0;
    float _1647 = _1637 * 0.5;
    out.gl_Position.x = _1110;
    out.gl_Position.y = _1112;
    out.gl_Position.z = _1585;
    out.gl_Position.w = _1092;
    float _1649 = _1645 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (_1191)
    {
        out.gl_Position.z = _1629;
    }
    float _1651 = _1649 * _1148;
    float _1653 = _1631 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1655 = -_1649;
    float _1657 = _1655 + 1.0;
    float _1659 = _1159 * _1651;
    float _1661 = _1169 * _1651;
    float _1663 = _1653 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1665 = fma(_1165, _1659, _1153);
    float _1667 = fma(_1167, _1659, _1155);
    float _1669 = _1159 * _1657;
    float _1671 = fma(_1159, _1661, _1157);
    out.m_66.x = _1639;
    out.m_66.y = _1641;
    out.m_66.z = _1647;
    out.m_66.w = _1092;
    out.m_68.x = _1663;
    out.m_70.x = _1665;
    out.m_70.y = _1667;
    out.m_70.z = _1671;
    out.m_70.w = _1669;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

