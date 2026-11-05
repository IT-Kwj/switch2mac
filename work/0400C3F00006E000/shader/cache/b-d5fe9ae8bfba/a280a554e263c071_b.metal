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
    constant _16* fp_c15 [[id(1)]];
    constant _16* fp_c8 [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_C [[id(5)]];
    sampler fp_t_tcb_CSmplr [[id(6)]];
    texture2d<float> fp_t_tcb_36 [[id(7)]];
    sampler fp_t_tcb_36Smplr [[id(8)]];
    texture2d<float> fp_t_tcb_A [[id(9)]];
    sampler fp_t_tcb_ASmplr [[id(10)]];
    texture2d<float> fp_t_tcb_34 [[id(11)]];
    sampler fp_t_tcb_34Smplr [[id(12)]];
    sampler fp_t_tcb_8Smplr_w [[id(13)]];
    sampler fp_t_tcb_CSmplr_w [[id(14)]];
    sampler fp_t_tcb_36Smplr_w [[id(15)]];
    sampler fp_t_tcb_ASmplr_w [[id(16)]];
    sampler fp_t_tcb_34Smplr_w [[id(17)]];
    constant dm_border_t* dm_border [[id(18)]];
};

struct main0_out
{
    float4 m_62 [[color(0)]];
};

struct main0_in
{
    float4 m_59 [[user(locn0)]];
    float4 m_57 [[user(locn1)]];
    float4 m_47 [[user(locn2)]];
    float4 m_66 [[user(locn3)]];
    float4 m_53 [[user(locn4)]];
    float4 m_51 [[user(locn5)]];
    float4 m_41 [[user(locn6)]];
    float4 m_43 [[user(locn7)]];
    float4 m_55 [[user(locn8)]];
    float4 m_45 [[user(locn9)]];
    float4 m_49 [[user(locn10)]];
    float4 m_64 [[user(locn11)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _73 = gl_FragCoord.w;
    float _75 = in.m_41.x;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_41.y;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = 1.0 / _73;
    float _89 = _87 * _79;
    float _91 = _87 * _85;
    float2 _553 = float2(_89, _91);
    float _93 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_553, float2(0.0), isnan(_553))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_553, float2(0.0), isnan(_553))).w;
    float _95 = in.m_43.y;
    float _97 = gl_FragCoord.w;
    float _99 = _95 * _97;
    float _101 = in.m_45.y;
    float _103 = gl_FragCoord.w;
    float _105 = _101 * _103;
    float _107 = in.m_43.x;
    float _109 = gl_FragCoord.w;
    float _111 = _107 * _109;
    float _113 = in.m_45.x;
    float _115 = gl_FragCoord.w;
    float _117 = _113 * _115;
    float _119 = in.m_41.z;
    float _121 = gl_FragCoord.w;
    float _123 = _119 * _121;
    float _125 = in.m_41.w;
    float _127 = gl_FragCoord.w;
    float _129 = _125 * _127;
    float _131 = _87 * _99;
    float _133 = _87 * _105;
    float _135 = _87 * _111;
    float _137 = _87 * _117;
    float _139 = fma(_93, 0.4000000059604644775390625, _131);
    float _141 = fma(_93, 0.4000000059604644775390625, _133);
    float _143 = _87 * _123;
    float _145 = _87 * _129;
    float2 _633 = float2(_135, _139);
    float _147 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_633, float2(0.0), isnan(_633))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_633, float2(0.0), isnan(_633))).w;
    float2 _641 = float2(_137, _141);
    float _149 = dm_bs(spvDescriptorSet0.fp_t_tcb_36.sample(spvDescriptorSet0.fp_t_tcb_36Smplr, select(_641, float2(0.0), isnan(_641))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_36, spvDescriptorSet0.fp_t_tcb_36Smplr_w, select(_641, float2(0.0), isnan(_641))).w;
    float2 _649 = float2(_143, _145);
    float _151 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_649, float2(0.0), isnan(_649))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_649, float2(0.0), isnan(_649))).w;
    float _153 = in.m_47.y;
    float _155 = gl_FragCoord.w;
    float _157 = _153 * _155;
    float _159 = in.m_47.x;
    float _161 = gl_FragCoord.w;
    float _163 = _159 * _161;
    float _165 = in.m_47.z;
    float _167 = gl_FragCoord.w;
    float _169 = _165 * _167;
    float _171 = in.m_49.y;
    float _173 = gl_FragCoord.w;
    float _175 = _171 * _173;
    float _177 = in.m_49.x;
    float _179 = gl_FragCoord.w;
    float _181 = _177 * _179;
    float _183 = in.m_49.z;
    float _185 = gl_FragCoord.w;
    float _187 = _183 * _185;
    float _189 = _87 * _157;
    float _191 = _87 * _163;
    float _193 = _87 * _169;
    float _195 = _189 * _189;
    float _197 = in.m_51.w;
    float _199 = gl_FragCoord.w;
    float _201 = _197 * _199;
    float _203 = fma(_191, _191, _195);
    float _205 = _87 * _175;
    float _207 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _209 = _207 + (*spvDescriptorSet0.fp_c9)._m0[139].w;
    float _211 = fma(_193, _193, _203);
    float _213 = 1.0 / _209;
    float _215 = rsqrt(_211);
    float _217 = _189 * _215;
    float _219 = _193 * _215;
    float _221 = _205 * _217;
    float _223 = _87 * _181;
    float _225 = _191 * _215;
    float _227 = in.m_53.x;
    float _229 = gl_FragCoord.w;
    float _231 = _227 * _229;
    float _233 = fma(_223, _225, _221);
    float _235 = _87 * _187;
    float _237 = fma(_235, _219, _233);
    float _239 = abs(_237);
    float _241 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _243 = _239 + _241;
    float _245 = _243 * _213;
    float _247 = precise::clamp(_245, 0.0, 1.0);
    float _249 = fma(_247, -2.0, 3.0);
    float _251 = _247 * _247;
    float _253 = _87 * _201;
    float _255 = _249 * _251;
    float _257 = _253 * _253;
    float _259 = _257 * _257;
    float _261 = in.m_55.y;
    float _263 = gl_FragCoord.w;
    float _265 = _261 * _263;
    float _267 = _87 * _265;
    float _269 = _147 * _149;
    float _271 = _151 * _151;
    float _273 = _269 * _271;
    float _275 = fma(_273, 7.5, _259);
    float _277 = precise::clamp(_275, 0.0, 1.0);
    float _279 = _87 * _231;
    float _281 = _277 * _255;
    float _283 = _281 * _279;
    bool _287 = _283 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _289 = isnan(_283);
    bool _291 = _287 || _289;
    bool _293 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _295 = _291 || _293;
    float _297 = in.m_55.x;
    float _299 = gl_FragCoord.w;
    float _301 = _297 * _299;
    if (!_295)
    {
        discard_fragment();
    }
    float _303 = _87 * _301;
    float2 _871 = float2(_303, _267);
    float _305 = dm_bs(spvDescriptorSet0.fp_t_tcb_34.sample(spvDescriptorSet0.fp_t_tcb_34Smplr, select(_871, float2(0.0), isnan(_871))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_34, spvDescriptorSet0.fp_t_tcb_34Smplr_w, select(_871, float2(0.0), isnan(_871))).w;
    float _307 = in.m_57.w;
    float _309 = gl_FragCoord.w;
    float _311 = _307 * _309;
    float _313 = in.m_57.x;
    float _315 = gl_FragCoord.w;
    float _317 = _313 * _315;
    float _319 = in.m_59.x;
    float _321 = gl_FragCoord.w;
    float _323 = _319 * _321;
    float _325 = in.m_57.z;
    float _327 = gl_FragCoord.w;
    float _329 = _325 * _327;
    float _331 = in.m_59.z;
    float _333 = gl_FragCoord.w;
    float _335 = _331 * _333;
    float _337 = in.m_57.y;
    float _339 = gl_FragCoord.w;
    float _341 = _337 * _339;
    float _343 = in.m_59.y;
    float _345 = gl_FragCoord.w;
    float _347 = _343 * _345;
    float _349 = _87 * _311;
    float _351 = _349 + 0.300000011920928955078125;
    float _353 = precise::max(_349, _277);
    float _355 = precise::min(_351, _353);
    float _357 = _87 * _341;
    float _359 = -_349;
    float _361 = _359 + _355;
    float _363 = _87 * _317;
    float _365 = _87 * _335;
    float _367 = _361 * 3.3333332538604736328125;
    float _369 = _87 * _323;
    float _371 = -_367;
    float _373 = _151 + _371;
    float _375 = _87 * _329;
    float _377 = -_363;
    float _379 = _377 + _369;
    float _381 = _87 * _347;
    float _383 = fma(_373, 0.1500000059604644775390625, _367);
    float _385 = -_375;
    float _387 = _385 + _365;
    float _389 = -_357;
    float _391 = _389 + _381;
    float _393 = fma(_383, _379, _363);
    float _395 = fma(_383, _387, _375);
    float _397 = fma(_383, _391, _357);
    float _399 = fma(_271, _271, _305);
    float _401 = fma(_399, 0.35000002384185791015625, 0.64999997615814208984375);
    float _403 = _393 * _401;
    float _405 = _397 * _401;
    float _407 = _395 * _401;
    if (!_295)
    {
        out.m_62.x = _403;
        out.m_62.y = _405;
        out.m_62.z = _407;
        out.m_62.w = _277;
        return out;
    }
    float _409 = _405 * 0.715200006961822509765625;
    float _411 = in.m_64.w;
    float _413 = gl_FragCoord.w;
    float _415 = _411 * _413;
    float _417 = in.m_64.z;
    float _419 = gl_FragCoord.w;
    float _421 = _417 * _419;
    float _423 = in.m_64.x;
    float _425 = gl_FragCoord.w;
    float _427 = _423 * _425;
    float _429 = fma(_403, 0.2125999927520751953125, _409);
    float _431 = in.m_64.y;
    float _433 = gl_FragCoord.w;
    float _435 = _431 * _433;
    float _437 = fma(_407, 0.072200000286102294921875, _429);
    bool _439 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _441 = 1.0 / _437;
    float _443 = _441 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _445 = precise::clamp(_443, 0.0, 1.0);
    float _447 = _87 * _415;
    float _449 = fma(_445, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _451 = _87 * _421;
    float _453 = _449 * _447;
    float _455 = 0.0 + _283;
    float _457 = precise::clamp(_455, 0.0, 1.0);
    float _459 = _87 * _427;
    float _461 = _87 * _435;
    float _463 = fma(_407, _453, _451);
    float _465 = fma(_403, _453, _459);
    float _467 = fma(_405, _453, _461);
    float _469 = _451;
    if (!_439)
    {
        _469 = _457;
    }
    float _471 = _469;
    bool _473 = !_439;
    float _475 = _471;
    if (!_473)
    {
        float _477 = in.m_66.w;
        float _479 = gl_FragCoord.w;
        float _481 = _477 * _479;
        float _483 = in.m_66.z;
        float _485 = gl_FragCoord.w;
        float _487 = _483 * _485;
        float _489 = _87 * _481;
        float _491 = _87 * _487;
        float _493 = 1.0 / _489;
        float _495 = _491 * _493;
        float _497 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _499 = fma(_495, (*spvDescriptorSet0.fp_c8)._m0[30].w, _497);
        float _501 = 1.0 / _499;
        float _503 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _505 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _507 = fma(_501, _503, _505);
        float _509 = _507 * 8.0;
        float _511 = precise::clamp(_509, 0.0, 1.0);
        float _513 = _457 * _511;
        _475 = _513;
    }
    float _515 = _475;
    float _517 = 0.0 + _515;
    float _519 = precise::clamp(_517, 0.0, 1.0);
    out.m_62.x = _465;
    out.m_62.y = _467;
    out.m_62.z = _463;
    out.m_62.w = _519;
    return out;
}

