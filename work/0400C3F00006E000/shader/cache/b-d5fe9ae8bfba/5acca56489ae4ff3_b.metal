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
    texture2d<float> fp_t_tcb_C [[id(3)]];
    sampler fp_t_tcb_CSmplr [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_A [[id(7)]];
    sampler fp_t_tcb_ASmplr [[id(8)]];
    texturecube<float> fp_t_tcb_1E [[id(9)]];
    sampler fp_t_tcb_1ESmplr [[id(10)]];
    sampler fp_t_tcb_CSmplr_w [[id(11)]];
    sampler fp_t_tcb_8Smplr_w [[id(12)]];
    sampler fp_t_tcb_ASmplr_w [[id(13)]];
    sampler fp_t_tcb_1ESmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_53 [[color(0)]];
};

struct main0_in
{
    float4 m_46 [[user(locn0)]];
    float4 m_50 [[user(locn1)]];
    float4 m_44 [[user(locn2)]];
    float4 m_63 [[user(locn3)]];
    float4 m_57 [[user(locn4)]];
    float4 m_48 [[user(locn5)]];
    float4 m_42 [[user(locn6)]];
    float4 m_55 [[user(locn7)]];
    float4 m_59 [[user(locn8)]];
    float4 m_61 [[user(locn9)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _70 = gl_FragCoord.w;
    float _72 = in.m_42.x;
    float _74 = gl_FragCoord.w;
    float _76 = _72 * _74;
    float _78 = in.m_42.y;
    float _80 = gl_FragCoord.w;
    float _82 = _78 * _80;
    float _84 = in.m_44.x;
    float _86 = gl_FragCoord.w;
    float _88 = _84 * _86;
    float _90 = in.m_44.y;
    float _92 = gl_FragCoord.w;
    float _94 = _90 * _92;
    float _96 = in.m_44.z;
    float _98 = gl_FragCoord.w;
    float _100 = _96 * _98;
    float _102 = in.m_44.w;
    float _104 = gl_FragCoord.w;
    float _106 = _102 * _104;
    float _108 = 1.0 / _70;
    float _110 = _108 * _76;
    float _112 = _108 * _82;
    float _114 = _108 * _88;
    float _116 = _108 * _94;
    float _118 = _108 * _100;
    float _120 = _108 * _106;
    float2 _592 = float2(_110, _112);
    float _122 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_592, float2(0.0), isnan(_592))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_592, float2(0.0), isnan(_592))).w;
    float2 _603 = float2(_114, _116);
    float4 _125 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_603, float2(0.0), isnan(_603))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_603, float2(0.0), isnan(_603))).xyzw;
    float _127 = _125.x;
    float _129 = _125.y;
    float _131 = _125.z;
    float _133 = _125.w;
    float2 _619 = float2(_118, _120);
    float4 _135 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_619, float2(0.0), isnan(_619))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_619, float2(0.0), isnan(_619))).xyzw;
    float _137 = _135.x;
    float _139 = _135.y;
    float _141 = _135.z;
    float _143 = _135.w;
    float _145 = in.m_46.w;
    float _147 = gl_FragCoord.w;
    float _149 = _145 * _147;
    float _151 = in.m_48.x;
    float _153 = gl_FragCoord.w;
    float _155 = _151 * _153;
    float _157 = _108 * _149;
    float _159 = _108 * _155;
    float _161 = in.m_50.x;
    float _163 = gl_FragCoord.w;
    float _165 = _161 * _163;
    float _167 = in.m_50.y;
    float _169 = gl_FragCoord.w;
    float _171 = _167 * _169;
    float _173 = in.m_46.y;
    float _175 = gl_FragCoord.w;
    float _177 = _173 * _175;
    float _179 = in.m_46.z;
    float _181 = gl_FragCoord.w;
    float _183 = _179 * _181;
    float _185 = _108 * _165;
    float _187 = _108 * _171;
    float _189 = _122 + (-1.0);
    float _191 = fma(_133, _143, _189);
    float _193 = _157 * _191;
    float _195 = 0.0 + _193;
    float _197 = precise::clamp(_195, 0.0, 1.0);
    float _199 = _197 * _159;
    bool _203 = _199 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _205 = isnan(_199);
    bool _207 = _203 || _205;
    bool _209 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _211 = _207 || _209;
    float _213 = in.m_50.z;
    float _215 = gl_FragCoord.w;
    float _217 = _213 * _215;
    float _219 = in.m_46.x;
    float _221 = gl_FragCoord.w;
    float _223 = _219 * _221;
    if (!_211)
    {
        discard_fragment();
    }
    float _225 = _127 * _137;
    float _227 = _129 * _139;
    float _229 = _131 * _141;
    float _231 = -_225;
    float _233 = _231 + 1.0;
    float _235 = -_227;
    float _237 = _235 + 1.0;
    float _239 = _185 * _233;
    float _241 = _187 * _237;
    float _243 = _108 * _177;
    float _245 = _108 * _183;
    float _247 = fma(_227, _243, _241);
    float _249 = _108 * _217;
    float _251 = -_229;
    float _253 = _251 + 1.0;
    float _255 = _249 * _253;
    float _257 = _108 * _223;
    float _259 = fma(_229, _245, _255);
    float _261 = fma(_225, _257, _239);
    if (!_211)
    {
        out.m_53.x = _261;
        out.m_53.y = _247;
        out.m_53.z = _259;
        out.m_53.w = _193;
        return out;
    }
    float _263 = in.m_55.y;
    float _265 = gl_FragCoord.w;
    float _267 = _263 * _265;
    float _269 = in.m_55.x;
    float _271 = gl_FragCoord.w;
    float _273 = _269 * _271;
    float _275 = in.m_55.z;
    float _277 = gl_FragCoord.w;
    float _279 = _275 * _277;
    float _281 = _108 * _267;
    float _283 = _108 * _273;
    float _285 = _108 * _279;
    float _287 = _281 * _281;
    float _289 = fma(_283, _283, _287);
    float _291 = fma(_285, _285, _289);
    float _293 = rsqrt(_291);
    float _295 = _283 * _293;
    float _297 = _281 * _293;
    float _299 = _285 * _293;
    float _301 = abs(_295);
    float _303 = abs(_297);
    float _305 = precise::max(_301, _303);
    float _307 = abs(_299);
    float _309 = precise::max(_307, _305);
    float _311 = 1.0 / _309;
    float _313 = -_311;
    float _315 = _299 * _313;
    float _317 = _295 * _311;
    float _319 = _297 * _311;
    float3 _887 = float3(_317, _319, _315);
    float3 _323 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_887, float3(0.0), isnan(_887)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_887, float3(0.0), isnan(_887)), level(0.0)).xyz;
    float _325 = _323.x;
    float _327 = _323.y;
    float _329 = _323.z;
    float _331 = _243 * (*spvDescriptorSet0.fp_c9)._m0[194].w;
    float _333 = _257 * (*spvDescriptorSet0.fp_c9)._m0[194].w;
    float _335 = in.m_57.x;
    float _337 = gl_FragCoord.w;
    float _339 = _335 * _337;
    float _341 = _245 * (*spvDescriptorSet0.fp_c9)._m0[194].w;
    float _343 = _331 * 0.715200006961822509765625;
    float _345 = in.m_57.z;
    float _347 = gl_FragCoord.w;
    float _349 = _345 * _347;
    float _351 = in.m_57.y;
    float _353 = gl_FragCoord.w;
    float _355 = _351 * _353;
    float _357 = in.m_59.z;
    float _359 = gl_FragCoord.w;
    float _361 = _357 * _359;
    float _363 = fma(_333, 0.2125999927520751953125, _343);
    float _365 = in.m_59.x;
    float _367 = gl_FragCoord.w;
    float _369 = _365 * _367;
    float _371 = in.m_59.y;
    float _373 = gl_FragCoord.w;
    float _375 = _371 * _373;
    float _377 = in.m_61.w;
    float _379 = gl_FragCoord.w;
    float _381 = _377 * _379;
    float _383 = fma(_341, 0.072200000286102294921875, _363);
    float _385 = in.m_61.x;
    float _387 = gl_FragCoord.w;
    float _389 = _385 * _387;
    float _391 = in.m_61.z;
    float _393 = gl_FragCoord.w;
    float _395 = _391 * _393;
    float _397 = in.m_61.y;
    float _399 = gl_FragCoord.w;
    float _401 = _397 * _399;
    float _403 = 1.0 / _383;
    float _405 = _403 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _407 = precise::clamp(_405, 0.0, 1.0);
    float _409 = fma(_407, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _411 = _108 * _339;
    float _413 = _108 * _349;
    float _415 = _108 * _355;
    float _417 = _333 * _409;
    float _419 = _331 * _409;
    float _421 = _341 * _409;
    float _423 = _108 * _369;
    float _425 = _108 * _375;
    float _427 = _108 * _381;
    bool _429 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _431 = _108 * _395;
    float _433 = _108 * _389;
    float _435 = fma(_325, 0.20999999344348907470703125, _411);
    float _437 = fma(_329, 0.20999999344348907470703125, _413);
    float _439 = _108 * _361;
    float _441 = fma(_327, 0.20999999344348907470703125, _415);
    float _443 = _435 + _423;
    float _445 = 0.0 + _199;
    float _447 = precise::clamp(_445, 0.0, 1.0);
    float _449 = _437 + _439;
    float _451 = _441 + _425;
    float _453 = fma(_261, _443, _417);
    float _455 = _108 * _401;
    float _457 = fma(_259, _449, _421);
    float _459 = fma(_247, _451, _419);
    float _461 = fma(_453, _427, _433);
    float _463 = fma(_457, _427, _431);
    float _465 = fma(_459, _427, _455);
    float _467 = _431;
    if (!_429)
    {
        _467 = _447;
    }
    float _469 = _467;
    bool _471 = !_429;
    float _473 = _469;
    if (!_471)
    {
        float _475 = in.m_63.w;
        float _477 = gl_FragCoord.w;
        float _479 = _475 * _477;
        float _481 = in.m_63.z;
        float _483 = gl_FragCoord.w;
        float _485 = _481 * _483;
        float _487 = _108 * _479;
        float _489 = _108 * _485;
        float _491 = 1.0 / _487;
        float _493 = _489 * _491;
        float _495 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _497 = fma(_493, (*spvDescriptorSet0.fp_c8)._m0[30].w, _495);
        float _499 = 1.0 / _497;
        float _501 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _503 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _505 = fma(_499, _501, _503);
        float _507 = _505 * 8.0;
        float _509 = precise::clamp(_507, 0.0, 1.0);
        float _511 = _447 * _509;
        _473 = _511;
    }
    float _513 = _473;
    float _515 = 0.0 + _513;
    float _517 = precise::clamp(_515, 0.0, 1.0);
    out.m_53.x = _461;
    out.m_53.y = _465;
    out.m_53.z = _463;
    out.m_53.w = _517;
    return out;
}

