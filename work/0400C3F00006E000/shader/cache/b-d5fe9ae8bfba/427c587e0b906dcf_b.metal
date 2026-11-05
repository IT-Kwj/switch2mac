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
    texture2d<float> cp_t_tcb_E [[id(6)]];
    sampler cp_t_tcb_ESmplr [[id(7)]];
    texture2d<float> cp_t_tcb_A [[id(8)]];
    sampler cp_t_tcb_ASmplr [[id(9)]];
    texture2d<float> cp_t_tcb_C [[id(10)]];
    sampler cp_t_tcb_CSmplr [[id(11)]];
    texture2d<float, access::write> cp_i_tcb_4A_ [[id(12)]];
    texture2d<float, access::write> cp_i_tcb_48_ [[id(13)]];
    texture2d<float, access::write> cp_i_tcb_4C_ [[id(14)]];
    sampler cp_t_tcb_8Smplr_w [[id(15)]];
    sampler cp_t_tcb_ESmplr_w [[id(16)]];
    sampler cp_t_tcb_ASmplr_w [[id(17)]];
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
    int _76 = as_type<int>(_67) << 3;
    int _78 = _76 + as_type<int>(_69);
    float _80 = float(uint(_74));
    float _82 = float(uint(_78));
    float _84 = _80 + 0.5;
    float _86 = _82 + 0.5;
    float _88 = _84 + (*spvDescriptorSet0.cp_c3)._m0[2].x;
    float _90 = _86 + (*spvDescriptorSet0.cp_c3)._m0[2].y;
    float _92 = _88 * 0.00390625;
    float _94 = _90 * 0.00390625;
    float2 _1075 = float2(_92, _94);
    float2 _98 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_1075, float2(0.0), isnan(_1075)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_1075, float2(0.0), isnan(_1075)), level(0.0)).xy;
    float _100 = _98.x;
    float _102 = _98.y;
    float _104 = (*spvDescriptorSet0.cp_c3)._m0[0].w * 0.5;
    float _106 = -_104;
    float _108 = fma(_100, _106, _88);
    float _110 = -_104;
    float _112 = fma(_102, _110, _90);
    float _114 = _108 * 0.00390625;
    float _116 = _112 * 0.00390625;
    float2 _1110 = float2(_114, _116);
    float2 _118 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_1110, float2(0.0), isnan(_1110)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_1110, float2(0.0), isnan(_1110)), level(0.0)).xy;
    float _120 = _118.x;
    float _122 = _118.y;
    float _124 = (*spvDescriptorSet0.cp_c3)._m0[0].w * 0.75;
    float _126 = -_124;
    float _128 = fma(_120, _126, _88);
    float _130 = -_124;
    float _132 = fma(_122, _130, _90);
    float _134 = _128 * 0.00390625;
    float _136 = _132 * 0.00390625;
    float2 _1142 = float2(_134, _136);
    float2 _138 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_1142, float2(0.0), isnan(_1142)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_1142, float2(0.0), isnan(_1142)), level(0.0)).xy;
    float _140 = _138.x;
    float _142 = _138.y;
    float _144 = 1.0 / (*spvDescriptorSet0.cp_c3)._m0[633].w;
    float _146 = _122 * 0.3333333432674407958984375;
    float _148 = _120 * 0.3333333432674407958984375;
    float _150 = (*spvDescriptorSet0.cp_c3)._m0[634].w * 30.0;
    float _152 = fma(_102, 0.22222222387790679931640625, _146);
    float _154 = fma(_100, 0.22222222387790679931640625, _148);
    float _156 = _90 + (*spvDescriptorSet0.cp_c3)._m0[2].w;
    float _158 = _88 + (*spvDescriptorSet0.cp_c3)._m0[2].z;
    float _160 = 1.0 / _150;
    float _162 = _144 * 0.000750000006519258022308349609375;
    float _164 = _156 * _160;
    float _166 = _164 * 0.25;
    float _168 = _156 * _162;
    float _170 = _158 * _160;
    float _172 = _170 * 0.25;
    float _174 = _158 * _162;
    float2 _1206 = float2(_172, _166);
    float _176 = dm_bs(spvDescriptorSet0.cp_t_tcb_E.sample(spvDescriptorSet0.cp_t_tcb_ESmplr, select(_1206, float2(0.0), isnan(_1206)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_E, spvDescriptorSet0.cp_t_tcb_ESmplr_w, select(_1206, float2(0.0), isnan(_1206)), level(0.0)).x;
    float _178 = fma(_140, 0.4444444477558135986328125, _154);
    float _180 = fma(_142, 0.4444444477558135986328125, _152);
    float _182 = 0.0003000000142492353916168212890625 * (*spvDescriptorSet0.cp_c3)._m0[634].x;
    float _184 = -_178;
    float _186 = fma(_184, (*spvDescriptorSet0.cp_c3)._m0[0].w, _88);
    float _188 = -_180;
    float _190 = fma(_188, (*spvDescriptorSet0.cp_c3)._m0[0].w, _90);
    float _192 = fma(_182, (*spvDescriptorSet0.cp_c3)._m0[632].w, _168);
    float _194 = fma(_182, (*spvDescriptorSet0.cp_c3)._m0[632].z, _174);
    float _196 = _186 * 0.00390625;
    float _198 = _190 * 0.00390625;
    float2 _1254 = float2(_194, _192);
    float3 _202 = spvDescriptorSet0.cp_t_tcb_E.gather(spvDescriptorSet0.cp_t_tcb_ESmplr, select(_1254, float2(0.0), isnan(_1254)), int2(0), component::x).xyz;
    float _204 = _202.x;
    float _206 = _202.y;
    float _208 = _202.z;
    float2 _1268 = float2(_196, _198);
    float4 _211 = dm_bs(spvDescriptorSet0.cp_t_tcb_A.sample(spvDescriptorSet0.cp_t_tcb_ASmplr, select(_1268, float2(0.0), isnan(_1268)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_A, spvDescriptorSet0.cp_t_tcb_ASmplr_w, select(_1268, float2(0.0), isnan(_1268)), level(0.0)).xyzw;
    float _213 = _211.x;
    float _215 = _211.y;
    float _217 = _211.z;
    float _219 = _211.w;
    float2 _1284 = float2(_196, _198);
    float _221 = dm_bs(spvDescriptorSet0.cp_t_tcb_C.sample(spvDescriptorSet0.cp_t_tcb_CSmplr, select(_1284, float2(0.0), isnan(_1284)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.cp_t_tcb_C, spvDescriptorSet0.cp_t_tcb_CSmplr_w, select(_1284, float2(0.0), isnan(_1284)), level(0.0)).x;
    float2 _1292 = float2(_196, _198);
    float2 _223 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_1292, float2(0.0), isnan(_1292)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_1292, float2(0.0), isnan(_1292)), level(0.0)).xy;
    float _225 = _223.x;
    float _227 = _223.y;
    bool _231 = 0 < as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x);
    float _233 = -(*spvDescriptorSet0.cp_c3)._m0[634].y;
    float _235 = _233 + (*spvDescriptorSet0.cp_c3)._m0[634].z;
    float _237 = fma(_176, 2.0, -1.0);
    float _239 = precise::clamp(_237, 0.0, 1.0);
    float _241 = fma(_239, _235, (*spvDescriptorSet0.cp_c3)._m0[634].y);
    float _243 = _241 * (*spvDescriptorSet0.cp_c3)._m0[633].x;
    float _245 = _243 * (*spvDescriptorSet0.cp_c3)._m0[632].x;
    float _247 = _243 * (*spvDescriptorSet0.cp_c3)._m0[632].y;
    float _249 = -_204;
    float _251 = _249 + _206;
    float _253 = _219 * (*spvDescriptorSet0.cp_c3)._m0[0].x;
    float _255 = -(*spvDescriptorSet0.cp_c3)._m0[1].w;
    float _257 = _219 + _255;
    float _259 = -_208;
    float _261 = _206 + _259;
    float _263 = fma(_251, (*spvDescriptorSet0.cp_c3)._m0[633].z, _245);
    float _265 = precise::min(_253, _257);
    float _267 = fma(_261, (*spvDescriptorSet0.cp_c3)._m0[633].z, _247);
    float _269 = precise::max(0.0, _265);
    bool _271 = _269 < 9.9999997473787516355514526367188e-05;
    float _273 = float(_271);
    float _275 = -_269;
    float _277 = _275 + 1.0;
    float _279 = -_273;
    float _281 = fma(_279, (*spvDescriptorSet0.cp_c3)._m0[642].x, 1.0);
    float _283 = fma(_277, (*spvDescriptorSet0.cp_c3)._m0[15].w, _269);
    float _285 = -(*spvDescriptorSet0.cp_c3)._m0[1].w;
    float _287 = _221 + _285;
    float _289 = _281 * (*spvDescriptorSet0.cp_c3)._m0[0].w;
    float _291 = _221 * (*spvDescriptorSet0.cp_c3)._m0[0].x;
    float _293 = _289 * _283;
    float _295 = precise::min(_291, _287);
    float _297 = fma(_293, _263, _225);
    float _299 = fma(_293, _267, _227);
    float _301 = precise::max(0.0, _295);
    float _303 = _297 * (*spvDescriptorSet0.cp_c3)._m0[0].y;
    float _305 = _299 * (*spvDescriptorSet0.cp_c3)._m0[0].y;
    bool _307 = !_231;
    float _309 = _305;
    float _311 = _303;
    float _313 = _301;
    float _315 = _305;
    float _317 = _303;
    float _319 = _301;
    if (!_307)
    {
        int _321 = 0;
        bool _323;
        do
        {
            int _325 = _321;
            int _327 = as_type<int>(_309);
            int _329 = as_type<int>(_311);
            int _331 = as_type<int>(_313);
            int _333 = _325 * 48;
            int _335 = _325 + 1;
            int _337 = _333 + 24;
            uint _340 = uint(int(uint(_337) >> uint(2)));
            uint _342 = uint(int(uint(int(_340)) >> uint(2)));
            int _344 = int(_340) & 3;
            float _346 = (*spvDescriptorSet0.cp_c4)._m0[int(_342)][_344];
            int _348 = int(_340) + 1;
            uint _350 = uint(int(uint(_348) >> uint(2)));
            int _352 = _348 & 3;
            float _354 = (*spvDescriptorSet0.cp_c4)._m0[int(_350)][_352];
            bool _356 = _335 >= as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x);
            int _358 = _333 + 16;
            uint _360 = uint(int(uint(_358) >> uint(2)));
            uint _362 = uint(int(uint(int(_360)) >> uint(2)));
            int _364 = int(_360) & 3;
            float _366 = (*spvDescriptorSet0.cp_c4)._m0[int(_362)][_364];
            int _368 = int(_360) + 1;
            uint _370 = uint(int(uint(_368) >> uint(2)));
            int _372 = _368 & 3;
            float _374 = (*spvDescriptorSet0.cp_c4)._m0[int(_370)][_372];
            float _376 = _354 * 5.0;
            float _378 = _346 * 5.0;
            float _380 = _376 * _376;
            float _382 = fma(_378, _378, _380);
            float _384 = -_374;
            float _386 = _384 + (*spvDescriptorSet0.cp_c3)._m0[2].w;
            float _388 = -_366;
            float _390 = _388 + (*spvDescriptorSet0.cp_c3)._m0[2].z;
            float _392 = rsqrt(_382);
            float _394 = _86 + _386;
            float _396 = _84 + _390;
            float _398 = sqrt(_382);
            float _400 = _376 * _392;
            float _402 = _378 * _392;
            float _404 = _400 * _394;
            float _406 = fma(_402, _396, _404);
            float _408 = -_400;
            float _410 = fma(_408, _406, _394);
            bool _412 = _406 >= _398;
            bool _414 = isnan(_406);
            bool _416 = _412 || _414;
            bool _418 = isnan(_398);
            bool _420 = _416 || _418;
            float _422 = -_402;
            float _424 = fma(_422, _406, _396);
            float _426 = _410 * _410;
            bool _428 = _406 > 0.0;
            bool _430 = !_420;
            bool _432 = _428 && _430;
            float _434 = fma(_424, _424, _426);
            _321 = _335;
            float _436 = _382;
            float _438 = _426;
            int _440 = _329;
            int _442 = _327;
            int _444 = _331;
            if (_432)
            {
                int _446 = _333 + 44;
                uint _448 = uint(int(uint(_446) >> uint(2)));
                uint _450 = uint(int(uint(int(_448)) >> uint(2)));
                int _452 = int(_448) & 3;
                float _454 = (*spvDescriptorSet0.cp_c4)._m0[int(_450)][_452];
                _436 = _454;
            }
            float _456 = _436;
            float _458 = _424;
            if (_432)
            {
                float _460 = sqrt(_434);
                _458 = _460;
            }
            float _462 = _458;
            bool _464 = _462 < _456;
            bool _466 = _464 && _432;
            float _468 = _462;
            if (_466)
            {
                float _470 = _354 * _354;
                _438 = _470;
            }
            float _472 = _438;
            float _474 = _472;
            if (_466)
            {
                _440 = as_type<int>(_346);
            }
            int _476 = _440;
            _311 = as_type<float>(_476);
            _317 = as_type<float>(_476);
            if (_466)
            {
                _442 = as_type<int>(_354);
            }
            int _478 = _442;
            _309 = as_type<float>(_478);
            _315 = as_type<float>(_478);
            if (_466)
            {
                float _480 = fma(_346, _346, _472);
                _474 = _480;
            }
            float _482 = _474;
            float _484 = _482;
            if (_466)
            {
                float _486 = sqrt(_482);
                _484 = _486;
            }
            float _488 = _484;
            if (_466)
            {
                float _490 = precise::min(_488, 1.0);
                _468 = _490;
            }
            float _492 = _468;
            if (_466)
            {
                float _494 = _492 * (*spvDescriptorSet0.cp_c3)._m0[642].y;
                _444 = as_type<int>(_494);
            }
            int _496 = _444;
            _323 = !_356;
            _313 = as_type<float>(_496);
            _319 = as_type<float>(_496);
        } while (_323);
    }
    float _498 = _315;
    float _500 = _317;
    float _502 = _319;
    float _504 = _498 * _498;
    bool _506 = _269 > 0.001000000047497451305389404296875;
    float _508 = _213 * (*spvDescriptorSet0.cp_c3)._m0[11].w;
    float _510 = _215 * (*spvDescriptorSet0.cp_c3)._m0[11].w;
    float _512 = fma(_500, _500, _504);
    float _514 = _217 * (*spvDescriptorSet0.cp_c3)._m0[11].w;
    spvDescriptorSet0.cp_i_tcb_4A_.write(float4(_508, _510, _514, _269), uint2(int2(_74, _78)));
    float _516 = sqrt(_512);
    float _518 = _516 + 9.9999997473787516355514526367188e-06;
    float _520 = 1.0 / _518;
    float _522 = precise::min(_518, 10.0);
    float _524 = _522 * _520;
    float _526 = _500 * _524;
    float _528 = _498 * _524;
    spvDescriptorSet0.cp_i_tcb_48_.write(float4(_526, _528, 0.0, 0.0), uint2(int2(_74, _78)));
    spvDescriptorSet0.cp_i_tcb_4C_.write(float4(_502, 0.0, 0.0, 0.0), uint2(int2(_74, _78)));
    if (!_506)
    {
        return;
    }
    uint _530 = uint(int(uint(_74) >> uint(5)));
    uint _532 = uint(int(uint(_78) >> uint(6)));
    int _534 = int(_530) << 2;
    int _536 = _534 + int(_532);
    int _538 = _536 << 2;
    int _540 = _538 + as_type<int>((*spvDescriptorSet0.cp_c0)._m0[49].x);
    bool _542 = uint(_540) < uint(_538);
    int _544 = int(_542);
    int _546 = as_type<int>((*spvDescriptorSet0.cp_c0)._m0[49].y) + _544;
    uint _548 = spvSubgroupBallot(true).x;
    float _550 = spvSubgroupShuffle(as_type<float>(_540), 0u);
    bool _552 = as_type<int>(_550) == _540;
    float _554 = spvSubgroupShuffle(as_type<float>(_546), 0u);
    bool _556 = as_type<int>(_554) == _546;
    bool _558 = _552 && _556;
    int _560 = int(_558);
    float _562 = spvSubgroupShuffle(as_type<float>(_540), 1u);
    bool _564 = as_type<int>(_562) == _540;
    float _566 = spvSubgroupShuffle(as_type<float>(_546), 1u);
    bool _568 = as_type<int>(_566) == _546;
    bool _570 = _564 && _568;
    int _572 = _570 ? 2 : 0;
    int _574 = _560 | _572;
    float _576 = spvSubgroupShuffle(as_type<float>(_540), 2u);
    bool _578 = as_type<int>(_576) == _540;
    float _580 = spvSubgroupShuffle(as_type<float>(_546), 2u);
    bool _582 = as_type<int>(_580) == _546;
    bool _584 = _578 && _582;
    int _586 = _584 ? 4 : 0;
    int _588 = _574 | _586;
    float _590 = spvSubgroupShuffle(as_type<float>(_540), 3u);
    bool _592 = as_type<int>(_590) == _540;
    float _594 = spvSubgroupShuffle(as_type<float>(_546), 3u);
    bool _596 = as_type<int>(_594) == _546;
    bool _598 = _592 && _596;
    int _600 = _598 ? 8 : 0;
    int _602 = _588 | _600;
    float _604 = spvSubgroupShuffle(as_type<float>(_540), 4u);
    bool _606 = as_type<int>(_604) == _540;
    float _608 = spvSubgroupShuffle(as_type<float>(_546), 4u);
    bool _610 = as_type<int>(_608) == _546;
    bool _612 = _606 && _610;
    int _614 = _612 ? 16 : 0;
    int _616 = _602 | _614;
    float _618 = spvSubgroupShuffle(as_type<float>(_540), 5u);
    bool _620 = as_type<int>(_618) == _540;
    float _622 = spvSubgroupShuffle(as_type<float>(_546), 5u);
    bool _624 = as_type<int>(_622) == _546;
    bool _626 = _620 && _624;
    int _628 = _626 ? 32 : 0;
    int _630 = _616 | _628;
    float _632 = spvSubgroupShuffle(as_type<float>(_540), 6u);
    bool _634 = as_type<int>(_632) == _540;
    float _636 = spvSubgroupShuffle(as_type<float>(_546), 6u);
    bool _638 = as_type<int>(_636) == _546;
    bool _640 = _634 && _638;
    int _642 = _640 ? 64 : 0;
    int _644 = _630 | _642;
    float _646 = spvSubgroupShuffle(as_type<float>(_540), 7u);
    bool _648 = as_type<int>(_646) == _540;
    float _650 = spvSubgroupShuffle(as_type<float>(_546), 7u);
    bool _652 = as_type<int>(_650) == _546;
    bool _654 = _648 && _652;
    int _656 = _654 ? 128 : 0;
    int _658 = _644 | _656;
    float _660 = spvSubgroupShuffle(as_type<float>(_540), 8u);
    bool _662 = as_type<int>(_660) == _540;
    float _664 = spvSubgroupShuffle(as_type<float>(_546), 8u);
    bool _666 = as_type<int>(_664) == _546;
    bool _668 = _662 && _666;
    int _670 = _668 ? 256 : 0;
    int _672 = _658 | _670;
    float _674 = spvSubgroupShuffle(as_type<float>(_540), 9u);
    bool _676 = as_type<int>(_674) == _540;
    float _678 = spvSubgroupShuffle(as_type<float>(_546), 9u);
    bool _680 = as_type<int>(_678) == _546;
    bool _682 = _676 && _680;
    int _684 = _682 ? 512 : 0;
    int _686 = _672 | _684;
    float _688 = spvSubgroupShuffle(as_type<float>(_540), 10u);
    bool _690 = as_type<int>(_688) == _540;
    float _692 = spvSubgroupShuffle(as_type<float>(_546), 10u);
    bool _694 = as_type<int>(_692) == _546;
    bool _696 = _690 && _694;
    int _698 = _696 ? 1024 : 0;
    int _700 = _686 | _698;
    float _702 = spvSubgroupShuffle(as_type<float>(_540), 11u);
    bool _704 = as_type<int>(_702) == _540;
    float _706 = spvSubgroupShuffle(as_type<float>(_546), 11u);
    bool _708 = as_type<int>(_706) == _546;
    bool _710 = _704 && _708;
    int _712 = _710 ? 2048 : 0;
    int _714 = _700 | _712;
    float _716 = spvSubgroupShuffle(as_type<float>(_540), 12u);
    bool _718 = as_type<int>(_716) == _540;
    float _720 = spvSubgroupShuffle(as_type<float>(_546), 12u);
    bool _722 = as_type<int>(_720) == _546;
    bool _724 = _718 && _722;
    int _726 = _724 ? 4096 : 0;
    int _728 = _714 | _726;
    float _730 = spvSubgroupShuffle(as_type<float>(_540), 13u);
    bool _732 = as_type<int>(_730) == _540;
    float _734 = spvSubgroupShuffle(as_type<float>(_546), 13u);
    bool _736 = as_type<int>(_734) == _546;
    bool _738 = _732 && _736;
    int _740 = _738 ? 8192 : 0;
    int _742 = _728 | _740;
    float _744 = spvSubgroupShuffle(as_type<float>(_540), 14u);
    bool _746 = as_type<int>(_744) == _540;
    float _748 = spvSubgroupShuffle(as_type<float>(_546), 14u);
    bool _750 = as_type<int>(_748) == _546;
    bool _752 = _746 && _750;
    int _754 = _752 ? 16384 : 0;
    int _756 = _742 | _754;
    float _758 = spvSubgroupShuffle(as_type<float>(_540), 15u);
    bool _760 = as_type<int>(_758) == _540;
    float _762 = spvSubgroupShuffle(as_type<float>(_546), 15u);
    bool _764 = as_type<int>(_762) == _546;
    bool _766 = _760 && _764;
    int _768 = _766 ? 32768 : 0;
    int _770 = _756 | _768;
    float _772 = spvSubgroupShuffle(as_type<float>(_540), 16u);
    bool _774 = as_type<int>(_772) == _540;
    float _776 = spvSubgroupShuffle(as_type<float>(_546), 16u);
    bool _778 = as_type<int>(_776) == _546;
    bool _780 = _774 && _778;
    int _782 = _780 ? 65536 : 0;
    int _784 = _770 | _782;
    float _786 = spvSubgroupShuffle(as_type<float>(_540), 17u);
    bool _788 = as_type<int>(_786) == _540;
    float _790 = spvSubgroupShuffle(as_type<float>(_546), 17u);
    bool _792 = as_type<int>(_790) == _546;
    bool _794 = _788 && _792;
    int _796 = _794 ? 131072 : 0;
    int _798 = _784 | _796;
    float _800 = spvSubgroupShuffle(as_type<float>(_540), 18u);
    bool _802 = as_type<int>(_800) == _540;
    float _804 = spvSubgroupShuffle(as_type<float>(_546), 18u);
    bool _806 = as_type<int>(_804) == _546;
    bool _808 = _802 && _806;
    int _810 = _808 ? 262144 : 0;
    int _812 = _798 | _810;
    float _814 = spvSubgroupShuffle(as_type<float>(_540), 19u);
    bool _816 = as_type<int>(_814) == _540;
    float _818 = spvSubgroupShuffle(as_type<float>(_546), 19u);
    bool _820 = as_type<int>(_818) == _546;
    bool _822 = _816 && _820;
    int _824 = _822 ? 524288 : 0;
    int _826 = _812 | _824;
    float _828 = spvSubgroupShuffle(as_type<float>(_540), 20u);
    bool _830 = as_type<int>(_828) == _540;
    float _832 = spvSubgroupShuffle(as_type<float>(_546), 20u);
    bool _834 = as_type<int>(_832) == _546;
    bool _836 = _830 && _834;
    int _838 = _836 ? 1048576 : 0;
    int _840 = _826 | _838;
    float _842 = spvSubgroupShuffle(as_type<float>(_540), 21u);
    bool _844 = as_type<int>(_842) == _540;
    float _846 = spvSubgroupShuffle(as_type<float>(_546), 21u);
    bool _848 = as_type<int>(_846) == _546;
    bool _850 = _844 && _848;
    int _852 = _850 ? 2097152 : 0;
    int _854 = _840 | _852;
    float _856 = spvSubgroupShuffle(as_type<float>(_540), 22u);
    bool _858 = as_type<int>(_856) == _540;
    float _860 = spvSubgroupShuffle(as_type<float>(_546), 22u);
    bool _862 = as_type<int>(_860) == _546;
    bool _864 = _858 && _862;
    int _866 = _864 ? 4194304 : 0;
    int _868 = _854 | _866;
    float _870 = spvSubgroupShuffle(as_type<float>(_540), 23u);
    bool _872 = as_type<int>(_870) == _540;
    float _874 = spvSubgroupShuffle(as_type<float>(_546), 23u);
    bool _876 = as_type<int>(_874) == _546;
    bool _878 = _872 && _876;
    int _880 = _878 ? 8388608 : 0;
    int _882 = _868 | _880;
    float _884 = spvSubgroupShuffle(as_type<float>(_540), 24u);
    bool _886 = as_type<int>(_884) == _540;
    float _888 = spvSubgroupShuffle(as_type<float>(_546), 24u);
    bool _890 = as_type<int>(_888) == _546;
    bool _892 = _886 && _890;
    int _894 = _892 ? 16777216 : 0;
    int _896 = _882 | _894;
    float _898 = spvSubgroupShuffle(as_type<float>(_540), 25u);
    bool _900 = as_type<int>(_898) == _540;
    float _902 = spvSubgroupShuffle(as_type<float>(_546), 25u);
    bool _904 = as_type<int>(_902) == _546;
    bool _906 = _900 && _904;
    int _908 = _906 ? 33554432 : 0;
    int _910 = _896 | _908;
    float _912 = spvSubgroupShuffle(as_type<float>(_540), 26u);
    bool _914 = as_type<int>(_912) == _540;
    float _916 = spvSubgroupShuffle(as_type<float>(_546), 26u);
    bool _918 = as_type<int>(_916) == _546;
    bool _920 = _914 && _918;
    int _922 = _920 ? 67108864 : 0;
    int _924 = _910 | _922;
    float _926 = spvSubgroupShuffle(as_type<float>(_540), 27u);
    bool _928 = as_type<int>(_926) == _540;
    float _930 = spvSubgroupShuffle(as_type<float>(_546), 27u);
    bool _932 = as_type<int>(_930) == _546;
    bool _934 = _928 && _932;
    int _936 = _934 ? 134217728 : 0;
    int _938 = _924 | _936;
    float _940 = spvSubgroupShuffle(as_type<float>(_540), 28u);
    bool _942 = as_type<int>(_940) == _540;
    float _944 = spvSubgroupShuffle(as_type<float>(_546), 28u);
    bool _946 = as_type<int>(_944) == _546;
    bool _948 = _942 && _946;
    int _950 = _948 ? 268435456 : 0;
    int _952 = _938 | _950;
    float _954 = spvSubgroupShuffle(as_type<float>(_540), 29u);
    bool _956 = as_type<int>(_954) == _540;
    float _958 = spvSubgroupShuffle(as_type<float>(_546), 29u);
    bool _960 = as_type<int>(_958) == _546;
    bool _962 = _956 && _960;
    int _964 = _962 ? 536870912 : 0;
    int _966 = _952 | _964;
    float _968 = spvSubgroupShuffle(as_type<float>(_540), 30u);
    bool _970 = as_type<int>(_968) == _540;
    float _972 = spvSubgroupShuffle(as_type<float>(_546), 30u);
    bool _974 = as_type<int>(_972) == _546;
    bool _976 = _970 && _974;
    int _978 = _976 ? 1073741824 : 0;
    int _980 = _966 | _978;
    float _982 = spvSubgroupShuffle(as_type<float>(_540), 31u);
    bool _984 = as_type<int>(_982) == _540;
    float _986 = spvSubgroupShuffle(as_type<float>(_546), 31u);
    bool _988 = as_type<int>(_986) == _546;
    bool _990 = _984 && _988;
    int _992 = _990 ? int(0x80000000) : 0;
    int _994 = _980 | _992;
    int _996 = _994 & int(_548);
    bool _998 = _996 == int(_548);
    if (!_998)
    {
        uint _1000 = uint(int(uint(_538) >> uint(2)));
        uint _2619 = atomic_fetch_add_explicit((device atomic_uint*)&(*spvDescriptorSet0.cp_s0)._m0[int(_1000)], 1u, memory_order_relaxed);
        uint _1002 = _2619;
    }
    if (!_998)
    {
        return;
    }
    float _1004 = as_type<float>(gl_SubgroupInvocationID);
    uint _1006 = spvSubgroupBallot(true).x;
    int _1008 = int(spvFindUMSB(_1006));
    int _1010 = popcount(int(_1006));
    bool _1012 = as_type<int>(_1004) == _1008;
    if (_1012)
    {
        uint _1014 = uint(int(uint(_538) >> uint(2)));
        uint _2649 = atomic_fetch_add_explicit((device atomic_uint*)&(*spvDescriptorSet0.cp_s0)._m0[int(_1014)], uint(_1010), memory_order_relaxed);
        uint _1016 = _2649;
    }
}

