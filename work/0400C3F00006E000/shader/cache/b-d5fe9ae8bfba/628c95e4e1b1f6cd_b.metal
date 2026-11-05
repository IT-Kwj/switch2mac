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
    float4 m_42 [[color(0)]];
};

struct main0_in
{
    float4 m_35 [[user(locn0)]];
    float4 m_44 [[user(locn1)]];
    float4 m_46 [[user(locn2)]];
    float4 m_52 [[user(locn3)]];
    float4 m_37 [[user(locn4)]];
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
    float _85 = in.m_35.y;
    float _87 = gl_FragCoord.w;
    float _89 = _85 * _87;
    float _91 = in.m_35.z;
    float _93 = gl_FragCoord.w;
    float _95 = _91 * _93;
    float _97 = in.m_37.x;
    float _99 = gl_FragCoord.w;
    float _101 = _97 * _99;
    float _103 = in.m_39.x;
    float _105 = gl_FragCoord.w;
    float _107 = _103 * _105;
    float _109 = 1.0 / _59;
    float _111 = _109 * _65;
    float _113 = _109 * _71;
    float _115 = _109 * _77;
    float _117 = _109 * _95;
    float _119 = _111 * _111;
    float _121 = fma(_113, _113, _119);
    float _123 = fma(_115, _115, _121);
    float _125 = rsqrt(_123);
    float _127 = _111 * _125;
    float _129 = _113 * _125;
    float _131 = _115 * _125;
    float _133 = _127 * _127;
    float _135 = fma(_129, _129, _133);
    float _137 = fma(_131, _131, _135);
    float _139 = (*spvDescriptorSet0.fp_c8)._m0[28].y * (*spvDescriptorSet0.fp_c8)._m0[28].y;
    float _141 = rsqrt(_137);
    float _143 = fma((*spvDescriptorSet0.fp_c8)._m0[28].x, (*spvDescriptorSet0.fp_c8)._m0[28].x, _139);
    float _145 = fma((*spvDescriptorSet0.fp_c8)._m0[28].z, (*spvDescriptorSet0.fp_c8)._m0[28].z, _143);
    float _147 = rsqrt(_145);
    float _149 = _127 * _141;
    float _151 = _129 * _141;
    float _153 = _131 * _141;
    float _155 = _149 * _149;
    float _157 = fma(_151, _151, _155);
    float _159 = _147 * (*spvDescriptorSet0.fp_c8)._m0[28].y;
    float _161 = fma(_153, _153, _157);
    float _163 = _147 * (*spvDescriptorSet0.fp_c8)._m0[28].x;
    float _165 = _147 * (*spvDescriptorSet0.fp_c8)._m0[28].z;
    float _167 = _149 * _159;
    float _169 = in.m_39.w;
    float _171 = gl_FragCoord.w;
    float _173 = _169 * _171;
    float _175 = rsqrt(_161);
    float _177 = fma(_151, _163, _167);
    float _179 = fma(_153, _165, _177);
    float _181 = fma(_179, -0.5, 0.5);
    float _183 = precise::max(_181, (*spvDescriptorSet0.fp_c9)._m0[191].y);
    float _185 = _149 * _175;
    float _187 = _153 * _175;
    float _189 = precise::min(_183, (*spvDescriptorSet0.fp_c9)._m0[191].z);
    float _191 = _185 * (-0.816474258899688720703125);
    float _193 = -(*spvDescriptorSet0.fp_c9)._m0[191].y;
    float _195 = _189 + _193;
    float _197 = -_191;
    float _199 = fma(_187, 0.577381789684295654296875, _197);
    float _201 = -(*spvDescriptorSet0.fp_c9)._m0[191].y;
    float _203 = (*spvDescriptorSet0.fp_c9)._m0[191].z + _201;
    float _205 = _109 * _83;
    float _207 = _109 * _89;
    float _209 = fma(_199, 0.5, 0.5);
    float _211 = 1.0 / _203;
    float _213 = _209 * _209;
    float _215 = _109 * _173;
    float _217 = precise::max(_213, -0.5);
    bool _221 = _215 != 1.0;
    bool _223 = isnan(_215);
    bool _225 = _221 || _223;
    bool _227 = isnan(1.0);
    bool _229 = _225 || _227;
    float _231 = precise::min(_217, 1.5);
    float _233 = fma(_231, 0.5, 0.25);
    float _235 = _195 * _211;
    float _237 = fma(_235, (*spvDescriptorSet0.fp_c9)._m0[191].w, _233);
    float _239 = _109 * _101;
    float _241 = _205 * _237;
    float _243 = _207 * _237;
    float _245 = _117 * _237;
    bool _247 = !_229;
    if (!_247)
    {
        float _249 = gl_FragCoord.x;
        float _251 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _253 = _249 / _251;
        float _255 = gl_FragCoord.y;
        float _257 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _259 = _255 / _257;
        float _261 = _215 * 256.0;
        float _263 = trunc(_261);
        int _266 = int(_263);
        uint _269 = uint(int(uint(_266) >> uint(7)));
        int _271 = int(_269) + _266;
        float _273 = trunc(_253);
        int _275 = int(_273);
        float _277 = trunc(_259);
        int _279 = int(_277);
        int _281 = _275 + 2;
        int _283 = _281 >> 1;
        uint _285 = uint(int(uint(_279) >> uint(1)));
        int _287 = _283 ^ int(_285);
        int _289 = _287 << 16;
        int _291 = _289 ^ _283;
        int _293 = 983055 & _291;
        int _295 = _293 << 6;
        int _297 = _295 + _293;
        int _299 = _297 & 13369548;
        uint _301 = uint(int(uint(_299) >> uint(3)));
        int _303 = _299 | int(_301);
        int _305 = _303 & 5570560;
        int _307 = _303 & 85;
        uint _309 = uint(int(uint(_305) >> uint(15)));
        int _311 = int(_309) + _307;
        bool _313 = uint(_271) > uint(_311);
        if (!_313)
        {
            discard_fragment();
        }
        if (!_313)
        {
            out.m_42.x = _241;
            out.m_42.y = _243;
            out.m_42.z = _245;
            out.m_42.w = _239;
            return out;
        }
    }
    float _315 = abs(_129);
    float _317 = abs(_127);
    float _319 = precise::max(_315, _317);
    float _321 = _109 * _107;
    float _323 = abs(_131);
    float _325 = precise::max(_323, _319);
    float _327 = -_237;
    float _329 = _327 + 1.0;
    float _331 = precise::clamp(_329, 0.0, 1.0);
    float _333 = _321 + _331;
    float _335 = 1.0 / _325;
    float _337 = _129 * _335;
    float _339 = _127 * _335;
    float _341 = -_335;
    float _343 = _131 * _341;
    float _345 = precise::min(_333, 1.0);
    float3 _1029 = float3(_337, _339, _343);
    float3 _349 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1029, float3(0.0), isnan(_1029)), level(_345)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1029, float3(0.0), isnan(_1029)), level(_345)).xyz;
    float _351 = _349.x;
    float _353 = _349.y;
    float _355 = _349.z;
    float _357 = in.m_44.y;
    float _359 = gl_FragCoord.w;
    float _361 = _357 * _359;
    float _363 = in.m_44.x;
    float _365 = gl_FragCoord.w;
    float _367 = _363 * _365;
    float _369 = in.m_44.z;
    float _371 = gl_FragCoord.w;
    float _373 = _369 * _371;
    float _375 = in.m_46.x;
    float _377 = gl_FragCoord.w;
    float _379 = _375 * _377;
    float _381 = in.m_46.y;
    float _383 = gl_FragCoord.w;
    float _385 = _381 * _383;
    float _387 = in.m_46.z;
    float _389 = gl_FragCoord.w;
    float _391 = _387 * _389;
    float _393 = in.m_48.x;
    float _395 = gl_FragCoord.w;
    float _397 = _393 * _395;
    float _399 = in.m_48.y;
    float _401 = gl_FragCoord.w;
    float _403 = _399 * _401;
    float _405 = in.m_48.z;
    float _407 = gl_FragCoord.w;
    float _409 = _405 * _407;
    bool _411 = 0.5 <= (*spvDescriptorSet0.fp_c15)._m0[653].w;
    float _413 = _109 * _361;
    float _415 = _109 * _367;
    float _417 = _109 * _373;
    float _419 = -_413;
    float _421 = _207 + _419;
    float _423 = -_415;
    float _425 = _205 + _423;
    float _427 = -_417;
    float _429 = _117 + _427;
    float _431 = fma(_233, _421, _413);
    float _433 = fma(_233, _425, _415);
    float _435 = fma(_233, _429, _417);
    float _437 = in.m_50.x;
    float _439 = gl_FragCoord.w;
    float _441 = _437 * _439;
    float _443 = _431 * 0.3576000034809112548828125;
    float _445 = in.m_50.w;
    float _447 = gl_FragCoord.w;
    float _449 = _445 * _447;
    float _451 = in.m_50.y;
    float _453 = gl_FragCoord.w;
    float _455 = _451 * _453;
    float _457 = fma(_433, 0.10629999637603759765625, _443);
    float _459 = fma(_435, 0.0361000001430511474609375, _457);
    float _461 = _109 * _391;
    float _463 = in.m_50.z;
    float _465 = gl_FragCoord.w;
    float _467 = _463 * _465;
    float _469 = 1.0 / _459;
    float _471 = _469 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _473 = precise::clamp(_471, 0.0, 1.0);
    float _475 = fma(_473, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _477 = _109 * _379;
    float _479 = _109 * _385;
    float _481 = _109 * _449;
    float _483 = _433 * _475;
    float _485 = _483 * 0.5;
    float _487 = _431 * _475;
    float _489 = _487 * 0.5;
    float _491 = _435 * _475;
    float _493 = _491 * 0.5;
    float _495 = _109 * _397;
    float _497 = _109 * _409;
    float _499 = _109 * _455;
    float _501 = fma(_351, 0.20999999344348907470703125, _477);
    float _503 = fma(_353, 0.20999999344348907470703125, _479);
    float _505 = fma(_355, 0.20999999344348907470703125, _461);
    float _507 = _109 * _403;
    float _509 = _501 + _495;
    float _511 = _505 + _497;
    float _513 = _503 + _507;
    float _515 = 0.0 + _239;
    float _517 = precise::clamp(_515, 0.0, 1.0);
    float _519 = fma(_241, _509, _485);
    float _521 = _109 * _441;
    float _523 = fma(_243, _513, _489);
    float _525 = fma(_245, _511, _493);
    float _527 = _109 * _467;
    float _529 = fma(_519, _481, _521);
    float _531 = fma(_523, _481, _499);
    float _533 = _521;
    if (!_411)
    {
        _533 = _517;
    }
    float _535 = _533;
    float _537 = fma(_525, _481, _527);
    bool _539 = !_411;
    float _541 = _535;
    if (!_539)
    {
        float _543 = in.m_52.w;
        float _545 = gl_FragCoord.w;
        float _547 = _543 * _545;
        float _549 = in.m_52.z;
        float _551 = gl_FragCoord.w;
        float _553 = _549 * _551;
        float _555 = _109 * _547;
        float _557 = _109 * _553;
        float _559 = 1.0 / _555;
        float _561 = _557 * _559;
        float _563 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _565 = fma(_561, (*spvDescriptorSet0.fp_c8)._m0[30].w, _563);
        float _567 = 1.0 / _565;
        float _569 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _571 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _573 = fma(_567, _569, _571);
        float _575 = _573 * 8.0;
        float _577 = precise::clamp(_575, 0.0, 1.0);
        float _579 = _517 * _577;
        _541 = _579;
    }
    float _581 = _541;
    float _583 = 0.0 + _581;
    float _585 = precise::clamp(_583, 0.0, 1.0);
    out.m_42.x = _529;
    out.m_42.y = _531;
    out.m_42.z = _537;
    out.m_42.w = _585;
    return out;
}

