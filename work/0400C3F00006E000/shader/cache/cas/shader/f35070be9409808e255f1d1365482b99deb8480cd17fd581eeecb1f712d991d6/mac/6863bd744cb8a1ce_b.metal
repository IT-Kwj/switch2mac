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
    texture2d<float> fp_t_tcb_14 [[id(5)]];
    sampler fp_t_tcb_14Smplr [[id(6)]];
    texture3d<float> fp_t_tcb_16 [[id(7)]];
    sampler fp_t_tcb_16Smplr [[id(8)]];
    texture2d<float> fp_t_tcb_8 [[id(9)]];
    sampler fp_t_tcb_8Smplr [[id(10)]];
    texture2d<float> fp_t_tcb_A [[id(11)]];
    sampler fp_t_tcb_ASmplr [[id(12)]];
    texture2d<float> fp_t_tcb_E [[id(13)]];
    sampler fp_t_tcb_ESmplr [[id(14)]];
    texture2d_array<float> fp_t_tcb_C [[id(15)]];
    sampler fp_t_tcb_CSmplr [[id(16)]];
    sampler fp_t_tcb_14Smplr_w [[id(17)]];
    sampler fp_t_tcb_16Smplr_w [[id(18)]];
    sampler fp_t_tcb_8Smplr_w [[id(19)]];
    sampler fp_t_tcb_ASmplr_w [[id(20)]];
    sampler fp_t_tcb_ESmplr_w [[id(21)]];
    sampler fp_t_tcb_CSmplr_w [[id(22)]];
    constant dm_border_t* dm_border [[id(23)]];
};

struct main0_out
{
    float4 m_62 [[color(0)]];
    float4 m_64 [[color(1)]];
};

struct main0_in
{
    float4 m_55 [[user(locn0)]];
    float4 m_57 [[user(locn5)]];
    float4 m_53 [[user(locn6)]];
    float4 m_59 [[user(locn7)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _71 = gl_FragCoord.w;
    float _73 = in.m_53.z;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = in.m_53.x;
    float _81 = gl_FragCoord.w;
    float _83 = _79 * _81;
    float _85 = in.m_53.y;
    float _87 = gl_FragCoord.w;
    float _89 = _85 * _87;
    float _91 = 1.0 / _71;
    float _93 = _91 * _77;
    float _95 = _91 * _83;
    float _97 = _91 * _89;
    float _99 = -(*spvDescriptorSet0.fp_c9)._m0[26].z;
    float _101 = _93 + _99;
    float _103 = -(*spvDescriptorSet0.fp_c9)._m0[26].x;
    float _105 = _95 + _103;
    float _107 = -(*spvDescriptorSet0.fp_c4)._m0[13].w;
    float _109 = _93 + _107;
    float _111 = _101 * _101;
    float _113 = fma(_105, _105, _111);
    float _115 = sqrt(_113);
    bool _119 = _115 > (*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _121 = -(*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _123 = _115 + _121;
    float _125 = 0.0;
    float _127 = _123;
    float _129 = _89;
    if (_119)
    {
        float _131 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _125 = _131;
    }
    float _133 = _125;
    float _135 = 0.0;
    if (_119)
    {
        float _137 = rsqrt(_113);
        _135 = _137;
    }
    float _139 = _135;
    float _141 = _133;
    float _143 = _139;
    if (_119)
    {
        float _145 = _123 * _133;
        _127 = _145;
    }
    float _147 = _127;
    if (_119)
    {
        float _149 = _97 + (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _141 = _149;
    }
    float _151 = _141;
    float _153 = 0.0;
    float _155 = _151;
    if (_119)
    {
        float _157 = _147 * 0.15915493667125701904296875;
        _153 = _157;
    }
    float _159 = _153;
    float _161 = 0.0;
    if (_119)
    {
        float _163 = _159 * 6.283185482025146484375;
        float _165 = cos(_163);
        _161 = _165;
    }
    float _167 = _161;
    float _169 = _147;
    if (_119)
    {
        float _171 = _159 * 6.283185482025146484375;
        float _173 = sin(_171);
        _169 = _173;
    }
    float _175 = _169;
    float _177 = 0.0;
    if (_119)
    {
        float _179 = _167 + (-1.0);
        _177 = _179;
    }
    float _181 = _177;
    float _183 = -(*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _185 = _97 + _183;
    float _187 = _181;
    if (_119)
    {
        float _189 = _181 * (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _129 = _189;
    }
    float _191 = _129;
    if (!_119)
    {
        _187 = _95;
    }
    float _193 = _187;
    float _195 = 0.0;
    float _197 = _175;
    float _199 = _193;
    if (_119)
    {
        float _201 = fma(_175, _151, (*spvDescriptorSet0.fp_c9)._m0[42].y);
        _195 = _201;
    }
    float _203 = _195;
    if (!_119)
    {
        _155 = _97;
    }
    float _205 = _155;
    float _207 = _205;
    if (_119)
    {
        float _209 = fma(_97, _167, _191);
        _207 = _209;
    }
    float _211 = _207;
    if (!_119)
    {
        _197 = _93;
    }
    float _213 = _197;
    float _215 = _213;
    if (_119)
    {
        float _217 = _139 * _203;
        _143 = _217;
    }
    float _219 = _143;
    float _221 = -(*spvDescriptorSet0.fp_c9)._m0[26].y;
    float _223 = _211 + _221;
    float _225 = _223;
    if (_119)
    {
        float _227 = fma(_105, _219, (*spvDescriptorSet0.fp_c9)._m0[26].x);
        _199 = _227;
    }
    float _229 = _199;
    if (_119)
    {
        float _231 = fma(_101, _219, (*spvDescriptorSet0.fp_c9)._m0[26].z);
        _215 = _231;
    }
    float _233 = _215;
    float _235 = -(*spvDescriptorSet0.fp_c4)._m0[11].w;
    float _237 = _95 + _235;
    float _239 = -(*spvDescriptorSet0.fp_c9)._m0[26].x;
    float _241 = _229 + _239;
    float _243 = _223 * _223;
    float _245 = -(*spvDescriptorSet0.fp_c9)._m0[26].z;
    float _247 = _233 + _245;
    float _249 = fma(_241, _241, _243);
    float _251 = fma(_247, _247, _249);
    float _253 = _185 * _185;
    float _255 = fma(_237, _237, _253);
    float _257 = rsqrt(_251);
    float _259 = fma(_109, _109, _255);
    float _261 = sqrt(_259);
    float _263 = _257 * (*spvDescriptorSet0.fp_c9)._m0[26].w;
    float _265 = _241 * _263;
    float _267 = _247 * _263;
    float _269 = _265 * _265;
    float _271 = _267 * _267;
    float _273 = -(*spvDescriptorSet0.fp_c9)._m0[63].y;
    float _275 = fma(_261, (*spvDescriptorSet0.fp_c9)._m0[63].x, _273);
    float _277 = precise::clamp(_275, 0.0, 1.0);
    float _279 = (*spvDescriptorSet0.fp_c9)._m0[26].y + (-220.0);
    float _281 = _269 + _271;
    float _283 = -_277;
    float _285 = _283 + 1.0;
    float _287 = precise::max(0.0, _279);
    float _289 = sqrt(_281);
    float _291 = -_263;
    float _293 = -_287;
    float _295 = fma(_223, _291, _293);
    float _297 = abs(_285);
    float _299 = log2(_297);
    bool _301 = _289 > (*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _303 = _287;
    float _305 = _279;
    float _307 = _265;
    float _309 = _267;
    if (!_301)
    {
        _225 = _271;
    }
    float _311 = _225;
    float _313 = _311;
    if (!_301)
    {
        _303 = _269;
    }
    float _315 = _303;
    float _317 = _315;
    if (!_301)
    {
        _305 = _295;
    }
    float _319 = _305;
    bool _321 = !_301;
    float _323 = _319;
    if (!_321)
    {
        float _325 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[42].z;
        float _327 = -(*spvDescriptorSet0.fp_c9)._m0[42].y;
        float _329 = _289 + _327;
        float _331 = _295 + (*spvDescriptorSet0.fp_c9)._m0[42].z;
        float _333 = rsqrt(_281);
        float _335 = _329 * _325;
        float _337 = _335 * 0.15915493667125701904296875;
        float _339 = _337 * 6.283185482025146484375;
        float _341 = sin(_339);
        float _343 = _337 * 6.283185482025146484375;
        float _345 = cos(_343);
        float _347 = fma(_341, _331, (*spvDescriptorSet0.fp_c9)._m0[42].y);
        float _349 = _333 * _347;
        float _351 = _345 + (-1.0);
        float _353 = _265 * _349;
        float _355 = _267 * _349;
        float _357 = _351 * (*spvDescriptorSet0.fp_c9)._m0[42].z;
        float _359 = _355 * _355;
        float _361 = fma(_295, _345, _357);
        float _363 = _353 * _353;
        _323 = _361;
        _317 = _363;
        _313 = _359;
        _307 = _353;
        _309 = _355;
    }
    float _365 = _323;
    float _367 = _317;
    float _369 = _313;
    float _371 = _307;
    float _373 = _309;
    float _375 = fma(_365, _365, _367);
    float _377 = _299 * (*spvDescriptorSet0.fp_c9)._m0[64].x;
    float _379 = _375 + _369;
    float _381 = exp2(_377);
    float _383 = fma(_95, 6.2500002968590706586837768554688e-05, 0.5);
    float _385 = precise::clamp(_383, 0.0, 1.0);
    float _387 = fma(_93, 6.2500002968590706586837768554688e-05, 0.5);
    float _389 = precise::clamp(_387, 0.0, 1.0);
    float _391 = rsqrt(_379);
    float _393 = _391 * _371;
    float _395 = _391 * _365;
    float _397 = in.m_55.x;
    float _399 = gl_FragCoord.w;
    float _401 = _397 * _399;
    float _403 = _393 * (*spvDescriptorSet0.fp_c9)._m0[69].x;
    float _405 = _391 * _373;
    float _407 = in.m_55.y;
    float _409 = gl_FragCoord.w;
    float _411 = _407 * _409;
    float _413 = -_403;
    float _415 = fma(_395, (*spvDescriptorSet0.fp_c9)._m0[69].y, _413);
    float _417 = _395 + 1.0;
    float _419 = -_405;
    float _421 = fma(_419, (*spvDescriptorSet0.fp_c9)._m0[69].z, _415);
    float _423 = -_395;
    float _425 = fma(_381, _417, _423);
    float _427 = _97 + (*spvDescriptorSet0.fp_c7)._m0[11].y;
    float _429 = fma(_421, -0.5, 0.5);
    float _431 = fma(_421, 0.5, 0.5);
    float _433 = _93 + (*spvDescriptorSet0.fp_c7)._m0[11].y;
    float _435 = fma(_425, 0.5, 0.5);
    float _437 = sqrt(_429);
    float _439 = fma(_431, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _441 = _95 + (*spvDescriptorSet0.fp_c7)._m0[11].y;
    float _443 = _433 * (*spvDescriptorSet0.fp_c11)._m0[30].z;
    float _445 = _427 * (*spvDescriptorSet0.fp_c11)._m0[30].y;
    float _447 = fma(_431, _439, -0.212114393711090087890625);
    float _449 = _441 * (*spvDescriptorSet0.fp_c11)._m0[30].x;
    float _451 = fma(_445, (*spvDescriptorSet0.fp_c11)._m0[45].x, (*spvDescriptorSet0.fp_c11)._m0[29].y);
    float _453 = fma(_431, _447, 1.570728778839111328125);
    float _455 = fma(_443, (*spvDescriptorSet0.fp_c11)._m0[45].x, (*spvDescriptorSet0.fp_c11)._m0[29].z);
    float _457 = fma(_449, (*spvDescriptorSet0.fp_c11)._m0[45].x, (*spvDescriptorSet0.fp_c11)._m0[29].x);
    float2 _1645 = float2(_385, _389);
    float _459 = dm_bs(spvDescriptorSet0.fp_t_tcb_14.sample(spvDescriptorSet0.fp_t_tcb_14Smplr, select(_1645, float2(0.0), isnan(_1645))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_14, spvDescriptorSet0.fp_t_tcb_14Smplr_w, select(_1645, float2(0.0), isnan(_1645))).x;
    float _461 = _91 * _401;
    float _463 = _437 * 0.636619746685028076171875;
    float _465 = _91 * _411;
    float _467 = -_453;
    float _469 = fma(_463, _467, 1.0);
    float3 _1670 = float3(_457, _451, _455);
    float _471 = dm_bs(spvDescriptorSet0.fp_t_tcb_16.sample(spvDescriptorSet0.fp_t_tcb_16Smplr, select(_1670, float3(0.0), isnan(_1670))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_16, spvDescriptorSet0.fp_t_tcb_16Smplr_w, select(_1670, float3(0.0), isnan(_1670))).x;
    float2 _1680 = float2(_461, _465);
    float _473 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1680, float2(0.0), isnan(_1680))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1680, float2(0.0), isnan(_1680))).w;
    float2 _1688 = float2(_461, _465);
    float3 _477 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1688, float2(0.0), isnan(_1688))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1688, float2(0.0), isnan(_1688))).xyz;
    float _479 = _477.x;
    float _481 = _477.y;
    float _483 = _477.z;
    float2 _1702 = float2(_469, _435);
    float3 _485 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1702, float2(0.0), isnan(_1702))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1702, float2(0.0), isnan(_1702))).xyz;
    float _487 = _485.x;
    float _489 = _485.y;
    float _491 = _485.z;
    float _493 = in.m_57.y;
    float _495 = gl_FragCoord.w;
    float _497 = _493 * _495;
    float _499 = spvFAdd(_261, 9.9999997473787516355514526367188e-06);
    float _501 = in.m_57.x;
    float _503 = gl_FragCoord.w;
    float _505 = _501 * _503;
    float _507 = in.m_57.z;
    float _509 = gl_FragCoord.w;
    float _511 = _507 * _509;
    float _513 = -(*spvDescriptorSet0.fp_c9)._m0[37].y;
    float _515 = 1.0 + _513;
    float _517 = 1.0 / _499;
    float _519 = _97 * (*spvDescriptorSet0.fp_c9)._m0[1117].y;
    float _521 = abs(_185);
    bool _523 = _521 > 0.00999999977648258209228515625;
    float _525 = fma((*spvDescriptorSet0.fp_c9)._m0[37].y, (*spvDescriptorSet0.fp_c9)._m0[2649].y, _515);
    float _527 = _97 * (*spvDescriptorSet0.fp_c9)._m0[1118].y;
    float _529 = fma((*spvDescriptorSet0.fp_c9)._m0[37].y, (*spvDescriptorSet0.fp_c9)._m0[2649].z, _515);
    float _531 = fma(_95, (*spvDescriptorSet0.fp_c9)._m0[1117].x, _519);
    float _533 = _525 * (*spvDescriptorSet0.fp_c11)._m0[39].w;
    float _535 = fma(_95, (*spvDescriptorSet0.fp_c9)._m0[1118].x, _527);
    float _537 = fma(_93, (*spvDescriptorSet0.fp_c9)._m0[1117].z, _531);
    float _539 = precise::min(_533, (*spvDescriptorSet0.fp_c11)._m0[13].x);
    float _541 = fma(_93, (*spvDescriptorSet0.fp_c9)._m0[1118].z, _535);
    float _543 = _537 + (*spvDescriptorSet0.fp_c9)._m0[1117].w;
    float _545 = -(*spvDescriptorSet0.fp_c11)._m0[13].y;
    float _547 = _545 + (*spvDescriptorSet0.fp_c11)._m0[13].z;
    float _549 = _185 * _517;
    float _551 = -_539;
    float _553 = _551 + 1.0;
    float _555 = _237 * _517;
    float _557 = _109 * _517;
    float _559 = _549 * (*spvDescriptorSet0.fp_c9)._m0[69].y;
    float _561 = _541 + (*spvDescriptorSet0.fp_c9)._m0[1118].w;
    float _563 = trunc(_543);
    int _566 = int(_563);
    float _568 = _523 ? _185 : 0.00999999977648258209228515625;
    float _570 = fma(_555, (*spvDescriptorSet0.fp_c9)._m0[69].x, _559);
    float _572 = _91 * _497;
    float _574 = fma(_553, _547, (*spvDescriptorSet0.fp_c11)._m0[13].y);
    float _576 = fma(_557, (*spvDescriptorSet0.fp_c9)._m0[69].z, _570);
    float _578 = _91 * _505;
    float _580 = _572 * _572;
    float _582 = trunc(_561);
    int _584 = int(_582);
    float _586 = fma(_576, 2.0, (*spvDescriptorSet0.fp_c9)._m0[66].z);
    float _588 = _568 * (*spvDescriptorSet0.fp_c9)._m0[66].x;
    float _590 = fma(_578, _578, _580);
    float _592 = _91 * _511;
    float _594 = fma(_586, (*spvDescriptorSet0.fp_c9)._m0[66].z, 1.0);
    int _596 = ~as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].y);
    int _598 = _566 + _596;
    int _600 = _598 + 1;
    float _602 = fma(_592, _592, _590);
    float _604 = precise::max(_588, -127.0);
    float _606 = abs(_594);
    float _608 = log2(_606);
    bool _610 = _600 >= as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].x);
    float _612 = (*spvDescriptorSet0.fp_c9)._m0[66].x * (*spvDescriptorSet0.fp_c9)._m0[66].y;
    int _614 = ~as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].z);
    int _616 = _584 + _614;
    int _618 = _616 + 1;
    float _620 = rsqrt(_602);
    int _622 = _600 | _618;
    bool _624 = _622 < 0;
    bool _626 = _624 || _610;
    float _628 = in.m_59.w;
    float _630 = gl_FragCoord.w;
    float _632 = _628 * _630;
    float _634 = _608 * 1.5;
    float _636 = -_604;
    float _638 = exp2(_636);
    bool _640 = _618 >= as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].x);
    bool _642 = _640 || _626;
    float _644 = _578 * _620;
    float _646 = exp2(_634);
    float _648 = _572 * _620;
    float _650 = _592 * _620;
    float _652 = _644 * _555;
    float _654 = _261 * (*spvDescriptorSet0.fp_c9)._m0[65].w;
    float _656 = -_612;
    float _658 = exp2(_656);
    float _660 = -_638;
    float _662 = _660 + 1.0;
    float _664 = 1.0 / _604;
    float _666 = _646 * 12.56637096405029296875;
    float _668 = _91 * _632;
    float _670 = 1.0 / _666;
    float _672 = _658 * _662;
    float _674 = -_668;
    float _676 = -(*spvDescriptorSet0.fp_c9)._m0[41].z;
    float _678 = _674 + _676;
    float _680 = _672 * _664;
    float _682 = -_549;
    float _684 = -_652;
    float _686 = fma(_648, _682, _684);
    float _688 = _680 * _654;
    float _690 = _654;
    if (_642)
    {
        _690 = (*spvDescriptorSet0.fp_c9)._m0[42].x;
    }
    float _692 = _690;
    float _694 = _692;
    if (!_642)
    {
        int _696 = _618 * as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].x);
        int _698 = _696 + _600;
        float _700 = floor(_543);
        int _702 = _698 << 2;
        int _704 = _698 >> 2;
        int _706 = 12 & _702;
        int _708 = _704 << 4;
        int _710 = _708 + _706;
        float _712 = floor(_561);
        int _714 = _710 + 16256;
        uint _717 = uint(int(uint(_714) >> uint(2)));
        uint _719 = uint(int(uint(int(_717)) >> uint(2)));
        int _721 = int(_717) & 3;
        float _723 = (*spvDescriptorSet0.fp_c9)._m0[int(_719)][_721];
        float _725 = -_700;
        float _727 = _543 + _725;
        float _729 = -_712;
        float _731 = _561 + _729;
        float _733 = rint(_723);
        float _735 = precise::max(_733, 0.0);
        uint _737 = uint(_735);
        uint _739 = clamp(_737, 0u, 65535u);
        float3 _2104 = float3(_727, _731, float(int(_739)));
        float3 _2106 = select(_2104, float3(0.0), isnan(_2104));
        float _741 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, _2106.xy, uint(rint(_2106.z))), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, _2106.xy, uint(rint(_2106.z))).x;
        int _743 = _698 << 4;
        int _745 = _743 + 17904;
        int _747 = _710 + 24304;
        uint _749 = uint(int(uint(_747) >> uint(2)));
        uint _751 = uint(int(uint(int(_749)) >> uint(2)));
        int _753 = int(_749) & 3;
        float _755 = (*spvDescriptorSet0.fp_c9)._m0[int(_751)][_753];
        uint _757 = uint(int(uint(_745) >> uint(2)));
        uint _759 = uint(int(uint(int(_757)) >> uint(2)));
        int _761 = int(_757) & 3;
        float _763 = (*spvDescriptorSet0.fp_c9)._m0[int(_759)][_761];
        int _765 = int(_757) + 1;
        uint _767 = uint(int(uint(_765) >> uint(2)));
        int _769 = _765 & 3;
        float _771 = (*spvDescriptorSet0.fp_c9)._m0[int(_767)][_769];
        int _773 = _745 + 8;
        uint _775 = uint(int(uint(_773) >> uint(2)));
        uint _777 = uint(int(uint(int(_775)) >> uint(2)));
        int _779 = int(_775) & 3;
        float _781 = (*spvDescriptorSet0.fp_c9)._m0[int(_777)][_779];
        int _783 = int(_775) + 1;
        uint _785 = uint(int(uint(_783) >> uint(2)));
        int _787 = _783 & 3;
        float _789 = (*spvDescriptorSet0.fp_c9)._m0[int(_785)][_787];
        float _791 = _97 * _771;
        float _793 = fma(_95, _763, _791);
        float _795 = 1.0 / _755;
        float _797 = fma(_93, _781, _793);
        float _799 = _797 + _789;
        float _801 = precise::clamp(_799, 0.0, 1.0);
        float _803 = _755 * (*spvDescriptorSet0.fp_c13)._m0[4].z;
        float _805 = -_801;
        float _807 = _805 + _741;
        float _809 = fma(_795, (*spvDescriptorSet0.fp_c13)._m0[4].w, _807);
        float _811 = _803 * _809;
        float _813 = exp2(_811);
        float _815 = 0.0 + _813;
        float _817 = precise::clamp(_815, 0.0, 1.0);
        float _819 = precise::min(_817, (*spvDescriptorSet0.fp_c9)._m0[42].x);
        _694 = _819;
    }
    float _821 = _694;
    float _823 = precise::max(0.0, _648);
    float _825 = _678 * (*spvDescriptorSet0.fp_c9)._m0[41].w;
    float _827 = precise::clamp(_825, 0.0, 1.0);
    float _829 = -_821;
    float _831 = _829 + 1.0;
    float _833 = precise::max(_471, 0.25);
    float _835 = -_557;
    float _837 = fma(_650, _835, _686);
    float _839 = precise::clamp(_837, 0.0, 1.0);
    float _841 = precise::min(_823, 0.100000001490116119384765625);
    float _843 = fma(_827, _831, _821);
    float _845 = -_688;
    float _847 = exp2(_845);
    float _849 = 0.0 + _459;
    float _851 = precise::clamp(_849, 0.0, 1.0);
    float _853 = _839 * (-9.27999973297119140625);
    float _855 = fma(_841, 10.0, -1.0);
    float _857 = _574 + (-1.0);
    float _859 = _843 * _851;
    float _861 = _299 * (*spvDescriptorSet0.fp_c9)._m0[64].y;
    float _863 = _833 + _855;
    float _865 = exp2(_853);
    float _867 = -(*spvDescriptorSet0.fp_c9)._m0[66].z;
    float _869 = fma(_867, (*spvDescriptorSet0.fp_c9)._m0[66].z, 1.0);
    float _871 = in.m_59.y;
    float _873 = gl_FragCoord.w;
    float _875 = _871 * _873;
    float _877 = _863 * 4.0;
    float _879 = precise::clamp(_877, 0.0, 1.0);
    float _881 = precise::min(_843, (*spvDescriptorSet0.fp_c9)._m0[62].x);
    float _883 = in.m_59.z;
    float _885 = gl_FragCoord.w;
    float _887 = _883 * _885;
    float _889 = _869 * _670;
    float _891 = _859 * _879;
    float _893 = exp2(_861);
    float _895 = in.m_59.x;
    float _897 = gl_FragCoord.w;
    float _899 = _895 * _897;
    float _901 = -_847;
    float _903 = _901 + 1.0;
    float _905 = _891 * _857;
    float _907 = _903 * _889;
    float _909 = _905 * _905;
    float _911 = _905 + 1.0;
    float _913 = _881 * _907;
    float _915 = precise::min(_909, _865);
    float _917 = fma(_911, -0.0274999998509883880615234375, 0.0425000004470348358154296875);
    float _919 = _529 + (-1.0);
    float _921 = -_893;
    float _923 = _921 + 1.0;
    float _925 = precise::min(1.0, (*spvDescriptorSet0.fp_c9)._m0[27].w);
    float _927 = -_905;
    float _929 = fma(_927, _915, _917);
    float _931 = fma(_911, 0.02199999988079071044921875, -0.039999999105930328369140625);
    float _933 = fma(_891, _919, 1.0);
    float _935 = fma(_911, -0.572000026702880859375, 1.03999996185302734375);
    float _937 = _923 * (*spvDescriptorSet0.fp_c9)._m0[64].z;
    float _939 = fma(_929, 1.03999996185302734375, _931);
    float _941 = precise::clamp(_939, 0.0, 1.0);
    float _943 = _925 * 0.31830990314483642578125;
    float _945 = fma(_929, -1.03999996185302734375, _935);
    float _947 = precise::clamp(_945, 0.0, 1.0);
    float _949 = -_937;
    float _951 = _949 + 1.0;
    float _953 = _933 * _941;
    float _955 = _91 * _875;
    float _957 = _91 * _887;
    float _959 = _937 * _847;
    float _961 = fma(_947, 0.039999999105930328369140625, _953);
    float _963 = _957 * _943;
    float _965 = _91 * _899;
    float _967 = _961 * _943;
    float _969 = _913 * (*spvDescriptorSet0.fp_c9)._m0[70].z;
    float _971 = (*spvDescriptorSet0.fp_c11)._m0[35].x * 1.60000002384185791015625;
    float _973 = _961 * _963;
    float _975 = _965 * _967;
    float _977 = _847 * _951;
    float _979 = _481 * _971;
    float _981 = _913 * (*spvDescriptorSet0.fp_c9)._m0[70].x;
    float _983 = _479 * _971;
    float _985 = _483 * _971;
    float _987 = _913 * (*spvDescriptorSet0.fp_c9)._m0[70].y;
    float _989 = precise::max(0.0, _975);
    float _991 = fma(_487, _959, _981);
    float _993 = _955 * _967;
    float _995 = precise::max(0.0, _973);
    float _997 = fma(_489, _959, _987);
    float _999 = precise::max(0.0, _985);
    float _1001 = fma(_491, _959, _969);
    float _1003 = -(*spvDescriptorSet0.fp_c9)._m0[48].x;
    float _1005 = _261 + _1003;
    float _1007 = fma(_977, _989, _991);
    float _1009 = -(*spvDescriptorSet0.fp_c9)._m0[48].z;
    float _1011 = _261 + _1009;
    float _1013 = precise::max(0.0, _983);
    float _1015 = fma(_977, _995, _1001);
    float _1017 = precise::max(0.0, _979);
    float _1019 = _1005 * (*spvDescriptorSet0.fp_c9)._m0[48].y;
    float _1021 = precise::clamp(_1019, 0.0, 1.0);
    float _1023 = precise::max(0.0, _993);
    float _1025 = _977 * _999;
    float _1027 = _1011 * (*spvDescriptorSet0.fp_c9)._m0[48].w;
    float _1029 = precise::clamp(_1027, 0.0, 1.0);
    float _1031 = _977 * _1013;
    float _1033 = _977 * _1017;
    float _1035 = fma(_977, _1023, _997);
    float _1037 = fma(_1021, _1025, _1015);
    float _1039 = fma(_1029, _1025, _1015);
    float _1041 = fma(_1021, _1031, _1007);
    float _1043 = fma(_1029, _1031, _1007);
    float _1045 = fma(_1021, _1033, _1035);
    float _1047 = fma(_1029, _1033, _1035);
    out.m_62.x = _1041;
    out.m_62.y = _1045;
    out.m_62.z = _1037;
    out.m_62.w = _473;
    out.m_64.x = _1043;
    out.m_64.y = _1047;
    out.m_64.z = _1039;
    out.m_64.w = _473;
    return out;
}

