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
    texture2d<float> fp_t_tcb_10 [[id(6)]];
    sampler fp_t_tcb_10Smplr [[id(7)]];
    texture2d_array<float> fp_t_tcb_8 [[id(8)]];
    sampler fp_t_tcb_8Smplr [[id(9)]];
    texture2d_array<float> fp_t_tcb_C [[id(10)]];
    sampler fp_t_tcb_CSmplr [[id(11)]];
    texture2d<float> fp_t_tcb_16 [[id(12)]];
    sampler fp_t_tcb_16Smplr [[id(13)]];
    texture2d<float> fp_t_tcb_12 [[id(14)]];
    sampler fp_t_tcb_12Smplr [[id(15)]];
    texture2d_array<float> fp_t_tcb_14 [[id(16)]];
    sampler fp_t_tcb_14Smplr [[id(17)]];
    sampler fp_t_tcb_10Smplr_w [[id(18)]];
    sampler fp_t_tcb_8Smplr_w [[id(19)]];
    sampler fp_t_tcb_CSmplr_w [[id(20)]];
    sampler fp_t_tcb_16Smplr_w [[id(21)]];
    sampler fp_t_tcb_12Smplr_w [[id(22)]];
    sampler fp_t_tcb_14Smplr_w [[id(23)]];
    constant dm_border_t* dm_border [[id(24)]];
};

struct main0_out
{
    float4 m_66 [[color(0)]];
    float4 m_68 [[color(1)]];
};

struct main0_in
{
    float4 m_59 [[user(locn4)]];
    float4 m_61 [[user(locn6)]];
    float4 m_57 [[user(locn7)]];
    float4 m_63 [[user(locn8)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    int _75 = as_type<int>((*spvDescriptorSet0.fp_c7)._m0[11].z) * as_type<int>((*spvDescriptorSet0.fp_c11)._m0[33].z);
    int _77 = _75 + as_type<int>((*spvDescriptorSet0.fp_c11)._m0[33].w);
    int _79 = _77 * 96;
    int _81 = _79 + 80;
    uint _84 = uint(int(uint(_79) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.fp_s0)._m0[int(_84)];
    float _87 = as_type<float>(_dmw0.x);
    int _89 = _79 + 4;
    uint _91 = uint(int(uint(_89) >> uint(2)));
    float _93 = as_type<float>(_dmw0.y);
    uint _95 = uint(int(uint(_81) >> uint(2)));
    float _97 = as_type<float>((*spvDescriptorSet0.fp_s0)._m0[int(_95)]);
    int _99 = _79 + 16;
    int _101 = _79 + 24;
    int _103 = _79 + 8;
    uint _105 = uint(int(uint(_99) >> uint(2)));
    packed_uint4 _dmw1 = *(const device packed_uint4*)&(*spvDescriptorSet0.fp_s0)._m0[int(_105)];
    float _107 = as_type<float>(_dmw1.x);
    int _109 = _99 + 4;
    uint _111 = uint(int(uint(_109) >> uint(2)));
    float _113 = as_type<float>(_dmw1.y);
    uint _115 = uint(int(uint(_101) >> uint(2)));
    float _117 = as_type<float>(_dmw1.z);
    int _119 = _101 + 4;
    uint _121 = uint(int(uint(_119) >> uint(2)));
    float _123 = as_type<float>(_dmw1.w);
    uint _125 = uint(int(uint(_103) >> uint(2)));
    float _127 = as_type<float>(_dmw0.z);
    int _129 = _103 + 4;
    uint _131 = uint(int(uint(_129) >> uint(2)));
    float _133 = as_type<float>(_dmw0.w);
    float _135 = gl_FragCoord.w;
    float _137 = in.m_57.x;
    float _139 = gl_FragCoord.w;
    float _141 = _137 * _139;
    float _143 = in.m_57.z;
    float _145 = gl_FragCoord.w;
    float _147 = _143 * _145;
    float _149 = in.m_59.z;
    float _151 = gl_FragCoord.w;
    float _153 = _149 * _151;
    float _155 = in.m_59.w;
    float _157 = gl_FragCoord.w;
    float _159 = _155 * _157;
    float _161 = 1.0 / _135;
    float _163 = _161 * _141;
    float _165 = _161 * _147;
    float _167 = _163 * 0.0625;
    float _169 = _165 * 0.0625;
    float _171 = _161 * _153;
    float2 _1577 = float2(_167, _169);
    float2 _175 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1577, float2(0.0), isnan(_1577))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_1577, float2(0.0), isnan(_1577))).xy;
    float _177 = _175.x;
    float _179 = _175.y;
    float _181 = _161 * _159;
    int _183 = as_type<int>(_97) << 6;
    int _185 = _183 + 25904;
    uint _187 = uint(int(uint(_185) >> uint(2)));
    uint _189 = uint(int(uint(int(_187)) >> uint(2)));
    int _191 = int(_187) & 3;
    float _193 = (*spvDescriptorSet0.fp_c9)._m0[int(_189)][_191];
    int _195 = int(_187) + 1;
    uint _197 = uint(int(uint(_195) >> uint(2)));
    int _199 = _195 & 3;
    float _201 = (*spvDescriptorSet0.fp_c9)._m0[int(_197)][_199];
    int _203 = _183 + 25920;
    uint _205 = uint(int(uint(_203) >> uint(2)));
    uint _207 = uint(int(uint(int(_205)) >> uint(2)));
    int _209 = int(_205) & 3;
    float _211 = (*spvDescriptorSet0.fp_c9)._m0[int(_207)][_209];
    int _213 = int(_205) + 1;
    uint _215 = uint(int(uint(_213) >> uint(2)));
    int _217 = _213 & 3;
    float _219 = (*spvDescriptorSet0.fp_c9)._m0[int(_215)][_217];
    float _221 = fma(_171, _107, _117);
    float _223 = fma(_171, _87, _127);
    float _225 = fma(_181, _113, _123);
    float _227 = fma(_181, _93, _133);
    float _229 = _223 * _193;
    float _231 = _227 * _201;
    float _233 = _221 * _193;
    float _235 = _225 * _201;
    float _237 = _221 * _211;
    float _239 = _225 * _219;
    float2 _1698;
    _1698.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_233, _235));
    _1698.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_233, _235));
    float _241 = _1698.x;
    float _243 = _241 * 256.0;
    int _245 = int(_243);
    float2 _1709;
    _1709.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_229, _231));
    _1709.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_229, _231));
    float _247 = _1709.x;
    float _249 = _247 * 256.0;
    int _251 = int(_249);
    float2 _1719;
    _1719.x = spvDescriptorSet0.fp_t_tcb_C.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_CSmplr, float2(_237, _239));
    _1719.y = spvDescriptorSet0.fp_t_tcb_C.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_CSmplr, float2(_237, _239));
    float _253 = _1719.x;
    float _255 = _253 * 256.0;
    int _257 = int(_255);
    int _259 = _79 + 64;
    int _261 = _79 + 68;
    uint _263 = uint(int(uint(_259) >> uint(2)));
    packed_uint2 _dmw2 = *(const device packed_uint2*)&(*spvDescriptorSet0.fp_s0)._m0[int(_263)];
    float _265 = as_type<float>(_dmw2.x);
    uint _267 = uint(int(uint(_261) >> uint(2)));
    float _269 = as_type<float>(_dmw2.y);
    float _271 = -(*spvDescriptorSet0.fp_c9)._m0[26].z;
    float _273 = _165 + _271;
    float _275 = -(*spvDescriptorSet0.fp_c9)._m0[26].x;
    float _277 = _163 + _275;
    float _279 = _273 * _273;
    float _281 = fma(_277, _277, _279);
    float _283 = sqrt(_281);
    float _285 = in.m_57.y;
    float _287 = gl_FragCoord.w;
    float _289 = _285 * _287;
    bool _293 = _283 > (*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _295 = -(*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _297 = _283 + _295;
    float _299 = _117;
    float _301 = _297;
    float _303 = _281;
    if (_293)
    {
        float _305 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _299 = _305;
    }
    float _307 = _299;
    if (_293)
    {
        float _309 = _297 * _307;
        _301 = _309;
    }
    float _311 = _301;
    float _313 = 0.0;
    if (_293)
    {
        float _315 = _311 * 0.15915493667125701904296875;
        _313 = _315;
    }
    float _317 = _313;
    float _319 = 0.0;
    if (_293)
    {
        float _321 = _317 * 6.283185482025146484375;
        float _323 = cos(_321);
        _319 = _323;
    }
    float _325 = _319;
    float _327 = _161 * _289;
    float _329 = _307;
    float _331 = _289;
    if (_293)
    {
        float _333 = _317 * 6.283185482025146484375;
        float _335 = sin(_333);
        _329 = _335;
    }
    float _337 = _329;
    float _339 = in.m_61.y;
    float _341 = gl_FragCoord.w;
    float _343 = _339 * _341;
    if (_293)
    {
        float _345 = _327 + (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _331 = _345;
    }
    float _347 = _331;
    float _349 = in.m_61.x;
    float _351 = gl_FragCoord.w;
    float _353 = _349 * _351;
    float _355 = 0.0;
    if (_293)
    {
        float _357 = rsqrt(_281);
        _355 = _357;
    }
    float _359 = _355;
    float _361 = 0.0;
    if (_293)
    {
        float _363 = _325 + (-1.0);
        _361 = _363;
    }
    float _365 = _361;
    float _367 = 0.0;
    float _369 = _337;
    float _371 = _365;
    if (_293)
    {
        float _373 = fma(_337, _347, (*spvDescriptorSet0.fp_c9)._m0[42].y);
        _367 = _373;
    }
    float _375 = _367;
    float _377 = in.m_61.z;
    float _379 = gl_FragCoord.w;
    float _381 = _377 * _379;
    float _383 = 0.0;
    float _385 = _375;
    if (_293)
    {
        float _387 = _365 * (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _383 = _387;
    }
    float _389 = _383;
    if (!_293)
    {
        _369 = _327;
    }
    float _391 = _369;
    float _393 = _391;
    if (_293)
    {
        float _395 = fma(_327, _325, _389);
        _393 = _395;
    }
    float _397 = _393;
    if (_293)
    {
        float _399 = _359 * _375;
        _385 = _399;
    }
    float _401 = _385;
    if (!_293)
    {
        _371 = _163;
    }
    float _403 = _371;
    float _405 = -(*spvDescriptorSet0.fp_c9)._m0[26].y;
    float _407 = _397 + _405;
    float _409 = _403;
    if (_293)
    {
        float _411 = fma(_277, _401, (*spvDescriptorSet0.fp_c9)._m0[26].x);
        _409 = _411;
    }
    float _413 = _409;
    if (!_293)
    {
        _303 = _165;
    }
    float _415 = _303;
    float _417 = _415;
    if (_293)
    {
        float _419 = fma(_273, _401, (*spvDescriptorSet0.fp_c9)._m0[26].z);
        _417 = _419;
    }
    float _421 = _417;
    float _423 = _407 * _407;
    float _425 = -(*spvDescriptorSet0.fp_c9)._m0[26].x;
    float _427 = _413 + _425;
    float _429 = -(*spvDescriptorSet0.fp_c9)._m0[26].z;
    float _431 = _421 + _429;
    float _433 = fma(_427, _427, _423);
    float _435 = _161 * _343;
    float _437 = fma(_431, _431, _433);
    float _439 = _161 * _353;
    float _441 = _435 * _435;
    float _443 = rsqrt(_437);
    float _445 = fma(_439, _439, _441);
    float _447 = _161 * _381;
    float _449 = fma(_447, _447, _445);
    float _451 = rsqrt(_449);
    float _453 = _443 * (*spvDescriptorSet0.fp_c9)._m0[26].w;
    float _455 = (*spvDescriptorSet0.fp_c9)._m0[26].y + (-220.0);
    float _457 = _427 * _453;
    float _459 = _431 * _453;
    float _461 = precise::max(0.0, _455);
    float _463 = _457 * _457;
    float _465 = _459 * _459;
    float _467 = _463 + _465;
    float _469 = _435 * _451;
    float _471 = -_453;
    float _473 = -_461;
    float _475 = fma(_407, _471, _473);
    float _477 = fma(_439, _451, _177);
    float _479 = sqrt(_467);
    float _481 = _469 * _469;
    float _483 = -(*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _485 = _327 + _483;
    float _487 = fma(_447, _451, _179);
    int _489 = _183 + 25936;
    uint _491 = uint(int(uint(_489) >> uint(2)));
    uint _493 = uint(int(uint(int(_491)) >> uint(2)));
    int _495 = int(_491) & 3;
    float _497 = (*spvDescriptorSet0.fp_c9)._m0[int(_493)][_495];
    float _499 = fma(_477, _477, _481);
    float _501 = -(*spvDescriptorSet0.fp_c4)._m0[11].w;
    float _503 = _163 + _501;
    float _505 = _485 * _485;
    float _507 = -(*spvDescriptorSet0.fp_c4)._m0[13].w;
    float _509 = _165 + _507;
    float _511 = fma(_487, _487, _499);
    int _513 = _183 + 25944;
    uint _515 = uint(int(uint(_513) >> uint(2)));
    uint _517 = uint(int(uint(int(_515)) >> uint(2)));
    int _519 = int(_515) & 3;
    float _521 = (*spvDescriptorSet0.fp_c9)._m0[int(_517)][_519];
    float _523 = fma(_503, _503, _505);
    float _525 = rsqrt(_511);
    float _527 = fma(_509, _509, _523);
    bool _529 = _479 > (*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _531 = sqrt(_527);
    float _533 = _525 * 1.0039370059967041015625;
    float _535 = precise::max(_265, _497);
    float _537 = precise::max(_269, _497);
    float _539 = precise::max(_269, _521);
    bool _541 = !_529;
    float _543 = _475;
    float _545 = _463;
    float _547 = _465;
    float _549 = _457;
    float _551 = _459;
    if (!_541)
    {
        float _553 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[42].z;
        float _555 = -(*spvDescriptorSet0.fp_c9)._m0[42].y;
        float _557 = _479 + _555;
        float _559 = rsqrt(_467);
        float _561 = _557 * _553;
        float _563 = _475 + (*spvDescriptorSet0.fp_c9)._m0[42].z;
        float _565 = _561 * 0.15915493667125701904296875;
        float _567 = _565 * 6.283185482025146484375;
        float _569 = sin(_567);
        float _571 = _565 * 6.283185482025146484375;
        float _573 = cos(_571);
        float _575 = fma(_569, _563, (*spvDescriptorSet0.fp_c9)._m0[42].y);
        float _577 = _559 * _575;
        float _579 = _573 + (-1.0);
        float _581 = _457 * _577;
        float _583 = _459 * _577;
        float _585 = _579 * (*spvDescriptorSet0.fp_c9)._m0[42].z;
        float _587 = _583 * _583;
        float _589 = fma(_475, _573, _585);
        float _591 = _581 * _581;
        _543 = _589;
        _545 = _591;
        _547 = _587;
        _549 = _581;
        _551 = _583;
    }
    float _593 = _543;
    float _595 = _545;
    float _597 = _547;
    float _599 = _549;
    float _601 = _551;
    float _603 = fma(_593, _593, _595);
    int _605 = _183 + 25952;
    uint _607 = uint(int(uint(_605) >> uint(2)));
    uint _609 = uint(int(uint(int(_607)) >> uint(2)));
    int _611 = int(_607) & 3;
    float _613 = (*spvDescriptorSet0.fp_c9)._m0[int(_609)][_611];
    float _615 = _603 + _597;
    float _617 = -(*spvDescriptorSet0.fp_c9)._m0[63].y;
    float _619 = fma(_531, (*spvDescriptorSet0.fp_c9)._m0[63].x, _617);
    float _621 = precise::clamp(_619, 0.0, 1.0);
    float _623 = rsqrt(_615);
    float _625 = -_621;
    float _627 = _625 + 1.0;
    float _629 = abs(_627);
    float _631 = log2(_629);
    float _633 = _623 * _599;
    float _635 = _623 * _593;
    float _637 = _623 * _601;
    float _639 = float(uint(_245));
    float _641 = _633 * (*spvDescriptorSet0.fp_c9)._m0[69].x;
    float _643 = _635 + 1.0;
    float _645 = rint(_613);
    float _647 = precise::max(_645, 0.0);
    uint _649 = uint(_647);
    uint _651 = clamp(_649, 0u, 65535u);
    float _653 = _631 * (*spvDescriptorSet0.fp_c9)._m0[64].x;
    float _655 = -_641;
    float _657 = fma(_635, (*spvDescriptorSet0.fp_c9)._m0[69].y, _655);
    float _659 = _639 * 0.00390625;
    float _661 = -_637;
    float _663 = fma(_661, (*spvDescriptorSet0.fp_c9)._m0[69].z, _657);
    float _665 = exp2(_653);
    float _667 = fma(_663, -0.5, 0.5);
    float _669 = fma(_663, 0.5, 0.5);
    float _671 = fma(_669, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _673 = sqrt(_667);
    float _675 = fma(_669, _671, -0.212114393711090087890625);
    float _677 = fma(_669, _675, 1.570728778839111328125);
    float _679 = -_635;
    float _681 = fma(_665, _643, _679);
    float _683 = float(uint(_251));
    float _685 = float(uint(_257));
    float _687 = fma(_681, 0.5, 0.5);
    float _689 = precise::max(_537, _659);
    float _691 = _683 * 0.00390625;
    float _693 = _685 * 0.00390625;
    float _695 = _673 * 0.636619746685028076171875;
    float _697 = precise::max(_535, _691);
    float _699 = fma(_163, 6.2500002968590706586837768554688e-05, 0.5);
    float _701 = precise::clamp(_699, 0.0, 1.0);
    float _703 = fma(_165, 6.2500002968590706586837768554688e-05, 0.5);
    float _705 = precise::clamp(_703, 0.0, 1.0);
    float _707 = -_677;
    float _709 = fma(_695, _707, 1.0);
    float2 _2401 = float2(_709, _687);
    float3 _713 = dm_bs(spvDescriptorSet0.fp_t_tcb_16.sample(spvDescriptorSet0.fp_t_tcb_16Smplr, select(_2401, float2(0.0), isnan(_2401))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_16, spvDescriptorSet0.fp_t_tcb_16Smplr_w, select(_2401, float2(0.0), isnan(_2401))).xyz;
    float _715 = _713.x;
    float _717 = _713.y;
    float _719 = _713.z;
    float2 _2415 = float2(_701, _705);
    float4 _722 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_2415, float2(0.0), isnan(_2415))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_2415, float2(0.0), isnan(_2415))).xyzw;
    float _724 = _722.x;
    float _726 = _722.y;
    float _728 = _722.z;
    float _730 = _722.w;
    float _732 = precise::max(_539, _693);
    float3 _2437 = float3(_233, _235, float(int(_651)));
    float3 _2441 = select(_2437, float3(0.0), isnan(_2437));
    float _734 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _2441.xy, uint(rint(_2441.z)), level(_689)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _2441.xy, uint(rint(_2441.z)), level(_689)).z;
    float3 _2451 = float3(_229, _231, float(int(_651)));
    float3 _2453 = select(_2451, float3(0.0), isnan(_2451));
    float _736 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _2453.xy, uint(rint(_2453.z)), level(_697)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _2453.xy, uint(rint(_2453.z)), level(_697)).x;
    float3 _2463 = float3(_237, _239, float(int(_651)));
    float3 _2465 = select(_2463, float3(0.0), isnan(_2463));
    float3 _738 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, _2465.xy, uint(rint(_2465.z)), level(_732)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, _2465.xy, uint(rint(_2465.z)), level(_732)).xyz;
    float _740 = _738.x;
    float _742 = _738.y;
    float _744 = _738.z;
    float _746 = _327 * (*spvDescriptorSet0.fp_c9)._m0[1117].y;
    float _748 = _327 * (*spvDescriptorSet0.fp_c9)._m0[1118].y;
    float _750 = fma(_477, _533, -0.0039370059967041015625);
    float _752 = fma(_469, _533, -0.0039370059967041015625);
    float _754 = fma(_163, (*spvDescriptorSet0.fp_c9)._m0[1117].x, _746);
    float _756 = fma(_163, (*spvDescriptorSet0.fp_c9)._m0[1118].x, _748);
    float _758 = in.m_63.y;
    float _760 = gl_FragCoord.w;
    float _762 = _758 * _760;
    float _764 = fma(_487, _533, -0.0039370059967041015625);
    float _766 = fma(_165, (*spvDescriptorSet0.fp_c9)._m0[1117].z, _754);
    float _768 = fma(_165, (*spvDescriptorSet0.fp_c9)._m0[1118].z, _756);
    float _770 = abs(_485);
    bool _772 = _770 > 0.00999999977648258209228515625;
    float _774 = _766 + (*spvDescriptorSet0.fp_c9)._m0[1117].w;
    float _776 = _768 + (*spvDescriptorSet0.fp_c9)._m0[1118].w;
    float _778 = trunc(_774);
    int _780 = int(_778);
    float _782 = trunc(_776);
    int _784 = int(_782);
    float _786 = in.m_63.x;
    float _788 = gl_FragCoord.w;
    float _790 = _786 * _788;
    float _792 = in.m_63.z;
    float _794 = gl_FragCoord.w;
    float _796 = _792 * _794;
    float _798 = in.m_63.w;
    float _800 = gl_FragCoord.w;
    float _802 = _798 * _800;
    float _804 = spvFAdd(_531, 9.9999997473787516355514526367188e-06);
    int _806 = ~as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].y);
    int _808 = _780 + _806;
    int _810 = _808 + 1;
    float _812 = 1.0 / _804;
    bool _814 = _810 >= as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].x);
    int _816 = ~as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].z);
    int _818 = _784 + _816;
    int _820 = _818 + 1;
    int _822 = _810 | _820;
    bool _824 = _822 < 0;
    bool _826 = _824 || _814;
    float _828 = _509 * _812;
    float _830 = _772 ? _485 : 0.00999999977648258209228515625;
    float _832 = _503 * _812;
    bool _834 = _820 >= as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].x);
    bool _836 = _834 || _826;
    float _838 = _485 * _812;
    float _840 = _161 * _762;
    float _842 = _830 * (*spvDescriptorSet0.fp_c9)._m0[66].x;
    float _844 = _161 * _790;
    float _846 = _161 * _796;
    float _848 = _161 * _802;
    float _850 = _802;
    if (_836)
    {
        _850 = (*spvDescriptorSet0.fp_c9)._m0[42].x;
    }
    float _852 = _850;
    float _854 = _852;
    if (!_836)
    {
        int _856 = _820 * as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].x);
        int _858 = _856 + _810;
        float _860 = floor(_776);
        int _862 = _858 << 2;
        int _864 = _858 >> 2;
        int _866 = 12 & _862;
        int _868 = _864 << 4;
        int _870 = _868 + _866;
        float _872 = floor(_774);
        int _874 = _870 + 16256;
        uint _876 = uint(int(uint(_874) >> uint(2)));
        uint _878 = uint(int(uint(int(_876)) >> uint(2)));
        int _880 = int(_876) & 3;
        float _882 = (*spvDescriptorSet0.fp_c9)._m0[int(_878)][_880];
        float _884 = -_860;
        float _886 = _776 + _884;
        float _888 = -_872;
        float _890 = _774 + _888;
        float _892 = rint(_882);
        float _894 = precise::max(_892, 0.0);
        uint _896 = uint(_894);
        uint _898 = clamp(_896, 0u, 65535u);
        float3 _2714 = float3(_890, _886, float(int(_898)));
        float3 _2716 = select(_2714, float3(0.0), isnan(_2714));
        float _900 = dm_bs(spvDescriptorSet0.fp_t_tcb_14.sample(spvDescriptorSet0.fp_t_tcb_14Smplr, _2716.xy, uint(rint(_2716.z))), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_14, spvDescriptorSet0.fp_t_tcb_14Smplr_w, _2716.xy, uint(rint(_2716.z))).x;
        int _902 = _858 << 4;
        int _904 = _902 + 17904;
        int _906 = _870 + 24304;
        uint _908 = uint(int(uint(_906) >> uint(2)));
        uint _910 = uint(int(uint(int(_908)) >> uint(2)));
        int _912 = int(_908) & 3;
        float _914 = (*spvDescriptorSet0.fp_c9)._m0[int(_910)][_912];
        uint _916 = uint(int(uint(_904) >> uint(2)));
        uint _918 = uint(int(uint(int(_916)) >> uint(2)));
        int _920 = int(_916) & 3;
        float _922 = (*spvDescriptorSet0.fp_c9)._m0[int(_918)][_920];
        int _924 = int(_916) + 1;
        uint _926 = uint(int(uint(_924) >> uint(2)));
        int _928 = _924 & 3;
        float _930 = (*spvDescriptorSet0.fp_c9)._m0[int(_926)][_928];
        int _932 = _904 + 8;
        uint _934 = uint(int(uint(_932) >> uint(2)));
        uint _936 = uint(int(uint(int(_934)) >> uint(2)));
        int _938 = int(_934) & 3;
        float _940 = (*spvDescriptorSet0.fp_c9)._m0[int(_936)][_938];
        int _942 = int(_934) + 1;
        uint _944 = uint(int(uint(_942) >> uint(2)));
        int _946 = _942 & 3;
        float _948 = (*spvDescriptorSet0.fp_c9)._m0[int(_944)][_946];
        float _950 = _327 * _930;
        float _952 = fma(_163, _922, _950);
        float _954 = 1.0 / _914;
        float _956 = fma(_165, _940, _952);
        float _958 = _956 + _948;
        float _960 = precise::clamp(_958, 0.0, 1.0);
        float _962 = -_960;
        float _964 = _962 + _900;
        float _966 = _914 * (*spvDescriptorSet0.fp_c13)._m0[4].z;
        float _968 = fma(_954, (*spvDescriptorSet0.fp_c13)._m0[4].w, _964);
        float _970 = _966 * _968;
        float _972 = exp2(_970);
        float _974 = 0.0 + _972;
        float _976 = precise::clamp(_974, 0.0, 1.0);
        float _978 = precise::min(_976, (*spvDescriptorSet0.fp_c9)._m0[42].x);
        _854 = _978;
    }
    float _980 = _854;
    float _982 = precise::max(_842, -127.0);
    float _984 = _531 + (-250.0);
    float _986 = _838 * 0.75187969207763671875;
    float _988 = -_982;
    float _990 = exp2(_988);
    float _992 = -_848;
    float _994 = -(*spvDescriptorSet0.fp_c9)._m0[41].z;
    float _996 = _992 + _994;
    float _998 = (*spvDescriptorSet0.fp_c9)._m0[66].x * (*spvDescriptorSet0.fp_c9)._m0[66].y;
    float _1000 = precise::max(0.0, _984);
    float _1002 = _996 * (*spvDescriptorSet0.fp_c9)._m0[41].w;
    float _1004 = precise::clamp(_1002, 0.0, 1.0);
    float _1006 = 1.0 / _982;
    float _1008 = _1000 * 0.001000000047497451305389404296875;
    float _1010 = precise::clamp(_1008, 0.0, 1.0);
    float _1012 = fma(_1010, -0.20000000298023223876953125, 0.9900000095367431640625);
    float _1014 = -_998;
    float _1016 = exp2(_1014);
    float _1018 = -_990;
    float _1020 = _1018 + 1.0;
    float _1022 = _832 * _750;
    float _1024 = -_838;
    float _1026 = -_1022;
    float _1028 = fma(_1024, _752, _1026);
    float _1030 = -_828;
    float _1032 = fma(_1030, _764, _1028);
    float _1034 = precise::clamp(_1032, 0.0, 1.0);
    float _1036 = _1016 * _1020;
    float _1038 = fma(_1010, 0.20000000298023223876953125, 0.00999999977648258209228515625);
    float _1040 = _1034 * (-9.27999973297119140625);
    float _1042 = _1036 * _1006;
    float _1044 = fma(_838, _752, _1022);
    float _1046 = exp2(_1040);
    float _1048 = fma(_828, _764, _1044);
    float _1050 = fma(_1038, -0.0274999998509883880615234375, 0.0425000004470348358154296875);
    float _1052 = fma(_1038, -0.572000026702880859375, 1.03999996185302734375);
    float _1054 = _838 * (*spvDescriptorSet0.fp_c9)._m0[69].y;
    float _1056 = _1048 * _1048;
    float _1058 = fma(_1038, 0.02199999988079071044921875, -0.039999999105930328369140625);
    float _1060 = _832 * 0.75187969207763671875;
    float _1062 = fma(_1056, 0.565323054790496826171875, 0.434676945209503173828125);
    float _1064 = _531 * (*spvDescriptorSet0.fp_c9)._m0[65].w;
    float _1066 = _1012 * _1012;
    float _1068 = sqrt(_1062);
    float _1070 = _1042 * _1064;
    bool _1072 = _1062 >= 0.0;
    bool _1074 = isnan(_1062);
    bool _1076 = _1072 || _1074;
    bool _1078 = isnan(0.0);
    bool _1080 = _1076 || _1078;
    float _1082 = precise::min(_1066, _1046);
    float _1084 = fma(_832, (*spvDescriptorSet0.fp_c9)._m0[69].x, _1054);
    float _1086 = -_1070;
    float _1088 = exp2(_1086);
    float _1090 = fma(_828, (*spvDescriptorSet0.fp_c9)._m0[69].z, _1084);
    float _1092 = fma(_1012, _1082, _1050);
    float _1094 = -_980;
    float _1096 = _1094 + 1.0;
    float _1098 = fma(_1090, 2.0, (*spvDescriptorSet0.fp_c9)._m0[66].z);
    float _1100 = fma(_1048, 0.75187969207763671875, _1068);
    float _1102 = fma(_1004, _1096, _980);
    float _1104 = fma(_1092, -1.03999996185302734375, _1052);
    float _1106 = precise::clamp(_1104, 0.0, 1.0);
    float _1108 = fma(_1098, (*spvDescriptorSet0.fp_c9)._m0[66].z, 1.0);
    float _1110 = -_986;
    float _1112 = fma(_752, _1100, _1110);
    float _1114 = -_1060;
    float _1116 = fma(_750, _1100, _1114);
    float _1118 = _828 * 0.75187969207763671875;
    float _1120 = abs(_1108);
    float _1122 = log2(_1120);
    float _1124 = _631 * (*spvDescriptorSet0.fp_c9)._m0[64].y;
    float _1126 = _1080 ? _1112 : (-0.0);
    float _1128 = -_1118;
    float _1130 = fma(_764, _1100, _1128);
    float _1132 = _1080 ? _1116 : (-0.0);
    float _1134 = fma(_1092, 1.03999996185302734375, _1058);
    float _1136 = precise::clamp(_1134, 0.0, 1.0);
    float _1138 = _840 * 0.18672408163547515869140625;
    float _1140 = _1126 * (*spvDescriptorSet0.fp_c9)._m0[69].y;
    float _1142 = _1080 ? _1130 : (-0.0);
    float _1144 = exp2(_1124);
    float _1146 = fma(_1132, (*spvDescriptorSet0.fp_c9)._m0[69].x, _1140);
    float _1148 = precise::min(_1102, (*spvDescriptorSet0.fp_c9)._m0[62].x);
    float _1150 = fma(_844, 0.095146648585796356201171875, _1138);
    float _1152 = fma(_1142, (*spvDescriptorSet0.fp_c9)._m0[69].z, _1146);
    float _1154 = _1122 * 1.5;
    float _1156 = fma(_846, 0.0364394821226596832275390625, _1150);
    float _1158 = 0.2820948064327239990234375 * (*spvDescriptorSet0.fp_c9)._m0[991].y;
    float _1160 = fma(_1106, 0.02005931176245212554931640625, _1136);
    float _1162 = -_1136;
    float _1164 = _1162 + 1.0;
    float _1166 = fma((*spvDescriptorSet0.fp_c11)._m0[15].w, (*spvDescriptorSet0.fp_c11)._m0[15].w, 1.0);
    float _1168 = (*spvDescriptorSet0.fp_c11)._m0[15].w * 2.0;
    float _1170 = exp2(_1154);
    float _1172 = -_1144;
    float _1174 = _1172 + 1.0;
    float _1176 = -(*spvDescriptorSet0.fp_c11)._m0[15].w;
    float _1178 = fma(_1176, (*spvDescriptorSet0.fp_c11)._m0[15].w, 1.0);
    float _1180 = -_1168;
    float _1182 = fma(_1152, _1180, _1166);
    float _1184 = fma(_752, 0.5, 0.5);
    float _1186 = -(*spvDescriptorSet0.fp_c9)._m0[1007].y;
    float _1188 = _1186 + (*spvDescriptorSet0.fp_c9)._m0[1006].y;
    float _1190 = fma(_1184, _1188, (*spvDescriptorSet0.fp_c9)._m0[1007].y);
    float _1192 = abs(_1182);
    float _1194 = log2(_1192);
    float _1196 = -(*spvDescriptorSet0.fp_c9)._m0[1007].x;
    float _1198 = _1196 + (*spvDescriptorSet0.fp_c9)._m0[1006].x;
    float _1200 = -(*spvDescriptorSet0.fp_c9)._m0[1007].z;
    float _1202 = _1200 + (*spvDescriptorSet0.fp_c9)._m0[1006].z;
    float _1204 = _1190 * 0.715200006961822509765625;
    float _1206 = _1170 * 12.56637096405029296875;
    float _1208 = fma(_1184, _1198, (*spvDescriptorSet0.fp_c9)._m0[1007].x);
    float _1210 = fma(_1184, _1202, (*spvDescriptorSet0.fp_c9)._m0[1007].z);
    float _1212 = 1.0 / _1206;
    float _1214 = fma(_1208, 0.2125999927520751953125, _1204);
    float _1216 = fma(_1210, 0.072200000286102294921875, _1214);
    float _1218 = -(*spvDescriptorSet0.fp_c9)._m0[66].z;
    float _1220 = fma(_1218, (*spvDescriptorSet0.fp_c9)._m0[66].z, 1.0);
    float _1222 = _1194 * 1.5;
    float _1224 = _1174 * (*spvDescriptorSet0.fp_c9)._m0[64].z;
    float _1226 = 1.0 / _1216;
    float _1228 = -_1224;
    float _1230 = _1228 + 1.0;
    float _1232 = _1224 * _1088;
    float _1234 = _1220 * _1212;
    float _1236 = _1088 * _1230;
    float _1238 = -_1088;
    float _1240 = _1238 + 1.0;
    float _1242 = exp2(_1222);
    float _1244 = _1240 * _1234;
    float _1246 = _1148 * _1244;
    float _1248 = _1226 * (*spvDescriptorSet0.fp_c9)._m0[39].z;
    float _1250 = precise::clamp(_1248, 0.0, 1.0);
    float _1252 = _742 * 0.4774648249149322509765625;
    float _1254 = _740 * 0.4774648249149322509765625;
    float _1256 = 0.2820948064327239990234375 * (*spvDescriptorSet0.fp_c9)._m0[991].x;
    float _1258 = fma(_1250, (*spvDescriptorSet0.fp_c9)._m0[39].y, (*spvDescriptorSet0.fp_c9)._m0[39].x);
    float _1260 = _1252 * (*spvDescriptorSet0.fp_c9)._m0[68].y;
    float _1262 = _1254 * (*spvDescriptorSet0.fp_c9)._m0[68].x;
    float _1264 = _1242 * 12.56637096405029296875;
    float _1266 = _1258 * 0.31830990314483642578125;
    float _1268 = precise::max(_1156, 0.00999999977648258209228515625);
    float _1270 = fma(_734, _1158, _1260);
    float _1272 = 1.0 / _1264;
    float _1274 = _1208 * _1266;
    float _1276 = _1190 * _1266;
    float _1278 = _1210 * _1266;
    float _1280 = _1270 * 0.586610972881317138671875;
    float _1282 = 1.0 / _1268;
    float _1284 = _1178 * _1272;
    float _1286 = _744 * 0.4774648249149322509765625;
    float _1288 = 0.2820948064327239990234375 * (*spvDescriptorSet0.fp_c9)._m0[991].z;
    float _1290 = fma(_734, _1256, _1262);
    float _1292 = _730 + (*spvDescriptorSet0.fp_c11)._m0[15].x;
    float _1294 = _1286 * (*spvDescriptorSet0.fp_c9)._m0[68].z;
    float _1296 = precise::max(_1260, _1276);
    float _1298 = fma(_1290, 0.298911988735198974609375, _1280);
    float _1300 = _730 + (*spvDescriptorSet0.fp_c11)._m0[15].y;
    float _1302 = fma(_734, _1288, _1294);
    float _1304 = precise::max(_1294, _1278);
    float _1306 = fma(_734, _1158, _1296);
    float _1308 = fma(_1302, 0.114477999508380889892578125, _1298);
    float _1310 = precise::max(_1262, _1274);
    float _1312 = fma(_734, _1288, _1304);
    float _1314 = 1.0 / _1292;
    float _1316 = _730 + (*spvDescriptorSet0.fp_c11)._m0[15].z;
    float _1318 = _1308 * _1282;
    float _1320 = fma(_734, _1256, _1310);
    float _1322 = _1164 * 3.1415927410125732421875;
    float _1324 = _736 * (*spvDescriptorSet0.fp_c9)._m0[70].x;
    float _1326 = precise::min(_1318, (*spvDescriptorSet0.fp_c9)._m0[27].w);
    float _1328 = _1320 * _1322;
    float _1330 = _1306 * _1322;
    float _1332 = _1312 * _1322;
    float _1334 = _736 * (*spvDescriptorSet0.fp_c9)._m0[70].y;
    float _1336 = _724 * _1328;
    float _1338 = 1.0 / _1300;
    float _1340 = _724 * _1324;
    float _1342 = _726 * _1334;
    float _1344 = _726 * _1330;
    float _1346 = _736 * (*spvDescriptorSet0.fp_c9)._m0[70].z;
    float _1348 = _728 * _1332;
    float _1350 = _1336 * 0.079577468335628509521484375;
    float _1352 = _1344 * 0.079577468335628509521484375;
    float _1354 = 1.0 / _1316;
    float _1356 = _728 * _1346;
    float _1358 = _1348 * 0.079577468335628509521484375;
    float _1360 = fma(_1284, _1340, _1350);
    float _1362 = fma(_1284, _1342, _1352);
    float _1364 = _1326 * 0.31830990314483642578125;
    float _1366 = fma(_1284, _1356, _1358);
    float _1368 = _730 * _1360;
    float _1370 = _730 * _1362;
    float _1372 = _1160 * _1364;
    float _1374 = _730 * _1366;
    float _1376 = _1368 * _1314;
    float _1378 = _1370 * _1338;
    float _1380 = _1246 * (*spvDescriptorSet0.fp_c9)._m0[70].y;
    float _1382 = _1246 * (*spvDescriptorSet0.fp_c9)._m0[70].x;
    float _1384 = fma(_844, _1372, _1376);
    float _1386 = _1374 * _1354;
    float _1388 = fma(_840, _1372, _1378);
    float _1390 = fma(_717, _1232, _1380);
    float _1392 = _1246 * (*spvDescriptorSet0.fp_c9)._m0[70].z;
    float _1394 = fma(_846, _1372, _1386);
    float _1396 = precise::max(0.0, _1384);
    float _1398 = fma(_715, _1232, _1382);
    float _1400 = precise::max(0.0, _1388);
    float _1402 = fma(_719, _1232, _1392);
    float _1404 = precise::max(0.0, _1394);
    float _1406 = fma(_1236, _1396, _1398);
    float _1408 = fma(_1236, _1400, _1390);
    float _1410 = fma(_1236, _1404, _1402);
    out.m_66.x = _1406;
    out.m_66.y = _1408;
    out.m_66.z = _1410;
    out.m_66.w = 1.0;
    out.m_68.x = _1406;
    out.m_68.y = _1408;
    out.m_68.z = _1410;
    out.m_68.w = 1.0;
    return out;
}

