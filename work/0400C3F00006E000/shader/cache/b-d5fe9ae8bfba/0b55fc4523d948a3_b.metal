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
    texturecube_array<float> fp_t_tcb_8 [[id(1)]];
    sampler fp_t_tcb_8Smplr [[id(2)]];
    sampler fp_t_tcb_8Smplr_w [[id(3)]];
    constant dm_border_t* dm_border [[id(4)]];
};

struct main0_out
{
    float4 m_36 [[color(0)]];
};

struct main0_in
{
    float4 m_29 [[user(locn0)]];
    float4 m_31 [[user(locn1)]];
    float4 m_33 [[user(locn2)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _5451 = false;
    bool _5433 = false;
    bool _5289 = false;
    bool _5271 = false;
    bool _5127 = false;
    bool _5109 = false;
    bool _4965 = false;
    bool _4947 = false;
    bool _4803 = false;
    bool _4785 = false;
    bool _4641 = false;
    bool _4623 = false;
    bool _4479 = false;
    bool _4461 = false;
    bool _4317 = false;
    bool _4299 = false;
    bool _4155 = false;
    bool _4137 = false;
    bool _3993 = false;
    bool _3975 = false;
    bool _3831 = false;
    bool _3813 = false;
    bool _3669 = false;
    bool _3651 = false;
    bool _3507 = false;
    bool _3489 = false;
    bool _3345 = false;
    bool _3327 = false;
    bool _3183 = false;
    bool _3165 = false;
    bool _3055 = false;
    bool _3021 = false;
    float _43 = gl_FragCoord.w;
    float _45 = in.m_29.y;
    float _47 = gl_FragCoord.w;
    float _49 = _45 * _47;
    float _51 = in.m_29.x;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = in.m_31.x;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = in.m_31.y;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = in.m_29.z;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_31.z;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_33.x;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = in.m_33.y;
    float _89 = gl_FragCoord.w;
    float _91 = _87 * _89;
    float _93 = in.m_33.z;
    float _95 = gl_FragCoord.w;
    float _97 = _93 * _95;
    float _99 = 1.0 / _43;
    float _101 = _99 * _49;
    float _103 = _99 * _55;
    float _105 = _99 * _61;
    float _107 = _99 * _67;
    float _109 = _99 * _73;
    float _111 = _99 * _79;
    float _113 = _103 + _105;
    float _115 = _101 + _107;
    float _117 = abs(_103);
    float _119 = abs(_101);
    float _121 = precise::max(_117, _119);
    float _123 = _109 + _111;
    float _125 = fma(_105, 3.0, _103);
    float _127 = fma(_107, 3.0, _101);
    float _129 = abs(_113);
    float _131 = abs(_115);
    float _133 = precise::max(_129, _131);
    float _135 = _99 * _91;
    float _137 = fma(_107, 2.0, _101);
    float _139 = abs(_109);
    float _141 = precise::max(_139, _121);
    float _143 = fma(_105, 2.0, _103);
    float _145 = abs(_123);
    float _147 = precise::max(_145, _133);
    float _149 = _99 * _85;
    float _151 = fma(_111, 3.0, _109);
    float _153 = in.m_29.w;
    float _155 = gl_FragCoord.w;
    float _157 = _153 * _155;
    float _159 = abs(_125);
    float _161 = abs(_127);
    float _163 = precise::max(_159, _161);
    float _165 = _99 * _97;
    float _167 = _103 + _149;
    float _169 = _101 + _135;
    float _171 = 1.0 / _141;
    float _173 = abs(_151);
    float _175 = precise::max(_173, _163);
    float _177 = fma(_149, 3.0, _103);
    float _179 = fma(_111, 2.0, _109);
    float _181 = _109 + _165;
    float _183 = abs(_167);
    float _185 = abs(_169);
    float _187 = precise::max(_183, _185);
    float _189 = fma(_165, 3.0, _109);
    float _191 = abs(_143);
    float _193 = abs(_137);
    float _195 = precise::max(_191, _193);
    float _197 = 1.0 / _175;
    float _199 = fma(_135, 3.0, _101);
    float _201 = _113 + _149;
    float _203 = _115 + _135;
    float _205 = abs(_181);
    float _207 = precise::max(_205, _187);
    float _209 = fma(_149, 2.0, _103);
    float _211 = abs(_179);
    float _213 = precise::max(_211, _195);
    float _215 = fma(_135, 2.0, _101);
    float _217 = _123 + _165;
    float _219 = abs(_177);
    float _221 = abs(_199);
    float _223 = precise::max(_219, _221);
    float _225 = 1.0 / _147;
    float _227 = fma(_165, 2.0, _109);
    float _229 = abs(_209);
    float _231 = abs(_215);
    float _233 = precise::max(_229, _231);
    float _235 = _143 + _149;
    float _237 = abs(_189);
    float _239 = precise::max(_237, _223);
    float _241 = _137 + _135;
    float _243 = abs(_201);
    float _245 = abs(_203);
    float _247 = precise::max(_243, _245);
    float _249 = _125 + _149;
    float _251 = 1.0 / _207;
    float _253 = _127 + _135;
    float _255 = abs(_217);
    float _257 = precise::max(_255, _247);
    float _259 = _179 + _165;
    float _261 = abs(_227);
    float _263 = precise::max(_261, _233);
    float _265 = _103 * _171;
    float _267 = abs(_235);
    float _269 = abs(_241);
    float _271 = precise::max(_267, _269);
    float _273 = _101 * _171;
    float _275 = 1.0 / _213;
    float _277 = _109 * _171;
    float _279 = _151 + _165;
    float _281 = abs(_249);
    float _283 = abs(_253);
    float _285 = precise::max(_281, _283);
    float _287 = fma(_149, 2.0, _113);
    float _289 = fma(_135, 2.0, _115);
    float _291 = fma(_149, 2.0, _143);
    float _293 = fma(_135, 2.0, _137);
    float _295 = 1.0 / _257;
    float _297 = fma(_135, 3.0, _115);
    float _299 = fma(_135, 2.0, _127);
    float _301 = fma(_135, 3.0, _137);
    float _303 = abs(_259);
    float _305 = precise::max(_303, _271);
    float _307 = fma(_149, 3.0, _125);
    float _309 = fma(_135, 3.0, _127);
    float _311 = fma(_149, 3.0, _113);
    float _313 = 1.0 / _263;
    float _315 = abs(_279);
    float _317 = precise::max(_315, _285);
    float _319 = fma(_165, 2.0, _123);
    float _321 = fma(_165, 2.0, _179);
    float _323 = abs(_287);
    float _325 = abs(_289);
    float _327 = precise::max(_323, _325);
    float _329 = fma(_149, 2.0, _125);
    float _331 = abs(_291);
    float _333 = abs(_293);
    float _335 = precise::max(_331, _333);
    float _337 = _99 * _157;
    float _339 = fma(_149, 3.0, _143);
    float _341 = _123 * _225;
    float _343 = fma(_165, 3.0, _151);
    float _345 = _167 * _251;
    float _347 = _169 * _251;
    float _349 = _181 * _251;
    float _351 = _113 * _225;
    float _353 = _115 * _225;
    float _355 = fma(_165, 3.0, _123);
    float _357 = abs(_307);
    float _359 = abs(_309);
    float _361 = precise::max(_357, _359);
    float _363 = fma(_165, 2.0, _151);
    float _365 = abs(_319);
    float _367 = precise::max(_365, _327);
    float _369 = _179 * _275;
    float _371 = abs(_321);
    float _373 = precise::max(_371, _335);
    float _375 = fma(_165, 3.0, _179);
    float _377 = abs(_311);
    float _379 = abs(_297);
    float _381 = precise::max(_377, _379);
    float _383 = _201 * _295;
    float _385 = abs(_329);
    float _387 = abs(_299);
    float _389 = precise::max(_385, _387);
    float _391 = 1.0 / _367;
    float _393 = abs(_339);
    float _395 = abs(_301);
    float _397 = precise::max(_393, _395);
    float _399 = _203 * _295;
    float _401 = abs(_343);
    float _403 = precise::max(_401, _361);
    float _405 = _217 * _295;
    float _407 = abs(_355);
    float _409 = precise::max(_407, _381);
    float _411 = _143 * _275;
    float _413 = abs(_363);
    float _415 = precise::max(_413, _389);
    float _417 = 1.0 / _403;
    float _419 = abs(_375);
    float _421 = precise::max(_419, _397);
    float _423 = _137 * _275;
    float _425 = _209 * _313;
    float _427 = _215 * _313;
    float _429 = _227 * _313;
    float _431 = _125 * _197;
    float _433 = _127 * _197;
    float _435 = rint(_337);
    float _437 = precise::max(_435, 0.0);
    uint _440 = uint(_437);
    uint _442 = clamp(_440, 0u, 65535u);
    float _444 = _287 * _391;
    float _446 = _289 * _391;
    float _448 = _319 * _391;
    float _450 = _151 * _197;
    float _452 = 1.0 / _305;
    float _454 = _307 * _417;
    float _456 = _309 * _417;
    float _458 = _343 * _417;
    float _460 = 1.0 / _415;
    float _462 = 1.0 / _239;
    float _464 = _235 * _452;
    float _466 = _241 * _452;
    float _468 = _259 * _452;
    float _470 = 1.0 / _317;
    float _472 = _329 * _460;
    float _474 = _299 * _460;
    float _476 = _363 * _460;
    float _478 = 1.0 / _373;
    float _480 = _177 * _462;
    float _482 = _199 * _462;
    float _484 = _189 * _462;
    float _486 = 1.0 / _409;
    float _488 = _249 * _470;
    float _490 = _253 * _470;
    float _492 = _279 * _470;
    float _494 = 1.0 / _421;
    float _496 = _291 * _478;
    float _498 = _293 * _478;
    float _500 = _321 * _478;
    float4 _7081 = float4(_265, _273, _277, float(int(_442)));
    float4 _7085 = select(_7081, float4(0.0), isnan(_7081));
    float3 _504 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _7085.xyz, uint(rint(_7085.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _7085.xyz, uint(rint(_7085.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyz;
    float _506 = _504.x;
    float _508 = _504.y;
    float _510 = _504.z;
    float _512 = _311 * _486;
    float _514 = _297 * _486;
    float _516 = _355 * _486;
    float _518 = _339 * _494;
    float _520 = _301 * _494;
    float _522 = _375 * _494;
    float4 _7122 = float4(_351, _353, _341, float(int(_442)));
    float4 _7124 = select(_7122, float4(0.0), isnan(_7122));
    float3 _524 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _7124.xyz, uint(rint(_7124.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _7124.xyz, uint(rint(_7124.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyz;
    float _526 = _524.x;
    float _528 = _524.y;
    float _530 = _524.z;
    float4 _7142 = float4(_411, _423, _369, float(int(_442)));
    float4 _7144 = select(_7142, float4(0.0), isnan(_7142));
    float3 _532 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _7144.xyz, uint(rint(_7144.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _7144.xyz, uint(rint(_7144.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyz;
    float _534 = _532.x;
    float _536 = _532.y;
    float _538 = _532.z;
    float4 _7162 = float4(_431, _433, _450, float(int(_442)));
    float4 _7164 = select(_7162, float4(0.0), isnan(_7162));
    float3 _540 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _7164.xyz, uint(rint(_7164.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _7164.xyz, uint(rint(_7164.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyz;
    float _542 = _540.x;
    float _544 = _540.y;
    float _546 = _540.z;
    float4 _7182 = float4(_345, _347, _349, float(int(_442)));
    float4 _7184 = select(_7182, float4(0.0), isnan(_7182));
    float3 _548 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _7184.xyz, uint(rint(_7184.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _7184.xyz, uint(rint(_7184.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyz;
    float _550 = _548.x;
    float _552 = _548.y;
    float _554 = _548.z;
    float4 _7202 = float4(_383, _399, _405, float(int(_442)));
    float4 _7204 = select(_7202, float4(0.0), isnan(_7202));
    float3 _556 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _7204.xyz, uint(rint(_7204.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _7204.xyz, uint(rint(_7204.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyz;
    float _558 = _556.x;
    float _560 = _556.y;
    float _562 = _556.z;
    float4 _7222 = float4(_464, _466, _468, float(int(_442)));
    float4 _7224 = select(_7222, float4(0.0), isnan(_7222));
    float3 _564 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _7224.xyz, uint(rint(_7224.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _7224.xyz, uint(rint(_7224.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyz;
    float _566 = _564.x;
    float _568 = _564.y;
    float _570 = _564.z;
    float4 _7242 = float4(_488, _490, _492, float(int(_442)));
    float4 _7244 = select(_7242, float4(0.0), isnan(_7242));
    float3 _572 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _7244.xyz, uint(rint(_7244.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _7244.xyz, uint(rint(_7244.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyz;
    float _574 = _572.x;
    float _576 = _572.y;
    float _578 = _572.z;
    float4 _7262 = float4(_425, _427, _429, float(int(_442)));
    float4 _7264 = select(_7262, float4(0.0), isnan(_7262));
    float3 _580 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _7264.xyz, uint(rint(_7264.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _7264.xyz, uint(rint(_7264.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyz;
    float _582 = _580.x;
    float _584 = _580.y;
    float _586 = _580.z;
    float4 _7282 = float4(_444, _446, _448, float(int(_442)));
    float4 _7284 = select(_7282, float4(0.0), isnan(_7282));
    float3 _588 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _7284.xyz, uint(rint(_7284.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _7284.xyz, uint(rint(_7284.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyz;
    float _590 = _588.x;
    float _592 = _588.y;
    float _594 = _588.z;
    float4 _7302 = float4(_496, _498, _500, float(int(_442)));
    float4 _7304 = select(_7302, float4(0.0), isnan(_7302));
    float3 _596 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _7304.xyz, uint(rint(_7304.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _7304.xyz, uint(rint(_7304.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyz;
    float _598 = _596.x;
    float _600 = _596.y;
    float _602 = _596.z;
    float4 _7322 = float4(_472, _474, _476, float(int(_442)));
    float4 _7324 = select(_7322, float4(0.0), isnan(_7322));
    float3 _604 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _7324.xyz, uint(rint(_7324.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _7324.xyz, uint(rint(_7324.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyz;
    float _606 = _604.x;
    float _608 = _604.y;
    float _610 = _604.z;
    float4 _7342 = float4(_480, _482, _484, float(int(_442)));
    float4 _7344 = select(_7342, float4(0.0), isnan(_7342));
    float3 _612 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _7344.xyz, uint(rint(_7344.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _7344.xyz, uint(rint(_7344.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyz;
    float _614 = _612.x;
    float _616 = _612.y;
    float _618 = _612.z;
    float4 _7362 = float4(_512, _514, _516, float(int(_442)));
    float4 _7364 = select(_7362, float4(0.0), isnan(_7362));
    float3 _620 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _7364.xyz, uint(rint(_7364.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _7364.xyz, uint(rint(_7364.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyz;
    float _622 = _620.x;
    float _624 = _620.y;
    float _626 = _620.z;
    float4 _7382 = float4(_518, _520, _522, float(int(_442)));
    float4 _7384 = select(_7382, float4(0.0), isnan(_7382));
    float3 _628 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _7384.xyz, uint(rint(_7384.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _7384.xyz, uint(rint(_7384.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyz;
    float _630 = _628.x;
    float _632 = _628.y;
    float _634 = _628.z;
    float4 _7402 = float4(_454, _456, _458, float(int(_442)));
    float4 _7404 = select(_7402, float4(0.0), isnan(_7402));
    float3 _636 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _7404.xyz, uint(rint(_7404.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _7404.xyz, uint(rint(_7404.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyz;
    float _638 = _636.x;
    float _640 = _636.y;
    float _642 = _636.z;
    float _644 = _508 + _528;
    float _646 = _506 + _526;
    float _648 = _510 + _530;
    float _650 = _536 + _644;
    float _652 = _534 + _646;
    float _654 = _538 + _648;
    float _656 = _544 + _650;
    float _658 = _542 + _652;
    float _660 = _546 + _654;
    float _662 = _552 + _656;
    float _664 = _550 + _658;
    float _666 = _554 + _660;
    float _668 = _560 + _662;
    float _670 = _558 + _664;
    float _672 = _562 + _666;
    float _674 = _568 + _668;
    float _676 = _566 + _670;
    float _678 = _570 + _672;
    float _680 = _576 + _674;
    float _682 = _574 + _676;
    float _684 = _578 + _678;
    float _686 = _584 + _680;
    float _688 = _582 + _682;
    float _690 = _586 + _684;
    float _692 = _592 + _686;
    float _694 = _590 + _688;
    float _696 = _594 + _690;
    float _698 = _600 + _692;
    float _700 = _598 + _694;
    float _702 = _602 + _696;
    float _704 = _608 + _698;
    float _706 = _606 + _700;
    float _708 = _610 + _702;
    float _710 = _616 + _704;
    float _712 = _614 + _706;
    float _714 = _618 + _708;
    float _716 = _624 + _710;
    float _718 = _622 + _712;
    float _720 = _626 + _714;
    float _722 = _632 + _716;
    float _724 = _630 + _718;
    float _726 = _634 + _720;
    float _728 = _640 + _722;
    float _730 = _638 + _724;
    float _732 = _642 + _726;
    float _734 = fma(_728, -0.0625, _528);
    float _736 = fma(_730, -0.0625, _526);
    float _738 = fma(_732, -0.0625, _530);
    float _740 = fma(_728, -0.0625, _508);
    float _742 = fma(_730, -0.0625, _506);
    float _744 = _736 * _734;
    float _746 = _736 * _736;
    float _748 = fma(_732, -0.0625, _510);
    float _750 = _734 * _734;
    float _752 = _734 * _738;
    float _754 = _736 * _738;
    float _756 = fma(_742, _740, _744);
    float _758 = fma(_740, _740, _750);
    float _760 = fma(_740, _748, _752);
    float _762 = fma(_742, _742, _746);
    float _764 = fma(_742, _748, _754);
    float _766 = _738 * _738;
    float _768 = fma(_728, -0.0625, _536);
    float _770 = fma(_730, -0.0625, _534);
    float _772 = fma(_732, -0.0625, _538);
    float _774 = fma(_748, _748, _766);
    float _776 = fma(_768, _768, _758);
    float _778 = fma(_770, _768, _756);
    float _780 = fma(_768, _772, _760);
    float _782 = fma(_770, _770, _762);
    float _784 = fma(_770, _772, _764);
    float _786 = fma(_728, -0.0625, _544);
    float _788 = fma(_730, -0.0625, _542);
    float _790 = fma(_732, -0.0625, _546);
    float _792 = fma(_772, _772, _774);
    float _794 = fma(_786, _786, _776);
    float _796 = fma(_788, _786, _778);
    float _798 = fma(_786, _790, _780);
    float _800 = fma(_788, _788, _782);
    float _802 = fma(_788, _790, _784);
    float _804 = fma(_728, -0.0625, _552);
    float _806 = fma(_730, -0.0625, _550);
    float _808 = fma(_732, -0.0625, _554);
    float _810 = fma(_790, _790, _792);
    float _812 = fma(_804, _804, _794);
    float _814 = fma(_806, _804, _796);
    float _816 = fma(_804, _808, _798);
    float _818 = fma(_806, _806, _800);
    float _820 = fma(_806, _808, _802);
    float _822 = fma(_728, -0.0625, _560);
    float _824 = fma(_730, -0.0625, _558);
    float _826 = fma(_732, -0.0625, _562);
    float _828 = fma(_808, _808, _810);
    float _830 = fma(_822, _822, _812);
    float _832 = fma(_824, _822, _814);
    float _834 = fma(_822, _826, _816);
    float _836 = fma(_824, _824, _818);
    float _838 = fma(_824, _826, _820);
    float _840 = fma(_728, -0.0625, _568);
    float _842 = fma(_730, -0.0625, _566);
    float _844 = fma(_732, -0.0625, _570);
    float _846 = fma(_826, _826, _828);
    float _848 = fma(_840, _840, _830);
    float _850 = fma(_842, _840, _832);
    float _852 = fma(_840, _844, _834);
    float _854 = fma(_842, _842, _836);
    float _856 = fma(_842, _844, _838);
    float _858 = fma(_728, -0.0625, _576);
    float _860 = fma(_730, -0.0625, _574);
    float _862 = fma(_732, -0.0625, _578);
    float _864 = fma(_844, _844, _846);
    float _866 = fma(_858, _858, _848);
    float _868 = fma(_860, _858, _850);
    float _870 = fma(_858, _862, _852);
    float _872 = fma(_860, _860, _854);
    float _874 = fma(_860, _862, _856);
    float _876 = fma(_728, -0.0625, _584);
    float _878 = fma(_730, -0.0625, _582);
    float _880 = fma(_732, -0.0625, _586);
    float _882 = fma(_862, _862, _864);
    float _884 = fma(_876, _876, _866);
    float _886 = fma(_878, _876, _868);
    float _888 = fma(_876, _880, _870);
    float _890 = fma(_878, _878, _872);
    float _892 = fma(_878, _880, _874);
    float _894 = fma(_728, -0.0625, _592);
    float _896 = fma(_730, -0.0625, _590);
    float _898 = fma(_732, -0.0625, _594);
    float _900 = fma(_880, _880, _882);
    float _902 = fma(_894, _894, _884);
    float _904 = fma(_896, _894, _886);
    float _906 = fma(_894, _898, _888);
    float _908 = fma(_896, _896, _890);
    float _910 = fma(_896, _898, _892);
    float _912 = fma(_728, -0.0625, _600);
    float _914 = fma(_730, -0.0625, _598);
    float _916 = fma(_732, -0.0625, _602);
    float _918 = fma(_898, _898, _900);
    float _920 = fma(_912, _912, _902);
    float _922 = fma(_914, _912, _904);
    float _924 = fma(_912, _916, _906);
    float _926 = fma(_914, _914, _908);
    float _928 = fma(_914, _916, _910);
    float _930 = fma(_728, -0.0625, _608);
    float _932 = fma(_730, -0.0625, _606);
    float _934 = fma(_732, -0.0625, _610);
    float _936 = fma(_916, _916, _918);
    float _938 = fma(_930, _930, _920);
    float _940 = fma(_932, _930, _922);
    float _942 = fma(_930, _934, _924);
    float _944 = fma(_932, _932, _926);
    float _946 = fma(_932, _934, _928);
    float _948 = fma(_728, -0.0625, _616);
    float _950 = fma(_730, -0.0625, _614);
    float _952 = fma(_732, -0.0625, _618);
    float _954 = fma(_934, _934, _936);
    float _956 = fma(_948, _948, _938);
    float _958 = fma(_950, _948, _940);
    float _960 = fma(_948, _952, _942);
    float _962 = fma(_950, _950, _944);
    float _964 = fma(_950, _952, _946);
    float _966 = fma(_728, -0.0625, _624);
    float _968 = fma(_730, -0.0625, _622);
    float _970 = fma(_732, -0.0625, _626);
    float _972 = fma(_952, _952, _954);
    float _974 = fma(_966, _966, _956);
    float _976 = fma(_968, _966, _958);
    float _978 = fma(_966, _970, _960);
    float _980 = fma(_968, _968, _962);
    float _982 = fma(_968, _970, _964);
    float _984 = fma(_728, -0.0625, _632);
    float _986 = fma(_730, -0.0625, _630);
    float _988 = fma(_732, -0.0625, _634);
    float _990 = fma(_728, -0.0625, _640);
    float _992 = fma(_984, _984, _974);
    float _994 = fma(_986, _984, _976);
    float _996 = fma(_730, -0.0625, _638);
    float _998 = fma(_984, _988, _978);
    float _1000 = fma(_732, -0.0625, _642);
    float _1002 = fma(_986, _986, _980);
    float _1004 = fma(_990, _990, _992);
    float _1006 = fma(_996, _990, _994);
    float _1008 = fma(_970, _970, _972);
    float _1010 = fma(_986, _988, _982);
    float _1012 = fma(_990, _1000, _998);
    float _1014 = fma(_996, _996, _1002);
    float _1016 = _1004 + _1006;
    float _1018 = fma(_988, _988, _1008);
    float _1020 = fma(_996, _1000, _1010);
    float _1022 = _1014 + _1006;
    float _1024 = _1012 + _1016;
    float _1026 = fma(_1000, _1000, _1018);
    float _1028 = _1012 + _1020;
    float _1030 = _1020 + _1022;
    float _1032 = _1024 * _1024;
    float _1034 = _1026 + _1028;
    float _1036 = fma(_1030, _1030, _1032);
    float _1038 = fma(_1034, _1034, _1036);
    float _1040 = rsqrt(_1038);
    float _1042 = _1024 * _1040;
    float _1044 = _1030 * _1040;
    float _1046 = _1034 * _1040;
    float _1048 = _1004 * _1042;
    float _1050 = _1006 * _1042;
    float _1052 = fma(_1006, _1044, _1048);
    float _1054 = _1012 * _1042;
    float _1056 = fma(_1014, _1044, _1050);
    float _1058 = fma(_1012, _1046, _1052);
    float _1060 = fma(_1020, _1044, _1054);
    float _1062 = fma(_1020, _1046, _1056);
    float _1064 = _1058 * _1058;
    float _1066 = fma(_1026, _1046, _1060);
    float _1068 = fma(_1062, _1062, _1064);
    float _1070 = fma(_1066, _1066, _1068);
    float _1072 = rsqrt(_1070);
    float _1074 = _1058 * _1072;
    float _1076 = _1062 * _1072;
    float _1078 = _1066 * _1072;
    float _1080 = _1004 * _1074;
    float _1082 = _1006 * _1074;
    float _1084 = _1012 * _1074;
    float _1086 = fma(_1006, _1076, _1080);
    float _1088 = fma(_1014, _1076, _1082);
    float _1090 = fma(_1020, _1076, _1084);
    float _1092 = fma(_1012, _1078, _1086);
    float _1094 = fma(_1020, _1078, _1088);
    float _1096 = fma(_1026, _1078, _1090);
    float _1098 = _1092 * _1092;
    float _1100 = fma(_1094, _1094, _1098);
    float _1102 = fma(_1096, _1096, _1100);
    float _1104 = rsqrt(_1102);
    float _1106 = _1092 * _1104;
    float _1108 = _1094 * _1104;
    float _1110 = _1096 * _1104;
    float _1112 = _1004 * _1106;
    float _1114 = _1006 * _1106;
    float _1116 = _1012 * _1106;
    float _1118 = fma(_1006, _1108, _1112);
    float _1120 = fma(_1014, _1108, _1114);
    float _1122 = fma(_1020, _1108, _1116);
    float _1124 = fma(_1012, _1110, _1118);
    float _1126 = fma(_1020, _1110, _1120);
    float _1128 = fma(_1026, _1110, _1122);
    float _1130 = _1124 * _1124;
    float _1132 = fma(_1126, _1126, _1130);
    float _1134 = fma(_1128, _1128, _1132);
    float _1136 = rsqrt(_1134);
    float _1138 = _1124 * _1136;
    float _1140 = _1126 * _1136;
    float _1142 = _1128 * _1136;
    float _1144 = _1004 * _1138;
    float _1146 = _1006 * _1138;
    float _1148 = _1012 * _1138;
    float _1150 = fma(_1006, _1140, _1144);
    float _1152 = fma(_1014, _1140, _1146);
    float _1154 = fma(_1020, _1140, _1148);
    float _1156 = fma(_1012, _1142, _1150);
    float _1158 = fma(_1020, _1142, _1152);
    float _1160 = fma(_1026, _1142, _1154);
    float _1162 = _1156 * _1156;
    float _1164 = fma(_1158, _1158, _1162);
    float _1166 = fma(_1160, _1160, _1164);
    float _1168 = rsqrt(_1166);
    float _1170 = _1156 * _1168;
    float _1172 = _1158 * _1168;
    float _1174 = _1160 * _1168;
    float _1176 = _1004 * _1170;
    float _1178 = _1006 * _1170;
    float _1180 = _1012 * _1170;
    float _1182 = fma(_1006, _1172, _1176);
    float _1184 = fma(_1014, _1172, _1178);
    float _1186 = fma(_1020, _1172, _1180);
    float _1188 = fma(_1012, _1174, _1182);
    float _1190 = fma(_1020, _1174, _1184);
    float _1192 = fma(_1026, _1174, _1186);
    float _1194 = _1188 * _1188;
    float _1196 = fma(_1190, _1190, _1194);
    float _1198 = fma(_1192, _1192, _1196);
    float _1200 = rsqrt(_1198);
    float _1202 = _1188 * _1200;
    float _1204 = _1190 * _1200;
    float _1206 = _1192 * _1200;
    float _1208 = _1004 * _1202;
    float _1210 = _1006 * _1202;
    float _1212 = _1012 * _1202;
    float _1214 = fma(_1006, _1204, _1208);
    float _1216 = fma(_1014, _1204, _1210);
    float _1218 = fma(_1020, _1204, _1212);
    float _1220 = fma(_1012, _1206, _1214);
    float _1222 = fma(_1020, _1206, _1216);
    float _1224 = fma(_1026, _1206, _1218);
    float _1226 = _1220 * _1220;
    float _1228 = fma(_1222, _1222, _1226);
    float _1230 = fma(_1224, _1224, _1228);
    float _1232 = rsqrt(_1230);
    float _1234 = _1220 * _1232;
    float _1236 = _1222 * _1232;
    float _1238 = _1224 * _1232;
    float _1240 = _1004 * _1234;
    float _1242 = _1006 * _1234;
    float _1244 = fma(_1006, _1236, _1240);
    float _1246 = _1012 * _1234;
    float _1248 = fma(_1014, _1236, _1242);
    float _1250 = fma(_1012, _1238, _1244);
    float _1252 = fma(_1020, _1236, _1246);
    float _1254 = fma(_1020, _1238, _1248);
    float _1256 = _1250 * _1250;
    float _1258 = fma(_1026, _1238, _1252);
    float _1260 = fma(_1254, _1254, _1256);
    float _1262 = fma(_1258, _1258, _1260);
    float _1264 = rsqrt(_1262);
    float _1266 = _1250 * _1264;
    float _1268 = _1254 * _1264;
    float _1270 = _1258 * _1264;
    float _1272 = _508 * _1266;
    float _1274 = _528 * _1266;
    float _1276 = _536 * _1266;
    float _1278 = fma(_506, _1268, _1272);
    float _1280 = fma(_526, _1268, _1274);
    float _1282 = fma(_534, _1268, _1276);
    float _1284 = fma(_510, _1270, _1278);
    float _1286 = fma(_530, _1270, _1280);
    float _1288 = fma(_538, _1270, _1282);
    bool _1292 = _1284 >= _1286;
    bool _1294 = isnan(_1284);
    bool _1296 = _1292 || _1294;
    bool _1298 = isnan(_1286);
    bool _1300 = _1296 || _1298;
    float _1302 = _998;
    float _1304 = _1280;
    float _1306 = _1276;
    float _1308 = _1230;
    float _1310 = _1282;
    float _1312 = _1274;
    float _1314 = _1224;
    float _1316 = _1208;
    float _1318 = _1286;
    float _1320 = _1234;
    float _1322 = _1288;
    float _1324 = _1288;
    float _1326 = _1266;
    float _1328 = _1268;
    float _1330 = _253;
    float _1332 = _289;
    if (!_1300)
    {
        _1302 = _526;
    }
    float _1334 = _1302;
    float _1336 = _1334;
    float _1338 = _1334;
    if (!_1300)
    {
        _1304 = _528;
    }
    float _1340 = _1304;
    float _1342 = _1340;
    float _1344 = _1340;
    if (!_1300)
    {
        _1306 = _530;
    }
    float _1346 = _1306;
    float _1348 = _1346;
    float _1350 = _1346;
    if (!_1300)
    {
        _1308 = _1284;
    }
    float _1352 = _1308;
    float _1354 = _1352;
    float _1356 = _1352;
    if (!_1300)
    {
        _1310 = _1286;
    }
    float _1358 = _1310;
    float _1360 = _1358;
    float _1362 = _1358;
    if (!_1300)
    {
        _1312 = _506;
    }
    float _1364 = _1312;
    float _1366 = _1364;
    float _1368 = _1364;
    if (!_1300)
    {
        _1314 = _508;
    }
    float _1370 = _1314;
    float _1372 = _1370;
    float _1374 = _1370;
    if (!_1300)
    {
        _1316 = _510;
    }
    float _1376 = _1316;
    bool _1378 = !_1300;
    float _1380 = _1376;
    float _1382 = _1376;
    if (!_1378)
    {
        bool _1384 = _1284 > _1286;
        if (!_1384)
        {
            _1354 = _1284;
        }
        float _1386 = _1354;
        float _1388 = _1386;
        if (!_1384)
        {
            _1360 = _1284;
        }
        float _1390 = _1360;
        float _1392 = _1390;
        if (!_1384)
        {
            _1366 = _506;
        }
        float _1394 = _1366;
        float _1396 = _1394;
        if (!_1384)
        {
            _1372 = _508;
        }
        float _1398 = _1372;
        float _1400 = _1398;
        if (!_1384)
        {
            _1380 = _510;
        }
        float _1402 = _1380;
        float _1404 = _1402;
        if (!_1384)
        {
            _1336 = _506;
        }
        float _1406 = _1336;
        float _1408 = _1406;
        if (!_1384)
        {
            _1342 = _508;
        }
        float _1410 = _1342;
        float _1412 = _1410;
        if (!_1384)
        {
            _1348 = _510;
        }
        float _1414 = _1348;
        _1350 = _1414;
        if (_1384)
        {
            _1388 = _1286;
        }
        float _1416 = _1388;
        _1356 = _1416;
        if (_1384)
        {
            _1392 = _1284;
        }
        float _1418 = _1392;
        _1362 = _1418;
        if (_1384)
        {
            _1396 = _526;
        }
        float _1420 = _1396;
        _1368 = _1420;
        if (_1384)
        {
            _1400 = _528;
        }
        float _1422 = _1400;
        _1374 = _1422;
        if (_1384)
        {
            _1404 = _530;
        }
        float _1424 = _1404;
        _1382 = _1424;
        if (_1384)
        {
            _1408 = _506;
        }
        float _1426 = _1408;
        _1338 = _1426;
        if (_1384)
        {
            _1412 = _508;
        }
        float _1428 = _1412;
        _1344 = _1428;
        if (_1384)
        {
            _1350 = _510;
        }
    }
    float _1430 = _1362;
    float _1432 = _1356;
    float _1434 = _1338;
    float _1436 = _1344;
    float _1438 = _1350;
    float _1440 = _1368;
    float _1442 = _1374;
    float _1444 = _1382;
    bool _1446 = _1430 >= _1288;
    bool _1448 = isnan(_1430);
    bool _1450 = _1446 || _1448;
    bool _1452 = isnan(_1288);
    bool _1454 = _1450 || _1452;
    float _1456 = _544 * _1266;
    float _1458 = fma(_542, _1268, _1456);
    float _1460 = fma(_546, _1270, _1458);
    float _1462 = _1458;
    float _1464 = _1432;
    float _1466 = _1440;
    float _1468 = _1442;
    float _1470 = _1432;
    float _1472 = _1440;
    float _1474 = _1442;
    float _1476 = _1444;
    float _1478 = _1436;
    float _1480 = _1460;
    float _1482 = _1460;
    if (!_1454)
    {
        _1462 = _534;
    }
    float _1484 = _1462;
    float _1486 = _1484;
    float _1488 = _1484;
    if (!_1454)
    {
        _1318 = _536;
    }
    float _1490 = _1318;
    float _1492 = _1490;
    float _1494 = _1490;
    if (!_1454)
    {
        _1320 = _538;
    }
    float _1496 = _1320;
    bool _1498 = !_1454;
    float _1500 = _1496;
    float _1502 = _1496;
    if (!_1498)
    {
        bool _1504 = _1432 > _1288;
        if (_1504)
        {
            _1464 = _1288;
        }
        float _1506 = _1464;
        _1470 = _1506;
        if (!_1504)
        {
            _1486 = _1434;
        }
        float _1508 = _1486;
        float _1510 = _1508;
        if (!_1504)
        {
            _1492 = _1436;
        }
        float _1512 = _1492;
        float _1514 = _1512;
        if (!_1504)
        {
            _1500 = _1438;
        }
        float _1516 = _1500;
        float _1518 = _1516;
        if (!_1504)
        {
            _1322 = _1430;
        }
        float _1520 = _1322;
        float _1522 = _1520;
        if (_1504)
        {
            _1510 = _1434;
        }
        float _1524 = _1510;
        _1488 = _1524;
        if (_1504)
        {
            _1514 = _1436;
        }
        float _1526 = _1514;
        _1494 = _1526;
        if (_1504)
        {
            _1518 = _1438;
        }
        float _1528 = _1518;
        _1502 = _1528;
        if (_1504)
        {
            _1522 = _1430;
        }
        float _1530 = _1522;
        _1324 = _1530;
        if (_1504)
        {
            _1466 = _534;
        }
        float _1532 = _1466;
        _1472 = _1532;
        if (_1504)
        {
            _1468 = _536;
        }
        float _1534 = _1468;
        _1474 = _1534;
        if (_1504)
        {
            _1476 = _538;
        }
    }
    float _1536 = _1324;
    float _1538 = _1470;
    float _1540 = _1488;
    float _1542 = _1494;
    float _1544 = _1502;
    float _1546 = _1472;
    float _1548 = _1474;
    float _1550 = _1476;
    bool _1552 = _1536 >= _1460;
    bool _1554 = isnan(_1536);
    bool _1556 = _1552 || _1554;
    bool _1558 = isnan(_1460);
    bool _1560 = _1556 || _1558;
    float _1562 = _552 * _1266;
    float _1564 = fma(_550, _1268, _1562);
    float _1566 = fma(_554, _1270, _1564);
    float _1568 = _1564;
    float _1570 = _1562;
    float _1572 = _1538;
    float _1574 = _1546;
    float _1576 = _1548;
    float _1578 = _1538;
    float _1580 = _1546;
    float _1582 = _1548;
    float _1584 = _1550;
    float _1586 = _1542;
    float _1588 = _1544;
    float _1590 = _1566;
    float _1592 = _1566;
    if (!_1560)
    {
        _1568 = _542;
    }
    float _1594 = _1568;
    float _1596 = _1594;
    float _1598 = _1594;
    if (!_1560)
    {
        _1570 = _544;
    }
    float _1600 = _1570;
    float _1602 = _1600;
    float _1604 = _1600;
    if (!_1560)
    {
        _1478 = _546;
    }
    float _1606 = _1478;
    bool _1608 = !_1560;
    float _1610 = _1606;
    float _1612 = _1606;
    if (!_1608)
    {
        bool _1614 = _1538 > _1460;
        if (_1614)
        {
            _1572 = _1460;
        }
        float _1616 = _1572;
        _1578 = _1616;
        if (!_1614)
        {
            _1596 = _1540;
        }
        float _1618 = _1596;
        float _1620 = _1618;
        if (!_1614)
        {
            _1602 = _1542;
        }
        float _1622 = _1602;
        float _1624 = _1622;
        if (!_1614)
        {
            _1610 = _1544;
        }
        float _1626 = _1610;
        float _1628 = _1626;
        if (!_1614)
        {
            _1480 = _1536;
        }
        float _1630 = _1480;
        float _1632 = _1630;
        if (_1614)
        {
            _1620 = _1540;
        }
        float _1634 = _1620;
        _1598 = _1634;
        if (_1614)
        {
            _1624 = _1542;
        }
        float _1636 = _1624;
        _1604 = _1636;
        if (_1614)
        {
            _1628 = _1544;
        }
        float _1638 = _1628;
        _1612 = _1638;
        if (_1614)
        {
            _1632 = _1536;
        }
        float _1640 = _1632;
        _1482 = _1640;
        if (_1614)
        {
            _1574 = _542;
        }
        float _1642 = _1574;
        _1580 = _1642;
        if (_1614)
        {
            _1576 = _544;
        }
        float _1644 = _1576;
        _1582 = _1644;
        if (_1614)
        {
            _1584 = _546;
        }
    }
    float _1646 = _1482;
    float _1648 = _1578;
    float _1650 = _1598;
    float _1652 = _1604;
    float _1654 = _1612;
    float _1656 = _1580;
    float _1658 = _1582;
    float _1660 = _1584;
    bool _1662 = _1646 >= _1566;
    bool _1664 = isnan(_1646);
    bool _1666 = _1662 || _1664;
    bool _1668 = isnan(_1566);
    bool _1670 = _1666 || _1668;
    float _1672 = _560 * _1266;
    float _1674 = fma(_558, _1268, _1672);
    float _1676 = fma(_562, _1270, _1674);
    float _1678 = _1674;
    float _1680 = _1648;
    float _1682 = _1656;
    float _1684 = _1658;
    float _1686 = _1648;
    float _1688 = _1656;
    float _1690 = _1658;
    float _1692 = _1660;
    float _1694 = _1654;
    float _1696 = _1676;
    float _1698 = _1676;
    float _1700 = _1646;
    if (!_1670)
    {
        _1678 = _550;
    }
    float _1702 = _1678;
    float _1704 = _1702;
    float _1706 = _1702;
    if (!_1670)
    {
        _1586 = _552;
    }
    float _1708 = _1586;
    float _1710 = _1708;
    float _1712 = _1708;
    if (!_1670)
    {
        _1588 = _554;
    }
    float _1714 = _1588;
    bool _1716 = !_1670;
    float _1718 = _1714;
    float _1720 = _1714;
    if (!_1716)
    {
        bool _1722 = _1648 > _1566;
        if (_1722)
        {
            _1680 = _1566;
        }
        float _1724 = _1680;
        _1686 = _1724;
        if (!_1722)
        {
            _1704 = _1650;
        }
        float _1726 = _1704;
        float _1728 = _1726;
        if (!_1722)
        {
            _1710 = _1652;
        }
        float _1730 = _1710;
        float _1732 = _1730;
        if (!_1722)
        {
            _1718 = _1654;
        }
        float _1734 = _1718;
        float _1736 = _1734;
        if (!_1722)
        {
            _1590 = _1646;
        }
        float _1738 = _1590;
        float _1740 = _1738;
        if (_1722)
        {
            _1728 = _1650;
        }
        float _1742 = _1728;
        _1706 = _1742;
        if (_1722)
        {
            _1732 = _1652;
        }
        float _1744 = _1732;
        _1712 = _1744;
        if (_1722)
        {
            _1736 = _1654;
        }
        float _1746 = _1736;
        _1720 = _1746;
        if (_1722)
        {
            _1740 = _1646;
        }
        float _1748 = _1740;
        _1592 = _1748;
        if (_1722)
        {
            _1682 = _550;
        }
        float _1750 = _1682;
        _1688 = _1750;
        if (_1722)
        {
            _1684 = _552;
        }
        float _1752 = _1684;
        _1690 = _1752;
        if (_1722)
        {
            _1692 = _554;
        }
    }
    float _1754 = _1592;
    float _1756 = _1686;
    float _1758 = _1706;
    float _1760 = _1712;
    float _1762 = _1720;
    float _1764 = _1688;
    float _1766 = _1690;
    float _1768 = _1692;
    bool _1770 = _1754 >= _1676;
    bool _1772 = isnan(_1754);
    bool _1774 = _1770 || _1772;
    bool _1776 = isnan(_1676);
    bool _1778 = _1774 || _1776;
    float _1780 = _568 * _1266;
    float _1782 = fma(_566, _1268, _1780);
    float _1784 = fma(_570, _1270, _1782);
    float _1786 = _1782;
    float _1788 = _1780;
    float _1790 = _1756;
    float _1792 = _1764;
    float _1794 = _1766;
    float _1796 = _1756;
    float _1798 = _1764;
    float _1800 = _1766;
    float _1802 = _1768;
    float _1804 = _1762;
    float _1806 = _1754;
    float _1808 = _1784;
    float _1810 = _1784;
    if (!_1778)
    {
        _1786 = _558;
    }
    float _1812 = _1786;
    float _1814 = _1812;
    float _1816 = _1812;
    if (!_1778)
    {
        _1788 = _560;
    }
    float _1818 = _1788;
    float _1820 = _1818;
    float _1822 = _1818;
    if (!_1778)
    {
        _1694 = _562;
    }
    float _1824 = _1694;
    bool _1826 = !_1778;
    float _1828 = _1824;
    float _1830 = _1824;
    if (!_1826)
    {
        bool _1832 = _1756 > _1676;
        if (_1832)
        {
            _1790 = _1676;
        }
        float _1834 = _1790;
        _1796 = _1834;
        if (!_1832)
        {
            _1814 = _1758;
        }
        float _1836 = _1814;
        float _1838 = _1836;
        if (!_1832)
        {
            _1820 = _1760;
        }
        float _1840 = _1820;
        float _1842 = _1840;
        if (!_1832)
        {
            _1828 = _1762;
        }
        float _1844 = _1828;
        float _1846 = _1844;
        if (!_1832)
        {
            _1696 = _1754;
        }
        float _1848 = _1696;
        float _1850 = _1848;
        if (_1832)
        {
            _1838 = _1758;
        }
        float _1852 = _1838;
        _1816 = _1852;
        if (_1832)
        {
            _1842 = _1760;
        }
        float _1854 = _1842;
        _1822 = _1854;
        if (_1832)
        {
            _1846 = _1762;
        }
        float _1856 = _1846;
        _1830 = _1856;
        if (_1832)
        {
            _1850 = _1754;
        }
        float _1858 = _1850;
        _1698 = _1858;
        if (_1832)
        {
            _1792 = _558;
        }
        float _1860 = _1792;
        _1798 = _1860;
        if (_1832)
        {
            _1794 = _560;
        }
        float _1862 = _1794;
        _1800 = _1862;
        if (_1832)
        {
            _1802 = _562;
        }
    }
    float _1864 = _1698;
    float _1866 = _1796;
    float _1868 = _1816;
    float _1870 = _1822;
    float _1872 = _1830;
    float _1874 = _1798;
    float _1876 = _1800;
    float _1878 = _1802;
    bool _1880 = _1864 >= _1784;
    bool _1882 = isnan(_1864);
    bool _1884 = _1880 || _1882;
    bool _1886 = isnan(_1784);
    bool _1888 = _1884 || _1886;
    float _1890 = _576 * _1266;
    float _1892 = fma(_574, _1268, _1890);
    float _1894 = fma(_578, _1270, _1892);
    float _1896 = _1866;
    float _1898 = _1874;
    float _1900 = _1876;
    float _1902 = _1866;
    float _1904 = _1874;
    float _1906 = _1876;
    float _1908 = _1878;
    float _1910 = _1872;
    float _1912 = _1894;
    float _1914 = _1894;
    if (!_1888)
    {
        _1804 = _566;
    }
    float _1916 = _1804;
    float _1918 = _1916;
    float _1920 = _1916;
    if (!_1888)
    {
        _1806 = _568;
    }
    float _1922 = _1806;
    float _1924 = _1922;
    float _1926 = _1922;
    if (!_1888)
    {
        _1700 = _570;
    }
    float _1928 = _1700;
    bool _1930 = !_1888;
    float _1932 = _1928;
    float _1934 = _1928;
    if (!_1930)
    {
        bool _1936 = _1866 > _1784;
        if (_1936)
        {
            _1896 = _1784;
        }
        float _1938 = _1896;
        _1902 = _1938;
        if (!_1936)
        {
            _1918 = _1868;
        }
        float _1940 = _1918;
        float _1942 = _1940;
        if (!_1936)
        {
            _1924 = _1870;
        }
        float _1944 = _1924;
        float _1946 = _1944;
        if (!_1936)
        {
            _1932 = _1872;
        }
        float _1948 = _1932;
        float _1950 = _1948;
        if (!_1936)
        {
            _1808 = _1864;
        }
        float _1952 = _1808;
        float _1954 = _1952;
        if (_1936)
        {
            _1942 = _1868;
        }
        float _1956 = _1942;
        _1920 = _1956;
        if (_1936)
        {
            _1946 = _1870;
        }
        float _1958 = _1946;
        _1926 = _1958;
        if (_1936)
        {
            _1950 = _1872;
        }
        float _1960 = _1950;
        _1934 = _1960;
        if (_1936)
        {
            _1954 = _1864;
        }
        float _1962 = _1954;
        _1810 = _1962;
        if (_1936)
        {
            _1898 = _566;
        }
        float _1964 = _1898;
        _1904 = _1964;
        if (_1936)
        {
            _1900 = _568;
        }
        float _1966 = _1900;
        _1906 = _1966;
        if (_1936)
        {
            _1908 = _570;
        }
    }
    float _1968 = _1810;
    float _1970 = _1902;
    float _1972 = _1920;
    float _1974 = _1926;
    float _1976 = _1934;
    float _1978 = _1904;
    float _1980 = _1906;
    float _1982 = _1908;
    bool _1984 = _1968 >= _1894;
    bool _1986 = isnan(_1968);
    bool _1988 = _1984 || _1986;
    bool _1990 = isnan(_1894);
    bool _1992 = _1988 || _1990;
    float _1994 = _584 * _1266;
    float _1996 = fma(_582, _1268, _1994);
    float _1998 = fma(_586, _1270, _1996);
    float _2000 = _1996;
    float _2002 = _1994;
    float _2004 = _1970;
    float _2006 = _1978;
    float _2008 = _1980;
    float _2010 = _1970;
    float _2012 = _1978;
    float _2014 = _1980;
    float _2016 = _1982;
    float _2018 = _1976;
    float _2020 = _1972;
    float _2022 = _1998;
    float _2024 = _1998;
    if (!_1992)
    {
        _2000 = _574;
    }
    float _2026 = _2000;
    float _2028 = _2026;
    float _2030 = _2026;
    if (!_1992)
    {
        _2002 = _576;
    }
    float _2032 = _2002;
    float _2034 = _2032;
    float _2036 = _2032;
    if (!_1992)
    {
        _1910 = _578;
    }
    float _2038 = _1910;
    bool _2040 = !_1992;
    float _2042 = _2038;
    float _2044 = _2038;
    if (!_2040)
    {
        bool _2046 = _1970 > _1894;
        if (_2046)
        {
            _2004 = _1894;
        }
        float _2048 = _2004;
        _2010 = _2048;
        if (!_2046)
        {
            _2028 = _1972;
        }
        float _2050 = _2028;
        float _2052 = _2050;
        if (!_2046)
        {
            _2034 = _1974;
        }
        float _2054 = _2034;
        float _2056 = _2054;
        if (!_2046)
        {
            _2042 = _1976;
        }
        float _2058 = _2042;
        float _2060 = _2058;
        if (!_2046)
        {
            _1912 = _1968;
        }
        float _2062 = _1912;
        float _2064 = _2062;
        if (_2046)
        {
            _2052 = _1972;
        }
        float _2066 = _2052;
        _2030 = _2066;
        if (_2046)
        {
            _2056 = _1974;
        }
        float _2068 = _2056;
        _2036 = _2068;
        if (_2046)
        {
            _2060 = _1976;
        }
        float _2070 = _2060;
        _2044 = _2070;
        if (_2046)
        {
            _2064 = _1968;
        }
        float _2072 = _2064;
        _1914 = _2072;
        if (_2046)
        {
            _2006 = _574;
        }
        float _2074 = _2006;
        _2012 = _2074;
        if (_2046)
        {
            _2008 = _576;
        }
        float _2076 = _2008;
        _2014 = _2076;
        if (_2046)
        {
            _2016 = _578;
        }
    }
    float _2078 = _1914;
    float _2080 = _2010;
    float _2082 = _2030;
    float _2084 = _2036;
    float _2086 = _2044;
    float _2088 = _2012;
    float _2090 = _2014;
    float _2092 = _2016;
    bool _2094 = _2078 >= _1998;
    bool _2096 = isnan(_2078);
    bool _2098 = _2094 || _2096;
    bool _2100 = isnan(_1998);
    bool _2102 = _2098 || _2100;
    float _2104 = _592 * _1266;
    float _2106 = fma(_590, _1268, _2104);
    float _2108 = fma(_594, _1270, _2106);
    float _2110 = _2106;
    float _2112 = _2080;
    float _2114 = _2088;
    float _2116 = _2090;
    float _2118 = _2080;
    float _2120 = _2088;
    float _2122 = _2090;
    float _2124 = _2092;
    float _2126 = _2086;
    float _2128 = _2108;
    float _2130 = _2108;
    float _2132 = _2078;
    if (!_2102)
    {
        _2018 = _582;
    }
    float _2134 = _2018;
    float _2136 = _2134;
    float _2138 = _2134;
    if (!_2102)
    {
        _2110 = _584;
    }
    float _2140 = _2110;
    float _2142 = _2140;
    float _2144 = _2140;
    if (!_2102)
    {
        _2020 = _586;
    }
    float _2146 = _2020;
    bool _2148 = !_2102;
    float _2150 = _2146;
    float _2152 = _2146;
    if (!_2148)
    {
        bool _2154 = _2080 > _1998;
        if (_2154)
        {
            _2112 = _1998;
        }
        float _2156 = _2112;
        _2118 = _2156;
        if (!_2154)
        {
            _2136 = _2082;
        }
        float _2158 = _2136;
        float _2160 = _2158;
        if (!_2154)
        {
            _2142 = _2084;
        }
        float _2162 = _2142;
        float _2164 = _2162;
        if (!_2154)
        {
            _2150 = _2086;
        }
        float _2166 = _2150;
        float _2168 = _2166;
        if (!_2154)
        {
            _2022 = _2078;
        }
        float _2170 = _2022;
        float _2172 = _2170;
        if (_2154)
        {
            _2160 = _2082;
        }
        float _2174 = _2160;
        _2138 = _2174;
        if (_2154)
        {
            _2164 = _2084;
        }
        float _2176 = _2164;
        _2144 = _2176;
        if (_2154)
        {
            _2168 = _2086;
        }
        float _2178 = _2168;
        _2152 = _2178;
        if (_2154)
        {
            _2172 = _2078;
        }
        float _2180 = _2172;
        _2024 = _2180;
        if (_2154)
        {
            _2114 = _582;
        }
        float _2182 = _2114;
        _2120 = _2182;
        if (_2154)
        {
            _2116 = _584;
        }
        float _2184 = _2116;
        _2122 = _2184;
        if (_2154)
        {
            _2124 = _586;
        }
    }
    float _2186 = _2024;
    float _2188 = _2118;
    float _2190 = _2138;
    float _2192 = _2144;
    float _2194 = _2152;
    float _2196 = _2120;
    float _2198 = _2122;
    float _2200 = _2124;
    bool _2202 = _2186 >= _2108;
    bool _2204 = isnan(_2186);
    bool _2206 = _2202 || _2204;
    bool _2208 = isnan(_2108);
    bool _2210 = _2206 || _2208;
    float _2212 = _600 * _1266;
    float _2214 = fma(_598, _1268, _2212);
    float _2216 = fma(_602, _1270, _2214);
    float _2218 = _2212;
    float _2220 = _2214;
    float _2222 = _2188;
    float _2224 = _2196;
    float _2226 = _2198;
    float _2228 = _2188;
    float _2230 = _2196;
    float _2232 = _2198;
    float _2234 = _2200;
    float _2236 = _2194;
    float _2238 = _2216;
    float _2240 = _2216;
    if (!_2210)
    {
        _2126 = _590;
    }
    float _2242 = _2126;
    float _2244 = _2242;
    float _2246 = _2242;
    if (!_2210)
    {
        _2218 = _592;
    }
    float _2248 = _2218;
    float _2250 = _2248;
    float _2252 = _2248;
    if (!_2210)
    {
        _2220 = _594;
    }
    float _2254 = _2220;
    bool _2256 = !_2210;
    float _2258 = _2254;
    float _2260 = _2254;
    if (!_2256)
    {
        bool _2262 = _2188 > _2108;
        if (_2262)
        {
            _2222 = _2108;
        }
        float _2264 = _2222;
        _2228 = _2264;
        if (!_2262)
        {
            _2244 = _2190;
        }
        float _2266 = _2244;
        float _2268 = _2266;
        if (!_2262)
        {
            _2250 = _2192;
        }
        float _2270 = _2250;
        float _2272 = _2270;
        if (!_2262)
        {
            _2258 = _2194;
        }
        float _2274 = _2258;
        float _2276 = _2274;
        if (!_2262)
        {
            _2128 = _2186;
        }
        float _2278 = _2128;
        float _2280 = _2278;
        if (_2262)
        {
            _2268 = _2190;
        }
        float _2282 = _2268;
        _2246 = _2282;
        if (_2262)
        {
            _2272 = _2192;
        }
        float _2284 = _2272;
        _2252 = _2284;
        if (_2262)
        {
            _2276 = _2194;
        }
        float _2286 = _2276;
        _2260 = _2286;
        if (_2262)
        {
            _2280 = _2186;
        }
        float _2288 = _2280;
        _2130 = _2288;
        if (_2262)
        {
            _2224 = _590;
        }
        float _2290 = _2224;
        _2230 = _2290;
        if (_2262)
        {
            _2226 = _592;
        }
        float _2292 = _2226;
        _2232 = _2292;
        if (_2262)
        {
            _2234 = _594;
        }
    }
    float _2294 = _2130;
    float _2296 = _2228;
    float _2298 = _2246;
    float _2300 = _2252;
    float _2302 = _2260;
    float _2304 = _2230;
    float _2306 = _2232;
    float _2308 = _2234;
    bool _2310 = _2294 >= _2216;
    bool _2312 = isnan(_2294);
    bool _2314 = _2310 || _2312;
    bool _2316 = isnan(_2216);
    bool _2318 = _2314 || _2316;
    float _2320 = _608 * _1266;
    float _2322 = fma(_606, _1268, _2320);
    float _2324 = fma(_610, _1270, _2322);
    float _2326 = _2322;
    float _2328 = _2296;
    float _2330 = _2304;
    float _2332 = _2306;
    float _2334 = _2296;
    float _2336 = _2304;
    float _2338 = _2306;
    float _2340 = _2308;
    float _2342 = _2298;
    float _2344 = _2302;
    float _2346 = _2324;
    float _2348 = _2324;
    if (!_2318)
    {
        _2236 = _598;
    }
    float _2350 = _2236;
    float _2352 = _2350;
    float _2354 = _2350;
    if (!_2318)
    {
        _2132 = _600;
    }
    float _2356 = _2132;
    float _2358 = _2356;
    float _2360 = _2356;
    if (!_2318)
    {
        _2326 = _602;
    }
    float _2362 = _2326;
    bool _2364 = !_2318;
    float _2366 = _2362;
    float _2368 = _2362;
    if (!_2364)
    {
        bool _2370 = _2296 > _2216;
        if (_2370)
        {
            _2328 = _2216;
        }
        float _2372 = _2328;
        _2334 = _2372;
        if (!_2370)
        {
            _2352 = _2298;
        }
        float _2374 = _2352;
        float _2376 = _2374;
        if (!_2370)
        {
            _2358 = _2300;
        }
        float _2378 = _2358;
        float _2380 = _2378;
        if (!_2370)
        {
            _2366 = _2302;
        }
        float _2382 = _2366;
        float _2384 = _2382;
        if (!_2370)
        {
            _2238 = _2294;
        }
        float _2386 = _2238;
        float _2388 = _2386;
        if (_2370)
        {
            _2376 = _2298;
        }
        float _2390 = _2376;
        _2354 = _2390;
        if (_2370)
        {
            _2380 = _2300;
        }
        float _2392 = _2380;
        _2360 = _2392;
        if (_2370)
        {
            _2384 = _2302;
        }
        float _2394 = _2384;
        _2368 = _2394;
        if (_2370)
        {
            _2388 = _2294;
        }
        float _2396 = _2388;
        _2240 = _2396;
        if (_2370)
        {
            _2330 = _598;
        }
        float _2398 = _2330;
        _2336 = _2398;
        if (_2370)
        {
            _2332 = _600;
        }
        float _2400 = _2332;
        _2338 = _2400;
        if (_2370)
        {
            _2340 = _602;
        }
    }
    float _2402 = _2240;
    float _2404 = _2334;
    float _2406 = _2354;
    float _2408 = _2360;
    float _2410 = _2368;
    float _2412 = _2336;
    float _2414 = _2338;
    float _2416 = _2340;
    bool _2418 = _2402 >= _2324;
    bool _2420 = isnan(_2402);
    bool _2422 = _2418 || _2420;
    bool _2424 = isnan(_2324);
    bool _2426 = _2422 || _2424;
    float _2428 = _616 * _1266;
    float _2430 = fma(_614, _1268, _2428);
    float _2432 = fma(_618, _1270, _2430);
    float _2434 = _2430;
    float _2436 = _2404;
    float _2438 = _2412;
    float _2440 = _2414;
    float _2442 = _2404;
    float _2444 = _2412;
    float _2446 = _2414;
    float _2448 = _2416;
    float _2450 = _2406;
    float _2452 = _2408;
    float _2454 = _2432;
    float _2456 = _2432;
    if (!_2426)
    {
        _2342 = _606;
    }
    float _2458 = _2342;
    float _2460 = _2458;
    float _2462 = _2458;
    if (!_2426)
    {
        _2434 = _608;
    }
    float _2464 = _2434;
    float _2466 = _2464;
    float _2468 = _2464;
    if (!_2426)
    {
        _2344 = _610;
    }
    float _2470 = _2344;
    bool _2472 = !_2426;
    float _2474 = _2470;
    float _2476 = _2470;
    if (!_2472)
    {
        bool _2478 = _2404 > _2324;
        if (_2478)
        {
            _2436 = _2324;
        }
        float _2480 = _2436;
        _2442 = _2480;
        if (!_2478)
        {
            _2460 = _2406;
        }
        float _2482 = _2460;
        float _2484 = _2482;
        if (!_2478)
        {
            _2466 = _2408;
        }
        float _2486 = _2466;
        float _2488 = _2486;
        if (!_2478)
        {
            _2474 = _2410;
        }
        float _2490 = _2474;
        float _2492 = _2490;
        if (!_2478)
        {
            _2346 = _2402;
        }
        float _2494 = _2346;
        float _2496 = _2494;
        if (_2478)
        {
            _2484 = _2406;
        }
        float _2498 = _2484;
        _2462 = _2498;
        if (_2478)
        {
            _2488 = _2408;
        }
        float _2500 = _2488;
        _2468 = _2500;
        if (_2478)
        {
            _2492 = _2410;
        }
        float _2502 = _2492;
        _2476 = _2502;
        if (_2478)
        {
            _2496 = _2402;
        }
        float _2504 = _2496;
        _2348 = _2504;
        if (_2478)
        {
            _2438 = _606;
        }
        float _2506 = _2438;
        _2444 = _2506;
        if (_2478)
        {
            _2440 = _608;
        }
        float _2508 = _2440;
        _2446 = _2508;
        if (_2478)
        {
            _2448 = _610;
        }
    }
    float _2510 = _2348;
    float _2512 = _2442;
    float _2514 = _2462;
    float _2516 = _2468;
    float _2518 = _2476;
    float _2520 = _2444;
    float _2522 = _2446;
    float _2524 = _2448;
    bool _2526 = _2510 >= _2432;
    bool _2528 = isnan(_2510);
    bool _2530 = _2526 || _2528;
    bool _2532 = isnan(_2432);
    bool _2534 = _2530 || _2532;
    float _2536 = _624 * _1266;
    float _2538 = fma(_622, _1268, _2536);
    float _2540 = fma(_626, _1270, _2538);
    float _2542 = _2536;
    float _2544 = _2512;
    float _2546 = _2520;
    float _2548 = _2522;
    float _2550 = _2512;
    float _2552 = _2520;
    float _2554 = _2522;
    float _2556 = _2524;
    float _2558 = _2514;
    float _2560 = _2518;
    float _2562 = _2540;
    float _2564 = _2540;
    if (!_2534)
    {
        _2450 = _614;
    }
    float _2566 = _2450;
    float _2568 = _2566;
    float _2570 = _2566;
    if (!_2534)
    {
        _2452 = _616;
    }
    float _2572 = _2452;
    float _2574 = _2572;
    float _2576 = _2572;
    if (!_2534)
    {
        _2542 = _618;
    }
    float _2578 = _2542;
    bool _2580 = !_2534;
    float _2582 = _2578;
    float _2584 = _2578;
    if (!_2580)
    {
        bool _2586 = _2512 > _2432;
        if (_2586)
        {
            _2544 = _2432;
        }
        float _2588 = _2544;
        _2550 = _2588;
        if (!_2586)
        {
            _2568 = _2514;
        }
        float _2590 = _2568;
        float _2592 = _2590;
        if (!_2586)
        {
            _2574 = _2516;
        }
        float _2594 = _2574;
        float _2596 = _2594;
        if (!_2586)
        {
            _2582 = _2518;
        }
        float _2598 = _2582;
        float _2600 = _2598;
        if (!_2586)
        {
            _2454 = _2510;
        }
        float _2602 = _2454;
        float _2604 = _2602;
        if (_2586)
        {
            _2592 = _2514;
        }
        float _2606 = _2592;
        _2570 = _2606;
        if (_2586)
        {
            _2596 = _2516;
        }
        float _2608 = _2596;
        _2576 = _2608;
        if (_2586)
        {
            _2600 = _2518;
        }
        float _2610 = _2600;
        _2584 = _2610;
        if (_2586)
        {
            _2604 = _2510;
        }
        float _2612 = _2604;
        _2456 = _2612;
        if (_2586)
        {
            _2546 = _614;
        }
        float _2614 = _2546;
        _2552 = _2614;
        if (_2586)
        {
            _2548 = _616;
        }
        float _2616 = _2548;
        _2554 = _2616;
        if (_2586)
        {
            _2556 = _618;
        }
    }
    float _2618 = _2456;
    float _2620 = _2550;
    float _2622 = _2570;
    float _2624 = _2576;
    float _2626 = _2584;
    float _2628 = _2552;
    float _2630 = _2554;
    float _2632 = _2556;
    bool _2634 = _2618 >= _2540;
    bool _2636 = isnan(_2618);
    bool _2638 = _2634 || _2636;
    bool _2640 = isnan(_2540);
    bool _2642 = _2638 || _2640;
    float _2644 = _632 * _1266;
    float _2646 = fma(_630, _1268, _2644);
    float _2648 = fma(_634, _1270, _2646);
    float _2650 = _2646;
    float _2652 = _2620;
    float _2654 = _2628;
    float _2656 = _2630;
    float _2658 = _2628;
    float _2660 = _2620;
    float _2662 = _2630;
    float _2664 = _2632;
    float _2666 = _2624;
    float _2668 = _2648;
    float _2670 = _2648;
    if (!_2642)
    {
        _2558 = _622;
    }
    float _2672 = _2558;
    float _2674 = _2672;
    float _2676 = _2672;
    if (!_2642)
    {
        _2650 = _624;
    }
    float _2678 = _2650;
    float _2680 = _2678;
    float _2682 = _2678;
    if (!_2642)
    {
        _2560 = _626;
    }
    float _2684 = _2560;
    bool _2686 = !_2642;
    float _2688 = _2684;
    float _2690 = _2684;
    if (!_2686)
    {
        bool _2692 = _2620 > _2540;
        if (_2692)
        {
            _2652 = _2540;
        }
        float _2694 = _2652;
        _2660 = _2694;
        if (!_2692)
        {
            _2674 = _2622;
        }
        float _2696 = _2674;
        float _2698 = _2696;
        if (!_2692)
        {
            _2680 = _2624;
        }
        float _2700 = _2680;
        float _2702 = _2700;
        if (!_2692)
        {
            _2688 = _2626;
        }
        float _2704 = _2688;
        float _2706 = _2704;
        if (!_2692)
        {
            _2562 = _2618;
        }
        float _2708 = _2562;
        float _2710 = _2708;
        if (_2692)
        {
            _2698 = _2622;
        }
        float _2712 = _2698;
        _2676 = _2712;
        if (_2692)
        {
            _2702 = _2624;
        }
        float _2714 = _2702;
        _2682 = _2714;
        if (_2692)
        {
            _2706 = _2626;
        }
        float _2716 = _2706;
        _2690 = _2716;
        if (_2692)
        {
            _2710 = _2618;
        }
        float _2718 = _2710;
        _2564 = _2718;
        if (_2692)
        {
            _2654 = _622;
        }
        float _2720 = _2654;
        _2658 = _2720;
        if (_2692)
        {
            _2656 = _624;
        }
        float _2722 = _2656;
        _2662 = _2722;
        if (_2692)
        {
            _2664 = _626;
        }
    }
    float _2724 = _2564;
    float _2726 = _2658;
    float _2728 = _2660;
    float _2730 = _2676;
    float _2732 = _2682;
    float _2734 = _2690;
    float _2736 = _2662;
    float _2738 = _2664;
    bool _2740 = _2724 >= _2648;
    bool _2742 = isnan(_2724);
    bool _2744 = _2740 || _2742;
    bool _2746 = isnan(_2648);
    bool _2748 = _2744 || _2746;
    float _2750 = _640 * _1266;
    float _2752 = fma(_638, _1268, _2750);
    float _2754 = fma(_642, _1270, _2752);
    float _2756 = _2752;
    float _2758 = _2728;
    float _2760 = _2736;
    float _2762 = _2736;
    float _2764 = _2738;
    float _2766 = _2728;
    float _2768 = _2730;
    float _2770 = _2732;
    if (!_2748)
    {
        _2756 = _2726;
    }
    float _2772 = _2756;
    float _2774 = _2772;
    float _2776 = _2772;
    if (!_2748)
    {
        _1326 = _630;
    }
    float _2778 = _1326;
    float _2780 = _2778;
    float _2782 = _2778;
    if (!_2748)
    {
        _1328 = _632;
    }
    float _2784 = _1328;
    float _2786 = _2784;
    float _2788 = _2784;
    if (!_2748)
    {
        _2666 = _634;
    }
    float _2790 = _2666;
    bool _2792 = !_2748;
    float _2794 = _2790;
    float _2796 = _2790;
    if (!_2792)
    {
        bool _2798 = _2728 > _2648;
        if (_2798)
        {
            _2758 = _2648;
        }
        float _2800 = _2758;
        _2766 = _2800;
        if (!_2798)
        {
            _2780 = _2730;
        }
        float _2802 = _2780;
        float _2804 = _2802;
        if (!_2798)
        {
            _2786 = _2732;
        }
        float _2806 = _2786;
        float _2808 = _2806;
        if (!_2798)
        {
            _2794 = _2734;
        }
        float _2810 = _2794;
        float _2812 = _2810;
        if (!_2798)
        {
            _2668 = _2724;
        }
        float _2814 = _2668;
        float _2816 = _2814;
        if (!_2798)
        {
            _2774 = _2726;
        }
        float _2818 = _2774;
        float _2820 = _2818;
        if (_2798)
        {
            _2804 = _2730;
        }
        float _2822 = _2804;
        _2782 = _2822;
        if (_2798)
        {
            _2808 = _2732;
        }
        float _2824 = _2808;
        _2788 = _2824;
        if (_2798)
        {
            _2812 = _2734;
        }
        float _2826 = _2812;
        _2796 = _2826;
        if (_2798)
        {
            _2816 = _2724;
        }
        float _2828 = _2816;
        _2670 = _2828;
        if (_2798)
        {
            _2820 = _630;
        }
        float _2830 = _2820;
        _2776 = _2830;
        if (_2798)
        {
            _2760 = _632;
        }
        float _2832 = _2760;
        _2762 = _2832;
        if (_2798)
        {
            _2764 = _634;
        }
    }
    float _2834 = _2670;
    float _2836 = _2762;
    float _2838 = _2764;
    float _2840 = _2766;
    float _2842 = _2782;
    float _2844 = _2788;
    float _2846 = _2796;
    float _2848 = _2776;
    bool _2850 = _2834 >= _2754;
    bool _2852 = isnan(_2834);
    bool _2854 = _2850 || _2852;
    bool _2856 = isnan(_2754);
    bool _2858 = _2854 || _2856;
    float _2860 = _2848;
    float _2862 = _2848;
    if (!_2858)
    {
        _2768 = _2836;
    }
    float _2864 = _2768;
    float _2866 = _2864;
    float _2868 = _2864;
    if (!_2858)
    {
        _2770 = _2838;
    }
    float _2870 = _2770;
    float _2872 = _2870;
    float _2874 = _2870;
    if (!_2858)
    {
        _1330 = _638;
    }
    float _2876 = _1330;
    float _2878 = 0.0;
    float _2880 = _2876;
    float _2882 = _2876;
    if (!_2858)
    {
        _2878 = _640;
    }
    float _2884 = _2878;
    float _2886 = _2884;
    float _2888 = _2884;
    if (!_2858)
    {
        _1332 = _642;
    }
    float _2890 = _1332;
    bool _2892 = !_2858;
    float _2894 = _2890;
    float _2896 = _2890;
    if (!_2892)
    {
        bool _2898 = _2840 > _2754;
        if (!_2898)
        {
            _2880 = _2842;
        }
        float _2900 = _2880;
        float _2902 = _2900;
        if (!_2898)
        {
            _2886 = _2844;
        }
        float _2904 = _2886;
        float _2906 = _2904;
        if (!_2898)
        {
            _2894 = _2846;
        }
        float _2908 = _2894;
        float _2910 = _2908;
        if (!_2898)
        {
            _2866 = _2836;
        }
        float _2912 = _2866;
        float _2914 = _2912;
        if (!_2898)
        {
            _2872 = _2838;
        }
        float _2916 = _2872;
        _2874 = _2916;
        if (_2898)
        {
            _2902 = _2842;
        }
        float _2918 = _2902;
        _2882 = _2918;
        if (_2898)
        {
            _2906 = _2844;
        }
        float _2920 = _2906;
        _2888 = _2920;
        if (_2898)
        {
            _2910 = _2846;
        }
        float _2922 = _2910;
        _2896 = _2922;
        if (_2898)
        {
            _2860 = _638;
        }
        float _2924 = _2860;
        _2862 = _2924;
        if (_2898)
        {
            _2914 = _640;
        }
        float _2926 = _2914;
        _2868 = _2926;
        if (_2898)
        {
            _2874 = _642;
        }
    }
    float _2928 = _2868;
    float _2930 = _2888;
    float _2932 = _2862;
    float _2934 = _2882;
    float _2936 = _2874;
    float _2938 = _2896;
    float _2940 = -_2928;
    float _2942 = _2930 + _2940;
    float _2944 = -_2932;
    float _2946 = _2934 + _2944;
    float _2948 = -_2936;
    float _2950 = _2938 + _2948;
    float _2952 = _2942 * _2942;
    float _2954 = fma(_2946, _2946, _2952);
    float _2956 = -_2932;
    float _2958 = _506 + _2956;
    float _2960 = fma(_2950, _2950, _2954);
    float _2962 = -_2928;
    float _2964 = _508 + _2962;
    float _2966 = _2942 * _2964;
    float _2968 = 1.0 / _2960;
    float _2970 = -_2936;
    float _2972 = _510 + _2970;
    float _2974 = fma(_2946, _2958, _2966);
    float _2976 = fma(_2950, _2972, _2974);
    float _2978 = _2968 * 3.0;
    float _2980 = _2978 * _2976;
    float _2982 = rint(_2980);
    float _2984 = precise::max(0.0, _2982);
    float _2986 = precise::min(_2984, 3.0);
    float _2988 = trunc(_2986);
    int _2991 = int(_2988);
    bool _2993 = _2991 >= 2;
    bool _2995 = !_2993;
    float _2997 = _2946;
    float _2999 = _2942;
    float _3001 = _2950;
    float _3003 = _2932;
    float _3005 = _2934;
    float _3007 = _2928;
    float _3009 = _2930;
    float _3011 = _2938;
    float _3013 = _2936;
    float _3023;
    float _3025;
    float _3027;
    float _3029;
    float _3031;
    float _3033;
    float _3035;
    float _3037;
    float _3039;
    float _3041;
    float _3043;
    float _3045;
    float _3047;
    float _3049;
    float _3051;
    float _3053;
    if (!_2995)
    {
        bool _3015 = _2991 >= 3;
        bool _3017 = !_3015;
        if (!_3017)
        {
            bool _3019 = _2991 != 3;
            _3021 = _3019;
            if (!_3021)
            {
                _3023 = _506;
                _3025 = _508;
                _3027 = _510;
                _3029 = 1.0;
                _3031 = 0.0;
                _3033 = 0.0;
                _3035 = 0.0;
                _3037 = 0.0;
                _3039 = 0.0;
                _3041 = 0.0;
                _3043 = 0.0;
                _3045 = 0.0;
                _3047 = 0.0;
                _3049 = 0.0;
                _3051 = 0.0;
                _3053 = 0.0;
                _3055 = true;
            }
        }
        else
        {
            _3023 = 0.0;
            _3025 = 0.0;
            _3027 = 0.0;
            _3029 = 0.0;
            _3031 = 0.0;
            _3033 = 0.0;
            _3035 = 0.0;
            _3037 = 0.0;
            _3039 = _506;
            _3041 = _508;
            _3043 = _510;
            _3045 = 1.0;
            _3047 = 0.0;
            _3049 = 0.0;
            _3051 = 0.0;
            _3053 = 0.0;
            _3055 = true;
        }
    }
    if ((!_3055) || _3021)
    {
        bool _3057;
        if (!_3021)
        {
            _3057 = _2991 >= 1;
        }
        if ((!_3057) || _3021)
        {
            bool _3059;
            if (!_3021)
            {
                _3059 = _2991 != 0;
            }
            if ((!_3059) && (!_3021))
            {
                _3023 = 0.0;
                _3025 = 0.0;
                _3027 = 0.0;
                _3029 = 0.0;
                _3031 = _506;
                _3033 = _508;
                _3035 = _510;
                _3037 = 1.0;
                _3039 = 0.0;
                _3041 = 0.0;
                _3043 = 0.0;
                _3045 = 0.0;
                _3047 = 0.0;
                _3049 = 0.0;
                _3051 = 0.0;
                _3053 = 0.0;
                _3055 = true;
            }
            else
            {
                _3021 = false;
                _3023 = 0.0;
                _3025 = 0.0;
                _3027 = 0.0;
                _3029 = 0.0;
                _3031 = 0.0;
                _3033 = 0.0;
                _3035 = 0.0;
                _3037 = 0.0;
                _3039 = 0.0;
                _3041 = 0.0;
                _3043 = 0.0;
                _3045 = 0.0;
                _3047 = 0.0;
                _3049 = 0.0;
                _3051 = 0.0;
                _3053 = 0.0;
                _3055 = true;
            }
        }
        else
        {
            _3023 = 0.0;
            _3025 = 0.0;
            _3027 = 0.0;
            _3029 = 0.0;
            _3031 = 0.0;
            _3033 = 0.0;
            _3035 = 0.0;
            _3037 = 0.0;
            _3039 = 0.0;
            _3041 = 0.0;
            _3043 = 0.0;
            _3045 = 0.0;
            _3047 = _506;
            _3049 = _508;
            _3051 = _510;
            _3053 = 1.0;
        }
    }
    _3055 = false;
    float _3061 = _3023;
    float _3063 = _3025;
    float _3065 = _3027;
    float _3067 = _3029;
    float _3069 = _3031;
    float _3071 = _3033;
    float _3073 = _3035;
    float _3075 = _3037;
    float _3077 = _3039;
    float _3079 = _3041;
    float _3081 = _3043;
    float _3083 = _3045;
    float _3085 = _3047;
    float _3087 = _3049;
    float _3089 = _3051;
    float _3091 = _3053;
    float _3093 = -_2928;
    float _3095 = _528 + _3093;
    float _3097 = -_2932;
    float _3099 = _526 + _3097;
    float _3101 = _2942 * _3095;
    float _3103 = -_2936;
    float _3105 = _530 + _3103;
    float _3107 = fma(_2946, _3099, _3101);
    float _3109 = fma(_2950, _3105, _3107);
    float _3111 = _2978 * _3109;
    float _3113 = rint(_3111);
    float _3115 = precise::max(0.0, _3113);
    float _3117 = precise::min(_3115, 3.0);
    float _3119 = trunc(_3117);
    int _3121 = int(_3119);
    bool _3123 = _3121 >= 2;
    bool _3125 = !_3123;
    float _3127 = as_type<float>(_3121);
    float _3129 = _3113;
    float _3131 = _3107;
    float _3133 = _3101;
    float _3135 = _3061;
    float _3137 = _3063;
    float _3139 = _3065;
    float _3141 = _3067;
    float _3143 = _3077;
    float _3145 = _3079;
    float _3147 = _3081;
    float _3149 = _3083;
    float _3151 = _3085;
    float _3153 = _3087;
    float _3155 = _3089;
    float _3157 = _3091;
    float _3175;
    float _3177;
    float _3179;
    float _3181;
    if (!_3125)
    {
        bool _3159 = _3121 >= 3;
        bool _3161 = !_3159;
        if (!_3161)
        {
            bool _3163 = _3121 != 3;
            _3165 = _3163;
            if (!_3165)
            {
                float _3167 = _526 + _3061;
                float _3169 = _528 + _3063;
                float _3171 = _530 + _3065;
                float _3173 = _3067 + 1.0;
                _3135 = _3167;
                _3137 = _3169;
                _3139 = _3171;
                _3141 = _3173;
                _3175 = _3069;
                _3177 = _3071;
                _3179 = _3073;
                _3181 = _3075;
                _3183 = true;
            }
        }
        else
        {
            float _3185 = _526 + _3077;
            float _3187 = _528 + _3079;
            float _3189 = _530 + _3081;
            float _3191 = _3083 + 1.0;
            _3175 = _3069;
            _3177 = _3071;
            _3179 = _3073;
            _3181 = _3075;
            _3143 = _3185;
            _3145 = _3187;
            _3147 = _3189;
            _3149 = _3191;
            _3183 = true;
        }
    }
    if ((!_3183) || _3165)
    {
        bool _3193;
        if (!_3165)
        {
            _3193 = _3121 >= 1;
        }
        if ((!_3193) || _3165)
        {
            if (!_3165)
            {
                bool _3195 = _3121 != 0;
                if (!_3195)
                {
                    float _3197 = _526 + _3069;
                    _3127 = _3197;
                }
                float _3199 = _3127;
                _3175 = _3199;
                if (!_3195)
                {
                    float _3201 = _528 + _3071;
                    _3129 = _3201;
                }
                float _3203 = _3129;
                _3177 = _3203;
                if (!_3195)
                {
                    float _3205 = _530 + _3073;
                    _3131 = _3205;
                }
                float _3207 = _3131;
                _3179 = _3207;
                if (!_3195)
                {
                    float _3209 = _3075 + 1.0;
                    _3133 = _3209;
                }
                float _3211 = _3133;
                bool _3213 = !_3195;
                _3181 = _3211;
                _3183 = _3213;
            }
            if ((!_3183) || _3165)
            {
                _3165 = false;
                _3175 = _3069;
                _3177 = _3071;
                _3179 = _3073;
                _3181 = _3075;
                _3183 = true;
            }
        }
        else
        {
            float _3215 = _526 + _3085;
            float _3217 = _528 + _3087;
            float _3219 = _530 + _3089;
            float _3221 = _3091 + 1.0;
            _3175 = _3069;
            _3177 = _3071;
            _3179 = _3073;
            _3181 = _3075;
            _3151 = _3215;
            _3153 = _3217;
            _3155 = _3219;
            _3157 = _3221;
        }
    }
    _3183 = false;
    float _3223 = _3135;
    float _3225 = _3137;
    float _3227 = _3139;
    float _3229 = _3141;
    float _3231 = _3175;
    float _3233 = _3177;
    float _3235 = _3179;
    float _3237 = _3181;
    float _3239 = _3143;
    float _3241 = _3145;
    float _3243 = _3147;
    float _3245 = _3149;
    float _3247 = _3151;
    float _3249 = _3153;
    float _3251 = _3155;
    float _3253 = _3157;
    float _3255 = -_2928;
    float _3257 = _536 + _3255;
    float _3259 = -_2932;
    float _3261 = _534 + _3259;
    float _3263 = _2942 * _3257;
    float _3265 = -_2936;
    float _3267 = _538 + _3265;
    float _3269 = fma(_2946, _3261, _3263);
    float _3271 = fma(_2950, _3267, _3269);
    float _3273 = _2978 * _3271;
    float _3275 = rint(_3273);
    float _3277 = precise::max(0.0, _3275);
    float _3279 = precise::min(_3277, 3.0);
    float _3281 = trunc(_3279);
    int _3283 = int(_3281);
    bool _3285 = _3283 >= 2;
    bool _3287 = !_3285;
    float _3289 = as_type<float>(_3283);
    float _3291 = _3275;
    float _3293 = _3269;
    float _3295 = _3263;
    float _3297 = _3223;
    float _3299 = _3225;
    float _3301 = _3227;
    float _3303 = _3229;
    float _3305 = _3239;
    float _3307 = _3241;
    float _3309 = _3243;
    float _3311 = _3245;
    float _3313 = _3247;
    float _3315 = _3249;
    float _3317 = _3251;
    float _3319 = _3253;
    float _3337;
    float _3339;
    float _3341;
    float _3343;
    if (!_3287)
    {
        bool _3321 = _3283 >= 3;
        bool _3323 = !_3321;
        if (!_3323)
        {
            bool _3325 = _3283 != 3;
            _3327 = _3325;
            if (!_3327)
            {
                float _3329 = _534 + _3223;
                float _3331 = _536 + _3225;
                float _3333 = _538 + _3227;
                float _3335 = _3229 + 1.0;
                _3297 = _3329;
                _3299 = _3331;
                _3301 = _3333;
                _3303 = _3335;
                _3337 = _3231;
                _3339 = _3233;
                _3341 = _3235;
                _3343 = _3237;
                _3345 = true;
            }
        }
        else
        {
            float _3347 = _534 + _3239;
            float _3349 = _536 + _3241;
            float _3351 = _538 + _3243;
            float _3353 = _3245 + 1.0;
            _3337 = _3231;
            _3339 = _3233;
            _3341 = _3235;
            _3343 = _3237;
            _3305 = _3347;
            _3307 = _3349;
            _3309 = _3351;
            _3311 = _3353;
            _3345 = true;
        }
    }
    if ((!_3345) || _3327)
    {
        bool _3355;
        if (!_3327)
        {
            _3355 = _3283 >= 1;
        }
        if ((!_3355) || _3327)
        {
            if (!_3327)
            {
                bool _3357 = _3283 != 0;
                if (!_3357)
                {
                    float _3359 = _534 + _3231;
                    _3289 = _3359;
                }
                float _3361 = _3289;
                _3337 = _3361;
                if (!_3357)
                {
                    float _3363 = _536 + _3233;
                    _3291 = _3363;
                }
                float _3365 = _3291;
                _3339 = _3365;
                if (!_3357)
                {
                    float _3367 = _538 + _3235;
                    _3293 = _3367;
                }
                float _3369 = _3293;
                _3341 = _3369;
                if (!_3357)
                {
                    float _3371 = _3237 + 1.0;
                    _3295 = _3371;
                }
                float _3373 = _3295;
                bool _3375 = !_3357;
                _3343 = _3373;
                _3345 = _3375;
            }
            if ((!_3345) || _3327)
            {
                _3327 = false;
                _3337 = _3231;
                _3339 = _3233;
                _3341 = _3235;
                _3343 = _3237;
                _3345 = true;
            }
        }
        else
        {
            float _3377 = _534 + _3247;
            float _3379 = _536 + _3249;
            float _3381 = _538 + _3251;
            float _3383 = _3253 + 1.0;
            _3337 = _3231;
            _3339 = _3233;
            _3341 = _3235;
            _3343 = _3237;
            _3313 = _3377;
            _3315 = _3379;
            _3317 = _3381;
            _3319 = _3383;
        }
    }
    _3345 = false;
    float _3385 = _3297;
    float _3387 = _3299;
    float _3389 = _3301;
    float _3391 = _3303;
    float _3393 = _3337;
    float _3395 = _3339;
    float _3397 = _3341;
    float _3399 = _3343;
    float _3401 = _3305;
    float _3403 = _3307;
    float _3405 = _3309;
    float _3407 = _3311;
    float _3409 = _3313;
    float _3411 = _3315;
    float _3413 = _3317;
    float _3415 = _3319;
    float _3417 = -_2928;
    float _3419 = _544 + _3417;
    float _3421 = -_2932;
    float _3423 = _542 + _3421;
    float _3425 = _2942 * _3419;
    float _3427 = -_2936;
    float _3429 = _546 + _3427;
    float _3431 = fma(_2946, _3423, _3425);
    float _3433 = fma(_2950, _3429, _3431);
    float _3435 = _2978 * _3433;
    float _3437 = rint(_3435);
    float _3439 = precise::max(0.0, _3437);
    float _3441 = precise::min(_3439, 3.0);
    float _3443 = trunc(_3441);
    int _3445 = int(_3443);
    bool _3447 = _3445 >= 2;
    bool _3449 = !_3447;
    float _3451 = as_type<float>(_3445);
    float _3453 = _3437;
    float _3455 = _3431;
    float _3457 = _3425;
    float _3459 = _3385;
    float _3461 = _3387;
    float _3463 = _3389;
    float _3465 = _3391;
    float _3467 = _3401;
    float _3469 = _3403;
    float _3471 = _3405;
    float _3473 = _3407;
    float _3475 = _3409;
    float _3477 = _3411;
    float _3479 = _3413;
    float _3481 = _3415;
    float _3499;
    float _3501;
    float _3503;
    float _3505;
    if (!_3449)
    {
        bool _3483 = _3445 >= 3;
        bool _3485 = !_3483;
        if (!_3485)
        {
            bool _3487 = _3445 != 3;
            _3489 = _3487;
            if (!_3489)
            {
                float _3491 = _542 + _3385;
                float _3493 = _544 + _3387;
                float _3495 = _546 + _3389;
                float _3497 = _3391 + 1.0;
                _3459 = _3491;
                _3461 = _3493;
                _3463 = _3495;
                _3465 = _3497;
                _3499 = _3393;
                _3501 = _3395;
                _3503 = _3397;
                _3505 = _3399;
                _3507 = true;
            }
        }
        else
        {
            float _3509 = _542 + _3401;
            float _3511 = _544 + _3403;
            float _3513 = _546 + _3405;
            float _3515 = _3407 + 1.0;
            _3499 = _3393;
            _3501 = _3395;
            _3503 = _3397;
            _3505 = _3399;
            _3467 = _3509;
            _3469 = _3511;
            _3471 = _3513;
            _3473 = _3515;
            _3507 = true;
        }
    }
    if ((!_3507) || _3489)
    {
        bool _3517;
        if (!_3489)
        {
            _3517 = _3445 >= 1;
        }
        if ((!_3517) || _3489)
        {
            if (!_3489)
            {
                bool _3519 = _3445 != 0;
                if (!_3519)
                {
                    float _3521 = _542 + _3393;
                    _3451 = _3521;
                }
                float _3523 = _3451;
                _3499 = _3523;
                if (!_3519)
                {
                    float _3525 = _544 + _3395;
                    _3453 = _3525;
                }
                float _3527 = _3453;
                _3501 = _3527;
                if (!_3519)
                {
                    float _3529 = _546 + _3397;
                    _3455 = _3529;
                }
                float _3531 = _3455;
                _3503 = _3531;
                if (!_3519)
                {
                    float _3533 = _3399 + 1.0;
                    _3457 = _3533;
                }
                float _3535 = _3457;
                bool _3537 = !_3519;
                _3505 = _3535;
                _3507 = _3537;
            }
            if ((!_3507) || _3489)
            {
                _3489 = false;
                _3499 = _3393;
                _3501 = _3395;
                _3503 = _3397;
                _3505 = _3399;
                _3507 = true;
            }
        }
        else
        {
            float _3539 = _542 + _3409;
            float _3541 = _544 + _3411;
            float _3543 = _546 + _3413;
            float _3545 = _3415 + 1.0;
            _3499 = _3393;
            _3501 = _3395;
            _3503 = _3397;
            _3505 = _3399;
            _3475 = _3539;
            _3477 = _3541;
            _3479 = _3543;
            _3481 = _3545;
        }
    }
    _3507 = false;
    float _3547 = _3459;
    float _3549 = _3461;
    float _3551 = _3463;
    float _3553 = _3465;
    float _3555 = _3499;
    float _3557 = _3501;
    float _3559 = _3503;
    float _3561 = _3505;
    float _3563 = _3467;
    float _3565 = _3469;
    float _3567 = _3471;
    float _3569 = _3473;
    float _3571 = _3475;
    float _3573 = _3477;
    float _3575 = _3479;
    float _3577 = _3481;
    float _3579 = -_2928;
    float _3581 = _552 + _3579;
    float _3583 = -_2932;
    float _3585 = _550 + _3583;
    float _3587 = _2942 * _3581;
    float _3589 = -_2936;
    float _3591 = _554 + _3589;
    float _3593 = fma(_2946, _3585, _3587);
    float _3595 = fma(_2950, _3591, _3593);
    float _3597 = _2978 * _3595;
    float _3599 = rint(_3597);
    float _3601 = precise::max(0.0, _3599);
    float _3603 = precise::min(_3601, 3.0);
    float _3605 = trunc(_3603);
    int _3607 = int(_3605);
    bool _3609 = _3607 >= 2;
    bool _3611 = !_3609;
    float _3613 = as_type<float>(_3607);
    float _3615 = _3599;
    float _3617 = _3593;
    float _3619 = _3587;
    float _3621 = _3547;
    float _3623 = _3549;
    float _3625 = _3551;
    float _3627 = _3553;
    float _3629 = _3563;
    float _3631 = _3565;
    float _3633 = _3567;
    float _3635 = _3569;
    float _3637 = _3571;
    float _3639 = _3573;
    float _3641 = _3575;
    float _3643 = _3577;
    float _3661;
    float _3663;
    float _3665;
    float _3667;
    if (!_3611)
    {
        bool _3645 = _3607 >= 3;
        bool _3647 = !_3645;
        if (!_3647)
        {
            bool _3649 = _3607 != 3;
            _3651 = _3649;
            if (!_3651)
            {
                float _3653 = _550 + _3547;
                float _3655 = _552 + _3549;
                float _3657 = _554 + _3551;
                float _3659 = _3553 + 1.0;
                _3621 = _3653;
                _3623 = _3655;
                _3625 = _3657;
                _3627 = _3659;
                _3661 = _3555;
                _3663 = _3557;
                _3665 = _3559;
                _3667 = _3561;
                _3669 = true;
            }
        }
        else
        {
            float _3671 = _550 + _3563;
            float _3673 = _552 + _3565;
            float _3675 = _554 + _3567;
            float _3677 = _3569 + 1.0;
            _3661 = _3555;
            _3663 = _3557;
            _3665 = _3559;
            _3667 = _3561;
            _3629 = _3671;
            _3631 = _3673;
            _3633 = _3675;
            _3635 = _3677;
            _3669 = true;
        }
    }
    if ((!_3669) || _3651)
    {
        bool _3679;
        if (!_3651)
        {
            _3679 = _3607 >= 1;
        }
        if ((!_3679) || _3651)
        {
            if (!_3651)
            {
                bool _3681 = _3607 != 0;
                if (!_3681)
                {
                    float _3683 = _550 + _3555;
                    _3613 = _3683;
                }
                float _3685 = _3613;
                _3661 = _3685;
                if (!_3681)
                {
                    float _3687 = _552 + _3557;
                    _3615 = _3687;
                }
                float _3689 = _3615;
                _3663 = _3689;
                if (!_3681)
                {
                    float _3691 = _554 + _3559;
                    _3617 = _3691;
                }
                float _3693 = _3617;
                _3665 = _3693;
                if (!_3681)
                {
                    float _3695 = _3561 + 1.0;
                    _3619 = _3695;
                }
                float _3697 = _3619;
                bool _3699 = !_3681;
                _3667 = _3697;
                _3669 = _3699;
            }
            if ((!_3669) || _3651)
            {
                _3651 = false;
                _3661 = _3555;
                _3663 = _3557;
                _3665 = _3559;
                _3667 = _3561;
                _3669 = true;
            }
        }
        else
        {
            float _3701 = _550 + _3571;
            float _3703 = _552 + _3573;
            float _3705 = _554 + _3575;
            float _3707 = _3577 + 1.0;
            _3661 = _3555;
            _3663 = _3557;
            _3665 = _3559;
            _3667 = _3561;
            _3637 = _3701;
            _3639 = _3703;
            _3641 = _3705;
            _3643 = _3707;
        }
    }
    _3669 = false;
    float _3709 = _3621;
    float _3711 = _3623;
    float _3713 = _3625;
    float _3715 = _3627;
    float _3717 = _3661;
    float _3719 = _3663;
    float _3721 = _3665;
    float _3723 = _3667;
    float _3725 = _3629;
    float _3727 = _3631;
    float _3729 = _3633;
    float _3731 = _3635;
    float _3733 = _3637;
    float _3735 = _3639;
    float _3737 = _3641;
    float _3739 = _3643;
    float _3741 = -_2928;
    float _3743 = _560 + _3741;
    float _3745 = -_2932;
    float _3747 = _558 + _3745;
    float _3749 = _2942 * _3743;
    float _3751 = -_2936;
    float _3753 = _562 + _3751;
    float _3755 = fma(_2946, _3747, _3749);
    float _3757 = fma(_2950, _3753, _3755);
    float _3759 = _2978 * _3757;
    float _3761 = rint(_3759);
    float _3763 = precise::max(0.0, _3761);
    float _3765 = precise::min(_3763, 3.0);
    float _3767 = trunc(_3765);
    int _3769 = int(_3767);
    bool _3771 = _3769 >= 2;
    bool _3773 = !_3771;
    float _3775 = as_type<float>(_3769);
    float _3777 = _3761;
    float _3779 = _3755;
    float _3781 = _3749;
    float _3783 = _3709;
    float _3785 = _3711;
    float _3787 = _3713;
    float _3789 = _3715;
    float _3791 = _3725;
    float _3793 = _3727;
    float _3795 = _3729;
    float _3797 = _3731;
    float _3799 = _3733;
    float _3801 = _3735;
    float _3803 = _3737;
    float _3805 = _3739;
    float _3823;
    float _3825;
    float _3827;
    float _3829;
    if (!_3773)
    {
        bool _3807 = _3769 >= 3;
        bool _3809 = !_3807;
        if (!_3809)
        {
            bool _3811 = _3769 != 3;
            _3813 = _3811;
            if (!_3813)
            {
                float _3815 = _558 + _3709;
                float _3817 = _560 + _3711;
                float _3819 = _562 + _3713;
                float _3821 = _3715 + 1.0;
                _3783 = _3815;
                _3785 = _3817;
                _3787 = _3819;
                _3789 = _3821;
                _3823 = _3717;
                _3825 = _3719;
                _3827 = _3721;
                _3829 = _3723;
                _3831 = true;
            }
        }
        else
        {
            float _3833 = _558 + _3725;
            float _3835 = _560 + _3727;
            float _3837 = _562 + _3729;
            float _3839 = _3731 + 1.0;
            _3823 = _3717;
            _3825 = _3719;
            _3827 = _3721;
            _3829 = _3723;
            _3791 = _3833;
            _3793 = _3835;
            _3795 = _3837;
            _3797 = _3839;
            _3831 = true;
        }
    }
    if ((!_3831) || _3813)
    {
        bool _3841;
        if (!_3813)
        {
            _3841 = _3769 >= 1;
        }
        if ((!_3841) || _3813)
        {
            if (!_3813)
            {
                bool _3843 = _3769 != 0;
                if (!_3843)
                {
                    float _3845 = _558 + _3717;
                    _3775 = _3845;
                }
                float _3847 = _3775;
                _3823 = _3847;
                if (!_3843)
                {
                    float _3849 = _560 + _3719;
                    _3777 = _3849;
                }
                float _3851 = _3777;
                _3825 = _3851;
                if (!_3843)
                {
                    float _3853 = _562 + _3721;
                    _3779 = _3853;
                }
                float _3855 = _3779;
                _3827 = _3855;
                if (!_3843)
                {
                    float _3857 = _3723 + 1.0;
                    _3781 = _3857;
                }
                float _3859 = _3781;
                bool _3861 = !_3843;
                _3829 = _3859;
                _3831 = _3861;
            }
            if ((!_3831) || _3813)
            {
                _3813 = false;
                _3823 = _3717;
                _3825 = _3719;
                _3827 = _3721;
                _3829 = _3723;
                _3831 = true;
            }
        }
        else
        {
            float _3863 = _558 + _3733;
            float _3865 = _560 + _3735;
            float _3867 = _562 + _3737;
            float _3869 = _3739 + 1.0;
            _3823 = _3717;
            _3825 = _3719;
            _3827 = _3721;
            _3829 = _3723;
            _3799 = _3863;
            _3801 = _3865;
            _3803 = _3867;
            _3805 = _3869;
        }
    }
    _3831 = false;
    float _3871 = _3783;
    float _3873 = _3785;
    float _3875 = _3787;
    float _3877 = _3789;
    float _3879 = _3823;
    float _3881 = _3825;
    float _3883 = _3827;
    float _3885 = _3829;
    float _3887 = _3791;
    float _3889 = _3793;
    float _3891 = _3795;
    float _3893 = _3797;
    float _3895 = _3799;
    float _3897 = _3801;
    float _3899 = _3803;
    float _3901 = _3805;
    float _3903 = -_2928;
    float _3905 = _568 + _3903;
    float _3907 = -_2932;
    float _3909 = _566 + _3907;
    float _3911 = _2942 * _3905;
    float _3913 = -_2936;
    float _3915 = _570 + _3913;
    float _3917 = fma(_2946, _3909, _3911);
    float _3919 = fma(_2950, _3915, _3917);
    float _3921 = _2978 * _3919;
    float _3923 = rint(_3921);
    float _3925 = precise::max(0.0, _3923);
    float _3927 = precise::min(_3925, 3.0);
    float _3929 = trunc(_3927);
    int _3931 = int(_3929);
    bool _3933 = _3931 >= 2;
    bool _3935 = !_3933;
    float _3937 = as_type<float>(_3931);
    float _3939 = _3923;
    float _3941 = _3917;
    float _3943 = _3911;
    float _3945 = _3871;
    float _3947 = _3873;
    float _3949 = _3875;
    float _3951 = _3877;
    float _3953 = _3887;
    float _3955 = _3889;
    float _3957 = _3891;
    float _3959 = _3893;
    float _3961 = _3895;
    float _3963 = _3897;
    float _3965 = _3899;
    float _3967 = _3901;
    float _3985;
    float _3987;
    float _3989;
    float _3991;
    if (!_3935)
    {
        bool _3969 = _3931 >= 3;
        bool _3971 = !_3969;
        if (!_3971)
        {
            bool _3973 = _3931 != 3;
            _3975 = _3973;
            if (!_3975)
            {
                float _3977 = _566 + _3871;
                float _3979 = _568 + _3873;
                float _3981 = _570 + _3875;
                float _3983 = _3877 + 1.0;
                _3945 = _3977;
                _3947 = _3979;
                _3949 = _3981;
                _3951 = _3983;
                _3985 = _3879;
                _3987 = _3881;
                _3989 = _3883;
                _3991 = _3885;
                _3993 = true;
            }
        }
        else
        {
            float _3995 = _566 + _3887;
            float _3997 = _568 + _3889;
            float _3999 = _570 + _3891;
            float _4001 = _3893 + 1.0;
            _3985 = _3879;
            _3987 = _3881;
            _3989 = _3883;
            _3991 = _3885;
            _3953 = _3995;
            _3955 = _3997;
            _3957 = _3999;
            _3959 = _4001;
            _3993 = true;
        }
    }
    if ((!_3993) || _3975)
    {
        bool _4003;
        if (!_3975)
        {
            _4003 = _3931 >= 1;
        }
        if ((!_4003) || _3975)
        {
            if (!_3975)
            {
                bool _4005 = _3931 != 0;
                if (!_4005)
                {
                    float _4007 = _566 + _3879;
                    _3937 = _4007;
                }
                float _4009 = _3937;
                _3985 = _4009;
                if (!_4005)
                {
                    float _4011 = _568 + _3881;
                    _3939 = _4011;
                }
                float _4013 = _3939;
                _3987 = _4013;
                if (!_4005)
                {
                    float _4015 = _570 + _3883;
                    _3941 = _4015;
                }
                float _4017 = _3941;
                _3989 = _4017;
                if (!_4005)
                {
                    float _4019 = _3885 + 1.0;
                    _3943 = _4019;
                }
                float _4021 = _3943;
                bool _4023 = !_4005;
                _3991 = _4021;
                _3993 = _4023;
            }
            if ((!_3993) || _3975)
            {
                _3975 = false;
                _3985 = _3879;
                _3987 = _3881;
                _3989 = _3883;
                _3991 = _3885;
                _3993 = true;
            }
        }
        else
        {
            float _4025 = _566 + _3895;
            float _4027 = _568 + _3897;
            float _4029 = _570 + _3899;
            float _4031 = _3901 + 1.0;
            _3985 = _3879;
            _3987 = _3881;
            _3989 = _3883;
            _3991 = _3885;
            _3961 = _4025;
            _3963 = _4027;
            _3965 = _4029;
            _3967 = _4031;
        }
    }
    _3993 = false;
    float _4033 = _3945;
    float _4035 = _3947;
    float _4037 = _3949;
    float _4039 = _3951;
    float _4041 = _3985;
    float _4043 = _3987;
    float _4045 = _3989;
    float _4047 = _3991;
    float _4049 = _3953;
    float _4051 = _3955;
    float _4053 = _3957;
    float _4055 = _3959;
    float _4057 = _3961;
    float _4059 = _3963;
    float _4061 = _3965;
    float _4063 = _3967;
    float _4065 = -_2928;
    float _4067 = _576 + _4065;
    float _4069 = -_2932;
    float _4071 = _574 + _4069;
    float _4073 = _2942 * _4067;
    float _4075 = -_2936;
    float _4077 = _578 + _4075;
    float _4079 = fma(_2946, _4071, _4073);
    float _4081 = fma(_2950, _4077, _4079);
    float _4083 = _2978 * _4081;
    float _4085 = rint(_4083);
    float _4087 = precise::max(0.0, _4085);
    float _4089 = precise::min(_4087, 3.0);
    float _4091 = trunc(_4089);
    int _4093 = int(_4091);
    bool _4095 = _4093 >= 2;
    bool _4097 = !_4095;
    float _4099 = as_type<float>(_4093);
    float _4101 = _4085;
    float _4103 = _4079;
    float _4105 = _4073;
    float _4107 = _4033;
    float _4109 = _4035;
    float _4111 = _4037;
    float _4113 = _4039;
    float _4115 = _4049;
    float _4117 = _4051;
    float _4119 = _4053;
    float _4121 = _4055;
    float _4123 = _4057;
    float _4125 = _4059;
    float _4127 = _4061;
    float _4129 = _4063;
    float _4147;
    float _4149;
    float _4151;
    float _4153;
    if (!_4097)
    {
        bool _4131 = _4093 >= 3;
        bool _4133 = !_4131;
        if (!_4133)
        {
            bool _4135 = _4093 != 3;
            _4137 = _4135;
            if (!_4137)
            {
                float _4139 = _574 + _4033;
                float _4141 = _576 + _4035;
                float _4143 = _578 + _4037;
                float _4145 = _4039 + 1.0;
                _4107 = _4139;
                _4109 = _4141;
                _4111 = _4143;
                _4113 = _4145;
                _4147 = _4041;
                _4149 = _4043;
                _4151 = _4045;
                _4153 = _4047;
                _4155 = true;
            }
        }
        else
        {
            float _4157 = _574 + _4049;
            float _4159 = _576 + _4051;
            float _4161 = _578 + _4053;
            float _4163 = _4055 + 1.0;
            _4147 = _4041;
            _4149 = _4043;
            _4151 = _4045;
            _4153 = _4047;
            _4115 = _4157;
            _4117 = _4159;
            _4119 = _4161;
            _4121 = _4163;
            _4155 = true;
        }
    }
    if ((!_4155) || _4137)
    {
        bool _4165;
        if (!_4137)
        {
            _4165 = _4093 >= 1;
        }
        if ((!_4165) || _4137)
        {
            if (!_4137)
            {
                bool _4167 = _4093 != 0;
                if (!_4167)
                {
                    float _4169 = _574 + _4041;
                    _4099 = _4169;
                }
                float _4171 = _4099;
                _4147 = _4171;
                if (!_4167)
                {
                    float _4173 = _576 + _4043;
                    _4101 = _4173;
                }
                float _4175 = _4101;
                _4149 = _4175;
                if (!_4167)
                {
                    float _4177 = _578 + _4045;
                    _4103 = _4177;
                }
                float _4179 = _4103;
                _4151 = _4179;
                if (!_4167)
                {
                    float _4181 = _4047 + 1.0;
                    _4105 = _4181;
                }
                float _4183 = _4105;
                bool _4185 = !_4167;
                _4153 = _4183;
                _4155 = _4185;
            }
            if ((!_4155) || _4137)
            {
                _4137 = false;
                _4147 = _4041;
                _4149 = _4043;
                _4151 = _4045;
                _4153 = _4047;
                _4155 = true;
            }
        }
        else
        {
            float _4187 = _574 + _4057;
            float _4189 = _576 + _4059;
            float _4191 = _578 + _4061;
            float _4193 = _4063 + 1.0;
            _4147 = _4041;
            _4149 = _4043;
            _4151 = _4045;
            _4153 = _4047;
            _4123 = _4187;
            _4125 = _4189;
            _4127 = _4191;
            _4129 = _4193;
        }
    }
    _4155 = false;
    float _4195 = _4107;
    float _4197 = _4109;
    float _4199 = _4111;
    float _4201 = _4113;
    float _4203 = _4147;
    float _4205 = _4149;
    float _4207 = _4151;
    float _4209 = _4153;
    float _4211 = _4115;
    float _4213 = _4117;
    float _4215 = _4119;
    float _4217 = _4121;
    float _4219 = _4123;
    float _4221 = _4125;
    float _4223 = _4127;
    float _4225 = _4129;
    float _4227 = -_2928;
    float _4229 = _584 + _4227;
    float _4231 = -_2932;
    float _4233 = _582 + _4231;
    float _4235 = _2942 * _4229;
    float _4237 = -_2936;
    float _4239 = _586 + _4237;
    float _4241 = fma(_2946, _4233, _4235);
    float _4243 = fma(_2950, _4239, _4241);
    float _4245 = _2978 * _4243;
    float _4247 = rint(_4245);
    float _4249 = precise::max(0.0, _4247);
    float _4251 = precise::min(_4249, 3.0);
    float _4253 = trunc(_4251);
    int _4255 = int(_4253);
    bool _4257 = _4255 >= 2;
    bool _4259 = !_4257;
    float _4261 = as_type<float>(_4255);
    float _4263 = _4247;
    float _4265 = _4241;
    float _4267 = _4235;
    float _4269 = _4195;
    float _4271 = _4197;
    float _4273 = _4199;
    float _4275 = _4201;
    float _4277 = _4211;
    float _4279 = _4213;
    float _4281 = _4215;
    float _4283 = _4217;
    float _4285 = _4219;
    float _4287 = _4221;
    float _4289 = _4223;
    float _4291 = _4225;
    float _4309;
    float _4311;
    float _4313;
    float _4315;
    if (!_4259)
    {
        bool _4293 = _4255 >= 3;
        bool _4295 = !_4293;
        if (!_4295)
        {
            bool _4297 = _4255 != 3;
            _4299 = _4297;
            if (!_4299)
            {
                float _4301 = _582 + _4195;
                float _4303 = _584 + _4197;
                float _4305 = _586 + _4199;
                float _4307 = _4201 + 1.0;
                _4269 = _4301;
                _4271 = _4303;
                _4273 = _4305;
                _4275 = _4307;
                _4309 = _4203;
                _4311 = _4205;
                _4313 = _4207;
                _4315 = _4209;
                _4317 = true;
            }
        }
        else
        {
            float _4319 = _582 + _4211;
            float _4321 = _584 + _4213;
            float _4323 = _586 + _4215;
            float _4325 = _4217 + 1.0;
            _4309 = _4203;
            _4311 = _4205;
            _4313 = _4207;
            _4315 = _4209;
            _4277 = _4319;
            _4279 = _4321;
            _4281 = _4323;
            _4283 = _4325;
            _4317 = true;
        }
    }
    if ((!_4317) || _4299)
    {
        bool _4327;
        if (!_4299)
        {
            _4327 = _4255 >= 1;
        }
        if ((!_4327) || _4299)
        {
            if (!_4299)
            {
                bool _4329 = _4255 != 0;
                if (!_4329)
                {
                    float _4331 = _582 + _4203;
                    _4261 = _4331;
                }
                float _4333 = _4261;
                _4309 = _4333;
                if (!_4329)
                {
                    float _4335 = _584 + _4205;
                    _4263 = _4335;
                }
                float _4337 = _4263;
                _4311 = _4337;
                if (!_4329)
                {
                    float _4339 = _586 + _4207;
                    _4265 = _4339;
                }
                float _4341 = _4265;
                _4313 = _4341;
                if (!_4329)
                {
                    float _4343 = _4209 + 1.0;
                    _4267 = _4343;
                }
                float _4345 = _4267;
                bool _4347 = !_4329;
                _4315 = _4345;
                _4317 = _4347;
            }
            if ((!_4317) || _4299)
            {
                _4299 = false;
                _4309 = _4203;
                _4311 = _4205;
                _4313 = _4207;
                _4315 = _4209;
                _4317 = true;
            }
        }
        else
        {
            float _4349 = _582 + _4219;
            float _4351 = _584 + _4221;
            float _4353 = _586 + _4223;
            float _4355 = _4225 + 1.0;
            _4309 = _4203;
            _4311 = _4205;
            _4313 = _4207;
            _4315 = _4209;
            _4285 = _4349;
            _4287 = _4351;
            _4289 = _4353;
            _4291 = _4355;
        }
    }
    _4317 = false;
    float _4357 = _4269;
    float _4359 = _4271;
    float _4361 = _4273;
    float _4363 = _4275;
    float _4365 = _4309;
    float _4367 = _4311;
    float _4369 = _4313;
    float _4371 = _4315;
    float _4373 = _4277;
    float _4375 = _4279;
    float _4377 = _4281;
    float _4379 = _4283;
    float _4381 = _4285;
    float _4383 = _4287;
    float _4385 = _4289;
    float _4387 = _4291;
    float _4389 = -_2928;
    float _4391 = _592 + _4389;
    float _4393 = -_2932;
    float _4395 = _590 + _4393;
    float _4397 = _2942 * _4391;
    float _4399 = -_2936;
    float _4401 = _594 + _4399;
    float _4403 = fma(_2946, _4395, _4397);
    float _4405 = fma(_2950, _4401, _4403);
    float _4407 = _2978 * _4405;
    float _4409 = rint(_4407);
    float _4411 = precise::max(0.0, _4409);
    float _4413 = precise::min(_4411, 3.0);
    float _4415 = trunc(_4413);
    int _4417 = int(_4415);
    bool _4419 = _4417 >= 2;
    bool _4421 = !_4419;
    float _4423 = as_type<float>(_4417);
    float _4425 = _4409;
    float _4427 = _4403;
    float _4429 = _4397;
    float _4431 = _4357;
    float _4433 = _4359;
    float _4435 = _4361;
    float _4437 = _4363;
    float _4439 = _4373;
    float _4441 = _4375;
    float _4443 = _4377;
    float _4445 = _4379;
    float _4447 = _4381;
    float _4449 = _4383;
    float _4451 = _4385;
    float _4453 = _4387;
    float _4471;
    float _4473;
    float _4475;
    float _4477;
    if (!_4421)
    {
        bool _4455 = _4417 >= 3;
        bool _4457 = !_4455;
        if (!_4457)
        {
            bool _4459 = _4417 != 3;
            _4461 = _4459;
            if (!_4461)
            {
                float _4463 = _590 + _4357;
                float _4465 = _592 + _4359;
                float _4467 = _594 + _4361;
                float _4469 = _4363 + 1.0;
                _4431 = _4463;
                _4433 = _4465;
                _4435 = _4467;
                _4437 = _4469;
                _4471 = _4365;
                _4473 = _4367;
                _4475 = _4369;
                _4477 = _4371;
                _4479 = true;
            }
        }
        else
        {
            float _4481 = _590 + _4373;
            float _4483 = _592 + _4375;
            float _4485 = _594 + _4377;
            float _4487 = _4379 + 1.0;
            _4471 = _4365;
            _4473 = _4367;
            _4475 = _4369;
            _4477 = _4371;
            _4439 = _4481;
            _4441 = _4483;
            _4443 = _4485;
            _4445 = _4487;
            _4479 = true;
        }
    }
    if ((!_4479) || _4461)
    {
        bool _4489;
        if (!_4461)
        {
            _4489 = _4417 >= 1;
        }
        if ((!_4489) || _4461)
        {
            if (!_4461)
            {
                bool _4491 = _4417 != 0;
                if (!_4491)
                {
                    float _4493 = _590 + _4365;
                    _4423 = _4493;
                }
                float _4495 = _4423;
                _4471 = _4495;
                if (!_4491)
                {
                    float _4497 = _592 + _4367;
                    _4425 = _4497;
                }
                float _4499 = _4425;
                _4473 = _4499;
                if (!_4491)
                {
                    float _4501 = _594 + _4369;
                    _4427 = _4501;
                }
                float _4503 = _4427;
                _4475 = _4503;
                if (!_4491)
                {
                    float _4505 = _4371 + 1.0;
                    _4429 = _4505;
                }
                float _4507 = _4429;
                bool _4509 = !_4491;
                _4477 = _4507;
                _4479 = _4509;
            }
            if ((!_4479) || _4461)
            {
                _4461 = false;
                _4471 = _4365;
                _4473 = _4367;
                _4475 = _4369;
                _4477 = _4371;
                _4479 = true;
            }
        }
        else
        {
            float _4511 = _590 + _4381;
            float _4513 = _592 + _4383;
            float _4515 = _594 + _4385;
            float _4517 = _4387 + 1.0;
            _4471 = _4365;
            _4473 = _4367;
            _4475 = _4369;
            _4477 = _4371;
            _4447 = _4511;
            _4449 = _4513;
            _4451 = _4515;
            _4453 = _4517;
        }
    }
    _4479 = false;
    float _4519 = _4431;
    float _4521 = _4433;
    float _4523 = _4435;
    float _4525 = _4437;
    float _4527 = _4471;
    float _4529 = _4473;
    float _4531 = _4475;
    float _4533 = _4477;
    float _4535 = _4439;
    float _4537 = _4441;
    float _4539 = _4443;
    float _4541 = _4445;
    float _4543 = _4447;
    float _4545 = _4449;
    float _4547 = _4451;
    float _4549 = _4453;
    float _4551 = -_2928;
    float _4553 = _600 + _4551;
    float _4555 = -_2932;
    float _4557 = _598 + _4555;
    float _4559 = _2942 * _4553;
    float _4561 = -_2936;
    float _4563 = _602 + _4561;
    float _4565 = fma(_2946, _4557, _4559);
    float _4567 = fma(_2950, _4563, _4565);
    float _4569 = _2978 * _4567;
    float _4571 = rint(_4569);
    float _4573 = precise::max(0.0, _4571);
    float _4575 = precise::min(_4573, 3.0);
    float _4577 = trunc(_4575);
    int _4579 = int(_4577);
    bool _4581 = _4579 >= 2;
    bool _4583 = !_4581;
    float _4585 = as_type<float>(_4579);
    float _4587 = _4571;
    float _4589 = _4565;
    float _4591 = _4559;
    float _4593 = _4519;
    float _4595 = _4521;
    float _4597 = _4523;
    float _4599 = _4525;
    float _4601 = _4535;
    float _4603 = _4537;
    float _4605 = _4539;
    float _4607 = _4541;
    float _4609 = _4543;
    float _4611 = _4545;
    float _4613 = _4547;
    float _4615 = _4549;
    float _4633;
    float _4635;
    float _4637;
    float _4639;
    if (!_4583)
    {
        bool _4617 = _4579 >= 3;
        bool _4619 = !_4617;
        if (!_4619)
        {
            bool _4621 = _4579 != 3;
            _4623 = _4621;
            if (!_4623)
            {
                float _4625 = _598 + _4519;
                float _4627 = _600 + _4521;
                float _4629 = _602 + _4523;
                float _4631 = _4525 + 1.0;
                _4593 = _4625;
                _4595 = _4627;
                _4597 = _4629;
                _4599 = _4631;
                _4633 = _4527;
                _4635 = _4529;
                _4637 = _4531;
                _4639 = _4533;
                _4641 = true;
            }
        }
        else
        {
            float _4643 = _598 + _4535;
            float _4645 = _600 + _4537;
            float _4647 = _602 + _4539;
            float _4649 = _4541 + 1.0;
            _4633 = _4527;
            _4635 = _4529;
            _4637 = _4531;
            _4639 = _4533;
            _4601 = _4643;
            _4603 = _4645;
            _4605 = _4647;
            _4607 = _4649;
            _4641 = true;
        }
    }
    if ((!_4641) || _4623)
    {
        bool _4651;
        if (!_4623)
        {
            _4651 = _4579 >= 1;
        }
        if ((!_4651) || _4623)
        {
            if (!_4623)
            {
                bool _4653 = _4579 != 0;
                if (!_4653)
                {
                    float _4655 = _598 + _4527;
                    _4585 = _4655;
                }
                float _4657 = _4585;
                _4633 = _4657;
                if (!_4653)
                {
                    float _4659 = _600 + _4529;
                    _4587 = _4659;
                }
                float _4661 = _4587;
                _4635 = _4661;
                if (!_4653)
                {
                    float _4663 = _602 + _4531;
                    _4589 = _4663;
                }
                float _4665 = _4589;
                _4637 = _4665;
                if (!_4653)
                {
                    float _4667 = _4533 + 1.0;
                    _4591 = _4667;
                }
                float _4669 = _4591;
                bool _4671 = !_4653;
                _4639 = _4669;
                _4641 = _4671;
            }
            if ((!_4641) || _4623)
            {
                _4623 = false;
                _4633 = _4527;
                _4635 = _4529;
                _4637 = _4531;
                _4639 = _4533;
                _4641 = true;
            }
        }
        else
        {
            float _4673 = _598 + _4543;
            float _4675 = _600 + _4545;
            float _4677 = _602 + _4547;
            float _4679 = _4549 + 1.0;
            _4633 = _4527;
            _4635 = _4529;
            _4637 = _4531;
            _4639 = _4533;
            _4609 = _4673;
            _4611 = _4675;
            _4613 = _4677;
            _4615 = _4679;
        }
    }
    _4641 = false;
    float _4681 = _4593;
    float _4683 = _4595;
    float _4685 = _4597;
    float _4687 = _4599;
    float _4689 = _4633;
    float _4691 = _4635;
    float _4693 = _4637;
    float _4695 = _4639;
    float _4697 = _4601;
    float _4699 = _4603;
    float _4701 = _4605;
    float _4703 = _4607;
    float _4705 = _4609;
    float _4707 = _4611;
    float _4709 = _4613;
    float _4711 = _4615;
    float _4713 = -_2928;
    float _4715 = _608 + _4713;
    float _4717 = -_2932;
    float _4719 = _606 + _4717;
    float _4721 = _2942 * _4715;
    float _4723 = -_2936;
    float _4725 = _610 + _4723;
    float _4727 = fma(_2946, _4719, _4721);
    float _4729 = fma(_2950, _4725, _4727);
    float _4731 = _2978 * _4729;
    float _4733 = rint(_4731);
    float _4735 = precise::max(0.0, _4733);
    float _4737 = precise::min(_4735, 3.0);
    float _4739 = trunc(_4737);
    int _4741 = int(_4739);
    bool _4743 = _4741 >= 2;
    bool _4745 = !_4743;
    float _4747 = as_type<float>(_4741);
    float _4749 = _4733;
    float _4751 = _4727;
    float _4753 = _4721;
    float _4755 = _4681;
    float _4757 = _4683;
    float _4759 = _4685;
    float _4761 = _4687;
    float _4763 = _4697;
    float _4765 = _4699;
    float _4767 = _4701;
    float _4769 = _4703;
    float _4771 = _4705;
    float _4773 = _4707;
    float _4775 = _4709;
    float _4777 = _4711;
    float _4795;
    float _4797;
    float _4799;
    float _4801;
    if (!_4745)
    {
        bool _4779 = _4741 >= 3;
        bool _4781 = !_4779;
        if (!_4781)
        {
            bool _4783 = _4741 != 3;
            _4785 = _4783;
            if (!_4785)
            {
                float _4787 = _606 + _4681;
                float _4789 = _608 + _4683;
                float _4791 = _610 + _4685;
                float _4793 = _4687 + 1.0;
                _4755 = _4787;
                _4757 = _4789;
                _4759 = _4791;
                _4761 = _4793;
                _4795 = _4689;
                _4797 = _4691;
                _4799 = _4693;
                _4801 = _4695;
                _4803 = true;
            }
        }
        else
        {
            float _4805 = _606 + _4697;
            float _4807 = _608 + _4699;
            float _4809 = _610 + _4701;
            float _4811 = _4703 + 1.0;
            _4795 = _4689;
            _4797 = _4691;
            _4799 = _4693;
            _4801 = _4695;
            _4763 = _4805;
            _4765 = _4807;
            _4767 = _4809;
            _4769 = _4811;
            _4803 = true;
        }
    }
    if ((!_4803) || _4785)
    {
        bool _4813;
        if (!_4785)
        {
            _4813 = _4741 >= 1;
        }
        if ((!_4813) || _4785)
        {
            if (!_4785)
            {
                bool _4815 = _4741 != 0;
                if (!_4815)
                {
                    float _4817 = _606 + _4689;
                    _4747 = _4817;
                }
                float _4819 = _4747;
                _4795 = _4819;
                if (!_4815)
                {
                    float _4821 = _608 + _4691;
                    _4749 = _4821;
                }
                float _4823 = _4749;
                _4797 = _4823;
                if (!_4815)
                {
                    float _4825 = _610 + _4693;
                    _4751 = _4825;
                }
                float _4827 = _4751;
                _4799 = _4827;
                if (!_4815)
                {
                    float _4829 = _4695 + 1.0;
                    _4753 = _4829;
                }
                float _4831 = _4753;
                bool _4833 = !_4815;
                _4801 = _4831;
                _4803 = _4833;
            }
            if ((!_4803) || _4785)
            {
                _4785 = false;
                _4795 = _4689;
                _4797 = _4691;
                _4799 = _4693;
                _4801 = _4695;
                _4803 = true;
            }
        }
        else
        {
            float _4835 = _606 + _4705;
            float _4837 = _608 + _4707;
            float _4839 = _610 + _4709;
            float _4841 = _4711 + 1.0;
            _4795 = _4689;
            _4797 = _4691;
            _4799 = _4693;
            _4801 = _4695;
            _4771 = _4835;
            _4773 = _4837;
            _4775 = _4839;
            _4777 = _4841;
        }
    }
    _4803 = false;
    float _4843 = _4755;
    float _4845 = _4757;
    float _4847 = _4759;
    float _4849 = _4761;
    float _4851 = _4795;
    float _4853 = _4797;
    float _4855 = _4799;
    float _4857 = _4801;
    float _4859 = _4763;
    float _4861 = _4765;
    float _4863 = _4767;
    float _4865 = _4769;
    float _4867 = _4771;
    float _4869 = _4773;
    float _4871 = _4775;
    float _4873 = _4777;
    float _4875 = -_2928;
    float _4877 = _616 + _4875;
    float _4879 = -_2932;
    float _4881 = _614 + _4879;
    float _4883 = _2942 * _4877;
    float _4885 = -_2936;
    float _4887 = _618 + _4885;
    float _4889 = fma(_2946, _4881, _4883);
    float _4891 = fma(_2950, _4887, _4889);
    float _4893 = _2978 * _4891;
    float _4895 = rint(_4893);
    float _4897 = precise::max(0.0, _4895);
    float _4899 = precise::min(_4897, 3.0);
    float _4901 = trunc(_4899);
    int _4903 = int(_4901);
    bool _4905 = _4903 >= 2;
    bool _4907 = !_4905;
    float _4909 = as_type<float>(_4903);
    float _4911 = _4895;
    float _4913 = _4889;
    float _4915 = _4883;
    float _4917 = _4843;
    float _4919 = _4845;
    float _4921 = _4847;
    float _4923 = _4849;
    float _4925 = _4859;
    float _4927 = _4861;
    float _4929 = _4863;
    float _4931 = _4865;
    float _4933 = _4867;
    float _4935 = _4869;
    float _4937 = _4871;
    float _4939 = _4873;
    float _4957;
    float _4959;
    float _4961;
    float _4963;
    if (!_4907)
    {
        bool _4941 = _4903 >= 3;
        bool _4943 = !_4941;
        if (!_4943)
        {
            bool _4945 = _4903 != 3;
            _4947 = _4945;
            if (!_4947)
            {
                float _4949 = _614 + _4843;
                float _4951 = _616 + _4845;
                float _4953 = _618 + _4847;
                float _4955 = _4849 + 1.0;
                _4917 = _4949;
                _4919 = _4951;
                _4921 = _4953;
                _4923 = _4955;
                _4957 = _4851;
                _4959 = _4853;
                _4961 = _4855;
                _4963 = _4857;
                _4965 = true;
            }
        }
        else
        {
            float _4967 = _614 + _4859;
            float _4969 = _616 + _4861;
            float _4971 = _618 + _4863;
            float _4973 = _4865 + 1.0;
            _4957 = _4851;
            _4959 = _4853;
            _4961 = _4855;
            _4963 = _4857;
            _4925 = _4967;
            _4927 = _4969;
            _4929 = _4971;
            _4931 = _4973;
            _4965 = true;
        }
    }
    if ((!_4965) || _4947)
    {
        bool _4975;
        if (!_4947)
        {
            _4975 = _4903 >= 1;
        }
        if ((!_4975) || _4947)
        {
            if (!_4947)
            {
                bool _4977 = _4903 != 0;
                if (!_4977)
                {
                    float _4979 = _614 + _4851;
                    _4909 = _4979;
                }
                float _4981 = _4909;
                _4957 = _4981;
                if (!_4977)
                {
                    float _4983 = _616 + _4853;
                    _4911 = _4983;
                }
                float _4985 = _4911;
                _4959 = _4985;
                if (!_4977)
                {
                    float _4987 = _618 + _4855;
                    _4913 = _4987;
                }
                float _4989 = _4913;
                _4961 = _4989;
                if (!_4977)
                {
                    float _4991 = _4857 + 1.0;
                    _4915 = _4991;
                }
                float _4993 = _4915;
                bool _4995 = !_4977;
                _4963 = _4993;
                _4965 = _4995;
            }
            if ((!_4965) || _4947)
            {
                _4947 = false;
                _4957 = _4851;
                _4959 = _4853;
                _4961 = _4855;
                _4963 = _4857;
                _4965 = true;
            }
        }
        else
        {
            float _4997 = _614 + _4867;
            float _4999 = _616 + _4869;
            float _5001 = _618 + _4871;
            float _5003 = _4873 + 1.0;
            _4957 = _4851;
            _4959 = _4853;
            _4961 = _4855;
            _4963 = _4857;
            _4933 = _4997;
            _4935 = _4999;
            _4937 = _5001;
            _4939 = _5003;
        }
    }
    _4965 = false;
    float _5005 = _4917;
    float _5007 = _4919;
    float _5009 = _4921;
    float _5011 = _4923;
    float _5013 = _4957;
    float _5015 = _4959;
    float _5017 = _4961;
    float _5019 = _4963;
    float _5021 = _4925;
    float _5023 = _4927;
    float _5025 = _4929;
    float _5027 = _4931;
    float _5029 = _4933;
    float _5031 = _4935;
    float _5033 = _4937;
    float _5035 = _4939;
    float _5037 = -_2928;
    float _5039 = _624 + _5037;
    float _5041 = -_2932;
    float _5043 = _622 + _5041;
    float _5045 = _2942 * _5039;
    float _5047 = -_2936;
    float _5049 = _626 + _5047;
    float _5051 = fma(_2946, _5043, _5045);
    float _5053 = fma(_2950, _5049, _5051);
    float _5055 = _2978 * _5053;
    float _5057 = rint(_5055);
    float _5059 = precise::max(0.0, _5057);
    float _5061 = precise::min(_5059, 3.0);
    float _5063 = trunc(_5061);
    int _5065 = int(_5063);
    bool _5067 = _5065 >= 2;
    bool _5069 = !_5067;
    float _5071 = as_type<float>(_5065);
    float _5073 = _5057;
    float _5075 = _5051;
    float _5077 = _5045;
    float _5079 = _5005;
    float _5081 = _5007;
    float _5083 = _5009;
    float _5085 = _5011;
    float _5087 = _5021;
    float _5089 = _5023;
    float _5091 = _5025;
    float _5093 = _5027;
    float _5095 = _5029;
    float _5097 = _5031;
    float _5099 = _5033;
    float _5101 = _5035;
    float _5119;
    float _5121;
    float _5123;
    float _5125;
    if (!_5069)
    {
        bool _5103 = _5065 >= 3;
        bool _5105 = !_5103;
        if (!_5105)
        {
            bool _5107 = _5065 != 3;
            _5109 = _5107;
            if (!_5109)
            {
                float _5111 = _622 + _5005;
                float _5113 = _624 + _5007;
                float _5115 = _626 + _5009;
                float _5117 = _5011 + 1.0;
                _5079 = _5111;
                _5081 = _5113;
                _5083 = _5115;
                _5085 = _5117;
                _5119 = _5013;
                _5121 = _5015;
                _5123 = _5017;
                _5125 = _5019;
                _5127 = true;
            }
        }
        else
        {
            float _5129 = _622 + _5021;
            float _5131 = _624 + _5023;
            float _5133 = _626 + _5025;
            float _5135 = _5027 + 1.0;
            _5119 = _5013;
            _5121 = _5015;
            _5123 = _5017;
            _5125 = _5019;
            _5087 = _5129;
            _5089 = _5131;
            _5091 = _5133;
            _5093 = _5135;
            _5127 = true;
        }
    }
    if ((!_5127) || _5109)
    {
        bool _5137;
        if (!_5109)
        {
            _5137 = _5065 >= 1;
        }
        if ((!_5137) || _5109)
        {
            if (!_5109)
            {
                bool _5139 = _5065 != 0;
                if (!_5139)
                {
                    float _5141 = _622 + _5013;
                    _5071 = _5141;
                }
                float _5143 = _5071;
                _5119 = _5143;
                if (!_5139)
                {
                    float _5145 = _624 + _5015;
                    _5073 = _5145;
                }
                float _5147 = _5073;
                _5121 = _5147;
                if (!_5139)
                {
                    float _5149 = _626 + _5017;
                    _5075 = _5149;
                }
                float _5151 = _5075;
                _5123 = _5151;
                if (!_5139)
                {
                    float _5153 = _5019 + 1.0;
                    _5077 = _5153;
                }
                float _5155 = _5077;
                bool _5157 = !_5139;
                _5125 = _5155;
                _5127 = _5157;
            }
            if ((!_5127) || _5109)
            {
                _5109 = false;
                _5119 = _5013;
                _5121 = _5015;
                _5123 = _5017;
                _5125 = _5019;
                _5127 = true;
            }
        }
        else
        {
            float _5159 = _622 + _5029;
            float _5161 = _624 + _5031;
            float _5163 = _626 + _5033;
            float _5165 = _5035 + 1.0;
            _5119 = _5013;
            _5121 = _5015;
            _5123 = _5017;
            _5125 = _5019;
            _5095 = _5159;
            _5097 = _5161;
            _5099 = _5163;
            _5101 = _5165;
        }
    }
    _5127 = false;
    float _5167 = _5079;
    float _5169 = _5081;
    float _5171 = _5083;
    float _5173 = _5085;
    float _5175 = _5119;
    float _5177 = _5121;
    float _5179 = _5123;
    float _5181 = _5125;
    float _5183 = _5087;
    float _5185 = _5089;
    float _5187 = _5091;
    float _5189 = _5093;
    float _5191 = _5095;
    float _5193 = _5097;
    float _5195 = _5099;
    float _5197 = _5101;
    float _5199 = -_2928;
    float _5201 = _632 + _5199;
    float _5203 = -_2932;
    float _5205 = _630 + _5203;
    float _5207 = _2942 * _5201;
    float _5209 = -_2936;
    float _5211 = _634 + _5209;
    float _5213 = fma(_2946, _5205, _5207);
    float _5215 = fma(_2950, _5211, _5213);
    float _5217 = _2978 * _5215;
    float _5219 = rint(_5217);
    float _5221 = precise::max(0.0, _5219);
    float _5223 = precise::min(_5221, 3.0);
    float _5225 = trunc(_5223);
    int _5227 = int(_5225);
    bool _5229 = _5227 >= 2;
    bool _5231 = !_5229;
    float _5233 = as_type<float>(_5227);
    float _5235 = _5219;
    float _5237 = _5213;
    float _5239 = _5207;
    float _5241 = _5167;
    float _5243 = _5169;
    float _5245 = _5171;
    float _5247 = _5173;
    float _5249 = _5183;
    float _5251 = _5185;
    float _5253 = _5187;
    float _5255 = _5189;
    float _5257 = _5191;
    float _5259 = _5193;
    float _5261 = _5195;
    float _5263 = _5197;
    float _5281;
    float _5283;
    float _5285;
    float _5287;
    if (!_5231)
    {
        bool _5265 = _5227 >= 3;
        bool _5267 = !_5265;
        if (!_5267)
        {
            bool _5269 = _5227 != 3;
            _5271 = _5269;
            if (!_5271)
            {
                float _5273 = _630 + _5167;
                float _5275 = _632 + _5169;
                float _5277 = _634 + _5171;
                float _5279 = _5173 + 1.0;
                _5241 = _5273;
                _5243 = _5275;
                _5245 = _5277;
                _5247 = _5279;
                _5281 = _5175;
                _5283 = _5177;
                _5285 = _5179;
                _5287 = _5181;
                _5289 = true;
            }
        }
        else
        {
            float _5291 = _630 + _5183;
            float _5293 = _632 + _5185;
            float _5295 = _634 + _5187;
            float _5297 = _5189 + 1.0;
            _5281 = _5175;
            _5283 = _5177;
            _5285 = _5179;
            _5287 = _5181;
            _5249 = _5291;
            _5251 = _5293;
            _5253 = _5295;
            _5255 = _5297;
            _5289 = true;
        }
    }
    if ((!_5289) || _5271)
    {
        bool _5299;
        if (!_5271)
        {
            _5299 = _5227 >= 1;
        }
        if ((!_5299) || _5271)
        {
            if (!_5271)
            {
                bool _5301 = _5227 != 0;
                if (!_5301)
                {
                    float _5303 = _630 + _5175;
                    _5233 = _5303;
                }
                float _5305 = _5233;
                _5281 = _5305;
                if (!_5301)
                {
                    float _5307 = _632 + _5177;
                    _5235 = _5307;
                }
                float _5309 = _5235;
                _5283 = _5309;
                if (!_5301)
                {
                    float _5311 = _634 + _5179;
                    _5237 = _5311;
                }
                float _5313 = _5237;
                _5285 = _5313;
                if (!_5301)
                {
                    float _5315 = _5181 + 1.0;
                    _5239 = _5315;
                }
                float _5317 = _5239;
                bool _5319 = !_5301;
                _5287 = _5317;
                _5289 = _5319;
            }
            if ((!_5289) || _5271)
            {
                _5271 = false;
                _5281 = _5175;
                _5283 = _5177;
                _5285 = _5179;
                _5287 = _5181;
                _5289 = true;
            }
        }
        else
        {
            float _5321 = _630 + _5191;
            float _5323 = _632 + _5193;
            float _5325 = _634 + _5195;
            float _5327 = _5197 + 1.0;
            _5281 = _5175;
            _5283 = _5177;
            _5285 = _5179;
            _5287 = _5181;
            _5257 = _5321;
            _5259 = _5323;
            _5261 = _5325;
            _5263 = _5327;
        }
    }
    _5289 = false;
    float _5329 = _5241;
    float _5331 = _5243;
    float _5333 = _5245;
    float _5335 = _5247;
    float _5337 = _5281;
    float _5339 = _5283;
    float _5341 = _5285;
    float _5343 = _5287;
    float _5345 = _5249;
    float _5347 = _5251;
    float _5349 = _5253;
    float _5351 = _5255;
    float _5353 = _5257;
    float _5355 = _5259;
    float _5357 = _5261;
    float _5359 = _5263;
    float _5361 = -_2928;
    float _5363 = _640 + _5361;
    float _5365 = -_2932;
    float _5367 = _638 + _5365;
    float _5369 = _2942 * _5363;
    float _5371 = -_2936;
    float _5373 = _642 + _5371;
    float _5375 = fma(_2946, _5367, _5369);
    float _5377 = fma(_2950, _5373, _5375);
    float _5379 = _2978 * _5377;
    float _5381 = rint(_5379);
    float _5383 = precise::max(0.0, _5381);
    float _5385 = precise::min(_5383, 3.0);
    float _5387 = trunc(_5385);
    int _5389 = int(_5387);
    bool _5391 = _5389 >= 2;
    bool _5393 = !_5391;
    float _5395 = as_type<float>(_5389);
    float _5397 = _5373;
    float _5399 = _5381;
    float _5401 = _5375;
    float _5403 = _5359;
    float _5405 = _5351;
    float _5407 = _5345;
    float _5409 = _5335;
    float _5411 = _5353;
    float _5413 = _5357;
    float _5415 = _5347;
    float _5417 = _5349;
    float _5419 = _5355;
    float _5421 = _5331;
    float _5423 = _5329;
    float _5425 = _5333;
    float _5443;
    float _5445;
    float _5447;
    float _5449;
    if (!_5393)
    {
        bool _5427 = _5389 >= 3;
        bool _5429 = !_5427;
        if (!_5429)
        {
            bool _5431 = _5389 != 3;
            _5433 = _5431;
            if (!_5433)
            {
                float _5435 = _638 + _5329;
                float _5437 = _640 + _5331;
                float _5439 = _642 + _5333;
                float _5441 = _5335 + 1.0;
                _5443 = _5343;
                _5409 = _5441;
                _5445 = _5337;
                _5447 = _5341;
                _5449 = _5339;
                _5421 = _5437;
                _5423 = _5435;
                _5425 = _5439;
                _5451 = true;
            }
        }
        else
        {
            float _5453 = _638 + _5345;
            float _5455 = _640 + _5347;
            float _5457 = _642 + _5349;
            float _5459 = _5351 + 1.0;
            _5405 = _5459;
            _5407 = _5453;
            _5443 = _5343;
            _5445 = _5337;
            _5415 = _5455;
            _5417 = _5457;
            _5447 = _5341;
            _5449 = _5339;
            _5451 = true;
        }
    }
    if ((!_5451) || _5433)
    {
        bool _5461;
        if (!_5433)
        {
            _5461 = _5389 >= 1;
        }
        if ((!_5461) || _5433)
        {
            if (!_5433)
            {
                bool _5463 = _5389 != 0;
                if (!_5463)
                {
                    float _5465 = _638 + _5337;
                    _5395 = _5465;
                }
                float _5467 = _5395;
                _5445 = _5467;
                if (!_5463)
                {
                    float _5469 = _640 + _5339;
                    _5397 = _5469;
                }
                float _5471 = _5397;
                _5449 = _5471;
                if (!_5463)
                {
                    float _5473 = _642 + _5341;
                    _5399 = _5473;
                }
                float _5475 = _5399;
                _5447 = _5475;
                if (!_5463)
                {
                    float _5477 = _5343 + 1.0;
                    _5401 = _5477;
                }
                float _5479 = _5401;
                bool _5481 = !_5463;
                _5443 = _5479;
                _5451 = _5481;
            }
            if ((!_5451) || _5433)
            {
                _5433 = false;
                _5443 = _5343;
                _5445 = _5337;
                _5447 = _5341;
                _5449 = _5339;
                _5451 = true;
            }
        }
        else
        {
            float _5483 = _638 + _5353;
            float _5485 = _640 + _5355;
            float _5487 = _642 + _5357;
            float _5489 = _5359 + 1.0;
            _5403 = _5489;
            _5443 = _5343;
            _5411 = _5483;
            _5413 = _5487;
            _5445 = _5337;
            _5419 = _5485;
            _5447 = _5341;
            _5449 = _5339;
        }
    }
    _5451 = false;
    float _5491 = _5403;
    float _5493 = _5405;
    float _5495 = _5407;
    float _5497 = _5443;
    float _5499 = _5409;
    float _5501 = _5411;
    float _5503 = _5413;
    float _5505 = _5445;
    float _5507 = _5415;
    float _5509 = _5417;
    float _5511 = _5419;
    float _5513 = _5447;
    float _5515 = _5449;
    float _5517 = _5421;
    float _5519 = _5423;
    float _5521 = _5425;
    float _5523 = _5491 * 4.0;
    float _5525 = fma(_5493, 4.0, _5491);
    float _5527 = _5493 + _5491;
    float _5529 = _5495 * 6.0;
    float _5531 = fma(_5497, 9.0, _5523);
    float _5533 = fma(_5499, 9.0, _5525);
    float _5535 = _5501 * 6.0;
    float _5537 = _5527 * 2.0;
    float _5539 = _5531 + _5493;
    float _5541 = _5503 * 6.0;
    float _5543 = fma(_5505, 9.0, _5535);
    float _5545 = _5507 * 6.0;
    float _5547 = _5539 * _5533;
    float _5549 = _5509 * 6.0;
    float _5551 = fma(_5501, 3.0, _5529);
    float _5553 = fma(_5511, 3.0, _5545);
    float _5555 = -_5547;
    float _5557 = fma(_5537, _5537, _5555);
    float _5559 = _5511 * 6.0;
    float _5561 = fma(_5513, 9.0, _5541);
    float _5563 = fma(_5503, 3.0, _5549);
    bool _5565 = _5557 != 0.0;
    bool _5567 = isnan(_5557);
    bool _5569 = _5565 || _5567;
    bool _5571 = isnan(0.0);
    bool _5573 = _5569 || _5571;
    float _5575 = fma(_5515, 9.0, _5559);
    float _5577 = fma(_5517, 9.0, _5553);
    float _5579 = fma(_5495, 3.0, _5543);
    float _5581 = fma(_5509, 3.0, _5561);
    float _5583 = fma(_5507, 3.0, _5575);
    float _5585 = fma(_5519, 9.0, _5551);
    float _5587 = fma(_5521, 9.0, _5563);
    bool _5589 = !_5573;
    if (!_5589)
    {
        float _5591 = 1.0 / _5557;
        float _5593 = _5579 * _5533;
        float _5595 = _5539 * _5585;
        float _5597 = _5539 * _5587;
        float _5599 = -_5593;
        float _5601 = fma(_5585, _5537, _5599);
        float _5603 = -_5595;
        float _5605 = fma(_5579, _5537, _5603);
        float _5607 = _5583 * _5533;
        float _5609 = _5539 * _5577;
        float _5611 = _5581 * _5533;
        float _5613 = -_5597;
        float _5615 = fma(_5581, _5537, _5613);
        float _5617 = -_5607;
        float _5619 = fma(_5577, _5537, _5617);
        float _5621 = -_5609;
        float _5623 = fma(_5583, _5537, _5621);
        float _5625 = -_5611;
        float _5627 = fma(_5587, _5537, _5625);
        float _5629 = _5615 * _5591;
        float _5631 = _5605 * _5591;
        float _5633 = _5623 * _5591;
        float _5635 = _5601 * _5591;
        float _5637 = _5619 * _5591;
        float _5639 = _5627 * _5591;
        float _5641 = -_5635;
        float _5643 = _5631 + _5641;
        float _5645 = -_5637;
        float _5647 = _5633 + _5645;
        float _5649 = -_5639;
        float _5651 = _5629 + _5649;
        _2997 = _5643;
        _2999 = _5647;
        _3001 = _5651;
        _3003 = _5635;
        _3005 = _5631;
        _3007 = _5637;
        _3009 = _5633;
        _3011 = _5629;
        _3013 = _5639;
    }
    float _5653 = _2997;
    float _5655 = _2999;
    float _5657 = _3001;
    float _5659 = _3003;
    float _5661 = _3005;
    float _5663 = _3007;
    float _5665 = _3009;
    float _5667 = _3011;
    float _5669 = _3013;
    float _5671 = fma(_5653, 496.0, 0.5);
    float _5673 = precise::clamp(_5671, 0.0, 1.0);
    float _5675 = fma(_5653, -31.0, 1.0);
    float _5677 = precise::clamp(_5675, 0.0, 1.0);
    float _5679 = _5673 + (-0.5);
    float _5681 = fma(_5655, 1008.0, 0.5);
    float _5683 = precise::clamp(_5681, 0.0, 1.0);
    float _5685 = fma(_5657, 496.0, 0.5);
    float _5687 = precise::clamp(_5685, 0.0, 1.0);
    float _5689 = fma(_5655, -63.0, 1.0);
    float _5691 = precise::clamp(_5689, 0.0, 1.0);
    float _5693 = _5677 * _5679;
    float _5695 = _5683 + (-0.5);
    float _5697 = fma(_5657, -31.0, 1.0);
    float _5699 = precise::clamp(_5697, 0.0, 1.0);
    float _5701 = _5687 + (-0.5);
    float _5703 = fma(_5693, -0.0322580635547637939453125, _5659);
    float _5705 = precise::clamp(_5703, 0.0, 1.0);
    float _5707 = _5691 * _5695;
    float _5709 = _5707 * 2.0;
    float _5711 = fma(_5693, 0.0322580635547637939453125, _5661);
    float _5713 = precise::clamp(_5711, 0.0, 1.0);
    float _5715 = _5699 * _5701;
    float _5717 = _5705 * 31.0;
    float _5719 = fma(_5709, -0.01587301678955554962158203125, _5663);
    float _5721 = precise::clamp(_5719, 0.0, 1.0);
    float _5723 = fma(_5709, 0.01587301678955554962158203125, _5665);
    float _5725 = precise::clamp(_5723, 0.0, 1.0);
    float _5727 = _5713 * 31.0;
    float _5729 = fma(_5715, 0.0322580635547637939453125, _5667);
    float _5731 = precise::clamp(_5729, 0.0, 1.0);
    float _5733 = _5721 * 63.0;
    float _5735 = _5725 * 63.0;
    float _5737 = fma(_5715, -0.0322580635547637939453125, _5669);
    float _5739 = precise::clamp(_5737, 0.0, 1.0);
    float _5741 = _5731 * 31.0;
    float _5743 = rint(_5727);
    float _5745 = _5739 * 31.0;
    float _5747 = rint(_5735);
    float _5749 = rint(_5717);
    float _5751 = rint(_5733);
    float _5753 = _5747 + 0.5;
    float _5755 = rint(_5741);
    float _5757 = _5743 + 0.5;
    float _5759 = _5749 + 0.5;
    float _5761 = rint(_5745);
    float _5763 = _5751 + 0.5;
    float _5765 = _5755 + 0.5;
    float _5767 = trunc(_5757);
    float _5769 = precise::max(_5767, 0.0);
    uint _5771 = uint(_5769);
    float _5773 = _5761 + 0.5;
    float _5775 = trunc(_5753);
    float _5777 = precise::max(_5775, 0.0);
    uint _5779 = uint(_5777);
    float _5781 = trunc(_5759);
    float _5783 = precise::max(_5781, 0.0);
    uint _5785 = uint(_5783);
    int _5787 = int(_5771) << 11;
    float _5789 = trunc(_5763);
    float _5791 = precise::max(_5789, 0.0);
    uint _5793 = uint(_5791);
    int _5795 = int(_5779) << 5;
    float _5797 = trunc(_5765);
    float _5799 = precise::max(_5797, 0.0);
    uint _5801 = uint(_5799);
    int _5803 = int(_5785) << 11;
    float _5805 = trunc(_5773);
    float _5807 = precise::max(_5805, 0.0);
    uint _5809 = uint(_5807);
    int _5811 = int(_5793) << 5;
    int _5813 = _5787 | _5795;
    int _5815 = int(_5801) | _5813;
    int _5817 = _5803 | _5811;
    int _5819 = int(_5809) | _5817;
    bool _5821 = _5815 != _5819;
    int _5823 = _5811;
    int _5825 = _5787;
    int _5827 = int(_5785);
    int _5829 = _5815;
    if (!_5821)
    {
        _5823 = _5815;
    }
    int _5831 = _5823;
    int _5833 = _5831;
    if (!_5821)
    {
        _5825 = 0;
    }
    int _5835 = _5825;
    int _5837 = _5835;
    if (!_5821)
    {
        _5827 = 0;
    }
    int _5839 = _5827;
    bool _5841 = !_5821;
    int _5843 = _5839;
    if (!_5841)
    {
        float _5845 = _5743 * 0.0322580635547637939453125;
        float _5847 = _5749 * 0.0322580635547637939453125;
        float _5849 = _5747 * 0.01587301678955554962158203125;
        bool _5851 = uint(_5815) >= uint(_5819);
        float _5853 = _5751 * 0.01587301678955554962158203125;
        float _5855 = _5755 * 0.0322580635547637939453125;
        float _5857 = _5761 * 0.0322580635547637939453125;
        bool _5859 = !_5851;
        float _5861 = _5859 ? _5845 : _5847;
        bool _5863 = !_5851;
        float _5865 = _5863 ? _5847 : _5845;
        bool _5867 = !_5851;
        float _5869 = _5867 ? _5849 : _5853;
        float _5871 = -_5861;
        float _5873 = _574 + _5871;
        bool _5875 = !_5851;
        float _5877 = _5875 ? _5853 : _5849;
        float _5879 = -_5861;
        float _5881 = _5879 + _5865;
        bool _5883 = !_5851;
        float _5885 = _5883 ? _5855 : _5857;
        float _5887 = -_5861;
        float _5889 = _566 + _5887;
        bool _5891 = !_5851;
        float _5893 = _5891 ? _5857 : _5855;
        float _5895 = -_5869;
        float _5897 = _5895 + _5877;
        float _5899 = -_5861;
        float _5901 = _558 + _5899;
        float _5903 = -_5861;
        float _5905 = _550 + _5903;
        float _5907 = -_5861;
        float _5909 = _542 + _5907;
        float _5911 = _5897 * _5897;
        float _5913 = -_5885;
        float _5915 = _5913 + _5893;
        float _5917 = -_5861;
        float _5919 = _534 + _5917;
        float _5921 = -_5861;
        float _5923 = _526 + _5921;
        float _5925 = fma(_5881, _5881, _5911);
        float _5927 = -_5861;
        float _5929 = _506 + _5927;
        float _5931 = -_5861;
        float _5933 = _638 + _5931;
        float _5935 = -_5861;
        float _5937 = _630 + _5935;
        float _5939 = fma(_5915, _5915, _5925);
        float _5941 = -_5861;
        float _5943 = _622 + _5941;
        float _5945 = -_5861;
        float _5947 = _614 + _5945;
        float _5949 = -_5861;
        float _5951 = _606 + _5949;
        float _5953 = -_5861;
        float _5955 = _598 + _5953;
        float _5957 = -_5861;
        float _5959 = _590 + _5957;
        float _5961 = -_5861;
        float _5963 = _582 + _5961;
        float _5965 = -_5869;
        float _5967 = _576 + _5965;
        float _5969 = 1.0 / _5939;
        float _5971 = -_5869;
        float _5973 = _640 + _5971;
        float _5975 = -_5885;
        float _5977 = _578 + _5975;
        float _5979 = -_5869;
        float _5981 = _568 + _5979;
        float _5983 = -_5869;
        float _5985 = _608 + _5983;
        float _5987 = -_5869;
        float _5989 = _600 + _5987;
        float _5991 = -_5885;
        float _5993 = _642 + _5991;
        float _5995 = -_5869;
        float _5997 = _632 + _5995;
        float _5999 = -_5869;
        float _6001 = _560 + _5999;
        float _6003 = -_5869;
        float _6005 = _552 + _6003;
        float _6007 = -_5869;
        float _6009 = _544 + _6007;
        float _6011 = -_5869;
        float _6013 = _536 + _6011;
        float _6015 = -_5869;
        float _6017 = _528 + _6015;
        float _6019 = -_5869;
        float _6021 = _508 + _6019;
        float _6023 = -_5869;
        float _6025 = _624 + _6023;
        float _6027 = -_5869;
        float _6029 = _616 + _6027;
        float _6031 = _5897 * _5969;
        float _6033 = _5881 * _5969;
        float _6035 = _5915 * _5969;
        float _6037 = -_5869;
        float _6039 = _592 + _6037;
        float _6041 = _6031 * _5967;
        float _6043 = _6031 * _5973;
        float _6045 = _6031 * _5981;
        float _6047 = _6031 * _5985;
        float _6049 = fma(_6033, _5873, _6041);
        float _6051 = fma(_6033, _5933, _6043);
        float _6053 = _6031 * _5989;
        float _6055 = -_5869;
        float _6057 = _584 + _6055;
        float _6059 = fma(_6035, _5977, _6049);
        float _6061 = fma(_6035, _5993, _6051);
        float _6063 = -_5885;
        float _6065 = _570 + _6063;
        float _6067 = _6031 * _5997;
        float _6069 = fma(_6033, _5889, _6045);
        bool _6071 = _6059 >= 0.5;
        float _6073 = -_5885;
        float _6075 = _610 + _6073;
        float _6077 = -_5885;
        float _6079 = _602 + _6077;
        float _6081 = fma(_6033, _5951, _6047);
        float _6083 = fma(_6033, _5955, _6053);
        float _6085 = -_5885;
        float _6087 = _634 + _6085;
        float _6089 = _6031 * _6001;
        float _6091 = _6031 * _6005;
        float _6093 = _6031 * _6009;
        float _6095 = _6031 * _6013;
        float _6097 = _6031 * _6017;
        float _6099 = _6031 * _6021;
        float _6101 = _6031 * _6025;
        float _6103 = _6031 * _6029;
        float _6105 = _6031 * _6039;
        float _6107 = _6031 * _6057;
        float _6109 = fma(_6033, _5937, _6067);
        float _6111 = fma(_6035, _6065, _6069);
        bool _6113 = _6061 >= 0.5;
        float _6115 = -_5885;
        float _6117 = _562 + _6115;
        bool _6119 = _6059 >= 0.833000004291534423828125;
        float _6121 = -_5885;
        float _6123 = _554 + _6121;
        float _6125 = -_5885;
        float _6127 = _546 + _6125;
        float _6129 = -_5885;
        float _6131 = _538 + _6129;
        float _6133 = -_5885;
        float _6135 = _530 + _6133;
        float _6137 = -_5885;
        float _6139 = _510 + _6137;
        float _6141 = -_5885;
        float _6143 = _626 + _6141;
        float _6145 = -_5885;
        float _6147 = _618 + _6145;
        float _6149 = -_5885;
        float _6151 = _594 + _6149;
        float _6153 = fma(_6035, _6075, _6081);
        float _6155 = fma(_6035, _6079, _6083);
        float _6157 = -_5885;
        float _6159 = _586 + _6157;
        float _6161 = fma(_6033, _5901, _6089);
        float _6163 = fma(_6033, _5905, _6091);
        float _6165 = fma(_6033, _5909, _6093);
        float _6167 = fma(_6033, _5919, _6095);
        float _6169 = fma(_6033, _5923, _6097);
        float _6171 = fma(_6033, _5929, _6099);
        float _6173 = fma(_6033, _5943, _6101);
        float _6175 = fma(_6033, _5947, _6103);
        float _6177 = fma(_6033, _5959, _6105);
        float _6179 = fma(_6033, _5963, _6107);
        float _6181 = fma(_6035, _6087, _6109);
        bool _6183 = _6059 >= 0.16599999368190765380859375;
        float _6185 = fma(_6035, _6117, _6161);
        float _6187 = fma(_6035, _6123, _6163);
        int _6189 = _6119 ? 0 : 32768;
        float _6191 = fma(_6035, _6127, _6165);
        bool _6193 = _6061 >= 0.833000004291534423828125;
        float _6195 = fma(_6035, _6131, _6167);
        bool _6197 = _6111 >= 0.5;
        float _6199 = fma(_6035, _6135, _6169);
        float _6201 = fma(_6035, _6139, _6171);
        float _6203 = fma(_6035, _6143, _6173);
        float _6205 = fma(_6035, _6147, _6175);
        float _6207 = fma(_6035, _6151, _6177);
        float _6209 = fma(_6035, _6159, _6179);
        int _6211 = _6189;
        if (!_6071)
        {
            int _6213 = _6183 ? 49152 : 16384;
            _6211 = _6213;
        }
        int _6215 = _6211;
        bool _6217 = _6061 >= 0.16599999368190765380859375;
        int _6219 = _6193 ? 0 : 32768;
        bool _6221 = _6181 >= 0.5;
        bool _6223 = _6111 >= 0.833000004291534423828125;
        int _6225 = _6219;
        if (!_6113)
        {
            int _6227 = _6217 ? 49152 : 16384;
            _6225 = _6227;
        }
        int _6229 = _6225;
        bool _6231 = _6111 >= 0.16599999368190765380859375;
        bool _6233 = _6181 >= 0.833000004291534423828125;
        int _6235 = _6223 ? 0 : 8192;
        bool _6237 = _6185 >= 0.5;
        bool _6239 = _6181 >= 0.16599999368190765380859375;
        int _6241 = _6233 ? 0 : 8192;
        int _6243 = _6235;
        int _6245 = _6241;
        if (!_6197)
        {
            int _6247 = _6231 ? 12288 : 4096;
            _6243 = _6247;
        }
        int _6249 = _6243;
        bool _6251 = _6185 >= 0.833000004291534423828125;
        bool _6253 = _6203 >= 0.5;
        if (!_6221)
        {
            int _6255 = _6239 ? 12288 : 4096;
            _6245 = _6255;
        }
        int _6257 = _6245;
        int _6259 = _6251 ? 0 : 2048;
        bool _6261 = _6185 >= 0.16599999368190765380859375;
        bool _6263 = _6203 >= 0.833000004291534423828125;
        bool _6265 = _6187 >= 0.5;
        bool _6267 = _6203 >= 0.16599999368190765380859375;
        int _6269 = _6263 ? 0 : 2048;
        int _6271 = _6259;
        int _6273 = _6269;
        if (!_6237)
        {
            int _6275 = _6261 ? 3072 : 1024;
            _6271 = _6275;
        }
        int _6277 = _6271;
        bool _6279 = _6187 >= 0.833000004291534423828125;
        bool _6281 = _6205 >= 0.5;
        if (!_6253)
        {
            int _6283 = _6267 ? 3072 : 1024;
            _6273 = _6283;
        }
        int _6285 = _6273;
        bool _6287 = _6187 >= 0.16599999368190765380859375;
        int _6289 = _6279 ? 0 : 512;
        bool _6291 = _6191 >= 0.5;
        bool _6293 = _6205 >= 0.833000004291534423828125;
        int _6295 = _6289;
        if (!_6265)
        {
            int _6297 = _6287 ? 768 : 256;
            _6295 = _6297;
        }
        int _6299 = _6295;
        bool _6301 = _6205 >= 0.16599999368190765380859375;
        bool _6303 = _6153 >= 0.5;
        int _6305 = _6293 ? 0 : 512;
        bool _6307 = _6191 >= 0.833000004291534423828125;
        int _6309 = _6305;
        if (!_6281)
        {
            int _6311 = _6301 ? 768 : 256;
            _6309 = _6311;
        }
        int _6313 = _6309;
        bool _6315 = _6191 >= 0.16599999368190765380859375;
        bool _6317 = _6153 >= 0.833000004291534423828125;
        int _6319 = _6307 ? 0 : 128;
        bool _6321 = _6153 >= 0.16599999368190765380859375;
        bool _6323 = _6195 >= 0.5;
        int _6325 = _6317 ? 0 : 128;
        int _6327 = _6319;
        int _6329 = _6325;
        if (!_6291)
        {
            int _6331 = _6315 ? 192 : 64;
            _6327 = _6331;
        }
        int _6333 = _6327;
        bool _6335 = _6195 >= 0.833000004291534423828125;
        bool _6337 = _6155 >= 0.5;
        if (!_6303)
        {
            int _6339 = _6321 ? 192 : 64;
            _6329 = _6339;
        }
        int _6341 = _6329;
        int _6343 = _6335 ? 0 : 32;
        bool _6345 = _6199 >= 0.5;
        bool _6347 = _6195 >= 0.16599999368190765380859375;
        bool _6349 = _6155 >= 0.833000004291534423828125;
        bool _6351 = _6155 >= 0.16599999368190765380859375;
        int _6353 = _6349 ? 0 : 32;
        int _6355 = _6343;
        int _6357 = _6353;
        if (!_6323)
        {
            int _6359 = _6347 ? 48 : 16;
            _6355 = _6359;
        }
        int _6361 = _6355;
        bool _6363 = _6199 >= 0.833000004291534423828125;
        bool _6365 = _6207 >= 0.5;
        if (!_6337)
        {
            int _6367 = _6351 ? 48 : 16;
            _6357 = _6367;
        }
        int _6369 = _6357;
        bool _6371 = _6199 >= 0.16599999368190765380859375;
        bool _6373 = _6207 >= 0.833000004291534423828125;
        int _6375 = _6363 ? 0 : 8;
        int _6377 = _6373 ? 0 : 8;
        int _6379 = _6375;
        int _6381 = _6377;
        if (!_6345)
        {
            int _6383 = _6371 ? 12 : 4;
            _6379 = _6383;
        }
        int _6385 = _6379;
        bool _6387 = _6201 >= 0.5;
        bool _6389 = _6209 >= 0.5;
        bool _6391 = _6207 >= 0.16599999368190765380859375;
        int _6393 = _6277 + _6215;
        int _6395 = _6393 + _6249;
        int _6397 = _6285 + _6229;
        int _6399 = _6397 + _6257;
        if (!_6365)
        {
            int _6401 = _6391 ? 12 : 4;
            _6381 = _6401;
        }
        int _6403 = _6381;
        bool _6405 = _6201 >= 0.833000004291534423828125;
        bool _6407 = _6209 >= 0.833000004291534423828125;
        bool _6409 = _6201 >= 0.16599999368190765380859375;
        bool _6411 = _6209 >= 0.16599999368190765380859375;
        int _6413 = _6333 + _6395;
        int _6415 = _6413 + _6299;
        int _6417 = _6341 + _6399;
        int _6419 = _6417 + _6313;
        int _6421 = _6405 ? 0 : 2;
        int _6423 = _6407 ? 0 : 2;
        int _6425 = _6421;
        int _6427 = _6423;
        if (!_6387)
        {
            int _6429 = _6409 ? 3 : 1;
            _6425 = _6429;
        }
        int _6431 = _6425;
        if (!_6389)
        {
            int _6433 = _6411 ? 3 : 1;
            _6427 = _6433;
        }
        int _6435 = _6427;
        int _6437 = _6385 + _6415;
        int _6439 = _6437 + _6361;
        int _6441 = _6403 + _6419;
        int _6443 = _6441 + _6369;
        bool _6445 = !_5851;
        int _6447 = _6445 ? _5819 : _5815;
        bool _6449 = !_5851;
        int _6451 = _6449 ? _5815 : _5819;
        int _6453 = _6439 + _6431;
        int _6455 = _6443 + _6435;
        _5833 = _6447;
        _5829 = _6451;
        _5837 = _6453;
        _5843 = _6455;
    }
    int _6457 = _5833;
    int _6459 = _5829;
    int _6461 = _5837;
    int _6463 = _5843;
    out.m_36.x = as_type<float>(_6457);
    out.m_36.y = as_type<float>(_6459);
    out.m_36.z = as_type<float>(_6461);
    out.m_36.w = as_type<float>(_6463);
    return out;
}


struct main0_out_u
{
    uint4 m_36 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _5451 = false;
    bool _5433 = false;
    bool _5289 = false;
    bool _5271 = false;
    bool _5127 = false;
    bool _5109 = false;
    bool _4965 = false;
    bool _4947 = false;
    bool _4803 = false;
    bool _4785 = false;
    bool _4641 = false;
    bool _4623 = false;
    bool _4479 = false;
    bool _4461 = false;
    bool _4317 = false;
    bool _4299 = false;
    bool _4155 = false;
    bool _4137 = false;
    bool _3993 = false;
    bool _3975 = false;
    bool _3831 = false;
    bool _3813 = false;
    bool _3669 = false;
    bool _3651 = false;
    bool _3507 = false;
    bool _3489 = false;
    bool _3345 = false;
    bool _3327 = false;
    bool _3183 = false;
    bool _3165 = false;
    bool _3055 = false;
    bool _3021 = false;
    float _43 = gl_FragCoord.w;
    float _45 = in.m_29.y;
    float _47 = gl_FragCoord.w;
    float _49 = _45 * _47;
    float _51 = in.m_29.x;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = in.m_31.x;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = in.m_31.y;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = in.m_29.z;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_31.z;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_33.x;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = in.m_33.y;
    float _89 = gl_FragCoord.w;
    float _91 = _87 * _89;
    float _93 = in.m_33.z;
    float _95 = gl_FragCoord.w;
    float _97 = _93 * _95;
    float _99 = 1.0 / _43;
    float _101 = _99 * _49;
    float _103 = _99 * _55;
    float _105 = _99 * _61;
    float _107 = _99 * _67;
    float _109 = _99 * _73;
    float _111 = _99 * _79;
    float _113 = _103 + _105;
    float _115 = _101 + _107;
    float _117 = abs(_103);
    float _119 = abs(_101);
    float _121 = precise::max(_117, _119);
    float _123 = _109 + _111;
    float _125 = fma(_105, 3.0, _103);
    float _127 = fma(_107, 3.0, _101);
    float _129 = abs(_113);
    float _131 = abs(_115);
    float _133 = precise::max(_129, _131);
    float _135 = _99 * _91;
    float _137 = fma(_107, 2.0, _101);
    float _139 = abs(_109);
    float _141 = precise::max(_139, _121);
    float _143 = fma(_105, 2.0, _103);
    float _145 = abs(_123);
    float _147 = precise::max(_145, _133);
    float _149 = _99 * _85;
    float _151 = fma(_111, 3.0, _109);
    float _153 = in.m_29.w;
    float _155 = gl_FragCoord.w;
    float _157 = _153 * _155;
    float _159 = abs(_125);
    float _161 = abs(_127);
    float _163 = precise::max(_159, _161);
    float _165 = _99 * _97;
    float _167 = _103 + _149;
    float _169 = _101 + _135;
    float _171 = 1.0 / _141;
    float _173 = abs(_151);
    float _175 = precise::max(_173, _163);
    float _177 = fma(_149, 3.0, _103);
    float _179 = fma(_111, 2.0, _109);
    float _181 = _109 + _165;
    float _183 = abs(_167);
    float _185 = abs(_169);
    float _187 = precise::max(_183, _185);
    float _189 = fma(_165, 3.0, _109);
    float _191 = abs(_143);
    float _193 = abs(_137);
    float _195 = precise::max(_191, _193);
    float _197 = 1.0 / _175;
    float _199 = fma(_135, 3.0, _101);
    float _201 = _113 + _149;
    float _203 = _115 + _135;
    float _205 = abs(_181);
    float _207 = precise::max(_205, _187);
    float _209 = fma(_149, 2.0, _103);
    float _211 = abs(_179);
    float _213 = precise::max(_211, _195);
    float _215 = fma(_135, 2.0, _101);
    float _217 = _123 + _165;
    float _219 = abs(_177);
    float _221 = abs(_199);
    float _223 = precise::max(_219, _221);
    float _225 = 1.0 / _147;
    float _227 = fma(_165, 2.0, _109);
    float _229 = abs(_209);
    float _231 = abs(_215);
    float _233 = precise::max(_229, _231);
    float _235 = _143 + _149;
    float _237 = abs(_189);
    float _239 = precise::max(_237, _223);
    float _241 = _137 + _135;
    float _243 = abs(_201);
    float _245 = abs(_203);
    float _247 = precise::max(_243, _245);
    float _249 = _125 + _149;
    float _251 = 1.0 / _207;
    float _253 = _127 + _135;
    float _255 = abs(_217);
    float _257 = precise::max(_255, _247);
    float _259 = _179 + _165;
    float _261 = abs(_227);
    float _263 = precise::max(_261, _233);
    float _265 = _103 * _171;
    float _267 = abs(_235);
    float _269 = abs(_241);
    float _271 = precise::max(_267, _269);
    float _273 = _101 * _171;
    float _275 = 1.0 / _213;
    float _277 = _109 * _171;
    float _279 = _151 + _165;
    float _281 = abs(_249);
    float _283 = abs(_253);
    float _285 = precise::max(_281, _283);
    float _287 = fma(_149, 2.0, _113);
    float _289 = fma(_135, 2.0, _115);
    float _291 = fma(_149, 2.0, _143);
    float _293 = fma(_135, 2.0, _137);
    float _295 = 1.0 / _257;
    float _297 = fma(_135, 3.0, _115);
    float _299 = fma(_135, 2.0, _127);
    float _301 = fma(_135, 3.0, _137);
    float _303 = abs(_259);
    float _305 = precise::max(_303, _271);
    float _307 = fma(_149, 3.0, _125);
    float _309 = fma(_135, 3.0, _127);
    float _311 = fma(_149, 3.0, _113);
    float _313 = 1.0 / _263;
    float _315 = abs(_279);
    float _317 = precise::max(_315, _285);
    float _319 = fma(_165, 2.0, _123);
    float _321 = fma(_165, 2.0, _179);
    float _323 = abs(_287);
    float _325 = abs(_289);
    float _327 = precise::max(_323, _325);
    float _329 = fma(_149, 2.0, _125);
    float _331 = abs(_291);
    float _333 = abs(_293);
    float _335 = precise::max(_331, _333);
    float _337 = _99 * _157;
    float _339 = fma(_149, 3.0, _143);
    float _341 = _123 * _225;
    float _343 = fma(_165, 3.0, _151);
    float _345 = _167 * _251;
    float _347 = _169 * _251;
    float _349 = _181 * _251;
    float _351 = _113 * _225;
    float _353 = _115 * _225;
    float _355 = fma(_165, 3.0, _123);
    float _357 = abs(_307);
    float _359 = abs(_309);
    float _361 = precise::max(_357, _359);
    float _363 = fma(_165, 2.0, _151);
    float _365 = abs(_319);
    float _367 = precise::max(_365, _327);
    float _369 = _179 * _275;
    float _371 = abs(_321);
    float _373 = precise::max(_371, _335);
    float _375 = fma(_165, 3.0, _179);
    float _377 = abs(_311);
    float _379 = abs(_297);
    float _381 = precise::max(_377, _379);
    float _383 = _201 * _295;
    float _385 = abs(_329);
    float _387 = abs(_299);
    float _389 = precise::max(_385, _387);
    float _391 = 1.0 / _367;
    float _393 = abs(_339);
    float _395 = abs(_301);
    float _397 = precise::max(_393, _395);
    float _399 = _203 * _295;
    float _401 = abs(_343);
    float _403 = precise::max(_401, _361);
    float _405 = _217 * _295;
    float _407 = abs(_355);
    float _409 = precise::max(_407, _381);
    float _411 = _143 * _275;
    float _413 = abs(_363);
    float _415 = precise::max(_413, _389);
    float _417 = 1.0 / _403;
    float _419 = abs(_375);
    float _421 = precise::max(_419, _397);
    float _423 = _137 * _275;
    float _425 = _209 * _313;
    float _427 = _215 * _313;
    float _429 = _227 * _313;
    float _431 = _125 * _197;
    float _433 = _127 * _197;
    float _435 = rint(_337);
    float _437 = precise::max(_435, 0.0);
    uint _440 = uint(_437);
    uint _442 = clamp(_440, 0u, 65535u);
    float _444 = _287 * _391;
    float _446 = _289 * _391;
    float _448 = _319 * _391;
    float _450 = _151 * _197;
    float _452 = 1.0 / _305;
    float _454 = _307 * _417;
    float _456 = _309 * _417;
    float _458 = _343 * _417;
    float _460 = 1.0 / _415;
    float _462 = 1.0 / _239;
    float _464 = _235 * _452;
    float _466 = _241 * _452;
    float _468 = _259 * _452;
    float _470 = 1.0 / _317;
    float _472 = _329 * _460;
    float _474 = _299 * _460;
    float _476 = _363 * _460;
    float _478 = 1.0 / _373;
    float _480 = _177 * _462;
    float _482 = _199 * _462;
    float _484 = _189 * _462;
    float _486 = 1.0 / _409;
    float _488 = _249 * _470;
    float _490 = _253 * _470;
    float _492 = _279 * _470;
    float _494 = 1.0 / _421;
    float _496 = _291 * _478;
    float _498 = _293 * _478;
    float _500 = _321 * _478;
    float4 _7081 = float4(_265, _273, _277, float(int(_442)));
    float4 _7085 = select(_7081, float4(0.0), isnan(_7081));
    float3 _504 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _7085.xyz, uint(rint(_7085.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _7085.xyz, uint(rint(_7085.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyz;
    float _506 = _504.x;
    float _508 = _504.y;
    float _510 = _504.z;
    float _512 = _311 * _486;
    float _514 = _297 * _486;
    float _516 = _355 * _486;
    float _518 = _339 * _494;
    float _520 = _301 * _494;
    float _522 = _375 * _494;
    float4 _7122 = float4(_351, _353, _341, float(int(_442)));
    float4 _7124 = select(_7122, float4(0.0), isnan(_7122));
    float3 _524 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _7124.xyz, uint(rint(_7124.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _7124.xyz, uint(rint(_7124.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyz;
    float _526 = _524.x;
    float _528 = _524.y;
    float _530 = _524.z;
    float4 _7142 = float4(_411, _423, _369, float(int(_442)));
    float4 _7144 = select(_7142, float4(0.0), isnan(_7142));
    float3 _532 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _7144.xyz, uint(rint(_7144.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _7144.xyz, uint(rint(_7144.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyz;
    float _534 = _532.x;
    float _536 = _532.y;
    float _538 = _532.z;
    float4 _7162 = float4(_431, _433, _450, float(int(_442)));
    float4 _7164 = select(_7162, float4(0.0), isnan(_7162));
    float3 _540 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _7164.xyz, uint(rint(_7164.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _7164.xyz, uint(rint(_7164.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyz;
    float _542 = _540.x;
    float _544 = _540.y;
    float _546 = _540.z;
    float4 _7182 = float4(_345, _347, _349, float(int(_442)));
    float4 _7184 = select(_7182, float4(0.0), isnan(_7182));
    float3 _548 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _7184.xyz, uint(rint(_7184.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _7184.xyz, uint(rint(_7184.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyz;
    float _550 = _548.x;
    float _552 = _548.y;
    float _554 = _548.z;
    float4 _7202 = float4(_383, _399, _405, float(int(_442)));
    float4 _7204 = select(_7202, float4(0.0), isnan(_7202));
    float3 _556 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _7204.xyz, uint(rint(_7204.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _7204.xyz, uint(rint(_7204.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyz;
    float _558 = _556.x;
    float _560 = _556.y;
    float _562 = _556.z;
    float4 _7222 = float4(_464, _466, _468, float(int(_442)));
    float4 _7224 = select(_7222, float4(0.0), isnan(_7222));
    float3 _564 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _7224.xyz, uint(rint(_7224.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _7224.xyz, uint(rint(_7224.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyz;
    float _566 = _564.x;
    float _568 = _564.y;
    float _570 = _564.z;
    float4 _7242 = float4(_488, _490, _492, float(int(_442)));
    float4 _7244 = select(_7242, float4(0.0), isnan(_7242));
    float3 _572 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _7244.xyz, uint(rint(_7244.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _7244.xyz, uint(rint(_7244.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyz;
    float _574 = _572.x;
    float _576 = _572.y;
    float _578 = _572.z;
    float4 _7262 = float4(_425, _427, _429, float(int(_442)));
    float4 _7264 = select(_7262, float4(0.0), isnan(_7262));
    float3 _580 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _7264.xyz, uint(rint(_7264.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _7264.xyz, uint(rint(_7264.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyz;
    float _582 = _580.x;
    float _584 = _580.y;
    float _586 = _580.z;
    float4 _7282 = float4(_444, _446, _448, float(int(_442)));
    float4 _7284 = select(_7282, float4(0.0), isnan(_7282));
    float3 _588 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _7284.xyz, uint(rint(_7284.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _7284.xyz, uint(rint(_7284.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyz;
    float _590 = _588.x;
    float _592 = _588.y;
    float _594 = _588.z;
    float4 _7302 = float4(_496, _498, _500, float(int(_442)));
    float4 _7304 = select(_7302, float4(0.0), isnan(_7302));
    float3 _596 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _7304.xyz, uint(rint(_7304.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _7304.xyz, uint(rint(_7304.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyz;
    float _598 = _596.x;
    float _600 = _596.y;
    float _602 = _596.z;
    float4 _7322 = float4(_472, _474, _476, float(int(_442)));
    float4 _7324 = select(_7322, float4(0.0), isnan(_7322));
    float3 _604 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _7324.xyz, uint(rint(_7324.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _7324.xyz, uint(rint(_7324.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyz;
    float _606 = _604.x;
    float _608 = _604.y;
    float _610 = _604.z;
    float4 _7342 = float4(_480, _482, _484, float(int(_442)));
    float4 _7344 = select(_7342, float4(0.0), isnan(_7342));
    float3 _612 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _7344.xyz, uint(rint(_7344.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _7344.xyz, uint(rint(_7344.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyz;
    float _614 = _612.x;
    float _616 = _612.y;
    float _618 = _612.z;
    float4 _7362 = float4(_512, _514, _516, float(int(_442)));
    float4 _7364 = select(_7362, float4(0.0), isnan(_7362));
    float3 _620 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _7364.xyz, uint(rint(_7364.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _7364.xyz, uint(rint(_7364.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyz;
    float _622 = _620.x;
    float _624 = _620.y;
    float _626 = _620.z;
    float4 _7382 = float4(_518, _520, _522, float(int(_442)));
    float4 _7384 = select(_7382, float4(0.0), isnan(_7382));
    float3 _628 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _7384.xyz, uint(rint(_7384.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _7384.xyz, uint(rint(_7384.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyz;
    float _630 = _628.x;
    float _632 = _628.y;
    float _634 = _628.z;
    float4 _7402 = float4(_454, _456, _458, float(int(_442)));
    float4 _7404 = select(_7402, float4(0.0), isnan(_7402));
    float3 _636 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _7404.xyz, uint(rint(_7404.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _7404.xyz, uint(rint(_7404.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyz;
    float _638 = _636.x;
    float _640 = _636.y;
    float _642 = _636.z;
    float _644 = _508 + _528;
    float _646 = _506 + _526;
    float _648 = _510 + _530;
    float _650 = _536 + _644;
    float _652 = _534 + _646;
    float _654 = _538 + _648;
    float _656 = _544 + _650;
    float _658 = _542 + _652;
    float _660 = _546 + _654;
    float _662 = _552 + _656;
    float _664 = _550 + _658;
    float _666 = _554 + _660;
    float _668 = _560 + _662;
    float _670 = _558 + _664;
    float _672 = _562 + _666;
    float _674 = _568 + _668;
    float _676 = _566 + _670;
    float _678 = _570 + _672;
    float _680 = _576 + _674;
    float _682 = _574 + _676;
    float _684 = _578 + _678;
    float _686 = _584 + _680;
    float _688 = _582 + _682;
    float _690 = _586 + _684;
    float _692 = _592 + _686;
    float _694 = _590 + _688;
    float _696 = _594 + _690;
    float _698 = _600 + _692;
    float _700 = _598 + _694;
    float _702 = _602 + _696;
    float _704 = _608 + _698;
    float _706 = _606 + _700;
    float _708 = _610 + _702;
    float _710 = _616 + _704;
    float _712 = _614 + _706;
    float _714 = _618 + _708;
    float _716 = _624 + _710;
    float _718 = _622 + _712;
    float _720 = _626 + _714;
    float _722 = _632 + _716;
    float _724 = _630 + _718;
    float _726 = _634 + _720;
    float _728 = _640 + _722;
    float _730 = _638 + _724;
    float _732 = _642 + _726;
    float _734 = fma(_728, -0.0625, _528);
    float _736 = fma(_730, -0.0625, _526);
    float _738 = fma(_732, -0.0625, _530);
    float _740 = fma(_728, -0.0625, _508);
    float _742 = fma(_730, -0.0625, _506);
    float _744 = _736 * _734;
    float _746 = _736 * _736;
    float _748 = fma(_732, -0.0625, _510);
    float _750 = _734 * _734;
    float _752 = _734 * _738;
    float _754 = _736 * _738;
    float _756 = fma(_742, _740, _744);
    float _758 = fma(_740, _740, _750);
    float _760 = fma(_740, _748, _752);
    float _762 = fma(_742, _742, _746);
    float _764 = fma(_742, _748, _754);
    float _766 = _738 * _738;
    float _768 = fma(_728, -0.0625, _536);
    float _770 = fma(_730, -0.0625, _534);
    float _772 = fma(_732, -0.0625, _538);
    float _774 = fma(_748, _748, _766);
    float _776 = fma(_768, _768, _758);
    float _778 = fma(_770, _768, _756);
    float _780 = fma(_768, _772, _760);
    float _782 = fma(_770, _770, _762);
    float _784 = fma(_770, _772, _764);
    float _786 = fma(_728, -0.0625, _544);
    float _788 = fma(_730, -0.0625, _542);
    float _790 = fma(_732, -0.0625, _546);
    float _792 = fma(_772, _772, _774);
    float _794 = fma(_786, _786, _776);
    float _796 = fma(_788, _786, _778);
    float _798 = fma(_786, _790, _780);
    float _800 = fma(_788, _788, _782);
    float _802 = fma(_788, _790, _784);
    float _804 = fma(_728, -0.0625, _552);
    float _806 = fma(_730, -0.0625, _550);
    float _808 = fma(_732, -0.0625, _554);
    float _810 = fma(_790, _790, _792);
    float _812 = fma(_804, _804, _794);
    float _814 = fma(_806, _804, _796);
    float _816 = fma(_804, _808, _798);
    float _818 = fma(_806, _806, _800);
    float _820 = fma(_806, _808, _802);
    float _822 = fma(_728, -0.0625, _560);
    float _824 = fma(_730, -0.0625, _558);
    float _826 = fma(_732, -0.0625, _562);
    float _828 = fma(_808, _808, _810);
    float _830 = fma(_822, _822, _812);
    float _832 = fma(_824, _822, _814);
    float _834 = fma(_822, _826, _816);
    float _836 = fma(_824, _824, _818);
    float _838 = fma(_824, _826, _820);
    float _840 = fma(_728, -0.0625, _568);
    float _842 = fma(_730, -0.0625, _566);
    float _844 = fma(_732, -0.0625, _570);
    float _846 = fma(_826, _826, _828);
    float _848 = fma(_840, _840, _830);
    float _850 = fma(_842, _840, _832);
    float _852 = fma(_840, _844, _834);
    float _854 = fma(_842, _842, _836);
    float _856 = fma(_842, _844, _838);
    float _858 = fma(_728, -0.0625, _576);
    float _860 = fma(_730, -0.0625, _574);
    float _862 = fma(_732, -0.0625, _578);
    float _864 = fma(_844, _844, _846);
    float _866 = fma(_858, _858, _848);
    float _868 = fma(_860, _858, _850);
    float _870 = fma(_858, _862, _852);
    float _872 = fma(_860, _860, _854);
    float _874 = fma(_860, _862, _856);
    float _876 = fma(_728, -0.0625, _584);
    float _878 = fma(_730, -0.0625, _582);
    float _880 = fma(_732, -0.0625, _586);
    float _882 = fma(_862, _862, _864);
    float _884 = fma(_876, _876, _866);
    float _886 = fma(_878, _876, _868);
    float _888 = fma(_876, _880, _870);
    float _890 = fma(_878, _878, _872);
    float _892 = fma(_878, _880, _874);
    float _894 = fma(_728, -0.0625, _592);
    float _896 = fma(_730, -0.0625, _590);
    float _898 = fma(_732, -0.0625, _594);
    float _900 = fma(_880, _880, _882);
    float _902 = fma(_894, _894, _884);
    float _904 = fma(_896, _894, _886);
    float _906 = fma(_894, _898, _888);
    float _908 = fma(_896, _896, _890);
    float _910 = fma(_896, _898, _892);
    float _912 = fma(_728, -0.0625, _600);
    float _914 = fma(_730, -0.0625, _598);
    float _916 = fma(_732, -0.0625, _602);
    float _918 = fma(_898, _898, _900);
    float _920 = fma(_912, _912, _902);
    float _922 = fma(_914, _912, _904);
    float _924 = fma(_912, _916, _906);
    float _926 = fma(_914, _914, _908);
    float _928 = fma(_914, _916, _910);
    float _930 = fma(_728, -0.0625, _608);
    float _932 = fma(_730, -0.0625, _606);
    float _934 = fma(_732, -0.0625, _610);
    float _936 = fma(_916, _916, _918);
    float _938 = fma(_930, _930, _920);
    float _940 = fma(_932, _930, _922);
    float _942 = fma(_930, _934, _924);
    float _944 = fma(_932, _932, _926);
    float _946 = fma(_932, _934, _928);
    float _948 = fma(_728, -0.0625, _616);
    float _950 = fma(_730, -0.0625, _614);
    float _952 = fma(_732, -0.0625, _618);
    float _954 = fma(_934, _934, _936);
    float _956 = fma(_948, _948, _938);
    float _958 = fma(_950, _948, _940);
    float _960 = fma(_948, _952, _942);
    float _962 = fma(_950, _950, _944);
    float _964 = fma(_950, _952, _946);
    float _966 = fma(_728, -0.0625, _624);
    float _968 = fma(_730, -0.0625, _622);
    float _970 = fma(_732, -0.0625, _626);
    float _972 = fma(_952, _952, _954);
    float _974 = fma(_966, _966, _956);
    float _976 = fma(_968, _966, _958);
    float _978 = fma(_966, _970, _960);
    float _980 = fma(_968, _968, _962);
    float _982 = fma(_968, _970, _964);
    float _984 = fma(_728, -0.0625, _632);
    float _986 = fma(_730, -0.0625, _630);
    float _988 = fma(_732, -0.0625, _634);
    float _990 = fma(_728, -0.0625, _640);
    float _992 = fma(_984, _984, _974);
    float _994 = fma(_986, _984, _976);
    float _996 = fma(_730, -0.0625, _638);
    float _998 = fma(_984, _988, _978);
    float _1000 = fma(_732, -0.0625, _642);
    float _1002 = fma(_986, _986, _980);
    float _1004 = fma(_990, _990, _992);
    float _1006 = fma(_996, _990, _994);
    float _1008 = fma(_970, _970, _972);
    float _1010 = fma(_986, _988, _982);
    float _1012 = fma(_990, _1000, _998);
    float _1014 = fma(_996, _996, _1002);
    float _1016 = _1004 + _1006;
    float _1018 = fma(_988, _988, _1008);
    float _1020 = fma(_996, _1000, _1010);
    float _1022 = _1014 + _1006;
    float _1024 = _1012 + _1016;
    float _1026 = fma(_1000, _1000, _1018);
    float _1028 = _1012 + _1020;
    float _1030 = _1020 + _1022;
    float _1032 = _1024 * _1024;
    float _1034 = _1026 + _1028;
    float _1036 = fma(_1030, _1030, _1032);
    float _1038 = fma(_1034, _1034, _1036);
    float _1040 = rsqrt(_1038);
    float _1042 = _1024 * _1040;
    float _1044 = _1030 * _1040;
    float _1046 = _1034 * _1040;
    float _1048 = _1004 * _1042;
    float _1050 = _1006 * _1042;
    float _1052 = fma(_1006, _1044, _1048);
    float _1054 = _1012 * _1042;
    float _1056 = fma(_1014, _1044, _1050);
    float _1058 = fma(_1012, _1046, _1052);
    float _1060 = fma(_1020, _1044, _1054);
    float _1062 = fma(_1020, _1046, _1056);
    float _1064 = _1058 * _1058;
    float _1066 = fma(_1026, _1046, _1060);
    float _1068 = fma(_1062, _1062, _1064);
    float _1070 = fma(_1066, _1066, _1068);
    float _1072 = rsqrt(_1070);
    float _1074 = _1058 * _1072;
    float _1076 = _1062 * _1072;
    float _1078 = _1066 * _1072;
    float _1080 = _1004 * _1074;
    float _1082 = _1006 * _1074;
    float _1084 = _1012 * _1074;
    float _1086 = fma(_1006, _1076, _1080);
    float _1088 = fma(_1014, _1076, _1082);
    float _1090 = fma(_1020, _1076, _1084);
    float _1092 = fma(_1012, _1078, _1086);
    float _1094 = fma(_1020, _1078, _1088);
    float _1096 = fma(_1026, _1078, _1090);
    float _1098 = _1092 * _1092;
    float _1100 = fma(_1094, _1094, _1098);
    float _1102 = fma(_1096, _1096, _1100);
    float _1104 = rsqrt(_1102);
    float _1106 = _1092 * _1104;
    float _1108 = _1094 * _1104;
    float _1110 = _1096 * _1104;
    float _1112 = _1004 * _1106;
    float _1114 = _1006 * _1106;
    float _1116 = _1012 * _1106;
    float _1118 = fma(_1006, _1108, _1112);
    float _1120 = fma(_1014, _1108, _1114);
    float _1122 = fma(_1020, _1108, _1116);
    float _1124 = fma(_1012, _1110, _1118);
    float _1126 = fma(_1020, _1110, _1120);
    float _1128 = fma(_1026, _1110, _1122);
    float _1130 = _1124 * _1124;
    float _1132 = fma(_1126, _1126, _1130);
    float _1134 = fma(_1128, _1128, _1132);
    float _1136 = rsqrt(_1134);
    float _1138 = _1124 * _1136;
    float _1140 = _1126 * _1136;
    float _1142 = _1128 * _1136;
    float _1144 = _1004 * _1138;
    float _1146 = _1006 * _1138;
    float _1148 = _1012 * _1138;
    float _1150 = fma(_1006, _1140, _1144);
    float _1152 = fma(_1014, _1140, _1146);
    float _1154 = fma(_1020, _1140, _1148);
    float _1156 = fma(_1012, _1142, _1150);
    float _1158 = fma(_1020, _1142, _1152);
    float _1160 = fma(_1026, _1142, _1154);
    float _1162 = _1156 * _1156;
    float _1164 = fma(_1158, _1158, _1162);
    float _1166 = fma(_1160, _1160, _1164);
    float _1168 = rsqrt(_1166);
    float _1170 = _1156 * _1168;
    float _1172 = _1158 * _1168;
    float _1174 = _1160 * _1168;
    float _1176 = _1004 * _1170;
    float _1178 = _1006 * _1170;
    float _1180 = _1012 * _1170;
    float _1182 = fma(_1006, _1172, _1176);
    float _1184 = fma(_1014, _1172, _1178);
    float _1186 = fma(_1020, _1172, _1180);
    float _1188 = fma(_1012, _1174, _1182);
    float _1190 = fma(_1020, _1174, _1184);
    float _1192 = fma(_1026, _1174, _1186);
    float _1194 = _1188 * _1188;
    float _1196 = fma(_1190, _1190, _1194);
    float _1198 = fma(_1192, _1192, _1196);
    float _1200 = rsqrt(_1198);
    float _1202 = _1188 * _1200;
    float _1204 = _1190 * _1200;
    float _1206 = _1192 * _1200;
    float _1208 = _1004 * _1202;
    float _1210 = _1006 * _1202;
    float _1212 = _1012 * _1202;
    float _1214 = fma(_1006, _1204, _1208);
    float _1216 = fma(_1014, _1204, _1210);
    float _1218 = fma(_1020, _1204, _1212);
    float _1220 = fma(_1012, _1206, _1214);
    float _1222 = fma(_1020, _1206, _1216);
    float _1224 = fma(_1026, _1206, _1218);
    float _1226 = _1220 * _1220;
    float _1228 = fma(_1222, _1222, _1226);
    float _1230 = fma(_1224, _1224, _1228);
    float _1232 = rsqrt(_1230);
    float _1234 = _1220 * _1232;
    float _1236 = _1222 * _1232;
    float _1238 = _1224 * _1232;
    float _1240 = _1004 * _1234;
    float _1242 = _1006 * _1234;
    float _1244 = fma(_1006, _1236, _1240);
    float _1246 = _1012 * _1234;
    float _1248 = fma(_1014, _1236, _1242);
    float _1250 = fma(_1012, _1238, _1244);
    float _1252 = fma(_1020, _1236, _1246);
    float _1254 = fma(_1020, _1238, _1248);
    float _1256 = _1250 * _1250;
    float _1258 = fma(_1026, _1238, _1252);
    float _1260 = fma(_1254, _1254, _1256);
    float _1262 = fma(_1258, _1258, _1260);
    float _1264 = rsqrt(_1262);
    float _1266 = _1250 * _1264;
    float _1268 = _1254 * _1264;
    float _1270 = _1258 * _1264;
    float _1272 = _508 * _1266;
    float _1274 = _528 * _1266;
    float _1276 = _536 * _1266;
    float _1278 = fma(_506, _1268, _1272);
    float _1280 = fma(_526, _1268, _1274);
    float _1282 = fma(_534, _1268, _1276);
    float _1284 = fma(_510, _1270, _1278);
    float _1286 = fma(_530, _1270, _1280);
    float _1288 = fma(_538, _1270, _1282);
    bool _1292 = _1284 >= _1286;
    bool _1294 = isnan(_1284);
    bool _1296 = _1292 || _1294;
    bool _1298 = isnan(_1286);
    bool _1300 = _1296 || _1298;
    float _1302 = _998;
    float _1304 = _1280;
    float _1306 = _1276;
    float _1308 = _1230;
    float _1310 = _1282;
    float _1312 = _1274;
    float _1314 = _1224;
    float _1316 = _1208;
    float _1318 = _1286;
    float _1320 = _1234;
    float _1322 = _1288;
    float _1324 = _1288;
    float _1326 = _1266;
    float _1328 = _1268;
    float _1330 = _253;
    float _1332 = _289;
    if (!_1300)
    {
        _1302 = _526;
    }
    float _1334 = _1302;
    float _1336 = _1334;
    float _1338 = _1334;
    if (!_1300)
    {
        _1304 = _528;
    }
    float _1340 = _1304;
    float _1342 = _1340;
    float _1344 = _1340;
    if (!_1300)
    {
        _1306 = _530;
    }
    float _1346 = _1306;
    float _1348 = _1346;
    float _1350 = _1346;
    if (!_1300)
    {
        _1308 = _1284;
    }
    float _1352 = _1308;
    float _1354 = _1352;
    float _1356 = _1352;
    if (!_1300)
    {
        _1310 = _1286;
    }
    float _1358 = _1310;
    float _1360 = _1358;
    float _1362 = _1358;
    if (!_1300)
    {
        _1312 = _506;
    }
    float _1364 = _1312;
    float _1366 = _1364;
    float _1368 = _1364;
    if (!_1300)
    {
        _1314 = _508;
    }
    float _1370 = _1314;
    float _1372 = _1370;
    float _1374 = _1370;
    if (!_1300)
    {
        _1316 = _510;
    }
    float _1376 = _1316;
    bool _1378 = !_1300;
    float _1380 = _1376;
    float _1382 = _1376;
    if (!_1378)
    {
        bool _1384 = _1284 > _1286;
        if (!_1384)
        {
            _1354 = _1284;
        }
        float _1386 = _1354;
        float _1388 = _1386;
        if (!_1384)
        {
            _1360 = _1284;
        }
        float _1390 = _1360;
        float _1392 = _1390;
        if (!_1384)
        {
            _1366 = _506;
        }
        float _1394 = _1366;
        float _1396 = _1394;
        if (!_1384)
        {
            _1372 = _508;
        }
        float _1398 = _1372;
        float _1400 = _1398;
        if (!_1384)
        {
            _1380 = _510;
        }
        float _1402 = _1380;
        float _1404 = _1402;
        if (!_1384)
        {
            _1336 = _506;
        }
        float _1406 = _1336;
        float _1408 = _1406;
        if (!_1384)
        {
            _1342 = _508;
        }
        float _1410 = _1342;
        float _1412 = _1410;
        if (!_1384)
        {
            _1348 = _510;
        }
        float _1414 = _1348;
        _1350 = _1414;
        if (_1384)
        {
            _1388 = _1286;
        }
        float _1416 = _1388;
        _1356 = _1416;
        if (_1384)
        {
            _1392 = _1284;
        }
        float _1418 = _1392;
        _1362 = _1418;
        if (_1384)
        {
            _1396 = _526;
        }
        float _1420 = _1396;
        _1368 = _1420;
        if (_1384)
        {
            _1400 = _528;
        }
        float _1422 = _1400;
        _1374 = _1422;
        if (_1384)
        {
            _1404 = _530;
        }
        float _1424 = _1404;
        _1382 = _1424;
        if (_1384)
        {
            _1408 = _506;
        }
        float _1426 = _1408;
        _1338 = _1426;
        if (_1384)
        {
            _1412 = _508;
        }
        float _1428 = _1412;
        _1344 = _1428;
        if (_1384)
        {
            _1350 = _510;
        }
    }
    float _1430 = _1362;
    float _1432 = _1356;
    float _1434 = _1338;
    float _1436 = _1344;
    float _1438 = _1350;
    float _1440 = _1368;
    float _1442 = _1374;
    float _1444 = _1382;
    bool _1446 = _1430 >= _1288;
    bool _1448 = isnan(_1430);
    bool _1450 = _1446 || _1448;
    bool _1452 = isnan(_1288);
    bool _1454 = _1450 || _1452;
    float _1456 = _544 * _1266;
    float _1458 = fma(_542, _1268, _1456);
    float _1460 = fma(_546, _1270, _1458);
    float _1462 = _1458;
    float _1464 = _1432;
    float _1466 = _1440;
    float _1468 = _1442;
    float _1470 = _1432;
    float _1472 = _1440;
    float _1474 = _1442;
    float _1476 = _1444;
    float _1478 = _1436;
    float _1480 = _1460;
    float _1482 = _1460;
    if (!_1454)
    {
        _1462 = _534;
    }
    float _1484 = _1462;
    float _1486 = _1484;
    float _1488 = _1484;
    if (!_1454)
    {
        _1318 = _536;
    }
    float _1490 = _1318;
    float _1492 = _1490;
    float _1494 = _1490;
    if (!_1454)
    {
        _1320 = _538;
    }
    float _1496 = _1320;
    bool _1498 = !_1454;
    float _1500 = _1496;
    float _1502 = _1496;
    if (!_1498)
    {
        bool _1504 = _1432 > _1288;
        if (_1504)
        {
            _1464 = _1288;
        }
        float _1506 = _1464;
        _1470 = _1506;
        if (!_1504)
        {
            _1486 = _1434;
        }
        float _1508 = _1486;
        float _1510 = _1508;
        if (!_1504)
        {
            _1492 = _1436;
        }
        float _1512 = _1492;
        float _1514 = _1512;
        if (!_1504)
        {
            _1500 = _1438;
        }
        float _1516 = _1500;
        float _1518 = _1516;
        if (!_1504)
        {
            _1322 = _1430;
        }
        float _1520 = _1322;
        float _1522 = _1520;
        if (_1504)
        {
            _1510 = _1434;
        }
        float _1524 = _1510;
        _1488 = _1524;
        if (_1504)
        {
            _1514 = _1436;
        }
        float _1526 = _1514;
        _1494 = _1526;
        if (_1504)
        {
            _1518 = _1438;
        }
        float _1528 = _1518;
        _1502 = _1528;
        if (_1504)
        {
            _1522 = _1430;
        }
        float _1530 = _1522;
        _1324 = _1530;
        if (_1504)
        {
            _1466 = _534;
        }
        float _1532 = _1466;
        _1472 = _1532;
        if (_1504)
        {
            _1468 = _536;
        }
        float _1534 = _1468;
        _1474 = _1534;
        if (_1504)
        {
            _1476 = _538;
        }
    }
    float _1536 = _1324;
    float _1538 = _1470;
    float _1540 = _1488;
    float _1542 = _1494;
    float _1544 = _1502;
    float _1546 = _1472;
    float _1548 = _1474;
    float _1550 = _1476;
    bool _1552 = _1536 >= _1460;
    bool _1554 = isnan(_1536);
    bool _1556 = _1552 || _1554;
    bool _1558 = isnan(_1460);
    bool _1560 = _1556 || _1558;
    float _1562 = _552 * _1266;
    float _1564 = fma(_550, _1268, _1562);
    float _1566 = fma(_554, _1270, _1564);
    float _1568 = _1564;
    float _1570 = _1562;
    float _1572 = _1538;
    float _1574 = _1546;
    float _1576 = _1548;
    float _1578 = _1538;
    float _1580 = _1546;
    float _1582 = _1548;
    float _1584 = _1550;
    float _1586 = _1542;
    float _1588 = _1544;
    float _1590 = _1566;
    float _1592 = _1566;
    if (!_1560)
    {
        _1568 = _542;
    }
    float _1594 = _1568;
    float _1596 = _1594;
    float _1598 = _1594;
    if (!_1560)
    {
        _1570 = _544;
    }
    float _1600 = _1570;
    float _1602 = _1600;
    float _1604 = _1600;
    if (!_1560)
    {
        _1478 = _546;
    }
    float _1606 = _1478;
    bool _1608 = !_1560;
    float _1610 = _1606;
    float _1612 = _1606;
    if (!_1608)
    {
        bool _1614 = _1538 > _1460;
        if (_1614)
        {
            _1572 = _1460;
        }
        float _1616 = _1572;
        _1578 = _1616;
        if (!_1614)
        {
            _1596 = _1540;
        }
        float _1618 = _1596;
        float _1620 = _1618;
        if (!_1614)
        {
            _1602 = _1542;
        }
        float _1622 = _1602;
        float _1624 = _1622;
        if (!_1614)
        {
            _1610 = _1544;
        }
        float _1626 = _1610;
        float _1628 = _1626;
        if (!_1614)
        {
            _1480 = _1536;
        }
        float _1630 = _1480;
        float _1632 = _1630;
        if (_1614)
        {
            _1620 = _1540;
        }
        float _1634 = _1620;
        _1598 = _1634;
        if (_1614)
        {
            _1624 = _1542;
        }
        float _1636 = _1624;
        _1604 = _1636;
        if (_1614)
        {
            _1628 = _1544;
        }
        float _1638 = _1628;
        _1612 = _1638;
        if (_1614)
        {
            _1632 = _1536;
        }
        float _1640 = _1632;
        _1482 = _1640;
        if (_1614)
        {
            _1574 = _542;
        }
        float _1642 = _1574;
        _1580 = _1642;
        if (_1614)
        {
            _1576 = _544;
        }
        float _1644 = _1576;
        _1582 = _1644;
        if (_1614)
        {
            _1584 = _546;
        }
    }
    float _1646 = _1482;
    float _1648 = _1578;
    float _1650 = _1598;
    float _1652 = _1604;
    float _1654 = _1612;
    float _1656 = _1580;
    float _1658 = _1582;
    float _1660 = _1584;
    bool _1662 = _1646 >= _1566;
    bool _1664 = isnan(_1646);
    bool _1666 = _1662 || _1664;
    bool _1668 = isnan(_1566);
    bool _1670 = _1666 || _1668;
    float _1672 = _560 * _1266;
    float _1674 = fma(_558, _1268, _1672);
    float _1676 = fma(_562, _1270, _1674);
    float _1678 = _1674;
    float _1680 = _1648;
    float _1682 = _1656;
    float _1684 = _1658;
    float _1686 = _1648;
    float _1688 = _1656;
    float _1690 = _1658;
    float _1692 = _1660;
    float _1694 = _1654;
    float _1696 = _1676;
    float _1698 = _1676;
    float _1700 = _1646;
    if (!_1670)
    {
        _1678 = _550;
    }
    float _1702 = _1678;
    float _1704 = _1702;
    float _1706 = _1702;
    if (!_1670)
    {
        _1586 = _552;
    }
    float _1708 = _1586;
    float _1710 = _1708;
    float _1712 = _1708;
    if (!_1670)
    {
        _1588 = _554;
    }
    float _1714 = _1588;
    bool _1716 = !_1670;
    float _1718 = _1714;
    float _1720 = _1714;
    if (!_1716)
    {
        bool _1722 = _1648 > _1566;
        if (_1722)
        {
            _1680 = _1566;
        }
        float _1724 = _1680;
        _1686 = _1724;
        if (!_1722)
        {
            _1704 = _1650;
        }
        float _1726 = _1704;
        float _1728 = _1726;
        if (!_1722)
        {
            _1710 = _1652;
        }
        float _1730 = _1710;
        float _1732 = _1730;
        if (!_1722)
        {
            _1718 = _1654;
        }
        float _1734 = _1718;
        float _1736 = _1734;
        if (!_1722)
        {
            _1590 = _1646;
        }
        float _1738 = _1590;
        float _1740 = _1738;
        if (_1722)
        {
            _1728 = _1650;
        }
        float _1742 = _1728;
        _1706 = _1742;
        if (_1722)
        {
            _1732 = _1652;
        }
        float _1744 = _1732;
        _1712 = _1744;
        if (_1722)
        {
            _1736 = _1654;
        }
        float _1746 = _1736;
        _1720 = _1746;
        if (_1722)
        {
            _1740 = _1646;
        }
        float _1748 = _1740;
        _1592 = _1748;
        if (_1722)
        {
            _1682 = _550;
        }
        float _1750 = _1682;
        _1688 = _1750;
        if (_1722)
        {
            _1684 = _552;
        }
        float _1752 = _1684;
        _1690 = _1752;
        if (_1722)
        {
            _1692 = _554;
        }
    }
    float _1754 = _1592;
    float _1756 = _1686;
    float _1758 = _1706;
    float _1760 = _1712;
    float _1762 = _1720;
    float _1764 = _1688;
    float _1766 = _1690;
    float _1768 = _1692;
    bool _1770 = _1754 >= _1676;
    bool _1772 = isnan(_1754);
    bool _1774 = _1770 || _1772;
    bool _1776 = isnan(_1676);
    bool _1778 = _1774 || _1776;
    float _1780 = _568 * _1266;
    float _1782 = fma(_566, _1268, _1780);
    float _1784 = fma(_570, _1270, _1782);
    float _1786 = _1782;
    float _1788 = _1780;
    float _1790 = _1756;
    float _1792 = _1764;
    float _1794 = _1766;
    float _1796 = _1756;
    float _1798 = _1764;
    float _1800 = _1766;
    float _1802 = _1768;
    float _1804 = _1762;
    float _1806 = _1754;
    float _1808 = _1784;
    float _1810 = _1784;
    if (!_1778)
    {
        _1786 = _558;
    }
    float _1812 = _1786;
    float _1814 = _1812;
    float _1816 = _1812;
    if (!_1778)
    {
        _1788 = _560;
    }
    float _1818 = _1788;
    float _1820 = _1818;
    float _1822 = _1818;
    if (!_1778)
    {
        _1694 = _562;
    }
    float _1824 = _1694;
    bool _1826 = !_1778;
    float _1828 = _1824;
    float _1830 = _1824;
    if (!_1826)
    {
        bool _1832 = _1756 > _1676;
        if (_1832)
        {
            _1790 = _1676;
        }
        float _1834 = _1790;
        _1796 = _1834;
        if (!_1832)
        {
            _1814 = _1758;
        }
        float _1836 = _1814;
        float _1838 = _1836;
        if (!_1832)
        {
            _1820 = _1760;
        }
        float _1840 = _1820;
        float _1842 = _1840;
        if (!_1832)
        {
            _1828 = _1762;
        }
        float _1844 = _1828;
        float _1846 = _1844;
        if (!_1832)
        {
            _1696 = _1754;
        }
        float _1848 = _1696;
        float _1850 = _1848;
        if (_1832)
        {
            _1838 = _1758;
        }
        float _1852 = _1838;
        _1816 = _1852;
        if (_1832)
        {
            _1842 = _1760;
        }
        float _1854 = _1842;
        _1822 = _1854;
        if (_1832)
        {
            _1846 = _1762;
        }
        float _1856 = _1846;
        _1830 = _1856;
        if (_1832)
        {
            _1850 = _1754;
        }
        float _1858 = _1850;
        _1698 = _1858;
        if (_1832)
        {
            _1792 = _558;
        }
        float _1860 = _1792;
        _1798 = _1860;
        if (_1832)
        {
            _1794 = _560;
        }
        float _1862 = _1794;
        _1800 = _1862;
        if (_1832)
        {
            _1802 = _562;
        }
    }
    float _1864 = _1698;
    float _1866 = _1796;
    float _1868 = _1816;
    float _1870 = _1822;
    float _1872 = _1830;
    float _1874 = _1798;
    float _1876 = _1800;
    float _1878 = _1802;
    bool _1880 = _1864 >= _1784;
    bool _1882 = isnan(_1864);
    bool _1884 = _1880 || _1882;
    bool _1886 = isnan(_1784);
    bool _1888 = _1884 || _1886;
    float _1890 = _576 * _1266;
    float _1892 = fma(_574, _1268, _1890);
    float _1894 = fma(_578, _1270, _1892);
    float _1896 = _1866;
    float _1898 = _1874;
    float _1900 = _1876;
    float _1902 = _1866;
    float _1904 = _1874;
    float _1906 = _1876;
    float _1908 = _1878;
    float _1910 = _1872;
    float _1912 = _1894;
    float _1914 = _1894;
    if (!_1888)
    {
        _1804 = _566;
    }
    float _1916 = _1804;
    float _1918 = _1916;
    float _1920 = _1916;
    if (!_1888)
    {
        _1806 = _568;
    }
    float _1922 = _1806;
    float _1924 = _1922;
    float _1926 = _1922;
    if (!_1888)
    {
        _1700 = _570;
    }
    float _1928 = _1700;
    bool _1930 = !_1888;
    float _1932 = _1928;
    float _1934 = _1928;
    if (!_1930)
    {
        bool _1936 = _1866 > _1784;
        if (_1936)
        {
            _1896 = _1784;
        }
        float _1938 = _1896;
        _1902 = _1938;
        if (!_1936)
        {
            _1918 = _1868;
        }
        float _1940 = _1918;
        float _1942 = _1940;
        if (!_1936)
        {
            _1924 = _1870;
        }
        float _1944 = _1924;
        float _1946 = _1944;
        if (!_1936)
        {
            _1932 = _1872;
        }
        float _1948 = _1932;
        float _1950 = _1948;
        if (!_1936)
        {
            _1808 = _1864;
        }
        float _1952 = _1808;
        float _1954 = _1952;
        if (_1936)
        {
            _1942 = _1868;
        }
        float _1956 = _1942;
        _1920 = _1956;
        if (_1936)
        {
            _1946 = _1870;
        }
        float _1958 = _1946;
        _1926 = _1958;
        if (_1936)
        {
            _1950 = _1872;
        }
        float _1960 = _1950;
        _1934 = _1960;
        if (_1936)
        {
            _1954 = _1864;
        }
        float _1962 = _1954;
        _1810 = _1962;
        if (_1936)
        {
            _1898 = _566;
        }
        float _1964 = _1898;
        _1904 = _1964;
        if (_1936)
        {
            _1900 = _568;
        }
        float _1966 = _1900;
        _1906 = _1966;
        if (_1936)
        {
            _1908 = _570;
        }
    }
    float _1968 = _1810;
    float _1970 = _1902;
    float _1972 = _1920;
    float _1974 = _1926;
    float _1976 = _1934;
    float _1978 = _1904;
    float _1980 = _1906;
    float _1982 = _1908;
    bool _1984 = _1968 >= _1894;
    bool _1986 = isnan(_1968);
    bool _1988 = _1984 || _1986;
    bool _1990 = isnan(_1894);
    bool _1992 = _1988 || _1990;
    float _1994 = _584 * _1266;
    float _1996 = fma(_582, _1268, _1994);
    float _1998 = fma(_586, _1270, _1996);
    float _2000 = _1996;
    float _2002 = _1994;
    float _2004 = _1970;
    float _2006 = _1978;
    float _2008 = _1980;
    float _2010 = _1970;
    float _2012 = _1978;
    float _2014 = _1980;
    float _2016 = _1982;
    float _2018 = _1976;
    float _2020 = _1972;
    float _2022 = _1998;
    float _2024 = _1998;
    if (!_1992)
    {
        _2000 = _574;
    }
    float _2026 = _2000;
    float _2028 = _2026;
    float _2030 = _2026;
    if (!_1992)
    {
        _2002 = _576;
    }
    float _2032 = _2002;
    float _2034 = _2032;
    float _2036 = _2032;
    if (!_1992)
    {
        _1910 = _578;
    }
    float _2038 = _1910;
    bool _2040 = !_1992;
    float _2042 = _2038;
    float _2044 = _2038;
    if (!_2040)
    {
        bool _2046 = _1970 > _1894;
        if (_2046)
        {
            _2004 = _1894;
        }
        float _2048 = _2004;
        _2010 = _2048;
        if (!_2046)
        {
            _2028 = _1972;
        }
        float _2050 = _2028;
        float _2052 = _2050;
        if (!_2046)
        {
            _2034 = _1974;
        }
        float _2054 = _2034;
        float _2056 = _2054;
        if (!_2046)
        {
            _2042 = _1976;
        }
        float _2058 = _2042;
        float _2060 = _2058;
        if (!_2046)
        {
            _1912 = _1968;
        }
        float _2062 = _1912;
        float _2064 = _2062;
        if (_2046)
        {
            _2052 = _1972;
        }
        float _2066 = _2052;
        _2030 = _2066;
        if (_2046)
        {
            _2056 = _1974;
        }
        float _2068 = _2056;
        _2036 = _2068;
        if (_2046)
        {
            _2060 = _1976;
        }
        float _2070 = _2060;
        _2044 = _2070;
        if (_2046)
        {
            _2064 = _1968;
        }
        float _2072 = _2064;
        _1914 = _2072;
        if (_2046)
        {
            _2006 = _574;
        }
        float _2074 = _2006;
        _2012 = _2074;
        if (_2046)
        {
            _2008 = _576;
        }
        float _2076 = _2008;
        _2014 = _2076;
        if (_2046)
        {
            _2016 = _578;
        }
    }
    float _2078 = _1914;
    float _2080 = _2010;
    float _2082 = _2030;
    float _2084 = _2036;
    float _2086 = _2044;
    float _2088 = _2012;
    float _2090 = _2014;
    float _2092 = _2016;
    bool _2094 = _2078 >= _1998;
    bool _2096 = isnan(_2078);
    bool _2098 = _2094 || _2096;
    bool _2100 = isnan(_1998);
    bool _2102 = _2098 || _2100;
    float _2104 = _592 * _1266;
    float _2106 = fma(_590, _1268, _2104);
    float _2108 = fma(_594, _1270, _2106);
    float _2110 = _2106;
    float _2112 = _2080;
    float _2114 = _2088;
    float _2116 = _2090;
    float _2118 = _2080;
    float _2120 = _2088;
    float _2122 = _2090;
    float _2124 = _2092;
    float _2126 = _2086;
    float _2128 = _2108;
    float _2130 = _2108;
    float _2132 = _2078;
    if (!_2102)
    {
        _2018 = _582;
    }
    float _2134 = _2018;
    float _2136 = _2134;
    float _2138 = _2134;
    if (!_2102)
    {
        _2110 = _584;
    }
    float _2140 = _2110;
    float _2142 = _2140;
    float _2144 = _2140;
    if (!_2102)
    {
        _2020 = _586;
    }
    float _2146 = _2020;
    bool _2148 = !_2102;
    float _2150 = _2146;
    float _2152 = _2146;
    if (!_2148)
    {
        bool _2154 = _2080 > _1998;
        if (_2154)
        {
            _2112 = _1998;
        }
        float _2156 = _2112;
        _2118 = _2156;
        if (!_2154)
        {
            _2136 = _2082;
        }
        float _2158 = _2136;
        float _2160 = _2158;
        if (!_2154)
        {
            _2142 = _2084;
        }
        float _2162 = _2142;
        float _2164 = _2162;
        if (!_2154)
        {
            _2150 = _2086;
        }
        float _2166 = _2150;
        float _2168 = _2166;
        if (!_2154)
        {
            _2022 = _2078;
        }
        float _2170 = _2022;
        float _2172 = _2170;
        if (_2154)
        {
            _2160 = _2082;
        }
        float _2174 = _2160;
        _2138 = _2174;
        if (_2154)
        {
            _2164 = _2084;
        }
        float _2176 = _2164;
        _2144 = _2176;
        if (_2154)
        {
            _2168 = _2086;
        }
        float _2178 = _2168;
        _2152 = _2178;
        if (_2154)
        {
            _2172 = _2078;
        }
        float _2180 = _2172;
        _2024 = _2180;
        if (_2154)
        {
            _2114 = _582;
        }
        float _2182 = _2114;
        _2120 = _2182;
        if (_2154)
        {
            _2116 = _584;
        }
        float _2184 = _2116;
        _2122 = _2184;
        if (_2154)
        {
            _2124 = _586;
        }
    }
    float _2186 = _2024;
    float _2188 = _2118;
    float _2190 = _2138;
    float _2192 = _2144;
    float _2194 = _2152;
    float _2196 = _2120;
    float _2198 = _2122;
    float _2200 = _2124;
    bool _2202 = _2186 >= _2108;
    bool _2204 = isnan(_2186);
    bool _2206 = _2202 || _2204;
    bool _2208 = isnan(_2108);
    bool _2210 = _2206 || _2208;
    float _2212 = _600 * _1266;
    float _2214 = fma(_598, _1268, _2212);
    float _2216 = fma(_602, _1270, _2214);
    float _2218 = _2212;
    float _2220 = _2214;
    float _2222 = _2188;
    float _2224 = _2196;
    float _2226 = _2198;
    float _2228 = _2188;
    float _2230 = _2196;
    float _2232 = _2198;
    float _2234 = _2200;
    float _2236 = _2194;
    float _2238 = _2216;
    float _2240 = _2216;
    if (!_2210)
    {
        _2126 = _590;
    }
    float _2242 = _2126;
    float _2244 = _2242;
    float _2246 = _2242;
    if (!_2210)
    {
        _2218 = _592;
    }
    float _2248 = _2218;
    float _2250 = _2248;
    float _2252 = _2248;
    if (!_2210)
    {
        _2220 = _594;
    }
    float _2254 = _2220;
    bool _2256 = !_2210;
    float _2258 = _2254;
    float _2260 = _2254;
    if (!_2256)
    {
        bool _2262 = _2188 > _2108;
        if (_2262)
        {
            _2222 = _2108;
        }
        float _2264 = _2222;
        _2228 = _2264;
        if (!_2262)
        {
            _2244 = _2190;
        }
        float _2266 = _2244;
        float _2268 = _2266;
        if (!_2262)
        {
            _2250 = _2192;
        }
        float _2270 = _2250;
        float _2272 = _2270;
        if (!_2262)
        {
            _2258 = _2194;
        }
        float _2274 = _2258;
        float _2276 = _2274;
        if (!_2262)
        {
            _2128 = _2186;
        }
        float _2278 = _2128;
        float _2280 = _2278;
        if (_2262)
        {
            _2268 = _2190;
        }
        float _2282 = _2268;
        _2246 = _2282;
        if (_2262)
        {
            _2272 = _2192;
        }
        float _2284 = _2272;
        _2252 = _2284;
        if (_2262)
        {
            _2276 = _2194;
        }
        float _2286 = _2276;
        _2260 = _2286;
        if (_2262)
        {
            _2280 = _2186;
        }
        float _2288 = _2280;
        _2130 = _2288;
        if (_2262)
        {
            _2224 = _590;
        }
        float _2290 = _2224;
        _2230 = _2290;
        if (_2262)
        {
            _2226 = _592;
        }
        float _2292 = _2226;
        _2232 = _2292;
        if (_2262)
        {
            _2234 = _594;
        }
    }
    float _2294 = _2130;
    float _2296 = _2228;
    float _2298 = _2246;
    float _2300 = _2252;
    float _2302 = _2260;
    float _2304 = _2230;
    float _2306 = _2232;
    float _2308 = _2234;
    bool _2310 = _2294 >= _2216;
    bool _2312 = isnan(_2294);
    bool _2314 = _2310 || _2312;
    bool _2316 = isnan(_2216);
    bool _2318 = _2314 || _2316;
    float _2320 = _608 * _1266;
    float _2322 = fma(_606, _1268, _2320);
    float _2324 = fma(_610, _1270, _2322);
    float _2326 = _2322;
    float _2328 = _2296;
    float _2330 = _2304;
    float _2332 = _2306;
    float _2334 = _2296;
    float _2336 = _2304;
    float _2338 = _2306;
    float _2340 = _2308;
    float _2342 = _2298;
    float _2344 = _2302;
    float _2346 = _2324;
    float _2348 = _2324;
    if (!_2318)
    {
        _2236 = _598;
    }
    float _2350 = _2236;
    float _2352 = _2350;
    float _2354 = _2350;
    if (!_2318)
    {
        _2132 = _600;
    }
    float _2356 = _2132;
    float _2358 = _2356;
    float _2360 = _2356;
    if (!_2318)
    {
        _2326 = _602;
    }
    float _2362 = _2326;
    bool _2364 = !_2318;
    float _2366 = _2362;
    float _2368 = _2362;
    if (!_2364)
    {
        bool _2370 = _2296 > _2216;
        if (_2370)
        {
            _2328 = _2216;
        }
        float _2372 = _2328;
        _2334 = _2372;
        if (!_2370)
        {
            _2352 = _2298;
        }
        float _2374 = _2352;
        float _2376 = _2374;
        if (!_2370)
        {
            _2358 = _2300;
        }
        float _2378 = _2358;
        float _2380 = _2378;
        if (!_2370)
        {
            _2366 = _2302;
        }
        float _2382 = _2366;
        float _2384 = _2382;
        if (!_2370)
        {
            _2238 = _2294;
        }
        float _2386 = _2238;
        float _2388 = _2386;
        if (_2370)
        {
            _2376 = _2298;
        }
        float _2390 = _2376;
        _2354 = _2390;
        if (_2370)
        {
            _2380 = _2300;
        }
        float _2392 = _2380;
        _2360 = _2392;
        if (_2370)
        {
            _2384 = _2302;
        }
        float _2394 = _2384;
        _2368 = _2394;
        if (_2370)
        {
            _2388 = _2294;
        }
        float _2396 = _2388;
        _2240 = _2396;
        if (_2370)
        {
            _2330 = _598;
        }
        float _2398 = _2330;
        _2336 = _2398;
        if (_2370)
        {
            _2332 = _600;
        }
        float _2400 = _2332;
        _2338 = _2400;
        if (_2370)
        {
            _2340 = _602;
        }
    }
    float _2402 = _2240;
    float _2404 = _2334;
    float _2406 = _2354;
    float _2408 = _2360;
    float _2410 = _2368;
    float _2412 = _2336;
    float _2414 = _2338;
    float _2416 = _2340;
    bool _2418 = _2402 >= _2324;
    bool _2420 = isnan(_2402);
    bool _2422 = _2418 || _2420;
    bool _2424 = isnan(_2324);
    bool _2426 = _2422 || _2424;
    float _2428 = _616 * _1266;
    float _2430 = fma(_614, _1268, _2428);
    float _2432 = fma(_618, _1270, _2430);
    float _2434 = _2430;
    float _2436 = _2404;
    float _2438 = _2412;
    float _2440 = _2414;
    float _2442 = _2404;
    float _2444 = _2412;
    float _2446 = _2414;
    float _2448 = _2416;
    float _2450 = _2406;
    float _2452 = _2408;
    float _2454 = _2432;
    float _2456 = _2432;
    if (!_2426)
    {
        _2342 = _606;
    }
    float _2458 = _2342;
    float _2460 = _2458;
    float _2462 = _2458;
    if (!_2426)
    {
        _2434 = _608;
    }
    float _2464 = _2434;
    float _2466 = _2464;
    float _2468 = _2464;
    if (!_2426)
    {
        _2344 = _610;
    }
    float _2470 = _2344;
    bool _2472 = !_2426;
    float _2474 = _2470;
    float _2476 = _2470;
    if (!_2472)
    {
        bool _2478 = _2404 > _2324;
        if (_2478)
        {
            _2436 = _2324;
        }
        float _2480 = _2436;
        _2442 = _2480;
        if (!_2478)
        {
            _2460 = _2406;
        }
        float _2482 = _2460;
        float _2484 = _2482;
        if (!_2478)
        {
            _2466 = _2408;
        }
        float _2486 = _2466;
        float _2488 = _2486;
        if (!_2478)
        {
            _2474 = _2410;
        }
        float _2490 = _2474;
        float _2492 = _2490;
        if (!_2478)
        {
            _2346 = _2402;
        }
        float _2494 = _2346;
        float _2496 = _2494;
        if (_2478)
        {
            _2484 = _2406;
        }
        float _2498 = _2484;
        _2462 = _2498;
        if (_2478)
        {
            _2488 = _2408;
        }
        float _2500 = _2488;
        _2468 = _2500;
        if (_2478)
        {
            _2492 = _2410;
        }
        float _2502 = _2492;
        _2476 = _2502;
        if (_2478)
        {
            _2496 = _2402;
        }
        float _2504 = _2496;
        _2348 = _2504;
        if (_2478)
        {
            _2438 = _606;
        }
        float _2506 = _2438;
        _2444 = _2506;
        if (_2478)
        {
            _2440 = _608;
        }
        float _2508 = _2440;
        _2446 = _2508;
        if (_2478)
        {
            _2448 = _610;
        }
    }
    float _2510 = _2348;
    float _2512 = _2442;
    float _2514 = _2462;
    float _2516 = _2468;
    float _2518 = _2476;
    float _2520 = _2444;
    float _2522 = _2446;
    float _2524 = _2448;
    bool _2526 = _2510 >= _2432;
    bool _2528 = isnan(_2510);
    bool _2530 = _2526 || _2528;
    bool _2532 = isnan(_2432);
    bool _2534 = _2530 || _2532;
    float _2536 = _624 * _1266;
    float _2538 = fma(_622, _1268, _2536);
    float _2540 = fma(_626, _1270, _2538);
    float _2542 = _2536;
    float _2544 = _2512;
    float _2546 = _2520;
    float _2548 = _2522;
    float _2550 = _2512;
    float _2552 = _2520;
    float _2554 = _2522;
    float _2556 = _2524;
    float _2558 = _2514;
    float _2560 = _2518;
    float _2562 = _2540;
    float _2564 = _2540;
    if (!_2534)
    {
        _2450 = _614;
    }
    float _2566 = _2450;
    float _2568 = _2566;
    float _2570 = _2566;
    if (!_2534)
    {
        _2452 = _616;
    }
    float _2572 = _2452;
    float _2574 = _2572;
    float _2576 = _2572;
    if (!_2534)
    {
        _2542 = _618;
    }
    float _2578 = _2542;
    bool _2580 = !_2534;
    float _2582 = _2578;
    float _2584 = _2578;
    if (!_2580)
    {
        bool _2586 = _2512 > _2432;
        if (_2586)
        {
            _2544 = _2432;
        }
        float _2588 = _2544;
        _2550 = _2588;
        if (!_2586)
        {
            _2568 = _2514;
        }
        float _2590 = _2568;
        float _2592 = _2590;
        if (!_2586)
        {
            _2574 = _2516;
        }
        float _2594 = _2574;
        float _2596 = _2594;
        if (!_2586)
        {
            _2582 = _2518;
        }
        float _2598 = _2582;
        float _2600 = _2598;
        if (!_2586)
        {
            _2454 = _2510;
        }
        float _2602 = _2454;
        float _2604 = _2602;
        if (_2586)
        {
            _2592 = _2514;
        }
        float _2606 = _2592;
        _2570 = _2606;
        if (_2586)
        {
            _2596 = _2516;
        }
        float _2608 = _2596;
        _2576 = _2608;
        if (_2586)
        {
            _2600 = _2518;
        }
        float _2610 = _2600;
        _2584 = _2610;
        if (_2586)
        {
            _2604 = _2510;
        }
        float _2612 = _2604;
        _2456 = _2612;
        if (_2586)
        {
            _2546 = _614;
        }
        float _2614 = _2546;
        _2552 = _2614;
        if (_2586)
        {
            _2548 = _616;
        }
        float _2616 = _2548;
        _2554 = _2616;
        if (_2586)
        {
            _2556 = _618;
        }
    }
    float _2618 = _2456;
    float _2620 = _2550;
    float _2622 = _2570;
    float _2624 = _2576;
    float _2626 = _2584;
    float _2628 = _2552;
    float _2630 = _2554;
    float _2632 = _2556;
    bool _2634 = _2618 >= _2540;
    bool _2636 = isnan(_2618);
    bool _2638 = _2634 || _2636;
    bool _2640 = isnan(_2540);
    bool _2642 = _2638 || _2640;
    float _2644 = _632 * _1266;
    float _2646 = fma(_630, _1268, _2644);
    float _2648 = fma(_634, _1270, _2646);
    float _2650 = _2646;
    float _2652 = _2620;
    float _2654 = _2628;
    float _2656 = _2630;
    float _2658 = _2628;
    float _2660 = _2620;
    float _2662 = _2630;
    float _2664 = _2632;
    float _2666 = _2624;
    float _2668 = _2648;
    float _2670 = _2648;
    if (!_2642)
    {
        _2558 = _622;
    }
    float _2672 = _2558;
    float _2674 = _2672;
    float _2676 = _2672;
    if (!_2642)
    {
        _2650 = _624;
    }
    float _2678 = _2650;
    float _2680 = _2678;
    float _2682 = _2678;
    if (!_2642)
    {
        _2560 = _626;
    }
    float _2684 = _2560;
    bool _2686 = !_2642;
    float _2688 = _2684;
    float _2690 = _2684;
    if (!_2686)
    {
        bool _2692 = _2620 > _2540;
        if (_2692)
        {
            _2652 = _2540;
        }
        float _2694 = _2652;
        _2660 = _2694;
        if (!_2692)
        {
            _2674 = _2622;
        }
        float _2696 = _2674;
        float _2698 = _2696;
        if (!_2692)
        {
            _2680 = _2624;
        }
        float _2700 = _2680;
        float _2702 = _2700;
        if (!_2692)
        {
            _2688 = _2626;
        }
        float _2704 = _2688;
        float _2706 = _2704;
        if (!_2692)
        {
            _2562 = _2618;
        }
        float _2708 = _2562;
        float _2710 = _2708;
        if (_2692)
        {
            _2698 = _2622;
        }
        float _2712 = _2698;
        _2676 = _2712;
        if (_2692)
        {
            _2702 = _2624;
        }
        float _2714 = _2702;
        _2682 = _2714;
        if (_2692)
        {
            _2706 = _2626;
        }
        float _2716 = _2706;
        _2690 = _2716;
        if (_2692)
        {
            _2710 = _2618;
        }
        float _2718 = _2710;
        _2564 = _2718;
        if (_2692)
        {
            _2654 = _622;
        }
        float _2720 = _2654;
        _2658 = _2720;
        if (_2692)
        {
            _2656 = _624;
        }
        float _2722 = _2656;
        _2662 = _2722;
        if (_2692)
        {
            _2664 = _626;
        }
    }
    float _2724 = _2564;
    float _2726 = _2658;
    float _2728 = _2660;
    float _2730 = _2676;
    float _2732 = _2682;
    float _2734 = _2690;
    float _2736 = _2662;
    float _2738 = _2664;
    bool _2740 = _2724 >= _2648;
    bool _2742 = isnan(_2724);
    bool _2744 = _2740 || _2742;
    bool _2746 = isnan(_2648);
    bool _2748 = _2744 || _2746;
    float _2750 = _640 * _1266;
    float _2752 = fma(_638, _1268, _2750);
    float _2754 = fma(_642, _1270, _2752);
    float _2756 = _2752;
    float _2758 = _2728;
    float _2760 = _2736;
    float _2762 = _2736;
    float _2764 = _2738;
    float _2766 = _2728;
    float _2768 = _2730;
    float _2770 = _2732;
    if (!_2748)
    {
        _2756 = _2726;
    }
    float _2772 = _2756;
    float _2774 = _2772;
    float _2776 = _2772;
    if (!_2748)
    {
        _1326 = _630;
    }
    float _2778 = _1326;
    float _2780 = _2778;
    float _2782 = _2778;
    if (!_2748)
    {
        _1328 = _632;
    }
    float _2784 = _1328;
    float _2786 = _2784;
    float _2788 = _2784;
    if (!_2748)
    {
        _2666 = _634;
    }
    float _2790 = _2666;
    bool _2792 = !_2748;
    float _2794 = _2790;
    float _2796 = _2790;
    if (!_2792)
    {
        bool _2798 = _2728 > _2648;
        if (_2798)
        {
            _2758 = _2648;
        }
        float _2800 = _2758;
        _2766 = _2800;
        if (!_2798)
        {
            _2780 = _2730;
        }
        float _2802 = _2780;
        float _2804 = _2802;
        if (!_2798)
        {
            _2786 = _2732;
        }
        float _2806 = _2786;
        float _2808 = _2806;
        if (!_2798)
        {
            _2794 = _2734;
        }
        float _2810 = _2794;
        float _2812 = _2810;
        if (!_2798)
        {
            _2668 = _2724;
        }
        float _2814 = _2668;
        float _2816 = _2814;
        if (!_2798)
        {
            _2774 = _2726;
        }
        float _2818 = _2774;
        float _2820 = _2818;
        if (_2798)
        {
            _2804 = _2730;
        }
        float _2822 = _2804;
        _2782 = _2822;
        if (_2798)
        {
            _2808 = _2732;
        }
        float _2824 = _2808;
        _2788 = _2824;
        if (_2798)
        {
            _2812 = _2734;
        }
        float _2826 = _2812;
        _2796 = _2826;
        if (_2798)
        {
            _2816 = _2724;
        }
        float _2828 = _2816;
        _2670 = _2828;
        if (_2798)
        {
            _2820 = _630;
        }
        float _2830 = _2820;
        _2776 = _2830;
        if (_2798)
        {
            _2760 = _632;
        }
        float _2832 = _2760;
        _2762 = _2832;
        if (_2798)
        {
            _2764 = _634;
        }
    }
    float _2834 = _2670;
    float _2836 = _2762;
    float _2838 = _2764;
    float _2840 = _2766;
    float _2842 = _2782;
    float _2844 = _2788;
    float _2846 = _2796;
    float _2848 = _2776;
    bool _2850 = _2834 >= _2754;
    bool _2852 = isnan(_2834);
    bool _2854 = _2850 || _2852;
    bool _2856 = isnan(_2754);
    bool _2858 = _2854 || _2856;
    float _2860 = _2848;
    float _2862 = _2848;
    if (!_2858)
    {
        _2768 = _2836;
    }
    float _2864 = _2768;
    float _2866 = _2864;
    float _2868 = _2864;
    if (!_2858)
    {
        _2770 = _2838;
    }
    float _2870 = _2770;
    float _2872 = _2870;
    float _2874 = _2870;
    if (!_2858)
    {
        _1330 = _638;
    }
    float _2876 = _1330;
    float _2878 = 0.0;
    float _2880 = _2876;
    float _2882 = _2876;
    if (!_2858)
    {
        _2878 = _640;
    }
    float _2884 = _2878;
    float _2886 = _2884;
    float _2888 = _2884;
    if (!_2858)
    {
        _1332 = _642;
    }
    float _2890 = _1332;
    bool _2892 = !_2858;
    float _2894 = _2890;
    float _2896 = _2890;
    if (!_2892)
    {
        bool _2898 = _2840 > _2754;
        if (!_2898)
        {
            _2880 = _2842;
        }
        float _2900 = _2880;
        float _2902 = _2900;
        if (!_2898)
        {
            _2886 = _2844;
        }
        float _2904 = _2886;
        float _2906 = _2904;
        if (!_2898)
        {
            _2894 = _2846;
        }
        float _2908 = _2894;
        float _2910 = _2908;
        if (!_2898)
        {
            _2866 = _2836;
        }
        float _2912 = _2866;
        float _2914 = _2912;
        if (!_2898)
        {
            _2872 = _2838;
        }
        float _2916 = _2872;
        _2874 = _2916;
        if (_2898)
        {
            _2902 = _2842;
        }
        float _2918 = _2902;
        _2882 = _2918;
        if (_2898)
        {
            _2906 = _2844;
        }
        float _2920 = _2906;
        _2888 = _2920;
        if (_2898)
        {
            _2910 = _2846;
        }
        float _2922 = _2910;
        _2896 = _2922;
        if (_2898)
        {
            _2860 = _638;
        }
        float _2924 = _2860;
        _2862 = _2924;
        if (_2898)
        {
            _2914 = _640;
        }
        float _2926 = _2914;
        _2868 = _2926;
        if (_2898)
        {
            _2874 = _642;
        }
    }
    float _2928 = _2868;
    float _2930 = _2888;
    float _2932 = _2862;
    float _2934 = _2882;
    float _2936 = _2874;
    float _2938 = _2896;
    float _2940 = -_2928;
    float _2942 = _2930 + _2940;
    float _2944 = -_2932;
    float _2946 = _2934 + _2944;
    float _2948 = -_2936;
    float _2950 = _2938 + _2948;
    float _2952 = _2942 * _2942;
    float _2954 = fma(_2946, _2946, _2952);
    float _2956 = -_2932;
    float _2958 = _506 + _2956;
    float _2960 = fma(_2950, _2950, _2954);
    float _2962 = -_2928;
    float _2964 = _508 + _2962;
    float _2966 = _2942 * _2964;
    float _2968 = 1.0 / _2960;
    float _2970 = -_2936;
    float _2972 = _510 + _2970;
    float _2974 = fma(_2946, _2958, _2966);
    float _2976 = fma(_2950, _2972, _2974);
    float _2978 = _2968 * 3.0;
    float _2980 = _2978 * _2976;
    float _2982 = rint(_2980);
    float _2984 = precise::max(0.0, _2982);
    float _2986 = precise::min(_2984, 3.0);
    float _2988 = trunc(_2986);
    int _2991 = int(_2988);
    bool _2993 = _2991 >= 2;
    bool _2995 = !_2993;
    float _2997 = _2946;
    float _2999 = _2942;
    float _3001 = _2950;
    float _3003 = _2932;
    float _3005 = _2934;
    float _3007 = _2928;
    float _3009 = _2930;
    float _3011 = _2938;
    float _3013 = _2936;
    float _3023;
    float _3025;
    float _3027;
    float _3029;
    float _3031;
    float _3033;
    float _3035;
    float _3037;
    float _3039;
    float _3041;
    float _3043;
    float _3045;
    float _3047;
    float _3049;
    float _3051;
    float _3053;
    if (!_2995)
    {
        bool _3015 = _2991 >= 3;
        bool _3017 = !_3015;
        if (!_3017)
        {
            bool _3019 = _2991 != 3;
            _3021 = _3019;
            if (!_3021)
            {
                _3023 = _506;
                _3025 = _508;
                _3027 = _510;
                _3029 = 1.0;
                _3031 = 0.0;
                _3033 = 0.0;
                _3035 = 0.0;
                _3037 = 0.0;
                _3039 = 0.0;
                _3041 = 0.0;
                _3043 = 0.0;
                _3045 = 0.0;
                _3047 = 0.0;
                _3049 = 0.0;
                _3051 = 0.0;
                _3053 = 0.0;
                _3055 = true;
            }
        }
        else
        {
            _3023 = 0.0;
            _3025 = 0.0;
            _3027 = 0.0;
            _3029 = 0.0;
            _3031 = 0.0;
            _3033 = 0.0;
            _3035 = 0.0;
            _3037 = 0.0;
            _3039 = _506;
            _3041 = _508;
            _3043 = _510;
            _3045 = 1.0;
            _3047 = 0.0;
            _3049 = 0.0;
            _3051 = 0.0;
            _3053 = 0.0;
            _3055 = true;
        }
    }
    if ((!_3055) || _3021)
    {
        bool _3057;
        if (!_3021)
        {
            _3057 = _2991 >= 1;
        }
        if ((!_3057) || _3021)
        {
            bool _3059;
            if (!_3021)
            {
                _3059 = _2991 != 0;
            }
            if ((!_3059) && (!_3021))
            {
                _3023 = 0.0;
                _3025 = 0.0;
                _3027 = 0.0;
                _3029 = 0.0;
                _3031 = _506;
                _3033 = _508;
                _3035 = _510;
                _3037 = 1.0;
                _3039 = 0.0;
                _3041 = 0.0;
                _3043 = 0.0;
                _3045 = 0.0;
                _3047 = 0.0;
                _3049 = 0.0;
                _3051 = 0.0;
                _3053 = 0.0;
                _3055 = true;
            }
            else
            {
                _3021 = false;
                _3023 = 0.0;
                _3025 = 0.0;
                _3027 = 0.0;
                _3029 = 0.0;
                _3031 = 0.0;
                _3033 = 0.0;
                _3035 = 0.0;
                _3037 = 0.0;
                _3039 = 0.0;
                _3041 = 0.0;
                _3043 = 0.0;
                _3045 = 0.0;
                _3047 = 0.0;
                _3049 = 0.0;
                _3051 = 0.0;
                _3053 = 0.0;
                _3055 = true;
            }
        }
        else
        {
            _3023 = 0.0;
            _3025 = 0.0;
            _3027 = 0.0;
            _3029 = 0.0;
            _3031 = 0.0;
            _3033 = 0.0;
            _3035 = 0.0;
            _3037 = 0.0;
            _3039 = 0.0;
            _3041 = 0.0;
            _3043 = 0.0;
            _3045 = 0.0;
            _3047 = _506;
            _3049 = _508;
            _3051 = _510;
            _3053 = 1.0;
        }
    }
    _3055 = false;
    float _3061 = _3023;
    float _3063 = _3025;
    float _3065 = _3027;
    float _3067 = _3029;
    float _3069 = _3031;
    float _3071 = _3033;
    float _3073 = _3035;
    float _3075 = _3037;
    float _3077 = _3039;
    float _3079 = _3041;
    float _3081 = _3043;
    float _3083 = _3045;
    float _3085 = _3047;
    float _3087 = _3049;
    float _3089 = _3051;
    float _3091 = _3053;
    float _3093 = -_2928;
    float _3095 = _528 + _3093;
    float _3097 = -_2932;
    float _3099 = _526 + _3097;
    float _3101 = _2942 * _3095;
    float _3103 = -_2936;
    float _3105 = _530 + _3103;
    float _3107 = fma(_2946, _3099, _3101);
    float _3109 = fma(_2950, _3105, _3107);
    float _3111 = _2978 * _3109;
    float _3113 = rint(_3111);
    float _3115 = precise::max(0.0, _3113);
    float _3117 = precise::min(_3115, 3.0);
    float _3119 = trunc(_3117);
    int _3121 = int(_3119);
    bool _3123 = _3121 >= 2;
    bool _3125 = !_3123;
    float _3127 = as_type<float>(_3121);
    float _3129 = _3113;
    float _3131 = _3107;
    float _3133 = _3101;
    float _3135 = _3061;
    float _3137 = _3063;
    float _3139 = _3065;
    float _3141 = _3067;
    float _3143 = _3077;
    float _3145 = _3079;
    float _3147 = _3081;
    float _3149 = _3083;
    float _3151 = _3085;
    float _3153 = _3087;
    float _3155 = _3089;
    float _3157 = _3091;
    float _3175;
    float _3177;
    float _3179;
    float _3181;
    if (!_3125)
    {
        bool _3159 = _3121 >= 3;
        bool _3161 = !_3159;
        if (!_3161)
        {
            bool _3163 = _3121 != 3;
            _3165 = _3163;
            if (!_3165)
            {
                float _3167 = _526 + _3061;
                float _3169 = _528 + _3063;
                float _3171 = _530 + _3065;
                float _3173 = _3067 + 1.0;
                _3135 = _3167;
                _3137 = _3169;
                _3139 = _3171;
                _3141 = _3173;
                _3175 = _3069;
                _3177 = _3071;
                _3179 = _3073;
                _3181 = _3075;
                _3183 = true;
            }
        }
        else
        {
            float _3185 = _526 + _3077;
            float _3187 = _528 + _3079;
            float _3189 = _530 + _3081;
            float _3191 = _3083 + 1.0;
            _3175 = _3069;
            _3177 = _3071;
            _3179 = _3073;
            _3181 = _3075;
            _3143 = _3185;
            _3145 = _3187;
            _3147 = _3189;
            _3149 = _3191;
            _3183 = true;
        }
    }
    if ((!_3183) || _3165)
    {
        bool _3193;
        if (!_3165)
        {
            _3193 = _3121 >= 1;
        }
        if ((!_3193) || _3165)
        {
            if (!_3165)
            {
                bool _3195 = _3121 != 0;
                if (!_3195)
                {
                    float _3197 = _526 + _3069;
                    _3127 = _3197;
                }
                float _3199 = _3127;
                _3175 = _3199;
                if (!_3195)
                {
                    float _3201 = _528 + _3071;
                    _3129 = _3201;
                }
                float _3203 = _3129;
                _3177 = _3203;
                if (!_3195)
                {
                    float _3205 = _530 + _3073;
                    _3131 = _3205;
                }
                float _3207 = _3131;
                _3179 = _3207;
                if (!_3195)
                {
                    float _3209 = _3075 + 1.0;
                    _3133 = _3209;
                }
                float _3211 = _3133;
                bool _3213 = !_3195;
                _3181 = _3211;
                _3183 = _3213;
            }
            if ((!_3183) || _3165)
            {
                _3165 = false;
                _3175 = _3069;
                _3177 = _3071;
                _3179 = _3073;
                _3181 = _3075;
                _3183 = true;
            }
        }
        else
        {
            float _3215 = _526 + _3085;
            float _3217 = _528 + _3087;
            float _3219 = _530 + _3089;
            float _3221 = _3091 + 1.0;
            _3175 = _3069;
            _3177 = _3071;
            _3179 = _3073;
            _3181 = _3075;
            _3151 = _3215;
            _3153 = _3217;
            _3155 = _3219;
            _3157 = _3221;
        }
    }
    _3183 = false;
    float _3223 = _3135;
    float _3225 = _3137;
    float _3227 = _3139;
    float _3229 = _3141;
    float _3231 = _3175;
    float _3233 = _3177;
    float _3235 = _3179;
    float _3237 = _3181;
    float _3239 = _3143;
    float _3241 = _3145;
    float _3243 = _3147;
    float _3245 = _3149;
    float _3247 = _3151;
    float _3249 = _3153;
    float _3251 = _3155;
    float _3253 = _3157;
    float _3255 = -_2928;
    float _3257 = _536 + _3255;
    float _3259 = -_2932;
    float _3261 = _534 + _3259;
    float _3263 = _2942 * _3257;
    float _3265 = -_2936;
    float _3267 = _538 + _3265;
    float _3269 = fma(_2946, _3261, _3263);
    float _3271 = fma(_2950, _3267, _3269);
    float _3273 = _2978 * _3271;
    float _3275 = rint(_3273);
    float _3277 = precise::max(0.0, _3275);
    float _3279 = precise::min(_3277, 3.0);
    float _3281 = trunc(_3279);
    int _3283 = int(_3281);
    bool _3285 = _3283 >= 2;
    bool _3287 = !_3285;
    float _3289 = as_type<float>(_3283);
    float _3291 = _3275;
    float _3293 = _3269;
    float _3295 = _3263;
    float _3297 = _3223;
    float _3299 = _3225;
    float _3301 = _3227;
    float _3303 = _3229;
    float _3305 = _3239;
    float _3307 = _3241;
    float _3309 = _3243;
    float _3311 = _3245;
    float _3313 = _3247;
    float _3315 = _3249;
    float _3317 = _3251;
    float _3319 = _3253;
    float _3337;
    float _3339;
    float _3341;
    float _3343;
    if (!_3287)
    {
        bool _3321 = _3283 >= 3;
        bool _3323 = !_3321;
        if (!_3323)
        {
            bool _3325 = _3283 != 3;
            _3327 = _3325;
            if (!_3327)
            {
                float _3329 = _534 + _3223;
                float _3331 = _536 + _3225;
                float _3333 = _538 + _3227;
                float _3335 = _3229 + 1.0;
                _3297 = _3329;
                _3299 = _3331;
                _3301 = _3333;
                _3303 = _3335;
                _3337 = _3231;
                _3339 = _3233;
                _3341 = _3235;
                _3343 = _3237;
                _3345 = true;
            }
        }
        else
        {
            float _3347 = _534 + _3239;
            float _3349 = _536 + _3241;
            float _3351 = _538 + _3243;
            float _3353 = _3245 + 1.0;
            _3337 = _3231;
            _3339 = _3233;
            _3341 = _3235;
            _3343 = _3237;
            _3305 = _3347;
            _3307 = _3349;
            _3309 = _3351;
            _3311 = _3353;
            _3345 = true;
        }
    }
    if ((!_3345) || _3327)
    {
        bool _3355;
        if (!_3327)
        {
            _3355 = _3283 >= 1;
        }
        if ((!_3355) || _3327)
        {
            if (!_3327)
            {
                bool _3357 = _3283 != 0;
                if (!_3357)
                {
                    float _3359 = _534 + _3231;
                    _3289 = _3359;
                }
                float _3361 = _3289;
                _3337 = _3361;
                if (!_3357)
                {
                    float _3363 = _536 + _3233;
                    _3291 = _3363;
                }
                float _3365 = _3291;
                _3339 = _3365;
                if (!_3357)
                {
                    float _3367 = _538 + _3235;
                    _3293 = _3367;
                }
                float _3369 = _3293;
                _3341 = _3369;
                if (!_3357)
                {
                    float _3371 = _3237 + 1.0;
                    _3295 = _3371;
                }
                float _3373 = _3295;
                bool _3375 = !_3357;
                _3343 = _3373;
                _3345 = _3375;
            }
            if ((!_3345) || _3327)
            {
                _3327 = false;
                _3337 = _3231;
                _3339 = _3233;
                _3341 = _3235;
                _3343 = _3237;
                _3345 = true;
            }
        }
        else
        {
            float _3377 = _534 + _3247;
            float _3379 = _536 + _3249;
            float _3381 = _538 + _3251;
            float _3383 = _3253 + 1.0;
            _3337 = _3231;
            _3339 = _3233;
            _3341 = _3235;
            _3343 = _3237;
            _3313 = _3377;
            _3315 = _3379;
            _3317 = _3381;
            _3319 = _3383;
        }
    }
    _3345 = false;
    float _3385 = _3297;
    float _3387 = _3299;
    float _3389 = _3301;
    float _3391 = _3303;
    float _3393 = _3337;
    float _3395 = _3339;
    float _3397 = _3341;
    float _3399 = _3343;
    float _3401 = _3305;
    float _3403 = _3307;
    float _3405 = _3309;
    float _3407 = _3311;
    float _3409 = _3313;
    float _3411 = _3315;
    float _3413 = _3317;
    float _3415 = _3319;
    float _3417 = -_2928;
    float _3419 = _544 + _3417;
    float _3421 = -_2932;
    float _3423 = _542 + _3421;
    float _3425 = _2942 * _3419;
    float _3427 = -_2936;
    float _3429 = _546 + _3427;
    float _3431 = fma(_2946, _3423, _3425);
    float _3433 = fma(_2950, _3429, _3431);
    float _3435 = _2978 * _3433;
    float _3437 = rint(_3435);
    float _3439 = precise::max(0.0, _3437);
    float _3441 = precise::min(_3439, 3.0);
    float _3443 = trunc(_3441);
    int _3445 = int(_3443);
    bool _3447 = _3445 >= 2;
    bool _3449 = !_3447;
    float _3451 = as_type<float>(_3445);
    float _3453 = _3437;
    float _3455 = _3431;
    float _3457 = _3425;
    float _3459 = _3385;
    float _3461 = _3387;
    float _3463 = _3389;
    float _3465 = _3391;
    float _3467 = _3401;
    float _3469 = _3403;
    float _3471 = _3405;
    float _3473 = _3407;
    float _3475 = _3409;
    float _3477 = _3411;
    float _3479 = _3413;
    float _3481 = _3415;
    float _3499;
    float _3501;
    float _3503;
    float _3505;
    if (!_3449)
    {
        bool _3483 = _3445 >= 3;
        bool _3485 = !_3483;
        if (!_3485)
        {
            bool _3487 = _3445 != 3;
            _3489 = _3487;
            if (!_3489)
            {
                float _3491 = _542 + _3385;
                float _3493 = _544 + _3387;
                float _3495 = _546 + _3389;
                float _3497 = _3391 + 1.0;
                _3459 = _3491;
                _3461 = _3493;
                _3463 = _3495;
                _3465 = _3497;
                _3499 = _3393;
                _3501 = _3395;
                _3503 = _3397;
                _3505 = _3399;
                _3507 = true;
            }
        }
        else
        {
            float _3509 = _542 + _3401;
            float _3511 = _544 + _3403;
            float _3513 = _546 + _3405;
            float _3515 = _3407 + 1.0;
            _3499 = _3393;
            _3501 = _3395;
            _3503 = _3397;
            _3505 = _3399;
            _3467 = _3509;
            _3469 = _3511;
            _3471 = _3513;
            _3473 = _3515;
            _3507 = true;
        }
    }
    if ((!_3507) || _3489)
    {
        bool _3517;
        if (!_3489)
        {
            _3517 = _3445 >= 1;
        }
        if ((!_3517) || _3489)
        {
            if (!_3489)
            {
                bool _3519 = _3445 != 0;
                if (!_3519)
                {
                    float _3521 = _542 + _3393;
                    _3451 = _3521;
                }
                float _3523 = _3451;
                _3499 = _3523;
                if (!_3519)
                {
                    float _3525 = _544 + _3395;
                    _3453 = _3525;
                }
                float _3527 = _3453;
                _3501 = _3527;
                if (!_3519)
                {
                    float _3529 = _546 + _3397;
                    _3455 = _3529;
                }
                float _3531 = _3455;
                _3503 = _3531;
                if (!_3519)
                {
                    float _3533 = _3399 + 1.0;
                    _3457 = _3533;
                }
                float _3535 = _3457;
                bool _3537 = !_3519;
                _3505 = _3535;
                _3507 = _3537;
            }
            if ((!_3507) || _3489)
            {
                _3489 = false;
                _3499 = _3393;
                _3501 = _3395;
                _3503 = _3397;
                _3505 = _3399;
                _3507 = true;
            }
        }
        else
        {
            float _3539 = _542 + _3409;
            float _3541 = _544 + _3411;
            float _3543 = _546 + _3413;
            float _3545 = _3415 + 1.0;
            _3499 = _3393;
            _3501 = _3395;
            _3503 = _3397;
            _3505 = _3399;
            _3475 = _3539;
            _3477 = _3541;
            _3479 = _3543;
            _3481 = _3545;
        }
    }
    _3507 = false;
    float _3547 = _3459;
    float _3549 = _3461;
    float _3551 = _3463;
    float _3553 = _3465;
    float _3555 = _3499;
    float _3557 = _3501;
    float _3559 = _3503;
    float _3561 = _3505;
    float _3563 = _3467;
    float _3565 = _3469;
    float _3567 = _3471;
    float _3569 = _3473;
    float _3571 = _3475;
    float _3573 = _3477;
    float _3575 = _3479;
    float _3577 = _3481;
    float _3579 = -_2928;
    float _3581 = _552 + _3579;
    float _3583 = -_2932;
    float _3585 = _550 + _3583;
    float _3587 = _2942 * _3581;
    float _3589 = -_2936;
    float _3591 = _554 + _3589;
    float _3593 = fma(_2946, _3585, _3587);
    float _3595 = fma(_2950, _3591, _3593);
    float _3597 = _2978 * _3595;
    float _3599 = rint(_3597);
    float _3601 = precise::max(0.0, _3599);
    float _3603 = precise::min(_3601, 3.0);
    float _3605 = trunc(_3603);
    int _3607 = int(_3605);
    bool _3609 = _3607 >= 2;
    bool _3611 = !_3609;
    float _3613 = as_type<float>(_3607);
    float _3615 = _3599;
    float _3617 = _3593;
    float _3619 = _3587;
    float _3621 = _3547;
    float _3623 = _3549;
    float _3625 = _3551;
    float _3627 = _3553;
    float _3629 = _3563;
    float _3631 = _3565;
    float _3633 = _3567;
    float _3635 = _3569;
    float _3637 = _3571;
    float _3639 = _3573;
    float _3641 = _3575;
    float _3643 = _3577;
    float _3661;
    float _3663;
    float _3665;
    float _3667;
    if (!_3611)
    {
        bool _3645 = _3607 >= 3;
        bool _3647 = !_3645;
        if (!_3647)
        {
            bool _3649 = _3607 != 3;
            _3651 = _3649;
            if (!_3651)
            {
                float _3653 = _550 + _3547;
                float _3655 = _552 + _3549;
                float _3657 = _554 + _3551;
                float _3659 = _3553 + 1.0;
                _3621 = _3653;
                _3623 = _3655;
                _3625 = _3657;
                _3627 = _3659;
                _3661 = _3555;
                _3663 = _3557;
                _3665 = _3559;
                _3667 = _3561;
                _3669 = true;
            }
        }
        else
        {
            float _3671 = _550 + _3563;
            float _3673 = _552 + _3565;
            float _3675 = _554 + _3567;
            float _3677 = _3569 + 1.0;
            _3661 = _3555;
            _3663 = _3557;
            _3665 = _3559;
            _3667 = _3561;
            _3629 = _3671;
            _3631 = _3673;
            _3633 = _3675;
            _3635 = _3677;
            _3669 = true;
        }
    }
    if ((!_3669) || _3651)
    {
        bool _3679;
        if (!_3651)
        {
            _3679 = _3607 >= 1;
        }
        if ((!_3679) || _3651)
        {
            if (!_3651)
            {
                bool _3681 = _3607 != 0;
                if (!_3681)
                {
                    float _3683 = _550 + _3555;
                    _3613 = _3683;
                }
                float _3685 = _3613;
                _3661 = _3685;
                if (!_3681)
                {
                    float _3687 = _552 + _3557;
                    _3615 = _3687;
                }
                float _3689 = _3615;
                _3663 = _3689;
                if (!_3681)
                {
                    float _3691 = _554 + _3559;
                    _3617 = _3691;
                }
                float _3693 = _3617;
                _3665 = _3693;
                if (!_3681)
                {
                    float _3695 = _3561 + 1.0;
                    _3619 = _3695;
                }
                float _3697 = _3619;
                bool _3699 = !_3681;
                _3667 = _3697;
                _3669 = _3699;
            }
            if ((!_3669) || _3651)
            {
                _3651 = false;
                _3661 = _3555;
                _3663 = _3557;
                _3665 = _3559;
                _3667 = _3561;
                _3669 = true;
            }
        }
        else
        {
            float _3701 = _550 + _3571;
            float _3703 = _552 + _3573;
            float _3705 = _554 + _3575;
            float _3707 = _3577 + 1.0;
            _3661 = _3555;
            _3663 = _3557;
            _3665 = _3559;
            _3667 = _3561;
            _3637 = _3701;
            _3639 = _3703;
            _3641 = _3705;
            _3643 = _3707;
        }
    }
    _3669 = false;
    float _3709 = _3621;
    float _3711 = _3623;
    float _3713 = _3625;
    float _3715 = _3627;
    float _3717 = _3661;
    float _3719 = _3663;
    float _3721 = _3665;
    float _3723 = _3667;
    float _3725 = _3629;
    float _3727 = _3631;
    float _3729 = _3633;
    float _3731 = _3635;
    float _3733 = _3637;
    float _3735 = _3639;
    float _3737 = _3641;
    float _3739 = _3643;
    float _3741 = -_2928;
    float _3743 = _560 + _3741;
    float _3745 = -_2932;
    float _3747 = _558 + _3745;
    float _3749 = _2942 * _3743;
    float _3751 = -_2936;
    float _3753 = _562 + _3751;
    float _3755 = fma(_2946, _3747, _3749);
    float _3757 = fma(_2950, _3753, _3755);
    float _3759 = _2978 * _3757;
    float _3761 = rint(_3759);
    float _3763 = precise::max(0.0, _3761);
    float _3765 = precise::min(_3763, 3.0);
    float _3767 = trunc(_3765);
    int _3769 = int(_3767);
    bool _3771 = _3769 >= 2;
    bool _3773 = !_3771;
    float _3775 = as_type<float>(_3769);
    float _3777 = _3761;
    float _3779 = _3755;
    float _3781 = _3749;
    float _3783 = _3709;
    float _3785 = _3711;
    float _3787 = _3713;
    float _3789 = _3715;
    float _3791 = _3725;
    float _3793 = _3727;
    float _3795 = _3729;
    float _3797 = _3731;
    float _3799 = _3733;
    float _3801 = _3735;
    float _3803 = _3737;
    float _3805 = _3739;
    float _3823;
    float _3825;
    float _3827;
    float _3829;
    if (!_3773)
    {
        bool _3807 = _3769 >= 3;
        bool _3809 = !_3807;
        if (!_3809)
        {
            bool _3811 = _3769 != 3;
            _3813 = _3811;
            if (!_3813)
            {
                float _3815 = _558 + _3709;
                float _3817 = _560 + _3711;
                float _3819 = _562 + _3713;
                float _3821 = _3715 + 1.0;
                _3783 = _3815;
                _3785 = _3817;
                _3787 = _3819;
                _3789 = _3821;
                _3823 = _3717;
                _3825 = _3719;
                _3827 = _3721;
                _3829 = _3723;
                _3831 = true;
            }
        }
        else
        {
            float _3833 = _558 + _3725;
            float _3835 = _560 + _3727;
            float _3837 = _562 + _3729;
            float _3839 = _3731 + 1.0;
            _3823 = _3717;
            _3825 = _3719;
            _3827 = _3721;
            _3829 = _3723;
            _3791 = _3833;
            _3793 = _3835;
            _3795 = _3837;
            _3797 = _3839;
            _3831 = true;
        }
    }
    if ((!_3831) || _3813)
    {
        bool _3841;
        if (!_3813)
        {
            _3841 = _3769 >= 1;
        }
        if ((!_3841) || _3813)
        {
            if (!_3813)
            {
                bool _3843 = _3769 != 0;
                if (!_3843)
                {
                    float _3845 = _558 + _3717;
                    _3775 = _3845;
                }
                float _3847 = _3775;
                _3823 = _3847;
                if (!_3843)
                {
                    float _3849 = _560 + _3719;
                    _3777 = _3849;
                }
                float _3851 = _3777;
                _3825 = _3851;
                if (!_3843)
                {
                    float _3853 = _562 + _3721;
                    _3779 = _3853;
                }
                float _3855 = _3779;
                _3827 = _3855;
                if (!_3843)
                {
                    float _3857 = _3723 + 1.0;
                    _3781 = _3857;
                }
                float _3859 = _3781;
                bool _3861 = !_3843;
                _3829 = _3859;
                _3831 = _3861;
            }
            if ((!_3831) || _3813)
            {
                _3813 = false;
                _3823 = _3717;
                _3825 = _3719;
                _3827 = _3721;
                _3829 = _3723;
                _3831 = true;
            }
        }
        else
        {
            float _3863 = _558 + _3733;
            float _3865 = _560 + _3735;
            float _3867 = _562 + _3737;
            float _3869 = _3739 + 1.0;
            _3823 = _3717;
            _3825 = _3719;
            _3827 = _3721;
            _3829 = _3723;
            _3799 = _3863;
            _3801 = _3865;
            _3803 = _3867;
            _3805 = _3869;
        }
    }
    _3831 = false;
    float _3871 = _3783;
    float _3873 = _3785;
    float _3875 = _3787;
    float _3877 = _3789;
    float _3879 = _3823;
    float _3881 = _3825;
    float _3883 = _3827;
    float _3885 = _3829;
    float _3887 = _3791;
    float _3889 = _3793;
    float _3891 = _3795;
    float _3893 = _3797;
    float _3895 = _3799;
    float _3897 = _3801;
    float _3899 = _3803;
    float _3901 = _3805;
    float _3903 = -_2928;
    float _3905 = _568 + _3903;
    float _3907 = -_2932;
    float _3909 = _566 + _3907;
    float _3911 = _2942 * _3905;
    float _3913 = -_2936;
    float _3915 = _570 + _3913;
    float _3917 = fma(_2946, _3909, _3911);
    float _3919 = fma(_2950, _3915, _3917);
    float _3921 = _2978 * _3919;
    float _3923 = rint(_3921);
    float _3925 = precise::max(0.0, _3923);
    float _3927 = precise::min(_3925, 3.0);
    float _3929 = trunc(_3927);
    int _3931 = int(_3929);
    bool _3933 = _3931 >= 2;
    bool _3935 = !_3933;
    float _3937 = as_type<float>(_3931);
    float _3939 = _3923;
    float _3941 = _3917;
    float _3943 = _3911;
    float _3945 = _3871;
    float _3947 = _3873;
    float _3949 = _3875;
    float _3951 = _3877;
    float _3953 = _3887;
    float _3955 = _3889;
    float _3957 = _3891;
    float _3959 = _3893;
    float _3961 = _3895;
    float _3963 = _3897;
    float _3965 = _3899;
    float _3967 = _3901;
    float _3985;
    float _3987;
    float _3989;
    float _3991;
    if (!_3935)
    {
        bool _3969 = _3931 >= 3;
        bool _3971 = !_3969;
        if (!_3971)
        {
            bool _3973 = _3931 != 3;
            _3975 = _3973;
            if (!_3975)
            {
                float _3977 = _566 + _3871;
                float _3979 = _568 + _3873;
                float _3981 = _570 + _3875;
                float _3983 = _3877 + 1.0;
                _3945 = _3977;
                _3947 = _3979;
                _3949 = _3981;
                _3951 = _3983;
                _3985 = _3879;
                _3987 = _3881;
                _3989 = _3883;
                _3991 = _3885;
                _3993 = true;
            }
        }
        else
        {
            float _3995 = _566 + _3887;
            float _3997 = _568 + _3889;
            float _3999 = _570 + _3891;
            float _4001 = _3893 + 1.0;
            _3985 = _3879;
            _3987 = _3881;
            _3989 = _3883;
            _3991 = _3885;
            _3953 = _3995;
            _3955 = _3997;
            _3957 = _3999;
            _3959 = _4001;
            _3993 = true;
        }
    }
    if ((!_3993) || _3975)
    {
        bool _4003;
        if (!_3975)
        {
            _4003 = _3931 >= 1;
        }
        if ((!_4003) || _3975)
        {
            if (!_3975)
            {
                bool _4005 = _3931 != 0;
                if (!_4005)
                {
                    float _4007 = _566 + _3879;
                    _3937 = _4007;
                }
                float _4009 = _3937;
                _3985 = _4009;
                if (!_4005)
                {
                    float _4011 = _568 + _3881;
                    _3939 = _4011;
                }
                float _4013 = _3939;
                _3987 = _4013;
                if (!_4005)
                {
                    float _4015 = _570 + _3883;
                    _3941 = _4015;
                }
                float _4017 = _3941;
                _3989 = _4017;
                if (!_4005)
                {
                    float _4019 = _3885 + 1.0;
                    _3943 = _4019;
                }
                float _4021 = _3943;
                bool _4023 = !_4005;
                _3991 = _4021;
                _3993 = _4023;
            }
            if ((!_3993) || _3975)
            {
                _3975 = false;
                _3985 = _3879;
                _3987 = _3881;
                _3989 = _3883;
                _3991 = _3885;
                _3993 = true;
            }
        }
        else
        {
            float _4025 = _566 + _3895;
            float _4027 = _568 + _3897;
            float _4029 = _570 + _3899;
            float _4031 = _3901 + 1.0;
            _3985 = _3879;
            _3987 = _3881;
            _3989 = _3883;
            _3991 = _3885;
            _3961 = _4025;
            _3963 = _4027;
            _3965 = _4029;
            _3967 = _4031;
        }
    }
    _3993 = false;
    float _4033 = _3945;
    float _4035 = _3947;
    float _4037 = _3949;
    float _4039 = _3951;
    float _4041 = _3985;
    float _4043 = _3987;
    float _4045 = _3989;
    float _4047 = _3991;
    float _4049 = _3953;
    float _4051 = _3955;
    float _4053 = _3957;
    float _4055 = _3959;
    float _4057 = _3961;
    float _4059 = _3963;
    float _4061 = _3965;
    float _4063 = _3967;
    float _4065 = -_2928;
    float _4067 = _576 + _4065;
    float _4069 = -_2932;
    float _4071 = _574 + _4069;
    float _4073 = _2942 * _4067;
    float _4075 = -_2936;
    float _4077 = _578 + _4075;
    float _4079 = fma(_2946, _4071, _4073);
    float _4081 = fma(_2950, _4077, _4079);
    float _4083 = _2978 * _4081;
    float _4085 = rint(_4083);
    float _4087 = precise::max(0.0, _4085);
    float _4089 = precise::min(_4087, 3.0);
    float _4091 = trunc(_4089);
    int _4093 = int(_4091);
    bool _4095 = _4093 >= 2;
    bool _4097 = !_4095;
    float _4099 = as_type<float>(_4093);
    float _4101 = _4085;
    float _4103 = _4079;
    float _4105 = _4073;
    float _4107 = _4033;
    float _4109 = _4035;
    float _4111 = _4037;
    float _4113 = _4039;
    float _4115 = _4049;
    float _4117 = _4051;
    float _4119 = _4053;
    float _4121 = _4055;
    float _4123 = _4057;
    float _4125 = _4059;
    float _4127 = _4061;
    float _4129 = _4063;
    float _4147;
    float _4149;
    float _4151;
    float _4153;
    if (!_4097)
    {
        bool _4131 = _4093 >= 3;
        bool _4133 = !_4131;
        if (!_4133)
        {
            bool _4135 = _4093 != 3;
            _4137 = _4135;
            if (!_4137)
            {
                float _4139 = _574 + _4033;
                float _4141 = _576 + _4035;
                float _4143 = _578 + _4037;
                float _4145 = _4039 + 1.0;
                _4107 = _4139;
                _4109 = _4141;
                _4111 = _4143;
                _4113 = _4145;
                _4147 = _4041;
                _4149 = _4043;
                _4151 = _4045;
                _4153 = _4047;
                _4155 = true;
            }
        }
        else
        {
            float _4157 = _574 + _4049;
            float _4159 = _576 + _4051;
            float _4161 = _578 + _4053;
            float _4163 = _4055 + 1.0;
            _4147 = _4041;
            _4149 = _4043;
            _4151 = _4045;
            _4153 = _4047;
            _4115 = _4157;
            _4117 = _4159;
            _4119 = _4161;
            _4121 = _4163;
            _4155 = true;
        }
    }
    if ((!_4155) || _4137)
    {
        bool _4165;
        if (!_4137)
        {
            _4165 = _4093 >= 1;
        }
        if ((!_4165) || _4137)
        {
            if (!_4137)
            {
                bool _4167 = _4093 != 0;
                if (!_4167)
                {
                    float _4169 = _574 + _4041;
                    _4099 = _4169;
                }
                float _4171 = _4099;
                _4147 = _4171;
                if (!_4167)
                {
                    float _4173 = _576 + _4043;
                    _4101 = _4173;
                }
                float _4175 = _4101;
                _4149 = _4175;
                if (!_4167)
                {
                    float _4177 = _578 + _4045;
                    _4103 = _4177;
                }
                float _4179 = _4103;
                _4151 = _4179;
                if (!_4167)
                {
                    float _4181 = _4047 + 1.0;
                    _4105 = _4181;
                }
                float _4183 = _4105;
                bool _4185 = !_4167;
                _4153 = _4183;
                _4155 = _4185;
            }
            if ((!_4155) || _4137)
            {
                _4137 = false;
                _4147 = _4041;
                _4149 = _4043;
                _4151 = _4045;
                _4153 = _4047;
                _4155 = true;
            }
        }
        else
        {
            float _4187 = _574 + _4057;
            float _4189 = _576 + _4059;
            float _4191 = _578 + _4061;
            float _4193 = _4063 + 1.0;
            _4147 = _4041;
            _4149 = _4043;
            _4151 = _4045;
            _4153 = _4047;
            _4123 = _4187;
            _4125 = _4189;
            _4127 = _4191;
            _4129 = _4193;
        }
    }
    _4155 = false;
    float _4195 = _4107;
    float _4197 = _4109;
    float _4199 = _4111;
    float _4201 = _4113;
    float _4203 = _4147;
    float _4205 = _4149;
    float _4207 = _4151;
    float _4209 = _4153;
    float _4211 = _4115;
    float _4213 = _4117;
    float _4215 = _4119;
    float _4217 = _4121;
    float _4219 = _4123;
    float _4221 = _4125;
    float _4223 = _4127;
    float _4225 = _4129;
    float _4227 = -_2928;
    float _4229 = _584 + _4227;
    float _4231 = -_2932;
    float _4233 = _582 + _4231;
    float _4235 = _2942 * _4229;
    float _4237 = -_2936;
    float _4239 = _586 + _4237;
    float _4241 = fma(_2946, _4233, _4235);
    float _4243 = fma(_2950, _4239, _4241);
    float _4245 = _2978 * _4243;
    float _4247 = rint(_4245);
    float _4249 = precise::max(0.0, _4247);
    float _4251 = precise::min(_4249, 3.0);
    float _4253 = trunc(_4251);
    int _4255 = int(_4253);
    bool _4257 = _4255 >= 2;
    bool _4259 = !_4257;
    float _4261 = as_type<float>(_4255);
    float _4263 = _4247;
    float _4265 = _4241;
    float _4267 = _4235;
    float _4269 = _4195;
    float _4271 = _4197;
    float _4273 = _4199;
    float _4275 = _4201;
    float _4277 = _4211;
    float _4279 = _4213;
    float _4281 = _4215;
    float _4283 = _4217;
    float _4285 = _4219;
    float _4287 = _4221;
    float _4289 = _4223;
    float _4291 = _4225;
    float _4309;
    float _4311;
    float _4313;
    float _4315;
    if (!_4259)
    {
        bool _4293 = _4255 >= 3;
        bool _4295 = !_4293;
        if (!_4295)
        {
            bool _4297 = _4255 != 3;
            _4299 = _4297;
            if (!_4299)
            {
                float _4301 = _582 + _4195;
                float _4303 = _584 + _4197;
                float _4305 = _586 + _4199;
                float _4307 = _4201 + 1.0;
                _4269 = _4301;
                _4271 = _4303;
                _4273 = _4305;
                _4275 = _4307;
                _4309 = _4203;
                _4311 = _4205;
                _4313 = _4207;
                _4315 = _4209;
                _4317 = true;
            }
        }
        else
        {
            float _4319 = _582 + _4211;
            float _4321 = _584 + _4213;
            float _4323 = _586 + _4215;
            float _4325 = _4217 + 1.0;
            _4309 = _4203;
            _4311 = _4205;
            _4313 = _4207;
            _4315 = _4209;
            _4277 = _4319;
            _4279 = _4321;
            _4281 = _4323;
            _4283 = _4325;
            _4317 = true;
        }
    }
    if ((!_4317) || _4299)
    {
        bool _4327;
        if (!_4299)
        {
            _4327 = _4255 >= 1;
        }
        if ((!_4327) || _4299)
        {
            if (!_4299)
            {
                bool _4329 = _4255 != 0;
                if (!_4329)
                {
                    float _4331 = _582 + _4203;
                    _4261 = _4331;
                }
                float _4333 = _4261;
                _4309 = _4333;
                if (!_4329)
                {
                    float _4335 = _584 + _4205;
                    _4263 = _4335;
                }
                float _4337 = _4263;
                _4311 = _4337;
                if (!_4329)
                {
                    float _4339 = _586 + _4207;
                    _4265 = _4339;
                }
                float _4341 = _4265;
                _4313 = _4341;
                if (!_4329)
                {
                    float _4343 = _4209 + 1.0;
                    _4267 = _4343;
                }
                float _4345 = _4267;
                bool _4347 = !_4329;
                _4315 = _4345;
                _4317 = _4347;
            }
            if ((!_4317) || _4299)
            {
                _4299 = false;
                _4309 = _4203;
                _4311 = _4205;
                _4313 = _4207;
                _4315 = _4209;
                _4317 = true;
            }
        }
        else
        {
            float _4349 = _582 + _4219;
            float _4351 = _584 + _4221;
            float _4353 = _586 + _4223;
            float _4355 = _4225 + 1.0;
            _4309 = _4203;
            _4311 = _4205;
            _4313 = _4207;
            _4315 = _4209;
            _4285 = _4349;
            _4287 = _4351;
            _4289 = _4353;
            _4291 = _4355;
        }
    }
    _4317 = false;
    float _4357 = _4269;
    float _4359 = _4271;
    float _4361 = _4273;
    float _4363 = _4275;
    float _4365 = _4309;
    float _4367 = _4311;
    float _4369 = _4313;
    float _4371 = _4315;
    float _4373 = _4277;
    float _4375 = _4279;
    float _4377 = _4281;
    float _4379 = _4283;
    float _4381 = _4285;
    float _4383 = _4287;
    float _4385 = _4289;
    float _4387 = _4291;
    float _4389 = -_2928;
    float _4391 = _592 + _4389;
    float _4393 = -_2932;
    float _4395 = _590 + _4393;
    float _4397 = _2942 * _4391;
    float _4399 = -_2936;
    float _4401 = _594 + _4399;
    float _4403 = fma(_2946, _4395, _4397);
    float _4405 = fma(_2950, _4401, _4403);
    float _4407 = _2978 * _4405;
    float _4409 = rint(_4407);
    float _4411 = precise::max(0.0, _4409);
    float _4413 = precise::min(_4411, 3.0);
    float _4415 = trunc(_4413);
    int _4417 = int(_4415);
    bool _4419 = _4417 >= 2;
    bool _4421 = !_4419;
    float _4423 = as_type<float>(_4417);
    float _4425 = _4409;
    float _4427 = _4403;
    float _4429 = _4397;
    float _4431 = _4357;
    float _4433 = _4359;
    float _4435 = _4361;
    float _4437 = _4363;
    float _4439 = _4373;
    float _4441 = _4375;
    float _4443 = _4377;
    float _4445 = _4379;
    float _4447 = _4381;
    float _4449 = _4383;
    float _4451 = _4385;
    float _4453 = _4387;
    float _4471;
    float _4473;
    float _4475;
    float _4477;
    if (!_4421)
    {
        bool _4455 = _4417 >= 3;
        bool _4457 = !_4455;
        if (!_4457)
        {
            bool _4459 = _4417 != 3;
            _4461 = _4459;
            if (!_4461)
            {
                float _4463 = _590 + _4357;
                float _4465 = _592 + _4359;
                float _4467 = _594 + _4361;
                float _4469 = _4363 + 1.0;
                _4431 = _4463;
                _4433 = _4465;
                _4435 = _4467;
                _4437 = _4469;
                _4471 = _4365;
                _4473 = _4367;
                _4475 = _4369;
                _4477 = _4371;
                _4479 = true;
            }
        }
        else
        {
            float _4481 = _590 + _4373;
            float _4483 = _592 + _4375;
            float _4485 = _594 + _4377;
            float _4487 = _4379 + 1.0;
            _4471 = _4365;
            _4473 = _4367;
            _4475 = _4369;
            _4477 = _4371;
            _4439 = _4481;
            _4441 = _4483;
            _4443 = _4485;
            _4445 = _4487;
            _4479 = true;
        }
    }
    if ((!_4479) || _4461)
    {
        bool _4489;
        if (!_4461)
        {
            _4489 = _4417 >= 1;
        }
        if ((!_4489) || _4461)
        {
            if (!_4461)
            {
                bool _4491 = _4417 != 0;
                if (!_4491)
                {
                    float _4493 = _590 + _4365;
                    _4423 = _4493;
                }
                float _4495 = _4423;
                _4471 = _4495;
                if (!_4491)
                {
                    float _4497 = _592 + _4367;
                    _4425 = _4497;
                }
                float _4499 = _4425;
                _4473 = _4499;
                if (!_4491)
                {
                    float _4501 = _594 + _4369;
                    _4427 = _4501;
                }
                float _4503 = _4427;
                _4475 = _4503;
                if (!_4491)
                {
                    float _4505 = _4371 + 1.0;
                    _4429 = _4505;
                }
                float _4507 = _4429;
                bool _4509 = !_4491;
                _4477 = _4507;
                _4479 = _4509;
            }
            if ((!_4479) || _4461)
            {
                _4461 = false;
                _4471 = _4365;
                _4473 = _4367;
                _4475 = _4369;
                _4477 = _4371;
                _4479 = true;
            }
        }
        else
        {
            float _4511 = _590 + _4381;
            float _4513 = _592 + _4383;
            float _4515 = _594 + _4385;
            float _4517 = _4387 + 1.0;
            _4471 = _4365;
            _4473 = _4367;
            _4475 = _4369;
            _4477 = _4371;
            _4447 = _4511;
            _4449 = _4513;
            _4451 = _4515;
            _4453 = _4517;
        }
    }
    _4479 = false;
    float _4519 = _4431;
    float _4521 = _4433;
    float _4523 = _4435;
    float _4525 = _4437;
    float _4527 = _4471;
    float _4529 = _4473;
    float _4531 = _4475;
    float _4533 = _4477;
    float _4535 = _4439;
    float _4537 = _4441;
    float _4539 = _4443;
    float _4541 = _4445;
    float _4543 = _4447;
    float _4545 = _4449;
    float _4547 = _4451;
    float _4549 = _4453;
    float _4551 = -_2928;
    float _4553 = _600 + _4551;
    float _4555 = -_2932;
    float _4557 = _598 + _4555;
    float _4559 = _2942 * _4553;
    float _4561 = -_2936;
    float _4563 = _602 + _4561;
    float _4565 = fma(_2946, _4557, _4559);
    float _4567 = fma(_2950, _4563, _4565);
    float _4569 = _2978 * _4567;
    float _4571 = rint(_4569);
    float _4573 = precise::max(0.0, _4571);
    float _4575 = precise::min(_4573, 3.0);
    float _4577 = trunc(_4575);
    int _4579 = int(_4577);
    bool _4581 = _4579 >= 2;
    bool _4583 = !_4581;
    float _4585 = as_type<float>(_4579);
    float _4587 = _4571;
    float _4589 = _4565;
    float _4591 = _4559;
    float _4593 = _4519;
    float _4595 = _4521;
    float _4597 = _4523;
    float _4599 = _4525;
    float _4601 = _4535;
    float _4603 = _4537;
    float _4605 = _4539;
    float _4607 = _4541;
    float _4609 = _4543;
    float _4611 = _4545;
    float _4613 = _4547;
    float _4615 = _4549;
    float _4633;
    float _4635;
    float _4637;
    float _4639;
    if (!_4583)
    {
        bool _4617 = _4579 >= 3;
        bool _4619 = !_4617;
        if (!_4619)
        {
            bool _4621 = _4579 != 3;
            _4623 = _4621;
            if (!_4623)
            {
                float _4625 = _598 + _4519;
                float _4627 = _600 + _4521;
                float _4629 = _602 + _4523;
                float _4631 = _4525 + 1.0;
                _4593 = _4625;
                _4595 = _4627;
                _4597 = _4629;
                _4599 = _4631;
                _4633 = _4527;
                _4635 = _4529;
                _4637 = _4531;
                _4639 = _4533;
                _4641 = true;
            }
        }
        else
        {
            float _4643 = _598 + _4535;
            float _4645 = _600 + _4537;
            float _4647 = _602 + _4539;
            float _4649 = _4541 + 1.0;
            _4633 = _4527;
            _4635 = _4529;
            _4637 = _4531;
            _4639 = _4533;
            _4601 = _4643;
            _4603 = _4645;
            _4605 = _4647;
            _4607 = _4649;
            _4641 = true;
        }
    }
    if ((!_4641) || _4623)
    {
        bool _4651;
        if (!_4623)
        {
            _4651 = _4579 >= 1;
        }
        if ((!_4651) || _4623)
        {
            if (!_4623)
            {
                bool _4653 = _4579 != 0;
                if (!_4653)
                {
                    float _4655 = _598 + _4527;
                    _4585 = _4655;
                }
                float _4657 = _4585;
                _4633 = _4657;
                if (!_4653)
                {
                    float _4659 = _600 + _4529;
                    _4587 = _4659;
                }
                float _4661 = _4587;
                _4635 = _4661;
                if (!_4653)
                {
                    float _4663 = _602 + _4531;
                    _4589 = _4663;
                }
                float _4665 = _4589;
                _4637 = _4665;
                if (!_4653)
                {
                    float _4667 = _4533 + 1.0;
                    _4591 = _4667;
                }
                float _4669 = _4591;
                bool _4671 = !_4653;
                _4639 = _4669;
                _4641 = _4671;
            }
            if ((!_4641) || _4623)
            {
                _4623 = false;
                _4633 = _4527;
                _4635 = _4529;
                _4637 = _4531;
                _4639 = _4533;
                _4641 = true;
            }
        }
        else
        {
            float _4673 = _598 + _4543;
            float _4675 = _600 + _4545;
            float _4677 = _602 + _4547;
            float _4679 = _4549 + 1.0;
            _4633 = _4527;
            _4635 = _4529;
            _4637 = _4531;
            _4639 = _4533;
            _4609 = _4673;
            _4611 = _4675;
            _4613 = _4677;
            _4615 = _4679;
        }
    }
    _4641 = false;
    float _4681 = _4593;
    float _4683 = _4595;
    float _4685 = _4597;
    float _4687 = _4599;
    float _4689 = _4633;
    float _4691 = _4635;
    float _4693 = _4637;
    float _4695 = _4639;
    float _4697 = _4601;
    float _4699 = _4603;
    float _4701 = _4605;
    float _4703 = _4607;
    float _4705 = _4609;
    float _4707 = _4611;
    float _4709 = _4613;
    float _4711 = _4615;
    float _4713 = -_2928;
    float _4715 = _608 + _4713;
    float _4717 = -_2932;
    float _4719 = _606 + _4717;
    float _4721 = _2942 * _4715;
    float _4723 = -_2936;
    float _4725 = _610 + _4723;
    float _4727 = fma(_2946, _4719, _4721);
    float _4729 = fma(_2950, _4725, _4727);
    float _4731 = _2978 * _4729;
    float _4733 = rint(_4731);
    float _4735 = precise::max(0.0, _4733);
    float _4737 = precise::min(_4735, 3.0);
    float _4739 = trunc(_4737);
    int _4741 = int(_4739);
    bool _4743 = _4741 >= 2;
    bool _4745 = !_4743;
    float _4747 = as_type<float>(_4741);
    float _4749 = _4733;
    float _4751 = _4727;
    float _4753 = _4721;
    float _4755 = _4681;
    float _4757 = _4683;
    float _4759 = _4685;
    float _4761 = _4687;
    float _4763 = _4697;
    float _4765 = _4699;
    float _4767 = _4701;
    float _4769 = _4703;
    float _4771 = _4705;
    float _4773 = _4707;
    float _4775 = _4709;
    float _4777 = _4711;
    float _4795;
    float _4797;
    float _4799;
    float _4801;
    if (!_4745)
    {
        bool _4779 = _4741 >= 3;
        bool _4781 = !_4779;
        if (!_4781)
        {
            bool _4783 = _4741 != 3;
            _4785 = _4783;
            if (!_4785)
            {
                float _4787 = _606 + _4681;
                float _4789 = _608 + _4683;
                float _4791 = _610 + _4685;
                float _4793 = _4687 + 1.0;
                _4755 = _4787;
                _4757 = _4789;
                _4759 = _4791;
                _4761 = _4793;
                _4795 = _4689;
                _4797 = _4691;
                _4799 = _4693;
                _4801 = _4695;
                _4803 = true;
            }
        }
        else
        {
            float _4805 = _606 + _4697;
            float _4807 = _608 + _4699;
            float _4809 = _610 + _4701;
            float _4811 = _4703 + 1.0;
            _4795 = _4689;
            _4797 = _4691;
            _4799 = _4693;
            _4801 = _4695;
            _4763 = _4805;
            _4765 = _4807;
            _4767 = _4809;
            _4769 = _4811;
            _4803 = true;
        }
    }
    if ((!_4803) || _4785)
    {
        bool _4813;
        if (!_4785)
        {
            _4813 = _4741 >= 1;
        }
        if ((!_4813) || _4785)
        {
            if (!_4785)
            {
                bool _4815 = _4741 != 0;
                if (!_4815)
                {
                    float _4817 = _606 + _4689;
                    _4747 = _4817;
                }
                float _4819 = _4747;
                _4795 = _4819;
                if (!_4815)
                {
                    float _4821 = _608 + _4691;
                    _4749 = _4821;
                }
                float _4823 = _4749;
                _4797 = _4823;
                if (!_4815)
                {
                    float _4825 = _610 + _4693;
                    _4751 = _4825;
                }
                float _4827 = _4751;
                _4799 = _4827;
                if (!_4815)
                {
                    float _4829 = _4695 + 1.0;
                    _4753 = _4829;
                }
                float _4831 = _4753;
                bool _4833 = !_4815;
                _4801 = _4831;
                _4803 = _4833;
            }
            if ((!_4803) || _4785)
            {
                _4785 = false;
                _4795 = _4689;
                _4797 = _4691;
                _4799 = _4693;
                _4801 = _4695;
                _4803 = true;
            }
        }
        else
        {
            float _4835 = _606 + _4705;
            float _4837 = _608 + _4707;
            float _4839 = _610 + _4709;
            float _4841 = _4711 + 1.0;
            _4795 = _4689;
            _4797 = _4691;
            _4799 = _4693;
            _4801 = _4695;
            _4771 = _4835;
            _4773 = _4837;
            _4775 = _4839;
            _4777 = _4841;
        }
    }
    _4803 = false;
    float _4843 = _4755;
    float _4845 = _4757;
    float _4847 = _4759;
    float _4849 = _4761;
    float _4851 = _4795;
    float _4853 = _4797;
    float _4855 = _4799;
    float _4857 = _4801;
    float _4859 = _4763;
    float _4861 = _4765;
    float _4863 = _4767;
    float _4865 = _4769;
    float _4867 = _4771;
    float _4869 = _4773;
    float _4871 = _4775;
    float _4873 = _4777;
    float _4875 = -_2928;
    float _4877 = _616 + _4875;
    float _4879 = -_2932;
    float _4881 = _614 + _4879;
    float _4883 = _2942 * _4877;
    float _4885 = -_2936;
    float _4887 = _618 + _4885;
    float _4889 = fma(_2946, _4881, _4883);
    float _4891 = fma(_2950, _4887, _4889);
    float _4893 = _2978 * _4891;
    float _4895 = rint(_4893);
    float _4897 = precise::max(0.0, _4895);
    float _4899 = precise::min(_4897, 3.0);
    float _4901 = trunc(_4899);
    int _4903 = int(_4901);
    bool _4905 = _4903 >= 2;
    bool _4907 = !_4905;
    float _4909 = as_type<float>(_4903);
    float _4911 = _4895;
    float _4913 = _4889;
    float _4915 = _4883;
    float _4917 = _4843;
    float _4919 = _4845;
    float _4921 = _4847;
    float _4923 = _4849;
    float _4925 = _4859;
    float _4927 = _4861;
    float _4929 = _4863;
    float _4931 = _4865;
    float _4933 = _4867;
    float _4935 = _4869;
    float _4937 = _4871;
    float _4939 = _4873;
    float _4957;
    float _4959;
    float _4961;
    float _4963;
    if (!_4907)
    {
        bool _4941 = _4903 >= 3;
        bool _4943 = !_4941;
        if (!_4943)
        {
            bool _4945 = _4903 != 3;
            _4947 = _4945;
            if (!_4947)
            {
                float _4949 = _614 + _4843;
                float _4951 = _616 + _4845;
                float _4953 = _618 + _4847;
                float _4955 = _4849 + 1.0;
                _4917 = _4949;
                _4919 = _4951;
                _4921 = _4953;
                _4923 = _4955;
                _4957 = _4851;
                _4959 = _4853;
                _4961 = _4855;
                _4963 = _4857;
                _4965 = true;
            }
        }
        else
        {
            float _4967 = _614 + _4859;
            float _4969 = _616 + _4861;
            float _4971 = _618 + _4863;
            float _4973 = _4865 + 1.0;
            _4957 = _4851;
            _4959 = _4853;
            _4961 = _4855;
            _4963 = _4857;
            _4925 = _4967;
            _4927 = _4969;
            _4929 = _4971;
            _4931 = _4973;
            _4965 = true;
        }
    }
    if ((!_4965) || _4947)
    {
        bool _4975;
        if (!_4947)
        {
            _4975 = _4903 >= 1;
        }
        if ((!_4975) || _4947)
        {
            if (!_4947)
            {
                bool _4977 = _4903 != 0;
                if (!_4977)
                {
                    float _4979 = _614 + _4851;
                    _4909 = _4979;
                }
                float _4981 = _4909;
                _4957 = _4981;
                if (!_4977)
                {
                    float _4983 = _616 + _4853;
                    _4911 = _4983;
                }
                float _4985 = _4911;
                _4959 = _4985;
                if (!_4977)
                {
                    float _4987 = _618 + _4855;
                    _4913 = _4987;
                }
                float _4989 = _4913;
                _4961 = _4989;
                if (!_4977)
                {
                    float _4991 = _4857 + 1.0;
                    _4915 = _4991;
                }
                float _4993 = _4915;
                bool _4995 = !_4977;
                _4963 = _4993;
                _4965 = _4995;
            }
            if ((!_4965) || _4947)
            {
                _4947 = false;
                _4957 = _4851;
                _4959 = _4853;
                _4961 = _4855;
                _4963 = _4857;
                _4965 = true;
            }
        }
        else
        {
            float _4997 = _614 + _4867;
            float _4999 = _616 + _4869;
            float _5001 = _618 + _4871;
            float _5003 = _4873 + 1.0;
            _4957 = _4851;
            _4959 = _4853;
            _4961 = _4855;
            _4963 = _4857;
            _4933 = _4997;
            _4935 = _4999;
            _4937 = _5001;
            _4939 = _5003;
        }
    }
    _4965 = false;
    float _5005 = _4917;
    float _5007 = _4919;
    float _5009 = _4921;
    float _5011 = _4923;
    float _5013 = _4957;
    float _5015 = _4959;
    float _5017 = _4961;
    float _5019 = _4963;
    float _5021 = _4925;
    float _5023 = _4927;
    float _5025 = _4929;
    float _5027 = _4931;
    float _5029 = _4933;
    float _5031 = _4935;
    float _5033 = _4937;
    float _5035 = _4939;
    float _5037 = -_2928;
    float _5039 = _624 + _5037;
    float _5041 = -_2932;
    float _5043 = _622 + _5041;
    float _5045 = _2942 * _5039;
    float _5047 = -_2936;
    float _5049 = _626 + _5047;
    float _5051 = fma(_2946, _5043, _5045);
    float _5053 = fma(_2950, _5049, _5051);
    float _5055 = _2978 * _5053;
    float _5057 = rint(_5055);
    float _5059 = precise::max(0.0, _5057);
    float _5061 = precise::min(_5059, 3.0);
    float _5063 = trunc(_5061);
    int _5065 = int(_5063);
    bool _5067 = _5065 >= 2;
    bool _5069 = !_5067;
    float _5071 = as_type<float>(_5065);
    float _5073 = _5057;
    float _5075 = _5051;
    float _5077 = _5045;
    float _5079 = _5005;
    float _5081 = _5007;
    float _5083 = _5009;
    float _5085 = _5011;
    float _5087 = _5021;
    float _5089 = _5023;
    float _5091 = _5025;
    float _5093 = _5027;
    float _5095 = _5029;
    float _5097 = _5031;
    float _5099 = _5033;
    float _5101 = _5035;
    float _5119;
    float _5121;
    float _5123;
    float _5125;
    if (!_5069)
    {
        bool _5103 = _5065 >= 3;
        bool _5105 = !_5103;
        if (!_5105)
        {
            bool _5107 = _5065 != 3;
            _5109 = _5107;
            if (!_5109)
            {
                float _5111 = _622 + _5005;
                float _5113 = _624 + _5007;
                float _5115 = _626 + _5009;
                float _5117 = _5011 + 1.0;
                _5079 = _5111;
                _5081 = _5113;
                _5083 = _5115;
                _5085 = _5117;
                _5119 = _5013;
                _5121 = _5015;
                _5123 = _5017;
                _5125 = _5019;
                _5127 = true;
            }
        }
        else
        {
            float _5129 = _622 + _5021;
            float _5131 = _624 + _5023;
            float _5133 = _626 + _5025;
            float _5135 = _5027 + 1.0;
            _5119 = _5013;
            _5121 = _5015;
            _5123 = _5017;
            _5125 = _5019;
            _5087 = _5129;
            _5089 = _5131;
            _5091 = _5133;
            _5093 = _5135;
            _5127 = true;
        }
    }
    if ((!_5127) || _5109)
    {
        bool _5137;
        if (!_5109)
        {
            _5137 = _5065 >= 1;
        }
        if ((!_5137) || _5109)
        {
            if (!_5109)
            {
                bool _5139 = _5065 != 0;
                if (!_5139)
                {
                    float _5141 = _622 + _5013;
                    _5071 = _5141;
                }
                float _5143 = _5071;
                _5119 = _5143;
                if (!_5139)
                {
                    float _5145 = _624 + _5015;
                    _5073 = _5145;
                }
                float _5147 = _5073;
                _5121 = _5147;
                if (!_5139)
                {
                    float _5149 = _626 + _5017;
                    _5075 = _5149;
                }
                float _5151 = _5075;
                _5123 = _5151;
                if (!_5139)
                {
                    float _5153 = _5019 + 1.0;
                    _5077 = _5153;
                }
                float _5155 = _5077;
                bool _5157 = !_5139;
                _5125 = _5155;
                _5127 = _5157;
            }
            if ((!_5127) || _5109)
            {
                _5109 = false;
                _5119 = _5013;
                _5121 = _5015;
                _5123 = _5017;
                _5125 = _5019;
                _5127 = true;
            }
        }
        else
        {
            float _5159 = _622 + _5029;
            float _5161 = _624 + _5031;
            float _5163 = _626 + _5033;
            float _5165 = _5035 + 1.0;
            _5119 = _5013;
            _5121 = _5015;
            _5123 = _5017;
            _5125 = _5019;
            _5095 = _5159;
            _5097 = _5161;
            _5099 = _5163;
            _5101 = _5165;
        }
    }
    _5127 = false;
    float _5167 = _5079;
    float _5169 = _5081;
    float _5171 = _5083;
    float _5173 = _5085;
    float _5175 = _5119;
    float _5177 = _5121;
    float _5179 = _5123;
    float _5181 = _5125;
    float _5183 = _5087;
    float _5185 = _5089;
    float _5187 = _5091;
    float _5189 = _5093;
    float _5191 = _5095;
    float _5193 = _5097;
    float _5195 = _5099;
    float _5197 = _5101;
    float _5199 = -_2928;
    float _5201 = _632 + _5199;
    float _5203 = -_2932;
    float _5205 = _630 + _5203;
    float _5207 = _2942 * _5201;
    float _5209 = -_2936;
    float _5211 = _634 + _5209;
    float _5213 = fma(_2946, _5205, _5207);
    float _5215 = fma(_2950, _5211, _5213);
    float _5217 = _2978 * _5215;
    float _5219 = rint(_5217);
    float _5221 = precise::max(0.0, _5219);
    float _5223 = precise::min(_5221, 3.0);
    float _5225 = trunc(_5223);
    int _5227 = int(_5225);
    bool _5229 = _5227 >= 2;
    bool _5231 = !_5229;
    float _5233 = as_type<float>(_5227);
    float _5235 = _5219;
    float _5237 = _5213;
    float _5239 = _5207;
    float _5241 = _5167;
    float _5243 = _5169;
    float _5245 = _5171;
    float _5247 = _5173;
    float _5249 = _5183;
    float _5251 = _5185;
    float _5253 = _5187;
    float _5255 = _5189;
    float _5257 = _5191;
    float _5259 = _5193;
    float _5261 = _5195;
    float _5263 = _5197;
    float _5281;
    float _5283;
    float _5285;
    float _5287;
    if (!_5231)
    {
        bool _5265 = _5227 >= 3;
        bool _5267 = !_5265;
        if (!_5267)
        {
            bool _5269 = _5227 != 3;
            _5271 = _5269;
            if (!_5271)
            {
                float _5273 = _630 + _5167;
                float _5275 = _632 + _5169;
                float _5277 = _634 + _5171;
                float _5279 = _5173 + 1.0;
                _5241 = _5273;
                _5243 = _5275;
                _5245 = _5277;
                _5247 = _5279;
                _5281 = _5175;
                _5283 = _5177;
                _5285 = _5179;
                _5287 = _5181;
                _5289 = true;
            }
        }
        else
        {
            float _5291 = _630 + _5183;
            float _5293 = _632 + _5185;
            float _5295 = _634 + _5187;
            float _5297 = _5189 + 1.0;
            _5281 = _5175;
            _5283 = _5177;
            _5285 = _5179;
            _5287 = _5181;
            _5249 = _5291;
            _5251 = _5293;
            _5253 = _5295;
            _5255 = _5297;
            _5289 = true;
        }
    }
    if ((!_5289) || _5271)
    {
        bool _5299;
        if (!_5271)
        {
            _5299 = _5227 >= 1;
        }
        if ((!_5299) || _5271)
        {
            if (!_5271)
            {
                bool _5301 = _5227 != 0;
                if (!_5301)
                {
                    float _5303 = _630 + _5175;
                    _5233 = _5303;
                }
                float _5305 = _5233;
                _5281 = _5305;
                if (!_5301)
                {
                    float _5307 = _632 + _5177;
                    _5235 = _5307;
                }
                float _5309 = _5235;
                _5283 = _5309;
                if (!_5301)
                {
                    float _5311 = _634 + _5179;
                    _5237 = _5311;
                }
                float _5313 = _5237;
                _5285 = _5313;
                if (!_5301)
                {
                    float _5315 = _5181 + 1.0;
                    _5239 = _5315;
                }
                float _5317 = _5239;
                bool _5319 = !_5301;
                _5287 = _5317;
                _5289 = _5319;
            }
            if ((!_5289) || _5271)
            {
                _5271 = false;
                _5281 = _5175;
                _5283 = _5177;
                _5285 = _5179;
                _5287 = _5181;
                _5289 = true;
            }
        }
        else
        {
            float _5321 = _630 + _5191;
            float _5323 = _632 + _5193;
            float _5325 = _634 + _5195;
            float _5327 = _5197 + 1.0;
            _5281 = _5175;
            _5283 = _5177;
            _5285 = _5179;
            _5287 = _5181;
            _5257 = _5321;
            _5259 = _5323;
            _5261 = _5325;
            _5263 = _5327;
        }
    }
    _5289 = false;
    float _5329 = _5241;
    float _5331 = _5243;
    float _5333 = _5245;
    float _5335 = _5247;
    float _5337 = _5281;
    float _5339 = _5283;
    float _5341 = _5285;
    float _5343 = _5287;
    float _5345 = _5249;
    float _5347 = _5251;
    float _5349 = _5253;
    float _5351 = _5255;
    float _5353 = _5257;
    float _5355 = _5259;
    float _5357 = _5261;
    float _5359 = _5263;
    float _5361 = -_2928;
    float _5363 = _640 + _5361;
    float _5365 = -_2932;
    float _5367 = _638 + _5365;
    float _5369 = _2942 * _5363;
    float _5371 = -_2936;
    float _5373 = _642 + _5371;
    float _5375 = fma(_2946, _5367, _5369);
    float _5377 = fma(_2950, _5373, _5375);
    float _5379 = _2978 * _5377;
    float _5381 = rint(_5379);
    float _5383 = precise::max(0.0, _5381);
    float _5385 = precise::min(_5383, 3.0);
    float _5387 = trunc(_5385);
    int _5389 = int(_5387);
    bool _5391 = _5389 >= 2;
    bool _5393 = !_5391;
    float _5395 = as_type<float>(_5389);
    float _5397 = _5373;
    float _5399 = _5381;
    float _5401 = _5375;
    float _5403 = _5359;
    float _5405 = _5351;
    float _5407 = _5345;
    float _5409 = _5335;
    float _5411 = _5353;
    float _5413 = _5357;
    float _5415 = _5347;
    float _5417 = _5349;
    float _5419 = _5355;
    float _5421 = _5331;
    float _5423 = _5329;
    float _5425 = _5333;
    float _5443;
    float _5445;
    float _5447;
    float _5449;
    if (!_5393)
    {
        bool _5427 = _5389 >= 3;
        bool _5429 = !_5427;
        if (!_5429)
        {
            bool _5431 = _5389 != 3;
            _5433 = _5431;
            if (!_5433)
            {
                float _5435 = _638 + _5329;
                float _5437 = _640 + _5331;
                float _5439 = _642 + _5333;
                float _5441 = _5335 + 1.0;
                _5443 = _5343;
                _5409 = _5441;
                _5445 = _5337;
                _5447 = _5341;
                _5449 = _5339;
                _5421 = _5437;
                _5423 = _5435;
                _5425 = _5439;
                _5451 = true;
            }
        }
        else
        {
            float _5453 = _638 + _5345;
            float _5455 = _640 + _5347;
            float _5457 = _642 + _5349;
            float _5459 = _5351 + 1.0;
            _5405 = _5459;
            _5407 = _5453;
            _5443 = _5343;
            _5445 = _5337;
            _5415 = _5455;
            _5417 = _5457;
            _5447 = _5341;
            _5449 = _5339;
            _5451 = true;
        }
    }
    if ((!_5451) || _5433)
    {
        bool _5461;
        if (!_5433)
        {
            _5461 = _5389 >= 1;
        }
        if ((!_5461) || _5433)
        {
            if (!_5433)
            {
                bool _5463 = _5389 != 0;
                if (!_5463)
                {
                    float _5465 = _638 + _5337;
                    _5395 = _5465;
                }
                float _5467 = _5395;
                _5445 = _5467;
                if (!_5463)
                {
                    float _5469 = _640 + _5339;
                    _5397 = _5469;
                }
                float _5471 = _5397;
                _5449 = _5471;
                if (!_5463)
                {
                    float _5473 = _642 + _5341;
                    _5399 = _5473;
                }
                float _5475 = _5399;
                _5447 = _5475;
                if (!_5463)
                {
                    float _5477 = _5343 + 1.0;
                    _5401 = _5477;
                }
                float _5479 = _5401;
                bool _5481 = !_5463;
                _5443 = _5479;
                _5451 = _5481;
            }
            if ((!_5451) || _5433)
            {
                _5433 = false;
                _5443 = _5343;
                _5445 = _5337;
                _5447 = _5341;
                _5449 = _5339;
                _5451 = true;
            }
        }
        else
        {
            float _5483 = _638 + _5353;
            float _5485 = _640 + _5355;
            float _5487 = _642 + _5357;
            float _5489 = _5359 + 1.0;
            _5403 = _5489;
            _5443 = _5343;
            _5411 = _5483;
            _5413 = _5487;
            _5445 = _5337;
            _5419 = _5485;
            _5447 = _5341;
            _5449 = _5339;
        }
    }
    _5451 = false;
    float _5491 = _5403;
    float _5493 = _5405;
    float _5495 = _5407;
    float _5497 = _5443;
    float _5499 = _5409;
    float _5501 = _5411;
    float _5503 = _5413;
    float _5505 = _5445;
    float _5507 = _5415;
    float _5509 = _5417;
    float _5511 = _5419;
    float _5513 = _5447;
    float _5515 = _5449;
    float _5517 = _5421;
    float _5519 = _5423;
    float _5521 = _5425;
    float _5523 = _5491 * 4.0;
    float _5525 = fma(_5493, 4.0, _5491);
    float _5527 = _5493 + _5491;
    float _5529 = _5495 * 6.0;
    float _5531 = fma(_5497, 9.0, _5523);
    float _5533 = fma(_5499, 9.0, _5525);
    float _5535 = _5501 * 6.0;
    float _5537 = _5527 * 2.0;
    float _5539 = _5531 + _5493;
    float _5541 = _5503 * 6.0;
    float _5543 = fma(_5505, 9.0, _5535);
    float _5545 = _5507 * 6.0;
    float _5547 = _5539 * _5533;
    float _5549 = _5509 * 6.0;
    float _5551 = fma(_5501, 3.0, _5529);
    float _5553 = fma(_5511, 3.0, _5545);
    float _5555 = -_5547;
    float _5557 = fma(_5537, _5537, _5555);
    float _5559 = _5511 * 6.0;
    float _5561 = fma(_5513, 9.0, _5541);
    float _5563 = fma(_5503, 3.0, _5549);
    bool _5565 = _5557 != 0.0;
    bool _5567 = isnan(_5557);
    bool _5569 = _5565 || _5567;
    bool _5571 = isnan(0.0);
    bool _5573 = _5569 || _5571;
    float _5575 = fma(_5515, 9.0, _5559);
    float _5577 = fma(_5517, 9.0, _5553);
    float _5579 = fma(_5495, 3.0, _5543);
    float _5581 = fma(_5509, 3.0, _5561);
    float _5583 = fma(_5507, 3.0, _5575);
    float _5585 = fma(_5519, 9.0, _5551);
    float _5587 = fma(_5521, 9.0, _5563);
    bool _5589 = !_5573;
    if (!_5589)
    {
        float _5591 = 1.0 / _5557;
        float _5593 = _5579 * _5533;
        float _5595 = _5539 * _5585;
        float _5597 = _5539 * _5587;
        float _5599 = -_5593;
        float _5601 = fma(_5585, _5537, _5599);
        float _5603 = -_5595;
        float _5605 = fma(_5579, _5537, _5603);
        float _5607 = _5583 * _5533;
        float _5609 = _5539 * _5577;
        float _5611 = _5581 * _5533;
        float _5613 = -_5597;
        float _5615 = fma(_5581, _5537, _5613);
        float _5617 = -_5607;
        float _5619 = fma(_5577, _5537, _5617);
        float _5621 = -_5609;
        float _5623 = fma(_5583, _5537, _5621);
        float _5625 = -_5611;
        float _5627 = fma(_5587, _5537, _5625);
        float _5629 = _5615 * _5591;
        float _5631 = _5605 * _5591;
        float _5633 = _5623 * _5591;
        float _5635 = _5601 * _5591;
        float _5637 = _5619 * _5591;
        float _5639 = _5627 * _5591;
        float _5641 = -_5635;
        float _5643 = _5631 + _5641;
        float _5645 = -_5637;
        float _5647 = _5633 + _5645;
        float _5649 = -_5639;
        float _5651 = _5629 + _5649;
        _2997 = _5643;
        _2999 = _5647;
        _3001 = _5651;
        _3003 = _5635;
        _3005 = _5631;
        _3007 = _5637;
        _3009 = _5633;
        _3011 = _5629;
        _3013 = _5639;
    }
    float _5653 = _2997;
    float _5655 = _2999;
    float _5657 = _3001;
    float _5659 = _3003;
    float _5661 = _3005;
    float _5663 = _3007;
    float _5665 = _3009;
    float _5667 = _3011;
    float _5669 = _3013;
    float _5671 = fma(_5653, 496.0, 0.5);
    float _5673 = precise::clamp(_5671, 0.0, 1.0);
    float _5675 = fma(_5653, -31.0, 1.0);
    float _5677 = precise::clamp(_5675, 0.0, 1.0);
    float _5679 = _5673 + (-0.5);
    float _5681 = fma(_5655, 1008.0, 0.5);
    float _5683 = precise::clamp(_5681, 0.0, 1.0);
    float _5685 = fma(_5657, 496.0, 0.5);
    float _5687 = precise::clamp(_5685, 0.0, 1.0);
    float _5689 = fma(_5655, -63.0, 1.0);
    float _5691 = precise::clamp(_5689, 0.0, 1.0);
    float _5693 = _5677 * _5679;
    float _5695 = _5683 + (-0.5);
    float _5697 = fma(_5657, -31.0, 1.0);
    float _5699 = precise::clamp(_5697, 0.0, 1.0);
    float _5701 = _5687 + (-0.5);
    float _5703 = fma(_5693, -0.0322580635547637939453125, _5659);
    float _5705 = precise::clamp(_5703, 0.0, 1.0);
    float _5707 = _5691 * _5695;
    float _5709 = _5707 * 2.0;
    float _5711 = fma(_5693, 0.0322580635547637939453125, _5661);
    float _5713 = precise::clamp(_5711, 0.0, 1.0);
    float _5715 = _5699 * _5701;
    float _5717 = _5705 * 31.0;
    float _5719 = fma(_5709, -0.01587301678955554962158203125, _5663);
    float _5721 = precise::clamp(_5719, 0.0, 1.0);
    float _5723 = fma(_5709, 0.01587301678955554962158203125, _5665);
    float _5725 = precise::clamp(_5723, 0.0, 1.0);
    float _5727 = _5713 * 31.0;
    float _5729 = fma(_5715, 0.0322580635547637939453125, _5667);
    float _5731 = precise::clamp(_5729, 0.0, 1.0);
    float _5733 = _5721 * 63.0;
    float _5735 = _5725 * 63.0;
    float _5737 = fma(_5715, -0.0322580635547637939453125, _5669);
    float _5739 = precise::clamp(_5737, 0.0, 1.0);
    float _5741 = _5731 * 31.0;
    float _5743 = rint(_5727);
    float _5745 = _5739 * 31.0;
    float _5747 = rint(_5735);
    float _5749 = rint(_5717);
    float _5751 = rint(_5733);
    float _5753 = _5747 + 0.5;
    float _5755 = rint(_5741);
    float _5757 = _5743 + 0.5;
    float _5759 = _5749 + 0.5;
    float _5761 = rint(_5745);
    float _5763 = _5751 + 0.5;
    float _5765 = _5755 + 0.5;
    float _5767 = trunc(_5757);
    float _5769 = precise::max(_5767, 0.0);
    uint _5771 = uint(_5769);
    float _5773 = _5761 + 0.5;
    float _5775 = trunc(_5753);
    float _5777 = precise::max(_5775, 0.0);
    uint _5779 = uint(_5777);
    float _5781 = trunc(_5759);
    float _5783 = precise::max(_5781, 0.0);
    uint _5785 = uint(_5783);
    int _5787 = int(_5771) << 11;
    float _5789 = trunc(_5763);
    float _5791 = precise::max(_5789, 0.0);
    uint _5793 = uint(_5791);
    int _5795 = int(_5779) << 5;
    float _5797 = trunc(_5765);
    float _5799 = precise::max(_5797, 0.0);
    uint _5801 = uint(_5799);
    int _5803 = int(_5785) << 11;
    float _5805 = trunc(_5773);
    float _5807 = precise::max(_5805, 0.0);
    uint _5809 = uint(_5807);
    int _5811 = int(_5793) << 5;
    int _5813 = _5787 | _5795;
    int _5815 = int(_5801) | _5813;
    int _5817 = _5803 | _5811;
    int _5819 = int(_5809) | _5817;
    bool _5821 = _5815 != _5819;
    int _5823 = _5811;
    int _5825 = _5787;
    int _5827 = int(_5785);
    int _5829 = _5815;
    if (!_5821)
    {
        _5823 = _5815;
    }
    int _5831 = _5823;
    int _5833 = _5831;
    if (!_5821)
    {
        _5825 = 0;
    }
    int _5835 = _5825;
    int _5837 = _5835;
    if (!_5821)
    {
        _5827 = 0;
    }
    int _5839 = _5827;
    bool _5841 = !_5821;
    int _5843 = _5839;
    if (!_5841)
    {
        float _5845 = _5743 * 0.0322580635547637939453125;
        float _5847 = _5749 * 0.0322580635547637939453125;
        float _5849 = _5747 * 0.01587301678955554962158203125;
        bool _5851 = uint(_5815) >= uint(_5819);
        float _5853 = _5751 * 0.01587301678955554962158203125;
        float _5855 = _5755 * 0.0322580635547637939453125;
        float _5857 = _5761 * 0.0322580635547637939453125;
        bool _5859 = !_5851;
        float _5861 = _5859 ? _5845 : _5847;
        bool _5863 = !_5851;
        float _5865 = _5863 ? _5847 : _5845;
        bool _5867 = !_5851;
        float _5869 = _5867 ? _5849 : _5853;
        float _5871 = -_5861;
        float _5873 = _574 + _5871;
        bool _5875 = !_5851;
        float _5877 = _5875 ? _5853 : _5849;
        float _5879 = -_5861;
        float _5881 = _5879 + _5865;
        bool _5883 = !_5851;
        float _5885 = _5883 ? _5855 : _5857;
        float _5887 = -_5861;
        float _5889 = _566 + _5887;
        bool _5891 = !_5851;
        float _5893 = _5891 ? _5857 : _5855;
        float _5895 = -_5869;
        float _5897 = _5895 + _5877;
        float _5899 = -_5861;
        float _5901 = _558 + _5899;
        float _5903 = -_5861;
        float _5905 = _550 + _5903;
        float _5907 = -_5861;
        float _5909 = _542 + _5907;
        float _5911 = _5897 * _5897;
        float _5913 = -_5885;
        float _5915 = _5913 + _5893;
        float _5917 = -_5861;
        float _5919 = _534 + _5917;
        float _5921 = -_5861;
        float _5923 = _526 + _5921;
        float _5925 = fma(_5881, _5881, _5911);
        float _5927 = -_5861;
        float _5929 = _506 + _5927;
        float _5931 = -_5861;
        float _5933 = _638 + _5931;
        float _5935 = -_5861;
        float _5937 = _630 + _5935;
        float _5939 = fma(_5915, _5915, _5925);
        float _5941 = -_5861;
        float _5943 = _622 + _5941;
        float _5945 = -_5861;
        float _5947 = _614 + _5945;
        float _5949 = -_5861;
        float _5951 = _606 + _5949;
        float _5953 = -_5861;
        float _5955 = _598 + _5953;
        float _5957 = -_5861;
        float _5959 = _590 + _5957;
        float _5961 = -_5861;
        float _5963 = _582 + _5961;
        float _5965 = -_5869;
        float _5967 = _576 + _5965;
        float _5969 = 1.0 / _5939;
        float _5971 = -_5869;
        float _5973 = _640 + _5971;
        float _5975 = -_5885;
        float _5977 = _578 + _5975;
        float _5979 = -_5869;
        float _5981 = _568 + _5979;
        float _5983 = -_5869;
        float _5985 = _608 + _5983;
        float _5987 = -_5869;
        float _5989 = _600 + _5987;
        float _5991 = -_5885;
        float _5993 = _642 + _5991;
        float _5995 = -_5869;
        float _5997 = _632 + _5995;
        float _5999 = -_5869;
        float _6001 = _560 + _5999;
        float _6003 = -_5869;
        float _6005 = _552 + _6003;
        float _6007 = -_5869;
        float _6009 = _544 + _6007;
        float _6011 = -_5869;
        float _6013 = _536 + _6011;
        float _6015 = -_5869;
        float _6017 = _528 + _6015;
        float _6019 = -_5869;
        float _6021 = _508 + _6019;
        float _6023 = -_5869;
        float _6025 = _624 + _6023;
        float _6027 = -_5869;
        float _6029 = _616 + _6027;
        float _6031 = _5897 * _5969;
        float _6033 = _5881 * _5969;
        float _6035 = _5915 * _5969;
        float _6037 = -_5869;
        float _6039 = _592 + _6037;
        float _6041 = _6031 * _5967;
        float _6043 = _6031 * _5973;
        float _6045 = _6031 * _5981;
        float _6047 = _6031 * _5985;
        float _6049 = fma(_6033, _5873, _6041);
        float _6051 = fma(_6033, _5933, _6043);
        float _6053 = _6031 * _5989;
        float _6055 = -_5869;
        float _6057 = _584 + _6055;
        float _6059 = fma(_6035, _5977, _6049);
        float _6061 = fma(_6035, _5993, _6051);
        float _6063 = -_5885;
        float _6065 = _570 + _6063;
        float _6067 = _6031 * _5997;
        float _6069 = fma(_6033, _5889, _6045);
        bool _6071 = _6059 >= 0.5;
        float _6073 = -_5885;
        float _6075 = _610 + _6073;
        float _6077 = -_5885;
        float _6079 = _602 + _6077;
        float _6081 = fma(_6033, _5951, _6047);
        float _6083 = fma(_6033, _5955, _6053);
        float _6085 = -_5885;
        float _6087 = _634 + _6085;
        float _6089 = _6031 * _6001;
        float _6091 = _6031 * _6005;
        float _6093 = _6031 * _6009;
        float _6095 = _6031 * _6013;
        float _6097 = _6031 * _6017;
        float _6099 = _6031 * _6021;
        float _6101 = _6031 * _6025;
        float _6103 = _6031 * _6029;
        float _6105 = _6031 * _6039;
        float _6107 = _6031 * _6057;
        float _6109 = fma(_6033, _5937, _6067);
        float _6111 = fma(_6035, _6065, _6069);
        bool _6113 = _6061 >= 0.5;
        float _6115 = -_5885;
        float _6117 = _562 + _6115;
        bool _6119 = _6059 >= 0.833000004291534423828125;
        float _6121 = -_5885;
        float _6123 = _554 + _6121;
        float _6125 = -_5885;
        float _6127 = _546 + _6125;
        float _6129 = -_5885;
        float _6131 = _538 + _6129;
        float _6133 = -_5885;
        float _6135 = _530 + _6133;
        float _6137 = -_5885;
        float _6139 = _510 + _6137;
        float _6141 = -_5885;
        float _6143 = _626 + _6141;
        float _6145 = -_5885;
        float _6147 = _618 + _6145;
        float _6149 = -_5885;
        float _6151 = _594 + _6149;
        float _6153 = fma(_6035, _6075, _6081);
        float _6155 = fma(_6035, _6079, _6083);
        float _6157 = -_5885;
        float _6159 = _586 + _6157;
        float _6161 = fma(_6033, _5901, _6089);
        float _6163 = fma(_6033, _5905, _6091);
        float _6165 = fma(_6033, _5909, _6093);
        float _6167 = fma(_6033, _5919, _6095);
        float _6169 = fma(_6033, _5923, _6097);
        float _6171 = fma(_6033, _5929, _6099);
        float _6173 = fma(_6033, _5943, _6101);
        float _6175 = fma(_6033, _5947, _6103);
        float _6177 = fma(_6033, _5959, _6105);
        float _6179 = fma(_6033, _5963, _6107);
        float _6181 = fma(_6035, _6087, _6109);
        bool _6183 = _6059 >= 0.16599999368190765380859375;
        float _6185 = fma(_6035, _6117, _6161);
        float _6187 = fma(_6035, _6123, _6163);
        int _6189 = _6119 ? 0 : 32768;
        float _6191 = fma(_6035, _6127, _6165);
        bool _6193 = _6061 >= 0.833000004291534423828125;
        float _6195 = fma(_6035, _6131, _6167);
        bool _6197 = _6111 >= 0.5;
        float _6199 = fma(_6035, _6135, _6169);
        float _6201 = fma(_6035, _6139, _6171);
        float _6203 = fma(_6035, _6143, _6173);
        float _6205 = fma(_6035, _6147, _6175);
        float _6207 = fma(_6035, _6151, _6177);
        float _6209 = fma(_6035, _6159, _6179);
        int _6211 = _6189;
        if (!_6071)
        {
            int _6213 = _6183 ? 49152 : 16384;
            _6211 = _6213;
        }
        int _6215 = _6211;
        bool _6217 = _6061 >= 0.16599999368190765380859375;
        int _6219 = _6193 ? 0 : 32768;
        bool _6221 = _6181 >= 0.5;
        bool _6223 = _6111 >= 0.833000004291534423828125;
        int _6225 = _6219;
        if (!_6113)
        {
            int _6227 = _6217 ? 49152 : 16384;
            _6225 = _6227;
        }
        int _6229 = _6225;
        bool _6231 = _6111 >= 0.16599999368190765380859375;
        bool _6233 = _6181 >= 0.833000004291534423828125;
        int _6235 = _6223 ? 0 : 8192;
        bool _6237 = _6185 >= 0.5;
        bool _6239 = _6181 >= 0.16599999368190765380859375;
        int _6241 = _6233 ? 0 : 8192;
        int _6243 = _6235;
        int _6245 = _6241;
        if (!_6197)
        {
            int _6247 = _6231 ? 12288 : 4096;
            _6243 = _6247;
        }
        int _6249 = _6243;
        bool _6251 = _6185 >= 0.833000004291534423828125;
        bool _6253 = _6203 >= 0.5;
        if (!_6221)
        {
            int _6255 = _6239 ? 12288 : 4096;
            _6245 = _6255;
        }
        int _6257 = _6245;
        int _6259 = _6251 ? 0 : 2048;
        bool _6261 = _6185 >= 0.16599999368190765380859375;
        bool _6263 = _6203 >= 0.833000004291534423828125;
        bool _6265 = _6187 >= 0.5;
        bool _6267 = _6203 >= 0.16599999368190765380859375;
        int _6269 = _6263 ? 0 : 2048;
        int _6271 = _6259;
        int _6273 = _6269;
        if (!_6237)
        {
            int _6275 = _6261 ? 3072 : 1024;
            _6271 = _6275;
        }
        int _6277 = _6271;
        bool _6279 = _6187 >= 0.833000004291534423828125;
        bool _6281 = _6205 >= 0.5;
        if (!_6253)
        {
            int _6283 = _6267 ? 3072 : 1024;
            _6273 = _6283;
        }
        int _6285 = _6273;
        bool _6287 = _6187 >= 0.16599999368190765380859375;
        int _6289 = _6279 ? 0 : 512;
        bool _6291 = _6191 >= 0.5;
        bool _6293 = _6205 >= 0.833000004291534423828125;
        int _6295 = _6289;
        if (!_6265)
        {
            int _6297 = _6287 ? 768 : 256;
            _6295 = _6297;
        }
        int _6299 = _6295;
        bool _6301 = _6205 >= 0.16599999368190765380859375;
        bool _6303 = _6153 >= 0.5;
        int _6305 = _6293 ? 0 : 512;
        bool _6307 = _6191 >= 0.833000004291534423828125;
        int _6309 = _6305;
        if (!_6281)
        {
            int _6311 = _6301 ? 768 : 256;
            _6309 = _6311;
        }
        int _6313 = _6309;
        bool _6315 = _6191 >= 0.16599999368190765380859375;
        bool _6317 = _6153 >= 0.833000004291534423828125;
        int _6319 = _6307 ? 0 : 128;
        bool _6321 = _6153 >= 0.16599999368190765380859375;
        bool _6323 = _6195 >= 0.5;
        int _6325 = _6317 ? 0 : 128;
        int _6327 = _6319;
        int _6329 = _6325;
        if (!_6291)
        {
            int _6331 = _6315 ? 192 : 64;
            _6327 = _6331;
        }
        int _6333 = _6327;
        bool _6335 = _6195 >= 0.833000004291534423828125;
        bool _6337 = _6155 >= 0.5;
        if (!_6303)
        {
            int _6339 = _6321 ? 192 : 64;
            _6329 = _6339;
        }
        int _6341 = _6329;
        int _6343 = _6335 ? 0 : 32;
        bool _6345 = _6199 >= 0.5;
        bool _6347 = _6195 >= 0.16599999368190765380859375;
        bool _6349 = _6155 >= 0.833000004291534423828125;
        bool _6351 = _6155 >= 0.16599999368190765380859375;
        int _6353 = _6349 ? 0 : 32;
        int _6355 = _6343;
        int _6357 = _6353;
        if (!_6323)
        {
            int _6359 = _6347 ? 48 : 16;
            _6355 = _6359;
        }
        int _6361 = _6355;
        bool _6363 = _6199 >= 0.833000004291534423828125;
        bool _6365 = _6207 >= 0.5;
        if (!_6337)
        {
            int _6367 = _6351 ? 48 : 16;
            _6357 = _6367;
        }
        int _6369 = _6357;
        bool _6371 = _6199 >= 0.16599999368190765380859375;
        bool _6373 = _6207 >= 0.833000004291534423828125;
        int _6375 = _6363 ? 0 : 8;
        int _6377 = _6373 ? 0 : 8;
        int _6379 = _6375;
        int _6381 = _6377;
        if (!_6345)
        {
            int _6383 = _6371 ? 12 : 4;
            _6379 = _6383;
        }
        int _6385 = _6379;
        bool _6387 = _6201 >= 0.5;
        bool _6389 = _6209 >= 0.5;
        bool _6391 = _6207 >= 0.16599999368190765380859375;
        int _6393 = _6277 + _6215;
        int _6395 = _6393 + _6249;
        int _6397 = _6285 + _6229;
        int _6399 = _6397 + _6257;
        if (!_6365)
        {
            int _6401 = _6391 ? 12 : 4;
            _6381 = _6401;
        }
        int _6403 = _6381;
        bool _6405 = _6201 >= 0.833000004291534423828125;
        bool _6407 = _6209 >= 0.833000004291534423828125;
        bool _6409 = _6201 >= 0.16599999368190765380859375;
        bool _6411 = _6209 >= 0.16599999368190765380859375;
        int _6413 = _6333 + _6395;
        int _6415 = _6413 + _6299;
        int _6417 = _6341 + _6399;
        int _6419 = _6417 + _6313;
        int _6421 = _6405 ? 0 : 2;
        int _6423 = _6407 ? 0 : 2;
        int _6425 = _6421;
        int _6427 = _6423;
        if (!_6387)
        {
            int _6429 = _6409 ? 3 : 1;
            _6425 = _6429;
        }
        int _6431 = _6425;
        if (!_6389)
        {
            int _6433 = _6411 ? 3 : 1;
            _6427 = _6433;
        }
        int _6435 = _6427;
        int _6437 = _6385 + _6415;
        int _6439 = _6437 + _6361;
        int _6441 = _6403 + _6419;
        int _6443 = _6441 + _6369;
        bool _6445 = !_5851;
        int _6447 = _6445 ? _5819 : _5815;
        bool _6449 = !_5851;
        int _6451 = _6449 ? _5815 : _5819;
        int _6453 = _6439 + _6431;
        int _6455 = _6443 + _6435;
        _5833 = _6447;
        _5829 = _6451;
        _5837 = _6453;
        _5843 = _6455;
    }
    int _6457 = _5833;
    int _6459 = _5829;
    int _6461 = _5837;
    int _6463 = _5843;
    out.m_36.x = as_type<float>(_6457);
    out.m_36.y = as_type<float>(_6459);
    out.m_36.z = as_type<float>(_6461);
    out.m_36.w = as_type<float>(_6463);
    return main0_out_u{as_type<uint4>(out.m_36)};
}

