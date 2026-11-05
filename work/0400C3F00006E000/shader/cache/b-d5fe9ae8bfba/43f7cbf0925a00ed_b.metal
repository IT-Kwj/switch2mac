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
    constant _16* cp_c0 [[id(0)]];
    device _21* cp_s0 [[id(1)]];
    device _21* cp_s1 [[id(2)]];
    device _21* cp_s2 [[id(3)]];
    device _21* cp_s3 [[id(4)]];
    device _21* cp_s4 [[id(5)]];
    device _21* cp_s5 [[id(6)]];
    device _21* cp_s6 [[id(7)]];
    device _21* cp_s7 [[id(8)]];
    device _21* cp_s8 [[id(9)]];
    device _21* cp_s9 [[id(10)]];
    device _21* cp_s10 [[id(11)]];
    device _21* cp_s11 [[id(12)]];
    device _21* cp_s12 [[id(13)]];
    texture2d<float> cp_t_tcb_2C [[id(14)]];
    sampler cp_t_tcb_2CSmplr [[id(15)]];
    texture2d_array<float> cp_t_tcb_14 [[id(16)]];
    sampler cp_t_tcb_14Smplr [[id(17)]];
    texture2d_array<float> cp_t_tcb_16 [[id(18)]];
    sampler cp_t_tcb_16Smplr [[id(19)]];
    sampler cp_t_tcb_2CSmplr_w [[id(20)]];
    sampler cp_t_tcb_14Smplr_w [[id(21)]];
    constant dm_border_t* dm_border [[id(22)]];
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]])
{
    bool _1584 = false;
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
    int _164 = _85 << 4;
    float _166 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[30]);
    int _168 = _164 + 12;
    float _170 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    uint _172 = uint(int(uint(_168) >> uint(2)));
    float _174 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_172)]);
    uint _176 = uint(int(uint(_164) >> uint(2)));
    float _178 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_176)]);
    int _180 = _164 + 4;
    uint _182 = uint(int(uint(_180) >> uint(2)));
    float _184 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_182)]);
    int _186 = _164 + 8;
    uint _188 = uint(int(uint(_186) >> uint(2)));
    float _190 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_188)]);
    uint _192 = uint(int(uint(_164) >> uint(2)));
    float _194 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_192)]);
    int _196 = _164 + 4;
    uint _198 = uint(int(uint(_196) >> uint(2)));
    float _200 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_198)]);
    int _202 = _164 + 8;
    uint _204 = uint(int(uint(_202) >> uint(2)));
    float _206 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_204)]);
    float _208 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[68]);
    float _210 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
    uint _212 = uint(int(uint(_168) >> uint(2)));
    float _214 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_212)]);
    int _216 = as_type<int>(_166) & 512;
    bool _218 = _216 != 0;
    uint _220 = uint(int(uint(_168) >> uint(2)));
    float _222 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_220)]);
    float _224 = 0.0;
    float _226 = 0.0;
    float _228 = 0.0;
    float _230 = 0.0;
    if (_218)
    {
        float _232 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _234 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _236 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _238 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        _224 = _232;
        _226 = _234;
        _228 = _236;
        _230 = _238;
    }
    float _240 = _224;
    float _242 = _226;
    float _244 = _228;
    float _246 = _230;
    float _248 = 0.0;
    float _250 = 0.0;
    float _252 = 0.0;
    float _254 = 0.0;
    if (_218)
    {
        float _256 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _258 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _260 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _262 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        _248 = _256;
        _250 = _258;
        _252 = _260;
        _254 = _262;
    }
    float _264 = _248;
    float _266 = _250;
    float _268 = _252;
    float _270 = _254;
    float _272 = _174 * _170;
    float _274 = 0.0;
    float _276 = 0.0;
    float _278 = 0.0;
    float _280 = 0.0;
    float _282 = _194;
    float _284 = _206;
    float _286 = _170;
    float _288 = _184;
    float _290 = _190;
    if (_218)
    {
        float _292 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _294 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _296 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _298 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        _274 = _292;
        _276 = _294;
        _278 = _296;
        _280 = _298;
    }
    float _300 = _274;
    float _302 = _276;
    float _304 = _278;
    float _306 = _280;
    float _308 = _184 * _272;
    float _310 = _178 * _272;
    float _312 = _190 * _272;
    float _314 = _200 + _308;
    float _316 = _194 + _310;
    float _318 = _206 + _312;
    int _320 = as_type<int>(_166) & 1024;
    bool _322 = _320 != 0;
    int _324 = as_type<int>(_166) & 2048;
    bool _326 = _324 != 0;
    float _328 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
    float _330 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
    float _332 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
    float _334 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
    float _336 = _242;
    float _338 = _240;
    float _340 = _264;
    int _342 = as_type<int>(_310);
    int _344 = as_type<int>(_310);
    if (_218)
    {
        float _346 = _314 * _242;
        _282 = _346;
    }
    float _348 = _282;
    float _350 = _348;
    if (_218)
    {
        float _352 = _314 * _266;
        _284 = _352;
    }
    float _354 = _284;
    float _356 = _354;
    if (_218)
    {
        float _358 = fma(_316, _240, _348);
        _350 = _358;
    }
    float _360 = _350;
    float _362 = _360;
    if (_218)
    {
        float _364 = fma(_316, _264, _354);
        _356 = _364;
    }
    float _366 = _356;
    float _368 = _366;
    if (_218)
    {
        float _370 = fma(_318, _244, _360);
        _362 = _370;
    }
    float _372 = _362;
    if (_218)
    {
        float _374 = fma(_318, _268, _366);
        _368 = _374;
    }
    float _376 = _368;
    if (!_218)
    {
        _336 = 0.0;
        _338 = 0.0;
    }
    float _378 = _336;
    float _380 = _338;
    float _382 = _378;
    float _384 = _380;
    if (_218)
    {
        float _386 = _246 + _372;
        _382 = _386;
    }
    float _388 = _382;
    if (_218)
    {
        float _390 = _270 + _376;
        _384 = _390;
    }
    float _392 = _384;
    uint _394 = uint(int(uint(_164) >> uint(2)));
    float _396 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_394)]);
    int _398 = _164 + 4;
    uint _400 = uint(int(uint(_398) >> uint(2)));
    float _402 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_400)]);
    int _404 = _164 + 8;
    uint _406 = uint(int(uint(_404) >> uint(2)));
    float _408 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_406)]);
    int _410 = _164 + 12;
    uint _412 = uint(int(uint(_410) >> uint(2)));
    float _414 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_412)]);
    float _416 = _302;
    float _418 = _304;
    float _420 = _334;
    float _422 = _328;
    if (_218)
    {
        float _424 = _314 * _302;
        _416 = _424;
    }
    float _426 = _416;
    float _428 = _426;
    if (_218)
    {
        float _430 = fma(_316, _300, _426);
        _428 = _430;
    }
    float _432 = _428;
    if (_218)
    {
        float _434 = fma(_318, _304, _432);
        _418 = _434;
    }
    float _436 = _418;
    if (!_218)
    {
        _340 = 0.0;
    }
    float _438 = _340;
    float _440 = _438;
    if (!_322)
    {
        _420 = _388;
    }
    float _442 = _420;
    float _444 = _442;
    if (_218)
    {
        float _446 = _306 + _436;
        _440 = _446;
    }
    float _448 = _440;
    float _450 = _414;
    float _452 = _448;
    int _454 = as_type<int>(_402);
    int _456 = as_type<int>(_408);
    int _458 = as_type<int>(_402);
    int _460 = as_type<int>(_408);
    if (!_322)
    {
        _450 = _392;
    }
    float _462 = _450;
    bool _464 = !_322;
    float _466 = _462;
    int _468 = as_type<int>(_222);
    if (!_464)
    {
        float _470 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        uint _472 = uint(int(uint(_164) >> uint(2)));
        float _474 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_472)]);
        int _476 = _164 + 4;
        uint _478 = uint(int(uint(_476) >> uint(2)));
        float _480 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_478)]);
        int _482 = _164 + 8;
        uint _484 = uint(int(uint(_482) >> uint(2)));
        float _486 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_484)]);
        uint _488 = uint(int(uint(_164) >> uint(2)));
        float _490 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_488)]);
        int _492 = _164 + 4;
        uint _494 = uint(int(uint(_492) >> uint(2)));
        float _496 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_494)]);
        int _498 = _164 + 8;
        uint _500 = uint(int(uint(_498) >> uint(2)));
        float _502 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_500)]);
        uint _504 = uint(int(uint(_164) >> uint(2)));
        float _506 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_504)]);
        int _508 = _164 + 4;
        uint _510 = uint(int(uint(_508) >> uint(2)));
        float _512 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_510)]);
        int _514 = _164 + 8;
        uint _516 = uint(int(uint(_514) >> uint(2)));
        float _518 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_516)]);
        float _520 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        float _522 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        float _524 = _314 * _480;
        float _526 = _314 * _496;
        float _528 = _314 * _512;
        float _530 = fma(_316, _474, _524);
        float _532 = fma(_316, _490, _526);
        float _534 = fma(_316, _506, _528);
        float _536 = fma(_318, _486, _530);
        float _538 = fma(_318, _502, _532);
        float _540 = fma(_318, _518, _534);
        float _542 = _470 + _536;
        float _544 = _520 + _538;
        float _546 = _522 + _540;
        _452 = _544;
        _444 = _542;
        _466 = _546;
    }
    float _548 = _452;
    float _550 = _444;
    float _552 = _466;
    bool _554 = !_326;
    float _556 = _548;
    float _558 = _550;
    float _560 = _552;
    if (!_554)
    {
        uint _562 = uint(int(uint(_164) >> uint(2)));
        float _564 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_562)]);
        int _566 = _164 + 4;
        uint _568 = uint(int(uint(_566) >> uint(2)));
        float _570 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_568)]);
        int _572 = _164 + 8;
        uint _574 = uint(int(uint(_572) >> uint(2)));
        float _576 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_574)]);
        int _578 = _164 + 12;
        uint _580 = uint(int(uint(_578) >> uint(2)));
        float _582 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_580)]);
        uint _584 = uint(int(uint(_164) >> uint(2)));
        float _586 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_584)]);
        int _588 = _164 + 4;
        uint _590 = uint(int(uint(_588) >> uint(2)));
        float _592 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_590)]);
        int _594 = _164 + 8;
        uint _596 = uint(int(uint(_594) >> uint(2)));
        float _598 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_596)]);
        int _600 = _164 + 12;
        uint _602 = uint(int(uint(_600) >> uint(2)));
        float _604 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_602)]);
        uint _606 = uint(int(uint(_164) >> uint(2)));
        float _608 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_606)]);
        int _610 = _164 + 4;
        uint _612 = uint(int(uint(_610) >> uint(2)));
        float _614 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_612)]);
        int _616 = _164 + 8;
        uint _618 = uint(int(uint(_616) >> uint(2)));
        float _620 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_618)]);
        int _622 = _164 + 12;
        uint _624 = uint(int(uint(_622) >> uint(2)));
        float _626 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_624)]);
        float _628 = _314 * _570;
        float _630 = _314 * _592;
        float _632 = _314 * _614;
        float _634 = fma(_316, _564, _628);
        float _636 = fma(_316, _586, _630);
        float _638 = fma(_316, _608, _632);
        float _640 = fma(_318, _576, _634);
        float _642 = fma(_318, _598, _636);
        float _644 = fma(_318, _620, _638);
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
    float _658 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[70]);
    float _660 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[504]);
    float _662 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[505]);
    float _664 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[506]);
    float _666 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[507]);
    float _668 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[501]);
    float _670 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[8]);
    float _672 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[9]);
    float _674 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[10]);
    float _676 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[11]);
    float _678 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[61]);
    float _680 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[60]);
    float _682 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[502]);
    float _684 = _658 + 1.0;
    float _686 = _684 + _652;
    float _688 = _686 * _662;
    float _690 = fma(_660, _654, _688);
    float _692 = fma(_664, _656, _690);
    float _694 = _666 + _692;
    float _696 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[508]);
    float _698 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[509]);
    float _700 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[510]);
    float _702 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[511]);
    float _704 = trunc(_694);
    int _706 = int(_704);
    int _708 = ~as_type<int>(_668);
    int _710 = _706 + _708;
    int _712 = _710 + 1;
    bool _714 = _712 >= 0;
    int _716 = 0;
    if (_714)
    {
        float _718 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[500]);
        _716 = as_type<int>(_718);
    }
    int _720 = _716;
    float _722 = fma(_654, 6.2500002968590706586837768554688e-05, 0.5);
    float _724 = fma(_656, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _2758 = float2(_722, _724);
    float _726 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_2758, float2(0.0), isnan(_2758)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_2758, float2(0.0), isnan(_2758)), level(0.0)).x;
    float _728 = _672 * _652;
    float _730 = fma(_670, _654, _728);
    float _732 = fma(_674, _656, _730);
    float _734 = _676 + _732;
    float _736 = -_734;
    bool _738 = _678 >= _736;
    bool _740 = isnan(_678);
    bool _742 = _738 || _740;
    bool _744 = isnan(_736);
    bool _746 = _742 || _744;
    float _748 = -_734;
    bool _750 = _680 >= _748;
    bool _752 = isnan(_680);
    bool _754 = _750 || _752;
    bool _756 = isnan(_748);
    bool _758 = _754 || _756;
    int _760 = _746 ? 0 : 1;
    int _762 = 2;
    float _764 = _722;
    float _766 = _724;
    if (_746)
    {
        _762 = 1;
    }
    int _768 = _762;
    int _770 = _768;
    if (_758)
    {
        _770 = _760;
    }
    int _772 = _770;
    int _774 = _772 << 6;
    int _776 = _774 + 96;
    uint _778 = uint(int(uint(_776) >> uint(2)));
    float _780 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_778)]);
    int _782 = _776 + 4;
    uint _784 = uint(int(uint(_782) >> uint(2)));
    float _786 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_784)]);
    int _788 = _776 + 8;
    uint _790 = uint(int(uint(_788) >> uint(2)));
    float _792 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_790)]);
    int _794 = _776 + 12;
    uint _796 = uint(int(uint(_794) >> uint(2)));
    float _798 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_796)]);
    int _800 = _774 + 48;
    uint _802 = uint(int(uint(_800) >> uint(2)));
    float _804 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_802)]);
    int _806 = _800 + 4;
    uint _808 = uint(int(uint(_806) >> uint(2)));
    float _810 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_808)]);
    int _812 = _800 + 8;
    uint _814 = uint(int(uint(_812) >> uint(2)));
    float _816 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_814)]);
    int _818 = _800 + 12;
    uint _820 = uint(int(uint(_818) >> uint(2)));
    float _822 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_820)]);
    float _824 = _686 * _698;
    float _826 = fma(_696, _654, _824);
    float _828 = fma(_700, _656, _826);
    float _830 = _702 + _828;
    int _832 = _774 + 64;
    float _834 = trunc(_830);
    int _836 = int(_834);
    uint _838 = uint(int(uint(_832) >> uint(2)));
    float _840 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_838)]);
    int _842 = _832 + 4;
    uint _844 = uint(int(uint(_842) >> uint(2)));
    float _846 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_844)]);
    int _848 = _832 + 8;
    uint _850 = uint(int(uint(_848) >> uint(2)));
    float _852 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_850)]);
    int _854 = _832 + 12;
    uint _856 = uint(int(uint(_854) >> uint(2)));
    float _858 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_856)]);
    int _860 = ~as_type<int>(_682);
    int _862 = _836 + _860;
    int _864 = _862 + 1;
    bool _866 = _720 <= _712;
    bool _868 = !_714;
    bool _870 = _866 || _868;
    int _872 = _774 + 80;
    float _874 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
    bool _876 = _864 < 0;
    bool _878 = _876 || _870;
    uint _880 = uint(int(uint(_872) >> uint(2)));
    float _882 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_880)]);
    int _884 = _872 + 4;
    uint _886 = uint(int(uint(_884) >> uint(2)));
    float _888 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_886)]);
    int _890 = _872 + 8;
    uint _892 = uint(int(uint(_890) >> uint(2)));
    float _894 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_892)]);
    int _896 = _872 + 12;
    uint _898 = uint(int(uint(_896) >> uint(2)));
    float _900 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_898)]);
    int _902 = as_type<int>(_682);
    float _904 = _804;
    if (!_878)
    {
        float _906 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[500]);
        _902 = as_type<int>(_906);
    }
    int _908 = _902;
    float _910 = _686 * _786;
    float _912 = fma(_780, _654, _910);
    float _914 = fma(_792, _656, _912);
    float _916 = _798 + _914;
    float _918 = _686 * _810;
    float _920 = 1.0 / _916;
    float _922 = fma(_804, _654, _918);
    float _924 = fma(_816, _656, _922);
    float _926 = _822 + _924;
    float _928 = _926 * _920;
    bool _930 = _928 >= 0.0;
    bool _932 = _928 <= 1.0;
    bool _934 = _932 && _930;
    int _936 = as_type<int>((*spvDescriptorSet0.cp_c0)._m0[41].x) + 280;
    bool _938 = uint(_936) < as_type<uint>((*spvDescriptorSet0.cp_c0)._m0[41].x);
    int _940 = int(_938);
    bool _942 = uint(_936) < uint(_936);
    int _944 = int(_942);
    int _946 = _940 + _944;
    int _948 = _946 & 1;
    bool _950 = _948 != 0;
    int _952 = int(_950);
    int _954 = as_type<int>((*spvDescriptorSet0.cp_c0)._m0[41].y) + _952;
    float _956 = _170 * _210;
    float _958 = _686 * _846;
    float _960 = fma(_840, _654, _958);
    float _962 = fma(_852, _656, _960);
    float _964 = _858 + _962;
    float _966 = _964 * _920;
    float _968 = abs(_208);
    float _970 = log2(_968);
    bool _972 = _966 >= 0.0;
    bool _974 = _972 && _934;
    bool _976 = _966 <= 1.0;
    bool _978 = _976 && _974;
    float _980 = _686 * _888;
    bool _982 = _908 <= _864;
    bool _984 = _982 || _878;
    float _986 = fma(_882, _654, _980);
    float _988 = -_214;
    float _990 = _874 + _988;
    float _992 = fma(_894, _656, _986);
    float _994 = _170 * _970;
    bool _996 = _990 > 0.001000000047497451305389404296875;
    bool _998 = isnan(_990);
    bool _1000 = _996 || _998;
    bool _1002 = isnan(0.001000000047497451305389404296875);
    bool _1004 = _1000 || _1002;
    float _1006 = _900 + _992;
    float _1008 = _986;
    float _1010 = _962;
    float _1012 = _924;
    float _1014 = _882;
    if (_978)
    {
        float _1016 = float(_772);
        _904 = _1016;
    }
    float _1018 = _904;
    if (_984)
    {
        _1008 = 1.0;
    }
    float _1020 = _1008;
    float _1022 = _1020;
    if (!_984)
    {
        float _1024 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[500]);
        int _1026 = _864 * as_type<int>(_1024);
        int _1028 = _1026 + _712;
        int _1030 = _1028 << 2;
        uint _1032 = uint(int(uint(_1028) >> uint(2)));
        int _1034 = 12 & _1030;
        int _1036 = int(_1032) << 4;
        int _1038 = _1036 + _1034;
        int _1040 = _1038 + 400;
        uint _1042 = uint(int(uint(_1040) >> uint(2)));
        float _1044 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1042)]);
        float _1046 = floor(_694);
        float _1048 = floor(_830);
        float _1050 = -_1046;
        float _1052 = _694 + _1050;
        float _1054 = -_1048;
        float _1056 = _830 + _1054;
        float _1058 = rint(_1044);
        float _1060 = precise::max(_1058, 0.0);
        uint _1062 = uint(_1060);
        uint _1064 = clamp(_1062, 0u, 65535u);
        float3 _3278 = float3(_1052, _1056, float(int(_1064)));
        float3 _3282 = select(_3278, float3(0.0), isnan(_3278));
        float _1066 = dm_bs(spvDescriptorSet0.cp_t_tcb_14.sample(spvDescriptorSet0.cp_t_tcb_14Smplr, _3282.xy, uint(rint(_3282.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_14, spvDescriptorSet0.cp_t_tcb_14Smplr_w, _3282.xy, uint(rint(_3282.z)), level(0.0)).x;
        int _1068 = _1028 << 4;
        int _1070 = _1068 + 2048;
        uint _1072 = uint(int(uint(_1070) >> uint(2)));
        float _1074 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1072)]);
        int _1076 = _1070 + 4;
        uint _1078 = uint(int(uint(_1076) >> uint(2)));
        float _1080 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1078)]);
        int _1082 = _1070 + 8;
        uint _1084 = uint(int(uint(_1082) >> uint(2)));
        float _1086 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1084)]);
        int _1088 = _1070 + 12;
        uint _1090 = uint(int(uint(_1088) >> uint(2)));
        float _1092 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1090)]);
        float _1094 = _686 * _1080;
        float _1096 = fma(_1074, _654, _1094);
        float _1098 = fma(_1086, _656, _1096);
        float _1100 = _1092 + _1098;
        float _1102 = precise::clamp(_1100, 0.0, 1.0);
        float _1104 = -_1102;
        float _1106 = _1104 + _1066;
        float _1108 = fma(_1106, 500.0, 1.5);
        float _1110 = exp2(_1108);
        float _1112 = 0.0 + _1110;
        float _1114 = precise::clamp(_1112, 0.0, 1.0);
        _286 = _1044;
        _1010 = _1056;
        _1012 = as_type<float>(_1064);
        _1014 = _1074;
        _1022 = _1114;
    }
    float _1116 = _286;
    float _1118 = _1010;
    float _1120 = _1012;
    float _1122 = _1014;
    float _1124 = _1022;
    float _1126 = _1018;
    float _1128 = _1120;
    float _1130 = _1122;
    float _1132 = _1116;
    if (_978)
    {
        float _1134 = rint(_1018);
        float _1136 = precise::max(_1134, 0.0);
        uint _1138 = uint(_1136);
        uint _1140 = clamp(_1138, 0u, 65535u);
        _1126 = as_type<float>(_1140);
    }
    float _1142 = _1126;
    float _1144 = _1006 * _920;
    bool _1146 = _726 != 0.0;
    bool _1148 = isnan(_726);
    bool _1150 = _1146 || _1148;
    bool _1152 = isnan(0.0);
    bool _1154 = _1150 || _1152;
    uint _1156 = uint(int(uint(_164) >> uint(2)));
    float _1158 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1156)]);
    float _1160 = _1144;
    if (!_1004)
    {
        float _1162 = fma(_654, 6.2500002968590706586837768554688e-05, 0.4999375045299530029296875);
        _1128 = _1162;
    }
    float _1164 = _1128;
    if (!_1004)
    {
        float _1166 = fma(_654, 6.2500002968590706586837768554688e-05, 0.500062525272369384765625);
        _1130 = _1166;
    }
    float _1168 = _1130;
    float _1170 = exp2(_994);
    float _1172 = _966;
    float _1174 = _1142;
    if (_978)
    {
        float3 _3441 = float3(_928, _966, float(as_type<int>(_1142)));
        float3 _3443 = select(_3441, float3(0.0), isnan(_3441));
        float _1176 = spvDepthCast(spvDescriptorSet0.cp_t_tcb_16).sample_compare(spvDescriptorSet0.cp_t_tcb_16Smplr, _3443.xy, uint(rint(_3443.z)), _1144, level(0.0));
        _1172 = _1176;
    }
    float _1178 = _1172;
    if (!_1154)
    {
        _1132 = 4.0;
    }
    float _1180 = _1132;
    float _1182 = _726;
    float _1184 = _1180;
    if (!_1154)
    {
        float2 _3463 = float2(_722, _724);
        float _1186 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_3463, float2(0.0), isnan(_3463)), level(_1180)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_3463, float2(0.0), isnan(_3463)), level(_1180)).x;
        _1182 = _1186;
    }
    float _1188 = _1182;
    float _1190 = _1118;
    if (!_1004)
    {
        float2 _3479 = float2(_1164, _724);
        float _1192 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_3479, float2(0.0), isnan(_3479)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_3479, float2(0.0), isnan(_3479)), level(0.0)).x;
        _1190 = _1192;
    }
    float _1194 = _1190;
    float _1196 = _780;
    if (!_1004)
    {
        float2 _3494 = float2(_1168, _724);
        float _1198 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_3494, float2(0.0), isnan(_3494)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_3494, float2(0.0), isnan(_3494)), level(0.0)).x;
        _1196 = _1198;
    }
    float _1200 = _1196;
    float _1202 = _328 * _956;
    if (!_978)
    {
        _422 = 1.0;
    }
    float _1204 = _422;
    float _1206 = _330 * _956;
    float _1208 = _332 * _956;
    float _1210 = fma(_178, _1170, _1202);
    float _1212 = fma(_184, _1170, _1206);
    float _1214 = fma(_190, _1170, _1208);
    float _1216 = _1204;
    float _1218 = _1178;
    float _1220 = _1194;
    if (_978)
    {
        bool _1222 = _1178 >= _1144;
        bool _1224 = isnan(_1178);
        bool _1226 = _1222 || _1224;
        bool _1228 = isnan(_1144);
        bool _1230 = _1226 || _1228;
        float _1232 = float(_1230);
        _1216 = _1232;
    }
    float _1234 = _1216;
    float _1236 = -_1234;
    float _1238 = fma(_1236, _1124, 1.0);
    float _1240 = -_1158;
    float _1242 = _1238 + _1240;
    float _1244 = _1238;
    int _1246 = as_type<int>(_1242);
    if (_1004)
    {
        float _1248 = fma(_1242, 0.0500000007450580596923828125, _1158);
        _1244 = _1248;
    }
    float _1250 = _1244;
    float _1252 = precise::max(0.0, _1250);
    float _1254 = precise::min(_1252, 0.999000012874603271484375);
    uint _1256 = uint(int(uint(_164) >> uint(2)));
    (*spvDescriptorSet0.cp_s12)._m0[int(_1256)] = as_type<uint>(_1254);
    float _1258 = as_type<float>(_954);
    if (!_1004)
    {
        float _1260 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[76]);
        _1258 = _1260;
    }
    float _1262 = _1258;
    if (!_1004)
    {
        int _1264 = _164 + 4;
        _288 = as_type<float>(_1264);
    }
    float _1266 = _288;
    float _1268 = _1266;
    if (!_1004)
    {
        float _1270 = fma(_1188, 2000.0, _1262);
        _1246 = as_type<int>(_1270);
    }
    int _1272 = _1246;
    if (!_1004)
    {
        uint _1274 = uint(int(uint(as_type<int>(_1266)) >> uint(2)));
        (*spvDescriptorSet0.cp_s12)._m0[int(_1274)] = uint(_1272);
    }
    if (!_1004)
    {
        float _1276 = fma(_656, 6.2500002968590706586837768554688e-05, 0.4999375045299530029296875);
        float _1278 = fma(_656, 6.2500002968590706586837768554688e-05, 0.500062525272369384765625);
        bool _1280 = _1194 != 0.0;
        bool _1282 = isnan(_1194);
        bool _1284 = _1280 || _1282;
        bool _1286 = isnan(0.0);
        bool _1288 = _1284 || _1286;
        float2 _3653 = float2(_722, _1276);
        float _1290 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_3653, float2(0.0), isnan(_3653)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_3653, float2(0.0), isnan(_3653)), level(0.0)).x;
        float2 _3661 = float2(_722, _1278);
        float _1292 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_3661, float2(0.0), isnan(_3661)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_3661, float2(0.0), isnan(_3661)), level(0.0)).x;
        float2 _3669 = float2(_1164, _1276);
        float _1294 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_3669, float2(0.0), isnan(_3669)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_3669, float2(0.0), isnan(_3669)), level(0.0)).x;
        float2 _3677 = float2(_1164, _1278);
        float _1296 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_3677, float2(0.0), isnan(_3677)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_3677, float2(0.0), isnan(_3677)), level(0.0)).x;
        float2 _3685 = float2(_1168, _1276);
        float _1298 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_3685, float2(0.0), isnan(_3685)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_3685, float2(0.0), isnan(_3685)), level(0.0)).x;
        float2 _3693 = float2(_1168, _1278);
        float _1300 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_3693, float2(0.0), isnan(_3693)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_3693, float2(0.0), isnan(_3693)), level(0.0)).x;
        if (_1288)
        {
            _290 = _1194;
        }
        float _1302 = _290;
        if (!_1288)
        {
            _1268 = 4.0;
        }
        float _1304 = _1268;
        float _1306 = _1302;
        float _1308 = _1304;
        if (!_1288)
        {
            float2 _3716 = float2(_1164, _724);
            float _1310 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_3716, float2(0.0), isnan(_3716)), level(_1304)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_3716, float2(0.0), isnan(_3716)), level(_1304)).x;
            _1306 = _1310;
        }
        float _1312 = _1306;
        bool _1314 = _1200 != 0.0;
        bool _1316 = isnan(_1200);
        bool _1318 = _1314 || _1316;
        bool _1320 = isnan(0.0);
        bool _1322 = _1318 || _1320;
        if (_1322)
        {
            _1308 = _1200;
        }
        float _1324 = _1308;
        if (!_1322)
        {
            _764 = 4.0;
        }
        float _1326 = _764;
        float _1328 = _1324;
        if (!_1322)
        {
            float2 _3753 = float2(_1168, _724);
            float _1330 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_3753, float2(0.0), isnan(_3753)), level(_1326)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_3753, float2(0.0), isnan(_3753)), level(_1326)).x;
            _1328 = _1330;
        }
        float _1332 = _1328;
        bool _1334 = _1290 != 0.0;
        bool _1336 = isnan(_1290);
        bool _1338 = _1334 || _1336;
        bool _1340 = isnan(0.0);
        bool _1342 = _1338 || _1340;
        bool _1344 = _1294 != 0.0;
        bool _1346 = isnan(_1294);
        bool _1348 = _1344 || _1346;
        bool _1350 = isnan(0.0);
        bool _1352 = _1348 || _1350;
        bool _1354 = _1296 != 0.0;
        bool _1356 = isnan(_1296);
        bool _1358 = _1354 || _1356;
        bool _1360 = isnan(0.0);
        bool _1362 = _1358 || _1360;
        bool _1364 = _1300 != 0.0;
        bool _1366 = isnan(_1300);
        bool _1368 = _1364 || _1366;
        bool _1370 = isnan(0.0);
        bool _1372 = _1368 || _1370;
        bool _1374 = _1298 != 0.0;
        bool _1376 = isnan(_1298);
        bool _1378 = _1374 || _1376;
        bool _1380 = isnan(0.0);
        bool _1382 = _1378 || _1380;
        bool _1384 = _1292 != 0.0;
        bool _1386 = isnan(_1292);
        bool _1388 = _1384 || _1386;
        bool _1390 = isnan(0.0);
        bool _1392 = _1388 || _1390;
        if (!_1342)
        {
            _766 = 4.0;
        }
        float _1394 = _766;
        if (!_1352)
        {
            _1218 = 4.0;
        }
        float _1396 = _1218;
        if (!_1362)
        {
            _1160 = 4.0;
        }
        float _1398 = _1160;
        if (!_1372)
        {
            _1174 = 4.0;
        }
        float _1400 = _1174;
        if (!_1382)
        {
            _1220 = 4.0;
        }
        float _1402 = _1220;
        float _1404 = _1296;
        if (!_1362)
        {
            float2 _3860 = float2(_1164, _1278);
            float _1406 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_3860, float2(0.0), isnan(_3860)), level(_1398)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_3860, float2(0.0), isnan(_3860)), level(_1398)).x;
            _1404 = _1406;
        }
        float _1408 = _1404;
        float _1410 = _1300;
        if (!_1372)
        {
            float2 _3876 = float2(_1168, _1278);
            float _1412 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_3876, float2(0.0), isnan(_3876)), level(_1400)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_3876, float2(0.0), isnan(_3876)), level(_1400)).x;
            _1410 = _1412;
        }
        float _1414 = _1410;
        float _1416 = _1294;
        if (!_1352)
        {
            float2 _3892 = float2(_1164, _1276);
            float _1418 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_3892, float2(0.0), isnan(_3892)), level(_1396)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_3892, float2(0.0), isnan(_3892)), level(_1396)).x;
            _1416 = _1418;
        }
        float _1420 = _1416;
        float _1422 = _1298;
        if (!_1382)
        {
            float2 _3908 = float2(_1168, _1276);
            float _1424 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_3908, float2(0.0), isnan(_3908)), level(_1402)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_3908, float2(0.0), isnan(_3908)), level(_1402)).x;
            _1422 = _1424;
        }
        float _1426 = _1422;
        if (!_1392)
        {
            _1184 = 4.0;
        }
        float _1428 = _1184;
        float _1430 = _1292;
        if (!_1392)
        {
            float2 _3929 = float2(_722, _1278);
            float _1432 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_3929, float2(0.0), isnan(_3929)), level(_1428)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_3929, float2(0.0), isnan(_3929)), level(_1428)).x;
            _1430 = _1432;
        }
        float _1434 = _1430;
        float _1436 = _1290;
        if (!_1342)
        {
            float2 _3945 = float2(_722, _1276);
            float _1438 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_3945, float2(0.0), isnan(_3945)), level(_1394)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_3945, float2(0.0), isnan(_3945)), level(_1394)).x;
            _1436 = _1438;
        }
        float _1440 = _1436;
        float _1442 = -_1312;
        float _1444 = _1188 + _1442;
        float _1446 = -_1332;
        float _1448 = _1188 + _1446;
        float _1450 = abs(_1444);
        float _1452 = abs(_1448);
        float _1454 = precise::max(_1450, _1452);
        float _1456 = -_1408;
        float _1458 = _1188 + _1456;
        float _1460 = -_1414;
        float _1462 = _1188 + _1460;
        float _1464 = -_1420;
        float _1466 = _1188 + _1464;
        float _1468 = -_1426;
        float _1470 = _1188 + _1468;
        float _1472 = abs(_1466);
        float _1474 = abs(_1458);
        float _1476 = precise::max(_1472, _1474);
        float _1478 = -_1434;
        float _1480 = _1188 + _1478;
        float _1482 = -_1440;
        float _1484 = _1188 + _1482;
        float _1486 = abs(_1470);
        float _1488 = abs(_1462);
        float _1490 = precise::max(_1486, _1488);
        float _1492 = abs(_1484);
        float _1494 = abs(_1480);
        float _1496 = precise::max(_1492, _1494);
        float _1498 = precise::max(_1476, _1490);
        float _1500 = precise::max(_1454, _1496);
        bool _1502 = _1498 > 0.00150000001303851604461669921875;
        bool _1504 = _1500 > 0.00150000001303851604461669921875;
        bool _1506 = _1504 || _1502;
        bool _1508 = !_1506;
        int _1510 = _1508 ? as_type<int>(_222) : 0;
        _468 = _1510;
    }
    int _1512 = _468;
    int _1514 = _164 + 4;
    int _1516 = _164 + 8;
    uint _1518 = uint(int(uint(_168) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1518)] = uint(_1512);
    uint _1520 = uint(int(uint(_164) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1520)] = as_type<uint>(_316);
    uint _1522 = uint(int(uint(_1514) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1522)] = as_type<uint>(_314);
    uint _1524 = uint(int(uint(_1516) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1524)] = as_type<uint>(_318);
    uint _1526 = uint(int(uint(_164) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_1526)] = as_type<uint>(_1210);
    uint _1528 = uint(int(uint(_1514) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_1528)] = as_type<uint>(_1212);
    uint _1530 = uint(int(uint(_1516) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_1530)] = as_type<uint>(_1214);
    uint _1532 = uint(int(uint(_164) >> uint(2)));
    (*spvDescriptorSet0.cp_s5)._m0[int(_1532)] = as_type<uint>(_310);
    uint _1534 = uint(int(uint(_1514) >> uint(2)));
    (*spvDescriptorSet0.cp_s5)._m0[int(_1534)] = as_type<uint>(_308);
    uint _1536 = uint(int(uint(_1516) >> uint(2)));
    (*spvDescriptorSet0.cp_s5)._m0[int(_1536)] = as_type<uint>(_312);
    float _1538 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _1540 = _308 * _308;
    float _1542 = _1212 * _1212;
    float _1544 = fma(_310, _310, _1540);
    float _1546 = fma(_1210, _1210, _1542);
    float _1548 = fma(_312, _312, _1544);
    float _1550 = fma(_1214, _1214, _1546);
    float _1552 = sqrt(_1550);
    float _1554 = sqrt(_1548);
    bool _1556 = _1554 >= 9.9999999747524270787835121154785e-07;
    bool _1558 = isnan(_1554);
    bool _1560 = _1556 || _1558;
    bool _1562 = isnan(9.9999999747524270787835121154785e-07);
    bool _1564 = _1560 || _1562;
    float _1566 = _1554;
    int _1582;
    if (!_1564)
    {
        bool _1568 = _874 != _214;
        bool _1570 = isnan(_874);
        bool _1572 = _1568 || _1570;
        bool _1574 = isnan(_214);
        bool _1576 = _1572 || _1574;
        if (_1576)
        {
            _342 = as_type<int>(_396);
        }
        int _1578 = _342;
        int _1580 = _1578;
        _1582 = _1578;
        _1584 = _1576;
        if (!_1584)
        {
            float _1586 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
            bool _1588 = _1586 > 0.0;
            bool _1590 = !_1588;
            if (!_1590)
            {
                float _1592 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
                float _1594 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
                float _1596 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
                float _1598 = _1594 * _1594;
                float _1600 = fma(_1592, _1592, _1598);
                float _1602 = fma(_1596, _1596, _1600);
                float _1604 = rsqrt(_1602);
                float _1606 = _1604 * 9.9999999747524270787835121154785e-07;
                float _1608 = _1592 * _1606;
                float _1610 = _1594 * _1606;
                float _1612 = _1596 * _1606;
                _1582 = as_type<int>(_1608);
                _458 = as_type<int>(_1610);
                _460 = as_type<int>(_1612);
                _1584 = true;
            }
            else
            {
                bool _1614 = _1552 >= 9.9999999747524270787835121154785e-07;
                bool _1616 = isnan(_1552);
                bool _1618 = _1614 || _1616;
                bool _1620 = isnan(9.9999999747524270787835121154785e-07);
                bool _1622 = _1618 || _1620;
                if (!_1622)
                {
                    float _1624 = _314 * _314;
                    float _1626 = fma(_316, _316, _1624);
                    float _1628 = fma(_318, _318, _1626);
                    float _1630 = sqrt(_1628);
                    bool _1632 = _1630 >= 9.9999999747524270787835121154785e-07;
                    bool _1634 = isnan(_1630);
                    bool _1636 = _1632 || _1634;
                    bool _1638 = isnan(9.9999999747524270787835121154785e-07);
                    bool _1640 = _1636 || _1638;
                    int _1642 = as_type<int>(_408);
                    int _1644 = as_type<int>(_1630);
                    if (_1640)
                    {
                        float _1646 = rsqrt(_1628);
                        _1642 = as_type<int>(_1646);
                    }
                    int _1648 = _1642;
                    if (!_1640)
                    {
                        _1580 = 0;
                    }
                    int _1650 = _1580;
                    int _1652 = _1650;
                    if (!_1640)
                    {
                        _1644 = 897988541;
                    }
                    int _1654 = _1644;
                    int _1656 = _1648;
                    int _1658 = _1654;
                    if (_1640)
                    {
                        float _1660 = as_type<float>(_1648) * 9.9999999747524270787835121154785e-07;
                        _1566 = _1660;
                    }
                    float _1662 = _1566;
                    if (!_1640)
                    {
                        _1656 = 0;
                    }
                    int _1664 = _1656;
                    int _1666 = _1664;
                    if (_1640)
                    {
                        float _1668 = _316 * _1662;
                        _1652 = as_type<int>(_1668);
                    }
                    int _1670 = _1652;
                    _1582 = _1670;
                    if (_1640)
                    {
                        float _1672 = _314 * _1662;
                        _1658 = as_type<int>(_1672);
                    }
                    int _1674 = _1658;
                    _458 = _1674;
                    if (_1640)
                    {
                        float _1676 = _318 * _1662;
                        _1666 = as_type<int>(_1676);
                    }
                    int _1678 = _1666;
                    _460 = _1678;
                    _1584 = true;
                }
                else
                {
                    float _1680 = rsqrt(_1550);
                    float _1682 = _1680 * 9.9999999747524270787835121154785e-07;
                    float _1684 = _1210 * _1682;
                    float _1686 = _1212 * _1682;
                    float _1688 = _1214 * _1682;
                    _1582 = as_type<int>(_1684);
                    _458 = as_type<int>(_1686);
                    _460 = as_type<int>(_1688);
                    _1584 = true;
                }
            }
        }
    }
    else
    {
        float _1690 = _1552 * _1538;
        bool _1692 = _1690 >= 0.001000000047497451305389404296875;
        bool _1694 = isnan(_1690);
        bool _1696 = _1692 || _1694;
        bool _1698 = isnan(0.001000000047497451305389404296875);
        bool _1700 = _1696 || _1698;
        bool _1702 = _1690 > 0.0;
        bool _1704 = !_1700;
        bool _1706 = _1702 && _1704;
        bool _1708 = _1554 < 0.001000000047497451305389404296875;
        bool _1710 = _1708 && _1706;
        if (!_1710)
        {
            _454 = as_type<int>(_308);
        }
        int _1712 = _454;
        int _1714 = _1712;
        if (_1710)
        {
            float _1716 = _1210 * _1538;
            _344 = as_type<int>(_1716);
        }
        int _1718 = _344;
        _1582 = _1718;
        if (!_1710)
        {
            _456 = as_type<int>(_312);
        }
        int _1720 = _456;
        _460 = _1720;
        if (_1710)
        {
            float _1722 = _1212 * _1538;
            _1714 = as_type<int>(_1722);
        }
        int _1724 = _1714;
        _458 = _1724;
        if (_1710)
        {
            float _1726 = _1214 * _1538;
            _460 = as_type<int>(_1726);
        }
    }
    _1584 = false;
    int _1728 = _1582;
    int _1730 = _458;
    int _1732 = _460;
    uint _1734 = uint(int(uint(_164) >> uint(2)));
    (*spvDescriptorSet0.cp_s5)._m0[int(_1734)] = uint(_1728);
    uint _1736 = uint(int(uint(_1514) >> uint(2)));
    (*spvDescriptorSet0.cp_s5)._m0[int(_1736)] = uint(_1730);
    uint _1738 = uint(int(uint(_1516) >> uint(2)));
    (*spvDescriptorSet0.cp_s5)._m0[int(_1738)] = uint(_1732);
}

