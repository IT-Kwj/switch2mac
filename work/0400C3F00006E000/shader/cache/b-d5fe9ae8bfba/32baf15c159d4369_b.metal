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
    texturecube<float> fp_t_tcb_1E [[id(7)]];
    sampler fp_t_tcb_1ESmplr [[id(8)]];
    sampler fp_t_tcb_10Smplr_w [[id(9)]];
    sampler fp_t_tcb_8Smplr_w [[id(10)]];
    sampler fp_t_tcb_1ESmplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_55 [[color(0)]];
};

struct main0_in
{
    float4 m_52 [[user(locn0)]];
    float4 m_50 [[user(locn1)]];
    float4 m_44 [[user(locn2)]];
    float4 m_40 [[user(locn3)]];
    float4 m_59 [[user(locn4)]];
    float4 m_48 [[user(locn5)]];
    float4 m_42 [[user(locn6)]];
    float4 m_46 [[user(locn7)]];
    float4 m_61 [[user(locn8)]];
    float4 m_57 [[user(locn9)]];
    float4 m_63 [[user(locn10)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _70 = gl_FragCoord.w;
    float _72 = in.m_40.w;
    float _74 = gl_FragCoord.w;
    float _76 = _72 * _74;
    float _78 = in.m_40.x;
    float _80 = gl_FragCoord.w;
    float _82 = _78 * _80;
    float _84 = in.m_40.y;
    float _86 = gl_FragCoord.w;
    float _88 = _84 * _86;
    float _90 = in.m_42.x;
    float _92 = gl_FragCoord.w;
    float _94 = _90 * _92;
    float _96 = in.m_42.y;
    float _98 = gl_FragCoord.w;
    float _100 = _96 * _98;
    float _102 = 1.0 / _70;
    float _104 = _102 * _76;
    float _106 = _102 * _82;
    float _108 = _102 * _88;
    float _110 = _102 * _94;
    float _112 = 1.0 / _104;
    float _114 = _106 * _112;
    float _116 = _108 * _112;
    float _118 = _102 * _100;
    float2 _653 = float2(_114, _116);
    float _120 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_653, float2(0.0), isnan(_653))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_653, float2(0.0), isnan(_653))).x;
    float2 _664 = float2(_110, _118);
    float4 _123 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_664, float2(0.0), isnan(_664))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_664, float2(0.0), isnan(_664))).xyzw;
    float _125 = _123.x;
    float _127 = _123.y;
    float _129 = _123.z;
    float _131 = _123.w;
    float _133 = in.m_44.y;
    float _135 = gl_FragCoord.w;
    float _137 = _133 * _135;
    float _139 = in.m_44.x;
    float _141 = gl_FragCoord.w;
    float _143 = _139 * _141;
    float _145 = in.m_44.z;
    float _147 = gl_FragCoord.w;
    float _149 = _145 * _147;
    float _151 = in.m_46.y;
    float _153 = gl_FragCoord.w;
    float _155 = _151 * _153;
    float _157 = in.m_46.x;
    float _159 = gl_FragCoord.w;
    float _161 = _157 * _159;
    float _163 = in.m_46.z;
    float _165 = gl_FragCoord.w;
    float _167 = _163 * _165;
    float _169 = in.m_40.z;
    float _171 = gl_FragCoord.w;
    float _173 = _169 * _171;
    float _175 = in.m_48.x;
    float _177 = gl_FragCoord.w;
    float _179 = _175 * _177;
    float _181 = _102 * _137;
    float _183 = _102 * _143;
    float _185 = _102 * _149;
    float _187 = _181 * _181;
    float _189 = fma(_183, _183, _187);
    float _191 = fma(_185, _185, _189);
    float _193 = _102 * _155;
    float _195 = rsqrt(_191);
    float _197 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _199 = _197 + (*spvDescriptorSet0.fp_c9)._m0[139].w;
    float _201 = 1.0 / _199;
    float _203 = _181 * _195;
    float _205 = _102 * _161;
    float _207 = _183 * _195;
    float _209 = _185 * _195;
    float _211 = _193 * _203;
    float _213 = _102 * _173;
    float _215 = in.m_50.w;
    float _217 = gl_FragCoord.w;
    float _219 = _215 * _217;
    float _221 = fma(_205, _207, _211);
    float _223 = _102 * _167;
    float _225 = _213 * _112;
    float _227 = in.m_52.w;
    float _229 = gl_FragCoord.w;
    float _231 = _227 * _229;
    float _233 = fma(_223, _209, _221);
    float _235 = abs(_233);
    float _237 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _239 = _235 + _237;
    float _241 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _243 = fma(_225, (*spvDescriptorSet0.fp_c8)._m0[30].w, _241);
    float _245 = _239 * _201;
    float _247 = precise::clamp(_245, 0.0, 1.0);
    float _249 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _251 = fma(_247, -2.0, 3.0);
    float _253 = _247 * _247;
    float _255 = _251 * _253;
    float _257 = 1.0 / _243;
    float _259 = _102 * _231;
    float _261 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _263 = _257 * _261;
    float _265 = in.m_52.z;
    float _267 = gl_FragCoord.w;
    float _269 = _265 * _267;
    float _271 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _273 = fma(_120, (*spvDescriptorSet0.fp_c8)._m0[30].w, _271);
    float _275 = 1.0 / _273;
    float _277 = -_259;
    float _279 = _131 + _277;
    float _281 = _102 * _219;
    float _283 = _281 * _279;
    float _285 = 0.0 + _283;
    float _287 = precise::clamp(_285, 0.0, 1.0);
    float _289 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _291 = -_263;
    float _293 = fma(_275, _289, _291);
    float _295 = _293 * _249;
    float _297 = precise::clamp(_295, 0.0, 1.0);
    float _299 = _287 * _297;
    float _301 = _102 * _179;
    float _303 = _299 * _255;
    float _305 = _303 * _301;
    bool _309 = _305 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _311 = isnan(_305);
    bool _313 = _309 || _311;
    bool _315 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _317 = _313 || _315;
    float _319 = in.m_52.x;
    float _321 = gl_FragCoord.w;
    float _323 = _319 * _321;
    float _325 = in.m_50.x;
    float _327 = gl_FragCoord.w;
    float _329 = _325 * _327;
    float _331 = in.m_52.y;
    float _333 = gl_FragCoord.w;
    float _335 = _331 * _333;
    float _337 = in.m_50.y;
    float _339 = gl_FragCoord.w;
    float _341 = _337 * _339;
    float _343 = in.m_50.z;
    float _345 = gl_FragCoord.w;
    float _347 = _343 * _345;
    float _349 = _263;
    if (!_317)
    {
        discard_fragment();
    }
    float _351 = _102 * _269;
    float _353 = _129 * _129;
    float _355 = _102 * _323;
    float _357 = _102 * _329;
    float _359 = _102 * _335;
    float _361 = _102 * _341;
    float _363 = _102 * _347;
    float _365 = -_357;
    float _367 = _355 + _365;
    float _369 = _125 * _125;
    float _371 = -_361;
    float _373 = _359 + _371;
    float _375 = -_363;
    float _377 = _351 + _375;
    float _379 = _127 * _127;
    float _381 = fma(_369, _367, _357);
    float _383 = fma(_353, _377, _363);
    float _385 = fma(_379, _373, _361);
    if (!_317)
    {
        out.m_55.x = _381;
        out.m_55.y = _385;
        out.m_55.z = _383;
        out.m_55.w = _283;
        return out;
    }
    float _387 = _193 * _193;
    float _389 = fma(_205, _205, _387);
    float _391 = in.m_57.x;
    float _393 = gl_FragCoord.w;
    float _395 = _391 * _393;
    float _397 = fma(_223, _223, _389);
    float _399 = rsqrt(_397);
    float _401 = _205 * _399;
    float _403 = _193 * _399;
    float _405 = _223 * _399;
    float _407 = abs(_401);
    float _409 = abs(_403);
    float _411 = precise::max(_407, _409);
    float _413 = _102 * _395;
    float _415 = abs(_405);
    float _417 = precise::max(_415, _411);
    float _419 = 1.0 / _417;
    float _421 = _401 * _419;
    float _423 = -_419;
    float _425 = _405 * _423;
    float _427 = precise::min(_413, 1.0);
    float _429 = _403 * _419;
    float3 _1108 = float3(_421, _429, _425);
    float3 _433 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1108, float3(0.0), isnan(_1108)), level(_427)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1108, float3(0.0), isnan(_1108)), level(_427)).xyz;
    float _435 = _433.x;
    float _437 = _433.y;
    float _439 = _433.z;
    float _441 = in.m_59.x;
    float _443 = gl_FragCoord.w;
    float _445 = _441 * _443;
    float _447 = in.m_59.y;
    float _449 = gl_FragCoord.w;
    float _451 = _447 * _449;
    float _453 = in.m_59.z;
    float _455 = gl_FragCoord.w;
    float _457 = _453 * _455;
    float _459 = in.m_61.x;
    float _461 = gl_FragCoord.w;
    float _463 = _459 * _461;
    float _465 = in.m_61.y;
    float _467 = gl_FragCoord.w;
    float _469 = _465 * _467;
    float _471 = in.m_61.z;
    float _473 = gl_FragCoord.w;
    float _475 = _471 * _473;
    float _477 = in.m_57.y;
    float _479 = gl_FragCoord.w;
    float _481 = _477 * _479;
    float _483 = in.m_63.x;
    float _485 = gl_FragCoord.w;
    float _487 = _483 * _485;
    float _489 = in.m_63.y;
    float _491 = gl_FragCoord.w;
    float _493 = _489 * _491;
    float _495 = in.m_63.z;
    float _497 = gl_FragCoord.w;
    float _499 = _495 * _497;
    float _501 = in.m_63.w;
    float _503 = gl_FragCoord.w;
    float _505 = _501 * _503;
    bool _507 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    if (_507)
    {
        float _509 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _511 = _263 + _509;
        _349 = _511;
    }
    float _513 = _349;
    float _515 = _102 * _445;
    float _517 = _102 * _451;
    float _519 = _102 * _457;
    float _521 = _102 * _463;
    float _523 = _102 * _469;
    float _525 = _102 * _475;
    float _527 = _102 * _481;
    float _529 = _513;
    if (_507)
    {
        float _531 = _513 * 8.0;
        float _533 = precise::clamp(_531, 0.0, 1.0);
        _529 = _533;
    }
    float _535 = _529;
    float _537 = _102 * _487;
    float _539 = _102 * _493;
    float _541 = _305 * _527;
    float _543 = precise::clamp(_541, 0.0, 1.0);
    float _545 = _102 * _499;
    float _547 = _102 * _505;
    float _549 = _543;
    if (_507)
    {
        float _551 = _543 * _535;
        _549 = _551;
    }
    float _553 = _549;
    float _555 = 0.0 + _553;
    float _557 = precise::clamp(_555, 0.0, 1.0);
    float _559 = fma(_435, 0.20999999344348907470703125, _515);
    float _561 = fma(_437, 0.20999999344348907470703125, _517);
    float _563 = fma(_439, 0.20999999344348907470703125, _519);
    float _565 = _559 + _521;
    float _567 = _561 + _523;
    float _569 = _563 + _525;
    float _571 = _381 * _565;
    float _573 = _385 * _567;
    float _575 = _383 * _569;
    float _577 = fma(_571, _547, _537);
    float _579 = fma(_573, _547, _539);
    float _581 = fma(_575, _547, _545);
    out.m_55.x = _577;
    out.m_55.y = _579;
    out.m_55.z = _581;
    out.m_55.w = _557;
    return out;
}

