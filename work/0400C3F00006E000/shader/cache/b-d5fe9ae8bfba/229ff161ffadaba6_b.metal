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
    texture3d<float> cp_t_tcb_12 [[id(12)]];
    sampler cp_t_tcb_12Smplr [[id(13)]];
    sampler cp_t_tcb_12Smplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]])
{
    bool _1796 = false;
    bool _1540 = false;
    bool _1158 = false;
    bool _688 = false;
    float _64 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[9]);
    float _66 = as_type<float>(gl_LocalInvocationID.x);
    float _68 = as_type<float>(gl_WorkGroupID.x);
    int _71 = as_type<int>(_68) << 5;
    int _73 = _71 + as_type<int>(_66);
    float _75 = trunc(_64);
    int _77 = int(_75);
    bool _81 = _73 >= _77;
    int _83 = 0;
    float _85 = as_type<float>(_77);
    if (_81)
    {
        _83 = 0;
    }
    int _87 = _83;
    int _89 = _87;
    int _91 = _87;
    float _93 = 0.0;
    if (!_81)
    {
        int _95 = _73 << 4;
        int _97 = _95 + 12;
        uint _100 = uint(int(uint(_97) >> uint(2)));
        float _102 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_100)]);
        float _104 = trunc(_102);
        int _106 = int(_104);
        bool _108 = _106 >= 1;
        int _110 = _108 ? (-1) : 0;
        _85 = as_type<float>(_97);
        _93 = as_type<float>(_106);
        if (!_108)
        {
            _89 = 0;
        }
        int _112 = _89;
        bool _114 = !_108;
        _91 = _112;
        if (!_114)
        {
            float _116 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
            uint _118 = uint(int(uint(_97) >> uint(2)));
            float _120 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_118)]);
            float _122 = float(_106);
            float _124 = -_120;
            float _126 = _116 + _124;
            bool _128 = _126 > _122;
            int _130 = as_type<int>(_116);
            _85 = _120;
            _93 = _122;
            if (!_128)
            {
                bool _132 = _116 >= _120;
                bool _134 = isnan(_116);
                bool _136 = _132 || _134;
                bool _138 = isnan(_120);
                bool _140 = _136 || _138;
                _110 = _140 ? (-1) : 0;
            }
            int _142 = _110;
            if (_128)
            {
                _130 = 0;
            }
            int _144 = _130;
            _91 = _144;
            if (!_128)
            {
                int _146 = ~_142;
                int _148 = (_146 != 0) ? 0 : 1;
                _91 = _148;
            }
        }
    }
    int _150 = _91;
    float _152 = _85;
    float _154 = _93;
    int _156 = _150 & 1;
    bool _158 = _156 != 0;
    if (!_158)
    {
        return;
    }
    float _160 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _162 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[30]);
    float _164 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
    float _166 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
    float _168 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
    float _170 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
    float _172 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
    float _174 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[68]);
    int _176 = as_type<int>(_162) & 512;
    bool _178 = _176 != 0;
    float _180 = 0.0;
    float _182 = 0.0;
    float _184 = 0.0;
    if (_178)
    {
        float _186 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[32]);
        float _188 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[33]);
        float _190 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[34]);
        _180 = _186;
        _182 = _188;
        _184 = _190;
    }
    float _192 = _180;
    float _194 = _182;
    float _196 = _184;
    float _198 = 0.0;
    float _200 = 0.0;
    float _202 = 0.0;
    if (_178)
    {
        float _204 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[36]);
        float _206 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[37]);
        float _208 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[38]);
        _198 = _204;
        _200 = _206;
        _202 = _208;
    }
    float _210 = _198;
    float _212 = _200;
    float _214 = _202;
    float _216 = as_type<float>(_150);
    float _218 = _152;
    float _220 = _154;
    if (_178)
    {
        float _222 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[40]);
        float _224 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[41]);
        float _226 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[42]);
        _216 = _222;
        _218 = _224;
        _220 = _226;
    }
    float _228 = _216;
    float _230 = _218;
    float _232 = _220;
    int _234 = _73 << 4;
    int _236 = _234 + 12;
    uint _238 = uint(int(uint(_234) >> uint(2)));
    float _240 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_238)]);
    int _242 = _234 + 4;
    uint _244 = uint(int(uint(_242) >> uint(2)));
    float _246 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_244)]);
    int _248 = _234 + 8;
    uint _250 = uint(int(uint(_248) >> uint(2)));
    float _252 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_250)]);
    int _254 = _234 + 12;
    uint _256 = uint(int(uint(_254) >> uint(2)));
    float _258 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_256)]);
    uint _260 = uint(int(uint(_234) >> uint(2)));
    float _262 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_260)]);
    int _264 = _234 + 4;
    uint _266 = uint(int(uint(_264) >> uint(2)));
    float _268 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_266)]);
    int _270 = _234 + 8;
    uint _272 = uint(int(uint(_270) >> uint(2)));
    float _274 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_272)]);
    uint _276 = uint(int(uint(_234) >> uint(2)));
    float _278 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_276)]);
    int _280 = _234 + 4;
    uint _282 = uint(int(uint(_280) >> uint(2)));
    float _284 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_282)]);
    int _286 = _234 + 8;
    uint _288 = uint(int(uint(_286) >> uint(2)));
    float _290 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_288)]);
    uint _292 = uint(int(uint(_234) >> uint(2)));
    float _294 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_292)]);
    uint _296 = uint(int(uint(_236) >> uint(2)));
    float _298 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_296)]);
    uint _300 = uint(int(uint(_236) >> uint(2)));
    float _302 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_300)]);
    float _304 = _210;
    float _306 = _192;
    float _308 = _212;
    float _310 = _214;
    float _312 = _228;
    float _314 = _194;
    float _316 = _196;
    float _318 = _230;
    float _320 = _232;
    float _322 = 0.0;
    float _324 = _170;
    float _326 = _258;
    float _328 = _174;
    int _330 = as_type<int>(_262);
    int _332 = as_type<int>(_268);
    int _334 = as_type<int>(_274);
    int _336 = as_type<int>(_262);
    int _338 = as_type<int>(_268);
    int _340 = as_type<int>(_274);
    int _342 = as_type<int>(_262);
    int _344 = as_type<int>(_268);
    int _346 = as_type<int>(_274);
    if (!_178)
    {
        int _348 = _234 + 4;
        uint _350 = uint(int(uint(_234) >> uint(2)));
        float _352 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_350)]);
        int _354 = _234 + 8;
        uint _356 = uint(int(uint(_234) >> uint(2)));
        float _358 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_356)]);
        uint _360 = uint(int(uint(_348) >> uint(2)));
        float _362 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_360)]);
        uint _364 = uint(int(uint(_348) >> uint(2)));
        float _366 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_364)]);
        uint _368 = uint(int(uint(_354) >> uint(2)));
        float _370 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_368)]);
        uint _372 = uint(int(uint(_234) >> uint(2)));
        float _374 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_372)]);
        uint _376 = uint(int(uint(_354) >> uint(2)));
        float _378 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_376)]);
        uint _380 = uint(int(uint(_348) >> uint(2)));
        float _382 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_380)]);
        uint _384 = uint(int(uint(_354) >> uint(2)));
        float _386 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_384)]);
        float _388 = _352 * _352;
        float _390 = fma(_358, _358, _388);
        float _392 = _362 * _362;
        float _394 = fma(_366, _366, _392);
        float _396 = _370 * _370;
        float _398 = fma(_374, _374, _390);
        float _400 = fma(_378, _378, _396);
        float _402 = sqrt(_398);
        float _404 = fma(_382, _382, _394);
        float _406 = fma(_386, _386, _400);
        float _408 = sqrt(_404);
        float _410 = sqrt(_406);
        bool _412 = _402 > 0.0;
        bool _414 = _408 > 0.0;
        bool _416 = _410 > 0.0;
        float _418 = _408;
        float _420 = _410;
        float _422 = _400;
        float _424 = _352;
        float _426 = _402;
        float _428 = _358;
        float _430 = _394;
        float _432 = _362;
        float _434 = _382;
        float _436 = _374;
        _324 = _404;
        _326 = _386;
        if (_412)
        {
            float _438 = rsqrt(_398);
            _418 = _438;
        }
        float _440 = _418;
        float _442 = 0.0;
        if (_414)
        {
            float _444 = rsqrt(_404);
            _442 = _444;
        }
        float _446 = _442;
        float _448 = 0.0;
        if (_416)
        {
            float _450 = rsqrt(_406);
            _448 = _450;
        }
        float _452 = _448;
        if (!_412)
        {
            _420 = 0.0;
        }
        float _454 = _420;
        float _456 = _454;
        if (_412)
        {
            float _458 = _352 * _440;
            _456 = _458;
        }
        float _460 = _456;
        _304 = _460;
        if (!_412)
        {
            _422 = 0.0;
        }
        float _462 = _422;
        float _464 = _462;
        if (_412)
        {
            float _466 = _358 * _440;
            _464 = _466;
        }
        float _468 = _464;
        _306 = _468;
        if (!_412)
        {
            _424 = 0.0;
        }
        float _470 = _424;
        float _472 = _470;
        if (_412)
        {
            float _474 = _374 * _440;
            _472 = _474;
        }
        float _476 = _472;
        _312 = _476;
        if (!_414)
        {
            _426 = 0.0;
        }
        float _478 = _426;
        float _480 = _478;
        _322 = _446;
        if (_414)
        {
            float _482 = _362 * _446;
            _480 = _482;
        }
        float _484 = _480;
        _308 = _484;
        if (!_414)
        {
            _428 = 0.0;
        }
        float _486 = _428;
        float _488 = _486;
        if (_414)
        {
            float _490 = _382 * _446;
            _488 = _490;
        }
        float _492 = _488;
        _318 = _492;
        if (!_414)
        {
            _430 = 0.0;
        }
        float _494 = _430;
        float _496 = _494;
        if (_414)
        {
            float _498 = _366 * _446;
            _496 = _498;
        }
        float _500 = _496;
        _314 = _500;
        if (!_416)
        {
            _432 = 0.0;
        }
        float _502 = _432;
        float _504 = _502;
        if (!_416)
        {
            _434 = 0.0;
        }
        float _506 = _434;
        float _508 = _506;
        if (_416)
        {
            float _510 = _370 * _452;
            _504 = _510;
        }
        float _512 = _504;
        _310 = _512;
        if (!_416)
        {
            _436 = 0.0;
        }
        float _514 = _436;
        _320 = _514;
        if (_416)
        {
            float _516 = _378 * _452;
            _508 = _516;
        }
        float _518 = _508;
        _316 = _518;
        if (_416)
        {
            float _520 = _386 * _452;
            _320 = _520;
        }
    }
    float _522 = _304;
    float _524 = _306;
    float _526 = _308;
    float _528 = _310;
    float _530 = _312;
    float _532 = _314;
    float _534 = _316;
    float _536 = _318;
    float _538 = _320;
    float _540 = _322;
    float _542 = _324;
    float _544 = _326;
    float _546 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
    float _548 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[65]);
    float _550 = abs(_174);
    float _552 = log2(_550);
    float _554 = _166 * _172;
    float _556 = _164 * _172;
    float _558 = _554 * _522;
    float _560 = _168 * _172;
    float _562 = _160 * _552;
    float _564 = exp2(_562);
    float _566 = fma(_556, _524, _558);
    float _568 = _554 * _526;
    float _570 = _554 * _528;
    float _572 = fma(_560, _530, _566);
    float _574 = fma(_556, _532, _568);
    float _576 = fma(_556, _534, _570);
    float _578 = _160 * _572;
    float _580 = fma(_560, _536, _574);
    float _582 = fma(_560, _538, _576);
    float _584 = _160 * _580;
    float _586 = _160 * _582;
    float _588 = fma(_284, _564, _584);
    bool _590 = _548 > 0.0;
    float _592 = _298 * _160;
    float _594 = fma(_278, _564, _578);
    float _596 = fma(_278, _592, _240);
    float _598 = fma(_284, _592, _246);
    float _600 = fma(_290, _592, _252);
    float _602 = fma(_290, _564, _586);
    float _604 = -_302;
    float _606 = _546 + _604;
    float _608 = _544;
    float _610 = _540;
    float _612 = _542;
    bool _614 = _590;
    float _616 = _606;
    if (!_590)
    {
        _608 = _596;
    }
    float _618 = _608;
    float _620 = _618;
    float _622 = _618;
    if (!_590)
    {
        _610 = _598;
    }
    float _624 = _610;
    float _626 = _624;
    float _628 = _624;
    if (!_590)
    {
        _612 = _600;
    }
    float _630 = _612;
    bool _632 = !_590;
    float _634 = _630;
    float _636 = _630;
    if (!_632)
    {
        bool _638 = !_178;
        if (!_638)
        {
            float _640 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
            float _642 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
            float _644 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
            float _646 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
            float _648 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
            float _650 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
            float _652 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
            float _654 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
            float _656 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
            float _658 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
            float _660 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
            float _662 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
            float _664 = _598 * _642;
            float _666 = _598 * _650;
            float _668 = fma(_596, _640, _664);
            float _670 = _598 * _658;
            float _672 = fma(_596, _648, _666);
            float _674 = fma(_600, _644, _668);
            float _676 = fma(_596, _656, _670);
            float _678 = fma(_600, _652, _672);
            float _680 = _646 + _674;
            float _682 = fma(_600, _660, _676);
            float _684 = _654 + _678;
            float _686 = _662 + _682;
            _622 = _680;
            _636 = _686;
            _628 = _684;
            _688 = true;
        }
        else
        {
            int _690 = as_type<int>(_162) & 1024;
            bool _692 = _690 != 0;
            bool _694 = !_692;
            if (!_694)
            {
                float _696 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
                uint _698 = uint(int(uint(_234) >> uint(2)));
                float _700 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_698)]);
                int _702 = _234 + 4;
                uint _704 = uint(int(uint(_702) >> uint(2)));
                float _706 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_704)]);
                int _708 = _234 + 8;
                uint _710 = uint(int(uint(_708) >> uint(2)));
                float _712 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_710)]);
                uint _714 = uint(int(uint(_234) >> uint(2)));
                float _716 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_714)]);
                int _718 = _234 + 4;
                uint _720 = uint(int(uint(_718) >> uint(2)));
                float _722 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_720)]);
                int _724 = _234 + 8;
                uint _726 = uint(int(uint(_724) >> uint(2)));
                float _728 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_726)]);
                uint _730 = uint(int(uint(_234) >> uint(2)));
                float _732 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_730)]);
                int _734 = _234 + 4;
                uint _736 = uint(int(uint(_734) >> uint(2)));
                float _738 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_736)]);
                int _740 = _234 + 8;
                uint _742 = uint(int(uint(_740) >> uint(2)));
                float _744 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_742)]);
                float _746 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
                float _748 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
                float _750 = _598 * _706;
                float _752 = _598 * _722;
                float _754 = _598 * _738;
                float _756 = fma(_596, _700, _750);
                float _758 = fma(_596, _716, _752);
                float _760 = fma(_596, _732, _754);
                float _762 = fma(_600, _712, _756);
                float _764 = fma(_600, _728, _758);
                float _766 = fma(_600, _744, _760);
                float _768 = _696 + _762;
                float _770 = _746 + _764;
                float _772 = _748 + _766;
                _622 = _768;
                _636 = _772;
                _628 = _770;
                _688 = true;
            }
            else
            {
                int _774 = as_type<int>(_162) & 2048;
                bool _776 = _774 != 0;
                if (!_776)
                {
                    _620 = _596;
                }
                float _778 = _620;
                _622 = _778;
                if (!_776)
                {
                    _626 = _598;
                }
                float _780 = _626;
                _628 = _780;
                if (!_776)
                {
                    _634 = _600;
                }
                float _782 = _634;
                bool _784 = !_776;
                _636 = _782;
                if (!_784)
                {
                    uint _786 = uint(int(uint(_234) >> uint(2)));
                    float _788 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_786)]);
                    int _790 = _234 + 4;
                    uint _792 = uint(int(uint(_790) >> uint(2)));
                    float _794 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_792)]);
                    int _796 = _234 + 8;
                    uint _798 = uint(int(uint(_796) >> uint(2)));
                    float _800 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_798)]);
                    int _802 = _234 + 12;
                    uint _804 = uint(int(uint(_802) >> uint(2)));
                    float _806 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_804)]);
                    uint _808 = uint(int(uint(_234) >> uint(2)));
                    float _810 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_808)]);
                    int _812 = _234 + 4;
                    uint _814 = uint(int(uint(_812) >> uint(2)));
                    float _816 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_814)]);
                    int _818 = _234 + 8;
                    uint _820 = uint(int(uint(_818) >> uint(2)));
                    float _822 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_820)]);
                    int _824 = _234 + 12;
                    uint _826 = uint(int(uint(_824) >> uint(2)));
                    float _828 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_826)]);
                    uint _830 = uint(int(uint(_234) >> uint(2)));
                    float _832 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_830)]);
                    int _834 = _234 + 4;
                    uint _836 = uint(int(uint(_834) >> uint(2)));
                    float _838 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_836)]);
                    int _840 = _234 + 8;
                    uint _842 = uint(int(uint(_840) >> uint(2)));
                    float _844 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_842)]);
                    int _846 = _234 + 12;
                    uint _848 = uint(int(uint(_846) >> uint(2)));
                    float _850 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_848)]);
                    float _852 = _598 * _794;
                    float _854 = _598 * _816;
                    float _856 = _598 * _838;
                    float _858 = fma(_596, _788, _852);
                    float _860 = fma(_596, _810, _854);
                    float _862 = fma(_596, _832, _856);
                    float _864 = fma(_600, _800, _858);
                    float _866 = fma(_600, _822, _860);
                    float _868 = fma(_600, _844, _862);
                    float _870 = _864 + _806;
                    float _872 = _866 + _828;
                    float _874 = _868 + _850;
                    _622 = _870;
                    _636 = _874;
                    _628 = _872;
                }
            }
        }
    }
    _688 = false;
    float _876 = _622;
    float _878 = _636;
    float _880 = _628;
    float _882 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[64]);
    float _884 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[60]);
    float _886 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[62]);
    float _888 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[61]);
    float _890 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[59]);
    float _892 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[63]);
    bool _894 = _882 != 0.0;
    bool _896 = isnan(_882);
    bool _898 = _894 || _896;
    bool _900 = isnan(0.0);
    bool _902 = _898 || _900;
    float _904 = _546 * _884;
    float _906 = _546 * _886;
    float _908 = _546 * _888;
    float _910 = fma(_890, _876, _904);
    float _912 = fma(_890, _878, _906);
    float _914 = fma(_890, _880, _908);
    float _916 = _892;
    if (_902)
    {
        float _918 = _294 * _892;
        _916 = _918;
    }
    float _920 = _916;
    float _922 = _914 + _920;
    float _924 = -_920;
    bool _926 = _910 >= _924;
    bool _928 = isnan(_910);
    bool _930 = _926 || _928;
    bool _932 = isnan(_924);
    bool _934 = _930 || _932;
    float _936 = _910 + _920;
    float _938 = -_920;
    bool _940 = _912 >= _938;
    bool _942 = isnan(_912);
    bool _944 = _940 || _942;
    bool _946 = isnan(_938);
    bool _948 = _944 || _946;
    float _950 = _912 + _920;
    float _952 = -_920;
    bool _954 = _914 >= _952;
    bool _956 = isnan(_914);
    bool _958 = _954 || _956;
    bool _960 = isnan(_952);
    bool _962 = _958 || _960;
    bool _964 = !_934;
    float _966 = -_936;
    float _968 = _964 ? _966 : _936;
    bool _970 = !_948;
    float _972 = -_950;
    float _974 = _970 ? _972 : _950;
    bool _976 = !_962;
    float _978 = -_922;
    float _980 = _976 ? _978 : _922;
    float _982 = _968 * 0.03125;
    float _984 = _974 * 0.03125;
    float _986 = _980 * 0.03125;
    float3 _3422 = float3(_982, _986, _984);
    float3 _990 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, select(_3422, float3(0.0), isnan(_3422)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, select(_3422, float3(0.0), isnan(_3422)), level(0.0)).xyz;
    float _992 = _990.x;
    float _994 = _990.y;
    float _996 = _990.z;
    float _998 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[56]);
    float _1000 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[57]);
    float _1002 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[58]);
    float _1004 = _992 + (-0.5);
    float _1006 = _994 + (-0.5);
    float _1008 = _996 + (-0.5);
    float _1010 = _1004 * _998;
    float _1012 = _1006 * _1000;
    float _1014 = _1008 * _1002;
    float _1016 = _1008;
    float _1018 = _1014;
    float _1020 = _996;
    if (!_590)
    {
        _328 = _1010;
    }
    float _1022 = _328;
    float _1024 = _1022;
    float _1026 = _1022;
    if (!_590)
    {
        _1016 = _1012;
    }
    float _1028 = _1016;
    bool _1030 = !_590;
    float _1032 = _1028;
    float _1034 = _1028;
    if (!_1030)
    {
        bool _1036 = !_178;
        if (!_1036)
        {
            float _1038 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
            float _1040 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
            float _1042 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
            float _1044 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
            float _1046 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
            float _1048 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
            float _1050 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
            float _1052 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
            float _1054 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
            float _1056 = _1042 * _1044;
            float _1058 = _1042 * _1046;
            float _1060 = _1040 * _1044;
            float _1062 = -_1056;
            float _1064 = fma(_1038, _1048, _1062);
            float _1066 = -_1058;
            float _1068 = fma(_1040, _1048, _1066);
            float _1070 = -_1060;
            float _1072 = fma(_1038, _1046, _1070);
            float _1074 = _1052 * _1038;
            float _1076 = _1052 * _1064;
            float _1078 = _1054 * _1040;
            float _1080 = _1050 * _1046;
            float _1082 = -_1074;
            float _1084 = fma(_1050, _1040, _1082);
            float _1086 = -_1076;
            float _1088 = fma(_1050, _1068, _1086);
            float _1090 = _1052 * _1048;
            float _1092 = _1054 * _1044;
            float _1094 = _1050 * _1042;
            float _1096 = fma(_1054, _1072, _1088);
            float _1098 = -_1090;
            float _1100 = fma(_1054, _1046, _1098);
            float _1102 = -_1092;
            float _1104 = fma(_1050, _1048, _1102);
            float _1106 = -_1080;
            float _1108 = fma(_1052, _1044, _1106);
            float _1110 = 1.0 / _1096;
            float _1112 = -_1094;
            float _1114 = fma(_1054, _1038, _1112);
            float _1116 = -_1038;
            float _1118 = fma(_1116, _1048, _1056);
            float _1120 = -_1078;
            float _1122 = fma(_1052, _1042, _1120);
            float _1124 = _1100 * _1110;
            float _1126 = _1104 * _1110;
            float _1128 = _1108 * _1110;
            float _1130 = _1118 * _1110;
            float _1132 = _1012 * _1124;
            float _1134 = _1012 * _1126;
            float _1136 = _1010 * _1110;
            float _1138 = _1012 * _1128;
            float _1140 = _1122 * _1110;
            float _1142 = _1114 * _1110;
            float _1144 = fma(_1068, _1136, _1132);
            float _1146 = fma(_1010, _1130, _1134);
            float _1148 = _1084 * _1110;
            float _1150 = fma(_1072, _1136, _1138);
            float _1152 = fma(_1014, _1140, _1144);
            float _1154 = fma(_1014, _1142, _1146);
            float _1156 = fma(_1014, _1148, _1150);
            _1034 = _1154;
            _1018 = _1156;
            _1020 = _1144;
            _1026 = _1152;
            _1158 = true;
        }
        else
        {
            int _1160 = as_type<int>(_162) & 1024;
            bool _1162 = _1160 != 0;
            if (_1162)
            {
                _614 = true;
            }
            bool _1164 = _614;
            bool _1166 = _1164;
            if (!_1162)
            {
                int _1168 = as_type<int>(_162) & 2048;
                bool _1170 = _1168 != 0;
                _1166 = _1170;
            }
            bool _1172 = _1166;
            if (!_1172)
            {
                _1024 = _1010;
            }
            float _1174 = _1024;
            _1026 = _1174;
            if (!_1172)
            {
                _1032 = _1012;
            }
            float _1176 = _1032;
            bool _1178 = !_1172;
            _1034 = _1176;
            if (!_1178)
            {
                uint _1180 = uint(int(uint(_234) >> uint(2)));
                float _1182 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1180)]);
                int _1184 = _234 + 4;
                uint _1186 = uint(int(uint(_1184) >> uint(2)));
                float _1188 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1186)]);
                int _1190 = _234 + 8;
                uint _1192 = uint(int(uint(_1190) >> uint(2)));
                float _1194 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1192)]);
                uint _1196 = uint(int(uint(_234) >> uint(2)));
                float _1198 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1196)]);
                int _1200 = _234 + 4;
                uint _1202 = uint(int(uint(_1200) >> uint(2)));
                float _1204 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1202)]);
                int _1206 = _234 + 8;
                uint _1208 = uint(int(uint(_1206) >> uint(2)));
                float _1210 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1208)]);
                uint _1212 = uint(int(uint(_234) >> uint(2)));
                float _1214 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1212)]);
                int _1216 = _234 + 4;
                uint _1218 = uint(int(uint(_1216) >> uint(2)));
                float _1220 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1218)]);
                int _1222 = _234 + 8;
                uint _1224 = uint(int(uint(_1222) >> uint(2)));
                float _1226 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1224)]);
                float _1228 = _1194 * _1198;
                float _1230 = _1194 * _1204;
                float _1232 = _1188 * _1198;
                float _1234 = -_1228;
                float _1236 = fma(_1182, _1210, _1234);
                float _1238 = -_1230;
                float _1240 = fma(_1188, _1210, _1238);
                float _1242 = -_1232;
                float _1244 = fma(_1182, _1204, _1242);
                float _1246 = _1220 * _1182;
                float _1248 = _1220 * _1236;
                float _1250 = _1226 * _1188;
                float _1252 = _1214 * _1204;
                float _1254 = -_1246;
                float _1256 = fma(_1214, _1188, _1254);
                float _1258 = -_1248;
                float _1260 = fma(_1214, _1240, _1258);
                float _1262 = _1220 * _1210;
                float _1264 = _1226 * _1198;
                float _1266 = _1214 * _1194;
                float _1268 = fma(_1226, _1244, _1260);
                float _1270 = -_1262;
                float _1272 = fma(_1226, _1204, _1270);
                float _1274 = -_1264;
                float _1276 = fma(_1214, _1210, _1274);
                float _1278 = -_1252;
                float _1280 = fma(_1220, _1198, _1278);
                float _1282 = 1.0 / _1268;
                float _1284 = -_1266;
                float _1286 = fma(_1226, _1182, _1284);
                float _1288 = -_1182;
                float _1290 = fma(_1288, _1210, _1228);
                float _1292 = -_1250;
                float _1294 = fma(_1220, _1194, _1292);
                float _1296 = _1272 * _1282;
                float _1298 = _1276 * _1282;
                float _1300 = _1280 * _1282;
                float _1302 = _1290 * _1282;
                float _1304 = _1012 * _1296;
                float _1306 = _1012 * _1298;
                float _1308 = _1010 * _1282;
                float _1310 = _1012 * _1300;
                float _1312 = _1294 * _1282;
                float _1314 = _1286 * _1282;
                float _1316 = fma(_1240, _1308, _1304);
                float _1318 = fma(_1010, _1302, _1306);
                float _1320 = _1256 * _1282;
                float _1322 = fma(_1244, _1308, _1310);
                float _1324 = fma(_1014, _1312, _1316);
                float _1326 = fma(_1014, _1314, _1318);
                float _1328 = fma(_1014, _1320, _1322);
                _1034 = _1326;
                _1018 = _1328;
                _1020 = _1316;
                _1026 = _1324;
            }
        }
    }
    _1158 = false;
    float _1330 = _1034;
    float _1332 = _1018;
    float _1334 = _1020;
    float _1336 = _1026;
    float _1338 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[86]);
    float _1340 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[85]);
    float _1342 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[84]);
    float _1344 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[128]);
    float _1346 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[129]);
    float _1348 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[130]);
    float _1350 = fma(_160, _1330, _588);
    float _1352 = fma(_160, _1332, _602);
    uint _1354 = uint(int(uint(_236) >> uint(2)));
    float _1356 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_1354)]);
    bool _1358 = _1338 > 0.0;
    bool _1360 = _1340 > 0.0;
    float _1362 = _1342 * _1340;
    float _1364 = _160 * _1344;
    float _1366 = _1334;
    float _1368 = _1342;
    bool _1370 = _1360;
    float _1372 = _1332;
    if (_1358)
    {
        float _1374 = 1.0 / _1338;
        _1366 = _1374;
    }
    float _1376 = _1366;
    float _1378 = _160 * _1348;
    if (_1360)
    {
        float _1380 = -_1362;
        float _1382 = fma(_294, _1380, _1342);
        _1368 = _1382;
    }
    float _1384 = _1368;
    float _1386 = _160 * _1346;
    float _1388 = _1376;
    float _1390 = _1384;
    if (_1358)
    {
        float _1392 = _606 * _1376;
        _616 = _1392;
    }
    float _1394 = _616;
    if (_1358)
    {
        float _1396 = precise::min(_1394, 1.0);
        _1388 = _1396;
    }
    float _1398 = _1388;
    float _1400 = fma(_160, _1336, _594);
    if (_1358)
    {
        float _1402 = _1398 * _1384;
        _1390 = _1402;
    }
    float _1404 = _1390;
    float _1406 = _1364 * _1404;
    float _1408 = _1386 * _1404;
    float _1410 = _1378 * _1404;
    bool _1412 = !_178;
    float _1414 = _1406;
    float _1416 = _1410;
    float _1538;
    if (!_1412)
    {
        float _1418 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _1420 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _1422 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _1424 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _1426 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _1428 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _1430 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _1432 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _1434 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _1436 = _1422 * _1424;
        float _1438 = _1422 * _1426;
        float _1440 = _1420 * _1424;
        float _1442 = -_1436;
        float _1444 = fma(_1418, _1428, _1442);
        float _1446 = -_1438;
        float _1448 = fma(_1420, _1428, _1446);
        float _1450 = _1434 * _1420;
        float _1452 = _1434 * _1424;
        float _1454 = _1432 * _1444;
        float _1456 = -_1440;
        float _1458 = fma(_1418, _1426, _1456);
        float _1460 = _1432 * _1418;
        float _1462 = _1430 * _1426;
        float _1464 = -_1454;
        float _1466 = fma(_1430, _1448, _1464);
        float _1468 = -_1452;
        float _1470 = fma(_1430, _1428, _1468);
        float _1472 = -_1460;
        float _1474 = fma(_1430, _1420, _1472);
        float _1476 = _1432 * _1428;
        float _1478 = fma(_1434, _1458, _1466);
        float _1480 = -_1450;
        float _1482 = fma(_1432, _1422, _1480);
        float _1484 = _1430 * _1422;
        float _1486 = -_1476;
        float _1488 = fma(_1434, _1426, _1486);
        float _1490 = 1.0 / _1478;
        float _1492 = -_1462;
        float _1494 = fma(_1432, _1424, _1492);
        float _1496 = -_1484;
        float _1498 = fma(_1434, _1418, _1496);
        float _1500 = _1488 * _1490;
        float _1502 = _1470 * _1490;
        float _1504 = -_1418;
        float _1506 = fma(_1504, _1428, _1436);
        float _1508 = _1494 * _1490;
        float _1510 = _1500 * _1408;
        float _1512 = _1502 * _1408;
        float _1514 = _1406 * _1490;
        float _1516 = _1506 * _1490;
        float _1518 = _1508 * _1408;
        float _1520 = _1482 * _1490;
        float _1522 = _1498 * _1490;
        float _1524 = fma(_1448, _1514, _1510);
        float _1526 = fma(_1516, _1406, _1512);
        float _1528 = _1474 * _1490;
        float _1530 = fma(_1458, _1514, _1518);
        float _1532 = fma(_1520, _1410, _1524);
        float _1534 = fma(_1522, _1410, _1526);
        float _1536 = fma(_1528, _1410, _1530);
        _1414 = _1532;
        _1538 = _1534;
        _1416 = _1536;
        _1540 = true;
    }
    else
    {
        int _1542 = as_type<int>(_162) & 1024;
        bool _1544 = _1542 != 0;
        if (_1544)
        {
            _1370 = true;
        }
        bool _1546 = _1370;
        bool _1548 = _1546;
        if (!_1544)
        {
            int _1550 = as_type<int>(_162) & 2048;
            bool _1552 = _1550 != 0;
            _1548 = _1552;
        }
        bool _1554 = _1548;
        if (!_1554)
        {
            _1372 = _1408;
        }
        float _1556 = _1372;
        bool _1558 = !_1554;
        _1538 = _1556;
        if (!_1558)
        {
            uint _1560 = uint(int(uint(_234) >> uint(2)));
            float _1562 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1560)]);
            int _1564 = _234 + 4;
            uint _1566 = uint(int(uint(_1564) >> uint(2)));
            float _1568 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1566)]);
            int _1570 = _234 + 8;
            uint _1572 = uint(int(uint(_1570) >> uint(2)));
            float _1574 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1572)]);
            uint _1576 = uint(int(uint(_234) >> uint(2)));
            float _1578 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1576)]);
            int _1580 = _234 + 4;
            uint _1582 = uint(int(uint(_1580) >> uint(2)));
            float _1584 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1582)]);
            int _1586 = _234 + 8;
            uint _1588 = uint(int(uint(_1586) >> uint(2)));
            float _1590 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1588)]);
            uint _1592 = uint(int(uint(_234) >> uint(2)));
            float _1594 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1592)]);
            int _1596 = _234 + 4;
            uint _1598 = uint(int(uint(_1596) >> uint(2)));
            float _1600 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1598)]);
            int _1602 = _234 + 8;
            uint _1604 = uint(int(uint(_1602) >> uint(2)));
            float _1606 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1604)]);
            float _1608 = _1574 * _1578;
            float _1610 = _1574 * _1584;
            float _1612 = _1568 * _1578;
            float _1614 = -_1608;
            float _1616 = fma(_1562, _1590, _1614);
            float _1618 = -_1610;
            float _1620 = fma(_1568, _1590, _1618);
            float _1622 = _1606 * _1568;
            float _1624 = _1606 * _1578;
            float _1626 = _1600 * _1616;
            float _1628 = -_1612;
            float _1630 = fma(_1562, _1584, _1628);
            float _1632 = _1600 * _1562;
            float _1634 = _1594 * _1584;
            float _1636 = -_1626;
            float _1638 = fma(_1594, _1620, _1636);
            float _1640 = -_1624;
            float _1642 = fma(_1594, _1590, _1640);
            float _1644 = -_1632;
            float _1646 = fma(_1594, _1568, _1644);
            float _1648 = _1600 * _1590;
            float _1650 = fma(_1606, _1630, _1638);
            float _1652 = -_1622;
            float _1654 = fma(_1600, _1574, _1652);
            float _1656 = _1594 * _1574;
            float _1658 = -_1648;
            float _1660 = fma(_1606, _1584, _1658);
            float _1662 = 1.0 / _1650;
            float _1664 = -_1634;
            float _1666 = fma(_1600, _1578, _1664);
            float _1668 = -_1656;
            float _1670 = fma(_1606, _1562, _1668);
            float _1672 = _1660 * _1662;
            float _1674 = _1642 * _1662;
            float _1676 = -_1562;
            float _1678 = fma(_1676, _1590, _1608);
            float _1680 = _1666 * _1662;
            float _1682 = _1672 * _1408;
            float _1684 = _1674 * _1408;
            float _1686 = _1406 * _1662;
            float _1688 = _1678 * _1662;
            float _1690 = _1680 * _1408;
            float _1692 = _1654 * _1662;
            float _1694 = _1670 * _1662;
            float _1696 = fma(_1620, _1686, _1682);
            float _1698 = fma(_1688, _1406, _1684);
            float _1700 = _1646 * _1662;
            float _1702 = fma(_1630, _1686, _1690);
            float _1704 = fma(_1692, _1410, _1696);
            float _1706 = fma(_1694, _1410, _1698);
            float _1708 = fma(_1700, _1410, _1702);
            _1414 = _1704;
            _1538 = _1706;
            _1416 = _1708;
        }
    }
    _1540 = false;
    float _1710 = _1414;
    float _1712 = _1538;
    float _1714 = _1416;
    float _1716 = _596 + _1710;
    float _1718 = _598 + _1712;
    int _1720 = _234 + 4;
    float _1722 = _600 + _1714;
    int _1724 = _234 + 8;
    uint _1726 = uint(int(uint(_236) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1726)] = as_type<uint>(_1356);
    float _1728 = -_240;
    float _1730 = _1728 + _1716;
    float _1732 = -_246;
    float _1734 = _1732 + _1718;
    uint _1736 = uint(int(uint(_234) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1736)] = as_type<uint>(_1716);
    float _1738 = -_252;
    float _1740 = _1738 + _1722;
    uint _1742 = uint(int(uint(_1720) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1742)] = as_type<uint>(_1718);
    uint _1744 = uint(int(uint(_1724) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1744)] = as_type<uint>(_1722);
    uint _1746 = uint(int(uint(_234) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_1746)] = as_type<uint>(_1400);
    uint _1748 = uint(int(uint(_1720) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_1748)] = as_type<uint>(_1350);
    uint _1750 = uint(int(uint(_1724) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_1750)] = as_type<uint>(_1352);
    uint _1752 = uint(int(uint(_234) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1752)] = as_type<uint>(_1730);
    uint _1754 = uint(int(uint(_1720) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1754)] = as_type<uint>(_1734);
    uint _1756 = uint(int(uint(_1724) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1756)] = as_type<uint>(_1740);
    float _1758 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _1760 = _1734 * _1734;
    float _1762 = _1350 * _1350;
    float _1764 = fma(_1730, _1730, _1760);
    float _1766 = fma(_1400, _1400, _1762);
    float _1768 = fma(_1740, _1740, _1764);
    float _1770 = fma(_1352, _1352, _1766);
    float _1772 = sqrt(_1770);
    float _1774 = sqrt(_1768);
    bool _1776 = _1774 >= 9.9999999747524270787835121154785e-07;
    bool _1778 = isnan(_1774);
    bool _1780 = _1776 || _1778;
    bool _1782 = isnan(9.9999999747524270787835121154785e-07);
    bool _1784 = _1780 || _1782;
    if (!_1784)
    {
        bool _1786 = _546 != _302;
        bool _1788 = isnan(_546);
        bool _1790 = _1786 || _1788;
        bool _1792 = isnan(_302);
        bool _1794 = _1790 || _1792;
        _1796 = _1794;
        if (!_1796)
        {
            float _1798 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
            bool _1800 = _1798 > 0.0;
            bool _1802 = !_1800;
            if (!_1802)
            {
                float _1804 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
                float _1806 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
                float _1808 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
                float _1810 = _1806 * _526;
                float _1812 = _1806 * _522;
                float _1814 = _1806 * _528;
                float _1816 = fma(_1804, _532, _1810);
                float _1818 = fma(_1804, _524, _1812);
                float _1820 = fma(_1804, _534, _1814);
                float _1822 = fma(_1808, _536, _1816);
                float _1824 = fma(_1808, _530, _1818);
                float _1826 = fma(_1808, _538, _1820);
                float _1828 = _1822 * _1822;
                float _1830 = fma(_1824, _1824, _1828);
                float _1832 = fma(_1826, _1826, _1830);
                float _1834 = rsqrt(_1832);
                float _1836 = _1834 * 9.9999999747524270787835121154785e-07;
                float _1838 = _1824 * _1836;
                float _1840 = _1822 * _1836;
                float _1842 = _1826 * _1836;
                _342 = as_type<int>(_1838);
                _344 = as_type<int>(_1840);
                _346 = as_type<int>(_1842);
                _1796 = true;
            }
            else
            {
                bool _1844 = _1772 >= 9.9999999747524270787835121154785e-07;
                bool _1846 = isnan(_1772);
                bool _1848 = _1844 || _1846;
                bool _1850 = isnan(9.9999999747524270787835121154785e-07);
                bool _1852 = _1848 || _1850;
                if (!_1852)
                {
                    float _1854 = _1718 * _1718;
                    float _1856 = fma(_1716, _1716, _1854);
                    float _1858 = fma(_1722, _1722, _1856);
                    float _1860 = sqrt(_1858);
                    bool _1862 = _1860 >= 9.9999999747524270787835121154785e-07;
                    bool _1864 = isnan(_1860);
                    bool _1866 = _1862 || _1864;
                    bool _1868 = isnan(9.9999999747524270787835121154785e-07);
                    bool _1870 = _1866 || _1868;
                    float _1872 = _1860;
                    if (_1870)
                    {
                        float _1874 = rsqrt(_1858);
                        _1872 = _1874;
                    }
                    float _1876 = _1872;
                    if (!_1870)
                    {
                        _330 = 0;
                    }
                    int _1878 = _330;
                    int _1880 = _1878;
                    if (!_1870)
                    {
                        _332 = 897988541;
                    }
                    int _1882 = _332;
                    int _1884 = _1882;
                    if (!_1870)
                    {
                        _334 = 0;
                    }
                    int _1886 = _334;
                    float _1888 = _1876;
                    int _1890 = _1886;
                    if (_1870)
                    {
                        float _1892 = _1876 * 9.9999999747524270787835121154785e-07;
                        _1888 = _1892;
                    }
                    float _1894 = _1888;
                    if (_1870)
                    {
                        float _1896 = _1716 * _1894;
                        _1880 = as_type<int>(_1896);
                    }
                    int _1898 = _1880;
                    _342 = _1898;
                    if (_1870)
                    {
                        float _1900 = _1718 * _1894;
                        _1884 = as_type<int>(_1900);
                    }
                    int _1902 = _1884;
                    _344 = _1902;
                    if (_1870)
                    {
                        float _1904 = _1722 * _1894;
                        _1890 = as_type<int>(_1904);
                    }
                    int _1906 = _1890;
                    _346 = _1906;
                    _1796 = true;
                }
                else
                {
                    float _1908 = rsqrt(_1770);
                    float _1910 = _1908 * 9.9999999747524270787835121154785e-07;
                    float _1912 = _1400 * _1910;
                    float _1914 = _1350 * _1910;
                    float _1916 = _1352 * _1910;
                    _342 = as_type<int>(_1912);
                    _344 = as_type<int>(_1914);
                    _346 = as_type<int>(_1916);
                    _1796 = true;
                }
            }
        }
    }
    else
    {
        float _1918 = _1772 * _1758;
        bool _1920 = _1918 >= 0.001000000047497451305389404296875;
        bool _1922 = isnan(_1918);
        bool _1924 = _1920 || _1922;
        bool _1926 = isnan(0.001000000047497451305389404296875);
        bool _1928 = _1924 || _1926;
        bool _1930 = _1918 > 0.0;
        bool _1932 = !_1928;
        bool _1934 = _1930 && _1932;
        bool _1936 = _1774 < 0.001000000047497451305389404296875;
        bool _1938 = _1936 && _1934;
        if (!_1938)
        {
            _336 = as_type<int>(_1730);
        }
        int _1940 = _336;
        int _1942 = _1940;
        if (_1938)
        {
            float _1944 = _1400 * _1758;
            _1942 = as_type<int>(_1944);
        }
        int _1946 = _1942;
        _342 = _1946;
        if (!_1938)
        {
            _338 = as_type<int>(_1734);
        }
        int _1948 = _338;
        int _1950 = _1948;
        if (_1938)
        {
            float _1952 = _1350 * _1758;
            _1950 = as_type<int>(_1952);
        }
        int _1954 = _1950;
        _344 = _1954;
        if (!_1938)
        {
            _340 = as_type<int>(_1740);
        }
        int _1956 = _340;
        _346 = _1956;
        if (_1938)
        {
            float _1958 = _1352 * _1758;
            _346 = as_type<int>(_1958);
        }
    }
    _1796 = false;
    int _1960 = _342;
    int _1962 = _344;
    int _1964 = _346;
    uint _1966 = uint(int(uint(_234) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1966)] = uint(_1960);
    uint _1968 = uint(int(uint(_1720) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1968)] = uint(_1962);
    uint _1970 = uint(int(uint(_1724) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1970)] = uint(_1964);
}

