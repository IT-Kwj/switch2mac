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
    device _21* cp_s12 [[id(12)]];
    device _21* cp_s13 [[id(13)]];
    device _21* cp_s14 [[id(14)]];
    texture2d<float> cp_t_tcb_26 [[id(15)]];
    sampler cp_t_tcb_26Smplr [[id(16)]];
    texture2d<float> cp_t_tcb_1A [[id(17)]];
    sampler cp_t_tcb_1ASmplr [[id(18)]];
    texture2d<float> cp_t_tcb_2C [[id(19)]];
    sampler cp_t_tcb_2CSmplr [[id(20)]];
    texture2d<float> cp_t_tcb_2A [[id(21)]];
    sampler cp_t_tcb_2ASmplr [[id(22)]];
    sampler cp_t_tcb_1ASmplr_w [[id(23)]];
    sampler cp_t_tcb_2CSmplr_w [[id(24)]];
    sampler cp_t_tcb_2ASmplr_w [[id(25)]];
    constant dm_border_t* dm_border [[id(26)]];
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]])
{
    bool _1497 = false;
    bool _1195 = false;
    bool _1099 = false;
    bool _901 = false;
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
    float _164 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[30]);
    int _166 = _85 << 4;
    float _168 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[114]);
    int _170 = _166 + 12;
    float _172 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[112]);
    float _174 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    uint _176 = uint(int(uint(_170) >> uint(2)));
    float _178 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_176)]);
    uint _180 = uint(int(uint(_166) >> uint(2)));
    float _182 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_180)]);
    int _184 = _166 + 4;
    uint _186 = uint(int(uint(_184) >> uint(2)));
    float _188 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_186)]);
    int _190 = _166 + 8;
    uint _192 = uint(int(uint(_190) >> uint(2)));
    float _194 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_192)]);
    uint _196 = uint(int(uint(_166) >> uint(2)));
    float _198 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_196)]);
    int _200 = _166 + 4;
    uint _202 = uint(int(uint(_200) >> uint(2)));
    float _204 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_202)]);
    int _206 = _166 + 8;
    uint _208 = uint(int(uint(_206) >> uint(2)));
    float _210 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_208)]);
    float _212 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[116]);
    float _214 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[118]);
    int _216 = as_type<int>(_164) & 512;
    bool _218 = _216 != 0;
    int _220 = as_type<int>(_164) & 1024;
    bool _222 = _220 != 0;
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
    int _248 = as_type<int>(_164) & 2048;
    bool _250 = _248 != 0;
    float _252 = 0.0;
    float _254 = 0.0;
    float _256 = 0.0;
    float _258 = 0.0;
    if (_218)
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
    float _276 = 0.0;
    float _278 = 0.0;
    float _280 = 0.0;
    if (_222)
    {
        uint _282 = uint(int(uint(_166) >> uint(2)));
        float _284 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_282)]);
        int _286 = _166 + 4;
        uint _288 = uint(int(uint(_286) >> uint(2)));
        float _290 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_288)]);
        int _292 = _166 + 8;
        uint _294 = uint(int(uint(_292) >> uint(2)));
        float _296 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_294)]);
        _276 = _284;
        _278 = _290;
        _280 = _296;
    }
    float _298 = _276;
    float _300 = _278;
    float _302 = _280;
    float _304 = 0.0;
    float _306 = 0.0;
    float _308 = 0.0;
    if (_222)
    {
        uint _310 = uint(int(uint(_166) >> uint(2)));
        float _312 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_310)]);
        int _314 = _166 + 4;
        uint _316 = uint(int(uint(_314) >> uint(2)));
        float _318 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_316)]);
        int _320 = _166 + 8;
        uint _322 = uint(int(uint(_320) >> uint(2)));
        float _324 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_322)]);
        _304 = _312;
        _306 = _318;
        _308 = _324;
    }
    float _326 = _304;
    float _328 = _306;
    float _330 = _308;
    float _332 = 0.0;
    float _334 = 0.0;
    float _336 = 0.0;
    float _338 = 0.0;
    if (_250)
    {
        uint _340 = uint(int(uint(_166) >> uint(2)));
        float _342 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_340)]);
        int _344 = _166 + 4;
        uint _346 = uint(int(uint(_344) >> uint(2)));
        float _348 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_346)]);
        int _350 = _166 + 8;
        uint _352 = uint(int(uint(_350) >> uint(2)));
        float _354 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_352)]);
        int _356 = _166 + 12;
        uint _358 = uint(int(uint(_356) >> uint(2)));
        float _360 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_358)]);
        _332 = _342;
        _334 = _348;
        _336 = _354;
        _338 = _360;
    }
    float _362 = _332;
    float _364 = _334;
    float _366 = _336;
    float _368 = _338;
    float _370 = 0.0;
    float _372 = 0.0;
    float _374 = 0.0;
    float _376 = 0.0;
    if (_250)
    {
        uint _378 = uint(int(uint(_166) >> uint(2)));
        float _380 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_378)]);
        int _382 = _166 + 4;
        uint _384 = uint(int(uint(_382) >> uint(2)));
        float _386 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_384)]);
        int _388 = _166 + 8;
        uint _390 = uint(int(uint(_388) >> uint(2)));
        float _392 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_390)]);
        int _394 = _166 + 12;
        uint _396 = uint(int(uint(_394) >> uint(2)));
        float _398 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_396)]);
        _370 = _380;
        _372 = _386;
        _374 = _392;
        _376 = _398;
    }
    float _400 = _370;
    float _402 = _372;
    float _404 = _374;
    float _406 = _376;
    float _408 = 0.0;
    if (_222)
    {
        float _410 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        _408 = _410;
    }
    float _412 = _408;
    float _414 = 0.0;
    if (_222)
    {
        float _416 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        _414 = _416;
    }
    float _418 = _414;
    float _420 = _168 * _168;
    float _422 = fma(_172, _172, _420);
    float _424 = _178 * _174;
    float _426 = rsqrt(_422);
    float _428 = _182 * _424;
    float _430 = fma(_188, _424, _204);
    float _432 = _198 + _428;
    float _434 = _194 * _424;
    float _436 = _210 + _434;
    float _438 = 0.0;
    float _440 = _198;
    float _442 = _210;
    float _444 = _172;
    float _446 = _430;
    int _448 = as_type<int>(_428);
    int _450 = as_type<int>(_428);
    if (!_218)
    {
        _438 = 0.0;
    }
    float _452 = _438;
    float _454 = _270;
    float _456 = _452;
    float _458 = _268;
    float _460 = _328;
    float _462 = _402;
    float _464 = _404;
    if (_218)
    {
        float _466 = _430 * _242;
        _440 = _466;
    }
    float _468 = _440;
    float _470 = _468;
    if (_218)
    {
        float _472 = fma(_432, _240, _468);
        _470 = _472;
    }
    float _474 = _470;
    float _476 = _426 * (-20.0);
    float _478 = fma(_172, _476, _212);
    float _480 = fma(_168, _476, _214);
    float _482 = _474;
    if (_218)
    {
        float _484 = fma(_436, _244, _474);
        _482 = _484;
    }
    float _486 = _482;
    float _488 = _478 * 0.5;
    float _490 = _480 * 0.5;
    float _492 = _486;
    if (_218)
    {
        float _494 = _430 * _270;
        _454 = _494;
    }
    float _496 = _454;
    if (_218)
    {
        float _498 = _246 + _486;
        _456 = _498;
    }
    float _500 = _456;
    float _502 = _500;
    if (_222)
    {
        float _504 = _430 * _300;
        _492 = _504;
    }
    float _506 = _492;
    float _508 = _506;
    if (_222)
    {
        float _510 = _430 * _328;
        _442 = _510;
    }
    float _512 = _442;
    float _514 = floor(_488);
    float _516 = _512;
    if (_218)
    {
        float _518 = fma(_432, _268, _496);
        _458 = _518;
    }
    float _520 = _458;
    float _522 = _520;
    if (_222)
    {
        float _524 = fma(_432, _298, _506);
        _508 = _524;
    }
    float _526 = _508;
    float _528 = _526;
    if (_222)
    {
        float _530 = fma(_432, _326, _512);
        _460 = _530;
    }
    float _532 = _460;
    float _534 = _532;
    if (_250)
    {
        float _536 = _430 * _364;
        _516 = _536;
    }
    float _538 = _516;
    float _540 = floor(_490);
    float _542 = _538;
    if (_218)
    {
        float _544 = fma(_436, _272, _520);
        _522 = _544;
    }
    float _546 = _522;
    if (_250)
    {
        float _548 = _430 * _402;
        _462 = _548;
    }
    float _550 = _462;
    float _552 = _550;
    if (_222)
    {
        float _554 = fma(_436, _302, _526);
        _528 = _554;
    }
    float _556 = _528;
    if (!_218)
    {
        _444 = 0.0;
    }
    float _558 = _444;
    float _560 = _558;
    if (_218)
    {
        float _562 = _274 + _546;
        _560 = _562;
    }
    float _564 = _560;
    float _566 = _564;
    if (_250)
    {
        float _568 = fma(_432, _362, _538);
        _542 = _568;
    }
    float _570 = _542;
    float _572 = _570;
    if (_250)
    {
        float _574 = fma(_432, _400, _550);
        _552 = _574;
    }
    float _576 = _552;
    if (_222)
    {
        float _578 = _412 + _556;
        _566 = _578;
    }
    float _580 = _566;
    float _582 = _580;
    if (_222)
    {
        float _584 = fma(_436, _330, _532);
        _534 = _584;
    }
    float _586 = _534;
    if (_250)
    {
        float _588 = fma(_436, _366, _570);
        _572 = _588;
    }
    float _590 = _572;
    if (_250)
    {
        float _592 = fma(_436, _404, _576);
        _464 = _592;
    }
    float _594 = _464;
    if (_222)
    {
        float _596 = _418 + _586;
        _502 = _596;
    }
    float _598 = _502;
    float _600 = fma(_514, 2.0, -32.0);
    float _602 = fma(_540, 2.0, -32.0);
    float _604 = _598;
    if (_250)
    {
        float _606 = _368 + _590;
        _604 = _606;
    }
    float _608 = _604;
    if (_250)
    {
        float _610 = _406 + _594;
        _582 = _610;
    }
    float _612 = _582;
    float _614 = -_600;
    float _616 = _614 + _608;
    float _618 = -_602;
    float _620 = _618 + _612;
    float _622 = _616 * 0.015625;
    float _624 = _620 * 0.015625;
    float _626 = fma(_608, 6.2500002968590706586837768554688e-05, 0.5);
    float _628 = fma(_612, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _2469 = float2(_622, _624);
    float4 _631 = spvDescriptorSet0.cp_t_tcb_26.gather(spvDescriptorSet0.cp_t_tcb_26Smplr, select(_2469, float2(0.0), isnan(_2469)), int2(0), component::x).xyzw;
    float _633 = _631.x;
    float _635 = _631.y;
    float _637 = _631.z;
    float _639 = _631.w;
    float2 _2487 = float2(_622, _624);
    float4 _641 = spvDescriptorSet0.cp_t_tcb_26.gather(spvDescriptorSet0.cp_t_tcb_26Smplr, select(_2487, float2(0.0), isnan(_2487)), int2(0), component::y).xyzw;
    float _643 = _641.x;
    float _645 = _641.y;
    float _647 = _641.z;
    float _649 = _641.w;
    float2 _2503 = float2(_626, _628);
    float2 _653 = dm_bs(spvDescriptorSet0.cp_t_tcb_1A.sample(spvDescriptorSet0.cp_t_tcb_1ASmplr, select(_2503, float2(0.0), isnan(_2503)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_1A, spvDescriptorSet0.cp_t_tcb_1ASmplr_w, select(_2503, float2(0.0), isnan(_2503)), level(0.0)).xy;
    float _655 = _653.x;
    float _657 = _653.y;
    float2 _2515 = float2(_626, _628);
    float2 _659 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_2515, float2(0.0), isnan(_2515)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_2515, float2(0.0), isnan(_2515)), level(0.0)).xy;
    float _661 = _659.x;
    float _663 = _659.y;
    float _665 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[68]);
    float _667 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
    float _669 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[73]);
    float _671 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
    float _673 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[74]);
    uint _675 = uint(int(uint(_170) >> uint(2)));
    float _677 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_675)]);
    float _679 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
    float _681 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
    float _683 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
    float _685 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[72]);
    uint _687 = uint(int(uint(_166) >> uint(2)));
    float _689 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_687)]);
    uint _691 = uint(int(uint(_166) >> uint(2)));
    float _693 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_691)]);
    int _695 = _166 + 4;
    uint _697 = uint(int(uint(_695) >> uint(2)));
    float _699 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_697)]);
    int _701 = _166 + 8;
    uint _703 = uint(int(uint(_701) >> uint(2)));
    float _705 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_703)]);
    int _707 = _166 + 12;
    uint _709 = uint(int(uint(_707) >> uint(2)));
    float _711 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_709)]);
    uint _713 = uint(int(uint(_170) >> uint(2)));
    float _715 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_713)]);
    float _717 = abs(_665);
    float _719 = log2(_717);
    bool _721 = _673 > 0.0;
    float _723 = _174 * _719;
    bool _725 = _669 > 0.0;
    float _727 = exp2(_723);
    float _729 = 0.0;
    float _731 = _669;
    float _733 = _683;
    float _735 = _665;
    int _737 = as_type<int>(_628);
    if (_721)
    {
        float _739 = 1.0 / _673;
        _729 = _739;
    }
    float _741 = _729;
    float _743 = _174 * _667;
    float _745 = -_677;
    float _747 = _671 + _745;
    float _749 = _633 + _635;
    float _751 = _643 + _645;
    float _753 = _679 * _743;
    float _755 = _681 * _743;
    float _757 = _683 * _743;
    float _759 = _753;
    float _761 = _757;
    float _763 = _711;
    int _765 = as_type<int>(_699);
    int _767 = as_type<int>(_705);
    int _769 = as_type<int>(_699);
    int _771 = as_type<int>(_705);
    int _773 = as_type<int>(_699);
    int _775 = as_type<int>(_705);
    if (_725)
    {
        float _777 = _685 * _669;
        _731 = _777;
    }
    float _779 = _731;
    float _781 = _637 + _749;
    float _783 = _647 + _751;
    float _785 = fma(_182, _727, _753);
    if (_721)
    {
        float _787 = _747 * _741;
        _733 = _787;
    }
    float _789 = _733;
    if (!_725)
    {
        _735 = _685;
    }
    float _791 = _735;
    float _793 = _791;
    if (_725)
    {
        float _795 = -_779;
        float _797 = fma(_689, _795, _685);
        _793 = _797;
    }
    float _799 = _793;
    float _801 = _639 + _781;
    float _803 = _649 + _783;
    float _805 = _799;
    if (_721)
    {
        float _807 = precise::min(_789, 1.0);
        _759 = _807;
    }
    float _809 = _759;
    float _811 = fma(_188, _727, _755);
    float _813 = fma(_194, _727, _757);
    float _815 = _801 * 0.25;
    float _817 = _803 * 0.25;
    float _819 = _811;
    if (_721)
    {
        float _821 = _809 * _799;
        _805 = _821;
    }
    float _823 = _805;
    bool _825 = !_218;
    float _897;
    float _899;
    if (!_825)
    {
        float _827 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _829 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _831 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _833 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _835 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _837 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _839 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _841 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _843 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _845 = _831 * _833;
        float _847 = _831 * _835;
        float _849 = _829 * _833;
        float _851 = -_845;
        float _853 = fma(_827, _837, _851);
        float _855 = -_847;
        float _857 = fma(_829, _837, _855);
        float _859 = -_849;
        float _861 = fma(_827, _835, _859);
        float _863 = _829 * _843;
        float _865 = _853 * _841;
        float _867 = _827 * _841;
        float _869 = -_863;
        float _871 = fma(_831, _841, _869);
        float _873 = -_865;
        float _875 = fma(_857, _839, _873);
        float _877 = -_867;
        float _879 = fma(_829, _839, _877);
        float _881 = fma(_861, _843, _875);
        float _883 = 1.0 / _881;
        float _885 = _817 * _883;
        float _887 = _815 * _883;
        float _889 = _871 * _885;
        float _891 = _879 * _885;
        float _893 = fma(_857, _887, _889);
        float _895 = fma(_861, _887, _891);
        _897 = _895;
        _899 = _893;
        _901 = true;
    }
    else
    {
        bool _903 = _220 != 0;
        bool _905 = _248 != 0;
        bool _907 = _905 || _903;
        if (!_907)
        {
            _761 = _815;
        }
        float _909 = _761;
        _899 = _909;
        if (!_907)
        {
            _763 = _817;
        }
        float _911 = _763;
        bool _913 = !_907;
        _897 = _911;
        if (!_913)
        {
            uint _915 = uint(int(uint(_166) >> uint(2)));
            float _917 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_915)]);
            int _919 = _166 + 4;
            uint _921 = uint(int(uint(_919) >> uint(2)));
            float _923 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_921)]);
            int _925 = _166 + 8;
            uint _927 = uint(int(uint(_925) >> uint(2)));
            float _929 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_927)]);
            uint _931 = uint(int(uint(_166) >> uint(2)));
            float _933 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_931)]);
            int _935 = _166 + 4;
            uint _937 = uint(int(uint(_935) >> uint(2)));
            float _939 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_937)]);
            int _941 = _166 + 8;
            uint _943 = uint(int(uint(_941) >> uint(2)));
            float _945 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_943)]);
            uint _947 = uint(int(uint(_166) >> uint(2)));
            float _949 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_947)]);
            int _951 = _166 + 4;
            uint _953 = uint(int(uint(_951) >> uint(2)));
            float _955 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_953)]);
            int _957 = _166 + 8;
            uint _959 = uint(int(uint(_957) >> uint(2)));
            float _961 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_959)]);
            float _963 = _929 * _933;
            float _965 = _929 * _939;
            float _967 = _923 * _933;
            float _969 = -_963;
            float _971 = fma(_917, _945, _969);
            float _973 = -_965;
            float _975 = fma(_923, _945, _973);
            float _977 = -_967;
            float _979 = fma(_917, _939, _977);
            float _981 = _923 * _961;
            float _983 = _971 * _955;
            float _985 = _917 * _955;
            float _987 = -_981;
            float _989 = fma(_929, _955, _987);
            float _991 = -_983;
            float _993 = fma(_975, _949, _991);
            float _995 = -_985;
            float _997 = fma(_923, _949, _995);
            float _999 = fma(_979, _961, _993);
            float _1001 = 1.0 / _999;
            float _1003 = _817 * _1001;
            float _1005 = _815 * _1001;
            float _1007 = _989 * _1003;
            float _1009 = _997 * _1003;
            float _1011 = fma(_975, _1005, _1007);
            float _1013 = fma(_979, _1005, _1009);
            _897 = _1013;
            _899 = _1011;
        }
    }
    _901 = false;
    float _1015 = _897;
    float _1017 = _899;
    float _1019 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[83]);
    float _1021 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[0]);
    float _1023 = _661 * 2000.0;
    float _1025 = _663 * 2000.0;
    float _1027 = _655 + (-0.5);
    float _1029 = _657 + (-0.5);
    float _1031 = _823 * _1015;
    bool _1033 = _1025 >= _1023;
    float _1035 = _823 * _1017;
    float _1037 = _1015;
    if (!_1033)
    {
        _1037 = 0.0;
    }
    float _1039 = _1037;
    bool _1041 = _1019 != 0.0;
    bool _1043 = isnan(_1019);
    bool _1045 = _1041 || _1043;
    bool _1047 = isnan(0.0);
    bool _1049 = _1045 || _1047;
    float _1051 = _1021 * 2.0;
    float _1053 = _1027 * _1051;
    float _1055 = _1029 * _1051;
    float _1057 = _1053;
    float _1059 = _1055;
    float _1061 = _1039;
    if (_1049)
    {
        float _1063 = _1053 * _1019;
        _1057 = _1063;
    }
    float _1065 = _1057;
    if (_1049)
    {
        float _1067 = _1055 * _1019;
        _1059 = _1067;
    }
    float _1069 = _1059;
    bool _1071 = !_1033;
    float _1073 = _1069;
    if (!_1071)
    {
        float2 _3159 = float2(_626, _628);
        float _1075 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_3159, float2(0.0), isnan(_3159)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_3159, float2(0.0), isnan(_3159)), level(0.0)).y;
        float _1077 = _1075 * 2000.0;
        bool _1079 = _1025 >= _1077;
        bool _1081 = !_1079;
        if (!_1081)
        {
            float _1083 = as_type<float>((*spvDescriptorSet0.cp_s13)._m0[2606]);
            float _1085 = precise::max(_1083, 0.001000000047497451305389404296875);
            float _1087 = -_661;
            float _1089 = _1087 + _663;
            float _1091 = 1.0 / _1085;
            float _1093 = _1089 * 2000.0;
            float _1095 = _1093 * _1091;
            float _1097 = precise::clamp(_1095, 0.0, 1.0);
            _1061 = _1097;
            _1099 = true;
        }
        else
        {
            float _1101 = -_663;
            float _1103 = _1101 + _1075;
            float _1105 = _1103 * 10000.0;
            float _1107 = precise::clamp(_1105, 0.0, 1.0);
            float _1109 = -_1107;
            float _1111 = _1109 + 1.0;
            _1061 = _1111;
        }
    }
    _1099 = false;
    float _1113 = _1061;
    float _1115 = _1065 * _1113;
    float _1117 = _1069 * _1113;
    bool _1119 = !_218;
    float _1121 = _1115;
    float _1123 = _1117;
    if (!_1119)
    {
        float _1125 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _1127 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _1129 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _1131 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _1133 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _1135 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _1137 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _1139 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _1141 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _1143 = _1129 * _1131;
        float _1145 = _1129 * _1133;
        float _1147 = _1127 * _1131;
        float _1149 = -_1143;
        float _1151 = fma(_1125, _1135, _1149);
        float _1153 = -_1145;
        float _1155 = fma(_1127, _1135, _1153);
        float _1157 = _1127 * _1141;
        float _1159 = _1151 * _1139;
        float _1161 = -_1147;
        float _1163 = fma(_1125, _1133, _1161);
        float _1165 = _1125 * _1139;
        float _1167 = -_1157;
        float _1169 = fma(_1129, _1139, _1167);
        float _1171 = -_1159;
        float _1173 = fma(_1155, _1137, _1171);
        float _1175 = -_1165;
        float _1177 = fma(_1127, _1137, _1175);
        float _1179 = fma(_1163, _1141, _1173);
        float _1181 = 1.0 / _1179;
        float _1183 = _1117 * _1181;
        float _1185 = _1115 * _1181;
        float _1187 = _1169 * _1183;
        float _1189 = _1177 * _1183;
        float _1191 = fma(_1155, _1185, _1187);
        float _1193 = fma(_1163, _1185, _1189);
        _1073 = _1185;
        _1121 = _1191;
        _1123 = _1193;
        _1195 = true;
    }
    else
    {
        bool _1197 = _220 != 0;
        bool _1199 = _248 != 0;
        bool _1201 = _1199 || _1197;
        bool _1203 = !_1201;
        if (!_1203)
        {
            uint _1205 = uint(int(uint(_166) >> uint(2)));
            float _1207 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1205)]);
            int _1209 = _166 + 4;
            uint _1211 = uint(int(uint(_1209) >> uint(2)));
            float _1213 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1211)]);
            int _1215 = _166 + 8;
            uint _1217 = uint(int(uint(_1215) >> uint(2)));
            float _1219 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1217)]);
            uint _1221 = uint(int(uint(_166) >> uint(2)));
            float _1223 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_1221)]);
            int _1225 = _166 + 4;
            uint _1227 = uint(int(uint(_1225) >> uint(2)));
            float _1229 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_1227)]);
            int _1231 = _166 + 8;
            uint _1233 = uint(int(uint(_1231) >> uint(2)));
            float _1235 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_1233)]);
            uint _1237 = uint(int(uint(_166) >> uint(2)));
            float _1239 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1237)]);
            int _1241 = _166 + 4;
            uint _1243 = uint(int(uint(_1241) >> uint(2)));
            float _1245 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1243)]);
            int _1247 = _166 + 8;
            uint _1249 = uint(int(uint(_1247) >> uint(2)));
            float _1251 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1249)]);
            float _1253 = _1219 * _1223;
            float _1255 = _1219 * _1229;
            float _1257 = _1213 * _1223;
            float _1259 = -_1253;
            float _1261 = fma(_1207, _1235, _1259);
            float _1263 = -_1255;
            float _1265 = fma(_1213, _1235, _1263);
            float _1267 = _1213 * _1251;
            float _1269 = _1261 * _1245;
            float _1271 = -_1257;
            float _1273 = fma(_1207, _1229, _1271);
            float _1275 = _1207 * _1245;
            float _1277 = -_1267;
            float _1279 = fma(_1219, _1245, _1277);
            float _1281 = -_1269;
            float _1283 = fma(_1265, _1239, _1281);
            float _1285 = -_1275;
            float _1287 = fma(_1213, _1239, _1285);
            float _1289 = fma(_1273, _1251, _1283);
            float _1291 = 1.0 / _1289;
            float _1293 = _1117 * _1291;
            float _1295 = _1115 * _1291;
            float _1297 = _1279 * _1293;
            float _1299 = _1287 * _1293;
            float _1301 = fma(_1265, _1295, _1297);
            float _1303 = fma(_1273, _1295, _1299);
            _1073 = _1295;
            _1121 = _1301;
            _1123 = _1303;
        }
    }
    _1195 = false;
    float _1305 = _1073;
    float _1307 = _1121;
    float _1309 = _1123;
    bool _1311 = _661 != 0.0;
    bool _1313 = isnan(_661);
    bool _1315 = _1311 || _1313;
    bool _1317 = isnan(0.0);
    bool _1319 = _1315 || _1317;
    float _1321 = _1305;
    float _1323 = _1307;
    float _1325 = _1309;
    if (!_1319)
    {
        _1321 = 4.0;
    }
    float _1327 = _1321;
    float _1329 = _663;
    if (!_1319)
    {
        float2 _3550 = float2(_626, _628);
        float _1331 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_3550, float2(0.0), isnan(_3550)), level(_1327)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_3550, float2(0.0), isnan(_3550)), level(_1327)).y;
        _1329 = _1331;
    }
    float _1333 = _1329;
    float _1335 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[76]);
    bool _1337 = _747 > 0.001000000047497451305389404296875;
    bool _1339 = isnan(_747);
    bool _1341 = _1337 || _1339;
    bool _1343 = isnan(0.001000000047497451305389404296875);
    bool _1345 = _1341 || _1343;
    bool _1347 = !_1345;
    if (!_1347)
    {
        float _1349 = precise::max(_174, 1.0);
        float _1351 = -_785;
        float _1353 = _1351 + _1307;
        float _1355 = -_813;
        float _1357 = _1355 + _1309;
        float _1359 = -_785;
        float _1361 = _1359 + _1035;
        float _1363 = -_813;
        float _1365 = _1363 + _1031;
        float _1367 = 1.0 / _1349;
        float _1369 = fma(_1361, 0.5, _1353);
        float _1371 = fma(_1365, 0.5, _1357);
        float _1373 = fma(_1369, _1367, _785);
        float _1375 = fma(_1371, _1367, _813);
        _737 = as_type<int>(_1367);
        _1323 = _1373;
        _1325 = _1375;
    }
    int _1377 = _737;
    float _1379 = _1323;
    float _1381 = _1325;
    int _1383 = _166 + 4;
    float _1385 = fma(_1333, 2000.0, _1335);
    uint _1387 = uint(int(uint(_1383) >> uint(2)));
    (*spvDescriptorSet0.cp_s14)._m0[int(_1387)] = as_type<uint>(_1385);
    float _1389 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[76]);
    float _1391 = _430 + _1385;
    float _1393 = fma(_1333, 2000.0, _1389);
    bool _1395 = _1391 >= _1393;
    bool _1397 = isnan(_1391);
    bool _1399 = _1395 || _1397;
    bool _1401 = isnan(_1393);
    bool _1403 = _1399 || _1401;
    float _1405 = _1393;
    int _1407 = _1377;
    if (!_1403)
    {
        float _1409 = -_1385;
        float _1411 = _1409 + _1393;
        _1405 = _1411;
    }
    float _1413 = _1405;
    if (!_1403)
    {
        float _1415 = _430 * 0.9900000095367431640625;
        _446 = _1415;
    }
    float _1417 = _446;
    if (!_1403)
    {
        _819 = 0.0;
    }
    float _1419 = _819;
    if (!_1403)
    {
        float _1421 = fma(_1413, 0.00999999977648258209228515625, _1385);
        _1407 = as_type<int>(_1421);
    }
    int _1423 = _1407;
    int _1425 = _166 + 8;
    float _1427 = -_204;
    float _1429 = _1427 + _1417;
    if (!_1403)
    {
        uint _1431 = uint(int(uint(_1383) >> uint(2)));
        (*spvDescriptorSet0.cp_s14)._m0[int(_1431)] = uint(_1423);
    }
    uint _1433 = uint(int(uint(_170) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1433)] = as_type<uint>(_715);
    uint _1435 = uint(int(uint(_166) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1435)] = as_type<uint>(_432);
    uint _1437 = uint(int(uint(_1383) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1437)] = as_type<uint>(_1417);
    uint _1439 = uint(int(uint(_1425) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1439)] = as_type<uint>(_436);
    uint _1441 = uint(int(uint(_166) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_1441)] = as_type<uint>(_1379);
    uint _1443 = uint(int(uint(_1383) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_1443)] = as_type<uint>(_1419);
    uint _1445 = uint(int(uint(_1425) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_1445)] = as_type<uint>(_1381);
    uint _1447 = uint(int(uint(_166) >> uint(2)));
    (*spvDescriptorSet0.cp_s10)._m0[int(_1447)] = as_type<uint>(_428);
    uint _1449 = uint(int(uint(_1383) >> uint(2)));
    (*spvDescriptorSet0.cp_s10)._m0[int(_1449)] = as_type<uint>(_1429);
    uint _1451 = uint(int(uint(_1425) >> uint(2)));
    (*spvDescriptorSet0.cp_s10)._m0[int(_1451)] = as_type<uint>(_434);
    float _1453 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _1455 = _1429 * _1429;
    float _1457 = _1419 * _1419;
    float _1459 = fma(_428, _428, _1455);
    float _1461 = fma(_1379, _1379, _1457);
    float _1463 = fma(_434, _434, _1459);
    float _1465 = fma(_1381, _1381, _1461);
    float _1467 = sqrt(_1465);
    float _1469 = sqrt(_1463);
    bool _1471 = _1469 >= 9.9999999747524270787835121154785e-07;
    bool _1473 = isnan(_1469);
    bool _1475 = _1471 || _1473;
    bool _1477 = isnan(9.9999999747524270787835121154785e-07);
    bool _1479 = _1475 || _1477;
    int _1495;
    if (!_1479)
    {
        bool _1481 = _671 != _677;
        bool _1483 = isnan(_671);
        bool _1485 = _1481 || _1483;
        bool _1487 = isnan(_677);
        bool _1489 = _1485 || _1487;
        if (_1489)
        {
            _448 = as_type<int>(_693);
        }
        int _1491 = _448;
        int _1493 = _1491;
        _1495 = _1491;
        _1497 = _1489;
        if (!_1497)
        {
            float _1499 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
            bool _1501 = _1499 > 0.0;
            bool _1503 = !_1501;
            if (!_1503)
            {
                float _1505 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
                float _1507 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
                float _1509 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
                float _1511 = _1507 * _1507;
                float _1513 = fma(_1505, _1505, _1511);
                float _1515 = fma(_1509, _1509, _1513);
                float _1517 = rsqrt(_1515);
                float _1519 = _1517 * 9.9999999747524270787835121154785e-07;
                float _1521 = _1505 * _1519;
                float _1523 = _1507 * _1519;
                float _1525 = _1509 * _1519;
                _1495 = as_type<int>(_1521);
                _773 = as_type<int>(_1523);
                _775 = as_type<int>(_1525);
                _1497 = true;
            }
            else
            {
                bool _1527 = _1467 >= 9.9999999747524270787835121154785e-07;
                bool _1529 = isnan(_1467);
                bool _1531 = _1527 || _1529;
                bool _1533 = isnan(9.9999999747524270787835121154785e-07);
                bool _1535 = _1531 || _1533;
                if (!_1535)
                {
                    float _1537 = _1417 * _1417;
                    float _1539 = fma(_432, _432, _1537);
                    float _1541 = fma(_436, _436, _1539);
                    float _1543 = sqrt(_1541);
                    bool _1545 = _1543 >= 9.9999999747524270787835121154785e-07;
                    bool _1547 = isnan(_1543);
                    bool _1549 = _1545 || _1547;
                    bool _1551 = isnan(9.9999999747524270787835121154785e-07);
                    bool _1553 = _1549 || _1551;
                    float _1555 = _1543;
                    if (_1553)
                    {
                        float _1557 = rsqrt(_1541);
                        _1555 = _1557;
                    }
                    float _1559 = _1555;
                    if (!_1553)
                    {
                        _1493 = 0;
                    }
                    int _1561 = _1493;
                    int _1563 = _1561;
                    if (!_1553)
                    {
                        _765 = 897988541;
                    }
                    int _1565 = _765;
                    int _1567 = _1565;
                    if (!_1553)
                    {
                        _767 = 0;
                    }
                    int _1569 = _767;
                    float _1571 = _1559;
                    int _1573 = _1569;
                    if (_1553)
                    {
                        float _1575 = _1559 * 9.9999999747524270787835121154785e-07;
                        _1571 = _1575;
                    }
                    float _1577 = _1571;
                    if (_1553)
                    {
                        float _1579 = _432 * _1577;
                        _1563 = as_type<int>(_1579);
                    }
                    int _1581 = _1563;
                    _1495 = _1581;
                    if (_1553)
                    {
                        float _1583 = _1417 * _1577;
                        _1567 = as_type<int>(_1583);
                    }
                    int _1585 = _1567;
                    _773 = _1585;
                    if (_1553)
                    {
                        float _1587 = _436 * _1577;
                        _1573 = as_type<int>(_1587);
                    }
                    int _1589 = _1573;
                    _775 = _1589;
                    _1497 = true;
                }
                else
                {
                    float _1591 = rsqrt(_1465);
                    float _1593 = _1591 * 9.9999999747524270787835121154785e-07;
                    float _1595 = _1379 * _1593;
                    float _1597 = _1419 * _1593;
                    float _1599 = _1381 * _1593;
                    _1495 = as_type<int>(_1595);
                    _773 = as_type<int>(_1597);
                    _775 = as_type<int>(_1599);
                    _1497 = true;
                }
            }
        }
    }
    else
    {
        float _1601 = _1467 * _1453;
        bool _1603 = _1601 >= 0.001000000047497451305389404296875;
        bool _1605 = isnan(_1601);
        bool _1607 = _1603 || _1605;
        bool _1609 = isnan(0.001000000047497451305389404296875);
        bool _1611 = _1607 || _1609;
        bool _1613 = _1601 > 0.0;
        bool _1615 = !_1611;
        bool _1617 = _1613 && _1615;
        bool _1619 = _1469 < 0.001000000047497451305389404296875;
        bool _1621 = _1619 && _1617;
        if (!_1621)
        {
            _769 = as_type<int>(_1429);
        }
        int _1623 = _769;
        int _1625 = _1623;
        if (_1621)
        {
            float _1627 = _1453 * _1379;
            _450 = as_type<int>(_1627);
        }
        int _1629 = _450;
        _1495 = _1629;
        if (!_1621)
        {
            _771 = as_type<int>(_434);
        }
        int _1631 = _771;
        _775 = _1631;
        if (_1621)
        {
            float _1633 = _1453 * _1419;
            _1625 = as_type<int>(_1633);
        }
        int _1635 = _1625;
        _773 = _1635;
        if (_1621)
        {
            float _1637 = _1453 * _1381;
            _775 = as_type<int>(_1637);
        }
    }
    _1497 = false;
    int _1639 = _1495;
    int _1641 = _773;
    int _1643 = _775;
    uint _1645 = uint(int(uint(_166) >> uint(2)));
    (*spvDescriptorSet0.cp_s10)._m0[int(_1645)] = uint(_1639);
    uint _1647 = uint(int(uint(_1383) >> uint(2)));
    (*spvDescriptorSet0.cp_s10)._m0[int(_1647)] = uint(_1641);
    uint _1649 = uint(int(uint(_1425) >> uint(2)));
    (*spvDescriptorSet0.cp_s10)._m0[int(_1649)] = uint(_1643);
}

