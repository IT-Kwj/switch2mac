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
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_10 [[id(5)]];
    sampler fp_t_tcb_10Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_C [[id(7)]];
    sampler fp_t_tcb_CSmplr [[id(8)]];
    texture2d_array<float> fp_t_tcb_A [[id(9)]];
    sampler fp_t_tcb_ASmplr [[id(10)]];
    texturecube<float> fp_t_tcb_1E [[id(11)]];
    sampler fp_t_tcb_1ESmplr [[id(12)]];
    sampler fp_t_tcb_8Smplr_w [[id(13)]];
    sampler fp_t_tcb_10Smplr_w [[id(14)]];
    sampler fp_t_tcb_CSmplr_w [[id(15)]];
    sampler fp_t_tcb_ASmplr_w [[id(16)]];
    sampler fp_t_tcb_1ESmplr_w [[id(17)]];
    constant dm_border_t* dm_border [[id(18)]];
};

struct main0_out
{
    float4 m_64 [[color(0)]];
};

struct main0_in
{
    float4 m_57 [[user(locn0)]];
    float4 m_59 [[user(locn1)]];
    float4 m_61 [[user(locn2)]];
    float4 m_70 [[user(locn3)]];
    float4 m_55 [[user(locn4), flat]];
    float4 m_47 [[user(locn5)]];
    float4 m_51 [[user(locn6)]];
    float4 m_49 [[user(locn7)]];
    float4 m_53 [[user(locn8), flat]];
    float4 m_66 [[user(locn9)]];
    float4 m_72 [[user(locn10)]];
    float4 m_68 [[user(locn11)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _79 = gl_FragCoord.w;
    float _81 = in.m_47.y;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = in.m_47.x;
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
    float _117 = in.m_49.x;
    float _119 = gl_FragCoord.w;
    float _121 = _117 * _119;
    float _123 = 1.0 / _79;
    float _125 = _123 * _85;
    float _127 = _123 * _91;
    float _129 = _123 * _97;
    float _131 = _123 * _103;
    float _133 = _123 * _109;
    float _135 = _123 * _115;
    float2 _615 = float2(_127, _125);
    float2 _139 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_615, float2(0.0), isnan(_615))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_615, float2(0.0), isnan(_615))).xy;
    float _141 = _139.x;
    float _143 = _139.y;
    float _145 = _123 * _121;
    float _147 = 1.0 / _131;
    float _149 = _133 * _147;
    float _151 = _135 * _147;
    float2 _641 = float2(_149, _151);
    float _153 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_641, float2(0.0), isnan(_641))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_641, float2(0.0), isnan(_641))).x;
    float2 _649 = float2(_145, _129);
    float _155 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_649, float2(0.0), isnan(_649))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_649, float2(0.0), isnan(_649))).w;
    float _157 = in.m_53.y;
    float _159 = in.m_55.x;
    float _161 = in.m_47.w;
    float _163 = gl_FragCoord.w;
    float _165 = _161 * _163;
    float _167 = in.m_47.z;
    float _169 = gl_FragCoord.w;
    float _171 = _167 * _169;
    float _173 = rint(_157);
    float _175 = precise::max(_173, 0.0);
    uint _178 = uint(_175);
    uint _180 = clamp(_178, 0u, 65535u);
    float _182 = _159 * (*spvDescriptorSet0.fp_c9)._m0[21].x;
    float _184 = _159 * (*spvDescriptorSet0.fp_c9)._m0[21].y;
    float _186 = _123 * _165;
    float _188 = _123 * _171;
    float _190 = fma(_184, _143, _186);
    float _192 = fma(_182, _141, _188);
    float3 _714 = float3(_192, _190, float(int(_180)));
    float3 _718 = select(_714, float3(0.0), isnan(_714));
    float4 _195 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _718.xy, uint(rint(_718.z))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _718.xy, uint(rint(_718.z))).xyzw;
    float _197 = _195.x;
    float _199 = _195.y;
    float _201 = _195.z;
    float _203 = _195.w;
    float _205 = in.m_51.z;
    float _207 = gl_FragCoord.w;
    float _209 = _205 * _207;
    float _211 = in.m_57.w;
    float _213 = gl_FragCoord.w;
    float _215 = _211 * _213;
    float _217 = in.m_59.w;
    float _219 = gl_FragCoord.w;
    float _221 = _217 * _219;
    float _223 = in.m_61.x;
    float _225 = gl_FragCoord.w;
    float _227 = _223 * _225;
    float _229 = _123 * _209;
    float _231 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _233 = _123 * _215;
    float _235 = _229 * _147;
    float _237 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _239 = fma(_235, (*spvDescriptorSet0.fp_c8)._m0[30].w, _237);
    float _241 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _243 = fma(_153, (*spvDescriptorSet0.fp_c8)._m0[30].w, _241);
    float _245 = 1.0 / _239;
    float _247 = 1.0 / _243;
    float _249 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _251 = _245 * _249;
    float _253 = in.m_57.y;
    float _255 = gl_FragCoord.w;
    float _257 = _253 * _255;
    float _259 = in.m_57.x;
    float _261 = gl_FragCoord.w;
    float _263 = _259 * _261;
    float _265 = in.m_59.x;
    float _267 = gl_FragCoord.w;
    float _269 = _265 * _267;
    float _271 = in.m_59.z;
    float _273 = gl_FragCoord.w;
    float _275 = _271 * _273;
    float _277 = _123 * _269;
    float _279 = _203 + _155;
    float _281 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _283 = -_251;
    float _285 = fma(_247, _281, _283);
    float _287 = _123 * _227;
    float _289 = -_233;
    float _291 = _279 + _289;
    float _293 = _123 * _221;
    float _295 = _285 * _231;
    float _297 = precise::clamp(_295, 0.0, 1.0);
    float _299 = _293 * _291;
    float _301 = 0.0 + _299;
    float _303 = precise::clamp(_301, 0.0, 1.0);
    float _305 = _303 * _297;
    float _307 = _305 * _287;
    bool _311 = _307 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _313 = isnan(_307);
    bool _315 = _311 || _313;
    bool _317 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _319 = _315 || _317;
    float _321 = in.m_59.y;
    float _323 = gl_FragCoord.w;
    float _325 = _321 * _323;
    float _327 = in.m_57.z;
    float _329 = gl_FragCoord.w;
    float _331 = _327 * _329;
    float _333 = _251;
    if (!_319)
    {
        discard_fragment();
    }
    float _335 = _123 * _263;
    float _337 = _123 * _257;
    float _339 = _123 * _275;
    float _341 = -_277;
    float _343 = _335 + _341;
    float _345 = fma(_197, _343, _277);
    float _347 = _123 * _325;
    float _349 = _123 * _331;
    float _351 = -_347;
    float _353 = _337 + _351;
    float _355 = -_339;
    float _357 = _349 + _355;
    float _359 = fma(_199, _353, _347);
    float _361 = fma(_201, _357, _339);
    if (!_319)
    {
        out.m_64.x = _345;
        out.m_64.y = _359;
        out.m_64.z = _361;
        out.m_64.w = _299;
        return out;
    }
    float _363 = in.m_66.y;
    float _365 = gl_FragCoord.w;
    float _367 = _363 * _365;
    float _369 = in.m_66.x;
    float _371 = gl_FragCoord.w;
    float _373 = _369 * _371;
    float _375 = in.m_66.z;
    float _377 = gl_FragCoord.w;
    float _379 = _375 * _377;
    float _381 = in.m_68.x;
    float _383 = gl_FragCoord.w;
    float _385 = _381 * _383;
    float _387 = _123 * _367;
    float _389 = _123 * _373;
    float _391 = _123 * _379;
    float _393 = _387 * _387;
    float _395 = fma(_389, _389, _393);
    float _397 = fma(_391, _391, _395);
    float _399 = rsqrt(_397);
    float _401 = _389 * _399;
    float _403 = _387 * _399;
    float _405 = _391 * _399;
    float _407 = abs(_401);
    float _409 = abs(_403);
    float _411 = precise::max(_407, _409);
    float _413 = abs(_405);
    float _415 = precise::max(_413, _411);
    float _417 = _123 * _385;
    float _419 = 1.0 / _415;
    float _421 = _403 * _419;
    float _423 = -_419;
    float _425 = _405 * _423;
    float _427 = precise::min(_417, 1.0);
    float _429 = _401 * _419;
    float3 _1052 = float3(_429, _421, _425);
    float3 _433 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1052, float3(0.0), isnan(_1052)), level(_427)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1052, float3(0.0), isnan(_1052)), level(_427)).xyz;
    float _435 = _433.x;
    float _437 = _433.y;
    float _439 = _433.z;
    float _441 = in.m_70.y;
    float _443 = gl_FragCoord.w;
    float _445 = _441 * _443;
    float _447 = in.m_70.z;
    float _449 = gl_FragCoord.w;
    float _451 = _447 * _449;
    float _453 = in.m_70.x;
    float _455 = gl_FragCoord.w;
    float _457 = _453 * _455;
    float _459 = in.m_72.x;
    float _461 = gl_FragCoord.w;
    float _463 = _459 * _461;
    float _465 = in.m_72.y;
    float _467 = gl_FragCoord.w;
    float _469 = _465 * _467;
    float _471 = in.m_72.z;
    float _473 = gl_FragCoord.w;
    float _475 = _471 * _473;
    bool _477 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    if (_477)
    {
        float _479 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _481 = _251 + _479;
        _333 = _481;
    }
    float _483 = _333;
    float _485 = _123 * _445;
    float _487 = _123 * _451;
    float _489 = _123 * _457;
    float _491 = _123 * _463;
    float _493 = _123 * _469;
    float _495 = _123 * _475;
    float _497 = fma(_437, 0.20999999344348907470703125, _485);
    float _499 = fma(_439, 0.20999999344348907470703125, _487);
    float _501 = fma(_435, 0.20999999344348907470703125, _489);
    float _503 = 0.0 + _307;
    float _505 = precise::clamp(_503, 0.0, 1.0);
    float _507 = _485;
    float _509 = _505;
    if (_477)
    {
        float _511 = _483 * 8.0;
        float _513 = precise::clamp(_511, 0.0, 1.0);
        _507 = _513;
    }
    float _515 = _507;
    float _517 = _497 + _493;
    float _519 = _501 + _491;
    float _521 = _499 + _495;
    if (_477)
    {
        float _523 = _505 * _515;
        _509 = _523;
    }
    float _525 = _509;
    float _527 = _359 * _517;
    float _529 = _345 * _519;
    float _531 = _361 * _521;
    float _533 = 0.0 + _525;
    float _535 = precise::clamp(_533, 0.0, 1.0);
    out.m_64.x = _529;
    out.m_64.y = _527;
    out.m_64.z = _531;
    out.m_64.w = _535;
    return out;
}

