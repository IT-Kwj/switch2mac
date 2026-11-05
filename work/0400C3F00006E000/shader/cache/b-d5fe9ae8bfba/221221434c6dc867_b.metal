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
    constant _16* fp_c8 [[id(0)]];
    constant _16* fp_c10 [[id(1)]];
    constant _16* fp_c9 [[id(2)]];
    constant _16* fp_c15 [[id(3)]];
    texture2d<float> fp_t_tcb_10 [[id(4)]];
    sampler fp_t_tcb_10Smplr [[id(5)]];
    texture2d<float> fp_t_tcb_8 [[id(6)]];
    sampler fp_t_tcb_8Smplr [[id(7)]];
    texturecube<float> fp_t_tcb_1E [[id(8)]];
    sampler fp_t_tcb_1ESmplr [[id(9)]];
    sampler fp_t_tcb_10Smplr_w [[id(10)]];
    sampler fp_t_tcb_8Smplr_w [[id(11)]];
    sampler fp_t_tcb_1ESmplr_w [[id(12)]];
    constant dm_border_t* dm_border [[id(13)]];
};

struct main0_out
{
    float4 m_53 [[color(0)]];
};

struct main0_in
{
    float4 m_46 [[user(locn0)]];
    float4 m_48 [[user(locn1)]];
    float4 m_44 [[user(locn2)]];
    float4 m_42 [[user(locn3)]];
    float4 m_61 [[user(locn4)]];
    float4 m_50 [[user(locn5)]];
    float4 m_55 [[user(locn6)]];
    float4 m_57 [[user(locn8)]];
    float4 m_59 [[user(locn9)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _68 = gl_FragCoord.w;
    float _70 = in.m_42.w;
    float _72 = gl_FragCoord.w;
    float _74 = _70 * _72;
    float _76 = in.m_42.x;
    float _78 = gl_FragCoord.w;
    float _80 = _76 * _78;
    float _82 = in.m_42.y;
    float _84 = gl_FragCoord.w;
    float _86 = _82 * _84;
    float _88 = in.m_44.x;
    float _90 = gl_FragCoord.w;
    float _92 = _88 * _90;
    float _94 = in.m_44.y;
    float _96 = gl_FragCoord.w;
    float _98 = _94 * _96;
    float _100 = 1.0 / _68;
    float _102 = _100 * _74;
    float _104 = _100 * _80;
    float _106 = _100 * _86;
    float _108 = _100 * _92;
    float _110 = 1.0 / _102;
    float _112 = _100 * _98;
    float _114 = _104 * _110;
    float _116 = _106 * _110;
    float2 _595 = float2(_114, _116);
    float _118 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_595, float2(0.0), isnan(_595))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_595, float2(0.0), isnan(_595))).x;
    float2 _606 = float2(_108, _112);
    float4 _121 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_606, float2(0.0), isnan(_606))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_606, float2(0.0), isnan(_606))).xyzw;
    float _123 = _121.x;
    float _125 = _121.y;
    float _127 = _121.z;
    float _129 = _121.w;
    float _131 = in.m_42.z;
    float _133 = gl_FragCoord.w;
    float _135 = _131 * _133;
    float _137 = in.m_46.w;
    float _139 = gl_FragCoord.w;
    float _141 = _137 * _139;
    float _143 = in.m_48.w;
    float _145 = gl_FragCoord.w;
    float _147 = _143 * _145;
    float _149 = in.m_50.x;
    float _151 = gl_FragCoord.w;
    float _153 = _149 * _151;
    float _155 = _100 * _135;
    float _157 = _155 * _110;
    float _159 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _161 = fma(_157, (*spvDescriptorSet0.fp_c8)._m0[30].w, _159);
    float _163 = _100 * _141;
    float _165 = (*spvDescriptorSet0.fp_c10)._m0[3].x + (-1.0);
    float _167 = 1.0 / _161;
    float _169 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _171 = _167 * _169;
    float _173 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _175 = fma(_118, (*spvDescriptorSet0.fp_c8)._m0[30].w, _173);
    float _177 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _179 = 1.0 / _175;
    float _181 = -_163;
    float _183 = _129 + _181;
    float _185 = _183 + _165;
    float _187 = precise::clamp(_185, 0.0, 1.0);
    float _189 = _100 * _147;
    float _191 = _100 * _153;
    float _193 = _187 * _189;
    float _195 = precise::clamp(_193, 0.0, 1.0);
    float _197 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _199 = -_171;
    float _201 = fma(_179, _197, _199);
    float _203 = _201 * _177;
    float _205 = precise::clamp(_203, 0.0, 1.0);
    float _207 = _195 * _205;
    float _209 = _207 * _191;
    bool _213 = _209 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _215 = isnan(_209);
    bool _217 = _213 || _215;
    bool _219 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _221 = _217 || _219;
    float _223 = _171;
    float _225 = _100;
    if (!_221)
    {
        discard_fragment();
    }
    if (!_221)
    {
        out.m_53.x = 0.0599999986588954925537109375;
        out.m_53.y = 0.0199999995529651641845703125;
        out.m_53.z = 0.00999999977648258209228515625;
        out.m_53.w = _195;
        return out;
    }
    float _227 = in.m_55.y;
    float _229 = gl_FragCoord.w;
    float _231 = _227 * _229;
    float _233 = in.m_55.x;
    float _235 = gl_FragCoord.w;
    float _237 = _233 * _235;
    float _239 = in.m_55.z;
    float _241 = gl_FragCoord.w;
    float _243 = _239 * _241;
    float _245 = _100 * _231;
    float _247 = _100 * _237;
    float _249 = _100 * _243;
    float _251 = _245 * _245;
    float _253 = fma(_247, _247, _251);
    float _255 = fma(_249, _249, _253);
    float _257 = rsqrt(_255);
    float _259 = _247 * _257;
    float _261 = _245 * _257;
    float _263 = _249 * _257;
    float _265 = abs(_259);
    float _267 = abs(_261);
    float _269 = precise::max(_265, _267);
    float _271 = abs(_263);
    float _273 = precise::max(_271, _269);
    float _275 = 1.0 / _273;
    float _277 = -_275;
    float _279 = _263 * _277;
    float _281 = _259 * _275;
    float _283 = _261 * _275;
    float3 _851 = float3(_281, _283, _279);
    float3 _287 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_851, float3(0.0), isnan(_851)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_851, float3(0.0), isnan(_851)), level(0.0)).xyz;
    float _289 = _287.x;
    float _291 = _287.y;
    float _293 = _287.z;
    float _295 = in.m_48.y;
    float _297 = gl_FragCoord.w;
    float _299 = _295 * _297;
    float _301 = in.m_48.x;
    float _303 = gl_FragCoord.w;
    float _305 = _301 * _303;
    float _307 = in.m_46.y;
    float _309 = gl_FragCoord.w;
    float _311 = _307 * _309;
    float _313 = in.m_48.z;
    float _315 = gl_FragCoord.w;
    float _317 = _313 * _315;
    float _319 = in.m_46.x;
    float _321 = gl_FragCoord.w;
    float _323 = _319 * _321;
    float _325 = in.m_46.z;
    float _327 = gl_FragCoord.w;
    float _329 = _325 * _327;
    float _331 = _125 * _125;
    float _333 = _123 * _123;
    float _335 = _127 * _127;
    float _337 = in.m_57.y;
    float _339 = gl_FragCoord.w;
    float _341 = _337 * _339;
    float _343 = -_331;
    float _345 = _343 + 1.0;
    float _347 = -_333;
    float _349 = _347 + 1.0;
    float _351 = -_335;
    float _353 = _351 + 1.0;
    float _355 = in.m_57.z;
    float _357 = gl_FragCoord.w;
    float _359 = _355 * _357;
    float _361 = in.m_59.x;
    float _363 = gl_FragCoord.w;
    float _365 = _361 * _363;
    float _367 = in.m_59.y;
    float _369 = gl_FragCoord.w;
    float _371 = _367 * _369;
    float _373 = in.m_59.z;
    float _375 = gl_FragCoord.w;
    float _377 = _373 * _375;
    float _379 = in.m_59.w;
    float _381 = gl_FragCoord.w;
    float _383 = _379 * _381;
    float _385 = _100 * _299;
    float _387 = _100 * _317;
    float _389 = _385 * _345;
    float _391 = _100 * _305;
    float _393 = _100 * _311;
    float _395 = _387 * _353;
    float _397 = in.m_61.y;
    float _399 = gl_FragCoord.w;
    float _401 = _397 * _399;
    float _403 = _391 * _349;
    float _405 = _100 * _323;
    float _407 = fma(_331, _393, _389);
    float _409 = _100 * _329;
    float _411 = in.m_61.z;
    float _413 = gl_FragCoord.w;
    float _415 = _411 * _413;
    float _417 = fma(_333, _405, _403);
    float _419 = _407 * 0.715200006961822509765625;
    float _421 = fma(_335, _409, _395);
    float _423 = in.m_57.x;
    float _425 = gl_FragCoord.w;
    float _427 = _423 * _425;
    float _429 = in.m_61.x;
    float _431 = gl_FragCoord.w;
    float _433 = _429 * _431;
    float _435 = fma(_417, 0.2125999927520751953125, _419);
    float _437 = fma(_421, 0.072200000286102294921875, _435);
    bool _439 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _441 = 1.0 / _437;
    float _443 = _100 * _371;
    if (_439)
    {
        float _445 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _447 = _171 + _445;
        _223 = _447;
    }
    float _449 = _223;
    float _451 = _441 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _453 = precise::clamp(_451, 0.0, 1.0);
    float _455 = fma(_453, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _457 = _100 * _427;
    float _459 = _100 * _433;
    float _461 = _417 * _455;
    float _463 = _407 * _455;
    float _465 = _421 * _455;
    float _467 = _100 * _365;
    float _469 = _100 * _377;
    float _471 = _100 * _383;
    float _473 = fma(_289, 0.20999999344348907470703125, _459);
    float _475 = _100 * _401;
    float _477 = _100 * _415;
    float _479 = _100 * _341;
    float _481 = _100 * _359;
    float _483 = fma(_291, 0.20999999344348907470703125, _475);
    float _485 = fma(_293, 0.20999999344348907470703125, _477);
    float _487 = _473 + _457;
    float _489 = 0.0 + _209;
    float _491 = precise::clamp(_489, 0.0, 1.0);
    float _493 = _483 + _479;
    float _495 = _485 + _481;
    float _497 = _491;
    if (_439)
    {
        float _499 = _449 * 8.0;
        float _501 = precise::clamp(_499, 0.0, 1.0);
        _225 = _501;
    }
    float _503 = _225;
    float _505 = fma(_487, 0.0599999986588954925537109375, _461);
    float _507 = fma(_493, 0.0199999995529651641845703125, _463);
    float _509 = fma(_495, 0.00999999977648258209228515625, _465);
    if (_439)
    {
        float _511 = _491 * _503;
        _497 = _511;
    }
    float _513 = _497;
    float _515 = fma(_505, _471, _467);
    float _517 = fma(_507, _471, _443);
    float _519 = fma(_509, _471, _469);
    float _521 = 0.0 + _513;
    float _523 = precise::clamp(_521, 0.0, 1.0);
    out.m_53.x = _515;
    out.m_53.y = _517;
    out.m_53.z = _519;
    out.m_53.w = _523;
    return out;
}

