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
    texture2d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    texturecube<float> fp_t_tcb_1E [[id(7)]];
    sampler fp_t_tcb_1ESmplr [[id(8)]];
    sampler fp_t_tcb_8Smplr_w [[id(9)]];
    sampler fp_t_tcb_ASmplr_w [[id(10)]];
    sampler fp_t_tcb_1ESmplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_49 [[color(0)]];
};

struct main0_in
{
    float4 m_42 [[user(locn0)]];
    float4 m_44 [[user(locn1)]];
    float4 m_40 [[user(locn2)]];
    float4 m_61 [[user(locn3)]];
    float4 m_55 [[user(locn4)]];
    float4 m_46 [[user(locn5)]];
    float4 m_51 [[user(locn6)]];
    float4 m_57 [[user(locn7)]];
    float4 m_53 [[user(locn8)]];
    float4 m_59 [[user(locn9)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _68 = gl_FragCoord.w;
    float _70 = in.m_40.x;
    float _72 = gl_FragCoord.w;
    float _74 = _70 * _72;
    float _76 = in.m_40.y;
    float _78 = gl_FragCoord.w;
    float _80 = _76 * _78;
    float _82 = in.m_40.z;
    float _84 = gl_FragCoord.w;
    float _86 = _82 * _84;
    float _88 = in.m_40.w;
    float _90 = gl_FragCoord.w;
    float _92 = _88 * _90;
    float _94 = 1.0 / _68;
    float _96 = _94 * _74;
    float _98 = _94 * _80;
    float _100 = _94 * _86;
    float _102 = _94 * _92;
    float2 _550 = float2(_96, _98);
    float4 _105 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_550, float2(0.0), isnan(_550))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_550, float2(0.0), isnan(_550))).xyzw;
    float _107 = _105.x;
    float _109 = _105.y;
    float _111 = _105.z;
    float _113 = _105.w;
    float2 _569 = float2(_100, _102);
    float4 _115 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_569, float2(0.0), isnan(_569))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_569, float2(0.0), isnan(_569))).xyzw;
    float _117 = _115.x;
    float _119 = _115.y;
    float _121 = _115.z;
    float _123 = _115.w;
    float _125 = in.m_42.w;
    float _127 = gl_FragCoord.w;
    float _129 = _125 * _127;
    float _131 = in.m_44.w;
    float _133 = gl_FragCoord.w;
    float _135 = _131 * _133;
    float _137 = in.m_46.x;
    float _139 = gl_FragCoord.w;
    float _141 = _137 * _139;
    float _143 = _94 * _129;
    float _145 = _94 * _135;
    float _147 = _94 * _141;
    float _149 = in.m_44.y;
    float _151 = gl_FragCoord.w;
    float _153 = _149 * _151;
    float _155 = in.m_44.x;
    float _157 = gl_FragCoord.w;
    float _159 = _155 * _157;
    float _161 = in.m_42.z;
    float _163 = gl_FragCoord.w;
    float _165 = _161 * _163;
    float _167 = in.m_44.z;
    float _169 = gl_FragCoord.w;
    float _171 = _167 * _169;
    float _173 = -_143;
    float _175 = fma(_113, _123, _173);
    float _177 = _145 * _175;
    float _179 = 0.0 + _177;
    float _181 = precise::clamp(_179, 0.0, 1.0);
    float _183 = _181 * _147;
    bool _187 = _183 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _189 = isnan(_183);
    bool _191 = _187 || _189;
    bool _193 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _195 = _191 || _193;
    float _197 = in.m_42.y;
    float _199 = gl_FragCoord.w;
    float _201 = _197 * _199;
    float _203 = in.m_42.x;
    float _205 = gl_FragCoord.w;
    float _207 = _203 * _205;
    if (!_195)
    {
        discard_fragment();
    }
    float _209 = _107 * _107;
    float _211 = _117 * _117;
    float _213 = _109 * _109;
    float _215 = _119 * _119;
    float _217 = _111 * _111;
    float _219 = _209 * _211;
    float _221 = _121 * _121;
    float _223 = _213 * _215;
    float _225 = _94 * _153;
    float _227 = _94 * _159;
    float _229 = _94 * _165;
    float _231 = _94 * _171;
    float _233 = _217 * _221;
    float _235 = _94 * _201;
    float _237 = _94 * _207;
    float _239 = -_231;
    float _241 = _229 + _239;
    float _243 = -_225;
    float _245 = _235 + _243;
    float _247 = -_227;
    float _249 = _237 + _247;
    float _251 = fma(_223, _245, _225);
    float _253 = fma(_219, _249, _227);
    float _255 = fma(_233, _241, _231);
    if (!_195)
    {
        out.m_49.x = _253;
        out.m_49.y = _251;
        out.m_49.z = _255;
        out.m_49.w = _177;
        return out;
    }
    float _257 = in.m_51.y;
    float _259 = gl_FragCoord.w;
    float _261 = _257 * _259;
    float _263 = in.m_51.x;
    float _265 = gl_FragCoord.w;
    float _267 = _263 * _265;
    float _269 = in.m_51.z;
    float _271 = gl_FragCoord.w;
    float _273 = _269 * _271;
    float _275 = in.m_53.x;
    float _277 = gl_FragCoord.w;
    float _279 = _275 * _277;
    float _281 = _94 * _261;
    float _283 = _94 * _267;
    float _285 = _94 * _273;
    float _287 = _281 * _281;
    float _289 = fma(_283, _283, _287);
    float _291 = fma(_285, _285, _289);
    float _293 = rsqrt(_291);
    float _295 = _283 * _293;
    float _297 = _281 * _293;
    float _299 = _285 * _293;
    float _301 = _94 * _279;
    float _303 = abs(_295);
    float _305 = abs(_297);
    float _307 = precise::max(_303, _305);
    float _309 = precise::min(_301, 1.0);
    float _311 = abs(_299);
    float _313 = precise::max(_311, _307);
    float _315 = 1.0 / _313;
    float _317 = -_315;
    float _319 = _299 * _317;
    float _321 = _295 * _315;
    float _323 = _297 * _315;
    float3 _870 = float3(_321, _323, _319);
    float3 _327 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_870, float3(0.0), isnan(_870)), level(_309)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_870, float3(0.0), isnan(_870)), level(_309)).xyz;
    float _329 = _327.x;
    float _331 = _327.y;
    float _333 = _327.z;
    float _335 = in.m_55.y;
    float _337 = gl_FragCoord.w;
    float _339 = _335 * _337;
    float _341 = in.m_55.z;
    float _343 = gl_FragCoord.w;
    float _345 = _341 * _343;
    float _347 = in.m_55.x;
    float _349 = gl_FragCoord.w;
    float _351 = _347 * _349;
    float _353 = in.m_57.z;
    float _355 = gl_FragCoord.w;
    float _357 = _353 * _355;
    float _359 = in.m_57.x;
    float _361 = gl_FragCoord.w;
    float _363 = _359 * _361;
    float _365 = in.m_57.y;
    float _367 = gl_FragCoord.w;
    float _369 = _365 * _367;
    float _371 = in.m_59.x;
    float _373 = gl_FragCoord.w;
    float _375 = _371 * _373;
    float _377 = in.m_59.w;
    float _379 = gl_FragCoord.w;
    float _381 = _377 * _379;
    float _383 = in.m_59.y;
    float _385 = gl_FragCoord.w;
    float _387 = _383 * _385;
    float _389 = in.m_59.z;
    float _391 = gl_FragCoord.w;
    float _393 = _389 * _391;
    float _395 = _94 * _339;
    float _397 = _94 * _345;
    float _399 = _94 * _351;
    bool _401 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _403 = _94 * _381;
    float _405 = fma(_333, 0.20999999344348907470703125, _397);
    float _407 = fma(_329, 0.20999999344348907470703125, _399);
    float _409 = _94 * _357;
    float _411 = fma(_331, 0.20999999344348907470703125, _395);
    float _413 = _94 * _363;
    float _415 = _94 * _369;
    float _417 = _405 + _409;
    float _419 = _407 + _413;
    float _421 = _411 + _415;
    float _423 = _255 * _417;
    float _425 = 0.0 + _183;
    float _427 = precise::clamp(_425, 0.0, 1.0);
    float _429 = _253 * _419;
    float _431 = _94 * _375;
    float _433 = _251 * _421;
    float _435 = _94 * _387;
    float _437 = _94 * _393;
    float _439 = fma(_429, _403, _431);
    float _441 = _431;
    if (!_401)
    {
        _441 = _427;
    }
    float _443 = _441;
    float _445 = fma(_433, _403, _435);
    float _447 = fma(_423, _403, _437);
    bool _449 = !_401;
    float _451 = _443;
    if (!_449)
    {
        float _453 = in.m_61.w;
        float _455 = gl_FragCoord.w;
        float _457 = _453 * _455;
        float _459 = in.m_61.z;
        float _461 = gl_FragCoord.w;
        float _463 = _459 * _461;
        float _465 = _94 * _457;
        float _467 = _94 * _463;
        float _469 = 1.0 / _465;
        float _471 = _467 * _469;
        float _473 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _475 = fma(_471, (*spvDescriptorSet0.fp_c8)._m0[30].w, _473);
        float _477 = 1.0 / _475;
        float _479 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _481 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _483 = fma(_477, _479, _481);
        float _485 = _483 * 8.0;
        float _487 = precise::clamp(_485, 0.0, 1.0);
        float _489 = _427 * _487;
        _451 = _489;
    }
    float _491 = _451;
    float _493 = 0.0 + _491;
    float _495 = precise::clamp(_493, 0.0, 1.0);
    out.m_49.x = _439;
    out.m_49.y = _445;
    out.m_49.z = _447;
    out.m_49.w = _495;
    return out;
}

