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
    float4 m_53 [[user(locn1)]];
    float4 m_47 [[user(locn2)]];
    float4 m_43 [[user(locn3)]];
    float4 m_62 [[user(locn4)]];
    float4 m_51 [[user(locn5)]];
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
    float _81 = in.m_43.x;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = in.m_43.y;
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
    float2 _593 = float2(_130, _132);
    float _134 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_593, float2(0.0), isnan(_593))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_593, float2(0.0), isnan(_593))).x;
    float3 _606 = float3(_128, _124, float(int(_116)));
    float3 _610 = select(_606, float3(0.0), isnan(_606));
    float4 _137 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _610.xy, uint(rint(_610.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _610.xy, uint(rint(_610.z))).xyzw;
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
    float _159 = in.m_51.x;
    float _161 = gl_FragCoord.w;
    float _163 = _159 * _161;
    float _165 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _167 = _107 * _151;
    float _169 = _107 * _157;
    float _171 = _167 * _126;
    float _173 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _175 = fma(_171, (*spvDescriptorSet0.fp_c8)._m0[30].w, _173);
    float _177 = 1.0 / _175;
    float _179 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _181 = _177 * _179;
    float _183 = in.m_49.x;
    float _185 = gl_FragCoord.w;
    float _187 = _183 * _185;
    float _189 = in.m_53.y;
    float _191 = gl_FragCoord.w;
    float _193 = _189 * _191;
    float _195 = in.m_53.z;
    float _197 = gl_FragCoord.w;
    float _199 = _195 * _197;
    float _201 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _203 = fma(_134, (*spvDescriptorSet0.fp_c8)._m0[30].w, _201);
    float _205 = 1.0 / _203;
    float _207 = _145 * _169;
    float _209 = _107 * _163;
    float _211 = 0.0 + _207;
    float _213 = precise::clamp(_211, 0.0, 1.0);
    float _215 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _217 = -_181;
    float _219 = fma(_205, _215, _217);
    float _221 = _219 * _165;
    float _223 = precise::clamp(_221, 0.0, 1.0);
    float _225 = _213 * _223;
    float _227 = _225 * _209;
    bool _231 = _227 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _233 = isnan(_227);
    bool _235 = _231 || _233;
    bool _237 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _239 = _235 || _237;
    float _241 = in.m_49.y;
    float _243 = gl_FragCoord.w;
    float _245 = _241 * _243;
    float _247 = in.m_53.x;
    float _249 = gl_FragCoord.w;
    float _251 = _247 * _249;
    float _253 = in.m_49.z;
    float _255 = gl_FragCoord.w;
    float _257 = _253 * _255;
    float _259 = _181;
    if (!_239)
    {
        discard_fragment();
    }
    float _261 = _107 * _187;
    float _263 = _107 * _193;
    float _265 = _107 * _245;
    float _267 = _107 * _251;
    float _269 = _107 * _257;
    float _271 = _107 * _199;
    float _273 = -_263;
    float _275 = _265 + _273;
    float _277 = -_267;
    float _279 = _261 + _277;
    float _281 = _139 * _139;
    float _283 = -_271;
    float _285 = _269 + _283;
    float _287 = _141 * _141;
    float _289 = _143 * _143;
    float _291 = fma(_281, _279, _267);
    float _293 = fma(_287, _275, _263);
    float _295 = fma(_289, _285, _271);
    if (!_239)
    {
        out.m_56.x = _291;
        out.m_56.y = _293;
        out.m_56.z = _295;
        out.m_56.w = _207;
        return out;
    }
    float _297 = in.m_58.y;
    float _299 = gl_FragCoord.w;
    float _301 = _297 * _299;
    float _303 = in.m_58.x;
    float _305 = gl_FragCoord.w;
    float _307 = _303 * _305;
    float _309 = in.m_58.z;
    float _311 = gl_FragCoord.w;
    float _313 = _309 * _311;
    float _315 = _107 * _301;
    float _317 = _107 * _307;
    float _319 = _107 * _313;
    float _321 = _315 * _315;
    float _323 = in.m_60.x;
    float _325 = gl_FragCoord.w;
    float _327 = _323 * _325;
    float _329 = fma(_317, _317, _321);
    float _331 = fma(_319, _319, _329);
    float _333 = rsqrt(_331);
    float _335 = _317 * _333;
    float _337 = _315 * _333;
    float _339 = _319 * _333;
    float _341 = _107 * _327;
    float _343 = abs(_335);
    float _345 = abs(_337);
    float _347 = precise::max(_343, _345);
    float _349 = precise::min(_341, 1.0);
    float _351 = abs(_339);
    float _353 = precise::max(_351, _347);
    float _355 = 1.0 / _353;
    float _357 = _335 * _355;
    float _359 = _337 * _355;
    float _361 = -_355;
    float _363 = _339 * _361;
    float3 _937 = float3(_357, _359, _363);
    float3 _367 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_937, float3(0.0), isnan(_937)), level(_349)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_937, float3(0.0), isnan(_937)), level(_349)).xyz;
    float _369 = _367.x;
    float _371 = _367.y;
    float _373 = _367.z;
    float _375 = in.m_62.x;
    float _377 = gl_FragCoord.w;
    float _379 = _375 * _377;
    float _381 = in.m_62.z;
    float _383 = gl_FragCoord.w;
    float _385 = _381 * _383;
    float _387 = in.m_62.y;
    float _389 = gl_FragCoord.w;
    float _391 = _387 * _389;
    float _393 = in.m_64.z;
    float _395 = gl_FragCoord.w;
    float _397 = _393 * _395;
    float _399 = in.m_64.x;
    float _401 = gl_FragCoord.w;
    float _403 = _399 * _401;
    float _405 = in.m_64.y;
    float _407 = gl_FragCoord.w;
    float _409 = _405 * _407;
    float _411 = in.m_66.x;
    float _413 = gl_FragCoord.w;
    float _415 = _411 * _413;
    float _417 = in.m_66.y;
    float _419 = gl_FragCoord.w;
    float _421 = _417 * _419;
    float _423 = in.m_66.z;
    float _425 = gl_FragCoord.w;
    float _427 = _423 * _425;
    float _429 = in.m_66.w;
    float _431 = gl_FragCoord.w;
    float _433 = _429 * _431;
    bool _435 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    if (_435)
    {
        float _437 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _439 = _181 + _437;
        _259 = _439;
    }
    float _441 = _259;
    float _443 = _441;
    if (_435)
    {
        float _445 = _441 * 8.0;
        float _447 = precise::clamp(_445, 0.0, 1.0);
        _443 = _447;
    }
    float _449 = _443;
    float _451 = _107 * _379;
    float _453 = _107 * _391;
    float _455 = _107 * _397;
    float _457 = _107 * _403;
    float _459 = _107 * _409;
    float _461 = _107 * _421;
    float _463 = _107 * _427;
    float _465 = fma(_369, 0.20999999344348907470703125, _451);
    float _467 = _107 * _385;
    float _469 = fma(_371, 0.20999999344348907470703125, _453);
    float _471 = _107 * _415;
    float _473 = _465 + _457;
    float _475 = fma(_373, 0.20999999344348907470703125, _467);
    float _477 = _469 + _459;
    float _479 = _107 * _433;
    float _481 = _291 * _473;
    float _483 = _475 + _455;
    float _485 = 0.0 + _227;
    float _487 = precise::clamp(_485, 0.0, 1.0);
    float _489 = _293 * _477;
    float _491 = fma(_481, _479, _471);
    float _493 = _295 * _483;
    float _495 = _487;
    if (_435)
    {
        float _497 = _487 * _449;
        _495 = _497;
    }
    float _499 = _495;
    float _501 = fma(_489, _479, _461);
    float _503 = fma(_493, _479, _463);
    float _505 = 0.0 + _499;
    float _507 = precise::clamp(_505, 0.0, 1.0);
    out.m_56.x = _491;
    out.m_56.y = _501;
    out.m_56.z = _503;
    out.m_56.w = _507;
    return out;
}

