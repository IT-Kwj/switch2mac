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
[[clang::optnone]] T spvFAdd(T l, T r)
{
    return fma(T(1), l, r);
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

struct _31
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _16* fp_c9 [[id(0)]];
    constant _16* fp_c7 [[id(1)]];
    constant _16* fp_c11 [[id(2)]];
    constant _16* fp_c4 [[id(3)]];
    constant _16* fp_c13 [[id(4)]];
    const device _31* fp_s0 [[id(5)]];
    texture2d<float> fp_t_tcb_1A [[id(6)]];
    sampler fp_t_tcb_1ASmplr [[id(7)]];
    texture2d<float> fp_t_tcb_10 [[id(8)]];
    sampler fp_t_tcb_10Smplr [[id(9)]];
    texture2d_array<float> fp_t_tcb_8 [[id(10)]];
    sampler fp_t_tcb_8Smplr [[id(11)]];
    texture2d_array<float> fp_t_tcb_C [[id(12)]];
    sampler fp_t_tcb_CSmplr [[id(13)]];
    texture2d<float> fp_t_tcb_12 [[id(14)]];
    sampler fp_t_tcb_12Smplr [[id(15)]];
    texture2d<float> fp_t_tcb_16 [[id(16)]];
    sampler fp_t_tcb_16Smplr [[id(17)]];
    texture2d<float> fp_t_tcb_14 [[id(18)]];
    sampler fp_t_tcb_14Smplr [[id(19)]];
    texture2d<float> fp_t_tcb_E [[id(20)]];
    sampler fp_t_tcb_ESmplr [[id(21)]];
    texture2d<float> fp_t_tcb_18 [[id(22)]];
    sampler fp_t_tcb_18Smplr [[id(23)]];
    texture2d<float> fp_t_tcb_1E [[id(24)]];
    sampler fp_t_tcb_1ESmplr [[id(25)]];
    texture2d<float> fp_t_tcb_22 [[id(26)]];
    sampler fp_t_tcb_22Smplr [[id(27)]];
    texture2d<float> fp_t_tcb_1C [[id(28)]];
    sampler fp_t_tcb_1CSmplr [[id(29)]];
    texture2d_array<float> fp_t_tcb_20 [[id(30)]];
    sampler fp_t_tcb_20Smplr [[id(31)]];
    sampler fp_t_tcb_1ASmplr_w [[id(32)]];
    sampler fp_t_tcb_10Smplr_w [[id(33)]];
    sampler fp_t_tcb_8Smplr_w [[id(34)]];
    sampler fp_t_tcb_CSmplr_w [[id(35)]];
    sampler fp_t_tcb_12Smplr_w [[id(36)]];
    sampler fp_t_tcb_16Smplr_w [[id(37)]];
    sampler fp_t_tcb_14Smplr_w [[id(38)]];
    sampler fp_t_tcb_ESmplr_w [[id(39)]];
    sampler fp_t_tcb_18Smplr_w [[id(40)]];
    sampler fp_t_tcb_1ESmplr_w [[id(41)]];
    sampler fp_t_tcb_22Smplr_w [[id(42)]];
    sampler fp_t_tcb_1CSmplr_w [[id(43)]];
    sampler fp_t_tcb_20Smplr_w [[id(44)]];
    constant dm_border_t* dm_border [[id(45)]];
};

struct main0_out
{
    float4 m_86 [[color(0)]];
    float4 m_88 [[color(1)]];
};

struct main0_in
{
    float4 m_71 [[user(locn0)]];
    float4 m_79 [[user(locn4)]];
    float4 m_73 [[user(locn5)]];
    float4 m_75 [[user(locn6)]];
    float4 m_77 [[user(locn7)]];
    float4 m_81 [[user(locn8)]];
    float4 m_83 [[user(locn9)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _95 = gl_FragCoord.w;
    float _97 = in.m_71.x;
    float _99 = gl_FragCoord.w;
    float _101 = _97 * _99;
    float _103 = in.m_71.y;
    float _105 = gl_FragCoord.w;
    float _107 = _103 * _105;
    float _109 = 1.0 / _95;
    float _111 = _109 * _101;
    float _113 = _109 * _107;
    float2 _1548 = float2(_111, _113);
    float2 _117 = dm_bs(spvDescriptorSet0.fp_t_tcb_1A.sample(spvDescriptorSet0.fp_t_tcb_1ASmplr, select(_1548, float2(0.0), isnan(_1548))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_1A, spvDescriptorSet0.fp_t_tcb_1ASmplr_w, select(_1548, float2(0.0), isnan(_1548))).xy;
    float _119 = _117.x;
    float _121 = _117.y;
    int _124 = as_type<int>((*spvDescriptorSet0.fp_c7)._m0[11].z) * as_type<int>((*spvDescriptorSet0.fp_c11)._m0[33].z);
    int _126 = _124 + as_type<int>((*spvDescriptorSet0.fp_c11)._m0[33].w);
    int _128 = _126 * 96;
    int _130 = _128 + 16;
    int _132 = _128 + 24;
    float _134 = in.m_73.y;
    float _136 = gl_FragCoord.w;
    float _138 = _134 * _136;
    float _140 = in.m_73.x;
    float _142 = gl_FragCoord.w;
    float _144 = _140 * _142;
    float _146 = in.m_75.y;
    float _148 = gl_FragCoord.w;
    float _150 = _146 * _148;
    uint _153 = uint(int(uint(_130) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.fp_s0)._m0[int(_153)];
    float _155 = as_type<float>(_dmw0.x);
    int _157 = _130 + 4;
    uint _159 = uint(int(uint(_157) >> uint(2)));
    float _161 = as_type<float>(_dmw0.y);
    float _163 = in.m_73.z;
    float _165 = gl_FragCoord.w;
    float _167 = _163 * _165;
    float _169 = in.m_75.x;
    float _171 = gl_FragCoord.w;
    float _173 = _169 * _171;
    float _175 = in.m_75.z;
    float _177 = gl_FragCoord.w;
    float _179 = _175 * _177;
    uint _181 = uint(int(uint(_132) >> uint(2)));
    float _183 = as_type<float>(_dmw0.z);
    int _185 = _132 + 4;
    uint _187 = uint(int(uint(_185) >> uint(2)));
    float _189 = as_type<float>(_dmw0.w);
    float _191 = in.m_77.y;
    float _193 = gl_FragCoord.w;
    float _195 = _191 * _193;
    float _197 = in.m_77.x;
    float _199 = gl_FragCoord.w;
    float _201 = _197 * _199;
    float _203 = in.m_77.z;
    float _205 = gl_FragCoord.w;
    float _207 = _203 * _205;
    float _209 = in.m_79.w;
    float _211 = gl_FragCoord.w;
    float _213 = _209 * _211;
    float _215 = in.m_79.z;
    float _217 = gl_FragCoord.w;
    float _219 = _215 * _217;
    int _221 = _128 + 80;
    uint _223 = uint(int(uint(_221) >> uint(2)));
    float _225 = as_type<float>((*spvDescriptorSet0.fp_s0)._m0[int(_223)]);
    float _227 = _109 * _138;
    float _229 = _109 * _144;
    float _231 = _109 * _150;
    float _233 = _227 * _227;
    float _235 = _109 * _167;
    float _237 = _109 * _173;
    float _239 = fma(_229, _229, _233);
    float _241 = _231 * _231;
    float _243 = in.m_73.w;
    float _245 = gl_FragCoord.w;
    float _247 = _243 * _245;
    float _249 = _109 * _179;
    float _251 = fma(_237, _237, _241);
    float _253 = fma(_235, _235, _239);
    float _255 = fma(_249, _249, _251);
    float _257 = rsqrt(_253);
    float _259 = _109 * _195;
    float _261 = rsqrt(_255);
    float _263 = _109 * _201;
    float _265 = -(*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _267 = _259 + _265;
    float _269 = _109 * _207;
    float _271 = -(*spvDescriptorSet0.fp_c4)._m0[11].w;
    float _273 = _263 + _271;
    float _275 = _267 * _267;
    float _277 = -(*spvDescriptorSet0.fp_c4)._m0[13].w;
    float _279 = _269 + _277;
    float _281 = _235 * _257;
    float _283 = fma(_273, _273, _275);
    float _285 = _229 * _257;
    float _287 = _227 * _257;
    float _289 = _237 * _261;
    float _291 = _249 * _261;
    float _293 = fma(_279, _279, _283);
    float _295 = _289 * _281;
    float _297 = _231 * _261;
    float _299 = _291 * _287;
    float _301 = _109 * _247;
    float _303 = -_295;
    float _305 = fma(_291, _285, _303);
    float _307 = sqrt(_293);
    float _309 = _297 * _285;
    float _311 = -_299;
    float _313 = fma(_297, _281, _311);
    float _315 = _301 * _305;
    float _317 = -_309;
    float _319 = fma(_289, _287, _317);
    float _321 = _301 * _313;
    float _323 = _315 * _315;
    float _325 = _301 * _319;
    float _327 = fma(_321, _321, _323);
    float _329 = fma(_325, _325, _327);
    float _331 = spvFAdd(_307, 9.9999997473787516355514526367188e-06);
    float _333 = 1.0 / _331;
    float _335 = rsqrt(_329);
    float _337 = _109 * _213;
    float _339 = _109 * _219;
    float _341 = _267 * _333;
    float _343 = _273 * _333;
    float _345 = _279 * _333;
    float _347 = _321 * _335;
    float _349 = fma(_337, _161, _189);
    float _351 = _315 * _335;
    float _353 = _341 * _351;
    float _355 = fma(_343, _347, _353);
    float _357 = _285 * _343;
    float _359 = _325 * _335;
    float _361 = -_341;
    float _363 = -_357;
    float _365 = fma(_287, _361, _363);
    float _367 = fma(_345, _359, _355);
    float _369 = -_345;
    float _371 = fma(_281, _369, _365);
    float _373 = _367 * (-0.5);
    float _375 = _371 * (-0.5);
    float _377 = fma(_111, 2.5, _375);
    float _379 = fma(_113, 2.5, _373);
    float _381 = fma(_119, 0.25, _377);
    float _383 = fma(_121, 0.25, _379);
    float2 _1958 = float2(_381, _383);
    float2 _385 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1958, float2(0.0), isnan(_1958))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_1958, float2(0.0), isnan(_1958))).xy;
    float _387 = _385.x;
    float _389 = _385.y;
    int _391 = as_type<int>(_225) << 6;
    float _393 = fma(_339, _155, _183);
    int _395 = _391 + 25904;
    uint _397 = uint(int(uint(_395) >> uint(2)));
    uint _399 = uint(int(uint(int(_397)) >> uint(2)));
    int _401 = int(_397) & 3;
    float _403 = (*spvDescriptorSet0.fp_c9)._m0[int(_399)][_401];
    int _405 = int(_397) + 1;
    uint _407 = uint(int(uint(_405) >> uint(2)));
    int _409 = _405 & 3;
    float _411 = (*spvDescriptorSet0.fp_c9)._m0[int(_407)][_409];
    int _413 = _391 + 25920;
    uint _415 = uint(int(uint(_413) >> uint(2)));
    uint _417 = uint(int(uint(int(_415)) >> uint(2)));
    int _419 = int(_415) & 3;
    float _421 = (*spvDescriptorSet0.fp_c9)._m0[int(_417)][_419];
    int _423 = int(_415) + 1;
    uint _425 = uint(int(uint(_423) >> uint(2)));
    int _427 = _423 & 3;
    float _429 = (*spvDescriptorSet0.fp_c9)._m0[int(_425)][_427];
    float _431 = _393 * _403;
    float _433 = _349 * _411;
    float2 _2047;
    _2047.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_431, _433));
    _2047.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_431, _433));
    float _435 = _2047.x;
    float _437 = _435 * 256.0;
    int _439 = int(_437);
    float _441 = _393 * _421;
    float _443 = _349 * _429;
    float2 _2064;
    _2064.x = spvDescriptorSet0.fp_t_tcb_C.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_CSmplr, float2(_441, _443));
    _2064.y = spvDescriptorSet0.fp_t_tcb_C.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_CSmplr, float2(_441, _443));
    float _445 = _2064.x;
    float _447 = _445 * 256.0;
    int _449 = int(_447);
    float2 _2073 = float2(_111, _113);
    float _451 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_2073, float2(0.0), isnan(_2073))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_2073, float2(0.0), isnan(_2073))).x;
    int _453 = _128 + 68;
    uint _455 = uint(int(uint(_453) >> uint(2)));
    float _457 = as_type<float>((*spvDescriptorSet0.fp_s0)._m0[int(_455)]);
    float _459 = fma(_389, 2.007874011993408203125, -1.007874011993408203125);
    float _461 = fma(_387, 2.007874011993408203125, -1.007874011993408203125);
    float _463 = _321 * _459;
    float _465 = fma(_285, _461, _463);
    float _467 = -(*spvDescriptorSet0.fp_c9)._m0[26].z;
    float _469 = _269 + _467;
    float _471 = -(*spvDescriptorSet0.fp_c9)._m0[26].x;
    float _473 = _263 + _471;
    float _475 = _469 * _469;
    float _477 = fma(_473, _473, _475);
    float _479 = sqrt(_477);
    bool _483 = _479 > (*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _485 = -(*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _487 = _479 + _485;
    float _489 = _381;
    float _491 = _487;
    float _493 = _477;
    float _495 = _473;
    if (_483)
    {
        float _497 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _489 = _497;
    }
    float _499 = _489;
    if (_483)
    {
        float _501 = _487 * _499;
        _491 = _501;
    }
    float _503 = _491;
    float _505 = 0.0;
    if (_483)
    {
        float _507 = _503 * 0.15915493667125701904296875;
        _505 = _507;
    }
    float _509 = _505;
    float _511 = _503;
    float _513 = _509;
    if (_483)
    {
        float _515 = _509 * 6.283185482025146484375;
        float _517 = sin(_515);
        _511 = _517;
    }
    float _519 = _511;
    float _521 = _499;
    if (_483)
    {
        float _523 = _509 * 6.283185482025146484375;
        float _525 = cos(_523);
        _521 = _525;
    }
    float _527 = _521;
    float _529 = 0.0;
    if (_483)
    {
        float _531 = rsqrt(_477);
        _529 = _531;
    }
    float _533 = _529;
    float _535 = 0.0;
    if (_483)
    {
        float _537 = _259 + (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _535 = _537;
    }
    float _539 = _535;
    float _541 = _539;
    float _543 = _519;
    if (_483)
    {
        float _545 = fma(_519, _539, (*spvDescriptorSet0.fp_c9)._m0[42].y);
        _541 = _545;
    }
    float _547 = _541;
    float _549 = _547;
    if (_483)
    {
        float _551 = _527 + (-1.0);
        _543 = _551;
    }
    float _553 = _543;
    float _555 = _553;
    if (!_483)
    {
        _493 = _263;
    }
    float _557 = _493;
    float _559 = _533;
    float _561 = _557;
    if (_483)
    {
        float _563 = _533 * _547;
        _559 = _563;
    }
    float _565 = _559;
    if (_483)
    {
        float _567 = _553 * (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _549 = _567;
    }
    float _569 = _549;
    if (!_483)
    {
        _555 = _259;
    }
    float _571 = _555;
    float _573 = _571;
    if (_483)
    {
        float _575 = fma(_259, _527, _569);
        _573 = _575;
    }
    float _577 = _573;
    if (_483)
    {
        float _579 = fma(_473, _565, (*spvDescriptorSet0.fp_c9)._m0[26].x);
        _561 = _579;
    }
    float _581 = _561;
    if (!_483)
    {
        _495 = _269;
    }
    float _583 = _495;
    float _585 = -(*spvDescriptorSet0.fp_c9)._m0[26].y;
    float _587 = _577 + _585;
    float _589 = _583;
    if (_483)
    {
        float _591 = fma(_469, _565, (*spvDescriptorSet0.fp_c9)._m0[26].z);
        _589 = _591;
    }
    float _593 = _589;
    float _595 = -(*spvDescriptorSet0.fp_c9)._m0[26].x;
    float _597 = _581 + _595;
    float _599 = _587 * _587;
    float _601 = -(*spvDescriptorSet0.fp_c9)._m0[26].z;
    float _603 = _593 + _601;
    float _605 = fma(_597, _597, _599);
    float _607 = fma(_603, _603, _605);
    float _609 = rsqrt(_607);
    float _611 = (*spvDescriptorSet0.fp_c9)._m0[26].y + (-220.0);
    float _613 = precise::max(0.0, _611);
    float _615 = _609 * (*spvDescriptorSet0.fp_c9)._m0[26].w;
    float _617 = _597 * _615;
    float _619 = _603 * _615;
    float _621 = -_615;
    float _623 = -_613;
    float _625 = fma(_587, _621, _623);
    float _627 = _617 * _617;
    float _629 = _619 * _619;
    float _631 = _627 + _629;
    float _633 = sqrt(_631);
    bool _635 = _633 > (*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _637 = -(*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _639 = _633 + _637;
    float _641 = _615;
    float _643 = _639;
    float _645 = _617;
    float _647 = _619;
    float _649 = _627;
    float _651 = _625;
    float _653 = _629;
    if (_635)
    {
        float _655 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _641 = _655;
    }
    float _657 = _641;
    float _659 = _657;
    if (_635)
    {
        float _661 = _639 * _657;
        _643 = _661;
    }
    float _663 = _643;
    if (_635)
    {
        float _665 = _663 * 0.15915493667125701904296875;
        _513 = _665;
    }
    float _667 = _513;
    float _669 = _663;
    if (_635)
    {
        float _671 = _667 * 6.283185482025146484375;
        float _673 = sin(_671);
        _669 = _673;
    }
    float _675 = _669;
    if (_635)
    {
        float _677 = _625 + (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _659 = _677;
    }
    float _679 = _659;
    float _681 = _679;
    if (_635)
    {
        float _683 = fma(_675, _679, (*spvDescriptorSet0.fp_c9)._m0[42].y);
        _681 = _683;
    }
    float _685 = _681;
    float _687 = _675;
    if (_635)
    {
        float _689 = rsqrt(_631);
        _687 = _689;
    }
    float _691 = _687;
    float _693 = 0.0;
    float _695 = _691;
    if (_635)
    {
        float _697 = _691 * _685;
        _693 = _697;
    }
    float _699 = _693;
    float _701 = _685;
    if (_635)
    {
        float _703 = _667 * 6.283185482025146484375;
        float _705 = cos(_703);
        _701 = _705;
    }
    float _707 = _701;
    if (_635)
    {
        float _709 = _617 * _699;
        _645 = _709;
    }
    float _711 = _645;
    if (_635)
    {
        float _713 = _619 * _699;
        _647 = _713;
    }
    float _715 = _647;
    if (_635)
    {
        float _717 = _711 * _711;
        _649 = _717;
    }
    float _719 = _649;
    if (_635)
    {
        float _721 = _707 + (-1.0);
        _695 = _721;
    }
    float _723 = _695;
    float _725 = 0.0;
    if (_635)
    {
        float _727 = _723 * (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _725 = _727;
    }
    float _729 = _725;
    if (_635)
    {
        float _731 = fma(_625, _707, _729);
        _651 = _731;
    }
    float _733 = _651;
    if (_635)
    {
        float _735 = _715 * _715;
        _653 = _735;
    }
    float _737 = _653;
    float _739 = fma(_733, _733, _719);
    float _741 = _739 + _737;
    float _743 = _315 * _459;
    float _745 = rsqrt(_741);
    float _747 = fma(_287, _461, _743);
    float _749 = -(*spvDescriptorSet0.fp_c9)._m0[63].y;
    float _751 = fma(_307, (*spvDescriptorSet0.fp_c9)._m0[63].x, _749);
    float _753 = precise::clamp(_751, 0.0, 1.0);
    float _755 = -_753;
    float _757 = _755 + 1.0;
    float _759 = abs(_757);
    float _761 = log2(_759);
    float _763 = _745 * _711;
    float _765 = _745 * _733;
    float _767 = _763 * (*spvDescriptorSet0.fp_c9)._m0[69].x;
    float _769 = _745 * _715;
    float _771 = -_767;
    float _773 = fma(_765, (*spvDescriptorSet0.fp_c9)._m0[69].y, _771);
    float _775 = -_769;
    float _777 = fma(_775, (*spvDescriptorSet0.fp_c9)._m0[69].z, _773);
    float _779 = _761 * (*spvDescriptorSet0.fp_c9)._m0[64].x;
    float _781 = exp2(_779);
    float _783 = _765 + 1.0;
    float _785 = -_765;
    float _787 = fma(_781, _783, _785);
    float _789 = _325 * _459;
    float _791 = fma(_777, 0.5, 0.5);
    float _793 = _459 * _459;
    float _795 = fma(_787, 0.5, 0.5);
    float _797 = fma(_777, -0.5, 0.5);
    float _799 = fma(_461, _461, _793);
    float _801 = sqrt(_797);
    float _803 = -_799;
    float _805 = _803 + 1.0;
    float _807 = precise::clamp(_805, 0.0, 1.0);
    float _809 = fma(_791, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _811 = sqrt(_807);
    float _813 = fma(_791, _809, -0.212114393711090087890625);
    float _815 = fma(_791, _813, 1.570728778839111328125);
    float _817 = _801 * 0.636619746685028076171875;
    float _819 = fma(_281, _461, _789);
    float _821 = _297 * _341;
    float _823 = -_815;
    float _825 = fma(_817, _823, 1.0);
    float _827 = in.m_81.x;
    float _829 = gl_FragCoord.w;
    float _831 = _827 * _829;
    float _833 = fma(_297, _811, _747);
    float _835 = fma(_289, _343, _821);
    float _837 = fma(_289, _811, _465);
    float _839 = _833 * _833;
    float _841 = fma(_291, _811, _819);
    float _843 = fma(_837, _837, _839);
    float _845 = fma(_841, _841, _843);
    float _847 = rsqrt(_845);
    float _849 = fma(_291, _345, _835);
    int _851 = _391 + 25936;
    uint _853 = uint(int(uint(_851) >> uint(2)));
    uint _855 = uint(int(uint(int(_853)) >> uint(2)));
    int _857 = int(_853) & 3;
    float _859 = (*spvDescriptorSet0.fp_c9)._m0[int(_855)][_857];
    float _861 = in.m_71.z;
    float _863 = gl_FragCoord.w;
    float _865 = _861 * _863;
    int _867 = _391 + 25944;
    uint _869 = uint(int(uint(_867) >> uint(2)));
    uint _871 = uint(int(uint(int(_869)) >> uint(2)));
    int _873 = int(_869) & 3;
    float _875 = (*spvDescriptorSet0.fp_c9)._m0[int(_871)][_873];
    float _877 = _109 * _831;
    float _879 = _837 * _847;
    float _881 = _833 * _847;
    int _883 = _391 + 25952;
    uint _885 = uint(int(uint(_883) >> uint(2)));
    uint _887 = uint(int(uint(int(_885)) >> uint(2)));
    int _889 = int(_885) & 3;
    float _891 = (*spvDescriptorSet0.fp_c9)._m0[int(_887)][_889];
    float _893 = _841 * _847;
    float _895 = in.m_71.w;
    float _897 = gl_FragCoord.w;
    float _899 = _895 * _897;
    float _901 = _877 * (-0.25);
    float _903 = fma(_371, _901, _111);
    float _905 = fma((*spvDescriptorSet0.fp_c9)._m0[983].y, 1.6670000553131103515625, _113);
    float _907 = float(uint(_439));
    float _909 = fma(_367, _901, _905);
    float _911 = float(uint(_449));
    float2 _2790 = float2(_903, _909);
    float _913 = dm_bs(spvDescriptorSet0.fp_t_tcb_16.sample(spvDescriptorSet0.fp_t_tcb_16Smplr, select(_2790, float2(0.0), isnan(_2790))), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_16, spvDescriptorSet0.fp_t_tcb_16Smplr_w, select(_2790, float2(0.0), isnan(_2790))).x;
    float _915 = _907 * 0.00390625;
    float _917 = _341 * _881;
    float2 _2804 = float2(_111, _905);
    float _919 = dm_bs(spvDescriptorSet0.fp_t_tcb_14.sample(spvDescriptorSet0.fp_t_tcb_14Smplr, select(_2804, float2(0.0), isnan(_2804))), spvDescriptorSet0.dm_border, 6u, spvDescriptorSet0.fp_t_tcb_14, spvDescriptorSet0.fp_t_tcb_14Smplr_w, select(_2804, float2(0.0), isnan(_2804))).x;
    float _921 = precise::max(_457, _859);
    float _923 = fma(_343, _879, _917);
    float _925 = precise::max(_921, _915);
    float _927 = fma(_345, _893, _923);
    float _929 = _109 * _865;
    float _931 = rint(_891);
    float _933 = precise::max(_931, 0.0);
    uint _935 = uint(_933);
    uint _937 = clamp(_935, 0u, 65535u);
    float _939 = fma((*spvDescriptorSet0.fp_c9)._m0[983].y, 0.416750013828277587890625, _927);
    float _941 = _109 * _899;
    float _943 = fma((*spvDescriptorSet0.fp_c9)._m0[983].y, 6.66800022125244140625, _113);
    float _945 = _911 * 0.00390625;
    float2 _2854 = float2(_929, _941);
    float3 _949 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_2854, float2(0.0), isnan(_2854))), spvDescriptorSet0.dm_border, 7u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_2854, float2(0.0), isnan(_2854))).xyz;
    float _951 = _949.x;
    float _953 = _949.y;
    float _955 = _949.z;
    float2 _2867 = float2(_939, 0.0);
    float3 _957 = dm_bs(spvDescriptorSet0.fp_t_tcb_18.sample(spvDescriptorSet0.fp_t_tcb_18Smplr, select(_2867, float2(0.0), isnan(_2867))), spvDescriptorSet0.dm_border, 8u, spvDescriptorSet0.fp_t_tcb_18, spvDescriptorSet0.fp_t_tcb_18Smplr_w, select(_2867, float2(0.0), isnan(_2867))).xyz;
    float _959 = _957.x;
    float _961 = _957.y;
    float _963 = _957.z;
    float2 _2881 = float2(_111, _943);
    float _965 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_2881, float2(0.0), isnan(_2881))), spvDescriptorSet0.dm_border, 9u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_2881, float2(0.0), isnan(_2881))).y;
    float _967 = fma((*spvDescriptorSet0.fp_c9)._m0[983].y, 0.416750013828277587890625, _451);
    float _969 = _849 + _967;
    float2 _2896 = float2(_825, _795);
    float3 _971 = dm_bs(spvDescriptorSet0.fp_t_tcb_22.sample(spvDescriptorSet0.fp_t_tcb_22Smplr, select(_2896, float2(0.0), isnan(_2896))), spvDescriptorSet0.dm_border, 10u, spvDescriptorSet0.fp_t_tcb_22, spvDescriptorSet0.fp_t_tcb_22Smplr_w, select(_2896, float2(0.0), isnan(_2896))).xyz;
    float _973 = _971.x;
    float _975 = _971.y;
    float _977 = _971.z;
    float3 _2913 = float3(_431, _433, float(int(_937)));
    float3 _2917 = select(_2913, float3(0.0), isnan(_2913));
    float _979 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _2917.xy, uint(rint(_2917.z)), level(_925)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _2917.xy, uint(rint(_2917.z)), level(_925)).z;
    float2 _2923 = float2(_969, 0.0);
    float3 _981 = dm_bs(spvDescriptorSet0.fp_t_tcb_1C.sample(spvDescriptorSet0.fp_t_tcb_1CSmplr, select(_2923, float2(0.0), isnan(_2923))), spvDescriptorSet0.dm_border, 11u, spvDescriptorSet0.fp_t_tcb_1C, spvDescriptorSet0.fp_t_tcb_1CSmplr_w, select(_2923, float2(0.0), isnan(_2923))).xyz;
    float _983 = _981.x;
    float _985 = _981.y;
    float _987 = _981.z;
    float _989 = precise::max(_457, _875);
    float _991 = precise::max(_989, _945);
    float3 _2946 = float3(_441, _443, float(int(_937)));
    float3 _2948 = select(_2946, float3(0.0), isnan(_2946));
    float3 _993 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, _2948.xy, uint(rint(_2948.z)), level(_991)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, _2948.xy, uint(rint(_2948.z)), level(_991)).xyz;
    float _995 = _993.x;
    float _997 = _993.y;
    float _999 = _993.z;
    float _1001 = _341 * (*spvDescriptorSet0.fp_c9)._m0[69].y;
    float _1003 = _259 * (*spvDescriptorSet0.fp_c9)._m0[1117].y;
    float _1005 = fma(_343, (*spvDescriptorSet0.fp_c9)._m0[69].x, _1001);
    float _1007 = _259 * (*spvDescriptorSet0.fp_c9)._m0[1118].y;
    float _1009 = fma(_263, (*spvDescriptorSet0.fp_c9)._m0[1117].x, _1003);
    float _1011 = fma(_263, (*spvDescriptorSet0.fp_c9)._m0[1118].x, _1007);
    float _1013 = fma(_269, (*spvDescriptorSet0.fp_c9)._m0[1117].z, _1009);
    float _1015 = fma(_269, (*spvDescriptorSet0.fp_c9)._m0[1118].z, _1011);
    float _1017 = _1013 + (*spvDescriptorSet0.fp_c9)._m0[1117].w;
    float _1019 = _1015 + (*spvDescriptorSet0.fp_c9)._m0[1118].w;
    float _1021 = fma(_345, (*spvDescriptorSet0.fp_c9)._m0[69].z, _1005);
    float _1023 = trunc(_1017);
    int _1025 = int(_1023);
    float _1027 = trunc(_1019);
    int _1029 = int(_1027);
    float _1031 = in.m_83.w;
    float _1033 = gl_FragCoord.w;
    float _1035 = _1031 * _1033;
    int _1037 = ~as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].y);
    int _1039 = _1025 + _1037;
    int _1041 = _1039 + 1;
    bool _1043 = _1041 >= as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].x);
    float _1045 = _109 * _1035;
    float _1047 = _913 * 0.25;
    float _1049 = precise::max(_919, _1047);
    int _1051 = ~as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].z);
    int _1053 = _1029 + _1051;
    int _1055 = _1053 + 1;
    int _1057 = _1041 | _1055;
    bool _1059 = _1057 < 0;
    bool _1061 = _1059 || _1043;
    bool _1063 = _1055 >= as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].x);
    bool _1065 = _1063 || _1061;
    float _1067 = fma(_959, 0.125, _951);
    float _1069 = _959 + _1049;
    float _1071 = fma(_961, 0.125, _953);
    float _1073 = fma(_963, 0.125, _955);
    float _1075 = _961 + _1049;
    float _1077 = fma(_1049, _1069, _1067);
    float _1079 = _963 + _1049;
    float _1081 = _951;
    if (_1065)
    {
        _1081 = (*spvDescriptorSet0.fp_c9)._m0[42].x;
    }
    float _1083 = _1081;
    float _1085 = fma(_1049, _1075, _1071);
    float _1087 = fma(_1049, _1079, _1073);
    float _1089 = _1083;
    if (!_1065)
    {
        int _1091 = _1055 * as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].x);
        int _1093 = _1091 + _1041;
        float _1095 = floor(_1019);
        int _1097 = _1093 << 2;
        int _1099 = _1093 >> 2;
        int _1101 = 12 & _1097;
        int _1103 = _1099 << 4;
        int _1105 = _1103 + _1101;
        float _1107 = floor(_1017);
        int _1109 = _1105 + 16256;
        uint _1111 = uint(int(uint(_1109) >> uint(2)));
        uint _1113 = uint(int(uint(int(_1111)) >> uint(2)));
        int _1115 = int(_1111) & 3;
        float _1117 = (*spvDescriptorSet0.fp_c9)._m0[int(_1113)][_1115];
        float _1119 = -_1095;
        float _1121 = _1019 + _1119;
        float _1123 = -_1107;
        float _1125 = _1017 + _1123;
        float _1127 = rint(_1117);
        float _1129 = precise::max(_1127, 0.0);
        uint _1131 = uint(_1129);
        uint _1133 = clamp(_1131, 0u, 65535u);
        float3 _3180 = float3(_1125, _1121, float(int(_1133)));
        float3 _3182 = select(_3180, float3(0.0), isnan(_3180));
        float _1135 = dm_bs(spvDescriptorSet0.fp_t_tcb_20.sample(spvDescriptorSet0.fp_t_tcb_20Smplr, _3182.xy, uint(rint(_3182.z))), spvDescriptorSet0.dm_border, 12u, spvDescriptorSet0.fp_t_tcb_20, spvDescriptorSet0.fp_t_tcb_20Smplr_w, _3182.xy, uint(rint(_3182.z))).x;
        int _1137 = _1093 << 4;
        int _1139 = _1137 + 17904;
        int _1141 = _1105 + 24304;
        uint _1143 = uint(int(uint(_1141) >> uint(2)));
        uint _1145 = uint(int(uint(int(_1143)) >> uint(2)));
        int _1147 = int(_1143) & 3;
        float _1149 = (*spvDescriptorSet0.fp_c9)._m0[int(_1145)][_1147];
        uint _1151 = uint(int(uint(_1139) >> uint(2)));
        uint _1153 = uint(int(uint(int(_1151)) >> uint(2)));
        int _1155 = int(_1151) & 3;
        float _1157 = (*spvDescriptorSet0.fp_c9)._m0[int(_1153)][_1155];
        int _1159 = int(_1151) + 1;
        uint _1161 = uint(int(uint(_1159) >> uint(2)));
        int _1163 = _1159 & 3;
        float _1165 = (*spvDescriptorSet0.fp_c9)._m0[int(_1161)][_1163];
        int _1167 = _1139 + 8;
        uint _1169 = uint(int(uint(_1167) >> uint(2)));
        uint _1171 = uint(int(uint(int(_1169)) >> uint(2)));
        int _1173 = int(_1169) & 3;
        float _1175 = (*spvDescriptorSet0.fp_c9)._m0[int(_1171)][_1173];
        int _1177 = int(_1169) + 1;
        uint _1179 = uint(int(uint(_1177) >> uint(2)));
        int _1181 = _1177 & 3;
        float _1183 = (*spvDescriptorSet0.fp_c9)._m0[int(_1179)][_1181];
        float _1185 = _259 * _1165;
        float _1187 = fma(_263, _1157, _1185);
        float _1189 = 1.0 / _1149;
        float _1191 = fma(_269, _1175, _1187);
        float _1193 = _1191 + _1183;
        float _1195 = precise::clamp(_1193, 0.0, 1.0);
        float _1197 = _1149 * (*spvDescriptorSet0.fp_c13)._m0[4].z;
        float _1199 = -_1195;
        float _1201 = _1199 + _1135;
        float _1203 = fma(_1189, (*spvDescriptorSet0.fp_c13)._m0[4].w, _1201);
        float _1205 = _1197 * _1203;
        float _1207 = exp2(_1205);
        float _1209 = 0.0 + _1207;
        float _1211 = precise::clamp(_1209, 0.0, 1.0);
        float _1213 = precise::min(_1211, (*spvDescriptorSet0.fp_c9)._m0[42].x);
        _1089 = _1213;
    }
    float _1215 = _1089;
    float _1217 = abs(_267);
    bool _1219 = _1217 > 0.00999999977648258209228515625;
    float _1221 = -_1045;
    float _1223 = -(*spvDescriptorSet0.fp_c9)._m0[41].z;
    float _1225 = _1221 + _1223;
    float _1227 = -_1215;
    float _1229 = _1227 + 1.0;
    float _1231 = fma(_965, _959, _1077);
    float _1233 = _1219 ? _267 : 0.00999999977648258209228515625;
    float _1235 = _1225 * (*spvDescriptorSet0.fp_c9)._m0[41].w;
    float _1237 = precise::clamp(_1235, 0.0, 1.0);
    float _1239 = in.m_83.y;
    float _1241 = gl_FragCoord.w;
    float _1243 = _1239 * _1241;
    float _1245 = fma(_1021, 2.0, (*spvDescriptorSet0.fp_c9)._m0[66].z);
    float _1247 = in.m_83.x;
    float _1249 = gl_FragCoord.w;
    float _1251 = _1247 * _1249;
    float _1253 = _1233 * (*spvDescriptorSet0.fp_c9)._m0[66].x;
    float _1255 = fma(_1237, _1229, _1215);
    float _1257 = fma(_1245, (*spvDescriptorSet0.fp_c9)._m0[66].z, 1.0);
    float _1259 = in.m_83.z;
    float _1261 = gl_FragCoord.w;
    float _1263 = _1259 * _1261;
    float _1265 = precise::max(_1253, -127.0);
    float _1267 = fma(_965, _961, _1085);
    float _1269 = (*spvDescriptorSet0.fp_c9)._m0[66].x * (*spvDescriptorSet0.fp_c9)._m0[66].y;
    float _1271 = -(*spvDescriptorSet0.fp_c9)._m0[66].z;
    float _1273 = fma(_1271, (*spvDescriptorSet0.fp_c9)._m0[66].z, 1.0);
    float _1275 = -_1265;
    float _1277 = exp2(_1275);
    float _1279 = fma(_965, _963, _1087);
    float _1281 = _997 * 0.4774648249149322509765625;
    float _1283 = _979 * 0.2820948064327239990234375;
    float _1285 = _995 * 0.4774648249149322509765625;
    float _1287 = _999 * 0.4774648249149322509765625;
    float _1289 = _985 * 0.0452399961650371551513671875;
    float _1291 = -_1269;
    float _1293 = exp2(_1291);
    float _1295 = _983 * 0.0452399961650371551513671875;
    float _1297 = _987 * 0.0452399961650371551513671875;
    float _1299 = -_1277;
    float _1301 = _1299 + 1.0;
    float _1303 = abs(_1257);
    float _1305 = log2(_1303);
    float _1307 = _109 * _1243;
    float _1309 = _109 * _1251;
    float _1311 = _1293 * _1301;
    float _1313 = _761 * (*spvDescriptorSet0.fp_c9)._m0[64].y;
    float _1315 = 1.0 / _1265;
    float _1317 = _109 * _1263;
    float _1319 = exp2(_1313);
    float _1321 = _1267 * 0.17880000174045562744140625;
    float _1323 = _1311 * _1315;
    float _1325 = _1305 * 1.5;
    float _1327 = fma(_1231, 0.053149998188018798828125, _1321);
    float _1329 = fma(_1279, 0.01805000007152557373046875, _1327);
    float _1331 = exp2(_1325);
    float _1333 = -_1319;
    float _1335 = _1333 + 1.0;
    float _1337 = 1.0 / _1329;
    float _1339 = _1331 * 12.56637096405029296875;
    float _1341 = _1307 * 0.18672408163547515869140625;
    float _1343 = fma(_1309, 0.095146648585796356201171875, _1341);
    float _1345 = 1.0 / _1339;
    float _1347 = (*spvDescriptorSet0.fp_c9)._m0[39].y + (*spvDescriptorSet0.fp_c9)._m0[39].x;
    float _1349 = _1273 * _1345;
    float _1351 = _307 * (*spvDescriptorSet0.fp_c9)._m0[65].w;
    float _1353 = _1283 * (*spvDescriptorSet0.fp_c9)._m0[991].x;
    float _1355 = _1323 * _1351;
    float _1357 = fma(_1317, 0.0364394821226596832275390625, _1343);
    float _1359 = _1283 * (*spvDescriptorSet0.fp_c9)._m0[991].y;
    float _1361 = fma(_1285, (*spvDescriptorSet0.fp_c9)._m0[68].x, _1353);
    float _1363 = _1283 * (*spvDescriptorSet0.fp_c9)._m0[991].z;
    float _1365 = precise::max(_1357, 0.00999999977648258209228515625);
    float _1367 = -_1355;
    float _1369 = exp2(_1367);
    float _1371 = fma(_1281, (*spvDescriptorSet0.fp_c9)._m0[68].y, _1359);
    float _1373 = _1337 * (*spvDescriptorSet0.fp_c9)._m0[39].z;
    float _1375 = fma(_1287, (*spvDescriptorSet0.fp_c9)._m0[68].z, _1363);
    float _1377 = _1371 * 0.586610972881317138671875;
    float _1379 = _1347 * _1373;
    float _1381 = precise::clamp(_1379, 0.0, 1.0);
    float _1383 = 1.0 / _1365;
    float _1385 = fma(_1361, 0.298911988735198974609375, _1377);
    float _1387 = fma(_1381, (*spvDescriptorSet0.fp_c9)._m0[40].y, (*spvDescriptorSet0.fp_c9)._m0[40].x);
    float _1389 = fma(_1375, 0.114477999508380889892578125, _1385);
    float _1391 = precise::min(_1373, _1387);
    float _1393 = -_1369;
    float _1395 = _1393 + 1.0;
    float _1397 = _1395 * _1349;
    float _1399 = precise::min(_1255, (*spvDescriptorSet0.fp_c9)._m0[62].x);
    float _1401 = _1335 * (*spvDescriptorSet0.fp_c9)._m0[64].z;
    float _1403 = _1391 * (*spvDescriptorSet0.fp_c9)._m0[39].y;
    float _1405 = _1389 * _1383;
    float _1407 = -_1401;
    float _1409 = _1407 + 1.0;
    float _1411 = _1401 * _1369;
    float _1413 = _1399 * _1397;
    float _1415 = precise::min(_1405, (*spvDescriptorSet0.fp_c9)._m0[27].w);
    float _1417 = fma(_1387, (*spvDescriptorSet0.fp_c9)._m0[39].x, _1403);
    float _1419 = _1369 * _1409;
    float _1421 = _1413 * (*spvDescriptorSet0.fp_c9)._m0[70].x;
    float _1423 = _1413 * (*spvDescriptorSet0.fp_c9)._m0[70].y;
    float _1425 = _1415 * 0.31830990314483642578125;
    float _1427 = _1231 * _1417;
    float _1429 = _1427 * 0.25;
    float _1431 = _1267 * _1417;
    float _1433 = _1431 * 0.25;
    float _1435 = _1279 * _1417;
    float _1437 = _1435 * 0.25;
    float _1439 = _1307 * _1425;
    float _1441 = _1309 * _1425;
    float _1443 = _1317 * _1425;
    float _1445 = _1413 * (*spvDescriptorSet0.fp_c9)._m0[70].z;
    float _1447 = _1289 * _1439;
    float _1449 = _1295 * _1441;
    float _1451 = fma(_973, _1411, _1421);
    float _1453 = _1429 * (*spvDescriptorSet0.fp_c11)._m0[35].x;
    float _1455 = fma(_975, _1411, _1423);
    float _1457 = precise::max(0.0, _1447);
    float _1459 = _1433 * (*spvDescriptorSet0.fp_c11)._m0[35].x;
    float _1461 = _1437 * (*spvDescriptorSet0.fp_c11)._m0[35].x;
    float _1463 = _1297 * _1443;
    float _1465 = fma(_977, _1411, _1445);
    float _1467 = -(*spvDescriptorSet0.fp_c9)._m0[48].x;
    float _1469 = _307 + _1467;
    float _1471 = -(*spvDescriptorSet0.fp_c9)._m0[48].z;
    float _1473 = _307 + _1471;
    float _1475 = precise::max(0.0, _1449);
    float _1477 = fma(_1419, _1457, _1455);
    float _1479 = precise::max(0.0, _1453);
    float _1481 = _1469 * (*spvDescriptorSet0.fp_c9)._m0[48].y;
    float _1483 = precise::clamp(_1481, 0.0, 1.0);
    float _1485 = precise::max(0.0, _1459);
    float _1487 = fma(_1419, _1475, _1451);
    float _1489 = precise::max(0.0, _1461);
    float _1491 = _1419 * _1479;
    float _1493 = precise::max(0.0, _1463);
    float _1495 = _1473 * (*spvDescriptorSet0.fp_c9)._m0[48].w;
    float _1497 = precise::clamp(_1495, 0.0, 1.0);
    float _1499 = _1419 * _1485;
    float _1501 = _1419 * _1489;
    float _1503 = fma(_1419, _1493, _1465);
    float _1505 = fma(_1483, _1491, _1487);
    float _1507 = fma(_1497, _1491, _1487);
    float _1509 = fma(_1483, _1499, _1477);
    float _1511 = fma(_1497, _1499, _1477);
    float _1513 = fma(_1483, _1501, _1503);
    float _1515 = fma(_1497, _1501, _1503);
    out.m_86.x = _1505;
    out.m_86.y = _1509;
    out.m_86.z = _1513;
    out.m_86.w = 1.0;
    out.m_88.x = _1507;
    out.m_88.y = _1511;
    out.m_88.z = _1515;
    out.m_88.w = 1.0;
    return out;
}

