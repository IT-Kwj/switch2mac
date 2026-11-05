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
    uint4 _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float4 _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
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
    float4 m_38 [[user(locn0)]];
    float4 m_46 [[user(locn1)]];
    float4 m_42 [[user(locn2)]];
    float4 m_59 [[user(locn3)]];
    float4 m_40 [[user(locn4)]];
    float4 m_44 [[user(locn5)]];
    float4 m_65 [[user(locn6)]];
    float4 m_53 [[user(locn7)]];
    float4 m_61 [[user(locn8)]];
    float4 m_51 [[user(locn9)]];
    float4 m_63 [[user(locn10)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], bool gl_FrontFacing [[front_facing]])
{
    main0_out out = {};
    float _72 = gl_FragCoord.w;
    float _74 = in.m_38.w;
    float _76 = gl_FragCoord.w;
    float _78 = _74 * _76;
    float _80 = in.m_40.w;
    float _82 = gl_FragCoord.w;
    float _84 = _80 * _82;
    float _86 = in.m_42.x;
    float _88 = gl_FragCoord.w;
    float _90 = _86 * _88;
    float _92 = 1.0 / _72;
    float _94 = _92 * _78;
    float _96 = _92 * _84;
    float _98 = _92 * _90;
    float _100 = _94 * _96;
    float _102 = 0.0 + _100;
    float _104 = precise::clamp(_102, 0.0, 1.0);
    float _106 = _104 * _98;
    bool _109 = _106 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _111 = isnan(_106);
    bool _113 = _109 || _111;
    bool _115 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _117 = _113 || _115;
    float _119 = in.m_44.x;
    float _121 = gl_FragCoord.w;
    float _123 = _119 * _121;
    float _125 = in.m_44.y;
    float _127 = gl_FragCoord.w;
    float _129 = _125 * _127;
    if (!_117)
    {
        discard_fragment();
    }
    float _131 = _92 * _123;
    float _133 = _92 * _129;
    float2 _677 = float2(_131, _133);
    float _135 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_677, float2(0.0), isnan(_677))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_677, float2(0.0), isnan(_677))).w;
    float _137 = in.m_38.x;
    float _139 = gl_FragCoord.w;
    float _141 = _137 * _139;
    float _143 = in.m_46.x;
    float _145 = gl_FragCoord.w;
    float _147 = _143 * _145;
    float _149 = in.m_38.y;
    float _151 = gl_FragCoord.w;
    float _153 = _149 * _151;
    float _155 = in.m_46.y;
    float _157 = gl_FragCoord.w;
    float _159 = _155 * _157;
    float _161 = in.m_38.z;
    float _163 = gl_FragCoord.w;
    float _165 = _161 * _163;
    float _167 = in.m_46.z;
    float _169 = gl_FragCoord.w;
    float _171 = _167 * _169;
    float _173 = in.m_40.x;
    float _175 = gl_FragCoord.w;
    float _177 = _173 * _175;
    float _179 = in.m_40.y;
    float _181 = gl_FragCoord.w;
    float _183 = _179 * _181;
    float _185 = in.m_40.z;
    float _187 = gl_FragCoord.w;
    float _189 = _185 * _187;
    float _191 = _92 * _141;
    float _193 = _92 * _147;
    float _195 = _92 * _153;
    float _197 = _92 * _159;
    float _199 = _92 * _165;
    float _201 = _92 * _171;
    float _203 = -_193;
    float _205 = _191 + _203;
    float _207 = -_197;
    float _209 = _195 + _207;
    float _211 = -_201;
    float _213 = _199 + _211;
    float _215 = _92 * _177;
    float _217 = fma(_135, _205, _193);
    float _219 = fma(_135, _209, _197);
    float _221 = fma(_135, _213, _201);
    float _223 = _92 * _183;
    float _225 = _92 * _189;
    float _227 = _217 * _215;
    float _229 = _219 * _223;
    float _231 = _221 * _225;
    if (!_117)
    {
        out.m_49.x = _227;
        out.m_49.y = _229;
        out.m_49.z = _231;
        out.m_49.w = _100;
        return out;
    }
    float _233 = in.m_51.w;
    float _235 = gl_FragCoord.w;
    float _237 = _233 * _235;
    float _239 = _92 * _237;
    bool _241 = _239 != 1.0;
    bool _243 = isnan(_239);
    bool _245 = _241 || _243;
    bool _247 = isnan(1.0);
    bool _249 = _245 || _247;
    bool _251 = !_249;
    if (!_251)
    {
        float _253 = gl_FragCoord.x;
        float _255 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _257 = _253 / _255;
        float _259 = gl_FragCoord.y;
        float _261 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _263 = _259 / _261;
        float _265 = _239 * 256.0;
        float _267 = trunc(_265);
        int _270 = int(_267);
        uint _273 = uint(int(uint(_270) >> uint(7)));
        int _275 = int(_273) + _270;
        float _277 = trunc(_257);
        int _279 = int(_277);
        float _281 = trunc(_263);
        int _283 = int(_281);
        int _285 = _279 + 2;
        int _287 = _285 >> 1;
        uint _289 = uint(int(uint(_283) >> uint(1)));
        int _291 = _287 ^ int(_289);
        int _293 = _291 << 16;
        int _295 = _293 ^ _287;
        int _297 = 983055 & _295;
        int _299 = _297 << 6;
        int _301 = _299 + _297;
        int _303 = _301 & 13369548;
        uint _305 = uint(int(uint(_303) >> uint(3)));
        int _307 = _303 | int(_305);
        int _309 = _307 & 5570560;
        int _311 = _307 & 85;
        uint _313 = uint(int(uint(_309) >> uint(15)));
        int _315 = int(_313) + _311;
        bool _317 = uint(_275) > uint(_315);
        if (!_317)
        {
            discard_fragment();
        }
        if (!_317)
        {
            out.m_49.x = _227;
            out.m_49.y = _229;
            out.m_49.z = _231;
            out.m_49.w = _106;
            return out;
        }
    }
    float _319 = in.m_53.y;
    float _321 = gl_FragCoord.w;
    float _323 = _319 * _321;
    float _325 = as_type<float>(gl_FrontFacing ? (-1) : 0);
    float _327 = in.m_53.x;
    float _329 = gl_FragCoord.w;
    float _331 = _327 * _329;
    float _333 = in.m_53.z;
    float _335 = gl_FragCoord.w;
    float _337 = _333 * _335;
    float _339 = in.m_51.x;
    float _341 = gl_FragCoord.w;
    float _343 = _339 * _341;
    float _345 = _92 * _323;
    bool _347 = as_type<int>(_325) != 0;
    float _349 = _92 * _331;
    bool _351 = !_347;
    float _353 = -_345;
    float _355 = _351 ? _353 : _345;
    float _357 = _92 * _337;
    bool _359 = !_347;
    float _361 = -_349;
    float _363 = _359 ? _361 : _349;
    float _365 = _355 * _355;
    bool _367 = !_347;
    float _369 = -_357;
    float _371 = _367 ? _369 : _357;
    float _373 = fma(_363, _363, _365);
    float _375 = fma(_371, _371, _373);
    float _377 = rsqrt(_375);
    float _379 = _363 * _377;
    float _381 = _355 * _377;
    float _383 = _371 * _377;
    float _385 = _92 * _343;
    float _387 = abs(_379);
    float _389 = abs(_381);
    float _391 = precise::max(_387, _389);
    float _393 = abs(_383);
    float _395 = precise::max(_393, _391);
    float _397 = 1.0 / _395;
    float _399 = _379 * _397;
    float _401 = -_397;
    float _403 = _383 * _401;
    float _405 = precise::min(_385, 1.0);
    float _407 = _381 * _397;
    float3 _1083 = float3(_399, _407, _403);
    float3 _411 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1083, float3(0.0), isnan(_1083)), level(_405)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1083, float3(0.0), isnan(_1083)), level(_405)).xyz;
    float _413 = _411.x;
    float _415 = _411.y;
    float _417 = _411.z;
    float _419 = in.m_59.y;
    float _421 = gl_FragCoord.w;
    float _423 = _419 * _421;
    float _425 = in.m_59.z;
    float _427 = gl_FragCoord.w;
    float _429 = _425 * _427;
    float _431 = in.m_59.x;
    float _433 = gl_FragCoord.w;
    float _435 = _431 * _433;
    float _437 = in.m_61.z;
    float _439 = gl_FragCoord.w;
    float _441 = _437 * _439;
    float _443 = in.m_61.x;
    float _445 = gl_FragCoord.w;
    float _447 = _443 * _445;
    float _449 = in.m_61.y;
    float _451 = gl_FragCoord.w;
    float _453 = _449 * _451;
    float _455 = in.m_63.x;
    float _457 = gl_FragCoord.w;
    float _459 = _455 * _457;
    float _461 = in.m_63.w;
    float _463 = gl_FragCoord.w;
    float _465 = _461 * _463;
    float _467 = in.m_63.y;
    float _469 = gl_FragCoord.w;
    float _471 = _467 * _469;
    float _473 = in.m_63.z;
    float _475 = gl_FragCoord.w;
    float _477 = _473 * _475;
    float _479 = _92 * _423;
    float _481 = _92 * _429;
    float _483 = _92 * _435;
    bool _485 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _487 = _92 * _465;
    float _489 = fma(_417, 0.20999999344348907470703125, _481);
    float _491 = fma(_413, 0.20999999344348907470703125, _483);
    float _493 = _92 * _441;
    float _495 = fma(_415, 0.20999999344348907470703125, _479);
    float _497 = _92 * _447;
    float _499 = _92 * _453;
    float _501 = _489 + _493;
    float _503 = _491 + _497;
    float _505 = _495 + _499;
    float _507 = _231 * _501;
    float _509 = 0.0 + _106;
    float _511 = precise::clamp(_509, 0.0, 1.0);
    float _513 = _227 * _503;
    float _515 = _92 * _459;
    float _517 = _229 * _505;
    float _519 = _92 * _471;
    float _521 = _92 * _477;
    float _523 = fma(_513, _487, _515);
    float _525 = _515;
    if (!_485)
    {
        _525 = _511;
    }
    float _527 = _525;
    float _529 = fma(_517, _487, _519);
    float _531 = fma(_507, _487, _521);
    bool _533 = !_485;
    float _535 = _527;
    if (!_533)
    {
        float _537 = in.m_65.w;
        float _539 = gl_FragCoord.w;
        float _541 = _537 * _539;
        float _543 = in.m_65.z;
        float _545 = gl_FragCoord.w;
        float _547 = _543 * _545;
        float _549 = _92 * _541;
        float _551 = _92 * _547;
        float _553 = 1.0 / _549;
        float _555 = _551 * _553;
        float _557 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _559 = fma(_555, (*spvDescriptorSet0.fp_c8)._m0[30].w, _557);
        float _561 = 1.0 / _559;
        float _563 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _565 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _567 = fma(_561, _563, _565);
        float _569 = _567 * 8.0;
        float _571 = precise::clamp(_569, 0.0, 1.0);
        float _573 = _511 * _571;
        _535 = _573;
    }
    float _575 = _535;
    float _577 = 0.0 + _575;
    float _579 = precise::clamp(_577, 0.0, 1.0);
    out.m_49.x = _523;
    out.m_49.y = _529;
    out.m_49.z = _531;
    out.m_49.w = _579;
    return out;
}

