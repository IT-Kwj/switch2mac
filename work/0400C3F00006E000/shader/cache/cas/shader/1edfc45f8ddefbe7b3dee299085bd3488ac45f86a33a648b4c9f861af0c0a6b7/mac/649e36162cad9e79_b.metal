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
    constant _16* cp_c0 [[id(1)]];
    constant _16* cp_c4 [[id(2)]];
    constant _16* cp_c3 [[id(3)]];
    constant _16* cp_c5 [[id(4)]];
    constant _16* cp_c6 [[id(5)]];
    device _29* cp_s0 [[id(6)]];
    device _29* cp_s1 [[id(7)]];
    device _29* cp_s2 [[id(8)]];
    device _29* cp_s3 [[id(9)]];
    device _29* cp_s4 [[id(10)]];
    texture2d<float> cp_t_tcb_A [[id(11)]];
    sampler cp_t_tcb_ASmplr [[id(12)]];
    texture2d<float> cp_t_tcb_C [[id(13)]];
    sampler cp_t_tcb_CSmplr [[id(14)]];
    texture2d<float> cp_t_tcb_8 [[id(15)]];
    sampler cp_t_tcb_8Smplr [[id(16)]];
    texture2d<float> cp_i_tcb_48_ [[id(17)]];
    sampler cp_t_tcb_ASmplr_w [[id(18)]];
    sampler cp_t_tcb_8Smplr_w [[id(19)]];
    constant dm_border_t* dm_border [[id(20)]];
};

static inline __attribute__((always_inline))
int _72(thread const int& _4292, thread const int& _4293, constant _10& support_buffer)
{
    int _4296 = 1 + _4293;
    float _4298 = support_buffer._m5[_4296].x;
    bool _4300 = _4298 == 1.0;
    if (_4300)
    {
        return _4292;
    }
    float _4302 = float(_4292);
    float _4304 = _4302 * _4298;
    int _4306 = int(_4304);
    return _4306;
}

static inline __attribute__((always_inline))
int _74(thread const int& _4326, thread const int& _4327, thread const int& _4328, thread int& _4329, thread uint& gl_SubgroupInvocationID)
{
    int _4332 = _4328 & 31;
    uint _4334 = uint(int(uint(_4328) >> uint(8)));
    int _4336 = int(_4334) & 31;
    float _4338 = as_type<float>(gl_SubgroupInvocationID);
    int _4340 = as_type<int>(_4338) & _4336;
    int _4342 = ~_4336;
    int _4344 = _4332 & _4342;
    int _4346 = _4344 | _4340;
    int _4348 = ~_4336;
    int _4350 = _4327 & _4348;
    int _4352 = _4350 | _4340;
    bool _4354 = uint(_4352) <= uint(_4346);
    _4329 = _4354 ? (-1) : 0;
    float _4356 = spvSubgroupShuffle(as_type<float>(_4326), uint(_4352));
    uint _4358 = uint(_4354 ? as_type<int>(_4356) : _4326);
    return int(_4358);
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    uint4 gl_SubgroupLtMask = uint4(extract_bits(0xFFFFFFFF, 0, min(gl_SubgroupInvocationID, 32u)), extract_bits(0xFFFFFFFF, 0, (uint)max((int)gl_SubgroupInvocationID - 32, 0)), uint2(0));
    float _78 = as_type<float>(gl_WorkGroupID.y);
    float _80 = as_type<float>(gl_LocalInvocationID.y);
    float _82 = as_type<float>(gl_LocalInvocationID.x);
    float _84 = as_type<float>(gl_WorkGroupID.x);
    float _86 = as_type<float>(gl_WorkGroupID.z);
    int _88 = as_type<int>(_78) << 3;
    int _90 = -as_type<int>(_80);
    bool _94 = _90 != _88;
    int _96 = -as_type<int>(_82);
    int _98 = as_type<int>(_84) << 3;
    bool _100 = _96 == _98;
    bool _102 = !_94;
    bool _104 = _100 && _102;
    bool _106 = 0 == as_type<int>(_86);
    bool _108 = _106 && _104;
    bool _110 = !_108;
    if (!_110)
    {
        (*spvDescriptorSet0.cp_s0)._m0[0] = 0u;
        bool _112 = 0u < as_type<uint>((*spvDescriptorSet0.cp_c4)._m0[0].x);
        bool _114 = !_112;
        if (!_114)
        {
            bool _116 = 0u >= as_type<uint>((*spvDescriptorSet0.cp_c4)._m0[0].x);
            bool _118 = !_116;
            uint _121 = 0u;
            int _123 = -1;
            if (!_118)
            {
                (*spvDescriptorSet0.cp_s1)._m0[1] = 0u;
                (*spvDescriptorSet0.cp_s2)._m0[0] = 0u;
                _121 = 1u;
                _123 = 0;
            }
            uint _125 = _121;
            int _127 = _123;
            bool _129 = _125 >= as_type<uint>((*spvDescriptorSet0.cp_c4)._m0[0].x);
            int _131 = ~int(_125);
            int _133 = _131 + as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x);
            int _135 = _133 + 1;
            bool _137 = uint(_135) <= 3u;
            bool _139 = _137 || _129;
            int _141 = int(_125);
            uint _143 = _125;
            int _145 = _127;
            if (!_139)
            {
                int _147 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) + (-3);
                _145 = 0;
                bool _149;
                do
                {
                    int _151 = _141;
                    int _153 = _151 << 2;
                    int _155 = _151 + 1;
                    int _157 = _151 * 20;
                    int _159 = _157 + 4;
                    int _161 = _151 + 2;
                    int _163 = _151 + 3;
                    uint _165 = uint(int(uint(_159) >> uint(2)));
                    (*spvDescriptorSet0.cp_s1)._m0[int(_165)] = 0u;
                    int _167 = _155 << 2;
                    int _169 = _161 << 2;
                    uint _171 = uint(int(uint(_153) >> uint(2)));
                    (*spvDescriptorSet0.cp_s2)._m0[int(_171)] = 0u;
                    int _173 = _159 + 20;
                    int _175 = _163 << 2;
                    int _177 = _159 + 40;
                    uint _179 = uint(int(uint(_173) >> uint(2)));
                    (*spvDescriptorSet0.cp_s1)._m0[int(_179)] = 0u;
                    int _181 = _159 + 60;
                    uint _183 = uint(int(uint(_167) >> uint(2)));
                    (*spvDescriptorSet0.cp_s2)._m0[int(_183)] = 0u;
                    int _185 = _151 + 4;
                    uint _187 = uint(int(uint(_177) >> uint(2)));
                    (*spvDescriptorSet0.cp_s1)._m0[int(_187)] = 0u;
                    bool _189 = uint(_185) >= uint(_147);
                    uint _191 = uint(int(uint(_169) >> uint(2)));
                    (*spvDescriptorSet0.cp_s2)._m0[int(_191)] = 0u;
                    uint _193 = uint(int(uint(_181) >> uint(2)));
                    (*spvDescriptorSet0.cp_s1)._m0[int(_193)] = 0u;
                    uint _195 = uint(int(uint(_175) >> uint(2)));
                    (*spvDescriptorSet0.cp_s2)._m0[int(_195)] = 0u;
                    _149 = !_189;
                    _141 = _185;
                    _143 = uint(_185);
                } while (_149);
            }
            uint _197 = _143;
            int _199 = _145;
            bool _201 = _197 >= as_type<uint>((*spvDescriptorSet0.cp_c4)._m0[0].x);
            int _203 = ~int(_197);
            int _205 = _203 + as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x);
            int _207 = _205 + 1;
            bool _209 = uint(_207) <= 1u;
            bool _211 = _209 || _201;
            uint _213 = _197;
            int _215 = _199;
            if (!_211)
            {
                int _217 = int(_197) + 1;
                int _219 = int(_197) << 2;
                int _221 = int(_197) * 20;
                int _223 = _221 + 4;
                int _225 = _217 << 2;
                int _227 = int(_197) + 2;
                int _229 = _223 + 20;
                uint _231 = uint(int(uint(_223) >> uint(2)));
                (*spvDescriptorSet0.cp_s1)._m0[int(_231)] = 0u;
                uint _233 = uint(int(uint(_219) >> uint(2)));
                (*spvDescriptorSet0.cp_s2)._m0[int(_233)] = 0u;
                uint _235 = uint(int(uint(_229) >> uint(2)));
                (*spvDescriptorSet0.cp_s1)._m0[int(_235)] = 0u;
                uint _237 = uint(int(uint(_225) >> uint(2)));
                (*spvDescriptorSet0.cp_s2)._m0[int(_237)] = 0u;
                _213 = uint(_227);
                _215 = 0;
            }
            uint _239 = _213;
            int _241 = _215;
            bool _243 = _239 < as_type<uint>((*spvDescriptorSet0.cp_c4)._m0[0].x);
            int _245 = (_243 ? (-1) : 0) | _241;
            int _247 = ~_245;
            if (!(_247 != 0))
            {
                int _249 = int(_239) << 2;
                int _251 = int(_239) * 20;
                int _253 = _251 + 4;
                uint _255 = uint(int(uint(_253) >> uint(2)));
                (*spvDescriptorSet0.cp_s1)._m0[int(_255)] = 0u;
                uint _257 = uint(int(uint(_249) >> uint(2)));
                (*spvDescriptorSet0.cp_s2)._m0[int(_257)] = 0u;
            }
        }
    }
    int _259 = as_type<int>(_82) + _98;
    threadgroup_barrier(mem_flags::mem_threadgroup);
    int _261 = as_type<int>(_80) + _88;
    float _263 = float(uint(_259));
    float _265 = float(uint(_261));
    float _267 = _263 + 0.5;
    float _269 = _265 + 0.5;
    float _271 = fma(_267, (*spvDescriptorSet0.cp_c3)._m0[0].z, (*spvDescriptorSet0.cp_c3)._m0[0].x);
    float _273 = fma(_269, (*spvDescriptorSet0.cp_c3)._m0[0].z, (*spvDescriptorSet0.cp_c3)._m0[0].y);
    int _275 = as_type<int>(_271) * 1664525;
    int _277 = _275 + 1013904223;
    int _279 = as_type<int>(_273) * 1664525;
    int _281 = _279 + 1013904223;
    int _283 = _281 * 1343943519;
    int _285 = _283 + _277;
    int _287 = _285 * 1343943519;
    int _289 = _287 + _281;
    uint _291 = uint(int(uint(_285) >> uint(16)));
    int _293 = _285 * _289;
    int _295 = _293 + 1343943519;
    uint _297 = uint(int(uint(_289) >> uint(16)));
    int _299 = _285 ^ int(_291);
    uint _301 = uint(int(uint(_295) >> uint(16)));
    int _303 = _289 ^ int(_297);
    int _305 = _295 ^ int(_301);
    int _307 = _303 * _305;
    int _309 = _307 + _299;
    int _311 = _305 * _309;
    int _313 = _311 + _303;
    uint _315 = uint(int(uint(_309) >> uint(9)));
    int _317 = int(_315) + 1065353216;
    uint _319 = uint(int(uint(_313) >> uint(9)));
    int _321 = int(_319) + 1065353216;
    float _323 = as_type<float>(_317) + (-1.5);
    float _325 = as_type<float>(_321) + (-1.5);
    float _327 = fma(_323, (*spvDescriptorSet0.cp_c3)._m0[0].z, _271);
    float _329 = fma(_325, (*spvDescriptorSet0.cp_c3)._m0[0].z, _273);
    float _331 = fma(_327, 6.2500002968590706586837768554688e-05, 0.5);
    float _333 = fma(_329, 6.2500002968590706586837768554688e-05, 0.5);
    threadgroup_barrier(mem_flags::mem_device | mem_flags::mem_threadgroup | mem_flags::mem_texture);
    float2 _2039 = float2(_331, _333);
    float _335 = dm_bs(spvDescriptorSet0.cp_t_tcb_A.sample(spvDescriptorSet0.cp_t_tcb_ASmplr, select(_2039, float2(0.0), isnan(_2039)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_A, spvDescriptorSet0.cp_t_tcb_ASmplr_w, select(_2039, float2(0.0), isnan(_2039)), level(0.0)).x;
    float2 _2050 = float2(_331, _333);
    float4 _338 = spvDescriptorSet0.cp_t_tcb_C.gather(spvDescriptorSet0.cp_t_tcb_CSmplr, select(_2050, float2(0.0), isnan(_2050)), int2(0), component::x).xyzw;
    float _340 = _338.x;
    float _342 = _338.y;
    float _344 = _338.z;
    float _346 = _338.w;
    float _348 = fma(_327, 6.2500002968590706586837768554688e-05, 0.500062525272369384765625);
    float _350 = fma(_329, 6.2500002968590706586837768554688e-05, 0.500062525272369384765625);
    float2 _2071 = float2(_348, _333);
    float _352 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_2071, float2(0.0), isnan(_2071)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_2071, float2(0.0), isnan(_2071)), level(0.0)).x;
    float2 _2079 = float2(_331, _333);
    float _354 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_2079, float2(0.0), isnan(_2079)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_2079, float2(0.0), isnan(_2079)), level(0.0)).x;
    float2 _2087 = float2(_331, _350);
    float _356 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_2087, float2(0.0), isnan(_2087)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_2087, float2(0.0), isnan(_2087)), level(0.0)).x;
    float _358 = as_type<float>(_321) + (-1.0);
    int _360 = _309 * _313;
    int _362 = _360 + _305;
    bool _364 = _358 > _335;
    int _366 = as_type<int>(_340);
    if (_364)
    {
        return;
    }
    uint _368 = uint(int(uint(_362) >> uint(30)));
    int _370 = int(_368) << 2;
    bool _372 = _370 == 4;
    bool _374 = _370 == 8;
    bool _376 = _370 == 12;
    if (_372)
    {
        _366 = as_type<int>(_342);
    }
    int _378 = _366;
    int _380 = _378;
    if (_374)
    {
        _380 = as_type<int>(_344);
    }
    int _382 = _380;
    int _384 = _382;
    if (_376)
    {
        _384 = as_type<int>(_346);
    }
    int _386 = _384;
    bool _388 = _386 != 0;
    if (!_388)
    {
        return;
    }
    uint _390 = uint(int(uint(_362) >> uint(26)));
    int _392 = _386 + (-1);
    int _394 = int(_390);
    int _396 = 3;
    int _398 = _72(_394, _396, (*spvDescriptorSet0.support_buffer));
    int _400 = _392;
    int _402 = 3;
    int _404 = _72(_400, _402, (*spvDescriptorSet0.support_buffer));
    float _406 = spvDescriptorSet0.cp_i_tcb_48_.read(uint2(int2(_398, _404))).x;
    float _408 = -_354;
    float _410 = _408 + _352;
    float _412 = -_354;
    float _414 = _412 + _356;
    float _416 = _410 * 2000.0;
    float _418 = _414 * 2000.0;
    float _420 = fma(_416, _416, 1.0);
    float _422 = fma(_418, _418, _420);
    float _424 = rsqrt(_422);
    bool _426 = _424 >= 0.5;
    bool _428 = isnan(_424);
    bool _430 = _426 || _428;
    bool _432 = isnan(0.5);
    bool _434 = _430 || _432;
    if (!_434)
    {
        return;
    }
    int _436 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].y) + (-1);
    uint _438 = min(as_type<uint>(_406), uint(_436));
    int _440 = int(_438) << 5;
    int _442 = _440 + 24;
    uint _444 = uint(int(uint(_440) >> uint(2)));
    float _446 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[int(_444)]);
    int _448 = _440 + 4;
    uint _450 = uint(int(uint(_448) >> uint(2)));
    float _452 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[int(_450)]);
    int _454 = _440 + 8;
    uint _456 = uint(int(uint(_454) >> uint(2)));
    float _458 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[int(_456)]);
    int _460 = _440 + 12;
    uint _462 = uint(int(uint(_460) >> uint(2)));
    float _464 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[int(_462)]);
    int _466 = _440 + 28;
    uint _468 = uint(int(uint(_442) >> uint(2)));
    float _470 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[int(_468)]);
    uint _472 = uint(int(uint(_466) >> uint(2)));
    float _474 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[int(_472)]);
    float _476 = _354 * 2000.0;
    float _478 = -_470;
    float _480 = _478 + _474;
    float _482 = fma(_358, _480, _470);
    float _484 = fma(_452, _482, _476);
    float _486 = fma(_446, _482, _327);
    float _488 = _484 * (*spvDescriptorSet0.cp_c5)._m0[1].y;
    float _490 = fma(_458, _482, _329);
    float _492 = _484 * (*spvDescriptorSet0.cp_c5)._m0[0].y;
    float _494 = fma(_486, (*spvDescriptorSet0.cp_c5)._m0[1].x, _488);
    float _496 = _484 * (*spvDescriptorSet0.cp_c5)._m0[2].y;
    float _498 = fma(_486, (*spvDescriptorSet0.cp_c5)._m0[0].x, _492);
    float _500 = fma(_490, (*spvDescriptorSet0.cp_c5)._m0[1].z, _494);
    float _502 = _484 * (*spvDescriptorSet0.cp_c5)._m0[3].y;
    float _504 = fma(_486, (*spvDescriptorSet0.cp_c5)._m0[2].x, _496);
    float _506 = _464 * _482;
    float _508 = fma(_490, (*spvDescriptorSet0.cp_c5)._m0[0].z, _498);
    float _510 = _500 + (*spvDescriptorSet0.cp_c5)._m0[1].w;
    float _512 = fma(_486, (*spvDescriptorSet0.cp_c5)._m0[3].x, _502);
    float _514 = fma(_490, (*spvDescriptorSet0.cp_c5)._m0[2].z, _504);
    float _516 = _508 + (*spvDescriptorSet0.cp_c5)._m0[0].w;
    bool _518 = _510 >= _506;
    bool _520 = isnan(_510);
    bool _522 = _518 || _520;
    bool _524 = isnan(_506);
    bool _526 = _522 || _524;
    float _528 = fma(_490, (*spvDescriptorSet0.cp_c5)._m0[3].z, _512);
    float _530 = _514 + (*spvDescriptorSet0.cp_c5)._m0[2].w;
    bool _532 = _516 < _506;
    bool _534 = !_526;
    bool _536 = _532 && _534;
    float _538 = _528 + (*spvDescriptorSet0.cp_c5)._m0[3].w;
    bool _540 = _530 < _506;
    bool _542 = _540 && _536;
    bool _544 = _538 < _506;
    bool _546 = _544 && _542;
    if (!_546)
    {
        return;
    }
    float _548 = -_484;
    float _550 = _548 + (*spvDescriptorSet0.cp_c5)._m0[4].y;
    float _552 = -_486;
    float _554 = _552 + (*spvDescriptorSet0.cp_c5)._m0[4].x;
    float _556 = _550 * _550;
    float _558 = -(*spvDescriptorSet0.cp_c3)._m0[0].z;
    float _560 = fma(_558, 3.0, (*spvDescriptorSet0.cp_c3)._m0[0].w);
    float _562 = -_490;
    float _564 = _562 + (*spvDescriptorSet0.cp_c5)._m0[4].z;
    float _566 = fma(_554, _554, _556);
    float _568 = _560 * _560;
    float _570 = fma(_564, _564, _566);
    bool _572 = _570 > _568;
    if (_572)
    {
        return;
    }
    int _574 = _440 + 16;
    float _576 = (*spvDescriptorSet0.cp_c6)._m0[0].x * (*spvDescriptorSet0.cp_c6)._m0[0].x;
    bool _578 = _570 > _576;
    if (_578)
    {
        return;
    }
    uint _580 = uint(int(uint(_574) >> uint(2)));
    float _582 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[int(_580)]);
    int _584 = _440 + 20;
    float _586 = as_type<float>(gl_SubgroupInvocationID);
    uint _588 = uint(int(uint(_584) >> uint(2)));
    float _590 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[int(_588)]);
    int _592 = as_type<int>(_582) * 20;
    int _594 = _592 + 4;
    int _596 = _594 + as_type<int>((*spvDescriptorSet0.cp_c0)._m0[54].x);
    bool _598 = uint(_596) < uint(_594);
    int _600 = int(_598);
    bool _602 = uint(_596) < uint(_596);
    int _604 = int(_602);
    int _606 = _600 + _604;
    int _608 = _606 & 1;
    bool _610 = _608 != 0;
    int _612 = int(_610);
    int _614 = as_type<int>((*spvDescriptorSet0.cp_c0)._m0[54].y) + _612;
    uint _616 = spvSubgroupBallot(true).x;
    float _618 = spvSubgroupShuffle(as_type<float>(_596), 0u);
    bool _620 = as_type<int>(_618) == _596;
    float _622 = spvSubgroupShuffle(as_type<float>(_614), 0u);
    bool _624 = as_type<int>(_622) == _614;
    bool _626 = _620 && _624;
    int _628 = int(_626);
    float _630 = spvSubgroupShuffle(as_type<float>(_596), 1u);
    bool _632 = as_type<int>(_630) == _596;
    float _634 = spvSubgroupShuffle(as_type<float>(_614), 1u);
    bool _636 = as_type<int>(_634) == _614;
    bool _638 = _632 && _636;
    int _640 = _638 ? 2 : 0;
    int _642 = _628 | _640;
    float _644 = spvSubgroupShuffle(as_type<float>(_596), 2u);
    bool _646 = as_type<int>(_644) == _596;
    float _648 = spvSubgroupShuffle(as_type<float>(_614), 2u);
    bool _650 = as_type<int>(_648) == _614;
    bool _652 = _646 && _650;
    int _654 = _652 ? 4 : 0;
    int _656 = _642 | _654;
    float _658 = spvSubgroupShuffle(as_type<float>(_596), 3u);
    bool _660 = as_type<int>(_658) == _596;
    float _662 = spvSubgroupShuffle(as_type<float>(_614), 3u);
    bool _664 = as_type<int>(_662) == _614;
    bool _666 = _660 && _664;
    int _668 = _666 ? 8 : 0;
    int _670 = _656 | _668;
    float _672 = spvSubgroupShuffle(as_type<float>(_596), 4u);
    bool _674 = as_type<int>(_672) == _596;
    float _676 = spvSubgroupShuffle(as_type<float>(_614), 4u);
    bool _678 = as_type<int>(_676) == _614;
    bool _680 = _674 && _678;
    int _682 = _680 ? 16 : 0;
    int _684 = _670 | _682;
    float _686 = spvSubgroupShuffle(as_type<float>(_596), 5u);
    bool _688 = as_type<int>(_686) == _596;
    float _690 = spvSubgroupShuffle(as_type<float>(_614), 5u);
    bool _692 = as_type<int>(_690) == _614;
    bool _694 = _688 && _692;
    int _696 = _694 ? 32 : 0;
    int _698 = _684 | _696;
    float _700 = spvSubgroupShuffle(as_type<float>(_596), 6u);
    bool _702 = as_type<int>(_700) == _596;
    float _704 = spvSubgroupShuffle(as_type<float>(_614), 6u);
    bool _706 = as_type<int>(_704) == _614;
    bool _708 = _702 && _706;
    int _710 = _708 ? 64 : 0;
    int _712 = _698 | _710;
    float _714 = spvSubgroupShuffle(as_type<float>(_596), 7u);
    bool _716 = as_type<int>(_714) == _596;
    float _718 = spvSubgroupShuffle(as_type<float>(_614), 7u);
    bool _720 = as_type<int>(_718) == _614;
    bool _722 = _716 && _720;
    int _724 = _722 ? 128 : 0;
    int _726 = _712 | _724;
    float _728 = spvSubgroupShuffle(as_type<float>(_596), 8u);
    bool _730 = as_type<int>(_728) == _596;
    float _732 = spvSubgroupShuffle(as_type<float>(_614), 8u);
    bool _734 = as_type<int>(_732) == _614;
    bool _736 = _730 && _734;
    int _738 = _736 ? 256 : 0;
    int _740 = _726 | _738;
    float _742 = spvSubgroupShuffle(as_type<float>(_596), 9u);
    bool _744 = as_type<int>(_742) == _596;
    float _746 = spvSubgroupShuffle(as_type<float>(_614), 9u);
    bool _748 = as_type<int>(_746) == _614;
    bool _750 = _744 && _748;
    int _752 = _750 ? 512 : 0;
    int _754 = _740 | _752;
    float _756 = spvSubgroupShuffle(as_type<float>(_596), 10u);
    bool _758 = as_type<int>(_756) == _596;
    float _760 = spvSubgroupShuffle(as_type<float>(_614), 10u);
    bool _762 = as_type<int>(_760) == _614;
    bool _764 = _758 && _762;
    int _766 = _764 ? 1024 : 0;
    int _768 = _754 | _766;
    float _770 = spvSubgroupShuffle(as_type<float>(_596), 11u);
    bool _772 = as_type<int>(_770) == _596;
    float _774 = spvSubgroupShuffle(as_type<float>(_614), 11u);
    bool _776 = as_type<int>(_774) == _614;
    bool _778 = _772 && _776;
    int _780 = _778 ? 2048 : 0;
    int _782 = _768 | _780;
    float _784 = spvSubgroupShuffle(as_type<float>(_596), 12u);
    bool _786 = as_type<int>(_784) == _596;
    float _788 = spvSubgroupShuffle(as_type<float>(_614), 12u);
    bool _790 = as_type<int>(_788) == _614;
    bool _792 = _786 && _790;
    int _794 = _792 ? 4096 : 0;
    int _796 = _782 | _794;
    float _798 = spvSubgroupShuffle(as_type<float>(_596), 13u);
    bool _800 = as_type<int>(_798) == _596;
    float _802 = spvSubgroupShuffle(as_type<float>(_614), 13u);
    bool _804 = as_type<int>(_802) == _614;
    bool _806 = _800 && _804;
    int _808 = _806 ? 8192 : 0;
    int _810 = _796 | _808;
    float _812 = spvSubgroupShuffle(as_type<float>(_596), 14u);
    bool _814 = as_type<int>(_812) == _596;
    float _816 = spvSubgroupShuffle(as_type<float>(_614), 14u);
    bool _818 = as_type<int>(_816) == _614;
    bool _820 = _814 && _818;
    int _822 = _820 ? 16384 : 0;
    int _824 = _810 | _822;
    float _826 = spvSubgroupShuffle(as_type<float>(_596), 15u);
    bool _828 = as_type<int>(_826) == _596;
    float _830 = spvSubgroupShuffle(as_type<float>(_614), 15u);
    bool _832 = as_type<int>(_830) == _614;
    bool _834 = _828 && _832;
    int _836 = _834 ? 32768 : 0;
    int _838 = _824 | _836;
    float _840 = spvSubgroupShuffle(as_type<float>(_596), 16u);
    bool _842 = as_type<int>(_840) == _596;
    float _844 = spvSubgroupShuffle(as_type<float>(_614), 16u);
    bool _846 = as_type<int>(_844) == _614;
    bool _848 = _842 && _846;
    int _850 = _848 ? 65536 : 0;
    int _852 = _838 | _850;
    float _854 = spvSubgroupShuffle(as_type<float>(_596), 17u);
    bool _856 = as_type<int>(_854) == _596;
    float _858 = spvSubgroupShuffle(as_type<float>(_614), 17u);
    bool _860 = as_type<int>(_858) == _614;
    bool _862 = _856 && _860;
    int _864 = _862 ? 131072 : 0;
    int _866 = _852 | _864;
    float _868 = spvSubgroupShuffle(as_type<float>(_596), 18u);
    bool _870 = as_type<int>(_868) == _596;
    float _872 = spvSubgroupShuffle(as_type<float>(_614), 18u);
    bool _874 = as_type<int>(_872) == _614;
    bool _876 = _870 && _874;
    int _878 = _876 ? 262144 : 0;
    int _880 = _866 | _878;
    float _882 = spvSubgroupShuffle(as_type<float>(_596), 19u);
    bool _884 = as_type<int>(_882) == _596;
    float _886 = spvSubgroupShuffle(as_type<float>(_614), 19u);
    bool _888 = as_type<int>(_886) == _614;
    bool _890 = _884 && _888;
    int _892 = _890 ? 524288 : 0;
    int _894 = _880 | _892;
    float _896 = spvSubgroupShuffle(as_type<float>(_596), 20u);
    bool _898 = as_type<int>(_896) == _596;
    float _900 = spvSubgroupShuffle(as_type<float>(_614), 20u);
    bool _902 = as_type<int>(_900) == _614;
    bool _904 = _898 && _902;
    int _906 = _904 ? 1048576 : 0;
    int _908 = _894 | _906;
    float _910 = spvSubgroupShuffle(as_type<float>(_596), 21u);
    bool _912 = as_type<int>(_910) == _596;
    float _914 = spvSubgroupShuffle(as_type<float>(_614), 21u);
    bool _916 = as_type<int>(_914) == _614;
    bool _918 = _912 && _916;
    int _920 = _918 ? 2097152 : 0;
    int _922 = _908 | _920;
    float _924 = spvSubgroupShuffle(as_type<float>(_596), 22u);
    bool _926 = as_type<int>(_924) == _596;
    float _928 = spvSubgroupShuffle(as_type<float>(_614), 22u);
    bool _930 = as_type<int>(_928) == _614;
    bool _932 = _926 && _930;
    int _934 = _932 ? 4194304 : 0;
    int _936 = _922 | _934;
    float _938 = spvSubgroupShuffle(as_type<float>(_596), 23u);
    bool _940 = as_type<int>(_938) == _596;
    float _942 = spvSubgroupShuffle(as_type<float>(_614), 23u);
    bool _944 = as_type<int>(_942) == _614;
    bool _946 = _940 && _944;
    int _948 = _946 ? 8388608 : 0;
    int _950 = _936 | _948;
    float _952 = spvSubgroupShuffle(as_type<float>(_596), 24u);
    bool _954 = as_type<int>(_952) == _596;
    float _956 = spvSubgroupShuffle(as_type<float>(_614), 24u);
    bool _958 = as_type<int>(_956) == _614;
    bool _960 = _954 && _958;
    int _962 = _960 ? 16777216 : 0;
    int _964 = _950 | _962;
    float _966 = spvSubgroupShuffle(as_type<float>(_596), 25u);
    bool _968 = as_type<int>(_966) == _596;
    float _970 = spvSubgroupShuffle(as_type<float>(_614), 25u);
    bool _972 = as_type<int>(_970) == _614;
    bool _974 = _968 && _972;
    int _976 = _974 ? 33554432 : 0;
    int _978 = _964 | _976;
    float _980 = spvSubgroupShuffle(as_type<float>(_596), 26u);
    bool _982 = as_type<int>(_980) == _596;
    float _984 = spvSubgroupShuffle(as_type<float>(_614), 26u);
    bool _986 = as_type<int>(_984) == _614;
    bool _988 = _982 && _986;
    int _990 = _988 ? 67108864 : 0;
    int _992 = _978 | _990;
    float _994 = spvSubgroupShuffle(as_type<float>(_596), 27u);
    bool _996 = as_type<int>(_994) == _596;
    float _998 = spvSubgroupShuffle(as_type<float>(_614), 27u);
    bool _1000 = as_type<int>(_998) == _614;
    bool _1002 = _996 && _1000;
    int _1004 = _1002 ? 134217728 : 0;
    int _1006 = _992 | _1004;
    float _1008 = spvSubgroupShuffle(as_type<float>(_596), 28u);
    bool _1010 = as_type<int>(_1008) == _596;
    float _1012 = spvSubgroupShuffle(as_type<float>(_614), 28u);
    bool _1014 = as_type<int>(_1012) == _614;
    bool _1016 = _1010 && _1014;
    int _1018 = _1016 ? 268435456 : 0;
    int _1020 = _1006 | _1018;
    float _1022 = spvSubgroupShuffle(as_type<float>(_596), 29u);
    bool _1024 = as_type<int>(_1022) == _596;
    float _1026 = spvSubgroupShuffle(as_type<float>(_614), 29u);
    bool _1028 = as_type<int>(_1026) == _614;
    bool _1030 = _1024 && _1028;
    int _1032 = _1030 ? 536870912 : 0;
    int _1034 = _1020 | _1032;
    float _1036 = spvSubgroupShuffle(as_type<float>(_596), 30u);
    bool _1038 = as_type<int>(_1036) == _596;
    float _1040 = spvSubgroupShuffle(as_type<float>(_614), 30u);
    bool _1042 = as_type<int>(_1040) == _614;
    bool _1044 = _1038 && _1042;
    int _1046 = _1044 ? 1073741824 : 0;
    int _1048 = _1034 | _1046;
    float _1050 = spvSubgroupShuffle(as_type<float>(_596), 31u);
    bool _1052 = as_type<int>(_1050) == _596;
    float _1054 = spvSubgroupShuffle(as_type<float>(_614), 31u);
    bool _1056 = as_type<int>(_1054) == _614;
    bool _1058 = _1052 && _1056;
    int _1060 = _1058 ? int(0x80000000) : 0;
    int _1062 = _1048 | _1060;
    int _1064 = _1062 & int(_616);
    bool _1066 = _1064 == int(_616);
    if (!_1066)
    {
        uint _1068 = uint(int(uint(_594) >> uint(2)));
        uint _3314 = atomic_fetch_add_explicit((device atomic_uint*)&(*spvDescriptorSet0.cp_s1)._m0[int(_1068)], 1u, memory_order_relaxed);
        uint _1070 = _3314;
    }
    bool _1072 = !_1066;
    if (!_1072)
    {
        float _1074 = as_type<float>(gl_SubgroupInvocationID);
        uint _1076 = spvSubgroupBallot(true).x;
        int _1078 = int(spvFindUMSB(_1076));
        int _1080 = popcount(int(_1076));
        bool _1082 = as_type<int>(_1074) == _1078;
        if (_1082)
        {
            uint _1084 = uint(int(uint(_594) >> uint(2)));
            uint _3345 = atomic_fetch_add_explicit((device atomic_uint*)&(*spvDescriptorSet0.cp_s1)._m0[int(_1084)], uint(_1080), memory_order_relaxed);
            uint _1086 = _3345;
        }
    }
    uint _1088 = spvSubgroupBallot(true).x;
    int _1090 = int(spvFindUMSB(_1088));
    int _1092 = popcount(int(_1088));
    bool _1094 = _1090 == as_type<int>(_586);
    int _1096 = as_type<int>(_458);
    if (_1094)
    {
        uint _3367 = atomic_fetch_add_explicit((device atomic_uint*)&(*spvDescriptorSet0.cp_s0)._m0[0], uint(_1092), memory_order_relaxed);
        uint _1098 = _3367;
        _1096 = int(_1098);
    }
    int _1100 = _1096;
    float _1102 = as_type<float>(gl_SubgroupLtMask.x);
    float _1104 = -_416;
    float _1106 = fma(_1104, _424, -0.0);
    int _1108 = as_type<int>(_1102) & int(_1088);
    int _1110 = popcount(_1108);
    int _1112 = _1100;
    int _1114 = _1090;
    int _1116 = 31;
    int _1118;
    int _3391 = _74(_1112, _1114, _1116, _1118, gl_SubgroupInvocationID);
    int _1120 = _3391;
    int _1122 = _1120 + _1110;
    int _1124 = _1122 + 64;
    int _1126 = _1122 * 48;
    uint _1128 = uint(int(uint(_1124) >> uint(6)));
    float _1130 = _576 * 0.10000002384185791015625;
    float _1132 = fma(_576, -0.89999997615814208984375, _570);
    uint _1134 = uint(int(uint(_1126) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1134)] = as_type<uint>(_327);
    int _1136 = _1126 + 4;
    uint _1138 = uint(int(uint(_1136) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1138)] = as_type<uint>(_476);
    int _1140 = _1126 + 8;
    uint _1142 = uint(int(uint(_1140) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1142)] = as_type<uint>(_329);
    int _1144 = _1126 + 12;
    uint _1146 = uint(int(uint(_1144) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1146)] = as_type<uint>(_482);
    uint _1148 = spvSubgroupBallot(true).x;
    float _1150 = spvSubgroupShuffle(as_type<float>(_1128), 0u);
    int _1152 = int(_1148) & 1;
    bool _1154 = _1152 != 0;
    uint _1156 = uint(_1154 ? as_type<int>(_1150) : 0);
    float _1158 = spvSubgroupShuffle(as_type<float>(_1128), 1u);
    uint _1160 = max(_1156, as_type<uint>(_1158));
    uint _1162 = uint(int(uint(int(_1148)) >> uint(1)));
    int _1164 = int(_1162) & 1;
    bool _1166 = _1164 != 0;
    uint _1168 = uint(_1166 ? int(_1160) : int(_1156));
    float _1170 = spvSubgroupShuffle(as_type<float>(_1128), 2u);
    uint _1172 = max(_1168, as_type<uint>(_1170));
    uint _1174 = uint(int(uint(int(_1148)) >> uint(2)));
    int _1176 = int(_1174) & 1;
    bool _1178 = _1176 != 0;
    uint _1180 = uint(_1178 ? int(_1172) : int(_1168));
    float _1182 = spvSubgroupShuffle(as_type<float>(_1128), 3u);
    uint _1184 = max(_1180, as_type<uint>(_1182));
    uint _1186 = uint(int(uint(int(_1148)) >> uint(3)));
    int _1188 = int(_1186) & 1;
    bool _1190 = _1188 != 0;
    uint _1192 = uint(_1190 ? int(_1184) : int(_1180));
    float _1194 = spvSubgroupShuffle(as_type<float>(_1128), 4u);
    uint _1196 = max(_1192, as_type<uint>(_1194));
    uint _1198 = uint(int(uint(int(_1148)) >> uint(4)));
    int _1200 = int(_1198) & 1;
    bool _1202 = _1200 != 0;
    uint _1204 = uint(_1202 ? int(_1196) : int(_1192));
    float _1206 = spvSubgroupShuffle(as_type<float>(_1128), 5u);
    uint _1208 = max(_1204, as_type<uint>(_1206));
    uint _1210 = uint(int(uint(int(_1148)) >> uint(5)));
    int _1212 = int(_1210) & 1;
    bool _1214 = _1212 != 0;
    uint _1216 = uint(_1214 ? int(_1208) : int(_1204));
    float _1218 = spvSubgroupShuffle(as_type<float>(_1128), 6u);
    uint _1220 = max(_1216, as_type<uint>(_1218));
    uint _1222 = uint(int(uint(int(_1148)) >> uint(6)));
    int _1224 = int(_1222) & 1;
    bool _1226 = _1224 != 0;
    uint _1228 = uint(_1226 ? int(_1220) : int(_1216));
    float _1230 = spvSubgroupShuffle(as_type<float>(_1128), 7u);
    uint _1232 = max(_1228, as_type<uint>(_1230));
    uint _1234 = uint(int(uint(int(_1148)) >> uint(7)));
    int _1236 = int(_1234) & 1;
    bool _1238 = _1236 != 0;
    uint _1240 = uint(_1238 ? int(_1232) : int(_1228));
    float _1242 = spvSubgroupShuffle(as_type<float>(_1128), 8u);
    uint _1244 = max(_1240, as_type<uint>(_1242));
    uint _1246 = uint(int(uint(int(_1148)) >> uint(8)));
    int _1248 = int(_1246) & 1;
    bool _1250 = _1248 != 0;
    uint _1252 = uint(_1250 ? int(_1244) : int(_1240));
    float _1254 = spvSubgroupShuffle(as_type<float>(_1128), 9u);
    uint _1256 = max(_1252, as_type<uint>(_1254));
    uint _1258 = uint(int(uint(int(_1148)) >> uint(9)));
    int _1260 = int(_1258) & 1;
    bool _1262 = _1260 != 0;
    uint _1264 = uint(_1262 ? int(_1256) : int(_1252));
    float _1266 = spvSubgroupShuffle(as_type<float>(_1128), 10u);
    uint _1268 = max(_1264, as_type<uint>(_1266));
    uint _1270 = uint(int(uint(int(_1148)) >> uint(10)));
    int _1272 = int(_1270) & 1;
    bool _1274 = _1272 != 0;
    uint _1276 = uint(_1274 ? int(_1268) : int(_1264));
    float _1278 = spvSubgroupShuffle(as_type<float>(_1128), 11u);
    uint _1280 = max(_1276, as_type<uint>(_1278));
    uint _1282 = uint(int(uint(int(_1148)) >> uint(11)));
    int _1284 = int(_1282) & 1;
    bool _1286 = _1284 != 0;
    uint _1288 = uint(_1286 ? int(_1280) : int(_1276));
    float _1290 = spvSubgroupShuffle(as_type<float>(_1128), 12u);
    uint _1292 = max(_1288, as_type<uint>(_1290));
    uint _1294 = uint(int(uint(int(_1148)) >> uint(12)));
    int _1296 = int(_1294) & 1;
    bool _1298 = _1296 != 0;
    uint _1300 = uint(_1298 ? int(_1292) : int(_1288));
    float _1302 = spvSubgroupShuffle(as_type<float>(_1128), 13u);
    uint _1304 = max(_1300, as_type<uint>(_1302));
    uint _1306 = uint(int(uint(int(_1148)) >> uint(13)));
    int _1308 = int(_1306) & 1;
    bool _1310 = _1308 != 0;
    uint _1312 = uint(_1310 ? int(_1304) : int(_1300));
    float _1314 = spvSubgroupShuffle(as_type<float>(_1128), 14u);
    uint _1316 = max(_1312, as_type<uint>(_1314));
    uint _1318 = uint(int(uint(int(_1148)) >> uint(14)));
    int _1320 = int(_1318) & 1;
    bool _1322 = _1320 != 0;
    uint _1324 = uint(_1322 ? int(_1316) : int(_1312));
    float _1326 = spvSubgroupShuffle(as_type<float>(_1128), 15u);
    uint _1328 = max(_1324, as_type<uint>(_1326));
    uint _1330 = uint(int(uint(int(_1148)) >> uint(15)));
    int _1332 = int(_1330) & 1;
    bool _1334 = _1332 != 0;
    uint _1336 = uint(_1334 ? int(_1328) : int(_1324));
    float _1338 = spvSubgroupShuffle(as_type<float>(_1128), 16u);
    uint _1340 = max(_1336, as_type<uint>(_1338));
    uint _1342 = uint(int(uint(int(_1148)) >> uint(16)));
    int _1344 = int(_1342) & 1;
    bool _1346 = _1344 != 0;
    uint _1348 = uint(_1346 ? int(_1340) : int(_1336));
    float _1350 = spvSubgroupShuffle(as_type<float>(_1128), 17u);
    uint _1352 = max(_1348, as_type<uint>(_1350));
    uint _1354 = uint(int(uint(int(_1148)) >> uint(17)));
    int _1356 = int(_1354) & 1;
    bool _1358 = _1356 != 0;
    uint _1360 = uint(_1358 ? int(_1352) : int(_1348));
    float _1362 = spvSubgroupShuffle(as_type<float>(_1128), 18u);
    uint _1364 = max(_1360, as_type<uint>(_1362));
    uint _1366 = uint(int(uint(int(_1148)) >> uint(18)));
    int _1368 = int(_1366) & 1;
    bool _1370 = _1368 != 0;
    uint _1372 = uint(_1370 ? int(_1364) : int(_1360));
    float _1374 = spvSubgroupShuffle(as_type<float>(_1128), 19u);
    uint _1376 = max(_1372, as_type<uint>(_1374));
    uint _1378 = uint(int(uint(int(_1148)) >> uint(19)));
    int _1380 = int(_1378) & 1;
    bool _1382 = _1380 != 0;
    uint _1384 = uint(_1382 ? int(_1376) : int(_1372));
    float _1386 = spvSubgroupShuffle(as_type<float>(_1128), 20u);
    uint _1388 = max(_1384, as_type<uint>(_1386));
    uint _1390 = uint(int(uint(int(_1148)) >> uint(20)));
    int _1392 = int(_1390) & 1;
    bool _1394 = _1392 != 0;
    uint _1396 = uint(_1394 ? int(_1388) : int(_1384));
    float _1398 = spvSubgroupShuffle(as_type<float>(_1128), 21u);
    uint _1400 = max(_1396, as_type<uint>(_1398));
    uint _1402 = uint(int(uint(int(_1148)) >> uint(21)));
    int _1404 = int(_1402) & 1;
    bool _1406 = _1404 != 0;
    uint _1408 = uint(_1406 ? int(_1400) : int(_1396));
    float _1410 = spvSubgroupShuffle(as_type<float>(_1128), 22u);
    uint _1412 = max(_1408, as_type<uint>(_1410));
    uint _1414 = uint(int(uint(int(_1148)) >> uint(22)));
    int _1416 = int(_1414) & 1;
    bool _1418 = _1416 != 0;
    uint _1420 = uint(_1418 ? int(_1412) : int(_1408));
    float _1422 = spvSubgroupShuffle(as_type<float>(_1128), 23u);
    uint _1424 = max(_1420, as_type<uint>(_1422));
    uint _1426 = uint(int(uint(int(_1148)) >> uint(23)));
    int _1428 = int(_1426) & 1;
    bool _1430 = _1428 != 0;
    uint _1432 = uint(_1430 ? int(_1424) : int(_1420));
    float _1434 = spvSubgroupShuffle(as_type<float>(_1128), 24u);
    uint _1436 = max(_1432, as_type<uint>(_1434));
    uint _1438 = uint(int(uint(int(_1148)) >> uint(24)));
    int _1440 = int(_1438) & 1;
    bool _1442 = _1440 != 0;
    uint _1444 = uint(_1442 ? int(_1436) : int(_1432));
    float _1446 = spvSubgroupShuffle(as_type<float>(_1128), 25u);
    uint _1448 = max(_1444, as_type<uint>(_1446));
    uint _1450 = uint(int(uint(int(_1148)) >> uint(25)));
    int _1452 = int(_1450) & 1;
    bool _1454 = _1452 != 0;
    uint _1456 = uint(_1454 ? int(_1448) : int(_1444));
    float _1458 = spvSubgroupShuffle(as_type<float>(_1128), 26u);
    uint _1460 = max(_1456, as_type<uint>(_1458));
    uint _1462 = uint(int(uint(int(_1148)) >> uint(26)));
    int _1464 = int(_1462) & 1;
    bool _1466 = _1464 != 0;
    uint _1468 = uint(_1466 ? int(_1460) : int(_1456));
    float _1470 = spvSubgroupShuffle(as_type<float>(_1128), 27u);
    uint _1472 = max(_1468, as_type<uint>(_1470));
    uint _1474 = uint(int(uint(int(_1148)) >> uint(27)));
    int _1476 = int(_1474) & 1;
    bool _1478 = _1476 != 0;
    uint _1480 = uint(_1478 ? int(_1472) : int(_1468));
    float _1482 = spvSubgroupShuffle(as_type<float>(_1128), 28u);
    uint _1484 = max(_1480, as_type<uint>(_1482));
    uint _1486 = uint(int(uint(int(_1148)) >> uint(28)));
    int _1488 = int(_1486) & 1;
    bool _1490 = _1488 != 0;
    uint _1492 = uint(_1490 ? int(_1484) : int(_1480));
    float _1494 = spvSubgroupShuffle(as_type<float>(_1128), 29u);
    uint _1496 = max(_1492, as_type<uint>(_1494));
    uint _1498 = uint(int(uint(int(_1148)) >> uint(29)));
    int _1500 = int(_1498) & 1;
    bool _1502 = _1500 != 0;
    uint _1504 = uint(_1502 ? int(_1496) : int(_1492));
    float _1506 = spvSubgroupShuffle(as_type<float>(_1128), 30u);
    uint _1508 = max(_1504, as_type<uint>(_1506));
    uint _1510 = uint(int(uint(int(_1148)) >> uint(30)));
    int _1512 = int(_1510) & 1;
    bool _1514 = _1512 != 0;
    uint _1516 = uint(_1514 ? int(_1508) : int(_1504));
    float _1518 = spvSubgroupShuffle(as_type<float>(_1128), 31u);
    uint _1520 = max(_1516, as_type<uint>(_1518));
    uint _1522 = uint(int(uint(int(_1148)) >> uint(31)));
    int _1524 = int(_1522) & 1;
    bool _1526 = _1524 != 0;
    int _1528 = _1526 ? int(_1520) : int(_1516);
    float _1530 = 1.0 / _1130;
    float _1532 = _1132 * _1530;
    float _1534 = precise::clamp(_1532, 0.0, 1.0);
    float _1536 = -_418;
    float _1538 = fma(_1536, _424, -0.0);
    int _1540 = _1126 + 16;
    float _1542 = -_1534;
    float _1544 = _1542 + 1.0;
    int _1546 = _1126 + 32;
    uint _1548 = uint(int(uint(_1540) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1548)] = as_type<uint>(_1106);
    int _1550 = _1540 + 4;
    uint _1552 = uint(int(uint(_1550) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1552)] = as_type<uint>(_424);
    int _1554 = _1540 + 8;
    uint _1556 = uint(int(uint(_1554) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1556)] = as_type<uint>(_1538);
    int _1558 = _1540 + 12;
    uint _1560 = uint(int(uint(_1558) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1560)] = as_type<uint>(_1544);
    uint _1562 = uint(int(uint(_1546) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1562)] = uint(_362);
    int _1564 = _1546 + 4;
    uint _1566 = uint(int(uint(_1564) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1566)] = 0u;
    int _1568 = _1546 + 8;
    uint _1570 = uint(int(uint(_1568) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1570)] = as_type<uint>(_590);
    int _1572 = _1546 + 12;
    uint _1574 = uint(int(uint(_1572) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1574)] = as_type<uint>(_582);
    if (_1094)
    {
        uint _4290 = atomic_fetch_max_explicit((device atomic_uint*)&(*spvDescriptorSet0.cp_s0)._m0[1], uint(_1528), memory_order_relaxed);
        uint _1576 = _4290;
    }
}

