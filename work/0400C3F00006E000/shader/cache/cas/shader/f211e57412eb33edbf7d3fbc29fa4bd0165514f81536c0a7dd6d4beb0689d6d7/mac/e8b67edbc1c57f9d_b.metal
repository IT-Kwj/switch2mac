#pragma clang diagnostic ignored "-Wunused-variable"
#pragma clang diagnostic ignored "-Wmissing-prototypes"

#include <metal_stdlib>
#include <simd/simd.h>
#include <metal_atomic>

using namespace metal;

struct dm_border_t { uint mask; float4 k[32]; };
static inline __attribute__((always_inline)) float4 dm_bmix(float4 r, float4 w, float4 k) { return r + (w - r) * k; }
static inline __attribute__((always_inline)) float dm_bmix(float r, float w, float4 k) { return r + (w - r) * k.x; }
template<typename V, typename T, typename... A> static inline __attribute__((always_inline)) V dm_bs(V r, constant dm_border_t* b, uint i, T t, sampler w, A... a)
{
    if (b->mask >> i & 1u) r = dm_bmix(r, t.sample(w, a...), b->k[i]);
    return r;
}

// Implementation of the unsigned GLSL findMSB() function
template<typename T>
inline T spvFindUMSB(T x)
{
    return select(clz(T(0)) - (clz(x) + T(1)), T(-1), x == T(0));
}

inline uint4 spvSubgroupBallot(bool value)
{
    simd_vote vote = simd_ballot(value);
    // simd_ballot() returns a 64-bit integer-like object, but
    // SPIR-V callers expect a uint4. We must convert.
    // FIXME: This won't include higher bits if Apple ever supports
    // 128 lanes in an SIMD-group.
    return uint4(as_type<uint2>((simd_vote::vote_t)vote), 0, 0);
}

template<typename T>
inline T spvSubgroupShuffle(T value, ushort lane)
{
    return simd_shuffle(value, lane);
}

template<>
inline bool spvSubgroupShuffle(bool value, ushort lane)
{
    return !!simd_shuffle((ushort)value, lane);
}

template<uint N>
inline vec<bool, N> spvSubgroupShuffle(vec<bool, N> value, ushort lane)
{
    return (vec<bool, N>)simd_shuffle((vec<ushort, N>)value, lane);
}

template<>
inline ulong spvSubgroupShuffle(ulong value, ushort lane)
{
    return as_type<ulong>(spvSubgroupShuffle(as_type<uint2>(value), lane));
}

template<>
inline ulong2 spvSubgroupShuffle(ulong2 value, ushort lane)
{
    return ulong2(spvSubgroupShuffle(value.x, lane), spvSubgroupShuffle(value.y, lane));
}

inline ulong3 spvSubgroupShuffle(ulong3 value, ushort lane)
{
    return ulong3(spvSubgroupShuffle(value.xy, lane), spvSubgroupShuffle(value.z, lane));
}

inline ulong4 spvSubgroupShuffle(ulong4 value, ushort lane)
{
    return ulong4(spvSubgroupShuffle(value.xy, lane), spvSubgroupShuffle(value.zw, lane));
}

template<uint N>
inline vec<long, N> spvSubgroupShuffle(vec<long, N> value, ushort lane)
{
    return vec<long, N>(spvSubgroupShuffle(vec<ulong, N>(value), lane));
}

template<typename T, typename U, typename V>
[[clang::optnone]] T spvMulExtended(V l, V r)
{
    return T{U(l * r), U(mulhi(l, r))};
}

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

struct _27
{
    uint _m0[1];
};

struct _1492
{
    uint _m0;
    uint _m1;
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* cp_c0 [[id(1)]];
    constant _16* cp_c4 [[id(2)]];
    constant _16* cp_c3 [[id(3)]];
    constant _16* cp_c5 [[id(4)]];
    device _27* cp_s0 [[id(5)]];
    device _27* cp_s1 [[id(6)]];
    device _27* cp_s2 [[id(7)]];
    device _27* cp_s3 [[id(8)]];
    device _27* cp_s4 [[id(9)]];
    texture2d<float> cp_t_tcb_C [[id(10)]];
    sampler cp_t_tcb_CSmplr [[id(11)]];
    texture2d<float> cp_t_tcb_A [[id(12)]];
    sampler cp_t_tcb_ASmplr [[id(13)]];
    texture2d<float> cp_t_tcb_8 [[id(14)]];
    sampler cp_t_tcb_8Smplr [[id(15)]];
    texture2d<float> cp_i_tcb_48_ [[id(16)]];
    sampler cp_t_tcb_ASmplr_w [[id(17)]];
    sampler cp_t_tcb_8Smplr_w [[id(18)]];
    constant dm_border_t* dm_border [[id(19)]];
};

static inline __attribute__((always_inline))
int _70(thread const int& _3007, thread const int& _3008, constant _10& support_buffer)
{
    int _3011 = 1 + _3008;
    float _3013 = support_buffer._m5[_3011].x;
    bool _3015 = _3013 == 1.0;
    if (_3015)
    {
        return _3007;
    }
    float _3017 = float(_3007);
    float _3019 = _3017 * _3013;
    int _3021 = int(_3019);
    return _3021;
}

static inline __attribute__((always_inline))
int _72(thread const int& _3042, thread const int& _3043, thread const int& _3044, thread int& _3045, thread uint& gl_SubgroupInvocationID)
{
    int _3048 = _3044 & 31;
    uint _3050 = uint(int(uint(_3044) >> uint(8)));
    int _3052 = int(_3050) & 31;
    float _3054 = as_type<float>(gl_SubgroupInvocationID);
    int _3056 = as_type<int>(_3054) & _3052;
    int _3058 = ~_3052;
    int _3060 = _3048 & _3058;
    int _3062 = _3060 | _3056;
    int _3064 = ~_3052;
    int _3066 = _3043 & _3064;
    int _3068 = _3066 | _3056;
    bool _3070 = uint(_3068) <= uint(_3062);
    _3045 = _3070 ? (-1) : 0;
    float _3072 = spvSubgroupShuffle(as_type<float>(_3042), uint(_3068));
    uint _3074 = uint(_3070 ? as_type<int>(_3072) : _3042);
    return int(_3074);
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    uint4 gl_SubgroupLtMask = uint4(extract_bits(0xFFFFFFFF, 0, min(gl_SubgroupInvocationID, 32u)), extract_bits(0xFFFFFFFF, 0, (uint)max((int)gl_SubgroupInvocationID - 32, 0)), uint2(0));
    float _76 = as_type<float>(gl_WorkGroupID.z);
    int _78 = as_type<int>(_76) * 24;
    int _80 = _78 + 8;
    uint _83 = uint(int(uint(_78) >> uint(2)));
    float _85 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_83)]);
    int _87 = _78 + 4;
    uint _89 = uint(int(uint(_87) >> uint(2)));
    float _91 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_89)]);
    uint _93 = uint(int(uint(_80) >> uint(2)));
    float _95 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_93)]);
    int _97 = _80 + 4;
    uint _99 = uint(int(uint(_97) >> uint(2)));
    float _101 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_99)]);
    float _103 = as_type<float>(gl_WorkGroupID.x);
    int _105 = as_type<int>((*spvDescriptorSet0.cp_c0)._m0[0].y) << 3;
    float _107 = as_type<float>(gl_LocalInvocationID.x);
    float _109 = as_type<float>(gl_WorkGroupID.y);
    float _111 = as_type<float>(gl_LocalInvocationID.y);
    float _113 = float(uint(_105));
    float _115 = 1.0 / _113;
    int _117 = as_type<int>(_103) << 3;
    int _119 = _117 + as_type<int>(_107);
    float _121 = float(uint(_119));
    int _123 = as_type<int>(_109) << 3;
    int _125 = _123 + as_type<int>(_111);
    float _127 = float(uint(_125));
    float _129 = _127 + 0.5;
    float _131 = _95 * _115;
    float _133 = _101 * _115;
    float _135 = _121 + 0.5;
    float _137 = fma(_129, _133, _91);
    float _139 = fma(_135, _131, _85);
    int _141 = as_type<int>(_137) * 1664525;
    int _143 = _141 + 1013904223;
    int _145 = as_type<int>(_139) * 1664525;
    int _147 = _145 + 1013904223;
    int _149 = _147 * _143;
    int _151 = _149 + _147;
    int _153 = _143 * _151;
    int _155 = _153 + _147;
    int _157 = _151 * _155;
    int _159 = _157 + _143;
    uint _161 = uint(int(uint(_151) >> uint(16)));
    uint _163 = uint(int(uint(_155) >> uint(16)));
    uint _165 = uint(int(uint(_159) >> uint(16)));
    int _167 = _151 ^ int(_161);
    int _169 = _155 ^ int(_163);
    int _171 = _159 ^ int(_165);
    int _173 = _169 * _171;
    int _175 = _173 + _167;
    int _177 = _171 * _175;
    int _179 = _177 + _169;
    int _181 = _175 * _179;
    int _183 = _181 + _171;
    uint _185 = uint(int(uint(_175) >> uint(9)));
    int _187 = int(_185) + 1065353216;
    uint _189 = uint(int(uint(_183) >> uint(9)));
    int _191 = int(_189) + 1065353216;
    float _193 = as_type<float>(_187) + (-1.5);
    float _195 = as_type<float>(_191) + (-1.5);
    float _197 = fma(_131, _193, _139);
    float _199 = fma(_133, _195, _137);
    float _201 = fma(_197, 6.2500002968590706586837768554688e-05, 0.5);
    float _203 = fma(_199, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _1382 = float2(_201, _203);
    float4 _206 = spvDescriptorSet0.cp_t_tcb_C.gather(spvDescriptorSet0.cp_t_tcb_CSmplr, select(_1382, float2(0.0), isnan(_1382)), int2(0), component::x).xyzw;
    float _208 = _206.x;
    float _210 = _206.y;
    float _212 = _206.z;
    float _214 = _206.w;
    float _216 = fma(_197, 6.2500002968590706586837768554688e-05, 0.500062525272369384765625);
    float _218 = fma(_199, 6.2500002968590706586837768554688e-05, 0.500062525272369384765625);
    float2 _1406 = float2(_201, _203);
    float _220 = dm_bs(spvDescriptorSet0.cp_t_tcb_A.sample(spvDescriptorSet0.cp_t_tcb_ASmplr, select(_1406, float2(0.0), isnan(_1406)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_A, spvDescriptorSet0.cp_t_tcb_ASmplr_w, select(_1406, float2(0.0), isnan(_1406)), level(0.0)).x;
    float2 _1414 = float2(_216, _203);
    float _222 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_1414, float2(0.0), isnan(_1414)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_1414, float2(0.0), isnan(_1414)), level(0.0)).x;
    float2 _1422 = float2(_201, _203);
    float _224 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_1422, float2(0.0), isnan(_1422)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_1422, float2(0.0), isnan(_1422)), level(0.0)).x;
    float2 _1430 = float2(_201, _218);
    float _226 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_1430, float2(0.0), isnan(_1430)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_1430, float2(0.0), isnan(_1430)), level(0.0)).x;
    int _228 = _175 * 1664525;
    int _230 = _228 + 1013904223;
    int _232 = _183 * 1664525;
    int _234 = _232 + 1013904223;
    int _236 = _179 * 1664525;
    int _238 = _236 + 1013904223;
    int _240 = _238 * _234;
    int _242 = _240 + _230;
    int _244 = _234 * _242;
    int _246 = _244 + _238;
    int _248 = _242 * _246;
    int _250 = _248 + _234;
    uint _252 = uint(int(uint(_242) >> uint(16)));
    uint _254 = uint(int(uint(_246) >> uint(16)));
    uint _256 = uint(int(uint(_250) >> uint(16)));
    int _258 = _242 ^ int(_252);
    int _260 = _246 ^ int(_254);
    int _262 = _250 ^ int(_256);
    int _264 = _260 * _262;
    int _266 = _264 + _258;
    uint _268 = (spvMulExtended<_1492, uint>(uint(_266), 3221225473u))._m1;
    uint _270 = uint(int(uint(int(_268)) >> uint(30)));
    int _272 = int(_270) << 2;
    bool _276 = _272 == 0;
    bool _278 = _272 == 4;
    bool _280 = _272 == 8;
    bool _282 = _272 == 12;
    int _284 = _262 * _266;
    int _286 = _284 + _260;
    int _288 = int(_254);
    if (_276)
    {
        _288 = as_type<int>(_208);
    }
    int _290 = _288;
    int _292 = _290;
    if (_278)
    {
        _292 = as_type<int>(_210);
    }
    int _294 = _292;
    int _296 = _294;
    if (_280)
    {
        _296 = as_type<int>(_212);
    }
    int _298 = _296;
    int _300 = _298;
    if (_282)
    {
        _300 = as_type<int>(_214);
    }
    int _302 = _300;
    bool _304 = _302 != 0;
    uint _306 = uint(int(uint(_266) >> uint(9)));
    int _308 = int(_306) + 1065353216;
    float _310 = as_type<float>(_308) + (-1.0);
    int _312 = _266 * _286;
    int _314 = _312 + _262;
    bool _316 = _310 > _220;
    if (!_304)
    {
        return;
    }
    if (_316)
    {
        return;
    }
    float _318 = -_224;
    float _320 = _318 + _222;
    float _322 = -_224;
    float _324 = _322 + _226;
    float _326 = _320 * 1024.0;
    float _328 = _324 * 1024.0;
    float _330 = fma(_326, _326, 0.06871949136257171630859375);
    float _332 = fma(_328, _328, _330);
    int _334 = _78 + 16;
    float _336 = rsqrt(_332);
    float _338 = _336 * 0.262144029140472412109375;
    bool _340 = _338 >= 0.5;
    bool _342 = isnan(_338);
    bool _344 = _340 || _342;
    bool _346 = isnan(0.5);
    bool _348 = _344 || _346;
    if (!_348)
    {
        return;
    }
    uint _350 = uint(int(uint(_334) >> uint(2)));
    float _352 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_350)]);
    float _354 = _224 * 2000.0;
    uint _356 = uint(int(uint(_179) >> uint(9)));
    int _358 = int(_356) + 1065353216;
    float _360 = -_197;
    float _362 = _360 + (*spvDescriptorSet0.cp_c3)._m0[4].x;
    float _364 = -_354;
    float _366 = _364 + (*spvDescriptorSet0.cp_c3)._m0[4].y;
    float _368 = _366 * _366;
    float _370 = fma(as_type<float>(_358), -0.699999988079071044921875, 1.7000000476837158203125);
    float _372 = fma(_362, _362, _368);
    float _374 = -_199;
    float _376 = _374 + (*spvDescriptorSet0.cp_c3)._m0[4].z;
    float _378 = fma(_376, _376, _372);
    float _380 = _352 * _370;
    float _382 = sqrt(_378);
    float _384 = _380 * 0.199999988079071044921875;
    float _386 = 1.0 / _384;
    float _388 = fma(_380, -0.800000011920928955078125, _382);
    float _390 = _388 * _386;
    float _392 = precise::clamp(_390, 0.0, 1.0);
    float _394 = -_392;
    float _396 = _394 + 1.0;
    bool _398 = _396 >= 0.00999999977648258209228515625;
    bool _400 = isnan(_396);
    bool _402 = _398 || _400;
    bool _404 = isnan(0.00999999977648258209228515625);
    bool _406 = _402 || _404;
    if (!_406)
    {
        return;
    }
    uint _408 = (spvMulExtended<_1492, uint>(uint(_286), 1056964609u))._m1;
    int _410 = _302 + (-1);
    uint _412 = uint(int(uint(int(_408)) >> uint(24)));
    int _414 = int(_412);
    int _416 = 3;
    int _418 = _70(_414, _416, (*spvDescriptorSet0.support_buffer));
    int _420 = _410;
    int _422 = 3;
    int _424 = _70(_420, _422, (*spvDescriptorSet0.support_buffer));
    float _426 = spvDescriptorSet0.cp_i_tcb_48_.read(uint2(int2(_418, _424))).x;
    int _428 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) + (-1);
    uint _430 = min(as_type<uint>(_426), uint(_428));
    int _432 = int(_430) * 48;
    uint _434 = uint(int(uint(_432) >> uint(2)));
    float _436 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_434)]);
    int _438 = _432 + 4;
    uint _440 = uint(int(uint(_438) >> uint(2)));
    float _442 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_440)]);
    int _444 = _432 + 8;
    uint _446 = uint(int(uint(_444) >> uint(2)));
    float _448 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_446)]);
    int _450 = _432 + 12;
    uint _452 = uint(int(uint(_450) >> uint(2)));
    float _454 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_452)]);
    uint _456 = uint(int(uint(_314) >> uint(9)));
    int _458 = int(_456) + 1065353216;
    float _460 = _354 * (*spvDescriptorSet0.cp_c3)._m0[1].y;
    float _462 = fma(_197, (*spvDescriptorSet0.cp_c3)._m0[1].x, _460);
    float _464 = fma(_199, (*spvDescriptorSet0.cp_c3)._m0[1].z, _462);
    float _466 = _464 + (*spvDescriptorSet0.cp_c3)._m0[1].w;
    float _468 = _442 * _442;
    float _470 = _354 * (*spvDescriptorSet0.cp_c3)._m0[0].y;
    float _472 = fma(_436, _436, _468);
    float _474 = fma(_197, (*spvDescriptorSet0.cp_c3)._m0[0].x, _470);
    float _476 = fma(_448, _448, _472);
    float _478 = fma(_199, (*spvDescriptorSet0.cp_c3)._m0[0].z, _474);
    float _480 = sqrt(_476);
    float _482 = fma(as_type<float>(_458), 2.0, -3.0);
    float _484 = _478 + (*spvDescriptorSet0.cp_c3)._m0[0].w;
    float _486 = fma(_482, (*spvDescriptorSet0.cp_c5)._m0[0].w, 1.0);
    float _488 = _354 * (*spvDescriptorSet0.cp_c3)._m0[3].y;
    float _490 = fma(_197, (*spvDescriptorSet0.cp_c3)._m0[3].x, _488);
    float _492 = _454 + _480;
    float _494 = _354 * (*spvDescriptorSet0.cp_c3)._m0[2].y;
    float _496 = fma(_199, (*spvDescriptorSet0.cp_c3)._m0[3].z, _490);
    float _498 = _486 * _492;
    float _500 = fma(_197, (*spvDescriptorSet0.cp_c3)._m0[2].x, _494);
    float _502 = _496 + (*spvDescriptorSet0.cp_c3)._m0[3].w;
    float _504 = fma(_199, (*spvDescriptorSet0.cp_c3)._m0[2].z, _500);
    bool _506 = _466 >= _498;
    bool _508 = isnan(_466);
    bool _510 = _506 || _508;
    bool _512 = isnan(_498);
    bool _514 = _510 || _512;
    float _516 = _504 + (*spvDescriptorSet0.cp_c3)._m0[2].w;
    bool _518 = _484 < _498;
    bool _520 = !_514;
    bool _522 = _518 && _520;
    bool _524 = _516 < _498;
    bool _526 = _524 && _522;
    bool _528 = _502 < _498;
    bool _530 = _528 && _526;
    int _532 = as_type<int>(_502);
    if (!_530)
    {
        return;
    }
    float _534 = as_type<float>(gl_SubgroupInvocationID);
    uint _536 = spvSubgroupBallot(true).x;
    int _538 = reverse_bits(int(_536));
    int _540 = int(spvFindUMSB(uint(_538)));
    bool _542 = _540 != (-1);
    int _544 = _540 ^ 31;
    int _546 = _542 ? _544 : _540;
    bool _548 = as_type<int>(_534) != _546;
    if (_548)
    {
        _532 = 0;
    }
    int _550 = _532;
    int _552 = _550;
    if (!_548)
    {
        int _554 = popcount(int(_536));
        uint _1975 = atomic_fetch_add_explicit((device atomic_uint*)&(*spvDescriptorSet0.cp_s2)._m0[0], uint(_554), memory_order_relaxed);
        uint _556 = _1975;
        _552 = int(_556);
    }
    int _558 = _552;
    uint _560 = spvSubgroupBallot(true).x;
    float _562 = as_type<float>(gl_SubgroupLtMask.x);
    int _564 = reverse_bits(int(_560));
    int _566 = int(spvFindUMSB(uint(_564)));
    bool _568 = _566 != (-1);
    int _570 = _566 ^ 31;
    int _572 = _568 ? _570 : _566;
    int _574 = as_type<int>(_562) & int(_536);
    int _576 = _558;
    int _578 = _572;
    int _580 = 31;
    int _582;
    int _2007 = _72(_576, _578, _580, _582, gl_SubgroupInvocationID);
    int _584 = _2007;
    int _586 = popcount(_574);
    int _588 = _584 + _586;
    bool _590 = uint(_588) >= as_type<uint>((*spvDescriptorSet0.cp_c4)._m0[0].y);
    if (_590)
    {
        return;
    }
    int _592 = int(_430) << 2;
    int _594 = _592 + as_type<int>((*spvDescriptorSet0.cp_c0)._m0[53].x);
    bool _596 = uint(_594) < uint(_592);
    int _598 = int(_596);
    int _600 = as_type<int>((*spvDescriptorSet0.cp_c0)._m0[53].y) + _598;
    uint _602 = spvSubgroupBallot(true).x;
    float _604 = spvSubgroupShuffle(as_type<float>(_594), 0u);
    bool _606 = as_type<int>(_604) == _594;
    float _608 = spvSubgroupShuffle(as_type<float>(_600), 0u);
    bool _610 = as_type<int>(_608) == _600;
    bool _612 = _606 && _610;
    int _614 = int(_612);
    float _616 = spvSubgroupShuffle(as_type<float>(_594), 1u);
    bool _618 = as_type<int>(_616) == _594;
    float _620 = spvSubgroupShuffle(as_type<float>(_600), 1u);
    bool _622 = as_type<int>(_620) == _600;
    bool _624 = _618 && _622;
    int _626 = _624 ? 2 : 0;
    int _628 = _614 | _626;
    float _630 = spvSubgroupShuffle(as_type<float>(_594), 2u);
    bool _632 = as_type<int>(_630) == _594;
    float _634 = spvSubgroupShuffle(as_type<float>(_600), 2u);
    bool _636 = as_type<int>(_634) == _600;
    bool _638 = _632 && _636;
    int _640 = _638 ? 4 : 0;
    int _642 = _628 | _640;
    float _644 = spvSubgroupShuffle(as_type<float>(_594), 3u);
    bool _646 = as_type<int>(_644) == _594;
    float _648 = spvSubgroupShuffle(as_type<float>(_600), 3u);
    bool _650 = as_type<int>(_648) == _600;
    bool _652 = _646 && _650;
    int _654 = _652 ? 8 : 0;
    int _656 = _642 | _654;
    float _658 = spvSubgroupShuffle(as_type<float>(_594), 4u);
    bool _660 = as_type<int>(_658) == _594;
    float _662 = spvSubgroupShuffle(as_type<float>(_600), 4u);
    bool _664 = as_type<int>(_662) == _600;
    bool _666 = _660 && _664;
    int _668 = _666 ? 16 : 0;
    int _670 = _656 | _668;
    float _672 = spvSubgroupShuffle(as_type<float>(_594), 5u);
    bool _674 = as_type<int>(_672) == _594;
    float _676 = spvSubgroupShuffle(as_type<float>(_600), 5u);
    bool _678 = as_type<int>(_676) == _600;
    bool _680 = _674 && _678;
    int _682 = _680 ? 32 : 0;
    int _684 = _670 | _682;
    float _686 = spvSubgroupShuffle(as_type<float>(_594), 6u);
    bool _688 = as_type<int>(_686) == _594;
    float _690 = spvSubgroupShuffle(as_type<float>(_600), 6u);
    bool _692 = as_type<int>(_690) == _600;
    bool _694 = _688 && _692;
    int _696 = _694 ? 64 : 0;
    int _698 = _684 | _696;
    float _700 = spvSubgroupShuffle(as_type<float>(_594), 7u);
    bool _702 = as_type<int>(_700) == _594;
    float _704 = spvSubgroupShuffle(as_type<float>(_600), 7u);
    bool _706 = as_type<int>(_704) == _600;
    bool _708 = _702 && _706;
    int _710 = _708 ? 128 : 0;
    int _712 = _698 | _710;
    float _714 = spvSubgroupShuffle(as_type<float>(_594), 8u);
    bool _716 = as_type<int>(_714) == _594;
    float _718 = spvSubgroupShuffle(as_type<float>(_600), 8u);
    bool _720 = as_type<int>(_718) == _600;
    bool _722 = _716 && _720;
    int _724 = _722 ? 256 : 0;
    int _726 = _712 | _724;
    float _728 = spvSubgroupShuffle(as_type<float>(_594), 9u);
    bool _730 = as_type<int>(_728) == _594;
    float _732 = spvSubgroupShuffle(as_type<float>(_600), 9u);
    bool _734 = as_type<int>(_732) == _600;
    bool _736 = _730 && _734;
    int _738 = _736 ? 512 : 0;
    int _740 = _726 | _738;
    float _742 = spvSubgroupShuffle(as_type<float>(_594), 10u);
    bool _744 = as_type<int>(_742) == _594;
    float _746 = spvSubgroupShuffle(as_type<float>(_600), 10u);
    bool _748 = as_type<int>(_746) == _600;
    bool _750 = _744 && _748;
    int _752 = _750 ? 1024 : 0;
    int _754 = _740 | _752;
    float _756 = spvSubgroupShuffle(as_type<float>(_594), 11u);
    bool _758 = as_type<int>(_756) == _594;
    float _760 = spvSubgroupShuffle(as_type<float>(_600), 11u);
    bool _762 = as_type<int>(_760) == _600;
    bool _764 = _758 && _762;
    int _766 = _764 ? 2048 : 0;
    int _768 = _754 | _766;
    float _770 = spvSubgroupShuffle(as_type<float>(_594), 12u);
    bool _772 = as_type<int>(_770) == _594;
    float _774 = spvSubgroupShuffle(as_type<float>(_600), 12u);
    bool _776 = as_type<int>(_774) == _600;
    bool _778 = _772 && _776;
    int _780 = _778 ? 4096 : 0;
    int _782 = _768 | _780;
    float _784 = spvSubgroupShuffle(as_type<float>(_594), 13u);
    bool _786 = as_type<int>(_784) == _594;
    float _788 = spvSubgroupShuffle(as_type<float>(_600), 13u);
    bool _790 = as_type<int>(_788) == _600;
    bool _792 = _786 && _790;
    int _794 = _792 ? 8192 : 0;
    int _796 = _782 | _794;
    float _798 = spvSubgroupShuffle(as_type<float>(_594), 14u);
    bool _800 = as_type<int>(_798) == _594;
    float _802 = spvSubgroupShuffle(as_type<float>(_600), 14u);
    bool _804 = as_type<int>(_802) == _600;
    bool _806 = _800 && _804;
    int _808 = _806 ? 16384 : 0;
    int _810 = _796 | _808;
    float _812 = spvSubgroupShuffle(as_type<float>(_594), 15u);
    bool _814 = as_type<int>(_812) == _594;
    float _816 = spvSubgroupShuffle(as_type<float>(_600), 15u);
    bool _818 = as_type<int>(_816) == _600;
    bool _820 = _814 && _818;
    int _822 = _820 ? 32768 : 0;
    int _824 = _810 | _822;
    float _826 = spvSubgroupShuffle(as_type<float>(_594), 16u);
    bool _828 = as_type<int>(_826) == _594;
    float _830 = spvSubgroupShuffle(as_type<float>(_600), 16u);
    bool _832 = as_type<int>(_830) == _600;
    bool _834 = _828 && _832;
    int _836 = _834 ? 65536 : 0;
    int _838 = _824 | _836;
    float _840 = spvSubgroupShuffle(as_type<float>(_594), 17u);
    bool _842 = as_type<int>(_840) == _594;
    float _844 = spvSubgroupShuffle(as_type<float>(_600), 17u);
    bool _846 = as_type<int>(_844) == _600;
    bool _848 = _842 && _846;
    int _850 = _848 ? 131072 : 0;
    int _852 = _838 | _850;
    float _854 = spvSubgroupShuffle(as_type<float>(_594), 18u);
    bool _856 = as_type<int>(_854) == _594;
    float _858 = spvSubgroupShuffle(as_type<float>(_600), 18u);
    bool _860 = as_type<int>(_858) == _600;
    bool _862 = _856 && _860;
    int _864 = _862 ? 262144 : 0;
    int _866 = _852 | _864;
    float _868 = spvSubgroupShuffle(as_type<float>(_594), 19u);
    bool _870 = as_type<int>(_868) == _594;
    float _872 = spvSubgroupShuffle(as_type<float>(_600), 19u);
    bool _874 = as_type<int>(_872) == _600;
    bool _876 = _870 && _874;
    int _878 = _876 ? 524288 : 0;
    int _880 = _866 | _878;
    float _882 = spvSubgroupShuffle(as_type<float>(_594), 20u);
    bool _884 = as_type<int>(_882) == _594;
    float _886 = spvSubgroupShuffle(as_type<float>(_600), 20u);
    bool _888 = as_type<int>(_886) == _600;
    bool _890 = _884 && _888;
    int _892 = _890 ? 1048576 : 0;
    int _894 = _880 | _892;
    float _896 = spvSubgroupShuffle(as_type<float>(_594), 21u);
    bool _898 = as_type<int>(_896) == _594;
    float _900 = spvSubgroupShuffle(as_type<float>(_600), 21u);
    bool _902 = as_type<int>(_900) == _600;
    bool _904 = _898 && _902;
    int _906 = _904 ? 2097152 : 0;
    int _908 = _894 | _906;
    float _910 = spvSubgroupShuffle(as_type<float>(_594), 22u);
    bool _912 = as_type<int>(_910) == _594;
    float _914 = spvSubgroupShuffle(as_type<float>(_600), 22u);
    bool _916 = as_type<int>(_914) == _600;
    bool _918 = _912 && _916;
    int _920 = _918 ? 4194304 : 0;
    int _922 = _908 | _920;
    float _924 = spvSubgroupShuffle(as_type<float>(_594), 23u);
    bool _926 = as_type<int>(_924) == _594;
    float _928 = spvSubgroupShuffle(as_type<float>(_600), 23u);
    bool _930 = as_type<int>(_928) == _600;
    bool _932 = _926 && _930;
    int _934 = _932 ? 8388608 : 0;
    int _936 = _922 | _934;
    float _938 = spvSubgroupShuffle(as_type<float>(_594), 24u);
    bool _940 = as_type<int>(_938) == _594;
    float _942 = spvSubgroupShuffle(as_type<float>(_600), 24u);
    bool _944 = as_type<int>(_942) == _600;
    bool _946 = _940 && _944;
    int _948 = _946 ? 16777216 : 0;
    int _950 = _936 | _948;
    float _952 = spvSubgroupShuffle(as_type<float>(_594), 25u);
    bool _954 = as_type<int>(_952) == _594;
    float _956 = spvSubgroupShuffle(as_type<float>(_600), 25u);
    bool _958 = as_type<int>(_956) == _600;
    bool _960 = _954 && _958;
    int _962 = _960 ? 33554432 : 0;
    int _964 = _950 | _962;
    float _966 = spvSubgroupShuffle(as_type<float>(_594), 26u);
    bool _968 = as_type<int>(_966) == _594;
    float _970 = spvSubgroupShuffle(as_type<float>(_600), 26u);
    bool _972 = as_type<int>(_970) == _600;
    bool _974 = _968 && _972;
    int _976 = _974 ? 67108864 : 0;
    int _978 = _964 | _976;
    float _980 = spvSubgroupShuffle(as_type<float>(_594), 27u);
    bool _982 = as_type<int>(_980) == _594;
    float _984 = spvSubgroupShuffle(as_type<float>(_600), 27u);
    bool _986 = as_type<int>(_984) == _600;
    bool _988 = _982 && _986;
    int _990 = _988 ? 134217728 : 0;
    int _992 = _978 | _990;
    float _994 = spvSubgroupShuffle(as_type<float>(_594), 28u);
    bool _996 = as_type<int>(_994) == _594;
    float _998 = spvSubgroupShuffle(as_type<float>(_600), 28u);
    bool _1000 = as_type<int>(_998) == _600;
    bool _1002 = _996 && _1000;
    int _1004 = _1002 ? 268435456 : 0;
    int _1006 = _992 | _1004;
    float _1008 = spvSubgroupShuffle(as_type<float>(_594), 29u);
    bool _1010 = as_type<int>(_1008) == _594;
    float _1012 = spvSubgroupShuffle(as_type<float>(_600), 29u);
    bool _1014 = as_type<int>(_1012) == _600;
    bool _1016 = _1010 && _1014;
    int _1018 = _1016 ? 536870912 : 0;
    int _1020 = _1006 | _1018;
    float _1022 = spvSubgroupShuffle(as_type<float>(_594), 30u);
    bool _1024 = as_type<int>(_1022) == _594;
    float _1026 = spvSubgroupShuffle(as_type<float>(_600), 30u);
    bool _1028 = as_type<int>(_1026) == _600;
    bool _1030 = _1024 && _1028;
    int _1032 = _1030 ? 1073741824 : 0;
    int _1034 = _1020 | _1032;
    float _1036 = spvSubgroupShuffle(as_type<float>(_594), 31u);
    bool _1038 = as_type<int>(_1036) == _594;
    float _1040 = spvSubgroupShuffle(as_type<float>(_600), 31u);
    bool _1042 = as_type<int>(_1040) == _600;
    bool _1044 = _1038 && _1042;
    int _1046 = _1044 ? int(0x80000000) : 0;
    int _1048 = _1034 | _1046;
    int _1050 = _1048 & int(_602);
    bool _1052 = _1050 == int(_602);
    float _1054 = _326 * _336;
    float _1056 = _328 * _336;
    int _1058 = 1;
    if (!_1052)
    {
        uint _1060 = uint(int(uint(_592) >> uint(2)));
        uint _2828 = atomic_fetch_add_explicit((device atomic_uint*)&(*spvDescriptorSet0.cp_s3)._m0[int(_1060)], 1u, memory_order_relaxed);
        uint _1062 = _2828;
        _1058 = int(_1062);
    }
    int _1064 = _1058;
    bool _1066 = !_1052;
    int _1068 = _1064;
    if (!_1066)
    {
        uint _1070 = spvSubgroupBallot(true).x;
        int _1072 = int(spvFindUMSB(_1070));
        int _1074 = popcount(int(_1070));
        bool _1076 = _1072 == as_type<int>(_534);
        int _1078 = _1074;
        if (_1076)
        {
            uint _1080 = uint(int(uint(_592) >> uint(2)));
            uint _2862 = atomic_fetch_add_explicit((device atomic_uint*)&(*spvDescriptorSet0.cp_s3)._m0[int(_1080)], uint(_1074), memory_order_relaxed);
            uint _1082 = _2862;
            _1078 = int(_1082);
        }
        int _1084 = _1078;
        int _1086 = as_type<int>(_562) & int(_1070);
        int _1088 = popcount(_1086);
        int _1090 = _1084;
        int _1092 = _1072;
        int _1094 = 31;
        int _1096;
        int _2876 = _72(_1090, _1092, _1094, _1096, gl_SubgroupInvocationID);
        int _1098 = _2876;
        int _1100 = _1098 + _1088;
        _1068 = _1100;
    }
    int _1102 = _1068;
    int _1104 = _588 * 48;
    float _1106 = -_1054;
    float _1108 = _1106 + (-0.0);
    float _1110 = -_1056;
    float _1112 = _1110 + (-0.0);
    int _1114 = _1104 + 16;
    uint _1116 = uint(int(uint(_1104) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1116)] = as_type<uint>(_197);
    int _1118 = _1104 + 4;
    uint _1120 = uint(int(uint(_1118) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1120)] = as_type<uint>(_354);
    int _1122 = _1104 + 8;
    uint _1124 = uint(int(uint(_1122) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1124)] = as_type<uint>(_199);
    int _1126 = _1104 + 12;
    uint _1128 = uint(int(uint(_1126) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1128)] = as_type<uint>(_396);
    int _1130 = _1104 + 32;
    uint _1132 = uint(int(uint(_1114) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1132)] = as_type<uint>(_1108);
    int _1134 = _1114 + 4;
    uint _1136 = uint(int(uint(_1134) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1136)] = as_type<uint>(_338);
    int _1138 = _1114 + 8;
    uint _1140 = uint(int(uint(_1138) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1140)] = as_type<uint>(_1112);
    int _1142 = _1114 + 12;
    uint _1144 = uint(int(uint(_1142) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1144)] = as_type<uint>(_486);
    uint _1146 = uint(int(uint(_1130) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1146)] = _430;
    int _1148 = _1130 + 4;
    uint _1150 = uint(int(uint(_1148) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1150)] = uint(_1102);
    int _1152 = _1130 + 8;
    uint _1154 = uint(int(uint(_1152) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1154)] = 0u;
    int _1156 = _1130 + 12;
    uint _1158 = uint(int(uint(_1156) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1158)] = 0u;
}

