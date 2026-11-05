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
    constant _16* fp_c10 [[id(2)]];
    constant _16* fp_c15 [[id(3)]];
    texture2d<float> fp_t_tcb_8 [[id(4)]];
    sampler fp_t_tcb_8Smplr [[id(5)]];
    texture2d<float> fp_t_tcb_10 [[id(6)]];
    sampler fp_t_tcb_10Smplr [[id(7)]];
    texture2d<float> fp_t_tcb_C [[id(8)]];
    sampler fp_t_tcb_CSmplr [[id(9)]];
    texture2d_array<float> fp_t_tcb_A [[id(10)]];
    sampler fp_t_tcb_ASmplr [[id(11)]];
    texturecube<float> fp_t_tcb_1E [[id(12)]];
    sampler fp_t_tcb_1ESmplr [[id(13)]];
    sampler fp_t_tcb_8Smplr_w [[id(14)]];
    sampler fp_t_tcb_10Smplr_w [[id(15)]];
    sampler fp_t_tcb_CSmplr_w [[id(16)]];
    sampler fp_t_tcb_ASmplr_w [[id(17)]];
    sampler fp_t_tcb_1ESmplr_w [[id(18)]];
    constant dm_border_t* dm_border [[id(19)]];
};

struct main0_out
{
    float4 m_68 [[color(0)]];
};

struct main0_in
{
    float4 m_61 [[user(locn0)]];
    float4 m_63 [[user(locn1)]];
    float4 m_65 [[user(locn2)]];
    float4 m_74 [[user(locn3)]];
    float4 m_57 [[user(locn4), flat]];
    float4 m_49 [[user(locn5)]];
    float4 m_51 [[user(locn6)]];
    float4 m_53 [[user(locn7)]];
    float4 m_55 [[user(locn8), flat]];
    float4 m_70 [[user(locn9)]];
    float4 m_59 [[user(locn10)]];
    float4 m_76 [[user(locn11)]];
    float4 m_72 [[user(locn12)]];
    float4 m_78 [[user(locn13)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _85 = gl_FragCoord.w;
    float _87 = in.m_49.x;
    float _89 = gl_FragCoord.w;
    float _91 = _87 * _89;
    float _93 = in.m_49.y;
    float _95 = gl_FragCoord.w;
    float _97 = _93 * _95;
    float _99 = in.m_51.w;
    float _101 = gl_FragCoord.w;
    float _103 = _99 * _101;
    float _105 = in.m_51.x;
    float _107 = gl_FragCoord.w;
    float _109 = _105 * _107;
    float _111 = in.m_51.y;
    float _113 = gl_FragCoord.w;
    float _115 = _111 * _113;
    float _117 = in.m_53.x;
    float _119 = gl_FragCoord.w;
    float _121 = _117 * _119;
    float _123 = in.m_53.y;
    float _125 = gl_FragCoord.w;
    float _127 = _123 * _125;
    float _129 = 1.0 / _85;
    float _131 = _129 * _91;
    float _133 = _129 * _97;
    float _135 = _129 * _103;
    float _137 = _129 * _109;
    float _139 = _129 * _115;
    float _141 = _129 * _121;
    float _143 = _129 * _127;
    float2 _714 = float2(_131, _133);
    float2 _147 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_714, float2(0.0), isnan(_714))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_714, float2(0.0), isnan(_714))).xy;
    float _149 = _147.x;
    float _151 = _147.y;
    float _153 = 1.0 / _135;
    float _155 = _137 * _153;
    float _157 = _139 * _153;
    float2 _737 = float2(_155, _157);
    float _159 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_737, float2(0.0), isnan(_737))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_737, float2(0.0), isnan(_737))).x;
    float2 _745 = float2(_141, _143);
    float _161 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_745, float2(0.0), isnan(_745))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_745, float2(0.0), isnan(_745))).w;
    float _163 = in.m_55.y;
    float _165 = in.m_57.x;
    float _167 = in.m_49.w;
    float _169 = gl_FragCoord.w;
    float _171 = _167 * _169;
    float _173 = in.m_49.z;
    float _175 = gl_FragCoord.w;
    float _177 = _173 * _175;
    float _179 = rint(_163);
    float _181 = precise::max(_179, 0.0);
    uint _184 = uint(_181);
    uint _186 = clamp(_184, 0u, 65535u);
    float _188 = _165 * (*spvDescriptorSet0.fp_c9)._m0[194].w;
    float _190 = _129 * _171;
    float _192 = _129 * _177;
    float _194 = fma(_151, _188, _190);
    float _196 = fma(_149, _188, _192);
    float3 _806 = float3(_196, _194, float(int(_186)));
    float3 _810 = select(_806, float3(0.0), isnan(_806));
    float4 _199 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _810.xy, uint(rint(_810.z))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _810.xy, uint(rint(_810.z))).xyzw;
    float _201 = _199.x;
    float _203 = _199.y;
    float _205 = _199.z;
    float _207 = _199.w;
    float _209 = in.m_59.x;
    float _211 = gl_FragCoord.w;
    float _213 = _209 * _211;
    float _215 = in.m_59.y;
    float _217 = gl_FragCoord.w;
    float _219 = _215 * _217;
    float _221 = in.m_51.z;
    float _223 = gl_FragCoord.w;
    float _225 = _221 * _223;
    float _227 = in.m_59.z;
    float _229 = gl_FragCoord.w;
    float _231 = _227 * _229;
    float _233 = in.m_61.w;
    float _235 = gl_FragCoord.w;
    float _237 = _233 * _235;
    float _239 = in.m_63.w;
    float _241 = gl_FragCoord.w;
    float _243 = _239 * _241;
    float _245 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _247 = fma(_159, (*spvDescriptorSet0.fp_c8)._m0[30].w, _245);
    float _249 = 1.0 / _247;
    float _251 = _129 * _213;
    float _253 = _129 * _219;
    float _255 = _129 * _225;
    float _257 = -(*spvDescriptorSet0.fp_c10)._m0[8].w;
    float _259 = _251 + _257;
    float _261 = -(*spvDescriptorSet0.fp_c10)._m0[9].w;
    float _263 = _253 + _261;
    float _265 = _255 * _153;
    float _267 = _129 * _231;
    float _269 = _263 * (*spvDescriptorSet0.fp_c10)._m0[9].x;
    float _271 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _273 = fma(_265, (*spvDescriptorSet0.fp_c8)._m0[30].w, _271);
    float _275 = in.m_65.x;
    float _277 = gl_FragCoord.w;
    float _279 = _275 * _277;
    float _281 = -(*spvDescriptorSet0.fp_c10)._m0[10].w;
    float _283 = _267 + _281;
    float _285 = fma(_259, (*spvDescriptorSet0.fp_c10)._m0[8].x, _269);
    float _287 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _289 = fma(_283, (*spvDescriptorSet0.fp_c10)._m0[10].x, _285);
    float _291 = _129 * _237;
    float _293 = 1.0 / _273;
    float _295 = _129 * _279;
    float _297 = in.m_63.z;
    float _299 = gl_FragCoord.w;
    float _301 = _297 * _299;
    float _303 = in.m_61.x;
    float _305 = gl_FragCoord.w;
    float _307 = _303 * _305;
    float _309 = in.m_61.z;
    float _311 = gl_FragCoord.w;
    float _313 = _309 * _311;
    float _315 = _207 + _161;
    float _317 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _319 = _293 * _317;
    float _321 = -_291;
    float _323 = _321 + _315;
    float _325 = _129 * _243;
    float _327 = _325 * _323;
    float _329 = _289 * (*spvDescriptorSet0.fp_c9)._m0[194].z;
    float _331 = precise::clamp(_329, 0.0, 1.0);
    float _333 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _335 = -_319;
    float _337 = fma(_249, _333, _335);
    float _339 = _327 * _331;
    float _341 = _337 * _287;
    float _343 = precise::clamp(_341, 0.0, 1.0);
    float _345 = 0.0 + _339;
    float _347 = precise::clamp(_345, 0.0, 1.0);
    float _349 = _347 * _343;
    float _351 = _349 * _295;
    bool _355 = _351 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _357 = isnan(_351);
    bool _359 = _355 || _357;
    bool _361 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _363 = _359 || _361;
    float _365 = in.m_63.x;
    float _367 = gl_FragCoord.w;
    float _369 = _365 * _367;
    float _371 = in.m_63.y;
    float _373 = gl_FragCoord.w;
    float _375 = _371 * _373;
    float _377 = in.m_61.y;
    float _379 = gl_FragCoord.w;
    float _381 = _377 * _379;
    float _383 = _319;
    if (!_363)
    {
        discard_fragment();
    }
    float _385 = -_203;
    float _387 = _385 + 1.0;
    float _389 = -_205;
    float _391 = _389 + 1.0;
    float _393 = _129 * _369;
    float _395 = _129 * _375;
    float _397 = _129 * _301;
    float _399 = -_201;
    float _401 = _399 + 1.0;
    float _403 = _395 * _387;
    float _405 = _397 * _391;
    float _407 = _393 * _401;
    float _409 = _129 * _307;
    float _411 = _129 * _381;
    float _413 = _129 * _313;
    float _415 = fma(_201, _409, _407);
    float _417 = fma(_203, _411, _403);
    float _419 = fma(_205, _413, _405);
    if (!_363)
    {
        out.m_68.x = _415;
        out.m_68.y = _417;
        out.m_68.z = _419;
        out.m_68.w = _339;
        return out;
    }
    float _421 = in.m_70.y;
    float _423 = gl_FragCoord.w;
    float _425 = _421 * _423;
    float _427 = in.m_70.x;
    float _429 = gl_FragCoord.w;
    float _431 = _427 * _429;
    float _433 = in.m_70.z;
    float _435 = gl_FragCoord.w;
    float _437 = _433 * _435;
    float _439 = _129 * _425;
    float _441 = _129 * _431;
    float _443 = _129 * _437;
    float _445 = _439 * _439;
    float _447 = in.m_72.x;
    float _449 = gl_FragCoord.w;
    float _451 = _447 * _449;
    float _453 = fma(_441, _441, _445);
    float _455 = fma(_443, _443, _453);
    float _457 = rsqrt(_455);
    float _459 = _441 * _457;
    float _461 = _439 * _457;
    float _463 = _443 * _457;
    float _465 = _129 * _451;
    float _467 = abs(_459);
    float _469 = abs(_461);
    float _471 = precise::max(_467, _469);
    float _473 = precise::min(_465, 1.0);
    float _475 = abs(_463);
    float _477 = precise::max(_475, _471);
    float _479 = 1.0 / _477;
    float _481 = -_479;
    float _483 = _463 * _481;
    float _485 = _459 * _479;
    float _487 = _461 * _479;
    float3 _1224 = float3(_485, _487, _483);
    float3 _491 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1224, float3(0.0), isnan(_1224)), level(_473)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1224, float3(0.0), isnan(_1224)), level(_473)).xyz;
    float _493 = _491.x;
    float _495 = _491.y;
    float _497 = _491.z;
    float _499 = in.m_74.x;
    float _501 = gl_FragCoord.w;
    float _503 = _499 * _501;
    float _505 = in.m_74.z;
    float _507 = gl_FragCoord.w;
    float _509 = _505 * _507;
    float _511 = in.m_74.y;
    float _513 = gl_FragCoord.w;
    float _515 = _511 * _513;
    float _517 = in.m_76.z;
    float _519 = gl_FragCoord.w;
    float _521 = _517 * _519;
    float _523 = in.m_76.x;
    float _525 = gl_FragCoord.w;
    float _527 = _523 * _525;
    float _529 = in.m_76.y;
    float _531 = gl_FragCoord.w;
    float _533 = _529 * _531;
    float _535 = in.m_78.x;
    float _537 = gl_FragCoord.w;
    float _539 = _535 * _537;
    float _541 = in.m_78.y;
    float _543 = gl_FragCoord.w;
    float _545 = _541 * _543;
    float _547 = in.m_78.z;
    float _549 = gl_FragCoord.w;
    float _551 = _547 * _549;
    float _553 = in.m_78.w;
    float _555 = gl_FragCoord.w;
    float _557 = _553 * _555;
    bool _559 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    if (_559)
    {
        float _561 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _563 = _319 + _561;
        _383 = _563;
    }
    float _565 = _383;
    float _567 = _565;
    if (_559)
    {
        float _569 = _565 * 8.0;
        float _571 = precise::clamp(_569, 0.0, 1.0);
        _567 = _571;
    }
    float _573 = _567;
    float _575 = _129 * _503;
    float _577 = _129 * _509;
    float _579 = _129 * _521;
    float _581 = _129 * _527;
    float _583 = _129 * _533;
    float _585 = _129 * _545;
    float _587 = fma(_493, 0.20999999344348907470703125, _575);
    float _589 = _129 * _515;
    float _591 = fma(_497, 0.20999999344348907470703125, _577);
    float _593 = _129 * _539;
    float _595 = _587 + _581;
    float _597 = fma(_495, 0.20999999344348907470703125, _589);
    float _599 = _591 + _579;
    float _601 = 0.0 + _351;
    float _603 = precise::clamp(_601, 0.0, 1.0);
    float _605 = _129 * _551;
    float _607 = _597 + _583;
    float _609 = _129 * _557;
    float _611 = _415 * _595;
    float _613 = _419 * _599;
    float _615 = _417 * _607;
    float _617 = _603;
    if (_559)
    {
        float _619 = _603 * _573;
        _617 = _619;
    }
    float _621 = _617;
    float _623 = fma(_611, _609, _593);
    float _625 = fma(_613, _609, _605);
    float _627 = fma(_615, _609, _585);
    float _629 = 0.0 + _621;
    float _631 = precise::clamp(_629, 0.0, 1.0);
    out.m_68.x = _623;
    out.m_68.y = _627;
    out.m_68.z = _625;
    out.m_68.w = _631;
    return out;
}

