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
    float4 m_40 [[user(locn0)]];
    float4 m_44 [[user(locn1)]];
    float4 m_42 [[user(locn2)]];
    float4 m_55 [[user(locn3)]];
    float4 m_46 [[user(locn4)]];
    float4 m_38 [[user(locn5)]];
    float4 m_61 [[user(locn6)]];
    float4 m_53 [[user(locn7)]];
    float4 m_57 [[user(locn8)]];
    float4 m_51 [[user(locn9)]];
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
    float2 _595 = float2(_84, _86);
    float4 _89 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_595, float2(0.0), isnan(_595))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_595, float2(0.0), isnan(_595))).xyzw;
    float _91 = _89.x;
    float _93 = _89.y;
    float _95 = _89.z;
    float _97 = _89.w;
    float _99 = in.m_40.w;
    float _101 = gl_FragCoord.w;
    float _103 = _99 * _101;
    float _105 = in.m_42.x;
    float _107 = gl_FragCoord.w;
    float _109 = _105 * _107;
    float _111 = in.m_40.x;
    float _113 = gl_FragCoord.w;
    float _115 = _111 * _113;
    float _117 = _82 * _103;
    float _119 = _82 * _109;
    float _121 = in.m_40.z;
    float _123 = gl_FragCoord.w;
    float _125 = _121 * _123;
    float _127 = in.m_44.y;
    float _129 = gl_FragCoord.w;
    float _131 = _127 * _129;
    float _133 = in.m_44.z;
    float _135 = gl_FragCoord.w;
    float _137 = _133 * _135;
    float _139 = in.m_46.x;
    float _141 = gl_FragCoord.w;
    float _143 = _139 * _141;
    float _145 = in.m_46.y;
    float _147 = gl_FragCoord.w;
    float _149 = _145 * _147;
    float _151 = in.m_46.z;
    float _153 = gl_FragCoord.w;
    float _155 = _151 * _153;
    float _157 = _82 * _131;
    float _159 = _97 * _117;
    float _161 = 0.0 + _159;
    float _163 = precise::clamp(_161, 0.0, 1.0);
    float _165 = _163 * _119;
    bool _169 = _165 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _171 = isnan(_165);
    bool _173 = _169 || _171;
    bool _175 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _177 = _173 || _175;
    float _179 = in.m_40.y;
    float _181 = gl_FragCoord.w;
    float _183 = _179 * _181;
    float _185 = in.m_44.x;
    float _187 = gl_FragCoord.w;
    float _189 = _185 * _187;
    if (!_177)
    {
        discard_fragment();
    }
    float _191 = _82 * _115;
    float _193 = _91 * _91;
    float _195 = _93 * _93;
    float _197 = _95 * _95;
    float _199 = _82 * _183;
    float _201 = _82 * _189;
    float _203 = _82 * _125;
    float _205 = _82 * _137;
    float _207 = -_157;
    float _209 = _199 + _207;
    float _211 = -_201;
    float _213 = _191 + _211;
    float _215 = -_205;
    float _217 = _203 + _215;
    float _219 = fma(_195, _209, _157);
    float _221 = fma(_193, _213, _201);
    float _223 = _82 * _143;
    float _225 = fma(_197, _217, _205);
    float _227 = _82 * _149;
    float _229 = _82 * _155;
    float _231 = _221 * _223;
    float _233 = _219 * _227;
    float _235 = _225 * _229;
    if (!_177)
    {
        out.m_49.x = _231;
        out.m_49.y = _233;
        out.m_49.z = _235;
        out.m_49.w = _159;
        return out;
    }
    float _237 = in.m_51.w;
    float _239 = gl_FragCoord.w;
    float _241 = _237 * _239;
    float _243 = _82 * _241;
    bool _245 = _243 != 1.0;
    bool _247 = isnan(_243);
    bool _249 = _245 || _247;
    bool _251 = isnan(1.0);
    bool _253 = _249 || _251;
    bool _255 = !_253;
    if (!_255)
    {
        float _257 = gl_FragCoord.x;
        float _259 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _261 = _257 / _259;
        float _263 = gl_FragCoord.y;
        float _265 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _267 = _263 / _265;
        float _269 = _243 * 256.0;
        float _271 = trunc(_269);
        int _274 = int(_271);
        uint _277 = uint(int(uint(_274) >> uint(7)));
        int _279 = int(_277) + _274;
        float _281 = trunc(_261);
        int _283 = int(_281);
        float _285 = trunc(_267);
        int _287 = int(_285);
        int _289 = _283 + 2;
        int _291 = _289 >> 1;
        uint _293 = uint(int(uint(_287) >> uint(1)));
        int _295 = _291 ^ int(_293);
        int _297 = _295 << 16;
        int _299 = _297 ^ _291;
        int _301 = 983055 & _299;
        int _303 = _301 << 6;
        int _305 = _303 + _301;
        int _307 = _305 & 13369548;
        uint _309 = uint(int(uint(_307) >> uint(3)));
        int _311 = _307 | int(_309);
        int _313 = _311 & 5570560;
        int _315 = _311 & 85;
        uint _317 = uint(int(uint(_313) >> uint(15)));
        int _319 = int(_317) + _315;
        bool _321 = uint(_279) > uint(_319);
        if (!_321)
        {
            discard_fragment();
        }
        if (!_321)
        {
            out.m_49.x = _231;
            out.m_49.y = _233;
            out.m_49.z = _235;
            out.m_49.w = _165;
            return out;
        }
    }
    float _323 = in.m_53.y;
    float _325 = gl_FragCoord.w;
    float _327 = _323 * _325;
    float _329 = in.m_53.x;
    float _331 = gl_FragCoord.w;
    float _333 = _329 * _331;
    float _335 = in.m_53.z;
    float _337 = gl_FragCoord.w;
    float _339 = _335 * _337;
    float _341 = in.m_51.x;
    float _343 = gl_FragCoord.w;
    float _345 = _341 * _343;
    float _347 = _82 * _327;
    float _349 = _82 * _333;
    float _351 = _82 * _339;
    float _353 = _347 * _347;
    float _355 = fma(_349, _349, _353);
    float _357 = fma(_351, _351, _355);
    float _359 = rsqrt(_357);
    float _361 = _349 * _359;
    float _363 = _347 * _359;
    float _365 = _351 * _359;
    float _367 = _82 * _345;
    float _369 = abs(_361);
    float _371 = abs(_363);
    float _373 = precise::max(_369, _371);
    float _375 = abs(_365);
    float _377 = precise::max(_375, _373);
    float _379 = 1.0 / _377;
    float _381 = _361 * _379;
    float _383 = -_379;
    float _385 = _365 * _383;
    float _387 = precise::min(_367, 1.0);
    float _389 = _363 * _379;
    float3 _1041 = float3(_381, _389, _385);
    float3 _393 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1041, float3(0.0), isnan(_1041)), level(_387)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1041, float3(0.0), isnan(_1041)), level(_387)).xyz;
    float _395 = _393.x;
    float _397 = _393.y;
    float _399 = _393.z;
    float _401 = in.m_55.y;
    float _403 = gl_FragCoord.w;
    float _405 = _401 * _403;
    float _407 = in.m_55.z;
    float _409 = gl_FragCoord.w;
    float _411 = _407 * _409;
    float _413 = in.m_55.x;
    float _415 = gl_FragCoord.w;
    float _417 = _413 * _415;
    float _419 = in.m_57.z;
    float _421 = gl_FragCoord.w;
    float _423 = _419 * _421;
    float _425 = in.m_57.x;
    float _427 = gl_FragCoord.w;
    float _429 = _425 * _427;
    float _431 = in.m_57.y;
    float _433 = gl_FragCoord.w;
    float _435 = _431 * _433;
    float _437 = in.m_59.x;
    float _439 = gl_FragCoord.w;
    float _441 = _437 * _439;
    float _443 = in.m_59.w;
    float _445 = gl_FragCoord.w;
    float _447 = _443 * _445;
    float _449 = in.m_59.y;
    float _451 = gl_FragCoord.w;
    float _453 = _449 * _451;
    float _455 = in.m_59.z;
    float _457 = gl_FragCoord.w;
    float _459 = _455 * _457;
    float _461 = _82 * _405;
    float _463 = _82 * _411;
    float _465 = _82 * _417;
    bool _467 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _469 = _82 * _447;
    float _471 = fma(_399, 0.20999999344348907470703125, _463);
    float _473 = fma(_395, 0.20999999344348907470703125, _465);
    float _475 = _82 * _423;
    float _477 = fma(_397, 0.20999999344348907470703125, _461);
    float _479 = _82 * _429;
    float _481 = _82 * _435;
    float _483 = _471 + _475;
    float _485 = _473 + _479;
    float _487 = _477 + _481;
    float _489 = _235 * _483;
    float _491 = 0.0 + _165;
    float _493 = precise::clamp(_491, 0.0, 1.0);
    float _495 = _231 * _485;
    float _497 = _82 * _441;
    float _499 = _233 * _487;
    float _501 = _82 * _453;
    float _503 = _82 * _459;
    float _505 = fma(_495, _469, _497);
    float _507 = _497;
    if (!_467)
    {
        _507 = _493;
    }
    float _509 = _507;
    float _511 = fma(_499, _469, _501);
    float _513 = fma(_489, _469, _503);
    bool _515 = !_467;
    float _517 = _509;
    if (!_515)
    {
        float _519 = in.m_61.w;
        float _521 = gl_FragCoord.w;
        float _523 = _519 * _521;
        float _525 = in.m_61.z;
        float _527 = gl_FragCoord.w;
        float _529 = _525 * _527;
        float _531 = _82 * _523;
        float _533 = _82 * _529;
        float _535 = 1.0 / _531;
        float _537 = _533 * _535;
        float _539 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _541 = fma(_537, (*spvDescriptorSet0.fp_c8)._m0[30].w, _539);
        float _543 = 1.0 / _541;
        float _545 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _547 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _549 = fma(_543, _545, _547);
        float _551 = _549 * 8.0;
        float _553 = precise::clamp(_551, 0.0, 1.0);
        float _555 = _493 * _553;
        _517 = _555;
    }
    float _557 = _517;
    float _559 = 0.0 + _557;
    float _561 = precise::clamp(_559, 0.0, 1.0);
    out.m_49.x = _505;
    out.m_49.y = _511;
    out.m_49.z = _513;
    out.m_49.w = _561;
    return out;
}

