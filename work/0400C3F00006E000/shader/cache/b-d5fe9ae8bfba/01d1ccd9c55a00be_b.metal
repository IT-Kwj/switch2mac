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
    float4 m_51 [[color(0)]];
};

struct main0_in
{
    float4 m_42 [[user(locn0)]];
    float4 m_46 [[user(locn1)]];
    float4 m_48 [[user(locn2)]];
    float4 m_57 [[user(locn3)]];
    float4 m_44 [[user(locn4)]];
    float4 m_40 [[user(locn5)]];
    float4 m_63 [[user(locn6)]];
    float4 m_53 [[user(locn7)]];
    float4 m_59 [[user(locn8)]];
    float4 m_55 [[user(locn9)]];
    float4 m_61 [[user(locn10)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _70 = gl_FragCoord.w;
    float _72 = in.m_40.x;
    float _74 = gl_FragCoord.w;
    float _76 = _72 * _74;
    float _78 = in.m_40.y;
    float _80 = gl_FragCoord.w;
    float _82 = _78 * _80;
    float _84 = in.m_40.z;
    float _86 = gl_FragCoord.w;
    float _88 = _84 * _86;
    float _90 = in.m_40.w;
    float _92 = gl_FragCoord.w;
    float _94 = _90 * _92;
    float _96 = 1.0 / _70;
    float _98 = _96 * _76;
    float _100 = _96 * _82;
    float _102 = _96 * _88;
    float _104 = _96 * _94;
    float2 _556 = float2(_98, _100);
    float4 _107 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_556, float2(0.0), isnan(_556))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_556, float2(0.0), isnan(_556))).xyzw;
    float _109 = _107.x;
    float _111 = _107.y;
    float _113 = _107.z;
    float _115 = _107.w;
    float2 _575 = float2(_102, _104);
    float4 _117 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_575, float2(0.0), isnan(_575))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_575, float2(0.0), isnan(_575))).xyzw;
    float _119 = _117.x;
    float _121 = _117.y;
    float _123 = _117.z;
    float _125 = _117.w;
    float _127 = in.m_42.w;
    float _129 = gl_FragCoord.w;
    float _131 = _127 * _129;
    float _133 = in.m_44.w;
    float _135 = gl_FragCoord.w;
    float _137 = _133 * _135;
    float _139 = in.m_46.w;
    float _141 = gl_FragCoord.w;
    float _143 = _139 * _141;
    float _145 = in.m_48.x;
    float _147 = gl_FragCoord.w;
    float _149 = _145 * _147;
    float _151 = _96 * _131;
    float _153 = _96 * _137;
    float _155 = _96 * _143;
    float _157 = in.m_42.y;
    float _159 = gl_FragCoord.w;
    float _161 = _157 * _159;
    float _163 = in.m_46.y;
    float _165 = gl_FragCoord.w;
    float _167 = _163 * _165;
    float _169 = in.m_46.x;
    float _171 = gl_FragCoord.w;
    float _173 = _169 * _171;
    float _175 = in.m_46.z;
    float _177 = gl_FragCoord.w;
    float _179 = _175 * _177;
    float _181 = _115 * _125;
    float _183 = -_151;
    float _185 = fma(_181, _153, _183);
    float _187 = _155 * _185;
    float _189 = _96 * _149;
    float _191 = 0.0 + _187;
    float _193 = precise::clamp(_191, 0.0, 1.0);
    float _195 = _193 * _189;
    bool _199 = _195 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _201 = isnan(_195);
    bool _203 = _199 || _201;
    bool _205 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _207 = _203 || _205;
    float _209 = in.m_42.z;
    float _211 = gl_FragCoord.w;
    float _213 = _209 * _211;
    float _215 = in.m_42.x;
    float _217 = gl_FragCoord.w;
    float _219 = _215 * _217;
    if (!_207)
    {
        discard_fragment();
    }
    float _221 = _109 * _109;
    float _223 = _111 * _111;
    float _225 = _96 * _161;
    float _227 = _96 * _167;
    float _229 = _221 * _119;
    float _231 = _113 * _113;
    float _233 = _223 * _121;
    float _235 = _96 * _173;
    float _237 = _231 * _123;
    float _239 = -_227;
    float _241 = _225 + _239;
    float _243 = fma(_233, _241, _227);
    float _245 = _96 * _213;
    float _247 = _96 * _219;
    float _249 = _96 * _179;
    float _251 = -_235;
    float _253 = _247 + _251;
    float _255 = -_249;
    float _257 = _245 + _255;
    float _259 = fma(_229, _253, _235);
    float _261 = fma(_237, _257, _249);
    if (!_207)
    {
        out.m_51.x = _259;
        out.m_51.y = _243;
        out.m_51.z = _261;
        out.m_51.w = _187;
        return out;
    }
    float _263 = in.m_53.y;
    float _265 = gl_FragCoord.w;
    float _267 = _263 * _265;
    float _269 = in.m_53.x;
    float _271 = gl_FragCoord.w;
    float _273 = _269 * _271;
    float _275 = in.m_53.z;
    float _277 = gl_FragCoord.w;
    float _279 = _275 * _277;
    float _281 = _96 * _267;
    float _283 = _96 * _273;
    float _285 = _96 * _279;
    float _287 = _281 * _281;
    float _289 = in.m_55.x;
    float _291 = gl_FragCoord.w;
    float _293 = _289 * _291;
    float _295 = fma(_283, _283, _287);
    float _297 = fma(_285, _285, _295);
    float _299 = rsqrt(_297);
    float _301 = _283 * _299;
    float _303 = _281 * _299;
    float _305 = _285 * _299;
    float _307 = _96 * _293;
    float _309 = abs(_301);
    float _311 = abs(_303);
    float _313 = precise::max(_309, _311);
    float _315 = abs(_305);
    float _317 = precise::max(_315, _313);
    float _319 = 1.0 / _317;
    float _321 = _303 * _319;
    float _323 = -_319;
    float _325 = _305 * _323;
    float _327 = precise::min(_307, 1.0);
    float _329 = _301 * _319;
    float3 _880 = float3(_329, _321, _325);
    float3 _333 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_880, float3(0.0), isnan(_880)), level(_327)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_880, float3(0.0), isnan(_880)), level(_327)).xyz;
    float _335 = _333.x;
    float _337 = _333.y;
    float _339 = _333.z;
    float _341 = in.m_57.y;
    float _343 = gl_FragCoord.w;
    float _345 = _341 * _343;
    float _347 = in.m_57.z;
    float _349 = gl_FragCoord.w;
    float _351 = _347 * _349;
    float _353 = in.m_57.x;
    float _355 = gl_FragCoord.w;
    float _357 = _353 * _355;
    float _359 = in.m_59.y;
    float _361 = gl_FragCoord.w;
    float _363 = _359 * _361;
    float _365 = in.m_59.z;
    float _367 = gl_FragCoord.w;
    float _369 = _365 * _367;
    float _371 = in.m_59.x;
    float _373 = gl_FragCoord.w;
    float _375 = _371 * _373;
    float _377 = in.m_61.x;
    float _379 = gl_FragCoord.w;
    float _381 = _377 * _379;
    float _383 = in.m_61.w;
    float _385 = gl_FragCoord.w;
    float _387 = _383 * _385;
    float _389 = in.m_61.y;
    float _391 = gl_FragCoord.w;
    float _393 = _389 * _391;
    float _395 = in.m_61.z;
    float _397 = gl_FragCoord.w;
    float _399 = _395 * _397;
    float _401 = _96 * _345;
    float _403 = _96 * _351;
    float _405 = _96 * _357;
    bool _407 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _409 = fma(_337, 0.20999999344348907470703125, _401);
    float _411 = fma(_339, 0.20999999344348907470703125, _403);
    float _413 = fma(_335, 0.20999999344348907470703125, _405);
    float _415 = _96 * _363;
    float _417 = _96 * _369;
    float _419 = _96 * _375;
    float _421 = _409 + _415;
    float _423 = _411 + _417;
    float _425 = _413 + _419;
    float _427 = _96 * _387;
    float _429 = _243 * _421;
    float _431 = _261 * _423;
    float _433 = _259 * _425;
    float _435 = 0.0 + _195;
    float _437 = precise::clamp(_435, 0.0, 1.0);
    float _439 = _96 * _381;
    float _441 = _96 * _393;
    float _443 = _96 * _399;
    float _445 = fma(_433, _427, _439);
    float _447 = fma(_429, _427, _441);
    float _449 = fma(_431, _427, _443);
    float _451 = _439;
    if (!_407)
    {
        _451 = _437;
    }
    float _453 = _451;
    bool _455 = !_407;
    float _457 = _453;
    if (!_455)
    {
        float _459 = in.m_63.w;
        float _461 = gl_FragCoord.w;
        float _463 = _459 * _461;
        float _465 = in.m_63.z;
        float _467 = gl_FragCoord.w;
        float _469 = _465 * _467;
        float _471 = _96 * _463;
        float _473 = _96 * _469;
        float _475 = 1.0 / _471;
        float _477 = _473 * _475;
        float _479 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _481 = fma(_477, (*spvDescriptorSet0.fp_c8)._m0[30].w, _479);
        float _483 = 1.0 / _481;
        float _485 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _487 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _489 = fma(_483, _485, _487);
        float _491 = _489 * 8.0;
        float _493 = precise::clamp(_491, 0.0, 1.0);
        float _495 = _437 * _493;
        _457 = _495;
    }
    float _497 = _457;
    float _499 = 0.0 + _497;
    float _501 = precise::clamp(_499, 0.0, 1.0);
    out.m_51.x = _445;
    out.m_51.y = _447;
    out.m_51.z = _449;
    out.m_51.w = _501;
    return out;
}

