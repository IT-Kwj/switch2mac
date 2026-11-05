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
    texture2d<float> fp_t_tcb_C [[id(3)]];
    sampler fp_t_tcb_CSmplr [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_A [[id(7)]];
    sampler fp_t_tcb_ASmplr [[id(8)]];
    texturecube<float> fp_t_tcb_1E [[id(9)]];
    sampler fp_t_tcb_1ESmplr [[id(10)]];
    sampler fp_t_tcb_CSmplr_w [[id(11)]];
    sampler fp_t_tcb_8Smplr_w [[id(12)]];
    sampler fp_t_tcb_ASmplr_w [[id(13)]];
    sampler fp_t_tcb_1ESmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_57 [[color(0)]];
};

struct main0_in
{
    float4 m_52 [[user(locn0)]];
    float4 m_54 [[user(locn1)]];
    float4 m_44 [[user(locn2)]];
    float4 m_69 [[user(locn3)]];
    float4 m_63 [[user(locn4)]];
    float4 m_50 [[user(locn5)]];
    float4 m_42 [[user(locn6)]];
    float4 m_48 [[user(locn7)]];
    float4 m_59 [[user(locn8)]];
    float4 m_46 [[user(locn9)]];
    float4 m_65 [[user(locn10)]];
    float4 m_61 [[user(locn11)]];
    float4 m_67 [[user(locn12)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _76 = gl_FragCoord.w;
    float _78 = in.m_42.x;
    float _80 = gl_FragCoord.w;
    float _82 = _78 * _80;
    float _84 = in.m_44.x;
    float _86 = gl_FragCoord.w;
    float _88 = _84 * _86;
    float _90 = in.m_44.y;
    float _92 = gl_FragCoord.w;
    float _94 = _90 * _92;
    float _96 = in.m_42.y;
    float _98 = gl_FragCoord.w;
    float _100 = _96 * _98;
    float _102 = in.m_44.z;
    float _104 = gl_FragCoord.w;
    float _106 = _102 * _104;
    float _108 = in.m_44.w;
    float _110 = gl_FragCoord.w;
    float _112 = _108 * _110;
    float _114 = 1.0 / _76;
    float _116 = _114 * _82;
    float _118 = _114 * _88;
    float _120 = _114 * _94;
    float _122 = _114 * _100;
    float _124 = _114 * _106;
    float _126 = _114 * _112;
    float2 _700 = float2(_116, _122);
    float _128 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_700, float2(0.0), isnan(_700))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_700, float2(0.0), isnan(_700))).w;
    float2 _711 = float2(_118, _120);
    float4 _131 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_711, float2(0.0), isnan(_711))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_711, float2(0.0), isnan(_711))).xyzw;
    float _133 = _131.x;
    float _135 = _131.y;
    float _137 = _131.z;
    float _139 = _131.w;
    float2 _727 = float2(_124, _126);
    float4 _141 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_727, float2(0.0), isnan(_727))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_727, float2(0.0), isnan(_727))).xyzw;
    float _143 = _141.x;
    float _145 = _141.y;
    float _147 = _141.z;
    float _149 = _141.w;
    float _151 = in.m_46.y;
    float _153 = gl_FragCoord.w;
    float _155 = _151 * _153;
    float _157 = in.m_46.x;
    float _159 = gl_FragCoord.w;
    float _161 = _157 * _159;
    float _163 = in.m_46.z;
    float _165 = gl_FragCoord.w;
    float _167 = _163 * _165;
    float _169 = in.m_48.y;
    float _171 = gl_FragCoord.w;
    float _173 = _169 * _171;
    float _175 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[191].z;
    float _177 = in.m_50.x;
    float _179 = gl_FragCoord.w;
    float _181 = _177 * _179;
    float _183 = _114 * _155;
    float _185 = _114 * _161;
    float _187 = -(*spvDescriptorSet0.fp_c8)._m0[29].y;
    float _189 = _183 + _187;
    float _191 = -(*spvDescriptorSet0.fp_c8)._m0[29].x;
    float _193 = _185 + _191;
    float _195 = _114 * _167;
    float _197 = _189 * _189;
    float _199 = in.m_52.w;
    float _201 = gl_FragCoord.w;
    float _203 = _199 * _201;
    float _205 = -(*spvDescriptorSet0.fp_c8)._m0[29].z;
    float _207 = _195 + _205;
    float _209 = _114 * _173;
    float _211 = fma(_193, _193, _197);
    float _213 = in.m_54.w;
    float _215 = gl_FragCoord.w;
    float _217 = _213 * _215;
    float _219 = fma(_207, _207, _211);
    float _221 = precise::max(_209, (*spvDescriptorSet0.fp_c9)._m0[191].w);
    float _223 = -(*spvDescriptorSet0.fp_c9)._m0[191].w;
    float _225 = 1.0 + _223;
    float _227 = precise::max(0.0, _209);
    float _229 = sqrt(_219);
    float _231 = -(*spvDescriptorSet0.fp_c9)._m0[191].x;
    float _233 = (*spvDescriptorSet0.fp_c9)._m0[191].y + _231;
    float _235 = precise::min(_221, 1.0);
    float _237 = precise::min(_227, (*spvDescriptorSet0.fp_c9)._m0[191].z);
    float _239 = -(*spvDescriptorSet0.fp_c9)._m0[191].w;
    float _241 = _235 + _239;
    float _243 = 1.0 / _233;
    float _245 = abs(_229);
    float _247 = precise::max(_245, (*spvDescriptorSet0.fp_c9)._m0[191].x);
    float _249 = 1.0 / _225;
    float _251 = precise::min(_247, (*spvDescriptorSet0.fp_c9)._m0[191].y);
    float _253 = -(*spvDescriptorSet0.fp_c9)._m0[191].x;
    float _255 = _251 + _253;
    float _257 = _237 * _175;
    float _259 = _255 * _243;
    float _261 = _114 * _203;
    float _263 = -_241;
    float _265 = fma(_263, _249, 1.0);
    float _267 = _265 * _257;
    float _269 = in.m_54.z;
    float _271 = gl_FragCoord.w;
    float _273 = _269 * _271;
    float _275 = in.m_54.y;
    float _277 = gl_FragCoord.w;
    float _279 = _275 * _277;
    float _281 = in.m_52.x;
    float _283 = gl_FragCoord.w;
    float _285 = _281 * _283;
    float _287 = _139 * _128;
    float _289 = _149 * _287;
    float _291 = _261 * _289;
    float _293 = _114 * _217;
    float _295 = _293 * _291;
    float _297 = _259 * _295;
    float _299 = _297 * _267;
    float _301 = _114 * _181;
    float _303 = 0.0 + _299;
    float _305 = precise::clamp(_303, 0.0, 1.0);
    float _307 = _305 * _301;
    bool _311 = _307 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _313 = isnan(_307);
    bool _315 = _311 || _313;
    bool _317 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _319 = _315 || _317;
    float _321 = in.m_54.x;
    float _323 = gl_FragCoord.w;
    float _325 = _321 * _323;
    float _327 = in.m_52.y;
    float _329 = gl_FragCoord.w;
    float _331 = _327 * _329;
    float _333 = in.m_52.z;
    float _335 = gl_FragCoord.w;
    float _337 = _333 * _335;
    if (!_319)
    {
        discard_fragment();
    }
    float _339 = _143 * _143;
    float _341 = _145 * _145;
    float _343 = _147 * _147;
    float _345 = _114 * _273;
    float _347 = _133 * _339;
    float _349 = _135 * _341;
    float _351 = _137 * _343;
    float _353 = _114 * _279;
    float _355 = -_347;
    float _357 = _355 + 1.0;
    float _359 = -_351;
    float _361 = _359 + 1.0;
    float _363 = _345 * _361;
    float _365 = _114 * _325;
    float _367 = -_349;
    float _369 = _367 + 1.0;
    float _371 = _365 * _357;
    float _373 = _353 * _369;
    float _375 = _114 * _285;
    float _377 = _114 * _331;
    float _379 = _114 * _337;
    float _381 = fma(_347, _375, _371);
    float _383 = fma(_349, _377, _373);
    float _385 = fma(_351, _379, _363);
    if (!_319)
    {
        out.m_57.x = _381;
        out.m_57.y = _383;
        out.m_57.z = _385;
        out.m_57.w = _299;
        return out;
    }
    float _387 = in.m_59.y;
    float _389 = gl_FragCoord.w;
    float _391 = _387 * _389;
    float _393 = in.m_59.x;
    float _395 = gl_FragCoord.w;
    float _397 = _393 * _395;
    float _399 = in.m_59.z;
    float _401 = gl_FragCoord.w;
    float _403 = _399 * _401;
    float _405 = _114 * _391;
    float _407 = _114 * _397;
    float _409 = _114 * _403;
    float _411 = _405 * _405;
    float _413 = in.m_61.x;
    float _415 = gl_FragCoord.w;
    float _417 = _413 * _415;
    float _419 = fma(_407, _407, _411);
    float _421 = fma(_409, _409, _419);
    float _423 = rsqrt(_421);
    float _425 = _407 * _423;
    float _427 = _405 * _423;
    float _429 = _409 * _423;
    float _431 = _114 * _417;
    float _433 = abs(_425);
    float _435 = abs(_427);
    float _437 = precise::max(_433, _435);
    float _439 = abs(_429);
    float _441 = precise::max(_439, _437);
    float _443 = 1.0 / _441;
    float _445 = _427 * _443;
    float _447 = -_443;
    float _449 = _429 * _447;
    float _451 = precise::min(_431, 1.0);
    float _453 = _425 * _443;
    float3 _1174 = float3(_453, _445, _449);
    float3 _457 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1174, float3(0.0), isnan(_1174)), level(_451)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1174, float3(0.0), isnan(_1174)), level(_451)).xyz;
    float _459 = _457.x;
    float _461 = _457.y;
    float _463 = _457.z;
    float _465 = in.m_63.y;
    float _467 = gl_FragCoord.w;
    float _469 = _465 * _467;
    float _471 = in.m_63.z;
    float _473 = gl_FragCoord.w;
    float _475 = _471 * _473;
    float _477 = in.m_63.x;
    float _479 = gl_FragCoord.w;
    float _481 = _477 * _479;
    float _483 = in.m_65.y;
    float _485 = gl_FragCoord.w;
    float _487 = _483 * _485;
    float _489 = in.m_65.z;
    float _491 = gl_FragCoord.w;
    float _493 = _489 * _491;
    float _495 = in.m_65.x;
    float _497 = gl_FragCoord.w;
    float _499 = _495 * _497;
    float _501 = in.m_67.x;
    float _503 = gl_FragCoord.w;
    float _505 = _501 * _503;
    float _507 = in.m_67.w;
    float _509 = gl_FragCoord.w;
    float _511 = _507 * _509;
    float _513 = in.m_67.y;
    float _515 = gl_FragCoord.w;
    float _517 = _513 * _515;
    float _519 = in.m_67.z;
    float _521 = gl_FragCoord.w;
    float _523 = _519 * _521;
    float _525 = _114 * _469;
    float _527 = _114 * _475;
    float _529 = _114 * _481;
    bool _531 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _533 = fma(_461, 0.20999999344348907470703125, _525);
    float _535 = fma(_463, 0.20999999344348907470703125, _527);
    float _537 = fma(_459, 0.20999999344348907470703125, _529);
    float _539 = _114 * _487;
    float _541 = _114 * _493;
    float _543 = _114 * _499;
    float _545 = _533 + _539;
    float _547 = _535 + _541;
    float _549 = _537 + _543;
    float _551 = _114 * _511;
    float _553 = _383 * _545;
    float _555 = _385 * _547;
    float _557 = _381 * _549;
    float _559 = 0.0 + _307;
    float _561 = precise::clamp(_559, 0.0, 1.0);
    float _563 = _114 * _505;
    float _565 = _114 * _517;
    float _567 = _114 * _523;
    float _569 = fma(_557, _551, _563);
    float _571 = fma(_553, _551, _565);
    float _573 = fma(_555, _551, _567);
    float _575 = _563;
    if (!_531)
    {
        _575 = _561;
    }
    float _577 = _575;
    bool _579 = !_531;
    float _581 = _577;
    if (!_579)
    {
        float _583 = in.m_69.w;
        float _585 = gl_FragCoord.w;
        float _587 = _583 * _585;
        float _589 = in.m_69.z;
        float _591 = gl_FragCoord.w;
        float _593 = _589 * _591;
        float _595 = _114 * _587;
        float _597 = _114 * _593;
        float _599 = 1.0 / _595;
        float _601 = _597 * _599;
        float _603 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _605 = fma(_601, (*spvDescriptorSet0.fp_c8)._m0[30].w, _603);
        float _607 = 1.0 / _605;
        float _609 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _611 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _613 = fma(_607, _609, _611);
        float _615 = _613 * 8.0;
        float _617 = precise::clamp(_615, 0.0, 1.0);
        float _619 = _561 * _617;
        _581 = _619;
    }
    float _621 = _581;
    float _623 = 0.0 + _621;
    float _625 = precise::clamp(_623, 0.0, 1.0);
    out.m_57.x = _569;
    out.m_57.y = _571;
    out.m_57.z = _573;
    out.m_57.w = _625;
    return out;
}

