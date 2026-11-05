#pragma clang diagnostic ignored "-Wmissing-prototypes"

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

template<typename T>
[[clang::optnone]] T spvFAdd(T l, T r)
{
    return fma(T(1), l, r);
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
    texture2d<float> fp_t_tcb_A [[id(8)]];
    sampler fp_t_tcb_ASmplr [[id(9)]];
    sampler fp_t_tcb_10Smplr_w [[id(10)]];
    sampler fp_t_tcb_8Smplr_w [[id(11)]];
    sampler fp_t_tcb_ASmplr_w [[id(12)]];
    constant dm_border_t* dm_border [[id(13)]];
};

struct main0_out
{
    float4 m_52 [[color(0)]];
};

struct main0_in
{
    float4 m_41 [[user(locn0)]];
    float4 m_49 [[user(locn1)]];
    float4 m_39 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_43 [[user(locn4)]];
    float4 m_45 [[user(locn5)]];
    float4 m_54 [[user(locn6)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _61 = gl_FragCoord.w;
    float _63 = in.m_39.w;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = in.m_39.x;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_39.y;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_41.x;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = in.m_41.z;
    float _89 = gl_FragCoord.w;
    float _91 = _87 * _89;
    float _93 = in.m_41.y;
    float _95 = gl_FragCoord.w;
    float _97 = _93 * _95;
    float _99 = in.m_41.w;
    float _101 = gl_FragCoord.w;
    float _103 = _99 * _101;
    float _105 = 1.0 / _61;
    float _107 = _105 * _67;
    float _109 = _105 * _73;
    float _111 = _105 * _79;
    float _113 = _105 * _85;
    float _115 = _105 * _91;
    float _117 = _105 * _97;
    float _119 = 1.0 / _107;
    float _121 = _109 * _119;
    float _123 = _111 * _119;
    float _125 = _105 * _103;
    float2 _680 = float2(_121, _123);
    float _127 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_680, float2(0.0), isnan(_680))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_680, float2(0.0), isnan(_680))).x;
    float2 _691 = float2(_113, _117);
    float _129 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_691, float2(0.0), isnan(_691))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_691, float2(0.0), isnan(_691))).w;
    float2 _699 = float2(_115, _125);
    float _131 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_699, float2(0.0), isnan(_699))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_699, float2(0.0), isnan(_699))).w;
    float _133 = in.m_43.y;
    float _135 = gl_FragCoord.w;
    float _137 = _133 * _135;
    float _139 = in.m_45.y;
    float _141 = gl_FragCoord.w;
    float _143 = _139 * _141;
    float _145 = in.m_43.x;
    float _147 = gl_FragCoord.w;
    float _149 = _145 * _147;
    float _151 = in.m_45.x;
    float _153 = gl_FragCoord.w;
    float _155 = _151 * _153;
    float _157 = in.m_45.z;
    float _159 = gl_FragCoord.w;
    float _161 = _157 * _159;
    float _163 = in.m_43.z;
    float _165 = gl_FragCoord.w;
    float _167 = _163 * _165;
    float _169 = _105 * _137;
    float _171 = _105 * _143;
    float _173 = _105 * _149;
    float _175 = _105 * _155;
    float _177 = _169 * _169;
    float _179 = -(*spvDescriptorSet0.fp_c8)._m0[29].y;
    float _181 = _171 + _179;
    float _183 = _105 * _161;
    float _185 = _105 * _167;
    float _187 = fma(_173, _173, _177);
    float _189 = -(*spvDescriptorSet0.fp_c8)._m0[29].x;
    float _191 = _175 + _189;
    float _193 = _181 * _181;
    float _195 = -(*spvDescriptorSet0.fp_c8)._m0[29].z;
    float _197 = _183 + _195;
    float _199 = fma(_185, _185, _187);
    float _201 = in.m_39.z;
    float _203 = gl_FragCoord.w;
    float _205 = _201 * _203;
    float _207 = fma(_191, _191, _193);
    float _209 = fma(_197, _197, _207);
    float _211 = rsqrt(_199);
    float _213 = rsqrt(_209);
    float _215 = _169 * _211;
    float _217 = _173 * _211;
    float _219 = _185 * _211;
    float _221 = _215 * _215;
    float _223 = _181 * _213;
    float _225 = _191 * _213;
    float _227 = fma(_217, _217, _221);
    float _229 = _197 * _213;
    float _231 = _223 * _223;
    float _233 = fma(_219, _219, _227);
    float _235 = fma(_225, _225, _231);
    float _237 = fma(_229, _229, _235);
    float _239 = rsqrt(_233);
    float _241 = rsqrt(_237);
    float _243 = _215 * _239;
    float _245 = _217 * _239;
    float _247 = _219 * _239;
    float _249 = _223 * _241;
    float _251 = _229 * _241;
    float _253 = _243 * _249;
    float _255 = _225 * _241;
    float _257 = _105 * _205;
    float _259 = fma(_245, _255, _253);
    float _261 = _257 * _119;
    float _263 = fma(_247, _251, _259);
    float _265 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _267 = fma(_261, (*spvDescriptorSet0.fp_c8)._m0[30].w, _265);
    float _269 = in.m_47.x;
    float _271 = gl_FragCoord.w;
    float _273 = _269 * _271;
    float _275 = abs(_263);
    float _277 = fma(_275, -3.3333332538604736328125, 3.3333332538604736328125);
    float _279 = precise::clamp(_277, 0.0, 1.0);
    float _281 = fma(_279, -2.0, 3.0);
    float _283 = _279 * _279;
    float _285 = abs(_263);
    float _287 = fma(_285, 5.26315784454345703125, -0.0526315756142139434814453125);
    float _289 = precise::clamp(_287, 0.0, 1.0);
    float _291 = 1.0 / _267;
    float _293 = _281 * _283;
    float _295 = (*spvDescriptorSet0.fp_c10)._m0[2].x * 1.2000000476837158203125;
    float _297 = fma(_289, -2.0, 3.0);
    float _299 = _289 * _289;
    float _301 = _297 * _299;
    float _303 = abs(_263);
    float _305 = fma(_303, -1.53846156597137451171875, 1.0);
    float _307 = precise::clamp(_305, 0.0, 1.0);
    float _309 = in.m_49.z;
    float _311 = gl_FragCoord.w;
    float _313 = _309 * _311;
    float _315 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _317 = fma(_127, (*spvDescriptorSet0.fp_c8)._m0[30].w, _315);
    float _319 = _295 * 0.15915493667125701904296875;
    float _321 = _129 * _131;
    float _323 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _325 = _291 * _323;
    float _327 = 1.0 / _317;
    float _329 = fma(_307, -2.0, 3.0);
    float _331 = _321 * _293;
    float _333 = _307 * _307;
    float _335 = precise::max(_331, 0.4000000059604644775390625);
    float _337 = _319 * 6.283185482025146484375;
    float _339 = sin(_337);
    float _341 = spvFAdd((*spvDescriptorSet0.fp_c10)._m0[2].x, 1.0);
    float _343 = precise::min(_335, 0.60000002384185791015625);
    float _345 = 1.0 / _341;
    float _347 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _349 = -_325;
    float _351 = fma(_327, _347, _349);
    float _353 = precise::clamp(_351, 0.0, 1.0);
    float _355 = fma(_343, 4.999999523162841796875, -1.99999988079071044921875);
    float _357 = -_353;
    float _359 = _357 + 1.0;
    float _361 = fma(_339, -0.25, 0.75);
    float _363 = fma(_329, _333, _359);
    float _365 = _105 * _273;
    float _367 = fma(_363, _361, _355);
    float _369 = precise::clamp(_367, 0.0, 1.0);
    float _371 = fma(_369, _301, _345);
    float _373 = 0.0 + _371;
    float _375 = precise::clamp(_373, 0.0, 1.0);
    float _377 = _375 * _365;
    bool _381 = _377 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _383 = isnan(_377);
    bool _385 = _381 || _383;
    bool _387 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _389 = _385 || _387;
    float _391 = -(*spvDescriptorSet0.fp_c9)._m0[107].w;
    float _393 = (*spvDescriptorSet0.fp_c9)._m0[108].w + _391;
    float _395 = _325;
    if (!_389)
    {
        discard_fragment();
    }
    float _397 = 1.0 / _393;
    float _399 = in.m_49.x;
    float _401 = gl_FragCoord.w;
    float _403 = _399 * _401;
    float _405 = in.m_49.y;
    float _407 = gl_FragCoord.w;
    float _409 = _405 * _407;
    float _411 = -(*spvDescriptorSet0.fp_c9)._m0[107].w;
    float _413 = _369 + _411;
    bool _415 = _369 >= (*spvDescriptorSet0.fp_c9)._m0[108].w;
    bool _417 = isnan(_369);
    bool _419 = _415 || _417;
    bool _421 = isnan((*spvDescriptorSet0.fp_c9)._m0[108].w);
    bool _423 = _419 || _421;
    float _425 = float(_423);
    bool _427 = _369 >= (*spvDescriptorSet0.fp_c9)._m0[107].w;
    bool _429 = isnan(_369);
    bool _431 = _427 || _429;
    bool _433 = isnan((*spvDescriptorSet0.fp_c9)._m0[107].w);
    bool _435 = _431 || _433;
    float _437 = float(_435);
    float _439 = -_425;
    float _441 = _439 + 1.0;
    float _443 = _413 * _397;
    float _445 = -(*spvDescriptorSet0.fp_c9)._m0[107].x;
    float _447 = (*spvDescriptorSet0.fp_c9)._m0[108].x + _445;
    float _449 = -(*spvDescriptorSet0.fp_c9)._m0[107].z;
    float _451 = (*spvDescriptorSet0.fp_c9)._m0[108].z + _449;
    float _453 = -(*spvDescriptorSet0.fp_c9)._m0[107].y;
    float _455 = (*spvDescriptorSet0.fp_c9)._m0[108].y + _453;
    float _457 = fma(_447, _443, (*spvDescriptorSet0.fp_c9)._m0[107].x);
    float _459 = _437 * _441;
    float _461 = fma(_451, _443, (*spvDescriptorSet0.fp_c9)._m0[107].z);
    float _463 = fma(_455, _443, (*spvDescriptorSet0.fp_c9)._m0[107].y);
    float _465 = -_437;
    float _467 = _465 + 1.0;
    float _469 = _457 * _459;
    float _471 = _461 * _459;
    float _473 = _463 * _459;
    float _475 = fma(_467, (*spvDescriptorSet0.fp_c9)._m0[107].x, _469);
    float _477 = _105 * _403;
    float _479 = fma(_467, (*spvDescriptorSet0.fp_c9)._m0[107].y, _473);
    float _481 = fma(_467, (*spvDescriptorSet0.fp_c9)._m0[107].z, _471);
    float _483 = fma(_425, (*spvDescriptorSet0.fp_c9)._m0[108].x, _475);
    float _485 = _105 * _409;
    float _487 = fma(_425, (*spvDescriptorSet0.fp_c9)._m0[108].y, _479);
    float _489 = fma(_425, (*spvDescriptorSet0.fp_c9)._m0[108].z, _481);
    float _491 = _105 * _313;
    float _493 = fma(_477, _355, _483);
    float _495 = fma(_485, _355, _487);
    float _497 = fma(_491, _355, _489);
    float _499 = fma(_345, 4.19999980926513671875, _493);
    float _501 = fma(_345, 4.5, _495);
    float _503 = fma(_345, 5.0, _497);
    if (!_389)
    {
        out.m_52.x = _499;
        out.m_52.y = _501;
        out.m_52.z = _503;
        out.m_52.w = _371;
        return out;
    }
    float _505 = _501 * 0.715200006961822509765625;
    float _507 = in.m_54.w;
    float _509 = gl_FragCoord.w;
    float _511 = _507 * _509;
    float _513 = in.m_54.x;
    float _515 = gl_FragCoord.w;
    float _517 = _513 * _515;
    float _519 = in.m_54.y;
    float _521 = gl_FragCoord.w;
    float _523 = _519 * _521;
    float _525 = fma(_499, 0.2125999927520751953125, _505);
    float _527 = in.m_54.z;
    float _529 = gl_FragCoord.w;
    float _531 = _527 * _529;
    float _533 = fma(_503, 0.072200000286102294921875, _525);
    bool _535 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _537 = 1.0 / _533;
    float _539 = (*spvDescriptorSet0.fp_c15)._m0[2].y;
    if (_535)
    {
        float _541 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _543 = _325 + _541;
        _395 = _543;
    }
    float _545 = _395;
    float _547 = _537 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _549 = precise::clamp(_547, 0.0, 1.0);
    float _551 = fma(_549, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _553 = _105 * _511;
    if (_535)
    {
        float _555 = _545 * 8.0;
        float _557 = precise::clamp(_555, 0.0, 1.0);
        _539 = _557;
    }
    float _559 = _539;
    float _561 = _105 * _523;
    float _563 = _551 * _553;
    float _565 = 0.0 + _377;
    float _567 = precise::clamp(_565, 0.0, 1.0);
    float _569 = _105 * _517;
    float _571 = _105 * _531;
    float _573 = fma(_501, _563, _561);
    float _575 = _567;
    if (_535)
    {
        float _577 = _567 * _559;
        _575 = _577;
    }
    float _579 = _575;
    float _581 = fma(_499, _563, _569);
    float _583 = fma(_503, _563, _571);
    float _585 = 0.0 + _579;
    float _587 = precise::clamp(_585, 0.0, 1.0);
    out.m_52.x = _581;
    out.m_52.y = _573;
    out.m_52.z = _583;
    out.m_52.w = _587;
    return out;
}

