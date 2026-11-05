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
    constant _16* fp_c7 [[id(1)]];
    constant _16* fp_c15 [[id(2)]];
    constant _16* fp_c13 [[id(3)]];
    constant _16* fp_c8 [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    texturecube<float> fp_t_tcb_1E [[id(7)]];
    sampler fp_t_tcb_1ESmplr [[id(8)]];
    sampler fp_t_tcb_8Smplr_w [[id(9)]];
    sampler fp_t_tcb_1ESmplr_w [[id(10)]];
    constant dm_border_t* dm_border [[id(11)]];
};

struct main0_out
{
    float4 m_53 [[color(0)]];
};

struct main0_in
{
    float4 m_44 [[user(locn0)]];
    float4 m_48 [[user(locn1)]];
    float4 m_50 [[user(locn2)]];
    float4 m_61 [[user(locn3)]];
    float4 m_46 [[user(locn4)]];
    float4 m_42 [[user(locn5)]];
    float4 m_67 [[user(locn6)]];
    float4 m_55 [[user(locn8)]];
    float4 m_63 [[user(locn9)]];
    float4 m_59 [[user(locn10)]];
    float4 m_57 [[user(locn11)]];
    float4 m_65 [[user(locn12)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _74 = gl_FragCoord.w;
    float _76 = in.m_42.x;
    float _78 = gl_FragCoord.w;
    float _80 = _76 * _78;
    float _82 = in.m_42.y;
    float _84 = gl_FragCoord.w;
    float _86 = _82 * _84;
    float _88 = 1.0 / _74;
    float _90 = _88 * _80;
    float _92 = _88 * _86;
    float2 _563 = float2(_90, _92);
    float4 _95 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_563, float2(0.0), isnan(_563))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_563, float2(0.0), isnan(_563))).xyzw;
    float _97 = _95.x;
    float _99 = _95.y;
    float _101 = _95.z;
    float _103 = _95.w;
    float _105 = in.m_44.w;
    float _107 = gl_FragCoord.w;
    float _109 = _105 * _107;
    float _111 = in.m_46.w;
    float _113 = gl_FragCoord.w;
    float _115 = _111 * _113;
    float _117 = in.m_48.w;
    float _119 = gl_FragCoord.w;
    float _121 = _117 * _119;
    float _123 = in.m_50.x;
    float _125 = gl_FragCoord.w;
    float _127 = _123 * _125;
    float _129 = _88 * _109;
    float _131 = _88 * _115;
    float _133 = _88 * _121;
    float _135 = in.m_48.y;
    float _137 = gl_FragCoord.w;
    float _139 = _135 * _137;
    float _141 = in.m_44.x;
    float _143 = gl_FragCoord.w;
    float _145 = _141 * _143;
    float _147 = in.m_44.y;
    float _149 = gl_FragCoord.w;
    float _151 = _147 * _149;
    float _153 = in.m_44.z;
    float _155 = gl_FragCoord.w;
    float _157 = _153 * _155;
    float _159 = -_129;
    float _161 = fma(_103, _131, _159);
    float _163 = _133 * _161;
    float _165 = _88 * _127;
    float _167 = 0.0 + _163;
    float _169 = precise::clamp(_167, 0.0, 1.0);
    float _171 = _169 * _165;
    bool _175 = _171 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _177 = isnan(_171);
    bool _179 = _175 || _177;
    bool _181 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _183 = _179 || _181;
    float _185 = in.m_48.x;
    float _187 = gl_FragCoord.w;
    float _189 = _185 * _187;
    float _191 = in.m_48.z;
    float _193 = gl_FragCoord.w;
    float _195 = _191 * _193;
    if (!_183)
    {
        discard_fragment();
    }
    float _197 = -_99;
    float _199 = _197 + 1.0;
    float _201 = _88 * _189;
    float _203 = _88 * _139;
    float _205 = _88 * _195;
    float _207 = -_97;
    float _209 = _207 + 1.0;
    float _211 = -_101;
    float _213 = _211 + 1.0;
    float _215 = _203 * _199;
    float _217 = _201 * _209;
    float _219 = _205 * _213;
    float _221 = _88 * _145;
    float _223 = _88 * _151;
    float _225 = 0.0 + (*spvDescriptorSet0.fp_c7)._m0[0].x;
    float _227 = precise::clamp(_225, 0.0, 1.0);
    float _229 = _88 * _157;
    float _231 = fma(_97, _221, _217);
    float _233 = fma(_99, _223, _215);
    float _235 = fma(_227, -0.5, 1.0);
    float _237 = fma(_101, _229, _219);
    float _239 = _231 * _235;
    float _241 = _233 * _235;
    float _243 = _237 * _235;
    if (!_183)
    {
        out.m_53.x = _239;
        out.m_53.y = _241;
        out.m_53.z = _243;
        out.m_53.w = _163;
        return out;
    }
    float _245 = in.m_55.y;
    float _247 = gl_FragCoord.w;
    float _249 = _245 * _247;
    float _251 = in.m_55.x;
    float _253 = gl_FragCoord.w;
    float _255 = _251 * _253;
    float _257 = in.m_55.z;
    float _259 = gl_FragCoord.w;
    float _261 = _257 * _259;
    float _263 = in.m_57.x;
    float _265 = gl_FragCoord.w;
    float _267 = _263 * _265;
    float _269 = _88 * _249;
    float _271 = _88 * _255;
    float _273 = _88 * _261;
    float _275 = _269 * _269;
    float _277 = fma(_271, _271, _275);
    float _279 = _88 * _267;
    float _281 = fma(_273, _273, _277);
    float _283 = rsqrt(_281);
    float _285 = _271 * _283;
    float _287 = _269 * _283;
    float _289 = _273 * _283;
    float _291 = precise::min(_279, 1.0);
    float _293 = abs(_285);
    float _295 = abs(_287);
    float _297 = precise::max(_293, _295);
    float _299 = abs(_289);
    float _301 = precise::max(_299, _297);
    float _303 = 1.0 / _301;
    float _305 = _285 * _303;
    float _307 = -_303;
    float _309 = _289 * _307;
    float _311 = _287 * _303;
    float3 _874 = float3(_305, _311, _309);
    float3 _315 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_874, float3(0.0), isnan(_874)), level(_291)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_874, float3(0.0), isnan(_874)), level(_291)).xyz;
    float _317 = _315.x;
    float _319 = _315.y;
    float _321 = _315.z;
    float _323 = in.m_59.x;
    float _325 = gl_FragCoord.w;
    float _327 = _323 * _325;
    float _329 = in.m_59.y;
    float _331 = gl_FragCoord.w;
    float _333 = _329 * _331;
    float _335 = in.m_59.z;
    float _337 = gl_FragCoord.w;
    float _339 = _335 * _337;
    float _341 = in.m_61.x;
    float _343 = gl_FragCoord.w;
    float _345 = _341 * _343;
    float _347 = in.m_61.y;
    float _349 = gl_FragCoord.w;
    float _351 = _347 * _349;
    float _353 = in.m_61.z;
    float _355 = gl_FragCoord.w;
    float _357 = _353 * _355;
    float _359 = in.m_63.x;
    float _361 = gl_FragCoord.w;
    float _363 = _359 * _361;
    float _365 = in.m_63.y;
    float _367 = gl_FragCoord.w;
    float _369 = _365 * _367;
    float _371 = in.m_63.z;
    float _373 = gl_FragCoord.w;
    float _375 = _371 * _373;
    float _377 = in.m_65.x;
    float _379 = gl_FragCoord.w;
    float _381 = _377 * _379;
    float _383 = in.m_65.w;
    float _385 = gl_FragCoord.w;
    float _387 = _383 * _385;
    float _389 = in.m_65.z;
    float _391 = gl_FragCoord.w;
    float _393 = _389 * _391;
    float _395 = 0.0 + _171;
    float _397 = precise::clamp(_395, 0.0, 1.0);
    float _399 = in.m_65.y;
    float _401 = gl_FragCoord.w;
    float _403 = _399 * _401;
    bool _405 = 0.5 <= (*spvDescriptorSet0.fp_c15)._m0[653].w;
    float _407 = _88 * _327;
    float _409 = -(*spvDescriptorSet0.fp_c13)._m0[0].y;
    float _411 = _409 + 1.0;
    float _413 = _88 * _333;
    float _415 = _88 * _339;
    float _417 = fma(_407, (*spvDescriptorSet0.fp_c13)._m0[0].y, _411);
    float _419 = fma(_413, (*spvDescriptorSet0.fp_c13)._m0[0].y, _411);
    float _421 = fma(_415, (*spvDescriptorSet0.fp_c13)._m0[0].y, _411);
    float _423 = _88 * _357;
    float _425 = _239 * _417;
    float _427 = precise::clamp(_425, 0.0, 1.0);
    float _429 = _241 * _419;
    float _431 = precise::clamp(_429, 0.0, 1.0);
    float _433 = _88 * _345;
    float _435 = _88 * _351;
    float _437 = _243 * _421;
    float _439 = precise::clamp(_437, 0.0, 1.0);
    float _441 = _88 * _363;
    float _443 = _88 * _369;
    float _445 = _88 * _375;
    float _447 = _88 * _381;
    float _449 = _88 * _387;
    float _451 = _88 * _403;
    float _453 = _88 * _393;
    float _455 = fma(_317, 0.20999999344348907470703125, _433);
    float _457 = fma(_319, 0.20999999344348907470703125, _435);
    float _459 = fma(_321, 0.20999999344348907470703125, _423);
    float _461 = _455 + _441;
    float _463 = _457 + _443;
    float _465 = _459 + _445;
    float _467 = _427 * _461;
    float _469 = _431 * _463;
    float _471 = _439 * _465;
    float _473 = fma(_467, _449, _447);
    float _475 = fma(_469, _449, _451);
    float _477 = fma(_471, _449, _453);
    float _479 = _447;
    if (!_405)
    {
        _479 = _397;
    }
    float _481 = _479;
    bool _483 = !_405;
    float _485 = _481;
    if (!_483)
    {
        float _487 = in.m_67.w;
        float _489 = gl_FragCoord.w;
        float _491 = _487 * _489;
        float _493 = in.m_67.z;
        float _495 = gl_FragCoord.w;
        float _497 = _493 * _495;
        float _499 = _88 * _491;
        float _501 = _88 * _497;
        float _503 = 1.0 / _499;
        float _505 = _501 * _503;
        float _507 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _509 = fma(_505, (*spvDescriptorSet0.fp_c8)._m0[30].w, _507);
        float _511 = 1.0 / _509;
        float _513 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _515 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _517 = fma(_511, _513, _515);
        float _519 = _517 * 8.0;
        float _521 = precise::clamp(_519, 0.0, 1.0);
        float _523 = _397 * _521;
        _485 = _523;
    }
    float _525 = _485;
    float _527 = 0.0 + _525;
    float _529 = precise::clamp(_527, 0.0, 1.0);
    out.m_53.x = _473;
    out.m_53.y = _475;
    out.m_53.z = _477;
    out.m_53.w = _529;
    return out;
}

