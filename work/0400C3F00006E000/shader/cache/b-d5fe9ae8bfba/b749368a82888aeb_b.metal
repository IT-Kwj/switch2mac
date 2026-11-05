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
    float _70 = in.m_40.z;
    float _72 = gl_FragCoord.w;
    float _74 = _70 * _72;
    float _76 = in.m_40.w;
    float _78 = gl_FragCoord.w;
    float _80 = _76 * _78;
    float _82 = in.m_40.x;
    float _84 = gl_FragCoord.w;
    float _86 = _82 * _84;
    float _88 = in.m_40.y;
    float _90 = gl_FragCoord.w;
    float _92 = _88 * _90;
    float _94 = 1.0 / _68;
    float _96 = _94 * _74;
    float _98 = _94 * _80;
    float _100 = _94 * _86;
    float _102 = _94 * _92;
    float2 _548 = float2(_96, _98);
    float4 _105 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_548, float2(0.0), isnan(_548))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_548, float2(0.0), isnan(_548))).xyzw;
    float _107 = _105.x;
    float _109 = _105.y;
    float _111 = _105.z;
    float _113 = _105.w;
    float2 _567 = float2(_100, _102);
    float4 _115 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_567, float2(0.0), isnan(_567))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_567, float2(0.0), isnan(_567))).xyzw;
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
    float _145 = _94 * _141;
    float _147 = in.m_44.y;
    float _149 = gl_FragCoord.w;
    float _151 = _147 * _149;
    float _153 = in.m_44.x;
    float _155 = gl_FragCoord.w;
    float _157 = _153 * _155;
    float _159 = in.m_44.z;
    float _161 = gl_FragCoord.w;
    float _163 = _159 * _161;
    float _165 = _113 + (-1.0);
    float _167 = _94 * _135;
    float _169 = _123 + _165;
    float _171 = -_143;
    float _173 = _169 + _171;
    float _175 = _167 * _173;
    float _177 = 0.0 + _175;
    float _179 = precise::clamp(_177, 0.0, 1.0);
    float _181 = _179 * _145;
    bool _185 = _181 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _187 = isnan(_181);
    bool _189 = _185 || _187;
    bool _191 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _193 = _189 || _191;
    float _195 = in.m_42.y;
    float _197 = gl_FragCoord.w;
    float _199 = _195 * _197;
    float _201 = in.m_42.z;
    float _203 = gl_FragCoord.w;
    float _205 = _201 * _203;
    float _207 = in.m_42.x;
    float _209 = gl_FragCoord.w;
    float _211 = _207 * _209;
    if (!_193)
    {
        discard_fragment();
    }
    float _213 = _117 * _117;
    float _215 = _119 * _119;
    float _217 = _94 * _157;
    float _219 = _213 * _107;
    float _221 = _215 * _109;
    float _223 = _121 * _121;
    float _225 = _94 * _151;
    float _227 = _223 * _111;
    float _229 = _94 * _199;
    float _231 = _94 * _205;
    float _233 = _94 * _211;
    float _235 = _94 * _163;
    float _237 = -_225;
    float _239 = _229 + _237;
    float _241 = -_217;
    float _243 = _233 + _241;
    float _245 = -_235;
    float _247 = _231 + _245;
    float _249 = fma(_221, _239, _225);
    float _251 = fma(_219, _243, _217);
    float _253 = fma(_227, _247, _235);
    if (!_193)
    {
        out.m_49.x = _251;
        out.m_49.y = _249;
        out.m_49.z = _253;
        out.m_49.w = _175;
        return out;
    }
    float _255 = in.m_51.y;
    float _257 = gl_FragCoord.w;
    float _259 = _255 * _257;
    float _261 = in.m_51.x;
    float _263 = gl_FragCoord.w;
    float _265 = _261 * _263;
    float _267 = in.m_51.z;
    float _269 = gl_FragCoord.w;
    float _271 = _267 * _269;
    float _273 = in.m_53.x;
    float _275 = gl_FragCoord.w;
    float _277 = _273 * _275;
    float _279 = _94 * _259;
    float _281 = _94 * _265;
    float _283 = _94 * _271;
    float _285 = _279 * _279;
    float _287 = fma(_281, _281, _285);
    float _289 = fma(_283, _283, _287);
    float _291 = rsqrt(_289);
    float _293 = _281 * _291;
    float _295 = _279 * _291;
    float _297 = _283 * _291;
    float _299 = _94 * _277;
    float _301 = abs(_293);
    float _303 = abs(_295);
    float _305 = precise::max(_301, _303);
    float _307 = precise::min(_299, 1.0);
    float _309 = abs(_297);
    float _311 = precise::max(_309, _305);
    float _313 = 1.0 / _311;
    float _315 = -_313;
    float _317 = _297 * _315;
    float _319 = _293 * _313;
    float _321 = _295 * _313;
    float3 _864 = float3(_319, _321, _317);
    float3 _325 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_864, float3(0.0), isnan(_864)), level(_307)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_864, float3(0.0), isnan(_864)), level(_307)).xyz;
    float _327 = _325.x;
    float _329 = _325.y;
    float _331 = _325.z;
    float _333 = in.m_55.y;
    float _335 = gl_FragCoord.w;
    float _337 = _333 * _335;
    float _339 = in.m_55.z;
    float _341 = gl_FragCoord.w;
    float _343 = _339 * _341;
    float _345 = in.m_55.x;
    float _347 = gl_FragCoord.w;
    float _349 = _345 * _347;
    float _351 = in.m_57.z;
    float _353 = gl_FragCoord.w;
    float _355 = _351 * _353;
    float _357 = in.m_57.x;
    float _359 = gl_FragCoord.w;
    float _361 = _357 * _359;
    float _363 = in.m_57.y;
    float _365 = gl_FragCoord.w;
    float _367 = _363 * _365;
    float _369 = in.m_59.x;
    float _371 = gl_FragCoord.w;
    float _373 = _369 * _371;
    float _375 = in.m_59.w;
    float _377 = gl_FragCoord.w;
    float _379 = _375 * _377;
    float _381 = in.m_59.y;
    float _383 = gl_FragCoord.w;
    float _385 = _381 * _383;
    float _387 = in.m_59.z;
    float _389 = gl_FragCoord.w;
    float _391 = _387 * _389;
    float _393 = _94 * _337;
    float _395 = _94 * _343;
    float _397 = _94 * _349;
    bool _399 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _401 = _94 * _379;
    float _403 = fma(_331, 0.20999999344348907470703125, _395);
    float _405 = fma(_327, 0.20999999344348907470703125, _397);
    float _407 = _94 * _355;
    float _409 = fma(_329, 0.20999999344348907470703125, _393);
    float _411 = _94 * _361;
    float _413 = _94 * _367;
    float _415 = _403 + _407;
    float _417 = _405 + _411;
    float _419 = _409 + _413;
    float _421 = _253 * _415;
    float _423 = 0.0 + _181;
    float _425 = precise::clamp(_423, 0.0, 1.0);
    float _427 = _251 * _417;
    float _429 = _94 * _373;
    float _431 = _249 * _419;
    float _433 = _94 * _385;
    float _435 = _94 * _391;
    float _437 = fma(_427, _401, _429);
    float _439 = _429;
    if (!_399)
    {
        _439 = _425;
    }
    float _441 = _439;
    float _443 = fma(_431, _401, _433);
    float _445 = fma(_421, _401, _435);
    bool _447 = !_399;
    float _449 = _441;
    if (!_447)
    {
        float _451 = in.m_61.w;
        float _453 = gl_FragCoord.w;
        float _455 = _451 * _453;
        float _457 = in.m_61.z;
        float _459 = gl_FragCoord.w;
        float _461 = _457 * _459;
        float _463 = _94 * _455;
        float _465 = _94 * _461;
        float _467 = 1.0 / _463;
        float _469 = _465 * _467;
        float _471 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _473 = fma(_469, (*spvDescriptorSet0.fp_c8)._m0[30].w, _471);
        float _475 = 1.0 / _473;
        float _477 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _479 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _481 = fma(_475, _477, _479);
        float _483 = _481 * 8.0;
        float _485 = precise::clamp(_483, 0.0, 1.0);
        float _487 = _425 * _485;
        _449 = _487;
    }
    float _489 = _449;
    float _491 = 0.0 + _489;
    float _493 = precise::clamp(_491, 0.0, 1.0);
    out.m_49.x = _437;
    out.m_49.y = _443;
    out.m_49.z = _445;
    out.m_49.w = _493;
    return out;
}

