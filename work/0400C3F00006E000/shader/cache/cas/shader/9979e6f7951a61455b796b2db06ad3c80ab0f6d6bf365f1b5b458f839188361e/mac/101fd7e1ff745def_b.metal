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
    bool _1272 = false;
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
    float2 _2440 = float2(_714, _716);
    float2 _720 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_2440, float2(0.0), isnan(_2440)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_2440, float2(0.0), isnan(_2440)), level(0.0)).xy;
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
    float _894 = abs(_208);
    float _896 = log2(_894);
    int _898 = 0;
    float _900 = _800;
    if (!_868)
    {
        float _902 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[500]);
        _898 = as_type<int>(_902);
    }
    int _904 = _898;
    float _906 = _678 * _780;
    float _908 = fma(_774, _646, _906);
    float _910 = fma(_786, _648, _908);
    float _912 = _792 + _910;
    float _914 = _678 * _806;
    float _916 = 1.0 / _912;
    float _918 = fma(_800, _646, _914);
    float _920 = _678 * _828;
    float _922 = fma(_812, _648, _918);
    float _924 = fma(_822, _646, _920);
    float _926 = _818 + _922;
    float _928 = fma(_834, _648, _924);
    float _930 = _926 * _916;
    float _932 = _840 + _928;
    bool _934 = _930 >= 0.0;
    float _936 = _932 * _916;
    bool _938 = _930 <= 1.0;
    bool _940 = _938 && _934;
    bool _942 = _936 >= 0.0;
    bool _944 = _942 && _940;
    bool _946 = _936 <= 1.0;
    bool _948 = _946 && _944;
    int _950 = as_type<int>((*spvDescriptorSet0.cp_c0)._m0[41].x) + 280;
    float _952 = _170 * _210;
    if (_948)
    {
        float _954 = float(_766);
        _900 = _954;
    }
    float _956 = _900;
    float _958 = _678 * _880;
    bool _960 = _904 <= _864;
    bool _962 = _960 || _868;
    float _964 = fma(_874, _646, _958);
    float _966 = _170 * _896;
    float _968 = fma(_886, _648, _964);
    float _970 = _892 + _968;
    float _972 = _892;
    if (_962)
    {
        _286 = 1.0;
    }
    float _974 = _286;
    float _976 = _974;
    if (!_962)
    {
        float _978 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[500]);
        int _980 = _864 * as_type<int>(_978);
        int _982 = _980 + _704;
        int _984 = _982 << 2;
        uint _986 = uint(int(uint(_982) >> uint(2)));
        int _988 = 12 & _984;
        int _990 = int(_986) << 4;
        int _992 = _990 + _988;
        int _994 = _992 + 400;
        uint _996 = uint(int(uint(_994) >> uint(2)));
        float _998 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_996)]);
        float _1000 = floor(_848);
        float _1002 = floor(_694);
        float _1004 = -_1000;
        float _1006 = _848 + _1004;
        float _1008 = -_1002;
        float _1010 = _694 + _1008;
        float _1012 = rint(_998);
        float _1014 = precise::max(_1012, 0.0);
        uint _1016 = uint(_1014);
        uint _1018 = clamp(_1016, 0u, 65535u);
        float3 _2908 = float3(_1010, _1006, float(int(_1018)));
        float3 _2912 = select(_2908, float3(0.0), isnan(_2908));
        float _1020 = dm_bs(spvDescriptorSet0.cp_t_tcb_14.sample(spvDescriptorSet0.cp_t_tcb_14Smplr, _2912.xy, uint(rint(_2912.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_14, spvDescriptorSet0.cp_t_tcb_14Smplr_w, _2912.xy, uint(rint(_2912.z)), level(0.0)).x;
        int _1022 = _982 << 4;
        int _1024 = _1022 + 2048;
        uint _1026 = uint(int(uint(_1024) >> uint(2)));
        float _1028 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1026)]);
        int _1030 = _1024 + 4;
        uint _1032 = uint(int(uint(_1030) >> uint(2)));
        float _1034 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1032)]);
        int _1036 = _1024 + 8;
        uint _1038 = uint(int(uint(_1036) >> uint(2)));
        float _1040 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1038)]);
        int _1042 = _1024 + 12;
        uint _1044 = uint(int(uint(_1042) >> uint(2)));
        float _1046 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1044)]);
        float _1048 = _678 * _1034;
        float _1050 = fma(_1028, _646, _1048);
        float _1052 = fma(_1040, _648, _1050);
        float _1054 = _1046 + _1052;
        float _1056 = precise::clamp(_1054, 0.0, 1.0);
        float _1058 = -_1056;
        float _1060 = _1058 + _1020;
        float _1062 = fma(_1060, 500.0, 1.5);
        float _1064 = exp2(_1062);
        float _1066 = 0.0 + _1064;
        float _1068 = precise::clamp(_1066, 0.0, 1.0);
        _972 = as_type<float>(_1024);
        _976 = _1068;
    }
    float _1070 = _972;
    float _1072 = _976;
    float _1074 = _956;
    float _1076 = _1070;
    if (_948)
    {
        float _1078 = rint(_956);
        float _1080 = precise::max(_1078, 0.0);
        uint _1082 = uint(_1080);
        uint _1084 = clamp(_1082, 0u, 65535u);
        _1074 = as_type<float>(_1084);
    }
    float _1086 = _1074;
    float _1088 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
    float _1090 = _970 * _916;
    bool _1092 = _722 != 0.0;
    bool _1094 = isnan(_722);
    bool _1096 = _1092 || _1094;
    bool _1098 = isnan(0.0);
    bool _1100 = _1096 || _1098;
    uint _1102 = uint(int(uint(_164) >> uint(2)));
    float _1104 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1102)]);
    float _1106 = _936;
    if (_948)
    {
        float3 _3044 = float3(_930, _936, float(as_type<int>(_1086)));
        float3 _3046 = select(_3044, float3(0.0), isnan(_3044));
        float _1108 = spvDepthCast(spvDescriptorSet0.cp_t_tcb_16).sample_compare(spvDescriptorSet0.cp_t_tcb_16Smplr, _3046.xy, uint(rint(_3046.z)), _1090, level(0.0));
        _1106 = _1108;
    }
    float _1110 = _1106;
    float _1112 = exp2(_966);
    if (!_1100)
    {
        _1076 = 4.0;
    }
    float _1114 = _1076;
    int _1116 = as_type<int>(_724);
    if (!_1100)
    {
        float2 _3068 = float2(_714, _716);
        float _1118 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_3068, float2(0.0), isnan(_3068)), level(_1114)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_3068, float2(0.0), isnan(_3068)), level(_1114)).y;
        _1116 = as_type<int>(_1118);
    }
    int _1120 = _1116;
    float _1122 = _324 * _952;
    float _1124 = _326 * _952;
    float _1126 = fma(_178, _1112, _1122);
    float _1128 = _1122;
    if (!_948)
    {
        _1128 = 1.0;
    }
    float _1130 = _1128;
    float _1132 = fma(_184, _1112, _1124);
    float _1134 = -_214;
    float _1136 = _1088 + _1134;
    bool _1138 = _1136 > 0.001000000047497451305389404296875;
    bool _1140 = isnan(_1136);
    bool _1142 = _1138 || _1140;
    bool _1144 = isnan(0.001000000047497451305389404296875);
    bool _1146 = _1142 || _1144;
    float _1148 = _1130;
    int _1150 = _1120;
    if (_948)
    {
        bool _1152 = _1110 >= _1090;
        bool _1154 = isnan(_1110);
        bool _1156 = _1152 || _1154;
        bool _1158 = isnan(_1090);
        bool _1160 = _1156 || _1158;
        float _1162 = float(_1160);
        _1148 = _1162;
    }
    float _1164 = _1148;
    float _1166 = -_1164;
    float _1168 = fma(_1166, _1072, 1.0);
    float _1170 = -_1104;
    float _1172 = _1168 + _1170;
    float _1174 = _1168;
    if (_1146)
    {
        float _1176 = fma(_1172, 0.0500000007450580596923828125, _1104);
        _1174 = _1176;
    }
    float _1178 = _1174;
    float _1180 = precise::max(0.0, _1178);
    float _1182 = precise::min(_1180, 0.999000012874603271484375);
    uint _1184 = uint(int(uint(_164) >> uint(2)));
    (*spvDescriptorSet0.cp_s12)._m0[int(_1184)] = as_type<uint>(_1182);
    float _1186 = as_type<float>(_950);
    if (!_1146)
    {
        float _1188 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[76]);
        _1186 = _1188;
    }
    float _1190 = _1186;
    float _1192 = _328 * _952;
    float _1194 = fma(_190, _1112, _1192);
    int _1196 = _164 + 4;
    int _1198 = _164 + 8;
    if (!_1146)
    {
        float _1200 = fma(as_type<float>(_1120), 2000.0, _1190);
        _1150 = as_type<int>(_1200);
    }
    int _1202 = _1150;
    if (!_1146)
    {
        uint _1204 = uint(int(uint(_1196) >> uint(2)));
        (*spvDescriptorSet0.cp_s12)._m0[int(_1204)] = uint(_1202);
    }
    uint _1206 = uint(int(uint(_168) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1206)] = as_type<uint>(_222);
    uint _1208 = uint(int(uint(_164) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1208)] = as_type<uint>(_312);
    uint _1210 = uint(int(uint(_1196) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1210)] = as_type<uint>(_310);
    uint _1212 = uint(int(uint(_1198) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1212)] = as_type<uint>(_314);
    uint _1214 = uint(int(uint(_164) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_1214)] = as_type<uint>(_1126);
    uint _1216 = uint(int(uint(_1196) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_1216)] = as_type<uint>(_1132);
    uint _1218 = uint(int(uint(_1198) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_1218)] = as_type<uint>(_1194);
    uint _1220 = uint(int(uint(_164) >> uint(2)));
    (*spvDescriptorSet0.cp_s5)._m0[int(_1220)] = as_type<uint>(_306);
    uint _1222 = uint(int(uint(_1196) >> uint(2)));
    (*spvDescriptorSet0.cp_s5)._m0[int(_1222)] = as_type<uint>(_304);
    uint _1224 = uint(int(uint(_1198) >> uint(2)));
    (*spvDescriptorSet0.cp_s5)._m0[int(_1224)] = as_type<uint>(_308);
    float _1226 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _1228 = _304 * _304;
    float _1230 = fma(_306, _306, _1228);
    float _1232 = fma(_308, _308, _1230);
    float _1234 = sqrt(_1232);
    float _1236 = _1132 * _1132;
    float _1238 = fma(_1126, _1126, _1236);
    float _1240 = fma(_1194, _1194, _1238);
    float _1242 = sqrt(_1240);
    bool _1244 = _1234 >= 9.9999999747524270787835121154785e-07;
    bool _1246 = isnan(_1234);
    bool _1248 = _1244 || _1246;
    bool _1250 = isnan(9.9999999747524270787835121154785e-07);
    bool _1252 = _1248 || _1250;
    float _1254 = _1234;
    int _1270;
    if (!_1252)
    {
        bool _1256 = _1088 != _214;
        bool _1258 = isnan(_1088);
        bool _1260 = _1256 || _1258;
        bool _1262 = isnan(_214);
        bool _1264 = _1260 || _1262;
        if (_1264)
        {
            _338 = as_type<int>(_392);
        }
        int _1266 = _338;
        int _1268 = _1266;
        _1270 = _1266;
        _1272 = _1264;
        if (!_1272)
        {
            float _1274 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
            bool _1276 = _1274 > 0.0;
            bool _1278 = !_1276;
            if (!_1278)
            {
                float _1280 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
                float _1282 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
                float _1284 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
                float _1286 = _1282 * _1282;
                float _1288 = fma(_1280, _1280, _1286);
                float _1290 = fma(_1284, _1284, _1288);
                float _1292 = rsqrt(_1290);
                float _1294 = _1292 * 9.9999999747524270787835121154785e-07;
                float _1296 = _1280 * _1294;
                float _1298 = _1282 * _1294;
                float _1300 = _1284 * _1294;
                _1270 = as_type<int>(_1296);
                _452 = as_type<int>(_1298);
                _454 = as_type<int>(_1300);
                _1272 = true;
            }
            else
            {
                bool _1302 = _1242 >= 9.9999999747524270787835121154785e-07;
                bool _1304 = isnan(_1242);
                bool _1306 = _1302 || _1304;
                bool _1308 = isnan(9.9999999747524270787835121154785e-07);
                bool _1310 = _1306 || _1308;
                if (!_1310)
                {
                    float _1312 = _310 * _310;
                    float _1314 = fma(_312, _312, _1312);
                    float _1316 = fma(_314, _314, _1314);
                    float _1318 = sqrt(_1316);
                    bool _1320 = _1318 >= 9.9999999747524270787835121154785e-07;
                    bool _1322 = isnan(_1318);
                    bool _1324 = _1320 || _1322;
                    bool _1326 = isnan(9.9999999747524270787835121154785e-07);
                    bool _1328 = _1324 || _1326;
                    int _1330 = as_type<int>(_404);
                    int _1332 = as_type<int>(_1318);
                    if (_1328)
                    {
                        float _1334 = rsqrt(_1316);
                        _1330 = as_type<int>(_1334);
                    }
                    int _1336 = _1330;
                    if (!_1328)
                    {
                        _1268 = 0;
                    }
                    int _1338 = _1268;
                    int _1340 = _1338;
                    if (!_1328)
                    {
                        _1332 = 897988541;
                    }
                    int _1342 = _1332;
                    int _1344 = _1336;
                    int _1346 = _1342;
                    if (_1328)
                    {
                        float _1348 = as_type<float>(_1336) * 9.9999999747524270787835121154785e-07;
                        _1254 = _1348;
                    }
                    float _1350 = _1254;
                    if (!_1328)
                    {
                        _1344 = 0;
                    }
                    int _1352 = _1344;
                    int _1354 = _1352;
                    if (_1328)
                    {
                        float _1356 = _312 * _1350;
                        _1340 = as_type<int>(_1356);
                    }
                    int _1358 = _1340;
                    _1270 = _1358;
                    if (_1328)
                    {
                        float _1360 = _310 * _1350;
                        _1346 = as_type<int>(_1360);
                    }
                    int _1362 = _1346;
                    _452 = _1362;
                    if (_1328)
                    {
                        float _1364 = _314 * _1350;
                        _1354 = as_type<int>(_1364);
                    }
                    int _1366 = _1354;
                    _454 = _1366;
                    _1272 = true;
                }
                else
                {
                    float _1368 = rsqrt(_1240);
                    float _1370 = _1368 * 9.9999999747524270787835121154785e-07;
                    float _1372 = _1126 * _1370;
                    float _1374 = _1132 * _1370;
                    float _1376 = _1194 * _1370;
                    _1270 = as_type<int>(_1372);
                    _452 = as_type<int>(_1374);
                    _454 = as_type<int>(_1376);
                    _1272 = true;
                }
            }
        }
    }
    else
    {
        float _1378 = _1242 * _1226;
        bool _1380 = _1378 >= 0.001000000047497451305389404296875;
        bool _1382 = isnan(_1378);
        bool _1384 = _1380 || _1382;
        bool _1386 = isnan(0.001000000047497451305389404296875);
        bool _1388 = _1384 || _1386;
        bool _1390 = _1378 > 0.0;
        bool _1392 = !_1388;
        bool _1394 = _1390 && _1392;
        bool _1396 = _1234 < 0.001000000047497451305389404296875;
        bool _1398 = _1396 && _1394;
        if (!_1398)
        {
            _448 = as_type<int>(_304);
        }
        int _1400 = _448;
        int _1402 = _1400;
        if (_1398)
        {
            float _1404 = _1126 * _1226;
            _340 = as_type<int>(_1404);
        }
        int _1406 = _340;
        _1270 = _1406;
        if (!_1398)
        {
            _450 = as_type<int>(_308);
        }
        int _1408 = _450;
        _454 = _1408;
        if (_1398)
        {
            float _1410 = _1132 * _1226;
            _1402 = as_type<int>(_1410);
        }
        int _1412 = _1402;
        _452 = _1412;
        if (_1398)
        {
            float _1414 = _1194 * _1226;
            _454 = as_type<int>(_1414);
        }
    }
    _1272 = false;
    int _1416 = _1270;
    int _1418 = _452;
    int _1420 = _454;
    uint _1422 = uint(int(uint(_164) >> uint(2)));
    (*spvDescriptorSet0.cp_s5)._m0[int(_1422)] = uint(_1416);
    uint _1424 = uint(int(uint(_1196) >> uint(2)));
    (*spvDescriptorSet0.cp_s5)._m0[int(_1424)] = uint(_1418);
    uint _1426 = uint(int(uint(_1198) >> uint(2)));
    (*spvDescriptorSet0.cp_s5)._m0[int(_1426)] = uint(_1420);
}

