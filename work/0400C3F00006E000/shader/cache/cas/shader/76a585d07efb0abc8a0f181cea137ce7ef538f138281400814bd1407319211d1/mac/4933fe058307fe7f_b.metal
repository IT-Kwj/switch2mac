#pragma clang diagnostic ignored "-Wunused-variable"
#pragma clang diagnostic ignored "-Wmissing-prototypes"
#pragma clang diagnostic ignored "-Wmissing-braces"

#include <metal_stdlib>
#include <simd/simd.h>
#include <metal_atomic>

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

struct _590
{
    uint _m0;
    uint _m1;
};

struct spvDescriptorSetBuffer0
{
    constant _16* cp_c3 [[id(0)]];
    texture2d<float> cp_t_tcb_8 [[id(1)]];
    sampler cp_t_tcb_8Smplr [[id(2)]];
    texture2d<float, access::write> cp_i_tcb_48_ [[id(3)]];
    texture2d<uint, access::read_write> cp_i_tcb_4A_r32ui [[id(4)]];
    texture2d<float, access::write> cp_i_tcb_4C_ [[id(5)]];
};

static inline __attribute__((always_inline))
int _58(thread const int& _1331, thread const int& _1332, thread const int& _1333, thread int& _1334, thread uint& gl_SubgroupInvocationID)
{
    int _1337 = _1333 & 31;
    uint _1339 = uint(int(uint(_1333) >> uint(8)));
    int _1341 = int(_1339) & 31;
    float _1343 = as_type<float>(gl_SubgroupInvocationID);
    int _1345 = as_type<int>(_1343) & _1341;
    int _1347 = ~_1341;
    int _1349 = _1337 & _1347;
    int _1351 = _1349 | _1345;
    int _1353 = ~_1341;
    int _1355 = _1332 & _1353;
    int _1357 = _1355 | _1345;
    bool _1359 = uint(_1357) <= uint(_1351);
    _1334 = _1359 ? (-1) : 0;
    float _1361 = spvSubgroupShuffle(as_type<float>(_1331), uint(_1357));
    uint _1363 = uint(_1359 ? as_type<int>(_1361) : _1331);
    return int(_1363);
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    threadgroup spvUnsafeArray<uint, 400> _24;
    uint4 gl_SubgroupLtMask = uint4(extract_bits(0xFFFFFFFF, 0, min(gl_SubgroupInvocationID, 32u)), extract_bits(0xFFFFFFFF, 0, (uint)max((int)gl_SubgroupInvocationID - 32, 0)), uint2(0));
    float _62 = as_type<float>(gl_LocalInvocationID.y);
    float _64 = as_type<float>(gl_LocalInvocationID.x);
    float _66 = as_type<float>(gl_WorkGroupID.x);
    int _68 = as_type<int>(_62) * 80;
    int _70 = _68 + 160;
    float _72 = as_type<float>(gl_WorkGroupID.y);
    int _74 = as_type<int>(_62) * 16;
    int _76 = _74 + as_type<int>(_64);
    int _78 = as_type<int>(_64) * 4;
    int _80 = _78 + _70;
    bool _84 = uint(_76) >= 100u;
    if (!_84)
    {
        uint _87 = (spvMulExtended<_590, uint>(uint(_76), 3435973837u))._m1;
        int _89 = as_type<int>(_66) << 4;
        int _91 = _89 + (-2);
        int _93 = as_type<int>(_72) << 4;
        int _95 = _93 + (-2);
        uint _97 = uint(int(uint(int(_87)) >> uint(2)));
        float _99 = float(_91);
        float _101 = float(_95);
        int _103 = int(_97) * (-5);
        int _105 = _103 + _76;
        float _107 = _99 + 0.5;
        int _109 = _105 * 4;
        float _111 = _101 + 0.5;
        int _113 = _109 + 2;
        float _115 = _111 * (*spvDescriptorSet0.cp_c3)._m0[0].w;
        int _117 = _109 + 3;
        int _119 = _109 + 1;
        uint _121 = extract_bits(uint(_109), 0u, 8u);
        int _123 = int(_121) & 255;
        uint _125 = extract_bits(_97, 0u, 8u);
        int _127 = int(_125) & 255;
        int _129 = _127 << 8;
        int _131 = _123 | _129;
        uint _133 = extract_bits(uint(_109), 16u, 8u);
        int _135 = int(_133) & 255;
        int _137 = _135 << 16;
        int _139 = _131 | _137;
        uint _141 = extract_bits(uint(_109), 24u, 8u);
        int _143 = int(_141) & 255;
        int _145 = _143 << 24;
        int _147 = _139 | _145;
        uint _149 = extract_bits(uint(_113), 0u, 8u);
        int _151 = int(_149) & 255;
        uint _153 = extract_bits(_97, 0u, 8u);
        int _155 = int(_153) & 255;
        int _157 = _155 << 8;
        int _159 = _151 | _157;
        uint _161 = extract_bits(uint(_113), 16u, 8u);
        int _163 = int(_161) & 255;
        int _165 = _163 << 16;
        int _167 = _159 | _165;
        uint _169 = extract_bits(uint(_113), 24u, 8u);
        int _171 = int(_169) & 255;
        int _173 = _171 << 24;
        int _175 = _167 | _173;
        uint _177 = extract_bits(uint(_147), 0u, 8u);
        int _179 = int(_177) & 255;
        uint _181 = extract_bits(uint(_147), 8u, 8u);
        int _183 = int(_181) & 255;
        int _185 = _183 << 8;
        int _187 = _179 | _185;
        uint _189 = extract_bits(uint(_119), 0u, 8u);
        int _191 = int(_189) & 255;
        int _193 = _191 << 16;
        int _195 = _187 | _193;
        uint _197 = extract_bits(uint(_147), 24u, 8u);
        int _199 = int(_197) & 255;
        int _201 = _199 << 24;
        int _203 = _195 | _201;
        uint _205 = extract_bits(uint(_175), 0u, 8u);
        int _207 = int(_205) & 255;
        uint _209 = extract_bits(uint(_175), 8u, 8u);
        int _211 = int(_209) & 255;
        int _213 = _211 << 8;
        int _215 = _207 | _213;
        uint _217 = extract_bits(uint(_117), 0u, 8u);
        int _219 = int(_217) & 255;
        int _221 = _219 << 16;
        int _223 = _215 | _221;
        uint _225 = extract_bits(uint(_175), 24u, 8u);
        int _227 = int(_225) & 255;
        int _229 = _227 << 24;
        int _231 = _223 | _229;
        float _233 = _107 * (*spvDescriptorSet0.cp_c3)._m0[0].z;
        uint _235 = extract_bits(uint(_203), 0u, 8u);
        int _237 = int(_235) & 255;
        uint _239 = extract_bits(uint(_203), 8u, 8u);
        int _241 = int(_239) & 255;
        int _243 = _241 << 8;
        int _245 = _237 | _243;
        uint _247 = extract_bits(uint(_203), 16u, 8u);
        int _249 = int(_247) & 255;
        int _251 = _249 << 16;
        int _253 = _245 | _251;
        uint _255 = extract_bits(_97, 0u, 8u);
        int _257 = int(_255) & 255;
        int _259 = _257 << 24;
        int _261 = _253 | _259;
        uint _263 = extract_bits(uint(_231), 0u, 8u);
        int _265 = int(_263) & 255;
        uint _267 = extract_bits(uint(_231), 8u, 8u);
        int _269 = int(_267) & 255;
        int _271 = _269 << 8;
        int _273 = _265 | _271;
        uint _275 = extract_bits(uint(_231), 16u, 8u);
        int _277 = int(_275) & 255;
        int _279 = _277 << 16;
        int _281 = _273 | _279;
        uint _283 = extract_bits(_97, 0u, 8u);
        int _285 = int(_283) & 255;
        int _287 = _285 << 24;
        int _289 = _281 | _287;
        int _291 = extract_bits(_261, 0u, 6u);
        int _293 = extract_bits(_261, 8u, 6u);
        int _295 = extract_bits(_261, 16u, 6u);
        int _297 = extract_bits(_261, 24u, 6u);
        int _299 = extract_bits(_289, 0u, 6u);
        int _301 = extract_bits(_289, 8u, 6u);
        int _303 = extract_bits(_289, 16u, 6u);
        int _305 = extract_bits(_289, 24u, 6u);
        float2 _904 = float2(_233, _115);
        float2 _909 = select(_904, float2(0.0), isnan(_904));
        float4 _308 = float4(spvDescriptorSet0.cp_t_tcb_8.gather(spvDescriptorSet0.cp_t_tcb_8Smplr, _909, int2(_291, _293), component::x).w, spvDescriptorSet0.cp_t_tcb_8.gather(spvDescriptorSet0.cp_t_tcb_8Smplr, _909, int2(_295, _297), component::x).w, spvDescriptorSet0.cp_t_tcb_8.gather(spvDescriptorSet0.cp_t_tcb_8Smplr, _909, int2(_299, _301), component::x).w, spvDescriptorSet0.cp_t_tcb_8.gather(spvDescriptorSet0.cp_t_tcb_8Smplr, _909, int2(_303, _305), component::x).w).xyzw;
        float _310 = _308.x;
        float _312 = _308.y;
        float _314 = _308.z;
        float _316 = _308.w;
        int _318 = int(_97) * 5;
        int _320 = _318 + _105;
        int _322 = _320 << 4;
        uint _324 = uint(int(uint(_322) >> uint(2)));
        _24[int(_324)] = as_type<uint>(_310);
        int _326 = _322 + 4;
        uint _328 = uint(int(uint(_326) >> uint(2)));
        _24[int(_328)] = as_type<uint>(_312);
        int _330 = _322 + 8;
        uint _332 = uint(int(uint(_330) >> uint(2)));
        _24[int(_332)] = as_type<uint>(_314);
        int _334 = _322 + 12;
        uint _336 = uint(int(uint(_334) >> uint(2)));
        _24[int(_336)] = as_type<uint>(_316);
    }
    threadgroup_barrier(mem_flags::mem_threadgroup);
    int _338 = _80 + 12;
    uint _340 = uint(int(uint(_338) >> uint(2)));
    float _342 = as_type<float>(_24[int(_340)]);
    int _344 = _80 + 8;
    uint _346 = uint(int(uint(_344) >> uint(2)));
    float _348 = as_type<float>(_24[int(_346)]);
    int _350 = _80 + 88;
    uint _352 = uint(int(uint(_350) >> uint(2)));
    float _354 = as_type<float>(_24[int(_352)]);
    int _356 = _80 + 4;
    uint _358 = uint(int(uint(_356) >> uint(2)));
    float _360 = as_type<float>(_24[int(_358)]);
    int _362 = _80 + (-72);
    uint _364 = uint(int(uint(_362) >> uint(2)));
    float _366 = as_type<float>(_24[int(_364)]);
    uint _368 = uint(int(uint(_80) >> uint(2)));
    float _370 = as_type<float>(_24[int(_368)]);
    int _372 = _80 + (-152);
    uint _374 = uint(int(uint(_372) >> uint(2)));
    float _376 = as_type<float>(_24[int(_374)]);
    float _378 = -_348;
    float _380 = _342 + _378;
    float _382 = -_348;
    float _384 = _354 + _382;
    float _386 = -_348;
    float _388 = _360 + _386;
    float _390 = -_348;
    float _392 = _366 + _390;
    float _394 = -_360;
    float _396 = _394 + _370;
    float _398 = abs(_388);
    float _400 = abs(_380);
    float _402 = precise::max(_398, _400);
    float _404 = abs(_392);
    float _406 = abs(_384);
    float _408 = precise::max(_404, _406);
    float _410 = -_366;
    float _412 = _410 + _376;
    float _414 = abs(_396);
    float _416 = precise::max(_414, _402);
    float _418 = abs(_388);
    float _420 = _418 * (*spvDescriptorSet0.cp_c3)._m0[1].y;
    float _422 = abs(_392);
    float _424 = _422 * (*spvDescriptorSet0.cp_c3)._m0[1].y;
    float _426 = abs(_412);
    float _428 = precise::max(_426, _408);
    float _430 = precise::max(_416, _428);
    bool _432 = _420 >= _430;
    bool _434 = isnan(_420);
    bool _436 = _432 || _434;
    bool _438 = isnan(_430);
    bool _440 = _436 || _438;
    bool _442 = _424 >= _430;
    bool _444 = isnan(_424);
    bool _446 = _442 || _444;
    bool _448 = isnan(_430);
    bool _450 = _446 || _448;
    float _452 = abs(_388);
    bool _454 = _452 >= (*spvDescriptorSet0.cp_c3)._m0[1].x;
    bool _456 = isnan(_452);
    bool _458 = _454 || _456;
    bool _460 = isnan((*spvDescriptorSet0.cp_c3)._m0[1].x);
    bool _462 = _458 || _460;
    bool _464 = _462 && _440;
    float _466 = float(_464);
    float _468 = abs(_392);
    bool _470 = _468 >= (*spvDescriptorSet0.cp_c3)._m0[1].x;
    bool _472 = isnan(_468);
    bool _474 = _470 || _472;
    bool _476 = isnan((*spvDescriptorSet0.cp_c3)._m0[1].x);
    bool _478 = _474 || _476;
    bool _480 = _478 && _450;
    float _482 = float(_480);
    float _484 = -_482;
    bool _486 = _466 != _484;
    bool _488 = isnan(_466);
    bool _490 = _486 || _488;
    bool _492 = isnan(_484);
    bool _494 = _490 || _492;
    if (!_494)
    {
        return;
    }
    float _496 = as_type<float>(gl_SubgroupInvocationID);
    uint _498 = spvSubgroupBallot(true).x;
    int _500 = as_type<int>(_66) * 16;
    int _502 = _500 + as_type<int>(_64);
    int _504 = int(spvFindUMSB(_498));
    int _506 = as_type<int>(_72) * 16;
    int _508 = _506 + as_type<int>(_62);
    int _510 = popcount(int(_498));
    bool _512 = _504 == as_type<int>(_496);
    spvDescriptorSet0.cp_i_tcb_48_.write(float4(_466, _482, _466, _482), uint2(int2(_502, _508)));
    int _514 = _510;
    if (_512)
    {
        int2 _1267 = int2(0);
        uint _1283;
        if (all(uint2(_1267) < uint2(spvDescriptorSet0.cp_i_tcb_4A_r32ui.get_width(), spvDescriptorSet0.cp_i_tcb_4A_r32ui.get_height())))
        {
            uint _1280 = spvDescriptorSet0.cp_i_tcb_4A_r32ui.atomic_fetch_add(uint2(_1267), uint(_510)).x;
            _1283 = _1280;
        }
        else
        {
            _1283 = 0u;
        }
        int _516 = int(_1283);
        _514 = _516;
    }
    int _518 = _514;
    float _520 = as_type<float>(gl_SubgroupLtMask.x);
    int _522 = as_type<int>(_520) & int(_498);
    int _524 = popcount(_522);
    int _526 = _518;
    int _528 = _504;
    int _530 = 31;
    int _532;
    int _1301 = _58(_526, _528, _530, _532, gl_SubgroupInvocationID);
    int _534 = _1301;
    int _536 = _534 + _524;
    int _538 = _536 >> 31;
    int _540 = _538 & 1023;
    int _542 = _536 + _540;
    int _544 = _536 & 1023;
    int _546 = _542 >> 10;
    spvDescriptorSet0.cp_i_tcb_4C_.write(float4(as_type<float>(_502), as_type<float>(_508), as_type<float>(_502), as_type<float>(_508)), uint2(int2(_544, _546)));
}

