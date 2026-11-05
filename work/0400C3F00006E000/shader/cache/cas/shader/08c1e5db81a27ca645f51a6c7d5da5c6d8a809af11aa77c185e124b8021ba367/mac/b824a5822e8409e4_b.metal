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
    constant _16* fp_c8 [[id(2)]];
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
    float4 m_35 [[user(locn0)]];
    float4 m_46 [[user(locn1)]];
    float4 m_33 [[user(locn2)]];
    float4 m_54 [[user(locn3)]];
    float4 m_48 [[user(locn4)]];
    float4 m_39 [[user(locn5)]];
    float4 m_37 [[user(locn6)]];
    float4 m_50 [[user(locn7)]];
    float4 m_41 [[user(locn8)]];
    float4 m_52 [[user(locn9)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _61 = gl_FragCoord.w;
    float _63 = in.m_33.x;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = in.m_35.w;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_37.y;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_39.x;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = in.m_37.x;
    float _89 = gl_FragCoord.w;
    float _91 = _87 * _89;
    float _93 = in.m_37.z;
    float _95 = gl_FragCoord.w;
    float _97 = _93 * _95;
    float _99 = in.m_41.w;
    float _101 = gl_FragCoord.w;
    float _103 = _99 * _101;
    float _105 = -(*spvDescriptorSet0.fp_c9)._m0[107].w;
    float _107 = (*spvDescriptorSet0.fp_c9)._m0[108].w + _105;
    float _109 = 1.0 / _107;
    float _111 = 1.0 / _61;
    float _113 = _111 * _67;
    float _115 = _111 * _73;
    float _117 = _111 * _79;
    float _119 = _111 * _85;
    float _121 = 0.0 + _113;
    float _123 = precise::clamp(_121, 0.0, 1.0);
    float _125 = 0.0 + _115;
    float _127 = precise::clamp(_125, 0.0, 1.0);
    float _129 = _111 * _91;
    float _131 = in.m_41.x;
    float _133 = gl_FragCoord.w;
    float _135 = _131 * _133;
    float _137 = -(*spvDescriptorSet0.fp_c9)._m0[107].w;
    float _139 = _123 + _137;
    float _141 = _127 * _119;
    float _143 = _111 * _97;
    float _145 = _139 * _109;
    float _147 = _117 * _117;
    float _149 = _111 * _103;
    bool _153 = _123 >= (*spvDescriptorSet0.fp_c9)._m0[108].w;
    bool _155 = isnan(_123);
    bool _157 = _153 || _155;
    bool _159 = isnan((*spvDescriptorSet0.fp_c9)._m0[108].w);
    bool _161 = _157 || _159;
    float _163 = float(_161);
    float _165 = fma(_129, _129, _147);
    bool _167 = _149 != 1.0;
    bool _169 = isnan(_149);
    bool _171 = _167 || _169;
    bool _173 = isnan(1.0);
    bool _175 = _171 || _173;
    float _177 = fma(_143, _143, _165);
    float _179 = -(*spvDescriptorSet0.fp_c9)._m0[107].x;
    float _181 = (*spvDescriptorSet0.fp_c9)._m0[108].x + _179;
    float _183 = -(*spvDescriptorSet0.fp_c9)._m0[107].y;
    float _185 = (*spvDescriptorSet0.fp_c9)._m0[108].y + _183;
    bool _187 = _123 >= (*spvDescriptorSet0.fp_c9)._m0[107].w;
    bool _189 = isnan(_123);
    bool _191 = _187 || _189;
    bool _193 = isnan((*spvDescriptorSet0.fp_c9)._m0[107].w);
    bool _195 = _191 || _193;
    float _197 = float(_195);
    float _199 = -_163;
    float _201 = _199 + 1.0;
    float _203 = rsqrt(_177);
    float _205 = -(*spvDescriptorSet0.fp_c9)._m0[107].z;
    float _207 = (*spvDescriptorSet0.fp_c9)._m0[108].z + _205;
    float _209 = fma(_181, _145, (*spvDescriptorSet0.fp_c9)._m0[107].x);
    float _211 = fma(_185, _145, (*spvDescriptorSet0.fp_c9)._m0[107].y);
    float _213 = _197 * _201;
    float _215 = fma(_207, _145, (*spvDescriptorSet0.fp_c9)._m0[107].z);
    float _217 = -_197;
    float _219 = _217 + 1.0;
    float _221 = _209 * _213;
    float _223 = _211 * _213;
    float _225 = _215 * _213;
    float _227 = fma(_219, (*spvDescriptorSet0.fp_c9)._m0[107].x, _221);
    float _229 = fma(_219, (*spvDescriptorSet0.fp_c9)._m0[107].y, _223);
    float _231 = fma(_219, (*spvDescriptorSet0.fp_c9)._m0[107].z, _225);
    float _233 = _129 * _203;
    float _235 = fma(_163, (*spvDescriptorSet0.fp_c9)._m0[108].y, _229);
    float _237 = _117 * _203;
    float _239 = _143 * _203;
    float _241 = fma(_163, (*spvDescriptorSet0.fp_c9)._m0[108].x, _227);
    float _243 = fma(_163, (*spvDescriptorSet0.fp_c9)._m0[108].z, _231);
    bool _245 = !_175;
    if (!_245)
    {
        float _247 = gl_FragCoord.x;
        float _249 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _251 = _247 / _249;
        float _253 = gl_FragCoord.y;
        float _255 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _257 = _253 / _255;
        float _259 = trunc(_251);
        int _262 = int(_259);
        float _264 = trunc(_257);
        int _266 = int(_264);
        int _268 = _262 + 2;
        int _270 = _268 >> 1;
        uint _273 = uint(int(uint(_266) >> uint(1)));
        int _275 = _270 ^ int(_273);
        int _277 = _275 << 16;
        int _279 = _277 ^ _270;
        int _281 = 983055 & _279;
        float _283 = _149 * 256.0;
        int _285 = _281 << 6;
        int _287 = _285 + _281;
        float _289 = trunc(_283);
        int _291 = int(_289);
        int _293 = _287 & 13369548;
        uint _295 = uint(int(uint(_293) >> uint(3)));
        int _297 = _293 | int(_295);
        int _299 = _297 & 5570560;
        int _301 = _297 & 85;
        uint _303 = uint(int(uint(_291) >> uint(7)));
        int _305 = int(_303) + _291;
        uint _307 = uint(int(uint(_299) >> uint(15)));
        int _309 = int(_307) + _301;
        bool _311 = uint(_305) > uint(_309);
        if (!_311)
        {
            discard_fragment();
        }
        if (!_311)
        {
            out.m_44.x = _241;
            out.m_44.y = _235;
            out.m_44.z = _243;
            out.m_44.w = _141;
            return out;
        }
    }
    float _313 = abs(_233);
    float _315 = abs(_237);
    float _317 = precise::max(_313, _315);
    float _319 = _111 * _135;
    float _321 = abs(_239);
    float _323 = precise::max(_321, _317);
    float _325 = precise::min(_319, 1.0);
    float _327 = 1.0 / _323;
    float _329 = _233 * _327;
    float _331 = _237 * _327;
    float _333 = -_327;
    float _335 = _239 * _333;
    float3 _1018 = float3(_329, _331, _335);
    float3 _339 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1018, float3(0.0), isnan(_1018)), level(_325)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1018, float3(0.0), isnan(_1018)), level(_325)).xyz;
    float _341 = _339.x;
    float _343 = _339.y;
    float _345 = _339.z;
    float _347 = in.m_46.y;
    float _349 = gl_FragCoord.w;
    float _351 = _347 * _349;
    float _353 = in.m_46.x;
    float _355 = gl_FragCoord.w;
    float _357 = _353 * _355;
    float _359 = (*spvDescriptorSet0.fp_c8)._m0[28].y * (*spvDescriptorSet0.fp_c8)._m0[28].y;
    float _361 = in.m_46.z;
    float _363 = gl_FragCoord.w;
    float _365 = _361 * _363;
    float _367 = in.m_48.y;
    float _369 = gl_FragCoord.w;
    float _371 = _367 * _369;
    float _373 = in.m_48.z;
    float _375 = gl_FragCoord.w;
    float _377 = _373 * _375;
    float _379 = fma((*spvDescriptorSet0.fp_c8)._m0[28].x, (*spvDescriptorSet0.fp_c8)._m0[28].x, _359);
    float _381 = _237 * _237;
    float _383 = in.m_50.x;
    float _385 = gl_FragCoord.w;
    float _387 = _383 * _385;
    float _389 = in.m_50.y;
    float _391 = gl_FragCoord.w;
    float _393 = _389 * _391;
    float _395 = fma((*spvDescriptorSet0.fp_c8)._m0[28].z, (*spvDescriptorSet0.fp_c8)._m0[28].z, _379);
    float _397 = fma(_233, _233, _381);
    float _399 = in.m_50.z;
    float _401 = gl_FragCoord.w;
    float _403 = _399 * _401;
    float _405 = fma(_239, _239, _397);
    float _407 = rsqrt(_395);
    float _409 = rsqrt(_405);
    float _411 = _407 * (*spvDescriptorSet0.fp_c8)._m0[28].y;
    float _413 = _111 * _377;
    float _415 = _237 * _409;
    float _417 = _233 * _409;
    float _419 = _239 * _409;
    float _421 = _111 * _351;
    float _423 = _415 * _411;
    float _425 = _407 * (*spvDescriptorSet0.fp_c8)._m0[28].x;
    float _427 = _407 * (*spvDescriptorSet0.fp_c8)._m0[28].z;
    float _429 = in.m_48.x;
    float _431 = gl_FragCoord.w;
    float _433 = _429 * _431;
    float _435 = fma(_417, _425, _423);
    float _437 = _111 * _365;
    float _439 = fma(_419, _427, _435);
    bool _441 = 0.5 <= (*spvDescriptorSet0.fp_c15)._m0[653].w;
    float _443 = in.m_52.w;
    float _445 = gl_FragCoord.w;
    float _447 = _443 * _445;
    float _449 = fma(_439, -0.5, 0.5);
    float _451 = _111 * _357;
    float _453 = in.m_52.x;
    float _455 = gl_FragCoord.w;
    float _457 = _453 * _455;
    float _459 = _421 * _449;
    float _461 = _451 * _449;
    float _463 = _437 * _449;
    float _465 = _459 * 0.715200006961822509765625;
    float _467 = in.m_52.y;
    float _469 = gl_FragCoord.w;
    float _471 = _467 * _469;
    float _473 = fma(_461, 0.2125999927520751953125, _465);
    float _475 = fma(_463, 0.072200000286102294921875, _473);
    float _477 = in.m_52.z;
    float _479 = gl_FragCoord.w;
    float _481 = _477 * _479;
    float _483 = 1.0 / _475;
    float _485 = _111 * _447;
    float _487 = _483 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _489 = precise::clamp(_487, 0.0, 1.0);
    float _491 = fma(_489, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _493 = _111 * _433;
    float _495 = _111 * _371;
    float _497 = _111 * _471;
    float _499 = _461 * _491;
    float _501 = _459 * _491;
    float _503 = _463 * _491;
    float _505 = _111 * _387;
    float _507 = _111 * _403;
    float _509 = fma(_341, 0.20999999344348907470703125, _493);
    float _511 = fma(_343, 0.20999999344348907470703125, _495);
    float _513 = fma(_345, 0.20999999344348907470703125, _413);
    float _515 = _111 * _393;
    float _517 = _509 + _505;
    float _519 = _513 + _507;
    float _521 = _511 + _515;
    float _523 = 0.0 + _141;
    float _525 = precise::clamp(_523, 0.0, 1.0);
    float _527 = fma(_241, _517, _499);
    float _529 = _111 * _457;
    float _531 = fma(_235, _521, _501);
    float _533 = fma(_243, _519, _503);
    float _535 = _111 * _481;
    float _537 = fma(_527, _485, _529);
    float _539 = fma(_531, _485, _497);
    float _541 = _529;
    if (!_441)
    {
        _541 = _525;
    }
    float _543 = _541;
    float _545 = fma(_533, _485, _535);
    bool _547 = !_441;
    float _549 = _543;
    if (!_547)
    {
        float _551 = in.m_54.w;
        float _553 = gl_FragCoord.w;
        float _555 = _551 * _553;
        float _557 = in.m_54.z;
        float _559 = gl_FragCoord.w;
        float _561 = _557 * _559;
        float _563 = _111 * _555;
        float _565 = _111 * _561;
        float _567 = 1.0 / _563;
        float _569 = _565 * _567;
        float _571 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _573 = fma(_569, (*spvDescriptorSet0.fp_c8)._m0[30].w, _571);
        float _575 = 1.0 / _573;
        float _577 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _579 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _581 = fma(_575, _577, _579);
        float _583 = _581 * 8.0;
        float _585 = precise::clamp(_583, 0.0, 1.0);
        float _587 = _525 * _585;
        _549 = _587;
    }
    float _589 = _549;
    float _591 = 0.0 + _589;
    float _593 = precise::clamp(_591, 0.0, 1.0);
    out.m_44.x = _537;
    out.m_44.y = _539;
    out.m_44.z = _545;
    out.m_44.w = _593;
    return out;
}

