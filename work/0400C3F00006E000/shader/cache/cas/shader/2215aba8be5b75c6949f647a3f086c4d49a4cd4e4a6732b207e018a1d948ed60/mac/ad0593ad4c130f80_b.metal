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
    texture2d<float> fp_t_tcb_A [[id(7)]];
    sampler fp_t_tcb_ASmplr [[id(8)]];
    texturecube<float> fp_t_tcb_1E [[id(9)]];
    sampler fp_t_tcb_1ESmplr [[id(10)]];
    sampler fp_t_tcb_10Smplr_w [[id(11)]];
    sampler fp_t_tcb_8Smplr_w [[id(12)]];
    sampler fp_t_tcb_ASmplr_w [[id(13)]];
    sampler fp_t_tcb_1ESmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_60 [[color(0)]];
};

struct main0_in
{
    float4 m_53 [[user(locn0)]];
    float4 m_55 [[user(locn1)]];
    float4 m_57 [[user(locn2)]];
    float4 m_66 [[user(locn3)]];
    float4 m_51 [[user(locn4), flat]];
    float4 m_49 [[user(locn5)]];
    float4 m_47 [[user(locn6)]];
    float4 m_43 [[user(locn7), flat]];
    float4 m_62 [[user(locn8)]];
    float4 m_68 [[user(locn9)]];
    float4 m_64 [[user(locn10)]];
    float4 m_70 [[user(locn11)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _77 = in.m_43.x;
    float _79 = gl_FragCoord.w;
    float _81 = in.m_47.w;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[22].x;
    float _89 = in.m_47.x;
    float _91 = gl_FragCoord.w;
    float _93 = _89 * _91;
    float _95 = in.m_47.y;
    float _97 = gl_FragCoord.w;
    float _99 = _95 * _97;
    float _101 = in.m_49.x;
    float _103 = gl_FragCoord.w;
    float _105 = _101 * _103;
    float _107 = in.m_49.z;
    float _109 = gl_FragCoord.w;
    float _111 = _107 * _109;
    float _113 = in.m_49.y;
    float _115 = gl_FragCoord.w;
    float _117 = _113 * _115;
    float _119 = in.m_49.w;
    float _121 = gl_FragCoord.w;
    float _123 = _119 * _121;
    float _125 = _77 + 1.0;
    float _127 = 1.0 / _79;
    float _129 = _125 * _87;
    float _131 = rint(_77);
    float _133 = precise::max(_131, 0.0);
    uint _136 = uint(_133);
    uint _138 = clamp(_136, 0u, 65535u);
    float _140 = floor(_129);
    float _142 = _127 * _85;
    float _144 = _127 * _105;
    float _146 = _127 * _111;
    float _148 = _127 * _117;
    float _150 = _127 * _123;
    float _152 = 1.0 / _142;
    float _154 = -_140;
    float _156 = fma(_154, (*spvDescriptorSet0.fp_c9)._m0[22].x, _125);
    float _158 = _127 * _93;
    float _160 = _127 * _99;
    float _162 = rint(_156);
    float _164 = precise::max(_162, 0.0);
    uint _166 = uint(_164);
    uint _168 = clamp(_166, 0u, 65535u);
    float _170 = _158 * _152;
    float _172 = _160 * _152;
    float2 _771 = float2(_170, _172);
    float _174 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_771, float2(0.0), isnan(_771))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_771, float2(0.0), isnan(_771))).x;
    float3 _784 = float3(_144, _148, float(int(_138)));
    float3 _788 = select(_784, float3(0.0), isnan(_784));
    float4 _177 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _788.xy, uint(rint(_788.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _788.xy, uint(rint(_788.z))).xyzw;
    float _179 = _177.x;
    float _181 = _177.y;
    float _183 = _177.z;
    float _185 = _177.w;
    float3 _805 = float3(_144, _148, float(int(_168)));
    float3 _807 = select(_805, float3(0.0), isnan(_805));
    float4 _187 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _807.xy, uint(rint(_807.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _807.xy, uint(rint(_807.z))).xyzw;
    float _189 = _187.x;
    float _191 = _187.y;
    float _193 = _187.z;
    float _195 = _187.w;
    float2 _821 = float2(_146, _150);
    float4 _197 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_821, float2(0.0), isnan(_821))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_821, float2(0.0), isnan(_821))).xyzw;
    float _199 = _197.x;
    float _201 = _197.y;
    float _203 = _197.z;
    float _205 = _197.w;
    float _207 = in.m_51.y;
    float _209 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[22].y;
    float _211 = in.m_47.z;
    float _213 = gl_FragCoord.w;
    float _215 = _211 * _213;
    float _217 = in.m_53.w;
    float _219 = gl_FragCoord.w;
    float _221 = _217 * _219;
    float _223 = in.m_55.w;
    float _225 = gl_FragCoord.w;
    float _227 = _223 * _225;
    float _229 = _207 * _209;
    float _231 = _127 * _215;
    float _233 = _229 * _209;
    float _235 = _231 * _152;
    float _237 = floor(_233);
    float _239 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _241 = fma(_235, (*spvDescriptorSet0.fp_c8)._m0[30].w, _239);
    float _243 = 1.0 / _241;
    float _245 = -_237;
    float _247 = fma(_245, (*spvDescriptorSet0.fp_c9)._m0[22].y, _229);
    float _249 = in.m_57.x;
    float _251 = gl_FragCoord.w;
    float _253 = _249 * _251;
    float _255 = _247 + 9.9999997473787516355514526367188e-05;
    float _257 = floor(_255);
    float _259 = -_257;
    float _261 = _255 + _259;
    float _263 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _265 = in.m_55.y;
    float _267 = gl_FragCoord.w;
    float _269 = _265 * _267;
    float _271 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _273 = fma(_174, (*spvDescriptorSet0.fp_c8)._m0[30].w, _271);
    float _275 = 1.0 / _273;
    float _277 = -_185;
    float _279 = _277 + _195;
    float _281 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _283 = _243 * _281;
    float _285 = fma(_261, _279, _185);
    float _287 = _127 * _221;
    float _289 = _285 * _205;
    float _291 = _289 * _287;
    float _293 = _127 * _227;
    float _295 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _297 = -_283;
    float _299 = fma(_275, _295, _297);
    float _301 = _293 * _291;
    float _303 = _299 * _263;
    float _305 = precise::clamp(_303, 0.0, 1.0);
    float _307 = _127 * _253;
    float _309 = 0.0 + _301;
    float _311 = precise::clamp(_309, 0.0, 1.0);
    float _313 = _311 * _305;
    float _315 = _313 * _307;
    bool _319 = _315 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _321 = isnan(_315);
    bool _323 = _319 || _321;
    bool _325 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _327 = _323 || _325;
    float _329 = in.m_53.x;
    float _331 = gl_FragCoord.w;
    float _333 = _329 * _331;
    float _335 = in.m_55.x;
    float _337 = gl_FragCoord.w;
    float _339 = _335 * _337;
    float _341 = in.m_53.y;
    float _343 = gl_FragCoord.w;
    float _345 = _341 * _343;
    float _347 = in.m_53.z;
    float _349 = gl_FragCoord.w;
    float _351 = _347 * _349;
    float _353 = in.m_55.z;
    float _355 = gl_FragCoord.w;
    float _357 = _353 * _355;
    float _359 = _283;
    if (!_327)
    {
        discard_fragment();
    }
    float _361 = -_181;
    float _363 = _361 + _191;
    float _365 = -_179;
    float _367 = _365 + _189;
    float _369 = -_183;
    float _371 = _369 + _193;
    float _373 = _201 * _201;
    float _375 = fma(_261, _363, _181);
    float _377 = fma(_261, _367, _179);
    float _379 = _199 * _199;
    float _381 = fma(_261, _371, _183);
    float _383 = _375 * _375;
    float _385 = _377 * _377;
    float _387 = _127 * _269;
    float _389 = _381 * _381;
    float _391 = _383 * _373;
    float _393 = _385 * _379;
    float _395 = _203 * _203;
    float _397 = _127 * _333;
    float _399 = _127 * _339;
    float _401 = _127 * _345;
    float _403 = _127 * _351;
    float _405 = _127 * _357;
    float _407 = _389 * _395;
    float _409 = -_399;
    float _411 = _397 + _409;
    float _413 = -_387;
    float _415 = _401 + _413;
    float _417 = -_405;
    float _419 = _403 + _417;
    float _421 = fma(_393, _411, _399);
    float _423 = fma(_391, _415, _387);
    float _425 = fma(_407, _419, _405);
    if (!_327)
    {
        out.m_60.x = _421;
        out.m_60.y = _423;
        out.m_60.z = _425;
        out.m_60.w = _301;
        return out;
    }
    float _427 = in.m_62.y;
    float _429 = gl_FragCoord.w;
    float _431 = _427 * _429;
    float _433 = in.m_62.x;
    float _435 = gl_FragCoord.w;
    float _437 = _433 * _435;
    float _439 = in.m_62.z;
    float _441 = gl_FragCoord.w;
    float _443 = _439 * _441;
    float _445 = _127 * _431;
    float _447 = _127 * _437;
    float _449 = _127 * _443;
    float _451 = _445 * _445;
    float _453 = in.m_64.x;
    float _455 = gl_FragCoord.w;
    float _457 = _453 * _455;
    float _459 = fma(_447, _447, _451);
    float _461 = fma(_449, _449, _459);
    float _463 = rsqrt(_461);
    float _465 = _447 * _463;
    float _467 = _445 * _463;
    float _469 = _449 * _463;
    float _471 = _127 * _457;
    float _473 = abs(_465);
    float _475 = abs(_467);
    float _477 = precise::max(_473, _475);
    float _479 = precise::min(_471, 1.0);
    float _481 = abs(_469);
    float _483 = precise::max(_481, _477);
    float _485 = 1.0 / _483;
    float _487 = -_485;
    float _489 = _469 * _487;
    float _491 = _465 * _485;
    float _493 = _467 * _485;
    float3 _1248 = float3(_491, _493, _489);
    float3 _497 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1248, float3(0.0), isnan(_1248)), level(_479)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1248, float3(0.0), isnan(_1248)), level(_479)).xyz;
    float _499 = _497.x;
    float _501 = _497.y;
    float _503 = _497.z;
    float _505 = in.m_66.x;
    float _507 = gl_FragCoord.w;
    float _509 = _505 * _507;
    float _511 = in.m_66.z;
    float _513 = gl_FragCoord.w;
    float _515 = _511 * _513;
    float _517 = in.m_66.y;
    float _519 = gl_FragCoord.w;
    float _521 = _517 * _519;
    float _523 = in.m_68.z;
    float _525 = gl_FragCoord.w;
    float _527 = _523 * _525;
    float _529 = in.m_68.x;
    float _531 = gl_FragCoord.w;
    float _533 = _529 * _531;
    float _535 = in.m_68.y;
    float _537 = gl_FragCoord.w;
    float _539 = _535 * _537;
    float _541 = in.m_70.x;
    float _543 = gl_FragCoord.w;
    float _545 = _541 * _543;
    float _547 = in.m_70.y;
    float _549 = gl_FragCoord.w;
    float _551 = _547 * _549;
    float _553 = in.m_70.z;
    float _555 = gl_FragCoord.w;
    float _557 = _553 * _555;
    float _559 = in.m_70.w;
    float _561 = gl_FragCoord.w;
    float _563 = _559 * _561;
    bool _565 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    if (_565)
    {
        float _567 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _569 = _283 + _567;
        _359 = _569;
    }
    float _571 = _359;
    float _573 = _127 * _509;
    float _575 = _127 * _515;
    float _577 = _127 * _527;
    float _579 = _127 * _533;
    float _581 = _127 * _539;
    float _583 = _127 * _551;
    float _585 = fma(_499, 0.20999999344348907470703125, _573);
    float _587 = _127 * _521;
    float _589 = fma(_503, 0.20999999344348907470703125, _575);
    float _591 = _575;
    if (_565)
    {
        float _593 = _571 * 8.0;
        float _595 = precise::clamp(_593, 0.0, 1.0);
        _591 = _595;
    }
    float _597 = _591;
    float _599 = _585 + _579;
    float _601 = fma(_501, 0.20999999344348907470703125, _587);
    float _603 = _589 + _577;
    float _605 = 0.0 + _315;
    float _607 = precise::clamp(_605, 0.0, 1.0);
    float _609 = _127 * _545;
    float _611 = _601 + _581;
    float _613 = _127 * _557;
    float _615 = _127 * _563;
    float _617 = _421 * _599;
    float _619 = _423 * _611;
    float _621 = _425 * _603;
    float _623 = _607;
    if (_565)
    {
        float _625 = _607 * _597;
        _623 = _625;
    }
    float _627 = _623;
    float _629 = fma(_617, _615, _609);
    float _631 = fma(_619, _615, _583);
    float _633 = fma(_621, _615, _613);
    float _635 = 0.0 + _627;
    float _637 = precise::clamp(_635, 0.0, 1.0);
    out.m_60.x = _629;
    out.m_60.y = _631;
    out.m_60.z = _633;
    out.m_60.w = _637;
    return out;
}

