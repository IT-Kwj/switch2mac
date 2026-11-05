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
    texture2d_array<float> cp_t_tcb_16 [[id(14)]];
    sampler cp_t_tcb_16Smplr [[id(15)]];
    texture2d_array<float> cp_t_tcb_14 [[id(16)]];
    sampler cp_t_tcb_14Smplr [[id(17)]];
    texture2d<float> cp_t_tcb_26 [[id(18)]];
    sampler cp_t_tcb_26Smplr [[id(19)]];
    texture2d<float> cp_t_tcb_2C [[id(20)]];
    sampler cp_t_tcb_2CSmplr [[id(21)]];
    sampler cp_t_tcb_14Smplr_w [[id(22)]];
    sampler cp_t_tcb_2CSmplr_w [[id(23)]];
    constant dm_border_t* dm_border [[id(24)]];
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]])
{
    bool _1633 = false;
    bool _1389 = false;
    float _80 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[9]);
    float _82 = as_type<float>(gl_LocalInvocationID.x);
    float _84 = as_type<float>(gl_WorkGroupID.x);
    int _87 = as_type<int>(_84) << 5;
    int _89 = _87 + as_type<int>(_82);
    float _91 = trunc(_80);
    int _93 = int(_91);
    bool _97 = _89 >= _93;
    int _99 = 0;
    if (_97)
    {
        _99 = 0;
    }
    int _101 = _99;
    int _103 = _101;
    int _105 = _101;
    if (!_97)
    {
        int _107 = _89 << 4;
        int _109 = _107 + 12;
        uint _112 = uint(int(uint(_109) >> uint(2)));
        float _114 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_112)]);
        float _116 = trunc(_114);
        int _118 = int(_116);
        bool _120 = _118 >= 1;
        int _122 = _120 ? (-1) : 0;
        if (!_120)
        {
            _103 = 0;
        }
        int _124 = _103;
        bool _126 = !_120;
        _105 = _124;
        if (!_126)
        {
            float _128 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
            uint _130 = uint(int(uint(_109) >> uint(2)));
            float _132 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_130)]);
            float _134 = float(_118);
            float _136 = -_132;
            float _138 = _128 + _136;
            bool _140 = _138 > _134;
            int _142 = as_type<int>(_128);
            if (!_140)
            {
                bool _144 = _128 >= _132;
                bool _146 = isnan(_128);
                bool _148 = _144 || _146;
                bool _150 = isnan(_132);
                bool _152 = _148 || _150;
                _122 = _152 ? (-1) : 0;
            }
            int _154 = _122;
            if (_140)
            {
                _142 = 0;
            }
            int _156 = _142;
            _105 = _156;
            if (!_140)
            {
                int _158 = ~_154;
                int _160 = (_158 != 0) ? 0 : 1;
                _105 = _160;
            }
        }
    }
    int _162 = _105;
    int _164 = _162 & 1;
    bool _166 = _164 != 0;
    if (!_166)
    {
        return;
    }
    int _168 = _89 << 4;
    float _170 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[30]);
    int _172 = _168 + 12;
    float _174 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    uint _176 = uint(int(uint(_172) >> uint(2)));
    float _178 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_176)]);
    uint _180 = uint(int(uint(_168) >> uint(2)));
    float _182 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_180)]);
    int _184 = _168 + 4;
    uint _186 = uint(int(uint(_184) >> uint(2)));
    float _188 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_186)]);
    int _190 = _168 + 8;
    uint _192 = uint(int(uint(_190) >> uint(2)));
    float _194 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_192)]);
    uint _196 = uint(int(uint(_168) >> uint(2)));
    float _198 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_196)]);
    int _200 = _168 + 4;
    uint _202 = uint(int(uint(_200) >> uint(2)));
    float _204 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_202)]);
    int _206 = _168 + 8;
    uint _208 = uint(int(uint(_206) >> uint(2)));
    float _210 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_208)]);
    float _212 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[68]);
    float _214 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
    uint _216 = uint(int(uint(_172) >> uint(2)));
    float _218 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_216)]);
    int _220 = as_type<int>(_170) & 512;
    bool _222 = _220 != 0;
    uint _224 = uint(int(uint(_172) >> uint(2)));
    float _226 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_224)]);
    float _228 = 0.0;
    float _230 = 0.0;
    float _232 = 0.0;
    float _234 = 0.0;
    if (_222)
    {
        float _236 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _238 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _240 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _242 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        _228 = _236;
        _230 = _238;
        _232 = _240;
        _234 = _242;
    }
    float _244 = _228;
    float _246 = _230;
    float _248 = _232;
    float _250 = _234;
    float _252 = 0.0;
    float _254 = 0.0;
    float _256 = 0.0;
    float _258 = 0.0;
    if (_222)
    {
        float _260 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _262 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _264 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _266 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        _252 = _260;
        _254 = _262;
        _256 = _264;
        _258 = _266;
    }
    float _268 = _252;
    float _270 = _254;
    float _272 = _256;
    float _274 = _258;
    float _276 = _178 * _174;
    float _278 = 0.0;
    float _280 = 0.0;
    float _282 = 0.0;
    float _284 = 0.0;
    float _286 = _198;
    float _288 = _210;
    if (_222)
    {
        float _290 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _292 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _294 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _296 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        _278 = _290;
        _280 = _292;
        _282 = _294;
        _284 = _296;
    }
    float _298 = _278;
    float _300 = _280;
    float _302 = _282;
    float _304 = _284;
    float _306 = _188 * _276;
    float _308 = _182 * _276;
    float _310 = _194 * _276;
    float _312 = _204 + _306;
    float _314 = _198 + _308;
    float _316 = _210 + _310;
    int _318 = as_type<int>(_170) & 1024;
    bool _320 = _318 != 0;
    int _322 = as_type<int>(_170) & 2048;
    bool _324 = _322 != 0;
    float _326 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
    float _328 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
    float _330 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
    float _332 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
    float _334 = _244;
    float _336 = _246;
    int _338 = as_type<int>(_308);
    int _340 = as_type<int>(_308);
    if (_222)
    {
        float _342 = _312 * _246;
        _286 = _342;
    }
    float _344 = _286;
    float _346 = _344;
    if (_222)
    {
        float _348 = _312 * _270;
        _288 = _348;
    }
    float _350 = _288;
    float _352 = _350;
    if (_222)
    {
        float _354 = fma(_314, _244, _344);
        _346 = _354;
    }
    float _356 = _346;
    float _358 = _356;
    if (_222)
    {
        float _360 = fma(_314, _268, _350);
        _352 = _360;
    }
    float _362 = _352;
    float _364 = _362;
    if (_222)
    {
        float _366 = fma(_316, _248, _356);
        _358 = _366;
    }
    float _368 = _358;
    if (_222)
    {
        float _370 = fma(_316, _272, _362);
        _364 = _370;
    }
    float _372 = _364;
    if (!_222)
    {
        _334 = 0.0;
        _336 = 0.0;
    }
    float _374 = _334;
    float _376 = _336;
    float _378 = _376;
    float _380 = _374;
    if (_222)
    {
        float _382 = _250 + _368;
        _378 = _382;
    }
    float _384 = _378;
    if (_222)
    {
        float _386 = _274 + _372;
        _380 = _386;
    }
    float _388 = _380;
    uint _390 = uint(int(uint(_168) >> uint(2)));
    float _392 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_390)]);
    int _394 = _168 + 4;
    uint _396 = uint(int(uint(_394) >> uint(2)));
    float _398 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_396)]);
    int _400 = _168 + 8;
    uint _402 = uint(int(uint(_400) >> uint(2)));
    float _404 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_402)]);
    int _406 = _168 + 12;
    uint _408 = uint(int(uint(_406) >> uint(2)));
    float _410 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_408)]);
    float _412 = _300;
    float _414 = _302;
    float _416 = _332;
    float _418 = _328;
    if (_222)
    {
        float _420 = _312 * _300;
        _412 = _420;
    }
    float _422 = _412;
    float _424 = _422;
    if (_222)
    {
        float _426 = fma(_314, _298, _422);
        _424 = _426;
    }
    float _428 = _424;
    if (_222)
    {
        float _430 = fma(_316, _302, _428);
        _414 = _430;
    }
    float _432 = _414;
    uint _434 = uint(int(uint(_168) >> uint(2)));
    float _436 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_434)]);
    float _438 = 0.0;
    if (!_222)
    {
        _438 = 0.0;
    }
    float _440 = _438;
    float _442 = _440;
    if (_222)
    {
        float _444 = _304 + _432;
        _442 = _444;
    }
    float _446 = _442;
    float _448 = _446;
    if (!_320)
    {
        _416 = _388;
    }
    float _450 = _416;
    float _452 = _410;
    float _454 = _450;
    int _456 = as_type<int>(_398);
    int _458 = as_type<int>(_404);
    int _460 = as_type<int>(_398);
    int _462 = as_type<int>(_404);
    if (!_320)
    {
        _452 = _384;
    }
    float _464 = _452;
    bool _466 = !_320;
    float _468 = _464;
    if (!_466)
    {
        float _470 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        uint _472 = uint(int(uint(_168) >> uint(2)));
        float _474 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_472)]);
        int _476 = _168 + 4;
        uint _478 = uint(int(uint(_476) >> uint(2)));
        float _480 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_478)]);
        int _482 = _168 + 8;
        uint _484 = uint(int(uint(_482) >> uint(2)));
        float _486 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_484)]);
        uint _488 = uint(int(uint(_168) >> uint(2)));
        float _490 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_488)]);
        int _492 = _168 + 4;
        uint _494 = uint(int(uint(_492) >> uint(2)));
        float _496 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_494)]);
        int _498 = _168 + 8;
        uint _500 = uint(int(uint(_498) >> uint(2)));
        float _502 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_500)]);
        uint _504 = uint(int(uint(_168) >> uint(2)));
        float _506 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_504)]);
        int _508 = _168 + 4;
        uint _510 = uint(int(uint(_508) >> uint(2)));
        float _512 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_510)]);
        int _514 = _168 + 8;
        uint _516 = uint(int(uint(_514) >> uint(2)));
        float _518 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_516)]);
        float _520 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        float _522 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        float _524 = _312 * _480;
        float _526 = _312 * _496;
        float _528 = _312 * _512;
        float _530 = fma(_314, _474, _524);
        float _532 = fma(_314, _490, _526);
        float _534 = fma(_314, _506, _528);
        float _536 = fma(_316, _486, _530);
        float _538 = fma(_316, _502, _532);
        float _540 = fma(_316, _518, _534);
        float _542 = _470 + _536;
        float _544 = _520 + _538;
        float _546 = _522 + _540;
        _448 = _544;
        _468 = _542;
        _454 = _546;
    }
    float _548 = _448;
    float _550 = _468;
    float _552 = _454;
    bool _554 = !_324;
    float _556 = _548;
    float _558 = _550;
    float _560 = _552;
    if (!_554)
    {
        uint _562 = uint(int(uint(_168) >> uint(2)));
        float _564 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_562)]);
        int _566 = _168 + 4;
        uint _568 = uint(int(uint(_566) >> uint(2)));
        float _570 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_568)]);
        int _572 = _168 + 8;
        uint _574 = uint(int(uint(_572) >> uint(2)));
        float _576 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_574)]);
        int _578 = _168 + 12;
        uint _580 = uint(int(uint(_578) >> uint(2)));
        float _582 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_580)]);
        uint _584 = uint(int(uint(_168) >> uint(2)));
        float _586 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_584)]);
        int _588 = _168 + 4;
        uint _590 = uint(int(uint(_588) >> uint(2)));
        float _592 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_590)]);
        int _594 = _168 + 8;
        uint _596 = uint(int(uint(_594) >> uint(2)));
        float _598 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_596)]);
        int _600 = _168 + 12;
        uint _602 = uint(int(uint(_600) >> uint(2)));
        float _604 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_602)]);
        uint _606 = uint(int(uint(_168) >> uint(2)));
        float _608 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_606)]);
        int _610 = _168 + 4;
        uint _612 = uint(int(uint(_610) >> uint(2)));
        float _614 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_612)]);
        int _616 = _168 + 8;
        uint _618 = uint(int(uint(_616) >> uint(2)));
        float _620 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_618)]);
        int _622 = _168 + 12;
        uint _624 = uint(int(uint(_622) >> uint(2)));
        float _626 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_624)]);
        float _628 = _312 * _570;
        float _630 = _312 * _592;
        float _632 = _312 * _614;
        float _634 = fma(_314, _564, _628);
        float _636 = fma(_314, _586, _630);
        float _638 = fma(_314, _608, _632);
        float _640 = fma(_316, _576, _634);
        float _642 = fma(_316, _598, _636);
        float _644 = fma(_316, _620, _638);
        float _646 = _640 + _582;
        float _648 = _642 + _604;
        float _650 = _644 + _626;
        _556 = _648;
        _558 = _646;
        _560 = _650;
    }
    float _652 = _556;
    float _654 = _558;
    float _656 = _560;
    float _658 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[8]);
    float _660 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[9]);
    float _662 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[10]);
    float _664 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[11]);
    float _666 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[61]);
    float _668 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[60]);
    float _670 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[70]);
    float _672 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[504]);
    float _674 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[505]);
    float _676 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[506]);
    float _678 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[507]);
    float _680 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[501]);
    float _682 = _660 * _652;
    float _684 = fma(_658, _654, _682);
    float _686 = fma(_662, _656, _684);
    float _688 = _664 + _686;
    float _690 = -_688;
    bool _692 = _666 >= _690;
    bool _694 = isnan(_666);
    bool _696 = _692 || _694;
    bool _698 = isnan(_690);
    bool _700 = _696 || _698;
    float _702 = -_688;
    bool _704 = _668 >= _702;
    bool _706 = isnan(_668);
    bool _708 = _704 || _706;
    bool _710 = isnan(_702);
    bool _712 = _708 || _710;
    int _714 = _700 ? 0 : 1;
    int _716 = 2;
    float _718 = _656;
    if (_700)
    {
        _716 = 1;
    }
    int _720 = _716;
    int _722 = _720;
    if (_712)
    {
        _722 = _714;
    }
    int _724 = _722;
    int _726 = _724 << 6;
    int _728 = _726 + 96;
    uint _730 = uint(int(uint(_728) >> uint(2)));
    float _732 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_730)]);
    int _734 = _728 + 4;
    uint _736 = uint(int(uint(_734) >> uint(2)));
    float _738 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_736)]);
    int _740 = _728 + 8;
    uint _742 = uint(int(uint(_740) >> uint(2)));
    float _744 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_742)]);
    int _746 = _728 + 12;
    uint _748 = uint(int(uint(_746) >> uint(2)));
    float _750 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_748)]);
    int _752 = _726 + 48;
    int _754 = _726 + 64;
    uint _756 = uint(int(uint(_752) >> uint(2)));
    float _758 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_756)]);
    int _760 = _752 + 4;
    uint _762 = uint(int(uint(_760) >> uint(2)));
    float _764 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_762)]);
    int _766 = _752 + 8;
    uint _768 = uint(int(uint(_766) >> uint(2)));
    float _770 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_768)]);
    int _772 = _752 + 12;
    uint _774 = uint(int(uint(_772) >> uint(2)));
    float _776 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_774)]);
    uint _778 = uint(int(uint(_754) >> uint(2)));
    float _780 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_778)]);
    int _782 = _754 + 4;
    uint _784 = uint(int(uint(_782) >> uint(2)));
    float _786 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_784)]);
    int _788 = _754 + 8;
    uint _790 = uint(int(uint(_788) >> uint(2)));
    float _792 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_790)]);
    int _794 = _754 + 12;
    uint _796 = uint(int(uint(_794) >> uint(2)));
    float _798 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_796)]);
    int _800 = _726 + 80;
    float _802 = _670 + 1.0;
    float _804 = _802 + _652;
    uint _806 = uint(int(uint(_800) >> uint(2)));
    float _808 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_806)]);
    int _810 = _800 + 4;
    uint _812 = uint(int(uint(_810) >> uint(2)));
    float _814 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_812)]);
    int _816 = _800 + 8;
    uint _818 = uint(int(uint(_816) >> uint(2)));
    float _820 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_818)]);
    int _822 = _800 + 12;
    uint _824 = uint(int(uint(_822) >> uint(2)));
    float _826 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_824)]);
    float _828 = _804 * _674;
    float _830 = fma(_672, _654, _828);
    float _832 = fma(_676, _656, _830);
    float _834 = _678 + _832;
    float _836 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[508]);
    float _838 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[509]);
    float _840 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[510]);
    float _842 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[511]);
    float _844 = trunc(_834);
    int _846 = int(_844);
    int _848 = ~as_type<int>(_680);
    int _850 = _846 + _848;
    int _852 = _850 + 1;
    float _854 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[502]);
    bool _856 = _852 >= 0;
    int _858 = as_type<int>(_652);
    float _860 = as_type<float>(_724);
    if (_856)
    {
        float _862 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[500]);
        _858 = as_type<int>(_862);
    }
    int _864 = _858;
    float _866 = _804 * _738;
    float _868 = fma(_732, _654, _866);
    float _870 = fma(_744, _656, _868);
    float _872 = _750 + _870;
    float _874 = _804 * _764;
    float _876 = 1.0 / _872;
    float _878 = fma(_758, _654, _874);
    float _880 = _804 * _786;
    float _882 = fma(_770, _656, _878);
    float _884 = fma(_780, _654, _880);
    float _886 = _776 + _882;
    float _888 = fma(_792, _656, _884);
    float _890 = _886 * _876;
    float _892 = _798 + _888;
    bool _894 = _890 >= 0.0;
    float _896 = _892 * _876;
    bool _898 = _890 <= 1.0;
    bool _900 = _898 && _894;
    bool _902 = _896 >= 0.0;
    bool _904 = _902 && _900;
    bool _906 = _896 <= 1.0;
    bool _908 = _906 && _904;
    float _910 = _804 * _814;
    float _912 = fma(_808, _654, _910);
    if (_908)
    {
        float _914 = float(_724);
        _860 = _914;
    }
    float _916 = _860;
    float _918 = _886;
    if (_908)
    {
        float _920 = rint(_916);
        float _922 = precise::max(_920, 0.0);
        uint _924 = uint(_922);
        uint _926 = clamp(_924, 0u, 65535u);
        _918 = as_type<float>(_926);
    }
    float _928 = _918;
    float _930 = fma(_820, _656, _912);
    float _932 = _826 + _930;
    float _934 = _932 * _876;
    float _936 = _928;
    if (_908)
    {
        float3 _3144 = float3(_890, _896, float(as_type<int>(_928)));
        float3 _3148 = select(_3144, float3(0.0), isnan(_3144));
        float _938 = spvDepthCast(spvDescriptorSet0.cp_t_tcb_16).sample_compare(spvDescriptorSet0.cp_t_tcb_16Smplr, _3148.xy, uint(rint(_3148.z)), _934, level(0.0));
        _936 = _938;
    }
    float _940 = _936;
    float _942 = _804 * _838;
    float _944 = fma(_836, _654, _942);
    float _946 = fma(_840, _656, _944);
    bool _948 = _864 <= _852;
    bool _950 = !_856;
    bool _952 = _948 || _950;
    float _954 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
    float _956 = _842 + _946;
    float _958 = trunc(_956);
    int _960 = int(_958);
    int _962 = ~as_type<int>(_854);
    int _964 = _960 + _962;
    int _966 = _964 + 1;
    bool _968 = _966 < 0;
    bool _970 = _968 || _952;
    int _972 = as_type<int>(_842);
    float _974 = _946;
    if (!_970)
    {
        float _976 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[500]);
        _972 = as_type<int>(_976);
    }
    int _978 = _972;
    bool _980 = _978 <= _966;
    bool _982 = _980 || _970;
    if (_982)
    {
        _974 = 1.0;
    }
    float _984 = _974;
    float _986 = _984;
    if (!_982)
    {
        float _988 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[500]);
        int _990 = _966 * as_type<int>(_988);
        int _992 = _990 + _852;
        int _994 = _992 << 2;
        uint _996 = uint(int(uint(_992) >> uint(2)));
        int _998 = 12 & _994;
        int _1000 = int(_996) << 4;
        int _1002 = _1000 + _998;
        int _1004 = _1002 + 400;
        uint _1006 = uint(int(uint(_1004) >> uint(2)));
        float _1008 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1006)]);
        float _1010 = floor(_834);
        float _1012 = floor(_956);
        float _1014 = -_1010;
        float _1016 = _834 + _1014;
        float _1018 = -_1012;
        float _1020 = _956 + _1018;
        float _1022 = rint(_1008);
        float _1024 = precise::max(_1022, 0.0);
        uint _1026 = uint(_1024);
        uint _1028 = clamp(_1026, 0u, 65535u);
        float3 _3285 = float3(_1016, _1020, float(int(_1028)));
        float3 _3287 = select(_3285, float3(0.0), isnan(_3285));
        float _1030 = dm_bs(spvDescriptorSet0.cp_t_tcb_14.sample(spvDescriptorSet0.cp_t_tcb_14Smplr, _3287.xy, uint(rint(_3287.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_14, spvDescriptorSet0.cp_t_tcb_14Smplr_w, _3287.xy, uint(rint(_3287.z)), level(0.0)).x;
        int _1032 = _992 << 4;
        int _1034 = _1032 + 2048;
        uint _1036 = uint(int(uint(_1034) >> uint(2)));
        float _1038 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1036)]);
        int _1040 = _1034 + 4;
        uint _1042 = uint(int(uint(_1040) >> uint(2)));
        float _1044 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1042)]);
        int _1046 = _1034 + 8;
        uint _1048 = uint(int(uint(_1046) >> uint(2)));
        float _1050 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1048)]);
        int _1052 = _1034 + 12;
        uint _1054 = uint(int(uint(_1052) >> uint(2)));
        float _1056 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1054)]);
        float _1058 = _804 * _1044;
        float _1060 = fma(_1038, _654, _1058);
        float _1062 = fma(_1050, _656, _1060);
        float _1064 = _1056 + _1062;
        float _1066 = precise::clamp(_1064, 0.0, 1.0);
        float _1068 = -_1066;
        float _1070 = _1068 + _1030;
        float _1072 = fma(_1070, 500.0, 1.5);
        float _1074 = exp2(_1072);
        float _1076 = 0.0 + _1074;
        float _1078 = precise::clamp(_1076, 0.0, 1.0);
        _986 = _1078;
    }
    float _1080 = _986;
    uint _1082 = uint(int(uint(_168) >> uint(2)));
    float _1084 = as_type<float>((*spvDescriptorSet0.cp_s13)._m0[int(_1082)]);
    float _1086 = abs(_212);
    float _1088 = log2(_1086);
    float _1090 = _174 * _214;
    float _1092 = _328 * _1090;
    if (!_908)
    {
        _418 = 1.0;
    }
    float _1094 = _418;
    float _1096 = _1094;
    if (_908)
    {
        bool _1098 = _940 >= _934;
        bool _1100 = isnan(_940);
        bool _1102 = _1098 || _1100;
        bool _1104 = isnan(_934);
        bool _1106 = _1102 || _1104;
        float _1108 = float(_1106);
        _1096 = _1108;
    }
    float _1110 = _1096;
    float _1112 = -_1110;
    float _1114 = fma(_1112, _1080, 1.0);
    float _1116 = _174 * _1088;
    float _1118 = _326 * _1090;
    float _1120 = -_218;
    float _1122 = _954 + _1120;
    float _1124 = _330 * _1090;
    float _1126 = exp2(_1116);
    bool _1128 = _1122 > 0.001000000047497451305389404296875;
    bool _1130 = isnan(_1122);
    bool _1132 = _1128 || _1130;
    bool _1134 = isnan(0.001000000047497451305389404296875);
    bool _1136 = _1132 || _1134;
    float _1138 = fma(_182, _1126, _1118);
    float _1140 = fma(_188, _1126, _1092);
    float _1142 = fma(_194, _1126, _1124);
    float _1144 = -_1084;
    float _1146 = _1114 + _1144;
    float _1148 = _1114;
    float _1150 = _1122;
    if (_1136)
    {
        float _1152 = fma(_1146, 0.0500000007450580596923828125, _1084);
        _1148 = _1152;
    }
    float _1154 = _1148;
    float _1156 = precise::max(0.0, _1154);
    float _1158 = precise::min(_1156, 0.999000012874603271484375);
    uint _1160 = uint(int(uint(_168) >> uint(2)));
    (*spvDescriptorSet0.cp_s13)._m0[int(_1160)] = as_type<uint>(_1158);
    float _1162 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[114]);
    float _1164 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[112]);
    float _1166 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[116]);
    float _1168 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[118]);
    float _1170 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[74]);
    float _1172 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[73]);
    float _1174 = _1162 * _1162;
    float _1176 = fma(_1164, _1164, _1174);
    float _1178 = rsqrt(_1176);
    float _1180 = _1178 * (-20.0);
    float _1182 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[72]);
    float _1184 = fma(_1164, _1180, _1166);
    float _1186 = fma(_1162, _1180, _1168);
    float _1188 = _1184 * 0.5;
    float _1190 = _1186 * 0.5;
    float _1192 = floor(_1188);
    float _1194 = floor(_1190);
    float _1196 = fma(_1192, 2.0, -32.0);
    float _1198 = -_1196;
    float _1200 = _1198 + _654;
    float _1202 = fma(_1194, 2.0, -32.0);
    float _1204 = -_1202;
    float _1206 = _1204 + _656;
    float _1208 = _1200 * 0.015625;
    float _1210 = fma(_654, 6.2500002968590706586837768554688e-05, 0.5);
    float _1212 = _1206 * 0.015625;
    float _1214 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[30]);
    float _1216 = fma(_656, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _3573 = float2(_1208, _1212);
    float4 _1219 = spvDescriptorSet0.cp_t_tcb_26.gather(spvDescriptorSet0.cp_t_tcb_26Smplr, select(_3573, float2(0.0), isnan(_3573)), int2(0), component::x).xyzw;
    float _1221 = _1219.x;
    float _1223 = _1219.y;
    float _1225 = _1219.z;
    float _1227 = _1219.w;
    float2 _3591 = float2(_1208, _1212);
    float4 _1229 = spvDescriptorSet0.cp_t_tcb_26.gather(spvDescriptorSet0.cp_t_tcb_26Smplr, select(_3591, float2(0.0), isnan(_3591)), int2(0), component::y).xyzw;
    float _1231 = _1229.x;
    float _1233 = _1229.y;
    float _1235 = _1229.z;
    float _1237 = _1229.w;
    float2 _3607 = float2(_1210, _1216);
    float2 _1241 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_3607, float2(0.0), isnan(_3607)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_3607, float2(0.0), isnan(_3607)), level(0.0)).xy;
    float _1243 = _1241.x;
    float _1245 = _1241.y;
    bool _1247 = _1170 > 0.0;
    bool _1249 = _1172 > 0.0;
    float _1251 = _1170;
    float _1253 = _1172;
    float _1255 = _1208;
    if (_1247)
    {
        float _1257 = 1.0 / _1170;
        _1251 = _1257;
    }
    float _1259 = _1251;
    if (_1247)
    {
        float _1261 = _1122 * _1259;
        _1150 = _1261;
    }
    float _1263 = _1150;
    float _1265 = _1263;
    if (_1247)
    {
        float _1267 = precise::min(_1263, 1.0);
        _1265 = _1267;
    }
    float _1269 = _1265;
    float _1271 = _1182;
    if (_1249)
    {
        float _1273 = _1182 * _1172;
        _1253 = _1273;
    }
    float _1275 = _1253;
    if (_1249)
    {
        float _1277 = -_1275;
        float _1279 = fma(_436, _1277, _1182);
        _1271 = _1279;
    }
    float _1281 = _1271;
    float _1283 = _1281;
    if (_1247)
    {
        float _1285 = _1269 * _1281;
        _1283 = _1285;
    }
    float _1287 = _1283;
    int _1289 = as_type<int>(_1214) & 512;
    bool _1291 = _1289 != 0;
    float _1293 = _1221 + _1223;
    float _1295 = _1231 + _1233;
    float _1297 = _1225 + _1293;
    float _1299 = _1235 + _1295;
    float _1301 = _1227 + _1297;
    float _1303 = _1237 + _1299;
    float _1305 = _1301 * 0.25;
    float _1307 = _1303 * 0.25;
    bool _1309 = !_1291;
    bool _1311 = _1291;
    float _1313 = _1214;
    float _1385;
    float _1387;
    if (!_1309)
    {
        float _1315 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _1317 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _1319 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _1321 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _1323 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _1325 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _1327 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _1329 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _1331 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _1333 = _1319 * _1321;
        float _1335 = _1319 * _1323;
        float _1337 = _1317 * _1321;
        float _1339 = -_1333;
        float _1341 = fma(_1315, _1325, _1339);
        float _1343 = -_1335;
        float _1345 = fma(_1317, _1325, _1343);
        float _1347 = -_1337;
        float _1349 = fma(_1315, _1323, _1347);
        float _1351 = _1329 * _1315;
        float _1353 = _1329 * _1341;
        float _1355 = -_1351;
        float _1357 = fma(_1327, _1317, _1355);
        float _1359 = -_1353;
        float _1361 = fma(_1327, _1345, _1359);
        float _1363 = fma(_1331, _1349, _1361);
        float _1365 = _1331 * _1317;
        float _1367 = -_1365;
        float _1369 = fma(_1329, _1319, _1367);
        float _1371 = 1.0 / _1363;
        float _1373 = _1307 * _1371;
        float _1375 = _1305 * _1371;
        float _1377 = _1369 * _1373;
        float _1379 = _1357 * _1373;
        float _1381 = fma(_1345, _1375, _1377);
        float _1383 = fma(_1349, _1375, _1379);
        _718 = _1371;
        _1385 = _1381;
        _1387 = _1383;
        _1389 = true;
    }
    else
    {
        int _1391 = as_type<int>(_1214) & 1024;
        bool _1393 = _1391 != 0;
        if (_1393)
        {
            _1311 = true;
        }
        bool _1395 = _1311;
        bool _1397 = _1395;
        if (!_1393)
        {
            int _1399 = as_type<int>(_1214) & 2048;
            bool _1401 = _1399 != 0;
            _1397 = _1401;
        }
        bool _1403 = _1397;
        if (!_1403)
        {
            _1255 = _1305;
        }
        float _1405 = _1255;
        _1385 = _1405;
        if (!_1403)
        {
            _1313 = _1307;
        }
        float _1407 = _1313;
        bool _1409 = !_1403;
        _1387 = _1407;
        if (!_1409)
        {
            uint _1411 = uint(int(uint(_168) >> uint(2)));
            float _1413 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1411)]);
            int _1415 = _168 + 4;
            uint _1417 = uint(int(uint(_1415) >> uint(2)));
            float _1419 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1417)]);
            int _1421 = _168 + 8;
            uint _1423 = uint(int(uint(_1421) >> uint(2)));
            float _1425 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1423)]);
            uint _1427 = uint(int(uint(_168) >> uint(2)));
            float _1429 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1427)]);
            int _1431 = _168 + 4;
            uint _1433 = uint(int(uint(_1431) >> uint(2)));
            float _1435 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1433)]);
            int _1437 = _168 + 8;
            uint _1439 = uint(int(uint(_1437) >> uint(2)));
            float _1441 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1439)]);
            uint _1443 = uint(int(uint(_168) >> uint(2)));
            float _1445 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1443)]);
            int _1447 = _168 + 4;
            uint _1449 = uint(int(uint(_1447) >> uint(2)));
            float _1451 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1449)]);
            int _1453 = _168 + 8;
            uint _1455 = uint(int(uint(_1453) >> uint(2)));
            float _1457 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1455)]);
            float _1459 = _1425 * _1429;
            float _1461 = _1425 * _1435;
            float _1463 = _1419 * _1429;
            float _1465 = -_1459;
            float _1467 = fma(_1413, _1441, _1465);
            float _1469 = -_1461;
            float _1471 = fma(_1419, _1441, _1469);
            float _1473 = -_1463;
            float _1475 = fma(_1413, _1435, _1473);
            float _1477 = _1451 * _1413;
            float _1479 = _1451 * _1467;
            float _1481 = -_1477;
            float _1483 = fma(_1445, _1419, _1481);
            float _1485 = -_1479;
            float _1487 = fma(_1445, _1471, _1485);
            float _1489 = fma(_1457, _1475, _1487);
            float _1491 = _1457 * _1419;
            float _1493 = -_1491;
            float _1495 = fma(_1451, _1425, _1493);
            float _1497 = 1.0 / _1489;
            float _1499 = _1307 * _1497;
            float _1501 = _1305 * _1497;
            float _1503 = _1495 * _1499;
            float _1505 = _1483 * _1499;
            float _1507 = fma(_1471, _1501, _1503);
            float _1509 = fma(_1475, _1501, _1505);
            _718 = _1497;
            _1385 = _1507;
            _1387 = _1509;
        }
    }
    _1389 = false;
    float _1511 = _718;
    float _1513 = _1385;
    float _1515 = _1387;
    bool _1517 = _1243 != 0.0;
    bool _1519 = isnan(_1243);
    bool _1521 = _1517 || _1519;
    bool _1523 = isnan(0.0);
    bool _1525 = _1521 || _1523;
    float _1527 = _1511;
    if (!_1525)
    {
        _1527 = 4.0;
    }
    float _1529 = _1527;
    float _1531 = _1245;
    if (!_1525)
    {
        float2 _4059 = float2(_1210, _1216);
        float _1533 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_4059, float2(0.0), isnan(_4059)), level(_1529)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_4059, float2(0.0), isnan(_4059)), level(_1529)).y;
        _1531 = _1533;
    }
    float _1535 = _1531;
    float _1537 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _1539 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[76]);
    float _1541 = -_1138;
    float _1543 = fma(_1287, _1513, _1541);
    float _1545 = -_1142;
    float _1547 = fma(_1287, _1515, _1545);
    int _1549 = _168 + 8;
    float _1551 = precise::max(_1537, 1.0);
    float _1553 = fma(_1535, 2000.0, _1539);
    float _1555 = 1.0 / _1551;
    float _1557 = _1555 * 0.5;
    float _1559 = fma(_1543, _1557, _1138);
    float _1561 = fma(_1547, _1557, _1142);
    int _1563 = _168 + 4;
    uint _1565 = uint(int(uint(_1563) >> uint(2)));
    (*spvDescriptorSet0.cp_s13)._m0[int(_1565)] = as_type<uint>(_1553);
    uint _1567 = uint(int(uint(_172) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1567)] = as_type<uint>(_226);
    uint _1569 = uint(int(uint(_168) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1569)] = as_type<uint>(_314);
    uint _1571 = uint(int(uint(_1563) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1571)] = as_type<uint>(_312);
    uint _1573 = uint(int(uint(_1549) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1573)] = as_type<uint>(_316);
    uint _1575 = uint(int(uint(_168) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_1575)] = as_type<uint>(_1559);
    uint _1577 = uint(int(uint(_1563) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_1577)] = as_type<uint>(_1140);
    uint _1579 = uint(int(uint(_1549) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_1579)] = as_type<uint>(_1561);
    uint _1581 = uint(int(uint(_168) >> uint(2)));
    (*spvDescriptorSet0.cp_s5)._m0[int(_1581)] = as_type<uint>(_308);
    uint _1583 = uint(int(uint(_1563) >> uint(2)));
    (*spvDescriptorSet0.cp_s5)._m0[int(_1583)] = as_type<uint>(_306);
    uint _1585 = uint(int(uint(_1549) >> uint(2)));
    (*spvDescriptorSet0.cp_s5)._m0[int(_1585)] = as_type<uint>(_310);
    float _1587 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _1589 = _306 * _306;
    float _1591 = _1140 * _1140;
    float _1593 = fma(_308, _308, _1589);
    float _1595 = fma(_1559, _1559, _1591);
    float _1597 = fma(_310, _310, _1593);
    float _1599 = fma(_1561, _1561, _1595);
    float _1601 = sqrt(_1599);
    float _1603 = sqrt(_1597);
    bool _1605 = _1603 >= 9.9999999747524270787835121154785e-07;
    bool _1607 = isnan(_1603);
    bool _1609 = _1605 || _1607;
    bool _1611 = isnan(9.9999999747524270787835121154785e-07);
    bool _1613 = _1609 || _1611;
    float _1615 = _1603;
    int _1631;
    if (!_1613)
    {
        bool _1617 = _954 != _218;
        bool _1619 = isnan(_954);
        bool _1621 = _1617 || _1619;
        bool _1623 = isnan(_218);
        bool _1625 = _1621 || _1623;
        if (_1625)
        {
            _338 = as_type<int>(_392);
        }
        int _1627 = _338;
        int _1629 = _1627;
        _1631 = _1627;
        _1633 = _1625;
        if (!_1633)
        {
            float _1635 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
            bool _1637 = _1635 > 0.0;
            bool _1639 = !_1637;
            if (!_1639)
            {
                float _1641 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
                float _1643 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
                float _1645 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
                float _1647 = _1643 * _1643;
                float _1649 = fma(_1641, _1641, _1647);
                float _1651 = fma(_1645, _1645, _1649);
                float _1653 = rsqrt(_1651);
                float _1655 = _1653 * 9.9999999747524270787835121154785e-07;
                float _1657 = _1641 * _1655;
                float _1659 = _1643 * _1655;
                float _1661 = _1645 * _1655;
                _1631 = as_type<int>(_1657);
                _460 = as_type<int>(_1659);
                _462 = as_type<int>(_1661);
                _1633 = true;
            }
            else
            {
                bool _1663 = _1601 >= 9.9999999747524270787835121154785e-07;
                bool _1665 = isnan(_1601);
                bool _1667 = _1663 || _1665;
                bool _1669 = isnan(9.9999999747524270787835121154785e-07);
                bool _1671 = _1667 || _1669;
                if (!_1671)
                {
                    float _1673 = _312 * _312;
                    float _1675 = fma(_314, _314, _1673);
                    float _1677 = fma(_316, _316, _1675);
                    float _1679 = sqrt(_1677);
                    bool _1681 = _1679 >= 9.9999999747524270787835121154785e-07;
                    bool _1683 = isnan(_1679);
                    bool _1685 = _1681 || _1683;
                    bool _1687 = isnan(9.9999999747524270787835121154785e-07);
                    bool _1689 = _1685 || _1687;
                    int _1691 = as_type<int>(_404);
                    int _1693 = as_type<int>(_1679);
                    if (_1689)
                    {
                        float _1695 = rsqrt(_1677);
                        _1691 = as_type<int>(_1695);
                    }
                    int _1697 = _1691;
                    if (!_1689)
                    {
                        _1629 = 0;
                    }
                    int _1699 = _1629;
                    int _1701 = _1699;
                    if (!_1689)
                    {
                        _1693 = 897988541;
                    }
                    int _1703 = _1693;
                    int _1705 = _1697;
                    int _1707 = _1703;
                    if (_1689)
                    {
                        float _1709 = as_type<float>(_1697) * 9.9999999747524270787835121154785e-07;
                        _1615 = _1709;
                    }
                    float _1711 = _1615;
                    if (!_1689)
                    {
                        _1705 = 0;
                    }
                    int _1713 = _1705;
                    int _1715 = _1713;
                    if (_1689)
                    {
                        float _1717 = _314 * _1711;
                        _1701 = as_type<int>(_1717);
                    }
                    int _1719 = _1701;
                    _1631 = _1719;
                    if (_1689)
                    {
                        float _1721 = _312 * _1711;
                        _1707 = as_type<int>(_1721);
                    }
                    int _1723 = _1707;
                    _460 = _1723;
                    if (_1689)
                    {
                        float _1725 = _316 * _1711;
                        _1715 = as_type<int>(_1725);
                    }
                    int _1727 = _1715;
                    _462 = _1727;
                    _1633 = true;
                }
                else
                {
                    float _1729 = rsqrt(_1599);
                    float _1731 = _1729 * 9.9999999747524270787835121154785e-07;
                    float _1733 = _1559 * _1731;
                    float _1735 = _1140 * _1731;
                    float _1737 = _1561 * _1731;
                    _1631 = as_type<int>(_1733);
                    _460 = as_type<int>(_1735);
                    _462 = as_type<int>(_1737);
                    _1633 = true;
                }
            }
        }
    }
    else
    {
        float _1739 = _1601 * _1587;
        bool _1741 = _1739 >= 0.001000000047497451305389404296875;
        bool _1743 = isnan(_1739);
        bool _1745 = _1741 || _1743;
        bool _1747 = isnan(0.001000000047497451305389404296875);
        bool _1749 = _1745 || _1747;
        bool _1751 = _1739 > 0.0;
        bool _1753 = !_1749;
        bool _1755 = _1751 && _1753;
        bool _1757 = _1603 < 0.001000000047497451305389404296875;
        bool _1759 = _1757 && _1755;
        if (!_1759)
        {
            _456 = as_type<int>(_306);
        }
        int _1761 = _456;
        int _1763 = _1761;
        if (_1759)
        {
            float _1765 = _1559 * _1587;
            _340 = as_type<int>(_1765);
        }
        int _1767 = _340;
        _1631 = _1767;
        if (!_1759)
        {
            _458 = as_type<int>(_310);
        }
        int _1769 = _458;
        _462 = _1769;
        if (_1759)
        {
            float _1771 = _1140 * _1587;
            _1763 = as_type<int>(_1771);
        }
        int _1773 = _1763;
        _460 = _1773;
        if (_1759)
        {
            float _1775 = _1561 * _1587;
            _462 = as_type<int>(_1775);
        }
    }
    _1633 = false;
    int _1777 = _1631;
    int _1779 = _460;
    int _1781 = _462;
    uint _1783 = uint(int(uint(_168) >> uint(2)));
    (*spvDescriptorSet0.cp_s5)._m0[int(_1783)] = uint(_1777);
    uint _1785 = uint(int(uint(_1563) >> uint(2)));
    (*spvDescriptorSet0.cp_s5)._m0[int(_1785)] = uint(_1779);
    uint _1787 = uint(int(uint(_1549) >> uint(2)));
    (*spvDescriptorSet0.cp_s5)._m0[int(_1787)] = uint(_1781);
}

