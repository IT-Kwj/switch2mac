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
    constant _16* cp_c3 [[id(0)]];
    device _23* cp_s0 [[id(1)]];
    texture2d<float> cp_t_tcb_8 [[id(2)]];
    sampler cp_t_tcb_8Smplr [[id(3)]];
    sampler cp_t_tcb_8Smplr_w [[id(4)]];
    constant dm_border_t* dm_border [[id(5)]];
};

static inline __attribute__((always_inline))
int _50(thread const int& _773, thread const int& _774, thread const int& _775, thread int& _776, thread uint& gl_SubgroupInvocationID)
{
    int _779 = _775 & 31;
    uint _781 = uint(int(uint(_775) >> uint(8)));
    int _783 = int(_781) & 31;
    float _785 = as_type<float>(gl_SubgroupInvocationID);
    int _787 = as_type<int>(_785) & _783;
    int _789 = ~_783;
    int _791 = _779 & _789;
    int _793 = _791 | _787;
    int _795 = as_type<int>(_785) ^ _774;
    bool _797 = uint(_795) <= uint(_793);
    _776 = _797 ? (-1) : 0;
    float _799 = spvSubgroupShuffle(as_type<float>(_773), uint(_795));
    uint _801 = uint(_797 ? as_type<int>(_799) : _773);
    return int(_801);
}

static inline __attribute__((always_inline))
int _51(thread const int& _848, thread const int& _849, thread const int& _850, thread int& _851, thread uint& gl_SubgroupInvocationID)
{
    int _854 = _850 & 31;
    uint _856 = uint(int(uint(_850) >> uint(8)));
    int _858 = int(_856) & 31;
    float _860 = as_type<float>(gl_SubgroupInvocationID);
    int _862 = as_type<int>(_860) & _858;
    int _864 = ~_858;
    int _866 = _854 & _864;
    int _868 = _866 | _862;
    int _870 = ~_858;
    int _872 = _849 & _870;
    int _874 = _872 | _862;
    bool _876 = uint(_874) <= uint(_868);
    _851 = _876 ? (-1) : 0;
    float _878 = spvSubgroupShuffle(as_type<float>(_848), uint(_874));
    uint _880 = uint(_876 ? as_type<int>(_878) : _848);
    return int(_880);
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    uint4 gl_SubgroupLtMask = uint4(extract_bits(0xFFFFFFFF, 0, min(gl_SubgroupInvocationID, 32u)), extract_bits(0xFFFFFFFF, 0, (uint)max((int)gl_SubgroupInvocationID - 32, 0)), uint2(0));
    bool _198 = false;
    float _55 = as_type<float>(gl_WorkGroupID.x);
    float _57 = as_type<float>(gl_LocalInvocationID.x);
    int _59 = as_type<int>(_55) << 5;
    int _61 = _59 + as_type<int>(_57);
    int _63 = _61 & 1;
    uint _66 = uint(int(uint(_61) >> uint(1)));
    float _68 = float(uint(_63));
    float _70 = float(_66);
    float _72 = fma(_68, 0.5, (*spvDescriptorSet0.cp_c3)._m0[0].x);
    float _74 = fma(_70, 2.0, 1.0);
    float _76 = fma(2.0, (*spvDescriptorSet0.cp_c3)._m0[0].x, _72);
    float _78 = _74 * (*spvDescriptorSet0.cp_c3)._m0[0].y;
    float _80 = fma(2.0, (*spvDescriptorSet0.cp_c3)._m0[0].x, _76);
    float _82 = fma(2.0, (*spvDescriptorSet0.cp_c3)._m0[0].x, _80);
    float _84 = fma(2.0, (*spvDescriptorSet0.cp_c3)._m0[0].x, _82);
    float _86 = fma(2.0, (*spvDescriptorSet0.cp_c3)._m0[0].x, _84);
    float2 _439 = float2(_72, _78);
    float _88 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_439, float2(0.0), isnan(_439)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_439, float2(0.0), isnan(_439)), level(0.0)).x;
    float _90 = fma(2.0, (*spvDescriptorSet0.cp_c3)._m0[0].x, _86);
    float _92 = fma(2.0, (*spvDescriptorSet0.cp_c3)._m0[0].x, _90);
    float2 _458 = float2(_76, _78);
    float _94 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_458, float2(0.0), isnan(_458)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_458, float2(0.0), isnan(_458)), level(0.0)).x;
    float2 _466 = float2(_80, _78);
    float _96 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_466, float2(0.0), isnan(_466)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_466, float2(0.0), isnan(_466)), level(0.0)).x;
    float2 _474 = float2(_82, _78);
    float _98 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_474, float2(0.0), isnan(_474)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_474, float2(0.0), isnan(_474)), level(0.0)).x;
    float2 _482 = float2(_84, _78);
    float _100 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_482, float2(0.0), isnan(_482)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_482, float2(0.0), isnan(_482)), level(0.0)).x;
    float2 _490 = float2(_86, _78);
    float _102 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_490, float2(0.0), isnan(_490)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_490, float2(0.0), isnan(_490)), level(0.0)).x;
    float2 _498 = float2(_90, _78);
    float _104 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_498, float2(0.0), isnan(_498)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_498, float2(0.0), isnan(_498)), level(0.0)).x;
    float2 _506 = float2(_92, _78);
    float _106 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_506, float2(0.0), isnan(_506)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_506, float2(0.0), isnan(_506)), level(0.0)).x;
    float _108 = (*spvDescriptorSet0.cp_c3)._m0[0].z * 4.0;
    float _110 = _88 * (*spvDescriptorSet0.cp_c3)._m0[0].z;
    float _112 = _110 * 4.0;
    uint _114 = spvSubgroupBallot(true).x;
    bool _118 = int(_114) != (-1);
    float _120 = fma(_94, _108, _112);
    float _122 = fma(_96, _108, _120);
    float _124 = fma(_98, _108, _122);
    float _126 = fma(_100, _108, _124);
    float _128 = fma(_102, _108, _126);
    float _130 = fma(_104, _108, _128);
    float _132 = fma(_106, _108, _130);
    int _134 = as_type<int>(_132);
    int _196;
    if (!_118)
    {
        int _136 = as_type<int>(_132);
        int _138 = 1;
        int _140 = 31;
        int _142;
        int _566 = _50(_136, _138, _140, _142, gl_SubgroupInvocationID);
        int _144 = _566;
        float _146 = _132 + as_type<float>(_144);
        int _148 = as_type<int>(_146);
        int _150 = 2;
        int _152 = 31;
        int _154;
        int _573 = _50(_148, _150, _152, _154, gl_SubgroupInvocationID);
        int _156 = _573;
        float _158 = _146 + as_type<float>(_156);
        int _160 = as_type<int>(_158);
        int _162 = 4;
        int _164 = 31;
        int _166;
        int _581 = _50(_160, _162, _164, _166, gl_SubgroupInvocationID);
        int _168 = _581;
        float _170 = _158 + as_type<float>(_168);
        int _172 = as_type<int>(_170);
        int _174 = 8;
        int _176 = 31;
        int _178;
        int _589 = _50(_172, _174, _176, _178, gl_SubgroupInvocationID);
        int _180 = _589;
        float _182 = _170 + as_type<float>(_180);
        int _184 = as_type<int>(_182);
        int _186 = 16;
        int _188 = 31;
        int _190;
        int _597 = _50(_184, _186, _188, _190, gl_SubgroupInvocationID);
        int _192 = _597;
        float _194 = _182 + as_type<float>(_192);
        _196 = as_type<int>(_194);
        _198 = true;
    }
    else
    {
        float _200 = as_type<float>(gl_SubgroupLtMask.x);
        uint _202 = spvSubgroupBallot(true).x;
        int _204 = as_type<int>(_200) & int(_202);
        int _206 = int(spvFindUMSB(uint(_204)));
        int _208 = _206;
        int _210 = _206;
        int _212 = 30;
        int _214;
        int _622 = _51(_208, _210, _212, _214, gl_SubgroupInvocationID);
        int _216 = _622;
        int _218 = as_type<int>(_132);
        int _220 = _206;
        int _222 = 31;
        int _224;
        int _626 = _51(_218, _220, _222, _224, gl_SubgroupInvocationID);
        int _226 = _626;
        int _228 = (_214 != 0) ? _216 : _206;
        if (_214 != 0)
        {
            float _230 = _132 + as_type<float>(_226);
            _134 = as_type<int>(_230);
        }
        int _232 = _134;
        int _234 = _228;
        int _236 = _228;
        int _238 = 30;
        int _240;
        int _645 = _51(_234, _236, _238, _240, gl_SubgroupInvocationID);
        int _242 = _645;
        int _244 = _232;
        int _246 = _228;
        int _248 = 31;
        int _250;
        int _648 = _51(_244, _246, _248, _250, gl_SubgroupInvocationID);
        int _252 = _648;
        int _254 = (_240 != 0) ? _242 : _228;
        int _256 = int(spvFindUMSB(_202));
        int _258 = _232;
        if (_240 != 0)
        {
            float _260 = as_type<float>(_232) + as_type<float>(_252);
            _258 = as_type<int>(_260);
        }
        int _262 = _258;
        int _264 = _254;
        int _266 = _254;
        int _268 = 30;
        int _270;
        int _672 = _51(_264, _266, _268, _270, gl_SubgroupInvocationID);
        int _272 = _672;
        int _274 = _262;
        int _276 = _254;
        int _278 = 31;
        int _280;
        int _675 = _51(_274, _276, _278, _280, gl_SubgroupInvocationID);
        int _282 = _675;
        int _284 = (_270 != 0) ? _272 : _254;
        int _286 = _262;
        if (_270 != 0)
        {
            float _288 = as_type<float>(_262) + as_type<float>(_282);
            _286 = as_type<int>(_288);
        }
        int _290 = _286;
        int _292 = _284;
        int _294 = _284;
        int _296 = 30;
        int _298;
        int _696 = _51(_292, _294, _296, _298, gl_SubgroupInvocationID);
        int _300 = _696;
        int _302 = _290;
        int _304 = _284;
        int _306 = 31;
        int _308;
        int _699 = _51(_302, _304, _306, _308, gl_SubgroupInvocationID);
        int _310 = _699;
        int _312 = (_298 != 0) ? _300 : _284;
        int _314 = _290;
        if (_298 != 0)
        {
            float _316 = as_type<float>(_290) + as_type<float>(_310);
            _314 = as_type<int>(_316);
        }
        int _318 = _314;
        int _320 = _312;
        int _322 = _312;
        int _324 = 30;
        int _326;
        int _720 = _51(_320, _322, _324, _326, gl_SubgroupInvocationID);
        int _328 = _720;
        int _330 = _318;
        int _332 = _312;
        int _334 = 31;
        int _336;
        int _723 = _51(_330, _332, _334, _336, gl_SubgroupInvocationID);
        int _338 = _723;
        int _340 = _318;
        if (_326 != 0)
        {
            float _342 = as_type<float>(_318) + as_type<float>(_338);
            _340 = as_type<int>(_342);
        }
        int _344 = _340;
        int _346 = _344;
        int _348 = _256;
        int _350 = 31;
        int _352;
        int _739 = _51(_346, _348, _350, _352, gl_SubgroupInvocationID);
        int _354 = _739;
        _196 = _354;
    }
    _198 = false;
    int _356 = _196;
    float _358 = as_type<float>(gl_SubgroupInvocationID);
    uint _360 = spvSubgroupBallot(true).x;
    int _362 = reverse_bits(int(_360));
    int _364 = int(spvFindUMSB(uint(_362)));
    bool _366 = _364 != (-1);
    int _368 = _364 ^ 31;
    int _370 = _366 ? _368 : _364;
    bool _372 = as_type<int>(_358) != _370;
    if (_372)
    {
        return;
    }
    (*spvDescriptorSet0.cp_s0)._m0[0] = uint(_356);
}

