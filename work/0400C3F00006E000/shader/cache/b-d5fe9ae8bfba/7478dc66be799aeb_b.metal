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
    bool _2025 = false;
    bool _1719 = false;
    bool _1617 = false;
    bool _1399 = false;
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
    if (!_103)
    {
        int _113 = _95 << 4;
        int _115 = _113 + 12;
        uint _118 = uint(int(uint(_115) >> uint(2)));
        float _120 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_118)]);
        float _122 = trunc(_120);
        int _124 = int(_122);
        bool _126 = _124 >= 1;
        int _128 = _126 ? (-1) : 0;
        if (!_126)
        {
            _109 = 0;
        }
        int _130 = _109;
        bool _132 = !_126;
        _111 = _130;
        if (!_132)
        {
            float _134 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
            uint _136 = uint(int(uint(_115) >> uint(2)));
            float _138 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_136)]);
            float _140 = float(_124);
            float _142 = -_138;
            float _144 = _134 + _142;
            bool _146 = _144 > _140;
            int _148 = as_type<int>(_134);
            if (!_146)
            {
                bool _150 = _134 >= _138;
                bool _152 = isnan(_134);
                bool _154 = _150 || _152;
                bool _156 = isnan(_138);
                bool _158 = _154 || _156;
                _128 = _158 ? (-1) : 0;
            }
            int _160 = _128;
            if (_146)
            {
                _148 = 0;
            }
            int _162 = _148;
            _111 = _162;
            if (!_146)
            {
                int _164 = ~_160;
                int _166 = (_164 != 0) ? 0 : 1;
                _111 = _166;
            }
        }
    }
    int _168 = _111;
    int _170 = _168 & 1;
    bool _172 = _170 != 0;
    if (!_172)
    {
        return;
    }
    int _174 = _95 << 4;
    float _176 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[30]);
    int _178 = _174 + 12;
    float _180 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    uint _182 = uint(int(uint(_178) >> uint(2)));
    float _184 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_182)]);
    uint _186 = uint(int(uint(_174) >> uint(2)));
    float _188 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_186)]);
    int _190 = _174 + 4;
    uint _192 = uint(int(uint(_190) >> uint(2)));
    float _194 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_192)]);
    int _196 = _174 + 8;
    uint _198 = uint(int(uint(_196) >> uint(2)));
    float _200 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_198)]);
    uint _202 = uint(int(uint(_174) >> uint(2)));
    float _204 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_202)]);
    int _206 = _174 + 4;
    uint _208 = uint(int(uint(_206) >> uint(2)));
    float _210 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_208)]);
    int _212 = _174 + 8;
    uint _214 = uint(int(uint(_212) >> uint(2)));
    float _216 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_214)]);
    float _218 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[68]);
    float _220 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
    uint _222 = uint(int(uint(_178) >> uint(2)));
    float _224 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_222)]);
    int _226 = as_type<int>(_176) & 512;
    bool _228 = _226 != 0;
    uint _230 = uint(int(uint(_178) >> uint(2)));
    float _232 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_230)]);
    float _234 = 0.0;
    float _236 = 0.0;
    float _238 = 0.0;
    float _240 = 0.0;
    if (_228)
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
    if (_228)
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
    float _282 = _184 * _180;
    float _284 = 0.0;
    float _286 = 0.0;
    float _288 = 0.0;
    float _290 = 0.0;
    float _292 = _204;
    float _294 = _216;
    if (_228)
    {
        float _296 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _298 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _300 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _302 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        _284 = _296;
        _286 = _298;
        _288 = _300;
        _290 = _302;
    }
    float _304 = _284;
    float _306 = _286;
    float _308 = _288;
    float _310 = _290;
    float _312 = _194 * _282;
    float _314 = _188 * _282;
    float _316 = _200 * _282;
    float _318 = _210 + _312;
    float _320 = _204 + _314;
    float _322 = _216 + _316;
    int _324 = as_type<int>(_176) & 1024;
    bool _326 = _324 != 0;
    int _328 = as_type<int>(_176) & 2048;
    bool _330 = _328 != 0;
    float _332 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
    float _334 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
    float _336 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
    float _338 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
    float _340 = _250;
    float _342 = _252;
    int _344 = as_type<int>(_314);
    int _346 = as_type<int>(_314);
    if (_228)
    {
        float _348 = _318 * _252;
        _292 = _348;
    }
    float _350 = _292;
    float _352 = _350;
    if (_228)
    {
        float _354 = _318 * _276;
        _294 = _354;
    }
    float _356 = _294;
    float _358 = _356;
    if (_228)
    {
        float _360 = fma(_320, _250, _350);
        _352 = _360;
    }
    float _362 = _352;
    float _364 = _362;
    if (_228)
    {
        float _366 = fma(_320, _274, _356);
        _358 = _366;
    }
    float _368 = _358;
    float _370 = _368;
    if (_228)
    {
        float _372 = fma(_322, _254, _362);
        _364 = _372;
    }
    float _374 = _364;
    if (_228)
    {
        float _376 = fma(_322, _278, _368);
        _370 = _376;
    }
    float _378 = _370;
    if (!_228)
    {
        _340 = 0.0;
        _342 = 0.0;
    }
    float _380 = _340;
    float _382 = _342;
    float _384 = _382;
    float _386 = _380;
    if (_228)
    {
        float _388 = _256 + _374;
        _384 = _388;
    }
    float _390 = _384;
    if (_228)
    {
        float _392 = _280 + _378;
        _386 = _392;
    }
    float _394 = _386;
    uint _396 = uint(int(uint(_174) >> uint(2)));
    float _398 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_396)]);
    int _400 = _174 + 4;
    uint _402 = uint(int(uint(_400) >> uint(2)));
    float _404 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_402)]);
    int _406 = _174 + 8;
    uint _408 = uint(int(uint(_406) >> uint(2)));
    float _410 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_408)]);
    int _412 = _174 + 12;
    uint _414 = uint(int(uint(_412) >> uint(2)));
    float _416 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_414)]);
    float _418 = _306;
    float _420 = _308;
    float _422 = _338;
    if (_228)
    {
        float _424 = _318 * _306;
        _418 = _424;
    }
    float _426 = _418;
    float _428 = _426;
    if (_228)
    {
        float _430 = fma(_320, _304, _426);
        _428 = _430;
    }
    float _432 = _428;
    if (_228)
    {
        float _434 = fma(_322, _308, _432);
        _420 = _434;
    }
    float _436 = _420;
    uint _438 = uint(int(uint(_174) >> uint(2)));
    float _440 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_438)]);
    float _442 = 0.0;
    if (!_228)
    {
        _442 = 0.0;
    }
    float _444 = _442;
    float _446 = _444;
    if (_228)
    {
        float _448 = _310 + _436;
        _446 = _448;
    }
    float _450 = _446;
    float _452 = _450;
    if (!_326)
    {
        _422 = _394;
    }
    float _454 = _422;
    float _456 = _416;
    float _458 = _454;
    int _460 = as_type<int>(_404);
    int _462 = as_type<int>(_410);
    int _464 = as_type<int>(_404);
    int _466 = as_type<int>(_410);
    if (!_326)
    {
        _456 = _390;
    }
    float _468 = _456;
    bool _470 = !_326;
    float _472 = _468;
    if (!_470)
    {
        float _474 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        uint _476 = uint(int(uint(_174) >> uint(2)));
        float _478 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_476)]);
        int _480 = _174 + 4;
        uint _482 = uint(int(uint(_480) >> uint(2)));
        float _484 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_482)]);
        int _486 = _174 + 8;
        uint _488 = uint(int(uint(_486) >> uint(2)));
        float _490 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_488)]);
        uint _492 = uint(int(uint(_174) >> uint(2)));
        float _494 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_492)]);
        int _496 = _174 + 4;
        uint _498 = uint(int(uint(_496) >> uint(2)));
        float _500 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_498)]);
        int _502 = _174 + 8;
        uint _504 = uint(int(uint(_502) >> uint(2)));
        float _506 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_504)]);
        uint _508 = uint(int(uint(_174) >> uint(2)));
        float _510 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_508)]);
        int _512 = _174 + 4;
        uint _514 = uint(int(uint(_512) >> uint(2)));
        float _516 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_514)]);
        int _518 = _174 + 8;
        uint _520 = uint(int(uint(_518) >> uint(2)));
        float _522 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_520)]);
        float _524 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        float _526 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        float _528 = _318 * _484;
        float _530 = _318 * _500;
        float _532 = _318 * _516;
        float _534 = fma(_320, _478, _528);
        float _536 = fma(_320, _494, _530);
        float _538 = fma(_320, _510, _532);
        float _540 = fma(_322, _490, _534);
        float _542 = fma(_322, _506, _536);
        float _544 = fma(_322, _522, _538);
        float _546 = _474 + _540;
        float _548 = _524 + _542;
        float _550 = _526 + _544;
        _452 = _548;
        _472 = _546;
        _458 = _550;
    }
    float _552 = _452;
    float _554 = _472;
    float _556 = _458;
    bool _558 = !_330;
    float _560 = _552;
    float _562 = _554;
    float _564 = _556;
    if (!_558)
    {
        uint _566 = uint(int(uint(_174) >> uint(2)));
        float _568 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_566)]);
        int _570 = _174 + 4;
        uint _572 = uint(int(uint(_570) >> uint(2)));
        float _574 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_572)]);
        int _576 = _174 + 8;
        uint _578 = uint(int(uint(_576) >> uint(2)));
        float _580 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_578)]);
        int _582 = _174 + 12;
        uint _584 = uint(int(uint(_582) >> uint(2)));
        float _586 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_584)]);
        uint _588 = uint(int(uint(_174) >> uint(2)));
        float _590 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_588)]);
        int _592 = _174 + 4;
        uint _594 = uint(int(uint(_592) >> uint(2)));
        float _596 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_594)]);
        int _598 = _174 + 8;
        uint _600 = uint(int(uint(_598) >> uint(2)));
        float _602 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_600)]);
        int _604 = _174 + 12;
        uint _606 = uint(int(uint(_604) >> uint(2)));
        float _608 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_606)]);
        uint _610 = uint(int(uint(_174) >> uint(2)));
        float _612 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_610)]);
        int _614 = _174 + 4;
        uint _616 = uint(int(uint(_614) >> uint(2)));
        float _618 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_616)]);
        int _620 = _174 + 8;
        uint _622 = uint(int(uint(_620) >> uint(2)));
        float _624 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_622)]);
        int _626 = _174 + 12;
        uint _628 = uint(int(uint(_626) >> uint(2)));
        float _630 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_628)]);
        float _632 = _318 * _574;
        float _634 = _318 * _596;
        float _636 = _318 * _618;
        float _638 = fma(_320, _568, _632);
        float _640 = fma(_320, _590, _634);
        float _642 = fma(_320, _612, _636);
        float _644 = fma(_322, _580, _638);
        float _646 = fma(_322, _602, _640);
        float _648 = fma(_322, _624, _642);
        float _650 = _644 + _586;
        float _652 = _646 + _608;
        float _654 = _648 + _630;
        _560 = _652;
        _562 = _650;
        _564 = _654;
    }
    float _656 = _560;
    float _658 = _562;
    float _660 = _564;
    float _662 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[8]);
    float _664 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[9]);
    float _666 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[10]);
    float _668 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[11]);
    float _670 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[61]);
    float _672 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[60]);
    float _674 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[70]);
    float _676 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[504]);
    float _678 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[505]);
    float _680 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[506]);
    float _682 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[507]);
    float _684 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[501]);
    float _686 = _664 * _656;
    float _688 = fma(_662, _658, _686);
    float _690 = fma(_666, _660, _688);
    float _692 = _668 + _690;
    float _694 = -_692;
    bool _696 = _670 >= _694;
    bool _698 = isnan(_670);
    bool _700 = _696 || _698;
    bool _702 = isnan(_694);
    bool _704 = _700 || _702;
    float _706 = -_692;
    bool _708 = _672 >= _706;
    bool _710 = isnan(_672);
    bool _712 = _708 || _710;
    bool _714 = isnan(_706);
    bool _716 = _712 || _714;
    int _718 = _704 ? 0 : 1;
    int _720 = 2;
    float _722 = _658;
    if (_704)
    {
        _720 = 1;
    }
    int _724 = _720;
    int _726 = _724;
    if (_716)
    {
        _726 = _718;
    }
    int _728 = _726;
    int _730 = _728 << 6;
    int _732 = _730 + 96;
    uint _734 = uint(int(uint(_732) >> uint(2)));
    float _736 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_734)]);
    int _738 = _732 + 4;
    uint _740 = uint(int(uint(_738) >> uint(2)));
    float _742 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_740)]);
    int _744 = _732 + 8;
    uint _746 = uint(int(uint(_744) >> uint(2)));
    float _748 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_746)]);
    int _750 = _732 + 12;
    uint _752 = uint(int(uint(_750) >> uint(2)));
    float _754 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_752)]);
    int _756 = _730 + 48;
    int _758 = _730 + 64;
    uint _760 = uint(int(uint(_756) >> uint(2)));
    float _762 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_760)]);
    int _764 = _756 + 4;
    uint _766 = uint(int(uint(_764) >> uint(2)));
    float _768 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_766)]);
    int _770 = _756 + 8;
    uint _772 = uint(int(uint(_770) >> uint(2)));
    float _774 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_772)]);
    int _776 = _756 + 12;
    uint _778 = uint(int(uint(_776) >> uint(2)));
    float _780 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_778)]);
    uint _782 = uint(int(uint(_758) >> uint(2)));
    float _784 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_782)]);
    int _786 = _758 + 4;
    uint _788 = uint(int(uint(_786) >> uint(2)));
    float _790 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_788)]);
    int _792 = _758 + 8;
    uint _794 = uint(int(uint(_792) >> uint(2)));
    float _796 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_794)]);
    int _798 = _758 + 12;
    uint _800 = uint(int(uint(_798) >> uint(2)));
    float _802 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_800)]);
    int _804 = _730 + 80;
    float _806 = _674 + 1.0;
    float _808 = _806 + _656;
    uint _810 = uint(int(uint(_804) >> uint(2)));
    float _812 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_810)]);
    int _814 = _804 + 4;
    uint _816 = uint(int(uint(_814) >> uint(2)));
    float _818 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_816)]);
    int _820 = _804 + 8;
    uint _822 = uint(int(uint(_820) >> uint(2)));
    float _824 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_822)]);
    int _826 = _804 + 12;
    uint _828 = uint(int(uint(_826) >> uint(2)));
    float _830 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_828)]);
    float _832 = _808 * _678;
    float _834 = fma(_676, _658, _832);
    float _836 = fma(_680, _660, _834);
    float _838 = _682 + _836;
    float _840 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[508]);
    float _842 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[509]);
    float _844 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[510]);
    float _846 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[511]);
    float _848 = trunc(_838);
    int _850 = int(_848);
    int _852 = ~as_type<int>(_684);
    int _854 = _850 + _852;
    int _856 = _854 + 1;
    float _858 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[502]);
    bool _860 = _856 >= 0;
    int _862 = as_type<int>(_656);
    float _864 = as_type<float>(_728);
    if (_860)
    {
        float _866 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[500]);
        _862 = as_type<int>(_866);
    }
    int _868 = _862;
    float _870 = _808 * _742;
    float _872 = fma(_736, _658, _870);
    float _874 = fma(_748, _660, _872);
    float _876 = _754 + _874;
    float _878 = _808 * _768;
    float _880 = 1.0 / _876;
    float _882 = fma(_762, _658, _878);
    float _884 = _808 * _790;
    float _886 = fma(_774, _660, _882);
    float _888 = fma(_784, _658, _884);
    float _890 = _780 + _886;
    float _892 = fma(_796, _660, _888);
    float _894 = _890 * _880;
    float _896 = _802 + _892;
    bool _898 = _894 >= 0.0;
    float _900 = _896 * _880;
    bool _902 = _894 <= 1.0;
    bool _904 = _902 && _898;
    bool _906 = _900 >= 0.0;
    bool _908 = _906 && _904;
    bool _910 = _900 <= 1.0;
    bool _912 = _910 && _908;
    float _914 = _808 * _818;
    float _916 = fma(_812, _658, _914);
    if (_912)
    {
        float _918 = float(_728);
        _864 = _918;
    }
    float _920 = _864;
    float _922 = _890;
    if (_912)
    {
        float _924 = rint(_920);
        float _926 = precise::max(_924, 0.0);
        uint _928 = uint(_926);
        uint _930 = clamp(_928, 0u, 65535u);
        _922 = as_type<float>(_930);
    }
    float _932 = _922;
    float _934 = fma(_824, _660, _916);
    float _936 = _830 + _934;
    float _938 = _936 * _880;
    float _940 = _932;
    if (_912)
    {
        float3 _3535 = float3(_894, _900, float(as_type<int>(_932)));
        float3 _3539 = select(_3535, float3(0.0), isnan(_3535));
        float _942 = spvDepthCast(spvDescriptorSet0.cp_t_tcb_16).sample_compare(spvDescriptorSet0.cp_t_tcb_16Smplr, _3539.xy, uint(rint(_3539.z)), _938, level(0.0));
        _940 = _942;
    }
    float _944 = _940;
    float _946 = _808 * _842;
    float _948 = fma(_840, _658, _946);
    float _950 = fma(_844, _660, _948);
    bool _952 = _868 <= _856;
    bool _954 = !_860;
    bool _956 = _952 || _954;
    float _958 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
    float _960 = _846 + _950;
    float _962 = trunc(_960);
    int _964 = int(_962);
    int _966 = ~as_type<int>(_858);
    int _968 = _964 + _966;
    int _970 = _968 + 1;
    bool _972 = _970 < 0;
    bool _974 = _972 || _956;
    int _976 = as_type<int>(_846);
    float _978 = as_type<float>(_964);
    if (!_974)
    {
        float _980 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[500]);
        _976 = as_type<int>(_980);
    }
    int _982 = _976;
    bool _984 = _982 <= _970;
    bool _986 = _984 || _974;
    if (_986)
    {
        _978 = 1.0;
    }
    float _988 = _978;
    float _990 = _988;
    if (!_986)
    {
        float _992 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[500]);
        int _994 = _970 * as_type<int>(_992);
        int _996 = _994 + _856;
        int _998 = _996 << 2;
        uint _1000 = uint(int(uint(_996) >> uint(2)));
        int _1002 = 12 & _998;
        int _1004 = int(_1000) << 4;
        int _1006 = _1004 + _1002;
        int _1008 = _1006 + 400;
        uint _1010 = uint(int(uint(_1008) >> uint(2)));
        float _1012 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1010)]);
        float _1014 = floor(_838);
        float _1016 = floor(_960);
        float _1018 = -_1014;
        float _1020 = _838 + _1018;
        float _1022 = -_1016;
        float _1024 = _960 + _1022;
        float _1026 = rint(_1012);
        float _1028 = precise::max(_1026, 0.0);
        uint _1030 = uint(_1028);
        uint _1032 = clamp(_1030, 0u, 65535u);
        float3 _3677 = float3(_1020, _1024, float(int(_1032)));
        float3 _3679 = select(_3677, float3(0.0), isnan(_3677));
        float _1034 = dm_bs(spvDescriptorSet0.cp_t_tcb_14.sample(spvDescriptorSet0.cp_t_tcb_14Smplr, _3679.xy, uint(rint(_3679.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_14, spvDescriptorSet0.cp_t_tcb_14Smplr_w, _3679.xy, uint(rint(_3679.z)), level(0.0)).x;
        int _1036 = _996 << 4;
        int _1038 = _1036 + 2048;
        uint _1040 = uint(int(uint(_1038) >> uint(2)));
        float _1042 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1040)]);
        int _1044 = _1038 + 4;
        uint _1046 = uint(int(uint(_1044) >> uint(2)));
        float _1048 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1046)]);
        int _1050 = _1038 + 8;
        uint _1052 = uint(int(uint(_1050) >> uint(2)));
        float _1054 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1052)]);
        int _1056 = _1038 + 12;
        uint _1058 = uint(int(uint(_1056) >> uint(2)));
        float _1060 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1058)]);
        float _1062 = _808 * _1048;
        float _1064 = fma(_1042, _658, _1062);
        float _1066 = fma(_1054, _660, _1064);
        float _1068 = _1060 + _1066;
        float _1070 = precise::clamp(_1068, 0.0, 1.0);
        float _1072 = -_1070;
        float _1074 = _1072 + _1034;
        float _1076 = fma(_1074, 500.0, 1.5);
        float _1078 = exp2(_1076);
        float _1080 = 0.0 + _1078;
        float _1082 = precise::clamp(_1080, 0.0, 1.0);
        _990 = _1082;
    }
    float _1084 = _990;
    uint _1086 = uint(int(uint(_174) >> uint(2)));
    float _1088 = as_type<float>((*spvDescriptorSet0.cp_s13)._m0[int(_1086)]);
    float _1090 = abs(_218);
    float _1092 = log2(_1090);
    float _1094 = -_224;
    float _1096 = _958 + _1094;
    float _1098 = _180 * _1092;
    float _1100 = _180 * _220;
    float _1102 = exp2(_1098);
    float _1104 = _332 * _1100;
    float _1106 = _334 * _1100;
    float _1108 = _336 * _1100;
    float _1110 = _1100;
    float _1112 = _1096;
    if (!_912)
    {
        _1110 = 1.0;
    }
    float _1114 = _1110;
    float _1116 = _1114;
    if (_912)
    {
        bool _1118 = _944 >= _938;
        bool _1120 = isnan(_944);
        bool _1122 = _1118 || _1120;
        bool _1124 = isnan(_938);
        bool _1126 = _1122 || _1124;
        float _1128 = float(_1126);
        _1116 = _1128;
    }
    float _1130 = _1116;
    bool _1132 = _1096 > 0.001000000047497451305389404296875;
    bool _1134 = isnan(_1096);
    bool _1136 = _1132 || _1134;
    bool _1138 = isnan(0.001000000047497451305389404296875);
    bool _1140 = _1136 || _1138;
    float _1142 = -_1130;
    float _1144 = fma(_1142, _1084, 1.0);
    float _1146 = fma(_194, _1102, _1106);
    float _1148 = fma(_188, _1102, _1104);
    float _1150 = fma(_200, _1102, _1108);
    float _1152 = -_1088;
    float _1154 = _1144 + _1152;
    float _1156 = _1144;
    if (_1140)
    {
        float _1158 = fma(_1154, 0.0500000007450580596923828125, _1088);
        _1156 = _1158;
    }
    float _1160 = _1156;
    float _1162 = precise::max(0.0, _1160);
    float _1164 = precise::min(_1162, 0.999000012874603271484375);
    uint _1166 = uint(int(uint(_174) >> uint(2)));
    (*spvDescriptorSet0.cp_s13)._m0[int(_1166)] = as_type<uint>(_1164);
    float _1168 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[114]);
    float _1170 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[112]);
    float _1172 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[116]);
    float _1174 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[118]);
    float _1176 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[74]);
    float _1178 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[73]);
    float _1180 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[72]);
    float _1182 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[30]);
    float _1184 = _1168 * _1168;
    float _1186 = fma(_1170, _1170, _1184);
    float _1188 = rsqrt(_1186);
    float _1190 = _1188 * (-20.0);
    float _1192 = fma(_1170, _1190, _1172);
    float _1194 = fma(_1168, _1190, _1174);
    float _1196 = _1192 * 0.5;
    float _1198 = _1194 * 0.5;
    float _1200 = floor(_1196);
    float _1202 = floor(_1198);
    float _1204 = fma(_1200, 2.0, -32.0);
    float _1206 = -_1204;
    float _1208 = _1206 + _658;
    float _1210 = fma(_1202, 2.0, -32.0);
    float _1212 = -_1210;
    float _1214 = _1212 + _660;
    float _1216 = _1208 * 0.015625;
    float _1218 = _1214 * 0.015625;
    float2 _3961 = float2(_1216, _1218);
    float4 _1221 = spvDescriptorSet0.cp_t_tcb_26.gather(spvDescriptorSet0.cp_t_tcb_26Smplr, select(_3961, float2(0.0), isnan(_3961)), int2(0), component::x).xyzw;
    float _1223 = _1221.x;
    float _1225 = _1221.y;
    float _1227 = _1221.z;
    float _1229 = _1221.w;
    float2 _3979 = float2(_1216, _1218);
    float4 _1231 = spvDescriptorSet0.cp_t_tcb_26.gather(spvDescriptorSet0.cp_t_tcb_26Smplr, select(_3979, float2(0.0), isnan(_3979)), int2(0), component::y).xyzw;
    float _1233 = _1231.x;
    float _1235 = _1231.y;
    float _1237 = _1231.z;
    float _1239 = _1231.w;
    float _1241 = fma(_658, 6.2500002968590706586837768554688e-05, 0.5);
    float _1243 = fma(_660, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _4000 = float2(_1241, _1243);
    float2 _1247 = dm_bs(spvDescriptorSet0.cp_t_tcb_1A.sample(spvDescriptorSet0.cp_t_tcb_1ASmplr, select(_4000, float2(0.0), isnan(_4000)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_1A, spvDescriptorSet0.cp_t_tcb_1ASmplr_w, select(_4000, float2(0.0), isnan(_4000)), level(0.0)).xy;
    float _1249 = _1247.x;
    float _1251 = _1247.y;
    float2 _4012 = float2(_1241, _1243);
    float2 _1253 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_4012, float2(0.0), isnan(_4012)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_4012, float2(0.0), isnan(_4012)), level(0.0)).xy;
    float _1255 = _1253.x;
    float _1257 = _1253.y;
    bool _1259 = _1176 > 0.0;
    bool _1261 = _1178 > 0.0;
    float _1263 = _1176;
    float _1265 = _1178;
    float _1267 = _1180;
    bool _1269 = _1261;
    float _1271 = _1216;
    if (_1259)
    {
        float _1273 = 1.0 / _1176;
        _1263 = _1273;
    }
    float _1275 = _1263;
    if (_1261)
    {
        float _1277 = _1180 * _1178;
        _1265 = _1277;
    }
    float _1279 = _1265;
    if (_1261)
    {
        float _1281 = -_1279;
        float _1283 = fma(_440, _1281, _1180);
        _1267 = _1283;
    }
    float _1285 = _1267;
    float _1287 = _1285;
    if (_1259)
    {
        float _1289 = _1096 * _1275;
        _1112 = _1289;
    }
    float _1291 = _1112;
    if (_1259)
    {
        float _1293 = precise::min(_1291, 1.0);
        _722 = _1293;
    }
    float _1295 = _722;
    float _1297 = _1295;
    if (_1259)
    {
        float _1299 = _1295 * _1285;
        _1287 = _1299;
    }
    float _1301 = _1287;
    int _1303 = as_type<int>(_1182) & 512;
    bool _1305 = _1303 != 0;
    float _1307 = _1223 + _1225;
    float _1309 = _1233 + _1235;
    float _1311 = _1227 + _1307;
    float _1313 = _1237 + _1309;
    float _1315 = _1229 + _1311;
    float _1317 = _1239 + _1313;
    float _1319 = _1315 * 0.25;
    float _1321 = _1317 * 0.25;
    bool _1323 = !_1305;
    float _1395;
    float _1397;
    if (!_1323)
    {
        float _1325 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _1327 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _1329 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _1331 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _1333 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _1335 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _1337 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _1339 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _1341 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _1343 = _1329 * _1331;
        float _1345 = _1329 * _1333;
        float _1347 = _1327 * _1331;
        float _1349 = -_1343;
        float _1351 = fma(_1325, _1335, _1349);
        float _1353 = -_1345;
        float _1355 = fma(_1327, _1335, _1353);
        float _1357 = -_1347;
        float _1359 = fma(_1325, _1333, _1357);
        float _1361 = _1339 * _1351;
        float _1363 = -_1361;
        float _1365 = fma(_1337, _1355, _1363);
        float _1367 = fma(_1341, _1359, _1365);
        float _1369 = _1341 * _1327;
        float _1371 = _1339 * _1325;
        float _1373 = -_1369;
        float _1375 = fma(_1339, _1329, _1373);
        float _1377 = 1.0 / _1367;
        float _1379 = -_1371;
        float _1381 = fma(_1337, _1327, _1379);
        float _1383 = _1321 * _1377;
        float _1385 = _1319 * _1377;
        float _1387 = _1375 * _1383;
        float _1389 = _1381 * _1383;
        float _1391 = fma(_1355, _1385, _1387);
        float _1393 = fma(_1359, _1385, _1389);
        _1395 = _1391;
        _1397 = _1393;
        _1399 = true;
    }
    else
    {
        int _1401 = as_type<int>(_1182) & 1024;
        bool _1403 = _1401 != 0;
        if (_1403)
        {
            _1269 = true;
        }
        bool _1405 = _1269;
        bool _1407 = _1405;
        if (!_1403)
        {
            int _1409 = as_type<int>(_1182) & 2048;
            bool _1411 = _1409 != 0;
            _1407 = _1411;
        }
        bool _1413 = _1407;
        if (!_1413)
        {
            _1271 = _1319;
        }
        float _1415 = _1271;
        _1395 = _1415;
        if (!_1413)
        {
            _1297 = _1321;
        }
        float _1417 = _1297;
        bool _1419 = !_1413;
        _1397 = _1417;
        if (!_1419)
        {
            uint _1421 = uint(int(uint(_174) >> uint(2)));
            float _1423 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1421)]);
            int _1425 = _174 + 4;
            uint _1427 = uint(int(uint(_1425) >> uint(2)));
            float _1429 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1427)]);
            int _1431 = _174 + 8;
            uint _1433 = uint(int(uint(_1431) >> uint(2)));
            float _1435 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1433)]);
            uint _1437 = uint(int(uint(_174) >> uint(2)));
            float _1439 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1437)]);
            int _1441 = _174 + 4;
            uint _1443 = uint(int(uint(_1441) >> uint(2)));
            float _1445 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1443)]);
            int _1447 = _174 + 8;
            uint _1449 = uint(int(uint(_1447) >> uint(2)));
            float _1451 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1449)]);
            uint _1453 = uint(int(uint(_174) >> uint(2)));
            float _1455 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1453)]);
            int _1457 = _174 + 4;
            uint _1459 = uint(int(uint(_1457) >> uint(2)));
            float _1461 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1459)]);
            int _1463 = _174 + 8;
            uint _1465 = uint(int(uint(_1463) >> uint(2)));
            float _1467 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1465)]);
            float _1469 = _1435 * _1439;
            float _1471 = _1435 * _1445;
            float _1473 = _1429 * _1439;
            float _1475 = -_1469;
            float _1477 = fma(_1423, _1451, _1475);
            float _1479 = -_1471;
            float _1481 = fma(_1429, _1451, _1479);
            float _1483 = -_1473;
            float _1485 = fma(_1423, _1445, _1483);
            float _1487 = _1461 * _1477;
            float _1489 = -_1487;
            float _1491 = fma(_1455, _1481, _1489);
            float _1493 = fma(_1467, _1485, _1491);
            float _1495 = _1467 * _1429;
            float _1497 = _1461 * _1423;
            float _1499 = -_1495;
            float _1501 = fma(_1461, _1435, _1499);
            float _1503 = 1.0 / _1493;
            float _1505 = -_1497;
            float _1507 = fma(_1455, _1429, _1505);
            float _1509 = _1321 * _1503;
            float _1511 = _1319 * _1503;
            float _1513 = _1501 * _1509;
            float _1515 = _1507 * _1509;
            float _1517 = fma(_1481, _1511, _1513);
            float _1519 = fma(_1485, _1511, _1515);
            _1395 = _1517;
            _1397 = _1519;
        }
    }
    _1399 = false;
    float _1521 = _1395;
    float _1523 = _1397;
    float _1525 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[83]);
    float _1527 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[0]);
    float _1529 = _1255 * 2000.0;
    float _1531 = _1257 * 2000.0;
    float _1533 = _1249 + (-0.5);
    float _1535 = _1251 + (-0.5);
    float _1537 = _1301 * _1521;
    bool _1539 = _1531 >= _1529;
    bool _1541 = _1525 != 0.0;
    bool _1543 = isnan(_1525);
    bool _1545 = _1541 || _1543;
    bool _1547 = isnan(0.0);
    bool _1549 = _1545 || _1547;
    float _1551 = _1527 * 2.0;
    float _1553 = _1533 * _1551;
    float _1555 = _1535 * _1551;
    float _1557 = _1301 * _1523;
    float _1559 = _1523;
    float _1561 = _1553;
    float _1563 = _1555;
    int _1565 = _1549 ? (-1) : 0;
    float _1567 = _1533;
    float _1569 = _1531;
    float _1571 = _1525;
    float _1573 = _1557;
    if (!_1539)
    {
        _1559 = 0.0;
    }
    float _1575 = _1559;
    float _1577 = _1575;
    if (_1549)
    {
        float _1579 = _1553 * _1525;
        _1561 = _1579;
    }
    float _1581 = _1561;
    float _1583 = _1581;
    if (_1549)
    {
        float _1585 = _1555 * _1525;
        _1563 = _1585;
    }
    float _1587 = _1563;
    bool _1589 = !_1539;
    float _1591 = _1587;
    if (!_1589)
    {
        float2 _4521 = float2(_1241, _1243);
        float _1593 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_4521, float2(0.0), isnan(_4521)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_4521, float2(0.0), isnan(_4521)), level(0.0)).y;
        float _1595 = _1593 * 2000.0;
        bool _1597 = _1531 >= _1595;
        bool _1599 = !_1597;
        _1565 = _1597 ? (-1) : 0;
        _1567 = _1593;
        if (!_1599)
        {
            float _1601 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[2606]);
            float _1603 = precise::max(_1601, 0.001000000047497451305389404296875);
            float _1605 = -_1255;
            float _1607 = _1605 + _1257;
            float _1609 = 1.0 / _1603;
            float _1611 = _1607 * 2000.0;
            float _1613 = _1611 * _1609;
            float _1615 = precise::clamp(_1613, 0.0, 1.0);
            _1577 = _1615;
            _1567 = _1609;
            _1617 = true;
        }
        else
        {
            float _1619 = -_1257;
            float _1621 = _1619 + _1593;
            float _1623 = _1621 * 10000.0;
            float _1625 = precise::clamp(_1623, 0.0, 1.0);
            float _1627 = -_1625;
            float _1629 = _1627 + 1.0;
            _1577 = _1629;
        }
    }
    _1617 = false;
    float _1631 = _1577;
    int _1633 = _1565;
    float _1635 = _1567;
    float _1637 = _1581 * _1631;
    float _1639 = _1587 * _1631;
    bool _1641 = !_1305;
    int _1643 = _1633;
    float _1645 = _1639;
    float _1647 = _1637;
    if (!_1641)
    {
        float _1649 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _1651 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _1653 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _1655 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _1657 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _1659 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _1661 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _1663 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _1665 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _1667 = _1653 * _1655;
        float _1669 = _1653 * _1657;
        float _1671 = _1651 * _1655;
        float _1673 = -_1667;
        float _1675 = fma(_1649, _1659, _1673);
        float _1677 = -_1669;
        float _1679 = fma(_1651, _1659, _1677);
        float _1681 = _1663 * _1649;
        float _1683 = _1663 * _1675;
        float _1685 = -_1671;
        float _1687 = fma(_1649, _1657, _1685);
        float _1689 = -_1683;
        float _1691 = fma(_1661, _1679, _1689);
        float _1693 = -_1681;
        float _1695 = fma(_1661, _1651, _1693);
        float _1697 = fma(_1665, _1687, _1691);
        float _1699 = _1665 * _1651;
        float _1701 = 1.0 / _1697;
        float _1703 = -_1699;
        float _1705 = fma(_1663, _1653, _1703);
        float _1707 = _1639 * _1701;
        float _1709 = _1637 * _1701;
        float _1711 = _1705 * _1707;
        float _1713 = _1695 * _1707;
        float _1715 = fma(_1679, _1709, _1711);
        float _1717 = fma(_1687, _1709, _1713);
        _1569 = _1695;
        _1645 = _1717;
        _1591 = _1709;
        _1647 = _1715;
        _1571 = _1697;
        _1583 = _1687;
        _1719 = true;
    }
    else
    {
        int _1721 = as_type<int>(_1182) & 1024;
        bool _1723 = _1721 != 0;
        if (_1723)
        {
            _1643 = -1;
        }
        int _1725 = _1643;
        int _1727 = _1725;
        if (!_1723)
        {
            int _1729 = as_type<int>(_1182) & 2048;
            bool _1731 = _1729 != 0;
            _1727 = _1731 ? (-1) : 0;
        }
        int _1733 = _1727;
        int _1735 = ~_1733;
        if (!(_1735 != 0))
        {
            uint _1737 = uint(int(uint(_174) >> uint(2)));
            float _1739 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1737)]);
            int _1741 = _174 + 4;
            uint _1743 = uint(int(uint(_1741) >> uint(2)));
            float _1745 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1743)]);
            int _1747 = _174 + 8;
            uint _1749 = uint(int(uint(_1747) >> uint(2)));
            float _1751 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1749)]);
            uint _1753 = uint(int(uint(_174) >> uint(2)));
            float _1755 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1753)]);
            int _1757 = _174 + 4;
            uint _1759 = uint(int(uint(_1757) >> uint(2)));
            float _1761 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1759)]);
            int _1763 = _174 + 8;
            uint _1765 = uint(int(uint(_1763) >> uint(2)));
            float _1767 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1765)]);
            uint _1769 = uint(int(uint(_174) >> uint(2)));
            float _1771 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1769)]);
            int _1773 = _174 + 4;
            uint _1775 = uint(int(uint(_1773) >> uint(2)));
            float _1777 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1775)]);
            int _1779 = _174 + 8;
            uint _1781 = uint(int(uint(_1779) >> uint(2)));
            float _1783 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1781)]);
            float _1785 = _1751 * _1755;
            float _1787 = _1751 * _1761;
            float _1789 = _1745 * _1755;
            float _1791 = -_1785;
            float _1793 = fma(_1739, _1767, _1791);
            float _1795 = -_1787;
            float _1797 = fma(_1745, _1767, _1795);
            float _1799 = _1777 * _1739;
            float _1801 = _1777 * _1793;
            float _1803 = -_1789;
            float _1805 = fma(_1739, _1761, _1803);
            float _1807 = -_1801;
            float _1809 = fma(_1771, _1797, _1807);
            float _1811 = -_1799;
            float _1813 = fma(_1771, _1745, _1811);
            float _1815 = fma(_1783, _1805, _1809);
            float _1817 = _1783 * _1745;
            float _1819 = 1.0 / _1815;
            float _1821 = -_1817;
            float _1823 = fma(_1777, _1751, _1821);
            float _1825 = _1639 * _1819;
            float _1827 = _1637 * _1819;
            float _1829 = _1823 * _1825;
            float _1831 = _1813 * _1825;
            float _1833 = fma(_1797, _1827, _1829);
            float _1835 = fma(_1805, _1827, _1831);
            _1569 = _1813;
            _1645 = _1835;
            _1591 = _1827;
            _1647 = _1833;
            _1571 = _1815;
            _1583 = _1805;
        }
    }
    _1719 = false;
    float _1837 = _1569;
    float _1839 = _1645;
    float _1841 = _1591;
    float _1843 = _1647;
    float _1845 = _1571;
    float _1847 = _1583;
    bool _1849 = _1255 != 0.0;
    bool _1851 = isnan(_1255);
    bool _1853 = _1849 || _1851;
    bool _1855 = isnan(0.0);
    bool _1857 = _1853 || _1855;
    float _1859 = _1837;
    float _1861 = _1845;
    float _1863 = _1841;
    float _1865 = _1847;
    float _1867 = _1843;
    float _1869 = _1839;
    if (!_1857)
    {
        _1859 = 4.0;
    }
    float _1871 = _1859;
    int _1873 = as_type<int>(_1257);
    if (!_1857)
    {
        float2 _4947 = float2(_1241, _1243);
        float _1875 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_4947, float2(0.0), isnan(_4947)), level(_1871)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_4947, float2(0.0), isnan(_4947)), level(_1871)).y;
        _1873 = as_type<int>(_1875);
    }
    int _1877 = _1873;
    float _1879 = _1255;
    if (_1140)
    {
        float _1881 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
        _1879 = _1881;
    }
    float _1883 = _1879;
    float _1885 = _1635;
    if (!_1140)
    {
        float _1887 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[76]);
        _1885 = _1887;
    }
    float _1889 = _1885;
    if (_1140)
    {
        float _1891 = -_1148;
        float _1893 = _1891 + _1537;
        _1861 = _1893;
    }
    float _1895 = _1861;
    if (_1140)
    {
        float _1897 = -_1150;
        float _1899 = _1897 + _1557;
        _1573 = _1899;
    }
    float _1901 = _1573;
    float _1903 = _1901;
    if (_1140)
    {
        float _1905 = -_1150;
        float _1907 = _1905 + _1839;
        _1863 = _1907;
    }
    float _1909 = _1863;
    if (_1140)
    {
        float _1911 = fma(_1901, 0.5, _1909);
        _1903 = _1911;
    }
    float _1913 = _1903;
    int _1915 = _174 + 4;
    int _1917 = _174 + 8;
    float _1919 = _1883;
    if (_1140)
    {
        float _1921 = precise::max(_1883, 1.0);
        _1865 = _1921;
    }
    float _1923 = _1865;
    if (_1140)
    {
        float _1925 = -_1148;
        float _1927 = _1925 + _1843;
        _1919 = _1927;
    }
    float _1929 = _1919;
    int _1931 = _1877;
    float _1933 = _1929;
    if (!_1140)
    {
        float _1935 = fma(as_type<float>(_1877), 2000.0, _1889);
        _1931 = as_type<int>(_1935);
    }
    int _1937 = _1931;
    if (_1140)
    {
        float _1939 = fma(_1895, 0.5, _1929);
        _1933 = _1939;
    }
    float _1941 = _1933;
    float _1943 = _1923;
    if (_1140)
    {
        float _1945 = 1.0 / _1923;
        _1943 = _1945;
    }
    float _1947 = _1943;
    if (!_1140)
    {
        uint _1949 = uint(int(uint(_1915) >> uint(2)));
        (*spvDescriptorSet0.cp_s13)._m0[int(_1949)] = uint(_1937);
    }
    uint _1951 = uint(int(uint(_178) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1951)] = as_type<uint>(_232);
    uint _1953 = uint(int(uint(_174) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1953)] = as_type<uint>(_320);
    uint _1955 = uint(int(uint(_1915) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1955)] = as_type<uint>(_318);
    if (_1140)
    {
        float _1957 = fma(_1941, _1947, _1148);
        _1867 = _1957;
    }
    float _1959 = _1867;
    if (_1140)
    {
        float _1961 = fma(_1913, _1947, _1150);
        _1869 = _1961;
    }
    float _1963 = _1869;
    uint _1965 = uint(int(uint(_1917) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1965)] = as_type<uint>(_322);
    uint _1967 = uint(int(uint(_174) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_1967)] = as_type<uint>(_1959);
    uint _1969 = uint(int(uint(_1915) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_1969)] = as_type<uint>(_1146);
    uint _1971 = uint(int(uint(_1917) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_1971)] = as_type<uint>(_1963);
    uint _1973 = uint(int(uint(_174) >> uint(2)));
    (*spvDescriptorSet0.cp_s5)._m0[int(_1973)] = as_type<uint>(_314);
    uint _1975 = uint(int(uint(_1915) >> uint(2)));
    (*spvDescriptorSet0.cp_s5)._m0[int(_1975)] = as_type<uint>(_312);
    uint _1977 = uint(int(uint(_1917) >> uint(2)));
    (*spvDescriptorSet0.cp_s5)._m0[int(_1977)] = as_type<uint>(_316);
    float _1979 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _1981 = _312 * _312;
    float _1983 = _1146 * _1146;
    float _1985 = fma(_314, _314, _1981);
    float _1987 = fma(_1959, _1959, _1983);
    float _1989 = fma(_316, _316, _1985);
    float _1991 = fma(_1963, _1963, _1987);
    float _1993 = sqrt(_1991);
    float _1995 = sqrt(_1989);
    bool _1997 = _1995 >= 9.9999999747524270787835121154785e-07;
    bool _1999 = isnan(_1995);
    bool _2001 = _1997 || _1999;
    bool _2003 = isnan(9.9999999747524270787835121154785e-07);
    bool _2005 = _2001 || _2003;
    float _2007 = _1995;
    int _2023;
    if (!_2005)
    {
        bool _2009 = _958 != _224;
        bool _2011 = isnan(_958);
        bool _2013 = _2009 || _2011;
        bool _2015 = isnan(_224);
        bool _2017 = _2013 || _2015;
        if (_2017)
        {
            _344 = as_type<int>(_398);
        }
        int _2019 = _344;
        int _2021 = _2019;
        _2023 = _2019;
        _2025 = _2017;
        if (!_2025)
        {
            float _2027 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
            bool _2029 = _2027 > 0.0;
            bool _2031 = !_2029;
            if (!_2031)
            {
                float _2033 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
                float _2035 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
                float _2037 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
                float _2039 = _2035 * _2035;
                float _2041 = fma(_2033, _2033, _2039);
                float _2043 = fma(_2037, _2037, _2041);
                float _2045 = rsqrt(_2043);
                float _2047 = _2045 * 9.9999999747524270787835121154785e-07;
                float _2049 = _2033 * _2047;
                float _2051 = _2035 * _2047;
                float _2053 = _2037 * _2047;
                _2023 = as_type<int>(_2049);
                _464 = as_type<int>(_2051);
                _466 = as_type<int>(_2053);
                _2025 = true;
            }
            else
            {
                bool _2055 = _1993 >= 9.9999999747524270787835121154785e-07;
                bool _2057 = isnan(_1993);
                bool _2059 = _2055 || _2057;
                bool _2061 = isnan(9.9999999747524270787835121154785e-07);
                bool _2063 = _2059 || _2061;
                if (!_2063)
                {
                    float _2065 = _318 * _318;
                    float _2067 = fma(_320, _320, _2065);
                    float _2069 = fma(_322, _322, _2067);
                    float _2071 = sqrt(_2069);
                    bool _2073 = _2071 >= 9.9999999747524270787835121154785e-07;
                    bool _2075 = isnan(_2071);
                    bool _2077 = _2073 || _2075;
                    bool _2079 = isnan(9.9999999747524270787835121154785e-07);
                    bool _2081 = _2077 || _2079;
                    int _2083 = as_type<int>(_410);
                    int _2085 = as_type<int>(_2071);
                    if (_2081)
                    {
                        float _2087 = rsqrt(_2069);
                        _2083 = as_type<int>(_2087);
                    }
                    int _2089 = _2083;
                    if (!_2081)
                    {
                        _2021 = 0;
                    }
                    int _2091 = _2021;
                    int _2093 = _2091;
                    if (!_2081)
                    {
                        _2085 = 897988541;
                    }
                    int _2095 = _2085;
                    int _2097 = _2089;
                    int _2099 = _2095;
                    if (_2081)
                    {
                        float _2101 = as_type<float>(_2089) * 9.9999999747524270787835121154785e-07;
                        _2007 = _2101;
                    }
                    float _2103 = _2007;
                    if (!_2081)
                    {
                        _2097 = 0;
                    }
                    int _2105 = _2097;
                    int _2107 = _2105;
                    if (_2081)
                    {
                        float _2109 = _320 * _2103;
                        _2093 = as_type<int>(_2109);
                    }
                    int _2111 = _2093;
                    _2023 = _2111;
                    if (_2081)
                    {
                        float _2113 = _318 * _2103;
                        _2099 = as_type<int>(_2113);
                    }
                    int _2115 = _2099;
                    _464 = _2115;
                    if (_2081)
                    {
                        float _2117 = _322 * _2103;
                        _2107 = as_type<int>(_2117);
                    }
                    int _2119 = _2107;
                    _466 = _2119;
                    _2025 = true;
                }
                else
                {
                    float _2121 = rsqrt(_1991);
                    float _2123 = _2121 * 9.9999999747524270787835121154785e-07;
                    float _2125 = _1959 * _2123;
                    float _2127 = _1146 * _2123;
                    float _2129 = _1963 * _2123;
                    _2023 = as_type<int>(_2125);
                    _464 = as_type<int>(_2127);
                    _466 = as_type<int>(_2129);
                    _2025 = true;
                }
            }
        }
    }
    else
    {
        float _2131 = _1993 * _1979;
        bool _2133 = _2131 >= 0.001000000047497451305389404296875;
        bool _2135 = isnan(_2131);
        bool _2137 = _2133 || _2135;
        bool _2139 = isnan(0.001000000047497451305389404296875);
        bool _2141 = _2137 || _2139;
        bool _2143 = _2131 > 0.0;
        bool _2145 = !_2141;
        bool _2147 = _2143 && _2145;
        bool _2149 = _1995 < 0.001000000047497451305389404296875;
        bool _2151 = _2149 && _2147;
        if (!_2151)
        {
            _460 = as_type<int>(_312);
        }
        int _2153 = _460;
        int _2155 = _2153;
        if (_2151)
        {
            float _2157 = _1979 * _1959;
            _346 = as_type<int>(_2157);
        }
        int _2159 = _346;
        _2023 = _2159;
        if (!_2151)
        {
            _462 = as_type<int>(_316);
        }
        int _2161 = _462;
        _466 = _2161;
        if (_2151)
        {
            float _2163 = _1146 * _1979;
            _2155 = as_type<int>(_2163);
        }
        int _2165 = _2155;
        _464 = _2165;
        if (_2151)
        {
            float _2167 = _1979 * _1963;
            _466 = as_type<int>(_2167);
        }
    }
    _2025 = false;
    int _2169 = _2023;
    int _2171 = _464;
    int _2173 = _466;
    uint _2175 = uint(int(uint(_174) >> uint(2)));
    (*spvDescriptorSet0.cp_s5)._m0[int(_2175)] = uint(_2169);
    uint _2177 = uint(int(uint(_1915) >> uint(2)));
    (*spvDescriptorSet0.cp_s5)._m0[int(_2177)] = uint(_2171);
    uint _2179 = uint(int(uint(_1917) >> uint(2)));
    (*spvDescriptorSet0.cp_s5)._m0[int(_2179)] = uint(_2173);
}

