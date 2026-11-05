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

struct _29
{
    uint _m0[1];
};

struct _1070
{
    uint _m0;
    uint _m1;
};

struct spvDescriptorSetBuffer0
{
    constant _16* cp_c1 [[id(0)]];
    constant _16* cp_c0 [[id(1)]];
    constant _16* cp_c3 [[id(2)]];
    constant _16* cp_c5 [[id(3)]];
    constant _16* cp_c4 [[id(4)]];
    device _29* cp_s0 [[id(5)]];
    device _29* cp_s1 [[id(6)]];
    device _29* cp_s2 [[id(7)]];
    device _29* cp_s3 [[id(8)]];
    texture2d<float> cp_t_tcb_E [[id(9)]];
    sampler cp_t_tcb_ESmplr [[id(10)]];
    texture2d<float> cp_t_tcb_10 [[id(11)]];
    sampler cp_t_tcb_10Smplr [[id(12)]];
    texture2d<float> cp_t_tcb_C [[id(13)]];
    sampler cp_t_tcb_CSmplr [[id(14)]];
    texture2d<float> cp_t_tcb_A [[id(15)]];
    sampler cp_t_tcb_ASmplr [[id(16)]];
    texture2d<float> cp_t_tcb_8 [[id(17)]];
    sampler cp_t_tcb_8Smplr [[id(18)]];
    sampler cp_t_tcb_ESmplr_w [[id(19)]];
    sampler cp_t_tcb_CSmplr_w [[id(20)]];
    sampler cp_t_tcb_ASmplr_w [[id(21)]];
    sampler cp_t_tcb_8Smplr_w [[id(22)]];
    constant dm_border_t* dm_border [[id(23)]];
};

static inline __attribute__((always_inline))
int _70(thread const int& _1800, thread const int& _1801, thread const int& _1802, thread int& _1803, thread uint& gl_SubgroupInvocationID)
{
    int _1806 = _1802 & 31;
    uint _1808 = uint(int(uint(_1802) >> uint(8)));
    int _1810 = int(_1808) & 31;
    float _1812 = as_type<float>(gl_SubgroupInvocationID);
    int _1814 = as_type<int>(_1812) & _1810;
    int _1816 = ~_1810;
    int _1818 = _1806 & _1816;
    int _1820 = _1818 | _1814;
    int _1822 = ~_1810;
    int _1824 = _1801 & _1822;
    int _1826 = _1824 | _1814;
    bool _1828 = uint(_1826) <= uint(_1820);
    _1803 = _1828 ? (-1) : 0;
    float _1830 = spvSubgroupShuffle(as_type<float>(_1800), uint(_1826));
    uint _1832 = uint(_1828 ? as_type<int>(_1830) : _1800);
    return int(_1832);
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    uint4 gl_SubgroupLtMask = uint4(extract_bits(0xFFFFFFFF, 0, min(gl_SubgroupInvocationID, 32u)), extract_bits(0xFFFFFFFF, 0, (uint)max((int)gl_SubgroupInvocationID - 32, 0)), uint2(0));
    float _74 = as_type<float>(gl_WorkGroupID.y);
    float _76 = as_type<float>(gl_LocalInvocationID.y);
    float _78 = as_type<float>(gl_LocalInvocationID.x);
    float _80 = as_type<float>(gl_WorkGroupID.x);
    float _82 = as_type<float>(gl_WorkGroupID.z);
    int _84 = as_type<int>(_74) << 3;
    int _86 = ~as_type<int>(_76);
    int _88 = _86 + 1;
    bool _92 = _88 != _84;
    int _94 = as_type<int>(_80) << 3;
    int _96 = ~as_type<int>(_78);
    int _98 = _96 + 1;
    bool _100 = _98 == _94;
    bool _102 = !_92;
    bool _104 = _100 && _102;
    bool _106 = as_type<int>(_82) == 0;
    bool _108 = _106 && _104;
    int _110 = as_type<int>(_82) * 24;
    int _112 = _110 + 8;
    threadgroup_barrier(mem_flags::mem_threadgroup);
    uint _115 = uint(int(uint(_112) >> uint(2)));
    float _117 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_115)]);
    int _119 = _112 + 4;
    uint _121 = uint(int(uint(_119) >> uint(2)));
    float _123 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_121)]);
    uint _125 = uint(int(uint(_110) >> uint(2)));
    float _127 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_125)]);
    int _129 = _110 + 4;
    uint _131 = uint(int(uint(_129) >> uint(2)));
    float _133 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_131)]);
    int _135 = as_type<int>(_78) + _94;
    int _137 = as_type<int>((*spvDescriptorSet0.cp_c0)._m0[0].y) << 3;
    int _139 = as_type<int>(_76) + _84;
    float _141 = float(uint(_135));
    float _143 = float(uint(_139));
    float _145 = float(uint(_137));
    float _147 = _141 + 0.5;
    float _149 = _143 + 0.5;
    float _151 = 1.0 / _145;
    float _153 = _117 * _151;
    float _155 = _123 * _151;
    float _157 = fma(_147, _153, _127);
    float _159 = fma(_149, _155, _133);
    int _161 = as_type<int>(_157) * 1664525;
    int _163 = _161 + 1013904223;
    int _165 = as_type<int>(_159) * 1664525;
    int _167 = _165 + 1013904223;
    int _169 = _167 * 1343943519;
    int _171 = _169 + _163;
    int _173 = _167 * _171;
    int _175 = _173 + 1343943519;
    uint _177 = uint(int(uint(_171) >> uint(16)));
    int _179 = _171 * _175;
    int _181 = _179 + _167;
    uint _183 = uint(int(uint(_175) >> uint(16)));
    int _185 = _171 ^ int(_177);
    uint _187 = uint(int(uint(_181) >> uint(16)));
    int _189 = _175 ^ int(_183);
    int _191 = _181 ^ int(_187);
    int _193 = _189 * _191;
    int _195 = _193 + _185;
    int _197 = _191 * _195;
    int _199 = _197 + _189;
    uint _201 = uint(int(uint(_195) >> uint(9)));
    int _203 = int(_201) + 1065353216;
    uint _205 = uint(int(uint(_199) >> uint(9)));
    int _207 = int(_205) + 1065353216;
    float _209 = as_type<float>(_203) + (-1.5);
    float _211 = as_type<float>(_207) + (-1.5);
    float _213 = fma(_153, _209, _157);
    float _215 = fma(_155, _211, _159);
    float _217 = fma(_213, 6.2500002968590706586837768554688e-05, 0.5);
    float _219 = fma(_215, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _945 = float2(_217, _219);
    float _221 = dm_bs(spvDescriptorSet0.cp_t_tcb_E.sample(spvDescriptorSet0.cp_t_tcb_ESmplr, select(_945, float2(0.0), isnan(_945)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_E, spvDescriptorSet0.cp_t_tcb_ESmplr_w, select(_945, float2(0.0), isnan(_945)), level(0.0)).x;
    float _223 = fma(_213, 6.2500002968590706586837768554688e-05, 0.500062525272369384765625);
    float _225 = fma(_215, 6.2500002968590706586837768554688e-05, 0.500062525272369384765625);
    float2 _961 = float2(_217, _219);
    float4 _228 = spvDescriptorSet0.cp_t_tcb_10.gather(spvDescriptorSet0.cp_t_tcb_10Smplr, select(_961, float2(0.0), isnan(_961)), int2(0), component::x).xyzw;
    float _230 = _228.x;
    float _232 = _228.y;
    float _234 = _228.z;
    float _236 = _228.w;
    float2 _977 = float2(_217, _219);
    float _238 = dm_bs(spvDescriptorSet0.cp_t_tcb_C.sample(spvDescriptorSet0.cp_t_tcb_CSmplr, select(_977, float2(0.0), isnan(_977)), level(_221)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_C, spvDescriptorSet0.cp_t_tcb_CSmplr_w, select(_977, float2(0.0), isnan(_977)), level(_221)).x;
    float2 _986 = float2(_217, _219);
    float _240 = dm_bs(spvDescriptorSet0.cp_t_tcb_A.sample(spvDescriptorSet0.cp_t_tcb_ASmplr, select(_986, float2(0.0), isnan(_986)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_A, spvDescriptorSet0.cp_t_tcb_ASmplr_w, select(_986, float2(0.0), isnan(_986)), level(0.0)).x;
    float2 _994 = float2(_223, _219);
    float _242 = dm_bs(spvDescriptorSet0.cp_t_tcb_A.sample(spvDescriptorSet0.cp_t_tcb_ASmplr, select(_994, float2(0.0), isnan(_994)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_A, spvDescriptorSet0.cp_t_tcb_ASmplr_w, select(_994, float2(0.0), isnan(_994)), level(0.0)).x;
    float2 _1002 = float2(_217, _225);
    float _244 = dm_bs(spvDescriptorSet0.cp_t_tcb_A.sample(spvDescriptorSet0.cp_t_tcb_ASmplr, select(_1002, float2(0.0), isnan(_1002)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_A, spvDescriptorSet0.cp_t_tcb_ASmplr_w, select(_1002, float2(0.0), isnan(_1002)), level(0.0)).x;
    int _246 = _195 * _199;
    int _248 = _246 + _191;
    int _250 = _195 * 1664525;
    int _252 = _250 + 1013904223;
    int _254 = _199 * 1664525;
    int _256 = _254 + 1013904223;
    int _258 = _248 * 1664525;
    int _260 = _258 + 1013904223;
    int _262 = _256 * _260;
    int _264 = _262 + _252;
    int _266 = _260 * _264;
    int _268 = _266 + _256;
    uint _270 = uint(int(uint(_264) >> uint(16)));
    int _272 = _264 * _268;
    int _274 = _272 + _260;
    uint _276 = uint(int(uint(_268) >> uint(16)));
    int _278 = _264 ^ int(_270);
    uint _280 = uint(int(uint(_274) >> uint(16)));
    int _282 = _268 ^ int(_276);
    int _284 = _274 ^ int(_280);
    int _286 = _282 * _284;
    int _288 = _286 + _278;
    uint _290 = (spvMulExtended<_1070, uint>(uint(_288), 3221225473u))._m1;
    uint _292 = uint(int(uint(int(_290)) >> uint(30)));
    int _294 = int(_292) << 2;
    bool _296 = _294 == 4;
    bool _298 = _294 == 8;
    bool _300 = _294 == 12;
    uint _302 = uint(int(uint(_248) >> uint(9)));
    int _304 = int(_302) + 1065353216;
    int _306 = as_type<int>(_230);
    if (_296)
    {
        _306 = as_type<int>(_232);
    }
    int _308 = _306;
    float _310 = as_type<float>(_304) + (-1.0);
    int _312 = _308;
    if (_298)
    {
        _312 = as_type<int>(_234);
    }
    int _314 = _312;
    int _316 = _314;
    if (_300)
    {
        _316 = as_type<int>(_236);
    }
    int _318 = _316;
    bool _320 = _318 != 0;
    bool _322 = _310 > _238;
    if (!_320)
    {
        return;
    }
    if (_322)
    {
        return;
    }
    float2 _1138 = float2(_217, _219);
    float _324 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_1138, float2(0.0), isnan(_1138)), level(_240)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_1138, float2(0.0), isnan(_1138)), level(_240)).x;
    float2 _1147 = float2(_223, _219);
    float _326 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_1147, float2(0.0), isnan(_1147)), level(_242)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_1147, float2(0.0), isnan(_1147)), level(_242)).x;
    float2 _1156 = float2(_217, _225);
    float _328 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_1156, float2(0.0), isnan(_1156)), level(_244)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_1156, float2(0.0), isnan(_1156)), level(_244)).x;
    int _330 = _284 * _288;
    int _332 = _330 + _282;
    int _334 = _110 + 16;
    float _336 = -_324;
    float _338 = _336 + _326;
    float _340 = -_324;
    float _342 = _340 + _328;
    float _344 = _338 * 1024.0;
    float _346 = _342 * 1024.0;
    float _348 = fma(_344, _344, 0.06871949136257171630859375);
    float _350 = fma(_346, _346, _348);
    float _352 = rsqrt(_350);
    float _354 = _352 * 0.262144029140472412109375;
    bool _356 = _354 >= 0.5;
    bool _358 = isnan(_354);
    bool _360 = _356 || _358;
    bool _362 = isnan(0.5);
    bool _364 = _360 || _362;
    if (!_364)
    {
        return;
    }
    uint _366 = uint(int(uint(_334) >> uint(2)));
    float _368 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_366)]);
    float _370 = _324 * 2000.0;
    float _372 = float(uint(_332));
    float _374 = _370 * (*spvDescriptorSet0.cp_c3)._m0[1].y;
    float _376 = _370 * (*spvDescriptorSet0.cp_c3)._m0[0].y;
    float _378 = _370 * (*spvDescriptorSet0.cp_c3)._m0[2].y;
    float _380 = _370 * (*spvDescriptorSet0.cp_c3)._m0[3].y;
    float _382 = fma(_213, (*spvDescriptorSet0.cp_c3)._m0[1].x, _374);
    float _384 = fma(_213, (*spvDescriptorSet0.cp_c3)._m0[0].x, _376);
    float _386 = fma(_213, (*spvDescriptorSet0.cp_c3)._m0[2].x, _378);
    float _388 = fma(_213, (*spvDescriptorSet0.cp_c3)._m0[3].x, _380);
    float _390 = fma(_215, (*spvDescriptorSet0.cp_c3)._m0[1].z, _382);
    float _392 = fma(_215, (*spvDescriptorSet0.cp_c3)._m0[0].z, _384);
    float _394 = fma(_215, (*spvDescriptorSet0.cp_c3)._m0[2].z, _386);
    float _396 = fma(_215, (*spvDescriptorSet0.cp_c3)._m0[3].z, _388);
    float _398 = _390 + (*spvDescriptorSet0.cp_c3)._m0[1].w;
    float _400 = _392 + (*spvDescriptorSet0.cp_c3)._m0[0].w;
    float _402 = _394 + (*spvDescriptorSet0.cp_c3)._m0[2].w;
    float _404 = _396 + (*spvDescriptorSet0.cp_c3)._m0[3].w;
    bool _406 = _398 >= 1.0;
    bool _408 = isnan(_398);
    bool _410 = _406 || _408;
    bool _412 = isnan(1.0);
    bool _414 = _410 || _412;
    bool _416 = _400 < 1.0;
    bool _418 = !_414;
    bool _420 = _416 && _418;
    bool _422 = _402 < 1.0;
    bool _424 = _422 && _420;
    float _426 = fma(_372, -4.656612942466331617197283776477e-11, 1.0);
    bool _428 = _404 < 1.0;
    bool _430 = _428 && _424;
    float _432 = _368 * _426;
    if (!_430)
    {
        return;
    }
    float _434 = -_370;
    float _436 = _434 + (*spvDescriptorSet0.cp_c3)._m0[4].y;
    float _438 = -_213;
    float _440 = _438 + (*spvDescriptorSet0.cp_c3)._m0[4].x;
    float _442 = _432 * 0.10000002384185791015625;
    float _444 = _436 * _436;
    float _446 = -_215;
    float _448 = _446 + (*spvDescriptorSet0.cp_c3)._m0[4].z;
    float _450 = fma(_440, _440, _444);
    float _452 = 1.0 / _442;
    float _454 = -(*spvDescriptorSet0.cp_c5)._m0[0].x;
    float _456 = (*spvDescriptorSet0.cp_c5)._m0[0].y + _454;
    float _458 = fma(_448, _448, _450);
    float _460 = sqrt(_458);
    float _462 = 1.0 / _456;
    float _464 = fma(_432, -0.89999997615814208984375, _460);
    float _466 = -(*spvDescriptorSet0.cp_c5)._m0[0].x;
    float _468 = _460 + _466;
    float _470 = _464 * _452;
    float _472 = precise::clamp(_470, 0.0, 1.0);
    float _474 = _468 * _462;
    float _476 = precise::clamp(_474, 0.0, 1.0);
    float _478 = -_472;
    float _480 = _478 + 1.0;
    float _482 = _480 * _476;
    bool _484 = _482 >= 0.00999999977648258209228515625;
    bool _486 = isnan(_482);
    bool _488 = _484 || _486;
    bool _490 = isnan(0.00999999977648258209228515625);
    bool _492 = _488 || _490;
    if (!_492)
    {
        return;
    }
    float _494 = as_type<float>(gl_SubgroupInvocationID);
    uint _496 = spvSubgroupBallot(true).x;
    int _498 = reverse_bits(int(_496));
    int _500 = int(spvFindUMSB(uint(_498)));
    bool _502 = _500 != (-1);
    int _504 = _500 ^ 31;
    int _506 = _502 ? _504 : _500;
    bool _508 = as_type<int>(_494) != _506;
    int _510 = as_type<int>(_494);
    if (_508)
    {
        _510 = 0;
    }
    int _512 = _510;
    int _514 = _512;
    if (!_508)
    {
        int _516 = popcount(int(_496));
        uint _518 = uint(int(uint(as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x)) >> uint(2)));
        uint _1477 = atomic_fetch_add_explicit((device atomic_uint*)&(*spvDescriptorSet0.cp_s0)._m0[int(_518)], uint(_516), memory_order_relaxed);
        uint _520 = _1477;
        uint _522 = uint(int(uint(as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x)) >> uint(2)));
        uint _1489 = atomic_fetch_min_explicit((device atomic_uint*)&(*spvDescriptorSet0.cp_s0)._m0[int(_522)], as_type<uint>((*spvDescriptorSet0.cp_c4)._m0[0].y), memory_order_relaxed);
        uint _524 = _1489;
        _514 = int(_520);
    }
    int _526 = _514;
    uint _528 = spvSubgroupBallot(true).x;
    float _530 = as_type<float>(gl_SubgroupLtMask.x);
    int _532 = reverse_bits(int(_528));
    int _534 = int(spvFindUMSB(uint(_532)));
    bool _536 = _534 != (-1);
    int _538 = _534 ^ 31;
    int _540 = _536 ? _538 : _534;
    int _542 = as_type<int>(_530) & int(_496);
    int _544 = _526;
    int _546 = _540;
    int _548 = 31;
    int _550;
    int _1521 = _70(_544, _546, _548, _550, gl_SubgroupInvocationID);
    int _552 = _1521;
    int _554 = popcount(_542);
    int _556 = _552 + _554;
    bool _558 = uint(_556) >= as_type<uint>((*spvDescriptorSet0.cp_c4)._m0[0].y);
    if (_558)
    {
        return;
    }
    uint _560 = min(uint(_318), as_type<uint>((*spvDescriptorSet0.cp_c4)._m0[0].x));
    int _562 = int(_560) * 48;
    int _564 = _562 + (-48);
    int _566 = _564 + 16;
    uint _568 = uint(int(uint(_566) >> uint(2)));
    float _570 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_568)]);
    int _572 = _566 + 4;
    uint _574 = uint(int(uint(_572) >> uint(2)));
    float _576 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_574)]);
    int _578 = _566 + 8;
    uint _580 = uint(int(uint(_578) >> uint(2)));
    float _582 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_580)]);
    int _584 = _566 + 12;
    uint _586 = uint(int(uint(_584) >> uint(2)));
    float _588 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_586)]);
    float _590 = -(*spvDescriptorSet0.cp_c5)._m0[0].y;
    float _592 = _590 + (*spvDescriptorSet0.cp_c5)._m0[1].x;
    float _594 = -(*spvDescriptorSet0.cp_c5)._m0[0].y;
    float _596 = _460 + _594;
    float _598 = _344 * _352;
    int _600 = _556 << 6;
    float _602 = _346 * _352;
    float _604 = 1.0 / _592;
    int _606 = int(_560) + (-1);
    float _608 = (*spvDescriptorSet0.cp_c5)._m0[1].y + (-1.0);
    float _610 = -_598;
    float _612 = _610 + (-0.0);
    float _614 = -_602;
    float _616 = _614 + (-0.0);
    uint _618 = uint(int(uint(_600) >> uint(2)));
    (*spvDescriptorSet0.cp_s3)._m0[int(_618)] = as_type<uint>(_213);
    int _620 = _600 + 4;
    uint _622 = uint(int(uint(_620) >> uint(2)));
    (*spvDescriptorSet0.cp_s3)._m0[int(_622)] = as_type<uint>(_370);
    int _624 = _600 + 8;
    uint _626 = uint(int(uint(_624) >> uint(2)));
    (*spvDescriptorSet0.cp_s3)._m0[int(_626)] = as_type<uint>(_215);
    int _628 = _600 + 12;
    uint _630 = uint(int(uint(_628) >> uint(2)));
    (*spvDescriptorSet0.cp_s3)._m0[int(_630)] = as_type<uint>(_310);
    int _632 = _600 + 40;
    float _634 = float(uint(_606));
    float _636 = _596 * _604;
    float _638 = precise::clamp(_636, 0.0, 1.0);
    float _640 = fma(_638, _608, 1.0);
    int _642 = _600 + 48;
    int _644 = _600 + 52;
    float _646 = -_576;
    float _648 = _646 + _588;
    float _650 = _570 + _582;
    float _652 = _576 + _588;
    float _654 = -_570;
    float _656 = _654 + _582;
    int _658 = _600 + 16;
    float _660 = _650 * 0.5;
    int _662 = _600 + 32;
    float _664 = _652 * 0.5;
    uint _666 = uint(int(uint(_658) >> uint(2)));
    (*spvDescriptorSet0.cp_s3)._m0[int(_666)] = as_type<uint>(_612);
    int _668 = _658 + 4;
    uint _670 = uint(int(uint(_668) >> uint(2)));
    (*spvDescriptorSet0.cp_s3)._m0[int(_670)] = as_type<uint>(_354);
    int _672 = _658 + 8;
    uint _674 = uint(int(uint(_672) >> uint(2)));
    (*spvDescriptorSet0.cp_s3)._m0[int(_674)] = as_type<uint>(_616);
    int _676 = _658 + 12;
    uint _678 = uint(int(uint(_676) >> uint(2)));
    (*spvDescriptorSet0.cp_s3)._m0[int(_678)] = as_type<uint>(_482);
    uint _680 = uint(int(uint(_662) >> uint(2)));
    (*spvDescriptorSet0.cp_s3)._m0[int(_680)] = as_type<uint>(_660);
    int _682 = _662 + 4;
    uint _684 = uint(int(uint(_682) >> uint(2)));
    (*spvDescriptorSet0.cp_s3)._m0[int(_684)] = as_type<uint>(_664);
    uint _686 = uint(int(uint(_632) >> uint(2)));
    (*spvDescriptorSet0.cp_s3)._m0[int(_686)] = as_type<uint>(_656);
    int _688 = _632 + 4;
    uint _690 = uint(int(uint(_688) >> uint(2)));
    (*spvDescriptorSet0.cp_s3)._m0[int(_690)] = as_type<uint>(_648);
    uint _692 = uint(int(uint(_642) >> uint(2)));
    (*spvDescriptorSet0.cp_s3)._m0[int(_692)] = as_type<uint>(_634);
    uint _694 = uint(int(uint(_644) >> uint(2)));
    (*spvDescriptorSet0.cp_s3)._m0[int(_694)] = as_type<uint>(_640);
}

