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
    float4 m_84 [[color(0)]];
    float4 m_86 [[color(1)]];
};

struct main0_in
{
    float4 m_71 [[user(locn0)]];
    float4 m_79 [[user(locn4)]];
    float4 m_73 [[user(locn5)]];
    float4 m_75 [[user(locn6)]];
    float4 m_77 [[user(locn7)]];
    float4 m_81 [[user(locn8)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _93 = gl_FragCoord.w;
    float _95 = in.m_71.x;
    float _97 = gl_FragCoord.w;
    float _99 = _95 * _97;
    float _101 = in.m_71.y;
    float _103 = gl_FragCoord.w;
    float _105 = _101 * _103;
    float _107 = 1.0 / _93;
    float _109 = _107 * _99;
    float _111 = _107 * _105;
    float2 _1536 = float2(_109, _111);
    float2 _115 = dm_bs(spvDescriptorSet0.fp_t_tcb_1A.sample(spvDescriptorSet0.fp_t_tcb_1ASmplr, select(_1536, float2(0.0), isnan(_1536))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_1A, spvDescriptorSet0.fp_t_tcb_1ASmplr_w, select(_1536, float2(0.0), isnan(_1536))).xy;
    float _117 = _115.x;
    float _119 = _115.y;
    int _122 = as_type<int>((*spvDescriptorSet0.fp_c7)._m0[11].z) * as_type<int>((*spvDescriptorSet0.fp_c11)._m0[33].z);
    int _124 = _122 + as_type<int>((*spvDescriptorSet0.fp_c11)._m0[33].w);
    int _126 = _124 * 96;
    int _128 = _126 + 16;
    int _130 = _126 + 24;
    float _132 = in.m_73.y;
    float _134 = gl_FragCoord.w;
    float _136 = _132 * _134;
    float _138 = in.m_73.x;
    float _140 = gl_FragCoord.w;
    float _142 = _138 * _140;
    float _144 = in.m_75.y;
    float _146 = gl_FragCoord.w;
    float _148 = _144 * _146;
    uint _151 = uint(int(uint(_128) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.fp_s0)._m0[int(_151)];
    float _153 = as_type<float>(_dmw0.x);
    int _155 = _128 + 4;
    uint _157 = uint(int(uint(_155) >> uint(2)));
    float _159 = as_type<float>(_dmw0.y);
    float _161 = in.m_73.z;
    float _163 = gl_FragCoord.w;
    float _165 = _161 * _163;
    float _167 = in.m_75.x;
    float _169 = gl_FragCoord.w;
    float _171 = _167 * _169;
    float _173 = in.m_75.z;
    float _175 = gl_FragCoord.w;
    float _177 = _173 * _175;
    uint _179 = uint(int(uint(_130) >> uint(2)));
    float _181 = as_type<float>(_dmw0.z);
    int _183 = _130 + 4;
    uint _185 = uint(int(uint(_183) >> uint(2)));
    float _187 = as_type<float>(_dmw0.w);
    float _189 = in.m_77.y;
    float _191 = gl_FragCoord.w;
    float _193 = _189 * _191;
    float _195 = in.m_77.x;
    float _197 = gl_FragCoord.w;
    float _199 = _195 * _197;
    float _201 = in.m_77.z;
    float _203 = gl_FragCoord.w;
    float _205 = _201 * _203;
    float _207 = in.m_73.w;
    float _209 = gl_FragCoord.w;
    float _211 = _207 * _209;
    float _213 = in.m_79.z;
    float _215 = gl_FragCoord.w;
    float _217 = _213 * _215;
    int _219 = _126 + 80;
    uint _221 = uint(int(uint(_219) >> uint(2)));
    float _223 = as_type<float>((*spvDescriptorSet0.fp_s0)._m0[int(_221)]);
    float _225 = _107 * _136;
    float _227 = _107 * _142;
    float _229 = _107 * _148;
    float _231 = _225 * _225;
    float _233 = _107 * _165;
    float _235 = _107 * _171;
    float _237 = fma(_227, _227, _231);
    float _239 = _229 * _229;
    float _241 = _107 * _177;
    float _243 = fma(_235, _235, _239);
    float _245 = fma(_233, _233, _237);
    float _247 = fma(_241, _241, _243);
    float _249 = _107 * _193;
    float _251 = rsqrt(_245);
    float _253 = _107 * _199;
    float _255 = -(*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _257 = _249 + _255;
    float _259 = rsqrt(_247);
    float _261 = _107 * _205;
    float _263 = -(*spvDescriptorSet0.fp_c4)._m0[11].w;
    float _265 = _253 + _263;
    float _267 = _257 * _257;
    float _269 = -(*spvDescriptorSet0.fp_c4)._m0[13].w;
    float _271 = _261 + _269;
    float _273 = fma(_265, _265, _267);
    float _275 = _233 * _251;
    float _277 = _225 * _251;
    float _279 = fma(_271, _271, _273);
    float _281 = _227 * _251;
    float _283 = _235 * _259;
    float _285 = _241 * _259;
    float _287 = _229 * _259;
    float _289 = _283 * _275;
    float _291 = in.m_79.w;
    float _293 = gl_FragCoord.w;
    float _295 = _291 * _293;
    float _297 = _285 * _277;
    float _299 = sqrt(_279);
    float _301 = _107 * _211;
    float _303 = -_289;
    float _305 = fma(_285, _281, _303);
    float _307 = _287 * _281;
    float _309 = -_297;
    float _311 = fma(_287, _275, _309);
    float _313 = _301 * _305;
    float _315 = -_307;
    float _317 = fma(_283, _277, _315);
    float _319 = _301 * _311;
    float _321 = _313 * _313;
    float _323 = _301 * _317;
    float _325 = fma(_319, _319, _321);
    float _327 = spvFAdd(_299, 9.9999997473787516355514526367188e-06);
    float _329 = fma(_323, _323, _325);
    float _331 = 1.0 / _327;
    float _333 = rsqrt(_329);
    float _335 = _107 * _295;
    float _337 = _107 * _217;
    float _339 = _257 * _331;
    float _341 = _265 * _331;
    float _343 = _271 * _331;
    float _345 = _319 * _333;
    float _347 = fma(_335, _159, _187);
    float _349 = _313 * _333;
    float _351 = _339 * _349;
    float _353 = fma(_341, _345, _351);
    float _355 = _281 * _341;
    float _357 = _323 * _333;
    float _359 = -_339;
    float _361 = -_355;
    float _363 = fma(_277, _359, _361);
    float _365 = fma(_343, _357, _353);
    float _367 = -_343;
    float _369 = fma(_275, _367, _363);
    float _371 = _365 * (-0.5);
    float _373 = _369 * (-0.5);
    float _375 = fma(_109, 2.5, _373);
    float _377 = fma(_111, 2.5, _371);
    float _379 = fma(_117, 0.25, _375);
    float _381 = fma(_119, 0.25, _377);
    float2 _1946 = float2(_379, _381);
    float2 _383 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1946, float2(0.0), isnan(_1946))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_1946, float2(0.0), isnan(_1946))).xy;
    float _385 = _383.x;
    float _387 = _383.y;
    int _389 = as_type<int>(_223) << 6;
    float _391 = fma(_337, _153, _181);
    int _393 = _389 + 25904;
    uint _395 = uint(int(uint(_393) >> uint(2)));
    uint _397 = uint(int(uint(int(_395)) >> uint(2)));
    int _399 = int(_395) & 3;
    float _401 = (*spvDescriptorSet0.fp_c9)._m0[int(_397)][_399];
    int _403 = int(_395) + 1;
    uint _405 = uint(int(uint(_403) >> uint(2)));
    int _407 = _403 & 3;
    float _409 = (*spvDescriptorSet0.fp_c9)._m0[int(_405)][_407];
    int _411 = _389 + 25920;
    uint _413 = uint(int(uint(_411) >> uint(2)));
    uint _415 = uint(int(uint(int(_413)) >> uint(2)));
    int _417 = int(_413) & 3;
    float _419 = (*spvDescriptorSet0.fp_c9)._m0[int(_415)][_417];
    int _421 = int(_413) + 1;
    uint _423 = uint(int(uint(_421) >> uint(2)));
    int _425 = _421 & 3;
    float _427 = (*spvDescriptorSet0.fp_c9)._m0[int(_423)][_425];
    float _429 = _391 * _401;
    float _431 = _347 * _409;
    float _433 = _391 * _419;
    float _435 = _347 * _427;
    float2 _2041;
    _2041.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_429, _431));
    _2041.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_429, _431));
    float _437 = _2041.x;
    float _439 = _437 * 256.0;
    int _441 = int(_439);
    float2 _2052;
    _2052.x = spvDescriptorSet0.fp_t_tcb_C.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_CSmplr, float2(_433, _435));
    _2052.y = spvDescriptorSet0.fp_t_tcb_C.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_CSmplr, float2(_433, _435));
    float _443 = _2052.x;
    float _445 = _443 * 256.0;
    int _447 = int(_445);
    float2 _2061 = float2(_109, _111);
    float _449 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_2061, float2(0.0), isnan(_2061))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_2061, float2(0.0), isnan(_2061))).x;
    int _451 = _126 + 68;
    uint _453 = uint(int(uint(_451) >> uint(2)));
    float _455 = as_type<float>((*spvDescriptorSet0.fp_s0)._m0[int(_453)]);
    float _457 = fma(_387, 2.007874011993408203125, -1.007874011993408203125);
    float _459 = fma(_385, 2.007874011993408203125, -1.007874011993408203125);
    float _461 = _319 * _457;
    float _463 = fma(_281, _459, _461);
    float _465 = -(*spvDescriptorSet0.fp_c9)._m0[26].z;
    float _467 = _261 + _465;
    float _469 = -(*spvDescriptorSet0.fp_c9)._m0[26].x;
    float _471 = _253 + _469;
    float _473 = _467 * _467;
    float _475 = fma(_471, _471, _473);
    float _477 = sqrt(_475);
    bool _481 = _477 > (*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _483 = -(*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _485 = _477 + _483;
    float _487 = _379;
    float _489 = _485;
    float _491 = _353;
    float _493 = _475;
    float _495 = _471;
    if (_481)
    {
        float _497 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _487 = _497;
    }
    float _499 = _487;
    if (_481)
    {
        float _501 = _485 * _499;
        _489 = _501;
    }
    float _503 = _489;
    float _505 = 0.0;
    if (_481)
    {
        float _507 = _503 * 0.15915493667125701904296875;
        _505 = _507;
    }
    float _509 = _505;
    float _511 = _503;
    float _513 = _509;
    if (_481)
    {
        float _515 = _509 * 6.283185482025146484375;
        float _517 = sin(_515);
        _511 = _517;
    }
    float _519 = _511;
    float _521 = _499;
    if (_481)
    {
        float _523 = _509 * 6.283185482025146484375;
        float _525 = cos(_523);
        _521 = _525;
    }
    float _527 = _521;
    float _529 = 0.0;
    if (_481)
    {
        float _531 = rsqrt(_475);
        _529 = _531;
    }
    float _533 = _529;
    if (_481)
    {
        float _535 = _249 + (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _491 = _535;
    }
    float _537 = _491;
    float _539 = _537;
    float _541 = _519;
    if (_481)
    {
        float _543 = fma(_519, _537, (*spvDescriptorSet0.fp_c9)._m0[42].y);
        _539 = _543;
    }
    float _545 = _539;
    float _547 = _545;
    if (_481)
    {
        float _549 = _527 + (-1.0);
        _541 = _549;
    }
    float _551 = _541;
    float _553 = _551;
    if (!_481)
    {
        _493 = _253;
    }
    float _555 = _493;
    float _557 = _533;
    float _559 = _555;
    if (_481)
    {
        float _561 = _533 * _545;
        _557 = _561;
    }
    float _563 = _557;
    if (_481)
    {
        float _565 = _551 * (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _547 = _565;
    }
    float _567 = _547;
    if (!_481)
    {
        _553 = _249;
    }
    float _569 = _553;
    float _571 = _569;
    if (_481)
    {
        float _573 = fma(_249, _527, _567);
        _571 = _573;
    }
    float _575 = _571;
    if (_481)
    {
        float _577 = fma(_471, _563, (*spvDescriptorSet0.fp_c9)._m0[26].x);
        _559 = _577;
    }
    float _579 = _559;
    if (!_481)
    {
        _495 = _261;
    }
    float _581 = _495;
    float _583 = -(*spvDescriptorSet0.fp_c9)._m0[26].y;
    float _585 = _575 + _583;
    float _587 = _581;
    if (_481)
    {
        float _589 = fma(_467, _563, (*spvDescriptorSet0.fp_c9)._m0[26].z);
        _587 = _589;
    }
    float _591 = _587;
    float _593 = -(*spvDescriptorSet0.fp_c9)._m0[26].x;
    float _595 = _579 + _593;
    float _597 = _585 * _585;
    float _599 = -(*spvDescriptorSet0.fp_c9)._m0[26].z;
    float _601 = _591 + _599;
    float _603 = fma(_595, _595, _597);
    float _605 = fma(_601, _601, _603);
    float _607 = rsqrt(_605);
    float _609 = (*spvDescriptorSet0.fp_c9)._m0[26].y + (-220.0);
    float _611 = precise::max(0.0, _609);
    float _613 = _607 * (*spvDescriptorSet0.fp_c9)._m0[26].w;
    float _615 = _595 * _613;
    float _617 = _601 * _613;
    float _619 = -_613;
    float _621 = -_611;
    float _623 = fma(_585, _619, _621);
    float _625 = _615 * _615;
    float _627 = _617 * _617;
    float _629 = _625 + _627;
    float _631 = sqrt(_629);
    bool _633 = _631 > (*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _635 = -(*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _637 = _631 + _635;
    float _639 = _613;
    float _641 = _637;
    float _643 = _615;
    float _645 = _617;
    float _647 = _625;
    float _649 = _623;
    float _651 = _627;
    if (_633)
    {
        float _653 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _639 = _653;
    }
    float _655 = _639;
    float _657 = _655;
    if (_633)
    {
        float _659 = _637 * _655;
        _641 = _659;
    }
    float _661 = _641;
    if (_633)
    {
        float _663 = _661 * 0.15915493667125701904296875;
        _513 = _663;
    }
    float _665 = _513;
    float _667 = _661;
    if (_633)
    {
        float _669 = _665 * 6.283185482025146484375;
        float _671 = sin(_669);
        _667 = _671;
    }
    float _673 = _667;
    if (_633)
    {
        float _675 = _623 + (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _657 = _675;
    }
    float _677 = _657;
    float _679 = _677;
    if (_633)
    {
        float _681 = fma(_673, _677, (*spvDescriptorSet0.fp_c9)._m0[42].y);
        _679 = _681;
    }
    float _683 = _679;
    float _685 = _673;
    if (_633)
    {
        float _687 = rsqrt(_629);
        _685 = _687;
    }
    float _689 = _685;
    float _691 = 0.0;
    float _693 = _689;
    if (_633)
    {
        float _695 = _689 * _683;
        _691 = _695;
    }
    float _697 = _691;
    float _699 = _683;
    if (_633)
    {
        float _701 = _665 * 6.283185482025146484375;
        float _703 = cos(_701);
        _699 = _703;
    }
    float _705 = _699;
    if (_633)
    {
        float _707 = _615 * _697;
        _643 = _707;
    }
    float _709 = _643;
    if (_633)
    {
        float _711 = _617 * _697;
        _645 = _711;
    }
    float _713 = _645;
    if (_633)
    {
        float _715 = _709 * _709;
        _647 = _715;
    }
    float _717 = _647;
    if (_633)
    {
        float _719 = _705 + (-1.0);
        _693 = _719;
    }
    float _721 = _693;
    float _723 = 0.0;
    if (_633)
    {
        float _725 = _721 * (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _723 = _725;
    }
    float _727 = _723;
    if (_633)
    {
        float _729 = fma(_623, _705, _727);
        _649 = _729;
    }
    float _731 = _649;
    if (_633)
    {
        float _733 = _713 * _713;
        _651 = _733;
    }
    float _735 = _651;
    float _737 = fma(_731, _731, _717);
    float _739 = _737 + _735;
    float _741 = _313 * _457;
    float _743 = rsqrt(_739);
    float _745 = fma(_277, _459, _741);
    float _747 = -(*spvDescriptorSet0.fp_c9)._m0[63].y;
    float _749 = fma(_299, (*spvDescriptorSet0.fp_c9)._m0[63].x, _747);
    float _751 = precise::clamp(_749, 0.0, 1.0);
    float _753 = -_751;
    float _755 = _753 + 1.0;
    float _757 = abs(_755);
    float _759 = log2(_757);
    float _761 = _743 * _709;
    float _763 = _743 * _731;
    float _765 = _761 * (*spvDescriptorSet0.fp_c9)._m0[69].x;
    float _767 = _743 * _713;
    float _769 = -_765;
    float _771 = fma(_763, (*spvDescriptorSet0.fp_c9)._m0[69].y, _769);
    float _773 = -_767;
    float _775 = fma(_773, (*spvDescriptorSet0.fp_c9)._m0[69].z, _771);
    float _777 = _759 * (*spvDescriptorSet0.fp_c9)._m0[64].x;
    float _779 = exp2(_777);
    float _781 = _763 + 1.0;
    float _783 = fma(_775, -0.5, 0.5);
    float _785 = sqrt(_783);
    float _787 = -_763;
    float _789 = fma(_779, _781, _787);
    float _791 = fma(_775, 0.5, 0.5);
    float _793 = fma(_789, 0.5, 0.5);
    float _795 = fma(_791, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _797 = fma(_791, _795, -0.212114393711090087890625);
    float _799 = _785 * 0.636619746685028076171875;
    float _801 = fma(_791, _797, 1.570728778839111328125);
    float _803 = -_801;
    float _805 = fma(_799, _803, 1.0);
    float _807 = _323 * _457;
    float _809 = _457 * _457;
    float _811 = fma(_459, _459, _809);
    float _813 = -_811;
    float _815 = _813 + 1.0;
    float _817 = precise::clamp(_815, 0.0, 1.0);
    float _819 = sqrt(_817);
    float _821 = fma(_275, _459, _807);
    float _823 = _287 * _339;
    float _825 = fma(_283, _341, _823);
    float _827 = fma(_287, _819, _745);
    float _829 = fma(_283, _819, _463);
    float _831 = _827 * _827;
    float _833 = fma(_285, _343, _825);
    float _835 = fma(_285, _819, _821);
    float _837 = fma(_829, _829, _831);
    float _839 = fma(_835, _835, _837);
    int _841 = _389 + 25936;
    uint _843 = uint(int(uint(_841) >> uint(2)));
    uint _845 = uint(int(uint(int(_843)) >> uint(2)));
    int _847 = int(_843) & 3;
    float _849 = (*spvDescriptorSet0.fp_c9)._m0[int(_845)][_847];
    float _851 = rsqrt(_839);
    int _853 = _389 + 25944;
    uint _855 = uint(int(uint(_853) >> uint(2)));
    uint _857 = uint(int(uint(int(_855)) >> uint(2)));
    int _859 = int(_855) & 3;
    float _861 = (*spvDescriptorSet0.fp_c9)._m0[int(_857)][_859];
    float _863 = _827 * _851;
    float _865 = _829 * _851;
    float _867 = _339 * _863;
    float _869 = _835 * _851;
    float _871 = fma(_341, _865, _867);
    float _873 = precise::max(_455, _849);
    float _875 = precise::max(_455, _861);
    float _877 = float(uint(_441));
    float _879 = in.m_71.z;
    float _881 = gl_FragCoord.w;
    float _883 = _879 * _881;
    float _885 = fma(_343, _869, _871);
    float _887 = in.m_71.w;
    float _889 = gl_FragCoord.w;
    float _891 = _887 * _889;
    float _893 = fma((*spvDescriptorSet0.fp_c9)._m0[983].y, 0.416750013828277587890625, _449);
    float _895 = _877 * 0.00390625;
    float _897 = fma((*spvDescriptorSet0.fp_c9)._m0[983].y, 1.6670000553131103515625, _111);
    int _899 = _389 + 25952;
    uint _901 = uint(int(uint(_899) >> uint(2)));
    uint _903 = uint(int(uint(int(_901)) >> uint(2)));
    int _905 = int(_901) & 3;
    float _907 = (*spvDescriptorSet0.fp_c9)._m0[int(_903)][_905];
    float _909 = precise::max(_873, _895);
    float _911 = fma(_369, -0.25, _109);
    float _913 = fma(_365, -0.25, _897);
    float2 _2790 = float2(_911, _913);
    float _915 = dm_bs(spvDescriptorSet0.fp_t_tcb_16.sample(spvDescriptorSet0.fp_t_tcb_16Smplr, select(_2790, float2(0.0), isnan(_2790))), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_16, spvDescriptorSet0.fp_t_tcb_16Smplr_w, select(_2790, float2(0.0), isnan(_2790))).x;
    float2 _2798 = float2(_109, _897);
    float _917 = dm_bs(spvDescriptorSet0.fp_t_tcb_14.sample(spvDescriptorSet0.fp_t_tcb_14Smplr, select(_2798, float2(0.0), isnan(_2798))), spvDescriptorSet0.dm_border, 6u, spvDescriptorSet0.fp_t_tcb_14, spvDescriptorSet0.fp_t_tcb_14Smplr_w, select(_2798, float2(0.0), isnan(_2798))).x;
    float _919 = float(uint(_447));
    float _921 = _919 * 0.00390625;
    float _923 = fma((*spvDescriptorSet0.fp_c9)._m0[983].y, 0.416750013828277587890625, _885);
    float _925 = precise::max(_875, _921);
    float _927 = rint(_907);
    float _929 = precise::max(_927, 0.0);
    uint _931 = uint(_929);
    uint _933 = clamp(_931, 0u, 65535u);
    float _935 = _107 * _883;
    float _937 = _833 + _893;
    float _939 = fma((*spvDescriptorSet0.fp_c9)._m0[983].y, 6.66800022125244140625, _111);
    float _941 = _107 * _891;
    float2 _2842 = float2(_935, _941);
    float3 _945 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_2842, float2(0.0), isnan(_2842))), spvDescriptorSet0.dm_border, 7u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_2842, float2(0.0), isnan(_2842))).xyz;
    float _947 = _945.x;
    float _949 = _945.y;
    float _951 = _945.z;
    float2 _2855 = float2(_923, 0.0);
    float3 _953 = dm_bs(spvDescriptorSet0.fp_t_tcb_18.sample(spvDescriptorSet0.fp_t_tcb_18Smplr, select(_2855, float2(0.0), isnan(_2855))), spvDescriptorSet0.dm_border, 8u, spvDescriptorSet0.fp_t_tcb_18, spvDescriptorSet0.fp_t_tcb_18Smplr_w, select(_2855, float2(0.0), isnan(_2855))).xyz;
    float _955 = _953.x;
    float _957 = _953.y;
    float _959 = _953.z;
    float2 _2869 = float2(_109, _939);
    float _961 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_2869, float2(0.0), isnan(_2869))), spvDescriptorSet0.dm_border, 9u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_2869, float2(0.0), isnan(_2869))).y;
    float2 _2877 = float2(_805, _793);
    float3 _963 = dm_bs(spvDescriptorSet0.fp_t_tcb_22.sample(spvDescriptorSet0.fp_t_tcb_22Smplr, select(_2877, float2(0.0), isnan(_2877))), spvDescriptorSet0.dm_border, 10u, spvDescriptorSet0.fp_t_tcb_22, spvDescriptorSet0.fp_t_tcb_22Smplr_w, select(_2877, float2(0.0), isnan(_2877))).xyz;
    float _965 = _963.x;
    float _967 = _963.y;
    float _969 = _963.z;
    float3 _2894 = float3(_429, _431, float(int(_933)));
    float3 _2898 = select(_2894, float3(0.0), isnan(_2894));
    float _971 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _2898.xy, uint(rint(_2898.z)), level(_909)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _2898.xy, uint(rint(_2898.z)), level(_909)).z;
    float2 _2904 = float2(_937, 0.0);
    float3 _973 = dm_bs(spvDescriptorSet0.fp_t_tcb_1C.sample(spvDescriptorSet0.fp_t_tcb_1CSmplr, select(_2904, float2(0.0), isnan(_2904))), spvDescriptorSet0.dm_border, 11u, spvDescriptorSet0.fp_t_tcb_1C, spvDescriptorSet0.fp_t_tcb_1CSmplr_w, select(_2904, float2(0.0), isnan(_2904))).xyz;
    float _975 = _973.x;
    float _977 = _973.y;
    float _979 = _973.z;
    float3 _2921 = float3(_433, _435, float(int(_933)));
    float3 _2923 = select(_2921, float3(0.0), isnan(_2921));
    float3 _981 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, _2923.xy, uint(rint(_2923.z)), level(_925)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, _2923.xy, uint(rint(_2923.z)), level(_925)).xyz;
    float _983 = _981.x;
    float _985 = _981.y;
    float _987 = _981.z;
    float _989 = _339 * (*spvDescriptorSet0.fp_c9)._m0[69].y;
    float _991 = _249 * (*spvDescriptorSet0.fp_c9)._m0[1117].y;
    float _993 = fma(_341, (*spvDescriptorSet0.fp_c9)._m0[69].x, _989);
    float _995 = _249 * (*spvDescriptorSet0.fp_c9)._m0[1118].y;
    float _997 = fma(_253, (*spvDescriptorSet0.fp_c9)._m0[1117].x, _991);
    float _999 = fma(_253, (*spvDescriptorSet0.fp_c9)._m0[1118].x, _995);
    float _1001 = fma(_261, (*spvDescriptorSet0.fp_c9)._m0[1117].z, _997);
    float _1003 = fma(_261, (*spvDescriptorSet0.fp_c9)._m0[1118].z, _999);
    float _1005 = _1001 + (*spvDescriptorSet0.fp_c9)._m0[1117].w;
    float _1007 = _1003 + (*spvDescriptorSet0.fp_c9)._m0[1118].w;
    float _1009 = fma(_343, (*spvDescriptorSet0.fp_c9)._m0[69].z, _993);
    float _1011 = trunc(_1005);
    int _1013 = int(_1011);
    float _1015 = trunc(_1007);
    int _1017 = int(_1015);
    float _1019 = in.m_81.w;
    float _1021 = gl_FragCoord.w;
    float _1023 = _1019 * _1021;
    int _1025 = ~as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].y);
    int _1027 = _1013 + _1025;
    int _1029 = _1027 + 1;
    bool _1031 = _1029 >= as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].x);
    float _1033 = _107 * _1023;
    float _1035 = _915 * 0.25;
    float _1037 = precise::max(_917, _1035);
    int _1039 = ~as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].z);
    int _1041 = _1017 + _1039;
    int _1043 = _1041 + 1;
    int _1045 = _1029 | _1043;
    bool _1047 = _1045 < 0;
    bool _1049 = _1047 || _1031;
    bool _1051 = _1043 >= as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].x);
    bool _1053 = _1051 || _1049;
    float _1055 = fma(_955, 0.125, _947);
    float _1057 = _955 + _1037;
    float _1059 = fma(_957, 0.125, _949);
    float _1061 = fma(_959, 0.125, _951);
    float _1063 = _957 + _1037;
    float _1065 = fma(_1037, _1057, _1055);
    float _1067 = _959 + _1037;
    float _1069 = _947;
    if (_1053)
    {
        _1069 = (*spvDescriptorSet0.fp_c9)._m0[42].x;
    }
    float _1071 = _1069;
    float _1073 = fma(_1037, _1063, _1059);
    float _1075 = fma(_1037, _1067, _1061);
    float _1077 = _1071;
    if (!_1053)
    {
        int _1079 = _1043 * as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].x);
        int _1081 = _1079 + _1029;
        float _1083 = floor(_1007);
        int _1085 = _1081 << 2;
        int _1087 = _1081 >> 2;
        int _1089 = 12 & _1085;
        int _1091 = _1087 << 4;
        int _1093 = _1091 + _1089;
        float _1095 = floor(_1005);
        int _1097 = _1093 + 16256;
        uint _1099 = uint(int(uint(_1097) >> uint(2)));
        uint _1101 = uint(int(uint(int(_1099)) >> uint(2)));
        int _1103 = int(_1099) & 3;
        float _1105 = (*spvDescriptorSet0.fp_c9)._m0[int(_1101)][_1103];
        float _1107 = -_1083;
        float _1109 = _1007 + _1107;
        float _1111 = -_1095;
        float _1113 = _1005 + _1111;
        float _1115 = rint(_1105);
        float _1117 = precise::max(_1115, 0.0);
        uint _1119 = uint(_1117);
        uint _1121 = clamp(_1119, 0u, 65535u);
        float3 _3155 = float3(_1113, _1109, float(int(_1121)));
        float3 _3157 = select(_3155, float3(0.0), isnan(_3155));
        float _1123 = dm_bs(spvDescriptorSet0.fp_t_tcb_20.sample(spvDescriptorSet0.fp_t_tcb_20Smplr, _3157.xy, uint(rint(_3157.z))), spvDescriptorSet0.dm_border, 12u, spvDescriptorSet0.fp_t_tcb_20, spvDescriptorSet0.fp_t_tcb_20Smplr_w, _3157.xy, uint(rint(_3157.z))).x;
        int _1125 = _1081 << 4;
        int _1127 = _1125 + 17904;
        int _1129 = _1093 + 24304;
        uint _1131 = uint(int(uint(_1129) >> uint(2)));
        uint _1133 = uint(int(uint(int(_1131)) >> uint(2)));
        int _1135 = int(_1131) & 3;
        float _1137 = (*spvDescriptorSet0.fp_c9)._m0[int(_1133)][_1135];
        uint _1139 = uint(int(uint(_1127) >> uint(2)));
        uint _1141 = uint(int(uint(int(_1139)) >> uint(2)));
        int _1143 = int(_1139) & 3;
        float _1145 = (*spvDescriptorSet0.fp_c9)._m0[int(_1141)][_1143];
        int _1147 = int(_1139) + 1;
        uint _1149 = uint(int(uint(_1147) >> uint(2)));
        int _1151 = _1147 & 3;
        float _1153 = (*spvDescriptorSet0.fp_c9)._m0[int(_1149)][_1151];
        int _1155 = _1127 + 8;
        uint _1157 = uint(int(uint(_1155) >> uint(2)));
        uint _1159 = uint(int(uint(int(_1157)) >> uint(2)));
        int _1161 = int(_1157) & 3;
        float _1163 = (*spvDescriptorSet0.fp_c9)._m0[int(_1159)][_1161];
        int _1165 = int(_1157) + 1;
        uint _1167 = uint(int(uint(_1165) >> uint(2)));
        int _1169 = _1165 & 3;
        float _1171 = (*spvDescriptorSet0.fp_c9)._m0[int(_1167)][_1169];
        float _1173 = _249 * _1153;
        float _1175 = fma(_253, _1145, _1173);
        float _1177 = 1.0 / _1137;
        float _1179 = fma(_261, _1163, _1175);
        float _1181 = _1179 + _1171;
        float _1183 = precise::clamp(_1181, 0.0, 1.0);
        float _1185 = _1137 * (*spvDescriptorSet0.fp_c13)._m0[4].z;
        float _1187 = -_1183;
        float _1189 = _1187 + _1123;
        float _1191 = fma(_1177, (*spvDescriptorSet0.fp_c13)._m0[4].w, _1189);
        float _1193 = _1185 * _1191;
        float _1195 = exp2(_1193);
        float _1197 = 0.0 + _1195;
        float _1199 = precise::clamp(_1197, 0.0, 1.0);
        float _1201 = precise::min(_1199, (*spvDescriptorSet0.fp_c9)._m0[42].x);
        _1077 = _1201;
    }
    float _1203 = _1077;
    float _1205 = abs(_257);
    bool _1207 = _1205 > 0.00999999977648258209228515625;
    float _1209 = -_1033;
    float _1211 = -(*spvDescriptorSet0.fp_c9)._m0[41].z;
    float _1213 = _1209 + _1211;
    float _1215 = -_1203;
    float _1217 = _1215 + 1.0;
    float _1219 = fma(_961, _955, _1065);
    float _1221 = _1207 ? _257 : 0.00999999977648258209228515625;
    float _1223 = _1213 * (*spvDescriptorSet0.fp_c9)._m0[41].w;
    float _1225 = precise::clamp(_1223, 0.0, 1.0);
    float _1227 = (*spvDescriptorSet0.fp_c9)._m0[66].x * (*spvDescriptorSet0.fp_c9)._m0[66].y;
    float _1229 = in.m_81.y;
    float _1231 = gl_FragCoord.w;
    float _1233 = _1229 * _1231;
    float _1235 = _1221 * (*spvDescriptorSet0.fp_c9)._m0[66].x;
    float _1237 = fma(_1225, _1217, _1203);
    float _1239 = fma(_1009, 2.0, (*spvDescriptorSet0.fp_c9)._m0[66].z);
    float _1241 = in.m_81.x;
    float _1243 = gl_FragCoord.w;
    float _1245 = _1241 * _1243;
    float _1247 = -_1227;
    float _1249 = exp2(_1247);
    float _1251 = precise::max(_1235, -127.0);
    float _1253 = fma(_1239, (*spvDescriptorSet0.fp_c9)._m0[66].z, 1.0);
    float _1255 = in.m_81.z;
    float _1257 = gl_FragCoord.w;
    float _1259 = _1255 * _1257;
    float _1261 = fma(_961, _957, _1073);
    float _1263 = fma(_961, _959, _1075);
    float _1265 = -(*spvDescriptorSet0.fp_c9)._m0[66].z;
    float _1267 = fma(_1265, (*spvDescriptorSet0.fp_c9)._m0[66].z, 1.0);
    float _1269 = -_1251;
    float _1271 = exp2(_1269);
    float _1273 = _985 * 0.4774648249149322509765625;
    float _1275 = _983 * 0.4774648249149322509765625;
    float _1277 = _987 * 0.4774648249149322509765625;
    float _1279 = precise::min(_1237, (*spvDescriptorSet0.fp_c9)._m0[62].x);
    float _1281 = _977 * 0.0452399961650371551513671875;
    float _1283 = _975 * 0.0452399961650371551513671875;
    float _1285 = _979 * 0.0452399961650371551513671875;
    float _1287 = 1.0 / _1251;
    float _1289 = abs(_1253);
    float _1291 = log2(_1289);
    float _1293 = -_1271;
    float _1295 = _1293 + 1.0;
    float _1297 = _759 * (*spvDescriptorSet0.fp_c9)._m0[64].y;
    float _1299 = _107 * _1233;
    float _1301 = _1249 * _1295;
    float _1303 = _107 * _1245;
    float _1305 = _971 * 0.2820948064327239990234375;
    float _1307 = _1301 * _1287;
    float _1309 = exp2(_1297);
    float _1311 = _107 * _1259;
    float _1313 = _1305 * (*spvDescriptorSet0.fp_c9)._m0[991].x;
    float _1315 = _1291 * 1.5;
    float _1317 = _1261 * 0.17880000174045562744140625;
    float _1319 = fma(_1275, (*spvDescriptorSet0.fp_c9)._m0[68].x, _1313);
    float _1321 = fma(_1219, 0.053149998188018798828125, _1317);
    float _1323 = exp2(_1315);
    float _1325 = _1299 * 0.18672408163547515869140625;
    float _1327 = (*spvDescriptorSet0.fp_c9)._m0[39].y + (*spvDescriptorSet0.fp_c9)._m0[39].x;
    float _1329 = -_1309;
    float _1331 = _1329 + 1.0;
    float _1333 = fma(_1303, 0.095146648585796356201171875, _1325);
    float _1335 = _1331 * (*spvDescriptorSet0.fp_c9)._m0[64].z;
    float _1337 = _1323 * 12.56637096405029296875;
    float _1339 = fma(_1263, 0.01805000007152557373046875, _1321);
    float _1341 = 1.0 / _1337;
    float _1343 = 1.0 / _1339;
    float _1345 = _1267 * _1341;
    float _1347 = fma(_1311, 0.0364394821226596832275390625, _1333);
    float _1349 = _299 * (*spvDescriptorSet0.fp_c9)._m0[65].w;
    float _1351 = _1305 * (*spvDescriptorSet0.fp_c9)._m0[991].z;
    float _1353 = precise::max(_1347, 0.00999999977648258209228515625);
    float _1355 = _1307 * _1349;
    float _1357 = _1305 * (*spvDescriptorSet0.fp_c9)._m0[991].y;
    float _1359 = fma(_1277, (*spvDescriptorSet0.fp_c9)._m0[68].z, _1351);
    float _1361 = -_1355;
    float _1363 = exp2(_1361);
    float _1365 = fma(_1273, (*spvDescriptorSet0.fp_c9)._m0[68].y, _1357);
    float _1367 = _1343 * (*spvDescriptorSet0.fp_c9)._m0[39].z;
    float _1369 = _1365 * 0.586610972881317138671875;
    float _1371 = _1327 * _1367;
    float _1373 = precise::clamp(_1371, 0.0, 1.0);
    float _1375 = 1.0 / _1353;
    float _1377 = fma(_1319, 0.298911988735198974609375, _1369);
    float _1379 = fma(_1373, (*spvDescriptorSet0.fp_c9)._m0[40].y, (*spvDescriptorSet0.fp_c9)._m0[40].x);
    float _1381 = -_1335;
    float _1383 = _1381 + 1.0;
    float _1385 = fma(_1359, 0.114477999508380889892578125, _1377);
    float _1387 = precise::min(_1367, _1379);
    float _1389 = -_1363;
    float _1391 = _1389 + 1.0;
    float _1393 = _1391 * _1345;
    float _1395 = _1387 * (*spvDescriptorSet0.fp_c9)._m0[39].y;
    float _1397 = _1385 * _1375;
    float _1399 = _1279 * _1393;
    float _1401 = fma(_1379, (*spvDescriptorSet0.fp_c9)._m0[39].x, _1395);
    float _1403 = _1335 * _1363;
    float _1405 = _1363 * _1383;
    float _1407 = precise::min(_1397, (*spvDescriptorSet0.fp_c9)._m0[27].w);
    float _1409 = _1219 * _1401;
    float _1411 = _1409 * 0.25;
    float _1413 = _1261 * _1401;
    float _1415 = _1413 * 0.25;
    float _1417 = _1263 * _1401;
    float _1419 = _1417 * 0.25;
    float _1421 = _1399 * (*spvDescriptorSet0.fp_c9)._m0[70].x;
    float _1423 = _1407 * 0.31830990314483642578125;
    float _1425 = _1399 * (*spvDescriptorSet0.fp_c9)._m0[70].y;
    float _1427 = _1411 * (*spvDescriptorSet0.fp_c11)._m0[35].x;
    float _1429 = fma(_965, _1403, _1421);
    float _1431 = _1299 * _1423;
    float _1433 = _1303 * _1423;
    float _1435 = _1311 * _1423;
    float _1437 = fma(_967, _1403, _1425);
    float _1439 = _1281 * _1431;
    float _1441 = _1283 * _1433;
    float _1443 = _1399 * (*spvDescriptorSet0.fp_c9)._m0[70].z;
    float _1445 = _1415 * (*spvDescriptorSet0.fp_c11)._m0[35].x;
    float _1447 = _1419 * (*spvDescriptorSet0.fp_c11)._m0[35].x;
    float _1449 = precise::max(0.0, _1439);
    float _1451 = _1285 * _1435;
    float _1453 = precise::max(0.0, _1441);
    float _1455 = fma(_969, _1403, _1443);
    float _1457 = -(*spvDescriptorSet0.fp_c9)._m0[48].x;
    float _1459 = _299 + _1457;
    float _1461 = fma(_1405, _1449, _1437);
    float _1463 = precise::max(0.0, _1427);
    float _1465 = -(*spvDescriptorSet0.fp_c9)._m0[48].z;
    float _1467 = _299 + _1465;
    float _1469 = precise::max(0.0, _1445);
    float _1471 = fma(_1405, _1453, _1429);
    float _1473 = precise::max(0.0, _1447);
    float _1475 = _1459 * (*spvDescriptorSet0.fp_c9)._m0[48].y;
    float _1477 = precise::clamp(_1475, 0.0, 1.0);
    float _1479 = precise::max(0.0, _1451);
    float _1481 = _1405 * _1463;
    float _1483 = _1467 * (*spvDescriptorSet0.fp_c9)._m0[48].w;
    float _1485 = precise::clamp(_1483, 0.0, 1.0);
    float _1487 = _1405 * _1469;
    float _1489 = _1405 * _1473;
    float _1491 = fma(_1405, _1479, _1455);
    float _1493 = fma(_1477, _1481, _1471);
    float _1495 = fma(_1485, _1481, _1471);
    float _1497 = fma(_1477, _1487, _1461);
    float _1499 = fma(_1485, _1487, _1461);
    float _1501 = fma(_1477, _1489, _1491);
    float _1503 = fma(_1485, _1489, _1491);
    out.m_84.x = _1493;
    out.m_84.y = _1497;
    out.m_84.z = _1501;
    out.m_84.w = 1.0;
    out.m_86.x = _1495;
    out.m_86.y = _1499;
    out.m_86.z = _1503;
    out.m_86.w = 1.0;
    return out;
}

