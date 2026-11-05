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
    device _21* cp_s14 [[id(14)]];
    texture2d_array<float> cp_t_tcb_16 [[id(15)]];
    sampler cp_t_tcb_16Smplr [[id(16)]];
    texture2d_array<float> cp_t_tcb_14 [[id(17)]];
    sampler cp_t_tcb_14Smplr [[id(18)]];
    texture2d<float> cp_t_tcb_26 [[id(19)]];
    sampler cp_t_tcb_26Smplr [[id(20)]];
    texture2d<float> cp_t_tcb_1A [[id(21)]];
    sampler cp_t_tcb_1ASmplr [[id(22)]];
    texture2d<float> cp_t_tcb_2C [[id(23)]];
    sampler cp_t_tcb_2CSmplr [[id(24)]];
    texture2d<float> cp_t_tcb_2A [[id(25)]];
    sampler cp_t_tcb_2ASmplr [[id(26)]];
    sampler cp_t_tcb_14Smplr_w [[id(27)]];
    sampler cp_t_tcb_1ASmplr_w [[id(28)]];
    sampler cp_t_tcb_2CSmplr_w [[id(29)]];
    sampler cp_t_tcb_2ASmplr_w [[id(30)]];
    constant dm_border_t* dm_border [[id(31)]];
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]])
{
    bool _2063 = false;
    bool _1729 = false;
    bool _1629 = false;
    bool _1413 = false;
    float _86 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[9]);
    float _88 = as_type<float>(gl_LocalInvocationID.x);
    float _90 = as_type<float>(gl_WorkGroupID.x);
    int _93 = as_type<int>(_90) << 5;
    int _95 = _93 + as_type<int>(_88);
    float _97 = trunc(_86);
    int _99 = int(_97);
    bool _103 = _95 >= _99;
    int _105 = 0;
    if (_103)
    {
        _105 = 0;
    }
    int _107 = _105;
    int _109 = _107;
    int _111 = _107;
    float _113 = 0.0;
    if (!_103)
    {
        int _115 = _95 << 4;
        int _117 = _115 + 12;
        uint _120 = uint(int(uint(_117) >> uint(2)));
        float _122 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_120)]);
        float _124 = trunc(_122);
        int _126 = int(_124);
        bool _128 = _126 >= 1;
        int _130 = _128 ? (-1) : 0;
        _113 = as_type<float>(_126);
        if (!_128)
        {
            _109 = 0;
        }
        int _132 = _109;
        bool _134 = !_128;
        _111 = _132;
        if (!_134)
        {
            float _136 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
            uint _138 = uint(int(uint(_117) >> uint(2)));
            float _140 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_138)]);
            float _142 = float(_126);
            float _144 = -_140;
            float _146 = _136 + _144;
            bool _148 = _146 > _142;
            int _150 = as_type<int>(_136);
            _113 = _142;
            if (!_148)
            {
                bool _152 = _136 >= _140;
                bool _154 = isnan(_136);
                bool _156 = _152 || _154;
                bool _158 = isnan(_140);
                bool _160 = _156 || _158;
                _130 = _160 ? (-1) : 0;
            }
            int _162 = _130;
            if (_148)
            {
                _150 = 0;
            }
            int _164 = _150;
            _111 = _164;
            if (!_148)
            {
                int _166 = ~_162;
                int _168 = (_166 != 0) ? 0 : 1;
                _111 = _168;
            }
        }
    }
    int _170 = _111;
    float _172 = _113;
    int _174 = _170 & 1;
    bool _176 = _174 != 0;
    float _178 = as_type<float>(_170);
    float _180 = _172;
    if (!_176)
    {
        return;
    }
    int _182 = _95 << 4;
    float _184 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[30]);
    int _186 = _182 + 12;
    float _188 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    uint _190 = uint(int(uint(_186) >> uint(2)));
    float _192 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_190)]);
    uint _194 = uint(int(uint(_182) >> uint(2)));
    float _196 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_194)]);
    int _198 = _182 + 4;
    uint _200 = uint(int(uint(_198) >> uint(2)));
    float _202 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_200)]);
    int _204 = _182 + 8;
    uint _206 = uint(int(uint(_204) >> uint(2)));
    float _208 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_206)]);
    uint _210 = uint(int(uint(_182) >> uint(2)));
    float _212 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_210)]);
    int _214 = _182 + 4;
    uint _216 = uint(int(uint(_214) >> uint(2)));
    float _218 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_216)]);
    int _220 = _182 + 8;
    uint _222 = uint(int(uint(_220) >> uint(2)));
    float _224 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_222)]);
    float _226 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[68]);
    float _228 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
    int _230 = as_type<int>(_184) & 512;
    bool _232 = _230 != 0;
    float _234 = 0.0;
    float _236 = 0.0;
    float _238 = 0.0;
    float _240 = 0.0;
    if (_232)
    {
        float _242 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _244 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _246 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _248 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        _234 = _242;
        _236 = _244;
        _238 = _246;
        _240 = _248;
    }
    float _250 = _234;
    float _252 = _236;
    float _254 = _238;
    float _256 = _240;
    float _258 = 0.0;
    float _260 = 0.0;
    float _262 = 0.0;
    float _264 = 0.0;
    if (_232)
    {
        float _266 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _268 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _270 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _272 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        _258 = _266;
        _260 = _268;
        _262 = _270;
        _264 = _272;
    }
    float _274 = _258;
    float _276 = _260;
    float _278 = _262;
    float _280 = _264;
    float _282 = 0.0;
    float _284 = 0.0;
    float _286 = 0.0;
    float _288 = 0.0;
    if (_232)
    {
        float _290 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _292 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _294 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _296 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        _282 = _290;
        _284 = _292;
        _286 = _294;
        _288 = _296;
    }
    float _298 = _282;
    float _300 = _284;
    float _302 = _286;
    float _304 = _288;
    float _306 = _192 * _188;
    float _308 = _196 * _306;
    float _310 = fma(_202, _306, _218);
    float _312 = _208 * _306;
    float _314 = _212 + _308;
    float _316 = _224 + _312;
    int _318 = as_type<int>(_184) & 1024;
    bool _320 = _318 != 0;
    int _322 = as_type<int>(_184) & 2048;
    bool _324 = _322 != 0;
    uint _326 = uint(int(uint(_186) >> uint(2)));
    float _328 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_326)]);
    float _330 = _300;
    float _332 = _302;
    float _334 = _298;
    float _336 = _310;
    int _338 = as_type<int>(_308);
    int _340 = as_type<int>(_308);
    if (_232)
    {
        float _342 = _310 * _252;
        _178 = _342;
    }
    float _344 = _178;
    uint _346 = uint(int(uint(_186) >> uint(2)));
    float _348 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_346)]);
    float _350 = _344;
    if (_232)
    {
        float _352 = _310 * _276;
        _180 = _352;
    }
    float _354 = _180;
    float _356 = _354;
    if (_232)
    {
        float _358 = fma(_314, _250, _344);
        _350 = _358;
    }
    float _360 = _350;
    float _362 = _360;
    if (_232)
    {
        float _364 = _310 * _300;
        _330 = _364;
    }
    float _366 = _330;
    float _368 = _366;
    if (_232)
    {
        float _370 = fma(_314, _274, _354);
        _356 = _370;
    }
    float _372 = _356;
    float _374 = _372;
    if (_232)
    {
        float _376 = fma(_316, _254, _360);
        _362 = _376;
    }
    float _378 = _362;
    if (_232)
    {
        float _380 = fma(_314, _298, _366);
        _368 = _380;
    }
    float _382 = _368;
    float _384 = _382;
    if (_232)
    {
        float _386 = fma(_316, _278, _372);
        _374 = _386;
    }
    float _388 = _374;
    if (_232)
    {
        float _390 = fma(_316, _302, _382);
        _332 = _390;
    }
    float _392 = _332;
    if (!_232)
    {
        _334 = 0.0;
        _384 = 0.0;
    }
    float _394 = _334;
    float _396 = _384;
    float _398 = _396;
    float _400 = _394;
    if (_232)
    {
        float _402 = _256 + _378;
        _398 = _402;
    }
    float _404 = _398;
    if (_232)
    {
        float _406 = _280 + _388;
        _400 = _406;
    }
    float _408 = _400;
    float _410 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
    float _412 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
    float _414 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
    float _416 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
    uint _418 = uint(int(uint(_182) >> uint(2)));
    float _420 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_418)]);
    int _422 = _182 + 4;
    uint _424 = uint(int(uint(_422) >> uint(2)));
    float _426 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_424)]);
    int _428 = _182 + 8;
    uint _430 = uint(int(uint(_428) >> uint(2)));
    float _432 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_430)]);
    int _434 = _182 + 12;
    uint _436 = uint(int(uint(_434) >> uint(2)));
    float _438 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_436)]);
    uint _440 = uint(int(uint(_182) >> uint(2)));
    float _442 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_440)]);
    float _444 = 0.0;
    if (!_232)
    {
        _444 = 0.0;
    }
    float _446 = _444;
    float _448 = _446;
    if (_232)
    {
        float _450 = _304 + _392;
        _448 = _450;
    }
    float _452 = _448;
    float _454 = _416;
    float _456 = _452;
    if (!_320)
    {
        _454 = _408;
    }
    float _458 = _454;
    float _460 = _438;
    float _462 = _458;
    int _464 = as_type<int>(_426);
    int _466 = as_type<int>(_432);
    int _468 = as_type<int>(_426);
    int _470 = as_type<int>(_432);
    int _472 = as_type<int>(_426);
    int _474 = as_type<int>(_432);
    if (!_320)
    {
        _460 = _404;
    }
    float _476 = _460;
    bool _478 = !_320;
    float _480 = _476;
    if (!_478)
    {
        float _482 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        uint _484 = uint(int(uint(_182) >> uint(2)));
        float _486 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_484)]);
        int _488 = _182 + 4;
        uint _490 = uint(int(uint(_488) >> uint(2)));
        float _492 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_490)]);
        int _494 = _182 + 8;
        uint _496 = uint(int(uint(_494) >> uint(2)));
        float _498 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_496)]);
        uint _500 = uint(int(uint(_182) >> uint(2)));
        float _502 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_500)]);
        int _504 = _182 + 4;
        uint _506 = uint(int(uint(_504) >> uint(2)));
        float _508 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_506)]);
        int _510 = _182 + 8;
        uint _512 = uint(int(uint(_510) >> uint(2)));
        float _514 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_512)]);
        uint _516 = uint(int(uint(_182) >> uint(2)));
        float _518 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_516)]);
        int _520 = _182 + 4;
        uint _522 = uint(int(uint(_520) >> uint(2)));
        float _524 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_522)]);
        int _526 = _182 + 8;
        uint _528 = uint(int(uint(_526) >> uint(2)));
        float _530 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_528)]);
        float _532 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        float _534 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        float _536 = _310 * _492;
        float _538 = _310 * _508;
        float _540 = _310 * _524;
        float _542 = fma(_314, _486, _536);
        float _544 = fma(_314, _502, _538);
        float _546 = fma(_314, _518, _540);
        float _548 = fma(_316, _498, _542);
        float _550 = fma(_316, _514, _544);
        float _552 = fma(_316, _530, _546);
        float _554 = _482 + _548;
        float _556 = _532 + _550;
        float _558 = _534 + _552;
        _456 = _556;
        _480 = _554;
        _462 = _558;
    }
    float _560 = _456;
    float _562 = _480;
    float _564 = _462;
    bool _566 = !_324;
    float _568 = _560;
    float _570 = _562;
    float _572 = _564;
    if (!_566)
    {
        uint _574 = uint(int(uint(_182) >> uint(2)));
        float _576 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_574)]);
        int _578 = _182 + 4;
        uint _580 = uint(int(uint(_578) >> uint(2)));
        float _582 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_580)]);
        int _584 = _182 + 8;
        uint _586 = uint(int(uint(_584) >> uint(2)));
        float _588 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_586)]);
        int _590 = _182 + 12;
        uint _592 = uint(int(uint(_590) >> uint(2)));
        float _594 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_592)]);
        uint _596 = uint(int(uint(_182) >> uint(2)));
        float _598 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_596)]);
        int _600 = _182 + 4;
        uint _602 = uint(int(uint(_600) >> uint(2)));
        float _604 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_602)]);
        int _606 = _182 + 8;
        uint _608 = uint(int(uint(_606) >> uint(2)));
        float _610 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_608)]);
        int _612 = _182 + 12;
        uint _614 = uint(int(uint(_612) >> uint(2)));
        float _616 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_614)]);
        uint _618 = uint(int(uint(_182) >> uint(2)));
        float _620 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_618)]);
        int _622 = _182 + 4;
        uint _624 = uint(int(uint(_622) >> uint(2)));
        float _626 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_624)]);
        int _628 = _182 + 8;
        uint _630 = uint(int(uint(_628) >> uint(2)));
        float _632 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_630)]);
        int _634 = _182 + 12;
        uint _636 = uint(int(uint(_634) >> uint(2)));
        float _638 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_636)]);
        float _640 = _310 * _582;
        float _642 = _310 * _604;
        float _644 = _310 * _626;
        float _646 = fma(_314, _576, _640);
        float _648 = fma(_314, _598, _642);
        float _650 = fma(_314, _620, _644);
        float _652 = fma(_316, _588, _646);
        float _654 = fma(_316, _610, _648);
        float _656 = fma(_316, _632, _650);
        float _658 = _652 + _594;
        float _660 = _654 + _616;
        float _662 = _656 + _638;
        _568 = _660;
        _570 = _658;
        _572 = _662;
    }
    float _664 = _568;
    float _666 = _570;
    float _668 = _572;
    float _670 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[8]);
    float _672 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[9]);
    float _674 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[10]);
    float _676 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[11]);
    float _678 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[61]);
    float _680 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[60]);
    float _682 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[70]);
    float _684 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[504]);
    float _686 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[505]);
    float _688 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[506]);
    float _690 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[507]);
    float _692 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[501]);
    float _694 = _672 * _664;
    float _696 = fma(_670, _666, _694);
    float _698 = fma(_674, _668, _696);
    float _700 = _676 + _698;
    float _702 = -_700;
    bool _704 = _678 >= _702;
    bool _706 = isnan(_678);
    bool _708 = _704 || _706;
    bool _710 = isnan(_702);
    bool _712 = _708 || _710;
    float _714 = -_700;
    bool _716 = _680 >= _714;
    bool _718 = isnan(_680);
    bool _720 = _716 || _718;
    bool _722 = isnan(_714);
    bool _724 = _720 || _722;
    int _726 = _712 ? 0 : 1;
    int _728 = 2;
    if (_712)
    {
        _728 = 1;
    }
    int _730 = _728;
    int _732 = _730;
    if (_724)
    {
        _732 = _726;
    }
    int _734 = _732;
    int _736 = _734 << 6;
    int _738 = _736 + 96;
    uint _740 = uint(int(uint(_738) >> uint(2)));
    float _742 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_740)]);
    int _744 = _738 + 4;
    uint _746 = uint(int(uint(_744) >> uint(2)));
    float _748 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_746)]);
    int _750 = _738 + 8;
    uint _752 = uint(int(uint(_750) >> uint(2)));
    float _754 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_752)]);
    int _756 = _738 + 12;
    uint _758 = uint(int(uint(_756) >> uint(2)));
    float _760 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_758)]);
    int _762 = _736 + 48;
    int _764 = _736 + 64;
    uint _766 = uint(int(uint(_762) >> uint(2)));
    float _768 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_766)]);
    int _770 = _762 + 4;
    uint _772 = uint(int(uint(_770) >> uint(2)));
    float _774 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_772)]);
    int _776 = _762 + 8;
    uint _778 = uint(int(uint(_776) >> uint(2)));
    float _780 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_778)]);
    int _782 = _762 + 12;
    uint _784 = uint(int(uint(_782) >> uint(2)));
    float _786 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_784)]);
    uint _788 = uint(int(uint(_764) >> uint(2)));
    float _790 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_788)]);
    int _792 = _764 + 4;
    uint _794 = uint(int(uint(_792) >> uint(2)));
    float _796 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_794)]);
    int _798 = _764 + 8;
    uint _800 = uint(int(uint(_798) >> uint(2)));
    float _802 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_800)]);
    int _804 = _764 + 12;
    uint _806 = uint(int(uint(_804) >> uint(2)));
    float _808 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_806)]);
    int _810 = _736 + 80;
    float _812 = _682 + 1.0;
    float _814 = _812 + _664;
    uint _816 = uint(int(uint(_810) >> uint(2)));
    float _818 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_816)]);
    int _820 = _810 + 4;
    uint _822 = uint(int(uint(_820) >> uint(2)));
    float _824 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_822)]);
    int _826 = _810 + 8;
    uint _828 = uint(int(uint(_826) >> uint(2)));
    float _830 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_828)]);
    int _832 = _810 + 12;
    uint _834 = uint(int(uint(_832) >> uint(2)));
    float _836 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_834)]);
    float _838 = _814 * _686;
    float _840 = fma(_684, _666, _838);
    float _842 = fma(_688, _668, _840);
    float _844 = _690 + _842;
    float _846 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[508]);
    float _848 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[509]);
    float _850 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[510]);
    float _852 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[511]);
    float _854 = trunc(_844);
    int _856 = int(_854);
    int _858 = ~as_type<int>(_692);
    int _860 = _856 + _858;
    int _862 = _860 + 1;
    float _864 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[502]);
    bool _866 = _862 >= 0;
    int _868 = as_type<int>(_664);
    float _870 = as_type<float>(_734);
    if (_866)
    {
        float _872 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[500]);
        _868 = as_type<int>(_872);
    }
    int _874 = _868;
    float _876 = _814 * _748;
    float _878 = fma(_742, _666, _876);
    float _880 = fma(_754, _668, _878);
    float _882 = _760 + _880;
    float _884 = _814 * _774;
    float _886 = 1.0 / _882;
    float _888 = fma(_768, _666, _884);
    float _890 = _814 * _796;
    float _892 = fma(_780, _668, _888);
    float _894 = fma(_790, _666, _890);
    float _896 = _786 + _892;
    float _898 = fma(_802, _668, _894);
    float _900 = _896 * _886;
    float _902 = _808 + _898;
    bool _904 = _900 >= 0.0;
    float _906 = _902 * _886;
    bool _908 = _900 <= 1.0;
    bool _910 = _908 && _904;
    bool _912 = _906 >= 0.0;
    bool _914 = _912 && _910;
    bool _916 = _906 <= 1.0;
    bool _918 = _916 && _914;
    float _920 = _814 * _824;
    float _922 = fma(_818, _666, _920);
    if (_918)
    {
        float _924 = float(_734);
        _870 = _924;
    }
    float _926 = _870;
    float _928 = _896;
    if (_918)
    {
        float _930 = rint(_926);
        float _932 = precise::max(_930, 0.0);
        uint _934 = uint(_932);
        uint _936 = clamp(_934, 0u, 65535u);
        _928 = as_type<float>(_936);
    }
    float _938 = _928;
    float _940 = fma(_830, _668, _922);
    float _942 = _836 + _940;
    float _944 = _942 * _886;
    float _946 = _938;
    if (_918)
    {
        float3 _3578 = float3(_900, _906, float(as_type<int>(_938)));
        float3 _3582 = select(_3578, float3(0.0), isnan(_3578));
        float _948 = spvDepthCast(spvDescriptorSet0.cp_t_tcb_16).sample_compare(spvDescriptorSet0.cp_t_tcb_16Smplr, _3582.xy, uint(rint(_3582.z)), _944, level(0.0));
        _946 = _948;
    }
    float _950 = _946;
    float _952 = _814 * _848;
    float _954 = fma(_846, _666, _952);
    float _956 = fma(_850, _668, _954);
    bool _958 = _874 <= _862;
    bool _960 = !_866;
    bool _962 = _958 || _960;
    float _964 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
    float _966 = _852 + _956;
    float _968 = trunc(_966);
    int _970 = int(_968);
    int _972 = ~as_type<int>(_864);
    int _974 = _970 + _972;
    int _976 = _974 + 1;
    bool _978 = _976 < 0;
    bool _980 = _978 || _962;
    int _982 = as_type<int>(_852);
    float _984 = as_type<float>(_970);
    if (!_980)
    {
        float _986 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[500]);
        _982 = as_type<int>(_986);
    }
    int _988 = _982;
    bool _990 = _988 <= _976;
    bool _992 = _990 || _980;
    if (_992)
    {
        _984 = 1.0;
    }
    float _994 = _984;
    float _996 = _994;
    if (!_992)
    {
        float _998 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[500]);
        int _1000 = _976 * as_type<int>(_998);
        int _1002 = _1000 + _862;
        int _1004 = _1002 << 2;
        uint _1006 = uint(int(uint(_1002) >> uint(2)));
        int _1008 = 12 & _1004;
        int _1010 = int(_1006) << 4;
        int _1012 = _1010 + _1008;
        int _1014 = _1012 + 400;
        uint _1016 = uint(int(uint(_1014) >> uint(2)));
        float _1018 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1016)]);
        float _1020 = floor(_844);
        float _1022 = floor(_966);
        float _1024 = -_1020;
        float _1026 = _844 + _1024;
        float _1028 = -_1022;
        float _1030 = _966 + _1028;
        float _1032 = rint(_1018);
        float _1034 = precise::max(_1032, 0.0);
        uint _1036 = uint(_1034);
        uint _1038 = clamp(_1036, 0u, 65535u);
        float3 _3720 = float3(_1026, _1030, float(int(_1038)));
        float3 _3722 = select(_3720, float3(0.0), isnan(_3720));
        float _1040 = dm_bs(spvDescriptorSet0.cp_t_tcb_14.sample(spvDescriptorSet0.cp_t_tcb_14Smplr, _3722.xy, uint(rint(_3722.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_14, spvDescriptorSet0.cp_t_tcb_14Smplr_w, _3722.xy, uint(rint(_3722.z)), level(0.0)).x;
        int _1042 = _1002 << 4;
        int _1044 = _1042 + 2048;
        uint _1046 = uint(int(uint(_1044) >> uint(2)));
        float _1048 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1046)]);
        int _1050 = _1044 + 4;
        uint _1052 = uint(int(uint(_1050) >> uint(2)));
        float _1054 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1052)]);
        int _1056 = _1044 + 8;
        uint _1058 = uint(int(uint(_1056) >> uint(2)));
        float _1060 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1058)]);
        int _1062 = _1044 + 12;
        uint _1064 = uint(int(uint(_1062) >> uint(2)));
        float _1066 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1064)]);
        float _1068 = _814 * _1054;
        float _1070 = fma(_1048, _666, _1068);
        float _1072 = fma(_1060, _668, _1070);
        float _1074 = _1066 + _1072;
        float _1076 = precise::clamp(_1074, 0.0, 1.0);
        float _1078 = -_1076;
        float _1080 = _1078 + _1040;
        float _1082 = fma(_1080, 500.0, 1.5);
        float _1084 = exp2(_1082);
        float _1086 = 0.0 + _1084;
        float _1088 = precise::clamp(_1086, 0.0, 1.0);
        _996 = _1088;
    }
    float _1090 = _996;
    uint _1092 = uint(int(uint(_182) >> uint(2)));
    float _1094 = as_type<float>((*spvDescriptorSet0.cp_s13)._m0[int(_1092)]);
    float _1096 = abs(_226);
    float _1098 = log2(_1096);
    float _1100 = _188 * _228;
    float _1102 = _410 * _1100;
    float _1104 = _412 * _1100;
    float _1106 = _414 * _1100;
    float _1108 = _1100;
    if (!_918)
    {
        _1108 = 1.0;
    }
    float _1110 = _1108;
    float _1112 = _1110;
    if (_918)
    {
        bool _1114 = _950 >= _944;
        bool _1116 = isnan(_950);
        bool _1118 = _1114 || _1116;
        bool _1120 = isnan(_944);
        bool _1122 = _1118 || _1120;
        float _1124 = float(_1122);
        _1112 = _1124;
    }
    float _1126 = _1112;
    float _1128 = -_1126;
    float _1130 = fma(_1128, _1090, 1.0);
    float _1132 = _188 * _1098;
    float _1134 = -_328;
    float _1136 = _964 + _1134;
    float _1138 = exp2(_1132);
    bool _1140 = _1136 > 0.001000000047497451305389404296875;
    bool _1142 = isnan(_1136);
    bool _1144 = _1140 || _1142;
    bool _1146 = isnan(0.001000000047497451305389404296875);
    bool _1148 = _1144 || _1146;
    float _1150 = fma(_202, _1138, _1104);
    float _1152 = fma(_196, _1138, _1102);
    float _1154 = fma(_208, _1138, _1106);
    float _1156 = -_1094;
    float _1158 = _1130 + _1156;
    float _1160 = _1130;
    float _1162 = _1136;
    float _1164 = _1150;
    if (_1148)
    {
        float _1166 = fma(_1158, 0.0500000007450580596923828125, _1094);
        _1160 = _1166;
    }
    float _1168 = _1160;
    float _1170 = precise::max(0.0, _1168);
    float _1172 = precise::min(_1170, 0.999000012874603271484375);
    uint _1174 = uint(int(uint(_182) >> uint(2)));
    (*spvDescriptorSet0.cp_s13)._m0[int(_1174)] = as_type<uint>(_1172);
    float _1176 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[114]);
    float _1178 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[112]);
    float _1180 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[116]);
    float _1182 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[118]);
    float _1184 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[74]);
    float _1186 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[73]);
    float _1188 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[30]);
    float _1190 = _1176 * _1176;
    float _1192 = fma(_1178, _1178, _1190);
    float _1194 = rsqrt(_1192);
    float _1196 = _1194 * (-20.0);
    float _1198 = fma(_1178, _1196, _1180);
    float _1200 = fma(_1176, _1196, _1182);
    float _1202 = _1198 * 0.5;
    float _1204 = _1200 * 0.5;
    float _1206 = floor(_1202);
    float _1208 = floor(_1204);
    float _1210 = fma(_1206, 2.0, -32.0);
    float _1212 = -_1210;
    float _1214 = _1212 + _666;
    float _1216 = fma(_666, 6.2500002968590706586837768554688e-05, 0.5);
    float _1218 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[72]);
    float _1220 = fma(_1208, 2.0, -32.0);
    float _1222 = -_1220;
    float _1224 = _1222 + _668;
    float _1226 = _1214 * 0.015625;
    float _1228 = _1224 * 0.015625;
    float2 _4008 = float2(_1226, _1228);
    float4 _1231 = spvDescriptorSet0.cp_t_tcb_26.gather(spvDescriptorSet0.cp_t_tcb_26Smplr, select(_4008, float2(0.0), isnan(_4008)), int2(0), component::x).xyzw;
    float _1233 = _1231.x;
    float _1235 = _1231.y;
    float _1237 = _1231.z;
    float _1239 = _1231.w;
    float2 _4026 = float2(_1226, _1228);
    float4 _1241 = spvDescriptorSet0.cp_t_tcb_26.gather(spvDescriptorSet0.cp_t_tcb_26Smplr, select(_4026, float2(0.0), isnan(_4026)), int2(0), component::y).xyzw;
    float _1243 = _1241.x;
    float _1245 = _1241.y;
    float _1247 = _1241.z;
    float _1249 = _1241.w;
    float _1251 = fma(_668, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _4044 = float2(_1216, _1251);
    float2 _1255 = dm_bs(spvDescriptorSet0.cp_t_tcb_1A.sample(spvDescriptorSet0.cp_t_tcb_1ASmplr, select(_4044, float2(0.0), isnan(_4044)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_1A, spvDescriptorSet0.cp_t_tcb_1ASmplr_w, select(_4044, float2(0.0), isnan(_4044)), level(0.0)).xy;
    float _1257 = _1255.x;
    float _1259 = _1255.y;
    float2 _4056 = float2(_1216, _1251);
    float2 _1261 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_4056, float2(0.0), isnan(_4056)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_4056, float2(0.0), isnan(_4056)), level(0.0)).xy;
    float _1263 = _1261.x;
    float _1265 = _1261.y;
    bool _1267 = _1184 > 0.0;
    bool _1269 = _1186 > 0.0;
    float _1271 = _1184;
    float _1273 = _1206;
    float _1275 = _1186;
    float _1277 = _1224;
    bool _1279 = _1269;
    float _1281 = _1226;
    if (_1267)
    {
        float _1283 = 1.0 / _1184;
        _1271 = _1283;
    }
    float _1285 = _1271;
    if (_1267)
    {
        float _1287 = _1136 * _1285;
        _1162 = _1287;
    }
    float _1289 = _1162;
    if (_1267)
    {
        float _1291 = precise::min(_1289, 1.0);
        _1273 = _1291;
    }
    float _1293 = _1273;
    float _1295 = _1218;
    if (_1269)
    {
        float _1297 = _1218 * _1186;
        _1275 = _1297;
    }
    float _1299 = _1275;
    if (!_1269)
    {
        _1277 = _1218;
    }
    float _1301 = _1277;
    float _1303 = _1301;
    if (_1269)
    {
        float _1305 = -_1299;
        float _1307 = fma(_442, _1305, _1218);
        _1303 = _1307;
    }
    float _1309 = _1303;
    float _1311 = _1309;
    if (_1267)
    {
        float _1313 = _1293 * _1309;
        _1311 = _1313;
    }
    float _1315 = _1311;
    int _1317 = as_type<int>(_1188) & 512;
    bool _1319 = _1317 != 0;
    float _1321 = _1233 + _1235;
    float _1323 = _1243 + _1245;
    float _1325 = _1237 + _1321;
    float _1327 = _1247 + _1323;
    float _1329 = _1239 + _1325;
    float _1331 = _1249 + _1327;
    float _1333 = _1329 * 0.25;
    float _1335 = _1331 * 0.25;
    bool _1337 = !_1319;
    float _1409;
    float _1411;
    if (!_1337)
    {
        float _1339 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _1341 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _1343 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _1345 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _1347 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _1349 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _1351 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _1353 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _1355 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _1357 = _1343 * _1345;
        float _1359 = _1343 * _1347;
        float _1361 = _1341 * _1345;
        float _1363 = -_1357;
        float _1365 = fma(_1339, _1349, _1363);
        float _1367 = -_1359;
        float _1369 = fma(_1341, _1349, _1367);
        float _1371 = -_1361;
        float _1373 = fma(_1339, _1347, _1371);
        float _1375 = _1353 * _1365;
        float _1377 = -_1375;
        float _1379 = fma(_1351, _1369, _1377);
        float _1381 = fma(_1355, _1373, _1379);
        float _1383 = _1355 * _1341;
        float _1385 = _1353 * _1339;
        float _1387 = -_1383;
        float _1389 = fma(_1353, _1343, _1387);
        float _1391 = 1.0 / _1381;
        float _1393 = -_1385;
        float _1395 = fma(_1351, _1341, _1393);
        float _1397 = _1335 * _1391;
        float _1399 = _1333 * _1391;
        float _1401 = _1389 * _1397;
        float _1403 = _1395 * _1397;
        float _1405 = fma(_1369, _1399, _1401);
        float _1407 = fma(_1373, _1399, _1403);
        _1409 = _1407;
        _1411 = _1405;
        _1413 = true;
    }
    else
    {
        int _1415 = as_type<int>(_1188) & 1024;
        bool _1417 = _1415 != 0;
        if (_1417)
        {
            _1279 = true;
        }
        bool _1419 = _1279;
        bool _1421 = _1419;
        if (!_1417)
        {
            int _1423 = as_type<int>(_1188) & 2048;
            bool _1425 = _1423 != 0;
            _1421 = _1425;
        }
        bool _1427 = _1421;
        if (!_1427)
        {
            _1281 = _1333;
        }
        float _1429 = _1281;
        _1411 = _1429;
        if (!_1427)
        {
            _1295 = _1335;
        }
        float _1431 = _1295;
        bool _1433 = !_1427;
        _1409 = _1431;
        if (!_1433)
        {
            uint _1435 = uint(int(uint(_182) >> uint(2)));
            float _1437 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1435)]);
            int _1439 = _182 + 4;
            uint _1441 = uint(int(uint(_1439) >> uint(2)));
            float _1443 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1441)]);
            int _1445 = _182 + 8;
            uint _1447 = uint(int(uint(_1445) >> uint(2)));
            float _1449 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1447)]);
            uint _1451 = uint(int(uint(_182) >> uint(2)));
            float _1453 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1451)]);
            int _1455 = _182 + 4;
            uint _1457 = uint(int(uint(_1455) >> uint(2)));
            float _1459 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1457)]);
            int _1461 = _182 + 8;
            uint _1463 = uint(int(uint(_1461) >> uint(2)));
            float _1465 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1463)]);
            uint _1467 = uint(int(uint(_182) >> uint(2)));
            float _1469 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1467)]);
            int _1471 = _182 + 4;
            uint _1473 = uint(int(uint(_1471) >> uint(2)));
            float _1475 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1473)]);
            int _1477 = _182 + 8;
            uint _1479 = uint(int(uint(_1477) >> uint(2)));
            float _1481 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1479)]);
            float _1483 = _1449 * _1453;
            float _1485 = _1449 * _1459;
            float _1487 = _1443 * _1453;
            float _1489 = -_1483;
            float _1491 = fma(_1437, _1465, _1489);
            float _1493 = -_1485;
            float _1495 = fma(_1443, _1465, _1493);
            float _1497 = -_1487;
            float _1499 = fma(_1437, _1459, _1497);
            float _1501 = _1475 * _1491;
            float _1503 = -_1501;
            float _1505 = fma(_1469, _1495, _1503);
            float _1507 = fma(_1481, _1499, _1505);
            float _1509 = _1481 * _1443;
            float _1511 = _1475 * _1437;
            float _1513 = -_1509;
            float _1515 = fma(_1475, _1449, _1513);
            float _1517 = 1.0 / _1507;
            float _1519 = -_1511;
            float _1521 = fma(_1469, _1443, _1519);
            float _1523 = _1335 * _1517;
            float _1525 = _1333 * _1517;
            float _1527 = _1515 * _1523;
            float _1529 = _1521 * _1523;
            float _1531 = fma(_1495, _1525, _1527);
            float _1533 = fma(_1499, _1525, _1529);
            _1409 = _1533;
            _1411 = _1531;
        }
    }
    _1413 = false;
    float _1535 = _1409;
    float _1537 = _1411;
    float _1539 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[83]);
    float _1541 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[0]);
    float _1543 = _1263 * 2000.0;
    float _1545 = _1265 * 2000.0;
    float _1547 = _1257 + (-0.5);
    float _1549 = _1259 + (-0.5);
    float _1551 = _1315 * _1535;
    bool _1553 = _1545 >= _1543;
    float _1555 = _1535;
    float _1557 = _1547;
    if (!_1553)
    {
        _1555 = 0.0;
    }
    float _1559 = _1555;
    bool _1561 = _1539 != 0.0;
    bool _1563 = isnan(_1539);
    bool _1565 = _1561 || _1563;
    bool _1567 = isnan(0.0);
    bool _1569 = _1565 || _1567;
    float _1571 = _1541 * 2.0;
    float _1573 = _1547 * _1571;
    float _1575 = _1549 * _1571;
    float _1577 = _1315 * _1537;
    float _1579 = _1573;
    float _1581 = _1575;
    float _1583 = _1559;
    int _1585 = _1569 ? (-1) : 0;
    float _1587 = _1539;
    float _1589 = _1577;
    if (_1569)
    {
        float _1591 = _1573 * _1539;
        _1579 = _1591;
    }
    float _1593 = _1579;
    float _1595 = _1593;
    if (_1569)
    {
        float _1597 = _1575 * _1539;
        _1581 = _1597;
    }
    float _1599 = _1581;
    bool _1601 = !_1553;
    float _1603 = _1599;
    if (!_1601)
    {
        float2 _4572 = float2(_1216, _1251);
        float _1605 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_4572, float2(0.0), isnan(_4572)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_4572, float2(0.0), isnan(_4572)), level(0.0)).y;
        float _1607 = _1605 * 2000.0;
        bool _1609 = _1545 >= _1607;
        bool _1611 = !_1609;
        _1585 = _1609 ? (-1) : 0;
        if (!_1611)
        {
            float _1613 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[2606]);
            float _1615 = precise::max(_1613, 0.001000000047497451305389404296875);
            float _1617 = -_1263;
            float _1619 = _1617 + _1265;
            float _1621 = 1.0 / _1615;
            float _1623 = _1619 * 2000.0;
            float _1625 = _1623 * _1621;
            float _1627 = precise::clamp(_1625, 0.0, 1.0);
            _1583 = _1627;
            _1629 = true;
        }
        else
        {
            float _1631 = -_1265;
            float _1633 = _1631 + _1605;
            float _1635 = _1633 * 10000.0;
            float _1637 = precise::clamp(_1635, 0.0, 1.0);
            float _1639 = -_1637;
            float _1641 = _1639 + 1.0;
            _1583 = _1641;
        }
    }
    _1629 = false;
    float _1643 = _1583;
    int _1645 = _1585;
    float _1647 = _1593 * _1643;
    float _1649 = _1599 * _1643;
    bool _1651 = !_1319;
    int _1653 = _1645;
    float _1655 = _1649;
    float _1657 = _1647;
    if (!_1651)
    {
        float _1659 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _1661 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _1663 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _1665 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _1667 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _1669 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _1671 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _1673 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _1675 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _1677 = _1663 * _1665;
        float _1679 = _1663 * _1667;
        float _1681 = -_1677;
        float _1683 = fma(_1659, _1669, _1681);
        float _1685 = -_1679;
        float _1687 = fma(_1661, _1669, _1685);
        float _1689 = _1661 * _1665;
        float _1691 = _1673 * _1683;
        float _1693 = -_1689;
        float _1695 = fma(_1659, _1667, _1693);
        float _1697 = _1673 * _1659;
        float _1699 = -_1691;
        float _1701 = fma(_1671, _1687, _1699);
        float _1703 = -_1697;
        float _1705 = fma(_1671, _1661, _1703);
        float _1707 = fma(_1675, _1695, _1701);
        float _1709 = _1675 * _1661;
        float _1711 = 1.0 / _1707;
        float _1713 = -_1709;
        float _1715 = fma(_1673, _1663, _1713);
        float _1717 = _1649 * _1711;
        float _1719 = _1647 * _1711;
        float _1721 = _1715 * _1717;
        float _1723 = _1705 * _1717;
        float _1725 = fma(_1687, _1719, _1721);
        float _1727 = fma(_1695, _1719, _1723);
        _1655 = _1727;
        _1587 = _1673;
        _1603 = _1719;
        _1657 = _1725;
        _1595 = _1695;
        _1729 = true;
    }
    else
    {
        int _1731 = as_type<int>(_1188) & 1024;
        bool _1733 = _1731 != 0;
        if (_1733)
        {
            _1653 = -1;
        }
        int _1735 = _1653;
        int _1737 = _1735;
        if (!_1733)
        {
            int _1739 = as_type<int>(_1188) & 2048;
            bool _1741 = _1739 != 0;
            _1737 = _1741 ? (-1) : 0;
        }
        int _1743 = _1737;
        int _1745 = ~_1743;
        if (!(_1745 != 0))
        {
            uint _1747 = uint(int(uint(_182) >> uint(2)));
            float _1749 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1747)]);
            int _1751 = _182 + 4;
            uint _1753 = uint(int(uint(_1751) >> uint(2)));
            float _1755 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1753)]);
            int _1757 = _182 + 8;
            uint _1759 = uint(int(uint(_1757) >> uint(2)));
            float _1761 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1759)]);
            uint _1763 = uint(int(uint(_182) >> uint(2)));
            float _1765 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1763)]);
            int _1767 = _182 + 4;
            uint _1769 = uint(int(uint(_1767) >> uint(2)));
            float _1771 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1769)]);
            int _1773 = _182 + 8;
            uint _1775 = uint(int(uint(_1773) >> uint(2)));
            float _1777 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1775)]);
            uint _1779 = uint(int(uint(_182) >> uint(2)));
            float _1781 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1779)]);
            int _1783 = _182 + 4;
            uint _1785 = uint(int(uint(_1783) >> uint(2)));
            float _1787 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1785)]);
            int _1789 = _182 + 8;
            uint _1791 = uint(int(uint(_1789) >> uint(2)));
            float _1793 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1791)]);
            float _1795 = _1761 * _1765;
            float _1797 = _1761 * _1771;
            float _1799 = -_1795;
            float _1801 = fma(_1749, _1777, _1799);
            float _1803 = -_1797;
            float _1805 = fma(_1755, _1777, _1803);
            float _1807 = _1755 * _1765;
            float _1809 = _1787 * _1801;
            float _1811 = -_1807;
            float _1813 = fma(_1749, _1771, _1811);
            float _1815 = _1787 * _1749;
            float _1817 = -_1809;
            float _1819 = fma(_1781, _1805, _1817);
            float _1821 = -_1815;
            float _1823 = fma(_1781, _1755, _1821);
            float _1825 = fma(_1793, _1813, _1819);
            float _1827 = _1793 * _1755;
            float _1829 = 1.0 / _1825;
            float _1831 = -_1827;
            float _1833 = fma(_1787, _1761, _1831);
            float _1835 = _1649 * _1829;
            float _1837 = _1647 * _1829;
            float _1839 = _1833 * _1835;
            float _1841 = _1823 * _1835;
            float _1843 = fma(_1805, _1837, _1839);
            float _1845 = fma(_1813, _1837, _1841);
            _1655 = _1845;
            _1587 = _1787;
            _1603 = _1837;
            _1657 = _1843;
            _1595 = _1813;
        }
    }
    _1729 = false;
    float _1847 = _1655;
    float _1849 = _1587;
    float _1851 = _1603;
    float _1853 = _1657;
    float _1855 = _1595;
    bool _1857 = _1263 != 0.0;
    bool _1859 = isnan(_1263);
    bool _1861 = _1857 || _1859;
    bool _1863 = isnan(0.0);
    bool _1865 = _1861 || _1863;
    float _1867 = _1849;
    float _1869 = _1851;
    float _1871 = _1855;
    float _1873 = _1847;
    float _1875 = _1853;
    if (!_1865)
    {
        _1557 = 4.0;
    }
    float _1877 = _1557;
    float _1879 = _1265;
    if (!_1865)
    {
        float2 _4990 = float2(_1216, _1251);
        float _1881 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_4990, float2(0.0), isnan(_4990)), level(_1877)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_4990, float2(0.0), isnan(_4990)), level(_1877)).y;
        _1879 = _1881;
    }
    float _1883 = _1879;
    float _1885 = _1263;
    if (_1148)
    {
        float _1887 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
        _1885 = _1887;
    }
    float _1889 = _1885;
    float _1891 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[76]);
    if (_1148)
    {
        float _1893 = -_1154;
        float _1895 = _1893 + _1551;
        _1867 = _1895;
    }
    float _1897 = _1867;
    float _1899 = _1897;
    if (_1148)
    {
        float _1901 = -_1154;
        float _1903 = _1901 + _1847;
        _1869 = _1903;
    }
    float _1905 = _1869;
    if (_1148)
    {
        float _1907 = -_1152;
        float _1909 = _1907 + _1577;
        _1589 = _1909;
    }
    float _1911 = _1589;
    float _1913 = _1911;
    if (_1148)
    {
        float _1915 = fma(_1897, 0.5, _1905);
        _1899 = _1915;
    }
    float _1917 = _1899;
    int _1919 = _182 + 4;
    float _1921 = _1889;
    if (_1148)
    {
        float _1923 = precise::max(_1889, 1.0);
        _1871 = _1923;
    }
    float _1925 = _1871;
    if (_1148)
    {
        float _1927 = -_1152;
        float _1929 = _1927 + _1853;
        _1921 = _1929;
    }
    float _1931 = _1921;
    float _1933 = fma(_1883, 2000.0, _1891);
    if (_1148)
    {
        float _1935 = fma(_1911, 0.5, _1931);
        _1913 = _1935;
    }
    float _1937 = _1913;
    float _1939 = _1925;
    if (_1148)
    {
        float _1941 = 1.0 / _1925;
        _1939 = _1941;
    }
    float _1943 = _1939;
    uint _1945 = uint(int(uint(_1919) >> uint(2)));
    (*spvDescriptorSet0.cp_s13)._m0[int(_1945)] = as_type<uint>(_1933);
    if (_1148)
    {
        float _1947 = fma(_1917, _1943, _1154);
        _1873 = _1947;
    }
    float _1949 = _1873;
    float _1951 = _310 + _1933;
    float _1953 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[76]);
    float _1955 = _1951;
    if (_1148)
    {
        float _1957 = fma(_1937, _1943, _1152);
        _1875 = _1957;
    }
    float _1959 = _1875;
    float _1961 = fma(_1883, 2000.0, _1953);
    bool _1963 = _1951 >= _1961;
    bool _1965 = isnan(_1951);
    bool _1967 = _1963 || _1965;
    bool _1969 = isnan(_1961);
    bool _1971 = _1967 || _1969;
    if (!_1971)
    {
        float _1973 = -_1933;
        float _1975 = _1973 + _1961;
        _1955 = _1975;
    }
    float _1977 = _1955;
    int _1979 = as_type<int>(_1977);
    if (!_1971)
    {
        float _1981 = _310 * 0.9900000095367431640625;
        _336 = _1981;
    }
    float _1983 = _336;
    if (!_1971)
    {
        float _1985 = fma(_1977, 0.00999999977648258209228515625, _1933);
        _1979 = as_type<int>(_1985);
    }
    int _1987 = _1979;
    int _1989 = _182 + 8;
    if (!_1971)
    {
        _1164 = 0.0;
    }
    float _1991 = _1164;
    if (!_1971)
    {
        uint _1993 = uint(int(uint(_1919) >> uint(2)));
        (*spvDescriptorSet0.cp_s13)._m0[int(_1993)] = uint(_1987);
    }
    uint _1995 = uint(int(uint(_186) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1995)] = as_type<uint>(_348);
    float _1997 = -_218;
    float _1999 = _1997 + _1983;
    uint _2001 = uint(int(uint(_182) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2001)] = as_type<uint>(_314);
    uint _2003 = uint(int(uint(_1919) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2003)] = as_type<uint>(_1983);
    uint _2005 = uint(int(uint(_1989) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2005)] = as_type<uint>(_316);
    uint _2007 = uint(int(uint(_182) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_2007)] = as_type<uint>(_1959);
    uint _2009 = uint(int(uint(_1919) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_2009)] = as_type<uint>(_1991);
    uint _2011 = uint(int(uint(_1989) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_2011)] = as_type<uint>(_1949);
    uint _2013 = uint(int(uint(_182) >> uint(2)));
    (*spvDescriptorSet0.cp_s5)._m0[int(_2013)] = as_type<uint>(_308);
    uint _2015 = uint(int(uint(_1919) >> uint(2)));
    (*spvDescriptorSet0.cp_s5)._m0[int(_2015)] = as_type<uint>(_1999);
    uint _2017 = uint(int(uint(_1989) >> uint(2)));
    (*spvDescriptorSet0.cp_s5)._m0[int(_2017)] = as_type<uint>(_312);
    float _2019 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _2021 = _1999 * _1999;
    float _2023 = fma(_308, _308, _2021);
    float _2025 = fma(_312, _312, _2023);
    float _2027 = sqrt(_2025);
    float _2029 = _1991 * _1991;
    float _2031 = fma(_1959, _1959, _2029);
    float _2033 = fma(_1949, _1949, _2031);
    float _2035 = sqrt(_2033);
    bool _2037 = _2027 >= 9.9999999747524270787835121154785e-07;
    bool _2039 = isnan(_2027);
    bool _2041 = _2037 || _2039;
    bool _2043 = isnan(9.9999999747524270787835121154785e-07);
    bool _2045 = _2041 || _2043;
    int _2061;
    if (!_2045)
    {
        bool _2047 = _964 != _328;
        bool _2049 = isnan(_964);
        bool _2051 = _2047 || _2049;
        bool _2053 = isnan(_328);
        bool _2055 = _2051 || _2053;
        if (_2055)
        {
            _338 = as_type<int>(_420);
        }
        int _2057 = _338;
        int _2059 = _2057;
        _2061 = _2057;
        _2063 = _2055;
        if (!_2063)
        {
            float _2065 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
            bool _2067 = _2065 > 0.0;
            bool _2069 = !_2067;
            if (!_2069)
            {
                float _2071 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
                float _2073 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
                float _2075 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
                float _2077 = _2073 * _2073;
                float _2079 = fma(_2071, _2071, _2077);
                float _2081 = fma(_2075, _2075, _2079);
                float _2083 = rsqrt(_2081);
                float _2085 = _2083 * 9.9999999747524270787835121154785e-07;
                float _2087 = _2071 * _2085;
                float _2089 = _2073 * _2085;
                float _2091 = _2075 * _2085;
                _2061 = as_type<int>(_2087);
                _472 = as_type<int>(_2089);
                _474 = as_type<int>(_2091);
                _2063 = true;
            }
            else
            {
                bool _2093 = _2035 >= 9.9999999747524270787835121154785e-07;
                bool _2095 = isnan(_2035);
                bool _2097 = _2093 || _2095;
                bool _2099 = isnan(9.9999999747524270787835121154785e-07);
                bool _2101 = _2097 || _2099;
                if (!_2101)
                {
                    float _2103 = _1983 * _1983;
                    float _2105 = fma(_314, _314, _2103);
                    float _2107 = fma(_316, _316, _2105);
                    float _2109 = sqrt(_2107);
                    bool _2111 = _2109 >= 9.9999999747524270787835121154785e-07;
                    bool _2113 = isnan(_2109);
                    bool _2115 = _2111 || _2113;
                    bool _2117 = isnan(9.9999999747524270787835121154785e-07);
                    bool _2119 = _2115 || _2117;
                    float _2121 = _2109;
                    if (_2119)
                    {
                        float _2123 = rsqrt(_2107);
                        _2121 = _2123;
                    }
                    float _2125 = _2121;
                    if (!_2119)
                    {
                        _2059 = 0;
                    }
                    int _2127 = _2059;
                    int _2129 = _2127;
                    if (!_2119)
                    {
                        _464 = 897988541;
                    }
                    int _2131 = _464;
                    int _2133 = _2131;
                    if (!_2119)
                    {
                        _466 = 0;
                    }
                    int _2135 = _466;
                    float _2137 = _2125;
                    int _2139 = _2135;
                    if (_2119)
                    {
                        float _2141 = _2125 * 9.9999999747524270787835121154785e-07;
                        _2137 = _2141;
                    }
                    float _2143 = _2137;
                    if (_2119)
                    {
                        float _2145 = _314 * _2143;
                        _2129 = as_type<int>(_2145);
                    }
                    int _2147 = _2129;
                    _2061 = _2147;
                    if (_2119)
                    {
                        float _2149 = _1983 * _2143;
                        _2133 = as_type<int>(_2149);
                    }
                    int _2151 = _2133;
                    _472 = _2151;
                    if (_2119)
                    {
                        float _2153 = _316 * _2143;
                        _2139 = as_type<int>(_2153);
                    }
                    int _2155 = _2139;
                    _474 = _2155;
                    _2063 = true;
                }
                else
                {
                    float _2157 = rsqrt(_2033);
                    float _2159 = _2157 * 9.9999999747524270787835121154785e-07;
                    float _2161 = _1959 * _2159;
                    float _2163 = _1991 * _2159;
                    float _2165 = _1949 * _2159;
                    _2061 = as_type<int>(_2161);
                    _472 = as_type<int>(_2163);
                    _474 = as_type<int>(_2165);
                    _2063 = true;
                }
            }
        }
    }
    else
    {
        float _2167 = _2035 * _2019;
        bool _2169 = _2167 >= 0.001000000047497451305389404296875;
        bool _2171 = isnan(_2167);
        bool _2173 = _2169 || _2171;
        bool _2175 = isnan(0.001000000047497451305389404296875);
        bool _2177 = _2173 || _2175;
        bool _2179 = _2167 > 0.0;
        bool _2181 = !_2177;
        bool _2183 = _2179 && _2181;
        bool _2185 = _2027 < 0.001000000047497451305389404296875;
        bool _2187 = _2185 && _2183;
        if (!_2187)
        {
            _468 = as_type<int>(_1999);
        }
        int _2189 = _468;
        int _2191 = _2189;
        if (_2187)
        {
            float _2193 = _2019 * _1959;
            _340 = as_type<int>(_2193);
        }
        int _2195 = _340;
        _2061 = _2195;
        if (!_2187)
        {
            _470 = as_type<int>(_312);
        }
        int _2197 = _470;
        _474 = _2197;
        if (_2187)
        {
            float _2199 = _2019 * _1991;
            _2191 = as_type<int>(_2199);
        }
        int _2201 = _2191;
        _472 = _2201;
        if (_2187)
        {
            float _2203 = _2019 * _1949;
            _474 = as_type<int>(_2203);
        }
    }
    _2063 = false;
    int _2205 = _2061;
    int _2207 = _472;
    int _2209 = _474;
    uint _2211 = uint(int(uint(_182) >> uint(2)));
    (*spvDescriptorSet0.cp_s5)._m0[int(_2211)] = uint(_2205);
    uint _2213 = uint(int(uint(_1919) >> uint(2)));
    (*spvDescriptorSet0.cp_s5)._m0[int(_2213)] = uint(_2207);
    uint _2215 = uint(int(uint(_1989) >> uint(2)));
    (*spvDescriptorSet0.cp_s5)._m0[int(_2215)] = uint(_2209);
}

