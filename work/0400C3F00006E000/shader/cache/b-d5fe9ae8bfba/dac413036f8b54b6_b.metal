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
    texture3d<float> cp_t_tcb_12 [[id(14)]];
    sampler cp_t_tcb_12Smplr [[id(15)]];
    texture2d_array<float> cp_t_tcb_16 [[id(16)]];
    sampler cp_t_tcb_16Smplr [[id(17)]];
    texture2d_array<float> cp_t_tcb_14 [[id(18)]];
    sampler cp_t_tcb_14Smplr [[id(19)]];
    sampler cp_t_tcb_12Smplr_w [[id(20)]];
    sampler cp_t_tcb_14Smplr_w [[id(21)]];
    constant dm_border_t* dm_border [[id(22)]];
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]])
{
    bool _2742 = false;
    bool _1608 = false;
    bool _1190 = false;
    bool _702 = false;
    float _78 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[9]);
    float _80 = as_type<float>(gl_LocalInvocationID.x);
    float _82 = as_type<float>(gl_WorkGroupID.x);
    int _85 = as_type<int>(_82) << 5;
    int _87 = _85 + as_type<int>(_80);
    float _89 = trunc(_78);
    int _91 = int(_89);
    bool _95 = _87 >= _91;
    int _97 = 0;
    float _99 = as_type<float>(_91);
    if (_95)
    {
        _97 = 0;
    }
    int _101 = _97;
    int _103 = _101;
    int _105 = _101;
    float _107 = 0.0;
    if (!_95)
    {
        int _109 = _87 << 4;
        int _111 = _109 + 12;
        uint _114 = uint(int(uint(_111) >> uint(2)));
        float _116 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_114)]);
        float _118 = trunc(_116);
        int _120 = int(_118);
        bool _122 = _120 >= 1;
        int _124 = _122 ? (-1) : 0;
        _99 = as_type<float>(_111);
        _107 = as_type<float>(_120);
        if (!_122)
        {
            _103 = 0;
        }
        int _126 = _103;
        bool _128 = !_122;
        _105 = _126;
        if (!_128)
        {
            float _130 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
            uint _132 = uint(int(uint(_111) >> uint(2)));
            float _134 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_132)]);
            float _136 = float(_120);
            float _138 = -_134;
            float _140 = _130 + _138;
            bool _142 = _140 > _136;
            int _144 = as_type<int>(_130);
            _99 = _134;
            _107 = _136;
            if (!_142)
            {
                bool _146 = _130 >= _134;
                bool _148 = isnan(_130);
                bool _150 = _146 || _148;
                bool _152 = isnan(_134);
                bool _154 = _150 || _152;
                _124 = _154 ? (-1) : 0;
            }
            int _156 = _124;
            if (_142)
            {
                _144 = 0;
            }
            int _158 = _144;
            _105 = _158;
            if (!_142)
            {
                int _160 = ~_156;
                int _162 = (_160 != 0) ? 0 : 1;
                _105 = _162;
            }
        }
    }
    int _164 = _105;
    float _166 = _99;
    float _168 = _107;
    int _170 = _164 & 1;
    bool _172 = _170 != 0;
    if (!_172)
    {
        return;
    }
    float _174 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _176 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[30]);
    float _178 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
    float _180 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
    float _182 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
    float _184 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
    float _186 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
    float _188 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[68]);
    int _190 = as_type<int>(_176) & 512;
    bool _192 = _190 != 0;
    float _194 = 0.0;
    float _196 = 0.0;
    float _198 = 0.0;
    float _200 = _176;
    if (_192)
    {
        float _202 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[32]);
        float _204 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[33]);
        float _206 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[34]);
        _194 = _202;
        _196 = _204;
        _198 = _206;
    }
    float _208 = _194;
    float _210 = _196;
    float _212 = _198;
    float _214 = 0.0;
    float _216 = 0.0;
    float _218 = 0.0;
    if (_192)
    {
        float _220 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[36]);
        float _222 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[37]);
        float _224 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[38]);
        _214 = _220;
        _216 = _222;
        _218 = _224;
    }
    float _226 = _214;
    float _228 = _216;
    float _230 = _218;
    float _232 = as_type<float>(_164);
    float _234 = _166;
    float _236 = _168;
    if (_192)
    {
        float _238 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[40]);
        float _240 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[41]);
        float _242 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[42]);
        _232 = _238;
        _234 = _240;
        _236 = _242;
    }
    float _244 = _232;
    float _246 = _234;
    float _248 = _236;
    int _250 = _87 << 4;
    int _252 = _250 + 12;
    uint _254 = uint(int(uint(_250) >> uint(2)));
    float _256 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_254)]);
    int _258 = _250 + 4;
    uint _260 = uint(int(uint(_258) >> uint(2)));
    float _262 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_260)]);
    int _264 = _250 + 8;
    uint _266 = uint(int(uint(_264) >> uint(2)));
    float _268 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_266)]);
    uint _270 = uint(int(uint(_250) >> uint(2)));
    float _272 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_270)]);
    int _274 = _250 + 4;
    uint _276 = uint(int(uint(_274) >> uint(2)));
    float _278 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_276)]);
    int _280 = _250 + 8;
    uint _282 = uint(int(uint(_280) >> uint(2)));
    float _284 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_282)]);
    uint _286 = uint(int(uint(_250) >> uint(2)));
    float _288 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_286)]);
    int _290 = _250 + 4;
    uint _292 = uint(int(uint(_290) >> uint(2)));
    float _294 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_292)]);
    int _296 = _250 + 8;
    uint _298 = uint(int(uint(_296) >> uint(2)));
    float _300 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_298)]);
    uint _302 = uint(int(uint(_250) >> uint(2)));
    float _304 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_302)]);
    uint _306 = uint(int(uint(_252) >> uint(2)));
    float _308 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_306)]);
    uint _310 = uint(int(uint(_252) >> uint(2)));
    float _312 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_310)]);
    float _314 = _226;
    float _316 = _228;
    float _318 = _208;
    float _320 = _230;
    float _322 = _210;
    float _324 = _244;
    float _326 = _212;
    float _328 = _246;
    float _330 = _248;
    float _332 = 0.0;
    float _334 = _184;
    float _336 = _188;
    int _338 = as_type<int>(_272);
    int _340 = as_type<int>(_278);
    int _342 = as_type<int>(_284);
    int _344 = as_type<int>(_272);
    int _346 = as_type<int>(_278);
    int _348 = as_type<int>(_284);
    int _350 = as_type<int>(_272);
    int _352 = as_type<int>(_278);
    int _354 = as_type<int>(_284);
    if (!_192)
    {
        int _356 = _250 + 4;
        uint _358 = uint(int(uint(_250) >> uint(2)));
        float _360 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_358)]);
        int _362 = _250 + 8;
        uint _364 = uint(int(uint(_250) >> uint(2)));
        float _366 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_364)]);
        uint _368 = uint(int(uint(_356) >> uint(2)));
        float _370 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_368)]);
        uint _372 = uint(int(uint(_356) >> uint(2)));
        float _374 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_372)]);
        uint _376 = uint(int(uint(_362) >> uint(2)));
        float _378 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_376)]);
        uint _380 = uint(int(uint(_250) >> uint(2)));
        float _382 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_380)]);
        uint _384 = uint(int(uint(_362) >> uint(2)));
        float _386 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_384)]);
        uint _388 = uint(int(uint(_356) >> uint(2)));
        float _390 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_388)]);
        uint _392 = uint(int(uint(_362) >> uint(2)));
        float _394 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_392)]);
        float _396 = _360 * _360;
        float _398 = fma(_366, _366, _396);
        float _400 = _370 * _370;
        float _402 = fma(_374, _374, _400);
        float _404 = _378 * _378;
        float _406 = fma(_382, _382, _398);
        float _408 = fma(_386, _386, _404);
        float _410 = sqrt(_406);
        float _412 = fma(_390, _390, _402);
        float _414 = fma(_394, _394, _408);
        float _416 = sqrt(_412);
        float _418 = sqrt(_414);
        bool _420 = _410 > 0.0;
        bool _422 = _416 > 0.0;
        bool _424 = _418 > 0.0;
        float _426 = _416;
        float _428 = _418;
        float _430 = _408;
        float _432 = _360;
        float _434 = _410;
        float _436 = _366;
        float _438 = _402;
        float _440 = _370;
        float _442 = _390;
        float _444 = _382;
        _334 = _412;
        if (_420)
        {
            float _446 = rsqrt(_406);
            _426 = _446;
        }
        float _448 = _426;
        float _450 = 0.0;
        if (_422)
        {
            float _452 = rsqrt(_412);
            _450 = _452;
        }
        float _454 = _450;
        float _456 = 0.0;
        if (_424)
        {
            float _458 = rsqrt(_414);
            _456 = _458;
        }
        float _460 = _456;
        if (!_420)
        {
            _428 = 0.0;
        }
        float _462 = _428;
        float _464 = _462;
        if (_420)
        {
            float _466 = _360 * _448;
            _464 = _466;
        }
        float _468 = _464;
        _314 = _468;
        if (!_420)
        {
            _430 = 0.0;
        }
        float _470 = _430;
        float _472 = _470;
        if (_420)
        {
            float _474 = _366 * _448;
            _472 = _474;
        }
        float _476 = _472;
        _318 = _476;
        if (!_420)
        {
            _432 = 0.0;
        }
        float _478 = _432;
        float _480 = _478;
        if (_420)
        {
            float _482 = _382 * _448;
            _480 = _482;
        }
        float _484 = _480;
        _324 = _484;
        if (!_422)
        {
            _434 = 0.0;
        }
        float _486 = _434;
        float _488 = _486;
        _332 = _454;
        if (_422)
        {
            float _490 = _370 * _454;
            _488 = _490;
        }
        float _492 = _488;
        _316 = _492;
        if (!_422)
        {
            _436 = 0.0;
        }
        float _494 = _436;
        float _496 = _494;
        if (_422)
        {
            float _498 = _390 * _454;
            _496 = _498;
        }
        float _500 = _496;
        _328 = _500;
        if (!_422)
        {
            _438 = 0.0;
        }
        float _502 = _438;
        float _504 = _502;
        if (_422)
        {
            float _506 = _374 * _454;
            _504 = _506;
        }
        float _508 = _504;
        _322 = _508;
        if (!_424)
        {
            _440 = 0.0;
        }
        float _510 = _440;
        float _512 = _510;
        if (!_424)
        {
            _442 = 0.0;
        }
        float _514 = _442;
        float _516 = _514;
        if (_424)
        {
            float _518 = _378 * _460;
            _512 = _518;
        }
        float _520 = _512;
        _320 = _520;
        if (!_424)
        {
            _444 = 0.0;
        }
        float _522 = _444;
        _330 = _522;
        if (_424)
        {
            float _524 = _386 * _460;
            _516 = _524;
        }
        float _526 = _516;
        _326 = _526;
        if (_424)
        {
            float _528 = _394 * _460;
            _330 = _528;
        }
    }
    float _530 = _314;
    float _532 = _316;
    float _534 = _318;
    float _536 = _320;
    float _538 = _322;
    float _540 = _324;
    float _542 = _326;
    float _544 = _328;
    float _546 = _330;
    float _548 = _332;
    float _550 = _334;
    float _552 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
    float _554 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[65]);
    float _556 = abs(_188);
    float _558 = log2(_556);
    float _560 = _180 * _186;
    float _562 = _178 * _186;
    float _564 = _308 * _174;
    float _566 = _560 * _530;
    float _568 = _560 * _532;
    float _570 = _182 * _186;
    float _572 = _174 * _558;
    float _574 = exp2(_572);
    float _576 = fma(_562, _534, _566);
    float _578 = _560 * _536;
    float _580 = fma(_562, _538, _568);
    float _582 = fma(_570, _540, _576);
    float _584 = fma(_562, _542, _578);
    float _586 = fma(_570, _544, _580);
    float _588 = _174 * _582;
    float _590 = fma(_570, _546, _584);
    float _592 = _174 * _586;
    float _594 = _174 * _590;
    float _596 = fma(_288, _574, _588);
    float _598 = fma(_300, _564, _268);
    float _600 = fma(_294, _574, _592);
    float _602 = fma(_300, _574, _594);
    bool _604 = _554 > 0.0;
    float _606 = fma(_288, _564, _256);
    float _608 = fma(_294, _564, _262);
    float _610 = -_312;
    float _612 = _552 + _610;
    float _614 = _564;
    float _616 = _548;
    float _618 = _550;
    bool _620 = _604;
    float _622 = _596;
    if (!_604)
    {
        _614 = _606;
    }
    float _624 = _614;
    float _626 = _624;
    float _628 = _624;
    if (!_604)
    {
        _616 = _608;
    }
    float _630 = _616;
    float _632 = _630;
    float _634 = _630;
    if (!_604)
    {
        _618 = _598;
    }
    float _636 = _618;
    bool _638 = !_604;
    float _640 = _636;
    float _642 = _636;
    float _644 = 0.0;
    float _646 = 0.0;
    float _648 = 0.0;
    float _650 = 0.0;
    if (!_638)
    {
        bool _652 = !_192;
        if (!_652)
        {
            float _654 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
            float _656 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
            float _658 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
            float _660 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
            float _662 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
            float _664 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
            float _666 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
            float _668 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
            float _670 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
            float _672 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
            float _674 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
            float _676 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
            float _678 = _608 * _656;
            float _680 = _608 * _664;
            float _682 = fma(_606, _654, _678);
            float _684 = _608 * _672;
            float _686 = fma(_606, _662, _680);
            float _688 = fma(_598, _658, _682);
            float _690 = fma(_606, _670, _684);
            float _692 = fma(_598, _666, _686);
            float _694 = _660 + _688;
            float _696 = fma(_598, _674, _690);
            float _698 = _668 + _692;
            float _700 = _676 + _696;
            _628 = _694;
            _642 = _700;
            _634 = _698;
            _644 = _654;
            _646 = _656;
            _648 = _658;
            _650 = _660;
            _702 = true;
        }
        else
        {
            int _704 = as_type<int>(_176) & 1024;
            bool _706 = _704 != 0;
            bool _708 = !_706;
            if (!_708)
            {
                float _710 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
                uint _712 = uint(int(uint(_250) >> uint(2)));
                float _714 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_712)]);
                int _716 = _250 + 4;
                uint _718 = uint(int(uint(_716) >> uint(2)));
                float _720 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_718)]);
                int _722 = _250 + 8;
                uint _724 = uint(int(uint(_722) >> uint(2)));
                float _726 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_724)]);
                int _728 = _250 + 12;
                uint _730 = uint(int(uint(_728) >> uint(2)));
                float _732 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_730)]);
                uint _734 = uint(int(uint(_250) >> uint(2)));
                float _736 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_734)]);
                int _738 = _250 + 4;
                uint _740 = uint(int(uint(_738) >> uint(2)));
                float _742 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_740)]);
                int _744 = _250 + 8;
                uint _746 = uint(int(uint(_744) >> uint(2)));
                float _748 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_746)]);
                uint _750 = uint(int(uint(_250) >> uint(2)));
                float _752 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_750)]);
                int _754 = _250 + 4;
                uint _756 = uint(int(uint(_754) >> uint(2)));
                float _758 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_756)]);
                int _760 = _250 + 8;
                uint _762 = uint(int(uint(_760) >> uint(2)));
                float _764 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_762)]);
                float _766 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
                float _768 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
                float _770 = _608 * _720;
                float _772 = _608 * _742;
                float _774 = _608 * _758;
                float _776 = fma(_606, _714, _770);
                float _778 = fma(_606, _736, _772);
                float _780 = fma(_606, _752, _774);
                float _782 = fma(_598, _726, _776);
                float _784 = fma(_598, _748, _778);
                float _786 = fma(_598, _764, _780);
                float _788 = _710 + _782;
                float _790 = _766 + _784;
                float _792 = _768 + _786;
                _628 = _788;
                _642 = _792;
                _634 = _790;
                _644 = _714;
                _646 = _720;
                _648 = _726;
                _650 = _732;
                _702 = true;
            }
            else
            {
                int _794 = as_type<int>(_176) & 2048;
                bool _796 = _794 != 0;
                if (!_796)
                {
                    _626 = _606;
                }
                float _798 = _626;
                _628 = _798;
                if (!_796)
                {
                    _632 = _608;
                }
                float _800 = _632;
                _634 = _800;
                if (!_796)
                {
                    _640 = _598;
                }
                float _802 = _640;
                bool _804 = !_796;
                _642 = _802;
                _644 = 0.0;
                _646 = 0.0;
                _648 = 0.0;
                _650 = 0.0;
                if (!_804)
                {
                    uint _806 = uint(int(uint(_250) >> uint(2)));
                    float _808 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_806)]);
                    int _810 = _250 + 4;
                    uint _812 = uint(int(uint(_810) >> uint(2)));
                    float _814 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_812)]);
                    int _816 = _250 + 8;
                    uint _818 = uint(int(uint(_816) >> uint(2)));
                    float _820 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_818)]);
                    int _822 = _250 + 12;
                    uint _824 = uint(int(uint(_822) >> uint(2)));
                    float _826 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_824)]);
                    uint _828 = uint(int(uint(_250) >> uint(2)));
                    float _830 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_828)]);
                    int _832 = _250 + 4;
                    uint _834 = uint(int(uint(_832) >> uint(2)));
                    float _836 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_834)]);
                    int _838 = _250 + 8;
                    uint _840 = uint(int(uint(_838) >> uint(2)));
                    float _842 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_840)]);
                    int _844 = _250 + 12;
                    uint _846 = uint(int(uint(_844) >> uint(2)));
                    float _848 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_846)]);
                    uint _850 = uint(int(uint(_250) >> uint(2)));
                    float _852 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_850)]);
                    int _854 = _250 + 4;
                    uint _856 = uint(int(uint(_854) >> uint(2)));
                    float _858 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_856)]);
                    int _860 = _250 + 8;
                    uint _862 = uint(int(uint(_860) >> uint(2)));
                    float _864 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_862)]);
                    int _866 = _250 + 12;
                    uint _868 = uint(int(uint(_866) >> uint(2)));
                    float _870 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_868)]);
                    float _872 = _608 * _814;
                    float _874 = _608 * _836;
                    float _876 = _608 * _858;
                    float _878 = fma(_606, _808, _872);
                    float _880 = fma(_606, _830, _874);
                    float _882 = fma(_606, _852, _876);
                    float _884 = fma(_598, _820, _878);
                    float _886 = fma(_598, _842, _880);
                    float _888 = fma(_598, _864, _882);
                    float _890 = _884 + _826;
                    float _892 = _886 + _848;
                    float _894 = _888 + _870;
                    _628 = _890;
                    _642 = _894;
                    _634 = _892;
                    _644 = _808;
                    _646 = _814;
                    _648 = _820;
                    _650 = _826;
                }
            }
        }
    }
    _702 = false;
    float _896 = _628;
    float _898 = _642;
    float _900 = _634;
    float _902 = _644;
    float _904 = _646;
    float _906 = _648;
    float _908 = _650;
    float _910 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[64]);
    float _912 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[60]);
    float _914 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[62]);
    float _916 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[61]);
    float _918 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[59]);
    float _920 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[63]);
    bool _922 = _910 != 0.0;
    bool _924 = isnan(_910);
    bool _926 = _922 || _924;
    bool _928 = isnan(0.0);
    bool _930 = _926 || _928;
    float _932 = _552 * _912;
    float _934 = _552 * _914;
    float _936 = _552 * _916;
    float _938 = fma(_918, _896, _932);
    float _940 = fma(_918, _898, _934);
    float _942 = fma(_918, _900, _936);
    float _944 = _920;
    float _946 = _900;
    float _948 = _902;
    float _950 = _904;
    float _952 = _906;
    float _954 = _908;
    if (_930)
    {
        float _956 = _304 * _920;
        _944 = _956;
    }
    float _958 = _944;
    float _960 = _942 + _958;
    float _962 = -_958;
    bool _964 = _938 >= _962;
    bool _966 = isnan(_938);
    bool _968 = _964 || _966;
    bool _970 = isnan(_962);
    bool _972 = _968 || _970;
    float _974 = _938 + _958;
    float _976 = -_958;
    bool _978 = _940 >= _976;
    bool _980 = isnan(_940);
    bool _982 = _978 || _980;
    bool _984 = isnan(_976);
    bool _986 = _982 || _984;
    float _988 = _940 + _958;
    float _990 = -_958;
    bool _992 = _942 >= _990;
    bool _994 = isnan(_942);
    bool _996 = _992 || _994;
    bool _998 = isnan(_990);
    bool _1000 = _996 || _998;
    bool _1002 = !_972;
    float _1004 = -_974;
    float _1006 = _1002 ? _1004 : _974;
    bool _1008 = !_986;
    float _1010 = -_988;
    float _1012 = _1008 ? _1010 : _988;
    bool _1014 = !_1000;
    float _1016 = -_960;
    float _1018 = _1014 ? _1016 : _960;
    float _1020 = _1006 * 0.03125;
    float _1022 = _1012 * 0.03125;
    float _1024 = _1018 * 0.03125;
    float3 _4387 = float3(_1020, _1024, _1022);
    float3 _1028 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, select(_4387, float3(0.0), isnan(_4387)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, select(_4387, float3(0.0), isnan(_4387)), level(0.0)).xyz;
    float _1030 = _1028.x;
    float _1032 = _1028.y;
    float _1034 = _1028.z;
    float _1036 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[57]);
    float _1038 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[56]);
    float _1040 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[58]);
    float _1042 = _1032 + (-0.5);
    float _1044 = _1030 + (-0.5);
    float _1046 = _1034 + (-0.5);
    float _1048 = _1042 * _1036;
    float _1050 = _1044 * _1038;
    float _1052 = _1046 * _1040;
    float _1054 = _1050;
    float _1056 = _1052;
    float _1058 = _1040;
    if (!_604)
    {
        _336 = _1048;
    }
    float _1060 = _336;
    bool _1062 = !_604;
    float _1064 = _1060;
    float _1066 = _1060;
    if (!_1062)
    {
        bool _1068 = !_192;
        if (!_1068)
        {
            float _1070 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
            float _1072 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
            float _1074 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
            float _1076 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
            float _1078 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
            float _1080 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
            float _1082 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
            float _1084 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
            float _1086 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
            float _1088 = _1074 * _1076;
            float _1090 = _1074 * _1078;
            float _1092 = _1072 * _1076;
            float _1094 = -_1088;
            float _1096 = fma(_1070, _1080, _1094);
            float _1098 = -_1090;
            float _1100 = fma(_1072, _1080, _1098);
            float _1102 = -_1092;
            float _1104 = fma(_1070, _1078, _1102);
            float _1106 = _1084 * _1070;
            float _1108 = _1084 * _1096;
            float _1110 = _1086 * _1072;
            float _1112 = _1082 * _1078;
            float _1114 = -_1106;
            float _1116 = fma(_1082, _1072, _1114);
            float _1118 = -_1108;
            float _1120 = fma(_1082, _1100, _1118);
            float _1122 = _1084 * _1080;
            float _1124 = _1086 * _1076;
            float _1126 = _1082 * _1074;
            float _1128 = fma(_1086, _1104, _1120);
            float _1130 = -_1122;
            float _1132 = fma(_1086, _1078, _1130);
            float _1134 = -_1124;
            float _1136 = fma(_1082, _1080, _1134);
            float _1138 = -_1112;
            float _1140 = fma(_1084, _1076, _1138);
            float _1142 = 1.0 / _1128;
            float _1144 = -_1126;
            float _1146 = fma(_1086, _1070, _1144);
            float _1148 = -_1070;
            float _1150 = fma(_1148, _1080, _1088);
            float _1152 = -_1110;
            float _1154 = fma(_1084, _1074, _1152);
            float _1156 = _1132 * _1142;
            float _1158 = _1136 * _1142;
            float _1160 = _1140 * _1142;
            float _1162 = _1150 * _1142;
            float _1164 = _1048 * _1156;
            float _1166 = _1048 * _1158;
            float _1168 = _1050 * _1142;
            float _1170 = _1048 * _1160;
            float _1172 = _1154 * _1142;
            float _1174 = _1146 * _1142;
            float _1176 = fma(_1100, _1168, _1164);
            float _1178 = fma(_1050, _1162, _1166);
            float _1180 = _1116 * _1142;
            float _1182 = fma(_1104, _1168, _1170);
            float _1184 = fma(_1052, _1172, _1176);
            float _1186 = fma(_1052, _1174, _1178);
            float _1188 = fma(_1052, _1180, _1182);
            _1054 = _1184;
            _1066 = _1186;
            _1056 = _1188;
            _1058 = _1172;
            _946 = _1182;
            _948 = _1166;
            _950 = _1084;
            _952 = _1086;
            _954 = _1116;
            _1190 = true;
        }
        else
        {
            int _1192 = as_type<int>(_176) & 1024;
            bool _1194 = _1192 != 0;
            if (_1194)
            {
                _620 = true;
            }
            bool _1196 = _620;
            bool _1198 = _1196;
            if (!_1194)
            {
                int _1200 = as_type<int>(_176) & 2048;
                bool _1202 = _1200 != 0;
                _1198 = _1202;
            }
            bool _1204 = _1198;
            if (!_1204)
            {
                _1064 = _1048;
            }
            float _1206 = _1064;
            bool _1208 = !_1204;
            _1066 = _1206;
            if (!_1208)
            {
                uint _1210 = uint(int(uint(_250) >> uint(2)));
                float _1212 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1210)]);
                int _1214 = _250 + 4;
                uint _1216 = uint(int(uint(_1214) >> uint(2)));
                float _1218 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1216)]);
                int _1220 = _250 + 8;
                uint _1222 = uint(int(uint(_1220) >> uint(2)));
                float _1224 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1222)]);
                uint _1226 = uint(int(uint(_250) >> uint(2)));
                float _1228 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1226)]);
                int _1230 = _250 + 4;
                uint _1232 = uint(int(uint(_1230) >> uint(2)));
                float _1234 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1232)]);
                int _1236 = _250 + 8;
                uint _1238 = uint(int(uint(_1236) >> uint(2)));
                float _1240 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1238)]);
                uint _1242 = uint(int(uint(_250) >> uint(2)));
                float _1244 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1242)]);
                int _1246 = _250 + 4;
                uint _1248 = uint(int(uint(_1246) >> uint(2)));
                float _1250 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1248)]);
                int _1252 = _250 + 8;
                uint _1254 = uint(int(uint(_1252) >> uint(2)));
                float _1256 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1254)]);
                float _1258 = _1224 * _1228;
                float _1260 = _1224 * _1234;
                float _1262 = _1218 * _1228;
                float _1264 = -_1258;
                float _1266 = fma(_1212, _1240, _1264);
                float _1268 = -_1260;
                float _1270 = fma(_1218, _1240, _1268);
                float _1272 = -_1262;
                float _1274 = fma(_1212, _1234, _1272);
                float _1276 = _1250 * _1212;
                float _1278 = _1250 * _1266;
                float _1280 = _1256 * _1218;
                float _1282 = _1244 * _1234;
                float _1284 = -_1276;
                float _1286 = fma(_1244, _1218, _1284);
                float _1288 = -_1278;
                float _1290 = fma(_1244, _1270, _1288);
                float _1292 = _1250 * _1240;
                float _1294 = _1256 * _1228;
                float _1296 = _1244 * _1224;
                float _1298 = fma(_1256, _1274, _1290);
                float _1300 = -_1292;
                float _1302 = fma(_1256, _1234, _1300);
                float _1304 = -_1294;
                float _1306 = fma(_1244, _1240, _1304);
                float _1308 = -_1282;
                float _1310 = fma(_1250, _1228, _1308);
                float _1312 = 1.0 / _1298;
                float _1314 = -_1296;
                float _1316 = fma(_1256, _1212, _1314);
                float _1318 = -_1212;
                float _1320 = fma(_1318, _1240, _1258);
                float _1322 = -_1280;
                float _1324 = fma(_1250, _1224, _1322);
                float _1326 = _1302 * _1312;
                float _1328 = _1306 * _1312;
                float _1330 = _1310 * _1312;
                float _1332 = _1320 * _1312;
                float _1334 = _1048 * _1326;
                float _1336 = _1048 * _1328;
                float _1338 = _1050 * _1312;
                float _1340 = _1048 * _1330;
                float _1342 = _1324 * _1312;
                float _1344 = _1316 * _1312;
                float _1346 = fma(_1270, _1338, _1334);
                float _1348 = fma(_1050, _1332, _1336);
                float _1350 = _1286 * _1312;
                float _1352 = fma(_1274, _1338, _1340);
                float _1354 = fma(_1052, _1342, _1346);
                float _1356 = fma(_1052, _1344, _1348);
                float _1358 = fma(_1052, _1350, _1352);
                _1054 = _1354;
                _1066 = _1356;
                _1056 = _1358;
                _1058 = _1342;
                _946 = _1352;
                _948 = _1336;
                _950 = _1250;
                _952 = _1256;
                _954 = _1286;
            }
        }
    }
    _1190 = false;
    float _1360 = _1054;
    float _1362 = _1066;
    float _1364 = _1056;
    float _1366 = _1058;
    float _1368 = _946;
    float _1370 = _948;
    float _1372 = _950;
    float _1374 = _952;
    float _1376 = _954;
    float _1378 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[86]);
    float _1380 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[85]);
    float _1382 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[84]);
    float _1384 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[128]);
    float _1386 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[129]);
    float _1388 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[130]);
    float _1390 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[131]);
    uint _1392 = uint(int(uint(_252) >> uint(2)));
    float _1394 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_1392)]);
    float _1396 = fma(_174, _1360, _596);
    float _1398 = fma(_174, _1362, _600);
    float _1400 = fma(_174, _1364, _602);
    bool _1402 = _1378 > 0.0;
    bool _1404 = _1380 > 0.0;
    float _1406 = _1382 * _1380;
    float _1408 = _174 * _1384;
    float _1410 = _1366;
    float _1412 = _1382;
    float _1414 = _1368;
    bool _1416 = _1404;
    float _1418 = _1408;
    float _1420 = _1386;
    float _1422 = _1390;
    float _1424 = _1370;
    float _1426 = _1372;
    float _1428 = _1374;
    float _1430 = _1376;
    float _1432 = _1362;
    float _1434 = _1406;
    if (_1402)
    {
        float _1436 = 1.0 / _1378;
        _1410 = _1436;
    }
    float _1438 = _1410;
    float _1440 = _174 * _1388;
    float _1442 = _1440;
    if (_1404)
    {
        float _1444 = -_1406;
        float _1446 = fma(_304, _1444, _1382);
        _1412 = _1446;
    }
    float _1448 = _1412;
    float _1450 = _174 * _1386;
    float _1452 = _1438;
    float _1454 = _1448;
    float _1456 = _1450;
    if (_1402)
    {
        float _1458 = _612 * _1438;
        _1414 = _1458;
    }
    float _1460 = _1414;
    if (_1402)
    {
        float _1462 = precise::min(_1460, 1.0);
        _1452 = _1462;
    }
    float _1464 = _1452;
    if (_1402)
    {
        float _1466 = _1464 * _1448;
        _1454 = _1466;
    }
    float _1468 = _1454;
    float _1470 = _1408 * _1468;
    float _1472 = _1450 * _1468;
    float _1474 = _1440 * _1468;
    bool _1476 = !_192;
    float _1478 = _1468;
    float _1480 = _1470;
    float _1482 = _1474;
    float _1606;
    if (!_1476)
    {
        float _1484 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _1486 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _1488 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _1490 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _1492 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _1494 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _1496 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _1498 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _1500 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _1502 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        float _1504 = _1488 * _1490;
        float _1506 = _1488 * _1492;
        float _1508 = _1486 * _1490;
        float _1510 = -_1504;
        float _1512 = fma(_1484, _1494, _1510);
        float _1514 = -_1506;
        float _1516 = fma(_1486, _1494, _1514);
        float _1518 = _1500 * _1486;
        float _1520 = _1500 * _1490;
        float _1522 = _1498 * _1512;
        float _1524 = -_1508;
        float _1526 = fma(_1484, _1492, _1524);
        float _1528 = _1498 * _1484;
        float _1530 = _1496 * _1492;
        float _1532 = -_1522;
        float _1534 = fma(_1496, _1516, _1532);
        float _1536 = -_1520;
        float _1538 = fma(_1496, _1494, _1536);
        float _1540 = -_1528;
        float _1542 = fma(_1496, _1486, _1540);
        float _1544 = _1498 * _1494;
        float _1546 = fma(_1500, _1526, _1534);
        float _1548 = -_1518;
        float _1550 = fma(_1498, _1488, _1548);
        float _1552 = _1496 * _1488;
        float _1554 = -_1544;
        float _1556 = fma(_1500, _1492, _1554);
        float _1558 = 1.0 / _1546;
        float _1560 = -_1530;
        float _1562 = fma(_1498, _1490, _1560);
        float _1564 = -_1552;
        float _1566 = fma(_1500, _1484, _1564);
        float _1568 = -_1484;
        float _1570 = fma(_1568, _1494, _1504);
        float _1572 = _1556 * _1558;
        float _1574 = _1538 * _1558;
        float _1576 = _1562 * _1558;
        float _1578 = _1570 * _1558;
        float _1580 = _1572 * _1472;
        float _1582 = _1574 * _1472;
        float _1584 = _1470 * _1558;
        float _1586 = _1576 * _1472;
        float _1588 = _1550 * _1558;
        float _1590 = _1566 * _1558;
        float _1592 = fma(_1516, _1584, _1580);
        float _1594 = fma(_1578, _1470, _1582);
        float _1596 = _1542 * _1558;
        float _1598 = fma(_1526, _1584, _1586);
        float _1600 = fma(_1588, _1474, _1592);
        float _1602 = fma(_1590, _1474, _1594);
        float _1604 = fma(_1596, _1474, _1598);
        _1418 = _1592;
        _1420 = _1586;
        _1442 = _1594;
        _1422 = _1578;
        _1424 = _1576;
        _1426 = _1562;
        _1428 = _1500;
        _1430 = _1502;
        _1456 = _1598;
        _1432 = _1492;
        _622 = _1494;
        _200 = _1588;
        _1606 = _1602;
        _1480 = _1600;
        _1482 = _1604;
        _1434 = _1516;
        _1608 = true;
    }
    else
    {
        int _1610 = as_type<int>(_176) & 1024;
        bool _1612 = _1610 != 0;
        if (_1612)
        {
            _1416 = true;
        }
        bool _1614 = _1416;
        bool _1616 = _1614;
        if (!_1612)
        {
            int _1618 = as_type<int>(_176) & 2048;
            bool _1620 = _1618 != 0;
            _1616 = _1620;
        }
        bool _1622 = _1616;
        if (!_1622)
        {
            _1478 = _1472;
        }
        float _1624 = _1478;
        bool _1626 = !_1622;
        _1606 = _1624;
        if (!_1626)
        {
            uint _1628 = uint(int(uint(_250) >> uint(2)));
            float _1630 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1628)]);
            int _1632 = _250 + 4;
            uint _1634 = uint(int(uint(_1632) >> uint(2)));
            float _1636 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1634)]);
            int _1638 = _250 + 8;
            uint _1640 = uint(int(uint(_1638) >> uint(2)));
            float _1642 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1640)]);
            uint _1644 = uint(int(uint(_250) >> uint(2)));
            float _1646 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1644)]);
            int _1648 = _250 + 4;
            uint _1650 = uint(int(uint(_1648) >> uint(2)));
            float _1652 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1650)]);
            int _1654 = _250 + 8;
            uint _1656 = uint(int(uint(_1654) >> uint(2)));
            float _1658 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1656)]);
            uint _1660 = uint(int(uint(_250) >> uint(2)));
            float _1662 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1660)]);
            int _1664 = _250 + 4;
            uint _1666 = uint(int(uint(_1664) >> uint(2)));
            float _1668 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1666)]);
            int _1670 = _250 + 8;
            uint _1672 = uint(int(uint(_1670) >> uint(2)));
            float _1674 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1672)]);
            int _1676 = _250 + 12;
            uint _1678 = uint(int(uint(_1676) >> uint(2)));
            float _1680 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1678)]);
            float _1682 = _1642 * _1646;
            float _1684 = _1642 * _1652;
            float _1686 = _1636 * _1646;
            float _1688 = -_1682;
            float _1690 = fma(_1630, _1658, _1688);
            float _1692 = -_1684;
            float _1694 = fma(_1636, _1658, _1692);
            float _1696 = _1674 * _1636;
            float _1698 = _1674 * _1646;
            float _1700 = _1668 * _1690;
            float _1702 = -_1686;
            float _1704 = fma(_1630, _1652, _1702);
            float _1706 = _1668 * _1630;
            float _1708 = _1662 * _1652;
            float _1710 = -_1700;
            float _1712 = fma(_1662, _1694, _1710);
            float _1714 = -_1698;
            float _1716 = fma(_1662, _1658, _1714);
            float _1718 = -_1706;
            float _1720 = fma(_1662, _1636, _1718);
            float _1722 = _1668 * _1658;
            float _1724 = fma(_1674, _1704, _1712);
            float _1726 = -_1696;
            float _1728 = fma(_1668, _1642, _1726);
            float _1730 = _1662 * _1642;
            float _1732 = -_1722;
            float _1734 = fma(_1674, _1652, _1732);
            float _1736 = 1.0 / _1724;
            float _1738 = -_1708;
            float _1740 = fma(_1668, _1646, _1738);
            float _1742 = -_1730;
            float _1744 = fma(_1674, _1630, _1742);
            float _1746 = -_1630;
            float _1748 = fma(_1746, _1658, _1682);
            float _1750 = _1734 * _1736;
            float _1752 = _1716 * _1736;
            float _1754 = _1740 * _1736;
            float _1756 = _1748 * _1736;
            float _1758 = _1750 * _1472;
            float _1760 = _1752 * _1472;
            float _1762 = _1470 * _1736;
            float _1764 = _1754 * _1472;
            float _1766 = _1728 * _1736;
            float _1768 = _1744 * _1736;
            float _1770 = fma(_1694, _1762, _1758);
            float _1772 = fma(_1756, _1470, _1760);
            float _1774 = _1720 * _1736;
            float _1776 = fma(_1704, _1762, _1764);
            float _1778 = fma(_1766, _1474, _1770);
            float _1780 = fma(_1768, _1474, _1772);
            float _1782 = fma(_1774, _1474, _1776);
            _1418 = _1770;
            _1420 = _1764;
            _1442 = _1772;
            _1422 = _1756;
            _1424 = _1754;
            _1426 = _1740;
            _1428 = _1674;
            _1430 = _1680;
            _1456 = _1776;
            _1432 = _1652;
            _622 = _1658;
            _200 = _1766;
            _1606 = _1780;
            _1480 = _1778;
            _1482 = _1782;
            _1434 = _1694;
        }
    }
    _1608 = false;
    float _1784 = _1418;
    float _1786 = _1420;
    float _1788 = _1442;
    float _1790 = _1422;
    float _1792 = _1424;
    float _1794 = _1426;
    float _1796 = _1428;
    float _1798 = _1430;
    float _1800 = _1456;
    float _1802 = _1432;
    float _1804 = _622;
    float _1806 = _200;
    float _1808 = _1606;
    float _1810 = _1480;
    float _1812 = _1482;
    float _1814 = _1434;
    uint _1816 = uint(int(uint(_252) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1816)] = as_type<uint>(_1394);
    float _1818 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[30]);
    int _1820 = as_type<int>(_1818) & 512;
    bool _1822 = _1820 != 0;
    int _1824 = as_type<int>(_1818) & 1024;
    bool _1826 = _1824 != 0;
    float _1828 = _1784;
    float _1830 = _1786;
    float _1832 = _1788;
    float _1834 = _1790;
    float _1836 = _1812;
    float _1838 = _1810;
    float _1840 = _1814;
    if (_1822)
    {
        float _1842 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _1844 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _1846 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _1848 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        _1828 = _1842;
        _1830 = _1844;
        _1832 = _1846;
        _1834 = _1848;
    }
    float _1850 = _1828;
    float _1852 = _1830;
    float _1854 = _1832;
    float _1856 = _1834;
    float _1858 = _1792;
    float _1860 = _1794;
    float _1862 = _1796;
    float _1864 = _1798;
    if (_1822)
    {
        float _1866 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _1868 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _1870 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _1872 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        _1858 = _1866;
        _1860 = _1868;
        _1862 = _1870;
        _1864 = _1872;
    }
    float _1874 = _1858;
    float _1876 = _1860;
    float _1878 = _1862;
    float _1880 = _1864;
    float _1882 = _1800;
    float _1884 = _1802;
    float _1886 = _1804;
    float _1888 = _1806;
    if (_1822)
    {
        float _1890 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _1892 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _1894 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _1896 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        _1882 = _1890;
        _1884 = _1892;
        _1886 = _1894;
        _1888 = _1896;
    }
    float _1898 = _1882;
    float _1900 = _1884;
    float _1902 = _1886;
    float _1904 = _1888;
    float _1906 = _608 + _1808;
    float _1908 = _606 + _1810;
    float _1910 = _598 + _1812;
    if (!_1822)
    {
        _1836 = 0.0;
    }
    float _1912 = _1836;
    float _1914 = _1912;
    if (!_1822)
    {
        _1838 = 0.0;
    }
    float _1916 = _1838;
    int _1918 = as_type<int>(_1818) & 2048;
    bool _1920 = _1918 != 0;
    float _1922 = _1850;
    float _1924 = _1916;
    if (_1822)
    {
        float _1926 = _1906 * _1852;
        _1840 = _1926;
    }
    float _1928 = _1840;
    float _1930 = _1876;
    float _1932 = _1928;
    float _1934 = _1900;
    float _1936 = _1898;
    float _1938 = _1878;
    if (_1822)
    {
        float _1940 = _1906 * _1876;
        _1930 = _1940;
    }
    float _1942 = _1930;
    float _1944 = _1942;
    if (_1822)
    {
        float _1946 = fma(_1908, _1850, _1928);
        _1922 = _1946;
    }
    float _1948 = _1922;
    float _1950 = _1948;
    if (!_1822)
    {
        _1932 = 0.0;
    }
    float _1952 = _1932;
    float _1954 = _1952;
    if (_1822)
    {
        float _1956 = _1906 * _1900;
        _1934 = _1956;
    }
    float _1958 = _1934;
    if (_1822)
    {
        float _1960 = fma(_1908, _1874, _1942);
        _1944 = _1960;
    }
    float _1962 = _1944;
    if (_1822)
    {
        float _1964 = fma(_1910, _1854, _1948);
        _1950 = _1964;
    }
    float _1966 = _1950;
    if (_1822)
    {
        float _1968 = fma(_1908, _1898, _1958);
        _1936 = _1968;
    }
    float _1970 = _1936;
    float _1972 = _1970;
    if (_1822)
    {
        float _1974 = fma(_1910, _1878, _1962);
        _1938 = _1974;
    }
    float _1976 = _1938;
    if (_1822)
    {
        float _1978 = _1856 + _1966;
        _1914 = _1978;
    }
    float _1980 = _1914;
    float _1982 = _1980;
    if (_1822)
    {
        float _1984 = fma(_1910, _1902, _1970);
        _1972 = _1984;
    }
    float _1986 = _1972;
    if (_1822)
    {
        float _1988 = _1880 + _1976;
        _1954 = _1988;
    }
    float _1990 = _1954;
    float _1992 = _1990;
    if (_1822)
    {
        float _1994 = _1904 + _1986;
        _1924 = _1994;
    }
    float _1996 = _1924;
    bool _1998 = !_1826;
    float _2000 = _1996;
    if (!_1998)
    {
        float _2002 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        uint _2004 = uint(int(uint(_250) >> uint(2)));
        float _2006 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2004)]);
        int _2008 = _250 + 4;
        uint _2010 = uint(int(uint(_2008) >> uint(2)));
        float _2012 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2010)]);
        int _2014 = _250 + 8;
        uint _2016 = uint(int(uint(_2014) >> uint(2)));
        float _2018 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2016)]);
        uint _2020 = uint(int(uint(_250) >> uint(2)));
        float _2022 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2020)]);
        int _2024 = _250 + 4;
        uint _2026 = uint(int(uint(_2024) >> uint(2)));
        float _2028 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2026)]);
        int _2030 = _250 + 8;
        uint _2032 = uint(int(uint(_2030) >> uint(2)));
        float _2034 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2032)]);
        uint _2036 = uint(int(uint(_250) >> uint(2)));
        float _2038 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2036)]);
        int _2040 = _250 + 4;
        uint _2042 = uint(int(uint(_2040) >> uint(2)));
        float _2044 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2042)]);
        int _2046 = _250 + 8;
        uint _2048 = uint(int(uint(_2046) >> uint(2)));
        float _2050 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2048)]);
        float _2052 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        float _2054 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        float _2056 = _1906 * _2012;
        float _2058 = _1906 * _2028;
        float _2060 = _1906 * _2044;
        float _2062 = fma(_1908, _2006, _2056);
        float _2064 = fma(_1908, _2022, _2058);
        float _2066 = fma(_1908, _2038, _2060);
        float _2068 = fma(_1910, _2018, _2062);
        float _2070 = fma(_1910, _2034, _2064);
        float _2072 = fma(_1910, _2050, _2066);
        float _2074 = _2002 + _2068;
        float _2076 = _2052 + _2070;
        float _2078 = _2054 + _2072;
        _1992 = _2076;
        _1982 = _2074;
        _2000 = _2078;
    }
    float _2080 = _1992;
    float _2082 = _1982;
    float _2084 = _2000;
    bool _2086 = !_1920;
    float _2088 = _2080;
    float _2090 = _2082;
    float _2092 = _2084;
    if (!_2086)
    {
        uint _2094 = uint(int(uint(_250) >> uint(2)));
        float _2096 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2094)]);
        int _2098 = _250 + 4;
        uint _2100 = uint(int(uint(_2098) >> uint(2)));
        float _2102 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2100)]);
        int _2104 = _250 + 8;
        uint _2106 = uint(int(uint(_2104) >> uint(2)));
        float _2108 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2106)]);
        int _2110 = _250 + 12;
        uint _2112 = uint(int(uint(_2110) >> uint(2)));
        float _2114 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2112)]);
        uint _2116 = uint(int(uint(_250) >> uint(2)));
        float _2118 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2116)]);
        int _2120 = _250 + 4;
        uint _2122 = uint(int(uint(_2120) >> uint(2)));
        float _2124 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2122)]);
        int _2126 = _250 + 8;
        uint _2128 = uint(int(uint(_2126) >> uint(2)));
        float _2130 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2128)]);
        int _2132 = _250 + 12;
        uint _2134 = uint(int(uint(_2132) >> uint(2)));
        float _2136 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2134)]);
        uint _2138 = uint(int(uint(_250) >> uint(2)));
        float _2140 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2138)]);
        int _2142 = _250 + 4;
        uint _2144 = uint(int(uint(_2142) >> uint(2)));
        float _2146 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2144)]);
        int _2148 = _250 + 8;
        uint _2150 = uint(int(uint(_2148) >> uint(2)));
        float _2152 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2150)]);
        int _2154 = _250 + 12;
        uint _2156 = uint(int(uint(_2154) >> uint(2)));
        float _2158 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2156)]);
        float _2160 = _1906 * _2102;
        float _2162 = _1906 * _2124;
        float _2164 = _1906 * _2146;
        float _2166 = fma(_1908, _2096, _2160);
        float _2168 = fma(_1908, _2118, _2162);
        float _2170 = fma(_1908, _2140, _2164);
        float _2172 = fma(_1910, _2108, _2166);
        float _2174 = fma(_1910, _2130, _2168);
        float _2176 = fma(_1910, _2152, _2170);
        float _2178 = _2172 + _2114;
        float _2180 = _2174 + _2136;
        float _2182 = _2176 + _2158;
        _2088 = _2180;
        _2090 = _2178;
        _2092 = _2182;
    }
    float _2184 = _2088;
    float _2186 = _2090;
    float _2188 = _2092;
    float _2190 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[8]);
    float _2192 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[9]);
    float _2194 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[10]);
    float _2196 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[11]);
    float _2198 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[61]);
    float _2200 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[60]);
    float _2202 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[70]);
    float _2204 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[504]);
    float _2206 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[505]);
    float _2208 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[506]);
    float _2210 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[507]);
    float _2212 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[501]);
    float _2214 = _2192 * _2184;
    float _2216 = fma(_2190, _2186, _2214);
    float _2218 = fma(_2194, _2188, _2216);
    float _2220 = _2196 + _2218;
    float _2222 = -_2220;
    bool _2224 = _2198 >= _2222;
    bool _2226 = isnan(_2198);
    bool _2228 = _2224 || _2226;
    bool _2230 = isnan(_2222);
    bool _2232 = _2228 || _2230;
    float _2234 = -_2220;
    bool _2236 = _2200 >= _2234;
    bool _2238 = isnan(_2200);
    bool _2240 = _2236 || _2238;
    bool _2242 = isnan(_2234);
    bool _2244 = _2240 || _2242;
    int _2246 = _2232 ? 0 : 1;
    int _2248 = 2;
    if (_2232)
    {
        _2248 = 1;
    }
    int _2250 = _2248;
    int _2252 = _2250;
    if (_2244)
    {
        _2252 = _2246;
    }
    int _2254 = _2252;
    int _2256 = _2254 << 6;
    int _2258 = _2256 + 96;
    uint _2260 = uint(int(uint(_2258) >> uint(2)));
    float _2262 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_2260)]);
    int _2264 = _2258 + 4;
    uint _2266 = uint(int(uint(_2264) >> uint(2)));
    float _2268 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_2266)]);
    int _2270 = _2258 + 8;
    uint _2272 = uint(int(uint(_2270) >> uint(2)));
    float _2274 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_2272)]);
    int _2276 = _2258 + 12;
    uint _2278 = uint(int(uint(_2276) >> uint(2)));
    float _2280 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_2278)]);
    int _2282 = _2256 + 48;
    int _2284 = _2256 + 64;
    uint _2286 = uint(int(uint(_2282) >> uint(2)));
    float _2288 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_2286)]);
    int _2290 = _2282 + 4;
    uint _2292 = uint(int(uint(_2290) >> uint(2)));
    float _2294 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_2292)]);
    int _2296 = _2282 + 8;
    uint _2298 = uint(int(uint(_2296) >> uint(2)));
    float _2300 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_2298)]);
    int _2302 = _2282 + 12;
    uint _2304 = uint(int(uint(_2302) >> uint(2)));
    float _2306 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_2304)]);
    uint _2308 = uint(int(uint(_2284) >> uint(2)));
    float _2310 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_2308)]);
    int _2312 = _2284 + 4;
    uint _2314 = uint(int(uint(_2312) >> uint(2)));
    float _2316 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_2314)]);
    int _2318 = _2284 + 8;
    uint _2320 = uint(int(uint(_2318) >> uint(2)));
    float _2322 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_2320)]);
    int _2324 = _2284 + 12;
    uint _2326 = uint(int(uint(_2324) >> uint(2)));
    float _2328 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_2326)]);
    int _2330 = _2256 + 80;
    float _2332 = _2202 + 1.0;
    float _2334 = _2332 + _2184;
    uint _2336 = uint(int(uint(_2330) >> uint(2)));
    float _2338 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_2336)]);
    int _2340 = _2330 + 4;
    uint _2342 = uint(int(uint(_2340) >> uint(2)));
    float _2344 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_2342)]);
    int _2346 = _2330 + 8;
    uint _2348 = uint(int(uint(_2346) >> uint(2)));
    float _2350 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_2348)]);
    int _2352 = _2330 + 12;
    uint _2354 = uint(int(uint(_2352) >> uint(2)));
    float _2356 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_2354)]);
    float _2358 = _2334 * _2206;
    float _2360 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[502]);
    float _2362 = fma(_2204, _2186, _2358);
    float _2364 = fma(_2208, _2188, _2362);
    float _2366 = _2210 + _2364;
    float _2368 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[508]);
    float _2370 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[509]);
    float _2372 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[510]);
    float _2374 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[511]);
    float _2376 = trunc(_2366);
    int _2378 = int(_2376);
    int _2380 = ~as_type<int>(_2212);
    int _2382 = _2378 + _2380;
    int _2384 = _2382 + 1;
    bool _2386 = _2384 >= 0;
    int _2388 = _2256;
    float _2390 = as_type<float>(_2254);
    if (_2386)
    {
        float _2392 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[500]);
        _2388 = as_type<int>(_2392);
    }
    int _2394 = _2388;
    float _2396 = _2334 * _2268;
    float _2398 = fma(_2262, _2186, _2396);
    float _2400 = fma(_2274, _2188, _2398);
    float _2402 = _2280 + _2400;
    float _2404 = _2334 * _2294;
    float _2406 = 1.0 / _2402;
    float _2408 = fma(_2288, _2186, _2404);
    float _2410 = _2334 * _2316;
    float _2412 = fma(_2300, _2188, _2408);
    float _2414 = fma(_2310, _2186, _2410);
    float _2416 = _2306 + _2412;
    float _2418 = fma(_2322, _2188, _2414);
    float _2420 = _2416 * _2406;
    float _2422 = _2328 + _2418;
    bool _2424 = _2420 >= 0.0;
    float _2426 = _2422 * _2406;
    bool _2428 = _2420 <= 1.0;
    bool _2430 = _2428 && _2424;
    bool _2432 = _2426 >= 0.0;
    bool _2434 = _2432 && _2430;
    bool _2436 = _2426 <= 1.0;
    bool _2438 = _2436 && _2434;
    float _2440 = _2334 * _2344;
    float _2442 = fma(_2338, _2186, _2440);
    if (_2438)
    {
        float _2444 = float(_2254);
        _2390 = _2444;
    }
    float _2446 = _2390;
    float _2448 = _2416;
    if (_2438)
    {
        float _2450 = rint(_2446);
        float _2452 = precise::max(_2450, 0.0);
        uint _2454 = uint(_2452);
        uint _2456 = clamp(_2454, 0u, 65535u);
        _2448 = as_type<float>(_2456);
    }
    float _2458 = _2448;
    float _2460 = fma(_2350, _2188, _2442);
    float _2462 = _2356 + _2460;
    float _2464 = _2462 * _2406;
    float _2466 = _2458;
    if (_2438)
    {
        float3 _6625 = float3(_2420, _2426, float(as_type<int>(_2458)));
        float3 _6627 = select(_6625, float3(0.0), isnan(_6625));
        float _2468 = spvDepthCast(spvDescriptorSet0.cp_t_tcb_16).sample_compare(spvDescriptorSet0.cp_t_tcb_16Smplr, _6627.xy, uint(rint(_6627.z)), _2464, level(0.0));
        _2466 = _2468;
    }
    float _2470 = _2466;
    float _2472 = _2334 * _2370;
    float _2474 = fma(_2368, _2186, _2472);
    float _2476 = fma(_2372, _2188, _2474);
    float _2478 = _2374 + _2476;
    float _2480 = trunc(_2478);
    int _2482 = int(_2480);
    bool _2484 = _2394 <= _2384;
    bool _2486 = !_2386;
    bool _2488 = _2484 || _2486;
    int _2490 = ~as_type<int>(_2360);
    int _2492 = _2482 + _2490;
    int _2494 = _2492 + 1;
    bool _2496 = _2494 < 0;
    bool _2498 = _2496 || _2488;
    float _2500 = _2368;
    float _2502 = as_type<float>(_2482);
    if (!_2498)
    {
        float _2504 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[500]);
        _2500 = _2504;
    }
    float _2506 = _2500;
    bool _2508 = as_type<int>(_2506) <= _2494;
    bool _2510 = _2508 || _2498;
    float _2512 = _2506;
    if (_2510)
    {
        _2502 = 1.0;
    }
    float _2514 = _2502;
    float _2516 = _2514;
    if (!_2510)
    {
        float _2518 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[500]);
        int _2520 = _2494 * as_type<int>(_2518);
        int _2522 = _2520 + _2384;
        int _2524 = _2522 << 2;
        uint _2526 = uint(int(uint(_2522) >> uint(2)));
        int _2528 = 12 & _2524;
        int _2530 = int(_2526) << 4;
        int _2532 = _2530 + _2528;
        int _2534 = _2532 + 400;
        uint _2536 = uint(int(uint(_2534) >> uint(2)));
        float _2538 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_2536)]);
        float _2540 = floor(_2366);
        float _2542 = floor(_2478);
        float _2544 = -_2540;
        float _2546 = _2366 + _2544;
        float _2548 = -_2542;
        float _2550 = _2478 + _2548;
        float _2552 = rint(_2538);
        float _2554 = precise::max(_2552, 0.0);
        uint _2556 = uint(_2554);
        uint _2558 = clamp(_2556, 0u, 65535u);
        float3 _6762 = float3(_2546, _2550, float(int(_2558)));
        float3 _6764 = select(_6762, float3(0.0), isnan(_6762));
        float _2560 = dm_bs(spvDescriptorSet0.cp_t_tcb_14.sample(spvDescriptorSet0.cp_t_tcb_14Smplr, _6764.xy, uint(rint(_6764.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_14, spvDescriptorSet0.cp_t_tcb_14Smplr_w, _6764.xy, uint(rint(_6764.z)), level(0.0)).x;
        int _2562 = _2522 << 4;
        int _2564 = _2562 + 2048;
        uint _2566 = uint(int(uint(_2564) >> uint(2)));
        float _2568 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_2566)]);
        int _2570 = _2564 + 4;
        uint _2572 = uint(int(uint(_2570) >> uint(2)));
        float _2574 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_2572)]);
        int _2576 = _2564 + 8;
        uint _2578 = uint(int(uint(_2576) >> uint(2)));
        float _2580 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_2578)]);
        int _2582 = _2564 + 12;
        uint _2584 = uint(int(uint(_2582) >> uint(2)));
        float _2586 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_2584)]);
        float _2588 = _2334 * _2574;
        float _2590 = fma(_2568, _2186, _2588);
        float _2592 = fma(_2580, _2188, _2590);
        float _2594 = _2586 + _2592;
        float _2596 = precise::clamp(_2594, 0.0, 1.0);
        float _2598 = -_2596;
        float _2600 = _2598 + _2560;
        float _2602 = fma(_2600, 500.0, 1.5);
        float _2604 = exp2(_2602);
        float _2606 = 0.0 + _2604;
        float _2608 = precise::clamp(_2606, 0.0, 1.0);
        _2512 = _2538;
        _2516 = _2608;
    }
    float _2610 = _2512;
    float _2612 = _2516;
    uint _2614 = uint(int(uint(_250) >> uint(2)));
    float _2616 = as_type<float>((*spvDescriptorSet0.cp_s13)._m0[int(_2614)]);
    float _2618 = _2610;
    if (!_2438)
    {
        _2618 = 1.0;
    }
    float _2620 = _2618;
    bool _2622 = _612 > 0.001000000047497451305389404296875;
    bool _2624 = isnan(_612);
    bool _2626 = _2622 || _2624;
    bool _2628 = isnan(0.001000000047497451305389404296875);
    bool _2630 = _2626 || _2628;
    float _2632 = -_262;
    float _2634 = _2632 + _1906;
    float _2636 = _2620;
    if (_2438)
    {
        bool _2638 = _2470 >= _2464;
        bool _2640 = isnan(_2470);
        bool _2642 = _2638 || _2640;
        bool _2644 = isnan(_2464);
        bool _2646 = _2642 || _2644;
        float _2648 = float(_2646);
        _2636 = _2648;
    }
    float _2650 = _2636;
    float _2652 = -_268;
    float _2654 = _2652 + _1910;
    int _2656 = _250 + 4;
    int _2658 = _250 + 8;
    float _2660 = -_2650;
    float _2662 = fma(_2660, _2612, 1.0);
    float _2664 = -_256;
    float _2666 = _2664 + _1908;
    float _2668 = -_2616;
    float _2670 = _2662 + _2668;
    float _2672 = _2662;
    if (_2630)
    {
        float _2674 = fma(_2670, 0.0500000007450580596923828125, _2616);
        _2672 = _2674;
    }
    float _2676 = _2672;
    float _2678 = precise::max(0.0, _2676);
    float _2680 = precise::min(_2678, 0.999000012874603271484375);
    uint _2682 = uint(int(uint(_250) >> uint(2)));
    (*spvDescriptorSet0.cp_s13)._m0[int(_2682)] = as_type<uint>(_2680);
    uint _2684 = uint(int(uint(_252) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2684)] = as_type<uint>(_1394);
    uint _2686 = uint(int(uint(_250) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2686)] = as_type<uint>(_1908);
    uint _2688 = uint(int(uint(_2656) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2688)] = as_type<uint>(_1906);
    uint _2690 = uint(int(uint(_2658) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2690)] = as_type<uint>(_1910);
    uint _2692 = uint(int(uint(_250) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_2692)] = as_type<uint>(_1396);
    uint _2694 = uint(int(uint(_2656) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_2694)] = as_type<uint>(_1398);
    uint _2696 = uint(int(uint(_2658) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_2696)] = as_type<uint>(_1400);
    uint _2698 = uint(int(uint(_250) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_2698)] = as_type<uint>(_2666);
    uint _2700 = uint(int(uint(_2656) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_2700)] = as_type<uint>(_2634);
    uint _2702 = uint(int(uint(_2658) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_2702)] = as_type<uint>(_2654);
    float _2704 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _2706 = _2634 * _2634;
    float _2708 = _1398 * _1398;
    float _2710 = fma(_2666, _2666, _2706);
    float _2712 = fma(_1396, _1396, _2708);
    float _2714 = fma(_2654, _2654, _2710);
    float _2716 = fma(_1400, _1400, _2712);
    float _2718 = sqrt(_2716);
    float _2720 = sqrt(_2714);
    bool _2722 = _2720 >= 9.9999999747524270787835121154785e-07;
    bool _2724 = isnan(_2720);
    bool _2726 = _2722 || _2724;
    bool _2728 = isnan(9.9999999747524270787835121154785e-07);
    bool _2730 = _2726 || _2728;
    if (!_2730)
    {
        bool _2732 = _552 != _312;
        bool _2734 = isnan(_552);
        bool _2736 = _2732 || _2734;
        bool _2738 = isnan(_312);
        bool _2740 = _2736 || _2738;
        _2742 = _2740;
        if (!_2742)
        {
            float _2744 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
            bool _2746 = _2744 > 0.0;
            bool _2748 = !_2746;
            if (!_2748)
            {
                float _2750 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
                float _2752 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
                float _2754 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
                float _2756 = _2752 * _532;
                float _2758 = _2752 * _530;
                float _2760 = _2752 * _536;
                float _2762 = fma(_2750, _538, _2756);
                float _2764 = fma(_2750, _534, _2758);
                float _2766 = fma(_2750, _542, _2760);
                float _2768 = fma(_2754, _544, _2762);
                float _2770 = fma(_2754, _540, _2764);
                float _2772 = fma(_2754, _546, _2766);
                float _2774 = _2768 * _2768;
                float _2776 = fma(_2770, _2770, _2774);
                float _2778 = fma(_2772, _2772, _2776);
                float _2780 = rsqrt(_2778);
                float _2782 = _2780 * 9.9999999747524270787835121154785e-07;
                float _2784 = _2770 * _2782;
                float _2786 = _2768 * _2782;
                float _2788 = _2772 * _2782;
                _350 = as_type<int>(_2784);
                _352 = as_type<int>(_2786);
                _354 = as_type<int>(_2788);
                _2742 = true;
            }
            else
            {
                bool _2790 = _2718 >= 9.9999999747524270787835121154785e-07;
                bool _2792 = isnan(_2718);
                bool _2794 = _2790 || _2792;
                bool _2796 = isnan(9.9999999747524270787835121154785e-07);
                bool _2798 = _2794 || _2796;
                if (!_2798)
                {
                    float _2800 = _1906 * _1906;
                    float _2802 = fma(_1908, _1908, _2800);
                    float _2804 = fma(_1910, _1910, _2802);
                    float _2806 = sqrt(_2804);
                    bool _2808 = _2806 >= 9.9999999747524270787835121154785e-07;
                    bool _2810 = isnan(_2806);
                    bool _2812 = _2808 || _2810;
                    bool _2814 = isnan(9.9999999747524270787835121154785e-07);
                    bool _2816 = _2812 || _2814;
                    float _2818 = _2806;
                    if (_2816)
                    {
                        float _2820 = rsqrt(_2804);
                        _2818 = _2820;
                    }
                    float _2822 = _2818;
                    if (!_2816)
                    {
                        _338 = 0;
                    }
                    int _2824 = _338;
                    int _2826 = _2824;
                    if (!_2816)
                    {
                        _340 = 897988541;
                    }
                    int _2828 = _340;
                    int _2830 = _2828;
                    if (!_2816)
                    {
                        _342 = 0;
                    }
                    int _2832 = _342;
                    float _2834 = _2822;
                    int _2836 = _2832;
                    if (_2816)
                    {
                        float _2838 = _2822 * 9.9999999747524270787835121154785e-07;
                        _2834 = _2838;
                    }
                    float _2840 = _2834;
                    if (_2816)
                    {
                        float _2842 = _1908 * _2840;
                        _2826 = as_type<int>(_2842);
                    }
                    int _2844 = _2826;
                    _350 = _2844;
                    if (_2816)
                    {
                        float _2846 = _1906 * _2840;
                        _2830 = as_type<int>(_2846);
                    }
                    int _2848 = _2830;
                    _352 = _2848;
                    if (_2816)
                    {
                        float _2850 = _1910 * _2840;
                        _2836 = as_type<int>(_2850);
                    }
                    int _2852 = _2836;
                    _354 = _2852;
                    _2742 = true;
                }
                else
                {
                    float _2854 = rsqrt(_2716);
                    float _2856 = _2854 * 9.9999999747524270787835121154785e-07;
                    float _2858 = _1396 * _2856;
                    float _2860 = _1398 * _2856;
                    float _2862 = _1400 * _2856;
                    _350 = as_type<int>(_2858);
                    _352 = as_type<int>(_2860);
                    _354 = as_type<int>(_2862);
                    _2742 = true;
                }
            }
        }
    }
    else
    {
        float _2864 = _2718 * _2704;
        bool _2866 = _2864 >= 0.001000000047497451305389404296875;
        bool _2868 = isnan(_2864);
        bool _2870 = _2866 || _2868;
        bool _2872 = isnan(0.001000000047497451305389404296875);
        bool _2874 = _2870 || _2872;
        bool _2876 = _2864 > 0.0;
        bool _2878 = !_2874;
        bool _2880 = _2876 && _2878;
        bool _2882 = _2720 < 0.001000000047497451305389404296875;
        bool _2884 = _2882 && _2880;
        if (!_2884)
        {
            _344 = as_type<int>(_2666);
        }
        int _2886 = _344;
        int _2888 = _2886;
        if (_2884)
        {
            float _2890 = _1396 * _2704;
            _2888 = as_type<int>(_2890);
        }
        int _2892 = _2888;
        _350 = _2892;
        if (!_2884)
        {
            _346 = as_type<int>(_2634);
        }
        int _2894 = _346;
        int _2896 = _2894;
        if (_2884)
        {
            float _2898 = _1398 * _2704;
            _2896 = as_type<int>(_2898);
        }
        int _2900 = _2896;
        _352 = _2900;
        if (!_2884)
        {
            _348 = as_type<int>(_2654);
        }
        int _2902 = _348;
        _354 = _2902;
        if (_2884)
        {
            float _2904 = _1400 * _2704;
            _354 = as_type<int>(_2904);
        }
    }
    _2742 = false;
    int _2906 = _350;
    int _2908 = _352;
    int _2910 = _354;
    uint _2912 = uint(int(uint(_250) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_2912)] = uint(_2906);
    uint _2914 = uint(int(uint(_2656) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_2914)] = uint(_2908);
    uint _2916 = uint(int(uint(_2658) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_2916)] = uint(_2910);
}

