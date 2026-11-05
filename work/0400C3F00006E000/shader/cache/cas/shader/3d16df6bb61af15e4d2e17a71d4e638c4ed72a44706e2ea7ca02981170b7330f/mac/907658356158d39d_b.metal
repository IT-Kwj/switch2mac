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
    constant _16* fp_c8 [[id(1)]];
    constant _16* fp_c9 [[id(2)]];
    constant _16* fp_c15 [[id(3)]];
    texturecube<float> fp_t_tcb_1E [[id(4)]];
    sampler fp_t_tcb_1ESmplr [[id(5)]];
    sampler fp_t_tcb_1ESmplr_w [[id(6)]];
    constant dm_border_t* dm_border [[id(7)]];
};

struct main0_out
{
    float4 m_44 [[color(0)]];
};

struct main0_in
{
    float4 m_37 [[user(locn0)]];
    float4 m_35 [[user(locn1)]];
    float4 m_46 [[user(locn2)]];
    float4 m_52 [[user(locn3)]];
    float4 m_41 [[user(locn4)]];
    float4 m_33 [[user(locn5)]];
    float4 m_48 [[user(locn6)]];
    float4 m_39 [[user(locn7)]];
    float4 m_50 [[user(locn8)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _59 = gl_FragCoord.w;
    float _61 = in.m_33.y;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = in.m_33.x;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = in.m_33.z;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = in.m_35.x;
    float _81 = gl_FragCoord.w;
    float _83 = _79 * _81;
    float _85 = in.m_37.x;
    float _87 = gl_FragCoord.w;
    float _89 = _85 * _87;
    float _91 = in.m_35.z;
    float _93 = gl_FragCoord.w;
    float _95 = _91 * _93;
    float _97 = (*spvDescriptorSet0.fp_c8)._m0[28].y * (*spvDescriptorSet0.fp_c8)._m0[28].y;
    float _99 = in.m_35.y;
    float _101 = gl_FragCoord.w;
    float _103 = _99 * _101;
    float _105 = in.m_37.y;
    float _107 = gl_FragCoord.w;
    float _109 = _105 * _107;
    float _111 = fma((*spvDescriptorSet0.fp_c8)._m0[28].x, (*spvDescriptorSet0.fp_c8)._m0[28].x, _97);
    float _113 = -(*spvDescriptorSet0.fp_c9)._m0[191].y;
    float _115 = (*spvDescriptorSet0.fp_c9)._m0[191].z + _113;
    float _117 = 1.0 / _59;
    float _119 = _117 * _65;
    float _121 = _117 * _71;
    float _123 = _117 * _77;
    float _125 = _117 * _95;
    float _127 = _119 * _119;
    float _129 = fma(_121, _121, _127);
    float _131 = fma(_123, _123, _129);
    float _133 = rsqrt(_131);
    float _135 = _119 * _133;
    float _137 = _121 * _133;
    float _139 = _123 * _133;
    float _141 = _135 * _135;
    float _143 = fma(_137, _137, _141);
    float _145 = fma(_139, _139, _143);
    float _147 = rsqrt(_145);
    float _149 = _135 * _147;
    float _151 = _137 * _147;
    float _153 = _139 * _147;
    float _155 = _149 * _149;
    float _157 = fma(_151, _151, _155);
    float _159 = fma(_153, _153, _157);
    float _161 = fma((*spvDescriptorSet0.fp_c8)._m0[28].z, (*spvDescriptorSet0.fp_c8)._m0[28].z, _111);
    float _163 = in.m_37.z;
    float _165 = gl_FragCoord.w;
    float _167 = _163 * _165;
    float _169 = in.m_39.w;
    float _171 = gl_FragCoord.w;
    float _173 = _169 * _171;
    float _175 = rsqrt(_159);
    float _177 = rsqrt(_161);
    float _179 = _149 * _175;
    float _181 = _153 * _175;
    float _183 = _151 * _175;
    float _185 = _179 * (-0.816474258899688720703125);
    float _187 = _177 * (*spvDescriptorSet0.fp_c8)._m0[28].y;
    float _189 = -_185;
    float _191 = fma(_181, 0.577381789684295654296875, _189);
    float _193 = in.m_41.x;
    float _195 = gl_FragCoord.w;
    float _197 = _193 * _195;
    float _199 = _179 * _187;
    float _201 = _177 * (*spvDescriptorSet0.fp_c8)._m0[28].x;
    float _203 = fma(_183, _201, _199);
    float _205 = _117 * _167;
    float _207 = in.m_39.x;
    float _209 = gl_FragCoord.w;
    float _211 = _207 * _209;
    float _213 = fma(_191, 0.5, 0.5);
    float _215 = _177 * (*spvDescriptorSet0.fp_c8)._m0[28].z;
    float _217 = -_125;
    float _219 = _217 + _205;
    float _221 = _213 * _213;
    float _223 = fma(_181, _215, _203);
    float _225 = _117 * _83;
    float _227 = _117 * _173;
    float _229 = _117 * _89;
    float _231 = precise::max(0.0, _221);
    float _233 = _117 * _103;
    float _235 = _117 * _109;
    bool _239 = _227 != 1.0;
    bool _241 = isnan(_227);
    bool _243 = _239 || _241;
    bool _245 = isnan(1.0);
    bool _247 = _243 || _245;
    float _249 = -_225;
    float _251 = _249 + _229;
    float _253 = precise::min(_231, 1.7999999523162841796875);
    float _255 = -_233;
    float _257 = _255 + _235;
    float _259 = 1.0 / _115;
    float _261 = _253 * 0.5555555820465087890625;
    float _263 = fma(_261, _219, _125);
    float _265 = fma(_261, _251, _225);
    float _267 = fma(_261, _257, _233);
    float _269 = precise::max(_223, (*spvDescriptorSet0.fp_c9)._m0[191].y);
    float _271 = _117 * _197;
    bool _273 = !_247;
    if (!_273)
    {
        float _275 = gl_FragCoord.x;
        float _277 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _279 = _275 / _277;
        float _281 = gl_FragCoord.y;
        float _283 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _285 = _281 / _283;
        float _287 = trunc(_279);
        int _290 = int(_287);
        float _292 = trunc(_285);
        int _294 = int(_292);
        int _296 = _290 + 2;
        int _298 = _296 >> 1;
        uint _301 = uint(int(uint(_294) >> uint(1)));
        int _303 = _298 ^ int(_301);
        int _305 = _303 << 16;
        int _307 = _305 ^ _298;
        int _309 = 983055 & _307;
        float _311 = _227 * 256.0;
        int _313 = _309 << 6;
        int _315 = _313 + _309;
        float _317 = trunc(_311);
        int _319 = int(_317);
        int _321 = _315 & 13369548;
        uint _323 = uint(int(uint(_321) >> uint(3)));
        int _325 = _321 | int(_323);
        int _327 = _325 & 5570560;
        int _329 = _325 & 85;
        uint _331 = uint(int(uint(_319) >> uint(7)));
        int _333 = int(_331) + _319;
        uint _335 = uint(int(uint(_327) >> uint(15)));
        int _337 = int(_335) + _329;
        bool _339 = uint(_333) > uint(_337);
        if (!_339)
        {
            discard_fragment();
        }
        if (!_339)
        {
            out.m_44.x = _265;
            out.m_44.y = _267;
            out.m_44.z = _263;
            out.m_44.w = _271;
            return out;
        }
    }
    float _341 = abs(_137);
    float _343 = abs(_135);
    float _345 = precise::max(_341, _343);
    float _347 = _117 * _211;
    float _349 = precise::min(_269, (*spvDescriptorSet0.fp_c9)._m0[191].z);
    float _351 = abs(_139);
    float _353 = precise::max(_351, _345);
    float _355 = -(*spvDescriptorSet0.fp_c9)._m0[191].y;
    float _357 = _349 + _355;
    float _359 = 1.0 / _353;
    float _361 = -_357;
    float _363 = fma(_361, _259, 1.0);
    float _365 = fma(_363, (*spvDescriptorSet0.fp_c9)._m0[191].w, _261);
    float _367 = -_365;
    float _369 = _367 + 1.0;
    float _371 = precise::clamp(_369, 0.0, 1.0);
    float _373 = _347 + _371;
    float _375 = _137 * _359;
    float _377 = _135 * _359;
    float _379 = -_359;
    float _381 = _139 * _379;
    float _383 = precise::min(_373, 1.0);
    float3 _1049 = float3(_375, _377, _381);
    float3 _387 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1049, float3(0.0), isnan(_1049)), level(_383)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1049, float3(0.0), isnan(_1049)), level(_383)).xyz;
    float _389 = _387.x;
    float _391 = _387.y;
    float _393 = _387.z;
    float _395 = in.m_46.x;
    float _397 = gl_FragCoord.w;
    float _399 = _395 * _397;
    float _401 = in.m_46.y;
    float _403 = gl_FragCoord.w;
    float _405 = _401 * _403;
    float _407 = in.m_46.z;
    float _409 = gl_FragCoord.w;
    float _411 = _407 * _409;
    float _413 = in.m_48.y;
    float _415 = gl_FragCoord.w;
    float _417 = _413 * _415;
    float _419 = in.m_48.x;
    float _421 = gl_FragCoord.w;
    float _423 = _419 * _421;
    float _425 = in.m_48.z;
    float _427 = gl_FragCoord.w;
    float _429 = _425 * _427;
    float _431 = in.m_50.x;
    float _433 = gl_FragCoord.w;
    float _435 = _431 * _433;
    float _437 = in.m_50.w;
    float _439 = gl_FragCoord.w;
    float _441 = _437 * _439;
    float _443 = in.m_50.y;
    float _445 = gl_FragCoord.w;
    float _447 = _443 * _445;
    float _449 = in.m_50.z;
    float _451 = gl_FragCoord.w;
    float _453 = _449 * _451;
    bool _455 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _457 = _117 * _399;
    float _459 = _117 * _405;
    float _461 = _117 * _411;
    float _463 = fma(_391, 0.20999999344348907470703125, _459);
    float _465 = _117 * _417;
    float _467 = fma(_389, 0.20999999344348907470703125, _457);
    float _469 = fma(_393, 0.20999999344348907470703125, _461);
    float _471 = _117 * _423;
    float _473 = _117 * _429;
    float _475 = _463 + _465;
    float _477 = _117 * _453;
    float _479 = _467 + _471;
    float _481 = _469 + _473;
    float _483 = _267 * _475;
    float _485 = 0.0 + _271;
    float _487 = precise::clamp(_485, 0.0, 1.0);
    float _489 = _265 * _479;
    float _491 = _117 * _435;
    float _493 = _117 * _441;
    float _495 = _263 * _481;
    float _497 = _117 * _447;
    float _499 = fma(_489, _493, _491);
    float _501 = fma(_495, _493, _477);
    float _503 = fma(_483, _493, _497);
    float _505 = _491;
    if (!_455)
    {
        _505 = _487;
    }
    float _507 = _505;
    bool _509 = !_455;
    float _511 = _507;
    if (!_509)
    {
        float _513 = in.m_52.w;
        float _515 = gl_FragCoord.w;
        float _517 = _513 * _515;
        float _519 = in.m_52.z;
        float _521 = gl_FragCoord.w;
        float _523 = _519 * _521;
        float _525 = _117 * _517;
        float _527 = _117 * _523;
        float _529 = 1.0 / _525;
        float _531 = _527 * _529;
        float _533 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _535 = fma(_531, (*spvDescriptorSet0.fp_c8)._m0[30].w, _533);
        float _537 = 1.0 / _535;
        float _539 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _541 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _543 = fma(_537, _539, _541);
        float _545 = _543 * 8.0;
        float _547 = precise::clamp(_545, 0.0, 1.0);
        float _549 = _487 * _547;
        _511 = _549;
    }
    float _551 = _511;
    float _553 = 0.0 + _551;
    float _555 = precise::clamp(_553, 0.0, 1.0);
    out.m_44.x = _499;
    out.m_44.y = _503;
    out.m_44.z = _501;
    out.m_44.w = _555;
    return out;
}

