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

struct _23
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _16* cp_c1 [[id(0)]];
    device _23* cp_s0 [[id(1)]];
    device _23* cp_s1 [[id(2)]];
    device _23* cp_s2 [[id(3)]];
    device _23* cp_s3 [[id(4)]];
    device _23* cp_s4 [[id(5)]];
    device _23* cp_s5 [[id(6)]];
    device _23* cp_s6 [[id(7)]];
    device _23* cp_s7 [[id(8)]];
    device _23* cp_s8 [[id(9)]];
    device _23* cp_s9 [[id(10)]];
    device _23* cp_s10 [[id(11)]];
    device _23* cp_s11 [[id(12)]];
    device _23* cp_s12 [[id(13)]];
    device _23* cp_s13 [[id(14)]];
    device _23* cp_s14 [[id(15)]];
    device _23* cp_s15 [[id(16)]];
    texture2d_array<float> cp_t_tcb_14 [[id(17)]];
    sampler cp_t_tcb_14Smplr [[id(18)]];
    texture2d_array<float> cp_t_tcb_16 [[id(19)]];
    sampler cp_t_tcb_16Smplr [[id(20)]];
    texture2d<float> cp_t_tcb_2A [[id(21)]];
    sampler cp_t_tcb_2ASmplr [[id(22)]];
    texture2d<float> cp_t_tcb_2C [[id(23)]];
    sampler cp_t_tcb_2CSmplr [[id(24)]];
    texture2d<float> cp_t_tcb_26 [[id(25)]];
    sampler cp_t_tcb_26Smplr [[id(26)]];
    sampler cp_t_tcb_14Smplr_w [[id(27)]];
    sampler cp_t_tcb_2ASmplr_w [[id(28)]];
    sampler cp_t_tcb_2CSmplr_w [[id(29)]];
    sampler cp_t_tcb_26Smplr_w [[id(30)]];
    constant dm_border_t* dm_border [[id(31)]];
};

static inline __attribute__((always_inline))
void _87(thread const int& _24575, thread const int& _24576, thread const int& _24577, thread const int& _24578, thread int& _24579, thread int& _24580, thread int& _24581, thread int& _24582, thread int& _24583, thread int& _24584)
{
    float _24587 = as_type<float>(_24577) + 0.0;
    bool _24589 = _24587 != 0.0;
    bool _24591 = isnan(_24587);
    bool _24593 = _24589 || _24591;
    bool _24595 = isnan(0.0);
    bool _24597 = _24593 || _24595;
    int _24599 = _24575;
    int _24601 = _24576;
    int _24603 = _24577;
    int _24605 = _24597 ? (-1) : 0;
    if (!_24597)
    {
        float _24607 = as_type<float>(_24577) * 1.0;
        _24599 = as_type<int>(_24607);
    }
    int _24609 = _24599;
    bool _24611 = !_24597;
    int _24613 = _24609;
    int _24615 = _24609;
    if (!_24611)
    {
        float _24617 = as_type<float>(_24577) + 0.0;
        bool _24619 = _24617 >= 0.0;
        bool _24621 = isnan(_24617);
        bool _24623 = _24619 || _24621;
        bool _24625 = isnan(0.0);
        bool _24627 = _24623 || _24625;
        _24605 = _24627 ? (-1) : 0;
        if (!_24627)
        {
            _24613 = 2147483647;
        }
        int _24629 = _24613;
        bool _24631 = !_24627;
        int _24633 = _24629;
        _24615 = _24629;
        if (!_24631)
        {
            float _24635 = as_type<float>(_24577) + 0.0;
            bool _24637 = _24635 > as_type<float>(0x7f800000u /* inf */);
            bool _24639 = isnan(_24635);
            bool _24641 = _24637 || _24639;
            bool _24643 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _24645 = _24641 || _24643;
            _24605 = _24645 ? (-1) : 0;
            if (_24645)
            {
                float _24647 = as_type<float>(_24577) + 1.0;
                _24633 = as_type<int>(_24647);
            }
            int _24649 = _24633;
            int _24651 = _24649;
            _24615 = _24649;
            if (!_24645)
            {
                float _24653 = 0.0 + as_type<float>(_24577);
                bool _24655 = _24653 != as_type<float>(0x7f800000u /* inf */);
                bool _24657 = isnan(_24653);
                bool _24659 = _24655 || _24657;
                bool _24661 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _24663 = _24659 || _24661;
                _24605 = _24663 ? (-1) : 0;
                if (!_24663)
                {
                    _24651 = _24577;
                }
                int _24665 = _24651;
                bool _24667 = !_24663;
                _24615 = _24665;
                if (!_24667)
                {
                    float _24669 = as_type<float>(_24577) * 18446744073709551616.0;
                    float _24671 = rsqrt(_24669);
                    float _24673 = _24669 * _24671;
                    float _24675 = _24671 * 0.5;
                    float _24677 = -_24673;
                    float _24679 = 0.0 + _24677;
                    float _24681 = fma(_24675, _24679, 0.5);
                    float _24683 = fma(_24673, _24681, _24673);
                    float _24685 = -_24683;
                    float _24687 = 0.0 + _24685;
                    float _24689 = fma(_24683, _24687, _24669);
                    float _24691 = fma(_24675, _24689, _24683);
                    float _24693 = _24691 * 2.3283064365386962890625e-10;
                    _24615 = as_type<int>(_24693);
                    _24601 = as_type<int>(_24683);
                    _24603 = as_type<int>(_24679);
                }
            }
        }
    }
    int _24695 = _24615;
    int _24697 = _24601;
    int _24699 = _24603;
    int _24701 = _24605;
    _24579 = _24578;
    _24580 = 0;
    _24581 = _24695;
    _24582 = _24697;
    _24583 = _24699;
    _24584 = _24701;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]])
{
    bool _9752 = false;
    bool _8114 = false;
    bool _7786 = false;
    bool _7364 = false;
    bool _6674 = false;
    bool _6478 = false;
    bool _6104 = false;
    bool _5154 = false;
    bool _4910 = false;
    bool _4534 = false;
    bool _3644 = false;
    bool _2990 = false;
    bool _3034 = false;
    bool _2802 = false;
    bool _558 = false;
    float _91 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[9]);
    float _93 = as_type<float>(gl_LocalInvocationID.x);
    float _95 = as_type<float>(gl_WorkGroupID.x);
    int _97 = as_type<int>(_95) << 5;
    int _99 = _97 + as_type<int>(_93);
    float _101 = trunc(_91);
    int _103 = int(_101);
    bool _107 = _99 >= _103;
    int _109 = 0;
    if (_107)
    {
        _109 = 0;
    }
    int _111 = _109;
    int _113 = _111;
    int _115 = _111;
    if (!_107)
    {
        int _117 = _99 << 4;
        int _119 = _117 + 12;
        uint _122 = uint(int(uint(_119) >> uint(2)));
        float _124 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_122)]);
        float _126 = trunc(_124);
        int _128 = int(_126);
        bool _130 = _128 >= 1;
        int _132 = _130 ? (-1) : 0;
        if (!_130)
        {
            _113 = 0;
        }
        int _134 = _113;
        bool _136 = !_130;
        _115 = _134;
        if (!_136)
        {
            float _138 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
            uint _140 = uint(int(uint(_119) >> uint(2)));
            float _142 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_140)]);
            float _144 = float(_128);
            float _146 = -_142;
            float _148 = _138 + _146;
            bool _150 = _148 > _144;
            int _152 = as_type<int>(_138);
            if (!_150)
            {
                bool _154 = _138 >= _142;
                bool _156 = isnan(_138);
                bool _158 = _154 || _156;
                bool _160 = isnan(_142);
                bool _162 = _158 || _160;
                _132 = _162 ? (-1) : 0;
            }
            int _164 = _132;
            if (_150)
            {
                _152 = 0;
            }
            int _166 = _152;
            _115 = _166;
            if (!_150)
            {
                int _168 = ~_164;
                int _170 = (_168 != 0) ? 0 : 1;
                _115 = _170;
            }
        }
    }
    int _172 = _115;
    int _174 = _172 & 1;
    bool _176 = _174 != 0;
    if (!_176)
    {
        return;
    }
    float _178 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[86]);
    int _180 = _99 << 4;
    float _182 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[68]);
    int _184 = _180 + 12;
    float _186 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[85]);
    float _188 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _190 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
    uint _192 = uint(int(uint(_184) >> uint(2)));
    float _194 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_192)]);
    float _196 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[84]);
    uint _198 = uint(int(uint(_180) >> uint(2)));
    float _200 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_198)]);
    int _202 = _180 + 4;
    uint _204 = uint(int(uint(_202) >> uint(2)));
    float _206 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_204)]);
    float _208 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[30]);
    float _210 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[67]);
    float _212 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[64]);
    float _214 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[65]);
    float _216 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[66]);
    uint _218 = uint(int(uint(_180) >> uint(2)));
    float _220 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_218)]);
    int _222 = _180 + 4;
    uint _224 = uint(int(uint(_222) >> uint(2)));
    float _226 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_224)]);
    int _228 = _180 + 8;
    uint _230 = uint(int(uint(_228) >> uint(2)));
    float _232 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_230)]);
    uint _234 = uint(int(uint(_184) >> uint(2)));
    float _236 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_234)]);
    uint _238 = uint(int(uint(_180) >> uint(2)));
    float _240 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_238)]);
    int _242 = _180 + 4;
    uint _244 = uint(int(uint(_242) >> uint(2)));
    float _246 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_244)]);
    int _248 = _180 + 8;
    uint _250 = uint(int(uint(_248) >> uint(2)));
    float _252 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_250)]);
    float _254 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[128]);
    float _256 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[129]);
    float _258 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[130]);
    float _260 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[131]);
    uint _262 = uint(int(uint(_180) >> uint(2)));
    float _264 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_262)]);
    int _266 = _180 + 4;
    uint _268 = uint(int(uint(_266) >> uint(2)));
    float _270 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_268)]);
    int _272 = _180 + 8;
    uint _274 = uint(int(uint(_272) >> uint(2)));
    float _276 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_274)]);
    int _278 = _180 + 12;
    uint _280 = uint(int(uint(_278) >> uint(2)));
    float _282 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_280)]);
    uint _284 = uint(int(uint(_184) >> uint(2)));
    float _286 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_284)]);
    bool _288 = _178 > 0.0;
    float _290 = abs(_182);
    float _292 = log2(_290);
    bool _294 = _186 > 0.0;
    float _296 = 0.0;
    float _298 = _196;
    float _300 = _212;
    float _302 = _220;
    float _304 = _226;
    float _306 = _232;
    float _308 = _188;
    float _310 = _208;
    float _312 = _254;
    float _314 = _256;
    float _316 = _258;
    float _318 = _260;
    if (_288)
    {
        float _320 = 1.0 / _178;
        _296 = _320;
    }
    float _322 = _296;
    float _324 = _188 * _292;
    float _326 = -_194;
    float _328 = _190 + _326;
    float _330 = _196 * _186;
    float _332 = exp2(_324);
    float _334 = _322;
    float _336 = _328;
    if (_288)
    {
        float _338 = _328 * _322;
        _334 = _338;
    }
    float _340 = _334;
    float _342 = _340;
    if (_294)
    {
        float _344 = -_330;
        float _346 = fma(_200, _344, _196);
        _298 = _346;
    }
    float _348 = _298;
    int _350 = as_type<int>(_208) & 512;
    bool _352 = _350 != 0;
    float _354 = _348;
    bool _356 = _352;
    if (_288)
    {
        float _358 = precise::min(_340, 1.0);
        _342 = _358;
    }
    float _360 = _342;
    float _362 = _188 * _210;
    if (_288)
    {
        float _364 = _360 * _348;
        _354 = _364;
    }
    float _366 = _354;
    float _368 = _214 * _362;
    float _370 = _212 * _362;
    float _372 = _216 * _362;
    float _374 = _188 * _366;
    float _376 = fma(_226, _332, _368);
    float _378 = _236 * _188;
    float _380 = fma(_220, _332, _370);
    float _382 = fma(_232, _332, _372);
    float _384 = fma(_220, _378, _240);
    float _386 = fma(_226, _378, _246);
    float _388 = fma(_232, _378, _252);
    float _390 = _254 * _374;
    float _392 = _256 * _374;
    float _394 = _258 * _374;
    bool _396 = !_352;
    float _398 = _282;
    float _400 = _374;
    float _402 = _378;
    float _404 = _368;
    float _406 = _332;
    float _408 = _370;
    float _410 = _384;
    float _412 = _286;
    int _414 = as_type<int>(_264);
    int _416 = as_type<int>(_270);
    int _418 = as_type<int>(_276);
    int _420 = as_type<int>(_264);
    int _422 = as_type<int>(_270);
    int _424 = as_type<int>(_276);
    int _426 = as_type<int>(_264);
    int _428 = as_type<int>(_270);
    int _430 = as_type<int>(_276);
    float _552;
    float _554;
    float _556;
    if (!_396)
    {
        float _432 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _434 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _436 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _438 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _440 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _442 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _444 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _446 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _448 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _450 = _436 * _438;
        float _452 = _436 * _440;
        float _454 = _434 * _438;
        float _456 = -_450;
        float _458 = fma(_432, _442, _456);
        float _460 = -_452;
        float _462 = fma(_434, _442, _460);
        float _464 = -_454;
        float _466 = fma(_432, _440, _464);
        float _468 = _446 * _432;
        float _470 = _446 * _458;
        float _472 = _448 * _434;
        float _474 = _444 * _440;
        float _476 = -_468;
        float _478 = fma(_444, _434, _476);
        float _480 = -_470;
        float _482 = fma(_444, _462, _480);
        float _484 = _446 * _442;
        float _486 = _448 * _438;
        float _488 = -_474;
        float _490 = fma(_446, _438, _488);
        float _492 = fma(_448, _466, _482);
        float _494 = -_484;
        float _496 = fma(_448, _440, _494);
        float _498 = -_486;
        float _500 = fma(_444, _442, _498);
        float _502 = _444 * _436;
        float _504 = 1.0 / _492;
        float _506 = -_432;
        float _508 = fma(_506, _442, _450);
        float _510 = -_472;
        float _512 = fma(_446, _436, _510);
        float _514 = -_502;
        float _516 = fma(_448, _432, _514);
        float _518 = _496 * _504;
        float _520 = _500 * _504;
        float _522 = _490 * _504;
        float _524 = _390 * _504;
        float _526 = _392 * _518;
        float _528 = _392 * _520;
        float _530 = _392 * _522;
        float _532 = _508 * _504;
        float _534 = _512 * _504;
        float _536 = fma(_462, _524, _526);
        float _538 = _516 * _504;
        float _540 = _478 * _504;
        float _542 = fma(_390, _532, _528);
        float _544 = fma(_466, _524, _530);
        float _546 = fma(_394, _534, _536);
        float _548 = fma(_394, _538, _542);
        float _550 = fma(_394, _540, _544);
        _302 = _432;
        _304 = _518;
        _306 = _436;
        _402 = _492;
        _308 = _444;
        _310 = _446;
        _404 = _448;
        _406 = _528;
        _312 = _526;
        _314 = _524;
        _316 = _542;
        _318 = _450;
        _552 = _548;
        _554 = _546;
        _556 = _550;
        _408 = _466;
        _558 = true;
    }
    else
    {
        int _560 = as_type<int>(_208) & 1024;
        bool _562 = _560 != 0;
        if (_562)
        {
            _356 = true;
        }
        bool _564 = _356;
        bool _566 = _564;
        if (!_562)
        {
            int _568 = as_type<int>(_208) & 2048;
            bool _570 = _568 != 0;
            _566 = _570;
        }
        bool _572 = _566;
        if (!_572)
        {
            _398 = _390;
        }
        float _574 = _398;
        _554 = _574;
        if (!_572)
        {
            _400 = _392;
        }
        float _576 = _400;
        _552 = _576;
        if (!_572)
        {
            _300 = _394;
        }
        float _578 = _300;
        bool _580 = !_572;
        _556 = _578;
        if (!_580)
        {
            uint _582 = uint(int(uint(_180) >> uint(2)));
            float _584 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_582)]);
            int _586 = _180 + 4;
            uint _588 = uint(int(uint(_586) >> uint(2)));
            float _590 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_588)]);
            int _592 = _180 + 8;
            uint _594 = uint(int(uint(_592) >> uint(2)));
            float _596 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_594)]);
            uint _598 = uint(int(uint(_180) >> uint(2)));
            float _600 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_598)]);
            int _602 = _180 + 4;
            uint _604 = uint(int(uint(_602) >> uint(2)));
            float _606 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_604)]);
            int _608 = _180 + 8;
            uint _610 = uint(int(uint(_608) >> uint(2)));
            float _612 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_610)]);
            uint _614 = uint(int(uint(_180) >> uint(2)));
            float _616 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_614)]);
            int _618 = _180 + 4;
            uint _620 = uint(int(uint(_618) >> uint(2)));
            float _622 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_620)]);
            int _624 = _180 + 8;
            uint _626 = uint(int(uint(_624) >> uint(2)));
            float _628 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_626)]);
            float _630 = _596 * _600;
            float _632 = _596 * _606;
            float _634 = _590 * _600;
            float _636 = -_630;
            float _638 = fma(_584, _612, _636);
            float _640 = -_632;
            float _642 = fma(_590, _612, _640);
            float _644 = -_634;
            float _646 = fma(_584, _606, _644);
            float _648 = _622 * _584;
            float _650 = _622 * _638;
            float _652 = _628 * _590;
            float _654 = _616 * _606;
            float _656 = -_648;
            float _658 = fma(_616, _590, _656);
            float _660 = -_650;
            float _662 = fma(_616, _642, _660);
            float _664 = _622 * _612;
            float _666 = _628 * _600;
            float _668 = -_654;
            float _670 = fma(_622, _600, _668);
            float _672 = fma(_628, _646, _662);
            float _674 = -_664;
            float _676 = fma(_628, _606, _674);
            float _678 = -_666;
            float _680 = fma(_616, _612, _678);
            float _682 = _616 * _596;
            float _684 = 1.0 / _672;
            float _686 = -_584;
            float _688 = fma(_686, _612, _630);
            float _690 = -_652;
            float _692 = fma(_622, _596, _690);
            float _694 = -_682;
            float _696 = fma(_628, _584, _694);
            float _698 = _676 * _684;
            float _700 = _680 * _684;
            float _702 = _670 * _684;
            float _704 = _390 * _684;
            float _706 = _392 * _698;
            float _708 = _392 * _700;
            float _710 = _392 * _702;
            float _712 = _688 * _684;
            float _714 = _692 * _684;
            float _716 = fma(_642, _704, _706);
            float _718 = _696 * _684;
            float _720 = _658 * _684;
            float _722 = fma(_390, _712, _708);
            float _724 = fma(_646, _704, _710);
            float _726 = fma(_394, _714, _716);
            float _728 = fma(_394, _718, _722);
            float _730 = fma(_394, _720, _724);
            _302 = _584;
            _304 = _698;
            _306 = _596;
            _402 = _672;
            _308 = _616;
            _310 = _622;
            _404 = _628;
            _406 = _708;
            _312 = _706;
            _314 = _704;
            _316 = _722;
            _318 = _630;
            _552 = _728;
            _554 = _726;
            _556 = _730;
            _408 = _646;
        }
    }
    _558 = false;
    float _732 = _302;
    float _734 = _304;
    float _736 = _306;
    float _738 = _402;
    float _740 = _308;
    float _742 = _310;
    float _744 = _404;
    float _746 = _406;
    float _748 = _312;
    float _750 = _314;
    float _752 = _316;
    float _754 = _318;
    float _756 = _552;
    float _758 = _554;
    float _760 = _556;
    float _762 = _408;
    uint _764 = uint(int(uint(_184) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_764)] = as_type<uint>(_286);
    float _766 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[30]);
    int _768 = as_type<int>(_766) & 512;
    bool _770 = _768 != 0;
    int _772 = as_type<int>(_766) & 1024;
    bool _774 = _772 != 0;
    float _776 = _732;
    float _778 = _734;
    float _780 = _736;
    float _782 = _738;
    float _784 = _756;
    float _786 = _762;
    if (_770)
    {
        float _788 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _790 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _792 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _794 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        _776 = _788;
        _778 = _790;
        _780 = _792;
        _782 = _794;
    }
    float _796 = _776;
    float _798 = _778;
    float _800 = _780;
    float _802 = _782;
    float _804 = _740;
    float _806 = _742;
    float _808 = _744;
    float _810 = _746;
    if (_770)
    {
        float _812 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _814 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _816 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _818 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        _804 = _812;
        _806 = _814;
        _808 = _816;
        _810 = _818;
    }
    float _820 = _804;
    float _822 = _806;
    float _824 = _808;
    float _826 = _810;
    float _828 = _748;
    float _830 = _750;
    float _832 = _752;
    float _834 = _754;
    if (_770)
    {
        float _836 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _838 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _840 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _842 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        _828 = _836;
        _830 = _838;
        _832 = _840;
        _834 = _842;
    }
    float _844 = _828;
    float _846 = _830;
    float _848 = _832;
    float _850 = _834;
    float _852 = _386 + _756;
    float _854 = _384 + _758;
    float _856 = _388 + _760;
    int _858 = as_type<int>(_852);
    if (!_770)
    {
        _784 = 0.0;
    }
    float _860 = _784;
    float _862 = 0.0;
    float _864 = _860;
    if (!_770)
    {
        _862 = 0.0;
    }
    float _866 = _862;
    float _868 = _866;
    if (!_770)
    {
        _786 = 0.0;
    }
    float _870 = _786;
    int _872 = as_type<int>(_766) & 2048;
    bool _874 = _872 != 0;
    float _876 = _870;
    if (_770)
    {
        float _878 = _852 * _798;
        _410 = _878;
    }
    float _880 = _410;
    float _882 = _822;
    float _884 = _880;
    float _886 = _824;
    if (_770)
    {
        float _888 = _852 * _822;
        _882 = _888;
    }
    float _890 = _882;
    float _892 = _890;
    if (_770)
    {
        float _894 = fma(_854, _796, _880);
        _884 = _894;
    }
    float _896 = _884;
    float _898 = _846;
    float _900 = _896;
    float _902 = _844;
    if (_770)
    {
        float _904 = _852 * _846;
        _898 = _904;
    }
    float _906 = _898;
    if (_770)
    {
        float _908 = fma(_854, _820, _890);
        _892 = _908;
    }
    float _910 = _892;
    if (_770)
    {
        float _912 = fma(_856, _800, _896);
        _900 = _912;
    }
    float _914 = _900;
    if (_770)
    {
        float _916 = fma(_854, _844, _906);
        _902 = _916;
    }
    float _918 = _902;
    float _920 = _918;
    if (_770)
    {
        float _922 = fma(_856, _824, _910);
        _886 = _922;
    }
    float _924 = _886;
    if (_770)
    {
        float _926 = _802 + _914;
        _864 = _926;
    }
    float _928 = _864;
    float _930 = _928;
    if (_770)
    {
        float _932 = fma(_856, _848, _918);
        _920 = _932;
    }
    float _934 = _920;
    if (_770)
    {
        float _936 = _826 + _924;
        _868 = _936;
    }
    float _938 = _868;
    float _940 = _938;
    if (_770)
    {
        float _942 = _850 + _934;
        _876 = _942;
    }
    float _944 = _876;
    bool _946 = !_774;
    float _948 = _944;
    if (!_946)
    {
        float _950 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        uint _952 = uint(int(uint(_180) >> uint(2)));
        float _954 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_952)]);
        int _956 = _180 + 4;
        uint _958 = uint(int(uint(_956) >> uint(2)));
        float _960 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_958)]);
        int _962 = _180 + 8;
        uint _964 = uint(int(uint(_962) >> uint(2)));
        float _966 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_964)]);
        uint _968 = uint(int(uint(_180) >> uint(2)));
        float _970 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_968)]);
        int _972 = _180 + 4;
        uint _974 = uint(int(uint(_972) >> uint(2)));
        float _976 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_974)]);
        int _978 = _180 + 8;
        uint _980 = uint(int(uint(_978) >> uint(2)));
        float _982 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_980)]);
        uint _984 = uint(int(uint(_180) >> uint(2)));
        float _986 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_984)]);
        int _988 = _180 + 4;
        uint _990 = uint(int(uint(_988) >> uint(2)));
        float _992 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_990)]);
        int _994 = _180 + 8;
        uint _996 = uint(int(uint(_994) >> uint(2)));
        float _998 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_996)]);
        float _1000 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        float _1002 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        float _1004 = _852 * _960;
        float _1006 = _852 * _976;
        float _1008 = _852 * _992;
        float _1010 = fma(_854, _954, _1004);
        float _1012 = fma(_854, _970, _1006);
        float _1014 = fma(_854, _986, _1008);
        float _1016 = fma(_856, _966, _1010);
        float _1018 = fma(_856, _982, _1012);
        float _1020 = fma(_856, _998, _1014);
        float _1022 = _950 + _1016;
        float _1024 = _1000 + _1018;
        float _1026 = _1002 + _1020;
        _940 = _1024;
        _930 = _1022;
        _948 = _1026;
    }
    float _1028 = _940;
    float _1030 = _930;
    float _1032 = _948;
    bool _1034 = !_874;
    float _1036 = _1028;
    float _1038 = _1030;
    float _1040 = _1032;
    if (!_1034)
    {
        uint _1042 = uint(int(uint(_180) >> uint(2)));
        float _1044 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1042)]);
        int _1046 = _180 + 4;
        uint _1048 = uint(int(uint(_1046) >> uint(2)));
        float _1050 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1048)]);
        int _1052 = _180 + 8;
        uint _1054 = uint(int(uint(_1052) >> uint(2)));
        float _1056 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1054)]);
        int _1058 = _180 + 12;
        uint _1060 = uint(int(uint(_1058) >> uint(2)));
        float _1062 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1060)]);
        uint _1064 = uint(int(uint(_180) >> uint(2)));
        float _1066 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1064)]);
        int _1068 = _180 + 4;
        uint _1070 = uint(int(uint(_1068) >> uint(2)));
        float _1072 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1070)]);
        int _1074 = _180 + 8;
        uint _1076 = uint(int(uint(_1074) >> uint(2)));
        float _1078 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1076)]);
        int _1080 = _180 + 12;
        uint _1082 = uint(int(uint(_1080) >> uint(2)));
        float _1084 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1082)]);
        uint _1086 = uint(int(uint(_180) >> uint(2)));
        float _1088 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1086)]);
        int _1090 = _180 + 4;
        uint _1092 = uint(int(uint(_1090) >> uint(2)));
        float _1094 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1092)]);
        int _1096 = _180 + 8;
        uint _1098 = uint(int(uint(_1096) >> uint(2)));
        float _1100 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1098)]);
        int _1102 = _180 + 12;
        uint _1104 = uint(int(uint(_1102) >> uint(2)));
        float _1106 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1104)]);
        float _1108 = _852 * _1050;
        float _1110 = _852 * _1072;
        float _1112 = _852 * _1094;
        float _1114 = fma(_854, _1044, _1108);
        float _1116 = fma(_854, _1066, _1110);
        float _1118 = fma(_854, _1088, _1112);
        float _1120 = fma(_856, _1056, _1114);
        float _1122 = fma(_856, _1078, _1116);
        float _1124 = fma(_856, _1100, _1118);
        float _1126 = _1120 + _1062;
        float _1128 = _1122 + _1084;
        float _1130 = _1124 + _1106;
        _1036 = _1128;
        _1038 = _1126;
        _1040 = _1130;
    }
    float _1132 = _1036;
    float _1134 = _1038;
    float _1136 = _1040;
    float _1138 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[70]);
    float _1140 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[8]);
    float _1142 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[9]);
    float _1144 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[10]);
    float _1146 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[11]);
    float _1148 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[504]);
    float _1150 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[505]);
    float _1152 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[506]);
    float _1154 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[507]);
    float _1156 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[501]);
    float _1158 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[61]);
    float _1160 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[60]);
    float _1162 = _1138 + 1.0;
    float _1164 = _1162 + _1132;
    float _1166 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[508]);
    float _1168 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[509]);
    float _1170 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[510]);
    float _1172 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[511]);
    float _1174 = _1164 * _1150;
    float _1176 = fma(_1148, _1134, _1174);
    float _1178 = fma(_1152, _1136, _1176);
    float _1180 = _1154 + _1178;
    float _1182 = trunc(_1180);
    int _1184 = int(_1182);
    int _1186 = ~as_type<int>(_1156);
    int _1188 = _1184 + _1186;
    int _1190 = _1188 + 1;
    float _1192 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[502]);
    bool _1194 = _1190 >= 0;
    int _1196 = as_type<int>(_390);
    if (_1194)
    {
        float _1198 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[500]);
        _1196 = as_type<int>(_1198);
    }
    int _1200 = _1196;
    float _1202 = _1142 * _1132;
    float _1204 = fma(_1140, _1134, _1202);
    float _1206 = fma(_1144, _1136, _1204);
    float _1208 = _1146 + _1206;
    float _1210 = -_1208;
    bool _1212 = _1158 >= _1210;
    bool _1214 = isnan(_1158);
    bool _1216 = _1212 || _1214;
    bool _1218 = isnan(_1210);
    bool _1220 = _1216 || _1218;
    float _1222 = -_1208;
    bool _1224 = _1160 >= _1222;
    bool _1226 = isnan(_1160);
    bool _1228 = _1224 || _1226;
    bool _1230 = isnan(_1222);
    bool _1232 = _1228 || _1230;
    int _1234 = _1220 ? 0 : 1;
    int _1236 = 2;
    if (_1220)
    {
        _1236 = 1;
    }
    int _1238 = _1236;
    int _1240 = _1238;
    if (_1232)
    {
        _1240 = _1234;
    }
    int _1242 = _1240;
    int _1244 = _1242 << 6;
    int _1246 = _1244 + 96;
    uint _1248 = uint(int(uint(_1246) >> uint(2)));
    float _1250 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1248)]);
    int _1252 = _1246 + 4;
    uint _1254 = uint(int(uint(_1252) >> uint(2)));
    float _1256 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1254)]);
    int _1258 = _1246 + 8;
    uint _1260 = uint(int(uint(_1258) >> uint(2)));
    float _1262 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1260)]);
    int _1264 = _1246 + 12;
    uint _1266 = uint(int(uint(_1264) >> uint(2)));
    float _1268 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1266)]);
    int _1270 = _1244 + 48;
    int _1272 = _1244 + 64;
    uint _1274 = uint(int(uint(_1270) >> uint(2)));
    float _1276 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1274)]);
    int _1278 = _1270 + 4;
    uint _1280 = uint(int(uint(_1278) >> uint(2)));
    float _1282 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1280)]);
    int _1284 = _1270 + 8;
    uint _1286 = uint(int(uint(_1284) >> uint(2)));
    float _1288 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1286)]);
    int _1290 = _1270 + 12;
    uint _1292 = uint(int(uint(_1290) >> uint(2)));
    float _1294 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1292)]);
    uint _1296 = uint(int(uint(_1272) >> uint(2)));
    float _1298 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1296)]);
    int _1300 = _1272 + 4;
    uint _1302 = uint(int(uint(_1300) >> uint(2)));
    float _1304 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1302)]);
    int _1306 = _1272 + 8;
    uint _1308 = uint(int(uint(_1306) >> uint(2)));
    float _1310 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1308)]);
    int _1312 = _1272 + 12;
    uint _1314 = uint(int(uint(_1312) >> uint(2)));
    float _1316 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1314)]);
    float _1318 = _1164 * _1168;
    float _1320 = fma(_1166, _1134, _1318);
    float _1322 = fma(_1170, _1136, _1320);
    float _1324 = _1172 + _1322;
    float _1326 = trunc(_1324);
    int _1328 = int(_1326);
    bool _1330 = _1200 <= _1190;
    bool _1332 = !_1194;
    bool _1334 = _1330 || _1332;
    int _1336 = ~as_type<int>(_1192);
    int _1338 = _1328 + _1336;
    int _1340 = _1338 + 1;
    bool _1342 = _1340 < 0;
    bool _1344 = _1342 || _1334;
    int _1346 = _1244 + 80;
    uint _1348 = uint(int(uint(_1346) >> uint(2)));
    float _1350 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1348)]);
    int _1352 = _1346 + 4;
    uint _1354 = uint(int(uint(_1352) >> uint(2)));
    float _1356 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1354)]);
    int _1358 = _1346 + 8;
    uint _1360 = uint(int(uint(_1358) >> uint(2)));
    float _1362 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1360)]);
    int _1364 = _1346 + 12;
    uint _1366 = uint(int(uint(_1364) >> uint(2)));
    float _1368 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1366)]);
    int _1370 = 0;
    float _1372 = _1276;
    float _1374 = as_type<float>(_1242);
    float _1376 = _1316;
    if (!_1344)
    {
        float _1378 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[500]);
        _1370 = as_type<int>(_1378);
    }
    int _1380 = _1370;
    float _1382 = _1164 * _1256;
    float _1384 = fma(_1250, _1134, _1382);
    float _1386 = fma(_1262, _1136, _1384);
    float _1388 = _1268 + _1386;
    float _1390 = _1164 * _1282;
    float _1392 = 1.0 / _1388;
    float _1394 = fma(_1276, _1134, _1390);
    float _1396 = _1164 * _1304;
    float _1398 = fma(_1288, _1136, _1394);
    float _1400 = fma(_1298, _1134, _1396);
    float _1402 = _1294 + _1398;
    float _1404 = fma(_1310, _1136, _1400);
    float _1406 = _1402 * _1392;
    float _1408 = _1316 + _1404;
    bool _1410 = _1406 >= 0.0;
    float _1412 = _1408 * _1392;
    bool _1414 = _1406 <= 1.0;
    bool _1416 = _1414 && _1410;
    bool _1418 = _1412 >= 0.0;
    bool _1420 = _1418 && _1416;
    bool _1422 = _1412 <= 1.0;
    bool _1424 = _1422 && _1420;
    float _1426 = _1404;
    int _1428 = _1424 ? (-1) : 0;
    if (_1424)
    {
        float _1430 = float(_1242);
        _1372 = _1430;
    }
    float _1432 = _1372;
    float _1434 = _1432;
    if (_1424)
    {
        float _1436 = rint(_1432);
        float _1438 = precise::max(_1436, 0.0);
        uint _1440 = uint(_1438);
        uint _1442 = clamp(_1440, 0u, 65535u);
        _1434 = as_type<float>(_1442);
    }
    float _1444 = _1434;
    bool _1446 = _328 > 0.001000000047497451305389404296875;
    bool _1448 = isnan(_328);
    bool _1450 = _1446 || _1448;
    bool _1452 = isnan(0.001000000047497451305389404296875);
    bool _1454 = _1450 || _1452;
    float _1456 = _1164 * _1356;
    bool _1458 = _1380 <= _1340;
    bool _1460 = _1458 || _1344;
    float _1462 = fma(_1350, _1134, _1456);
    float _1464 = fma(_1362, _1136, _1462);
    float _1466 = _1368 + _1464;
    if (_1460)
    {
        _336 = 1.0;
    }
    float _1468 = _336;
    float _1470 = _1468;
    if (!_1460)
    {
        float _1472 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[500]);
        int _1474 = _1340 * as_type<int>(_1472);
        int _1476 = _1474 + _1190;
        int _1478 = _1476 << 2;
        uint _1480 = uint(int(uint(_1476) >> uint(2)));
        int _1482 = 12 & _1478;
        int _1484 = int(_1480) << 4;
        int _1486 = _1484 + _1482;
        int _1488 = _1486 + 400;
        uint _1490 = uint(int(uint(_1488) >> uint(2)));
        float _1492 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1490)]);
        float _1494 = floor(_1324);
        float _1496 = floor(_1180);
        float _1498 = -_1494;
        float _1500 = _1324 + _1498;
        float _1502 = -_1496;
        float _1504 = _1180 + _1502;
        float _1506 = rint(_1492);
        float _1508 = precise::max(_1506, 0.0);
        uint _1510 = uint(_1508);
        uint _1512 = clamp(_1510, 0u, 65535u);
        float3 _12112 = float3(_1504, _1500, float(int(_1512)));
        float3 _12116 = select(_12112, float3(0.0), isnan(_12112));
        float _1514 = dm_bs(spvDescriptorSet0.cp_t_tcb_14.sample(spvDescriptorSet0.cp_t_tcb_14Smplr, _12116.xy, uint(rint(_12116.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_14, spvDescriptorSet0.cp_t_tcb_14Smplr_w, _12116.xy, uint(rint(_12116.z)), level(0.0)).x;
        int _1516 = _1476 << 4;
        int _1518 = _1516 + 2048;
        uint _1520 = uint(int(uint(_1518) >> uint(2)));
        float _1522 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1520)]);
        int _1524 = _1518 + 4;
        uint _1526 = uint(int(uint(_1524) >> uint(2)));
        float _1528 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1526)]);
        int _1530 = _1518 + 8;
        uint _1532 = uint(int(uint(_1530) >> uint(2)));
        float _1534 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1532)]);
        int _1536 = _1518 + 12;
        uint _1538 = uint(int(uint(_1536) >> uint(2)));
        float _1540 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1538)]);
        float _1542 = _1164 * _1528;
        float _1544 = fma(_1522, _1134, _1542);
        float _1546 = fma(_1534, _1136, _1544);
        float _1548 = _1540 + _1546;
        float _1550 = precise::clamp(_1548, 0.0, 1.0);
        float _1552 = -_1550;
        float _1554 = _1552 + _1514;
        float _1556 = fma(_1554, 500.0, 1.5);
        float _1558 = exp2(_1556);
        float _1560 = 0.0 + _1558;
        float _1562 = precise::clamp(_1560, 0.0, 1.0);
        _1374 = _1492;
        _1470 = _1562;
        _1426 = as_type<float>(_1512);
        _1376 = _1504;
    }
    float _1564 = _1374;
    float _1566 = _1470;
    float _1568 = _1426;
    float _1570 = _1376;
    float _1572 = _1466 * _1392;
    float _1574 = fma(_1134, 6.2500002968590706586837768554688e-05, 0.5);
    uint _1576 = uint(int(uint(_180) >> uint(2)));
    float _1578 = as_type<float>((*spvDescriptorSet0.cp_s13)._m0[int(_1576)]);
    float _1580 = _1444;
    float _1582 = _1564;
    if (_1424)
    {
        float3 _12227 = float3(_1406, _1412, float(as_type<int>(_1444)));
        float3 _12229 = select(_12227, float3(0.0), isnan(_12227));
        float _1584 = spvDepthCast(spvDescriptorSet0.cp_t_tcb_16).sample_compare(spvDescriptorSet0.cp_t_tcb_16Smplr, _12229.xy, uint(rint(_12229.z)), _1572, level(0.0));
        _1580 = _1584;
    }
    float _1586 = _1580;
    float _1588 = fma(_1136, 6.2500002968590706586837768554688e-05, 0.5);
    float _1590 = _1136;
    if (!_1454)
    {
        float2 _12244 = float2(_1574, _1588);
        float _1592 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_12244, float2(0.0), isnan(_12244)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_12244, float2(0.0), isnan(_12244)), level(0.0)).x;
        _1590 = _1592;
    }
    float _1594 = _1590;
    if (!_1424)
    {
        _1582 = 1.0;
    }
    float _1596 = _1582;
    float _1598 = _1596;
    float _1600 = _1594;
    if (_1424)
    {
        bool _1602 = _1586 >= _1572;
        bool _1604 = isnan(_1586);
        bool _1606 = _1602 || _1604;
        bool _1608 = isnan(_1572);
        bool _1610 = _1606 || _1608;
        float _1612 = float(_1610);
        _1598 = _1612;
    }
    float _1614 = _1598;
    float _1616 = -_1614;
    float _1618 = fma(_1616, _1566, 1.0);
    float _1620 = -_1578;
    float _1622 = _1618 + _1620;
    float _1624 = _1618;
    if (_1454)
    {
        float _1626 = fma(_1622, 0.0500000007450580596923828125, _1578);
        _1624 = _1626;
    }
    float _1628 = _1624;
    float _1630 = precise::max(0.0, _1628);
    float _1632 = precise::min(_1630, 0.999000012874603271484375);
    uint _1634 = uint(int(uint(_180) >> uint(2)));
    (*spvDescriptorSet0.cp_s13)._m0[int(_1634)] = as_type<uint>(_1632);
    float _1636 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[30]);
    uint _1638 = uint(int(uint(_180) >> uint(2)));
    float _1640 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_1638)]);
    int _1642 = _180 + 4;
    uint _1644 = uint(int(uint(_1642) >> uint(2)));
    float _1646 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_1644)]);
    int _1648 = _180 + 8;
    uint _1650 = uint(int(uint(_1648) >> uint(2)));
    float _1652 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_1650)]);
    int _1654 = _180 + 12;
    uint _1656 = uint(int(uint(_1654) >> uint(2)));
    float _1658 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_1656)]);
    float _1660 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[71]);
    int _1662 = _99 << 5;
    float _1664 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[82]);
    uint _1666 = uint(int(uint(_1662) >> uint(2)));
    float _1668 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[int(_1666)]);
    int _1670 = _1662 + 4;
    uint _1672 = uint(int(uint(_1670) >> uint(2)));
    float _1674 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[int(_1672)]);
    int _1676 = _1662 + 8;
    uint _1678 = uint(int(uint(_1676) >> uint(2)));
    float _1680 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[int(_1678)]);
    int _1682 = _1662 + 12;
    uint _1684 = uint(int(uint(_1682) >> uint(2)));
    float _1686 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[int(_1684)]);
    float _1688 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[80]);
    float _1690 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[79]);
    float _1692 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[2607]);
    int _1694 = as_type<int>(_1636) & 512;
    bool _1696 = _1694 != 0;
    float _1698 = 0.0;
    float _1700 = 0.0;
    float _1702 = 0.0;
    float _1704 = 0.0;
    int _1706 = _1696 ? (-1) : 0;
    bool _1708 = _1696;
    if (_1696)
    {
        float _1710 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _1712 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _1714 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _1716 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        _1698 = _1710;
        _1700 = _1712;
        _1702 = _1714;
        _1704 = _1716;
    }
    float _1718 = _1698;
    float _1720 = _1700;
    float _1722 = _1702;
    float _1724 = _1704;
    float _1726 = _1412;
    float _1728 = _1572;
    float _1730 = _1568;
    float _1732 = _1570;
    if (_1696)
    {
        float _1734 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _1736 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _1738 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _1740 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        _1726 = _1734;
        _1728 = _1736;
        _1730 = _1738;
        _1732 = _1740;
    }
    float _1742 = _1726;
    float _1744 = _1728;
    float _1746 = _1730;
    float _1748 = _1732;
    float _1750 = 0.0;
    float _1752 = 0.0;
    float _1754 = 0.0;
    float _1756 = 0.0;
    if (_1696)
    {
        float _1758 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _1760 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _1762 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _1764 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        _1750 = _1758;
        _1752 = _1760;
        _1754 = _1762;
        _1756 = _1764;
    }
    float _1766 = _1750;
    float _1768 = _1752;
    float _1770 = _1754;
    float _1772 = _1756;
    float _1774 = -_1660;
    float _1776 = _1646 + _1774;
    int _1778 = as_type<int>(_1636) & 1024;
    bool _1780 = _1778 != 0;
    int _1782 = _1662 + 16;
    uint _1784 = uint(int(uint(_180) >> uint(2)));
    float _1786 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_1784)]);
    int _1788 = _180 + 4;
    uint _1790 = uint(int(uint(_1788) >> uint(2)));
    float _1792 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_1790)]);
    int _1794 = _180 + 8;
    uint _1796 = uint(int(uint(_1794) >> uint(2)));
    float _1798 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_1796)]);
    int _1800 = _180 + 12;
    uint _1802 = uint(int(uint(_1800) >> uint(2)));
    float _1804 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_1802)]);
    float _1806 = precise::max(0.0, _1664);
    uint _1808 = uint(int(uint(_1782) >> uint(2)));
    float _1810 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[int(_1808)]);
    int _1812 = _1782 + 4;
    uint _1814 = uint(int(uint(_1812) >> uint(2)));
    float _1816 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[int(_1814)]);
    int _1818 = _1782 + 8;
    uint _1820 = uint(int(uint(_1818) >> uint(2)));
    float _1822 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[int(_1820)]);
    int _1824 = _1782 + 12;
    uint _1826 = uint(int(uint(_1824) >> uint(2)));
    float _1828 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[int(_1826)]);
    float _1830 = _1658;
    float _1832 = _1668;
    float _1834 = _1674;
    float _1836 = _1680;
    float _1838 = _1686;
    float _1840 = _1652;
    float _1842 = as_type<float>(_1778);
    float _1844 = as_type<float>(_1782);
    if (!_1696)
    {
        _1830 = 0.0;
    }
    float _1846 = _1830;
    uint _1848 = uint(int(uint(_180) >> uint(2)));
    float _1850 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_1848)]);
    float _1852 = 0.0;
    float _1854 = _1846;
    if (!_1696)
    {
        _1852 = 0.0;
    }
    float _1856 = _1852;
    int _1858 = _180 + 8;
    uint _1860 = uint(int(uint(_1858) >> uint(2)));
    float _1862 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_1860)]);
    int _1864 = as_type<int>(_1636) & 2048;
    bool _1866 = _1864 != 0;
    uint _1868 = uint(int(uint(_180) >> uint(2)));
    float _1870 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_1868)]);
    int _1872 = _180 + 4;
    uint _1874 = uint(int(uint(_1872) >> uint(2)));
    float _1876 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_1874)]);
    int _1878 = _180 + 8;
    uint _1880 = uint(int(uint(_1878) >> uint(2)));
    float _1882 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_1880)]);
    int _1884 = _180 + 12;
    uint _1886 = uint(int(uint(_1884) >> uint(2)));
    float _1888 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_1886)]);
    bool _1890 = _1806 != 0.0;
    bool _1892 = isnan(_1806);
    bool _1894 = _1890 || _1892;
    bool _1896 = isnan(0.0);
    bool _1898 = _1894 || _1896;
    float _1900 = _1668 + _1674;
    float _1902 = _1720;
    float _1904 = _1744;
    float _1906 = _1768;
    float _1908 = _1722;
    float _1910 = _1746;
    float _1912 = _1770;
    float _1914 = _1766;
    float _1916 = _1856;
    float _1918 = _1748;
    float _1920 = _1772;
    float _1922 = _1718;
    float _1924 = _1724;
    int _1926 = as_type<int>(_1900);
    float _1928 = as_type<float>(_1864);
    if (_1696)
    {
        float _1930 = _1776 * _1720;
        _1902 = _1930;
    }
    float _1932 = _1902;
    float _1934 = _1932;
    if (_1696)
    {
        float _1936 = _1776 * _1744;
        _1904 = _1936;
    }
    float _1938 = _1904;
    float _1940 = _1938;
    if (_1696)
    {
        float _1942 = _1776 * _1768;
        _1906 = _1942;
    }
    float _1944 = _1906;
    float _1946 = _1944;
    if (_1696)
    {
        float _1948 = fma(_1640, _1718, _1932);
        _1934 = _1948;
    }
    float _1950 = _1934;
    float _1952 = _1950;
    if (_1696)
    {
        float _1954 = fma(_1640, _1742, _1938);
        _1940 = _1954;
    }
    float _1956 = _1940;
    if (_1696)
    {
        float _1958 = fma(_1640, _1766, _1944);
        _1946 = _1958;
    }
    float _1960 = _1946;
    float _1962 = _1960;
    if (_1696)
    {
        float _1964 = fma(_1652, _1722, _1950);
        _1908 = _1964;
    }
    float _1966 = _1908;
    float _1968 = _1966;
    if (_1696)
    {
        float _1970 = fma(_1652, _1746, _1956);
        _1910 = _1970;
    }
    float _1972 = _1910;
    float _1974 = _1972;
    if (_1696)
    {
        float _1976 = fma(_1652, _1770, _1960);
        _1912 = _1976;
    }
    float _1978 = _1912;
    float _1980 = _1978;
    if (!_1696)
    {
        _1914 = 0.0;
    }
    float _1982 = _1914;
    float _1984 = _1982;
    if (_1696)
    {
        float _1986 = _1724 + _1966;
        _1854 = _1986;
    }
    float _1988 = _1854;
    float _1990 = _1988;
    if (_1696)
    {
        float _1992 = _1748 + _1972;
        _1984 = _1992;
    }
    float _1994 = _1984;
    float _1996 = _1994;
    if (_1696)
    {
        float _1998 = _1772 + _1978;
        _1916 = _1998;
    }
    float _2000 = _1916;
    bool _2002 = !_1780;
    int _2004 = as_type<int>(_1804);
    float _2006 = _2000;
    float _2008 = _1810;
    float _2010 = _1816;
    float _2012 = _1822;
    float _2014 = _1828;
    float _2016 = _1862;
    float _2018 = _1850;
    float _2020 = _1692;
    float _2022 = _1692;
    if (!_2002)
    {
        float _2024 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        uint _2026 = uint(int(uint(_180) >> uint(2)));
        float _2028 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_2026)]);
        int _2030 = _180 + 4;
        uint _2032 = uint(int(uint(_2030) >> uint(2)));
        float _2034 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_2032)]);
        int _2036 = _180 + 8;
        uint _2038 = uint(int(uint(_2036) >> uint(2)));
        float _2040 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_2038)]);
        int _2042 = _180 + 12;
        uint _2044 = uint(int(uint(_2042) >> uint(2)));
        float _2046 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_2044)]);
        uint _2048 = uint(int(uint(_180) >> uint(2)));
        float _2050 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2048)]);
        int _2052 = _180 + 4;
        uint _2054 = uint(int(uint(_2052) >> uint(2)));
        float _2056 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2054)]);
        int _2058 = _180 + 8;
        uint _2060 = uint(int(uint(_2058) >> uint(2)));
        float _2062 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2060)]);
        int _2064 = _180 + 12;
        uint _2066 = uint(int(uint(_2064) >> uint(2)));
        float _2068 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2066)]);
        uint _2070 = uint(int(uint(_180) >> uint(2)));
        float _2072 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2070)]);
        int _2074 = _180 + 4;
        uint _2076 = uint(int(uint(_2074) >> uint(2)));
        float _2078 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2076)]);
        int _2080 = _180 + 8;
        uint _2082 = uint(int(uint(_2080) >> uint(2)));
        float _2084 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2082)]);
        int _2086 = _180 + 12;
        uint _2088 = uint(int(uint(_2086) >> uint(2)));
        float _2090 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2088)]);
        float _2092 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        float _2094 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        float _2096 = _1776 * _2034;
        float _2098 = _1776 * _2056;
        float _2100 = _1776 * _2078;
        float _2102 = fma(_1640, _2028, _2096);
        float _2104 = fma(_1640, _2050, _2098);
        float _2106 = fma(_1640, _2072, _2100);
        float _2108 = fma(_1652, _2040, _2102);
        float _2110 = fma(_1652, _2062, _2104);
        float _2112 = fma(_1652, _2084, _2106);
        float _2114 = _2024 + _2108;
        float _2116 = _2092 + _2110;
        float _2118 = _2094 + _2112;
        _1974 = _2108;
        _1918 = _2046;
        _1996 = _2116;
        _1962 = _2104;
        _1980 = _2110;
        _1920 = _2068;
        _1922 = _2072;
        _1952 = _2106;
        _1968 = _2112;
        _1924 = _2090;
        _2004 = as_type<int>(_2092);
        _1990 = _2114;
        _2006 = _2118;
    }
    float _2120 = _1974;
    float _2122 = _1918;
    float _2124 = _1996;
    float _2126 = _1962;
    float _2128 = _1980;
    float _2130 = _1920;
    float _2132 = _1922;
    float _2134 = _1952;
    float _2136 = _1968;
    float _2138 = _1924;
    int _2140 = _2004;
    float _2142 = _1990;
    float _2144 = _2006;
    bool _2146 = !_1866;
    float _2148 = _2122;
    float _2150 = _2120;
    float _2152 = _2136;
    float _2154 = _2142;
    float _2156 = _2144;
    float _2158 = _2126;
    float _2160 = _2130;
    float _2162 = _2134;
    float _2164 = _2124;
    float _2166 = _2128;
    float _2168 = _2132;
    float _2170 = _2138;
    int _2172 = _2140;
    if (!_2146)
    {
        uint _2174 = uint(int(uint(_180) >> uint(2)));
        float _2176 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_2174)]);
        int _2178 = _180 + 4;
        uint _2180 = uint(int(uint(_2178) >> uint(2)));
        float _2182 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_2180)]);
        int _2184 = _180 + 8;
        uint _2186 = uint(int(uint(_2184) >> uint(2)));
        float _2188 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_2186)]);
        int _2190 = _180 + 12;
        uint _2192 = uint(int(uint(_2190) >> uint(2)));
        float _2194 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_2192)]);
        uint _2196 = uint(int(uint(_180) >> uint(2)));
        float _2198 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2196)]);
        int _2200 = _180 + 4;
        uint _2202 = uint(int(uint(_2200) >> uint(2)));
        float _2204 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2202)]);
        int _2206 = _180 + 8;
        uint _2208 = uint(int(uint(_2206) >> uint(2)));
        float _2210 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2208)]);
        int _2212 = _180 + 12;
        uint _2214 = uint(int(uint(_2212) >> uint(2)));
        float _2216 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2214)]);
        uint _2218 = uint(int(uint(_180) >> uint(2)));
        float _2220 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2218)]);
        int _2222 = _180 + 4;
        uint _2224 = uint(int(uint(_2222) >> uint(2)));
        float _2226 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2224)]);
        int _2228 = _180 + 8;
        uint _2230 = uint(int(uint(_2228) >> uint(2)));
        float _2232 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2230)]);
        int _2234 = _180 + 12;
        uint _2236 = uint(int(uint(_2234) >> uint(2)));
        float _2238 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2236)]);
        float _2240 = _1776 * _2182;
        float _2242 = _1776 * _2204;
        float _2244 = _1776 * _2226;
        float _2246 = fma(_1640, _2176, _2240);
        float _2248 = fma(_1640, _2198, _2242);
        float _2250 = fma(_1640, _2220, _2244);
        float _2252 = fma(_1652, _2188, _2246);
        float _2254 = fma(_1652, _2210, _2248);
        float _2256 = fma(_1652, _2232, _2250);
        float _2258 = _2252 + _2194;
        float _2260 = _2254 + _2216;
        float _2262 = _2256 + _2238;
        _2148 = _2194;
        _2150 = _2252;
        _2152 = _2256;
        _2154 = _2258;
        _2156 = _2262;
        _2158 = _2248;
        _2160 = _2216;
        _2162 = _2250;
        _2164 = _2260;
        _2166 = _2254;
        _2168 = _2220;
        _2170 = _2238;
    }
    float _2264 = _2148;
    float _2266 = _2150;
    float _2268 = _2152;
    float _2270 = _2154;
    float _2272 = _2156;
    float _2274 = _2158;
    float _2276 = _2160;
    float _2278 = _2162;
    float _2280 = _2164;
    float _2282 = _2166;
    float _2284 = _2168;
    float _2286 = _2170;
    float _2288 = _1680 + _1900;
    float _2290 = _2270;
    float _2292 = _2272;
    float _2294 = _2270;
    float _2296 = _2272;
    float _2298 = _2268;
    float _2300 = _2282;
    float _2302 = _2284;
    float _2304 = _2266;
    float _2306 = _2264;
    float _2308 = _2280;
    float _2310 = _2280;
    float _2312 = _2274;
    float _2314 = _2276;
    float _2316 = _2278;
    float _2318 = _2286;
    if (!_1898)
    {
        _1428 = 0;
    }
    int _2320 = _1428;
    int _2322 = _2320;
    if (!_1898)
    {
        _1926 = as_type<int>(_1786);
    }
    int _2324 = _1926;
    float _2326 = -_1686;
    bool _2328 = _2288 != _2326;
    bool _2330 = isnan(_2288);
    bool _2332 = _2328 || _2330;
    bool _2334 = isnan(_2326);
    bool _2336 = _2332 || _2334;
    int _2338 = 0;
    bool _2340 = _2336;
    int _2342 = _2324;
    if (!_1898)
    {
        _2338 = as_type<int>(_1792);
    }
    int _2344 = _2338;
    int _2346 = _2336 ? 0 : 1;
    int _2348 = _2344;
    int _2350 = _2346;
    int _2352 = _2346;
    int _2354 = _2344;
    if (!_1898)
    {
        _2172 = as_type<int>(_1798);
    }
    int _2356 = _2172;
    bool _2358 = !_1898;
    int _2360 = _2356;
    if (!_2358)
    {
        uint _2362 = uint(int(uint(as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x)) >> uint(2)));
        float _2364 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_2362)]);
        int _2366 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 16;
        uint _2368 = uint(int(uint(_2366) >> uint(2)));
        float _2370 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_2368)]);
        int _2372 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 8;
        uint _2374 = uint(int(uint(_2372) >> uint(2)));
        float _2376 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_2374)]);
        int _2378 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 24;
        uint _2380 = uint(int(uint(_2378) >> uint(2)));
        float _2382 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_2380)]);
        float _2384 = _1806 * 0.5;
        float _2386 = 1.0 / _1806;
        float _2388 = -_2370;
        float _2390 = fma(_2384, _2388, _2364);
        float _2392 = -_2384;
        float _2394 = _2392 + _2390;
        float _2396 = -_2382;
        float _2398 = fma(_2384, _2396, _2376);
        float _2400 = -_2394;
        float _2402 = _2400 + _2270;
        float _2404 = -_2384;
        float _2406 = _2404 + _2398;
        float _2408 = _2402 * _2386;
        float _2410 = -_2406;
        float _2412 = _2410 + _2272;
        float _2414 = floor(_2408);
        float _2416 = _2412 * _2386;
        float _2418 = floor(_2416);
        float _2420 = -_2414;
        float _2422 = fma(_1806, _2420, _2402);
        bool _2424 = _2422 != _2402;
        bool _2426 = isnan(_2422);
        bool _2428 = _2424 || _2426;
        bool _2430 = isnan(_2402);
        bool _2432 = _2428 || _2430;
        float _2434 = -_2418;
        float _2436 = fma(_1806, _2434, _2412);
        bool _2438 = _2436 == _2412;
        bool _2440 = !_2432;
        bool _2442 = _2438 && _2440;
        bool _2444 = !_2442;
        int _2446 = as_type<int>(_2422);
        int _2448 = as_type<int>(_2416);
        _2340 = _2442;
        _2322 = _2444 ? (-1) : 0;
        _2298 = _2436;
        _2300 = _2406;
        _2302 = _2394;
        _2304 = _2414;
        _2306 = _2412;
        if (!_2442)
        {
            float _2450 = _2394 + _2422;
            _2290 = _2450;
        }
        float _2452 = _2290;
        _2294 = _2452;
        if (_2442)
        {
            _2446 = as_type<int>(_1786);
        }
        int _2454 = _2446;
        int _2456 = _2454;
        if (!_2442)
        {
            float _2458 = _2406 + _2436;
            _2292 = _2458;
        }
        float _2460 = _2292;
        _2296 = _2460;
        if (_2442)
        {
            _2348 = as_type<int>(_1792);
        }
        int _2462 = _2348;
        int _2464 = _2462;
        if (_2442)
        {
            _2448 = as_type<int>(_1798);
        }
        int _2466 = _2448;
        _2360 = _2466;
        if (!_2442)
        {
            _2350 = 1;
        }
        int _2468 = _2350;
        _2352 = _2468;
        if (!_2442)
        {
            _2456 = 0;
        }
        int _2470 = _2456;
        _2342 = _2470;
        if (!_2442)
        {
            _2464 = 0;
        }
        int _2472 = _2464;
        _2354 = _2472;
        if (!_2442)
        {
            _2360 = 0;
        }
    }
    int _2474 = _2352;
    bool _2476 = _2340;
    float _2478 = _2294;
    float _2480 = _2296;
    int _2482 = _2322;
    float _2484 = _2298;
    float _2486 = _2300;
    float _2488 = _2302;
    float _2490 = _2304;
    int _2492 = _2342;
    float _2494 = _2306;
    int _2496 = _2354;
    int _2498 = _2360;
    int _2500 = _2474 & 1;
    bool _2502 = _2500 != 0;
    int _2504 = _2474;
    bool _2506 = _2476;
    float _2508 = _2490;
    float _2510 = _2494;
    float _2512 = _2486;
    float _2514 = _2488;
    float _2516 = _2484;
    float _2518 = as_type<float>(_2498);
    float _2520 = as_type<float>(_2492);
    if (!_1454)
    {
        float _2522 = _1594 * 2000.0;
        _1600 = _2522;
    }
    float _2524 = _1600;
    float _2526 = _1688 * 0.5;
    float _2528 = _2524;
    if (_1454)
    {
        _2504 = as_type<int>(_286);
    }
    int _2530 = _2504;
    float _2532 = -_1660;
    float _2534 = _852 + _2532;
    int _2536 = _2530;
    if (!_1454)
    {
        bool _2538 = _1132 >= _2524;
        bool _2540 = isnan(_1132);
        bool _2542 = _2538 || _2540;
        bool _2544 = isnan(_2524);
        bool _2546 = _2542 || _2544;
        _2506 = _2546;
    }
    bool _2548 = _2506;
    float _2550 = precise::max(_2526, 0.001000000047497451305389404296875);
    bool _2552 = _2548;
    if (!_1454)
    {
        int _2554 = _2548 ? as_type<int>(_286) : 0;
        _2536 = _2554;
    }
    int _2556 = _2536;
    float _2558 = precise::min(_2550, 10000.0);
    if (!_2502)
    {
        _2508 = _1668;
    }
    float _2560 = _2508;
    float _2562 = _2560;
    if (!_2502)
    {
        _2510 = _1674;
    }
    float _2564 = _2510;
    float _2566 = _2564;
    if (!_2502)
    {
        _1832 = _1680;
    }
    float _2568 = _1832;
    float _2570 = _2568;
    if (!_2502)
    {
        _1834 = _1686;
    }
    float _2572 = _1834;
    float _2574 = _2572;
    if (!_2502)
    {
        _1836 = _1810;
    }
    float _2576 = _1836;
    float _2578 = _2576;
    if (!_2502)
    {
        _2552 = false;
    }
    bool _2580 = _2552;
    bool _2582 = _2580;
    if (!_2502)
    {
        _1838 = _1816;
    }
    float _2584 = _1838;
    float _2586 = _2584;
    if (!_2502)
    {
        _412 = _1822;
    }
    float _2588 = _412;
    float _2590 = _2588;
    if (!_2502)
    {
        _2528 = _1828;
    }
    float _2592 = _2528;
    int _2594 = 0;
    float _2596 = _2592;
    if (!_2502)
    {
        _2594 = as_type<int>(_1640);
    }
    int _2598 = _2594;
    int _2600 = _2598;
    int _2602 = _2598;
    if (!_2502)
    {
        _858 = as_type<int>(_1776);
    }
    int _2604 = _858;
    int _2606 = 0;
    int _2608 = _2604;
    if (!_2502)
    {
        _2606 = as_type<int>(_1652);
    }
    int _2610 = _2606;
    bool _2612 = !_2502;
    int _2614 = _2610;
    int _2616 = _2610;
    float _2618 = 0.0;
    float _2620 = 0.0;
    float _2622 = 0.0;
    if (!_2612)
    {
        float _2624 = fma(_2478, 6.2500002968590706586837768554688e-05, 0.5000312328338623046875);
        float _2626 = fma(_2480, 6.2500002968590706586837768554688e-05, 0.5);
        float _2628 = fma(_2478, 6.2500002968590706586837768554688e-05, 0.5);
        float _2630 = fma(_2480, 6.2500002968590706586837768554688e-05, 0.5000312328338623046875);
        float _2632 = fma(_2478, 6.2500002968590706586837768554688e-05, 0.50018751621246337890625);
        float _2634 = fma(_2480, 6.2500002968590706586837768554688e-05, 0.50018751621246337890625);
        float2 _13698 = float2(_2624, _2626);
        float2 _2638 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_13698, float2(0.0), isnan(_13698)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_13698, float2(0.0), isnan(_13698)), level(0.0)).xy;
        float _2640 = _2638.x;
        float _2642 = _2638.y;
        float2 _13710 = float2(_2628, _2626);
        float2 _2644 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_13710, float2(0.0), isnan(_13710)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_13710, float2(0.0), isnan(_13710)), level(0.0)).xy;
        float _2646 = _2644.x;
        float _2648 = _2644.y;
        float _2650 = fma(_2480, 6.2500002968590706586837768554688e-05, 0.4998125135898590087890625);
        float2 _13725 = float2(_2628, _2630);
        float2 _2652 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_13725, float2(0.0), isnan(_13725)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_13725, float2(0.0), isnan(_13725)), level(0.0)).xy;
        float _2654 = _2652.x;
        float _2656 = _2652.y;
        float2 _13737 = float2(_2632, _2634);
        float _2658 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_13737, float2(0.0), isnan(_13737)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_13737, float2(0.0), isnan(_13737)), level(0.0)).x;
        float _2660 = fma(_2478, 6.2500002968590706586837768554688e-05, 0.4998125135898590087890625);
        float2 _13747 = float2(_2632, _2650);
        float _2662 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_13747, float2(0.0), isnan(_13747)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_13747, float2(0.0), isnan(_13747)), level(0.0)).x;
        float2 _13755 = float2(_2660, _2634);
        float _2664 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_13755, float2(0.0), isnan(_13755)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_13755, float2(0.0), isnan(_13755)), level(0.0)).x;
        float2 _13763 = float2(_2660, _2650);
        float _2666 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_13763, float2(0.0), isnan(_13763)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_13763, float2(0.0), isnan(_13763)), level(0.0)).x;
        float _2668 = -_2646;
        float _2670 = _2668 + _2640;
        float _2672 = -_2646;
        float _2674 = _2672 + _2654;
        float _2676 = -_2648;
        float _2678 = _2646 + _2676;
        float _2680 = _2670 * 1000.0;
        float _2682 = _2674 * 1000.0;
        float _2684 = _2678 * 2000.0;
        float _2686 = fma(_2680, _2680, 0.0625);
        float _2688 = fma(_2682, _2682, _2686);
        float _2690 = -_2646;
        float _2692 = _2690 + _2658;
        float _2694 = -_2646;
        float _2696 = _2694 + _2662;
        float _2698 = abs(_2684);
        bool _2700 = _2698 >= 2.0;
        bool _2702 = isnan(_2698);
        bool _2704 = _2700 || _2702;
        bool _2706 = isnan(2.0);
        bool _2708 = _2704 || _2706;
        float _2710 = -_2646;
        float _2712 = _2710 + _2664;
        float _2714 = _2692 * 2000.0;
        float _2716 = rsqrt(_2688);
        float _2718 = _2696 * 2000.0;
        float _2720 = -_2646;
        float _2722 = _2720 + _2666;
        float _2724 = _2712 * 2000.0;
        float _2726 = abs(_2714);
        float _2728 = abs(_2718);
        float _2730 = precise::max(_2726, _2728);
        float _2732 = _2722 * 2000.0;
        float _2734 = abs(_2724);
        float _2736 = precise::max(_2730, _2734);
        float _2738 = abs(_2732);
        float _2740 = precise::max(_2736, _2738);
        float _2742 = _2680 * _2716;
        float _2744 = _2682 * _2716;
        float _2746 = _2716 * 0.25;
        float _2748 = _2648;
        float _2750 = _2660;
        float _2752 = _2714;
        float _2754 = _2680;
        float _2756 = _2650;
        float _2758 = _2696;
        float _2760 = _2744;
        float _2762 = _2724;
        _2514 = _2626;
        _2316 = _2740;
        _2318 = _2746;
        float _2794;
        float _2796;
        float _2798;
        float _2800;
        if (!_2708)
        {
            float _2764 = -_2648;
            float _2766 = _2764 + _2642;
            float _2768 = -_2648;
            float _2770 = _2768 + _2656;
            float _2772 = _2648 * 2000.0;
            float _2774 = _2766 * 1000.0;
            float _2776 = _2770 * 1000.0;
            float _2778 = fma(_2774, _2774, 0.0625);
            float _2780 = fma(_2776, _2776, _2778);
            float _2782 = rsqrt(_2780);
            float _2784 = -_2776;
            float _2786 = fma(_2784, _2782, -0.0);
            float _2788 = -_2774;
            float _2790 = fma(_2788, _2782, -0.0);
            float _2792 = _2782 * 0.25;
            _2794 = _2772;
            _2796 = _2790;
            _2798 = _2786;
            _2800 = _2792;
            _2802 = true;
        }
        else
        {
            float _2804 = _2744 * _2744;
            float _2806 = 1.0 / _2746;
            float _2808 = -_2742;
            float _2810 = (-0.0) + _2808;
            float _2812 = fma(_2742, _2742, _2804);
            float _2814 = sqrt(_2812);
            bool _2816 = _2814 > 9.9999997473787516355514526367188e-05;
            float _2818 = _2814 * _2806;
            float _2820 = _2804;
            _2796 = _2810;
            _2800 = _2746;
            if (_2816)
            {
                float _2822 = abs(_2742);
                float _2824 = abs(_2744);
                float _2826 = precise::max(_2822, _2824);
                _2748 = _2826;
            }
            float _2828 = _2748;
            if (!_2816)
            {
                _2820 = 0.0;
            }
            float _2830 = _2820;
            float _2832 = _2828;
            float _2834 = _2830;
            if (_2816)
            {
                float _2836 = 1.0 / _2828;
                _2832 = _2836;
            }
            float _2838 = _2832;
            if (_2816)
            {
                float _2840 = _2814 * _2838;
                _2834 = _2840;
            }
            float _2842 = _2834;
            bool _2844 = _2740 >= 2.0;
            bool _2846 = isnan(_2740);
            bool _2848 = _2844 || _2846;
            bool _2850 = isnan(2.0);
            bool _2852 = _2848 || _2850;
            float _2854 = _2842 * 0.9649016857147216796875;
            float _2856 = _2854 * _2818;
            bool _2858 = !_2852;
            float _2860 = _2858 ? 0.0 : 1000.0;
            float _2862 = -_2856;
            float _2864 = fma(_2646, 2000.0, _2862);
            float _2866 = -_2860;
            float _2868 = _2864 + _2866;
            float _2870 = -_2744;
            float _2872 = (-0.0) + _2870;
            _2794 = _2868;
            _2798 = _2872;
        }
        _2802 = false;
        float _2874 = _2794;
        float _2876 = _2796;
        float _2878 = _2798;
        float _2880 = _2800;
        float2 _14028 = float2(_2628, _2626);
        float _2882 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_14028, float2(0.0), isnan(_14028)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_14028, float2(0.0), isnan(_14028)), level(0.0)).y;
        float _2884 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[81]);
        bool _2886 = _2280 >= _2874;
        int _2888 = (_2886 ? (-1) : 0) | _2482;
        float _2890 = 0.0 + _2884;
        float _2892 = precise::clamp(_2890, 0.0, 1.0);
        bool _2894 = _1888 >= _2892;
        int _2896 = (_2894 ? (-1) : 0) & _2888;
        int _2898 = ~_2896;
        float _2900 = _2874;
        float _2902 = _2874;
        float _2964;
        float _2966;
        float _2968;
        float _2970;
        float _2972;
        float _2974;
        float _2976;
        float _2978;
        float _2980;
        bool _2982;
        float _2984;
        float _2986;
        float _2988;
        if (!(_2898 != 0))
        {
            float _2904 = _1876 * 6.283185482025146484375;
            float _2906 = _1870 * 6.283185482025146484375;
            float _2908 = _1882 * 6.283185482025146484375;
            if (_2482 != 0)
            {
                float _2910 = fma(_1876, _1806, _2874);
                _2308 = _2910;
            }
            float _2912 = _2308;
            float _2914 = _2904 * _2904;
            float _2916 = fma(_2906, _2906, _2914);
            float _2918 = fma(_2908, _2908, _2916);
            float _2920 = sqrt(_2918);
            float _2922 = rsqrt(_2918);
            float _2924 = _2920 * 0.5;
            bool _2926 = _2920 != 0.0;
            bool _2928 = isnan(_2920);
            bool _2930 = _2926 || _2928;
            bool _2932 = isnan(0.0);
            bool _2934 = _2930 || _2932;
            float _2936 = _2924 * 0.15915493667125701904296875;
            float _2938 = _2936 * 6.283185482025146484375;
            float _2940 = sin(_2938);
            float _2942 = _2906 * _2922;
            float _2944 = _2904 * _2922;
            float _2946 = _2908 * _2922;
            float _2948 = _2934 ? _2942 : 0.0;
            float _2950 = _2936 * 6.283185482025146484375;
            float _2952 = cos(_2950);
            float _2954 = _2934 ? _2944 : 0.0;
            float _2956 = _2934 ? _2946 : 0.0;
            float _2958 = _2948 * _2940;
            float _2960 = _2954 * _2940;
            float _2962 = _2956 * _2940;
            _2964 = _2956;
            _2966 = _2918;
            _2968 = _2936;
            _2970 = _2940;
            _2972 = _2912;
            _2974 = _2912;
            _2976 = _2962;
            _2978 = _2958;
            _2980 = _2952;
            _2982 = _2934;
            _2984 = _2960;
            _2986 = _2920;
            _2988 = 0.0;
            _2990 = true;
        }
        else
        {
            float _2992 = _2876 * _2876;
            float _2994 = fma(_2878, _2878, _2992);
            float _2996 = sqrt(_2994);
            float _2998 = precise::max(_2996, -1.0);
            float _3000 = precise::min(_2998, 1.0);
            float _3002 = abs(_3000);
            float _3004 = fma(_3002, -0.5, 0.5);
            int _3006 = as_type<int>(_3004) + (-218103808);
            bool _3008 = uint(_3006) >= 1920991232u;
            bool _3010 = !_3008;
            int _3032;
            if (!_3010)
            {
                int _3012 = 1056964608;
                int _3014 = as_type<int>(_2742);
                int _3016 = as_type<int>(_3004);
                int _3018 = 10560;
                int _3020;
                int _3022;
                int _3024;
                int _3026;
                int _3028;
                int _3030;
                _87(_3012, _3014, _3016, _3018, _3020, _3022, _3024, _3026, _3028, _3030);
                _3032 = _3024;
                _3034 = true;
            }
            else
            {
                float _3036 = rsqrt(_3004);
                float _3038 = _3004 * _3036;
                float _3040 = _3036 * 0.5;
                float _3042 = -_3038;
                float _3044 = 0.0 + _3042;
                float _3046 = fma(_3040, _3044, 0.5);
                float _3048 = fma(_3038, _3046, _3038);
                float _3050 = -_3048;
                float _3052 = 0.0 + _3050;
                float _3054 = fma(_3048, _3052, _3004);
                float _3056 = fma(_3040, _3054, _3048);
                _3032 = as_type<int>(_3056);
            }
            _3034 = false;
            int _3058 = _3032;
            float _3060 = abs(_3000);
            bool _3062 = _3060 > 0.569999992847442626953125;
            float _3064 = _2996 + 9.9999997473787516355514526367188e-06;
            float _3066 = _1882 * 6.283185482025146484375;
            float _3068 = abs(_3000);
            float _3070 = _3062 ? as_type<float>(_3058) : _3068;
            float _3072 = -_2874;
            float _3074 = fma(_2882, 2000.0, _3072);
            float _3076 = 1.0 / _3064;
            float _3078 = _3066 * _2880;
            float _3080 = _3070 * _3070;
            float _3082 = _3066 * _2876;
            float _3084 = _3066 * _2878;
            float _3086 = _3078 * _3078;
            float _3088 = fma(_3080, 0.0517513789236545562744140625, 0.01816697604954242706298828125);
            float _3090 = fma(_3082, _3082, _3086);
            float _3092 = fma(_3080, _3088, 0.0467568598687648773193359375);
            float _3094 = fma(_3084, _3084, _3090);
            float _3096 = fma(_3080, _3092, 0.074846573173999786376953125);
            float _3098 = _3076 * _2876;
            float _3100 = sqrt(_3094);
            float _3102 = fma(_3080, _3096, 0.166670143604278564453125);
            float _3104 = _3080 * _3102;
            float _3106 = rsqrt(_3094);
            float _3108 = fma(_3070, _3104, _3070);
            float _3110 = _3108;
            _2754 = _3074;
            if (_3062)
            {
                float _3112 = fma(_3108, -2.0, 1.57079637050628662109375);
                _3110 = _3112;
            }
            float _3114 = _3110;
            bool _3116 = _3000 >= 0.0;
            bool _3118 = isnan(_3000);
            bool _3120 = _3116 || _3118;
            bool _3122 = isnan(0.0);
            bool _3124 = _3120 || _3122;
            float _3126 = -_2878;
            float _3128 = _3076 * _3126;
            float _3130 = _3100 * 0.5;
            bool _3132 = _3100 != 0.0;
            bool _3134 = isnan(_3100);
            bool _3136 = _3132 || _3134;
            bool _3138 = isnan(0.0);
            bool _3140 = _3136 || _3138;
            bool _3142 = !_3124;
            float _3144 = -_3114;
            float _3146 = _3142 ? _3144 : _3114;
            float _3148 = _3130 * 0.15915493667125701904296875;
            float _3150 = abs(_3074);
            bool _3152 = _3150 >= 2.0;
            bool _3154 = isnan(_3150);
            bool _3156 = _3152 || _3154;
            bool _3158 = isnan(2.0);
            bool _3160 = _3156 || _3158;
            float _3162 = _3146 * _3098;
            float _3164 = _3146 * _3128;
            float _3166 = _3148 * 6.283185482025146484375;
            float _3168 = sin(_3166);
            float _3170 = _3082 * _3106;
            float _3172 = _3162 * _3162;
            float _3174 = _3084 * _3106;
            float _3176 = _3078 * _3106;
            bool _3178 = _2880 <= 0.891006529331207275390625;
            bool _3180 = !_3160;
            bool _3182 = _3178 || _3180;
            float _3184 = fma(_3164, _3164, _3172);
            float _3186 = _3140 ? _3170 : 0.0;
            float _3188 = _3148 * 6.283185482025146484375;
            float _3190 = cos(_3188);
            float _3192 = _3140 ? _3174 : 0.0;
            float _3194 = _3140 ? _3176 : 0.0;
            float _3196 = sqrt(_3184);
            float _3198 = _3186 * _3168;
            _2752 = _3190;
            _2758 = _3106;
            _2760 = _3148;
            _2762 = _3100;
            _2982 = _3182;
            if (_3182)
            {
                float _3200 = _2874 + (-1000.0);
                _2900 = _3200;
            }
            float _3202 = _2900;
            float _3204 = rsqrt(_3184);
            float _3206 = _3196 * 0.5;
            bool _3208 = _3196 != 0.0;
            bool _3210 = isnan(_3196);
            bool _3212 = _3208 || _3210;
            bool _3214 = isnan(0.0);
            bool _3216 = _3212 || _3214;
            float _3218 = _3192 * _3168;
            float _3220 = _3194 * _3168;
            float _3222 = _3206 * 0.15915493667125701904296875;
            float _3224 = _3222 * 6.283185482025146484375;
            float _3226 = sin(_3224);
            float _3228 = _3164 * _3204;
            float _3230 = _3162 * _3204;
            float _3232 = _3216 ? _3228 : 0.0;
            float _3234 = _3222 * 6.283185482025146484375;
            float _3236 = cos(_3234);
            float _3238 = _3216 ? _3230 : 0.0;
            float _3240 = _3232 * _3226;
            float _3242 = _3238 * _3226;
            float _3244 = _3242 * _3198;
            float _3246 = _3242 * _3218;
            float _3248 = _3236 * _3198;
            float _3250 = _3236 * _3218;
            float _3252 = fma(_3240, _3198, _3246);
            float _3254 = fma(_3240, _3190, _3248);
            float _3256 = fma(_3242, _3190, _3250);
            float _3258 = fma(_3242, _3220, _3254);
            float _3260 = -_3244;
            float _3262 = fma(_3240, _3218, _3260);
            float _3264 = -_3240;
            float _3266 = fma(_3264, _3220, _3256);
            float _3268 = fma(_3236, _3220, _3262);
            float _3270 = -_3252;
            float _3272 = fma(_3236, _3190, _3270);
            _2964 = _3240;
            _2966 = _3218;
            _2968 = _3256;
            _2970 = _3250;
            _2750 = _3252;
            _2756 = _3248;
            _2972 = _3222;
            _2974 = _3202;
            _2976 = _3266;
            _2978 = _3258;
            _2980 = _3272;
            _2902 = _3202;
            _2984 = _3268;
            _2986 = _3262;
            _2988 = 1.0;
        }
        _2990 = false;
        float _3274 = _2964;
        float _3276 = _2966;
        float _3278 = _2968;
        float _3280 = _2970;
        float _3282 = _2750;
        float _3284 = _2752;
        float _3286 = _2754;
        float _3288 = _2756;
        float _3290 = _2972;
        float _3292 = _2758;
        float _3294 = _2760;
        float _3296 = _2762;
        float _3298 = _2974;
        float _3300 = _2976;
        float _3302 = _2978;
        float _3304 = _2980;
        float _3306 = _2902;
        bool _3308 = _2982;
        float _3310 = _2984;
        float _3312 = _2986;
        float _3314 = _2988;
        bool _3316 = !_1696;
        bool _3318 = _3308;
        float _3320 = _3278;
        float _3322 = _3280;
        float _3324 = _3312;
        float _3326 = _3306;
        float _3328 = _3274;
        float _3330 = _3276;
        _2008 = _3282;
        _2010 = _3284;
        _2012 = _3286;
        _2014 = _3288;
        _2310 = _3290;
        _2312 = _3292;
        _2512 = _3294;
        _2314 = _3296;
        _2608 = as_type<int>(_3298);
        _2566 = _3310;
        _2596 = _3314;
        if (!_3316)
        {
            float _3332 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
            float _3334 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
            float _3336 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
            float _3338 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
            float _3340 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[28]);
            float _3342 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[29]);
            float _3344 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[30]);
            float _3346 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[31]);
            float _3348 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
            float _3350 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
            float _3352 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
            float _3354 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
            float _3356 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
            float _3358 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
            float _3360 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
            float _3362 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
            float _3364 = _3338 * _3344;
            float _3366 = _3338 * _3342;
            float _3368 = _3338 * _3340;
            float _3370 = _3354 * _3344;
            float _3372 = _3354 * _3342;
            float _3374 = _3354 * _3340;
            float _3376 = _3354 * _3336;
            float _3378 = _3354 * _3334;
            float _3380 = _3354 * _3332;
            float _3382 = -_3364;
            float _3384 = fma(_3336, _3346, _3382);
            float _3386 = -_3366;
            float _3388 = fma(_3334, _3346, _3386);
            float _3390 = -_3368;
            float _3392 = fma(_3332, _3346, _3390);
            float _3394 = -_3370;
            float _3396 = fma(_3352, _3346, _3394);
            float _3398 = -_3372;
            float _3400 = fma(_3350, _3346, _3398);
            float _3402 = -_3374;
            float _3404 = fma(_3348, _3346, _3402);
            float _3406 = _3336 * _3342;
            float _3408 = _3336 * _3340;
            float _3410 = _3334 * _3340;
            float _3412 = _3352 * _3342;
            float _3414 = -_3376;
            float _3416 = fma(_3352, _3338, _3414);
            float _3418 = -_3378;
            float _3420 = fma(_3350, _3338, _3418);
            float _3422 = -_3380;
            float _3424 = fma(_3348, _3338, _3422);
            float _3426 = _3352 * _3340;
            float _3428 = -_3406;
            float _3430 = fma(_3334, _3344, _3428);
            float _3432 = -_3408;
            float _3434 = fma(_3332, _3344, _3432);
            float _3436 = _3352 * _3334;
            float _3438 = _3352 * _3332;
            float _3440 = -_3410;
            float _3442 = fma(_3332, _3342, _3440);
            float _3444 = -_3412;
            float _3446 = fma(_3350, _3344, _3444);
            float _3448 = _3350 * _3332;
            float _3450 = _3352 * _3392;
            float _3452 = -_3426;
            float _3454 = fma(_3348, _3344, _3452);
            float _3456 = -_3436;
            float _3458 = fma(_3350, _3336, _3456);
            float _3460 = -_3448;
            float _3462 = fma(_3348, _3334, _3460);
            float _3464 = _3352 * _3388;
            float _3466 = -_3450;
            float _3468 = fma(_3348, _3384, _3466);
            float _3470 = _3350 * _3340;
            float _3472 = _3350 * _3392;
            float _3474 = -_3464;
            float _3476 = fma(_3350, _3384, _3474);
            float _3478 = fma(_3354, _3434, _3468);
            float _3480 = -_3470;
            float _3482 = fma(_3348, _3342, _3480);
            float _3484 = -_3472;
            float _3486 = fma(_3348, _3388, _3484);
            float _3488 = _3350 * _3434;
            float _3490 = fma(_3354, _3430, _3476);
            float _3492 = _3358 * _3478;
            float _3494 = -_3438;
            float _3496 = fma(_3348, _3336, _3494);
            float _3498 = _3360 * _3388;
            float _3500 = -_3488;
            float _3502 = fma(_3348, _3430, _3500);
            float _3504 = fma(_3354, _3442, _3486);
            float _3506 = -_3492;
            float _3508 = fma(_3356, _3490, _3506);
            float _3510 = -_3498;
            float _3512 = fma(_3358, _3384, _3510);
            float _3514 = fma(_3352, _3442, _3502);
            float _3516 = _3360 * _3392;
            float _3518 = fma(_3360, _3504, _3508);
            float _3520 = _3358 * _3392;
            float _3522 = _3360 * _3404;
            float _3524 = -_3516;
            float _3526 = fma(_3356, _3384, _3524);
            float _3528 = -_3362;
            float _3530 = fma(_3528, _3514, _3518);
            float _3532 = -_3520;
            float _3534 = fma(_3356, _3388, _3532);
            float _3536 = _3360 * _3400;
            float _3538 = _3358 * _3404;
            float _3540 = 1.0 / _3530;
            float _3542 = fma(_3362, _3430, _3512);
            float _3544 = fma(_3362, _3442, _3534);
            float _3546 = -_3536;
            float _3548 = fma(_3358, _3396, _3546);
            float _3550 = -_3522;
            float _3552 = fma(_3356, _3396, _3550);
            float _3554 = _3360 * _3420;
            float _3556 = _3360 * _3424;
            float _3558 = -_3538;
            float _3560 = fma(_3356, _3400, _3558);
            float _3562 = fma(_3362, _3434, _3526);
            float _3564 = _3358 * _3424;
            float _3566 = fma(_3362, _3446, _3548);
            float _3568 = fma(_3362, _3454, _3552);
            float _3570 = fma(_3362, _3482, _3560);
            float _3572 = -_3554;
            float _3574 = fma(_3358, _3416, _3572);
            float _3576 = -_3556;
            float _3578 = fma(_3356, _3416, _3576);
            float _3580 = -_3564;
            float _3582 = fma(_3356, _3420, _3580);
            float _3584 = _3490 * _3540;
            float _3586 = _3542 * _3540;
            float _3588 = _3478 * _3540;
            float _3590 = _3544 * _3540;
            float _3592 = _3562 * _3540;
            float _3594 = _3504 * _3540;
            float _3596 = _3588 * _2478;
            float _3598 = _3586 * _3298;
            float _3600 = _3590 * _3298;
            float _3602 = _3566 * _3540;
            float _3604 = -_3596;
            float _3606 = fma(_3592, _3298, _3604);
            float _3608 = -_3598;
            float _3610 = fma(_3584, _2478, _3608);
            float _3612 = -_3600;
            float _3614 = fma(_3594, _2478, _3612);
            float _3616 = _3568 * _3540;
            float _3618 = _3570 * _3540;
            float _3620 = fma(_3362, _3458, _3574);
            float _3622 = fma(_3362, _3496, _3578);
            float _3624 = fma(_3362, _3462, _3582);
            float _3626 = fma(_3602, _2480, _3610);
            float _3628 = -_3616;
            float _3630 = fma(_3628, _2480, _3606);
            float _3632 = fma(_3618, _2480, _3614);
            float _3634 = -_3620;
            float _3636 = fma(_3634, _3540, _3626);
            float _3638 = fma(_3622, _3540, _3630);
            float _3640 = -_3624;
            float _3642 = fma(_3640, _3540, _3632);
            _2008 = _3594;
            _2010 = _3556;
            _2012 = _3542;
            _2014 = _3538;
            _2310 = _3602;
            _2312 = _3540;
            _2512 = _3620;
            _2314 = _3354;
            _2514 = _3356;
            _2316 = _3358;
            _2516 = _3618;
            _2318 = _3362;
            _2574 = _3304;
            _2582 = true;
            _2602 = as_type<int>(_3636);
            _2562 = _3302;
            _2570 = _3300;
            _2608 = as_type<int>(_3638);
            _2616 = as_type<int>(_3642);
            _2618 = _3582;
            _2620 = _3420;
            _2622 = _3446;
            _2578 = 0.0;
            _2590 = 0.0;
            _2586 = 0.0;
            _3644 = true;
        }
        else
        {
            bool _3646 = !_1780;
            if (!_3646)
            {
                float _3648 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
                uint _3650 = uint(int(uint(_180) >> uint(2)));
                float _3652 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3650)]);
                int _3654 = _180 + 4;
                uint _3656 = uint(int(uint(_3654) >> uint(2)));
                float _3658 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3656)]);
                int _3660 = _180 + 8;
                uint _3662 = uint(int(uint(_3660) >> uint(2)));
                float _3664 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3662)]);
                uint _3666 = uint(int(uint(_180) >> uint(2)));
                float _3668 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_3666)]);
                int _3670 = _180 + 4;
                uint _3672 = uint(int(uint(_3670) >> uint(2)));
                float _3674 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_3672)]);
                int _3676 = _180 + 8;
                uint _3678 = uint(int(uint(_3676) >> uint(2)));
                float _3680 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_3678)]);
                uint _3682 = uint(int(uint(_180) >> uint(2)));
                float _3684 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_3682)]);
                int _3686 = _180 + 4;
                uint _3688 = uint(int(uint(_3686) >> uint(2)));
                float _3690 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_3688)]);
                int _3692 = _180 + 8;
                uint _3694 = uint(int(uint(_3692) >> uint(2)));
                float _3696 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_3694)]);
                float _3698 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
                float _3700 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
                float _3702 = _3664 * _3668;
                float _3704 = _3664 * _3674;
                float _3706 = -_3702;
                float _3708 = fma(_3652, _3680, _3706);
                float _3710 = _3658 * _3668;
                float _3712 = -_3704;
                float _3714 = fma(_3658, _3680, _3712);
                float _3716 = _3690 * _3708;
                float _3718 = -_3710;
                float _3720 = fma(_3652, _3674, _3718);
                float _3722 = -_3716;
                float _3724 = fma(_3684, _3714, _3722);
                float _3726 = fma(_3696, _3720, _3724);
                float _3728 = 1.0 / _3726;
                float _3730 = _3648 * _3674;
                float _3732 = _3648 * _3680;
                float _3734 = _3648 * _3668;
                float _3736 = _3690 * _3680;
                float _3738 = _3696 * _3668;
                float _3740 = -_3730;
                float _3742 = fma(_3658, _3698, _3740);
                float _3744 = -_3732;
                float _3746 = fma(_3664, _3698, _3744);
                float _3748 = -_3734;
                float _3750 = fma(_3652, _3698, _3748);
                float _3752 = _3684 * _3674;
                float _3754 = _3684 * _3664;
                float _3756 = -_3738;
                float _3758 = fma(_3684, _3680, _3756);
                float _3760 = -_3736;
                float _3762 = fma(_3696, _3674, _3760);
                float _3764 = -_3752;
                float _3766 = fma(_3690, _3668, _3764);
                float _3768 = -_3652;
                float _3770 = fma(_3768, _3680, _3702);
                float _3772 = _3696 * _3658;
                float _3774 = _3690 * _3652;
                float _3776 = -_3754;
                float _3778 = fma(_3696, _3652, _3776);
                float _3780 = _3696 * _3742;
                float _3782 = _3762 * _3728;
                float _3784 = _3758 * _3728;
                float _3786 = _3766 * _3728;
                float _3788 = -_3772;
                float _3790 = fma(_3690, _3664, _3788);
                float _3792 = -_3780;
                float _3794 = fma(_3690, _3746, _3792);
                float _3796 = -_3774;
                float _3798 = fma(_3684, _3658, _3796);
                float _3800 = _3782 * _3298;
                float _3802 = _3784 * _3298;
                float _3804 = _3770 * _3728;
                float _3806 = _3714 * _3728;
                float _3808 = _3696 * _3750;
                float _3810 = _3786 * _3298;
                float _3812 = _3720 * _3728;
                float _3814 = _3690 * _3750;
                float _3816 = fma(_3804, _2478, _3802);
                float _3818 = fma(_3806, _2478, _3800);
                float _3820 = -_3808;
                float _3822 = fma(_3684, _3746, _3820);
                float _3824 = fma(_3812, _2478, _3810);
                float _3826 = _3778 * _3728;
                float _3828 = _3790 * _3728;
                float _3830 = _3798 * _3728;
                float _3832 = -_3814;
                float _3834 = fma(_3684, _3742, _3832);
                float _3836 = fma(_3826, _2480, _3816);
                float _3838 = fma(_3828, _2480, _3818);
                float _3840 = fma(_3700, _3708, _3822);
                float _3842 = fma(_3700, _3714, _3794);
                float _3844 = fma(_3830, _2480, _3824);
                float _3846 = fma(_3700, _3720, _3834);
                float _3848 = fma(_3840, _3728, _3836);
                float _3850 = -_3842;
                float _3852 = fma(_3850, _3728, _3838);
                float _3854 = -_3846;
                float _3856 = fma(_3854, _3728, _3844);
                _2008 = _3830;
                _2010 = _3790;
                _2012 = _3680;
                _2014 = _3770;
                _2310 = _3846;
                _2312 = _3690;
                _2512 = _3696;
                _2314 = _3844;
                _2514 = _3708;
                _2316 = _3838;
                _2318 = _3778;
                _2574 = _3304;
                _2582 = true;
                _2602 = as_type<int>(_3852);
                _2562 = _3302;
                _2570 = _3300;
                _2608 = as_type<int>(_3848);
                _2616 = as_type<int>(_3856);
                _2618 = 0.0;
                _2620 = 0.0;
                _2622 = _3798;
                _2578 = 0.0;
                _2590 = 0.0;
                _2586 = 0.0;
                _3644 = true;
            }
            else
            {
                if (!_1866)
                {
                    _3318 = true;
                }
                bool _3858 = _3318;
                _2582 = _3858;
                if (!_1866)
                {
                    _3320 = 0.0;
                    _3322 = 0.0;
                }
                float _3860 = _3320;
                float _3862 = _3322;
                _2578 = _3860;
                _2586 = _3862;
                if (!_1866)
                {
                    _3324 = 0.0;
                }
                float _3864 = _3324;
                _2590 = _3864;
                if (!_1866)
                {
                    _3326 = _3302;
                }
                float _3866 = _3326;
                _2562 = _3866;
                if (!_1866)
                {
                    _3328 = _3300;
                }
                float _3868 = _3328;
                _2570 = _3868;
                if (!_1866)
                {
                    _3330 = _3304;
                }
                float _3870 = _3330;
                _2574 = _3870;
                if (!_1866)
                {
                    _2600 = as_type<int>(_2478);
                }
                int _3872 = _2600;
                _2602 = _3872;
                if (!_1866)
                {
                    _2614 = as_type<int>(_2480);
                }
                int _3874 = _2614;
                bool _3876 = !_1866;
                _2616 = _3874;
                _2618 = 0.0;
                _2620 = 0.0;
                _2622 = 0.0;
                if (!_3876)
                {
                    uint _3878 = uint(int(uint(_180) >> uint(2)));
                    float _3880 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3878)]);
                    int _3882 = _180 + 4;
                    uint _3884 = uint(int(uint(_3882) >> uint(2)));
                    float _3886 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3884)]);
                    int _3888 = _180 + 8;
                    uint _3890 = uint(int(uint(_3888) >> uint(2)));
                    float _3892 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3890)]);
                    int _3894 = _180 + 12;
                    uint _3896 = uint(int(uint(_3894) >> uint(2)));
                    float _3898 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3896)]);
                    uint _3900 = uint(int(uint(_180) >> uint(2)));
                    float _3902 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_3900)]);
                    int _3904 = _180 + 4;
                    uint _3906 = uint(int(uint(_3904) >> uint(2)));
                    float _3908 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_3906)]);
                    int _3910 = _180 + 8;
                    uint _3912 = uint(int(uint(_3910) >> uint(2)));
                    float _3914 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_3912)]);
                    int _3916 = _180 + 12;
                    uint _3918 = uint(int(uint(_3916) >> uint(2)));
                    float _3920 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_3918)]);
                    uint _3922 = uint(int(uint(_180) >> uint(2)));
                    float _3924 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_3922)]);
                    int _3926 = _180 + 4;
                    uint _3928 = uint(int(uint(_3926) >> uint(2)));
                    float _3930 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_3928)]);
                    int _3932 = _180 + 8;
                    uint _3934 = uint(int(uint(_3932) >> uint(2)));
                    float _3936 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_3934)]);
                    int _3938 = _180 + 12;
                    uint _3940 = uint(int(uint(_3938) >> uint(2)));
                    float _3942 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_3940)]);
                    float _3944 = _3892 * _3902;
                    float _3946 = _3892 * _3908;
                    float _3948 = _3886 * _3902;
                    float _3950 = _3908 * _3898;
                    float _3952 = -_3944;
                    float _3954 = fma(_3880, _3914, _3952);
                    float _3956 = -_3946;
                    float _3958 = fma(_3886, _3914, _3956);
                    float _3960 = -_3948;
                    float _3962 = fma(_3880, _3908, _3960);
                    float _3964 = _3930 * _3914;
                    float _3966 = _3930 * _3954;
                    float _3968 = _3914 * _3898;
                    float _3970 = _3902 * _3898;
                    float _3972 = -_3950;
                    float _3974 = fma(_3886, _3920, _3972);
                    float _3976 = -_3966;
                    float _3978 = fma(_3924, _3958, _3976);
                    float _3980 = -_3964;
                    float _3982 = fma(_3936, _3908, _3980);
                    float _3984 = _3924 * _3908;
                    float _3986 = _3936 * _3886;
                    float _3988 = fma(_3936, _3962, _3978);
                    float _3990 = _3924 * _3892;
                    float _3992 = -_3968;
                    float _3994 = fma(_3892, _3920, _3992);
                    float _3996 = -_3970;
                    float _3998 = fma(_3880, _3920, _3996);
                    float _4000 = _3936 * _3902;
                    float _4002 = -_3984;
                    float _4004 = fma(_3930, _3902, _4002);
                    float _4006 = 1.0 / _3988;
                    float _4008 = -_3986;
                    float _4010 = fma(_3930, _3892, _4008);
                    float _4012 = -_3880;
                    float _4014 = fma(_4012, _3914, _3944);
                    float _4016 = -_3990;
                    float _4018 = fma(_3936, _3880, _4016);
                    float _4020 = _3930 * _3880;
                    float _4022 = _3930 * _3998;
                    float _4024 = -_4000;
                    float _4026 = fma(_3924, _3914, _4024);
                    float _4028 = _3936 * _3974;
                    float _4030 = -_4020;
                    float _4032 = fma(_3924, _3886, _4030);
                    float _4034 = -_4022;
                    float _4036 = fma(_3924, _3974, _4034);
                    float _4038 = _3936 * _3998;
                    float _4040 = -_4028;
                    float _4042 = fma(_3930, _3994, _4040);
                    float _4044 = fma(_3962, _3942, _4036);
                    float _4046 = -_4038;
                    float _4048 = fma(_3924, _3994, _4046);
                    float _4050 = fma(_3958, _3942, _4042);
                    float _4052 = _3982 * _4006;
                    float _4054 = _4026 * _4006;
                    float _4056 = _4004 * _4006;
                    float _4058 = _4014 * _4006;
                    float _4060 = _4052 * _3298;
                    float _4062 = _4054 * _3298;
                    float _4064 = _4056 * _3298;
                    float _4066 = _3958 * _4006;
                    float _4068 = _3962 * _4006;
                    float _4070 = fma(_4058, _2478, _4062);
                    float _4072 = _4018 * _4006;
                    float _4074 = fma(_4066, _2478, _4060);
                    float _4076 = fma(_4068, _2478, _4064);
                    float _4078 = _4010 * _4006;
                    float _4080 = _4032 * _4006;
                    float _4082 = fma(_3954, _3942, _4048);
                    float _4084 = fma(_4072, _2480, _4070);
                    float _4086 = fma(_4078, _2480, _4074);
                    float _4088 = fma(_4080, _2480, _4076);
                    float _4090 = fma(_4082, _4006, _4084);
                    float _4092 = -_4050;
                    float _4094 = fma(_4092, _4006, _4086);
                    float _4096 = -_4044;
                    float _4098 = fma(_4096, _4006, _4088);
                    _2008 = _4078;
                    _2010 = _4088;
                    _2012 = _4026;
                    _2014 = _4000;
                    _2310 = _3924;
                    _2312 = _3930;
                    _2512 = _4082;
                    _2314 = _3942;
                    _2514 = _4058;
                    _2316 = _3994;
                    _2516 = _4072;
                    _2318 = _3998;
                    _2574 = _3304;
                    _2582 = true;
                    _2602 = as_type<int>(_4094);
                    _2562 = _3302;
                    _2570 = _3300;
                    _2608 = as_type<int>(_4090);
                    _2616 = as_type<int>(_4098);
                    _2618 = 0.0;
                    _2620 = 0.0;
                    _2622 = _3990;
                    _2578 = 0.0;
                    _2590 = 0.0;
                    _2586 = 0.0;
                }
            }
        }
    }
    _3644 = false;
    float _4100 = _2008;
    float _4102 = _2010;
    float _4104 = _2012;
    float _4106 = _2014;
    float _4108 = _2310;
    float _4110 = _2312;
    float _4112 = _2512;
    float _4114 = _2314;
    float _4116 = _2514;
    float _4118 = _2316;
    float _4120 = _2516;
    float _4122 = _2318;
    float _4124 = _2574;
    bool _4126 = _2582;
    int _4128 = _2602;
    float _4130 = _2562;
    float _4132 = _2570;
    int _4134 = _2608;
    float _4136 = _2566;
    int _4138 = _2616;
    float _4140 = _2618;
    float _4142 = _2620;
    float _4144 = _2622;
    float _4146 = _2578;
    float _4148 = _2590;
    float _4150 = _2586;
    float _4152 = _2596;
    float _4154 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _4156 = _4100;
    float _4158 = _4102;
    float _4160 = _4104;
    float _4162 = _4106;
    float _4164 = _4140;
    float _4166 = _4144;
    float _4168 = _4142;
    float _4170 = _4150;
    float _4172 = _4146;
    float _4174 = _4130;
    if (_1696)
    {
        float _4176 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _4178 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _4180 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _4182 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        _4156 = _4176;
        _4158 = _4178;
        _4160 = _4180;
        _4162 = _4182;
    }
    float _4184 = _4156;
    float _4186 = _4158;
    float _4188 = _4160;
    float _4190 = _4162;
    float _4192 = _4108;
    float _4194 = _4110;
    float _4196 = _4112;
    float _4198 = _4114;
    if (_1696)
    {
        float _4200 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _4202 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _4204 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _4206 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        _4192 = _4200;
        _4194 = _4202;
        _4196 = _4204;
        _4198 = _4206;
    }
    float _4208 = _4192;
    float _4210 = _4194;
    float _4212 = _4196;
    float _4214 = _4198;
    float _4216 = _4116;
    float _4218 = _4118;
    float _4220 = _4120;
    float _4222 = _4122;
    if (_1696)
    {
        float _4224 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _4226 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _4228 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _4230 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        _4216 = _4224;
        _4218 = _4226;
        _4220 = _4228;
        _4222 = _4230;
    }
    float _4232 = _4216;
    float _4234 = _4218;
    float _4236 = _4220;
    float _4238 = _4222;
    float _4240 = _4124 * 2.0;
    float _4242 = _4126 ? as_type<float>(_4128) : _1640;
    float _4244 = _4130 * _4130;
    float _4246 = _4244 * 2.0;
    float _4248 = _4126 ? as_type<float>(_4128) : _854;
    float _4250 = _4240 * _4132;
    float _4252 = _4126 ? as_type<float>(_2492) : _1786;
    float _4254 = _4130 * 2.0;
    float _4256 = _4126 ? as_type<float>(_4134) : _1776;
    float _4258 = _4126 ? as_type<float>(_4134) : _2534;
    float _4260 = fma(_4254, _4136, _4250);
    float _4262 = _4126 ? as_type<float>(_2496) : _1792;
    float _4264 = -_4250;
    float _4266 = fma(_4254, _4136, _4264);
    float _4268 = _4126 ? as_type<float>(_4138) : _1652;
    float _4270 = _4240 * _4136;
    float _4272 = _4126 ? as_type<float>(_4138) : _856;
    float _4274 = _4132 * 2.0;
    float _4276 = _4126 ? as_type<float>(_2498) : _1798;
    float _4278 = _4136 * 2.0;
    float _4280 = _4126 ? as_type<float>(_2496) : _376;
    float _4282 = -_4270;
    float _4284 = fma(_4274, _4130, _4282);
    float _4286 = _4240 * _4130;
    float _4288 = fma(_4274, _4130, _4270);
    float _4290 = _4126 ? as_type<float>(_2498) : _382;
    float _4292 = fma(_4278, _4132, _4286);
    float _4294 = -_4286;
    float _4296 = fma(_4278, _4132, _4294);
    float _4298 = -_4246;
    float _4300 = _4298 + 1.0;
    float _4302 = _4126 ? as_type<float>(_2492) : _380;
    float _4304 = fma(_4262, _4154, _4256);
    float _4306 = fma(_4276, _4154, _4268);
    float _4308 = fma(_4252, _4154, _4242);
    float _4310 = _4270;
    float _4312 = _4276;
    float _4314 = _4184;
    float _4316 = _4300;
    float _4318 = _4252;
    float _4320 = _4242;
    float _4322 = _4186;
    float _4324 = _4188;
    float _4326 = _4190;
    float _4328 = _4290;
    float _4330 = _4248;
    float _4332 = _4272;
    float _4334 = _4288;
    if (_1696)
    {
        float _4336 = _4304 * _4186;
        _4310 = _4336;
    }
    float _4338 = _4310;
    float _4340 = _4234;
    float _4342 = _4212;
    float _4344 = _4236;
    float _4346 = _4210;
    float _4348 = _4214;
    if (_1696)
    {
        float _4350 = _4304 * _4210;
        _4312 = _4350;
    }
    float _4352 = _4312;
    if (_1696)
    {
        float _4354 = fma(_4308, _4184, _4338);
        _4314 = _4354;
    }
    float _4356 = _4314;
    float _4358 = _4136 * _4136;
    float _4360 = _4356;
    float _4362 = _4358;
    if (_1696)
    {
        float _4364 = _4304 * _4234;
        _4340 = _4364;
    }
    float _4366 = _4340;
    float _4368 = _4366;
    if (_1696)
    {
        float _4370 = fma(_4308, _4208, _4352);
        _2518 = _4370;
    }
    float _4372 = _2518;
    float _4374 = _4132 * _4132;
    float _4376 = fma(_4358, -2.0, 1.0);
    float _4378 = _4374;
    float _4380 = _4372;
    if (_1696)
    {
        float _4382 = fma(_4308, _4232, _4366);
        _4368 = _4382;
    }
    float _4384 = _4368;
    float _4386 = _4384;
    if (_1696)
    {
        float _4388 = fma(_4306, _4188, _4356);
        _4360 = _4388;
    }
    float _4390 = _4360;
    float _4392 = _4390;
    if (_1696)
    {
        float _4394 = fma(_4306, _4212, _4372);
        _4342 = _4394;
    }
    float _4396 = _4342;
    float _4398 = fma(_4374, -2.0, 1.0);
    if (_1696)
    {
        float _4400 = fma(_4306, _4236, _4384);
        _4344 = _4400;
    }
    float _4402 = _4344;
    float _4404 = fma(_4358, -2.0, _4300);
    float _4406 = fma(_4374, -2.0, _4376);
    if (_1696)
    {
        float _4408 = _4390 + _4190;
        _4164 = _4408;
    }
    float _4410 = _4164;
    float _4412 = _4410;
    float _4414 = _4410;
    if (_1696)
    {
        float _4416 = _4396 + _4214;
        _4166 = _4416;
    }
    float _4418 = _4166;
    float _4420 = _4418;
    float _4422 = _4418;
    if (_1696)
    {
        float _4424 = _4402 + _4238;
        _4168 = _4424;
    }
    float _4426 = _4168;
    float _4428 = -_4246;
    float _4430 = _4428 + _4398;
    float _4432 = _4426;
    float _4434 = _4426;
    if (!_1696)
    {
        bool _4436 = !_1780;
        if (!_4436)
        {
            float _4438 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
            uint _4440 = uint(int(uint(_180) >> uint(2)));
            float _4442 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_4440)]);
            int _4444 = _180 + 4;
            uint _4446 = uint(int(uint(_4444) >> uint(2)));
            float _4448 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_4446)]);
            int _4450 = _180 + 8;
            uint _4452 = uint(int(uint(_4450) >> uint(2)));
            float _4454 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_4452)]);
            int _4456 = _180 + 12;
            uint _4458 = uint(int(uint(_4456) >> uint(2)));
            float _4460 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_4458)]);
            uint _4462 = uint(int(uint(_180) >> uint(2)));
            float _4464 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4462)]);
            int _4466 = _180 + 4;
            uint _4468 = uint(int(uint(_4466) >> uint(2)));
            float _4470 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4468)]);
            int _4472 = _180 + 8;
            uint _4474 = uint(int(uint(_4472) >> uint(2)));
            float _4476 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4474)]);
            int _4478 = _180 + 12;
            uint _4480 = uint(int(uint(_4478) >> uint(2)));
            float _4482 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4480)]);
            uint _4484 = uint(int(uint(_180) >> uint(2)));
            float _4486 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_4484)]);
            int _4488 = _180 + 4;
            uint _4490 = uint(int(uint(_4488) >> uint(2)));
            float _4492 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_4490)]);
            int _4494 = _180 + 8;
            uint _4496 = uint(int(uint(_4494) >> uint(2)));
            float _4498 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_4496)]);
            int _4500 = _180 + 12;
            uint _4502 = uint(int(uint(_4500) >> uint(2)));
            float _4504 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_4502)]);
            float _4506 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
            float _4508 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
            float _4510 = _4448 * _4304;
            float _4512 = _4470 * _4304;
            float _4514 = _4492 * _4304;
            float _4516 = fma(_4442, _4308, _4510);
            float _4518 = fma(_4464, _4308, _4512);
            float _4520 = fma(_4486, _4308, _4514);
            float _4522 = fma(_4454, _4306, _4516);
            float _4524 = fma(_4476, _4306, _4518);
            float _4526 = fma(_4498, _4306, _4520);
            float _4528 = _4438 + _4522;
            float _4530 = _4506 + _4524;
            float _4532 = _4508 + _4526;
            _4362 = _4442;
            _4316 = _4522;
            _4378 = _4454;
            _4380 = _4460;
            _4318 = _4464;
            _2520 = _4524;
            _1840 = _4476;
            _4320 = _4482;
            _4392 = _4486;
            _4322 = _4526;
            _4324 = _4498;
            _4326 = _4504;
            _4414 = _4528;
            _4434 = _4532;
            _4422 = _4530;
            _4534 = true;
        }
        else
        {
            if (!_1866)
            {
                _4412 = _4308;
            }
            float _4536 = _4412;
            _4414 = _4536;
            if (!_1866)
            {
                _4420 = _4304;
            }
            float _4538 = _4420;
            _4422 = _4538;
            if (!_1866)
            {
                _4432 = _4306;
            }
            float _4540 = _4432;
            bool _4542 = !_1866;
            _4434 = _4540;
            if (!_4542)
            {
                uint _4544 = uint(int(uint(_180) >> uint(2)));
                float _4546 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_4544)]);
                int _4548 = _180 + 4;
                uint _4550 = uint(int(uint(_4548) >> uint(2)));
                float _4552 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_4550)]);
                int _4554 = _180 + 8;
                uint _4556 = uint(int(uint(_4554) >> uint(2)));
                float _4558 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_4556)]);
                int _4560 = _180 + 12;
                uint _4562 = uint(int(uint(_4560) >> uint(2)));
                float _4564 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_4562)]);
                uint _4566 = uint(int(uint(_180) >> uint(2)));
                float _4568 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4566)]);
                int _4570 = _180 + 4;
                uint _4572 = uint(int(uint(_4570) >> uint(2)));
                float _4574 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4572)]);
                int _4576 = _180 + 8;
                uint _4578 = uint(int(uint(_4576) >> uint(2)));
                float _4580 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4578)]);
                int _4582 = _180 + 12;
                uint _4584 = uint(int(uint(_4582) >> uint(2)));
                float _4586 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4584)]);
                uint _4588 = uint(int(uint(_180) >> uint(2)));
                float _4590 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_4588)]);
                int _4592 = _180 + 4;
                uint _4594 = uint(int(uint(_4592) >> uint(2)));
                float _4596 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_4594)]);
                int _4598 = _180 + 8;
                uint _4600 = uint(int(uint(_4598) >> uint(2)));
                float _4602 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_4600)]);
                int _4604 = _180 + 12;
                uint _4606 = uint(int(uint(_4604) >> uint(2)));
                float _4608 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_4606)]);
                float _4610 = _4552 * _4304;
                float _4612 = _4574 * _4304;
                float _4614 = _4596 * _4304;
                float _4616 = fma(_4546, _4308, _4610);
                float _4618 = fma(_4568, _4308, _4612);
                float _4620 = fma(_4590, _4308, _4614);
                float _4622 = fma(_4558, _4306, _4616);
                float _4624 = fma(_4580, _4306, _4618);
                float _4626 = fma(_4602, _4306, _4620);
                float _4628 = _4622 + _4564;
                float _4630 = _4624 + _4586;
                float _4632 = _4626 + _4608;
                _4362 = _4546;
                _4316 = _4616;
                _4378 = _4622;
                _4380 = _4564;
                _4318 = _4568;
                _2520 = _4618;
                _1840 = _4624;
                _4320 = _4586;
                _4392 = _4590;
                _4322 = _4620;
                _4324 = _4626;
                _4326 = _4608;
                _4414 = _4628;
                _4434 = _4632;
                _4422 = _4630;
            }
        }
    }
    _4534 = false;
    float _4634 = _4362;
    float _4636 = _4316;
    float _4638 = _4378;
    float _4640 = _4380;
    float _4642 = _4318;
    float _4644 = _2520;
    float _4646 = _1840;
    float _4648 = _4320;
    float _4650 = _4392;
    float _4652 = _4322;
    float _4654 = _4324;
    float _4656 = _4326;
    float _4658 = _4414;
    float _4660 = _4434;
    float _4662 = _4422;
    float _4664 = _4634;
    float _4666 = _4636;
    float _4668 = _4638;
    float _4670 = _4640;
    if (_1696)
    {
        float _4672 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _4674 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _4676 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _4678 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        _4664 = _4672;
        _4666 = _4674;
        _4668 = _4676;
        _4670 = _4678;
    }
    float _4680 = _4664;
    float _4682 = _4666;
    float _4684 = _4668;
    float _4686 = _4670;
    float _4688 = _4642;
    float _4690 = _4644;
    float _4692 = _4646;
    float _4694 = _4648;
    if (_1696)
    {
        float _4696 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _4698 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _4700 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _4702 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        _4688 = _4696;
        _4690 = _4698;
        _4692 = _4700;
        _4694 = _4702;
    }
    float _4704 = _4688;
    float _4706 = _4690;
    float _4708 = _4692;
    float _4710 = _4694;
    float _4712 = _4650;
    float _4714 = _4652;
    float _4716 = _4654;
    float _4718 = _4656;
    if (_1696)
    {
        float _4720 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _4722 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _4724 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _4726 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        _4712 = _4720;
        _4714 = _4722;
        _4716 = _4724;
        _4718 = _4726;
    }
    float _4728 = _4712;
    float _4730 = _4714;
    float _4732 = _4716;
    float _4734 = _4718;
    float _4736 = _4280 * 59.999996185302734375;
    float _4738 = _4302 * 59.999996185302734375;
    float _4740 = _4290 * 59.999996185302734375;
    float _4742 = _4686;
    float _4744 = _4682;
    float _4746 = _4684;
    float _4748 = _4680;
    float _4750 = _4682;
    if (_1696)
    {
        float _4752 = _4736 * _4682;
        _4742 = _4752;
    }
    float _4754 = _4742;
    float _4756 = _4710;
    float _4758 = _4754;
    float _4760 = _4706;
    float _4762 = _4708;
    float _4764 = _4704;
    float _4766 = _4706;
    float _4768 = _4708;
    if (_1696)
    {
        float _4770 = _4736 * _4706;
        _4756 = _4770;
    }
    float _4772 = _4756;
    float _4774 = _4772;
    if (_1696)
    {
        float _4776 = fma(_4738, _4680, _4754);
        _4758 = _4776;
    }
    float _4778 = _4758;
    float _4780 = _4734;
    float _4782 = _4778;
    float _4784 = _4730;
    float _4786 = _4732;
    float _4788 = _4728;
    float _4790 = _4730;
    float _4792 = _4732;
    if (_1696)
    {
        float _4794 = _4736 * _4730;
        _4780 = _4794;
    }
    float _4796 = _4780;
    float _4798 = _4796;
    if (_1696)
    {
        float _4800 = fma(_4738, _4704, _4772);
        _4774 = _4800;
    }
    float _4802 = _4774;
    float _4804 = _4802;
    if (_1696)
    {
        float _4806 = fma(_4740, _4684, _4778);
        _4782 = _4806;
    }
    float _4808 = _4782;
    float _4810 = _4808;
    float _4812 = _4808;
    if (_1696)
    {
        float _4814 = fma(_4738, _4728, _4796);
        _4798 = _4814;
    }
    float _4816 = _4798;
    float _4818 = _4816;
    if (_1696)
    {
        float _4820 = fma(_4740, _4708, _4802);
        _4804 = _4820;
    }
    float _4822 = _4804;
    float _4824 = _4822;
    float _4826 = _4822;
    if (_1696)
    {
        float _4828 = fma(_4740, _4732, _4816);
        _4818 = _4828;
    }
    float _4830 = _4818;
    float _4832 = _4830;
    float _4834 = _4830;
    if (!_1696)
    {
        bool _4836 = !_1780;
        if (!_4836)
        {
            uint _4838 = uint(int(uint(_180) >> uint(2)));
            float _4840 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_4838)]);
            int _4842 = _180 + 4;
            uint _4844 = uint(int(uint(_4842) >> uint(2)));
            float _4846 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_4844)]);
            int _4848 = _180 + 8;
            uint _4850 = uint(int(uint(_4848) >> uint(2)));
            float _4852 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_4850)]);
            int _4854 = _180 + 12;
            uint _4856 = uint(int(uint(_4854) >> uint(2)));
            float _4858 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_4856)]);
            uint _4860 = uint(int(uint(_180) >> uint(2)));
            float _4862 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4860)]);
            int _4864 = _180 + 4;
            uint _4866 = uint(int(uint(_4864) >> uint(2)));
            float _4868 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4866)]);
            int _4870 = _180 + 8;
            uint _4872 = uint(int(uint(_4870) >> uint(2)));
            float _4874 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4872)]);
            uint _4876 = uint(int(uint(_180) >> uint(2)));
            float _4878 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_4876)]);
            int _4880 = _180 + 4;
            uint _4882 = uint(int(uint(_4880) >> uint(2)));
            float _4884 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_4882)]);
            int _4886 = _180 + 8;
            uint _4888 = uint(int(uint(_4886) >> uint(2)));
            float _4890 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_4888)]);
            float _4892 = _4846 * _4736;
            float _4894 = _4868 * _4736;
            float _4896 = _4884 * _4736;
            float _4898 = fma(_4840, _4738, _4892);
            float _4900 = fma(_4862, _4738, _4894);
            float _4902 = fma(_4878, _4738, _4896);
            float _4904 = fma(_4852, _4740, _4898);
            float _4906 = fma(_4874, _4740, _4900);
            float _4908 = fma(_4890, _4740, _4902);
            _4346 = _4898;
            _4348 = _4858;
            _4386 = _4900;
            _4328 = _4890;
            _4826 = _4906;
            _4812 = _4904;
            _4834 = _4908;
            _4910 = true;
        }
        else
        {
            if (!_1866)
            {
                _4810 = _4738;
            }
            float _4912 = _4810;
            _4812 = _4912;
            if (!_1866)
            {
                _4824 = _4736;
            }
            float _4914 = _4824;
            _4826 = _4914;
            if (!_1866)
            {
                _4832 = _4740;
            }
            float _4916 = _4832;
            bool _4918 = !_1866;
            _4834 = _4916;
            if (!_4918)
            {
                uint _4920 = uint(int(uint(_180) >> uint(2)));
                float _4922 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_4920)]);
                int _4924 = _180 + 4;
                uint _4926 = uint(int(uint(_4924) >> uint(2)));
                float _4928 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_4926)]);
                int _4930 = _180 + 8;
                uint _4932 = uint(int(uint(_4930) >> uint(2)));
                float _4934 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_4932)]);
                int _4936 = _180 + 12;
                uint _4938 = uint(int(uint(_4936) >> uint(2)));
                float _4940 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_4938)]);
                uint _4942 = uint(int(uint(_180) >> uint(2)));
                float _4944 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4942)]);
                int _4946 = _180 + 4;
                uint _4948 = uint(int(uint(_4946) >> uint(2)));
                float _4950 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4948)]);
                int _4952 = _180 + 8;
                uint _4954 = uint(int(uint(_4952) >> uint(2)));
                float _4956 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4954)]);
                uint _4958 = uint(int(uint(_180) >> uint(2)));
                float _4960 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_4958)]);
                int _4962 = _180 + 4;
                uint _4964 = uint(int(uint(_4962) >> uint(2)));
                float _4966 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_4964)]);
                int _4968 = _180 + 8;
                uint _4970 = uint(int(uint(_4968) >> uint(2)));
                float _4972 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_4970)]);
                float _4974 = _4928 * _4736;
                float _4976 = _4950 * _4736;
                float _4978 = _4966 * _4736;
                float _4980 = fma(_4922, _4738, _4974);
                float _4982 = fma(_4944, _4738, _4976);
                float _4984 = fma(_4960, _4738, _4978);
                float _4986 = fma(_4934, _4740, _4980);
                float _4988 = fma(_4956, _4740, _4982);
                float _4990 = fma(_4972, _4740, _4984);
                _4346 = _4980;
                _4348 = _4940;
                _4386 = _4982;
                _4328 = _4972;
                _4826 = _4988;
                _4812 = _4986;
                _4834 = _4990;
            }
        }
    }
    _4910 = false;
    float _4992 = _4346;
    float _4994 = _4348;
    float _4996 = _4386;
    float _4998 = _4328;
    float _5000 = _4826;
    float _5002 = _4812;
    float _5004 = _4834;
    float _5006 = -_4304;
    float _5008 = _5006 + _4258;
    float _5010 = -_4308;
    float _5012 = _5010 + _4248;
    float _5014 = -_4306;
    float _5016 = _5014 + _4272;
    float _5018 = _4992;
    float _5020 = _4994;
    float _5022 = _4996;
    float _5024 = _4998;
    float _5026 = _5002;
    float _5028 = _5000;
    float _5030 = _5004;
    if (_1696)
    {
        float _5032 = _5008 * _4682;
        _5018 = _5032;
    }
    float _5034 = _5018;
    float _5036 = _5034;
    if (_1696)
    {
        float _5038 = _5008 * _4706;
        _5020 = _5038;
    }
    float _5040 = _5020;
    float _5042 = _5040;
    if (_1696)
    {
        float _5044 = _5008 * _4730;
        _5022 = _5044;
    }
    float _5046 = _5022;
    float _5048 = _5046;
    if (_1696)
    {
        float _5050 = fma(_5012, _4680, _5034);
        _5036 = _5050;
    }
    float _5052 = _5036;
    if (_1696)
    {
        float _5054 = fma(_5012, _4704, _5040);
        _5042 = _5054;
    }
    float _5056 = _5042;
    if (_1696)
    {
        float _5058 = fma(_5012, _4728, _5046);
        _5048 = _5058;
    }
    float _5060 = _5048;
    if (_1696)
    {
        float _5062 = fma(_5016, _4684, _5052);
        _4330 = _5062;
    }
    float _5064 = _4330;
    float _5066 = _5064;
    float _5068 = _5064;
    if (_1696)
    {
        float _5070 = fma(_5016, _4708, _5056);
        _4332 = _5070;
    }
    float _5072 = _4332;
    float _5074 = _5072;
    float _5076 = _5072;
    if (_1696)
    {
        float _5078 = fma(_5016, _4732, _5060);
        _5024 = _5078;
    }
    float _5080 = _5024;
    float _5082 = _5080;
    float _5084 = _5080;
    if (!_1696)
    {
        bool _5086 = !_1780;
        if (!_5086)
        {
            uint _5088 = uint(int(uint(_180) >> uint(2)));
            float _5090 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_5088)]);
            int _5092 = _180 + 4;
            uint _5094 = uint(int(uint(_5092) >> uint(2)));
            float _5096 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_5094)]);
            int _5098 = _180 + 8;
            uint _5100 = uint(int(uint(_5098) >> uint(2)));
            float _5102 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_5100)]);
            uint _5104 = uint(int(uint(_180) >> uint(2)));
            float _5106 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_5104)]);
            int _5108 = _180 + 4;
            uint _5110 = uint(int(uint(_5108) >> uint(2)));
            float _5112 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_5110)]);
            int _5114 = _180 + 8;
            uint _5116 = uint(int(uint(_5114) >> uint(2)));
            float _5118 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_5116)]);
            uint _5120 = uint(int(uint(_180) >> uint(2)));
            float _5122 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_5120)]);
            int _5124 = _180 + 4;
            uint _5126 = uint(int(uint(_5124) >> uint(2)));
            float _5128 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_5126)]);
            int _5130 = _180 + 8;
            uint _5132 = uint(int(uint(_5130) >> uint(2)));
            float _5134 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_5132)]);
            float _5136 = _5096 * _5008;
            float _5138 = _5112 * _5008;
            float _5140 = _5128 * _5008;
            float _5142 = fma(_5090, _5012, _5136);
            float _5144 = fma(_5106, _5012, _5138);
            float _5146 = fma(_5122, _5012, _5140);
            float _5148 = fma(_5102, _5016, _5142);
            float _5150 = fma(_5118, _5016, _5144);
            float _5152 = fma(_5134, _5016, _5146);
            _5068 = _5148;
            _5076 = _5150;
            _5084 = _5152;
            _5154 = true;
        }
        else
        {
            if (!_1866)
            {
                _5066 = _5012;
            }
            float _5156 = _5066;
            _5068 = _5156;
            if (!_1866)
            {
                _5074 = _5008;
            }
            float _5158 = _5074;
            _5076 = _5158;
            if (!_1866)
            {
                _5082 = _5016;
            }
            float _5160 = _5082;
            bool _5162 = !_1866;
            _5084 = _5160;
            if (!_5162)
            {
                uint _5164 = uint(int(uint(_180) >> uint(2)));
                float _5166 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_5164)]);
                int _5168 = _180 + 4;
                uint _5170 = uint(int(uint(_5168) >> uint(2)));
                float _5172 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_5170)]);
                int _5174 = _180 + 8;
                uint _5176 = uint(int(uint(_5174) >> uint(2)));
                float _5178 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_5176)]);
                uint _5180 = uint(int(uint(_180) >> uint(2)));
                float _5182 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_5180)]);
                int _5184 = _180 + 4;
                uint _5186 = uint(int(uint(_5184) >> uint(2)));
                float _5188 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_5186)]);
                int _5190 = _180 + 8;
                uint _5192 = uint(int(uint(_5190) >> uint(2)));
                float _5194 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_5192)]);
                uint _5196 = uint(int(uint(_180) >> uint(2)));
                float _5198 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_5196)]);
                int _5200 = _180 + 4;
                uint _5202 = uint(int(uint(_5200) >> uint(2)));
                float _5204 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_5202)]);
                int _5206 = _180 + 8;
                uint _5208 = uint(int(uint(_5206) >> uint(2)));
                float _5210 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_5208)]);
                float _5212 = _5172 * _5008;
                float _5214 = _5188 * _5008;
                float _5216 = _5204 * _5008;
                float _5218 = fma(_5166, _5012, _5212);
                float _5220 = fma(_5182, _5012, _5214);
                float _5222 = fma(_5198, _5012, _5216);
                float _5224 = fma(_5178, _5016, _5218);
                float _5226 = fma(_5194, _5016, _5220);
                float _5228 = fma(_5210, _5016, _5222);
                _5068 = _5224;
                _5076 = _5226;
                _5084 = _5228;
            }
        }
    }
    _5154 = false;
    float _5230 = _5068;
    float _5232 = _5076;
    float _5234 = _5084;
    int _5236 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 24;
    uint _5238 = uint(int(uint(_5236) >> uint(2)));
    float _5240 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_5238)]);
    int _5242 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 16;
    uint _5244 = uint(int(uint(_5242) >> uint(2)));
    float _5246 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_5244)]);
    int _5248 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 8;
    uint _5250 = uint(int(uint(_5248) >> uint(2)));
    float _5252 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_5250)]);
    uint _5254 = uint(int(uint(as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x)) >> uint(2)));
    float _5256 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_5254)]);
    float _5258 = fma(_4658, 6.2500002968590706586837768554688e-05, 0.50018751621246337890625);
    float _5260 = fma(_4660, 6.2500002968590706586837768554688e-05, 0.50018751621246337890625);
    float _5262 = fma(_4658, 6.2500002968590706586837768554688e-05, 0.5);
    float _5264 = fma(_4660, 6.2500002968590706586837768554688e-05, 0.5);
    float _5266 = fma(_4660, 6.2500002968590706586837768554688e-05, 0.4998125135898590087890625);
    float _5268 = fma(_4658, 6.2500002968590706586837768554688e-05, 0.4998125135898590087890625);
    float _5270 = fma(_4658, 6.2500002968590706586837768554688e-05, 0.5000312328338623046875);
    float _5272 = fma(_4660, 6.2500002968590706586837768554688e-05, 0.5000312328338623046875);
    float _5274 = _5240 * _5240;
    float _5276 = fma(_5246, _5246, _5274);
    float _5278 = rsqrt(_5276);
    float _5280 = _5278 * (-20.0);
    float _5282 = fma(_5240, _5280, _5252);
    float _5284 = fma(_5246, _5280, _5256);
    float _5286 = _5282 * 0.5;
    float _5288 = _5284 * 0.5;
    float _5290 = floor(_5288);
    float _5292 = floor(_5286);
    float _5294 = fma(_5290, 2.0, -32.0);
    float _5296 = -_5294;
    float _5298 = _5296 + _4658;
    float _5300 = fma(_5292, 2.0, -32.0);
    float _5302 = -_5300;
    float _5304 = _5302 + _4660;
    float _5306 = _5298 * 0.015625;
    float _5308 = _5304 * 0.015625;
    float2 _17734 = float2(_5306, _5308);
    float2 _5310 = dm_bs(spvDescriptorSet0.cp_t_tcb_26.sample(spvDescriptorSet0.cp_t_tcb_26Smplr, select(_17734, float2(0.0), isnan(_17734)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.cp_t_tcb_26, spvDescriptorSet0.cp_t_tcb_26Smplr_w, select(_17734, float2(0.0), isnan(_17734)), level(0.0)).xy;
    float _5312 = _5310.x;
    float _5314 = _5310.y;
    float2 _17746 = float2(_5258, _5260);
    float _5316 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_17746, float2(0.0), isnan(_17746)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_17746, float2(0.0), isnan(_17746)), level(0.0)).x;
    float2 _17754 = float2(_5262, _5264);
    float2 _5318 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_17754, float2(0.0), isnan(_17754)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_17754, float2(0.0), isnan(_17754)), level(0.0)).xy;
    float _5320 = _5318.x;
    float _5322 = _5318.y;
    float2 _17766 = float2(_5258, _5266);
    float _5324 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_17766, float2(0.0), isnan(_17766)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_17766, float2(0.0), isnan(_17766)), level(0.0)).x;
    float2 _17774 = float2(_5268, _5260);
    float _5326 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_17774, float2(0.0), isnan(_17774)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_17774, float2(0.0), isnan(_17774)), level(0.0)).x;
    float2 _17782 = float2(_5268, _5266);
    float _5328 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_17782, float2(0.0), isnan(_17782)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_17782, float2(0.0), isnan(_17782)), level(0.0)).x;
    float2 _17790 = float2(_5270, _5264);
    float _5330 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_17790, float2(0.0), isnan(_17790)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_17790, float2(0.0), isnan(_17790)), level(0.0)).x;
    float2 _17798 = float2(_5262, _5272);
    float _5332 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_17798, float2(0.0), isnan(_17798)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_17798, float2(0.0), isnan(_17798)), level(0.0)).x;
    float2 _17806 = float2(_5262, _5264);
    float _5334 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_17806, float2(0.0), isnan(_17806)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_17806, float2(0.0), isnan(_17806)), level(0.0)).y;
    float2 _17814 = float2(_5270, _5264);
    float2 _5336 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_17814, float2(0.0), isnan(_17814)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_17814, float2(0.0), isnan(_17814)), level(0.0)).xy;
    float _5338 = _5336.x;
    float _5340 = _5336.y;
    float2 _17826 = float2(_5262, _5272);
    float2 _5342 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_17826, float2(0.0), isnan(_17826)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_17826, float2(0.0), isnan(_17826)), level(0.0)).xy;
    float _5344 = _5342.x;
    float _5346 = _5342.y;
    float _5348 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[73]);
    float _5350 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[72]);
    float _5352 = fma(_200, 3.1415927410125732421875, -1.57079637050628662109375);
    float _5354 = 1.0 / _4154;
    float _5356 = _5352 * 0.15915493667125701904296875;
    float _5358 = _5356 * 6.283185482025146484375;
    float _5360 = cos(_5358);
    float _5362 = _5356 * 6.283185482025146484375;
    float _5364 = sin(_5362);
    float _5366 = _1888 * 19.23889923095703125;
    float _5368 = _5354 * 59.999996185302734375;
    float _5370 = _1882 * 19.23889923095703125;
    float _5372 = _5230 * _5368;
    float _5374 = _5370 * 0.15915493667125701904296875;
    float _5376 = _5232 * _5368;
    float _5378 = _5234 * _5368;
    float _5380 = _5374 * 6.283185482025146484375;
    float _5382 = sin(_5380);
    float _5384 = _5382 * 34873.41015625;
    float _5386 = floor(_5384);
    float _5388 = -_5386;
    float _5390 = _5384 + _5388;
    float _5392 = _5314 * 14.99999904632568359375;
    float _5394 = _5312 * 14.99999904632568359375;
    float _5396 = _5392 * _5360;
    float _5398 = _5392 * _5364;
    float _5400 = _5392 * _5392;
    float _5402 = fma(_5394, _5364, _5396);
    float _5404 = _5366 * 0.15915493667125701904296875;
    float _5406 = -_5320;
    float _5408 = _5406 + _5316;
    float _5410 = -_5320;
    float _5412 = _5410 + _5324;
    float _5414 = _5320 * 2000.0;
    float _5416 = -_5398;
    float _5418 = fma(_5394, _5360, _5416);
    float _5420 = fma(_5394, _5394, _5400);
    float _5422 = _5404 * 6.283185482025146484375;
    float _5424 = sin(_5422);
    float _5426 = _5408 * 2000.0;
    float _5428 = _5412 * 2000.0;
    float _5430 = _5414 + (-2.0);
    float _5432 = -_5320;
    float _5434 = _5432 + _5326;
    float _5436 = -_5320;
    float _5438 = _5436 + _5330;
    float _5440 = abs(_5426);
    float _5442 = abs(_5428);
    float _5444 = precise::max(_5440, _5442);
    float _5446 = _5434 * 2000.0;
    bool _5448 = _4662 >= _5430;
    bool _5450 = isnan(_4662);
    bool _5452 = _5448 || _5450;
    bool _5454 = isnan(_5430);
    bool _5456 = _5452 || _5454;
    float _5458 = -_5320;
    float _5460 = _5458 + _5328;
    float _5462 = -_5348;
    float _5464 = _5462 + 1.0;
    float _5466 = -_5320;
    float _5468 = _5466 + _5332;
    float _5470 = _5438 * 1000.0;
    float _5472 = _5460 * 2000.0;
    float _5474 = fma(_206, _5348, _5464);
    float _5476 = _5468 * 1000.0;
    float _5478 = fma(_5470, _5470, 0.0625);
    float _5480 = abs(_5446);
    float _5482 = precise::max(_5444, _5480);
    float _5484 = _5424 * 34873.41015625;
    float _5486 = fma(_5476, _5476, _5478);
    float _5488 = floor(_5484);
    float _5490 = -_5322;
    float _5492 = _5320 + _5490;
    float _5494 = rsqrt(_5486);
    float _5496 = _5492 * 2000.0;
    float _5498 = sqrt(_5420);
    float _5500 = -_5488;
    float _5502 = _5500 + _5484;
    float _5504 = abs(_5496);
    bool _5506 = _5504 < 2.0;
    bool _5508 = !_5456;
    bool _5510 = _5506 || _5508;
    float _5512 = fma(_5502, 0.800000011920928955078125, 0.20000000298023223876953125);
    float _5514 = fma(_5390, _5390, 0.0400000028312206268310546875);
    float _5516 = _5494 * 0.25;
    float _5518 = abs(_5472);
    float _5520 = precise::max(_5482, _5518);
    float _5522 = fma(_5512, _5512, _5514);
    bool _5524 = _5516 < 0.891006529331207275390625;
    bool _5526 = _5524 || _5510;
    bool _5528 = _5520 >= 2.0;
    bool _5530 = isnan(_5520);
    bool _5532 = _5528 || _5530;
    bool _5534 = isnan(2.0);
    bool _5536 = _5532 || _5534;
    bool _5538 = _5536 || _5526;
    float _5540 = sqrt(_5522);
    float _5542 = sqrt(_5498);
    float _5544 = _5322 * 2000.0;
    float _5546 = _5544;
    float _5548 = _5418;
    float _5550 = _5372;
    float _5552 = _5378;
    float _5554 = _5322;
    if (!_5538)
    {
        float _5556 = _5476 * _5494;
        float _5558 = _5470 * _5494;
        float _5560 = 1.0 / _5516;
        float _5562 = _5556 * _5556;
        float _5564 = fma(_5558, _5558, _5562);
        float _5566 = sqrt(_5564);
        bool _5568 = _5566 > 9.9999997473787516355514526367188e-05;
        float _5570 = _5566 * _5560;
        float _5572 = _5558;
        float _5574 = _5562;
        if (_5568)
        {
            float _5576 = abs(_5558);
            float _5578 = abs(_5556);
            float _5580 = precise::max(_5576, _5578);
            _5572 = _5580;
        }
        float _5582 = _5572;
        if (!_5568)
        {
            _5574 = 0.0;
        }
        float _5584 = _5574;
        float _5586 = _5582;
        float _5588 = _5584;
        if (_5568)
        {
            float _5590 = 1.0 / _5582;
            _5586 = _5590;
        }
        float _5592 = _5586;
        if (_5568)
        {
            float _5594 = _5566 * _5592;
            _5588 = _5594;
        }
        float _5596 = _5588;
        float _5598 = _5596 * 0.9649016857147216796875;
        float _5600 = -_5598;
        float _5602 = fma(_5600, _5570, _5414);
        _5546 = _5602;
    }
    float _5604 = _5546;
    float _5606 = _5540 + 9.9999997473787516355514526367188e-06;
    float _5608 = -_5604;
    float _5610 = _4662 + _5608;
    bool _5612 = _5542 >= 0.5;
    float _5614 = _4404 * 0.100000001490116119384765625;
    bool _5616 = _5542 >= 1.0;
    float _5618 = abs(_5610);
    float _5620 = _5618 * 0.20000000298023223876953125;
    float _5622 = precise::clamp(_5620, 0.0, 1.0);
    float _5624 = 1.0 / _5606;
    float _5626 = fma(_4284, 0.20000000298023223876953125, _5614);
    float _5628 = -_5320;
    float _5630 = _5316 + _5628;
    float _5632 = -_5622;
    float _5634 = _5632 + 1.0;
    float _5636 = -_5320;
    float _5638 = _5324 + _5636;
    float _5640 = -_5320;
    float _5642 = _5328 + _5640;
    float _5644 = _5630 * 2000.0;
    float _5646 = _5634 * _5634;
    float _5648 = -_5320;
    float _5650 = _5648 + _5338;
    float _5652 = -_5320;
    float _5654 = _5652 + _5344;
    float _5656 = _5646 * _5646;
    float _5658 = _5650 * 1000.0;
    float _5660 = _5474 * _5656;
    float _5662 = _5624 * _5390;
    float _5664 = _5350 * 300.0;
    float _5666 = -_5624;
    float _5668 = _5512 * _5666;
    float _5670 = _5624 * 0.20000000298023223876953125;
    float _5672 = _5350 * 500.0;
    float _5674 = _4430 * _5662;
    float _5676 = _5664;
    float _5678 = _5672;
    float _5680 = _5674;
    if (_5612)
    {
        float _5682 = _5664 * _5660;
        _5676 = _5682;
    }
    float _5684 = _5676;
    float _5686 = _4266 * _5662;
    float _5688 = _4292 * _5662;
    float _5690 = _5688;
    if (_5616)
    {
        float _5692 = _5672 * _5660;
        _5678 = _5692;
    }
    float _5694 = _5678;
    float _5696 = fma(_4260, _5670, _5674);
    if (_5612)
    {
        float _5698 = _5418 * _5684;
        _5680 = _5698;
    }
    float _5700 = _5680;
    if (_5612)
    {
        float _5702 = _5402 * _5684;
        _5548 = _5702;
    }
    float _5704 = _5548;
    float _5706 = fma(_4284, _5670, _5688);
    float _5708 = _5376;
    if (_5616)
    {
        float _5710 = _5542 * _5694;
        _5690 = _5710;
    }
    float _5712 = _5690;
    if (_5612)
    {
        float _5714 = fma(_4154, _5700, _5372);
        _5550 = _5714;
    }
    float _5716 = _5550;
    float _5718 = _4296 * 0.100000001490116119384765625;
    float _5720 = fma(_4406, _5670, _5686);
    float _5722 = _5716;
    if (_5616)
    {
        float _5724 = fma(_4154, _5712, _5376);
        _5708 = _5724;
    }
    float _5726 = _5708;
    float _5728 = _4288 * 0.100000001490116119384765625;
    float _5730 = fma(_4296, _5668, _5696);
    if (_5612)
    {
        float _5732 = fma(_4154, _5704, _5378);
        _5552 = _5732;
    }
    float _5734 = _5552;
    float _5736 = _4284 * (-0.20000000298023223876953125);
    float _5738 = fma(_4406, 0.20000000298023223876953125, _5728);
    float _5740 = fma(_4260, 0.20000000298023223876953125, _5718);
    float _5742 = _5626 * _4146;
    float _5744 = fma(_4288, _5668, _5720);
    float _5746 = fma(_4404, _5668, _5706);
    float _5748 = _4406 * (-0.20000000298023223876953125);
    float _5750 = _5736 * _4146;
    float _5752 = _5740 * _4148;
    float _5754 = -_5742;
    float _5756 = fma(_5738, _4148, _5754);
    float _5758 = -_5726;
    float _5760 = _5000 + _5758;
    float _5762 = _4260 * (-0.20000000298023223876953125);
    float _5764 = -_5752;
    float _5766 = fma(_5626, _4150, _5764);
    float _5768 = -_5716;
    float _5770 = _5002 + _5768;
    float _5772 = _5760 + _5756;
    float _5774 = -_5750;
    float _5776 = fma(_5748, _4148, _5774);
    float _5778 = _5762 * _4148;
    float _5780 = _5738 * _4150;
    float _5782 = _5770 + _5766;
    float _5784 = _5772 * _5772;
    float _5786 = _5760 + _5776;
    float _5788 = -_5778;
    float _5790 = fma(_5736, _4150, _5788);
    float _5792 = _5748 * _4150;
    float _5794 = -_5780;
    float _5796 = fma(_5740, _4146, _5794);
    float _5798 = -_5734;
    float _5800 = _5004 + _5798;
    float _5802 = fma(_5782, _5782, _5784);
    float _5804 = _5770 + _5790;
    float _5806 = -_5792;
    float _5808 = fma(_5762, _4146, _5806);
    float _5810 = _5786 * _5786;
    float _5812 = _5800 + _5796;
    float _5814 = _5638 * 2000.0;
    float _5816 = _5800 + _5808;
    float _5818 = fma(_5804, _5804, _5810);
    float _5820 = fma(_5812, _5812, _5802);
    float _5822 = -_5320;
    float _5824 = _5326 + _5822;
    float _5826 = abs(_5644);
    float _5828 = abs(_5814);
    float _5830 = precise::max(_5826, _5828);
    float _5832 = fma(_5816, _5816, _5818);
    float _5834 = rsqrt(_5820);
    float _5836 = _5824 * 2000.0;
    float _5838 = _4296 * 0.980571091175079345703125;
    float _5840 = abs(_5836);
    float _5842 = precise::max(_5830, _5840);
    float _5844 = _5642 * 2000.0;
    float _5846 = sqrt(_5820);
    float _5848 = fma(_4430, 0.19611422717571258544921875, _5838);
    float _5850 = abs(_5844);
    float _5852 = precise::max(_5842, _5850);
    float _5854 = _4288 * 0.980571091175079345703125;
    float _5856 = rsqrt(_5832);
    float _5858 = _5772 * _5834;
    float _5860 = _5782 * _5834;
    float _5862 = _5812 * _5834;
    float _5864 = fma(_4266, 0.19611422717571258544921875, _5854);
    float _5866 = sqrt(_5832);
    bool _5868 = _5846 != 0.0;
    bool _5870 = isnan(_5846);
    bool _5872 = _5868 || _5870;
    bool _5874 = isnan(0.0);
    bool _5876 = _5872 || _5874;
    float _5878 = _5876 ? _5858 : 0.0;
    float _5880 = _5876 ? _5860 : 0.0;
    float _5882 = _5786 * _5856;
    float _5884 = _5804 * _5856;
    float _5886 = _5816 * _5856;
    float _5888 = _5878 * _5848;
    float _5890 = _4404 * 0.980571091175079345703125;
    float _5892 = _5876 ? _5862 : 0.0;
    float _5894 = fma(_5658, _5658, 0.0625);
    float _5896 = fma(_5880, _5864, _5888);
    bool _5898 = _5866 != 0.0;
    bool _5900 = isnan(_5866);
    bool _5902 = _5898 || _5900;
    bool _5904 = isnan(0.0);
    bool _5906 = _5902 || _5904;
    float _5908 = fma(_4292, 0.19611422717571258544921875, _5890);
    float _5910 = -_5322;
    float _5912 = _5320 + _5910;
    float _5914 = _5906 ? _5882 : 0.0;
    float _5916 = fma(_5892, _5908, _5896);
    float _5918 = _5906 ? _5884 : 0.0;
    float _5920 = _5912 * 2000.0;
    float _5922 = _5906 ? _5886 : 0.0;
    float _5924 = _5914 * _5730;
    float _5926 = _5820 * _5916;
    float _5928 = _5654 * 1000.0;
    float _5930 = abs(_5920);
    bool _5932 = _5930 >= 2.0;
    bool _5934 = isnan(_5930);
    bool _5936 = _5932 || _5934;
    bool _5938 = isnan(2.0);
    bool _5940 = _5936 || _5938;
    float _5942 = fma(_5918, _5744, _5924);
    float _5944 = _5864 * _5926;
    float _5946 = _5848 * _5926;
    float _5948 = _5908 * _5926;
    float _5950 = fma(_5922, _5746, _5942);
    float _5952 = -_5946;
    float _5954 = _5626 * _5952;
    float _5956 = -_5948;
    float _5958 = _5738 * _5956;
    float _5960 = _5832 * _5950;
    float _5962 = -_5948;
    float _5964 = -_5954;
    float _5966 = fma(_5740, _5962, _5964);
    float _5968 = -_5944;
    float _5970 = -_5958;
    float _5972 = fma(_5626, _5968, _5970);
    float _5974 = _5730 * _5960;
    float _5976 = fma(_5928, _5928, _5894);
    float _5978 = _5746 * _5960;
    float _5980 = _5744 * _5960;
    float _5982 = -_5944;
    float _5984 = _5740 * _5982;
    float _5986 = rsqrt(_5976);
    float _5988 = -_5978;
    float _5990 = _5748 * _5988;
    float _5992 = _2558 * 0.300000011920928955078125;
    float _5994 = -_5946;
    float _5996 = -_5984;
    float _5998 = fma(_5738, _5994, _5996);
    float _6000 = -_5946;
    float _6002 = -_5974;
    float _6004 = _6000 + _6002;
    float _6006 = -_5980;
    float _6008 = -_5990;
    float _6010 = fma(_5736, _6006, _6008);
    float _6012 = -_5974;
    float _6014 = _5736 * _6012;
    float _6016 = -_5944;
    float _6018 = -_5980;
    float _6020 = _6016 + _6018;
    float _6022 = -_5980;
    float _6024 = _5762 * _6022;
    float _6026 = _5972 + _6010;
    float _6028 = -_5978;
    float _6030 = -_6014;
    float _6032 = fma(_5762, _6028, _6030);
    float _6034 = -_5948;
    float _6036 = -_5978;
    float _6038 = _6034 + _6036;
    float _6040 = -_5974;
    float _6042 = -_6024;
    float _6044 = fma(_5748, _6040, _6042);
    float _6046 = _5966 + _6032;
    float _6048 = _2558 * 0.5;
    float _6050 = _5998 + _6044;
    float _6052 = _5658 * _5986;
    float _6054 = _5928 * _5986;
    float _6056 = _5986 * 0.25;
    float _6058 = _6056;
    float _6060 = _5734;
    float _6062 = _6004;
    float _6064 = _6020;
    float _6096;
    float _6098;
    float _6100;
    float _6102;
    if (!_5940)
    {
        float _6066 = -_5322;
        float _6068 = _6066 + _5340;
        float _6070 = -_5322;
        float _6072 = _6070 + _5346;
        float _6074 = _6068 * 1000.0;
        float _6076 = _6072 * 1000.0;
        float _6078 = fma(_6074, _6074, 0.0625);
        float _6080 = fma(_6076, _6076, _6078);
        float _6082 = _5322 * 2000.0;
        float _6084 = rsqrt(_6080);
        float _6086 = -_6074;
        float _6088 = fma(_6086, _6084, -0.0);
        float _6090 = -_6076;
        float _6092 = fma(_6090, _6084, -0.0);
        float _6094 = _6084 * 0.25;
        _6096 = _6082;
        _6058 = _6094;
        _6098 = _6088;
        _6100 = _6092;
        _6102 = _6084;
        _6104 = true;
    }
    else
    {
        float _6106 = _6054 * _6054;
        float _6108 = 1.0 / _6056;
        float _6110 = fma(_6052, _6052, _6106);
        float _6112 = sqrt(_6110);
        bool _6114 = _6112 > 9.9999997473787516355514526367188e-05;
        float _6116 = _6112 * _6108;
        float _6118 = _6106;
        if (_6114)
        {
            float _6120 = abs(_6052);
            float _6122 = abs(_6054);
            float _6124 = precise::max(_6120, _6122);
            _5554 = _6124;
        }
        float _6126 = _5554;
        float _6128 = -_6054;
        float _6130 = (-0.0) + _6128;
        _6100 = _6130;
        if (!_6114)
        {
            _6118 = 0.0;
        }
        float _6132 = _6118;
        float _6134 = _6126;
        float _6136 = _6132;
        if (_6114)
        {
            float _6138 = 1.0 / _6126;
            _6134 = _6138;
        }
        float _6140 = _6134;
        if (_6114)
        {
            float _6142 = _6112 * _6140;
            _6136 = _6142;
        }
        float _6144 = _6136;
        bool _6146 = _5852 >= 2.0;
        bool _6148 = isnan(_5852);
        bool _6150 = _6146 || _6148;
        bool _6152 = isnan(2.0);
        bool _6154 = _6150 || _6152;
        float _6156 = -_6052;
        float _6158 = (-0.0) + _6156;
        float _6160 = _6144 * 0.9649016857147216796875;
        bool _6162 = !_6154;
        float _6164 = _6162 ? 0.0 : 1000.0;
        float _6166 = _6160 * _6116;
        float _6168 = -_6166;
        float _6170 = fma(_5320, 2000.0, _6168);
        float _6172 = -_6164;
        float _6174 = _6170 + _6172;
        _6096 = _6174;
        _6098 = _6158;
        _6102 = _6166;
    }
    _6104 = false;
    float _6176 = _6096;
    float _6178 = _6058;
    float _6180 = _6098;
    float _6182 = _6100;
    float _6184 = _6102;
    float _6186 = -_4662;
    float _6188 = _6186 + _6176;
    bool _6190 = _6176 >= _4662;
    bool _6192 = isnan(_6176);
    bool _6194 = _6190 || _6192;
    bool _6196 = isnan(_4662);
    bool _6198 = _6194 || _6196;
    float _6200 = -_6176;
    float _6202 = fma(_5334, 2000.0, _6200);
    bool _6204 = _6176 > _4662;
    float _6206 = _6188 * _6188;
    float _6208 = precise::max(_1690, 0.001000000047497451305389404296875);
    bool _6210 = !_6204;
    float _6212 = _6210 ? 0.0 : 1.4012984643248170709237295832899e-45;
    bool _6214 = _4152 >= 0.5;
    float _6216 = sqrt(_6206);
    int _6218 = ~as_type<int>(_6212);
    int _6220 = _6218 + 1;
    int _6222 = _6220 + 1;
    float _6224 = abs(_6202);
    bool _6226 = _6224 >= 2.0;
    bool _6228 = isnan(_6224);
    bool _6230 = _6226 || _6228;
    bool _6232 = isnan(2.0);
    bool _6234 = _6230 || _6232;
    int _6236 = _6222;
    float _6238 = _6212;
    float _6240 = _6184;
    bool _6242 = _6198;
    if (_6198)
    {
        int _6244 = ~as_type<int>(_6212);
        int _6246 = _6244 + 1;
        _6236 = _6246;
    }
    int _6248 = _6236;
    bool _6250 = _6178 >= 0.891006529331207275390625;
    bool _6252 = _6250 && _6234;
    float _6254 = float(_6248);
    float _6256 = precise::min(_6208, 10000.0);
    float _6258 = _6216 * _6254;
    bool _6260 = !_6214;
    float _6262 = _6216;
    float _6264 = _6258;
    float _6266 = _6254;
    float _6358;
    float _6360;
    float _6362;
    float _6620;
    float _6622;
    float _6624;
    float _6626;
    float _6628;
    float _6630;
    float _6668;
    float _6670;
    float _6672;
    if (!_6260)
    {
        bool _6268 = _4398 > _4246;
        bool _6270 = _4398 >= _4246;
        bool _6272 = isnan(_4398);
        bool _6274 = _6270 || _6272;
        bool _6276 = isnan(_4246);
        bool _6278 = _6274 || _6276;
        int _6280 = _6278 ? 0 : 1;
        int _6282 = ~_6280;
        int _6284 = _6282 + 1;
        int _6286 = _6284 + 1;
        int _6288 = _6286;
        if (!_6268)
        {
            int _6290 = ~_6280;
            int _6292 = _6290 + 1;
            _6288 = _6292;
        }
        int _6294 = _6288;
        bool _6296 = _4152 != 1.0;
        bool _6298 = isnan(_4152);
        bool _6300 = _6296 || _6298;
        bool _6302 = isnan(1.0);
        bool _6304 = _6300 || _6302;
        float _6306 = float(_6294);
        float _6308 = _4430 * _6306;
        float _6310 = _4266 * _6306;
        float _6312 = _4292 * _6306;
        float _6314 = _5000 * _6178;
        float _6316 = _6308 * _6178;
        float _6318 = fma(_5002, _6180, _6314);
        float _6320 = fma(_6310, _6180, _6316);
        float _6322 = fma(_5004, _6182, _6318);
        float _6324 = fma(_6312, _6182, _6320);
        float _6326 = abs(_6324);
        float _6328 = -_6326;
        float _6330 = _6328 + 1.0;
        bool _6332 = _6322 <= 0.0;
        float _6334 = float(_6332);
        float _6336 = abs(_6330);
        float _6338 = log2(_6336);
        float _6340 = _6322 * _6334;
        float _6342 = -_6340;
        float _6344 = fma(_6180, _6342, _5002);
        float _6346 = -_6340;
        float _6348 = fma(_6178, _6346, _5000);
        float _6350 = -_6340;
        float _6352 = fma(_6182, _6350, _5004);
        float _6354 = _6338 * 0.20000000298023223876953125;
        float _6356 = exp2(_6354);
        _6358 = _6344;
        _6360 = _6348;
        _6362 = _6352;
        bool _6408;
        float _6470;
        int _6472;
        float _6474;
        float _6476;
        if (!_6304)
        {
            float _6364 = _6348 * _6348;
            float _6366 = _4146 * 0.89999997615814208984375;
            float _6368 = _4150 * 0.89999997615814208984375;
            float _6370 = _4148 * 0.89999997615814208984375;
            float _6372 = fma(_6344, _6344, _6364);
            float _6374 = fma(_6352, _6352, _6372);
            float _6376 = sqrt(_6374);
            bool _6378 = _6376 > 0.5;
            bool _6380 = !_6378;
            if (!_6380)
            {
                bool _6382 = _6324 > 0.0;
                bool _6384 = _6324 >= 0.0;
                bool _6386 = isnan(_6324);
                bool _6388 = _6384 || _6386;
                bool _6390 = isnan(0.0);
                bool _6392 = _6388 || _6390;
                float _6394 = precise::max(_1862, 0.100000001490116119384765625);
                int _6396 = _6392 ? 0 : 1;
                float _6398 = precise::max(_1850, 0.100000001490116119384765625);
                int _6400 = ~_6396;
                int _6402 = _6400 + 1;
                int _6404 = _6402 + 1;
                int _6406 = _6404;
                _6408 = _6382;
                if (!_6382)
                {
                    int _6410 = ~_6396;
                    int _6412 = _6410 + 1;
                    _6406 = _6412;
                }
                int _6414 = _6406;
                float _6416 = _6394 + _6398;
                float _6418 = float(_6414);
                float _6420 = 1.0 / _6416;
                float _6422 = _6310 * _6418;
                float _6424 = _6312 * _6418;
                float _6426 = _6308 * _6418;
                float _6428 = _6352 * _6422;
                float _6430 = _6348 * _6424;
                float _6432 = -_6428;
                float _6434 = fma(_6344, _6424, _6432);
                float _6436 = _6344 * _6426;
                float _6438 = -_6430;
                float _6440 = fma(_6352, _6426, _6438);
                float _6442 = _6434 * _6434;
                float _6444 = -_6436;
                float _6446 = fma(_6348, _6422, _6444);
                float _6448 = _6420 * 0.4000000059604644775390625;
                float _6450 = fma(_6440, _6440, _6442);
                float _6452 = _6376 * _6448;
                float _6454 = fma(_6446, _6446, _6450);
                float _6456 = sqrt(_6454);
                float _6458 = _6456 + 9.9999997473787516355514526367188e-06;
                float _6460 = 1.0 / _6458;
                float _6462 = _6452 * _6460;
                float _6464 = fma(_6440, _6462, _6366);
                float _6466 = fma(_6434, _6462, _6368);
                float _6468 = fma(_6446, _6462, _6370);
                _6470 = _6464;
                _6472 = 1065353216;
                _6474 = _6466;
                _6476 = _6468;
                _6478 = true;
            }
            else
            {
                bool _6480 = _6356 > 0.5;
                bool _6482 = _6258 > (-0.800000011920928955078125);
                bool _6484 = _6482 && _6480;
                bool _6486 = !_6484;
                int _6488 = _6486 ? 1065353216 : 1056964608;
                _6408 = _6484;
                _6470 = _6366;
                _6472 = _6488;
                _6474 = _6368;
                _6476 = _6370;
                _6478 = true;
            }
        }
        else
        {
            bool _6490 = _6324 > 0.0;
            bool _6492 = _6324 >= 0.0;
            bool _6494 = isnan(_6324);
            bool _6496 = _6492 || _6494;
            bool _6498 = isnan(0.0);
            bool _6500 = _6496 || _6498;
            int _6502 = _6500 ? 0 : 1;
            int _6504 = ~_6502;
            int _6506 = _6504 + 1;
            int _6508 = _6506 + 1;
            int _6510 = _6508;
            if (!_6490)
            {
                int _6512 = ~_6502;
                int _6514 = _6512 + 1;
                _6510 = _6514;
            }
            int _6516 = _6510;
            bool _6518 = _6356 >= 0.300000011920928955078125;
            bool _6520 = isnan(_6356);
            bool _6522 = _6518 || _6520;
            bool _6524 = isnan(0.300000011920928955078125);
            bool _6526 = _6522 || _6524;
            float _6528 = float(_6516);
            int _6530 = _6526 ? as_type<int>(_4152) : 1065353216;
            float _6532 = _6312 * _6528;
            float _6534 = _6310 * _6528;
            float _6536 = _6308 * _6528;
            float _6538 = _6532 * _6178;
            float _6540 = _6534 * _6182;
            float _6542 = _6536 * _6180;
            float _6544 = -_6538;
            float _6546 = fma(_6536, _6182, _6544);
            float _6548 = _6356 * 10.0;
            float _6550 = -_6540;
            float _6552 = fma(_6532, _6180, _6550);
            float _6554 = -_6542;
            float _6556 = fma(_6534, _6178, _6554);
            float _6558 = _6548 * _6546;
            float _6560 = _6548 * _6552;
            float _6562 = _6548 * _6556;
            _6408 = _6526;
            _6470 = _6558;
            _6472 = _6530;
            _6474 = _6560;
            _6476 = _6562;
        }
        _6478 = false;
        bool _6564 = _6408;
        float _6566 = _6470;
        int _6568 = _6472;
        float _6570 = _6474;
        float _6572 = _6476;
        bool _6574 = _6188 >= (-0.20000000298023223876953125);
        bool _6576 = isnan(_6188);
        bool _6578 = _6574 || _6576;
        bool _6580 = isnan(-0.20000000298023223876953125);
        bool _6582 = _6578 || _6580;
        float _6584 = _5716 * 0.20000000298023223876953125;
        int _6586 = int(_6564);
        int _6588 = _6252 ? 2 : 0;
        int _6590 = _6586 | _6588;
        int _6592 = _1696 ? 4 : 0;
        int _6594 = _6590 | _6592;
        int _6596 = _1454 ? 8 : 0;
        int _6598 = _6594 | _6596;
        int _6600 = _1780 ? 16 : 0;
        int _6602 = _6598 | _6600;
        int _6604 = _1866 ? 32 : 0;
        int _6606 = _6602 | _6604;
        int _6608 = _6582 ? 64 : 0;
        int _6610 = _6606 | _6608;
        int _6612 = _6610 & 4;
        float _6614 = _5734 * 0.20000000298023223876953125;
        float _6616 = _5726 * 0.20000000298023223876953125;
        int _6618 = _6564 ? (-1) : 0;
        _6062 = _6616;
        _6064 = _6584;
        _6620 = _6614;
        _6622 = 0.0;
        _6624 = 0.0;
        _6626 = 0.0;
        _6628 = _6570;
        _6630 = _6572;
        _6242 = _6582;
        if (_6582)
        {
            bool _6632 = _6258 > 2.0;
            _1706 = _6632 ? (-1) : 0;
        }
        int _6634 = _1706;
        if (!_6582)
        {
            _6618 = -1;
        }
        int _6636 = _6618;
        int _6638 = _6636;
        if (_6582)
        {
            bool _6640 = _6188 >= (-0.20000000298023223876953125);
            int _6642 = (_6640 ? (-1) : 0) & _6634;
            _6638 = _6642;
        }
        int _6644 = _6638;
        bool _6646 = _6612 != 0;
        int _6648 = ~_6644;
        bool _6650 = !_6252;
        int _6652 = _6648 & (_6650 ? (-1) : 0);
        bool _6654 = !_6252;
        int _6656 = _6644 & (_6654 ? (-1) : 0);
        int _6658 = _6652 | _6656;
        int _6660 = _6644 & (_6252 ? (-1) : 0);
        int _6662 = _6658 | _6660;
        int _6664 = ~_6662;
        float _6666 = (_6664 != 0) ? as_type<float>(_6568) : 0.0;
        _6668 = _6666;
        _1708 = _6646;
        _6670 = 0.0;
        _6672 = _6566;
        _6674 = true;
    }
    else
    {
        bool _6676 = _6258 < 0.0;
        bool _6678 = _6676 && _6252;
        bool _6680 = _6258 > (-0.800000011920928955078125);
        bool _6682 = _6680 && _6678;
        if (_6682)
        {
            float _6684 = _5000 * _6178;
            _2016 = _6684;
        }
        float _6686 = _2016;
        float _6688 = _6686;
        if (!_6682)
        {
            _6262 = 0.0;
        }
        float _6690 = _6262;
        float _6692 = _6690;
        if (!_6682)
        {
            _5722 = _6038;
        }
        float _6694 = _5722;
        float _6696 = _6694;
        if (_6682)
        {
            float _6698 = fma(_5002, _6180, _6686);
            _6688 = _6698;
        }
        float _6700 = _6688;
        float _6702 = _6700;
        if (!_6682)
        {
            _6238 = _6046;
        }
        float _6704 = _6238;
        float _6706 = _6704;
        if (!_6682)
        {
            _6240 = _6026;
        }
        float _6708 = _6240;
        float _6710 = _6708;
        if (_6682)
        {
            float _6712 = fma(_5004, _6182, _6700);
            _6702 = _6712;
        }
        float _6714 = _6702;
        float _6716 = _6714;
        if (!_6682)
        {
            _6060 = _6050;
        }
        float _6718 = _6060;
        float _6720 = _6718;
        if (!_6682)
        {
            _6264 = _4146;
        }
        float _6722 = _6264;
        float _6724 = _6722;
        if (_6682)
        {
            float _6726 = -_6180;
            float _6728 = fma(_6726, _6714, _5002);
            _5026 = _6728;
        }
        float _6730 = _5026;
        _6358 = _6730;
        if (_6682)
        {
            float _6732 = -_6178;
            float _6734 = fma(_6732, _6714, _5000);
            _5028 = _6734;
        }
        float _6736 = _5028;
        _6360 = _6736;
        if (_6682)
        {
            float _6738 = -_6182;
            float _6740 = fma(_6738, _6714, _5004);
            _5030 = _6740;
        }
        float _6742 = _5030;
        _6362 = _6742;
        if (!_6682)
        {
            _2018 = _4150;
        }
        float _6744 = _2018;
        float _6746 = _6744;
        if (!_6682)
        {
            _6716 = _4148;
        }
        float _6748 = _6716;
        float _6750 = _6748;
        if (!_6682)
        {
            _6266 = _4152;
        }
        float _6752 = _6266;
        _6668 = _6752;
        if (_6682)
        {
            _6692 = _6188;
        }
        float _6754 = _6692;
        _6670 = _6754;
        if (_6682)
        {
            _6696 = _6038;
        }
        float _6756 = _6696;
        _6620 = _6756;
        if (_6682)
        {
            _6706 = _6046;
        }
        float _6758 = _6706;
        _6622 = _6758;
        if (_6682)
        {
            _6710 = _6026;
        }
        float _6760 = _6710;
        _6624 = _6760;
        if (_6682)
        {
            _6720 = _6050;
        }
        float _6762 = _6720;
        _6626 = _6762;
        if (_6682)
        {
            _6724 = _4146;
        }
        float _6764 = _6724;
        _6672 = _6764;
        if (_6682)
        {
            _6746 = _4150;
        }
        float _6766 = _6746;
        _6628 = _6766;
        if (_6682)
        {
            _6750 = _4148;
        }
        float _6768 = _6750;
        _6630 = _6768;
        if (_6682)
        {
            _6668 = 0.5;
        }
    }
    _6674 = false;
    float _6770 = _6668;
    float _6772 = _6062;
    float _6774 = _6064;
    float _6776 = _6620;
    float _6778 = _6358;
    float _6780 = _6360;
    float _6782 = _6622;
    float _6784 = _6624;
    float _6786 = _6626;
    float _6788 = _6362;
    bool _6790 = _1708;
    float _6792 = _6670;
    float _6794 = _6628;
    float _6796 = _6672;
    float _6798 = _6630;
    bool _6800 = _6242;
    float _6802 = 1.0 / _6256;
    bool _6804 = _6770 >= 0.5;
    float _6806 = _6802 * _6772;
    float _6808 = _6802 * _6774;
    float _6810 = _6802 * _6776;
    float _6812 = _6806 * _6806;
    float _6814 = fma(_6808, _6808, _6812);
    float _6816 = fma(_6810, _6810, _6814);
    float _6818 = _2558 * _2558;
    float _6820 = _5992 * _5992;
    float _6822 = sqrt(_6816);
    float _6824 = fma(_6048, _6048, _6818);
    float _6826 = fma(_5992, _5992, _6818);
    float _6828 = fma(_6048, _6048, _6820);
    float _6830 = _6824 * 0.083333335816860198974609375;
    float _6832 = _6826 * 0.083333335816860198974609375;
    float _6834 = _6828 * 0.083333335816860198974609375;
    float _6836 = _4266 * _6830;
    float _6838 = _4430 * _6830;
    float _6840 = _4292 * _6830;
    float _6842 = _4406 * _6832;
    float _6844 = _4260 * _6832;
    float _6846 = _4284 * _6832;
    float _6848 = _4430 * _6838;
    bool _6850 = _6822 > 80.0;
    float _6852 = _4430 * _6836;
    float _6854 = _4430 * _6840;
    float _6856 = _4266 * _6836;
    float _6858 = _4266 * _6838;
    float _6860 = _4266 * _6840;
    float _6862 = fma(_4260, _6842, _6852);
    float _6864 = fma(_4260, _6844, _6848);
    float _6866 = fma(_4260, _6846, _6854);
    float _6868 = _4292 * _6836;
    float _6870 = _4292 * _6840;
    float _6872 = _4292 * _6838;
    float _6874 = fma(_4406, _6846, _6860);
    float _6876 = _4260;
    float _6878 = _6862;
    float _6880 = _6844;
    float _6882 = _6782;
    float _6884 = _6780;
    float _6886 = _6788;
    float _6888 = _6788;
    if (_6850)
    {
        float _6890 = rsqrt(_6816);
        _6876 = _6890;
    }
    float _6892 = _6876;
    float _6894 = fma(_4406, _6842, _6856);
    float _6896 = _4288 * _6834;
    float _6898 = fma(_4284, _6842, _6868);
    float _6900 = fma(_4284, _6846, _6870);
    float _6902 = _4404 * _6834;
    float _6904 = fma(_4406, _6844, _6858);
    float _6906 = _4296 * _6834;
    float _6908 = fma(_4284, _6844, _6872);
    float _6910 = fma(_4288, _6896, _6894);
    float _6912 = fma(_4296, _6896, _6862);
    float _6914 = fma(_4404, _6896, _6898);
    float _6916 = fma(_4296, _6902, _6866);
    float _6918 = fma(_4404, _6902, _6900);
    float _6920 = fma(_4404, _6906, _6908);
    float _6922 = fma(_4288, _6902, _6874);
    float _6924 = _6916 * _6914;
    float _6926 = _6912 * _6918;
    float _6928 = fma(_4296, _6906, _6864);
    float _6930 = _6906;
    float _6932 = _6912;
    float _6934 = _6910;
    float _6936 = _6914;
    if (_6850)
    {
        float _6938 = _6892 * 80.0;
        _6878 = _6938;
    }
    float _6940 = _6878;
    float _6942 = _6916 * _6920;
    float _6944 = fma(_4288, _6906, _6904);
    float _6946 = -_6924;
    float _6948 = _6926 + _6946;
    if (!_6850)
    {
        _6930 = _6808;
    }
    float _6950 = _6930;
    float _6952 = _6950;
    if (_6850)
    {
        float _6954 = _6808 * _6940;
        _6952 = _6954;
    }
    float _6956 = _6952;
    if (!_6850)
    {
        _6880 = _6806;
    }
    float _6958 = _6880;
    float _6960 = _6958;
    if (_6850)
    {
        float _6962 = _6806 * _6940;
        _6960 = _6962;
    }
    float _6964 = _6960;
    float _6966 = _6964;
    if (!_6850)
    {
        _4334 = _6810;
    }
    float _6968 = _4334;
    float _6970 = _6968;
    if (_6850)
    {
        float _6972 = _6810 * _6940;
        _6970 = _6972;
    }
    float _6974 = _6970;
    float _6976 = -_6942;
    float _6978 = fma(_6928, _6918, _6976);
    float _6980 = _6928 * _6914;
    float _6982 = _6944 * _6948;
    float _6984 = _6916 * _4150;
    float _6986 = _6912 * _4150;
    float _6988 = -_6980;
    float _6990 = fma(_6912, _6920, _6988);
    float _6992 = -_6982;
    float _6994 = fma(_6910, _6978, _6992);
    float _6996 = _6928 * _4150;
    float _6998 = fma(_6922, _4146, _6984);
    float _7000 = fma(_6910, _4146, _6986);
    float _7002 = fma(_6922, _6990, _6994);
    float _7004 = fma(_6944, _4146, _6996);
    float _7006 = fma(_6918, _4148, _6998);
    float _7008 = fma(_6914, _4148, _7000);
    float _7010 = _4154 * 0.01666666753590106964111328125;
    bool _7012 = _7002 != 0.0;
    bool _7014 = isnan(_7002);
    bool _7016 = _7012 || _7014;
    bool _7018 = isnan(0.0);
    bool _7020 = _7016 || _7018;
    float _7022 = fma(_6920, _4148, _7004);
    float _7024 = _7006 * _4150;
    float _7026 = _7008 * _4148;
    float _7028 = fma(_7010, _6956, _6778);
    float _7030 = _7022 * _4146;
    float _7032 = -_7024;
    float _7034 = fma(_7022, _4148, _7032);
    float _7036 = -_7026;
    float _7038 = fma(_7006, _4146, _7036);
    float _7040 = fma(_7010, _6964, _6780);
    float _7042 = -_7030;
    float _7044 = fma(_7008, _4150, _7042);
    float _7046 = _7034 + _6782;
    float _7048 = _7038 + _6784;
    float _7050 = _7030;
    float _7052 = _7028;
    float _7054 = _7040;
    float _7056 = _7028;
    float _7058 = _6974;
    if (!_7020)
    {
        _6966 = _6920;
    }
    float _7060 = _6966;
    float _7062 = _7060;
    if (!_7020)
    {
        _6882 = _6918;
    }
    float _7064 = _6882;
    float _7066 = _7064;
    if (!_7020)
    {
        _6884 = _6928;
    }
    float _7068 = _6884;
    float _7070 = _7068;
    if (!_7020)
    {
        _7050 = _6916;
    }
    float _7072 = _7050;
    float _7074 = _7072;
    if (!_7020)
    {
        _4170 = _6944;
    }
    float _7076 = _4170;
    float _7078 = _7076;
    if (!_7020)
    {
        _4172 = _6922;
    }
    float _7080 = _4172;
    bool _7082 = !_7020;
    float _7084 = _7080;
    if (!_7082)
    {
        float _7086 = 1.0 / _7002;
        float _7088 = _6910 * _6916;
        float _7090 = _6944 * _6918;
        float _7092 = _6922 * _6928;
        float _7094 = _6922 * _6914;
        float _7096 = -_7088;
        float _7098 = fma(_6922, _6912, _7096);
        float _7100 = _6910 * _6920;
        float _7102 = _6944 * _6912;
        float _7104 = -_7090;
        float _7106 = fma(_6922, _6920, _7104);
        float _7108 = -_6926;
        float _7110 = _7108 + _6924;
        float _7112 = -_7092;
        float _7114 = fma(_6944, _6916, _7112);
        float _7116 = -_7094;
        float _7118 = fma(_6910, _6918, _7116);
        float _7120 = -_7100;
        float _7122 = fma(_6944, _6914, _7120);
        float _7124 = -_7102;
        float _7126 = fma(_6910, _6928, _7124);
        float _7128 = _7106 * _7086;
        float _7130 = _7110 * _7086;
        float _7132 = _7114 * _7086;
        float _7134 = _7118 * _7086;
        float _7136 = _7098 * _7086;
        float _7138 = _6978 * _7086;
        float _7140 = _6990 * _7086;
        float _7142 = _7122 * _7086;
        float _7144 = _7126 * _7086;
        _6932 = _7130;
        _7070 = _7134;
        _7074 = _7136;
        _6934 = _7138;
        _7078 = _7128;
        _7084 = _7132;
        _7062 = _7142;
        _6936 = _7140;
        _7066 = _7144;
    }
    float _7146 = _6932;
    float _7148 = _7070;
    float _7150 = _7074;
    float _7152 = _6934;
    float _7154 = _7078;
    float _7156 = _7084;
    float _7158 = _7062;
    float _7160 = _6936;
    float _7162 = _7066;
    float _7164 = _7048 * _7146;
    float _7166 = _7048 * _7148;
    float _7168 = _7048 * _7150;
    float _7170 = _7044 + _6786;
    float _7172 = fma(_7046, _7152, _7164);
    float _7174 = fma(_7046, _7154, _7166);
    float _7176 = fma(_7046, _7156, _7168);
    float _7178 = fma(_7010, _6974, _6788);
    float _7180 = fma(_7170, _7158, _7174);
    float _7182 = fma(_7170, _7160, _7172);
    float _7184 = fma(_7170, _7162, _7176);
    float _7186 = _7166;
    float _7188 = _7178;
    float _7190 = _7168;
    float _7192 = _7148;
    float _7194 = _7178;
    float _7196 = _7180;
    float _7198 = _7182;
    float _7200 = _7184;
    if (!_6804)
    {
        _7186 = _7040;
    }
    float _7202 = _7186;
    bool _7204 = !_6804;
    float _7206 = _7202;
    if (!_7204)
    {
        float _7208 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[64]);
        float _7210 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[65]);
        float _7212 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[66]);
        float _7214 = _7040 * _7040;
        float _7216 = fma(_7028, _7028, _7214);
        float _7218 = fma(_7178, _7178, _7216);
        float _7220 = sqrt(_7218);
        float _7222 = _7220 + 9.9999997473787516355514526367188e-06;
        float _7224 = 1.0 / _7222;
        float _7226 = _7028 * _7224;
        float _7228 = _7040 * _7224;
        float _7230 = _7208;
        _7058 = _7226;
        if (_6790)
        {
            float _7232 = _7210 * _4682;
            _4744 = _7232;
        }
        float _7234 = _4744;
        float _7236 = _7234;
        if (_6790)
        {
            float _7238 = _7210 * _4706;
            _4760 = _7238;
        }
        float _7240 = _4760;
        float _7242 = _7240;
        if (_6790)
        {
            float _7244 = _7210 * _4730;
            _4784 = _7244;
        }
        float _7246 = _4784;
        float _7248 = _7178 * _7224;
        float _7250 = _7246;
        if (_6790)
        {
            float _7252 = fma(_7208, _4680, _7234);
            _7236 = _7252;
        }
        float _7254 = _7236;
        if (_6790)
        {
            float _7256 = fma(_7208, _4704, _7240);
            _7242 = _7256;
        }
        float _7258 = _7242;
        if (_6790)
        {
            float _7260 = fma(_7208, _4728, _7246);
            _7250 = _7260;
        }
        float _7262 = _7250;
        float _7264 = _7262;
        if (_6790)
        {
            float _7266 = fma(_7212, _4684, _7254);
            _4746 = _7266;
        }
        float _7268 = _4746;
        float _7270 = _7268;
        float _7272 = _7268;
        if (_6790)
        {
            float _7274 = fma(_7212, _4708, _7258);
            _4762 = _7274;
        }
        float _7276 = _4762;
        float _7278 = _7276;
        float _7280 = _7276;
        if (_6790)
        {
            float _7282 = fma(_7212, _4732, _7262);
            _4786 = _7282;
        }
        float _7284 = _4786;
        float _7286 = _7284;
        float _7288 = _7284;
        if (!_6790)
        {
            bool _7290 = !_1780;
            if (!_7290)
            {
                uint _7292 = uint(int(uint(_180) >> uint(2)));
                float _7294 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_7292)]);
                int _7296 = _180 + 4;
                uint _7298 = uint(int(uint(_7296) >> uint(2)));
                float _7300 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_7298)]);
                int _7302 = _180 + 8;
                uint _7304 = uint(int(uint(_7302) >> uint(2)));
                float _7306 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_7304)]);
                uint _7308 = uint(int(uint(_180) >> uint(2)));
                float _7310 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_7308)]);
                int _7312 = _180 + 4;
                uint _7314 = uint(int(uint(_7312) >> uint(2)));
                float _7316 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_7314)]);
                int _7318 = _180 + 8;
                uint _7320 = uint(int(uint(_7318) >> uint(2)));
                float _7322 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_7320)]);
                uint _7324 = uint(int(uint(_180) >> uint(2)));
                float _7326 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_7324)]);
                int _7328 = _180 + 4;
                uint _7330 = uint(int(uint(_7328) >> uint(2)));
                float _7332 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_7330)]);
                int _7334 = _180 + 8;
                uint _7336 = uint(int(uint(_7334) >> uint(2)));
                float _7338 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_7336)]);
                int _7340 = _180 + 12;
                uint _7342 = uint(int(uint(_7340) >> uint(2)));
                float _7344 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_7342)]);
                float _7346 = _7300 * _7210;
                float _7348 = _7316 * _7210;
                float _7350 = _7332 * _7210;
                float _7352 = fma(_7294, _7208, _7346);
                float _7354 = fma(_7310, _7208, _7348);
                float _7356 = fma(_7326, _7208, _7350);
                float _7358 = fma(_7306, _7212, _7352);
                float _7360 = fma(_7322, _7212, _7354);
                float _7362 = fma(_7338, _7212, _7356);
                _7280 = _7360;
                _7272 = _7358;
                _7288 = _7362;
                _7264 = _7356;
                _6886 = _7344;
                _7364 = true;
            }
            else
            {
                if (!_1866)
                {
                    _7270 = _7208;
                }
                float _7366 = _7270;
                _7272 = _7366;
                if (!_1866)
                {
                    _7278 = _7210;
                }
                float _7368 = _7278;
                _7280 = _7368;
                if (!_1866)
                {
                    _7286 = _7212;
                }
                float _7370 = _7286;
                bool _7372 = !_1866;
                _7288 = _7370;
                if (!_7372)
                {
                    uint _7374 = uint(int(uint(_180) >> uint(2)));
                    float _7376 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_7374)]);
                    int _7378 = _180 + 4;
                    uint _7380 = uint(int(uint(_7378) >> uint(2)));
                    float _7382 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_7380)]);
                    int _7384 = _180 + 8;
                    uint _7386 = uint(int(uint(_7384) >> uint(2)));
                    float _7388 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_7386)]);
                    uint _7390 = uint(int(uint(_180) >> uint(2)));
                    float _7392 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_7390)]);
                    int _7394 = _180 + 4;
                    uint _7396 = uint(int(uint(_7394) >> uint(2)));
                    float _7398 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_7396)]);
                    int _7400 = _180 + 8;
                    uint _7402 = uint(int(uint(_7400) >> uint(2)));
                    float _7404 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_7402)]);
                    uint _7406 = uint(int(uint(_180) >> uint(2)));
                    float _7408 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_7406)]);
                    int _7410 = _180 + 4;
                    uint _7412 = uint(int(uint(_7410) >> uint(2)));
                    float _7414 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_7412)]);
                    int _7416 = _180 + 8;
                    uint _7418 = uint(int(uint(_7416) >> uint(2)));
                    float _7420 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_7418)]);
                    int _7422 = _180 + 12;
                    uint _7424 = uint(int(uint(_7422) >> uint(2)));
                    float _7426 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_7424)]);
                    float _7428 = _7382 * _7210;
                    float _7430 = _7398 * _7210;
                    float _7432 = _7414 * _7210;
                    float _7434 = fma(_7376, _7208, _7428);
                    float _7436 = fma(_7392, _7208, _7430);
                    float _7438 = fma(_7408, _7208, _7432);
                    float _7440 = fma(_7388, _7212, _7434);
                    float _7442 = fma(_7404, _7212, _7436);
                    float _7444 = fma(_7420, _7212, _7438);
                    _7280 = _7442;
                    _7272 = _7440;
                    _7288 = _7444;
                    _7264 = _7438;
                    _6886 = _7426;
                }
            }
        }
        _7364 = false;
        float _7446 = _7280;
        float _7448 = _7272;
        float _7450 = _7288;
        float _7452 = _7264;
        float _7454 = _6886;
        float _7456 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[67]);
        float _7458 = _7456 * 59.999996185302734375;
        float _7460 = _7446 * _7458;
        float _7462 = _7448 * _7458;
        float _7464 = _4154 * _7460;
        float _7466 = _7450 * _7458;
        float _7468 = _4154 * _7462;
        float _7470 = _7464 * _6178;
        float _7472 = _4154 * _7466;
        float _7474 = fma(_7468, _6180, _7470);
        float _7476 = fma(_7472, _6182, _7474);
        float _7478 = -_6178;
        float _7480 = fma(_7476, _7478, _7464);
        float _7482 = -_6180;
        float _7484 = fma(_7476, _7482, _7468);
        float _7486 = -_6182;
        float _7488 = fma(_7476, _7486, _7472);
        float _7490 = _7480 * _7480;
        float _7492 = fma(_7484, _7484, _7490);
        float _7494 = fma(_7488, _7488, _7492);
        float _7496 = sqrt(_7494);
        float _7498 = _7496 + 9.9999997473787516355514526367188e-06;
        float _7500 = 1.0 / _7498;
        float _7502 = _7480 * _7500;
        float _7504 = _7484 * _7500;
        float _7506 = _7488 * _7500;
        float _7508 = _7040 * _7502;
        float _7510 = fma(_7028, _7504, _7508);
        float _7512 = fma(_7178, _7506, _7510);
        float _7514 = _7512 * 0.5;
        bool _7516 = _7512 >= 0.0;
        float _7518 = float(_7516);
        float _7520 = precise::min(_7496, _7514);
        float _7522 = _7520 * _7518;
        float _7524 = -_7522;
        float _7526 = fma(_7502, _7524, _7040);
        float _7528 = -_7522;
        float _7530 = fma(_7504, _7528, _7028);
        float _7532 = -_7522;
        float _7534 = fma(_7506, _7532, _7178);
        float _7536 = _7526 * _7526;
        float _7538 = fma(_7530, _7530, _7536);
        float _7540 = fma(_7534, _7534, _7538);
        float _7542 = sqrt(_7540);
        bool _7544 = _7542 > 0.5;
        bool _7546 = isnan(_7542);
        bool _7548 = _7544 || _7546;
        bool _7550 = isnan(0.5);
        bool _7552 = _7548 || _7550;
        float _7554 = _7506;
        float _7556 = _7500;
        _4750 = _7530;
        _7190 = _7534;
        _4764 = _7504;
        _4766 = _7502;
        _4768 = _7526;
        _7192 = _7458;
        _4788 = _7522;
        _4790 = _7452;
        _4792 = _7450;
        _6888 = _7454;
        _7054 = _7542;
        if (!_7552)
        {
            float _7558 = _1692 * 20.0;
            _7052 = _7558;
        }
        float _7560 = _7052;
        float _7562 = _7560;
        if (_7552)
        {
            float _7564 = _1692 * 10.0;
            _2020 = _7564;
        }
        float _7566 = _2020;
        float _7568 = _7566;
        if (!_7552)
        {
            float _7570 = _4154 * _7560;
            _7562 = _7570;
        }
        float _7572 = _7562;
        float _7574 = _7572;
        if (_7552)
        {
            float _7576 = _4154 * _7566;
            _7568 = _7576;
        }
        float _7578 = _7568;
        float _7580 = _7578;
        if (!_7552)
        {
            float _7582 = _7572 * 0.01666666753590106964111328125;
            _7574 = _7582;
        }
        float _7584 = _7574;
        float _7586 = _7584;
        if (_7552)
        {
            float _7588 = _7578 * 0.01666666753590106964111328125;
            _7580 = _7588;
        }
        float _7590 = _7580;
        _2022 = _7590;
        if (!_7552)
        {
            float _7592 = precise::min(_7542, _7584);
            _7554 = _7592;
        }
        float _7594 = _7554;
        _4748 = _7594;
        if (_7552)
        {
            float _7596 = precise::min(_7542, _7590);
            _7556 = _7596;
        }
        float _7598 = _7556;
        if (!_7552)
        {
            float _7600 = -_7226;
            float _7602 = fma(_7600, _7594, _7530);
            _7586 = _7602;
        }
        float _7604 = _7586;
        float _7606 = _7604;
        if (!_7552)
        {
            float _7608 = -_7228;
            float _7610 = fma(_7608, _7594, _7526);
            _7230 = _7610;
        }
        float _7612 = _7230;
        float _7614 = _7612;
        if (!_7552)
        {
            float _7616 = -_7248;
            float _7618 = fma(_7616, _7594, _7534);
            _7188 = _7618;
        }
        float _7620 = _7188;
        _7194 = _7620;
        if (_7552)
        {
            float _7622 = -_7226;
            float _7624 = fma(_7622, _7598, _7530);
            _7606 = _7624;
        }
        float _7626 = _7606;
        _7056 = _7626;
        if (_7552)
        {
            float _7628 = -_7228;
            float _7630 = fma(_7628, _7598, _7526);
            _7614 = _7630;
        }
        float _7632 = _7614;
        _7206 = _7632;
        if (_7552)
        {
            float _7634 = -_7248;
            float _7636 = fma(_7634, _7598, _7534);
            _7194 = _7636;
        }
    }
    float _7638 = _4748;
    float _7640 = _4750;
    float _7642 = _7190;
    float _7644 = _4764;
    float _7646 = _4766;
    float _7648 = _4768;
    float _7650 = _7192;
    float _7652 = _4788;
    float _7654 = _4790;
    float _7656 = _4792;
    float _7658 = _6888;
    float _7660 = _7054;
    float _7662 = _7056;
    float _7664 = _7206;
    float _7666 = _7194;
    float _7668 = _2022;
    float _7670 = _7058;
    bool _7672 = !_6790;
    float _7674 = _7638;
    float _7676 = _7668;
    float _7678 = _7660;
    float _7680 = _7652;
    float _7682 = _7654;
    float _7684 = _7656;
    float _7686 = _7658;
    float _7688 = _7640;
    float _7690 = _7642;
    float _7692 = _7644;
    float _7694 = _7646;
    float _7696 = _7648;
    float _7698 = _7650;
    float _7700 = _7670;
    float _7780;
    float _7782;
    float _7784;
    if (!_7672)
    {
        float _7702 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _7704 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _7706 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _7708 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        float _7710 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _7712 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _7714 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _7716 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        float _7718 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _7720 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _7722 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _7724 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        float _7726 = _7706 * _7710;
        float _7728 = _7706 * _7712;
        float _7730 = -_7726;
        float _7732 = fma(_7702, _7714, _7730);
        float _7734 = -_7728;
        float _7736 = fma(_7704, _7714, _7734);
        float _7738 = _7704 * _7710;
        float _7740 = _7722 * _7710;
        float _7742 = _7720 * _7732;
        float _7744 = _7718 * _7712;
        float _7746 = -_7738;
        float _7748 = fma(_7702, _7712, _7746);
        float _7750 = -_7740;
        float _7752 = fma(_7718, _7714, _7750);
        float _7754 = -_7742;
        float _7756 = fma(_7718, _7736, _7754);
        float _7758 = -_7744;
        float _7760 = fma(_7720, _7710, _7758);
        float _7762 = fma(_7722, _7748, _7756);
        float _7764 = _7720 * _7714;
        float _7766 = -_7764;
        float _7768 = fma(_7722, _7712, _7766);
        float _7770 = 1.0 / _7762;
        float _7772 = _7770 * _6792;
        float _7774 = _7768 * _7772;
        float _7776 = _7752 * _7772;
        float _7778 = _7760 * _7772;
        _7780 = _7778;
        _7782 = _7774;
        _7680 = _7718;
        _7682 = _7720;
        _7684 = _7722;
        _7686 = _7724;
        _7688 = _7738;
        _7690 = _7708;
        _7692 = _7710;
        _7694 = _7712;
        _7696 = _7714;
        _7698 = _7716;
        _7784 = _7776;
        _7700 = _7770;
        _7786 = true;
    }
    else
    {
        bool _7788 = _1778 != 0;
        bool _7790 = _1864 != 0;
        bool _7792 = _7790 || _7788;
        if (!_7792)
        {
            _7674 = 0.0;
        }
        float _7794 = _7674;
        _7782 = _7794;
        if (!_7792)
        {
            _7676 = _6792;
        }
        float _7796 = _7676;
        _7784 = _7796;
        if (!_7792)
        {
            _7678 = 0.0;
        }
        float _7798 = _7678;
        bool _7800 = !_7792;
        _7780 = _7798;
        if (!_7800)
        {
            uint _7802 = uint(int(uint(_180) >> uint(2)));
            float _7804 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_7802)]);
            int _7806 = _180 + 4;
            uint _7808 = uint(int(uint(_7806) >> uint(2)));
            float _7810 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_7808)]);
            int _7812 = _180 + 8;
            uint _7814 = uint(int(uint(_7812) >> uint(2)));
            float _7816 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_7814)]);
            int _7818 = _180 + 12;
            uint _7820 = uint(int(uint(_7818) >> uint(2)));
            float _7822 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_7820)]);
            uint _7824 = uint(int(uint(_180) >> uint(2)));
            float _7826 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_7824)]);
            int _7828 = _180 + 4;
            uint _7830 = uint(int(uint(_7828) >> uint(2)));
            float _7832 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_7830)]);
            int _7834 = _180 + 8;
            uint _7836 = uint(int(uint(_7834) >> uint(2)));
            float _7838 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_7836)]);
            int _7840 = _180 + 12;
            uint _7842 = uint(int(uint(_7840) >> uint(2)));
            float _7844 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_7842)]);
            uint _7846 = uint(int(uint(_180) >> uint(2)));
            float _7848 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_7846)]);
            int _7850 = _180 + 4;
            uint _7852 = uint(int(uint(_7850) >> uint(2)));
            float _7854 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_7852)]);
            int _7856 = _180 + 8;
            uint _7858 = uint(int(uint(_7856) >> uint(2)));
            float _7860 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_7858)]);
            int _7862 = _180 + 12;
            uint _7864 = uint(int(uint(_7862) >> uint(2)));
            float _7866 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_7864)]);
            float _7868 = _7816 * _7826;
            float _7870 = _7816 * _7832;
            float _7872 = -_7868;
            float _7874 = fma(_7804, _7838, _7872);
            float _7876 = -_7870;
            float _7878 = fma(_7810, _7838, _7876);
            float _7880 = _7810 * _7826;
            float _7882 = _7854 * _7874;
            float _7884 = -_7880;
            float _7886 = fma(_7804, _7832, _7884);
            float _7888 = _7848 * _7832;
            float _7890 = -_7882;
            float _7892 = fma(_7848, _7878, _7890);
            float _7894 = _7860 * _7826;
            float _7896 = fma(_7860, _7886, _7892);
            float _7898 = _7854 * _7838;
            float _7900 = -_7894;
            float _7902 = fma(_7848, _7838, _7900);
            float _7904 = -_7888;
            float _7906 = fma(_7854, _7826, _7904);
            float _7908 = -_7898;
            float _7910 = fma(_7860, _7832, _7908);
            float _7912 = 1.0 / _7896;
            float _7914 = _7912 * _6792;
            float _7916 = _7910 * _7914;
            float _7918 = _7902 * _7914;
            float _7920 = _7906 * _7914;
            _7780 = _7920;
            _7782 = _7916;
            _7680 = _7848;
            _7682 = _7906;
            _7684 = _7860;
            _7686 = _7866;
            _7688 = _7912;
            _7690 = _7822;
            _7692 = _7826;
            _7694 = _7832;
            _7696 = _7838;
            _7698 = _7844;
            _7784 = _7918;
            _7700 = _7902;
        }
    }
    _7786 = false;
    float _7922 = _7780;
    float _7924 = _7782;
    float _7926 = _7680;
    float _7928 = _7682;
    float _7930 = _7684;
    float _7932 = _7686;
    float _7934 = _7688;
    float _7936 = _7690;
    float _7938 = _7692;
    float _7940 = _7694;
    float _7942 = _7696;
    float _7944 = _7698;
    float _7946 = _7784;
    float _7948 = _7700;
    float _7950 = _4306 + _7922;
    float _7952 = _4308 + _7924;
    float _7954 = _7662 * 0.01666666753590106964111328125;
    float _7956 = _7664 * 0.01666666753590106964111328125;
    float _7958 = _7666 * 0.01666666753590106964111328125;
    bool _7960 = !_6790;
    float _7962 = _7934;
    float _7964 = _7936;
    float _7966 = _7938;
    float _7968 = _7940;
    float _7970 = _7942;
    float _7972 = _7944;
    float _7974 = _7926;
    float _7976 = _7928;
    float _7978 = _7930;
    float _7980 = _7932;
    float _7982 = _7948;
    float _7984 = _7958;
    float _7986 = _7946;
    float _8110;
    float _8112;
    if (!_7960)
    {
        float _7988 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _7990 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _7992 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _7994 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        float _7996 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _7998 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _8000 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _8002 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _8004 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _8006 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _8008 = _7992 * _7996;
        float _8010 = _7992 * _7998;
        float _8012 = _7990 * _7996;
        float _8014 = -_8008;
        float _8016 = fma(_7988, _8000, _8014);
        float _8018 = -_8010;
        float _8020 = fma(_7990, _8000, _8018);
        float _8022 = -_8012;
        float _8024 = fma(_7988, _7998, _8022);
        float _8026 = _8004 * _8000;
        float _8028 = _8004 * _8016;
        float _8030 = _8006 * _7996;
        float _8032 = _8006 * _7990;
        float _8034 = _8002 * _7998;
        float _8036 = -_8028;
        float _8038 = fma(_8002, _8020, _8036);
        float _8040 = -_8026;
        float _8042 = fma(_8006, _7998, _8040);
        float _8044 = -_8032;
        float _8046 = fma(_8004, _7992, _8044);
        float _8048 = -_8034;
        float _8050 = fma(_8004, _7996, _8048);
        float _8052 = fma(_8006, _8024, _8038);
        float _8054 = _8004 * _7988;
        float _8056 = 1.0 / _8052;
        float _8058 = -_8054;
        float _8060 = fma(_8002, _7990, _8058);
        float _8062 = _8002 * _7992;
        float _8064 = -_8030;
        float _8066 = fma(_8002, _8000, _8064);
        float _8068 = -_7988;
        float _8070 = fma(_8068, _8000, _8008);
        float _8072 = -_8062;
        float _8074 = fma(_8006, _7988, _8072);
        float _8076 = _8042 * _8056;
        float _8078 = _8066 * _8056;
        float _8080 = _8050 * _8056;
        float _8082 = _7954 * _8056;
        float _8084 = _7956 * _8076;
        float _8086 = _7956 * _8078;
        float _8088 = _8070 * _8056;
        float _8090 = _7956 * _8080;
        float _8092 = _8046 * _8056;
        float _8094 = fma(_8020, _8082, _8084);
        float _8096 = _8074 * _8056;
        float _8098 = fma(_7954, _8088, _8086);
        float _8100 = _8060 * _8056;
        float _8102 = fma(_8024, _8082, _8090);
        float _8104 = fma(_7958, _8092, _8094);
        float _8106 = fma(_7958, _8096, _8098);
        float _8108 = fma(_7958, _8100, _8102);
        _7962 = _7998;
        _7964 = _8008;
        _7966 = _8082;
        _7968 = _8004;
        _7970 = _8096;
        _7972 = _8056;
        _7974 = _7988;
        _7976 = _8060;
        _7978 = _7992;
        _7980 = _7994;
        _7982 = _8098;
        _8110 = _8104;
        _8112 = _8106;
        _7984 = _8108;
        _8114 = true;
    }
    else
    {
        bool _8116 = _1778 != 0;
        bool _8118 = _1864 != 0;
        bool _8120 = _8118 || _8116;
        if (!_8120)
        {
            _1928 = _7954;
        }
        float _8122 = _1928;
        _8110 = _8122;
        if (!_8120)
        {
            _1842 = _7956;
        }
        float _8124 = _1842;
        bool _8126 = !_8120;
        _8112 = _8124;
        if (!_8126)
        {
            uint _8128 = uint(int(uint(_180) >> uint(2)));
            float _8130 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_8128)]);
            int _8132 = _180 + 4;
            uint _8134 = uint(int(uint(_8132) >> uint(2)));
            float _8136 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_8134)]);
            int _8138 = _180 + 8;
            uint _8140 = uint(int(uint(_8138) >> uint(2)));
            float _8142 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_8140)]);
            uint _8144 = uint(int(uint(_180) >> uint(2)));
            float _8146 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_8144)]);
            int _8148 = _180 + 4;
            uint _8150 = uint(int(uint(_8148) >> uint(2)));
            float _8152 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_8150)]);
            int _8154 = _180 + 8;
            uint _8156 = uint(int(uint(_8154) >> uint(2)));
            float _8158 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_8156)]);
            uint _8160 = uint(int(uint(_180) >> uint(2)));
            float _8162 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_8160)]);
            int _8164 = _180 + 4;
            uint _8166 = uint(int(uint(_8164) >> uint(2)));
            float _8168 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_8166)]);
            int _8170 = _180 + 8;
            uint _8172 = uint(int(uint(_8170) >> uint(2)));
            float _8174 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_8172)]);
            int _8176 = _180 + 12;
            uint _8178 = uint(int(uint(_8176) >> uint(2)));
            float _8180 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_8178)]);
            float _8182 = _8142 * _8146;
            float _8184 = _8142 * _8152;
            float _8186 = _8136 * _8146;
            float _8188 = -_8182;
            float _8190 = fma(_8130, _8158, _8188);
            float _8192 = -_8184;
            float _8194 = fma(_8136, _8158, _8192);
            float _8196 = -_8186;
            float _8198 = fma(_8130, _8152, _8196);
            float _8200 = _8168 * _8130;
            float _8202 = _8168 * _8190;
            float _8204 = _8174 * _8136;
            float _8206 = _8162 * _8152;
            float _8208 = -_8200;
            float _8210 = fma(_8162, _8136, _8208);
            float _8212 = -_8202;
            float _8214 = fma(_8162, _8194, _8212);
            float _8216 = _8174 * _8146;
            float _8218 = _8168 * _8158;
            float _8220 = _8162 * _8142;
            float _8222 = fma(_8174, _8198, _8214);
            float _8224 = -_8216;
            float _8226 = fma(_8162, _8158, _8224);
            float _8228 = -_8204;
            float _8230 = fma(_8168, _8142, _8228);
            float _8232 = -_8218;
            float _8234 = fma(_8174, _8152, _8232);
            float _8236 = 1.0 / _8222;
            float _8238 = -_8206;
            float _8240 = fma(_8168, _8146, _8238);
            float _8242 = -_8220;
            float _8244 = fma(_8174, _8130, _8242);
            float _8246 = -_8130;
            float _8248 = fma(_8246, _8158, _8182);
            float _8250 = _8226 * _8236;
            float _8252 = _8234 * _8236;
            float _8254 = _8240 * _8236;
            float _8256 = _8248 * _8236;
            float _8258 = _8250 * _7956;
            float _8260 = _8230 * _8236;
            float _8262 = _8252 * _7956;
            float _8264 = _7954 * _8236;
            float _8266 = _8254 * _7956;
            float _8268 = _8244 * _8236;
            float _8270 = fma(_8256, _7954, _8258);
            float _8272 = fma(_8194, _8264, _8262);
            float _8274 = _8210 * _8236;
            float _8276 = fma(_8198, _8264, _8266);
            float _8278 = fma(_8260, _7958, _8272);
            float _8280 = fma(_8268, _7958, _8270);
            float _8282 = fma(_8274, _7958, _8276);
            _7962 = _8260;
            _7964 = _8268;
            _7966 = _8146;
            _7968 = _8152;
            _7970 = _8158;
            _7972 = _8220;
            _7974 = _8226;
            _7976 = _8168;
            _7978 = _8244;
            _7980 = _8180;
            _7982 = _8194;
            _8110 = _8278;
            _8112 = _8280;
            _7984 = _8282;
        }
    }
    _8114 = false;
    float _8284 = _7962;
    float _8286 = _7964;
    float _8288 = _7966;
    float _8290 = _7968;
    float _8292 = _7970;
    float _8294 = _7972;
    float _8296 = _7974;
    float _8298 = _7976;
    float _8300 = _7978;
    float _8302 = _7980;
    float _8304 = _7982;
    float _8306 = _8110;
    float _8308 = _8112;
    float _8310 = _7984;
    float _8312 = _7180 * _7180;
    float _8314 = _4154 * (-0.0291463173925876617431640625);
    float _8316 = fma(_7182, _7182, _8312);
    float _8318 = exp2(_8314);
    float _8320 = fma(_7184, _7184, _8316);
    float _8322 = sqrt(_8320);
    float _8324 = _8322 * 0.01666666753590106964111328125;
    bool _8326 = _8324 > 1.57079637050628662109375;
    float _8328 = _8324;
    if (_8326)
    {
        float _8330 = rsqrt(_8320);
        _8328 = _8330;
    }
    float _8332 = _8328;
    float _8334 = _8332;
    if (_8326)
    {
        float _8336 = _8332 * 94.24777984619140625;
        _8334 = _8336;
    }
    float _8338 = _8334;
    if (_8326)
    {
        float _8340 = _7180 * _8338;
        _7196 = _8340;
    }
    float _8342 = _7196;
    if (_8326)
    {
        float _8344 = _7182 * _8338;
        _7198 = _8344;
    }
    float _8346 = _7198;
    if (_8326)
    {
        float _8348 = _7184 * _8338;
        _7200 = _8348;
    }
    float _8350 = _7200;
    float _8352 = fma(_7010, _8342, _6794);
    float _8354 = fma(_7010, _8346, _6796);
    float _8356 = fma(_7010, _8350, _6798);
    float _8358 = _8352 * _8318;
    float _8360 = _8354 * _8318;
    float _8362 = _8356 * _8318;
    float _8364 = _8358 * _8358;
    float _8366 = fma(_8360, _8360, _8364);
    float _8368 = fma(_8362, _8362, _8366);
    float _8370 = sqrt(_8368);
    bool _8372 = _8370 > 31.4159259796142578125;
    float _8374 = _8370;
    float _8376 = _8358;
    float _8378 = _8360;
    float _8380 = _8362;
    if (_8372)
    {
        float _8382 = rsqrt(_8368);
        _8374 = _8382;
    }
    float _8384 = _8374;
    float _8386 = _8384;
    if (_8372)
    {
        float _8388 = _8384 * 31.4159259796142578125;
        _8386 = _8388;
    }
    float _8390 = _8386;
    if (_8372)
    {
        float _8392 = _8358 * _8390;
        _8376 = _8392;
    }
    float _8394 = _8376;
    if (_8372)
    {
        float _8396 = _8360 * _8390;
        _8378 = _8396;
    }
    float _8398 = _8378;
    if (_8372)
    {
        float _8400 = _8362 * _8390;
        _8380 = _8400;
    }
    float _8402 = _8380;
    float _8404 = _7010 * _8394;
    float _8406 = _7010 * _8398;
    float _8408 = _7010 * _8402;
    float _8410 = _8404 * _8404;
    float _8412 = fma(_8406, _8406, _8410);
    float _8414 = fma(_8408, _8408, _8412);
    float _8416 = sqrt(_8414);
    float _8418 = rsqrt(_8414);
    float _8420 = _8416 * 0.5;
    bool _8422 = _8416 != 0.0;
    bool _8424 = isnan(_8416);
    bool _8426 = _8422 || _8424;
    bool _8428 = isnan(0.0);
    bool _8430 = _8426 || _8428;
    float _8432 = _8420 * 0.15915493667125701904296875;
    float _8434 = _8432 * 6.283185482025146484375;
    float _8436 = sin(_8434);
    float _8438 = _8408 * _8418;
    float _8440 = _8404 * _8418;
    float _8442 = _8406 * _8418;
    float _8444 = _8430 ? _8438 : 0.0;
    float _8446 = _8432 * 6.283185482025146484375;
    float _8448 = cos(_8446);
    float _8450 = _8430 ? _8440 : 0.0;
    float _8452 = _8430 ? _8442 : 0.0;
    float _8454 = _8444 * _8436;
    float _8456 = _8450 * _8436;
    float _8458 = _8452 * _8436;
    float _8460 = _8454 * _4136;
    float _8462 = _8456 * _4124;
    float _8464 = _8456 * _4130;
    float _8466 = _8456 * _4136;
    float _8468 = -_8460;
    float _8470 = fma(_8456, _4132, _8468);
    float _8472 = fma(_8448, _4136, _8462);
    float _8474 = -_8464;
    float _8476 = fma(_8458, _4136, _8474);
    float _8478 = _8458 * _4124;
    float _8480 = _8458 * _4132;
    float _8482 = _8454 * _4124;
    float _8484 = fma(_8458, _4130, _8466);
    float _8486 = fma(_8448, _4130, _8478);
    float _8488 = -_8480;
    float _8490 = fma(_8454, _4130, _8488);
    float _8492 = fma(_8448, _4132, _8482);
    float _8494 = fma(_8454, _4132, _8484);
    float _8496 = _8486 + _8470;
    float _8498 = _8472 + _8490;
    float _8500 = _8492 + _8476;
    float _8502 = -_8494;
    float _8504 = fma(_8448, _4124, _8502);
    uint _8506 = uint(int(uint(_1662) >> uint(2)));
    (*spvDescriptorSet0.cp_s14)._m0[int(_8506)] = as_type<uint>(_8496);
    int _8508 = _1662 + 4;
    uint _8510 = uint(int(uint(_8508) >> uint(2)));
    (*spvDescriptorSet0.cp_s14)._m0[int(_8510)] = as_type<uint>(_8498);
    int _8512 = _1662 + 8;
    uint _8514 = uint(int(uint(_8512) >> uint(2)));
    (*spvDescriptorSet0.cp_s14)._m0[int(_8514)] = as_type<uint>(_8500);
    int _8516 = _1662 + 12;
    uint _8518 = uint(int(uint(_8516) >> uint(2)));
    (*spvDescriptorSet0.cp_s14)._m0[int(_8518)] = as_type<uint>(_8504);
    uint _8520 = uint(int(uint(_1782) >> uint(2)));
    (*spvDescriptorSet0.cp_s14)._m0[int(_8520)] = as_type<uint>(_8398);
    int _8522 = _1782 + 4;
    uint _8524 = uint(int(uint(_8522) >> uint(2)));
    (*spvDescriptorSet0.cp_s14)._m0[int(_8524)] = as_type<uint>(_8394);
    int _8526 = _1782 + 8;
    uint _8528 = uint(int(uint(_8526) >> uint(2)));
    (*spvDescriptorSet0.cp_s14)._m0[int(_8528)] = as_type<uint>(_8402);
    int _8530 = _1782 + 12;
    uint _8532 = uint(int(uint(_8530) >> uint(2)));
    (*spvDescriptorSet0.cp_s14)._m0[int(_8532)] = as_type<uint>(_6770);
    float _8534 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[30]);
    float _8536 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[71]);
    int _8538 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 48;
    uint _8540 = uint(int(uint(_8538) >> uint(2)));
    float _8542 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_8540)]);
    int _8544 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 52;
    uint _8546 = uint(int(uint(_8544) >> uint(2)));
    float _8548 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_8546)]);
    int _8550 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 56;
    uint _8552 = uint(int(uint(_8550) >> uint(2)));
    float _8554 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_8552)]);
    int _8556 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 36;
    uint _8558 = uint(int(uint(_8556) >> uint(2)));
    float _8560 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_8558)]);
    int _8562 = as_type<int>(_8534) & 512;
    bool _8564 = _8562 != 0;
    int _8566 = as_type<int>(_8534) & 1024;
    bool _8568 = _8566 != 0;
    float _8570 = _8476;
    float _8572 = _8284;
    float _8574 = _8466;
    float _8576 = _8286;
    float _8578 = _8492;
    float _8580 = _8490;
    float _8582 = _8534;
    bool _8584 = _8568;
    bool _8586 = _6800;
    if (_8564)
    {
        float _8588 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _8590 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _8592 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _8594 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        _8570 = _8588;
        _8572 = _8590;
        _8574 = _8592;
        _8576 = _8594;
    }
    float _8596 = _8570;
    float _8598 = _8572;
    float _8600 = _8574;
    float _8602 = _8576;
    float _8604 = _8288;
    float _8606 = _8290;
    float _8608 = _8292;
    float _8610 = _8294;
    if (_8564)
    {
        float _8612 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _8614 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _8616 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _8618 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        _8604 = _8612;
        _8606 = _8614;
        _8608 = _8616;
        _8610 = _8618;
    }
    float _8620 = _8604;
    float _8622 = _8606;
    float _8624 = _8608;
    float _8626 = _8610;
    float _8628 = _8296;
    float _8630 = _8298;
    float _8632 = _8300;
    float _8634 = _8302;
    if (_8564)
    {
        float _8636 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _8638 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _8640 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _8642 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        _8628 = _8636;
        _8630 = _8638;
        _8632 = _8640;
        _8634 = _8642;
    }
    float _8644 = _8628;
    float _8646 = _8630;
    float _8648 = _8632;
    float _8650 = _8634;
    float _8652 = _4304 + _8536;
    float _8654 = _8652 + _7946;
    float _8656 = _8536;
    if (!_8564)
    {
        _8578 = 0.0;
    }
    float _8658 = _8578;
    int _8660 = as_type<int>(_8534) & 2048;
    bool _8662 = _8660 != 0;
    float _8664 = _8658;
    if (_8564)
    {
        float _8666 = _8654 * _8598;
        _1844 = _8666;
    }
    float _8668 = _1844;
    float _8670 = _8622;
    float _8672 = _8668;
    float _8674 = _8644;
    float _8676 = _8624;
    if (_8564)
    {
        float _8678 = _8654 * _8622;
        _8670 = _8678;
    }
    float _8680 = _8670;
    float _8682 = _8680;
    if (_8564)
    {
        float _8684 = _8654 * _8646;
        _4174 = _8684;
    }
    float _8686 = _4174;
    float _8688 = _8686;
    if (_8564)
    {
        float _8690 = fma(_7952, _8596, _8668);
        _8672 = _8690;
    }
    float _8692 = _8672;
    float _8694 = _8692;
    if (_8564)
    {
        float _8696 = fma(_7952, _8620, _8680);
        _8682 = _8696;
    }
    float _8698 = _8682;
    if (_8564)
    {
        float _8700 = fma(_7952, _8644, _8686);
        _8674 = _8700;
    }
    float _8702 = _8674;
    float _8704 = _8702;
    if (_8564)
    {
        float _8706 = fma(_7950, _8600, _8692);
        _8694 = _8706;
    }
    float _8708 = _8694;
    float _8710 = _8708;
    if (_8564)
    {
        float _8712 = fma(_7950, _8624, _8698);
        _8676 = _8712;
    }
    float _8714 = _8676;
    if (_8564)
    {
        float _8716 = fma(_7950, _8648, _8702);
        _8704 = _8716;
    }
    float _8718 = _8704;
    if (!_8564)
    {
        _8580 = 0.0;
        _8688 = 0.0;
    }
    float _8720 = _8580;
    float _8722 = _8688;
    float _8724 = _8720;
    float _8726 = _8722;
    if (_8564)
    {
        float _8728 = _8602 + _8708;
        _8724 = _8728;
    }
    float _8730 = _8724;
    float _8732 = _8730;
    if (_8564)
    {
        float _8734 = _8626 + _8714;
        _8726 = _8734;
    }
    float _8736 = _8726;
    float _8738 = _8736;
    if (_8564)
    {
        float _8740 = _8650 + _8718;
        _8664 = _8740;
    }
    float _8742 = _8664;
    bool _8744 = !_8568;
    float _8746 = _8742;
    if (!_8744)
    {
        float _8748 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        uint _8750 = uint(int(uint(_180) >> uint(2)));
        float _8752 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_8750)]);
        int _8754 = _180 + 4;
        uint _8756 = uint(int(uint(_8754) >> uint(2)));
        float _8758 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_8756)]);
        int _8760 = _180 + 8;
        uint _8762 = uint(int(uint(_8760) >> uint(2)));
        float _8764 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_8762)]);
        uint _8766 = uint(int(uint(_180) >> uint(2)));
        float _8768 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_8766)]);
        int _8770 = _180 + 4;
        uint _8772 = uint(int(uint(_8770) >> uint(2)));
        float _8774 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_8772)]);
        int _8776 = _180 + 8;
        uint _8778 = uint(int(uint(_8776) >> uint(2)));
        float _8780 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_8778)]);
        uint _8782 = uint(int(uint(_180) >> uint(2)));
        float _8784 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_8782)]);
        int _8786 = _180 + 4;
        uint _8788 = uint(int(uint(_8786) >> uint(2)));
        float _8790 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_8788)]);
        int _8792 = _180 + 8;
        uint _8794 = uint(int(uint(_8792) >> uint(2)));
        float _8796 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_8794)]);
        float _8798 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        float _8800 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        float _8802 = _8654 * _8758;
        float _8804 = _8654 * _8774;
        float _8806 = _8654 * _8790;
        float _8808 = fma(_7952, _8752, _8802);
        float _8810 = fma(_7952, _8768, _8804);
        float _8812 = fma(_7952, _8784, _8806);
        float _8814 = fma(_7950, _8764, _8808);
        float _8816 = fma(_7950, _8780, _8810);
        float _8818 = fma(_7950, _8796, _8812);
        float _8820 = _8748 + _8814;
        float _8822 = _8798 + _8816;
        float _8824 = _8800 + _8818;
        _8738 = _8822;
        _8732 = _8820;
        _8746 = _8824;
        _8710 = _8814;
    }
    float _8826 = _8738;
    float _8828 = _8732;
    float _8830 = _8746;
    float _8832 = _8710;
    bool _8834 = !_8662;
    float _8836 = _8826;
    float _8838 = _8828;
    float _8840 = _8830;
    float _8842 = _8832;
    if (!_8834)
    {
        uint _8844 = uint(int(uint(_180) >> uint(2)));
        float _8846 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_8844)]);
        int _8848 = _180 + 4;
        uint _8850 = uint(int(uint(_8848) >> uint(2)));
        float _8852 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_8850)]);
        int _8854 = _180 + 8;
        uint _8856 = uint(int(uint(_8854) >> uint(2)));
        float _8858 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_8856)]);
        int _8860 = _180 + 12;
        uint _8862 = uint(int(uint(_8860) >> uint(2)));
        float _8864 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_8862)]);
        uint _8866 = uint(int(uint(_180) >> uint(2)));
        float _8868 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_8866)]);
        int _8870 = _180 + 4;
        uint _8872 = uint(int(uint(_8870) >> uint(2)));
        float _8874 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_8872)]);
        int _8876 = _180 + 8;
        uint _8878 = uint(int(uint(_8876) >> uint(2)));
        float _8880 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_8878)]);
        int _8882 = _180 + 12;
        uint _8884 = uint(int(uint(_8882) >> uint(2)));
        float _8886 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_8884)]);
        uint _8888 = uint(int(uint(_180) >> uint(2)));
        float _8890 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_8888)]);
        int _8892 = _180 + 4;
        uint _8894 = uint(int(uint(_8892) >> uint(2)));
        float _8896 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_8894)]);
        int _8898 = _180 + 8;
        uint _8900 = uint(int(uint(_8898) >> uint(2)));
        float _8902 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_8900)]);
        int _8904 = _180 + 12;
        uint _8906 = uint(int(uint(_8904) >> uint(2)));
        float _8908 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_8906)]);
        float _8910 = _8654 * _8852;
        float _8912 = _8654 * _8874;
        float _8914 = _8654 * _8896;
        float _8916 = fma(_7952, _8846, _8910);
        float _8918 = fma(_7952, _8868, _8912);
        float _8920 = fma(_7952, _8890, _8914);
        float _8922 = fma(_7950, _8858, _8916);
        float _8924 = fma(_7950, _8880, _8918);
        float _8926 = fma(_7950, _8902, _8920);
        float _8928 = _8922 + _8864;
        float _8930 = _8924 + _8886;
        float _8932 = _8926 + _8908;
        _8836 = _8930;
        _8838 = _8928;
        _8840 = _8932;
        _8842 = _8922;
    }
    float _8934 = _8836;
    float _8936 = _8838;
    float _8938 = _8840;
    float _8940 = _8842;
    float _8942 = -_8934;
    float _8944 = _8548 + _8942;
    float _8946 = -_8936;
    float _8948 = _8542 + _8946;
    float _8950 = -_8938;
    float _8952 = _8554 + _8950;
    float _8954 = _8944 * _8944;
    float _8956 = _8940;
    if (!_1454)
    {
        _8956 = 0.0;
        _8656 = 0.0;
    }
    float _8958 = _8956;
    float _8960 = _8656;
    float _8962 = _8960;
    float _8964 = _8958;
    if (!_1454)
    {
        _7986 = 0.0;
    }
    float _8966 = _7986;
    float _8968 = fma(_8948, _8948, _8954);
    float _8970 = fma(_8952, _8952, _8968);
    float _8972 = sqrt(_8970);
    float _8974 = _8966;
    if (!_1454)
    {
        bool _8976 = _8972 > _8560;
        float _8978 = float(_8976);
        _8582 = _8978;
    }
    float _8980 = _8582;
    bool _8982 = !_1454;
    float _8984 = _8980;
    if (!_8982)
    {
        int _8986 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 64;
        uint _8988 = uint(int(uint(_8986) >> uint(2)));
        float _8990 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_8988)]);
        int _8992 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 68;
        uint _8994 = uint(int(uint(_8992) >> uint(2)));
        float _8996 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_8994)]);
        int _8998 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 72;
        uint _9000 = uint(int(uint(_8998) >> uint(2)));
        float _9002 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_9000)]);
        int _9004 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 76;
        uint _9006 = uint(int(uint(_9004) >> uint(2)));
        float _9008 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_9006)]);
        int _9010 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 80;
        uint _9012 = uint(int(uint(_9010) >> uint(2)));
        float _9014 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_9012)]);
        int _9016 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 84;
        uint _9018 = uint(int(uint(_9016) >> uint(2)));
        float _9020 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_9018)]);
        int _9022 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 88;
        uint _9024 = uint(int(uint(_9022) >> uint(2)));
        float _9026 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_9024)]);
        int _9028 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 96;
        uint _9030 = uint(int(uint(_9028) >> uint(2)));
        float _9032 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_9030)]);
        int _9034 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 100;
        uint _9036 = uint(int(uint(_9034) >> uint(2)));
        float _9038 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_9036)]);
        int _9040 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 104;
        uint _9042 = uint(int(uint(_9040) >> uint(2)));
        float _9044 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_9042)]);
        int _9046 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 108;
        uint _9048 = uint(int(uint(_9046) >> uint(2)));
        float _9050 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_9048)]);
        uint _9052 = uint(int(uint(_184) >> uint(2)));
        float _9054 = as_type<float>((*spvDescriptorSet0.cp_s13)._m0[int(_9052)]);
        bool _9056 = _8972 > _8560;
        float _9058 = _8960;
        if (!_9056)
        {
            int _9060 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 32;
            uint _9062 = uint(int(uint(_9060) >> uint(2)));
            float _9064 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_9062)]);
            _9058 = _9064;
        }
        float _9066 = _9058;
        float _9068 = -_8934;
        float _9070 = _8996 + _9068;
        float _9072 = -_8936;
        float _9074 = _8990 + _9072;
        float _9076 = -_8938;
        float _9078 = _9002 + _9076;
        float _9080 = -_8934;
        float _9082 = _9020 + _9080;
        float _9084 = _9070 * _9070;
        float _9086 = -_8936;
        float _9088 = _9014 + _9086;
        float _9090 = -_8938;
        float _9092 = _9026 + _9090;
        float _9094 = -_8934;
        float _9096 = _9038 + _9094;
        float _9098 = _9082 * _9082;
        float _9100 = -_8936;
        float _9102 = _9032 + _9100;
        float _9104 = fma(_9074, _9074, _9084);
        float _9106 = _9096 * _9096;
        float _9108 = fma(_9088, _9088, _9098);
        float _9110 = -_8938;
        float _9112 = _9044 + _9110;
        float _9114 = fma(_9078, _9078, _9104);
        float _9116 = fma(_9102, _9102, _9106);
        float _9118 = fma(_9092, _9092, _9108);
        int _9120 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 40;
        uint _9122 = uint(int(uint(_9120) >> uint(2)));
        float _9124 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_9122)]);
        float _9126 = sqrt(_9114);
        float _9128 = fma(_9112, _9112, _9116);
        float _9130 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
        float _9132 = sqrt(_9118);
        float _9134 = sqrt(_9128);
        bool _9136 = _9126 > _8560;
        bool _9138 = _9132 > _8560;
        float _9140 = _9114;
        int _9142 = as_type<int>(_9102);
        int _9144 = as_type<int>(_9112);
        int _9146 = as_type<int>(_9050);
        if (!_9136)
        {
            int _9148 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 32;
            uint _9150 = uint(int(uint(_9148) >> uint(2)));
            float _9152 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_9150)]);
            _9140 = _9152;
        }
        float _9154 = _9140;
        bool _9156 = _9134 > _8560;
        float _9158 = _9008;
        if (!_9138)
        {
            int _9160 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 32;
            uint _9162 = uint(int(uint(_9160) >> uint(2)));
            float _9164 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_9162)]);
            _9158 = _9164;
        }
        float _9166 = _9158;
        float _9168 = _8304;
        if (!_9156)
        {
            int _9170 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 32;
            uint _9172 = uint(int(uint(_9170) >> uint(2)));
            float _9174 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_9172)]);
            _9168 = _9174;
        }
        float _9176 = _9168;
        int _9178 = as_type<int>(_9054) << 24;
        int _9180 = _9178 >> 24;
        float _9182 = float(_9180);
        float _9184 = _9182 * 0.0078740157186985015869140625;
        float _9186 = precise::min(_9184, 1.0);
        float _9188 = precise::max(_9186, -1.0);
        int _9190 = as_type<int>(_9054) << 16;
        bool _9192 = _9188 > 0.0;
        bool _9194 = _9192 || _9056;
        int _9196 = as_type<int>(_9054) << 8;
        int _9198 = _9190 >> 24;
        int _9200 = as_type<int>(_9054) >> 24;
        int _9202 = _9198;
        if (!_9056)
        {
            bool _9204 = _9188 >= 0.0;
            bool _9206 = isnan(_9188);
            bool _9208 = _9204 || _9206;
            bool _9210 = isnan(0.0);
            bool _9212 = _9208 || _9210;
            _8584 = _9212;
        }
        bool _9214 = _8584;
        int _9216 = _9196 >> 24;
        float _9218 = float(_9198);
        bool _9220 = _9214;
        if (!_9056)
        {
            int _9222 = _9214 ? 0 : 1;
            _9142 = _9222;
        }
        int _9224 = _9142;
        float _9226 = float(_9216);
        float _9228 = _9218 * 0.0078740157186985015869140625;
        float _9230 = float(_9200);
        float _9232 = _9226;
        if (!_9056)
        {
            int _9234 = ~_9224;
            int _9236 = _9234 + 1;
            int _9238 = _9236 + 1;
            _9202 = _9238;
        }
        int _9240 = _9202;
        int _9242 = _9240;
        if (!_9056)
        {
            bool _9244 = _8972 >= _9066;
            bool _9246 = isnan(_8972);
            bool _9248 = _9244 || _9246;
            bool _9250 = isnan(_9066);
            bool _9252 = _9248 || _9250;
            _9220 = _9252;
        }
        bool _9254 = _9220;
        float _9256 = _9226 * 0.0078740157186985015869140625;
        bool _9258 = _9254;
        if (!_9194)
        {
            int _9260 = ~_9224;
            int _9262 = _9260 + 1;
            _9242 = _9262;
        }
        int _9264 = _9242;
        float _9266 = _9230 * 0.0078740157186985015869140625;
        float _9268 = precise::min(_9228, 1.0);
        int _9270 = _9264;
        int _9272 = as_type<int>(_9268);
        if (!_9056)
        {
            float _9274 = float(_9264);
            _9270 = as_type<int>(_9274);
        }
        int _9276 = _9270;
        float _9278 = precise::min(_9256, 1.0);
        float _9280 = precise::max(_9268, -1.0);
        float _9282 = precise::min(_9266, 1.0);
        int _9284 = as_type<int>(_9278);
        int _9286 = _9276;
        int _9288 = as_type<int>(_9282);
        if (_9056)
        {
            _9232 = 1.0;
        }
        float _9290 = _9232;
        float _9292 = _9290;
        if (!_9056)
        {
            float _9294 = _9254 ? as_type<float>(_9276) : (-1.0);
            _9292 = _9294;
        }
        float _9296 = _9292;
        float _9298 = precise::max(_9278, -1.0);
        if (!_9136)
        {
            bool _9300 = _9280 >= 0.0;
            bool _9302 = isnan(_9280);
            bool _9304 = _9300 || _9302;
            bool _9306 = isnan(0.0);
            bool _9308 = _9304 || _9306;
            _9258 = _9308;
        }
        bool _9310 = _9258;
        float _9312 = precise::max(_9282, -1.0);
        bool _9314 = _9280 > 0.0;
        bool _9316 = _9314 || _9136;
        bool _9318 = _9316;
        if (!_9138)
        {
            bool _9320 = _9298 >= 0.0;
            bool _9322 = isnan(_9298);
            bool _9324 = _9320 || _9322;
            bool _9326 = isnan(0.0);
            bool _9328 = _9324 || _9326;
            _8586 = _9328;
        }
        bool _9330 = _8586;
        bool _9332 = _9298 > 0.0;
        bool _9334 = _9332 || _9138;
        bool _9336 = _9330;
        bool _9338 = _9334;
        if (!_9136)
        {
            int _9340 = _9310 ? 0 : 1;
            _9272 = _9340;
        }
        int _9342 = _9272;
        bool _9344 = _9312 > 0.0;
        bool _9346 = _9344 || _9156;
        float _9348 = as_type<float>(_9342);
        bool _9350 = _9346;
        if (!_9138)
        {
            int _9352 = _9330 ? 0 : 1;
            _9284 = _9352;
        }
        int _9354 = _9284;
        float _9356 = as_type<float>(_9354);
        if (!_9156)
        {
            bool _9358 = _9312 >= 0.0;
            bool _9360 = isnan(_9312);
            bool _9362 = _9358 || _9360;
            bool _9364 = isnan(0.0);
            bool _9366 = _9362 || _9364;
            _9336 = _9366;
        }
        bool _9368 = _9336;
        if (!_9156)
        {
            int _9370 = _9368 ? 0 : 1;
            _9286 = _9370;
        }
        int _9372 = _9286;
        float _9374 = as_type<float>(_9372);
        if (!_9136)
        {
            int _9376 = ~_9342;
            int _9378 = _9376 + 1;
            int _9380 = _9378 + 1;
            _9288 = _9380;
        }
        int _9382 = _9288;
        int _9384 = _9382;
        if (!_9138)
        {
            int _9386 = ~_9354;
            int _9388 = _9386 + 1;
            int _9390 = _9388 + 1;
            _9144 = _9390;
        }
        int _9392 = _9144;
        int _9394 = _9392;
        if (!_9316)
        {
            int _9396 = ~_9342;
            int _9398 = _9396 + 1;
            _9384 = _9398;
        }
        int _9400 = _9384;
        int _9402 = _9400;
        if (!_9156)
        {
            int _9404 = ~_9372;
            int _9406 = _9404 + 1;
            int _9408 = _9406 + 1;
            _9146 = _9408;
        }
        int _9410 = _9146;
        int _9412 = _9410;
        if (!_9334)
        {
            int _9414 = ~_9354;
            int _9416 = _9414 + 1;
            _9394 = _9416;
        }
        int _9418 = _9394;
        int _9420 = _9418;
        if (!_9346)
        {
            int _9422 = ~_9372;
            int _9424 = _9422 + 1;
            _9412 = _9424;
        }
        int _9426 = _9412;
        int _9428 = _9426;
        if (!_9136)
        {
            float _9430 = float(_9400);
            _9402 = as_type<int>(_9430);
        }
        int _9432 = _9402;
        if (!_9138)
        {
            float _9434 = float(_9418);
            _9420 = as_type<int>(_9434);
        }
        int _9436 = _9420;
        if (!_9156)
        {
            float _9438 = float(_9426);
            _9428 = as_type<int>(_9438);
        }
        int _9440 = _9428;
        if (_9136)
        {
            _9356 = 1.0;
        }
        float _9442 = _9356;
        float _9444 = _9442;
        if (_9138)
        {
            _9348 = 1.0;
        }
        float _9446 = _9348;
        float _9448 = _9446;
        if (_9156)
        {
            _9374 = 1.0;
        }
        float _9450 = _9374;
        float _9452 = 1.0 / _9124;
        float _9454 = _9130 * _9452;
        float _9456 = abs(_9188);
        float _9458 = fma(_9454, _9296, _9456);
        float _9460 = precise::clamp(_9458, 0.0, 1.0);
        float _9462 = _9450;
        if (!_9136)
        {
            bool _9464 = _9126 >= _9154;
            bool _9466 = isnan(_9126);
            bool _9468 = _9464 || _9466;
            bool _9470 = isnan(_9154);
            bool _9472 = _9468 || _9470;
            _9318 = _9472;
        }
        bool _9474 = _9318;
        if (!_9138)
        {
            bool _9476 = _9132 >= _9166;
            bool _9478 = isnan(_9132);
            bool _9480 = _9476 || _9478;
            bool _9482 = isnan(_9166);
            bool _9484 = _9480 || _9482;
            _9338 = _9484;
        }
        bool _9486 = _9338;
        if (!_9136)
        {
            float _9488 = _9474 ? as_type<float>(_9432) : (-1.0);
            _9444 = _9488;
        }
        float _9490 = _9444;
        if (!_9138)
        {
            float _9492 = _9486 ? as_type<float>(_9436) : (-1.0);
            _9448 = _9492;
        }
        float _9494 = _9448;
        if (!_9156)
        {
            bool _9496 = _9134 >= _9176;
            bool _9498 = isnan(_9134);
            bool _9500 = _9496 || _9498;
            bool _9502 = isnan(_9176);
            bool _9504 = _9500 || _9502;
            _9350 = _9504;
        }
        bool _9506 = _9350;
        if (!_9156)
        {
            float _9508 = _9506 ? as_type<float>(_9440) : (-1.0);
            _9462 = _9508;
        }
        float _9510 = _9462;
        float _9512 = abs(_9280);
        float _9514 = fma(_9454, _9490, _9512);
        float _9516 = precise::clamp(_9514, 0.0, 1.0);
        float _9518 = abs(_9298);
        float _9520 = fma(_9454, _9494, _9518);
        float _9522 = precise::clamp(_9520, 0.0, 1.0);
        float _9524 = abs(_9312);
        float _9526 = fma(_9454, _9510, _9524);
        float _9528 = precise::clamp(_9526, 0.0, 1.0);
        float _9530 = _9460 * _9296;
        float _9532 = _9516 * _9490;
        float _9534 = _9522 * _9494;
        float _9536 = _9528 * _9510;
        _8984 = _9530;
        _8962 = _9532;
        _8964 = _9534;
        _8974 = _9536;
    }
    float _9538 = _8984;
    float _9540 = _8962;
    float _9542 = _8964;
    float _9544 = _8974;
    float _9546 = precise::min(_9538, 1.0);
    float _9548 = precise::min(_9540, 1.0);
    float _9550 = -_240;
    float _9552 = _9550 + _7952;
    float _9554 = precise::max(_9546, -1.0);
    float _9556 = precise::max(_9548, -1.0);
    float _9558 = -_246;
    float _9560 = _9558 + _8654;
    float _9562 = precise::min(_9542, 1.0);
    float _9564 = _9554 * 127.0;
    float _9566 = precise::min(_9544, 1.0);
    float _9568 = _9556 * 127.0;
    float _9570 = precise::max(_9562, -1.0);
    float _9572 = -_252;
    float _9574 = _9572 + _7950;
    float _9576 = precise::max(_9566, -1.0);
    float _9578 = rint(_9564);
    int _9580 = int(_9578);
    float _9582 = _9570 * 127.0;
    float _9584 = _9576 * 127.0;
    float _9586 = rint(_9568);
    int _9588 = int(_9586);
    float _9590 = rint(_9582);
    int _9592 = int(_9590);
    uint _9594 = extract_bits(uint(_9580), 0u, 8u);
    int _9596 = int(_9594) & 255;
    float _9598 = rint(_9584);
    int _9600 = int(_9598);
    uint _9602 = extract_bits(uint(_9596), 0u, 8u);
    int _9604 = int(_9602) & 255;
    uint _9606 = extract_bits(uint(_9588), 0u, 8u);
    int _9608 = int(_9606) & 255;
    int _9610 = _9608 << 8;
    int _9612 = _9604 | _9610;
    uint _9614 = extract_bits(uint(_9596), 16u, 8u);
    int _9616 = int(_9614) & 255;
    int _9618 = _9616 << 16;
    int _9620 = _9612 | _9618;
    uint _9622 = extract_bits(uint(_9596), 24u, 8u);
    int _9624 = int(_9622) & 255;
    int _9626 = _9624 << 24;
    int _9628 = _9620 | _9626;
    uint _9630 = extract_bits(uint(_9628), 0u, 8u);
    int _9632 = int(_9630) & 255;
    uint _9634 = extract_bits(uint(_9628), 8u, 8u);
    int _9636 = int(_9634) & 255;
    int _9638 = _9636 << 8;
    int _9640 = _9632 | _9638;
    uint _9642 = extract_bits(uint(_9592), 0u, 8u);
    int _9644 = int(_9642) & 255;
    int _9646 = _9644 << 16;
    int _9648 = _9640 | _9646;
    uint _9650 = extract_bits(uint(_9628), 24u, 8u);
    int _9652 = int(_9650) & 255;
    int _9654 = _9652 << 24;
    int _9656 = _9648 | _9654;
    int _9658 = _180 + 4;
    int _9660 = _180 + 8;
    uint _9662 = extract_bits(uint(_9656), 0u, 8u);
    int _9664 = int(_9662) & 255;
    uint _9666 = extract_bits(uint(_9656), 8u, 8u);
    int _9668 = int(_9666) & 255;
    int _9670 = _9668 << 8;
    int _9672 = _9664 | _9670;
    uint _9674 = extract_bits(uint(_9656), 16u, 8u);
    int _9676 = int(_9674) & 255;
    int _9678 = _9676 << 16;
    int _9680 = _9672 | _9678;
    uint _9682 = extract_bits(uint(_9600), 0u, 8u);
    int _9684 = int(_9682) & 255;
    int _9686 = _9684 << 24;
    int _9688 = _9680 | _9686;
    uint _9690 = uint(int(uint(_184) >> uint(2)));
    (*spvDescriptorSet0.cp_s13)._m0[int(_9690)] = uint(_9688);
    uint _9692 = uint(int(uint(_184) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_9692)] = uint(_2556);
    uint _9694 = uint(int(uint(_180) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_9694)] = as_type<uint>(_7952);
    uint _9696 = uint(int(uint(_9658) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_9696)] = as_type<uint>(_8654);
    uint _9698 = uint(int(uint(_9660) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_9698)] = as_type<uint>(_7950);
    uint _9700 = uint(int(uint(_180) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_9700)] = as_type<uint>(_8306);
    uint _9702 = uint(int(uint(_9658) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_9702)] = as_type<uint>(_8308);
    uint _9704 = uint(int(uint(_9660) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_9704)] = as_type<uint>(_8310);
    uint _9706 = uint(int(uint(_180) >> uint(2)));
    (*spvDescriptorSet0.cp_s8)._m0[int(_9706)] = as_type<uint>(_9552);
    uint _9708 = uint(int(uint(_9658) >> uint(2)));
    (*spvDescriptorSet0.cp_s8)._m0[int(_9708)] = as_type<uint>(_9560);
    uint _9710 = uint(int(uint(_9660) >> uint(2)));
    (*spvDescriptorSet0.cp_s8)._m0[int(_9710)] = as_type<uint>(_9574);
    float _9712 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _9714 = _9560 * _9560;
    float _9716 = _8308 * _8308;
    float _9718 = fma(_9552, _9552, _9714);
    float _9720 = fma(_8306, _8306, _9716);
    float _9722 = fma(_9574, _9574, _9718);
    float _9724 = fma(_8310, _8310, _9720);
    float _9726 = sqrt(_9722);
    float _9728 = sqrt(_9724);
    bool _9730 = _9726 >= 9.9999999747524270787835121154785e-07;
    bool _9732 = isnan(_9726);
    bool _9734 = _9730 || _9732;
    bool _9736 = isnan(9.9999999747524270787835121154785e-07);
    bool _9738 = _9734 || _9736;
    float _9740 = _9724;
    if (!_9738)
    {
        bool _9742 = _190 != _194;
        bool _9744 = isnan(_190);
        bool _9746 = _9742 || _9744;
        bool _9748 = isnan(_194);
        bool _9750 = _9746 || _9748;
        _9752 = _9750;
        if (!_9752)
        {
            float _9754 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[67]);
            bool _9756 = _9754 > 0.0;
            bool _9758 = !_9756;
            if (!_9758)
            {
                float _9760 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[64]);
                float _9762 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[65]);
                float _9764 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[66]);
                float _9766 = _9762 * _9762;
                float _9768 = fma(_9760, _9760, _9766);
                float _9770 = fma(_9764, _9764, _9768);
                float _9772 = rsqrt(_9770);
                float _9774 = _9772 * 9.9999999747524270787835121154785e-07;
                float _9776 = _9760 * _9774;
                float _9778 = _9762 * _9774;
                float _9780 = _9764 * _9774;
                _426 = as_type<int>(_9776);
                _428 = as_type<int>(_9778);
                _430 = as_type<int>(_9780);
                _9752 = true;
            }
            else
            {
                bool _9782 = _9728 >= 9.9999999747524270787835121154785e-07;
                bool _9784 = isnan(_9728);
                bool _9786 = _9782 || _9784;
                bool _9788 = isnan(9.9999999747524270787835121154785e-07);
                bool _9790 = _9786 || _9788;
                if (!_9790)
                {
                    float _9792 = _8654 * _8654;
                    float _9794 = fma(_7952, _7952, _9792);
                    float _9796 = fma(_7950, _7950, _9794);
                    float _9798 = sqrt(_9796);
                    bool _9800 = _9798 >= 9.9999999747524270787835121154785e-07;
                    bool _9802 = isnan(_9798);
                    bool _9804 = _9800 || _9802;
                    bool _9806 = isnan(9.9999999747524270787835121154785e-07);
                    bool _9808 = _9804 || _9806;
                    float _9810 = _9798;
                    if (_9808)
                    {
                        float _9812 = rsqrt(_9796);
                        _9810 = _9812;
                    }
                    float _9814 = _9810;
                    if (!_9808)
                    {
                        _414 = 0;
                    }
                    int _9816 = _414;
                    int _9818 = _9816;
                    if (!_9808)
                    {
                        _416 = 897988541;
                    }
                    int _9820 = _416;
                    int _9822 = _9820;
                    if (!_9808)
                    {
                        _418 = 0;
                    }
                    int _9824 = _418;
                    int _9826 = _9824;
                    if (_9808)
                    {
                        float _9828 = _9814 * 9.9999999747524270787835121154785e-07;
                        _9740 = _9828;
                    }
                    float _9830 = _9740;
                    if (_9808)
                    {
                        float _9832 = _7952 * _9830;
                        _9818 = as_type<int>(_9832);
                    }
                    int _9834 = _9818;
                    _426 = _9834;
                    if (_9808)
                    {
                        float _9836 = _8654 * _9830;
                        _9822 = as_type<int>(_9836);
                    }
                    int _9838 = _9822;
                    _428 = _9838;
                    if (_9808)
                    {
                        float _9840 = _7950 * _9830;
                        _9826 = as_type<int>(_9840);
                    }
                    int _9842 = _9826;
                    _430 = _9842;
                    _9752 = true;
                }
                else
                {
                    float _9844 = rsqrt(_9724);
                    float _9846 = _9844 * 9.9999999747524270787835121154785e-07;
                    float _9848 = _8306 * _9846;
                    float _9850 = _8308 * _9846;
                    float _9852 = _8310 * _9846;
                    _426 = as_type<int>(_9848);
                    _428 = as_type<int>(_9850);
                    _430 = as_type<int>(_9852);
                    _9752 = true;
                }
            }
        }
    }
    else
    {
        float _9854 = _9728 * _9712;
        bool _9856 = _9854 >= 0.001000000047497451305389404296875;
        bool _9858 = isnan(_9854);
        bool _9860 = _9856 || _9858;
        bool _9862 = isnan(0.001000000047497451305389404296875);
        bool _9864 = _9860 || _9862;
        bool _9866 = _9854 > 0.0;
        bool _9868 = !_9864;
        bool _9870 = _9866 && _9868;
        bool _9872 = _9726 < 0.001000000047497451305389404296875;
        bool _9874 = _9872 && _9870;
        if (!_9874)
        {
            _420 = as_type<int>(_9552);
        }
        int _9876 = _420;
        int _9878 = _9876;
        if (_9874)
        {
            float _9880 = _9712 * _8306;
            _9878 = as_type<int>(_9880);
        }
        int _9882 = _9878;
        _426 = _9882;
        if (!_9874)
        {
            _422 = as_type<int>(_9560);
        }
        int _9884 = _422;
        int _9886 = _9884;
        if (_9874)
        {
            float _9888 = _9712 * _8308;
            _9886 = as_type<int>(_9888);
        }
        int _9890 = _9886;
        _428 = _9890;
        if (!_9874)
        {
            _424 = as_type<int>(_9574);
        }
        int _9892 = _424;
        _430 = _9892;
        if (_9874)
        {
            float _9894 = _9712 * _8310;
            _430 = as_type<int>(_9894);
        }
    }
    _9752 = false;
    int _9896 = _426;
    int _9898 = _428;
    int _9900 = _430;
    uint _9902 = uint(int(uint(_180) >> uint(2)));
    (*spvDescriptorSet0.cp_s8)._m0[int(_9902)] = uint(_9896);
    uint _9904 = uint(int(uint(_9658) >> uint(2)));
    (*spvDescriptorSet0.cp_s8)._m0[int(_9904)] = uint(_9898);
    uint _9906 = uint(int(uint(_9660) >> uint(2)));
    (*spvDescriptorSet0.cp_s8)._m0[int(_9906)] = uint(_9900);
}

