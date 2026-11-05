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
    texturecube<float> fp_t_tcb_1E [[id(5)]];
    sampler fp_t_tcb_1ESmplr [[id(6)]];
    sampler fp_t_tcb_8Smplr_w [[id(7)]];
    sampler fp_t_tcb_1ESmplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_49 [[color(0)]];
};

struct main0_in
{
    float4 m_42 [[user(locn0)]];
    float4 m_46 [[user(locn1)]];
    float4 m_44 [[user(locn2)]];
    float4 m_55 [[user(locn3)]];
    float4 m_40 [[user(locn4)]];
    float4 m_38 [[user(locn5)]];
    float4 m_61 [[user(locn6)]];
    float4 m_51 [[user(locn7)]];
    float4 m_57 [[user(locn8)]];
    float4 m_53 [[user(locn9)]];
    float4 m_59 [[user(locn10)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _68 = gl_FragCoord.w;
    float _70 = in.m_38.x;
    float _72 = gl_FragCoord.w;
    float _74 = _70 * _72;
    float _76 = in.m_38.y;
    float _78 = gl_FragCoord.w;
    float _80 = _76 * _78;
    float _82 = 1.0 / _68;
    float _84 = _82 * _74;
    float _86 = _82 * _80;
    float2 _519 = float2(_84, _86);
    float4 _89 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_519, float2(0.0), isnan(_519))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_519, float2(0.0), isnan(_519))).xyzw;
    float _91 = _89.x;
    float _93 = _89.y;
    float _95 = _89.z;
    float _97 = _89.w;
    float _99 = in.m_40.w;
    float _101 = gl_FragCoord.w;
    float _103 = _99 * _101;
    float _105 = in.m_42.w;
    float _107 = gl_FragCoord.w;
    float _109 = _105 * _107;
    float _111 = in.m_44.x;
    float _113 = gl_FragCoord.w;
    float _115 = _111 * _113;
    float _117 = _82 * _103;
    float _119 = _82 * _109;
    float _121 = in.m_42.y;
    float _123 = gl_FragCoord.w;
    float _125 = _121 * _123;
    float _127 = in.m_46.y;
    float _129 = gl_FragCoord.w;
    float _131 = _127 * _129;
    float _133 = in.m_42.z;
    float _135 = gl_FragCoord.w;
    float _137 = _133 * _135;
    float _139 = in.m_46.z;
    float _141 = gl_FragCoord.w;
    float _143 = _139 * _141;
    float _145 = in.m_40.x;
    float _147 = gl_FragCoord.w;
    float _149 = _145 * _147;
    float _151 = in.m_40.y;
    float _153 = gl_FragCoord.w;
    float _155 = _151 * _153;
    float _157 = in.m_40.z;
    float _159 = gl_FragCoord.w;
    float _161 = _157 * _159;
    float _163 = _82 * _131;
    float _165 = _82 * _137;
    float _167 = _97 * _117;
    float _169 = _119 * _167;
    float _171 = _82 * _115;
    float _173 = 0.0 + _169;
    float _175 = precise::clamp(_173, 0.0, 1.0);
    float _177 = _175 * _171;
    bool _181 = _177 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _183 = isnan(_177);
    bool _185 = _181 || _183;
    bool _187 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _189 = _185 || _187;
    float _191 = in.m_42.x;
    float _193 = gl_FragCoord.w;
    float _195 = _191 * _193;
    float _197 = in.m_46.x;
    float _199 = gl_FragCoord.w;
    float _201 = _197 * _199;
    if (!_189)
    {
        discard_fragment();
    }
    float _203 = _91 * _91;
    float _205 = _93 * _93;
    float _207 = _95 * _95;
    float _209 = _82 * _195;
    float _211 = _82 * _201;
    float _213 = _82 * _125;
    float _215 = _82 * _143;
    float _217 = -_211;
    float _219 = _209 + _217;
    float _221 = -_163;
    float _223 = _213 + _221;
    float _225 = -_215;
    float _227 = _165 + _225;
    float _229 = fma(_203, _219, _211);
    float _231 = fma(_205, _223, _163);
    float _233 = fma(_207, _227, _215);
    float _235 = _82 * _149;
    float _237 = _82 * _155;
    float _239 = _82 * _161;
    float _241 = _229 * _235;
    float _243 = _231 * _237;
    float _245 = _233 * _239;
    if (!_189)
    {
        out.m_49.x = _241;
        out.m_49.y = _243;
        out.m_49.z = _245;
        out.m_49.w = _169;
        return out;
    }
    float _247 = in.m_51.y;
    float _249 = gl_FragCoord.w;
    float _251 = _247 * _249;
    float _253 = in.m_51.x;
    float _255 = gl_FragCoord.w;
    float _257 = _253 * _255;
    float _259 = in.m_51.z;
    float _261 = gl_FragCoord.w;
    float _263 = _259 * _261;
    float _265 = _82 * _251;
    float _267 = _82 * _257;
    float _269 = _82 * _263;
    float _271 = _265 * _265;
    float _273 = in.m_53.x;
    float _275 = gl_FragCoord.w;
    float _277 = _273 * _275;
    float _279 = fma(_267, _267, _271);
    float _281 = fma(_269, _269, _279);
    float _283 = rsqrt(_281);
    float _285 = _267 * _283;
    float _287 = _265 * _283;
    float _289 = _269 * _283;
    float _291 = _82 * _277;
    float _293 = abs(_285);
    float _295 = abs(_287);
    float _297 = precise::max(_293, _295);
    float _299 = abs(_289);
    float _301 = precise::max(_299, _297);
    float _303 = 1.0 / _301;
    float _305 = _287 * _303;
    float _307 = -_303;
    float _309 = _289 * _307;
    float _311 = precise::min(_291, 1.0);
    float _313 = _285 * _303;
    float3 _842 = float3(_313, _305, _309);
    float3 _317 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_842, float3(0.0), isnan(_842)), level(_311)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_842, float3(0.0), isnan(_842)), level(_311)).xyz;
    float _319 = _317.x;
    float _321 = _317.y;
    float _323 = _317.z;
    float _325 = in.m_55.y;
    float _327 = gl_FragCoord.w;
    float _329 = _325 * _327;
    float _331 = in.m_55.z;
    float _333 = gl_FragCoord.w;
    float _335 = _331 * _333;
    float _337 = in.m_55.x;
    float _339 = gl_FragCoord.w;
    float _341 = _337 * _339;
    float _343 = in.m_57.y;
    float _345 = gl_FragCoord.w;
    float _347 = _343 * _345;
    float _349 = in.m_57.z;
    float _351 = gl_FragCoord.w;
    float _353 = _349 * _351;
    float _355 = in.m_57.x;
    float _357 = gl_FragCoord.w;
    float _359 = _355 * _357;
    float _361 = in.m_59.x;
    float _363 = gl_FragCoord.w;
    float _365 = _361 * _363;
    float _367 = in.m_59.w;
    float _369 = gl_FragCoord.w;
    float _371 = _367 * _369;
    float _373 = in.m_59.y;
    float _375 = gl_FragCoord.w;
    float _377 = _373 * _375;
    float _379 = in.m_59.z;
    float _381 = gl_FragCoord.w;
    float _383 = _379 * _381;
    float _385 = _82 * _329;
    float _387 = _82 * _335;
    float _389 = _82 * _341;
    bool _391 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _393 = fma(_321, 0.20999999344348907470703125, _385);
    float _395 = fma(_323, 0.20999999344348907470703125, _387);
    float _397 = fma(_319, 0.20999999344348907470703125, _389);
    float _399 = _82 * _347;
    float _401 = _82 * _353;
    float _403 = _82 * _359;
    float _405 = _393 + _399;
    float _407 = _395 + _401;
    float _409 = _397 + _403;
    float _411 = _82 * _371;
    float _413 = _243 * _405;
    float _415 = _245 * _407;
    float _417 = _241 * _409;
    float _419 = 0.0 + _177;
    float _421 = precise::clamp(_419, 0.0, 1.0);
    float _423 = _82 * _365;
    float _425 = _82 * _377;
    float _427 = _82 * _383;
    float _429 = fma(_417, _411, _423);
    float _431 = fma(_413, _411, _425);
    float _433 = fma(_415, _411, _427);
    float _435 = _423;
    if (!_391)
    {
        _435 = _421;
    }
    float _437 = _435;
    bool _439 = !_391;
    float _441 = _437;
    if (!_439)
    {
        float _443 = in.m_61.w;
        float _445 = gl_FragCoord.w;
        float _447 = _443 * _445;
        float _449 = in.m_61.z;
        float _451 = gl_FragCoord.w;
        float _453 = _449 * _451;
        float _455 = _82 * _447;
        float _457 = _82 * _453;
        float _459 = 1.0 / _455;
        float _461 = _457 * _459;
        float _463 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _465 = fma(_461, (*spvDescriptorSet0.fp_c8)._m0[30].w, _463);
        float _467 = 1.0 / _465;
        float _469 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _471 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _473 = fma(_467, _469, _471);
        float _475 = _473 * 8.0;
        float _477 = precise::clamp(_475, 0.0, 1.0);
        float _479 = _421 * _477;
        _441 = _479;
    }
    float _481 = _441;
    float _483 = 0.0 + _481;
    float _485 = precise::clamp(_483, 0.0, 1.0);
    out.m_49.x = _429;
    out.m_49.y = _431;
    out.m_49.z = _433;
    out.m_49.w = _485;
    return out;
}

