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
    constant _16* fp_c7 [[id(0)]];
    constant _16* fp_c11 [[id(1)]];
    constant _16* fp_c9 [[id(2)]];
    constant _16* fp_c4 [[id(3)]];
    constant _16* fp_c13 [[id(4)]];
    const device _31* fp_s0 [[id(5)]];
    texture2d<float> fp_t_tcb_10 [[id(6)]];
    sampler fp_t_tcb_10Smplr [[id(7)]];
    texture2d_array<float> fp_t_tcb_8 [[id(8)]];
    sampler fp_t_tcb_8Smplr [[id(9)]];
    texture2d<float> fp_t_tcb_14 [[id(10)]];
    sampler fp_t_tcb_14Smplr [[id(11)]];
    texture2d_array<float> fp_t_tcb_C [[id(12)]];
    sampler fp_t_tcb_CSmplr [[id(13)]];
    texture2d<float> fp_t_tcb_1A [[id(14)]];
    sampler fp_t_tcb_1ASmplr [[id(15)]];
    texture2d<float> fp_t_tcb_16 [[id(16)]];
    sampler fp_t_tcb_16Smplr [[id(17)]];
    texture2d<float> fp_t_tcb_12 [[id(18)]];
    sampler fp_t_tcb_12Smplr [[id(19)]];
    texture2d_array<float> fp_t_tcb_18 [[id(20)]];
    sampler fp_t_tcb_18Smplr [[id(21)]];
    sampler fp_t_tcb_10Smplr_w [[id(22)]];
    sampler fp_t_tcb_8Smplr_w [[id(23)]];
    sampler fp_t_tcb_14Smplr_w [[id(24)]];
    sampler fp_t_tcb_CSmplr_w [[id(25)]];
    sampler fp_t_tcb_1ASmplr_w [[id(26)]];
    sampler fp_t_tcb_16Smplr_w [[id(27)]];
    sampler fp_t_tcb_12Smplr_w [[id(28)]];
    sampler fp_t_tcb_18Smplr_w [[id(29)]];
    constant dm_border_t* dm_border [[id(30)]];
};

struct main0_out
{
    float4 m_74 [[color(0)]];
    float4 m_76 [[color(1)]];
};

struct main0_in
{
    float4 m_61 [[user(locn0)]];
    float4 m_63 [[user(locn4)]];
    float4 m_69 [[user(locn5)]];
    float4 m_67 [[user(locn6)]];
    float4 m_65 [[user(locn7)]];
    float4 m_71 [[user(locn8)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    int _83 = as_type<int>((*spvDescriptorSet0.fp_c7)._m0[11].z) * as_type<int>((*spvDescriptorSet0.fp_c11)._m0[33].z);
    int _85 = _83 + as_type<int>((*spvDescriptorSet0.fp_c11)._m0[33].w);
    int _87 = _85 * 96;
    int _89 = _87 + 80;
    uint _92 = uint(int(uint(_89) >> uint(2)));
    float _95 = as_type<float>((*spvDescriptorSet0.fp_s0)._m0[int(_92)]);
    int _97 = _87 + 16;
    int _99 = _87 + 24;
    int _101 = _87 + 8;
    uint _103 = uint(int(uint(_87) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.fp_s0)._m0[int(_103)];
    float _105 = as_type<float>(_dmw0.x);
    int _107 = _87 + 4;
    uint _109 = uint(int(uint(_107) >> uint(2)));
    float _111 = as_type<float>(_dmw0.y);
    uint _113 = uint(int(uint(_97) >> uint(2)));
    packed_uint4 _dmw1 = *(const device packed_uint4*)&(*spvDescriptorSet0.fp_s0)._m0[int(_113)];
    float _115 = as_type<float>(_dmw1.x);
    int _117 = _97 + 4;
    uint _119 = uint(int(uint(_117) >> uint(2)));
    float _121 = as_type<float>(_dmw1.y);
    uint _123 = uint(int(uint(_99) >> uint(2)));
    float _125 = as_type<float>(_dmw1.z);
    int _127 = _99 + 4;
    uint _129 = uint(int(uint(_127) >> uint(2)));
    float _131 = as_type<float>(_dmw1.w);
    uint _133 = uint(int(uint(_101) >> uint(2)));
    float _135 = as_type<float>(_dmw0.z);
    int _137 = _101 + 4;
    uint _139 = uint(int(uint(_137) >> uint(2)));
    float _141 = as_type<float>(_dmw0.w);
    float _143 = gl_FragCoord.w;
    float _145 = in.m_61.x;
    float _147 = gl_FragCoord.w;
    float _149 = _145 * _147;
    float _151 = in.m_61.y;
    float _153 = gl_FragCoord.w;
    float _155 = _151 * _153;
    float _157 = in.m_63.z;
    float _159 = gl_FragCoord.w;
    float _161 = _157 * _159;
    float _163 = in.m_63.w;
    float _165 = gl_FragCoord.w;
    float _167 = _163 * _165;
    float _169 = (*spvDescriptorSet0.fp_c9)._m0[983].y * 0.0625;
    float _171 = 1.0 / _143;
    float _173 = (*spvDescriptorSet0.fp_c9)._m0[983].y * 0.75;
    float _175 = _171 * _149;
    float _177 = _171 * _155;
    float _179 = _175 + _169;
    float _181 = -_169;
    float _183 = fma(_175, 0.75, _181);
    float _185 = _177 + _169;
    float _187 = -_169;
    float _189 = fma(_177, 0.75, _187);
    float _191 = _171 * _161;
    float _193 = _171 * _167;
    float _195 = -_173;
    float _197 = fma(_195, (*spvDescriptorSet0.fp_c11)._m0[40].z, _185);
    float2 _1958 = float2(_179, _197);
    float2 _201 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1958, float2(0.0), isnan(_1958))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_1958, float2(0.0), isnan(_1958))).xy;
    float _203 = _201.x;
    float _205 = _201.y;
    float _207 = -_173;
    float _209 = fma(_207, (*spvDescriptorSet0.fp_c11)._m0[40].z, _189);
    int _211 = as_type<int>(_95) << 6;
    float _213 = fma(_191, _115, _125);
    float _215 = fma(_193, _121, _131);
    float _217 = fma(_191, _105, _135);
    float _219 = fma(_193, _111, _141);
    int _221 = _211 + 25904;
    uint _223 = uint(int(uint(_221) >> uint(2)));
    uint _225 = uint(int(uint(int(_223)) >> uint(2)));
    int _227 = int(_223) & 3;
    float _229 = (*spvDescriptorSet0.fp_c9)._m0[int(_225)][_227];
    int _231 = int(_223) + 1;
    uint _233 = uint(int(uint(_231) >> uint(2)));
    int _235 = _231 & 3;
    float _237 = (*spvDescriptorSet0.fp_c9)._m0[int(_233)][_235];
    int _239 = _211 + 25920;
    uint _241 = uint(int(uint(_239) >> uint(2)));
    uint _243 = uint(int(uint(int(_241)) >> uint(2)));
    int _245 = int(_241) & 3;
    float _247 = (*spvDescriptorSet0.fp_c9)._m0[int(_243)][_245];
    int _249 = int(_241) + 1;
    uint _251 = uint(int(uint(_249) >> uint(2)));
    int _253 = _249 & 3;
    float _255 = (*spvDescriptorSet0.fp_c9)._m0[int(_251)][_253];
    float _257 = _213 * _229;
    float _259 = _215 * _237;
    float _261 = _213 * _247;
    float _263 = _215 * _255;
    float _265 = _217 * _229;
    float _267 = _219 * _237;
    float2 _2081;
    _2081.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_257, _259));
    _2081.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_257, _259));
    float _269 = _2081.x;
    float _271 = _269 * 256.0;
    int _273 = int(_271);
    float2 _2091 = float2(_183, _209);
    float2 _275 = dm_bs(spvDescriptorSet0.fp_t_tcb_14.sample(spvDescriptorSet0.fp_t_tcb_14Smplr, select(_2091, float2(0.0), isnan(_2091))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_14, spvDescriptorSet0.fp_t_tcb_14Smplr_w, select(_2091, float2(0.0), isnan(_2091))).xy;
    float _277 = _275.x;
    float _279 = _275.y;
    float2 _2104;
    _2104.x = spvDescriptorSet0.fp_t_tcb_C.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_CSmplr, float2(_261, _263));
    _2104.y = spvDescriptorSet0.fp_t_tcb_C.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_CSmplr, float2(_261, _263));
    float _281 = _2104.x;
    float _283 = _281 * 256.0;
    int _285 = int(_283);
    float2 _2114;
    _2114.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_265, _267));
    _2114.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_265, _267));
    float _287 = _2114.x;
    float _289 = _287 * 256.0;
    int _291 = int(_289);
    float _293 = in.m_65.z;
    float _295 = gl_FragCoord.w;
    float _297 = _293 * _295;
    float _299 = in.m_65.x;
    float _301 = gl_FragCoord.w;
    float _303 = _299 * _301;
    int _305 = _87 + 68;
    int _307 = _87 + 64;
    float _309 = _171 * _297;
    float _311 = _171 * _303;
    float _313 = -(*spvDescriptorSet0.fp_c9)._m0[26].z;
    float _315 = _309 + _313;
    uint _317 = uint(int(uint(_305) >> uint(2)));
    float _319 = as_type<float>((*spvDescriptorSet0.fp_s0)._m0[int(_317)]);
    float _321 = -(*spvDescriptorSet0.fp_c9)._m0[26].x;
    float _323 = _311 + _321;
    float _325 = _315 * _315;
    float _327 = fma(_323, _323, _325);
    uint _329 = uint(int(uint(_307) >> uint(2)));
    float _331 = as_type<float>((*spvDescriptorSet0.fp_s0)._m0[int(_329)]);
    float _333 = sqrt(_327);
    bool _337 = _333 > (*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _339 = in.m_65.y;
    float _341 = gl_FragCoord.w;
    float _343 = _339 * _341;
    float _345 = _183;
    float _347 = _209;
    if (_337)
    {
        float _349 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _345 = _349;
    }
    float _351 = _345;
    float _353 = -(*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _355 = _333 + _353;
    float _357 = _355;
    if (_337)
    {
        float _359 = _355 * _351;
        _357 = _359;
    }
    float _361 = _357;
    float _363 = 0.0;
    if (_337)
    {
        float _365 = _361 * 0.15915493667125701904296875;
        _363 = _365;
    }
    float _367 = _363;
    float _369 = _361;
    float _371 = _367;
    if (_337)
    {
        float _373 = _367 * 6.283185482025146484375;
        float _375 = cos(_373);
        _369 = _375;
    }
    float _377 = _369;
    float _379 = _351;
    if (_337)
    {
        float _381 = _367 * 6.283185482025146484375;
        float _383 = sin(_381);
        _379 = _383;
    }
    float _385 = _379;
    float _387 = _171 * _343;
    float _389 = _327;
    if (_337)
    {
        float _391 = rsqrt(_327);
        _389 = _391;
    }
    float _393 = _389;
    if (_337)
    {
        float _395 = _387 + (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _347 = _395;
    }
    float _397 = _347;
    float _399 = 0.0;
    float _401 = _397;
    float _403 = _377;
    if (_337)
    {
        float _405 = _377 + (-1.0);
        _399 = _405;
    }
    float _407 = _399;
    float _409 = _407;
    if (_337)
    {
        float _411 = _407 * (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _409 = _411;
    }
    float _413 = _409;
    float _415 = 0.0;
    float _417 = _385;
    if (_337)
    {
        float _419 = fma(_385, _397, (*spvDescriptorSet0.fp_c9)._m0[42].y);
        _415 = _419;
    }
    float _421 = _415;
    float _423 = _421;
    if (!_337)
    {
        _417 = _387;
    }
    float _425 = _417;
    float _427 = _425;
    if (_337)
    {
        float _429 = fma(_387, _377, _413);
        _427 = _429;
    }
    float _431 = _427;
    if (!_337)
    {
        _401 = _311;
    }
    float _433 = _401;
    float _435 = _433;
    if (_337)
    {
        float _437 = _393 * _421;
        _423 = _437;
    }
    float _439 = _423;
    if (_337)
    {
        float _441 = fma(_323, _439, (*spvDescriptorSet0.fp_c9)._m0[26].x);
        _435 = _441;
    }
    float _443 = _435;
    float _445 = -(*spvDescriptorSet0.fp_c9)._m0[26].y;
    float _447 = _431 + _445;
    if (!_337)
    {
        _403 = _309;
    }
    float _449 = _403;
    float _451 = _449;
    if (_337)
    {
        float _453 = fma(_315, _439, (*spvDescriptorSet0.fp_c9)._m0[26].z);
        _451 = _453;
    }
    float _455 = _451;
    float _457 = -(*spvDescriptorSet0.fp_c9)._m0[26].x;
    float _459 = _443 + _457;
    float _461 = _447 * _447;
    float _463 = -(*spvDescriptorSet0.fp_c9)._m0[26].z;
    float _465 = _455 + _463;
    float _467 = fma(_459, _459, _461);
    float _469 = fma(_465, _465, _467);
    float _471 = rsqrt(_469);
    float _473 = _471 * (*spvDescriptorSet0.fp_c9)._m0[26].w;
    float _475 = _459 * _473;
    float _477 = _465 * _473;
    float _479 = _475 * _475;
    float _481 = _477 * _477;
    float _483 = _479 + _481;
    float _485 = sqrt(_483);
    bool _487 = _485 > (*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _489 = -(*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _491 = _485 + _489;
    float _493 = _413;
    float _495 = _471;
    float _497 = _473;
    float _499 = _475;
    float _501 = _477;
    float _503 = _479;
    if (_487)
    {
        float _505 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _493 = _505;
    }
    float _507 = _493;
    if (_487)
    {
        float _509 = _491 * _507;
        _495 = _509;
    }
    float _511 = _495;
    float _513 = 0.0;
    if (_487)
    {
        float _515 = _511 * 0.15915493667125701904296875;
        _513 = _515;
    }
    float _517 = _513;
    float _519 = _517;
    if (_487)
    {
        float _521 = _517 * 6.283185482025146484375;
        float _523 = sin(_521);
        _371 = _523;
    }
    float _525 = _371;
    float _527 = (*spvDescriptorSet0.fp_c9)._m0[26].y + (-220.0);
    float _529 = _491;
    float _531 = _527;
    if (_487)
    {
        float _533 = _517 * 6.283185482025146484375;
        float _535 = cos(_533);
        _529 = _535;
    }
    float _537 = _529;
    float _539 = precise::max(0.0, _527);
    float _541 = _439;
    float _543 = _539;
    if (_487)
    {
        float _545 = rsqrt(_483);
        _541 = _545;
    }
    float _547 = _541;
    float _549 = -_473;
    float _551 = -_539;
    float _553 = fma(_447, _549, _551);
    float _555 = _553;
    if (_487)
    {
        float _557 = _553 + (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _543 = _557;
    }
    float _559 = _543;
    float _561 = _559;
    if (_487)
    {
        float _563 = _537 + (-1.0);
        _531 = _563;
    }
    float _565 = _531;
    if (_487)
    {
        float _567 = fma(_525, _559, (*spvDescriptorSet0.fp_c9)._m0[42].y);
        _497 = _567;
    }
    float _569 = _497;
    float _571 = -(*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _573 = _387 + _571;
    if (_487)
    {
        float _575 = _565 * (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _561 = _575;
    }
    float _577 = _561;
    float _579 = _573 * _573;
    if (_487)
    {
        float _581 = _547 * _569;
        _519 = _581;
    }
    float _583 = _519;
    float _585 = -(*spvDescriptorSet0.fp_c4)._m0[11].w;
    float _587 = _311 + _585;
    if (_487)
    {
        float _589 = fma(_553, _537, _577);
        _555 = _589;
    }
    float _591 = _555;
    if (_487)
    {
        float _593 = _475 * _583;
        _499 = _593;
    }
    float _595 = _499;
    float _597 = -(*spvDescriptorSet0.fp_c4)._m0[13].w;
    float _599 = _309 + _597;
    float _601 = fma(_587, _587, _579);
    float _603 = _601;
    if (_487)
    {
        float _605 = _477 * _583;
        _501 = _605;
    }
    float _607 = _501;
    if (_487)
    {
        float _609 = _595 * _595;
        _503 = _609;
    }
    float _611 = _503;
    float _613 = fma(_599, _599, _601);
    if (!_487)
    {
        _603 = _481;
    }
    float _615 = _603;
    float _617 = _615;
    if (_487)
    {
        float _619 = _607 * _607;
        _617 = _619;
    }
    float _621 = _617;
    float _623 = fma(_591, _591, _611);
    float _625 = sqrt(_613);
    float _627 = _623 + _621;
    float _629 = rsqrt(_627);
    float _631 = -(*spvDescriptorSet0.fp_c9)._m0[63].y;
    float _633 = fma(_625, (*spvDescriptorSet0.fp_c9)._m0[63].x, _631);
    float _635 = precise::clamp(_633, 0.0, 1.0);
    float _637 = -_635;
    float _639 = _637 + 1.0;
    float _641 = _629 * _595;
    float _643 = _629 * _591;
    float _645 = abs(_639);
    float _647 = log2(_645);
    float _649 = _641 * (*spvDescriptorSet0.fp_c9)._m0[69].x;
    float _651 = _629 * _607;
    float _653 = -_649;
    float _655 = fma(_643, (*spvDescriptorSet0.fp_c9)._m0[69].y, _653);
    float _657 = in.m_61.z;
    float _659 = gl_FragCoord.w;
    float _661 = _657 * _659;
    float _663 = -_651;
    float _665 = fma(_663, (*spvDescriptorSet0.fp_c9)._m0[69].z, _655);
    float _667 = fma(_665, -0.5, 0.5);
    float _669 = _647 * (*spvDescriptorSet0.fp_c9)._m0[64].x;
    float _671 = fma(_665, 0.5, 0.5);
    float _673 = sqrt(_667);
    float _675 = in.m_61.w;
    float _677 = gl_FragCoord.w;
    float _679 = _675 * _677;
    float _681 = fma(_671, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _683 = exp2(_669);
    float _685 = fma(_671, _681, -0.212114393711090087890625);
    float _687 = float(uint(_273));
    float _689 = fma(_671, _685, 1.570728778839111328125);
    float _691 = _643 + 1.0;
    int _693 = _211 + 25936;
    uint _695 = uint(int(uint(_693) >> uint(2)));
    uint _697 = uint(int(uint(int(_695)) >> uint(2)));
    int _699 = int(_695) & 3;
    float _701 = (*spvDescriptorSet0.fp_c9)._m0[int(_697)][_699];
    float _703 = _673 * 0.636619746685028076171875;
    bool _705 = _203 >= 0.5;
    bool _707 = isnan(_203);
    bool _709 = _705 || _707;
    bool _711 = isnan(0.5);
    bool _713 = _709 || _711;
    float _715 = _687 * 0.00390625;
    bool _717 = _205 >= 0.5;
    bool _719 = isnan(_205);
    bool _721 = _717 || _719;
    bool _723 = isnan(0.5);
    bool _725 = _721 || _723;
    float _727 = precise::max(_319, _701);
    float _729 = -_643;
    float _731 = fma(_683, _691, _729);
    float _733 = -_203;
    float _735 = _733 + 1.0;
    float _737 = -_689;
    float _739 = fma(_703, _737, 1.0);
    float _741 = _203 * _277;
    float _743 = _741 * 2.0;
    float _745 = -_205;
    float _747 = _745 + 1.0;
    float _749 = -_277;
    float _751 = _749 + 1.0;
    float _753 = -_279;
    float _755 = _753 + 1.0;
    int _757 = _211 + 25944;
    uint _759 = uint(int(uint(_757) >> uint(2)));
    uint _761 = uint(int(uint(int(_759)) >> uint(2)));
    int _763 = int(_759) & 3;
    float _765 = (*spvDescriptorSet0.fp_c9)._m0[int(_761)][_763];
    float _767 = precise::max(_727, _715);
    int _769 = _211 + 25952;
    uint _771 = uint(int(uint(_769) >> uint(2)));
    uint _773 = uint(int(uint(int(_771)) >> uint(2)));
    int _775 = int(_771) & 3;
    float _777 = (*spvDescriptorSet0.fp_c9)._m0[int(_773)][_775];
    float _779 = _171 * _661;
    float _781 = rint(_777);
    float _783 = precise::max(_781, 0.0);
    uint _785 = uint(_783);
    uint _787 = clamp(_785, 0u, 65535u);
    float _789 = _735 * _751;
    float _791 = _747 * _755;
    float _793 = _205 * _279;
    float _795 = _793 * 2.0;
    float _797 = float(uint(_291));
    float _799 = _743;
    float _801 = _795;
    if (_713)
    {
        float _803 = fma(_789, -2.0, 1.0);
        _799 = _803;
    }
    float _805 = _799;
    if (_725)
    {
        float _807 = fma(_791, -2.0, 1.0);
        _801 = _807;
    }
    float _809 = _801;
    float _811 = float(uint(_285));
    float _813 = _171 * _679;
    float _815 = precise::max(_319, _765);
    float _817 = fma(0.0199999995529651641845703125, _809, -0.00999999977648258209228515625);
    float _819 = precise::max(_331, _701);
    float _821 = _797 * 0.00390625;
    float _823 = _811 * 0.00390625;
    float _825 = fma(_731, 0.5, 0.5);
    float _827 = fma(-0.0199999995529651641845703125, _805, 0.00999999977648258209228515625);
    float _829 = _813 + _817;
    float _831 = fma(_311, 6.2500002968590706586837768554688e-05, 0.5);
    float _833 = precise::clamp(_831, 0.0, 1.0);
    float _835 = precise::max(_819, _821);
    float _837 = fma(_309, 6.2500002968590706586837768554688e-05, 0.5);
    float _839 = precise::clamp(_837, 0.0, 1.0);
    float _841 = _779 + _827;
    float2 _2936 = float2(_739, _825);
    float3 _845 = dm_bs(spvDescriptorSet0.fp_t_tcb_1A.sample(spvDescriptorSet0.fp_t_tcb_1ASmplr, select(_2936, float2(0.0), isnan(_2936))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_1A, spvDescriptorSet0.fp_t_tcb_1ASmplr_w, select(_2936, float2(0.0), isnan(_2936))).xyz;
    float _847 = _845.x;
    float _849 = _845.y;
    float _851 = _845.z;
    float _853 = precise::max(_815, _823);
    float2 _2953 = float2(_833, _839);
    float4 _856 = dm_bs(spvDescriptorSet0.fp_t_tcb_16.sample(spvDescriptorSet0.fp_t_tcb_16Smplr, select(_2953, float2(0.0), isnan(_2953))), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_16, spvDescriptorSet0.fp_t_tcb_16Smplr_w, select(_2953, float2(0.0), isnan(_2953))).xyzw;
    float _858 = _856.x;
    float _860 = _856.y;
    float _862 = _856.z;
    float _864 = _856.w;
    float3 _2972 = float3(_257, _259, float(int(_787)));
    float3 _2976 = select(_2972, float3(0.0), isnan(_2972));
    float _866 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _2976.xy, uint(rint(_2976.z)), level(_767)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _2976.xy, uint(rint(_2976.z)), level(_767)).z;
    float3 _2986 = float3(_261, _263, float(int(_787)));
    float3 _2988 = select(_2986, float3(0.0), isnan(_2986));
    float3 _868 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, _2988.xy, uint(rint(_2988.z)), level(_853)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, _2988.xy, uint(rint(_2988.z)), level(_853)).xyz;
    float _870 = _868.x;
    float _872 = _868.y;
    float _874 = _868.z;
    float3 _3004 = float3(_265, _267, float(int(_787)));
    float3 _3006 = select(_3004, float3(0.0), isnan(_3004));
    float _876 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _3006.xy, uint(rint(_3006.z)), level(_835)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _3006.xy, uint(rint(_3006.z)), level(_835)).x;
    float2 _3013 = float2(_841, _829);
    float3 _878 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_3013, float2(0.0), isnan(_3013))), spvDescriptorSet0.dm_border, 6u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_3013, float2(0.0), isnan(_3013))).xyz;
    float _880 = _878.x;
    float _882 = _878.y;
    float _884 = _878.z;
    float _886 = in.m_67.y;
    float _888 = gl_FragCoord.w;
    float _890 = _886 * _888;
    float _892 = in.m_69.y;
    float _894 = gl_FragCoord.w;
    float _896 = _892 * _894;
    float _898 = in.m_67.x;
    float _900 = gl_FragCoord.w;
    float _902 = _898 * _900;
    float _904 = in.m_69.x;
    float _906 = gl_FragCoord.w;
    float _908 = _904 * _906;
    float _910 = in.m_67.z;
    float _912 = gl_FragCoord.w;
    float _914 = _910 * _912;
    float _916 = in.m_69.z;
    float _918 = gl_FragCoord.w;
    float _920 = _916 * _918;
    float _922 = in.m_69.w;
    float _924 = gl_FragCoord.w;
    float _926 = _922 * _924;
    float _928 = _171 * _890;
    float _930 = _171 * _896;
    float _932 = _171 * _902;
    float _934 = _928 * _928;
    float _936 = _171 * _908;
    float _938 = _930 * _930;
    float _940 = _171 * _914;
    float _942 = fma(_932, _932, _934);
    float _944 = _171 * _920;
    float _946 = fma(_936, _936, _938);
    float _948 = fma(_940, _940, _942);
    float _950 = fma(_944, _944, _946);
    float _952 = rsqrt(_948);
    float _954 = rsqrt(_950);
    float _956 = _932 * _952;
    float _958 = _940 * _952;
    float _960 = _944 * _954;
    float _962 = _936 * _954;
    float _964 = _930 * _954;
    float _966 = _956 * _960;
    float _968 = _928 * _952;
    float _970 = _171 * _926;
    float _972 = _958 * _964;
    float _974 = -_966;
    float _976 = fma(_958, _962, _974);
    float _978 = _968 * _962;
    float _980 = -_972;
    float _982 = fma(_968, _960, _980);
    float _984 = _970 * _976;
    float _986 = -_978;
    float _988 = fma(_956, _964, _986);
    float _990 = _970 * _982;
    float _992 = _984 * _984;
    float _994 = _970 * _988;
    float _996 = fma(_990, _990, _992);
    float _998 = _387 * (*spvDescriptorSet0.fp_c9)._m0[1117].y;
    float _1000 = _387 * (*spvDescriptorSet0.fp_c9)._m0[1118].y;
    float _1002 = fma(_994, _994, _996);
    float _1004 = fma(_311, (*spvDescriptorSet0.fp_c9)._m0[1117].x, _998);
    float _1006 = fma(_311, (*spvDescriptorSet0.fp_c9)._m0[1118].x, _1000);
    float _1008 = rsqrt(_1002);
    float _1010 = fma(_309, (*spvDescriptorSet0.fp_c9)._m0[1117].z, _1004);
    float _1012 = fma(_309, (*spvDescriptorSet0.fp_c9)._m0[1118].z, _1006);
    float _1014 = _1010 + (*spvDescriptorSet0.fp_c9)._m0[1117].w;
    float _1016 = _1012 + (*spvDescriptorSet0.fp_c9)._m0[1118].w;
    float _1018 = fma(2.007874011993408203125, _809, -1.007874011993408203125);
    float _1020 = trunc(_1014);
    int _1022 = int(_1020);
    float _1024 = trunc(_1016);
    int _1026 = int(_1024);
    float _1028 = _1008 * _1018;
    float _1030 = fma(2.007874011993408203125, _805, -1.007874011993408203125);
    float _1032 = _990 * _1028;
    float _1034 = _984 * _1028;
    float _1036 = _994 * _1028;
    float _1038 = _1018 * _1018;
    float _1040 = fma(_962, _1030, _1032);
    int _1042 = ~as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].y);
    int _1044 = _1022 + _1042;
    int _1046 = _1044 + 1;
    float _1048 = fma(_1030, _1030, _1038);
    float _1050 = spvFAdd(_625, 9.9999997473787516355514526367188e-06);
    int _1052 = ~as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].z);
    int _1054 = _1026 + _1052;
    int _1056 = _1054 + 1;
    float _1058 = -_1048;
    float _1060 = _1058 + 1.0;
    float _1062 = precise::clamp(_1060, 0.0, 1.0);
    bool _1064 = _1046 >= as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].x);
    int _1066 = _1046 | _1056;
    float _1068 = 1.0 / _1050;
    bool _1070 = _1066 < 0;
    bool _1072 = _1070 || _1064;
    float _1074 = (*spvDescriptorSet0.fp_c9)._m0[66].x * (*spvDescriptorSet0.fp_c9)._m0[66].y;
    float _1076 = sqrt(_1062);
    bool _1078 = _1056 >= as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].x);
    bool _1080 = _1078 || _1072;
    float _1082 = fma(_960, _1030, _1036);
    float _1084 = abs(_573);
    bool _1086 = _1084 > 0.00999999977648258209228515625;
    float _1088 = -_1074;
    float _1090 = exp2(_1088);
    float _1092 = fma(_964, _1030, _1034);
    float _1094 = _1086 ? _573 : 0.00999999977648258209228515625;
    float _1096 = _573 * _1068;
    float _1098 = _587 * _1068;
    float _1100 = _599 * _1068;
    float _1102 = fma(_956, _1076, _1040);
    float _1104 = fma(_968, _1076, _1092);
    float _1106 = fma(_958, _1076, _1082);
    float _1108 = _1094 * (*spvDescriptorSet0.fp_c9)._m0[66].x;
    float _1110 = _1096 * (*spvDescriptorSet0.fp_c9)._m0[69].y;
    float _1112 = _958;
    if (_1080)
    {
        _1112 = (*spvDescriptorSet0.fp_c9)._m0[42].x;
    }
    float _1114 = _1112;
    float _1116 = _1114;
    if (!_1080)
    {
        int _1118 = _1056 * as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].x);
        int _1120 = _1118 + _1046;
        float _1122 = floor(_1014);
        int _1124 = _1120 << 2;
        int _1126 = _1120 >> 2;
        int _1128 = 12 & _1124;
        float _1130 = floor(_1016);
        int _1132 = _1126 << 4;
        int _1134 = _1132 + _1128;
        int _1136 = _1134 + 16256;
        uint _1138 = uint(int(uint(_1136) >> uint(2)));
        uint _1140 = uint(int(uint(int(_1138)) >> uint(2)));
        int _1142 = int(_1138) & 3;
        float _1144 = (*spvDescriptorSet0.fp_c9)._m0[int(_1140)][_1142];
        float _1146 = -_1122;
        float _1148 = _1014 + _1146;
        float _1150 = -_1130;
        float _1152 = _1016 + _1150;
        float _1154 = rint(_1144);
        float _1156 = precise::max(_1154, 0.0);
        uint _1158 = uint(_1156);
        uint _1160 = clamp(_1158, 0u, 65535u);
        float3 _3445 = float3(_1148, _1152, float(int(_1160)));
        float3 _3447 = select(_3445, float3(0.0), isnan(_3445));
        float _1162 = dm_bs(spvDescriptorSet0.fp_t_tcb_18.sample(spvDescriptorSet0.fp_t_tcb_18Smplr, _3447.xy, uint(rint(_3447.z))), spvDescriptorSet0.dm_border, 7u, spvDescriptorSet0.fp_t_tcb_18, spvDescriptorSet0.fp_t_tcb_18Smplr_w, _3447.xy, uint(rint(_3447.z))).x;
        int _1164 = _1120 << 4;
        int _1166 = _1164 + 17904;
        int _1168 = _1134 + 24304;
        uint _1170 = uint(int(uint(_1168) >> uint(2)));
        uint _1172 = uint(int(uint(int(_1170)) >> uint(2)));
        int _1174 = int(_1170) & 3;
        float _1176 = (*spvDescriptorSet0.fp_c9)._m0[int(_1172)][_1174];
        uint _1178 = uint(int(uint(_1166) >> uint(2)));
        uint _1180 = uint(int(uint(int(_1178)) >> uint(2)));
        int _1182 = int(_1178) & 3;
        float _1184 = (*spvDescriptorSet0.fp_c9)._m0[int(_1180)][_1182];
        int _1186 = int(_1178) + 1;
        uint _1188 = uint(int(uint(_1186) >> uint(2)));
        int _1190 = _1186 & 3;
        float _1192 = (*spvDescriptorSet0.fp_c9)._m0[int(_1188)][_1190];
        int _1194 = _1166 + 8;
        uint _1196 = uint(int(uint(_1194) >> uint(2)));
        uint _1198 = uint(int(uint(int(_1196)) >> uint(2)));
        int _1200 = int(_1196) & 3;
        float _1202 = (*spvDescriptorSet0.fp_c9)._m0[int(_1198)][_1200];
        int _1204 = int(_1196) + 1;
        uint _1206 = uint(int(uint(_1204) >> uint(2)));
        int _1208 = _1204 & 3;
        float _1210 = (*spvDescriptorSet0.fp_c9)._m0[int(_1206)][_1208];
        float _1212 = 1.0 / _1176;
        float _1214 = _387 * _1192;
        float _1216 = fma(_311, _1184, _1214);
        float _1218 = fma(_309, _1202, _1216);
        float _1220 = _1218 + _1210;
        float _1222 = precise::clamp(_1220, 0.0, 1.0);
        float _1224 = _1176 * (*spvDescriptorSet0.fp_c13)._m0[4].z;
        float _1226 = -_1222;
        float _1228 = _1226 + _1162;
        float _1230 = fma(_1212, (*spvDescriptorSet0.fp_c13)._m0[4].w, _1228);
        float _1232 = _1224 * _1230;
        float _1234 = exp2(_1232);
        float _1236 = 0.0 + _1234;
        float _1238 = precise::clamp(_1236, 0.0, 1.0);
        float _1240 = precise::min(_1238, (*spvDescriptorSet0.fp_c9)._m0[42].x);
        _1116 = _1240;
    }
    float _1242 = _1116;
    float _1244 = fma(_1098, (*spvDescriptorSet0.fp_c9)._m0[69].x, _1110);
    float _1246 = _1104 * _1104;
    float _1248 = precise::max(_1108, -127.0);
    float _1250 = fma(_1100, (*spvDescriptorSet0.fp_c9)._m0[69].z, _1244);
    float _1252 = in.m_71.y;
    float _1254 = gl_FragCoord.w;
    float _1256 = _1252 * _1254;
    float _1258 = fma(_1102, _1102, _1246);
    float _1260 = -_1248;
    float _1262 = exp2(_1260);
    float _1264 = fma(_1250, 2.0, (*spvDescriptorSet0.fp_c9)._m0[66].z);
    float _1266 = in.m_71.x;
    float _1268 = gl_FragCoord.w;
    float _1270 = _1266 * _1268;
    float _1272 = fma(_1106, _1106, _1258);
    float _1274 = _647 * (*spvDescriptorSet0.fp_c9)._m0[64].y;
    float _1276 = fma(_1264, (*spvDescriptorSet0.fp_c9)._m0[66].z, 1.0);
    float _1278 = _870 * 0.4774648249149322509765625;
    float _1280 = in.m_71.w;
    float _1282 = gl_FragCoord.w;
    float _1284 = _1280 * _1282;
    float _1286 = 1.0 / _1248;
    float _1288 = _874 * 0.4774648249149322509765625;
    float _1290 = _1278 * (*spvDescriptorSet0.fp_c9)._m0[68].x;
    float _1292 = abs(_1276);
    float _1294 = log2(_1292);
    float _1296 = -_1262;
    float _1298 = _1296 + 1.0;
    float _1300 = _1090 * _1298;
    float _1302 = _625 * (*spvDescriptorSet0.fp_c9)._m0[65].w;
    float _1304 = rsqrt(_1272);
    float _1306 = _1300 * _1286;
    float _1308 = _1306 * _1302;
    float _1310 = _625 + (-250.0);
    float _1312 = _1294 * 1.5;
    float _1314 = _171 * _1270;
    float _1316 = precise::max(0.0, _1310);
    float _1318 = -_1308;
    float _1320 = exp2(_1318);
    float _1322 = _171 * _1256;
    float _1324 = _171 * _1284;
    float _1326 = _1102 * _1304;
    float _1328 = _1104 * _1304;
    float _1330 = _1106 * _1304;
    float _1332 = exp2(_1312);
    float _1334 = _1098 * _1326;
    float _1336 = in.m_71.z;
    float _1338 = gl_FragCoord.w;
    float _1340 = _1336 * _1338;
    float _1342 = _1316 * 0.001000000047497451305389404296875;
    float _1344 = precise::clamp(_1342, 0.0, 1.0);
    float _1346 = -(*spvDescriptorSet0.fp_c9)._m0[66].z;
    float _1348 = fma(_1346, (*spvDescriptorSet0.fp_c9)._m0[66].z, 1.0);
    float _1350 = fma(_1096, _1328, _1334);
    float _1352 = -_1324;
    float _1354 = -(*spvDescriptorSet0.fp_c9)._m0[41].z;
    float _1356 = _1352 + _1354;
    float _1358 = fma(_1344, -0.20000000298023223876953125, 0.9900000095367431640625);
    float _1360 = _1098 * 0.75187969207763671875;
    float _1362 = fma(_1100, _1330, _1350);
    float _1364 = fma(_1328, 0.5, 0.5);
    float _1366 = _1332 * 12.56637096405029296875;
    float _1368 = _1362 * _1362;
    float _1370 = fma(_1368, 0.565323054790496826171875, 0.434676945209503173828125);
    float _1372 = 1.0 / _1366;
    bool _1374 = _1370 >= 0.0;
    bool _1376 = isnan(_1370);
    bool _1378 = _1374 || _1376;
    bool _1380 = isnan(0.0);
    bool _1382 = _1378 || _1380;
    float _1384 = sqrt(_1370);
    float _1386 = _171 * _1340;
    float _1388 = fma(_1344, 0.20000000298023223876953125, 0.00999999977648258209228515625);
    float _1390 = _1348 * _1372;
    float _1392 = _1356 * (*spvDescriptorSet0.fp_c9)._m0[41].w;
    float _1394 = precise::clamp(_1392, 0.0, 1.0);
    float _1396 = -_1242;
    float _1398 = _1396 + 1.0;
    float _1400 = -_1320;
    float _1402 = _1400 + 1.0;
    float _1404 = fma(_1362, 0.75187969207763671875, _1384);
    float _1406 = fma(_1394, _1398, _1242);
    float _1408 = _1096 * 0.75187969207763671875;
    float _1410 = _1402 * _1390;
    float _1412 = -_1360;
    float _1414 = fma(_1326, _1404, _1412);
    float _1416 = -_1096;
    float _1418 = -_1334;
    float _1420 = fma(_1416, _1328, _1418);
    float _1422 = exp2(_1274);
    float _1424 = -_1408;
    float _1426 = fma(_1328, _1404, _1424);
    float _1428 = -(*spvDescriptorSet0.fp_c9)._m0[1007].x;
    float _1430 = _1428 + (*spvDescriptorSet0.fp_c9)._m0[1006].x;
    float _1432 = -(*spvDescriptorSet0.fp_c9)._m0[1007].y;
    float _1434 = _1432 + (*spvDescriptorSet0.fp_c9)._m0[1006].y;
    float _1436 = _1100 * 0.75187969207763671875;
    float _1438 = -(*spvDescriptorSet0.fp_c9)._m0[1007].z;
    float _1440 = _1438 + (*spvDescriptorSet0.fp_c9)._m0[1006].z;
    float _1442 = _1382 ? _1426 : (-0.0);
    float _1444 = fma(_1364, _1430, (*spvDescriptorSet0.fp_c9)._m0[1007].x);
    float _1446 = _1382 ? _1414 : (-0.0);
    float _1448 = fma(_1364, _1434, (*spvDescriptorSet0.fp_c9)._m0[1007].y);
    float _1450 = fma(_1364, _1440, (*spvDescriptorSet0.fp_c9)._m0[1007].z);
    float _1452 = -_1436;
    float _1454 = fma(_1330, _1404, _1452);
    float _1456 = -_1100;
    float _1458 = fma(_1456, _1330, _1420);
    float _1460 = precise::clamp(_1458, 0.0, 1.0);
    float _1462 = _1442 * (*spvDescriptorSet0.fp_c9)._m0[69].y;
    float _1464 = _1448 * 0.715200006961822509765625;
    float _1466 = -_1422;
    float _1468 = _1466 + 1.0;
    float _1470 = _1382 ? _1454 : (-0.0);
    float _1472 = fma(_1446, (*spvDescriptorSet0.fp_c9)._m0[69].x, _1462);
    float _1474 = _1468 * (*spvDescriptorSet0.fp_c9)._m0[64].z;
    float _1476 = precise::min(_1406, (*spvDescriptorSet0.fp_c9)._m0[62].x);
    float _1478 = _1460 * (-9.27999973297119140625);
    float _1480 = fma(_1470, (*spvDescriptorSet0.fp_c9)._m0[69].z, _1472);
    float _1482 = -_1474;
    float _1484 = _1482 + 1.0;
    float _1486 = _1474 * _1320;
    float _1488 = fma((*spvDescriptorSet0.fp_c11)._m0[15].w, (*spvDescriptorSet0.fp_c11)._m0[15].w, 1.0);
    float _1490 = (*spvDescriptorSet0.fp_c11)._m0[15].w * 2.0;
    float _1492 = fma(_1444, 0.2125999927520751953125, _1464);
    float _1494 = _1320 * _1484;
    float _1496 = _1476 * _1410;
    float _1498 = _1322 * 0.18672408163547515869140625;
    float _1500 = _872 * 0.4774648249149322509765625;
    float _1502 = -_1490;
    float _1504 = fma(_1480, _1502, _1488);
    float _1506 = 0.2820948064327239990234375 * (*spvDescriptorSet0.fp_c9)._m0[991].x;
    float _1508 = 0.2820948064327239990234375 * (*spvDescriptorSet0.fp_c9)._m0[991].y;
    float _1510 = fma(_1314, 0.095146648585796356201171875, _1498);
    float _1512 = 0.2820948064327239990234375 * (*spvDescriptorSet0.fp_c9)._m0[991].z;
    float _1514 = _1500 * (*spvDescriptorSet0.fp_c9)._m0[68].y;
    float _1516 = fma(_1450, 0.072200000286102294921875, _1492);
    float _1518 = abs(_1504);
    float _1520 = log2(_1518);
    float _1522 = fma(_1386, 0.0364394821226596832275390625, _1510);
    float _1524 = fma(_866, _1508, _1514);
    float _1526 = _1358 * _1358;
    float _1528 = _1524 * 0.586610972881317138671875;
    float _1530 = _1288 * (*spvDescriptorSet0.fp_c9)._m0[68].z;
    float _1532 = exp2(_1478);
    float _1534 = fma(_866, _1512, _1530);
    float _1536 = 1.0 / _1516;
    float _1538 = precise::max(_1522, 0.00999999977648258209228515625);
    float _1540 = fma(_866, _1506, _1290);
    float _1542 = fma(_1540, 0.298911988735198974609375, _1528);
    float _1544 = precise::min(_1526, _1532);
    float _1546 = fma(_1388, -0.0274999998509883880615234375, 0.0425000004470348358154296875);
    float _1548 = fma(_1534, 0.114477999508380889892578125, _1542);
    float _1550 = _1520 * 1.5;
    float _1552 = fma(_1358, _1544, _1546);
    float _1554 = fma(_1388, -0.572000026702880859375, 1.03999996185302734375);
    float _1556 = _1536 * (*spvDescriptorSet0.fp_c9)._m0[39].z;
    float _1558 = precise::clamp(_1556, 0.0, 1.0);
    float _1560 = exp2(_1550);
    float _1562 = fma(_1552, -1.03999996185302734375, _1554);
    float _1564 = precise::clamp(_1562, 0.0, 1.0);
    float _1566 = fma(_1558, (*spvDescriptorSet0.fp_c9)._m0[39].y, (*spvDescriptorSet0.fp_c9)._m0[39].x);
    float _1568 = fma(_1388, 0.02199999988079071044921875, -0.039999999105930328369140625);
    float _1570 = _1566 * 0.31830990314483642578125;
    float _1572 = fma(_1552, 1.03999996185302734375, _1568);
    float _1574 = precise::clamp(_1572, 0.0, 1.0);
    float _1576 = 1.0 / _1538;
    float _1578 = _1444 * _1570;
    float _1580 = _1450 * _1570;
    float _1582 = fma(_1564, 0.02005931176245212554931640625, _1574);
    float _1584 = -_1574;
    float _1586 = _1584 + 1.0;
    float _1588 = _1448 * _1570;
    float _1590 = _1560 * 12.56637096405029296875;
    float _1592 = precise::max(_1290, _1578);
    float _1594 = _1586 * 3.1415927410125732421875;
    float _1596 = precise::max(_1530, _1580);
    float _1598 = 1.0 / _1590;
    float _1600 = precise::max(_1514, _1588);
    float _1602 = fma(_866, _1506, _1592);
    float _1604 = fma(_866, _1512, _1596);
    float _1606 = -(*spvDescriptorSet0.fp_c11)._m0[15].w;
    float _1608 = fma(_1606, (*spvDescriptorSet0.fp_c11)._m0[15].w, 1.0);
    float _1610 = _864 + (*spvDescriptorSet0.fp_c11)._m0[15].x;
    float _1612 = _1602 * _1594;
    float _1614 = fma(_866, _1508, _1600);
    float _1616 = _876 * (*spvDescriptorSet0.fp_c9)._m0[70].x;
    float _1618 = _1548 * _1576;
    float _1620 = _858 * _1612;
    float _1622 = (*spvDescriptorSet0.fp_c11)._m0[35].x * 1.60000002384185791015625;
    float _1624 = _1604 * _1594;
    float _1626 = _1614 * _1594;
    float _1628 = _864 + (*spvDescriptorSet0.fp_c11)._m0[15].y;
    float _1630 = _1608 * _1598;
    float _1632 = _858 * _1616;
    float _1634 = 1.0 / _1610;
    float _1636 = _876 * (*spvDescriptorSet0.fp_c9)._m0[70].y;
    float _1638 = _876 * (*spvDescriptorSet0.fp_c9)._m0[70].z;
    float _1640 = _864 + (*spvDescriptorSet0.fp_c11)._m0[15].z;
    float _1642 = precise::min(_1618, (*spvDescriptorSet0.fp_c9)._m0[27].w);
    float _1644 = _880 * _1622;
    float _1646 = _882 * _1622;
    float _1648 = _884 * _1622;
    float _1650 = _860 * _1626;
    float _1652 = _1620 * 0.079577468335628509521484375;
    float _1654 = 1.0 / _1628;
    float _1656 = _862 * _1624;
    float _1658 = _860 * _1636;
    float _1660 = fma(_1630, _1632, _1652);
    float _1662 = _862 * _1638;
    float _1664 = _1642 * 0.31830990314483642578125;
    float _1666 = _1650 * 0.079577468335628509521484375;
    float _1668 = _864 * _1660;
    float _1670 = 1.0 / _1640;
    float _1672 = _1656 * 0.079577468335628509521484375;
    float _1674 = _1582 * _1664;
    float _1676 = fma(_1630, _1658, _1666);
    float _1678 = _1668 * _1634;
    float _1680 = fma(_1630, _1662, _1672);
    float _1682 = _1496 * (*spvDescriptorSet0.fp_c9)._m0[70].x;
    float _1684 = _864 * _1676;
    float _1686 = fma(_1314, _1674, _1678);
    float _1688 = _864 * _1680;
    float _1690 = fma(_847, _1486, _1682);
    float _1692 = _1684 * _1654;
    float _1694 = _1496 * (*spvDescriptorSet0.fp_c9)._m0[70].y;
    float _1696 = precise::max(0.0, _1686);
    float _1698 = _1496 * (*spvDescriptorSet0.fp_c9)._m0[70].z;
    float _1700 = fma(_1322, _1674, _1692);
    float _1702 = _1688 * _1670;
    float _1704 = fma(_849, _1486, _1694);
    float _1706 = fma(_1494, _1696, _1690);
    float _1708 = precise::max(0.0, _1644);
    float _1710 = fma(_1386, _1674, _1702);
    float _1712 = -(*spvDescriptorSet0.fp_c9)._m0[48].x;
    float _1714 = _625 + _1712;
    float _1716 = precise::max(0.0, _1700);
    float _1718 = -(*spvDescriptorSet0.fp_c9)._m0[48].z;
    float _1720 = _625 + _1718;
    float _1722 = precise::max(0.0, _1646);
    float _1724 = fma(_851, _1486, _1698);
    float _1726 = precise::max(0.0, _1648);
    float _1728 = _1714 * (*spvDescriptorSet0.fp_c9)._m0[48].y;
    float _1730 = precise::clamp(_1728, 0.0, 1.0);
    float _1732 = precise::max(0.0, _1710);
    float _1734 = _1494 * _1708;
    float _1736 = _1720 * (*spvDescriptorSet0.fp_c9)._m0[48].w;
    float _1738 = precise::clamp(_1736, 0.0, 1.0);
    float _1740 = fma(_1494, _1716, _1704);
    float _1742 = _1494 * _1722;
    float _1744 = _1494 * _1726;
    float _1746 = fma(_1494, _1732, _1724);
    float _1748 = fma(_1730, _1734, _1706);
    float _1750 = fma(_1738, _1734, _1706);
    float _1752 = fma(_1730, _1742, _1740);
    float _1754 = fma(_1738, _1742, _1740);
    float _1756 = fma(_1730, _1744, _1746);
    float _1758 = fma(_1738, _1744, _1746);
    out.m_74.x = _1748;
    out.m_74.y = _1752;
    out.m_74.z = _1756;
    out.m_74.w = 1.0;
    out.m_76.x = _1750;
    out.m_76.y = _1754;
    out.m_76.z = _1758;
    out.m_76.w = 1.0;
    return out;
}

