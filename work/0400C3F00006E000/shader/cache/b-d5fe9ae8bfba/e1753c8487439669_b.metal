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
    texture2d<float> cp_t_tcb_2C [[id(13)]];
    sampler cp_t_tcb_2CSmplr [[id(14)]];
    texture2d_array<float> cp_t_tcb_14 [[id(15)]];
    sampler cp_t_tcb_14Smplr [[id(16)]];
    texture2d_array<float> cp_t_tcb_16 [[id(17)]];
    sampler cp_t_tcb_16Smplr [[id(18)]];
    sampler cp_t_tcb_2CSmplr_w [[id(19)]];
    sampler cp_t_tcb_14Smplr_w [[id(20)]];
    constant dm_border_t* dm_border [[id(21)]];
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]])
{
    bool _3172 = false;
    bool _1330 = false;
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
    int _308 = as_type<int>(_208);
    int _310 = as_type<int>(_214);
    int _312 = as_type<int>(_220);
    int _314 = as_type<int>(_208);
    int _316 = as_type<int>(_214);
    int _318 = as_type<int>(_220);
    int _320 = as_type<int>(_208);
    int _322 = as_type<int>(_214);
    int _324 = as_type<int>(_220);
    if (!_186)
    {
        int _326 = _166 + 4;
        uint _328 = uint(int(uint(_166) >> uint(2)));
        float _330 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_328)]);
        int _332 = _166 + 8;
        uint _334 = uint(int(uint(_166) >> uint(2)));
        float _336 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_334)]);
        uint _338 = uint(int(uint(_326) >> uint(2)));
        float _340 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_338)]);
        uint _342 = uint(int(uint(_332) >> uint(2)));
        float _344 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_342)]);
        uint _346 = uint(int(uint(_326) >> uint(2)));
        float _348 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_346)]);
        uint _350 = uint(int(uint(_166) >> uint(2)));
        float _352 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_350)]);
        uint _354 = uint(int(uint(_332) >> uint(2)));
        float _356 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_354)]);
        uint _358 = uint(int(uint(_326) >> uint(2)));
        float _360 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_358)]);
        uint _362 = uint(int(uint(_332) >> uint(2)));
        float _364 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_362)]);
        float _366 = _330 * _330;
        float _368 = fma(_336, _336, _366);
        float _370 = _340 * _340;
        float _372 = _344 * _344;
        float _374 = fma(_348, _348, _370);
        float _376 = fma(_352, _352, _368);
        float _378 = fma(_356, _356, _372);
        float _380 = fma(_360, _360, _374);
        float _382 = sqrt(_376);
        float _384 = fma(_364, _364, _378);
        float _386 = sqrt(_380);
        float _388 = sqrt(_384);
        bool _390 = _382 > 0.0;
        bool _392 = _386 > 0.0;
        bool _394 = _388 > 0.0;
        float _396 = _372;
        float _398 = _374;
        float _400 = _378;
        float _402 = _382;
        float _404 = _386;
        float _406 = _388;
        float _408 = _376;
        float _410 = _340;
        float _412 = _352;
        float _414 = _380;
        if (_390)
        {
            float _416 = rsqrt(_376);
            _396 = _416;
        }
        float _418 = _396;
        float _420 = 0.0;
        if (_392)
        {
            float _422 = rsqrt(_380);
            _420 = _422;
        }
        float _424 = _420;
        float _426 = 0.0;
        if (_394)
        {
            float _428 = rsqrt(_384);
            _426 = _428;
        }
        float _430 = _426;
        if (!_390)
        {
            _398 = 0.0;
        }
        float _432 = _398;
        float _434 = _432;
        if (_390)
        {
            float _436 = _352 * _418;
            _434 = _436;
        }
        float _438 = _434;
        _298 = _438;
        if (!_392)
        {
            _400 = 0.0;
        }
        float _440 = _400;
        float _442 = _440;
        if (!_390)
        {
            _402 = 0.0;
        }
        float _444 = _402;
        float _446 = _444;
        if (_390)
        {
            float _448 = _330 * _418;
            _446 = _448;
        }
        float _450 = _446;
        _284 = _450;
        if (!_390)
        {
            _404 = 0.0;
        }
        float _452 = _404;
        float _454 = _452;
        if (_392)
        {
            float _456 = _340 * _424;
            _442 = _456;
        }
        float _458 = _442;
        _286 = _458;
        if (!_392)
        {
            _406 = 0.0;
        }
        float _460 = _406;
        float _462 = _460;
        if (_390)
        {
            float _464 = _336 * _418;
            _454 = _464;
        }
        float _466 = _454;
        _292 = _466;
        if (!_392)
        {
            _408 = 0.0;
        }
        float _468 = _408;
        float _470 = _468;
        if (_392)
        {
            float _472 = _348 * _424;
            _462 = _472;
        }
        float _474 = _462;
        _290 = _474;
        if (!_394)
        {
            _410 = 0.0;
        }
        float _476 = _410;
        float _478 = _476;
        if (_392)
        {
            float _480 = _360 * _424;
            _470 = _480;
        }
        float _482 = _470;
        _296 = _482;
        if (!_394)
        {
            _412 = 0.0;
        }
        float _484 = _412;
        float _486 = _484;
        if (_394)
        {
            float _488 = _344 * _430;
            _478 = _488;
        }
        float _490 = _478;
        _288 = _490;
        if (!_394)
        {
            _414 = 0.0;
        }
        float _492 = _414;
        _300 = _492;
        if (_394)
        {
            float _494 = _356 * _430;
            _486 = _494;
        }
        float _496 = _486;
        _294 = _496;
        if (_394)
        {
            float _498 = _364 * _430;
            _300 = _498;
        }
    }
    float _500 = _284;
    float _502 = _286;
    float _504 = _288;
    float _506 = _290;
    float _508 = _292;
    float _510 = _294;
    float _512 = _296;
    float _514 = _298;
    float _516 = _300;
    float _518 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[68]);
    float _520 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[45]);
    float _522 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
    float _524 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
    float _526 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
    float _528 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
    float _530 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
    float _532 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    bool _534 = _520 > 0.0;
    float _536 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
    float _538 = 0.0;
    if (_534)
    {
        float _540 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[52]);
        _538 = _540;
    }
    float _542 = _538;
    float _544 = abs(_518);
    float _546 = log2(_544);
    float _548 = _524 * _530;
    float _550 = _522 * _530;
    float _552 = _548 * _500;
    float _554 = _548 * _502;
    float _556 = _548 * _504;
    float _558 = _526 * _530;
    float _560 = _532 * _546;
    float _562 = exp2(_560);
    float _564 = fma(_550, _506, _554);
    float _566 = fma(_550, _508, _552);
    float _568 = fma(_550, _510, _556);
    float _570 = fma(_558, _512, _564);
    float _572 = fma(_558, _514, _566);
    float _574 = fma(_558, _516, _568);
    float _576 = _532 * _570;
    float _578 = _532 * _572;
    float _580 = _282 * _532;
    float _582 = _532 * _574;
    float _584 = fma(_198, _580, _176);
    float _586 = fma(_198, _562, _576);
    float _588 = fma(_192, _562, _578);
    float _590 = fma(_192, _580, _170);
    float _592 = fma(_204, _580, _182);
    float _594 = fma(_204, _562, _582);
    bool _596 = _542 == 0.0;
    bool _598 = _542 == 0.0;
    bool _600 = _598 && _534;
    float _602 = -_278;
    float _604 = _536 + _602;
    float _606 = 0.0;
    float _608 = _574;
    float _610 = _526;
    float _612 = _528;
    float _614 = _542;
    float _616 = _580;
    float _618 = _542;
    float _620 = _582;
    float _622 = _574;
    float _624 = _526;
    float _626 = _528;
    float _628 = _590;
    if (_600)
    {
        _606 = 0.0;
    }
    float _630 = _606;
    float _632 = 0.0;
    float _634 = _630;
    float _636 = _630;
    if (_600)
    {
        _632 = 0.0;
    }
    float _638 = _632;
    float _640 = 0.0;
    float _642 = _638;
    if (_600)
    {
        _640 = 0.0;
    }
    float _644 = _640;
    bool _646 = _534 && _596;
    float _648 = 0.0;
    float _650 = 0.0;
    float _652 = 0.0;
    float _654 = _644;
    float _656 = 0.0;
    float _658 = 0.0;
    if (!_646)
    {
        float _660 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[44]);
        float _662 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[40]);
        float _664 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[41]);
        float _666 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[42]);
        float _668 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[43]);
        bool _670 = _542 > 0.0;
        bool _672 = _670 && _534;
        float _674 = trunc(_660);
        int _676 = int(_674);
        bool _678 = _676 > 0;
        if (!_678)
        {
            _634 = 0.0;
        }
        float _680 = _634;
        float _682 = 0.0;
        float _684 = 0.0;
        float _686 = _680;
        float _688 = _680;
        if (!_678)
        {
            _682 = 0.0;
            _684 = 0.0;
        }
        float _690 = _682;
        float _692 = _684;
        bool _694 = !_678;
        float _696 = _690;
        float _698 = _692;
        float _700 = _668;
        float _702 = 0.0;
        float _704 = 0.0;
        float _706 = 0.0;
        float _708 = 0.0;
        float _710 = 0.0;
        float _712 = _690;
        float _714 = _692;
        float _716 = _666;
        float _718 = _662;
        float _720 = _664;
        if (!_694)
        {
            int _722 = as_type<int>(_164) & 2048;
            bool _724 = _722 != 0;
            if (!_724)
            {
                _686 = 0.0;
            }
            float _726 = _686;
            _688 = _726;
            if (!_724)
            {
                _696 = 0.0;
                _698 = 0.0;
            }
            float _728 = _696;
            float _730 = _698;
            bool _732 = !_724;
            _702 = 0.0;
            _704 = 0.0;
            _706 = 0.0;
            _708 = 0.0;
            _710 = 0.0;
            _712 = _728;
            _714 = _730;
            if (!_732)
            {
                float _734 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
                uint _736 = uint(int(uint(_166) >> uint(2)));
                float _738 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_736)]);
                int _740 = _166 + 4;
                uint _742 = uint(int(uint(_740) >> uint(2)));
                float _744 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_742)]);
                int _746 = _166 + 8;
                uint _748 = uint(int(uint(_746) >> uint(2)));
                float _750 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_748)]);
                int _752 = _166 + 12;
                uint _754 = uint(int(uint(_752) >> uint(2)));
                float _756 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_754)]);
                uint _758 = uint(int(uint(_166) >> uint(2)));
                float _760 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_758)]);
                int _762 = _166 + 4;
                uint _764 = uint(int(uint(_762) >> uint(2)));
                float _766 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_764)]);
                int _768 = _166 + 8;
                uint _770 = uint(int(uint(_768) >> uint(2)));
                float _772 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_770)]);
                int _774 = _166 + 12;
                uint _776 = uint(int(uint(_774) >> uint(2)));
                float _778 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_776)]);
                uint _780 = uint(int(uint(_166) >> uint(2)));
                float _782 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_780)]);
                int _784 = _166 + 4;
                uint _786 = uint(int(uint(_784) >> uint(2)));
                float _788 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_786)]);
                int _790 = _166 + 8;
                uint _792 = uint(int(uint(_790) >> uint(2)));
                float _794 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_792)]);
                int _796 = _166 + 12;
                uint _798 = uint(int(uint(_796) >> uint(2)));
                float _800 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_798)]);
                float _802 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
                float _804 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
                float _806 = _750 * _760;
                float _808 = _750 * _766;
                float _810 = -_806;
                float _812 = fma(_738, _772, _810);
                float _814 = _756 * _772;
                float _816 = _756 * _766;
                float _818 = _756 * _760;
                float _820 = _744 * _760;
                float _822 = -_808;
                float _824 = fma(_744, _772, _822);
                float _826 = _788 * _812;
                float _828 = -_820;
                float _830 = fma(_738, _766, _828);
                float _832 = -_826;
                float _834 = fma(_782, _824, _832);
                float _836 = fma(_794, _830, _834);
                float _838 = _788 * _772;
                float _840 = -_816;
                float _842 = fma(_744, _778, _840);
                float _844 = 1.0 / _836;
                float _846 = -_818;
                float _848 = fma(_738, _778, _846);
                float _850 = -_838;
                float _852 = fma(_794, _766, _850);
                float _854 = _782 * _766;
                float _856 = _794 * _744;
                float _858 = _782 * _750;
                float _860 = -_814;
                float _862 = fma(_750, _778, _860);
                float _864 = _794 * _848;
                float _866 = _794 * _760;
                float _868 = -_856;
                float _870 = fma(_788, _750, _868);
                float _872 = -_738;
                float _874 = fma(_872, _772, _806);
                float _876 = -_858;
                float _878 = fma(_794, _738, _876);
                float _880 = _788 * _738;
                float _882 = _788 * _848;
                float _884 = -_864;
                float _886 = fma(_782, _862, _884);
                float _888 = -_866;
                float _890 = fma(_782, _772, _888);
                float _892 = -_854;
                float _894 = fma(_788, _760, _892);
                float _896 = -_880;
                float _898 = fma(_782, _744, _896);
                float _900 = -_882;
                float _902 = fma(_782, _842, _900);
                float _904 = fma(_800, _812, _886);
                float _906 = _794 * _842;
                float _908 = _890 * _844;
                float _910 = _852 * _844;
                float _912 = _894 * _844;
                float _914 = -_906;
                float _916 = fma(_788, _862, _914);
                float _918 = _734 * _908;
                float _920 = _734 * _910;
                float _922 = _874 * _844;
                float _924 = _802 * _844;
                float _926 = _734 * _912;
                float _928 = _870 * _844;
                float _930 = fma(_802, _922, _918);
                float _932 = fma(_824, _924, _920);
                float _934 = fma(_830, _924, _926);
                float _936 = _878 * _844;
                float _938 = _898 * _844;
                float _940 = fma(_800, _824, _916);
                float _942 = fma(_800, _830, _902);
                float _944 = fma(_804, _928, _932);
                float _946 = fma(_804, _936, _930);
                float _948 = fma(_804, _938, _934);
                float _950 = -_940;
                float _952 = fma(_950, _844, _944);
                float _954 = fma(_904, _844, _946);
                float _956 = -_942;
                float _958 = fma(_956, _844, _948);
                _700 = _802;
                _702 = _874;
                _704 = _842;
                _608 = _948;
                _610 = _930;
                _612 = _944;
                _614 = _918;
                _706 = _924;
                _708 = _940;
                _710 = _800;
                _712 = _958;
                _688 = _952;
                _714 = _954;
            }
        }
        float _960 = _700;
        float _962 = _702;
        float _964 = _704;
        float _966 = _608;
        float _968 = _610;
        float _970 = _612;
        float _972 = _614;
        float _974 = _706;
        float _976 = _708;
        float _978 = _710;
        float _980 = _712;
        float _982 = _688;
        float _984 = _714;
        bool _986 = !_672;
        float _988 = _960;
        float _990 = _972;
        float _992 = _974;
        float _994 = _976;
        float _996 = _978;
        float _998 = _966;
        float _1000 = _968;
        float _1002 = _970;
        float _1004 = _962;
        float _1006 = _964;
        if (!_986)
        {
            float _1008 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[48]);
            float _1010 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[49]);
            float _1012 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[50]);
            float _1014 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[51]);
            bool _1016 = !_186;
            _716 = _1012;
            _718 = _1008;
            _720 = _1010;
            _988 = _1014;
            if (!_1016)
            {
                float _1018 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
                float _1020 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
                float _1022 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
                float _1024 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
                float _1026 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[28]);
                float _1028 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[29]);
                float _1030 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[30]);
                float _1032 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[31]);
                float _1034 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
                float _1036 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
                float _1038 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
                float _1040 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
                float _1042 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
                float _1044 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
                float _1046 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
                float _1048 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
                float _1050 = _1024 * _1028;
                float _1052 = _1024 * _1030;
                float _1054 = _1024 * _1026;
                float _1056 = _1040 * _1022;
                float _1058 = _1040 * _1020;
                float _1060 = _1040 * _1018;
                float _1062 = _1040 * _1030;
                float _1064 = _1040 * _1028;
                float _1066 = _1040 * _1026;
                float _1068 = -_1050;
                float _1070 = fma(_1020, _1032, _1068);
                float _1072 = -_1056;
                float _1074 = fma(_1038, _1024, _1072);
                float _1076 = -_1058;
                float _1078 = fma(_1036, _1024, _1076);
                float _1080 = -_1060;
                float _1082 = fma(_1034, _1024, _1080);
                float _1084 = _1022 * _1028;
                float _1086 = _1022 * _1026;
                float _1088 = _1038 * _1028;
                float _1090 = _1038 * _1026;
                float _1092 = -_1052;
                float _1094 = fma(_1022, _1032, _1092);
                float _1096 = -_1054;
                float _1098 = fma(_1018, _1032, _1096);
                float _1100 = -_1062;
                float _1102 = fma(_1038, _1032, _1100);
                float _1104 = -_1064;
                float _1106 = fma(_1036, _1032, _1104);
                float _1108 = -_1066;
                float _1110 = fma(_1034, _1032, _1108);
                float _1112 = _1020 * _1026;
                float _1114 = -_1084;
                float _1116 = fma(_1020, _1030, _1114);
                float _1118 = -_1086;
                float _1120 = fma(_1018, _1030, _1118);
                float _1122 = -_1088;
                float _1124 = fma(_1036, _1030, _1122);
                float _1126 = -_1090;
                float _1128 = fma(_1034, _1030, _1126);
                float _1130 = _1038 * _1020;
                float _1132 = _1038 * _1018;
                float _1134 = -_1112;
                float _1136 = fma(_1018, _1028, _1134);
                float _1138 = _1036 * _1018;
                float _1140 = -_1130;
                float _1142 = fma(_1036, _1022, _1140);
                float _1144 = -_1132;
                float _1146 = fma(_1034, _1022, _1144);
                float _1148 = _1038 * _1098;
                float _1150 = -_1138;
                float _1152 = fma(_1034, _1020, _1150);
                float _1154 = _1038 * _1070;
                float _1156 = _1036 * _1026;
                float _1158 = -_1148;
                float _1160 = fma(_1034, _1094, _1158);
                float _1162 = _1036 * _1098;
                float _1164 = -_1154;
                float _1166 = fma(_1036, _1094, _1164);
                float _1168 = -_1156;
                float _1170 = fma(_1034, _1028, _1168);
                float _1172 = fma(_1040, _1120, _1160);
                float _1174 = _1036 * _1120;
                float _1176 = -_1162;
                float _1178 = fma(_1034, _1070, _1176);
                float _1180 = fma(_1040, _1116, _1166);
                float _1182 = _1044 * _1172;
                float _1184 = -_1174;
                float _1186 = fma(_1034, _1116, _1184);
                float _1188 = _1046 * _1070;
                float _1190 = fma(_1040, _1136, _1178);
                float _1192 = -_1182;
                float _1194 = fma(_1042, _1180, _1192);
                float _1196 = fma(_1038, _1136, _1186);
                float _1198 = -_1188;
                float _1200 = fma(_1044, _1094, _1198);
                float _1202 = _1046 * _1098;
                float _1204 = fma(_1046, _1190, _1194);
                float _1206 = _1044 * _1098;
                float _1208 = _1046 * _1078;
                float _1210 = -_1202;
                float _1212 = fma(_1042, _1094, _1210);
                float _1214 = -_1048;
                float _1216 = fma(_1214, _1196, _1204);
                float _1218 = _1046 * _1110;
                float _1220 = -_1206;
                float _1222 = fma(_1042, _1070, _1220);
                float _1224 = _1046 * _1106;
                float _1226 = 1.0 / _1216;
                float _1228 = -_1218;
                float _1230 = fma(_1042, _1102, _1228);
                float _1232 = _1046 * _1082;
                float _1234 = fma(_1048, _1116, _1200);
                float _1236 = _1044 * _1110;
                float _1238 = -_1208;
                float _1240 = fma(_1044, _1074, _1238);
                float _1242 = fma(_1048, _1136, _1222);
                float _1244 = _1044 * _1082;
                float _1246 = -_1232;
                float _1248 = fma(_1042, _1074, _1246);
                float _1250 = fma(_1048, _1120, _1212);
                float _1252 = -_1224;
                float _1254 = fma(_1044, _1102, _1252);
                float _1256 = -_1236;
                float _1258 = fma(_1042, _1106, _1256);
                float _1260 = -_1244;
                float _1262 = fma(_1042, _1078, _1260);
                float _1264 = fma(_1048, _1128, _1230);
                float _1266 = fma(_1048, _1124, _1254);
                float _1268 = fma(_1048, _1170, _1258);
                float _1270 = _1172 * _1226;
                float _1272 = _1234 * _1226;
                float _1274 = _1242 * _1226;
                float _1276 = _1250 * _1226;
                float _1278 = _1008 * _1270;
                float _1280 = _1180 * _1226;
                float _1282 = _1010 * _1272;
                float _1284 = _1190 * _1226;
                float _1286 = _1010 * _1274;
                float _1288 = -_1278;
                float _1290 = fma(_1010, _1276, _1288);
                float _1292 = -_1282;
                float _1294 = fma(_1008, _1280, _1292);
                float _1296 = _1266 * _1226;
                float _1298 = -_1286;
                float _1300 = fma(_1008, _1284, _1298);
                float _1302 = _1264 * _1226;
                float _1304 = _1268 * _1226;
                float _1306 = fma(_1048, _1142, _1240);
                float _1308 = fma(_1012, _1296, _1294);
                float _1310 = fma(_1048, _1146, _1248);
                float _1312 = fma(_1048, _1152, _1262);
                float _1314 = -_1302;
                float _1316 = fma(_1012, _1314, _1290);
                float _1318 = fma(_1012, _1304, _1300);
                float _1320 = -_1306;
                float _1322 = fma(_1320, _1226, _1308);
                float _1324 = fma(_1310, _1226, _1316);
                float _1326 = -_1312;
                float _1328 = fma(_1326, _1226, _1318);
                _716 = _1328;
                _718 = _1322;
                _720 = _1324;
                _988 = _1316;
                _990 = _1278;
                _992 = _1294;
                _994 = _1268;
                _996 = _1048;
                _998 = _1318;
                _1000 = _1272;
                _1002 = _1284;
                _1004 = _1170;
                _1006 = _1136;
                _1330 = true;
            }
            else
            {
                int _1332 = as_type<int>(_164) & 1024;
                bool _1334 = _1332 != 0;
                bool _1336 = !_1334;
                if (!_1336)
                {
                    float _1338 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
                    uint _1340 = uint(int(uint(_166) >> uint(2)));
                    float _1342 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_1340)]);
                    int _1344 = _166 + 4;
                    uint _1346 = uint(int(uint(_1344) >> uint(2)));
                    float _1348 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_1346)]);
                    int _1350 = _166 + 8;
                    uint _1352 = uint(int(uint(_1350) >> uint(2)));
                    float _1354 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_1352)]);
                    uint _1356 = uint(int(uint(_166) >> uint(2)));
                    float _1358 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1356)]);
                    int _1360 = _166 + 4;
                    uint _1362 = uint(int(uint(_1360) >> uint(2)));
                    float _1364 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1362)]);
                    int _1366 = _166 + 8;
                    uint _1368 = uint(int(uint(_1366) >> uint(2)));
                    float _1370 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1368)]);
                    uint _1372 = uint(int(uint(_166) >> uint(2)));
                    float _1374 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1372)]);
                    int _1376 = _166 + 4;
                    uint _1378 = uint(int(uint(_1376) >> uint(2)));
                    float _1380 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1378)]);
                    int _1382 = _166 + 8;
                    uint _1384 = uint(int(uint(_1382) >> uint(2)));
                    float _1386 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1384)]);
                    float _1388 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
                    float _1390 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
                    float _1392 = _1354 * _1358;
                    float _1394 = _1354 * _1364;
                    float _1396 = -_1392;
                    float _1398 = fma(_1342, _1370, _1396);
                    float _1400 = _1348 * _1358;
                    float _1402 = -_1394;
                    float _1404 = fma(_1348, _1370, _1402);
                    float _1406 = _1380 * _1398;
                    float _1408 = -_1400;
                    float _1410 = fma(_1342, _1364, _1408);
                    float _1412 = -_1406;
                    float _1414 = fma(_1374, _1404, _1412);
                    float _1416 = _1338 * _1370;
                    float _1418 = _1338 * _1364;
                    float _1420 = _1338 * _1358;
                    float _1422 = fma(_1386, _1410, _1414);
                    float _1424 = 1.0 / _1422;
                    float _1426 = _1386 * _1358;
                    float _1428 = _1380 * _1370;
                    float _1430 = -_1418;
                    float _1432 = fma(_1388, _1348, _1430);
                    float _1434 = -_1342;
                    float _1436 = fma(_1434, _1370, _1392);
                    float _1438 = _1374 * _1364;
                    float _1440 = -_1416;
                    float _1442 = fma(_1388, _1354, _1440);
                    float _1444 = -_1420;
                    float _1446 = fma(_1388, _1342, _1444);
                    float _1448 = _1374 * _1354;
                    float _1450 = -_1426;
                    float _1452 = fma(_1374, _1370, _1450);
                    float _1454 = -_1428;
                    float _1456 = fma(_1386, _1364, _1454);
                    float _1458 = _1380 * _1342;
                    float _1460 = -_1438;
                    float _1462 = fma(_1380, _1358, _1460);
                    float _1464 = -_1448;
                    float _1466 = fma(_1386, _1342, _1464);
                    float _1468 = _1386 * _1348;
                    float _1470 = _1386 * _1432;
                    float _1472 = _1456 * _1424;
                    float _1474 = _1452 * _1424;
                    float _1476 = -_1458;
                    float _1478 = fma(_1374, _1348, _1476);
                    float _1480 = _1462 * _1424;
                    float _1482 = _1386 * _1446;
                    float _1484 = -_1468;
                    float _1486 = fma(_1380, _1354, _1484);
                    float _1488 = _1380 * _1446;
                    float _1490 = -_1470;
                    float _1492 = fma(_1380, _1442, _1490);
                    float _1494 = _1472 * _1010;
                    float _1496 = _1474 * _1010;
                    float _1498 = _1480 * _1010;
                    float _1500 = _1436 * _1424;
                    float _1502 = _1404 * _1424;
                    float _1504 = _1410 * _1424;
                    float _1506 = -_1482;
                    float _1508 = fma(_1374, _1442, _1506);
                    float _1510 = fma(_1500, _1008, _1496);
                    float _1512 = fma(_1008, _1502, _1494);
                    float _1514 = fma(_1008, _1504, _1498);
                    float _1516 = _1466 * _1424;
                    float _1518 = _1486 * _1424;
                    float _1520 = _1478 * _1424;
                    float _1522 = -_1488;
                    float _1524 = fma(_1374, _1432, _1522);
                    float _1526 = fma(_1516, _1012, _1510);
                    float _1528 = fma(_1518, _1012, _1512);
                    float _1530 = fma(_1390, _1398, _1508);
                    float _1532 = fma(_1520, _1012, _1514);
                    float _1534 = fma(_1390, _1404, _1492);
                    float _1536 = fma(_1390, _1410, _1524);
                    float _1538 = fma(_1530, _1424, _1526);
                    float _1540 = -_1534;
                    float _1542 = fma(_1540, _1424, _1528);
                    float _1544 = -_1536;
                    float _1546 = fma(_1544, _1424, _1532);
                    _716 = _1546;
                    _718 = _1542;
                    _720 = _1538;
                    _988 = _1442;
                    _990 = _1534;
                    _992 = _1530;
                    _994 = _1504;
                    _996 = _1536;
                    _998 = _1528;
                    _1000 = _1502;
                    _1002 = _1432;
                    _1004 = _1424;
                    _1006 = _1448;
                    _1330 = true;
                }
                else
                {
                    int _1548 = as_type<int>(_164) & 2048;
                    bool _1550 = _1548 != 0;
                    bool _1552 = !_1550;
                    if (!_1552)
                    {
                        uint _1554 = uint(int(uint(_166) >> uint(2)));
                        float _1556 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_1554)]);
                        int _1558 = _166 + 4;
                        uint _1560 = uint(int(uint(_1558) >> uint(2)));
                        float _1562 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_1560)]);
                        int _1564 = _166 + 8;
                        uint _1566 = uint(int(uint(_1564) >> uint(2)));
                        float _1568 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_1566)]);
                        int _1570 = _166 + 12;
                        uint _1572 = uint(int(uint(_1570) >> uint(2)));
                        float _1574 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_1572)]);
                        uint _1576 = uint(int(uint(_166) >> uint(2)));
                        float _1578 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1576)]);
                        int _1580 = _166 + 4;
                        uint _1582 = uint(int(uint(_1580) >> uint(2)));
                        float _1584 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1582)]);
                        int _1586 = _166 + 8;
                        uint _1588 = uint(int(uint(_1586) >> uint(2)));
                        float _1590 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1588)]);
                        int _1592 = _166 + 12;
                        uint _1594 = uint(int(uint(_1592) >> uint(2)));
                        float _1596 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1594)]);
                        uint _1598 = uint(int(uint(_166) >> uint(2)));
                        float _1600 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1598)]);
                        int _1602 = _166 + 4;
                        uint _1604 = uint(int(uint(_1602) >> uint(2)));
                        float _1606 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1604)]);
                        int _1608 = _166 + 8;
                        uint _1610 = uint(int(uint(_1608) >> uint(2)));
                        float _1612 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1610)]);
                        int _1614 = _166 + 12;
                        uint _1616 = uint(int(uint(_1614) >> uint(2)));
                        float _1618 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1616)]);
                        float _1620 = _1568 * _1578;
                        float _1622 = _1568 * _1584;
                        float _1624 = _1562 * _1578;
                        float _1626 = _1574 * _1584;
                        float _1628 = -_1620;
                        float _1630 = fma(_1556, _1590, _1628);
                        float _1632 = -_1622;
                        float _1634 = fma(_1562, _1590, _1632);
                        float _1636 = -_1624;
                        float _1638 = fma(_1556, _1584, _1636);
                        float _1640 = _1606 * _1590;
                        float _1642 = _1606 * _1630;
                        float _1644 = _1600 * _1584;
                        float _1646 = _1574 * _1590;
                        float _1648 = -_1640;
                        float _1650 = fma(_1612, _1584, _1648);
                        float _1652 = -_1642;
                        float _1654 = fma(_1600, _1634, _1652);
                        float _1656 = _1612 * _1578;
                        float _1658 = _1574 * _1578;
                        float _1660 = -_1626;
                        float _1662 = fma(_1562, _1596, _1660);
                        float _1664 = fma(_1612, _1638, _1654);
                        float _1666 = -_1556;
                        float _1668 = fma(_1666, _1590, _1620);
                        float _1670 = -_1656;
                        float _1672 = fma(_1600, _1590, _1670);
                        float _1674 = -_1644;
                        float _1676 = fma(_1606, _1578, _1674);
                        float _1678 = -_1646;
                        float _1680 = fma(_1568, _1596, _1678);
                        float _1682 = -_1658;
                        float _1684 = fma(_1556, _1596, _1682);
                        float _1686 = 1.0 / _1664;
                        float _1688 = _1600 * _1568;
                        float _1690 = _1612 * _1562;
                        float _1692 = _1606 * _1556;
                        float _1694 = _1606 * _1684;
                        float _1696 = -_1688;
                        float _1698 = fma(_1612, _1556, _1696);
                        float _1700 = -_1690;
                        float _1702 = fma(_1606, _1568, _1700);
                        float _1704 = _1612 * _1662;
                        float _1706 = -_1692;
                        float _1708 = fma(_1600, _1562, _1706);
                        float _1710 = _1612 * _1684;
                        float _1712 = -_1694;
                        float _1714 = fma(_1600, _1662, _1712);
                        float _1716 = -_1704;
                        float _1718 = fma(_1606, _1680, _1716);
                        float _1720 = -_1710;
                        float _1722 = fma(_1600, _1680, _1720);
                        float _1724 = fma(_1618, _1638, _1714);
                        float _1726 = fma(_1618, _1634, _1718);
                        float _1728 = _1650 * _1686;
                        float _1730 = _1672 * _1686;
                        float _1732 = _1676 * _1686;
                        float _1734 = _1668 * _1686;
                        float _1736 = _1728 * _1010;
                        float _1738 = _1730 * _1010;
                        float _1740 = _1732 * _1010;
                        float _1742 = _1634 * _1686;
                        float _1744 = _1638 * _1686;
                        float _1746 = fma(_1734, _1008, _1738);
                        float _1748 = _1698 * _1686;
                        float _1750 = fma(_1008, _1742, _1736);
                        float _1752 = fma(_1008, _1744, _1740);
                        float _1754 = _1702 * _1686;
                        float _1756 = _1708 * _1686;
                        float _1758 = fma(_1748, _1012, _1746);
                        float _1760 = fma(_1618, _1630, _1722);
                        float _1762 = fma(_1754, _1012, _1750);
                        float _1764 = fma(_1756, _1012, _1752);
                        float _1766 = fma(_1760, _1686, _1758);
                        float _1768 = -_1726;
                        float _1770 = fma(_1768, _1686, _1762);
                        float _1772 = -_1724;
                        float _1774 = fma(_1772, _1686, _1764);
                        _716 = _1774;
                        _718 = _1770;
                        _720 = _1766;
                        _988 = _1762;
                        _990 = _1750;
                        _992 = _1606;
                        _994 = _1760;
                        _996 = _1618;
                        _998 = _1764;
                        _1000 = _1702;
                        _1002 = _1758;
                        _1004 = _1686;
                        _1006 = _1662;
                    }
                }
            }
        }
        _1330 = false;
        float _1776 = _716;
        float _1778 = _718;
        float _1780 = _720;
        float _1782 = _988;
        float _1784 = _990;
        float _1786 = _992;
        float _1788 = _994;
        float _1790 = _996;
        float _1792 = _998;
        float _1794 = _1000;
        float _1796 = _1002;
        float _1798 = _1004;
        float _1800 = _1006;
        float _1802 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[43]);
        float _1804 = _980 + _1776;
        float _1806 = _982 + _1778;
        float _1808 = _984 + _1780;
        float _1810 = -_592;
        float _1812 = _1804 + _1810;
        float _1814 = -_590;
        float _1816 = _1806 + _1814;
        float _1818 = -_584;
        float _1820 = _1808 + _1818;
        float _1822 = _282 * _1802;
        float _1824 = _532 * _1822;
        float _1826 = _1812 * _1822;
        float _1828 = _1816 * _1824;
        float _1830 = _1820 * _1824;
        float _1832 = _532 * _1826;
        _302 = _1778;
        _304 = _1780;
        _306 = _1812;
        _616 = _1782;
        _618 = _1784;
        _648 = _1786;
        _650 = _1788;
        _652 = _1790;
        _620 = _1802;
        _622 = _1792;
        _624 = _1794;
        _626 = _1796;
        _642 = _1830;
        _636 = _1828;
        _654 = _1832;
        _656 = _1798;
        _658 = _1800;
    }
    float _1834 = _302;
    float _1836 = _304;
    float _1838 = _306;
    float _1840 = _616;
    float _1842 = _618;
    float _1844 = _648;
    float _1846 = _650;
    float _1848 = _652;
    float _1850 = _620;
    float _1852 = _622;
    float _1854 = _624;
    float _1856 = _626;
    float _1858 = _642;
    float _1860 = _636;
    float _1862 = _654;
    float _1864 = _656;
    float _1866 = _658;
    float _1868 = _1834;
    float _1870 = _1836;
    float _1872 = _1838;
    float _1874 = _1840;
    float _1876 = _1864;
    float _1878 = _1866;
    if (_186)
    {
        float _1880 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _1882 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _1884 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _1886 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        _1868 = _1880;
        _1870 = _1882;
        _1872 = _1884;
        _1874 = _1886;
    }
    float _1888 = _1868;
    float _1890 = _1870;
    float _1892 = _1872;
    float _1894 = _1874;
    float _1896 = _1842;
    float _1898 = _1844;
    float _1900 = _1846;
    float _1902 = _1848;
    if (_186)
    {
        float _1904 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _1906 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _1908 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _1910 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        _1896 = _1904;
        _1898 = _1906;
        _1900 = _1908;
        _1902 = _1910;
    }
    float _1912 = _1896;
    float _1914 = _1898;
    float _1916 = _1900;
    float _1918 = _1902;
    float _1920 = _1850;
    float _1922 = _1852;
    float _1924 = _1854;
    float _1926 = _1856;
    if (_186)
    {
        float _1928 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _1930 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _1932 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _1934 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        _1920 = _1928;
        _1922 = _1930;
        _1924 = _1932;
        _1926 = _1934;
    }
    float _1936 = _1920;
    float _1938 = _1922;
    float _1940 = _1924;
    float _1942 = _1926;
    float _1944 = _1858 + _584;
    float _1946 = _1860 + _590;
    int _1948 = as_type<int>(_164) & 1024;
    bool _1950 = _1948 != 0;
    float _1952 = _1862 + _592;
    float _1954 = _1944;
    if (!_186)
    {
        _1876 = 0.0;
    }
    float _1956 = _1876;
    uint _1958 = uint(int(uint(_188) >> uint(2)));
    float _1960 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_1958)]);
    float _1962 = _1956;
    if (!_186)
    {
        _1878 = 0.0;
    }
    float _1964 = _1878;
    int _1966 = as_type<int>(_164) & 2048;
    bool _1968 = _1966 != 0;
    float _1970 = _1888;
    float _1972 = _1964;
    if (_186)
    {
        float _1974 = _1944 * _1890;
        _628 = _1974;
    }
    float _1976 = _628;
    float _1978 = _1976;
    if (_186)
    {
        float _1980 = fma(_1946, _1888, _1976);
        _1970 = _1980;
    }
    float _1982 = _1970;
    float _1984 = _1914;
    float _1986 = _1982;
    float _1988 = _1912;
    float _1990 = _1916;
    if (_186)
    {
        float _1992 = _1944 * _1914;
        _1984 = _1992;
    }
    float _1994 = _1984;
    float _1996 = _1994;
    if (_186)
    {
        float _1998 = _1944 * _1938;
        _1978 = _1998;
    }
    float _2000 = _1978;
    float _2002 = _2000;
    if (_186)
    {
        float _2004 = fma(_1946, _1912, _1994);
        _1996 = _2004;
    }
    float _2006 = _1996;
    if (_186)
    {
        float _2008 = fma(_1952, _1892, _1982);
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
        float _2016 = fma(_1946, _1936, _2000);
        _2002 = _2016;
    }
    float _2018 = _2002;
    float _2020 = _2018;
    if (_186)
    {
        float _2022 = fma(_1952, _1916, _2006);
        _1990 = _2022;
    }
    float _2024 = _1990;
    if (_186)
    {
        float _2026 = _2010 + _1894;
        _1962 = _2026;
    }
    float _2028 = _1962;
    float _2030 = _2028;
    if (_186)
    {
        float _2032 = fma(_1952, _1940, _2018);
        _2020 = _2032;
    }
    float _2034 = _2020;
    if (_186)
    {
        float _2036 = _2024 + _1918;
        _2014 = _2036;
    }
    float _2038 = _2014;
    float _2040 = _2038;
    if (_186)
    {
        float _2042 = _2034 + _1942;
        _1972 = _2042;
    }
    float _2044 = _1972;
    bool _2046 = !_1950;
    float _2048 = _2044;
    int _2050 = as_type<int>(_1960);
    if (!_2046)
    {
        float _2052 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        uint _2054 = uint(int(uint(_166) >> uint(2)));
        float _2056 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2054)]);
        int _2058 = _166 + 4;
        uint _2060 = uint(int(uint(_2058) >> uint(2)));
        float _2062 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2060)]);
        int _2064 = _166 + 8;
        uint _2066 = uint(int(uint(_2064) >> uint(2)));
        float _2068 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2066)]);
        uint _2070 = uint(int(uint(_166) >> uint(2)));
        float _2072 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_2070)]);
        int _2074 = _166 + 4;
        uint _2076 = uint(int(uint(_2074) >> uint(2)));
        float _2078 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_2076)]);
        int _2080 = _166 + 8;
        uint _2082 = uint(int(uint(_2080) >> uint(2)));
        float _2084 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_2082)]);
        uint _2086 = uint(int(uint(_166) >> uint(2)));
        float _2088 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2086)]);
        int _2090 = _166 + 4;
        uint _2092 = uint(int(uint(_2090) >> uint(2)));
        float _2094 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2092)]);
        int _2096 = _166 + 8;
        uint _2098 = uint(int(uint(_2096) >> uint(2)));
        float _2100 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2098)]);
        float _2102 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        float _2104 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        float _2106 = _2062 * _1944;
        float _2108 = _2078 * _1944;
        float _2110 = _2094 * _1944;
        float _2112 = fma(_2056, _1946, _2106);
        float _2114 = fma(_2072, _1946, _2108);
        float _2116 = fma(_2088, _1946, _2110);
        float _2118 = fma(_2068, _1952, _2112);
        float _2120 = fma(_2084, _1952, _2114);
        float _2122 = fma(_2100, _1952, _2116);
        float _2124 = _2052 + _2118;
        float _2126 = _2102 + _2120;
        float _2128 = _2104 + _2122;
        _2030 = _2124;
        _2048 = _2128;
        _2040 = _2126;
    }
    float _2130 = _2030;
    float _2132 = _2048;
    float _2134 = _2040;
    bool _2136 = !_1968;
    float _2138 = _2134;
    float _2140 = _2130;
    float _2142 = _2132;
    if (!_2136)
    {
        uint _2144 = uint(int(uint(_166) >> uint(2)));
        float _2146 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2144)]);
        int _2148 = _166 + 4;
        uint _2150 = uint(int(uint(_2148) >> uint(2)));
        float _2152 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2150)]);
        int _2154 = _166 + 8;
        uint _2156 = uint(int(uint(_2154) >> uint(2)));
        float _2158 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2156)]);
        int _2160 = _166 + 12;
        uint _2162 = uint(int(uint(_2160) >> uint(2)));
        float _2164 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2162)]);
        uint _2166 = uint(int(uint(_166) >> uint(2)));
        float _2168 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_2166)]);
        int _2170 = _166 + 4;
        uint _2172 = uint(int(uint(_2170) >> uint(2)));
        float _2174 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_2172)]);
        int _2176 = _166 + 8;
        uint _2178 = uint(int(uint(_2176) >> uint(2)));
        float _2180 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_2178)]);
        int _2182 = _166 + 12;
        uint _2184 = uint(int(uint(_2182) >> uint(2)));
        float _2186 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_2184)]);
        uint _2188 = uint(int(uint(_166) >> uint(2)));
        float _2190 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2188)]);
        int _2192 = _166 + 4;
        uint _2194 = uint(int(uint(_2192) >> uint(2)));
        float _2196 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2194)]);
        int _2198 = _166 + 8;
        uint _2200 = uint(int(uint(_2198) >> uint(2)));
        float _2202 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2200)]);
        int _2204 = _166 + 12;
        uint _2206 = uint(int(uint(_2204) >> uint(2)));
        float _2208 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2206)]);
        float _2210 = _2152 * _1944;
        float _2212 = _2174 * _1944;
        float _2214 = _2196 * _1944;
        float _2216 = fma(_2146, _1946, _2210);
        float _2218 = fma(_2168, _1946, _2212);
        float _2220 = fma(_2190, _1946, _2214);
        float _2222 = fma(_2158, _1952, _2216);
        float _2224 = fma(_2180, _1952, _2218);
        float _2226 = fma(_2202, _1952, _2220);
        float _2228 = _2164 + _2222;
        float _2230 = _2186 + _2224;
        float _2232 = _2208 + _2226;
        _2138 = _2230;
        _2140 = _2228;
        _2142 = _2232;
    }
    float _2234 = _2138;
    float _2236 = _2140;
    float _2238 = _2142;
    float _2240 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[70]);
    float _2242 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[504]);
    float _2244 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[505]);
    float _2246 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[506]);
    float _2248 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[507]);
    float _2250 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[501]);
    float _2252 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[8]);
    float _2254 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[9]);
    float _2256 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[10]);
    float _2258 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[11]);
    float _2260 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[61]);
    float _2262 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[60]);
    float _2264 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[502]);
    float _2266 = _2240 + 1.0;
    float _2268 = _2266 + _2234;
    float _2270 = _2268 * _2244;
    float _2272 = fma(_2242, _2236, _2270);
    float _2274 = fma(_2246, _2238, _2272);
    float _2276 = _2248 + _2274;
    float _2278 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[508]);
    float _2280 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[509]);
    float _2282 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[510]);
    float _2284 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[511]);
    float _2286 = trunc(_2276);
    int _2288 = int(_2286);
    int _2290 = ~as_type<int>(_2250);
    int _2292 = _2288 + _2290;
    int _2294 = _2292 + 1;
    bool _2296 = _2294 >= 0;
    int _2298 = as_type<int>(_164);
    if (_2296)
    {
        float _2300 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[500]);
        _2298 = as_type<int>(_2300);
    }
    int _2302 = _2298;
    float _2304 = fma(_2236, 6.2500002968590706586837768554688e-05, 0.5);
    float _2306 = fma(_2238, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _6724 = float2(_2304, _2306);
    float _2308 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_6724, float2(0.0), isnan(_6724)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_6724, float2(0.0), isnan(_6724)), level(0.0)).x;
    float _2310 = _2254 * _2234;
    float _2312 = fma(_2252, _2236, _2310);
    float _2314 = fma(_2256, _2238, _2312);
    float _2316 = _2258 + _2314;
    float _2318 = -_2316;
    bool _2320 = _2260 >= _2318;
    bool _2322 = isnan(_2260);
    bool _2324 = _2320 || _2322;
    bool _2326 = isnan(_2318);
    bool _2328 = _2324 || _2326;
    float _2330 = -_2316;
    bool _2332 = _2262 >= _2330;
    bool _2334 = isnan(_2262);
    bool _2336 = _2332 || _2334;
    bool _2338 = isnan(_2330);
    bool _2340 = _2336 || _2338;
    int _2342 = _2328 ? 0 : 1;
    int _2344 = 2;
    float _2346 = _2306;
    float _2348 = _2304;
    if (_2328)
    {
        _2344 = 1;
    }
    int _2350 = _2344;
    int _2352 = _2350;
    if (_2340)
    {
        _2352 = _2342;
    }
    int _2354 = _2352;
    int _2356 = _2354 << 6;
    int _2358 = _2356 + 96;
    uint _2360 = uint(int(uint(_2358) >> uint(2)));
    float _2362 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2360)]);
    int _2364 = _2358 + 4;
    uint _2366 = uint(int(uint(_2364) >> uint(2)));
    float _2368 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2366)]);
    int _2370 = _2358 + 8;
    uint _2372 = uint(int(uint(_2370) >> uint(2)));
    float _2374 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2372)]);
    int _2376 = _2358 + 12;
    uint _2378 = uint(int(uint(_2376) >> uint(2)));
    float _2380 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2378)]);
    int _2382 = _2356 + 48;
    uint _2384 = uint(int(uint(_2382) >> uint(2)));
    float _2386 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2384)]);
    int _2388 = _2382 + 4;
    uint _2390 = uint(int(uint(_2388) >> uint(2)));
    float _2392 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2390)]);
    int _2394 = _2382 + 8;
    uint _2396 = uint(int(uint(_2394) >> uint(2)));
    float _2398 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2396)]);
    int _2400 = _2382 + 12;
    uint _2402 = uint(int(uint(_2400) >> uint(2)));
    float _2404 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2402)]);
    float _2406 = _2268 * _2280;
    float _2408 = fma(_2278, _2236, _2406);
    float _2410 = fma(_2282, _2238, _2408);
    float _2412 = _2284 + _2410;
    int _2414 = _2356 + 64;
    float _2416 = trunc(_2412);
    int _2418 = int(_2416);
    uint _2420 = uint(int(uint(_2414) >> uint(2)));
    float _2422 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2420)]);
    int _2424 = _2414 + 4;
    uint _2426 = uint(int(uint(_2424) >> uint(2)));
    float _2428 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2426)]);
    int _2430 = _2414 + 8;
    uint _2432 = uint(int(uint(_2430) >> uint(2)));
    float _2434 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2432)]);
    int _2436 = _2414 + 12;
    uint _2438 = uint(int(uint(_2436) >> uint(2)));
    float _2440 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2438)]);
    int _2442 = _2356 + 80;
    bool _2444 = _2302 <= _2294;
    bool _2446 = !_2296;
    bool _2448 = _2444 || _2446;
    int _2450 = ~as_type<int>(_2264);
    int _2452 = _2418 + _2450;
    int _2454 = _2452 + 1;
    uint _2456 = uint(int(uint(_2442) >> uint(2)));
    float _2458 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2456)]);
    int _2460 = _2442 + 4;
    uint _2462 = uint(int(uint(_2460) >> uint(2)));
    float _2464 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2462)]);
    int _2466 = _2442 + 8;
    uint _2468 = uint(int(uint(_2466) >> uint(2)));
    float _2470 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2468)]);
    int _2472 = _2442 + 12;
    uint _2474 = uint(int(uint(_2472) >> uint(2)));
    float _2476 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2474)]);
    bool _2478 = _2454 < 0;
    bool _2480 = _2478 || _2448;
    int _2482 = as_type<int>(_2264);
    float _2484 = _2404;
    if (!_2480)
    {
        float _2486 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[500]);
        _2482 = as_type<int>(_2486);
    }
    int _2488 = _2482;
    float _2490 = _2268 * _2368;
    float _2492 = fma(_2362, _2236, _2490);
    float _2494 = fma(_2374, _2238, _2492);
    float _2496 = _2380 + _2494;
    float _2498 = _2268 * _2392;
    float _2500 = 1.0 / _2496;
    float _2502 = fma(_2386, _2236, _2498);
    float _2504 = fma(_2398, _2238, _2502);
    float _2506 = _2268 * _2428;
    float _2508 = fma(_2422, _2236, _2506);
    float _2510 = _2404 + _2504;
    float _2512 = fma(_2434, _2238, _2508);
    float _2514 = _2510 * _2500;
    float _2516 = _2440 + _2512;
    bool _2518 = _2514 >= 0.0;
    float _2520 = _2516 * _2500;
    bool _2522 = _2514 <= 1.0;
    bool _2524 = _2522 && _2518;
    bool _2526 = _2520 >= 0.0;
    bool _2528 = _2526 && _2524;
    bool _2530 = _2520 <= 1.0;
    bool _2532 = _2530 && _2528;
    float _2534 = _2268 * _2464;
    bool _2536 = _2488 <= _2454;
    bool _2538 = _2536 || _2480;
    float _2540 = fma(_2458, _2236, _2534);
    float _2542 = fma(_2470, _2238, _2540);
    float _2544 = _2422;
    float _2546 = _2458;
    float _2548 = _2476;
    float _2550 = _2520;
    if (_2532)
    {
        float _2552 = float(_2354);
        _2544 = _2552;
    }
    float _2554 = _2544;
    float _2556 = _2476 + _2542;
    if (_2538)
    {
        _2546 = 1.0;
    }
    float _2558 = _2546;
    float _2560 = _2558;
    if (!_2538)
    {
        float _2562 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[500]);
        int _2564 = _2454 * as_type<int>(_2562);
        int _2566 = _2564 + _2294;
        int _2568 = _2566 << 2;
        uint _2570 = uint(int(uint(_2566) >> uint(2)));
        int _2572 = 12 & _2568;
        int _2574 = int(_2570) << 4;
        int _2576 = _2574 + _2572;
        int _2578 = _2576 + 400;
        uint _2580 = uint(int(uint(_2578) >> uint(2)));
        float _2582 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2580)]);
        float _2584 = floor(_2412);
        float _2586 = floor(_2276);
        float _2588 = -_2584;
        float _2590 = _2412 + _2588;
        float _2592 = -_2586;
        float _2594 = _2276 + _2592;
        float _2596 = rint(_2582);
        float _2598 = precise::max(_2596, 0.0);
        uint _2600 = uint(_2598);
        uint _2602 = clamp(_2600, 0u, 65535u);
        float3 _7177 = float3(_2594, _2590, float(int(_2602)));
        float3 _7181 = select(_7177, float3(0.0), isnan(_7177));
        float _2604 = dm_bs(spvDescriptorSet0.cp_t_tcb_14.sample(spvDescriptorSet0.cp_t_tcb_14Smplr, _7181.xy, uint(rint(_7181.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_14, spvDescriptorSet0.cp_t_tcb_14Smplr_w, _7181.xy, uint(rint(_7181.z)), level(0.0)).x;
        int _2606 = _2566 << 4;
        int _2608 = _2606 + 2048;
        uint _2610 = uint(int(uint(_2608) >> uint(2)));
        float _2612 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2610)]);
        int _2614 = _2608 + 4;
        uint _2616 = uint(int(uint(_2614) >> uint(2)));
        float _2618 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2616)]);
        int _2620 = _2608 + 8;
        uint _2622 = uint(int(uint(_2620) >> uint(2)));
        float _2624 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2622)]);
        int _2626 = _2608 + 12;
        uint _2628 = uint(int(uint(_2626) >> uint(2)));
        float _2630 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2628)]);
        float _2632 = _2268 * _2618;
        float _2634 = fma(_2612, _2236, _2632);
        float _2636 = fma(_2624, _2238, _2634);
        float _2638 = _2630 + _2636;
        float _2640 = precise::clamp(_2638, 0.0, 1.0);
        float _2642 = -_2640;
        float _2644 = _2642 + _2604;
        float _2646 = fma(_2644, 500.0, 1.5);
        float _2648 = exp2(_2646);
        float _2650 = 0.0 + _2648;
        float _2652 = precise::clamp(_2650, 0.0, 1.0);
        _2484 = _2634;
        _2548 = 500.0;
        _2560 = _2652;
    }
    float _2654 = _2484;
    float _2656 = _2548;
    float _2658 = _2560;
    float _2660 = _2554;
    float _2662 = _2654;
    float _2664 = _2656;
    if (_2532)
    {
        float _2666 = rint(_2554);
        float _2668 = precise::max(_2666, 0.0);
        uint _2670 = uint(_2668);
        uint _2672 = clamp(_2670, 0u, 65535u);
        _2660 = as_type<float>(_2672);
    }
    float _2674 = _2660;
    float _2676 = _2556 * _2500;
    bool _2678 = _2308 != 0.0;
    bool _2680 = isnan(_2308);
    bool _2682 = _2678 || _2680;
    bool _2684 = isnan(0.0);
    bool _2686 = _2682 || _2684;
    uint _2688 = uint(int(uint(_166) >> uint(2)));
    float _2690 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_2688)]);
    float _2692 = fma(_2236, 6.2500002968590706586837768554688e-05, 0.4999375045299530029296875);
    float _2694 = fma(_2238, 6.2500002968590706586837768554688e-05, 0.4999375045299530029296875);
    float _2696 = fma(_2236, 6.2500002968590706586837768554688e-05, 0.500062525272369384765625);
    float _2698 = fma(_2238, 6.2500002968590706586837768554688e-05, 0.500062525272369384765625);
    float _2700 = _2674;
    float _2702 = _2696;
    float _2704 = _2692;
    if (_2532)
    {
        float3 _7323 = float3(_2514, _2520, float(as_type<int>(_2674)));
        float3 _7325 = select(_7323, float3(0.0), isnan(_7323));
        float _2706 = spvDepthCast(spvDescriptorSet0.cp_t_tcb_16).sample_compare(spvDescriptorSet0.cp_t_tcb_16Smplr, _7325.xy, uint(rint(_7325.z)), _2676, level(0.0));
        _2700 = _2706;
    }
    float _2708 = _2700;
    if (!_2686)
    {
        _2662 = 4.0;
    }
    float _2710 = _2662;
    float _2712 = _2308;
    float _2714 = _2710;
    if (!_2686)
    {
        float2 _7345 = float2(_2304, _2306);
        float _2716 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_7345, float2(0.0), isnan(_7345)), level(_2710)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_7345, float2(0.0), isnan(_7345)), level(_2710)).x;
        _2712 = _2716;
    }
    float _2718 = _2712;
    float2 _7357 = float2(_2692, _2306);
    float _2720 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_7357, float2(0.0), isnan(_7357)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_7357, float2(0.0), isnan(_7357)), level(0.0)).x;
    float2 _7365 = float2(_2304, _2694);
    float _2722 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_7365, float2(0.0), isnan(_7365)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_7365, float2(0.0), isnan(_7365)), level(0.0)).x;
    float2 _7373 = float2(_2696, _2306);
    float _2724 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_7373, float2(0.0), isnan(_7373)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_7373, float2(0.0), isnan(_7373)), level(0.0)).x;
    float2 _7381 = float2(_2304, _2698);
    float _2726 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_7381, float2(0.0), isnan(_7381)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_7381, float2(0.0), isnan(_7381)), level(0.0)).x;
    if (!_2532)
    {
        _2664 = 1.0;
    }
    float _2728 = _2664;
    bool _2730 = _604 > 0.001000000047497451305389404296875;
    bool _2732 = isnan(_604);
    bool _2734 = _2730 || _2732;
    bool _2736 = isnan(0.001000000047497451305389404296875);
    bool _2738 = _2734 || _2736;
    float _2740 = _2728;
    float _2742 = _2722;
    if (_2532)
    {
        bool _2744 = _2708 >= _2676;
        bool _2746 = isnan(_2708);
        bool _2748 = _2744 || _2746;
        bool _2750 = isnan(_2676);
        bool _2752 = _2748 || _2750;
        float _2754 = float(_2752);
        _2740 = _2754;
    }
    float _2756 = _2740;
    float _2758 = -_2756;
    float _2760 = fma(_2758, _2658, 1.0);
    float _2762 = -_2690;
    float _2764 = _2760 + _2762;
    float _2766 = _2760;
    if (_2738)
    {
        float _2768 = fma(_2764, 0.0500000007450580596923828125, _2690);
        _2766 = _2768;
    }
    float _2770 = _2766;
    float _2772 = precise::max(0.0, _2770);
    float _2774 = precise::min(_2772, 0.999000012874603271484375);
    uint _2776 = uint(int(uint(_166) >> uint(2)));
    (*spvDescriptorSet0.cp_s12)._m0[int(_2776)] = as_type<uint>(_2774);
    float _2778 = _2514;
    if (!_2738)
    {
        float _2780 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[76]);
        _2778 = _2780;
    }
    float _2782 = _2778;
    int _2784 = _166 + 4;
    float _2786 = _2782;
    if (!_2738)
    {
        float _2788 = fma(_2718, 2000.0, _2782);
        _2786 = _2788;
    }
    float _2790 = _2786;
    float _2792 = _2790;
    if (!_2738)
    {
        uint _2794 = uint(int(uint(_2784) >> uint(2)));
        (*spvDescriptorSet0.cp_s12)._m0[int(_2794)] = as_type<uint>(_2790);
    }
    float _2796 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[76]);
    uint _2798 = uint(int(uint(_2784) >> uint(2)));
    float _2800 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_2798)]);
    float _2802 = fma(_2718, 2000.0, _2796);
    float _2804 = _1944 + _2800;
    bool _2806 = _2804 >= _2802;
    bool _2808 = isnan(_2804);
    bool _2810 = _2806 || _2808;
    bool _2812 = isnan(_2802);
    bool _2814 = _2810 || _2812;
    float _2816 = _2804;
    int _2818 = as_type<int>(_2800);
    float _2820 = _2802;
    if (!_2814)
    {
        float _2822 = -_2800;
        float _2824 = _2802 + _2822;
        _2816 = _2824;
    }
    float _2826 = _2816;
    if (!_2814)
    {
        float _2828 = fma(_2826, 0.00999999977648258209228515625, _2800);
        _2818 = as_type<int>(_2828);
    }
    int _2830 = _2818;
    if (_2814)
    {
        _2714 = _586;
    }
    float _2832 = _2714;
    float _2834 = _2832;
    if (!_2814)
    {
        uint _2836 = uint(int(uint(_2784) >> uint(2)));
        (*spvDescriptorSet0.cp_s12)._m0[int(_2836)] = uint(_2830);
    }
    if (!_2738)
    {
        bool _2838 = _2720 != 0.0;
        bool _2840 = isnan(_2720);
        bool _2842 = _2838 || _2840;
        bool _2844 = isnan(0.0);
        bool _2846 = _2842 || _2844;
        bool _2848 = _2724 != 0.0;
        bool _2850 = isnan(_2724);
        bool _2852 = _2848 || _2850;
        bool _2854 = isnan(0.0);
        bool _2856 = _2852 || _2854;
        float2 _7597 = float2(_2692, _2694);
        float _2858 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_7597, float2(0.0), isnan(_7597)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_7597, float2(0.0), isnan(_7597)), level(0.0)).x;
        float2 _7605 = float2(_2692, _2698);
        float _2860 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_7605, float2(0.0), isnan(_7605)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_7605, float2(0.0), isnan(_7605)), level(0.0)).x;
        float _2862 = _2306;
        float _2864 = _2306;
        if (_2846)
        {
            _2820 = _2720;
        }
        float _2866 = _2820;
        if (_2856)
        {
            _2550 = _2724;
        }
        float _2868 = _2550;
        float2 _7625 = float2(_2696, _2694);
        float _2870 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_7625, float2(0.0), isnan(_7625)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_7625, float2(0.0), isnan(_7625)), level(0.0)).x;
        float2 _7633 = float2(_2696, _2698);
        float _2872 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_7633, float2(0.0), isnan(_7633)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_7633, float2(0.0), isnan(_7633)), level(0.0)).x;
        if (!_2846)
        {
            _2346 = 4.0;
        }
        float _2874 = _2346;
        float _2876 = _2874;
        if (!_2856)
        {
            _2792 = 4.0;
        }
        float _2878 = _2792;
        float _2880 = _2866;
        float _2882 = _2878;
        if (!_2846)
        {
            float2 _7657 = float2(_2692, _2306);
            float _2884 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_7657, float2(0.0), isnan(_7657)), level(_2874)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_7657, float2(0.0), isnan(_7657)), level(_2874)).x;
            _2880 = _2884;
        }
        float _2886 = _2880;
        float _2888 = _2868;
        if (!_2856)
        {
            float2 _7673 = float2(_2696, _2306);
            float _2890 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_7673, float2(0.0), isnan(_7673)), level(_2878)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_7673, float2(0.0), isnan(_7673)), level(_2878)).x;
            _2888 = _2890;
        }
        float _2892 = _2888;
        bool _2894 = _2722 != 0.0;
        bool _2896 = isnan(_2722);
        bool _2898 = _2894 || _2896;
        bool _2900 = isnan(0.0);
        bool _2902 = _2898 || _2900;
        bool _2904 = _2726 != 0.0;
        bool _2906 = isnan(_2726);
        bool _2908 = _2904 || _2906;
        bool _2910 = isnan(0.0);
        bool _2912 = _2908 || _2910;
        float _2914 = _2860;
        float _2916 = _2858;
        float _2918 = _2870;
        float _2920 = _2872;
        if (_2902)
        {
            _2882 = _2722;
        }
        float _2922 = _2882;
        if (_2912)
        {
            _2876 = _2726;
        }
        float _2924 = _2876;
        if (!_2902)
        {
            _2702 = 4.0;
        }
        float _2926 = _2702;
        if (!_2912)
        {
            _2862 = 4.0;
        }
        float _2928 = _2862;
        bool _2930 = _2858 != 0.0;
        bool _2932 = isnan(_2858);
        bool _2934 = _2930 || _2932;
        bool _2936 = isnan(0.0);
        bool _2938 = _2934 || _2936;
        bool _2940 = _2860 != 0.0;
        bool _2942 = isnan(_2860);
        bool _2944 = _2940 || _2942;
        bool _2946 = isnan(0.0);
        bool _2948 = _2944 || _2946;
        bool _2950 = _2870 != 0.0;
        bool _2952 = isnan(_2870);
        bool _2954 = _2950 || _2952;
        bool _2956 = isnan(0.0);
        bool _2958 = _2954 || _2956;
        bool _2960 = _2872 != 0.0;
        bool _2962 = isnan(_2872);
        bool _2964 = _2960 || _2962;
        bool _2966 = isnan(0.0);
        bool _2968 = _2964 || _2966;
        if (_2938)
        {
            _2348 = _2858;
        }
        float _2970 = _2348;
        if (_2948)
        {
            _2864 = _2860;
        }
        float _2972 = _2864;
        if (!_2938)
        {
            _2742 = 4.0;
        }
        float _2974 = _2742;
        if (!_2948)
        {
            _2914 = 4.0;
        }
        float _2976 = _2914;
        if (_2958)
        {
            _2704 = _2870;
        }
        float _2978 = _2704;
        if (_2968)
        {
            _2916 = _2872;
        }
        float _2980 = _2916;
        if (!_2958)
        {
            _2918 = 4.0;
        }
        float _2982 = _2918;
        float _2984 = _2970;
        if (!_2938)
        {
            float2 _7814 = float2(_2692, _2694);
            float _2986 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_7814, float2(0.0), isnan(_7814)), level(_2974)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_7814, float2(0.0), isnan(_7814)), level(_2974)).x;
            _2984 = _2986;
        }
        float _2988 = _2984;
        float _2990 = _2972;
        if (!_2948)
        {
            float2 _7830 = float2(_2692, _2698);
            float _2992 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_7830, float2(0.0), isnan(_7830)), level(_2976)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_7830, float2(0.0), isnan(_7830)), level(_2976)).x;
            _2990 = _2992;
        }
        float _2994 = _2990;
        if (!_2968)
        {
            _2920 = 4.0;
        }
        float _2996 = _2920;
        float _2998 = _2978;
        if (!_2958)
        {
            float2 _7851 = float2(_2696, _2694);
            float _3000 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_7851, float2(0.0), isnan(_7851)), level(_2982)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_7851, float2(0.0), isnan(_7851)), level(_2982)).x;
            _2998 = _3000;
        }
        float _3002 = _2998;
        float _3004 = _2980;
        if (!_2968)
        {
            float2 _7867 = float2(_2696, _2698);
            float _3006 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_7867, float2(0.0), isnan(_7867)), level(_2996)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_7867, float2(0.0), isnan(_7867)), level(_2996)).x;
            _3004 = _3006;
        }
        float _3008 = _3004;
        float _3010 = _2922;
        if (!_2902)
        {
            float2 _7883 = float2(_2304, _2694);
            float _3012 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_7883, float2(0.0), isnan(_7883)), level(_2926)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_7883, float2(0.0), isnan(_7883)), level(_2926)).x;
            _3010 = _3012;
        }
        float _3014 = _3010;
        float _3016 = _2924;
        if (!_2912)
        {
            float2 _7899 = float2(_2304, _2698);
            float _3018 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_7899, float2(0.0), isnan(_7899)), level(_2928)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_7899, float2(0.0), isnan(_7899)), level(_2928)).x;
            _3016 = _3018;
        }
        float _3020 = _3016;
        float _3022 = -_2886;
        float _3024 = _2718 + _3022;
        float _3026 = -_2892;
        float _3028 = _2718 + _3026;
        float _3030 = abs(_3024);
        float _3032 = abs(_3028);
        float _3034 = precise::max(_3030, _3032);
        float _3036 = -_2988;
        float _3038 = _2718 + _3036;
        float _3040 = -_2994;
        float _3042 = _2718 + _3040;
        float _3044 = -_3002;
        float _3046 = _2718 + _3044;
        float _3048 = -_3008;
        float _3050 = _2718 + _3048;
        float _3052 = -_3014;
        float _3054 = _2718 + _3052;
        float _3056 = -_3020;
        float _3058 = _2718 + _3056;
        float _3060 = abs(_3038);
        float _3062 = abs(_3042);
        float _3064 = precise::max(_3060, _3062);
        float _3066 = abs(_3046);
        float _3068 = abs(_3050);
        float _3070 = precise::max(_3066, _3068);
        float _3072 = abs(_3054);
        float _3074 = abs(_3058);
        float _3076 = precise::max(_3072, _3074);
        float _3078 = precise::max(_3064, _3070);
        float _3080 = precise::max(_3034, _3076);
        bool _3082 = _3078 > 0.00150000001303851604461669921875;
        bool _3084 = _3080 > 0.00150000001303851604461669921875;
        bool _3086 = _3084 || _3082;
        bool _3088 = !_3086;
        int _3090 = _3088 ? as_type<int>(_1960) : 0;
        _2050 = _3090;
    }
    int _3092 = _2050;
    if (!_2814)
    {
        float _3094 = _1944 * 0.9900000095367431640625;
        _1954 = _3094;
    }
    float _3096 = _1954;
    int _3098 = _166 + 8;
    uint _3100 = uint(int(uint(_188) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_3100)] = uint(_3092);
    if (!_2814)
    {
        _2834 = 0.0;
    }
    float _3102 = _2834;
    float _3104 = -_170;
    float _3106 = _3104 + _1946;
    uint _3108 = uint(int(uint(_166) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_3108)] = as_type<uint>(_1946);
    float _3110 = -_176;
    float _3112 = _3110 + _3096;
    float _3114 = -_182;
    float _3116 = _3114 + _1952;
    uint _3118 = uint(int(uint(_2784) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_3118)] = as_type<uint>(_3096);
    uint _3120 = uint(int(uint(_3098) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_3120)] = as_type<uint>(_1952);
    uint _3122 = uint(int(uint(_166) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_3122)] = as_type<uint>(_588);
    uint _3124 = uint(int(uint(_2784) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_3124)] = as_type<uint>(_3102);
    uint _3126 = uint(int(uint(_3098) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_3126)] = as_type<uint>(_594);
    uint _3128 = uint(int(uint(_166) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_3128)] = as_type<uint>(_3106);
    uint _3130 = uint(int(uint(_2784) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_3130)] = as_type<uint>(_3112);
    uint _3132 = uint(int(uint(_3098) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_3132)] = as_type<uint>(_3116);
    float _3134 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _3136 = _3112 * _3112;
    float _3138 = _3102 * _3102;
    float _3140 = fma(_3106, _3106, _3136);
    float _3142 = fma(_588, _588, _3138);
    float _3144 = fma(_3116, _3116, _3140);
    float _3146 = fma(_594, _594, _3142);
    float _3148 = sqrt(_3144);
    float _3150 = sqrt(_3146);
    bool _3152 = _3148 >= 9.9999999747524270787835121154785e-07;
    bool _3154 = isnan(_3148);
    bool _3156 = _3152 || _3154;
    bool _3158 = isnan(9.9999999747524270787835121154785e-07);
    bool _3160 = _3156 || _3158;
    if (!_3160)
    {
        bool _3162 = _536 != _278;
        bool _3164 = isnan(_536);
        bool _3166 = _3162 || _3164;
        bool _3168 = isnan(_278);
        bool _3170 = _3166 || _3168;
        _3172 = _3170;
        if (!_3172)
        {
            float _3174 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
            bool _3176 = _3174 > 0.0;
            bool _3178 = !_3176;
            if (!_3178)
            {
                float _3180 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
                float _3182 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
                float _3184 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
                float _3186 = _3182 * _502;
                float _3188 = _3182 * _500;
                float _3190 = _3182 * _504;
                float _3192 = fma(_3180, _506, _3186);
                float _3194 = fma(_3180, _508, _3188);
                float _3196 = fma(_3180, _510, _3190);
                float _3198 = fma(_3184, _512, _3192);
                float _3200 = fma(_3184, _514, _3194);
                float _3202 = fma(_3184, _516, _3196);
                float _3204 = _3198 * _3198;
                float _3206 = fma(_3200, _3200, _3204);
                float _3208 = fma(_3202, _3202, _3206);
                float _3210 = rsqrt(_3208);
                float _3212 = _3210 * 9.9999999747524270787835121154785e-07;
                float _3214 = _3200 * _3212;
                float _3216 = _3198 * _3212;
                float _3218 = _3202 * _3212;
                _320 = as_type<int>(_3214);
                _322 = as_type<int>(_3216);
                _324 = as_type<int>(_3218);
                _3172 = true;
            }
            else
            {
                bool _3220 = _3150 >= 9.9999999747524270787835121154785e-07;
                bool _3222 = isnan(_3150);
                bool _3224 = _3220 || _3222;
                bool _3226 = isnan(9.9999999747524270787835121154785e-07);
                bool _3228 = _3224 || _3226;
                if (!_3228)
                {
                    float _3230 = _3096 * _3096;
                    float _3232 = fma(_1946, _1946, _3230);
                    float _3234 = fma(_1952, _1952, _3232);
                    float _3236 = sqrt(_3234);
                    bool _3238 = _3236 >= 9.9999999747524270787835121154785e-07;
                    bool _3240 = isnan(_3236);
                    bool _3242 = _3238 || _3240;
                    bool _3244 = isnan(9.9999999747524270787835121154785e-07);
                    bool _3246 = _3242 || _3244;
                    float _3248 = _3236;
                    if (_3246)
                    {
                        float _3250 = rsqrt(_3234);
                        _3248 = _3250;
                    }
                    float _3252 = _3248;
                    if (!_3246)
                    {
                        _308 = 0;
                    }
                    int _3254 = _308;
                    int _3256 = _3254;
                    if (!_3246)
                    {
                        _310 = 897988541;
                    }
                    int _3258 = _310;
                    int _3260 = _3258;
                    if (!_3246)
                    {
                        _312 = 0;
                    }
                    int _3262 = _312;
                    float _3264 = _3252;
                    int _3266 = _3262;
                    if (_3246)
                    {
                        float _3268 = _3252 * 9.9999999747524270787835121154785e-07;
                        _3264 = _3268;
                    }
                    float _3270 = _3264;
                    if (_3246)
                    {
                        float _3272 = _1946 * _3270;
                        _3256 = as_type<int>(_3272);
                    }
                    int _3274 = _3256;
                    _320 = _3274;
                    if (_3246)
                    {
                        float _3276 = _3096 * _3270;
                        _3260 = as_type<int>(_3276);
                    }
                    int _3278 = _3260;
                    _322 = _3278;
                    if (_3246)
                    {
                        float _3280 = _1952 * _3270;
                        _3266 = as_type<int>(_3280);
                    }
                    int _3282 = _3266;
                    _324 = _3282;
                    _3172 = true;
                }
                else
                {
                    float _3284 = rsqrt(_3146);
                    float _3286 = _3284 * 9.9999999747524270787835121154785e-07;
                    float _3288 = _588 * _3286;
                    float _3290 = _3102 * _3286;
                    float _3292 = _594 * _3286;
                    _320 = as_type<int>(_3288);
                    _322 = as_type<int>(_3290);
                    _324 = as_type<int>(_3292);
                    _3172 = true;
                }
            }
        }
    }
    else
    {
        float _3294 = _3150 * _3134;
        bool _3296 = _3294 >= 0.001000000047497451305389404296875;
        bool _3298 = isnan(_3294);
        bool _3300 = _3296 || _3298;
        bool _3302 = isnan(0.001000000047497451305389404296875);
        bool _3304 = _3300 || _3302;
        bool _3306 = _3294 > 0.0;
        bool _3308 = !_3304;
        bool _3310 = _3306 && _3308;
        bool _3312 = _3148 < 0.001000000047497451305389404296875;
        bool _3314 = _3312 && _3310;
        if (!_3314)
        {
            _314 = as_type<int>(_3106);
        }
        int _3316 = _314;
        int _3318 = _3316;
        if (_3314)
        {
            float _3320 = _588 * _3134;
            _3318 = as_type<int>(_3320);
        }
        int _3322 = _3318;
        _320 = _3322;
        if (!_3314)
        {
            _316 = as_type<int>(_3112);
        }
        int _3324 = _316;
        int _3326 = _3324;
        if (_3314)
        {
            float _3328 = _3134 * _3102;
            _3326 = as_type<int>(_3328);
        }
        int _3330 = _3326;
        _322 = _3330;
        if (!_3314)
        {
            _318 = as_type<int>(_3116);
        }
        int _3332 = _318;
        _324 = _3332;
        if (_3314)
        {
            float _3334 = _594 * _3134;
            _324 = as_type<int>(_3334);
        }
    }
    _3172 = false;
    int _3336 = _320;
    int _3338 = _322;
    int _3340 = _324;
    uint _3342 = uint(int(uint(_166) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_3342)] = uint(_3336);
    uint _3344 = uint(int(uint(_2784) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_3344)] = uint(_3338);
    uint _3346 = uint(int(uint(_3098) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_3346)] = uint(_3340);
}

