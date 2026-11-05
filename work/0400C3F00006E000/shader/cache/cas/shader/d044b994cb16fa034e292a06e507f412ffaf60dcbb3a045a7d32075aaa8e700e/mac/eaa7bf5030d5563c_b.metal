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
    constant _16* fp_c15 [[id(1)]];
    constant _16* fp_c8 [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    texturecube<float> fp_t_tcb_1E [[id(7)]];
    sampler fp_t_tcb_1ESmplr [[id(8)]];
    sampler fp_t_tcb_8Smplr_w [[id(9)]];
    sampler fp_t_tcb_ASmplr_w [[id(10)]];
    sampler fp_t_tcb_1ESmplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_51 [[color(0)]];
};

struct main0_in
{
    float4 m_44 [[user(locn0)]];
    float4 m_48 [[user(locn1)]];
    float4 m_46 [[user(locn2)]];
    float4 m_61 [[user(locn3)]];
    float4 m_42 [[user(locn4)]];
    float4 m_40 [[user(locn5)]];
    float4 m_67 [[user(locn6)]];
    float4 m_55 [[user(locn7)]];
    float4 m_57 [[user(locn8)]];
    float4 m_53 [[user(locn9)]];
    float4 m_63 [[user(locn10)]];
    float4 m_59 [[user(locn11)]];
    float4 m_65 [[user(locn12)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _74 = gl_FragCoord.w;
    float _76 = in.m_40.x;
    float _78 = gl_FragCoord.w;
    float _80 = _76 * _78;
    float _82 = in.m_40.y;
    float _84 = gl_FragCoord.w;
    float _86 = _82 * _84;
    float _88 = 1.0 / _74;
    float _90 = _88 * _80;
    float _92 = _88 * _86;
    float2 _620 = float2(_90, _92);
    float4 _95 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_620, float2(0.0), isnan(_620))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_620, float2(0.0), isnan(_620))).xyzw;
    float _97 = _95.x;
    float _99 = _95.y;
    float _101 = _95.z;
    float _103 = _95.w;
    float _105 = in.m_42.w;
    float _107 = gl_FragCoord.w;
    float _109 = _105 * _107;
    float _111 = in.m_44.w;
    float _113 = gl_FragCoord.w;
    float _115 = _111 * _113;
    float _117 = in.m_46.x;
    float _119 = gl_FragCoord.w;
    float _121 = _117 * _119;
    float _123 = _88 * _109;
    float _125 = _88 * _115;
    float _127 = in.m_40.z;
    float _129 = gl_FragCoord.w;
    float _131 = _127 * _129;
    float _133 = _88 * _131;
    float _135 = _103 * _123;
    float _137 = _125 * _135;
    float _139 = _88 * _121;
    float _141 = 0.0 + _137;
    float _143 = precise::clamp(_141, 0.0, 1.0);
    float _145 = _143 * _139;
    bool _149 = _145 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _151 = isnan(_145);
    bool _153 = _149 || _151;
    bool _155 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _157 = _153 || _155;
    float _159 = in.m_40.w;
    float _161 = gl_FragCoord.w;
    float _163 = _159 * _161;
    if (!_157)
    {
        discard_fragment();
    }
    float _165 = _88 * _163;
    float2 _725 = float2(_133, _165);
    float2 _169 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_725, float2(0.0), isnan(_725))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_725, float2(0.0), isnan(_725))).xy;
    float _171 = _169.x;
    float _173 = _169.y;
    float _175 = in.m_44.x;
    float _177 = gl_FragCoord.w;
    float _179 = _175 * _177;
    float _181 = in.m_48.x;
    float _183 = gl_FragCoord.w;
    float _185 = _181 * _183;
    float _187 = in.m_44.y;
    float _189 = gl_FragCoord.w;
    float _191 = _187 * _189;
    float _193 = in.m_48.y;
    float _195 = gl_FragCoord.w;
    float _197 = _193 * _195;
    float _199 = in.m_44.z;
    float _201 = gl_FragCoord.w;
    float _203 = _199 * _201;
    float _205 = in.m_48.z;
    float _207 = gl_FragCoord.w;
    float _209 = _205 * _207;
    float _211 = _88 * _179;
    float _213 = _88 * _185;
    float _215 = _88 * _191;
    float _217 = _88 * _197;
    float _219 = _88 * _203;
    float _221 = _88 * _209;
    float _223 = -_213;
    float _225 = _211 + _223;
    float _227 = -_217;
    float _229 = _215 + _227;
    float _231 = -_221;
    float _233 = _219 + _231;
    float _235 = fma(_97, _225, _213);
    float _237 = fma(_99, _229, _217);
    float _239 = fma(_101, _233, _221);
    if (!_157)
    {
        out.m_51.x = _235;
        out.m_51.y = _237;
        out.m_51.z = _239;
        out.m_51.w = _137;
        return out;
    }
    float _241 = in.m_53.y;
    float _243 = gl_FragCoord.w;
    float _245 = _241 * _243;
    float _247 = in.m_53.x;
    float _249 = gl_FragCoord.w;
    float _251 = _247 * _249;
    float _253 = in.m_53.z;
    float _255 = gl_FragCoord.w;
    float _257 = _253 * _255;
    float _259 = in.m_55.y;
    float _261 = gl_FragCoord.w;
    float _263 = _259 * _261;
    float _265 = in.m_55.x;
    float _267 = gl_FragCoord.w;
    float _269 = _265 * _267;
    float _271 = in.m_55.z;
    float _273 = gl_FragCoord.w;
    float _275 = _271 * _273;
    float _277 = in.m_57.y;
    float _279 = gl_FragCoord.w;
    float _281 = _277 * _279;
    float _283 = in.m_57.x;
    float _285 = gl_FragCoord.w;
    float _287 = _283 * _285;
    float _289 = in.m_57.z;
    float _291 = gl_FragCoord.w;
    float _293 = _289 * _291;
    float _295 = _173 * _173;
    float _297 = fma(_171, _171, _295);
    float _299 = precise::clamp(_297, 0.0, 1.0);
    float _301 = -_299;
    float _303 = _301 + 1.0;
    float _305 = sqrt(_303);
    float _307 = _88 * _245;
    float _309 = _88 * _251;
    float _311 = _88 * _257;
    float _313 = _88 * _263;
    float _315 = _307 * _307;
    float _317 = _88 * _275;
    float _319 = _88 * _281;
    float _321 = _88 * _287;
    float _323 = fma(_309, _309, _315);
    float _325 = _88 * _269;
    float _327 = _313 * _313;
    float _329 = _319 * _319;
    float _331 = fma(_311, _311, _323);
    float _333 = _88 * _293;
    float _335 = fma(_325, _325, _327);
    float _337 = fma(_321, _321, _329);
    float _339 = fma(_317, _317, _335);
    float _341 = fma(_333, _333, _337);
    float _343 = rsqrt(_331);
    float _345 = rsqrt(_339);
    float _347 = rsqrt(_341);
    float _349 = _345 * _173;
    float _351 = _343 * _171;
    float _353 = in.m_59.x;
    float _355 = gl_FragCoord.w;
    float _357 = _353 * _355;
    float _359 = _313 * _349;
    float _361 = _325 * _349;
    float _363 = _317 * _349;
    float _365 = _347 * _305;
    float _367 = fma(_307, _351, _359);
    float _369 = fma(_309, _351, _361);
    float _371 = fma(_311, _351, _363);
    float _373 = fma(_319, _365, _367);
    float _375 = fma(_321, _365, _369);
    float _377 = fma(_333, _365, _371);
    float _379 = _373 * _373;
    float _381 = fma(_375, _375, _379);
    float _383 = fma(_377, _377, _381);
    float _385 = rsqrt(_383);
    float _387 = _375 * _385;
    float _389 = _373 * _385;
    float _391 = _377 * _385;
    float _393 = abs(_387);
    float _395 = abs(_389);
    float _397 = precise::max(_393, _395);
    float _399 = abs(_391);
    float _401 = precise::max(_399, _397);
    float _403 = _88 * _357;
    float _405 = 1.0 / _401;
    float _407 = _389 * _405;
    float _409 = _387 * _405;
    float _411 = -_405;
    float _413 = _391 * _411;
    float _415 = precise::min(_403, 1.0);
    float3 _1083 = float3(_409, _407, _413);
    float3 _419 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1083, float3(0.0), isnan(_1083)), level(_415)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1083, float3(0.0), isnan(_1083)), level(_415)).xyz;
    float _421 = _419.x;
    float _423 = _419.y;
    float _425 = _419.z;
    float _427 = in.m_61.x;
    float _429 = gl_FragCoord.w;
    float _431 = _427 * _429;
    float _433 = in.m_61.y;
    float _435 = gl_FragCoord.w;
    float _437 = _433 * _435;
    float _439 = in.m_61.z;
    float _441 = gl_FragCoord.w;
    float _443 = _439 * _441;
    float _445 = in.m_63.y;
    float _447 = gl_FragCoord.w;
    float _449 = _445 * _447;
    float _451 = in.m_63.z;
    float _453 = gl_FragCoord.w;
    float _455 = _451 * _453;
    float _457 = in.m_63.x;
    float _459 = gl_FragCoord.w;
    float _461 = _457 * _459;
    float _463 = in.m_65.x;
    float _465 = gl_FragCoord.w;
    float _467 = _463 * _465;
    float _469 = in.m_65.w;
    float _471 = gl_FragCoord.w;
    float _473 = _469 * _471;
    float _475 = in.m_65.y;
    float _477 = gl_FragCoord.w;
    float _479 = _475 * _477;
    float _481 = in.m_65.z;
    float _483 = gl_FragCoord.w;
    float _485 = _481 * _483;
    float _487 = _88 * _431;
    float _489 = _88 * _437;
    float _491 = _88 * _443;
    bool _493 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _495 = fma(_423, 0.20999999344348907470703125, _489);
    float _497 = fma(_425, 0.20999999344348907470703125, _491);
    float _499 = _88 * _449;
    float _501 = fma(_421, 0.20999999344348907470703125, _487);
    float _503 = _88 * _455;
    float _505 = _88 * _461;
    float _507 = _495 + _499;
    float _509 = _88 * _485;
    float _511 = _497 + _503;
    float _513 = _501 + _505;
    float _515 = _237 * _507;
    float _517 = 0.0 + _145;
    float _519 = precise::clamp(_517, 0.0, 1.0);
    float _521 = _239 * _511;
    float _523 = _235 * _513;
    float _525 = _88 * _467;
    float _527 = _88 * _473;
    float _529 = _88 * _479;
    float _531 = fma(_523, _527, _525);
    float _533 = fma(_515, _527, _529);
    float _535 = fma(_521, _527, _509);
    float _537 = _525;
    if (!_493)
    {
        _537 = _519;
    }
    float _539 = _537;
    bool _541 = !_493;
    float _543 = _539;
    if (!_541)
    {
        float _545 = in.m_67.w;
        float _547 = gl_FragCoord.w;
        float _549 = _545 * _547;
        float _551 = in.m_67.z;
        float _553 = gl_FragCoord.w;
        float _555 = _551 * _553;
        float _557 = _88 * _549;
        float _559 = _88 * _555;
        float _561 = 1.0 / _557;
        float _563 = _559 * _561;
        float _565 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _567 = fma(_563, (*spvDescriptorSet0.fp_c8)._m0[30].w, _565);
        float _569 = 1.0 / _567;
        float _571 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _573 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _575 = fma(_569, _571, _573);
        float _577 = _575 * 8.0;
        float _579 = precise::clamp(_577, 0.0, 1.0);
        float _581 = _519 * _579;
        _543 = _581;
    }
    float _583 = _543;
    float _585 = 0.0 + _583;
    float _587 = precise::clamp(_585, 0.0, 1.0);
    out.m_51.x = _531;
    out.m_51.y = _533;
    out.m_51.z = _535;
    out.m_51.w = _587;
    return out;
}

