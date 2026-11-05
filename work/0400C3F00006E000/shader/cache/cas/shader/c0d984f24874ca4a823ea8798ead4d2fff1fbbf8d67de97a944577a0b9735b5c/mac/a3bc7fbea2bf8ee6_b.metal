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
    bool _1566 = false;
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
    int _212 = as_type<int>(_166) & 512;
    bool _214 = _212 != 0;
    float _216 = 0.0;
    float _218 = 0.0;
    float _220 = 0.0;
    float _222 = 0.0;
    if (_214)
    {
        float _224 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _226 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _228 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _230 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        _216 = _224;
        _218 = _226;
        _220 = _228;
        _222 = _230;
    }
    float _232 = _216;
    float _234 = _218;
    float _236 = _220;
    float _238 = _222;
    float _240 = 0.0;
    float _242 = 0.0;
    float _244 = 0.0;
    float _246 = 0.0;
    if (_214)
    {
        float _248 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _250 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _252 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _254 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        _240 = _248;
        _242 = _250;
        _244 = _252;
        _246 = _254;
    }
    float _256 = _240;
    float _258 = _242;
    float _260 = _244;
    float _262 = _246;
    float _264 = _174 * _170;
    float _266 = 0.0;
    float _268 = 0.0;
    float _270 = 0.0;
    float _272 = 0.0;
    float _274 = _194;
    float _276 = _206;
    float _278 = _170;
    float _280 = _190;
    float _282 = _184;
    if (_214)
    {
        float _284 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _286 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _288 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _290 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        _266 = _284;
        _268 = _286;
        _270 = _288;
        _272 = _290;
    }
    float _292 = _266;
    float _294 = _268;
    float _296 = _270;
    float _298 = _272;
    float _300 = _184 * _264;
    float _302 = _178 * _264;
    float _304 = _190 * _264;
    float _306 = _200 + _300;
    float _308 = _194 + _302;
    float _310 = _206 + _304;
    int _312 = as_type<int>(_166) & 1024;
    bool _314 = _312 != 0;
    int _316 = as_type<int>(_166) & 2048;
    bool _318 = _316 != 0;
    float _320 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
    float _322 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
    float _324 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
    float _326 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
    float _328 = _234;
    float _330 = _232;
    int _332 = as_type<int>(_302);
    int _334 = as_type<int>(_302);
    if (_214)
    {
        float _336 = _306 * _234;
        _274 = _336;
    }
    float _338 = _274;
    float _340 = _338;
    if (_214)
    {
        float _342 = _306 * _258;
        _276 = _342;
    }
    float _344 = _276;
    float _346 = _344;
    if (_214)
    {
        float _348 = fma(_308, _232, _338);
        _340 = _348;
    }
    float _350 = _340;
    float _352 = _350;
    if (_214)
    {
        float _354 = fma(_308, _256, _344);
        _346 = _354;
    }
    float _356 = _346;
    float _358 = _356;
    if (_214)
    {
        float _360 = fma(_310, _236, _350);
        _352 = _360;
    }
    float _362 = _352;
    if (_214)
    {
        float _364 = fma(_310, _260, _356);
        _358 = _364;
    }
    float _366 = _358;
    if (!_214)
    {
        _328 = 0.0;
        _330 = 0.0;
    }
    float _368 = _328;
    float _370 = _330;
    float _372 = _368;
    float _374 = _370;
    if (_214)
    {
        float _376 = _238 + _362;
        _372 = _376;
    }
    float _378 = _372;
    if (_214)
    {
        float _380 = _262 + _366;
        _374 = _380;
    }
    float _382 = _374;
    uint _384 = uint(int(uint(_164) >> uint(2)));
    float _386 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_384)]);
    int _388 = _164 + 4;
    uint _390 = uint(int(uint(_388) >> uint(2)));
    float _392 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_390)]);
    int _394 = _164 + 8;
    uint _396 = uint(int(uint(_394) >> uint(2)));
    float _398 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_396)]);
    int _400 = _164 + 12;
    uint _402 = uint(int(uint(_400) >> uint(2)));
    float _404 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_402)]);
    float _406 = _294;
    float _408 = _296;
    float _410 = _326;
    float _412 = _320;
    if (_214)
    {
        float _414 = _306 * _294;
        _406 = _414;
    }
    float _416 = _406;
    float _418 = _416;
    if (_214)
    {
        float _420 = fma(_308, _292, _416);
        _418 = _420;
    }
    float _422 = _418;
    if (_214)
    {
        float _424 = fma(_310, _296, _422);
        _408 = _424;
    }
    float _426 = _408;
    float _428 = 0.0;
    if (!_214)
    {
        _428 = 0.0;
    }
    float _430 = _428;
    float _432 = _430;
    if (_214)
    {
        float _434 = _298 + _426;
        _432 = _434;
    }
    float _436 = _432;
    uint _438 = uint(int(uint(_168) >> uint(2)));
    float _440 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_438)]);
    float _442 = _436;
    if (!_314)
    {
        _410 = _378;
    }
    float _444 = _410;
    uint _446 = uint(int(uint(_168) >> uint(2)));
    float _448 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_446)]);
    float _450 = _404;
    float _452 = _444;
    int _454 = as_type<int>(_392);
    int _456 = as_type<int>(_398);
    int _458 = as_type<int>(_392);
    int _460 = as_type<int>(_398);
    if (!_314)
    {
        _450 = _382;
    }
    float _462 = _450;
    bool _464 = !_314;
    float _466 = _462;
    if (!_464)
    {
        float _468 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        uint _470 = uint(int(uint(_164) >> uint(2)));
        float _472 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_470)]);
        int _474 = _164 + 4;
        uint _476 = uint(int(uint(_474) >> uint(2)));
        float _478 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_476)]);
        int _480 = _164 + 8;
        uint _482 = uint(int(uint(_480) >> uint(2)));
        float _484 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_482)]);
        uint _486 = uint(int(uint(_164) >> uint(2)));
        float _488 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_486)]);
        int _490 = _164 + 4;
        uint _492 = uint(int(uint(_490) >> uint(2)));
        float _494 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_492)]);
        int _496 = _164 + 8;
        uint _498 = uint(int(uint(_496) >> uint(2)));
        float _500 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_498)]);
        uint _502 = uint(int(uint(_164) >> uint(2)));
        float _504 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_502)]);
        int _506 = _164 + 4;
        uint _508 = uint(int(uint(_506) >> uint(2)));
        float _510 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_508)]);
        int _512 = _164 + 8;
        uint _514 = uint(int(uint(_512) >> uint(2)));
        float _516 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_514)]);
        float _518 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        float _520 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        float _522 = _306 * _478;
        float _524 = _306 * _494;
        float _526 = _306 * _510;
        float _528 = fma(_308, _472, _522);
        float _530 = fma(_308, _488, _524);
        float _532 = fma(_308, _504, _526);
        float _534 = fma(_310, _484, _528);
        float _536 = fma(_310, _500, _530);
        float _538 = fma(_310, _516, _532);
        float _540 = _468 + _534;
        float _542 = _518 + _536;
        float _544 = _520 + _538;
        _442 = _542;
        _452 = _540;
        _466 = _544;
    }
    float _546 = _442;
    float _548 = _452;
    float _550 = _466;
    bool _552 = !_318;
    float _554 = _546;
    float _556 = _548;
    float _558 = _550;
    if (!_552)
    {
        uint _560 = uint(int(uint(_164) >> uint(2)));
        float _562 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_560)]);
        int _564 = _164 + 4;
        uint _566 = uint(int(uint(_564) >> uint(2)));
        float _568 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_566)]);
        int _570 = _164 + 8;
        uint _572 = uint(int(uint(_570) >> uint(2)));
        float _574 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_572)]);
        int _576 = _164 + 12;
        uint _578 = uint(int(uint(_576) >> uint(2)));
        float _580 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_578)]);
        uint _582 = uint(int(uint(_164) >> uint(2)));
        float _584 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_582)]);
        int _586 = _164 + 4;
        uint _588 = uint(int(uint(_586) >> uint(2)));
        float _590 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_588)]);
        int _592 = _164 + 8;
        uint _594 = uint(int(uint(_592) >> uint(2)));
        float _596 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_594)]);
        int _598 = _164 + 12;
        uint _600 = uint(int(uint(_598) >> uint(2)));
        float _602 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_600)]);
        uint _604 = uint(int(uint(_164) >> uint(2)));
        float _606 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_604)]);
        int _608 = _164 + 4;
        uint _610 = uint(int(uint(_608) >> uint(2)));
        float _612 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_610)]);
        int _614 = _164 + 8;
        uint _616 = uint(int(uint(_614) >> uint(2)));
        float _618 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_616)]);
        int _620 = _164 + 12;
        uint _622 = uint(int(uint(_620) >> uint(2)));
        float _624 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_622)]);
        float _626 = _306 * _568;
        float _628 = _306 * _590;
        float _630 = _306 * _612;
        float _632 = fma(_308, _562, _626);
        float _634 = fma(_308, _584, _628);
        float _636 = fma(_308, _606, _630);
        float _638 = fma(_310, _574, _632);
        float _640 = fma(_310, _596, _634);
        float _642 = fma(_310, _618, _636);
        float _644 = _638 + _580;
        float _646 = _640 + _602;
        float _648 = _642 + _624;
        _554 = _646;
        _556 = _644;
        _558 = _648;
    }
    float _650 = _554;
    float _652 = _556;
    float _654 = _558;
    float _656 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[70]);
    float _658 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[504]);
    float _660 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[505]);
    float _662 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[506]);
    float _664 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[507]);
    float _666 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[501]);
    float _668 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[8]);
    float _670 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[9]);
    float _672 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[10]);
    float _674 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[11]);
    float _676 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[61]);
    float _678 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[60]);
    float _680 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[502]);
    float _682 = _656 + 1.0;
    float _684 = _682 + _650;
    float _686 = _684 * _660;
    float _688 = fma(_658, _652, _686);
    float _690 = fma(_662, _654, _688);
    float _692 = _664 + _690;
    float _694 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[508]);
    float _696 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[509]);
    float _698 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[510]);
    float _700 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[511]);
    float _702 = trunc(_692);
    int _704 = int(_702);
    int _706 = ~as_type<int>(_666);
    int _708 = _704 + _706;
    int _710 = _708 + 1;
    bool _712 = _710 >= 0;
    int _714 = 0;
    if (_712)
    {
        float _716 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[500]);
        _714 = as_type<int>(_716);
    }
    int _718 = _714;
    float _720 = fma(_652, 6.2500002968590706586837768554688e-05, 0.5);
    float _722 = fma(_654, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _2737 = float2(_720, _722);
    float _724 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_2737, float2(0.0), isnan(_2737)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_2737, float2(0.0), isnan(_2737)), level(0.0)).x;
    float _726 = _670 * _650;
    float _728 = fma(_668, _652, _726);
    float _730 = fma(_672, _654, _728);
    float _732 = _674 + _730;
    float _734 = -_732;
    bool _736 = _676 >= _734;
    bool _738 = isnan(_676);
    bool _740 = _736 || _738;
    bool _742 = isnan(_734);
    bool _744 = _740 || _742;
    float _746 = -_732;
    bool _748 = _678 >= _746;
    bool _750 = isnan(_678);
    bool _752 = _748 || _750;
    bool _754 = isnan(_746);
    bool _756 = _752 || _754;
    int _758 = _744 ? 0 : 1;
    int _760 = 2;
    float _762 = _720;
    float _764 = _722;
    if (_744)
    {
        _760 = 1;
    }
    int _766 = _760;
    int _768 = _766;
    if (_756)
    {
        _768 = _758;
    }
    int _770 = _768;
    int _772 = _770 << 6;
    int _774 = _772 + 96;
    uint _776 = uint(int(uint(_774) >> uint(2)));
    float _778 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_776)]);
    int _780 = _774 + 4;
    uint _782 = uint(int(uint(_780) >> uint(2)));
    float _784 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_782)]);
    int _786 = _774 + 8;
    uint _788 = uint(int(uint(_786) >> uint(2)));
    float _790 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_788)]);
    int _792 = _774 + 12;
    uint _794 = uint(int(uint(_792) >> uint(2)));
    float _796 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_794)]);
    int _798 = _772 + 48;
    uint _800 = uint(int(uint(_798) >> uint(2)));
    float _802 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_800)]);
    int _804 = _798 + 4;
    uint _806 = uint(int(uint(_804) >> uint(2)));
    float _808 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_806)]);
    int _810 = _798 + 8;
    uint _812 = uint(int(uint(_810) >> uint(2)));
    float _814 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_812)]);
    int _816 = _798 + 12;
    uint _818 = uint(int(uint(_816) >> uint(2)));
    float _820 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_818)]);
    float _822 = _684 * _696;
    float _824 = fma(_694, _652, _822);
    float _826 = fma(_698, _654, _824);
    float _828 = _700 + _826;
    int _830 = _772 + 64;
    float _832 = trunc(_828);
    int _834 = int(_832);
    uint _836 = uint(int(uint(_830) >> uint(2)));
    float _838 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_836)]);
    int _840 = _830 + 4;
    uint _842 = uint(int(uint(_840) >> uint(2)));
    float _844 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_842)]);
    int _846 = _830 + 8;
    uint _848 = uint(int(uint(_846) >> uint(2)));
    float _850 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_848)]);
    int _852 = _830 + 12;
    uint _854 = uint(int(uint(_852) >> uint(2)));
    float _856 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_854)]);
    int _858 = ~as_type<int>(_680);
    int _860 = _834 + _858;
    int _862 = _860 + 1;
    bool _864 = _718 <= _710;
    bool _866 = !_712;
    bool _868 = _864 || _866;
    int _870 = _772 + 80;
    float _872 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
    bool _874 = _862 < 0;
    bool _876 = _874 || _868;
    uint _878 = uint(int(uint(_870) >> uint(2)));
    float _880 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_878)]);
    int _882 = _870 + 4;
    uint _884 = uint(int(uint(_882) >> uint(2)));
    float _886 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_884)]);
    int _888 = _870 + 8;
    uint _890 = uint(int(uint(_888) >> uint(2)));
    float _892 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_890)]);
    int _894 = _870 + 12;
    uint _896 = uint(int(uint(_894) >> uint(2)));
    float _898 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_896)]);
    int _900 = as_type<int>(_680);
    float _902 = _802;
    if (!_876)
    {
        float _904 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[500]);
        _900 = as_type<int>(_904);
    }
    int _906 = _900;
    float _908 = _684 * _784;
    float _910 = fma(_778, _652, _908);
    float _912 = fma(_790, _654, _910);
    float _914 = _796 + _912;
    float _916 = _684 * _808;
    float _918 = 1.0 / _914;
    float _920 = fma(_802, _652, _916);
    float _922 = fma(_814, _654, _920);
    float _924 = _820 + _922;
    float _926 = _924 * _918;
    bool _928 = _926 >= 0.0;
    bool _930 = _926 <= 1.0;
    bool _932 = _930 && _928;
    float _934 = _170 * _210;
    float _936 = _684 * _844;
    float _938 = fma(_838, _652, _936);
    float _940 = fma(_850, _654, _938);
    float _942 = _856 + _940;
    float _944 = _942 * _918;
    float _946 = abs(_208);
    float _948 = log2(_946);
    bool _950 = _944 >= 0.0;
    bool _952 = _950 && _932;
    bool _954 = _944 <= 1.0;
    bool _956 = _954 && _952;
    float _958 = _684 * _886;
    bool _960 = _906 <= _862;
    bool _962 = _960 || _876;
    float _964 = fma(_880, _652, _958);
    float _966 = -_440;
    float _968 = _872 + _966;
    float _970 = fma(_892, _654, _964);
    float _972 = _170 * _948;
    bool _974 = _968 > 0.001000000047497451305389404296875;
    bool _976 = isnan(_968);
    bool _978 = _974 || _976;
    bool _980 = isnan(0.001000000047497451305389404296875);
    bool _982 = _978 || _980;
    float _984 = _898 + _970;
    float _986 = _964;
    float _988 = _940;
    float _990 = _922;
    float _992 = _880;
    float _994 = _926;
    if (_956)
    {
        float _996 = float(_770);
        _902 = _996;
    }
    float _998 = _902;
    if (_962)
    {
        _986 = 1.0;
    }
    float _1000 = _986;
    float _1002 = _1000;
    if (!_962)
    {
        float _1004 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[500]);
        int _1006 = _862 * as_type<int>(_1004);
        int _1008 = _1006 + _710;
        int _1010 = _1008 << 2;
        uint _1012 = uint(int(uint(_1008) >> uint(2)));
        int _1014 = 12 & _1010;
        int _1016 = int(_1012) << 4;
        int _1018 = _1016 + _1014;
        int _1020 = _1018 + 400;
        uint _1022 = uint(int(uint(_1020) >> uint(2)));
        float _1024 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1022)]);
        float _1026 = floor(_692);
        float _1028 = floor(_828);
        float _1030 = -_1026;
        float _1032 = _692 + _1030;
        float _1034 = -_1028;
        float _1036 = _828 + _1034;
        float _1038 = rint(_1024);
        float _1040 = precise::max(_1038, 0.0);
        uint _1042 = uint(_1040);
        uint _1044 = clamp(_1042, 0u, 65535u);
        float3 _3222 = float3(_1032, _1036, float(int(_1044)));
        float3 _3226 = select(_3222, float3(0.0), isnan(_3222));
        float _1046 = dm_bs(spvDescriptorSet0.cp_t_tcb_14.sample(spvDescriptorSet0.cp_t_tcb_14Smplr, _3226.xy, uint(rint(_3226.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_14, spvDescriptorSet0.cp_t_tcb_14Smplr_w, _3226.xy, uint(rint(_3226.z)), level(0.0)).x;
        int _1048 = _1008 << 4;
        int _1050 = _1048 + 2048;
        uint _1052 = uint(int(uint(_1050) >> uint(2)));
        float _1054 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1052)]);
        int _1056 = _1050 + 4;
        uint _1058 = uint(int(uint(_1056) >> uint(2)));
        float _1060 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1058)]);
        int _1062 = _1050 + 8;
        uint _1064 = uint(int(uint(_1062) >> uint(2)));
        float _1066 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1064)]);
        int _1068 = _1050 + 12;
        uint _1070 = uint(int(uint(_1068) >> uint(2)));
        float _1072 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1070)]);
        float _1074 = _684 * _1060;
        float _1076 = fma(_1054, _652, _1074);
        float _1078 = fma(_1066, _654, _1076);
        float _1080 = _1072 + _1078;
        float _1082 = precise::clamp(_1080, 0.0, 1.0);
        float _1084 = -_1082;
        float _1086 = _1084 + _1046;
        float _1088 = fma(_1086, 500.0, 1.5);
        float _1090 = exp2(_1088);
        float _1092 = 0.0 + _1090;
        float _1094 = precise::clamp(_1092, 0.0, 1.0);
        _278 = _1024;
        _988 = _1036;
        _990 = as_type<float>(_1044);
        _992 = _1054;
        _1002 = _1094;
    }
    float _1096 = _278;
    float _1098 = _988;
    float _1100 = _990;
    float _1102 = _992;
    float _1104 = _1002;
    float _1106 = _998;
    float _1108 = _1100;
    float _1110 = _1102;
    float _1112 = _1096;
    if (_956)
    {
        float _1114 = rint(_998);
        float _1116 = precise::max(_1114, 0.0);
        uint _1118 = uint(_1116);
        uint _1120 = clamp(_1118, 0u, 65535u);
        _1106 = as_type<float>(_1120);
    }
    float _1122 = _1106;
    float _1124 = _984 * _918;
    bool _1126 = _724 != 0.0;
    bool _1128 = isnan(_724);
    bool _1130 = _1126 || _1128;
    bool _1132 = isnan(0.0);
    bool _1134 = _1130 || _1132;
    uint _1136 = uint(int(uint(_164) >> uint(2)));
    float _1138 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1136)]);
    if (!_982)
    {
        float _1140 = fma(_652, 6.2500002968590706586837768554688e-05, 0.4999375045299530029296875);
        _1108 = _1140;
    }
    float _1142 = _1108;
    if (!_982)
    {
        float _1144 = fma(_652, 6.2500002968590706586837768554688e-05, 0.500062525272369384765625);
        _1110 = _1144;
    }
    float _1146 = _1110;
    float _1148 = exp2(_972);
    float _1150 = _944;
    float _1152 = _1122;
    if (_956)
    {
        float3 _3384 = float3(_926, _944, float(as_type<int>(_1122)));
        float3 _3386 = select(_3384, float3(0.0), isnan(_3384));
        float _1154 = spvDepthCast(spvDescriptorSet0.cp_t_tcb_16).sample_compare(spvDescriptorSet0.cp_t_tcb_16Smplr, _3386.xy, uint(rint(_3386.z)), _1124, level(0.0));
        _1150 = _1154;
    }
    float _1156 = _1150;
    if (!_1134)
    {
        _1112 = 4.0;
    }
    float _1158 = _1112;
    float _1160 = _724;
    float _1162 = _1158;
    if (!_1134)
    {
        float2 _3406 = float2(_720, _722);
        float _1164 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_3406, float2(0.0), isnan(_3406)), level(_1158)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_3406, float2(0.0), isnan(_3406)), level(_1158)).x;
        _1160 = _1164;
    }
    float _1166 = _1160;
    float _1168 = _1098;
    if (!_982)
    {
        float2 _3422 = float2(_1142, _722);
        float _1170 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_3422, float2(0.0), isnan(_3422)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_3422, float2(0.0), isnan(_3422)), level(0.0)).x;
        _1168 = _1170;
    }
    float _1172 = _1168;
    float _1174 = _778;
    if (!_982)
    {
        float2 _3437 = float2(_1146, _722);
        float _1176 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_3437, float2(0.0), isnan(_3437)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_3437, float2(0.0), isnan(_3437)), level(0.0)).x;
        _1174 = _1176;
    }
    float _1178 = _1174;
    float _1180 = _320 * _934;
    if (!_956)
    {
        _412 = 1.0;
    }
    float _1182 = _412;
    float _1184 = _322 * _934;
    float _1186 = _324 * _934;
    float _1188 = fma(_178, _1148, _1180);
    float _1190 = fma(_184, _1148, _1184);
    float _1192 = fma(_190, _1148, _1186);
    float _1194 = _1182;
    float _1196 = _1156;
    float _1198 = _1172;
    if (_956)
    {
        bool _1200 = _1156 >= _1124;
        bool _1202 = isnan(_1156);
        bool _1204 = _1200 || _1202;
        bool _1206 = isnan(_1124);
        bool _1208 = _1204 || _1206;
        float _1210 = float(_1208);
        _1194 = _1210;
    }
    float _1212 = _1194;
    float _1214 = -_1212;
    float _1216 = fma(_1214, _1104, 1.0);
    float _1218 = -_1138;
    float _1220 = _1216 + _1218;
    float _1222 = _1216;
    if (_982)
    {
        float _1224 = fma(_1220, 0.0500000007450580596923828125, _1138);
        _1222 = _1224;
    }
    float _1226 = _1222;
    float _1228 = precise::max(0.0, _1226);
    float _1230 = precise::min(_1228, 0.999000012874603271484375);
    uint _1232 = uint(int(uint(_164) >> uint(2)));
    (*spvDescriptorSet0.cp_s12)._m0[int(_1232)] = as_type<uint>(_1230);
    float _1234 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[76]);
    float _1236 = _1166 * 2000.0;
    int _1238 = _164 + 4;
    bool _1240 = _1236 == 0.0;
    bool _1242 = !_982;
    bool _1244 = _1240 && _1242;
    bool _1246 = !_1244;
    int _1248 = _1246 ? as_type<int>(_448) : 0;
    float _1250 = _1236 + _1234;
    int _1252 = as_type<int>(_1236);
    if (_982)
    {
        _1252 = _1248;
    }
    int _1254 = _1252;
    uint _1256 = uint(int(uint(_1238) >> uint(2)));
    (*spvDescriptorSet0.cp_s12)._m0[int(_1256)] = as_type<uint>(_1250);
    int _1258 = _1254;
    if (!_982)
    {
        float _1260 = fma(_654, 6.2500002968590706586837768554688e-05, 0.4999375045299530029296875);
        float _1262 = fma(_654, 6.2500002968590706586837768554688e-05, 0.500062525272369384765625);
        bool _1264 = _1172 != 0.0;
        bool _1266 = isnan(_1172);
        bool _1268 = _1264 || _1266;
        bool _1270 = isnan(0.0);
        bool _1272 = _1268 || _1270;
        float2 _3589 = float2(_720, _1260);
        float _1274 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_3589, float2(0.0), isnan(_3589)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_3589, float2(0.0), isnan(_3589)), level(0.0)).x;
        float2 _3597 = float2(_720, _1262);
        float _1276 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_3597, float2(0.0), isnan(_3597)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_3597, float2(0.0), isnan(_3597)), level(0.0)).x;
        float2 _3605 = float2(_1142, _1260);
        float _1278 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_3605, float2(0.0), isnan(_3605)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_3605, float2(0.0), isnan(_3605)), level(0.0)).x;
        float2 _3613 = float2(_1142, _1262);
        float _1280 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_3613, float2(0.0), isnan(_3613)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_3613, float2(0.0), isnan(_3613)), level(0.0)).x;
        float2 _3621 = float2(_1146, _1260);
        float _1282 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_3621, float2(0.0), isnan(_3621)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_3621, float2(0.0), isnan(_3621)), level(0.0)).x;
        float2 _3629 = float2(_1146, _1262);
        float _1284 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_3629, float2(0.0), isnan(_3629)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_3629, float2(0.0), isnan(_3629)), level(0.0)).x;
        if (_1272)
        {
            _280 = _1172;
        }
        float _1286 = _280;
        if (!_1272)
        {
            _282 = 4.0;
        }
        float _1288 = _282;
        float _1290 = _1286;
        float _1292 = _1288;
        if (!_1272)
        {
            float2 _3652 = float2(_1142, _722);
            float _1294 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_3652, float2(0.0), isnan(_3652)), level(_1288)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_3652, float2(0.0), isnan(_3652)), level(_1288)).x;
            _1290 = _1294;
        }
        float _1296 = _1290;
        bool _1298 = _1178 != 0.0;
        bool _1300 = isnan(_1178);
        bool _1302 = _1298 || _1300;
        bool _1304 = isnan(0.0);
        bool _1306 = _1302 || _1304;
        if (_1306)
        {
            _1292 = _1178;
        }
        float _1308 = _1292;
        if (!_1306)
        {
            _1162 = 4.0;
        }
        float _1310 = _1162;
        float _1312 = _1308;
        if (!_1306)
        {
            float2 _3689 = float2(_1146, _722);
            float _1314 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_3689, float2(0.0), isnan(_3689)), level(_1310)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_3689, float2(0.0), isnan(_3689)), level(_1310)).x;
            _1312 = _1314;
        }
        float _1316 = _1312;
        bool _1318 = _1274 != 0.0;
        bool _1320 = isnan(_1274);
        bool _1322 = _1318 || _1320;
        bool _1324 = isnan(0.0);
        bool _1326 = _1322 || _1324;
        bool _1328 = _1278 != 0.0;
        bool _1330 = isnan(_1278);
        bool _1332 = _1328 || _1330;
        bool _1334 = isnan(0.0);
        bool _1336 = _1332 || _1334;
        bool _1338 = _1280 != 0.0;
        bool _1340 = isnan(_1280);
        bool _1342 = _1338 || _1340;
        bool _1344 = isnan(0.0);
        bool _1346 = _1342 || _1344;
        bool _1348 = _1284 != 0.0;
        bool _1350 = isnan(_1284);
        bool _1352 = _1348 || _1350;
        bool _1354 = isnan(0.0);
        bool _1356 = _1352 || _1354;
        bool _1358 = _1282 != 0.0;
        bool _1360 = isnan(_1282);
        bool _1362 = _1358 || _1360;
        bool _1364 = isnan(0.0);
        bool _1366 = _1362 || _1364;
        bool _1368 = _1276 != 0.0;
        bool _1370 = isnan(_1276);
        bool _1372 = _1368 || _1370;
        bool _1374 = isnan(0.0);
        bool _1376 = _1372 || _1374;
        if (!_1326)
        {
            _762 = 4.0;
        }
        float _1378 = _762;
        if (!_1336)
        {
            _1196 = 4.0;
        }
        float _1380 = _1196;
        if (!_1346)
        {
            _1198 = 4.0;
        }
        float _1382 = _1198;
        if (!_1356)
        {
            _994 = 4.0;
        }
        float _1384 = _994;
        if (!_1366)
        {
            _1152 = 4.0;
        }
        float _1386 = _1152;
        float _1388 = _1280;
        if (!_1346)
        {
            float2 _3796 = float2(_1142, _1262);
            float _1390 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_3796, float2(0.0), isnan(_3796)), level(_1382)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_3796, float2(0.0), isnan(_3796)), level(_1382)).x;
            _1388 = _1390;
        }
        float _1392 = _1388;
        float _1394 = _1284;
        if (!_1356)
        {
            float2 _3812 = float2(_1146, _1262);
            float _1396 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_3812, float2(0.0), isnan(_3812)), level(_1384)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_3812, float2(0.0), isnan(_3812)), level(_1384)).x;
            _1394 = _1396;
        }
        float _1398 = _1394;
        float _1400 = _1278;
        if (!_1336)
        {
            float2 _3828 = float2(_1142, _1260);
            float _1402 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_3828, float2(0.0), isnan(_3828)), level(_1380)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_3828, float2(0.0), isnan(_3828)), level(_1380)).x;
            _1400 = _1402;
        }
        float _1404 = _1400;
        float _1406 = _1282;
        if (!_1366)
        {
            float2 _3844 = float2(_1146, _1260);
            float _1408 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_3844, float2(0.0), isnan(_3844)), level(_1386)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_3844, float2(0.0), isnan(_3844)), level(_1386)).x;
            _1406 = _1408;
        }
        float _1410 = _1406;
        if (!_1376)
        {
            _764 = 4.0;
        }
        float _1412 = _764;
        float _1414 = _1276;
        if (!_1376)
        {
            float2 _3865 = float2(_720, _1262);
            float _1416 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_3865, float2(0.0), isnan(_3865)), level(_1412)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_3865, float2(0.0), isnan(_3865)), level(_1412)).x;
            _1414 = _1416;
        }
        float _1418 = _1414;
        float _1420 = _1274;
        if (!_1326)
        {
            float2 _3881 = float2(_720, _1260);
            float _1422 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_3881, float2(0.0), isnan(_3881)), level(_1378)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_3881, float2(0.0), isnan(_3881)), level(_1378)).x;
            _1420 = _1422;
        }
        float _1424 = _1420;
        float _1426 = -_1296;
        float _1428 = _1166 + _1426;
        float _1430 = -_1316;
        float _1432 = _1166 + _1430;
        float _1434 = abs(_1428);
        float _1436 = abs(_1432);
        float _1438 = precise::max(_1434, _1436);
        float _1440 = -_1392;
        float _1442 = _1166 + _1440;
        float _1444 = -_1398;
        float _1446 = _1166 + _1444;
        float _1448 = -_1404;
        float _1450 = _1166 + _1448;
        float _1452 = -_1410;
        float _1454 = _1166 + _1452;
        float _1456 = abs(_1450);
        float _1458 = abs(_1442);
        float _1460 = precise::max(_1456, _1458);
        float _1462 = -_1418;
        float _1464 = _1166 + _1462;
        float _1466 = -_1424;
        float _1468 = _1166 + _1466;
        float _1470 = abs(_1454);
        float _1472 = abs(_1446);
        float _1474 = precise::max(_1470, _1472);
        float _1476 = abs(_1468);
        float _1478 = abs(_1464);
        float _1480 = precise::max(_1476, _1478);
        float _1482 = precise::max(_1460, _1474);
        float _1484 = precise::max(_1438, _1480);
        bool _1486 = _1482 > 0.00150000001303851604461669921875;
        bool _1488 = _1484 > 0.00150000001303851604461669921875;
        bool _1490 = _1488 || _1486;
        bool _1492 = !_1490;
        int _1494 = _1492 ? _1248 : 0;
        _1258 = _1494;
    }
    int _1496 = _1258;
    int _1498 = _164 + 8;
    uint _1500 = uint(int(uint(_168) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1500)] = uint(_1496);
    uint _1502 = uint(int(uint(_164) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1502)] = as_type<uint>(_308);
    uint _1504 = uint(int(uint(_1238) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1504)] = as_type<uint>(_306);
    uint _1506 = uint(int(uint(_1498) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1506)] = as_type<uint>(_310);
    uint _1508 = uint(int(uint(_164) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_1508)] = as_type<uint>(_1188);
    uint _1510 = uint(int(uint(_1238) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_1510)] = as_type<uint>(_1190);
    uint _1512 = uint(int(uint(_1498) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_1512)] = as_type<uint>(_1192);
    uint _1514 = uint(int(uint(_164) >> uint(2)));
    (*spvDescriptorSet0.cp_s5)._m0[int(_1514)] = as_type<uint>(_302);
    uint _1516 = uint(int(uint(_1238) >> uint(2)));
    (*spvDescriptorSet0.cp_s5)._m0[int(_1516)] = as_type<uint>(_300);
    uint _1518 = uint(int(uint(_1498) >> uint(2)));
    (*spvDescriptorSet0.cp_s5)._m0[int(_1518)] = as_type<uint>(_304);
    float _1520 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _1522 = _300 * _300;
    float _1524 = _1190 * _1190;
    float _1526 = fma(_302, _302, _1522);
    float _1528 = fma(_1188, _1188, _1524);
    float _1530 = fma(_304, _304, _1526);
    float _1532 = fma(_1192, _1192, _1528);
    float _1534 = sqrt(_1532);
    float _1536 = sqrt(_1530);
    bool _1538 = _1536 >= 9.9999999747524270787835121154785e-07;
    bool _1540 = isnan(_1536);
    bool _1542 = _1538 || _1540;
    bool _1544 = isnan(9.9999999747524270787835121154785e-07);
    bool _1546 = _1542 || _1544;
    float _1548 = _1536;
    int _1564;
    if (!_1546)
    {
        bool _1550 = _872 != _440;
        bool _1552 = isnan(_872);
        bool _1554 = _1550 || _1552;
        bool _1556 = isnan(_440);
        bool _1558 = _1554 || _1556;
        if (_1558)
        {
            _332 = as_type<int>(_386);
        }
        int _1560 = _332;
        int _1562 = _1560;
        _1564 = _1560;
        _1566 = _1558;
        if (!_1566)
        {
            float _1568 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
            bool _1570 = _1568 > 0.0;
            bool _1572 = !_1570;
            if (!_1572)
            {
                float _1574 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
                float _1576 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
                float _1578 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
                float _1580 = _1576 * _1576;
                float _1582 = fma(_1574, _1574, _1580);
                float _1584 = fma(_1578, _1578, _1582);
                float _1586 = rsqrt(_1584);
                float _1588 = _1586 * 9.9999999747524270787835121154785e-07;
                float _1590 = _1574 * _1588;
                float _1592 = _1576 * _1588;
                float _1594 = _1578 * _1588;
                _1564 = as_type<int>(_1590);
                _458 = as_type<int>(_1592);
                _460 = as_type<int>(_1594);
                _1566 = true;
            }
            else
            {
                bool _1596 = _1534 >= 9.9999999747524270787835121154785e-07;
                bool _1598 = isnan(_1534);
                bool _1600 = _1596 || _1598;
                bool _1602 = isnan(9.9999999747524270787835121154785e-07);
                bool _1604 = _1600 || _1602;
                if (!_1604)
                {
                    float _1606 = _306 * _306;
                    float _1608 = fma(_308, _308, _1606);
                    float _1610 = fma(_310, _310, _1608);
                    float _1612 = sqrt(_1610);
                    bool _1614 = _1612 >= 9.9999999747524270787835121154785e-07;
                    bool _1616 = isnan(_1612);
                    bool _1618 = _1614 || _1616;
                    bool _1620 = isnan(9.9999999747524270787835121154785e-07);
                    bool _1622 = _1618 || _1620;
                    int _1624 = as_type<int>(_398);
                    int _1626 = as_type<int>(_1612);
                    if (_1622)
                    {
                        float _1628 = rsqrt(_1610);
                        _1624 = as_type<int>(_1628);
                    }
                    int _1630 = _1624;
                    if (!_1622)
                    {
                        _1562 = 0;
                    }
                    int _1632 = _1562;
                    int _1634 = _1632;
                    if (!_1622)
                    {
                        _1626 = 897988541;
                    }
                    int _1636 = _1626;
                    int _1638 = _1630;
                    int _1640 = _1636;
                    if (_1622)
                    {
                        float _1642 = as_type<float>(_1630) * 9.9999999747524270787835121154785e-07;
                        _1548 = _1642;
                    }
                    float _1644 = _1548;
                    if (!_1622)
                    {
                        _1638 = 0;
                    }
                    int _1646 = _1638;
                    int _1648 = _1646;
                    if (_1622)
                    {
                        float _1650 = _308 * _1644;
                        _1634 = as_type<int>(_1650);
                    }
                    int _1652 = _1634;
                    _1564 = _1652;
                    if (_1622)
                    {
                        float _1654 = _306 * _1644;
                        _1640 = as_type<int>(_1654);
                    }
                    int _1656 = _1640;
                    _458 = _1656;
                    if (_1622)
                    {
                        float _1658 = _310 * _1644;
                        _1648 = as_type<int>(_1658);
                    }
                    int _1660 = _1648;
                    _460 = _1660;
                    _1566 = true;
                }
                else
                {
                    float _1662 = rsqrt(_1532);
                    float _1664 = _1662 * 9.9999999747524270787835121154785e-07;
                    float _1666 = _1188 * _1664;
                    float _1668 = _1190 * _1664;
                    float _1670 = _1192 * _1664;
                    _1564 = as_type<int>(_1666);
                    _458 = as_type<int>(_1668);
                    _460 = as_type<int>(_1670);
                    _1566 = true;
                }
            }
        }
    }
    else
    {
        float _1672 = _1534 * _1520;
        bool _1674 = _1672 >= 0.001000000047497451305389404296875;
        bool _1676 = isnan(_1672);
        bool _1678 = _1674 || _1676;
        bool _1680 = isnan(0.001000000047497451305389404296875);
        bool _1682 = _1678 || _1680;
        bool _1684 = _1672 > 0.0;
        bool _1686 = !_1682;
        bool _1688 = _1684 && _1686;
        bool _1690 = _1536 < 0.001000000047497451305389404296875;
        bool _1692 = _1690 && _1688;
        if (!_1692)
        {
            _454 = as_type<int>(_300);
        }
        int _1694 = _454;
        int _1696 = _1694;
        if (_1692)
        {
            float _1698 = _1188 * _1520;
            _334 = as_type<int>(_1698);
        }
        int _1700 = _334;
        _1564 = _1700;
        if (!_1692)
        {
            _456 = as_type<int>(_304);
        }
        int _1702 = _456;
        _460 = _1702;
        if (_1692)
        {
            float _1704 = _1190 * _1520;
            _1696 = as_type<int>(_1704);
        }
        int _1706 = _1696;
        _458 = _1706;
        if (_1692)
        {
            float _1708 = _1192 * _1520;
            _460 = as_type<int>(_1708);
        }
    }
    _1566 = false;
    int _1710 = _1564;
    int _1712 = _458;
    int _1714 = _460;
    uint _1716 = uint(int(uint(_164) >> uint(2)));
    (*spvDescriptorSet0.cp_s5)._m0[int(_1716)] = uint(_1710);
    uint _1718 = uint(int(uint(_1238) >> uint(2)));
    (*spvDescriptorSet0.cp_s5)._m0[int(_1718)] = uint(_1712);
    uint _1720 = uint(int(uint(_1498) >> uint(2)));
    (*spvDescriptorSet0.cp_s5)._m0[int(_1720)] = uint(_1714);
}

