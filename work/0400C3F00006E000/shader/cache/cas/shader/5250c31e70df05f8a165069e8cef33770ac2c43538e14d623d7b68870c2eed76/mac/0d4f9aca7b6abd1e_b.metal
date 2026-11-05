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
    texturecube<float> fp_t_tcb_1E [[id(9)]];
    sampler fp_t_tcb_1ESmplr [[id(10)]];
    sampler fp_t_tcb_8Smplr_w [[id(11)]];
    sampler fp_t_tcb_10Smplr_w [[id(12)]];
    sampler fp_t_tcb_ASmplr_w [[id(13)]];
    sampler fp_t_tcb_1ESmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_55 [[color(0)]];
};

struct main0_in
{
    float4 m_48 [[user(locn0)]];
    float4 m_50 [[user(locn1)]];
    float4 m_52 [[user(locn2)]];
    float4 m_63 [[user(locn3)]];
    float4 m_46 [[user(locn4), flat]];
    float4 m_42 [[user(locn5)]];
    float4 m_44 [[user(locn6)]];
    float4 m_57 [[user(locn7)]];
    float4 m_59 [[user(locn8)]];
    float4 m_61 [[user(locn9)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _70 = gl_FragCoord.w;
    float _72 = in.m_42.x;
    float _74 = gl_FragCoord.w;
    float _76 = _72 * _74;
    float _78 = in.m_42.y;
    float _80 = gl_FragCoord.w;
    float _82 = _78 * _80;
    float _84 = 1.0 / _70;
    float _86 = _84 * _76;
    float _88 = _84 * _82;
    float2 _581 = float2(_86, _88);
    float _90 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_581, float2(0.0), isnan(_581))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_581, float2(0.0), isnan(_581))).w;
    float _92 = in.m_44.w;
    float _94 = gl_FragCoord.w;
    float _96 = _92 * _94;
    float _98 = in.m_44.x;
    float _100 = gl_FragCoord.w;
    float _102 = _98 * _100;
    float _104 = in.m_44.y;
    float _106 = gl_FragCoord.w;
    float _108 = _104 * _106;
    float _110 = in.m_46.x;
    float _112 = in.m_42.z;
    float _114 = gl_FragCoord.w;
    float _116 = _112 * _114;
    float _118 = in.m_42.w;
    float _120 = gl_FragCoord.w;
    float _122 = _118 * _120;
    float _124 = _84 * _96;
    float _126 = _84 * _102;
    float _128 = _84 * _108;
    float _130 = _110 * 0.5;
    float _132 = 1.0 / _124;
    float _134 = _84 * _116;
    float _136 = _84 * _122;
    float _138 = _126 * _132;
    float _140 = _128 * _132;
    float _142 = fma(_90, _130, _134);
    float _144 = fma(_90, _130, _136);
    float2 _665 = float2(_138, _140);
    float _146 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_665, float2(0.0), isnan(_665))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_665, float2(0.0), isnan(_665))).x;
    float2 _673 = float2(_142, _144);
    float4 _149 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_673, float2(0.0), isnan(_673))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_673, float2(0.0), isnan(_673))).xyzw;
    float _151 = _149.x;
    float _153 = _149.y;
    float _155 = _149.z;
    float _157 = _149.w;
    float _159 = in.m_44.z;
    float _161 = gl_FragCoord.w;
    float _163 = _159 * _161;
    float _165 = in.m_48.w;
    float _167 = gl_FragCoord.w;
    float _169 = _165 * _167;
    float _171 = in.m_50.w;
    float _173 = gl_FragCoord.w;
    float _175 = _171 * _173;
    float _177 = in.m_52.x;
    float _179 = gl_FragCoord.w;
    float _181 = _177 * _179;
    float _183 = _84 * _163;
    float _185 = _183 * _132;
    float _187 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _189 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _191 = fma(_185, (*spvDescriptorSet0.fp_c8)._m0[30].w, _189);
    float _193 = 1.0 / _191;
    float _195 = _84 * _169;
    float _197 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _199 = fma(_146, (*spvDescriptorSet0.fp_c8)._m0[30].w, _197);
    float _201 = -_195;
    float _203 = _157 + _201;
    float _205 = _84 * _175;
    float _207 = 1.0 / _199;
    float _209 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _211 = _193 * _209;
    float _213 = _84 * _181;
    float _215 = _203 * _205;
    float _217 = 0.0 + _215;
    float _219 = precise::clamp(_217, 0.0, 1.0);
    float _221 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _223 = -_211;
    float _225 = fma(_207, _221, _223);
    float _227 = _225 * _187;
    float _229 = precise::clamp(_227, 0.0, 1.0);
    float _231 = _219 * _229;
    float _233 = _231 * _213;
    bool _237 = _233 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _239 = isnan(_233);
    bool _241 = _237 || _239;
    bool _243 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _245 = _241 || _243;
    float _247 = _211;
    float _249 = _233;
    if (!_245)
    {
        discard_fragment();
    }
    if (!_245)
    {
        out.m_55.x = 0.006000000052154064178466796875;
        out.m_55.y = 0.00200000009499490261077880859375;
        out.m_55.z = 0.001000000047497451305389404296875;
        out.m_55.w = _215;
        return out;
    }
    float _251 = in.m_57.y;
    float _253 = gl_FragCoord.w;
    float _255 = _251 * _253;
    float _257 = in.m_57.x;
    float _259 = gl_FragCoord.w;
    float _261 = _257 * _259;
    float _263 = in.m_57.z;
    float _265 = gl_FragCoord.w;
    float _267 = _263 * _265;
    float _269 = _84 * _255;
    float _271 = _84 * _261;
    float _273 = _84 * _267;
    float _275 = _269 * _269;
    float _277 = fma(_271, _271, _275);
    float _279 = fma(_273, _273, _277);
    float _281 = rsqrt(_279);
    float _283 = _271 * _281;
    float _285 = _269 * _281;
    float _287 = _273 * _281;
    float _289 = abs(_283);
    float _291 = abs(_285);
    float _293 = precise::max(_289, _291);
    float _295 = abs(_287);
    float _297 = precise::max(_295, _293);
    float _299 = 1.0 / _297;
    float _301 = -_299;
    float _303 = _287 * _301;
    float _305 = _283 * _299;
    float _307 = _285 * _299;
    float3 _909 = float3(_305, _307, _303);
    float3 _311 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_909, float3(0.0), isnan(_909)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_909, float3(0.0), isnan(_909)), level(0.0)).xyz;
    float _313 = _311.x;
    float _315 = _311.y;
    float _317 = _311.z;
    float _319 = in.m_50.y;
    float _321 = gl_FragCoord.w;
    float _323 = _319 * _321;
    float _325 = in.m_50.x;
    float _327 = gl_FragCoord.w;
    float _329 = _325 * _327;
    float _331 = in.m_48.y;
    float _333 = gl_FragCoord.w;
    float _335 = _331 * _333;
    float _337 = in.m_48.x;
    float _339 = gl_FragCoord.w;
    float _341 = _337 * _339;
    float _343 = in.m_50.z;
    float _345 = gl_FragCoord.w;
    float _347 = _343 * _345;
    float _349 = in.m_48.z;
    float _351 = gl_FragCoord.w;
    float _353 = _349 * _351;
    float _355 = _153 * _153;
    float _357 = _151 * _151;
    float _359 = _155 * _155;
    float _361 = in.m_59.y;
    float _363 = gl_FragCoord.w;
    float _365 = _361 * _363;
    float _367 = -_355;
    float _369 = _367 + 1.0;
    float _371 = -_357;
    float _373 = _371 + 1.0;
    float _375 = -_359;
    float _377 = _375 + 1.0;
    float _379 = in.m_59.z;
    float _381 = gl_FragCoord.w;
    float _383 = _379 * _381;
    float _385 = in.m_61.x;
    float _387 = gl_FragCoord.w;
    float _389 = _385 * _387;
    float _391 = in.m_61.y;
    float _393 = gl_FragCoord.w;
    float _395 = _391 * _393;
    float _397 = in.m_61.z;
    float _399 = gl_FragCoord.w;
    float _401 = _397 * _399;
    float _403 = in.m_61.w;
    float _405 = gl_FragCoord.w;
    float _407 = _403 * _405;
    float _409 = _84 * _323;
    float _411 = _409 * _369;
    float _413 = _84 * _329;
    float _415 = _84 * _335;
    float _417 = _84 * _347;
    float _419 = in.m_63.z;
    float _421 = gl_FragCoord.w;
    float _423 = _419 * _421;
    float _425 = _413 * _373;
    float _427 = _84 * _341;
    float _429 = fma(_355, _415, _411);
    float _431 = _417 * _377;
    float _433 = _84 * _353;
    float _435 = fma(_357, _427, _425);
    float _437 = _429 * 0.715200006961822509765625;
    float _439 = in.m_63.x;
    float _441 = gl_FragCoord.w;
    float _443 = _439 * _441;
    float _445 = fma(_359, _433, _431);
    float _447 = in.m_63.y;
    float _449 = gl_FragCoord.w;
    float _451 = _447 * _449;
    float _453 = fma(_435, 0.2125999927520751953125, _437);
    float _455 = in.m_59.x;
    float _457 = gl_FragCoord.w;
    float _459 = _455 * _457;
    float _461 = fma(_445, 0.072200000286102294921875, _453);
    bool _463 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _465 = 1.0 / _461;
    if (_463)
    {
        float _467 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _469 = _211 + _467;
        _247 = _469;
    }
    float _471 = _247;
    float _473 = _465 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _475 = precise::clamp(_473, 0.0, 1.0);
    float _477 = _84 * _395;
    float _479 = fma(_475, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _481 = _84 * _443;
    float _483 = _435 * _479;
    float _485 = _84 * _423;
    float _487 = _429 * _479;
    float _489 = _445 * _479;
    float _491 = _84 * _459;
    float _493 = _84 * _383;
    float _495 = _84 * _389;
    float _497 = fma(_313, 0.20999999344348907470703125, _481);
    float _499 = _84 * _451;
    float _501 = _84 * _365;
    float _503 = fma(_317, 0.20999999344348907470703125, _485);
    float _505 = _497 + _491;
    float _507 = fma(_315, 0.20999999344348907470703125, _499);
    float _509 = 0.0 + _233;
    float _511 = precise::clamp(_509, 0.0, 1.0);
    float _513 = _503 + _493;
    float _515 = _511;
    if (_463)
    {
        float _517 = _471 * 8.0;
        float _519 = precise::clamp(_517, 0.0, 1.0);
        _249 = _519;
    }
    float _521 = _249;
    float _523 = _507 + _501;
    float _525 = _84 * _401;
    float _527 = _84 * _407;
    float _529 = fma(_505, 0.006000000052154064178466796875, _483);
    float _531 = fma(_523, 0.00200000009499490261077880859375, _487);
    float _533 = fma(_513, 0.001000000047497451305389404296875, _489);
    if (_463)
    {
        float _535 = _511 * _521;
        _515 = _535;
    }
    float _537 = _515;
    float _539 = fma(_529, _527, _495);
    float _541 = fma(_531, _527, _477);
    float _543 = fma(_533, _527, _525);
    float _545 = 0.0 + _537;
    float _547 = precise::clamp(_545, 0.0, 1.0);
    out.m_55.x = _539;
    out.m_55.y = _541;
    out.m_55.z = _543;
    out.m_55.w = _547;
    return out;
}

