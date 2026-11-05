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
    texture2d<float> fp_t_tcb_C [[id(7)]];
    sampler fp_t_tcb_CSmplr [[id(8)]];
    texturecube<float> fp_t_tcb_1E [[id(9)]];
    sampler fp_t_tcb_1ESmplr [[id(10)]];
    sampler fp_t_tcb_8Smplr_w [[id(11)]];
    sampler fp_t_tcb_ASmplr_w [[id(12)]];
    sampler fp_t_tcb_CSmplr_w [[id(13)]];
    sampler fp_t_tcb_1ESmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_53 [[color(0)]];
};

struct main0_in
{
    float4 m_46 [[user(locn0)]];
    float4 m_48 [[user(locn1)]];
    float4 m_42 [[user(locn2)]];
    float4 m_65 [[user(locn3)]];
    float4 m_59 [[user(locn4)]];
    float4 m_50 [[user(locn5)]];
    float4 m_44 [[user(locn6)]];
    float4 m_55 [[user(locn7)]];
    float4 m_61 [[user(locn8)]];
    float4 m_57 [[user(locn9)]];
    float4 m_63 [[user(locn10)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _72 = gl_FragCoord.w;
    float _74 = in.m_42.x;
    float _76 = gl_FragCoord.w;
    float _78 = _74 * _76;
    float _80 = in.m_42.y;
    float _82 = gl_FragCoord.w;
    float _84 = _80 * _82;
    float _86 = in.m_42.z;
    float _88 = gl_FragCoord.w;
    float _90 = _86 * _88;
    float _92 = in.m_42.w;
    float _94 = gl_FragCoord.w;
    float _96 = _92 * _94;
    float _98 = in.m_44.x;
    float _100 = gl_FragCoord.w;
    float _102 = _98 * _100;
    float _104 = in.m_44.y;
    float _106 = gl_FragCoord.w;
    float _108 = _104 * _106;
    float _110 = 1.0 / _72;
    float _112 = _110 * _78;
    float _114 = _110 * _84;
    float _116 = _110 * _90;
    float _118 = _110 * _96;
    float _120 = _110 * _102;
    float _122 = _110 * _108;
    float2 _628 = float2(_112, _114);
    float4 _125 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_628, float2(0.0), isnan(_628))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_628, float2(0.0), isnan(_628))).xyzw;
    float _127 = _125.x;
    float _129 = _125.y;
    float _131 = _125.z;
    float _133 = _125.w;
    float2 _647 = float2(_116, _118);
    float4 _135 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_647, float2(0.0), isnan(_647))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_647, float2(0.0), isnan(_647))).xyzw;
    float _137 = _135.x;
    float _139 = _135.y;
    float _141 = _135.z;
    float _143 = _135.w;
    float2 _663 = float2(_120, _122);
    float _145 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_663, float2(0.0), isnan(_663))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_663, float2(0.0), isnan(_663))).w;
    float _147 = in.m_46.w;
    float _149 = gl_FragCoord.w;
    float _151 = _147 * _149;
    float _153 = in.m_48.w;
    float _155 = gl_FragCoord.w;
    float _157 = _153 * _155;
    float _159 = in.m_50.x;
    float _161 = gl_FragCoord.w;
    float _163 = _159 * _161;
    float _165 = _110 * _151;
    float _167 = _110 * _157;
    float _169 = _110 * _163;
    float _171 = in.m_48.y;
    float _173 = gl_FragCoord.w;
    float _175 = _171 * _173;
    float _177 = in.m_48.z;
    float _179 = gl_FragCoord.w;
    float _181 = _177 * _179;
    float _183 = in.m_46.y;
    float _185 = gl_FragCoord.w;
    float _187 = _183 * _185;
    float _189 = in.m_46.x;
    float _191 = gl_FragCoord.w;
    float _193 = _189 * _191;
    float _195 = in.m_46.z;
    float _197 = gl_FragCoord.w;
    float _199 = _195 * _197;
    float _201 = _133 + _143;
    float _203 = fma(_145, (*spvDescriptorSet0.fp_c9)._m0[194].w, _201);
    float _205 = precise::clamp(_203, 0.0, 1.0);
    float _207 = -_165;
    float _209 = _207 + _205;
    float _211 = _167 * _209;
    float _213 = precise::clamp(_211, 0.0, 1.0);
    float _215 = _213 * _169;
    bool _219 = _215 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _221 = isnan(_215);
    bool _223 = _219 || _221;
    bool _225 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _227 = _223 || _225;
    float _229 = in.m_48.x;
    float _231 = gl_FragCoord.w;
    float _233 = _229 * _231;
    if (!_227)
    {
        discard_fragment();
    }
    float _235 = _137 * _137;
    float _237 = _139 * _139;
    float _239 = _141 * _141;
    float _241 = _110 * _187;
    float _243 = fma(_127, _127, _235);
    float _245 = precise::clamp(_243, 0.0, 1.0);
    float _247 = fma(_129, _129, _237);
    float _249 = precise::clamp(_247, 0.0, 1.0);
    float _251 = fma(_131, _131, _239);
    float _253 = precise::clamp(_251, 0.0, 1.0);
    float _255 = _110 * _181;
    float _257 = -_245;
    float _259 = _257 + 1.0;
    float _261 = -_249;
    float _263 = _261 + 1.0;
    float _265 = -_253;
    float _267 = _265 + 1.0;
    float _269 = _255 * _267;
    float _271 = _110 * _233;
    float _273 = _110 * _175;
    float _275 = _110 * _199;
    float _277 = _271 * _259;
    float _279 = _273 * _263;
    float _281 = _110 * _193;
    float _283 = fma(_249, _241, _279);
    float _285 = fma(_245, _281, _277);
    float _287 = fma(_253, _275, _269);
    if (!_227)
    {
        out.m_53.x = _285;
        out.m_53.y = _283;
        out.m_53.z = _287;
        out.m_53.w = _213;
        return out;
    }
    float _289 = in.m_55.y;
    float _291 = gl_FragCoord.w;
    float _293 = _289 * _291;
    float _295 = in.m_55.x;
    float _297 = gl_FragCoord.w;
    float _299 = _295 * _297;
    float _301 = in.m_55.z;
    float _303 = gl_FragCoord.w;
    float _305 = _301 * _303;
    float _307 = in.m_57.x;
    float _309 = gl_FragCoord.w;
    float _311 = _307 * _309;
    float _313 = _110 * _293;
    float _315 = _110 * _299;
    float _317 = _110 * _305;
    float _319 = _110 * _311;
    float _321 = _313 * _313;
    float _323 = fma(_315, _315, _321);
    float _325 = fma(_317, _317, _323);
    float _327 = rsqrt(_325);
    float _329 = _315 * _327;
    float _331 = _313 * _327;
    float _333 = _317 * _327;
    float _335 = abs(_329);
    float _337 = abs(_331);
    float _339 = precise::max(_335, _337);
    float _341 = abs(_333);
    float _343 = precise::max(_341, _339);
    float _345 = 1.0 / _343;
    float _347 = _331 * _345;
    float _349 = -_345;
    float _351 = _333 * _349;
    float _353 = precise::min(_319, 1.0);
    float _355 = _329 * _345;
    float3 _970 = float3(_355, _347, _351);
    float3 _359 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_970, float3(0.0), isnan(_970)), level(_353)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_970, float3(0.0), isnan(_970)), level(_353)).xyz;
    float _361 = _359.x;
    float _363 = _359.y;
    float _365 = _359.z;
    float _367 = _241 * (*spvDescriptorSet0.fp_c9)._m0[194].z;
    float _369 = _275 * (*spvDescriptorSet0.fp_c9)._m0[194].z;
    float _371 = _281 * (*spvDescriptorSet0.fp_c9)._m0[194].z;
    float _373 = in.m_59.x;
    float _375 = gl_FragCoord.w;
    float _377 = _373 * _375;
    float _379 = _367 * 0.715200006961822509765625;
    float _381 = in.m_59.y;
    float _383 = gl_FragCoord.w;
    float _385 = _381 * _383;
    float _387 = in.m_59.z;
    float _389 = gl_FragCoord.w;
    float _391 = _387 * _389;
    float _393 = in.m_61.z;
    float _395 = gl_FragCoord.w;
    float _397 = _393 * _395;
    float _399 = fma(_371, 0.2125999927520751953125, _379);
    float _401 = in.m_61.x;
    float _403 = gl_FragCoord.w;
    float _405 = _401 * _403;
    float _407 = in.m_61.y;
    float _409 = gl_FragCoord.w;
    float _411 = _407 * _409;
    float _413 = in.m_63.x;
    float _415 = gl_FragCoord.w;
    float _417 = _413 * _415;
    float _419 = fma(_369, 0.072200000286102294921875, _399);
    float _421 = in.m_63.w;
    float _423 = gl_FragCoord.w;
    float _425 = _421 * _423;
    float _427 = in.m_63.y;
    float _429 = gl_FragCoord.w;
    float _431 = _427 * _429;
    float _433 = in.m_63.z;
    float _435 = gl_FragCoord.w;
    float _437 = _433 * _435;
    float _439 = 1.0 / _419;
    float _441 = 0.0 + _215;
    float _443 = precise::clamp(_441, 0.0, 1.0);
    float _445 = _439 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _447 = precise::clamp(_445, 0.0, 1.0);
    float _449 = fma(_447, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _451 = _110 * _377;
    float _453 = _110 * _385;
    float _455 = _110 * _391;
    float _457 = _367 * _449;
    float _459 = _371 * _449;
    float _461 = _110 * _405;
    float _463 = _369 * _449;
    bool _465 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _467 = _110 * _425;
    float _469 = _110 * _431;
    float _471 = fma(_365, 0.20999999344348907470703125, _455);
    float _473 = _110 * _397;
    float _475 = fma(_361, 0.20999999344348907470703125, _451);
    float _477 = fma(_363, 0.20999999344348907470703125, _453);
    float _479 = _110 * _411;
    float _481 = _471 + _473;
    float _483 = _475 + _461;
    float _485 = _477 + _479;
    float _487 = fma(_287, _481, _463);
    float _489 = fma(_285, _483, _459);
    float _491 = _110 * _417;
    float _493 = fma(_283, _485, _457);
    float _495 = _110 * _437;
    float _497 = fma(_489, _467, _491);
    float _499 = fma(_493, _467, _469);
    float _501 = fma(_487, _467, _495);
    float _503 = _491;
    if (!_465)
    {
        _503 = _443;
    }
    float _505 = _503;
    bool _507 = !_465;
    float _509 = _505;
    if (!_507)
    {
        float _511 = in.m_65.w;
        float _513 = gl_FragCoord.w;
        float _515 = _511 * _513;
        float _517 = in.m_65.z;
        float _519 = gl_FragCoord.w;
        float _521 = _517 * _519;
        float _523 = _110 * _515;
        float _525 = _110 * _521;
        float _527 = 1.0 / _523;
        float _529 = _525 * _527;
        float _531 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _533 = fma(_529, (*spvDescriptorSet0.fp_c8)._m0[30].w, _531);
        float _535 = 1.0 / _533;
        float _537 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _539 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _541 = fma(_535, _537, _539);
        float _543 = _541 * 8.0;
        float _545 = precise::clamp(_543, 0.0, 1.0);
        float _547 = _443 * _545;
        _509 = _547;
    }
    float _549 = _509;
    float _551 = 0.0 + _549;
    float _553 = precise::clamp(_551, 0.0, 1.0);
    out.m_53.x = _497;
    out.m_53.y = _499;
    out.m_53.z = _501;
    out.m_53.w = _553;
    return out;
}

