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
    texture2d_array<float> fp_t_tcb_8 [[id(5)]];
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
    float4 m_58 [[color(0)]];
};

struct main0_in
{
    float4 m_51 [[user(locn0)]];
    float4 m_55 [[user(locn1)]];
    float4 m_53 [[user(locn2)]];
    float4 m_62 [[user(locn3)]];
    float4 m_49 [[user(locn4), flat]];
    float4 m_47 [[user(locn5)]];
    float4 m_45 [[user(locn6)]];
    float4 m_43 [[user(locn7), flat]];
    float4 m_60 [[user(locn8)]];
    float4 m_64 [[user(locn9)]];
    float4 m_66 [[user(locn10)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _73 = gl_FragCoord.w;
    float _75 = in.m_43.x;
    float _77 = in.m_45.w;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[22].x;
    float _85 = in.m_45.x;
    float _87 = gl_FragCoord.w;
    float _89 = _85 * _87;
    float _91 = in.m_45.y;
    float _93 = gl_FragCoord.w;
    float _95 = _91 * _93;
    float _97 = in.m_47.x;
    float _99 = gl_FragCoord.w;
    float _101 = _97 * _99;
    float _103 = in.m_47.y;
    float _105 = gl_FragCoord.w;
    float _107 = _103 * _105;
    float _109 = 1.0 / _73;
    float _111 = _75 + 1.0;
    float _113 = _111 * _83;
    float _115 = rint(_75);
    float _117 = precise::max(_115, 0.0);
    uint _120 = uint(_117);
    uint _122 = clamp(_120, 0u, 65535u);
    float _124 = _109 * _81;
    float _126 = floor(_113);
    float _128 = _109 * _89;
    float _130 = _109 * _101;
    float _132 = 1.0 / _124;
    float _134 = -_126;
    float _136 = fma(_134, (*spvDescriptorSet0.fp_c9)._m0[22].x, _111);
    float _138 = _109 * _95;
    float _140 = rint(_136);
    float _142 = precise::max(_140, 0.0);
    uint _144 = uint(_142);
    uint _146 = clamp(_144, 0u, 65535u);
    float _148 = _128 * _132;
    float _150 = _138 * _132;
    float _152 = _109 * _107;
    float2 _680 = float2(_148, _150);
    float _154 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_680, float2(0.0), isnan(_680))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_680, float2(0.0), isnan(_680))).x;
    float3 _693 = float3(_130, _152, float(int(_122)));
    float3 _697 = select(_693, float3(0.0), isnan(_693));
    float4 _157 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _697.xy, uint(rint(_697.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _697.xy, uint(rint(_697.z))).xyzw;
    float _159 = _157.x;
    float _161 = _157.y;
    float _163 = _157.z;
    float _165 = _157.w;
    float3 _714 = float3(_130, _152, float(int(_146)));
    float3 _716 = select(_714, float3(0.0), isnan(_714));
    float4 _167 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _716.xy, uint(rint(_716.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _716.xy, uint(rint(_716.z))).xyzw;
    float _169 = _167.x;
    float _171 = _167.y;
    float _173 = _167.z;
    float _175 = _167.w;
    float _177 = in.m_49.y;
    float _179 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[22].y;
    float _181 = in.m_45.z;
    float _183 = gl_FragCoord.w;
    float _185 = _181 * _183;
    float _187 = in.m_51.w;
    float _189 = gl_FragCoord.w;
    float _191 = _187 * _189;
    float _193 = _177 * _179;
    float _195 = _193 * _179;
    float _197 = floor(_195);
    float _199 = _109 * _185;
    float _201 = in.m_53.x;
    float _203 = gl_FragCoord.w;
    float _205 = _201 * _203;
    float _207 = _199 * _132;
    float _209 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _211 = fma(_207, (*spvDescriptorSet0.fp_c8)._m0[30].w, _209);
    float _213 = 1.0 / _211;
    float _215 = -_197;
    float _217 = fma(_215, (*spvDescriptorSet0.fp_c9)._m0[22].y, _193);
    float _219 = _217 + 9.9999997473787516355514526367188e-05;
    float _221 = floor(_219);
    float _223 = -_221;
    float _225 = _219 + _223;
    float _227 = in.m_55.x;
    float _229 = gl_FragCoord.w;
    float _231 = _227 * _229;
    float _233 = in.m_55.y;
    float _235 = gl_FragCoord.w;
    float _237 = _233 * _235;
    float _239 = in.m_55.z;
    float _241 = gl_FragCoord.w;
    float _243 = _239 * _241;
    float _245 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _247 = fma(_154, (*spvDescriptorSet0.fp_c8)._m0[30].w, _245);
    float _249 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _251 = -_165;
    float _253 = _251 + _175;
    float _255 = 1.0 / _247;
    float _257 = fma(_225, _253, _165);
    float _259 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _261 = _213 * _259;
    float _263 = _109 * _191;
    float _265 = _257 * _263;
    float _267 = 0.0 + _265;
    float _269 = precise::clamp(_267, 0.0, 1.0);
    float _271 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _273 = -_261;
    float _275 = fma(_255, _271, _273);
    float _277 = _275 * _249;
    float _279 = precise::clamp(_277, 0.0, 1.0);
    float _281 = _109 * _205;
    float _283 = _269 * _279;
    float _285 = _283 * _281;
    bool _289 = _285 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _291 = isnan(_285);
    bool _293 = _289 || _291;
    bool _295 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _297 = _293 || _295;
    float _299 = in.m_51.x;
    float _301 = gl_FragCoord.w;
    float _303 = _299 * _301;
    float _305 = in.m_51.y;
    float _307 = gl_FragCoord.w;
    float _309 = _305 * _307;
    float _311 = in.m_51.z;
    float _313 = gl_FragCoord.w;
    float _315 = _311 * _313;
    float _317 = _109;
    if (!_297)
    {
        discard_fragment();
    }
    float _319 = -_161;
    float _321 = _319 + _171;
    float _323 = -_159;
    float _325 = _323 + _169;
    float _327 = _109 * _231;
    float _329 = -_163;
    float _331 = _329 + _173;
    float _333 = fma(_225, _321, _161);
    float _335 = fma(_225, _325, _159);
    float _337 = _109 * _237;
    float _339 = fma(_225, _331, _163);
    float _341 = _109 * _303;
    float _343 = _109 * _309;
    float _345 = _109 * _315;
    float _347 = _109 * _243;
    float _349 = -_327;
    float _351 = _341 + _349;
    float _353 = -_337;
    float _355 = _343 + _353;
    float _357 = -_347;
    float _359 = _345 + _357;
    float _361 = fma(_335, _351, _327);
    float _363 = fma(_333, _355, _337);
    float _365 = fma(_339, _359, _347);
    if (!_297)
    {
        out.m_58.x = _361;
        out.m_58.y = _363;
        out.m_58.z = _365;
        out.m_58.w = _265;
        return out;
    }
    float _367 = in.m_60.y;
    float _369 = gl_FragCoord.w;
    float _371 = _367 * _369;
    float _373 = in.m_60.x;
    float _375 = gl_FragCoord.w;
    float _377 = _373 * _375;
    float _379 = in.m_60.z;
    float _381 = gl_FragCoord.w;
    float _383 = _379 * _381;
    float _385 = _109 * _371;
    float _387 = _109 * _377;
    float _389 = _109 * _383;
    float _391 = _385 * _385;
    float _393 = fma(_387, _387, _391);
    float _395 = fma(_389, _389, _393);
    float _397 = rsqrt(_395);
    float _399 = _387 * _397;
    float _401 = _385 * _397;
    float _403 = _389 * _397;
    float _405 = abs(_399);
    float _407 = abs(_401);
    float _409 = precise::max(_405, _407);
    float _411 = abs(_403);
    float _413 = precise::max(_411, _409);
    float _415 = 1.0 / _413;
    float _417 = _399 * _415;
    float _419 = _401 * _415;
    float _421 = -_415;
    float _423 = _403 * _421;
    float3 _1087 = float3(_417, _419, _423);
    float3 _427 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1087, float3(0.0), isnan(_1087)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1087, float3(0.0), isnan(_1087)), level(0.0)).xyz;
    float _429 = _427.x;
    float _431 = _427.y;
    float _433 = _427.z;
    float _435 = in.m_62.x;
    float _437 = gl_FragCoord.w;
    float _439 = _435 * _437;
    float _441 = in.m_62.z;
    float _443 = gl_FragCoord.w;
    float _445 = _441 * _443;
    float _447 = in.m_62.y;
    float _449 = gl_FragCoord.w;
    float _451 = _447 * _449;
    float _453 = in.m_64.x;
    float _455 = gl_FragCoord.w;
    float _457 = _453 * _455;
    float _459 = in.m_64.y;
    float _461 = gl_FragCoord.w;
    float _463 = _459 * _461;
    float _465 = in.m_64.z;
    float _467 = gl_FragCoord.w;
    float _469 = _465 * _467;
    float _471 = in.m_66.x;
    float _473 = gl_FragCoord.w;
    float _475 = _471 * _473;
    float _477 = in.m_66.y;
    float _479 = gl_FragCoord.w;
    float _481 = _477 * _479;
    float _483 = in.m_66.z;
    float _485 = gl_FragCoord.w;
    float _487 = _483 * _485;
    float _489 = in.m_66.w;
    float _491 = gl_FragCoord.w;
    float _493 = _489 * _491;
    bool _495 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _497 = _109 * _439;
    float _499 = _109 * _451;
    float _501 = _109 * _457;
    float _503 = _109 * _463;
    float _505 = _109 * _469;
    float _507 = _109 * _481;
    float _509 = _109 * _487;
    float _511 = _109 * _493;
    float _513 = fma(_429, 0.20999999344348907470703125, _497);
    float _515 = _109 * _445;
    float _517 = _109 * _475;
    float _519 = fma(_431, 0.20999999344348907470703125, _499);
    if (_495)
    {
        float _521 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _523 = _261 + _521;
        _317 = _523;
    }
    float _525 = _317;
    float _527 = fma(_433, 0.20999999344348907470703125, _515);
    float _529 = _513 + _501;
    float _531 = _519 + _503;
    float _533 = _525;
    if (_495)
    {
        float _535 = _525 * 8.0;
        float _537 = precise::clamp(_535, 0.0, 1.0);
        _533 = _537;
    }
    float _539 = _533;
    float _541 = _527 + _505;
    float _543 = 0.0 + _285;
    float _545 = precise::clamp(_543, 0.0, 1.0);
    float _547 = _361 * _529;
    float _549 = _363 * _531;
    float _551 = _365 * _541;
    float _553 = _545;
    if (_495)
    {
        float _555 = _545 * _539;
        _553 = _555;
    }
    float _557 = _553;
    float _559 = fma(_547, _511, _517);
    float _561 = fma(_549, _511, _507);
    float _563 = fma(_551, _511, _509);
    float _565 = 0.0 + _557;
    float _567 = precise::clamp(_565, 0.0, 1.0);
    out.m_58.x = _559;
    out.m_58.y = _561;
    out.m_58.z = _563;
    out.m_58.w = _567;
    return out;
}

