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

struct spvDescriptorSetBuffer0
{
    constant _16* fp_c9 [[id(0)]];
    constant _16* fp_c4 [[id(1)]];
    constant _16* fp_c7 [[id(2)]];
    constant _16* fp_c11 [[id(3)]];
    constant _16* fp_c13 [[id(4)]];
    texture2d<float> fp_t_tcb_12 [[id(5)]];
    sampler fp_t_tcb_12Smplr [[id(6)]];
    texture3d<float> fp_t_tcb_14 [[id(7)]];
    sampler fp_t_tcb_14Smplr [[id(8)]];
    texture2d<float> fp_t_tcb_8 [[id(9)]];
    sampler fp_t_tcb_8Smplr [[id(10)]];
    texture2d<float> fp_t_tcb_C [[id(11)]];
    sampler fp_t_tcb_CSmplr [[id(12)]];
    texture2d_array<float> fp_t_tcb_A [[id(13)]];
    sampler fp_t_tcb_ASmplr [[id(14)]];
    sampler fp_t_tcb_12Smplr_w [[id(15)]];
    sampler fp_t_tcb_14Smplr_w [[id(16)]];
    sampler fp_t_tcb_8Smplr_w [[id(17)]];
    sampler fp_t_tcb_CSmplr_w [[id(18)]];
    sampler fp_t_tcb_ASmplr_w [[id(19)]];
    constant dm_border_t* dm_border [[id(20)]];
};

struct main0_out
{
    float4 m_60 [[color(0)]];
    float4 m_62 [[color(1)]];
};

struct main0_in
{
    float4 m_53 [[user(locn0)]];
    float4 m_55 [[user(locn5)]];
    float4 m_51 [[user(locn6)]];
    float4 m_57 [[user(locn7)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _69 = gl_FragCoord.w;
    float _71 = in.m_51.z;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = in.m_51.x;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = in.m_51.y;
    float _85 = gl_FragCoord.w;
    float _87 = _83 * _85;
    float _89 = 1.0 / _69;
    float _91 = _89 * _75;
    float _93 = _89 * _81;
    float _95 = _89 * _87;
    float _97 = -(*spvDescriptorSet0.fp_c9)._m0[26].z;
    float _99 = _91 + _97;
    float _101 = -(*spvDescriptorSet0.fp_c9)._m0[26].x;
    float _103 = _93 + _101;
    float _105 = -(*spvDescriptorSet0.fp_c4)._m0[11].w;
    float _107 = _93 + _105;
    float _109 = -(*spvDescriptorSet0.fp_c4)._m0[13].w;
    float _111 = _91 + _109;
    float _113 = _99 * _99;
    float _115 = fma(_103, _103, _113);
    float _117 = sqrt(_115);
    bool _121 = _117 > (*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _123 = -(*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _125 = _117 + _123;
    float _127 = 0.0;
    float _129 = _125;
    float _131 = _87;
    if (_121)
    {
        float _133 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _127 = _133;
    }
    float _135 = _127;
    float _137 = 0.0;
    if (_121)
    {
        float _139 = rsqrt(_115);
        _137 = _139;
    }
    float _141 = _137;
    float _143 = _135;
    float _145 = _141;
    if (_121)
    {
        float _147 = _125 * _135;
        _129 = _147;
    }
    float _149 = _129;
    if (_121)
    {
        float _151 = _95 + (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _143 = _151;
    }
    float _153 = _143;
    float _155 = 0.0;
    float _157 = _153;
    if (_121)
    {
        float _159 = _149 * 0.15915493667125701904296875;
        _155 = _159;
    }
    float _161 = _155;
    float _163 = 0.0;
    if (_121)
    {
        float _165 = _161 * 6.283185482025146484375;
        float _167 = cos(_165);
        _163 = _167;
    }
    float _169 = _163;
    float _171 = _149;
    if (_121)
    {
        float _173 = _161 * 6.283185482025146484375;
        float _175 = sin(_173);
        _171 = _175;
    }
    float _177 = _171;
    float _179 = 0.0;
    if (_121)
    {
        float _181 = _169 + (-1.0);
        _179 = _181;
    }
    float _183 = _179;
    float _185 = _183;
    if (_121)
    {
        float _187 = _183 * (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _131 = _187;
    }
    float _189 = _131;
    if (!_121)
    {
        _185 = _93;
    }
    float _191 = _185;
    float _193 = 0.0;
    float _195 = _177;
    float _197 = _191;
    if (_121)
    {
        float _199 = fma(_177, _153, (*spvDescriptorSet0.fp_c9)._m0[42].y);
        _193 = _199;
    }
    float _201 = _193;
    if (!_121)
    {
        _157 = _95;
    }
    float _203 = _157;
    float _205 = _203;
    if (_121)
    {
        float _207 = fma(_95, _169, _189);
        _205 = _207;
    }
    float _209 = _205;
    if (!_121)
    {
        _195 = _91;
    }
    float _211 = _195;
    float _213 = _211;
    if (_121)
    {
        float _215 = _141 * _201;
        _145 = _215;
    }
    float _217 = _145;
    if (_121)
    {
        float _219 = fma(_103, _217, (*spvDescriptorSet0.fp_c9)._m0[26].x);
        _197 = _219;
    }
    float _221 = _197;
    float _223 = -(*spvDescriptorSet0.fp_c9)._m0[26].y;
    float _225 = _209 + _223;
    float _227 = _225;
    if (_121)
    {
        float _229 = fma(_99, _217, (*spvDescriptorSet0.fp_c9)._m0[26].z);
        _213 = _229;
    }
    float _231 = _213;
    float _233 = -(*spvDescriptorSet0.fp_c9)._m0[26].x;
    float _235 = _221 + _233;
    float _237 = _225 * _225;
    float _239 = -(*spvDescriptorSet0.fp_c9)._m0[26].z;
    float _241 = _231 + _239;
    float _243 = fma(_235, _235, _237);
    float _245 = -(*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _247 = _95 + _245;
    float _249 = fma(_241, _241, _243);
    float _251 = _247 * _247;
    float _253 = fma(_107, _107, _251);
    float _255 = rsqrt(_249);
    float _257 = fma(_111, _111, _253);
    float _259 = sqrt(_257);
    float _261 = _255 * (*spvDescriptorSet0.fp_c9)._m0[26].w;
    float _263 = _235 * _261;
    float _265 = _241 * _261;
    float _267 = _263 * _263;
    float _269 = _265 * _265;
    float _271 = -(*spvDescriptorSet0.fp_c9)._m0[63].y;
    float _273 = fma(_259, (*spvDescriptorSet0.fp_c9)._m0[63].x, _271);
    float _275 = precise::clamp(_273, 0.0, 1.0);
    float _277 = (*spvDescriptorSet0.fp_c9)._m0[26].y + (-220.0);
    float _279 = _267 + _269;
    float _281 = -_275;
    float _283 = _281 + 1.0;
    float _285 = precise::max(0.0, _277);
    float _287 = sqrt(_279);
    float _289 = -_261;
    float _291 = -_285;
    float _293 = fma(_225, _289, _291);
    float _295 = abs(_283);
    float _297 = log2(_295);
    bool _299 = _287 > (*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _301 = _275;
    float _303 = _285;
    float _305 = _263;
    float _307 = _265;
    if (!_299)
    {
        _301 = _269;
    }
    float _309 = _301;
    float _311 = _309;
    if (!_299)
    {
        _227 = _267;
    }
    float _313 = _227;
    float _315 = _313;
    if (!_299)
    {
        _303 = _293;
    }
    float _317 = _303;
    bool _319 = !_299;
    float _321 = _317;
    if (!_319)
    {
        float _323 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[42].z;
        float _325 = -(*spvDescriptorSet0.fp_c9)._m0[42].y;
        float _327 = _287 + _325;
        float _329 = _293 + (*spvDescriptorSet0.fp_c9)._m0[42].z;
        float _331 = rsqrt(_279);
        float _333 = _327 * _323;
        float _335 = _333 * 0.15915493667125701904296875;
        float _337 = _335 * 6.283185482025146484375;
        float _339 = sin(_337);
        float _341 = _335 * 6.283185482025146484375;
        float _343 = cos(_341);
        float _345 = fma(_339, _329, (*spvDescriptorSet0.fp_c9)._m0[42].y);
        float _347 = _331 * _345;
        float _349 = _343 + (-1.0);
        float _351 = _263 * _347;
        float _353 = _265 * _347;
        float _355 = _349 * (*spvDescriptorSet0.fp_c9)._m0[42].z;
        float _357 = _353 * _353;
        float _359 = fma(_293, _343, _355);
        float _361 = _351 * _351;
        _321 = _359;
        _315 = _361;
        _311 = _357;
        _305 = _351;
        _307 = _353;
    }
    float _363 = _321;
    float _365 = _315;
    float _367 = _311;
    float _369 = _305;
    float _371 = _307;
    float _373 = fma(_363, _363, _365);
    float _375 = in.m_53.x;
    float _377 = gl_FragCoord.w;
    float _379 = _375 * _377;
    float _381 = _373 + _367;
    float _383 = _297 * (*spvDescriptorSet0.fp_c9)._m0[64].x;
    float _385 = fma(_93, 6.2500002968590706586837768554688e-05, 0.5);
    float _387 = precise::clamp(_385, 0.0, 1.0);
    float _389 = exp2(_383);
    float _391 = rsqrt(_381);
    float _393 = _91 + (*spvDescriptorSet0.fp_c7)._m0[11].y;
    float _395 = _393 * (*spvDescriptorSet0.fp_c11)._m0[30].z;
    float _397 = _391 * _369;
    float _399 = _391 * _363;
    float _401 = _89 * _379;
    float _403 = _397 * (*spvDescriptorSet0.fp_c9)._m0[69].x;
    float _405 = _391 * _371;
    float _407 = _399 + 1.0;
    float _409 = in.m_53.y;
    float _411 = gl_FragCoord.w;
    float _413 = _409 * _411;
    float _415 = -_403;
    float _417 = fma(_399, (*spvDescriptorSet0.fp_c9)._m0[69].y, _415);
    float _419 = _95 + (*spvDescriptorSet0.fp_c7)._m0[11].y;
    float _421 = -_405;
    float _423 = fma(_421, (*spvDescriptorSet0.fp_c9)._m0[69].z, _417);
    float _425 = -_399;
    float _427 = fma(_389, _407, _425);
    float _429 = _419 * (*spvDescriptorSet0.fp_c11)._m0[30].y;
    float _431 = fma(_423, -0.5, 0.5);
    float _433 = fma(_423, 0.5, 0.5);
    float _435 = fma(_427, 0.5, 0.5);
    float _437 = fma(_433, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _439 = sqrt(_431);
    float _441 = _93 + (*spvDescriptorSet0.fp_c7)._m0[11].y;
    float _443 = fma(_433, _437, -0.212114393711090087890625);
    float _445 = _441 * (*spvDescriptorSet0.fp_c11)._m0[30].x;
    float _447 = fma(_433, _443, 1.570728778839111328125);
    float _449 = fma(_429, (*spvDescriptorSet0.fp_c11)._m0[45].x, (*spvDescriptorSet0.fp_c11)._m0[29].y);
    float _451 = fma(_395, (*spvDescriptorSet0.fp_c11)._m0[45].x, (*spvDescriptorSet0.fp_c11)._m0[29].z);
    float _453 = fma(_445, (*spvDescriptorSet0.fp_c11)._m0[45].x, (*spvDescriptorSet0.fp_c11)._m0[29].x);
    float _455 = _439 * 0.636619746685028076171875;
    float _457 = fma(_91, 6.2500002968590706586837768554688e-05, 0.5);
    float _459 = precise::clamp(_457, 0.0, 1.0);
    float _461 = _89 * _413;
    float _463 = -_447;
    float _465 = fma(_455, _463, 1.0);
    float2 _1655 = float2(_387, _459);
    float _467 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_1655, float2(0.0), isnan(_1655))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_1655, float2(0.0), isnan(_1655))).x;
    float3 _1666 = float3(_453, _449, _451);
    float _469 = dm_bs(spvDescriptorSet0.fp_t_tcb_14.sample(spvDescriptorSet0.fp_t_tcb_14Smplr, select(_1666, float3(0.0), isnan(_1666))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_14, spvDescriptorSet0.fp_t_tcb_14Smplr_w, select(_1666, float3(0.0), isnan(_1666))).x;
    float2 _1676 = float2(_401, _461);
    float3 _473 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1676, float2(0.0), isnan(_1676))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1676, float2(0.0), isnan(_1676))).xyz;
    float _475 = _473.x;
    float _477 = _473.y;
    float _479 = _473.z;
    float2 _1690 = float2(_465, _435);
    float3 _481 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1690, float2(0.0), isnan(_1690))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1690, float2(0.0), isnan(_1690))).xyz;
    float _483 = _481.x;
    float _485 = _481.y;
    float _487 = _481.z;
    float _489 = in.m_55.y;
    float _491 = gl_FragCoord.w;
    float _493 = _489 * _491;
    float _495 = in.m_55.x;
    float _497 = gl_FragCoord.w;
    float _499 = _495 * _497;
    float _501 = spvFAdd(_259, 9.9999997473787516355514526367188e-06);
    float _503 = in.m_55.z;
    float _505 = gl_FragCoord.w;
    float _507 = _503 * _505;
    float _509 = 1.0 / _501;
    float _511 = abs(_247);
    bool _513 = _511 > 0.00999999977648258209228515625;
    float _515 = (*spvDescriptorSet0.fp_c9)._m0[66].x * (*spvDescriptorSet0.fp_c9)._m0[66].y;
    float _517 = _95 * (*spvDescriptorSet0.fp_c9)._m0[1117].y;
    float _519 = _513 ? _247 : 0.00999999977648258209228515625;
    float _521 = fma(_93, (*spvDescriptorSet0.fp_c9)._m0[1117].x, _517);
    float _523 = -_515;
    float _525 = exp2(_523);
    float _527 = _519 * (*spvDescriptorSet0.fp_c9)._m0[66].x;
    float _529 = fma(_91, (*spvDescriptorSet0.fp_c9)._m0[1117].z, _521);
    float _531 = precise::max(_527, -127.0);
    float _533 = _107 * _509;
    float _535 = _111 * _509;
    float _537 = _529 + (*spvDescriptorSet0.fp_c9)._m0[1117].w;
    float _539 = -_531;
    float _541 = exp2(_539);
    float _543 = _89 * _493;
    float _545 = _89 * _499;
    float _547 = _543 * _543;
    float _549 = fma(_545, _545, _547);
    float _551 = _247 * _509;
    float _553 = _89 * _507;
    float _555 = _551 * (*spvDescriptorSet0.fp_c9)._m0[69].y;
    float _557 = fma(_553, _553, _549);
    float _559 = -(*spvDescriptorSet0.fp_c9)._m0[37].y;
    float _561 = 1.0 + _559;
    float _563 = fma(_533, (*spvDescriptorSet0.fp_c9)._m0[69].x, _555);
    float _565 = trunc(_537);
    int _568 = int(_565);
    float _570 = fma(_535, (*spvDescriptorSet0.fp_c9)._m0[69].z, _563);
    float _572 = _95 * (*spvDescriptorSet0.fp_c9)._m0[1118].y;
    float _574 = fma(_570, 2.0, (*spvDescriptorSet0.fp_c9)._m0[66].z);
    float _576 = fma(_93, (*spvDescriptorSet0.fp_c9)._m0[1118].x, _572);
    float _578 = rsqrt(_557);
    float _580 = fma(_574, (*spvDescriptorSet0.fp_c9)._m0[66].z, 1.0);
    float _582 = fma(_91, (*spvDescriptorSet0.fp_c9)._m0[1118].z, _576);
    float _584 = fma((*spvDescriptorSet0.fp_c9)._m0[37].y, (*spvDescriptorSet0.fp_c9)._m0[2649].y, _561);
    float _586 = fma((*spvDescriptorSet0.fp_c9)._m0[37].y, (*spvDescriptorSet0.fp_c9)._m0[2649].z, _561);
    float _588 = _582 + (*spvDescriptorSet0.fp_c9)._m0[1118].w;
    float _590 = in.m_57.w;
    float _592 = gl_FragCoord.w;
    float _594 = _590 * _592;
    float _596 = abs(_580);
    float _598 = log2(_596);
    float _600 = _584 * (*spvDescriptorSet0.fp_c11)._m0[39].w;
    float _602 = precise::min(_600, (*spvDescriptorSet0.fp_c11)._m0[13].x);
    float _604 = trunc(_588);
    int _606 = int(_604);
    float _608 = _545 * _578;
    float _610 = _543 * _578;
    float _612 = -_602;
    float _614 = _612 + 1.0;
    float _616 = _598 * 1.5;
    float _618 = -(*spvDescriptorSet0.fp_c11)._m0[13].y;
    float _620 = _618 + (*spvDescriptorSet0.fp_c11)._m0[13].z;
    float _622 = -_541;
    float _624 = _622 + 1.0;
    float _626 = fma(_614, _620, (*spvDescriptorSet0.fp_c11)._m0[13].y);
    float _628 = exp2(_616);
    int _630 = ~as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].y);
    int _632 = _568 + _630;
    int _634 = _632 + 1;
    float _636 = _525 * _624;
    int _638 = ~as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].z);
    int _640 = _606 + _638;
    int _642 = _640 + 1;
    float _644 = _608 * _533;
    bool _646 = _634 >= as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].x);
    float _648 = _553 * _578;
    int _650 = _634 | _642;
    float _652 = 1.0 / _531;
    bool _654 = _650 < 0;
    bool _656 = _654 || _646;
    bool _658 = _642 >= as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].x);
    bool _660 = _658 || _656;
    float _662 = _628 * 12.56637096405029296875;
    float _664 = _89 * _594;
    float _666 = -_551;
    float _668 = -_644;
    float _670 = fma(_610, _666, _668);
    float _672 = 1.0 / _662;
    float _674 = -_664;
    float _676 = -(*spvDescriptorSet0.fp_c9)._m0[41].z;
    float _678 = _674 + _676;
    float _680 = _636 * _652;
    float _682 = _259 * (*spvDescriptorSet0.fp_c9)._m0[65].w;
    float _684 = _551;
    if (_660)
    {
        _684 = (*spvDescriptorSet0.fp_c9)._m0[42].x;
    }
    float _686 = _684;
    float _688 = _680 * _682;
    float _690 = _686;
    if (!_660)
    {
        int _692 = _642 * as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].x);
        int _694 = _692 + _634;
        float _696 = floor(_537);
        int _698 = _694 << 2;
        int _700 = _694 >> 2;
        int _702 = 12 & _698;
        int _704 = _700 << 4;
        int _706 = _704 + _702;
        float _708 = floor(_588);
        int _710 = _706 + 16256;
        uint _713 = uint(int(uint(_710) >> uint(2)));
        uint _715 = uint(int(uint(int(_713)) >> uint(2)));
        int _717 = int(_713) & 3;
        float _719 = (*spvDescriptorSet0.fp_c9)._m0[int(_715)][_717];
        float _721 = -_696;
        float _723 = _537 + _721;
        float _725 = -_708;
        float _727 = _588 + _725;
        float _729 = rint(_719);
        float _731 = precise::max(_729, 0.0);
        uint _733 = uint(_731);
        uint _735 = clamp(_733, 0u, 65535u);
        float3 _2092 = float3(_723, _727, float(int(_735)));
        float3 _2094 = select(_2092, float3(0.0), isnan(_2092));
        float _737 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _2094.xy, uint(rint(_2094.z))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _2094.xy, uint(rint(_2094.z))).x;
        int _739 = _694 << 4;
        int _741 = _739 + 17904;
        int _743 = _706 + 24304;
        uint _745 = uint(int(uint(_743) >> uint(2)));
        uint _747 = uint(int(uint(int(_745)) >> uint(2)));
        int _749 = int(_745) & 3;
        float _751 = (*spvDescriptorSet0.fp_c9)._m0[int(_747)][_749];
        uint _753 = uint(int(uint(_741) >> uint(2)));
        uint _755 = uint(int(uint(int(_753)) >> uint(2)));
        int _757 = int(_753) & 3;
        float _759 = (*spvDescriptorSet0.fp_c9)._m0[int(_755)][_757];
        int _761 = int(_753) + 1;
        uint _763 = uint(int(uint(_761) >> uint(2)));
        int _765 = _761 & 3;
        float _767 = (*spvDescriptorSet0.fp_c9)._m0[int(_763)][_765];
        int _769 = _741 + 8;
        uint _771 = uint(int(uint(_769) >> uint(2)));
        uint _773 = uint(int(uint(int(_771)) >> uint(2)));
        int _775 = int(_771) & 3;
        float _777 = (*spvDescriptorSet0.fp_c9)._m0[int(_773)][_775];
        int _779 = int(_771) + 1;
        uint _781 = uint(int(uint(_779) >> uint(2)));
        int _783 = _779 & 3;
        float _785 = (*spvDescriptorSet0.fp_c9)._m0[int(_781)][_783];
        float _787 = _95 * _767;
        float _789 = fma(_93, _759, _787);
        float _791 = 1.0 / _751;
        float _793 = fma(_91, _777, _789);
        float _795 = _793 + _785;
        float _797 = precise::clamp(_795, 0.0, 1.0);
        float _799 = _751 * (*spvDescriptorSet0.fp_c13)._m0[4].z;
        float _801 = -_797;
        float _803 = _801 + _737;
        float _805 = fma(_791, (*spvDescriptorSet0.fp_c13)._m0[4].w, _803);
        float _807 = _799 * _805;
        float _809 = exp2(_807);
        float _811 = 0.0 + _809;
        float _813 = precise::clamp(_811, 0.0, 1.0);
        float _815 = precise::min(_813, (*spvDescriptorSet0.fp_c9)._m0[42].x);
        _690 = _815;
    }
    float _817 = _690;
    float _819 = precise::max(0.0, _610);
    float _821 = _678 * (*spvDescriptorSet0.fp_c9)._m0[41].w;
    float _823 = precise::clamp(_821, 0.0, 1.0);
    float _825 = -_817;
    float _827 = _825 + 1.0;
    float _829 = precise::max(_469, 0.25);
    float _831 = -_535;
    float _833 = fma(_648, _831, _670);
    float _835 = precise::clamp(_833, 0.0, 1.0);
    float _837 = precise::min(_819, 0.100000001490116119384765625);
    float _839 = fma(_823, _827, _817);
    float _841 = 0.0 + _467;
    float _843 = precise::clamp(_841, 0.0, 1.0);
    float _845 = _835 * (-9.27999973297119140625);
    float _847 = -_688;
    float _849 = exp2(_847);
    float _851 = fma(_837, 10.0, -1.0);
    float _853 = _839 * _843;
    float _855 = _626 + (-1.0);
    float _857 = _297 * (*spvDescriptorSet0.fp_c9)._m0[64].y;
    float _859 = _829 + _851;
    float _861 = in.m_57.y;
    float _863 = gl_FragCoord.w;
    float _865 = _861 * _863;
    float _867 = -(*spvDescriptorSet0.fp_c9)._m0[66].z;
    float _869 = fma(_867, (*spvDescriptorSet0.fp_c9)._m0[66].z, 1.0);
    float _871 = exp2(_845);
    float _873 = _859 * 4.0;
    float _875 = precise::clamp(_873, 0.0, 1.0);
    float _877 = in.m_57.z;
    float _879 = gl_FragCoord.w;
    float _881 = _877 * _879;
    float _883 = _869 * _672;
    float _885 = _853 * _875;
    float _887 = in.m_57.x;
    float _889 = gl_FragCoord.w;
    float _891 = _887 * _889;
    float _893 = exp2(_857);
    float _895 = _885 * _855;
    float _897 = -_849;
    float _899 = _897 + 1.0;
    float _901 = precise::min(1.0, (*spvDescriptorSet0.fp_c9)._m0[27].w);
    float _903 = _895 * _895;
    float _905 = _895 + 1.0;
    float _907 = _899 * _883;
    float _909 = _901 * 0.31830990314483642578125;
    float _911 = precise::min(_839, (*spvDescriptorSet0.fp_c9)._m0[62].x);
    float _913 = fma(_905, -0.0274999998509883880615234375, 0.0425000004470348358154296875);
    float _915 = precise::min(_903, _871);
    float _917 = _586 + (-1.0);
    float _919 = _911 * _907;
    float _921 = -_895;
    float _923 = fma(_921, _915, _913);
    float _925 = fma(_905, 0.02199999988079071044921875, -0.039999999105930328369140625);
    float _927 = -_893;
    float _929 = _927 + 1.0;
    float _931 = fma(_885, _917, 1.0);
    float _933 = fma(_905, -0.572000026702880859375, 1.03999996185302734375);
    float _935 = fma(_923, 1.03999996185302734375, _925);
    float _937 = precise::clamp(_935, 0.0, 1.0);
    float _939 = _929 * (*spvDescriptorSet0.fp_c9)._m0[64].z;
    float _941 = _89 * _865;
    float _943 = fma(_923, -1.03999996185302734375, _933);
    float _945 = precise::clamp(_943, 0.0, 1.0);
    float _947 = _931 * _937;
    float _949 = -_939;
    float _951 = _949 + 1.0;
    float _953 = _89 * _881;
    float _955 = _939 * _849;
    float _957 = fma(_945, 0.039999999105930328369140625, _947);
    float _959 = _89 * _891;
    float _961 = _953 * _909;
    float _963 = _957 * _909;
    float _965 = _919 * (*spvDescriptorSet0.fp_c9)._m0[70].z;
    float _967 = (*spvDescriptorSet0.fp_c11)._m0[35].x * 1.60000002384185791015625;
    float _969 = _957 * _961;
    float _971 = _959 * _963;
    float _973 = _941 * _963;
    float _975 = _477 * _967;
    float _977 = _919 * (*spvDescriptorSet0.fp_c9)._m0[70].x;
    float _979 = _475 * _967;
    float _981 = _479 * _967;
    float _983 = _919 * (*spvDescriptorSet0.fp_c9)._m0[70].y;
    float _985 = precise::max(0.0, _971);
    float _987 = _849 * _951;
    float _989 = fma(_483, _955, _977);
    float _991 = fma(_487, _955, _965);
    float _993 = precise::max(0.0, _969);
    float _995 = fma(_485, _955, _983);
    float _997 = precise::max(0.0, _981);
    float _999 = -(*spvDescriptorSet0.fp_c9)._m0[48].x;
    float _1001 = _259 + _999;
    float _1003 = fma(_987, _985, _989);
    float _1005 = -(*spvDescriptorSet0.fp_c9)._m0[48].z;
    float _1007 = _259 + _1005;
    float _1009 = precise::max(0.0, _979);
    float _1011 = fma(_987, _993, _991);
    float _1013 = precise::max(0.0, _975);
    float _1015 = _1001 * (*spvDescriptorSet0.fp_c9)._m0[48].y;
    float _1017 = precise::clamp(_1015, 0.0, 1.0);
    float _1019 = precise::max(0.0, _973);
    float _1021 = _987 * _997;
    float _1023 = _1007 * (*spvDescriptorSet0.fp_c9)._m0[48].w;
    float _1025 = precise::clamp(_1023, 0.0, 1.0);
    float _1027 = _987 * _1009;
    float _1029 = _987 * _1013;
    float _1031 = fma(_987, _1019, _995);
    float _1033 = fma(_1017, _1021, _1011);
    float _1035 = fma(_1025, _1021, _1011);
    float _1037 = fma(_1017, _1027, _1003);
    float _1039 = fma(_1025, _1027, _1003);
    float _1041 = fma(_1017, _1029, _1031);
    float _1043 = fma(_1025, _1029, _1031);
    out.m_60.x = _1037;
    out.m_60.y = _1041;
    out.m_60.z = _1033;
    out.m_60.w = 1.0;
    out.m_62.x = _1039;
    out.m_62.y = _1043;
    out.m_62.z = _1035;
    out.m_62.w = 1.0;
    return out;
}

