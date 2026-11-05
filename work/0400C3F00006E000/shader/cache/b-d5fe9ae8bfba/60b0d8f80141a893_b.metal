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
    constant _16* fp_c10 [[id(0)]];
    constant _16* fp_c9 [[id(1)]];
    constant _16* fp_c15 [[id(2)]];
    constant _16* fp_c8 [[id(3)]];
    texture2d<float> fp_t_tcb_8 [[id(4)]];
    sampler fp_t_tcb_8Smplr [[id(5)]];
    texturecube<float> fp_t_tcb_1E [[id(6)]];
    sampler fp_t_tcb_1ESmplr [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    sampler fp_t_tcb_1ESmplr_w [[id(9)]];
    constant dm_border_t* dm_border [[id(10)]];
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
    float4 m_59 [[user(locn3)]];
    float4 m_53 [[user(locn4)]];
    float4 m_46 [[user(locn5)]];
    float4 m_51 [[user(locn6)]];
    float4 m_55 [[user(locn8)]];
    float4 m_57 [[user(locn9)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _66 = gl_FragCoord.w;
    float _68 = in.m_40.x;
    float _70 = gl_FragCoord.w;
    float _72 = _68 * _70;
    float _74 = in.m_40.y;
    float _76 = gl_FragCoord.w;
    float _78 = _74 * _76;
    float _80 = 1.0 / _66;
    float _82 = _80 * _72;
    float _84 = _80 * _78;
    float2 _509 = float2(_82, _84);
    float4 _87 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_509, float2(0.0), isnan(_509))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_509, float2(0.0), isnan(_509))).xyzw;
    float _89 = _87.x;
    float _91 = _87.y;
    float _93 = _87.z;
    float _95 = _87.w;
    float _97 = in.m_42.w;
    float _99 = gl_FragCoord.w;
    float _101 = _97 * _99;
    float _103 = in.m_44.w;
    float _105 = gl_FragCoord.w;
    float _107 = _103 * _105;
    float _109 = in.m_46.x;
    float _111 = gl_FragCoord.w;
    float _113 = _109 * _111;
    float _115 = (*spvDescriptorSet0.fp_c10)._m0[3].x + (-1.0);
    float _117 = _80 * _101;
    float _119 = -_117;
    float _121 = _95 + _119;
    float _123 = _80 * _107;
    float _125 = _121 + _115;
    float _127 = precise::clamp(_125, 0.0, 1.0);
    float _129 = _80 * _113;
    float _131 = _127 * _123;
    float _133 = precise::clamp(_131, 0.0, 1.0);
    float _135 = _133 * _129;
    bool _139 = _135 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _141 = isnan(_135);
    bool _143 = _139 || _141;
    bool _145 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _147 = _143 || _145;
    if (!_147)
    {
        discard_fragment();
    }
    if (!_147)
    {
        out.m_49.x = 0.0599999986588954925537109375;
        out.m_49.y = 0.0199999995529651641845703125;
        out.m_49.z = 0.00999999977648258209228515625;
        out.m_49.w = _133;
        return out;
    }
    float _149 = in.m_51.y;
    float _151 = gl_FragCoord.w;
    float _153 = _149 * _151;
    float _155 = in.m_51.x;
    float _157 = gl_FragCoord.w;
    float _159 = _155 * _157;
    float _161 = in.m_51.z;
    float _163 = gl_FragCoord.w;
    float _165 = _161 * _163;
    float _167 = _80 * _153;
    float _169 = _80 * _159;
    float _171 = _80 * _165;
    float _173 = _167 * _167;
    float _175 = fma(_169, _169, _173);
    float _177 = fma(_171, _171, _175);
    float _179 = rsqrt(_177);
    float _181 = _169 * _179;
    float _183 = _167 * _179;
    float _185 = _171 * _179;
    float _187 = abs(_181);
    float _189 = abs(_183);
    float _191 = precise::max(_187, _189);
    float _193 = abs(_185);
    float _195 = precise::max(_193, _191);
    float _197 = 1.0 / _195;
    float _199 = -_197;
    float _201 = _185 * _199;
    float _203 = _181 * _197;
    float _205 = _183 * _197;
    float3 _694 = float3(_203, _205, _201);
    float3 _209 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_694, float3(0.0), isnan(_694)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_694, float3(0.0), isnan(_694)), level(0.0)).xyz;
    float _211 = _209.x;
    float _213 = _209.y;
    float _215 = _209.z;
    float _217 = in.m_44.x;
    float _219 = gl_FragCoord.w;
    float _221 = _217 * _219;
    float _223 = in.m_44.y;
    float _225 = gl_FragCoord.w;
    float _227 = _223 * _225;
    float _229 = in.m_44.z;
    float _231 = gl_FragCoord.w;
    float _233 = _229 * _231;
    float _235 = in.m_42.y;
    float _237 = gl_FragCoord.w;
    float _239 = _235 * _237;
    float _241 = in.m_42.x;
    float _243 = gl_FragCoord.w;
    float _245 = _241 * _243;
    float _247 = in.m_42.z;
    float _249 = gl_FragCoord.w;
    float _251 = _247 * _249;
    float _253 = _89 * _89;
    float _255 = _91 * _91;
    float _257 = _93 * _93;
    float _259 = in.m_53.z;
    float _261 = gl_FragCoord.w;
    float _263 = _259 * _261;
    float _265 = -_253;
    float _267 = _265 + 1.0;
    float _269 = -_255;
    float _271 = _269 + 1.0;
    float _273 = -_257;
    float _275 = _273 + 1.0;
    float _277 = in.m_55.z;
    float _279 = gl_FragCoord.w;
    float _281 = _277 * _279;
    float _283 = in.m_55.x;
    float _285 = gl_FragCoord.w;
    float _287 = _283 * _285;
    float _289 = in.m_55.y;
    float _291 = gl_FragCoord.w;
    float _293 = _289 * _291;
    float _295 = 0.0 + _135;
    float _297 = precise::clamp(_295, 0.0, 1.0);
    float _299 = _80 * _221;
    float _301 = _80 * _227;
    float _303 = _80 * _233;
    float _305 = _299 * _267;
    float _307 = _301 * _271;
    float _309 = _80 * _239;
    float _311 = _80 * _245;
    float _313 = _303 * _275;
    float _315 = _80 * _251;
    float _317 = fma(_255, _309, _307);
    float _319 = fma(_253, _311, _305);
    float _321 = in.m_53.y;
    float _323 = gl_FragCoord.w;
    float _325 = _321 * _323;
    float _327 = fma(_257, _315, _313);
    float _329 = _317 * 0.715200006961822509765625;
    float _331 = in.m_53.x;
    float _333 = gl_FragCoord.w;
    float _335 = _331 * _333;
    float _337 = in.m_57.w;
    float _339 = gl_FragCoord.w;
    float _341 = _337 * _339;
    float _343 = in.m_57.x;
    float _345 = gl_FragCoord.w;
    float _347 = _343 * _345;
    float _349 = fma(_319, 0.2125999927520751953125, _329);
    float _351 = in.m_57.y;
    float _353 = gl_FragCoord.w;
    float _355 = _351 * _353;
    float _357 = fma(_327, 0.072200000286102294921875, _349);
    float _359 = in.m_57.z;
    float _361 = gl_FragCoord.w;
    float _363 = _359 * _361;
    float _365 = 1.0 / _357;
    float _367 = _365 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _369 = precise::clamp(_367, 0.0, 1.0);
    float _371 = fma(_369, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _373 = _80 * _325;
    float _375 = _80 * _263;
    float _377 = _80 * _335;
    float _379 = _319 * _371;
    float _381 = _317 * _371;
    float _383 = _327 * _371;
    float _385 = _80 * _287;
    float _387 = _80 * _341;
    float _389 = _80 * _363;
    bool _391 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _393 = _80 * _347;
    float _395 = fma(_211, 0.20999999344348907470703125, _377);
    float _397 = fma(_213, 0.20999999344348907470703125, _373);
    float _399 = fma(_215, 0.20999999344348907470703125, _375);
    float _401 = _80 * _281;
    float _403 = _80 * _293;
    float _405 = _395 + _385;
    float _407 = _399 + _401;
    float _409 = _397 + _403;
    float _411 = fma(_405, 0.0599999986588954925537109375, _379);
    float _413 = _80 * _355;
    float _415 = fma(_407, 0.00999999977648258209228515625, _383);
    float _417 = fma(_409, 0.0199999995529651641845703125, _381);
    float _419 = fma(_411, _387, _393);
    float _421 = fma(_415, _387, _389);
    float _423 = fma(_417, _387, _413);
    float _425 = _389;
    if (!_391)
    {
        _425 = _297;
    }
    float _427 = _425;
    bool _429 = !_391;
    float _431 = _427;
    if (!_429)
    {
        float _433 = in.m_59.w;
        float _435 = gl_FragCoord.w;
        float _437 = _433 * _435;
        float _439 = in.m_59.z;
        float _441 = gl_FragCoord.w;
        float _443 = _439 * _441;
        float _445 = _80 * _437;
        float _447 = _80 * _443;
        float _449 = 1.0 / _445;
        float _451 = _447 * _449;
        float _453 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _455 = fma(_451, (*spvDescriptorSet0.fp_c8)._m0[30].w, _453);
        float _457 = 1.0 / _455;
        float _459 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _461 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _463 = fma(_457, _459, _461);
        float _465 = _463 * 8.0;
        float _467 = precise::clamp(_465, 0.0, 1.0);
        float _469 = _297 * _467;
        _431 = _469;
    }
    float _471 = _431;
    float _473 = 0.0 + _471;
    float _475 = precise::clamp(_473, 0.0, 1.0);
    out.m_49.x = _419;
    out.m_49.y = _423;
    out.m_49.z = _421;
    out.m_49.w = _475;
    return out;
}

