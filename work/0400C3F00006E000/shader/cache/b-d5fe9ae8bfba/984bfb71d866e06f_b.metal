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
    texture2d<float> cp_t_tcb_2A [[id(13)]];
    sampler cp_t_tcb_2ASmplr [[id(14)]];
    texture2d_array<float> cp_t_tcb_14 [[id(15)]];
    sampler cp_t_tcb_14Smplr [[id(16)]];
    texture2d_array<float> cp_t_tcb_16 [[id(17)]];
    sampler cp_t_tcb_16Smplr [[id(18)]];
    sampler cp_t_tcb_2ASmplr_w [[id(19)]];
    sampler cp_t_tcb_14Smplr_w [[id(20)]];
    constant dm_border_t* dm_border [[id(21)]];
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]])
{
    bool _3128 = false;
    bool _1332 = false;
    float _76 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[9]);
    float _78 = as_type<float>(gl_LocalInvocationID.x);
    float _80 = as_type<float>(gl_WorkGroupID.x);
    int _83 = as_type<int>(_80) << 5;
    int _85 = _83 + as_type<int>(_78);
    float _87 = trunc(_76);
    int _89 = int(_87);
    bool _93 = _85 >= _89;
    int _95 = 0;
    if (_93)
    {
        _95 = 0;
    }
    int _97 = _95;
    int _99 = _97;
    int _101 = _97;
    if (!_93)
    {
        int _103 = _85 << 4;
        int _105 = _103 + 12;
        uint _108 = uint(int(uint(_105) >> uint(2)));
        float _110 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_108)]);
        float _112 = trunc(_110);
        int _114 = int(_112);
        bool _116 = _114 >= 1;
        int _118 = _116 ? (-1) : 0;
        if (!_116)
        {
            _99 = 0;
        }
        int _120 = _99;
        bool _122 = !_116;
        _101 = _120;
        if (!_122)
        {
            float _124 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
            uint _126 = uint(int(uint(_105) >> uint(2)));
            float _128 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_126)]);
            float _130 = float(_114);
            float _132 = -_128;
            float _134 = _124 + _132;
            bool _136 = _134 > _130;
            int _138 = as_type<int>(_124);
            if (!_136)
            {
                bool _140 = _124 >= _128;
                bool _142 = isnan(_124);
                bool _144 = _140 || _142;
                bool _146 = isnan(_128);
                bool _148 = _144 || _146;
                _118 = _148 ? (-1) : 0;
            }
            int _150 = _118;
            if (_136)
            {
                _138 = 0;
            }
            int _152 = _138;
            _101 = _152;
            if (!_136)
            {
                int _154 = ~_150;
                int _156 = (_154 != 0) ? 0 : 1;
                _101 = _156;
            }
        }
    }
    int _158 = _101;
    int _160 = _158 & 1;
    bool _162 = _160 != 0;
    if (!_162)
    {
        return;
    }
    float _164 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[30]);
    int _166 = _85 << 4;
    uint _168 = uint(int(uint(_166) >> uint(2)));
    float _170 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_168)]);
    int _172 = _166 + 4;
    uint _174 = uint(int(uint(_172) >> uint(2)));
    float _176 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_174)]);
    int _178 = _166 + 8;
    uint _180 = uint(int(uint(_178) >> uint(2)));
    float _182 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_180)]);
    int _184 = as_type<int>(_164) & 512;
    bool _186 = _184 != 0;
    int _188 = _166 + 12;
    uint _190 = uint(int(uint(_166) >> uint(2)));
    float _192 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_190)]);
    int _194 = _166 + 4;
    uint _196 = uint(int(uint(_194) >> uint(2)));
    float _198 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_196)]);
    int _200 = _166 + 8;
    uint _202 = uint(int(uint(_200) >> uint(2)));
    float _204 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_202)]);
    uint _206 = uint(int(uint(_166) >> uint(2)));
    float _208 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_206)]);
    int _210 = _166 + 4;
    uint _212 = uint(int(uint(_210) >> uint(2)));
    float _214 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_212)]);
    int _216 = _166 + 8;
    uint _218 = uint(int(uint(_216) >> uint(2)));
    float _220 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_218)]);
    float _222 = 0.0;
    float _224 = 0.0;
    float _226 = 0.0;
    if (_186)
    {
        float _228 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[32]);
        float _230 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[33]);
        float _232 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[34]);
        _222 = _228;
        _224 = _230;
        _226 = _232;
    }
    float _234 = _222;
    float _236 = _224;
    float _238 = _226;
    float _240 = 0.0;
    float _242 = 0.0;
    float _244 = 0.0;
    if (_186)
    {
        float _246 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[36]);
        float _248 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[37]);
        float _250 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[38]);
        _240 = _246;
        _242 = _248;
        _244 = _250;
    }
    float _252 = _240;
    float _254 = _242;
    float _256 = _244;
    float _258 = 0.0;
    float _260 = 0.0;
    float _262 = 0.0;
    if (_186)
    {
        float _264 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[40]);
        float _266 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[41]);
        float _268 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[42]);
        _258 = _264;
        _260 = _266;
        _262 = _268;
    }
    float _270 = _258;
    float _272 = _260;
    float _274 = _262;
    uint _276 = uint(int(uint(_188) >> uint(2)));
    float _278 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_276)]);
    uint _280 = uint(int(uint(_188) >> uint(2)));
    float _282 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_280)]);
    float _284 = _252;
    float _286 = _254;
    float _288 = _256;
    float _290 = _236;
    float _292 = _234;
    float _294 = _238;
    float _296 = _272;
    float _298 = _270;
    float _300 = _274;
    float _302 = _192;
    float _304 = _198;
    float _306 = _204;
    int _308 = as_type<int>(_170);
    int _310 = as_type<int>(_208);
    int _312 = as_type<int>(_214);
    int _314 = as_type<int>(_220);
    int _316 = as_type<int>(_208);
    int _318 = as_type<int>(_214);
    int _320 = as_type<int>(_220);
    int _322 = as_type<int>(_208);
    int _324 = as_type<int>(_214);
    int _326 = as_type<int>(_220);
    if (!_186)
    {
        int _328 = _166 + 4;
        uint _330 = uint(int(uint(_166) >> uint(2)));
        float _332 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_330)]);
        int _334 = _166 + 8;
        uint _336 = uint(int(uint(_166) >> uint(2)));
        float _338 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_336)]);
        uint _340 = uint(int(uint(_328) >> uint(2)));
        float _342 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_340)]);
        uint _344 = uint(int(uint(_334) >> uint(2)));
        float _346 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_344)]);
        uint _348 = uint(int(uint(_328) >> uint(2)));
        float _350 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_348)]);
        uint _352 = uint(int(uint(_166) >> uint(2)));
        float _354 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_352)]);
        uint _356 = uint(int(uint(_334) >> uint(2)));
        float _358 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_356)]);
        uint _360 = uint(int(uint(_328) >> uint(2)));
        float _362 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_360)]);
        uint _364 = uint(int(uint(_334) >> uint(2)));
        float _366 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_364)]);
        float _368 = _332 * _332;
        float _370 = fma(_338, _338, _368);
        float _372 = _342 * _342;
        float _374 = _346 * _346;
        float _376 = fma(_350, _350, _372);
        float _378 = fma(_354, _354, _370);
        float _380 = fma(_358, _358, _374);
        float _382 = fma(_362, _362, _376);
        float _384 = sqrt(_378);
        float _386 = fma(_366, _366, _380);
        float _388 = sqrt(_382);
        float _390 = sqrt(_386);
        bool _392 = _384 > 0.0;
        bool _394 = _388 > 0.0;
        bool _396 = _390 > 0.0;
        float _398 = _374;
        float _400 = _376;
        float _402 = _380;
        float _404 = _384;
        float _406 = _388;
        float _408 = _390;
        float _410 = _378;
        float _412 = _342;
        float _414 = _354;
        float _416 = _382;
        if (_392)
        {
            float _418 = rsqrt(_378);
            _398 = _418;
        }
        float _420 = _398;
        float _422 = 0.0;
        if (_394)
        {
            float _424 = rsqrt(_382);
            _422 = _424;
        }
        float _426 = _422;
        float _428 = 0.0;
        if (_396)
        {
            float _430 = rsqrt(_386);
            _428 = _430;
        }
        float _432 = _428;
        if (!_392)
        {
            _400 = 0.0;
        }
        float _434 = _400;
        float _436 = _434;
        if (_392)
        {
            float _438 = _354 * _420;
            _436 = _438;
        }
        float _440 = _436;
        _298 = _440;
        if (!_394)
        {
            _402 = 0.0;
        }
        float _442 = _402;
        float _444 = _442;
        if (!_392)
        {
            _404 = 0.0;
        }
        float _446 = _404;
        float _448 = _446;
        if (_392)
        {
            float _450 = _332 * _420;
            _448 = _450;
        }
        float _452 = _448;
        _284 = _452;
        if (!_392)
        {
            _406 = 0.0;
        }
        float _454 = _406;
        float _456 = _454;
        if (_394)
        {
            float _458 = _342 * _426;
            _444 = _458;
        }
        float _460 = _444;
        _286 = _460;
        if (!_394)
        {
            _408 = 0.0;
        }
        float _462 = _408;
        float _464 = _462;
        if (_392)
        {
            float _466 = _338 * _420;
            _456 = _466;
        }
        float _468 = _456;
        _292 = _468;
        if (!_394)
        {
            _410 = 0.0;
        }
        float _470 = _410;
        float _472 = _470;
        if (_394)
        {
            float _474 = _350 * _426;
            _464 = _474;
        }
        float _476 = _464;
        _290 = _476;
        if (!_396)
        {
            _412 = 0.0;
        }
        float _478 = _412;
        float _480 = _478;
        if (_394)
        {
            float _482 = _362 * _426;
            _472 = _482;
        }
        float _484 = _472;
        _296 = _484;
        if (!_396)
        {
            _414 = 0.0;
        }
        float _486 = _414;
        float _488 = _486;
        if (_396)
        {
            float _490 = _346 * _432;
            _480 = _490;
        }
        float _492 = _480;
        _288 = _492;
        if (!_396)
        {
            _416 = 0.0;
        }
        float _494 = _416;
        _300 = _494;
        if (_396)
        {
            float _496 = _358 * _432;
            _488 = _496;
        }
        float _498 = _488;
        _294 = _498;
        if (_396)
        {
            float _500 = _366 * _432;
            _300 = _500;
        }
    }
    float _502 = _284;
    float _504 = _286;
    float _506 = _288;
    float _508 = _290;
    float _510 = _292;
    float _512 = _294;
    float _514 = _296;
    float _516 = _298;
    float _518 = _300;
    float _520 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[68]);
    float _522 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[45]);
    float _524 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
    float _526 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
    float _528 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
    float _530 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
    float _532 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
    float _534 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    bool _536 = _522 > 0.0;
    float _538 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
    float _540 = 0.0;
    if (_536)
    {
        float _542 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[52]);
        _540 = _542;
    }
    float _544 = _540;
    float _546 = abs(_520);
    float _548 = log2(_546);
    float _550 = _526 * _532;
    float _552 = _524 * _532;
    float _554 = _550 * _502;
    float _556 = _550 * _504;
    float _558 = _550 * _506;
    float _560 = _528 * _532;
    float _562 = _534 * _548;
    float _564 = exp2(_562);
    float _566 = fma(_552, _508, _556);
    float _568 = fma(_552, _510, _554);
    float _570 = fma(_552, _512, _558);
    float _572 = fma(_560, _514, _566);
    float _574 = fma(_560, _516, _568);
    float _576 = fma(_560, _518, _570);
    float _578 = _534 * _572;
    float _580 = _534 * _574;
    float _582 = _282 * _534;
    float _584 = _534 * _576;
    float _586 = fma(_198, _582, _176);
    float _588 = fma(_198, _564, _578);
    float _590 = fma(_192, _564, _580);
    float _592 = fma(_192, _582, _170);
    float _594 = fma(_204, _582, _182);
    float _596 = fma(_204, _564, _584);
    bool _598 = _544 == 0.0;
    bool _600 = _544 == 0.0;
    bool _602 = _600 && _536;
    float _604 = -_278;
    float _606 = _538 + _604;
    float _608 = 0.0;
    float _610 = _576;
    float _612 = _528;
    float _614 = _530;
    float _616 = _544;
    float _618 = _582;
    float _620 = _544;
    float _622 = _584;
    float _624 = _576;
    float _626 = _528;
    float _628 = _530;
    float _630 = _592;
    if (_602)
    {
        _608 = 0.0;
    }
    float _632 = _608;
    float _634 = 0.0;
    float _636 = _632;
    float _638 = _632;
    if (_602)
    {
        _634 = 0.0;
    }
    float _640 = _634;
    float _642 = 0.0;
    float _644 = _640;
    if (_602)
    {
        _642 = 0.0;
    }
    float _646 = _642;
    bool _648 = _536 && _598;
    float _650 = 0.0;
    float _652 = 0.0;
    float _654 = 0.0;
    float _656 = _646;
    float _658 = 0.0;
    float _660 = 0.0;
    if (!_648)
    {
        float _662 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[44]);
        float _664 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[40]);
        float _666 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[41]);
        float _668 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[42]);
        float _670 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[43]);
        bool _672 = _544 > 0.0;
        bool _674 = _672 && _536;
        float _676 = trunc(_662);
        int _678 = int(_676);
        bool _680 = _678 > 0;
        if (!_680)
        {
            _636 = 0.0;
        }
        float _682 = _636;
        float _684 = 0.0;
        float _686 = 0.0;
        float _688 = _682;
        float _690 = _682;
        if (!_680)
        {
            _684 = 0.0;
            _686 = 0.0;
        }
        float _692 = _684;
        float _694 = _686;
        bool _696 = !_680;
        float _698 = _692;
        float _700 = _694;
        float _702 = _670;
        float _704 = 0.0;
        float _706 = 0.0;
        float _708 = 0.0;
        float _710 = 0.0;
        float _712 = 0.0;
        float _714 = _692;
        float _716 = _694;
        float _718 = _668;
        float _720 = _664;
        float _722 = _666;
        if (!_696)
        {
            int _724 = as_type<int>(_164) & 2048;
            bool _726 = _724 != 0;
            if (!_726)
            {
                _688 = 0.0;
            }
            float _728 = _688;
            _690 = _728;
            if (!_726)
            {
                _698 = 0.0;
                _700 = 0.0;
            }
            float _730 = _698;
            float _732 = _700;
            bool _734 = !_726;
            _704 = 0.0;
            _706 = 0.0;
            _708 = 0.0;
            _710 = 0.0;
            _712 = 0.0;
            _714 = _730;
            _716 = _732;
            if (!_734)
            {
                float _736 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
                uint _738 = uint(int(uint(_166) >> uint(2)));
                float _740 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_738)]);
                int _742 = _166 + 4;
                uint _744 = uint(int(uint(_742) >> uint(2)));
                float _746 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_744)]);
                int _748 = _166 + 8;
                uint _750 = uint(int(uint(_748) >> uint(2)));
                float _752 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_750)]);
                int _754 = _166 + 12;
                uint _756 = uint(int(uint(_754) >> uint(2)));
                float _758 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_756)]);
                uint _760 = uint(int(uint(_166) >> uint(2)));
                float _762 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_760)]);
                int _764 = _166 + 4;
                uint _766 = uint(int(uint(_764) >> uint(2)));
                float _768 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_766)]);
                int _770 = _166 + 8;
                uint _772 = uint(int(uint(_770) >> uint(2)));
                float _774 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_772)]);
                int _776 = _166 + 12;
                uint _778 = uint(int(uint(_776) >> uint(2)));
                float _780 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_778)]);
                uint _782 = uint(int(uint(_166) >> uint(2)));
                float _784 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_782)]);
                int _786 = _166 + 4;
                uint _788 = uint(int(uint(_786) >> uint(2)));
                float _790 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_788)]);
                int _792 = _166 + 8;
                uint _794 = uint(int(uint(_792) >> uint(2)));
                float _796 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_794)]);
                int _798 = _166 + 12;
                uint _800 = uint(int(uint(_798) >> uint(2)));
                float _802 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_800)]);
                float _804 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
                float _806 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
                float _808 = _752 * _762;
                float _810 = _752 * _768;
                float _812 = -_808;
                float _814 = fma(_740, _774, _812);
                float _816 = _758 * _774;
                float _818 = _758 * _768;
                float _820 = _758 * _762;
                float _822 = _746 * _762;
                float _824 = -_810;
                float _826 = fma(_746, _774, _824);
                float _828 = _790 * _814;
                float _830 = -_822;
                float _832 = fma(_740, _768, _830);
                float _834 = -_828;
                float _836 = fma(_784, _826, _834);
                float _838 = fma(_796, _832, _836);
                float _840 = _790 * _774;
                float _842 = -_818;
                float _844 = fma(_746, _780, _842);
                float _846 = 1.0 / _838;
                float _848 = -_820;
                float _850 = fma(_740, _780, _848);
                float _852 = -_840;
                float _854 = fma(_796, _768, _852);
                float _856 = _784 * _768;
                float _858 = _796 * _746;
                float _860 = _784 * _752;
                float _862 = -_816;
                float _864 = fma(_752, _780, _862);
                float _866 = _796 * _850;
                float _868 = _796 * _762;
                float _870 = -_858;
                float _872 = fma(_790, _752, _870);
                float _874 = -_740;
                float _876 = fma(_874, _774, _808);
                float _878 = -_860;
                float _880 = fma(_796, _740, _878);
                float _882 = _790 * _740;
                float _884 = _790 * _850;
                float _886 = -_866;
                float _888 = fma(_784, _864, _886);
                float _890 = -_868;
                float _892 = fma(_784, _774, _890);
                float _894 = -_856;
                float _896 = fma(_790, _762, _894);
                float _898 = -_882;
                float _900 = fma(_784, _746, _898);
                float _902 = -_884;
                float _904 = fma(_784, _844, _902);
                float _906 = fma(_802, _814, _888);
                float _908 = _796 * _844;
                float _910 = _892 * _846;
                float _912 = _854 * _846;
                float _914 = _896 * _846;
                float _916 = -_908;
                float _918 = fma(_790, _864, _916);
                float _920 = _736 * _910;
                float _922 = _736 * _912;
                float _924 = _876 * _846;
                float _926 = _804 * _846;
                float _928 = _736 * _914;
                float _930 = _872 * _846;
                float _932 = fma(_804, _924, _920);
                float _934 = fma(_826, _926, _922);
                float _936 = fma(_832, _926, _928);
                float _938 = _880 * _846;
                float _940 = _900 * _846;
                float _942 = fma(_802, _826, _918);
                float _944 = fma(_802, _832, _904);
                float _946 = fma(_806, _930, _934);
                float _948 = fma(_806, _938, _932);
                float _950 = fma(_806, _940, _936);
                float _952 = -_942;
                float _954 = fma(_952, _846, _946);
                float _956 = fma(_906, _846, _948);
                float _958 = -_944;
                float _960 = fma(_958, _846, _950);
                _702 = _804;
                _704 = _876;
                _706 = _844;
                _610 = _950;
                _612 = _932;
                _614 = _946;
                _616 = _920;
                _708 = _926;
                _710 = _942;
                _712 = _802;
                _714 = _960;
                _690 = _954;
                _716 = _956;
            }
        }
        float _962 = _702;
        float _964 = _704;
        float _966 = _706;
        float _968 = _610;
        float _970 = _612;
        float _972 = _614;
        float _974 = _616;
        float _976 = _708;
        float _978 = _710;
        float _980 = _712;
        float _982 = _714;
        float _984 = _690;
        float _986 = _716;
        bool _988 = !_674;
        float _990 = _962;
        float _992 = _974;
        float _994 = _976;
        float _996 = _978;
        float _998 = _980;
        float _1000 = _968;
        float _1002 = _970;
        float _1004 = _972;
        float _1006 = _964;
        float _1008 = _966;
        if (!_988)
        {
            float _1010 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[48]);
            float _1012 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[49]);
            float _1014 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[50]);
            float _1016 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[51]);
            bool _1018 = !_186;
            _718 = _1014;
            _720 = _1010;
            _722 = _1012;
            _990 = _1016;
            if (!_1018)
            {
                float _1020 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
                float _1022 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
                float _1024 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
                float _1026 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
                float _1028 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[28]);
                float _1030 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[29]);
                float _1032 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[30]);
                float _1034 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[31]);
                float _1036 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
                float _1038 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
                float _1040 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
                float _1042 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
                float _1044 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
                float _1046 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
                float _1048 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
                float _1050 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
                float _1052 = _1026 * _1030;
                float _1054 = _1026 * _1032;
                float _1056 = _1026 * _1028;
                float _1058 = _1042 * _1024;
                float _1060 = _1042 * _1022;
                float _1062 = _1042 * _1020;
                float _1064 = _1042 * _1032;
                float _1066 = _1042 * _1030;
                float _1068 = _1042 * _1028;
                float _1070 = -_1052;
                float _1072 = fma(_1022, _1034, _1070);
                float _1074 = -_1058;
                float _1076 = fma(_1040, _1026, _1074);
                float _1078 = -_1060;
                float _1080 = fma(_1038, _1026, _1078);
                float _1082 = -_1062;
                float _1084 = fma(_1036, _1026, _1082);
                float _1086 = _1024 * _1030;
                float _1088 = _1024 * _1028;
                float _1090 = _1040 * _1030;
                float _1092 = _1040 * _1028;
                float _1094 = -_1054;
                float _1096 = fma(_1024, _1034, _1094);
                float _1098 = -_1056;
                float _1100 = fma(_1020, _1034, _1098);
                float _1102 = -_1064;
                float _1104 = fma(_1040, _1034, _1102);
                float _1106 = -_1066;
                float _1108 = fma(_1038, _1034, _1106);
                float _1110 = -_1068;
                float _1112 = fma(_1036, _1034, _1110);
                float _1114 = _1022 * _1028;
                float _1116 = -_1086;
                float _1118 = fma(_1022, _1032, _1116);
                float _1120 = -_1088;
                float _1122 = fma(_1020, _1032, _1120);
                float _1124 = -_1090;
                float _1126 = fma(_1038, _1032, _1124);
                float _1128 = -_1092;
                float _1130 = fma(_1036, _1032, _1128);
                float _1132 = _1040 * _1022;
                float _1134 = _1040 * _1020;
                float _1136 = -_1114;
                float _1138 = fma(_1020, _1030, _1136);
                float _1140 = _1038 * _1020;
                float _1142 = -_1132;
                float _1144 = fma(_1038, _1024, _1142);
                float _1146 = -_1134;
                float _1148 = fma(_1036, _1024, _1146);
                float _1150 = _1040 * _1100;
                float _1152 = -_1140;
                float _1154 = fma(_1036, _1022, _1152);
                float _1156 = _1040 * _1072;
                float _1158 = _1038 * _1028;
                float _1160 = -_1150;
                float _1162 = fma(_1036, _1096, _1160);
                float _1164 = _1038 * _1100;
                float _1166 = -_1156;
                float _1168 = fma(_1038, _1096, _1166);
                float _1170 = -_1158;
                float _1172 = fma(_1036, _1030, _1170);
                float _1174 = fma(_1042, _1122, _1162);
                float _1176 = _1038 * _1122;
                float _1178 = -_1164;
                float _1180 = fma(_1036, _1072, _1178);
                float _1182 = fma(_1042, _1118, _1168);
                float _1184 = _1046 * _1174;
                float _1186 = -_1176;
                float _1188 = fma(_1036, _1118, _1186);
                float _1190 = _1048 * _1072;
                float _1192 = fma(_1042, _1138, _1180);
                float _1194 = -_1184;
                float _1196 = fma(_1044, _1182, _1194);
                float _1198 = fma(_1040, _1138, _1188);
                float _1200 = -_1190;
                float _1202 = fma(_1046, _1096, _1200);
                float _1204 = _1048 * _1100;
                float _1206 = fma(_1048, _1192, _1196);
                float _1208 = _1046 * _1100;
                float _1210 = _1048 * _1080;
                float _1212 = -_1204;
                float _1214 = fma(_1044, _1096, _1212);
                float _1216 = -_1050;
                float _1218 = fma(_1216, _1198, _1206);
                float _1220 = _1048 * _1112;
                float _1222 = -_1208;
                float _1224 = fma(_1044, _1072, _1222);
                float _1226 = _1048 * _1108;
                float _1228 = 1.0 / _1218;
                float _1230 = -_1220;
                float _1232 = fma(_1044, _1104, _1230);
                float _1234 = _1048 * _1084;
                float _1236 = fma(_1050, _1118, _1202);
                float _1238 = _1046 * _1112;
                float _1240 = -_1210;
                float _1242 = fma(_1046, _1076, _1240);
                float _1244 = fma(_1050, _1138, _1224);
                float _1246 = _1046 * _1084;
                float _1248 = -_1234;
                float _1250 = fma(_1044, _1076, _1248);
                float _1252 = fma(_1050, _1122, _1214);
                float _1254 = -_1226;
                float _1256 = fma(_1046, _1104, _1254);
                float _1258 = -_1238;
                float _1260 = fma(_1044, _1108, _1258);
                float _1262 = -_1246;
                float _1264 = fma(_1044, _1080, _1262);
                float _1266 = fma(_1050, _1130, _1232);
                float _1268 = fma(_1050, _1126, _1256);
                float _1270 = fma(_1050, _1172, _1260);
                float _1272 = _1174 * _1228;
                float _1274 = _1236 * _1228;
                float _1276 = _1244 * _1228;
                float _1278 = _1252 * _1228;
                float _1280 = _1010 * _1272;
                float _1282 = _1182 * _1228;
                float _1284 = _1012 * _1274;
                float _1286 = _1192 * _1228;
                float _1288 = _1012 * _1276;
                float _1290 = -_1280;
                float _1292 = fma(_1012, _1278, _1290);
                float _1294 = -_1284;
                float _1296 = fma(_1010, _1282, _1294);
                float _1298 = _1268 * _1228;
                float _1300 = -_1288;
                float _1302 = fma(_1010, _1286, _1300);
                float _1304 = _1266 * _1228;
                float _1306 = _1270 * _1228;
                float _1308 = fma(_1050, _1144, _1242);
                float _1310 = fma(_1014, _1298, _1296);
                float _1312 = fma(_1050, _1148, _1250);
                float _1314 = fma(_1050, _1154, _1264);
                float _1316 = -_1304;
                float _1318 = fma(_1014, _1316, _1292);
                float _1320 = fma(_1014, _1306, _1302);
                float _1322 = -_1308;
                float _1324 = fma(_1322, _1228, _1310);
                float _1326 = fma(_1312, _1228, _1318);
                float _1328 = -_1314;
                float _1330 = fma(_1328, _1228, _1320);
                _718 = _1330;
                _720 = _1324;
                _722 = _1326;
                _990 = _1318;
                _992 = _1280;
                _994 = _1296;
                _996 = _1270;
                _998 = _1050;
                _1000 = _1320;
                _1002 = _1274;
                _1004 = _1286;
                _1006 = _1172;
                _1008 = _1138;
                _1332 = true;
            }
            else
            {
                int _1334 = as_type<int>(_164) & 1024;
                bool _1336 = _1334 != 0;
                bool _1338 = !_1336;
                if (!_1338)
                {
                    float _1340 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
                    uint _1342 = uint(int(uint(_166) >> uint(2)));
                    float _1344 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_1342)]);
                    int _1346 = _166 + 4;
                    uint _1348 = uint(int(uint(_1346) >> uint(2)));
                    float _1350 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_1348)]);
                    int _1352 = _166 + 8;
                    uint _1354 = uint(int(uint(_1352) >> uint(2)));
                    float _1356 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_1354)]);
                    uint _1358 = uint(int(uint(_166) >> uint(2)));
                    float _1360 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1358)]);
                    int _1362 = _166 + 4;
                    uint _1364 = uint(int(uint(_1362) >> uint(2)));
                    float _1366 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1364)]);
                    int _1368 = _166 + 8;
                    uint _1370 = uint(int(uint(_1368) >> uint(2)));
                    float _1372 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1370)]);
                    uint _1374 = uint(int(uint(_166) >> uint(2)));
                    float _1376 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1374)]);
                    int _1378 = _166 + 4;
                    uint _1380 = uint(int(uint(_1378) >> uint(2)));
                    float _1382 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1380)]);
                    int _1384 = _166 + 8;
                    uint _1386 = uint(int(uint(_1384) >> uint(2)));
                    float _1388 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1386)]);
                    float _1390 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
                    float _1392 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
                    float _1394 = _1356 * _1360;
                    float _1396 = _1356 * _1366;
                    float _1398 = -_1394;
                    float _1400 = fma(_1344, _1372, _1398);
                    float _1402 = _1350 * _1360;
                    float _1404 = -_1396;
                    float _1406 = fma(_1350, _1372, _1404);
                    float _1408 = _1382 * _1400;
                    float _1410 = -_1402;
                    float _1412 = fma(_1344, _1366, _1410);
                    float _1414 = -_1408;
                    float _1416 = fma(_1376, _1406, _1414);
                    float _1418 = _1340 * _1372;
                    float _1420 = _1340 * _1366;
                    float _1422 = _1340 * _1360;
                    float _1424 = fma(_1388, _1412, _1416);
                    float _1426 = 1.0 / _1424;
                    float _1428 = _1388 * _1360;
                    float _1430 = _1382 * _1372;
                    float _1432 = -_1420;
                    float _1434 = fma(_1390, _1350, _1432);
                    float _1436 = -_1344;
                    float _1438 = fma(_1436, _1372, _1394);
                    float _1440 = _1376 * _1366;
                    float _1442 = -_1418;
                    float _1444 = fma(_1390, _1356, _1442);
                    float _1446 = -_1422;
                    float _1448 = fma(_1390, _1344, _1446);
                    float _1450 = _1376 * _1356;
                    float _1452 = -_1428;
                    float _1454 = fma(_1376, _1372, _1452);
                    float _1456 = -_1430;
                    float _1458 = fma(_1388, _1366, _1456);
                    float _1460 = _1382 * _1344;
                    float _1462 = -_1440;
                    float _1464 = fma(_1382, _1360, _1462);
                    float _1466 = -_1450;
                    float _1468 = fma(_1388, _1344, _1466);
                    float _1470 = _1388 * _1350;
                    float _1472 = _1388 * _1434;
                    float _1474 = _1458 * _1426;
                    float _1476 = _1454 * _1426;
                    float _1478 = -_1460;
                    float _1480 = fma(_1376, _1350, _1478);
                    float _1482 = _1464 * _1426;
                    float _1484 = _1388 * _1448;
                    float _1486 = -_1470;
                    float _1488 = fma(_1382, _1356, _1486);
                    float _1490 = _1382 * _1448;
                    float _1492 = -_1472;
                    float _1494 = fma(_1382, _1444, _1492);
                    float _1496 = _1474 * _1012;
                    float _1498 = _1476 * _1012;
                    float _1500 = _1482 * _1012;
                    float _1502 = _1438 * _1426;
                    float _1504 = _1406 * _1426;
                    float _1506 = _1412 * _1426;
                    float _1508 = -_1484;
                    float _1510 = fma(_1376, _1444, _1508);
                    float _1512 = fma(_1502, _1010, _1498);
                    float _1514 = fma(_1010, _1504, _1496);
                    float _1516 = fma(_1010, _1506, _1500);
                    float _1518 = _1468 * _1426;
                    float _1520 = _1488 * _1426;
                    float _1522 = _1480 * _1426;
                    float _1524 = -_1490;
                    float _1526 = fma(_1376, _1434, _1524);
                    float _1528 = fma(_1518, _1014, _1512);
                    float _1530 = fma(_1520, _1014, _1514);
                    float _1532 = fma(_1392, _1400, _1510);
                    float _1534 = fma(_1522, _1014, _1516);
                    float _1536 = fma(_1392, _1406, _1494);
                    float _1538 = fma(_1392, _1412, _1526);
                    float _1540 = fma(_1532, _1426, _1528);
                    float _1542 = -_1536;
                    float _1544 = fma(_1542, _1426, _1530);
                    float _1546 = -_1538;
                    float _1548 = fma(_1546, _1426, _1534);
                    _718 = _1548;
                    _720 = _1544;
                    _722 = _1540;
                    _990 = _1444;
                    _992 = _1536;
                    _994 = _1532;
                    _996 = _1506;
                    _998 = _1538;
                    _1000 = _1530;
                    _1002 = _1504;
                    _1004 = _1434;
                    _1006 = _1426;
                    _1008 = _1450;
                    _1332 = true;
                }
                else
                {
                    int _1550 = as_type<int>(_164) & 2048;
                    bool _1552 = _1550 != 0;
                    bool _1554 = !_1552;
                    if (!_1554)
                    {
                        uint _1556 = uint(int(uint(_166) >> uint(2)));
                        float _1558 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_1556)]);
                        int _1560 = _166 + 4;
                        uint _1562 = uint(int(uint(_1560) >> uint(2)));
                        float _1564 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_1562)]);
                        int _1566 = _166 + 8;
                        uint _1568 = uint(int(uint(_1566) >> uint(2)));
                        float _1570 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_1568)]);
                        int _1572 = _166 + 12;
                        uint _1574 = uint(int(uint(_1572) >> uint(2)));
                        float _1576 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_1574)]);
                        uint _1578 = uint(int(uint(_166) >> uint(2)));
                        float _1580 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1578)]);
                        int _1582 = _166 + 4;
                        uint _1584 = uint(int(uint(_1582) >> uint(2)));
                        float _1586 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1584)]);
                        int _1588 = _166 + 8;
                        uint _1590 = uint(int(uint(_1588) >> uint(2)));
                        float _1592 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1590)]);
                        int _1594 = _166 + 12;
                        uint _1596 = uint(int(uint(_1594) >> uint(2)));
                        float _1598 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1596)]);
                        uint _1600 = uint(int(uint(_166) >> uint(2)));
                        float _1602 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1600)]);
                        int _1604 = _166 + 4;
                        uint _1606 = uint(int(uint(_1604) >> uint(2)));
                        float _1608 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1606)]);
                        int _1610 = _166 + 8;
                        uint _1612 = uint(int(uint(_1610) >> uint(2)));
                        float _1614 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1612)]);
                        int _1616 = _166 + 12;
                        uint _1618 = uint(int(uint(_1616) >> uint(2)));
                        float _1620 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1618)]);
                        float _1622 = _1570 * _1580;
                        float _1624 = _1570 * _1586;
                        float _1626 = _1564 * _1580;
                        float _1628 = _1576 * _1586;
                        float _1630 = -_1622;
                        float _1632 = fma(_1558, _1592, _1630);
                        float _1634 = -_1624;
                        float _1636 = fma(_1564, _1592, _1634);
                        float _1638 = -_1626;
                        float _1640 = fma(_1558, _1586, _1638);
                        float _1642 = _1608 * _1592;
                        float _1644 = _1608 * _1632;
                        float _1646 = _1602 * _1586;
                        float _1648 = _1576 * _1592;
                        float _1650 = -_1642;
                        float _1652 = fma(_1614, _1586, _1650);
                        float _1654 = -_1644;
                        float _1656 = fma(_1602, _1636, _1654);
                        float _1658 = _1614 * _1580;
                        float _1660 = _1576 * _1580;
                        float _1662 = -_1628;
                        float _1664 = fma(_1564, _1598, _1662);
                        float _1666 = fma(_1614, _1640, _1656);
                        float _1668 = -_1558;
                        float _1670 = fma(_1668, _1592, _1622);
                        float _1672 = -_1658;
                        float _1674 = fma(_1602, _1592, _1672);
                        float _1676 = -_1646;
                        float _1678 = fma(_1608, _1580, _1676);
                        float _1680 = -_1648;
                        float _1682 = fma(_1570, _1598, _1680);
                        float _1684 = -_1660;
                        float _1686 = fma(_1558, _1598, _1684);
                        float _1688 = 1.0 / _1666;
                        float _1690 = _1602 * _1570;
                        float _1692 = _1614 * _1564;
                        float _1694 = _1608 * _1558;
                        float _1696 = _1608 * _1686;
                        float _1698 = -_1690;
                        float _1700 = fma(_1614, _1558, _1698);
                        float _1702 = -_1692;
                        float _1704 = fma(_1608, _1570, _1702);
                        float _1706 = _1614 * _1664;
                        float _1708 = -_1694;
                        float _1710 = fma(_1602, _1564, _1708);
                        float _1712 = _1614 * _1686;
                        float _1714 = -_1696;
                        float _1716 = fma(_1602, _1664, _1714);
                        float _1718 = -_1706;
                        float _1720 = fma(_1608, _1682, _1718);
                        float _1722 = -_1712;
                        float _1724 = fma(_1602, _1682, _1722);
                        float _1726 = fma(_1620, _1640, _1716);
                        float _1728 = fma(_1620, _1636, _1720);
                        float _1730 = _1652 * _1688;
                        float _1732 = _1674 * _1688;
                        float _1734 = _1678 * _1688;
                        float _1736 = _1670 * _1688;
                        float _1738 = _1730 * _1012;
                        float _1740 = _1732 * _1012;
                        float _1742 = _1734 * _1012;
                        float _1744 = _1636 * _1688;
                        float _1746 = _1640 * _1688;
                        float _1748 = fma(_1736, _1010, _1740);
                        float _1750 = _1700 * _1688;
                        float _1752 = fma(_1010, _1744, _1738);
                        float _1754 = fma(_1010, _1746, _1742);
                        float _1756 = _1704 * _1688;
                        float _1758 = _1710 * _1688;
                        float _1760 = fma(_1750, _1014, _1748);
                        float _1762 = fma(_1620, _1632, _1724);
                        float _1764 = fma(_1756, _1014, _1752);
                        float _1766 = fma(_1758, _1014, _1754);
                        float _1768 = fma(_1762, _1688, _1760);
                        float _1770 = -_1728;
                        float _1772 = fma(_1770, _1688, _1764);
                        float _1774 = -_1726;
                        float _1776 = fma(_1774, _1688, _1766);
                        _718 = _1776;
                        _720 = _1772;
                        _722 = _1768;
                        _990 = _1764;
                        _992 = _1752;
                        _994 = _1608;
                        _996 = _1762;
                        _998 = _1620;
                        _1000 = _1766;
                        _1002 = _1704;
                        _1004 = _1760;
                        _1006 = _1688;
                        _1008 = _1664;
                    }
                }
            }
        }
        _1332 = false;
        float _1778 = _718;
        float _1780 = _720;
        float _1782 = _722;
        float _1784 = _990;
        float _1786 = _992;
        float _1788 = _994;
        float _1790 = _996;
        float _1792 = _998;
        float _1794 = _1000;
        float _1796 = _1002;
        float _1798 = _1004;
        float _1800 = _1006;
        float _1802 = _1008;
        float _1804 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[43]);
        float _1806 = _982 + _1778;
        float _1808 = _984 + _1780;
        float _1810 = _986 + _1782;
        float _1812 = -_594;
        float _1814 = _1806 + _1812;
        float _1816 = -_592;
        float _1818 = _1808 + _1816;
        float _1820 = -_586;
        float _1822 = _1810 + _1820;
        float _1824 = _282 * _1804;
        float _1826 = _534 * _1824;
        float _1828 = _1814 * _1824;
        float _1830 = _1818 * _1826;
        float _1832 = _1822 * _1826;
        float _1834 = _534 * _1828;
        _302 = _1780;
        _304 = _1782;
        _306 = _1814;
        _618 = _1784;
        _620 = _1786;
        _650 = _1788;
        _652 = _1790;
        _654 = _1792;
        _622 = _1804;
        _624 = _1794;
        _626 = _1796;
        _628 = _1798;
        _644 = _1832;
        _638 = _1830;
        _656 = _1834;
        _658 = _1800;
        _660 = _1802;
    }
    float _1836 = _302;
    float _1838 = _304;
    float _1840 = _306;
    float _1842 = _618;
    float _1844 = _620;
    float _1846 = _650;
    float _1848 = _652;
    float _1850 = _654;
    float _1852 = _622;
    float _1854 = _624;
    float _1856 = _626;
    float _1858 = _628;
    float _1860 = _644;
    float _1862 = _638;
    float _1864 = _656;
    float _1866 = _658;
    float _1868 = _660;
    float _1870 = _1836;
    float _1872 = _1838;
    float _1874 = _1840;
    float _1876 = _1842;
    float _1878 = _1866;
    float _1880 = _1868;
    if (_186)
    {
        float _1882 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _1884 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _1886 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _1888 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        _1870 = _1882;
        _1872 = _1884;
        _1874 = _1886;
        _1876 = _1888;
    }
    float _1890 = _1870;
    float _1892 = _1872;
    float _1894 = _1874;
    float _1896 = _1876;
    float _1898 = _1844;
    float _1900 = _1846;
    float _1902 = _1848;
    float _1904 = _1850;
    if (_186)
    {
        float _1906 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _1908 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _1910 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _1912 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        _1898 = _1906;
        _1900 = _1908;
        _1902 = _1910;
        _1904 = _1912;
    }
    float _1914 = _1898;
    float _1916 = _1900;
    float _1918 = _1902;
    float _1920 = _1904;
    float _1922 = _1852;
    float _1924 = _1854;
    float _1926 = _1856;
    float _1928 = _1858;
    if (_186)
    {
        float _1930 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _1932 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _1934 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _1936 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        _1922 = _1930;
        _1924 = _1932;
        _1926 = _1934;
        _1928 = _1936;
    }
    float _1938 = _1922;
    float _1940 = _1924;
    float _1942 = _1926;
    float _1944 = _1928;
    float _1946 = _1860 + _586;
    float _1948 = _1862 + _592;
    int _1950 = as_type<int>(_164) & 1024;
    bool _1952 = _1950 != 0;
    float _1954 = _1864 + _594;
    if (!_186)
    {
        _1878 = 0.0;
    }
    float _1956 = _1878;
    uint _1958 = uint(int(uint(_188) >> uint(2)));
    float _1960 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_1958)]);
    float _1962 = _1956;
    if (!_186)
    {
        _1880 = 0.0;
    }
    float _1964 = _1880;
    int _1966 = as_type<int>(_164) & 2048;
    bool _1968 = _1966 != 0;
    float _1970 = _1890;
    float _1972 = _1964;
    if (_186)
    {
        float _1974 = _1946 * _1892;
        _630 = _1974;
    }
    float _1976 = _630;
    float _1978 = _1976;
    if (_186)
    {
        float _1980 = fma(_1948, _1890, _1976);
        _1970 = _1980;
    }
    float _1982 = _1970;
    float _1984 = _1916;
    float _1986 = _1982;
    float _1988 = _1914;
    float _1990 = _1918;
    if (_186)
    {
        float _1992 = _1946 * _1916;
        _1984 = _1992;
    }
    float _1994 = _1984;
    float _1996 = _1994;
    if (_186)
    {
        float _1998 = _1946 * _1940;
        _1978 = _1998;
    }
    float _2000 = _1978;
    float _2002 = _2000;
    if (_186)
    {
        float _2004 = fma(_1948, _1914, _1994);
        _1996 = _2004;
    }
    float _2006 = _1996;
    if (_186)
    {
        float _2008 = fma(_1954, _1894, _1982);
        _1986 = _2008;
    }
    float _2010 = _1986;
    if (!_186)
    {
        _1988 = 0.0;
    }
    float _2012 = _1988;
    float _2014 = _2012;
    if (_186)
    {
        float _2016 = fma(_1948, _1938, _2000);
        _2002 = _2016;
    }
    float _2018 = _2002;
    float _2020 = _2018;
    if (_186)
    {
        float _2022 = fma(_1954, _1918, _2006);
        _1990 = _2022;
    }
    float _2024 = _1990;
    if (_186)
    {
        float _2026 = _2010 + _1896;
        _1962 = _2026;
    }
    float _2028 = _1962;
    float _2030 = _2028;
    if (_186)
    {
        float _2032 = fma(_1954, _1942, _2018);
        _2020 = _2032;
    }
    float _2034 = _2020;
    if (_186)
    {
        float _2036 = _2024 + _1920;
        _2014 = _2036;
    }
    float _2038 = _2014;
    float _2040 = _2038;
    if (_186)
    {
        float _2042 = _2034 + _1944;
        _1972 = _2042;
    }
    float _2044 = _1972;
    bool _2046 = !_1952;
    float _2048 = _2044;
    if (!_2046)
    {
        float _2050 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        uint _2052 = uint(int(uint(_166) >> uint(2)));
        float _2054 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2052)]);
        int _2056 = _166 + 4;
        uint _2058 = uint(int(uint(_2056) >> uint(2)));
        float _2060 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2058)]);
        int _2062 = _166 + 8;
        uint _2064 = uint(int(uint(_2062) >> uint(2)));
        float _2066 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2064)]);
        uint _2068 = uint(int(uint(_166) >> uint(2)));
        float _2070 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_2068)]);
        int _2072 = _166 + 4;
        uint _2074 = uint(int(uint(_2072) >> uint(2)));
        float _2076 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_2074)]);
        int _2078 = _166 + 8;
        uint _2080 = uint(int(uint(_2078) >> uint(2)));
        float _2082 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_2080)]);
        uint _2084 = uint(int(uint(_166) >> uint(2)));
        float _2086 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2084)]);
        int _2088 = _166 + 4;
        uint _2090 = uint(int(uint(_2088) >> uint(2)));
        float _2092 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2090)]);
        int _2094 = _166 + 8;
        uint _2096 = uint(int(uint(_2094) >> uint(2)));
        float _2098 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2096)]);
        float _2100 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        float _2102 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        float _2104 = _2060 * _1946;
        float _2106 = _2076 * _1946;
        float _2108 = _2092 * _1946;
        float _2110 = fma(_2054, _1948, _2104);
        float _2112 = fma(_2070, _1948, _2106);
        float _2114 = fma(_2086, _1948, _2108);
        float _2116 = fma(_2066, _1954, _2110);
        float _2118 = fma(_2082, _1954, _2112);
        float _2120 = fma(_2098, _1954, _2114);
        float _2122 = _2050 + _2116;
        float _2124 = _2100 + _2118;
        float _2126 = _2102 + _2120;
        _2030 = _2122;
        _2048 = _2126;
        _2040 = _2124;
    }
    float _2128 = _2030;
    float _2130 = _2048;
    float _2132 = _2040;
    bool _2134 = !_1968;
    float _2136 = _2132;
    float _2138 = _2128;
    float _2140 = _2130;
    if (!_2134)
    {
        uint _2142 = uint(int(uint(_166) >> uint(2)));
        float _2144 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2142)]);
        int _2146 = _166 + 4;
        uint _2148 = uint(int(uint(_2146) >> uint(2)));
        float _2150 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2148)]);
        int _2152 = _166 + 8;
        uint _2154 = uint(int(uint(_2152) >> uint(2)));
        float _2156 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2154)]);
        int _2158 = _166 + 12;
        uint _2160 = uint(int(uint(_2158) >> uint(2)));
        float _2162 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2160)]);
        uint _2164 = uint(int(uint(_166) >> uint(2)));
        float _2166 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_2164)]);
        int _2168 = _166 + 4;
        uint _2170 = uint(int(uint(_2168) >> uint(2)));
        float _2172 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_2170)]);
        int _2174 = _166 + 8;
        uint _2176 = uint(int(uint(_2174) >> uint(2)));
        float _2178 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_2176)]);
        int _2180 = _166 + 12;
        uint _2182 = uint(int(uint(_2180) >> uint(2)));
        float _2184 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_2182)]);
        uint _2186 = uint(int(uint(_166) >> uint(2)));
        float _2188 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2186)]);
        int _2190 = _166 + 4;
        uint _2192 = uint(int(uint(_2190) >> uint(2)));
        float _2194 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2192)]);
        int _2196 = _166 + 8;
        uint _2198 = uint(int(uint(_2196) >> uint(2)));
        float _2200 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2198)]);
        int _2202 = _166 + 12;
        uint _2204 = uint(int(uint(_2202) >> uint(2)));
        float _2206 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2204)]);
        float _2208 = _2150 * _1946;
        float _2210 = _2172 * _1946;
        float _2212 = _2194 * _1946;
        float _2214 = fma(_2144, _1948, _2208);
        float _2216 = fma(_2166, _1948, _2210);
        float _2218 = fma(_2188, _1948, _2212);
        float _2220 = fma(_2156, _1954, _2214);
        float _2222 = fma(_2178, _1954, _2216);
        float _2224 = fma(_2200, _1954, _2218);
        float _2226 = _2162 + _2220;
        float _2228 = _2184 + _2222;
        float _2230 = _2206 + _2224;
        _2136 = _2228;
        _2138 = _2226;
        _2140 = _2230;
    }
    float _2232 = _2136;
    float _2234 = _2138;
    float _2236 = _2140;
    float _2238 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[70]);
    float _2240 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[504]);
    float _2242 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[505]);
    float _2244 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[506]);
    float _2246 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[507]);
    float _2248 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[501]);
    float _2250 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[8]);
    float _2252 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[9]);
    float _2254 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[10]);
    float _2256 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[11]);
    float _2258 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[61]);
    float _2260 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[60]);
    float _2262 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[502]);
    float _2264 = _2238 + 1.0;
    float _2266 = _2264 + _2232;
    float _2268 = _2266 * _2242;
    float _2270 = fma(_2240, _2234, _2268);
    float _2272 = fma(_2244, _2236, _2270);
    float _2274 = _2246 + _2272;
    float _2276 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[508]);
    float _2278 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[509]);
    float _2280 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[510]);
    float _2282 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[511]);
    float _2284 = trunc(_2274);
    int _2286 = int(_2284);
    int _2288 = ~as_type<int>(_2248);
    int _2290 = _2286 + _2288;
    int _2292 = _2290 + 1;
    bool _2294 = _2292 >= 0;
    int _2296 = as_type<int>(_164);
    if (_2294)
    {
        float _2298 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[500]);
        _2296 = as_type<int>(_2298);
    }
    int _2300 = _2296;
    float _2302 = fma(_2234, 6.2500002968590706586837768554688e-05, 0.5);
    float _2304 = fma(_2236, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _6679 = float2(_2302, _2304);
    float _2306 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_6679, float2(0.0), isnan(_6679)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_6679, float2(0.0), isnan(_6679)), level(0.0)).x;
    float _2308 = _2252 * _2232;
    float _2310 = fma(_2250, _2234, _2308);
    float _2312 = fma(_2254, _2236, _2310);
    float _2314 = _2256 + _2312;
    float _2316 = -_2314;
    bool _2318 = _2258 >= _2316;
    bool _2320 = isnan(_2258);
    bool _2322 = _2318 || _2320;
    bool _2324 = isnan(_2316);
    bool _2326 = _2322 || _2324;
    float _2328 = -_2314;
    bool _2330 = _2260 >= _2328;
    bool _2332 = isnan(_2260);
    bool _2334 = _2330 || _2332;
    bool _2336 = isnan(_2328);
    bool _2338 = _2334 || _2336;
    int _2340 = _2326 ? 0 : 1;
    int _2342 = 2;
    float _2344 = _2304;
    float _2346 = _2302;
    if (_2326)
    {
        _2342 = 1;
    }
    int _2348 = _2342;
    int _2350 = _2348;
    if (_2338)
    {
        _2350 = _2340;
    }
    int _2352 = _2350;
    int _2354 = _2352 << 6;
    int _2356 = _2354 + 96;
    uint _2358 = uint(int(uint(_2356) >> uint(2)));
    float _2360 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2358)]);
    int _2362 = _2356 + 4;
    uint _2364 = uint(int(uint(_2362) >> uint(2)));
    float _2366 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2364)]);
    int _2368 = _2356 + 8;
    uint _2370 = uint(int(uint(_2368) >> uint(2)));
    float _2372 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2370)]);
    int _2374 = _2356 + 12;
    uint _2376 = uint(int(uint(_2374) >> uint(2)));
    float _2378 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2376)]);
    int _2380 = _2354 + 48;
    uint _2382 = uint(int(uint(_2380) >> uint(2)));
    float _2384 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2382)]);
    int _2386 = _2380 + 4;
    uint _2388 = uint(int(uint(_2386) >> uint(2)));
    float _2390 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2388)]);
    int _2392 = _2380 + 8;
    uint _2394 = uint(int(uint(_2392) >> uint(2)));
    float _2396 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2394)]);
    int _2398 = _2380 + 12;
    uint _2400 = uint(int(uint(_2398) >> uint(2)));
    float _2402 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2400)]);
    float _2404 = _2266 * _2278;
    float _2406 = fma(_2276, _2234, _2404);
    float _2408 = fma(_2280, _2236, _2406);
    float _2410 = _2282 + _2408;
    int _2412 = _2354 + 64;
    float _2414 = trunc(_2410);
    int _2416 = int(_2414);
    uint _2418 = uint(int(uint(_2412) >> uint(2)));
    float _2420 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2418)]);
    int _2422 = _2412 + 4;
    uint _2424 = uint(int(uint(_2422) >> uint(2)));
    float _2426 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2424)]);
    int _2428 = _2412 + 8;
    uint _2430 = uint(int(uint(_2428) >> uint(2)));
    float _2432 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2430)]);
    int _2434 = _2412 + 12;
    uint _2436 = uint(int(uint(_2434) >> uint(2)));
    float _2438 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2436)]);
    int _2440 = _2354 + 80;
    bool _2442 = _2300 <= _2292;
    bool _2444 = !_2294;
    bool _2446 = _2442 || _2444;
    int _2448 = ~as_type<int>(_2262);
    int _2450 = _2416 + _2448;
    int _2452 = _2450 + 1;
    uint _2454 = uint(int(uint(_2440) >> uint(2)));
    float _2456 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2454)]);
    int _2458 = _2440 + 4;
    uint _2460 = uint(int(uint(_2458) >> uint(2)));
    float _2462 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2460)]);
    int _2464 = _2440 + 8;
    uint _2466 = uint(int(uint(_2464) >> uint(2)));
    float _2468 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2466)]);
    int _2470 = _2440 + 12;
    uint _2472 = uint(int(uint(_2470) >> uint(2)));
    float _2474 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2472)]);
    bool _2476 = _2452 < 0;
    bool _2478 = _2476 || _2446;
    int _2480 = as_type<int>(_2262);
    if (!_2478)
    {
        float _2482 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[500]);
        _2480 = as_type<int>(_2482);
    }
    int _2484 = _2480;
    float _2486 = _2266 * _2366;
    float _2488 = fma(_2360, _2234, _2486);
    float _2490 = fma(_2372, _2236, _2488);
    float _2492 = _2378 + _2490;
    float _2494 = _2266 * _2390;
    float _2496 = 1.0 / _2492;
    float _2498 = fma(_2384, _2234, _2494);
    float _2500 = fma(_2396, _2236, _2498);
    float _2502 = _2266 * _2426;
    float _2504 = fma(_2420, _2234, _2502);
    float _2506 = _2402 + _2500;
    float _2508 = fma(_2432, _2236, _2504);
    float _2510 = _2506 * _2496;
    float _2512 = _2438 + _2508;
    bool _2514 = _2510 >= 0.0;
    float _2516 = _2512 * _2496;
    bool _2518 = _2510 <= 1.0;
    bool _2520 = _2518 && _2514;
    bool _2522 = _2516 >= 0.0;
    bool _2524 = _2522 && _2520;
    bool _2526 = _2516 <= 1.0;
    bool _2528 = _2526 && _2524;
    float _2530 = _2266 * _2462;
    bool _2532 = _2484 <= _2452;
    bool _2534 = _2532 || _2478;
    float _2536 = fma(_2456, _2234, _2530);
    float _2538 = fma(_2468, _2236, _2536);
    float _2540 = _2420;
    float _2542 = _2536;
    float _2544 = _2500;
    float _2546 = _2538;
    if (_2528)
    {
        float _2548 = float(_2352);
        _2540 = _2548;
    }
    float _2550 = _2540;
    float _2552 = _2474 + _2538;
    if (_2534)
    {
        _2542 = 1.0;
    }
    float _2554 = _2542;
    float _2556 = _2554;
    if (!_2534)
    {
        float _2558 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[500]);
        int _2560 = _2452 * as_type<int>(_2558);
        int _2562 = _2560 + _2292;
        int _2564 = _2562 << 2;
        uint _2566 = uint(int(uint(_2562) >> uint(2)));
        int _2568 = 12 & _2564;
        int _2570 = int(_2566) << 4;
        int _2572 = _2570 + _2568;
        int _2574 = _2572 + 400;
        uint _2576 = uint(int(uint(_2574) >> uint(2)));
        float _2578 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2576)]);
        float _2580 = floor(_2410);
        float _2582 = floor(_2274);
        float _2584 = -_2580;
        float _2586 = _2410 + _2584;
        float _2588 = -_2582;
        float _2590 = _2274 + _2588;
        float _2592 = rint(_2578);
        float _2594 = precise::max(_2592, 0.0);
        uint _2596 = uint(_2594);
        uint _2598 = clamp(_2596, 0u, 65535u);
        float3 _7131 = float3(_2590, _2586, float(int(_2598)));
        float3 _7135 = select(_7131, float3(0.0), isnan(_7131));
        float _2600 = dm_bs(spvDescriptorSet0.cp_t_tcb_14.sample(spvDescriptorSet0.cp_t_tcb_14Smplr, _7135.xy, uint(rint(_7135.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_14, spvDescriptorSet0.cp_t_tcb_14Smplr_w, _7135.xy, uint(rint(_7135.z)), level(0.0)).x;
        int _2602 = _2562 << 4;
        int _2604 = _2602 + 2048;
        uint _2606 = uint(int(uint(_2604) >> uint(2)));
        float _2608 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2606)]);
        int _2610 = _2604 + 4;
        uint _2612 = uint(int(uint(_2610) >> uint(2)));
        float _2614 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2612)]);
        int _2616 = _2604 + 8;
        uint _2618 = uint(int(uint(_2616) >> uint(2)));
        float _2620 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2618)]);
        int _2622 = _2604 + 12;
        uint _2624 = uint(int(uint(_2622) >> uint(2)));
        float _2626 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2624)]);
        float _2628 = _2266 * _2614;
        float _2630 = fma(_2608, _2234, _2628);
        float _2632 = fma(_2620, _2236, _2630);
        float _2634 = _2626 + _2632;
        float _2636 = precise::clamp(_2634, 0.0, 1.0);
        float _2638 = -_2636;
        float _2640 = _2638 + _2600;
        float _2642 = fma(_2640, 500.0, 1.5);
        float _2644 = exp2(_2642);
        float _2646 = 0.0 + _2644;
        float _2648 = precise::clamp(_2646, 0.0, 1.0);
        _2544 = as_type<float>(_2598);
        _2546 = _2644;
        _2556 = _2648;
    }
    float _2650 = _2544;
    float _2652 = _2546;
    float _2654 = _2556;
    float _2656 = _2550;
    float _2658 = _2650;
    float _2660 = _2652;
    if (_2528)
    {
        float _2662 = rint(_2550);
        float _2664 = precise::max(_2662, 0.0);
        uint _2666 = uint(_2664);
        uint _2668 = clamp(_2666, 0u, 65535u);
        _2656 = as_type<float>(_2668);
    }
    float _2670 = _2656;
    float _2672 = _2552 * _2496;
    bool _2674 = _2306 != 0.0;
    bool _2676 = isnan(_2306);
    bool _2678 = _2674 || _2676;
    bool _2680 = isnan(0.0);
    bool _2682 = _2678 || _2680;
    uint _2684 = uint(int(uint(_166) >> uint(2)));
    float _2686 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_2684)]);
    float _2688 = fma(_2234, 6.2500002968590706586837768554688e-05, 0.4999375045299530029296875);
    float _2690 = fma(_2236, 6.2500002968590706586837768554688e-05, 0.4999375045299530029296875);
    float _2692 = fma(_2234, 6.2500002968590706586837768554688e-05, 0.500062525272369384765625);
    float _2694 = fma(_2236, 6.2500002968590706586837768554688e-05, 0.500062525272369384765625);
    float _2696 = _2670;
    float _2698 = _2688;
    if (_2528)
    {
        float3 _7278 = float3(_2510, _2516, float(as_type<int>(_2670)));
        float3 _7280 = select(_7278, float3(0.0), isnan(_7278));
        float _2700 = spvDepthCast(spvDescriptorSet0.cp_t_tcb_16).sample_compare(spvDescriptorSet0.cp_t_tcb_16Smplr, _7280.xy, uint(rint(_7280.z)), _2672, level(0.0));
        _2696 = _2700;
    }
    float _2702 = _2696;
    if (!_2682)
    {
        _2658 = 4.0;
    }
    float _2704 = _2658;
    float _2706 = _2306;
    float _2708 = _2704;
    if (!_2682)
    {
        float2 _7300 = float2(_2302, _2304);
        float _2710 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_7300, float2(0.0), isnan(_7300)), level(_2704)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_7300, float2(0.0), isnan(_7300)), level(_2704)).x;
        _2706 = _2710;
    }
    float _2712 = _2706;
    float2 _7312 = float2(_2688, _2304);
    float _2714 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_7312, float2(0.0), isnan(_7312)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_7312, float2(0.0), isnan(_7312)), level(0.0)).x;
    float2 _7320 = float2(_2302, _2690);
    float _2716 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_7320, float2(0.0), isnan(_7320)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_7320, float2(0.0), isnan(_7320)), level(0.0)).x;
    float2 _7328 = float2(_2692, _2304);
    float _2718 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_7328, float2(0.0), isnan(_7328)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_7328, float2(0.0), isnan(_7328)), level(0.0)).x;
    float2 _7336 = float2(_2302, _2694);
    float _2720 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_7336, float2(0.0), isnan(_7336)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_7336, float2(0.0), isnan(_7336)), level(0.0)).x;
    if (!_2528)
    {
        _2660 = 1.0;
    }
    float _2722 = _2660;
    bool _2724 = _606 > 0.001000000047497451305389404296875;
    bool _2726 = isnan(_606);
    bool _2728 = _2724 || _2726;
    bool _2730 = isnan(0.001000000047497451305389404296875);
    bool _2732 = _2728 || _2730;
    float _2734 = _2722;
    float _2736 = _2702;
    float _2738 = _2714;
    float _2740 = _2718;
    float _2742 = _2716;
    float _2744 = _2720;
    if (_2528)
    {
        bool _2746 = _2702 >= _2672;
        bool _2748 = isnan(_2702);
        bool _2750 = _2746 || _2748;
        bool _2752 = isnan(_2672);
        bool _2754 = _2750 || _2752;
        float _2756 = float(_2754);
        _2734 = _2756;
    }
    float _2758 = _2734;
    float _2760 = -_2758;
    float _2762 = fma(_2760, _2654, 1.0);
    float _2764 = -_2686;
    float _2766 = _2762 + _2764;
    float _2768 = _2762;
    if (_2732)
    {
        float _2770 = fma(_2766, 0.0500000007450580596923828125, _2686);
        _2768 = _2770;
    }
    float _2772 = _2768;
    float _2774 = precise::max(0.0, _2772);
    float _2776 = precise::min(_2774, 0.999000012874603271484375);
    uint _2778 = uint(int(uint(_166) >> uint(2)));
    (*spvDescriptorSet0.cp_s12)._m0[int(_2778)] = as_type<uint>(_2776);
    int _2780 = as_type<int>(_2758);
    if (!_2732)
    {
        float _2782 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[76]);
        _2780 = as_type<int>(_2782);
    }
    int _2784 = _2780;
    float _2786 = _2712 * 2000.0;
    bool _2788 = _2786 == 0.0;
    bool _2790 = !_2732;
    bool _2792 = _2788 && _2790;
    bool _2794 = !_2792;
    int _2796 = _2794 ? as_type<int>(_1960) : 0;
    float _2798 = -_170;
    float _2800 = _2798 + _1948;
    float _2802 = -_176;
    float _2804 = _2802 + _1946;
    float _2806 = -_182;
    float _2808 = _2806 + _1954;
    float _2810 = _2786;
    if (_2732)
    {
        _308 = _2796;
    }
    int _2812 = _308;
    int _2814 = _2784;
    int _2816 = _2812;
    if (!_2732)
    {
        float _2818 = _2786 + as_type<float>(_2784);
        _2814 = as_type<int>(_2818);
    }
    int _2820 = _2814;
    if (!_2732)
    {
        int _2822 = _166 + 4;
        _2810 = as_type<float>(_2822);
    }
    float _2824 = _2810;
    float _2826 = _2824;
    if (!_2732)
    {
        uint _2828 = uint(int(uint(as_type<int>(_2824)) >> uint(2)));
        (*spvDescriptorSet0.cp_s12)._m0[int(_2828)] = uint(_2820);
    }
    if (!_2732)
    {
        float2 _7509 = float2(_2688, _2690);
        float _2830 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_7509, float2(0.0), isnan(_7509)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_7509, float2(0.0), isnan(_7509)), level(0.0)).x;
        float2 _7517 = float2(_2688, _2694);
        float _2832 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_7517, float2(0.0), isnan(_7517)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_7517, float2(0.0), isnan(_7517)), level(0.0)).x;
        float2 _7525 = float2(_2692, _2690);
        float _2834 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_7525, float2(0.0), isnan(_7525)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_7525, float2(0.0), isnan(_7525)), level(0.0)).x;
        float2 _7533 = float2(_2692, _2694);
        float _2836 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_7533, float2(0.0), isnan(_7533)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_7533, float2(0.0), isnan(_7533)), level(0.0)).x;
        bool _2838 = _2714 != 0.0;
        bool _2840 = isnan(_2714);
        bool _2842 = _2838 || _2840;
        bool _2844 = isnan(0.0);
        bool _2846 = _2842 || _2844;
        float _2848 = _2304;
        if (_2846)
        {
            _2826 = _2714;
        }
        float _2850 = _2826;
        if (!_2846)
        {
            _2736 = 4.0;
        }
        float _2852 = _2736;
        float _2854 = _2850;
        float _2856 = _2852;
        if (!_2846)
        {
            float2 _7568 = float2(_2688, _2304);
            float _2858 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_7568, float2(0.0), isnan(_7568)), level(_2852)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_7568, float2(0.0), isnan(_7568)), level(_2852)).x;
            _2854 = _2858;
        }
        float _2860 = _2854;
        bool _2862 = _2718 != 0.0;
        bool _2864 = isnan(_2718);
        bool _2866 = _2862 || _2864;
        bool _2868 = isnan(0.0);
        bool _2870 = _2866 || _2868;
        bool _2872 = _2716 != 0.0;
        bool _2874 = isnan(_2716);
        bool _2876 = _2872 || _2874;
        bool _2878 = isnan(0.0);
        bool _2880 = _2876 || _2878;
        bool _2882 = _2720 != 0.0;
        bool _2884 = isnan(_2720);
        bool _2886 = _2882 || _2884;
        bool _2888 = isnan(0.0);
        bool _2890 = _2886 || _2888;
        if (_2870)
        {
            _2856 = _2718;
        }
        float _2892 = _2856;
        if (!_2870)
        {
            _2708 = 4.0;
        }
        float _2894 = _2708;
        if (_2880)
        {
            _2344 = _2716;
        }
        float _2896 = _2344;
        float _2898 = _2892;
        if (!_2870)
        {
            float2 _7632 = float2(_2692, _2304);
            float _2900 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_7632, float2(0.0), isnan(_7632)), level(_2894)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_7632, float2(0.0), isnan(_7632)), level(_2894)).x;
            _2898 = _2900;
        }
        float _2902 = _2898;
        if (_2890)
        {
            _2346 = _2720;
        }
        float _2904 = _2346;
        if (!_2880)
        {
            _2738 = 4.0;
        }
        float _2906 = _2738;
        if (!_2890)
        {
            _2698 = 4.0;
        }
        float _2908 = _2698;
        bool _2910 = _2830 != 0.0;
        bool _2912 = isnan(_2830);
        bool _2914 = _2910 || _2912;
        bool _2916 = isnan(0.0);
        bool _2918 = _2914 || _2916;
        bool _2920 = _2832 != 0.0;
        bool _2922 = isnan(_2832);
        bool _2924 = _2920 || _2922;
        bool _2926 = isnan(0.0);
        bool _2928 = _2924 || _2926;
        bool _2930 = _2834 != 0.0;
        bool _2932 = isnan(_2834);
        bool _2934 = _2930 || _2932;
        bool _2936 = isnan(0.0);
        bool _2938 = _2934 || _2936;
        bool _2940 = _2836 != 0.0;
        bool _2942 = isnan(_2836);
        bool _2944 = _2940 || _2942;
        bool _2946 = isnan(0.0);
        bool _2948 = _2944 || _2946;
        if (!_2918)
        {
            _2848 = 4.0;
        }
        float _2950 = _2848;
        if (!_2928)
        {
            _2740 = 4.0;
        }
        float _2952 = _2740;
        if (!_2938)
        {
            _2742 = 4.0;
        }
        float _2954 = _2742;
        float _2956 = _2830;
        if (!_2918)
        {
            float2 _7722 = float2(_2688, _2690);
            float _2958 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_7722, float2(0.0), isnan(_7722)), level(_2950)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_7722, float2(0.0), isnan(_7722)), level(_2950)).x;
            _2956 = _2958;
        }
        float _2960 = _2956;
        float _2962 = _2832;
        if (!_2928)
        {
            float2 _7738 = float2(_2688, _2694);
            float _2964 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_7738, float2(0.0), isnan(_7738)), level(_2952)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_7738, float2(0.0), isnan(_7738)), level(_2952)).x;
            _2962 = _2964;
        }
        float _2966 = _2962;
        if (!_2948)
        {
            _2744 = 4.0;
        }
        float _2968 = _2744;
        float _2970 = _2834;
        if (!_2938)
        {
            float2 _7759 = float2(_2692, _2690);
            float _2972 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_7759, float2(0.0), isnan(_7759)), level(_2954)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_7759, float2(0.0), isnan(_7759)), level(_2954)).x;
            _2970 = _2972;
        }
        float _2974 = _2970;
        float _2976 = _2836;
        if (!_2948)
        {
            float2 _7775 = float2(_2692, _2694);
            float _2978 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_7775, float2(0.0), isnan(_7775)), level(_2968)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_7775, float2(0.0), isnan(_7775)), level(_2968)).x;
            _2976 = _2978;
        }
        float _2980 = _2976;
        float _2982 = _2896;
        if (!_2880)
        {
            float2 _7791 = float2(_2302, _2690);
            float _2984 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_7791, float2(0.0), isnan(_7791)), level(_2906)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_7791, float2(0.0), isnan(_7791)), level(_2906)).x;
            _2982 = _2984;
        }
        float _2986 = _2982;
        float _2988 = _2904;
        if (!_2890)
        {
            float2 _7807 = float2(_2302, _2694);
            float _2990 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_7807, float2(0.0), isnan(_7807)), level(_2908)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_7807, float2(0.0), isnan(_7807)), level(_2908)).x;
            _2988 = _2990;
        }
        float _2992 = _2988;
        float _2994 = -_2860;
        float _2996 = _2712 + _2994;
        float _2998 = -_2902;
        float _3000 = _2712 + _2998;
        float _3002 = abs(_2996);
        float _3004 = abs(_3000);
        float _3006 = precise::max(_3002, _3004);
        float _3008 = -_2960;
        float _3010 = _2712 + _3008;
        float _3012 = -_2966;
        float _3014 = _2712 + _3012;
        float _3016 = -_2974;
        float _3018 = _2712 + _3016;
        float _3020 = -_2980;
        float _3022 = _2712 + _3020;
        float _3024 = -_2986;
        float _3026 = _2712 + _3024;
        float _3028 = -_2992;
        float _3030 = _2712 + _3028;
        float _3032 = abs(_3010);
        float _3034 = abs(_3014);
        float _3036 = precise::max(_3032, _3034);
        float _3038 = abs(_3018);
        float _3040 = abs(_3022);
        float _3042 = precise::max(_3038, _3040);
        float _3044 = abs(_3026);
        float _3046 = abs(_3030);
        float _3048 = precise::max(_3044, _3046);
        float _3050 = precise::max(_3036, _3042);
        float _3052 = precise::max(_3006, _3048);
        bool _3054 = _3050 > 0.00150000001303851604461669921875;
        bool _3056 = _3052 > 0.00150000001303851604461669921875;
        bool _3058 = _3056 || _3054;
        bool _3060 = !_3058;
        int _3062 = _3060 ? _2796 : 0;
        _2816 = _3062;
    }
    int _3064 = _2816;
    int _3066 = _166 + 4;
    int _3068 = _166 + 8;
    uint _3070 = uint(int(uint(_188) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_3070)] = uint(_3064);
    uint _3072 = uint(int(uint(_166) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_3072)] = as_type<uint>(_1948);
    uint _3074 = uint(int(uint(_3066) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_3074)] = as_type<uint>(_1946);
    uint _3076 = uint(int(uint(_3068) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_3076)] = as_type<uint>(_1954);
    uint _3078 = uint(int(uint(_166) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_3078)] = as_type<uint>(_590);
    uint _3080 = uint(int(uint(_3066) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_3080)] = as_type<uint>(_588);
    uint _3082 = uint(int(uint(_3068) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_3082)] = as_type<uint>(_596);
    uint _3084 = uint(int(uint(_166) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_3084)] = as_type<uint>(_2800);
    uint _3086 = uint(int(uint(_3066) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_3086)] = as_type<uint>(_2804);
    uint _3088 = uint(int(uint(_3068) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_3088)] = as_type<uint>(_2808);
    float _3090 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _3092 = _2804 * _2804;
    float _3094 = _588 * _588;
    float _3096 = fma(_2800, _2800, _3092);
    float _3098 = fma(_590, _590, _3094);
    float _3100 = fma(_2808, _2808, _3096);
    float _3102 = fma(_596, _596, _3098);
    float _3104 = sqrt(_3100);
    float _3106 = sqrt(_3102);
    bool _3108 = _3104 >= 9.9999999747524270787835121154785e-07;
    bool _3110 = isnan(_3104);
    bool _3112 = _3108 || _3110;
    bool _3114 = isnan(9.9999999747524270787835121154785e-07);
    bool _3116 = _3112 || _3114;
    if (!_3116)
    {
        bool _3118 = _538 != _278;
        bool _3120 = isnan(_538);
        bool _3122 = _3118 || _3120;
        bool _3124 = isnan(_278);
        bool _3126 = _3122 || _3124;
        _3128 = _3126;
        if (!_3128)
        {
            float _3130 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
            bool _3132 = _3130 > 0.0;
            bool _3134 = !_3132;
            if (!_3134)
            {
                float _3136 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
                float _3138 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
                float _3140 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
                float _3142 = _3138 * _504;
                float _3144 = _3138 * _502;
                float _3146 = _3138 * _506;
                float _3148 = fma(_3136, _508, _3142);
                float _3150 = fma(_3136, _510, _3144);
                float _3152 = fma(_3136, _512, _3146);
                float _3154 = fma(_3140, _514, _3148);
                float _3156 = fma(_3140, _516, _3150);
                float _3158 = fma(_3140, _518, _3152);
                float _3160 = _3154 * _3154;
                float _3162 = fma(_3156, _3156, _3160);
                float _3164 = fma(_3158, _3158, _3162);
                float _3166 = rsqrt(_3164);
                float _3168 = _3166 * 9.9999999747524270787835121154785e-07;
                float _3170 = _3156 * _3168;
                float _3172 = _3154 * _3168;
                float _3174 = _3158 * _3168;
                _322 = as_type<int>(_3170);
                _324 = as_type<int>(_3172);
                _326 = as_type<int>(_3174);
                _3128 = true;
            }
            else
            {
                bool _3176 = _3106 >= 9.9999999747524270787835121154785e-07;
                bool _3178 = isnan(_3106);
                bool _3180 = _3176 || _3178;
                bool _3182 = isnan(9.9999999747524270787835121154785e-07);
                bool _3184 = _3180 || _3182;
                if (!_3184)
                {
                    float _3186 = _1946 * _1946;
                    float _3188 = fma(_1948, _1948, _3186);
                    float _3190 = fma(_1954, _1954, _3188);
                    float _3192 = sqrt(_3190);
                    bool _3194 = _3192 >= 9.9999999747524270787835121154785e-07;
                    bool _3196 = isnan(_3192);
                    bool _3198 = _3194 || _3196;
                    bool _3200 = isnan(9.9999999747524270787835121154785e-07);
                    bool _3202 = _3198 || _3200;
                    float _3204 = _3192;
                    if (_3202)
                    {
                        float _3206 = rsqrt(_3190);
                        _3204 = _3206;
                    }
                    float _3208 = _3204;
                    if (!_3202)
                    {
                        _310 = 0;
                    }
                    int _3210 = _310;
                    int _3212 = _3210;
                    if (!_3202)
                    {
                        _312 = 897988541;
                    }
                    int _3214 = _312;
                    int _3216 = _3214;
                    if (!_3202)
                    {
                        _314 = 0;
                    }
                    int _3218 = _314;
                    float _3220 = _3208;
                    int _3222 = _3218;
                    if (_3202)
                    {
                        float _3224 = _3208 * 9.9999999747524270787835121154785e-07;
                        _3220 = _3224;
                    }
                    float _3226 = _3220;
                    if (_3202)
                    {
                        float _3228 = _1948 * _3226;
                        _3212 = as_type<int>(_3228);
                    }
                    int _3230 = _3212;
                    _322 = _3230;
                    if (_3202)
                    {
                        float _3232 = _1946 * _3226;
                        _3216 = as_type<int>(_3232);
                    }
                    int _3234 = _3216;
                    _324 = _3234;
                    if (_3202)
                    {
                        float _3236 = _1954 * _3226;
                        _3222 = as_type<int>(_3236);
                    }
                    int _3238 = _3222;
                    _326 = _3238;
                    _3128 = true;
                }
                else
                {
                    float _3240 = rsqrt(_3102);
                    float _3242 = _3240 * 9.9999999747524270787835121154785e-07;
                    float _3244 = _590 * _3242;
                    float _3246 = _588 * _3242;
                    float _3248 = _596 * _3242;
                    _322 = as_type<int>(_3244);
                    _324 = as_type<int>(_3246);
                    _326 = as_type<int>(_3248);
                    _3128 = true;
                }
            }
        }
    }
    else
    {
        float _3250 = _3106 * _3090;
        bool _3252 = _3250 >= 0.001000000047497451305389404296875;
        bool _3254 = isnan(_3250);
        bool _3256 = _3252 || _3254;
        bool _3258 = isnan(0.001000000047497451305389404296875);
        bool _3260 = _3256 || _3258;
        bool _3262 = _3250 > 0.0;
        bool _3264 = !_3260;
        bool _3266 = _3262 && _3264;
        bool _3268 = _3104 < 0.001000000047497451305389404296875;
        bool _3270 = _3268 && _3266;
        if (!_3270)
        {
            _316 = as_type<int>(_2800);
        }
        int _3272 = _316;
        int _3274 = _3272;
        if (_3270)
        {
            float _3276 = _590 * _3090;
            _3274 = as_type<int>(_3276);
        }
        int _3278 = _3274;
        _322 = _3278;
        if (!_3270)
        {
            _318 = as_type<int>(_2804);
        }
        int _3280 = _318;
        int _3282 = _3280;
        if (_3270)
        {
            float _3284 = _588 * _3090;
            _3282 = as_type<int>(_3284);
        }
        int _3286 = _3282;
        _324 = _3286;
        if (!_3270)
        {
            _320 = as_type<int>(_2808);
        }
        int _3288 = _320;
        _326 = _3288;
        if (_3270)
        {
            float _3290 = _596 * _3090;
            _326 = as_type<int>(_3290);
        }
    }
    _3128 = false;
    int _3292 = _322;
    int _3294 = _324;
    int _3296 = _326;
    uint _3298 = uint(int(uint(_166) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_3298)] = uint(_3292);
    uint _3300 = uint(int(uint(_3066) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_3300)] = uint(_3294);
    uint _3302 = uint(int(uint(_3068) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_3302)] = uint(_3296);
}

