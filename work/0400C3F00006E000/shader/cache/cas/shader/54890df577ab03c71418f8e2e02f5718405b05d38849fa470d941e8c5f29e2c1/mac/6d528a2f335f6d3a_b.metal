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
    float2 _544 = float2(_96, _98);
    float4 _105 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_544, float2(0.0), isnan(_544))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_544, float2(0.0), isnan(_544))).xyzw;
    float _107 = _105.x;
    float _109 = _105.y;
    float _111 = _105.z;
    float _113 = _105.w;
    float2 _563 = float2(_100, _102);
    float4 _115 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_563, float2(0.0), isnan(_563))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_563, float2(0.0), isnan(_563))).xyzw;
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
    float _155 = in.m_42.x;
    float _157 = gl_FragCoord.w;
    float _159 = _155 * _157;
    float _161 = in.m_42.z;
    float _163 = gl_FragCoord.w;
    float _165 = _161 * _163;
    float _167 = in.m_44.z;
    float _169 = gl_FragCoord.w;
    float _171 = _167 * _169;
    float _173 = _94 * _159;
    float _175 = -_143;
    float _177 = fma(_113, _123, _175);
    float _179 = _145 * _177;
    float _181 = 0.0 + _179;
    float _183 = precise::clamp(_181, 0.0, 1.0);
    float _185 = _183 * _147;
    bool _189 = _185 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _191 = isnan(_185);
    bool _193 = _189 || _191;
    bool _195 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _197 = _193 || _195;
    float _199 = in.m_42.y;
    float _201 = gl_FragCoord.w;
    float _203 = _199 * _201;
    float _205 = in.m_44.x;
    float _207 = gl_FragCoord.w;
    float _209 = _205 * _207;
    if (!_197)
    {
        discard_fragment();
    }
    float _211 = _107 * _107;
    float _213 = _109 * _109;
    float _215 = _94 * _153;
    float _217 = _211 * _117;
    float _219 = _111 * _111;
    float _221 = _213 * _119;
    float _223 = _94 * _165;
    float _225 = _94 * _171;
    float _227 = _219 * _121;
    float _229 = _94 * _203;
    float _231 = _94 * _209;
    float _233 = -_215;
    float _235 = _229 + _233;
    float _237 = -_231;
    float _239 = _173 + _237;
    float _241 = -_225;
    float _243 = _223 + _241;
    float _245 = fma(_221, _235, _215);
    float _247 = fma(_217, _239, _231);
    float _249 = fma(_227, _243, _225);
    if (!_197)
    {
        out.m_49.x = _247;
        out.m_49.y = _245;
        out.m_49.z = _249;
        out.m_49.w = _179;
        return out;
    }
    float _251 = in.m_51.y;
    float _253 = gl_FragCoord.w;
    float _255 = _251 * _253;
    float _257 = in.m_51.x;
    float _259 = gl_FragCoord.w;
    float _261 = _257 * _259;
    float _263 = in.m_51.z;
    float _265 = gl_FragCoord.w;
    float _267 = _263 * _265;
    float _269 = in.m_53.x;
    float _271 = gl_FragCoord.w;
    float _273 = _269 * _271;
    float _275 = _94 * _255;
    float _277 = _94 * _261;
    float _279 = _94 * _267;
    float _281 = _275 * _275;
    float _283 = fma(_277, _277, _281);
    float _285 = fma(_279, _279, _283);
    float _287 = rsqrt(_285);
    float _289 = _277 * _287;
    float _291 = _275 * _287;
    float _293 = _279 * _287;
    float _295 = _94 * _273;
    float _297 = abs(_289);
    float _299 = abs(_291);
    float _301 = precise::max(_297, _299);
    float _303 = precise::min(_295, 1.0);
    float _305 = abs(_293);
    float _307 = precise::max(_305, _301);
    float _309 = 1.0 / _307;
    float _311 = -_309;
    float _313 = _293 * _311;
    float _315 = _289 * _309;
    float _317 = _291 * _309;
    float3 _855 = float3(_315, _317, _313);
    float3 _321 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_855, float3(0.0), isnan(_855)), level(_303)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_855, float3(0.0), isnan(_855)), level(_303)).xyz;
    float _323 = _321.x;
    float _325 = _321.y;
    float _327 = _321.z;
    float _329 = in.m_55.y;
    float _331 = gl_FragCoord.w;
    float _333 = _329 * _331;
    float _335 = in.m_55.z;
    float _337 = gl_FragCoord.w;
    float _339 = _335 * _337;
    float _341 = in.m_55.x;
    float _343 = gl_FragCoord.w;
    float _345 = _341 * _343;
    float _347 = in.m_57.z;
    float _349 = gl_FragCoord.w;
    float _351 = _347 * _349;
    float _353 = in.m_57.x;
    float _355 = gl_FragCoord.w;
    float _357 = _353 * _355;
    float _359 = in.m_57.y;
    float _361 = gl_FragCoord.w;
    float _363 = _359 * _361;
    float _365 = in.m_59.x;
    float _367 = gl_FragCoord.w;
    float _369 = _365 * _367;
    float _371 = in.m_59.w;
    float _373 = gl_FragCoord.w;
    float _375 = _371 * _373;
    float _377 = in.m_59.y;
    float _379 = gl_FragCoord.w;
    float _381 = _377 * _379;
    float _383 = in.m_59.z;
    float _385 = gl_FragCoord.w;
    float _387 = _383 * _385;
    float _389 = _94 * _333;
    float _391 = _94 * _339;
    float _393 = _94 * _345;
    bool _395 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _397 = _94 * _375;
    float _399 = fma(_327, 0.20999999344348907470703125, _391);
    float _401 = fma(_323, 0.20999999344348907470703125, _393);
    float _403 = _94 * _351;
    float _405 = fma(_325, 0.20999999344348907470703125, _389);
    float _407 = _94 * _357;
    float _409 = _94 * _363;
    float _411 = _399 + _403;
    float _413 = _401 + _407;
    float _415 = _405 + _409;
    float _417 = _249 * _411;
    float _419 = 0.0 + _185;
    float _421 = precise::clamp(_419, 0.0, 1.0);
    float _423 = _247 * _413;
    float _425 = _94 * _369;
    float _427 = _245 * _415;
    float _429 = _94 * _381;
    float _431 = _94 * _387;
    float _433 = fma(_423, _397, _425);
    float _435 = _425;
    if (!_395)
    {
        _435 = _421;
    }
    float _437 = _435;
    float _439 = fma(_427, _397, _429);
    float _441 = fma(_417, _397, _431);
    bool _443 = !_395;
    float _445 = _437;
    if (!_443)
    {
        float _447 = in.m_61.w;
        float _449 = gl_FragCoord.w;
        float _451 = _447 * _449;
        float _453 = in.m_61.z;
        float _455 = gl_FragCoord.w;
        float _457 = _453 * _455;
        float _459 = _94 * _451;
        float _461 = _94 * _457;
        float _463 = 1.0 / _459;
        float _465 = _461 * _463;
        float _467 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _469 = fma(_465, (*spvDescriptorSet0.fp_c8)._m0[30].w, _467);
        float _471 = 1.0 / _469;
        float _473 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _475 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _477 = fma(_471, _473, _475);
        float _479 = _477 * 8.0;
        float _481 = precise::clamp(_479, 0.0, 1.0);
        float _483 = _421 * _481;
        _445 = _483;
    }
    float _485 = _445;
    float _487 = 0.0 + _485;
    float _489 = precise::clamp(_487, 0.0, 1.0);
    out.m_49.x = _433;
    out.m_49.y = _439;
    out.m_49.z = _441;
    out.m_49.w = _489;
    return out;
}

