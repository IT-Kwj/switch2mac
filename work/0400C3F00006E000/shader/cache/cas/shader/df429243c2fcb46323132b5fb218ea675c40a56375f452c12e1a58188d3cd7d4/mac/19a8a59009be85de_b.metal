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
    texture2d<float> fp_t_tcb_10 [[id(3)]];
    sampler fp_t_tcb_10Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_A [[id(7)]];
    sampler fp_t_tcb_ASmplr [[id(8)]];
    texture2d<float> fp_t_tcb_C [[id(9)]];
    sampler fp_t_tcb_CSmplr [[id(10)]];
    texturecube<float> fp_t_tcb_1E [[id(11)]];
    sampler fp_t_tcb_1ESmplr [[id(12)]];
    sampler fp_t_tcb_10Smplr_w [[id(13)]];
    sampler fp_t_tcb_8Smplr_w [[id(14)]];
    sampler fp_t_tcb_ASmplr_w [[id(15)]];
    sampler fp_t_tcb_CSmplr_w [[id(16)]];
    sampler fp_t_tcb_1ESmplr_w [[id(17)]];
    constant dm_border_t* dm_border [[id(18)]];
};

struct main0_out
{
    float4 m_57 [[color(0)]];
};

struct main0_in
{
    float4 m_50 [[user(locn0)]];
    float4 m_52 [[user(locn1)]];
    float4 m_46 [[user(locn2)]];
    float4 m_44 [[user(locn3)]];
    float4 m_63 [[user(locn4)]];
    float4 m_54 [[user(locn5)]];
    float4 m_48 [[user(locn6)]];
    float4 m_59 [[user(locn7)]];
    float4 m_65 [[user(locn8)]];
    float4 m_61 [[user(locn9)]];
    float4 m_67 [[user(locn10)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _74 = gl_FragCoord.w;
    float _76 = in.m_44.w;
    float _78 = gl_FragCoord.w;
    float _80 = _76 * _78;
    float _82 = in.m_46.x;
    float _84 = gl_FragCoord.w;
    float _86 = _82 * _84;
    float _88 = in.m_44.x;
    float _90 = gl_FragCoord.w;
    float _92 = _88 * _90;
    float _94 = in.m_44.y;
    float _96 = gl_FragCoord.w;
    float _98 = _94 * _96;
    float _100 = in.m_46.y;
    float _102 = gl_FragCoord.w;
    float _104 = _100 * _102;
    float _106 = in.m_46.z;
    float _108 = gl_FragCoord.w;
    float _110 = _106 * _108;
    float _112 = in.m_46.w;
    float _114 = gl_FragCoord.w;
    float _116 = _112 * _114;
    float _118 = in.m_48.x;
    float _120 = gl_FragCoord.w;
    float _122 = _118 * _120;
    float _124 = in.m_48.y;
    float _126 = gl_FragCoord.w;
    float _128 = _124 * _126;
    float _130 = 1.0 / _74;
    float _132 = _130 * _80;
    float _134 = _130 * _86;
    float _136 = _130 * _92;
    float _138 = _130 * _98;
    float _140 = 1.0 / _132;
    float _142 = _130 * _104;
    float _144 = _130 * _110;
    float _146 = _130 * _116;
    float _148 = _130 * _122;
    float _150 = _130 * _128;
    float _152 = _136 * _140;
    float _154 = _138 * _140;
    float2 _698 = float2(_152, _154);
    float _156 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_698, float2(0.0), isnan(_698))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_698, float2(0.0), isnan(_698))).x;
    float2 _709 = float2(_134, _142);
    float4 _159 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_709, float2(0.0), isnan(_709))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_709, float2(0.0), isnan(_709))).xyzw;
    float _161 = _159.x;
    float _163 = _159.y;
    float _165 = _159.z;
    float _167 = _159.w;
    float2 _725 = float2(_144, _146);
    float4 _169 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_725, float2(0.0), isnan(_725))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_725, float2(0.0), isnan(_725))).xyzw;
    float _171 = _169.x;
    float _173 = _169.y;
    float _175 = _169.z;
    float _177 = _169.w;
    float2 _741 = float2(_148, _150);
    float4 _179 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_741, float2(0.0), isnan(_741))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_741, float2(0.0), isnan(_741))).xyzw;
    float _181 = _179.x;
    float _183 = _179.y;
    float _185 = _179.z;
    float _187 = _179.w;
    float _189 = in.m_44.z;
    float _191 = gl_FragCoord.w;
    float _193 = _189 * _191;
    float _195 = in.m_50.w;
    float _197 = gl_FragCoord.w;
    float _199 = _195 * _197;
    float _201 = in.m_52.w;
    float _203 = gl_FragCoord.w;
    float _205 = _201 * _203;
    float _207 = in.m_54.x;
    float _209 = gl_FragCoord.w;
    float _211 = _207 * _209;
    float _213 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _215 = _130 * _193;
    float _217 = _215 * _140;
    float _219 = _130 * _199;
    float _221 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _223 = fma(_217, (*spvDescriptorSet0.fp_c8)._m0[30].w, _221);
    float _225 = 1.0 / _223;
    float _227 = in.m_50.y;
    float _229 = gl_FragCoord.w;
    float _231 = _227 * _229;
    float _233 = in.m_52.z;
    float _235 = gl_FragCoord.w;
    float _237 = _233 * _235;
    float _239 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _241 = fma(_156, (*spvDescriptorSet0.fp_c8)._m0[30].w, _239);
    float _243 = _167 * _177;
    float _245 = _130 * _211;
    float _247 = 1.0 / _241;
    float _249 = -_219;
    float _251 = fma(_243, _187, _249);
    float _253 = _130 * _205;
    float _255 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _257 = _225 * _255;
    float _259 = _251 * 4.0;
    float _261 = precise::clamp(_259, 0.0, 1.0);
    float _263 = _253 * _261;
    float _265 = 0.0 + _263;
    float _267 = precise::clamp(_265, 0.0, 1.0);
    float _269 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _271 = -_257;
    float _273 = fma(_247, _269, _271);
    float _275 = _273 * _213;
    float _277 = precise::clamp(_275, 0.0, 1.0);
    float _279 = _267 * _277;
    float _281 = _279 * _245;
    bool _285 = _281 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _287 = isnan(_281);
    bool _289 = _285 || _287;
    bool _291 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _293 = _289 || _291;
    float _295 = in.m_50.x;
    float _297 = gl_FragCoord.w;
    float _299 = _295 * _297;
    float _301 = in.m_52.x;
    float _303 = gl_FragCoord.w;
    float _305 = _301 * _303;
    float _307 = in.m_52.y;
    float _309 = gl_FragCoord.w;
    float _311 = _307 * _309;
    float _313 = in.m_50.z;
    float _315 = gl_FragCoord.w;
    float _317 = _313 * _315;
    if (!_293)
    {
        discard_fragment();
    }
    float _319 = _163 * _163;
    float _321 = _173 * _173;
    float _323 = _161 * _161;
    float _325 = _171 * _171;
    float _327 = _165 * _165;
    float _329 = _319 * _321;
    float _331 = _175 * _175;
    float _333 = _323 * _325;
    float _335 = _130 * _237;
    float _337 = _329 * _183;
    float _339 = _327 * _331;
    float _341 = _333 * _181;
    float _343 = _130 * _231;
    float _345 = _339 * _185;
    float _347 = _130 * _299;
    float _349 = _130 * _305;
    float _351 = _130 * _311;
    float _353 = _130 * _317;
    float _355 = -_349;
    float _357 = _347 + _355;
    float _359 = -_351;
    float _361 = _343 + _359;
    float _363 = -_335;
    float _365 = _353 + _363;
    float _367 = fma(_341, _357, _349);
    float _369 = fma(_337, _361, _351);
    float _371 = fma(_345, _365, _335);
    if (!_293)
    {
        out.m_57.x = _367;
        out.m_57.y = _369;
        out.m_57.z = _371;
        out.m_57.w = _263;
        return out;
    }
    float _373 = in.m_59.y;
    float _375 = gl_FragCoord.w;
    float _377 = _373 * _375;
    float _379 = in.m_59.x;
    float _381 = gl_FragCoord.w;
    float _383 = _379 * _381;
    float _385 = in.m_59.z;
    float _387 = gl_FragCoord.w;
    float _389 = _385 * _387;
    float _391 = _130 * _377;
    float _393 = _130 * _383;
    float _395 = _130 * _389;
    float _397 = _391 * _391;
    float _399 = in.m_61.x;
    float _401 = gl_FragCoord.w;
    float _403 = _399 * _401;
    float _405 = fma(_393, _393, _397);
    float _407 = fma(_395, _395, _405);
    float _409 = rsqrt(_407);
    float _411 = _393 * _409;
    float _413 = _391 * _409;
    float _415 = _395 * _409;
    float _417 = _130 * _403;
    float _419 = abs(_411);
    float _421 = abs(_413);
    float _423 = precise::max(_419, _421);
    float _425 = abs(_415);
    float _427 = precise::max(_425, _423);
    float _429 = 1.0 / _427;
    float _431 = _411 * _429;
    float _433 = _413 * _429;
    float _435 = -_429;
    float _437 = _415 * _435;
    float _439 = precise::min(_417, 1.0);
    float3 _1120 = float3(_431, _433, _437);
    float3 _443 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1120, float3(0.0), isnan(_1120)), level(_439)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1120, float3(0.0), isnan(_1120)), level(_439)).xyz;
    float _445 = _443.x;
    float _447 = _443.y;
    float _449 = _443.z;
    float _451 = in.m_63.z;
    float _453 = gl_FragCoord.w;
    float _455 = _451 * _453;
    float _457 = in.m_63.x;
    float _459 = gl_FragCoord.w;
    float _461 = _457 * _459;
    float _463 = in.m_63.y;
    float _465 = gl_FragCoord.w;
    float _467 = _463 * _465;
    float _469 = in.m_65.z;
    float _471 = gl_FragCoord.w;
    float _473 = _469 * _471;
    float _475 = in.m_65.x;
    float _477 = gl_FragCoord.w;
    float _479 = _475 * _477;
    float _481 = in.m_65.y;
    float _483 = gl_FragCoord.w;
    float _485 = _481 * _483;
    float _487 = in.m_67.x;
    float _489 = gl_FragCoord.w;
    float _491 = _487 * _489;
    float _493 = in.m_67.y;
    float _495 = gl_FragCoord.w;
    float _497 = _493 * _495;
    float _499 = in.m_67.z;
    float _501 = gl_FragCoord.w;
    float _503 = _499 * _501;
    float _505 = in.m_67.w;
    float _507 = gl_FragCoord.w;
    float _509 = _505 * _507;
    bool _511 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _513 = _130 * _455;
    float _515 = _130 * _461;
    float _517 = _130 * _467;
    float _519 = _130 * _473;
    float _521 = _130 * _479;
    float _523 = _130 * _485;
    float _525 = _130 * _497;
    float _527 = _130 * _503;
    float _529 = fma(_449, 0.20999999344348907470703125, _513);
    float _531 = fma(_445, 0.20999999344348907470703125, _515);
    float _533 = fma(_447, 0.20999999344348907470703125, _517);
    float _535 = _513;
    if (_511)
    {
        float _537 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _539 = _257 + _537;
        _535 = _539;
    }
    float _541 = _535;
    float _543 = _529 + _519;
    float _545 = _531 + _521;
    float _547 = _533 + _523;
    float _549 = 0.0 + _281;
    float _551 = precise::clamp(_549, 0.0, 1.0);
    float _553 = _541;
    float _555 = _551;
    if (_511)
    {
        float _557 = _541 * 8.0;
        float _559 = precise::clamp(_557, 0.0, 1.0);
        _553 = _559;
    }
    float _561 = _553;
    float _563 = _130 * _491;
    float _565 = _130 * _509;
    float _567 = _367 * _545;
    float _569 = _369 * _547;
    float _571 = _371 * _543;
    if (_511)
    {
        float _573 = _551 * _561;
        _555 = _573;
    }
    float _575 = _555;
    float _577 = fma(_567, _565, _563);
    float _579 = fma(_569, _565, _525);
    float _581 = fma(_571, _565, _527);
    float _583 = 0.0 + _575;
    float _585 = precise::clamp(_583, 0.0, 1.0);
    out.m_57.x = _577;
    out.m_57.y = _579;
    out.m_57.z = _581;
    out.m_57.w = _585;
    return out;
}

