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
    texture2d<float> fp_t_tcb_38 [[id(9)]];
    sampler fp_t_tcb_38Smplr [[id(10)]];
    texturecube<float> fp_t_tcb_1E [[id(11)]];
    sampler fp_t_tcb_1ESmplr [[id(12)]];
    sampler fp_t_tcb_10Smplr_w [[id(13)]];
    sampler fp_t_tcb_8Smplr_w [[id(14)]];
    sampler fp_t_tcb_ASmplr_w [[id(15)]];
    sampler fp_t_tcb_38Smplr_w [[id(16)]];
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
    float _100 = in.m_46.z;
    float _102 = gl_FragCoord.w;
    float _104 = _100 * _102;
    float _106 = in.m_46.y;
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
    float2 _688 = float2(_152, _154);
    float _156 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_688, float2(0.0), isnan(_688))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_688, float2(0.0), isnan(_688))).x;
    float2 _699 = float2(_134, _144);
    float4 _159 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_699, float2(0.0), isnan(_699))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_699, float2(0.0), isnan(_699))).xyzw;
    float _161 = _159.x;
    float _163 = _159.y;
    float _165 = _159.z;
    float _167 = _159.w;
    float2 _715 = float2(_142, _146);
    float4 _169 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_715, float2(0.0), isnan(_715))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_715, float2(0.0), isnan(_715))).xyzw;
    float _171 = _169.x;
    float _173 = _169.y;
    float _175 = _169.z;
    float _177 = _169.w;
    float2 _731 = float2(_148, _150);
    float4 _179 = dm_bs(spvDescriptorSet0.fp_t_tcb_38.sample(spvDescriptorSet0.fp_t_tcb_38Smplr, select(_731, float2(0.0), isnan(_731))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_38, spvDescriptorSet0.fp_t_tcb_38Smplr_w, select(_731, float2(0.0), isnan(_731))).xyzw;
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
    float _233 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _235 = fma(_156, (*spvDescriptorSet0.fp_c8)._m0[30].w, _233);
    float _237 = 1.0 / _235;
    float _239 = _167 * _177;
    float _241 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _243 = _225 * _241;
    float _245 = _130 * _211;
    float _247 = -_219;
    float _249 = fma(_239, _187, _247);
    float _251 = _130 * _205;
    float _253 = _251 * _249;
    float _255 = 0.0 + _253;
    float _257 = precise::clamp(_255, 0.0, 1.0);
    float _259 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _261 = -_243;
    float _263 = fma(_237, _259, _261);
    float _265 = _263 * _213;
    float _267 = precise::clamp(_265, 0.0, 1.0);
    float _269 = _257 * _267;
    float _271 = _269 * _245;
    bool _275 = _271 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _277 = isnan(_271);
    bool _279 = _275 || _277;
    bool _281 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _283 = _279 || _281;
    float _285 = in.m_50.x;
    float _287 = gl_FragCoord.w;
    float _289 = _285 * _287;
    float _291 = in.m_52.x;
    float _293 = gl_FragCoord.w;
    float _295 = _291 * _293;
    float _297 = in.m_52.y;
    float _299 = gl_FragCoord.w;
    float _301 = _297 * _299;
    float _303 = in.m_50.z;
    float _305 = gl_FragCoord.w;
    float _307 = _303 * _305;
    float _309 = in.m_52.z;
    float _311 = gl_FragCoord.w;
    float _313 = _309 * _311;
    if (!_283)
    {
        discard_fragment();
    }
    float _315 = _161 * _171;
    float _317 = _163 * _173;
    float _319 = _181 * _181;
    float _321 = _183 * _183;
    float _323 = _165 * _175;
    float _325 = _315 * _319;
    float _327 = _317 * _321;
    float _329 = _185 * _185;
    float _331 = _323 * _329;
    float _333 = _130 * _289;
    float _335 = _130 * _295;
    float _337 = _130 * _231;
    float _339 = _130 * _301;
    float _341 = _130 * _307;
    float _343 = _130 * _313;
    float _345 = -_335;
    float _347 = _333 + _345;
    float _349 = -_339;
    float _351 = _337 + _349;
    float _353 = -_343;
    float _355 = _341 + _353;
    float _357 = fma(_325, _347, _335);
    float _359 = fma(_327, _351, _339);
    float _361 = fma(_331, _355, _343);
    if (!_283)
    {
        out.m_57.x = _357;
        out.m_57.y = _359;
        out.m_57.z = _361;
        out.m_57.w = _253;
        return out;
    }
    float _363 = in.m_59.y;
    float _365 = gl_FragCoord.w;
    float _367 = _363 * _365;
    float _369 = in.m_59.x;
    float _371 = gl_FragCoord.w;
    float _373 = _369 * _371;
    float _375 = in.m_59.z;
    float _377 = gl_FragCoord.w;
    float _379 = _375 * _377;
    float _381 = _130 * _367;
    float _383 = _130 * _373;
    float _385 = _130 * _379;
    float _387 = _381 * _381;
    float _389 = in.m_61.x;
    float _391 = gl_FragCoord.w;
    float _393 = _389 * _391;
    float _395 = fma(_383, _383, _387);
    float _397 = fma(_385, _385, _395);
    float _399 = rsqrt(_397);
    float _401 = _383 * _399;
    float _403 = _381 * _399;
    float _405 = _385 * _399;
    float _407 = _130 * _393;
    float _409 = abs(_401);
    float _411 = abs(_403);
    float _413 = precise::max(_409, _411);
    float _415 = abs(_405);
    float _417 = precise::max(_415, _413);
    float _419 = 1.0 / _417;
    float _421 = _401 * _419;
    float _423 = _403 * _419;
    float _425 = -_419;
    float _427 = _405 * _425;
    float _429 = precise::min(_407, 1.0);
    float3 _1096 = float3(_421, _423, _427);
    float3 _433 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1096, float3(0.0), isnan(_1096)), level(_429)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1096, float3(0.0), isnan(_1096)), level(_429)).xyz;
    float _435 = _433.x;
    float _437 = _433.y;
    float _439 = _433.z;
    float _441 = in.m_63.z;
    float _443 = gl_FragCoord.w;
    float _445 = _441 * _443;
    float _447 = in.m_63.x;
    float _449 = gl_FragCoord.w;
    float _451 = _447 * _449;
    float _453 = in.m_63.y;
    float _455 = gl_FragCoord.w;
    float _457 = _453 * _455;
    float _459 = in.m_65.z;
    float _461 = gl_FragCoord.w;
    float _463 = _459 * _461;
    float _465 = in.m_65.x;
    float _467 = gl_FragCoord.w;
    float _469 = _465 * _467;
    float _471 = in.m_65.y;
    float _473 = gl_FragCoord.w;
    float _475 = _471 * _473;
    float _477 = in.m_67.x;
    float _479 = gl_FragCoord.w;
    float _481 = _477 * _479;
    float _483 = in.m_67.y;
    float _485 = gl_FragCoord.w;
    float _487 = _483 * _485;
    float _489 = in.m_67.z;
    float _491 = gl_FragCoord.w;
    float _493 = _489 * _491;
    float _495 = in.m_67.w;
    float _497 = gl_FragCoord.w;
    float _499 = _495 * _497;
    bool _501 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _503 = _130 * _445;
    float _505 = _130 * _451;
    float _507 = _130 * _457;
    float _509 = _130 * _463;
    float _511 = _130 * _469;
    float _513 = _130 * _475;
    float _515 = _130 * _487;
    float _517 = _130 * _493;
    float _519 = fma(_439, 0.20999999344348907470703125, _503);
    float _521 = fma(_435, 0.20999999344348907470703125, _505);
    float _523 = fma(_437, 0.20999999344348907470703125, _507);
    float _525 = _503;
    if (_501)
    {
        float _527 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _529 = _243 + _527;
        _525 = _529;
    }
    float _531 = _525;
    float _533 = _519 + _509;
    float _535 = _521 + _511;
    float _537 = _523 + _513;
    float _539 = 0.0 + _271;
    float _541 = precise::clamp(_539, 0.0, 1.0);
    float _543 = _531;
    float _545 = _541;
    if (_501)
    {
        float _547 = _531 * 8.0;
        float _549 = precise::clamp(_547, 0.0, 1.0);
        _543 = _549;
    }
    float _551 = _543;
    float _553 = _130 * _481;
    float _555 = _130 * _499;
    float _557 = _357 * _535;
    float _559 = _359 * _537;
    float _561 = _361 * _533;
    if (_501)
    {
        float _563 = _541 * _551;
        _545 = _563;
    }
    float _565 = _545;
    float _567 = fma(_557, _555, _553);
    float _569 = fma(_559, _555, _515);
    float _571 = fma(_561, _555, _517);
    float _573 = 0.0 + _565;
    float _575 = precise::clamp(_573, 0.0, 1.0);
    out.m_57.x = _567;
    out.m_57.y = _569;
    out.m_57.z = _571;
    out.m_57.w = _575;
    return out;
}

