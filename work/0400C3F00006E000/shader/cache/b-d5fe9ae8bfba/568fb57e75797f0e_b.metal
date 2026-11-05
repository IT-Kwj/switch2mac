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
    constant _16* fp_c8 [[id(1)]];
    constant _16* fp_c15 [[id(2)]];
    texture2d<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    texture2d<float> fp_t_tcb_10 [[id(5)]];
    sampler fp_t_tcb_10Smplr [[id(6)]];
    texture2d_array<float> fp_t_tcb_8 [[id(7)]];
    sampler fp_t_tcb_8Smplr [[id(8)]];
    texture2d<float> fp_t_tcb_C [[id(9)]];
    sampler fp_t_tcb_CSmplr [[id(10)]];
    sampler fp_t_tcb_ASmplr_w [[id(11)]];
    sampler fp_t_tcb_10Smplr_w [[id(12)]];
    sampler fp_t_tcb_8Smplr_w [[id(13)]];
    sampler fp_t_tcb_CSmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_65 [[color(0)]];
};

struct main0_in
{
    float4 m_62 [[user(locn0)]];
    float4 m_60 [[user(locn1)]];
    float4 m_50 [[user(locn2)]];
    float4 m_44 [[user(locn3)]];
    float4 m_56 [[user(locn4)]];
    float4 m_54 [[user(locn5)]];
    float4 m_42 [[user(locn6)]];
    float4 m_48 [[user(locn7)]];
    float4 m_58 [[user(locn8)]];
    float4 m_46 [[user(locn9), flat]];
    float4 m_52 [[user(locn10)]];
    float4 m_67 [[user(locn11)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _74 = gl_FragCoord.w;
    float _76 = in.m_42.z;
    float _78 = gl_FragCoord.w;
    float _80 = _76 * _78;
    float _82 = in.m_42.w;
    float _84 = gl_FragCoord.w;
    float _86 = _82 * _84;
    float _88 = 1.0 / _74;
    float _90 = _88 * _80;
    float _92 = _88 * _86;
    float2 _671 = float2(_90, _92);
    float _94 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_671, float2(0.0), isnan(_671))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_671, float2(0.0), isnan(_671))).x;
    float _96 = in.m_44.w;
    float _98 = gl_FragCoord.w;
    float _100 = _96 * _98;
    float _102 = in.m_46.x;
    float _104 = in.m_48.y;
    float _106 = gl_FragCoord.w;
    float _108 = _104 * _106;
    float _110 = in.m_42.y;
    float _112 = gl_FragCoord.w;
    float _114 = _110 * _112;
    float _116 = in.m_44.x;
    float _118 = gl_FragCoord.w;
    float _120 = _116 * _118;
    float _122 = in.m_44.y;
    float _124 = gl_FragCoord.w;
    float _126 = _122 * _124;
    float _128 = in.m_42.x;
    float _130 = gl_FragCoord.w;
    float _132 = _128 * _130;
    float _134 = _88 * _100;
    float _136 = rint(_102);
    float _138 = precise::max(_136, 0.0);
    uint _141 = uint(_138);
    uint _143 = clamp(_141, 0u, 65535u);
    float _145 = _88 * _108;
    float _147 = _88 * _114;
    float _149 = _88 * _120;
    float _151 = _88 * _126;
    float _153 = _88 * _132;
    float _155 = 1.0 / _134;
    float _157 = _149 * _155;
    float _159 = _151 * _155;
    float _161 = fma(_94, 2.0, -1.0);
    float _163 = -_145;
    float _165 = _163 + 1.0;
    float _167 = _161 * (*spvDescriptorSet0.fp_c9)._m0[193].x;
    float _169 = fma(_167, _165, _147);
    float _171 = fma(_167, _165, _153);
    float2 _787 = float2(_157, _159);
    float _173 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_787, float2(0.0), isnan(_787))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_787, float2(0.0), isnan(_787))).x;
    float3 _799 = float3(_171, _169, float(int(_143)));
    float3 _803 = select(_799, float3(0.0), isnan(_799));
    float2 _177 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _803.xy, uint(rint(_803.z))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _803.xy, uint(rint(_803.z))).xw;
    float _179 = _177.x;
    float _181 = _177.y;
    float _183 = in.m_50.y;
    float _185 = gl_FragCoord.w;
    float _187 = _183 * _185;
    float _189 = in.m_50.x;
    float _191 = gl_FragCoord.w;
    float _193 = _189 * _191;
    float _195 = in.m_50.z;
    float _197 = gl_FragCoord.w;
    float _199 = _195 * _197;
    float _201 = in.m_52.y;
    float _203 = gl_FragCoord.w;
    float _205 = _201 * _203;
    float _207 = in.m_52.x;
    float _209 = gl_FragCoord.w;
    float _211 = _207 * _209;
    float _213 = in.m_52.z;
    float _215 = gl_FragCoord.w;
    float _217 = _213 * _215;
    float _219 = in.m_44.z;
    float _221 = gl_FragCoord.w;
    float _223 = _219 * _221;
    float _225 = _88 * _187;
    float _227 = _88 * _193;
    float _229 = _88 * _199;
    float _231 = _225 * _225;
    float _233 = fma(_227, _227, _231);
    float _235 = fma(_229, _229, _233);
    float _237 = _88 * _205;
    float _239 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _241 = _239 + (*spvDescriptorSet0.fp_c9)._m0[139].w;
    float _243 = rsqrt(_235);
    float _245 = 1.0 / _241;
    float _247 = _225 * _243;
    float _249 = _227 * _243;
    float _251 = _229 * _243;
    float _253 = _237 * _247;
    float _255 = _88 * _211;
    float _257 = in.m_54.w;
    float _259 = gl_FragCoord.w;
    float _261 = _257 * _259;
    float _263 = fma(_145, -2.8571431636810302734375, 2.7142860889434814453125);
    float _265 = precise::clamp(_263, 0.0, 1.0);
    float _267 = fma(_255, _249, _253);
    float _269 = _88 * _217;
    float _271 = fma(_269, _251, _267);
    float _273 = _88 * _223;
    float _275 = abs(_271);
    float _277 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _279 = _275 + _277;
    float _281 = _273 * _155;
    float _283 = _279 * _245;
    float _285 = precise::clamp(_283, 0.0, 1.0);
    float _287 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _289 = fma(_281, (*spvDescriptorSet0.fp_c8)._m0[30].w, _287);
    float _291 = fma(_265, -2.0, 3.0);
    float _293 = _265 * _265;
    float _295 = fma(_285, -2.0, 3.0);
    float _297 = _285 * _285;
    float _299 = in.m_56.x;
    float _301 = gl_FragCoord.w;
    float _303 = _299 * _301;
    float _305 = 1.0 / _289;
    float _307 = _291 * _293;
    float _309 = _295 * _297;
    float _311 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _313 = _88 * _261;
    float _315 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _317 = _305 * _315;
    float _319 = _161 * (*spvDescriptorSet0.fp_c9)._m0[193].y;
    float _321 = _147 + _319;
    float _323 = _153 + _319;
    float _325 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _327 = fma(_173, (*spvDescriptorSet0.fp_c8)._m0[30].w, _325);
    float _329 = _181 * _313;
    float _331 = 1.0 / _327;
    float _333 = precise::max(_329, 0.00999999977648258209228515625);
    float _335 = precise::min(_333, 0.1500000059604644775390625);
    float _337 = fma(_335, 7.142857074737548828125, -0.0714285671710968017578125);
    float _339 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _341 = -_317;
    float _343 = fma(_331, _339, _341);
    float _345 = _307 * _337;
    float _347 = _343 * _311;
    float _349 = precise::clamp(_347, 0.0, 1.0);
    float _351 = 0.0 + _345;
    float _353 = precise::clamp(_351, 0.0, 1.0);
    float _355 = _353 * _349;
    float _357 = _88 * _303;
    float _359 = _355 * _309;
    float _361 = _359 * _357;
    bool _365 = _361 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _367 = isnan(_361);
    bool _369 = _365 || _367;
    bool _371 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _373 = _369 || _371;
    float _375 = _319 * (*spvDescriptorSet0.fp_c9)._m0[193].z;
    float _377 = _375 * 0.20000000298023223876953125;
    float _379 = _361;
    if (!_373)
    {
        discard_fragment();
    }
    float _381 = _377 * (*spvDescriptorSet0.fp_c15)._m0[630].w;
    float _383 = fma(_151, _155, _375);
    float _385 = fma(_323, 1.60000002384185791015625, -0.300000011920928955078125);
    float _387 = precise::clamp(_385, 0.0, 1.0);
    float _389 = in.m_58.x;
    float _391 = gl_FragCoord.w;
    float _393 = _389 * _391;
    float _395 = fma(_149, _155, _381);
    float _397 = in.m_58.y;
    float _399 = gl_FragCoord.w;
    float _401 = _397 * _399;
    float2 _1131 = float2(_395, _383);
    float _403 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1131, float2(0.0), isnan(_1131))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_1131, float2(0.0), isnan(_1131))).x;
    float _405 = fma(_321, 1.7999999523162841796875, -0.699999988079071044921875);
    float _407 = precise::clamp(_405, 0.0, 1.0);
    float3 _1148 = float3(_387, _407, float(int(_143)));
    float3 _1150 = select(_1148, float3(0.0), isnan(_1148));
    float2 _409 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _1150.xy, uint(rint(_1150.z))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _1150.xy, uint(rint(_1150.z))).xw;
    float _411 = _409.x;
    float _413 = _409.y;
    float _415 = _88 * _393;
    float _417 = _88 * _401;
    float _419 = fma(_319, 0.5, _415);
    float _421 = fma(_319, 0.5, _417);
    float2 _1173 = float2(_419, _421);
    float _423 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1173, float2(0.0), isnan(_1173))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1173, float2(0.0), isnan(_1173))).w;
    float _425 = -_329;
    float _427 = _425 + 1.0;
    float _429 = in.m_60.x;
    float _431 = gl_FragCoord.w;
    float _433 = _429 * _431;
    float _435 = in.m_60.y;
    float _437 = gl_FragCoord.w;
    float _439 = _435 * _437;
    float _441 = in.m_60.z;
    float _443 = gl_FragCoord.w;
    float _445 = _441 * _443;
    float _447 = _179 * _181;
    float _449 = precise::max(_427, 0.5);
    float _451 = precise::min(_449, 1.0);
    float _453 = fma(_451, 2.0, -1.0);
    float _455 = _181 * _181;
    float _457 = _453 * _307;
    float _459 = fma(_455, -0.89999997615814208984375, 1.0);
    float _461 = in.m_62.y;
    float _463 = gl_FragCoord.w;
    float _465 = _461 * _463;
    float _467 = _88 * _439;
    float _469 = _88 * _445;
    float _471 = _88 * _465;
    float _473 = precise::max(_403, 0.89999997615814208984375);
    float _475 = precise::min(_473, 0.959999978542327880859375);
    float _477 = _411 * _413;
    float _479 = fma(_475, 10.0, -8.59999942779541015625);
    float _481 = in.m_62.z;
    float _483 = gl_FragCoord.w;
    float _485 = _481 * _483;
    float _487 = _447 * _479;
    float _489 = in.m_62.x;
    float _491 = gl_FragCoord.w;
    float _493 = _489 * _491;
    float _495 = fma(_487, -2.0, 1.0);
    float _497 = precise::clamp(_495, 0.0, 1.0);
    float _499 = fma(_487, 2.0, -1.0);
    float _501 = _88 * _433;
    float _503 = _423 * _459;
    float _505 = fma(_477, 2.0, _503);
    float _507 = abs(_499);
    float _509 = fma(_507, -1.39999997615814208984375, 1.39999997615814208984375);
    float _511 = abs(_499);
    float _513 = fma(_511, -0.699999988079071044921875, 0.699999988079071044921875);
    float _515 = abs(_499);
    float _517 = fma(_515, -0.0500000007450580596923828125, 0.0500000007450580596923828125);
    float _519 = 0.0 + _499;
    float _521 = precise::clamp(_519, 0.0, 1.0);
    float _523 = precise::max(_505, 0.100000001490116119384765625);
    float _525 = fma(_501, _497, _509);
    float _527 = fma(_467, _497, _513);
    float _529 = fma(_469, _497, _517);
    float _531 = fma(_521, 2.0, _525);
    float _533 = precise::min(_523, 1.0);
    float _535 = fma(_521, 2.0, _527);
    float _537 = fma(_521, 0.5, _529);
    float _539 = fma(_457, 0.699999988079071044921875, _531);
    float _541 = _88 * _493;
    float _543 = fma(_533, 1.111111164093017578125, -0.11111111938953399658203125);
    float _545 = fma(_457, 0.5, _535);
    float _547 = fma(_457, 0.02999999932944774627685546875, _537);
    float _549 = _88 * _485;
    float _551 = fma(_541, _543, _539);
    float _553 = fma(_471, _543, _545);
    float _555 = fma(_549, _543, _547);
    if (!_373)
    {
        out.m_65.x = _551;
        out.m_65.y = _553;
        out.m_65.z = _555;
        out.m_65.w = _345;
        return out;
    }
    float _557 = _553 * 0.715200006961822509765625;
    float _559 = in.m_67.w;
    float _561 = gl_FragCoord.w;
    float _563 = _559 * _561;
    float _565 = in.m_67.x;
    float _567 = gl_FragCoord.w;
    float _569 = _565 * _567;
    float _571 = in.m_67.y;
    float _573 = gl_FragCoord.w;
    float _575 = _571 * _573;
    float _577 = fma(_551, 0.2125999927520751953125, _557);
    float _579 = in.m_67.z;
    float _581 = gl_FragCoord.w;
    float _583 = _579 * _581;
    float _585 = fma(_555, 0.072200000286102294921875, _577);
    bool _587 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _589 = 1.0 / _585;
    float _591 = (*spvDescriptorSet0.fp_c15)._m0[653].w;
    if (_587)
    {
        float _593 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _595 = _317 + _593;
        _591 = _595;
    }
    float _597 = _591;
    float _599 = _589 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _601 = precise::clamp(_599, 0.0, 1.0);
    float _603 = fma(_601, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _605 = _88 * _563;
    float _607 = _88 * _575;
    float _609 = _603 * _605;
    float _611 = 0.0 + _361;
    float _613 = precise::clamp(_611, 0.0, 1.0);
    float _615 = _613;
    if (_587)
    {
        float _617 = _597 * 8.0;
        float _619 = precise::clamp(_617, 0.0, 1.0);
        _379 = _619;
    }
    float _621 = _379;
    float _623 = _88 * _569;
    float _625 = _88 * _583;
    float _627 = fma(_553, _609, _607);
    if (_587)
    {
        float _629 = _613 * _621;
        _615 = _629;
    }
    float _631 = _615;
    float _633 = fma(_551, _609, _623);
    float _635 = fma(_555, _609, _625);
    float _637 = 0.0 + _631;
    float _639 = precise::clamp(_637, 0.0, 1.0);
    out.m_65.x = _633;
    out.m_65.y = _627;
    out.m_65.z = _635;
    out.m_65.w = _639;
    return out;
}

