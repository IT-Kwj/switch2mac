#pragma clang diagnostic ignored "-Wmissing-prototypes"
#pragma clang diagnostic ignored "-Wmissing-braces"

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

struct _23
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _16* cp_c0 [[id(0)]];
    constant _16* cp_c3 [[id(1)]];
    device _23* cp_s0 [[id(2)]];
    texture2d<float> cp_t_tcb_8 [[id(3)]];
    sampler cp_t_tcb_8Smplr [[id(4)]];
    sampler cp_t_tcb_8Smplr_w [[id(5)]];
    constant dm_border_t* dm_border [[id(6)]];
};

static inline __attribute__((always_inline))
int _51(thread const int& _964, thread const int& _965, thread const int& _966, thread int& _967, thread uint& gl_SubgroupInvocationID)
{
    int _970 = _966 & 31;
    uint _972 = uint(int(uint(_966) >> uint(8)));
    int _974 = int(_972) & 31;
    float _976 = as_type<float>(gl_SubgroupInvocationID);
    int _978 = as_type<int>(_976) & _974;
    int _980 = ~_974;
    int _982 = _970 & _980;
    int _984 = _982 | _978;
    int _986 = as_type<int>(_976) ^ _965;
    bool _988 = uint(_986) <= uint(_984);
    _967 = _988 ? (-1) : 0;
    float _990 = spvSubgroupShuffle(as_type<float>(_964), uint(_986));
    uint _992 = uint(_988 ? as_type<int>(_990) : _964);
    return int(_992);
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    threadgroup spvUnsafeArray<uint, 32> _31;
    float _55 = as_type<float>(gl_WorkGroupID.y);
    float _57 = as_type<float>(gl_WorkGroupID.x);
    float _59 = as_type<float>(gl_LocalInvocationID.x);
    float _61 = as_type<float>(gl_LocalInvocationID.y);
    int _63 = as_type<int>(_57) * 16;
    int _65 = _63 + as_type<int>(_59);
    int _67 = as_type<int>(_55) * 16;
    int _69 = _67 + as_type<int>(_61);
    float _71 = float(uint(_65));
    float _73 = float(uint(_69));
    float _75 = _71 * (*spvDescriptorSet0.cp_c3)._m0[42].z;
    float _77 = _73 * (*spvDescriptorSet0.cp_c3)._m0[42].w;
    float _79 = fma(_73, 0.0625, 0.03125);
    float _81 = _75 * 0.0625;
    float _83 = _77 * 0.0625;
    float _85 = _79 * (*spvDescriptorSet0.cp_c3)._m0[42].w;
    float _87 = fma((*spvDescriptorSet0.cp_c3)._m0[42].z, 0.03125, _81);
    float2 _513 = float2(_81, _83);
    float _89 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_513, float2(0.0), isnan(_513)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_513, float2(0.0), isnan(_513)), level(0.0)).x;
    float2 _524 = float2(_87, _83);
    float _91 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_524, float2(0.0), isnan(_524)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_524, float2(0.0), isnan(_524)), level(0.0)).x;
    float2 _532 = float2(_81, _85);
    float _93 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_532, float2(0.0), isnan(_532)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_532, float2(0.0), isnan(_532)), level(0.0)).x;
    float2 _540 = float2(_87, _85);
    float _95 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_540, float2(0.0), isnan(_540)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_540, float2(0.0), isnan(_540)), level(0.0)).x;
    float _97 = precise::min(_89, 1.0);
    float _99 = precise::max(0.0, _89);
    float _101 = precise::min(_97, _91);
    float _103 = precise::max(_99, _91);
    float _105 = _89 + _91;
    float _107 = precise::min(_93, _101);
    float _109 = precise::max(_93, _103);
    float _111 = _93 + _105;
    float _113 = precise::min(_95, _107);
    float _115 = precise::max(_95, _109);
    float _117 = _95 + _111;
    int _119 = as_type<int>(_113);
    int _121 = 16;
    int _123 = 31;
    int _125;
    int _580 = _51(_119, _121, _123, _125, gl_SubgroupInvocationID);
    int _127 = _580;
    int _129 = as_type<int>(_115);
    int _131 = 16;
    int _133 = 31;
    int _135;
    int _583 = _51(_129, _131, _133, _135, gl_SubgroupInvocationID);
    int _137 = _583;
    int _139 = as_type<int>(_117);
    int _141 = 16;
    int _143 = 31;
    int _145;
    int _586 = _51(_139, _141, _143, _145, gl_SubgroupInvocationID);
    int _147 = _586;
    float _149 = precise::min(as_type<float>(_127), _113);
    float _151 = precise::max(as_type<float>(_137), _115);
    int _153 = as_type<int>(_149);
    int _155 = 8;
    int _157 = 31;
    int _159;
    int _598 = _51(_153, _155, _157, _159, gl_SubgroupInvocationID);
    int _161 = _598;
    float _163 = as_type<float>(_147) + _117;
    int _165 = as_type<int>(_151);
    int _167 = 8;
    int _169 = 31;
    int _171;
    int _605 = _51(_165, _167, _169, _171, gl_SubgroupInvocationID);
    int _173 = _605;
    int _175 = as_type<int>(_163);
    int _177 = 8;
    int _179 = 31;
    int _181;
    int _608 = _51(_175, _177, _179, _181, gl_SubgroupInvocationID);
    int _183 = _608;
    float _185 = precise::min(_149, as_type<float>(_161));
    float _187 = precise::max(_151, as_type<float>(_173));
    int _189 = as_type<int>(_185);
    int _191 = 4;
    int _193 = 31;
    int _195;
    int _620 = _51(_189, _191, _193, _195, gl_SubgroupInvocationID);
    int _197 = _620;
    float _199 = _163 + as_type<float>(_183);
    int _201 = as_type<int>(_187);
    int _203 = 4;
    int _205 = 31;
    int _207;
    int _627 = _51(_201, _203, _205, _207, gl_SubgroupInvocationID);
    int _209 = _627;
    int _211 = as_type<int>(_199);
    int _213 = 4;
    int _215 = 31;
    int _217;
    int _630 = _51(_211, _213, _215, _217, gl_SubgroupInvocationID);
    int _219 = _630;
    float _221 = precise::min(_185, as_type<float>(_197));
    float _223 = precise::max(_187, as_type<float>(_209));
    int _225 = as_type<int>(_221);
    int _227 = 2;
    int _229 = 31;
    int _231;
    int _641 = _51(_225, _227, _229, _231, gl_SubgroupInvocationID);
    int _233 = _641;
    float _235 = _199 + as_type<float>(_219);
    int _237 = as_type<int>(_223);
    int _239 = 2;
    int _241 = 31;
    int _243;
    int _648 = _51(_237, _239, _241, _243, gl_SubgroupInvocationID);
    int _245 = _648;
    int _247 = as_type<int>(_61) * 16;
    int _249 = _247 + as_type<int>(_59);
    int _251 = as_type<int>(_61) * 16;
    int _253 = as_type<int>(_235);
    int _255 = 2;
    int _257 = 31;
    int _259;
    int _661 = _51(_253, _255, _257, _259, gl_SubgroupInvocationID);
    int _261 = _661;
    int _263 = -as_type<int>(_59);
    int _265 = _249 & 31;
    bool _269 = _265 != 0;
    bool _271 = _251 != _263;
    int _273 = _249;
    if (!_269)
    {
        uint _276 = uint(int(uint(_249) >> uint(5)));
        _273 = int(_276);
    }
    int _278 = _273;
    float _280 = precise::min(_221, as_type<float>(_233));
    float _282 = precise::max(_223, as_type<float>(_245));
    int _284 = as_type<int>(_280);
    int _286 = 1;
    int _288 = 31;
    int _290;
    int _694 = _51(_284, _286, _288, _290, gl_SubgroupInvocationID);
    int _292 = _694;
    float _294 = _235 + as_type<float>(_261);
    int _296 = as_type<int>(_282);
    int _298 = 1;
    int _300 = 31;
    int _302;
    int _701 = _51(_296, _298, _300, _302, gl_SubgroupInvocationID);
    int _304 = _701;
    int _306 = as_type<int>(_294);
    int _308 = 1;
    int _310 = 31;
    int _312;
    int _704 = _51(_306, _308, _310, _312, gl_SubgroupInvocationID);
    int _314 = _704;
    float _316 = precise::min(_280, as_type<float>(_292));
    float _318 = precise::max(_282, as_type<float>(_304));
    float _320 = _294 + as_type<float>(_314);
    if (!_269)
    {
        int _322 = _278 << 4;
        uint _324 = uint(int(uint(_322) >> uint(2)));
        _31[int(_324)] = as_type<uint>(_316);
        int _326 = _322 + 4;
        uint _328 = uint(int(uint(_326) >> uint(2)));
        _31[int(_328)] = as_type<uint>(_318);
    }
    if (!_269)
    {
        int _330 = _278 << 4;
        int _332 = _330 + 8;
        uint _334 = uint(int(uint(_332) >> uint(2)));
        _31[int(_334)] = as_type<uint>(_320);
    }
    threadgroup_barrier(mem_flags::mem_threadgroup);
    if (_271)
    {
        return;
    }
    float _336 = as_type<float>(_31[4]);
    float _338 = as_type<float>(_31[5]);
    float _340 = as_type<float>(_31[6]);
    int _342 = as_type<int>(_55) * as_type<int>((*spvDescriptorSet0.cp_c0)._m0[0].y);
    int _344 = _342 + as_type<int>(_57);
    float _346 = as_type<float>(_31[0]);
    float _348 = as_type<float>(_31[1]);
    float _350 = as_type<float>(_31[2]);
    int _352 = _344 * 16;
    float _354 = as_type<float>(_31[8]);
    float _356 = as_type<float>(_31[9]);
    float _358 = as_type<float>(_31[10]);
    float _360 = as_type<float>(_31[12]);
    float _362 = as_type<float>(_31[13]);
    float _364 = as_type<float>(_31[14]);
    float _366 = as_type<float>(_31[16]);
    float _368 = as_type<float>(_31[17]);
    float _370 = as_type<float>(_31[18]);
    float _372 = as_type<float>(_31[20]);
    float _374 = as_type<float>(_31[21]);
    float _376 = as_type<float>(_31[22]);
    float _378 = as_type<float>(_31[24]);
    float _380 = as_type<float>(_31[25]);
    float _382 = as_type<float>(_31[26]);
    float _384 = as_type<float>(_31[28]);
    float _386 = as_type<float>(_31[29]);
    float _388 = as_type<float>(_31[30]);
    float _390 = precise::min(_346, _336);
    float _392 = precise::max(_348, _338);
    float _394 = _350 + _340;
    float _396 = precise::min(_390, _354);
    float _398 = precise::max(_392, _356);
    float _400 = _394 + _358;
    float _402 = precise::min(_396, _360);
    float _404 = precise::max(_398, _362);
    float _406 = _400 + _364;
    float _408 = precise::min(_402, _366);
    float _410 = precise::max(_404, _368);
    float _412 = _406 + _370;
    float _414 = precise::min(_408, _372);
    float _416 = precise::max(_410, _374);
    float _418 = _412 + _376;
    float _420 = precise::min(_414, _378);
    float _422 = precise::max(_416, _380);
    float _424 = _418 + _382;
    float _426 = precise::min(_384, _420);
    float _428 = precise::max(_386, _422);
    float _430 = _388 + _424;
    int _432 = _352 + 22016;
    int _434 = _352 + 22020;
    float _436 = _430 * 0.0009765625;
    int _438 = _352 + 22024;
    uint _440 = uint(int(uint(_432) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_440)] = as_type<uint>(_426);
    uint _442 = uint(int(uint(_434) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_442)] = as_type<uint>(_428);
    uint _444 = uint(int(uint(_438) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_444)] = as_type<uint>(_436);
}

