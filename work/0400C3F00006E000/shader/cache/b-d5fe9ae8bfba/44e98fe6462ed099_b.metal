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
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_10 [[id(5)]];
    sampler fp_t_tcb_10Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_A [[id(7)]];
    sampler fp_t_tcb_ASmplr [[id(8)]];
    texture2d<float> fp_t_tcb_C [[id(9)]];
    sampler fp_t_tcb_CSmplr [[id(10)]];
    texturecube<float> fp_t_tcb_1E [[id(11)]];
    sampler fp_t_tcb_1ESmplr [[id(12)]];
    sampler fp_t_tcb_8Smplr_w [[id(13)]];
    sampler fp_t_tcb_10Smplr_w [[id(14)]];
    sampler fp_t_tcb_ASmplr_w [[id(15)]];
    sampler fp_t_tcb_CSmplr_w [[id(16)]];
    sampler fp_t_tcb_1ESmplr_w [[id(17)]];
    constant dm_border_t* dm_border [[id(18)]];
};

struct main0_out
{
    float4 m_61 [[color(0)]];
};

struct main0_in
{
    float4 m_54 [[user(locn0)]];
    float4 m_58 [[user(locn1)]];
    float4 m_56 [[user(locn2)]];
    float4 m_65 [[user(locn3)]];
    float4 m_52 [[user(locn4)]];
    float4 m_44 [[user(locn5)]];
    float4 m_46 [[user(locn6)]];
    float4 m_48 [[user(locn7)]];
    float4 m_63 [[user(locn8)]];
    float4 m_50 [[user(locn9)]];
    float4 m_67 [[user(locn10)]];
    float4 m_69 [[user(locn11)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _76 = gl_FragCoord.w;
    float _78 = in.m_44.x;
    float _80 = gl_FragCoord.w;
    float _82 = _78 * _80;
    float _84 = in.m_44.y;
    float _86 = gl_FragCoord.w;
    float _88 = _84 * _86;
    float _90 = 1.0 / _76;
    float _92 = _90 * _82;
    float _94 = _90 * _88;
    float2 _646 = float2(_92, _94);
    float2 _98 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_646, float2(0.0), isnan(_646))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_646, float2(0.0), isnan(_646))).xy;
    float _100 = _98.x;
    float _102 = _98.y;
    float _104 = in.m_46.w;
    float _106 = gl_FragCoord.w;
    float _108 = _104 * _106;
    float _110 = in.m_46.x;
    float _112 = gl_FragCoord.w;
    float _114 = _110 * _112;
    float _116 = in.m_44.w;
    float _118 = gl_FragCoord.w;
    float _120 = _116 * _118;
    float _122 = in.m_46.y;
    float _124 = gl_FragCoord.w;
    float _126 = _122 * _124;
    float _128 = in.m_48.x;
    float _130 = gl_FragCoord.w;
    float _132 = _128 * _130;
    float _134 = in.m_44.z;
    float _136 = gl_FragCoord.w;
    float _138 = _134 * _136;
    float _140 = in.m_48.y;
    float _142 = gl_FragCoord.w;
    float _144 = _140 * _142;
    float _146 = _90 * _108;
    float _148 = _90 * _114;
    float _150 = _90 * _120;
    float _152 = _90 * _126;
    float _154 = _90 * _132;
    float _156 = _90 * _138;
    float _158 = 1.0 / _146;
    float _160 = _90 * _144;
    float _162 = _148 * _158;
    float _164 = _152 * _158;
    float2 _740 = float2(_162, _164);
    float _166 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_740, float2(0.0), isnan(_740))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_740, float2(0.0), isnan(_740))).x;
    float _168 = fma(_100, (*spvDescriptorSet0.fp_c9)._m0[193].x, _156);
    float _170 = fma(_102, (*spvDescriptorSet0.fp_c9)._m0[193].x, _150);
    float _172 = fma(_100, (*spvDescriptorSet0.fp_c9)._m0[193].x, _154);
    float _174 = fma(_102, (*spvDescriptorSet0.fp_c9)._m0[193].x, _160);
    float2 _771 = float2(_168, _170);
    float4 _177 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_771, float2(0.0), isnan(_771))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_771, float2(0.0), isnan(_771))).xyzw;
    float _179 = _177.x;
    float _181 = _177.y;
    float _183 = _177.z;
    float _185 = _177.w;
    float2 _787 = float2(_172, _174);
    float4 _187 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_787, float2(0.0), isnan(_787))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_787, float2(0.0), isnan(_787))).xyzw;
    float _189 = _187.x;
    float _191 = _187.y;
    float _193 = _187.z;
    float _195 = _187.w;
    float _197 = in.m_50.x;
    float _199 = gl_FragCoord.w;
    float _201 = _197 * _199;
    float _203 = in.m_46.z;
    float _205 = gl_FragCoord.w;
    float _207 = _203 * _205;
    float _209 = in.m_52.w;
    float _211 = gl_FragCoord.w;
    float _213 = _209 * _211;
    float _215 = -(*spvDescriptorSet0.fp_c9)._m0[193].y;
    float _217 = (*spvDescriptorSet0.fp_c9)._m0[193].z + _215;
    float _219 = 1.0 / _217;
    float _221 = _90 * _201;
    float _223 = _90 * _207;
    float _225 = in.m_54.w;
    float _227 = gl_FragCoord.w;
    float _229 = _225 * _227;
    float _231 = in.m_56.x;
    float _233 = gl_FragCoord.w;
    float _235 = _231 * _233;
    float _237 = _223 * _158;
    float _239 = precise::max(_221, (*spvDescriptorSet0.fp_c9)._m0[193].y);
    float _241 = in.m_58.w;
    float _243 = gl_FragCoord.w;
    float _245 = _241 * _243;
    float _247 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _249 = fma(_237, (*spvDescriptorSet0.fp_c8)._m0[30].w, _247);
    float _251 = precise::min(_239, (*spvDescriptorSet0.fp_c9)._m0[193].z);
    float _253 = -(*spvDescriptorSet0.fp_c9)._m0[193].y;
    float _255 = _251 + _253;
    float _257 = 1.0 / _249;
    float _259 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _261 = fma(_166, (*spvDescriptorSet0.fp_c8)._m0[30].w, _259);
    float _263 = _255 * _219;
    float _265 = _90 * _213;
    float _267 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _269 = 1.0 / _261;
    float _271 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _273 = _257 * _271;
    float _275 = in.m_54.x;
    float _277 = gl_FragCoord.w;
    float _279 = _275 * _277;
    float _281 = in.m_54.z;
    float _283 = gl_FragCoord.w;
    float _285 = _281 * _283;
    float _287 = _185 * _195;
    float _289 = _287 * _263;
    float _291 = _90 * _245;
    float _293 = _289 * _265;
    float _295 = _90 * _229;
    float _297 = _295 * _293;
    float _299 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _301 = -_273;
    float _303 = fma(_269, _299, _301);
    float _305 = _90 * _235;
    float _307 = _291 * _297;
    float _309 = _303 * _267;
    float _311 = precise::clamp(_309, 0.0, 1.0);
    float _313 = 0.0 + _307;
    float _315 = precise::clamp(_313, 0.0, 1.0);
    float _317 = _315 * _311;
    float _319 = _317 * _305;
    bool _323 = _319 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _325 = isnan(_319);
    bool _327 = _323 || _325;
    bool _329 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _331 = _327 || _329;
    float _333 = in.m_58.x;
    float _335 = gl_FragCoord.w;
    float _337 = _333 * _335;
    float _339 = in.m_58.y;
    float _341 = gl_FragCoord.w;
    float _343 = _339 * _341;
    float _345 = in.m_58.z;
    float _347 = gl_FragCoord.w;
    float _349 = _345 * _347;
    float _351 = in.m_54.y;
    float _353 = gl_FragCoord.w;
    float _355 = _351 * _353;
    float _357 = _273;
    if (!_331)
    {
        discard_fragment();
    }
    float _359 = _179 * _179;
    float _361 = _189 * _189;
    float _363 = _181 * _181;
    float _365 = _191 * _191;
    float _367 = _183 * _183;
    float _369 = _193 * _193;
    float _371 = _359 * _361;
    float _373 = _363 * _365;
    float _375 = _367 * _369;
    float _377 = _90 * _337;
    float _379 = _90 * _343;
    float _381 = -_371;
    float _383 = _381 + 1.0;
    float _385 = _90 * _349;
    float _387 = -_373;
    float _389 = _387 + 1.0;
    float _391 = -_375;
    float _393 = _391 + 1.0;
    float _395 = _377 * _383;
    float _397 = _90 * _279;
    float _399 = _379 * _389;
    float _401 = _385 * _393;
    float _403 = _90 * _355;
    float _405 = _90 * _285;
    float _407 = fma(_371, _397, _395);
    float _409 = fma(_373, _403, _399);
    float _411 = fma(_375, _405, _401);
    if (!_331)
    {
        out.m_61.x = _407;
        out.m_61.y = _409;
        out.m_61.z = _411;
        out.m_61.w = _307;
        return out;
    }
    float _413 = in.m_63.y;
    float _415 = gl_FragCoord.w;
    float _417 = _413 * _415;
    float _419 = in.m_63.x;
    float _421 = gl_FragCoord.w;
    float _423 = _419 * _421;
    float _425 = in.m_63.z;
    float _427 = gl_FragCoord.w;
    float _429 = _425 * _427;
    float _431 = _90 * _417;
    float _433 = _90 * _423;
    float _435 = _90 * _429;
    float _437 = _431 * _431;
    float _439 = fma(_433, _433, _437);
    float _441 = fma(_435, _435, _439);
    float _443 = rsqrt(_441);
    float _445 = _433 * _443;
    float _447 = _431 * _443;
    float _449 = _435 * _443;
    float _451 = abs(_445);
    float _453 = abs(_447);
    float _455 = precise::max(_451, _453);
    float _457 = abs(_449);
    float _459 = precise::max(_457, _455);
    float _461 = 1.0 / _459;
    float _463 = _445 * _461;
    float _465 = _447 * _461;
    float _467 = -_461;
    float _469 = _449 * _467;
    float3 _1194 = float3(_463, _465, _469);
    float3 _473 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1194, float3(0.0), isnan(_1194)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1194, float3(0.0), isnan(_1194)), level(0.0)).xyz;
    float _475 = _473.x;
    float _477 = _473.y;
    float _479 = _473.z;
    float _481 = in.m_65.x;
    float _483 = gl_FragCoord.w;
    float _485 = _481 * _483;
    float _487 = in.m_65.z;
    float _489 = gl_FragCoord.w;
    float _491 = _487 * _489;
    float _493 = in.m_65.y;
    float _495 = gl_FragCoord.w;
    float _497 = _493 * _495;
    float _499 = in.m_67.z;
    float _501 = gl_FragCoord.w;
    float _503 = _499 * _501;
    float _505 = in.m_67.x;
    float _507 = gl_FragCoord.w;
    float _509 = _505 * _507;
    float _511 = in.m_67.y;
    float _513 = gl_FragCoord.w;
    float _515 = _511 * _513;
    float _517 = in.m_69.x;
    float _519 = gl_FragCoord.w;
    float _521 = _517 * _519;
    float _523 = in.m_69.y;
    float _525 = gl_FragCoord.w;
    float _527 = _523 * _525;
    float _529 = in.m_69.z;
    float _531 = gl_FragCoord.w;
    float _533 = _529 * _531;
    float _535 = in.m_69.w;
    float _537 = gl_FragCoord.w;
    float _539 = _535 * _537;
    bool _541 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    if (_541)
    {
        float _543 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _545 = _273 + _543;
        _357 = _545;
    }
    float _547 = _357;
    float _549 = _547;
    if (_541)
    {
        float _551 = _547 * 8.0;
        float _553 = precise::clamp(_551, 0.0, 1.0);
        _549 = _553;
    }
    float _555 = _549;
    float _557 = _90 * _485;
    float _559 = _90 * _491;
    float _561 = _90 * _503;
    float _563 = _90 * _509;
    float _565 = _90 * _527;
    float _567 = _90 * _533;
    float _569 = fma(_475, 0.20999999344348907470703125, _557);
    float _571 = _90 * _497;
    float _573 = fma(_479, 0.20999999344348907470703125, _559);
    float _575 = _90 * _515;
    float _577 = _569 + _563;
    float _579 = fma(_477, 0.20999999344348907470703125, _571);
    float _581 = _573 + _561;
    float _583 = 0.0 + _319;
    float _585 = precise::clamp(_583, 0.0, 1.0);
    float _587 = _90 * _521;
    float _589 = _579 + _575;
    float _591 = _90 * _539;
    float _593 = _407 * _577;
    float _595 = _411 * _581;
    float _597 = _409 * _589;
    float _599 = _585;
    if (_541)
    {
        float _601 = _585 * _555;
        _599 = _601;
    }
    float _603 = _599;
    float _605 = fma(_593, _591, _587);
    float _607 = fma(_595, _591, _567);
    float _609 = fma(_597, _591, _565);
    float _611 = 0.0 + _603;
    float _613 = precise::clamp(_611, 0.0, 1.0);
    out.m_61.x = _605;
    out.m_61.y = _609;
    out.m_61.z = _607;
    out.m_61.w = _613;
    return out;
}

