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
    constant _16* fp_c7 [[id(2)]];
    constant _16* fp_c15 [[id(3)]];
    constant _16* fp_c13 [[id(4)]];
    texture2d<float> fp_t_tcb_10 [[id(5)]];
    sampler fp_t_tcb_10Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_8 [[id(7)]];
    sampler fp_t_tcb_8Smplr [[id(8)]];
    texture2d<float> fp_t_tcb_C [[id(9)]];
    sampler fp_t_tcb_CSmplr [[id(10)]];
    texturecube<float> fp_t_tcb_1E [[id(11)]];
    sampler fp_t_tcb_1ESmplr [[id(12)]];
    sampler fp_t_tcb_10Smplr_w [[id(13)]];
    sampler fp_t_tcb_8Smplr_w [[id(14)]];
    sampler fp_t_tcb_CSmplr_w [[id(15)]];
    sampler fp_t_tcb_1ESmplr_w [[id(16)]];
    constant dm_border_t* dm_border [[id(17)]];
};

struct main0_out
{
    float4 m_61 [[color(0)]];
};

struct main0_in
{
    float4 m_52 [[user(locn0)]];
    float4 m_56 [[user(locn1)]];
    float4 m_58 [[user(locn2)]];
    float4 m_69 [[user(locn3)]];
    float4 m_54 [[user(locn4)]];
    float4 m_48 [[user(locn5)]];
    float4 m_46 [[user(locn6)]];
    float4 m_50 [[user(locn7)]];
    float4 m_63 [[user(locn8)]];
    float4 m_71 [[user(locn9)]];
    float4 m_67 [[user(locn10)]];
    float4 m_65 [[user(locn11)]];
    float4 m_73 [[user(locn12)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _80 = gl_FragCoord.w;
    float _82 = in.m_46.w;
    float _84 = gl_FragCoord.w;
    float _86 = _82 * _84;
    float _88 = in.m_46.x;
    float _90 = gl_FragCoord.w;
    float _92 = _88 * _90;
    float _94 = in.m_46.y;
    float _96 = gl_FragCoord.w;
    float _98 = _94 * _96;
    float _100 = in.m_48.x;
    float _102 = gl_FragCoord.w;
    float _104 = _100 * _102;
    float _106 = in.m_48.y;
    float _108 = gl_FragCoord.w;
    float _110 = _106 * _108;
    float _112 = in.m_50.x;
    float _114 = gl_FragCoord.w;
    float _116 = _112 * _114;
    float _118 = in.m_50.y;
    float _120 = gl_FragCoord.w;
    float _122 = _118 * _120;
    float _124 = 1.0 / _80;
    float _126 = _124 * _86;
    float _128 = _124 * _92;
    float _130 = _124 * _98;
    float _132 = _124 * _104;
    float _134 = 1.0 / _126;
    float _136 = _124 * _110;
    float _138 = _124 * _116;
    float _140 = _124 * _122;
    float _142 = _128 * _134;
    float _144 = _130 * _134;
    float2 _713 = float2(_142, _144);
    float _146 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_713, float2(0.0), isnan(_713))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_713, float2(0.0), isnan(_713))).x;
    float2 _724 = float2(_132, _136);
    float4 _149 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_724, float2(0.0), isnan(_724))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_724, float2(0.0), isnan(_724))).xyzw;
    float _151 = _149.x;
    float _153 = _149.y;
    float _155 = _149.z;
    float _157 = _149.w;
    float2 _740 = float2(_138, _140);
    float4 _159 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_740, float2(0.0), isnan(_740))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_740, float2(0.0), isnan(_740))).xyzw;
    float _161 = _159.x;
    float _163 = _159.y;
    float _165 = _159.z;
    float _167 = _159.w;
    float _169 = in.m_46.z;
    float _171 = gl_FragCoord.w;
    float _173 = _169 * _171;
    float _175 = in.m_52.w;
    float _177 = gl_FragCoord.w;
    float _179 = _175 * _177;
    float _181 = in.m_54.w;
    float _183 = gl_FragCoord.w;
    float _185 = _181 * _183;
    float _187 = in.m_56.w;
    float _189 = gl_FragCoord.w;
    float _191 = _187 * _189;
    float _193 = in.m_58.x;
    float _195 = gl_FragCoord.w;
    float _197 = _193 * _195;
    float _199 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _201 = _124 * _173;
    float _203 = _201 * _134;
    float _205 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _207 = fma(_203, (*spvDescriptorSet0.fp_c8)._m0[30].w, _205);
    float _209 = _124 * _179;
    float _211 = _124 * _197;
    float _213 = 1.0 / _207;
    float _215 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _217 = _213 * _215;
    float _219 = in.m_56.y;
    float _221 = gl_FragCoord.w;
    float _223 = _219 * _221;
    float _225 = in.m_56.z;
    float _227 = gl_FragCoord.w;
    float _229 = _225 * _227;
    float _231 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _233 = fma(_146, (*spvDescriptorSet0.fp_c8)._m0[30].w, _231);
    float _235 = _124 * _185;
    float _237 = 1.0 / _233;
    float _239 = _157 * _167;
    float _241 = -_209;
    float _243 = fma(_239, _235, _241);
    float _245 = _124 * _191;
    float _247 = _245 * _243;
    float _249 = 0.0 + _247;
    float _251 = precise::clamp(_249, 0.0, 1.0);
    float _253 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _255 = -_217;
    float _257 = fma(_237, _253, _255);
    float _259 = _257 * _199;
    float _261 = precise::clamp(_259, 0.0, 1.0);
    float _263 = _251 * _261;
    float _265 = _263 * _211;
    bool _269 = _265 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _271 = isnan(_265);
    bool _273 = _269 || _271;
    bool _275 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _277 = _273 || _275;
    float _279 = in.m_56.x;
    float _281 = gl_FragCoord.w;
    float _283 = _279 * _281;
    float _285 = in.m_52.x;
    float _287 = gl_FragCoord.w;
    float _289 = _285 * _287;
    float _291 = in.m_52.y;
    float _293 = gl_FragCoord.w;
    float _295 = _291 * _293;
    float _297 = in.m_52.z;
    float _299 = gl_FragCoord.w;
    float _301 = _297 * _299;
    float _303 = _217;
    if (!_277)
    {
        discard_fragment();
    }
    float _305 = _153 * _153;
    float _307 = _151 * _151;
    float _309 = _155 * _155;
    float _311 = _305 * _163;
    float _313 = _307 * _161;
    float _315 = _309 * _165;
    float _317 = _124 * _223;
    float _319 = _124 * _229;
    float _321 = -_313;
    float _323 = _321 + 1.0;
    float _325 = -_315;
    float _327 = _325 + 1.0;
    float _329 = _319 * _327;
    float _331 = _124 * _283;
    float _333 = -_311;
    float _335 = _333 + 1.0;
    float _337 = _124 * _295;
    float _339 = _124 * _301;
    float _341 = _331 * _323;
    float _343 = _317 * _335;
    float _345 = _124 * _289;
    float _347 = 0.0 + (*spvDescriptorSet0.fp_c7)._m0[0].x;
    float _349 = precise::clamp(_347, 0.0, 1.0);
    float _351 = fma(_315, _339, _329);
    float _353 = fma(_313, _345, _341);
    float _355 = fma(_349, -0.5, 1.0);
    float _357 = fma(_311, _337, _343);
    float _359 = _353 * _355;
    float _361 = _357 * _355;
    float _363 = _351 * _355;
    if (!_277)
    {
        out.m_61.x = _359;
        out.m_61.y = _361;
        out.m_61.z = _363;
        out.m_61.w = _247;
        return out;
    }
    float _365 = in.m_63.y;
    float _367 = gl_FragCoord.w;
    float _369 = _365 * _367;
    float _371 = in.m_63.x;
    float _373 = gl_FragCoord.w;
    float _375 = _371 * _373;
    float _377 = in.m_63.z;
    float _379 = gl_FragCoord.w;
    float _381 = _377 * _379;
    float _383 = in.m_65.x;
    float _385 = gl_FragCoord.w;
    float _387 = _383 * _385;
    float _389 = _124 * _369;
    float _391 = _124 * _375;
    float _393 = _124 * _381;
    float _395 = _389 * _389;
    float _397 = fma(_391, _391, _395);
    float _399 = fma(_393, _393, _397);
    float _401 = rsqrt(_399);
    float _403 = _391 * _401;
    float _405 = _389 * _401;
    float _407 = _393 * _401;
    float _409 = _124 * _387;
    float _411 = abs(_403);
    float _413 = abs(_405);
    float _415 = precise::max(_411, _413);
    float _417 = precise::min(_409, 1.0);
    float _419 = abs(_407);
    float _421 = precise::max(_419, _415);
    float _423 = 1.0 / _421;
    float _425 = -_423;
    float _427 = _407 * _425;
    float _429 = _403 * _423;
    float _431 = _405 * _423;
    float3 _1131 = float3(_429, _431, _427);
    float3 _435 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1131, float3(0.0), isnan(_1131)), level(_417)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1131, float3(0.0), isnan(_1131)), level(_417)).xyz;
    float _437 = _435.x;
    float _439 = _435.y;
    float _441 = _435.z;
    float _443 = in.m_67.x;
    float _445 = gl_FragCoord.w;
    float _447 = _443 * _445;
    float _449 = in.m_67.y;
    float _451 = gl_FragCoord.w;
    float _453 = _449 * _451;
    float _455 = in.m_67.z;
    float _457 = gl_FragCoord.w;
    float _459 = _455 * _457;
    float _461 = in.m_69.x;
    float _463 = gl_FragCoord.w;
    float _465 = _461 * _463;
    float _467 = in.m_69.z;
    float _469 = gl_FragCoord.w;
    float _471 = _467 * _469;
    float _473 = in.m_69.y;
    float _475 = gl_FragCoord.w;
    float _477 = _473 * _475;
    float _479 = in.m_71.z;
    float _481 = gl_FragCoord.w;
    float _483 = _479 * _481;
    float _485 = in.m_71.x;
    float _487 = gl_FragCoord.w;
    float _489 = _485 * _487;
    float _491 = in.m_71.y;
    float _493 = gl_FragCoord.w;
    float _495 = _491 * _493;
    float _497 = in.m_73.x;
    float _499 = gl_FragCoord.w;
    float _501 = _497 * _499;
    float _503 = in.m_73.y;
    float _505 = gl_FragCoord.w;
    float _507 = _503 * _505;
    float _509 = in.m_73.z;
    float _511 = gl_FragCoord.w;
    float _513 = _509 * _511;
    float _515 = in.m_73.w;
    float _517 = gl_FragCoord.w;
    float _519 = _515 * _517;
    bool _521 = 0.5 <= (*spvDescriptorSet0.fp_c15)._m0[653].w;
    float _523 = -(*spvDescriptorSet0.fp_c13)._m0[0].y;
    float _525 = _523 + 1.0;
    if (_521)
    {
        float _527 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _529 = _217 + _527;
        _303 = _529;
    }
    float _531 = _303;
    float _533 = _531;
    if (_521)
    {
        float _535 = _531 * 8.0;
        float _537 = precise::clamp(_535, 0.0, 1.0);
        _533 = _537;
    }
    float _539 = _533;
    float _541 = _124 * _447;
    float _543 = _124 * _453;
    float _545 = _124 * _459;
    float _547 = _124 * _465;
    float _549 = fma(_541, (*spvDescriptorSet0.fp_c13)._m0[0].y, _525);
    float _551 = fma(_543, (*spvDescriptorSet0.fp_c13)._m0[0].y, _525);
    float _553 = fma(_545, (*spvDescriptorSet0.fp_c13)._m0[0].y, _525);
    float _555 = _124 * _471;
    float _557 = _124 * _483;
    float _559 = _361 * _551;
    float _561 = precise::clamp(_559, 0.0, 1.0);
    float _563 = _363 * _553;
    float _565 = precise::clamp(_563, 0.0, 1.0);
    float _567 = _124 * _489;
    float _569 = _124 * _495;
    float _571 = _359 * _549;
    float _573 = precise::clamp(_571, 0.0, 1.0);
    float _575 = _124 * _501;
    float _577 = _124 * _507;
    float _579 = _124 * _513;
    float _581 = fma(_437, 0.20999999344348907470703125, _547);
    float _583 = _124 * _477;
    float _585 = fma(_441, 0.20999999344348907470703125, _555);
    float _587 = _124 * _519;
    float _589 = _581 + _567;
    float _591 = fma(_439, 0.20999999344348907470703125, _583);
    float _593 = _585 + _557;
    float _595 = 0.0 + _265;
    float _597 = precise::clamp(_595, 0.0, 1.0);
    float _599 = _573 * _589;
    float _601 = _591 + _569;
    float _603 = _565 * _593;
    float _605 = _597;
    if (_521)
    {
        float _607 = _597 * _539;
        _605 = _607;
    }
    float _609 = _605;
    float _611 = fma(_599, _587, _575);
    float _613 = _561 * _601;
    float _615 = fma(_603, _587, _579);
    float _617 = 0.0 + _609;
    float _619 = precise::clamp(_617, 0.0, 1.0);
    float _621 = fma(_613, _587, _577);
    out.m_61.x = _611;
    out.m_61.y = _621;
    out.m_61.z = _615;
    out.m_61.w = _619;
    return out;
}

