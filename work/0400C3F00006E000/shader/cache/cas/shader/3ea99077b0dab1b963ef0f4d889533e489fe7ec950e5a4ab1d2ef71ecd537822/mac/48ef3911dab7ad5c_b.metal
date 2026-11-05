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
    float4 m_56 [[color(0)]];
};

struct main0_in
{
    float4 m_49 [[user(locn0)]];
    float4 m_51 [[user(locn1)]];
    float4 m_47 [[user(locn2)]];
    float4 m_43 [[user(locn3)]];
    float4 m_62 [[user(locn4)]];
    float4 m_53 [[user(locn5)]];
    float4 m_45 [[user(locn6), flat]];
    float4 m_58 [[user(locn7)]];
    float4 m_64 [[user(locn8)]];
    float4 m_60 [[user(locn9)]];
    float4 m_66 [[user(locn10)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _73 = gl_FragCoord.w;
    float _75 = in.m_43.w;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_43.y;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = in.m_43.x;
    float _89 = gl_FragCoord.w;
    float _91 = _87 * _89;
    float _93 = in.m_45.x;
    float _95 = in.m_47.y;
    float _97 = gl_FragCoord.w;
    float _99 = _95 * _97;
    float _101 = in.m_47.x;
    float _103 = gl_FragCoord.w;
    float _105 = _101 * _103;
    float _107 = 1.0 / _73;
    float _109 = rint(_93);
    float _111 = precise::max(_109, 0.0);
    uint _114 = uint(_111);
    uint _116 = clamp(_114, 0u, 65535u);
    float _118 = _107 * _79;
    float _120 = _107 * _85;
    float _122 = _107 * _91;
    float _124 = _107 * _99;
    float _126 = 1.0 / _118;
    float _128 = _107 * _105;
    float _130 = _120 * _126;
    float _132 = _122 * _126;
    float2 _603 = float2(_132, _130);
    float _134 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_603, float2(0.0), isnan(_603))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_603, float2(0.0), isnan(_603))).x;
    float3 _616 = float3(_128, _124, float(int(_116)));
    float3 _620 = select(_616, float3(0.0), isnan(_616));
    float4 _137 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _620.xy, uint(rint(_620.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _620.xy, uint(rint(_620.z))).xyzw;
    float _139 = _137.x;
    float _141 = _137.y;
    float _143 = _137.z;
    float _145 = _137.w;
    float _147 = in.m_43.z;
    float _149 = gl_FragCoord.w;
    float _151 = _147 * _149;
    float _153 = in.m_49.w;
    float _155 = gl_FragCoord.w;
    float _157 = _153 * _155;
    float _159 = in.m_51.w;
    float _161 = gl_FragCoord.w;
    float _163 = _159 * _161;
    float _165 = in.m_53.x;
    float _167 = gl_FragCoord.w;
    float _169 = _165 * _167;
    float _171 = _107 * _151;
    float _173 = _107 * _157;
    float _175 = _107 * _163;
    float _177 = _171 * _126;
    float _179 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _181 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _183 = fma(_177, (*spvDescriptorSet0.fp_c8)._m0[30].w, _181);
    float _185 = 1.0 / _183;
    float _187 = in.m_49.y;
    float _189 = gl_FragCoord.w;
    float _191 = _187 * _189;
    float _193 = in.m_51.y;
    float _195 = gl_FragCoord.w;
    float _197 = _193 * _195;
    float _199 = in.m_51.z;
    float _201 = gl_FragCoord.w;
    float _203 = _199 * _201;
    float _205 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _207 = fma(_134, (*spvDescriptorSet0.fp_c8)._m0[30].w, _205);
    float _209 = 1.0 / _207;
    float _211 = _145 * _173;
    float _213 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _215 = _185 * _213;
    float _217 = _107 * _169;
    float _219 = _175 * _211;
    float _221 = 0.0 + _219;
    float _223 = precise::clamp(_221, 0.0, 1.0);
    float _225 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _227 = -_215;
    float _229 = fma(_209, _225, _227);
    float _231 = _229 * _179;
    float _233 = precise::clamp(_231, 0.0, 1.0);
    float _235 = _223 * _233;
    float _237 = _235 * _217;
    bool _241 = _237 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _243 = isnan(_237);
    bool _245 = _241 || _243;
    bool _247 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _249 = _245 || _247;
    float _251 = in.m_49.x;
    float _253 = gl_FragCoord.w;
    float _255 = _251 * _253;
    float _257 = in.m_51.x;
    float _259 = gl_FragCoord.w;
    float _261 = _257 * _259;
    float _263 = in.m_49.z;
    float _265 = gl_FragCoord.w;
    float _267 = _263 * _265;
    if (!_249)
    {
        discard_fragment();
    }
    float _269 = _107 * _197;
    float _271 = _107 * _255;
    float _273 = _107 * _191;
    float _275 = _107 * _261;
    float _277 = _107 * _267;
    float _279 = _107 * _203;
    float _281 = -_269;
    float _283 = _273 + _281;
    float _285 = -_275;
    float _287 = _271 + _285;
    float _289 = _139 * _139;
    float _291 = -_279;
    float _293 = _277 + _291;
    float _295 = _141 * _141;
    float _297 = _143 * _143;
    float _299 = fma(_289, _287, _275);
    float _301 = fma(_295, _283, _269);
    float _303 = fma(_297, _293, _279);
    if (!_249)
    {
        out.m_56.x = _299;
        out.m_56.y = _301;
        out.m_56.z = _303;
        out.m_56.w = _219;
        return out;
    }
    float _305 = in.m_58.y;
    float _307 = gl_FragCoord.w;
    float _309 = _305 * _307;
    float _311 = in.m_58.x;
    float _313 = gl_FragCoord.w;
    float _315 = _311 * _313;
    float _317 = in.m_58.z;
    float _319 = gl_FragCoord.w;
    float _321 = _317 * _319;
    float _323 = _107 * _309;
    float _325 = _107 * _315;
    float _327 = _107 * _321;
    float _329 = _323 * _323;
    float _331 = in.m_60.x;
    float _333 = gl_FragCoord.w;
    float _335 = _331 * _333;
    float _337 = fma(_325, _325, _329);
    float _339 = fma(_327, _327, _337);
    float _341 = rsqrt(_339);
    float _343 = _325 * _341;
    float _345 = _323 * _341;
    float _347 = _327 * _341;
    float _349 = _107 * _335;
    float _351 = abs(_343);
    float _353 = abs(_345);
    float _355 = precise::max(_351, _353);
    float _357 = precise::min(_349, 1.0);
    float _359 = abs(_347);
    float _361 = precise::max(_359, _355);
    float _363 = 1.0 / _361;
    float _365 = _343 * _363;
    float _367 = _345 * _363;
    float _369 = -_363;
    float _371 = _347 * _369;
    float3 _959 = float3(_365, _367, _371);
    float3 _375 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_959, float3(0.0), isnan(_959)), level(_357)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_959, float3(0.0), isnan(_959)), level(_357)).xyz;
    float _377 = _375.x;
    float _379 = _375.y;
    float _381 = _375.z;
    float _383 = in.m_62.x;
    float _385 = gl_FragCoord.w;
    float _387 = _383 * _385;
    float _389 = in.m_62.z;
    float _391 = gl_FragCoord.w;
    float _393 = _389 * _391;
    float _395 = in.m_62.y;
    float _397 = gl_FragCoord.w;
    float _399 = _395 * _397;
    float _401 = in.m_64.z;
    float _403 = gl_FragCoord.w;
    float _405 = _401 * _403;
    float _407 = in.m_64.x;
    float _409 = gl_FragCoord.w;
    float _411 = _407 * _409;
    float _413 = in.m_64.y;
    float _415 = gl_FragCoord.w;
    float _417 = _413 * _415;
    float _419 = in.m_66.x;
    float _421 = gl_FragCoord.w;
    float _423 = _419 * _421;
    float _425 = in.m_66.y;
    float _427 = gl_FragCoord.w;
    float _429 = _425 * _427;
    float _431 = in.m_66.z;
    float _433 = gl_FragCoord.w;
    float _435 = _431 * _433;
    float _437 = in.m_66.w;
    float _439 = gl_FragCoord.w;
    float _441 = _437 * _439;
    bool _443 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _445 = _107 * _387;
    float _447 = _107 * _399;
    float _449 = _107 * _405;
    float _451 = _107 * _411;
    float _453 = _107 * _417;
    float _455 = _107 * _429;
    float _457 = _107 * _435;
    float _459 = fma(_377, 0.20999999344348907470703125, _445);
    float _461 = _107 * _393;
    float _463 = fma(_379, 0.20999999344348907470703125, _447);
    float _465 = _107 * _423;
    float _467 = _459 + _451;
    float _469 = fma(_381, 0.20999999344348907470703125, _461);
    float _471 = _461;
    if (_443)
    {
        float _473 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _475 = _215 + _473;
        _471 = _475;
    }
    float _477 = _471;
    float _479 = _463 + _453;
    float _481 = _107 * _441;
    float _483 = _469 + _449;
    float _485 = 0.0 + _237;
    float _487 = precise::clamp(_485, 0.0, 1.0);
    float _489 = _477;
    float _491 = _487;
    if (_443)
    {
        float _493 = _477 * 8.0;
        float _495 = precise::clamp(_493, 0.0, 1.0);
        _489 = _495;
    }
    float _497 = _489;
    float _499 = _299 * _467;
    float _501 = _301 * _479;
    float _503 = _303 * _483;
    if (_443)
    {
        float _505 = _487 * _497;
        _491 = _505;
    }
    float _507 = _491;
    float _509 = fma(_499, _481, _465);
    float _511 = fma(_501, _481, _455);
    float _513 = fma(_503, _481, _457);
    float _515 = 0.0 + _507;
    float _517 = precise::clamp(_515, 0.0, 1.0);
    out.m_56.x = _509;
    out.m_56.y = _511;
    out.m_56.z = _513;
    out.m_56.w = _517;
    return out;
}

