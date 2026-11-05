#pragma clang diagnostic ignored "-Wmissing-prototypes"
#pragma clang diagnostic ignored "-Wmissing-braces"

#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

template<typename T, size_t Num>
struct spvUnsafeArray
{
    T elements[Num ? Num : 1];
    
    thread T& operator [] (size_t pos) thread
    {
        return elements[pos];
    }
    constexpr const thread T& operator [] (size_t pos) const thread
    {
        return elements[pos];
    }
    
    device T& operator [] (size_t pos) device
    {
        return elements[pos];
    }
    constexpr const device T& operator [] (size_t pos) const device
    {
        return elements[pos];
    }
    
    constexpr const constant T& operator [] (size_t pos) const constant
    {
        return elements[pos];
    }
    
    threadgroup T& operator [] (size_t pos) threadgroup
    {
        return elements[pos];
    }
    constexpr const threadgroup T& operator [] (size_t pos) const threadgroup
    {
        return elements[pos];
    }
};

struct _10
{
    uint _m0;
    uint4 _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float4 _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct _29
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* cp_c4 [[id(1)]];
    constant _16* cp_c5 [[id(2)]];
    constant _16* cp_c6 [[id(3)]];
    constant _16* cp_c3 [[id(4)]];
    device _29* cp_s0 [[id(5)]];
    texture2d_array<float> cp_t_tcb_8 [[id(6)]];
    sampler cp_t_tcb_8Smplr [[id(7)]];
    texture2d_array<float> cp_t_tcb_A [[id(8)]];
    sampler cp_t_tcb_ASmplr [[id(9)]];
};

static inline __attribute__((always_inline))
int _58(thread const int& _5659, thread const int& _5660, constant _10& support_buffer)
{
    int _5663 = 1 + _5660;
    float _5665 = support_buffer._m5[_5663].x;
    bool _5667 = _5665 == 1.0;
    if (_5667)
    {
        return _5659;
    }
    float _5669 = float(_5659);
    float _5671 = _5669 * _5665;
    int _5673 = int(_5671);
    return _5673;
}

static inline __attribute__((always_inline))
void _56(thread const int& _5347, thread const int& _5348, thread const int& _5349, thread const int& _5350, thread int& _5351, thread int& _5352, thread int& _5353, thread int& _5354, thread int& _5355, thread int& _5356)
{
    float _5359 = as_type<float>(_5348) + 0.0;
    bool _5361 = _5359 != 0.0;
    bool _5363 = isnan(_5359);
    bool _5365 = _5361 || _5363;
    bool _5367 = isnan(0.0);
    bool _5369 = _5365 || _5367;
    int _5371 = as_type<int>(_5359);
    int _5373 = _5348;
    int _5375 = _5349;
    int _5377 = _5369 ? (-1) : 0;
    if (!_5369)
    {
        float _5379 = as_type<float>(_5348) * 1.0;
        _5371 = as_type<int>(_5379);
    }
    int _5381 = _5371;
    bool _5383 = !_5369;
    int _5385 = _5381;
    if (!_5383)
    {
        float _5387 = as_type<float>(_5348) + 0.0;
        bool _5389 = _5387 >= 0.0;
        bool _5391 = isnan(_5387);
        bool _5393 = _5389 || _5391;
        bool _5395 = isnan(0.0);
        bool _5397 = _5393 || _5395;
        int _5399 = as_type<int>(_5387);
        _5377 = _5397 ? (-1) : 0;
        if (!_5397)
        {
            _5399 = 2147483647;
        }
        int _5401 = _5399;
        bool _5403 = !_5397;
        _5385 = _5401;
        if (!_5403)
        {
            float _5405 = as_type<float>(_5348) + 0.0;
            bool _5407 = _5405 > as_type<float>(0x7f800000u /* inf */);
            bool _5409 = isnan(_5405);
            bool _5411 = _5407 || _5409;
            bool _5413 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _5415 = _5411 || _5413;
            int _5417 = as_type<int>(_5405);
            _5377 = _5415 ? (-1) : 0;
            if (_5415)
            {
                float _5419 = as_type<float>(_5348) + 1.0;
                _5417 = as_type<int>(_5419);
            }
            int _5421 = _5417;
            _5385 = _5421;
            if (!_5415)
            {
                float _5423 = 0.0 + as_type<float>(_5348);
                bool _5425 = _5423 != as_type<float>(0x7f800000u /* inf */);
                bool _5427 = isnan(_5423);
                bool _5429 = _5425 || _5427;
                bool _5431 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _5433 = _5429 || _5431;
                int _5435 = as_type<int>(_5423);
                _5377 = _5433 ? (-1) : 0;
                if (!_5433)
                {
                    _5435 = _5348;
                }
                int _5437 = _5435;
                bool _5439 = !_5433;
                _5385 = _5437;
                if (!_5439)
                {
                    float _5441 = as_type<float>(_5348) * 18446744073709551616.0;
                    float _5443 = rsqrt(_5441);
                    float _5445 = _5441 * _5443;
                    float _5447 = _5443 * 0.5;
                    float _5449 = -_5445;
                    float _5451 = 0.0 + _5449;
                    float _5453 = fma(_5447, _5451, 0.5);
                    float _5455 = fma(_5445, _5453, _5445);
                    float _5457 = -_5455;
                    float _5459 = 0.0 + _5457;
                    float _5461 = fma(_5455, _5459, _5441);
                    float _5463 = fma(_5447, _5461, _5455);
                    float _5465 = _5463 * 2.3283064365386962890625e-10;
                    _5385 = as_type<int>(_5465);
                    _5373 = as_type<int>(_5451);
                    _5375 = as_type<int>(_5455);
                }
            }
        }
    }
    int _5467 = _5385;
    int _5469 = _5373;
    int _5471 = _5375;
    int _5473 = _5377;
    _5351 = _5467;
    _5352 = _5350;
    _5353 = 0;
    _5354 = _5469;
    _5355 = _5471;
    _5356 = _5473;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 dm_ntg [[threadgroups_per_grid]], device uchar* dm_tg [[buffer(30)]])
{
    ulong dm_tgbase = ulong(((gl_WorkGroupID.z * dm_ntg.y + gl_WorkGroupID.y) * dm_ntg.x + gl_WorkGroupID.x) % 512u) * 49152ul;
    device spvUnsafeArray<uint, 12288>& _37 = *(device spvUnsafeArray<uint, 12288>*)(dm_tg + dm_tgbase + 0);
    bool _1362 = false;
    bool _1172 = false;
    bool _762 = false;
    float _62 = as_type<float>(gl_WorkGroupID.x);
    float _64 = as_type<float>(gl_LocalInvocationID.x);
    int _66 = as_type<int>(_62) << 6;
    int _68 = _66 + as_type<int>(_64);
    bool _72 = uint(_68) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].z);
    if (_72)
    {
        return;
    }
    bool _74 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _76 = _68 + as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].w);
    int _78 = _76 << 4;
    bool _80 = !_74;
    if (!_80)
    {
        int _82 = 0;
        int _84 = 0;
        int _86 = 0;
        float _88 = 0.0;
        float _90 = 0.0;
        float _92 = 0.0;
        int _94 = 0;
        float _96 = 0.0;
        float _98 = 0.0;
        float _100 = 0.0;
        int _102 = 0;
        int _104 = 0;
        int _106 = 0;
        int _108 = 0;
        int _110 = 0;
        float _112 = 0.0;
        float _114 = 0.0;
        float _116 = 0.0;
        float _118 = 0.0;
        int _120 = 0;
        int _122 = 0;
        int _124 = 0;
        int _126 = 0;
        int _128 = 0;
        int _746;
        int _748;
        int _750;
        int _752;
        int _754;
        int _756;
        float _758;
        float _760;
        float _1138;
        float _1140;
        float _1142;
        float _1144;
        float _1146;
        float _1148;
        float _1150;
        float _1152;
        float _1154;
        float _1156;
        float _1158;
        float _1160;
        float _1162;
        float _1164;
        int _1166;
        int _1168;
        int _1170;
        do
        {
            int _130 = _82;
            int _132 = _84;
            int _134 = _86;
            float _136 = _88;
            float _138 = _90;
            float _140 = _92;
            int _142 = _94;
            float _144 = _96;
            float _146 = _98;
            float _148 = _100;
            int _150 = _102;
            int _152 = _104;
            int _154 = _106;
            int _156 = _108;
            int _158 = _110;
            float _160 = _112;
            float _162 = _114;
            float _164 = _116;
            float _166 = _118;
            int _168 = _120;
            int _170 = _122;
            int _172 = _124;
            int _174 = _126;
            int _176 = _128;
            uint _179 = uint(int(uint(_78) >> uint(2)));
            uint _181 = uint(int(uint(int(_179)) >> uint(2)));
            int _183 = int(_179) & 3;
            float _185 = (*spvDescriptorSet0.cp_c4)._m0[int(_181)][_183];
            int _187 = _130 & 31;
            bool _189 = _187 == 0;
            bool _191 = uint(_187) < 32u;
            int _193 = 32 - _187;
            int _195 = _187 - 32;
            int _197 = 1 << _187;
            uint _199 = uint(int(uint(0) >> uint(_193)));
            int _201 = _197 | int(_199);
            int _203 = _189 ? 1 : _201;
            bool _205 = uint(_195) < 32u;
            int _207 = 0 << _195;
            int _209 = _205 ? _207 : 0;
            int _211 = _191 ? _203 : _209;
            int _213 = as_type<int>(_185) * 48;
            int _215 = _213 + 32;
            uint _217 = uint(int(uint(_215) >> uint(2)));
            uint _219 = uint(int(uint(int(_217)) >> uint(2)));
            int _221 = int(_217) & 3;
            float _223 = (*spvDescriptorSet0.cp_c5)._m0[int(_219)][_221];
            int _225 = _213 + 36;
            uint _227 = uint(int(uint(_225) >> uint(2)));
            uint _229 = uint(int(uint(int(_227)) >> uint(2)));
            int _231 = int(_227) & 3;
            float _233 = (*spvDescriptorSet0.cp_c5)._m0[int(_229)][_231];
            int _235 = _211 & as_type<int>(_223);
            bool _237 = _235 != 0;
            int _239 = _211 & as_type<int>(_233);
            bool _241 = _239 != 0;
            float _243 = _146;
            float _245 = _160;
            float _247 = _138;
            float _249 = _140;
            float _251 = _162;
            float _253 = _164;
            float _255 = _166;
            float _257 = _144;
            float _259 = _136;
            float _261 = _148;
            int _263 = _132;
            int _265 = _134;
            int _267 = _142;
            int _269 = _150;
            int _271 = _152;
            int _273 = _154;
            int _275 = _156;
            int _277 = _158;
            int _279 = _168;
            int _281 = _170;
            int _283 = _172;
            int _285 = _174;
            int _287 = _176;
            if (!_237)
            {
                _243 = 0.0;
                _245 = 0.0;
            }
            float _289 = _243;
            float _291 = _245;
            float _293 = _289;
            float _295 = _291;
            if (!_237)
            {
                _247 = 0.0;
                _249 = 0.0;
            }
            float _297 = _247;
            float _299 = _249;
            float _301 = _297;
            float _303 = _299;
            if (!_237)
            {
                _251 = 0.0;
            }
            float _305 = _251;
            float _307 = _305;
            if (!_237)
            {
                _253 = 0.0;
                _255 = 0.0;
            }
            float _309 = _253;
            float _311 = _255;
            float _313 = _309;
            float _315 = _311;
            if (!_237)
            {
                _257 = 0.0;
            }
            float _317 = _257;
            float _319 = _317;
            if (!_237)
            {
                _259 = 0.0;
            }
            float _321 = _259;
            float _323 = _321;
            if (!_237)
            {
                _261 = 0.0;
            }
            float _325 = _261;
            bool _327 = !_237;
            float _329 = _325;
            if (!_327)
            {
                uint _331 = uint(int(uint(_213) >> uint(2)));
                uint _333 = uint(int(uint(int(_331)) >> uint(2)));
                int _335 = int(_331) & 3;
                float _337 = (*spvDescriptorSet0.cp_c5)._m0[int(_333)][_335];
                int _339 = int(_331) + 1;
                uint _341 = uint(int(uint(_339) >> uint(2)));
                int _343 = _339 & 3;
                float _345 = (*spvDescriptorSet0.cp_c5)._m0[int(_341)][_343];
                int _347 = _130;
                int _349 = 0;
                int _351 = _58(_347, _349, (*spvDescriptorSet0.support_buffer));
                int _353 = as_type<int>(_337);
                int _355 = 0;
                int _357 = _58(_353, _355, (*spvDescriptorSet0.support_buffer));
                int3 _2476 = int3(_351, _357, 1);
                float4 _360 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2476.xy), uint(_2476.z), 0).xyzw;
                float _362 = _360.x;
                float _364 = _360.y;
                float _366 = _360.z;
                float _368 = _360.w;
                int _370 = _130;
                int _372 = 0;
                int _374 = _58(_370, _372, (*spvDescriptorSet0.support_buffer));
                int _376 = as_type<int>(_345);
                int _378 = 0;
                int _380 = _58(_376, _378, (*spvDescriptorSet0.support_buffer));
                int3 _2496 = int3(_374, _380, 1);
                float4 _382 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2496.xy), uint(_2496.z), 0).xyzw;
                float _384 = _382.x;
                float _386 = _382.y;
                float _388 = _382.z;
                float _390 = _382.w;
                int _392 = _130;
                int _394 = 0;
                int _396 = _58(_392, _394, (*spvDescriptorSet0.support_buffer));
                int _398 = as_type<int>(_337);
                int _400 = 0;
                int _402 = _58(_398, _400, (*spvDescriptorSet0.support_buffer));
                int3 _2516 = int3(_396, _402, 0);
                float3 _406 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2516.xy), uint(_2516.z), 0).xyz;
                float _408 = _406.x;
                float _410 = _406.y;
                float _412 = _406.z;
                int _414 = _130;
                int _416 = 0;
                int _418 = _58(_414, _416, (*spvDescriptorSet0.support_buffer));
                int _420 = as_type<int>(_345);
                int _422 = 0;
                int _424 = _58(_420, _422, (*spvDescriptorSet0.support_buffer));
                int3 _2534 = int3(_418, _424, 0);
                float3 _426 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2534.xy), uint(_2534.z), 0).xyz;
                float _428 = _426.x;
                float _430 = _426.y;
                float _432 = _426.z;
                int _434 = _130;
                int _436 = 0;
                int _438 = _58(_434, _436, (*spvDescriptorSet0.support_buffer));
                int _440 = as_type<int>(_337);
                int _442 = 0;
                int _444 = _58(_440, _442, (*spvDescriptorSet0.support_buffer));
                int3 _2552 = int3(_438, _444, 2);
                float3 _446 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2552.xy), uint(_2552.z), 0).xyz;
                float _448 = _446.x;
                float _450 = _446.y;
                float _452 = _446.z;
                int _454 = _130;
                int _456 = 0;
                int _458 = _58(_454, _456, (*spvDescriptorSet0.support_buffer));
                int _460 = as_type<int>(_345);
                int _462 = 0;
                int _464 = _58(_460, _462, (*spvDescriptorSet0.support_buffer));
                int3 _2570 = int3(_458, _464, 2);
                float3 _466 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2570.xy), uint(_2570.z), 0).xyz;
                float _468 = _466.x;
                float _470 = _466.y;
                float _472 = _466.z;
                int _474 = _213 + 16;
                uint _476 = uint(int(uint(_474) >> uint(2)));
                uint _478 = uint(int(uint(int(_476)) >> uint(2)));
                int _480 = int(_476) & 3;
                float _482 = (*spvDescriptorSet0.cp_c5)._m0[int(_478)][_480];
                float _484 = -_362;
                float _486 = _484 + _384;
                float _488 = -_368;
                float _490 = _488 + _390;
                float _492 = -_408;
                float _494 = _492 + _428;
                float _496 = -_364;
                float _498 = _496 + _386;
                float _500 = fma(_486, _482, _362);
                float _502 = -_410;
                float _504 = _502 + _430;
                float _506 = fma(_494, _482, _408);
                float _508 = -_366;
                float _510 = _508 + _388;
                float _512 = -_412;
                float _514 = _512 + _432;
                float _516 = fma(_504, _482, _410);
                float _518 = -_448;
                float _520 = _518 + _468;
                float _522 = -_450;
                float _524 = _522 + _470;
                float _526 = -_452;
                float _528 = _526 + _472;
                float _530 = fma(_498, _482, _364);
                float _532 = fma(_510, _482, _366);
                float _534 = fma(_490, _482, _368);
                float _536 = fma(_514, _482, _412);
                float _538 = fma(_520, _482, _448);
                float _540 = fma(_524, _482, _450);
                float _542 = fma(_528, _482, _452);
                _263 = as_type<int>(_337);
                _265 = as_type<int>(_345);
                _301 = _542;
                _303 = _516;
                _267 = as_type<int>(_482);
                _319 = _530;
                _293 = _500;
                _323 = _532;
                _329 = _534;
                _295 = _506;
                _307 = _536;
                _313 = _538;
                _315 = _540;
            }
            int _544 = _263;
            int _546 = _265;
            float _548 = _301;
            float _550 = _303;
            int _552 = _267;
            float _554 = _319;
            float _556 = _293;
            float _558 = _323;
            float _560 = _329;
            float _562 = _295;
            float _564 = _307;
            float _566 = _313;
            float _568 = _315;
            bool _570 = !_241;
            _90 = _548;
            int _572 = _544;
            int _574 = _546;
            float _576 = _550;
            int _578 = _552;
            float _580 = _562;
            float _582 = _562;
            float _584 = _550;
            if (!_570)
            {
                int _586 = _213 + 8;
                uint _588 = uint(int(uint(_586) >> uint(2)));
                uint _590 = uint(int(uint(int(_588)) >> uint(2)));
                int _592 = int(_588) & 3;
                float _594 = (*spvDescriptorSet0.cp_c5)._m0[int(_590)][_592];
                int _596 = int(_588) + 1;
                uint _598 = uint(int(uint(_596) >> uint(2)));
                int _600 = _596 & 3;
                float _602 = (*spvDescriptorSet0.cp_c5)._m0[int(_598)][_600];
                int _604 = _130;
                int _606 = 1;
                int _608 = _58(_604, _606, (*spvDescriptorSet0.support_buffer));
                int _610 = as_type<int>(_594);
                int _612 = 1;
                int _614 = _58(_610, _612, (*spvDescriptorSet0.support_buffer));
                int3 _2771 = int3(_608, _614, 1);
                float4 _616 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2771.xy), uint(_2771.z), 0).xyzw;
                float _618 = _616.x;
                float _620 = _616.y;
                float _622 = _616.z;
                float _624 = _616.w;
                int _626 = _130;
                int _628 = 1;
                int _630 = _58(_626, _628, (*spvDescriptorSet0.support_buffer));
                int _632 = as_type<int>(_602);
                int _634 = 1;
                int _636 = _58(_632, _634, (*spvDescriptorSet0.support_buffer));
                int3 _2791 = int3(_630, _636, 1);
                float4 _638 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2791.xy), uint(_2791.z), 0).xyzw;
                float _640 = _638.x;
                float _642 = _638.y;
                float _644 = _638.z;
                float _646 = _638.w;
                int _648 = _213 + 24;
                uint _650 = uint(int(uint(_648) >> uint(2)));
                uint _652 = uint(int(uint(int(_650)) >> uint(2)));
                int _654 = int(_650) & 3;
                float _656 = (*spvDescriptorSet0.cp_c5)._m0[int(_652)][_654];
                float _658 = -_620;
                float _660 = _658 + _642;
                float _662 = -_618;
                float _664 = _662 + _640;
                float _666 = fma(_660, _656, _620);
                float _668 = fma(_664, _656, _618);
                float _670 = -_622;
                float _672 = _670 + _644;
                float _674 = -_624;
                float _676 = _674 + _646;
                float _678 = _666 * _554;
                float _680 = fma(_672, _656, _622);
                float _682 = fma(_676, _656, _624);
                float _684 = fma(_668, _556, _678);
                float _686 = fma(_680, _558, _684);
                float _688 = fma(_682, _560, _686);
                float _690 = precise::max(_688, -1.0);
                float _692 = precise::min(_690, 1.0);
                bool _694 = _692 >= 0.0;
                bool _696 = isnan(_692);
                bool _698 = _694 || _696;
                bool _700 = isnan(0.0);
                bool _702 = _698 || _700;
                bool _704 = !_702;
                float _706 = -_692;
                float _708 = _704 ? _706 : _692;
                bool _710 = _708 < 0.0;
                float _712 = float(_710);
                float _714 = abs(_708);
                float _716 = -_714;
                float _718 = _716 + 1.0;
                float _720 = abs(_708);
                float _722 = fma(_720, -0.0187292993068695068359375, 0.074261002242565155029296875);
                int _724 = as_type<int>(_718) + (-218103808);
                float _726 = abs(_708);
                float _728 = fma(_726, _722, -0.212114393711090087890625);
                bool _730 = uint(_724) >= 1920991232u;
                float _732 = abs(_708);
                float _734 = fma(_732, _728, 1.570728778839111328125);
                bool _736 = !_730;
                _283 = as_type<int>(_668);
                _285 = as_type<int>(_666);
                _287 = as_type<int>(_680);
                if (!_736)
                {
                    int _738 = as_type<int>(_708);
                    int _740 = as_type<int>(_718);
                    int _742 = as_type<int>(_664);
                    int _744 = 1664;
                    _56(_738, _740, _742, _744, _746, _748, _750, _752, _754, _756);
                    _758 = as_type<float>(_746);
                    _760 = as_type<float>(_748);
                    _762 = true;
                }
                else
                {
                    float _764 = rsqrt(_718);
                    float _766 = _718 * _764;
                    float _768 = _764 * 0.5;
                    float _770 = -_766;
                    float _772 = 0.0 + _770;
                    float _774 = fma(_768, _772, 0.5);
                    float _776 = fma(_766, _774, _766);
                    float _778 = -_776;
                    float _780 = 0.0 + _778;
                    float _782 = fma(_776, _780, _718);
                    float _784 = fma(_768, _782, _776);
                    _758 = _784;
                    _760 = _782;
                }
                _762 = false;
                float _786 = _758;
                float _788 = _760;
                int _790 = _213 + 8;
                uint _792 = uint(int(uint(_790) >> uint(2)));
                uint _794 = uint(int(uint(int(_792)) >> uint(2)));
                int _796 = int(_792) & 3;
                float _798 = (*spvDescriptorSet0.cp_c5)._m0[int(_794)][_796];
                int _800 = int(_792) + 1;
                uint _802 = uint(int(uint(_800) >> uint(2)));
                int _804 = _800 & 3;
                float _806 = (*spvDescriptorSet0.cp_c5)._m0[int(_802)][_804];
                int _808 = _130;
                int _810 = 1;
                int _812 = _58(_808, _810, (*spvDescriptorSet0.support_buffer));
                int _814 = as_type<int>(_798);
                int _816 = 1;
                int _818 = _58(_814, _816, (*spvDescriptorSet0.support_buffer));
                int3 _3032 = int3(_812, _818, 0);
                float3 _820 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_3032.xy), uint(_3032.z), 0).xyz;
                float _822 = _820.x;
                float _824 = _820.y;
                float _826 = _820.z;
                int _828 = _130;
                int _830 = 1;
                int _832 = _58(_828, _830, (*spvDescriptorSet0.support_buffer));
                int _834 = as_type<int>(_798);
                int _836 = 1;
                int _838 = _58(_834, _836, (*spvDescriptorSet0.support_buffer));
                int3 _3050 = int3(_832, _838, 2);
                float3 _840 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_3050.xy), uint(_3050.z), 0).xyz;
                float _842 = _840.x;
                float _844 = _840.y;
                float _846 = _840.z;
                int _848 = _130;
                int _850 = 1;
                int _852 = _58(_848, _850, (*spvDescriptorSet0.support_buffer));
                int _854 = as_type<int>(_806);
                int _856 = 1;
                int _858 = _58(_854, _856, (*spvDescriptorSet0.support_buffer));
                int3 _3068 = int3(_852, _858, 0);
                float3 _860 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_3068.xy), uint(_3068.z), 0).xyz;
                float _862 = _860.x;
                float _864 = _860.y;
                float _866 = _860.z;
                int _868 = _130;
                int _870 = 1;
                int _872 = _58(_868, _870, (*spvDescriptorSet0.support_buffer));
                int _874 = as_type<int>(_806);
                int _876 = 1;
                int _878 = _58(_874, _876, (*spvDescriptorSet0.support_buffer));
                int3 _3086 = int3(_872, _878, 2);
                float3 _880 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_3086.xy), uint(_3086.z), 0).xyz;
                float _882 = _880.x;
                float _884 = _880.y;
                float _886 = _880.z;
                float _888 = _734 * _786;
                float _890 = _712 * 2.0;
                int _892 = _213 + 24;
                uint _894 = uint(int(uint(_892) >> uint(2)));
                uint _896 = uint(int(uint(int(_894)) >> uint(2)));
                int _898 = int(_894) & 3;
                float _900 = (*spvDescriptorSet0.cp_c5)._m0[int(_896)][_898];
                float _902 = -_890;
                float _904 = fma(_888, _902, _888);
                float _906 = fma(_712, 3.1415927410125732421875, _904);
                int _908 = _213 + 20;
                uint _910 = uint(int(uint(_908) >> uint(2)));
                uint _912 = uint(int(uint(int(_910)) >> uint(2)));
                int _914 = int(_910) & 3;
                float _916 = (*spvDescriptorSet0.cp_c5)._m0[int(_912)][_914];
                float _918 = _906 * 0.15915493667125701904296875;
                float _920 = _918 * 6.283185482025146484375;
                float _922 = sin(_920);
                float _924 = abs(_922);
                bool _926 = _924 >= 0.001000000047497451305389404296875;
                bool _928 = isnan(_924);
                bool _930 = _926 || _928;
                bool _932 = isnan(0.001000000047497451305389404296875);
                bool _934 = _930 || _932;
                float _936 = _734;
                float _938 = _788;
                float _940 = _888;
                _269 = as_type<int>(_798);
                _271 = as_type<int>(_806);
                if (!_934)
                {
                    int _942 = _213 + 28;
                    uint _944 = uint(int(uint(_942) >> uint(2)));
                    uint _946 = uint(int(uint(int(_944)) >> uint(2)));
                    int _948 = int(_944) & 3;
                    float _950 = (*spvDescriptorSet0.cp_c5)._m0[int(_946)][_948];
                    _936 = _950;
                }
                float _952 = _936;
                float _954 = _952;
                if (!_934)
                {
                    float _956 = -_952;
                    float _958 = _956 + 1.0;
                    _938 = _958;
                }
                float _960 = _938;
                float _962 = _960;
                if (!_934)
                {
                    _940 = _952;
                }
                float _964 = _940;
                bool _966 = !_934;
                float _968 = _964;
                _574 = as_type<int>(_844);
                _578 = as_type<int>(_882);
                _275 = as_type<int>(_900);
                _277 = as_type<int>(_916);
                _279 = as_type<int>(_884);
                if (!_966)
                {
                    int _970 = _213 + 28;
                    uint _972 = uint(int(uint(_970) >> uint(2)));
                    uint _974 = uint(int(uint(int(_972)) >> uint(2)));
                    int _976 = int(_972) & 3;
                    float _978 = (*spvDescriptorSet0.cp_c5)._m0[int(_974)][_976];
                    float _980 = 1.0 / _922;
                    float _982 = _906 * _978;
                    float _984 = _982 * 0.15915493667125701904296875;
                    float _986 = -_982;
                    float _988 = _906 + _986;
                    float _990 = _988 * 0.15915493667125701904296875;
                    float _992 = _984 * 6.283185482025146484375;
                    float _994 = sin(_992);
                    float _996 = _990 * 6.283185482025146484375;
                    float _998 = sin(_996);
                    float _1000 = _994 * _980;
                    float _1002 = _998 * _980;
                    _968 = _1000;
                    _962 = _1002;
                    _954 = _978;
                }
                float _1004 = _968;
                float _1006 = _962;
                float _1008 = _954;
                bool _1010 = !_702;
                float _1012 = -_1004;
                float _1014 = _1010 ? _1012 : _1004;
                float _1016 = -_826;
                float _1018 = _1016 + _866;
                float _1020 = -_846;
                float _1022 = _1020 + _886;
                float _1024 = _682 * _1014;
                float _1026 = _668 * _1014;
                float _1028 = _680 * _1014;
                float _1030 = _666 * _1014;
                float _1032 = fma(_560, _1006, _1024);
                float _1034 = fma(_556, _1006, _1026);
                float _1036 = fma(_558, _1006, _1028);
                float _1038 = fma(_554, _1006, _1030);
                float _1040 = _1032 * 2.0;
                float _1042 = _1034 * 2.0;
                float _1044 = fma(_1018, _900, _826);
                float _1046 = _1038 * 2.0;
                float _1048 = _1036 * _1040;
                float _1050 = _1038 * _1040;
                float _1052 = _1034 * _1040;
                float _1054 = _1034 * _1034;
                float _1056 = -_1048;
                float _1058 = fma(_1038, _1042, _1056);
                float _1060 = fma(_1038, _1042, _1048);
                float _1062 = fma(_1036, _1042, _1050);
                float _1064 = -_1050;
                float _1066 = fma(_1036, _1042, _1064);
                float _1068 = -_1052;
                float _1070 = fma(_1036, _1046, _1068);
                float _1072 = fma(_1036, _1046, _1052);
                float _1074 = _1038 * _1038;
                float _1076 = _1036 * _1036;
                float _1078 = -_822;
                float _1080 = _1078 + _862;
                float _1082 = -_824;
                float _1084 = _1082 + _864;
                float _1086 = fma(_1074, -2.0, 1.0);
                float _1088 = fma(_1054, -2.0, 1.0);
                float _1090 = fma(_1080, _900, _822);
                float _1092 = fma(_1084, _900, _824);
                float _1094 = fma(_1076, -2.0, _1086);
                float _1096 = fma(_1076, -2.0, _1088);
                float _1098 = fma(_1074, -2.0, _1088);
                float _1100 = -_842;
                float _1102 = _1100 + _882;
                float _1104 = -_844;
                float _1106 = _1104 + _884;
                float _1108 = _1090 * _1008;
                float _1110 = fma(_1022, _900, _846);
                float _1112 = fma(_1102, _900, _842);
                float _1114 = fma(_1106, _900, _844);
                float _1116 = fma(_562, _916, _1108);
                float _1118 = _1092 * _1008;
                float _1120 = _1044 * _1008;
                float _1122 = _1112 * _1008;
                float _1124 = _1114 * _1008;
                float _1126 = _1110 * _1008;
                float _1128 = fma(_550, _916, _1118);
                float _1130 = fma(_564, _916, _1120);
                float _1132 = fma(_566, _916, _1122);
                float _1134 = fma(_568, _916, _1124);
                float _1136 = fma(_548, _916, _1126);
                _572 = as_type<int>(_1122);
                _1138 = _1094;
                _576 = _1128;
                _1140 = _1062;
                _1142 = _1130;
                _1144 = _1096;
                _273 = as_type<int>(_1110);
                _580 = _1116;
                _582 = _1116;
                _1146 = _1066;
                _1148 = _1094;
                _1150 = _1060;
                _584 = _1128;
                _1152 = _1058;
                _1154 = _1096;
                _1156 = _1072;
                _1158 = _1130;
                _1160 = _1062;
                _1162 = _1070;
                _1164 = _1098;
                _1166 = as_type<int>(_1132);
                _1168 = as_type<int>(_1134);
                _1170 = as_type<int>(_1136);
                _281 = as_type<int>(_1008);
                _1172 = true;
            }
            else
            {
                float _1174 = _560 * 2.0;
                float _1176 = _554 * _554;
                float _1178 = _556 * _556;
                float _1180 = _556 * 2.0;
                float _1182 = _1174 * _558;
                float _1184 = _1174 * _554;
                float _1186 = _1174 * _556;
                float _1188 = _554 * 2.0;
                float _1190 = _558 * _558;
                float _1192 = fma(_1176, -2.0, 1.0);
                float _1194 = -_1182;
                float _1196 = fma(_1180, _554, _1194);
                float _1198 = fma(_1180, _554, _1182);
                float _1200 = fma(_1178, -2.0, 1.0);
                float _1202 = fma(_1180, _558, _1184);
                float _1204 = -_1184;
                float _1206 = fma(_1180, _558, _1204);
                float _1208 = -_1186;
                float _1210 = fma(_1188, _558, _1208);
                float _1212 = fma(_1188, _558, _1186);
                float _1214 = fma(_1190, -2.0, _1192);
                float _1216 = fma(_1190, -2.0, _1200);
                float _1218 = fma(_1176, -2.0, _1200);
                _1138 = _1214;
                _1140 = _1202;
                _1142 = _564;
                _1144 = _1216;
                _1146 = _1206;
                _1148 = _1214;
                _1150 = _1198;
                _1152 = _1196;
                _1154 = _1216;
                _1156 = _1212;
                _1158 = _564;
                _1160 = _1202;
                _1162 = _1210;
                _1164 = _1218;
                _1166 = as_type<int>(_566);
                _1168 = as_type<int>(_568);
                _1170 = as_type<int>(_548);
            }
            _1172 = false;
            int _1220 = _572;
            int _1222 = _574;
            float _1224 = _1138;
            float _1226 = _576;
            int _1228 = _578;
            float _1230 = _1140;
            float _1232 = _1142;
            float _1234 = _1144;
            int _1236 = _269;
            int _1238 = _271;
            int _1240 = _273;
            int _1242 = _275;
            int _1244 = _277;
            float _1246 = _580;
            float _1248 = _582;
            float _1250 = _1146;
            float _1252 = _1148;
            float _1254 = _1150;
            float _1256 = _584;
            float _1258 = _1152;
            float _1260 = _1154;
            float _1262 = _1156;
            float _1264 = _1158;
            float _1266 = _1160;
            float _1268 = _1162;
            float _1270 = _1164;
            int _1272 = _1166;
            int _1274 = _1168;
            int _1276 = _1170;
            int _1278 = _279;
            int _1280 = _281;
            int _1282 = _283;
            int _1284 = _285;
            int _1286 = _287;
            float _1288 = _1248 * _1250;
            int _1290 = _68 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
            int _1292 = _1290 + _130;
            float _1294 = _1248 * _1252;
            float _1296 = _1248 * _1254;
            float _1298 = _1256 * _1258;
            float _1300 = _1256 * _1260;
            float _1302 = _1256 * _1262;
            float _1304 = _1264 * _1266;
            int _1306 = _1292 * 48;
            float _1308 = _1264 * _1268;
            float _1310 = _1264 * _1270;
            int _1312 = _130 + 1;
            uint _1314 = uint(int(uint(_1306) >> uint(2)));
            _37[int(_1314)] = as_type<uint>(_1294);
            int _1316 = _1306 + 4;
            uint _1318 = uint(int(uint(_1316) >> uint(2)));
            _37[int(_1318)] = as_type<uint>(_1298);
            int _1320 = _1306 + 8;
            uint _1322 = uint(int(uint(_1320) >> uint(2)));
            _37[int(_1322)] = as_type<uint>(_1304);
            int _1324 = _1306 + 12;
            uint _1326 = uint(int(uint(_1324) >> uint(2)));
            _37[int(_1326)] = uint(_1272);
            bool _1328 = uint(_1312) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
            int _1330 = _1306 + 16;
            uint _1332 = uint(int(uint(_1330) >> uint(2)));
            _37[int(_1332)] = as_type<uint>(_1296);
            int _1334 = _1306 + 20;
            uint _1336 = uint(int(uint(_1334) >> uint(2)));
            _37[int(_1336)] = as_type<uint>(_1300);
            int _1338 = _1306 + 24;
            uint _1340 = uint(int(uint(_1338) >> uint(2)));
            _37[int(_1340)] = as_type<uint>(_1308);
            int _1342 = _1306 + 28;
            uint _1344 = uint(int(uint(_1342) >> uint(2)));
            _37[int(_1344)] = uint(_1274);
            int _1346 = _1306 + 32;
            uint _1348 = uint(int(uint(_1346) >> uint(2)));
            _37[int(_1348)] = as_type<uint>(_1288);
            int _1350 = _1306 + 36;
            uint _1352 = uint(int(uint(_1350) >> uint(2)));
            _37[int(_1352)] = as_type<uint>(_1302);
            int _1354 = _1306 + 40;
            uint _1356 = uint(int(uint(_1354) >> uint(2)));
            _37[int(_1356)] = as_type<uint>(_1310);
            int _1358 = _1306 + 44;
            uint _1360 = uint(int(uint(_1358) >> uint(2)));
            _37[int(_1360)] = uint(_1276);
            _82 = _1312;
            _84 = _1220;
            _86 = _1222;
            _88 = _1224;
            _92 = _1226;
            _94 = _1228;
            _96 = _1230;
            _98 = _1232;
            _100 = _1234;
            _102 = _1236;
            _104 = _1238;
            _106 = _1240;
            _108 = _1242;
            _110 = _1244;
            _112 = _1246;
            _114 = _1308;
            _116 = _1300;
            _118 = _1296;
            _120 = _1278;
            _122 = _1280;
            _124 = _1282;
            _126 = _1284;
            _128 = _1286;
            if (_1328)
            {
                _1362 = true;
                if (_1362)
                {
                    break;
                }
            }
        } while (true);
    }
    _1362 = false;
    bool _1364 = 1u < as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    bool _1366 = !_1364;
    if (!_1366)
    {
        int _1368 = 1;
        bool _1370;
        do
        {
            int _1372 = _1368;
            int _1374 = _1372 * 112;
            int _1376 = _68 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
            int _1378 = _1376 + _1372;
            int _1380 = _1372 + 1;
            uint _1382 = uint(int(uint(_1374) >> uint(2)));
            uint _1384 = uint(int(uint(int(_1382)) >> uint(2)));
            int _1386 = int(_1382) & 3;
            float _1388 = (*spvDescriptorSet0.cp_c6)._m0[int(_1384)][_1386];
            int _1390 = _1378 * 48;
            bool _1392 = uint(_1380) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
            int _1394 = _1390 + 16;
            uint _1396 = uint(int(uint(_1394) >> uint(2)));
            float _1398 = as_type<float>(_37[int(_1396)]);
            int _1400 = _1390 + 20;
            uint _1402 = uint(int(uint(_1400) >> uint(2)));
            float _1404 = as_type<float>(_37[int(_1402)]);
            int _1406 = _1390 + 24;
            uint _1408 = uint(int(uint(_1406) >> uint(2)));
            float _1410 = as_type<float>(_37[int(_1408)]);
            int _1412 = _1390 + 28;
            uint _1414 = uint(int(uint(_1412) >> uint(2)));
            float _1416 = as_type<float>(_37[int(_1414)]);
            int _1418 = _1390 + 32;
            uint _1420 = uint(int(uint(_1418) >> uint(2)));
            float _1422 = as_type<float>(_37[int(_1420)]);
            int _1424 = _1390 + 36;
            uint _1426 = uint(int(uint(_1424) >> uint(2)));
            float _1428 = as_type<float>(_37[int(_1426)]);
            int _1430 = _1390 + 40;
            uint _1432 = uint(int(uint(_1430) >> uint(2)));
            float _1434 = as_type<float>(_37[int(_1432)]);
            int _1436 = _1390 + 44;
            uint _1438 = uint(int(uint(_1436) >> uint(2)));
            float _1440 = as_type<float>(_37[int(_1438)]);
            int _1442 = _68 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
            int _1444 = _1442 + as_type<int>(_1388);
            int _1446 = _1444 * 48;
            uint _1448 = uint(int(uint(_1390) >> uint(2)));
            float _1450 = as_type<float>(_37[int(_1448)]);
            int _1452 = _1390 + 4;
            uint _1454 = uint(int(uint(_1452) >> uint(2)));
            float _1456 = as_type<float>(_37[int(_1454)]);
            int _1458 = _1390 + 8;
            uint _1460 = uint(int(uint(_1458) >> uint(2)));
            float _1462 = as_type<float>(_37[int(_1460)]);
            int _1464 = _1390 + 12;
            uint _1466 = uint(int(uint(_1464) >> uint(2)));
            float _1468 = as_type<float>(_37[int(_1466)]);
            uint _1470 = uint(int(uint(_1446) >> uint(2)));
            float _1472 = as_type<float>(_37[int(_1470)]);
            int _1474 = _1446 + 4;
            uint _1476 = uint(int(uint(_1474) >> uint(2)));
            float _1478 = as_type<float>(_37[int(_1476)]);
            int _1480 = _1446 + 8;
            uint _1482 = uint(int(uint(_1480) >> uint(2)));
            float _1484 = as_type<float>(_37[int(_1482)]);
            int _1486 = _1446 + 12;
            uint _1488 = uint(int(uint(_1486) >> uint(2)));
            float _1490 = as_type<float>(_37[int(_1488)]);
            int _1492 = _1446 + 16;
            uint _1494 = uint(int(uint(_1492) >> uint(2)));
            float _1496 = as_type<float>(_37[int(_1494)]);
            int _1498 = _1446 + 20;
            uint _1500 = uint(int(uint(_1498) >> uint(2)));
            float _1502 = as_type<float>(_37[int(_1500)]);
            int _1504 = _1446 + 24;
            uint _1506 = uint(int(uint(_1504) >> uint(2)));
            float _1508 = as_type<float>(_37[int(_1506)]);
            int _1510 = _1446 + 28;
            uint _1512 = uint(int(uint(_1510) >> uint(2)));
            float _1514 = as_type<float>(_37[int(_1512)]);
            int _1516 = _1446 + 32;
            uint _1518 = uint(int(uint(_1516) >> uint(2)));
            float _1520 = as_type<float>(_37[int(_1518)]);
            int _1522 = _1446 + 36;
            uint _1524 = uint(int(uint(_1522) >> uint(2)));
            float _1526 = as_type<float>(_37[int(_1524)]);
            int _1528 = _1446 + 40;
            uint _1530 = uint(int(uint(_1528) >> uint(2)));
            float _1532 = as_type<float>(_37[int(_1530)]);
            int _1534 = _1446 + 44;
            uint _1536 = uint(int(uint(_1534) >> uint(2)));
            float _1538 = as_type<float>(_37[int(_1536)]);
            float _1540 = _1416 * _1478;
            float _1542 = _1404 * _1478;
            float _1544 = _1398 * _1478;
            float _1546 = _1410 * _1478;
            float _1548 = fma(_1468, _1472, _1540);
            float _1550 = fma(_1456, _1472, _1542);
            float _1552 = fma(_1450, _1472, _1544);
            float _1554 = fma(_1462, _1472, _1546);
            float _1556 = fma(_1440, _1484, _1548);
            float _1558 = fma(_1428, _1484, _1550);
            float _1560 = _1404 * _1502;
            float _1562 = _1398 * _1502;
            float _1564 = _1490 + _1556;
            float _1566 = _1416 * _1502;
            float _1568 = _1410 * _1502;
            float _1570 = fma(_1456, _1496, _1560);
            float _1572 = fma(_1422, _1484, _1552);
            float _1574 = fma(_1468, _1496, _1566);
            float _1576 = fma(_1462, _1496, _1568);
            float _1578 = fma(_1428, _1508, _1570);
            float _1580 = _1416 * _1526;
            float _1582 = _1398 * _1526;
            float _1584 = _1404 * _1526;
            float _1586 = _1410 * _1526;
            float _1588 = fma(_1468, _1520, _1580);
            float _1590 = fma(_1450, _1496, _1562);
            float _1592 = fma(_1440, _1508, _1574);
            float _1594 = fma(_1450, _1520, _1582);
            float _1596 = fma(_1456, _1520, _1584);
            float _1598 = fma(_1462, _1520, _1586);
            float _1600 = fma(_1440, _1532, _1588);
            float _1602 = fma(_1422, _1508, _1590);
            float _1604 = fma(_1434, _1484, _1554);
            float _1606 = fma(_1434, _1508, _1576);
            float _1608 = _1514 + _1592;
            float _1610 = fma(_1422, _1532, _1594);
            float _1612 = fma(_1428, _1532, _1596);
            float _1614 = fma(_1434, _1532, _1598);
            float _1616 = _1538 + _1600;
            uint _1618 = uint(int(uint(_1390) >> uint(2)));
            _37[int(_1618)] = as_type<uint>(_1572);
            int _1620 = _1390 + 4;
            uint _1622 = uint(int(uint(_1620) >> uint(2)));
            _37[int(_1622)] = as_type<uint>(_1558);
            int _1624 = _1390 + 8;
            uint _1626 = uint(int(uint(_1624) >> uint(2)));
            _37[int(_1626)] = as_type<uint>(_1604);
            int _1628 = _1390 + 12;
            uint _1630 = uint(int(uint(_1628) >> uint(2)));
            _37[int(_1630)] = as_type<uint>(_1564);
            int _1632 = _1390 + 16;
            uint _1634 = uint(int(uint(_1632) >> uint(2)));
            _37[int(_1634)] = as_type<uint>(_1602);
            int _1636 = _1390 + 20;
            uint _1638 = uint(int(uint(_1636) >> uint(2)));
            _37[int(_1638)] = as_type<uint>(_1578);
            int _1640 = _1390 + 24;
            uint _1642 = uint(int(uint(_1640) >> uint(2)));
            _37[int(_1642)] = as_type<uint>(_1606);
            int _1644 = _1390 + 28;
            uint _1646 = uint(int(uint(_1644) >> uint(2)));
            _37[int(_1646)] = as_type<uint>(_1608);
            int _1648 = _1390 + 32;
            uint _1650 = uint(int(uint(_1648) >> uint(2)));
            _37[int(_1650)] = as_type<uint>(_1610);
            int _1652 = _1390 + 36;
            uint _1654 = uint(int(uint(_1652) >> uint(2)));
            _37[int(_1654)] = as_type<uint>(_1612);
            int _1656 = _1390 + 40;
            uint _1658 = uint(int(uint(_1656) >> uint(2)));
            _37[int(_1658)] = as_type<uint>(_1614);
            int _1660 = _1390 + 44;
            uint _1662 = uint(int(uint(_1660) >> uint(2)));
            _37[int(_1662)] = as_type<uint>(_1616);
            _1370 = !_1392;
            _1368 = _1380;
        } while (_1370);
    }
    if (!_74)
    {
        return;
    }
    int _1664 = 0;
    bool _1666;
    do
    {
        int _1668 = _1664;
        int _1670 = _68 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
        int _1672 = _1670 + _1668;
        int _1674 = _1668 * 112;
        int _1676 = _1672 * 48;
        int _1678 = _1674 + 80;
        uint _1680 = uint(int(uint(_1678) >> uint(2)));
        uint _1682 = uint(int(uint(int(_1680)) >> uint(2)));
        int _1684 = int(_1680) & 3;
        float _1686 = (*spvDescriptorSet0.cp_c6)._m0[int(_1682)][_1684];
        int _1688 = int(_1680) + 1;
        uint _1690 = uint(int(uint(_1688) >> uint(2)));
        int _1692 = _1688 & 3;
        float _1694 = (*spvDescriptorSet0.cp_c6)._m0[int(_1690)][_1692];
        uint _1696 = uint(int(uint(_1676) >> uint(2)));
        float _1698 = as_type<float>(_37[int(_1696)]);
        int _1700 = _1676 + 4;
        uint _1702 = uint(int(uint(_1700) >> uint(2)));
        float _1704 = as_type<float>(_37[int(_1702)]);
        int _1706 = _1676 + 8;
        uint _1708 = uint(int(uint(_1706) >> uint(2)));
        float _1710 = as_type<float>(_37[int(_1708)]);
        int _1712 = _1676 + 12;
        uint _1714 = uint(int(uint(_1712) >> uint(2)));
        float _1716 = as_type<float>(_37[int(_1714)]);
        int _1718 = _1676 + 16;
        uint _1720 = uint(int(uint(_1718) >> uint(2)));
        float _1722 = as_type<float>(_37[int(_1720)]);
        int _1724 = _1676 + 20;
        uint _1726 = uint(int(uint(_1724) >> uint(2)));
        float _1728 = as_type<float>(_37[int(_1726)]);
        int _1730 = _1676 + 24;
        uint _1732 = uint(int(uint(_1730) >> uint(2)));
        float _1734 = as_type<float>(_37[int(_1732)]);
        int _1736 = _1676 + 28;
        uint _1738 = uint(int(uint(_1736) >> uint(2)));
        float _1740 = as_type<float>(_37[int(_1738)]);
        int _1742 = _1674 + 88;
        uint _1744 = uint(int(uint(_1742) >> uint(2)));
        uint _1746 = uint(int(uint(int(_1744)) >> uint(2)));
        int _1748 = int(_1744) & 3;
        float _1750 = (*spvDescriptorSet0.cp_c6)._m0[int(_1746)][_1748];
        int _1752 = int(_1744) + 1;
        uint _1754 = uint(int(uint(_1752) >> uint(2)));
        int _1756 = _1752 & 3;
        float _1758 = (*spvDescriptorSet0.cp_c6)._m0[int(_1754)][_1756];
        int _1760 = _1676 + 32;
        uint _1762 = uint(int(uint(_1760) >> uint(2)));
        float _1764 = as_type<float>(_37[int(_1762)]);
        int _1766 = _1676 + 36;
        uint _1768 = uint(int(uint(_1766) >> uint(2)));
        float _1770 = as_type<float>(_37[int(_1768)]);
        int _1772 = _1676 + 40;
        uint _1774 = uint(int(uint(_1772) >> uint(2)));
        float _1776 = as_type<float>(_37[int(_1774)]);
        int _1778 = _1676 + 44;
        uint _1780 = uint(int(uint(_1778) >> uint(2)));
        float _1782 = as_type<float>(_37[int(_1780)]);
        int _1784 = _1674 + 64;
        uint _1786 = uint(int(uint(_1784) >> uint(2)));
        uint _1788 = uint(int(uint(int(_1786)) >> uint(2)));
        int _1790 = int(_1786) & 3;
        float _1792 = (*spvDescriptorSet0.cp_c6)._m0[int(_1788)][_1790];
        int _1794 = int(_1786) + 1;
        uint _1796 = uint(int(uint(_1794) >> uint(2)));
        int _1798 = _1794 & 3;
        float _1800 = (*spvDescriptorSet0.cp_c6)._m0[int(_1796)][_1798];
        int _1802 = _1674 + 72;
        uint _1804 = uint(int(uint(_1802) >> uint(2)));
        uint _1806 = uint(int(uint(int(_1804)) >> uint(2)));
        int _1808 = int(_1804) & 3;
        float _1810 = (*spvDescriptorSet0.cp_c6)._m0[int(_1806)][_1808];
        int _1812 = int(_1804) + 1;
        uint _1814 = uint(int(uint(_1812) >> uint(2)));
        int _1816 = _1812 & 3;
        float _1818 = (*spvDescriptorSet0.cp_c6)._m0[int(_1814)][_1816];
        int _1820 = _1674 + 104;
        uint _1822 = uint(int(uint(_1820) >> uint(2)));
        uint _1824 = uint(int(uint(int(_1822)) >> uint(2)));
        int _1826 = int(_1822) & 3;
        float _1828 = (*spvDescriptorSet0.cp_c6)._m0[int(_1824)][_1826];
        int _1830 = int(_1822) + 1;
        uint _1832 = uint(int(uint(_1830) >> uint(2)));
        int _1834 = _1830 & 3;
        float _1836 = (*spvDescriptorSet0.cp_c6)._m0[int(_1832)][_1834];
        int _1838 = _1674 + 96;
        uint _1840 = uint(int(uint(_1838) >> uint(2)));
        uint _1842 = uint(int(uint(int(_1840)) >> uint(2)));
        int _1844 = int(_1840) & 3;
        float _1846 = (*spvDescriptorSet0.cp_c6)._m0[int(_1842)][_1844];
        int _1848 = int(_1840) + 1;
        uint _1850 = uint(int(uint(_1848) >> uint(2)));
        int _1852 = _1848 & 3;
        float _1854 = (*spvDescriptorSet0.cp_c6)._m0[int(_1850)][_1852];
        float _1856 = _1704 * _1686;
        float _1858 = _1704 * _1694;
        float _1860 = _1704 * _1750;
        float _1862 = _1704 * _1758;
        float _1864 = fma(_1698, _1792, _1856);
        float _1866 = fma(_1698, _1800, _1858);
        float _1868 = fma(_1698, _1810, _1860);
        float _1870 = fma(_1698, _1818, _1862);
        float _1872 = _1728 * _1686;
        float _1874 = _1728 * _1694;
        float _1876 = _1728 * _1750;
        float _1878 = _1728 * _1758;
        float _1880 = _1770 * _1686;
        float _1882 = fma(_1722, _1792, _1872);
        float _1884 = fma(_1722, _1800, _1874);
        float _1886 = fma(_1722, _1810, _1876);
        uint _1888 = uint(int(uint(_78) >> uint(2)));
        uint _1890 = uint(int(uint(int(_1888)) >> uint(2)));
        int _1892 = int(_1888) & 3;
        float _1894 = (*spvDescriptorSet0.cp_c4)._m0[int(_1890)][_1892];
        float _1896 = fma(_1722, _1818, _1878);
        float _1898 = _1770 * _1694;
        float _1900 = _1770 * _1750;
        float _1902 = _1770 * _1758;
        float _1904 = fma(_1764, _1792, _1880);
        float _1906 = fma(_1764, _1800, _1898);
        float _1908 = fma(_1764, _1810, _1900);
        int _1910 = _1674 + 16;
        uint _1912 = uint(int(uint(_1910) >> uint(2)));
        uint _1914 = uint(int(uint(int(_1912)) >> uint(2)));
        int _1916 = int(_1912) & 3;
        float _1918 = (*spvDescriptorSet0.cp_c6)._m0[int(_1914)][_1916];
        int _1920 = int(_1912) + 1;
        uint _1922 = uint(int(uint(_1920) >> uint(2)));
        int _1924 = _1920 & 3;
        float _1926 = (*spvDescriptorSet0.cp_c6)._m0[int(_1922)][_1924];
        float _1928 = fma(_1764, _1818, _1902);
        float _1930 = fma(_1734, _1836, _1896);
        float _1932 = fma(_1710, _1846, _1864);
        float _1934 = fma(_1710, _1854, _1866);
        float _1936 = fma(_1710, _1828, _1868);
        float _1938 = fma(_1710, _1836, _1870);
        float _1940 = fma(_1734, _1846, _1882);
        int _1942 = _1674 + 24;
        uint _1944 = uint(int(uint(_1942) >> uint(2)));
        uint _1946 = uint(int(uint(int(_1944)) >> uint(2)));
        int _1948 = int(_1944) & 3;
        float _1950 = (*spvDescriptorSet0.cp_c6)._m0[int(_1946)][_1948];
        int _1952 = int(_1944) + 1;
        uint _1954 = uint(int(uint(_1952) >> uint(2)));
        int _1956 = _1952 & 3;
        float _1958 = (*spvDescriptorSet0.cp_c6)._m0[int(_1954)][_1956];
        float _1960 = fma(_1734, _1854, _1884);
        float _1962 = fma(_1734, _1828, _1886);
        float _1964 = fma(_1776, _1846, _1904);
        float _1966 = fma(_1776, _1854, _1906);
        float _1968 = fma(_1776, _1836, _1928);
        float _1970 = fma(_1776, _1828, _1908);
        float _1972 = _1740 + _1930;
        int _1974 = _1674 + 32;
        uint _1976 = uint(int(uint(_1974) >> uint(2)));
        uint _1978 = uint(int(uint(int(_1976)) >> uint(2)));
        int _1980 = int(_1976) & 3;
        float _1982 = (*spvDescriptorSet0.cp_c6)._m0[int(_1978)][_1980];
        int _1984 = int(_1976) + 1;
        uint _1986 = uint(int(uint(_1984) >> uint(2)));
        int _1988 = _1984 & 3;
        float _1990 = (*spvDescriptorSet0.cp_c6)._m0[int(_1986)][_1988];
        float _1992 = _1782 + _1968;
        float _1994 = _1716 + _1938;
        int _1996 = _1674 + 48;
        uint _1998 = uint(int(uint(_1996) >> uint(2)));
        uint _2000 = uint(int(uint(int(_1998)) >> uint(2)));
        int _2002 = int(_1998) & 3;
        float _2004 = (*spvDescriptorSet0.cp_c6)._m0[int(_2000)][_2002];
        int _2006 = int(_1998) + 1;
        uint _2008 = uint(int(uint(_2006) >> uint(2)));
        int _2010 = _2006 & 3;
        float _2012 = (*spvDescriptorSet0.cp_c6)._m0[int(_2008)][_2010];
        float _2014 = _1940 * _1926;
        float _2016 = _1960 * _1926;
        float _2018 = _1972 * _1926;
        float _2020 = _1962 * _1926;
        float _2022 = fma(_1932, _1918, _2014);
        float _2024 = fma(_1934, _1918, _2016);
        float _2026 = fma(_1994, _1918, _2018);
        float _2028 = fma(_1936, _1918, _2020);
        int _2030 = _1674 + 40;
        uint _2032 = uint(int(uint(_2030) >> uint(2)));
        uint _2034 = uint(int(uint(int(_2032)) >> uint(2)));
        int _2036 = int(_2032) & 3;
        float _2038 = (*spvDescriptorSet0.cp_c6)._m0[int(_2034)][_2036];
        int _2040 = int(_2032) + 1;
        uint _2042 = uint(int(uint(_2040) >> uint(2)));
        int _2044 = _2040 & 3;
        float _2046 = (*spvDescriptorSet0.cp_c6)._m0[int(_2042)][_2044];
        float _2048 = fma(_1964, _1950, _2022);
        float _2050 = fma(_1992, _1950, _2026);
        float _2052 = fma(_1966, _1950, _2024);
        float _2054 = fma(_1970, _1950, _2028);
        float _2056 = _2050 + _1958;
        float _2058 = _1972 * _1990;
        int _2060 = _1674 + 56;
        uint _2062 = uint(int(uint(_2060) >> uint(2)));
        uint _2064 = uint(int(uint(int(_2062)) >> uint(2)));
        int _2066 = int(_2062) & 3;
        float _2068 = (*spvDescriptorSet0.cp_c6)._m0[int(_2064)][_2066];
        int _2070 = int(_2062) + 1;
        uint _2072 = uint(int(uint(_2070) >> uint(2)));
        int _2074 = _2070 & 3;
        float _2076 = (*spvDescriptorSet0.cp_c6)._m0[int(_2072)][_2074];
        float _2078 = _1940 * _1990;
        float _2080 = _1960 * _1990;
        int _2082 = as_type<int>(_1894) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
        int _2084 = _2082 + _1668;
        int _2086 = _1668 + 1;
        float _2088 = _1962 * _1990;
        float _2090 = fma(_1994, _1982, _2058);
        float _2092 = _1972 * _2012;
        float _2094 = _1940 * _2012;
        float _2096 = _1960 * _2012;
        float _2098 = fma(_1934, _1982, _2080);
        float _2100 = _1962 * _2012;
        float _2102 = fma(_1994, _2004, _2092);
        float _2104 = fma(_1932, _2004, _2094);
        int _2106 = _2084 * 48;
        bool _2108 = uint(_2086) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
        float _2110 = fma(_1934, _2004, _2096);
        float _2112 = fma(_1932, _1982, _2078);
        float _2114 = fma(_1936, _1982, _2088);
        float _2116 = fma(_1992, _2038, _2090);
        float _2118 = fma(_1936, _2004, _2100);
        float _2120 = fma(_1966, _2038, _2098);
        float _2122 = fma(_1964, _2038, _2112);
        float _2124 = fma(_1970, _2038, _2114);
        float _2126 = fma(_1992, _2068, _2102);
        float _2128 = fma(_1964, _2068, _2104);
        float _2130 = fma(_1966, _2068, _2110);
        int _2132 = _2106 + 16;
        float _2134 = _2116 + _2046;
        int _2136 = _2106 + 32;
        float _2138 = fma(_1970, _2068, _2118);
        float _2140 = _2126 + _2076;
        int _2142 = _2106 + 48;
        uint _2144 = uint(int(uint(_2132) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_2144)] = as_type<uint>(_2048);
        int _2146 = _2132 + 4;
        uint _2148 = uint(int(uint(_2146) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_2148)] = as_type<uint>(_2052);
        int _2150 = _2132 + 8;
        uint _2152 = uint(int(uint(_2150) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_2152)] = as_type<uint>(_2054);
        int _2154 = _2132 + 12;
        uint _2156 = uint(int(uint(_2154) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_2156)] = as_type<uint>(_2056);
        uint _2158 = uint(int(uint(_2136) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_2158)] = as_type<uint>(_2122);
        int _2160 = _2136 + 4;
        uint _2162 = uint(int(uint(_2160) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_2162)] = as_type<uint>(_2120);
        int _2164 = _2136 + 8;
        uint _2166 = uint(int(uint(_2164) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_2166)] = as_type<uint>(_2124);
        int _2168 = _2136 + 12;
        uint _2170 = uint(int(uint(_2168) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_2170)] = as_type<uint>(_2134);
        uint _2172 = uint(int(uint(_2142) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_2172)] = as_type<uint>(_2128);
        int _2174 = _2142 + 4;
        uint _2176 = uint(int(uint(_2174) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_2176)] = as_type<uint>(_2130);
        int _2178 = _2142 + 8;
        uint _2180 = uint(int(uint(_2178) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_2180)] = as_type<uint>(_2138);
        int _2182 = _2142 + 12;
        uint _2184 = uint(int(uint(_2182) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_2184)] = as_type<uint>(_2140);
        _1666 = !_2108;
        _1664 = _2086;
    } while (_1666);
}

