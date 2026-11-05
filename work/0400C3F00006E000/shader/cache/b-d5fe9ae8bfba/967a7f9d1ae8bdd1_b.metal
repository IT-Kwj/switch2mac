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
    float2 _665 = float2(_90, _92);
    float _94 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_665, float2(0.0), isnan(_665))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_665, float2(0.0), isnan(_665))).x;
    float _96 = in.m_44.w;
    float _98 = gl_FragCoord.w;
    float _100 = _96 * _98;
    float _102 = in.m_46.x;
    float _104 = in.m_48.y;
    float _106 = gl_FragCoord.w;
    float _108 = _104 * _106;
    float _110 = in.m_44.x;
    float _112 = gl_FragCoord.w;
    float _114 = _110 * _112;
    float _116 = in.m_44.y;
    float _118 = gl_FragCoord.w;
    float _120 = _116 * _118;
    float _122 = in.m_42.y;
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
    float _153 = -_145;
    float _155 = _153 + 1.0;
    float _157 = _88 * _132;
    float _159 = 1.0 / _134;
    float _161 = _147 * _159;
    float _163 = _149 * _159;
    float _165 = fma(_94, 2.0, -1.0);
    float _167 = _165 * (*spvDescriptorSet0.fp_c9)._m0[193].x;
    float _169 = fma(_167, _155, _151);
    float _171 = fma(_167, _155, _157);
    float2 _781 = float2(_161, _163);
    float _173 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_781, float2(0.0), isnan(_781))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_781, float2(0.0), isnan(_781))).x;
    float3 _793 = float3(_171, _169, float(int(_143)));
    float3 _797 = select(_793, float3(0.0), isnan(_793));
    float2 _177 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _797.xy, uint(rint(_797.z))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _797.xy, uint(rint(_797.z))).xw;
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
    float _225 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _227 = _225 + (*spvDescriptorSet0.fp_c9)._m0[139].w;
    float _229 = _88 * _187;
    float _231 = _88 * _193;
    float _233 = _88 * _199;
    float _235 = _229 * _229;
    float _237 = fma(_231, _231, _235);
    float _239 = fma(_233, _233, _237);
    float _241 = rsqrt(_239);
    float _243 = _88 * _205;
    float _245 = _229 * _241;
    float _247 = _231 * _241;
    float _249 = _233 * _241;
    float _251 = _88 * _217;
    float _253 = _243 * _245;
    float _255 = _88 * _211;
    float _257 = in.m_54.w;
    float _259 = gl_FragCoord.w;
    float _261 = _257 * _259;
    float _263 = 1.0 / _227;
    float _265 = _88 * _223;
    float _267 = fma(_255, _247, _253);
    float _269 = in.m_56.x;
    float _271 = gl_FragCoord.w;
    float _273 = _269 * _271;
    float _275 = _265 * _159;
    float _277 = fma(_251, _249, _267);
    float _279 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _281 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _283 = fma(_275, (*spvDescriptorSet0.fp_c8)._m0[30].w, _281);
    float _285 = abs(_277);
    float _287 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _289 = _285 + _287;
    float _291 = _289 * _263;
    float _293 = precise::clamp(_291, 0.0, 1.0);
    float _295 = 1.0 / _283;
    float _297 = fma(_293, -2.0, 3.0);
    float _299 = _293 * _293;
    float _301 = _88 * _261;
    float _303 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _305 = _295 * _303;
    float _307 = _165 * (*spvDescriptorSet0.fp_c9)._m0[193].y;
    float _309 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _311 = fma(_173, (*spvDescriptorSet0.fp_c8)._m0[30].w, _309);
    float _313 = _297 * _299;
    float _315 = _181 * _301;
    float _317 = 1.0 / _311;
    float _319 = precise::max(_315, 0.00999999977648258209228515625);
    float _321 = precise::min(_319, 0.1500000059604644775390625);
    float _323 = fma(_321, 7.142857074737548828125, -0.0714285671710968017578125);
    float _325 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _327 = -_305;
    float _329 = fma(_317, _325, _327);
    float _331 = 0.0 + _323;
    float _333 = precise::clamp(_331, 0.0, 1.0);
    float _335 = _329 * _279;
    float _337 = precise::clamp(_335, 0.0, 1.0);
    float _339 = _333 * _337;
    float _341 = _88 * _273;
    float _343 = _339 * _313;
    float _345 = _343 * _341;
    bool _349 = _345 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _351 = isnan(_345);
    bool _353 = _349 || _351;
    bool _355 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _357 = _353 || _355;
    float _359 = _307 * (*spvDescriptorSet0.fp_c9)._m0[193].z;
    float _361 = _359 * 0.20000000298023223876953125;
    if (!_357)
    {
        discard_fragment();
    }
    float _363 = _361 * (*spvDescriptorSet0.fp_c15)._m0[630].w;
    float _365 = fma(_149, _159, _359);
    float _367 = in.m_58.x;
    float _369 = gl_FragCoord.w;
    float _371 = _367 * _369;
    float _373 = fma(_147, _159, _363);
    float _375 = _151 + _307;
    float _377 = in.m_58.y;
    float _379 = gl_FragCoord.w;
    float _381 = _377 * _379;
    float2 _1098 = float2(_373, _365);
    float _383 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1098, float2(0.0), isnan(_1098))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_1098, float2(0.0), isnan(_1098))).x;
    float _385 = _157 + _307;
    float _387 = fma(_375, 1.7999999523162841796875, -0.64999997615814208984375);
    float _389 = precise::clamp(_387, 0.0, 1.0);
    float _391 = fma(_385, 1.39999997615814208984375, -0.20000000298023223876953125);
    float _393 = precise::clamp(_391, 0.0, 1.0);
    float3 _1124 = float3(_393, _389, float(int(_143)));
    float3 _1126 = select(_1124, float3(0.0), isnan(_1124));
    float2 _395 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _1126.xy, uint(rint(_1126.z))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _1126.xy, uint(rint(_1126.z))).xw;
    float _397 = _395.x;
    float _399 = _395.y;
    float _401 = _88 * _371;
    float _403 = _88 * _381;
    float _405 = fma(_307, 0.5, _401);
    float _407 = fma(_307, 0.5, _403);
    float2 _1149 = float2(_405, _407);
    float _409 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1149, float2(0.0), isnan(_1149))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1149, float2(0.0), isnan(_1149))).w;
    float _411 = in.m_60.x;
    float _413 = gl_FragCoord.w;
    float _415 = _411 * _413;
    float _417 = in.m_60.y;
    float _419 = gl_FragCoord.w;
    float _421 = _417 * _419;
    float _423 = in.m_60.z;
    float _425 = gl_FragCoord.w;
    float _427 = _423 * _425;
    float _429 = -_315;
    float _431 = _429 + 1.0;
    float _433 = _179 * _181;
    float _435 = _181 * _181;
    float _437 = _88 * _415;
    float _439 = _88 * _421;
    float _441 = _88 * _427;
    float _443 = abs(_383);
    float _445 = log2(_443);
    float _447 = precise::max(_431, 0.5);
    float _449 = _397 * _399;
    float _451 = _445 * 200.0;
    float _453 = exp2(_451);
    float _455 = precise::min(_447, 1.0);
    float _457 = in.m_62.z;
    float _459 = gl_FragCoord.w;
    float _461 = _457 * _459;
    float _463 = precise::max(_453, 0.62999999523162841796875);
    float _465 = in.m_62.y;
    float _467 = gl_FragCoord.w;
    float _469 = _465 * _467;
    float _471 = precise::min(_463, 0.699999988079071044921875);
    float _473 = fma(_471, 8.571430206298828125, -5.00000095367431640625);
    float _475 = fma(_435, -0.89999997615814208984375, 1.0);
    float _477 = fma(_455, 2.0, -1.0);
    float _479 = _433 * _473;
    float _481 = _409 * _475;
    float _483 = in.m_62.x;
    float _485 = gl_FragCoord.w;
    float _487 = _483 * _485;
    float _489 = fma(_479, -2.0, 1.0);
    float _491 = precise::clamp(_489, 0.0, 1.0);
    float _493 = fma(_479, 2.0, -1.0);
    float _495 = fma(_449, 2.0, _481);
    float _497 = abs(_493);
    float _499 = fma(_497, -1.39999997615814208984375, 1.39999997615814208984375);
    float _501 = abs(_493);
    float _503 = fma(_501, -0.0500000007450580596923828125, 0.0500000007450580596923828125);
    float _505 = abs(_493);
    float _507 = fma(_505, -0.699999988079071044921875, 0.699999988079071044921875);
    float _509 = precise::max(_495, 0.100000001490116119384765625);
    float _511 = 0.0 + _493;
    float _513 = precise::clamp(_511, 0.0, 1.0);
    float _515 = fma(_437, _491, _499);
    float _517 = fma(_439, _491, _507);
    float _519 = fma(_441, _491, _503);
    float _521 = fma(_513, 3.0, _515);
    float _523 = precise::min(_509, 1.0);
    float _525 = fma(_513, 3.0, _517);
    float _527 = fma(_513, 2.0, _519);
    float _529 = fma(_477, 0.699999988079071044921875, _521);
    float _531 = _88 * _469;
    float _533 = fma(_477, 0.5, _525);
    float _535 = fma(_477, 0.02999999932944774627685546875, _527);
    float _537 = fma(_523, 1.111111164093017578125, -0.11111111938953399658203125);
    float _539 = _88 * _461;
    float _541 = fma(_531, _537, _533);
    float _543 = fma(_539, _537, _535);
    float _545 = _88 * _487;
    float _547 = fma(_545, _537, _529);
    if (!_357)
    {
        out.m_65.x = _547;
        out.m_65.y = _541;
        out.m_65.z = _543;
        out.m_65.w = _323;
        return out;
    }
    float _549 = _541 * 0.715200006961822509765625;
    float _551 = in.m_67.w;
    float _553 = gl_FragCoord.w;
    float _555 = _551 * _553;
    float _557 = in.m_67.x;
    float _559 = gl_FragCoord.w;
    float _561 = _557 * _559;
    float _563 = in.m_67.y;
    float _565 = gl_FragCoord.w;
    float _567 = _563 * _565;
    float _569 = fma(_547, 0.2125999927520751953125, _549);
    float _571 = in.m_67.z;
    float _573 = gl_FragCoord.w;
    float _575 = _571 * _573;
    float _577 = fma(_543, 0.072200000286102294921875, _569);
    bool _579 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _581 = 1.0 / _577;
    float _583 = (*spvDescriptorSet0.fp_c15)._m0[653].w;
    if (_579)
    {
        float _585 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _587 = _305 + _585;
        _583 = _587;
    }
    float _589 = _583;
    float _591 = _581 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _593 = precise::clamp(_591, 0.0, 1.0);
    float _595 = fma(_593, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _597 = _88 * _555;
    float _599 = _88 * _567;
    float _601 = _595 * _597;
    float _603 = 0.0 + _345;
    float _605 = precise::clamp(_603, 0.0, 1.0);
    float _607 = _597;
    float _609 = _605;
    if (_579)
    {
        float _611 = _589 * 8.0;
        float _613 = precise::clamp(_611, 0.0, 1.0);
        _607 = _613;
    }
    float _615 = _607;
    float _617 = _88 * _561;
    float _619 = _88 * _575;
    float _621 = fma(_541, _601, _599);
    if (_579)
    {
        float _623 = _605 * _615;
        _609 = _623;
    }
    float _625 = _609;
    float _627 = fma(_547, _601, _617);
    float _629 = fma(_543, _601, _619);
    float _631 = 0.0 + _625;
    float _633 = precise::clamp(_631, 0.0, 1.0);
    out.m_65.x = _627;
    out.m_65.y = _621;
    out.m_65.z = _629;
    out.m_65.w = _633;
    return out;
}

