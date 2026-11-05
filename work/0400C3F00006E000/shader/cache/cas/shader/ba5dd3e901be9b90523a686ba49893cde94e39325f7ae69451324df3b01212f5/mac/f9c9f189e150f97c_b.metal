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
    constant _16* fp_c9 [[id(0)]];
    constant _16* fp_c8 [[id(1)]];
    constant _16* fp_c15 [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    sampler fp_t_tcb_8Smplr_w [[id(7)]];
    sampler fp_t_tcb_ASmplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_52 [[color(0)]];
};

struct main0_in
{
    float4 m_47 [[user(locn0)]];
    float4 m_45 [[user(locn1)]];
    float4 m_39 [[user(locn2)]];
    float4 m_35 [[user(locn3)]];
    float4 m_37 [[user(locn4)]];
    float4 m_49 [[user(locn5), flat]];
    float4 m_56 [[user(locn6)]];
    float4 m_41 [[user(locn7)]];
    float4 m_43 [[user(locn8)]];
    float4 m_54 [[user(locn9)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _63 = gl_FragCoord.w;
    float _65 = in.m_35.x;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = in.m_35.y;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = 1.0 / _63;
    float _79 = _77 * _69;
    float _81 = _77 * _75;
    float2 _644 = float2(_79, _81);
    float2 _85 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_644, float2(0.0), isnan(_644))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_644, float2(0.0), isnan(_644))).xw;
    float _87 = _85.x;
    float _89 = _85.y;
    float _91 = in.m_37.w;
    float _93 = gl_FragCoord.w;
    float _95 = _91 * _93;
    float _97 = in.m_39.x;
    float _99 = gl_FragCoord.w;
    float _101 = _97 * _99;
    float _103 = in.m_35.z;
    float _105 = gl_FragCoord.w;
    float _107 = _103 * _105;
    float _109 = _77 * _95;
    float _111 = in.m_35.w;
    float _113 = gl_FragCoord.w;
    float _115 = _111 * _113;
    float _117 = _89 * _109;
    float _119 = _77 * _101;
    float _121 = 0.0 + _117;
    float _123 = precise::clamp(_121, 0.0, 1.0);
    float _125 = _123 * _119;
    bool _129 = _125 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _131 = isnan(_125);
    bool _133 = _129 || _131;
    bool _135 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _137 = _133 || _135;
    if (!_137)
    {
        discard_fragment();
    }
    float _139 = _77 * _107;
    float _141 = _77 * _115;
    float2 _732 = float2(_139, _141);
    float _143 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_732, float2(0.0), isnan(_732))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_732, float2(0.0), isnan(_732))).x;
    float _145 = in.m_41.y;
    float _147 = gl_FragCoord.w;
    float _149 = _145 * _147;
    float _151 = in.m_41.x;
    float _153 = gl_FragCoord.w;
    float _155 = _151 * _153;
    float _157 = in.m_41.z;
    float _159 = gl_FragCoord.w;
    float _161 = _157 * _159;
    float _163 = in.m_43.y;
    float _165 = gl_FragCoord.w;
    float _167 = _163 * _165;
    float _169 = in.m_43.x;
    float _171 = gl_FragCoord.w;
    float _173 = _169 * _171;
    float _175 = in.m_43.z;
    float _177 = gl_FragCoord.w;
    float _179 = _175 * _177;
    float _181 = in.m_45.y;
    float _183 = gl_FragCoord.w;
    float _185 = _181 * _183;
    float _187 = in.m_45.z;
    float _189 = gl_FragCoord.w;
    float _191 = _187 * _189;
    float _193 = in.m_47.z;
    float _195 = gl_FragCoord.w;
    float _197 = _193 * _195;
    float _199 = _87 * _87;
    float _201 = _77 * _149;
    float _203 = _77 * _155;
    float _205 = _77 * _161;
    float _207 = _77 * _167;
    float _209 = _201 * _201;
    float _211 = fma(_203, _203, _209);
    float _213 = -(*spvDescriptorSet0.fp_c8)._m0[29].y;
    float _215 = _207 + _213;
    float _217 = _77 * _179;
    float _219 = fma(_205, _205, _211);
    float _221 = _77 * _173;
    float _223 = _215 * _215;
    float _225 = -(*spvDescriptorSet0.fp_c8)._m0[29].z;
    float _227 = _217 + _225;
    float _229 = rsqrt(_219);
    float _231 = -(*spvDescriptorSet0.fp_c8)._m0[29].x;
    float _233 = _221 + _231;
    float _235 = in.m_47.y;
    float _237 = gl_FragCoord.w;
    float _239 = _235 * _237;
    float _241 = fma(_233, _233, _223);
    float _243 = fma(_227, _227, _241);
    float _245 = rsqrt(_243);
    float _247 = _201 * _229;
    float _249 = _203 * _229;
    float _251 = _205 * _229;
    float _253 = _247 * _247;
    float _255 = fma(_249, _249, _253);
    float _257 = fma(_251, _251, _255);
    float _259 = _215 * _245;
    float _261 = rsqrt(_257);
    float _263 = _233 * _245;
    float _265 = _227 * _245;
    float _267 = in.m_49.y;
    float _269 = _247 * _261;
    float _271 = _251 * _261;
    float _273 = _259 * _269;
    float _275 = _249 * _261;
    float _277 = in.m_47.x;
    float _279 = gl_FragCoord.w;
    float _281 = _277 * _279;
    float _283 = fma(_263, _275, _273);
    float _285 = _77 * _191;
    float _287 = in.m_45.x;
    float _289 = gl_FragCoord.w;
    float _291 = _287 * _289;
    float _293 = fma(_265, _271, _283);
    float _295 = abs(_293);
    float _297 = -_295;
    float _299 = _297 + 1.0;
    float _301 = _267 * 0.15915493667125701904296875;
    float _303 = fma(_143, _143, _199);
    float _305 = precise::clamp(_303, 0.0, 1.0);
    float _307 = _299 * _299;
    float _309 = fma(_307, 0.5, _305);
    float _311 = precise::clamp(_309, 0.0, 1.0);
    float _313 = _77 * _185;
    float _315 = fma(_311, 2.0, -1.0);
    float _317 = _77 * _239;
    float _319 = 0.0 + _315;
    float _321 = precise::clamp(_319, 0.0, 1.0);
    float _323 = abs(_315);
    float _325 = -_323;
    float _327 = _325 + 1.0;
    float _329 = _313 * _321;
    float _331 = _77 * _197;
    float _333 = _285 * _321;
    float _335 = fma(_317, _327, _329);
    float _337 = _77 * _291;
    float _339 = fma(_331, _327, _333);
    float _341 = _337 * _321;
    float _343 = _77 * _281;
    bool _345 = _335 >= _339;
    bool _347 = isnan(_335);
    bool _349 = _345 || _347;
    bool _351 = isnan(_339);
    bool _353 = _349 || _351;
    float _355 = float(_353);
    float _357 = -_339;
    float _359 = _335 + _357;
    float _361 = fma(_343, _327, _341);
    float _363 = fma(_355, _359, _339);
    float _365 = -_335;
    float _367 = _365 + _339;
    float _369 = _355 + (-1.0);
    float _371 = -_361;
    float _373 = _371 + _363;
    bool _375 = _361 >= _363;
    bool _377 = isnan(_361);
    bool _379 = _375 || _377;
    bool _381 = isnan(_363);
    bool _383 = _379 || _381;
    float _385 = float(_383);
    float _387 = fma(_355, _367, _335);
    float _389 = -_363;
    float _391 = _361 + _389;
    float _393 = -_355;
    float _395 = _393 + 0.666666686534881591796875;
    float _397 = fma(_385, _373, _361);
    float _399 = fma(_385, _391, _363);
    float _401 = -_395;
    float _403 = _369 + _401;
    float _405 = precise::min(_387, _397);
    float _407 = -_387;
    float _409 = _407 + _397;
    float _411 = fma(_385, _403, _395);
    float _413 = spvFAdd(_399, 1.0000000133514319600180897396058e-10);
    float _415 = -_405;
    float _417 = _399 + _415;
    float _419 = _301 * 6.283185482025146484375;
    float _421 = sin(_419);
    float _423 = fma(_417, 6.0, 1.0000000133514319600180897396058e-10);
    float _425 = 1.0 / _423;
    float _427 = 1.0 / _413;
    float _429 = fma(_409, _425, _411);
    float _431 = abs(_429);
    float _433 = fma(_421, 0.100000001490116119384765625, _431);
    float _435 = _433 + 0.666666686534881591796875;
    float _437 = _433 + 0.3333333432674407958984375;
    float _439 = floor(_433);
    float _441 = fma(_433, 6.0, 4.0);
    float _443 = fma(_433, 6.0, 2.0);
    float _445 = _417 * _427;
    float _447 = floor(_435);
    float _449 = floor(_437);
    float _451 = -_439;
    float _453 = _433 + _451;
    float _455 = fma(_453, 6.0, -3.0);
    float _457 = fma(_447, -6.0, _441);
    float _459 = abs(_455);
    float _461 = _459 + (-1.0);
    float _463 = precise::clamp(_461, 0.0, 1.0);
    float _465 = _457 + (-3.0);
    float _467 = _463 + (-1.0);
    float _469 = fma(_449, -6.0, _443);
    float _471 = abs(_465);
    float _473 = _471 + (-1.0);
    float _475 = precise::clamp(_473, 0.0, 1.0);
    float _477 = fma(_445, _467, 1.0);
    float _479 = _469 + (-3.0);
    float _481 = _475 + (-1.0);
    float _483 = abs(_479);
    float _485 = _483 + (-1.0);
    float _487 = precise::clamp(_485, 0.0, 1.0);
    float _489 = fma(_445, _481, 1.0);
    float _491 = _487 + (-1.0);
    float _493 = fma(_445, _491, 1.0);
    float _495 = _399 * _477;
    float _497 = _399 * _489;
    float _499 = _399 * _493;
    if (!_137)
    {
        out.m_52.x = _495;
        out.m_52.y = _497;
        out.m_52.z = _499;
        out.m_52.w = _117;
        return out;
    }
    float _501 = _497 * 0.715200006961822509765625;
    float _503 = in.m_54.w;
    float _505 = gl_FragCoord.w;
    float _507 = _503 * _505;
    float _509 = in.m_54.z;
    float _511 = gl_FragCoord.w;
    float _513 = _509 * _511;
    float _515 = in.m_54.x;
    float _517 = gl_FragCoord.w;
    float _519 = _515 * _517;
    float _521 = fma(_495, 0.2125999927520751953125, _501);
    float _523 = in.m_54.y;
    float _525 = gl_FragCoord.w;
    float _527 = _523 * _525;
    float _529 = fma(_499, 0.072200000286102294921875, _521);
    bool _531 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _533 = 1.0 / _529;
    float _535 = _533 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _537 = precise::clamp(_535, 0.0, 1.0);
    float _539 = _77 * _507;
    float _541 = fma(_537, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _543 = _77 * _513;
    float _545 = _541 * _539;
    float _547 = 0.0 + _125;
    float _549 = precise::clamp(_547, 0.0, 1.0);
    float _551 = _77 * _519;
    float _553 = _77 * _527;
    float _555 = fma(_499, _545, _543);
    float _557 = fma(_495, _545, _551);
    float _559 = fma(_497, _545, _553);
    float _561 = _543;
    if (!_531)
    {
        _561 = _549;
    }
    float _563 = _561;
    bool _565 = !_531;
    float _567 = _563;
    if (!_565)
    {
        float _569 = in.m_56.w;
        float _571 = gl_FragCoord.w;
        float _573 = _569 * _571;
        float _575 = in.m_56.z;
        float _577 = gl_FragCoord.w;
        float _579 = _575 * _577;
        float _581 = _77 * _573;
        float _583 = _77 * _579;
        float _585 = 1.0 / _581;
        float _587 = _583 * _585;
        float _589 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _591 = fma(_587, (*spvDescriptorSet0.fp_c8)._m0[30].w, _589);
        float _593 = 1.0 / _591;
        float _595 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _597 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _599 = fma(_593, _595, _597);
        float _601 = _599 * 8.0;
        float _603 = precise::clamp(_601, 0.0, 1.0);
        float _605 = _549 * _603;
        _567 = _605;
    }
    float _607 = _567;
    float _609 = 0.0 + _607;
    float _611 = precise::clamp(_609, 0.0, 1.0);
    out.m_52.x = _557;
    out.m_52.y = _559;
    out.m_52.z = _555;
    out.m_52.w = _611;
    return out;
}

