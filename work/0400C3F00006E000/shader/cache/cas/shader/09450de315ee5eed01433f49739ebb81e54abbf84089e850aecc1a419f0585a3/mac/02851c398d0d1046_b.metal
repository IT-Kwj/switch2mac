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
    bool _1262 = false;
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
    if (_218)
    {
        float _288 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _290 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _292 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _294 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        _274 = _288;
        _276 = _290;
        _278 = _292;
        _280 = _294;
    }
    float _296 = _274;
    float _298 = _276;
    float _300 = _278;
    float _302 = _280;
    float _304 = _184 * _272;
    float _306 = _178 * _272;
    float _308 = _190 * _272;
    float _310 = _200 + _304;
    float _312 = _194 + _306;
    float _314 = _206 + _308;
    int _316 = as_type<int>(_166) & 1024;
    bool _318 = _316 != 0;
    int _320 = as_type<int>(_166) & 2048;
    bool _322 = _320 != 0;
    float _324 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
    float _326 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
    float _328 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
    float _330 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
    float _332 = _240;
    float _334 = _242;
    float _336 = _264;
    int _338 = as_type<int>(_306);
    int _340 = as_type<int>(_306);
    if (_218)
    {
        float _342 = _310 * _242;
        _282 = _342;
    }
    float _344 = _282;
    float _346 = _344;
    if (_218)
    {
        float _348 = _310 * _266;
        _284 = _348;
    }
    float _350 = _284;
    float _352 = _350;
    if (_218)
    {
        float _354 = fma(_312, _240, _344);
        _346 = _354;
    }
    float _356 = _346;
    float _358 = _356;
    if (_218)
    {
        float _360 = fma(_312, _264, _350);
        _352 = _360;
    }
    float _362 = _352;
    float _364 = _362;
    if (_218)
    {
        float _366 = fma(_314, _244, _356);
        _358 = _366;
    }
    float _368 = _358;
    if (_218)
    {
        float _370 = fma(_314, _268, _362);
        _364 = _370;
    }
    float _372 = _364;
    if (!_218)
    {
        _332 = 0.0;
        _334 = 0.0;
    }
    float _374 = _332;
    float _376 = _334;
    float _378 = _376;
    float _380 = _374;
    if (_218)
    {
        float _382 = _246 + _368;
        _378 = _382;
    }
    float _384 = _378;
    if (_218)
    {
        float _386 = _270 + _372;
        _380 = _386;
    }
    float _388 = _380;
    uint _390 = uint(int(uint(_164) >> uint(2)));
    float _392 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_390)]);
    int _394 = _164 + 4;
    uint _396 = uint(int(uint(_394) >> uint(2)));
    float _398 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_396)]);
    int _400 = _164 + 8;
    uint _402 = uint(int(uint(_400) >> uint(2)));
    float _404 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_402)]);
    int _406 = _164 + 12;
    uint _408 = uint(int(uint(_406) >> uint(2)));
    float _410 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_408)]);
    float _412 = _298;
    float _414 = _300;
    float _416 = _330;
    if (_218)
    {
        float _418 = _310 * _298;
        _412 = _418;
    }
    float _420 = _412;
    float _422 = _420;
    if (_218)
    {
        float _424 = fma(_312, _296, _420);
        _422 = _424;
    }
    float _426 = _422;
    if (_218)
    {
        float _428 = fma(_314, _300, _426);
        _414 = _428;
    }
    float _430 = _414;
    if (!_218)
    {
        _336 = 0.0;
    }
    float _432 = _336;
    float _434 = _432;
    if (!_318)
    {
        _416 = _388;
    }
    float _436 = _416;
    float _438 = _436;
    if (_218)
    {
        float _440 = _302 + _430;
        _434 = _440;
    }
    float _442 = _434;
    float _444 = _410;
    float _446 = _442;
    int _448 = as_type<int>(_398);
    int _450 = as_type<int>(_404);
    int _452 = as_type<int>(_398);
    int _454 = as_type<int>(_404);
    if (!_318)
    {
        _444 = _384;
    }
    float _456 = _444;
    bool _458 = !_318;
    float _460 = _456;
    if (!_458)
    {
        float _462 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        uint _464 = uint(int(uint(_164) >> uint(2)));
        float _466 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_464)]);
        int _468 = _164 + 4;
        uint _470 = uint(int(uint(_468) >> uint(2)));
        float _472 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_470)]);
        int _474 = _164 + 8;
        uint _476 = uint(int(uint(_474) >> uint(2)));
        float _478 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_476)]);
        uint _480 = uint(int(uint(_164) >> uint(2)));
        float _482 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_480)]);
        int _484 = _164 + 4;
        uint _486 = uint(int(uint(_484) >> uint(2)));
        float _488 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_486)]);
        int _490 = _164 + 8;
        uint _492 = uint(int(uint(_490) >> uint(2)));
        float _494 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_492)]);
        uint _496 = uint(int(uint(_164) >> uint(2)));
        float _498 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_496)]);
        int _500 = _164 + 4;
        uint _502 = uint(int(uint(_500) >> uint(2)));
        float _504 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_502)]);
        int _506 = _164 + 8;
        uint _508 = uint(int(uint(_506) >> uint(2)));
        float _510 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_508)]);
        float _512 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        float _514 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        float _516 = _310 * _472;
        float _518 = _310 * _488;
        float _520 = _310 * _504;
        float _522 = fma(_312, _466, _516);
        float _524 = fma(_312, _482, _518);
        float _526 = fma(_312, _498, _520);
        float _528 = fma(_314, _478, _522);
        float _530 = fma(_314, _494, _524);
        float _532 = fma(_314, _510, _526);
        float _534 = _462 + _528;
        float _536 = _512 + _530;
        float _538 = _514 + _532;
        _446 = _536;
        _460 = _534;
        _438 = _538;
    }
    float _540 = _446;
    float _542 = _460;
    float _544 = _438;
    bool _546 = !_322;
    float _548 = _540;
    float _550 = _542;
    float _552 = _544;
    if (!_546)
    {
        uint _554 = uint(int(uint(_164) >> uint(2)));
        float _556 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_554)]);
        int _558 = _164 + 4;
        uint _560 = uint(int(uint(_558) >> uint(2)));
        float _562 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_560)]);
        int _564 = _164 + 8;
        uint _566 = uint(int(uint(_564) >> uint(2)));
        float _568 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_566)]);
        int _570 = _164 + 12;
        uint _572 = uint(int(uint(_570) >> uint(2)));
        float _574 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_572)]);
        uint _576 = uint(int(uint(_164) >> uint(2)));
        float _578 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_576)]);
        int _580 = _164 + 4;
        uint _582 = uint(int(uint(_580) >> uint(2)));
        float _584 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_582)]);
        int _586 = _164 + 8;
        uint _588 = uint(int(uint(_586) >> uint(2)));
        float _590 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_588)]);
        int _592 = _164 + 12;
        uint _594 = uint(int(uint(_592) >> uint(2)));
        float _596 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_594)]);
        uint _598 = uint(int(uint(_164) >> uint(2)));
        float _600 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_598)]);
        int _602 = _164 + 4;
        uint _604 = uint(int(uint(_602) >> uint(2)));
        float _606 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_604)]);
        int _608 = _164 + 8;
        uint _610 = uint(int(uint(_608) >> uint(2)));
        float _612 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_610)]);
        int _614 = _164 + 12;
        uint _616 = uint(int(uint(_614) >> uint(2)));
        float _618 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_616)]);
        float _620 = _310 * _562;
        float _622 = _310 * _584;
        float _624 = _310 * _606;
        float _626 = fma(_312, _556, _620);
        float _628 = fma(_312, _578, _622);
        float _630 = fma(_312, _600, _624);
        float _632 = fma(_314, _568, _626);
        float _634 = fma(_314, _590, _628);
        float _636 = fma(_314, _612, _630);
        float _638 = _632 + _574;
        float _640 = _634 + _596;
        float _642 = _636 + _618;
        _548 = _640;
        _550 = _638;
        _552 = _642;
    }
    float _644 = _548;
    float _646 = _550;
    float _648 = _552;
    float _650 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[70]);
    float _652 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[504]);
    float _654 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[505]);
    float _656 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[506]);
    float _658 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[507]);
    float _660 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[501]);
    float _662 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[8]);
    float _664 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[9]);
    float _666 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[10]);
    float _668 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[11]);
    float _670 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[61]);
    float _672 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[60]);
    float _674 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[502]);
    float _676 = _650 + 1.0;
    float _678 = _676 + _644;
    float _680 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[508]);
    float _682 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[509]);
    float _684 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[510]);
    float _686 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[511]);
    float _688 = _678 * _654;
    float _690 = fma(_652, _646, _688);
    float _692 = fma(_656, _648, _690);
    float _694 = _658 + _692;
    float _696 = trunc(_694);
    int _698 = int(_696);
    int _700 = ~as_type<int>(_660);
    int _702 = _698 + _700;
    int _704 = _702 + 1;
    bool _706 = _704 >= 0;
    int _708 = 0;
    if (_706)
    {
        float _710 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[500]);
        _708 = as_type<int>(_710);
    }
    int _712 = _708;
    float _714 = fma(_646, 6.2500002968590706586837768554688e-05, 0.5);
    float _716 = fma(_648, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _2430 = float2(_714, _716);
    float2 _720 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_2430, float2(0.0), isnan(_2430)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_2430, float2(0.0), isnan(_2430)), level(0.0)).xy;
    float _722 = _720.x;
    float _724 = _720.y;
    float _726 = _664 * _644;
    float _728 = fma(_662, _646, _726);
    float _730 = fma(_666, _648, _728);
    float _732 = _668 + _730;
    float _734 = -_732;
    bool _736 = _670 >= _734;
    bool _738 = isnan(_670);
    bool _740 = _736 || _738;
    bool _742 = isnan(_734);
    bool _744 = _740 || _742;
    float _746 = -_732;
    bool _748 = _672 >= _746;
    bool _750 = isnan(_672);
    bool _752 = _748 || _750;
    bool _754 = isnan(_746);
    bool _756 = _752 || _754;
    int _758 = _744 ? 0 : 1;
    int _760 = 2;
    if (_744)
    {
        _760 = 1;
    }
    int _762 = _760;
    int _764 = _762;
    if (_756)
    {
        _764 = _758;
    }
    int _766 = _764;
    int _768 = _766 << 6;
    int _770 = _768 + 96;
    uint _772 = uint(int(uint(_770) >> uint(2)));
    float _774 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_772)]);
    int _776 = _770 + 4;
    uint _778 = uint(int(uint(_776) >> uint(2)));
    float _780 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_778)]);
    int _782 = _770 + 8;
    uint _784 = uint(int(uint(_782) >> uint(2)));
    float _786 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_784)]);
    int _788 = _770 + 12;
    uint _790 = uint(int(uint(_788) >> uint(2)));
    float _792 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_790)]);
    int _794 = _768 + 48;
    int _796 = _768 + 64;
    uint _798 = uint(int(uint(_794) >> uint(2)));
    float _800 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_798)]);
    int _802 = _794 + 4;
    uint _804 = uint(int(uint(_802) >> uint(2)));
    float _806 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_804)]);
    int _808 = _794 + 8;
    uint _810 = uint(int(uint(_808) >> uint(2)));
    float _812 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_810)]);
    int _814 = _794 + 12;
    uint _816 = uint(int(uint(_814) >> uint(2)));
    float _818 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_816)]);
    uint _820 = uint(int(uint(_796) >> uint(2)));
    float _822 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_820)]);
    int _824 = _796 + 4;
    uint _826 = uint(int(uint(_824) >> uint(2)));
    float _828 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_826)]);
    int _830 = _796 + 8;
    uint _832 = uint(int(uint(_830) >> uint(2)));
    float _834 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_832)]);
    int _836 = _796 + 12;
    uint _838 = uint(int(uint(_836) >> uint(2)));
    float _840 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_838)]);
    float _842 = _678 * _682;
    float _844 = fma(_680, _646, _842);
    float _846 = fma(_684, _648, _844);
    float _848 = _686 + _846;
    float _850 = trunc(_848);
    int _852 = int(_850);
    bool _854 = _712 <= _704;
    bool _856 = !_706;
    bool _858 = _854 || _856;
    int _860 = ~as_type<int>(_674);
    int _862 = _852 + _860;
    int _864 = _862 + 1;
    bool _866 = _864 < 0;
    bool _868 = _866 || _858;
    int _870 = _768 + 80;
    uint _872 = uint(int(uint(_870) >> uint(2)));
    float _874 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_872)]);
    int _876 = _870 + 4;
    uint _878 = uint(int(uint(_876) >> uint(2)));
    float _880 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_878)]);
    int _882 = _870 + 8;
    uint _884 = uint(int(uint(_882) >> uint(2)));
    float _886 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_884)]);
    int _888 = _870 + 12;
    uint _890 = uint(int(uint(_888) >> uint(2)));
    float _892 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_890)]);
    int _894 = 0;
    float _896 = _800;
    if (!_868)
    {
        float _898 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[500]);
        _894 = as_type<int>(_898);
    }
    int _900 = _894;
    float _902 = _678 * _780;
    float _904 = fma(_774, _646, _902);
    float _906 = fma(_786, _648, _904);
    float _908 = _792 + _906;
    float _910 = _678 * _806;
    float _912 = 1.0 / _908;
    float _914 = fma(_800, _646, _910);
    float _916 = _678 * _828;
    float _918 = fma(_812, _648, _914);
    float _920 = fma(_822, _646, _916);
    float _922 = _818 + _918;
    float _924 = fma(_834, _648, _920);
    float _926 = _922 * _912;
    float _928 = _840 + _924;
    bool _930 = _926 >= 0.0;
    float _932 = _928 * _912;
    bool _934 = _926 <= 1.0;
    bool _936 = _934 && _930;
    float _938 = abs(_208);
    float _940 = log2(_938);
    bool _942 = _932 >= 0.0;
    bool _944 = _942 && _936;
    bool _946 = _932 <= 1.0;
    bool _948 = _946 && _944;
    float _950 = _170 * _210;
    if (_948)
    {
        float _952 = float(_766);
        _896 = _952;
    }
    float _954 = _896;
    float _956 = _678 * _880;
    bool _958 = _900 <= _864;
    bool _960 = _958 || _868;
    float _962 = fma(_874, _646, _956);
    float _964 = _170 * _940;
    float _966 = fma(_886, _648, _962);
    float _968 = _892 + _966;
    float _970 = _892;
    if (_960)
    {
        _286 = 1.0;
    }
    float _972 = _286;
    float _974 = _972;
    if (!_960)
    {
        float _976 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[500]);
        int _978 = _864 * as_type<int>(_976);
        int _980 = _978 + _704;
        int _982 = _980 << 2;
        uint _984 = uint(int(uint(_980) >> uint(2)));
        int _986 = 12 & _982;
        int _988 = int(_984) << 4;
        int _990 = _988 + _986;
        int _992 = _990 + 400;
        uint _994 = uint(int(uint(_992) >> uint(2)));
        float _996 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_994)]);
        float _998 = floor(_848);
        float _1000 = floor(_694);
        float _1002 = -_998;
        float _1004 = _848 + _1002;
        float _1006 = -_1000;
        float _1008 = _694 + _1006;
        float _1010 = rint(_996);
        float _1012 = precise::max(_1010, 0.0);
        uint _1014 = uint(_1012);
        uint _1016 = clamp(_1014, 0u, 65535u);
        float3 _2891 = float3(_1008, _1004, float(int(_1016)));
        float3 _2895 = select(_2891, float3(0.0), isnan(_2891));
        float _1018 = dm_bs(spvDescriptorSet0.cp_t_tcb_14.sample(spvDescriptorSet0.cp_t_tcb_14Smplr, _2895.xy, uint(rint(_2895.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_14, spvDescriptorSet0.cp_t_tcb_14Smplr_w, _2895.xy, uint(rint(_2895.z)), level(0.0)).x;
        int _1020 = _980 << 4;
        int _1022 = _1020 + 2048;
        uint _1024 = uint(int(uint(_1022) >> uint(2)));
        float _1026 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1024)]);
        int _1028 = _1022 + 4;
        uint _1030 = uint(int(uint(_1028) >> uint(2)));
        float _1032 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1030)]);
        int _1034 = _1022 + 8;
        uint _1036 = uint(int(uint(_1034) >> uint(2)));
        float _1038 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1036)]);
        int _1040 = _1022 + 12;
        uint _1042 = uint(int(uint(_1040) >> uint(2)));
        float _1044 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1042)]);
        float _1046 = _678 * _1032;
        float _1048 = fma(_1026, _646, _1046);
        float _1050 = fma(_1038, _648, _1048);
        float _1052 = _1044 + _1050;
        float _1054 = precise::clamp(_1052, 0.0, 1.0);
        float _1056 = -_1054;
        float _1058 = _1056 + _1018;
        float _1060 = fma(_1058, 500.0, 1.5);
        float _1062 = exp2(_1060);
        float _1064 = 0.0 + _1062;
        float _1066 = precise::clamp(_1064, 0.0, 1.0);
        _970 = as_type<float>(_1022);
        _974 = _1066;
    }
    float _1068 = _970;
    float _1070 = _974;
    float _1072 = _954;
    float _1074 = _1068;
    if (_948)
    {
        float _1076 = rint(_954);
        float _1078 = precise::max(_1076, 0.0);
        uint _1080 = uint(_1078);
        uint _1082 = clamp(_1080, 0u, 65535u);
        _1072 = as_type<float>(_1082);
    }
    float _1084 = _1072;
    float _1086 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
    float _1088 = _968 * _912;
    bool _1090 = _722 != 0.0;
    bool _1092 = isnan(_722);
    bool _1094 = _1090 || _1092;
    bool _1096 = isnan(0.0);
    bool _1098 = _1094 || _1096;
    uint _1100 = uint(int(uint(_164) >> uint(2)));
    float _1102 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1100)]);
    float _1104 = _932;
    if (_948)
    {
        float3 _3027 = float3(_926, _932, float(as_type<int>(_1084)));
        float3 _3029 = select(_3027, float3(0.0), isnan(_3027));
        float _1106 = spvDepthCast(spvDescriptorSet0.cp_t_tcb_16).sample_compare(spvDescriptorSet0.cp_t_tcb_16Smplr, _3029.xy, uint(rint(_3029.z)), _1088, level(0.0));
        _1104 = _1106;
    }
    float _1108 = _1104;
    float _1110 = exp2(_964);
    if (!_1098)
    {
        _1074 = 4.0;
    }
    float _1112 = _1074;
    float _1114 = _724;
    if (!_1098)
    {
        float2 _3050 = float2(_714, _716);
        float _1116 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_3050, float2(0.0), isnan(_3050)), level(_1112)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_3050, float2(0.0), isnan(_3050)), level(_1112)).y;
        _1114 = _1116;
    }
    float _1118 = _1114;
    float _1120 = _324 * _950;
    float _1122 = _326 * _950;
    float _1124 = fma(_178, _1110, _1120);
    float _1126 = _1120;
    if (!_948)
    {
        _1126 = 1.0;
    }
    float _1128 = _1126;
    float _1130 = fma(_184, _1110, _1122);
    float _1132 = -_214;
    float _1134 = _1086 + _1132;
    bool _1136 = _1134 > 0.001000000047497451305389404296875;
    bool _1138 = isnan(_1134);
    bool _1140 = _1136 || _1138;
    bool _1142 = isnan(0.001000000047497451305389404296875);
    bool _1144 = _1140 || _1142;
    float _1146 = _1128;
    if (_948)
    {
        bool _1148 = _1108 >= _1088;
        bool _1150 = isnan(_1108);
        bool _1152 = _1148 || _1150;
        bool _1154 = isnan(_1088);
        bool _1156 = _1152 || _1154;
        float _1158 = float(_1156);
        _1146 = _1158;
    }
    float _1160 = _1146;
    float _1162 = -_1160;
    float _1164 = fma(_1162, _1070, 1.0);
    float _1166 = -_1102;
    float _1168 = _1164 + _1166;
    float _1170 = _1164;
    if (_1144)
    {
        float _1172 = fma(_1168, 0.0500000007450580596923828125, _1102);
        _1170 = _1172;
    }
    float _1174 = _1170;
    float _1176 = precise::max(0.0, _1174);
    float _1178 = precise::min(_1176, 0.999000012874603271484375);
    uint _1180 = uint(int(uint(_164) >> uint(2)));
    (*spvDescriptorSet0.cp_s12)._m0[int(_1180)] = as_type<uint>(_1178);
    float _1182 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[76]);
    float _1184 = _328 * _950;
    int _1186 = _164 + 4;
    float _1188 = fma(_190, _1110, _1184);
    int _1190 = _164 + 8;
    float _1192 = _1130 * _1130;
    float _1194 = fma(_1118, 2000.0, _1182);
    uint _1196 = uint(int(uint(_1186) >> uint(2)));
    (*spvDescriptorSet0.cp_s12)._m0[int(_1196)] = as_type<uint>(_1194);
    uint _1198 = uint(int(uint(_168) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1198)] = as_type<uint>(_222);
    uint _1200 = uint(int(uint(_164) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1200)] = as_type<uint>(_312);
    uint _1202 = uint(int(uint(_1186) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1202)] = as_type<uint>(_310);
    uint _1204 = uint(int(uint(_1190) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1204)] = as_type<uint>(_314);
    uint _1206 = uint(int(uint(_164) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_1206)] = as_type<uint>(_1124);
    uint _1208 = uint(int(uint(_1186) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_1208)] = as_type<uint>(_1130);
    uint _1210 = uint(int(uint(_1190) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_1210)] = as_type<uint>(_1188);
    uint _1212 = uint(int(uint(_164) >> uint(2)));
    (*spvDescriptorSet0.cp_s5)._m0[int(_1212)] = as_type<uint>(_306);
    uint _1214 = uint(int(uint(_1186) >> uint(2)));
    (*spvDescriptorSet0.cp_s5)._m0[int(_1214)] = as_type<uint>(_304);
    uint _1216 = uint(int(uint(_1190) >> uint(2)));
    (*spvDescriptorSet0.cp_s5)._m0[int(_1216)] = as_type<uint>(_308);
    float _1218 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _1220 = _304 * _304;
    float _1222 = fma(_306, _306, _1220);
    float _1224 = fma(_308, _308, _1222);
    float _1226 = sqrt(_1224);
    float _1228 = fma(_1124, _1124, _1192);
    float _1230 = fma(_1188, _1188, _1228);
    float _1232 = sqrt(_1230);
    bool _1234 = _1226 >= 9.9999999747524270787835121154785e-07;
    bool _1236 = isnan(_1226);
    bool _1238 = _1234 || _1236;
    bool _1240 = isnan(9.9999999747524270787835121154785e-07);
    bool _1242 = _1238 || _1240;
    float _1244 = _1226;
    int _1260;
    if (!_1242)
    {
        bool _1246 = _1086 != _214;
        bool _1248 = isnan(_1086);
        bool _1250 = _1246 || _1248;
        bool _1252 = isnan(_214);
        bool _1254 = _1250 || _1252;
        if (_1254)
        {
            _338 = as_type<int>(_392);
        }
        int _1256 = _338;
        int _1258 = _1256;
        _1260 = _1256;
        _1262 = _1254;
        if (!_1262)
        {
            float _1264 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
            bool _1266 = _1264 > 0.0;
            bool _1268 = !_1266;
            if (!_1268)
            {
                float _1270 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
                float _1272 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
                float _1274 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
                float _1276 = _1272 * _1272;
                float _1278 = fma(_1270, _1270, _1276);
                float _1280 = fma(_1274, _1274, _1278);
                float _1282 = rsqrt(_1280);
                float _1284 = _1282 * 9.9999999747524270787835121154785e-07;
                float _1286 = _1270 * _1284;
                float _1288 = _1272 * _1284;
                float _1290 = _1274 * _1284;
                _1260 = as_type<int>(_1286);
                _452 = as_type<int>(_1288);
                _454 = as_type<int>(_1290);
                _1262 = true;
            }
            else
            {
                bool _1292 = _1232 >= 9.9999999747524270787835121154785e-07;
                bool _1294 = isnan(_1232);
                bool _1296 = _1292 || _1294;
                bool _1298 = isnan(9.9999999747524270787835121154785e-07);
                bool _1300 = _1296 || _1298;
                if (!_1300)
                {
                    float _1302 = _310 * _310;
                    float _1304 = fma(_312, _312, _1302);
                    float _1306 = fma(_314, _314, _1304);
                    float _1308 = sqrt(_1306);
                    bool _1310 = _1308 >= 9.9999999747524270787835121154785e-07;
                    bool _1312 = isnan(_1308);
                    bool _1314 = _1310 || _1312;
                    bool _1316 = isnan(9.9999999747524270787835121154785e-07);
                    bool _1318 = _1314 || _1316;
                    int _1320 = as_type<int>(_404);
                    int _1322 = as_type<int>(_1308);
                    if (_1318)
                    {
                        float _1324 = rsqrt(_1306);
                        _1320 = as_type<int>(_1324);
                    }
                    int _1326 = _1320;
                    if (!_1318)
                    {
                        _1258 = 0;
                    }
                    int _1328 = _1258;
                    int _1330 = _1328;
                    if (!_1318)
                    {
                        _1322 = 897988541;
                    }
                    int _1332 = _1322;
                    int _1334 = _1326;
                    int _1336 = _1332;
                    if (_1318)
                    {
                        float _1338 = as_type<float>(_1326) * 9.9999999747524270787835121154785e-07;
                        _1244 = _1338;
                    }
                    float _1340 = _1244;
                    if (!_1318)
                    {
                        _1334 = 0;
                    }
                    int _1342 = _1334;
                    int _1344 = _1342;
                    if (_1318)
                    {
                        float _1346 = _312 * _1340;
                        _1330 = as_type<int>(_1346);
                    }
                    int _1348 = _1330;
                    _1260 = _1348;
                    if (_1318)
                    {
                        float _1350 = _310 * _1340;
                        _1336 = as_type<int>(_1350);
                    }
                    int _1352 = _1336;
                    _452 = _1352;
                    if (_1318)
                    {
                        float _1354 = _314 * _1340;
                        _1344 = as_type<int>(_1354);
                    }
                    int _1356 = _1344;
                    _454 = _1356;
                    _1262 = true;
                }
                else
                {
                    float _1358 = rsqrt(_1230);
                    float _1360 = _1358 * 9.9999999747524270787835121154785e-07;
                    float _1362 = _1124 * _1360;
                    float _1364 = _1130 * _1360;
                    float _1366 = _1188 * _1360;
                    _1260 = as_type<int>(_1362);
                    _452 = as_type<int>(_1364);
                    _454 = as_type<int>(_1366);
                    _1262 = true;
                }
            }
        }
    }
    else
    {
        float _1368 = _1232 * _1218;
        bool _1370 = _1368 >= 0.001000000047497451305389404296875;
        bool _1372 = isnan(_1368);
        bool _1374 = _1370 || _1372;
        bool _1376 = isnan(0.001000000047497451305389404296875);
        bool _1378 = _1374 || _1376;
        bool _1380 = _1368 > 0.0;
        bool _1382 = !_1378;
        bool _1384 = _1380 && _1382;
        bool _1386 = _1226 < 0.001000000047497451305389404296875;
        bool _1388 = _1386 && _1384;
        if (!_1388)
        {
            _448 = as_type<int>(_304);
        }
        int _1390 = _448;
        int _1392 = _1390;
        if (_1388)
        {
            float _1394 = _1124 * _1218;
            _340 = as_type<int>(_1394);
        }
        int _1396 = _340;
        _1260 = _1396;
        if (!_1388)
        {
            _450 = as_type<int>(_308);
        }
        int _1398 = _450;
        _454 = _1398;
        if (_1388)
        {
            float _1400 = _1130 * _1218;
            _1392 = as_type<int>(_1400);
        }
        int _1402 = _1392;
        _452 = _1402;
        if (_1388)
        {
            float _1404 = _1188 * _1218;
            _454 = as_type<int>(_1404);
        }
    }
    _1262 = false;
    int _1406 = _1260;
    int _1408 = _452;
    int _1410 = _454;
    uint _1412 = uint(int(uint(_164) >> uint(2)));
    (*spvDescriptorSet0.cp_s5)._m0[int(_1412)] = uint(_1406);
    uint _1414 = uint(int(uint(_1186) >> uint(2)));
    (*spvDescriptorSet0.cp_s5)._m0[int(_1414)] = uint(_1408);
    uint _1416 = uint(int(uint(_1190) >> uint(2)));
    (*spvDescriptorSet0.cp_s5)._m0[int(_1416)] = uint(_1410);
}

