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

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* fp_c15 [[id(1)]];
    constant _16* fp_c10 [[id(2)]];
    constant _16* fp_c9 [[id(3)]];
    constant _16* fp_c8 [[id(4)]];
    constant _16* fp_c13 [[id(5)]];
    texture2d<float> fp_t_tcb_A [[id(6)]];
    sampler fp_t_tcb_ASmplr [[id(7)]];
    texture2d<float> fp_t_tcb_C [[id(8)]];
    sampler fp_t_tcb_CSmplr [[id(9)]];
    texture2d<float> fp_t_tcb_8 [[id(10)]];
    sampler fp_t_tcb_8Smplr [[id(11)]];
    texture2d<float> fp_t_tcb_E [[id(12)]];
    sampler fp_t_tcb_ESmplr [[id(13)]];
    texturecube_array<float> fp_t_tcb_2E [[id(14)]];
    sampler fp_t_tcb_2ESmplr [[id(15)]];
    texturecube<float> fp_t_tcb_1E [[id(16)]];
    sampler fp_t_tcb_1ESmplr [[id(17)]];
    sampler fp_t_tcb_ASmplr_w [[id(18)]];
    sampler fp_t_tcb_CSmplr_w [[id(19)]];
    sampler fp_t_tcb_8Smplr_w [[id(20)]];
    sampler fp_t_tcb_ESmplr_w [[id(21)]];
    sampler fp_t_tcb_2ESmplr_w [[id(22)]];
    sampler fp_t_tcb_1ESmplr_w [[id(23)]];
    constant dm_border_t* dm_border [[id(24)]];
};

struct main0_out
{
    float4 m_72 [[color(0)]];
};

struct main0_in
{
    float4 m_76 [[user(locn0)]];
    float4 m_55 [[user(locn1)]];
    float4 m_67 [[user(locn2)]];
    float4 m_78 [[user(locn3)]];
    float4 m_74 [[user(locn4), flat]];
    float4 m_53 [[user(locn5)]];
    float4 m_57 [[user(locn6)]];
    float4 m_65 [[user(locn7)]];
    float4 m_61 [[user(locn8)]];
    float4 m_59 [[user(locn9)]];
    float4 m_63 [[user(locn10)]];
    float4 m_80 [[user(locn11)]];
    float4 m_69 [[user(locn12)]];
    float4 m_82 [[user(locn13)]];
};

static inline __attribute__((always_inline))
int _91(thread const int& _5274, thread const int& _5275, thread const int& _5276, thread int& _5277, thread uint& gl_SubgroupInvocationID)
{
    int _5280 = _5276 & 31;
    uint _5282 = uint(int(uint(_5276) >> uint(8)));
    int _5284 = int(_5282) & 31;
    float _5286 = as_type<float>(gl_SubgroupInvocationID);
    int _5288 = as_type<int>(_5286) & _5284;
    int _5290 = ~_5284;
    int _5292 = _5280 & _5290;
    int _5294 = _5292 | _5288;
    int _5296 = ~_5284;
    int _5298 = _5275 & _5296;
    int _5300 = _5298 | _5288;
    bool _5302 = uint(_5300) <= uint(_5294);
    _5277 = _5302 ? (-1) : 0;
    float _5304 = spvSubgroupShuffle(as_type<float>(_5274), uint(_5300));
    uint _5306 = uint(_5302 ? as_type<int>(_5304) : _5274);
    return int(_5306);
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    main0_out out = {};
    float _95 = gl_FragCoord.w;
    float _97 = in.m_53.z;
    float _99 = gl_FragCoord.w;
    float _101 = _97 * _99;
    float _103 = in.m_53.w;
    float _105 = gl_FragCoord.w;
    float _107 = _103 * _105;
    float _109 = 1.0 / _95;
    float _111 = _109 * _101;
    float _113 = _109 * _107;
    float2 _2174 = float2(_111, _113);
    float2 _117 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2174, float2(0.0), isnan(_2174))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2174, float2(0.0), isnan(_2174))).xy;
    float _119 = _117.x;
    float _121 = _117.y;
    float _123 = in.m_55.w;
    float _125 = gl_FragCoord.w;
    float _127 = _123 * _125;
    float _129 = in.m_53.y;
    float _131 = gl_FragCoord.w;
    float _133 = _129 * _131;
    float _135 = in.m_53.x;
    float _137 = gl_FragCoord.w;
    float _139 = _135 * _137;
    float _141 = in.m_55.x;
    float _143 = gl_FragCoord.w;
    float _145 = _141 * _143;
    float _147 = in.m_55.y;
    float _149 = gl_FragCoord.w;
    float _151 = _147 * _149;
    float _153 = in.m_57.x;
    float _155 = gl_FragCoord.w;
    float _157 = _153 * _155;
    float _159 = in.m_57.y;
    float _161 = gl_FragCoord.w;
    float _163 = _159 * _161;
    float _165 = _109 * _127;
    float _167 = _109 * _133;
    float _169 = _109 * _139;
    float _171 = _109 * _157;
    float _173 = 1.0 / _165;
    float _175 = _109 * _163;
    float2 _2257 = float2(_171, _175);
    float _177 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_2257, float2(0.0), isnan(_2257))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_2257, float2(0.0), isnan(_2257))).w;
    float _179 = _119 * 0.5;
    float _181 = _121 * 0.5;
    float _183 = _121 * 0.25;
    float _185 = _169 + _179;
    float _187 = _167 + _181;
    float _189 = _109 * _145;
    float _191 = _109 * _151;
    float _193 = _119 * 0.25;
    float _195 = fma(_191, _173, _183);
    float _197 = fma(_189, _173, _193);
    float2 _2296 = float2(_185, _187);
    float _199 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2296, float2(0.0), isnan(_2296))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2296, float2(0.0), isnan(_2296))).w;
    float2 _2304 = float2(_197, _195);
    float3 _203 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_2304, float2(0.0), isnan(_2304))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_2304, float2(0.0), isnan(_2304))).xyz;
    float _205 = _203.x;
    float _207 = _203.y;
    float _209 = _203.z;
    float _211 = in.m_59.y;
    float _213 = gl_FragCoord.w;
    float _215 = _211 * _213;
    float _217 = in.m_59.x;
    float _219 = gl_FragCoord.w;
    float _221 = _217 * _219;
    float _223 = in.m_59.z;
    float _225 = gl_FragCoord.w;
    float _227 = _223 * _225;
    float _229 = _109 * _215;
    float _231 = _109 * _221;
    float _233 = _109 * _227;
    float _235 = -(*spvDescriptorSet0.fp_c10)._m0[9].w;
    float _237 = _229 + _235;
    float _239 = -(*spvDescriptorSet0.fp_c10)._m0[8].w;
    float _241 = _231 + _239;
    float _243 = _237 * (*spvDescriptorSet0.fp_c10)._m0[9].z;
    float _245 = _237 * (*spvDescriptorSet0.fp_c10)._m0[9].x;
    float _247 = -(*spvDescriptorSet0.fp_c10)._m0[10].w;
    float _249 = _233 + _247;
    float _251 = fma(_241, (*spvDescriptorSet0.fp_c10)._m0[8].z, _243);
    float _253 = fma(_241, (*spvDescriptorSet0.fp_c10)._m0[8].x, _245);
    float _255 = fma(_249, (*spvDescriptorSet0.fp_c10)._m0[10].z, _251);
    float _257 = fma(_249, (*spvDescriptorSet0.fp_c10)._m0[10].x, _253);
    float _259 = -_229;
    float _261 = _259 + (*spvDescriptorSet0.fp_c10)._m0[9].w;
    float _263 = abs(_255);
    float _265 = abs(_257);
    float _267 = precise::max(_263, _265);
    float _269 = _261 * _261;
    bool _273 = _267 >= 16.0;
    float _275 = -_231;
    float _277 = _275 + (*spvDescriptorSet0.fp_c10)._m0[8].w;
    float _279 = fma(_277, _277, _269);
    float _281 = -_233;
    float _283 = _281 + (*spvDescriptorSet0.fp_c10)._m0[10].w;
    float _285 = fma(_283, _283, _279);
    float _287 = _255;
    float _289 = _257;
    int _291 = as_type<int>(_245);
    float _293 = _279;
    if (_273)
    {
        float _295 = _255 * 0.0625;
        _287 = _295;
    }
    float _297 = _287;
    if (_273)
    {
        float _299 = _257 * 0.0625;
        _289 = _299;
    }
    float _301 = _289;
    float _303 = sqrt(_285);
    float _305 = abs(_297);
    bool _307 = _305 != 0.0;
    bool _309 = isnan(_305);
    bool _311 = _307 || _309;
    bool _313 = isnan(0.0);
    bool _315 = _311 || _313;
    float _317 = abs(_301);
    bool _319 = _317 == 0.0;
    float _321 = abs(_301);
    bool _323 = _321 == 0.0;
    bool _325 = !_315;
    bool _327 = _323 && _325;
    bool _329 = false;
    if (_327)
    {
        bool _331 = as_type<int>(_301) >= 0;
        _329 = _331;
    }
    bool _333 = _329;
    int _335 = _333 ? (-1) : 0;
    if (_327)
    {
        int _337 = _333 ? 0 : 1078530011;
        _291 = _337;
    }
    int _339 = _291;
    int _341 = _339;
    if (_327)
    {
        int _343 = int(0x80000000) & as_type<int>(_297);
        int _345 = _339 | _343;
        _293 = as_type<float>(_345);
    }
    float _347 = _293;
    bool _349 = !_315;
    bool _351 = _349 && _319;
    float _353 = _347;
    float _355 = _347;
    if (!_351)
    {
        float _357 = abs(_297);
        bool _359 = _357 != as_type<float>(0x7f800000u /* inf */);
        bool _361 = isnan(_357);
        bool _363 = _359 || _361;
        bool _365 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _367 = _363 || _365;
        float _369 = abs(_301);
        bool _371 = _369 == as_type<float>(0x7f800000u /* inf */);
        float _373 = abs(_301);
        bool _375 = _373 == as_type<float>(0x7f800000u /* inf */);
        bool _377 = !_367;
        bool _379 = _375 && _377;
        if (_379)
        {
            bool _381 = as_type<int>(_301) >= 0;
            _335 = _381 ? (-1) : 0;
        }
        int _383 = _335;
        if (_379)
        {
            _341 = 1075235812;
        }
        int _385 = _341;
        int _387 = _385;
        if (_379)
        {
            int _389 = ~_383;
            int _391 = (_389 != 0) ? _385 : 1061752795;
            _387 = _391;
        }
        int _393 = _387;
        if (_379)
        {
            int _395 = int(0x80000000) & as_type<int>(_297);
            int _397 = _393 | _395;
            _353 = as_type<float>(_397);
        }
        float _399 = _353;
        bool _401 = !_367;
        bool _403 = _401 && _371;
        _355 = _399;
        if (!_403)
        {
            float _405 = abs(_297);
            float _407 = abs(_301);
            float _409 = precise::max(_405, _407);
            float _411 = abs(_297);
            float _413 = abs(_301);
            float _415 = precise::min(_411, _413);
            float _417 = 1.0 / _409;
            float _419 = abs(_297);
            float _421 = abs(_301);
            bool _423 = _419 > _421;
            bool _425 = as_type<int>(_301) >= 0;
            float _427 = _415 * _417;
            float _429 = abs(_297);
            float _431 = abs(_301);
            float _433 = _429 + _431;
            int _435 = as_type<int>(_297) & int(0x80000000);
            float _437 = _427 * _427;
            bool _439 = _433 > as_type<float>(0x7f800000u /* inf */);
            bool _441 = isnan(_433);
            bool _443 = _439 || _441;
            bool _445 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _447 = _443 || _445;
            float _449 = _437 + 11.33538818359375;
            float _451 = fma(_437, _449, 28.84246826171875);
            float _453 = fma(_437, _451, 19.6966705322265625);
            float _455 = fma(_437, -0.82336294651031494140625, -5.674867153167724609375);
            float _457 = fma(_437, _455, -6.565555095672607421875);
            float _459 = 1.0 / _453;
            float _461 = _437 * _457;
            float _463 = _427 * _461;
            float _465 = fma(_463, _459, _427);
            float _467 = _465;
            _355 = _433;
            if (_423)
            {
                float _469 = -_465;
                float _471 = _469 + 1.57079637050628662109375;
                _467 = _471;
            }
            float _473 = _467;
            int _475 = as_type<int>(_473);
            if (!_425)
            {
                float _477 = -_473;
                float _479 = _477 + 3.1415927410125732421875;
                _475 = as_type<int>(_479);
            }
            int _481 = _475;
            if (!_447)
            {
                int _483 = _435 | _481;
                _355 = as_type<float>(_483);
            }
        }
    }
    float _485 = _355;
    float _487 = _199 * 0.300000011920928955078125;
    float _489 = in.m_61.y;
    float _491 = gl_FragCoord.w;
    float _493 = _489 * _491;
    float _495 = in.m_61.x;
    float _497 = gl_FragCoord.w;
    float _499 = _495 * _497;
    float _501 = fma(_485, 0.636619746685028076171875, _487);
    float _503 = fma(_177, 0.20000000298023223876953125, -0.100000001490116119384765625);
    float _505 = in.m_61.z;
    float _507 = gl_FragCoord.w;
    float _509 = _505 * _507;
    float _511 = _501 + 1.85000002384185791015625;
    float _513 = fma(_303, 0.039999999105930328369140625, _511);
    float _515 = fma(_503, 0.25, _513);
    float _517 = fma((*spvDescriptorSet0.fp_c10)._m0[2].x, -0.00999999977648258209228515625, _515);
    float _519 = (*spvDescriptorSet0.fp_c10)._m0[2].x * 0.100000001490116119384765625;
    float _521 = floor(_517);
    float _523 = _109 * _499;
    float _525 = _109 * _509;
    float _527 = -_521;
    float _529 = _517 + _527;
    float _531 = -(*spvDescriptorSet0.fp_c9)._m0[123].w;
    float _533 = (*spvDescriptorSet0.fp_c9)._m0[124].w + _531;
    float _535 = in.m_63.z;
    float _537 = gl_FragCoord.w;
    float _539 = _535 * _537;
    float _541 = _529 + 0.5;
    int _543 = as_type<int>(_529);
    int _545 = 0;
    int _547 = 7171;
    int _549;
    int _2808 = _91(_543, _545, _547, _549, gl_SubgroupInvocationID);
    int _551 = _2808;
    float _553 = 1.0 / _533;
    float _555 = floor(_541);
    uint _2826 = (235u >> ((gl_SubgroupInvocationID & 3u) << 1u)) & 3u;
    float _557 = (as_type<float>(_551) * float4(1.0, -1.0, 1.0, 0.0)[_2826]) + (_529 * float4(1.0, 1.0, -1.0, 1.0)[_2826]);
    float _559 = -_555;
    float _561 = _541 + _559;
    float _563 = _109 * _493;
    int _565 = as_type<int>(_557);
    int _567 = 1;
    int _569 = 7171;
    int _571;
    int _2842 = _91(_565, _567, _569, _571, gl_SubgroupInvocationID);
    int _573 = _2842;
    float _575 = _109 * _539;
    float _577 = _563 * _563;
    int _579 = as_type<int>(_561);
    int _581 = 0;
    int _583 = 7171;
    int _585;
    int _2851 = _91(_579, _581, _583, _585, gl_SubgroupInvocationID);
    int _587 = _2851;
    int _589 = as_type<int>(_557);
    int _591 = 2;
    int _593 = 7171;
    int _595;
    int _2854 = _91(_589, _591, _593, _595, gl_SubgroupInvocationID);
    int _597 = _2854;
    float _599 = -(*spvDescriptorSet0.fp_c9)._m0[124].w;
    float _601 = _599 + (*spvDescriptorSet0.fp_c9)._m0[125].w;
    float _603 = -(*spvDescriptorSet0.fp_c9)._m0[123].z;
    float _605 = (*spvDescriptorSet0.fp_c9)._m0[124].z + _603;
    float _607 = -(*spvDescriptorSet0.fp_c9)._m0[124].z;
    float _609 = _607 + (*spvDescriptorSet0.fp_c9)._m0[125].z;
    float _611 = 1.0 / _601;
    uint _2886 = (235u >> ((gl_SubgroupInvocationID & 3u) << 1u)) & 3u;
    float _613 = (as_type<float>(_587) * float4(1.0, -1.0, 1.0, 0.0)[_2886]) + (_561 * float4(1.0, 1.0, -1.0, 1.0)[_2886]);
    float _615 = fma(_523, _523, _577);
    int _617 = as_type<int>(_613);
    int _619 = 1;
    int _621 = 7171;
    int _623;
    int _2898 = _91(_617, _619, _621, _623, gl_SubgroupInvocationID);
    int _625 = _2898;
    float _627 = fma(_525, _525, _615);
    float _629 = abs(as_type<float>(_573));
    float _631 = abs(as_type<float>(_597));
    float _633 = _629 + _631;
    int _635 = as_type<int>(_613);
    int _637 = 2;
    int _639 = 7171;
    int _641;
    int _2914 = _91(_635, _637, _639, _641, gl_SubgroupInvocationID);
    int _643 = _2914;
    float _645 = in.m_63.x;
    float _647 = gl_FragCoord.w;
    float _649 = _645 * _647;
    float _651 = _633 + (-9.9999997473787516355514526367188e-05);
    float _653 = rsqrt(_627);
    float _655 = _563 * _653;
    float _657 = _525 * _653;
    float _659 = abs(as_type<float>(_625));
    float _661 = abs(as_type<float>(_643));
    float _663 = _659 + _661;
    float _665 = in.m_63.y;
    float _667 = gl_FragCoord.w;
    float _669 = _665 * _667;
    bool _671 = _651 >= _663;
    bool _673 = isnan(_651);
    bool _675 = _671 || _673;
    bool _677 = isnan(_663);
    bool _679 = _675 || _677;
    bool _681 = !_679;
    float _683 = _681 ? _529 : 0.0;
    float _685 = _523 * _653;
    float _687 = -(*spvDescriptorSet0.fp_c9)._m0[123].y;
    float _689 = (*spvDescriptorSet0.fp_c9)._m0[124].y + _687;
    float _691 = -(*spvDescriptorSet0.fp_c9)._m0[124].y;
    float _693 = _691 + (*spvDescriptorSet0.fp_c9)._m0[125].y;
    float _695 = 0.0 + _683;
    float _697 = precise::clamp(_695, 0.0, 1.0);
    float _699 = -(*spvDescriptorSet0.fp_c9)._m0[123].w;
    float _701 = _697 + _699;
    bool _703 = _697 >= (*spvDescriptorSet0.fp_c9)._m0[124].w;
    bool _705 = isnan(_697);
    bool _707 = _703 || _705;
    bool _709 = isnan((*spvDescriptorSet0.fp_c9)._m0[124].w);
    bool _711 = _707 || _709;
    float _713 = float(_711);
    float _715 = -(*spvDescriptorSet0.fp_c9)._m0[124].w;
    float _717 = _697 + _715;
    bool _719 = _697 >= (*spvDescriptorSet0.fp_c9)._m0[123].w;
    bool _721 = isnan(_697);
    bool _723 = _719 || _721;
    bool _725 = isnan((*spvDescriptorSet0.fp_c9)._m0[123].w);
    bool _727 = _723 || _725;
    float _729 = float(_727);
    float _731 = _701 * _553;
    float _733 = -(*spvDescriptorSet0.fp_c9)._m0[123].x;
    float _735 = (*spvDescriptorSet0.fp_c9)._m0[124].x + _733;
    float _737 = -_713;
    float _739 = _737 + 1.0;
    float _741 = _717 * _611;
    float _743 = -(*spvDescriptorSet0.fp_c9)._m0[124].x;
    float _745 = _743 + (*spvDescriptorSet0.fp_c9)._m0[125].x;
    float _747 = fma(_689, _731, (*spvDescriptorSet0.fp_c9)._m0[123].y);
    float _749 = _729 * _739;
    float _751 = fma(_735, _731, (*spvDescriptorSet0.fp_c9)._m0[123].x);
    float _753 = fma(_605, _731, (*spvDescriptorSet0.fp_c9)._m0[123].z);
    float _755 = fma(_745, _741, (*spvDescriptorSet0.fp_c9)._m0[124].x);
    float _757 = fma(_693, _741, (*spvDescriptorSet0.fp_c9)._m0[124].y);
    float _759 = fma(_609, _741, (*spvDescriptorSet0.fp_c9)._m0[124].z);
    float _761 = -(*spvDescriptorSet0.fp_c9)._m0[125].w;
    float _763 = (*spvDescriptorSet0.fp_c9)._m0[126].w + _761;
    float _765 = -_729;
    float _767 = _765 + 1.0;
    float _769 = _747 * _749;
    float _771 = _751 * _749;
    float _773 = _753 * _749;
    bool _775 = _697 >= (*spvDescriptorSet0.fp_c9)._m0[125].w;
    bool _777 = isnan(_697);
    bool _779 = _775 || _777;
    bool _781 = isnan((*spvDescriptorSet0.fp_c9)._m0[125].w);
    bool _783 = _779 || _781;
    float _785 = float(_783);
    float _787 = fma(_767, (*spvDescriptorSet0.fp_c9)._m0[123].y, _769);
    float _789 = fma(_767, (*spvDescriptorSet0.fp_c9)._m0[123].x, _771);
    float _791 = fma(_767, (*spvDescriptorSet0.fp_c9)._m0[123].z, _773);
    float _793 = 1.0 / _763;
    float _795 = _109 * _669;
    float _797 = _109 * _649;
    float _799 = -_785;
    float _801 = _799 + 1.0;
    float _803 = -(*spvDescriptorSet0.fp_c9)._m0[126].w;
    float _805 = _803 + (*spvDescriptorSet0.fp_c9)._m0[127].w;
    float _807 = _795 * _795;
    float _809 = _713 * _801;
    float _811 = -(*spvDescriptorSet0.fp_c9)._m0[125].w;
    float _813 = _697 + _811;
    float _815 = fma(_797, _797, _807);
    float _817 = 1.0 / _805;
    float _819 = fma(_757, _809, _787);
    float _821 = fma(_575, _575, _815);
    float _823 = fma(_755, _809, _789);
    bool _825 = _697 >= (*spvDescriptorSet0.fp_c9)._m0[126].w;
    bool _827 = isnan(_697);
    bool _829 = _825 || _827;
    bool _831 = isnan((*spvDescriptorSet0.fp_c9)._m0[126].w);
    bool _833 = _829 || _831;
    float _835 = float(_833);
    float _837 = _813 * _793;
    float _839 = fma(_759, _809, _791);
    float _841 = -(*spvDescriptorSet0.fp_c9)._m0[125].z;
    float _843 = (*spvDescriptorSet0.fp_c9)._m0[126].z + _841;
    float _845 = -_835;
    float _847 = _845 + 1.0;
    float _849 = rsqrt(_821);
    float _851 = -(*spvDescriptorSet0.fp_c9)._m0[125].y;
    float _853 = (*spvDescriptorSet0.fp_c9)._m0[126].y + _851;
    float _855 = fma(_843, _837, (*spvDescriptorSet0.fp_c9)._m0[125].z);
    float _857 = _785 * _847;
    float _859 = -(*spvDescriptorSet0.fp_c9)._m0[125].x;
    float _861 = (*spvDescriptorSet0.fp_c9)._m0[126].x + _859;
    float _863 = fma(_853, _837, (*spvDescriptorSet0.fp_c9)._m0[125].y);
    float _865 = -(*spvDescriptorSet0.fp_c9)._m0[126].x;
    float _867 = _865 + (*spvDescriptorSet0.fp_c9)._m0[127].x;
    float _869 = -(*spvDescriptorSet0.fp_c9)._m0[126].z;
    float _871 = _869 + (*spvDescriptorSet0.fp_c9)._m0[127].z;
    float _873 = fma(_861, _837, (*spvDescriptorSet0.fp_c9)._m0[125].x);
    float _875 = fma(_863, _857, _819);
    float _877 = fma(_855, _857, _839);
    bool _879 = _697 >= (*spvDescriptorSet0.fp_c9)._m0[127].w;
    bool _881 = isnan(_697);
    bool _883 = _879 || _881;
    bool _885 = isnan((*spvDescriptorSet0.fp_c9)._m0[127].w);
    bool _887 = _883 || _885;
    float _889 = float(_887);
    float _891 = fma(_873, _857, _823);
    float _893 = -(*spvDescriptorSet0.fp_c9)._m0[126].w;
    float _895 = _697 + _893;
    float _897 = -_889;
    float _899 = _897 + 1.0;
    float _901 = _895 * _817;
    float _903 = _797 * _849;
    float _905 = _795 * _849;
    float _907 = _835 * _899;
    float _909 = fma(_867, _901, (*spvDescriptorSet0.fp_c9)._m0[126].x);
    float _911 = _575 * _849;
    float _913 = -(*spvDescriptorSet0.fp_c9)._m0[126].y;
    float _915 = _913 + (*spvDescriptorSet0.fp_c9)._m0[127].y;
    float _917 = -(*spvDescriptorSet0.fp_c9)._m0[127].w;
    float _919 = (*spvDescriptorSet0.fp_c9)._m0[128].w + _917;
    float _921 = fma(_871, _901, (*spvDescriptorSet0.fp_c9)._m0[126].z);
    float _923 = fma(_909, _907, _891);
    float _925 = fma(_915, _901, (*spvDescriptorSet0.fp_c9)._m0[126].y);
    float _927 = in.m_65.y;
    float _929 = gl_FragCoord.w;
    float _931 = _927 * _929;
    float _933 = fma(_921, _907, _877);
    float _935 = 1.0 / _919;
    float _937 = in.m_65.x;
    float _939 = gl_FragCoord.w;
    float _941 = _937 * _939;
    float _943 = in.m_65.z;
    float _945 = gl_FragCoord.w;
    float _947 = _943 * _945;
    float _949 = -(*spvDescriptorSet0.fp_c9)._m0[127].w;
    float _951 = _697 + _949;
    float _953 = fma(_925, _907, _875);
    bool _955 = _697 >= (*spvDescriptorSet0.fp_c9)._m0[128].w;
    bool _957 = isnan(_697);
    bool _959 = _955 || _957;
    bool _961 = isnan((*spvDescriptorSet0.fp_c9)._m0[128].w);
    bool _963 = _959 || _961;
    float _965 = float(_963);
    float _967 = -(*spvDescriptorSet0.fp_c9)._m0[128].w;
    float _969 = _967 + (*spvDescriptorSet0.fp_c9)._m0[129].w;
    float _971 = -_965;
    float _973 = _971 + 1.0;
    float _975 = _889 * _973;
    float _977 = _951 * _935;
    float _979 = -(*spvDescriptorSet0.fp_c9)._m0[127].x;
    float _981 = (*spvDescriptorSet0.fp_c9)._m0[128].x + _979;
    float _983 = -(*spvDescriptorSet0.fp_c9)._m0[127].z;
    float _985 = (*spvDescriptorSet0.fp_c9)._m0[128].z + _983;
    float _987 = -(*spvDescriptorSet0.fp_c9)._m0[127].y;
    float _989 = (*spvDescriptorSet0.fp_c9)._m0[128].y + _987;
    float _991 = fma(_981, _977, (*spvDescriptorSet0.fp_c9)._m0[127].x);
    float _993 = fma(_985, _977, (*spvDescriptorSet0.fp_c9)._m0[127].z);
    float _995 = fma(_989, _977, (*spvDescriptorSet0.fp_c9)._m0[127].y);
    float _997 = fma(_991, _975, _923);
    float _999 = 1.0 / _969;
    float _1001 = fma(_993, _975, _933);
    float _1003 = _109 * _931;
    float _1005 = fma(_995, _975, _953);
    float _1007 = -(*spvDescriptorSet0.fp_c9)._m0[128].w;
    float _1009 = _697 + _1007;
    float _1011 = _109 * _941;
    float _1013 = _1003 * _1003;
    float _1015 = _109 * _947;
    float _1017 = _655 * _655;
    float _1019 = _519 * 0.15915493667125701904296875;
    float _1021 = fma(_1011, _1011, _1013);
    float _1023 = fma(_1015, _1015, _1021);
    float _1025 = _1009 * _999;
    float _1027 = -(*spvDescriptorSet0.fp_c9)._m0[128].x;
    float _1029 = _1027 + (*spvDescriptorSet0.fp_c9)._m0[129].x;
    float _1031 = -(*spvDescriptorSet0.fp_c9)._m0[128].y;
    float _1033 = _1031 + (*spvDescriptorSet0.fp_c9)._m0[129].y;
    float _1035 = rsqrt(_1023);
    float _1037 = fma(_1029, _1025, (*spvDescriptorSet0.fp_c9)._m0[128].x);
    float _1039 = fma(_1033, _1025, (*spvDescriptorSet0.fp_c9)._m0[128].y);
    float _1041 = _1011 * _1035;
    float _1043 = _1003 * _1035;
    float _1045 = _1015 * _1035;
    float _1047 = -(*spvDescriptorSet0.fp_c9)._m0[128].z;
    float _1049 = _1047 + (*spvDescriptorSet0.fp_c9)._m0[129].z;
    bool _1051 = _697 >= (*spvDescriptorSet0.fp_c9)._m0[129].w;
    bool _1053 = isnan(_697);
    bool _1055 = _1051 || _1053;
    bool _1057 = isnan((*spvDescriptorSet0.fp_c9)._m0[129].w);
    bool _1059 = _1055 || _1057;
    float _1061 = float(_1059);
    float _1063 = fma(_685, _685, _1017);
    float _1065 = fma(_1049, _1025, (*spvDescriptorSet0.fp_c9)._m0[128].z);
    float _1067 = _183 * _183;
    float _1069 = -_1061;
    float _1071 = _1069 + 1.0;
    float _1073 = fma(_657, _657, _1063);
    float _1075 = fma(_193, _193, _1067);
    float _1077 = precise::clamp(_1075, 0.0, 1.0);
    float _1079 = _965 * _1071;
    float _1081 = rsqrt(_1073);
    float _1083 = fma(_1037, _1079, _997);
    float _1085 = _121 * 0.5;
    float _1087 = -_1077;
    float _1089 = _1087 + 1.0;
    float _1091 = fma(_1065, _1079, _1001);
    float _1093 = _119 * 0.5;
    float _1095 = _1085 * _1085;
    float _1097 = fma(_1039, _1079, _1005);
    float _1099 = sqrt(_1089);
    float _1101 = _183 * _1043;
    float _1103 = fma(_1093, _1093, _1095);
    float _1105 = precise::clamp(_1103, 0.0, 1.0);
    float _1107 = _183 * _1041;
    float _1109 = _183 * _1045;
    float _1111 = fma(_193, _905, _1101);
    float _1113 = -_1105;
    float _1115 = _1113 + 1.0;
    float _1117 = fma(_193, _903, _1107);
    float _1119 = fma(_193, _911, _1109);
    float _1121 = _685 * _1081;
    float _1123 = sqrt(_1115);
    float _1125 = _655 * _1081;
    float _1127 = _657 * _1081;
    float _1129 = fma(_1061, (*spvDescriptorSet0.fp_c9)._m0[129].x, _1083);
    float _1131 = fma(_1121, _1099, _1117);
    float _1133 = fma(_1125, _1099, _1111);
    float _1135 = fma(_1127, _1099, _1119);
    float _1137 = _1085 * _1041;
    float _1139 = _1085 * _1045;
    float _1141 = -_1129;
    float _1143 = _1141 + _205;
    float _1145 = fma(_1093, _903, _1137);
    float _1147 = fma(_1093, _911, _1139);
    float _1149 = fma(_1121, _1123, _1145);
    float _1151 = _1085 * _1043;
    float _1153 = fma(_1127, _1123, _1147);
    float _1155 = fma(_1061, (*spvDescriptorSet0.fp_c9)._m0[129].z, _1091);
    float _1157 = fma(_1093, _905, _1151);
    float _1159 = -_1155;
    float _1161 = _1159 + _209;
    float _1163 = fma(_1125, _1123, _1157);
    float _1165 = fma(_1061, (*spvDescriptorSet0.fp_c9)._m0[129].y, _1097);
    float _1167 = (*spvDescriptorSet0.fp_c10)._m0[9].y * (*spvDescriptorSet0.fp_c10)._m0[9].y;
    float _1169 = fma(_1143, 0.300000011920928955078125, _1129);
    float _1171 = -_1165;
    float _1173 = _1171 + _207;
    float _1175 = fma((*spvDescriptorSet0.fp_c10)._m0[8].y, (*spvDescriptorSet0.fp_c10)._m0[8].y, _1167);
    float _1177 = fma(_1173, 0.300000011920928955078125, _1165);
    float _1179 = fma(_1161, 0.300000011920928955078125, _1155);
    float _1181 = fma((*spvDescriptorSet0.fp_c10)._m0[10].y, (*spvDescriptorSet0.fp_c10)._m0[10].y, _1175);
    float _1183 = _1019 * 6.283185482025146484375;
    float _1185 = cos(_1183);
    float _1187 = rsqrt(_1181);
    float _1189 = _1019 * 6.283185482025146484375;
    float _1191 = sin(_1189);
    float _1193 = -_1185;
    float _1195 = _1193 + 1.0;
    float _1197 = _1187 * (*spvDescriptorSet0.fp_c10)._m0[10].y;
    float _1199 = _1187 * (*spvDescriptorSet0.fp_c10)._m0[8].y;
    float _1201 = _1187 * (*spvDescriptorSet0.fp_c10)._m0[9].y;
    float _1203 = _1199 * _1195;
    float _1205 = _1197 * _1191;
    float _1207 = -_1205;
    float _1209 = fma(_1201, _1203, _1207);
    float _1211 = _1209 * (*spvDescriptorSet0.fp_c10)._m0[9].x;
    float _1213 = fma(_1199, _1203, _1185);
    float _1215 = _1199 * _1191;
    float _1217 = fma(_1213, (*spvDescriptorSet0.fp_c10)._m0[8].x, _1211);
    float _1219 = _1201 * _1191;
    float _1221 = fma(_1201, _1203, _1205);
    float _1223 = -_1219;
    float _1225 = fma(_1197, _1203, _1223);
    float _1227 = fma(_1197, _1203, _1219);
    float _1229 = fma(_1227, (*spvDescriptorSet0.fp_c10)._m0[10].x, _1217);
    float _1231 = _1201 * _1195;
    float _1233 = fma(_1201, _1231, _1185);
    float _1235 = _1233 * (*spvDescriptorSet0.fp_c10)._m0[9].x;
    float _1237 = fma(_1197, _1231, _1215);
    float _1239 = -_1215;
    float _1241 = fma(_1197, _1231, _1239);
    float _1243 = _1197 * _1197;
    float _1245 = fma(_1221, (*spvDescriptorSet0.fp_c10)._m0[8].x, _1235);
    float _1247 = _1237 * (*spvDescriptorSet0.fp_c10)._m0[9].x;
    float _1249 = -(*spvDescriptorSet0.fp_c8)._m0[29].z;
    float _1251 = _233 + _1249;
    float _1253 = fma(_1195, _1243, _1185);
    float _1255 = fma(_1241, (*spvDescriptorSet0.fp_c10)._m0[10].x, _1245);
    float _1257 = fma(_1225, (*spvDescriptorSet0.fp_c10)._m0[8].x, _1247);
    float _1259 = -(*spvDescriptorSet0.fp_c8)._m0[29].y;
    float _1261 = _229 + _1259;
    float _1263 = -(*spvDescriptorSet0.fp_c8)._m0[29].x;
    float _1265 = _231 + _1263;
    float _1267 = in.m_67.x;
    float _1269 = gl_FragCoord.w;
    float _1271 = _1267 * _1269;
    float _1273 = fma(_1253, (*spvDescriptorSet0.fp_c10)._m0[10].x, _1257);
    float _1275 = _1261 * _1261;
    float _1277 = _1163 * _1255;
    float _1279 = fma(_1265, _1265, _1275);
    float _1281 = fma(_1149, _1229, _1277);
    float _1283 = fma(_1251, _1251, _1279);
    float _1285 = rsqrt(_1283);
    float _1287 = _1265 * _1285;
    float _1289 = _1261 * _1285;
    float _1291 = _1251 * _1285;
    float _1293 = _109 * _1271;
    float _1295 = in.m_69.w;
    float _1297 = gl_FragCoord.w;
    float _1299 = _1295 * _1297;
    float _1301 = _109 * _1299;
    bool _1303 = _1301 != 1.0;
    bool _1305 = isnan(_1301);
    bool _1307 = _1303 || _1305;
    bool _1309 = isnan(1.0);
    bool _1311 = _1307 || _1309;
    bool _1313 = !_1311;
    if (!_1313)
    {
        float _1315 = gl_FragCoord.x;
        float _1317 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _1319 = _1315 / _1317;
        float _1321 = gl_FragCoord.y;
        float _1323 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _1325 = _1321 / _1323;
        float _1327 = trunc(_1319);
        int _1329 = int(_1327);
        float _1331 = trunc(_1325);
        int _1333 = int(_1331);
        int _1335 = _1329 + 2;
        int _1337 = _1335 >> 1;
        uint _1340 = uint(int(uint(_1333) >> uint(1)));
        int _1342 = _1337 ^ int(_1340);
        int _1344 = _1342 << 16;
        int _1346 = _1344 ^ _1337;
        int _1348 = 983055 & _1346;
        float _1350 = _1301 * 256.0;
        int _1352 = _1348 << 6;
        int _1354 = _1352 + _1348;
        float _1356 = trunc(_1350);
        int _1358 = int(_1356);
        int _1360 = _1354 & 13369548;
        uint _1362 = uint(int(uint(_1360) >> uint(3)));
        int _1364 = _1360 | int(_1362);
        int _1366 = _1364 & 5570560;
        int _1368 = _1364 & 85;
        uint _1370 = uint(int(uint(_1366) >> uint(15)));
        int _1372 = int(_1370) + _1368;
        uint _1374 = uint(int(uint(_1358) >> uint(7)));
        int _1376 = int(_1374) + _1358;
        bool _1378 = uint(_1376) > uint(_1372);
        if (!_1378)
        {
            discard_fragment();
        }
        if (!_1378)
        {
            out.m_72.x = 0.00999999977648258209228515625;
            out.m_72.y = 0.00999999977648258209228515625;
            out.m_72.z = 0.00999999977648258209228515625;
            out.m_72.w = _1293;
            return out;
        }
    }
    float _1380 = _121 * _121;
    float _1382 = _121 * _1041;
    float _1384 = _121 * _1045;
    float _1386 = fma(_119, _119, _1380);
    float _1388 = precise::clamp(_1386, 0.0, 1.0);
    float _1390 = fma(_119, _903, _1382);
    float _1392 = fma(_119, _911, _1384);
    float _1394 = -_1388;
    float _1396 = _1394 + 1.0;
    float _1398 = _121 * _1043;
    float _1400 = fma(_119, _905, _1398);
    float _1402 = sqrt(_1396);
    float _1404 = fma(_655, _1402, _1400);
    float _1406 = fma(_685, _1402, _1390);
    float _1408 = fma(_657, _1402, _1392);
    float _1410 = _1404 * _1404;
    float _1412 = fma(_1406, _1406, _1410);
    float _1414 = fma(_1408, _1408, _1412);
    float _1416 = rsqrt(_1414);
    float _1418 = _1406 * _1416;
    float _1420 = _1404 * _1416;
    float _1422 = _1408 * _1416;
    float _1424 = _1287 * _1418;
    float _1426 = fma(_1289, _1420, _1424);
    float _1428 = fma((*spvDescriptorSet0.fp_c13)._m0[4].y, 7.0, 1.0);
    float _1430 = fma(_1291, _1422, _1426);
    float _1432 = _1430 + _1430;
    float _1434 = -_1432;
    float _1436 = fma(_1418, _1434, _1287);
    float _1438 = -_1432;
    float _1440 = fma(_1420, _1438, _1289);
    float _1442 = -_1291;
    float _1444 = fma(_1422, _1432, _1442);
    float _1446 = abs(_1436);
    float _1448 = abs(_1440);
    float _1450 = precise::max(_1446, _1448);
    float _1452 = abs(_1444);
    float _1454 = precise::max(_1452, _1450);
    float _1456 = abs(_1418);
    float _1458 = abs(_1420);
    float _1460 = precise::max(_1456, _1458);
    float _1462 = 1.0 / _1454;
    float _1464 = abs(_1422);
    float _1466 = precise::max(_1464, _1460);
    float _1468 = 1.0 / _1466;
    float _1470 = _1436 * _1462;
    float _1472 = _1440 * _1462;
    float _1474 = _1444 * _1462;
    float4 _4251 = float4(_1470, _1472, _1474, float(0));
    float4 _4255 = select(_4251, float4(0.0), isnan(_4251));
    float3 _1476 = dm_bs(spvDescriptorSet0.fp_t_tcb_2E.sample(spvDescriptorSet0.fp_t_tcb_2ESmplr, _4255.xyz, uint(rint(_4255.w)), level(_1428)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_2E, spvDescriptorSet0.fp_t_tcb_2ESmplr_w, _4255.xyz, uint(rint(_4255.w)), level(_1428)).xyz;
    float _1478 = _1476.x;
    float _1480 = _1476.y;
    float _1482 = _1476.z;
    float _1484 = -_1468;
    float _1486 = _1422 * _1484;
    float _1488 = _1418 * _1468;
    float _1490 = _1420 * _1468;
    float3 _4280 = float3(_1488, _1490, _1486);
    float3 _1492 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_4280, float3(0.0), isnan(_4280)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_4280, float3(0.0), isnan(_4280)), level(0.0)).xyz;
    float _1494 = _1492.x;
    float _1496 = _1492.y;
    float _1498 = _1492.z;
    float _1500 = fma(_1153, _1273, _1281);
    float _1502 = precise::clamp(_1500, 0.0, 1.0);
    float _1504 = _1289 * _1289;
    float _1506 = in.m_74.x;
    float _1508 = sqrt(_1283);
    float _1510 = fma(_1287, _1287, _1504);
    bool _1512 = 0.0 < (*spvDescriptorSet0.fp_c15)._m0[655].w;
    float _1514 = fma(_1291, _1291, _1510);
    float _1516 = rsqrt(_1514);
    float _1518 = _1289 * _1516;
    float _1520 = _1133 * _1518;
    float _1522 = _1287 * _1516;
    float _1524 = _1291 * _1516;
    float _1526 = fma(_1131, _1522, _1520);
    float _1528 = fma(_1135, _1524, _1526);
    float _1530 = fma(_1506, 1.66666662693023681640625, -1.16666662693023681640625);
    float _1532 = _1289 + (*spvDescriptorSet0.fp_c15)._m0[16].y;
    float _1534 = abs(_1528);
    float _1536 = fma(_1534, -5.0, 2.0);
    float _1538 = precise::clamp(_1536, 0.0, 1.0);
    float _1540 = precise::max(0.0, _1530);
    float _1542 = _1532 * _1532;
    float _1544 = _1538 * _1538;
    float _1546 = precise::min(_1540, 0.5);
    float _1548 = fma(_1538, -2.0, 3.0);
    float _1550 = _1287 + (*spvDescriptorSet0.fp_c15)._m0[16].x;
    float _1552 = _1291 + (*spvDescriptorSet0.fp_c15)._m0[16].z;
    float _1554 = fma(_1548, _1544, _1546);
    float _1556 = fma(_1550, _1550, _1542);
    float _1558 = fma(_1552, _1552, _1556);
    float _1560 = rsqrt(_1558);
    float _1562 = _1532 * _1560;
    float _1564 = _1550 * _1560;
    float _1566 = _1552 * _1560;
    float _1568 = -_1289;
    float _1570 = -_1424;
    float _1572 = fma(_1568, _1420, _1570);
    float _1574 = _1562 * (*spvDescriptorSet0.fp_c15)._m0[16].y;
    float _1576 = _1502 * _1502;
    float _1578 = _1418 * _1564;
    float _1580 = fma(_1564, (*spvDescriptorSet0.fp_c15)._m0[16].x, _1574);
    float _1582 = -_1291;
    float _1584 = fma(_1582, _1422, _1572);
    float _1586 = precise::clamp(_1584, 0.0, 1.0);
    float _1588 = fma(_1576, 0.5, _1554);
    float _1590 = precise::clamp(_1588, 0.0, 1.0);
    float _1592 = -_1562;
    float _1594 = -_1578;
    float _1596 = fma(_1420, _1592, _1594);
    float _1598 = fma(_1566, (*spvDescriptorSet0.fp_c15)._m0[16].z, _1580);
    float _1600 = precise::clamp(_1598, 0.0, 1.0);
    float _1602 = _1586 * (-9.27999973297119140625);
    float _1604 = _1590 * 2.0;
    float _1606 = -_1600;
    float _1608 = _1606 + 1.0;
    float _1610 = in.m_76.x;
    float _1612 = gl_FragCoord.w;
    float _1614 = _1610 * _1612;
    float _1616 = exp2(_1602);
    float _1618 = fma(_1506, -0.5, 1.0);
    float _1620 = -_1566;
    float _1622 = fma(_1422, _1620, _1596);
    float _1624 = precise::clamp(_1622, 0.0, 1.0);
    float _1626 = _1608 * _1608;
    float _1628 = -(*spvDescriptorSet0.fp_c13)._m0[4].y;
    float _1630 = _1628 + 1.0;
    float _1632 = fma(_1169, _1618, _1604);
    float _1634 = fma(_1177, _1618, _1604);
    float _1636 = fma(_1179, _1618, _1604);
    float _1638 = _1626 * _1626;
    float _1640 = _1630 * _1630;
    float _1642 = _503 + _1636;
    float _1644 = _1608 * _1638;
    float _1646 = fma(0.5, (*spvDescriptorSet0.fp_c13)._m0[4].y, 0.5);
    float _1648 = precise::min(_1640, _1616);
    float _1650 = _1418 * (*spvDescriptorSet0.fp_c15)._m0[16].x;
    float _1652 = fma((*spvDescriptorSet0.fp_c13)._m0[4].y, -0.0274999998509883880615234375, 0.0425000004470348358154296875);
    float _1654 = _1646 * _1646;
    float _1656 = _1654 * 0.5;
    float _1658 = -_1420;
    float _1660 = -_1650;
    float _1662 = fma(_1658, (*spvDescriptorSet0.fp_c15)._m0[16].y, _1660);
    float _1664 = fma(_1630, _1648, _1652);
    float _1666 = -_1656;
    float _1668 = _1666 + 1.0;
    float _1670 = -_1422;
    float _1672 = fma(_1670, (*spvDescriptorSet0.fp_c15)._m0[16].z, _1662);
    float _1674 = precise::clamp(_1672, 0.0, 1.0);
    float _1676 = fma(_1586, _1668, _1656);
    float _1678 = fma(_1674, _1668, _1656);
    float _1680 = _109 * _1614;
    float _1682 = fma((*spvDescriptorSet0.fp_c13)._m0[4].z, -0.02999999932944774627685546875, 0.039999999105930328369140625);
    float _1684 = fma((*spvDescriptorSet0.fp_c13)._m0[4].z, 0.02999999932944774627685546875, 0.959999978542327880859375);
    float _1686 = _1676 * _1678;
    float _1688 = fma((*spvDescriptorSet0.fp_c13)._m0[4].y, (*spvDescriptorSet0.fp_c13)._m0[4].y, 0.00999999977648258209228515625);
    float _1690 = precise::clamp(_1688, 0.0, 1.0);
    float _1692 = fma(_1644, _1684, _1682);
    float _1694 = _503 + _1632;
    float _1696 = _1690 * _1690;
    float _1698 = _503 + _1634;
    float _1700 = _1624 * _1624;
    float _1702 = _1694 + _1680;
    float _1704 = _1696 + (-1.0);
    float _1706 = fma((*spvDescriptorSet0.fp_c13)._m0[4].y, 0.02199999988079071044921875, -0.039999999105930328369140625);
    float _1708 = 1.0 / _1686;
    float _1710 = fma(_1700, _1704, 1.0);
    float _1712 = fma((*spvDescriptorSet0.fp_c13)._m0[4].y, -0.572000026702880859375, 1.03999996185302734375);
    float _1714 = _1696 * 0.31830990314483642578125;
    float _1716 = _1710 * _1710;
    float _1718 = fma(_1664, 1.03999996185302734375, _1706);
    float _1720 = precise::clamp(_1718, 0.0, 1.0);
    float _1722 = 1.0 / _1716;
    float _1724 = -(*spvDescriptorSet0.fp_c15)._m0[651].x;
    float _1726 = (*spvDescriptorSet0.fp_c15)._m0[651].y + _1724;
    float _1728 = 1.0 / _1726;
    float _1730 = _1714 * _1722;
    float _1732 = fma(_1664, -1.03999996185302734375, _1712);
    float _1734 = precise::clamp(_1732, 0.0, 1.0);
    float _1736 = in.m_76.z;
    float _1738 = gl_FragCoord.w;
    float _1740 = _1736 * _1738;
    float _1742 = in.m_76.y;
    float _1744 = gl_FragCoord.w;
    float _1746 = _1742 * _1744;
    float _1748 = _1674 * _1730;
    float _1750 = _1748 * 0.25;
    float _1752 = -(*spvDescriptorSet0.fp_c15)._m0[651].x;
    float _1754 = _1508 + _1752;
    float _1756 = fma(_1682, _1734, _1720);
    float _1758 = _1734;
    float _1760 = _1508;
    float _1762 = _1692;
    if (!_1512)
    {
        _1758 = 0.0;
    }
    float _1764 = _1758;
    float _1766 = _1754 * _1728;
    float _1768 = precise::clamp(_1766, 0.0, 1.0);
    float _1770 = _1764;
    if (!_1512)
    {
        _1760 = 0.0;
    }
    float _1772 = _1760;
    float _1774 = _109 * _1740;
    float _1776 = _1750 * _1708;
    float _1778 = _109 * _1746;
    float _1780 = _1692 * _1776;
    float _1782 = _1698 + _1778;
    float _1784 = _1642 + _1774;
    float _1786 = _1772;
    if (!_1512)
    {
        _1762 = 0.0;
    }
    float _1788 = _1762;
    float _1790 = _1780 * (*spvDescriptorSet0.fp_c15)._m0[21].w;
    float _1792 = -_1478;
    float _1794 = _1792 + (*spvDescriptorSet0.fp_c15)._m0[649].x;
    bool _1796 = !_1512;
    float _1798 = _1788;
    if (!_1796)
    {
        float _1800 = -_229;
        float _1802 = _1800 + (*spvDescriptorSet0.fp_c15)._m0[655].y;
        float _1804 = -_231;
        float _1806 = _1804 + (*spvDescriptorSet0.fp_c15)._m0[655].x;
        float _1808 = -_233;
        float _1810 = _1808 + (*spvDescriptorSet0.fp_c15)._m0[655].z;
        float _1812 = _1802 * _1802;
        float _1814 = fma(_1806, _1806, _1812);
        float _1816 = fma(_1810, _1810, _1814);
        float _1818 = rsqrt(_1816);
        float _1820 = _1802 * _1818;
        float _1822 = _1806 * _1818;
        float _1824 = _1810 * _1818;
        float _1826 = -_1289;
        float _1828 = _1826 + _1820;
        float _1830 = -_1287;
        float _1832 = _1830 + _1822;
        float _1834 = -_1291;
        float _1836 = _1834 + _1824;
        float _1838 = sqrt(_1816);
        float _1840 = _1828 * _1828;
        float _1842 = fma(_1832, _1832, _1840);
        float _1844 = fma(_1836, _1836, _1842);
        float _1846 = rsqrt(_1844);
        float _1848 = -_1838;
        float _1850 = _1848 + (*spvDescriptorSet0.fp_c15)._m0[655].w;
        float _1852 = _1850 * (*spvDescriptorSet0.fp_c15)._m0[658].y;
        float _1854 = precise::clamp(_1852, 0.0, 1.0);
        float _1856 = abs(_1854);
        float _1858 = log2(_1856);
        float _1860 = _1828 * _1846;
        float _1862 = _1832 * _1846;
        float _1864 = _1836 * _1846;
        float _1866 = _1420 * _1860;
        float _1868 = _1420 * _1820;
        float _1870 = fma(_1418, _1862, _1866);
        float _1872 = fma(_1418, _1822, _1868);
        float _1874 = _1858 * (*spvDescriptorSet0.fp_c15)._m0[657].w;
        float _1876 = fma(_1422, _1864, _1870);
        float _1878 = precise::clamp(_1876, 0.0, 1.0);
        float _1880 = fma(_1422, _1824, _1872);
        float _1882 = precise::clamp(_1880, 0.0, 1.0);
        float _1884 = _1878 * _1878;
        float _1886 = _1822 * (*spvDescriptorSet0.fp_c15)._m0[656].x;
        float _1888 = exp2(_1874);
        float _1890 = fma(_1704, _1884, 1.0);
        float _1892 = -_1820;
        float _1894 = -_1886;
        float _1896 = fma(_1892, (*spvDescriptorSet0.fp_c15)._m0[656].y, _1894);
        float _1898 = _1890 * _1890;
        float _1900 = -_1824;
        float _1902 = fma(_1900, (*spvDescriptorSet0.fp_c15)._m0[656].z, _1896);
        float _1904 = -(*spvDescriptorSet0.fp_c15)._m0[656].w;
        float _1906 = _1902 + _1904;
        float _1908 = 1.0 / _1898;
        float _1910 = _1906 * (*spvDescriptorSet0.fp_c15)._m0[658].w;
        float _1912 = precise::clamp(_1910, 0.0, 1.0);
        float _1914 = _1888 * _1912;
        float _1916 = _1882 * _1914;
        float _1918 = _1696 * _1908;
        float _1920 = _1918 * _1916;
        float _1922 = _1920 * (*spvDescriptorSet0.fp_c15)._m0[657].x;
        float _1924 = _1920 * (*spvDescriptorSet0.fp_c15)._m0[657].y;
        float _1926 = _1920 * (*spvDescriptorSet0.fp_c15)._m0[657].z;
        _1770 = _1922;
        _1786 = _1924;
        _1798 = _1926;
    }
    float _1928 = _1770;
    float _1930 = _1786;
    float _1932 = _1798;
    float _1934 = in.m_78.x;
    float _1936 = gl_FragCoord.w;
    float _1938 = _1934 * _1936;
    float _1940 = in.m_78.y;
    float _1942 = gl_FragCoord.w;
    float _1944 = _1940 * _1942;
    float _1946 = in.m_78.z;
    float _1948 = gl_FragCoord.w;
    float _1950 = _1946 * _1948;
    float _1952 = fma(_1768, _1794, _1478);
    float _1954 = in.m_80.x;
    float _1956 = gl_FragCoord.w;
    float _1958 = _1954 * _1956;
    float _1960 = in.m_80.y;
    float _1962 = gl_FragCoord.w;
    float _1964 = _1960 * _1962;
    float _1966 = in.m_80.z;
    float _1968 = gl_FragCoord.w;
    float _1970 = _1966 * _1968;
    float _1972 = -_1480;
    float _1974 = _1972 + (*spvDescriptorSet0.fp_c15)._m0[649].y;
    float _1976 = -_1482;
    float _1978 = _1976 + (*spvDescriptorSet0.fp_c15)._m0[649].z;
    float _1980 = _1756 * _1952;
    float _1982 = in.m_82.y;
    float _1984 = gl_FragCoord.w;
    float _1986 = _1982 * _1984;
    float _1988 = fma(_1768, _1974, _1480);
    float _1990 = fma(_1768, _1978, _1482);
    float _1992 = _1782 * 0.715200006961822509765625;
    float _1994 = fma(_1790, (*spvDescriptorSet0.fp_c15)._m0[22].x, _1980);
    float _1996 = _1756 * _1988;
    float _1998 = _1756 * _1990;
    float _2000 = fma(_1702, 0.2125999927520751953125, _1992);
    float _2002 = in.m_82.x;
    float _2004 = gl_FragCoord.w;
    float _2006 = _2002 * _2004;
    float _2008 = fma(_1790, (*spvDescriptorSet0.fp_c15)._m0[22].y, _1996);
    float _2010 = in.m_82.z;
    float _2012 = gl_FragCoord.w;
    float _2014 = _2010 * _2012;
    float _2016 = in.m_82.w;
    float _2018 = gl_FragCoord.w;
    float _2020 = _2016 * _2018;
    float _2022 = fma(_1790, (*spvDescriptorSet0.fp_c15)._m0[22].z, _1998);
    float _2024 = fma(_1784, 0.072200000286102294921875, _2000);
    float _2026 = in.m_55.z;
    float _2028 = gl_FragCoord.w;
    float _2030 = _2026 * _2028;
    float _2032 = fma(_1756, _1928, _1994);
    float _2034 = fma(_1756, _1930, _2008);
    float _2036 = fma(_1756, _1932, _2022);
    float _2038 = 1.0 / _2024;
    bool _2040 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _2042 = -(*spvDescriptorSet0.fp_c13)._m0[4].z;
    float _2044 = _2042 + 1.0;
    float _2046 = _109 * _1938;
    float _2048 = _109 * _1944;
    float _2050 = _109 * _1950;
    float _2052 = fma(_1494, 0.20999999344348907470703125, _2046);
    float _2054 = fma(_1496, 0.20999999344348907470703125, _2048);
    float _2056 = fma(_1498, 0.20999999344348907470703125, _2050);
    float _2058 = _109 * _1958;
    float _2060 = _109 * _1964;
    float _2062 = _109 * _1970;
    float _2064 = _109 * _1986;
    float _2066 = _2052 + _2058;
    float _2068 = _2054 + _2060;
    float _2070 = _2056 + _2062;
    float _2072 = _2038 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _2074 = precise::clamp(_2072, 0.0, 1.0);
    float _2076 = _2066 * 0.00999999977648258209228515625;
    float _2078 = _2068 * 0.00999999977648258209228515625;
    float _2080 = _2070 * 0.00999999977648258209228515625;
    float _2082 = fma(_2074, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _2084 = fma(_2076, _2044, _2032);
    float _2086 = fma(_2078, _2044, _2034);
    float _2088 = fma(_2080, _2044, _2036);
    float _2090 = _109 * _2006;
    float _2092 = _109 * _2014;
    float _2094 = _109 * _2020;
    float _2096 = fma(_1702, _2082, _2084);
    float _2098 = fma(_1782, _2082, _2086);
    float _2100 = fma(_1784, _2082, _2088);
    float _2102 = _109 * _2030;
    float _2104 = 0.0 + _1293;
    float _2106 = precise::clamp(_2104, 0.0, 1.0);
    float _2108 = fma(_2096, _2094, _2090);
    float _2110 = fma(_2098, _2094, _2064);
    float _2112 = fma(_2100, _2094, _2092);
    bool _2114 = !_2040;
    float _2116 = _2106;
    if (!_2114)
    {
        float _2118 = _2102 * _173;
        float _2120 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _2122 = fma(_2118, (*spvDescriptorSet0.fp_c8)._m0[30].w, _2120);
        float _2124 = 1.0 / _2122;
        float _2126 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _2128 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _2130 = fma(_2124, _2126, _2128);
        float _2132 = _2130 * 8.0;
        float _2134 = precise::clamp(_2132, 0.0, 1.0);
        float _2136 = _2106 * _2134;
        _2116 = _2136;
    }
    float _2138 = _2116;
    float _2140 = 0.0 + _2138;
    float _2142 = precise::clamp(_2140, 0.0, 1.0);
    out.m_72.x = _2108;
    out.m_72.y = _2110;
    out.m_72.z = _2112;
    out.m_72.w = _2142;
    return out;
}

