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
    float4 m_44 [[user(locn1)]];
    float4 m_46 [[user(locn2)]];
    float4 m_53 [[user(locn3)]];
    float4 m_40 [[user(locn4)]];
    float4 m_38 [[user(locn5)]];
    float4 m_59 [[user(locn6)]];
    float4 m_51 [[user(locn7)]];
    float4 m_55 [[user(locn8)]];
    float4 m_57 [[user(locn9)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _66 = gl_FragCoord.w;
    float _68 = in.m_38.x;
    float _70 = gl_FragCoord.w;
    float _72 = _68 * _70;
    float _74 = in.m_38.y;
    float _76 = gl_FragCoord.w;
    float _78 = _74 * _76;
    float _80 = 1.0 / _66;
    float _82 = _80 * _72;
    float _84 = _80 * _78;
    float2 _505 = float2(_82, _84);
    float4 _87 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_505, float2(0.0), isnan(_505))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_505, float2(0.0), isnan(_505))).xyzw;
    float _89 = _87.x;
    float _91 = _87.y;
    float _93 = _87.z;
    float _95 = _87.w;
    float _97 = in.m_40.x;
    float _99 = gl_FragCoord.w;
    float _101 = _97 * _99;
    float _103 = in.m_42.w;
    float _105 = gl_FragCoord.w;
    float _107 = _103 * _105;
    float _109 = in.m_44.w;
    float _111 = gl_FragCoord.w;
    float _113 = _109 * _111;
    float _115 = in.m_46.x;
    float _117 = gl_FragCoord.w;
    float _119 = _115 * _117;
    float _121 = _80 * _101;
    float _123 = _80 * _107;
    float _125 = -_121;
    float _127 = _125 + 1.0;
    float _129 = _127 * _127;
    float _131 = in.m_42.x;
    float _133 = gl_FragCoord.w;
    float _135 = _131 * _133;
    float _137 = in.m_42.y;
    float _139 = gl_FragCoord.w;
    float _141 = _137 * _139;
    float _143 = in.m_42.z;
    float _145 = gl_FragCoord.w;
    float _147 = _143 * _145;
    float _149 = -_123;
    float _151 = _95 + _149;
    float _153 = _80 * _113;
    float _155 = _153 * _151;
    float _157 = -_129;
    float _159 = fma(_157, _129, 1.0);
    float _161 = _155 * _159;
    float _163 = _80 * _119;
    float _165 = 0.0 + _161;
    float _167 = precise::clamp(_165, 0.0, 1.0);
    float _169 = _167 * _163;
    bool _173 = _169 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _175 = isnan(_169);
    bool _177 = _173 || _175;
    bool _179 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _181 = _177 || _179;
    float _183 = in.m_44.x;
    float _185 = gl_FragCoord.w;
    float _187 = _183 * _185;
    float _189 = in.m_44.z;
    float _191 = gl_FragCoord.w;
    float _193 = _189 * _191;
    float _195 = in.m_44.y;
    float _197 = gl_FragCoord.w;
    float _199 = _195 * _197;
    if (!_181)
    {
        discard_fragment();
    }
    float _201 = _89 * _89;
    float _203 = _93 * _93;
    float _205 = _80 * _187;
    float _207 = _91 * _91;
    float _209 = _80 * _193;
    float _211 = _80 * _199;
    float _213 = -_201;
    float _215 = _213 + 1.0;
    float _217 = -_207;
    float _219 = _217 + 1.0;
    float _221 = -_203;
    float _223 = _221 + 1.0;
    float _225 = _205 * _215;
    float _227 = _211 * _219;
    float _229 = _209 * _223;
    float _231 = _80 * _135;
    float _233 = _80 * _141;
    float _235 = _80 * _147;
    float _237 = fma(_201, _231, _225);
    float _239 = fma(_207, _233, _227);
    float _241 = fma(_203, _235, _229);
    if (!_181)
    {
        out.m_49.x = _237;
        out.m_49.y = _239;
        out.m_49.z = _241;
        out.m_49.w = _161;
        return out;
    }
    float _243 = in.m_51.y;
    float _245 = gl_FragCoord.w;
    float _247 = _243 * _245;
    float _249 = in.m_51.x;
    float _251 = gl_FragCoord.w;
    float _253 = _249 * _251;
    float _255 = in.m_51.z;
    float _257 = gl_FragCoord.w;
    float _259 = _255 * _257;
    float _261 = _80 * _247;
    float _263 = _80 * _253;
    float _265 = _80 * _259;
    float _267 = _261 * _261;
    float _269 = fma(_263, _263, _267);
    float _271 = fma(_265, _265, _269);
    float _273 = rsqrt(_271);
    float _275 = _263 * _273;
    float _277 = _261 * _273;
    float _279 = _265 * _273;
    float _281 = abs(_275);
    float _283 = abs(_277);
    float _285 = precise::max(_281, _283);
    float _287 = abs(_279);
    float _289 = precise::max(_287, _285);
    float _291 = 1.0 / _289;
    float _293 = -_291;
    float _295 = _279 * _293;
    float _297 = _275 * _291;
    float _299 = _277 * _291;
    float3 _810 = float3(_297, _299, _295);
    float3 _303 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_810, float3(0.0), isnan(_810)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_810, float3(0.0), isnan(_810)), level(0.0)).xyz;
    float _305 = _303.x;
    float _307 = _303.y;
    float _309 = _303.z;
    float _311 = in.m_53.y;
    float _313 = gl_FragCoord.w;
    float _315 = _311 * _313;
    float _317 = in.m_53.z;
    float _319 = gl_FragCoord.w;
    float _321 = _317 * _319;
    float _323 = in.m_53.x;
    float _325 = gl_FragCoord.w;
    float _327 = _323 * _325;
    float _329 = in.m_55.y;
    float _331 = gl_FragCoord.w;
    float _333 = _329 * _331;
    float _335 = in.m_55.z;
    float _337 = gl_FragCoord.w;
    float _339 = _335 * _337;
    float _341 = in.m_55.x;
    float _343 = gl_FragCoord.w;
    float _345 = _341 * _343;
    float _347 = in.m_57.x;
    float _349 = gl_FragCoord.w;
    float _351 = _347 * _349;
    float _353 = in.m_57.w;
    float _355 = gl_FragCoord.w;
    float _357 = _353 * _355;
    float _359 = in.m_57.y;
    float _361 = gl_FragCoord.w;
    float _363 = _359 * _361;
    float _365 = in.m_57.z;
    float _367 = gl_FragCoord.w;
    float _369 = _365 * _367;
    float _371 = _80 * _315;
    float _373 = _80 * _321;
    float _375 = _80 * _327;
    bool _377 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _379 = fma(_307, 0.20999999344348907470703125, _371);
    float _381 = fma(_309, 0.20999999344348907470703125, _373);
    float _383 = fma(_305, 0.20999999344348907470703125, _375);
    float _385 = _80 * _333;
    float _387 = _80 * _339;
    float _389 = _80 * _345;
    float _391 = _379 + _385;
    float _393 = _381 + _387;
    float _395 = _383 + _389;
    float _397 = _80 * _357;
    float _399 = _239 * _391;
    float _401 = _241 * _393;
    float _403 = _237 * _395;
    float _405 = 0.0 + _169;
    float _407 = precise::clamp(_405, 0.0, 1.0);
    float _409 = _80 * _351;
    float _411 = _80 * _363;
    float _413 = _80 * _369;
    float _415 = fma(_403, _397, _409);
    float _417 = fma(_399, _397, _411);
    float _419 = fma(_401, _397, _413);
    float _421 = _409;
    if (!_377)
    {
        _421 = _407;
    }
    float _423 = _421;
    bool _425 = !_377;
    float _427 = _423;
    if (!_425)
    {
        float _429 = in.m_59.w;
        float _431 = gl_FragCoord.w;
        float _433 = _429 * _431;
        float _435 = in.m_59.z;
        float _437 = gl_FragCoord.w;
        float _439 = _435 * _437;
        float _441 = _80 * _433;
        float _443 = _80 * _439;
        float _445 = 1.0 / _441;
        float _447 = _443 * _445;
        float _449 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _451 = fma(_447, (*spvDescriptorSet0.fp_c8)._m0[30].w, _449);
        float _453 = 1.0 / _451;
        float _455 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _457 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _459 = fma(_453, _455, _457);
        float _461 = _459 * 8.0;
        float _463 = precise::clamp(_461, 0.0, 1.0);
        float _465 = _407 * _463;
        _427 = _465;
    }
    float _467 = _427;
    float _469 = 0.0 + _467;
    float _471 = precise::clamp(_469, 0.0, 1.0);
    out.m_49.x = _415;
    out.m_49.y = _417;
    out.m_49.z = _419;
    out.m_49.w = _471;
    return out;
}

