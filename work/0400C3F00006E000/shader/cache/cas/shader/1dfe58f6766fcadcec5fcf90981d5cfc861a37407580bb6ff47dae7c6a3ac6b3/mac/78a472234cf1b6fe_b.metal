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
    texture2d<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    texturecube<float> fp_t_tcb_1E [[id(7)]];
    sampler fp_t_tcb_1ESmplr [[id(8)]];
    sampler fp_t_tcb_ASmplr_w [[id(9)]];
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
    float4 m_48 [[user(locn2)]];
    float4 m_57 [[user(locn3)]];
    float4 m_42 [[user(locn4)]];
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
    float _72 = in.m_40.z;
    float _74 = gl_FragCoord.w;
    float _76 = _72 * _74;
    float _78 = in.m_40.x;
    float _80 = gl_FragCoord.w;
    float _82 = _78 * _80;
    float _84 = in.m_40.y;
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
    float2 _552 = float2(_98, _104);
    float _106 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_552, float2(0.0), isnan(_552))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_552, float2(0.0), isnan(_552))).w;
    float2 _563 = float2(_100, _102);
    float4 _109 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_563, float2(0.0), isnan(_563))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_563, float2(0.0), isnan(_563))).xyzw;
    float _111 = _109.x;
    float _113 = _109.y;
    float _115 = _109.z;
    float _117 = _109.w;
    float _119 = in.m_42.x;
    float _121 = gl_FragCoord.w;
    float _123 = _119 * _121;
    float _125 = in.m_44.w;
    float _127 = gl_FragCoord.w;
    float _129 = _125 * _127;
    float _131 = in.m_46.w;
    float _133 = gl_FragCoord.w;
    float _135 = _131 * _133;
    float _137 = in.m_48.x;
    float _139 = gl_FragCoord.w;
    float _141 = _137 * _139;
    float _143 = _96 * _123;
    float _145 = _96 * _129;
    float _147 = -_143;
    float _149 = _147 + 1.0;
    float _151 = _96 * _135;
    float _153 = in.m_46.x;
    float _155 = gl_FragCoord.w;
    float _157 = _153 * _155;
    float _159 = in.m_46.z;
    float _161 = gl_FragCoord.w;
    float _163 = _159 * _161;
    float _165 = in.m_44.x;
    float _167 = gl_FragCoord.w;
    float _169 = _165 * _167;
    float _171 = in.m_44.y;
    float _173 = gl_FragCoord.w;
    float _175 = _171 * _173;
    float _177 = in.m_44.z;
    float _179 = gl_FragCoord.w;
    float _181 = _177 * _179;
    float _183 = -_145;
    float _185 = fma(_117, _106, _183);
    float _187 = _149 * _149;
    float _189 = _151 * _185;
    float _191 = -_187;
    float _193 = fma(_191, _187, 1.0);
    float _195 = _189 * _193;
    float _197 = _96 * _141;
    float _199 = 0.0 + _195;
    float _201 = precise::clamp(_199, 0.0, 1.0);
    float _203 = _201 * _197;
    bool _207 = _203 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _209 = isnan(_203);
    bool _211 = _207 || _209;
    bool _213 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _215 = _211 || _213;
    float _217 = in.m_46.y;
    float _219 = gl_FragCoord.w;
    float _221 = _217 * _219;
    if (!_215)
    {
        discard_fragment();
    }
    float _223 = _96 * _157;
    float _225 = _96 * _163;
    float _227 = -_113;
    float _229 = _227 + 1.0;
    float _231 = -_115;
    float _233 = _231 + 1.0;
    float _235 = _225 * _233;
    float _237 = _96 * _175;
    float _239 = _96 * _221;
    float _241 = -_111;
    float _243 = _241 + 1.0;
    float _245 = _239 * _229;
    float _247 = _223 * _243;
    float _249 = _96 * _169;
    float _251 = _96 * _181;
    float _253 = fma(_111, _249, _247);
    float _255 = fma(_113, _237, _245);
    float _257 = fma(_115, _251, _235);
    if (!_215)
    {
        out.m_51.x = _253;
        out.m_51.y = _255;
        out.m_51.z = _257;
        out.m_51.w = _195;
        return out;
    }
    float _259 = in.m_53.y;
    float _261 = gl_FragCoord.w;
    float _263 = _259 * _261;
    float _265 = in.m_53.x;
    float _267 = gl_FragCoord.w;
    float _269 = _265 * _267;
    float _271 = in.m_53.z;
    float _273 = gl_FragCoord.w;
    float _275 = _271 * _273;
    float _277 = _96 * _263;
    float _279 = _96 * _269;
    float _281 = _96 * _275;
    float _283 = _277 * _277;
    float _285 = in.m_55.x;
    float _287 = gl_FragCoord.w;
    float _289 = _285 * _287;
    float _291 = fma(_279, _279, _283);
    float _293 = fma(_281, _281, _291);
    float _295 = rsqrt(_293);
    float _297 = _279 * _295;
    float _299 = _277 * _295;
    float _301 = _281 * _295;
    float _303 = _96 * _289;
    float _305 = abs(_297);
    float _307 = abs(_299);
    float _309 = precise::max(_305, _307);
    float _311 = abs(_301);
    float _313 = precise::max(_311, _309);
    float _315 = 1.0 / _313;
    float _317 = _299 * _315;
    float _319 = -_315;
    float _321 = _301 * _319;
    float _323 = precise::min(_303, 1.0);
    float _325 = _297 * _315;
    float3 _868 = float3(_325, _317, _321);
    float3 _329 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_868, float3(0.0), isnan(_868)), level(_323)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_868, float3(0.0), isnan(_868)), level(_323)).xyz;
    float _331 = _329.x;
    float _333 = _329.y;
    float _335 = _329.z;
    float _337 = in.m_57.y;
    float _339 = gl_FragCoord.w;
    float _341 = _337 * _339;
    float _343 = in.m_57.z;
    float _345 = gl_FragCoord.w;
    float _347 = _343 * _345;
    float _349 = in.m_57.x;
    float _351 = gl_FragCoord.w;
    float _353 = _349 * _351;
    float _355 = in.m_59.y;
    float _357 = gl_FragCoord.w;
    float _359 = _355 * _357;
    float _361 = in.m_59.z;
    float _363 = gl_FragCoord.w;
    float _365 = _361 * _363;
    float _367 = in.m_59.x;
    float _369 = gl_FragCoord.w;
    float _371 = _367 * _369;
    float _373 = in.m_61.x;
    float _375 = gl_FragCoord.w;
    float _377 = _373 * _375;
    float _379 = in.m_61.w;
    float _381 = gl_FragCoord.w;
    float _383 = _379 * _381;
    float _385 = in.m_61.y;
    float _387 = gl_FragCoord.w;
    float _389 = _385 * _387;
    float _391 = in.m_61.z;
    float _393 = gl_FragCoord.w;
    float _395 = _391 * _393;
    float _397 = _96 * _341;
    float _399 = _96 * _347;
    float _401 = _96 * _353;
    bool _403 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _405 = fma(_333, 0.20999999344348907470703125, _397);
    float _407 = fma(_335, 0.20999999344348907470703125, _399);
    float _409 = _96 * _359;
    float _411 = fma(_331, 0.20999999344348907470703125, _401);
    float _413 = _96 * _365;
    float _415 = _96 * _371;
    float _417 = _405 + _409;
    float _419 = _96 * _395;
    float _421 = _407 + _413;
    float _423 = _411 + _415;
    float _425 = _255 * _417;
    float _427 = 0.0 + _203;
    float _429 = precise::clamp(_427, 0.0, 1.0);
    float _431 = _257 * _421;
    float _433 = _253 * _423;
    float _435 = _96 * _377;
    float _437 = _96 * _383;
    float _439 = _96 * _389;
    float _441 = fma(_433, _437, _435);
    float _443 = fma(_425, _437, _439);
    float _445 = fma(_431, _437, _419);
    float _447 = _435;
    if (!_403)
    {
        _447 = _429;
    }
    float _449 = _447;
    bool _451 = !_403;
    float _453 = _449;
    if (!_451)
    {
        float _455 = in.m_63.w;
        float _457 = gl_FragCoord.w;
        float _459 = _455 * _457;
        float _461 = in.m_63.z;
        float _463 = gl_FragCoord.w;
        float _465 = _461 * _463;
        float _467 = _96 * _459;
        float _469 = _96 * _465;
        float _471 = 1.0 / _467;
        float _473 = _469 * _471;
        float _475 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _477 = fma(_473, (*spvDescriptorSet0.fp_c8)._m0[30].w, _475);
        float _479 = 1.0 / _477;
        float _481 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _483 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _485 = fma(_479, _481, _483);
        float _487 = _485 * 8.0;
        float _489 = precise::clamp(_487, 0.0, 1.0);
        float _491 = _429 * _489;
        _453 = _491;
    }
    float _493 = _453;
    float _495 = 0.0 + _493;
    float _497 = precise::clamp(_495, 0.0, 1.0);
    out.m_51.x = _441;
    out.m_51.y = _443;
    out.m_51.z = _445;
    out.m_51.w = _497;
    return out;
}

