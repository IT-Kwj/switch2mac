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
    float4 m_51 [[color(0)]];
};

struct main0_in
{
    float4 m_44 [[user(locn0)]];
    float4 m_46 [[user(locn1)]];
    float4 m_57 [[user(locn2)]];
    float4 m_42 [[user(locn3)]];
    float4 m_40 [[user(locn4)]];
    float4 m_63 [[user(locn5)]];
    float4 m_48 [[user(locn6)]];
    float4 m_38 [[user(locn7)]];
    float4 m_53 [[user(locn8)]];
    float4 m_59 [[user(locn9)]];
    float4 m_55 [[user(locn10)]];
    float4 m_61 [[user(locn11)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _70 = gl_FragCoord.w;
    float _72 = in.m_38.x;
    float _74 = gl_FragCoord.w;
    float _76 = _72 * _74;
    float _78 = in.m_38.y;
    float _80 = gl_FragCoord.w;
    float _82 = _78 * _80;
    float _84 = 1.0 / _70;
    float _86 = _84 * _76;
    float _88 = _84 * _82;
    float2 _567 = float2(_86, _88);
    float4 _91 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_567, float2(0.0), isnan(_567))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_567, float2(0.0), isnan(_567))).xyzw;
    float _93 = _91.x;
    float _95 = _91.y;
    float _97 = _91.z;
    float _99 = _91.w;
    float _101 = in.m_40.x;
    float _103 = gl_FragCoord.w;
    float _105 = _101 * _103;
    float _107 = in.m_42.w;
    float _109 = gl_FragCoord.w;
    float _111 = _107 * _109;
    float _113 = in.m_44.w;
    float _115 = gl_FragCoord.w;
    float _117 = _113 * _115;
    float _119 = in.m_46.w;
    float _121 = gl_FragCoord.w;
    float _123 = _119 * _121;
    float _125 = in.m_48.x;
    float _127 = gl_FragCoord.w;
    float _129 = _125 * _127;
    float _131 = _84 * _105;
    float _133 = _84 * _111;
    float _135 = -_131;
    float _137 = _135 + 1.0;
    float _139 = _133 + (-1.0);
    float _141 = precise::max(0.0, _137);
    float _143 = precise::min(_141, 0.5);
    float _145 = _143 * 2.0;
    float _147 = in.m_46.z;
    float _149 = gl_FragCoord.w;
    float _151 = _147 * _149;
    float _153 = in.m_44.y;
    float _155 = gl_FragCoord.w;
    float _157 = _153 * _155;
    float _159 = in.m_44.x;
    float _161 = gl_FragCoord.w;
    float _163 = _159 * _161;
    float _165 = in.m_44.z;
    float _167 = gl_FragCoord.w;
    float _169 = _165 * _167;
    float _171 = _84 * _157;
    float _173 = _99 + _139;
    float _175 = precise::clamp(_173, 0.0, 1.0);
    float _177 = _84 * _117;
    float _179 = _84 * _123;
    float _181 = -_177;
    float _183 = _181 + _175;
    float _185 = _145 * _145;
    float _187 = _179 * _183;
    float _189 = precise::clamp(_187, 0.0, 1.0);
    float _191 = _84 * _129;
    float _193 = _189 * _185;
    float _195 = precise::clamp(_193, 0.0, 1.0);
    float _197 = _195 * _191;
    bool _201 = _197 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _203 = isnan(_197);
    bool _205 = _201 || _203;
    bool _207 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _209 = _205 || _207;
    float _211 = in.m_46.x;
    float _213 = gl_FragCoord.w;
    float _215 = _211 * _213;
    float _217 = in.m_46.y;
    float _219 = gl_FragCoord.w;
    float _221 = _217 * _219;
    if (!_209)
    {
        discard_fragment();
    }
    float _223 = _93 * _93;
    float _225 = precise::clamp(_223, 0.0, 1.0);
    float _227 = _84 * _151;
    float _229 = -_225;
    float _231 = _229 + 1.0;
    float _233 = _84 * _215;
    float _235 = _95 * _95;
    float _237 = precise::clamp(_235, 0.0, 1.0);
    float _239 = _97 * _97;
    float _241 = precise::clamp(_239, 0.0, 1.0);
    float _243 = _84 * _221;
    float _245 = _233 * _231;
    float _247 = -_237;
    float _249 = _247 + 1.0;
    float _251 = -_241;
    float _253 = _251 + 1.0;
    float _255 = _243 * _249;
    float _257 = _227 * _253;
    float _259 = _84 * _163;
    float _261 = _84 * _169;
    float _263 = fma(_237, _171, _255);
    float _265 = fma(_225, _259, _245);
    float _267 = fma(_241, _261, _257);
    if (!_209)
    {
        out.m_51.x = _265;
        out.m_51.y = _263;
        out.m_51.z = _267;
        out.m_51.w = _195;
        return out;
    }
    float _269 = in.m_53.y;
    float _271 = gl_FragCoord.w;
    float _273 = _269 * _271;
    float _275 = in.m_53.x;
    float _277 = gl_FragCoord.w;
    float _279 = _275 * _277;
    float _281 = in.m_53.z;
    float _283 = gl_FragCoord.w;
    float _285 = _281 * _283;
    float _287 = _84 * _273;
    float _289 = _84 * _279;
    float _291 = _84 * _285;
    float _293 = _287 * _287;
    float _295 = in.m_55.x;
    float _297 = gl_FragCoord.w;
    float _299 = _295 * _297;
    float _301 = fma(_289, _289, _293);
    float _303 = fma(_291, _291, _301);
    float _305 = rsqrt(_303);
    float _307 = _289 * _305;
    float _309 = _287 * _305;
    float _311 = _291 * _305;
    float _313 = _84 * _299;
    float _315 = abs(_307);
    float _317 = abs(_309);
    float _319 = precise::max(_315, _317);
    float _321 = abs(_311);
    float _323 = precise::max(_321, _319);
    float _325 = 1.0 / _323;
    float _327 = _309 * _325;
    float _329 = -_325;
    float _331 = _311 * _329;
    float _333 = precise::min(_313, 1.0);
    float _335 = _307 * _325;
    float3 _911 = float3(_335, _327, _331);
    float3 _339 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_911, float3(0.0), isnan(_911)), level(_333)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_911, float3(0.0), isnan(_911)), level(_333)).xyz;
    float _341 = _339.x;
    float _343 = _339.y;
    float _345 = _339.z;
    float _347 = _171 * (*spvDescriptorSet0.fp_c9)._m0[194].z;
    float _349 = _259 * (*spvDescriptorSet0.fp_c9)._m0[194].z;
    float _351 = in.m_57.x;
    float _353 = gl_FragCoord.w;
    float _355 = _351 * _353;
    float _357 = _261 * (*spvDescriptorSet0.fp_c9)._m0[194].z;
    float _359 = _347 * 0.715200006961822509765625;
    float _361 = in.m_57.z;
    float _363 = gl_FragCoord.w;
    float _365 = _361 * _363;
    float _367 = in.m_57.y;
    float _369 = gl_FragCoord.w;
    float _371 = _367 * _369;
    float _373 = in.m_59.z;
    float _375 = gl_FragCoord.w;
    float _377 = _373 * _375;
    float _379 = fma(_349, 0.2125999927520751953125, _359);
    float _381 = in.m_59.x;
    float _383 = gl_FragCoord.w;
    float _385 = _381 * _383;
    float _387 = in.m_59.y;
    float _389 = gl_FragCoord.w;
    float _391 = _387 * _389;
    float _393 = in.m_61.w;
    float _395 = gl_FragCoord.w;
    float _397 = _393 * _395;
    float _399 = fma(_357, 0.072200000286102294921875, _379);
    float _401 = in.m_61.x;
    float _403 = gl_FragCoord.w;
    float _405 = _401 * _403;
    float _407 = in.m_61.z;
    float _409 = gl_FragCoord.w;
    float _411 = _407 * _409;
    float _413 = in.m_61.y;
    float _415 = gl_FragCoord.w;
    float _417 = _413 * _415;
    float _419 = 1.0 / _399;
    float _421 = 0.0 + _197;
    float _423 = precise::clamp(_421, 0.0, 1.0);
    float _425 = _419 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _427 = precise::clamp(_425, 0.0, 1.0);
    float _429 = fma(_427, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _431 = _84 * _355;
    float _433 = _84 * _365;
    float _435 = _84 * _371;
    float _437 = _349 * _429;
    float _439 = _347 * _429;
    float _441 = _357 * _429;
    float _443 = _84 * _391;
    bool _445 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _447 = _84 * _397;
    float _449 = _84 * _411;
    float _451 = _84 * _405;
    float _453 = fma(_345, 0.20999999344348907470703125, _433);
    float _455 = fma(_341, 0.20999999344348907470703125, _431);
    float _457 = _84 * _377;
    float _459 = fma(_343, 0.20999999344348907470703125, _435);
    float _461 = _84 * _385;
    float _463 = _453 + _457;
    float _465 = _459 + _443;
    float _467 = _455 + _461;
    float _469 = _84 * _417;
    float _471 = fma(_267, _463, _441);
    float _473 = fma(_263, _465, _439);
    float _475 = fma(_265, _467, _437);
    float _477 = fma(_471, _447, _449);
    float _479 = fma(_473, _447, _469);
    float _481 = fma(_475, _447, _451);
    float _483 = _449;
    if (!_445)
    {
        _483 = _423;
    }
    float _485 = _483;
    bool _487 = !_445;
    float _489 = _485;
    if (!_487)
    {
        float _491 = in.m_63.w;
        float _493 = gl_FragCoord.w;
        float _495 = _491 * _493;
        float _497 = in.m_63.z;
        float _499 = gl_FragCoord.w;
        float _501 = _497 * _499;
        float _503 = _84 * _495;
        float _505 = _84 * _501;
        float _507 = 1.0 / _503;
        float _509 = _505 * _507;
        float _511 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _513 = fma(_509, (*spvDescriptorSet0.fp_c8)._m0[30].w, _511);
        float _515 = 1.0 / _513;
        float _517 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _519 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _521 = fma(_515, _517, _519);
        float _523 = _521 * 8.0;
        float _525 = precise::clamp(_523, 0.0, 1.0);
        float _527 = _423 * _525;
        _489 = _527;
    }
    float _529 = _489;
    float _531 = 0.0 + _529;
    float _533 = precise::clamp(_531, 0.0, 1.0);
    out.m_51.x = _481;
    out.m_51.y = _479;
    out.m_51.z = _477;
    out.m_51.w = _533;
    return out;
}

