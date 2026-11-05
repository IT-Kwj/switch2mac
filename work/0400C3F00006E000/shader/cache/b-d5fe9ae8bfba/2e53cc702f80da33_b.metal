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
    texture3d<float> fp_t_tcb_8 [[id(1)]];
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
    bool _5004 = false;
    bool _4986 = false;
    bool _4842 = false;
    bool _4824 = false;
    bool _4680 = false;
    bool _4662 = false;
    bool _4518 = false;
    bool _4500 = false;
    bool _4356 = false;
    bool _4338 = false;
    bool _4194 = false;
    bool _4176 = false;
    bool _4032 = false;
    bool _4014 = false;
    bool _3870 = false;
    bool _3852 = false;
    bool _3708 = false;
    bool _3690 = false;
    bool _3546 = false;
    bool _3528 = false;
    bool _3384 = false;
    bool _3366 = false;
    bool _3222 = false;
    bool _3204 = false;
    bool _3060 = false;
    bool _3042 = false;
    bool _2898 = false;
    bool _2880 = false;
    bool _2736 = false;
    bool _2718 = false;
    bool _2608 = false;
    bool _2574 = false;
    float _39 = gl_FragCoord.w;
    float _41 = in.m_29.x;
    float _43 = gl_FragCoord.w;
    float _45 = _41 * _43;
    float _47 = in.m_29.y;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = in.m_29.z;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = 1.0 / _39;
    float _61 = _59 * _45;
    float _63 = _59 * _51;
    float _65 = _59 * _57;
    float3 _6063 = float3(_61, _63, _65);
    float3 _69 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6063, float3(0.0), isnan(_6063)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6063, float3(0.0), isnan(_6063)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyz;
    float _71 = _69.x;
    float _73 = _69.y;
    float _75 = _69.z;
    float3 _6084 = float3(_61, _63, _65);
    float3 _77 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6084, float3(0.0), isnan(_6084)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(1, 0, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6084, float3(0.0), isnan(_6084)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(1, 0, 0)).xyz;
    float _79 = _77.x;
    float _81 = _77.y;
    float _83 = _77.z;
    float3 _6103 = float3(_61, _63, _65);
    float3 _85 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6103, float3(0.0), isnan(_6103)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(2, 0, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6103, float3(0.0), isnan(_6103)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(2, 0, 0)).xyz;
    float _87 = _85.x;
    float _89 = _85.y;
    float _91 = _85.z;
    float3 _6121 = float3(_61, _63, _65);
    float3 _93 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6121, float3(0.0), isnan(_6121)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(3, 0, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6121, float3(0.0), isnan(_6121)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(3, 0, 0)).xyz;
    float _95 = _93.x;
    float _97 = _93.y;
    float _99 = _93.z;
    float3 _6139 = float3(_61, _63, _65);
    float3 _101 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6139, float3(0.0), isnan(_6139)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(0, 1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6139, float3(0.0), isnan(_6139)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(0, 1, 0)).xyz;
    float _103 = _101.x;
    float _105 = _101.y;
    float _107 = _101.z;
    float3 _6157 = float3(_61, _63, _65);
    float3 _109 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6157, float3(0.0), isnan(_6157)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(1, 1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6157, float3(0.0), isnan(_6157)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(1, 1, 0)).xyz;
    float _111 = _109.x;
    float _113 = _109.y;
    float _115 = _109.z;
    float3 _6175 = float3(_61, _63, _65);
    float3 _117 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6175, float3(0.0), isnan(_6175)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(2, 1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6175, float3(0.0), isnan(_6175)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(2, 1, 0)).xyz;
    float _119 = _117.x;
    float _121 = _117.y;
    float _123 = _117.z;
    float3 _6193 = float3(_61, _63, _65);
    float3 _125 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6193, float3(0.0), isnan(_6193)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(3, 1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6193, float3(0.0), isnan(_6193)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(3, 1, 0)).xyz;
    float _127 = _125.x;
    float _129 = _125.y;
    float _131 = _125.z;
    float3 _6211 = float3(_61, _63, _65);
    float3 _133 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6211, float3(0.0), isnan(_6211)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(0, 2, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6211, float3(0.0), isnan(_6211)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(0, 2, 0)).xyz;
    float _135 = _133.x;
    float _137 = _133.y;
    float _139 = _133.z;
    float3 _6229 = float3(_61, _63, _65);
    float3 _141 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6229, float3(0.0), isnan(_6229)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(1, 2, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6229, float3(0.0), isnan(_6229)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(1, 2, 0)).xyz;
    float _143 = _141.x;
    float _145 = _141.y;
    float _147 = _141.z;
    float3 _6247 = float3(_61, _63, _65);
    float3 _149 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6247, float3(0.0), isnan(_6247)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(2, 2, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6247, float3(0.0), isnan(_6247)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(2, 2, 0)).xyz;
    float _151 = _149.x;
    float _153 = _149.y;
    float _155 = _149.z;
    float3 _6265 = float3(_61, _63, _65);
    float3 _157 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6265, float3(0.0), isnan(_6265)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(3, 2, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6265, float3(0.0), isnan(_6265)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(3, 2, 0)).xyz;
    float _159 = _157.x;
    float _161 = _157.y;
    float _163 = _157.z;
    float3 _6283 = float3(_61, _63, _65);
    float3 _165 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6283, float3(0.0), isnan(_6283)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(0, 3, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6283, float3(0.0), isnan(_6283)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(0, 3, 0)).xyz;
    float _167 = _165.x;
    float _169 = _165.y;
    float _171 = _165.z;
    float3 _6301 = float3(_61, _63, _65);
    float3 _173 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6301, float3(0.0), isnan(_6301)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(1, 3, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6301, float3(0.0), isnan(_6301)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(1, 3, 0)).xyz;
    float _175 = _173.x;
    float _177 = _173.y;
    float _179 = _173.z;
    float3 _6319 = float3(_61, _63, _65);
    float3 _181 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6319, float3(0.0), isnan(_6319)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(2, 3, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6319, float3(0.0), isnan(_6319)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(2, 3, 0)).xyz;
    float _183 = _181.x;
    float _185 = _181.y;
    float _187 = _181.z;
    float3 _6337 = float3(_61, _63, _65);
    float3 _189 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6337, float3(0.0), isnan(_6337)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(3, 3, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6337, float3(0.0), isnan(_6337)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(3, 3, 0)).xyz;
    float _191 = _189.x;
    float _193 = _189.y;
    float _195 = _189.z;
    float _197 = _73 + _81;
    float _199 = _71 + _79;
    float _201 = _75 + _83;
    float _203 = _89 + _197;
    float _205 = _87 + _199;
    float _207 = _91 + _201;
    float _209 = _97 + _203;
    float _211 = _95 + _205;
    float _213 = _99 + _207;
    float _215 = _105 + _209;
    float _217 = _103 + _211;
    float _219 = _107 + _213;
    float _221 = _113 + _215;
    float _223 = _111 + _217;
    float _225 = _115 + _219;
    float _227 = _121 + _221;
    float _229 = _119 + _223;
    float _231 = _123 + _225;
    float _233 = _129 + _227;
    float _235 = _127 + _229;
    float _237 = _131 + _231;
    float _239 = _137 + _233;
    float _241 = _135 + _235;
    float _243 = _139 + _237;
    float _245 = _145 + _239;
    float _247 = _143 + _241;
    float _249 = _147 + _243;
    float _251 = _153 + _245;
    float _253 = _151 + _247;
    float _255 = _155 + _249;
    float _257 = _161 + _251;
    float _259 = _159 + _253;
    float _261 = _163 + _255;
    float _263 = _169 + _257;
    float _265 = _167 + _259;
    float _267 = _171 + _261;
    float _269 = _177 + _263;
    float _271 = _175 + _265;
    float _273 = _179 + _267;
    float _275 = _185 + _269;
    float _277 = _183 + _271;
    float _279 = _187 + _273;
    float _281 = _193 + _275;
    float _283 = _191 + _277;
    float _285 = _195 + _279;
    float _287 = fma(_281, -0.0625, _81);
    float _289 = fma(_283, -0.0625, _79);
    float _291 = fma(_285, -0.0625, _83);
    float _293 = fma(_281, -0.0625, _73);
    float _295 = fma(_283, -0.0625, _71);
    float _297 = _289 * _287;
    float _299 = _289 * _289;
    float _301 = fma(_285, -0.0625, _75);
    float _303 = _287 * _287;
    float _305 = _287 * _291;
    float _307 = _289 * _291;
    float _309 = fma(_295, _293, _297);
    float _311 = fma(_293, _293, _303);
    float _313 = fma(_293, _301, _305);
    float _315 = fma(_295, _295, _299);
    float _317 = fma(_295, _301, _307);
    float _319 = _291 * _291;
    float _321 = fma(_281, -0.0625, _89);
    float _323 = fma(_283, -0.0625, _87);
    float _325 = fma(_285, -0.0625, _91);
    float _327 = fma(_301, _301, _319);
    float _329 = fma(_321, _321, _311);
    float _331 = fma(_323, _321, _309);
    float _333 = fma(_321, _325, _313);
    float _335 = fma(_323, _323, _315);
    float _337 = fma(_323, _325, _317);
    float _339 = fma(_281, -0.0625, _97);
    float _341 = fma(_283, -0.0625, _95);
    float _343 = fma(_285, -0.0625, _99);
    float _345 = fma(_325, _325, _327);
    float _347 = fma(_339, _339, _329);
    float _349 = fma(_341, _339, _331);
    float _351 = fma(_339, _343, _333);
    float _353 = fma(_341, _341, _335);
    float _355 = fma(_341, _343, _337);
    float _357 = fma(_281, -0.0625, _105);
    float _359 = fma(_283, -0.0625, _103);
    float _361 = fma(_285, -0.0625, _107);
    float _363 = fma(_343, _343, _345);
    float _365 = fma(_357, _357, _347);
    float _367 = fma(_359, _357, _349);
    float _369 = fma(_357, _361, _351);
    float _371 = fma(_359, _359, _353);
    float _373 = fma(_359, _361, _355);
    float _375 = fma(_281, -0.0625, _113);
    float _377 = fma(_283, -0.0625, _111);
    float _379 = fma(_285, -0.0625, _115);
    float _381 = fma(_361, _361, _363);
    float _383 = fma(_375, _375, _365);
    float _385 = fma(_377, _375, _367);
    float _387 = fma(_375, _379, _369);
    float _389 = fma(_377, _377, _371);
    float _391 = fma(_377, _379, _373);
    float _393 = fma(_281, -0.0625, _121);
    float _395 = fma(_283, -0.0625, _119);
    float _397 = fma(_285, -0.0625, _123);
    float _399 = fma(_379, _379, _381);
    float _401 = fma(_393, _393, _383);
    float _403 = fma(_395, _393, _385);
    float _405 = fma(_393, _397, _387);
    float _407 = fma(_395, _395, _389);
    float _409 = fma(_395, _397, _391);
    float _411 = fma(_281, -0.0625, _129);
    float _413 = fma(_283, -0.0625, _127);
    float _415 = fma(_285, -0.0625, _131);
    float _417 = fma(_397, _397, _399);
    float _419 = fma(_411, _411, _401);
    float _421 = fma(_413, _411, _403);
    float _423 = fma(_411, _415, _405);
    float _425 = fma(_413, _413, _407);
    float _427 = fma(_413, _415, _409);
    float _429 = fma(_281, -0.0625, _137);
    float _431 = fma(_283, -0.0625, _135);
    float _433 = fma(_285, -0.0625, _139);
    float _435 = fma(_415, _415, _417);
    float _437 = fma(_429, _429, _419);
    float _439 = fma(_431, _429, _421);
    float _441 = fma(_429, _433, _423);
    float _443 = fma(_431, _431, _425);
    float _445 = fma(_431, _433, _427);
    float _447 = fma(_281, -0.0625, _145);
    float _449 = fma(_283, -0.0625, _143);
    float _451 = fma(_285, -0.0625, _147);
    float _453 = fma(_433, _433, _435);
    float _455 = fma(_447, _447, _437);
    float _457 = fma(_449, _447, _439);
    float _459 = fma(_447, _451, _441);
    float _461 = fma(_449, _449, _443);
    float _463 = fma(_449, _451, _445);
    float _465 = fma(_281, -0.0625, _153);
    float _467 = fma(_283, -0.0625, _151);
    float _469 = fma(_285, -0.0625, _155);
    float _471 = fma(_451, _451, _453);
    float _473 = fma(_465, _465, _455);
    float _475 = fma(_467, _465, _457);
    float _477 = fma(_465, _469, _459);
    float _479 = fma(_467, _467, _461);
    float _481 = fma(_467, _469, _463);
    float _483 = fma(_281, -0.0625, _161);
    float _485 = fma(_283, -0.0625, _159);
    float _487 = fma(_285, -0.0625, _163);
    float _489 = fma(_469, _469, _471);
    float _491 = fma(_483, _483, _473);
    float _493 = fma(_485, _483, _475);
    float _495 = fma(_483, _487, _477);
    float _497 = fma(_485, _485, _479);
    float _499 = fma(_485, _487, _481);
    float _501 = fma(_281, -0.0625, _169);
    float _503 = fma(_283, -0.0625, _167);
    float _505 = fma(_285, -0.0625, _171);
    float _507 = fma(_487, _487, _489);
    float _509 = fma(_501, _501, _491);
    float _511 = fma(_503, _501, _493);
    float _513 = fma(_501, _505, _495);
    float _515 = fma(_503, _503, _497);
    float _517 = fma(_503, _505, _499);
    float _519 = fma(_281, -0.0625, _177);
    float _521 = fma(_283, -0.0625, _175);
    float _523 = fma(_285, -0.0625, _179);
    float _525 = fma(_505, _505, _507);
    float _527 = fma(_519, _519, _509);
    float _529 = fma(_521, _519, _511);
    float _531 = fma(_519, _523, _513);
    float _533 = fma(_521, _521, _515);
    float _535 = fma(_521, _523, _517);
    float _537 = fma(_281, -0.0625, _185);
    float _539 = fma(_283, -0.0625, _183);
    float _541 = fma(_285, -0.0625, _187);
    float _543 = fma(_281, -0.0625, _193);
    float _545 = fma(_537, _537, _527);
    float _547 = fma(_539, _537, _529);
    float _549 = fma(_283, -0.0625, _191);
    float _551 = fma(_537, _541, _531);
    float _553 = fma(_285, -0.0625, _195);
    float _555 = fma(_539, _539, _533);
    float _557 = fma(_543, _543, _545);
    float _559 = fma(_549, _543, _547);
    float _561 = fma(_523, _523, _525);
    float _563 = fma(_539, _541, _535);
    float _565 = fma(_543, _553, _551);
    float _567 = fma(_549, _549, _555);
    float _569 = _557 + _559;
    float _571 = fma(_541, _541, _561);
    float _573 = fma(_549, _553, _563);
    float _575 = _567 + _559;
    float _577 = _565 + _569;
    float _579 = fma(_553, _553, _571);
    float _581 = _565 + _573;
    float _583 = _573 + _575;
    float _585 = _577 * _577;
    float _587 = _579 + _581;
    float _589 = fma(_583, _583, _585);
    float _591 = fma(_587, _587, _589);
    float _593 = rsqrt(_591);
    float _595 = _577 * _593;
    float _597 = _583 * _593;
    float _599 = _587 * _593;
    float _601 = _557 * _595;
    float _603 = _559 * _595;
    float _605 = fma(_559, _597, _601);
    float _607 = _565 * _595;
    float _609 = fma(_567, _597, _603);
    float _611 = fma(_565, _599, _605);
    float _613 = fma(_573, _597, _607);
    float _615 = fma(_573, _599, _609);
    float _617 = _611 * _611;
    float _619 = fma(_579, _599, _613);
    float _621 = fma(_615, _615, _617);
    float _623 = fma(_619, _619, _621);
    float _625 = rsqrt(_623);
    float _627 = _611 * _625;
    float _629 = _615 * _625;
    float _631 = _619 * _625;
    float _633 = _557 * _627;
    float _635 = _559 * _627;
    float _637 = _565 * _627;
    float _639 = fma(_559, _629, _633);
    float _641 = fma(_567, _629, _635);
    float _643 = fma(_573, _629, _637);
    float _645 = fma(_565, _631, _639);
    float _647 = fma(_573, _631, _641);
    float _649 = fma(_579, _631, _643);
    float _651 = _645 * _645;
    float _653 = fma(_647, _647, _651);
    float _655 = fma(_649, _649, _653);
    float _657 = rsqrt(_655);
    float _659 = _645 * _657;
    float _661 = _647 * _657;
    float _663 = _649 * _657;
    float _665 = _557 * _659;
    float _667 = _559 * _659;
    float _669 = _565 * _659;
    float _671 = fma(_559, _661, _665);
    float _673 = fma(_567, _661, _667);
    float _675 = fma(_573, _661, _669);
    float _677 = fma(_565, _663, _671);
    float _679 = fma(_573, _663, _673);
    float _681 = fma(_579, _663, _675);
    float _683 = _677 * _677;
    float _685 = fma(_679, _679, _683);
    float _687 = fma(_681, _681, _685);
    float _689 = rsqrt(_687);
    float _691 = _677 * _689;
    float _693 = _679 * _689;
    float _695 = _681 * _689;
    float _697 = _557 * _691;
    float _699 = _559 * _691;
    float _701 = _565 * _691;
    float _703 = fma(_559, _693, _697);
    float _705 = fma(_567, _693, _699);
    float _707 = fma(_573, _693, _701);
    float _709 = fma(_565, _695, _703);
    float _711 = fma(_573, _695, _705);
    float _713 = fma(_579, _695, _707);
    float _715 = _709 * _709;
    float _717 = fma(_711, _711, _715);
    float _719 = fma(_713, _713, _717);
    float _721 = rsqrt(_719);
    float _723 = _709 * _721;
    float _725 = _711 * _721;
    float _727 = _713 * _721;
    float _729 = _557 * _723;
    float _731 = _559 * _723;
    float _733 = _565 * _723;
    float _735 = fma(_559, _725, _729);
    float _737 = fma(_567, _725, _731);
    float _739 = fma(_573, _725, _733);
    float _741 = fma(_565, _727, _735);
    float _743 = fma(_573, _727, _737);
    float _745 = fma(_579, _727, _739);
    float _747 = _741 * _741;
    float _749 = fma(_743, _743, _747);
    float _751 = fma(_745, _745, _749);
    float _753 = rsqrt(_751);
    float _755 = _741 * _753;
    float _757 = _743 * _753;
    float _759 = _745 * _753;
    float _761 = _557 * _755;
    float _763 = _559 * _755;
    float _765 = _565 * _755;
    float _767 = fma(_559, _757, _761);
    float _769 = fma(_567, _757, _763);
    float _771 = fma(_573, _757, _765);
    float _773 = fma(_565, _759, _767);
    float _775 = fma(_573, _759, _769);
    float _777 = fma(_579, _759, _771);
    float _779 = _773 * _773;
    float _781 = fma(_775, _775, _779);
    float _783 = fma(_777, _777, _781);
    float _785 = rsqrt(_783);
    float _787 = _773 * _785;
    float _789 = _775 * _785;
    float _791 = _777 * _785;
    float _793 = _557 * _787;
    float _795 = _559 * _787;
    float _797 = fma(_559, _789, _793);
    float _799 = _565 * _787;
    float _801 = fma(_567, _789, _795);
    float _803 = fma(_565, _791, _797);
    float _805 = fma(_573, _789, _799);
    float _807 = fma(_573, _791, _801);
    float _809 = _803 * _803;
    float _811 = fma(_579, _791, _805);
    float _813 = fma(_807, _807, _809);
    float _815 = fma(_811, _811, _813);
    float _817 = rsqrt(_815);
    float _819 = _803 * _817;
    float _821 = _807 * _817;
    float _823 = _811 * _817;
    float _825 = _73 * _819;
    float _827 = _81 * _819;
    float _829 = _89 * _819;
    float _831 = fma(_71, _821, _825);
    float _833 = fma(_79, _821, _827);
    float _835 = fma(_87, _821, _829);
    float _837 = fma(_75, _823, _831);
    float _839 = fma(_83, _823, _833);
    float _841 = fma(_91, _823, _835);
    bool _845 = _837 >= _839;
    bool _847 = isnan(_837);
    bool _849 = _845 || _847;
    bool _851 = isnan(_839);
    bool _853 = _849 || _851;
    float _855 = _551;
    float _857 = _833;
    float _859 = _829;
    float _861 = _783;
    float _863 = _835;
    float _865 = _827;
    float _867 = _777;
    float _869 = _761;
    float _871 = _839;
    float _873 = _787;
    float _875 = _841;
    float _877 = _841;
    float _879 = _819;
    float _881 = _821;
    float _883 = 2.6624670822171524347550862082508e-44;
    float _885 = (*spvDescriptorSet0.fp_c3)._m0[1].x;
    if (!_853)
    {
        _855 = _79;
    }
    float _887 = _855;
    float _889 = _887;
    float _891 = _887;
    if (!_853)
    {
        _857 = _81;
    }
    float _893 = _857;
    float _895 = _893;
    float _897 = _893;
    if (!_853)
    {
        _859 = _83;
    }
    float _899 = _859;
    float _901 = _899;
    float _903 = _899;
    if (!_853)
    {
        _861 = _837;
    }
    float _905 = _861;
    float _907 = _905;
    float _909 = _905;
    if (!_853)
    {
        _863 = _839;
    }
    float _911 = _863;
    float _913 = _911;
    float _915 = _911;
    if (!_853)
    {
        _865 = _71;
    }
    float _917 = _865;
    float _919 = _917;
    float _921 = _917;
    if (!_853)
    {
        _867 = _73;
    }
    float _923 = _867;
    float _925 = _923;
    float _927 = _923;
    if (!_853)
    {
        _869 = _75;
    }
    float _929 = _869;
    bool _931 = !_853;
    float _933 = _929;
    float _935 = _929;
    if (!_931)
    {
        bool _937 = _837 > _839;
        if (!_937)
        {
            _907 = _837;
        }
        float _939 = _907;
        float _941 = _939;
        if (!_937)
        {
            _913 = _837;
        }
        float _943 = _913;
        float _945 = _943;
        if (!_937)
        {
            _919 = _71;
        }
        float _947 = _919;
        float _949 = _947;
        if (!_937)
        {
            _925 = _73;
        }
        float _951 = _925;
        float _953 = _951;
        if (!_937)
        {
            _933 = _75;
        }
        float _955 = _933;
        float _957 = _955;
        if (!_937)
        {
            _889 = _71;
        }
        float _959 = _889;
        float _961 = _959;
        if (!_937)
        {
            _895 = _73;
        }
        float _963 = _895;
        float _965 = _963;
        if (!_937)
        {
            _901 = _75;
        }
        float _967 = _901;
        _903 = _967;
        if (_937)
        {
            _941 = _839;
        }
        float _969 = _941;
        _909 = _969;
        if (_937)
        {
            _945 = _837;
        }
        float _971 = _945;
        _915 = _971;
        if (_937)
        {
            _949 = _79;
        }
        float _973 = _949;
        _921 = _973;
        if (_937)
        {
            _953 = _81;
        }
        float _975 = _953;
        _927 = _975;
        if (_937)
        {
            _957 = _83;
        }
        float _977 = _957;
        _935 = _977;
        if (_937)
        {
            _961 = _71;
        }
        float _979 = _961;
        _891 = _979;
        if (_937)
        {
            _965 = _73;
        }
        float _981 = _965;
        _897 = _981;
        if (_937)
        {
            _903 = _75;
        }
    }
    float _983 = _915;
    float _985 = _909;
    float _987 = _891;
    float _989 = _897;
    float _991 = _903;
    float _993 = _921;
    float _995 = _927;
    float _997 = _935;
    bool _999 = _983 >= _841;
    bool _1001 = isnan(_983);
    bool _1003 = _999 || _1001;
    bool _1005 = isnan(_841);
    bool _1007 = _1003 || _1005;
    float _1009 = _97 * _819;
    float _1011 = fma(_95, _821, _1009);
    float _1013 = fma(_99, _823, _1011);
    float _1015 = _1011;
    float _1017 = _985;
    float _1019 = _993;
    float _1021 = _995;
    float _1023 = _985;
    float _1025 = _993;
    float _1027 = _995;
    float _1029 = _997;
    float _1031 = _989;
    float _1033 = _1013;
    float _1035 = _1013;
    if (!_1007)
    {
        _1015 = _87;
    }
    float _1037 = _1015;
    float _1039 = _1037;
    float _1041 = _1037;
    if (!_1007)
    {
        _871 = _89;
    }
    float _1043 = _871;
    float _1045 = _1043;
    float _1047 = _1043;
    if (!_1007)
    {
        _873 = _91;
    }
    float _1049 = _873;
    bool _1051 = !_1007;
    float _1053 = _1049;
    float _1055 = _1049;
    if (!_1051)
    {
        bool _1057 = _985 > _841;
        if (_1057)
        {
            _1017 = _841;
        }
        float _1059 = _1017;
        _1023 = _1059;
        if (!_1057)
        {
            _1039 = _987;
        }
        float _1061 = _1039;
        float _1063 = _1061;
        if (!_1057)
        {
            _1045 = _989;
        }
        float _1065 = _1045;
        float _1067 = _1065;
        if (!_1057)
        {
            _1053 = _991;
        }
        float _1069 = _1053;
        float _1071 = _1069;
        if (!_1057)
        {
            _875 = _983;
        }
        float _1073 = _875;
        float _1075 = _1073;
        if (_1057)
        {
            _1063 = _987;
        }
        float _1077 = _1063;
        _1041 = _1077;
        if (_1057)
        {
            _1067 = _989;
        }
        float _1079 = _1067;
        _1047 = _1079;
        if (_1057)
        {
            _1071 = _991;
        }
        float _1081 = _1071;
        _1055 = _1081;
        if (_1057)
        {
            _1075 = _983;
        }
        float _1083 = _1075;
        _877 = _1083;
        if (_1057)
        {
            _1019 = _87;
        }
        float _1085 = _1019;
        _1025 = _1085;
        if (_1057)
        {
            _1021 = _89;
        }
        float _1087 = _1021;
        _1027 = _1087;
        if (_1057)
        {
            _1029 = _91;
        }
    }
    float _1089 = _877;
    float _1091 = _1023;
    float _1093 = _1041;
    float _1095 = _1047;
    float _1097 = _1055;
    float _1099 = _1025;
    float _1101 = _1027;
    float _1103 = _1029;
    bool _1105 = _1089 >= _1013;
    bool _1107 = isnan(_1089);
    bool _1109 = _1105 || _1107;
    bool _1111 = isnan(_1013);
    bool _1113 = _1109 || _1111;
    float _1115 = _105 * _819;
    float _1117 = fma(_103, _821, _1115);
    float _1119 = fma(_107, _823, _1117);
    float _1121 = _1117;
    float _1123 = _1115;
    float _1125 = _1091;
    float _1127 = _1099;
    float _1129 = _1101;
    float _1131 = _1091;
    float _1133 = _1099;
    float _1135 = _1101;
    float _1137 = _1103;
    float _1139 = _1095;
    float _1141 = _1097;
    float _1143 = _1119;
    float _1145 = _1119;
    if (!_1113)
    {
        _1121 = _95;
    }
    float _1147 = _1121;
    float _1149 = _1147;
    float _1151 = _1147;
    if (!_1113)
    {
        _1123 = _97;
    }
    float _1153 = _1123;
    float _1155 = _1153;
    float _1157 = _1153;
    if (!_1113)
    {
        _1031 = _99;
    }
    float _1159 = _1031;
    bool _1161 = !_1113;
    float _1163 = _1159;
    float _1165 = _1159;
    if (!_1161)
    {
        bool _1167 = _1091 > _1013;
        if (_1167)
        {
            _1125 = _1013;
        }
        float _1169 = _1125;
        _1131 = _1169;
        if (!_1167)
        {
            _1149 = _1093;
        }
        float _1171 = _1149;
        float _1173 = _1171;
        if (!_1167)
        {
            _1155 = _1095;
        }
        float _1175 = _1155;
        float _1177 = _1175;
        if (!_1167)
        {
            _1163 = _1097;
        }
        float _1179 = _1163;
        float _1181 = _1179;
        if (!_1167)
        {
            _1033 = _1089;
        }
        float _1183 = _1033;
        float _1185 = _1183;
        if (_1167)
        {
            _1173 = _1093;
        }
        float _1187 = _1173;
        _1151 = _1187;
        if (_1167)
        {
            _1177 = _1095;
        }
        float _1189 = _1177;
        _1157 = _1189;
        if (_1167)
        {
            _1181 = _1097;
        }
        float _1191 = _1181;
        _1165 = _1191;
        if (_1167)
        {
            _1185 = _1089;
        }
        float _1193 = _1185;
        _1035 = _1193;
        if (_1167)
        {
            _1127 = _95;
        }
        float _1195 = _1127;
        _1133 = _1195;
        if (_1167)
        {
            _1129 = _97;
        }
        float _1197 = _1129;
        _1135 = _1197;
        if (_1167)
        {
            _1137 = _99;
        }
    }
    float _1199 = _1035;
    float _1201 = _1131;
    float _1203 = _1151;
    float _1205 = _1157;
    float _1207 = _1165;
    float _1209 = _1133;
    float _1211 = _1135;
    float _1213 = _1137;
    bool _1215 = _1199 >= _1119;
    bool _1217 = isnan(_1199);
    bool _1219 = _1215 || _1217;
    bool _1221 = isnan(_1119);
    bool _1223 = _1219 || _1221;
    float _1225 = _113 * _819;
    float _1227 = fma(_111, _821, _1225);
    float _1229 = fma(_115, _823, _1227);
    float _1231 = _1227;
    float _1233 = _1201;
    float _1235 = _1209;
    float _1237 = _1211;
    float _1239 = _1201;
    float _1241 = _1209;
    float _1243 = _1211;
    float _1245 = _1213;
    float _1247 = _1207;
    float _1249 = _1229;
    float _1251 = _1229;
    float _1253 = _1199;
    if (!_1223)
    {
        _1231 = _103;
    }
    float _1255 = _1231;
    float _1257 = _1255;
    float _1259 = _1255;
    if (!_1223)
    {
        _1139 = _105;
    }
    float _1261 = _1139;
    float _1263 = _1261;
    float _1265 = _1261;
    if (!_1223)
    {
        _1141 = _107;
    }
    float _1267 = _1141;
    bool _1269 = !_1223;
    float _1271 = _1267;
    float _1273 = _1267;
    if (!_1269)
    {
        bool _1275 = _1201 > _1119;
        if (_1275)
        {
            _1233 = _1119;
        }
        float _1277 = _1233;
        _1239 = _1277;
        if (!_1275)
        {
            _1257 = _1203;
        }
        float _1279 = _1257;
        float _1281 = _1279;
        if (!_1275)
        {
            _1263 = _1205;
        }
        float _1283 = _1263;
        float _1285 = _1283;
        if (!_1275)
        {
            _1271 = _1207;
        }
        float _1287 = _1271;
        float _1289 = _1287;
        if (!_1275)
        {
            _1143 = _1199;
        }
        float _1291 = _1143;
        float _1293 = _1291;
        if (_1275)
        {
            _1281 = _1203;
        }
        float _1295 = _1281;
        _1259 = _1295;
        if (_1275)
        {
            _1285 = _1205;
        }
        float _1297 = _1285;
        _1265 = _1297;
        if (_1275)
        {
            _1289 = _1207;
        }
        float _1299 = _1289;
        _1273 = _1299;
        if (_1275)
        {
            _1293 = _1199;
        }
        float _1301 = _1293;
        _1145 = _1301;
        if (_1275)
        {
            _1235 = _103;
        }
        float _1303 = _1235;
        _1241 = _1303;
        if (_1275)
        {
            _1237 = _105;
        }
        float _1305 = _1237;
        _1243 = _1305;
        if (_1275)
        {
            _1245 = _107;
        }
    }
    float _1307 = _1145;
    float _1309 = _1239;
    float _1311 = _1259;
    float _1313 = _1265;
    float _1315 = _1273;
    float _1317 = _1241;
    float _1319 = _1243;
    float _1321 = _1245;
    bool _1323 = _1307 >= _1229;
    bool _1325 = isnan(_1307);
    bool _1327 = _1323 || _1325;
    bool _1329 = isnan(_1229);
    bool _1331 = _1327 || _1329;
    float _1333 = _121 * _819;
    float _1335 = fma(_119, _821, _1333);
    float _1337 = fma(_123, _823, _1335);
    float _1339 = _1335;
    float _1341 = _1333;
    float _1343 = _1309;
    float _1345 = _1317;
    float _1347 = _1319;
    float _1349 = _1309;
    float _1351 = _1317;
    float _1353 = _1319;
    float _1355 = _1321;
    float _1357 = _1315;
    float _1359 = _1307;
    float _1361 = _1337;
    float _1363 = _1337;
    if (!_1331)
    {
        _1339 = _111;
    }
    float _1365 = _1339;
    float _1367 = _1365;
    float _1369 = _1365;
    if (!_1331)
    {
        _1341 = _113;
    }
    float _1371 = _1341;
    float _1373 = _1371;
    float _1375 = _1371;
    if (!_1331)
    {
        _1247 = _115;
    }
    float _1377 = _1247;
    bool _1379 = !_1331;
    float _1381 = _1377;
    float _1383 = _1377;
    if (!_1379)
    {
        bool _1385 = _1309 > _1229;
        if (_1385)
        {
            _1343 = _1229;
        }
        float _1387 = _1343;
        _1349 = _1387;
        if (!_1385)
        {
            _1367 = _1311;
        }
        float _1389 = _1367;
        float _1391 = _1389;
        if (!_1385)
        {
            _1373 = _1313;
        }
        float _1393 = _1373;
        float _1395 = _1393;
        if (!_1385)
        {
            _1381 = _1315;
        }
        float _1397 = _1381;
        float _1399 = _1397;
        if (!_1385)
        {
            _1249 = _1307;
        }
        float _1401 = _1249;
        float _1403 = _1401;
        if (_1385)
        {
            _1391 = _1311;
        }
        float _1405 = _1391;
        _1369 = _1405;
        if (_1385)
        {
            _1395 = _1313;
        }
        float _1407 = _1395;
        _1375 = _1407;
        if (_1385)
        {
            _1399 = _1315;
        }
        float _1409 = _1399;
        _1383 = _1409;
        if (_1385)
        {
            _1403 = _1307;
        }
        float _1411 = _1403;
        _1251 = _1411;
        if (_1385)
        {
            _1345 = _111;
        }
        float _1413 = _1345;
        _1351 = _1413;
        if (_1385)
        {
            _1347 = _113;
        }
        float _1415 = _1347;
        _1353 = _1415;
        if (_1385)
        {
            _1355 = _115;
        }
    }
    float _1417 = _1251;
    float _1419 = _1349;
    float _1421 = _1369;
    float _1423 = _1375;
    float _1425 = _1383;
    float _1427 = _1351;
    float _1429 = _1353;
    float _1431 = _1355;
    bool _1433 = _1417 >= _1337;
    bool _1435 = isnan(_1417);
    bool _1437 = _1433 || _1435;
    bool _1439 = isnan(_1337);
    bool _1441 = _1437 || _1439;
    float _1443 = _129 * _819;
    float _1445 = fma(_127, _821, _1443);
    float _1447 = fma(_131, _823, _1445);
    float _1449 = _1419;
    float _1451 = _1427;
    float _1453 = _1429;
    float _1455 = _1419;
    float _1457 = _1427;
    float _1459 = _1429;
    float _1461 = _1431;
    float _1463 = _1425;
    float _1465 = _1447;
    float _1467 = _1447;
    if (!_1441)
    {
        _1357 = _119;
    }
    float _1469 = _1357;
    float _1471 = _1469;
    float _1473 = _1469;
    if (!_1441)
    {
        _1359 = _121;
    }
    float _1475 = _1359;
    float _1477 = _1475;
    float _1479 = _1475;
    if (!_1441)
    {
        _1253 = _123;
    }
    float _1481 = _1253;
    bool _1483 = !_1441;
    float _1485 = _1481;
    float _1487 = _1481;
    if (!_1483)
    {
        bool _1489 = _1419 > _1337;
        if (_1489)
        {
            _1449 = _1337;
        }
        float _1491 = _1449;
        _1455 = _1491;
        if (!_1489)
        {
            _1471 = _1421;
        }
        float _1493 = _1471;
        float _1495 = _1493;
        if (!_1489)
        {
            _1477 = _1423;
        }
        float _1497 = _1477;
        float _1499 = _1497;
        if (!_1489)
        {
            _1485 = _1425;
        }
        float _1501 = _1485;
        float _1503 = _1501;
        if (!_1489)
        {
            _1361 = _1417;
        }
        float _1505 = _1361;
        float _1507 = _1505;
        if (_1489)
        {
            _1495 = _1421;
        }
        float _1509 = _1495;
        _1473 = _1509;
        if (_1489)
        {
            _1499 = _1423;
        }
        float _1511 = _1499;
        _1479 = _1511;
        if (_1489)
        {
            _1503 = _1425;
        }
        float _1513 = _1503;
        _1487 = _1513;
        if (_1489)
        {
            _1507 = _1417;
        }
        float _1515 = _1507;
        _1363 = _1515;
        if (_1489)
        {
            _1451 = _119;
        }
        float _1517 = _1451;
        _1457 = _1517;
        if (_1489)
        {
            _1453 = _121;
        }
        float _1519 = _1453;
        _1459 = _1519;
        if (_1489)
        {
            _1461 = _123;
        }
    }
    float _1521 = _1363;
    float _1523 = _1455;
    float _1525 = _1473;
    float _1527 = _1479;
    float _1529 = _1487;
    float _1531 = _1457;
    float _1533 = _1459;
    float _1535 = _1461;
    bool _1537 = _1521 >= _1447;
    bool _1539 = isnan(_1521);
    bool _1541 = _1537 || _1539;
    bool _1543 = isnan(_1447);
    bool _1545 = _1541 || _1543;
    float _1547 = _137 * _819;
    float _1549 = fma(_135, _821, _1547);
    float _1551 = fma(_139, _823, _1549);
    float _1553 = _1549;
    float _1555 = _1547;
    float _1557 = _1523;
    float _1559 = _1531;
    float _1561 = _1533;
    float _1563 = _1523;
    float _1565 = _1531;
    float _1567 = _1533;
    float _1569 = _1535;
    float _1571 = _1529;
    float _1573 = _1525;
    float _1575 = _1551;
    float _1577 = _1551;
    if (!_1545)
    {
        _1553 = _127;
    }
    float _1579 = _1553;
    float _1581 = _1579;
    float _1583 = _1579;
    if (!_1545)
    {
        _1555 = _129;
    }
    float _1585 = _1555;
    float _1587 = _1585;
    float _1589 = _1585;
    if (!_1545)
    {
        _1463 = _131;
    }
    float _1591 = _1463;
    bool _1593 = !_1545;
    float _1595 = _1591;
    float _1597 = _1591;
    if (!_1593)
    {
        bool _1599 = _1523 > _1447;
        if (_1599)
        {
            _1557 = _1447;
        }
        float _1601 = _1557;
        _1563 = _1601;
        if (!_1599)
        {
            _1581 = _1525;
        }
        float _1603 = _1581;
        float _1605 = _1603;
        if (!_1599)
        {
            _1587 = _1527;
        }
        float _1607 = _1587;
        float _1609 = _1607;
        if (!_1599)
        {
            _1595 = _1529;
        }
        float _1611 = _1595;
        float _1613 = _1611;
        if (!_1599)
        {
            _1465 = _1521;
        }
        float _1615 = _1465;
        float _1617 = _1615;
        if (_1599)
        {
            _1605 = _1525;
        }
        float _1619 = _1605;
        _1583 = _1619;
        if (_1599)
        {
            _1609 = _1527;
        }
        float _1621 = _1609;
        _1589 = _1621;
        if (_1599)
        {
            _1613 = _1529;
        }
        float _1623 = _1613;
        _1597 = _1623;
        if (_1599)
        {
            _1617 = _1521;
        }
        float _1625 = _1617;
        _1467 = _1625;
        if (_1599)
        {
            _1559 = _127;
        }
        float _1627 = _1559;
        _1565 = _1627;
        if (_1599)
        {
            _1561 = _129;
        }
        float _1629 = _1561;
        _1567 = _1629;
        if (_1599)
        {
            _1569 = _131;
        }
    }
    float _1631 = _1467;
    float _1633 = _1563;
    float _1635 = _1583;
    float _1637 = _1589;
    float _1639 = _1597;
    float _1641 = _1565;
    float _1643 = _1567;
    float _1645 = _1569;
    bool _1647 = _1631 >= _1551;
    bool _1649 = isnan(_1631);
    bool _1651 = _1647 || _1649;
    bool _1653 = isnan(_1551);
    bool _1655 = _1651 || _1653;
    float _1657 = _145 * _819;
    float _1659 = fma(_143, _821, _1657);
    float _1661 = fma(_147, _823, _1659);
    float _1663 = _1659;
    float _1665 = _1633;
    float _1667 = _1641;
    float _1669 = _1643;
    float _1671 = _1633;
    float _1673 = _1641;
    float _1675 = _1643;
    float _1677 = _1645;
    float _1679 = _1639;
    float _1681 = _1661;
    float _1683 = _1661;
    float _1685 = _1631;
    if (!_1655)
    {
        _1571 = _135;
    }
    float _1687 = _1571;
    float _1689 = _1687;
    float _1691 = _1687;
    if (!_1655)
    {
        _1663 = _137;
    }
    float _1693 = _1663;
    float _1695 = _1693;
    float _1697 = _1693;
    if (!_1655)
    {
        _1573 = _139;
    }
    float _1699 = _1573;
    bool _1701 = !_1655;
    float _1703 = _1699;
    float _1705 = _1699;
    if (!_1701)
    {
        bool _1707 = _1633 > _1551;
        if (_1707)
        {
            _1665 = _1551;
        }
        float _1709 = _1665;
        _1671 = _1709;
        if (!_1707)
        {
            _1689 = _1635;
        }
        float _1711 = _1689;
        float _1713 = _1711;
        if (!_1707)
        {
            _1695 = _1637;
        }
        float _1715 = _1695;
        float _1717 = _1715;
        if (!_1707)
        {
            _1703 = _1639;
        }
        float _1719 = _1703;
        float _1721 = _1719;
        if (!_1707)
        {
            _1575 = _1631;
        }
        float _1723 = _1575;
        float _1725 = _1723;
        if (_1707)
        {
            _1713 = _1635;
        }
        float _1727 = _1713;
        _1691 = _1727;
        if (_1707)
        {
            _1717 = _1637;
        }
        float _1729 = _1717;
        _1697 = _1729;
        if (_1707)
        {
            _1721 = _1639;
        }
        float _1731 = _1721;
        _1705 = _1731;
        if (_1707)
        {
            _1725 = _1631;
        }
        float _1733 = _1725;
        _1577 = _1733;
        if (_1707)
        {
            _1667 = _135;
        }
        float _1735 = _1667;
        _1673 = _1735;
        if (_1707)
        {
            _1669 = _137;
        }
        float _1737 = _1669;
        _1675 = _1737;
        if (_1707)
        {
            _1677 = _139;
        }
    }
    float _1739 = _1577;
    float _1741 = _1671;
    float _1743 = _1691;
    float _1745 = _1697;
    float _1747 = _1705;
    float _1749 = _1673;
    float _1751 = _1675;
    float _1753 = _1677;
    bool _1755 = _1739 >= _1661;
    bool _1757 = isnan(_1739);
    bool _1759 = _1755 || _1757;
    bool _1761 = isnan(_1661);
    bool _1763 = _1759 || _1761;
    float _1765 = _153 * _819;
    float _1767 = fma(_151, _821, _1765);
    float _1769 = fma(_155, _823, _1767);
    float _1771 = _1765;
    float _1773 = _1767;
    float _1775 = _1741;
    float _1777 = _1749;
    float _1779 = _1751;
    float _1781 = _1741;
    float _1783 = _1749;
    float _1785 = _1751;
    float _1787 = _1753;
    float _1789 = _1747;
    float _1791 = _1769;
    float _1793 = _1769;
    if (!_1763)
    {
        _1679 = _143;
    }
    float _1795 = _1679;
    float _1797 = _1795;
    float _1799 = _1795;
    if (!_1763)
    {
        _1771 = _145;
    }
    float _1801 = _1771;
    float _1803 = _1801;
    float _1805 = _1801;
    if (!_1763)
    {
        _1773 = _147;
    }
    float _1807 = _1773;
    bool _1809 = !_1763;
    float _1811 = _1807;
    float _1813 = _1807;
    if (!_1809)
    {
        bool _1815 = _1741 > _1661;
        if (_1815)
        {
            _1775 = _1661;
        }
        float _1817 = _1775;
        _1781 = _1817;
        if (!_1815)
        {
            _1797 = _1743;
        }
        float _1819 = _1797;
        float _1821 = _1819;
        if (!_1815)
        {
            _1803 = _1745;
        }
        float _1823 = _1803;
        float _1825 = _1823;
        if (!_1815)
        {
            _1811 = _1747;
        }
        float _1827 = _1811;
        float _1829 = _1827;
        if (!_1815)
        {
            _1681 = _1739;
        }
        float _1831 = _1681;
        float _1833 = _1831;
        if (_1815)
        {
            _1821 = _1743;
        }
        float _1835 = _1821;
        _1799 = _1835;
        if (_1815)
        {
            _1825 = _1745;
        }
        float _1837 = _1825;
        _1805 = _1837;
        if (_1815)
        {
            _1829 = _1747;
        }
        float _1839 = _1829;
        _1813 = _1839;
        if (_1815)
        {
            _1833 = _1739;
        }
        float _1841 = _1833;
        _1683 = _1841;
        if (_1815)
        {
            _1777 = _143;
        }
        float _1843 = _1777;
        _1783 = _1843;
        if (_1815)
        {
            _1779 = _145;
        }
        float _1845 = _1779;
        _1785 = _1845;
        if (_1815)
        {
            _1787 = _147;
        }
    }
    float _1847 = _1683;
    float _1849 = _1781;
    float _1851 = _1799;
    float _1853 = _1805;
    float _1855 = _1813;
    float _1857 = _1783;
    float _1859 = _1785;
    float _1861 = _1787;
    bool _1863 = _1847 >= _1769;
    bool _1865 = isnan(_1847);
    bool _1867 = _1863 || _1865;
    bool _1869 = isnan(_1769);
    bool _1871 = _1867 || _1869;
    float _1873 = _161 * _819;
    float _1875 = fma(_159, _821, _1873);
    float _1877 = fma(_163, _823, _1875);
    float _1879 = _1875;
    float _1881 = _1849;
    float _1883 = _1857;
    float _1885 = _1859;
    float _1887 = _1849;
    float _1889 = _1857;
    float _1891 = _1859;
    float _1893 = _1861;
    float _1895 = _1851;
    float _1897 = _1855;
    float _1899 = _1877;
    float _1901 = _1877;
    if (!_1871)
    {
        _1789 = _151;
    }
    float _1903 = _1789;
    float _1905 = _1903;
    float _1907 = _1903;
    if (!_1871)
    {
        _1685 = _153;
    }
    float _1909 = _1685;
    float _1911 = _1909;
    float _1913 = _1909;
    if (!_1871)
    {
        _1879 = _155;
    }
    float _1915 = _1879;
    bool _1917 = !_1871;
    float _1919 = _1915;
    float _1921 = _1915;
    if (!_1917)
    {
        bool _1923 = _1849 > _1769;
        if (_1923)
        {
            _1881 = _1769;
        }
        float _1925 = _1881;
        _1887 = _1925;
        if (!_1923)
        {
            _1905 = _1851;
        }
        float _1927 = _1905;
        float _1929 = _1927;
        if (!_1923)
        {
            _1911 = _1853;
        }
        float _1931 = _1911;
        float _1933 = _1931;
        if (!_1923)
        {
            _1919 = _1855;
        }
        float _1935 = _1919;
        float _1937 = _1935;
        if (!_1923)
        {
            _1791 = _1847;
        }
        float _1939 = _1791;
        float _1941 = _1939;
        if (_1923)
        {
            _1929 = _1851;
        }
        float _1943 = _1929;
        _1907 = _1943;
        if (_1923)
        {
            _1933 = _1853;
        }
        float _1945 = _1933;
        _1913 = _1945;
        if (_1923)
        {
            _1937 = _1855;
        }
        float _1947 = _1937;
        _1921 = _1947;
        if (_1923)
        {
            _1941 = _1847;
        }
        float _1949 = _1941;
        _1793 = _1949;
        if (_1923)
        {
            _1883 = _151;
        }
        float _1951 = _1883;
        _1889 = _1951;
        if (_1923)
        {
            _1885 = _153;
        }
        float _1953 = _1885;
        _1891 = _1953;
        if (_1923)
        {
            _1893 = _155;
        }
    }
    float _1955 = _1793;
    float _1957 = _1887;
    float _1959 = _1907;
    float _1961 = _1913;
    float _1963 = _1921;
    float _1965 = _1889;
    float _1967 = _1891;
    float _1969 = _1893;
    bool _1971 = _1955 >= _1877;
    bool _1973 = isnan(_1955);
    bool _1975 = _1971 || _1973;
    bool _1977 = isnan(_1877);
    bool _1979 = _1975 || _1977;
    float _1981 = _169 * _819;
    float _1983 = fma(_167, _821, _1981);
    float _1985 = fma(_171, _823, _1983);
    float _1987 = _1983;
    float _1989 = _1957;
    float _1991 = _1965;
    float _1993 = _1967;
    float _1995 = _1957;
    float _1997 = _1965;
    float _1999 = _1967;
    float _2001 = _1969;
    float _2003 = _1959;
    float _2005 = _1961;
    float _2007 = _1985;
    float _2009 = _1985;
    if (!_1979)
    {
        _1895 = _159;
    }
    float _2011 = _1895;
    float _2013 = _2011;
    float _2015 = _2011;
    if (!_1979)
    {
        _1987 = _161;
    }
    float _2017 = _1987;
    float _2019 = _2017;
    float _2021 = _2017;
    if (!_1979)
    {
        _1897 = _163;
    }
    float _2023 = _1897;
    bool _2025 = !_1979;
    float _2027 = _2023;
    float _2029 = _2023;
    if (!_2025)
    {
        bool _2031 = _1957 > _1877;
        if (_2031)
        {
            _1989 = _1877;
        }
        float _2033 = _1989;
        _1995 = _2033;
        if (!_2031)
        {
            _2013 = _1959;
        }
        float _2035 = _2013;
        float _2037 = _2035;
        if (!_2031)
        {
            _2019 = _1961;
        }
        float _2039 = _2019;
        float _2041 = _2039;
        if (!_2031)
        {
            _2027 = _1963;
        }
        float _2043 = _2027;
        float _2045 = _2043;
        if (!_2031)
        {
            _1899 = _1955;
        }
        float _2047 = _1899;
        float _2049 = _2047;
        if (_2031)
        {
            _2037 = _1959;
        }
        float _2051 = _2037;
        _2015 = _2051;
        if (_2031)
        {
            _2041 = _1961;
        }
        float _2053 = _2041;
        _2021 = _2053;
        if (_2031)
        {
            _2045 = _1963;
        }
        float _2055 = _2045;
        _2029 = _2055;
        if (_2031)
        {
            _2049 = _1955;
        }
        float _2057 = _2049;
        _1901 = _2057;
        if (_2031)
        {
            _1991 = _159;
        }
        float _2059 = _1991;
        _1997 = _2059;
        if (_2031)
        {
            _1993 = _161;
        }
        float _2061 = _1993;
        _1999 = _2061;
        if (_2031)
        {
            _2001 = _163;
        }
    }
    float _2063 = _1901;
    float _2065 = _1995;
    float _2067 = _2015;
    float _2069 = _2021;
    float _2071 = _2029;
    float _2073 = _1997;
    float _2075 = _1999;
    float _2077 = _2001;
    bool _2079 = _2063 >= _1985;
    bool _2081 = isnan(_2063);
    bool _2083 = _2079 || _2081;
    bool _2085 = isnan(_1985);
    bool _2087 = _2083 || _2085;
    float _2089 = _177 * _819;
    float _2091 = fma(_175, _821, _2089);
    float _2093 = fma(_179, _823, _2091);
    float _2095 = _2089;
    float _2097 = _2065;
    float _2099 = _2073;
    float _2101 = _2075;
    float _2103 = _2065;
    float _2105 = _2073;
    float _2107 = _2075;
    float _2109 = _2077;
    float _2111 = _2067;
    float _2113 = _2071;
    float _2115 = _2093;
    float _2117 = _2093;
    if (!_2087)
    {
        _2003 = _167;
    }
    float _2119 = _2003;
    float _2121 = _2119;
    float _2123 = _2119;
    if (!_2087)
    {
        _2005 = _169;
    }
    float _2125 = _2005;
    float _2127 = _2125;
    float _2129 = _2125;
    if (!_2087)
    {
        _2095 = _171;
    }
    float _2131 = _2095;
    bool _2133 = !_2087;
    float _2135 = _2131;
    float _2137 = _2131;
    if (!_2133)
    {
        bool _2139 = _2065 > _1985;
        if (_2139)
        {
            _2097 = _1985;
        }
        float _2141 = _2097;
        _2103 = _2141;
        if (!_2139)
        {
            _2121 = _2067;
        }
        float _2143 = _2121;
        float _2145 = _2143;
        if (!_2139)
        {
            _2127 = _2069;
        }
        float _2147 = _2127;
        float _2149 = _2147;
        if (!_2139)
        {
            _2135 = _2071;
        }
        float _2151 = _2135;
        float _2153 = _2151;
        if (!_2139)
        {
            _2007 = _2063;
        }
        float _2155 = _2007;
        float _2157 = _2155;
        if (_2139)
        {
            _2145 = _2067;
        }
        float _2159 = _2145;
        _2123 = _2159;
        if (_2139)
        {
            _2149 = _2069;
        }
        float _2161 = _2149;
        _2129 = _2161;
        if (_2139)
        {
            _2153 = _2071;
        }
        float _2163 = _2153;
        _2137 = _2163;
        if (_2139)
        {
            _2157 = _2063;
        }
        float _2165 = _2157;
        _2009 = _2165;
        if (_2139)
        {
            _2099 = _167;
        }
        float _2167 = _2099;
        _2105 = _2167;
        if (_2139)
        {
            _2101 = _169;
        }
        float _2169 = _2101;
        _2107 = _2169;
        if (_2139)
        {
            _2109 = _171;
        }
    }
    float _2171 = _2009;
    float _2173 = _2103;
    float _2175 = _2123;
    float _2177 = _2129;
    float _2179 = _2137;
    float _2181 = _2105;
    float _2183 = _2107;
    float _2185 = _2109;
    bool _2187 = _2171 >= _2093;
    bool _2189 = isnan(_2171);
    bool _2191 = _2187 || _2189;
    bool _2193 = isnan(_2093);
    bool _2195 = _2191 || _2193;
    float _2197 = _185 * _819;
    float _2199 = fma(_183, _821, _2197);
    float _2201 = fma(_187, _823, _2199);
    float _2203 = _2199;
    float _2205 = _2173;
    float _2207 = _2181;
    float _2209 = _2183;
    float _2211 = _2181;
    float _2213 = _2173;
    float _2215 = _2183;
    float _2217 = _2185;
    float _2219 = _2177;
    float _2221 = _2201;
    float _2223 = _2201;
    if (!_2195)
    {
        _2111 = _175;
    }
    float _2225 = _2111;
    float _2227 = _2225;
    float _2229 = _2225;
    if (!_2195)
    {
        _2203 = _177;
    }
    float _2231 = _2203;
    float _2233 = _2231;
    float _2235 = _2231;
    if (!_2195)
    {
        _2113 = _179;
    }
    float _2237 = _2113;
    bool _2239 = !_2195;
    float _2241 = _2237;
    float _2243 = _2237;
    if (!_2239)
    {
        bool _2245 = _2173 > _2093;
        if (_2245)
        {
            _2205 = _2093;
        }
        float _2247 = _2205;
        _2213 = _2247;
        if (!_2245)
        {
            _2227 = _2175;
        }
        float _2249 = _2227;
        float _2251 = _2249;
        if (!_2245)
        {
            _2233 = _2177;
        }
        float _2253 = _2233;
        float _2255 = _2253;
        if (!_2245)
        {
            _2241 = _2179;
        }
        float _2257 = _2241;
        float _2259 = _2257;
        if (!_2245)
        {
            _2115 = _2171;
        }
        float _2261 = _2115;
        float _2263 = _2261;
        if (_2245)
        {
            _2251 = _2175;
        }
        float _2265 = _2251;
        _2229 = _2265;
        if (_2245)
        {
            _2255 = _2177;
        }
        float _2267 = _2255;
        _2235 = _2267;
        if (_2245)
        {
            _2259 = _2179;
        }
        float _2269 = _2259;
        _2243 = _2269;
        if (_2245)
        {
            _2263 = _2171;
        }
        float _2271 = _2263;
        _2117 = _2271;
        if (_2245)
        {
            _2207 = _175;
        }
        float _2273 = _2207;
        _2211 = _2273;
        if (_2245)
        {
            _2209 = _177;
        }
        float _2275 = _2209;
        _2215 = _2275;
        if (_2245)
        {
            _2217 = _179;
        }
    }
    float _2277 = _2117;
    float _2279 = _2211;
    float _2281 = _2213;
    float _2283 = _2229;
    float _2285 = _2235;
    float _2287 = _2243;
    float _2289 = _2215;
    float _2291 = _2217;
    bool _2293 = _2277 >= _2201;
    bool _2295 = isnan(_2277);
    bool _2297 = _2293 || _2295;
    bool _2299 = isnan(_2201);
    bool _2301 = _2297 || _2299;
    float _2303 = _193 * _819;
    float _2305 = fma(_191, _821, _2303);
    float _2307 = fma(_195, _823, _2305);
    float _2309 = _2305;
    float _2311 = _2281;
    float _2313 = _2289;
    float _2315 = _2289;
    float _2317 = _2291;
    float _2319 = _2281;
    float _2321 = _2283;
    float _2323 = _2285;
    if (!_2301)
    {
        _2309 = _2279;
    }
    float _2325 = _2309;
    float _2327 = _2325;
    float _2329 = _2325;
    if (!_2301)
    {
        _879 = _183;
    }
    float _2331 = _879;
    float _2333 = _2331;
    float _2335 = _2331;
    if (!_2301)
    {
        _881 = _185;
    }
    float _2337 = _881;
    float _2339 = _2337;
    float _2341 = _2337;
    if (!_2301)
    {
        _2219 = _187;
    }
    float _2343 = _2219;
    bool _2345 = !_2301;
    float _2347 = _2343;
    float _2349 = _2343;
    if (!_2345)
    {
        bool _2351 = _2281 > _2201;
        if (_2351)
        {
            _2311 = _2201;
        }
        float _2353 = _2311;
        _2319 = _2353;
        if (!_2351)
        {
            _2333 = _2283;
        }
        float _2355 = _2333;
        float _2357 = _2355;
        if (!_2351)
        {
            _2339 = _2285;
        }
        float _2359 = _2339;
        float _2361 = _2359;
        if (!_2351)
        {
            _2347 = _2287;
        }
        float _2363 = _2347;
        float _2365 = _2363;
        if (!_2351)
        {
            _2221 = _2277;
        }
        float _2367 = _2221;
        float _2369 = _2367;
        if (!_2351)
        {
            _2327 = _2279;
        }
        float _2371 = _2327;
        float _2373 = _2371;
        if (_2351)
        {
            _2357 = _2283;
        }
        float _2375 = _2357;
        _2335 = _2375;
        if (_2351)
        {
            _2361 = _2285;
        }
        float _2377 = _2361;
        _2341 = _2377;
        if (_2351)
        {
            _2365 = _2287;
        }
        float _2379 = _2365;
        _2349 = _2379;
        if (_2351)
        {
            _2369 = _2277;
        }
        float _2381 = _2369;
        _2223 = _2381;
        if (_2351)
        {
            _2373 = _183;
        }
        float _2383 = _2373;
        _2329 = _2383;
        if (_2351)
        {
            _2313 = _185;
        }
        float _2385 = _2313;
        _2315 = _2385;
        if (_2351)
        {
            _2317 = _187;
        }
    }
    float _2387 = _2223;
    float _2389 = _2315;
    float _2391 = _2317;
    float _2393 = _2319;
    float _2395 = _2335;
    float _2397 = _2341;
    float _2399 = _2349;
    float _2401 = _2329;
    bool _2403 = _2387 >= _2307;
    bool _2405 = isnan(_2387);
    bool _2407 = _2403 || _2405;
    bool _2409 = isnan(_2307);
    bool _2411 = _2407 || _2409;
    float _2413 = _2401;
    float _2415 = _2401;
    if (!_2411)
    {
        _2321 = _2389;
    }
    float _2417 = _2321;
    float _2419 = _2417;
    float _2421 = _2417;
    if (!_2411)
    {
        _2323 = _2391;
    }
    float _2423 = _2323;
    float _2425 = _2423;
    float _2427 = _2423;
    if (!_2411)
    {
        _883 = _191;
    }
    float _2429 = _883;
    float _2431 = _2429;
    float _2433 = _2429;
    if (!_2411)
    {
        _885 = _193;
    }
    float _2435 = _885;
    float _2437 = 0.0;
    float _2439 = _2435;
    float _2441 = _2435;
    if (!_2411)
    {
        _2437 = _195;
    }
    float _2443 = _2437;
    bool _2445 = !_2411;
    float _2447 = _2443;
    float _2449 = _2443;
    if (!_2445)
    {
        bool _2451 = _2393 > _2307;
        if (!_2451)
        {
            _2431 = _2395;
        }
        float _2453 = _2431;
        float _2455 = _2453;
        if (!_2451)
        {
            _2439 = _2397;
        }
        float _2457 = _2439;
        float _2459 = _2457;
        if (!_2451)
        {
            _2447 = _2399;
        }
        float _2461 = _2447;
        float _2463 = _2461;
        if (!_2451)
        {
            _2419 = _2389;
        }
        float _2465 = _2419;
        float _2467 = _2465;
        if (!_2451)
        {
            _2425 = _2391;
        }
        float _2469 = _2425;
        _2427 = _2469;
        if (_2451)
        {
            _2455 = _2395;
        }
        float _2471 = _2455;
        _2433 = _2471;
        if (_2451)
        {
            _2459 = _2397;
        }
        float _2473 = _2459;
        _2441 = _2473;
        if (_2451)
        {
            _2463 = _2399;
        }
        float _2475 = _2463;
        _2449 = _2475;
        if (_2451)
        {
            _2413 = _191;
        }
        float _2477 = _2413;
        _2415 = _2477;
        if (_2451)
        {
            _2467 = _193;
        }
        float _2479 = _2467;
        _2421 = _2479;
        if (_2451)
        {
            _2427 = _195;
        }
    }
    float _2481 = _2421;
    float _2483 = _2441;
    float _2485 = _2415;
    float _2487 = _2433;
    float _2489 = _2427;
    float _2491 = _2449;
    float _2493 = -_2481;
    float _2495 = _2483 + _2493;
    float _2497 = -_2485;
    float _2499 = _2487 + _2497;
    float _2501 = -_2489;
    float _2503 = _2491 + _2501;
    float _2505 = _2495 * _2495;
    float _2507 = fma(_2499, _2499, _2505);
    float _2509 = -_2485;
    float _2511 = _71 + _2509;
    float _2513 = fma(_2503, _2503, _2507);
    float _2515 = -_2481;
    float _2517 = _73 + _2515;
    float _2519 = _2495 * _2517;
    float _2521 = 1.0 / _2513;
    float _2523 = -_2489;
    float _2525 = _75 + _2523;
    float _2527 = fma(_2499, _2511, _2519);
    float _2529 = fma(_2503, _2525, _2527);
    float _2531 = _2521 * 3.0;
    float _2533 = _2531 * _2529;
    float _2535 = rint(_2533);
    float _2537 = precise::max(0.0, _2535);
    float _2539 = precise::min(_2537, 3.0);
    float _2541 = trunc(_2539);
    int _2544 = int(_2541);
    bool _2546 = _2544 >= 2;
    bool _2548 = !_2546;
    float _2550 = _2499;
    float _2552 = _2495;
    float _2554 = _2503;
    float _2556 = _2485;
    float _2558 = _2487;
    float _2560 = _2481;
    float _2562 = _2483;
    float _2564 = _2491;
    float _2566 = _2489;
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
    float _2600;
    float _2602;
    float _2604;
    float _2606;
    if (!_2548)
    {
        bool _2568 = _2544 >= 3;
        bool _2570 = !_2568;
        if (!_2570)
        {
            bool _2572 = _2544 != 3;
            _2574 = _2572;
            if (!_2574)
            {
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
                _2600 = 0.0;
                _2602 = 0.0;
                _2604 = 0.0;
                _2606 = 0.0;
                _2608 = true;
            }
        }
        else
        {
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
            _2600 = 0.0;
            _2602 = 0.0;
            _2604 = 0.0;
            _2606 = 0.0;
            _2608 = true;
        }
    }
    if ((!_2608) || _2574)
    {
        bool _2610;
        if (!_2574)
        {
            _2610 = _2544 >= 1;
        }
        if ((!_2610) || _2574)
        {
            bool _2612;
            if (!_2574)
            {
                _2612 = _2544 != 0;
            }
            if ((!_2612) && (!_2574))
            {
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
                _2600 = 0.0;
                _2602 = 0.0;
                _2604 = 0.0;
                _2606 = 0.0;
                _2608 = true;
            }
            else
            {
                _2574 = false;
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
                _2600 = 0.0;
                _2602 = 0.0;
                _2604 = 0.0;
                _2606 = 0.0;
                _2608 = true;
            }
        }
        else
        {
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
            _2600 = _71;
            _2602 = _73;
            _2604 = _75;
            _2606 = 1.0;
        }
    }
    _2608 = false;
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
    float _2638 = _2600;
    float _2640 = _2602;
    float _2642 = _2604;
    float _2644 = _2606;
    float _2646 = -_2481;
    float _2648 = _81 + _2646;
    float _2650 = -_2485;
    float _2652 = _79 + _2650;
    float _2654 = _2495 * _2648;
    float _2656 = -_2489;
    float _2658 = _83 + _2656;
    float _2660 = fma(_2499, _2652, _2654);
    float _2662 = fma(_2503, _2658, _2660);
    float _2664 = _2531 * _2662;
    float _2666 = rint(_2664);
    float _2668 = precise::max(0.0, _2666);
    float _2670 = precise::min(_2668, 3.0);
    float _2672 = trunc(_2670);
    int _2674 = int(_2672);
    bool _2676 = _2674 >= 2;
    bool _2678 = !_2676;
    float _2680 = as_type<float>(_2674);
    float _2682 = _2666;
    float _2684 = _2660;
    float _2686 = _2654;
    float _2688 = _2614;
    float _2690 = _2616;
    float _2692 = _2618;
    float _2694 = _2620;
    float _2696 = _2630;
    float _2698 = _2632;
    float _2700 = _2634;
    float _2702 = _2636;
    float _2704 = _2638;
    float _2706 = _2640;
    float _2708 = _2642;
    float _2710 = _2644;
    float _2728;
    float _2730;
    float _2732;
    float _2734;
    if (!_2678)
    {
        bool _2712 = _2674 >= 3;
        bool _2714 = !_2712;
        if (!_2714)
        {
            bool _2716 = _2674 != 3;
            _2718 = _2716;
            if (!_2718)
            {
                float _2720 = _79 + _2614;
                float _2722 = _81 + _2616;
                float _2724 = _83 + _2618;
                float _2726 = _2620 + 1.0;
                _2688 = _2720;
                _2690 = _2722;
                _2692 = _2724;
                _2694 = _2726;
                _2728 = _2622;
                _2730 = _2624;
                _2732 = _2626;
                _2734 = _2628;
                _2736 = true;
            }
        }
        else
        {
            float _2738 = _79 + _2630;
            float _2740 = _81 + _2632;
            float _2742 = _83 + _2634;
            float _2744 = _2636 + 1.0;
            _2728 = _2622;
            _2730 = _2624;
            _2732 = _2626;
            _2734 = _2628;
            _2696 = _2738;
            _2698 = _2740;
            _2700 = _2742;
            _2702 = _2744;
            _2736 = true;
        }
    }
    if ((!_2736) || _2718)
    {
        bool _2746;
        if (!_2718)
        {
            _2746 = _2674 >= 1;
        }
        if ((!_2746) || _2718)
        {
            if (!_2718)
            {
                bool _2748 = _2674 != 0;
                if (!_2748)
                {
                    float _2750 = _79 + _2622;
                    _2680 = _2750;
                }
                float _2752 = _2680;
                _2728 = _2752;
                if (!_2748)
                {
                    float _2754 = _81 + _2624;
                    _2682 = _2754;
                }
                float _2756 = _2682;
                _2730 = _2756;
                if (!_2748)
                {
                    float _2758 = _83 + _2626;
                    _2684 = _2758;
                }
                float _2760 = _2684;
                _2732 = _2760;
                if (!_2748)
                {
                    float _2762 = _2628 + 1.0;
                    _2686 = _2762;
                }
                float _2764 = _2686;
                bool _2766 = !_2748;
                _2734 = _2764;
                _2736 = _2766;
            }
            if ((!_2736) || _2718)
            {
                _2718 = false;
                _2728 = _2622;
                _2730 = _2624;
                _2732 = _2626;
                _2734 = _2628;
                _2736 = true;
            }
        }
        else
        {
            float _2768 = _79 + _2638;
            float _2770 = _81 + _2640;
            float _2772 = _83 + _2642;
            float _2774 = _2644 + 1.0;
            _2728 = _2622;
            _2730 = _2624;
            _2732 = _2626;
            _2734 = _2628;
            _2704 = _2768;
            _2706 = _2770;
            _2708 = _2772;
            _2710 = _2774;
        }
    }
    _2736 = false;
    float _2776 = _2688;
    float _2778 = _2690;
    float _2780 = _2692;
    float _2782 = _2694;
    float _2784 = _2728;
    float _2786 = _2730;
    float _2788 = _2732;
    float _2790 = _2734;
    float _2792 = _2696;
    float _2794 = _2698;
    float _2796 = _2700;
    float _2798 = _2702;
    float _2800 = _2704;
    float _2802 = _2706;
    float _2804 = _2708;
    float _2806 = _2710;
    float _2808 = -_2481;
    float _2810 = _89 + _2808;
    float _2812 = -_2485;
    float _2814 = _87 + _2812;
    float _2816 = _2495 * _2810;
    float _2818 = -_2489;
    float _2820 = _91 + _2818;
    float _2822 = fma(_2499, _2814, _2816);
    float _2824 = fma(_2503, _2820, _2822);
    float _2826 = _2531 * _2824;
    float _2828 = rint(_2826);
    float _2830 = precise::max(0.0, _2828);
    float _2832 = precise::min(_2830, 3.0);
    float _2834 = trunc(_2832);
    int _2836 = int(_2834);
    bool _2838 = _2836 >= 2;
    bool _2840 = !_2838;
    float _2842 = as_type<float>(_2836);
    float _2844 = _2828;
    float _2846 = _2822;
    float _2848 = _2816;
    float _2850 = _2776;
    float _2852 = _2778;
    float _2854 = _2780;
    float _2856 = _2782;
    float _2858 = _2792;
    float _2860 = _2794;
    float _2862 = _2796;
    float _2864 = _2798;
    float _2866 = _2800;
    float _2868 = _2802;
    float _2870 = _2804;
    float _2872 = _2806;
    float _2890;
    float _2892;
    float _2894;
    float _2896;
    if (!_2840)
    {
        bool _2874 = _2836 >= 3;
        bool _2876 = !_2874;
        if (!_2876)
        {
            bool _2878 = _2836 != 3;
            _2880 = _2878;
            if (!_2880)
            {
                float _2882 = _87 + _2776;
                float _2884 = _89 + _2778;
                float _2886 = _91 + _2780;
                float _2888 = _2782 + 1.0;
                _2850 = _2882;
                _2852 = _2884;
                _2854 = _2886;
                _2856 = _2888;
                _2890 = _2784;
                _2892 = _2786;
                _2894 = _2788;
                _2896 = _2790;
                _2898 = true;
            }
        }
        else
        {
            float _2900 = _87 + _2792;
            float _2902 = _89 + _2794;
            float _2904 = _91 + _2796;
            float _2906 = _2798 + 1.0;
            _2890 = _2784;
            _2892 = _2786;
            _2894 = _2788;
            _2896 = _2790;
            _2858 = _2900;
            _2860 = _2902;
            _2862 = _2904;
            _2864 = _2906;
            _2898 = true;
        }
    }
    if ((!_2898) || _2880)
    {
        bool _2908;
        if (!_2880)
        {
            _2908 = _2836 >= 1;
        }
        if ((!_2908) || _2880)
        {
            if (!_2880)
            {
                bool _2910 = _2836 != 0;
                if (!_2910)
                {
                    float _2912 = _87 + _2784;
                    _2842 = _2912;
                }
                float _2914 = _2842;
                _2890 = _2914;
                if (!_2910)
                {
                    float _2916 = _89 + _2786;
                    _2844 = _2916;
                }
                float _2918 = _2844;
                _2892 = _2918;
                if (!_2910)
                {
                    float _2920 = _91 + _2788;
                    _2846 = _2920;
                }
                float _2922 = _2846;
                _2894 = _2922;
                if (!_2910)
                {
                    float _2924 = _2790 + 1.0;
                    _2848 = _2924;
                }
                float _2926 = _2848;
                bool _2928 = !_2910;
                _2896 = _2926;
                _2898 = _2928;
            }
            if ((!_2898) || _2880)
            {
                _2880 = false;
                _2890 = _2784;
                _2892 = _2786;
                _2894 = _2788;
                _2896 = _2790;
                _2898 = true;
            }
        }
        else
        {
            float _2930 = _87 + _2800;
            float _2932 = _89 + _2802;
            float _2934 = _91 + _2804;
            float _2936 = _2806 + 1.0;
            _2890 = _2784;
            _2892 = _2786;
            _2894 = _2788;
            _2896 = _2790;
            _2866 = _2930;
            _2868 = _2932;
            _2870 = _2934;
            _2872 = _2936;
        }
    }
    _2898 = false;
    float _2938 = _2850;
    float _2940 = _2852;
    float _2942 = _2854;
    float _2944 = _2856;
    float _2946 = _2890;
    float _2948 = _2892;
    float _2950 = _2894;
    float _2952 = _2896;
    float _2954 = _2858;
    float _2956 = _2860;
    float _2958 = _2862;
    float _2960 = _2864;
    float _2962 = _2866;
    float _2964 = _2868;
    float _2966 = _2870;
    float _2968 = _2872;
    float _2970 = -_2481;
    float _2972 = _97 + _2970;
    float _2974 = -_2485;
    float _2976 = _95 + _2974;
    float _2978 = _2495 * _2972;
    float _2980 = -_2489;
    float _2982 = _99 + _2980;
    float _2984 = fma(_2499, _2976, _2978);
    float _2986 = fma(_2503, _2982, _2984);
    float _2988 = _2531 * _2986;
    float _2990 = rint(_2988);
    float _2992 = precise::max(0.0, _2990);
    float _2994 = precise::min(_2992, 3.0);
    float _2996 = trunc(_2994);
    int _2998 = int(_2996);
    bool _3000 = _2998 >= 2;
    bool _3002 = !_3000;
    float _3004 = as_type<float>(_2998);
    float _3006 = _2990;
    float _3008 = _2984;
    float _3010 = _2978;
    float _3012 = _2938;
    float _3014 = _2940;
    float _3016 = _2942;
    float _3018 = _2944;
    float _3020 = _2954;
    float _3022 = _2956;
    float _3024 = _2958;
    float _3026 = _2960;
    float _3028 = _2962;
    float _3030 = _2964;
    float _3032 = _2966;
    float _3034 = _2968;
    float _3052;
    float _3054;
    float _3056;
    float _3058;
    if (!_3002)
    {
        bool _3036 = _2998 >= 3;
        bool _3038 = !_3036;
        if (!_3038)
        {
            bool _3040 = _2998 != 3;
            _3042 = _3040;
            if (!_3042)
            {
                float _3044 = _95 + _2938;
                float _3046 = _97 + _2940;
                float _3048 = _99 + _2942;
                float _3050 = _2944 + 1.0;
                _3012 = _3044;
                _3014 = _3046;
                _3016 = _3048;
                _3018 = _3050;
                _3052 = _2946;
                _3054 = _2948;
                _3056 = _2950;
                _3058 = _2952;
                _3060 = true;
            }
        }
        else
        {
            float _3062 = _95 + _2954;
            float _3064 = _97 + _2956;
            float _3066 = _99 + _2958;
            float _3068 = _2960 + 1.0;
            _3052 = _2946;
            _3054 = _2948;
            _3056 = _2950;
            _3058 = _2952;
            _3020 = _3062;
            _3022 = _3064;
            _3024 = _3066;
            _3026 = _3068;
            _3060 = true;
        }
    }
    if ((!_3060) || _3042)
    {
        bool _3070;
        if (!_3042)
        {
            _3070 = _2998 >= 1;
        }
        if ((!_3070) || _3042)
        {
            if (!_3042)
            {
                bool _3072 = _2998 != 0;
                if (!_3072)
                {
                    float _3074 = _95 + _2946;
                    _3004 = _3074;
                }
                float _3076 = _3004;
                _3052 = _3076;
                if (!_3072)
                {
                    float _3078 = _97 + _2948;
                    _3006 = _3078;
                }
                float _3080 = _3006;
                _3054 = _3080;
                if (!_3072)
                {
                    float _3082 = _99 + _2950;
                    _3008 = _3082;
                }
                float _3084 = _3008;
                _3056 = _3084;
                if (!_3072)
                {
                    float _3086 = _2952 + 1.0;
                    _3010 = _3086;
                }
                float _3088 = _3010;
                bool _3090 = !_3072;
                _3058 = _3088;
                _3060 = _3090;
            }
            if ((!_3060) || _3042)
            {
                _3042 = false;
                _3052 = _2946;
                _3054 = _2948;
                _3056 = _2950;
                _3058 = _2952;
                _3060 = true;
            }
        }
        else
        {
            float _3092 = _95 + _2962;
            float _3094 = _97 + _2964;
            float _3096 = _99 + _2966;
            float _3098 = _2968 + 1.0;
            _3052 = _2946;
            _3054 = _2948;
            _3056 = _2950;
            _3058 = _2952;
            _3028 = _3092;
            _3030 = _3094;
            _3032 = _3096;
            _3034 = _3098;
        }
    }
    _3060 = false;
    float _3100 = _3012;
    float _3102 = _3014;
    float _3104 = _3016;
    float _3106 = _3018;
    float _3108 = _3052;
    float _3110 = _3054;
    float _3112 = _3056;
    float _3114 = _3058;
    float _3116 = _3020;
    float _3118 = _3022;
    float _3120 = _3024;
    float _3122 = _3026;
    float _3124 = _3028;
    float _3126 = _3030;
    float _3128 = _3032;
    float _3130 = _3034;
    float _3132 = -_2481;
    float _3134 = _105 + _3132;
    float _3136 = -_2485;
    float _3138 = _103 + _3136;
    float _3140 = _2495 * _3134;
    float _3142 = -_2489;
    float _3144 = _107 + _3142;
    float _3146 = fma(_2499, _3138, _3140);
    float _3148 = fma(_2503, _3144, _3146);
    float _3150 = _2531 * _3148;
    float _3152 = rint(_3150);
    float _3154 = precise::max(0.0, _3152);
    float _3156 = precise::min(_3154, 3.0);
    float _3158 = trunc(_3156);
    int _3160 = int(_3158);
    bool _3162 = _3160 >= 2;
    bool _3164 = !_3162;
    float _3166 = as_type<float>(_3160);
    float _3168 = _3152;
    float _3170 = _3146;
    float _3172 = _3140;
    float _3174 = _3100;
    float _3176 = _3102;
    float _3178 = _3104;
    float _3180 = _3106;
    float _3182 = _3116;
    float _3184 = _3118;
    float _3186 = _3120;
    float _3188 = _3122;
    float _3190 = _3124;
    float _3192 = _3126;
    float _3194 = _3128;
    float _3196 = _3130;
    float _3214;
    float _3216;
    float _3218;
    float _3220;
    if (!_3164)
    {
        bool _3198 = _3160 >= 3;
        bool _3200 = !_3198;
        if (!_3200)
        {
            bool _3202 = _3160 != 3;
            _3204 = _3202;
            if (!_3204)
            {
                float _3206 = _103 + _3100;
                float _3208 = _105 + _3102;
                float _3210 = _107 + _3104;
                float _3212 = _3106 + 1.0;
                _3174 = _3206;
                _3176 = _3208;
                _3178 = _3210;
                _3180 = _3212;
                _3214 = _3108;
                _3216 = _3110;
                _3218 = _3112;
                _3220 = _3114;
                _3222 = true;
            }
        }
        else
        {
            float _3224 = _103 + _3116;
            float _3226 = _105 + _3118;
            float _3228 = _107 + _3120;
            float _3230 = _3122 + 1.0;
            _3214 = _3108;
            _3216 = _3110;
            _3218 = _3112;
            _3220 = _3114;
            _3182 = _3224;
            _3184 = _3226;
            _3186 = _3228;
            _3188 = _3230;
            _3222 = true;
        }
    }
    if ((!_3222) || _3204)
    {
        bool _3232;
        if (!_3204)
        {
            _3232 = _3160 >= 1;
        }
        if ((!_3232) || _3204)
        {
            if (!_3204)
            {
                bool _3234 = _3160 != 0;
                if (!_3234)
                {
                    float _3236 = _103 + _3108;
                    _3166 = _3236;
                }
                float _3238 = _3166;
                _3214 = _3238;
                if (!_3234)
                {
                    float _3240 = _105 + _3110;
                    _3168 = _3240;
                }
                float _3242 = _3168;
                _3216 = _3242;
                if (!_3234)
                {
                    float _3244 = _107 + _3112;
                    _3170 = _3244;
                }
                float _3246 = _3170;
                _3218 = _3246;
                if (!_3234)
                {
                    float _3248 = _3114 + 1.0;
                    _3172 = _3248;
                }
                float _3250 = _3172;
                bool _3252 = !_3234;
                _3220 = _3250;
                _3222 = _3252;
            }
            if ((!_3222) || _3204)
            {
                _3204 = false;
                _3214 = _3108;
                _3216 = _3110;
                _3218 = _3112;
                _3220 = _3114;
                _3222 = true;
            }
        }
        else
        {
            float _3254 = _103 + _3124;
            float _3256 = _105 + _3126;
            float _3258 = _107 + _3128;
            float _3260 = _3130 + 1.0;
            _3214 = _3108;
            _3216 = _3110;
            _3218 = _3112;
            _3220 = _3114;
            _3190 = _3254;
            _3192 = _3256;
            _3194 = _3258;
            _3196 = _3260;
        }
    }
    _3222 = false;
    float _3262 = _3174;
    float _3264 = _3176;
    float _3266 = _3178;
    float _3268 = _3180;
    float _3270 = _3214;
    float _3272 = _3216;
    float _3274 = _3218;
    float _3276 = _3220;
    float _3278 = _3182;
    float _3280 = _3184;
    float _3282 = _3186;
    float _3284 = _3188;
    float _3286 = _3190;
    float _3288 = _3192;
    float _3290 = _3194;
    float _3292 = _3196;
    float _3294 = -_2481;
    float _3296 = _113 + _3294;
    float _3298 = -_2485;
    float _3300 = _111 + _3298;
    float _3302 = _2495 * _3296;
    float _3304 = -_2489;
    float _3306 = _115 + _3304;
    float _3308 = fma(_2499, _3300, _3302);
    float _3310 = fma(_2503, _3306, _3308);
    float _3312 = _2531 * _3310;
    float _3314 = rint(_3312);
    float _3316 = precise::max(0.0, _3314);
    float _3318 = precise::min(_3316, 3.0);
    float _3320 = trunc(_3318);
    int _3322 = int(_3320);
    bool _3324 = _3322 >= 2;
    bool _3326 = !_3324;
    float _3328 = as_type<float>(_3322);
    float _3330 = _3314;
    float _3332 = _3308;
    float _3334 = _3302;
    float _3336 = _3262;
    float _3338 = _3264;
    float _3340 = _3266;
    float _3342 = _3268;
    float _3344 = _3278;
    float _3346 = _3280;
    float _3348 = _3282;
    float _3350 = _3284;
    float _3352 = _3286;
    float _3354 = _3288;
    float _3356 = _3290;
    float _3358 = _3292;
    float _3376;
    float _3378;
    float _3380;
    float _3382;
    if (!_3326)
    {
        bool _3360 = _3322 >= 3;
        bool _3362 = !_3360;
        if (!_3362)
        {
            bool _3364 = _3322 != 3;
            _3366 = _3364;
            if (!_3366)
            {
                float _3368 = _111 + _3262;
                float _3370 = _113 + _3264;
                float _3372 = _115 + _3266;
                float _3374 = _3268 + 1.0;
                _3336 = _3368;
                _3338 = _3370;
                _3340 = _3372;
                _3342 = _3374;
                _3376 = _3270;
                _3378 = _3272;
                _3380 = _3274;
                _3382 = _3276;
                _3384 = true;
            }
        }
        else
        {
            float _3386 = _111 + _3278;
            float _3388 = _113 + _3280;
            float _3390 = _115 + _3282;
            float _3392 = _3284 + 1.0;
            _3376 = _3270;
            _3378 = _3272;
            _3380 = _3274;
            _3382 = _3276;
            _3344 = _3386;
            _3346 = _3388;
            _3348 = _3390;
            _3350 = _3392;
            _3384 = true;
        }
    }
    if ((!_3384) || _3366)
    {
        bool _3394;
        if (!_3366)
        {
            _3394 = _3322 >= 1;
        }
        if ((!_3394) || _3366)
        {
            if (!_3366)
            {
                bool _3396 = _3322 != 0;
                if (!_3396)
                {
                    float _3398 = _111 + _3270;
                    _3328 = _3398;
                }
                float _3400 = _3328;
                _3376 = _3400;
                if (!_3396)
                {
                    float _3402 = _113 + _3272;
                    _3330 = _3402;
                }
                float _3404 = _3330;
                _3378 = _3404;
                if (!_3396)
                {
                    float _3406 = _115 + _3274;
                    _3332 = _3406;
                }
                float _3408 = _3332;
                _3380 = _3408;
                if (!_3396)
                {
                    float _3410 = _3276 + 1.0;
                    _3334 = _3410;
                }
                float _3412 = _3334;
                bool _3414 = !_3396;
                _3382 = _3412;
                _3384 = _3414;
            }
            if ((!_3384) || _3366)
            {
                _3366 = false;
                _3376 = _3270;
                _3378 = _3272;
                _3380 = _3274;
                _3382 = _3276;
                _3384 = true;
            }
        }
        else
        {
            float _3416 = _111 + _3286;
            float _3418 = _113 + _3288;
            float _3420 = _115 + _3290;
            float _3422 = _3292 + 1.0;
            _3376 = _3270;
            _3378 = _3272;
            _3380 = _3274;
            _3382 = _3276;
            _3352 = _3416;
            _3354 = _3418;
            _3356 = _3420;
            _3358 = _3422;
        }
    }
    _3384 = false;
    float _3424 = _3336;
    float _3426 = _3338;
    float _3428 = _3340;
    float _3430 = _3342;
    float _3432 = _3376;
    float _3434 = _3378;
    float _3436 = _3380;
    float _3438 = _3382;
    float _3440 = _3344;
    float _3442 = _3346;
    float _3444 = _3348;
    float _3446 = _3350;
    float _3448 = _3352;
    float _3450 = _3354;
    float _3452 = _3356;
    float _3454 = _3358;
    float _3456 = -_2481;
    float _3458 = _121 + _3456;
    float _3460 = -_2485;
    float _3462 = _119 + _3460;
    float _3464 = _2495 * _3458;
    float _3466 = -_2489;
    float _3468 = _123 + _3466;
    float _3470 = fma(_2499, _3462, _3464);
    float _3472 = fma(_2503, _3468, _3470);
    float _3474 = _2531 * _3472;
    float _3476 = rint(_3474);
    float _3478 = precise::max(0.0, _3476);
    float _3480 = precise::min(_3478, 3.0);
    float _3482 = trunc(_3480);
    int _3484 = int(_3482);
    bool _3486 = _3484 >= 2;
    bool _3488 = !_3486;
    float _3490 = as_type<float>(_3484);
    float _3492 = _3476;
    float _3494 = _3470;
    float _3496 = _3464;
    float _3498 = _3424;
    float _3500 = _3426;
    float _3502 = _3428;
    float _3504 = _3430;
    float _3506 = _3440;
    float _3508 = _3442;
    float _3510 = _3444;
    float _3512 = _3446;
    float _3514 = _3448;
    float _3516 = _3450;
    float _3518 = _3452;
    float _3520 = _3454;
    float _3538;
    float _3540;
    float _3542;
    float _3544;
    if (!_3488)
    {
        bool _3522 = _3484 >= 3;
        bool _3524 = !_3522;
        if (!_3524)
        {
            bool _3526 = _3484 != 3;
            _3528 = _3526;
            if (!_3528)
            {
                float _3530 = _119 + _3424;
                float _3532 = _121 + _3426;
                float _3534 = _123 + _3428;
                float _3536 = _3430 + 1.0;
                _3498 = _3530;
                _3500 = _3532;
                _3502 = _3534;
                _3504 = _3536;
                _3538 = _3432;
                _3540 = _3434;
                _3542 = _3436;
                _3544 = _3438;
                _3546 = true;
            }
        }
        else
        {
            float _3548 = _119 + _3440;
            float _3550 = _121 + _3442;
            float _3552 = _123 + _3444;
            float _3554 = _3446 + 1.0;
            _3538 = _3432;
            _3540 = _3434;
            _3542 = _3436;
            _3544 = _3438;
            _3506 = _3548;
            _3508 = _3550;
            _3510 = _3552;
            _3512 = _3554;
            _3546 = true;
        }
    }
    if ((!_3546) || _3528)
    {
        bool _3556;
        if (!_3528)
        {
            _3556 = _3484 >= 1;
        }
        if ((!_3556) || _3528)
        {
            if (!_3528)
            {
                bool _3558 = _3484 != 0;
                if (!_3558)
                {
                    float _3560 = _119 + _3432;
                    _3490 = _3560;
                }
                float _3562 = _3490;
                _3538 = _3562;
                if (!_3558)
                {
                    float _3564 = _121 + _3434;
                    _3492 = _3564;
                }
                float _3566 = _3492;
                _3540 = _3566;
                if (!_3558)
                {
                    float _3568 = _123 + _3436;
                    _3494 = _3568;
                }
                float _3570 = _3494;
                _3542 = _3570;
                if (!_3558)
                {
                    float _3572 = _3438 + 1.0;
                    _3496 = _3572;
                }
                float _3574 = _3496;
                bool _3576 = !_3558;
                _3544 = _3574;
                _3546 = _3576;
            }
            if ((!_3546) || _3528)
            {
                _3528 = false;
                _3538 = _3432;
                _3540 = _3434;
                _3542 = _3436;
                _3544 = _3438;
                _3546 = true;
            }
        }
        else
        {
            float _3578 = _119 + _3448;
            float _3580 = _121 + _3450;
            float _3582 = _123 + _3452;
            float _3584 = _3454 + 1.0;
            _3538 = _3432;
            _3540 = _3434;
            _3542 = _3436;
            _3544 = _3438;
            _3514 = _3578;
            _3516 = _3580;
            _3518 = _3582;
            _3520 = _3584;
        }
    }
    _3546 = false;
    float _3586 = _3498;
    float _3588 = _3500;
    float _3590 = _3502;
    float _3592 = _3504;
    float _3594 = _3538;
    float _3596 = _3540;
    float _3598 = _3542;
    float _3600 = _3544;
    float _3602 = _3506;
    float _3604 = _3508;
    float _3606 = _3510;
    float _3608 = _3512;
    float _3610 = _3514;
    float _3612 = _3516;
    float _3614 = _3518;
    float _3616 = _3520;
    float _3618 = -_2481;
    float _3620 = _129 + _3618;
    float _3622 = -_2485;
    float _3624 = _127 + _3622;
    float _3626 = _2495 * _3620;
    float _3628 = -_2489;
    float _3630 = _131 + _3628;
    float _3632 = fma(_2499, _3624, _3626);
    float _3634 = fma(_2503, _3630, _3632);
    float _3636 = _2531 * _3634;
    float _3638 = rint(_3636);
    float _3640 = precise::max(0.0, _3638);
    float _3642 = precise::min(_3640, 3.0);
    float _3644 = trunc(_3642);
    int _3646 = int(_3644);
    bool _3648 = _3646 >= 2;
    bool _3650 = !_3648;
    float _3652 = as_type<float>(_3646);
    float _3654 = _3638;
    float _3656 = _3632;
    float _3658 = _3626;
    float _3660 = _3586;
    float _3662 = _3588;
    float _3664 = _3590;
    float _3666 = _3592;
    float _3668 = _3602;
    float _3670 = _3604;
    float _3672 = _3606;
    float _3674 = _3608;
    float _3676 = _3610;
    float _3678 = _3612;
    float _3680 = _3614;
    float _3682 = _3616;
    float _3700;
    float _3702;
    float _3704;
    float _3706;
    if (!_3650)
    {
        bool _3684 = _3646 >= 3;
        bool _3686 = !_3684;
        if (!_3686)
        {
            bool _3688 = _3646 != 3;
            _3690 = _3688;
            if (!_3690)
            {
                float _3692 = _127 + _3586;
                float _3694 = _129 + _3588;
                float _3696 = _131 + _3590;
                float _3698 = _3592 + 1.0;
                _3660 = _3692;
                _3662 = _3694;
                _3664 = _3696;
                _3666 = _3698;
                _3700 = _3594;
                _3702 = _3596;
                _3704 = _3598;
                _3706 = _3600;
                _3708 = true;
            }
        }
        else
        {
            float _3710 = _127 + _3602;
            float _3712 = _129 + _3604;
            float _3714 = _131 + _3606;
            float _3716 = _3608 + 1.0;
            _3700 = _3594;
            _3702 = _3596;
            _3704 = _3598;
            _3706 = _3600;
            _3668 = _3710;
            _3670 = _3712;
            _3672 = _3714;
            _3674 = _3716;
            _3708 = true;
        }
    }
    if ((!_3708) || _3690)
    {
        bool _3718;
        if (!_3690)
        {
            _3718 = _3646 >= 1;
        }
        if ((!_3718) || _3690)
        {
            if (!_3690)
            {
                bool _3720 = _3646 != 0;
                if (!_3720)
                {
                    float _3722 = _127 + _3594;
                    _3652 = _3722;
                }
                float _3724 = _3652;
                _3700 = _3724;
                if (!_3720)
                {
                    float _3726 = _129 + _3596;
                    _3654 = _3726;
                }
                float _3728 = _3654;
                _3702 = _3728;
                if (!_3720)
                {
                    float _3730 = _131 + _3598;
                    _3656 = _3730;
                }
                float _3732 = _3656;
                _3704 = _3732;
                if (!_3720)
                {
                    float _3734 = _3600 + 1.0;
                    _3658 = _3734;
                }
                float _3736 = _3658;
                bool _3738 = !_3720;
                _3706 = _3736;
                _3708 = _3738;
            }
            if ((!_3708) || _3690)
            {
                _3690 = false;
                _3700 = _3594;
                _3702 = _3596;
                _3704 = _3598;
                _3706 = _3600;
                _3708 = true;
            }
        }
        else
        {
            float _3740 = _127 + _3610;
            float _3742 = _129 + _3612;
            float _3744 = _131 + _3614;
            float _3746 = _3616 + 1.0;
            _3700 = _3594;
            _3702 = _3596;
            _3704 = _3598;
            _3706 = _3600;
            _3676 = _3740;
            _3678 = _3742;
            _3680 = _3744;
            _3682 = _3746;
        }
    }
    _3708 = false;
    float _3748 = _3660;
    float _3750 = _3662;
    float _3752 = _3664;
    float _3754 = _3666;
    float _3756 = _3700;
    float _3758 = _3702;
    float _3760 = _3704;
    float _3762 = _3706;
    float _3764 = _3668;
    float _3766 = _3670;
    float _3768 = _3672;
    float _3770 = _3674;
    float _3772 = _3676;
    float _3774 = _3678;
    float _3776 = _3680;
    float _3778 = _3682;
    float _3780 = -_2481;
    float _3782 = _137 + _3780;
    float _3784 = -_2485;
    float _3786 = _135 + _3784;
    float _3788 = _2495 * _3782;
    float _3790 = -_2489;
    float _3792 = _139 + _3790;
    float _3794 = fma(_2499, _3786, _3788);
    float _3796 = fma(_2503, _3792, _3794);
    float _3798 = _2531 * _3796;
    float _3800 = rint(_3798);
    float _3802 = precise::max(0.0, _3800);
    float _3804 = precise::min(_3802, 3.0);
    float _3806 = trunc(_3804);
    int _3808 = int(_3806);
    bool _3810 = _3808 >= 2;
    bool _3812 = !_3810;
    float _3814 = as_type<float>(_3808);
    float _3816 = _3800;
    float _3818 = _3794;
    float _3820 = _3788;
    float _3822 = _3748;
    float _3824 = _3750;
    float _3826 = _3752;
    float _3828 = _3754;
    float _3830 = _3764;
    float _3832 = _3766;
    float _3834 = _3768;
    float _3836 = _3770;
    float _3838 = _3772;
    float _3840 = _3774;
    float _3842 = _3776;
    float _3844 = _3778;
    float _3862;
    float _3864;
    float _3866;
    float _3868;
    if (!_3812)
    {
        bool _3846 = _3808 >= 3;
        bool _3848 = !_3846;
        if (!_3848)
        {
            bool _3850 = _3808 != 3;
            _3852 = _3850;
            if (!_3852)
            {
                float _3854 = _135 + _3748;
                float _3856 = _137 + _3750;
                float _3858 = _139 + _3752;
                float _3860 = _3754 + 1.0;
                _3822 = _3854;
                _3824 = _3856;
                _3826 = _3858;
                _3828 = _3860;
                _3862 = _3756;
                _3864 = _3758;
                _3866 = _3760;
                _3868 = _3762;
                _3870 = true;
            }
        }
        else
        {
            float _3872 = _135 + _3764;
            float _3874 = _137 + _3766;
            float _3876 = _139 + _3768;
            float _3878 = _3770 + 1.0;
            _3862 = _3756;
            _3864 = _3758;
            _3866 = _3760;
            _3868 = _3762;
            _3830 = _3872;
            _3832 = _3874;
            _3834 = _3876;
            _3836 = _3878;
            _3870 = true;
        }
    }
    if ((!_3870) || _3852)
    {
        bool _3880;
        if (!_3852)
        {
            _3880 = _3808 >= 1;
        }
        if ((!_3880) || _3852)
        {
            if (!_3852)
            {
                bool _3882 = _3808 != 0;
                if (!_3882)
                {
                    float _3884 = _135 + _3756;
                    _3814 = _3884;
                }
                float _3886 = _3814;
                _3862 = _3886;
                if (!_3882)
                {
                    float _3888 = _137 + _3758;
                    _3816 = _3888;
                }
                float _3890 = _3816;
                _3864 = _3890;
                if (!_3882)
                {
                    float _3892 = _139 + _3760;
                    _3818 = _3892;
                }
                float _3894 = _3818;
                _3866 = _3894;
                if (!_3882)
                {
                    float _3896 = _3762 + 1.0;
                    _3820 = _3896;
                }
                float _3898 = _3820;
                bool _3900 = !_3882;
                _3868 = _3898;
                _3870 = _3900;
            }
            if ((!_3870) || _3852)
            {
                _3852 = false;
                _3862 = _3756;
                _3864 = _3758;
                _3866 = _3760;
                _3868 = _3762;
                _3870 = true;
            }
        }
        else
        {
            float _3902 = _135 + _3772;
            float _3904 = _137 + _3774;
            float _3906 = _139 + _3776;
            float _3908 = _3778 + 1.0;
            _3862 = _3756;
            _3864 = _3758;
            _3866 = _3760;
            _3868 = _3762;
            _3838 = _3902;
            _3840 = _3904;
            _3842 = _3906;
            _3844 = _3908;
        }
    }
    _3870 = false;
    float _3910 = _3822;
    float _3912 = _3824;
    float _3914 = _3826;
    float _3916 = _3828;
    float _3918 = _3862;
    float _3920 = _3864;
    float _3922 = _3866;
    float _3924 = _3868;
    float _3926 = _3830;
    float _3928 = _3832;
    float _3930 = _3834;
    float _3932 = _3836;
    float _3934 = _3838;
    float _3936 = _3840;
    float _3938 = _3842;
    float _3940 = _3844;
    float _3942 = -_2481;
    float _3944 = _145 + _3942;
    float _3946 = -_2485;
    float _3948 = _143 + _3946;
    float _3950 = _2495 * _3944;
    float _3952 = -_2489;
    float _3954 = _147 + _3952;
    float _3956 = fma(_2499, _3948, _3950);
    float _3958 = fma(_2503, _3954, _3956);
    float _3960 = _2531 * _3958;
    float _3962 = rint(_3960);
    float _3964 = precise::max(0.0, _3962);
    float _3966 = precise::min(_3964, 3.0);
    float _3968 = trunc(_3966);
    int _3970 = int(_3968);
    bool _3972 = _3970 >= 2;
    bool _3974 = !_3972;
    float _3976 = as_type<float>(_3970);
    float _3978 = _3962;
    float _3980 = _3956;
    float _3982 = _3950;
    float _3984 = _3910;
    float _3986 = _3912;
    float _3988 = _3914;
    float _3990 = _3916;
    float _3992 = _3926;
    float _3994 = _3928;
    float _3996 = _3930;
    float _3998 = _3932;
    float _4000 = _3934;
    float _4002 = _3936;
    float _4004 = _3938;
    float _4006 = _3940;
    float _4024;
    float _4026;
    float _4028;
    float _4030;
    if (!_3974)
    {
        bool _4008 = _3970 >= 3;
        bool _4010 = !_4008;
        if (!_4010)
        {
            bool _4012 = _3970 != 3;
            _4014 = _4012;
            if (!_4014)
            {
                float _4016 = _143 + _3910;
                float _4018 = _145 + _3912;
                float _4020 = _147 + _3914;
                float _4022 = _3916 + 1.0;
                _3984 = _4016;
                _3986 = _4018;
                _3988 = _4020;
                _3990 = _4022;
                _4024 = _3918;
                _4026 = _3920;
                _4028 = _3922;
                _4030 = _3924;
                _4032 = true;
            }
        }
        else
        {
            float _4034 = _143 + _3926;
            float _4036 = _145 + _3928;
            float _4038 = _147 + _3930;
            float _4040 = _3932 + 1.0;
            _4024 = _3918;
            _4026 = _3920;
            _4028 = _3922;
            _4030 = _3924;
            _3992 = _4034;
            _3994 = _4036;
            _3996 = _4038;
            _3998 = _4040;
            _4032 = true;
        }
    }
    if ((!_4032) || _4014)
    {
        bool _4042;
        if (!_4014)
        {
            _4042 = _3970 >= 1;
        }
        if ((!_4042) || _4014)
        {
            if (!_4014)
            {
                bool _4044 = _3970 != 0;
                if (!_4044)
                {
                    float _4046 = _143 + _3918;
                    _3976 = _4046;
                }
                float _4048 = _3976;
                _4024 = _4048;
                if (!_4044)
                {
                    float _4050 = _145 + _3920;
                    _3978 = _4050;
                }
                float _4052 = _3978;
                _4026 = _4052;
                if (!_4044)
                {
                    float _4054 = _147 + _3922;
                    _3980 = _4054;
                }
                float _4056 = _3980;
                _4028 = _4056;
                if (!_4044)
                {
                    float _4058 = _3924 + 1.0;
                    _3982 = _4058;
                }
                float _4060 = _3982;
                bool _4062 = !_4044;
                _4030 = _4060;
                _4032 = _4062;
            }
            if ((!_4032) || _4014)
            {
                _4014 = false;
                _4024 = _3918;
                _4026 = _3920;
                _4028 = _3922;
                _4030 = _3924;
                _4032 = true;
            }
        }
        else
        {
            float _4064 = _143 + _3934;
            float _4066 = _145 + _3936;
            float _4068 = _147 + _3938;
            float _4070 = _3940 + 1.0;
            _4024 = _3918;
            _4026 = _3920;
            _4028 = _3922;
            _4030 = _3924;
            _4000 = _4064;
            _4002 = _4066;
            _4004 = _4068;
            _4006 = _4070;
        }
    }
    _4032 = false;
    float _4072 = _3984;
    float _4074 = _3986;
    float _4076 = _3988;
    float _4078 = _3990;
    float _4080 = _4024;
    float _4082 = _4026;
    float _4084 = _4028;
    float _4086 = _4030;
    float _4088 = _3992;
    float _4090 = _3994;
    float _4092 = _3996;
    float _4094 = _3998;
    float _4096 = _4000;
    float _4098 = _4002;
    float _4100 = _4004;
    float _4102 = _4006;
    float _4104 = -_2481;
    float _4106 = _153 + _4104;
    float _4108 = -_2485;
    float _4110 = _151 + _4108;
    float _4112 = _2495 * _4106;
    float _4114 = -_2489;
    float _4116 = _155 + _4114;
    float _4118 = fma(_2499, _4110, _4112);
    float _4120 = fma(_2503, _4116, _4118);
    float _4122 = _2531 * _4120;
    float _4124 = rint(_4122);
    float _4126 = precise::max(0.0, _4124);
    float _4128 = precise::min(_4126, 3.0);
    float _4130 = trunc(_4128);
    int _4132 = int(_4130);
    bool _4134 = _4132 >= 2;
    bool _4136 = !_4134;
    float _4138 = as_type<float>(_4132);
    float _4140 = _4124;
    float _4142 = _4118;
    float _4144 = _4112;
    float _4146 = _4072;
    float _4148 = _4074;
    float _4150 = _4076;
    float _4152 = _4078;
    float _4154 = _4088;
    float _4156 = _4090;
    float _4158 = _4092;
    float _4160 = _4094;
    float _4162 = _4096;
    float _4164 = _4098;
    float _4166 = _4100;
    float _4168 = _4102;
    float _4186;
    float _4188;
    float _4190;
    float _4192;
    if (!_4136)
    {
        bool _4170 = _4132 >= 3;
        bool _4172 = !_4170;
        if (!_4172)
        {
            bool _4174 = _4132 != 3;
            _4176 = _4174;
            if (!_4176)
            {
                float _4178 = _151 + _4072;
                float _4180 = _153 + _4074;
                float _4182 = _155 + _4076;
                float _4184 = _4078 + 1.0;
                _4146 = _4178;
                _4148 = _4180;
                _4150 = _4182;
                _4152 = _4184;
                _4186 = _4080;
                _4188 = _4082;
                _4190 = _4084;
                _4192 = _4086;
                _4194 = true;
            }
        }
        else
        {
            float _4196 = _151 + _4088;
            float _4198 = _153 + _4090;
            float _4200 = _155 + _4092;
            float _4202 = _4094 + 1.0;
            _4186 = _4080;
            _4188 = _4082;
            _4190 = _4084;
            _4192 = _4086;
            _4154 = _4196;
            _4156 = _4198;
            _4158 = _4200;
            _4160 = _4202;
            _4194 = true;
        }
    }
    if ((!_4194) || _4176)
    {
        bool _4204;
        if (!_4176)
        {
            _4204 = _4132 >= 1;
        }
        if ((!_4204) || _4176)
        {
            if (!_4176)
            {
                bool _4206 = _4132 != 0;
                if (!_4206)
                {
                    float _4208 = _151 + _4080;
                    _4138 = _4208;
                }
                float _4210 = _4138;
                _4186 = _4210;
                if (!_4206)
                {
                    float _4212 = _153 + _4082;
                    _4140 = _4212;
                }
                float _4214 = _4140;
                _4188 = _4214;
                if (!_4206)
                {
                    float _4216 = _155 + _4084;
                    _4142 = _4216;
                }
                float _4218 = _4142;
                _4190 = _4218;
                if (!_4206)
                {
                    float _4220 = _4086 + 1.0;
                    _4144 = _4220;
                }
                float _4222 = _4144;
                bool _4224 = !_4206;
                _4192 = _4222;
                _4194 = _4224;
            }
            if ((!_4194) || _4176)
            {
                _4176 = false;
                _4186 = _4080;
                _4188 = _4082;
                _4190 = _4084;
                _4192 = _4086;
                _4194 = true;
            }
        }
        else
        {
            float _4226 = _151 + _4096;
            float _4228 = _153 + _4098;
            float _4230 = _155 + _4100;
            float _4232 = _4102 + 1.0;
            _4186 = _4080;
            _4188 = _4082;
            _4190 = _4084;
            _4192 = _4086;
            _4162 = _4226;
            _4164 = _4228;
            _4166 = _4230;
            _4168 = _4232;
        }
    }
    _4194 = false;
    float _4234 = _4146;
    float _4236 = _4148;
    float _4238 = _4150;
    float _4240 = _4152;
    float _4242 = _4186;
    float _4244 = _4188;
    float _4246 = _4190;
    float _4248 = _4192;
    float _4250 = _4154;
    float _4252 = _4156;
    float _4254 = _4158;
    float _4256 = _4160;
    float _4258 = _4162;
    float _4260 = _4164;
    float _4262 = _4166;
    float _4264 = _4168;
    float _4266 = -_2481;
    float _4268 = _161 + _4266;
    float _4270 = -_2485;
    float _4272 = _159 + _4270;
    float _4274 = _2495 * _4268;
    float _4276 = -_2489;
    float _4278 = _163 + _4276;
    float _4280 = fma(_2499, _4272, _4274);
    float _4282 = fma(_2503, _4278, _4280);
    float _4284 = _2531 * _4282;
    float _4286 = rint(_4284);
    float _4288 = precise::max(0.0, _4286);
    float _4290 = precise::min(_4288, 3.0);
    float _4292 = trunc(_4290);
    int _4294 = int(_4292);
    bool _4296 = _4294 >= 2;
    bool _4298 = !_4296;
    float _4300 = as_type<float>(_4294);
    float _4302 = _4286;
    float _4304 = _4280;
    float _4306 = _4274;
    float _4308 = _4234;
    float _4310 = _4236;
    float _4312 = _4238;
    float _4314 = _4240;
    float _4316 = _4250;
    float _4318 = _4252;
    float _4320 = _4254;
    float _4322 = _4256;
    float _4324 = _4258;
    float _4326 = _4260;
    float _4328 = _4262;
    float _4330 = _4264;
    float _4348;
    float _4350;
    float _4352;
    float _4354;
    if (!_4298)
    {
        bool _4332 = _4294 >= 3;
        bool _4334 = !_4332;
        if (!_4334)
        {
            bool _4336 = _4294 != 3;
            _4338 = _4336;
            if (!_4338)
            {
                float _4340 = _159 + _4234;
                float _4342 = _161 + _4236;
                float _4344 = _163 + _4238;
                float _4346 = _4240 + 1.0;
                _4308 = _4340;
                _4310 = _4342;
                _4312 = _4344;
                _4314 = _4346;
                _4348 = _4242;
                _4350 = _4244;
                _4352 = _4246;
                _4354 = _4248;
                _4356 = true;
            }
        }
        else
        {
            float _4358 = _159 + _4250;
            float _4360 = _161 + _4252;
            float _4362 = _163 + _4254;
            float _4364 = _4256 + 1.0;
            _4348 = _4242;
            _4350 = _4244;
            _4352 = _4246;
            _4354 = _4248;
            _4316 = _4358;
            _4318 = _4360;
            _4320 = _4362;
            _4322 = _4364;
            _4356 = true;
        }
    }
    if ((!_4356) || _4338)
    {
        bool _4366;
        if (!_4338)
        {
            _4366 = _4294 >= 1;
        }
        if ((!_4366) || _4338)
        {
            if (!_4338)
            {
                bool _4368 = _4294 != 0;
                if (!_4368)
                {
                    float _4370 = _159 + _4242;
                    _4300 = _4370;
                }
                float _4372 = _4300;
                _4348 = _4372;
                if (!_4368)
                {
                    float _4374 = _161 + _4244;
                    _4302 = _4374;
                }
                float _4376 = _4302;
                _4350 = _4376;
                if (!_4368)
                {
                    float _4378 = _163 + _4246;
                    _4304 = _4378;
                }
                float _4380 = _4304;
                _4352 = _4380;
                if (!_4368)
                {
                    float _4382 = _4248 + 1.0;
                    _4306 = _4382;
                }
                float _4384 = _4306;
                bool _4386 = !_4368;
                _4354 = _4384;
                _4356 = _4386;
            }
            if ((!_4356) || _4338)
            {
                _4338 = false;
                _4348 = _4242;
                _4350 = _4244;
                _4352 = _4246;
                _4354 = _4248;
                _4356 = true;
            }
        }
        else
        {
            float _4388 = _159 + _4258;
            float _4390 = _161 + _4260;
            float _4392 = _163 + _4262;
            float _4394 = _4264 + 1.0;
            _4348 = _4242;
            _4350 = _4244;
            _4352 = _4246;
            _4354 = _4248;
            _4324 = _4388;
            _4326 = _4390;
            _4328 = _4392;
            _4330 = _4394;
        }
    }
    _4356 = false;
    float _4396 = _4308;
    float _4398 = _4310;
    float _4400 = _4312;
    float _4402 = _4314;
    float _4404 = _4348;
    float _4406 = _4350;
    float _4408 = _4352;
    float _4410 = _4354;
    float _4412 = _4316;
    float _4414 = _4318;
    float _4416 = _4320;
    float _4418 = _4322;
    float _4420 = _4324;
    float _4422 = _4326;
    float _4424 = _4328;
    float _4426 = _4330;
    float _4428 = -_2481;
    float _4430 = _169 + _4428;
    float _4432 = -_2485;
    float _4434 = _167 + _4432;
    float _4436 = _2495 * _4430;
    float _4438 = -_2489;
    float _4440 = _171 + _4438;
    float _4442 = fma(_2499, _4434, _4436);
    float _4444 = fma(_2503, _4440, _4442);
    float _4446 = _2531 * _4444;
    float _4448 = rint(_4446);
    float _4450 = precise::max(0.0, _4448);
    float _4452 = precise::min(_4450, 3.0);
    float _4454 = trunc(_4452);
    int _4456 = int(_4454);
    bool _4458 = _4456 >= 2;
    bool _4460 = !_4458;
    float _4462 = as_type<float>(_4456);
    float _4464 = _4448;
    float _4466 = _4442;
    float _4468 = _4436;
    float _4470 = _4396;
    float _4472 = _4398;
    float _4474 = _4400;
    float _4476 = _4402;
    float _4478 = _4412;
    float _4480 = _4414;
    float _4482 = _4416;
    float _4484 = _4418;
    float _4486 = _4420;
    float _4488 = _4422;
    float _4490 = _4424;
    float _4492 = _4426;
    float _4510;
    float _4512;
    float _4514;
    float _4516;
    if (!_4460)
    {
        bool _4494 = _4456 >= 3;
        bool _4496 = !_4494;
        if (!_4496)
        {
            bool _4498 = _4456 != 3;
            _4500 = _4498;
            if (!_4500)
            {
                float _4502 = _167 + _4396;
                float _4504 = _169 + _4398;
                float _4506 = _171 + _4400;
                float _4508 = _4402 + 1.0;
                _4470 = _4502;
                _4472 = _4504;
                _4474 = _4506;
                _4476 = _4508;
                _4510 = _4404;
                _4512 = _4406;
                _4514 = _4408;
                _4516 = _4410;
                _4518 = true;
            }
        }
        else
        {
            float _4520 = _167 + _4412;
            float _4522 = _169 + _4414;
            float _4524 = _171 + _4416;
            float _4526 = _4418 + 1.0;
            _4510 = _4404;
            _4512 = _4406;
            _4514 = _4408;
            _4516 = _4410;
            _4478 = _4520;
            _4480 = _4522;
            _4482 = _4524;
            _4484 = _4526;
            _4518 = true;
        }
    }
    if ((!_4518) || _4500)
    {
        bool _4528;
        if (!_4500)
        {
            _4528 = _4456 >= 1;
        }
        if ((!_4528) || _4500)
        {
            if (!_4500)
            {
                bool _4530 = _4456 != 0;
                if (!_4530)
                {
                    float _4532 = _167 + _4404;
                    _4462 = _4532;
                }
                float _4534 = _4462;
                _4510 = _4534;
                if (!_4530)
                {
                    float _4536 = _169 + _4406;
                    _4464 = _4536;
                }
                float _4538 = _4464;
                _4512 = _4538;
                if (!_4530)
                {
                    float _4540 = _171 + _4408;
                    _4466 = _4540;
                }
                float _4542 = _4466;
                _4514 = _4542;
                if (!_4530)
                {
                    float _4544 = _4410 + 1.0;
                    _4468 = _4544;
                }
                float _4546 = _4468;
                bool _4548 = !_4530;
                _4516 = _4546;
                _4518 = _4548;
            }
            if ((!_4518) || _4500)
            {
                _4500 = false;
                _4510 = _4404;
                _4512 = _4406;
                _4514 = _4408;
                _4516 = _4410;
                _4518 = true;
            }
        }
        else
        {
            float _4550 = _167 + _4420;
            float _4552 = _169 + _4422;
            float _4554 = _171 + _4424;
            float _4556 = _4426 + 1.0;
            _4510 = _4404;
            _4512 = _4406;
            _4514 = _4408;
            _4516 = _4410;
            _4486 = _4550;
            _4488 = _4552;
            _4490 = _4554;
            _4492 = _4556;
        }
    }
    _4518 = false;
    float _4558 = _4470;
    float _4560 = _4472;
    float _4562 = _4474;
    float _4564 = _4476;
    float _4566 = _4510;
    float _4568 = _4512;
    float _4570 = _4514;
    float _4572 = _4516;
    float _4574 = _4478;
    float _4576 = _4480;
    float _4578 = _4482;
    float _4580 = _4484;
    float _4582 = _4486;
    float _4584 = _4488;
    float _4586 = _4490;
    float _4588 = _4492;
    float _4590 = -_2481;
    float _4592 = _177 + _4590;
    float _4594 = -_2485;
    float _4596 = _175 + _4594;
    float _4598 = _2495 * _4592;
    float _4600 = -_2489;
    float _4602 = _179 + _4600;
    float _4604 = fma(_2499, _4596, _4598);
    float _4606 = fma(_2503, _4602, _4604);
    float _4608 = _2531 * _4606;
    float _4610 = rint(_4608);
    float _4612 = precise::max(0.0, _4610);
    float _4614 = precise::min(_4612, 3.0);
    float _4616 = trunc(_4614);
    int _4618 = int(_4616);
    bool _4620 = _4618 >= 2;
    bool _4622 = !_4620;
    float _4624 = as_type<float>(_4618);
    float _4626 = _4610;
    float _4628 = _4604;
    float _4630 = _4598;
    float _4632 = _4558;
    float _4634 = _4560;
    float _4636 = _4562;
    float _4638 = _4564;
    float _4640 = _4574;
    float _4642 = _4576;
    float _4644 = _4578;
    float _4646 = _4580;
    float _4648 = _4582;
    float _4650 = _4584;
    float _4652 = _4586;
    float _4654 = _4588;
    float _4672;
    float _4674;
    float _4676;
    float _4678;
    if (!_4622)
    {
        bool _4656 = _4618 >= 3;
        bool _4658 = !_4656;
        if (!_4658)
        {
            bool _4660 = _4618 != 3;
            _4662 = _4660;
            if (!_4662)
            {
                float _4664 = _175 + _4558;
                float _4666 = _177 + _4560;
                float _4668 = _179 + _4562;
                float _4670 = _4564 + 1.0;
                _4632 = _4664;
                _4634 = _4666;
                _4636 = _4668;
                _4638 = _4670;
                _4672 = _4566;
                _4674 = _4568;
                _4676 = _4570;
                _4678 = _4572;
                _4680 = true;
            }
        }
        else
        {
            float _4682 = _175 + _4574;
            float _4684 = _177 + _4576;
            float _4686 = _179 + _4578;
            float _4688 = _4580 + 1.0;
            _4672 = _4566;
            _4674 = _4568;
            _4676 = _4570;
            _4678 = _4572;
            _4640 = _4682;
            _4642 = _4684;
            _4644 = _4686;
            _4646 = _4688;
            _4680 = true;
        }
    }
    if ((!_4680) || _4662)
    {
        bool _4690;
        if (!_4662)
        {
            _4690 = _4618 >= 1;
        }
        if ((!_4690) || _4662)
        {
            if (!_4662)
            {
                bool _4692 = _4618 != 0;
                if (!_4692)
                {
                    float _4694 = _175 + _4566;
                    _4624 = _4694;
                }
                float _4696 = _4624;
                _4672 = _4696;
                if (!_4692)
                {
                    float _4698 = _177 + _4568;
                    _4626 = _4698;
                }
                float _4700 = _4626;
                _4674 = _4700;
                if (!_4692)
                {
                    float _4702 = _179 + _4570;
                    _4628 = _4702;
                }
                float _4704 = _4628;
                _4676 = _4704;
                if (!_4692)
                {
                    float _4706 = _4572 + 1.0;
                    _4630 = _4706;
                }
                float _4708 = _4630;
                bool _4710 = !_4692;
                _4678 = _4708;
                _4680 = _4710;
            }
            if ((!_4680) || _4662)
            {
                _4662 = false;
                _4672 = _4566;
                _4674 = _4568;
                _4676 = _4570;
                _4678 = _4572;
                _4680 = true;
            }
        }
        else
        {
            float _4712 = _175 + _4582;
            float _4714 = _177 + _4584;
            float _4716 = _179 + _4586;
            float _4718 = _4588 + 1.0;
            _4672 = _4566;
            _4674 = _4568;
            _4676 = _4570;
            _4678 = _4572;
            _4648 = _4712;
            _4650 = _4714;
            _4652 = _4716;
            _4654 = _4718;
        }
    }
    _4680 = false;
    float _4720 = _4632;
    float _4722 = _4634;
    float _4724 = _4636;
    float _4726 = _4638;
    float _4728 = _4672;
    float _4730 = _4674;
    float _4732 = _4676;
    float _4734 = _4678;
    float _4736 = _4640;
    float _4738 = _4642;
    float _4740 = _4644;
    float _4742 = _4646;
    float _4744 = _4648;
    float _4746 = _4650;
    float _4748 = _4652;
    float _4750 = _4654;
    float _4752 = -_2481;
    float _4754 = _185 + _4752;
    float _4756 = -_2485;
    float _4758 = _183 + _4756;
    float _4760 = _2495 * _4754;
    float _4762 = -_2489;
    float _4764 = _187 + _4762;
    float _4766 = fma(_2499, _4758, _4760);
    float _4768 = fma(_2503, _4764, _4766);
    float _4770 = _2531 * _4768;
    float _4772 = rint(_4770);
    float _4774 = precise::max(0.0, _4772);
    float _4776 = precise::min(_4774, 3.0);
    float _4778 = trunc(_4776);
    int _4780 = int(_4778);
    bool _4782 = _4780 >= 2;
    bool _4784 = !_4782;
    float _4786 = as_type<float>(_4780);
    float _4788 = _4772;
    float _4790 = _4766;
    float _4792 = _4760;
    float _4794 = _4720;
    float _4796 = _4722;
    float _4798 = _4724;
    float _4800 = _4726;
    float _4802 = _4736;
    float _4804 = _4738;
    float _4806 = _4740;
    float _4808 = _4742;
    float _4810 = _4744;
    float _4812 = _4746;
    float _4814 = _4748;
    float _4816 = _4750;
    float _4834;
    float _4836;
    float _4838;
    float _4840;
    if (!_4784)
    {
        bool _4818 = _4780 >= 3;
        bool _4820 = !_4818;
        if (!_4820)
        {
            bool _4822 = _4780 != 3;
            _4824 = _4822;
            if (!_4824)
            {
                float _4826 = _183 + _4720;
                float _4828 = _185 + _4722;
                float _4830 = _187 + _4724;
                float _4832 = _4726 + 1.0;
                _4794 = _4826;
                _4796 = _4828;
                _4798 = _4830;
                _4800 = _4832;
                _4834 = _4728;
                _4836 = _4730;
                _4838 = _4732;
                _4840 = _4734;
                _4842 = true;
            }
        }
        else
        {
            float _4844 = _183 + _4736;
            float _4846 = _185 + _4738;
            float _4848 = _187 + _4740;
            float _4850 = _4742 + 1.0;
            _4834 = _4728;
            _4836 = _4730;
            _4838 = _4732;
            _4840 = _4734;
            _4802 = _4844;
            _4804 = _4846;
            _4806 = _4848;
            _4808 = _4850;
            _4842 = true;
        }
    }
    if ((!_4842) || _4824)
    {
        bool _4852;
        if (!_4824)
        {
            _4852 = _4780 >= 1;
        }
        if ((!_4852) || _4824)
        {
            if (!_4824)
            {
                bool _4854 = _4780 != 0;
                if (!_4854)
                {
                    float _4856 = _183 + _4728;
                    _4786 = _4856;
                }
                float _4858 = _4786;
                _4834 = _4858;
                if (!_4854)
                {
                    float _4860 = _185 + _4730;
                    _4788 = _4860;
                }
                float _4862 = _4788;
                _4836 = _4862;
                if (!_4854)
                {
                    float _4864 = _187 + _4732;
                    _4790 = _4864;
                }
                float _4866 = _4790;
                _4838 = _4866;
                if (!_4854)
                {
                    float _4868 = _4734 + 1.0;
                    _4792 = _4868;
                }
                float _4870 = _4792;
                bool _4872 = !_4854;
                _4840 = _4870;
                _4842 = _4872;
            }
            if ((!_4842) || _4824)
            {
                _4824 = false;
                _4834 = _4728;
                _4836 = _4730;
                _4838 = _4732;
                _4840 = _4734;
                _4842 = true;
            }
        }
        else
        {
            float _4874 = _183 + _4744;
            float _4876 = _185 + _4746;
            float _4878 = _187 + _4748;
            float _4880 = _4750 + 1.0;
            _4834 = _4728;
            _4836 = _4730;
            _4838 = _4732;
            _4840 = _4734;
            _4810 = _4874;
            _4812 = _4876;
            _4814 = _4878;
            _4816 = _4880;
        }
    }
    _4842 = false;
    float _4882 = _4794;
    float _4884 = _4796;
    float _4886 = _4798;
    float _4888 = _4800;
    float _4890 = _4834;
    float _4892 = _4836;
    float _4894 = _4838;
    float _4896 = _4840;
    float _4898 = _4802;
    float _4900 = _4804;
    float _4902 = _4806;
    float _4904 = _4808;
    float _4906 = _4810;
    float _4908 = _4812;
    float _4910 = _4814;
    float _4912 = _4816;
    float _4914 = -_2481;
    float _4916 = _193 + _4914;
    float _4918 = -_2485;
    float _4920 = _191 + _4918;
    float _4922 = _2495 * _4916;
    float _4924 = -_2489;
    float _4926 = _195 + _4924;
    float _4928 = fma(_2499, _4920, _4922);
    float _4930 = fma(_2503, _4926, _4928);
    float _4932 = _2531 * _4930;
    float _4934 = rint(_4932);
    float _4936 = precise::max(0.0, _4934);
    float _4938 = precise::min(_4936, 3.0);
    float _4940 = trunc(_4938);
    int _4942 = int(_4940);
    bool _4944 = _4942 >= 2;
    bool _4946 = !_4944;
    float _4948 = as_type<float>(_4942);
    float _4950 = _4926;
    float _4952 = _4934;
    float _4954 = _4928;
    float _4956 = _4912;
    float _4958 = _4904;
    float _4960 = _4898;
    float _4962 = _4888;
    float _4964 = _4906;
    float _4966 = _4910;
    float _4968 = _4900;
    float _4970 = _4902;
    float _4972 = _4908;
    float _4974 = _4884;
    float _4976 = _4882;
    float _4978 = _4886;
    float _4996;
    float _4998;
    float _5000;
    float _5002;
    if (!_4946)
    {
        bool _4980 = _4942 >= 3;
        bool _4982 = !_4980;
        if (!_4982)
        {
            bool _4984 = _4942 != 3;
            _4986 = _4984;
            if (!_4986)
            {
                float _4988 = _191 + _4882;
                float _4990 = _193 + _4884;
                float _4992 = _195 + _4886;
                float _4994 = _4888 + 1.0;
                _4996 = _4896;
                _4962 = _4994;
                _4998 = _4890;
                _5000 = _4894;
                _5002 = _4892;
                _4974 = _4990;
                _4976 = _4988;
                _4978 = _4992;
                _5004 = true;
            }
        }
        else
        {
            float _5006 = _191 + _4898;
            float _5008 = _193 + _4900;
            float _5010 = _195 + _4902;
            float _5012 = _4904 + 1.0;
            _4958 = _5012;
            _4960 = _5006;
            _4996 = _4896;
            _4998 = _4890;
            _4968 = _5008;
            _4970 = _5010;
            _5000 = _4894;
            _5002 = _4892;
            _5004 = true;
        }
    }
    if ((!_5004) || _4986)
    {
        bool _5014;
        if (!_4986)
        {
            _5014 = _4942 >= 1;
        }
        if ((!_5014) || _4986)
        {
            if (!_4986)
            {
                bool _5016 = _4942 != 0;
                if (!_5016)
                {
                    float _5018 = _191 + _4890;
                    _4948 = _5018;
                }
                float _5020 = _4948;
                _4998 = _5020;
                if (!_5016)
                {
                    float _5022 = _193 + _4892;
                    _4950 = _5022;
                }
                float _5024 = _4950;
                _5002 = _5024;
                if (!_5016)
                {
                    float _5026 = _195 + _4894;
                    _4952 = _5026;
                }
                float _5028 = _4952;
                _5000 = _5028;
                if (!_5016)
                {
                    float _5030 = _4896 + 1.0;
                    _4954 = _5030;
                }
                float _5032 = _4954;
                bool _5034 = !_5016;
                _4996 = _5032;
                _5004 = _5034;
            }
            if ((!_5004) || _4986)
            {
                _4986 = false;
                _4996 = _4896;
                _4998 = _4890;
                _5000 = _4894;
                _5002 = _4892;
                _5004 = true;
            }
        }
        else
        {
            float _5036 = _191 + _4906;
            float _5038 = _193 + _4908;
            float _5040 = _195 + _4910;
            float _5042 = _4912 + 1.0;
            _4956 = _5042;
            _4996 = _4896;
            _4964 = _5036;
            _4966 = _5040;
            _4998 = _4890;
            _4972 = _5038;
            _5000 = _4894;
            _5002 = _4892;
        }
    }
    _5004 = false;
    float _5044 = _4956;
    float _5046 = _4958;
    float _5048 = _4960;
    float _5050 = _4996;
    float _5052 = _4962;
    float _5054 = _4964;
    float _5056 = _4966;
    float _5058 = _4998;
    float _5060 = _4968;
    float _5062 = _4970;
    float _5064 = _4972;
    float _5066 = _5000;
    float _5068 = _5002;
    float _5070 = _4974;
    float _5072 = _4976;
    float _5074 = _4978;
    float _5076 = _5044 * 4.0;
    float _5078 = fma(_5046, 4.0, _5044);
    float _5080 = _5046 + _5044;
    float _5082 = _5048 * 6.0;
    float _5084 = fma(_5050, 9.0, _5076);
    float _5086 = fma(_5052, 9.0, _5078);
    float _5088 = _5054 * 6.0;
    float _5090 = _5080 * 2.0;
    float _5092 = _5084 + _5046;
    float _5094 = _5056 * 6.0;
    float _5096 = fma(_5058, 9.0, _5088);
    float _5098 = _5060 * 6.0;
    float _5100 = _5092 * _5086;
    float _5102 = _5062 * 6.0;
    float _5104 = fma(_5054, 3.0, _5082);
    float _5106 = fma(_5064, 3.0, _5098);
    float _5108 = -_5100;
    float _5110 = fma(_5090, _5090, _5108);
    float _5112 = _5064 * 6.0;
    float _5114 = fma(_5066, 9.0, _5094);
    float _5116 = fma(_5056, 3.0, _5102);
    bool _5118 = _5110 != 0.0;
    bool _5120 = isnan(_5110);
    bool _5122 = _5118 || _5120;
    bool _5124 = isnan(0.0);
    bool _5126 = _5122 || _5124;
    float _5128 = fma(_5068, 9.0, _5112);
    float _5130 = fma(_5070, 9.0, _5106);
    float _5132 = fma(_5048, 3.0, _5096);
    float _5134 = fma(_5062, 3.0, _5114);
    float _5136 = fma(_5060, 3.0, _5128);
    float _5138 = fma(_5072, 9.0, _5104);
    float _5140 = fma(_5074, 9.0, _5116);
    bool _5142 = !_5126;
    if (!_5142)
    {
        float _5144 = 1.0 / _5110;
        float _5146 = _5132 * _5086;
        float _5148 = _5092 * _5138;
        float _5150 = _5092 * _5140;
        float _5152 = -_5146;
        float _5154 = fma(_5138, _5090, _5152);
        float _5156 = -_5148;
        float _5158 = fma(_5132, _5090, _5156);
        float _5160 = _5136 * _5086;
        float _5162 = _5092 * _5130;
        float _5164 = _5134 * _5086;
        float _5166 = -_5150;
        float _5168 = fma(_5134, _5090, _5166);
        float _5170 = -_5160;
        float _5172 = fma(_5130, _5090, _5170);
        float _5174 = -_5162;
        float _5176 = fma(_5136, _5090, _5174);
        float _5178 = -_5164;
        float _5180 = fma(_5140, _5090, _5178);
        float _5182 = _5168 * _5144;
        float _5184 = _5158 * _5144;
        float _5186 = _5176 * _5144;
        float _5188 = _5154 * _5144;
        float _5190 = _5172 * _5144;
        float _5192 = _5180 * _5144;
        float _5194 = -_5188;
        float _5196 = _5184 + _5194;
        float _5198 = -_5190;
        float _5200 = _5186 + _5198;
        float _5202 = -_5192;
        float _5204 = _5182 + _5202;
        _2550 = _5196;
        _2552 = _5200;
        _2554 = _5204;
        _2556 = _5188;
        _2558 = _5184;
        _2560 = _5190;
        _2562 = _5186;
        _2564 = _5182;
        _2566 = _5192;
    }
    float _5206 = _2550;
    float _5208 = _2552;
    float _5210 = _2554;
    float _5212 = _2556;
    float _5214 = _2558;
    float _5216 = _2560;
    float _5218 = _2562;
    float _5220 = _2564;
    float _5222 = _2566;
    float _5224 = fma(_5206, 496.0, 0.5);
    float _5226 = precise::clamp(_5224, 0.0, 1.0);
    float _5228 = fma(_5206, -31.0, 1.0);
    float _5230 = precise::clamp(_5228, 0.0, 1.0);
    float _5232 = _5226 + (-0.5);
    float _5234 = fma(_5208, 1008.0, 0.5);
    float _5236 = precise::clamp(_5234, 0.0, 1.0);
    float _5238 = fma(_5210, 496.0, 0.5);
    float _5240 = precise::clamp(_5238, 0.0, 1.0);
    float _5242 = fma(_5208, -63.0, 1.0);
    float _5244 = precise::clamp(_5242, 0.0, 1.0);
    float _5246 = _5230 * _5232;
    float _5248 = _5236 + (-0.5);
    float _5250 = fma(_5210, -31.0, 1.0);
    float _5252 = precise::clamp(_5250, 0.0, 1.0);
    float _5254 = _5240 + (-0.5);
    float _5256 = fma(_5246, -0.0322580635547637939453125, _5212);
    float _5258 = precise::clamp(_5256, 0.0, 1.0);
    float _5260 = _5244 * _5248;
    float _5262 = _5260 * 2.0;
    float _5264 = fma(_5246, 0.0322580635547637939453125, _5214);
    float _5266 = precise::clamp(_5264, 0.0, 1.0);
    float _5268 = _5252 * _5254;
    float _5270 = _5258 * 31.0;
    float _5272 = fma(_5262, -0.01587301678955554962158203125, _5216);
    float _5274 = precise::clamp(_5272, 0.0, 1.0);
    float _5276 = fma(_5262, 0.01587301678955554962158203125, _5218);
    float _5278 = precise::clamp(_5276, 0.0, 1.0);
    float _5280 = _5266 * 31.0;
    float _5282 = fma(_5268, 0.0322580635547637939453125, _5220);
    float _5284 = precise::clamp(_5282, 0.0, 1.0);
    float _5286 = _5274 * 63.0;
    float _5288 = _5278 * 63.0;
    float _5290 = fma(_5268, -0.0322580635547637939453125, _5222);
    float _5292 = precise::clamp(_5290, 0.0, 1.0);
    float _5294 = _5284 * 31.0;
    float _5296 = rint(_5280);
    float _5298 = _5292 * 31.0;
    float _5300 = rint(_5288);
    float _5302 = rint(_5270);
    float _5304 = rint(_5286);
    float _5306 = _5300 + 0.5;
    float _5308 = rint(_5294);
    float _5310 = _5296 + 0.5;
    float _5312 = _5302 + 0.5;
    float _5314 = rint(_5298);
    float _5316 = _5304 + 0.5;
    float _5318 = _5308 + 0.5;
    float _5320 = trunc(_5310);
    float _5322 = precise::max(_5320, 0.0);
    uint _5325 = uint(_5322);
    float _5327 = _5314 + 0.5;
    float _5329 = trunc(_5306);
    float _5331 = precise::max(_5329, 0.0);
    uint _5333 = uint(_5331);
    float _5335 = trunc(_5312);
    float _5337 = precise::max(_5335, 0.0);
    uint _5339 = uint(_5337);
    int _5341 = int(_5325) << 11;
    float _5343 = trunc(_5316);
    float _5345 = precise::max(_5343, 0.0);
    uint _5347 = uint(_5345);
    int _5349 = int(_5333) << 5;
    float _5351 = trunc(_5318);
    float _5353 = precise::max(_5351, 0.0);
    uint _5355 = uint(_5353);
    int _5357 = int(_5339) << 11;
    float _5359 = trunc(_5327);
    float _5361 = precise::max(_5359, 0.0);
    uint _5363 = uint(_5361);
    int _5365 = int(_5347) << 5;
    int _5367 = _5341 | _5349;
    int _5369 = int(_5355) | _5367;
    int _5371 = _5357 | _5365;
    int _5373 = int(_5363) | _5371;
    bool _5375 = _5369 != _5373;
    int _5377 = _5365;
    int _5379 = _5341;
    int _5381 = int(_5339);
    int _5383 = _5369;
    if (!_5375)
    {
        _5377 = _5369;
    }
    int _5385 = _5377;
    int _5387 = _5385;
    if (!_5375)
    {
        _5379 = 0;
    }
    int _5389 = _5379;
    int _5391 = _5389;
    if (!_5375)
    {
        _5381 = 0;
    }
    int _5393 = _5381;
    bool _5395 = !_5375;
    int _5397 = _5393;
    if (!_5395)
    {
        float _5399 = _5296 * 0.0322580635547637939453125;
        float _5401 = _5302 * 0.0322580635547637939453125;
        float _5403 = _5300 * 0.01587301678955554962158203125;
        bool _5405 = uint(_5369) >= uint(_5373);
        float _5407 = _5304 * 0.01587301678955554962158203125;
        float _5409 = _5308 * 0.0322580635547637939453125;
        float _5411 = _5314 * 0.0322580635547637939453125;
        bool _5413 = !_5405;
        float _5415 = _5413 ? _5399 : _5401;
        bool _5417 = !_5405;
        float _5419 = _5417 ? _5401 : _5399;
        bool _5421 = !_5405;
        float _5423 = _5421 ? _5403 : _5407;
        float _5425 = -_5415;
        float _5427 = _127 + _5425;
        bool _5429 = !_5405;
        float _5431 = _5429 ? _5407 : _5403;
        float _5433 = -_5415;
        float _5435 = _5433 + _5419;
        bool _5437 = !_5405;
        float _5439 = _5437 ? _5409 : _5411;
        float _5441 = -_5415;
        float _5443 = _119 + _5441;
        bool _5445 = !_5405;
        float _5447 = _5445 ? _5411 : _5409;
        float _5449 = -_5423;
        float _5451 = _5449 + _5431;
        float _5453 = -_5415;
        float _5455 = _111 + _5453;
        float _5457 = -_5415;
        float _5459 = _103 + _5457;
        float _5461 = -_5415;
        float _5463 = _95 + _5461;
        float _5465 = _5451 * _5451;
        float _5467 = -_5439;
        float _5469 = _5467 + _5447;
        float _5471 = -_5415;
        float _5473 = _87 + _5471;
        float _5475 = -_5415;
        float _5477 = _79 + _5475;
        float _5479 = fma(_5435, _5435, _5465);
        float _5481 = -_5415;
        float _5483 = _71 + _5481;
        float _5485 = -_5415;
        float _5487 = _191 + _5485;
        float _5489 = -_5415;
        float _5491 = _183 + _5489;
        float _5493 = fma(_5469, _5469, _5479);
        float _5495 = -_5415;
        float _5497 = _175 + _5495;
        float _5499 = -_5415;
        float _5501 = _167 + _5499;
        float _5503 = -_5415;
        float _5505 = _159 + _5503;
        float _5507 = -_5415;
        float _5509 = _151 + _5507;
        float _5511 = -_5415;
        float _5513 = _143 + _5511;
        float _5515 = -_5415;
        float _5517 = _135 + _5515;
        float _5519 = -_5423;
        float _5521 = _129 + _5519;
        float _5523 = 1.0 / _5493;
        float _5525 = -_5423;
        float _5527 = _193 + _5525;
        float _5529 = -_5439;
        float _5531 = _131 + _5529;
        float _5533 = -_5423;
        float _5535 = _121 + _5533;
        float _5537 = -_5423;
        float _5539 = _161 + _5537;
        float _5541 = -_5423;
        float _5543 = _153 + _5541;
        float _5545 = -_5439;
        float _5547 = _195 + _5545;
        float _5549 = -_5423;
        float _5551 = _185 + _5549;
        float _5553 = -_5423;
        float _5555 = _113 + _5553;
        float _5557 = -_5423;
        float _5559 = _105 + _5557;
        float _5561 = -_5423;
        float _5563 = _97 + _5561;
        float _5565 = -_5423;
        float _5567 = _89 + _5565;
        float _5569 = -_5423;
        float _5571 = _81 + _5569;
        float _5573 = -_5423;
        float _5575 = _73 + _5573;
        float _5577 = -_5423;
        float _5579 = _177 + _5577;
        float _5581 = -_5423;
        float _5583 = _169 + _5581;
        float _5585 = _5451 * _5523;
        float _5587 = _5435 * _5523;
        float _5589 = _5469 * _5523;
        float _5591 = -_5423;
        float _5593 = _145 + _5591;
        float _5595 = _5585 * _5521;
        float _5597 = _5585 * _5527;
        float _5599 = _5585 * _5535;
        float _5601 = _5585 * _5539;
        float _5603 = fma(_5587, _5427, _5595);
        float _5605 = fma(_5587, _5487, _5597);
        float _5607 = _5585 * _5543;
        float _5609 = -_5423;
        float _5611 = _137 + _5609;
        float _5613 = fma(_5589, _5531, _5603);
        float _5615 = fma(_5589, _5547, _5605);
        float _5617 = -_5439;
        float _5619 = _123 + _5617;
        float _5621 = _5585 * _5551;
        float _5623 = fma(_5587, _5443, _5599);
        bool _5625 = _5613 >= 0.5;
        float _5627 = -_5439;
        float _5629 = _163 + _5627;
        float _5631 = -_5439;
        float _5633 = _155 + _5631;
        float _5635 = fma(_5587, _5505, _5601);
        float _5637 = fma(_5587, _5509, _5607);
        float _5639 = -_5439;
        float _5641 = _187 + _5639;
        float _5643 = _5585 * _5555;
        float _5645 = _5585 * _5559;
        float _5647 = _5585 * _5563;
        float _5649 = _5585 * _5567;
        float _5651 = _5585 * _5571;
        float _5653 = _5585 * _5575;
        float _5655 = _5585 * _5579;
        float _5657 = _5585 * _5583;
        float _5659 = _5585 * _5593;
        float _5661 = _5585 * _5611;
        float _5663 = fma(_5587, _5491, _5621);
        float _5665 = fma(_5589, _5619, _5623);
        bool _5667 = _5615 >= 0.5;
        float _5669 = -_5439;
        float _5671 = _115 + _5669;
        bool _5673 = _5613 >= 0.833000004291534423828125;
        float _5675 = -_5439;
        float _5677 = _107 + _5675;
        float _5679 = -_5439;
        float _5681 = _99 + _5679;
        float _5683 = -_5439;
        float _5685 = _91 + _5683;
        float _5687 = -_5439;
        float _5689 = _83 + _5687;
        float _5691 = -_5439;
        float _5693 = _75 + _5691;
        float _5695 = -_5439;
        float _5697 = _179 + _5695;
        float _5699 = -_5439;
        float _5701 = _171 + _5699;
        float _5703 = -_5439;
        float _5705 = _147 + _5703;
        float _5707 = fma(_5589, _5629, _5635);
        float _5709 = fma(_5589, _5633, _5637);
        float _5711 = -_5439;
        float _5713 = _139 + _5711;
        float _5715 = fma(_5587, _5455, _5643);
        float _5717 = fma(_5587, _5459, _5645);
        float _5719 = fma(_5587, _5463, _5647);
        float _5721 = fma(_5587, _5473, _5649);
        float _5723 = fma(_5587, _5477, _5651);
        float _5725 = fma(_5587, _5483, _5653);
        float _5727 = fma(_5587, _5497, _5655);
        float _5729 = fma(_5587, _5501, _5657);
        float _5731 = fma(_5587, _5513, _5659);
        float _5733 = fma(_5587, _5517, _5661);
        float _5735 = fma(_5589, _5641, _5663);
        bool _5737 = _5613 >= 0.16599999368190765380859375;
        float _5739 = fma(_5589, _5671, _5715);
        float _5741 = fma(_5589, _5677, _5717);
        int _5743 = _5673 ? 0 : 32768;
        float _5745 = fma(_5589, _5681, _5719);
        bool _5747 = _5615 >= 0.833000004291534423828125;
        float _5749 = fma(_5589, _5685, _5721);
        bool _5751 = _5665 >= 0.5;
        float _5753 = fma(_5589, _5689, _5723);
        float _5755 = fma(_5589, _5693, _5725);
        float _5757 = fma(_5589, _5697, _5727);
        float _5759 = fma(_5589, _5701, _5729);
        float _5761 = fma(_5589, _5705, _5731);
        float _5763 = fma(_5589, _5713, _5733);
        int _5765 = _5743;
        if (!_5625)
        {
            int _5767 = _5737 ? 49152 : 16384;
            _5765 = _5767;
        }
        int _5769 = _5765;
        bool _5771 = _5615 >= 0.16599999368190765380859375;
        int _5773 = _5747 ? 0 : 32768;
        bool _5775 = _5735 >= 0.5;
        bool _5777 = _5665 >= 0.833000004291534423828125;
        int _5779 = _5773;
        if (!_5667)
        {
            int _5781 = _5771 ? 49152 : 16384;
            _5779 = _5781;
        }
        int _5783 = _5779;
        bool _5785 = _5665 >= 0.16599999368190765380859375;
        bool _5787 = _5735 >= 0.833000004291534423828125;
        int _5789 = _5777 ? 0 : 8192;
        bool _5791 = _5739 >= 0.5;
        bool _5793 = _5735 >= 0.16599999368190765380859375;
        int _5795 = _5787 ? 0 : 8192;
        int _5797 = _5789;
        int _5799 = _5795;
        if (!_5751)
        {
            int _5801 = _5785 ? 12288 : 4096;
            _5797 = _5801;
        }
        int _5803 = _5797;
        bool _5805 = _5739 >= 0.833000004291534423828125;
        bool _5807 = _5757 >= 0.5;
        if (!_5775)
        {
            int _5809 = _5793 ? 12288 : 4096;
            _5799 = _5809;
        }
        int _5811 = _5799;
        int _5813 = _5805 ? 0 : 2048;
        bool _5815 = _5739 >= 0.16599999368190765380859375;
        bool _5817 = _5757 >= 0.833000004291534423828125;
        bool _5819 = _5741 >= 0.5;
        bool _5821 = _5757 >= 0.16599999368190765380859375;
        int _5823 = _5817 ? 0 : 2048;
        int _5825 = _5813;
        int _5827 = _5823;
        if (!_5791)
        {
            int _5829 = _5815 ? 3072 : 1024;
            _5825 = _5829;
        }
        int _5831 = _5825;
        bool _5833 = _5741 >= 0.833000004291534423828125;
        bool _5835 = _5759 >= 0.5;
        if (!_5807)
        {
            int _5837 = _5821 ? 3072 : 1024;
            _5827 = _5837;
        }
        int _5839 = _5827;
        bool _5841 = _5741 >= 0.16599999368190765380859375;
        int _5843 = _5833 ? 0 : 512;
        bool _5845 = _5745 >= 0.5;
        bool _5847 = _5759 >= 0.833000004291534423828125;
        int _5849 = _5843;
        if (!_5819)
        {
            int _5851 = _5841 ? 768 : 256;
            _5849 = _5851;
        }
        int _5853 = _5849;
        bool _5855 = _5759 >= 0.16599999368190765380859375;
        bool _5857 = _5707 >= 0.5;
        int _5859 = _5847 ? 0 : 512;
        bool _5861 = _5745 >= 0.833000004291534423828125;
        int _5863 = _5859;
        if (!_5835)
        {
            int _5865 = _5855 ? 768 : 256;
            _5863 = _5865;
        }
        int _5867 = _5863;
        bool _5869 = _5745 >= 0.16599999368190765380859375;
        bool _5871 = _5707 >= 0.833000004291534423828125;
        int _5873 = _5861 ? 0 : 128;
        bool _5875 = _5707 >= 0.16599999368190765380859375;
        bool _5877 = _5749 >= 0.5;
        int _5879 = _5871 ? 0 : 128;
        int _5881 = _5873;
        int _5883 = _5879;
        if (!_5845)
        {
            int _5885 = _5869 ? 192 : 64;
            _5881 = _5885;
        }
        int _5887 = _5881;
        bool _5889 = _5749 >= 0.833000004291534423828125;
        bool _5891 = _5709 >= 0.5;
        if (!_5857)
        {
            int _5893 = _5875 ? 192 : 64;
            _5883 = _5893;
        }
        int _5895 = _5883;
        int _5897 = _5889 ? 0 : 32;
        bool _5899 = _5753 >= 0.5;
        bool _5901 = _5749 >= 0.16599999368190765380859375;
        bool _5903 = _5709 >= 0.833000004291534423828125;
        bool _5905 = _5709 >= 0.16599999368190765380859375;
        int _5907 = _5903 ? 0 : 32;
        int _5909 = _5897;
        int _5911 = _5907;
        if (!_5877)
        {
            int _5913 = _5901 ? 48 : 16;
            _5909 = _5913;
        }
        int _5915 = _5909;
        bool _5917 = _5753 >= 0.833000004291534423828125;
        bool _5919 = _5761 >= 0.5;
        if (!_5891)
        {
            int _5921 = _5905 ? 48 : 16;
            _5911 = _5921;
        }
        int _5923 = _5911;
        bool _5925 = _5753 >= 0.16599999368190765380859375;
        bool _5927 = _5761 >= 0.833000004291534423828125;
        int _5929 = _5917 ? 0 : 8;
        int _5931 = _5927 ? 0 : 8;
        int _5933 = _5929;
        int _5935 = _5931;
        if (!_5899)
        {
            int _5937 = _5925 ? 12 : 4;
            _5933 = _5937;
        }
        int _5939 = _5933;
        bool _5941 = _5755 >= 0.5;
        bool _5943 = _5763 >= 0.5;
        bool _5945 = _5761 >= 0.16599999368190765380859375;
        int _5947 = _5831 + _5769;
        int _5949 = _5947 + _5803;
        int _5951 = _5839 + _5783;
        int _5953 = _5951 + _5811;
        if (!_5919)
        {
            int _5955 = _5945 ? 12 : 4;
            _5935 = _5955;
        }
        int _5957 = _5935;
        bool _5959 = _5755 >= 0.833000004291534423828125;
        bool _5961 = _5763 >= 0.833000004291534423828125;
        bool _5963 = _5755 >= 0.16599999368190765380859375;
        bool _5965 = _5763 >= 0.16599999368190765380859375;
        int _5967 = _5887 + _5949;
        int _5969 = _5967 + _5853;
        int _5971 = _5895 + _5953;
        int _5973 = _5971 + _5867;
        int _5975 = _5959 ? 0 : 2;
        int _5977 = _5961 ? 0 : 2;
        int _5979 = _5975;
        int _5981 = _5977;
        if (!_5941)
        {
            int _5983 = _5963 ? 3 : 1;
            _5979 = _5983;
        }
        int _5985 = _5979;
        if (!_5943)
        {
            int _5987 = _5965 ? 3 : 1;
            _5981 = _5987;
        }
        int _5989 = _5981;
        int _5991 = _5939 + _5969;
        int _5993 = _5991 + _5915;
        int _5995 = _5957 + _5973;
        int _5997 = _5995 + _5923;
        bool _5999 = !_5405;
        int _6001 = _5999 ? _5373 : _5369;
        bool _6003 = !_5405;
        int _6005 = _6003 ? _5369 : _5373;
        int _6007 = _5993 + _5985;
        int _6009 = _5997 + _5989;
        _5387 = _6001;
        _5383 = _6005;
        _5391 = _6007;
        _5397 = _6009;
    }
    int _6011 = _5387;
    int _6013 = _5383;
    int _6015 = _5391;
    int _6017 = _5397;
    out.m_32.x = as_type<float>(_6011);
    out.m_32.y = as_type<float>(_6013);
    out.m_32.z = as_type<float>(_6015);
    out.m_32.w = as_type<float>(_6017);
    return out;
}


struct main0_out_u
{
    uint4 m_32 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _5004 = false;
    bool _4986 = false;
    bool _4842 = false;
    bool _4824 = false;
    bool _4680 = false;
    bool _4662 = false;
    bool _4518 = false;
    bool _4500 = false;
    bool _4356 = false;
    bool _4338 = false;
    bool _4194 = false;
    bool _4176 = false;
    bool _4032 = false;
    bool _4014 = false;
    bool _3870 = false;
    bool _3852 = false;
    bool _3708 = false;
    bool _3690 = false;
    bool _3546 = false;
    bool _3528 = false;
    bool _3384 = false;
    bool _3366 = false;
    bool _3222 = false;
    bool _3204 = false;
    bool _3060 = false;
    bool _3042 = false;
    bool _2898 = false;
    bool _2880 = false;
    bool _2736 = false;
    bool _2718 = false;
    bool _2608 = false;
    bool _2574 = false;
    float _39 = gl_FragCoord.w;
    float _41 = in.m_29.x;
    float _43 = gl_FragCoord.w;
    float _45 = _41 * _43;
    float _47 = in.m_29.y;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = in.m_29.z;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = 1.0 / _39;
    float _61 = _59 * _45;
    float _63 = _59 * _51;
    float _65 = _59 * _57;
    float3 _6063 = float3(_61, _63, _65);
    float3 _69 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6063, float3(0.0), isnan(_6063)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6063, float3(0.0), isnan(_6063)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyz;
    float _71 = _69.x;
    float _73 = _69.y;
    float _75 = _69.z;
    float3 _6084 = float3(_61, _63, _65);
    float3 _77 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6084, float3(0.0), isnan(_6084)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(1, 0, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6084, float3(0.0), isnan(_6084)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(1, 0, 0)).xyz;
    float _79 = _77.x;
    float _81 = _77.y;
    float _83 = _77.z;
    float3 _6103 = float3(_61, _63, _65);
    float3 _85 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6103, float3(0.0), isnan(_6103)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(2, 0, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6103, float3(0.0), isnan(_6103)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(2, 0, 0)).xyz;
    float _87 = _85.x;
    float _89 = _85.y;
    float _91 = _85.z;
    float3 _6121 = float3(_61, _63, _65);
    float3 _93 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6121, float3(0.0), isnan(_6121)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(3, 0, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6121, float3(0.0), isnan(_6121)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(3, 0, 0)).xyz;
    float _95 = _93.x;
    float _97 = _93.y;
    float _99 = _93.z;
    float3 _6139 = float3(_61, _63, _65);
    float3 _101 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6139, float3(0.0), isnan(_6139)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(0, 1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6139, float3(0.0), isnan(_6139)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(0, 1, 0)).xyz;
    float _103 = _101.x;
    float _105 = _101.y;
    float _107 = _101.z;
    float3 _6157 = float3(_61, _63, _65);
    float3 _109 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6157, float3(0.0), isnan(_6157)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(1, 1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6157, float3(0.0), isnan(_6157)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(1, 1, 0)).xyz;
    float _111 = _109.x;
    float _113 = _109.y;
    float _115 = _109.z;
    float3 _6175 = float3(_61, _63, _65);
    float3 _117 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6175, float3(0.0), isnan(_6175)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(2, 1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6175, float3(0.0), isnan(_6175)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(2, 1, 0)).xyz;
    float _119 = _117.x;
    float _121 = _117.y;
    float _123 = _117.z;
    float3 _6193 = float3(_61, _63, _65);
    float3 _125 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6193, float3(0.0), isnan(_6193)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(3, 1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6193, float3(0.0), isnan(_6193)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(3, 1, 0)).xyz;
    float _127 = _125.x;
    float _129 = _125.y;
    float _131 = _125.z;
    float3 _6211 = float3(_61, _63, _65);
    float3 _133 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6211, float3(0.0), isnan(_6211)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(0, 2, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6211, float3(0.0), isnan(_6211)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(0, 2, 0)).xyz;
    float _135 = _133.x;
    float _137 = _133.y;
    float _139 = _133.z;
    float3 _6229 = float3(_61, _63, _65);
    float3 _141 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6229, float3(0.0), isnan(_6229)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(1, 2, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6229, float3(0.0), isnan(_6229)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(1, 2, 0)).xyz;
    float _143 = _141.x;
    float _145 = _141.y;
    float _147 = _141.z;
    float3 _6247 = float3(_61, _63, _65);
    float3 _149 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6247, float3(0.0), isnan(_6247)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(2, 2, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6247, float3(0.0), isnan(_6247)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(2, 2, 0)).xyz;
    float _151 = _149.x;
    float _153 = _149.y;
    float _155 = _149.z;
    float3 _6265 = float3(_61, _63, _65);
    float3 _157 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6265, float3(0.0), isnan(_6265)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(3, 2, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6265, float3(0.0), isnan(_6265)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(3, 2, 0)).xyz;
    float _159 = _157.x;
    float _161 = _157.y;
    float _163 = _157.z;
    float3 _6283 = float3(_61, _63, _65);
    float3 _165 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6283, float3(0.0), isnan(_6283)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(0, 3, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6283, float3(0.0), isnan(_6283)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(0, 3, 0)).xyz;
    float _167 = _165.x;
    float _169 = _165.y;
    float _171 = _165.z;
    float3 _6301 = float3(_61, _63, _65);
    float3 _173 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6301, float3(0.0), isnan(_6301)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(1, 3, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6301, float3(0.0), isnan(_6301)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(1, 3, 0)).xyz;
    float _175 = _173.x;
    float _177 = _173.y;
    float _179 = _173.z;
    float3 _6319 = float3(_61, _63, _65);
    float3 _181 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6319, float3(0.0), isnan(_6319)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(2, 3, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6319, float3(0.0), isnan(_6319)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(2, 3, 0)).xyz;
    float _183 = _181.x;
    float _185 = _181.y;
    float _187 = _181.z;
    float3 _6337 = float3(_61, _63, _65);
    float3 _189 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6337, float3(0.0), isnan(_6337)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(3, 3, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6337, float3(0.0), isnan(_6337)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(3, 3, 0)).xyz;
    float _191 = _189.x;
    float _193 = _189.y;
    float _195 = _189.z;
    float _197 = _73 + _81;
    float _199 = _71 + _79;
    float _201 = _75 + _83;
    float _203 = _89 + _197;
    float _205 = _87 + _199;
    float _207 = _91 + _201;
    float _209 = _97 + _203;
    float _211 = _95 + _205;
    float _213 = _99 + _207;
    float _215 = _105 + _209;
    float _217 = _103 + _211;
    float _219 = _107 + _213;
    float _221 = _113 + _215;
    float _223 = _111 + _217;
    float _225 = _115 + _219;
    float _227 = _121 + _221;
    float _229 = _119 + _223;
    float _231 = _123 + _225;
    float _233 = _129 + _227;
    float _235 = _127 + _229;
    float _237 = _131 + _231;
    float _239 = _137 + _233;
    float _241 = _135 + _235;
    float _243 = _139 + _237;
    float _245 = _145 + _239;
    float _247 = _143 + _241;
    float _249 = _147 + _243;
    float _251 = _153 + _245;
    float _253 = _151 + _247;
    float _255 = _155 + _249;
    float _257 = _161 + _251;
    float _259 = _159 + _253;
    float _261 = _163 + _255;
    float _263 = _169 + _257;
    float _265 = _167 + _259;
    float _267 = _171 + _261;
    float _269 = _177 + _263;
    float _271 = _175 + _265;
    float _273 = _179 + _267;
    float _275 = _185 + _269;
    float _277 = _183 + _271;
    float _279 = _187 + _273;
    float _281 = _193 + _275;
    float _283 = _191 + _277;
    float _285 = _195 + _279;
    float _287 = fma(_281, -0.0625, _81);
    float _289 = fma(_283, -0.0625, _79);
    float _291 = fma(_285, -0.0625, _83);
    float _293 = fma(_281, -0.0625, _73);
    float _295 = fma(_283, -0.0625, _71);
    float _297 = _289 * _287;
    float _299 = _289 * _289;
    float _301 = fma(_285, -0.0625, _75);
    float _303 = _287 * _287;
    float _305 = _287 * _291;
    float _307 = _289 * _291;
    float _309 = fma(_295, _293, _297);
    float _311 = fma(_293, _293, _303);
    float _313 = fma(_293, _301, _305);
    float _315 = fma(_295, _295, _299);
    float _317 = fma(_295, _301, _307);
    float _319 = _291 * _291;
    float _321 = fma(_281, -0.0625, _89);
    float _323 = fma(_283, -0.0625, _87);
    float _325 = fma(_285, -0.0625, _91);
    float _327 = fma(_301, _301, _319);
    float _329 = fma(_321, _321, _311);
    float _331 = fma(_323, _321, _309);
    float _333 = fma(_321, _325, _313);
    float _335 = fma(_323, _323, _315);
    float _337 = fma(_323, _325, _317);
    float _339 = fma(_281, -0.0625, _97);
    float _341 = fma(_283, -0.0625, _95);
    float _343 = fma(_285, -0.0625, _99);
    float _345 = fma(_325, _325, _327);
    float _347 = fma(_339, _339, _329);
    float _349 = fma(_341, _339, _331);
    float _351 = fma(_339, _343, _333);
    float _353 = fma(_341, _341, _335);
    float _355 = fma(_341, _343, _337);
    float _357 = fma(_281, -0.0625, _105);
    float _359 = fma(_283, -0.0625, _103);
    float _361 = fma(_285, -0.0625, _107);
    float _363 = fma(_343, _343, _345);
    float _365 = fma(_357, _357, _347);
    float _367 = fma(_359, _357, _349);
    float _369 = fma(_357, _361, _351);
    float _371 = fma(_359, _359, _353);
    float _373 = fma(_359, _361, _355);
    float _375 = fma(_281, -0.0625, _113);
    float _377 = fma(_283, -0.0625, _111);
    float _379 = fma(_285, -0.0625, _115);
    float _381 = fma(_361, _361, _363);
    float _383 = fma(_375, _375, _365);
    float _385 = fma(_377, _375, _367);
    float _387 = fma(_375, _379, _369);
    float _389 = fma(_377, _377, _371);
    float _391 = fma(_377, _379, _373);
    float _393 = fma(_281, -0.0625, _121);
    float _395 = fma(_283, -0.0625, _119);
    float _397 = fma(_285, -0.0625, _123);
    float _399 = fma(_379, _379, _381);
    float _401 = fma(_393, _393, _383);
    float _403 = fma(_395, _393, _385);
    float _405 = fma(_393, _397, _387);
    float _407 = fma(_395, _395, _389);
    float _409 = fma(_395, _397, _391);
    float _411 = fma(_281, -0.0625, _129);
    float _413 = fma(_283, -0.0625, _127);
    float _415 = fma(_285, -0.0625, _131);
    float _417 = fma(_397, _397, _399);
    float _419 = fma(_411, _411, _401);
    float _421 = fma(_413, _411, _403);
    float _423 = fma(_411, _415, _405);
    float _425 = fma(_413, _413, _407);
    float _427 = fma(_413, _415, _409);
    float _429 = fma(_281, -0.0625, _137);
    float _431 = fma(_283, -0.0625, _135);
    float _433 = fma(_285, -0.0625, _139);
    float _435 = fma(_415, _415, _417);
    float _437 = fma(_429, _429, _419);
    float _439 = fma(_431, _429, _421);
    float _441 = fma(_429, _433, _423);
    float _443 = fma(_431, _431, _425);
    float _445 = fma(_431, _433, _427);
    float _447 = fma(_281, -0.0625, _145);
    float _449 = fma(_283, -0.0625, _143);
    float _451 = fma(_285, -0.0625, _147);
    float _453 = fma(_433, _433, _435);
    float _455 = fma(_447, _447, _437);
    float _457 = fma(_449, _447, _439);
    float _459 = fma(_447, _451, _441);
    float _461 = fma(_449, _449, _443);
    float _463 = fma(_449, _451, _445);
    float _465 = fma(_281, -0.0625, _153);
    float _467 = fma(_283, -0.0625, _151);
    float _469 = fma(_285, -0.0625, _155);
    float _471 = fma(_451, _451, _453);
    float _473 = fma(_465, _465, _455);
    float _475 = fma(_467, _465, _457);
    float _477 = fma(_465, _469, _459);
    float _479 = fma(_467, _467, _461);
    float _481 = fma(_467, _469, _463);
    float _483 = fma(_281, -0.0625, _161);
    float _485 = fma(_283, -0.0625, _159);
    float _487 = fma(_285, -0.0625, _163);
    float _489 = fma(_469, _469, _471);
    float _491 = fma(_483, _483, _473);
    float _493 = fma(_485, _483, _475);
    float _495 = fma(_483, _487, _477);
    float _497 = fma(_485, _485, _479);
    float _499 = fma(_485, _487, _481);
    float _501 = fma(_281, -0.0625, _169);
    float _503 = fma(_283, -0.0625, _167);
    float _505 = fma(_285, -0.0625, _171);
    float _507 = fma(_487, _487, _489);
    float _509 = fma(_501, _501, _491);
    float _511 = fma(_503, _501, _493);
    float _513 = fma(_501, _505, _495);
    float _515 = fma(_503, _503, _497);
    float _517 = fma(_503, _505, _499);
    float _519 = fma(_281, -0.0625, _177);
    float _521 = fma(_283, -0.0625, _175);
    float _523 = fma(_285, -0.0625, _179);
    float _525 = fma(_505, _505, _507);
    float _527 = fma(_519, _519, _509);
    float _529 = fma(_521, _519, _511);
    float _531 = fma(_519, _523, _513);
    float _533 = fma(_521, _521, _515);
    float _535 = fma(_521, _523, _517);
    float _537 = fma(_281, -0.0625, _185);
    float _539 = fma(_283, -0.0625, _183);
    float _541 = fma(_285, -0.0625, _187);
    float _543 = fma(_281, -0.0625, _193);
    float _545 = fma(_537, _537, _527);
    float _547 = fma(_539, _537, _529);
    float _549 = fma(_283, -0.0625, _191);
    float _551 = fma(_537, _541, _531);
    float _553 = fma(_285, -0.0625, _195);
    float _555 = fma(_539, _539, _533);
    float _557 = fma(_543, _543, _545);
    float _559 = fma(_549, _543, _547);
    float _561 = fma(_523, _523, _525);
    float _563 = fma(_539, _541, _535);
    float _565 = fma(_543, _553, _551);
    float _567 = fma(_549, _549, _555);
    float _569 = _557 + _559;
    float _571 = fma(_541, _541, _561);
    float _573 = fma(_549, _553, _563);
    float _575 = _567 + _559;
    float _577 = _565 + _569;
    float _579 = fma(_553, _553, _571);
    float _581 = _565 + _573;
    float _583 = _573 + _575;
    float _585 = _577 * _577;
    float _587 = _579 + _581;
    float _589 = fma(_583, _583, _585);
    float _591 = fma(_587, _587, _589);
    float _593 = rsqrt(_591);
    float _595 = _577 * _593;
    float _597 = _583 * _593;
    float _599 = _587 * _593;
    float _601 = _557 * _595;
    float _603 = _559 * _595;
    float _605 = fma(_559, _597, _601);
    float _607 = _565 * _595;
    float _609 = fma(_567, _597, _603);
    float _611 = fma(_565, _599, _605);
    float _613 = fma(_573, _597, _607);
    float _615 = fma(_573, _599, _609);
    float _617 = _611 * _611;
    float _619 = fma(_579, _599, _613);
    float _621 = fma(_615, _615, _617);
    float _623 = fma(_619, _619, _621);
    float _625 = rsqrt(_623);
    float _627 = _611 * _625;
    float _629 = _615 * _625;
    float _631 = _619 * _625;
    float _633 = _557 * _627;
    float _635 = _559 * _627;
    float _637 = _565 * _627;
    float _639 = fma(_559, _629, _633);
    float _641 = fma(_567, _629, _635);
    float _643 = fma(_573, _629, _637);
    float _645 = fma(_565, _631, _639);
    float _647 = fma(_573, _631, _641);
    float _649 = fma(_579, _631, _643);
    float _651 = _645 * _645;
    float _653 = fma(_647, _647, _651);
    float _655 = fma(_649, _649, _653);
    float _657 = rsqrt(_655);
    float _659 = _645 * _657;
    float _661 = _647 * _657;
    float _663 = _649 * _657;
    float _665 = _557 * _659;
    float _667 = _559 * _659;
    float _669 = _565 * _659;
    float _671 = fma(_559, _661, _665);
    float _673 = fma(_567, _661, _667);
    float _675 = fma(_573, _661, _669);
    float _677 = fma(_565, _663, _671);
    float _679 = fma(_573, _663, _673);
    float _681 = fma(_579, _663, _675);
    float _683 = _677 * _677;
    float _685 = fma(_679, _679, _683);
    float _687 = fma(_681, _681, _685);
    float _689 = rsqrt(_687);
    float _691 = _677 * _689;
    float _693 = _679 * _689;
    float _695 = _681 * _689;
    float _697 = _557 * _691;
    float _699 = _559 * _691;
    float _701 = _565 * _691;
    float _703 = fma(_559, _693, _697);
    float _705 = fma(_567, _693, _699);
    float _707 = fma(_573, _693, _701);
    float _709 = fma(_565, _695, _703);
    float _711 = fma(_573, _695, _705);
    float _713 = fma(_579, _695, _707);
    float _715 = _709 * _709;
    float _717 = fma(_711, _711, _715);
    float _719 = fma(_713, _713, _717);
    float _721 = rsqrt(_719);
    float _723 = _709 * _721;
    float _725 = _711 * _721;
    float _727 = _713 * _721;
    float _729 = _557 * _723;
    float _731 = _559 * _723;
    float _733 = _565 * _723;
    float _735 = fma(_559, _725, _729);
    float _737 = fma(_567, _725, _731);
    float _739 = fma(_573, _725, _733);
    float _741 = fma(_565, _727, _735);
    float _743 = fma(_573, _727, _737);
    float _745 = fma(_579, _727, _739);
    float _747 = _741 * _741;
    float _749 = fma(_743, _743, _747);
    float _751 = fma(_745, _745, _749);
    float _753 = rsqrt(_751);
    float _755 = _741 * _753;
    float _757 = _743 * _753;
    float _759 = _745 * _753;
    float _761 = _557 * _755;
    float _763 = _559 * _755;
    float _765 = _565 * _755;
    float _767 = fma(_559, _757, _761);
    float _769 = fma(_567, _757, _763);
    float _771 = fma(_573, _757, _765);
    float _773 = fma(_565, _759, _767);
    float _775 = fma(_573, _759, _769);
    float _777 = fma(_579, _759, _771);
    float _779 = _773 * _773;
    float _781 = fma(_775, _775, _779);
    float _783 = fma(_777, _777, _781);
    float _785 = rsqrt(_783);
    float _787 = _773 * _785;
    float _789 = _775 * _785;
    float _791 = _777 * _785;
    float _793 = _557 * _787;
    float _795 = _559 * _787;
    float _797 = fma(_559, _789, _793);
    float _799 = _565 * _787;
    float _801 = fma(_567, _789, _795);
    float _803 = fma(_565, _791, _797);
    float _805 = fma(_573, _789, _799);
    float _807 = fma(_573, _791, _801);
    float _809 = _803 * _803;
    float _811 = fma(_579, _791, _805);
    float _813 = fma(_807, _807, _809);
    float _815 = fma(_811, _811, _813);
    float _817 = rsqrt(_815);
    float _819 = _803 * _817;
    float _821 = _807 * _817;
    float _823 = _811 * _817;
    float _825 = _73 * _819;
    float _827 = _81 * _819;
    float _829 = _89 * _819;
    float _831 = fma(_71, _821, _825);
    float _833 = fma(_79, _821, _827);
    float _835 = fma(_87, _821, _829);
    float _837 = fma(_75, _823, _831);
    float _839 = fma(_83, _823, _833);
    float _841 = fma(_91, _823, _835);
    bool _845 = _837 >= _839;
    bool _847 = isnan(_837);
    bool _849 = _845 || _847;
    bool _851 = isnan(_839);
    bool _853 = _849 || _851;
    float _855 = _551;
    float _857 = _833;
    float _859 = _829;
    float _861 = _783;
    float _863 = _835;
    float _865 = _827;
    float _867 = _777;
    float _869 = _761;
    float _871 = _839;
    float _873 = _787;
    float _875 = _841;
    float _877 = _841;
    float _879 = _819;
    float _881 = _821;
    float _883 = 2.6624670822171524347550862082508e-44;
    float _885 = (*spvDescriptorSet0.fp_c3)._m0[1].x;
    if (!_853)
    {
        _855 = _79;
    }
    float _887 = _855;
    float _889 = _887;
    float _891 = _887;
    if (!_853)
    {
        _857 = _81;
    }
    float _893 = _857;
    float _895 = _893;
    float _897 = _893;
    if (!_853)
    {
        _859 = _83;
    }
    float _899 = _859;
    float _901 = _899;
    float _903 = _899;
    if (!_853)
    {
        _861 = _837;
    }
    float _905 = _861;
    float _907 = _905;
    float _909 = _905;
    if (!_853)
    {
        _863 = _839;
    }
    float _911 = _863;
    float _913 = _911;
    float _915 = _911;
    if (!_853)
    {
        _865 = _71;
    }
    float _917 = _865;
    float _919 = _917;
    float _921 = _917;
    if (!_853)
    {
        _867 = _73;
    }
    float _923 = _867;
    float _925 = _923;
    float _927 = _923;
    if (!_853)
    {
        _869 = _75;
    }
    float _929 = _869;
    bool _931 = !_853;
    float _933 = _929;
    float _935 = _929;
    if (!_931)
    {
        bool _937 = _837 > _839;
        if (!_937)
        {
            _907 = _837;
        }
        float _939 = _907;
        float _941 = _939;
        if (!_937)
        {
            _913 = _837;
        }
        float _943 = _913;
        float _945 = _943;
        if (!_937)
        {
            _919 = _71;
        }
        float _947 = _919;
        float _949 = _947;
        if (!_937)
        {
            _925 = _73;
        }
        float _951 = _925;
        float _953 = _951;
        if (!_937)
        {
            _933 = _75;
        }
        float _955 = _933;
        float _957 = _955;
        if (!_937)
        {
            _889 = _71;
        }
        float _959 = _889;
        float _961 = _959;
        if (!_937)
        {
            _895 = _73;
        }
        float _963 = _895;
        float _965 = _963;
        if (!_937)
        {
            _901 = _75;
        }
        float _967 = _901;
        _903 = _967;
        if (_937)
        {
            _941 = _839;
        }
        float _969 = _941;
        _909 = _969;
        if (_937)
        {
            _945 = _837;
        }
        float _971 = _945;
        _915 = _971;
        if (_937)
        {
            _949 = _79;
        }
        float _973 = _949;
        _921 = _973;
        if (_937)
        {
            _953 = _81;
        }
        float _975 = _953;
        _927 = _975;
        if (_937)
        {
            _957 = _83;
        }
        float _977 = _957;
        _935 = _977;
        if (_937)
        {
            _961 = _71;
        }
        float _979 = _961;
        _891 = _979;
        if (_937)
        {
            _965 = _73;
        }
        float _981 = _965;
        _897 = _981;
        if (_937)
        {
            _903 = _75;
        }
    }
    float _983 = _915;
    float _985 = _909;
    float _987 = _891;
    float _989 = _897;
    float _991 = _903;
    float _993 = _921;
    float _995 = _927;
    float _997 = _935;
    bool _999 = _983 >= _841;
    bool _1001 = isnan(_983);
    bool _1003 = _999 || _1001;
    bool _1005 = isnan(_841);
    bool _1007 = _1003 || _1005;
    float _1009 = _97 * _819;
    float _1011 = fma(_95, _821, _1009);
    float _1013 = fma(_99, _823, _1011);
    float _1015 = _1011;
    float _1017 = _985;
    float _1019 = _993;
    float _1021 = _995;
    float _1023 = _985;
    float _1025 = _993;
    float _1027 = _995;
    float _1029 = _997;
    float _1031 = _989;
    float _1033 = _1013;
    float _1035 = _1013;
    if (!_1007)
    {
        _1015 = _87;
    }
    float _1037 = _1015;
    float _1039 = _1037;
    float _1041 = _1037;
    if (!_1007)
    {
        _871 = _89;
    }
    float _1043 = _871;
    float _1045 = _1043;
    float _1047 = _1043;
    if (!_1007)
    {
        _873 = _91;
    }
    float _1049 = _873;
    bool _1051 = !_1007;
    float _1053 = _1049;
    float _1055 = _1049;
    if (!_1051)
    {
        bool _1057 = _985 > _841;
        if (_1057)
        {
            _1017 = _841;
        }
        float _1059 = _1017;
        _1023 = _1059;
        if (!_1057)
        {
            _1039 = _987;
        }
        float _1061 = _1039;
        float _1063 = _1061;
        if (!_1057)
        {
            _1045 = _989;
        }
        float _1065 = _1045;
        float _1067 = _1065;
        if (!_1057)
        {
            _1053 = _991;
        }
        float _1069 = _1053;
        float _1071 = _1069;
        if (!_1057)
        {
            _875 = _983;
        }
        float _1073 = _875;
        float _1075 = _1073;
        if (_1057)
        {
            _1063 = _987;
        }
        float _1077 = _1063;
        _1041 = _1077;
        if (_1057)
        {
            _1067 = _989;
        }
        float _1079 = _1067;
        _1047 = _1079;
        if (_1057)
        {
            _1071 = _991;
        }
        float _1081 = _1071;
        _1055 = _1081;
        if (_1057)
        {
            _1075 = _983;
        }
        float _1083 = _1075;
        _877 = _1083;
        if (_1057)
        {
            _1019 = _87;
        }
        float _1085 = _1019;
        _1025 = _1085;
        if (_1057)
        {
            _1021 = _89;
        }
        float _1087 = _1021;
        _1027 = _1087;
        if (_1057)
        {
            _1029 = _91;
        }
    }
    float _1089 = _877;
    float _1091 = _1023;
    float _1093 = _1041;
    float _1095 = _1047;
    float _1097 = _1055;
    float _1099 = _1025;
    float _1101 = _1027;
    float _1103 = _1029;
    bool _1105 = _1089 >= _1013;
    bool _1107 = isnan(_1089);
    bool _1109 = _1105 || _1107;
    bool _1111 = isnan(_1013);
    bool _1113 = _1109 || _1111;
    float _1115 = _105 * _819;
    float _1117 = fma(_103, _821, _1115);
    float _1119 = fma(_107, _823, _1117);
    float _1121 = _1117;
    float _1123 = _1115;
    float _1125 = _1091;
    float _1127 = _1099;
    float _1129 = _1101;
    float _1131 = _1091;
    float _1133 = _1099;
    float _1135 = _1101;
    float _1137 = _1103;
    float _1139 = _1095;
    float _1141 = _1097;
    float _1143 = _1119;
    float _1145 = _1119;
    if (!_1113)
    {
        _1121 = _95;
    }
    float _1147 = _1121;
    float _1149 = _1147;
    float _1151 = _1147;
    if (!_1113)
    {
        _1123 = _97;
    }
    float _1153 = _1123;
    float _1155 = _1153;
    float _1157 = _1153;
    if (!_1113)
    {
        _1031 = _99;
    }
    float _1159 = _1031;
    bool _1161 = !_1113;
    float _1163 = _1159;
    float _1165 = _1159;
    if (!_1161)
    {
        bool _1167 = _1091 > _1013;
        if (_1167)
        {
            _1125 = _1013;
        }
        float _1169 = _1125;
        _1131 = _1169;
        if (!_1167)
        {
            _1149 = _1093;
        }
        float _1171 = _1149;
        float _1173 = _1171;
        if (!_1167)
        {
            _1155 = _1095;
        }
        float _1175 = _1155;
        float _1177 = _1175;
        if (!_1167)
        {
            _1163 = _1097;
        }
        float _1179 = _1163;
        float _1181 = _1179;
        if (!_1167)
        {
            _1033 = _1089;
        }
        float _1183 = _1033;
        float _1185 = _1183;
        if (_1167)
        {
            _1173 = _1093;
        }
        float _1187 = _1173;
        _1151 = _1187;
        if (_1167)
        {
            _1177 = _1095;
        }
        float _1189 = _1177;
        _1157 = _1189;
        if (_1167)
        {
            _1181 = _1097;
        }
        float _1191 = _1181;
        _1165 = _1191;
        if (_1167)
        {
            _1185 = _1089;
        }
        float _1193 = _1185;
        _1035 = _1193;
        if (_1167)
        {
            _1127 = _95;
        }
        float _1195 = _1127;
        _1133 = _1195;
        if (_1167)
        {
            _1129 = _97;
        }
        float _1197 = _1129;
        _1135 = _1197;
        if (_1167)
        {
            _1137 = _99;
        }
    }
    float _1199 = _1035;
    float _1201 = _1131;
    float _1203 = _1151;
    float _1205 = _1157;
    float _1207 = _1165;
    float _1209 = _1133;
    float _1211 = _1135;
    float _1213 = _1137;
    bool _1215 = _1199 >= _1119;
    bool _1217 = isnan(_1199);
    bool _1219 = _1215 || _1217;
    bool _1221 = isnan(_1119);
    bool _1223 = _1219 || _1221;
    float _1225 = _113 * _819;
    float _1227 = fma(_111, _821, _1225);
    float _1229 = fma(_115, _823, _1227);
    float _1231 = _1227;
    float _1233 = _1201;
    float _1235 = _1209;
    float _1237 = _1211;
    float _1239 = _1201;
    float _1241 = _1209;
    float _1243 = _1211;
    float _1245 = _1213;
    float _1247 = _1207;
    float _1249 = _1229;
    float _1251 = _1229;
    float _1253 = _1199;
    if (!_1223)
    {
        _1231 = _103;
    }
    float _1255 = _1231;
    float _1257 = _1255;
    float _1259 = _1255;
    if (!_1223)
    {
        _1139 = _105;
    }
    float _1261 = _1139;
    float _1263 = _1261;
    float _1265 = _1261;
    if (!_1223)
    {
        _1141 = _107;
    }
    float _1267 = _1141;
    bool _1269 = !_1223;
    float _1271 = _1267;
    float _1273 = _1267;
    if (!_1269)
    {
        bool _1275 = _1201 > _1119;
        if (_1275)
        {
            _1233 = _1119;
        }
        float _1277 = _1233;
        _1239 = _1277;
        if (!_1275)
        {
            _1257 = _1203;
        }
        float _1279 = _1257;
        float _1281 = _1279;
        if (!_1275)
        {
            _1263 = _1205;
        }
        float _1283 = _1263;
        float _1285 = _1283;
        if (!_1275)
        {
            _1271 = _1207;
        }
        float _1287 = _1271;
        float _1289 = _1287;
        if (!_1275)
        {
            _1143 = _1199;
        }
        float _1291 = _1143;
        float _1293 = _1291;
        if (_1275)
        {
            _1281 = _1203;
        }
        float _1295 = _1281;
        _1259 = _1295;
        if (_1275)
        {
            _1285 = _1205;
        }
        float _1297 = _1285;
        _1265 = _1297;
        if (_1275)
        {
            _1289 = _1207;
        }
        float _1299 = _1289;
        _1273 = _1299;
        if (_1275)
        {
            _1293 = _1199;
        }
        float _1301 = _1293;
        _1145 = _1301;
        if (_1275)
        {
            _1235 = _103;
        }
        float _1303 = _1235;
        _1241 = _1303;
        if (_1275)
        {
            _1237 = _105;
        }
        float _1305 = _1237;
        _1243 = _1305;
        if (_1275)
        {
            _1245 = _107;
        }
    }
    float _1307 = _1145;
    float _1309 = _1239;
    float _1311 = _1259;
    float _1313 = _1265;
    float _1315 = _1273;
    float _1317 = _1241;
    float _1319 = _1243;
    float _1321 = _1245;
    bool _1323 = _1307 >= _1229;
    bool _1325 = isnan(_1307);
    bool _1327 = _1323 || _1325;
    bool _1329 = isnan(_1229);
    bool _1331 = _1327 || _1329;
    float _1333 = _121 * _819;
    float _1335 = fma(_119, _821, _1333);
    float _1337 = fma(_123, _823, _1335);
    float _1339 = _1335;
    float _1341 = _1333;
    float _1343 = _1309;
    float _1345 = _1317;
    float _1347 = _1319;
    float _1349 = _1309;
    float _1351 = _1317;
    float _1353 = _1319;
    float _1355 = _1321;
    float _1357 = _1315;
    float _1359 = _1307;
    float _1361 = _1337;
    float _1363 = _1337;
    if (!_1331)
    {
        _1339 = _111;
    }
    float _1365 = _1339;
    float _1367 = _1365;
    float _1369 = _1365;
    if (!_1331)
    {
        _1341 = _113;
    }
    float _1371 = _1341;
    float _1373 = _1371;
    float _1375 = _1371;
    if (!_1331)
    {
        _1247 = _115;
    }
    float _1377 = _1247;
    bool _1379 = !_1331;
    float _1381 = _1377;
    float _1383 = _1377;
    if (!_1379)
    {
        bool _1385 = _1309 > _1229;
        if (_1385)
        {
            _1343 = _1229;
        }
        float _1387 = _1343;
        _1349 = _1387;
        if (!_1385)
        {
            _1367 = _1311;
        }
        float _1389 = _1367;
        float _1391 = _1389;
        if (!_1385)
        {
            _1373 = _1313;
        }
        float _1393 = _1373;
        float _1395 = _1393;
        if (!_1385)
        {
            _1381 = _1315;
        }
        float _1397 = _1381;
        float _1399 = _1397;
        if (!_1385)
        {
            _1249 = _1307;
        }
        float _1401 = _1249;
        float _1403 = _1401;
        if (_1385)
        {
            _1391 = _1311;
        }
        float _1405 = _1391;
        _1369 = _1405;
        if (_1385)
        {
            _1395 = _1313;
        }
        float _1407 = _1395;
        _1375 = _1407;
        if (_1385)
        {
            _1399 = _1315;
        }
        float _1409 = _1399;
        _1383 = _1409;
        if (_1385)
        {
            _1403 = _1307;
        }
        float _1411 = _1403;
        _1251 = _1411;
        if (_1385)
        {
            _1345 = _111;
        }
        float _1413 = _1345;
        _1351 = _1413;
        if (_1385)
        {
            _1347 = _113;
        }
        float _1415 = _1347;
        _1353 = _1415;
        if (_1385)
        {
            _1355 = _115;
        }
    }
    float _1417 = _1251;
    float _1419 = _1349;
    float _1421 = _1369;
    float _1423 = _1375;
    float _1425 = _1383;
    float _1427 = _1351;
    float _1429 = _1353;
    float _1431 = _1355;
    bool _1433 = _1417 >= _1337;
    bool _1435 = isnan(_1417);
    bool _1437 = _1433 || _1435;
    bool _1439 = isnan(_1337);
    bool _1441 = _1437 || _1439;
    float _1443 = _129 * _819;
    float _1445 = fma(_127, _821, _1443);
    float _1447 = fma(_131, _823, _1445);
    float _1449 = _1419;
    float _1451 = _1427;
    float _1453 = _1429;
    float _1455 = _1419;
    float _1457 = _1427;
    float _1459 = _1429;
    float _1461 = _1431;
    float _1463 = _1425;
    float _1465 = _1447;
    float _1467 = _1447;
    if (!_1441)
    {
        _1357 = _119;
    }
    float _1469 = _1357;
    float _1471 = _1469;
    float _1473 = _1469;
    if (!_1441)
    {
        _1359 = _121;
    }
    float _1475 = _1359;
    float _1477 = _1475;
    float _1479 = _1475;
    if (!_1441)
    {
        _1253 = _123;
    }
    float _1481 = _1253;
    bool _1483 = !_1441;
    float _1485 = _1481;
    float _1487 = _1481;
    if (!_1483)
    {
        bool _1489 = _1419 > _1337;
        if (_1489)
        {
            _1449 = _1337;
        }
        float _1491 = _1449;
        _1455 = _1491;
        if (!_1489)
        {
            _1471 = _1421;
        }
        float _1493 = _1471;
        float _1495 = _1493;
        if (!_1489)
        {
            _1477 = _1423;
        }
        float _1497 = _1477;
        float _1499 = _1497;
        if (!_1489)
        {
            _1485 = _1425;
        }
        float _1501 = _1485;
        float _1503 = _1501;
        if (!_1489)
        {
            _1361 = _1417;
        }
        float _1505 = _1361;
        float _1507 = _1505;
        if (_1489)
        {
            _1495 = _1421;
        }
        float _1509 = _1495;
        _1473 = _1509;
        if (_1489)
        {
            _1499 = _1423;
        }
        float _1511 = _1499;
        _1479 = _1511;
        if (_1489)
        {
            _1503 = _1425;
        }
        float _1513 = _1503;
        _1487 = _1513;
        if (_1489)
        {
            _1507 = _1417;
        }
        float _1515 = _1507;
        _1363 = _1515;
        if (_1489)
        {
            _1451 = _119;
        }
        float _1517 = _1451;
        _1457 = _1517;
        if (_1489)
        {
            _1453 = _121;
        }
        float _1519 = _1453;
        _1459 = _1519;
        if (_1489)
        {
            _1461 = _123;
        }
    }
    float _1521 = _1363;
    float _1523 = _1455;
    float _1525 = _1473;
    float _1527 = _1479;
    float _1529 = _1487;
    float _1531 = _1457;
    float _1533 = _1459;
    float _1535 = _1461;
    bool _1537 = _1521 >= _1447;
    bool _1539 = isnan(_1521);
    bool _1541 = _1537 || _1539;
    bool _1543 = isnan(_1447);
    bool _1545 = _1541 || _1543;
    float _1547 = _137 * _819;
    float _1549 = fma(_135, _821, _1547);
    float _1551 = fma(_139, _823, _1549);
    float _1553 = _1549;
    float _1555 = _1547;
    float _1557 = _1523;
    float _1559 = _1531;
    float _1561 = _1533;
    float _1563 = _1523;
    float _1565 = _1531;
    float _1567 = _1533;
    float _1569 = _1535;
    float _1571 = _1529;
    float _1573 = _1525;
    float _1575 = _1551;
    float _1577 = _1551;
    if (!_1545)
    {
        _1553 = _127;
    }
    float _1579 = _1553;
    float _1581 = _1579;
    float _1583 = _1579;
    if (!_1545)
    {
        _1555 = _129;
    }
    float _1585 = _1555;
    float _1587 = _1585;
    float _1589 = _1585;
    if (!_1545)
    {
        _1463 = _131;
    }
    float _1591 = _1463;
    bool _1593 = !_1545;
    float _1595 = _1591;
    float _1597 = _1591;
    if (!_1593)
    {
        bool _1599 = _1523 > _1447;
        if (_1599)
        {
            _1557 = _1447;
        }
        float _1601 = _1557;
        _1563 = _1601;
        if (!_1599)
        {
            _1581 = _1525;
        }
        float _1603 = _1581;
        float _1605 = _1603;
        if (!_1599)
        {
            _1587 = _1527;
        }
        float _1607 = _1587;
        float _1609 = _1607;
        if (!_1599)
        {
            _1595 = _1529;
        }
        float _1611 = _1595;
        float _1613 = _1611;
        if (!_1599)
        {
            _1465 = _1521;
        }
        float _1615 = _1465;
        float _1617 = _1615;
        if (_1599)
        {
            _1605 = _1525;
        }
        float _1619 = _1605;
        _1583 = _1619;
        if (_1599)
        {
            _1609 = _1527;
        }
        float _1621 = _1609;
        _1589 = _1621;
        if (_1599)
        {
            _1613 = _1529;
        }
        float _1623 = _1613;
        _1597 = _1623;
        if (_1599)
        {
            _1617 = _1521;
        }
        float _1625 = _1617;
        _1467 = _1625;
        if (_1599)
        {
            _1559 = _127;
        }
        float _1627 = _1559;
        _1565 = _1627;
        if (_1599)
        {
            _1561 = _129;
        }
        float _1629 = _1561;
        _1567 = _1629;
        if (_1599)
        {
            _1569 = _131;
        }
    }
    float _1631 = _1467;
    float _1633 = _1563;
    float _1635 = _1583;
    float _1637 = _1589;
    float _1639 = _1597;
    float _1641 = _1565;
    float _1643 = _1567;
    float _1645 = _1569;
    bool _1647 = _1631 >= _1551;
    bool _1649 = isnan(_1631);
    bool _1651 = _1647 || _1649;
    bool _1653 = isnan(_1551);
    bool _1655 = _1651 || _1653;
    float _1657 = _145 * _819;
    float _1659 = fma(_143, _821, _1657);
    float _1661 = fma(_147, _823, _1659);
    float _1663 = _1659;
    float _1665 = _1633;
    float _1667 = _1641;
    float _1669 = _1643;
    float _1671 = _1633;
    float _1673 = _1641;
    float _1675 = _1643;
    float _1677 = _1645;
    float _1679 = _1639;
    float _1681 = _1661;
    float _1683 = _1661;
    float _1685 = _1631;
    if (!_1655)
    {
        _1571 = _135;
    }
    float _1687 = _1571;
    float _1689 = _1687;
    float _1691 = _1687;
    if (!_1655)
    {
        _1663 = _137;
    }
    float _1693 = _1663;
    float _1695 = _1693;
    float _1697 = _1693;
    if (!_1655)
    {
        _1573 = _139;
    }
    float _1699 = _1573;
    bool _1701 = !_1655;
    float _1703 = _1699;
    float _1705 = _1699;
    if (!_1701)
    {
        bool _1707 = _1633 > _1551;
        if (_1707)
        {
            _1665 = _1551;
        }
        float _1709 = _1665;
        _1671 = _1709;
        if (!_1707)
        {
            _1689 = _1635;
        }
        float _1711 = _1689;
        float _1713 = _1711;
        if (!_1707)
        {
            _1695 = _1637;
        }
        float _1715 = _1695;
        float _1717 = _1715;
        if (!_1707)
        {
            _1703 = _1639;
        }
        float _1719 = _1703;
        float _1721 = _1719;
        if (!_1707)
        {
            _1575 = _1631;
        }
        float _1723 = _1575;
        float _1725 = _1723;
        if (_1707)
        {
            _1713 = _1635;
        }
        float _1727 = _1713;
        _1691 = _1727;
        if (_1707)
        {
            _1717 = _1637;
        }
        float _1729 = _1717;
        _1697 = _1729;
        if (_1707)
        {
            _1721 = _1639;
        }
        float _1731 = _1721;
        _1705 = _1731;
        if (_1707)
        {
            _1725 = _1631;
        }
        float _1733 = _1725;
        _1577 = _1733;
        if (_1707)
        {
            _1667 = _135;
        }
        float _1735 = _1667;
        _1673 = _1735;
        if (_1707)
        {
            _1669 = _137;
        }
        float _1737 = _1669;
        _1675 = _1737;
        if (_1707)
        {
            _1677 = _139;
        }
    }
    float _1739 = _1577;
    float _1741 = _1671;
    float _1743 = _1691;
    float _1745 = _1697;
    float _1747 = _1705;
    float _1749 = _1673;
    float _1751 = _1675;
    float _1753 = _1677;
    bool _1755 = _1739 >= _1661;
    bool _1757 = isnan(_1739);
    bool _1759 = _1755 || _1757;
    bool _1761 = isnan(_1661);
    bool _1763 = _1759 || _1761;
    float _1765 = _153 * _819;
    float _1767 = fma(_151, _821, _1765);
    float _1769 = fma(_155, _823, _1767);
    float _1771 = _1765;
    float _1773 = _1767;
    float _1775 = _1741;
    float _1777 = _1749;
    float _1779 = _1751;
    float _1781 = _1741;
    float _1783 = _1749;
    float _1785 = _1751;
    float _1787 = _1753;
    float _1789 = _1747;
    float _1791 = _1769;
    float _1793 = _1769;
    if (!_1763)
    {
        _1679 = _143;
    }
    float _1795 = _1679;
    float _1797 = _1795;
    float _1799 = _1795;
    if (!_1763)
    {
        _1771 = _145;
    }
    float _1801 = _1771;
    float _1803 = _1801;
    float _1805 = _1801;
    if (!_1763)
    {
        _1773 = _147;
    }
    float _1807 = _1773;
    bool _1809 = !_1763;
    float _1811 = _1807;
    float _1813 = _1807;
    if (!_1809)
    {
        bool _1815 = _1741 > _1661;
        if (_1815)
        {
            _1775 = _1661;
        }
        float _1817 = _1775;
        _1781 = _1817;
        if (!_1815)
        {
            _1797 = _1743;
        }
        float _1819 = _1797;
        float _1821 = _1819;
        if (!_1815)
        {
            _1803 = _1745;
        }
        float _1823 = _1803;
        float _1825 = _1823;
        if (!_1815)
        {
            _1811 = _1747;
        }
        float _1827 = _1811;
        float _1829 = _1827;
        if (!_1815)
        {
            _1681 = _1739;
        }
        float _1831 = _1681;
        float _1833 = _1831;
        if (_1815)
        {
            _1821 = _1743;
        }
        float _1835 = _1821;
        _1799 = _1835;
        if (_1815)
        {
            _1825 = _1745;
        }
        float _1837 = _1825;
        _1805 = _1837;
        if (_1815)
        {
            _1829 = _1747;
        }
        float _1839 = _1829;
        _1813 = _1839;
        if (_1815)
        {
            _1833 = _1739;
        }
        float _1841 = _1833;
        _1683 = _1841;
        if (_1815)
        {
            _1777 = _143;
        }
        float _1843 = _1777;
        _1783 = _1843;
        if (_1815)
        {
            _1779 = _145;
        }
        float _1845 = _1779;
        _1785 = _1845;
        if (_1815)
        {
            _1787 = _147;
        }
    }
    float _1847 = _1683;
    float _1849 = _1781;
    float _1851 = _1799;
    float _1853 = _1805;
    float _1855 = _1813;
    float _1857 = _1783;
    float _1859 = _1785;
    float _1861 = _1787;
    bool _1863 = _1847 >= _1769;
    bool _1865 = isnan(_1847);
    bool _1867 = _1863 || _1865;
    bool _1869 = isnan(_1769);
    bool _1871 = _1867 || _1869;
    float _1873 = _161 * _819;
    float _1875 = fma(_159, _821, _1873);
    float _1877 = fma(_163, _823, _1875);
    float _1879 = _1875;
    float _1881 = _1849;
    float _1883 = _1857;
    float _1885 = _1859;
    float _1887 = _1849;
    float _1889 = _1857;
    float _1891 = _1859;
    float _1893 = _1861;
    float _1895 = _1851;
    float _1897 = _1855;
    float _1899 = _1877;
    float _1901 = _1877;
    if (!_1871)
    {
        _1789 = _151;
    }
    float _1903 = _1789;
    float _1905 = _1903;
    float _1907 = _1903;
    if (!_1871)
    {
        _1685 = _153;
    }
    float _1909 = _1685;
    float _1911 = _1909;
    float _1913 = _1909;
    if (!_1871)
    {
        _1879 = _155;
    }
    float _1915 = _1879;
    bool _1917 = !_1871;
    float _1919 = _1915;
    float _1921 = _1915;
    if (!_1917)
    {
        bool _1923 = _1849 > _1769;
        if (_1923)
        {
            _1881 = _1769;
        }
        float _1925 = _1881;
        _1887 = _1925;
        if (!_1923)
        {
            _1905 = _1851;
        }
        float _1927 = _1905;
        float _1929 = _1927;
        if (!_1923)
        {
            _1911 = _1853;
        }
        float _1931 = _1911;
        float _1933 = _1931;
        if (!_1923)
        {
            _1919 = _1855;
        }
        float _1935 = _1919;
        float _1937 = _1935;
        if (!_1923)
        {
            _1791 = _1847;
        }
        float _1939 = _1791;
        float _1941 = _1939;
        if (_1923)
        {
            _1929 = _1851;
        }
        float _1943 = _1929;
        _1907 = _1943;
        if (_1923)
        {
            _1933 = _1853;
        }
        float _1945 = _1933;
        _1913 = _1945;
        if (_1923)
        {
            _1937 = _1855;
        }
        float _1947 = _1937;
        _1921 = _1947;
        if (_1923)
        {
            _1941 = _1847;
        }
        float _1949 = _1941;
        _1793 = _1949;
        if (_1923)
        {
            _1883 = _151;
        }
        float _1951 = _1883;
        _1889 = _1951;
        if (_1923)
        {
            _1885 = _153;
        }
        float _1953 = _1885;
        _1891 = _1953;
        if (_1923)
        {
            _1893 = _155;
        }
    }
    float _1955 = _1793;
    float _1957 = _1887;
    float _1959 = _1907;
    float _1961 = _1913;
    float _1963 = _1921;
    float _1965 = _1889;
    float _1967 = _1891;
    float _1969 = _1893;
    bool _1971 = _1955 >= _1877;
    bool _1973 = isnan(_1955);
    bool _1975 = _1971 || _1973;
    bool _1977 = isnan(_1877);
    bool _1979 = _1975 || _1977;
    float _1981 = _169 * _819;
    float _1983 = fma(_167, _821, _1981);
    float _1985 = fma(_171, _823, _1983);
    float _1987 = _1983;
    float _1989 = _1957;
    float _1991 = _1965;
    float _1993 = _1967;
    float _1995 = _1957;
    float _1997 = _1965;
    float _1999 = _1967;
    float _2001 = _1969;
    float _2003 = _1959;
    float _2005 = _1961;
    float _2007 = _1985;
    float _2009 = _1985;
    if (!_1979)
    {
        _1895 = _159;
    }
    float _2011 = _1895;
    float _2013 = _2011;
    float _2015 = _2011;
    if (!_1979)
    {
        _1987 = _161;
    }
    float _2017 = _1987;
    float _2019 = _2017;
    float _2021 = _2017;
    if (!_1979)
    {
        _1897 = _163;
    }
    float _2023 = _1897;
    bool _2025 = !_1979;
    float _2027 = _2023;
    float _2029 = _2023;
    if (!_2025)
    {
        bool _2031 = _1957 > _1877;
        if (_2031)
        {
            _1989 = _1877;
        }
        float _2033 = _1989;
        _1995 = _2033;
        if (!_2031)
        {
            _2013 = _1959;
        }
        float _2035 = _2013;
        float _2037 = _2035;
        if (!_2031)
        {
            _2019 = _1961;
        }
        float _2039 = _2019;
        float _2041 = _2039;
        if (!_2031)
        {
            _2027 = _1963;
        }
        float _2043 = _2027;
        float _2045 = _2043;
        if (!_2031)
        {
            _1899 = _1955;
        }
        float _2047 = _1899;
        float _2049 = _2047;
        if (_2031)
        {
            _2037 = _1959;
        }
        float _2051 = _2037;
        _2015 = _2051;
        if (_2031)
        {
            _2041 = _1961;
        }
        float _2053 = _2041;
        _2021 = _2053;
        if (_2031)
        {
            _2045 = _1963;
        }
        float _2055 = _2045;
        _2029 = _2055;
        if (_2031)
        {
            _2049 = _1955;
        }
        float _2057 = _2049;
        _1901 = _2057;
        if (_2031)
        {
            _1991 = _159;
        }
        float _2059 = _1991;
        _1997 = _2059;
        if (_2031)
        {
            _1993 = _161;
        }
        float _2061 = _1993;
        _1999 = _2061;
        if (_2031)
        {
            _2001 = _163;
        }
    }
    float _2063 = _1901;
    float _2065 = _1995;
    float _2067 = _2015;
    float _2069 = _2021;
    float _2071 = _2029;
    float _2073 = _1997;
    float _2075 = _1999;
    float _2077 = _2001;
    bool _2079 = _2063 >= _1985;
    bool _2081 = isnan(_2063);
    bool _2083 = _2079 || _2081;
    bool _2085 = isnan(_1985);
    bool _2087 = _2083 || _2085;
    float _2089 = _177 * _819;
    float _2091 = fma(_175, _821, _2089);
    float _2093 = fma(_179, _823, _2091);
    float _2095 = _2089;
    float _2097 = _2065;
    float _2099 = _2073;
    float _2101 = _2075;
    float _2103 = _2065;
    float _2105 = _2073;
    float _2107 = _2075;
    float _2109 = _2077;
    float _2111 = _2067;
    float _2113 = _2071;
    float _2115 = _2093;
    float _2117 = _2093;
    if (!_2087)
    {
        _2003 = _167;
    }
    float _2119 = _2003;
    float _2121 = _2119;
    float _2123 = _2119;
    if (!_2087)
    {
        _2005 = _169;
    }
    float _2125 = _2005;
    float _2127 = _2125;
    float _2129 = _2125;
    if (!_2087)
    {
        _2095 = _171;
    }
    float _2131 = _2095;
    bool _2133 = !_2087;
    float _2135 = _2131;
    float _2137 = _2131;
    if (!_2133)
    {
        bool _2139 = _2065 > _1985;
        if (_2139)
        {
            _2097 = _1985;
        }
        float _2141 = _2097;
        _2103 = _2141;
        if (!_2139)
        {
            _2121 = _2067;
        }
        float _2143 = _2121;
        float _2145 = _2143;
        if (!_2139)
        {
            _2127 = _2069;
        }
        float _2147 = _2127;
        float _2149 = _2147;
        if (!_2139)
        {
            _2135 = _2071;
        }
        float _2151 = _2135;
        float _2153 = _2151;
        if (!_2139)
        {
            _2007 = _2063;
        }
        float _2155 = _2007;
        float _2157 = _2155;
        if (_2139)
        {
            _2145 = _2067;
        }
        float _2159 = _2145;
        _2123 = _2159;
        if (_2139)
        {
            _2149 = _2069;
        }
        float _2161 = _2149;
        _2129 = _2161;
        if (_2139)
        {
            _2153 = _2071;
        }
        float _2163 = _2153;
        _2137 = _2163;
        if (_2139)
        {
            _2157 = _2063;
        }
        float _2165 = _2157;
        _2009 = _2165;
        if (_2139)
        {
            _2099 = _167;
        }
        float _2167 = _2099;
        _2105 = _2167;
        if (_2139)
        {
            _2101 = _169;
        }
        float _2169 = _2101;
        _2107 = _2169;
        if (_2139)
        {
            _2109 = _171;
        }
    }
    float _2171 = _2009;
    float _2173 = _2103;
    float _2175 = _2123;
    float _2177 = _2129;
    float _2179 = _2137;
    float _2181 = _2105;
    float _2183 = _2107;
    float _2185 = _2109;
    bool _2187 = _2171 >= _2093;
    bool _2189 = isnan(_2171);
    bool _2191 = _2187 || _2189;
    bool _2193 = isnan(_2093);
    bool _2195 = _2191 || _2193;
    float _2197 = _185 * _819;
    float _2199 = fma(_183, _821, _2197);
    float _2201 = fma(_187, _823, _2199);
    float _2203 = _2199;
    float _2205 = _2173;
    float _2207 = _2181;
    float _2209 = _2183;
    float _2211 = _2181;
    float _2213 = _2173;
    float _2215 = _2183;
    float _2217 = _2185;
    float _2219 = _2177;
    float _2221 = _2201;
    float _2223 = _2201;
    if (!_2195)
    {
        _2111 = _175;
    }
    float _2225 = _2111;
    float _2227 = _2225;
    float _2229 = _2225;
    if (!_2195)
    {
        _2203 = _177;
    }
    float _2231 = _2203;
    float _2233 = _2231;
    float _2235 = _2231;
    if (!_2195)
    {
        _2113 = _179;
    }
    float _2237 = _2113;
    bool _2239 = !_2195;
    float _2241 = _2237;
    float _2243 = _2237;
    if (!_2239)
    {
        bool _2245 = _2173 > _2093;
        if (_2245)
        {
            _2205 = _2093;
        }
        float _2247 = _2205;
        _2213 = _2247;
        if (!_2245)
        {
            _2227 = _2175;
        }
        float _2249 = _2227;
        float _2251 = _2249;
        if (!_2245)
        {
            _2233 = _2177;
        }
        float _2253 = _2233;
        float _2255 = _2253;
        if (!_2245)
        {
            _2241 = _2179;
        }
        float _2257 = _2241;
        float _2259 = _2257;
        if (!_2245)
        {
            _2115 = _2171;
        }
        float _2261 = _2115;
        float _2263 = _2261;
        if (_2245)
        {
            _2251 = _2175;
        }
        float _2265 = _2251;
        _2229 = _2265;
        if (_2245)
        {
            _2255 = _2177;
        }
        float _2267 = _2255;
        _2235 = _2267;
        if (_2245)
        {
            _2259 = _2179;
        }
        float _2269 = _2259;
        _2243 = _2269;
        if (_2245)
        {
            _2263 = _2171;
        }
        float _2271 = _2263;
        _2117 = _2271;
        if (_2245)
        {
            _2207 = _175;
        }
        float _2273 = _2207;
        _2211 = _2273;
        if (_2245)
        {
            _2209 = _177;
        }
        float _2275 = _2209;
        _2215 = _2275;
        if (_2245)
        {
            _2217 = _179;
        }
    }
    float _2277 = _2117;
    float _2279 = _2211;
    float _2281 = _2213;
    float _2283 = _2229;
    float _2285 = _2235;
    float _2287 = _2243;
    float _2289 = _2215;
    float _2291 = _2217;
    bool _2293 = _2277 >= _2201;
    bool _2295 = isnan(_2277);
    bool _2297 = _2293 || _2295;
    bool _2299 = isnan(_2201);
    bool _2301 = _2297 || _2299;
    float _2303 = _193 * _819;
    float _2305 = fma(_191, _821, _2303);
    float _2307 = fma(_195, _823, _2305);
    float _2309 = _2305;
    float _2311 = _2281;
    float _2313 = _2289;
    float _2315 = _2289;
    float _2317 = _2291;
    float _2319 = _2281;
    float _2321 = _2283;
    float _2323 = _2285;
    if (!_2301)
    {
        _2309 = _2279;
    }
    float _2325 = _2309;
    float _2327 = _2325;
    float _2329 = _2325;
    if (!_2301)
    {
        _879 = _183;
    }
    float _2331 = _879;
    float _2333 = _2331;
    float _2335 = _2331;
    if (!_2301)
    {
        _881 = _185;
    }
    float _2337 = _881;
    float _2339 = _2337;
    float _2341 = _2337;
    if (!_2301)
    {
        _2219 = _187;
    }
    float _2343 = _2219;
    bool _2345 = !_2301;
    float _2347 = _2343;
    float _2349 = _2343;
    if (!_2345)
    {
        bool _2351 = _2281 > _2201;
        if (_2351)
        {
            _2311 = _2201;
        }
        float _2353 = _2311;
        _2319 = _2353;
        if (!_2351)
        {
            _2333 = _2283;
        }
        float _2355 = _2333;
        float _2357 = _2355;
        if (!_2351)
        {
            _2339 = _2285;
        }
        float _2359 = _2339;
        float _2361 = _2359;
        if (!_2351)
        {
            _2347 = _2287;
        }
        float _2363 = _2347;
        float _2365 = _2363;
        if (!_2351)
        {
            _2221 = _2277;
        }
        float _2367 = _2221;
        float _2369 = _2367;
        if (!_2351)
        {
            _2327 = _2279;
        }
        float _2371 = _2327;
        float _2373 = _2371;
        if (_2351)
        {
            _2357 = _2283;
        }
        float _2375 = _2357;
        _2335 = _2375;
        if (_2351)
        {
            _2361 = _2285;
        }
        float _2377 = _2361;
        _2341 = _2377;
        if (_2351)
        {
            _2365 = _2287;
        }
        float _2379 = _2365;
        _2349 = _2379;
        if (_2351)
        {
            _2369 = _2277;
        }
        float _2381 = _2369;
        _2223 = _2381;
        if (_2351)
        {
            _2373 = _183;
        }
        float _2383 = _2373;
        _2329 = _2383;
        if (_2351)
        {
            _2313 = _185;
        }
        float _2385 = _2313;
        _2315 = _2385;
        if (_2351)
        {
            _2317 = _187;
        }
    }
    float _2387 = _2223;
    float _2389 = _2315;
    float _2391 = _2317;
    float _2393 = _2319;
    float _2395 = _2335;
    float _2397 = _2341;
    float _2399 = _2349;
    float _2401 = _2329;
    bool _2403 = _2387 >= _2307;
    bool _2405 = isnan(_2387);
    bool _2407 = _2403 || _2405;
    bool _2409 = isnan(_2307);
    bool _2411 = _2407 || _2409;
    float _2413 = _2401;
    float _2415 = _2401;
    if (!_2411)
    {
        _2321 = _2389;
    }
    float _2417 = _2321;
    float _2419 = _2417;
    float _2421 = _2417;
    if (!_2411)
    {
        _2323 = _2391;
    }
    float _2423 = _2323;
    float _2425 = _2423;
    float _2427 = _2423;
    if (!_2411)
    {
        _883 = _191;
    }
    float _2429 = _883;
    float _2431 = _2429;
    float _2433 = _2429;
    if (!_2411)
    {
        _885 = _193;
    }
    float _2435 = _885;
    float _2437 = 0.0;
    float _2439 = _2435;
    float _2441 = _2435;
    if (!_2411)
    {
        _2437 = _195;
    }
    float _2443 = _2437;
    bool _2445 = !_2411;
    float _2447 = _2443;
    float _2449 = _2443;
    if (!_2445)
    {
        bool _2451 = _2393 > _2307;
        if (!_2451)
        {
            _2431 = _2395;
        }
        float _2453 = _2431;
        float _2455 = _2453;
        if (!_2451)
        {
            _2439 = _2397;
        }
        float _2457 = _2439;
        float _2459 = _2457;
        if (!_2451)
        {
            _2447 = _2399;
        }
        float _2461 = _2447;
        float _2463 = _2461;
        if (!_2451)
        {
            _2419 = _2389;
        }
        float _2465 = _2419;
        float _2467 = _2465;
        if (!_2451)
        {
            _2425 = _2391;
        }
        float _2469 = _2425;
        _2427 = _2469;
        if (_2451)
        {
            _2455 = _2395;
        }
        float _2471 = _2455;
        _2433 = _2471;
        if (_2451)
        {
            _2459 = _2397;
        }
        float _2473 = _2459;
        _2441 = _2473;
        if (_2451)
        {
            _2463 = _2399;
        }
        float _2475 = _2463;
        _2449 = _2475;
        if (_2451)
        {
            _2413 = _191;
        }
        float _2477 = _2413;
        _2415 = _2477;
        if (_2451)
        {
            _2467 = _193;
        }
        float _2479 = _2467;
        _2421 = _2479;
        if (_2451)
        {
            _2427 = _195;
        }
    }
    float _2481 = _2421;
    float _2483 = _2441;
    float _2485 = _2415;
    float _2487 = _2433;
    float _2489 = _2427;
    float _2491 = _2449;
    float _2493 = -_2481;
    float _2495 = _2483 + _2493;
    float _2497 = -_2485;
    float _2499 = _2487 + _2497;
    float _2501 = -_2489;
    float _2503 = _2491 + _2501;
    float _2505 = _2495 * _2495;
    float _2507 = fma(_2499, _2499, _2505);
    float _2509 = -_2485;
    float _2511 = _71 + _2509;
    float _2513 = fma(_2503, _2503, _2507);
    float _2515 = -_2481;
    float _2517 = _73 + _2515;
    float _2519 = _2495 * _2517;
    float _2521 = 1.0 / _2513;
    float _2523 = -_2489;
    float _2525 = _75 + _2523;
    float _2527 = fma(_2499, _2511, _2519);
    float _2529 = fma(_2503, _2525, _2527);
    float _2531 = _2521 * 3.0;
    float _2533 = _2531 * _2529;
    float _2535 = rint(_2533);
    float _2537 = precise::max(0.0, _2535);
    float _2539 = precise::min(_2537, 3.0);
    float _2541 = trunc(_2539);
    int _2544 = int(_2541);
    bool _2546 = _2544 >= 2;
    bool _2548 = !_2546;
    float _2550 = _2499;
    float _2552 = _2495;
    float _2554 = _2503;
    float _2556 = _2485;
    float _2558 = _2487;
    float _2560 = _2481;
    float _2562 = _2483;
    float _2564 = _2491;
    float _2566 = _2489;
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
    float _2600;
    float _2602;
    float _2604;
    float _2606;
    if (!_2548)
    {
        bool _2568 = _2544 >= 3;
        bool _2570 = !_2568;
        if (!_2570)
        {
            bool _2572 = _2544 != 3;
            _2574 = _2572;
            if (!_2574)
            {
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
                _2600 = 0.0;
                _2602 = 0.0;
                _2604 = 0.0;
                _2606 = 0.0;
                _2608 = true;
            }
        }
        else
        {
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
            _2600 = 0.0;
            _2602 = 0.0;
            _2604 = 0.0;
            _2606 = 0.0;
            _2608 = true;
        }
    }
    if ((!_2608) || _2574)
    {
        bool _2610;
        if (!_2574)
        {
            _2610 = _2544 >= 1;
        }
        if ((!_2610) || _2574)
        {
            bool _2612;
            if (!_2574)
            {
                _2612 = _2544 != 0;
            }
            if ((!_2612) && (!_2574))
            {
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
                _2600 = 0.0;
                _2602 = 0.0;
                _2604 = 0.0;
                _2606 = 0.0;
                _2608 = true;
            }
            else
            {
                _2574 = false;
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
                _2600 = 0.0;
                _2602 = 0.0;
                _2604 = 0.0;
                _2606 = 0.0;
                _2608 = true;
            }
        }
        else
        {
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
            _2600 = _71;
            _2602 = _73;
            _2604 = _75;
            _2606 = 1.0;
        }
    }
    _2608 = false;
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
    float _2638 = _2600;
    float _2640 = _2602;
    float _2642 = _2604;
    float _2644 = _2606;
    float _2646 = -_2481;
    float _2648 = _81 + _2646;
    float _2650 = -_2485;
    float _2652 = _79 + _2650;
    float _2654 = _2495 * _2648;
    float _2656 = -_2489;
    float _2658 = _83 + _2656;
    float _2660 = fma(_2499, _2652, _2654);
    float _2662 = fma(_2503, _2658, _2660);
    float _2664 = _2531 * _2662;
    float _2666 = rint(_2664);
    float _2668 = precise::max(0.0, _2666);
    float _2670 = precise::min(_2668, 3.0);
    float _2672 = trunc(_2670);
    int _2674 = int(_2672);
    bool _2676 = _2674 >= 2;
    bool _2678 = !_2676;
    float _2680 = as_type<float>(_2674);
    float _2682 = _2666;
    float _2684 = _2660;
    float _2686 = _2654;
    float _2688 = _2614;
    float _2690 = _2616;
    float _2692 = _2618;
    float _2694 = _2620;
    float _2696 = _2630;
    float _2698 = _2632;
    float _2700 = _2634;
    float _2702 = _2636;
    float _2704 = _2638;
    float _2706 = _2640;
    float _2708 = _2642;
    float _2710 = _2644;
    float _2728;
    float _2730;
    float _2732;
    float _2734;
    if (!_2678)
    {
        bool _2712 = _2674 >= 3;
        bool _2714 = !_2712;
        if (!_2714)
        {
            bool _2716 = _2674 != 3;
            _2718 = _2716;
            if (!_2718)
            {
                float _2720 = _79 + _2614;
                float _2722 = _81 + _2616;
                float _2724 = _83 + _2618;
                float _2726 = _2620 + 1.0;
                _2688 = _2720;
                _2690 = _2722;
                _2692 = _2724;
                _2694 = _2726;
                _2728 = _2622;
                _2730 = _2624;
                _2732 = _2626;
                _2734 = _2628;
                _2736 = true;
            }
        }
        else
        {
            float _2738 = _79 + _2630;
            float _2740 = _81 + _2632;
            float _2742 = _83 + _2634;
            float _2744 = _2636 + 1.0;
            _2728 = _2622;
            _2730 = _2624;
            _2732 = _2626;
            _2734 = _2628;
            _2696 = _2738;
            _2698 = _2740;
            _2700 = _2742;
            _2702 = _2744;
            _2736 = true;
        }
    }
    if ((!_2736) || _2718)
    {
        bool _2746;
        if (!_2718)
        {
            _2746 = _2674 >= 1;
        }
        if ((!_2746) || _2718)
        {
            if (!_2718)
            {
                bool _2748 = _2674 != 0;
                if (!_2748)
                {
                    float _2750 = _79 + _2622;
                    _2680 = _2750;
                }
                float _2752 = _2680;
                _2728 = _2752;
                if (!_2748)
                {
                    float _2754 = _81 + _2624;
                    _2682 = _2754;
                }
                float _2756 = _2682;
                _2730 = _2756;
                if (!_2748)
                {
                    float _2758 = _83 + _2626;
                    _2684 = _2758;
                }
                float _2760 = _2684;
                _2732 = _2760;
                if (!_2748)
                {
                    float _2762 = _2628 + 1.0;
                    _2686 = _2762;
                }
                float _2764 = _2686;
                bool _2766 = !_2748;
                _2734 = _2764;
                _2736 = _2766;
            }
            if ((!_2736) || _2718)
            {
                _2718 = false;
                _2728 = _2622;
                _2730 = _2624;
                _2732 = _2626;
                _2734 = _2628;
                _2736 = true;
            }
        }
        else
        {
            float _2768 = _79 + _2638;
            float _2770 = _81 + _2640;
            float _2772 = _83 + _2642;
            float _2774 = _2644 + 1.0;
            _2728 = _2622;
            _2730 = _2624;
            _2732 = _2626;
            _2734 = _2628;
            _2704 = _2768;
            _2706 = _2770;
            _2708 = _2772;
            _2710 = _2774;
        }
    }
    _2736 = false;
    float _2776 = _2688;
    float _2778 = _2690;
    float _2780 = _2692;
    float _2782 = _2694;
    float _2784 = _2728;
    float _2786 = _2730;
    float _2788 = _2732;
    float _2790 = _2734;
    float _2792 = _2696;
    float _2794 = _2698;
    float _2796 = _2700;
    float _2798 = _2702;
    float _2800 = _2704;
    float _2802 = _2706;
    float _2804 = _2708;
    float _2806 = _2710;
    float _2808 = -_2481;
    float _2810 = _89 + _2808;
    float _2812 = -_2485;
    float _2814 = _87 + _2812;
    float _2816 = _2495 * _2810;
    float _2818 = -_2489;
    float _2820 = _91 + _2818;
    float _2822 = fma(_2499, _2814, _2816);
    float _2824 = fma(_2503, _2820, _2822);
    float _2826 = _2531 * _2824;
    float _2828 = rint(_2826);
    float _2830 = precise::max(0.0, _2828);
    float _2832 = precise::min(_2830, 3.0);
    float _2834 = trunc(_2832);
    int _2836 = int(_2834);
    bool _2838 = _2836 >= 2;
    bool _2840 = !_2838;
    float _2842 = as_type<float>(_2836);
    float _2844 = _2828;
    float _2846 = _2822;
    float _2848 = _2816;
    float _2850 = _2776;
    float _2852 = _2778;
    float _2854 = _2780;
    float _2856 = _2782;
    float _2858 = _2792;
    float _2860 = _2794;
    float _2862 = _2796;
    float _2864 = _2798;
    float _2866 = _2800;
    float _2868 = _2802;
    float _2870 = _2804;
    float _2872 = _2806;
    float _2890;
    float _2892;
    float _2894;
    float _2896;
    if (!_2840)
    {
        bool _2874 = _2836 >= 3;
        bool _2876 = !_2874;
        if (!_2876)
        {
            bool _2878 = _2836 != 3;
            _2880 = _2878;
            if (!_2880)
            {
                float _2882 = _87 + _2776;
                float _2884 = _89 + _2778;
                float _2886 = _91 + _2780;
                float _2888 = _2782 + 1.0;
                _2850 = _2882;
                _2852 = _2884;
                _2854 = _2886;
                _2856 = _2888;
                _2890 = _2784;
                _2892 = _2786;
                _2894 = _2788;
                _2896 = _2790;
                _2898 = true;
            }
        }
        else
        {
            float _2900 = _87 + _2792;
            float _2902 = _89 + _2794;
            float _2904 = _91 + _2796;
            float _2906 = _2798 + 1.0;
            _2890 = _2784;
            _2892 = _2786;
            _2894 = _2788;
            _2896 = _2790;
            _2858 = _2900;
            _2860 = _2902;
            _2862 = _2904;
            _2864 = _2906;
            _2898 = true;
        }
    }
    if ((!_2898) || _2880)
    {
        bool _2908;
        if (!_2880)
        {
            _2908 = _2836 >= 1;
        }
        if ((!_2908) || _2880)
        {
            if (!_2880)
            {
                bool _2910 = _2836 != 0;
                if (!_2910)
                {
                    float _2912 = _87 + _2784;
                    _2842 = _2912;
                }
                float _2914 = _2842;
                _2890 = _2914;
                if (!_2910)
                {
                    float _2916 = _89 + _2786;
                    _2844 = _2916;
                }
                float _2918 = _2844;
                _2892 = _2918;
                if (!_2910)
                {
                    float _2920 = _91 + _2788;
                    _2846 = _2920;
                }
                float _2922 = _2846;
                _2894 = _2922;
                if (!_2910)
                {
                    float _2924 = _2790 + 1.0;
                    _2848 = _2924;
                }
                float _2926 = _2848;
                bool _2928 = !_2910;
                _2896 = _2926;
                _2898 = _2928;
            }
            if ((!_2898) || _2880)
            {
                _2880 = false;
                _2890 = _2784;
                _2892 = _2786;
                _2894 = _2788;
                _2896 = _2790;
                _2898 = true;
            }
        }
        else
        {
            float _2930 = _87 + _2800;
            float _2932 = _89 + _2802;
            float _2934 = _91 + _2804;
            float _2936 = _2806 + 1.0;
            _2890 = _2784;
            _2892 = _2786;
            _2894 = _2788;
            _2896 = _2790;
            _2866 = _2930;
            _2868 = _2932;
            _2870 = _2934;
            _2872 = _2936;
        }
    }
    _2898 = false;
    float _2938 = _2850;
    float _2940 = _2852;
    float _2942 = _2854;
    float _2944 = _2856;
    float _2946 = _2890;
    float _2948 = _2892;
    float _2950 = _2894;
    float _2952 = _2896;
    float _2954 = _2858;
    float _2956 = _2860;
    float _2958 = _2862;
    float _2960 = _2864;
    float _2962 = _2866;
    float _2964 = _2868;
    float _2966 = _2870;
    float _2968 = _2872;
    float _2970 = -_2481;
    float _2972 = _97 + _2970;
    float _2974 = -_2485;
    float _2976 = _95 + _2974;
    float _2978 = _2495 * _2972;
    float _2980 = -_2489;
    float _2982 = _99 + _2980;
    float _2984 = fma(_2499, _2976, _2978);
    float _2986 = fma(_2503, _2982, _2984);
    float _2988 = _2531 * _2986;
    float _2990 = rint(_2988);
    float _2992 = precise::max(0.0, _2990);
    float _2994 = precise::min(_2992, 3.0);
    float _2996 = trunc(_2994);
    int _2998 = int(_2996);
    bool _3000 = _2998 >= 2;
    bool _3002 = !_3000;
    float _3004 = as_type<float>(_2998);
    float _3006 = _2990;
    float _3008 = _2984;
    float _3010 = _2978;
    float _3012 = _2938;
    float _3014 = _2940;
    float _3016 = _2942;
    float _3018 = _2944;
    float _3020 = _2954;
    float _3022 = _2956;
    float _3024 = _2958;
    float _3026 = _2960;
    float _3028 = _2962;
    float _3030 = _2964;
    float _3032 = _2966;
    float _3034 = _2968;
    float _3052;
    float _3054;
    float _3056;
    float _3058;
    if (!_3002)
    {
        bool _3036 = _2998 >= 3;
        bool _3038 = !_3036;
        if (!_3038)
        {
            bool _3040 = _2998 != 3;
            _3042 = _3040;
            if (!_3042)
            {
                float _3044 = _95 + _2938;
                float _3046 = _97 + _2940;
                float _3048 = _99 + _2942;
                float _3050 = _2944 + 1.0;
                _3012 = _3044;
                _3014 = _3046;
                _3016 = _3048;
                _3018 = _3050;
                _3052 = _2946;
                _3054 = _2948;
                _3056 = _2950;
                _3058 = _2952;
                _3060 = true;
            }
        }
        else
        {
            float _3062 = _95 + _2954;
            float _3064 = _97 + _2956;
            float _3066 = _99 + _2958;
            float _3068 = _2960 + 1.0;
            _3052 = _2946;
            _3054 = _2948;
            _3056 = _2950;
            _3058 = _2952;
            _3020 = _3062;
            _3022 = _3064;
            _3024 = _3066;
            _3026 = _3068;
            _3060 = true;
        }
    }
    if ((!_3060) || _3042)
    {
        bool _3070;
        if (!_3042)
        {
            _3070 = _2998 >= 1;
        }
        if ((!_3070) || _3042)
        {
            if (!_3042)
            {
                bool _3072 = _2998 != 0;
                if (!_3072)
                {
                    float _3074 = _95 + _2946;
                    _3004 = _3074;
                }
                float _3076 = _3004;
                _3052 = _3076;
                if (!_3072)
                {
                    float _3078 = _97 + _2948;
                    _3006 = _3078;
                }
                float _3080 = _3006;
                _3054 = _3080;
                if (!_3072)
                {
                    float _3082 = _99 + _2950;
                    _3008 = _3082;
                }
                float _3084 = _3008;
                _3056 = _3084;
                if (!_3072)
                {
                    float _3086 = _2952 + 1.0;
                    _3010 = _3086;
                }
                float _3088 = _3010;
                bool _3090 = !_3072;
                _3058 = _3088;
                _3060 = _3090;
            }
            if ((!_3060) || _3042)
            {
                _3042 = false;
                _3052 = _2946;
                _3054 = _2948;
                _3056 = _2950;
                _3058 = _2952;
                _3060 = true;
            }
        }
        else
        {
            float _3092 = _95 + _2962;
            float _3094 = _97 + _2964;
            float _3096 = _99 + _2966;
            float _3098 = _2968 + 1.0;
            _3052 = _2946;
            _3054 = _2948;
            _3056 = _2950;
            _3058 = _2952;
            _3028 = _3092;
            _3030 = _3094;
            _3032 = _3096;
            _3034 = _3098;
        }
    }
    _3060 = false;
    float _3100 = _3012;
    float _3102 = _3014;
    float _3104 = _3016;
    float _3106 = _3018;
    float _3108 = _3052;
    float _3110 = _3054;
    float _3112 = _3056;
    float _3114 = _3058;
    float _3116 = _3020;
    float _3118 = _3022;
    float _3120 = _3024;
    float _3122 = _3026;
    float _3124 = _3028;
    float _3126 = _3030;
    float _3128 = _3032;
    float _3130 = _3034;
    float _3132 = -_2481;
    float _3134 = _105 + _3132;
    float _3136 = -_2485;
    float _3138 = _103 + _3136;
    float _3140 = _2495 * _3134;
    float _3142 = -_2489;
    float _3144 = _107 + _3142;
    float _3146 = fma(_2499, _3138, _3140);
    float _3148 = fma(_2503, _3144, _3146);
    float _3150 = _2531 * _3148;
    float _3152 = rint(_3150);
    float _3154 = precise::max(0.0, _3152);
    float _3156 = precise::min(_3154, 3.0);
    float _3158 = trunc(_3156);
    int _3160 = int(_3158);
    bool _3162 = _3160 >= 2;
    bool _3164 = !_3162;
    float _3166 = as_type<float>(_3160);
    float _3168 = _3152;
    float _3170 = _3146;
    float _3172 = _3140;
    float _3174 = _3100;
    float _3176 = _3102;
    float _3178 = _3104;
    float _3180 = _3106;
    float _3182 = _3116;
    float _3184 = _3118;
    float _3186 = _3120;
    float _3188 = _3122;
    float _3190 = _3124;
    float _3192 = _3126;
    float _3194 = _3128;
    float _3196 = _3130;
    float _3214;
    float _3216;
    float _3218;
    float _3220;
    if (!_3164)
    {
        bool _3198 = _3160 >= 3;
        bool _3200 = !_3198;
        if (!_3200)
        {
            bool _3202 = _3160 != 3;
            _3204 = _3202;
            if (!_3204)
            {
                float _3206 = _103 + _3100;
                float _3208 = _105 + _3102;
                float _3210 = _107 + _3104;
                float _3212 = _3106 + 1.0;
                _3174 = _3206;
                _3176 = _3208;
                _3178 = _3210;
                _3180 = _3212;
                _3214 = _3108;
                _3216 = _3110;
                _3218 = _3112;
                _3220 = _3114;
                _3222 = true;
            }
        }
        else
        {
            float _3224 = _103 + _3116;
            float _3226 = _105 + _3118;
            float _3228 = _107 + _3120;
            float _3230 = _3122 + 1.0;
            _3214 = _3108;
            _3216 = _3110;
            _3218 = _3112;
            _3220 = _3114;
            _3182 = _3224;
            _3184 = _3226;
            _3186 = _3228;
            _3188 = _3230;
            _3222 = true;
        }
    }
    if ((!_3222) || _3204)
    {
        bool _3232;
        if (!_3204)
        {
            _3232 = _3160 >= 1;
        }
        if ((!_3232) || _3204)
        {
            if (!_3204)
            {
                bool _3234 = _3160 != 0;
                if (!_3234)
                {
                    float _3236 = _103 + _3108;
                    _3166 = _3236;
                }
                float _3238 = _3166;
                _3214 = _3238;
                if (!_3234)
                {
                    float _3240 = _105 + _3110;
                    _3168 = _3240;
                }
                float _3242 = _3168;
                _3216 = _3242;
                if (!_3234)
                {
                    float _3244 = _107 + _3112;
                    _3170 = _3244;
                }
                float _3246 = _3170;
                _3218 = _3246;
                if (!_3234)
                {
                    float _3248 = _3114 + 1.0;
                    _3172 = _3248;
                }
                float _3250 = _3172;
                bool _3252 = !_3234;
                _3220 = _3250;
                _3222 = _3252;
            }
            if ((!_3222) || _3204)
            {
                _3204 = false;
                _3214 = _3108;
                _3216 = _3110;
                _3218 = _3112;
                _3220 = _3114;
                _3222 = true;
            }
        }
        else
        {
            float _3254 = _103 + _3124;
            float _3256 = _105 + _3126;
            float _3258 = _107 + _3128;
            float _3260 = _3130 + 1.0;
            _3214 = _3108;
            _3216 = _3110;
            _3218 = _3112;
            _3220 = _3114;
            _3190 = _3254;
            _3192 = _3256;
            _3194 = _3258;
            _3196 = _3260;
        }
    }
    _3222 = false;
    float _3262 = _3174;
    float _3264 = _3176;
    float _3266 = _3178;
    float _3268 = _3180;
    float _3270 = _3214;
    float _3272 = _3216;
    float _3274 = _3218;
    float _3276 = _3220;
    float _3278 = _3182;
    float _3280 = _3184;
    float _3282 = _3186;
    float _3284 = _3188;
    float _3286 = _3190;
    float _3288 = _3192;
    float _3290 = _3194;
    float _3292 = _3196;
    float _3294 = -_2481;
    float _3296 = _113 + _3294;
    float _3298 = -_2485;
    float _3300 = _111 + _3298;
    float _3302 = _2495 * _3296;
    float _3304 = -_2489;
    float _3306 = _115 + _3304;
    float _3308 = fma(_2499, _3300, _3302);
    float _3310 = fma(_2503, _3306, _3308);
    float _3312 = _2531 * _3310;
    float _3314 = rint(_3312);
    float _3316 = precise::max(0.0, _3314);
    float _3318 = precise::min(_3316, 3.0);
    float _3320 = trunc(_3318);
    int _3322 = int(_3320);
    bool _3324 = _3322 >= 2;
    bool _3326 = !_3324;
    float _3328 = as_type<float>(_3322);
    float _3330 = _3314;
    float _3332 = _3308;
    float _3334 = _3302;
    float _3336 = _3262;
    float _3338 = _3264;
    float _3340 = _3266;
    float _3342 = _3268;
    float _3344 = _3278;
    float _3346 = _3280;
    float _3348 = _3282;
    float _3350 = _3284;
    float _3352 = _3286;
    float _3354 = _3288;
    float _3356 = _3290;
    float _3358 = _3292;
    float _3376;
    float _3378;
    float _3380;
    float _3382;
    if (!_3326)
    {
        bool _3360 = _3322 >= 3;
        bool _3362 = !_3360;
        if (!_3362)
        {
            bool _3364 = _3322 != 3;
            _3366 = _3364;
            if (!_3366)
            {
                float _3368 = _111 + _3262;
                float _3370 = _113 + _3264;
                float _3372 = _115 + _3266;
                float _3374 = _3268 + 1.0;
                _3336 = _3368;
                _3338 = _3370;
                _3340 = _3372;
                _3342 = _3374;
                _3376 = _3270;
                _3378 = _3272;
                _3380 = _3274;
                _3382 = _3276;
                _3384 = true;
            }
        }
        else
        {
            float _3386 = _111 + _3278;
            float _3388 = _113 + _3280;
            float _3390 = _115 + _3282;
            float _3392 = _3284 + 1.0;
            _3376 = _3270;
            _3378 = _3272;
            _3380 = _3274;
            _3382 = _3276;
            _3344 = _3386;
            _3346 = _3388;
            _3348 = _3390;
            _3350 = _3392;
            _3384 = true;
        }
    }
    if ((!_3384) || _3366)
    {
        bool _3394;
        if (!_3366)
        {
            _3394 = _3322 >= 1;
        }
        if ((!_3394) || _3366)
        {
            if (!_3366)
            {
                bool _3396 = _3322 != 0;
                if (!_3396)
                {
                    float _3398 = _111 + _3270;
                    _3328 = _3398;
                }
                float _3400 = _3328;
                _3376 = _3400;
                if (!_3396)
                {
                    float _3402 = _113 + _3272;
                    _3330 = _3402;
                }
                float _3404 = _3330;
                _3378 = _3404;
                if (!_3396)
                {
                    float _3406 = _115 + _3274;
                    _3332 = _3406;
                }
                float _3408 = _3332;
                _3380 = _3408;
                if (!_3396)
                {
                    float _3410 = _3276 + 1.0;
                    _3334 = _3410;
                }
                float _3412 = _3334;
                bool _3414 = !_3396;
                _3382 = _3412;
                _3384 = _3414;
            }
            if ((!_3384) || _3366)
            {
                _3366 = false;
                _3376 = _3270;
                _3378 = _3272;
                _3380 = _3274;
                _3382 = _3276;
                _3384 = true;
            }
        }
        else
        {
            float _3416 = _111 + _3286;
            float _3418 = _113 + _3288;
            float _3420 = _115 + _3290;
            float _3422 = _3292 + 1.0;
            _3376 = _3270;
            _3378 = _3272;
            _3380 = _3274;
            _3382 = _3276;
            _3352 = _3416;
            _3354 = _3418;
            _3356 = _3420;
            _3358 = _3422;
        }
    }
    _3384 = false;
    float _3424 = _3336;
    float _3426 = _3338;
    float _3428 = _3340;
    float _3430 = _3342;
    float _3432 = _3376;
    float _3434 = _3378;
    float _3436 = _3380;
    float _3438 = _3382;
    float _3440 = _3344;
    float _3442 = _3346;
    float _3444 = _3348;
    float _3446 = _3350;
    float _3448 = _3352;
    float _3450 = _3354;
    float _3452 = _3356;
    float _3454 = _3358;
    float _3456 = -_2481;
    float _3458 = _121 + _3456;
    float _3460 = -_2485;
    float _3462 = _119 + _3460;
    float _3464 = _2495 * _3458;
    float _3466 = -_2489;
    float _3468 = _123 + _3466;
    float _3470 = fma(_2499, _3462, _3464);
    float _3472 = fma(_2503, _3468, _3470);
    float _3474 = _2531 * _3472;
    float _3476 = rint(_3474);
    float _3478 = precise::max(0.0, _3476);
    float _3480 = precise::min(_3478, 3.0);
    float _3482 = trunc(_3480);
    int _3484 = int(_3482);
    bool _3486 = _3484 >= 2;
    bool _3488 = !_3486;
    float _3490 = as_type<float>(_3484);
    float _3492 = _3476;
    float _3494 = _3470;
    float _3496 = _3464;
    float _3498 = _3424;
    float _3500 = _3426;
    float _3502 = _3428;
    float _3504 = _3430;
    float _3506 = _3440;
    float _3508 = _3442;
    float _3510 = _3444;
    float _3512 = _3446;
    float _3514 = _3448;
    float _3516 = _3450;
    float _3518 = _3452;
    float _3520 = _3454;
    float _3538;
    float _3540;
    float _3542;
    float _3544;
    if (!_3488)
    {
        bool _3522 = _3484 >= 3;
        bool _3524 = !_3522;
        if (!_3524)
        {
            bool _3526 = _3484 != 3;
            _3528 = _3526;
            if (!_3528)
            {
                float _3530 = _119 + _3424;
                float _3532 = _121 + _3426;
                float _3534 = _123 + _3428;
                float _3536 = _3430 + 1.0;
                _3498 = _3530;
                _3500 = _3532;
                _3502 = _3534;
                _3504 = _3536;
                _3538 = _3432;
                _3540 = _3434;
                _3542 = _3436;
                _3544 = _3438;
                _3546 = true;
            }
        }
        else
        {
            float _3548 = _119 + _3440;
            float _3550 = _121 + _3442;
            float _3552 = _123 + _3444;
            float _3554 = _3446 + 1.0;
            _3538 = _3432;
            _3540 = _3434;
            _3542 = _3436;
            _3544 = _3438;
            _3506 = _3548;
            _3508 = _3550;
            _3510 = _3552;
            _3512 = _3554;
            _3546 = true;
        }
    }
    if ((!_3546) || _3528)
    {
        bool _3556;
        if (!_3528)
        {
            _3556 = _3484 >= 1;
        }
        if ((!_3556) || _3528)
        {
            if (!_3528)
            {
                bool _3558 = _3484 != 0;
                if (!_3558)
                {
                    float _3560 = _119 + _3432;
                    _3490 = _3560;
                }
                float _3562 = _3490;
                _3538 = _3562;
                if (!_3558)
                {
                    float _3564 = _121 + _3434;
                    _3492 = _3564;
                }
                float _3566 = _3492;
                _3540 = _3566;
                if (!_3558)
                {
                    float _3568 = _123 + _3436;
                    _3494 = _3568;
                }
                float _3570 = _3494;
                _3542 = _3570;
                if (!_3558)
                {
                    float _3572 = _3438 + 1.0;
                    _3496 = _3572;
                }
                float _3574 = _3496;
                bool _3576 = !_3558;
                _3544 = _3574;
                _3546 = _3576;
            }
            if ((!_3546) || _3528)
            {
                _3528 = false;
                _3538 = _3432;
                _3540 = _3434;
                _3542 = _3436;
                _3544 = _3438;
                _3546 = true;
            }
        }
        else
        {
            float _3578 = _119 + _3448;
            float _3580 = _121 + _3450;
            float _3582 = _123 + _3452;
            float _3584 = _3454 + 1.0;
            _3538 = _3432;
            _3540 = _3434;
            _3542 = _3436;
            _3544 = _3438;
            _3514 = _3578;
            _3516 = _3580;
            _3518 = _3582;
            _3520 = _3584;
        }
    }
    _3546 = false;
    float _3586 = _3498;
    float _3588 = _3500;
    float _3590 = _3502;
    float _3592 = _3504;
    float _3594 = _3538;
    float _3596 = _3540;
    float _3598 = _3542;
    float _3600 = _3544;
    float _3602 = _3506;
    float _3604 = _3508;
    float _3606 = _3510;
    float _3608 = _3512;
    float _3610 = _3514;
    float _3612 = _3516;
    float _3614 = _3518;
    float _3616 = _3520;
    float _3618 = -_2481;
    float _3620 = _129 + _3618;
    float _3622 = -_2485;
    float _3624 = _127 + _3622;
    float _3626 = _2495 * _3620;
    float _3628 = -_2489;
    float _3630 = _131 + _3628;
    float _3632 = fma(_2499, _3624, _3626);
    float _3634 = fma(_2503, _3630, _3632);
    float _3636 = _2531 * _3634;
    float _3638 = rint(_3636);
    float _3640 = precise::max(0.0, _3638);
    float _3642 = precise::min(_3640, 3.0);
    float _3644 = trunc(_3642);
    int _3646 = int(_3644);
    bool _3648 = _3646 >= 2;
    bool _3650 = !_3648;
    float _3652 = as_type<float>(_3646);
    float _3654 = _3638;
    float _3656 = _3632;
    float _3658 = _3626;
    float _3660 = _3586;
    float _3662 = _3588;
    float _3664 = _3590;
    float _3666 = _3592;
    float _3668 = _3602;
    float _3670 = _3604;
    float _3672 = _3606;
    float _3674 = _3608;
    float _3676 = _3610;
    float _3678 = _3612;
    float _3680 = _3614;
    float _3682 = _3616;
    float _3700;
    float _3702;
    float _3704;
    float _3706;
    if (!_3650)
    {
        bool _3684 = _3646 >= 3;
        bool _3686 = !_3684;
        if (!_3686)
        {
            bool _3688 = _3646 != 3;
            _3690 = _3688;
            if (!_3690)
            {
                float _3692 = _127 + _3586;
                float _3694 = _129 + _3588;
                float _3696 = _131 + _3590;
                float _3698 = _3592 + 1.0;
                _3660 = _3692;
                _3662 = _3694;
                _3664 = _3696;
                _3666 = _3698;
                _3700 = _3594;
                _3702 = _3596;
                _3704 = _3598;
                _3706 = _3600;
                _3708 = true;
            }
        }
        else
        {
            float _3710 = _127 + _3602;
            float _3712 = _129 + _3604;
            float _3714 = _131 + _3606;
            float _3716 = _3608 + 1.0;
            _3700 = _3594;
            _3702 = _3596;
            _3704 = _3598;
            _3706 = _3600;
            _3668 = _3710;
            _3670 = _3712;
            _3672 = _3714;
            _3674 = _3716;
            _3708 = true;
        }
    }
    if ((!_3708) || _3690)
    {
        bool _3718;
        if (!_3690)
        {
            _3718 = _3646 >= 1;
        }
        if ((!_3718) || _3690)
        {
            if (!_3690)
            {
                bool _3720 = _3646 != 0;
                if (!_3720)
                {
                    float _3722 = _127 + _3594;
                    _3652 = _3722;
                }
                float _3724 = _3652;
                _3700 = _3724;
                if (!_3720)
                {
                    float _3726 = _129 + _3596;
                    _3654 = _3726;
                }
                float _3728 = _3654;
                _3702 = _3728;
                if (!_3720)
                {
                    float _3730 = _131 + _3598;
                    _3656 = _3730;
                }
                float _3732 = _3656;
                _3704 = _3732;
                if (!_3720)
                {
                    float _3734 = _3600 + 1.0;
                    _3658 = _3734;
                }
                float _3736 = _3658;
                bool _3738 = !_3720;
                _3706 = _3736;
                _3708 = _3738;
            }
            if ((!_3708) || _3690)
            {
                _3690 = false;
                _3700 = _3594;
                _3702 = _3596;
                _3704 = _3598;
                _3706 = _3600;
                _3708 = true;
            }
        }
        else
        {
            float _3740 = _127 + _3610;
            float _3742 = _129 + _3612;
            float _3744 = _131 + _3614;
            float _3746 = _3616 + 1.0;
            _3700 = _3594;
            _3702 = _3596;
            _3704 = _3598;
            _3706 = _3600;
            _3676 = _3740;
            _3678 = _3742;
            _3680 = _3744;
            _3682 = _3746;
        }
    }
    _3708 = false;
    float _3748 = _3660;
    float _3750 = _3662;
    float _3752 = _3664;
    float _3754 = _3666;
    float _3756 = _3700;
    float _3758 = _3702;
    float _3760 = _3704;
    float _3762 = _3706;
    float _3764 = _3668;
    float _3766 = _3670;
    float _3768 = _3672;
    float _3770 = _3674;
    float _3772 = _3676;
    float _3774 = _3678;
    float _3776 = _3680;
    float _3778 = _3682;
    float _3780 = -_2481;
    float _3782 = _137 + _3780;
    float _3784 = -_2485;
    float _3786 = _135 + _3784;
    float _3788 = _2495 * _3782;
    float _3790 = -_2489;
    float _3792 = _139 + _3790;
    float _3794 = fma(_2499, _3786, _3788);
    float _3796 = fma(_2503, _3792, _3794);
    float _3798 = _2531 * _3796;
    float _3800 = rint(_3798);
    float _3802 = precise::max(0.0, _3800);
    float _3804 = precise::min(_3802, 3.0);
    float _3806 = trunc(_3804);
    int _3808 = int(_3806);
    bool _3810 = _3808 >= 2;
    bool _3812 = !_3810;
    float _3814 = as_type<float>(_3808);
    float _3816 = _3800;
    float _3818 = _3794;
    float _3820 = _3788;
    float _3822 = _3748;
    float _3824 = _3750;
    float _3826 = _3752;
    float _3828 = _3754;
    float _3830 = _3764;
    float _3832 = _3766;
    float _3834 = _3768;
    float _3836 = _3770;
    float _3838 = _3772;
    float _3840 = _3774;
    float _3842 = _3776;
    float _3844 = _3778;
    float _3862;
    float _3864;
    float _3866;
    float _3868;
    if (!_3812)
    {
        bool _3846 = _3808 >= 3;
        bool _3848 = !_3846;
        if (!_3848)
        {
            bool _3850 = _3808 != 3;
            _3852 = _3850;
            if (!_3852)
            {
                float _3854 = _135 + _3748;
                float _3856 = _137 + _3750;
                float _3858 = _139 + _3752;
                float _3860 = _3754 + 1.0;
                _3822 = _3854;
                _3824 = _3856;
                _3826 = _3858;
                _3828 = _3860;
                _3862 = _3756;
                _3864 = _3758;
                _3866 = _3760;
                _3868 = _3762;
                _3870 = true;
            }
        }
        else
        {
            float _3872 = _135 + _3764;
            float _3874 = _137 + _3766;
            float _3876 = _139 + _3768;
            float _3878 = _3770 + 1.0;
            _3862 = _3756;
            _3864 = _3758;
            _3866 = _3760;
            _3868 = _3762;
            _3830 = _3872;
            _3832 = _3874;
            _3834 = _3876;
            _3836 = _3878;
            _3870 = true;
        }
    }
    if ((!_3870) || _3852)
    {
        bool _3880;
        if (!_3852)
        {
            _3880 = _3808 >= 1;
        }
        if ((!_3880) || _3852)
        {
            if (!_3852)
            {
                bool _3882 = _3808 != 0;
                if (!_3882)
                {
                    float _3884 = _135 + _3756;
                    _3814 = _3884;
                }
                float _3886 = _3814;
                _3862 = _3886;
                if (!_3882)
                {
                    float _3888 = _137 + _3758;
                    _3816 = _3888;
                }
                float _3890 = _3816;
                _3864 = _3890;
                if (!_3882)
                {
                    float _3892 = _139 + _3760;
                    _3818 = _3892;
                }
                float _3894 = _3818;
                _3866 = _3894;
                if (!_3882)
                {
                    float _3896 = _3762 + 1.0;
                    _3820 = _3896;
                }
                float _3898 = _3820;
                bool _3900 = !_3882;
                _3868 = _3898;
                _3870 = _3900;
            }
            if ((!_3870) || _3852)
            {
                _3852 = false;
                _3862 = _3756;
                _3864 = _3758;
                _3866 = _3760;
                _3868 = _3762;
                _3870 = true;
            }
        }
        else
        {
            float _3902 = _135 + _3772;
            float _3904 = _137 + _3774;
            float _3906 = _139 + _3776;
            float _3908 = _3778 + 1.0;
            _3862 = _3756;
            _3864 = _3758;
            _3866 = _3760;
            _3868 = _3762;
            _3838 = _3902;
            _3840 = _3904;
            _3842 = _3906;
            _3844 = _3908;
        }
    }
    _3870 = false;
    float _3910 = _3822;
    float _3912 = _3824;
    float _3914 = _3826;
    float _3916 = _3828;
    float _3918 = _3862;
    float _3920 = _3864;
    float _3922 = _3866;
    float _3924 = _3868;
    float _3926 = _3830;
    float _3928 = _3832;
    float _3930 = _3834;
    float _3932 = _3836;
    float _3934 = _3838;
    float _3936 = _3840;
    float _3938 = _3842;
    float _3940 = _3844;
    float _3942 = -_2481;
    float _3944 = _145 + _3942;
    float _3946 = -_2485;
    float _3948 = _143 + _3946;
    float _3950 = _2495 * _3944;
    float _3952 = -_2489;
    float _3954 = _147 + _3952;
    float _3956 = fma(_2499, _3948, _3950);
    float _3958 = fma(_2503, _3954, _3956);
    float _3960 = _2531 * _3958;
    float _3962 = rint(_3960);
    float _3964 = precise::max(0.0, _3962);
    float _3966 = precise::min(_3964, 3.0);
    float _3968 = trunc(_3966);
    int _3970 = int(_3968);
    bool _3972 = _3970 >= 2;
    bool _3974 = !_3972;
    float _3976 = as_type<float>(_3970);
    float _3978 = _3962;
    float _3980 = _3956;
    float _3982 = _3950;
    float _3984 = _3910;
    float _3986 = _3912;
    float _3988 = _3914;
    float _3990 = _3916;
    float _3992 = _3926;
    float _3994 = _3928;
    float _3996 = _3930;
    float _3998 = _3932;
    float _4000 = _3934;
    float _4002 = _3936;
    float _4004 = _3938;
    float _4006 = _3940;
    float _4024;
    float _4026;
    float _4028;
    float _4030;
    if (!_3974)
    {
        bool _4008 = _3970 >= 3;
        bool _4010 = !_4008;
        if (!_4010)
        {
            bool _4012 = _3970 != 3;
            _4014 = _4012;
            if (!_4014)
            {
                float _4016 = _143 + _3910;
                float _4018 = _145 + _3912;
                float _4020 = _147 + _3914;
                float _4022 = _3916 + 1.0;
                _3984 = _4016;
                _3986 = _4018;
                _3988 = _4020;
                _3990 = _4022;
                _4024 = _3918;
                _4026 = _3920;
                _4028 = _3922;
                _4030 = _3924;
                _4032 = true;
            }
        }
        else
        {
            float _4034 = _143 + _3926;
            float _4036 = _145 + _3928;
            float _4038 = _147 + _3930;
            float _4040 = _3932 + 1.0;
            _4024 = _3918;
            _4026 = _3920;
            _4028 = _3922;
            _4030 = _3924;
            _3992 = _4034;
            _3994 = _4036;
            _3996 = _4038;
            _3998 = _4040;
            _4032 = true;
        }
    }
    if ((!_4032) || _4014)
    {
        bool _4042;
        if (!_4014)
        {
            _4042 = _3970 >= 1;
        }
        if ((!_4042) || _4014)
        {
            if (!_4014)
            {
                bool _4044 = _3970 != 0;
                if (!_4044)
                {
                    float _4046 = _143 + _3918;
                    _3976 = _4046;
                }
                float _4048 = _3976;
                _4024 = _4048;
                if (!_4044)
                {
                    float _4050 = _145 + _3920;
                    _3978 = _4050;
                }
                float _4052 = _3978;
                _4026 = _4052;
                if (!_4044)
                {
                    float _4054 = _147 + _3922;
                    _3980 = _4054;
                }
                float _4056 = _3980;
                _4028 = _4056;
                if (!_4044)
                {
                    float _4058 = _3924 + 1.0;
                    _3982 = _4058;
                }
                float _4060 = _3982;
                bool _4062 = !_4044;
                _4030 = _4060;
                _4032 = _4062;
            }
            if ((!_4032) || _4014)
            {
                _4014 = false;
                _4024 = _3918;
                _4026 = _3920;
                _4028 = _3922;
                _4030 = _3924;
                _4032 = true;
            }
        }
        else
        {
            float _4064 = _143 + _3934;
            float _4066 = _145 + _3936;
            float _4068 = _147 + _3938;
            float _4070 = _3940 + 1.0;
            _4024 = _3918;
            _4026 = _3920;
            _4028 = _3922;
            _4030 = _3924;
            _4000 = _4064;
            _4002 = _4066;
            _4004 = _4068;
            _4006 = _4070;
        }
    }
    _4032 = false;
    float _4072 = _3984;
    float _4074 = _3986;
    float _4076 = _3988;
    float _4078 = _3990;
    float _4080 = _4024;
    float _4082 = _4026;
    float _4084 = _4028;
    float _4086 = _4030;
    float _4088 = _3992;
    float _4090 = _3994;
    float _4092 = _3996;
    float _4094 = _3998;
    float _4096 = _4000;
    float _4098 = _4002;
    float _4100 = _4004;
    float _4102 = _4006;
    float _4104 = -_2481;
    float _4106 = _153 + _4104;
    float _4108 = -_2485;
    float _4110 = _151 + _4108;
    float _4112 = _2495 * _4106;
    float _4114 = -_2489;
    float _4116 = _155 + _4114;
    float _4118 = fma(_2499, _4110, _4112);
    float _4120 = fma(_2503, _4116, _4118);
    float _4122 = _2531 * _4120;
    float _4124 = rint(_4122);
    float _4126 = precise::max(0.0, _4124);
    float _4128 = precise::min(_4126, 3.0);
    float _4130 = trunc(_4128);
    int _4132 = int(_4130);
    bool _4134 = _4132 >= 2;
    bool _4136 = !_4134;
    float _4138 = as_type<float>(_4132);
    float _4140 = _4124;
    float _4142 = _4118;
    float _4144 = _4112;
    float _4146 = _4072;
    float _4148 = _4074;
    float _4150 = _4076;
    float _4152 = _4078;
    float _4154 = _4088;
    float _4156 = _4090;
    float _4158 = _4092;
    float _4160 = _4094;
    float _4162 = _4096;
    float _4164 = _4098;
    float _4166 = _4100;
    float _4168 = _4102;
    float _4186;
    float _4188;
    float _4190;
    float _4192;
    if (!_4136)
    {
        bool _4170 = _4132 >= 3;
        bool _4172 = !_4170;
        if (!_4172)
        {
            bool _4174 = _4132 != 3;
            _4176 = _4174;
            if (!_4176)
            {
                float _4178 = _151 + _4072;
                float _4180 = _153 + _4074;
                float _4182 = _155 + _4076;
                float _4184 = _4078 + 1.0;
                _4146 = _4178;
                _4148 = _4180;
                _4150 = _4182;
                _4152 = _4184;
                _4186 = _4080;
                _4188 = _4082;
                _4190 = _4084;
                _4192 = _4086;
                _4194 = true;
            }
        }
        else
        {
            float _4196 = _151 + _4088;
            float _4198 = _153 + _4090;
            float _4200 = _155 + _4092;
            float _4202 = _4094 + 1.0;
            _4186 = _4080;
            _4188 = _4082;
            _4190 = _4084;
            _4192 = _4086;
            _4154 = _4196;
            _4156 = _4198;
            _4158 = _4200;
            _4160 = _4202;
            _4194 = true;
        }
    }
    if ((!_4194) || _4176)
    {
        bool _4204;
        if (!_4176)
        {
            _4204 = _4132 >= 1;
        }
        if ((!_4204) || _4176)
        {
            if (!_4176)
            {
                bool _4206 = _4132 != 0;
                if (!_4206)
                {
                    float _4208 = _151 + _4080;
                    _4138 = _4208;
                }
                float _4210 = _4138;
                _4186 = _4210;
                if (!_4206)
                {
                    float _4212 = _153 + _4082;
                    _4140 = _4212;
                }
                float _4214 = _4140;
                _4188 = _4214;
                if (!_4206)
                {
                    float _4216 = _155 + _4084;
                    _4142 = _4216;
                }
                float _4218 = _4142;
                _4190 = _4218;
                if (!_4206)
                {
                    float _4220 = _4086 + 1.0;
                    _4144 = _4220;
                }
                float _4222 = _4144;
                bool _4224 = !_4206;
                _4192 = _4222;
                _4194 = _4224;
            }
            if ((!_4194) || _4176)
            {
                _4176 = false;
                _4186 = _4080;
                _4188 = _4082;
                _4190 = _4084;
                _4192 = _4086;
                _4194 = true;
            }
        }
        else
        {
            float _4226 = _151 + _4096;
            float _4228 = _153 + _4098;
            float _4230 = _155 + _4100;
            float _4232 = _4102 + 1.0;
            _4186 = _4080;
            _4188 = _4082;
            _4190 = _4084;
            _4192 = _4086;
            _4162 = _4226;
            _4164 = _4228;
            _4166 = _4230;
            _4168 = _4232;
        }
    }
    _4194 = false;
    float _4234 = _4146;
    float _4236 = _4148;
    float _4238 = _4150;
    float _4240 = _4152;
    float _4242 = _4186;
    float _4244 = _4188;
    float _4246 = _4190;
    float _4248 = _4192;
    float _4250 = _4154;
    float _4252 = _4156;
    float _4254 = _4158;
    float _4256 = _4160;
    float _4258 = _4162;
    float _4260 = _4164;
    float _4262 = _4166;
    float _4264 = _4168;
    float _4266 = -_2481;
    float _4268 = _161 + _4266;
    float _4270 = -_2485;
    float _4272 = _159 + _4270;
    float _4274 = _2495 * _4268;
    float _4276 = -_2489;
    float _4278 = _163 + _4276;
    float _4280 = fma(_2499, _4272, _4274);
    float _4282 = fma(_2503, _4278, _4280);
    float _4284 = _2531 * _4282;
    float _4286 = rint(_4284);
    float _4288 = precise::max(0.0, _4286);
    float _4290 = precise::min(_4288, 3.0);
    float _4292 = trunc(_4290);
    int _4294 = int(_4292);
    bool _4296 = _4294 >= 2;
    bool _4298 = !_4296;
    float _4300 = as_type<float>(_4294);
    float _4302 = _4286;
    float _4304 = _4280;
    float _4306 = _4274;
    float _4308 = _4234;
    float _4310 = _4236;
    float _4312 = _4238;
    float _4314 = _4240;
    float _4316 = _4250;
    float _4318 = _4252;
    float _4320 = _4254;
    float _4322 = _4256;
    float _4324 = _4258;
    float _4326 = _4260;
    float _4328 = _4262;
    float _4330 = _4264;
    float _4348;
    float _4350;
    float _4352;
    float _4354;
    if (!_4298)
    {
        bool _4332 = _4294 >= 3;
        bool _4334 = !_4332;
        if (!_4334)
        {
            bool _4336 = _4294 != 3;
            _4338 = _4336;
            if (!_4338)
            {
                float _4340 = _159 + _4234;
                float _4342 = _161 + _4236;
                float _4344 = _163 + _4238;
                float _4346 = _4240 + 1.0;
                _4308 = _4340;
                _4310 = _4342;
                _4312 = _4344;
                _4314 = _4346;
                _4348 = _4242;
                _4350 = _4244;
                _4352 = _4246;
                _4354 = _4248;
                _4356 = true;
            }
        }
        else
        {
            float _4358 = _159 + _4250;
            float _4360 = _161 + _4252;
            float _4362 = _163 + _4254;
            float _4364 = _4256 + 1.0;
            _4348 = _4242;
            _4350 = _4244;
            _4352 = _4246;
            _4354 = _4248;
            _4316 = _4358;
            _4318 = _4360;
            _4320 = _4362;
            _4322 = _4364;
            _4356 = true;
        }
    }
    if ((!_4356) || _4338)
    {
        bool _4366;
        if (!_4338)
        {
            _4366 = _4294 >= 1;
        }
        if ((!_4366) || _4338)
        {
            if (!_4338)
            {
                bool _4368 = _4294 != 0;
                if (!_4368)
                {
                    float _4370 = _159 + _4242;
                    _4300 = _4370;
                }
                float _4372 = _4300;
                _4348 = _4372;
                if (!_4368)
                {
                    float _4374 = _161 + _4244;
                    _4302 = _4374;
                }
                float _4376 = _4302;
                _4350 = _4376;
                if (!_4368)
                {
                    float _4378 = _163 + _4246;
                    _4304 = _4378;
                }
                float _4380 = _4304;
                _4352 = _4380;
                if (!_4368)
                {
                    float _4382 = _4248 + 1.0;
                    _4306 = _4382;
                }
                float _4384 = _4306;
                bool _4386 = !_4368;
                _4354 = _4384;
                _4356 = _4386;
            }
            if ((!_4356) || _4338)
            {
                _4338 = false;
                _4348 = _4242;
                _4350 = _4244;
                _4352 = _4246;
                _4354 = _4248;
                _4356 = true;
            }
        }
        else
        {
            float _4388 = _159 + _4258;
            float _4390 = _161 + _4260;
            float _4392 = _163 + _4262;
            float _4394 = _4264 + 1.0;
            _4348 = _4242;
            _4350 = _4244;
            _4352 = _4246;
            _4354 = _4248;
            _4324 = _4388;
            _4326 = _4390;
            _4328 = _4392;
            _4330 = _4394;
        }
    }
    _4356 = false;
    float _4396 = _4308;
    float _4398 = _4310;
    float _4400 = _4312;
    float _4402 = _4314;
    float _4404 = _4348;
    float _4406 = _4350;
    float _4408 = _4352;
    float _4410 = _4354;
    float _4412 = _4316;
    float _4414 = _4318;
    float _4416 = _4320;
    float _4418 = _4322;
    float _4420 = _4324;
    float _4422 = _4326;
    float _4424 = _4328;
    float _4426 = _4330;
    float _4428 = -_2481;
    float _4430 = _169 + _4428;
    float _4432 = -_2485;
    float _4434 = _167 + _4432;
    float _4436 = _2495 * _4430;
    float _4438 = -_2489;
    float _4440 = _171 + _4438;
    float _4442 = fma(_2499, _4434, _4436);
    float _4444 = fma(_2503, _4440, _4442);
    float _4446 = _2531 * _4444;
    float _4448 = rint(_4446);
    float _4450 = precise::max(0.0, _4448);
    float _4452 = precise::min(_4450, 3.0);
    float _4454 = trunc(_4452);
    int _4456 = int(_4454);
    bool _4458 = _4456 >= 2;
    bool _4460 = !_4458;
    float _4462 = as_type<float>(_4456);
    float _4464 = _4448;
    float _4466 = _4442;
    float _4468 = _4436;
    float _4470 = _4396;
    float _4472 = _4398;
    float _4474 = _4400;
    float _4476 = _4402;
    float _4478 = _4412;
    float _4480 = _4414;
    float _4482 = _4416;
    float _4484 = _4418;
    float _4486 = _4420;
    float _4488 = _4422;
    float _4490 = _4424;
    float _4492 = _4426;
    float _4510;
    float _4512;
    float _4514;
    float _4516;
    if (!_4460)
    {
        bool _4494 = _4456 >= 3;
        bool _4496 = !_4494;
        if (!_4496)
        {
            bool _4498 = _4456 != 3;
            _4500 = _4498;
            if (!_4500)
            {
                float _4502 = _167 + _4396;
                float _4504 = _169 + _4398;
                float _4506 = _171 + _4400;
                float _4508 = _4402 + 1.0;
                _4470 = _4502;
                _4472 = _4504;
                _4474 = _4506;
                _4476 = _4508;
                _4510 = _4404;
                _4512 = _4406;
                _4514 = _4408;
                _4516 = _4410;
                _4518 = true;
            }
        }
        else
        {
            float _4520 = _167 + _4412;
            float _4522 = _169 + _4414;
            float _4524 = _171 + _4416;
            float _4526 = _4418 + 1.0;
            _4510 = _4404;
            _4512 = _4406;
            _4514 = _4408;
            _4516 = _4410;
            _4478 = _4520;
            _4480 = _4522;
            _4482 = _4524;
            _4484 = _4526;
            _4518 = true;
        }
    }
    if ((!_4518) || _4500)
    {
        bool _4528;
        if (!_4500)
        {
            _4528 = _4456 >= 1;
        }
        if ((!_4528) || _4500)
        {
            if (!_4500)
            {
                bool _4530 = _4456 != 0;
                if (!_4530)
                {
                    float _4532 = _167 + _4404;
                    _4462 = _4532;
                }
                float _4534 = _4462;
                _4510 = _4534;
                if (!_4530)
                {
                    float _4536 = _169 + _4406;
                    _4464 = _4536;
                }
                float _4538 = _4464;
                _4512 = _4538;
                if (!_4530)
                {
                    float _4540 = _171 + _4408;
                    _4466 = _4540;
                }
                float _4542 = _4466;
                _4514 = _4542;
                if (!_4530)
                {
                    float _4544 = _4410 + 1.0;
                    _4468 = _4544;
                }
                float _4546 = _4468;
                bool _4548 = !_4530;
                _4516 = _4546;
                _4518 = _4548;
            }
            if ((!_4518) || _4500)
            {
                _4500 = false;
                _4510 = _4404;
                _4512 = _4406;
                _4514 = _4408;
                _4516 = _4410;
                _4518 = true;
            }
        }
        else
        {
            float _4550 = _167 + _4420;
            float _4552 = _169 + _4422;
            float _4554 = _171 + _4424;
            float _4556 = _4426 + 1.0;
            _4510 = _4404;
            _4512 = _4406;
            _4514 = _4408;
            _4516 = _4410;
            _4486 = _4550;
            _4488 = _4552;
            _4490 = _4554;
            _4492 = _4556;
        }
    }
    _4518 = false;
    float _4558 = _4470;
    float _4560 = _4472;
    float _4562 = _4474;
    float _4564 = _4476;
    float _4566 = _4510;
    float _4568 = _4512;
    float _4570 = _4514;
    float _4572 = _4516;
    float _4574 = _4478;
    float _4576 = _4480;
    float _4578 = _4482;
    float _4580 = _4484;
    float _4582 = _4486;
    float _4584 = _4488;
    float _4586 = _4490;
    float _4588 = _4492;
    float _4590 = -_2481;
    float _4592 = _177 + _4590;
    float _4594 = -_2485;
    float _4596 = _175 + _4594;
    float _4598 = _2495 * _4592;
    float _4600 = -_2489;
    float _4602 = _179 + _4600;
    float _4604 = fma(_2499, _4596, _4598);
    float _4606 = fma(_2503, _4602, _4604);
    float _4608 = _2531 * _4606;
    float _4610 = rint(_4608);
    float _4612 = precise::max(0.0, _4610);
    float _4614 = precise::min(_4612, 3.0);
    float _4616 = trunc(_4614);
    int _4618 = int(_4616);
    bool _4620 = _4618 >= 2;
    bool _4622 = !_4620;
    float _4624 = as_type<float>(_4618);
    float _4626 = _4610;
    float _4628 = _4604;
    float _4630 = _4598;
    float _4632 = _4558;
    float _4634 = _4560;
    float _4636 = _4562;
    float _4638 = _4564;
    float _4640 = _4574;
    float _4642 = _4576;
    float _4644 = _4578;
    float _4646 = _4580;
    float _4648 = _4582;
    float _4650 = _4584;
    float _4652 = _4586;
    float _4654 = _4588;
    float _4672;
    float _4674;
    float _4676;
    float _4678;
    if (!_4622)
    {
        bool _4656 = _4618 >= 3;
        bool _4658 = !_4656;
        if (!_4658)
        {
            bool _4660 = _4618 != 3;
            _4662 = _4660;
            if (!_4662)
            {
                float _4664 = _175 + _4558;
                float _4666 = _177 + _4560;
                float _4668 = _179 + _4562;
                float _4670 = _4564 + 1.0;
                _4632 = _4664;
                _4634 = _4666;
                _4636 = _4668;
                _4638 = _4670;
                _4672 = _4566;
                _4674 = _4568;
                _4676 = _4570;
                _4678 = _4572;
                _4680 = true;
            }
        }
        else
        {
            float _4682 = _175 + _4574;
            float _4684 = _177 + _4576;
            float _4686 = _179 + _4578;
            float _4688 = _4580 + 1.0;
            _4672 = _4566;
            _4674 = _4568;
            _4676 = _4570;
            _4678 = _4572;
            _4640 = _4682;
            _4642 = _4684;
            _4644 = _4686;
            _4646 = _4688;
            _4680 = true;
        }
    }
    if ((!_4680) || _4662)
    {
        bool _4690;
        if (!_4662)
        {
            _4690 = _4618 >= 1;
        }
        if ((!_4690) || _4662)
        {
            if (!_4662)
            {
                bool _4692 = _4618 != 0;
                if (!_4692)
                {
                    float _4694 = _175 + _4566;
                    _4624 = _4694;
                }
                float _4696 = _4624;
                _4672 = _4696;
                if (!_4692)
                {
                    float _4698 = _177 + _4568;
                    _4626 = _4698;
                }
                float _4700 = _4626;
                _4674 = _4700;
                if (!_4692)
                {
                    float _4702 = _179 + _4570;
                    _4628 = _4702;
                }
                float _4704 = _4628;
                _4676 = _4704;
                if (!_4692)
                {
                    float _4706 = _4572 + 1.0;
                    _4630 = _4706;
                }
                float _4708 = _4630;
                bool _4710 = !_4692;
                _4678 = _4708;
                _4680 = _4710;
            }
            if ((!_4680) || _4662)
            {
                _4662 = false;
                _4672 = _4566;
                _4674 = _4568;
                _4676 = _4570;
                _4678 = _4572;
                _4680 = true;
            }
        }
        else
        {
            float _4712 = _175 + _4582;
            float _4714 = _177 + _4584;
            float _4716 = _179 + _4586;
            float _4718 = _4588 + 1.0;
            _4672 = _4566;
            _4674 = _4568;
            _4676 = _4570;
            _4678 = _4572;
            _4648 = _4712;
            _4650 = _4714;
            _4652 = _4716;
            _4654 = _4718;
        }
    }
    _4680 = false;
    float _4720 = _4632;
    float _4722 = _4634;
    float _4724 = _4636;
    float _4726 = _4638;
    float _4728 = _4672;
    float _4730 = _4674;
    float _4732 = _4676;
    float _4734 = _4678;
    float _4736 = _4640;
    float _4738 = _4642;
    float _4740 = _4644;
    float _4742 = _4646;
    float _4744 = _4648;
    float _4746 = _4650;
    float _4748 = _4652;
    float _4750 = _4654;
    float _4752 = -_2481;
    float _4754 = _185 + _4752;
    float _4756 = -_2485;
    float _4758 = _183 + _4756;
    float _4760 = _2495 * _4754;
    float _4762 = -_2489;
    float _4764 = _187 + _4762;
    float _4766 = fma(_2499, _4758, _4760);
    float _4768 = fma(_2503, _4764, _4766);
    float _4770 = _2531 * _4768;
    float _4772 = rint(_4770);
    float _4774 = precise::max(0.0, _4772);
    float _4776 = precise::min(_4774, 3.0);
    float _4778 = trunc(_4776);
    int _4780 = int(_4778);
    bool _4782 = _4780 >= 2;
    bool _4784 = !_4782;
    float _4786 = as_type<float>(_4780);
    float _4788 = _4772;
    float _4790 = _4766;
    float _4792 = _4760;
    float _4794 = _4720;
    float _4796 = _4722;
    float _4798 = _4724;
    float _4800 = _4726;
    float _4802 = _4736;
    float _4804 = _4738;
    float _4806 = _4740;
    float _4808 = _4742;
    float _4810 = _4744;
    float _4812 = _4746;
    float _4814 = _4748;
    float _4816 = _4750;
    float _4834;
    float _4836;
    float _4838;
    float _4840;
    if (!_4784)
    {
        bool _4818 = _4780 >= 3;
        bool _4820 = !_4818;
        if (!_4820)
        {
            bool _4822 = _4780 != 3;
            _4824 = _4822;
            if (!_4824)
            {
                float _4826 = _183 + _4720;
                float _4828 = _185 + _4722;
                float _4830 = _187 + _4724;
                float _4832 = _4726 + 1.0;
                _4794 = _4826;
                _4796 = _4828;
                _4798 = _4830;
                _4800 = _4832;
                _4834 = _4728;
                _4836 = _4730;
                _4838 = _4732;
                _4840 = _4734;
                _4842 = true;
            }
        }
        else
        {
            float _4844 = _183 + _4736;
            float _4846 = _185 + _4738;
            float _4848 = _187 + _4740;
            float _4850 = _4742 + 1.0;
            _4834 = _4728;
            _4836 = _4730;
            _4838 = _4732;
            _4840 = _4734;
            _4802 = _4844;
            _4804 = _4846;
            _4806 = _4848;
            _4808 = _4850;
            _4842 = true;
        }
    }
    if ((!_4842) || _4824)
    {
        bool _4852;
        if (!_4824)
        {
            _4852 = _4780 >= 1;
        }
        if ((!_4852) || _4824)
        {
            if (!_4824)
            {
                bool _4854 = _4780 != 0;
                if (!_4854)
                {
                    float _4856 = _183 + _4728;
                    _4786 = _4856;
                }
                float _4858 = _4786;
                _4834 = _4858;
                if (!_4854)
                {
                    float _4860 = _185 + _4730;
                    _4788 = _4860;
                }
                float _4862 = _4788;
                _4836 = _4862;
                if (!_4854)
                {
                    float _4864 = _187 + _4732;
                    _4790 = _4864;
                }
                float _4866 = _4790;
                _4838 = _4866;
                if (!_4854)
                {
                    float _4868 = _4734 + 1.0;
                    _4792 = _4868;
                }
                float _4870 = _4792;
                bool _4872 = !_4854;
                _4840 = _4870;
                _4842 = _4872;
            }
            if ((!_4842) || _4824)
            {
                _4824 = false;
                _4834 = _4728;
                _4836 = _4730;
                _4838 = _4732;
                _4840 = _4734;
                _4842 = true;
            }
        }
        else
        {
            float _4874 = _183 + _4744;
            float _4876 = _185 + _4746;
            float _4878 = _187 + _4748;
            float _4880 = _4750 + 1.0;
            _4834 = _4728;
            _4836 = _4730;
            _4838 = _4732;
            _4840 = _4734;
            _4810 = _4874;
            _4812 = _4876;
            _4814 = _4878;
            _4816 = _4880;
        }
    }
    _4842 = false;
    float _4882 = _4794;
    float _4884 = _4796;
    float _4886 = _4798;
    float _4888 = _4800;
    float _4890 = _4834;
    float _4892 = _4836;
    float _4894 = _4838;
    float _4896 = _4840;
    float _4898 = _4802;
    float _4900 = _4804;
    float _4902 = _4806;
    float _4904 = _4808;
    float _4906 = _4810;
    float _4908 = _4812;
    float _4910 = _4814;
    float _4912 = _4816;
    float _4914 = -_2481;
    float _4916 = _193 + _4914;
    float _4918 = -_2485;
    float _4920 = _191 + _4918;
    float _4922 = _2495 * _4916;
    float _4924 = -_2489;
    float _4926 = _195 + _4924;
    float _4928 = fma(_2499, _4920, _4922);
    float _4930 = fma(_2503, _4926, _4928);
    float _4932 = _2531 * _4930;
    float _4934 = rint(_4932);
    float _4936 = precise::max(0.0, _4934);
    float _4938 = precise::min(_4936, 3.0);
    float _4940 = trunc(_4938);
    int _4942 = int(_4940);
    bool _4944 = _4942 >= 2;
    bool _4946 = !_4944;
    float _4948 = as_type<float>(_4942);
    float _4950 = _4926;
    float _4952 = _4934;
    float _4954 = _4928;
    float _4956 = _4912;
    float _4958 = _4904;
    float _4960 = _4898;
    float _4962 = _4888;
    float _4964 = _4906;
    float _4966 = _4910;
    float _4968 = _4900;
    float _4970 = _4902;
    float _4972 = _4908;
    float _4974 = _4884;
    float _4976 = _4882;
    float _4978 = _4886;
    float _4996;
    float _4998;
    float _5000;
    float _5002;
    if (!_4946)
    {
        bool _4980 = _4942 >= 3;
        bool _4982 = !_4980;
        if (!_4982)
        {
            bool _4984 = _4942 != 3;
            _4986 = _4984;
            if (!_4986)
            {
                float _4988 = _191 + _4882;
                float _4990 = _193 + _4884;
                float _4992 = _195 + _4886;
                float _4994 = _4888 + 1.0;
                _4996 = _4896;
                _4962 = _4994;
                _4998 = _4890;
                _5000 = _4894;
                _5002 = _4892;
                _4974 = _4990;
                _4976 = _4988;
                _4978 = _4992;
                _5004 = true;
            }
        }
        else
        {
            float _5006 = _191 + _4898;
            float _5008 = _193 + _4900;
            float _5010 = _195 + _4902;
            float _5012 = _4904 + 1.0;
            _4958 = _5012;
            _4960 = _5006;
            _4996 = _4896;
            _4998 = _4890;
            _4968 = _5008;
            _4970 = _5010;
            _5000 = _4894;
            _5002 = _4892;
            _5004 = true;
        }
    }
    if ((!_5004) || _4986)
    {
        bool _5014;
        if (!_4986)
        {
            _5014 = _4942 >= 1;
        }
        if ((!_5014) || _4986)
        {
            if (!_4986)
            {
                bool _5016 = _4942 != 0;
                if (!_5016)
                {
                    float _5018 = _191 + _4890;
                    _4948 = _5018;
                }
                float _5020 = _4948;
                _4998 = _5020;
                if (!_5016)
                {
                    float _5022 = _193 + _4892;
                    _4950 = _5022;
                }
                float _5024 = _4950;
                _5002 = _5024;
                if (!_5016)
                {
                    float _5026 = _195 + _4894;
                    _4952 = _5026;
                }
                float _5028 = _4952;
                _5000 = _5028;
                if (!_5016)
                {
                    float _5030 = _4896 + 1.0;
                    _4954 = _5030;
                }
                float _5032 = _4954;
                bool _5034 = !_5016;
                _4996 = _5032;
                _5004 = _5034;
            }
            if ((!_5004) || _4986)
            {
                _4986 = false;
                _4996 = _4896;
                _4998 = _4890;
                _5000 = _4894;
                _5002 = _4892;
                _5004 = true;
            }
        }
        else
        {
            float _5036 = _191 + _4906;
            float _5038 = _193 + _4908;
            float _5040 = _195 + _4910;
            float _5042 = _4912 + 1.0;
            _4956 = _5042;
            _4996 = _4896;
            _4964 = _5036;
            _4966 = _5040;
            _4998 = _4890;
            _4972 = _5038;
            _5000 = _4894;
            _5002 = _4892;
        }
    }
    _5004 = false;
    float _5044 = _4956;
    float _5046 = _4958;
    float _5048 = _4960;
    float _5050 = _4996;
    float _5052 = _4962;
    float _5054 = _4964;
    float _5056 = _4966;
    float _5058 = _4998;
    float _5060 = _4968;
    float _5062 = _4970;
    float _5064 = _4972;
    float _5066 = _5000;
    float _5068 = _5002;
    float _5070 = _4974;
    float _5072 = _4976;
    float _5074 = _4978;
    float _5076 = _5044 * 4.0;
    float _5078 = fma(_5046, 4.0, _5044);
    float _5080 = _5046 + _5044;
    float _5082 = _5048 * 6.0;
    float _5084 = fma(_5050, 9.0, _5076);
    float _5086 = fma(_5052, 9.0, _5078);
    float _5088 = _5054 * 6.0;
    float _5090 = _5080 * 2.0;
    float _5092 = _5084 + _5046;
    float _5094 = _5056 * 6.0;
    float _5096 = fma(_5058, 9.0, _5088);
    float _5098 = _5060 * 6.0;
    float _5100 = _5092 * _5086;
    float _5102 = _5062 * 6.0;
    float _5104 = fma(_5054, 3.0, _5082);
    float _5106 = fma(_5064, 3.0, _5098);
    float _5108 = -_5100;
    float _5110 = fma(_5090, _5090, _5108);
    float _5112 = _5064 * 6.0;
    float _5114 = fma(_5066, 9.0, _5094);
    float _5116 = fma(_5056, 3.0, _5102);
    bool _5118 = _5110 != 0.0;
    bool _5120 = isnan(_5110);
    bool _5122 = _5118 || _5120;
    bool _5124 = isnan(0.0);
    bool _5126 = _5122 || _5124;
    float _5128 = fma(_5068, 9.0, _5112);
    float _5130 = fma(_5070, 9.0, _5106);
    float _5132 = fma(_5048, 3.0, _5096);
    float _5134 = fma(_5062, 3.0, _5114);
    float _5136 = fma(_5060, 3.0, _5128);
    float _5138 = fma(_5072, 9.0, _5104);
    float _5140 = fma(_5074, 9.0, _5116);
    bool _5142 = !_5126;
    if (!_5142)
    {
        float _5144 = 1.0 / _5110;
        float _5146 = _5132 * _5086;
        float _5148 = _5092 * _5138;
        float _5150 = _5092 * _5140;
        float _5152 = -_5146;
        float _5154 = fma(_5138, _5090, _5152);
        float _5156 = -_5148;
        float _5158 = fma(_5132, _5090, _5156);
        float _5160 = _5136 * _5086;
        float _5162 = _5092 * _5130;
        float _5164 = _5134 * _5086;
        float _5166 = -_5150;
        float _5168 = fma(_5134, _5090, _5166);
        float _5170 = -_5160;
        float _5172 = fma(_5130, _5090, _5170);
        float _5174 = -_5162;
        float _5176 = fma(_5136, _5090, _5174);
        float _5178 = -_5164;
        float _5180 = fma(_5140, _5090, _5178);
        float _5182 = _5168 * _5144;
        float _5184 = _5158 * _5144;
        float _5186 = _5176 * _5144;
        float _5188 = _5154 * _5144;
        float _5190 = _5172 * _5144;
        float _5192 = _5180 * _5144;
        float _5194 = -_5188;
        float _5196 = _5184 + _5194;
        float _5198 = -_5190;
        float _5200 = _5186 + _5198;
        float _5202 = -_5192;
        float _5204 = _5182 + _5202;
        _2550 = _5196;
        _2552 = _5200;
        _2554 = _5204;
        _2556 = _5188;
        _2558 = _5184;
        _2560 = _5190;
        _2562 = _5186;
        _2564 = _5182;
        _2566 = _5192;
    }
    float _5206 = _2550;
    float _5208 = _2552;
    float _5210 = _2554;
    float _5212 = _2556;
    float _5214 = _2558;
    float _5216 = _2560;
    float _5218 = _2562;
    float _5220 = _2564;
    float _5222 = _2566;
    float _5224 = fma(_5206, 496.0, 0.5);
    float _5226 = precise::clamp(_5224, 0.0, 1.0);
    float _5228 = fma(_5206, -31.0, 1.0);
    float _5230 = precise::clamp(_5228, 0.0, 1.0);
    float _5232 = _5226 + (-0.5);
    float _5234 = fma(_5208, 1008.0, 0.5);
    float _5236 = precise::clamp(_5234, 0.0, 1.0);
    float _5238 = fma(_5210, 496.0, 0.5);
    float _5240 = precise::clamp(_5238, 0.0, 1.0);
    float _5242 = fma(_5208, -63.0, 1.0);
    float _5244 = precise::clamp(_5242, 0.0, 1.0);
    float _5246 = _5230 * _5232;
    float _5248 = _5236 + (-0.5);
    float _5250 = fma(_5210, -31.0, 1.0);
    float _5252 = precise::clamp(_5250, 0.0, 1.0);
    float _5254 = _5240 + (-0.5);
    float _5256 = fma(_5246, -0.0322580635547637939453125, _5212);
    float _5258 = precise::clamp(_5256, 0.0, 1.0);
    float _5260 = _5244 * _5248;
    float _5262 = _5260 * 2.0;
    float _5264 = fma(_5246, 0.0322580635547637939453125, _5214);
    float _5266 = precise::clamp(_5264, 0.0, 1.0);
    float _5268 = _5252 * _5254;
    float _5270 = _5258 * 31.0;
    float _5272 = fma(_5262, -0.01587301678955554962158203125, _5216);
    float _5274 = precise::clamp(_5272, 0.0, 1.0);
    float _5276 = fma(_5262, 0.01587301678955554962158203125, _5218);
    float _5278 = precise::clamp(_5276, 0.0, 1.0);
    float _5280 = _5266 * 31.0;
    float _5282 = fma(_5268, 0.0322580635547637939453125, _5220);
    float _5284 = precise::clamp(_5282, 0.0, 1.0);
    float _5286 = _5274 * 63.0;
    float _5288 = _5278 * 63.0;
    float _5290 = fma(_5268, -0.0322580635547637939453125, _5222);
    float _5292 = precise::clamp(_5290, 0.0, 1.0);
    float _5294 = _5284 * 31.0;
    float _5296 = rint(_5280);
    float _5298 = _5292 * 31.0;
    float _5300 = rint(_5288);
    float _5302 = rint(_5270);
    float _5304 = rint(_5286);
    float _5306 = _5300 + 0.5;
    float _5308 = rint(_5294);
    float _5310 = _5296 + 0.5;
    float _5312 = _5302 + 0.5;
    float _5314 = rint(_5298);
    float _5316 = _5304 + 0.5;
    float _5318 = _5308 + 0.5;
    float _5320 = trunc(_5310);
    float _5322 = precise::max(_5320, 0.0);
    uint _5325 = uint(_5322);
    float _5327 = _5314 + 0.5;
    float _5329 = trunc(_5306);
    float _5331 = precise::max(_5329, 0.0);
    uint _5333 = uint(_5331);
    float _5335 = trunc(_5312);
    float _5337 = precise::max(_5335, 0.0);
    uint _5339 = uint(_5337);
    int _5341 = int(_5325) << 11;
    float _5343 = trunc(_5316);
    float _5345 = precise::max(_5343, 0.0);
    uint _5347 = uint(_5345);
    int _5349 = int(_5333) << 5;
    float _5351 = trunc(_5318);
    float _5353 = precise::max(_5351, 0.0);
    uint _5355 = uint(_5353);
    int _5357 = int(_5339) << 11;
    float _5359 = trunc(_5327);
    float _5361 = precise::max(_5359, 0.0);
    uint _5363 = uint(_5361);
    int _5365 = int(_5347) << 5;
    int _5367 = _5341 | _5349;
    int _5369 = int(_5355) | _5367;
    int _5371 = _5357 | _5365;
    int _5373 = int(_5363) | _5371;
    bool _5375 = _5369 != _5373;
    int _5377 = _5365;
    int _5379 = _5341;
    int _5381 = int(_5339);
    int _5383 = _5369;
    if (!_5375)
    {
        _5377 = _5369;
    }
    int _5385 = _5377;
    int _5387 = _5385;
    if (!_5375)
    {
        _5379 = 0;
    }
    int _5389 = _5379;
    int _5391 = _5389;
    if (!_5375)
    {
        _5381 = 0;
    }
    int _5393 = _5381;
    bool _5395 = !_5375;
    int _5397 = _5393;
    if (!_5395)
    {
        float _5399 = _5296 * 0.0322580635547637939453125;
        float _5401 = _5302 * 0.0322580635547637939453125;
        float _5403 = _5300 * 0.01587301678955554962158203125;
        bool _5405 = uint(_5369) >= uint(_5373);
        float _5407 = _5304 * 0.01587301678955554962158203125;
        float _5409 = _5308 * 0.0322580635547637939453125;
        float _5411 = _5314 * 0.0322580635547637939453125;
        bool _5413 = !_5405;
        float _5415 = _5413 ? _5399 : _5401;
        bool _5417 = !_5405;
        float _5419 = _5417 ? _5401 : _5399;
        bool _5421 = !_5405;
        float _5423 = _5421 ? _5403 : _5407;
        float _5425 = -_5415;
        float _5427 = _127 + _5425;
        bool _5429 = !_5405;
        float _5431 = _5429 ? _5407 : _5403;
        float _5433 = -_5415;
        float _5435 = _5433 + _5419;
        bool _5437 = !_5405;
        float _5439 = _5437 ? _5409 : _5411;
        float _5441 = -_5415;
        float _5443 = _119 + _5441;
        bool _5445 = !_5405;
        float _5447 = _5445 ? _5411 : _5409;
        float _5449 = -_5423;
        float _5451 = _5449 + _5431;
        float _5453 = -_5415;
        float _5455 = _111 + _5453;
        float _5457 = -_5415;
        float _5459 = _103 + _5457;
        float _5461 = -_5415;
        float _5463 = _95 + _5461;
        float _5465 = _5451 * _5451;
        float _5467 = -_5439;
        float _5469 = _5467 + _5447;
        float _5471 = -_5415;
        float _5473 = _87 + _5471;
        float _5475 = -_5415;
        float _5477 = _79 + _5475;
        float _5479 = fma(_5435, _5435, _5465);
        float _5481 = -_5415;
        float _5483 = _71 + _5481;
        float _5485 = -_5415;
        float _5487 = _191 + _5485;
        float _5489 = -_5415;
        float _5491 = _183 + _5489;
        float _5493 = fma(_5469, _5469, _5479);
        float _5495 = -_5415;
        float _5497 = _175 + _5495;
        float _5499 = -_5415;
        float _5501 = _167 + _5499;
        float _5503 = -_5415;
        float _5505 = _159 + _5503;
        float _5507 = -_5415;
        float _5509 = _151 + _5507;
        float _5511 = -_5415;
        float _5513 = _143 + _5511;
        float _5515 = -_5415;
        float _5517 = _135 + _5515;
        float _5519 = -_5423;
        float _5521 = _129 + _5519;
        float _5523 = 1.0 / _5493;
        float _5525 = -_5423;
        float _5527 = _193 + _5525;
        float _5529 = -_5439;
        float _5531 = _131 + _5529;
        float _5533 = -_5423;
        float _5535 = _121 + _5533;
        float _5537 = -_5423;
        float _5539 = _161 + _5537;
        float _5541 = -_5423;
        float _5543 = _153 + _5541;
        float _5545 = -_5439;
        float _5547 = _195 + _5545;
        float _5549 = -_5423;
        float _5551 = _185 + _5549;
        float _5553 = -_5423;
        float _5555 = _113 + _5553;
        float _5557 = -_5423;
        float _5559 = _105 + _5557;
        float _5561 = -_5423;
        float _5563 = _97 + _5561;
        float _5565 = -_5423;
        float _5567 = _89 + _5565;
        float _5569 = -_5423;
        float _5571 = _81 + _5569;
        float _5573 = -_5423;
        float _5575 = _73 + _5573;
        float _5577 = -_5423;
        float _5579 = _177 + _5577;
        float _5581 = -_5423;
        float _5583 = _169 + _5581;
        float _5585 = _5451 * _5523;
        float _5587 = _5435 * _5523;
        float _5589 = _5469 * _5523;
        float _5591 = -_5423;
        float _5593 = _145 + _5591;
        float _5595 = _5585 * _5521;
        float _5597 = _5585 * _5527;
        float _5599 = _5585 * _5535;
        float _5601 = _5585 * _5539;
        float _5603 = fma(_5587, _5427, _5595);
        float _5605 = fma(_5587, _5487, _5597);
        float _5607 = _5585 * _5543;
        float _5609 = -_5423;
        float _5611 = _137 + _5609;
        float _5613 = fma(_5589, _5531, _5603);
        float _5615 = fma(_5589, _5547, _5605);
        float _5617 = -_5439;
        float _5619 = _123 + _5617;
        float _5621 = _5585 * _5551;
        float _5623 = fma(_5587, _5443, _5599);
        bool _5625 = _5613 >= 0.5;
        float _5627 = -_5439;
        float _5629 = _163 + _5627;
        float _5631 = -_5439;
        float _5633 = _155 + _5631;
        float _5635 = fma(_5587, _5505, _5601);
        float _5637 = fma(_5587, _5509, _5607);
        float _5639 = -_5439;
        float _5641 = _187 + _5639;
        float _5643 = _5585 * _5555;
        float _5645 = _5585 * _5559;
        float _5647 = _5585 * _5563;
        float _5649 = _5585 * _5567;
        float _5651 = _5585 * _5571;
        float _5653 = _5585 * _5575;
        float _5655 = _5585 * _5579;
        float _5657 = _5585 * _5583;
        float _5659 = _5585 * _5593;
        float _5661 = _5585 * _5611;
        float _5663 = fma(_5587, _5491, _5621);
        float _5665 = fma(_5589, _5619, _5623);
        bool _5667 = _5615 >= 0.5;
        float _5669 = -_5439;
        float _5671 = _115 + _5669;
        bool _5673 = _5613 >= 0.833000004291534423828125;
        float _5675 = -_5439;
        float _5677 = _107 + _5675;
        float _5679 = -_5439;
        float _5681 = _99 + _5679;
        float _5683 = -_5439;
        float _5685 = _91 + _5683;
        float _5687 = -_5439;
        float _5689 = _83 + _5687;
        float _5691 = -_5439;
        float _5693 = _75 + _5691;
        float _5695 = -_5439;
        float _5697 = _179 + _5695;
        float _5699 = -_5439;
        float _5701 = _171 + _5699;
        float _5703 = -_5439;
        float _5705 = _147 + _5703;
        float _5707 = fma(_5589, _5629, _5635);
        float _5709 = fma(_5589, _5633, _5637);
        float _5711 = -_5439;
        float _5713 = _139 + _5711;
        float _5715 = fma(_5587, _5455, _5643);
        float _5717 = fma(_5587, _5459, _5645);
        float _5719 = fma(_5587, _5463, _5647);
        float _5721 = fma(_5587, _5473, _5649);
        float _5723 = fma(_5587, _5477, _5651);
        float _5725 = fma(_5587, _5483, _5653);
        float _5727 = fma(_5587, _5497, _5655);
        float _5729 = fma(_5587, _5501, _5657);
        float _5731 = fma(_5587, _5513, _5659);
        float _5733 = fma(_5587, _5517, _5661);
        float _5735 = fma(_5589, _5641, _5663);
        bool _5737 = _5613 >= 0.16599999368190765380859375;
        float _5739 = fma(_5589, _5671, _5715);
        float _5741 = fma(_5589, _5677, _5717);
        int _5743 = _5673 ? 0 : 32768;
        float _5745 = fma(_5589, _5681, _5719);
        bool _5747 = _5615 >= 0.833000004291534423828125;
        float _5749 = fma(_5589, _5685, _5721);
        bool _5751 = _5665 >= 0.5;
        float _5753 = fma(_5589, _5689, _5723);
        float _5755 = fma(_5589, _5693, _5725);
        float _5757 = fma(_5589, _5697, _5727);
        float _5759 = fma(_5589, _5701, _5729);
        float _5761 = fma(_5589, _5705, _5731);
        float _5763 = fma(_5589, _5713, _5733);
        int _5765 = _5743;
        if (!_5625)
        {
            int _5767 = _5737 ? 49152 : 16384;
            _5765 = _5767;
        }
        int _5769 = _5765;
        bool _5771 = _5615 >= 0.16599999368190765380859375;
        int _5773 = _5747 ? 0 : 32768;
        bool _5775 = _5735 >= 0.5;
        bool _5777 = _5665 >= 0.833000004291534423828125;
        int _5779 = _5773;
        if (!_5667)
        {
            int _5781 = _5771 ? 49152 : 16384;
            _5779 = _5781;
        }
        int _5783 = _5779;
        bool _5785 = _5665 >= 0.16599999368190765380859375;
        bool _5787 = _5735 >= 0.833000004291534423828125;
        int _5789 = _5777 ? 0 : 8192;
        bool _5791 = _5739 >= 0.5;
        bool _5793 = _5735 >= 0.16599999368190765380859375;
        int _5795 = _5787 ? 0 : 8192;
        int _5797 = _5789;
        int _5799 = _5795;
        if (!_5751)
        {
            int _5801 = _5785 ? 12288 : 4096;
            _5797 = _5801;
        }
        int _5803 = _5797;
        bool _5805 = _5739 >= 0.833000004291534423828125;
        bool _5807 = _5757 >= 0.5;
        if (!_5775)
        {
            int _5809 = _5793 ? 12288 : 4096;
            _5799 = _5809;
        }
        int _5811 = _5799;
        int _5813 = _5805 ? 0 : 2048;
        bool _5815 = _5739 >= 0.16599999368190765380859375;
        bool _5817 = _5757 >= 0.833000004291534423828125;
        bool _5819 = _5741 >= 0.5;
        bool _5821 = _5757 >= 0.16599999368190765380859375;
        int _5823 = _5817 ? 0 : 2048;
        int _5825 = _5813;
        int _5827 = _5823;
        if (!_5791)
        {
            int _5829 = _5815 ? 3072 : 1024;
            _5825 = _5829;
        }
        int _5831 = _5825;
        bool _5833 = _5741 >= 0.833000004291534423828125;
        bool _5835 = _5759 >= 0.5;
        if (!_5807)
        {
            int _5837 = _5821 ? 3072 : 1024;
            _5827 = _5837;
        }
        int _5839 = _5827;
        bool _5841 = _5741 >= 0.16599999368190765380859375;
        int _5843 = _5833 ? 0 : 512;
        bool _5845 = _5745 >= 0.5;
        bool _5847 = _5759 >= 0.833000004291534423828125;
        int _5849 = _5843;
        if (!_5819)
        {
            int _5851 = _5841 ? 768 : 256;
            _5849 = _5851;
        }
        int _5853 = _5849;
        bool _5855 = _5759 >= 0.16599999368190765380859375;
        bool _5857 = _5707 >= 0.5;
        int _5859 = _5847 ? 0 : 512;
        bool _5861 = _5745 >= 0.833000004291534423828125;
        int _5863 = _5859;
        if (!_5835)
        {
            int _5865 = _5855 ? 768 : 256;
            _5863 = _5865;
        }
        int _5867 = _5863;
        bool _5869 = _5745 >= 0.16599999368190765380859375;
        bool _5871 = _5707 >= 0.833000004291534423828125;
        int _5873 = _5861 ? 0 : 128;
        bool _5875 = _5707 >= 0.16599999368190765380859375;
        bool _5877 = _5749 >= 0.5;
        int _5879 = _5871 ? 0 : 128;
        int _5881 = _5873;
        int _5883 = _5879;
        if (!_5845)
        {
            int _5885 = _5869 ? 192 : 64;
            _5881 = _5885;
        }
        int _5887 = _5881;
        bool _5889 = _5749 >= 0.833000004291534423828125;
        bool _5891 = _5709 >= 0.5;
        if (!_5857)
        {
            int _5893 = _5875 ? 192 : 64;
            _5883 = _5893;
        }
        int _5895 = _5883;
        int _5897 = _5889 ? 0 : 32;
        bool _5899 = _5753 >= 0.5;
        bool _5901 = _5749 >= 0.16599999368190765380859375;
        bool _5903 = _5709 >= 0.833000004291534423828125;
        bool _5905 = _5709 >= 0.16599999368190765380859375;
        int _5907 = _5903 ? 0 : 32;
        int _5909 = _5897;
        int _5911 = _5907;
        if (!_5877)
        {
            int _5913 = _5901 ? 48 : 16;
            _5909 = _5913;
        }
        int _5915 = _5909;
        bool _5917 = _5753 >= 0.833000004291534423828125;
        bool _5919 = _5761 >= 0.5;
        if (!_5891)
        {
            int _5921 = _5905 ? 48 : 16;
            _5911 = _5921;
        }
        int _5923 = _5911;
        bool _5925 = _5753 >= 0.16599999368190765380859375;
        bool _5927 = _5761 >= 0.833000004291534423828125;
        int _5929 = _5917 ? 0 : 8;
        int _5931 = _5927 ? 0 : 8;
        int _5933 = _5929;
        int _5935 = _5931;
        if (!_5899)
        {
            int _5937 = _5925 ? 12 : 4;
            _5933 = _5937;
        }
        int _5939 = _5933;
        bool _5941 = _5755 >= 0.5;
        bool _5943 = _5763 >= 0.5;
        bool _5945 = _5761 >= 0.16599999368190765380859375;
        int _5947 = _5831 + _5769;
        int _5949 = _5947 + _5803;
        int _5951 = _5839 + _5783;
        int _5953 = _5951 + _5811;
        if (!_5919)
        {
            int _5955 = _5945 ? 12 : 4;
            _5935 = _5955;
        }
        int _5957 = _5935;
        bool _5959 = _5755 >= 0.833000004291534423828125;
        bool _5961 = _5763 >= 0.833000004291534423828125;
        bool _5963 = _5755 >= 0.16599999368190765380859375;
        bool _5965 = _5763 >= 0.16599999368190765380859375;
        int _5967 = _5887 + _5949;
        int _5969 = _5967 + _5853;
        int _5971 = _5895 + _5953;
        int _5973 = _5971 + _5867;
        int _5975 = _5959 ? 0 : 2;
        int _5977 = _5961 ? 0 : 2;
        int _5979 = _5975;
        int _5981 = _5977;
        if (!_5941)
        {
            int _5983 = _5963 ? 3 : 1;
            _5979 = _5983;
        }
        int _5985 = _5979;
        if (!_5943)
        {
            int _5987 = _5965 ? 3 : 1;
            _5981 = _5987;
        }
        int _5989 = _5981;
        int _5991 = _5939 + _5969;
        int _5993 = _5991 + _5915;
        int _5995 = _5957 + _5973;
        int _5997 = _5995 + _5923;
        bool _5999 = !_5405;
        int _6001 = _5999 ? _5373 : _5369;
        bool _6003 = !_5405;
        int _6005 = _6003 ? _5369 : _5373;
        int _6007 = _5993 + _5985;
        int _6009 = _5997 + _5989;
        _5387 = _6001;
        _5383 = _6005;
        _5391 = _6007;
        _5397 = _6009;
    }
    int _6011 = _5387;
    int _6013 = _5383;
    int _6015 = _5391;
    int _6017 = _5397;
    out.m_32.x = as_type<float>(_6011);
    out.m_32.y = as_type<float>(_6013);
    out.m_32.z = as_type<float>(_6015);
    out.m_32.w = as_type<float>(_6017);
    return main0_out_u{as_type<uint4>(out.m_32)};
}

