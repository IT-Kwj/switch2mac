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

struct _21
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    device _21* cp_s0 [[id(0)]];
    device _21* cp_s1 [[id(1)]];
    device _21* cp_s2 [[id(2)]];
    device _21* cp_s3 [[id(3)]];
    device _21* cp_s4 [[id(4)]];
    device _21* cp_s5 [[id(5)]];
    device _21* cp_s6 [[id(6)]];
    device _21* cp_s7 [[id(7)]];
    device _21* cp_s8 [[id(8)]];
    device _21* cp_s9 [[id(9)]];
    device _21* cp_s10 [[id(10)]];
    device _21* cp_s11 [[id(11)]];
    device _21* cp_s12 [[id(12)]];
    device _21* cp_s13 [[id(13)]];
    texture2d<float> cp_t_tcb_2A [[id(14)]];
    sampler cp_t_tcb_2ASmplr [[id(15)]];
    texture2d_array<float> cp_t_tcb_14 [[id(16)]];
    sampler cp_t_tcb_14Smplr [[id(17)]];
    texture2d_array<float> cp_t_tcb_16 [[id(18)]];
    sampler cp_t_tcb_16Smplr [[id(19)]];
    sampler cp_t_tcb_2ASmplr_w [[id(20)]];
    sampler cp_t_tcb_14Smplr_w [[id(21)]];
    constant dm_border_t* dm_border [[id(22)]];
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]])
{
    bool _2268 = false;
    bool _810 = false;
    float _78 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[9]);
    float _80 = as_type<float>(gl_LocalInvocationID.x);
    float _82 = as_type<float>(gl_WorkGroupID.x);
    int _85 = as_type<int>(_82) << 5;
    int _87 = _85 + as_type<int>(_80);
    float _89 = trunc(_78);
    int _91 = int(_89);
    bool _95 = _87 >= _91;
    int _97 = 0;
    if (_95)
    {
        _97 = 0;
    }
    int _99 = _97;
    int _101 = _99;
    int _103 = _99;
    if (!_95)
    {
        int _105 = _87 << 4;
        int _107 = _105 + 12;
        uint _110 = uint(int(uint(_107) >> uint(2)));
        float _112 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_110)]);
        float _114 = trunc(_112);
        int _116 = int(_114);
        bool _118 = _116 >= 1;
        int _120 = _118 ? (-1) : 0;
        if (!_118)
        {
            _101 = 0;
        }
        int _122 = _101;
        bool _124 = !_118;
        _103 = _122;
        if (!_124)
        {
            float _126 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
            uint _128 = uint(int(uint(_107) >> uint(2)));
            float _130 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_128)]);
            float _132 = float(_116);
            float _134 = -_130;
            float _136 = _126 + _134;
            bool _138 = _136 > _132;
            int _140 = as_type<int>(_126);
            if (!_138)
            {
                bool _142 = _126 >= _130;
                bool _144 = isnan(_126);
                bool _146 = _142 || _144;
                bool _148 = isnan(_130);
                bool _150 = _146 || _148;
                _120 = _150 ? (-1) : 0;
            }
            int _152 = _120;
            if (_138)
            {
                _140 = 0;
            }
            int _154 = _140;
            _103 = _154;
            if (!_138)
            {
                int _156 = ~_152;
                int _158 = (_156 != 0) ? 0 : 1;
                _103 = _158;
            }
        }
    }
    int _160 = _103;
    int _162 = _160 & 1;
    bool _164 = _162 != 0;
    if (!_164)
    {
        return;
    }
    float _166 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[30]);
    int _168 = _87 << 4;
    uint _170 = uint(int(uint(_168) >> uint(2)));
    float _172 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_170)]);
    int _174 = _168 + 4;
    uint _176 = uint(int(uint(_174) >> uint(2)));
    float _178 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_176)]);
    int _180 = _168 + 8;
    uint _182 = uint(int(uint(_180) >> uint(2)));
    float _184 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_182)]);
    int _186 = as_type<int>(_166) & 512;
    bool _188 = _186 != 0;
    int _190 = _168 + 12;
    uint _192 = uint(int(uint(_168) >> uint(2)));
    float _194 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_192)]);
    int _196 = _168 + 4;
    uint _198 = uint(int(uint(_196) >> uint(2)));
    float _200 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_198)]);
    int _202 = _168 + 8;
    uint _204 = uint(int(uint(_202) >> uint(2)));
    float _206 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_204)]);
    uint _208 = uint(int(uint(_168) >> uint(2)));
    float _210 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_208)]);
    int _212 = _168 + 4;
    uint _214 = uint(int(uint(_212) >> uint(2)));
    float _216 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_214)]);
    int _218 = _168 + 8;
    uint _220 = uint(int(uint(_218) >> uint(2)));
    float _222 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_220)]);
    float _224 = 0.0;
    float _226 = 0.0;
    float _228 = 0.0;
    float _230 = _166;
    if (_188)
    {
        float _232 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[32]);
        float _234 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[33]);
        float _236 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[34]);
        _224 = _232;
        _226 = _234;
        _228 = _236;
    }
    float _238 = _224;
    float _240 = _226;
    float _242 = _228;
    float _244 = 0.0;
    float _246 = 0.0;
    float _248 = 0.0;
    if (_188)
    {
        float _250 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[36]);
        float _252 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[37]);
        float _254 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[38]);
        _244 = _250;
        _246 = _252;
        _248 = _254;
    }
    float _256 = _244;
    float _258 = _246;
    float _260 = _248;
    float _262 = 0.0;
    float _264 = 0.0;
    float _266 = 0.0;
    if (_188)
    {
        float _268 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[40]);
        float _270 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[41]);
        float _272 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[42]);
        _262 = _268;
        _264 = _270;
        _266 = _272;
    }
    float _274 = _262;
    float _276 = _264;
    float _278 = _266;
    uint _280 = uint(int(uint(_168) >> uint(2)));
    float _282 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_280)]);
    uint _284 = uint(int(uint(_190) >> uint(2)));
    float _286 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_284)]);
    uint _288 = uint(int(uint(_190) >> uint(2)));
    float _290 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_288)]);
    float _292 = _256;
    float _294 = _258;
    float _296 = _260;
    float _298 = _238;
    float _300 = _240;
    float _302 = _242;
    float _304 = _274;
    float _306 = _276;
    float _308 = _278;
    float _310 = _194;
    float _312 = _200;
    float _314 = _206;
    int _316 = as_type<int>(_172);
    int _318 = as_type<int>(_210);
    int _320 = as_type<int>(_216);
    int _322 = as_type<int>(_222);
    int _324 = as_type<int>(_210);
    int _326 = as_type<int>(_216);
    int _328 = as_type<int>(_222);
    int _330 = as_type<int>(_210);
    int _332 = as_type<int>(_216);
    int _334 = as_type<int>(_222);
    if (!_188)
    {
        int _336 = _168 + 4;
        uint _338 = uint(int(uint(_168) >> uint(2)));
        float _340 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_338)]);
        int _342 = _168 + 8;
        uint _344 = uint(int(uint(_168) >> uint(2)));
        float _346 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_344)]);
        uint _348 = uint(int(uint(_336) >> uint(2)));
        float _350 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_348)]);
        uint _352 = uint(int(uint(_342) >> uint(2)));
        float _354 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_352)]);
        uint _356 = uint(int(uint(_336) >> uint(2)));
        float _358 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_356)]);
        uint _360 = uint(int(uint(_342) >> uint(2)));
        float _362 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_360)]);
        uint _364 = uint(int(uint(_168) >> uint(2)));
        float _366 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_364)]);
        uint _368 = uint(int(uint(_336) >> uint(2)));
        float _370 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_368)]);
        uint _372 = uint(int(uint(_342) >> uint(2)));
        float _374 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_372)]);
        float _376 = _340 * _340;
        float _378 = fma(_346, _346, _376);
        float _380 = _350 * _350;
        float _382 = _354 * _354;
        float _384 = fma(_358, _358, _380);
        float _386 = fma(_362, _362, _382);
        float _388 = fma(_366, _366, _378);
        float _390 = fma(_370, _370, _384);
        float _392 = sqrt(_388);
        float _394 = fma(_374, _374, _386);
        float _396 = sqrt(_390);
        float _398 = sqrt(_394);
        bool _400 = _392 > 0.0;
        bool _402 = _396 > 0.0;
        bool _404 = _398 > 0.0;
        float _406 = _386;
        float _408 = _384;
        float _410 = _378;
        float _412 = _392;
        float _414 = _396;
        float _416 = _398;
        float _418 = _388;
        float _420 = _350;
        float _422 = _366;
        float _424 = _390;
        if (_400)
        {
            float _426 = rsqrt(_388);
            _406 = _426;
        }
        float _428 = _406;
        float _430 = 0.0;
        if (_402)
        {
            float _432 = rsqrt(_390);
            _430 = _432;
        }
        float _434 = _430;
        float _436 = 0.0;
        if (_404)
        {
            float _438 = rsqrt(_394);
            _436 = _438;
        }
        float _440 = _436;
        if (!_400)
        {
            _408 = 0.0;
        }
        float _442 = _408;
        float _444 = _442;
        if (_400)
        {
            float _446 = _366 * _428;
            _444 = _446;
        }
        float _448 = _444;
        _304 = _448;
        if (!_402)
        {
            _410 = 0.0;
        }
        float _450 = _410;
        float _452 = _450;
        if (!_400)
        {
            _412 = 0.0;
        }
        float _454 = _412;
        float _456 = _454;
        if (_400)
        {
            float _458 = _340 * _428;
            _456 = _458;
        }
        float _460 = _456;
        _292 = _460;
        if (!_400)
        {
            _414 = 0.0;
        }
        float _462 = _414;
        float _464 = _462;
        if (_402)
        {
            float _466 = _350 * _434;
            _452 = _466;
        }
        float _468 = _452;
        _294 = _468;
        if (!_402)
        {
            _416 = 0.0;
        }
        float _470 = _416;
        float _472 = _470;
        if (_400)
        {
            float _474 = _346 * _428;
            _464 = _474;
        }
        float _476 = _464;
        _298 = _476;
        if (!_402)
        {
            _418 = 0.0;
        }
        float _478 = _418;
        float _480 = _478;
        if (_402)
        {
            float _482 = _358 * _434;
            _472 = _482;
        }
        float _484 = _472;
        _300 = _484;
        if (!_404)
        {
            _420 = 0.0;
        }
        float _486 = _420;
        float _488 = _486;
        if (_402)
        {
            float _490 = _370 * _434;
            _480 = _490;
        }
        float _492 = _480;
        _306 = _492;
        if (!_404)
        {
            _422 = 0.0;
        }
        float _494 = _422;
        float _496 = _494;
        if (_404)
        {
            float _498 = _354 * _440;
            _488 = _498;
        }
        float _500 = _488;
        _296 = _500;
        if (!_404)
        {
            _424 = 0.0;
        }
        float _502 = _424;
        _308 = _502;
        if (_404)
        {
            float _504 = _362 * _440;
            _496 = _504;
        }
        float _506 = _496;
        _302 = _506;
        if (_404)
        {
            float _508 = _374 * _440;
            _308 = _508;
        }
    }
    float _510 = _292;
    float _512 = _294;
    float _514 = _296;
    float _516 = _298;
    float _518 = _300;
    float _520 = _302;
    float _522 = _304;
    float _524 = _306;
    float _526 = _308;
    float _528 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[68]);
    float _530 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[86]);
    float _532 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[85]);
    float _534 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[84]);
    float _536 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
    float _538 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
    float _540 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
    float _542 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
    float _544 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
    float _546 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _548 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[128]);
    float _550 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[129]);
    float _552 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[130]);
    float _554 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[131]);
    uint _556 = uint(int(uint(_190) >> uint(2)));
    float _558 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_556)]);
    bool _560 = _530 > 0.0;
    float _562 = abs(_528);
    float _564 = log2(_562);
    bool _566 = _532 > 0.0;
    float _568 = 0.0;
    float _570 = _534;
    float _572 = _530;
    float _574 = _536;
    bool _576 = _566;
    float _578 = _548;
    float _580 = _550;
    float _582 = _552;
    float _584 = _554;
    float _586 = _546;
    if (_560)
    {
        float _588 = 1.0 / _530;
        _568 = _588;
    }
    float _590 = _568;
    float _592 = _534 * _532;
    float _594 = _538 * _542;
    float _596 = _536 * _542;
    float _598 = -_290;
    float _600 = _544 + _598;
    if (_566)
    {
        float _602 = -_592;
        float _604 = fma(_282, _602, _534);
        _570 = _604;
    }
    float _606 = _570;
    float _608 = _546 * _564;
    float _610 = _540 * _542;
    float _612 = _594 * _510;
    float _614 = _594 * _512;
    float _616 = exp2(_608);
    float _618 = _606;
    if (_560)
    {
        float _620 = _600 * _590;
        _572 = _620;
    }
    float _622 = _572;
    float _624 = _594 * _514;
    float _626 = fma(_596, _516, _612);
    float _628 = fma(_596, _518, _614);
    float _630 = _628;
    if (_560)
    {
        float _632 = precise::min(_622, 1.0);
        _574 = _632;
    }
    float _634 = _574;
    float _636 = fma(_596, _520, _624);
    float _638 = fma(_610, _522, _626);
    float _640 = fma(_610, _524, _628);
    float _642 = fma(_610, _526, _636);
    if (_560)
    {
        float _644 = _634 * _606;
        _618 = _644;
    }
    float _646 = _618;
    float _648 = _546 * _638;
    float _650 = _546 * _640;
    float _652 = _286 * _546;
    float _654 = _546 * _642;
    float _656 = _546 * _646;
    float _658 = fma(_194, _616, _648);
    float _660 = fma(_200, _616, _650);
    float _662 = fma(_194, _652, _172);
    float _664 = fma(_200, _652, _178);
    float _666 = fma(_206, _652, _184);
    float _668 = fma(_206, _616, _654);
    float _670 = _548 * _656;
    float _672 = _550 * _656;
    float _674 = _552 * _656;
    bool _676 = !_188;
    float _678 = _654;
    float _680 = _656;
    float _682 = _670;
    float _684 = _674;
    float _806;
    float _808;
    if (!_676)
    {
        float _686 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _688 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _690 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _692 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _694 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _696 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _698 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _700 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _702 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _704 = _690 * _692;
        float _706 = _690 * _694;
        float _708 = _688 * _692;
        float _710 = -_704;
        float _712 = fma(_686, _696, _710);
        float _714 = -_706;
        float _716 = fma(_688, _696, _714);
        float _718 = -_708;
        float _720 = fma(_686, _694, _718);
        float _722 = _700 * _686;
        float _724 = _700 * _712;
        float _726 = _702 * _688;
        float _728 = _698 * _694;
        float _730 = -_722;
        float _732 = fma(_698, _688, _730);
        float _734 = -_724;
        float _736 = fma(_698, _716, _734);
        float _738 = _700 * _696;
        float _740 = _702 * _692;
        float _742 = _698 * _690;
        float _744 = fma(_702, _720, _736);
        float _746 = -_738;
        float _748 = fma(_702, _694, _746);
        float _750 = -_740;
        float _752 = fma(_698, _696, _750);
        float _754 = -_728;
        float _756 = fma(_700, _692, _754);
        float _758 = -_742;
        float _760 = fma(_702, _686, _758);
        float _762 = -_686;
        float _764 = fma(_762, _696, _704);
        float _766 = 1.0 / _744;
        float _768 = -_726;
        float _770 = fma(_700, _690, _768);
        float _772 = _748 * _766;
        float _774 = _752 * _766;
        float _776 = _756 * _766;
        float _778 = _670 * _766;
        float _780 = _672 * _772;
        float _782 = _672 * _774;
        float _784 = _764 * _766;
        float _786 = _672 * _776;
        float _788 = _770 * _766;
        float _790 = _760 * _766;
        float _792 = fma(_716, _778, _780);
        float _794 = fma(_670, _784, _782);
        float _796 = _732 * _766;
        float _798 = fma(_720, _778, _786);
        float _800 = fma(_674, _788, _792);
        float _802 = fma(_674, _790, _794);
        float _804 = fma(_674, _796, _798);
        _578 = _778;
        _580 = _694;
        _582 = _696;
        _584 = _704;
        _310 = _790;
        _312 = _794;
        _314 = _792;
        _680 = _798;
        _586 = _698;
        _230 = _700;
        _630 = _702;
        _806 = _766;
        _808 = _802;
        _682 = _800;
        _684 = _804;
        _810 = true;
    }
    else
    {
        int _812 = as_type<int>(_166) & 1024;
        bool _814 = _812 != 0;
        if (_814)
        {
            _576 = true;
        }
        bool _816 = _576;
        bool _818 = _816;
        if (!_814)
        {
            int _820 = as_type<int>(_166) & 2048;
            bool _822 = _820 != 0;
            _818 = _822;
        }
        bool _824 = _818;
        if (!_824)
        {
            _678 = _672;
        }
        float _826 = _678;
        bool _828 = !_824;
        _806 = 0.0;
        _808 = _826;
        if (!_828)
        {
            uint _830 = uint(int(uint(_168) >> uint(2)));
            float _832 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_830)]);
            int _834 = _168 + 4;
            uint _836 = uint(int(uint(_834) >> uint(2)));
            float _838 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_836)]);
            int _840 = _168 + 8;
            uint _842 = uint(int(uint(_840) >> uint(2)));
            float _844 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_842)]);
            uint _846 = uint(int(uint(_168) >> uint(2)));
            float _848 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_846)]);
            int _850 = _168 + 4;
            uint _852 = uint(int(uint(_850) >> uint(2)));
            float _854 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_852)]);
            int _856 = _168 + 8;
            uint _858 = uint(int(uint(_856) >> uint(2)));
            float _860 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_858)]);
            uint _862 = uint(int(uint(_168) >> uint(2)));
            float _864 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_862)]);
            int _866 = _168 + 4;
            uint _868 = uint(int(uint(_866) >> uint(2)));
            float _870 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_868)]);
            int _872 = _168 + 8;
            uint _874 = uint(int(uint(_872) >> uint(2)));
            float _876 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_874)]);
            float _878 = _844 * _848;
            float _880 = _844 * _854;
            float _882 = _838 * _848;
            float _884 = -_878;
            float _886 = fma(_832, _860, _884);
            float _888 = -_880;
            float _890 = fma(_838, _860, _888);
            float _892 = -_882;
            float _894 = fma(_832, _854, _892);
            float _896 = _870 * _832;
            float _898 = _870 * _886;
            float _900 = _876 * _838;
            float _902 = _864 * _854;
            float _904 = -_896;
            float _906 = fma(_864, _838, _904);
            float _908 = -_898;
            float _910 = fma(_864, _890, _908);
            float _912 = _870 * _860;
            float _914 = _876 * _848;
            float _916 = _864 * _844;
            float _918 = fma(_876, _894, _910);
            float _920 = -_912;
            float _922 = fma(_876, _854, _920);
            float _924 = -_914;
            float _926 = fma(_864, _860, _924);
            float _928 = -_902;
            float _930 = fma(_870, _848, _928);
            float _932 = -_916;
            float _934 = fma(_876, _832, _932);
            float _936 = -_832;
            float _938 = fma(_936, _860, _878);
            float _940 = 1.0 / _918;
            float _942 = -_900;
            float _944 = fma(_870, _844, _942);
            float _946 = _922 * _940;
            float _948 = _926 * _940;
            float _950 = _930 * _940;
            float _952 = _670 * _940;
            float _954 = _672 * _946;
            float _956 = _672 * _948;
            float _958 = _938 * _940;
            float _960 = _672 * _950;
            float _962 = _944 * _940;
            float _964 = _934 * _940;
            float _966 = fma(_890, _952, _954);
            float _968 = fma(_670, _958, _956);
            float _970 = _906 * _940;
            float _972 = fma(_894, _952, _960);
            float _974 = fma(_674, _962, _966);
            float _976 = fma(_674, _964, _968);
            float _978 = fma(_674, _970, _972);
            _578 = _952;
            _580 = _854;
            _582 = _860;
            _584 = _878;
            _310 = _964;
            _312 = _968;
            _314 = _966;
            _680 = _972;
            _586 = _864;
            _230 = _870;
            _630 = _876;
            _806 = _940;
            _808 = _976;
            _682 = _974;
            _684 = _978;
        }
    }
    _810 = false;
    float _980 = _578;
    float _982 = _580;
    float _984 = _582;
    float _986 = _584;
    float _988 = _310;
    float _990 = _312;
    float _992 = _314;
    float _994 = _680;
    float _996 = _586;
    float _998 = _230;
    float _1000 = _630;
    float _1002 = _806;
    float _1004 = _808;
    float _1006 = _682;
    float _1008 = _684;
    uint _1010 = uint(int(uint(_190) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1010)] = as_type<uint>(_558);
    float _1012 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[30]);
    int _1014 = as_type<int>(_1012) & 512;
    bool _1016 = _1014 != 0;
    int _1018 = as_type<int>(_1012) & 1024;
    bool _1020 = _1018 != 0;
    float _1022 = _980;
    float _1024 = _982;
    float _1026 = _984;
    float _1028 = _986;
    float _1030 = _1008;
    float _1032 = _1006;
    if (_1016)
    {
        float _1034 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _1036 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _1038 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _1040 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        _1022 = _1034;
        _1024 = _1036;
        _1026 = _1038;
        _1028 = _1040;
    }
    float _1042 = _1022;
    float _1044 = _1024;
    float _1046 = _1026;
    float _1048 = _1028;
    float _1050 = _988;
    float _1052 = _990;
    float _1054 = _992;
    float _1056 = _994;
    if (_1016)
    {
        float _1058 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _1060 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _1062 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _1064 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        _1050 = _1058;
        _1052 = _1060;
        _1054 = _1062;
        _1056 = _1064;
    }
    float _1066 = _1050;
    float _1068 = _1052;
    float _1070 = _1054;
    float _1072 = _1056;
    float _1074 = _996;
    float _1076 = _998;
    float _1078 = _1000;
    float _1080 = _1002;
    if (_1016)
    {
        float _1082 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _1084 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _1086 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _1088 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        _1074 = _1082;
        _1076 = _1084;
        _1078 = _1086;
        _1080 = _1088;
    }
    float _1090 = _1074;
    float _1092 = _1076;
    float _1094 = _1078;
    float _1096 = _1080;
    float _1098 = _664 + _1004;
    float _1100 = _662 + _1006;
    float _1102 = _666 + _1008;
    if (!_1016)
    {
        _1030 = 0.0;
    }
    float _1104 = _1030;
    int _1106 = as_type<int>(_1012) & 2048;
    bool _1108 = _1106 != 0;
    float _1110 = _1044;
    float _1112 = _1042;
    float _1114 = _1104;
    if (_1016)
    {
        float _1116 = _1098 * _1044;
        _1110 = _1116;
    }
    float _1118 = _1110;
    float _1120 = _1092;
    float _1122 = _1066;
    float _1124 = _1070;
    float _1126 = _1094;
    float _1128 = _1096;
    if (_1016)
    {
        float _1130 = _1098 * _1068;
        _1032 = _1130;
    }
    float _1132 = _1032;
    float _1134 = _1132;
    if (_1016)
    {
        float _1136 = fma(_1100, _1042, _1118);
        _1112 = _1136;
    }
    float _1138 = _1112;
    float _1140 = _1138;
    if (_1016)
    {
        float _1142 = _1098 * _1092;
        _1120 = _1142;
    }
    float _1144 = _1120;
    float _1146 = _1144;
    if (_1016)
    {
        float _1148 = fma(_1100, _1066, _1132);
        _1122 = _1148;
    }
    float _1150 = _1122;
    float _1152 = _1150;
    if (_1016)
    {
        float _1154 = fma(_1102, _1046, _1138);
        _1140 = _1154;
    }
    float _1156 = _1140;
    if (_1016)
    {
        float _1158 = fma(_1100, _1090, _1144);
        _1146 = _1158;
    }
    float _1160 = _1146;
    if (_1016)
    {
        float _1162 = fma(_1102, _1070, _1150);
        _1124 = _1162;
    }
    float _1164 = _1124;
    if (!_1016)
    {
        _1152 = 0.0;
    }
    float _1166 = _1152;
    float _1168 = _1166;
    if (_1016)
    {
        float _1170 = _1048 + _1156;
        _1168 = _1170;
    }
    float _1172 = _1168;
    if (_1016)
    {
        float _1174 = fma(_1102, _1094, _1160);
        _1126 = _1174;
    }
    float _1176 = _1126;
    if (!_1016)
    {
        _1134 = 0.0;
    }
    float _1178 = _1134;
    float _1180 = _1178;
    if (_1016)
    {
        float _1182 = _1072 + _1164;
        _1114 = _1182;
    }
    float _1184 = _1114;
    float _1186 = _1184;
    if (_1016)
    {
        float _1188 = _1096 + _1176;
        _1180 = _1188;
    }
    float _1190 = _1180;
    float _1192 = _1190;
    if (!_1020)
    {
        _1128 = _1172;
    }
    float _1194 = _1128;
    bool _1196 = !_1020;
    float _1198 = _1194;
    if (!_1196)
    {
        float _1200 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        uint _1202 = uint(int(uint(_168) >> uint(2)));
        float _1204 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1202)]);
        int _1206 = _168 + 4;
        uint _1208 = uint(int(uint(_1206) >> uint(2)));
        float _1210 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1208)]);
        int _1212 = _168 + 8;
        uint _1214 = uint(int(uint(_1212) >> uint(2)));
        float _1216 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1214)]);
        uint _1218 = uint(int(uint(_168) >> uint(2)));
        float _1220 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1218)]);
        int _1222 = _168 + 4;
        uint _1224 = uint(int(uint(_1222) >> uint(2)));
        float _1226 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1224)]);
        int _1228 = _168 + 8;
        uint _1230 = uint(int(uint(_1228) >> uint(2)));
        float _1232 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1230)]);
        uint _1234 = uint(int(uint(_168) >> uint(2)));
        float _1236 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1234)]);
        int _1238 = _168 + 4;
        uint _1240 = uint(int(uint(_1238) >> uint(2)));
        float _1242 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1240)]);
        int _1244 = _168 + 8;
        uint _1246 = uint(int(uint(_1244) >> uint(2)));
        float _1248 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1246)]);
        float _1250 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        float _1252 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        float _1254 = _1098 * _1210;
        float _1256 = _1098 * _1226;
        float _1258 = _1098 * _1242;
        float _1260 = fma(_1100, _1204, _1254);
        float _1262 = fma(_1100, _1220, _1256);
        float _1264 = fma(_1100, _1236, _1258);
        float _1266 = fma(_1102, _1216, _1260);
        float _1268 = fma(_1102, _1232, _1262);
        float _1270 = fma(_1102, _1248, _1264);
        float _1272 = _1200 + _1266;
        float _1274 = _1250 + _1268;
        float _1276 = _1252 + _1270;
        _1198 = _1276;
        _1192 = _1274;
        _1186 = _1272;
    }
    float _1278 = _1198;
    float _1280 = _1192;
    float _1282 = _1186;
    bool _1284 = !_1108;
    float _1286 = _1280;
    float _1288 = _1282;
    float _1290 = _1278;
    if (!_1284)
    {
        uint _1292 = uint(int(uint(_168) >> uint(2)));
        float _1294 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1292)]);
        int _1296 = _168 + 4;
        uint _1298 = uint(int(uint(_1296) >> uint(2)));
        float _1300 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1298)]);
        int _1302 = _168 + 8;
        uint _1304 = uint(int(uint(_1302) >> uint(2)));
        float _1306 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1304)]);
        int _1308 = _168 + 12;
        uint _1310 = uint(int(uint(_1308) >> uint(2)));
        float _1312 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1310)]);
        uint _1314 = uint(int(uint(_168) >> uint(2)));
        float _1316 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1314)]);
        int _1318 = _168 + 4;
        uint _1320 = uint(int(uint(_1318) >> uint(2)));
        float _1322 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1320)]);
        int _1324 = _168 + 8;
        uint _1326 = uint(int(uint(_1324) >> uint(2)));
        float _1328 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1326)]);
        int _1330 = _168 + 12;
        uint _1332 = uint(int(uint(_1330) >> uint(2)));
        float _1334 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1332)]);
        uint _1336 = uint(int(uint(_168) >> uint(2)));
        float _1338 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1336)]);
        int _1340 = _168 + 4;
        uint _1342 = uint(int(uint(_1340) >> uint(2)));
        float _1344 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1342)]);
        int _1346 = _168 + 8;
        uint _1348 = uint(int(uint(_1346) >> uint(2)));
        float _1350 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1348)]);
        int _1352 = _168 + 12;
        uint _1354 = uint(int(uint(_1352) >> uint(2)));
        float _1356 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1354)]);
        float _1358 = _1098 * _1300;
        float _1360 = _1098 * _1322;
        float _1362 = fma(_1100, _1294, _1358);
        float _1364 = _1098 * _1344;
        float _1366 = fma(_1100, _1316, _1360);
        float _1368 = fma(_1100, _1338, _1364);
        float _1370 = fma(_1102, _1306, _1362);
        float _1372 = fma(_1102, _1328, _1366);
        float _1374 = fma(_1102, _1350, _1368);
        float _1376 = _1370 + _1312;
        float _1378 = _1372 + _1334;
        float _1380 = _1374 + _1356;
        _1286 = _1376;
        _1288 = _1378;
        _1290 = _1380;
    }
    float _1382 = _1286;
    float _1384 = _1288;
    float _1386 = _1290;
    float _1388 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[70]);
    float _1390 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[8]);
    float _1392 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[9]);
    float _1394 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[10]);
    float _1396 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[11]);
    float _1398 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[504]);
    float _1400 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[505]);
    float _1402 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[506]);
    float _1404 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[507]);
    float _1406 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[501]);
    float _1408 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[61]);
    float _1410 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[60]);
    float _1412 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[502]);
    float _1414 = _1388 + 1.0;
    float _1416 = _1414 + _1382;
    float _1418 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[508]);
    float _1420 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[509]);
    float _1422 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[510]);
    float _1424 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[511]);
    float _1426 = _1416 * _1400;
    float _1428 = fma(_1398, _1384, _1426);
    float _1430 = fma(_1402, _1386, _1428);
    float _1432 = _1404 + _1430;
    float _1434 = trunc(_1432);
    int _1436 = int(_1434);
    int _1438 = ~as_type<int>(_1406);
    int _1440 = _1436 + _1438;
    int _1442 = _1440 + 1;
    bool _1444 = _1442 >= 0;
    int _1446 = 0;
    float _1448 = _1384;
    if (_1444)
    {
        float _1450 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[500]);
        _1446 = as_type<int>(_1450);
    }
    int _1452 = _1446;
    float _1454 = fma(_1384, 6.2500002968590706586837768554688e-05, 0.5);
    float _1456 = fma(_1386, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _4561 = float2(_1454, _1456);
    float _1458 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_4561, float2(0.0), isnan(_4561)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_4561, float2(0.0), isnan(_4561)), level(0.0)).x;
    float _1460 = _1392 * _1382;
    float _1462 = fma(_1390, _1384, _1460);
    float _1464 = fma(_1394, _1386, _1462);
    float _1466 = _1396 + _1464;
    float _1468 = -_1466;
    bool _1470 = _1408 >= _1468;
    bool _1472 = isnan(_1408);
    bool _1474 = _1470 || _1472;
    bool _1476 = isnan(_1468);
    bool _1478 = _1474 || _1476;
    float _1480 = -_1466;
    bool _1482 = _1410 >= _1480;
    bool _1484 = isnan(_1410);
    bool _1486 = _1482 || _1484;
    bool _1488 = isnan(_1480);
    bool _1490 = _1486 || _1488;
    int _1492 = _1478 ? 0 : 1;
    int _1494 = 2;
    float _1496 = _1454;
    float _1498 = _1456;
    if (_1478)
    {
        _1494 = 1;
    }
    int _1500 = _1494;
    int _1502 = _1500;
    if (_1490)
    {
        _1502 = _1492;
    }
    int _1504 = _1502;
    int _1506 = _1504 << 6;
    int _1508 = _1506 + 96;
    uint _1510 = uint(int(uint(_1508) >> uint(2)));
    float _1512 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1510)]);
    int _1514 = _1508 + 4;
    uint _1516 = uint(int(uint(_1514) >> uint(2)));
    float _1518 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1516)]);
    int _1520 = _1508 + 8;
    uint _1522 = uint(int(uint(_1520) >> uint(2)));
    float _1524 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1522)]);
    int _1526 = _1508 + 12;
    uint _1528 = uint(int(uint(_1526) >> uint(2)));
    float _1530 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1528)]);
    int _1532 = _1506 + 48;
    uint _1534 = uint(int(uint(_1532) >> uint(2)));
    float _1536 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1534)]);
    int _1538 = _1532 + 4;
    uint _1540 = uint(int(uint(_1538) >> uint(2)));
    float _1542 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1540)]);
    int _1544 = _1532 + 8;
    uint _1546 = uint(int(uint(_1544) >> uint(2)));
    float _1548 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1546)]);
    int _1550 = _1532 + 12;
    uint _1552 = uint(int(uint(_1550) >> uint(2)));
    float _1554 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1552)]);
    float _1556 = _1416 * _1420;
    float _1558 = fma(_1418, _1384, _1556);
    float _1560 = fma(_1422, _1386, _1558);
    float _1562 = _1424 + _1560;
    int _1564 = _1506 + 64;
    float _1566 = trunc(_1562);
    int _1568 = int(_1566);
    uint _1570 = uint(int(uint(_1564) >> uint(2)));
    float _1572 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1570)]);
    int _1574 = _1564 + 4;
    uint _1576 = uint(int(uint(_1574) >> uint(2)));
    float _1578 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1576)]);
    int _1580 = _1564 + 8;
    uint _1582 = uint(int(uint(_1580) >> uint(2)));
    float _1584 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1582)]);
    int _1586 = _1564 + 12;
    uint _1588 = uint(int(uint(_1586) >> uint(2)));
    float _1590 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1588)]);
    int _1592 = _1506 + 80;
    bool _1594 = _1452 <= _1442;
    bool _1596 = !_1444;
    bool _1598 = _1594 || _1596;
    int _1600 = ~as_type<int>(_1412);
    int _1602 = _1568 + _1600;
    int _1604 = _1602 + 1;
    uint _1606 = uint(int(uint(_1592) >> uint(2)));
    float _1608 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1606)]);
    int _1610 = _1592 + 4;
    uint _1612 = uint(int(uint(_1610) >> uint(2)));
    float _1614 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1612)]);
    int _1616 = _1592 + 8;
    uint _1618 = uint(int(uint(_1616) >> uint(2)));
    float _1620 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1618)]);
    int _1622 = _1592 + 12;
    uint _1624 = uint(int(uint(_1622) >> uint(2)));
    float _1626 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1624)]);
    bool _1628 = _1604 < 0;
    bool _1630 = _1628 || _1598;
    int _1632 = as_type<int>(_1412);
    if (!_1630)
    {
        float _1634 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[500]);
        _1632 = as_type<int>(_1634);
    }
    int _1636 = _1632;
    float _1638 = _1416 * _1518;
    float _1640 = fma(_1512, _1384, _1638);
    float _1642 = fma(_1524, _1386, _1640);
    float _1644 = _1530 + _1642;
    float _1646 = _1416 * _1542;
    float _1648 = 1.0 / _1644;
    float _1650 = fma(_1536, _1384, _1646);
    float _1652 = fma(_1548, _1386, _1650);
    float _1654 = _1416 * _1578;
    float _1656 = fma(_1572, _1384, _1654);
    float _1658 = _1554 + _1652;
    float _1660 = fma(_1584, _1386, _1656);
    float _1662 = _1658 * _1648;
    float _1664 = _1590 + _1660;
    bool _1666 = _1662 >= 0.0;
    float _1668 = _1664 * _1648;
    bool _1670 = _1662 <= 1.0;
    bool _1672 = _1670 && _1666;
    bool _1674 = _1668 >= 0.0;
    bool _1676 = _1674 && _1672;
    bool _1678 = _1668 <= 1.0;
    bool _1680 = _1678 && _1676;
    float _1682 = _1416 * _1614;
    float _1684 = fma(_1608, _1384, _1682);
    bool _1686 = _1636 <= _1604;
    bool _1688 = _1686 || _1630;
    float _1690 = fma(_1620, _1386, _1684);
    float _1692 = _1572;
    float _1694 = _1684;
    float _1696 = _1656;
    float _1698 = _1690;
    float _1700 = _1668;
    float _1702 = _1662;
    if (_1680)
    {
        float _1704 = float(_1504);
        _1692 = _1704;
    }
    float _1706 = _1692;
    float _1708 = _1626 + _1690;
    if (_1688)
    {
        _1694 = 1.0;
    }
    float _1710 = _1694;
    float _1712 = _1710;
    if (!_1688)
    {
        float _1714 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[500]);
        int _1716 = _1604 * as_type<int>(_1714);
        int _1718 = _1716 + _1442;
        int _1720 = _1718 << 2;
        uint _1722 = uint(int(uint(_1718) >> uint(2)));
        int _1724 = 12 & _1720;
        int _1726 = int(_1722) << 4;
        int _1728 = _1726 + _1724;
        int _1730 = _1728 + 400;
        uint _1732 = uint(int(uint(_1730) >> uint(2)));
        float _1734 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1732)]);
        float _1736 = floor(_1562);
        float _1738 = floor(_1432);
        float _1740 = -_1736;
        float _1742 = _1562 + _1740;
        float _1744 = -_1738;
        float _1746 = _1432 + _1744;
        float _1748 = rint(_1734);
        float _1750 = precise::max(_1748, 0.0);
        uint _1752 = uint(_1750);
        uint _1754 = clamp(_1752, 0u, 65535u);
        float3 _5016 = float3(_1746, _1742, float(int(_1754)));
        float3 _5020 = select(_5016, float3(0.0), isnan(_5016));
        float _1756 = dm_bs(spvDescriptorSet0.cp_t_tcb_14.sample(spvDescriptorSet0.cp_t_tcb_14Smplr, _5020.xy, uint(rint(_5020.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_14, spvDescriptorSet0.cp_t_tcb_14Smplr_w, _5020.xy, uint(rint(_5020.z)), level(0.0)).x;
        int _1758 = _1718 << 4;
        int _1760 = _1758 + 2048;
        uint _1762 = uint(int(uint(_1760) >> uint(2)));
        float _1764 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1762)]);
        int _1766 = _1760 + 4;
        uint _1768 = uint(int(uint(_1766) >> uint(2)));
        float _1770 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1768)]);
        int _1772 = _1760 + 8;
        uint _1774 = uint(int(uint(_1772) >> uint(2)));
        float _1776 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1774)]);
        int _1778 = _1760 + 12;
        uint _1780 = uint(int(uint(_1778) >> uint(2)));
        float _1782 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1780)]);
        float _1784 = _1416 * _1770;
        float _1786 = fma(_1764, _1384, _1784);
        float _1788 = fma(_1776, _1386, _1786);
        float _1790 = _1782 + _1788;
        float _1792 = precise::clamp(_1790, 0.0, 1.0);
        float _1794 = -_1792;
        float _1796 = _1794 + _1756;
        float _1798 = fma(_1796, 500.0, 1.5);
        float _1800 = exp2(_1798);
        float _1802 = 0.0 + _1800;
        float _1804 = precise::clamp(_1802, 0.0, 1.0);
        _1696 = _1756;
        _1698 = _1800;
        _1712 = _1804;
    }
    float _1806 = _1696;
    float _1808 = _1698;
    float _1810 = _1712;
    float _1812 = _1706;
    float _1814 = _1806;
    float _1816 = _1808;
    if (_1680)
    {
        float _1818 = rint(_1706);
        float _1820 = precise::max(_1818, 0.0);
        uint _1822 = uint(_1820);
        uint _1824 = clamp(_1822, 0u, 65535u);
        _1812 = as_type<float>(_1824);
    }
    float _1826 = _1812;
    float _1828 = _1708 * _1648;
    bool _1830 = _1458 != 0.0;
    bool _1832 = isnan(_1458);
    bool _1834 = _1830 || _1832;
    bool _1836 = isnan(0.0);
    bool _1838 = _1834 || _1836;
    uint _1840 = uint(int(uint(_168) >> uint(2)));
    float _1842 = as_type<float>((*spvDescriptorSet0.cp_s13)._m0[int(_1840)]);
    float _1844 = fma(_1384, 6.2500002968590706586837768554688e-05, 0.4999375045299530029296875);
    float _1846 = fma(_1384, 6.2500002968590706586837768554688e-05, 0.500062525272369384765625);
    float _1848 = fma(_1386, 6.2500002968590706586837768554688e-05, 0.4999375045299530029296875);
    float _1850 = fma(_1386, 6.2500002968590706586837768554688e-05, 0.500062525272369384765625);
    float _1852 = _1826;
    float _1854 = _1844;
    if (_1680)
    {
        float3 _5162 = float3(_1662, _1668, float(as_type<int>(_1826)));
        float3 _5164 = select(_5162, float3(0.0), isnan(_5162));
        float _1856 = spvDepthCast(spvDescriptorSet0.cp_t_tcb_16).sample_compare(spvDescriptorSet0.cp_t_tcb_16Smplr, _5164.xy, uint(rint(_5164.z)), _1828, level(0.0));
        _1852 = _1856;
    }
    float _1858 = _1852;
    if (_1838)
    {
        _1814 = _1458;
    }
    float _1860 = _1814;
    if (!_1838)
    {
        _1448 = 4.0;
    }
    float _1862 = _1448;
    float _1864 = _1860;
    float _1866 = _1862;
    if (!_1838)
    {
        float2 _5189 = float2(_1454, _1456);
        float _1868 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_5189, float2(0.0), isnan(_5189)), level(_1862)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_5189, float2(0.0), isnan(_5189)), level(_1862)).x;
        _1864 = _1868;
    }
    float _1870 = _1864;
    float2 _5201 = float2(_1844, _1456);
    float _1872 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_5201, float2(0.0), isnan(_5201)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_5201, float2(0.0), isnan(_5201)), level(0.0)).x;
    float2 _5209 = float2(_1454, _1848);
    float _1874 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_5209, float2(0.0), isnan(_5209)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_5209, float2(0.0), isnan(_5209)), level(0.0)).x;
    float2 _5217 = float2(_1846, _1456);
    float _1876 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_5217, float2(0.0), isnan(_5217)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_5217, float2(0.0), isnan(_5217)), level(0.0)).x;
    float2 _5225 = float2(_1454, _1850);
    float _1878 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_5225, float2(0.0), isnan(_5225)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_5225, float2(0.0), isnan(_5225)), level(0.0)).x;
    if (!_1680)
    {
        _1816 = 1.0;
    }
    float _1880 = _1816;
    bool _1882 = _600 > 0.001000000047497451305389404296875;
    bool _1884 = isnan(_600);
    bool _1886 = _1882 || _1884;
    bool _1888 = isnan(0.001000000047497451305389404296875);
    bool _1890 = _1886 || _1888;
    float _1892 = _1880;
    float _1894 = _1858;
    float _1896 = _1876;
    float _1898 = _1874;
    float _1900 = _1878;
    if (_1680)
    {
        bool _1902 = _1858 >= _1828;
        bool _1904 = isnan(_1858);
        bool _1906 = _1902 || _1904;
        bool _1908 = isnan(_1828);
        bool _1910 = _1906 || _1908;
        float _1912 = float(_1910);
        _1892 = _1912;
    }
    float _1914 = _1892;
    float _1916 = -_1914;
    float _1918 = fma(_1916, _1810, 1.0);
    float _1920 = -_1842;
    float _1922 = _1918 + _1920;
    float _1924 = _1918;
    if (_1890)
    {
        float _1926 = fma(_1922, 0.0500000007450580596923828125, _1842);
        _1924 = _1926;
    }
    float _1928 = _1924;
    float _1930 = precise::max(0.0, _1928);
    float _1932 = precise::min(_1930, 0.999000012874603271484375);
    uint _1934 = uint(int(uint(_168) >> uint(2)));
    (*spvDescriptorSet0.cp_s13)._m0[int(_1934)] = as_type<uint>(_1932);
    float _1936 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[76]);
    float _1938 = _1870 * 2000.0;
    bool _1940 = _1938 == 0.0;
    bool _1942 = !_1890;
    bool _1944 = _1940 && _1942;
    bool _1946 = !_1944;
    int _1948 = _1946 ? as_type<int>(_558) : 0;
    float _1950 = -_172;
    float _1952 = _1950 + _1100;
    float _1954 = -_178;
    float _1956 = _1954 + _1098;
    float _1958 = -_184;
    float _1960 = _1958 + _1102;
    if (_1890)
    {
        _316 = _1948;
    }
    int _1962 = _316;
    float _1964 = _1938 + _1936;
    int _1966 = _168 + 4;
    uint _1968 = uint(int(uint(_1966) >> uint(2)));
    (*spvDescriptorSet0.cp_s13)._m0[int(_1968)] = as_type<uint>(_1964);
    int _1970 = _1962;
    if (!_1890)
    {
        float2 _5365 = float2(_1844, _1848);
        float _1972 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_5365, float2(0.0), isnan(_5365)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_5365, float2(0.0), isnan(_5365)), level(0.0)).x;
        float2 _5373 = float2(_1844, _1850);
        float _1974 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_5373, float2(0.0), isnan(_5373)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_5373, float2(0.0), isnan(_5373)), level(0.0)).x;
        float2 _5381 = float2(_1846, _1848);
        float _1976 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_5381, float2(0.0), isnan(_5381)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_5381, float2(0.0), isnan(_5381)), level(0.0)).x;
        float2 _5389 = float2(_1846, _1850);
        float _1978 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_5389, float2(0.0), isnan(_5389)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_5389, float2(0.0), isnan(_5389)), level(0.0)).x;
        bool _1980 = _1872 != 0.0;
        bool _1982 = isnan(_1872);
        bool _1984 = _1980 || _1982;
        bool _1986 = isnan(0.0);
        bool _1988 = _1984 || _1986;
        float _1990 = _1456;
        if (_1988)
        {
            _1700 = _1872;
        }
        float _1992 = _1700;
        if (!_1988)
        {
            _1866 = 4.0;
        }
        float _1994 = _1866;
        float _1996 = _1992;
        float _1998 = _1994;
        if (!_1988)
        {
            float2 _5424 = float2(_1844, _1456);
            float _2000 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_5424, float2(0.0), isnan(_5424)), level(_1994)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_5424, float2(0.0), isnan(_5424)), level(_1994)).x;
            _1996 = _2000;
        }
        float _2002 = _1996;
        bool _2004 = _1876 != 0.0;
        bool _2006 = isnan(_1876);
        bool _2008 = _2004 || _2006;
        bool _2010 = isnan(0.0);
        bool _2012 = _2008 || _2010;
        bool _2014 = _1874 != 0.0;
        bool _2016 = isnan(_1874);
        bool _2018 = _2014 || _2016;
        bool _2020 = isnan(0.0);
        bool _2022 = _2018 || _2020;
        bool _2024 = _1878 != 0.0;
        bool _2026 = isnan(_1878);
        bool _2028 = _2024 || _2026;
        bool _2030 = isnan(0.0);
        bool _2032 = _2028 || _2030;
        if (_2012)
        {
            _1702 = _1876;
        }
        float _2034 = _1702;
        if (!_2012)
        {
            _1496 = 4.0;
        }
        float _2036 = _1496;
        if (_2022)
        {
            _1894 = _1874;
        }
        float _2038 = _1894;
        float _2040 = _2034;
        if (!_2012)
        {
            float2 _5488 = float2(_1846, _1456);
            float _2042 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_5488, float2(0.0), isnan(_5488)), level(_2036)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_5488, float2(0.0), isnan(_5488)), level(_2036)).x;
            _2040 = _2042;
        }
        float _2044 = _2040;
        if (_2032)
        {
            _1998 = _1878;
        }
        float _2046 = _1998;
        if (!_2022)
        {
            _1498 = 4.0;
        }
        float _2048 = _1498;
        if (!_2032)
        {
            _1854 = 4.0;
        }
        float _2050 = _1854;
        bool _2052 = _1972 != 0.0;
        bool _2054 = isnan(_1972);
        bool _2056 = _2052 || _2054;
        bool _2058 = isnan(0.0);
        bool _2060 = _2056 || _2058;
        bool _2062 = _1974 != 0.0;
        bool _2064 = isnan(_1974);
        bool _2066 = _2062 || _2064;
        bool _2068 = isnan(0.0);
        bool _2070 = _2066 || _2068;
        bool _2072 = _1976 != 0.0;
        bool _2074 = isnan(_1976);
        bool _2076 = _2072 || _2074;
        bool _2078 = isnan(0.0);
        bool _2080 = _2076 || _2078;
        bool _2082 = _1978 != 0.0;
        bool _2084 = isnan(_1978);
        bool _2086 = _2082 || _2084;
        bool _2088 = isnan(0.0);
        bool _2090 = _2086 || _2088;
        if (!_2060)
        {
            _1990 = 4.0;
        }
        float _2092 = _1990;
        if (!_2070)
        {
            _1896 = 4.0;
        }
        float _2094 = _1896;
        if (!_2080)
        {
            _1898 = 4.0;
        }
        float _2096 = _1898;
        float _2098 = _1972;
        if (!_2060)
        {
            float2 _5578 = float2(_1844, _1848);
            float _2100 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_5578, float2(0.0), isnan(_5578)), level(_2092)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_5578, float2(0.0), isnan(_5578)), level(_2092)).x;
            _2098 = _2100;
        }
        float _2102 = _2098;
        float _2104 = _1974;
        if (!_2070)
        {
            float2 _5594 = float2(_1844, _1850);
            float _2106 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_5594, float2(0.0), isnan(_5594)), level(_2094)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_5594, float2(0.0), isnan(_5594)), level(_2094)).x;
            _2104 = _2106;
        }
        float _2108 = _2104;
        if (!_2090)
        {
            _1900 = 4.0;
        }
        float _2110 = _1900;
        float _2112 = _1976;
        if (!_2080)
        {
            float2 _5615 = float2(_1846, _1848);
            float _2114 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_5615, float2(0.0), isnan(_5615)), level(_2096)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_5615, float2(0.0), isnan(_5615)), level(_2096)).x;
            _2112 = _2114;
        }
        float _2116 = _2112;
        float _2118 = _1978;
        if (!_2090)
        {
            float2 _5631 = float2(_1846, _1850);
            float _2120 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_5631, float2(0.0), isnan(_5631)), level(_2110)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_5631, float2(0.0), isnan(_5631)), level(_2110)).x;
            _2118 = _2120;
        }
        float _2122 = _2118;
        float _2124 = _2038;
        if (!_2022)
        {
            float2 _5647 = float2(_1454, _1848);
            float _2126 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_5647, float2(0.0), isnan(_5647)), level(_2048)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_5647, float2(0.0), isnan(_5647)), level(_2048)).x;
            _2124 = _2126;
        }
        float _2128 = _2124;
        float _2130 = _2046;
        if (!_2032)
        {
            float2 _5663 = float2(_1454, _1850);
            float _2132 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_5663, float2(0.0), isnan(_5663)), level(_2050)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_5663, float2(0.0), isnan(_5663)), level(_2050)).x;
            _2130 = _2132;
        }
        float _2134 = _2130;
        float _2136 = -_2002;
        float _2138 = _1870 + _2136;
        float _2140 = -_2044;
        float _2142 = _1870 + _2140;
        float _2144 = abs(_2138);
        float _2146 = abs(_2142);
        float _2148 = precise::max(_2144, _2146);
        float _2150 = -_2102;
        float _2152 = _1870 + _2150;
        float _2154 = -_2108;
        float _2156 = _1870 + _2154;
        float _2158 = -_2116;
        float _2160 = _1870 + _2158;
        float _2162 = -_2122;
        float _2164 = _1870 + _2162;
        float _2166 = -_2128;
        float _2168 = _1870 + _2166;
        float _2170 = -_2134;
        float _2172 = _1870 + _2170;
        float _2174 = abs(_2152);
        float _2176 = abs(_2156);
        float _2178 = precise::max(_2174, _2176);
        float _2180 = abs(_2160);
        float _2182 = abs(_2164);
        float _2184 = precise::max(_2180, _2182);
        float _2186 = abs(_2168);
        float _2188 = abs(_2172);
        float _2190 = precise::max(_2186, _2188);
        float _2192 = precise::max(_2178, _2184);
        float _2194 = precise::max(_2148, _2190);
        bool _2196 = _2192 > 0.00150000001303851604461669921875;
        bool _2198 = _2194 > 0.00150000001303851604461669921875;
        bool _2200 = _2198 || _2196;
        bool _2202 = !_2200;
        int _2204 = _2202 ? _1948 : 0;
        _1970 = _2204;
    }
    int _2206 = _1970;
    int _2208 = _168 + 8;
    uint _2210 = uint(int(uint(_190) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2210)] = uint(_2206);
    uint _2212 = uint(int(uint(_168) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2212)] = as_type<uint>(_1100);
    uint _2214 = uint(int(uint(_1966) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2214)] = as_type<uint>(_1098);
    uint _2216 = uint(int(uint(_2208) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2216)] = as_type<uint>(_1102);
    uint _2218 = uint(int(uint(_168) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_2218)] = as_type<uint>(_658);
    uint _2220 = uint(int(uint(_1966) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_2220)] = as_type<uint>(_660);
    uint _2222 = uint(int(uint(_2208) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_2222)] = as_type<uint>(_668);
    uint _2224 = uint(int(uint(_168) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_2224)] = as_type<uint>(_1952);
    uint _2226 = uint(int(uint(_1966) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_2226)] = as_type<uint>(_1956);
    uint _2228 = uint(int(uint(_2208) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_2228)] = as_type<uint>(_1960);
    float _2230 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _2232 = _1956 * _1956;
    float _2234 = _660 * _660;
    float _2236 = fma(_1952, _1952, _2232);
    float _2238 = fma(_658, _658, _2234);
    float _2240 = fma(_1960, _1960, _2236);
    float _2242 = fma(_668, _668, _2238);
    float _2244 = sqrt(_2240);
    float _2246 = sqrt(_2242);
    bool _2248 = _2244 >= 9.9999999747524270787835121154785e-07;
    bool _2250 = isnan(_2244);
    bool _2252 = _2248 || _2250;
    bool _2254 = isnan(9.9999999747524270787835121154785e-07);
    bool _2256 = _2252 || _2254;
    if (!_2256)
    {
        bool _2258 = _544 != _290;
        bool _2260 = isnan(_544);
        bool _2262 = _2258 || _2260;
        bool _2264 = isnan(_290);
        bool _2266 = _2262 || _2264;
        _2268 = _2266;
        if (!_2268)
        {
            float _2270 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
            bool _2272 = _2270 > 0.0;
            bool _2274 = !_2272;
            if (!_2274)
            {
                float _2276 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
                float _2278 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
                float _2280 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
                float _2282 = _2278 * _512;
                float _2284 = _2278 * _510;
                float _2286 = _2278 * _514;
                float _2288 = fma(_2276, _518, _2282);
                float _2290 = fma(_2276, _516, _2284);
                float _2292 = fma(_2276, _520, _2286);
                float _2294 = fma(_2280, _524, _2288);
                float _2296 = fma(_2280, _522, _2290);
                float _2298 = fma(_2280, _526, _2292);
                float _2300 = _2294 * _2294;
                float _2302 = fma(_2296, _2296, _2300);
                float _2304 = fma(_2298, _2298, _2302);
                float _2306 = rsqrt(_2304);
                float _2308 = _2306 * 9.9999999747524270787835121154785e-07;
                float _2310 = _2296 * _2308;
                float _2312 = _2294 * _2308;
                float _2314 = _2298 * _2308;
                _330 = as_type<int>(_2310);
                _332 = as_type<int>(_2312);
                _334 = as_type<int>(_2314);
                _2268 = true;
            }
            else
            {
                bool _2316 = _2246 >= 9.9999999747524270787835121154785e-07;
                bool _2318 = isnan(_2246);
                bool _2320 = _2316 || _2318;
                bool _2322 = isnan(9.9999999747524270787835121154785e-07);
                bool _2324 = _2320 || _2322;
                if (!_2324)
                {
                    float _2326 = _1098 * _1098;
                    float _2328 = fma(_1100, _1100, _2326);
                    float _2330 = fma(_1102, _1102, _2328);
                    float _2332 = sqrt(_2330);
                    bool _2334 = _2332 >= 9.9999999747524270787835121154785e-07;
                    bool _2336 = isnan(_2332);
                    bool _2338 = _2334 || _2336;
                    bool _2340 = isnan(9.9999999747524270787835121154785e-07);
                    bool _2342 = _2338 || _2340;
                    float _2344 = _2332;
                    if (_2342)
                    {
                        float _2346 = rsqrt(_2330);
                        _2344 = _2346;
                    }
                    float _2348 = _2344;
                    if (!_2342)
                    {
                        _318 = 0;
                    }
                    int _2350 = _318;
                    int _2352 = _2350;
                    if (!_2342)
                    {
                        _320 = 897988541;
                    }
                    int _2354 = _320;
                    int _2356 = _2354;
                    if (!_2342)
                    {
                        _322 = 0;
                    }
                    int _2358 = _322;
                    float _2360 = _2348;
                    int _2362 = _2358;
                    if (_2342)
                    {
                        float _2364 = _2348 * 9.9999999747524270787835121154785e-07;
                        _2360 = _2364;
                    }
                    float _2366 = _2360;
                    if (_2342)
                    {
                        float _2368 = _1100 * _2366;
                        _2352 = as_type<int>(_2368);
                    }
                    int _2370 = _2352;
                    _330 = _2370;
                    if (_2342)
                    {
                        float _2372 = _1098 * _2366;
                        _2356 = as_type<int>(_2372);
                    }
                    int _2374 = _2356;
                    _332 = _2374;
                    if (_2342)
                    {
                        float _2376 = _1102 * _2366;
                        _2362 = as_type<int>(_2376);
                    }
                    int _2378 = _2362;
                    _334 = _2378;
                    _2268 = true;
                }
                else
                {
                    float _2380 = rsqrt(_2242);
                    float _2382 = _2380 * 9.9999999747524270787835121154785e-07;
                    float _2384 = _658 * _2382;
                    float _2386 = _660 * _2382;
                    float _2388 = _668 * _2382;
                    _330 = as_type<int>(_2384);
                    _332 = as_type<int>(_2386);
                    _334 = as_type<int>(_2388);
                    _2268 = true;
                }
            }
        }
    }
    else
    {
        float _2390 = _2246 * _2230;
        bool _2392 = _2390 >= 0.001000000047497451305389404296875;
        bool _2394 = isnan(_2390);
        bool _2396 = _2392 || _2394;
        bool _2398 = isnan(0.001000000047497451305389404296875);
        bool _2400 = _2396 || _2398;
        bool _2402 = _2390 > 0.0;
        bool _2404 = !_2400;
        bool _2406 = _2402 && _2404;
        bool _2408 = _2244 < 0.001000000047497451305389404296875;
        bool _2410 = _2408 && _2406;
        if (!_2410)
        {
            _324 = as_type<int>(_1952);
        }
        int _2412 = _324;
        int _2414 = _2412;
        if (_2410)
        {
            float _2416 = _658 * _2230;
            _2414 = as_type<int>(_2416);
        }
        int _2418 = _2414;
        _330 = _2418;
        if (!_2410)
        {
            _326 = as_type<int>(_1956);
        }
        int _2420 = _326;
        int _2422 = _2420;
        if (_2410)
        {
            float _2424 = _660 * _2230;
            _2422 = as_type<int>(_2424);
        }
        int _2426 = _2422;
        _332 = _2426;
        if (!_2410)
        {
            _328 = as_type<int>(_1960);
        }
        int _2428 = _328;
        _334 = _2428;
        if (_2410)
        {
            float _2430 = _668 * _2230;
            _334 = as_type<int>(_2430);
        }
    }
    _2268 = false;
    int _2432 = _330;
    int _2434 = _332;
    int _2436 = _334;
    uint _2438 = uint(int(uint(_168) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_2438)] = uint(_2432);
    uint _2440 = uint(int(uint(_1966) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_2440)] = uint(_2434);
    uint _2442 = uint(int(uint(_2208) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_2442)] = uint(_2436);
}

