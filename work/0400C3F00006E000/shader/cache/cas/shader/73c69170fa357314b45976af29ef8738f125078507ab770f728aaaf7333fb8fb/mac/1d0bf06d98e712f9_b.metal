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
    float4 m_51 [[color(0)]];
};

struct main0_in
{
    float4 m_44 [[user(locn0)]];
    float4 m_46 [[user(locn1)]];
    float4 m_57 [[user(locn2)]];
    float4 m_42 [[user(locn3)]];
    float4 m_40 [[user(locn4)]];
    float4 m_63 [[user(locn5)]];
    float4 m_48 [[user(locn6)]];
    float4 m_38 [[user(locn7)]];
    float4 m_53 [[user(locn8)]];
    float4 m_59 [[user(locn9)]];
    float4 m_55 [[user(locn10)]];
    float4 m_61 [[user(locn11)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _70 = gl_FragCoord.w;
    float _72 = in.m_38.x;
    float _74 = gl_FragCoord.w;
    float _76 = _72 * _74;
    float _78 = in.m_38.y;
    float _80 = gl_FragCoord.w;
    float _82 = _78 * _80;
    float _84 = 1.0 / _70;
    float _86 = _84 * _76;
    float _88 = _84 * _82;
    float2 _541 = float2(_86, _88);
    float4 _91 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_541, float2(0.0), isnan(_541))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_541, float2(0.0), isnan(_541))).xyzw;
    float _93 = _91.x;
    float _95 = _91.y;
    float _97 = _91.z;
    float _99 = _91.w;
    float _101 = in.m_40.x;
    float _103 = gl_FragCoord.w;
    float _105 = _101 * _103;
    float _107 = in.m_42.w;
    float _109 = gl_FragCoord.w;
    float _111 = _107 * _109;
    float _113 = in.m_44.w;
    float _115 = gl_FragCoord.w;
    float _117 = _113 * _115;
    float _119 = in.m_46.w;
    float _121 = gl_FragCoord.w;
    float _123 = _119 * _121;
    float _125 = in.m_48.x;
    float _127 = gl_FragCoord.w;
    float _129 = _125 * _127;
    float _131 = _84 * _105;
    float _133 = _84 * _111;
    float _135 = -_131;
    float _137 = _135 + 1.0;
    float _139 = _133 + (-1.0);
    float _141 = precise::max(0.0, _137);
    float _143 = precise::min(_141, 0.5);
    float _145 = _143 * 2.0;
    float _147 = in.m_46.z;
    float _149 = gl_FragCoord.w;
    float _151 = _147 * _149;
    float _153 = in.m_44.x;
    float _155 = gl_FragCoord.w;
    float _157 = _153 * _155;
    float _159 = in.m_44.y;
    float _161 = gl_FragCoord.w;
    float _163 = _159 * _161;
    float _165 = in.m_44.z;
    float _167 = gl_FragCoord.w;
    float _169 = _165 * _167;
    float _171 = _99 + _139;
    float _173 = precise::clamp(_171, 0.0, 1.0);
    float _175 = _84 * _117;
    float _177 = _84 * _123;
    float _179 = -_175;
    float _181 = _179 + _173;
    float _183 = _145 * _145;
    float _185 = _177 * _181;
    float _187 = precise::clamp(_185, 0.0, 1.0);
    float _189 = _84 * _129;
    float _191 = _187 * _183;
    float _193 = precise::clamp(_191, 0.0, 1.0);
    float _195 = _193 * _189;
    bool _199 = _195 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _201 = isnan(_195);
    bool _203 = _199 || _201;
    bool _205 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _207 = _203 || _205;
    float _209 = in.m_46.y;
    float _211 = gl_FragCoord.w;
    float _213 = _209 * _211;
    float _215 = in.m_46.x;
    float _217 = gl_FragCoord.w;
    float _219 = _215 * _217;
    if (!_207)
    {
        discard_fragment();
    }
    float _221 = _93 * _93;
    float _223 = precise::clamp(_221, 0.0, 1.0);
    float _225 = _97 * _97;
    float _227 = precise::clamp(_225, 0.0, 1.0);
    float _229 = _84 * _151;
    float _231 = -_223;
    float _233 = _231 + 1.0;
    float _235 = -_227;
    float _237 = _235 + 1.0;
    float _239 = _229 * _237;
    float _241 = _84 * _163;
    float _243 = _84 * _213;
    float _245 = _95 * _95;
    float _247 = precise::clamp(_245, 0.0, 1.0);
    float _249 = _84 * _219;
    float _251 = -_247;
    float _253 = _251 + 1.0;
    float _255 = _249 * _233;
    float _257 = _84 * _169;
    float _259 = _243 * _253;
    float _261 = _84 * _157;
    float _263 = fma(_227, _257, _239);
    float _265 = fma(_247, _241, _259);
    float _267 = fma(_223, _261, _255);
    if (!_207)
    {
        out.m_51.x = _267;
        out.m_51.y = _265;
        out.m_51.z = _263;
        out.m_51.w = _193;
        return out;
    }
    float _269 = in.m_53.y;
    float _271 = gl_FragCoord.w;
    float _273 = _269 * _271;
    float _275 = in.m_53.x;
    float _277 = gl_FragCoord.w;
    float _279 = _275 * _277;
    float _281 = in.m_53.z;
    float _283 = gl_FragCoord.w;
    float _285 = _281 * _283;
    float _287 = _84 * _273;
    float _289 = _84 * _279;
    float _291 = _84 * _285;
    float _293 = _287 * _287;
    float _295 = in.m_55.x;
    float _297 = gl_FragCoord.w;
    float _299 = _295 * _297;
    float _301 = fma(_289, _289, _293);
    float _303 = fma(_291, _291, _301);
    float _305 = rsqrt(_303);
    float _307 = _289 * _305;
    float _309 = _287 * _305;
    float _311 = _291 * _305;
    float _313 = _84 * _299;
    float _315 = abs(_307);
    float _317 = abs(_309);
    float _319 = precise::max(_315, _317);
    float _321 = abs(_311);
    float _323 = precise::max(_321, _319);
    float _325 = 1.0 / _323;
    float _327 = _309 * _325;
    float _329 = -_325;
    float _331 = _311 * _329;
    float _333 = precise::min(_313, 1.0);
    float _335 = _307 * _325;
    float3 _885 = float3(_335, _327, _331);
    float3 _339 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_885, float3(0.0), isnan(_885)), level(_333)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_885, float3(0.0), isnan(_885)), level(_333)).xyz;
    float _341 = _339.x;
    float _343 = _339.y;
    float _345 = _339.z;
    float _347 = in.m_57.y;
    float _349 = gl_FragCoord.w;
    float _351 = _347 * _349;
    float _353 = in.m_57.z;
    float _355 = gl_FragCoord.w;
    float _357 = _353 * _355;
    float _359 = in.m_57.x;
    float _361 = gl_FragCoord.w;
    float _363 = _359 * _361;
    float _365 = in.m_59.y;
    float _367 = gl_FragCoord.w;
    float _369 = _365 * _367;
    float _371 = in.m_59.z;
    float _373 = gl_FragCoord.w;
    float _375 = _371 * _373;
    float _377 = in.m_59.x;
    float _379 = gl_FragCoord.w;
    float _381 = _377 * _379;
    float _383 = in.m_61.x;
    float _385 = gl_FragCoord.w;
    float _387 = _383 * _385;
    float _389 = in.m_61.w;
    float _391 = gl_FragCoord.w;
    float _393 = _389 * _391;
    float _395 = in.m_61.y;
    float _397 = gl_FragCoord.w;
    float _399 = _395 * _397;
    float _401 = in.m_61.z;
    float _403 = gl_FragCoord.w;
    float _405 = _401 * _403;
    float _407 = _84 * _351;
    float _409 = _84 * _357;
    float _411 = _84 * _363;
    bool _413 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _415 = fma(_343, 0.20999999344348907470703125, _407);
    float _417 = fma(_345, 0.20999999344348907470703125, _409);
    float _419 = fma(_341, 0.20999999344348907470703125, _411);
    float _421 = _84 * _369;
    float _423 = _84 * _375;
    float _425 = _84 * _381;
    float _427 = _415 + _421;
    float _429 = _417 + _423;
    float _431 = _419 + _425;
    float _433 = _84 * _393;
    float _435 = _265 * _427;
    float _437 = _263 * _429;
    float _439 = _267 * _431;
    float _441 = 0.0 + _195;
    float _443 = precise::clamp(_441, 0.0, 1.0);
    float _445 = _84 * _387;
    float _447 = _84 * _399;
    float _449 = _84 * _405;
    float _451 = fma(_439, _433, _445);
    float _453 = fma(_435, _433, _447);
    float _455 = fma(_437, _433, _449);
    float _457 = _445;
    if (!_413)
    {
        _457 = _443;
    }
    float _459 = _457;
    bool _461 = !_413;
    float _463 = _459;
    if (!_461)
    {
        float _465 = in.m_63.w;
        float _467 = gl_FragCoord.w;
        float _469 = _465 * _467;
        float _471 = in.m_63.z;
        float _473 = gl_FragCoord.w;
        float _475 = _471 * _473;
        float _477 = _84 * _469;
        float _479 = _84 * _475;
        float _481 = 1.0 / _477;
        float _483 = _479 * _481;
        float _485 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _487 = fma(_483, (*spvDescriptorSet0.fp_c8)._m0[30].w, _485);
        float _489 = 1.0 / _487;
        float _491 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _493 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _495 = fma(_489, _491, _493);
        float _497 = _495 * 8.0;
        float _499 = precise::clamp(_497, 0.0, 1.0);
        float _501 = _443 * _499;
        _463 = _501;
    }
    float _503 = _463;
    float _505 = 0.0 + _503;
    float _507 = precise::clamp(_505, 0.0, 1.0);
    out.m_51.x = _451;
    out.m_51.y = _453;
    out.m_51.z = _455;
    out.m_51.w = _507;
    return out;
}

