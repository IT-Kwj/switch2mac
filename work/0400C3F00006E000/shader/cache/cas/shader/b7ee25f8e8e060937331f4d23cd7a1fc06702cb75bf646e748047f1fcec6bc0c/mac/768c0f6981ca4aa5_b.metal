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
    float2 _533 = float2(_84, _86);
    float4 _89 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_533, float2(0.0), isnan(_533))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_533, float2(0.0), isnan(_533))).xyzw;
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
    float _219 = _91 * _91;
    float _221 = _93 * _93;
    float _223 = _95 * _95;
    float _225 = _82 * _211;
    float _227 = _82 * _217;
    float _229 = _82 * _149;
    float _231 = -_171;
    float _233 = _225 + _231;
    float _235 = -_169;
    float _237 = _227 + _235;
    float _239 = -_229;
    float _241 = _173 + _239;
    float _243 = fma(_219, _233, _171);
    float _245 = fma(_221, _237, _169);
    float _247 = fma(_223, _241, _229);
    float _249 = _82 * _155;
    float _251 = _82 * _161;
    float _253 = _82 * _167;
    float _255 = _243 * _249;
    float _257 = _245 * _251;
    float _259 = _247 * _253;
    if (!_205)
    {
        out.m_49.x = _255;
        out.m_49.y = _257;
        out.m_49.z = _259;
        out.m_49.w = _185;
        return out;
    }
    float _261 = in.m_51.y;
    float _263 = gl_FragCoord.w;
    float _265 = _261 * _263;
    float _267 = in.m_51.x;
    float _269 = gl_FragCoord.w;
    float _271 = _267 * _269;
    float _273 = in.m_51.z;
    float _275 = gl_FragCoord.w;
    float _277 = _273 * _275;
    float _279 = _82 * _265;
    float _281 = _82 * _271;
    float _283 = _82 * _277;
    float _285 = _279 * _279;
    float _287 = in.m_53.x;
    float _289 = gl_FragCoord.w;
    float _291 = _287 * _289;
    float _293 = fma(_281, _281, _285);
    float _295 = fma(_283, _283, _293);
    float _297 = rsqrt(_295);
    float _299 = _281 * _297;
    float _301 = _279 * _297;
    float _303 = _283 * _297;
    float _305 = _82 * _291;
    float _307 = abs(_299);
    float _309 = abs(_301);
    float _311 = precise::max(_307, _309);
    float _313 = abs(_303);
    float _315 = precise::max(_313, _311);
    float _317 = 1.0 / _315;
    float _319 = _301 * _317;
    float _321 = -_317;
    float _323 = _303 * _321;
    float _325 = precise::min(_305, 1.0);
    float _327 = _299 * _317;
    float3 _874 = float3(_327, _319, _323);
    float3 _331 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_874, float3(0.0), isnan(_874)), level(_325)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_874, float3(0.0), isnan(_874)), level(_325)).xyz;
    float _333 = _331.x;
    float _335 = _331.y;
    float _337 = _331.z;
    float _339 = in.m_55.y;
    float _341 = gl_FragCoord.w;
    float _343 = _339 * _341;
    float _345 = in.m_55.z;
    float _347 = gl_FragCoord.w;
    float _349 = _345 * _347;
    float _351 = in.m_55.x;
    float _353 = gl_FragCoord.w;
    float _355 = _351 * _353;
    float _357 = in.m_57.y;
    float _359 = gl_FragCoord.w;
    float _361 = _357 * _359;
    float _363 = in.m_57.z;
    float _365 = gl_FragCoord.w;
    float _367 = _363 * _365;
    float _369 = in.m_57.x;
    float _371 = gl_FragCoord.w;
    float _373 = _369 * _371;
    float _375 = in.m_59.x;
    float _377 = gl_FragCoord.w;
    float _379 = _375 * _377;
    float _381 = in.m_59.w;
    float _383 = gl_FragCoord.w;
    float _385 = _381 * _383;
    float _387 = in.m_59.y;
    float _389 = gl_FragCoord.w;
    float _391 = _387 * _389;
    float _393 = in.m_59.z;
    float _395 = gl_FragCoord.w;
    float _397 = _393 * _395;
    float _399 = _82 * _343;
    float _401 = _82 * _349;
    float _403 = _82 * _355;
    bool _405 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _407 = fma(_335, 0.20999999344348907470703125, _399);
    float _409 = fma(_337, 0.20999999344348907470703125, _401);
    float _411 = fma(_333, 0.20999999344348907470703125, _403);
    float _413 = _82 * _361;
    float _415 = _82 * _367;
    float _417 = _82 * _373;
    float _419 = _407 + _413;
    float _421 = _409 + _415;
    float _423 = _411 + _417;
    float _425 = _82 * _385;
    float _427 = _257 * _419;
    float _429 = _259 * _421;
    float _431 = _255 * _423;
    float _433 = 0.0 + _193;
    float _435 = precise::clamp(_433, 0.0, 1.0);
    float _437 = _82 * _379;
    float _439 = _82 * _391;
    float _441 = _82 * _397;
    float _443 = fma(_431, _425, _437);
    float _445 = fma(_427, _425, _439);
    float _447 = fma(_429, _425, _441);
    float _449 = _437;
    if (!_405)
    {
        _449 = _435;
    }
    float _451 = _449;
    bool _453 = !_405;
    float _455 = _451;
    if (!_453)
    {
        float _457 = in.m_61.w;
        float _459 = gl_FragCoord.w;
        float _461 = _457 * _459;
        float _463 = in.m_61.z;
        float _465 = gl_FragCoord.w;
        float _467 = _463 * _465;
        float _469 = _82 * _461;
        float _471 = _82 * _467;
        float _473 = 1.0 / _469;
        float _475 = _471 * _473;
        float _477 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _479 = fma(_475, (*spvDescriptorSet0.fp_c8)._m0[30].w, _477);
        float _481 = 1.0 / _479;
        float _483 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _485 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _487 = fma(_481, _483, _485);
        float _489 = _487 * 8.0;
        float _491 = precise::clamp(_489, 0.0, 1.0);
        float _493 = _435 * _491;
        _455 = _493;
    }
    float _495 = _455;
    float _497 = 0.0 + _495;
    float _499 = precise::clamp(_497, 0.0, 1.0);
    out.m_49.x = _443;
    out.m_49.y = _445;
    out.m_49.z = _447;
    out.m_49.w = _499;
    return out;
}

