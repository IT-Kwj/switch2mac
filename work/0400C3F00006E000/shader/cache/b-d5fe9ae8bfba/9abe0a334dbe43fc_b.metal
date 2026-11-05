#pragma clang diagnostic ignored "-Wmissing-prototypes"

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

template <typename T>
static inline depth2d<T> spvDepthCast(texture2d<T> t)
{
    return reinterpret_cast<thread const depth2d<T> &>(t);
}

template <typename T>
static inline depth2d_array<T> spvDepthCast(texture2d_array<T> t)
{
    return reinterpret_cast<thread const depth2d_array<T> &>(t);
}

template <typename T>
static inline depthcube<T> spvDepthCast(texturecube<T> t)
{
    return reinterpret_cast<thread const depthcube<T> &>(t);
}

template <typename T>
static inline depthcube_array<T> spvDepthCast(texturecube_array<T> t)
{
    return reinterpret_cast<thread const depthcube_array<T> &>(t);
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

struct _39
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _16* vp_c1 [[id(0)]];
    constant _16* vp_c15 [[id(1)]];
    constant _16* vp_c12 [[id(2)]];
    constant _16* vp_c9 [[id(3)]];
    constant _16* vp_c10 [[id(4)]];
    constant _16* vp_c8 [[id(5)]];
    constant _16* vp_c16 [[id(6)]];
    constant _16* vp_c13 [[id(7)]];
    constant _16* vp_c7 [[id(8)]];
    const device _39* vp_s0 [[id(9)]];
    texture2d<float> vp_t_tcb_24 [[id(10)]];
    sampler vp_t_tcb_24Smplr [[id(11)]];
    texture2d_array<float> vp_t_tcb_16 [[id(12)]];
    sampler vp_t_tcb_16Smplr [[id(13)]];
    texture3d<float> vp_t_tcb_32 [[id(14)]];
    sampler vp_t_tcb_32Smplr [[id(15)]];
    texture3d<float> vp_t_tcb_30 [[id(16)]];
    sampler vp_t_tcb_30Smplr [[id(17)]];
    texture2d<float> vp_t_tcb_1C [[id(18)]];
    sampler vp_t_tcb_1CSmplr [[id(19)]];
    texture2d_array<float> vp_t_tcb_14 [[id(20)]];
    sampler vp_t_tcb_14Smplr [[id(21)]];
    sampler vp_t_tcb_24Smplr_w [[id(22)]];
    sampler vp_t_tcb_32Smplr_w [[id(23)]];
    sampler vp_t_tcb_30Smplr_w [[id(24)]];
    sampler vp_t_tcb_1CSmplr_w [[id(25)]];
    sampler vp_t_tcb_14Smplr_w [[id(26)]];
    constant dm_border_t* dm_border [[id(27)]];
};

struct main0_out
{
    float4 m_72 [[user(locn0)]];
    float4 m_74 [[user(locn1)]];
    float4 m_78 [[user(locn2)]];
    float4 m_80 [[user(locn3)]];
    float4 m_90 [[user(locn4)]];
    float4 m_88 [[user(locn5)]];
    float4 m_76 [[user(locn6)]];
    float4 m_86 [[user(locn7)]];
    float4 m_82 [[user(locn8)]];
    float4 m_84 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

vertex main0_out main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2339 = false;
    bool _1018 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _104 = trunc((*spvDescriptorSet0.vp_c12)._m0[6].x);
    int _107 = int(_104);
    float _109 = as_type<float>(int(gl_VertexIndex));
    int _111 = max(0, _107);
    int _113 = min(_111, 5);
    int _115 = _113 << 2;
    int _117 = abs(as_type<int>(_109));
    uint _120 = uint(int(uint(_115) >> uint(2)));
    uint _122 = uint(int(uint(int(_120)) >> uint(2)));
    int _124 = int(_120) & 3;
    float _126 = (*spvDescriptorSet0.vp_c1)._m0[int(_122)][_124];
    float _128 = float(uint(_117));
    int _130 = as_type<int>(_126) + 1;
    int _132 = abs(_130);
    float _134 = float(uint(_132));
    float _136 = 1.0 / _134;
    int _138 = as_type<int>(_136) + (-2);
    float _140 = as_type<float>(_138) * _128;
    float _142 = trunc(_140);
    float _144 = precise::max(_142, 0.0);
    uint _146 = uint(_144);
    int _148 = ~int(_146);
    int _150 = _148 + 1;
    int _152 = _150 * _132;
    int _154 = _152 + _117;
    float _156 = float(uint(_154));
    float _158 = as_type<float>(_138) * _156;
    float _160 = trunc(_158);
    float _162 = precise::max(_160, 0.0);
    uint _164 = uint(_162);
    int _166 = int(_146) + int(_164);
    int _168 = ~_166;
    int _170 = _168 + 1;
    int _172 = as_type<int>(_109) ^ _130;
    int _174 = _170 * _132;
    int _176 = _174 + _117;
    uint _178 = uint(int(uint(_172) >> uint(31)));
    bool _182 = uint(_176) >= uint(_132);
    float _184 = (*spvDescriptorSet0.vp_c12)._m0[4].z * (*spvDescriptorSet0.vp_c12)._m0[5].w;
    int _186 = ~int(_178);
    int _188 = _186 + 1;
    bool _190 = !_182;
    int _192 = _190 ? 0 : (-1);
    bool _194 = _130 == 0;
    float _196 = trunc(_184);
    int _198 = int(_196);
    int _200 = ~_192;
    int _202 = _166 + _200;
    int _204 = _202 + 1;
    int _206 = _204 ^ _188;
    int _208 = ~_188;
    int _210 = _208 + _206;
    int _212 = _210 + 1;
    bool _214 = !_194;
    int _216 = _214 ? _212 : (-1);
    int _218 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1048576;
    bool _220 = _218 != 0;
    int _222 = _216 + 1;
    int _224 = _216 + _198;
    float _226 = float(_222);
    int _228 = _224 * 96;
    bool _230 = _226 != (*spvDescriptorSet0.vp_c12)._m0[5].w;
    bool _232 = isnan(_226);
    bool _234 = _230 || _232;
    bool _236 = isnan((*spvDescriptorSet0.vp_c12)._m0[5].w);
    bool _238 = _234 || _236;
    int _240 = _228 + 16;
    uint _242 = uint(int(uint(_228) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_242)];
    float _244 = as_type<float>(_dmw0.x);
    int _246 = _228 + 4;
    uint _248 = uint(int(uint(_246) >> uint(2)));
    float _250 = as_type<float>(_dmw0.y);
    int _252 = _228 + 8;
    uint _254 = uint(int(uint(_252) >> uint(2)));
    float _256 = as_type<float>(_dmw0.z);
    int _258 = _228 + 12;
    uint _260 = uint(int(uint(_258) >> uint(2)));
    float _262 = as_type<float>(_dmw0.w);
    int _264 = _228 + 80;
    int _266 = _228 + 48;
    uint _268 = uint(int(uint(_240) >> uint(2)));
    packed_uint4 _dmw1 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_268)];
    float _270 = as_type<float>(_dmw1.x);
    int _272 = _240 + 4;
    uint _274 = uint(int(uint(_272) >> uint(2)));
    float _276 = as_type<float>(_dmw1.y);
    int _278 = _240 + 8;
    uint _280 = uint(int(uint(_278) >> uint(2)));
    float _282 = as_type<float>(_dmw1.z);
    int _284 = _240 + 12;
    uint _286 = uint(int(uint(_284) >> uint(2)));
    float _288 = as_type<float>(_dmw1.w);
    float _290 = as_type<float>(_198);
    float _292 = as_type<float>(_212);
    float _294 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    if (!_220)
    {
        _290 = 0.0;
    }
    float _296 = _290;
    uint _298 = uint(int(uint(_264) >> uint(2)));
    packed_uint4 _dmw2 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_298)];
    float _300 = as_type<float>(_dmw2.x);
    int _302 = _264 + 4;
    uint _304 = uint(int(uint(_302) >> uint(2)));
    float _306 = as_type<float>(_dmw2.y);
    int _308 = _264 + 8;
    uint _310 = uint(int(uint(_308) >> uint(2)));
    float _312 = as_type<float>(_dmw2.z);
    int _314 = _264 + 12;
    uint _316 = uint(int(uint(_314) >> uint(2)));
    float _318 = as_type<float>(_dmw2.w);
    float _320 = 0.0;
    float _322 = _296;
    if (!_220)
    {
        _320 = 0.0;
    }
    float _324 = _320;
    float _326 = _324;
    if (!_220)
    {
        _292 = 0.0;
    }
    float _328 = _292;
    uint _330 = uint(int(uint(_266) >> uint(2)));
    float _332 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_330)]);
    uint _334 = 0u;
    float _336 = _328;
    if (!_238)
    {
        int _338 = _228 + (-96);
        _334 = uint(_338);
    }
    uint _340 = _334;
    bool _342 = !_220;
    float _344 = 0.0;
    float _346 = 0.0;
    float _348 = _288;
    float _350 = _318;
    if (!_342)
    {
        float _352 = -(*spvDescriptorSet0.vp_c10)._m0[5].w;
        float _354 = (*spvDescriptorSet0.vp_c8)._m0[29].y + _352;
        float _356 = -(*spvDescriptorSet0.vp_c10)._m0[4].w;
        float _358 = (*spvDescriptorSet0.vp_c8)._m0[29].x + _356;
        float _360 = _354 * _354;
        float _362 = -(*spvDescriptorSet0.vp_c10)._m0[6].w;
        float _364 = (*spvDescriptorSet0.vp_c8)._m0[29].z + _362;
        float _366 = fma(_358, _358, _360);
        float _368 = fma(_364, _364, _366);
        float _370 = rsqrt(_368);
        float _372 = _370 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
        float _374 = _358 * _372;
        float _376 = _354 * _372;
        float _378 = _364 * _372;
        _344 = _370;
        _346 = _372;
        _326 = _376;
        _322 = _374;
        _336 = _378;
    }
    float _380 = _344;
    float _382 = _346;
    float _384 = _326;
    float _386 = _322;
    float _388 = _336;
    float _390 = _380;
    float _392 = 0.0;
    float _394 = _382;
    int _396 = 0;
    if (!_238)
    {
        uint _398 = uint(int(uint(int(_340)) >> uint(2)));
        float _400 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_398)]);
        int _402 = int(_340) + 4;
        uint _404 = uint(int(uint(_402) >> uint(2)));
        float _406 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_404)]);
        int _408 = int(_340) + 8;
        uint _410 = uint(int(uint(_408) >> uint(2)));
        float _412 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_410)]);
        int _414 = int(_340) + 12;
        uint _416 = uint(int(uint(_414) >> uint(2)));
        float _418 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_416)]);
        _390 = _400;
        _392 = _406;
        _394 = _412;
        _396 = as_type<int>(_418);
    }
    float _420 = _390;
    float _422 = _392;
    float _424 = _394;
    int _426 = _396;
    if (!_238)
    {
        float _428 = _244 + _244;
        _348 = _428;
    }
    float _430 = _348;
    float _432 = 0.0;
    if (!_238)
    {
        float _434 = _250 + _250;
        _432 = _434;
    }
    float _436 = _432;
    if (!_238)
    {
        float _438 = _256 + _256;
        _350 = _438;
    }
    float _440 = _350;
    float _442 = float(as_type<int>(_126));
    float _444 = 1.0 / _442;
    float _446 = abs(_262);
    float _448 = _446 * 0.5;
    float _450 = _420;
    float _452 = _422;
    float _454 = _424;
    int _456 = _426;
    if (!_238)
    {
        float _458 = -_420;
        float _460 = _430 + _458;
        _450 = _460;
    }
    float _462 = _450;
    if (!_238)
    {
        float _464 = -_422;
        float _466 = _436 + _464;
        _452 = _466;
    }
    float _468 = _452;
    if (!_238)
    {
        float _470 = -_424;
        float _472 = _440 + _470;
        _454 = _472;
    }
    float _474 = _454;
    if (_238)
    {
        int _476 = _228 + 96;
        _456 = _476;
    }
    int _478 = _456;
    float _480 = _462;
    float _482 = _468;
    float _484 = _474;
    if (_238)
    {
        uint _486 = uint(int(uint(_478) >> uint(2)));
        packed_uint3 _dmw3 = *(const device packed_uint3*)&(*spvDescriptorSet0.vp_s0)._m0[int(_486)];
        float _488 = as_type<float>(_dmw3.x);
        int _490 = _478 + 4;
        uint _492 = uint(int(uint(_490) >> uint(2)));
        float _494 = as_type<float>(_dmw3.y);
        int _496 = _478 + 8;
        uint _498 = uint(int(uint(_496) >> uint(2)));
        float _500 = as_type<float>(_dmw3.z);
        _480 = _488;
        _482 = _494;
        _484 = _500;
    }
    float _502 = _480;
    float _504 = _482;
    float _506 = _484;
    float _508 = float(uint(_130));
    float _510 = float(as_type<uint>(_109));
    int _512 = ~_130;
    int _514 = _512 + 1;
    float _516 = 1.0 / _508;
    int _518 = as_type<int>(_516) + (-2);
    float _520 = _276 * _276;
    float _522 = as_type<float>(_518) * _510;
    float _524 = fma(_270, _270, _520);
    float _526 = trunc(_522);
    float _528 = precise::max(_526, 0.0);
    uint _530 = uint(_528);
    float _532 = fma(_282, _282, _524);
    float _534 = rsqrt(_532);
    int _536 = _514 * int(_530);
    int _538 = _536 + as_type<int>(_109);
    float _540 = float(uint(_538));
    float _542 = as_type<float>(_518) * _540;
    int _544 = ~_130;
    int _546 = _544 + 1;
    float _548 = trunc(_542);
    float _550 = precise::max(_548, 0.0);
    uint _552 = uint(_550);
    int _554 = int(_530) + int(_552);
    int _556 = _546 * _554;
    int _558 = _556 + as_type<int>(_109);
    float _560 = _276 * _534;
    bool _562 = uint(_558) >= uint(_130);
    bool _564 = !_562;
    int _566 = _564 ? 0 : (-1);
    bool _568 = _130 == 0;
    int _570 = ~_554;
    int _572 = _570 + _566;
    int _574 = _572 + 1;
    int _576 = _130 * _574;
    int _578 = _576 + as_type<int>(_109);
    float _580 = _282 * _534;
    float _582 = _270 * _534;
    float _584 = _312 * _560;
    float _586 = _300 * _580;
    float _588 = -_584;
    float _590 = fma(_306, _580, _588);
    float _592 = -_586;
    float _594 = fma(_312, _582, _592);
    float _596 = _306 * _582;
    float _598 = (*spvDescriptorSet0.vp_c12)._m0[4].y + (-1.0);
    float _600 = _594 * _594;
    float _602 = -_596;
    float _604 = fma(_300, _560, _602);
    bool _606 = !_568;
    int _608 = _606 ? _578 : (-1);
    float _610 = 1.0 / _598;
    float _612 = fma(_590, _590, _600);
    float _614 = float(_216);
    float _616 = float(_608);
    float _618 = fma(_604, _604, _612);
    float _620 = rsqrt(_618);
    float _622 = _616 * _444;
    float _624 = _622 * 6.283185482025146484375;
    float _626 = _226 * _610;
    float _628 = precise::clamp(_626, 0.0, 1.0);
    float _630 = _614 * _610;
    float _632 = _624 * 0.15915493667125701904296875;
    float _634 = -_628;
    float _636 = _634 + 1.0;
    float _638 = _632 * 6.283185482025146484375;
    float _640 = sin(_638);
    float _642 = _604 * _620;
    float _644 = _594 * _620;
    float _646 = _590 * _620;
    float _648 = _582 * _642;
    float _650 = _580 * _644;
    float _652 = abs(_636);
    float _654 = log2(_652);
    float _656 = -_648;
    float _658 = fma(_580, _646, _656);
    float _660 = -_650;
    float _662 = fma(_560, _642, _660);
    float _664 = _560 * _646;
    float _666 = -_630;
    float _668 = _666 + 1.0;
    float _670 = _658 * _658;
    float _672 = -_664;
    float _674 = fma(_582, _644, _672);
    float _676 = _632 * 6.283185482025146484375;
    float _678 = cos(_676);
    float _680 = fma(_662, _662, _670);
    float _682 = fma(_674, _674, _680);
    float _684 = 1.0 + (*spvDescriptorSet0.vp_c12)._m0[6].y;
    float _686 = abs(_668);
    float _688 = log2(_686);
    float _690 = _684 * _654;
    float _692 = rsqrt(_682);
    float _694 = _684 * _688;
    float _696 = exp2(_690);
    float _698 = _448 * _692;
    float _700 = exp2(_694);
    float _702 = _640 * _698;
    float _704 = _678 * _448;
    float _706 = -(*spvDescriptorSet0.vp_c12)._m0[1].z;
    float _708 = _706 + (*spvDescriptorSet0.vp_c12)._m0[1].w;
    float _710 = _658 * _702;
    float _712 = -_696;
    float _714 = _712 + 1.0;
    float _716 = _674 * _702;
    float _718 = fma(_644, _704, _710);
    float _720 = _662 * _702;
    float _722 = fma(_708, _714, (*spvDescriptorSet0.vp_c12)._m0[1].z);
    float _724 = -_700;
    float _726 = _724 + 1.0;
    float _728 = fma(_646, _704, _720);
    float _730 = fma(_642, _704, _716);
    float _732 = fma(_726, _708, (*spvDescriptorSet0.vp_c12)._m0[1].z);
    float _734 = fma(_732, _718, _250);
    float _736 = fma(_732, _728, _244);
    float _738 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _740 = _736 + _738;
    float _742 = _740 * _740;
    float _744 = fma(_718, _722, _504);
    float _746 = fma(_728, _722, _502);
    float _748 = fma(_730, _722, _506);
    float _750 = fma(_732, _730, _256);
    float _752 = -_734;
    float _754 = _752 + _744;
    float _756 = -_736;
    float _758 = _756 + _746;
    float _760 = -_750;
    float _762 = _760 + _748;
    float _764 = _754 * _754;
    float _766 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _768 = _750 + _766;
    float _770 = fma(_758, _758, _764);
    float _772 = _768 * _768;
    float _774 = fma(_762, _762, _770);
    float _776 = _742 + _772;
    float _778 = rsqrt(_774);
    float _780 = _762 * _778;
    float _782 = _754 * _778;
    float _784 = _758 * _778;
    float _786 = _728 * _780;
    float _788 = _730 * _782;
    float _790 = -_786;
    float _792 = fma(_730, _784, _790);
    float _794 = -_788;
    float _796 = fma(_718, _780, _794);
    float _798 = _718 * _784;
    float _800 = _792 * _792;
    float _802 = -_798;
    float _804 = fma(_728, _782, _802);
    float _806 = fma(_796, _796, _800);
    float _808 = sqrt(_776);
    float _810 = fma(_804, _804, _806);
    float _812 = rsqrt(_810);
    bool _814 = _808 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _816 = _804 * _812;
    float _818 = _792 * _812;
    float _820 = _796 * _812;
    float _822 = _784 * _816;
    float _824 = _780 * _818;
    float _826 = _782 * _820;
    float _828 = _812;
    float _830 = _820;
    float _832 = _782;
    float _834 = _736;
    float _836 = _804;
    float _838 = _622;
    float _840 = 1.0;
    if (!_814)
    {
        _828 = _736;
    }
    float _842 = _828;
    float _844 = -_822;
    float _846 = fma(_780, _820, _844);
    float _848 = -_824;
    float _850 = fma(_782, _816, _848);
    float _852 = _842;
    if (!_814)
    {
        _830 = _772;
    }
    float _854 = _830;
    float _856 = _854;
    if (!_814)
    {
        _832 = _742;
    }
    float _858 = _832;
    float _860 = _846 * _846;
    float _862 = _858;
    if (!_814)
    {
        _834 = _750;
    }
    float _864 = _834;
    float _866 = _864;
    if (!_814)
    {
        _836 = _734;
    }
    float _868 = _836;
    bool _870 = !_814;
    float _872 = _868;
    if (!_870)
    {
        float _874 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _876 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _878 = _808 + _876;
        float _880 = _734 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _882 = rsqrt(_776);
        float _884 = _878 * _874;
        float _886 = _884 * 0.15915493667125701904296875;
        float _888 = _886 * 6.283185482025146484375;
        float _890 = sin(_888);
        float _892 = _886 * 6.283185482025146484375;
        float _894 = cos(_892);
        float _896 = fma(_890, _880, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _898 = _882 * _896;
        float _900 = _894 + (-1.0);
        float _902 = fma(_740, _898, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _904 = fma(_768, _898, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _906 = _900 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _908 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _910 = _902 + _908;
        float _912 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _914 = _904 + _912;
        float _916 = fma(_734, _894, _906);
        float _918 = _910 * _910;
        float _920 = _914 * _914;
        _872 = _916;
        _862 = _918;
        _856 = _920;
        _852 = _902;
        _866 = _904;
    }
    float _922 = _872;
    float _924 = _862;
    float _926 = _856;
    float _928 = _852;
    float _930 = _866;
    float _932 = -_826;
    float _934 = fma(_784, _818, _932);
    float _936 = fma(_850, _850, _860);
    float _938 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _940 = _922 + _938;
    float _942 = fma(_934, _934, _936);
    float _944 = fma(_940, _940, _924);
    float _946 = rsqrt(_942);
    float _948 = _944 + _926;
    float _950 = (*spvDescriptorSet0.vp_c12)._m0[2].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _952 = (*spvDescriptorSet0.vp_c12)._m0[2].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _954 = sqrt(_948);
    float _956 = (*spvDescriptorSet0.vp_c12)._m0[2].w * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _958 = (*spvDescriptorSet0.vp_c12)._m0[2].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _960 = (*spvDescriptorSet0.vp_c12)._m0[3].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _962 = (*spvDescriptorSet0.vp_c12)._m0[3].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _964 = _850 * _946;
    float _966 = (*spvDescriptorSet0.vp_c12)._m0[3].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _968 = _846 * _946;
    float _970 = _934 * _946;
    out.m_72.x = _950;
    out.m_72.y = _952;
    out.m_72.z = _958;
    out.m_72.w = _956;
    out.m_74.x = _960;
    out.m_74.y = _962;
    out.m_74.z = _966;
    bool _972 = _954 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _974 = isnan(_954);
    bool _976 = _972 || _974;
    bool _978 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _980 = _976 || _978;
    out.m_76.x = _964;
    out.m_76.y = _968;
    out.m_76.z = _970;
    float _982 = _946;
    if (!_980)
    {
        _982 = 1.0;
    }
    float _984 = _982;
    bool _986 = !_980;
    float _988 = _984;
    if (!_986)
    {
        bool _990 = _954 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _992 = isnan(_954);
        bool _994 = _990 || _992;
        bool _996 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _998 = _994 || _996;
        if (!_998)
        {
            float _1000 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1002 = _954 + _1000;
            float _1004 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1006 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1004;
            float _1008 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1010 = _1008 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1012 = 1.0 / _1006;
            float _1014 = _1002 * _1012;
            float _1016 = fma(_1014, _1010, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _988 = _1016;
            _1018 = true;
        }
        else
        {
            bool _1020 = _954 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1022 = isnan(_954);
            bool _1024 = _1020 || _1022;
            bool _1026 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1028 = _1024 || _1026;
            if (!_1028)
            {
                float _1030 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1032 = _954 + _1030;
                float _1034 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1036 = _1034 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1038 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1040 = _1038 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1042 = 1.0 / _1036;
                float _1044 = _1032 * _1042;
                float _1046 = fma(_1044, _1040, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _988 = _1046;
                _1018 = true;
            }
            else
            {
                _988 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1018 = false;
    float _1048 = _988;
    float _1050 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1052 = _922 + _1050;
    float _1054 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1056 = _928 + _1054;
    float _1058 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1060 = _930 + _1058;
    float _1062 = _250 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1064 = fma(_1052, _1048, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1066 = fma(_1056, _1048, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1068 = fma(_1060, _1048, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1070 = fma(_244, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1062);
    float _1072 = _1064 + _384;
    float _1074 = _1066 + _386;
    float _1076 = _1068 + _388;
    float _1078 = _250 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1080 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1082 = _1072 + _1080;
    float _1084 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1086 = _1074 + _1084;
    float _1088 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1090 = _1076 + _1088;
    float _1092 = fma(_244, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1078);
    float _1094 = _1082 * _1082;
    float _1096 = fma(_256, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1070);
    float _1098 = fma(_256, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1092);
    float _1100 = fma(_1086, _1086, _1094);
    float _1102 = _250 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1104 = _250 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1106 = _1098 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1108 = fma(_1090, _1090, _1100);
    float _1110 = fma(_244, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1102);
    float _1112 = fma(_244, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1104);
    float _1114 = _1106 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1116 = rsqrt(_1108);
    float _1118 = fma(_256, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1110);
    float _1120 = _1096 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1122 = fma(_256, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1112);
    float _1124 = _1106 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1126 = _1118 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1128 = _1122 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1130 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1114);
    float _1132 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1124);
    float _1134 = sqrt(_1108);
    float _1136 = fma(_1120, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1130);
    float _1138 = fma(_1120, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1132);
    float _1140 = fma((*spvDescriptorSet0.vp_c12)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1142 = _1116 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1144 = fma(_1128, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1136);
    float _1146 = fma(_1128, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1138);
    float _1148 = _1086 * _1142;
    float _1150 = _1090 * _1142;
    float _1152 = 1.0 / _1144;
    float _1154 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1156 = _1148 * _1148;
    float _1158 = _1150 * _1150;
    float _1160 = _1146 + _1144;
    float _1162 = _1154 + (*spvDescriptorSet0.vp_c12)._m0[5].y;
    float _1164 = _1156 + _1158;
    float _1166 = _1162 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1168 = sqrt(_1164);
    float _1170 = fma((*spvDescriptorSet0.vp_c12)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1166);
    float _1172 = _1160 * _1152;
    float _1174 = _1172 * 0.5;
    float _1176 = fma((*spvDescriptorSet0.vp_c12)._m0[5].z, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1170);
    float _1178 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1180 = fma(_1174, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1178);
    float _1182 = _1162 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1184 = _1176 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1186 = fma((*spvDescriptorSet0.vp_c12)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1182);
    float _1188 = 1.0 / _1180;
    bool _1190 = _1168 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1192 = fma((*spvDescriptorSet0.vp_c12)._m0[5].z, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1186);
    float _1194 = _1192 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1196 = trunc(_1184);
    int _1198 = int(_1196);
    float _1200 = _1144;
    int _1202 = 2;
    float _1204 = _1048;
    float _1206 = _1142;
    float _1208 = _1164;
    float _1210 = _1150;
    float _1212 = _1156;
    if (_1190)
    {
        float _1214 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1200 = _1214;
    }
    float _1216 = _1200;
    float _1218 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1220 = _1188 * _1218;
    float _1222 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1224 = _1168 + _1222;
    bool _1226 = _1220 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1228 = trunc(_1194);
    int _1230 = int(_1228);
    bool _1232 = _1220 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1234 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    int _1236 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1238 = _1198 + _1236;
    int _1240 = _1238 + 1;
    float _1242 = _1224;
    if (_1190)
    {
        float _1244 = _1224 * _1216;
        _1242 = _1244;
    }
    float _1246 = _1242;
    float _1248 = floor(_1140);
    if (!_1226)
    {
        _1202 = 1;
    }
    int _1250 = _1202;
    int _1252 = _1250;
    if (_1190)
    {
        float _1254 = _1246 * 0.15915493667125701904296875;
        _1204 = _1254;
    }
    float _1256 = _1204;
    bool _1258 = !_1226;
    int _1260 = _1258 ? 0 : 1;
    bool _1262 = _1240 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1264 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1266 = _1230 + _1264;
    int _1268 = _1266 + 1;
    float _1270 = 0.0;
    if (_1190)
    {
        float _1272 = _1256 * 6.283185482025146484375;
        float _1274 = cos(_1272);
        _1270 = _1274;
    }
    float _1276 = _1270;
    if (!_1232)
    {
        _1252 = _1260;
    }
    int _1278 = _1252;
    int _1280 = _1240 | _1268;
    int _1282 = _1278 << 6;
    bool _1284 = _1280 < 0;
    bool _1286 = _1284 || _1262;
    float _1288 = 0.0;
    int _1290 = _1282;
    if (_1190)
    {
        float _1292 = rsqrt(_1164);
        _1288 = _1292;
    }
    float _1294 = _1288;
    float _1296 = precise::max(0.0, _1234);
    int _1298 = _1282 + 48;
    uint _1300 = uint(int(uint(_1298) >> uint(2)));
    uint _1302 = uint(int(uint(int(_1300)) >> uint(2)));
    int _1304 = int(_1300) & 3;
    float _1306 = (*spvDescriptorSet0.vp_c15)._m0[int(_1302)][_1304];
    int _1308 = int(_1300) + 1;
    uint _1310 = uint(int(uint(_1308) >> uint(2)));
    int _1312 = _1308 & 3;
    float _1314 = (*spvDescriptorSet0.vp_c15)._m0[int(_1310)][_1312];
    bool _1316 = _1268 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1318 = _1316 || _1286;
    float _1320 = -_1248;
    float _1322 = _1140 + _1320;
    float _1324 = -_1142;
    float _1326 = -_1296;
    float _1328 = fma(_1082, _1324, _1326);
    float _1330 = _1234;
    uint _1332 = as_type<uint>(_1248);
    if (_1190)
    {
        float _1334 = _1256 * 6.283185482025146484375;
        float _1336 = sin(_1334);
        _1330 = _1336;
    }
    float _1338 = _1330;
    float _1340 = 0.0;
    float _1342 = _1276;
    if (_1190)
    {
        float _1344 = _1276 + (-1.0);
        _1340 = _1344;
    }
    float _1346 = _1340;
    int _1348 = _1282 + 64;
    uint _1350 = uint(int(uint(_1348) >> uint(2)));
    uint _1352 = uint(int(uint(int(_1350)) >> uint(2)));
    int _1354 = int(_1350) & 3;
    float _1356 = (*spvDescriptorSet0.vp_c15)._m0[int(_1352)][_1354];
    int _1358 = int(_1350) + 1;
    uint _1360 = uint(int(uint(_1358) >> uint(2)));
    int _1362 = _1358 & 3;
    float _1364 = (*spvDescriptorSet0.vp_c15)._m0[int(_1360)][_1362];
    float _1366 = _1346;
    if (_1190)
    {
        float _1368 = _1328 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1206 = _1368;
    }
    float _1370 = _1206;
    float _1372 = fma((*spvDescriptorSet0.vp_c12)._m0[5].z, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1374 = 0.0;
    if (_1190)
    {
        float _1376 = _1346 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1374 = _1376;
    }
    float _1378 = _1374;
    if (!_1190)
    {
        _1366 = _1148;
    }
    float _1380 = _1366;
    float _1382 = _1380;
    if (!_1318)
    {
        int _1384 = _1268 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1386 = _1384 + _1240;
        _1332 = uint(_1386);
    }
    uint _1388 = _1332;
    float _1390 = floor(_1372);
    int _1392 = _1282 + 96;
    uint _1394 = uint(int(uint(_1392) >> uint(2)));
    uint _1396 = uint(int(uint(int(_1394)) >> uint(2)));
    int _1398 = int(_1394) & 3;
    float _1400 = (*spvDescriptorSet0.vp_c15)._m0[int(_1396)][_1398];
    int _1402 = int(_1394) + 1;
    uint _1404 = uint(int(uint(_1402) >> uint(2)));
    int _1406 = _1402 & 3;
    float _1408 = (*spvDescriptorSet0.vp_c15)._m0[int(_1404)][_1406];
    if (!_1190)
    {
        _1208 = _1328;
    }
    float _1410 = _1208;
    float _1412 = _1410;
    if (_1190)
    {
        float _1414 = fma(_1328, _1276, _1378);
        _1412 = _1414;
    }
    float _1416 = _1412;
    if (!_1190)
    {
        _1342 = _1158;
    }
    float _1418 = _1342;
    float _1420 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1422 = 0.0;
    float _1424 = _1418;
    if (_1190)
    {
        float _1426 = fma(_1338, _1370, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1422 = _1426;
    }
    float _1428 = _1422;
    int _1430 = _1282 + 72;
    uint _1432 = uint(int(uint(_1430) >> uint(2)));
    uint _1434 = uint(int(uint(int(_1432)) >> uint(2)));
    int _1436 = int(_1432) & 3;
    float _1438 = (*spvDescriptorSet0.vp_c15)._m0[int(_1434)][_1436];
    int _1440 = int(_1432) + 1;
    uint _1442 = uint(int(uint(_1440) >> uint(2)));
    int _1444 = _1440 & 3;
    float _1446 = (*spvDescriptorSet0.vp_c15)._m0[int(_1442)][_1444];
    float _1448 = _1428;
    if (_1190)
    {
        float _1450 = _1294 * _1428;
        _1448 = _1450;
    }
    float _1452 = _1448;
    float _1454 = _1072 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1456 = _1452;
    if (_1190)
    {
        float _1458 = _1148 * _1452;
        _1382 = _1458;
    }
    float _1460 = _1382;
    float _1462 = fma(_1074, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1454);
    int _1464 = _1282 + 104;
    uint _1466 = uint(int(uint(_1464) >> uint(2)));
    uint _1468 = uint(int(uint(int(_1466)) >> uint(2)));
    int _1470 = int(_1466) & 3;
    float _1472 = (*spvDescriptorSet0.vp_c15)._m0[int(_1468)][_1470];
    int _1474 = int(_1466) + 1;
    uint _1476 = uint(int(uint(_1474) >> uint(2)));
    int _1478 = _1474 & 3;
    float _1480 = (*spvDescriptorSet0.vp_c15)._m0[int(_1476)][_1478];
    float _1482 = _1454;
    if (!_1318)
    {
        float _1484 = floor(_1194);
        _1482 = _1484;
    }
    float _1486 = _1482;
    if (_1190)
    {
        float _1488 = _1150 * _1452;
        _1210 = _1488;
    }
    float _1490 = _1210;
    float _1492 = fma(_1076, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1462);
    if (_1190)
    {
        float _1494 = _1460 * _1460;
        _1212 = _1494;
    }
    float _1496 = _1212;
    if (_1190)
    {
        float _1498 = _1490 * _1490;
        _1424 = _1498;
    }
    float _1500 = _1424;
    float _1502 = _1492 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    int _1504 = _1282 + 80;
    uint _1506 = uint(int(uint(_1504) >> uint(2)));
    uint _1508 = uint(int(uint(int(_1506)) >> uint(2)));
    int _1510 = int(_1506) & 3;
    float _1512 = (*spvDescriptorSet0.vp_c15)._m0[int(_1508)][_1510];
    int _1514 = int(_1506) + 1;
    uint _1516 = uint(int(uint(_1514) >> uint(2)));
    int _1518 = _1514 & 3;
    float _1520 = (*spvDescriptorSet0.vp_c15)._m0[int(_1516)][_1518];
    float _1522 = fma(_1416, _1416, _1496);
    float _1524 = -_1390;
    float _1526 = _1372 + _1524;
    float _1528 = _1502 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    int _1530 = as_type<int>(_1390);
    float _1532 = _1528;
    float _1534 = _1526;
    if (!_1318)
    {
        uint _1536 = uint(int(uint(int(_1388)) >> uint(2)));
        _1530 = int(_1536);
    }
    int _1538 = _1530;
    float _1540 = _1522 + _1500;
    float _1542 = -_1528;
    float _1544 = fma(_1542, _1420, 1.0);
    int _1546 = _1282 + 56;
    uint _1548 = uint(int(uint(_1546) >> uint(2)));
    uint _1550 = uint(int(uint(int(_1548)) >> uint(2)));
    int _1552 = int(_1548) & 3;
    float _1554 = (*spvDescriptorSet0.vp_c15)._m0[int(_1550)][_1552];
    int _1556 = int(_1548) + 1;
    uint _1558 = uint(int(uint(_1556) >> uint(2)));
    int _1560 = _1556 & 3;
    float _1562 = (*spvDescriptorSet0.vp_c15)._m0[int(_1558)][_1560];
    if (!_1318)
    {
        float _1564 = -_1486;
        float _1566 = _1194 + _1564;
        _1532 = _1566;
    }
    float _1568 = _1532;
    float _1570 = _1162 * _1314;
    float _1572 = rsqrt(_1540);
    float _1574 = fma(_1306, (*spvDescriptorSet0.vp_c12)._m0[5].x, _1570);
    int _1576 = _1282 + 88;
    uint _1578 = uint(int(uint(_1576) >> uint(2)));
    uint _1580 = uint(int(uint(int(_1578)) >> uint(2)));
    int _1582 = int(_1578) & 3;
    float _1584 = (*spvDescriptorSet0.vp_c15)._m0[int(_1580)][_1582];
    int _1586 = int(_1578) + 1;
    uint _1588 = uint(int(uint(_1586) >> uint(2)));
    int _1590 = _1586 & 3;
    float _1592 = (*spvDescriptorSet0.vp_c15)._m0[int(_1588)][_1590];
    float _1594 = _1162 * _1364;
    float _1596 = log2(_1544);
    float _1598 = fma(_1356, (*spvDescriptorSet0.vp_c12)._m0[5].x, _1594);
    int _1600 = as_type<int>(_1314);
    float _1602 = _1568;
    if (!_1318)
    {
        int _1604 = int(_1388) << 2;
        _1290 = _1604;
    }
    int _1606 = _1290;
    float _1608 = _1162 * _1408;
    float _1610 = _1572 * _1460;
    int _1612 = _1606;
    if (!_1318)
    {
        int _1614 = 12 & _1606;
        _1612 = _1614;
    }
    int _1616 = _1612;
    float _1618 = fma(_1400, (*spvDescriptorSet0.vp_c12)._m0[5].x, _1608);
    float _1620 = _1572 * _1490;
    float _1622 = _1610 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    if (!_1318)
    {
        int _1624 = _1538 << 4;
        int _1626 = _1624 + _1616;
        _1600 = _1626;
    }
    int _1628 = _1600;
    float _1630 = _1162 * _1520;
    float _1632 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1634 = fma(_1134, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1632);
    float _1636 = precise::clamp(_1634, 0.0, 1.0);
    float2 _5031 = float2(_1322, _1526);
    float _1638 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5031, float2(0.0), isnan(_5031)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5031, float2(0.0), isnan(_5031)), level(0.0)).x;
    float _1640 = _1596 * 0.693147182464599609375;
    float _1642 = fma(_1512, (*spvDescriptorSet0.vp_c12)._m0[5].x, _1630);
    float _1644 = -_1636;
    float _1646 = _1644 + 1.0;
    float _1648 = fma(_1438, (*spvDescriptorSet0.vp_c12)._m0[5].z, _1598);
    float _1650 = fma(_1472, (*spvDescriptorSet0.vp_c12)._m0[5].z, _1618);
    float _1652 = fma(_1554, (*spvDescriptorSet0.vp_c12)._m0[5].z, _1574);
    float _1654 = _1572 * _1416;
    float _1656 = _1648 + _1446;
    float _1658 = _1650 + _1480;
    float _1660 = _1652 + _1562;
    float _1662 = _1072 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1664 = abs(_1646);
    float _1666 = log2(_1664);
    float _1668 = _1072 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1670 = fma(_1584, (*spvDescriptorSet0.vp_c12)._m0[5].z, _1642);
    float _1672 = -_1622;
    float _1674 = fma(_1654, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1672);
    float _1676 = fma(_1074, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1662);
    float _1678 = fma(_1074, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1668);
    float _1680 = -_1620;
    float _1682 = fma(_1680, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1674);
    float _1684 = 1.0 / _1658;
    float _1686 = _1072 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1688 = fma(_1076, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1676);
    float _1690 = fma(_1076, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1678);
    float _1692 = fma(_1074, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1686);
    float _1694 = _1688 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1696 = _1670 + _1592;
    float _1698 = _1666 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1700 = fma(_1076, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1692);
    float _1702 = _1690 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1704 = _1694 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1706 = exp2(_1698);
    float _1708 = _1700 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1710 = _1694 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1712 = _1640 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1714 = _1660 * _1684;
    float _1716 = fma(_1682, -0.5, 0.5);
    float _1718 = fma(_1708, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1710);
    float _1720 = _1656 * _1684;
    float _1722 = fma(_1682, 0.5, 0.5);
    bool _1724 = _1714 >= 0.0;
    float _1726 = fma(_1502, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1718);
    float _1728 = sqrt(_1716);
    float _1730 = fma(_1722, -0.0187292993068695068359375, 0.07426099479198455810546875);
    bool _1732 = _1714 <= 1.0;
    bool _1734 = _1732 && _1724;
    float _1736 = fma(_1702, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1726);
    float _1738 = _1694 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1740 = fma(_1722, _1730, -0.212114393711090087890625);
    bool _1742 = _1720 >= 0.0;
    bool _1744 = _1742 && _1734;
    float _1746 = fma(_1708, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1704);
    float _1748 = _1730;
    float _1750 = _1654;
    float _1752 = _1736;
    if (!_1318)
    {
        float _1754 = floor(_1184);
        _1748 = _1754;
    }
    float _1756 = _1748;
    float _1758 = _1654 + 1.0;
    bool _1760 = _1720 <= 1.0;
    bool _1762 = _1760 && _1744;
    float _1764 = fma(_1708, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1738);
    float _1766 = fma(_1502, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1746);
    float _1768 = -_1654;
    float _1770 = fma(_1706, _1758, _1768);
    float _1772 = fma(_1722, _1740, 1.570728778839111328125);
    float _1774 = fma(_1502, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1764);
    float _1776 = 1.0 / _1736;
    float _1778 = _1728 * 0.636619746685028076171875;
    float _1780 = fma(_1702, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1766);
    float _1782 = _1696 * _1684;
    float _1784 = fma(_1770, 0.5, 0.5);
    float _1786 = -_1772;
    float _1788 = fma(_1778, _1786, 1.0);
    float _1790 = as_type<float>(_1538);
    float _1792 = _1706;
    if (!_1318)
    {
        int _1794 = _1628 + 400;
        uint _1796 = uint(int(uint(_1794) >> uint(2)));
        uint _1798 = uint(int(uint(int(_1796)) >> uint(2)));
        int _1800 = int(_1796) & 3;
        float _1802 = (*spvDescriptorSet0.vp_c15)._m0[int(_1798)][_1800];
        _1790 = _1802;
    }
    float _1804 = _1790;
    if (_1762)
    {
        float _1806 = float(_1278);
        _1750 = _1806;
    }
    float _1808 = _1750;
    if (!_1318)
    {
        float _1810 = -_1756;
        float _1812 = _1184 + _1810;
        _1792 = _1812;
    }
    float _1814 = _1792;
    float _1816 = fma(_1702, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1774);
    float _1818 = _1808;
    float _1820 = _1816;
    if (_1762)
    {
        float _1822 = rint(_1808);
        float _1824 = precise::max(_1822, 0.0);
        uint _1826 = uint(_1824);
        uint _1828 = clamp(_1826, 0u, 65535u);
        _1818 = as_type<float>(_1828);
    }
    float _1830 = _1818;
    float _1832 = _1780 * _1776;
    float _1834 = _1816 * _1776;
    float _1836 = fma(_1832, 0.5, 0.5);
    float _1838 = fma(_1834, -0.5, 0.5);
    float _1840 = _1830;
    if (_1762)
    {
        float3 _5384 = float3(_1714, _1720, float(as_type<int>(_1830)));
        float3 _5388 = select(_5384, float3(0.0), isnan(_5384));
        float _1842 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5388.xy, uint(rint(_5388.z)), _1782, level(0.0));
        _1840 = _1842;
    }
    float _1844 = _1840;
    float3 _5398 = float3(_1836, _1838, _1712);
    float _1846 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5398, float3(0.0), isnan(_5398)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5398, float3(0.0), isnan(_5398)), level(0.0)).x;
    float3 _5407 = float3(_1836, _1838, _1712);
    float4 _1849 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5407, float3(0.0), isnan(_5407)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5407, float3(0.0), isnan(_5407)), level(0.0)).xyzw;
    float _1851 = _1849.x;
    float _1853 = _1849.y;
    float _1855 = _1849.z;
    float _1857 = _1849.w;
    float2 _5423 = float2(_1788, _1784);
    float3 _1861 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5423, float2(0.0), isnan(_5423)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5423, float2(0.0), isnan(_5423)), level(0.0)).xyz;
    float _1863 = _1861.x;
    float _1865 = _1861.y;
    float _1867 = _1861.z;
    float _1869 = _1684;
    if (!_1318)
    {
        float _1871 = rint(_1804);
        float _1873 = precise::max(_1871, 0.0);
        uint _1875 = uint(_1873);
        uint _1877 = clamp(_1875, 0u, 65535u);
        _1869 = as_type<float>(_1877);
    }
    float _1879 = _1869;
    float _1881 = _1879;
    if (!_1318)
    {
        float3 _5460 = float3(_1814, _1568, float(as_type<int>(_1879)));
        float3 _5462 = select(_5460, float3(0.0), isnan(_5460));
        float _1883 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5462.xy, uint(rint(_5462.z)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5462.xy, uint(rint(_5462.z)), level(0.0)).x;
        _1881 = _1883;
    }
    float _1885 = _1881;
    float _1887 = abs(_1220);
    float _1889 = log2(_1887);
    int _1891 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1893 = _1891 != 0;
    float _1895 = _1694 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1897 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1899 = _1897 != 0;
    float _1901 = _1666 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1903 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 524288;
    bool _1905 = _1903 != 0;
    float _1907 = fma(_1708, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1895);
    float _1909 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    if (_1893)
    {
        _1534 = (*spvDescriptorSet0.vp_c12)._m0[0].y;
    }
    float _1911 = _1534;
    if (!_1893)
    {
        float _1913 = -_332;
        float _1915 = (-0.0) + _1913;
        _294 = _1915;
    }
    float _1917 = _294;
    float _1919 = _1889 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1921 = _1917;
    if (_1899)
    {
        _1456 = (*spvDescriptorSet0.vp_c12)._m0[0].x;
    }
    float _1923 = _1456;
    float _1925 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1927 = false;
    if (_1893)
    {
        bool _1929 = _1911 > 0.5;
        _1927 = _1929;
    }
    bool _1931 = _1927;
    bool _1933 = false;
    if (_1899)
    {
        bool _1935 = _1923 > 0.5;
        _1933 = _1935;
    }
    bool _1937 = _1933;
    if (_1893)
    {
        float _1939 = -_332;
        float _1941 = _1931 ? _332 : _1939;
        _1921 = _1941;
    }
    float _1943 = _1921;
    float _1945 = fma(_1502, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1907);
    float _1947 = exp2(_1919);
    float _1949 = _1943 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1951 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    if (_1899)
    {
        float _1953 = -_622;
        float _1955 = _1937 ? _1953 : _622;
        _838 = _1955;
    }
    float _1957 = _838;
    float _1959 = fma(_1702, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1945);
    bool _1961 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1963 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1965 = _1961 || _1963;
    bool _1967 = isnan(0.5);
    bool _1969 = _1965 || _1967;
    float _1971 = -(*spvDescriptorSet0.vp_c12)._m0[1].x;
    float _1973 = _1971 + (*spvDescriptorSet0.vp_c12)._m0[1].y;
    float _1975 = _1708;
    float _1977 = _1973;
    if (_1905)
    {
        float _1979 = 1.0 / _1736;
        _1975 = _1979;
    }
    float _1981 = _1975;
    float _1983 = -_1949;
    float _1985 = fma(_1983, _1909, -0.0);
    float _1987 = _1957 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1989 = fma(_630, _1973, (*spvDescriptorSet0.vp_c12)._m0[1].x);
    float _1991 = _1987 * _1925;
    float _1993 = fma(_1947, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1995 = precise::clamp(_1993, 0.0, 1.0);
    float _1997 = _1987;
    if (!_1905)
    {
        _1602 = _1959;
    }
    float _1999 = _1602;
    float _2001 = exp2(_1901);
    float _2003 = _1999;
    if (!_1969)
    {
        _1977 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _2005 = _1977;
    float _2007 = fma(_1995, -2.0, 3.0);
    float _2009 = _1995 * _1995;
    out.m_78.x = _1991;
    out.m_78.y = _1985;
    float _2011 = _2005;
    if (_1905)
    {
        float _2013 = -_1959;
        float _2015 = fma(_2013, _1981, 1.0);
        _1997 = _2015;
    }
    float _2017 = _1997;
    float _2019 = _2009 * _2007;
    if (!_1969)
    {
        float _2021 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2023 = _2005 + _2021;
        _2011 = _2023;
    }
    float _2025 = _2011;
    out.gl_Position.x = _1780;
    out.gl_Position.y = _1816;
    out.gl_Position.z = _1959;
    out.gl_Position.w = _1736;
    float _2027 = _2025;
    if (_1905)
    {
        float _2029 = -_2017;
        float _2031 = fma(_2029, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1959);
        _2003 = _2031;
    }
    float _2033 = _2003;
    float _2035 = _1911;
    if (!_1969)
    {
        float _2037 = 1.0 / _2025;
        _2035 = _2037;
    }
    float _2039 = _2035;
    if (_1969)
    {
        _1951 = 1.0;
    }
    float _2041 = _1951;
    float _2043 = _1736 + _2033;
    float _2045 = -_2019;
    float _2047 = _2045 + 1.0;
    float _2049 = _2041;
    if (_1905)
    {
        out.gl_Position.z = _2033;
    }
    float _2051 = -_2001;
    float _2053 = _2051 + 1.0;
    float _2055 = _2043 * 0.5;
    float _2057 = fma(_2047, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2019);
    if (!_1969)
    {
        float _2059 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2061 = _1220 + _2059;
        _2027 = _2061;
    }
    float _2063 = _2027;
    bool _2065 = _1220 <= 8000.0;
    bool _2067 = isnan(_1220);
    bool _2069 = _2065 || _2067;
    bool _2071 = isnan(8000.0);
    bool _2073 = _2069 || _2071;
    float _2075 = float(_2073);
    out.m_80.z = _2055;
    out.m_80.w = _1736;
    float _2077 = _2053 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (_1318)
    {
        _1820 = 1.0;
    }
    float _2079 = _1820;
    float _2081 = _2075 * _2057;
    float _2083 = _2079;
    if (!_1969)
    {
        float _2085 = _2063 * _2039;
        float _2087 = precise::clamp(_2085, 0.0, 1.0);
        _2049 = _2087;
    }
    float _2089 = _2049;
    float _2091 = _2081 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2093 = _1989 * _2089;
    float _2095 = -_1638;
    float _2097 = _2095 + 1.0;
    float _2099 = _2097 * _2091;
    float _2101 = precise::clamp(_2099, 0.0, 1.0);
    float _2103 = _2091;
    if (!_1762)
    {
        _2103 = 1.0;
    }
    float _2105 = _2103;
    float _2107 = -_2101;
    float _2109 = fma(_2107, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2111 = _2105;
    float _2113 = _2109;
    if (_1762)
    {
        bool _2115 = _1844 >= _1782;
        bool _2117 = isnan(_1844);
        bool _2119 = _2115 || _2117;
        bool _2121 = isnan(_1782);
        bool _2123 = _2119 || _2121;
        float _2125 = float(_2123);
        _2111 = _2125;
    }
    float _2127 = _2111;
    if (!_1318)
    {
        int _2129 = int(_1388) << 4;
        int _2131 = _2129 + 2048;
        uint _2133 = uint(int(uint(_2131) >> uint(2)));
        uint _2135 = uint(int(uint(int(_2133)) >> uint(2)));
        int _2137 = int(_2133) & 3;
        float _2139 = (*spvDescriptorSet0.vp_c15)._m0[int(_2135)][_2137];
        int _2141 = int(_2133) + 1;
        uint _2143 = uint(int(uint(_2141) >> uint(2)));
        int _2145 = _2141 & 3;
        float _2147 = (*spvDescriptorSet0.vp_c15)._m0[int(_2143)][_2145];
        int _2149 = _2131 + 8;
        uint _2151 = uint(int(uint(_2149) >> uint(2)));
        uint _2153 = uint(int(uint(int(_2151)) >> uint(2)));
        int _2155 = int(_2151) & 3;
        float _2157 = (*spvDescriptorSet0.vp_c15)._m0[int(_2153)][_2155];
        int _2159 = int(_2151) + 1;
        uint _2161 = uint(int(uint(_2159) >> uint(2)));
        int _2163 = _2159 & 3;
        float _2165 = (*spvDescriptorSet0.vp_c15)._m0[int(_2161)][_2163];
        float _2167 = _1162 * _2147;
        float _2169 = fma(_2139, (*spvDescriptorSet0.vp_c12)._m0[5].x, _2167);
        float _2171 = fma(_2157, (*spvDescriptorSet0.vp_c12)._m0[5].z, _2169);
        float _2173 = _2171 + _2165;
        float _2175 = precise::clamp(_2173, 0.0, 1.0);
        float _2177 = -_2175;
        float _2179 = _2177 + _1885;
        float _2181 = fma(_2179, 500.0, 1.5);
        float _2183 = exp2(_2181);
        float _2185 = 0.0 + _2183;
        float _2187 = precise::clamp(_2185, 0.0, 1.0);
        _2083 = _2187;
        _1752 = _2183;
    }
    float _2189 = _2083;
    float _2191 = _1752;
    float _2193 = _2077 * _1846;
    float _2195 = _2127 * _2189;
    float _2197 = -_2077;
    float _2199 = _2197 + 1.0;
    bool _2201 = _1134 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2203 = isnan(_1134);
    bool _2205 = _2201 || _2203;
    bool _2207 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2209 = _2205 || _2207;
    float _2211 = _1857 * _2193;
    float _2213 = -_2195;
    float _2215 = fma(_2213, _2109, 1.0);
    float _2217 = precise::clamp(_2215, 0.0, 1.0);
    float _2219 = _1867 * _2193;
    float _2221 = fma(_1863, _2211, _1851);
    float _2223 = fma(_1865, _2211, _1853);
    float _2225 = _1857 * _2199;
    float _2227 = _2217 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2229 = fma(_1857, _2219, _1855);
    float _2231 = _2093 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_82.x = _2227;
    float _2233 = _2193;
    float _2235 = _2191;
    float _2237 = _2211;
    float _2239 = _2217;
    if (!_2209)
    {
        _2113 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2241 = _2113;
    float _2243 = _2241;
    float _2245 = _2241;
    if (!_2209)
    {
        _840 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2247 = _840;
    out.m_84.x = _2221;
    out.m_84.y = _2223;
    out.m_84.z = _2229;
    out.m_84.w = _2225;
    float _2249 = _2247;
    float _2251 = _2247;
    if (!_2209)
    {
        _2233 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2253 = _2233;
    float _2255 = _2253;
    float _2257 = _2253;
    if (!_2209)
    {
        _2235 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2259 = _2235;
    float _2261 = _2259;
    float _2263 = _2259;
    if (!_2209)
    {
        _2237 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2265 = _2237;
    float _2267 = _2265;
    float _2269 = _2265;
    if (!_2209)
    {
        _2239 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2271 = _2239;
    bool _2273 = !_2209;
    float _2275 = _2271;
    float _2277 = _2271;
    if (!_2273)
    {
        bool _2279 = _1134 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2281 = isnan(_1134);
        bool _2283 = _2279 || _2281;
        bool _2285 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2287 = _2283 || _2285;
        if (!_2287)
        {
            float _2289 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2291 = _1134 + _2289;
            float _2293 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2295 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2293;
            float _2297 = 1.0 / _2295;
            float _2299 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2301 = _2299 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2303 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2305 = _2303 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2307 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2309 = _2307 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2311 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2313 = _2311 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2315 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2317 = _2315 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2319 = _2291 * _2297;
            float _2321 = precise::clamp(_2319, 0.0, 1.0);
            float _2323 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2325 = _2323 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2327 = fma(_2321, _2301, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2329 = fma(_2321, _2325, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2331 = fma(_2321, _2305, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2333 = fma(_2321, _2309, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2335 = fma(_2321, _2313, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2337 = fma(_2321, _2317, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2251 = _2331;
            _2269 = _2335;
            _2245 = _2329;
            _2263 = _2333;
            _2257 = _2327;
            _2277 = _2337;
            _2339 = true;
        }
        else
        {
            bool _2341 = _1134 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2343 = isnan(_1134);
            bool _2345 = _2341 || _2343;
            bool _2347 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2349 = _2345 || _2347;
            if (!_2349)
            {
                _2243 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2351 = _2243;
            _2245 = _2351;
            if (!_2349)
            {
                _2249 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2353 = _2249;
            _2251 = _2353;
            if (!_2349)
            {
                _2255 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2355 = _2255;
            _2257 = _2355;
            if (!_2349)
            {
                _2261 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2357 = _2261;
            _2263 = _2357;
            if (!_2349)
            {
                _2267 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2359 = _2267;
            _2269 = _2359;
            if (!_2349)
            {
                _2275 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2361 = _2275;
            bool _2363 = !_2349;
            _2277 = _2361;
            if (!_2363)
            {
                bool _2365 = _1134 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2367 = isnan(_1134);
                bool _2369 = _2365 || _2367;
                bool _2371 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2373 = _2369 || _2371;
                if (!_2373)
                {
                    float _2375 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2377 = _1134 + _2375;
                    float _2379 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2381 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2379;
                    float _2383 = 1.0 / _2381;
                    float _2385 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2387 = _2385 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2389 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2391 = _2389 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2393 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2395 = _2393 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2397 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2399 = _2397 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2401 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2403 = _2401 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2405 = _2377 * _2383;
                    float _2407 = precise::clamp(_2405, 0.0, 1.0);
                    float _2409 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2411 = _2409 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2413 = fma(_2407, _2387, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2415 = fma(_2407, _2411, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2417 = fma(_2407, _2391, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2419 = fma(_2407, _2395, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2421 = fma(_2407, _2399, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2423 = fma(_2407, _2403, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2251 = _2417;
                    _2269 = _2421;
                    _2245 = _2415;
                    _2263 = _2419;
                    _2257 = _2413;
                    _2277 = _2423;
                    _2339 = true;
                }
                else
                {
                    _2251 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2269 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2245 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2263 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2257 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2277 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2339 = false;
    float _2425 = _2251;
    float _2427 = _2269;
    float _2429 = _2245;
    float _2431 = _2263;
    float _2433 = _2257;
    float _2435 = _2277;
    float _2437 = fma(_968, -0.5, 0.5);
    float _2439 = precise::clamp(_2437, 0.0, 1.0);
    float _2441 = -_2425;
    float _2443 = _2441 + _2427;
    float _2445 = -_2429;
    float _2447 = _2445 + _2431;
    float _2449 = -_2433;
    float _2451 = _2449 + _2435;
    bool _2453 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2455 = fma(_2439, _2443, _2425);
    float _2457 = fma(_2439, _2447, _2429);
    float _2459 = fma(_2439, _2451, _2433);
    float _2461 = _2231 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2463 = _2455 * 0.586610972881317138671875;
    out.m_86.x = 0.0;
    float _2465 = fma(_2457, 0.298911988735198974609375, _2463);
    out.m_88.x = _2461;
    float _2467 = fma(_2459, 0.114477999508380889892578125, _2465);
    float _2469 = -_2467;
    float _2471 = _2457 + _2469;
    float _2473 = -_2467;
    float _2475 = _2455 + _2473;
    float _2477 = -_2467;
    float _2479 = _2459 + _2477;
    float _2481 = fma(_2471, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2467);
    float _2483 = fma(_2475, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2467);
    float _2485 = fma(_2479, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2467);
    out.m_90.x = _2481;
    out.m_90.y = _2483;
    out.m_90.z = _2485;
    if (!_2453)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2487 = -_1072;
    float _2489 = _2487 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2491 = -_1074;
    float _2493 = _2491 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2495 = -_1076;
    float _2497 = _2495 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2499 = _2489 * _2489;
    float _2501 = fma(_2493, _2493, _2499);
    float _2503 = fma(_2497, _2497, _2501);
    float _2505 = sqrt(_2503);
    float _2507 = rsqrt(_2503);
    float _2509 = -_2505;
    float _2511 = _2509 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2513 = _2511 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2515 = precise::clamp(_2513, 0.0, 1.0);
    float _2517 = _2493 * _2507;
    float _2519 = _2489 * _2507;
    float _2521 = abs(_2515);
    float _2523 = log2(_2521);
    float _2525 = _2497 * _2507;
    float _2527 = _2517 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2529 = _968 * _2519;
    float _2531 = -_2519;
    float _2533 = -_2527;
    float _2535 = fma(_2531, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2533);
    float _2537 = fma(_964, _2517, _2529);
    float _2539 = -_2525;
    float _2541 = fma(_2539, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2535);
    float _2543 = fma(_970, _2525, _2537);
    float _2545 = precise::clamp(_2543, 0.0, 1.0);
    float _2547 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2549 = _2541 + _2547;
    float _2551 = _2523 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2553 = _2549 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2555 = precise::clamp(_2553, 0.0, 1.0);
    float _2557 = exp2(_2551);
    float _2559 = _2557 * _2555;
    float _2561 = _2545 * _2559;
    float _2563 = _2561 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2565 = _2561 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2567 = _2561 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_86.x = _2563;
    out.m_86.y = _2565;
    out.m_86.z = _2567;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2339 = false;
    bool _1018 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _104 = trunc((*spvDescriptorSet0.vp_c12)._m0[6].x);
    int _107 = int(_104);
    float _109 = as_type<float>(int(gl_VertexIndex));
    int _111 = max(0, _107);
    int _113 = min(_111, 5);
    int _115 = _113 << 2;
    int _117 = abs(as_type<int>(_109));
    uint _120 = uint(int(uint(_115) >> uint(2)));
    uint _122 = uint(int(uint(int(_120)) >> uint(2)));
    int _124 = int(_120) & 3;
    float _126 = (*spvDescriptorSet0.vp_c1)._m0[int(_122)][_124];
    float _128 = float(uint(_117));
    int _130 = as_type<int>(_126) + 1;
    int _132 = abs(_130);
    float _134 = float(uint(_132));
    float _136 = 1.0 / _134;
    int _138 = as_type<int>(_136) + (-2);
    float _140 = as_type<float>(_138) * _128;
    float _142 = trunc(_140);
    float _144 = precise::max(_142, 0.0);
    uint _146 = uint(_144);
    int _148 = ~int(_146);
    int _150 = _148 + 1;
    int _152 = _150 * _132;
    int _154 = _152 + _117;
    float _156 = float(uint(_154));
    float _158 = as_type<float>(_138) * _156;
    float _160 = trunc(_158);
    float _162 = precise::max(_160, 0.0);
    uint _164 = uint(_162);
    int _166 = int(_146) + int(_164);
    int _168 = ~_166;
    int _170 = _168 + 1;
    int _172 = as_type<int>(_109) ^ _130;
    int _174 = _170 * _132;
    int _176 = _174 + _117;
    uint _178 = uint(int(uint(_172) >> uint(31)));
    bool _182 = uint(_176) >= uint(_132);
    float _184 = (*spvDescriptorSet0.vp_c12)._m0[4].z * (*spvDescriptorSet0.vp_c12)._m0[5].w;
    int _186 = ~int(_178);
    int _188 = _186 + 1;
    bool _190 = !_182;
    int _192 = _190 ? 0 : (-1);
    bool _194 = _130 == 0;
    float _196 = trunc(_184);
    int _198 = int(_196);
    int _200 = ~_192;
    int _202 = _166 + _200;
    int _204 = _202 + 1;
    int _206 = _204 ^ _188;
    int _208 = ~_188;
    int _210 = _208 + _206;
    int _212 = _210 + 1;
    bool _214 = !_194;
    int _216 = _214 ? _212 : (-1);
    int _218 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1048576;
    bool _220 = _218 != 0;
    int _222 = _216 + 1;
    int _224 = _216 + _198;
    float _226 = float(_222);
    int _228 = _224 * 96;
    bool _230 = _226 != (*spvDescriptorSet0.vp_c12)._m0[5].w;
    bool _232 = isnan(_226);
    bool _234 = _230 || _232;
    bool _236 = isnan((*spvDescriptorSet0.vp_c12)._m0[5].w);
    bool _238 = _234 || _236;
    int _240 = _228 + 16;
    uint _242 = uint(int(uint(_228) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_242)];
    float _244 = as_type<float>(_dmw0.x);
    int _246 = _228 + 4;
    uint _248 = uint(int(uint(_246) >> uint(2)));
    float _250 = as_type<float>(_dmw0.y);
    int _252 = _228 + 8;
    uint _254 = uint(int(uint(_252) >> uint(2)));
    float _256 = as_type<float>(_dmw0.z);
    int _258 = _228 + 12;
    uint _260 = uint(int(uint(_258) >> uint(2)));
    float _262 = as_type<float>(_dmw0.w);
    int _264 = _228 + 80;
    int _266 = _228 + 48;
    uint _268 = uint(int(uint(_240) >> uint(2)));
    packed_uint4 _dmw1 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_268)];
    float _270 = as_type<float>(_dmw1.x);
    int _272 = _240 + 4;
    uint _274 = uint(int(uint(_272) >> uint(2)));
    float _276 = as_type<float>(_dmw1.y);
    int _278 = _240 + 8;
    uint _280 = uint(int(uint(_278) >> uint(2)));
    float _282 = as_type<float>(_dmw1.z);
    int _284 = _240 + 12;
    uint _286 = uint(int(uint(_284) >> uint(2)));
    float _288 = as_type<float>(_dmw1.w);
    float _290 = as_type<float>(_198);
    float _292 = as_type<float>(_212);
    float _294 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    if (!_220)
    {
        _290 = 0.0;
    }
    float _296 = _290;
    uint _298 = uint(int(uint(_264) >> uint(2)));
    packed_uint4 _dmw2 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_298)];
    float _300 = as_type<float>(_dmw2.x);
    int _302 = _264 + 4;
    uint _304 = uint(int(uint(_302) >> uint(2)));
    float _306 = as_type<float>(_dmw2.y);
    int _308 = _264 + 8;
    uint _310 = uint(int(uint(_308) >> uint(2)));
    float _312 = as_type<float>(_dmw2.z);
    int _314 = _264 + 12;
    uint _316 = uint(int(uint(_314) >> uint(2)));
    float _318 = as_type<float>(_dmw2.w);
    float _320 = 0.0;
    float _322 = _296;
    if (!_220)
    {
        _320 = 0.0;
    }
    float _324 = _320;
    float _326 = _324;
    if (!_220)
    {
        _292 = 0.0;
    }
    float _328 = _292;
    uint _330 = uint(int(uint(_266) >> uint(2)));
    float _332 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_330)]);
    uint _334 = 0u;
    float _336 = _328;
    if (!_238)
    {
        int _338 = _228 + (-96);
        _334 = uint(_338);
    }
    uint _340 = _334;
    bool _342 = !_220;
    float _344 = 0.0;
    float _346 = 0.0;
    float _348 = _288;
    float _350 = _318;
    if (!_342)
    {
        float _352 = -(*spvDescriptorSet0.vp_c10)._m0[5].w;
        float _354 = (*spvDescriptorSet0.vp_c8)._m0[29].y + _352;
        float _356 = -(*spvDescriptorSet0.vp_c10)._m0[4].w;
        float _358 = (*spvDescriptorSet0.vp_c8)._m0[29].x + _356;
        float _360 = _354 * _354;
        float _362 = -(*spvDescriptorSet0.vp_c10)._m0[6].w;
        float _364 = (*spvDescriptorSet0.vp_c8)._m0[29].z + _362;
        float _366 = fma(_358, _358, _360);
        float _368 = fma(_364, _364, _366);
        float _370 = rsqrt(_368);
        float _372 = _370 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
        float _374 = _358 * _372;
        float _376 = _354 * _372;
        float _378 = _364 * _372;
        _344 = _370;
        _346 = _372;
        _326 = _376;
        _322 = _374;
        _336 = _378;
    }
    float _380 = _344;
    float _382 = _346;
    float _384 = _326;
    float _386 = _322;
    float _388 = _336;
    float _390 = _380;
    float _392 = 0.0;
    float _394 = _382;
    int _396 = 0;
    if (!_238)
    {
        uint _398 = uint(int(uint(int(_340)) >> uint(2)));
        float _400 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_398)]);
        int _402 = int(_340) + 4;
        uint _404 = uint(int(uint(_402) >> uint(2)));
        float _406 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_404)]);
        int _408 = int(_340) + 8;
        uint _410 = uint(int(uint(_408) >> uint(2)));
        float _412 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_410)]);
        int _414 = int(_340) + 12;
        uint _416 = uint(int(uint(_414) >> uint(2)));
        float _418 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_416)]);
        _390 = _400;
        _392 = _406;
        _394 = _412;
        _396 = as_type<int>(_418);
    }
    float _420 = _390;
    float _422 = _392;
    float _424 = _394;
    int _426 = _396;
    if (!_238)
    {
        float _428 = _244 + _244;
        _348 = _428;
    }
    float _430 = _348;
    float _432 = 0.0;
    if (!_238)
    {
        float _434 = _250 + _250;
        _432 = _434;
    }
    float _436 = _432;
    if (!_238)
    {
        float _438 = _256 + _256;
        _350 = _438;
    }
    float _440 = _350;
    float _442 = float(as_type<int>(_126));
    float _444 = 1.0 / _442;
    float _446 = abs(_262);
    float _448 = _446 * 0.5;
    float _450 = _420;
    float _452 = _422;
    float _454 = _424;
    int _456 = _426;
    if (!_238)
    {
        float _458 = -_420;
        float _460 = _430 + _458;
        _450 = _460;
    }
    float _462 = _450;
    if (!_238)
    {
        float _464 = -_422;
        float _466 = _436 + _464;
        _452 = _466;
    }
    float _468 = _452;
    if (!_238)
    {
        float _470 = -_424;
        float _472 = _440 + _470;
        _454 = _472;
    }
    float _474 = _454;
    if (_238)
    {
        int _476 = _228 + 96;
        _456 = _476;
    }
    int _478 = _456;
    float _480 = _462;
    float _482 = _468;
    float _484 = _474;
    if (_238)
    {
        uint _486 = uint(int(uint(_478) >> uint(2)));
        packed_uint3 _dmw3 = *(const device packed_uint3*)&(*spvDescriptorSet0.vp_s0)._m0[int(_486)];
        float _488 = as_type<float>(_dmw3.x);
        int _490 = _478 + 4;
        uint _492 = uint(int(uint(_490) >> uint(2)));
        float _494 = as_type<float>(_dmw3.y);
        int _496 = _478 + 8;
        uint _498 = uint(int(uint(_496) >> uint(2)));
        float _500 = as_type<float>(_dmw3.z);
        _480 = _488;
        _482 = _494;
        _484 = _500;
    }
    float _502 = _480;
    float _504 = _482;
    float _506 = _484;
    float _508 = float(uint(_130));
    float _510 = float(as_type<uint>(_109));
    int _512 = ~_130;
    int _514 = _512 + 1;
    float _516 = 1.0 / _508;
    int _518 = as_type<int>(_516) + (-2);
    float _520 = _276 * _276;
    float _522 = as_type<float>(_518) * _510;
    float _524 = fma(_270, _270, _520);
    float _526 = trunc(_522);
    float _528 = precise::max(_526, 0.0);
    uint _530 = uint(_528);
    float _532 = fma(_282, _282, _524);
    float _534 = rsqrt(_532);
    int _536 = _514 * int(_530);
    int _538 = _536 + as_type<int>(_109);
    float _540 = float(uint(_538));
    float _542 = as_type<float>(_518) * _540;
    int _544 = ~_130;
    int _546 = _544 + 1;
    float _548 = trunc(_542);
    float _550 = precise::max(_548, 0.0);
    uint _552 = uint(_550);
    int _554 = int(_530) + int(_552);
    int _556 = _546 * _554;
    int _558 = _556 + as_type<int>(_109);
    float _560 = _276 * _534;
    bool _562 = uint(_558) >= uint(_130);
    bool _564 = !_562;
    int _566 = _564 ? 0 : (-1);
    bool _568 = _130 == 0;
    int _570 = ~_554;
    int _572 = _570 + _566;
    int _574 = _572 + 1;
    int _576 = _130 * _574;
    int _578 = _576 + as_type<int>(_109);
    float _580 = _282 * _534;
    float _582 = _270 * _534;
    float _584 = _312 * _560;
    float _586 = _300 * _580;
    float _588 = -_584;
    float _590 = fma(_306, _580, _588);
    float _592 = -_586;
    float _594 = fma(_312, _582, _592);
    float _596 = _306 * _582;
    float _598 = (*spvDescriptorSet0.vp_c12)._m0[4].y + (-1.0);
    float _600 = _594 * _594;
    float _602 = -_596;
    float _604 = fma(_300, _560, _602);
    bool _606 = !_568;
    int _608 = _606 ? _578 : (-1);
    float _610 = 1.0 / _598;
    float _612 = fma(_590, _590, _600);
    float _614 = float(_216);
    float _616 = float(_608);
    float _618 = fma(_604, _604, _612);
    float _620 = rsqrt(_618);
    float _622 = _616 * _444;
    float _624 = _622 * 6.283185482025146484375;
    float _626 = _226 * _610;
    float _628 = precise::clamp(_626, 0.0, 1.0);
    float _630 = _614 * _610;
    float _632 = _624 * 0.15915493667125701904296875;
    float _634 = -_628;
    float _636 = _634 + 1.0;
    float _638 = _632 * 6.283185482025146484375;
    float _640 = sin(_638);
    float _642 = _604 * _620;
    float _644 = _594 * _620;
    float _646 = _590 * _620;
    float _648 = _582 * _642;
    float _650 = _580 * _644;
    float _652 = abs(_636);
    float _654 = log2(_652);
    float _656 = -_648;
    float _658 = fma(_580, _646, _656);
    float _660 = -_650;
    float _662 = fma(_560, _642, _660);
    float _664 = _560 * _646;
    float _666 = -_630;
    float _668 = _666 + 1.0;
    float _670 = _658 * _658;
    float _672 = -_664;
    float _674 = fma(_582, _644, _672);
    float _676 = _632 * 6.283185482025146484375;
    float _678 = cos(_676);
    float _680 = fma(_662, _662, _670);
    float _682 = fma(_674, _674, _680);
    float _684 = 1.0 + (*spvDescriptorSet0.vp_c12)._m0[6].y;
    float _686 = abs(_668);
    float _688 = log2(_686);
    float _690 = _684 * _654;
    float _692 = rsqrt(_682);
    float _694 = _684 * _688;
    float _696 = exp2(_690);
    float _698 = _448 * _692;
    float _700 = exp2(_694);
    float _702 = _640 * _698;
    float _704 = _678 * _448;
    float _706 = -(*spvDescriptorSet0.vp_c12)._m0[1].z;
    float _708 = _706 + (*spvDescriptorSet0.vp_c12)._m0[1].w;
    float _710 = _658 * _702;
    float _712 = -_696;
    float _714 = _712 + 1.0;
    float _716 = _674 * _702;
    float _718 = fma(_644, _704, _710);
    float _720 = _662 * _702;
    float _722 = fma(_708, _714, (*spvDescriptorSet0.vp_c12)._m0[1].z);
    float _724 = -_700;
    float _726 = _724 + 1.0;
    float _728 = fma(_646, _704, _720);
    float _730 = fma(_642, _704, _716);
    float _732 = fma(_726, _708, (*spvDescriptorSet0.vp_c12)._m0[1].z);
    float _734 = fma(_732, _718, _250);
    float _736 = fma(_732, _728, _244);
    float _738 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _740 = _736 + _738;
    float _742 = _740 * _740;
    float _744 = fma(_718, _722, _504);
    float _746 = fma(_728, _722, _502);
    float _748 = fma(_730, _722, _506);
    float _750 = fma(_732, _730, _256);
    float _752 = -_734;
    float _754 = _752 + _744;
    float _756 = -_736;
    float _758 = _756 + _746;
    float _760 = -_750;
    float _762 = _760 + _748;
    float _764 = _754 * _754;
    float _766 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _768 = _750 + _766;
    float _770 = fma(_758, _758, _764);
    float _772 = _768 * _768;
    float _774 = fma(_762, _762, _770);
    float _776 = _742 + _772;
    float _778 = rsqrt(_774);
    float _780 = _762 * _778;
    float _782 = _754 * _778;
    float _784 = _758 * _778;
    float _786 = _728 * _780;
    float _788 = _730 * _782;
    float _790 = -_786;
    float _792 = fma(_730, _784, _790);
    float _794 = -_788;
    float _796 = fma(_718, _780, _794);
    float _798 = _718 * _784;
    float _800 = _792 * _792;
    float _802 = -_798;
    float _804 = fma(_728, _782, _802);
    float _806 = fma(_796, _796, _800);
    float _808 = sqrt(_776);
    float _810 = fma(_804, _804, _806);
    float _812 = rsqrt(_810);
    bool _814 = _808 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _816 = _804 * _812;
    float _818 = _792 * _812;
    float _820 = _796 * _812;
    float _822 = _784 * _816;
    float _824 = _780 * _818;
    float _826 = _782 * _820;
    float _828 = _812;
    float _830 = _820;
    float _832 = _782;
    float _834 = _736;
    float _836 = _804;
    float _838 = _622;
    float _840 = 1.0;
    if (!_814)
    {
        _828 = _736;
    }
    float _842 = _828;
    float _844 = -_822;
    float _846 = fma(_780, _820, _844);
    float _848 = -_824;
    float _850 = fma(_782, _816, _848);
    float _852 = _842;
    if (!_814)
    {
        _830 = _772;
    }
    float _854 = _830;
    float _856 = _854;
    if (!_814)
    {
        _832 = _742;
    }
    float _858 = _832;
    float _860 = _846 * _846;
    float _862 = _858;
    if (!_814)
    {
        _834 = _750;
    }
    float _864 = _834;
    float _866 = _864;
    if (!_814)
    {
        _836 = _734;
    }
    float _868 = _836;
    bool _870 = !_814;
    float _872 = _868;
    if (!_870)
    {
        float _874 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _876 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _878 = _808 + _876;
        float _880 = _734 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _882 = rsqrt(_776);
        float _884 = _878 * _874;
        float _886 = _884 * 0.15915493667125701904296875;
        float _888 = _886 * 6.283185482025146484375;
        float _890 = sin(_888);
        float _892 = _886 * 6.283185482025146484375;
        float _894 = cos(_892);
        float _896 = fma(_890, _880, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _898 = _882 * _896;
        float _900 = _894 + (-1.0);
        float _902 = fma(_740, _898, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _904 = fma(_768, _898, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _906 = _900 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _908 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _910 = _902 + _908;
        float _912 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _914 = _904 + _912;
        float _916 = fma(_734, _894, _906);
        float _918 = _910 * _910;
        float _920 = _914 * _914;
        _872 = _916;
        _862 = _918;
        _856 = _920;
        _852 = _902;
        _866 = _904;
    }
    float _922 = _872;
    float _924 = _862;
    float _926 = _856;
    float _928 = _852;
    float _930 = _866;
    float _932 = -_826;
    float _934 = fma(_784, _818, _932);
    float _936 = fma(_850, _850, _860);
    float _938 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _940 = _922 + _938;
    float _942 = fma(_934, _934, _936);
    float _944 = fma(_940, _940, _924);
    float _946 = rsqrt(_942);
    float _948 = _944 + _926;
    float _950 = (*spvDescriptorSet0.vp_c12)._m0[2].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _952 = (*spvDescriptorSet0.vp_c12)._m0[2].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _954 = sqrt(_948);
    float _956 = (*spvDescriptorSet0.vp_c12)._m0[2].w * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _958 = (*spvDescriptorSet0.vp_c12)._m0[2].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _960 = (*spvDescriptorSet0.vp_c12)._m0[3].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _962 = (*spvDescriptorSet0.vp_c12)._m0[3].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _964 = _850 * _946;
    float _966 = (*spvDescriptorSet0.vp_c12)._m0[3].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _968 = _846 * _946;
    float _970 = _934 * _946;
    out.m_72.x = _950;
    out.m_72.y = _952;
    out.m_72.z = _958;
    out.m_72.w = _956;
    out.m_74.x = _960;
    out.m_74.y = _962;
    out.m_74.z = _966;
    bool _972 = _954 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _974 = isnan(_954);
    bool _976 = _972 || _974;
    bool _978 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _980 = _976 || _978;
    out.m_76.x = _964;
    out.m_76.y = _968;
    out.m_76.z = _970;
    float _982 = _946;
    if (!_980)
    {
        _982 = 1.0;
    }
    float _984 = _982;
    bool _986 = !_980;
    float _988 = _984;
    if (!_986)
    {
        bool _990 = _954 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _992 = isnan(_954);
        bool _994 = _990 || _992;
        bool _996 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _998 = _994 || _996;
        if (!_998)
        {
            float _1000 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1002 = _954 + _1000;
            float _1004 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1006 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1004;
            float _1008 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1010 = _1008 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1012 = 1.0 / _1006;
            float _1014 = _1002 * _1012;
            float _1016 = fma(_1014, _1010, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _988 = _1016;
            _1018 = true;
        }
        else
        {
            bool _1020 = _954 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1022 = isnan(_954);
            bool _1024 = _1020 || _1022;
            bool _1026 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1028 = _1024 || _1026;
            if (!_1028)
            {
                float _1030 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1032 = _954 + _1030;
                float _1034 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1036 = _1034 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1038 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1040 = _1038 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1042 = 1.0 / _1036;
                float _1044 = _1032 * _1042;
                float _1046 = fma(_1044, _1040, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _988 = _1046;
                _1018 = true;
            }
            else
            {
                _988 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1018 = false;
    float _1048 = _988;
    float _1050 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1052 = _922 + _1050;
    float _1054 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1056 = _928 + _1054;
    float _1058 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1060 = _930 + _1058;
    float _1062 = _250 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1064 = fma(_1052, _1048, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1066 = fma(_1056, _1048, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1068 = fma(_1060, _1048, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1070 = fma(_244, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1062);
    float _1072 = _1064 + _384;
    float _1074 = _1066 + _386;
    float _1076 = _1068 + _388;
    float _1078 = _250 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1080 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1082 = _1072 + _1080;
    float _1084 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1086 = _1074 + _1084;
    float _1088 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1090 = _1076 + _1088;
    float _1092 = fma(_244, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1078);
    float _1094 = _1082 * _1082;
    float _1096 = fma(_256, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1070);
    float _1098 = fma(_256, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1092);
    float _1100 = fma(_1086, _1086, _1094);
    float _1102 = _250 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1104 = _250 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1106 = _1098 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1108 = fma(_1090, _1090, _1100);
    float _1110 = fma(_244, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1102);
    float _1112 = fma(_244, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1104);
    float _1114 = _1106 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1116 = rsqrt(_1108);
    float _1118 = fma(_256, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1110);
    float _1120 = _1096 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1122 = fma(_256, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1112);
    float _1124 = _1106 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1126 = _1118 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1128 = _1122 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1130 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1114);
    float _1132 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1124);
    float _1134 = sqrt(_1108);
    float _1136 = fma(_1120, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1130);
    float _1138 = fma(_1120, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1132);
    float _1140 = fma((*spvDescriptorSet0.vp_c12)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1142 = _1116 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1144 = fma(_1128, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1136);
    float _1146 = fma(_1128, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1138);
    float _1148 = _1086 * _1142;
    float _1150 = _1090 * _1142;
    float _1152 = 1.0 / _1144;
    float _1154 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1156 = _1148 * _1148;
    float _1158 = _1150 * _1150;
    float _1160 = _1146 + _1144;
    float _1162 = _1154 + (*spvDescriptorSet0.vp_c12)._m0[5].y;
    float _1164 = _1156 + _1158;
    float _1166 = _1162 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1168 = sqrt(_1164);
    float _1170 = fma((*spvDescriptorSet0.vp_c12)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1166);
    float _1172 = _1160 * _1152;
    float _1174 = _1172 * 0.5;
    float _1176 = fma((*spvDescriptorSet0.vp_c12)._m0[5].z, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1170);
    float _1178 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1180 = fma(_1174, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1178);
    float _1182 = _1162 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1184 = _1176 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1186 = fma((*spvDescriptorSet0.vp_c12)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1182);
    float _1188 = 1.0 / _1180;
    bool _1190 = _1168 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1192 = fma((*spvDescriptorSet0.vp_c12)._m0[5].z, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1186);
    float _1194 = _1192 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1196 = trunc(_1184);
    int _1198 = int(_1196);
    float _1200 = _1144;
    int _1202 = 2;
    float _1204 = _1048;
    float _1206 = _1142;
    float _1208 = _1164;
    float _1210 = _1150;
    float _1212 = _1156;
    if (_1190)
    {
        float _1214 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1200 = _1214;
    }
    float _1216 = _1200;
    float _1218 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1220 = _1188 * _1218;
    float _1222 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1224 = _1168 + _1222;
    bool _1226 = _1220 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1228 = trunc(_1194);
    int _1230 = int(_1228);
    bool _1232 = _1220 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1234 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    int _1236 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1238 = _1198 + _1236;
    int _1240 = _1238 + 1;
    float _1242 = _1224;
    if (_1190)
    {
        float _1244 = _1224 * _1216;
        _1242 = _1244;
    }
    float _1246 = _1242;
    float _1248 = floor(_1140);
    if (!_1226)
    {
        _1202 = 1;
    }
    int _1250 = _1202;
    int _1252 = _1250;
    if (_1190)
    {
        float _1254 = _1246 * 0.15915493667125701904296875;
        _1204 = _1254;
    }
    float _1256 = _1204;
    bool _1258 = !_1226;
    int _1260 = _1258 ? 0 : 1;
    bool _1262 = _1240 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1264 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1266 = _1230 + _1264;
    int _1268 = _1266 + 1;
    float _1270 = 0.0;
    if (_1190)
    {
        float _1272 = _1256 * 6.283185482025146484375;
        float _1274 = cos(_1272);
        _1270 = _1274;
    }
    float _1276 = _1270;
    if (!_1232)
    {
        _1252 = _1260;
    }
    int _1278 = _1252;
    int _1280 = _1240 | _1268;
    int _1282 = _1278 << 6;
    bool _1284 = _1280 < 0;
    bool _1286 = _1284 || _1262;
    float _1288 = 0.0;
    int _1290 = _1282;
    if (_1190)
    {
        float _1292 = rsqrt(_1164);
        _1288 = _1292;
    }
    float _1294 = _1288;
    float _1296 = precise::max(0.0, _1234);
    int _1298 = _1282 + 48;
    uint _1300 = uint(int(uint(_1298) >> uint(2)));
    uint _1302 = uint(int(uint(int(_1300)) >> uint(2)));
    int _1304 = int(_1300) & 3;
    float _1306 = (*spvDescriptorSet0.vp_c15)._m0[int(_1302)][_1304];
    int _1308 = int(_1300) + 1;
    uint _1310 = uint(int(uint(_1308) >> uint(2)));
    int _1312 = _1308 & 3;
    float _1314 = (*spvDescriptorSet0.vp_c15)._m0[int(_1310)][_1312];
    bool _1316 = _1268 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1318 = _1316 || _1286;
    float _1320 = -_1248;
    float _1322 = _1140 + _1320;
    float _1324 = -_1142;
    float _1326 = -_1296;
    float _1328 = fma(_1082, _1324, _1326);
    float _1330 = _1234;
    uint _1332 = as_type<uint>(_1248);
    if (_1190)
    {
        float _1334 = _1256 * 6.283185482025146484375;
        float _1336 = sin(_1334);
        _1330 = _1336;
    }
    float _1338 = _1330;
    float _1340 = 0.0;
    float _1342 = _1276;
    if (_1190)
    {
        float _1344 = _1276 + (-1.0);
        _1340 = _1344;
    }
    float _1346 = _1340;
    int _1348 = _1282 + 64;
    uint _1350 = uint(int(uint(_1348) >> uint(2)));
    uint _1352 = uint(int(uint(int(_1350)) >> uint(2)));
    int _1354 = int(_1350) & 3;
    float _1356 = (*spvDescriptorSet0.vp_c15)._m0[int(_1352)][_1354];
    int _1358 = int(_1350) + 1;
    uint _1360 = uint(int(uint(_1358) >> uint(2)));
    int _1362 = _1358 & 3;
    float _1364 = (*spvDescriptorSet0.vp_c15)._m0[int(_1360)][_1362];
    float _1366 = _1346;
    if (_1190)
    {
        float _1368 = _1328 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1206 = _1368;
    }
    float _1370 = _1206;
    float _1372 = fma((*spvDescriptorSet0.vp_c12)._m0[5].z, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1374 = 0.0;
    if (_1190)
    {
        float _1376 = _1346 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1374 = _1376;
    }
    float _1378 = _1374;
    if (!_1190)
    {
        _1366 = _1148;
    }
    float _1380 = _1366;
    float _1382 = _1380;
    if (!_1318)
    {
        int _1384 = _1268 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1386 = _1384 + _1240;
        _1332 = uint(_1386);
    }
    uint _1388 = _1332;
    float _1390 = floor(_1372);
    int _1392 = _1282 + 96;
    uint _1394 = uint(int(uint(_1392) >> uint(2)));
    uint _1396 = uint(int(uint(int(_1394)) >> uint(2)));
    int _1398 = int(_1394) & 3;
    float _1400 = (*spvDescriptorSet0.vp_c15)._m0[int(_1396)][_1398];
    int _1402 = int(_1394) + 1;
    uint _1404 = uint(int(uint(_1402) >> uint(2)));
    int _1406 = _1402 & 3;
    float _1408 = (*spvDescriptorSet0.vp_c15)._m0[int(_1404)][_1406];
    if (!_1190)
    {
        _1208 = _1328;
    }
    float _1410 = _1208;
    float _1412 = _1410;
    if (_1190)
    {
        float _1414 = fma(_1328, _1276, _1378);
        _1412 = _1414;
    }
    float _1416 = _1412;
    if (!_1190)
    {
        _1342 = _1158;
    }
    float _1418 = _1342;
    float _1420 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1422 = 0.0;
    float _1424 = _1418;
    if (_1190)
    {
        float _1426 = fma(_1338, _1370, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1422 = _1426;
    }
    float _1428 = _1422;
    int _1430 = _1282 + 72;
    uint _1432 = uint(int(uint(_1430) >> uint(2)));
    uint _1434 = uint(int(uint(int(_1432)) >> uint(2)));
    int _1436 = int(_1432) & 3;
    float _1438 = (*spvDescriptorSet0.vp_c15)._m0[int(_1434)][_1436];
    int _1440 = int(_1432) + 1;
    uint _1442 = uint(int(uint(_1440) >> uint(2)));
    int _1444 = _1440 & 3;
    float _1446 = (*spvDescriptorSet0.vp_c15)._m0[int(_1442)][_1444];
    float _1448 = _1428;
    if (_1190)
    {
        float _1450 = _1294 * _1428;
        _1448 = _1450;
    }
    float _1452 = _1448;
    float _1454 = _1072 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1456 = _1452;
    if (_1190)
    {
        float _1458 = _1148 * _1452;
        _1382 = _1458;
    }
    float _1460 = _1382;
    float _1462 = fma(_1074, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1454);
    int _1464 = _1282 + 104;
    uint _1466 = uint(int(uint(_1464) >> uint(2)));
    uint _1468 = uint(int(uint(int(_1466)) >> uint(2)));
    int _1470 = int(_1466) & 3;
    float _1472 = (*spvDescriptorSet0.vp_c15)._m0[int(_1468)][_1470];
    int _1474 = int(_1466) + 1;
    uint _1476 = uint(int(uint(_1474) >> uint(2)));
    int _1478 = _1474 & 3;
    float _1480 = (*spvDescriptorSet0.vp_c15)._m0[int(_1476)][_1478];
    float _1482 = _1454;
    if (!_1318)
    {
        float _1484 = floor(_1194);
        _1482 = _1484;
    }
    float _1486 = _1482;
    if (_1190)
    {
        float _1488 = _1150 * _1452;
        _1210 = _1488;
    }
    float _1490 = _1210;
    float _1492 = fma(_1076, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1462);
    if (_1190)
    {
        float _1494 = _1460 * _1460;
        _1212 = _1494;
    }
    float _1496 = _1212;
    if (_1190)
    {
        float _1498 = _1490 * _1490;
        _1424 = _1498;
    }
    float _1500 = _1424;
    float _1502 = _1492 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    int _1504 = _1282 + 80;
    uint _1506 = uint(int(uint(_1504) >> uint(2)));
    uint _1508 = uint(int(uint(int(_1506)) >> uint(2)));
    int _1510 = int(_1506) & 3;
    float _1512 = (*spvDescriptorSet0.vp_c15)._m0[int(_1508)][_1510];
    int _1514 = int(_1506) + 1;
    uint _1516 = uint(int(uint(_1514) >> uint(2)));
    int _1518 = _1514 & 3;
    float _1520 = (*spvDescriptorSet0.vp_c15)._m0[int(_1516)][_1518];
    float _1522 = fma(_1416, _1416, _1496);
    float _1524 = -_1390;
    float _1526 = _1372 + _1524;
    float _1528 = _1502 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    int _1530 = as_type<int>(_1390);
    float _1532 = _1528;
    float _1534 = _1526;
    if (!_1318)
    {
        uint _1536 = uint(int(uint(int(_1388)) >> uint(2)));
        _1530 = int(_1536);
    }
    int _1538 = _1530;
    float _1540 = _1522 + _1500;
    float _1542 = -_1528;
    float _1544 = fma(_1542, _1420, 1.0);
    int _1546 = _1282 + 56;
    uint _1548 = uint(int(uint(_1546) >> uint(2)));
    uint _1550 = uint(int(uint(int(_1548)) >> uint(2)));
    int _1552 = int(_1548) & 3;
    float _1554 = (*spvDescriptorSet0.vp_c15)._m0[int(_1550)][_1552];
    int _1556 = int(_1548) + 1;
    uint _1558 = uint(int(uint(_1556) >> uint(2)));
    int _1560 = _1556 & 3;
    float _1562 = (*spvDescriptorSet0.vp_c15)._m0[int(_1558)][_1560];
    if (!_1318)
    {
        float _1564 = -_1486;
        float _1566 = _1194 + _1564;
        _1532 = _1566;
    }
    float _1568 = _1532;
    float _1570 = _1162 * _1314;
    float _1572 = rsqrt(_1540);
    float _1574 = fma(_1306, (*spvDescriptorSet0.vp_c12)._m0[5].x, _1570);
    int _1576 = _1282 + 88;
    uint _1578 = uint(int(uint(_1576) >> uint(2)));
    uint _1580 = uint(int(uint(int(_1578)) >> uint(2)));
    int _1582 = int(_1578) & 3;
    float _1584 = (*spvDescriptorSet0.vp_c15)._m0[int(_1580)][_1582];
    int _1586 = int(_1578) + 1;
    uint _1588 = uint(int(uint(_1586) >> uint(2)));
    int _1590 = _1586 & 3;
    float _1592 = (*spvDescriptorSet0.vp_c15)._m0[int(_1588)][_1590];
    float _1594 = _1162 * _1364;
    float _1596 = log2(_1544);
    float _1598 = fma(_1356, (*spvDescriptorSet0.vp_c12)._m0[5].x, _1594);
    int _1600 = as_type<int>(_1314);
    float _1602 = _1568;
    if (!_1318)
    {
        int _1604 = int(_1388) << 2;
        _1290 = _1604;
    }
    int _1606 = _1290;
    float _1608 = _1162 * _1408;
    float _1610 = _1572 * _1460;
    int _1612 = _1606;
    if (!_1318)
    {
        int _1614 = 12 & _1606;
        _1612 = _1614;
    }
    int _1616 = _1612;
    float _1618 = fma(_1400, (*spvDescriptorSet0.vp_c12)._m0[5].x, _1608);
    float _1620 = _1572 * _1490;
    float _1622 = _1610 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    if (!_1318)
    {
        int _1624 = _1538 << 4;
        int _1626 = _1624 + _1616;
        _1600 = _1626;
    }
    int _1628 = _1600;
    float _1630 = _1162 * _1520;
    float _1632 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1634 = fma(_1134, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1632);
    float _1636 = precise::clamp(_1634, 0.0, 1.0);
    float2 _5031 = float2(_1322, _1526);
    float _1638 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5031, float2(0.0), isnan(_5031)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5031, float2(0.0), isnan(_5031)), level(0.0)).x;
    float _1640 = _1596 * 0.693147182464599609375;
    float _1642 = fma(_1512, (*spvDescriptorSet0.vp_c12)._m0[5].x, _1630);
    float _1644 = -_1636;
    float _1646 = _1644 + 1.0;
    float _1648 = fma(_1438, (*spvDescriptorSet0.vp_c12)._m0[5].z, _1598);
    float _1650 = fma(_1472, (*spvDescriptorSet0.vp_c12)._m0[5].z, _1618);
    float _1652 = fma(_1554, (*spvDescriptorSet0.vp_c12)._m0[5].z, _1574);
    float _1654 = _1572 * _1416;
    float _1656 = _1648 + _1446;
    float _1658 = _1650 + _1480;
    float _1660 = _1652 + _1562;
    float _1662 = _1072 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1664 = abs(_1646);
    float _1666 = log2(_1664);
    float _1668 = _1072 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1670 = fma(_1584, (*spvDescriptorSet0.vp_c12)._m0[5].z, _1642);
    float _1672 = -_1622;
    float _1674 = fma(_1654, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1672);
    float _1676 = fma(_1074, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1662);
    float _1678 = fma(_1074, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1668);
    float _1680 = -_1620;
    float _1682 = fma(_1680, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1674);
    float _1684 = 1.0 / _1658;
    float _1686 = _1072 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1688 = fma(_1076, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1676);
    float _1690 = fma(_1076, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1678);
    float _1692 = fma(_1074, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1686);
    float _1694 = _1688 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1696 = _1670 + _1592;
    float _1698 = _1666 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1700 = fma(_1076, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1692);
    float _1702 = _1690 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1704 = _1694 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1706 = exp2(_1698);
    float _1708 = _1700 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1710 = _1694 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1712 = _1640 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1714 = _1660 * _1684;
    float _1716 = fma(_1682, -0.5, 0.5);
    float _1718 = fma(_1708, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1710);
    float _1720 = _1656 * _1684;
    float _1722 = fma(_1682, 0.5, 0.5);
    bool _1724 = _1714 >= 0.0;
    float _1726 = fma(_1502, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1718);
    float _1728 = sqrt(_1716);
    float _1730 = fma(_1722, -0.0187292993068695068359375, 0.07426099479198455810546875);
    bool _1732 = _1714 <= 1.0;
    bool _1734 = _1732 && _1724;
    float _1736 = fma(_1702, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1726);
    float _1738 = _1694 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1740 = fma(_1722, _1730, -0.212114393711090087890625);
    bool _1742 = _1720 >= 0.0;
    bool _1744 = _1742 && _1734;
    float _1746 = fma(_1708, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1704);
    float _1748 = _1730;
    float _1750 = _1654;
    float _1752 = _1736;
    if (!_1318)
    {
        float _1754 = floor(_1184);
        _1748 = _1754;
    }
    float _1756 = _1748;
    float _1758 = _1654 + 1.0;
    bool _1760 = _1720 <= 1.0;
    bool _1762 = _1760 && _1744;
    float _1764 = fma(_1708, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1738);
    float _1766 = fma(_1502, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1746);
    float _1768 = -_1654;
    float _1770 = fma(_1706, _1758, _1768);
    float _1772 = fma(_1722, _1740, 1.570728778839111328125);
    float _1774 = fma(_1502, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1764);
    float _1776 = 1.0 / _1736;
    float _1778 = _1728 * 0.636619746685028076171875;
    float _1780 = fma(_1702, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1766);
    float _1782 = _1696 * _1684;
    float _1784 = fma(_1770, 0.5, 0.5);
    float _1786 = -_1772;
    float _1788 = fma(_1778, _1786, 1.0);
    float _1790 = as_type<float>(_1538);
    float _1792 = _1706;
    if (!_1318)
    {
        int _1794 = _1628 + 400;
        uint _1796 = uint(int(uint(_1794) >> uint(2)));
        uint _1798 = uint(int(uint(int(_1796)) >> uint(2)));
        int _1800 = int(_1796) & 3;
        float _1802 = (*spvDescriptorSet0.vp_c15)._m0[int(_1798)][_1800];
        _1790 = _1802;
    }
    float _1804 = _1790;
    if (_1762)
    {
        float _1806 = float(_1278);
        _1750 = _1806;
    }
    float _1808 = _1750;
    if (!_1318)
    {
        float _1810 = -_1756;
        float _1812 = _1184 + _1810;
        _1792 = _1812;
    }
    float _1814 = _1792;
    float _1816 = fma(_1702, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1774);
    float _1818 = _1808;
    float _1820 = _1816;
    if (_1762)
    {
        float _1822 = rint(_1808);
        float _1824 = precise::max(_1822, 0.0);
        uint _1826 = uint(_1824);
        uint _1828 = clamp(_1826, 0u, 65535u);
        _1818 = as_type<float>(_1828);
    }
    float _1830 = _1818;
    float _1832 = _1780 * _1776;
    float _1834 = _1816 * _1776;
    float _1836 = fma(_1832, 0.5, 0.5);
    float _1838 = fma(_1834, -0.5, 0.5);
    float _1840 = _1830;
    if (_1762)
    {
        float3 _5384 = float3(_1714, _1720, float(as_type<int>(_1830)));
        float3 _5388 = select(_5384, float3(0.0), isnan(_5384));
        float _1842 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5388.xy, uint(rint(_5388.z)), _1782, level(0.0));
        _1840 = _1842;
    }
    float _1844 = _1840;
    float3 _5398 = float3(_1836, _1838, _1712);
    float _1846 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5398, float3(0.0), isnan(_5398)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5398, float3(0.0), isnan(_5398)), level(0.0)).x;
    float3 _5407 = float3(_1836, _1838, _1712);
    float4 _1849 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5407, float3(0.0), isnan(_5407)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5407, float3(0.0), isnan(_5407)), level(0.0)).xyzw;
    float _1851 = _1849.x;
    float _1853 = _1849.y;
    float _1855 = _1849.z;
    float _1857 = _1849.w;
    float2 _5423 = float2(_1788, _1784);
    float3 _1861 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5423, float2(0.0), isnan(_5423)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5423, float2(0.0), isnan(_5423)), level(0.0)).xyz;
    float _1863 = _1861.x;
    float _1865 = _1861.y;
    float _1867 = _1861.z;
    float _1869 = _1684;
    if (!_1318)
    {
        float _1871 = rint(_1804);
        float _1873 = precise::max(_1871, 0.0);
        uint _1875 = uint(_1873);
        uint _1877 = clamp(_1875, 0u, 65535u);
        _1869 = as_type<float>(_1877);
    }
    float _1879 = _1869;
    float _1881 = _1879;
    if (!_1318)
    {
        float3 _5460 = float3(_1814, _1568, float(as_type<int>(_1879)));
        float3 _5462 = select(_5460, float3(0.0), isnan(_5460));
        float _1883 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5462.xy, uint(rint(_5462.z)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5462.xy, uint(rint(_5462.z)), level(0.0)).x;
        _1881 = _1883;
    }
    float _1885 = _1881;
    float _1887 = abs(_1220);
    float _1889 = log2(_1887);
    int _1891 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1893 = _1891 != 0;
    float _1895 = _1694 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1897 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1899 = _1897 != 0;
    float _1901 = _1666 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1903 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 524288;
    bool _1905 = _1903 != 0;
    float _1907 = fma(_1708, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1895);
    float _1909 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    if (_1893)
    {
        _1534 = (*spvDescriptorSet0.vp_c12)._m0[0].y;
    }
    float _1911 = _1534;
    if (!_1893)
    {
        float _1913 = -_332;
        float _1915 = (-0.0) + _1913;
        _294 = _1915;
    }
    float _1917 = _294;
    float _1919 = _1889 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1921 = _1917;
    if (_1899)
    {
        _1456 = (*spvDescriptorSet0.vp_c12)._m0[0].x;
    }
    float _1923 = _1456;
    float _1925 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1927 = false;
    if (_1893)
    {
        bool _1929 = _1911 > 0.5;
        _1927 = _1929;
    }
    bool _1931 = _1927;
    bool _1933 = false;
    if (_1899)
    {
        bool _1935 = _1923 > 0.5;
        _1933 = _1935;
    }
    bool _1937 = _1933;
    if (_1893)
    {
        float _1939 = -_332;
        float _1941 = _1931 ? _332 : _1939;
        _1921 = _1941;
    }
    float _1943 = _1921;
    float _1945 = fma(_1502, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1907);
    float _1947 = exp2(_1919);
    float _1949 = _1943 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1951 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    if (_1899)
    {
        float _1953 = -_622;
        float _1955 = _1937 ? _1953 : _622;
        _838 = _1955;
    }
    float _1957 = _838;
    float _1959 = fma(_1702, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1945);
    bool _1961 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1963 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1965 = _1961 || _1963;
    bool _1967 = isnan(0.5);
    bool _1969 = _1965 || _1967;
    float _1971 = -(*spvDescriptorSet0.vp_c12)._m0[1].x;
    float _1973 = _1971 + (*spvDescriptorSet0.vp_c12)._m0[1].y;
    float _1975 = _1708;
    float _1977 = _1973;
    if (_1905)
    {
        float _1979 = 1.0 / _1736;
        _1975 = _1979;
    }
    float _1981 = _1975;
    float _1983 = -_1949;
    float _1985 = fma(_1983, _1909, -0.0);
    float _1987 = _1957 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1989 = fma(_630, _1973, (*spvDescriptorSet0.vp_c12)._m0[1].x);
    float _1991 = _1987 * _1925;
    float _1993 = fma(_1947, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1995 = precise::clamp(_1993, 0.0, 1.0);
    float _1997 = _1987;
    if (!_1905)
    {
        _1602 = _1959;
    }
    float _1999 = _1602;
    float _2001 = exp2(_1901);
    float _2003 = _1999;
    if (!_1969)
    {
        _1977 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _2005 = _1977;
    float _2007 = fma(_1995, -2.0, 3.0);
    float _2009 = _1995 * _1995;
    out.m_78.x = _1991;
    out.m_78.y = _1985;
    float _2011 = _2005;
    if (_1905)
    {
        float _2013 = -_1959;
        float _2015 = fma(_2013, _1981, 1.0);
        _1997 = _2015;
    }
    float _2017 = _1997;
    float _2019 = _2009 * _2007;
    if (!_1969)
    {
        float _2021 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2023 = _2005 + _2021;
        _2011 = _2023;
    }
    float _2025 = _2011;
    out.gl_Position.x = _1780;
    out.gl_Position.y = _1816;
    out.gl_Position.z = _1959;
    out.gl_Position.w = _1736;
    float _2027 = _2025;
    if (_1905)
    {
        float _2029 = -_2017;
        float _2031 = fma(_2029, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1959);
        _2003 = _2031;
    }
    float _2033 = _2003;
    float _2035 = _1911;
    if (!_1969)
    {
        float _2037 = 1.0 / _2025;
        _2035 = _2037;
    }
    float _2039 = _2035;
    if (_1969)
    {
        _1951 = 1.0;
    }
    float _2041 = _1951;
    float _2043 = _1736 + _2033;
    float _2045 = -_2019;
    float _2047 = _2045 + 1.0;
    float _2049 = _2041;
    if (_1905)
    {
        out.gl_Position.z = _2033;
    }
    float _2051 = -_2001;
    float _2053 = _2051 + 1.0;
    float _2055 = _2043 * 0.5;
    float _2057 = fma(_2047, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2019);
    if (!_1969)
    {
        float _2059 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2061 = _1220 + _2059;
        _2027 = _2061;
    }
    float _2063 = _2027;
    bool _2065 = _1220 <= 8000.0;
    bool _2067 = isnan(_1220);
    bool _2069 = _2065 || _2067;
    bool _2071 = isnan(8000.0);
    bool _2073 = _2069 || _2071;
    float _2075 = float(_2073);
    out.m_80.z = _2055;
    out.m_80.w = _1736;
    float _2077 = _2053 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (_1318)
    {
        _1820 = 1.0;
    }
    float _2079 = _1820;
    float _2081 = _2075 * _2057;
    float _2083 = _2079;
    if (!_1969)
    {
        float _2085 = _2063 * _2039;
        float _2087 = precise::clamp(_2085, 0.0, 1.0);
        _2049 = _2087;
    }
    float _2089 = _2049;
    float _2091 = _2081 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2093 = _1989 * _2089;
    float _2095 = -_1638;
    float _2097 = _2095 + 1.0;
    float _2099 = _2097 * _2091;
    float _2101 = precise::clamp(_2099, 0.0, 1.0);
    float _2103 = _2091;
    if (!_1762)
    {
        _2103 = 1.0;
    }
    float _2105 = _2103;
    float _2107 = -_2101;
    float _2109 = fma(_2107, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2111 = _2105;
    float _2113 = _2109;
    if (_1762)
    {
        bool _2115 = _1844 >= _1782;
        bool _2117 = isnan(_1844);
        bool _2119 = _2115 || _2117;
        bool _2121 = isnan(_1782);
        bool _2123 = _2119 || _2121;
        float _2125 = float(_2123);
        _2111 = _2125;
    }
    float _2127 = _2111;
    if (!_1318)
    {
        int _2129 = int(_1388) << 4;
        int _2131 = _2129 + 2048;
        uint _2133 = uint(int(uint(_2131) >> uint(2)));
        uint _2135 = uint(int(uint(int(_2133)) >> uint(2)));
        int _2137 = int(_2133) & 3;
        float _2139 = (*spvDescriptorSet0.vp_c15)._m0[int(_2135)][_2137];
        int _2141 = int(_2133) + 1;
        uint _2143 = uint(int(uint(_2141) >> uint(2)));
        int _2145 = _2141 & 3;
        float _2147 = (*spvDescriptorSet0.vp_c15)._m0[int(_2143)][_2145];
        int _2149 = _2131 + 8;
        uint _2151 = uint(int(uint(_2149) >> uint(2)));
        uint _2153 = uint(int(uint(int(_2151)) >> uint(2)));
        int _2155 = int(_2151) & 3;
        float _2157 = (*spvDescriptorSet0.vp_c15)._m0[int(_2153)][_2155];
        int _2159 = int(_2151) + 1;
        uint _2161 = uint(int(uint(_2159) >> uint(2)));
        int _2163 = _2159 & 3;
        float _2165 = (*spvDescriptorSet0.vp_c15)._m0[int(_2161)][_2163];
        float _2167 = _1162 * _2147;
        float _2169 = fma(_2139, (*spvDescriptorSet0.vp_c12)._m0[5].x, _2167);
        float _2171 = fma(_2157, (*spvDescriptorSet0.vp_c12)._m0[5].z, _2169);
        float _2173 = _2171 + _2165;
        float _2175 = precise::clamp(_2173, 0.0, 1.0);
        float _2177 = -_2175;
        float _2179 = _2177 + _1885;
        float _2181 = fma(_2179, 500.0, 1.5);
        float _2183 = exp2(_2181);
        float _2185 = 0.0 + _2183;
        float _2187 = precise::clamp(_2185, 0.0, 1.0);
        _2083 = _2187;
        _1752 = _2183;
    }
    float _2189 = _2083;
    float _2191 = _1752;
    float _2193 = _2077 * _1846;
    float _2195 = _2127 * _2189;
    float _2197 = -_2077;
    float _2199 = _2197 + 1.0;
    bool _2201 = _1134 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2203 = isnan(_1134);
    bool _2205 = _2201 || _2203;
    bool _2207 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2209 = _2205 || _2207;
    float _2211 = _1857 * _2193;
    float _2213 = -_2195;
    float _2215 = fma(_2213, _2109, 1.0);
    float _2217 = precise::clamp(_2215, 0.0, 1.0);
    float _2219 = _1867 * _2193;
    float _2221 = fma(_1863, _2211, _1851);
    float _2223 = fma(_1865, _2211, _1853);
    float _2225 = _1857 * _2199;
    float _2227 = _2217 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2229 = fma(_1857, _2219, _1855);
    float _2231 = _2093 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_82.x = _2227;
    float _2233 = _2193;
    float _2235 = _2191;
    float _2237 = _2211;
    float _2239 = _2217;
    if (!_2209)
    {
        _2113 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2241 = _2113;
    float _2243 = _2241;
    float _2245 = _2241;
    if (!_2209)
    {
        _840 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2247 = _840;
    out.m_84.x = _2221;
    out.m_84.y = _2223;
    out.m_84.z = _2229;
    out.m_84.w = _2225;
    float _2249 = _2247;
    float _2251 = _2247;
    if (!_2209)
    {
        _2233 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2253 = _2233;
    float _2255 = _2253;
    float _2257 = _2253;
    if (!_2209)
    {
        _2235 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2259 = _2235;
    float _2261 = _2259;
    float _2263 = _2259;
    if (!_2209)
    {
        _2237 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2265 = _2237;
    float _2267 = _2265;
    float _2269 = _2265;
    if (!_2209)
    {
        _2239 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2271 = _2239;
    bool _2273 = !_2209;
    float _2275 = _2271;
    float _2277 = _2271;
    if (!_2273)
    {
        bool _2279 = _1134 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2281 = isnan(_1134);
        bool _2283 = _2279 || _2281;
        bool _2285 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2287 = _2283 || _2285;
        if (!_2287)
        {
            float _2289 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2291 = _1134 + _2289;
            float _2293 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2295 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2293;
            float _2297 = 1.0 / _2295;
            float _2299 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2301 = _2299 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2303 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2305 = _2303 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2307 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2309 = _2307 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2311 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2313 = _2311 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2315 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2317 = _2315 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2319 = _2291 * _2297;
            float _2321 = precise::clamp(_2319, 0.0, 1.0);
            float _2323 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2325 = _2323 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2327 = fma(_2321, _2301, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2329 = fma(_2321, _2325, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2331 = fma(_2321, _2305, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2333 = fma(_2321, _2309, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2335 = fma(_2321, _2313, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2337 = fma(_2321, _2317, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2251 = _2331;
            _2269 = _2335;
            _2245 = _2329;
            _2263 = _2333;
            _2257 = _2327;
            _2277 = _2337;
            _2339 = true;
        }
        else
        {
            bool _2341 = _1134 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2343 = isnan(_1134);
            bool _2345 = _2341 || _2343;
            bool _2347 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2349 = _2345 || _2347;
            if (!_2349)
            {
                _2243 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2351 = _2243;
            _2245 = _2351;
            if (!_2349)
            {
                _2249 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2353 = _2249;
            _2251 = _2353;
            if (!_2349)
            {
                _2255 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2355 = _2255;
            _2257 = _2355;
            if (!_2349)
            {
                _2261 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2357 = _2261;
            _2263 = _2357;
            if (!_2349)
            {
                _2267 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2359 = _2267;
            _2269 = _2359;
            if (!_2349)
            {
                _2275 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2361 = _2275;
            bool _2363 = !_2349;
            _2277 = _2361;
            if (!_2363)
            {
                bool _2365 = _1134 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2367 = isnan(_1134);
                bool _2369 = _2365 || _2367;
                bool _2371 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2373 = _2369 || _2371;
                if (!_2373)
                {
                    float _2375 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2377 = _1134 + _2375;
                    float _2379 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2381 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2379;
                    float _2383 = 1.0 / _2381;
                    float _2385 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2387 = _2385 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2389 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2391 = _2389 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2393 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2395 = _2393 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2397 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2399 = _2397 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2401 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2403 = _2401 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2405 = _2377 * _2383;
                    float _2407 = precise::clamp(_2405, 0.0, 1.0);
                    float _2409 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2411 = _2409 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2413 = fma(_2407, _2387, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2415 = fma(_2407, _2411, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2417 = fma(_2407, _2391, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2419 = fma(_2407, _2395, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2421 = fma(_2407, _2399, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2423 = fma(_2407, _2403, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2251 = _2417;
                    _2269 = _2421;
                    _2245 = _2415;
                    _2263 = _2419;
                    _2257 = _2413;
                    _2277 = _2423;
                    _2339 = true;
                }
                else
                {
                    _2251 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2269 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2245 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2263 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2257 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2277 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2339 = false;
    float _2425 = _2251;
    float _2427 = _2269;
    float _2429 = _2245;
    float _2431 = _2263;
    float _2433 = _2257;
    float _2435 = _2277;
    float _2437 = fma(_968, -0.5, 0.5);
    float _2439 = precise::clamp(_2437, 0.0, 1.0);
    float _2441 = -_2425;
    float _2443 = _2441 + _2427;
    float _2445 = -_2429;
    float _2447 = _2445 + _2431;
    float _2449 = -_2433;
    float _2451 = _2449 + _2435;
    bool _2453 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2455 = fma(_2439, _2443, _2425);
    float _2457 = fma(_2439, _2447, _2429);
    float _2459 = fma(_2439, _2451, _2433);
    float _2461 = _2231 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2463 = _2455 * 0.586610972881317138671875;
    out.m_86.x = 0.0;
    float _2465 = fma(_2457, 0.298911988735198974609375, _2463);
    out.m_88.x = _2461;
    float _2467 = fma(_2459, 0.114477999508380889892578125, _2465);
    float _2469 = -_2467;
    float _2471 = _2457 + _2469;
    float _2473 = -_2467;
    float _2475 = _2455 + _2473;
    float _2477 = -_2467;
    float _2479 = _2459 + _2477;
    float _2481 = fma(_2471, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2467);
    float _2483 = fma(_2475, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2467);
    float _2485 = fma(_2479, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2467);
    out.m_90.x = _2481;
    out.m_90.y = _2483;
    out.m_90.z = _2485;
    if (!_2453)
    {
        return out;
    }
    float _2487 = -_1072;
    float _2489 = _2487 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2491 = -_1074;
    float _2493 = _2491 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2495 = -_1076;
    float _2497 = _2495 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2499 = _2489 * _2489;
    float _2501 = fma(_2493, _2493, _2499);
    float _2503 = fma(_2497, _2497, _2501);
    float _2505 = sqrt(_2503);
    float _2507 = rsqrt(_2503);
    float _2509 = -_2505;
    float _2511 = _2509 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2513 = _2511 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2515 = precise::clamp(_2513, 0.0, 1.0);
    float _2517 = _2493 * _2507;
    float _2519 = _2489 * _2507;
    float _2521 = abs(_2515);
    float _2523 = log2(_2521);
    float _2525 = _2497 * _2507;
    float _2527 = _2517 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2529 = _968 * _2519;
    float _2531 = -_2519;
    float _2533 = -_2527;
    float _2535 = fma(_2531, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2533);
    float _2537 = fma(_964, _2517, _2529);
    float _2539 = -_2525;
    float _2541 = fma(_2539, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2535);
    float _2543 = fma(_970, _2525, _2537);
    float _2545 = precise::clamp(_2543, 0.0, 1.0);
    float _2547 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2549 = _2541 + _2547;
    float _2551 = _2523 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2553 = _2549 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2555 = precise::clamp(_2553, 0.0, 1.0);
    float _2557 = exp2(_2551);
    float _2559 = _2557 * _2555;
    float _2561 = _2545 * _2559;
    float _2563 = _2561 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2565 = _2561 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2567 = _2561 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_86.x = _2563;
    out.m_86.y = _2565;
    out.m_86.z = _2567;
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
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2339 = false;
    bool _1018 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _104 = trunc((*spvDescriptorSet0.vp_c12)._m0[6].x);
    int _107 = int(_104);
    float _109 = as_type<float>(int(gl_VertexIndex));
    int _111 = max(0, _107);
    int _113 = min(_111, 5);
    int _115 = _113 << 2;
    int _117 = abs(as_type<int>(_109));
    uint _120 = uint(int(uint(_115) >> uint(2)));
    uint _122 = uint(int(uint(int(_120)) >> uint(2)));
    int _124 = int(_120) & 3;
    float _126 = (*spvDescriptorSet0.vp_c1)._m0[int(_122)][_124];
    float _128 = float(uint(_117));
    int _130 = as_type<int>(_126) + 1;
    int _132 = abs(_130);
    float _134 = float(uint(_132));
    float _136 = 1.0 / _134;
    int _138 = as_type<int>(_136) + (-2);
    float _140 = as_type<float>(_138) * _128;
    float _142 = trunc(_140);
    float _144 = precise::max(_142, 0.0);
    uint _146 = uint(_144);
    int _148 = ~int(_146);
    int _150 = _148 + 1;
    int _152 = _150 * _132;
    int _154 = _152 + _117;
    float _156 = float(uint(_154));
    float _158 = as_type<float>(_138) * _156;
    float _160 = trunc(_158);
    float _162 = precise::max(_160, 0.0);
    uint _164 = uint(_162);
    int _166 = int(_146) + int(_164);
    int _168 = ~_166;
    int _170 = _168 + 1;
    int _172 = as_type<int>(_109) ^ _130;
    int _174 = _170 * _132;
    int _176 = _174 + _117;
    uint _178 = uint(int(uint(_172) >> uint(31)));
    bool _182 = uint(_176) >= uint(_132);
    float _184 = (*spvDescriptorSet0.vp_c12)._m0[4].z * (*spvDescriptorSet0.vp_c12)._m0[5].w;
    int _186 = ~int(_178);
    int _188 = _186 + 1;
    bool _190 = !_182;
    int _192 = _190 ? 0 : (-1);
    bool _194 = _130 == 0;
    float _196 = trunc(_184);
    int _198 = int(_196);
    int _200 = ~_192;
    int _202 = _166 + _200;
    int _204 = _202 + 1;
    int _206 = _204 ^ _188;
    int _208 = ~_188;
    int _210 = _208 + _206;
    int _212 = _210 + 1;
    bool _214 = !_194;
    int _216 = _214 ? _212 : (-1);
    int _218 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1048576;
    bool _220 = _218 != 0;
    int _222 = _216 + 1;
    int _224 = _216 + _198;
    float _226 = float(_222);
    int _228 = _224 * 96;
    bool _230 = _226 != (*spvDescriptorSet0.vp_c12)._m0[5].w;
    bool _232 = isnan(_226);
    bool _234 = _230 || _232;
    bool _236 = isnan((*spvDescriptorSet0.vp_c12)._m0[5].w);
    bool _238 = _234 || _236;
    int _240 = _228 + 16;
    uint _242 = uint(int(uint(_228) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_242)];
    float _244 = as_type<float>(_dmw0.x);
    int _246 = _228 + 4;
    uint _248 = uint(int(uint(_246) >> uint(2)));
    float _250 = as_type<float>(_dmw0.y);
    int _252 = _228 + 8;
    uint _254 = uint(int(uint(_252) >> uint(2)));
    float _256 = as_type<float>(_dmw0.z);
    int _258 = _228 + 12;
    uint _260 = uint(int(uint(_258) >> uint(2)));
    float _262 = as_type<float>(_dmw0.w);
    int _264 = _228 + 80;
    int _266 = _228 + 48;
    uint _268 = uint(int(uint(_240) >> uint(2)));
    packed_uint4 _dmw1 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_268)];
    float _270 = as_type<float>(_dmw1.x);
    int _272 = _240 + 4;
    uint _274 = uint(int(uint(_272) >> uint(2)));
    float _276 = as_type<float>(_dmw1.y);
    int _278 = _240 + 8;
    uint _280 = uint(int(uint(_278) >> uint(2)));
    float _282 = as_type<float>(_dmw1.z);
    int _284 = _240 + 12;
    uint _286 = uint(int(uint(_284) >> uint(2)));
    float _288 = as_type<float>(_dmw1.w);
    float _290 = as_type<float>(_198);
    float _292 = as_type<float>(_212);
    float _294 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    if (!_220)
    {
        _290 = 0.0;
    }
    float _296 = _290;
    uint _298 = uint(int(uint(_264) >> uint(2)));
    packed_uint4 _dmw2 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_298)];
    float _300 = as_type<float>(_dmw2.x);
    int _302 = _264 + 4;
    uint _304 = uint(int(uint(_302) >> uint(2)));
    float _306 = as_type<float>(_dmw2.y);
    int _308 = _264 + 8;
    uint _310 = uint(int(uint(_308) >> uint(2)));
    float _312 = as_type<float>(_dmw2.z);
    int _314 = _264 + 12;
    uint _316 = uint(int(uint(_314) >> uint(2)));
    float _318 = as_type<float>(_dmw2.w);
    float _320 = 0.0;
    float _322 = _296;
    if (!_220)
    {
        _320 = 0.0;
    }
    float _324 = _320;
    float _326 = _324;
    if (!_220)
    {
        _292 = 0.0;
    }
    float _328 = _292;
    uint _330 = uint(int(uint(_266) >> uint(2)));
    float _332 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_330)]);
    uint _334 = 0u;
    float _336 = _328;
    if (!_238)
    {
        int _338 = _228 + (-96);
        _334 = uint(_338);
    }
    uint _340 = _334;
    bool _342 = !_220;
    float _344 = 0.0;
    float _346 = 0.0;
    float _348 = _288;
    float _350 = _318;
    if (!_342)
    {
        float _352 = -(*spvDescriptorSet0.vp_c10)._m0[5].w;
        float _354 = (*spvDescriptorSet0.vp_c8)._m0[29].y + _352;
        float _356 = -(*spvDescriptorSet0.vp_c10)._m0[4].w;
        float _358 = (*spvDescriptorSet0.vp_c8)._m0[29].x + _356;
        float _360 = _354 * _354;
        float _362 = -(*spvDescriptorSet0.vp_c10)._m0[6].w;
        float _364 = (*spvDescriptorSet0.vp_c8)._m0[29].z + _362;
        float _366 = fma(_358, _358, _360);
        float _368 = fma(_364, _364, _366);
        float _370 = rsqrt(_368);
        float _372 = _370 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
        float _374 = _358 * _372;
        float _376 = _354 * _372;
        float _378 = _364 * _372;
        _344 = _370;
        _346 = _372;
        _326 = _376;
        _322 = _374;
        _336 = _378;
    }
    float _380 = _344;
    float _382 = _346;
    float _384 = _326;
    float _386 = _322;
    float _388 = _336;
    float _390 = _380;
    float _392 = 0.0;
    float _394 = _382;
    int _396 = 0;
    if (!_238)
    {
        uint _398 = uint(int(uint(int(_340)) >> uint(2)));
        float _400 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_398)]);
        int _402 = int(_340) + 4;
        uint _404 = uint(int(uint(_402) >> uint(2)));
        float _406 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_404)]);
        int _408 = int(_340) + 8;
        uint _410 = uint(int(uint(_408) >> uint(2)));
        float _412 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_410)]);
        int _414 = int(_340) + 12;
        uint _416 = uint(int(uint(_414) >> uint(2)));
        float _418 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_416)]);
        _390 = _400;
        _392 = _406;
        _394 = _412;
        _396 = as_type<int>(_418);
    }
    float _420 = _390;
    float _422 = _392;
    float _424 = _394;
    int _426 = _396;
    if (!_238)
    {
        float _428 = _244 + _244;
        _348 = _428;
    }
    float _430 = _348;
    float _432 = 0.0;
    if (!_238)
    {
        float _434 = _250 + _250;
        _432 = _434;
    }
    float _436 = _432;
    if (!_238)
    {
        float _438 = _256 + _256;
        _350 = _438;
    }
    float _440 = _350;
    float _442 = float(as_type<int>(_126));
    float _444 = 1.0 / _442;
    float _446 = abs(_262);
    float _448 = _446 * 0.5;
    float _450 = _420;
    float _452 = _422;
    float _454 = _424;
    int _456 = _426;
    if (!_238)
    {
        float _458 = -_420;
        float _460 = _430 + _458;
        _450 = _460;
    }
    float _462 = _450;
    if (!_238)
    {
        float _464 = -_422;
        float _466 = _436 + _464;
        _452 = _466;
    }
    float _468 = _452;
    if (!_238)
    {
        float _470 = -_424;
        float _472 = _440 + _470;
        _454 = _472;
    }
    float _474 = _454;
    if (_238)
    {
        int _476 = _228 + 96;
        _456 = _476;
    }
    int _478 = _456;
    float _480 = _462;
    float _482 = _468;
    float _484 = _474;
    if (_238)
    {
        uint _486 = uint(int(uint(_478) >> uint(2)));
        packed_uint3 _dmw3 = *(const device packed_uint3*)&(*spvDescriptorSet0.vp_s0)._m0[int(_486)];
        float _488 = as_type<float>(_dmw3.x);
        int _490 = _478 + 4;
        uint _492 = uint(int(uint(_490) >> uint(2)));
        float _494 = as_type<float>(_dmw3.y);
        int _496 = _478 + 8;
        uint _498 = uint(int(uint(_496) >> uint(2)));
        float _500 = as_type<float>(_dmw3.z);
        _480 = _488;
        _482 = _494;
        _484 = _500;
    }
    float _502 = _480;
    float _504 = _482;
    float _506 = _484;
    float _508 = float(uint(_130));
    float _510 = float(as_type<uint>(_109));
    int _512 = ~_130;
    int _514 = _512 + 1;
    float _516 = 1.0 / _508;
    int _518 = as_type<int>(_516) + (-2);
    float _520 = _276 * _276;
    float _522 = as_type<float>(_518) * _510;
    float _524 = fma(_270, _270, _520);
    float _526 = trunc(_522);
    float _528 = precise::max(_526, 0.0);
    uint _530 = uint(_528);
    float _532 = fma(_282, _282, _524);
    float _534 = rsqrt(_532);
    int _536 = _514 * int(_530);
    int _538 = _536 + as_type<int>(_109);
    float _540 = float(uint(_538));
    float _542 = as_type<float>(_518) * _540;
    int _544 = ~_130;
    int _546 = _544 + 1;
    float _548 = trunc(_542);
    float _550 = precise::max(_548, 0.0);
    uint _552 = uint(_550);
    int _554 = int(_530) + int(_552);
    int _556 = _546 * _554;
    int _558 = _556 + as_type<int>(_109);
    float _560 = _276 * _534;
    bool _562 = uint(_558) >= uint(_130);
    bool _564 = !_562;
    int _566 = _564 ? 0 : (-1);
    bool _568 = _130 == 0;
    int _570 = ~_554;
    int _572 = _570 + _566;
    int _574 = _572 + 1;
    int _576 = _130 * _574;
    int _578 = _576 + as_type<int>(_109);
    float _580 = _282 * _534;
    float _582 = _270 * _534;
    float _584 = _312 * _560;
    float _586 = _300 * _580;
    float _588 = -_584;
    float _590 = fma(_306, _580, _588);
    float _592 = -_586;
    float _594 = fma(_312, _582, _592);
    float _596 = _306 * _582;
    float _598 = (*spvDescriptorSet0.vp_c12)._m0[4].y + (-1.0);
    float _600 = _594 * _594;
    float _602 = -_596;
    float _604 = fma(_300, _560, _602);
    bool _606 = !_568;
    int _608 = _606 ? _578 : (-1);
    float _610 = 1.0 / _598;
    float _612 = fma(_590, _590, _600);
    float _614 = float(_216);
    float _616 = float(_608);
    float _618 = fma(_604, _604, _612);
    float _620 = rsqrt(_618);
    float _622 = _616 * _444;
    float _624 = _622 * 6.283185482025146484375;
    float _626 = _226 * _610;
    float _628 = precise::clamp(_626, 0.0, 1.0);
    float _630 = _614 * _610;
    float _632 = _624 * 0.15915493667125701904296875;
    float _634 = -_628;
    float _636 = _634 + 1.0;
    float _638 = _632 * 6.283185482025146484375;
    float _640 = sin(_638);
    float _642 = _604 * _620;
    float _644 = _594 * _620;
    float _646 = _590 * _620;
    float _648 = _582 * _642;
    float _650 = _580 * _644;
    float _652 = abs(_636);
    float _654 = log2(_652);
    float _656 = -_648;
    float _658 = fma(_580, _646, _656);
    float _660 = -_650;
    float _662 = fma(_560, _642, _660);
    float _664 = _560 * _646;
    float _666 = -_630;
    float _668 = _666 + 1.0;
    float _670 = _658 * _658;
    float _672 = -_664;
    float _674 = fma(_582, _644, _672);
    float _676 = _632 * 6.283185482025146484375;
    float _678 = cos(_676);
    float _680 = fma(_662, _662, _670);
    float _682 = fma(_674, _674, _680);
    float _684 = 1.0 + (*spvDescriptorSet0.vp_c12)._m0[6].y;
    float _686 = abs(_668);
    float _688 = log2(_686);
    float _690 = _684 * _654;
    float _692 = rsqrt(_682);
    float _694 = _684 * _688;
    float _696 = exp2(_690);
    float _698 = _448 * _692;
    float _700 = exp2(_694);
    float _702 = _640 * _698;
    float _704 = _678 * _448;
    float _706 = -(*spvDescriptorSet0.vp_c12)._m0[1].z;
    float _708 = _706 + (*spvDescriptorSet0.vp_c12)._m0[1].w;
    float _710 = _658 * _702;
    float _712 = -_696;
    float _714 = _712 + 1.0;
    float _716 = _674 * _702;
    float _718 = fma(_644, _704, _710);
    float _720 = _662 * _702;
    float _722 = fma(_708, _714, (*spvDescriptorSet0.vp_c12)._m0[1].z);
    float _724 = -_700;
    float _726 = _724 + 1.0;
    float _728 = fma(_646, _704, _720);
    float _730 = fma(_642, _704, _716);
    float _732 = fma(_726, _708, (*spvDescriptorSet0.vp_c12)._m0[1].z);
    float _734 = fma(_732, _718, _250);
    float _736 = fma(_732, _728, _244);
    float _738 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _740 = _736 + _738;
    float _742 = _740 * _740;
    float _744 = fma(_718, _722, _504);
    float _746 = fma(_728, _722, _502);
    float _748 = fma(_730, _722, _506);
    float _750 = fma(_732, _730, _256);
    float _752 = -_734;
    float _754 = _752 + _744;
    float _756 = -_736;
    float _758 = _756 + _746;
    float _760 = -_750;
    float _762 = _760 + _748;
    float _764 = _754 * _754;
    float _766 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _768 = _750 + _766;
    float _770 = fma(_758, _758, _764);
    float _772 = _768 * _768;
    float _774 = fma(_762, _762, _770);
    float _776 = _742 + _772;
    float _778 = rsqrt(_774);
    float _780 = _762 * _778;
    float _782 = _754 * _778;
    float _784 = _758 * _778;
    float _786 = _728 * _780;
    float _788 = _730 * _782;
    float _790 = -_786;
    float _792 = fma(_730, _784, _790);
    float _794 = -_788;
    float _796 = fma(_718, _780, _794);
    float _798 = _718 * _784;
    float _800 = _792 * _792;
    float _802 = -_798;
    float _804 = fma(_728, _782, _802);
    float _806 = fma(_796, _796, _800);
    float _808 = sqrt(_776);
    float _810 = fma(_804, _804, _806);
    float _812 = rsqrt(_810);
    bool _814 = _808 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _816 = _804 * _812;
    float _818 = _792 * _812;
    float _820 = _796 * _812;
    float _822 = _784 * _816;
    float _824 = _780 * _818;
    float _826 = _782 * _820;
    float _828 = _812;
    float _830 = _820;
    float _832 = _782;
    float _834 = _736;
    float _836 = _804;
    float _838 = _622;
    float _840 = 1.0;
    if (!_814)
    {
        _828 = _736;
    }
    float _842 = _828;
    float _844 = -_822;
    float _846 = fma(_780, _820, _844);
    float _848 = -_824;
    float _850 = fma(_782, _816, _848);
    float _852 = _842;
    if (!_814)
    {
        _830 = _772;
    }
    float _854 = _830;
    float _856 = _854;
    if (!_814)
    {
        _832 = _742;
    }
    float _858 = _832;
    float _860 = _846 * _846;
    float _862 = _858;
    if (!_814)
    {
        _834 = _750;
    }
    float _864 = _834;
    float _866 = _864;
    if (!_814)
    {
        _836 = _734;
    }
    float _868 = _836;
    bool _870 = !_814;
    float _872 = _868;
    if (!_870)
    {
        float _874 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _876 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _878 = _808 + _876;
        float _880 = _734 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _882 = rsqrt(_776);
        float _884 = _878 * _874;
        float _886 = _884 * 0.15915493667125701904296875;
        float _888 = _886 * 6.283185482025146484375;
        float _890 = sin(_888);
        float _892 = _886 * 6.283185482025146484375;
        float _894 = cos(_892);
        float _896 = fma(_890, _880, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _898 = _882 * _896;
        float _900 = _894 + (-1.0);
        float _902 = fma(_740, _898, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _904 = fma(_768, _898, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _906 = _900 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _908 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _910 = _902 + _908;
        float _912 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _914 = _904 + _912;
        float _916 = fma(_734, _894, _906);
        float _918 = _910 * _910;
        float _920 = _914 * _914;
        _872 = _916;
        _862 = _918;
        _856 = _920;
        _852 = _902;
        _866 = _904;
    }
    float _922 = _872;
    float _924 = _862;
    float _926 = _856;
    float _928 = _852;
    float _930 = _866;
    float _932 = -_826;
    float _934 = fma(_784, _818, _932);
    float _936 = fma(_850, _850, _860);
    float _938 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _940 = _922 + _938;
    float _942 = fma(_934, _934, _936);
    float _944 = fma(_940, _940, _924);
    float _946 = rsqrt(_942);
    float _948 = _944 + _926;
    float _950 = (*spvDescriptorSet0.vp_c12)._m0[2].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _952 = (*spvDescriptorSet0.vp_c12)._m0[2].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _954 = sqrt(_948);
    float _956 = (*spvDescriptorSet0.vp_c12)._m0[2].w * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _958 = (*spvDescriptorSet0.vp_c12)._m0[2].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _960 = (*spvDescriptorSet0.vp_c12)._m0[3].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _962 = (*spvDescriptorSet0.vp_c12)._m0[3].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _964 = _850 * _946;
    float _966 = (*spvDescriptorSet0.vp_c12)._m0[3].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _968 = _846 * _946;
    float _970 = _934 * _946;
    out.m_72.x = _950;
    out.m_72.y = _952;
    out.m_72.z = _958;
    out.m_72.w = _956;
    out.m_74.x = _960;
    out.m_74.y = _962;
    out.m_74.z = _966;
    bool _972 = _954 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _974 = isnan(_954);
    bool _976 = _972 || _974;
    bool _978 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _980 = _976 || _978;
    out.m_76.x = _964;
    out.m_76.y = _968;
    out.m_76.z = _970;
    float _982 = _946;
    if (!_980)
    {
        _982 = 1.0;
    }
    float _984 = _982;
    bool _986 = !_980;
    float _988 = _984;
    if (!_986)
    {
        bool _990 = _954 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _992 = isnan(_954);
        bool _994 = _990 || _992;
        bool _996 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _998 = _994 || _996;
        if (!_998)
        {
            float _1000 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1002 = _954 + _1000;
            float _1004 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1006 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1004;
            float _1008 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1010 = _1008 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1012 = 1.0 / _1006;
            float _1014 = _1002 * _1012;
            float _1016 = fma(_1014, _1010, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _988 = _1016;
            _1018 = true;
        }
        else
        {
            bool _1020 = _954 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1022 = isnan(_954);
            bool _1024 = _1020 || _1022;
            bool _1026 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1028 = _1024 || _1026;
            if (!_1028)
            {
                float _1030 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1032 = _954 + _1030;
                float _1034 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1036 = _1034 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1038 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1040 = _1038 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1042 = 1.0 / _1036;
                float _1044 = _1032 * _1042;
                float _1046 = fma(_1044, _1040, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _988 = _1046;
                _1018 = true;
            }
            else
            {
                _988 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1018 = false;
    float _1048 = _988;
    float _1050 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1052 = _922 + _1050;
    float _1054 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1056 = _928 + _1054;
    float _1058 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1060 = _930 + _1058;
    float _1062 = _250 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1064 = fma(_1052, _1048, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1066 = fma(_1056, _1048, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1068 = fma(_1060, _1048, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1070 = fma(_244, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1062);
    float _1072 = _1064 + _384;
    float _1074 = _1066 + _386;
    float _1076 = _1068 + _388;
    float _1078 = _250 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1080 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1082 = _1072 + _1080;
    float _1084 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1086 = _1074 + _1084;
    float _1088 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1090 = _1076 + _1088;
    float _1092 = fma(_244, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1078);
    float _1094 = _1082 * _1082;
    float _1096 = fma(_256, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1070);
    float _1098 = fma(_256, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1092);
    float _1100 = fma(_1086, _1086, _1094);
    float _1102 = _250 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1104 = _250 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1106 = _1098 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1108 = fma(_1090, _1090, _1100);
    float _1110 = fma(_244, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1102);
    float _1112 = fma(_244, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1104);
    float _1114 = _1106 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1116 = rsqrt(_1108);
    float _1118 = fma(_256, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1110);
    float _1120 = _1096 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1122 = fma(_256, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1112);
    float _1124 = _1106 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1126 = _1118 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1128 = _1122 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1130 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1114);
    float _1132 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1124);
    float _1134 = sqrt(_1108);
    float _1136 = fma(_1120, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1130);
    float _1138 = fma(_1120, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1132);
    float _1140 = fma((*spvDescriptorSet0.vp_c12)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1142 = _1116 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1144 = fma(_1128, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1136);
    float _1146 = fma(_1128, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1138);
    float _1148 = _1086 * _1142;
    float _1150 = _1090 * _1142;
    float _1152 = 1.0 / _1144;
    float _1154 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1156 = _1148 * _1148;
    float _1158 = _1150 * _1150;
    float _1160 = _1146 + _1144;
    float _1162 = _1154 + (*spvDescriptorSet0.vp_c12)._m0[5].y;
    float _1164 = _1156 + _1158;
    float _1166 = _1162 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1168 = sqrt(_1164);
    float _1170 = fma((*spvDescriptorSet0.vp_c12)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1166);
    float _1172 = _1160 * _1152;
    float _1174 = _1172 * 0.5;
    float _1176 = fma((*spvDescriptorSet0.vp_c12)._m0[5].z, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1170);
    float _1178 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1180 = fma(_1174, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1178);
    float _1182 = _1162 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1184 = _1176 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1186 = fma((*spvDescriptorSet0.vp_c12)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1182);
    float _1188 = 1.0 / _1180;
    bool _1190 = _1168 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1192 = fma((*spvDescriptorSet0.vp_c12)._m0[5].z, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1186);
    float _1194 = _1192 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1196 = trunc(_1184);
    int _1198 = int(_1196);
    float _1200 = _1144;
    int _1202 = 2;
    float _1204 = _1048;
    float _1206 = _1142;
    float _1208 = _1164;
    float _1210 = _1150;
    float _1212 = _1156;
    if (_1190)
    {
        float _1214 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1200 = _1214;
    }
    float _1216 = _1200;
    float _1218 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1220 = _1188 * _1218;
    float _1222 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1224 = _1168 + _1222;
    bool _1226 = _1220 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1228 = trunc(_1194);
    int _1230 = int(_1228);
    bool _1232 = _1220 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1234 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    int _1236 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1238 = _1198 + _1236;
    int _1240 = _1238 + 1;
    float _1242 = _1224;
    if (_1190)
    {
        float _1244 = _1224 * _1216;
        _1242 = _1244;
    }
    float _1246 = _1242;
    float _1248 = floor(_1140);
    if (!_1226)
    {
        _1202 = 1;
    }
    int _1250 = _1202;
    int _1252 = _1250;
    if (_1190)
    {
        float _1254 = _1246 * 0.15915493667125701904296875;
        _1204 = _1254;
    }
    float _1256 = _1204;
    bool _1258 = !_1226;
    int _1260 = _1258 ? 0 : 1;
    bool _1262 = _1240 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1264 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1266 = _1230 + _1264;
    int _1268 = _1266 + 1;
    float _1270 = 0.0;
    if (_1190)
    {
        float _1272 = _1256 * 6.283185482025146484375;
        float _1274 = cos(_1272);
        _1270 = _1274;
    }
    float _1276 = _1270;
    if (!_1232)
    {
        _1252 = _1260;
    }
    int _1278 = _1252;
    int _1280 = _1240 | _1268;
    int _1282 = _1278 << 6;
    bool _1284 = _1280 < 0;
    bool _1286 = _1284 || _1262;
    float _1288 = 0.0;
    int _1290 = _1282;
    if (_1190)
    {
        float _1292 = rsqrt(_1164);
        _1288 = _1292;
    }
    float _1294 = _1288;
    float _1296 = precise::max(0.0, _1234);
    int _1298 = _1282 + 48;
    uint _1300 = uint(int(uint(_1298) >> uint(2)));
    uint _1302 = uint(int(uint(int(_1300)) >> uint(2)));
    int _1304 = int(_1300) & 3;
    float _1306 = (*spvDescriptorSet0.vp_c15)._m0[int(_1302)][_1304];
    int _1308 = int(_1300) + 1;
    uint _1310 = uint(int(uint(_1308) >> uint(2)));
    int _1312 = _1308 & 3;
    float _1314 = (*spvDescriptorSet0.vp_c15)._m0[int(_1310)][_1312];
    bool _1316 = _1268 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1318 = _1316 || _1286;
    float _1320 = -_1248;
    float _1322 = _1140 + _1320;
    float _1324 = -_1142;
    float _1326 = -_1296;
    float _1328 = fma(_1082, _1324, _1326);
    float _1330 = _1234;
    uint _1332 = as_type<uint>(_1248);
    if (_1190)
    {
        float _1334 = _1256 * 6.283185482025146484375;
        float _1336 = sin(_1334);
        _1330 = _1336;
    }
    float _1338 = _1330;
    float _1340 = 0.0;
    float _1342 = _1276;
    if (_1190)
    {
        float _1344 = _1276 + (-1.0);
        _1340 = _1344;
    }
    float _1346 = _1340;
    int _1348 = _1282 + 64;
    uint _1350 = uint(int(uint(_1348) >> uint(2)));
    uint _1352 = uint(int(uint(int(_1350)) >> uint(2)));
    int _1354 = int(_1350) & 3;
    float _1356 = (*spvDescriptorSet0.vp_c15)._m0[int(_1352)][_1354];
    int _1358 = int(_1350) + 1;
    uint _1360 = uint(int(uint(_1358) >> uint(2)));
    int _1362 = _1358 & 3;
    float _1364 = (*spvDescriptorSet0.vp_c15)._m0[int(_1360)][_1362];
    float _1366 = _1346;
    if (_1190)
    {
        float _1368 = _1328 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1206 = _1368;
    }
    float _1370 = _1206;
    float _1372 = fma((*spvDescriptorSet0.vp_c12)._m0[5].z, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1374 = 0.0;
    if (_1190)
    {
        float _1376 = _1346 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1374 = _1376;
    }
    float _1378 = _1374;
    if (!_1190)
    {
        _1366 = _1148;
    }
    float _1380 = _1366;
    float _1382 = _1380;
    if (!_1318)
    {
        int _1384 = _1268 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1386 = _1384 + _1240;
        _1332 = uint(_1386);
    }
    uint _1388 = _1332;
    float _1390 = floor(_1372);
    int _1392 = _1282 + 96;
    uint _1394 = uint(int(uint(_1392) >> uint(2)));
    uint _1396 = uint(int(uint(int(_1394)) >> uint(2)));
    int _1398 = int(_1394) & 3;
    float _1400 = (*spvDescriptorSet0.vp_c15)._m0[int(_1396)][_1398];
    int _1402 = int(_1394) + 1;
    uint _1404 = uint(int(uint(_1402) >> uint(2)));
    int _1406 = _1402 & 3;
    float _1408 = (*spvDescriptorSet0.vp_c15)._m0[int(_1404)][_1406];
    if (!_1190)
    {
        _1208 = _1328;
    }
    float _1410 = _1208;
    float _1412 = _1410;
    if (_1190)
    {
        float _1414 = fma(_1328, _1276, _1378);
        _1412 = _1414;
    }
    float _1416 = _1412;
    if (!_1190)
    {
        _1342 = _1158;
    }
    float _1418 = _1342;
    float _1420 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1422 = 0.0;
    float _1424 = _1418;
    if (_1190)
    {
        float _1426 = fma(_1338, _1370, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1422 = _1426;
    }
    float _1428 = _1422;
    int _1430 = _1282 + 72;
    uint _1432 = uint(int(uint(_1430) >> uint(2)));
    uint _1434 = uint(int(uint(int(_1432)) >> uint(2)));
    int _1436 = int(_1432) & 3;
    float _1438 = (*spvDescriptorSet0.vp_c15)._m0[int(_1434)][_1436];
    int _1440 = int(_1432) + 1;
    uint _1442 = uint(int(uint(_1440) >> uint(2)));
    int _1444 = _1440 & 3;
    float _1446 = (*spvDescriptorSet0.vp_c15)._m0[int(_1442)][_1444];
    float _1448 = _1428;
    if (_1190)
    {
        float _1450 = _1294 * _1428;
        _1448 = _1450;
    }
    float _1452 = _1448;
    float _1454 = _1072 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1456 = _1452;
    if (_1190)
    {
        float _1458 = _1148 * _1452;
        _1382 = _1458;
    }
    float _1460 = _1382;
    float _1462 = fma(_1074, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1454);
    int _1464 = _1282 + 104;
    uint _1466 = uint(int(uint(_1464) >> uint(2)));
    uint _1468 = uint(int(uint(int(_1466)) >> uint(2)));
    int _1470 = int(_1466) & 3;
    float _1472 = (*spvDescriptorSet0.vp_c15)._m0[int(_1468)][_1470];
    int _1474 = int(_1466) + 1;
    uint _1476 = uint(int(uint(_1474) >> uint(2)));
    int _1478 = _1474 & 3;
    float _1480 = (*spvDescriptorSet0.vp_c15)._m0[int(_1476)][_1478];
    float _1482 = _1454;
    if (!_1318)
    {
        float _1484 = floor(_1194);
        _1482 = _1484;
    }
    float _1486 = _1482;
    if (_1190)
    {
        float _1488 = _1150 * _1452;
        _1210 = _1488;
    }
    float _1490 = _1210;
    float _1492 = fma(_1076, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1462);
    if (_1190)
    {
        float _1494 = _1460 * _1460;
        _1212 = _1494;
    }
    float _1496 = _1212;
    if (_1190)
    {
        float _1498 = _1490 * _1490;
        _1424 = _1498;
    }
    float _1500 = _1424;
    float _1502 = _1492 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    int _1504 = _1282 + 80;
    uint _1506 = uint(int(uint(_1504) >> uint(2)));
    uint _1508 = uint(int(uint(int(_1506)) >> uint(2)));
    int _1510 = int(_1506) & 3;
    float _1512 = (*spvDescriptorSet0.vp_c15)._m0[int(_1508)][_1510];
    int _1514 = int(_1506) + 1;
    uint _1516 = uint(int(uint(_1514) >> uint(2)));
    int _1518 = _1514 & 3;
    float _1520 = (*spvDescriptorSet0.vp_c15)._m0[int(_1516)][_1518];
    float _1522 = fma(_1416, _1416, _1496);
    float _1524 = -_1390;
    float _1526 = _1372 + _1524;
    float _1528 = _1502 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    int _1530 = as_type<int>(_1390);
    float _1532 = _1528;
    float _1534 = _1526;
    if (!_1318)
    {
        uint _1536 = uint(int(uint(int(_1388)) >> uint(2)));
        _1530 = int(_1536);
    }
    int _1538 = _1530;
    float _1540 = _1522 + _1500;
    float _1542 = -_1528;
    float _1544 = fma(_1542, _1420, 1.0);
    int _1546 = _1282 + 56;
    uint _1548 = uint(int(uint(_1546) >> uint(2)));
    uint _1550 = uint(int(uint(int(_1548)) >> uint(2)));
    int _1552 = int(_1548) & 3;
    float _1554 = (*spvDescriptorSet0.vp_c15)._m0[int(_1550)][_1552];
    int _1556 = int(_1548) + 1;
    uint _1558 = uint(int(uint(_1556) >> uint(2)));
    int _1560 = _1556 & 3;
    float _1562 = (*spvDescriptorSet0.vp_c15)._m0[int(_1558)][_1560];
    if (!_1318)
    {
        float _1564 = -_1486;
        float _1566 = _1194 + _1564;
        _1532 = _1566;
    }
    float _1568 = _1532;
    float _1570 = _1162 * _1314;
    float _1572 = rsqrt(_1540);
    float _1574 = fma(_1306, (*spvDescriptorSet0.vp_c12)._m0[5].x, _1570);
    int _1576 = _1282 + 88;
    uint _1578 = uint(int(uint(_1576) >> uint(2)));
    uint _1580 = uint(int(uint(int(_1578)) >> uint(2)));
    int _1582 = int(_1578) & 3;
    float _1584 = (*spvDescriptorSet0.vp_c15)._m0[int(_1580)][_1582];
    int _1586 = int(_1578) + 1;
    uint _1588 = uint(int(uint(_1586) >> uint(2)));
    int _1590 = _1586 & 3;
    float _1592 = (*spvDescriptorSet0.vp_c15)._m0[int(_1588)][_1590];
    float _1594 = _1162 * _1364;
    float _1596 = log2(_1544);
    float _1598 = fma(_1356, (*spvDescriptorSet0.vp_c12)._m0[5].x, _1594);
    int _1600 = as_type<int>(_1314);
    float _1602 = _1568;
    if (!_1318)
    {
        int _1604 = int(_1388) << 2;
        _1290 = _1604;
    }
    int _1606 = _1290;
    float _1608 = _1162 * _1408;
    float _1610 = _1572 * _1460;
    int _1612 = _1606;
    if (!_1318)
    {
        int _1614 = 12 & _1606;
        _1612 = _1614;
    }
    int _1616 = _1612;
    float _1618 = fma(_1400, (*spvDescriptorSet0.vp_c12)._m0[5].x, _1608);
    float _1620 = _1572 * _1490;
    float _1622 = _1610 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    if (!_1318)
    {
        int _1624 = _1538 << 4;
        int _1626 = _1624 + _1616;
        _1600 = _1626;
    }
    int _1628 = _1600;
    float _1630 = _1162 * _1520;
    float _1632 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1634 = fma(_1134, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1632);
    float _1636 = precise::clamp(_1634, 0.0, 1.0);
    float2 _5031 = float2(_1322, _1526);
    float _1638 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5031, float2(0.0), isnan(_5031)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5031, float2(0.0), isnan(_5031)), level(0.0)).x;
    float _1640 = _1596 * 0.693147182464599609375;
    float _1642 = fma(_1512, (*spvDescriptorSet0.vp_c12)._m0[5].x, _1630);
    float _1644 = -_1636;
    float _1646 = _1644 + 1.0;
    float _1648 = fma(_1438, (*spvDescriptorSet0.vp_c12)._m0[5].z, _1598);
    float _1650 = fma(_1472, (*spvDescriptorSet0.vp_c12)._m0[5].z, _1618);
    float _1652 = fma(_1554, (*spvDescriptorSet0.vp_c12)._m0[5].z, _1574);
    float _1654 = _1572 * _1416;
    float _1656 = _1648 + _1446;
    float _1658 = _1650 + _1480;
    float _1660 = _1652 + _1562;
    float _1662 = _1072 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1664 = abs(_1646);
    float _1666 = log2(_1664);
    float _1668 = _1072 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1670 = fma(_1584, (*spvDescriptorSet0.vp_c12)._m0[5].z, _1642);
    float _1672 = -_1622;
    float _1674 = fma(_1654, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1672);
    float _1676 = fma(_1074, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1662);
    float _1678 = fma(_1074, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1668);
    float _1680 = -_1620;
    float _1682 = fma(_1680, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1674);
    float _1684 = 1.0 / _1658;
    float _1686 = _1072 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1688 = fma(_1076, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1676);
    float _1690 = fma(_1076, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1678);
    float _1692 = fma(_1074, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1686);
    float _1694 = _1688 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1696 = _1670 + _1592;
    float _1698 = _1666 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1700 = fma(_1076, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1692);
    float _1702 = _1690 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1704 = _1694 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1706 = exp2(_1698);
    float _1708 = _1700 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1710 = _1694 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1712 = _1640 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1714 = _1660 * _1684;
    float _1716 = fma(_1682, -0.5, 0.5);
    float _1718 = fma(_1708, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1710);
    float _1720 = _1656 * _1684;
    float _1722 = fma(_1682, 0.5, 0.5);
    bool _1724 = _1714 >= 0.0;
    float _1726 = fma(_1502, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1718);
    float _1728 = sqrt(_1716);
    float _1730 = fma(_1722, -0.0187292993068695068359375, 0.07426099479198455810546875);
    bool _1732 = _1714 <= 1.0;
    bool _1734 = _1732 && _1724;
    float _1736 = fma(_1702, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1726);
    float _1738 = _1694 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1740 = fma(_1722, _1730, -0.212114393711090087890625);
    bool _1742 = _1720 >= 0.0;
    bool _1744 = _1742 && _1734;
    float _1746 = fma(_1708, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1704);
    float _1748 = _1730;
    float _1750 = _1654;
    float _1752 = _1736;
    if (!_1318)
    {
        float _1754 = floor(_1184);
        _1748 = _1754;
    }
    float _1756 = _1748;
    float _1758 = _1654 + 1.0;
    bool _1760 = _1720 <= 1.0;
    bool _1762 = _1760 && _1744;
    float _1764 = fma(_1708, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1738);
    float _1766 = fma(_1502, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1746);
    float _1768 = -_1654;
    float _1770 = fma(_1706, _1758, _1768);
    float _1772 = fma(_1722, _1740, 1.570728778839111328125);
    float _1774 = fma(_1502, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1764);
    float _1776 = 1.0 / _1736;
    float _1778 = _1728 * 0.636619746685028076171875;
    float _1780 = fma(_1702, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1766);
    float _1782 = _1696 * _1684;
    float _1784 = fma(_1770, 0.5, 0.5);
    float _1786 = -_1772;
    float _1788 = fma(_1778, _1786, 1.0);
    float _1790 = as_type<float>(_1538);
    float _1792 = _1706;
    if (!_1318)
    {
        int _1794 = _1628 + 400;
        uint _1796 = uint(int(uint(_1794) >> uint(2)));
        uint _1798 = uint(int(uint(int(_1796)) >> uint(2)));
        int _1800 = int(_1796) & 3;
        float _1802 = (*spvDescriptorSet0.vp_c15)._m0[int(_1798)][_1800];
        _1790 = _1802;
    }
    float _1804 = _1790;
    if (_1762)
    {
        float _1806 = float(_1278);
        _1750 = _1806;
    }
    float _1808 = _1750;
    if (!_1318)
    {
        float _1810 = -_1756;
        float _1812 = _1184 + _1810;
        _1792 = _1812;
    }
    float _1814 = _1792;
    float _1816 = fma(_1702, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1774);
    float _1818 = _1808;
    float _1820 = _1816;
    if (_1762)
    {
        float _1822 = rint(_1808);
        float _1824 = precise::max(_1822, 0.0);
        uint _1826 = uint(_1824);
        uint _1828 = clamp(_1826, 0u, 65535u);
        _1818 = as_type<float>(_1828);
    }
    float _1830 = _1818;
    float _1832 = _1780 * _1776;
    float _1834 = _1816 * _1776;
    float _1836 = fma(_1832, 0.5, 0.5);
    float _1838 = fma(_1834, -0.5, 0.5);
    float _1840 = _1830;
    if (_1762)
    {
        float3 _5384 = float3(_1714, _1720, float(as_type<int>(_1830)));
        float3 _5388 = select(_5384, float3(0.0), isnan(_5384));
        float _1842 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5388.xy, uint(rint(_5388.z)), _1782, level(0.0));
        _1840 = _1842;
    }
    float _1844 = _1840;
    float3 _5398 = float3(_1836, _1838, _1712);
    float _1846 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5398, float3(0.0), isnan(_5398)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5398, float3(0.0), isnan(_5398)), level(0.0)).x;
    float3 _5407 = float3(_1836, _1838, _1712);
    float4 _1849 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5407, float3(0.0), isnan(_5407)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5407, float3(0.0), isnan(_5407)), level(0.0)).xyzw;
    float _1851 = _1849.x;
    float _1853 = _1849.y;
    float _1855 = _1849.z;
    float _1857 = _1849.w;
    float2 _5423 = float2(_1788, _1784);
    float3 _1861 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5423, float2(0.0), isnan(_5423)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5423, float2(0.0), isnan(_5423)), level(0.0)).xyz;
    float _1863 = _1861.x;
    float _1865 = _1861.y;
    float _1867 = _1861.z;
    float _1869 = _1684;
    if (!_1318)
    {
        float _1871 = rint(_1804);
        float _1873 = precise::max(_1871, 0.0);
        uint _1875 = uint(_1873);
        uint _1877 = clamp(_1875, 0u, 65535u);
        _1869 = as_type<float>(_1877);
    }
    float _1879 = _1869;
    float _1881 = _1879;
    if (!_1318)
    {
        float3 _5460 = float3(_1814, _1568, float(as_type<int>(_1879)));
        float3 _5462 = select(_5460, float3(0.0), isnan(_5460));
        float _1883 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5462.xy, uint(rint(_5462.z)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5462.xy, uint(rint(_5462.z)), level(0.0)).x;
        _1881 = _1883;
    }
    float _1885 = _1881;
    float _1887 = abs(_1220);
    float _1889 = log2(_1887);
    int _1891 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1893 = _1891 != 0;
    float _1895 = _1694 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1897 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1899 = _1897 != 0;
    float _1901 = _1666 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1903 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 524288;
    bool _1905 = _1903 != 0;
    float _1907 = fma(_1708, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1895);
    float _1909 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    if (_1893)
    {
        _1534 = (*spvDescriptorSet0.vp_c12)._m0[0].y;
    }
    float _1911 = _1534;
    if (!_1893)
    {
        float _1913 = -_332;
        float _1915 = (-0.0) + _1913;
        _294 = _1915;
    }
    float _1917 = _294;
    float _1919 = _1889 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1921 = _1917;
    if (_1899)
    {
        _1456 = (*spvDescriptorSet0.vp_c12)._m0[0].x;
    }
    float _1923 = _1456;
    float _1925 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1927 = false;
    if (_1893)
    {
        bool _1929 = _1911 > 0.5;
        _1927 = _1929;
    }
    bool _1931 = _1927;
    bool _1933 = false;
    if (_1899)
    {
        bool _1935 = _1923 > 0.5;
        _1933 = _1935;
    }
    bool _1937 = _1933;
    if (_1893)
    {
        float _1939 = -_332;
        float _1941 = _1931 ? _332 : _1939;
        _1921 = _1941;
    }
    float _1943 = _1921;
    float _1945 = fma(_1502, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1907);
    float _1947 = exp2(_1919);
    float _1949 = _1943 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1951 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    if (_1899)
    {
        float _1953 = -_622;
        float _1955 = _1937 ? _1953 : _622;
        _838 = _1955;
    }
    float _1957 = _838;
    float _1959 = fma(_1702, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1945);
    bool _1961 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1963 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1965 = _1961 || _1963;
    bool _1967 = isnan(0.5);
    bool _1969 = _1965 || _1967;
    float _1971 = -(*spvDescriptorSet0.vp_c12)._m0[1].x;
    float _1973 = _1971 + (*spvDescriptorSet0.vp_c12)._m0[1].y;
    float _1975 = _1708;
    float _1977 = _1973;
    if (_1905)
    {
        float _1979 = 1.0 / _1736;
        _1975 = _1979;
    }
    float _1981 = _1975;
    float _1983 = -_1949;
    float _1985 = fma(_1983, _1909, -0.0);
    float _1987 = _1957 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1989 = fma(_630, _1973, (*spvDescriptorSet0.vp_c12)._m0[1].x);
    float _1991 = _1987 * _1925;
    float _1993 = fma(_1947, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1995 = precise::clamp(_1993, 0.0, 1.0);
    float _1997 = _1987;
    if (!_1905)
    {
        _1602 = _1959;
    }
    float _1999 = _1602;
    float _2001 = exp2(_1901);
    float _2003 = _1999;
    if (!_1969)
    {
        _1977 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _2005 = _1977;
    float _2007 = fma(_1995, -2.0, 3.0);
    float _2009 = _1995 * _1995;
    out.m_78.x = _1991;
    out.m_78.y = _1985;
    float _2011 = _2005;
    if (_1905)
    {
        float _2013 = -_1959;
        float _2015 = fma(_2013, _1981, 1.0);
        _1997 = _2015;
    }
    float _2017 = _1997;
    float _2019 = _2009 * _2007;
    if (!_1969)
    {
        float _2021 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2023 = _2005 + _2021;
        _2011 = _2023;
    }
    float _2025 = _2011;
    out.gl_Position.x = _1780;
    out.gl_Position.y = _1816;
    out.gl_Position.z = _1959;
    out.gl_Position.w = _1736;
    float _2027 = _2025;
    if (_1905)
    {
        float _2029 = -_2017;
        float _2031 = fma(_2029, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1959);
        _2003 = _2031;
    }
    float _2033 = _2003;
    float _2035 = _1911;
    if (!_1969)
    {
        float _2037 = 1.0 / _2025;
        _2035 = _2037;
    }
    float _2039 = _2035;
    if (_1969)
    {
        _1951 = 1.0;
    }
    float _2041 = _1951;
    float _2043 = _1736 + _2033;
    float _2045 = -_2019;
    float _2047 = _2045 + 1.0;
    float _2049 = _2041;
    if (_1905)
    {
        out.gl_Position.z = _2033;
    }
    float _2051 = -_2001;
    float _2053 = _2051 + 1.0;
    float _2055 = _2043 * 0.5;
    float _2057 = fma(_2047, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2019);
    if (!_1969)
    {
        float _2059 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2061 = _1220 + _2059;
        _2027 = _2061;
    }
    float _2063 = _2027;
    bool _2065 = _1220 <= 8000.0;
    bool _2067 = isnan(_1220);
    bool _2069 = _2065 || _2067;
    bool _2071 = isnan(8000.0);
    bool _2073 = _2069 || _2071;
    float _2075 = float(_2073);
    out.m_80.z = _2055;
    out.m_80.w = _1736;
    float _2077 = _2053 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (_1318)
    {
        _1820 = 1.0;
    }
    float _2079 = _1820;
    float _2081 = _2075 * _2057;
    float _2083 = _2079;
    if (!_1969)
    {
        float _2085 = _2063 * _2039;
        float _2087 = precise::clamp(_2085, 0.0, 1.0);
        _2049 = _2087;
    }
    float _2089 = _2049;
    float _2091 = _2081 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2093 = _1989 * _2089;
    float _2095 = -_1638;
    float _2097 = _2095 + 1.0;
    float _2099 = _2097 * _2091;
    float _2101 = precise::clamp(_2099, 0.0, 1.0);
    float _2103 = _2091;
    if (!_1762)
    {
        _2103 = 1.0;
    }
    float _2105 = _2103;
    float _2107 = -_2101;
    float _2109 = fma(_2107, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2111 = _2105;
    float _2113 = _2109;
    if (_1762)
    {
        bool _2115 = _1844 >= _1782;
        bool _2117 = isnan(_1844);
        bool _2119 = _2115 || _2117;
        bool _2121 = isnan(_1782);
        bool _2123 = _2119 || _2121;
        float _2125 = float(_2123);
        _2111 = _2125;
    }
    float _2127 = _2111;
    if (!_1318)
    {
        int _2129 = int(_1388) << 4;
        int _2131 = _2129 + 2048;
        uint _2133 = uint(int(uint(_2131) >> uint(2)));
        uint _2135 = uint(int(uint(int(_2133)) >> uint(2)));
        int _2137 = int(_2133) & 3;
        float _2139 = (*spvDescriptorSet0.vp_c15)._m0[int(_2135)][_2137];
        int _2141 = int(_2133) + 1;
        uint _2143 = uint(int(uint(_2141) >> uint(2)));
        int _2145 = _2141 & 3;
        float _2147 = (*spvDescriptorSet0.vp_c15)._m0[int(_2143)][_2145];
        int _2149 = _2131 + 8;
        uint _2151 = uint(int(uint(_2149) >> uint(2)));
        uint _2153 = uint(int(uint(int(_2151)) >> uint(2)));
        int _2155 = int(_2151) & 3;
        float _2157 = (*spvDescriptorSet0.vp_c15)._m0[int(_2153)][_2155];
        int _2159 = int(_2151) + 1;
        uint _2161 = uint(int(uint(_2159) >> uint(2)));
        int _2163 = _2159 & 3;
        float _2165 = (*spvDescriptorSet0.vp_c15)._m0[int(_2161)][_2163];
        float _2167 = _1162 * _2147;
        float _2169 = fma(_2139, (*spvDescriptorSet0.vp_c12)._m0[5].x, _2167);
        float _2171 = fma(_2157, (*spvDescriptorSet0.vp_c12)._m0[5].z, _2169);
        float _2173 = _2171 + _2165;
        float _2175 = precise::clamp(_2173, 0.0, 1.0);
        float _2177 = -_2175;
        float _2179 = _2177 + _1885;
        float _2181 = fma(_2179, 500.0, 1.5);
        float _2183 = exp2(_2181);
        float _2185 = 0.0 + _2183;
        float _2187 = precise::clamp(_2185, 0.0, 1.0);
        _2083 = _2187;
        _1752 = _2183;
    }
    float _2189 = _2083;
    float _2191 = _1752;
    float _2193 = _2077 * _1846;
    float _2195 = _2127 * _2189;
    float _2197 = -_2077;
    float _2199 = _2197 + 1.0;
    bool _2201 = _1134 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2203 = isnan(_1134);
    bool _2205 = _2201 || _2203;
    bool _2207 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2209 = _2205 || _2207;
    float _2211 = _1857 * _2193;
    float _2213 = -_2195;
    float _2215 = fma(_2213, _2109, 1.0);
    float _2217 = precise::clamp(_2215, 0.0, 1.0);
    float _2219 = _1867 * _2193;
    float _2221 = fma(_1863, _2211, _1851);
    float _2223 = fma(_1865, _2211, _1853);
    float _2225 = _1857 * _2199;
    float _2227 = _2217 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2229 = fma(_1857, _2219, _1855);
    float _2231 = _2093 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_82.x = _2227;
    float _2233 = _2193;
    float _2235 = _2191;
    float _2237 = _2211;
    float _2239 = _2217;
    if (!_2209)
    {
        _2113 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2241 = _2113;
    float _2243 = _2241;
    float _2245 = _2241;
    if (!_2209)
    {
        _840 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2247 = _840;
    out.m_84.x = _2221;
    out.m_84.y = _2223;
    out.m_84.z = _2229;
    out.m_84.w = _2225;
    float _2249 = _2247;
    float _2251 = _2247;
    if (!_2209)
    {
        _2233 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2253 = _2233;
    float _2255 = _2253;
    float _2257 = _2253;
    if (!_2209)
    {
        _2235 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2259 = _2235;
    float _2261 = _2259;
    float _2263 = _2259;
    if (!_2209)
    {
        _2237 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2265 = _2237;
    float _2267 = _2265;
    float _2269 = _2265;
    if (!_2209)
    {
        _2239 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2271 = _2239;
    bool _2273 = !_2209;
    float _2275 = _2271;
    float _2277 = _2271;
    if (!_2273)
    {
        bool _2279 = _1134 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2281 = isnan(_1134);
        bool _2283 = _2279 || _2281;
        bool _2285 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2287 = _2283 || _2285;
        if (!_2287)
        {
            float _2289 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2291 = _1134 + _2289;
            float _2293 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2295 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2293;
            float _2297 = 1.0 / _2295;
            float _2299 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2301 = _2299 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2303 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2305 = _2303 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2307 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2309 = _2307 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2311 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2313 = _2311 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2315 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2317 = _2315 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2319 = _2291 * _2297;
            float _2321 = precise::clamp(_2319, 0.0, 1.0);
            float _2323 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2325 = _2323 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2327 = fma(_2321, _2301, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2329 = fma(_2321, _2325, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2331 = fma(_2321, _2305, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2333 = fma(_2321, _2309, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2335 = fma(_2321, _2313, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2337 = fma(_2321, _2317, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2251 = _2331;
            _2269 = _2335;
            _2245 = _2329;
            _2263 = _2333;
            _2257 = _2327;
            _2277 = _2337;
            _2339 = true;
        }
        else
        {
            bool _2341 = _1134 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2343 = isnan(_1134);
            bool _2345 = _2341 || _2343;
            bool _2347 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2349 = _2345 || _2347;
            if (!_2349)
            {
                _2243 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2351 = _2243;
            _2245 = _2351;
            if (!_2349)
            {
                _2249 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2353 = _2249;
            _2251 = _2353;
            if (!_2349)
            {
                _2255 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2355 = _2255;
            _2257 = _2355;
            if (!_2349)
            {
                _2261 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2357 = _2261;
            _2263 = _2357;
            if (!_2349)
            {
                _2267 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2359 = _2267;
            _2269 = _2359;
            if (!_2349)
            {
                _2275 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2361 = _2275;
            bool _2363 = !_2349;
            _2277 = _2361;
            if (!_2363)
            {
                bool _2365 = _1134 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2367 = isnan(_1134);
                bool _2369 = _2365 || _2367;
                bool _2371 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2373 = _2369 || _2371;
                if (!_2373)
                {
                    float _2375 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2377 = _1134 + _2375;
                    float _2379 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2381 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2379;
                    float _2383 = 1.0 / _2381;
                    float _2385 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2387 = _2385 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2389 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2391 = _2389 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2393 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2395 = _2393 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2397 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2399 = _2397 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2401 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2403 = _2401 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2405 = _2377 * _2383;
                    float _2407 = precise::clamp(_2405, 0.0, 1.0);
                    float _2409 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2411 = _2409 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2413 = fma(_2407, _2387, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2415 = fma(_2407, _2411, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2417 = fma(_2407, _2391, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2419 = fma(_2407, _2395, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2421 = fma(_2407, _2399, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2423 = fma(_2407, _2403, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2251 = _2417;
                    _2269 = _2421;
                    _2245 = _2415;
                    _2263 = _2419;
                    _2257 = _2413;
                    _2277 = _2423;
                    _2339 = true;
                }
                else
                {
                    _2251 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2269 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2245 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2263 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2257 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2277 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2339 = false;
    float _2425 = _2251;
    float _2427 = _2269;
    float _2429 = _2245;
    float _2431 = _2263;
    float _2433 = _2257;
    float _2435 = _2277;
    float _2437 = fma(_968, -0.5, 0.5);
    float _2439 = precise::clamp(_2437, 0.0, 1.0);
    float _2441 = -_2425;
    float _2443 = _2441 + _2427;
    float _2445 = -_2429;
    float _2447 = _2445 + _2431;
    float _2449 = -_2433;
    float _2451 = _2449 + _2435;
    bool _2453 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2455 = fma(_2439, _2443, _2425);
    float _2457 = fma(_2439, _2447, _2429);
    float _2459 = fma(_2439, _2451, _2433);
    float _2461 = _2231 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2463 = _2455 * 0.586610972881317138671875;
    out.m_86.x = 0.0;
    float _2465 = fma(_2457, 0.298911988735198974609375, _2463);
    out.m_88.x = _2461;
    float _2467 = fma(_2459, 0.114477999508380889892578125, _2465);
    float _2469 = -_2467;
    float _2471 = _2457 + _2469;
    float _2473 = -_2467;
    float _2475 = _2455 + _2473;
    float _2477 = -_2467;
    float _2479 = _2459 + _2477;
    float _2481 = fma(_2471, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2467);
    float _2483 = fma(_2475, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2467);
    float _2485 = fma(_2479, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2467);
    out.m_90.x = _2481;
    out.m_90.y = _2483;
    out.m_90.z = _2485;
    if (!_2453)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2487 = -_1072;
    float _2489 = _2487 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2491 = -_1074;
    float _2493 = _2491 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2495 = -_1076;
    float _2497 = _2495 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2499 = _2489 * _2489;
    float _2501 = fma(_2493, _2493, _2499);
    float _2503 = fma(_2497, _2497, _2501);
    float _2505 = sqrt(_2503);
    float _2507 = rsqrt(_2503);
    float _2509 = -_2505;
    float _2511 = _2509 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2513 = _2511 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2515 = precise::clamp(_2513, 0.0, 1.0);
    float _2517 = _2493 * _2507;
    float _2519 = _2489 * _2507;
    float _2521 = abs(_2515);
    float _2523 = log2(_2521);
    float _2525 = _2497 * _2507;
    float _2527 = _2517 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2529 = _968 * _2519;
    float _2531 = -_2519;
    float _2533 = -_2527;
    float _2535 = fma(_2531, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2533);
    float _2537 = fma(_964, _2517, _2529);
    float _2539 = -_2525;
    float _2541 = fma(_2539, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2535);
    float _2543 = fma(_970, _2525, _2537);
    float _2545 = precise::clamp(_2543, 0.0, 1.0);
    float _2547 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2549 = _2541 + _2547;
    float _2551 = _2523 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2553 = _2549 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2555 = precise::clamp(_2553, 0.0, 1.0);
    float _2557 = exp2(_2551);
    float _2559 = _2557 * _2555;
    float _2561 = _2545 * _2559;
    float _2563 = _2561 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2565 = _2561 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2567 = _2561 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_86.x = _2563;
    out.m_86.y = _2565;
    out.m_86.z = _2567;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

