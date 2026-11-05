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

struct _25
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _16* cp_c4 [[id(0)]];
    constant _16* cp_c3 [[id(1)]];
    constant _16* cp_c0 [[id(2)]];
    device _25* cp_s0 [[id(3)]];
    texture2d<float> cp_t_tcb_8 [[id(4)]];
    sampler cp_t_tcb_8Smplr [[id(5)]];
    texture2d<float> cp_t_tcb_A [[id(6)]];
    sampler cp_t_tcb_ASmplr [[id(7)]];
    texture2d<float> cp_t_tcb_E [[id(8)]];
    sampler cp_t_tcb_ESmplr [[id(9)]];
    texture2d<float> cp_t_tcb_C [[id(10)]];
    sampler cp_t_tcb_CSmplr [[id(11)]];
    texture2d<float, access::write> cp_i_tcb_4A_ [[id(12)]];
    texture2d<float, access::write> cp_i_tcb_48_ [[id(13)]];
    texture2d<float, access::write> cp_i_tcb_4C_ [[id(14)]];
    sampler cp_t_tcb_8Smplr_w [[id(15)]];
    sampler cp_t_tcb_ASmplr_w [[id(16)]];
    sampler cp_t_tcb_ESmplr_w [[id(17)]];
    sampler cp_t_tcb_CSmplr_w [[id(18)]];
    constant dm_border_t* dm_border [[id(19)]];
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    float _63 = as_type<float>(gl_WorkGroupID.x);
    float _65 = as_type<float>(gl_LocalInvocationID.x);
    float _67 = as_type<float>(gl_WorkGroupID.y);
    float _69 = as_type<float>(gl_LocalInvocationID.y);
    int _72 = as_type<int>(_63) << 3;
    int _74 = _72 + as_type<int>(_65);
    float _76 = float(uint(_74));
    int _78 = as_type<int>(_67) << 3;
    int _80 = _78 + as_type<int>(_69);
    float _82 = _76 + 0.5;
    float _84 = float(uint(_80));
    float _86 = _82 + (*spvDescriptorSet0.cp_c3)._m0[2].x;
    float _88 = _84 + 0.5;
    float _90 = _86 * 0.00390625;
    float _92 = _88 + (*spvDescriptorSet0.cp_c3)._m0[2].y;
    float _94 = _92 * 0.00390625;
    float2 _1177 = float2(_90, _94);
    float2 _98 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_1177, float2(0.0), isnan(_1177)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_1177, float2(0.0), isnan(_1177)), level(0.0)).xy;
    float _100 = _98.x;
    float _102 = _98.y;
    float _104 = (*spvDescriptorSet0.cp_c3)._m0[0].w * 0.5;
    float _106 = -_104;
    float _108 = fma(_100, _106, _86);
    float _110 = -_104;
    float _112 = fma(_102, _110, _92);
    float _114 = _108 * 0.00390625;
    float _116 = _112 * 0.00390625;
    float2 _1212 = float2(_114, _116);
    float2 _118 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_1212, float2(0.0), isnan(_1212)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_1212, float2(0.0), isnan(_1212)), level(0.0)).xy;
    float _120 = _118.x;
    float _122 = _118.y;
    float _124 = (*spvDescriptorSet0.cp_c3)._m0[0].w * 0.75;
    float _126 = -_124;
    float _128 = fma(_120, _126, _86);
    float _130 = -_124;
    float _132 = fma(_122, _130, _92);
    float _134 = _128 * 0.00390625;
    float _136 = _132 * 0.00390625;
    float2 _1244 = float2(_134, _136);
    float2 _138 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_1244, float2(0.0), isnan(_1244)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_1244, float2(0.0), isnan(_1244)), level(0.0)).xy;
    float _140 = _138.x;
    float _142 = _138.y;
    float _144 = _120 * 0.3333333432674407958984375;
    float _146 = _122 * 0.3333333432674407958984375;
    float _148 = fma(_100, 0.22222222387790679931640625, _144);
    float _150 = fma(_102, 0.22222222387790679931640625, _146);
    float _152 = fma(_140, 0.4444444477558135986328125, _148);
    float _154 = fma(_142, 0.4444444477558135986328125, _150);
    float _156 = -_152;
    float _158 = fma(_156, (*spvDescriptorSet0.cp_c3)._m0[0].w, _86);
    float _160 = -_154;
    float _162 = fma(_160, (*spvDescriptorSet0.cp_c3)._m0[0].w, _92);
    float _164 = _158 * 0.00390625;
    float _166 = _162 * 0.00390625;
    float _168 = _164 + (-0.0009765625);
    float _170 = _166 + (-0.0009765625);
    float _172 = _166 + 0.0009765625;
    float2 _1301 = float2(_168, _170);
    float4 _175 = dm_bs(spvDescriptorSet0.cp_t_tcb_A.sample(spvDescriptorSet0.cp_t_tcb_ASmplr, select(_1301, float2(0.0), isnan(_1301)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_A, spvDescriptorSet0.cp_t_tcb_ASmplr_w, select(_1301, float2(0.0), isnan(_1301)), level(0.0)).xyzw;
    float _177 = _175.x;
    float _179 = _175.y;
    float _181 = _175.z;
    float _183 = _175.w;
    float2 _1317 = float2(_168, _172);
    float4 _185 = dm_bs(spvDescriptorSet0.cp_t_tcb_A.sample(spvDescriptorSet0.cp_t_tcb_ASmplr, select(_1317, float2(0.0), isnan(_1317)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_A, spvDescriptorSet0.cp_t_tcb_ASmplr_w, select(_1317, float2(0.0), isnan(_1317)), level(0.0)).xyzw;
    float _187 = _185.x;
    float _189 = _185.y;
    float _191 = _185.z;
    float _193 = _185.w;
    float _195 = 1.0 / (*spvDescriptorSet0.cp_c3)._m0[633].w;
    float _197 = _86 + (*spvDescriptorSet0.cp_c3)._m0[2].z;
    float _199 = _92 + (*spvDescriptorSet0.cp_c3)._m0[2].w;
    float _201 = _164 + 0.0009765625;
    float _203 = (*spvDescriptorSet0.cp_c3)._m0[634].w * 30.0;
    int _205 = _74 << 1;
    int _207 = _80 << 1;
    float _209 = 1.0 / _203;
    float _211 = _195 * 0.000750000006519258022308349609375;
    float _213 = _197 * _211;
    float _215 = _199 * _211;
    float _217 = _197 * _209;
    float _219 = _217 * 0.25;
    float _221 = _199 * _209;
    float _223 = _221 * 0.25;
    float2 _1379 = float2(_201, _170);
    float4 _225 = dm_bs(spvDescriptorSet0.cp_t_tcb_A.sample(spvDescriptorSet0.cp_t_tcb_ASmplr, select(_1379, float2(0.0), isnan(_1379)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_A, spvDescriptorSet0.cp_t_tcb_ASmplr_w, select(_1379, float2(0.0), isnan(_1379)), level(0.0)).xyzw;
    float _227 = _225.x;
    float _229 = _225.y;
    float _231 = _225.z;
    float _233 = _225.w;
    float _235 = 0.0003000000142492353916168212890625 * (*spvDescriptorSet0.cp_c3)._m0[634].x;
    float _237 = _183 * (*spvDescriptorSet0.cp_c3)._m0[0].x;
    float _239 = -(*spvDescriptorSet0.cp_c3)._m0[1].w;
    float _241 = _183 + _239;
    float _243 = _179 * (*spvDescriptorSet0.cp_c3)._m0[11].w;
    float _245 = fma(_235, (*spvDescriptorSet0.cp_c3)._m0[632].w, _215);
    float _247 = _181 * (*spvDescriptorSet0.cp_c3)._m0[11].w;
    float _249 = _193 * (*spvDescriptorSet0.cp_c3)._m0[0].x;
    float _251 = precise::min(_237, _241);
    float _253 = _177 * (*spvDescriptorSet0.cp_c3)._m0[11].w;
    float _255 = fma(_235, (*spvDescriptorSet0.cp_c3)._m0[632].z, _213);
    float _257 = -(*spvDescriptorSet0.cp_c3)._m0[1].w;
    float _259 = _193 + _257;
    float2 _1446 = float2(_201, _172);
    float4 _261 = dm_bs(spvDescriptorSet0.cp_t_tcb_A.sample(spvDescriptorSet0.cp_t_tcb_ASmplr, select(_1446, float2(0.0), isnan(_1446)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_A, spvDescriptorSet0.cp_t_tcb_ASmplr_w, select(_1446, float2(0.0), isnan(_1446)), level(0.0)).xyzw;
    float _263 = _261.x;
    float _265 = _261.y;
    float _267 = _261.z;
    float _269 = _261.w;
    float2 _1462 = float2(_219, _223);
    float _271 = dm_bs(spvDescriptorSet0.cp_t_tcb_E.sample(spvDescriptorSet0.cp_t_tcb_ESmplr, select(_1462, float2(0.0), isnan(_1462)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_E, spvDescriptorSet0.cp_t_tcb_ESmplr_w, select(_1462, float2(0.0), isnan(_1462)), level(0.0)).x;
    float _273 = precise::max(0.0, _251);
    float2 _1472 = float2(_255, _245);
    float3 _277 = spvDescriptorSet0.cp_t_tcb_E.gather(spvDescriptorSet0.cp_t_tcb_ESmplr, select(_1472, float2(0.0), isnan(_1472)), int2(0), component::x).xyz;
    float _279 = _277.x;
    float _281 = _277.y;
    float _283 = _277.z;
    float2 _1486 = float2(_164, _166);
    float _285 = dm_bs(spvDescriptorSet0.cp_t_tcb_C.sample(spvDescriptorSet0.cp_t_tcb_CSmplr, select(_1486, float2(0.0), isnan(_1486)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.cp_t_tcb_C, spvDescriptorSet0.cp_t_tcb_CSmplr_w, select(_1486, float2(0.0), isnan(_1486)), level(0.0)).x;
    float2 _1494 = float2(_164, _166);
    float2 _287 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_1494, float2(0.0), isnan(_1494)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_1494, float2(0.0), isnan(_1494)), level(0.0)).xy;
    float _289 = _287.x;
    float _291 = _287.y;
    spvDescriptorSet0.cp_i_tcb_4A_.write(float4(_253, _243, _247, _273), uint2(int2(_205, _207)));
    float _293 = precise::min(_249, _259);
    float _295 = _187 * (*spvDescriptorSet0.cp_c3)._m0[11].w;
    int _297 = _207 + 1;
    float _299 = _189 * (*spvDescriptorSet0.cp_c3)._m0[11].w;
    float _301 = precise::max(0.0, _293);
    float _303 = _191 * (*spvDescriptorSet0.cp_c3)._m0[11].w;
    bool _307 = 0 < as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x);
    float _309 = _273 + _301;
    spvDescriptorSet0.cp_i_tcb_4A_.write(float4(_295, _299, _303, _301), uint2(int2(_205, _297)));
    float _311 = _233 * (*spvDescriptorSet0.cp_c3)._m0[0].x;
    float _313 = -(*spvDescriptorSet0.cp_c3)._m0[1].w;
    float _315 = _233 + _313;
    int _317 = _205 + 1;
    float _319 = precise::min(_311, _315);
    float _321 = precise::max(0.0, _319);
    float _323 = _321 + _309;
    float _325 = _269 * (*spvDescriptorSet0.cp_c3)._m0[0].x;
    float _327 = -(*spvDescriptorSet0.cp_c3)._m0[1].w;
    float _329 = _269 + _327;
    float _331 = -_279;
    float _333 = _331 + _281;
    float _335 = -_283;
    float _337 = _281 + _335;
    float _339 = precise::min(_325, _329);
    float _341 = precise::max(0.0, _339);
    float _343 = fma(_271, 2.0, -1.0);
    float _345 = precise::clamp(_343, 0.0, 1.0);
    float _347 = -(*spvDescriptorSet0.cp_c3)._m0[634].y;
    float _349 = _347 + (*spvDescriptorSet0.cp_c3)._m0[634].z;
    float _351 = _341 + _323;
    float _353 = fma(_345, _349, (*spvDescriptorSet0.cp_c3)._m0[634].y);
    float _355 = _351 * 0.25;
    float _357 = _353 * (*spvDescriptorSet0.cp_c3)._m0[633].x;
    float _359 = -_355;
    float _361 = _359 + 1.0;
    bool _363 = _355 < 9.9999997473787516355514526367188e-05;
    float _365 = float(_363);
    float _367 = _357 * (*spvDescriptorSet0.cp_c3)._m0[632].x;
    float _369 = _357 * (*spvDescriptorSet0.cp_c3)._m0[632].y;
    float _371 = -_365;
    float _373 = fma(_371, (*spvDescriptorSet0.cp_c3)._m0[642].x, 1.0);
    float _375 = fma(_361, (*spvDescriptorSet0.cp_c3)._m0[15].w, _355);
    float _377 = fma(_333, (*spvDescriptorSet0.cp_c3)._m0[633].z, _367);
    float _379 = fma(_337, (*spvDescriptorSet0.cp_c3)._m0[633].z, _369);
    float _381 = _373 * (*spvDescriptorSet0.cp_c3)._m0[0].w;
    float _383 = _381 * _375;
    float _385 = _285 * (*spvDescriptorSet0.cp_c3)._m0[0].x;
    float _387 = -(*spvDescriptorSet0.cp_c3)._m0[1].w;
    float _389 = _285 + _387;
    float _391 = fma(_383, _377, _289);
    float _393 = fma(_383, _379, _291);
    float _395 = precise::min(_385, _389);
    float _397 = _391 * (*spvDescriptorSet0.cp_c3)._m0[0].y;
    float _399 = precise::max(0.0, _395);
    float _401 = _393 * (*spvDescriptorSet0.cp_c3)._m0[0].y;
    bool _403 = !_307;
    float _405 = _401;
    float _407 = _397;
    float _409 = _399;
    float _411 = _401;
    float _413 = _397;
    float _415 = _399;
    if (!_403)
    {
        int _417 = 0;
        bool _419;
        do
        {
            int _421 = _417;
            int _423 = as_type<int>(_405);
            int _425 = as_type<int>(_407);
            int _427 = as_type<int>(_409);
            int _429 = _421 * 48;
            int _431 = _421 + 1;
            int _433 = _429 + 24;
            uint _436 = uint(int(uint(_433) >> uint(2)));
            uint _438 = uint(int(uint(int(_436)) >> uint(2)));
            int _440 = int(_436) & 3;
            float _442 = (*spvDescriptorSet0.cp_c4)._m0[int(_438)][_440];
            int _444 = int(_436) + 1;
            uint _446 = uint(int(uint(_444) >> uint(2)));
            int _448 = _444 & 3;
            float _450 = (*spvDescriptorSet0.cp_c4)._m0[int(_446)][_448];
            bool _452 = _431 >= as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x);
            int _454 = _429 + 16;
            uint _456 = uint(int(uint(_454) >> uint(2)));
            uint _458 = uint(int(uint(int(_456)) >> uint(2)));
            int _460 = int(_456) & 3;
            float _462 = (*spvDescriptorSet0.cp_c4)._m0[int(_458)][_460];
            int _464 = int(_456) + 1;
            uint _466 = uint(int(uint(_464) >> uint(2)));
            int _468 = _464 & 3;
            float _470 = (*spvDescriptorSet0.cp_c4)._m0[int(_466)][_468];
            float _472 = _450 * 5.0;
            float _474 = _442 * 5.0;
            float _476 = _472 * _472;
            float _478 = fma(_474, _474, _476);
            float _480 = -_470;
            float _482 = _480 + (*spvDescriptorSet0.cp_c3)._m0[2].w;
            float _484 = -_462;
            float _486 = _484 + (*spvDescriptorSet0.cp_c3)._m0[2].z;
            float _488 = rsqrt(_478);
            float _490 = _88 + _482;
            float _492 = _82 + _486;
            float _494 = sqrt(_478);
            float _496 = _472 * _488;
            float _498 = _474 * _488;
            float _500 = _496 * _490;
            float _502 = fma(_498, _492, _500);
            float _504 = -_496;
            float _506 = fma(_504, _502, _490);
            bool _508 = _502 >= _494;
            bool _510 = isnan(_502);
            bool _512 = _508 || _510;
            bool _514 = isnan(_494);
            bool _516 = _512 || _514;
            float _518 = -_498;
            float _520 = fma(_518, _502, _492);
            float _522 = _506 * _506;
            bool _524 = _502 > 0.0;
            bool _526 = !_516;
            bool _528 = _524 && _526;
            float _530 = fma(_520, _520, _522);
            _417 = _431;
            float _532 = _478;
            int _534 = _425;
            int _536 = _423;
            float _538 = _522;
            int _540 = _427;
            if (_528)
            {
                int _542 = _429 + 44;
                uint _544 = uint(int(uint(_542) >> uint(2)));
                uint _546 = uint(int(uint(int(_544)) >> uint(2)));
                int _548 = int(_544) & 3;
                float _550 = (*spvDescriptorSet0.cp_c4)._m0[int(_546)][_548];
                _532 = _550;
            }
            float _552 = _532;
            float _554 = _520;
            if (_528)
            {
                float _556 = sqrt(_530);
                _554 = _556;
            }
            float _558 = _554;
            bool _560 = _558 < _552;
            bool _562 = _560 && _528;
            float _564 = _558;
            if (_562)
            {
                float _566 = _450 * _450;
                _564 = _566;
            }
            float _568 = _564;
            float _570 = _568;
            if (_562)
            {
                _534 = as_type<int>(_442);
            }
            int _572 = _534;
            _407 = as_type<float>(_572);
            _413 = as_type<float>(_572);
            if (_562)
            {
                _536 = as_type<int>(_450);
            }
            int _574 = _536;
            _405 = as_type<float>(_574);
            _411 = as_type<float>(_574);
            if (_562)
            {
                float _576 = fma(_442, _442, _568);
                _570 = _576;
            }
            float _578 = _570;
            float _580 = _578;
            if (_562)
            {
                float _582 = sqrt(_578);
                _580 = _582;
            }
            float _584 = _580;
            if (_562)
            {
                float _586 = precise::min(_584, 1.0);
                _538 = _586;
            }
            float _588 = _538;
            if (_562)
            {
                float _590 = _588 * (*spvDescriptorSet0.cp_c3)._m0[642].y;
                _540 = as_type<int>(_590);
            }
            int _592 = _540;
            _419 = !_452;
            _409 = as_type<float>(_592);
            _415 = as_type<float>(_592);
        } while (_419);
    }
    float _594 = _411;
    float _596 = _413;
    float _598 = _415;
    float _600 = _594 * _594;
    bool _602 = _355 > 0.001000000047497451305389404296875;
    float _604 = _227 * (*spvDescriptorSet0.cp_c3)._m0[11].w;
    float _606 = fma(_596, _596, _600);
    float _608 = _267 * (*spvDescriptorSet0.cp_c3)._m0[11].w;
    float _610 = sqrt(_606);
    float _612 = _610 + 9.9999997473787516355514526367188e-06;
    float _614 = _265 * (*spvDescriptorSet0.cp_c3)._m0[11].w;
    float _616 = 1.0 / _612;
    float _618 = precise::min(_612, 10.0);
    float _620 = _263 * (*spvDescriptorSet0.cp_c3)._m0[11].w;
    float _622 = _618 * _616;
    float _624 = _596 * _622;
    float _626 = _594 * _622;
    float _628 = _229 * (*spvDescriptorSet0.cp_c3)._m0[11].w;
    float _630 = _231 * (*spvDescriptorSet0.cp_c3)._m0[11].w;
    spvDescriptorSet0.cp_i_tcb_4A_.write(float4(_604, _628, _630, _321), uint2(int2(_317, _207)));
    spvDescriptorSet0.cp_i_tcb_4A_.write(float4(_620, _614, _608, _341), uint2(int2(_317, _297)));
    spvDescriptorSet0.cp_i_tcb_48_.write(float4(_624, _626, 0.0, 0.0), uint2(int2(_74, _80)));
    spvDescriptorSet0.cp_i_tcb_4C_.write(float4(_598, 0.0, 0.0, 0.0), uint2(int2(_74, _80)));
    if (!_602)
    {
        return;
    }
    uint _632 = uint(int(uint(_74) >> uint(5)));
    uint _634 = uint(int(uint(_80) >> uint(6)));
    int _636 = int(_632) << 2;
    int _638 = _636 + int(_634);
    int _640 = _638 << 2;
    int _642 = _640 + as_type<int>((*spvDescriptorSet0.cp_c0)._m0[49].x);
    bool _644 = uint(_642) < uint(_640);
    int _646 = int(_644);
    int _648 = as_type<int>((*spvDescriptorSet0.cp_c0)._m0[49].y) + _646;
    uint _650 = spvSubgroupBallot(true).x;
    float _652 = spvSubgroupShuffle(as_type<float>(_642), 0u);
    bool _654 = as_type<int>(_652) == _642;
    float _656 = spvSubgroupShuffle(as_type<float>(_648), 0u);
    bool _658 = as_type<int>(_656) == _648;
    bool _660 = _654 && _658;
    int _662 = int(_660);
    float _664 = spvSubgroupShuffle(as_type<float>(_642), 1u);
    bool _666 = as_type<int>(_664) == _642;
    float _668 = spvSubgroupShuffle(as_type<float>(_648), 1u);
    bool _670 = as_type<int>(_668) == _648;
    bool _672 = _666 && _670;
    int _674 = _672 ? 2 : 0;
    int _676 = _662 | _674;
    float _678 = spvSubgroupShuffle(as_type<float>(_642), 2u);
    bool _680 = as_type<int>(_678) == _642;
    float _682 = spvSubgroupShuffle(as_type<float>(_648), 2u);
    bool _684 = as_type<int>(_682) == _648;
    bool _686 = _680 && _684;
    int _688 = _686 ? 4 : 0;
    int _690 = _676 | _688;
    float _692 = spvSubgroupShuffle(as_type<float>(_642), 3u);
    bool _694 = as_type<int>(_692) == _642;
    float _696 = spvSubgroupShuffle(as_type<float>(_648), 3u);
    bool _698 = as_type<int>(_696) == _648;
    bool _700 = _694 && _698;
    int _702 = _700 ? 8 : 0;
    int _704 = _690 | _702;
    float _706 = spvSubgroupShuffle(as_type<float>(_642), 4u);
    bool _708 = as_type<int>(_706) == _642;
    float _710 = spvSubgroupShuffle(as_type<float>(_648), 4u);
    bool _712 = as_type<int>(_710) == _648;
    bool _714 = _708 && _712;
    int _716 = _714 ? 16 : 0;
    int _718 = _704 | _716;
    float _720 = spvSubgroupShuffle(as_type<float>(_642), 5u);
    bool _722 = as_type<int>(_720) == _642;
    float _724 = spvSubgroupShuffle(as_type<float>(_648), 5u);
    bool _726 = as_type<int>(_724) == _648;
    bool _728 = _722 && _726;
    int _730 = _728 ? 32 : 0;
    int _732 = _718 | _730;
    float _734 = spvSubgroupShuffle(as_type<float>(_642), 6u);
    bool _736 = as_type<int>(_734) == _642;
    float _738 = spvSubgroupShuffle(as_type<float>(_648), 6u);
    bool _740 = as_type<int>(_738) == _648;
    bool _742 = _736 && _740;
    int _744 = _742 ? 64 : 0;
    int _746 = _732 | _744;
    float _748 = spvSubgroupShuffle(as_type<float>(_642), 7u);
    bool _750 = as_type<int>(_748) == _642;
    float _752 = spvSubgroupShuffle(as_type<float>(_648), 7u);
    bool _754 = as_type<int>(_752) == _648;
    bool _756 = _750 && _754;
    int _758 = _756 ? 128 : 0;
    int _760 = _746 | _758;
    float _762 = spvSubgroupShuffle(as_type<float>(_642), 8u);
    bool _764 = as_type<int>(_762) == _642;
    float _766 = spvSubgroupShuffle(as_type<float>(_648), 8u);
    bool _768 = as_type<int>(_766) == _648;
    bool _770 = _764 && _768;
    int _772 = _770 ? 256 : 0;
    int _774 = _760 | _772;
    float _776 = spvSubgroupShuffle(as_type<float>(_642), 9u);
    bool _778 = as_type<int>(_776) == _642;
    float _780 = spvSubgroupShuffle(as_type<float>(_648), 9u);
    bool _782 = as_type<int>(_780) == _648;
    bool _784 = _778 && _782;
    int _786 = _784 ? 512 : 0;
    int _788 = _774 | _786;
    float _790 = spvSubgroupShuffle(as_type<float>(_642), 10u);
    bool _792 = as_type<int>(_790) == _642;
    float _794 = spvSubgroupShuffle(as_type<float>(_648), 10u);
    bool _796 = as_type<int>(_794) == _648;
    bool _798 = _792 && _796;
    int _800 = _798 ? 1024 : 0;
    int _802 = _788 | _800;
    float _804 = spvSubgroupShuffle(as_type<float>(_642), 11u);
    bool _806 = as_type<int>(_804) == _642;
    float _808 = spvSubgroupShuffle(as_type<float>(_648), 11u);
    bool _810 = as_type<int>(_808) == _648;
    bool _812 = _806 && _810;
    int _814 = _812 ? 2048 : 0;
    int _816 = _802 | _814;
    float _818 = spvSubgroupShuffle(as_type<float>(_642), 12u);
    bool _820 = as_type<int>(_818) == _642;
    float _822 = spvSubgroupShuffle(as_type<float>(_648), 12u);
    bool _824 = as_type<int>(_822) == _648;
    bool _826 = _820 && _824;
    int _828 = _826 ? 4096 : 0;
    int _830 = _816 | _828;
    float _832 = spvSubgroupShuffle(as_type<float>(_642), 13u);
    bool _834 = as_type<int>(_832) == _642;
    float _836 = spvSubgroupShuffle(as_type<float>(_648), 13u);
    bool _838 = as_type<int>(_836) == _648;
    bool _840 = _834 && _838;
    int _842 = _840 ? 8192 : 0;
    int _844 = _830 | _842;
    float _846 = spvSubgroupShuffle(as_type<float>(_642), 14u);
    bool _848 = as_type<int>(_846) == _642;
    float _850 = spvSubgroupShuffle(as_type<float>(_648), 14u);
    bool _852 = as_type<int>(_850) == _648;
    bool _854 = _848 && _852;
    int _856 = _854 ? 16384 : 0;
    int _858 = _844 | _856;
    float _860 = spvSubgroupShuffle(as_type<float>(_642), 15u);
    bool _862 = as_type<int>(_860) == _642;
    float _864 = spvSubgroupShuffle(as_type<float>(_648), 15u);
    bool _866 = as_type<int>(_864) == _648;
    bool _868 = _862 && _866;
    int _870 = _868 ? 32768 : 0;
    int _872 = _858 | _870;
    float _874 = spvSubgroupShuffle(as_type<float>(_642), 16u);
    bool _876 = as_type<int>(_874) == _642;
    float _878 = spvSubgroupShuffle(as_type<float>(_648), 16u);
    bool _880 = as_type<int>(_878) == _648;
    bool _882 = _876 && _880;
    int _884 = _882 ? 65536 : 0;
    int _886 = _872 | _884;
    float _888 = spvSubgroupShuffle(as_type<float>(_642), 17u);
    bool _890 = as_type<int>(_888) == _642;
    float _892 = spvSubgroupShuffle(as_type<float>(_648), 17u);
    bool _894 = as_type<int>(_892) == _648;
    bool _896 = _890 && _894;
    int _898 = _896 ? 131072 : 0;
    int _900 = _886 | _898;
    float _902 = spvSubgroupShuffle(as_type<float>(_642), 18u);
    bool _904 = as_type<int>(_902) == _642;
    float _906 = spvSubgroupShuffle(as_type<float>(_648), 18u);
    bool _908 = as_type<int>(_906) == _648;
    bool _910 = _904 && _908;
    int _912 = _910 ? 262144 : 0;
    int _914 = _900 | _912;
    float _916 = spvSubgroupShuffle(as_type<float>(_642), 19u);
    bool _918 = as_type<int>(_916) == _642;
    float _920 = spvSubgroupShuffle(as_type<float>(_648), 19u);
    bool _922 = as_type<int>(_920) == _648;
    bool _924 = _918 && _922;
    int _926 = _924 ? 524288 : 0;
    int _928 = _914 | _926;
    float _930 = spvSubgroupShuffle(as_type<float>(_642), 20u);
    bool _932 = as_type<int>(_930) == _642;
    float _934 = spvSubgroupShuffle(as_type<float>(_648), 20u);
    bool _936 = as_type<int>(_934) == _648;
    bool _938 = _932 && _936;
    int _940 = _938 ? 1048576 : 0;
    int _942 = _928 | _940;
    float _944 = spvSubgroupShuffle(as_type<float>(_642), 21u);
    bool _946 = as_type<int>(_944) == _642;
    float _948 = spvSubgroupShuffle(as_type<float>(_648), 21u);
    bool _950 = as_type<int>(_948) == _648;
    bool _952 = _946 && _950;
    int _954 = _952 ? 2097152 : 0;
    int _956 = _942 | _954;
    float _958 = spvSubgroupShuffle(as_type<float>(_642), 22u);
    bool _960 = as_type<int>(_958) == _642;
    float _962 = spvSubgroupShuffle(as_type<float>(_648), 22u);
    bool _964 = as_type<int>(_962) == _648;
    bool _966 = _960 && _964;
    int _968 = _966 ? 4194304 : 0;
    int _970 = _956 | _968;
    float _972 = spvSubgroupShuffle(as_type<float>(_642), 23u);
    bool _974 = as_type<int>(_972) == _642;
    float _976 = spvSubgroupShuffle(as_type<float>(_648), 23u);
    bool _978 = as_type<int>(_976) == _648;
    bool _980 = _974 && _978;
    int _982 = _980 ? 8388608 : 0;
    int _984 = _970 | _982;
    float _986 = spvSubgroupShuffle(as_type<float>(_642), 24u);
    bool _988 = as_type<int>(_986) == _642;
    float _990 = spvSubgroupShuffle(as_type<float>(_648), 24u);
    bool _992 = as_type<int>(_990) == _648;
    bool _994 = _988 && _992;
    int _996 = _994 ? 16777216 : 0;
    int _998 = _984 | _996;
    float _1000 = spvSubgroupShuffle(as_type<float>(_642), 25u);
    bool _1002 = as_type<int>(_1000) == _642;
    float _1004 = spvSubgroupShuffle(as_type<float>(_648), 25u);
    bool _1006 = as_type<int>(_1004) == _648;
    bool _1008 = _1002 && _1006;
    int _1010 = _1008 ? 33554432 : 0;
    int _1012 = _998 | _1010;
    float _1014 = spvSubgroupShuffle(as_type<float>(_642), 26u);
    bool _1016 = as_type<int>(_1014) == _642;
    float _1018 = spvSubgroupShuffle(as_type<float>(_648), 26u);
    bool _1020 = as_type<int>(_1018) == _648;
    bool _1022 = _1016 && _1020;
    int _1024 = _1022 ? 67108864 : 0;
    int _1026 = _1012 | _1024;
    float _1028 = spvSubgroupShuffle(as_type<float>(_642), 27u);
    bool _1030 = as_type<int>(_1028) == _642;
    float _1032 = spvSubgroupShuffle(as_type<float>(_648), 27u);
    bool _1034 = as_type<int>(_1032) == _648;
    bool _1036 = _1030 && _1034;
    int _1038 = _1036 ? 134217728 : 0;
    int _1040 = _1026 | _1038;
    float _1042 = spvSubgroupShuffle(as_type<float>(_642), 28u);
    bool _1044 = as_type<int>(_1042) == _642;
    float _1046 = spvSubgroupShuffle(as_type<float>(_648), 28u);
    bool _1048 = as_type<int>(_1046) == _648;
    bool _1050 = _1044 && _1048;
    int _1052 = _1050 ? 268435456 : 0;
    int _1054 = _1040 | _1052;
    float _1056 = spvSubgroupShuffle(as_type<float>(_642), 29u);
    bool _1058 = as_type<int>(_1056) == _642;
    float _1060 = spvSubgroupShuffle(as_type<float>(_648), 29u);
    bool _1062 = as_type<int>(_1060) == _648;
    bool _1064 = _1058 && _1062;
    int _1066 = _1064 ? 536870912 : 0;
    int _1068 = _1054 | _1066;
    float _1070 = spvSubgroupShuffle(as_type<float>(_642), 30u);
    bool _1072 = as_type<int>(_1070) == _642;
    float _1074 = spvSubgroupShuffle(as_type<float>(_648), 30u);
    bool _1076 = as_type<int>(_1074) == _648;
    bool _1078 = _1072 && _1076;
    int _1080 = _1078 ? 1073741824 : 0;
    int _1082 = _1068 | _1080;
    float _1084 = spvSubgroupShuffle(as_type<float>(_642), 31u);
    bool _1086 = as_type<int>(_1084) == _642;
    float _1088 = spvSubgroupShuffle(as_type<float>(_648), 31u);
    bool _1090 = as_type<int>(_1088) == _648;
    bool _1092 = _1086 && _1090;
    int _1094 = _1092 ? int(0x80000000) : 0;
    int _1096 = _1082 | _1094;
    int _1098 = _1096 & int(_650);
    bool _1100 = _1098 == int(_650);
    if (!_1100)
    {
        uint _1102 = uint(int(uint(_640) >> uint(2)));
        uint _2906 = atomic_fetch_add_explicit((device atomic_uint*)&(*spvDescriptorSet0.cp_s0)._m0[int(_1102)], 1u, memory_order_relaxed);
        uint _1104 = _2906;
    }
    if (!_1100)
    {
        return;
    }
    float _1106 = as_type<float>(gl_SubgroupInvocationID);
    uint _1108 = spvSubgroupBallot(true).x;
    int _1110 = int(spvFindUMSB(_1108));
    int _1112 = popcount(int(_1108));
    bool _1114 = as_type<int>(_1106) == _1110;
    if (_1114)
    {
        uint _1116 = uint(int(uint(_640) >> uint(2)));
        uint _2936 = atomic_fetch_add_explicit((device atomic_uint*)&(*spvDescriptorSet0.cp_s0)._m0[int(_1116)], uint(_1112), memory_order_relaxed);
        uint _1118 = _2936;
    }
}

