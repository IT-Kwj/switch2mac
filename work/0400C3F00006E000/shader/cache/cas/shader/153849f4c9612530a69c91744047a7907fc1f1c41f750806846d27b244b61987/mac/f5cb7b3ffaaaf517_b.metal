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
    float4 m_53 [[user(locn1)]];
    float4 m_55 [[user(locn2)]];
    float4 m_64 [[user(locn3)]];
    float4 m_49 [[user(locn4), flat]];
    float4 m_47 [[user(locn5)]];
    float4 m_45 [[user(locn6)]];
    float4 m_43 [[user(locn7), flat]];
    float4 m_60 [[user(locn8)]];
    float4 m_66 [[user(locn9)]];
    float4 m_62 [[user(locn10)]];
    float4 m_68 [[user(locn11)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _75 = gl_FragCoord.w;
    float _77 = in.m_43.x;
    float _79 = in.m_45.w;
    float _81 = gl_FragCoord.w;
    float _83 = _79 * _81;
    float _85 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[22].x;
    float _87 = in.m_45.x;
    float _89 = gl_FragCoord.w;
    float _91 = _87 * _89;
    float _93 = in.m_45.y;
    float _95 = gl_FragCoord.w;
    float _97 = _93 * _95;
    float _99 = in.m_47.x;
    float _101 = gl_FragCoord.w;
    float _103 = _99 * _101;
    float _105 = in.m_47.y;
    float _107 = gl_FragCoord.w;
    float _109 = _105 * _107;
    float _111 = 1.0 / _75;
    float _113 = _77 + 1.0;
    float _115 = _113 * _85;
    float _117 = rint(_77);
    float _119 = precise::max(_117, 0.0);
    uint _122 = uint(_119);
    uint _124 = clamp(_122, 0u, 65535u);
    float _126 = floor(_115);
    float _128 = _111 * _83;
    float _130 = _111 * _103;
    float _132 = 1.0 / _128;
    float _134 = -_126;
    float _136 = fma(_134, (*spvDescriptorSet0.fp_c9)._m0[22].x, _113);
    float _138 = _111 * _91;
    float _140 = _111 * _97;
    float _142 = rint(_136);
    float _144 = precise::max(_142, 0.0);
    uint _146 = uint(_144);
    uint _148 = clamp(_146, 0u, 65535u);
    float _150 = _138 * _132;
    float _152 = _140 * _132;
    float _154 = _111 * _109;
    float2 _708 = float2(_150, _152);
    float _156 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_708, float2(0.0), isnan(_708))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_708, float2(0.0), isnan(_708))).x;
    float3 _721 = float3(_130, _154, float(int(_124)));
    float3 _725 = select(_721, float3(0.0), isnan(_721));
    float4 _159 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _725.xy, uint(rint(_725.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _725.xy, uint(rint(_725.z))).xyzw;
    float _161 = _159.x;
    float _163 = _159.y;
    float _165 = _159.z;
    float _167 = _159.w;
    float3 _742 = float3(_130, _154, float(int(_148)));
    float3 _744 = select(_742, float3(0.0), isnan(_742));
    float4 _169 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _744.xy, uint(rint(_744.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _744.xy, uint(rint(_744.z))).xyzw;
    float _171 = _169.x;
    float _173 = _169.y;
    float _175 = _169.z;
    float _177 = _169.w;
    float _179 = in.m_49.y;
    float _181 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[22].y;
    float _183 = in.m_45.z;
    float _185 = gl_FragCoord.w;
    float _187 = _183 * _185;
    float _189 = in.m_51.w;
    float _191 = gl_FragCoord.w;
    float _193 = _189 * _191;
    float _195 = in.m_53.w;
    float _197 = gl_FragCoord.w;
    float _199 = _195 * _197;
    float _201 = in.m_55.x;
    float _203 = gl_FragCoord.w;
    float _205 = _201 * _203;
    float _207 = _179 * _181;
    float _209 = _207 * _181;
    float _211 = floor(_209);
    float _213 = _111 * _187;
    float _215 = _213 * _132;
    float _217 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _219 = fma(_215, (*spvDescriptorSet0.fp_c8)._m0[30].w, _217);
    float _221 = 1.0 / _219;
    float _223 = -_211;
    float _225 = fma(_223, (*spvDescriptorSet0.fp_c9)._m0[22].y, _207);
    float _227 = _225 + 9.9999997473787516355514526367188e-05;
    float _229 = floor(_227);
    float _231 = -_229;
    float _233 = _227 + _231;
    float _235 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _237 = _221 * _235;
    float _239 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _241 = in.m_51.y;
    float _243 = gl_FragCoord.w;
    float _245 = _241 * _243;
    float _247 = in.m_53.z;
    float _249 = gl_FragCoord.w;
    float _251 = _247 * _249;
    float _253 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _255 = fma(_156, (*spvDescriptorSet0.fp_c8)._m0[30].w, _253);
    float _257 = 1.0 / _255;
    float _259 = -_167;
    float _261 = _259 + _177;
    float _263 = fma(_233, _261, _167);
    float _265 = _111 * _193;
    float _267 = _263 * _265;
    float _269 = _111 * _199;
    float _271 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _273 = -_237;
    float _275 = fma(_257, _271, _273);
    float _277 = _269 * _267;
    float _279 = _111 * _205;
    float _281 = _275 * _239;
    float _283 = precise::clamp(_281, 0.0, 1.0);
    float _285 = 0.0 + _277;
    float _287 = precise::clamp(_285, 0.0, 1.0);
    float _289 = _287 * _283;
    float _291 = _289 * _279;
    bool _295 = _291 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _297 = isnan(_291);
    bool _299 = _295 || _297;
    bool _301 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _303 = _299 || _301;
    float _305 = in.m_51.x;
    float _307 = gl_FragCoord.w;
    float _309 = _305 * _307;
    float _311 = in.m_53.x;
    float _313 = gl_FragCoord.w;
    float _315 = _311 * _313;
    float _317 = in.m_53.y;
    float _319 = gl_FragCoord.w;
    float _321 = _317 * _319;
    float _323 = in.m_51.z;
    float _325 = gl_FragCoord.w;
    float _327 = _323 * _325;
    float _329 = _111;
    if (!_303)
    {
        discard_fragment();
    }
    float _331 = -_161;
    float _333 = _331 + _171;
    float _335 = -_163;
    float _337 = _335 + _173;
    float _339 = -_165;
    float _341 = _339 + _175;
    float _343 = fma(_233, _333, _161);
    float _345 = fma(_233, _337, _163);
    float _347 = _111 * _245;
    float _349 = _111 * _251;
    float _351 = fma(_233, _341, _165);
    float _353 = _343 * _343;
    float _355 = _351 * _351;
    float _357 = _111 * _309;
    float _359 = _111 * _315;
    float _361 = _111 * _321;
    float _363 = _111 * _327;
    float _365 = -_359;
    float _367 = _357 + _365;
    float _369 = -_361;
    float _371 = _347 + _369;
    float _373 = -_349;
    float _375 = _363 + _373;
    float _377 = _345 * _345;
    float _379 = fma(_353, _367, _359);
    float _381 = fma(_355, _375, _349);
    float _383 = fma(_377, _371, _361);
    if (!_303)
    {
        out.m_58.x = _379;
        out.m_58.y = _383;
        out.m_58.z = _381;
        out.m_58.w = _277;
        return out;
    }
    float _385 = in.m_60.y;
    float _387 = gl_FragCoord.w;
    float _389 = _385 * _387;
    float _391 = in.m_60.x;
    float _393 = gl_FragCoord.w;
    float _395 = _391 * _393;
    float _397 = in.m_60.z;
    float _399 = gl_FragCoord.w;
    float _401 = _397 * _399;
    float _403 = _111 * _389;
    float _405 = _111 * _395;
    float _407 = _111 * _401;
    float _409 = _403 * _403;
    float _411 = in.m_62.x;
    float _413 = gl_FragCoord.w;
    float _415 = _411 * _413;
    float _417 = fma(_405, _405, _409);
    float _419 = fma(_407, _407, _417);
    float _421 = rsqrt(_419);
    float _423 = _405 * _421;
    float _425 = _403 * _421;
    float _427 = _407 * _421;
    float _429 = _111 * _415;
    float _431 = abs(_423);
    float _433 = abs(_425);
    float _435 = precise::max(_431, _433);
    float _437 = precise::min(_429, 1.0);
    float _439 = abs(_427);
    float _441 = precise::max(_439, _435);
    float _443 = 1.0 / _441;
    float _445 = _423 * _443;
    float _447 = _425 * _443;
    float _449 = -_443;
    float _451 = _427 * _449;
    float3 _1149 = float3(_445, _447, _451);
    float3 _455 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1149, float3(0.0), isnan(_1149)), level(_437)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1149, float3(0.0), isnan(_1149)), level(_437)).xyz;
    float _457 = _455.x;
    float _459 = _455.y;
    float _461 = _455.z;
    float _463 = in.m_64.x;
    float _465 = gl_FragCoord.w;
    float _467 = _463 * _465;
    float _469 = in.m_64.z;
    float _471 = gl_FragCoord.w;
    float _473 = _469 * _471;
    float _475 = in.m_64.y;
    float _477 = gl_FragCoord.w;
    float _479 = _475 * _477;
    float _481 = in.m_66.x;
    float _483 = gl_FragCoord.w;
    float _485 = _481 * _483;
    float _487 = in.m_66.y;
    float _489 = gl_FragCoord.w;
    float _491 = _487 * _489;
    float _493 = in.m_66.z;
    float _495 = gl_FragCoord.w;
    float _497 = _493 * _495;
    float _499 = in.m_68.x;
    float _501 = gl_FragCoord.w;
    float _503 = _499 * _501;
    float _505 = in.m_68.y;
    float _507 = gl_FragCoord.w;
    float _509 = _505 * _507;
    float _511 = in.m_68.z;
    float _513 = gl_FragCoord.w;
    float _515 = _511 * _513;
    float _517 = in.m_68.w;
    float _519 = gl_FragCoord.w;
    float _521 = _517 * _519;
    bool _523 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _525 = _111 * _467;
    float _527 = _111 * _479;
    float _529 = _111 * _485;
    float _531 = _111 * _491;
    float _533 = _111 * _497;
    float _535 = _111 * _509;
    float _537 = _111 * _515;
    float _539 = _111 * _521;
    float _541 = fma(_457, 0.20999999344348907470703125, _525);
    float _543 = _111 * _473;
    float _545 = _111 * _503;
    float _547 = fma(_459, 0.20999999344348907470703125, _527);
    if (_523)
    {
        float _549 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _551 = _237 + _549;
        _329 = _551;
    }
    float _553 = _329;
    float _555 = fma(_461, 0.20999999344348907470703125, _543);
    float _557 = _541 + _529;
    float _559 = _547 + _531;
    float _561 = _553;
    if (_523)
    {
        float _563 = _553 * 8.0;
        float _565 = precise::clamp(_563, 0.0, 1.0);
        _561 = _565;
    }
    float _567 = _561;
    float _569 = _555 + _533;
    float _571 = 0.0 + _291;
    float _573 = precise::clamp(_571, 0.0, 1.0);
    float _575 = _379 * _557;
    float _577 = _383 * _559;
    float _579 = _381 * _569;
    float _581 = _573;
    if (_523)
    {
        float _583 = _573 * _567;
        _581 = _583;
    }
    float _585 = _581;
    float _587 = fma(_575, _539, _545);
    float _589 = fma(_577, _539, _535);
    float _591 = fma(_579, _539, _537);
    float _593 = 0.0 + _585;
    float _595 = precise::clamp(_593, 0.0, 1.0);
    out.m_58.x = _587;
    out.m_58.y = _589;
    out.m_58.z = _591;
    out.m_58.w = _595;
    return out;
}

