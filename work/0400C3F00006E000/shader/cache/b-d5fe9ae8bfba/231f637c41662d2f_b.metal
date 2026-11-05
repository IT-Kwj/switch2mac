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
    float4 m_44 [[user(locn0)]];
    float4 m_46 [[user(locn1)]];
    float4 m_48 [[user(locn2)]];
    float4 m_55 [[user(locn3)]];
    float4 m_42 [[user(locn4), flat]];
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
    float _70 = in.m_40.y;
    float _72 = gl_FragCoord.w;
    float _74 = _70 * _72;
    float _76 = in.m_40.x;
    float _78 = gl_FragCoord.w;
    float _80 = _76 * _78;
    float _82 = 1.0 / _68;
    float _84 = _82 * _74;
    float _86 = _82 * _80;
    float2 _533 = float2(_86, _84);
    float _88 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_533, float2(0.0), isnan(_533))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_533, float2(0.0), isnan(_533))).w;
    float _90 = in.m_42.x;
    float _92 = in.m_40.z;
    float _94 = gl_FragCoord.w;
    float _96 = _92 * _94;
    float _98 = in.m_40.w;
    float _100 = gl_FragCoord.w;
    float _102 = _98 * _100;
    float _104 = _90 * 0.5;
    float _106 = _82 * _96;
    float _108 = _82 * _102;
    float _110 = fma(_88, _104, _106);
    float _112 = fma(_88, _104, _108);
    float2 _579 = float2(_110, _112);
    float4 _115 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_579, float2(0.0), isnan(_579))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_579, float2(0.0), isnan(_579))).xyzw;
    float _117 = _115.x;
    float _119 = _115.y;
    float _121 = _115.z;
    float _123 = _115.w;
    float _125 = in.m_44.w;
    float _127 = gl_FragCoord.w;
    float _129 = _125 * _127;
    float _131 = in.m_46.w;
    float _133 = gl_FragCoord.w;
    float _135 = _131 * _133;
    float _137 = in.m_48.x;
    float _139 = gl_FragCoord.w;
    float _141 = _137 * _139;
    float _143 = _82 * _129;
    float _145 = _82 * _135;
    float _147 = -_143;
    float _149 = _123 + _147;
    float _151 = _149 * _145;
    float _153 = _82 * _141;
    float _155 = 0.0 + _151;
    float _157 = precise::clamp(_155, 0.0, 1.0);
    float _159 = _157 * _153;
    bool _163 = _159 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _165 = isnan(_159);
    bool _167 = _163 || _165;
    bool _169 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _171 = _167 || _169;
    if (!_171)
    {
        discard_fragment();
    }
    if (!_171)
    {
        out.m_51.x = 0.006000000052154064178466796875;
        out.m_51.y = 0.00200000009499490261077880859375;
        out.m_51.z = 0.001000000047497451305389404296875;
        out.m_51.w = _151;
        return out;
    }
    float _173 = in.m_53.y;
    float _175 = gl_FragCoord.w;
    float _177 = _173 * _175;
    float _179 = in.m_53.x;
    float _181 = gl_FragCoord.w;
    float _183 = _179 * _181;
    float _185 = in.m_53.z;
    float _187 = gl_FragCoord.w;
    float _189 = _185 * _187;
    float _191 = _82 * _177;
    float _193 = _82 * _183;
    float _195 = _82 * _189;
    float _197 = _191 * _191;
    float _199 = fma(_193, _193, _197);
    float _201 = fma(_195, _195, _199);
    float _203 = rsqrt(_201);
    float _205 = _193 * _203;
    float _207 = _191 * _203;
    float _209 = _195 * _203;
    float _211 = abs(_205);
    float _213 = abs(_207);
    float _215 = precise::max(_211, _213);
    float _217 = abs(_209);
    float _219 = precise::max(_217, _215);
    float _221 = 1.0 / _219;
    float _223 = -_221;
    float _225 = _209 * _223;
    float _227 = _205 * _221;
    float _229 = _207 * _221;
    float3 _752 = float3(_227, _229, _225);
    float3 _233 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_752, float3(0.0), isnan(_752)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_752, float3(0.0), isnan(_752)), level(0.0)).xyz;
    float _235 = _233.x;
    float _237 = _233.y;
    float _239 = _233.z;
    float _241 = in.m_46.x;
    float _243 = gl_FragCoord.w;
    float _245 = _241 * _243;
    float _247 = in.m_46.y;
    float _249 = gl_FragCoord.w;
    float _251 = _247 * _249;
    float _253 = in.m_46.z;
    float _255 = gl_FragCoord.w;
    float _257 = _253 * _255;
    float _259 = in.m_44.y;
    float _261 = gl_FragCoord.w;
    float _263 = _259 * _261;
    float _265 = in.m_44.x;
    float _267 = gl_FragCoord.w;
    float _269 = _265 * _267;
    float _271 = in.m_44.z;
    float _273 = gl_FragCoord.w;
    float _275 = _271 * _273;
    float _277 = _117 * _117;
    float _279 = _119 * _119;
    float _281 = _121 * _121;
    float _283 = in.m_55.z;
    float _285 = gl_FragCoord.w;
    float _287 = _283 * _285;
    float _289 = -_277;
    float _291 = _289 + 1.0;
    float _293 = -_279;
    float _295 = _293 + 1.0;
    float _297 = -_281;
    float _299 = _297 + 1.0;
    float _301 = in.m_57.z;
    float _303 = gl_FragCoord.w;
    float _305 = _301 * _303;
    float _307 = in.m_57.x;
    float _309 = gl_FragCoord.w;
    float _311 = _307 * _309;
    float _313 = in.m_57.y;
    float _315 = gl_FragCoord.w;
    float _317 = _313 * _315;
    float _319 = 0.0 + _159;
    float _321 = precise::clamp(_319, 0.0, 1.0);
    float _323 = _82 * _245;
    float _325 = _82 * _251;
    float _327 = _82 * _257;
    float _329 = _323 * _291;
    float _331 = _325 * _295;
    float _333 = _82 * _263;
    float _335 = _82 * _269;
    float _337 = _327 * _299;
    float _339 = _82 * _275;
    float _341 = fma(_279, _333, _331);
    float _343 = fma(_277, _335, _329);
    float _345 = in.m_55.y;
    float _347 = gl_FragCoord.w;
    float _349 = _345 * _347;
    float _351 = fma(_281, _339, _337);
    float _353 = _341 * 0.715200006961822509765625;
    float _355 = in.m_55.x;
    float _357 = gl_FragCoord.w;
    float _359 = _355 * _357;
    float _361 = in.m_59.w;
    float _363 = gl_FragCoord.w;
    float _365 = _361 * _363;
    float _367 = in.m_59.x;
    float _369 = gl_FragCoord.w;
    float _371 = _367 * _369;
    float _373 = fma(_343, 0.2125999927520751953125, _353);
    float _375 = in.m_59.y;
    float _377 = gl_FragCoord.w;
    float _379 = _375 * _377;
    float _381 = fma(_351, 0.072200000286102294921875, _373);
    float _383 = in.m_59.z;
    float _385 = gl_FragCoord.w;
    float _387 = _383 * _385;
    float _389 = 1.0 / _381;
    float _391 = _389 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _393 = precise::clamp(_391, 0.0, 1.0);
    float _395 = fma(_393, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _397 = _82 * _349;
    float _399 = _82 * _287;
    float _401 = _82 * _359;
    float _403 = _343 * _395;
    float _405 = _341 * _395;
    float _407 = _351 * _395;
    float _409 = _82 * _311;
    float _411 = _82 * _365;
    float _413 = _82 * _387;
    bool _415 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _417 = _82 * _371;
    float _419 = fma(_235, 0.20999999344348907470703125, _401);
    float _421 = fma(_237, 0.20999999344348907470703125, _397);
    float _423 = fma(_239, 0.20999999344348907470703125, _399);
    float _425 = _82 * _305;
    float _427 = _82 * _317;
    float _429 = _419 + _409;
    float _431 = _423 + _425;
    float _433 = _421 + _427;
    float _435 = fma(_429, 0.006000000052154064178466796875, _403);
    float _437 = _82 * _379;
    float _439 = fma(_431, 0.001000000047497451305389404296875, _407);
    float _441 = fma(_433, 0.00200000009499490261077880859375, _405);
    float _443 = fma(_435, _411, _417);
    float _445 = fma(_439, _411, _413);
    float _447 = fma(_441, _411, _437);
    float _449 = _413;
    if (!_415)
    {
        _449 = _321;
    }
    float _451 = _449;
    bool _453 = !_415;
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
        float _493 = _321 * _491;
        _455 = _493;
    }
    float _495 = _455;
    float _497 = 0.0 + _495;
    float _499 = precise::clamp(_497, 0.0, 1.0);
    out.m_51.x = _443;
    out.m_51.y = _447;
    out.m_51.z = _445;
    out.m_51.w = _499;
    return out;
}

