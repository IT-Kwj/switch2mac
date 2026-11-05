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
    sampler fp_t_tcb_8Smplr_w [[id(7)]];
    sampler fp_t_tcb_ASmplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_52 [[color(0)]];
};

struct main0_in
{
    float4 m_37 [[user(locn0)]];
    float4 m_39 [[user(locn1)]];
    float4 m_35 [[user(locn2)]];
    float4 m_56 [[user(locn3)]];
    float4 m_41 [[user(locn4)]];
    float4 m_49 [[user(locn5), flat]];
    float4 m_47 [[user(locn6)]];
    float4 m_43 [[user(locn7)]];
    float4 m_45 [[user(locn8)]];
    float4 m_54 [[user(locn9)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _63 = gl_FragCoord.w;
    float _65 = in.m_35.x;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = in.m_35.y;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = 1.0 / _63;
    float _79 = _77 * _69;
    float _81 = _77 * _75;
    float2 _576 = float2(_79, _81);
    float3 _85 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_576, float2(0.0), isnan(_576))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_576, float2(0.0), isnan(_576))).xzw;
    float _87 = _85.x;
    float _89 = _85.y;
    float _91 = _85.z;
    float _93 = in.m_37.w;
    float _95 = gl_FragCoord.w;
    float _97 = _93 * _95;
    float _99 = in.m_39.w;
    float _101 = gl_FragCoord.w;
    float _103 = _99 * _101;
    float _105 = in.m_41.x;
    float _107 = gl_FragCoord.w;
    float _109 = _105 * _107;
    float _111 = _87 * _87;
    float _113 = _91 * _91;
    float _115 = _77 * _109;
    float _117 = _111 * _113;
    float _119 = _77 * _97;
    float _121 = _77 * _103;
    float _123 = -_119;
    float _125 = fma(_117, _117, _123);
    float _127 = _121 * _125;
    float _129 = 0.0 + _127;
    float _131 = precise::clamp(_129, 0.0, 1.0);
    float _133 = _131 * _115;
    bool _137 = _133 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _139 = isnan(_133);
    bool _141 = _137 || _139;
    bool _143 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _145 = _141 || _143;
    float _147 = in.m_35.z;
    float _149 = gl_FragCoord.w;
    float _151 = _147 * _149;
    float _153 = in.m_35.w;
    float _155 = gl_FragCoord.w;
    float _157 = _153 * _155;
    if (!_145)
    {
        discard_fragment();
    }
    float _159 = _77 * _151;
    float _161 = _77 * _157;
    float2 _691 = float2(_159, _161);
    float2 _165 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_691, float2(0.0), isnan(_691))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_691, float2(0.0), isnan(_691))).xy;
    float _167 = _165.x;
    float _169 = _165.y;
    float _171 = in.m_43.y;
    float _173 = gl_FragCoord.w;
    float _175 = _171 * _173;
    float _177 = in.m_43.x;
    float _179 = gl_FragCoord.w;
    float _181 = _177 * _179;
    float _183 = in.m_43.z;
    float _185 = gl_FragCoord.w;
    float _187 = _183 * _185;
    float _189 = in.m_45.y;
    float _191 = gl_FragCoord.w;
    float _193 = _189 * _191;
    float _195 = in.m_45.x;
    float _197 = gl_FragCoord.w;
    float _199 = _195 * _197;
    float _201 = in.m_47.y;
    float _203 = gl_FragCoord.w;
    float _205 = _201 * _203;
    float _207 = in.m_45.z;
    float _209 = gl_FragCoord.w;
    float _211 = _207 * _209;
    float _213 = in.m_37.x;
    float _215 = gl_FragCoord.w;
    float _217 = _213 * _215;
    float _219 = in.m_47.x;
    float _221 = gl_FragCoord.w;
    float _223 = _219 * _221;
    float _225 = in.m_39.x;
    float _227 = gl_FragCoord.w;
    float _229 = _225 * _227;
    float _231 = in.m_47.z;
    float _233 = gl_FragCoord.w;
    float _235 = _231 * _233;
    float _237 = in.m_37.z;
    float _239 = gl_FragCoord.w;
    float _241 = _237 * _239;
    float _243 = in.m_39.y;
    float _245 = gl_FragCoord.w;
    float _247 = _243 * _245;
    float _249 = in.m_37.y;
    float _251 = gl_FragCoord.w;
    float _253 = _249 * _251;
    float _255 = in.m_39.z;
    float _257 = gl_FragCoord.w;
    float _259 = _255 * _257;
    float _261 = _77 * _175;
    float _263 = _77 * _181;
    float _265 = _77 * _187;
    float _267 = _77 * _193;
    float _269 = _261 * _261;
    float _271 = _77 * _199;
    float _273 = _77 * _205;
    float _275 = _267 * _267;
    float _277 = fma(_263, _263, _269);
    float _279 = _77 * _217;
    float _281 = _77 * _223;
    float _283 = fma(_271, _271, _275);
    float _285 = fma(_265, _265, _277);
    float _287 = _273 * _273;
    float _289 = in.m_49.x;
    float _291 = _77 * _229;
    float _293 = _77 * _247;
    float _295 = _77 * _253;
    float _297 = rsqrt(_285);
    float _299 = _77 * _259;
    float _301 = -_293;
    float _303 = _301 + _295;
    float _305 = fma(_91, _303, _293);
    float _307 = _263 * _297;
    float _309 = _261 * _297;
    float _311 = _265 * _297;
    float _313 = _77 * _211;
    float _315 = fma(_313, _313, _283);
    float _317 = _77 * _235;
    float _319 = fma(_281, _281, _287);
    float _321 = _77 * _241;
    float _323 = -_291;
    float _325 = _323 + _279;
    float _327 = rsqrt(_315);
    float _329 = fma(_317, _317, _319);
    float _331 = _309 * _309;
    float _333 = fma(_91, _325, _291);
    float _335 = -_299;
    float _337 = _335 + _321;
    float _339 = fma(_307, _307, _331);
    float _341 = rsqrt(_329);
    float _343 = fma(_311, _311, _339);
    float _345 = fma(_91, _337, _299);
    float _347 = fma(_289, 0.04999999701976776123046875, 0.07999999821186065673828125);
    float _349 = fma(_289, 0.04999999701976776123046875, 0.0299999974668025970458984375);
    float _351 = rsqrt(_343);
    float _353 = -_89;
    float _355 = fma(_353, _89, 1.0);
    float _357 = precise::max(_349, _355);
    float _359 = _317 * _341;
    float _361 = precise::min(_347, _357);
    float _363 = -_349;
    float _365 = _363 + _361;
    float _367 = _169 * _169;
    float _369 = _169 * _341;
    float _371 = _167 * _327;
    float _373 = _169 * _359;
    float _375 = fma(_167, _167, _367);
    float _377 = precise::clamp(_375, 0.0, 1.0);
    float _379 = _273 * _369;
    float _381 = _281 * _369;
    float _383 = fma(_313, _371, _373);
    float _385 = -_377;
    float _387 = _385 + 1.0;
    float _389 = fma(_267, _371, _379);
    float _391 = fma(_271, _371, _381);
    float _393 = sqrt(_387);
    float _395 = _351 * _393;
    float _397 = fma(_309, _395, _389);
    float _399 = fma(_307, _395, _391);
    float _401 = fma(_311, _395, _383);
    float _403 = _397 * _397;
    float _405 = fma(_399, _399, _403);
    float _407 = fma(_401, _401, _405);
    float _409 = rsqrt(_407);
    float _411 = _397 * _409;
    float _413 = _401 * _409;
    float _415 = _411 * (-0.816474258899688720703125);
    float _417 = -_415;
    float _419 = fma(_413, 0.577381789684295654296875, _417);
    float _421 = fma(_419, 0.5, 0.5);
    float _423 = precise::clamp(_421, 0.0, 1.0);
    float _425 = fma(_423, 0.699999988079071044921875, 0.300000011920928955078125);
    float _427 = _365 * 20.0;
    float _429 = _427 * _425;
    float _431 = _333 * _429;
    float _433 = _305 * _429;
    float _435 = _345 * _429;
    if (!_145)
    {
        out.m_52.x = _431;
        out.m_52.y = _433;
        out.m_52.z = _435;
        out.m_52.w = _127;
        return out;
    }
    float _437 = _433 * 0.715200006961822509765625;
    float _439 = in.m_54.w;
    float _441 = gl_FragCoord.w;
    float _443 = _439 * _441;
    float _445 = in.m_54.x;
    float _447 = gl_FragCoord.w;
    float _449 = _445 * _447;
    float _451 = in.m_54.y;
    float _453 = gl_FragCoord.w;
    float _455 = _451 * _453;
    float _457 = fma(_431, 0.2125999927520751953125, _437);
    float _459 = in.m_54.z;
    float _461 = gl_FragCoord.w;
    float _463 = _459 * _461;
    bool _465 = 0.5 <= (*spvDescriptorSet0.fp_c15)._m0[653].w;
    float _467 = fma(_435, 0.072200000286102294921875, _457);
    float _469 = 1.0 / _467;
    float _471 = _469 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _473 = precise::clamp(_471, 0.0, 1.0);
    float _475 = 0.0 + _133;
    float _477 = precise::clamp(_475, 0.0, 1.0);
    float _479 = _77 * _443;
    float _481 = fma(_473, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _483 = _77 * _463;
    float _485 = _481 * _479;
    float _487 = _77 * _449;
    float _489 = _77 * _455;
    float _491 = fma(_435, _485, _483);
    float _493 = fma(_431, _485, _487);
    float _495 = fma(_433, _485, _489);
    bool _497 = !_465;
    float _499 = _477;
    if (!_497)
    {
        float _501 = in.m_56.w;
        float _503 = gl_FragCoord.w;
        float _505 = _501 * _503;
        float _507 = in.m_56.z;
        float _509 = gl_FragCoord.w;
        float _511 = _507 * _509;
        float _513 = _77 * _505;
        float _515 = _77 * _511;
        float _517 = 1.0 / _513;
        float _519 = _515 * _517;
        float _521 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _523 = fma(_519, (*spvDescriptorSet0.fp_c8)._m0[30].w, _521);
        float _525 = 1.0 / _523;
        float _527 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _529 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _531 = fma(_525, _527, _529);
        float _533 = _531 * 8.0;
        float _535 = precise::clamp(_533, 0.0, 1.0);
        float _537 = _477 * _535;
        _499 = _537;
    }
    float _539 = _499;
    float _541 = 0.0 + _539;
    float _543 = precise::clamp(_541, 0.0, 1.0);
    out.m_52.x = _493;
    out.m_52.y = _495;
    out.m_52.z = _491;
    out.m_52.w = _543;
    return out;
}

