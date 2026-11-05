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
    float4 m_46 [[user(locn1)]];
    float4 m_44 [[user(locn2)]];
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
    float2 _501 = float2(_82, _84);
    float4 _87 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_501, float2(0.0), isnan(_501))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_501, float2(0.0), isnan(_501))).xyzw;
    float _89 = _87.x;
    float _91 = _87.y;
    float _93 = _87.z;
    float _95 = _87.w;
    float _97 = in.m_40.w;
    float _99 = gl_FragCoord.w;
    float _101 = _97 * _99;
    float _103 = in.m_42.w;
    float _105 = gl_FragCoord.w;
    float _107 = _103 * _105;
    float _109 = in.m_44.x;
    float _111 = gl_FragCoord.w;
    float _113 = _109 * _111;
    float _115 = _80 * _101;
    float _117 = _80 * _107;
    float _119 = in.m_42.y;
    float _121 = gl_FragCoord.w;
    float _123 = _119 * _121;
    float _125 = in.m_46.y;
    float _127 = gl_FragCoord.w;
    float _129 = _125 * _127;
    float _131 = in.m_42.z;
    float _133 = gl_FragCoord.w;
    float _135 = _131 * _133;
    float _137 = in.m_46.z;
    float _139 = gl_FragCoord.w;
    float _141 = _137 * _139;
    float _143 = in.m_40.x;
    float _145 = gl_FragCoord.w;
    float _147 = _143 * _145;
    float _149 = in.m_40.y;
    float _151 = gl_FragCoord.w;
    float _153 = _149 * _151;
    float _155 = in.m_40.z;
    float _157 = gl_FragCoord.w;
    float _159 = _155 * _157;
    float _161 = _80 * _129;
    float _163 = _80 * _135;
    float _165 = _95 * _115;
    float _167 = _117 * _165;
    float _169 = _80 * _113;
    float _171 = 0.0 + _167;
    float _173 = precise::clamp(_171, 0.0, 1.0);
    float _175 = _173 * _169;
    bool _179 = _175 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _181 = isnan(_175);
    bool _183 = _179 || _181;
    bool _185 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _187 = _183 || _185;
    float _189 = in.m_42.x;
    float _191 = gl_FragCoord.w;
    float _193 = _189 * _191;
    float _195 = in.m_46.x;
    float _197 = gl_FragCoord.w;
    float _199 = _195 * _197;
    if (!_187)
    {
        discard_fragment();
    }
    float _201 = _80 * _193;
    float _203 = _80 * _199;
    float _205 = _80 * _123;
    float _207 = _80 * _141;
    float _209 = -_203;
    float _211 = _201 + _209;
    float _213 = -_161;
    float _215 = _205 + _213;
    float _217 = -_207;
    float _219 = _163 + _217;
    float _221 = fma(_89, _211, _203);
    float _223 = fma(_91, _215, _161);
    float _225 = fma(_93, _219, _207);
    float _227 = _80 * _147;
    float _229 = _80 * _153;
    float _231 = _80 * _159;
    float _233 = _221 * _227;
    float _235 = _223 * _229;
    float _237 = _225 * _231;
    if (!_187)
    {
        out.m_49.x = _233;
        out.m_49.y = _235;
        out.m_49.z = _237;
        out.m_49.w = _167;
        return out;
    }
    float _239 = in.m_51.y;
    float _241 = gl_FragCoord.w;
    float _243 = _239 * _241;
    float _245 = in.m_51.x;
    float _247 = gl_FragCoord.w;
    float _249 = _245 * _247;
    float _251 = in.m_51.z;
    float _253 = gl_FragCoord.w;
    float _255 = _251 * _253;
    float _257 = _80 * _243;
    float _259 = _80 * _249;
    float _261 = _80 * _255;
    float _263 = _257 * _257;
    float _265 = fma(_259, _259, _263);
    float _267 = fma(_261, _261, _265);
    float _269 = rsqrt(_267);
    float _271 = _259 * _269;
    float _273 = _257 * _269;
    float _275 = _261 * _269;
    float _277 = abs(_271);
    float _279 = abs(_273);
    float _281 = precise::max(_277, _279);
    float _283 = abs(_275);
    float _285 = precise::max(_283, _281);
    float _287 = 1.0 / _285;
    float _289 = -_287;
    float _291 = _275 * _289;
    float _293 = _271 * _287;
    float _295 = _273 * _287;
    float3 _803 = float3(_293, _295, _291);
    float3 _299 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_803, float3(0.0), isnan(_803)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_803, float3(0.0), isnan(_803)), level(0.0)).xyz;
    float _301 = _299.x;
    float _303 = _299.y;
    float _305 = _299.z;
    float _307 = in.m_53.y;
    float _309 = gl_FragCoord.w;
    float _311 = _307 * _309;
    float _313 = in.m_53.z;
    float _315 = gl_FragCoord.w;
    float _317 = _313 * _315;
    float _319 = in.m_53.x;
    float _321 = gl_FragCoord.w;
    float _323 = _319 * _321;
    float _325 = in.m_55.y;
    float _327 = gl_FragCoord.w;
    float _329 = _325 * _327;
    float _331 = in.m_55.z;
    float _333 = gl_FragCoord.w;
    float _335 = _331 * _333;
    float _337 = in.m_55.x;
    float _339 = gl_FragCoord.w;
    float _341 = _337 * _339;
    float _343 = in.m_57.x;
    float _345 = gl_FragCoord.w;
    float _347 = _343 * _345;
    float _349 = in.m_57.w;
    float _351 = gl_FragCoord.w;
    float _353 = _349 * _351;
    float _355 = in.m_57.y;
    float _357 = gl_FragCoord.w;
    float _359 = _355 * _357;
    float _361 = in.m_57.z;
    float _363 = gl_FragCoord.w;
    float _365 = _361 * _363;
    float _367 = _80 * _311;
    float _369 = _80 * _317;
    float _371 = _80 * _323;
    bool _373 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _375 = fma(_303, 0.20999999344348907470703125, _367);
    float _377 = fma(_305, 0.20999999344348907470703125, _369);
    float _379 = fma(_301, 0.20999999344348907470703125, _371);
    float _381 = _80 * _329;
    float _383 = _80 * _335;
    float _385 = _80 * _341;
    float _387 = _375 + _381;
    float _389 = _377 + _383;
    float _391 = _379 + _385;
    float _393 = _80 * _353;
    float _395 = _235 * _387;
    float _397 = _237 * _389;
    float _399 = _233 * _391;
    float _401 = 0.0 + _175;
    float _403 = precise::clamp(_401, 0.0, 1.0);
    float _405 = _80 * _347;
    float _407 = _80 * _359;
    float _409 = _80 * _365;
    float _411 = fma(_399, _393, _405);
    float _413 = fma(_395, _393, _407);
    float _415 = fma(_397, _393, _409);
    float _417 = _405;
    if (!_373)
    {
        _417 = _403;
    }
    float _419 = _417;
    bool _421 = !_373;
    float _423 = _419;
    if (!_421)
    {
        float _425 = in.m_59.w;
        float _427 = gl_FragCoord.w;
        float _429 = _425 * _427;
        float _431 = in.m_59.z;
        float _433 = gl_FragCoord.w;
        float _435 = _431 * _433;
        float _437 = _80 * _429;
        float _439 = _80 * _435;
        float _441 = 1.0 / _437;
        float _443 = _439 * _441;
        float _445 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _447 = fma(_443, (*spvDescriptorSet0.fp_c8)._m0[30].w, _445);
        float _449 = 1.0 / _447;
        float _451 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _453 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _455 = fma(_449, _451, _453);
        float _457 = _455 * 8.0;
        float _459 = precise::clamp(_457, 0.0, 1.0);
        float _461 = _403 * _459;
        _423 = _461;
    }
    float _463 = _423;
    float _465 = 0.0 + _463;
    float _467 = precise::clamp(_465, 0.0, 1.0);
    out.m_49.x = _411;
    out.m_49.y = _413;
    out.m_49.z = _415;
    out.m_49.w = _467;
    return out;
}

