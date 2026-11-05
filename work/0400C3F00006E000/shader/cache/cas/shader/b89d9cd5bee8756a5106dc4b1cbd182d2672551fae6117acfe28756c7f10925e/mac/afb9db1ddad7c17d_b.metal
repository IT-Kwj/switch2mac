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
    float4 m_40 [[user(locn0)]];
    float4 m_44 [[user(locn1)]];
    float4 m_46 [[user(locn2)]];
    float4 m_55 [[user(locn3)]];
    float4 m_42 [[user(locn4)]];
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
    float2 _527 = float2(_84, _86);
    float4 _89 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_527, float2(0.0), isnan(_527))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_527, float2(0.0), isnan(_527))).xyzw;
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
    float _111 = in.m_44.w;
    float _113 = gl_FragCoord.w;
    float _115 = _111 * _113;
    float _117 = in.m_46.x;
    float _119 = gl_FragCoord.w;
    float _121 = _117 * _119;
    float _123 = _82 * _103;
    float _125 = _82 * _109;
    float _127 = in.m_44.y;
    float _129 = gl_FragCoord.w;
    float _131 = _127 * _129;
    float _133 = in.m_44.x;
    float _135 = gl_FragCoord.w;
    float _137 = _133 * _135;
    float _139 = in.m_40.z;
    float _141 = gl_FragCoord.w;
    float _143 = _139 * _141;
    float _145 = in.m_44.z;
    float _147 = gl_FragCoord.w;
    float _149 = _145 * _147;
    float _151 = in.m_42.x;
    float _153 = gl_FragCoord.w;
    float _155 = _151 * _153;
    float _157 = in.m_42.y;
    float _159 = gl_FragCoord.w;
    float _161 = _157 * _159;
    float _163 = in.m_42.z;
    float _165 = gl_FragCoord.w;
    float _167 = _163 * _165;
    float _169 = _82 * _131;
    float _171 = _82 * _137;
    float _173 = _82 * _143;
    float _175 = -_123;
    float _177 = fma(_97, _125, _175);
    float _179 = _82 * _115;
    float _181 = _177 * 4.0;
    float _183 = precise::clamp(_181, 0.0, 1.0);
    float _185 = _179 * _183;
    float _187 = _82 * _121;
    float _189 = 0.0 + _185;
    float _191 = precise::clamp(_189, 0.0, 1.0);
    float _193 = _191 * _187;
    bool _197 = _193 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _199 = isnan(_193);
    bool _201 = _197 || _199;
    bool _203 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _205 = _201 || _203;
    float _207 = in.m_40.x;
    float _209 = gl_FragCoord.w;
    float _211 = _207 * _209;
    float _213 = in.m_40.y;
    float _215 = gl_FragCoord.w;
    float _217 = _213 * _215;
    if (!_205)
    {
        discard_fragment();
    }
    float _219 = _82 * _211;
    float _221 = _82 * _217;
    float _223 = _82 * _149;
    float _225 = -_171;
    float _227 = _219 + _225;
    float _229 = -_169;
    float _231 = _221 + _229;
    float _233 = -_223;
    float _235 = _173 + _233;
    float _237 = fma(_91, _227, _171);
    float _239 = fma(_93, _231, _169);
    float _241 = fma(_95, _235, _223);
    float _243 = _82 * _155;
    float _245 = _82 * _161;
    float _247 = _82 * _167;
    float _249 = _237 * _243;
    float _251 = _239 * _245;
    float _253 = _241 * _247;
    if (!_205)
    {
        out.m_49.x = _249;
        out.m_49.y = _251;
        out.m_49.z = _253;
        out.m_49.w = _185;
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
    float _273 = _82 * _259;
    float _275 = _82 * _265;
    float _277 = _82 * _271;
    float _279 = _273 * _273;
    float _281 = in.m_53.x;
    float _283 = gl_FragCoord.w;
    float _285 = _281 * _283;
    float _287 = fma(_275, _275, _279);
    float _289 = fma(_277, _277, _287);
    float _291 = rsqrt(_289);
    float _293 = _275 * _291;
    float _295 = _273 * _291;
    float _297 = _277 * _291;
    float _299 = _82 * _285;
    float _301 = abs(_293);
    float _303 = abs(_295);
    float _305 = precise::max(_301, _303);
    float _307 = abs(_297);
    float _309 = precise::max(_307, _305);
    float _311 = 1.0 / _309;
    float _313 = _295 * _311;
    float _315 = -_311;
    float _317 = _297 * _315;
    float _319 = precise::min(_299, 1.0);
    float _321 = _293 * _311;
    float3 _859 = float3(_321, _313, _317);
    float3 _325 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_859, float3(0.0), isnan(_859)), level(_319)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_859, float3(0.0), isnan(_859)), level(_319)).xyz;
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
    float _351 = in.m_57.y;
    float _353 = gl_FragCoord.w;
    float _355 = _351 * _353;
    float _357 = in.m_57.z;
    float _359 = gl_FragCoord.w;
    float _361 = _357 * _359;
    float _363 = in.m_57.x;
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
    float _393 = _82 * _337;
    float _395 = _82 * _343;
    float _397 = _82 * _349;
    bool _399 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _401 = fma(_329, 0.20999999344348907470703125, _393);
    float _403 = fma(_331, 0.20999999344348907470703125, _395);
    float _405 = fma(_327, 0.20999999344348907470703125, _397);
    float _407 = _82 * _355;
    float _409 = _82 * _361;
    float _411 = _82 * _367;
    float _413 = _401 + _407;
    float _415 = _403 + _409;
    float _417 = _405 + _411;
    float _419 = _82 * _379;
    float _421 = _251 * _413;
    float _423 = _253 * _415;
    float _425 = _249 * _417;
    float _427 = 0.0 + _193;
    float _429 = precise::clamp(_427, 0.0, 1.0);
    float _431 = _82 * _373;
    float _433 = _82 * _385;
    float _435 = _82 * _391;
    float _437 = fma(_425, _419, _431);
    float _439 = fma(_421, _419, _433);
    float _441 = fma(_423, _419, _435);
    float _443 = _431;
    if (!_399)
    {
        _443 = _429;
    }
    float _445 = _443;
    bool _447 = !_399;
    float _449 = _445;
    if (!_447)
    {
        float _451 = in.m_61.w;
        float _453 = gl_FragCoord.w;
        float _455 = _451 * _453;
        float _457 = in.m_61.z;
        float _459 = gl_FragCoord.w;
        float _461 = _457 * _459;
        float _463 = _82 * _455;
        float _465 = _82 * _461;
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
        float _487 = _429 * _485;
        _449 = _487;
    }
    float _489 = _449;
    float _491 = 0.0 + _489;
    float _493 = precise::clamp(_491, 0.0, 1.0);
    out.m_49.x = _437;
    out.m_49.y = _439;
    out.m_49.z = _441;
    out.m_49.w = _493;
    return out;
}

