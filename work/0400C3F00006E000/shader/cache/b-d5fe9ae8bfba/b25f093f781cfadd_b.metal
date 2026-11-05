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
    float4 m_42 [[user(locn0)]];
    float4 m_46 [[user(locn1)]];
    float4 m_48 [[user(locn2)]];
    float4 m_55 [[user(locn3)]];
    float4 m_44 [[user(locn4)]];
    float4 m_40 [[user(locn5)]];
    float4 m_61 [[user(locn6)]];
    float4 m_53 [[user(locn7)]];
    float4 m_57 [[user(locn8)]];
    float4 m_59 [[user(locn9)]];
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
    float _88 = in.m_40.z;
    float _90 = gl_FragCoord.w;
    float _92 = _88 * _90;
    float _94 = 1.0 / _68;
    float _96 = _94 * _74;
    float _98 = _94 * _80;
    float _100 = _94 * _86;
    float _102 = _94 * _92;
    float2 _524 = float2(_102, _96);
    float _104 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_524, float2(0.0), isnan(_524))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_524, float2(0.0), isnan(_524))).w;
    float2 _535 = float2(_98, _100);
    float4 _107 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_535, float2(0.0), isnan(_535))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_535, float2(0.0), isnan(_535))).xyzw;
    float _109 = _107.x;
    float _111 = _107.y;
    float _113 = _107.z;
    float _115 = _107.w;
    float _117 = in.m_42.w;
    float _119 = gl_FragCoord.w;
    float _121 = _117 * _119;
    float _123 = in.m_44.w;
    float _125 = gl_FragCoord.w;
    float _127 = _123 * _125;
    float _129 = in.m_46.w;
    float _131 = gl_FragCoord.w;
    float _133 = _129 * _131;
    float _135 = in.m_48.x;
    float _137 = gl_FragCoord.w;
    float _139 = _135 * _137;
    float _141 = _94 * _127;
    float _143 = in.m_42.x;
    float _145 = gl_FragCoord.w;
    float _147 = _143 * _145;
    float _149 = in.m_46.y;
    float _151 = gl_FragCoord.w;
    float _153 = _149 * _151;
    float _155 = in.m_46.z;
    float _157 = gl_FragCoord.w;
    float _159 = _155 * _157;
    float _161 = _94 * _153;
    float _163 = _115 * _104;
    float _165 = _94 * _121;
    float _167 = _94 * _133;
    float _169 = -_165;
    float _171 = fma(_163, _141, _169);
    float _173 = _167 * _171;
    float _175 = _94 * _139;
    float _177 = 0.0 + _173;
    float _179 = precise::clamp(_177, 0.0, 1.0);
    float _181 = _179 * _175;
    bool _185 = _181 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _187 = isnan(_181);
    bool _189 = _185 || _187;
    bool _191 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _193 = _189 || _191;
    float _195 = in.m_46.x;
    float _197 = gl_FragCoord.w;
    float _199 = _195 * _197;
    float _201 = in.m_42.y;
    float _203 = gl_FragCoord.w;
    float _205 = _201 * _203;
    float _207 = in.m_42.z;
    float _209 = gl_FragCoord.w;
    float _211 = _207 * _209;
    if (!_193)
    {
        discard_fragment();
    }
    float _213 = _94 * _147;
    float _215 = _94 * _199;
    float _217 = _94 * _205;
    float _219 = _94 * _211;
    float _221 = _94 * _159;
    float _223 = -_215;
    float _225 = _213 + _223;
    float _227 = -_161;
    float _229 = _217 + _227;
    float _231 = -_221;
    float _233 = _219 + _231;
    float _235 = fma(_109, _225, _215);
    float _237 = fma(_111, _229, _161);
    float _239 = fma(_113, _233, _221);
    if (!_193)
    {
        out.m_51.x = _235;
        out.m_51.y = _237;
        out.m_51.z = _239;
        out.m_51.w = _173;
        return out;
    }
    float _241 = in.m_53.y;
    float _243 = gl_FragCoord.w;
    float _245 = _241 * _243;
    float _247 = in.m_53.x;
    float _249 = gl_FragCoord.w;
    float _251 = _247 * _249;
    float _253 = in.m_53.z;
    float _255 = gl_FragCoord.w;
    float _257 = _253 * _255;
    float _259 = _94 * _245;
    float _261 = _94 * _251;
    float _263 = _94 * _257;
    float _265 = _259 * _259;
    float _267 = fma(_261, _261, _265);
    float _269 = fma(_263, _263, _267);
    float _271 = rsqrt(_269);
    float _273 = _261 * _271;
    float _275 = _259 * _271;
    float _277 = _263 * _271;
    float _279 = abs(_273);
    float _281 = abs(_275);
    float _283 = precise::max(_279, _281);
    float _285 = abs(_277);
    float _287 = precise::max(_285, _283);
    float _289 = 1.0 / _287;
    float _291 = -_289;
    float _293 = _277 * _291;
    float _295 = _273 * _289;
    float _297 = _275 * _289;
    float3 _810 = float3(_295, _297, _293);
    float3 _301 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_810, float3(0.0), isnan(_810)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_810, float3(0.0), isnan(_810)), level(0.0)).xyz;
    float _303 = _301.x;
    float _305 = _301.y;
    float _307 = _301.z;
    float _309 = in.m_55.x;
    float _311 = gl_FragCoord.w;
    float _313 = _309 * _311;
    float _315 = in.m_55.z;
    float _317 = gl_FragCoord.w;
    float _319 = _315 * _317;
    float _321 = in.m_55.y;
    float _323 = gl_FragCoord.w;
    float _325 = _321 * _323;
    float _327 = in.m_57.x;
    float _329 = gl_FragCoord.w;
    float _331 = _327 * _329;
    float _333 = in.m_57.z;
    float _335 = gl_FragCoord.w;
    float _337 = _333 * _335;
    float _339 = in.m_57.y;
    float _341 = gl_FragCoord.w;
    float _343 = _339 * _341;
    float _345 = in.m_59.x;
    float _347 = gl_FragCoord.w;
    float _349 = _345 * _347;
    float _351 = in.m_59.w;
    float _353 = gl_FragCoord.w;
    float _355 = _351 * _353;
    float _357 = in.m_59.y;
    float _359 = gl_FragCoord.w;
    float _361 = _357 * _359;
    float _363 = in.m_59.z;
    float _365 = gl_FragCoord.w;
    float _367 = _363 * _365;
    bool _369 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _371 = _94 * _313;
    float _373 = _94 * _319;
    float _375 = _94 * _325;
    float _377 = fma(_303, 0.20999999344348907470703125, _371);
    float _379 = fma(_307, 0.20999999344348907470703125, _373);
    float _381 = fma(_305, 0.20999999344348907470703125, _375);
    float _383 = _94 * _331;
    float _385 = _94 * _337;
    float _387 = _94 * _343;
    float _389 = _377 + _383;
    float _391 = _379 + _385;
    float _393 = _381 + _387;
    float _395 = 0.0 + _181;
    float _397 = precise::clamp(_395, 0.0, 1.0);
    float _399 = _235 * _389;
    float _401 = _239 * _391;
    float _403 = _237 * _393;
    float _405 = _94 * _349;
    float _407 = _94 * _355;
    float _409 = _94 * _361;
    float _411 = _94 * _367;
    float _413 = fma(_399, _407, _405);
    float _415 = fma(_403, _407, _409);
    float _417 = fma(_401, _407, _411);
    float _419 = _405;
    if (!_369)
    {
        _419 = _397;
    }
    float _421 = _419;
    bool _423 = !_369;
    float _425 = _421;
    if (!_423)
    {
        float _427 = in.m_61.w;
        float _429 = gl_FragCoord.w;
        float _431 = _427 * _429;
        float _433 = in.m_61.z;
        float _435 = gl_FragCoord.w;
        float _437 = _433 * _435;
        float _439 = _94 * _431;
        float _441 = _94 * _437;
        float _443 = 1.0 / _439;
        float _445 = _441 * _443;
        float _447 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _449 = fma(_445, (*spvDescriptorSet0.fp_c8)._m0[30].w, _447);
        float _451 = 1.0 / _449;
        float _453 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _455 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _457 = fma(_451, _453, _455);
        float _459 = _457 * 8.0;
        float _461 = precise::clamp(_459, 0.0, 1.0);
        float _463 = _397 * _461;
        _425 = _463;
    }
    float _465 = _425;
    float _467 = 0.0 + _465;
    float _469 = precise::clamp(_467, 0.0, 1.0);
    out.m_51.x = _413;
    out.m_51.y = _415;
    out.m_51.z = _417;
    out.m_51.w = _469;
    return out;
}

