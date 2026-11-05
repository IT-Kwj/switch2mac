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
    texture3d<float> cp_t_tcb_12 [[id(14)]];
    sampler cp_t_tcb_12Smplr [[id(15)]];
    texture2d_array<float> cp_t_tcb_16 [[id(16)]];
    sampler cp_t_tcb_16Smplr [[id(17)]];
    texture2d_array<float> cp_t_tcb_14 [[id(18)]];
    sampler cp_t_tcb_14Smplr [[id(19)]];
    sampler cp_t_tcb_12Smplr_w [[id(20)]];
    sampler cp_t_tcb_14Smplr_w [[id(21)]];
    constant dm_border_t* dm_border [[id(22)]];
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]])
{
    bool _2456 = false;
    bool _1324 = false;
    bool _902 = false;
    bool _402 = false;
    float _78 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[9]);
    float _80 = as_type<float>(gl_LocalInvocationID.x);
    float _82 = as_type<float>(gl_WorkGroupID.x);
    int _85 = as_type<int>(_82) << 5;
    int _87 = _85 + as_type<int>(_80);
    float _89 = trunc(_78);
    int _91 = int(_89);
    bool _95 = _87 >= _91;
    int _97 = 0;
    if (_95)
    {
        _97 = 0;
    }
    int _99 = _97;
    int _101 = _99;
    int _103 = _99;
    if (!_95)
    {
        int _105 = _87 << 4;
        int _107 = _105 + 12;
        uint _110 = uint(int(uint(_107) >> uint(2)));
        float _112 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_110)]);
        float _114 = trunc(_112);
        int _116 = int(_114);
        bool _118 = _116 >= 1;
        int _120 = _118 ? (-1) : 0;
        if (!_118)
        {
            _101 = 0;
        }
        int _122 = _101;
        bool _124 = !_118;
        _103 = _122;
        if (!_124)
        {
            float _126 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
            uint _128 = uint(int(uint(_107) >> uint(2)));
            float _130 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_128)]);
            float _132 = float(_116);
            float _134 = -_130;
            float _136 = _126 + _134;
            bool _138 = _136 > _132;
            int _140 = as_type<int>(_126);
            if (!_138)
            {
                bool _142 = _126 >= _130;
                bool _144 = isnan(_126);
                bool _146 = _142 || _144;
                bool _148 = isnan(_130);
                bool _150 = _146 || _148;
                _120 = _150 ? (-1) : 0;
            }
            int _152 = _120;
            if (_138)
            {
                _140 = 0;
            }
            int _154 = _140;
            _103 = _154;
            if (!_138)
            {
                int _156 = ~_152;
                int _158 = (_156 != 0) ? 0 : 1;
                _103 = _158;
            }
        }
    }
    int _160 = _103;
    int _162 = _160 & 1;
    bool _164 = _162 != 0;
    if (!_164)
    {
        return;
    }
    float _166 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _168 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[68]);
    int _170 = _87 << 4;
    float _172 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
    float _174 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
    float _176 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
    int _178 = _170 + 12;
    float _180 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
    float _182 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[65]);
    uint _184 = uint(int(uint(_178) >> uint(2)));
    float _186 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_184)]);
    float _188 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[30]);
    uint _190 = uint(int(uint(_170) >> uint(2)));
    float _192 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_190)]);
    int _194 = _170 + 4;
    uint _196 = uint(int(uint(_194) >> uint(2)));
    float _198 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_196)]);
    int _200 = _170 + 8;
    uint _202 = uint(int(uint(_200) >> uint(2)));
    float _204 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_202)]);
    int _206 = _170 + 12;
    uint _208 = uint(int(uint(_206) >> uint(2)));
    float _210 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_208)]);
    uint _212 = uint(int(uint(_170) >> uint(2)));
    float _214 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_212)]);
    int _216 = _170 + 4;
    uint _218 = uint(int(uint(_216) >> uint(2)));
    float _220 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_218)]);
    int _222 = _170 + 8;
    uint _224 = uint(int(uint(_222) >> uint(2)));
    float _226 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_224)]);
    float _228 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
    uint _230 = uint(int(uint(_178) >> uint(2)));
    float _232 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_230)]);
    uint _234 = uint(int(uint(_170) >> uint(2)));
    float _236 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_234)]);
    int _238 = _170 + 4;
    uint _240 = uint(int(uint(_238) >> uint(2)));
    float _242 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_240)]);
    int _244 = _170 + 8;
    uint _246 = uint(int(uint(_244) >> uint(2)));
    float _248 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_246)]);
    uint _250 = uint(int(uint(_170) >> uint(2)));
    float _252 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_250)]);
    float _254 = abs(_168);
    float _256 = log2(_254);
    float _258 = _166 * _256;
    float _260 = exp2(_258);
    float _262 = _172 * _180;
    bool _264 = _182 > 0.0;
    float _266 = _174 * _180;
    float _268 = _176 * _180;
    float _270 = _166 * _262;
    float _272 = _186 * _166;
    float _274 = _166 * _266;
    float _276 = _166 * _268;
    float _278 = fma(_198, _272, _220);
    float _280 = fma(_192, _260, _270);
    float _282 = fma(_192, _272, _214);
    float _284 = fma(_204, _272, _226);
    float _286 = fma(_198, _260, _274);
    float _288 = fma(_204, _260, _276);
    int _290 = as_type<int>(_188) & 512;
    bool _292 = _290 != 0;
    float _294 = -_232;
    float _296 = _228 + _294;
    float _298 = _210;
    float _300 = _198;
    float _302 = _260;
    bool _304 = _264;
    float _306 = _188;
    float _308 = _166;
    float _310 = _280;
    float _312 = _278;
    if (!_264)
    {
        _298 = _282;
    }
    float _314 = _298;
    float _316 = _314;
    float _318 = _314;
    if (!_264)
    {
        _300 = _278;
    }
    float _320 = _300;
    float _322 = _320;
    float _324 = _320;
    if (!_264)
    {
        _302 = _284;
    }
    float _326 = _302;
    bool _328 = !_264;
    float _330 = _326;
    float _332 = _326;
    float _334 = 0.0;
    float _336 = 0.0;
    float _338 = 0.0;
    int _340 = as_type<int>(_242);
    int _342 = as_type<int>(_242);
    int _344 = as_type<int>(_248);
    int _346 = as_type<int>(_236);
    int _348 = as_type<int>(_242);
    int _350 = as_type<int>(_248);
    if (!_328)
    {
        bool _352 = !_292;
        if (!_352)
        {
            float _354 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
            float _356 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
            float _358 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
            float _360 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
            float _362 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
            float _364 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
            float _366 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
            float _368 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
            float _370 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
            float _372 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
            float _374 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
            float _376 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
            float _378 = _278 * _356;
            float _380 = _278 * _364;
            float _382 = fma(_282, _354, _378);
            float _384 = _278 * _372;
            float _386 = fma(_282, _362, _380);
            float _388 = fma(_284, _358, _382);
            float _390 = fma(_282, _370, _384);
            float _392 = fma(_284, _366, _386);
            float _394 = _360 + _388;
            float _396 = fma(_284, _374, _390);
            float _398 = _368 + _392;
            float _400 = _376 + _396;
            _318 = _394;
            _332 = _400;
            _324 = _398;
            _334 = _390;
            _336 = _396;
            _338 = _376;
            _402 = true;
        }
        else
        {
            int _404 = as_type<int>(_188) & 1024;
            bool _406 = _404 != 0;
            bool _408 = !_406;
            if (!_408)
            {
                float _410 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
                uint _412 = uint(int(uint(_170) >> uint(2)));
                float _414 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_412)]);
                int _416 = _170 + 4;
                uint _418 = uint(int(uint(_416) >> uint(2)));
                float _420 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_418)]);
                int _422 = _170 + 8;
                uint _424 = uint(int(uint(_422) >> uint(2)));
                float _426 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_424)]);
                uint _428 = uint(int(uint(_170) >> uint(2)));
                float _430 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_428)]);
                int _432 = _170 + 4;
                uint _434 = uint(int(uint(_432) >> uint(2)));
                float _436 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_434)]);
                int _438 = _170 + 8;
                uint _440 = uint(int(uint(_438) >> uint(2)));
                float _442 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_440)]);
                uint _444 = uint(int(uint(_170) >> uint(2)));
                float _446 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_444)]);
                int _448 = _170 + 4;
                uint _450 = uint(int(uint(_448) >> uint(2)));
                float _452 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_450)]);
                int _454 = _170 + 8;
                uint _456 = uint(int(uint(_454) >> uint(2)));
                float _458 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_456)]);
                int _460 = _170 + 12;
                uint _462 = uint(int(uint(_460) >> uint(2)));
                float _464 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_462)]);
                float _466 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
                float _468 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
                float _470 = _278 * _420;
                float _472 = _278 * _436;
                float _474 = _278 * _452;
                float _476 = fma(_282, _414, _470);
                float _478 = fma(_282, _430, _472);
                float _480 = fma(_282, _446, _474);
                float _482 = fma(_284, _426, _476);
                float _484 = fma(_284, _442, _478);
                float _486 = fma(_284, _458, _480);
                float _488 = _410 + _482;
                float _490 = _466 + _484;
                float _492 = _468 + _486;
                _318 = _488;
                _332 = _492;
                _324 = _490;
                _334 = _480;
                _336 = _486;
                _338 = _464;
                _402 = true;
            }
            else
            {
                int _494 = as_type<int>(_188) & 2048;
                bool _496 = _494 != 0;
                if (!_496)
                {
                    _316 = _282;
                }
                float _498 = _316;
                _318 = _498;
                if (!_496)
                {
                    _322 = _278;
                }
                float _500 = _322;
                _324 = _500;
                if (!_496)
                {
                    _330 = _284;
                }
                float _502 = _330;
                bool _504 = !_496;
                _332 = _502;
                _334 = 0.0;
                _336 = 0.0;
                _338 = 0.0;
                if (!_504)
                {
                    uint _506 = uint(int(uint(_170) >> uint(2)));
                    float _508 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_506)]);
                    int _510 = _170 + 4;
                    uint _512 = uint(int(uint(_510) >> uint(2)));
                    float _514 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_512)]);
                    int _516 = _170 + 8;
                    uint _518 = uint(int(uint(_516) >> uint(2)));
                    float _520 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_518)]);
                    int _522 = _170 + 12;
                    uint _524 = uint(int(uint(_522) >> uint(2)));
                    float _526 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_524)]);
                    uint _528 = uint(int(uint(_170) >> uint(2)));
                    float _530 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_528)]);
                    int _532 = _170 + 4;
                    uint _534 = uint(int(uint(_532) >> uint(2)));
                    float _536 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_534)]);
                    int _538 = _170 + 8;
                    uint _540 = uint(int(uint(_538) >> uint(2)));
                    float _542 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_540)]);
                    int _544 = _170 + 12;
                    uint _546 = uint(int(uint(_544) >> uint(2)));
                    float _548 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_546)]);
                    uint _550 = uint(int(uint(_170) >> uint(2)));
                    float _552 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_550)]);
                    int _554 = _170 + 4;
                    uint _556 = uint(int(uint(_554) >> uint(2)));
                    float _558 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_556)]);
                    int _560 = _170 + 8;
                    uint _562 = uint(int(uint(_560) >> uint(2)));
                    float _564 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_562)]);
                    int _566 = _170 + 12;
                    uint _568 = uint(int(uint(_566) >> uint(2)));
                    float _570 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_568)]);
                    float _572 = _278 * _514;
                    float _574 = _278 * _536;
                    float _576 = _278 * _558;
                    float _578 = fma(_282, _508, _572);
                    float _580 = fma(_282, _530, _574);
                    float _582 = fma(_282, _552, _576);
                    float _584 = fma(_284, _520, _578);
                    float _586 = fma(_284, _542, _580);
                    float _588 = fma(_284, _564, _582);
                    float _590 = _584 + _526;
                    float _592 = _586 + _548;
                    float _594 = _588 + _570;
                    _318 = _590;
                    _332 = _594;
                    _324 = _592;
                    _334 = _582;
                    _336 = _588;
                    _338 = _570;
                }
            }
        }
    }
    _402 = false;
    float _596 = _318;
    float _598 = _332;
    float _600 = _324;
    float _602 = _334;
    float _604 = _336;
    float _606 = _338;
    float _608 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[64]);
    float _610 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[60]);
    float _612 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[62]);
    float _614 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[61]);
    float _616 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[59]);
    float _618 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[63]);
    bool _620 = _608 != 0.0;
    bool _622 = isnan(_608);
    bool _624 = _620 || _622;
    bool _626 = isnan(0.0);
    bool _628 = _624 || _626;
    float _630 = _228 * _610;
    float _632 = _228 * _612;
    float _634 = _228 * _614;
    float _636 = fma(_616, _596, _630);
    float _638 = fma(_616, _598, _632);
    float _640 = fma(_616, _600, _634);
    float _642 = _618;
    float _644 = _596;
    float _646 = _612;
    float _648 = _602;
    float _650 = _604;
    float _652 = _606;
    if (_628)
    {
        float _654 = _252 * _618;
        _642 = _654;
    }
    float _656 = _642;
    float _658 = _640 + _656;
    float _660 = -_656;
    bool _662 = _636 >= _660;
    bool _664 = isnan(_636);
    bool _666 = _662 || _664;
    bool _668 = isnan(_660);
    bool _670 = _666 || _668;
    float _672 = _636 + _656;
    float _674 = -_656;
    bool _676 = _638 >= _674;
    bool _678 = isnan(_638);
    bool _680 = _676 || _678;
    bool _682 = isnan(_674);
    bool _684 = _680 || _682;
    float _686 = _638 + _656;
    float _688 = -_656;
    bool _690 = _640 >= _688;
    bool _692 = isnan(_640);
    bool _694 = _690 || _692;
    bool _696 = isnan(_688);
    bool _698 = _694 || _696;
    bool _700 = !_670;
    float _702 = -_672;
    float _704 = _700 ? _702 : _672;
    bool _706 = !_684;
    float _708 = -_686;
    float _710 = _706 ? _708 : _686;
    bool _712 = !_698;
    float _714 = -_658;
    float _716 = _712 ? _714 : _658;
    float _718 = _704 * 0.03125;
    float _720 = _710 * 0.03125;
    float _722 = _716 * 0.03125;
    float3 _3663 = float3(_718, _722, _720);
    float3 _726 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, select(_3663, float3(0.0), isnan(_3663)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, select(_3663, float3(0.0), isnan(_3663)), level(0.0)).xyz;
    float _728 = _726.x;
    float _730 = _726.y;
    float _732 = _726.z;
    float _734 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[56]);
    float _736 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[57]);
    float _738 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[58]);
    float _740 = _728 + (-0.5);
    float _742 = _730 + (-0.5);
    float _744 = _732 + (-0.5);
    float _746 = _740 * _734;
    float _748 = _742 * _736;
    float _750 = _744 * _738;
    float _752 = _740;
    float _754 = _744;
    float _756 = _738;
    if (!_264)
    {
        _752 = _746;
    }
    float _758 = _752;
    float _760 = _758;
    float _762 = _758;
    if (!_264)
    {
        _644 = _748;
    }
    float _764 = _644;
    float _766 = _764;
    float _768 = _764;
    if (!_264)
    {
        _754 = _750;
    }
    float _770 = _754;
    bool _772 = !_264;
    float _774 = _770;
    float _776 = _770;
    float _778 = 0.0;
    if (!_772)
    {
        bool _780 = !_292;
        if (!_780)
        {
            float _782 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
            float _784 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
            float _786 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
            float _788 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
            float _790 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
            float _792 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
            float _794 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
            float _796 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
            float _798 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
            float _800 = _786 * _788;
            float _802 = _786 * _790;
            float _804 = _784 * _788;
            float _806 = -_800;
            float _808 = fma(_782, _792, _806);
            float _810 = -_802;
            float _812 = fma(_784, _792, _810);
            float _814 = -_804;
            float _816 = fma(_782, _790, _814);
            float _818 = _796 * _782;
            float _820 = _796 * _808;
            float _822 = _798 * _784;
            float _824 = _794 * _790;
            float _826 = -_818;
            float _828 = fma(_794, _784, _826);
            float _830 = -_820;
            float _832 = fma(_794, _812, _830);
            float _834 = _796 * _792;
            float _836 = _798 * _788;
            float _838 = -_824;
            float _840 = fma(_796, _788, _838);
            float _842 = fma(_798, _816, _832);
            float _844 = -_834;
            float _846 = fma(_798, _790, _844);
            float _848 = -_836;
            float _850 = fma(_794, _792, _848);
            float _852 = _794 * _786;
            float _854 = 1.0 / _842;
            float _856 = -_782;
            float _858 = fma(_856, _792, _800);
            float _860 = -_822;
            float _862 = fma(_796, _786, _860);
            float _864 = -_852;
            float _866 = fma(_798, _782, _864);
            float _868 = _846 * _854;
            float _870 = _850 * _854;
            float _872 = _840 * _854;
            float _874 = _746 * _854;
            float _876 = _748 * _868;
            float _878 = _748 * _870;
            float _880 = _748 * _872;
            float _882 = _858 * _854;
            float _884 = _862 * _854;
            float _886 = _866 * _854;
            float _888 = _828 * _854;
            float _890 = fma(_812, _874, _876);
            float _892 = fma(_746, _882, _878);
            float _894 = fma(_816, _874, _880);
            float _896 = fma(_750, _884, _890);
            float _898 = fma(_750, _886, _892);
            float _900 = fma(_750, _888, _894);
            _768 = _898;
            _776 = _900;
            _762 = _896;
            _756 = _794;
            _646 = _868;
            _648 = _796;
            _650 = _798;
            _652 = _888;
            _778 = _854;
            _902 = true;
        }
        else
        {
            int _904 = as_type<int>(_188) & 1024;
            bool _906 = _904 != 0;
            if (_906)
            {
                _304 = true;
            }
            bool _908 = _304;
            bool _910 = _908;
            if (!_906)
            {
                int _912 = as_type<int>(_188) & 2048;
                bool _914 = _912 != 0;
                _910 = _914;
            }
            bool _916 = _910;
            if (!_916)
            {
                _760 = _746;
            }
            float _918 = _760;
            _762 = _918;
            if (!_916)
            {
                _766 = _748;
            }
            float _920 = _766;
            _768 = _920;
            if (!_916)
            {
                _774 = _750;
            }
            float _922 = _774;
            bool _924 = !_916;
            _776 = _922;
            _778 = 0.0;
            if (!_924)
            {
                uint _926 = uint(int(uint(_170) >> uint(2)));
                float _928 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_926)]);
                int _930 = _170 + 4;
                uint _932 = uint(int(uint(_930) >> uint(2)));
                float _934 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_932)]);
                int _936 = _170 + 8;
                uint _938 = uint(int(uint(_936) >> uint(2)));
                float _940 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_938)]);
                uint _942 = uint(int(uint(_170) >> uint(2)));
                float _944 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_942)]);
                int _946 = _170 + 4;
                uint _948 = uint(int(uint(_946) >> uint(2)));
                float _950 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_948)]);
                int _952 = _170 + 8;
                uint _954 = uint(int(uint(_952) >> uint(2)));
                float _956 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_954)]);
                uint _958 = uint(int(uint(_170) >> uint(2)));
                float _960 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_958)]);
                int _962 = _170 + 4;
                uint _964 = uint(int(uint(_962) >> uint(2)));
                float _966 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_964)]);
                int _968 = _170 + 8;
                uint _970 = uint(int(uint(_968) >> uint(2)));
                float _972 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_970)]);
                float _974 = _940 * _944;
                float _976 = _940 * _950;
                float _978 = _934 * _944;
                float _980 = -_974;
                float _982 = fma(_928, _956, _980);
                float _984 = -_976;
                float _986 = fma(_934, _956, _984);
                float _988 = -_978;
                float _990 = fma(_928, _950, _988);
                float _992 = _966 * _928;
                float _994 = _966 * _982;
                float _996 = _972 * _934;
                float _998 = _960 * _950;
                float _1000 = -_992;
                float _1002 = fma(_960, _934, _1000);
                float _1004 = -_994;
                float _1006 = fma(_960, _986, _1004);
                float _1008 = _966 * _956;
                float _1010 = _972 * _944;
                float _1012 = -_998;
                float _1014 = fma(_966, _944, _1012);
                float _1016 = fma(_972, _990, _1006);
                float _1018 = -_1008;
                float _1020 = fma(_972, _950, _1018);
                float _1022 = -_1010;
                float _1024 = fma(_960, _956, _1022);
                float _1026 = _960 * _940;
                float _1028 = 1.0 / _1016;
                float _1030 = -_928;
                float _1032 = fma(_1030, _956, _974);
                float _1034 = -_996;
                float _1036 = fma(_966, _940, _1034);
                float _1038 = -_1026;
                float _1040 = fma(_972, _928, _1038);
                float _1042 = _1020 * _1028;
                float _1044 = _1024 * _1028;
                float _1046 = _1014 * _1028;
                float _1048 = _746 * _1028;
                float _1050 = _748 * _1042;
                float _1052 = _748 * _1044;
                float _1054 = _748 * _1046;
                float _1056 = _1032 * _1028;
                float _1058 = _1036 * _1028;
                float _1060 = _1040 * _1028;
                float _1062 = _1002 * _1028;
                float _1064 = fma(_986, _1048, _1050);
                float _1066 = fma(_746, _1056, _1052);
                float _1068 = fma(_990, _1048, _1054);
                float _1070 = fma(_750, _1058, _1064);
                float _1072 = fma(_750, _1060, _1066);
                float _1074 = fma(_750, _1062, _1068);
                _768 = _1072;
                _776 = _1074;
                _762 = _1070;
                _756 = _960;
                _646 = _1042;
                _648 = _966;
                _650 = _972;
                _652 = _1062;
                _778 = _1028;
            }
        }
    }
    _902 = false;
    float _1076 = _768;
    float _1078 = _776;
    float _1080 = _762;
    float _1082 = _756;
    float _1084 = _646;
    float _1086 = _648;
    float _1088 = _650;
    float _1090 = _652;
    float _1092 = _778;
    float _1094 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[86]);
    float _1096 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[85]);
    float _1098 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[84]);
    float _1100 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[128]);
    float _1102 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[129]);
    float _1104 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[130]);
    float _1106 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[131]);
    uint _1108 = uint(int(uint(_178) >> uint(2)));
    float _1110 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_1108)]);
    float _1112 = fma(_166, _1076, _286);
    float _1114 = fma(_166, _1078, _288);
    float _1116 = fma(_166, _1080, _280);
    bool _1118 = _1094 > 0.0;
    bool _1120 = _1096 > 0.0;
    float _1122 = _1098 * _1096;
    float _1124 = _166 * _1100;
    float _1126 = _1082;
    float _1128 = _1098;
    float _1130 = _1084;
    bool _1132 = _1120;
    float _1134 = _1124;
    float _1136 = _1102;
    float _1138 = _1106;
    float _1140 = _1086;
    float _1142 = _1088;
    float _1144 = _1090;
    float _1146 = _1094;
    float _1148 = _1092;
    if (_1118)
    {
        float _1150 = 1.0 / _1094;
        _1126 = _1150;
    }
    float _1152 = _1126;
    float _1154 = _166 * _1104;
    float _1156 = _1154;
    if (_1120)
    {
        float _1158 = -_1122;
        float _1160 = fma(_252, _1158, _1098);
        _1128 = _1160;
    }
    float _1162 = _1128;
    float _1164 = _166 * _1102;
    float _1166 = _1152;
    float _1168 = _1162;
    float _1170 = _1164;
    if (_1118)
    {
        float _1172 = _296 * _1152;
        _1130 = _1172;
    }
    float _1174 = _1130;
    float _1176 = _1174;
    if (_1118)
    {
        float _1178 = precise::min(_1174, 1.0);
        _1166 = _1178;
    }
    float _1180 = _1166;
    float _1182 = _1180;
    if (_1118)
    {
        float _1184 = _1180 * _1162;
        _1168 = _1184;
    }
    float _1186 = _1168;
    float _1188 = _1124 * _1186;
    float _1190 = _1164 * _1186;
    float _1192 = _1154 * _1186;
    bool _1194 = !_292;
    float _1196 = _1186;
    float _1198 = _1190;
    float _1200 = _1188;
    float _1322;
    if (!_1194)
    {
        float _1202 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _1204 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _1206 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _1208 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _1210 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _1212 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _1214 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _1216 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _1218 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _1220 = _1206 * _1208;
        float _1222 = _1206 * _1210;
        float _1224 = _1204 * _1208;
        float _1226 = -_1220;
        float _1228 = fma(_1202, _1212, _1226);
        float _1230 = -_1222;
        float _1232 = fma(_1204, _1212, _1230);
        float _1234 = _1218 * _1204;
        float _1236 = _1214 * _1210;
        float _1238 = _1216 * _1228;
        float _1240 = -_1224;
        float _1242 = fma(_1202, _1210, _1240);
        float _1244 = _1216 * _1202;
        float _1246 = -_1234;
        float _1248 = fma(_1216, _1206, _1246);
        float _1250 = -_1238;
        float _1252 = fma(_1214, _1232, _1250);
        float _1254 = _1214 * _1206;
        float _1256 = -_1244;
        float _1258 = fma(_1214, _1204, _1256);
        float _1260 = _1216 * _1212;
        float _1262 = fma(_1218, _1242, _1252);
        float _1264 = _1218 * _1208;
        float _1266 = -_1236;
        float _1268 = fma(_1216, _1208, _1266);
        float _1270 = -_1260;
        float _1272 = fma(_1218, _1210, _1270);
        float _1274 = -_1254;
        float _1276 = fma(_1218, _1202, _1274);
        float _1278 = -_1264;
        float _1280 = fma(_1214, _1212, _1278);
        float _1282 = 1.0 / _1262;
        float _1284 = -_1202;
        float _1286 = fma(_1284, _1212, _1220);
        float _1288 = _1272 * _1282;
        float _1290 = _1280 * _1282;
        float _1292 = _1268 * _1282;
        float _1294 = _1188 * _1282;
        float _1296 = _1288 * _1190;
        float _1298 = _1290 * _1190;
        float _1300 = _1292 * _1190;
        float _1302 = _1286 * _1282;
        float _1304 = _1248 * _1282;
        float _1306 = fma(_1232, _1294, _1296);
        float _1308 = _1276 * _1282;
        float _1310 = _1258 * _1282;
        float _1312 = fma(_1302, _1188, _1298);
        float _1314 = fma(_1242, _1294, _1300);
        float _1316 = fma(_1304, _1192, _1306);
        float _1318 = fma(_1308, _1192, _1312);
        float _1320 = fma(_1310, _1192, _1314);
        _1134 = _1208;
        _1136 = _1308;
        _1156 = _1286;
        _1138 = _1264;
        _1170 = _1312;
        _308 = _1314;
        _310 = _1294;
        _1196 = _1232;
        _1182 = _1290;
        _1140 = _1216;
        _1142 = _1276;
        _1144 = _1254;
        _1198 = _1318;
        _1200 = _1316;
        _1322 = _1320;
        _1146 = _1302;
        _1148 = _1292;
        _1176 = _1282;
        _1324 = true;
    }
    else
    {
        int _1326 = as_type<int>(_188) & 1024;
        bool _1328 = _1326 != 0;
        if (_1328)
        {
            _1132 = true;
        }
        bool _1330 = _1132;
        bool _1332 = _1330;
        if (!_1328)
        {
            int _1334 = as_type<int>(_188) & 2048;
            bool _1336 = _1334 != 0;
            _1332 = _1336;
        }
        bool _1338 = _1332;
        if (!_1338)
        {
            _306 = _1192;
        }
        float _1340 = _306;
        bool _1342 = !_1338;
        _1322 = _1340;
        if (!_1342)
        {
            uint _1344 = uint(int(uint(_170) >> uint(2)));
            float _1346 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1344)]);
            int _1348 = _170 + 4;
            uint _1350 = uint(int(uint(_1348) >> uint(2)));
            float _1352 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1350)]);
            int _1354 = _170 + 8;
            uint _1356 = uint(int(uint(_1354) >> uint(2)));
            float _1358 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1356)]);
            uint _1360 = uint(int(uint(_170) >> uint(2)));
            float _1362 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1360)]);
            int _1364 = _170 + 4;
            uint _1366 = uint(int(uint(_1364) >> uint(2)));
            float _1368 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1366)]);
            int _1370 = _170 + 8;
            uint _1372 = uint(int(uint(_1370) >> uint(2)));
            float _1374 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1372)]);
            uint _1376 = uint(int(uint(_170) >> uint(2)));
            float _1378 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1376)]);
            int _1380 = _170 + 4;
            uint _1382 = uint(int(uint(_1380) >> uint(2)));
            float _1384 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1382)]);
            int _1386 = _170 + 8;
            uint _1388 = uint(int(uint(_1386) >> uint(2)));
            float _1390 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1388)]);
            float _1392 = _1358 * _1362;
            float _1394 = _1358 * _1368;
            float _1396 = _1352 * _1362;
            float _1398 = -_1392;
            float _1400 = fma(_1346, _1374, _1398);
            float _1402 = -_1394;
            float _1404 = fma(_1352, _1374, _1402);
            float _1406 = _1390 * _1352;
            float _1408 = _1378 * _1368;
            float _1410 = _1384 * _1400;
            float _1412 = -_1396;
            float _1414 = fma(_1346, _1368, _1412);
            float _1416 = _1384 * _1346;
            float _1418 = -_1406;
            float _1420 = fma(_1384, _1358, _1418);
            float _1422 = -_1410;
            float _1424 = fma(_1378, _1404, _1422);
            float _1426 = _1378 * _1358;
            float _1428 = -_1416;
            float _1430 = fma(_1378, _1352, _1428);
            float _1432 = _1384 * _1374;
            float _1434 = fma(_1390, _1414, _1424);
            float _1436 = _1390 * _1362;
            float _1438 = -_1408;
            float _1440 = fma(_1384, _1362, _1438);
            float _1442 = -_1432;
            float _1444 = fma(_1390, _1368, _1442);
            float _1446 = -_1426;
            float _1448 = fma(_1390, _1346, _1446);
            float _1450 = -_1436;
            float _1452 = fma(_1378, _1374, _1450);
            float _1454 = 1.0 / _1434;
            float _1456 = -_1346;
            float _1458 = fma(_1456, _1374, _1392);
            float _1460 = _1444 * _1454;
            float _1462 = _1452 * _1454;
            float _1464 = _1440 * _1454;
            float _1466 = _1188 * _1454;
            float _1468 = _1460 * _1190;
            float _1470 = _1462 * _1190;
            float _1472 = _1464 * _1190;
            float _1474 = _1458 * _1454;
            float _1476 = _1420 * _1454;
            float _1478 = fma(_1404, _1466, _1468);
            float _1480 = _1448 * _1454;
            float _1482 = _1430 * _1454;
            float _1484 = fma(_1474, _1188, _1470);
            float _1486 = fma(_1414, _1466, _1472);
            float _1488 = fma(_1476, _1192, _1478);
            float _1490 = fma(_1480, _1192, _1484);
            float _1492 = fma(_1482, _1192, _1486);
            _1134 = _1362;
            _1136 = _1480;
            _1156 = _1458;
            _1138 = _1436;
            _1170 = _1484;
            _308 = _1486;
            _310 = _1466;
            _1196 = _1404;
            _1182 = _1462;
            _1140 = _1384;
            _1142 = _1448;
            _1144 = _1426;
            _1198 = _1490;
            _1200 = _1488;
            _1322 = _1492;
            _1146 = _1474;
            _1148 = _1464;
            _1176 = _1454;
        }
    }
    _1324 = false;
    float _1494 = _1134;
    float _1496 = _1136;
    float _1498 = _1156;
    float _1500 = _1138;
    float _1502 = _1170;
    float _1504 = _308;
    float _1506 = _310;
    float _1508 = _1196;
    float _1510 = _1182;
    float _1512 = _1140;
    float _1514 = _1142;
    float _1516 = _1144;
    float _1518 = _1198;
    float _1520 = _1200;
    float _1522 = _1322;
    float _1524 = _1146;
    float _1526 = _1148;
    float _1528 = _1176;
    uint _1530 = uint(int(uint(_178) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1530)] = as_type<uint>(_1110);
    float _1532 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[30]);
    int _1534 = as_type<int>(_1532) & 512;
    bool _1536 = _1534 != 0;
    int _1538 = as_type<int>(_1532) & 1024;
    bool _1540 = _1538 != 0;
    float _1542 = _1494;
    float _1544 = _1496;
    float _1546 = _1498;
    float _1548 = _1500;
    float _1550 = _1524;
    float _1552 = _1526;
    float _1554 = _1528;
    if (_1536)
    {
        float _1556 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _1558 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _1560 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _1562 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        _1542 = _1556;
        _1544 = _1558;
        _1546 = _1560;
        _1548 = _1562;
    }
    float _1564 = _1542;
    float _1566 = _1544;
    float _1568 = _1546;
    float _1570 = _1548;
    float _1572 = _1502;
    float _1574 = _1504;
    float _1576 = _1506;
    float _1578 = _1508;
    if (_1536)
    {
        float _1580 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _1582 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _1584 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _1586 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        _1572 = _1580;
        _1574 = _1582;
        _1576 = _1584;
        _1578 = _1586;
    }
    float _1588 = _1572;
    float _1590 = _1574;
    float _1592 = _1576;
    float _1594 = _1578;
    float _1596 = _1510;
    float _1598 = _1512;
    float _1600 = _1514;
    float _1602 = _1516;
    if (_1536)
    {
        float _1604 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _1606 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _1608 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _1610 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        _1596 = _1604;
        _1598 = _1606;
        _1600 = _1608;
        _1602 = _1610;
    }
    float _1612 = _1596;
    float _1614 = _1598;
    float _1616 = _1600;
    float _1618 = _1602;
    float _1620 = _278 + _1518;
    float _1622 = _282 + _1520;
    float _1624 = _284 + _1522;
    if (!_1536)
    {
        _1550 = 0.0;
    }
    float _1626 = _1550;
    float _1628 = _1626;
    if (!_1536)
    {
        _1552 = 0.0;
    }
    float _1630 = _1552;
    float _1632 = _1630;
    if (!_1536)
    {
        _1554 = 0.0;
    }
    float _1634 = _1554;
    int _1636 = as_type<int>(_1532) & 2048;
    bool _1638 = _1636 != 0;
    float _1640 = _1634;
    if (_1536)
    {
        float _1642 = _1620 * _1566;
        _312 = _1642;
    }
    float _1644 = _312;
    float _1646 = _1590;
    float _1648 = _1644;
    float _1650 = _1614;
    float _1652 = _1612;
    float _1654 = _1592;
    if (_1536)
    {
        float _1656 = _1620 * _1590;
        _1646 = _1656;
    }
    float _1658 = _1646;
    float _1660 = _1658;
    if (_1536)
    {
        float _1662 = fma(_1622, _1564, _1644);
        _1648 = _1662;
    }
    float _1664 = _1648;
    float _1666 = _1664;
    if (_1536)
    {
        float _1668 = _1620 * _1614;
        _1650 = _1668;
    }
    float _1670 = _1650;
    if (_1536)
    {
        float _1672 = fma(_1622, _1588, _1658);
        _1660 = _1672;
    }
    float _1674 = _1660;
    if (_1536)
    {
        float _1676 = fma(_1624, _1568, _1664);
        _1666 = _1676;
    }
    float _1678 = _1666;
    if (_1536)
    {
        float _1680 = fma(_1622, _1612, _1670);
        _1652 = _1680;
    }
    float _1682 = _1652;
    float _1684 = _1682;
    if (_1536)
    {
        float _1686 = fma(_1624, _1592, _1674);
        _1654 = _1686;
    }
    float _1688 = _1654;
    if (_1536)
    {
        float _1690 = _1570 + _1678;
        _1628 = _1690;
    }
    float _1692 = _1628;
    float _1694 = _1692;
    if (_1536)
    {
        float _1696 = fma(_1624, _1616, _1682);
        _1684 = _1696;
    }
    float _1698 = _1684;
    if (_1536)
    {
        float _1700 = _1594 + _1688;
        _1632 = _1700;
    }
    float _1702 = _1632;
    float _1704 = _1702;
    if (_1536)
    {
        float _1706 = _1618 + _1698;
        _1640 = _1706;
    }
    float _1708 = _1640;
    bool _1710 = !_1540;
    float _1712 = _1708;
    if (!_1710)
    {
        float _1714 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        uint _1716 = uint(int(uint(_170) >> uint(2)));
        float _1718 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1716)]);
        int _1720 = _170 + 4;
        uint _1722 = uint(int(uint(_1720) >> uint(2)));
        float _1724 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1722)]);
        int _1726 = _170 + 8;
        uint _1728 = uint(int(uint(_1726) >> uint(2)));
        float _1730 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1728)]);
        uint _1732 = uint(int(uint(_170) >> uint(2)));
        float _1734 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1732)]);
        int _1736 = _170 + 4;
        uint _1738 = uint(int(uint(_1736) >> uint(2)));
        float _1740 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1738)]);
        int _1742 = _170 + 8;
        uint _1744 = uint(int(uint(_1742) >> uint(2)));
        float _1746 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1744)]);
        uint _1748 = uint(int(uint(_170) >> uint(2)));
        float _1750 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1748)]);
        int _1752 = _170 + 4;
        uint _1754 = uint(int(uint(_1752) >> uint(2)));
        float _1756 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1754)]);
        int _1758 = _170 + 8;
        uint _1760 = uint(int(uint(_1758) >> uint(2)));
        float _1762 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1760)]);
        float _1764 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        float _1766 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        float _1768 = _1620 * _1724;
        float _1770 = _1620 * _1740;
        float _1772 = _1620 * _1756;
        float _1774 = fma(_1622, _1718, _1768);
        float _1776 = fma(_1622, _1734, _1770);
        float _1778 = fma(_1622, _1750, _1772);
        float _1780 = fma(_1624, _1730, _1774);
        float _1782 = fma(_1624, _1746, _1776);
        float _1784 = fma(_1624, _1762, _1778);
        float _1786 = _1714 + _1780;
        float _1788 = _1764 + _1782;
        float _1790 = _1766 + _1784;
        _1704 = _1788;
        _1694 = _1786;
        _1712 = _1790;
    }
    float _1792 = _1704;
    float _1794 = _1694;
    float _1796 = _1712;
    bool _1798 = !_1638;
    float _1800 = _1792;
    float _1802 = _1794;
    float _1804 = _1796;
    if (!_1798)
    {
        uint _1806 = uint(int(uint(_170) >> uint(2)));
        float _1808 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1806)]);
        int _1810 = _170 + 4;
        uint _1812 = uint(int(uint(_1810) >> uint(2)));
        float _1814 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1812)]);
        int _1816 = _170 + 8;
        uint _1818 = uint(int(uint(_1816) >> uint(2)));
        float _1820 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1818)]);
        int _1822 = _170 + 12;
        uint _1824 = uint(int(uint(_1822) >> uint(2)));
        float _1826 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1824)]);
        uint _1828 = uint(int(uint(_170) >> uint(2)));
        float _1830 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1828)]);
        int _1832 = _170 + 4;
        uint _1834 = uint(int(uint(_1832) >> uint(2)));
        float _1836 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1834)]);
        int _1838 = _170 + 8;
        uint _1840 = uint(int(uint(_1838) >> uint(2)));
        float _1842 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1840)]);
        int _1844 = _170 + 12;
        uint _1846 = uint(int(uint(_1844) >> uint(2)));
        float _1848 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1846)]);
        uint _1850 = uint(int(uint(_170) >> uint(2)));
        float _1852 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1850)]);
        int _1854 = _170 + 4;
        uint _1856 = uint(int(uint(_1854) >> uint(2)));
        float _1858 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1856)]);
        int _1860 = _170 + 8;
        uint _1862 = uint(int(uint(_1860) >> uint(2)));
        float _1864 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1862)]);
        int _1866 = _170 + 12;
        uint _1868 = uint(int(uint(_1866) >> uint(2)));
        float _1870 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1868)]);
        float _1872 = _1620 * _1814;
        float _1874 = _1620 * _1836;
        float _1876 = _1620 * _1858;
        float _1878 = fma(_1622, _1808, _1872);
        float _1880 = fma(_1622, _1830, _1874);
        float _1882 = fma(_1622, _1852, _1876);
        float _1884 = fma(_1624, _1820, _1878);
        float _1886 = fma(_1624, _1842, _1880);
        float _1888 = fma(_1624, _1864, _1882);
        float _1890 = _1884 + _1826;
        float _1892 = _1886 + _1848;
        float _1894 = _1888 + _1870;
        _1800 = _1892;
        _1802 = _1890;
        _1804 = _1894;
    }
    float _1896 = _1800;
    float _1898 = _1802;
    float _1900 = _1804;
    float _1902 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[8]);
    float _1904 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[9]);
    float _1906 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[10]);
    float _1908 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[11]);
    float _1910 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[61]);
    float _1912 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[60]);
    float _1914 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[70]);
    float _1916 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[504]);
    float _1918 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[505]);
    float _1920 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[506]);
    float _1922 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[507]);
    float _1924 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[501]);
    float _1926 = _1904 * _1896;
    float _1928 = fma(_1902, _1898, _1926);
    float _1930 = fma(_1906, _1900, _1928);
    float _1932 = _1908 + _1930;
    float _1934 = -_1932;
    bool _1936 = _1910 >= _1934;
    bool _1938 = isnan(_1910);
    bool _1940 = _1936 || _1938;
    bool _1942 = isnan(_1934);
    bool _1944 = _1940 || _1942;
    float _1946 = -_1932;
    bool _1948 = _1912 >= _1946;
    bool _1950 = isnan(_1912);
    bool _1952 = _1948 || _1950;
    bool _1954 = isnan(_1946);
    bool _1956 = _1952 || _1954;
    int _1958 = _1944 ? 0 : 1;
    int _1960 = 2;
    if (_1944)
    {
        _1960 = 1;
    }
    int _1962 = _1960;
    int _1964 = _1962;
    if (_1956)
    {
        _1964 = _1958;
    }
    int _1966 = _1964;
    int _1968 = _1966 << 6;
    int _1970 = _1968 + 96;
    uint _1972 = uint(int(uint(_1970) >> uint(2)));
    float _1974 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1972)]);
    int _1976 = _1970 + 4;
    uint _1978 = uint(int(uint(_1976) >> uint(2)));
    float _1980 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1978)]);
    int _1982 = _1970 + 8;
    uint _1984 = uint(int(uint(_1982) >> uint(2)));
    float _1986 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1984)]);
    int _1988 = _1970 + 12;
    uint _1990 = uint(int(uint(_1988) >> uint(2)));
    float _1992 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1990)]);
    int _1994 = _1968 + 48;
    int _1996 = _1968 + 64;
    uint _1998 = uint(int(uint(_1994) >> uint(2)));
    float _2000 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1998)]);
    int _2002 = _1994 + 4;
    uint _2004 = uint(int(uint(_2002) >> uint(2)));
    float _2006 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_2004)]);
    int _2008 = _1994 + 8;
    uint _2010 = uint(int(uint(_2008) >> uint(2)));
    float _2012 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_2010)]);
    int _2014 = _1994 + 12;
    uint _2016 = uint(int(uint(_2014) >> uint(2)));
    float _2018 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_2016)]);
    uint _2020 = uint(int(uint(_1996) >> uint(2)));
    float _2022 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_2020)]);
    int _2024 = _1996 + 4;
    uint _2026 = uint(int(uint(_2024) >> uint(2)));
    float _2028 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_2026)]);
    int _2030 = _1996 + 8;
    uint _2032 = uint(int(uint(_2030) >> uint(2)));
    float _2034 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_2032)]);
    int _2036 = _1996 + 12;
    uint _2038 = uint(int(uint(_2036) >> uint(2)));
    float _2040 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_2038)]);
    int _2042 = _1968 + 80;
    float _2044 = _1914 + 1.0;
    float _2046 = _2044 + _1896;
    uint _2048 = uint(int(uint(_2042) >> uint(2)));
    float _2050 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_2048)]);
    int _2052 = _2042 + 4;
    uint _2054 = uint(int(uint(_2052) >> uint(2)));
    float _2056 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_2054)]);
    int _2058 = _2042 + 8;
    uint _2060 = uint(int(uint(_2058) >> uint(2)));
    float _2062 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_2060)]);
    int _2064 = _2042 + 12;
    uint _2066 = uint(int(uint(_2064) >> uint(2)));
    float _2068 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_2066)]);
    float _2070 = _2046 * _1918;
    float _2072 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[502]);
    float _2074 = fma(_1916, _1898, _2070);
    float _2076 = fma(_1920, _1900, _2074);
    float _2078 = _1922 + _2076;
    float _2080 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[508]);
    float _2082 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[509]);
    float _2084 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[510]);
    float _2086 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[511]);
    float _2088 = trunc(_2078);
    int _2090 = int(_2088);
    int _2092 = ~as_type<int>(_1924);
    int _2094 = _2090 + _2092;
    int _2096 = _2094 + 1;
    bool _2098 = _2096 >= 0;
    int _2100 = _2090;
    float _2102 = as_type<float>(_1966);
    if (_2098)
    {
        float _2104 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[500]);
        _2100 = as_type<int>(_2104);
    }
    int _2106 = _2100;
    float _2108 = _2046 * _1980;
    float _2110 = fma(_1974, _1898, _2108);
    float _2112 = fma(_1986, _1900, _2110);
    float _2114 = _1992 + _2112;
    float _2116 = _2046 * _2006;
    float _2118 = 1.0 / _2114;
    float _2120 = fma(_2000, _1898, _2116);
    float _2122 = _2046 * _2028;
    float _2124 = fma(_2012, _1900, _2120);
    float _2126 = fma(_2022, _1898, _2122);
    float _2128 = _2018 + _2124;
    float _2130 = fma(_2034, _1900, _2126);
    float _2132 = _2128 * _2118;
    float _2134 = _2040 + _2130;
    bool _2136 = _2132 >= 0.0;
    float _2138 = _2134 * _2118;
    bool _2140 = _2132 <= 1.0;
    bool _2142 = _2140 && _2136;
    bool _2144 = _2138 >= 0.0;
    bool _2146 = _2144 && _2142;
    bool _2148 = _2138 <= 1.0;
    bool _2150 = _2148 && _2146;
    float _2152 = _2046 * _2056;
    float _2154 = fma(_2050, _1898, _2152);
    if (_2150)
    {
        float _2156 = float(_1966);
        _2102 = _2156;
    }
    float _2158 = _2102;
    float _2160 = fma(_2062, _1900, _2154);
    float _2162 = _2158;
    if (_2150)
    {
        float _2164 = rint(_2158);
        float _2166 = precise::max(_2164, 0.0);
        uint _2168 = uint(_2166);
        uint _2170 = clamp(_2168, 0u, 65535u);
        _2162 = as_type<float>(_2170);
    }
    float _2172 = _2162;
    float _2174 = _2068 + _2160;
    float _2176 = _2174 * _2118;
    float _2178 = _2138;
    if (_2150)
    {
        float3 _5924 = float3(_2132, _2138, float(as_type<int>(_2172)));
        float3 _5926 = select(_5924, float3(0.0), isnan(_5924));
        float _2180 = spvDepthCast(spvDescriptorSet0.cp_t_tcb_16).sample_compare(spvDescriptorSet0.cp_t_tcb_16Smplr, _5926.xy, uint(rint(_5926.z)), _2176, level(0.0));
        _2178 = _2180;
    }
    float _2182 = _2178;
    float _2184 = _2046 * _2082;
    float _2186 = fma(_2080, _1898, _2184);
    float _2188 = fma(_2084, _1900, _2186);
    float _2190 = _2086 + _2188;
    float _2192 = trunc(_2190);
    int _2194 = int(_2192);
    bool _2196 = _2106 <= _2096;
    bool _2198 = !_2098;
    bool _2200 = _2196 || _2198;
    int _2202 = ~as_type<int>(_2072);
    int _2204 = _2194 + _2202;
    int _2206 = _2204 + 1;
    bool _2208 = _2206 < 0;
    bool _2210 = _2208 || _2200;
    float _2212 = _2186;
    float _2214 = as_type<float>(_2194);
    if (!_2210)
    {
        float _2216 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[500]);
        _2212 = _2216;
    }
    float _2218 = _2212;
    bool _2220 = as_type<int>(_2218) <= _2206;
    bool _2222 = _2220 || _2210;
    float _2224 = _2218;
    if (_2222)
    {
        _2214 = 1.0;
    }
    float _2226 = _2214;
    float _2228 = _2226;
    if (!_2222)
    {
        float _2230 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[500]);
        int _2232 = _2206 * as_type<int>(_2230);
        int _2234 = _2232 + _2096;
        int _2236 = _2234 << 2;
        uint _2238 = uint(int(uint(_2234) >> uint(2)));
        int _2240 = 12 & _2236;
        int _2242 = int(_2238) << 4;
        int _2244 = _2242 + _2240;
        int _2246 = _2244 + 400;
        uint _2248 = uint(int(uint(_2246) >> uint(2)));
        float _2250 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_2248)]);
        float _2252 = floor(_2190);
        float _2254 = floor(_2078);
        float _2256 = -_2252;
        float _2258 = _2190 + _2256;
        float _2260 = -_2254;
        float _2262 = _2078 + _2260;
        float _2264 = rint(_2250);
        float _2266 = precise::max(_2264, 0.0);
        uint _2268 = uint(_2266);
        uint _2270 = clamp(_2268, 0u, 65535u);
        float3 _6061 = float3(_2262, _2258, float(int(_2270)));
        float3 _6063 = select(_6061, float3(0.0), isnan(_6061));
        float _2272 = dm_bs(spvDescriptorSet0.cp_t_tcb_14.sample(spvDescriptorSet0.cp_t_tcb_14Smplr, _6063.xy, uint(rint(_6063.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_14, spvDescriptorSet0.cp_t_tcb_14Smplr_w, _6063.xy, uint(rint(_6063.z)), level(0.0)).x;
        int _2274 = _2234 << 4;
        int _2276 = _2274 + 2048;
        uint _2278 = uint(int(uint(_2276) >> uint(2)));
        float _2280 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_2278)]);
        int _2282 = _2276 + 4;
        uint _2284 = uint(int(uint(_2282) >> uint(2)));
        float _2286 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_2284)]);
        int _2288 = _2276 + 8;
        uint _2290 = uint(int(uint(_2288) >> uint(2)));
        float _2292 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_2290)]);
        int _2294 = _2276 + 12;
        uint _2296 = uint(int(uint(_2294) >> uint(2)));
        float _2298 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_2296)]);
        float _2300 = _2046 * _2286;
        float _2302 = fma(_2280, _1898, _2300);
        float _2304 = fma(_2292, _1900, _2302);
        float _2306 = _2298 + _2304;
        float _2308 = precise::clamp(_2306, 0.0, 1.0);
        float _2310 = -_2308;
        float _2312 = _2310 + _2272;
        float _2314 = fma(_2312, 500.0, 1.5);
        float _2316 = exp2(_2314);
        float _2318 = 0.0 + _2316;
        float _2320 = precise::clamp(_2318, 0.0, 1.0);
        _2224 = _2250;
        _2228 = _2320;
    }
    float _2322 = _2224;
    float _2324 = _2228;
    uint _2326 = uint(int(uint(_170) >> uint(2)));
    float _2328 = as_type<float>((*spvDescriptorSet0.cp_s13)._m0[int(_2326)]);
    float _2330 = _2322;
    if (!_2150)
    {
        _2330 = 1.0;
    }
    float _2332 = _2330;
    bool _2334 = _296 > 0.001000000047497451305389404296875;
    bool _2336 = isnan(_296);
    bool _2338 = _2334 || _2336;
    bool _2340 = isnan(0.001000000047497451305389404296875);
    bool _2342 = _2338 || _2340;
    float _2344 = _2332;
    if (_2150)
    {
        bool _2346 = _2182 >= _2176;
        bool _2348 = isnan(_2182);
        bool _2350 = _2346 || _2348;
        bool _2352 = isnan(_2176);
        bool _2354 = _2350 || _2352;
        float _2356 = float(_2354);
        _2344 = _2356;
    }
    float _2358 = _2344;
    float _2360 = -_226;
    float _2362 = _2360 + _1624;
    float _2364 = -_2358;
    float _2366 = fma(_2364, _2324, 1.0);
    int _2368 = _170 + 8;
    float _2370 = -_2328;
    float _2372 = _2366 + _2370;
    float _2374 = _2366;
    if (_2342)
    {
        float _2376 = fma(_2372, 0.0500000007450580596923828125, _2328);
        _2374 = _2376;
    }
    float _2378 = _2374;
    float _2380 = -_214;
    float _2382 = _2380 + _1622;
    float _2384 = precise::max(0.0, _2378);
    float _2386 = precise::min(_2384, 0.999000012874603271484375);
    float _2388 = -_220;
    float _2390 = _2388 + _1620;
    int _2392 = _170 + 4;
    uint _2394 = uint(int(uint(_170) >> uint(2)));
    (*spvDescriptorSet0.cp_s13)._m0[int(_2394)] = as_type<uint>(_2386);
    uint _2396 = uint(int(uint(_178) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2396)] = as_type<uint>(_1110);
    uint _2398 = uint(int(uint(_170) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2398)] = as_type<uint>(_1622);
    uint _2400 = uint(int(uint(_2392) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2400)] = as_type<uint>(_1620);
    uint _2402 = uint(int(uint(_2368) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2402)] = as_type<uint>(_1624);
    uint _2404 = uint(int(uint(_170) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_2404)] = as_type<uint>(_1116);
    uint _2406 = uint(int(uint(_2392) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_2406)] = as_type<uint>(_1112);
    uint _2408 = uint(int(uint(_2368) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_2408)] = as_type<uint>(_1114);
    uint _2410 = uint(int(uint(_170) >> uint(2)));
    (*spvDescriptorSet0.cp_s6)._m0[int(_2410)] = as_type<uint>(_2382);
    uint _2412 = uint(int(uint(_2392) >> uint(2)));
    (*spvDescriptorSet0.cp_s6)._m0[int(_2412)] = as_type<uint>(_2390);
    uint _2414 = uint(int(uint(_2368) >> uint(2)));
    (*spvDescriptorSet0.cp_s6)._m0[int(_2414)] = as_type<uint>(_2362);
    float _2416 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _2418 = _2390 * _2390;
    float _2420 = _1112 * _1112;
    float _2422 = fma(_2382, _2382, _2418);
    float _2424 = fma(_1116, _1116, _2420);
    float _2426 = fma(_2362, _2362, _2422);
    float _2428 = fma(_1114, _1114, _2424);
    float _2430 = sqrt(_2428);
    float _2432 = sqrt(_2426);
    bool _2434 = _2432 >= 9.9999999747524270787835121154785e-07;
    bool _2436 = isnan(_2432);
    bool _2438 = _2434 || _2436;
    bool _2440 = isnan(9.9999999747524270787835121154785e-07);
    bool _2442 = _2438 || _2440;
    float _2444 = _2432;
    if (!_2442)
    {
        bool _2446 = _228 != _232;
        bool _2448 = isnan(_228);
        bool _2450 = _2446 || _2448;
        bool _2452 = isnan(_232);
        bool _2454 = _2450 || _2452;
        _2456 = _2454;
        if (!_2456)
        {
            float _2458 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
            bool _2460 = _2458 > 0.0;
            bool _2462 = !_2460;
            if (!_2462)
            {
                float _2464 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
                float _2466 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
                float _2468 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
                float _2470 = _2466 * _2466;
                float _2472 = fma(_2464, _2464, _2470);
                float _2474 = fma(_2468, _2468, _2472);
                float _2476 = rsqrt(_2474);
                float _2478 = _2476 * 9.9999999747524270787835121154785e-07;
                float _2480 = _2464 * _2478;
                float _2482 = _2466 * _2478;
                float _2484 = _2468 * _2478;
                _346 = as_type<int>(_2480);
                _348 = as_type<int>(_2482);
                _350 = as_type<int>(_2484);
                _2456 = true;
            }
            else
            {
                bool _2486 = _2430 >= 9.9999999747524270787835121154785e-07;
                bool _2488 = isnan(_2430);
                bool _2490 = _2486 || _2488;
                bool _2492 = isnan(9.9999999747524270787835121154785e-07);
                bool _2494 = _2490 || _2492;
                if (!_2494)
                {
                    float _2496 = _1620 * _1620;
                    float _2498 = fma(_1622, _1622, _2496);
                    float _2500 = fma(_1624, _1624, _2498);
                    float _2502 = sqrt(_2500);
                    bool _2504 = _2502 >= 9.9999999747524270787835121154785e-07;
                    bool _2506 = isnan(_2502);
                    bool _2508 = _2504 || _2506;
                    bool _2510 = isnan(9.9999999747524270787835121154785e-07);
                    bool _2512 = _2508 || _2510;
                    int _2514 = as_type<int>(_248);
                    int _2516 = as_type<int>(_2502);
                    if (_2512)
                    {
                        float _2518 = rsqrt(_2500);
                        _2514 = as_type<int>(_2518);
                    }
                    int _2520 = _2514;
                    if (!_2512)
                    {
                        _2516 = 0;
                    }
                    int _2522 = _2516;
                    int _2524 = _2522;
                    if (!_2512)
                    {
                        _340 = 897988541;
                    }
                    int _2526 = _340;
                    int _2528 = _2520;
                    int _2530 = _2526;
                    if (_2512)
                    {
                        float _2532 = as_type<float>(_2520) * 9.9999999747524270787835121154785e-07;
                        _2444 = _2532;
                    }
                    float _2534 = _2444;
                    if (!_2512)
                    {
                        _2528 = 0;
                    }
                    int _2536 = _2528;
                    int _2538 = _2536;
                    if (_2512)
                    {
                        float _2540 = _1622 * _2534;
                        _2524 = as_type<int>(_2540);
                    }
                    int _2542 = _2524;
                    _346 = _2542;
                    if (_2512)
                    {
                        float _2544 = _1620 * _2534;
                        _2530 = as_type<int>(_2544);
                    }
                    int _2546 = _2530;
                    _348 = _2546;
                    if (_2512)
                    {
                        float _2548 = _1624 * _2534;
                        _2538 = as_type<int>(_2548);
                    }
                    int _2550 = _2538;
                    _350 = _2550;
                    _2456 = true;
                }
                else
                {
                    float _2552 = rsqrt(_2428);
                    float _2554 = _2552 * 9.9999999747524270787835121154785e-07;
                    float _2556 = _1116 * _2554;
                    float _2558 = _1112 * _2554;
                    float _2560 = _1114 * _2554;
                    _346 = as_type<int>(_2556);
                    _348 = as_type<int>(_2558);
                    _350 = as_type<int>(_2560);
                    _2456 = true;
                }
            }
        }
    }
    else
    {
        float _2562 = _2430 * _2416;
        bool _2564 = _2562 >= 0.001000000047497451305389404296875;
        bool _2566 = isnan(_2562);
        bool _2568 = _2564 || _2566;
        bool _2570 = isnan(0.001000000047497451305389404296875);
        bool _2572 = _2568 || _2570;
        bool _2574 = _2562 > 0.0;
        bool _2576 = !_2572;
        bool _2578 = _2574 && _2576;
        bool _2580 = _2432 < 0.001000000047497451305389404296875;
        bool _2582 = _2580 && _2578;
        int _2584 = as_type<int>(_2562);
        if (!_2582)
        {
            _2584 = as_type<int>(_2382);
        }
        int _2586 = _2584;
        int _2588 = _2586;
        if (_2582)
        {
            float _2590 = _1116 * _2416;
            _2588 = as_type<int>(_2590);
        }
        int _2592 = _2588;
        _346 = _2592;
        if (!_2582)
        {
            _342 = as_type<int>(_2390);
        }
        int _2594 = _342;
        int _2596 = _2594;
        if (_2582)
        {
            float _2598 = _1112 * _2416;
            _2596 = as_type<int>(_2598);
        }
        int _2600 = _2596;
        _348 = _2600;
        if (!_2582)
        {
            _344 = as_type<int>(_2362);
        }
        int _2602 = _344;
        _350 = _2602;
        if (_2582)
        {
            float _2604 = _1114 * _2416;
            _350 = as_type<int>(_2604);
        }
    }
    _2456 = false;
    int _2606 = _346;
    int _2608 = _348;
    int _2610 = _350;
    uint _2612 = uint(int(uint(_170) >> uint(2)));
    (*spvDescriptorSet0.cp_s6)._m0[int(_2612)] = uint(_2606);
    uint _2614 = uint(int(uint(_2392) >> uint(2)));
    (*spvDescriptorSet0.cp_s6)._m0[int(_2614)] = uint(_2608);
    uint _2616 = uint(int(uint(_2368) >> uint(2)));
    (*spvDescriptorSet0.cp_s6)._m0[int(_2616)] = uint(_2610);
}

