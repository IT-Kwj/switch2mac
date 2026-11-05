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
    texture2d<float> fp_t_tcb_8 [[id(5)]];
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
    float4 m_51 [[color(0)]];
};

struct main0_in
{
    float4 m_44 [[user(locn0)]];
    float4 m_46 [[user(locn1)]];
    float4 m_42 [[user(locn2)]];
    float4 m_40 [[user(locn3)]];
    float4 m_57 [[user(locn4)]];
    float4 m_48 [[user(locn5)]];
    float4 m_53 [[user(locn6)]];
    float4 m_59 [[user(locn7)]];
    float4 m_55 [[user(locn8)]];
    float4 m_61 [[user(locn9)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _68 = gl_FragCoord.w;
    float _70 = in.m_40.w;
    float _72 = gl_FragCoord.w;
    float _74 = _70 * _72;
    float _76 = in.m_40.x;
    float _78 = gl_FragCoord.w;
    float _80 = _76 * _78;
    float _82 = in.m_40.y;
    float _84 = gl_FragCoord.w;
    float _86 = _82 * _84;
    float _88 = in.m_42.x;
    float _90 = gl_FragCoord.w;
    float _92 = _88 * _90;
    float _94 = in.m_42.y;
    float _96 = gl_FragCoord.w;
    float _98 = _94 * _96;
    float _100 = 1.0 / _68;
    float _102 = _100 * _74;
    float _104 = _100 * _80;
    float _106 = _100 * _86;
    float _108 = _100 * _92;
    float _110 = 1.0 / _102;
    float _112 = _100 * _98;
    float _114 = _104 * _110;
    float _116 = _106 * _110;
    float2 _615 = float2(_114, _116);
    float _118 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_615, float2(0.0), isnan(_615))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_615, float2(0.0), isnan(_615))).x;
    float2 _626 = float2(_108, _112);
    float4 _121 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_626, float2(0.0), isnan(_626))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_626, float2(0.0), isnan(_626))).xyzw;
    float _123 = _121.x;
    float _125 = _121.y;
    float _127 = _121.z;
    float _129 = _121.w;
    float _131 = in.m_40.z;
    float _133 = gl_FragCoord.w;
    float _135 = _131 * _133;
    float _137 = in.m_44.w;
    float _139 = gl_FragCoord.w;
    float _141 = _137 * _139;
    float _143 = in.m_46.w;
    float _145 = gl_FragCoord.w;
    float _147 = _143 * _145;
    float _149 = in.m_48.x;
    float _151 = gl_FragCoord.w;
    float _153 = _149 * _151;
    float _155 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _157 = _100 * _135;
    float _159 = _157 * _110;
    float _161 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _163 = fma(_159, (*spvDescriptorSet0.fp_c8)._m0[30].w, _161);
    float _165 = _100 * _141;
    float _167 = _100 * _153;
    float _169 = 1.0 / _163;
    float _171 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _173 = _169 * _171;
    float _175 = in.m_44.y;
    float _177 = gl_FragCoord.w;
    float _179 = _175 * _177;
    float _181 = in.m_46.y;
    float _183 = gl_FragCoord.w;
    float _185 = _181 * _183;
    float _187 = in.m_46.z;
    float _189 = gl_FragCoord.w;
    float _191 = _187 * _189;
    float _193 = in.m_44.z;
    float _195 = gl_FragCoord.w;
    float _197 = _193 * _195;
    float _199 = _100 * _179;
    float _201 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _203 = fma(_118, (*spvDescriptorSet0.fp_c8)._m0[30].w, _201);
    float _205 = _100 * _147;
    float _207 = 1.0 / _203;
    float _209 = _129 * _165;
    float _211 = _205 * _209;
    float _213 = precise::clamp(_211, 0.0, 1.0);
    float _215 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _217 = -_173;
    float _219 = fma(_207, _215, _217);
    float _221 = _219 * _155;
    float _223 = precise::clamp(_221, 0.0, 1.0);
    float _225 = _213 * _223;
    float _227 = _225 * _167;
    bool _231 = _227 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _233 = isnan(_227);
    bool _235 = _231 || _233;
    bool _237 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _239 = _235 || _237;
    float _241 = in.m_46.x;
    float _243 = gl_FragCoord.w;
    float _245 = _241 * _243;
    float _247 = in.m_44.x;
    float _249 = gl_FragCoord.w;
    float _251 = _247 * _249;
    float _253 = _173;
    if (!_239)
    {
        discard_fragment();
    }
    float _255 = _123 * _123;
    float _257 = _125 * _125;
    float _259 = _127 * _127;
    float _261 = _100 * _185;
    float _263 = _100 * _191;
    float _265 = -_255;
    float _267 = _265 + 1.0;
    float _269 = -_257;
    float _271 = _269 + 1.0;
    float _273 = -_259;
    float _275 = _273 + 1.0;
    float _277 = _100 * _197;
    float _279 = _263 * _275;
    float _281 = _100 * _245;
    float _283 = _100 * _251;
    float _285 = fma(_259, _277, _279);
    float _287 = _281 * _267;
    float _289 = _261 * _271;
    float _291 = fma(_255, _283, _287);
    float _293 = fma(_257, _199, _289);
    if (!_239)
    {
        out.m_51.x = _291;
        out.m_51.y = _293;
        out.m_51.z = _285;
        out.m_51.w = _213;
        return out;
    }
    float _295 = in.m_53.y;
    float _297 = gl_FragCoord.w;
    float _299 = _295 * _297;
    float _301 = in.m_53.x;
    float _303 = gl_FragCoord.w;
    float _305 = _301 * _303;
    float _307 = in.m_53.z;
    float _309 = gl_FragCoord.w;
    float _311 = _307 * _309;
    float _313 = _100 * _299;
    float _315 = _100 * _305;
    float _317 = _100 * _311;
    float _319 = _313 * _313;
    float _321 = in.m_55.x;
    float _323 = gl_FragCoord.w;
    float _325 = _321 * _323;
    float _327 = fma(_315, _315, _319);
    float _329 = fma(_317, _317, _327);
    float _331 = rsqrt(_329);
    float _333 = _315 * _331;
    float _335 = _313 * _331;
    float _337 = _317 * _331;
    float _339 = _100 * _325;
    float _341 = abs(_333);
    float _343 = abs(_335);
    float _345 = precise::max(_341, _343);
    float _347 = abs(_337);
    float _349 = precise::max(_347, _345);
    float _351 = 1.0 / _349;
    float _353 = _335 * _351;
    float _355 = -_351;
    float _357 = _337 * _355;
    float _359 = precise::min(_339, 1.0);
    float _361 = _333 * _351;
    float3 _973 = float3(_361, _353, _357);
    float3 _365 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_973, float3(0.0), isnan(_973)), level(_359)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_973, float3(0.0), isnan(_973)), level(_359)).xyz;
    float _367 = _365.x;
    float _369 = _365.y;
    float _371 = _365.z;
    float _373 = -_129;
    float _375 = _373 + 1.0;
    float _377 = in.m_57.x;
    float _379 = gl_FragCoord.w;
    float _381 = _377 * _379;
    float _383 = in.m_57.z;
    float _385 = gl_FragCoord.w;
    float _387 = _383 * _385;
    float _389 = in.m_57.y;
    float _391 = gl_FragCoord.w;
    float _393 = _389 * _391;
    float _395 = _375 * _375;
    float _397 = in.m_59.z;
    float _399 = gl_FragCoord.w;
    float _401 = _397 * _399;
    float _403 = in.m_59.y;
    float _405 = gl_FragCoord.w;
    float _407 = _403 * _405;
    float _409 = in.m_61.x;
    float _411 = gl_FragCoord.w;
    float _413 = _409 * _411;
    float _415 = _261 * _395;
    float _417 = _281 * _395;
    float _419 = _263 * _395;
    float _421 = in.m_61.y;
    float _423 = gl_FragCoord.w;
    float _425 = _421 * _423;
    float _427 = _415 * (*spvDescriptorSet0.fp_c9)._m0[194].w;
    float _429 = _417 * (*spvDescriptorSet0.fp_c9)._m0[194].w;
    float _431 = _419 * (*spvDescriptorSet0.fp_c9)._m0[194].w;
    float _433 = in.m_59.x;
    float _435 = gl_FragCoord.w;
    float _437 = _433 * _435;
    float _439 = _427 * 0.715200006961822509765625;
    float _441 = in.m_61.z;
    float _443 = gl_FragCoord.w;
    float _445 = _441 * _443;
    float _447 = in.m_61.w;
    float _449 = gl_FragCoord.w;
    float _451 = _447 * _449;
    float _453 = fma(_429, 0.2125999927520751953125, _439);
    bool _455 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _457 = fma(_431, 0.072200000286102294921875, _453);
    float _459 = 1.0 / _457;
    if (_455)
    {
        float _461 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _463 = _173 + _461;
        _253 = _463;
    }
    float _465 = _253;
    float _467 = _100 * _387;
    float _469 = _100 * _401;
    float _471 = _465;
    if (_455)
    {
        float _473 = _465 * 8.0;
        float _475 = precise::clamp(_473, 0.0, 1.0);
        _471 = _475;
    }
    float _477 = _471;
    float _479 = _459 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _481 = precise::clamp(_479, 0.0, 1.0);
    float _483 = _100 * _437;
    float _485 = fma(_481, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _487 = _100 * _381;
    float _489 = _100 * _407;
    float _491 = _100 * _445;
    float _493 = _429 * _485;
    float _495 = _427 * _485;
    float _497 = _431 * _485;
    float _499 = _100 * _425;
    float _501 = fma(_367, 0.20999999344348907470703125, _487);
    float _503 = _100 * _393;
    float _505 = fma(_371, 0.20999999344348907470703125, _467);
    float _507 = _100 * _413;
    float _509 = _501 + _483;
    float _511 = fma(_369, 0.20999999344348907470703125, _503);
    float _513 = _505 + _469;
    float _515 = 0.0 + _227;
    float _517 = precise::clamp(_515, 0.0, 1.0);
    float _519 = _100 * _451;
    float _521 = _511 + _489;
    float _523 = fma(_291, _509, _493);
    float _525 = fma(_285, _513, _497);
    float _527 = _517;
    if (_455)
    {
        float _529 = _517 * _477;
        _527 = _529;
    }
    float _531 = _527;
    float _533 = fma(_293, _521, _495);
    float _535 = fma(_523, _519, _507);
    float _537 = fma(_525, _519, _491);
    float _539 = 0.0 + _531;
    float _541 = precise::clamp(_539, 0.0, 1.0);
    float _543 = fma(_533, _519, _499);
    out.m_51.x = _535;
    out.m_51.y = _543;
    out.m_51.z = _537;
    out.m_51.w = _541;
    return out;
}

