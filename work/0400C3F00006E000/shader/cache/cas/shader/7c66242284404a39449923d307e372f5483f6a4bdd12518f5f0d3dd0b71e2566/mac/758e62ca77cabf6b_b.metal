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
    constant _16* fp_c3 [[id(0)]];
    texture2d<float> fp_t_tcb_8 [[id(1)]];
    sampler fp_t_tcb_8Smplr [[id(2)]];
    sampler fp_t_tcb_8Smplr_w [[id(3)]];
    constant dm_border_t* dm_border [[id(4)]];
};

struct main0_out
{
    float4 m_32 [[color(0)]];
};

struct main0_in
{
    float4 m_29 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _4996 = false;
    bool _4978 = false;
    bool _4834 = false;
    bool _4816 = false;
    bool _4672 = false;
    bool _4654 = false;
    bool _4510 = false;
    bool _4492 = false;
    bool _4348 = false;
    bool _4330 = false;
    bool _4186 = false;
    bool _4168 = false;
    bool _4024 = false;
    bool _4006 = false;
    bool _3862 = false;
    bool _3844 = false;
    bool _3700 = false;
    bool _3682 = false;
    bool _3538 = false;
    bool _3520 = false;
    bool _3376 = false;
    bool _3358 = false;
    bool _3214 = false;
    bool _3196 = false;
    bool _3052 = false;
    bool _3034 = false;
    bool _2890 = false;
    bool _2872 = false;
    bool _2728 = false;
    bool _2710 = false;
    bool _2600 = false;
    bool _2566 = false;
    float _39 = gl_FragCoord.w;
    float _41 = in.m_29.x;
    float _43 = gl_FragCoord.w;
    float _45 = _41 * _43;
    float _47 = in.m_29.y;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = 1.0 / _39;
    float _55 = _53 * _45;
    float _57 = _53 * _51;
    float2 _6026 = float2(_55, _57);
    float3 _61 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6026, float2(0.0), isnan(_6026)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6026, float2(0.0), isnan(_6026)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1, 0)).xyz;
    float _63 = _61.x;
    float _65 = _61.y;
    float _67 = _61.z;
    float2 _6048 = float2(_55, _57);
    float3 _69 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6048, float2(0.0), isnan(_6048)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6048, float2(0.0), isnan(_6048)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyz;
    float _71 = _69.x;
    float _73 = _69.y;
    float _75 = _69.z;
    float2 _6064 = float2(_55, _57);
    float3 _77 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6064, float2(0.0), isnan(_6064)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6064, float2(0.0), isnan(_6064)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2, 0)).xyz;
    float _79 = _77.x;
    float _81 = _77.y;
    float _83 = _77.z;
    float2 _6082 = float2(_55, _57);
    float3 _85 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6082, float2(0.0), isnan(_6082)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6082, float2(0.0), isnan(_6082)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3, 0)).xyz;
    float _87 = _85.x;
    float _89 = _85.y;
    float _91 = _85.z;
    float2 _6099 = float2(_55, _57);
    float3 _93 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6099, float2(0.0), isnan(_6099)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(0, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6099, float2(0.0), isnan(_6099)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(0, 1)).xyz;
    float _95 = _93.x;
    float _97 = _93.y;
    float _99 = _93.z;
    float2 _6116 = float2(_55, _57);
    float3 _101 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6116, float2(0.0), isnan(_6116)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6116, float2(0.0), isnan(_6116)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1)).xyz;
    float _103 = _101.x;
    float _105 = _101.y;
    float _107 = _101.z;
    float2 _6133 = float2(_55, _57);
    float3 _109 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6133, float2(0.0), isnan(_6133)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6133, float2(0.0), isnan(_6133)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2, 1)).xyz;
    float _111 = _109.x;
    float _113 = _109.y;
    float _115 = _109.z;
    float2 _6150 = float2(_55, _57);
    float3 _117 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6150, float2(0.0), isnan(_6150)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6150, float2(0.0), isnan(_6150)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3, 1)).xyz;
    float _119 = _117.x;
    float _121 = _117.y;
    float _123 = _117.z;
    float2 _6167 = float2(_55, _57);
    float3 _125 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6167, float2(0.0), isnan(_6167)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(0, 2)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6167, float2(0.0), isnan(_6167)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(0, 2)).xyz;
    float _127 = _125.x;
    float _129 = _125.y;
    float _131 = _125.z;
    float2 _6184 = float2(_55, _57);
    float3 _133 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6184, float2(0.0), isnan(_6184)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1, 2)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6184, float2(0.0), isnan(_6184)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1, 2)).xyz;
    float _135 = _133.x;
    float _137 = _133.y;
    float _139 = _133.z;
    float2 _6201 = float2(_55, _57);
    float3 _141 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6201, float2(0.0), isnan(_6201)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6201, float2(0.0), isnan(_6201)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2)).xyz;
    float _143 = _141.x;
    float _145 = _141.y;
    float _147 = _141.z;
    float2 _6218 = float2(_55, _57);
    float3 _149 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6218, float2(0.0), isnan(_6218)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3, 2)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6218, float2(0.0), isnan(_6218)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3, 2)).xyz;
    float _151 = _149.x;
    float _153 = _149.y;
    float _155 = _149.z;
    float2 _6235 = float2(_55, _57);
    float3 _157 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6235, float2(0.0), isnan(_6235)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(0, 3)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6235, float2(0.0), isnan(_6235)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(0, 3)).xyz;
    float _159 = _157.x;
    float _161 = _157.y;
    float _163 = _157.z;
    float2 _6252 = float2(_55, _57);
    float3 _165 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6252, float2(0.0), isnan(_6252)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1, 3)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6252, float2(0.0), isnan(_6252)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1, 3)).xyz;
    float _167 = _165.x;
    float _169 = _165.y;
    float _171 = _165.z;
    float2 _6269 = float2(_55, _57);
    float3 _173 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6269, float2(0.0), isnan(_6269)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2, 3)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6269, float2(0.0), isnan(_6269)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2, 3)).xyz;
    float _175 = _173.x;
    float _177 = _173.y;
    float _179 = _173.z;
    float2 _6286 = float2(_55, _57);
    float3 _181 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6286, float2(0.0), isnan(_6286)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6286, float2(0.0), isnan(_6286)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3)).xyz;
    float _183 = _181.x;
    float _185 = _181.y;
    float _187 = _181.z;
    float _189 = _73 + _65;
    float _191 = _71 + _63;
    float _193 = _75 + _67;
    float _195 = _81 + _189;
    float _197 = _79 + _191;
    float _199 = _83 + _193;
    float _201 = _89 + _195;
    float _203 = _87 + _197;
    float _205 = _91 + _199;
    float _207 = _97 + _201;
    float _209 = _95 + _203;
    float _211 = _99 + _205;
    float _213 = _105 + _207;
    float _215 = _103 + _209;
    float _217 = _107 + _211;
    float _219 = _113 + _213;
    float _221 = _111 + _215;
    float _223 = _115 + _217;
    float _225 = _121 + _219;
    float _227 = _119 + _221;
    float _229 = _123 + _223;
    float _231 = _129 + _225;
    float _233 = _127 + _227;
    float _235 = _131 + _229;
    float _237 = _137 + _231;
    float _239 = _135 + _233;
    float _241 = _139 + _235;
    float _243 = _145 + _237;
    float _245 = _143 + _239;
    float _247 = _147 + _241;
    float _249 = _153 + _243;
    float _251 = _151 + _245;
    float _253 = _155 + _247;
    float _255 = _161 + _249;
    float _257 = _159 + _251;
    float _259 = _163 + _253;
    float _261 = _169 + _255;
    float _263 = _167 + _257;
    float _265 = _171 + _259;
    float _267 = _177 + _261;
    float _269 = _175 + _263;
    float _271 = _179 + _265;
    float _273 = _185 + _267;
    float _275 = _183 + _269;
    float _277 = _187 + _271;
    float _279 = fma(_273, -0.0625, _65);
    float _281 = fma(_275, -0.0625, _63);
    float _283 = fma(_277, -0.0625, _67);
    float _285 = fma(_273, -0.0625, _73);
    float _287 = fma(_275, -0.0625, _71);
    float _289 = _281 * _279;
    float _291 = _281 * _281;
    float _293 = fma(_277, -0.0625, _75);
    float _295 = _279 * _279;
    float _297 = _279 * _283;
    float _299 = _281 * _283;
    float _301 = fma(_287, _285, _289);
    float _303 = fma(_285, _285, _295);
    float _305 = fma(_285, _293, _297);
    float _307 = fma(_287, _287, _291);
    float _309 = fma(_287, _293, _299);
    float _311 = _283 * _283;
    float _313 = fma(_273, -0.0625, _81);
    float _315 = fma(_275, -0.0625, _79);
    float _317 = fma(_277, -0.0625, _83);
    float _319 = fma(_293, _293, _311);
    float _321 = fma(_313, _313, _303);
    float _323 = fma(_315, _313, _301);
    float _325 = fma(_313, _317, _305);
    float _327 = fma(_315, _315, _307);
    float _329 = fma(_315, _317, _309);
    float _331 = fma(_273, -0.0625, _89);
    float _333 = fma(_275, -0.0625, _87);
    float _335 = fma(_277, -0.0625, _91);
    float _337 = fma(_317, _317, _319);
    float _339 = fma(_331, _331, _321);
    float _341 = fma(_333, _331, _323);
    float _343 = fma(_331, _335, _325);
    float _345 = fma(_333, _333, _327);
    float _347 = fma(_333, _335, _329);
    float _349 = fma(_273, -0.0625, _97);
    float _351 = fma(_275, -0.0625, _95);
    float _353 = fma(_277, -0.0625, _99);
    float _355 = fma(_335, _335, _337);
    float _357 = fma(_349, _349, _339);
    float _359 = fma(_351, _349, _341);
    float _361 = fma(_349, _353, _343);
    float _363 = fma(_351, _351, _345);
    float _365 = fma(_351, _353, _347);
    float _367 = fma(_273, -0.0625, _105);
    float _369 = fma(_275, -0.0625, _103);
    float _371 = fma(_277, -0.0625, _107);
    float _373 = fma(_353, _353, _355);
    float _375 = fma(_367, _367, _357);
    float _377 = fma(_369, _367, _359);
    float _379 = fma(_367, _371, _361);
    float _381 = fma(_369, _369, _363);
    float _383 = fma(_369, _371, _365);
    float _385 = fma(_273, -0.0625, _113);
    float _387 = fma(_275, -0.0625, _111);
    float _389 = fma(_277, -0.0625, _115);
    float _391 = fma(_371, _371, _373);
    float _393 = fma(_385, _385, _375);
    float _395 = fma(_387, _385, _377);
    float _397 = fma(_385, _389, _379);
    float _399 = fma(_387, _387, _381);
    float _401 = fma(_387, _389, _383);
    float _403 = fma(_273, -0.0625, _121);
    float _405 = fma(_275, -0.0625, _119);
    float _407 = fma(_277, -0.0625, _123);
    float _409 = fma(_389, _389, _391);
    float _411 = fma(_403, _403, _393);
    float _413 = fma(_405, _403, _395);
    float _415 = fma(_403, _407, _397);
    float _417 = fma(_405, _405, _399);
    float _419 = fma(_405, _407, _401);
    float _421 = fma(_273, -0.0625, _129);
    float _423 = fma(_275, -0.0625, _127);
    float _425 = fma(_277, -0.0625, _131);
    float _427 = fma(_407, _407, _409);
    float _429 = fma(_421, _421, _411);
    float _431 = fma(_423, _421, _413);
    float _433 = fma(_421, _425, _415);
    float _435 = fma(_423, _423, _417);
    float _437 = fma(_423, _425, _419);
    float _439 = fma(_273, -0.0625, _137);
    float _441 = fma(_275, -0.0625, _135);
    float _443 = fma(_277, -0.0625, _139);
    float _445 = fma(_425, _425, _427);
    float _447 = fma(_439, _439, _429);
    float _449 = fma(_441, _439, _431);
    float _451 = fma(_439, _443, _433);
    float _453 = fma(_441, _441, _435);
    float _455 = fma(_441, _443, _437);
    float _457 = fma(_273, -0.0625, _145);
    float _459 = fma(_275, -0.0625, _143);
    float _461 = fma(_277, -0.0625, _147);
    float _463 = fma(_443, _443, _445);
    float _465 = fma(_457, _457, _447);
    float _467 = fma(_459, _457, _449);
    float _469 = fma(_457, _461, _451);
    float _471 = fma(_459, _459, _453);
    float _473 = fma(_459, _461, _455);
    float _475 = fma(_273, -0.0625, _153);
    float _477 = fma(_275, -0.0625, _151);
    float _479 = fma(_277, -0.0625, _155);
    float _481 = fma(_461, _461, _463);
    float _483 = fma(_475, _475, _465);
    float _485 = fma(_477, _475, _467);
    float _487 = fma(_475, _479, _469);
    float _489 = fma(_477, _477, _471);
    float _491 = fma(_477, _479, _473);
    float _493 = fma(_273, -0.0625, _161);
    float _495 = fma(_275, -0.0625, _159);
    float _497 = fma(_277, -0.0625, _163);
    float _499 = fma(_479, _479, _481);
    float _501 = fma(_493, _493, _483);
    float _503 = fma(_495, _493, _485);
    float _505 = fma(_493, _497, _487);
    float _507 = fma(_495, _495, _489);
    float _509 = fma(_495, _497, _491);
    float _511 = fma(_273, -0.0625, _169);
    float _513 = fma(_275, -0.0625, _167);
    float _515 = fma(_277, -0.0625, _171);
    float _517 = fma(_497, _497, _499);
    float _519 = fma(_511, _511, _501);
    float _521 = fma(_513, _511, _503);
    float _523 = fma(_511, _515, _505);
    float _525 = fma(_513, _513, _507);
    float _527 = fma(_513, _515, _509);
    float _529 = fma(_273, -0.0625, _177);
    float _531 = fma(_275, -0.0625, _175);
    float _533 = fma(_277, -0.0625, _179);
    float _535 = fma(_273, -0.0625, _185);
    float _537 = fma(_529, _529, _519);
    float _539 = fma(_531, _529, _521);
    float _541 = fma(_275, -0.0625, _183);
    float _543 = fma(_529, _533, _523);
    float _545 = fma(_277, -0.0625, _187);
    float _547 = fma(_531, _531, _525);
    float _549 = fma(_535, _535, _537);
    float _551 = fma(_541, _535, _539);
    float _553 = fma(_515, _515, _517);
    float _555 = fma(_531, _533, _527);
    float _557 = fma(_535, _545, _543);
    float _559 = fma(_541, _541, _547);
    float _561 = _549 + _551;
    float _563 = fma(_533, _533, _553);
    float _565 = fma(_541, _545, _555);
    float _567 = _559 + _551;
    float _569 = _557 + _561;
    float _571 = fma(_545, _545, _563);
    float _573 = _557 + _565;
    float _575 = _565 + _567;
    float _577 = _569 * _569;
    float _579 = _571 + _573;
    float _581 = fma(_575, _575, _577);
    float _583 = fma(_579, _579, _581);
    float _585 = rsqrt(_583);
    float _587 = _569 * _585;
    float _589 = _575 * _585;
    float _591 = _579 * _585;
    float _593 = _549 * _587;
    float _595 = _551 * _587;
    float _597 = fma(_551, _589, _593);
    float _599 = _557 * _587;
    float _601 = fma(_559, _589, _595);
    float _603 = fma(_557, _591, _597);
    float _605 = fma(_565, _589, _599);
    float _607 = fma(_565, _591, _601);
    float _609 = _603 * _603;
    float _611 = fma(_571, _591, _605);
    float _613 = fma(_607, _607, _609);
    float _615 = fma(_611, _611, _613);
    float _617 = rsqrt(_615);
    float _619 = _603 * _617;
    float _621 = _607 * _617;
    float _623 = _611 * _617;
    float _625 = _549 * _619;
    float _627 = _551 * _619;
    float _629 = _557 * _619;
    float _631 = fma(_551, _621, _625);
    float _633 = fma(_559, _621, _627);
    float _635 = fma(_565, _621, _629);
    float _637 = fma(_557, _623, _631);
    float _639 = fma(_565, _623, _633);
    float _641 = fma(_571, _623, _635);
    float _643 = _637 * _637;
    float _645 = fma(_639, _639, _643);
    float _647 = fma(_641, _641, _645);
    float _649 = rsqrt(_647);
    float _651 = _637 * _649;
    float _653 = _639 * _649;
    float _655 = _641 * _649;
    float _657 = _549 * _651;
    float _659 = _551 * _651;
    float _661 = _557 * _651;
    float _663 = fma(_551, _653, _657);
    float _665 = fma(_559, _653, _659);
    float _667 = fma(_565, _653, _661);
    float _669 = fma(_557, _655, _663);
    float _671 = fma(_565, _655, _665);
    float _673 = fma(_571, _655, _667);
    float _675 = _669 * _669;
    float _677 = fma(_671, _671, _675);
    float _679 = fma(_673, _673, _677);
    float _681 = rsqrt(_679);
    float _683 = _669 * _681;
    float _685 = _671 * _681;
    float _687 = _673 * _681;
    float _689 = _549 * _683;
    float _691 = _551 * _683;
    float _693 = _557 * _683;
    float _695 = fma(_551, _685, _689);
    float _697 = fma(_559, _685, _691);
    float _699 = fma(_565, _685, _693);
    float _701 = fma(_557, _687, _695);
    float _703 = fma(_565, _687, _697);
    float _705 = fma(_571, _687, _699);
    float _707 = _701 * _701;
    float _709 = fma(_703, _703, _707);
    float _711 = fma(_705, _705, _709);
    float _713 = rsqrt(_711);
    float _715 = _701 * _713;
    float _717 = _703 * _713;
    float _719 = _705 * _713;
    float _721 = _549 * _715;
    float _723 = _551 * _715;
    float _725 = _557 * _715;
    float _727 = fma(_551, _717, _721);
    float _729 = fma(_559, _717, _723);
    float _731 = fma(_565, _717, _725);
    float _733 = fma(_557, _719, _727);
    float _735 = fma(_565, _719, _729);
    float _737 = fma(_571, _719, _731);
    float _739 = _733 * _733;
    float _741 = fma(_735, _735, _739);
    float _743 = fma(_737, _737, _741);
    float _745 = rsqrt(_743);
    float _747 = _733 * _745;
    float _749 = _735 * _745;
    float _751 = _737 * _745;
    float _753 = _549 * _747;
    float _755 = _551 * _747;
    float _757 = _557 * _747;
    float _759 = fma(_551, _749, _753);
    float _761 = fma(_559, _749, _755);
    float _763 = fma(_565, _749, _757);
    float _765 = fma(_557, _751, _759);
    float _767 = fma(_565, _751, _761);
    float _769 = fma(_571, _751, _763);
    float _771 = _765 * _765;
    float _773 = fma(_767, _767, _771);
    float _775 = fma(_769, _769, _773);
    float _777 = rsqrt(_775);
    float _779 = _765 * _777;
    float _781 = _767 * _777;
    float _783 = _769 * _777;
    float _785 = _549 * _779;
    float _787 = _551 * _779;
    float _789 = fma(_551, _781, _785);
    float _791 = _557 * _779;
    float _793 = fma(_559, _781, _787);
    float _795 = fma(_557, _783, _789);
    float _797 = fma(_565, _781, _791);
    float _799 = fma(_565, _783, _793);
    float _801 = _795 * _795;
    float _803 = fma(_571, _783, _797);
    float _805 = fma(_799, _799, _801);
    float _807 = fma(_803, _803, _805);
    float _809 = rsqrt(_807);
    float _811 = _795 * _809;
    float _813 = _799 * _809;
    float _815 = _803 * _809;
    float _817 = _73 * _811;
    float _819 = _65 * _811;
    float _821 = _81 * _811;
    float _823 = fma(_71, _813, _817);
    float _825 = fma(_63, _813, _819);
    float _827 = fma(_79, _813, _821);
    float _829 = fma(_75, _815, _823);
    float _831 = fma(_67, _815, _825);
    float _833 = fma(_83, _815, _827);
    bool _837 = _829 >= _831;
    bool _839 = isnan(_829);
    bool _841 = _837 || _839;
    bool _843 = isnan(_831);
    bool _845 = _841 || _843;
    float _847 = _543;
    float _849 = _823;
    float _851 = _827;
    float _853 = _825;
    float _855 = _821;
    float _857 = _781;
    float _859 = _769;
    float _861 = _779;
    float _863 = _829;
    float _865 = _753;
    float _867 = _833;
    float _869 = _833;
    float _871 = _815;
    float _873 = _813;
    if (!_845)
    {
        _847 = _63;
    }
    float _875 = _847;
    float _877 = _875;
    float _879 = _875;
    if (!_845)
    {
        _849 = _65;
    }
    float _881 = _849;
    float _883 = _881;
    float _885 = _881;
    if (!_845)
    {
        _851 = _67;
    }
    float _887 = _851;
    float _889 = _887;
    float _891 = _887;
    if (!_845)
    {
        _853 = _829;
    }
    float _893 = _853;
    float _895 = _893;
    float _897 = _893;
    if (!_845)
    {
        _855 = _831;
    }
    float _899 = _855;
    float _901 = _899;
    float _903 = _899;
    if (!_845)
    {
        _857 = _71;
    }
    float _905 = _857;
    float _907 = _905;
    float _909 = _905;
    if (!_845)
    {
        _859 = _73;
    }
    float _911 = _859;
    float _913 = _911;
    float _915 = _911;
    if (!_845)
    {
        _861 = _75;
    }
    float _917 = _861;
    bool _919 = !_845;
    float _921 = _917;
    float _923 = _917;
    if (!_919)
    {
        bool _925 = _829 > _831;
        if (!_925)
        {
            _895 = _829;
        }
        float _927 = _895;
        float _929 = _927;
        if (!_925)
        {
            _901 = _829;
        }
        float _931 = _901;
        float _933 = _931;
        if (!_925)
        {
            _907 = _71;
        }
        float _935 = _907;
        float _937 = _935;
        if (!_925)
        {
            _913 = _73;
        }
        float _939 = _913;
        float _941 = _939;
        if (!_925)
        {
            _921 = _75;
        }
        float _943 = _921;
        float _945 = _943;
        if (!_925)
        {
            _877 = _71;
        }
        float _947 = _877;
        float _949 = _947;
        if (!_925)
        {
            _883 = _73;
        }
        float _951 = _883;
        float _953 = _951;
        if (!_925)
        {
            _889 = _75;
        }
        float _955 = _889;
        _891 = _955;
        if (_925)
        {
            _929 = _831;
        }
        float _957 = _929;
        _897 = _957;
        if (_925)
        {
            _933 = _829;
        }
        float _959 = _933;
        _903 = _959;
        if (_925)
        {
            _937 = _63;
        }
        float _961 = _937;
        _909 = _961;
        if (_925)
        {
            _941 = _65;
        }
        float _963 = _941;
        _915 = _963;
        if (_925)
        {
            _945 = _67;
        }
        float _965 = _945;
        _923 = _965;
        if (_925)
        {
            _949 = _71;
        }
        float _967 = _949;
        _879 = _967;
        if (_925)
        {
            _953 = _73;
        }
        float _969 = _953;
        _885 = _969;
        if (_925)
        {
            _891 = _75;
        }
    }
    float _971 = _903;
    float _973 = _897;
    float _975 = _879;
    float _977 = _885;
    float _979 = _891;
    float _981 = _909;
    float _983 = _915;
    float _985 = _923;
    bool _987 = _971 >= _833;
    bool _989 = isnan(_971);
    bool _991 = _987 || _989;
    bool _993 = isnan(_833);
    bool _995 = _991 || _993;
    float _997 = _89 * _811;
    float _999 = fma(_87, _813, _997);
    float _1001 = fma(_91, _815, _999);
    float _1003 = _999;
    float _1005 = _973;
    float _1007 = _981;
    float _1009 = _983;
    float _1011 = _973;
    float _1013 = _981;
    float _1015 = _983;
    float _1017 = _985;
    float _1019 = _979;
    float _1021 = _977;
    float _1023 = _1001;
    float _1025 = _1001;
    if (!_995)
    {
        _863 = _79;
    }
    float _1027 = _863;
    float _1029 = _1027;
    float _1031 = _1027;
    if (!_995)
    {
        _1003 = _81;
    }
    float _1033 = _1003;
    float _1035 = _1033;
    float _1037 = _1033;
    if (!_995)
    {
        _865 = _83;
    }
    float _1039 = _865;
    bool _1041 = !_995;
    float _1043 = _1039;
    float _1045 = _1039;
    if (!_1041)
    {
        bool _1047 = _973 > _833;
        if (_1047)
        {
            _1005 = _833;
        }
        float _1049 = _1005;
        _1011 = _1049;
        if (!_1047)
        {
            _1029 = _975;
        }
        float _1051 = _1029;
        float _1053 = _1051;
        if (!_1047)
        {
            _1035 = _977;
        }
        float _1055 = _1035;
        float _1057 = _1055;
        if (!_1047)
        {
            _1043 = _979;
        }
        float _1059 = _1043;
        float _1061 = _1059;
        if (!_1047)
        {
            _867 = _971;
        }
        float _1063 = _867;
        float _1065 = _1063;
        if (_1047)
        {
            _1053 = _975;
        }
        float _1067 = _1053;
        _1031 = _1067;
        if (_1047)
        {
            _1057 = _977;
        }
        float _1069 = _1057;
        _1037 = _1069;
        if (_1047)
        {
            _1061 = _979;
        }
        float _1071 = _1061;
        _1045 = _1071;
        if (_1047)
        {
            _1065 = _971;
        }
        float _1073 = _1065;
        _869 = _1073;
        if (_1047)
        {
            _1007 = _79;
        }
        float _1075 = _1007;
        _1013 = _1075;
        if (_1047)
        {
            _1009 = _81;
        }
        float _1077 = _1009;
        _1015 = _1077;
        if (_1047)
        {
            _1017 = _83;
        }
    }
    float _1079 = _869;
    float _1081 = _1011;
    float _1083 = _1031;
    float _1085 = _1037;
    float _1087 = _1045;
    float _1089 = _1013;
    float _1091 = _1015;
    float _1093 = _1017;
    bool _1095 = _1079 >= _1001;
    bool _1097 = isnan(_1079);
    bool _1099 = _1095 || _1097;
    bool _1101 = isnan(_1001);
    bool _1103 = _1099 || _1101;
    float _1105 = _97 * _811;
    float _1107 = fma(_95, _813, _1105);
    float _1109 = fma(_99, _815, _1107);
    float _1111 = _1105;
    float _1113 = _1081;
    float _1115 = _1089;
    float _1117 = _1091;
    float _1119 = _1081;
    float _1121 = _1089;
    float _1123 = _1091;
    float _1125 = _1093;
    float _1127 = _1083;
    float _1129 = _1087;
    float _1131 = _1109;
    float _1133 = _1109;
    if (!_1103)
    {
        _1111 = _87;
    }
    float _1135 = _1111;
    float _1137 = _1135;
    float _1139 = _1135;
    if (!_1103)
    {
        _1019 = _89;
    }
    float _1141 = _1019;
    float _1143 = _1141;
    float _1145 = _1141;
    if (!_1103)
    {
        _1021 = _91;
    }
    float _1147 = _1021;
    bool _1149 = !_1103;
    float _1151 = _1147;
    float _1153 = _1147;
    if (!_1149)
    {
        bool _1155 = _1081 > _1001;
        if (_1155)
        {
            _1113 = _1001;
        }
        float _1157 = _1113;
        _1119 = _1157;
        if (!_1155)
        {
            _1137 = _1083;
        }
        float _1159 = _1137;
        float _1161 = _1159;
        if (!_1155)
        {
            _1143 = _1085;
        }
        float _1163 = _1143;
        float _1165 = _1163;
        if (!_1155)
        {
            _1151 = _1087;
        }
        float _1167 = _1151;
        float _1169 = _1167;
        if (!_1155)
        {
            _1023 = _1079;
        }
        float _1171 = _1023;
        float _1173 = _1171;
        if (_1155)
        {
            _1161 = _1083;
        }
        float _1175 = _1161;
        _1139 = _1175;
        if (_1155)
        {
            _1165 = _1085;
        }
        float _1177 = _1165;
        _1145 = _1177;
        if (_1155)
        {
            _1169 = _1087;
        }
        float _1179 = _1169;
        _1153 = _1179;
        if (_1155)
        {
            _1173 = _1079;
        }
        float _1181 = _1173;
        _1025 = _1181;
        if (_1155)
        {
            _1115 = _87;
        }
        float _1183 = _1115;
        _1121 = _1183;
        if (_1155)
        {
            _1117 = _89;
        }
        float _1185 = _1117;
        _1123 = _1185;
        if (_1155)
        {
            _1125 = _91;
        }
    }
    float _1187 = _1025;
    float _1189 = _1119;
    float _1191 = _1139;
    float _1193 = _1145;
    float _1195 = _1153;
    float _1197 = _1121;
    float _1199 = _1123;
    float _1201 = _1125;
    bool _1203 = _1187 >= _1109;
    bool _1205 = isnan(_1187);
    bool _1207 = _1203 || _1205;
    bool _1209 = isnan(_1109);
    bool _1211 = _1207 || _1209;
    float _1213 = _105 * _811;
    float _1215 = fma(_103, _813, _1213);
    float _1217 = fma(_107, _815, _1215);
    float _1219 = _1215;
    float _1221 = _1189;
    float _1223 = _1197;
    float _1225 = _1199;
    float _1227 = _1189;
    float _1229 = _1197;
    float _1231 = _1199;
    float _1233 = _1201;
    float _1235 = _1193;
    float _1237 = _1195;
    float _1239 = _1217;
    float _1241 = _1217;
    float _1243 = _1187;
    if (!_1211)
    {
        _1127 = _95;
    }
    float _1245 = _1127;
    float _1247 = _1245;
    float _1249 = _1245;
    if (!_1211)
    {
        _1219 = _97;
    }
    float _1251 = _1219;
    float _1253 = _1251;
    float _1255 = _1251;
    if (!_1211)
    {
        _1129 = _99;
    }
    float _1257 = _1129;
    bool _1259 = !_1211;
    float _1261 = _1257;
    float _1263 = _1257;
    if (!_1259)
    {
        bool _1265 = _1189 > _1109;
        if (_1265)
        {
            _1221 = _1109;
        }
        float _1267 = _1221;
        _1227 = _1267;
        if (!_1265)
        {
            _1247 = _1191;
        }
        float _1269 = _1247;
        float _1271 = _1269;
        if (!_1265)
        {
            _1253 = _1193;
        }
        float _1273 = _1253;
        float _1275 = _1273;
        if (!_1265)
        {
            _1261 = _1195;
        }
        float _1277 = _1261;
        float _1279 = _1277;
        if (!_1265)
        {
            _1131 = _1187;
        }
        float _1281 = _1131;
        float _1283 = _1281;
        if (_1265)
        {
            _1271 = _1191;
        }
        float _1285 = _1271;
        _1249 = _1285;
        if (_1265)
        {
            _1275 = _1193;
        }
        float _1287 = _1275;
        _1255 = _1287;
        if (_1265)
        {
            _1279 = _1195;
        }
        float _1289 = _1279;
        _1263 = _1289;
        if (_1265)
        {
            _1283 = _1187;
        }
        float _1291 = _1283;
        _1133 = _1291;
        if (_1265)
        {
            _1223 = _95;
        }
        float _1293 = _1223;
        _1229 = _1293;
        if (_1265)
        {
            _1225 = _97;
        }
        float _1295 = _1225;
        _1231 = _1295;
        if (_1265)
        {
            _1233 = _99;
        }
    }
    float _1297 = _1133;
    float _1299 = _1227;
    float _1301 = _1249;
    float _1303 = _1255;
    float _1305 = _1263;
    float _1307 = _1229;
    float _1309 = _1231;
    float _1311 = _1233;
    bool _1313 = _1297 >= _1217;
    bool _1315 = isnan(_1297);
    bool _1317 = _1313 || _1315;
    bool _1319 = isnan(_1217);
    bool _1321 = _1317 || _1319;
    float _1323 = _113 * _811;
    float _1325 = fma(_111, _813, _1323);
    float _1327 = fma(_115, _815, _1325);
    float _1329 = _1323;
    float _1331 = _1299;
    float _1333 = _1307;
    float _1335 = _1309;
    float _1337 = _1299;
    float _1339 = _1307;
    float _1341 = _1309;
    float _1343 = _1311;
    float _1345 = _1305;
    float _1347 = _1297;
    float _1349 = _1327;
    float _1351 = _1327;
    if (!_1321)
    {
        _1329 = _103;
    }
    float _1353 = _1329;
    float _1355 = _1353;
    float _1357 = _1353;
    if (!_1321)
    {
        _1235 = _105;
    }
    float _1359 = _1235;
    float _1361 = _1359;
    float _1363 = _1359;
    if (!_1321)
    {
        _1237 = _107;
    }
    float _1365 = _1237;
    bool _1367 = !_1321;
    float _1369 = _1365;
    float _1371 = _1365;
    if (!_1367)
    {
        bool _1373 = _1299 > _1217;
        if (_1373)
        {
            _1331 = _1217;
        }
        float _1375 = _1331;
        _1337 = _1375;
        if (!_1373)
        {
            _1355 = _1301;
        }
        float _1377 = _1355;
        float _1379 = _1377;
        if (!_1373)
        {
            _1361 = _1303;
        }
        float _1381 = _1361;
        float _1383 = _1381;
        if (!_1373)
        {
            _1369 = _1305;
        }
        float _1385 = _1369;
        float _1387 = _1385;
        if (!_1373)
        {
            _1239 = _1297;
        }
        float _1389 = _1239;
        float _1391 = _1389;
        if (_1373)
        {
            _1379 = _1301;
        }
        float _1393 = _1379;
        _1357 = _1393;
        if (_1373)
        {
            _1383 = _1303;
        }
        float _1395 = _1383;
        _1363 = _1395;
        if (_1373)
        {
            _1387 = _1305;
        }
        float _1397 = _1387;
        _1371 = _1397;
        if (_1373)
        {
            _1391 = _1297;
        }
        float _1399 = _1391;
        _1241 = _1399;
        if (_1373)
        {
            _1333 = _103;
        }
        float _1401 = _1333;
        _1339 = _1401;
        if (_1373)
        {
            _1335 = _105;
        }
        float _1403 = _1335;
        _1341 = _1403;
        if (_1373)
        {
            _1343 = _107;
        }
    }
    float _1405 = _1241;
    float _1407 = _1337;
    float _1409 = _1357;
    float _1411 = _1363;
    float _1413 = _1371;
    float _1415 = _1339;
    float _1417 = _1341;
    float _1419 = _1343;
    bool _1421 = _1405 >= _1327;
    bool _1423 = isnan(_1405);
    bool _1425 = _1421 || _1423;
    bool _1427 = isnan(_1327);
    bool _1429 = _1425 || _1427;
    float _1431 = _121 * _811;
    float _1433 = fma(_119, _813, _1431);
    float _1435 = fma(_123, _815, _1433);
    float _1437 = _1407;
    float _1439 = _1415;
    float _1441 = _1417;
    float _1443 = _1407;
    float _1445 = _1415;
    float _1447 = _1417;
    float _1449 = _1419;
    float _1451 = _1411;
    float _1453 = _1413;
    float _1455 = _1435;
    float _1457 = _1435;
    if (!_1429)
    {
        _1345 = _111;
    }
    float _1459 = _1345;
    float _1461 = _1459;
    float _1463 = _1459;
    if (!_1429)
    {
        _1243 = _113;
    }
    float _1465 = _1243;
    float _1467 = _1465;
    float _1469 = _1465;
    if (!_1429)
    {
        _1347 = _115;
    }
    float _1471 = _1347;
    bool _1473 = !_1429;
    float _1475 = _1471;
    float _1477 = _1471;
    if (!_1473)
    {
        bool _1479 = _1407 > _1327;
        if (_1479)
        {
            _1437 = _1327;
        }
        float _1481 = _1437;
        _1443 = _1481;
        if (!_1479)
        {
            _1461 = _1409;
        }
        float _1483 = _1461;
        float _1485 = _1483;
        if (!_1479)
        {
            _1467 = _1411;
        }
        float _1487 = _1467;
        float _1489 = _1487;
        if (!_1479)
        {
            _1475 = _1413;
        }
        float _1491 = _1475;
        float _1493 = _1491;
        if (!_1479)
        {
            _1349 = _1405;
        }
        float _1495 = _1349;
        float _1497 = _1495;
        if (_1479)
        {
            _1485 = _1409;
        }
        float _1499 = _1485;
        _1463 = _1499;
        if (_1479)
        {
            _1489 = _1411;
        }
        float _1501 = _1489;
        _1469 = _1501;
        if (_1479)
        {
            _1493 = _1413;
        }
        float _1503 = _1493;
        _1477 = _1503;
        if (_1479)
        {
            _1497 = _1405;
        }
        float _1505 = _1497;
        _1351 = _1505;
        if (_1479)
        {
            _1439 = _111;
        }
        float _1507 = _1439;
        _1445 = _1507;
        if (_1479)
        {
            _1441 = _113;
        }
        float _1509 = _1441;
        _1447 = _1509;
        if (_1479)
        {
            _1449 = _115;
        }
    }
    float _1511 = _1351;
    float _1513 = _1443;
    float _1515 = _1463;
    float _1517 = _1469;
    float _1519 = _1477;
    float _1521 = _1445;
    float _1523 = _1447;
    float _1525 = _1449;
    bool _1527 = _1511 >= _1435;
    bool _1529 = isnan(_1511);
    bool _1531 = _1527 || _1529;
    bool _1533 = isnan(_1435);
    bool _1535 = _1531 || _1533;
    float _1537 = _129 * _811;
    float _1539 = fma(_127, _813, _1537);
    float _1541 = fma(_131, _815, _1539);
    float _1543 = _1537;
    float _1545 = _1513;
    float _1547 = _1521;
    float _1549 = _1523;
    float _1551 = _1513;
    float _1553 = _1521;
    float _1555 = _1523;
    float _1557 = _1525;
    float _1559 = _1519;
    float _1561 = _1541;
    float _1563 = _1541;
    if (!_1535)
    {
        _1543 = _119;
    }
    float _1565 = _1543;
    float _1567 = _1565;
    float _1569 = _1565;
    if (!_1535)
    {
        _1451 = _121;
    }
    float _1571 = _1451;
    float _1573 = _1571;
    float _1575 = _1571;
    if (!_1535)
    {
        _1453 = _123;
    }
    float _1577 = _1453;
    bool _1579 = !_1535;
    float _1581 = _1577;
    float _1583 = _1577;
    if (!_1579)
    {
        bool _1585 = _1513 > _1435;
        if (_1585)
        {
            _1545 = _1435;
        }
        float _1587 = _1545;
        _1551 = _1587;
        if (!_1585)
        {
            _1567 = _1515;
        }
        float _1589 = _1567;
        float _1591 = _1589;
        if (!_1585)
        {
            _1573 = _1517;
        }
        float _1593 = _1573;
        float _1595 = _1593;
        if (!_1585)
        {
            _1581 = _1519;
        }
        float _1597 = _1581;
        float _1599 = _1597;
        if (!_1585)
        {
            _1455 = _1511;
        }
        float _1601 = _1455;
        float _1603 = _1601;
        if (_1585)
        {
            _1591 = _1515;
        }
        float _1605 = _1591;
        _1569 = _1605;
        if (_1585)
        {
            _1595 = _1517;
        }
        float _1607 = _1595;
        _1575 = _1607;
        if (_1585)
        {
            _1599 = _1519;
        }
        float _1609 = _1599;
        _1583 = _1609;
        if (_1585)
        {
            _1603 = _1511;
        }
        float _1611 = _1603;
        _1457 = _1611;
        if (_1585)
        {
            _1547 = _119;
        }
        float _1613 = _1547;
        _1553 = _1613;
        if (_1585)
        {
            _1549 = _121;
        }
        float _1615 = _1549;
        _1555 = _1615;
        if (_1585)
        {
            _1557 = _123;
        }
    }
    float _1617 = _1457;
    float _1619 = _1551;
    float _1621 = _1569;
    float _1623 = _1575;
    float _1625 = _1583;
    float _1627 = _1553;
    float _1629 = _1555;
    float _1631 = _1557;
    bool _1633 = _1617 >= _1541;
    bool _1635 = isnan(_1617);
    bool _1637 = _1633 || _1635;
    bool _1639 = isnan(_1541);
    bool _1641 = _1637 || _1639;
    float _1643 = _137 * _811;
    float _1645 = fma(_135, _813, _1643);
    float _1647 = fma(_139, _815, _1645);
    float _1649 = _1643;
    float _1651 = _1645;
    float _1653 = _1619;
    float _1655 = _1627;
    float _1657 = _1629;
    float _1659 = _1619;
    float _1661 = _1627;
    float _1663 = _1629;
    float _1665 = _1631;
    float _1667 = _1625;
    float _1669 = _1623;
    float _1671 = _1647;
    float _1673 = _1647;
    if (!_1641)
    {
        _1559 = _127;
    }
    float _1675 = _1559;
    float _1677 = _1675;
    float _1679 = _1675;
    if (!_1641)
    {
        _1649 = _129;
    }
    float _1681 = _1649;
    float _1683 = _1681;
    float _1685 = _1681;
    if (!_1641)
    {
        _1651 = _131;
    }
    float _1687 = _1651;
    bool _1689 = !_1641;
    float _1691 = _1687;
    float _1693 = _1687;
    if (!_1689)
    {
        bool _1695 = _1619 > _1541;
        if (_1695)
        {
            _1653 = _1541;
        }
        float _1697 = _1653;
        _1659 = _1697;
        if (!_1695)
        {
            _1677 = _1621;
        }
        float _1699 = _1677;
        float _1701 = _1699;
        if (!_1695)
        {
            _1683 = _1623;
        }
        float _1703 = _1683;
        float _1705 = _1703;
        if (!_1695)
        {
            _1691 = _1625;
        }
        float _1707 = _1691;
        float _1709 = _1707;
        if (!_1695)
        {
            _1561 = _1617;
        }
        float _1711 = _1561;
        float _1713 = _1711;
        if (_1695)
        {
            _1701 = _1621;
        }
        float _1715 = _1701;
        _1679 = _1715;
        if (_1695)
        {
            _1705 = _1623;
        }
        float _1717 = _1705;
        _1685 = _1717;
        if (_1695)
        {
            _1709 = _1625;
        }
        float _1719 = _1709;
        _1693 = _1719;
        if (_1695)
        {
            _1713 = _1617;
        }
        float _1721 = _1713;
        _1563 = _1721;
        if (_1695)
        {
            _1655 = _127;
        }
        float _1723 = _1655;
        _1661 = _1723;
        if (_1695)
        {
            _1657 = _129;
        }
        float _1725 = _1657;
        _1663 = _1725;
        if (_1695)
        {
            _1665 = _131;
        }
    }
    float _1727 = _1563;
    float _1729 = _1659;
    float _1731 = _1679;
    float _1733 = _1685;
    float _1735 = _1693;
    float _1737 = _1661;
    float _1739 = _1663;
    float _1741 = _1665;
    bool _1743 = _1727 >= _1647;
    bool _1745 = isnan(_1727);
    bool _1747 = _1743 || _1745;
    bool _1749 = isnan(_1647);
    bool _1751 = _1747 || _1749;
    float _1753 = _145 * _811;
    float _1755 = fma(_143, _813, _1753);
    float _1757 = fma(_147, _815, _1755);
    float _1759 = _1755;
    float _1761 = _1729;
    float _1763 = _1737;
    float _1765 = _1739;
    float _1767 = _1729;
    float _1769 = _1737;
    float _1771 = _1739;
    float _1773 = _1741;
    float _1775 = _1735;
    float _1777 = _1757;
    float _1779 = _1757;
    if (!_1751)
    {
        _1667 = _135;
    }
    float _1781 = _1667;
    float _1783 = _1781;
    float _1785 = _1781;
    if (!_1751)
    {
        _1669 = _137;
    }
    float _1787 = _1669;
    float _1789 = _1787;
    float _1791 = _1787;
    if (!_1751)
    {
        _1759 = _139;
    }
    float _1793 = _1759;
    bool _1795 = !_1751;
    float _1797 = _1793;
    float _1799 = _1793;
    if (!_1795)
    {
        bool _1801 = _1729 > _1647;
        if (_1801)
        {
            _1761 = _1647;
        }
        float _1803 = _1761;
        _1767 = _1803;
        if (!_1801)
        {
            _1783 = _1731;
        }
        float _1805 = _1783;
        float _1807 = _1805;
        if (!_1801)
        {
            _1789 = _1733;
        }
        float _1809 = _1789;
        float _1811 = _1809;
        if (!_1801)
        {
            _1797 = _1735;
        }
        float _1813 = _1797;
        float _1815 = _1813;
        if (!_1801)
        {
            _1671 = _1727;
        }
        float _1817 = _1671;
        float _1819 = _1817;
        if (_1801)
        {
            _1807 = _1731;
        }
        float _1821 = _1807;
        _1785 = _1821;
        if (_1801)
        {
            _1811 = _1733;
        }
        float _1823 = _1811;
        _1791 = _1823;
        if (_1801)
        {
            _1815 = _1735;
        }
        float _1825 = _1815;
        _1799 = _1825;
        if (_1801)
        {
            _1819 = _1727;
        }
        float _1827 = _1819;
        _1673 = _1827;
        if (_1801)
        {
            _1763 = _135;
        }
        float _1829 = _1763;
        _1769 = _1829;
        if (_1801)
        {
            _1765 = _137;
        }
        float _1831 = _1765;
        _1771 = _1831;
        if (_1801)
        {
            _1773 = _139;
        }
    }
    float _1833 = _1673;
    float _1835 = _1767;
    float _1837 = _1785;
    float _1839 = _1791;
    float _1841 = _1799;
    float _1843 = _1769;
    float _1845 = _1771;
    float _1847 = _1773;
    bool _1849 = _1833 >= _1757;
    bool _1851 = isnan(_1833);
    bool _1853 = _1849 || _1851;
    bool _1855 = isnan(_1757);
    bool _1857 = _1853 || _1855;
    float _1859 = _153 * _811;
    float _1861 = fma(_151, _813, _1859);
    float _1863 = fma(_155, _815, _1861);
    float _1865 = _1859;
    float _1867 = _1861;
    float _1869 = _1835;
    float _1871 = _1843;
    float _1873 = _1845;
    float _1875 = _1835;
    float _1877 = _1843;
    float _1879 = _1845;
    float _1881 = _1847;
    float _1883 = _1837;
    float _1885 = _1839;
    float _1887 = _1863;
    float _1889 = _1863;
    if (!_1857)
    {
        _1775 = _143;
    }
    float _1891 = _1775;
    float _1893 = _1891;
    float _1895 = _1891;
    if (!_1857)
    {
        _1865 = _145;
    }
    float _1897 = _1865;
    float _1899 = _1897;
    float _1901 = _1897;
    if (!_1857)
    {
        _1867 = _147;
    }
    float _1903 = _1867;
    bool _1905 = !_1857;
    float _1907 = _1903;
    float _1909 = _1903;
    if (!_1905)
    {
        bool _1911 = _1835 > _1757;
        if (_1911)
        {
            _1869 = _1757;
        }
        float _1913 = _1869;
        _1875 = _1913;
        if (!_1911)
        {
            _1893 = _1837;
        }
        float _1915 = _1893;
        float _1917 = _1915;
        if (!_1911)
        {
            _1899 = _1839;
        }
        float _1919 = _1899;
        float _1921 = _1919;
        if (!_1911)
        {
            _1907 = _1841;
        }
        float _1923 = _1907;
        float _1925 = _1923;
        if (!_1911)
        {
            _1777 = _1833;
        }
        float _1927 = _1777;
        float _1929 = _1927;
        if (_1911)
        {
            _1917 = _1837;
        }
        float _1931 = _1917;
        _1895 = _1931;
        if (_1911)
        {
            _1921 = _1839;
        }
        float _1933 = _1921;
        _1901 = _1933;
        if (_1911)
        {
            _1925 = _1841;
        }
        float _1935 = _1925;
        _1909 = _1935;
        if (_1911)
        {
            _1929 = _1833;
        }
        float _1937 = _1929;
        _1779 = _1937;
        if (_1911)
        {
            _1871 = _143;
        }
        float _1939 = _1871;
        _1877 = _1939;
        if (_1911)
        {
            _1873 = _145;
        }
        float _1941 = _1873;
        _1879 = _1941;
        if (_1911)
        {
            _1881 = _147;
        }
    }
    float _1943 = _1779;
    float _1945 = _1875;
    float _1947 = _1895;
    float _1949 = _1901;
    float _1951 = _1909;
    float _1953 = _1877;
    float _1955 = _1879;
    float _1957 = _1881;
    bool _1959 = _1943 >= _1863;
    bool _1961 = isnan(_1943);
    bool _1963 = _1959 || _1961;
    bool _1965 = isnan(_1863);
    bool _1967 = _1963 || _1965;
    float _1969 = _161 * _811;
    float _1971 = fma(_159, _813, _1969);
    float _1973 = fma(_163, _815, _1971);
    float _1975 = _1971;
    float _1977 = _1945;
    float _1979 = _1953;
    float _1981 = _1955;
    float _1983 = _1945;
    float _1985 = _1953;
    float _1987 = _1955;
    float _1989 = _1957;
    float _1991 = _1947;
    float _1993 = _1973;
    float _1995 = _1973;
    if (!_1967)
    {
        _1883 = _151;
    }
    float _1997 = _1883;
    float _1999 = _1997;
    float _2001 = _1997;
    if (!_1967)
    {
        _1885 = _153;
    }
    float _2003 = _1885;
    float _2005 = _2003;
    float _2007 = _2003;
    if (!_1967)
    {
        _1975 = _155;
    }
    float _2009 = _1975;
    bool _2011 = !_1967;
    float _2013 = _2009;
    float _2015 = _2009;
    if (!_2011)
    {
        bool _2017 = _1945 > _1863;
        if (_2017)
        {
            _1977 = _1863;
        }
        float _2019 = _1977;
        _1983 = _2019;
        if (!_2017)
        {
            _1999 = _1947;
        }
        float _2021 = _1999;
        float _2023 = _2021;
        if (!_2017)
        {
            _2005 = _1949;
        }
        float _2025 = _2005;
        float _2027 = _2025;
        if (!_2017)
        {
            _2013 = _1951;
        }
        float _2029 = _2013;
        float _2031 = _2029;
        if (!_2017)
        {
            _1887 = _1943;
        }
        float _2033 = _1887;
        float _2035 = _2033;
        if (_2017)
        {
            _2023 = _1947;
        }
        float _2037 = _2023;
        _2001 = _2037;
        if (_2017)
        {
            _2027 = _1949;
        }
        float _2039 = _2027;
        _2007 = _2039;
        if (_2017)
        {
            _2031 = _1951;
        }
        float _2041 = _2031;
        _2015 = _2041;
        if (_2017)
        {
            _2035 = _1943;
        }
        float _2043 = _2035;
        _1889 = _2043;
        if (_2017)
        {
            _1979 = _151;
        }
        float _2045 = _1979;
        _1985 = _2045;
        if (_2017)
        {
            _1981 = _153;
        }
        float _2047 = _1981;
        _1987 = _2047;
        if (_2017)
        {
            _1989 = _155;
        }
    }
    float _2049 = _1889;
    float _2051 = _1983;
    float _2053 = _2001;
    float _2055 = _2007;
    float _2057 = _2015;
    float _2059 = _1985;
    float _2061 = _1987;
    float _2063 = _1989;
    bool _2065 = _2049 >= _1973;
    bool _2067 = isnan(_2049);
    bool _2069 = _2065 || _2067;
    bool _2071 = isnan(_1973);
    bool _2073 = _2069 || _2071;
    float _2075 = _169 * _811;
    float _2077 = fma(_167, _813, _2075);
    float _2079 = fma(_171, _815, _2077);
    float _2081 = _2075;
    float _2083 = _2077;
    float _2085 = _2051;
    float _2087 = _2059;
    float _2089 = _2061;
    float _2091 = _2051;
    float _2093 = _2059;
    float _2095 = _2061;
    float _2097 = _2063;
    float _2099 = _2053;
    float _2101 = _2055;
    float _2103 = _2079;
    float _2105 = _2079;
    if (!_2073)
    {
        _1991 = _159;
    }
    float _2107 = _1991;
    float _2109 = _2107;
    float _2111 = _2107;
    if (!_2073)
    {
        _2081 = _161;
    }
    float _2113 = _2081;
    float _2115 = _2113;
    float _2117 = _2113;
    if (!_2073)
    {
        _2083 = _163;
    }
    float _2119 = _2083;
    bool _2121 = !_2073;
    float _2123 = _2119;
    float _2125 = _2119;
    if (!_2121)
    {
        bool _2127 = _2051 > _1973;
        if (_2127)
        {
            _2085 = _1973;
        }
        float _2129 = _2085;
        _2091 = _2129;
        if (!_2127)
        {
            _2109 = _2053;
        }
        float _2131 = _2109;
        float _2133 = _2131;
        if (!_2127)
        {
            _2115 = _2055;
        }
        float _2135 = _2115;
        float _2137 = _2135;
        if (!_2127)
        {
            _2123 = _2057;
        }
        float _2139 = _2123;
        float _2141 = _2139;
        if (!_2127)
        {
            _1993 = _2049;
        }
        float _2143 = _1993;
        float _2145 = _2143;
        if (_2127)
        {
            _2133 = _2053;
        }
        float _2147 = _2133;
        _2111 = _2147;
        if (_2127)
        {
            _2137 = _2055;
        }
        float _2149 = _2137;
        _2117 = _2149;
        if (_2127)
        {
            _2141 = _2057;
        }
        float _2151 = _2141;
        _2125 = _2151;
        if (_2127)
        {
            _2145 = _2049;
        }
        float _2153 = _2145;
        _1995 = _2153;
        if (_2127)
        {
            _2087 = _159;
        }
        float _2155 = _2087;
        _2093 = _2155;
        if (_2127)
        {
            _2089 = _161;
        }
        float _2157 = _2089;
        _2095 = _2157;
        if (_2127)
        {
            _2097 = _163;
        }
    }
    float _2159 = _1995;
    float _2161 = _2091;
    float _2163 = _2111;
    float _2165 = _2117;
    float _2167 = _2125;
    float _2169 = _2093;
    float _2171 = _2095;
    float _2173 = _2097;
    bool _2175 = _2159 >= _2079;
    bool _2177 = isnan(_2159);
    bool _2179 = _2175 || _2177;
    bool _2181 = isnan(_2079);
    bool _2183 = _2179 || _2181;
    float _2185 = _177 * _811;
    float _2187 = fma(_175, _813, _2185);
    float _2189 = fma(_179, _815, _2187);
    float _2191 = _2187;
    float _2193 = _2161;
    float _2195 = _2169;
    float _2197 = _2171;
    float _2199 = _2169;
    float _2201 = _2161;
    float _2203 = _2171;
    float _2205 = _2173;
    float _2207 = _2167;
    float _2209 = _2189;
    float _2211 = _2189;
    if (!_2183)
    {
        _2099 = _167;
    }
    float _2213 = _2099;
    float _2215 = _2213;
    float _2217 = _2213;
    if (!_2183)
    {
        _2101 = _169;
    }
    float _2219 = _2101;
    float _2221 = _2219;
    float _2223 = _2219;
    if (!_2183)
    {
        _2191 = _171;
    }
    float _2225 = _2191;
    bool _2227 = !_2183;
    float _2229 = _2225;
    float _2231 = _2225;
    if (!_2227)
    {
        bool _2233 = _2161 > _2079;
        if (_2233)
        {
            _2193 = _2079;
        }
        float _2235 = _2193;
        _2201 = _2235;
        if (!_2233)
        {
            _2215 = _2163;
        }
        float _2237 = _2215;
        float _2239 = _2237;
        if (!_2233)
        {
            _2221 = _2165;
        }
        float _2241 = _2221;
        float _2243 = _2241;
        if (!_2233)
        {
            _2229 = _2167;
        }
        float _2245 = _2229;
        float _2247 = _2245;
        if (!_2233)
        {
            _2103 = _2159;
        }
        float _2249 = _2103;
        float _2251 = _2249;
        if (_2233)
        {
            _2239 = _2163;
        }
        float _2253 = _2239;
        _2217 = _2253;
        if (_2233)
        {
            _2243 = _2165;
        }
        float _2255 = _2243;
        _2223 = _2255;
        if (_2233)
        {
            _2247 = _2167;
        }
        float _2257 = _2247;
        _2231 = _2257;
        if (_2233)
        {
            _2251 = _2159;
        }
        float _2259 = _2251;
        _2105 = _2259;
        if (_2233)
        {
            _2195 = _167;
        }
        float _2261 = _2195;
        _2199 = _2261;
        if (_2233)
        {
            _2197 = _169;
        }
        float _2263 = _2197;
        _2203 = _2263;
        if (_2233)
        {
            _2205 = _171;
        }
    }
    float _2265 = _2105;
    float _2267 = _2199;
    float _2269 = _2201;
    float _2271 = _2217;
    float _2273 = _2223;
    float _2275 = _2231;
    float _2277 = _2203;
    float _2279 = _2205;
    bool _2281 = _2265 >= _2189;
    bool _2283 = isnan(_2265);
    bool _2285 = _2281 || _2283;
    bool _2287 = isnan(_2189);
    bool _2289 = _2285 || _2287;
    float _2291 = _185 * _811;
    float _2293 = fma(_183, _813, _2291);
    float _2295 = fma(_187, _815, _2293);
    float _2297 = _2291;
    float _2299 = _2269;
    float _2301 = _2277;
    float _2303 = _2277;
    float _2305 = _2279;
    float _2307 = _2269;
    float _2309 = _2271;
    float _2311 = _2273;
    if (!_2289)
    {
        _2207 = _2267;
    }
    float _2313 = _2207;
    float _2315 = _2313;
    float _2317 = _2313;
    if (!_2289)
    {
        _871 = _175;
    }
    float _2319 = _871;
    float _2321 = _2319;
    float _2323 = _2319;
    if (!_2289)
    {
        _873 = _177;
    }
    float _2325 = _873;
    float _2327 = _2325;
    float _2329 = _2325;
    if (!_2289)
    {
        _2297 = _179;
    }
    float _2331 = _2297;
    bool _2333 = !_2289;
    float _2335 = _2331;
    float _2337 = _2331;
    if (!_2333)
    {
        bool _2339 = _2269 > _2189;
        if (_2339)
        {
            _2299 = _2189;
        }
        float _2341 = _2299;
        _2307 = _2341;
        if (!_2339)
        {
            _2321 = _2271;
        }
        float _2343 = _2321;
        float _2345 = _2343;
        if (!_2339)
        {
            _2327 = _2273;
        }
        float _2347 = _2327;
        float _2349 = _2347;
        if (!_2339)
        {
            _2335 = _2275;
        }
        float _2351 = _2335;
        float _2353 = _2351;
        if (!_2339)
        {
            _2209 = _2265;
        }
        float _2355 = _2209;
        float _2357 = _2355;
        if (!_2339)
        {
            _2315 = _2267;
        }
        float _2359 = _2315;
        float _2361 = _2359;
        if (_2339)
        {
            _2345 = _2271;
        }
        float _2363 = _2345;
        _2323 = _2363;
        if (_2339)
        {
            _2349 = _2273;
        }
        float _2365 = _2349;
        _2329 = _2365;
        if (_2339)
        {
            _2353 = _2275;
        }
        float _2367 = _2353;
        _2337 = _2367;
        if (_2339)
        {
            _2357 = _2265;
        }
        float _2369 = _2357;
        _2211 = _2369;
        if (_2339)
        {
            _2361 = _175;
        }
        float _2371 = _2361;
        _2317 = _2371;
        if (_2339)
        {
            _2301 = _177;
        }
        float _2373 = _2301;
        _2303 = _2373;
        if (_2339)
        {
            _2305 = _179;
        }
    }
    float _2375 = _2211;
    float _2377 = _2303;
    float _2379 = _2305;
    float _2381 = _2307;
    float _2383 = _2323;
    float _2385 = _2329;
    float _2387 = _2337;
    float _2389 = _2317;
    bool _2391 = _2375 >= _2295;
    bool _2393 = isnan(_2375);
    bool _2395 = _2391 || _2393;
    bool _2397 = isnan(_2295);
    bool _2399 = _2395 || _2397;
    float _2401 = _2389;
    float _2403 = _2389;
    if (!_2399)
    {
        _2309 = _2377;
    }
    float _2405 = _2309;
    float _2407 = _2405;
    float _2409 = _2405;
    if (!_2399)
    {
        _2311 = _2379;
    }
    float _2411 = _2311;
    float _2413 = 0.0;
    float _2415 = _2411;
    float _2417 = _2411;
    if (!_2399)
    {
        _2413 = _183;
    }
    float _2419 = _2413;
    float _2421 = 0.0;
    float _2423 = _2419;
    float _2425 = _2419;
    if (!_2399)
    {
        _2421 = _185;
    }
    float _2427 = _2421;
    float _2429 = 0.0;
    float _2431 = _2427;
    float _2433 = _2427;
    if (!_2399)
    {
        _2429 = _187;
    }
    float _2435 = _2429;
    bool _2437 = !_2399;
    float _2439 = _2435;
    float _2441 = _2435;
    if (!_2437)
    {
        bool _2443 = _2381 > _2295;
        if (!_2443)
        {
            _2423 = _2383;
        }
        float _2445 = _2423;
        float _2447 = _2445;
        if (!_2443)
        {
            _2431 = _2385;
        }
        float _2449 = _2431;
        float _2451 = _2449;
        if (!_2443)
        {
            _2439 = _2387;
        }
        float _2453 = _2439;
        float _2455 = _2453;
        if (!_2443)
        {
            _2407 = _2377;
        }
        float _2457 = _2407;
        float _2459 = _2457;
        if (!_2443)
        {
            _2415 = _2379;
        }
        float _2461 = _2415;
        _2417 = _2461;
        if (_2443)
        {
            _2447 = _2383;
        }
        float _2463 = _2447;
        _2425 = _2463;
        if (_2443)
        {
            _2451 = _2385;
        }
        float _2465 = _2451;
        _2433 = _2465;
        if (_2443)
        {
            _2455 = _2387;
        }
        float _2467 = _2455;
        _2441 = _2467;
        if (_2443)
        {
            _2401 = _183;
        }
        float _2469 = _2401;
        _2403 = _2469;
        if (_2443)
        {
            _2459 = _185;
        }
        float _2471 = _2459;
        _2409 = _2471;
        if (_2443)
        {
            _2417 = _187;
        }
    }
    float _2473 = _2409;
    float _2475 = _2433;
    float _2477 = _2403;
    float _2479 = _2425;
    float _2481 = _2417;
    float _2483 = _2441;
    float _2485 = -_2473;
    float _2487 = _2475 + _2485;
    float _2489 = -_2477;
    float _2491 = _2479 + _2489;
    float _2493 = -_2481;
    float _2495 = _2483 + _2493;
    float _2497 = -_2477;
    float _2499 = _71 + _2497;
    float _2501 = _2487 * _2487;
    float _2503 = fma(_2491, _2491, _2501);
    float _2505 = fma(_2495, _2495, _2503);
    float _2507 = -_2473;
    float _2509 = _73 + _2507;
    float _2511 = _2487 * _2509;
    float _2513 = 1.0 / _2505;
    float _2515 = -_2481;
    float _2517 = _75 + _2515;
    float _2519 = fma(_2491, _2499, _2511);
    float _2521 = fma(_2495, _2517, _2519);
    float _2523 = _2513 * 3.0;
    float _2525 = _2523 * _2521;
    float _2527 = rint(_2525);
    float _2529 = precise::max(0.0, _2527);
    float _2531 = precise::min(_2529, 3.0);
    float _2533 = trunc(_2531);
    int _2536 = int(_2533);
    bool _2538 = _2536 >= 2;
    bool _2540 = !_2538;
    float _2542 = _2491;
    float _2544 = _2487;
    float _2546 = _2495;
    float _2548 = _2477;
    float _2550 = _2479;
    float _2552 = _2473;
    float _2554 = _2475;
    float _2556 = _2483;
    float _2558 = _2481;
    float _2568;
    float _2570;
    float _2572;
    float _2574;
    float _2576;
    float _2578;
    float _2580;
    float _2582;
    float _2584;
    float _2586;
    float _2588;
    float _2590;
    float _2592;
    float _2594;
    float _2596;
    float _2598;
    if (!_2540)
    {
        bool _2560 = _2536 >= 3;
        bool _2562 = !_2560;
        if (!_2562)
        {
            bool _2564 = _2536 != 3;
            _2566 = _2564;
            if (!_2566)
            {
                _2568 = _71;
                _2570 = _73;
                _2572 = _75;
                _2574 = 1.0;
                _2576 = 0.0;
                _2578 = 0.0;
                _2580 = 0.0;
                _2582 = 0.0;
                _2584 = 0.0;
                _2586 = 0.0;
                _2588 = 0.0;
                _2590 = 0.0;
                _2592 = 0.0;
                _2594 = 0.0;
                _2596 = 0.0;
                _2598 = 0.0;
                _2600 = true;
            }
        }
        else
        {
            _2568 = 0.0;
            _2570 = 0.0;
            _2572 = 0.0;
            _2574 = 0.0;
            _2576 = 0.0;
            _2578 = 0.0;
            _2580 = 0.0;
            _2582 = 0.0;
            _2584 = _71;
            _2586 = _73;
            _2588 = _75;
            _2590 = 1.0;
            _2592 = 0.0;
            _2594 = 0.0;
            _2596 = 0.0;
            _2598 = 0.0;
            _2600 = true;
        }
    }
    if ((!_2600) || _2566)
    {
        bool _2602;
        if (!_2566)
        {
            _2602 = _2536 >= 1;
        }
        if ((!_2602) || _2566)
        {
            bool _2604;
            if (!_2566)
            {
                _2604 = _2536 != 0;
            }
            if ((!_2604) && (!_2566))
            {
                _2568 = 0.0;
                _2570 = 0.0;
                _2572 = 0.0;
                _2574 = 0.0;
                _2576 = _71;
                _2578 = _73;
                _2580 = _75;
                _2582 = 1.0;
                _2584 = 0.0;
                _2586 = 0.0;
                _2588 = 0.0;
                _2590 = 0.0;
                _2592 = 0.0;
                _2594 = 0.0;
                _2596 = 0.0;
                _2598 = 0.0;
                _2600 = true;
            }
            else
            {
                _2566 = false;
                _2568 = 0.0;
                _2570 = 0.0;
                _2572 = 0.0;
                _2574 = 0.0;
                _2576 = 0.0;
                _2578 = 0.0;
                _2580 = 0.0;
                _2582 = 0.0;
                _2584 = 0.0;
                _2586 = 0.0;
                _2588 = 0.0;
                _2590 = 0.0;
                _2592 = 0.0;
                _2594 = 0.0;
                _2596 = 0.0;
                _2598 = 0.0;
                _2600 = true;
            }
        }
        else
        {
            _2568 = 0.0;
            _2570 = 0.0;
            _2572 = 0.0;
            _2574 = 0.0;
            _2576 = 0.0;
            _2578 = 0.0;
            _2580 = 0.0;
            _2582 = 0.0;
            _2584 = 0.0;
            _2586 = 0.0;
            _2588 = 0.0;
            _2590 = 0.0;
            _2592 = _71;
            _2594 = _73;
            _2596 = _75;
            _2598 = 1.0;
        }
    }
    _2600 = false;
    float _2606 = _2568;
    float _2608 = _2570;
    float _2610 = _2572;
    float _2612 = _2574;
    float _2614 = _2576;
    float _2616 = _2578;
    float _2618 = _2580;
    float _2620 = _2582;
    float _2622 = _2584;
    float _2624 = _2586;
    float _2626 = _2588;
    float _2628 = _2590;
    float _2630 = _2592;
    float _2632 = _2594;
    float _2634 = _2596;
    float _2636 = _2598;
    float _2638 = -_2473;
    float _2640 = _65 + _2638;
    float _2642 = -_2477;
    float _2644 = _63 + _2642;
    float _2646 = _2487 * _2640;
    float _2648 = -_2481;
    float _2650 = _67 + _2648;
    float _2652 = fma(_2491, _2644, _2646);
    float _2654 = fma(_2495, _2650, _2652);
    float _2656 = _2523 * _2654;
    float _2658 = rint(_2656);
    float _2660 = precise::max(0.0, _2658);
    float _2662 = precise::min(_2660, 3.0);
    float _2664 = trunc(_2662);
    int _2666 = int(_2664);
    bool _2668 = _2666 >= 2;
    bool _2670 = !_2668;
    float _2672 = _2658;
    float _2674 = as_type<float>(_2666);
    float _2676 = _2646;
    float _2678 = _2652;
    float _2680 = _2606;
    float _2682 = _2608;
    float _2684 = _2610;
    float _2686 = _2612;
    float _2688 = _2622;
    float _2690 = _2624;
    float _2692 = _2626;
    float _2694 = _2628;
    float _2696 = _2630;
    float _2698 = _2632;
    float _2700 = _2634;
    float _2702 = _2636;
    float _2720;
    float _2722;
    float _2724;
    float _2726;
    if (!_2670)
    {
        bool _2704 = _2666 >= 3;
        bool _2706 = !_2704;
        if (!_2706)
        {
            bool _2708 = _2666 != 3;
            _2710 = _2708;
            if (!_2710)
            {
                float _2712 = _63 + _2606;
                float _2714 = _65 + _2608;
                float _2716 = _67 + _2610;
                float _2718 = _2612 + 1.0;
                _2680 = _2712;
                _2682 = _2714;
                _2684 = _2716;
                _2686 = _2718;
                _2720 = _2614;
                _2722 = _2616;
                _2724 = _2618;
                _2726 = _2620;
                _2728 = true;
            }
        }
        else
        {
            float _2730 = _63 + _2622;
            float _2732 = _65 + _2624;
            float _2734 = _67 + _2626;
            float _2736 = _2628 + 1.0;
            _2720 = _2614;
            _2722 = _2616;
            _2724 = _2618;
            _2726 = _2620;
            _2688 = _2730;
            _2690 = _2732;
            _2692 = _2734;
            _2694 = _2736;
            _2728 = true;
        }
    }
    if ((!_2728) || _2710)
    {
        bool _2738;
        if (!_2710)
        {
            _2738 = _2666 >= 1;
        }
        if ((!_2738) || _2710)
        {
            if (!_2710)
            {
                bool _2740 = _2666 != 0;
                if (!_2740)
                {
                    float _2742 = _63 + _2614;
                    _2672 = _2742;
                }
                float _2744 = _2672;
                _2720 = _2744;
                if (!_2740)
                {
                    float _2746 = _65 + _2616;
                    _2674 = _2746;
                }
                float _2748 = _2674;
                _2722 = _2748;
                if (!_2740)
                {
                    float _2750 = _67 + _2618;
                    _2676 = _2750;
                }
                float _2752 = _2676;
                _2724 = _2752;
                if (!_2740)
                {
                    float _2754 = _2620 + 1.0;
                    _2678 = _2754;
                }
                float _2756 = _2678;
                bool _2758 = !_2740;
                _2726 = _2756;
                _2728 = _2758;
            }
            if ((!_2728) || _2710)
            {
                _2710 = false;
                _2720 = _2614;
                _2722 = _2616;
                _2724 = _2618;
                _2726 = _2620;
                _2728 = true;
            }
        }
        else
        {
            float _2760 = _63 + _2630;
            float _2762 = _65 + _2632;
            float _2764 = _67 + _2634;
            float _2766 = _2636 + 1.0;
            _2720 = _2614;
            _2722 = _2616;
            _2724 = _2618;
            _2726 = _2620;
            _2696 = _2760;
            _2698 = _2762;
            _2700 = _2764;
            _2702 = _2766;
        }
    }
    _2728 = false;
    float _2768 = _2680;
    float _2770 = _2682;
    float _2772 = _2684;
    float _2774 = _2686;
    float _2776 = _2720;
    float _2778 = _2722;
    float _2780 = _2724;
    float _2782 = _2726;
    float _2784 = _2688;
    float _2786 = _2690;
    float _2788 = _2692;
    float _2790 = _2694;
    float _2792 = _2696;
    float _2794 = _2698;
    float _2796 = _2700;
    float _2798 = _2702;
    float _2800 = -_2473;
    float _2802 = _81 + _2800;
    float _2804 = -_2477;
    float _2806 = _79 + _2804;
    float _2808 = _2487 * _2802;
    float _2810 = -_2481;
    float _2812 = _83 + _2810;
    float _2814 = fma(_2491, _2806, _2808);
    float _2816 = fma(_2495, _2812, _2814);
    float _2818 = _2523 * _2816;
    float _2820 = rint(_2818);
    float _2822 = precise::max(0.0, _2820);
    float _2824 = precise::min(_2822, 3.0);
    float _2826 = trunc(_2824);
    int _2828 = int(_2826);
    bool _2830 = _2828 >= 2;
    bool _2832 = !_2830;
    float _2834 = _2820;
    float _2836 = as_type<float>(_2828);
    float _2838 = _2808;
    float _2840 = _2814;
    float _2842 = _2768;
    float _2844 = _2770;
    float _2846 = _2772;
    float _2848 = _2774;
    float _2850 = _2784;
    float _2852 = _2786;
    float _2854 = _2788;
    float _2856 = _2790;
    float _2858 = _2792;
    float _2860 = _2794;
    float _2862 = _2796;
    float _2864 = _2798;
    float _2882;
    float _2884;
    float _2886;
    float _2888;
    if (!_2832)
    {
        bool _2866 = _2828 >= 3;
        bool _2868 = !_2866;
        if (!_2868)
        {
            bool _2870 = _2828 != 3;
            _2872 = _2870;
            if (!_2872)
            {
                float _2874 = _79 + _2768;
                float _2876 = _81 + _2770;
                float _2878 = _83 + _2772;
                float _2880 = _2774 + 1.0;
                _2842 = _2874;
                _2844 = _2876;
                _2846 = _2878;
                _2848 = _2880;
                _2882 = _2776;
                _2884 = _2778;
                _2886 = _2780;
                _2888 = _2782;
                _2890 = true;
            }
        }
        else
        {
            float _2892 = _79 + _2784;
            float _2894 = _81 + _2786;
            float _2896 = _83 + _2788;
            float _2898 = _2790 + 1.0;
            _2882 = _2776;
            _2884 = _2778;
            _2886 = _2780;
            _2888 = _2782;
            _2850 = _2892;
            _2852 = _2894;
            _2854 = _2896;
            _2856 = _2898;
            _2890 = true;
        }
    }
    if ((!_2890) || _2872)
    {
        bool _2900;
        if (!_2872)
        {
            _2900 = _2828 >= 1;
        }
        if ((!_2900) || _2872)
        {
            if (!_2872)
            {
                bool _2902 = _2828 != 0;
                if (!_2902)
                {
                    float _2904 = _79 + _2776;
                    _2834 = _2904;
                }
                float _2906 = _2834;
                _2882 = _2906;
                if (!_2902)
                {
                    float _2908 = _81 + _2778;
                    _2836 = _2908;
                }
                float _2910 = _2836;
                _2884 = _2910;
                if (!_2902)
                {
                    float _2912 = _83 + _2780;
                    _2838 = _2912;
                }
                float _2914 = _2838;
                _2886 = _2914;
                if (!_2902)
                {
                    float _2916 = _2782 + 1.0;
                    _2840 = _2916;
                }
                float _2918 = _2840;
                bool _2920 = !_2902;
                _2888 = _2918;
                _2890 = _2920;
            }
            if ((!_2890) || _2872)
            {
                _2872 = false;
                _2882 = _2776;
                _2884 = _2778;
                _2886 = _2780;
                _2888 = _2782;
                _2890 = true;
            }
        }
        else
        {
            float _2922 = _79 + _2792;
            float _2924 = _81 + _2794;
            float _2926 = _83 + _2796;
            float _2928 = _2798 + 1.0;
            _2882 = _2776;
            _2884 = _2778;
            _2886 = _2780;
            _2888 = _2782;
            _2858 = _2922;
            _2860 = _2924;
            _2862 = _2926;
            _2864 = _2928;
        }
    }
    _2890 = false;
    float _2930 = _2842;
    float _2932 = _2844;
    float _2934 = _2846;
    float _2936 = _2848;
    float _2938 = _2882;
    float _2940 = _2884;
    float _2942 = _2886;
    float _2944 = _2888;
    float _2946 = _2850;
    float _2948 = _2852;
    float _2950 = _2854;
    float _2952 = _2856;
    float _2954 = _2858;
    float _2956 = _2860;
    float _2958 = _2862;
    float _2960 = _2864;
    float _2962 = -_2473;
    float _2964 = _89 + _2962;
    float _2966 = -_2477;
    float _2968 = _87 + _2966;
    float _2970 = _2487 * _2964;
    float _2972 = -_2481;
    float _2974 = _91 + _2972;
    float _2976 = fma(_2491, _2968, _2970);
    float _2978 = fma(_2495, _2974, _2976);
    float _2980 = _2523 * _2978;
    float _2982 = rint(_2980);
    float _2984 = precise::max(0.0, _2982);
    float _2986 = precise::min(_2984, 3.0);
    float _2988 = trunc(_2986);
    int _2990 = int(_2988);
    bool _2992 = _2990 >= 2;
    bool _2994 = !_2992;
    float _2996 = _2982;
    float _2998 = as_type<float>(_2990);
    float _3000 = _2970;
    float _3002 = _2976;
    float _3004 = _2930;
    float _3006 = _2932;
    float _3008 = _2934;
    float _3010 = _2936;
    float _3012 = _2946;
    float _3014 = _2948;
    float _3016 = _2950;
    float _3018 = _2952;
    float _3020 = _2954;
    float _3022 = _2956;
    float _3024 = _2958;
    float _3026 = _2960;
    float _3044;
    float _3046;
    float _3048;
    float _3050;
    if (!_2994)
    {
        bool _3028 = _2990 >= 3;
        bool _3030 = !_3028;
        if (!_3030)
        {
            bool _3032 = _2990 != 3;
            _3034 = _3032;
            if (!_3034)
            {
                float _3036 = _87 + _2930;
                float _3038 = _89 + _2932;
                float _3040 = _91 + _2934;
                float _3042 = _2936 + 1.0;
                _3004 = _3036;
                _3006 = _3038;
                _3008 = _3040;
                _3010 = _3042;
                _3044 = _2938;
                _3046 = _2940;
                _3048 = _2942;
                _3050 = _2944;
                _3052 = true;
            }
        }
        else
        {
            float _3054 = _87 + _2946;
            float _3056 = _89 + _2948;
            float _3058 = _91 + _2950;
            float _3060 = _2952 + 1.0;
            _3044 = _2938;
            _3046 = _2940;
            _3048 = _2942;
            _3050 = _2944;
            _3012 = _3054;
            _3014 = _3056;
            _3016 = _3058;
            _3018 = _3060;
            _3052 = true;
        }
    }
    if ((!_3052) || _3034)
    {
        bool _3062;
        if (!_3034)
        {
            _3062 = _2990 >= 1;
        }
        if ((!_3062) || _3034)
        {
            if (!_3034)
            {
                bool _3064 = _2990 != 0;
                if (!_3064)
                {
                    float _3066 = _87 + _2938;
                    _2996 = _3066;
                }
                float _3068 = _2996;
                _3044 = _3068;
                if (!_3064)
                {
                    float _3070 = _89 + _2940;
                    _2998 = _3070;
                }
                float _3072 = _2998;
                _3046 = _3072;
                if (!_3064)
                {
                    float _3074 = _91 + _2942;
                    _3000 = _3074;
                }
                float _3076 = _3000;
                _3048 = _3076;
                if (!_3064)
                {
                    float _3078 = _2944 + 1.0;
                    _3002 = _3078;
                }
                float _3080 = _3002;
                bool _3082 = !_3064;
                _3050 = _3080;
                _3052 = _3082;
            }
            if ((!_3052) || _3034)
            {
                _3034 = false;
                _3044 = _2938;
                _3046 = _2940;
                _3048 = _2942;
                _3050 = _2944;
                _3052 = true;
            }
        }
        else
        {
            float _3084 = _87 + _2954;
            float _3086 = _89 + _2956;
            float _3088 = _91 + _2958;
            float _3090 = _2960 + 1.0;
            _3044 = _2938;
            _3046 = _2940;
            _3048 = _2942;
            _3050 = _2944;
            _3020 = _3084;
            _3022 = _3086;
            _3024 = _3088;
            _3026 = _3090;
        }
    }
    _3052 = false;
    float _3092 = _3004;
    float _3094 = _3006;
    float _3096 = _3008;
    float _3098 = _3010;
    float _3100 = _3044;
    float _3102 = _3046;
    float _3104 = _3048;
    float _3106 = _3050;
    float _3108 = _3012;
    float _3110 = _3014;
    float _3112 = _3016;
    float _3114 = _3018;
    float _3116 = _3020;
    float _3118 = _3022;
    float _3120 = _3024;
    float _3122 = _3026;
    float _3124 = -_2473;
    float _3126 = _97 + _3124;
    float _3128 = -_2477;
    float _3130 = _95 + _3128;
    float _3132 = _2487 * _3126;
    float _3134 = -_2481;
    float _3136 = _99 + _3134;
    float _3138 = fma(_2491, _3130, _3132);
    float _3140 = fma(_2495, _3136, _3138);
    float _3142 = _2523 * _3140;
    float _3144 = rint(_3142);
    float _3146 = precise::max(0.0, _3144);
    float _3148 = precise::min(_3146, 3.0);
    float _3150 = trunc(_3148);
    int _3152 = int(_3150);
    bool _3154 = _3152 >= 2;
    bool _3156 = !_3154;
    float _3158 = _3144;
    float _3160 = as_type<float>(_3152);
    float _3162 = _3132;
    float _3164 = _3138;
    float _3166 = _3092;
    float _3168 = _3094;
    float _3170 = _3096;
    float _3172 = _3098;
    float _3174 = _3108;
    float _3176 = _3110;
    float _3178 = _3112;
    float _3180 = _3114;
    float _3182 = _3116;
    float _3184 = _3118;
    float _3186 = _3120;
    float _3188 = _3122;
    float _3206;
    float _3208;
    float _3210;
    float _3212;
    if (!_3156)
    {
        bool _3190 = _3152 >= 3;
        bool _3192 = !_3190;
        if (!_3192)
        {
            bool _3194 = _3152 != 3;
            _3196 = _3194;
            if (!_3196)
            {
                float _3198 = _95 + _3092;
                float _3200 = _97 + _3094;
                float _3202 = _99 + _3096;
                float _3204 = _3098 + 1.0;
                _3166 = _3198;
                _3168 = _3200;
                _3170 = _3202;
                _3172 = _3204;
                _3206 = _3100;
                _3208 = _3102;
                _3210 = _3104;
                _3212 = _3106;
                _3214 = true;
            }
        }
        else
        {
            float _3216 = _95 + _3108;
            float _3218 = _97 + _3110;
            float _3220 = _99 + _3112;
            float _3222 = _3114 + 1.0;
            _3206 = _3100;
            _3208 = _3102;
            _3210 = _3104;
            _3212 = _3106;
            _3174 = _3216;
            _3176 = _3218;
            _3178 = _3220;
            _3180 = _3222;
            _3214 = true;
        }
    }
    if ((!_3214) || _3196)
    {
        bool _3224;
        if (!_3196)
        {
            _3224 = _3152 >= 1;
        }
        if ((!_3224) || _3196)
        {
            if (!_3196)
            {
                bool _3226 = _3152 != 0;
                if (!_3226)
                {
                    float _3228 = _95 + _3100;
                    _3158 = _3228;
                }
                float _3230 = _3158;
                _3206 = _3230;
                if (!_3226)
                {
                    float _3232 = _97 + _3102;
                    _3160 = _3232;
                }
                float _3234 = _3160;
                _3208 = _3234;
                if (!_3226)
                {
                    float _3236 = _99 + _3104;
                    _3162 = _3236;
                }
                float _3238 = _3162;
                _3210 = _3238;
                if (!_3226)
                {
                    float _3240 = _3106 + 1.0;
                    _3164 = _3240;
                }
                float _3242 = _3164;
                bool _3244 = !_3226;
                _3212 = _3242;
                _3214 = _3244;
            }
            if ((!_3214) || _3196)
            {
                _3196 = false;
                _3206 = _3100;
                _3208 = _3102;
                _3210 = _3104;
                _3212 = _3106;
                _3214 = true;
            }
        }
        else
        {
            float _3246 = _95 + _3116;
            float _3248 = _97 + _3118;
            float _3250 = _99 + _3120;
            float _3252 = _3122 + 1.0;
            _3206 = _3100;
            _3208 = _3102;
            _3210 = _3104;
            _3212 = _3106;
            _3182 = _3246;
            _3184 = _3248;
            _3186 = _3250;
            _3188 = _3252;
        }
    }
    _3214 = false;
    float _3254 = _3166;
    float _3256 = _3168;
    float _3258 = _3170;
    float _3260 = _3172;
    float _3262 = _3206;
    float _3264 = _3208;
    float _3266 = _3210;
    float _3268 = _3212;
    float _3270 = _3174;
    float _3272 = _3176;
    float _3274 = _3178;
    float _3276 = _3180;
    float _3278 = _3182;
    float _3280 = _3184;
    float _3282 = _3186;
    float _3284 = _3188;
    float _3286 = -_2473;
    float _3288 = _105 + _3286;
    float _3290 = -_2477;
    float _3292 = _103 + _3290;
    float _3294 = _2487 * _3288;
    float _3296 = -_2481;
    float _3298 = _107 + _3296;
    float _3300 = fma(_2491, _3292, _3294);
    float _3302 = fma(_2495, _3298, _3300);
    float _3304 = _2523 * _3302;
    float _3306 = rint(_3304);
    float _3308 = precise::max(0.0, _3306);
    float _3310 = precise::min(_3308, 3.0);
    float _3312 = trunc(_3310);
    int _3314 = int(_3312);
    bool _3316 = _3314 >= 2;
    bool _3318 = !_3316;
    float _3320 = _3306;
    float _3322 = as_type<float>(_3314);
    float _3324 = _3294;
    float _3326 = _3300;
    float _3328 = _3254;
    float _3330 = _3256;
    float _3332 = _3258;
    float _3334 = _3260;
    float _3336 = _3270;
    float _3338 = _3272;
    float _3340 = _3274;
    float _3342 = _3276;
    float _3344 = _3278;
    float _3346 = _3280;
    float _3348 = _3282;
    float _3350 = _3284;
    float _3368;
    float _3370;
    float _3372;
    float _3374;
    if (!_3318)
    {
        bool _3352 = _3314 >= 3;
        bool _3354 = !_3352;
        if (!_3354)
        {
            bool _3356 = _3314 != 3;
            _3358 = _3356;
            if (!_3358)
            {
                float _3360 = _103 + _3254;
                float _3362 = _105 + _3256;
                float _3364 = _107 + _3258;
                float _3366 = _3260 + 1.0;
                _3328 = _3360;
                _3330 = _3362;
                _3332 = _3364;
                _3334 = _3366;
                _3368 = _3262;
                _3370 = _3264;
                _3372 = _3266;
                _3374 = _3268;
                _3376 = true;
            }
        }
        else
        {
            float _3378 = _103 + _3270;
            float _3380 = _105 + _3272;
            float _3382 = _107 + _3274;
            float _3384 = _3276 + 1.0;
            _3368 = _3262;
            _3370 = _3264;
            _3372 = _3266;
            _3374 = _3268;
            _3336 = _3378;
            _3338 = _3380;
            _3340 = _3382;
            _3342 = _3384;
            _3376 = true;
        }
    }
    if ((!_3376) || _3358)
    {
        bool _3386;
        if (!_3358)
        {
            _3386 = _3314 >= 1;
        }
        if ((!_3386) || _3358)
        {
            if (!_3358)
            {
                bool _3388 = _3314 != 0;
                if (!_3388)
                {
                    float _3390 = _103 + _3262;
                    _3320 = _3390;
                }
                float _3392 = _3320;
                _3368 = _3392;
                if (!_3388)
                {
                    float _3394 = _105 + _3264;
                    _3322 = _3394;
                }
                float _3396 = _3322;
                _3370 = _3396;
                if (!_3388)
                {
                    float _3398 = _107 + _3266;
                    _3324 = _3398;
                }
                float _3400 = _3324;
                _3372 = _3400;
                if (!_3388)
                {
                    float _3402 = _3268 + 1.0;
                    _3326 = _3402;
                }
                float _3404 = _3326;
                bool _3406 = !_3388;
                _3374 = _3404;
                _3376 = _3406;
            }
            if ((!_3376) || _3358)
            {
                _3358 = false;
                _3368 = _3262;
                _3370 = _3264;
                _3372 = _3266;
                _3374 = _3268;
                _3376 = true;
            }
        }
        else
        {
            float _3408 = _103 + _3278;
            float _3410 = _105 + _3280;
            float _3412 = _107 + _3282;
            float _3414 = _3284 + 1.0;
            _3368 = _3262;
            _3370 = _3264;
            _3372 = _3266;
            _3374 = _3268;
            _3344 = _3408;
            _3346 = _3410;
            _3348 = _3412;
            _3350 = _3414;
        }
    }
    _3376 = false;
    float _3416 = _3328;
    float _3418 = _3330;
    float _3420 = _3332;
    float _3422 = _3334;
    float _3424 = _3368;
    float _3426 = _3370;
    float _3428 = _3372;
    float _3430 = _3374;
    float _3432 = _3336;
    float _3434 = _3338;
    float _3436 = _3340;
    float _3438 = _3342;
    float _3440 = _3344;
    float _3442 = _3346;
    float _3444 = _3348;
    float _3446 = _3350;
    float _3448 = -_2473;
    float _3450 = _113 + _3448;
    float _3452 = -_2477;
    float _3454 = _111 + _3452;
    float _3456 = _2487 * _3450;
    float _3458 = -_2481;
    float _3460 = _115 + _3458;
    float _3462 = fma(_2491, _3454, _3456);
    float _3464 = fma(_2495, _3460, _3462);
    float _3466 = _2523 * _3464;
    float _3468 = rint(_3466);
    float _3470 = precise::max(0.0, _3468);
    float _3472 = precise::min(_3470, 3.0);
    float _3474 = trunc(_3472);
    int _3476 = int(_3474);
    bool _3478 = _3476 >= 2;
    bool _3480 = !_3478;
    float _3482 = _3468;
    float _3484 = as_type<float>(_3476);
    float _3486 = _3456;
    float _3488 = _3462;
    float _3490 = _3416;
    float _3492 = _3418;
    float _3494 = _3420;
    float _3496 = _3422;
    float _3498 = _3432;
    float _3500 = _3434;
    float _3502 = _3436;
    float _3504 = _3438;
    float _3506 = _3440;
    float _3508 = _3442;
    float _3510 = _3444;
    float _3512 = _3446;
    float _3530;
    float _3532;
    float _3534;
    float _3536;
    if (!_3480)
    {
        bool _3514 = _3476 >= 3;
        bool _3516 = !_3514;
        if (!_3516)
        {
            bool _3518 = _3476 != 3;
            _3520 = _3518;
            if (!_3520)
            {
                float _3522 = _111 + _3416;
                float _3524 = _113 + _3418;
                float _3526 = _115 + _3420;
                float _3528 = _3422 + 1.0;
                _3490 = _3522;
                _3492 = _3524;
                _3494 = _3526;
                _3496 = _3528;
                _3530 = _3424;
                _3532 = _3426;
                _3534 = _3428;
                _3536 = _3430;
                _3538 = true;
            }
        }
        else
        {
            float _3540 = _111 + _3432;
            float _3542 = _113 + _3434;
            float _3544 = _115 + _3436;
            float _3546 = _3438 + 1.0;
            _3530 = _3424;
            _3532 = _3426;
            _3534 = _3428;
            _3536 = _3430;
            _3498 = _3540;
            _3500 = _3542;
            _3502 = _3544;
            _3504 = _3546;
            _3538 = true;
        }
    }
    if ((!_3538) || _3520)
    {
        bool _3548;
        if (!_3520)
        {
            _3548 = _3476 >= 1;
        }
        if ((!_3548) || _3520)
        {
            if (!_3520)
            {
                bool _3550 = _3476 != 0;
                if (!_3550)
                {
                    float _3552 = _111 + _3424;
                    _3482 = _3552;
                }
                float _3554 = _3482;
                _3530 = _3554;
                if (!_3550)
                {
                    float _3556 = _113 + _3426;
                    _3484 = _3556;
                }
                float _3558 = _3484;
                _3532 = _3558;
                if (!_3550)
                {
                    float _3560 = _115 + _3428;
                    _3486 = _3560;
                }
                float _3562 = _3486;
                _3534 = _3562;
                if (!_3550)
                {
                    float _3564 = _3430 + 1.0;
                    _3488 = _3564;
                }
                float _3566 = _3488;
                bool _3568 = !_3550;
                _3536 = _3566;
                _3538 = _3568;
            }
            if ((!_3538) || _3520)
            {
                _3520 = false;
                _3530 = _3424;
                _3532 = _3426;
                _3534 = _3428;
                _3536 = _3430;
                _3538 = true;
            }
        }
        else
        {
            float _3570 = _111 + _3440;
            float _3572 = _113 + _3442;
            float _3574 = _115 + _3444;
            float _3576 = _3446 + 1.0;
            _3530 = _3424;
            _3532 = _3426;
            _3534 = _3428;
            _3536 = _3430;
            _3506 = _3570;
            _3508 = _3572;
            _3510 = _3574;
            _3512 = _3576;
        }
    }
    _3538 = false;
    float _3578 = _3490;
    float _3580 = _3492;
    float _3582 = _3494;
    float _3584 = _3496;
    float _3586 = _3530;
    float _3588 = _3532;
    float _3590 = _3534;
    float _3592 = _3536;
    float _3594 = _3498;
    float _3596 = _3500;
    float _3598 = _3502;
    float _3600 = _3504;
    float _3602 = _3506;
    float _3604 = _3508;
    float _3606 = _3510;
    float _3608 = _3512;
    float _3610 = -_2473;
    float _3612 = _121 + _3610;
    float _3614 = -_2477;
    float _3616 = _119 + _3614;
    float _3618 = _2487 * _3612;
    float _3620 = -_2481;
    float _3622 = _123 + _3620;
    float _3624 = fma(_2491, _3616, _3618);
    float _3626 = fma(_2495, _3622, _3624);
    float _3628 = _2523 * _3626;
    float _3630 = rint(_3628);
    float _3632 = precise::max(0.0, _3630);
    float _3634 = precise::min(_3632, 3.0);
    float _3636 = trunc(_3634);
    int _3638 = int(_3636);
    bool _3640 = _3638 >= 2;
    bool _3642 = !_3640;
    float _3644 = _3630;
    float _3646 = as_type<float>(_3638);
    float _3648 = _3618;
    float _3650 = _3624;
    float _3652 = _3578;
    float _3654 = _3580;
    float _3656 = _3582;
    float _3658 = _3584;
    float _3660 = _3594;
    float _3662 = _3596;
    float _3664 = _3598;
    float _3666 = _3600;
    float _3668 = _3602;
    float _3670 = _3604;
    float _3672 = _3606;
    float _3674 = _3608;
    float _3692;
    float _3694;
    float _3696;
    float _3698;
    if (!_3642)
    {
        bool _3676 = _3638 >= 3;
        bool _3678 = !_3676;
        if (!_3678)
        {
            bool _3680 = _3638 != 3;
            _3682 = _3680;
            if (!_3682)
            {
                float _3684 = _119 + _3578;
                float _3686 = _121 + _3580;
                float _3688 = _123 + _3582;
                float _3690 = _3584 + 1.0;
                _3652 = _3684;
                _3654 = _3686;
                _3656 = _3688;
                _3658 = _3690;
                _3692 = _3586;
                _3694 = _3588;
                _3696 = _3590;
                _3698 = _3592;
                _3700 = true;
            }
        }
        else
        {
            float _3702 = _119 + _3594;
            float _3704 = _121 + _3596;
            float _3706 = _123 + _3598;
            float _3708 = _3600 + 1.0;
            _3692 = _3586;
            _3694 = _3588;
            _3696 = _3590;
            _3698 = _3592;
            _3660 = _3702;
            _3662 = _3704;
            _3664 = _3706;
            _3666 = _3708;
            _3700 = true;
        }
    }
    if ((!_3700) || _3682)
    {
        bool _3710;
        if (!_3682)
        {
            _3710 = _3638 >= 1;
        }
        if ((!_3710) || _3682)
        {
            if (!_3682)
            {
                bool _3712 = _3638 != 0;
                if (!_3712)
                {
                    float _3714 = _119 + _3586;
                    _3644 = _3714;
                }
                float _3716 = _3644;
                _3692 = _3716;
                if (!_3712)
                {
                    float _3718 = _121 + _3588;
                    _3646 = _3718;
                }
                float _3720 = _3646;
                _3694 = _3720;
                if (!_3712)
                {
                    float _3722 = _123 + _3590;
                    _3648 = _3722;
                }
                float _3724 = _3648;
                _3696 = _3724;
                if (!_3712)
                {
                    float _3726 = _3592 + 1.0;
                    _3650 = _3726;
                }
                float _3728 = _3650;
                bool _3730 = !_3712;
                _3698 = _3728;
                _3700 = _3730;
            }
            if ((!_3700) || _3682)
            {
                _3682 = false;
                _3692 = _3586;
                _3694 = _3588;
                _3696 = _3590;
                _3698 = _3592;
                _3700 = true;
            }
        }
        else
        {
            float _3732 = _119 + _3602;
            float _3734 = _121 + _3604;
            float _3736 = _123 + _3606;
            float _3738 = _3608 + 1.0;
            _3692 = _3586;
            _3694 = _3588;
            _3696 = _3590;
            _3698 = _3592;
            _3668 = _3732;
            _3670 = _3734;
            _3672 = _3736;
            _3674 = _3738;
        }
    }
    _3700 = false;
    float _3740 = _3652;
    float _3742 = _3654;
    float _3744 = _3656;
    float _3746 = _3658;
    float _3748 = _3692;
    float _3750 = _3694;
    float _3752 = _3696;
    float _3754 = _3698;
    float _3756 = _3660;
    float _3758 = _3662;
    float _3760 = _3664;
    float _3762 = _3666;
    float _3764 = _3668;
    float _3766 = _3670;
    float _3768 = _3672;
    float _3770 = _3674;
    float _3772 = -_2473;
    float _3774 = _129 + _3772;
    float _3776 = -_2477;
    float _3778 = _127 + _3776;
    float _3780 = _2487 * _3774;
    float _3782 = -_2481;
    float _3784 = _131 + _3782;
    float _3786 = fma(_2491, _3778, _3780);
    float _3788 = fma(_2495, _3784, _3786);
    float _3790 = _2523 * _3788;
    float _3792 = rint(_3790);
    float _3794 = precise::max(0.0, _3792);
    float _3796 = precise::min(_3794, 3.0);
    float _3798 = trunc(_3796);
    int _3800 = int(_3798);
    bool _3802 = _3800 >= 2;
    bool _3804 = !_3802;
    float _3806 = _3792;
    float _3808 = as_type<float>(_3800);
    float _3810 = _3780;
    float _3812 = _3786;
    float _3814 = _3740;
    float _3816 = _3742;
    float _3818 = _3744;
    float _3820 = _3746;
    float _3822 = _3756;
    float _3824 = _3758;
    float _3826 = _3760;
    float _3828 = _3762;
    float _3830 = _3764;
    float _3832 = _3766;
    float _3834 = _3768;
    float _3836 = _3770;
    float _3854;
    float _3856;
    float _3858;
    float _3860;
    if (!_3804)
    {
        bool _3838 = _3800 >= 3;
        bool _3840 = !_3838;
        if (!_3840)
        {
            bool _3842 = _3800 != 3;
            _3844 = _3842;
            if (!_3844)
            {
                float _3846 = _127 + _3740;
                float _3848 = _129 + _3742;
                float _3850 = _131 + _3744;
                float _3852 = _3746 + 1.0;
                _3814 = _3846;
                _3816 = _3848;
                _3818 = _3850;
                _3820 = _3852;
                _3854 = _3748;
                _3856 = _3750;
                _3858 = _3752;
                _3860 = _3754;
                _3862 = true;
            }
        }
        else
        {
            float _3864 = _127 + _3756;
            float _3866 = _129 + _3758;
            float _3868 = _131 + _3760;
            float _3870 = _3762 + 1.0;
            _3854 = _3748;
            _3856 = _3750;
            _3858 = _3752;
            _3860 = _3754;
            _3822 = _3864;
            _3824 = _3866;
            _3826 = _3868;
            _3828 = _3870;
            _3862 = true;
        }
    }
    if ((!_3862) || _3844)
    {
        bool _3872;
        if (!_3844)
        {
            _3872 = _3800 >= 1;
        }
        if ((!_3872) || _3844)
        {
            if (!_3844)
            {
                bool _3874 = _3800 != 0;
                if (!_3874)
                {
                    float _3876 = _127 + _3748;
                    _3806 = _3876;
                }
                float _3878 = _3806;
                _3854 = _3878;
                if (!_3874)
                {
                    float _3880 = _129 + _3750;
                    _3808 = _3880;
                }
                float _3882 = _3808;
                _3856 = _3882;
                if (!_3874)
                {
                    float _3884 = _131 + _3752;
                    _3810 = _3884;
                }
                float _3886 = _3810;
                _3858 = _3886;
                if (!_3874)
                {
                    float _3888 = _3754 + 1.0;
                    _3812 = _3888;
                }
                float _3890 = _3812;
                bool _3892 = !_3874;
                _3860 = _3890;
                _3862 = _3892;
            }
            if ((!_3862) || _3844)
            {
                _3844 = false;
                _3854 = _3748;
                _3856 = _3750;
                _3858 = _3752;
                _3860 = _3754;
                _3862 = true;
            }
        }
        else
        {
            float _3894 = _127 + _3764;
            float _3896 = _129 + _3766;
            float _3898 = _131 + _3768;
            float _3900 = _3770 + 1.0;
            _3854 = _3748;
            _3856 = _3750;
            _3858 = _3752;
            _3860 = _3754;
            _3830 = _3894;
            _3832 = _3896;
            _3834 = _3898;
            _3836 = _3900;
        }
    }
    _3862 = false;
    float _3902 = _3814;
    float _3904 = _3816;
    float _3906 = _3818;
    float _3908 = _3820;
    float _3910 = _3854;
    float _3912 = _3856;
    float _3914 = _3858;
    float _3916 = _3860;
    float _3918 = _3822;
    float _3920 = _3824;
    float _3922 = _3826;
    float _3924 = _3828;
    float _3926 = _3830;
    float _3928 = _3832;
    float _3930 = _3834;
    float _3932 = _3836;
    float _3934 = -_2473;
    float _3936 = _137 + _3934;
    float _3938 = -_2477;
    float _3940 = _135 + _3938;
    float _3942 = _2487 * _3936;
    float _3944 = -_2481;
    float _3946 = _139 + _3944;
    float _3948 = fma(_2491, _3940, _3942);
    float _3950 = fma(_2495, _3946, _3948);
    float _3952 = _2523 * _3950;
    float _3954 = rint(_3952);
    float _3956 = precise::max(0.0, _3954);
    float _3958 = precise::min(_3956, 3.0);
    float _3960 = trunc(_3958);
    int _3962 = int(_3960);
    bool _3964 = _3962 >= 2;
    bool _3966 = !_3964;
    float _3968 = _3954;
    float _3970 = as_type<float>(_3962);
    float _3972 = _3942;
    float _3974 = _3948;
    float _3976 = _3902;
    float _3978 = _3904;
    float _3980 = _3906;
    float _3982 = _3908;
    float _3984 = _3918;
    float _3986 = _3920;
    float _3988 = _3922;
    float _3990 = _3924;
    float _3992 = _3926;
    float _3994 = _3928;
    float _3996 = _3930;
    float _3998 = _3932;
    float _4016;
    float _4018;
    float _4020;
    float _4022;
    if (!_3966)
    {
        bool _4000 = _3962 >= 3;
        bool _4002 = !_4000;
        if (!_4002)
        {
            bool _4004 = _3962 != 3;
            _4006 = _4004;
            if (!_4006)
            {
                float _4008 = _135 + _3902;
                float _4010 = _137 + _3904;
                float _4012 = _139 + _3906;
                float _4014 = _3908 + 1.0;
                _3976 = _4008;
                _3978 = _4010;
                _3980 = _4012;
                _3982 = _4014;
                _4016 = _3910;
                _4018 = _3912;
                _4020 = _3914;
                _4022 = _3916;
                _4024 = true;
            }
        }
        else
        {
            float _4026 = _135 + _3918;
            float _4028 = _137 + _3920;
            float _4030 = _139 + _3922;
            float _4032 = _3924 + 1.0;
            _4016 = _3910;
            _4018 = _3912;
            _4020 = _3914;
            _4022 = _3916;
            _3984 = _4026;
            _3986 = _4028;
            _3988 = _4030;
            _3990 = _4032;
            _4024 = true;
        }
    }
    if ((!_4024) || _4006)
    {
        bool _4034;
        if (!_4006)
        {
            _4034 = _3962 >= 1;
        }
        if ((!_4034) || _4006)
        {
            if (!_4006)
            {
                bool _4036 = _3962 != 0;
                if (!_4036)
                {
                    float _4038 = _135 + _3910;
                    _3968 = _4038;
                }
                float _4040 = _3968;
                _4016 = _4040;
                if (!_4036)
                {
                    float _4042 = _137 + _3912;
                    _3970 = _4042;
                }
                float _4044 = _3970;
                _4018 = _4044;
                if (!_4036)
                {
                    float _4046 = _139 + _3914;
                    _3972 = _4046;
                }
                float _4048 = _3972;
                _4020 = _4048;
                if (!_4036)
                {
                    float _4050 = _3916 + 1.0;
                    _3974 = _4050;
                }
                float _4052 = _3974;
                bool _4054 = !_4036;
                _4022 = _4052;
                _4024 = _4054;
            }
            if ((!_4024) || _4006)
            {
                _4006 = false;
                _4016 = _3910;
                _4018 = _3912;
                _4020 = _3914;
                _4022 = _3916;
                _4024 = true;
            }
        }
        else
        {
            float _4056 = _135 + _3926;
            float _4058 = _137 + _3928;
            float _4060 = _139 + _3930;
            float _4062 = _3932 + 1.0;
            _4016 = _3910;
            _4018 = _3912;
            _4020 = _3914;
            _4022 = _3916;
            _3992 = _4056;
            _3994 = _4058;
            _3996 = _4060;
            _3998 = _4062;
        }
    }
    _4024 = false;
    float _4064 = _3976;
    float _4066 = _3978;
    float _4068 = _3980;
    float _4070 = _3982;
    float _4072 = _4016;
    float _4074 = _4018;
    float _4076 = _4020;
    float _4078 = _4022;
    float _4080 = _3984;
    float _4082 = _3986;
    float _4084 = _3988;
    float _4086 = _3990;
    float _4088 = _3992;
    float _4090 = _3994;
    float _4092 = _3996;
    float _4094 = _3998;
    float _4096 = -_2473;
    float _4098 = _145 + _4096;
    float _4100 = -_2477;
    float _4102 = _143 + _4100;
    float _4104 = _2487 * _4098;
    float _4106 = -_2481;
    float _4108 = _147 + _4106;
    float _4110 = fma(_2491, _4102, _4104);
    float _4112 = fma(_2495, _4108, _4110);
    float _4114 = _2523 * _4112;
    float _4116 = rint(_4114);
    float _4118 = precise::max(0.0, _4116);
    float _4120 = precise::min(_4118, 3.0);
    float _4122 = trunc(_4120);
    int _4124 = int(_4122);
    bool _4126 = _4124 >= 2;
    bool _4128 = !_4126;
    float _4130 = _4116;
    float _4132 = as_type<float>(_4124);
    float _4134 = _4104;
    float _4136 = _4110;
    float _4138 = _4064;
    float _4140 = _4066;
    float _4142 = _4068;
    float _4144 = _4070;
    float _4146 = _4080;
    float _4148 = _4082;
    float _4150 = _4084;
    float _4152 = _4086;
    float _4154 = _4088;
    float _4156 = _4090;
    float _4158 = _4092;
    float _4160 = _4094;
    float _4178;
    float _4180;
    float _4182;
    float _4184;
    if (!_4128)
    {
        bool _4162 = _4124 >= 3;
        bool _4164 = !_4162;
        if (!_4164)
        {
            bool _4166 = _4124 != 3;
            _4168 = _4166;
            if (!_4168)
            {
                float _4170 = _143 + _4064;
                float _4172 = _145 + _4066;
                float _4174 = _147 + _4068;
                float _4176 = _4070 + 1.0;
                _4138 = _4170;
                _4140 = _4172;
                _4142 = _4174;
                _4144 = _4176;
                _4178 = _4072;
                _4180 = _4074;
                _4182 = _4076;
                _4184 = _4078;
                _4186 = true;
            }
        }
        else
        {
            float _4188 = _143 + _4080;
            float _4190 = _145 + _4082;
            float _4192 = _147 + _4084;
            float _4194 = _4086 + 1.0;
            _4178 = _4072;
            _4180 = _4074;
            _4182 = _4076;
            _4184 = _4078;
            _4146 = _4188;
            _4148 = _4190;
            _4150 = _4192;
            _4152 = _4194;
            _4186 = true;
        }
    }
    if ((!_4186) || _4168)
    {
        bool _4196;
        if (!_4168)
        {
            _4196 = _4124 >= 1;
        }
        if ((!_4196) || _4168)
        {
            if (!_4168)
            {
                bool _4198 = _4124 != 0;
                if (!_4198)
                {
                    float _4200 = _143 + _4072;
                    _4130 = _4200;
                }
                float _4202 = _4130;
                _4178 = _4202;
                if (!_4198)
                {
                    float _4204 = _145 + _4074;
                    _4132 = _4204;
                }
                float _4206 = _4132;
                _4180 = _4206;
                if (!_4198)
                {
                    float _4208 = _147 + _4076;
                    _4134 = _4208;
                }
                float _4210 = _4134;
                _4182 = _4210;
                if (!_4198)
                {
                    float _4212 = _4078 + 1.0;
                    _4136 = _4212;
                }
                float _4214 = _4136;
                bool _4216 = !_4198;
                _4184 = _4214;
                _4186 = _4216;
            }
            if ((!_4186) || _4168)
            {
                _4168 = false;
                _4178 = _4072;
                _4180 = _4074;
                _4182 = _4076;
                _4184 = _4078;
                _4186 = true;
            }
        }
        else
        {
            float _4218 = _143 + _4088;
            float _4220 = _145 + _4090;
            float _4222 = _147 + _4092;
            float _4224 = _4094 + 1.0;
            _4178 = _4072;
            _4180 = _4074;
            _4182 = _4076;
            _4184 = _4078;
            _4154 = _4218;
            _4156 = _4220;
            _4158 = _4222;
            _4160 = _4224;
        }
    }
    _4186 = false;
    float _4226 = _4138;
    float _4228 = _4140;
    float _4230 = _4142;
    float _4232 = _4144;
    float _4234 = _4178;
    float _4236 = _4180;
    float _4238 = _4182;
    float _4240 = _4184;
    float _4242 = _4146;
    float _4244 = _4148;
    float _4246 = _4150;
    float _4248 = _4152;
    float _4250 = _4154;
    float _4252 = _4156;
    float _4254 = _4158;
    float _4256 = _4160;
    float _4258 = -_2473;
    float _4260 = _153 + _4258;
    float _4262 = -_2477;
    float _4264 = _151 + _4262;
    float _4266 = _2487 * _4260;
    float _4268 = -_2481;
    float _4270 = _155 + _4268;
    float _4272 = fma(_2491, _4264, _4266);
    float _4274 = fma(_2495, _4270, _4272);
    float _4276 = _2523 * _4274;
    float _4278 = rint(_4276);
    float _4280 = precise::max(0.0, _4278);
    float _4282 = precise::min(_4280, 3.0);
    float _4284 = trunc(_4282);
    int _4286 = int(_4284);
    bool _4288 = _4286 >= 2;
    bool _4290 = !_4288;
    float _4292 = _4278;
    float _4294 = as_type<float>(_4286);
    float _4296 = _4266;
    float _4298 = _4272;
    float _4300 = _4226;
    float _4302 = _4228;
    float _4304 = _4230;
    float _4306 = _4232;
    float _4308 = _4242;
    float _4310 = _4244;
    float _4312 = _4246;
    float _4314 = _4248;
    float _4316 = _4250;
    float _4318 = _4252;
    float _4320 = _4254;
    float _4322 = _4256;
    float _4340;
    float _4342;
    float _4344;
    float _4346;
    if (!_4290)
    {
        bool _4324 = _4286 >= 3;
        bool _4326 = !_4324;
        if (!_4326)
        {
            bool _4328 = _4286 != 3;
            _4330 = _4328;
            if (!_4330)
            {
                float _4332 = _151 + _4226;
                float _4334 = _153 + _4228;
                float _4336 = _155 + _4230;
                float _4338 = _4232 + 1.0;
                _4300 = _4332;
                _4302 = _4334;
                _4304 = _4336;
                _4306 = _4338;
                _4340 = _4234;
                _4342 = _4236;
                _4344 = _4238;
                _4346 = _4240;
                _4348 = true;
            }
        }
        else
        {
            float _4350 = _151 + _4242;
            float _4352 = _153 + _4244;
            float _4354 = _155 + _4246;
            float _4356 = _4248 + 1.0;
            _4340 = _4234;
            _4342 = _4236;
            _4344 = _4238;
            _4346 = _4240;
            _4308 = _4350;
            _4310 = _4352;
            _4312 = _4354;
            _4314 = _4356;
            _4348 = true;
        }
    }
    if ((!_4348) || _4330)
    {
        bool _4358;
        if (!_4330)
        {
            _4358 = _4286 >= 1;
        }
        if ((!_4358) || _4330)
        {
            if (!_4330)
            {
                bool _4360 = _4286 != 0;
                if (!_4360)
                {
                    float _4362 = _151 + _4234;
                    _4292 = _4362;
                }
                float _4364 = _4292;
                _4340 = _4364;
                if (!_4360)
                {
                    float _4366 = _153 + _4236;
                    _4294 = _4366;
                }
                float _4368 = _4294;
                _4342 = _4368;
                if (!_4360)
                {
                    float _4370 = _155 + _4238;
                    _4296 = _4370;
                }
                float _4372 = _4296;
                _4344 = _4372;
                if (!_4360)
                {
                    float _4374 = _4240 + 1.0;
                    _4298 = _4374;
                }
                float _4376 = _4298;
                bool _4378 = !_4360;
                _4346 = _4376;
                _4348 = _4378;
            }
            if ((!_4348) || _4330)
            {
                _4330 = false;
                _4340 = _4234;
                _4342 = _4236;
                _4344 = _4238;
                _4346 = _4240;
                _4348 = true;
            }
        }
        else
        {
            float _4380 = _151 + _4250;
            float _4382 = _153 + _4252;
            float _4384 = _155 + _4254;
            float _4386 = _4256 + 1.0;
            _4340 = _4234;
            _4342 = _4236;
            _4344 = _4238;
            _4346 = _4240;
            _4316 = _4380;
            _4318 = _4382;
            _4320 = _4384;
            _4322 = _4386;
        }
    }
    _4348 = false;
    float _4388 = _4300;
    float _4390 = _4302;
    float _4392 = _4304;
    float _4394 = _4306;
    float _4396 = _4340;
    float _4398 = _4342;
    float _4400 = _4344;
    float _4402 = _4346;
    float _4404 = _4308;
    float _4406 = _4310;
    float _4408 = _4312;
    float _4410 = _4314;
    float _4412 = _4316;
    float _4414 = _4318;
    float _4416 = _4320;
    float _4418 = _4322;
    float _4420 = -_2473;
    float _4422 = _161 + _4420;
    float _4424 = -_2477;
    float _4426 = _159 + _4424;
    float _4428 = _2487 * _4422;
    float _4430 = -_2481;
    float _4432 = _163 + _4430;
    float _4434 = fma(_2491, _4426, _4428);
    float _4436 = fma(_2495, _4432, _4434);
    float _4438 = _2523 * _4436;
    float _4440 = rint(_4438);
    float _4442 = precise::max(0.0, _4440);
    float _4444 = precise::min(_4442, 3.0);
    float _4446 = trunc(_4444);
    int _4448 = int(_4446);
    bool _4450 = _4448 >= 2;
    bool _4452 = !_4450;
    float _4454 = _4440;
    float _4456 = as_type<float>(_4448);
    float _4458 = _4428;
    float _4460 = _4434;
    float _4462 = _4388;
    float _4464 = _4390;
    float _4466 = _4392;
    float _4468 = _4394;
    float _4470 = _4404;
    float _4472 = _4406;
    float _4474 = _4408;
    float _4476 = _4410;
    float _4478 = _4412;
    float _4480 = _4414;
    float _4482 = _4416;
    float _4484 = _4418;
    float _4502;
    float _4504;
    float _4506;
    float _4508;
    if (!_4452)
    {
        bool _4486 = _4448 >= 3;
        bool _4488 = !_4486;
        if (!_4488)
        {
            bool _4490 = _4448 != 3;
            _4492 = _4490;
            if (!_4492)
            {
                float _4494 = _159 + _4388;
                float _4496 = _161 + _4390;
                float _4498 = _163 + _4392;
                float _4500 = _4394 + 1.0;
                _4462 = _4494;
                _4464 = _4496;
                _4466 = _4498;
                _4468 = _4500;
                _4502 = _4396;
                _4504 = _4398;
                _4506 = _4400;
                _4508 = _4402;
                _4510 = true;
            }
        }
        else
        {
            float _4512 = _159 + _4404;
            float _4514 = _161 + _4406;
            float _4516 = _163 + _4408;
            float _4518 = _4410 + 1.0;
            _4502 = _4396;
            _4504 = _4398;
            _4506 = _4400;
            _4508 = _4402;
            _4470 = _4512;
            _4472 = _4514;
            _4474 = _4516;
            _4476 = _4518;
            _4510 = true;
        }
    }
    if ((!_4510) || _4492)
    {
        bool _4520;
        if (!_4492)
        {
            _4520 = _4448 >= 1;
        }
        if ((!_4520) || _4492)
        {
            if (!_4492)
            {
                bool _4522 = _4448 != 0;
                if (!_4522)
                {
                    float _4524 = _159 + _4396;
                    _4454 = _4524;
                }
                float _4526 = _4454;
                _4502 = _4526;
                if (!_4522)
                {
                    float _4528 = _161 + _4398;
                    _4456 = _4528;
                }
                float _4530 = _4456;
                _4504 = _4530;
                if (!_4522)
                {
                    float _4532 = _163 + _4400;
                    _4458 = _4532;
                }
                float _4534 = _4458;
                _4506 = _4534;
                if (!_4522)
                {
                    float _4536 = _4402 + 1.0;
                    _4460 = _4536;
                }
                float _4538 = _4460;
                bool _4540 = !_4522;
                _4508 = _4538;
                _4510 = _4540;
            }
            if ((!_4510) || _4492)
            {
                _4492 = false;
                _4502 = _4396;
                _4504 = _4398;
                _4506 = _4400;
                _4508 = _4402;
                _4510 = true;
            }
        }
        else
        {
            float _4542 = _159 + _4412;
            float _4544 = _161 + _4414;
            float _4546 = _163 + _4416;
            float _4548 = _4418 + 1.0;
            _4502 = _4396;
            _4504 = _4398;
            _4506 = _4400;
            _4508 = _4402;
            _4478 = _4542;
            _4480 = _4544;
            _4482 = _4546;
            _4484 = _4548;
        }
    }
    _4510 = false;
    float _4550 = _4462;
    float _4552 = _4464;
    float _4554 = _4466;
    float _4556 = _4468;
    float _4558 = _4502;
    float _4560 = _4504;
    float _4562 = _4506;
    float _4564 = _4508;
    float _4566 = _4470;
    float _4568 = _4472;
    float _4570 = _4474;
    float _4572 = _4476;
    float _4574 = _4478;
    float _4576 = _4480;
    float _4578 = _4482;
    float _4580 = _4484;
    float _4582 = -_2473;
    float _4584 = _169 + _4582;
    float _4586 = -_2477;
    float _4588 = _167 + _4586;
    float _4590 = _2487 * _4584;
    float _4592 = -_2481;
    float _4594 = _171 + _4592;
    float _4596 = fma(_2491, _4588, _4590);
    float _4598 = fma(_2495, _4594, _4596);
    float _4600 = _2523 * _4598;
    float _4602 = rint(_4600);
    float _4604 = precise::max(0.0, _4602);
    float _4606 = precise::min(_4604, 3.0);
    float _4608 = trunc(_4606);
    int _4610 = int(_4608);
    bool _4612 = _4610 >= 2;
    bool _4614 = !_4612;
    float _4616 = _4602;
    float _4618 = as_type<float>(_4610);
    float _4620 = _4590;
    float _4622 = _4596;
    float _4624 = _4550;
    float _4626 = _4552;
    float _4628 = _4554;
    float _4630 = _4556;
    float _4632 = _4566;
    float _4634 = _4568;
    float _4636 = _4570;
    float _4638 = _4572;
    float _4640 = _4574;
    float _4642 = _4576;
    float _4644 = _4578;
    float _4646 = _4580;
    float _4664;
    float _4666;
    float _4668;
    float _4670;
    if (!_4614)
    {
        bool _4648 = _4610 >= 3;
        bool _4650 = !_4648;
        if (!_4650)
        {
            bool _4652 = _4610 != 3;
            _4654 = _4652;
            if (!_4654)
            {
                float _4656 = _167 + _4550;
                float _4658 = _169 + _4552;
                float _4660 = _171 + _4554;
                float _4662 = _4556 + 1.0;
                _4624 = _4656;
                _4626 = _4658;
                _4628 = _4660;
                _4630 = _4662;
                _4664 = _4558;
                _4666 = _4560;
                _4668 = _4562;
                _4670 = _4564;
                _4672 = true;
            }
        }
        else
        {
            float _4674 = _167 + _4566;
            float _4676 = _169 + _4568;
            float _4678 = _171 + _4570;
            float _4680 = _4572 + 1.0;
            _4664 = _4558;
            _4666 = _4560;
            _4668 = _4562;
            _4670 = _4564;
            _4632 = _4674;
            _4634 = _4676;
            _4636 = _4678;
            _4638 = _4680;
            _4672 = true;
        }
    }
    if ((!_4672) || _4654)
    {
        bool _4682;
        if (!_4654)
        {
            _4682 = _4610 >= 1;
        }
        if ((!_4682) || _4654)
        {
            if (!_4654)
            {
                bool _4684 = _4610 != 0;
                if (!_4684)
                {
                    float _4686 = _167 + _4558;
                    _4616 = _4686;
                }
                float _4688 = _4616;
                _4664 = _4688;
                if (!_4684)
                {
                    float _4690 = _169 + _4560;
                    _4618 = _4690;
                }
                float _4692 = _4618;
                _4666 = _4692;
                if (!_4684)
                {
                    float _4694 = _171 + _4562;
                    _4620 = _4694;
                }
                float _4696 = _4620;
                _4668 = _4696;
                if (!_4684)
                {
                    float _4698 = _4564 + 1.0;
                    _4622 = _4698;
                }
                float _4700 = _4622;
                bool _4702 = !_4684;
                _4670 = _4700;
                _4672 = _4702;
            }
            if ((!_4672) || _4654)
            {
                _4654 = false;
                _4664 = _4558;
                _4666 = _4560;
                _4668 = _4562;
                _4670 = _4564;
                _4672 = true;
            }
        }
        else
        {
            float _4704 = _167 + _4574;
            float _4706 = _169 + _4576;
            float _4708 = _171 + _4578;
            float _4710 = _4580 + 1.0;
            _4664 = _4558;
            _4666 = _4560;
            _4668 = _4562;
            _4670 = _4564;
            _4640 = _4704;
            _4642 = _4706;
            _4644 = _4708;
            _4646 = _4710;
        }
    }
    _4672 = false;
    float _4712 = _4624;
    float _4714 = _4626;
    float _4716 = _4628;
    float _4718 = _4630;
    float _4720 = _4664;
    float _4722 = _4666;
    float _4724 = _4668;
    float _4726 = _4670;
    float _4728 = _4632;
    float _4730 = _4634;
    float _4732 = _4636;
    float _4734 = _4638;
    float _4736 = _4640;
    float _4738 = _4642;
    float _4740 = _4644;
    float _4742 = _4646;
    float _4744 = -_2473;
    float _4746 = _177 + _4744;
    float _4748 = -_2477;
    float _4750 = _175 + _4748;
    float _4752 = _2487 * _4746;
    float _4754 = -_2481;
    float _4756 = _179 + _4754;
    float _4758 = fma(_2491, _4750, _4752);
    float _4760 = fma(_2495, _4756, _4758);
    float _4762 = _2523 * _4760;
    float _4764 = rint(_4762);
    float _4766 = precise::max(0.0, _4764);
    float _4768 = precise::min(_4766, 3.0);
    float _4770 = trunc(_4768);
    int _4772 = int(_4770);
    bool _4774 = _4772 >= 2;
    bool _4776 = !_4774;
    float _4778 = _4764;
    float _4780 = as_type<float>(_4772);
    float _4782 = _4752;
    float _4784 = _4758;
    float _4786 = _4712;
    float _4788 = _4714;
    float _4790 = _4716;
    float _4792 = _4718;
    float _4794 = _4728;
    float _4796 = _4730;
    float _4798 = _4732;
    float _4800 = _4734;
    float _4802 = _4736;
    float _4804 = _4738;
    float _4806 = _4740;
    float _4808 = _4742;
    float _4826;
    float _4828;
    float _4830;
    float _4832;
    if (!_4776)
    {
        bool _4810 = _4772 >= 3;
        bool _4812 = !_4810;
        if (!_4812)
        {
            bool _4814 = _4772 != 3;
            _4816 = _4814;
            if (!_4816)
            {
                float _4818 = _175 + _4712;
                float _4820 = _177 + _4714;
                float _4822 = _179 + _4716;
                float _4824 = _4718 + 1.0;
                _4786 = _4818;
                _4788 = _4820;
                _4790 = _4822;
                _4792 = _4824;
                _4826 = _4720;
                _4828 = _4722;
                _4830 = _4724;
                _4832 = _4726;
                _4834 = true;
            }
        }
        else
        {
            float _4836 = _175 + _4728;
            float _4838 = _177 + _4730;
            float _4840 = _179 + _4732;
            float _4842 = _4734 + 1.0;
            _4826 = _4720;
            _4828 = _4722;
            _4830 = _4724;
            _4832 = _4726;
            _4794 = _4836;
            _4796 = _4838;
            _4798 = _4840;
            _4800 = _4842;
            _4834 = true;
        }
    }
    if ((!_4834) || _4816)
    {
        bool _4844;
        if (!_4816)
        {
            _4844 = _4772 >= 1;
        }
        if ((!_4844) || _4816)
        {
            if (!_4816)
            {
                bool _4846 = _4772 != 0;
                if (!_4846)
                {
                    float _4848 = _175 + _4720;
                    _4778 = _4848;
                }
                float _4850 = _4778;
                _4826 = _4850;
                if (!_4846)
                {
                    float _4852 = _177 + _4722;
                    _4780 = _4852;
                }
                float _4854 = _4780;
                _4828 = _4854;
                if (!_4846)
                {
                    float _4856 = _179 + _4724;
                    _4782 = _4856;
                }
                float _4858 = _4782;
                _4830 = _4858;
                if (!_4846)
                {
                    float _4860 = _4726 + 1.0;
                    _4784 = _4860;
                }
                float _4862 = _4784;
                bool _4864 = !_4846;
                _4832 = _4862;
                _4834 = _4864;
            }
            if ((!_4834) || _4816)
            {
                _4816 = false;
                _4826 = _4720;
                _4828 = _4722;
                _4830 = _4724;
                _4832 = _4726;
                _4834 = true;
            }
        }
        else
        {
            float _4866 = _175 + _4736;
            float _4868 = _177 + _4738;
            float _4870 = _179 + _4740;
            float _4872 = _4742 + 1.0;
            _4826 = _4720;
            _4828 = _4722;
            _4830 = _4724;
            _4832 = _4726;
            _4802 = _4866;
            _4804 = _4868;
            _4806 = _4870;
            _4808 = _4872;
        }
    }
    _4834 = false;
    float _4874 = _4786;
    float _4876 = _4788;
    float _4878 = _4790;
    float _4880 = _4792;
    float _4882 = _4826;
    float _4884 = _4828;
    float _4886 = _4830;
    float _4888 = _4832;
    float _4890 = _4794;
    float _4892 = _4796;
    float _4894 = _4798;
    float _4896 = _4800;
    float _4898 = _4802;
    float _4900 = _4804;
    float _4902 = _4806;
    float _4904 = _4808;
    float _4906 = -_2473;
    float _4908 = _185 + _4906;
    float _4910 = -_2477;
    float _4912 = _183 + _4910;
    float _4914 = _2487 * _4908;
    float _4916 = -_2481;
    float _4918 = _187 + _4916;
    float _4920 = fma(_2491, _4912, _4914);
    float _4922 = fma(_2495, _4918, _4920);
    float _4924 = _2523 * _4922;
    float _4926 = rint(_4924);
    float _4928 = precise::max(0.0, _4926);
    float _4930 = precise::min(_4928, 3.0);
    float _4932 = trunc(_4930);
    int _4934 = int(_4932);
    bool _4936 = _4934 >= 2;
    bool _4938 = !_4936;
    float _4940 = as_type<float>(_4934);
    float _4942 = _4926;
    float _4944 = _4918;
    float _4946 = _4914;
    float _4948 = _4904;
    float _4950 = _4896;
    float _4952 = _4890;
    float _4954 = _4880;
    float _4956 = _4898;
    float _4958 = _4900;
    float _4960 = _4902;
    float _4962 = _4894;
    float _4964 = _4892;
    float _4966 = _4876;
    float _4968 = _4874;
    float _4970 = _4878;
    float _4988;
    float _4990;
    float _4992;
    float _4994;
    if (!_4938)
    {
        bool _4972 = _4934 >= 3;
        bool _4974 = !_4972;
        if (!_4974)
        {
            bool _4976 = _4934 != 3;
            _4978 = _4976;
            if (!_4978)
            {
                float _4980 = _183 + _4874;
                float _4982 = _185 + _4876;
                float _4984 = _187 + _4878;
                float _4986 = _4880 + 1.0;
                _4988 = _4888;
                _4954 = _4986;
                _4990 = _4882;
                _4992 = _4884;
                _4994 = _4886;
                _4966 = _4982;
                _4968 = _4980;
                _4970 = _4984;
                _4996 = true;
            }
        }
        else
        {
            float _4998 = _183 + _4890;
            float _5000 = _185 + _4892;
            float _5002 = _187 + _4894;
            float _5004 = _4896 + 1.0;
            _4950 = _5004;
            _4952 = _4998;
            _4988 = _4888;
            _4990 = _4882;
            _4962 = _5002;
            _4992 = _4884;
            _4964 = _5000;
            _4994 = _4886;
            _4996 = true;
        }
    }
    if ((!_4996) || _4978)
    {
        bool _5006;
        if (!_4978)
        {
            _5006 = _4934 >= 1;
        }
        if ((!_5006) || _4978)
        {
            if (!_4978)
            {
                bool _5008 = _4934 != 0;
                if (!_5008)
                {
                    float _5010 = _183 + _4882;
                    _4940 = _5010;
                }
                float _5012 = _4940;
                _4990 = _5012;
                if (!_5008)
                {
                    float _5014 = _185 + _4884;
                    _4942 = _5014;
                }
                float _5016 = _4942;
                _4992 = _5016;
                if (!_5008)
                {
                    float _5018 = _187 + _4886;
                    _4944 = _5018;
                }
                float _5020 = _4944;
                _4994 = _5020;
                if (!_5008)
                {
                    float _5022 = _4888 + 1.0;
                    _4946 = _5022;
                }
                float _5024 = _4946;
                bool _5026 = !_5008;
                _4988 = _5024;
                _4996 = _5026;
            }
            if ((!_4996) || _4978)
            {
                _4978 = false;
                _4988 = _4888;
                _4990 = _4882;
                _4992 = _4884;
                _4994 = _4886;
                _4996 = true;
            }
        }
        else
        {
            float _5028 = _183 + _4898;
            float _5030 = _185 + _4900;
            float _5032 = _187 + _4902;
            float _5034 = _4904 + 1.0;
            _4948 = _5034;
            _4988 = _4888;
            _4956 = _5028;
            _4958 = _5030;
            _4990 = _4882;
            _4960 = _5032;
            _4992 = _4884;
            _4994 = _4886;
        }
    }
    _4996 = false;
    float _5036 = _4948;
    float _5038 = _4950;
    float _5040 = _4952;
    float _5042 = _4988;
    float _5044 = _4954;
    float _5046 = _4956;
    float _5048 = _4958;
    float _5050 = _4990;
    float _5052 = _4960;
    float _5054 = _4962;
    float _5056 = _4992;
    float _5058 = _4964;
    float _5060 = _4994;
    float _5062 = _4966;
    float _5064 = _4968;
    float _5066 = _4970;
    float _5068 = _5036 * 4.0;
    float _5070 = fma(_5038, 4.0, _5036);
    float _5072 = _5038 + _5036;
    float _5074 = _5040 * 6.0;
    float _5076 = fma(_5042, 9.0, _5068);
    float _5078 = fma(_5044, 9.0, _5070);
    float _5080 = _5046 * 6.0;
    float _5082 = _5072 * 2.0;
    float _5084 = _5076 + _5038;
    float _5086 = _5048 * 6.0;
    float _5088 = fma(_5050, 9.0, _5080);
    float _5090 = _5052 * 6.0;
    float _5092 = _5084 * _5078;
    float _5094 = _5054 * 6.0;
    float _5096 = fma(_5046, 3.0, _5074);
    float _5098 = fma(_5056, 9.0, _5086);
    float _5100 = -_5092;
    float _5102 = fma(_5082, _5082, _5100);
    float _5104 = _5058 * 6.0;
    float _5106 = fma(_5060, 9.0, _5090);
    float _5108 = fma(_5052, 3.0, _5094);
    bool _5110 = _5102 != 0.0;
    bool _5112 = isnan(_5102);
    bool _5114 = _5110 || _5112;
    bool _5116 = isnan(0.0);
    bool _5118 = _5114 || _5116;
    float _5120 = fma(_5048, 3.0, _5104);
    float _5122 = fma(_5040, 3.0, _5088);
    float _5124 = fma(_5058, 3.0, _5098);
    float _5126 = fma(_5054, 3.0, _5106);
    float _5128 = fma(_5062, 9.0, _5120);
    float _5130 = fma(_5064, 9.0, _5096);
    float _5132 = fma(_5066, 9.0, _5108);
    bool _5134 = !_5118;
    if (!_5134)
    {
        float _5136 = 1.0 / _5102;
        float _5138 = _5122 * _5078;
        float _5140 = _5084 * _5130;
        float _5142 = _5084 * _5132;
        float _5144 = -_5138;
        float _5146 = fma(_5130, _5082, _5144);
        float _5148 = -_5140;
        float _5150 = fma(_5122, _5082, _5148);
        float _5152 = _5124 * _5078;
        float _5154 = _5084 * _5128;
        float _5156 = _5126 * _5078;
        float _5158 = -_5142;
        float _5160 = fma(_5126, _5082, _5158);
        float _5162 = -_5152;
        float _5164 = fma(_5128, _5082, _5162);
        float _5166 = -_5154;
        float _5168 = fma(_5124, _5082, _5166);
        float _5170 = -_5156;
        float _5172 = fma(_5132, _5082, _5170);
        float _5174 = _5150 * _5136;
        float _5176 = _5168 * _5136;
        float _5178 = _5160 * _5136;
        float _5180 = _5146 * _5136;
        float _5182 = _5164 * _5136;
        float _5184 = _5172 * _5136;
        float _5186 = -_5180;
        float _5188 = _5174 + _5186;
        float _5190 = -_5182;
        float _5192 = _5176 + _5190;
        float _5194 = -_5184;
        float _5196 = _5178 + _5194;
        _2542 = _5188;
        _2544 = _5192;
        _2546 = _5196;
        _2548 = _5180;
        _2550 = _5174;
        _2552 = _5182;
        _2554 = _5176;
        _2556 = _5178;
        _2558 = _5184;
    }
    float _5198 = _2542;
    float _5200 = _2544;
    float _5202 = _2546;
    float _5204 = _2548;
    float _5206 = _2550;
    float _5208 = _2552;
    float _5210 = _2554;
    float _5212 = _2556;
    float _5214 = _2558;
    float _5216 = fma(_5198, 496.0, 0.5);
    float _5218 = precise::clamp(_5216, 0.0, 1.0);
    float _5220 = fma(_5198, -31.0, 1.0);
    float _5222 = precise::clamp(_5220, 0.0, 1.0);
    float _5224 = _5218 + (-0.5);
    float _5226 = fma(_5200, 1008.0, 0.5);
    float _5228 = precise::clamp(_5226, 0.0, 1.0);
    float _5230 = fma(_5200, -63.0, 1.0);
    float _5232 = precise::clamp(_5230, 0.0, 1.0);
    float _5234 = fma(_5202, 496.0, 0.5);
    float _5236 = precise::clamp(_5234, 0.0, 1.0);
    float _5238 = _5222 * _5224;
    float _5240 = _5228 + (-0.5);
    float _5242 = fma(_5202, -31.0, 1.0);
    float _5244 = precise::clamp(_5242, 0.0, 1.0);
    float _5246 = fma(_5238, -0.0322580635547637939453125, _5204);
    float _5248 = precise::clamp(_5246, 0.0, 1.0);
    float _5250 = _5232 * _5240;
    float _5252 = _5250 * 2.0;
    float _5254 = fma(_5238, 0.0322580635547637939453125, _5206);
    float _5256 = precise::clamp(_5254, 0.0, 1.0);
    float _5258 = _5248 * 31.0;
    float _5260 = fma(_5252, -0.01587301678955554962158203125, _5208);
    float _5262 = precise::clamp(_5260, 0.0, 1.0);
    float _5264 = fma(_5252, 0.01587301678955554962158203125, _5210);
    float _5266 = precise::clamp(_5264, 0.0, 1.0);
    float _5268 = _5256 * 31.0;
    float _5270 = rint(_5258);
    float _5272 = _5262 * 63.0;
    float _5274 = _5236 + (-0.5);
    float _5276 = _5266 * 63.0;
    float _5278 = _5244 * _5274;
    float _5280 = rint(_5268);
    float _5282 = fma(_5278, 0.0322580635547637939453125, _5212);
    float _5284 = precise::clamp(_5282, 0.0, 1.0);
    float _5286 = fma(_5278, -0.0322580635547637939453125, _5214);
    float _5288 = precise::clamp(_5286, 0.0, 1.0);
    float _5290 = _5284 * 31.0;
    float _5292 = _5288 * 31.0;
    float _5294 = rint(_5276);
    float _5296 = rint(_5272);
    float _5298 = _5280 + 0.5;
    float _5300 = _5270 + 0.5;
    float _5302 = rint(_5290);
    float _5304 = _5294 + 0.5;
    float _5306 = rint(_5292);
    float _5308 = _5296 + 0.5;
    float _5310 = _5302 + 0.5;
    float _5312 = trunc(_5298);
    float _5314 = precise::max(_5312, 0.0);
    uint _5317 = uint(_5314);
    float _5319 = _5306 + 0.5;
    float _5321 = trunc(_5304);
    float _5323 = precise::max(_5321, 0.0);
    uint _5325 = uint(_5323);
    float _5327 = trunc(_5300);
    float _5329 = precise::max(_5327, 0.0);
    uint _5331 = uint(_5329);
    int _5333 = int(_5317) << 11;
    float _5335 = trunc(_5308);
    float _5337 = precise::max(_5335, 0.0);
    uint _5339 = uint(_5337);
    int _5341 = int(_5325) << 5;
    float _5343 = trunc(_5310);
    float _5345 = precise::max(_5343, 0.0);
    uint _5347 = uint(_5345);
    int _5349 = int(_5331) << 11;
    float _5351 = trunc(_5319);
    float _5353 = precise::max(_5351, 0.0);
    uint _5355 = uint(_5353);
    int _5357 = int(_5339) << 5;
    int _5359 = _5333 | _5341;
    int _5361 = int(_5347) | _5359;
    int _5363 = _5349 | _5357;
    int _5365 = int(_5355) | _5363;
    bool _5367 = _5361 != _5365;
    int _5369 = _5341;
    int _5371 = _5357;
    int _5373 = int(_5331);
    if (!_5367)
    {
        _5369 = _5361;
    }
    int _5375 = _5369;
    if (!_5367)
    {
        _5371 = 0;
        _5373 = 0;
    }
    int _5377 = _5371;
    int _5379 = _5373;
    if (!_5367)
    {
        out.m_32.x = as_type<float>(_5375);
        out.m_32.y = as_type<float>(_5361);
        out.m_32.z = as_type<float>(_5377);
        out.m_32.w = as_type<float>(_5379);
        return out;
    }
    float _5381 = _5280 * 0.0322580635547637939453125;
    float _5383 = _5270 * 0.0322580635547637939453125;
    float _5385 = _5294 * 0.01587301678955554962158203125;
    bool _5387 = uint(_5361) >= uint(_5365);
    float _5389 = _5296 * 0.01587301678955554962158203125;
    float _5391 = _5302 * 0.0322580635547637939453125;
    float _5393 = _5306 * 0.0322580635547637939453125;
    bool _5395 = !_5387;
    float _5397 = _5395 ? _5381 : _5383;
    bool _5399 = !_5387;
    float _5401 = _5399 ? _5383 : _5381;
    bool _5403 = !_5387;
    float _5405 = _5403 ? _5385 : _5389;
    float _5407 = -_5397;
    float _5409 = _119 + _5407;
    bool _5411 = !_5387;
    float _5413 = _5411 ? _5389 : _5385;
    float _5415 = -_5397;
    float _5417 = _5415 + _5401;
    bool _5419 = !_5387;
    float _5421 = _5419 ? _5391 : _5393;
    float _5423 = -_5405;
    float _5425 = _121 + _5423;
    bool _5427 = !_5387;
    float _5429 = _5427 ? _5393 : _5391;
    float _5431 = -_5405;
    float _5433 = _5431 + _5413;
    float _5435 = -_5405;
    float _5437 = _185 + _5435;
    float _5439 = -_5421;
    float _5441 = _123 + _5439;
    float _5443 = -_5397;
    float _5445 = _183 + _5443;
    float _5447 = _5433 * _5433;
    float _5449 = -_5421;
    float _5451 = _5449 + _5429;
    float _5453 = -_5405;
    float _5455 = _113 + _5453;
    float _5457 = -_5405;
    float _5459 = _105 + _5457;
    float _5461 = fma(_5417, _5417, _5447);
    float _5463 = -_5405;
    float _5465 = _97 + _5463;
    float _5467 = -_5405;
    float _5469 = _89 + _5467;
    float _5471 = -_5405;
    float _5473 = _81 + _5471;
    float _5475 = fma(_5451, _5451, _5461);
    float _5477 = -_5405;
    float _5479 = _65 + _5477;
    float _5481 = -_5405;
    float _5483 = _73 + _5481;
    float _5485 = -_5405;
    float _5487 = _177 + _5485;
    float _5489 = -_5405;
    float _5491 = _169 + _5489;
    float _5493 = -_5405;
    float _5495 = _161 + _5493;
    float _5497 = 1.0 / _5475;
    float _5499 = -_5405;
    float _5501 = _153 + _5499;
    float _5503 = -_5405;
    float _5505 = _145 + _5503;
    float _5507 = -_5405;
    float _5509 = _137 + _5507;
    float _5511 = -_5405;
    float _5513 = _129 + _5511;
    float _5515 = -_5421;
    float _5517 = _187 + _5515;
    float _5519 = -_5397;
    float _5521 = _111 + _5519;
    float _5523 = -_5397;
    float _5525 = _103 + _5523;
    float _5527 = -_5397;
    float _5529 = _95 + _5527;
    float _5531 = -_5397;
    float _5533 = _87 + _5531;
    float _5535 = -_5397;
    float _5537 = _79 + _5535;
    float _5539 = -_5397;
    float _5541 = _63 + _5539;
    float _5543 = -_5397;
    float _5545 = _71 + _5543;
    float _5547 = -_5397;
    float _5549 = _175 + _5547;
    float _5551 = -_5397;
    float _5553 = _167 + _5551;
    float _5555 = -_5397;
    float _5557 = _159 + _5555;
    float _5559 = _5433 * _5497;
    float _5561 = _5417 * _5497;
    float _5563 = _5451 * _5497;
    float _5565 = -_5397;
    float _5567 = _151 + _5565;
    float _5569 = _5559 * _5425;
    float _5571 = _5559 * _5437;
    float _5573 = _5559 * _5455;
    float _5575 = -_5397;
    float _5577 = _143 + _5575;
    float _5579 = fma(_5561, _5409, _5569);
    float _5581 = fma(_5561, _5445, _5571);
    float _5583 = -_5397;
    float _5585 = _135 + _5583;
    float _5587 = -_5397;
    float _5589 = _127 + _5587;
    float _5591 = fma(_5563, _5441, _5579);
    float _5593 = _5559 * _5459;
    float _5595 = _5559 * _5465;
    float _5597 = _5559 * _5469;
    float _5599 = _5559 * _5473;
    float _5601 = _5559 * _5479;
    float _5603 = _5559 * _5483;
    float _5605 = _5559 * _5487;
    float _5607 = _5559 * _5491;
    float _5609 = _5559 * _5495;
    float _5611 = _5559 * _5501;
    float _5613 = _5559 * _5505;
    float _5615 = _5559 * _5509;
    float _5617 = _5559 * _5513;
    float _5619 = fma(_5563, _5517, _5581);
    bool _5621 = _5591 >= 0.5;
    float _5623 = -_5421;
    float _5625 = _115 + _5623;
    float _5627 = fma(_5561, _5521, _5573);
    float _5629 = -_5421;
    float _5631 = _107 + _5629;
    float _5633 = -_5421;
    float _5635 = _99 + _5633;
    float _5637 = -_5421;
    float _5639 = _91 + _5637;
    float _5641 = -_5421;
    float _5643 = _83 + _5641;
    float _5645 = -_5421;
    float _5647 = _67 + _5645;
    float _5649 = -_5421;
    float _5651 = _75 + _5649;
    float _5653 = -_5421;
    float _5655 = _179 + _5653;
    float _5657 = -_5421;
    float _5659 = _171 + _5657;
    float _5661 = -_5421;
    float _5663 = _163 + _5661;
    float _5665 = -_5421;
    float _5667 = _155 + _5665;
    float _5669 = -_5421;
    float _5671 = _147 + _5669;
    float _5673 = -_5421;
    float _5675 = _139 + _5673;
    float _5677 = -_5421;
    float _5679 = _131 + _5677;
    float _5681 = fma(_5561, _5525, _5593);
    float _5683 = fma(_5561, _5529, _5595);
    float _5685 = fma(_5561, _5533, _5597);
    float _5687 = fma(_5561, _5537, _5599);
    float _5689 = fma(_5561, _5541, _5601);
    float _5691 = fma(_5561, _5545, _5603);
    float _5693 = fma(_5561, _5549, _5605);
    float _5695 = fma(_5561, _5553, _5607);
    float _5697 = fma(_5561, _5557, _5609);
    float _5699 = fma(_5561, _5567, _5611);
    float _5701 = fma(_5561, _5577, _5613);
    float _5703 = fma(_5561, _5585, _5615);
    float _5705 = fma(_5561, _5589, _5617);
    float _5707 = fma(_5563, _5625, _5627);
    bool _5709 = _5619 >= 0.5;
    float _5711 = fma(_5563, _5631, _5681);
    bool _5713 = _5591 >= 0.833000004291534423828125;
    float _5715 = fma(_5563, _5635, _5683);
    float _5717 = fma(_5563, _5639, _5685);
    float _5719 = fma(_5563, _5643, _5687);
    float _5721 = fma(_5563, _5647, _5689);
    float _5723 = fma(_5563, _5651, _5691);
    float _5725 = fma(_5563, _5655, _5693);
    float _5727 = fma(_5563, _5659, _5695);
    float _5729 = fma(_5563, _5663, _5697);
    float _5731 = fma(_5563, _5667, _5699);
    float _5733 = fma(_5563, _5671, _5701);
    float _5735 = fma(_5563, _5675, _5703);
    float _5737 = fma(_5563, _5679, _5705);
    bool _5739 = _5591 >= 0.16599999368190765380859375;
    int _5741 = _5713 ? 0 : 32768;
    bool _5743 = _5619 >= 0.833000004291534423828125;
    bool _5745 = _5707 >= 0.5;
    int _5747 = _5741;
    if (!_5621)
    {
        int _5749 = _5739 ? 49152 : 16384;
        _5747 = _5749;
    }
    int _5751 = _5747;
    bool _5753 = _5619 >= 0.16599999368190765380859375;
    int _5755 = _5743 ? 0 : 32768;
    bool _5757 = _5725 >= 0.5;
    bool _5759 = _5707 >= 0.833000004291534423828125;
    int _5761 = _5755;
    if (!_5709)
    {
        int _5763 = _5753 ? 49152 : 16384;
        _5761 = _5763;
    }
    int _5765 = _5761;
    bool _5767 = _5707 >= 0.16599999368190765380859375;
    bool _5769 = _5725 >= 0.833000004291534423828125;
    int _5771 = _5759 ? 0 : 8192;
    bool _5773 = _5711 >= 0.5;
    bool _5775 = _5725 >= 0.16599999368190765380859375;
    int _5777 = _5769 ? 0 : 8192;
    int _5779 = _5771;
    int _5781 = _5777;
    if (!_5745)
    {
        int _5783 = _5767 ? 12288 : 4096;
        _5779 = _5783;
    }
    int _5785 = _5779;
    bool _5787 = _5711 >= 0.833000004291534423828125;
    bool _5789 = _5727 >= 0.5;
    if (!_5757)
    {
        int _5791 = _5775 ? 12288 : 4096;
        _5781 = _5791;
    }
    int _5793 = _5781;
    int _5795 = _5787 ? 0 : 2048;
    bool _5797 = _5711 >= 0.16599999368190765380859375;
    bool _5799 = _5727 >= 0.833000004291534423828125;
    bool _5801 = _5715 >= 0.5;
    bool _5803 = _5727 >= 0.16599999368190765380859375;
    int _5805 = _5799 ? 0 : 2048;
    int _5807 = _5795;
    int _5809 = _5805;
    if (!_5773)
    {
        int _5811 = _5797 ? 3072 : 1024;
        _5807 = _5811;
    }
    int _5813 = _5807;
    bool _5815 = _5715 >= 0.833000004291534423828125;
    bool _5817 = _5729 >= 0.5;
    if (!_5789)
    {
        int _5819 = _5803 ? 3072 : 1024;
        _5809 = _5819;
    }
    int _5821 = _5809;
    bool _5823 = _5715 >= 0.16599999368190765380859375;
    int _5825 = _5815 ? 0 : 512;
    bool _5827 = _5717 >= 0.5;
    bool _5829 = _5729 >= 0.833000004291534423828125;
    int _5831 = _5825;
    if (!_5801)
    {
        int _5833 = _5823 ? 768 : 256;
        _5831 = _5833;
    }
    int _5835 = _5831;
    bool _5837 = _5729 >= 0.16599999368190765380859375;
    bool _5839 = _5731 >= 0.5;
    int _5841 = _5829 ? 0 : 512;
    bool _5843 = _5717 >= 0.833000004291534423828125;
    int _5845 = _5841;
    if (!_5817)
    {
        int _5847 = _5837 ? 768 : 256;
        _5845 = _5847;
    }
    int _5849 = _5845;
    bool _5851 = _5717 >= 0.16599999368190765380859375;
    bool _5853 = _5731 >= 0.833000004291534423828125;
    int _5855 = _5843 ? 0 : 128;
    bool _5857 = _5731 >= 0.16599999368190765380859375;
    bool _5859 = _5719 >= 0.5;
    int _5861 = _5853 ? 0 : 128;
    int _5863 = _5855;
    int _5865 = _5861;
    if (!_5827)
    {
        int _5867 = _5851 ? 192 : 64;
        _5863 = _5867;
    }
    int _5869 = _5863;
    bool _5871 = _5719 >= 0.833000004291534423828125;
    bool _5873 = _5733 >= 0.5;
    if (!_5839)
    {
        int _5875 = _5857 ? 192 : 64;
        _5865 = _5875;
    }
    int _5877 = _5865;
    int _5879 = _5871 ? 0 : 32;
    bool _5881 = _5721 >= 0.5;
    bool _5883 = _5719 >= 0.16599999368190765380859375;
    bool _5885 = _5733 >= 0.833000004291534423828125;
    bool _5887 = _5733 >= 0.16599999368190765380859375;
    int _5889 = _5885 ? 0 : 32;
    int _5891 = _5879;
    int _5893 = _5889;
    if (!_5859)
    {
        int _5895 = _5883 ? 48 : 16;
        _5891 = _5895;
    }
    int _5897 = _5891;
    bool _5899 = _5721 >= 0.833000004291534423828125;
    bool _5901 = _5735 >= 0.5;
    if (!_5873)
    {
        int _5903 = _5887 ? 48 : 16;
        _5893 = _5903;
    }
    int _5905 = _5893;
    bool _5907 = _5721 >= 0.16599999368190765380859375;
    bool _5909 = _5735 >= 0.833000004291534423828125;
    int _5911 = _5899 ? 0 : 8;
    int _5913 = _5909 ? 0 : 8;
    int _5915 = _5911;
    int _5917 = _5913;
    if (!_5881)
    {
        int _5919 = _5907 ? 12 : 4;
        _5915 = _5919;
    }
    int _5921 = _5915;
    bool _5923 = _5723 >= 0.5;
    bool _5925 = _5737 >= 0.5;
    bool _5927 = _5735 >= 0.16599999368190765380859375;
    int _5929 = _5813 + _5751;
    int _5931 = _5929 + _5785;
    int _5933 = _5821 + _5765;
    int _5935 = _5933 + _5793;
    if (!_5901)
    {
        int _5937 = _5927 ? 12 : 4;
        _5917 = _5937;
    }
    int _5939 = _5917;
    bool _5941 = _5723 >= 0.833000004291534423828125;
    bool _5943 = _5737 >= 0.833000004291534423828125;
    bool _5945 = _5723 >= 0.16599999368190765380859375;
    bool _5947 = _5737 >= 0.16599999368190765380859375;
    int _5949 = _5869 + _5931;
    int _5951 = _5949 + _5835;
    int _5953 = _5877 + _5935;
    int _5955 = _5953 + _5849;
    int _5957 = _5941 ? 0 : 2;
    int _5959 = _5943 ? 0 : 2;
    int _5961 = _5957;
    int _5963 = _5959;
    if (!_5923)
    {
        int _5965 = _5945 ? 3 : 1;
        _5961 = _5965;
    }
    int _5967 = _5961;
    if (!_5925)
    {
        int _5969 = _5947 ? 3 : 1;
        _5963 = _5969;
    }
    int _5971 = _5963;
    int _5973 = _5921 + _5951;
    int _5975 = _5973 + _5897;
    int _5977 = _5939 + _5955;
    int _5979 = _5977 + _5905;
    bool _5981 = !_5387;
    int _5983 = _5981 ? _5365 : _5361;
    bool _5985 = !_5387;
    int _5987 = _5985 ? _5361 : _5365;
    int _5989 = _5975 + _5967;
    int _5991 = _5979 + _5971;
    out.m_32.x = as_type<float>(_5983);
    out.m_32.y = as_type<float>(_5987);
    out.m_32.z = as_type<float>(_5989);
    out.m_32.w = as_type<float>(_5991);
    return out;
}


struct main0_out_u
{
    uint4 m_32 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _4996 = false;
    bool _4978 = false;
    bool _4834 = false;
    bool _4816 = false;
    bool _4672 = false;
    bool _4654 = false;
    bool _4510 = false;
    bool _4492 = false;
    bool _4348 = false;
    bool _4330 = false;
    bool _4186 = false;
    bool _4168 = false;
    bool _4024 = false;
    bool _4006 = false;
    bool _3862 = false;
    bool _3844 = false;
    bool _3700 = false;
    bool _3682 = false;
    bool _3538 = false;
    bool _3520 = false;
    bool _3376 = false;
    bool _3358 = false;
    bool _3214 = false;
    bool _3196 = false;
    bool _3052 = false;
    bool _3034 = false;
    bool _2890 = false;
    bool _2872 = false;
    bool _2728 = false;
    bool _2710 = false;
    bool _2600 = false;
    bool _2566 = false;
    float _39 = gl_FragCoord.w;
    float _41 = in.m_29.x;
    float _43 = gl_FragCoord.w;
    float _45 = _41 * _43;
    float _47 = in.m_29.y;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = 1.0 / _39;
    float _55 = _53 * _45;
    float _57 = _53 * _51;
    float2 _6026 = float2(_55, _57);
    float3 _61 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6026, float2(0.0), isnan(_6026)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6026, float2(0.0), isnan(_6026)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1, 0)).xyz;
    float _63 = _61.x;
    float _65 = _61.y;
    float _67 = _61.z;
    float2 _6048 = float2(_55, _57);
    float3 _69 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6048, float2(0.0), isnan(_6048)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6048, float2(0.0), isnan(_6048)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyz;
    float _71 = _69.x;
    float _73 = _69.y;
    float _75 = _69.z;
    float2 _6064 = float2(_55, _57);
    float3 _77 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6064, float2(0.0), isnan(_6064)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6064, float2(0.0), isnan(_6064)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2, 0)).xyz;
    float _79 = _77.x;
    float _81 = _77.y;
    float _83 = _77.z;
    float2 _6082 = float2(_55, _57);
    float3 _85 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6082, float2(0.0), isnan(_6082)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6082, float2(0.0), isnan(_6082)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3, 0)).xyz;
    float _87 = _85.x;
    float _89 = _85.y;
    float _91 = _85.z;
    float2 _6099 = float2(_55, _57);
    float3 _93 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6099, float2(0.0), isnan(_6099)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(0, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6099, float2(0.0), isnan(_6099)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(0, 1)).xyz;
    float _95 = _93.x;
    float _97 = _93.y;
    float _99 = _93.z;
    float2 _6116 = float2(_55, _57);
    float3 _101 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6116, float2(0.0), isnan(_6116)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6116, float2(0.0), isnan(_6116)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1)).xyz;
    float _103 = _101.x;
    float _105 = _101.y;
    float _107 = _101.z;
    float2 _6133 = float2(_55, _57);
    float3 _109 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6133, float2(0.0), isnan(_6133)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6133, float2(0.0), isnan(_6133)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2, 1)).xyz;
    float _111 = _109.x;
    float _113 = _109.y;
    float _115 = _109.z;
    float2 _6150 = float2(_55, _57);
    float3 _117 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6150, float2(0.0), isnan(_6150)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6150, float2(0.0), isnan(_6150)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3, 1)).xyz;
    float _119 = _117.x;
    float _121 = _117.y;
    float _123 = _117.z;
    float2 _6167 = float2(_55, _57);
    float3 _125 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6167, float2(0.0), isnan(_6167)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(0, 2)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6167, float2(0.0), isnan(_6167)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(0, 2)).xyz;
    float _127 = _125.x;
    float _129 = _125.y;
    float _131 = _125.z;
    float2 _6184 = float2(_55, _57);
    float3 _133 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6184, float2(0.0), isnan(_6184)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1, 2)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6184, float2(0.0), isnan(_6184)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1, 2)).xyz;
    float _135 = _133.x;
    float _137 = _133.y;
    float _139 = _133.z;
    float2 _6201 = float2(_55, _57);
    float3 _141 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6201, float2(0.0), isnan(_6201)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6201, float2(0.0), isnan(_6201)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2)).xyz;
    float _143 = _141.x;
    float _145 = _141.y;
    float _147 = _141.z;
    float2 _6218 = float2(_55, _57);
    float3 _149 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6218, float2(0.0), isnan(_6218)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3, 2)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6218, float2(0.0), isnan(_6218)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3, 2)).xyz;
    float _151 = _149.x;
    float _153 = _149.y;
    float _155 = _149.z;
    float2 _6235 = float2(_55, _57);
    float3 _157 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6235, float2(0.0), isnan(_6235)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(0, 3)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6235, float2(0.0), isnan(_6235)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(0, 3)).xyz;
    float _159 = _157.x;
    float _161 = _157.y;
    float _163 = _157.z;
    float2 _6252 = float2(_55, _57);
    float3 _165 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6252, float2(0.0), isnan(_6252)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1, 3)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6252, float2(0.0), isnan(_6252)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1, 3)).xyz;
    float _167 = _165.x;
    float _169 = _165.y;
    float _171 = _165.z;
    float2 _6269 = float2(_55, _57);
    float3 _173 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6269, float2(0.0), isnan(_6269)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2, 3)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6269, float2(0.0), isnan(_6269)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2, 3)).xyz;
    float _175 = _173.x;
    float _177 = _173.y;
    float _179 = _173.z;
    float2 _6286 = float2(_55, _57);
    float3 _181 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6286, float2(0.0), isnan(_6286)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6286, float2(0.0), isnan(_6286)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3)).xyz;
    float _183 = _181.x;
    float _185 = _181.y;
    float _187 = _181.z;
    float _189 = _73 + _65;
    float _191 = _71 + _63;
    float _193 = _75 + _67;
    float _195 = _81 + _189;
    float _197 = _79 + _191;
    float _199 = _83 + _193;
    float _201 = _89 + _195;
    float _203 = _87 + _197;
    float _205 = _91 + _199;
    float _207 = _97 + _201;
    float _209 = _95 + _203;
    float _211 = _99 + _205;
    float _213 = _105 + _207;
    float _215 = _103 + _209;
    float _217 = _107 + _211;
    float _219 = _113 + _213;
    float _221 = _111 + _215;
    float _223 = _115 + _217;
    float _225 = _121 + _219;
    float _227 = _119 + _221;
    float _229 = _123 + _223;
    float _231 = _129 + _225;
    float _233 = _127 + _227;
    float _235 = _131 + _229;
    float _237 = _137 + _231;
    float _239 = _135 + _233;
    float _241 = _139 + _235;
    float _243 = _145 + _237;
    float _245 = _143 + _239;
    float _247 = _147 + _241;
    float _249 = _153 + _243;
    float _251 = _151 + _245;
    float _253 = _155 + _247;
    float _255 = _161 + _249;
    float _257 = _159 + _251;
    float _259 = _163 + _253;
    float _261 = _169 + _255;
    float _263 = _167 + _257;
    float _265 = _171 + _259;
    float _267 = _177 + _261;
    float _269 = _175 + _263;
    float _271 = _179 + _265;
    float _273 = _185 + _267;
    float _275 = _183 + _269;
    float _277 = _187 + _271;
    float _279 = fma(_273, -0.0625, _65);
    float _281 = fma(_275, -0.0625, _63);
    float _283 = fma(_277, -0.0625, _67);
    float _285 = fma(_273, -0.0625, _73);
    float _287 = fma(_275, -0.0625, _71);
    float _289 = _281 * _279;
    float _291 = _281 * _281;
    float _293 = fma(_277, -0.0625, _75);
    float _295 = _279 * _279;
    float _297 = _279 * _283;
    float _299 = _281 * _283;
    float _301 = fma(_287, _285, _289);
    float _303 = fma(_285, _285, _295);
    float _305 = fma(_285, _293, _297);
    float _307 = fma(_287, _287, _291);
    float _309 = fma(_287, _293, _299);
    float _311 = _283 * _283;
    float _313 = fma(_273, -0.0625, _81);
    float _315 = fma(_275, -0.0625, _79);
    float _317 = fma(_277, -0.0625, _83);
    float _319 = fma(_293, _293, _311);
    float _321 = fma(_313, _313, _303);
    float _323 = fma(_315, _313, _301);
    float _325 = fma(_313, _317, _305);
    float _327 = fma(_315, _315, _307);
    float _329 = fma(_315, _317, _309);
    float _331 = fma(_273, -0.0625, _89);
    float _333 = fma(_275, -0.0625, _87);
    float _335 = fma(_277, -0.0625, _91);
    float _337 = fma(_317, _317, _319);
    float _339 = fma(_331, _331, _321);
    float _341 = fma(_333, _331, _323);
    float _343 = fma(_331, _335, _325);
    float _345 = fma(_333, _333, _327);
    float _347 = fma(_333, _335, _329);
    float _349 = fma(_273, -0.0625, _97);
    float _351 = fma(_275, -0.0625, _95);
    float _353 = fma(_277, -0.0625, _99);
    float _355 = fma(_335, _335, _337);
    float _357 = fma(_349, _349, _339);
    float _359 = fma(_351, _349, _341);
    float _361 = fma(_349, _353, _343);
    float _363 = fma(_351, _351, _345);
    float _365 = fma(_351, _353, _347);
    float _367 = fma(_273, -0.0625, _105);
    float _369 = fma(_275, -0.0625, _103);
    float _371 = fma(_277, -0.0625, _107);
    float _373 = fma(_353, _353, _355);
    float _375 = fma(_367, _367, _357);
    float _377 = fma(_369, _367, _359);
    float _379 = fma(_367, _371, _361);
    float _381 = fma(_369, _369, _363);
    float _383 = fma(_369, _371, _365);
    float _385 = fma(_273, -0.0625, _113);
    float _387 = fma(_275, -0.0625, _111);
    float _389 = fma(_277, -0.0625, _115);
    float _391 = fma(_371, _371, _373);
    float _393 = fma(_385, _385, _375);
    float _395 = fma(_387, _385, _377);
    float _397 = fma(_385, _389, _379);
    float _399 = fma(_387, _387, _381);
    float _401 = fma(_387, _389, _383);
    float _403 = fma(_273, -0.0625, _121);
    float _405 = fma(_275, -0.0625, _119);
    float _407 = fma(_277, -0.0625, _123);
    float _409 = fma(_389, _389, _391);
    float _411 = fma(_403, _403, _393);
    float _413 = fma(_405, _403, _395);
    float _415 = fma(_403, _407, _397);
    float _417 = fma(_405, _405, _399);
    float _419 = fma(_405, _407, _401);
    float _421 = fma(_273, -0.0625, _129);
    float _423 = fma(_275, -0.0625, _127);
    float _425 = fma(_277, -0.0625, _131);
    float _427 = fma(_407, _407, _409);
    float _429 = fma(_421, _421, _411);
    float _431 = fma(_423, _421, _413);
    float _433 = fma(_421, _425, _415);
    float _435 = fma(_423, _423, _417);
    float _437 = fma(_423, _425, _419);
    float _439 = fma(_273, -0.0625, _137);
    float _441 = fma(_275, -0.0625, _135);
    float _443 = fma(_277, -0.0625, _139);
    float _445 = fma(_425, _425, _427);
    float _447 = fma(_439, _439, _429);
    float _449 = fma(_441, _439, _431);
    float _451 = fma(_439, _443, _433);
    float _453 = fma(_441, _441, _435);
    float _455 = fma(_441, _443, _437);
    float _457 = fma(_273, -0.0625, _145);
    float _459 = fma(_275, -0.0625, _143);
    float _461 = fma(_277, -0.0625, _147);
    float _463 = fma(_443, _443, _445);
    float _465 = fma(_457, _457, _447);
    float _467 = fma(_459, _457, _449);
    float _469 = fma(_457, _461, _451);
    float _471 = fma(_459, _459, _453);
    float _473 = fma(_459, _461, _455);
    float _475 = fma(_273, -0.0625, _153);
    float _477 = fma(_275, -0.0625, _151);
    float _479 = fma(_277, -0.0625, _155);
    float _481 = fma(_461, _461, _463);
    float _483 = fma(_475, _475, _465);
    float _485 = fma(_477, _475, _467);
    float _487 = fma(_475, _479, _469);
    float _489 = fma(_477, _477, _471);
    float _491 = fma(_477, _479, _473);
    float _493 = fma(_273, -0.0625, _161);
    float _495 = fma(_275, -0.0625, _159);
    float _497 = fma(_277, -0.0625, _163);
    float _499 = fma(_479, _479, _481);
    float _501 = fma(_493, _493, _483);
    float _503 = fma(_495, _493, _485);
    float _505 = fma(_493, _497, _487);
    float _507 = fma(_495, _495, _489);
    float _509 = fma(_495, _497, _491);
    float _511 = fma(_273, -0.0625, _169);
    float _513 = fma(_275, -0.0625, _167);
    float _515 = fma(_277, -0.0625, _171);
    float _517 = fma(_497, _497, _499);
    float _519 = fma(_511, _511, _501);
    float _521 = fma(_513, _511, _503);
    float _523 = fma(_511, _515, _505);
    float _525 = fma(_513, _513, _507);
    float _527 = fma(_513, _515, _509);
    float _529 = fma(_273, -0.0625, _177);
    float _531 = fma(_275, -0.0625, _175);
    float _533 = fma(_277, -0.0625, _179);
    float _535 = fma(_273, -0.0625, _185);
    float _537 = fma(_529, _529, _519);
    float _539 = fma(_531, _529, _521);
    float _541 = fma(_275, -0.0625, _183);
    float _543 = fma(_529, _533, _523);
    float _545 = fma(_277, -0.0625, _187);
    float _547 = fma(_531, _531, _525);
    float _549 = fma(_535, _535, _537);
    float _551 = fma(_541, _535, _539);
    float _553 = fma(_515, _515, _517);
    float _555 = fma(_531, _533, _527);
    float _557 = fma(_535, _545, _543);
    float _559 = fma(_541, _541, _547);
    float _561 = _549 + _551;
    float _563 = fma(_533, _533, _553);
    float _565 = fma(_541, _545, _555);
    float _567 = _559 + _551;
    float _569 = _557 + _561;
    float _571 = fma(_545, _545, _563);
    float _573 = _557 + _565;
    float _575 = _565 + _567;
    float _577 = _569 * _569;
    float _579 = _571 + _573;
    float _581 = fma(_575, _575, _577);
    float _583 = fma(_579, _579, _581);
    float _585 = rsqrt(_583);
    float _587 = _569 * _585;
    float _589 = _575 * _585;
    float _591 = _579 * _585;
    float _593 = _549 * _587;
    float _595 = _551 * _587;
    float _597 = fma(_551, _589, _593);
    float _599 = _557 * _587;
    float _601 = fma(_559, _589, _595);
    float _603 = fma(_557, _591, _597);
    float _605 = fma(_565, _589, _599);
    float _607 = fma(_565, _591, _601);
    float _609 = _603 * _603;
    float _611 = fma(_571, _591, _605);
    float _613 = fma(_607, _607, _609);
    float _615 = fma(_611, _611, _613);
    float _617 = rsqrt(_615);
    float _619 = _603 * _617;
    float _621 = _607 * _617;
    float _623 = _611 * _617;
    float _625 = _549 * _619;
    float _627 = _551 * _619;
    float _629 = _557 * _619;
    float _631 = fma(_551, _621, _625);
    float _633 = fma(_559, _621, _627);
    float _635 = fma(_565, _621, _629);
    float _637 = fma(_557, _623, _631);
    float _639 = fma(_565, _623, _633);
    float _641 = fma(_571, _623, _635);
    float _643 = _637 * _637;
    float _645 = fma(_639, _639, _643);
    float _647 = fma(_641, _641, _645);
    float _649 = rsqrt(_647);
    float _651 = _637 * _649;
    float _653 = _639 * _649;
    float _655 = _641 * _649;
    float _657 = _549 * _651;
    float _659 = _551 * _651;
    float _661 = _557 * _651;
    float _663 = fma(_551, _653, _657);
    float _665 = fma(_559, _653, _659);
    float _667 = fma(_565, _653, _661);
    float _669 = fma(_557, _655, _663);
    float _671 = fma(_565, _655, _665);
    float _673 = fma(_571, _655, _667);
    float _675 = _669 * _669;
    float _677 = fma(_671, _671, _675);
    float _679 = fma(_673, _673, _677);
    float _681 = rsqrt(_679);
    float _683 = _669 * _681;
    float _685 = _671 * _681;
    float _687 = _673 * _681;
    float _689 = _549 * _683;
    float _691 = _551 * _683;
    float _693 = _557 * _683;
    float _695 = fma(_551, _685, _689);
    float _697 = fma(_559, _685, _691);
    float _699 = fma(_565, _685, _693);
    float _701 = fma(_557, _687, _695);
    float _703 = fma(_565, _687, _697);
    float _705 = fma(_571, _687, _699);
    float _707 = _701 * _701;
    float _709 = fma(_703, _703, _707);
    float _711 = fma(_705, _705, _709);
    float _713 = rsqrt(_711);
    float _715 = _701 * _713;
    float _717 = _703 * _713;
    float _719 = _705 * _713;
    float _721 = _549 * _715;
    float _723 = _551 * _715;
    float _725 = _557 * _715;
    float _727 = fma(_551, _717, _721);
    float _729 = fma(_559, _717, _723);
    float _731 = fma(_565, _717, _725);
    float _733 = fma(_557, _719, _727);
    float _735 = fma(_565, _719, _729);
    float _737 = fma(_571, _719, _731);
    float _739 = _733 * _733;
    float _741 = fma(_735, _735, _739);
    float _743 = fma(_737, _737, _741);
    float _745 = rsqrt(_743);
    float _747 = _733 * _745;
    float _749 = _735 * _745;
    float _751 = _737 * _745;
    float _753 = _549 * _747;
    float _755 = _551 * _747;
    float _757 = _557 * _747;
    float _759 = fma(_551, _749, _753);
    float _761 = fma(_559, _749, _755);
    float _763 = fma(_565, _749, _757);
    float _765 = fma(_557, _751, _759);
    float _767 = fma(_565, _751, _761);
    float _769 = fma(_571, _751, _763);
    float _771 = _765 * _765;
    float _773 = fma(_767, _767, _771);
    float _775 = fma(_769, _769, _773);
    float _777 = rsqrt(_775);
    float _779 = _765 * _777;
    float _781 = _767 * _777;
    float _783 = _769 * _777;
    float _785 = _549 * _779;
    float _787 = _551 * _779;
    float _789 = fma(_551, _781, _785);
    float _791 = _557 * _779;
    float _793 = fma(_559, _781, _787);
    float _795 = fma(_557, _783, _789);
    float _797 = fma(_565, _781, _791);
    float _799 = fma(_565, _783, _793);
    float _801 = _795 * _795;
    float _803 = fma(_571, _783, _797);
    float _805 = fma(_799, _799, _801);
    float _807 = fma(_803, _803, _805);
    float _809 = rsqrt(_807);
    float _811 = _795 * _809;
    float _813 = _799 * _809;
    float _815 = _803 * _809;
    float _817 = _73 * _811;
    float _819 = _65 * _811;
    float _821 = _81 * _811;
    float _823 = fma(_71, _813, _817);
    float _825 = fma(_63, _813, _819);
    float _827 = fma(_79, _813, _821);
    float _829 = fma(_75, _815, _823);
    float _831 = fma(_67, _815, _825);
    float _833 = fma(_83, _815, _827);
    bool _837 = _829 >= _831;
    bool _839 = isnan(_829);
    bool _841 = _837 || _839;
    bool _843 = isnan(_831);
    bool _845 = _841 || _843;
    float _847 = _543;
    float _849 = _823;
    float _851 = _827;
    float _853 = _825;
    float _855 = _821;
    float _857 = _781;
    float _859 = _769;
    float _861 = _779;
    float _863 = _829;
    float _865 = _753;
    float _867 = _833;
    float _869 = _833;
    float _871 = _815;
    float _873 = _813;
    if (!_845)
    {
        _847 = _63;
    }
    float _875 = _847;
    float _877 = _875;
    float _879 = _875;
    if (!_845)
    {
        _849 = _65;
    }
    float _881 = _849;
    float _883 = _881;
    float _885 = _881;
    if (!_845)
    {
        _851 = _67;
    }
    float _887 = _851;
    float _889 = _887;
    float _891 = _887;
    if (!_845)
    {
        _853 = _829;
    }
    float _893 = _853;
    float _895 = _893;
    float _897 = _893;
    if (!_845)
    {
        _855 = _831;
    }
    float _899 = _855;
    float _901 = _899;
    float _903 = _899;
    if (!_845)
    {
        _857 = _71;
    }
    float _905 = _857;
    float _907 = _905;
    float _909 = _905;
    if (!_845)
    {
        _859 = _73;
    }
    float _911 = _859;
    float _913 = _911;
    float _915 = _911;
    if (!_845)
    {
        _861 = _75;
    }
    float _917 = _861;
    bool _919 = !_845;
    float _921 = _917;
    float _923 = _917;
    if (!_919)
    {
        bool _925 = _829 > _831;
        if (!_925)
        {
            _895 = _829;
        }
        float _927 = _895;
        float _929 = _927;
        if (!_925)
        {
            _901 = _829;
        }
        float _931 = _901;
        float _933 = _931;
        if (!_925)
        {
            _907 = _71;
        }
        float _935 = _907;
        float _937 = _935;
        if (!_925)
        {
            _913 = _73;
        }
        float _939 = _913;
        float _941 = _939;
        if (!_925)
        {
            _921 = _75;
        }
        float _943 = _921;
        float _945 = _943;
        if (!_925)
        {
            _877 = _71;
        }
        float _947 = _877;
        float _949 = _947;
        if (!_925)
        {
            _883 = _73;
        }
        float _951 = _883;
        float _953 = _951;
        if (!_925)
        {
            _889 = _75;
        }
        float _955 = _889;
        _891 = _955;
        if (_925)
        {
            _929 = _831;
        }
        float _957 = _929;
        _897 = _957;
        if (_925)
        {
            _933 = _829;
        }
        float _959 = _933;
        _903 = _959;
        if (_925)
        {
            _937 = _63;
        }
        float _961 = _937;
        _909 = _961;
        if (_925)
        {
            _941 = _65;
        }
        float _963 = _941;
        _915 = _963;
        if (_925)
        {
            _945 = _67;
        }
        float _965 = _945;
        _923 = _965;
        if (_925)
        {
            _949 = _71;
        }
        float _967 = _949;
        _879 = _967;
        if (_925)
        {
            _953 = _73;
        }
        float _969 = _953;
        _885 = _969;
        if (_925)
        {
            _891 = _75;
        }
    }
    float _971 = _903;
    float _973 = _897;
    float _975 = _879;
    float _977 = _885;
    float _979 = _891;
    float _981 = _909;
    float _983 = _915;
    float _985 = _923;
    bool _987 = _971 >= _833;
    bool _989 = isnan(_971);
    bool _991 = _987 || _989;
    bool _993 = isnan(_833);
    bool _995 = _991 || _993;
    float _997 = _89 * _811;
    float _999 = fma(_87, _813, _997);
    float _1001 = fma(_91, _815, _999);
    float _1003 = _999;
    float _1005 = _973;
    float _1007 = _981;
    float _1009 = _983;
    float _1011 = _973;
    float _1013 = _981;
    float _1015 = _983;
    float _1017 = _985;
    float _1019 = _979;
    float _1021 = _977;
    float _1023 = _1001;
    float _1025 = _1001;
    if (!_995)
    {
        _863 = _79;
    }
    float _1027 = _863;
    float _1029 = _1027;
    float _1031 = _1027;
    if (!_995)
    {
        _1003 = _81;
    }
    float _1033 = _1003;
    float _1035 = _1033;
    float _1037 = _1033;
    if (!_995)
    {
        _865 = _83;
    }
    float _1039 = _865;
    bool _1041 = !_995;
    float _1043 = _1039;
    float _1045 = _1039;
    if (!_1041)
    {
        bool _1047 = _973 > _833;
        if (_1047)
        {
            _1005 = _833;
        }
        float _1049 = _1005;
        _1011 = _1049;
        if (!_1047)
        {
            _1029 = _975;
        }
        float _1051 = _1029;
        float _1053 = _1051;
        if (!_1047)
        {
            _1035 = _977;
        }
        float _1055 = _1035;
        float _1057 = _1055;
        if (!_1047)
        {
            _1043 = _979;
        }
        float _1059 = _1043;
        float _1061 = _1059;
        if (!_1047)
        {
            _867 = _971;
        }
        float _1063 = _867;
        float _1065 = _1063;
        if (_1047)
        {
            _1053 = _975;
        }
        float _1067 = _1053;
        _1031 = _1067;
        if (_1047)
        {
            _1057 = _977;
        }
        float _1069 = _1057;
        _1037 = _1069;
        if (_1047)
        {
            _1061 = _979;
        }
        float _1071 = _1061;
        _1045 = _1071;
        if (_1047)
        {
            _1065 = _971;
        }
        float _1073 = _1065;
        _869 = _1073;
        if (_1047)
        {
            _1007 = _79;
        }
        float _1075 = _1007;
        _1013 = _1075;
        if (_1047)
        {
            _1009 = _81;
        }
        float _1077 = _1009;
        _1015 = _1077;
        if (_1047)
        {
            _1017 = _83;
        }
    }
    float _1079 = _869;
    float _1081 = _1011;
    float _1083 = _1031;
    float _1085 = _1037;
    float _1087 = _1045;
    float _1089 = _1013;
    float _1091 = _1015;
    float _1093 = _1017;
    bool _1095 = _1079 >= _1001;
    bool _1097 = isnan(_1079);
    bool _1099 = _1095 || _1097;
    bool _1101 = isnan(_1001);
    bool _1103 = _1099 || _1101;
    float _1105 = _97 * _811;
    float _1107 = fma(_95, _813, _1105);
    float _1109 = fma(_99, _815, _1107);
    float _1111 = _1105;
    float _1113 = _1081;
    float _1115 = _1089;
    float _1117 = _1091;
    float _1119 = _1081;
    float _1121 = _1089;
    float _1123 = _1091;
    float _1125 = _1093;
    float _1127 = _1083;
    float _1129 = _1087;
    float _1131 = _1109;
    float _1133 = _1109;
    if (!_1103)
    {
        _1111 = _87;
    }
    float _1135 = _1111;
    float _1137 = _1135;
    float _1139 = _1135;
    if (!_1103)
    {
        _1019 = _89;
    }
    float _1141 = _1019;
    float _1143 = _1141;
    float _1145 = _1141;
    if (!_1103)
    {
        _1021 = _91;
    }
    float _1147 = _1021;
    bool _1149 = !_1103;
    float _1151 = _1147;
    float _1153 = _1147;
    if (!_1149)
    {
        bool _1155 = _1081 > _1001;
        if (_1155)
        {
            _1113 = _1001;
        }
        float _1157 = _1113;
        _1119 = _1157;
        if (!_1155)
        {
            _1137 = _1083;
        }
        float _1159 = _1137;
        float _1161 = _1159;
        if (!_1155)
        {
            _1143 = _1085;
        }
        float _1163 = _1143;
        float _1165 = _1163;
        if (!_1155)
        {
            _1151 = _1087;
        }
        float _1167 = _1151;
        float _1169 = _1167;
        if (!_1155)
        {
            _1023 = _1079;
        }
        float _1171 = _1023;
        float _1173 = _1171;
        if (_1155)
        {
            _1161 = _1083;
        }
        float _1175 = _1161;
        _1139 = _1175;
        if (_1155)
        {
            _1165 = _1085;
        }
        float _1177 = _1165;
        _1145 = _1177;
        if (_1155)
        {
            _1169 = _1087;
        }
        float _1179 = _1169;
        _1153 = _1179;
        if (_1155)
        {
            _1173 = _1079;
        }
        float _1181 = _1173;
        _1025 = _1181;
        if (_1155)
        {
            _1115 = _87;
        }
        float _1183 = _1115;
        _1121 = _1183;
        if (_1155)
        {
            _1117 = _89;
        }
        float _1185 = _1117;
        _1123 = _1185;
        if (_1155)
        {
            _1125 = _91;
        }
    }
    float _1187 = _1025;
    float _1189 = _1119;
    float _1191 = _1139;
    float _1193 = _1145;
    float _1195 = _1153;
    float _1197 = _1121;
    float _1199 = _1123;
    float _1201 = _1125;
    bool _1203 = _1187 >= _1109;
    bool _1205 = isnan(_1187);
    bool _1207 = _1203 || _1205;
    bool _1209 = isnan(_1109);
    bool _1211 = _1207 || _1209;
    float _1213 = _105 * _811;
    float _1215 = fma(_103, _813, _1213);
    float _1217 = fma(_107, _815, _1215);
    float _1219 = _1215;
    float _1221 = _1189;
    float _1223 = _1197;
    float _1225 = _1199;
    float _1227 = _1189;
    float _1229 = _1197;
    float _1231 = _1199;
    float _1233 = _1201;
    float _1235 = _1193;
    float _1237 = _1195;
    float _1239 = _1217;
    float _1241 = _1217;
    float _1243 = _1187;
    if (!_1211)
    {
        _1127 = _95;
    }
    float _1245 = _1127;
    float _1247 = _1245;
    float _1249 = _1245;
    if (!_1211)
    {
        _1219 = _97;
    }
    float _1251 = _1219;
    float _1253 = _1251;
    float _1255 = _1251;
    if (!_1211)
    {
        _1129 = _99;
    }
    float _1257 = _1129;
    bool _1259 = !_1211;
    float _1261 = _1257;
    float _1263 = _1257;
    if (!_1259)
    {
        bool _1265 = _1189 > _1109;
        if (_1265)
        {
            _1221 = _1109;
        }
        float _1267 = _1221;
        _1227 = _1267;
        if (!_1265)
        {
            _1247 = _1191;
        }
        float _1269 = _1247;
        float _1271 = _1269;
        if (!_1265)
        {
            _1253 = _1193;
        }
        float _1273 = _1253;
        float _1275 = _1273;
        if (!_1265)
        {
            _1261 = _1195;
        }
        float _1277 = _1261;
        float _1279 = _1277;
        if (!_1265)
        {
            _1131 = _1187;
        }
        float _1281 = _1131;
        float _1283 = _1281;
        if (_1265)
        {
            _1271 = _1191;
        }
        float _1285 = _1271;
        _1249 = _1285;
        if (_1265)
        {
            _1275 = _1193;
        }
        float _1287 = _1275;
        _1255 = _1287;
        if (_1265)
        {
            _1279 = _1195;
        }
        float _1289 = _1279;
        _1263 = _1289;
        if (_1265)
        {
            _1283 = _1187;
        }
        float _1291 = _1283;
        _1133 = _1291;
        if (_1265)
        {
            _1223 = _95;
        }
        float _1293 = _1223;
        _1229 = _1293;
        if (_1265)
        {
            _1225 = _97;
        }
        float _1295 = _1225;
        _1231 = _1295;
        if (_1265)
        {
            _1233 = _99;
        }
    }
    float _1297 = _1133;
    float _1299 = _1227;
    float _1301 = _1249;
    float _1303 = _1255;
    float _1305 = _1263;
    float _1307 = _1229;
    float _1309 = _1231;
    float _1311 = _1233;
    bool _1313 = _1297 >= _1217;
    bool _1315 = isnan(_1297);
    bool _1317 = _1313 || _1315;
    bool _1319 = isnan(_1217);
    bool _1321 = _1317 || _1319;
    float _1323 = _113 * _811;
    float _1325 = fma(_111, _813, _1323);
    float _1327 = fma(_115, _815, _1325);
    float _1329 = _1323;
    float _1331 = _1299;
    float _1333 = _1307;
    float _1335 = _1309;
    float _1337 = _1299;
    float _1339 = _1307;
    float _1341 = _1309;
    float _1343 = _1311;
    float _1345 = _1305;
    float _1347 = _1297;
    float _1349 = _1327;
    float _1351 = _1327;
    if (!_1321)
    {
        _1329 = _103;
    }
    float _1353 = _1329;
    float _1355 = _1353;
    float _1357 = _1353;
    if (!_1321)
    {
        _1235 = _105;
    }
    float _1359 = _1235;
    float _1361 = _1359;
    float _1363 = _1359;
    if (!_1321)
    {
        _1237 = _107;
    }
    float _1365 = _1237;
    bool _1367 = !_1321;
    float _1369 = _1365;
    float _1371 = _1365;
    if (!_1367)
    {
        bool _1373 = _1299 > _1217;
        if (_1373)
        {
            _1331 = _1217;
        }
        float _1375 = _1331;
        _1337 = _1375;
        if (!_1373)
        {
            _1355 = _1301;
        }
        float _1377 = _1355;
        float _1379 = _1377;
        if (!_1373)
        {
            _1361 = _1303;
        }
        float _1381 = _1361;
        float _1383 = _1381;
        if (!_1373)
        {
            _1369 = _1305;
        }
        float _1385 = _1369;
        float _1387 = _1385;
        if (!_1373)
        {
            _1239 = _1297;
        }
        float _1389 = _1239;
        float _1391 = _1389;
        if (_1373)
        {
            _1379 = _1301;
        }
        float _1393 = _1379;
        _1357 = _1393;
        if (_1373)
        {
            _1383 = _1303;
        }
        float _1395 = _1383;
        _1363 = _1395;
        if (_1373)
        {
            _1387 = _1305;
        }
        float _1397 = _1387;
        _1371 = _1397;
        if (_1373)
        {
            _1391 = _1297;
        }
        float _1399 = _1391;
        _1241 = _1399;
        if (_1373)
        {
            _1333 = _103;
        }
        float _1401 = _1333;
        _1339 = _1401;
        if (_1373)
        {
            _1335 = _105;
        }
        float _1403 = _1335;
        _1341 = _1403;
        if (_1373)
        {
            _1343 = _107;
        }
    }
    float _1405 = _1241;
    float _1407 = _1337;
    float _1409 = _1357;
    float _1411 = _1363;
    float _1413 = _1371;
    float _1415 = _1339;
    float _1417 = _1341;
    float _1419 = _1343;
    bool _1421 = _1405 >= _1327;
    bool _1423 = isnan(_1405);
    bool _1425 = _1421 || _1423;
    bool _1427 = isnan(_1327);
    bool _1429 = _1425 || _1427;
    float _1431 = _121 * _811;
    float _1433 = fma(_119, _813, _1431);
    float _1435 = fma(_123, _815, _1433);
    float _1437 = _1407;
    float _1439 = _1415;
    float _1441 = _1417;
    float _1443 = _1407;
    float _1445 = _1415;
    float _1447 = _1417;
    float _1449 = _1419;
    float _1451 = _1411;
    float _1453 = _1413;
    float _1455 = _1435;
    float _1457 = _1435;
    if (!_1429)
    {
        _1345 = _111;
    }
    float _1459 = _1345;
    float _1461 = _1459;
    float _1463 = _1459;
    if (!_1429)
    {
        _1243 = _113;
    }
    float _1465 = _1243;
    float _1467 = _1465;
    float _1469 = _1465;
    if (!_1429)
    {
        _1347 = _115;
    }
    float _1471 = _1347;
    bool _1473 = !_1429;
    float _1475 = _1471;
    float _1477 = _1471;
    if (!_1473)
    {
        bool _1479 = _1407 > _1327;
        if (_1479)
        {
            _1437 = _1327;
        }
        float _1481 = _1437;
        _1443 = _1481;
        if (!_1479)
        {
            _1461 = _1409;
        }
        float _1483 = _1461;
        float _1485 = _1483;
        if (!_1479)
        {
            _1467 = _1411;
        }
        float _1487 = _1467;
        float _1489 = _1487;
        if (!_1479)
        {
            _1475 = _1413;
        }
        float _1491 = _1475;
        float _1493 = _1491;
        if (!_1479)
        {
            _1349 = _1405;
        }
        float _1495 = _1349;
        float _1497 = _1495;
        if (_1479)
        {
            _1485 = _1409;
        }
        float _1499 = _1485;
        _1463 = _1499;
        if (_1479)
        {
            _1489 = _1411;
        }
        float _1501 = _1489;
        _1469 = _1501;
        if (_1479)
        {
            _1493 = _1413;
        }
        float _1503 = _1493;
        _1477 = _1503;
        if (_1479)
        {
            _1497 = _1405;
        }
        float _1505 = _1497;
        _1351 = _1505;
        if (_1479)
        {
            _1439 = _111;
        }
        float _1507 = _1439;
        _1445 = _1507;
        if (_1479)
        {
            _1441 = _113;
        }
        float _1509 = _1441;
        _1447 = _1509;
        if (_1479)
        {
            _1449 = _115;
        }
    }
    float _1511 = _1351;
    float _1513 = _1443;
    float _1515 = _1463;
    float _1517 = _1469;
    float _1519 = _1477;
    float _1521 = _1445;
    float _1523 = _1447;
    float _1525 = _1449;
    bool _1527 = _1511 >= _1435;
    bool _1529 = isnan(_1511);
    bool _1531 = _1527 || _1529;
    bool _1533 = isnan(_1435);
    bool _1535 = _1531 || _1533;
    float _1537 = _129 * _811;
    float _1539 = fma(_127, _813, _1537);
    float _1541 = fma(_131, _815, _1539);
    float _1543 = _1537;
    float _1545 = _1513;
    float _1547 = _1521;
    float _1549 = _1523;
    float _1551 = _1513;
    float _1553 = _1521;
    float _1555 = _1523;
    float _1557 = _1525;
    float _1559 = _1519;
    float _1561 = _1541;
    float _1563 = _1541;
    if (!_1535)
    {
        _1543 = _119;
    }
    float _1565 = _1543;
    float _1567 = _1565;
    float _1569 = _1565;
    if (!_1535)
    {
        _1451 = _121;
    }
    float _1571 = _1451;
    float _1573 = _1571;
    float _1575 = _1571;
    if (!_1535)
    {
        _1453 = _123;
    }
    float _1577 = _1453;
    bool _1579 = !_1535;
    float _1581 = _1577;
    float _1583 = _1577;
    if (!_1579)
    {
        bool _1585 = _1513 > _1435;
        if (_1585)
        {
            _1545 = _1435;
        }
        float _1587 = _1545;
        _1551 = _1587;
        if (!_1585)
        {
            _1567 = _1515;
        }
        float _1589 = _1567;
        float _1591 = _1589;
        if (!_1585)
        {
            _1573 = _1517;
        }
        float _1593 = _1573;
        float _1595 = _1593;
        if (!_1585)
        {
            _1581 = _1519;
        }
        float _1597 = _1581;
        float _1599 = _1597;
        if (!_1585)
        {
            _1455 = _1511;
        }
        float _1601 = _1455;
        float _1603 = _1601;
        if (_1585)
        {
            _1591 = _1515;
        }
        float _1605 = _1591;
        _1569 = _1605;
        if (_1585)
        {
            _1595 = _1517;
        }
        float _1607 = _1595;
        _1575 = _1607;
        if (_1585)
        {
            _1599 = _1519;
        }
        float _1609 = _1599;
        _1583 = _1609;
        if (_1585)
        {
            _1603 = _1511;
        }
        float _1611 = _1603;
        _1457 = _1611;
        if (_1585)
        {
            _1547 = _119;
        }
        float _1613 = _1547;
        _1553 = _1613;
        if (_1585)
        {
            _1549 = _121;
        }
        float _1615 = _1549;
        _1555 = _1615;
        if (_1585)
        {
            _1557 = _123;
        }
    }
    float _1617 = _1457;
    float _1619 = _1551;
    float _1621 = _1569;
    float _1623 = _1575;
    float _1625 = _1583;
    float _1627 = _1553;
    float _1629 = _1555;
    float _1631 = _1557;
    bool _1633 = _1617 >= _1541;
    bool _1635 = isnan(_1617);
    bool _1637 = _1633 || _1635;
    bool _1639 = isnan(_1541);
    bool _1641 = _1637 || _1639;
    float _1643 = _137 * _811;
    float _1645 = fma(_135, _813, _1643);
    float _1647 = fma(_139, _815, _1645);
    float _1649 = _1643;
    float _1651 = _1645;
    float _1653 = _1619;
    float _1655 = _1627;
    float _1657 = _1629;
    float _1659 = _1619;
    float _1661 = _1627;
    float _1663 = _1629;
    float _1665 = _1631;
    float _1667 = _1625;
    float _1669 = _1623;
    float _1671 = _1647;
    float _1673 = _1647;
    if (!_1641)
    {
        _1559 = _127;
    }
    float _1675 = _1559;
    float _1677 = _1675;
    float _1679 = _1675;
    if (!_1641)
    {
        _1649 = _129;
    }
    float _1681 = _1649;
    float _1683 = _1681;
    float _1685 = _1681;
    if (!_1641)
    {
        _1651 = _131;
    }
    float _1687 = _1651;
    bool _1689 = !_1641;
    float _1691 = _1687;
    float _1693 = _1687;
    if (!_1689)
    {
        bool _1695 = _1619 > _1541;
        if (_1695)
        {
            _1653 = _1541;
        }
        float _1697 = _1653;
        _1659 = _1697;
        if (!_1695)
        {
            _1677 = _1621;
        }
        float _1699 = _1677;
        float _1701 = _1699;
        if (!_1695)
        {
            _1683 = _1623;
        }
        float _1703 = _1683;
        float _1705 = _1703;
        if (!_1695)
        {
            _1691 = _1625;
        }
        float _1707 = _1691;
        float _1709 = _1707;
        if (!_1695)
        {
            _1561 = _1617;
        }
        float _1711 = _1561;
        float _1713 = _1711;
        if (_1695)
        {
            _1701 = _1621;
        }
        float _1715 = _1701;
        _1679 = _1715;
        if (_1695)
        {
            _1705 = _1623;
        }
        float _1717 = _1705;
        _1685 = _1717;
        if (_1695)
        {
            _1709 = _1625;
        }
        float _1719 = _1709;
        _1693 = _1719;
        if (_1695)
        {
            _1713 = _1617;
        }
        float _1721 = _1713;
        _1563 = _1721;
        if (_1695)
        {
            _1655 = _127;
        }
        float _1723 = _1655;
        _1661 = _1723;
        if (_1695)
        {
            _1657 = _129;
        }
        float _1725 = _1657;
        _1663 = _1725;
        if (_1695)
        {
            _1665 = _131;
        }
    }
    float _1727 = _1563;
    float _1729 = _1659;
    float _1731 = _1679;
    float _1733 = _1685;
    float _1735 = _1693;
    float _1737 = _1661;
    float _1739 = _1663;
    float _1741 = _1665;
    bool _1743 = _1727 >= _1647;
    bool _1745 = isnan(_1727);
    bool _1747 = _1743 || _1745;
    bool _1749 = isnan(_1647);
    bool _1751 = _1747 || _1749;
    float _1753 = _145 * _811;
    float _1755 = fma(_143, _813, _1753);
    float _1757 = fma(_147, _815, _1755);
    float _1759 = _1755;
    float _1761 = _1729;
    float _1763 = _1737;
    float _1765 = _1739;
    float _1767 = _1729;
    float _1769 = _1737;
    float _1771 = _1739;
    float _1773 = _1741;
    float _1775 = _1735;
    float _1777 = _1757;
    float _1779 = _1757;
    if (!_1751)
    {
        _1667 = _135;
    }
    float _1781 = _1667;
    float _1783 = _1781;
    float _1785 = _1781;
    if (!_1751)
    {
        _1669 = _137;
    }
    float _1787 = _1669;
    float _1789 = _1787;
    float _1791 = _1787;
    if (!_1751)
    {
        _1759 = _139;
    }
    float _1793 = _1759;
    bool _1795 = !_1751;
    float _1797 = _1793;
    float _1799 = _1793;
    if (!_1795)
    {
        bool _1801 = _1729 > _1647;
        if (_1801)
        {
            _1761 = _1647;
        }
        float _1803 = _1761;
        _1767 = _1803;
        if (!_1801)
        {
            _1783 = _1731;
        }
        float _1805 = _1783;
        float _1807 = _1805;
        if (!_1801)
        {
            _1789 = _1733;
        }
        float _1809 = _1789;
        float _1811 = _1809;
        if (!_1801)
        {
            _1797 = _1735;
        }
        float _1813 = _1797;
        float _1815 = _1813;
        if (!_1801)
        {
            _1671 = _1727;
        }
        float _1817 = _1671;
        float _1819 = _1817;
        if (_1801)
        {
            _1807 = _1731;
        }
        float _1821 = _1807;
        _1785 = _1821;
        if (_1801)
        {
            _1811 = _1733;
        }
        float _1823 = _1811;
        _1791 = _1823;
        if (_1801)
        {
            _1815 = _1735;
        }
        float _1825 = _1815;
        _1799 = _1825;
        if (_1801)
        {
            _1819 = _1727;
        }
        float _1827 = _1819;
        _1673 = _1827;
        if (_1801)
        {
            _1763 = _135;
        }
        float _1829 = _1763;
        _1769 = _1829;
        if (_1801)
        {
            _1765 = _137;
        }
        float _1831 = _1765;
        _1771 = _1831;
        if (_1801)
        {
            _1773 = _139;
        }
    }
    float _1833 = _1673;
    float _1835 = _1767;
    float _1837 = _1785;
    float _1839 = _1791;
    float _1841 = _1799;
    float _1843 = _1769;
    float _1845 = _1771;
    float _1847 = _1773;
    bool _1849 = _1833 >= _1757;
    bool _1851 = isnan(_1833);
    bool _1853 = _1849 || _1851;
    bool _1855 = isnan(_1757);
    bool _1857 = _1853 || _1855;
    float _1859 = _153 * _811;
    float _1861 = fma(_151, _813, _1859);
    float _1863 = fma(_155, _815, _1861);
    float _1865 = _1859;
    float _1867 = _1861;
    float _1869 = _1835;
    float _1871 = _1843;
    float _1873 = _1845;
    float _1875 = _1835;
    float _1877 = _1843;
    float _1879 = _1845;
    float _1881 = _1847;
    float _1883 = _1837;
    float _1885 = _1839;
    float _1887 = _1863;
    float _1889 = _1863;
    if (!_1857)
    {
        _1775 = _143;
    }
    float _1891 = _1775;
    float _1893 = _1891;
    float _1895 = _1891;
    if (!_1857)
    {
        _1865 = _145;
    }
    float _1897 = _1865;
    float _1899 = _1897;
    float _1901 = _1897;
    if (!_1857)
    {
        _1867 = _147;
    }
    float _1903 = _1867;
    bool _1905 = !_1857;
    float _1907 = _1903;
    float _1909 = _1903;
    if (!_1905)
    {
        bool _1911 = _1835 > _1757;
        if (_1911)
        {
            _1869 = _1757;
        }
        float _1913 = _1869;
        _1875 = _1913;
        if (!_1911)
        {
            _1893 = _1837;
        }
        float _1915 = _1893;
        float _1917 = _1915;
        if (!_1911)
        {
            _1899 = _1839;
        }
        float _1919 = _1899;
        float _1921 = _1919;
        if (!_1911)
        {
            _1907 = _1841;
        }
        float _1923 = _1907;
        float _1925 = _1923;
        if (!_1911)
        {
            _1777 = _1833;
        }
        float _1927 = _1777;
        float _1929 = _1927;
        if (_1911)
        {
            _1917 = _1837;
        }
        float _1931 = _1917;
        _1895 = _1931;
        if (_1911)
        {
            _1921 = _1839;
        }
        float _1933 = _1921;
        _1901 = _1933;
        if (_1911)
        {
            _1925 = _1841;
        }
        float _1935 = _1925;
        _1909 = _1935;
        if (_1911)
        {
            _1929 = _1833;
        }
        float _1937 = _1929;
        _1779 = _1937;
        if (_1911)
        {
            _1871 = _143;
        }
        float _1939 = _1871;
        _1877 = _1939;
        if (_1911)
        {
            _1873 = _145;
        }
        float _1941 = _1873;
        _1879 = _1941;
        if (_1911)
        {
            _1881 = _147;
        }
    }
    float _1943 = _1779;
    float _1945 = _1875;
    float _1947 = _1895;
    float _1949 = _1901;
    float _1951 = _1909;
    float _1953 = _1877;
    float _1955 = _1879;
    float _1957 = _1881;
    bool _1959 = _1943 >= _1863;
    bool _1961 = isnan(_1943);
    bool _1963 = _1959 || _1961;
    bool _1965 = isnan(_1863);
    bool _1967 = _1963 || _1965;
    float _1969 = _161 * _811;
    float _1971 = fma(_159, _813, _1969);
    float _1973 = fma(_163, _815, _1971);
    float _1975 = _1971;
    float _1977 = _1945;
    float _1979 = _1953;
    float _1981 = _1955;
    float _1983 = _1945;
    float _1985 = _1953;
    float _1987 = _1955;
    float _1989 = _1957;
    float _1991 = _1947;
    float _1993 = _1973;
    float _1995 = _1973;
    if (!_1967)
    {
        _1883 = _151;
    }
    float _1997 = _1883;
    float _1999 = _1997;
    float _2001 = _1997;
    if (!_1967)
    {
        _1885 = _153;
    }
    float _2003 = _1885;
    float _2005 = _2003;
    float _2007 = _2003;
    if (!_1967)
    {
        _1975 = _155;
    }
    float _2009 = _1975;
    bool _2011 = !_1967;
    float _2013 = _2009;
    float _2015 = _2009;
    if (!_2011)
    {
        bool _2017 = _1945 > _1863;
        if (_2017)
        {
            _1977 = _1863;
        }
        float _2019 = _1977;
        _1983 = _2019;
        if (!_2017)
        {
            _1999 = _1947;
        }
        float _2021 = _1999;
        float _2023 = _2021;
        if (!_2017)
        {
            _2005 = _1949;
        }
        float _2025 = _2005;
        float _2027 = _2025;
        if (!_2017)
        {
            _2013 = _1951;
        }
        float _2029 = _2013;
        float _2031 = _2029;
        if (!_2017)
        {
            _1887 = _1943;
        }
        float _2033 = _1887;
        float _2035 = _2033;
        if (_2017)
        {
            _2023 = _1947;
        }
        float _2037 = _2023;
        _2001 = _2037;
        if (_2017)
        {
            _2027 = _1949;
        }
        float _2039 = _2027;
        _2007 = _2039;
        if (_2017)
        {
            _2031 = _1951;
        }
        float _2041 = _2031;
        _2015 = _2041;
        if (_2017)
        {
            _2035 = _1943;
        }
        float _2043 = _2035;
        _1889 = _2043;
        if (_2017)
        {
            _1979 = _151;
        }
        float _2045 = _1979;
        _1985 = _2045;
        if (_2017)
        {
            _1981 = _153;
        }
        float _2047 = _1981;
        _1987 = _2047;
        if (_2017)
        {
            _1989 = _155;
        }
    }
    float _2049 = _1889;
    float _2051 = _1983;
    float _2053 = _2001;
    float _2055 = _2007;
    float _2057 = _2015;
    float _2059 = _1985;
    float _2061 = _1987;
    float _2063 = _1989;
    bool _2065 = _2049 >= _1973;
    bool _2067 = isnan(_2049);
    bool _2069 = _2065 || _2067;
    bool _2071 = isnan(_1973);
    bool _2073 = _2069 || _2071;
    float _2075 = _169 * _811;
    float _2077 = fma(_167, _813, _2075);
    float _2079 = fma(_171, _815, _2077);
    float _2081 = _2075;
    float _2083 = _2077;
    float _2085 = _2051;
    float _2087 = _2059;
    float _2089 = _2061;
    float _2091 = _2051;
    float _2093 = _2059;
    float _2095 = _2061;
    float _2097 = _2063;
    float _2099 = _2053;
    float _2101 = _2055;
    float _2103 = _2079;
    float _2105 = _2079;
    if (!_2073)
    {
        _1991 = _159;
    }
    float _2107 = _1991;
    float _2109 = _2107;
    float _2111 = _2107;
    if (!_2073)
    {
        _2081 = _161;
    }
    float _2113 = _2081;
    float _2115 = _2113;
    float _2117 = _2113;
    if (!_2073)
    {
        _2083 = _163;
    }
    float _2119 = _2083;
    bool _2121 = !_2073;
    float _2123 = _2119;
    float _2125 = _2119;
    if (!_2121)
    {
        bool _2127 = _2051 > _1973;
        if (_2127)
        {
            _2085 = _1973;
        }
        float _2129 = _2085;
        _2091 = _2129;
        if (!_2127)
        {
            _2109 = _2053;
        }
        float _2131 = _2109;
        float _2133 = _2131;
        if (!_2127)
        {
            _2115 = _2055;
        }
        float _2135 = _2115;
        float _2137 = _2135;
        if (!_2127)
        {
            _2123 = _2057;
        }
        float _2139 = _2123;
        float _2141 = _2139;
        if (!_2127)
        {
            _1993 = _2049;
        }
        float _2143 = _1993;
        float _2145 = _2143;
        if (_2127)
        {
            _2133 = _2053;
        }
        float _2147 = _2133;
        _2111 = _2147;
        if (_2127)
        {
            _2137 = _2055;
        }
        float _2149 = _2137;
        _2117 = _2149;
        if (_2127)
        {
            _2141 = _2057;
        }
        float _2151 = _2141;
        _2125 = _2151;
        if (_2127)
        {
            _2145 = _2049;
        }
        float _2153 = _2145;
        _1995 = _2153;
        if (_2127)
        {
            _2087 = _159;
        }
        float _2155 = _2087;
        _2093 = _2155;
        if (_2127)
        {
            _2089 = _161;
        }
        float _2157 = _2089;
        _2095 = _2157;
        if (_2127)
        {
            _2097 = _163;
        }
    }
    float _2159 = _1995;
    float _2161 = _2091;
    float _2163 = _2111;
    float _2165 = _2117;
    float _2167 = _2125;
    float _2169 = _2093;
    float _2171 = _2095;
    float _2173 = _2097;
    bool _2175 = _2159 >= _2079;
    bool _2177 = isnan(_2159);
    bool _2179 = _2175 || _2177;
    bool _2181 = isnan(_2079);
    bool _2183 = _2179 || _2181;
    float _2185 = _177 * _811;
    float _2187 = fma(_175, _813, _2185);
    float _2189 = fma(_179, _815, _2187);
    float _2191 = _2187;
    float _2193 = _2161;
    float _2195 = _2169;
    float _2197 = _2171;
    float _2199 = _2169;
    float _2201 = _2161;
    float _2203 = _2171;
    float _2205 = _2173;
    float _2207 = _2167;
    float _2209 = _2189;
    float _2211 = _2189;
    if (!_2183)
    {
        _2099 = _167;
    }
    float _2213 = _2099;
    float _2215 = _2213;
    float _2217 = _2213;
    if (!_2183)
    {
        _2101 = _169;
    }
    float _2219 = _2101;
    float _2221 = _2219;
    float _2223 = _2219;
    if (!_2183)
    {
        _2191 = _171;
    }
    float _2225 = _2191;
    bool _2227 = !_2183;
    float _2229 = _2225;
    float _2231 = _2225;
    if (!_2227)
    {
        bool _2233 = _2161 > _2079;
        if (_2233)
        {
            _2193 = _2079;
        }
        float _2235 = _2193;
        _2201 = _2235;
        if (!_2233)
        {
            _2215 = _2163;
        }
        float _2237 = _2215;
        float _2239 = _2237;
        if (!_2233)
        {
            _2221 = _2165;
        }
        float _2241 = _2221;
        float _2243 = _2241;
        if (!_2233)
        {
            _2229 = _2167;
        }
        float _2245 = _2229;
        float _2247 = _2245;
        if (!_2233)
        {
            _2103 = _2159;
        }
        float _2249 = _2103;
        float _2251 = _2249;
        if (_2233)
        {
            _2239 = _2163;
        }
        float _2253 = _2239;
        _2217 = _2253;
        if (_2233)
        {
            _2243 = _2165;
        }
        float _2255 = _2243;
        _2223 = _2255;
        if (_2233)
        {
            _2247 = _2167;
        }
        float _2257 = _2247;
        _2231 = _2257;
        if (_2233)
        {
            _2251 = _2159;
        }
        float _2259 = _2251;
        _2105 = _2259;
        if (_2233)
        {
            _2195 = _167;
        }
        float _2261 = _2195;
        _2199 = _2261;
        if (_2233)
        {
            _2197 = _169;
        }
        float _2263 = _2197;
        _2203 = _2263;
        if (_2233)
        {
            _2205 = _171;
        }
    }
    float _2265 = _2105;
    float _2267 = _2199;
    float _2269 = _2201;
    float _2271 = _2217;
    float _2273 = _2223;
    float _2275 = _2231;
    float _2277 = _2203;
    float _2279 = _2205;
    bool _2281 = _2265 >= _2189;
    bool _2283 = isnan(_2265);
    bool _2285 = _2281 || _2283;
    bool _2287 = isnan(_2189);
    bool _2289 = _2285 || _2287;
    float _2291 = _185 * _811;
    float _2293 = fma(_183, _813, _2291);
    float _2295 = fma(_187, _815, _2293);
    float _2297 = _2291;
    float _2299 = _2269;
    float _2301 = _2277;
    float _2303 = _2277;
    float _2305 = _2279;
    float _2307 = _2269;
    float _2309 = _2271;
    float _2311 = _2273;
    if (!_2289)
    {
        _2207 = _2267;
    }
    float _2313 = _2207;
    float _2315 = _2313;
    float _2317 = _2313;
    if (!_2289)
    {
        _871 = _175;
    }
    float _2319 = _871;
    float _2321 = _2319;
    float _2323 = _2319;
    if (!_2289)
    {
        _873 = _177;
    }
    float _2325 = _873;
    float _2327 = _2325;
    float _2329 = _2325;
    if (!_2289)
    {
        _2297 = _179;
    }
    float _2331 = _2297;
    bool _2333 = !_2289;
    float _2335 = _2331;
    float _2337 = _2331;
    if (!_2333)
    {
        bool _2339 = _2269 > _2189;
        if (_2339)
        {
            _2299 = _2189;
        }
        float _2341 = _2299;
        _2307 = _2341;
        if (!_2339)
        {
            _2321 = _2271;
        }
        float _2343 = _2321;
        float _2345 = _2343;
        if (!_2339)
        {
            _2327 = _2273;
        }
        float _2347 = _2327;
        float _2349 = _2347;
        if (!_2339)
        {
            _2335 = _2275;
        }
        float _2351 = _2335;
        float _2353 = _2351;
        if (!_2339)
        {
            _2209 = _2265;
        }
        float _2355 = _2209;
        float _2357 = _2355;
        if (!_2339)
        {
            _2315 = _2267;
        }
        float _2359 = _2315;
        float _2361 = _2359;
        if (_2339)
        {
            _2345 = _2271;
        }
        float _2363 = _2345;
        _2323 = _2363;
        if (_2339)
        {
            _2349 = _2273;
        }
        float _2365 = _2349;
        _2329 = _2365;
        if (_2339)
        {
            _2353 = _2275;
        }
        float _2367 = _2353;
        _2337 = _2367;
        if (_2339)
        {
            _2357 = _2265;
        }
        float _2369 = _2357;
        _2211 = _2369;
        if (_2339)
        {
            _2361 = _175;
        }
        float _2371 = _2361;
        _2317 = _2371;
        if (_2339)
        {
            _2301 = _177;
        }
        float _2373 = _2301;
        _2303 = _2373;
        if (_2339)
        {
            _2305 = _179;
        }
    }
    float _2375 = _2211;
    float _2377 = _2303;
    float _2379 = _2305;
    float _2381 = _2307;
    float _2383 = _2323;
    float _2385 = _2329;
    float _2387 = _2337;
    float _2389 = _2317;
    bool _2391 = _2375 >= _2295;
    bool _2393 = isnan(_2375);
    bool _2395 = _2391 || _2393;
    bool _2397 = isnan(_2295);
    bool _2399 = _2395 || _2397;
    float _2401 = _2389;
    float _2403 = _2389;
    if (!_2399)
    {
        _2309 = _2377;
    }
    float _2405 = _2309;
    float _2407 = _2405;
    float _2409 = _2405;
    if (!_2399)
    {
        _2311 = _2379;
    }
    float _2411 = _2311;
    float _2413 = 0.0;
    float _2415 = _2411;
    float _2417 = _2411;
    if (!_2399)
    {
        _2413 = _183;
    }
    float _2419 = _2413;
    float _2421 = 0.0;
    float _2423 = _2419;
    float _2425 = _2419;
    if (!_2399)
    {
        _2421 = _185;
    }
    float _2427 = _2421;
    float _2429 = 0.0;
    float _2431 = _2427;
    float _2433 = _2427;
    if (!_2399)
    {
        _2429 = _187;
    }
    float _2435 = _2429;
    bool _2437 = !_2399;
    float _2439 = _2435;
    float _2441 = _2435;
    if (!_2437)
    {
        bool _2443 = _2381 > _2295;
        if (!_2443)
        {
            _2423 = _2383;
        }
        float _2445 = _2423;
        float _2447 = _2445;
        if (!_2443)
        {
            _2431 = _2385;
        }
        float _2449 = _2431;
        float _2451 = _2449;
        if (!_2443)
        {
            _2439 = _2387;
        }
        float _2453 = _2439;
        float _2455 = _2453;
        if (!_2443)
        {
            _2407 = _2377;
        }
        float _2457 = _2407;
        float _2459 = _2457;
        if (!_2443)
        {
            _2415 = _2379;
        }
        float _2461 = _2415;
        _2417 = _2461;
        if (_2443)
        {
            _2447 = _2383;
        }
        float _2463 = _2447;
        _2425 = _2463;
        if (_2443)
        {
            _2451 = _2385;
        }
        float _2465 = _2451;
        _2433 = _2465;
        if (_2443)
        {
            _2455 = _2387;
        }
        float _2467 = _2455;
        _2441 = _2467;
        if (_2443)
        {
            _2401 = _183;
        }
        float _2469 = _2401;
        _2403 = _2469;
        if (_2443)
        {
            _2459 = _185;
        }
        float _2471 = _2459;
        _2409 = _2471;
        if (_2443)
        {
            _2417 = _187;
        }
    }
    float _2473 = _2409;
    float _2475 = _2433;
    float _2477 = _2403;
    float _2479 = _2425;
    float _2481 = _2417;
    float _2483 = _2441;
    float _2485 = -_2473;
    float _2487 = _2475 + _2485;
    float _2489 = -_2477;
    float _2491 = _2479 + _2489;
    float _2493 = -_2481;
    float _2495 = _2483 + _2493;
    float _2497 = -_2477;
    float _2499 = _71 + _2497;
    float _2501 = _2487 * _2487;
    float _2503 = fma(_2491, _2491, _2501);
    float _2505 = fma(_2495, _2495, _2503);
    float _2507 = -_2473;
    float _2509 = _73 + _2507;
    float _2511 = _2487 * _2509;
    float _2513 = 1.0 / _2505;
    float _2515 = -_2481;
    float _2517 = _75 + _2515;
    float _2519 = fma(_2491, _2499, _2511);
    float _2521 = fma(_2495, _2517, _2519);
    float _2523 = _2513 * 3.0;
    float _2525 = _2523 * _2521;
    float _2527 = rint(_2525);
    float _2529 = precise::max(0.0, _2527);
    float _2531 = precise::min(_2529, 3.0);
    float _2533 = trunc(_2531);
    int _2536 = int(_2533);
    bool _2538 = _2536 >= 2;
    bool _2540 = !_2538;
    float _2542 = _2491;
    float _2544 = _2487;
    float _2546 = _2495;
    float _2548 = _2477;
    float _2550 = _2479;
    float _2552 = _2473;
    float _2554 = _2475;
    float _2556 = _2483;
    float _2558 = _2481;
    float _2568;
    float _2570;
    float _2572;
    float _2574;
    float _2576;
    float _2578;
    float _2580;
    float _2582;
    float _2584;
    float _2586;
    float _2588;
    float _2590;
    float _2592;
    float _2594;
    float _2596;
    float _2598;
    if (!_2540)
    {
        bool _2560 = _2536 >= 3;
        bool _2562 = !_2560;
        if (!_2562)
        {
            bool _2564 = _2536 != 3;
            _2566 = _2564;
            if (!_2566)
            {
                _2568 = _71;
                _2570 = _73;
                _2572 = _75;
                _2574 = 1.0;
                _2576 = 0.0;
                _2578 = 0.0;
                _2580 = 0.0;
                _2582 = 0.0;
                _2584 = 0.0;
                _2586 = 0.0;
                _2588 = 0.0;
                _2590 = 0.0;
                _2592 = 0.0;
                _2594 = 0.0;
                _2596 = 0.0;
                _2598 = 0.0;
                _2600 = true;
            }
        }
        else
        {
            _2568 = 0.0;
            _2570 = 0.0;
            _2572 = 0.0;
            _2574 = 0.0;
            _2576 = 0.0;
            _2578 = 0.0;
            _2580 = 0.0;
            _2582 = 0.0;
            _2584 = _71;
            _2586 = _73;
            _2588 = _75;
            _2590 = 1.0;
            _2592 = 0.0;
            _2594 = 0.0;
            _2596 = 0.0;
            _2598 = 0.0;
            _2600 = true;
        }
    }
    if ((!_2600) || _2566)
    {
        bool _2602;
        if (!_2566)
        {
            _2602 = _2536 >= 1;
        }
        if ((!_2602) || _2566)
        {
            bool _2604;
            if (!_2566)
            {
                _2604 = _2536 != 0;
            }
            if ((!_2604) && (!_2566))
            {
                _2568 = 0.0;
                _2570 = 0.0;
                _2572 = 0.0;
                _2574 = 0.0;
                _2576 = _71;
                _2578 = _73;
                _2580 = _75;
                _2582 = 1.0;
                _2584 = 0.0;
                _2586 = 0.0;
                _2588 = 0.0;
                _2590 = 0.0;
                _2592 = 0.0;
                _2594 = 0.0;
                _2596 = 0.0;
                _2598 = 0.0;
                _2600 = true;
            }
            else
            {
                _2566 = false;
                _2568 = 0.0;
                _2570 = 0.0;
                _2572 = 0.0;
                _2574 = 0.0;
                _2576 = 0.0;
                _2578 = 0.0;
                _2580 = 0.0;
                _2582 = 0.0;
                _2584 = 0.0;
                _2586 = 0.0;
                _2588 = 0.0;
                _2590 = 0.0;
                _2592 = 0.0;
                _2594 = 0.0;
                _2596 = 0.0;
                _2598 = 0.0;
                _2600 = true;
            }
        }
        else
        {
            _2568 = 0.0;
            _2570 = 0.0;
            _2572 = 0.0;
            _2574 = 0.0;
            _2576 = 0.0;
            _2578 = 0.0;
            _2580 = 0.0;
            _2582 = 0.0;
            _2584 = 0.0;
            _2586 = 0.0;
            _2588 = 0.0;
            _2590 = 0.0;
            _2592 = _71;
            _2594 = _73;
            _2596 = _75;
            _2598 = 1.0;
        }
    }
    _2600 = false;
    float _2606 = _2568;
    float _2608 = _2570;
    float _2610 = _2572;
    float _2612 = _2574;
    float _2614 = _2576;
    float _2616 = _2578;
    float _2618 = _2580;
    float _2620 = _2582;
    float _2622 = _2584;
    float _2624 = _2586;
    float _2626 = _2588;
    float _2628 = _2590;
    float _2630 = _2592;
    float _2632 = _2594;
    float _2634 = _2596;
    float _2636 = _2598;
    float _2638 = -_2473;
    float _2640 = _65 + _2638;
    float _2642 = -_2477;
    float _2644 = _63 + _2642;
    float _2646 = _2487 * _2640;
    float _2648 = -_2481;
    float _2650 = _67 + _2648;
    float _2652 = fma(_2491, _2644, _2646);
    float _2654 = fma(_2495, _2650, _2652);
    float _2656 = _2523 * _2654;
    float _2658 = rint(_2656);
    float _2660 = precise::max(0.0, _2658);
    float _2662 = precise::min(_2660, 3.0);
    float _2664 = trunc(_2662);
    int _2666 = int(_2664);
    bool _2668 = _2666 >= 2;
    bool _2670 = !_2668;
    float _2672 = _2658;
    float _2674 = as_type<float>(_2666);
    float _2676 = _2646;
    float _2678 = _2652;
    float _2680 = _2606;
    float _2682 = _2608;
    float _2684 = _2610;
    float _2686 = _2612;
    float _2688 = _2622;
    float _2690 = _2624;
    float _2692 = _2626;
    float _2694 = _2628;
    float _2696 = _2630;
    float _2698 = _2632;
    float _2700 = _2634;
    float _2702 = _2636;
    float _2720;
    float _2722;
    float _2724;
    float _2726;
    if (!_2670)
    {
        bool _2704 = _2666 >= 3;
        bool _2706 = !_2704;
        if (!_2706)
        {
            bool _2708 = _2666 != 3;
            _2710 = _2708;
            if (!_2710)
            {
                float _2712 = _63 + _2606;
                float _2714 = _65 + _2608;
                float _2716 = _67 + _2610;
                float _2718 = _2612 + 1.0;
                _2680 = _2712;
                _2682 = _2714;
                _2684 = _2716;
                _2686 = _2718;
                _2720 = _2614;
                _2722 = _2616;
                _2724 = _2618;
                _2726 = _2620;
                _2728 = true;
            }
        }
        else
        {
            float _2730 = _63 + _2622;
            float _2732 = _65 + _2624;
            float _2734 = _67 + _2626;
            float _2736 = _2628 + 1.0;
            _2720 = _2614;
            _2722 = _2616;
            _2724 = _2618;
            _2726 = _2620;
            _2688 = _2730;
            _2690 = _2732;
            _2692 = _2734;
            _2694 = _2736;
            _2728 = true;
        }
    }
    if ((!_2728) || _2710)
    {
        bool _2738;
        if (!_2710)
        {
            _2738 = _2666 >= 1;
        }
        if ((!_2738) || _2710)
        {
            if (!_2710)
            {
                bool _2740 = _2666 != 0;
                if (!_2740)
                {
                    float _2742 = _63 + _2614;
                    _2672 = _2742;
                }
                float _2744 = _2672;
                _2720 = _2744;
                if (!_2740)
                {
                    float _2746 = _65 + _2616;
                    _2674 = _2746;
                }
                float _2748 = _2674;
                _2722 = _2748;
                if (!_2740)
                {
                    float _2750 = _67 + _2618;
                    _2676 = _2750;
                }
                float _2752 = _2676;
                _2724 = _2752;
                if (!_2740)
                {
                    float _2754 = _2620 + 1.0;
                    _2678 = _2754;
                }
                float _2756 = _2678;
                bool _2758 = !_2740;
                _2726 = _2756;
                _2728 = _2758;
            }
            if ((!_2728) || _2710)
            {
                _2710 = false;
                _2720 = _2614;
                _2722 = _2616;
                _2724 = _2618;
                _2726 = _2620;
                _2728 = true;
            }
        }
        else
        {
            float _2760 = _63 + _2630;
            float _2762 = _65 + _2632;
            float _2764 = _67 + _2634;
            float _2766 = _2636 + 1.0;
            _2720 = _2614;
            _2722 = _2616;
            _2724 = _2618;
            _2726 = _2620;
            _2696 = _2760;
            _2698 = _2762;
            _2700 = _2764;
            _2702 = _2766;
        }
    }
    _2728 = false;
    float _2768 = _2680;
    float _2770 = _2682;
    float _2772 = _2684;
    float _2774 = _2686;
    float _2776 = _2720;
    float _2778 = _2722;
    float _2780 = _2724;
    float _2782 = _2726;
    float _2784 = _2688;
    float _2786 = _2690;
    float _2788 = _2692;
    float _2790 = _2694;
    float _2792 = _2696;
    float _2794 = _2698;
    float _2796 = _2700;
    float _2798 = _2702;
    float _2800 = -_2473;
    float _2802 = _81 + _2800;
    float _2804 = -_2477;
    float _2806 = _79 + _2804;
    float _2808 = _2487 * _2802;
    float _2810 = -_2481;
    float _2812 = _83 + _2810;
    float _2814 = fma(_2491, _2806, _2808);
    float _2816 = fma(_2495, _2812, _2814);
    float _2818 = _2523 * _2816;
    float _2820 = rint(_2818);
    float _2822 = precise::max(0.0, _2820);
    float _2824 = precise::min(_2822, 3.0);
    float _2826 = trunc(_2824);
    int _2828 = int(_2826);
    bool _2830 = _2828 >= 2;
    bool _2832 = !_2830;
    float _2834 = _2820;
    float _2836 = as_type<float>(_2828);
    float _2838 = _2808;
    float _2840 = _2814;
    float _2842 = _2768;
    float _2844 = _2770;
    float _2846 = _2772;
    float _2848 = _2774;
    float _2850 = _2784;
    float _2852 = _2786;
    float _2854 = _2788;
    float _2856 = _2790;
    float _2858 = _2792;
    float _2860 = _2794;
    float _2862 = _2796;
    float _2864 = _2798;
    float _2882;
    float _2884;
    float _2886;
    float _2888;
    if (!_2832)
    {
        bool _2866 = _2828 >= 3;
        bool _2868 = !_2866;
        if (!_2868)
        {
            bool _2870 = _2828 != 3;
            _2872 = _2870;
            if (!_2872)
            {
                float _2874 = _79 + _2768;
                float _2876 = _81 + _2770;
                float _2878 = _83 + _2772;
                float _2880 = _2774 + 1.0;
                _2842 = _2874;
                _2844 = _2876;
                _2846 = _2878;
                _2848 = _2880;
                _2882 = _2776;
                _2884 = _2778;
                _2886 = _2780;
                _2888 = _2782;
                _2890 = true;
            }
        }
        else
        {
            float _2892 = _79 + _2784;
            float _2894 = _81 + _2786;
            float _2896 = _83 + _2788;
            float _2898 = _2790 + 1.0;
            _2882 = _2776;
            _2884 = _2778;
            _2886 = _2780;
            _2888 = _2782;
            _2850 = _2892;
            _2852 = _2894;
            _2854 = _2896;
            _2856 = _2898;
            _2890 = true;
        }
    }
    if ((!_2890) || _2872)
    {
        bool _2900;
        if (!_2872)
        {
            _2900 = _2828 >= 1;
        }
        if ((!_2900) || _2872)
        {
            if (!_2872)
            {
                bool _2902 = _2828 != 0;
                if (!_2902)
                {
                    float _2904 = _79 + _2776;
                    _2834 = _2904;
                }
                float _2906 = _2834;
                _2882 = _2906;
                if (!_2902)
                {
                    float _2908 = _81 + _2778;
                    _2836 = _2908;
                }
                float _2910 = _2836;
                _2884 = _2910;
                if (!_2902)
                {
                    float _2912 = _83 + _2780;
                    _2838 = _2912;
                }
                float _2914 = _2838;
                _2886 = _2914;
                if (!_2902)
                {
                    float _2916 = _2782 + 1.0;
                    _2840 = _2916;
                }
                float _2918 = _2840;
                bool _2920 = !_2902;
                _2888 = _2918;
                _2890 = _2920;
            }
            if ((!_2890) || _2872)
            {
                _2872 = false;
                _2882 = _2776;
                _2884 = _2778;
                _2886 = _2780;
                _2888 = _2782;
                _2890 = true;
            }
        }
        else
        {
            float _2922 = _79 + _2792;
            float _2924 = _81 + _2794;
            float _2926 = _83 + _2796;
            float _2928 = _2798 + 1.0;
            _2882 = _2776;
            _2884 = _2778;
            _2886 = _2780;
            _2888 = _2782;
            _2858 = _2922;
            _2860 = _2924;
            _2862 = _2926;
            _2864 = _2928;
        }
    }
    _2890 = false;
    float _2930 = _2842;
    float _2932 = _2844;
    float _2934 = _2846;
    float _2936 = _2848;
    float _2938 = _2882;
    float _2940 = _2884;
    float _2942 = _2886;
    float _2944 = _2888;
    float _2946 = _2850;
    float _2948 = _2852;
    float _2950 = _2854;
    float _2952 = _2856;
    float _2954 = _2858;
    float _2956 = _2860;
    float _2958 = _2862;
    float _2960 = _2864;
    float _2962 = -_2473;
    float _2964 = _89 + _2962;
    float _2966 = -_2477;
    float _2968 = _87 + _2966;
    float _2970 = _2487 * _2964;
    float _2972 = -_2481;
    float _2974 = _91 + _2972;
    float _2976 = fma(_2491, _2968, _2970);
    float _2978 = fma(_2495, _2974, _2976);
    float _2980 = _2523 * _2978;
    float _2982 = rint(_2980);
    float _2984 = precise::max(0.0, _2982);
    float _2986 = precise::min(_2984, 3.0);
    float _2988 = trunc(_2986);
    int _2990 = int(_2988);
    bool _2992 = _2990 >= 2;
    bool _2994 = !_2992;
    float _2996 = _2982;
    float _2998 = as_type<float>(_2990);
    float _3000 = _2970;
    float _3002 = _2976;
    float _3004 = _2930;
    float _3006 = _2932;
    float _3008 = _2934;
    float _3010 = _2936;
    float _3012 = _2946;
    float _3014 = _2948;
    float _3016 = _2950;
    float _3018 = _2952;
    float _3020 = _2954;
    float _3022 = _2956;
    float _3024 = _2958;
    float _3026 = _2960;
    float _3044;
    float _3046;
    float _3048;
    float _3050;
    if (!_2994)
    {
        bool _3028 = _2990 >= 3;
        bool _3030 = !_3028;
        if (!_3030)
        {
            bool _3032 = _2990 != 3;
            _3034 = _3032;
            if (!_3034)
            {
                float _3036 = _87 + _2930;
                float _3038 = _89 + _2932;
                float _3040 = _91 + _2934;
                float _3042 = _2936 + 1.0;
                _3004 = _3036;
                _3006 = _3038;
                _3008 = _3040;
                _3010 = _3042;
                _3044 = _2938;
                _3046 = _2940;
                _3048 = _2942;
                _3050 = _2944;
                _3052 = true;
            }
        }
        else
        {
            float _3054 = _87 + _2946;
            float _3056 = _89 + _2948;
            float _3058 = _91 + _2950;
            float _3060 = _2952 + 1.0;
            _3044 = _2938;
            _3046 = _2940;
            _3048 = _2942;
            _3050 = _2944;
            _3012 = _3054;
            _3014 = _3056;
            _3016 = _3058;
            _3018 = _3060;
            _3052 = true;
        }
    }
    if ((!_3052) || _3034)
    {
        bool _3062;
        if (!_3034)
        {
            _3062 = _2990 >= 1;
        }
        if ((!_3062) || _3034)
        {
            if (!_3034)
            {
                bool _3064 = _2990 != 0;
                if (!_3064)
                {
                    float _3066 = _87 + _2938;
                    _2996 = _3066;
                }
                float _3068 = _2996;
                _3044 = _3068;
                if (!_3064)
                {
                    float _3070 = _89 + _2940;
                    _2998 = _3070;
                }
                float _3072 = _2998;
                _3046 = _3072;
                if (!_3064)
                {
                    float _3074 = _91 + _2942;
                    _3000 = _3074;
                }
                float _3076 = _3000;
                _3048 = _3076;
                if (!_3064)
                {
                    float _3078 = _2944 + 1.0;
                    _3002 = _3078;
                }
                float _3080 = _3002;
                bool _3082 = !_3064;
                _3050 = _3080;
                _3052 = _3082;
            }
            if ((!_3052) || _3034)
            {
                _3034 = false;
                _3044 = _2938;
                _3046 = _2940;
                _3048 = _2942;
                _3050 = _2944;
                _3052 = true;
            }
        }
        else
        {
            float _3084 = _87 + _2954;
            float _3086 = _89 + _2956;
            float _3088 = _91 + _2958;
            float _3090 = _2960 + 1.0;
            _3044 = _2938;
            _3046 = _2940;
            _3048 = _2942;
            _3050 = _2944;
            _3020 = _3084;
            _3022 = _3086;
            _3024 = _3088;
            _3026 = _3090;
        }
    }
    _3052 = false;
    float _3092 = _3004;
    float _3094 = _3006;
    float _3096 = _3008;
    float _3098 = _3010;
    float _3100 = _3044;
    float _3102 = _3046;
    float _3104 = _3048;
    float _3106 = _3050;
    float _3108 = _3012;
    float _3110 = _3014;
    float _3112 = _3016;
    float _3114 = _3018;
    float _3116 = _3020;
    float _3118 = _3022;
    float _3120 = _3024;
    float _3122 = _3026;
    float _3124 = -_2473;
    float _3126 = _97 + _3124;
    float _3128 = -_2477;
    float _3130 = _95 + _3128;
    float _3132 = _2487 * _3126;
    float _3134 = -_2481;
    float _3136 = _99 + _3134;
    float _3138 = fma(_2491, _3130, _3132);
    float _3140 = fma(_2495, _3136, _3138);
    float _3142 = _2523 * _3140;
    float _3144 = rint(_3142);
    float _3146 = precise::max(0.0, _3144);
    float _3148 = precise::min(_3146, 3.0);
    float _3150 = trunc(_3148);
    int _3152 = int(_3150);
    bool _3154 = _3152 >= 2;
    bool _3156 = !_3154;
    float _3158 = _3144;
    float _3160 = as_type<float>(_3152);
    float _3162 = _3132;
    float _3164 = _3138;
    float _3166 = _3092;
    float _3168 = _3094;
    float _3170 = _3096;
    float _3172 = _3098;
    float _3174 = _3108;
    float _3176 = _3110;
    float _3178 = _3112;
    float _3180 = _3114;
    float _3182 = _3116;
    float _3184 = _3118;
    float _3186 = _3120;
    float _3188 = _3122;
    float _3206;
    float _3208;
    float _3210;
    float _3212;
    if (!_3156)
    {
        bool _3190 = _3152 >= 3;
        bool _3192 = !_3190;
        if (!_3192)
        {
            bool _3194 = _3152 != 3;
            _3196 = _3194;
            if (!_3196)
            {
                float _3198 = _95 + _3092;
                float _3200 = _97 + _3094;
                float _3202 = _99 + _3096;
                float _3204 = _3098 + 1.0;
                _3166 = _3198;
                _3168 = _3200;
                _3170 = _3202;
                _3172 = _3204;
                _3206 = _3100;
                _3208 = _3102;
                _3210 = _3104;
                _3212 = _3106;
                _3214 = true;
            }
        }
        else
        {
            float _3216 = _95 + _3108;
            float _3218 = _97 + _3110;
            float _3220 = _99 + _3112;
            float _3222 = _3114 + 1.0;
            _3206 = _3100;
            _3208 = _3102;
            _3210 = _3104;
            _3212 = _3106;
            _3174 = _3216;
            _3176 = _3218;
            _3178 = _3220;
            _3180 = _3222;
            _3214 = true;
        }
    }
    if ((!_3214) || _3196)
    {
        bool _3224;
        if (!_3196)
        {
            _3224 = _3152 >= 1;
        }
        if ((!_3224) || _3196)
        {
            if (!_3196)
            {
                bool _3226 = _3152 != 0;
                if (!_3226)
                {
                    float _3228 = _95 + _3100;
                    _3158 = _3228;
                }
                float _3230 = _3158;
                _3206 = _3230;
                if (!_3226)
                {
                    float _3232 = _97 + _3102;
                    _3160 = _3232;
                }
                float _3234 = _3160;
                _3208 = _3234;
                if (!_3226)
                {
                    float _3236 = _99 + _3104;
                    _3162 = _3236;
                }
                float _3238 = _3162;
                _3210 = _3238;
                if (!_3226)
                {
                    float _3240 = _3106 + 1.0;
                    _3164 = _3240;
                }
                float _3242 = _3164;
                bool _3244 = !_3226;
                _3212 = _3242;
                _3214 = _3244;
            }
            if ((!_3214) || _3196)
            {
                _3196 = false;
                _3206 = _3100;
                _3208 = _3102;
                _3210 = _3104;
                _3212 = _3106;
                _3214 = true;
            }
        }
        else
        {
            float _3246 = _95 + _3116;
            float _3248 = _97 + _3118;
            float _3250 = _99 + _3120;
            float _3252 = _3122 + 1.0;
            _3206 = _3100;
            _3208 = _3102;
            _3210 = _3104;
            _3212 = _3106;
            _3182 = _3246;
            _3184 = _3248;
            _3186 = _3250;
            _3188 = _3252;
        }
    }
    _3214 = false;
    float _3254 = _3166;
    float _3256 = _3168;
    float _3258 = _3170;
    float _3260 = _3172;
    float _3262 = _3206;
    float _3264 = _3208;
    float _3266 = _3210;
    float _3268 = _3212;
    float _3270 = _3174;
    float _3272 = _3176;
    float _3274 = _3178;
    float _3276 = _3180;
    float _3278 = _3182;
    float _3280 = _3184;
    float _3282 = _3186;
    float _3284 = _3188;
    float _3286 = -_2473;
    float _3288 = _105 + _3286;
    float _3290 = -_2477;
    float _3292 = _103 + _3290;
    float _3294 = _2487 * _3288;
    float _3296 = -_2481;
    float _3298 = _107 + _3296;
    float _3300 = fma(_2491, _3292, _3294);
    float _3302 = fma(_2495, _3298, _3300);
    float _3304 = _2523 * _3302;
    float _3306 = rint(_3304);
    float _3308 = precise::max(0.0, _3306);
    float _3310 = precise::min(_3308, 3.0);
    float _3312 = trunc(_3310);
    int _3314 = int(_3312);
    bool _3316 = _3314 >= 2;
    bool _3318 = !_3316;
    float _3320 = _3306;
    float _3322 = as_type<float>(_3314);
    float _3324 = _3294;
    float _3326 = _3300;
    float _3328 = _3254;
    float _3330 = _3256;
    float _3332 = _3258;
    float _3334 = _3260;
    float _3336 = _3270;
    float _3338 = _3272;
    float _3340 = _3274;
    float _3342 = _3276;
    float _3344 = _3278;
    float _3346 = _3280;
    float _3348 = _3282;
    float _3350 = _3284;
    float _3368;
    float _3370;
    float _3372;
    float _3374;
    if (!_3318)
    {
        bool _3352 = _3314 >= 3;
        bool _3354 = !_3352;
        if (!_3354)
        {
            bool _3356 = _3314 != 3;
            _3358 = _3356;
            if (!_3358)
            {
                float _3360 = _103 + _3254;
                float _3362 = _105 + _3256;
                float _3364 = _107 + _3258;
                float _3366 = _3260 + 1.0;
                _3328 = _3360;
                _3330 = _3362;
                _3332 = _3364;
                _3334 = _3366;
                _3368 = _3262;
                _3370 = _3264;
                _3372 = _3266;
                _3374 = _3268;
                _3376 = true;
            }
        }
        else
        {
            float _3378 = _103 + _3270;
            float _3380 = _105 + _3272;
            float _3382 = _107 + _3274;
            float _3384 = _3276 + 1.0;
            _3368 = _3262;
            _3370 = _3264;
            _3372 = _3266;
            _3374 = _3268;
            _3336 = _3378;
            _3338 = _3380;
            _3340 = _3382;
            _3342 = _3384;
            _3376 = true;
        }
    }
    if ((!_3376) || _3358)
    {
        bool _3386;
        if (!_3358)
        {
            _3386 = _3314 >= 1;
        }
        if ((!_3386) || _3358)
        {
            if (!_3358)
            {
                bool _3388 = _3314 != 0;
                if (!_3388)
                {
                    float _3390 = _103 + _3262;
                    _3320 = _3390;
                }
                float _3392 = _3320;
                _3368 = _3392;
                if (!_3388)
                {
                    float _3394 = _105 + _3264;
                    _3322 = _3394;
                }
                float _3396 = _3322;
                _3370 = _3396;
                if (!_3388)
                {
                    float _3398 = _107 + _3266;
                    _3324 = _3398;
                }
                float _3400 = _3324;
                _3372 = _3400;
                if (!_3388)
                {
                    float _3402 = _3268 + 1.0;
                    _3326 = _3402;
                }
                float _3404 = _3326;
                bool _3406 = !_3388;
                _3374 = _3404;
                _3376 = _3406;
            }
            if ((!_3376) || _3358)
            {
                _3358 = false;
                _3368 = _3262;
                _3370 = _3264;
                _3372 = _3266;
                _3374 = _3268;
                _3376 = true;
            }
        }
        else
        {
            float _3408 = _103 + _3278;
            float _3410 = _105 + _3280;
            float _3412 = _107 + _3282;
            float _3414 = _3284 + 1.0;
            _3368 = _3262;
            _3370 = _3264;
            _3372 = _3266;
            _3374 = _3268;
            _3344 = _3408;
            _3346 = _3410;
            _3348 = _3412;
            _3350 = _3414;
        }
    }
    _3376 = false;
    float _3416 = _3328;
    float _3418 = _3330;
    float _3420 = _3332;
    float _3422 = _3334;
    float _3424 = _3368;
    float _3426 = _3370;
    float _3428 = _3372;
    float _3430 = _3374;
    float _3432 = _3336;
    float _3434 = _3338;
    float _3436 = _3340;
    float _3438 = _3342;
    float _3440 = _3344;
    float _3442 = _3346;
    float _3444 = _3348;
    float _3446 = _3350;
    float _3448 = -_2473;
    float _3450 = _113 + _3448;
    float _3452 = -_2477;
    float _3454 = _111 + _3452;
    float _3456 = _2487 * _3450;
    float _3458 = -_2481;
    float _3460 = _115 + _3458;
    float _3462 = fma(_2491, _3454, _3456);
    float _3464 = fma(_2495, _3460, _3462);
    float _3466 = _2523 * _3464;
    float _3468 = rint(_3466);
    float _3470 = precise::max(0.0, _3468);
    float _3472 = precise::min(_3470, 3.0);
    float _3474 = trunc(_3472);
    int _3476 = int(_3474);
    bool _3478 = _3476 >= 2;
    bool _3480 = !_3478;
    float _3482 = _3468;
    float _3484 = as_type<float>(_3476);
    float _3486 = _3456;
    float _3488 = _3462;
    float _3490 = _3416;
    float _3492 = _3418;
    float _3494 = _3420;
    float _3496 = _3422;
    float _3498 = _3432;
    float _3500 = _3434;
    float _3502 = _3436;
    float _3504 = _3438;
    float _3506 = _3440;
    float _3508 = _3442;
    float _3510 = _3444;
    float _3512 = _3446;
    float _3530;
    float _3532;
    float _3534;
    float _3536;
    if (!_3480)
    {
        bool _3514 = _3476 >= 3;
        bool _3516 = !_3514;
        if (!_3516)
        {
            bool _3518 = _3476 != 3;
            _3520 = _3518;
            if (!_3520)
            {
                float _3522 = _111 + _3416;
                float _3524 = _113 + _3418;
                float _3526 = _115 + _3420;
                float _3528 = _3422 + 1.0;
                _3490 = _3522;
                _3492 = _3524;
                _3494 = _3526;
                _3496 = _3528;
                _3530 = _3424;
                _3532 = _3426;
                _3534 = _3428;
                _3536 = _3430;
                _3538 = true;
            }
        }
        else
        {
            float _3540 = _111 + _3432;
            float _3542 = _113 + _3434;
            float _3544 = _115 + _3436;
            float _3546 = _3438 + 1.0;
            _3530 = _3424;
            _3532 = _3426;
            _3534 = _3428;
            _3536 = _3430;
            _3498 = _3540;
            _3500 = _3542;
            _3502 = _3544;
            _3504 = _3546;
            _3538 = true;
        }
    }
    if ((!_3538) || _3520)
    {
        bool _3548;
        if (!_3520)
        {
            _3548 = _3476 >= 1;
        }
        if ((!_3548) || _3520)
        {
            if (!_3520)
            {
                bool _3550 = _3476 != 0;
                if (!_3550)
                {
                    float _3552 = _111 + _3424;
                    _3482 = _3552;
                }
                float _3554 = _3482;
                _3530 = _3554;
                if (!_3550)
                {
                    float _3556 = _113 + _3426;
                    _3484 = _3556;
                }
                float _3558 = _3484;
                _3532 = _3558;
                if (!_3550)
                {
                    float _3560 = _115 + _3428;
                    _3486 = _3560;
                }
                float _3562 = _3486;
                _3534 = _3562;
                if (!_3550)
                {
                    float _3564 = _3430 + 1.0;
                    _3488 = _3564;
                }
                float _3566 = _3488;
                bool _3568 = !_3550;
                _3536 = _3566;
                _3538 = _3568;
            }
            if ((!_3538) || _3520)
            {
                _3520 = false;
                _3530 = _3424;
                _3532 = _3426;
                _3534 = _3428;
                _3536 = _3430;
                _3538 = true;
            }
        }
        else
        {
            float _3570 = _111 + _3440;
            float _3572 = _113 + _3442;
            float _3574 = _115 + _3444;
            float _3576 = _3446 + 1.0;
            _3530 = _3424;
            _3532 = _3426;
            _3534 = _3428;
            _3536 = _3430;
            _3506 = _3570;
            _3508 = _3572;
            _3510 = _3574;
            _3512 = _3576;
        }
    }
    _3538 = false;
    float _3578 = _3490;
    float _3580 = _3492;
    float _3582 = _3494;
    float _3584 = _3496;
    float _3586 = _3530;
    float _3588 = _3532;
    float _3590 = _3534;
    float _3592 = _3536;
    float _3594 = _3498;
    float _3596 = _3500;
    float _3598 = _3502;
    float _3600 = _3504;
    float _3602 = _3506;
    float _3604 = _3508;
    float _3606 = _3510;
    float _3608 = _3512;
    float _3610 = -_2473;
    float _3612 = _121 + _3610;
    float _3614 = -_2477;
    float _3616 = _119 + _3614;
    float _3618 = _2487 * _3612;
    float _3620 = -_2481;
    float _3622 = _123 + _3620;
    float _3624 = fma(_2491, _3616, _3618);
    float _3626 = fma(_2495, _3622, _3624);
    float _3628 = _2523 * _3626;
    float _3630 = rint(_3628);
    float _3632 = precise::max(0.0, _3630);
    float _3634 = precise::min(_3632, 3.0);
    float _3636 = trunc(_3634);
    int _3638 = int(_3636);
    bool _3640 = _3638 >= 2;
    bool _3642 = !_3640;
    float _3644 = _3630;
    float _3646 = as_type<float>(_3638);
    float _3648 = _3618;
    float _3650 = _3624;
    float _3652 = _3578;
    float _3654 = _3580;
    float _3656 = _3582;
    float _3658 = _3584;
    float _3660 = _3594;
    float _3662 = _3596;
    float _3664 = _3598;
    float _3666 = _3600;
    float _3668 = _3602;
    float _3670 = _3604;
    float _3672 = _3606;
    float _3674 = _3608;
    float _3692;
    float _3694;
    float _3696;
    float _3698;
    if (!_3642)
    {
        bool _3676 = _3638 >= 3;
        bool _3678 = !_3676;
        if (!_3678)
        {
            bool _3680 = _3638 != 3;
            _3682 = _3680;
            if (!_3682)
            {
                float _3684 = _119 + _3578;
                float _3686 = _121 + _3580;
                float _3688 = _123 + _3582;
                float _3690 = _3584 + 1.0;
                _3652 = _3684;
                _3654 = _3686;
                _3656 = _3688;
                _3658 = _3690;
                _3692 = _3586;
                _3694 = _3588;
                _3696 = _3590;
                _3698 = _3592;
                _3700 = true;
            }
        }
        else
        {
            float _3702 = _119 + _3594;
            float _3704 = _121 + _3596;
            float _3706 = _123 + _3598;
            float _3708 = _3600 + 1.0;
            _3692 = _3586;
            _3694 = _3588;
            _3696 = _3590;
            _3698 = _3592;
            _3660 = _3702;
            _3662 = _3704;
            _3664 = _3706;
            _3666 = _3708;
            _3700 = true;
        }
    }
    if ((!_3700) || _3682)
    {
        bool _3710;
        if (!_3682)
        {
            _3710 = _3638 >= 1;
        }
        if ((!_3710) || _3682)
        {
            if (!_3682)
            {
                bool _3712 = _3638 != 0;
                if (!_3712)
                {
                    float _3714 = _119 + _3586;
                    _3644 = _3714;
                }
                float _3716 = _3644;
                _3692 = _3716;
                if (!_3712)
                {
                    float _3718 = _121 + _3588;
                    _3646 = _3718;
                }
                float _3720 = _3646;
                _3694 = _3720;
                if (!_3712)
                {
                    float _3722 = _123 + _3590;
                    _3648 = _3722;
                }
                float _3724 = _3648;
                _3696 = _3724;
                if (!_3712)
                {
                    float _3726 = _3592 + 1.0;
                    _3650 = _3726;
                }
                float _3728 = _3650;
                bool _3730 = !_3712;
                _3698 = _3728;
                _3700 = _3730;
            }
            if ((!_3700) || _3682)
            {
                _3682 = false;
                _3692 = _3586;
                _3694 = _3588;
                _3696 = _3590;
                _3698 = _3592;
                _3700 = true;
            }
        }
        else
        {
            float _3732 = _119 + _3602;
            float _3734 = _121 + _3604;
            float _3736 = _123 + _3606;
            float _3738 = _3608 + 1.0;
            _3692 = _3586;
            _3694 = _3588;
            _3696 = _3590;
            _3698 = _3592;
            _3668 = _3732;
            _3670 = _3734;
            _3672 = _3736;
            _3674 = _3738;
        }
    }
    _3700 = false;
    float _3740 = _3652;
    float _3742 = _3654;
    float _3744 = _3656;
    float _3746 = _3658;
    float _3748 = _3692;
    float _3750 = _3694;
    float _3752 = _3696;
    float _3754 = _3698;
    float _3756 = _3660;
    float _3758 = _3662;
    float _3760 = _3664;
    float _3762 = _3666;
    float _3764 = _3668;
    float _3766 = _3670;
    float _3768 = _3672;
    float _3770 = _3674;
    float _3772 = -_2473;
    float _3774 = _129 + _3772;
    float _3776 = -_2477;
    float _3778 = _127 + _3776;
    float _3780 = _2487 * _3774;
    float _3782 = -_2481;
    float _3784 = _131 + _3782;
    float _3786 = fma(_2491, _3778, _3780);
    float _3788 = fma(_2495, _3784, _3786);
    float _3790 = _2523 * _3788;
    float _3792 = rint(_3790);
    float _3794 = precise::max(0.0, _3792);
    float _3796 = precise::min(_3794, 3.0);
    float _3798 = trunc(_3796);
    int _3800 = int(_3798);
    bool _3802 = _3800 >= 2;
    bool _3804 = !_3802;
    float _3806 = _3792;
    float _3808 = as_type<float>(_3800);
    float _3810 = _3780;
    float _3812 = _3786;
    float _3814 = _3740;
    float _3816 = _3742;
    float _3818 = _3744;
    float _3820 = _3746;
    float _3822 = _3756;
    float _3824 = _3758;
    float _3826 = _3760;
    float _3828 = _3762;
    float _3830 = _3764;
    float _3832 = _3766;
    float _3834 = _3768;
    float _3836 = _3770;
    float _3854;
    float _3856;
    float _3858;
    float _3860;
    if (!_3804)
    {
        bool _3838 = _3800 >= 3;
        bool _3840 = !_3838;
        if (!_3840)
        {
            bool _3842 = _3800 != 3;
            _3844 = _3842;
            if (!_3844)
            {
                float _3846 = _127 + _3740;
                float _3848 = _129 + _3742;
                float _3850 = _131 + _3744;
                float _3852 = _3746 + 1.0;
                _3814 = _3846;
                _3816 = _3848;
                _3818 = _3850;
                _3820 = _3852;
                _3854 = _3748;
                _3856 = _3750;
                _3858 = _3752;
                _3860 = _3754;
                _3862 = true;
            }
        }
        else
        {
            float _3864 = _127 + _3756;
            float _3866 = _129 + _3758;
            float _3868 = _131 + _3760;
            float _3870 = _3762 + 1.0;
            _3854 = _3748;
            _3856 = _3750;
            _3858 = _3752;
            _3860 = _3754;
            _3822 = _3864;
            _3824 = _3866;
            _3826 = _3868;
            _3828 = _3870;
            _3862 = true;
        }
    }
    if ((!_3862) || _3844)
    {
        bool _3872;
        if (!_3844)
        {
            _3872 = _3800 >= 1;
        }
        if ((!_3872) || _3844)
        {
            if (!_3844)
            {
                bool _3874 = _3800 != 0;
                if (!_3874)
                {
                    float _3876 = _127 + _3748;
                    _3806 = _3876;
                }
                float _3878 = _3806;
                _3854 = _3878;
                if (!_3874)
                {
                    float _3880 = _129 + _3750;
                    _3808 = _3880;
                }
                float _3882 = _3808;
                _3856 = _3882;
                if (!_3874)
                {
                    float _3884 = _131 + _3752;
                    _3810 = _3884;
                }
                float _3886 = _3810;
                _3858 = _3886;
                if (!_3874)
                {
                    float _3888 = _3754 + 1.0;
                    _3812 = _3888;
                }
                float _3890 = _3812;
                bool _3892 = !_3874;
                _3860 = _3890;
                _3862 = _3892;
            }
            if ((!_3862) || _3844)
            {
                _3844 = false;
                _3854 = _3748;
                _3856 = _3750;
                _3858 = _3752;
                _3860 = _3754;
                _3862 = true;
            }
        }
        else
        {
            float _3894 = _127 + _3764;
            float _3896 = _129 + _3766;
            float _3898 = _131 + _3768;
            float _3900 = _3770 + 1.0;
            _3854 = _3748;
            _3856 = _3750;
            _3858 = _3752;
            _3860 = _3754;
            _3830 = _3894;
            _3832 = _3896;
            _3834 = _3898;
            _3836 = _3900;
        }
    }
    _3862 = false;
    float _3902 = _3814;
    float _3904 = _3816;
    float _3906 = _3818;
    float _3908 = _3820;
    float _3910 = _3854;
    float _3912 = _3856;
    float _3914 = _3858;
    float _3916 = _3860;
    float _3918 = _3822;
    float _3920 = _3824;
    float _3922 = _3826;
    float _3924 = _3828;
    float _3926 = _3830;
    float _3928 = _3832;
    float _3930 = _3834;
    float _3932 = _3836;
    float _3934 = -_2473;
    float _3936 = _137 + _3934;
    float _3938 = -_2477;
    float _3940 = _135 + _3938;
    float _3942 = _2487 * _3936;
    float _3944 = -_2481;
    float _3946 = _139 + _3944;
    float _3948 = fma(_2491, _3940, _3942);
    float _3950 = fma(_2495, _3946, _3948);
    float _3952 = _2523 * _3950;
    float _3954 = rint(_3952);
    float _3956 = precise::max(0.0, _3954);
    float _3958 = precise::min(_3956, 3.0);
    float _3960 = trunc(_3958);
    int _3962 = int(_3960);
    bool _3964 = _3962 >= 2;
    bool _3966 = !_3964;
    float _3968 = _3954;
    float _3970 = as_type<float>(_3962);
    float _3972 = _3942;
    float _3974 = _3948;
    float _3976 = _3902;
    float _3978 = _3904;
    float _3980 = _3906;
    float _3982 = _3908;
    float _3984 = _3918;
    float _3986 = _3920;
    float _3988 = _3922;
    float _3990 = _3924;
    float _3992 = _3926;
    float _3994 = _3928;
    float _3996 = _3930;
    float _3998 = _3932;
    float _4016;
    float _4018;
    float _4020;
    float _4022;
    if (!_3966)
    {
        bool _4000 = _3962 >= 3;
        bool _4002 = !_4000;
        if (!_4002)
        {
            bool _4004 = _3962 != 3;
            _4006 = _4004;
            if (!_4006)
            {
                float _4008 = _135 + _3902;
                float _4010 = _137 + _3904;
                float _4012 = _139 + _3906;
                float _4014 = _3908 + 1.0;
                _3976 = _4008;
                _3978 = _4010;
                _3980 = _4012;
                _3982 = _4014;
                _4016 = _3910;
                _4018 = _3912;
                _4020 = _3914;
                _4022 = _3916;
                _4024 = true;
            }
        }
        else
        {
            float _4026 = _135 + _3918;
            float _4028 = _137 + _3920;
            float _4030 = _139 + _3922;
            float _4032 = _3924 + 1.0;
            _4016 = _3910;
            _4018 = _3912;
            _4020 = _3914;
            _4022 = _3916;
            _3984 = _4026;
            _3986 = _4028;
            _3988 = _4030;
            _3990 = _4032;
            _4024 = true;
        }
    }
    if ((!_4024) || _4006)
    {
        bool _4034;
        if (!_4006)
        {
            _4034 = _3962 >= 1;
        }
        if ((!_4034) || _4006)
        {
            if (!_4006)
            {
                bool _4036 = _3962 != 0;
                if (!_4036)
                {
                    float _4038 = _135 + _3910;
                    _3968 = _4038;
                }
                float _4040 = _3968;
                _4016 = _4040;
                if (!_4036)
                {
                    float _4042 = _137 + _3912;
                    _3970 = _4042;
                }
                float _4044 = _3970;
                _4018 = _4044;
                if (!_4036)
                {
                    float _4046 = _139 + _3914;
                    _3972 = _4046;
                }
                float _4048 = _3972;
                _4020 = _4048;
                if (!_4036)
                {
                    float _4050 = _3916 + 1.0;
                    _3974 = _4050;
                }
                float _4052 = _3974;
                bool _4054 = !_4036;
                _4022 = _4052;
                _4024 = _4054;
            }
            if ((!_4024) || _4006)
            {
                _4006 = false;
                _4016 = _3910;
                _4018 = _3912;
                _4020 = _3914;
                _4022 = _3916;
                _4024 = true;
            }
        }
        else
        {
            float _4056 = _135 + _3926;
            float _4058 = _137 + _3928;
            float _4060 = _139 + _3930;
            float _4062 = _3932 + 1.0;
            _4016 = _3910;
            _4018 = _3912;
            _4020 = _3914;
            _4022 = _3916;
            _3992 = _4056;
            _3994 = _4058;
            _3996 = _4060;
            _3998 = _4062;
        }
    }
    _4024 = false;
    float _4064 = _3976;
    float _4066 = _3978;
    float _4068 = _3980;
    float _4070 = _3982;
    float _4072 = _4016;
    float _4074 = _4018;
    float _4076 = _4020;
    float _4078 = _4022;
    float _4080 = _3984;
    float _4082 = _3986;
    float _4084 = _3988;
    float _4086 = _3990;
    float _4088 = _3992;
    float _4090 = _3994;
    float _4092 = _3996;
    float _4094 = _3998;
    float _4096 = -_2473;
    float _4098 = _145 + _4096;
    float _4100 = -_2477;
    float _4102 = _143 + _4100;
    float _4104 = _2487 * _4098;
    float _4106 = -_2481;
    float _4108 = _147 + _4106;
    float _4110 = fma(_2491, _4102, _4104);
    float _4112 = fma(_2495, _4108, _4110);
    float _4114 = _2523 * _4112;
    float _4116 = rint(_4114);
    float _4118 = precise::max(0.0, _4116);
    float _4120 = precise::min(_4118, 3.0);
    float _4122 = trunc(_4120);
    int _4124 = int(_4122);
    bool _4126 = _4124 >= 2;
    bool _4128 = !_4126;
    float _4130 = _4116;
    float _4132 = as_type<float>(_4124);
    float _4134 = _4104;
    float _4136 = _4110;
    float _4138 = _4064;
    float _4140 = _4066;
    float _4142 = _4068;
    float _4144 = _4070;
    float _4146 = _4080;
    float _4148 = _4082;
    float _4150 = _4084;
    float _4152 = _4086;
    float _4154 = _4088;
    float _4156 = _4090;
    float _4158 = _4092;
    float _4160 = _4094;
    float _4178;
    float _4180;
    float _4182;
    float _4184;
    if (!_4128)
    {
        bool _4162 = _4124 >= 3;
        bool _4164 = !_4162;
        if (!_4164)
        {
            bool _4166 = _4124 != 3;
            _4168 = _4166;
            if (!_4168)
            {
                float _4170 = _143 + _4064;
                float _4172 = _145 + _4066;
                float _4174 = _147 + _4068;
                float _4176 = _4070 + 1.0;
                _4138 = _4170;
                _4140 = _4172;
                _4142 = _4174;
                _4144 = _4176;
                _4178 = _4072;
                _4180 = _4074;
                _4182 = _4076;
                _4184 = _4078;
                _4186 = true;
            }
        }
        else
        {
            float _4188 = _143 + _4080;
            float _4190 = _145 + _4082;
            float _4192 = _147 + _4084;
            float _4194 = _4086 + 1.0;
            _4178 = _4072;
            _4180 = _4074;
            _4182 = _4076;
            _4184 = _4078;
            _4146 = _4188;
            _4148 = _4190;
            _4150 = _4192;
            _4152 = _4194;
            _4186 = true;
        }
    }
    if ((!_4186) || _4168)
    {
        bool _4196;
        if (!_4168)
        {
            _4196 = _4124 >= 1;
        }
        if ((!_4196) || _4168)
        {
            if (!_4168)
            {
                bool _4198 = _4124 != 0;
                if (!_4198)
                {
                    float _4200 = _143 + _4072;
                    _4130 = _4200;
                }
                float _4202 = _4130;
                _4178 = _4202;
                if (!_4198)
                {
                    float _4204 = _145 + _4074;
                    _4132 = _4204;
                }
                float _4206 = _4132;
                _4180 = _4206;
                if (!_4198)
                {
                    float _4208 = _147 + _4076;
                    _4134 = _4208;
                }
                float _4210 = _4134;
                _4182 = _4210;
                if (!_4198)
                {
                    float _4212 = _4078 + 1.0;
                    _4136 = _4212;
                }
                float _4214 = _4136;
                bool _4216 = !_4198;
                _4184 = _4214;
                _4186 = _4216;
            }
            if ((!_4186) || _4168)
            {
                _4168 = false;
                _4178 = _4072;
                _4180 = _4074;
                _4182 = _4076;
                _4184 = _4078;
                _4186 = true;
            }
        }
        else
        {
            float _4218 = _143 + _4088;
            float _4220 = _145 + _4090;
            float _4222 = _147 + _4092;
            float _4224 = _4094 + 1.0;
            _4178 = _4072;
            _4180 = _4074;
            _4182 = _4076;
            _4184 = _4078;
            _4154 = _4218;
            _4156 = _4220;
            _4158 = _4222;
            _4160 = _4224;
        }
    }
    _4186 = false;
    float _4226 = _4138;
    float _4228 = _4140;
    float _4230 = _4142;
    float _4232 = _4144;
    float _4234 = _4178;
    float _4236 = _4180;
    float _4238 = _4182;
    float _4240 = _4184;
    float _4242 = _4146;
    float _4244 = _4148;
    float _4246 = _4150;
    float _4248 = _4152;
    float _4250 = _4154;
    float _4252 = _4156;
    float _4254 = _4158;
    float _4256 = _4160;
    float _4258 = -_2473;
    float _4260 = _153 + _4258;
    float _4262 = -_2477;
    float _4264 = _151 + _4262;
    float _4266 = _2487 * _4260;
    float _4268 = -_2481;
    float _4270 = _155 + _4268;
    float _4272 = fma(_2491, _4264, _4266);
    float _4274 = fma(_2495, _4270, _4272);
    float _4276 = _2523 * _4274;
    float _4278 = rint(_4276);
    float _4280 = precise::max(0.0, _4278);
    float _4282 = precise::min(_4280, 3.0);
    float _4284 = trunc(_4282);
    int _4286 = int(_4284);
    bool _4288 = _4286 >= 2;
    bool _4290 = !_4288;
    float _4292 = _4278;
    float _4294 = as_type<float>(_4286);
    float _4296 = _4266;
    float _4298 = _4272;
    float _4300 = _4226;
    float _4302 = _4228;
    float _4304 = _4230;
    float _4306 = _4232;
    float _4308 = _4242;
    float _4310 = _4244;
    float _4312 = _4246;
    float _4314 = _4248;
    float _4316 = _4250;
    float _4318 = _4252;
    float _4320 = _4254;
    float _4322 = _4256;
    float _4340;
    float _4342;
    float _4344;
    float _4346;
    if (!_4290)
    {
        bool _4324 = _4286 >= 3;
        bool _4326 = !_4324;
        if (!_4326)
        {
            bool _4328 = _4286 != 3;
            _4330 = _4328;
            if (!_4330)
            {
                float _4332 = _151 + _4226;
                float _4334 = _153 + _4228;
                float _4336 = _155 + _4230;
                float _4338 = _4232 + 1.0;
                _4300 = _4332;
                _4302 = _4334;
                _4304 = _4336;
                _4306 = _4338;
                _4340 = _4234;
                _4342 = _4236;
                _4344 = _4238;
                _4346 = _4240;
                _4348 = true;
            }
        }
        else
        {
            float _4350 = _151 + _4242;
            float _4352 = _153 + _4244;
            float _4354 = _155 + _4246;
            float _4356 = _4248 + 1.0;
            _4340 = _4234;
            _4342 = _4236;
            _4344 = _4238;
            _4346 = _4240;
            _4308 = _4350;
            _4310 = _4352;
            _4312 = _4354;
            _4314 = _4356;
            _4348 = true;
        }
    }
    if ((!_4348) || _4330)
    {
        bool _4358;
        if (!_4330)
        {
            _4358 = _4286 >= 1;
        }
        if ((!_4358) || _4330)
        {
            if (!_4330)
            {
                bool _4360 = _4286 != 0;
                if (!_4360)
                {
                    float _4362 = _151 + _4234;
                    _4292 = _4362;
                }
                float _4364 = _4292;
                _4340 = _4364;
                if (!_4360)
                {
                    float _4366 = _153 + _4236;
                    _4294 = _4366;
                }
                float _4368 = _4294;
                _4342 = _4368;
                if (!_4360)
                {
                    float _4370 = _155 + _4238;
                    _4296 = _4370;
                }
                float _4372 = _4296;
                _4344 = _4372;
                if (!_4360)
                {
                    float _4374 = _4240 + 1.0;
                    _4298 = _4374;
                }
                float _4376 = _4298;
                bool _4378 = !_4360;
                _4346 = _4376;
                _4348 = _4378;
            }
            if ((!_4348) || _4330)
            {
                _4330 = false;
                _4340 = _4234;
                _4342 = _4236;
                _4344 = _4238;
                _4346 = _4240;
                _4348 = true;
            }
        }
        else
        {
            float _4380 = _151 + _4250;
            float _4382 = _153 + _4252;
            float _4384 = _155 + _4254;
            float _4386 = _4256 + 1.0;
            _4340 = _4234;
            _4342 = _4236;
            _4344 = _4238;
            _4346 = _4240;
            _4316 = _4380;
            _4318 = _4382;
            _4320 = _4384;
            _4322 = _4386;
        }
    }
    _4348 = false;
    float _4388 = _4300;
    float _4390 = _4302;
    float _4392 = _4304;
    float _4394 = _4306;
    float _4396 = _4340;
    float _4398 = _4342;
    float _4400 = _4344;
    float _4402 = _4346;
    float _4404 = _4308;
    float _4406 = _4310;
    float _4408 = _4312;
    float _4410 = _4314;
    float _4412 = _4316;
    float _4414 = _4318;
    float _4416 = _4320;
    float _4418 = _4322;
    float _4420 = -_2473;
    float _4422 = _161 + _4420;
    float _4424 = -_2477;
    float _4426 = _159 + _4424;
    float _4428 = _2487 * _4422;
    float _4430 = -_2481;
    float _4432 = _163 + _4430;
    float _4434 = fma(_2491, _4426, _4428);
    float _4436 = fma(_2495, _4432, _4434);
    float _4438 = _2523 * _4436;
    float _4440 = rint(_4438);
    float _4442 = precise::max(0.0, _4440);
    float _4444 = precise::min(_4442, 3.0);
    float _4446 = trunc(_4444);
    int _4448 = int(_4446);
    bool _4450 = _4448 >= 2;
    bool _4452 = !_4450;
    float _4454 = _4440;
    float _4456 = as_type<float>(_4448);
    float _4458 = _4428;
    float _4460 = _4434;
    float _4462 = _4388;
    float _4464 = _4390;
    float _4466 = _4392;
    float _4468 = _4394;
    float _4470 = _4404;
    float _4472 = _4406;
    float _4474 = _4408;
    float _4476 = _4410;
    float _4478 = _4412;
    float _4480 = _4414;
    float _4482 = _4416;
    float _4484 = _4418;
    float _4502;
    float _4504;
    float _4506;
    float _4508;
    if (!_4452)
    {
        bool _4486 = _4448 >= 3;
        bool _4488 = !_4486;
        if (!_4488)
        {
            bool _4490 = _4448 != 3;
            _4492 = _4490;
            if (!_4492)
            {
                float _4494 = _159 + _4388;
                float _4496 = _161 + _4390;
                float _4498 = _163 + _4392;
                float _4500 = _4394 + 1.0;
                _4462 = _4494;
                _4464 = _4496;
                _4466 = _4498;
                _4468 = _4500;
                _4502 = _4396;
                _4504 = _4398;
                _4506 = _4400;
                _4508 = _4402;
                _4510 = true;
            }
        }
        else
        {
            float _4512 = _159 + _4404;
            float _4514 = _161 + _4406;
            float _4516 = _163 + _4408;
            float _4518 = _4410 + 1.0;
            _4502 = _4396;
            _4504 = _4398;
            _4506 = _4400;
            _4508 = _4402;
            _4470 = _4512;
            _4472 = _4514;
            _4474 = _4516;
            _4476 = _4518;
            _4510 = true;
        }
    }
    if ((!_4510) || _4492)
    {
        bool _4520;
        if (!_4492)
        {
            _4520 = _4448 >= 1;
        }
        if ((!_4520) || _4492)
        {
            if (!_4492)
            {
                bool _4522 = _4448 != 0;
                if (!_4522)
                {
                    float _4524 = _159 + _4396;
                    _4454 = _4524;
                }
                float _4526 = _4454;
                _4502 = _4526;
                if (!_4522)
                {
                    float _4528 = _161 + _4398;
                    _4456 = _4528;
                }
                float _4530 = _4456;
                _4504 = _4530;
                if (!_4522)
                {
                    float _4532 = _163 + _4400;
                    _4458 = _4532;
                }
                float _4534 = _4458;
                _4506 = _4534;
                if (!_4522)
                {
                    float _4536 = _4402 + 1.0;
                    _4460 = _4536;
                }
                float _4538 = _4460;
                bool _4540 = !_4522;
                _4508 = _4538;
                _4510 = _4540;
            }
            if ((!_4510) || _4492)
            {
                _4492 = false;
                _4502 = _4396;
                _4504 = _4398;
                _4506 = _4400;
                _4508 = _4402;
                _4510 = true;
            }
        }
        else
        {
            float _4542 = _159 + _4412;
            float _4544 = _161 + _4414;
            float _4546 = _163 + _4416;
            float _4548 = _4418 + 1.0;
            _4502 = _4396;
            _4504 = _4398;
            _4506 = _4400;
            _4508 = _4402;
            _4478 = _4542;
            _4480 = _4544;
            _4482 = _4546;
            _4484 = _4548;
        }
    }
    _4510 = false;
    float _4550 = _4462;
    float _4552 = _4464;
    float _4554 = _4466;
    float _4556 = _4468;
    float _4558 = _4502;
    float _4560 = _4504;
    float _4562 = _4506;
    float _4564 = _4508;
    float _4566 = _4470;
    float _4568 = _4472;
    float _4570 = _4474;
    float _4572 = _4476;
    float _4574 = _4478;
    float _4576 = _4480;
    float _4578 = _4482;
    float _4580 = _4484;
    float _4582 = -_2473;
    float _4584 = _169 + _4582;
    float _4586 = -_2477;
    float _4588 = _167 + _4586;
    float _4590 = _2487 * _4584;
    float _4592 = -_2481;
    float _4594 = _171 + _4592;
    float _4596 = fma(_2491, _4588, _4590);
    float _4598 = fma(_2495, _4594, _4596);
    float _4600 = _2523 * _4598;
    float _4602 = rint(_4600);
    float _4604 = precise::max(0.0, _4602);
    float _4606 = precise::min(_4604, 3.0);
    float _4608 = trunc(_4606);
    int _4610 = int(_4608);
    bool _4612 = _4610 >= 2;
    bool _4614 = !_4612;
    float _4616 = _4602;
    float _4618 = as_type<float>(_4610);
    float _4620 = _4590;
    float _4622 = _4596;
    float _4624 = _4550;
    float _4626 = _4552;
    float _4628 = _4554;
    float _4630 = _4556;
    float _4632 = _4566;
    float _4634 = _4568;
    float _4636 = _4570;
    float _4638 = _4572;
    float _4640 = _4574;
    float _4642 = _4576;
    float _4644 = _4578;
    float _4646 = _4580;
    float _4664;
    float _4666;
    float _4668;
    float _4670;
    if (!_4614)
    {
        bool _4648 = _4610 >= 3;
        bool _4650 = !_4648;
        if (!_4650)
        {
            bool _4652 = _4610 != 3;
            _4654 = _4652;
            if (!_4654)
            {
                float _4656 = _167 + _4550;
                float _4658 = _169 + _4552;
                float _4660 = _171 + _4554;
                float _4662 = _4556 + 1.0;
                _4624 = _4656;
                _4626 = _4658;
                _4628 = _4660;
                _4630 = _4662;
                _4664 = _4558;
                _4666 = _4560;
                _4668 = _4562;
                _4670 = _4564;
                _4672 = true;
            }
        }
        else
        {
            float _4674 = _167 + _4566;
            float _4676 = _169 + _4568;
            float _4678 = _171 + _4570;
            float _4680 = _4572 + 1.0;
            _4664 = _4558;
            _4666 = _4560;
            _4668 = _4562;
            _4670 = _4564;
            _4632 = _4674;
            _4634 = _4676;
            _4636 = _4678;
            _4638 = _4680;
            _4672 = true;
        }
    }
    if ((!_4672) || _4654)
    {
        bool _4682;
        if (!_4654)
        {
            _4682 = _4610 >= 1;
        }
        if ((!_4682) || _4654)
        {
            if (!_4654)
            {
                bool _4684 = _4610 != 0;
                if (!_4684)
                {
                    float _4686 = _167 + _4558;
                    _4616 = _4686;
                }
                float _4688 = _4616;
                _4664 = _4688;
                if (!_4684)
                {
                    float _4690 = _169 + _4560;
                    _4618 = _4690;
                }
                float _4692 = _4618;
                _4666 = _4692;
                if (!_4684)
                {
                    float _4694 = _171 + _4562;
                    _4620 = _4694;
                }
                float _4696 = _4620;
                _4668 = _4696;
                if (!_4684)
                {
                    float _4698 = _4564 + 1.0;
                    _4622 = _4698;
                }
                float _4700 = _4622;
                bool _4702 = !_4684;
                _4670 = _4700;
                _4672 = _4702;
            }
            if ((!_4672) || _4654)
            {
                _4654 = false;
                _4664 = _4558;
                _4666 = _4560;
                _4668 = _4562;
                _4670 = _4564;
                _4672 = true;
            }
        }
        else
        {
            float _4704 = _167 + _4574;
            float _4706 = _169 + _4576;
            float _4708 = _171 + _4578;
            float _4710 = _4580 + 1.0;
            _4664 = _4558;
            _4666 = _4560;
            _4668 = _4562;
            _4670 = _4564;
            _4640 = _4704;
            _4642 = _4706;
            _4644 = _4708;
            _4646 = _4710;
        }
    }
    _4672 = false;
    float _4712 = _4624;
    float _4714 = _4626;
    float _4716 = _4628;
    float _4718 = _4630;
    float _4720 = _4664;
    float _4722 = _4666;
    float _4724 = _4668;
    float _4726 = _4670;
    float _4728 = _4632;
    float _4730 = _4634;
    float _4732 = _4636;
    float _4734 = _4638;
    float _4736 = _4640;
    float _4738 = _4642;
    float _4740 = _4644;
    float _4742 = _4646;
    float _4744 = -_2473;
    float _4746 = _177 + _4744;
    float _4748 = -_2477;
    float _4750 = _175 + _4748;
    float _4752 = _2487 * _4746;
    float _4754 = -_2481;
    float _4756 = _179 + _4754;
    float _4758 = fma(_2491, _4750, _4752);
    float _4760 = fma(_2495, _4756, _4758);
    float _4762 = _2523 * _4760;
    float _4764 = rint(_4762);
    float _4766 = precise::max(0.0, _4764);
    float _4768 = precise::min(_4766, 3.0);
    float _4770 = trunc(_4768);
    int _4772 = int(_4770);
    bool _4774 = _4772 >= 2;
    bool _4776 = !_4774;
    float _4778 = _4764;
    float _4780 = as_type<float>(_4772);
    float _4782 = _4752;
    float _4784 = _4758;
    float _4786 = _4712;
    float _4788 = _4714;
    float _4790 = _4716;
    float _4792 = _4718;
    float _4794 = _4728;
    float _4796 = _4730;
    float _4798 = _4732;
    float _4800 = _4734;
    float _4802 = _4736;
    float _4804 = _4738;
    float _4806 = _4740;
    float _4808 = _4742;
    float _4826;
    float _4828;
    float _4830;
    float _4832;
    if (!_4776)
    {
        bool _4810 = _4772 >= 3;
        bool _4812 = !_4810;
        if (!_4812)
        {
            bool _4814 = _4772 != 3;
            _4816 = _4814;
            if (!_4816)
            {
                float _4818 = _175 + _4712;
                float _4820 = _177 + _4714;
                float _4822 = _179 + _4716;
                float _4824 = _4718 + 1.0;
                _4786 = _4818;
                _4788 = _4820;
                _4790 = _4822;
                _4792 = _4824;
                _4826 = _4720;
                _4828 = _4722;
                _4830 = _4724;
                _4832 = _4726;
                _4834 = true;
            }
        }
        else
        {
            float _4836 = _175 + _4728;
            float _4838 = _177 + _4730;
            float _4840 = _179 + _4732;
            float _4842 = _4734 + 1.0;
            _4826 = _4720;
            _4828 = _4722;
            _4830 = _4724;
            _4832 = _4726;
            _4794 = _4836;
            _4796 = _4838;
            _4798 = _4840;
            _4800 = _4842;
            _4834 = true;
        }
    }
    if ((!_4834) || _4816)
    {
        bool _4844;
        if (!_4816)
        {
            _4844 = _4772 >= 1;
        }
        if ((!_4844) || _4816)
        {
            if (!_4816)
            {
                bool _4846 = _4772 != 0;
                if (!_4846)
                {
                    float _4848 = _175 + _4720;
                    _4778 = _4848;
                }
                float _4850 = _4778;
                _4826 = _4850;
                if (!_4846)
                {
                    float _4852 = _177 + _4722;
                    _4780 = _4852;
                }
                float _4854 = _4780;
                _4828 = _4854;
                if (!_4846)
                {
                    float _4856 = _179 + _4724;
                    _4782 = _4856;
                }
                float _4858 = _4782;
                _4830 = _4858;
                if (!_4846)
                {
                    float _4860 = _4726 + 1.0;
                    _4784 = _4860;
                }
                float _4862 = _4784;
                bool _4864 = !_4846;
                _4832 = _4862;
                _4834 = _4864;
            }
            if ((!_4834) || _4816)
            {
                _4816 = false;
                _4826 = _4720;
                _4828 = _4722;
                _4830 = _4724;
                _4832 = _4726;
                _4834 = true;
            }
        }
        else
        {
            float _4866 = _175 + _4736;
            float _4868 = _177 + _4738;
            float _4870 = _179 + _4740;
            float _4872 = _4742 + 1.0;
            _4826 = _4720;
            _4828 = _4722;
            _4830 = _4724;
            _4832 = _4726;
            _4802 = _4866;
            _4804 = _4868;
            _4806 = _4870;
            _4808 = _4872;
        }
    }
    _4834 = false;
    float _4874 = _4786;
    float _4876 = _4788;
    float _4878 = _4790;
    float _4880 = _4792;
    float _4882 = _4826;
    float _4884 = _4828;
    float _4886 = _4830;
    float _4888 = _4832;
    float _4890 = _4794;
    float _4892 = _4796;
    float _4894 = _4798;
    float _4896 = _4800;
    float _4898 = _4802;
    float _4900 = _4804;
    float _4902 = _4806;
    float _4904 = _4808;
    float _4906 = -_2473;
    float _4908 = _185 + _4906;
    float _4910 = -_2477;
    float _4912 = _183 + _4910;
    float _4914 = _2487 * _4908;
    float _4916 = -_2481;
    float _4918 = _187 + _4916;
    float _4920 = fma(_2491, _4912, _4914);
    float _4922 = fma(_2495, _4918, _4920);
    float _4924 = _2523 * _4922;
    float _4926 = rint(_4924);
    float _4928 = precise::max(0.0, _4926);
    float _4930 = precise::min(_4928, 3.0);
    float _4932 = trunc(_4930);
    int _4934 = int(_4932);
    bool _4936 = _4934 >= 2;
    bool _4938 = !_4936;
    float _4940 = as_type<float>(_4934);
    float _4942 = _4926;
    float _4944 = _4918;
    float _4946 = _4914;
    float _4948 = _4904;
    float _4950 = _4896;
    float _4952 = _4890;
    float _4954 = _4880;
    float _4956 = _4898;
    float _4958 = _4900;
    float _4960 = _4902;
    float _4962 = _4894;
    float _4964 = _4892;
    float _4966 = _4876;
    float _4968 = _4874;
    float _4970 = _4878;
    float _4988;
    float _4990;
    float _4992;
    float _4994;
    if (!_4938)
    {
        bool _4972 = _4934 >= 3;
        bool _4974 = !_4972;
        if (!_4974)
        {
            bool _4976 = _4934 != 3;
            _4978 = _4976;
            if (!_4978)
            {
                float _4980 = _183 + _4874;
                float _4982 = _185 + _4876;
                float _4984 = _187 + _4878;
                float _4986 = _4880 + 1.0;
                _4988 = _4888;
                _4954 = _4986;
                _4990 = _4882;
                _4992 = _4884;
                _4994 = _4886;
                _4966 = _4982;
                _4968 = _4980;
                _4970 = _4984;
                _4996 = true;
            }
        }
        else
        {
            float _4998 = _183 + _4890;
            float _5000 = _185 + _4892;
            float _5002 = _187 + _4894;
            float _5004 = _4896 + 1.0;
            _4950 = _5004;
            _4952 = _4998;
            _4988 = _4888;
            _4990 = _4882;
            _4962 = _5002;
            _4992 = _4884;
            _4964 = _5000;
            _4994 = _4886;
            _4996 = true;
        }
    }
    if ((!_4996) || _4978)
    {
        bool _5006;
        if (!_4978)
        {
            _5006 = _4934 >= 1;
        }
        if ((!_5006) || _4978)
        {
            if (!_4978)
            {
                bool _5008 = _4934 != 0;
                if (!_5008)
                {
                    float _5010 = _183 + _4882;
                    _4940 = _5010;
                }
                float _5012 = _4940;
                _4990 = _5012;
                if (!_5008)
                {
                    float _5014 = _185 + _4884;
                    _4942 = _5014;
                }
                float _5016 = _4942;
                _4992 = _5016;
                if (!_5008)
                {
                    float _5018 = _187 + _4886;
                    _4944 = _5018;
                }
                float _5020 = _4944;
                _4994 = _5020;
                if (!_5008)
                {
                    float _5022 = _4888 + 1.0;
                    _4946 = _5022;
                }
                float _5024 = _4946;
                bool _5026 = !_5008;
                _4988 = _5024;
                _4996 = _5026;
            }
            if ((!_4996) || _4978)
            {
                _4978 = false;
                _4988 = _4888;
                _4990 = _4882;
                _4992 = _4884;
                _4994 = _4886;
                _4996 = true;
            }
        }
        else
        {
            float _5028 = _183 + _4898;
            float _5030 = _185 + _4900;
            float _5032 = _187 + _4902;
            float _5034 = _4904 + 1.0;
            _4948 = _5034;
            _4988 = _4888;
            _4956 = _5028;
            _4958 = _5030;
            _4990 = _4882;
            _4960 = _5032;
            _4992 = _4884;
            _4994 = _4886;
        }
    }
    _4996 = false;
    float _5036 = _4948;
    float _5038 = _4950;
    float _5040 = _4952;
    float _5042 = _4988;
    float _5044 = _4954;
    float _5046 = _4956;
    float _5048 = _4958;
    float _5050 = _4990;
    float _5052 = _4960;
    float _5054 = _4962;
    float _5056 = _4992;
    float _5058 = _4964;
    float _5060 = _4994;
    float _5062 = _4966;
    float _5064 = _4968;
    float _5066 = _4970;
    float _5068 = _5036 * 4.0;
    float _5070 = fma(_5038, 4.0, _5036);
    float _5072 = _5038 + _5036;
    float _5074 = _5040 * 6.0;
    float _5076 = fma(_5042, 9.0, _5068);
    float _5078 = fma(_5044, 9.0, _5070);
    float _5080 = _5046 * 6.0;
    float _5082 = _5072 * 2.0;
    float _5084 = _5076 + _5038;
    float _5086 = _5048 * 6.0;
    float _5088 = fma(_5050, 9.0, _5080);
    float _5090 = _5052 * 6.0;
    float _5092 = _5084 * _5078;
    float _5094 = _5054 * 6.0;
    float _5096 = fma(_5046, 3.0, _5074);
    float _5098 = fma(_5056, 9.0, _5086);
    float _5100 = -_5092;
    float _5102 = fma(_5082, _5082, _5100);
    float _5104 = _5058 * 6.0;
    float _5106 = fma(_5060, 9.0, _5090);
    float _5108 = fma(_5052, 3.0, _5094);
    bool _5110 = _5102 != 0.0;
    bool _5112 = isnan(_5102);
    bool _5114 = _5110 || _5112;
    bool _5116 = isnan(0.0);
    bool _5118 = _5114 || _5116;
    float _5120 = fma(_5048, 3.0, _5104);
    float _5122 = fma(_5040, 3.0, _5088);
    float _5124 = fma(_5058, 3.0, _5098);
    float _5126 = fma(_5054, 3.0, _5106);
    float _5128 = fma(_5062, 9.0, _5120);
    float _5130 = fma(_5064, 9.0, _5096);
    float _5132 = fma(_5066, 9.0, _5108);
    bool _5134 = !_5118;
    if (!_5134)
    {
        float _5136 = 1.0 / _5102;
        float _5138 = _5122 * _5078;
        float _5140 = _5084 * _5130;
        float _5142 = _5084 * _5132;
        float _5144 = -_5138;
        float _5146 = fma(_5130, _5082, _5144);
        float _5148 = -_5140;
        float _5150 = fma(_5122, _5082, _5148);
        float _5152 = _5124 * _5078;
        float _5154 = _5084 * _5128;
        float _5156 = _5126 * _5078;
        float _5158 = -_5142;
        float _5160 = fma(_5126, _5082, _5158);
        float _5162 = -_5152;
        float _5164 = fma(_5128, _5082, _5162);
        float _5166 = -_5154;
        float _5168 = fma(_5124, _5082, _5166);
        float _5170 = -_5156;
        float _5172 = fma(_5132, _5082, _5170);
        float _5174 = _5150 * _5136;
        float _5176 = _5168 * _5136;
        float _5178 = _5160 * _5136;
        float _5180 = _5146 * _5136;
        float _5182 = _5164 * _5136;
        float _5184 = _5172 * _5136;
        float _5186 = -_5180;
        float _5188 = _5174 + _5186;
        float _5190 = -_5182;
        float _5192 = _5176 + _5190;
        float _5194 = -_5184;
        float _5196 = _5178 + _5194;
        _2542 = _5188;
        _2544 = _5192;
        _2546 = _5196;
        _2548 = _5180;
        _2550 = _5174;
        _2552 = _5182;
        _2554 = _5176;
        _2556 = _5178;
        _2558 = _5184;
    }
    float _5198 = _2542;
    float _5200 = _2544;
    float _5202 = _2546;
    float _5204 = _2548;
    float _5206 = _2550;
    float _5208 = _2552;
    float _5210 = _2554;
    float _5212 = _2556;
    float _5214 = _2558;
    float _5216 = fma(_5198, 496.0, 0.5);
    float _5218 = precise::clamp(_5216, 0.0, 1.0);
    float _5220 = fma(_5198, -31.0, 1.0);
    float _5222 = precise::clamp(_5220, 0.0, 1.0);
    float _5224 = _5218 + (-0.5);
    float _5226 = fma(_5200, 1008.0, 0.5);
    float _5228 = precise::clamp(_5226, 0.0, 1.0);
    float _5230 = fma(_5200, -63.0, 1.0);
    float _5232 = precise::clamp(_5230, 0.0, 1.0);
    float _5234 = fma(_5202, 496.0, 0.5);
    float _5236 = precise::clamp(_5234, 0.0, 1.0);
    float _5238 = _5222 * _5224;
    float _5240 = _5228 + (-0.5);
    float _5242 = fma(_5202, -31.0, 1.0);
    float _5244 = precise::clamp(_5242, 0.0, 1.0);
    float _5246 = fma(_5238, -0.0322580635547637939453125, _5204);
    float _5248 = precise::clamp(_5246, 0.0, 1.0);
    float _5250 = _5232 * _5240;
    float _5252 = _5250 * 2.0;
    float _5254 = fma(_5238, 0.0322580635547637939453125, _5206);
    float _5256 = precise::clamp(_5254, 0.0, 1.0);
    float _5258 = _5248 * 31.0;
    float _5260 = fma(_5252, -0.01587301678955554962158203125, _5208);
    float _5262 = precise::clamp(_5260, 0.0, 1.0);
    float _5264 = fma(_5252, 0.01587301678955554962158203125, _5210);
    float _5266 = precise::clamp(_5264, 0.0, 1.0);
    float _5268 = _5256 * 31.0;
    float _5270 = rint(_5258);
    float _5272 = _5262 * 63.0;
    float _5274 = _5236 + (-0.5);
    float _5276 = _5266 * 63.0;
    float _5278 = _5244 * _5274;
    float _5280 = rint(_5268);
    float _5282 = fma(_5278, 0.0322580635547637939453125, _5212);
    float _5284 = precise::clamp(_5282, 0.0, 1.0);
    float _5286 = fma(_5278, -0.0322580635547637939453125, _5214);
    float _5288 = precise::clamp(_5286, 0.0, 1.0);
    float _5290 = _5284 * 31.0;
    float _5292 = _5288 * 31.0;
    float _5294 = rint(_5276);
    float _5296 = rint(_5272);
    float _5298 = _5280 + 0.5;
    float _5300 = _5270 + 0.5;
    float _5302 = rint(_5290);
    float _5304 = _5294 + 0.5;
    float _5306 = rint(_5292);
    float _5308 = _5296 + 0.5;
    float _5310 = _5302 + 0.5;
    float _5312 = trunc(_5298);
    float _5314 = precise::max(_5312, 0.0);
    uint _5317 = uint(_5314);
    float _5319 = _5306 + 0.5;
    float _5321 = trunc(_5304);
    float _5323 = precise::max(_5321, 0.0);
    uint _5325 = uint(_5323);
    float _5327 = trunc(_5300);
    float _5329 = precise::max(_5327, 0.0);
    uint _5331 = uint(_5329);
    int _5333 = int(_5317) << 11;
    float _5335 = trunc(_5308);
    float _5337 = precise::max(_5335, 0.0);
    uint _5339 = uint(_5337);
    int _5341 = int(_5325) << 5;
    float _5343 = trunc(_5310);
    float _5345 = precise::max(_5343, 0.0);
    uint _5347 = uint(_5345);
    int _5349 = int(_5331) << 11;
    float _5351 = trunc(_5319);
    float _5353 = precise::max(_5351, 0.0);
    uint _5355 = uint(_5353);
    int _5357 = int(_5339) << 5;
    int _5359 = _5333 | _5341;
    int _5361 = int(_5347) | _5359;
    int _5363 = _5349 | _5357;
    int _5365 = int(_5355) | _5363;
    bool _5367 = _5361 != _5365;
    int _5369 = _5341;
    int _5371 = _5357;
    int _5373 = int(_5331);
    if (!_5367)
    {
        _5369 = _5361;
    }
    int _5375 = _5369;
    if (!_5367)
    {
        _5371 = 0;
        _5373 = 0;
    }
    int _5377 = _5371;
    int _5379 = _5373;
    if (!_5367)
    {
        out.m_32.x = as_type<float>(_5375);
        out.m_32.y = as_type<float>(_5361);
        out.m_32.z = as_type<float>(_5377);
        out.m_32.w = as_type<float>(_5379);
        return main0_out_u{as_type<uint4>(out.m_32)};
    }
    float _5381 = _5280 * 0.0322580635547637939453125;
    float _5383 = _5270 * 0.0322580635547637939453125;
    float _5385 = _5294 * 0.01587301678955554962158203125;
    bool _5387 = uint(_5361) >= uint(_5365);
    float _5389 = _5296 * 0.01587301678955554962158203125;
    float _5391 = _5302 * 0.0322580635547637939453125;
    float _5393 = _5306 * 0.0322580635547637939453125;
    bool _5395 = !_5387;
    float _5397 = _5395 ? _5381 : _5383;
    bool _5399 = !_5387;
    float _5401 = _5399 ? _5383 : _5381;
    bool _5403 = !_5387;
    float _5405 = _5403 ? _5385 : _5389;
    float _5407 = -_5397;
    float _5409 = _119 + _5407;
    bool _5411 = !_5387;
    float _5413 = _5411 ? _5389 : _5385;
    float _5415 = -_5397;
    float _5417 = _5415 + _5401;
    bool _5419 = !_5387;
    float _5421 = _5419 ? _5391 : _5393;
    float _5423 = -_5405;
    float _5425 = _121 + _5423;
    bool _5427 = !_5387;
    float _5429 = _5427 ? _5393 : _5391;
    float _5431 = -_5405;
    float _5433 = _5431 + _5413;
    float _5435 = -_5405;
    float _5437 = _185 + _5435;
    float _5439 = -_5421;
    float _5441 = _123 + _5439;
    float _5443 = -_5397;
    float _5445 = _183 + _5443;
    float _5447 = _5433 * _5433;
    float _5449 = -_5421;
    float _5451 = _5449 + _5429;
    float _5453 = -_5405;
    float _5455 = _113 + _5453;
    float _5457 = -_5405;
    float _5459 = _105 + _5457;
    float _5461 = fma(_5417, _5417, _5447);
    float _5463 = -_5405;
    float _5465 = _97 + _5463;
    float _5467 = -_5405;
    float _5469 = _89 + _5467;
    float _5471 = -_5405;
    float _5473 = _81 + _5471;
    float _5475 = fma(_5451, _5451, _5461);
    float _5477 = -_5405;
    float _5479 = _65 + _5477;
    float _5481 = -_5405;
    float _5483 = _73 + _5481;
    float _5485 = -_5405;
    float _5487 = _177 + _5485;
    float _5489 = -_5405;
    float _5491 = _169 + _5489;
    float _5493 = -_5405;
    float _5495 = _161 + _5493;
    float _5497 = 1.0 / _5475;
    float _5499 = -_5405;
    float _5501 = _153 + _5499;
    float _5503 = -_5405;
    float _5505 = _145 + _5503;
    float _5507 = -_5405;
    float _5509 = _137 + _5507;
    float _5511 = -_5405;
    float _5513 = _129 + _5511;
    float _5515 = -_5421;
    float _5517 = _187 + _5515;
    float _5519 = -_5397;
    float _5521 = _111 + _5519;
    float _5523 = -_5397;
    float _5525 = _103 + _5523;
    float _5527 = -_5397;
    float _5529 = _95 + _5527;
    float _5531 = -_5397;
    float _5533 = _87 + _5531;
    float _5535 = -_5397;
    float _5537 = _79 + _5535;
    float _5539 = -_5397;
    float _5541 = _63 + _5539;
    float _5543 = -_5397;
    float _5545 = _71 + _5543;
    float _5547 = -_5397;
    float _5549 = _175 + _5547;
    float _5551 = -_5397;
    float _5553 = _167 + _5551;
    float _5555 = -_5397;
    float _5557 = _159 + _5555;
    float _5559 = _5433 * _5497;
    float _5561 = _5417 * _5497;
    float _5563 = _5451 * _5497;
    float _5565 = -_5397;
    float _5567 = _151 + _5565;
    float _5569 = _5559 * _5425;
    float _5571 = _5559 * _5437;
    float _5573 = _5559 * _5455;
    float _5575 = -_5397;
    float _5577 = _143 + _5575;
    float _5579 = fma(_5561, _5409, _5569);
    float _5581 = fma(_5561, _5445, _5571);
    float _5583 = -_5397;
    float _5585 = _135 + _5583;
    float _5587 = -_5397;
    float _5589 = _127 + _5587;
    float _5591 = fma(_5563, _5441, _5579);
    float _5593 = _5559 * _5459;
    float _5595 = _5559 * _5465;
    float _5597 = _5559 * _5469;
    float _5599 = _5559 * _5473;
    float _5601 = _5559 * _5479;
    float _5603 = _5559 * _5483;
    float _5605 = _5559 * _5487;
    float _5607 = _5559 * _5491;
    float _5609 = _5559 * _5495;
    float _5611 = _5559 * _5501;
    float _5613 = _5559 * _5505;
    float _5615 = _5559 * _5509;
    float _5617 = _5559 * _5513;
    float _5619 = fma(_5563, _5517, _5581);
    bool _5621 = _5591 >= 0.5;
    float _5623 = -_5421;
    float _5625 = _115 + _5623;
    float _5627 = fma(_5561, _5521, _5573);
    float _5629 = -_5421;
    float _5631 = _107 + _5629;
    float _5633 = -_5421;
    float _5635 = _99 + _5633;
    float _5637 = -_5421;
    float _5639 = _91 + _5637;
    float _5641 = -_5421;
    float _5643 = _83 + _5641;
    float _5645 = -_5421;
    float _5647 = _67 + _5645;
    float _5649 = -_5421;
    float _5651 = _75 + _5649;
    float _5653 = -_5421;
    float _5655 = _179 + _5653;
    float _5657 = -_5421;
    float _5659 = _171 + _5657;
    float _5661 = -_5421;
    float _5663 = _163 + _5661;
    float _5665 = -_5421;
    float _5667 = _155 + _5665;
    float _5669 = -_5421;
    float _5671 = _147 + _5669;
    float _5673 = -_5421;
    float _5675 = _139 + _5673;
    float _5677 = -_5421;
    float _5679 = _131 + _5677;
    float _5681 = fma(_5561, _5525, _5593);
    float _5683 = fma(_5561, _5529, _5595);
    float _5685 = fma(_5561, _5533, _5597);
    float _5687 = fma(_5561, _5537, _5599);
    float _5689 = fma(_5561, _5541, _5601);
    float _5691 = fma(_5561, _5545, _5603);
    float _5693 = fma(_5561, _5549, _5605);
    float _5695 = fma(_5561, _5553, _5607);
    float _5697 = fma(_5561, _5557, _5609);
    float _5699 = fma(_5561, _5567, _5611);
    float _5701 = fma(_5561, _5577, _5613);
    float _5703 = fma(_5561, _5585, _5615);
    float _5705 = fma(_5561, _5589, _5617);
    float _5707 = fma(_5563, _5625, _5627);
    bool _5709 = _5619 >= 0.5;
    float _5711 = fma(_5563, _5631, _5681);
    bool _5713 = _5591 >= 0.833000004291534423828125;
    float _5715 = fma(_5563, _5635, _5683);
    float _5717 = fma(_5563, _5639, _5685);
    float _5719 = fma(_5563, _5643, _5687);
    float _5721 = fma(_5563, _5647, _5689);
    float _5723 = fma(_5563, _5651, _5691);
    float _5725 = fma(_5563, _5655, _5693);
    float _5727 = fma(_5563, _5659, _5695);
    float _5729 = fma(_5563, _5663, _5697);
    float _5731 = fma(_5563, _5667, _5699);
    float _5733 = fma(_5563, _5671, _5701);
    float _5735 = fma(_5563, _5675, _5703);
    float _5737 = fma(_5563, _5679, _5705);
    bool _5739 = _5591 >= 0.16599999368190765380859375;
    int _5741 = _5713 ? 0 : 32768;
    bool _5743 = _5619 >= 0.833000004291534423828125;
    bool _5745 = _5707 >= 0.5;
    int _5747 = _5741;
    if (!_5621)
    {
        int _5749 = _5739 ? 49152 : 16384;
        _5747 = _5749;
    }
    int _5751 = _5747;
    bool _5753 = _5619 >= 0.16599999368190765380859375;
    int _5755 = _5743 ? 0 : 32768;
    bool _5757 = _5725 >= 0.5;
    bool _5759 = _5707 >= 0.833000004291534423828125;
    int _5761 = _5755;
    if (!_5709)
    {
        int _5763 = _5753 ? 49152 : 16384;
        _5761 = _5763;
    }
    int _5765 = _5761;
    bool _5767 = _5707 >= 0.16599999368190765380859375;
    bool _5769 = _5725 >= 0.833000004291534423828125;
    int _5771 = _5759 ? 0 : 8192;
    bool _5773 = _5711 >= 0.5;
    bool _5775 = _5725 >= 0.16599999368190765380859375;
    int _5777 = _5769 ? 0 : 8192;
    int _5779 = _5771;
    int _5781 = _5777;
    if (!_5745)
    {
        int _5783 = _5767 ? 12288 : 4096;
        _5779 = _5783;
    }
    int _5785 = _5779;
    bool _5787 = _5711 >= 0.833000004291534423828125;
    bool _5789 = _5727 >= 0.5;
    if (!_5757)
    {
        int _5791 = _5775 ? 12288 : 4096;
        _5781 = _5791;
    }
    int _5793 = _5781;
    int _5795 = _5787 ? 0 : 2048;
    bool _5797 = _5711 >= 0.16599999368190765380859375;
    bool _5799 = _5727 >= 0.833000004291534423828125;
    bool _5801 = _5715 >= 0.5;
    bool _5803 = _5727 >= 0.16599999368190765380859375;
    int _5805 = _5799 ? 0 : 2048;
    int _5807 = _5795;
    int _5809 = _5805;
    if (!_5773)
    {
        int _5811 = _5797 ? 3072 : 1024;
        _5807 = _5811;
    }
    int _5813 = _5807;
    bool _5815 = _5715 >= 0.833000004291534423828125;
    bool _5817 = _5729 >= 0.5;
    if (!_5789)
    {
        int _5819 = _5803 ? 3072 : 1024;
        _5809 = _5819;
    }
    int _5821 = _5809;
    bool _5823 = _5715 >= 0.16599999368190765380859375;
    int _5825 = _5815 ? 0 : 512;
    bool _5827 = _5717 >= 0.5;
    bool _5829 = _5729 >= 0.833000004291534423828125;
    int _5831 = _5825;
    if (!_5801)
    {
        int _5833 = _5823 ? 768 : 256;
        _5831 = _5833;
    }
    int _5835 = _5831;
    bool _5837 = _5729 >= 0.16599999368190765380859375;
    bool _5839 = _5731 >= 0.5;
    int _5841 = _5829 ? 0 : 512;
    bool _5843 = _5717 >= 0.833000004291534423828125;
    int _5845 = _5841;
    if (!_5817)
    {
        int _5847 = _5837 ? 768 : 256;
        _5845 = _5847;
    }
    int _5849 = _5845;
    bool _5851 = _5717 >= 0.16599999368190765380859375;
    bool _5853 = _5731 >= 0.833000004291534423828125;
    int _5855 = _5843 ? 0 : 128;
    bool _5857 = _5731 >= 0.16599999368190765380859375;
    bool _5859 = _5719 >= 0.5;
    int _5861 = _5853 ? 0 : 128;
    int _5863 = _5855;
    int _5865 = _5861;
    if (!_5827)
    {
        int _5867 = _5851 ? 192 : 64;
        _5863 = _5867;
    }
    int _5869 = _5863;
    bool _5871 = _5719 >= 0.833000004291534423828125;
    bool _5873 = _5733 >= 0.5;
    if (!_5839)
    {
        int _5875 = _5857 ? 192 : 64;
        _5865 = _5875;
    }
    int _5877 = _5865;
    int _5879 = _5871 ? 0 : 32;
    bool _5881 = _5721 >= 0.5;
    bool _5883 = _5719 >= 0.16599999368190765380859375;
    bool _5885 = _5733 >= 0.833000004291534423828125;
    bool _5887 = _5733 >= 0.16599999368190765380859375;
    int _5889 = _5885 ? 0 : 32;
    int _5891 = _5879;
    int _5893 = _5889;
    if (!_5859)
    {
        int _5895 = _5883 ? 48 : 16;
        _5891 = _5895;
    }
    int _5897 = _5891;
    bool _5899 = _5721 >= 0.833000004291534423828125;
    bool _5901 = _5735 >= 0.5;
    if (!_5873)
    {
        int _5903 = _5887 ? 48 : 16;
        _5893 = _5903;
    }
    int _5905 = _5893;
    bool _5907 = _5721 >= 0.16599999368190765380859375;
    bool _5909 = _5735 >= 0.833000004291534423828125;
    int _5911 = _5899 ? 0 : 8;
    int _5913 = _5909 ? 0 : 8;
    int _5915 = _5911;
    int _5917 = _5913;
    if (!_5881)
    {
        int _5919 = _5907 ? 12 : 4;
        _5915 = _5919;
    }
    int _5921 = _5915;
    bool _5923 = _5723 >= 0.5;
    bool _5925 = _5737 >= 0.5;
    bool _5927 = _5735 >= 0.16599999368190765380859375;
    int _5929 = _5813 + _5751;
    int _5931 = _5929 + _5785;
    int _5933 = _5821 + _5765;
    int _5935 = _5933 + _5793;
    if (!_5901)
    {
        int _5937 = _5927 ? 12 : 4;
        _5917 = _5937;
    }
    int _5939 = _5917;
    bool _5941 = _5723 >= 0.833000004291534423828125;
    bool _5943 = _5737 >= 0.833000004291534423828125;
    bool _5945 = _5723 >= 0.16599999368190765380859375;
    bool _5947 = _5737 >= 0.16599999368190765380859375;
    int _5949 = _5869 + _5931;
    int _5951 = _5949 + _5835;
    int _5953 = _5877 + _5935;
    int _5955 = _5953 + _5849;
    int _5957 = _5941 ? 0 : 2;
    int _5959 = _5943 ? 0 : 2;
    int _5961 = _5957;
    int _5963 = _5959;
    if (!_5923)
    {
        int _5965 = _5945 ? 3 : 1;
        _5961 = _5965;
    }
    int _5967 = _5961;
    if (!_5925)
    {
        int _5969 = _5947 ? 3 : 1;
        _5963 = _5969;
    }
    int _5971 = _5963;
    int _5973 = _5921 + _5951;
    int _5975 = _5973 + _5897;
    int _5977 = _5939 + _5955;
    int _5979 = _5977 + _5905;
    bool _5981 = !_5387;
    int _5983 = _5981 ? _5365 : _5361;
    bool _5985 = !_5387;
    int _5987 = _5985 ? _5361 : _5365;
    int _5989 = _5975 + _5967;
    int _5991 = _5979 + _5971;
    out.m_32.x = as_type<float>(_5983);
    out.m_32.y = as_type<float>(_5987);
    out.m_32.z = as_type<float>(_5989);
    out.m_32.w = as_type<float>(_5991);
    return main0_out_u{as_type<uint4>(out.m_32)};
}

