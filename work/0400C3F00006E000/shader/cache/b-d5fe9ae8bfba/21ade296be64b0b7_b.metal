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
    constant _16* fp_c10 [[id(2)]];
    constant _16* fp_c15 [[id(3)]];
    texture2d<float> fp_t_tcb_A [[id(4)]];
    sampler fp_t_tcb_ASmplr [[id(5)]];
    texture2d<float> fp_t_tcb_C [[id(6)]];
    sampler fp_t_tcb_CSmplr [[id(7)]];
    texture2d<float> fp_t_tcb_8 [[id(8)]];
    sampler fp_t_tcb_8Smplr [[id(9)]];
    sampler fp_t_tcb_ASmplr_w [[id(10)]];
    sampler fp_t_tcb_CSmplr_w [[id(11)]];
    sampler fp_t_tcb_8Smplr_w [[id(12)]];
    constant dm_border_t* dm_border [[id(13)]];
};

struct main0_out
{
    float4 m_58 [[color(0)]];
};

struct main0_in
{
    float4 m_39 [[user(locn0)]];
    float4 m_62 [[user(locn1)]];
    float4 m_41 [[user(locn2)]];
    float4 m_55 [[user(locn3), flat]];
    float4 m_53 [[user(locn4)]];
    float4 m_43 [[user(locn5)]];
    float4 m_49 [[user(locn6)]];
    float4 m_45 [[user(locn7)]];
    float4 m_51 [[user(locn8)]];
    float4 m_47 [[user(locn9)]];
    float4 m_60 [[user(locn10)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _69 = gl_FragCoord.w;
    float _71 = in.m_39.w;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = in.m_41.x;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = 1.0 / _69;
    float _85 = _83 * _75;
    float _87 = _83 * _81;
    float _89 = 0.0 + _85;
    float _91 = precise::clamp(_89, 0.0, 1.0);
    float _93 = _91 * _87;
    bool _97 = _93 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _99 = isnan(_93);
    bool _101 = _97 || _99;
    bool _103 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _105 = _101 || _103;
    float _107 = in.m_43.z;
    float _109 = gl_FragCoord.w;
    float _111 = _107 * _109;
    float _113 = in.m_43.w;
    float _115 = gl_FragCoord.w;
    float _117 = _113 * _115;
    if (!_105)
    {
        discard_fragment();
    }
    float _119 = _83 * _111;
    float _121 = _83 * _117;
    float2 _646 = float2(_119, _121);
    float2 _125 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_646, float2(0.0), isnan(_646))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_646, float2(0.0), isnan(_646))).xy;
    float _127 = _125.x;
    float _129 = _125.y;
    float _131 = in.m_45.y;
    float _133 = gl_FragCoord.w;
    float _135 = _131 * _133;
    float _137 = in.m_45.x;
    float _139 = gl_FragCoord.w;
    float _141 = _137 * _139;
    float _143 = in.m_45.z;
    float _145 = gl_FragCoord.w;
    float _147 = _143 * _145;
    float _149 = in.m_47.y;
    float _151 = gl_FragCoord.w;
    float _153 = _149 * _151;
    float _155 = in.m_49.y;
    float _157 = gl_FragCoord.w;
    float _159 = _155 * _157;
    float _161 = in.m_51.y;
    float _163 = gl_FragCoord.w;
    float _165 = _161 * _163;
    float _167 = in.m_47.x;
    float _169 = gl_FragCoord.w;
    float _171 = _167 * _169;
    float _173 = in.m_49.x;
    float _175 = gl_FragCoord.w;
    float _177 = _173 * _175;
    float _179 = in.m_51.x;
    float _181 = gl_FragCoord.w;
    float _183 = _179 * _181;
    float _185 = in.m_47.z;
    float _187 = gl_FragCoord.w;
    float _189 = _185 * _187;
    float _191 = in.m_49.z;
    float _193 = gl_FragCoord.w;
    float _195 = _191 * _193;
    float _197 = in.m_51.z;
    float _199 = gl_FragCoord.w;
    float _201 = _197 * _199;
    float _203 = _83 * _135;
    float _205 = _83 * _141;
    float _207 = _83 * _147;
    float _209 = _83 * _153;
    float _211 = _203 * _203;
    float _213 = _83 * _159;
    float _215 = _83 * _165;
    float _217 = _209 * _209;
    float _219 = fma(_205, _205, _211);
    float _221 = _83 * _171;
    float _223 = _213 * _213;
    float _225 = _83 * _183;
    float _227 = fma(_207, _207, _219);
    float _229 = _83 * _177;
    float _231 = -(*spvDescriptorSet0.fp_c8)._m0[29].y;
    float _233 = _215 + _231;
    float _235 = _83 * _189;
    float _237 = rsqrt(_227);
    float _239 = fma(_221, _221, _217);
    float _241 = _83 * _195;
    float _243 = fma(_229, _229, _223);
    float _245 = -(*spvDescriptorSet0.fp_c8)._m0[29].x;
    float _247 = _225 + _245;
    float _249 = _83 * _201;
    float _251 = _233 * _233;
    float _253 = fma(_235, _235, _239);
    float _255 = fma(_241, _241, _243);
    float _257 = -(*spvDescriptorSet0.fp_c8)._m0[29].z;
    float _259 = _249 + _257;
    float _261 = fma(_247, _247, _251);
    float _263 = rsqrt(_253);
    float _265 = fma(_259, _259, _261);
    float _267 = _203 * _237;
    float _269 = _205 * _237;
    float _271 = _207 * _237;
    float _273 = _267 * _267;
    float _275 = rsqrt(_265);
    float _277 = fma(_269, _269, _273);
    float _279 = fma(_271, _271, _277);
    float _281 = rsqrt(_255);
    float _283 = _233 * _275;
    float _285 = _259 * _275;
    float _287 = rsqrt(_279);
    float _289 = in.m_53.y;
    float _291 = gl_FragCoord.w;
    float _293 = _289 * _291;
    float _295 = _83 * _293;
    float _297 = _129 * _129;
    float _299 = _127 * _263;
    float _301 = in.m_43.x;
    float _303 = gl_FragCoord.w;
    float _305 = _301 * _303;
    float _307 = fma(_127, _127, _297);
    float _309 = precise::clamp(_307, 0.0, 1.0);
    float _311 = in.m_55.x;
    float _313 = -_309;
    float _315 = _313 + 1.0;
    float _317 = _247 * _275;
    float _319 = _241 * _281;
    float _321 = _281 * _129;
    float _323 = in.m_55.y;
    float _325 = in.m_43.y;
    float _327 = gl_FragCoord.w;
    float _329 = _325 * _327;
    float _331 = sqrt(_315);
    float _333 = _213 * _321;
    float _335 = _229 * _321;
    float _337 = _129 * _319;
    float _339 = fma(_209, _299, _333);
    float _341 = fma(_221, _299, _335);
    float _343 = fma(_235, _299, _337);
    float _345 = _287 * _331;
    float _347 = fma(_267, _345, _339);
    float _349 = fma(_269, _345, _341);
    float _351 = fma(_271, _345, _343);
    float _353 = _347 * _283;
    float _355 = fma(_349, _317, _353);
    float _357 = _83 * _329;
    float _359 = fma(_351, _285, _355);
    float _361 = _357 + _311;
    float _363 = _295 + _359;
    float _365 = _323 + _363;
    float _367 = (*spvDescriptorSet0.fp_c10)._m0[2].x * 0.0166666693985462188720703125;
    float _369 = -_367;
    float _371 = fma(_365, 0.25, _369);
    float _373 = fma(_361, 0.25, _367);
    float _375 = fma(_295, 0.5, 0.5);
    float _377 = _83 * _305;
    float2 _1013 = float2(_375, _371);
    float3 _381 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1013, float2(0.0), isnan(_1013))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1013, float2(0.0), isnan(_1013))).xyz;
    float _383 = _381.x;
    float _385 = _381.y;
    float _387 = _381.z;
    float2 _1027 = float2(_377, _357);
    float3 _389 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1027, float2(0.0), isnan(_1027))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1027, float2(0.0), isnan(_1027))).xyz;
    float _391 = _389.x;
    float _393 = _389.y;
    float _395 = _389.z;
    float2 _1041 = float2(_357, _373);
    float3 _397 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1041, float2(0.0), isnan(_1041))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1041, float2(0.0), isnan(_1041))).xyz;
    float _399 = _397.x;
    float _401 = _397.y;
    float _403 = _397.z;
    float _405 = in.m_39.x;
    float _407 = gl_FragCoord.w;
    float _409 = _405 * _407;
    float _411 = in.m_39.y;
    float _413 = gl_FragCoord.w;
    float _415 = _411 * _413;
    float _417 = in.m_39.z;
    float _419 = gl_FragCoord.w;
    float _421 = _417 * _419;
    float _423 = abs(_359);
    float _425 = -_423;
    float _427 = _425 + 1.0;
    float _429 = fma(_427, _427, 0.100000001490116119384765625);
    float _431 = _429 * 2.5;
    float _433 = _387 * _431;
    float _435 = _383 * _431;
    float _437 = _385 * _431;
    float _439 = _83 * _415;
    float _441 = fma(_395, _403, _433);
    float _443 = fma(_391, _399, _435);
    float _445 = fma(_393, _401, _437);
    float _447 = _83 * _409;
    float _449 = _83 * _421;
    float _451 = _445 * _439;
    float _453 = _443 * _447;
    float _455 = _441 * _449;
    if (!_105)
    {
        out.m_58.x = _453;
        out.m_58.y = _451;
        out.m_58.z = _455;
        out.m_58.w = _91;
        return out;
    }
    float _457 = _451 * 0.715200006961822509765625;
    float _459 = in.m_60.w;
    float _461 = gl_FragCoord.w;
    float _463 = _459 * _461;
    float _465 = in.m_60.x;
    float _467 = gl_FragCoord.w;
    float _469 = _465 * _467;
    float _471 = in.m_60.y;
    float _473 = gl_FragCoord.w;
    float _475 = _471 * _473;
    float _477 = fma(_453, 0.2125999927520751953125, _457);
    float _479 = in.m_60.z;
    float _481 = gl_FragCoord.w;
    float _483 = _479 * _481;
    bool _485 = 0.5 <= (*spvDescriptorSet0.fp_c15)._m0[653].w;
    float _487 = fma(_455, 0.072200000286102294921875, _477);
    float _489 = 1.0 / _487;
    float _491 = _489 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _493 = precise::clamp(_491, 0.0, 1.0);
    float _495 = 0.0 + _93;
    float _497 = precise::clamp(_495, 0.0, 1.0);
    float _499 = _83 * _463;
    float _501 = fma(_493, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _503 = _83 * _469;
    float _505 = _501 * _499;
    float _507 = _83 * _475;
    float _509 = _83 * _483;
    float _511 = fma(_453, _505, _503);
    float _513 = fma(_451, _505, _507);
    float _515 = fma(_455, _505, _509);
    bool _517 = !_485;
    float _519 = _497;
    if (!_517)
    {
        float _521 = in.m_62.w;
        float _523 = gl_FragCoord.w;
        float _525 = _521 * _523;
        float _527 = in.m_62.z;
        float _529 = gl_FragCoord.w;
        float _531 = _527 * _529;
        float _533 = _83 * _525;
        float _535 = _83 * _531;
        float _537 = 1.0 / _533;
        float _539 = _535 * _537;
        float _541 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _543 = fma(_539, (*spvDescriptorSet0.fp_c8)._m0[30].w, _541);
        float _545 = 1.0 / _543;
        float _547 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _549 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _551 = fma(_545, _547, _549);
        float _553 = _551 * 8.0;
        float _555 = precise::clamp(_553, 0.0, 1.0);
        float _557 = _497 * _555;
        _519 = _557;
    }
    float _559 = _519;
    float _561 = 0.0 + _559;
    float _563 = precise::clamp(_561, 0.0, 1.0);
    out.m_58.x = _511;
    out.m_58.y = _513;
    out.m_58.z = _515;
    out.m_58.w = _563;
    return out;
}

