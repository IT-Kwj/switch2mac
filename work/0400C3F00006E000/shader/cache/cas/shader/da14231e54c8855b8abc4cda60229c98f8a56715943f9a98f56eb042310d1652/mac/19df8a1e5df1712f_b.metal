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
    texture2d<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_C [[id(7)]];
    sampler fp_t_tcb_CSmplr [[id(8)]];
    texturecube<float> fp_t_tcb_1E [[id(9)]];
    sampler fp_t_tcb_1ESmplr [[id(10)]];
    sampler fp_t_tcb_ASmplr_w [[id(11)]];
    sampler fp_t_tcb_8Smplr_w [[id(12)]];
    sampler fp_t_tcb_CSmplr_w [[id(13)]];
    sampler fp_t_tcb_1ESmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_55 [[color(0)]];
};

struct main0_in
{
    float4 m_46 [[user(locn0)]];
    float4 m_48 [[user(locn1)]];
    float4 m_50 [[user(locn2)]];
    float4 m_59 [[user(locn3)]];
    float4 m_44 [[user(locn4)]];
    float4 m_42 [[user(locn5)]];
    float4 m_65 [[user(locn6)]];
    float4 m_52 [[user(locn7)]];
    float4 m_57 [[user(locn8)]];
    float4 m_61 [[user(locn9)]];
    float4 m_63 [[user(locn10)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _72 = gl_FragCoord.w;
    float _74 = in.m_42.z;
    float _76 = gl_FragCoord.w;
    float _78 = _74 * _76;
    float _80 = in.m_42.w;
    float _82 = gl_FragCoord.w;
    float _84 = _80 * _82;
    float _86 = in.m_42.x;
    float _88 = gl_FragCoord.w;
    float _90 = _86 * _88;
    float _92 = in.m_42.y;
    float _94 = gl_FragCoord.w;
    float _96 = _92 * _94;
    float _98 = 1.0 / _72;
    float _100 = _98 * _78;
    float _102 = _98 * _84;
    float _104 = _98 * _90;
    float _106 = _98 * _96;
    float2 _604 = float2(_100, _102);
    float4 _109 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_604, float2(0.0), isnan(_604))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_604, float2(0.0), isnan(_604))).xyzw;
    float _111 = _109.x;
    float _113 = _109.y;
    float _115 = _109.z;
    float _117 = _109.w;
    float2 _623 = float2(_104, _106);
    float4 _119 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_623, float2(0.0), isnan(_623))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_623, float2(0.0), isnan(_623))).xyzw;
    float _121 = _119.x;
    float _123 = _119.y;
    float _125 = _119.z;
    float _127 = _119.w;
    float _129 = in.m_44.w;
    float _131 = gl_FragCoord.w;
    float _133 = _129 * _131;
    float _135 = in.m_46.w;
    float _137 = gl_FragCoord.w;
    float _139 = _135 * _137;
    float _141 = in.m_48.w;
    float _143 = gl_FragCoord.w;
    float _145 = _141 * _143;
    float _147 = in.m_50.x;
    float _149 = gl_FragCoord.w;
    float _151 = _147 * _149;
    float _153 = _98 * _133;
    float _155 = _117 + (-1.0);
    float _157 = _98 * _145;
    float _159 = _127 + _155;
    float _161 = _159 * _153;
    float _163 = _98 * _139;
    float _165 = _163 * _161;
    float _167 = _157 * _165;
    float _169 = _98 * _151;
    float _171 = 0.0 + _167;
    float _173 = precise::clamp(_171, 0.0, 1.0);
    float _175 = _173 * _169;
    bool _179 = _175 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _181 = isnan(_175);
    bool _183 = _179 || _181;
    bool _185 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _187 = _183 || _185;
    float _189 = in.m_52.x;
    float _191 = gl_FragCoord.w;
    float _193 = _189 * _191;
    float _195 = in.m_52.y;
    float _197 = gl_FragCoord.w;
    float _199 = _195 * _197;
    if (!_187)
    {
        discard_fragment();
    }
    float _201 = _98 * _193;
    float _203 = _98 * _199;
    float2 _743 = float2(_201, _203);
    float3 _207 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_743, float2(0.0), isnan(_743))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_743, float2(0.0), isnan(_743))).xyz;
    float _209 = _207.x;
    float _211 = _207.y;
    float _213 = _207.z;
    float _215 = in.m_46.x;
    float _217 = gl_FragCoord.w;
    float _219 = _215 * _217;
    float _221 = in.m_48.x;
    float _223 = gl_FragCoord.w;
    float _225 = _221 * _223;
    float _227 = in.m_46.y;
    float _229 = gl_FragCoord.w;
    float _231 = _227 * _229;
    float _233 = in.m_48.y;
    float _235 = gl_FragCoord.w;
    float _237 = _233 * _235;
    float _239 = in.m_46.z;
    float _241 = gl_FragCoord.w;
    float _243 = _239 * _241;
    float _245 = in.m_48.z;
    float _247 = gl_FragCoord.w;
    float _249 = _245 * _247;
    float _251 = in.m_44.x;
    float _253 = gl_FragCoord.w;
    float _255 = _251 * _253;
    float _257 = in.m_44.y;
    float _259 = gl_FragCoord.w;
    float _261 = _257 * _259;
    float _263 = in.m_44.z;
    float _265 = gl_FragCoord.w;
    float _267 = _263 * _265;
    float _269 = _121 * _111;
    float _271 = _123 * _113;
    float _273 = _125 * _115;
    float _275 = _98 * _225;
    float _277 = _98 * _231;
    float _279 = _98 * _237;
    float _281 = _98 * _243;
    float _283 = _98 * _255;
    float _285 = -_279;
    float _287 = _277 + _285;
    float _289 = _98 * _267;
    float _291 = _271 * _211;
    float _293 = _269 * _209;
    float _295 = _98 * _219;
    float _297 = _98 * _249;
    float _299 = _273 * _213;
    float _301 = fma(_291, _287, _279);
    float _303 = -_275;
    float _305 = _295 + _303;
    float _307 = -_297;
    float _309 = _281 + _307;
    float _311 = fma(_293, _305, _275);
    float _313 = fma(_299, _309, _297);
    float _315 = _98 * _261;
    float _317 = _311 * _283;
    float _319 = _313 * _289;
    float _321 = _301 * _315;
    if (!_187)
    {
        out.m_55.x = _317;
        out.m_55.y = _321;
        out.m_55.z = _319;
        out.m_55.w = _167;
        return out;
    }
    float _323 = in.m_57.y;
    float _325 = gl_FragCoord.w;
    float _327 = _323 * _325;
    float _329 = in.m_57.x;
    float _331 = gl_FragCoord.w;
    float _333 = _329 * _331;
    float _335 = in.m_57.z;
    float _337 = gl_FragCoord.w;
    float _339 = _335 * _337;
    float _341 = _98 * _327;
    float _343 = _98 * _333;
    float _345 = _98 * _339;
    float _347 = _341 * _341;
    float _349 = fma(_343, _343, _347);
    float _351 = fma(_345, _345, _349);
    float _353 = rsqrt(_351);
    float _355 = _343 * _353;
    float _357 = _341 * _353;
    float _359 = _345 * _353;
    float _361 = abs(_355);
    float _363 = abs(_357);
    float _365 = precise::max(_361, _363);
    float _367 = abs(_359);
    float _369 = precise::max(_367, _365);
    float _371 = 1.0 / _369;
    float _373 = -_371;
    float _375 = _359 * _373;
    float _377 = _355 * _371;
    float _379 = _357 * _371;
    float3 _992 = float3(_377, _379, _375);
    float3 _381 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_992, float3(0.0), isnan(_992)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_992, float3(0.0), isnan(_992)), level(0.0)).xyz;
    float _383 = _381.x;
    float _385 = _381.y;
    float _387 = _381.z;
    float _389 = in.m_59.y;
    float _391 = gl_FragCoord.w;
    float _393 = _389 * _391;
    float _395 = in.m_59.z;
    float _397 = gl_FragCoord.w;
    float _399 = _395 * _397;
    float _401 = in.m_59.x;
    float _403 = gl_FragCoord.w;
    float _405 = _401 * _403;
    float _407 = in.m_61.y;
    float _409 = gl_FragCoord.w;
    float _411 = _407 * _409;
    float _413 = in.m_61.z;
    float _415 = gl_FragCoord.w;
    float _417 = _413 * _415;
    float _419 = in.m_61.x;
    float _421 = gl_FragCoord.w;
    float _423 = _419 * _421;
    float _425 = in.m_63.x;
    float _427 = gl_FragCoord.w;
    float _429 = _425 * _427;
    float _431 = in.m_63.w;
    float _433 = gl_FragCoord.w;
    float _435 = _431 * _433;
    float _437 = in.m_63.y;
    float _439 = gl_FragCoord.w;
    float _441 = _437 * _439;
    float _443 = in.m_63.z;
    float _445 = gl_FragCoord.w;
    float _447 = _443 * _445;
    float _449 = _98 * _393;
    float _451 = _98 * _399;
    float _453 = _98 * _405;
    bool _455 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _457 = fma(_385, 0.20999999344348907470703125, _449);
    float _459 = fma(_387, 0.20999999344348907470703125, _451);
    float _461 = fma(_383, 0.20999999344348907470703125, _453);
    float _463 = _98 * _411;
    float _465 = _98 * _417;
    float _467 = _98 * _423;
    float _469 = _457 + _463;
    float _471 = _459 + _465;
    float _473 = _461 + _467;
    float _475 = _98 * _435;
    float _477 = _321 * _469;
    float _479 = _319 * _471;
    float _481 = _317 * _473;
    float _483 = 0.0 + _175;
    float _485 = precise::clamp(_483, 0.0, 1.0);
    float _487 = _98 * _429;
    float _489 = _98 * _441;
    float _491 = _98 * _447;
    float _493 = fma(_481, _475, _487);
    float _495 = fma(_477, _475, _489);
    float _497 = fma(_479, _475, _491);
    float _499 = _487;
    if (!_455)
    {
        _499 = _485;
    }
    float _501 = _499;
    bool _503 = !_455;
    float _505 = _501;
    if (!_503)
    {
        float _507 = in.m_65.w;
        float _509 = gl_FragCoord.w;
        float _511 = _507 * _509;
        float _513 = in.m_65.z;
        float _515 = gl_FragCoord.w;
        float _517 = _513 * _515;
        float _519 = _98 * _511;
        float _521 = _98 * _517;
        float _523 = 1.0 / _519;
        float _525 = _521 * _523;
        float _527 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _529 = fma(_525, (*spvDescriptorSet0.fp_c8)._m0[30].w, _527);
        float _531 = 1.0 / _529;
        float _533 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _535 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _537 = fma(_531, _533, _535);
        float _539 = _537 * 8.0;
        float _541 = precise::clamp(_539, 0.0, 1.0);
        float _543 = _485 * _541;
        _505 = _543;
    }
    float _545 = _505;
    float _547 = 0.0 + _545;
    float _549 = precise::clamp(_547, 0.0, 1.0);
    out.m_55.x = _493;
    out.m_55.y = _495;
    out.m_55.z = _497;
    out.m_55.w = _549;
    return out;
}

