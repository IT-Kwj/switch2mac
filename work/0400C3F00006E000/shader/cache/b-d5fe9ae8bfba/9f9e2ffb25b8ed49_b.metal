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
    constant _16* fp_c8 [[id(1)]];
    constant _16* fp_c15 [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    texture2d<float> fp_t_tcb_10 [[id(7)]];
    sampler fp_t_tcb_10Smplr [[id(8)]];
    sampler fp_t_tcb_8Smplr_w [[id(9)]];
    sampler fp_t_tcb_ASmplr_w [[id(10)]];
    sampler fp_t_tcb_10Smplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_58 [[color(0)]];
};

struct main0_in
{
    float4 m_51 [[user(locn0)]];
    float4 m_49 [[user(locn1)]];
    float4 m_41 [[user(locn2)]];
    float4 m_53 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_55 [[user(locn5)]];
    float4 m_35 [[user(locn6), flat]];
    float4 m_43 [[user(locn7)]];
    float4 m_37 [[user(locn8), flat]];
    float4 m_47 [[user(locn9), flat]];
    float4 m_60 [[user(locn11)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _67 = in.m_35.x;
    float _69 = in.m_37.y;
    float _71 = gl_FragCoord.w;
    float _73 = in.m_41.y;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = in.m_41.x;
    float _81 = gl_FragCoord.w;
    float _83 = _79 * _81;
    float _85 = _67 * 6.283185482025146484375;
    float _87 = 1.0 / _71;
    float _89 = fma(_69, 0.0199999995529651641845703125, _85);
    float _91 = _89 * 0.15915493667125701904296875;
    float _93 = _91 * 6.283185482025146484375;
    float _95 = sin(_93);
    float _97 = _87 * _77;
    float _99 = _87 * _83;
    float _101 = fma(_95, 0.20000000298023223876953125, _97);
    float2 _721 = float2(_99, _101);
    float2 _105 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_721, float2(0.0), isnan(_721))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_721, float2(0.0), isnan(_721))).xw;
    float _107 = _105.x;
    float _109 = _105.y;
    float _111 = in.m_43.x;
    float _113 = gl_FragCoord.w;
    float _115 = _111 * _113;
    float _117 = in.m_43.y;
    float _119 = gl_FragCoord.w;
    float _121 = _117 * _119;
    float _123 = in.m_43.z;
    float _125 = gl_FragCoord.w;
    float _127 = _123 * _125;
    float _129 = in.m_45.w;
    float _131 = gl_FragCoord.w;
    float _133 = _129 * _131;
    float _135 = in.m_47.x;
    float _137 = in.m_41.z;
    float _139 = gl_FragCoord.w;
    float _141 = _137 * _139;
    float _143 = in.m_41.w;
    float _145 = gl_FragCoord.w;
    float _147 = _143 * _145;
    float _149 = in.m_45.x;
    float _151 = gl_FragCoord.w;
    float _153 = _149 * _151;
    float _155 = in.m_45.y;
    float _157 = gl_FragCoord.w;
    float _159 = _155 * _157;
    float _161 = _87 * _115;
    float _163 = _87 * _121;
    float _165 = _87 * _127;
    float _167 = _161 * _161;
    float _169 = _163 + 1.0;
    float _171 = _87 * _153;
    float _173 = fma(_169, _169, _167);
    float _175 = fma(_165, _165, _173);
    float _177 = sqrt(_175);
    float _179 = fma(_177, 0.666666686534881591796875, -0.2666666805744171142578125);
    float _181 = precise::clamp(_179, 0.0, 1.0);
    float _183 = _87 * _147;
    float _185 = fma(_181, -2.0, 3.0);
    float _187 = _181 * _181;
    float _189 = _87 * _133;
    float _191 = _185 * _187;
    float _193 = 1.0 / _189;
    float _195 = fma(_107, 2.0, -1.0);
    float _197 = _195 * _135;
    float _199 = _191 * _109;
    float _201 = _191 * _197;
    float _203 = _87 * _141;
    float _205 = _199 * (*spvDescriptorSet0.fp_c9)._m0[191].y;
    float _207 = fma(_135, _199, _183);
    float _209 = precise::clamp(_207, 0.0, 1.0);
    float _211 = _87 * _159;
    float _213 = 0.0 + _203;
    float _215 = precise::clamp(_213, 0.0, 1.0);
    float _217 = _183 + _205;
    float _219 = precise::clamp(_217, 0.0, 1.0);
    float _221 = _171 * _193;
    float _223 = _211 * _193;
    float _225 = fma(_201, 0.5, _203);
    float _227 = precise::clamp(_225, 0.0, 1.0);
    float2 _898 = float2(_215, _219);
    float _229 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_898, float2(0.0), isnan(_898))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_898, float2(0.0), isnan(_898))).x;
    float2 _906 = float2(_221, _223);
    float _231 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_906, float2(0.0), isnan(_906))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_906, float2(0.0), isnan(_906))).x;
    float2 _914 = float2(_227, _209);
    float2 _233 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_914, float2(0.0), isnan(_914))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_914, float2(0.0), isnan(_914))).yz;
    float _235 = _233.x;
    float _237 = _233.y;
    float _239 = in.m_49.w;
    float _241 = gl_FragCoord.w;
    float _243 = _239 * _241;
    float _245 = _163 + 1.10000002384185791015625;
    float _247 = in.m_45.z;
    float _249 = gl_FragCoord.w;
    float _251 = _247 * _249;
    float _253 = fma(_245, _245, _167);
    float _255 = in.m_51.w;
    float _257 = gl_FragCoord.w;
    float _259 = _255 * _257;
    float _261 = fma(_165, _165, _253);
    float _263 = sqrt(_261);
    float _265 = _87 * _243;
    float _267 = fma(_263, 0.52631580829620361328125, -0.105263166129589080810546875);
    float _269 = precise::clamp(_267, 0.0, 1.0);
    float _271 = _87 * _251;
    float _273 = in.m_53.w;
    float _275 = gl_FragCoord.w;
    float _277 = _273 * _275;
    float _279 = _265 * 0.100000001490116119384765625;
    float _281 = fma(_269, -2.0, 3.0);
    float _283 = _271 * _193;
    float _285 = -_279;
    float _287 = _265 + _285;
    float _289 = _269 * _269;
    float _291 = _87 * _259;
    float _293 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _295 = fma(_283, (*spvDescriptorSet0.fp_c8)._m0[30].w, _293);
    float _297 = 1.0 / _287;
    float _299 = _281 * _289;
    float _301 = in.m_55.x;
    float _303 = gl_FragCoord.w;
    float _305 = _301 * _303;
    float _307 = 1.0 / _295;
    float _309 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _311 = _87 * _277;
    float _313 = precise::max(_279, _229);
    float _315 = precise::min(_265, _313);
    float _317 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _319 = fma(_231, (*spvDescriptorSet0.fp_c8)._m0[30].w, _317);
    float _321 = -_299;
    float _323 = _321 + 1.0;
    float _325 = -_279;
    float _327 = _325 + _315;
    float _329 = 1.0 / _319;
    float _331 = _327 * _297;
    float _333 = _331 * _323;
    float _335 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _337 = _307 * _335;
    float _339 = _87 * _305;
    float _341 = _237 + _333;
    float _343 = _291 * _341;
    float _345 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _347 = -_337;
    float _349 = fma(_329, _345, _347);
    float _351 = _343 * _311;
    float _353 = _349 * _309;
    float _355 = precise::clamp(_353, 0.0, 1.0);
    float _357 = 0.0 + _351;
    float _359 = precise::clamp(_357, 0.0, 1.0);
    float _361 = _359 * _355;
    float _363 = _361 * _339;
    bool _367 = _363 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _369 = isnan(_363);
    bool _371 = _367 || _369;
    bool _373 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _375 = _371 || _373;
    float _377 = _205 * (-0.02000000141561031341552734375);
    float _379 = _377 * (*spvDescriptorSet0.fp_c15)._m0[630].w;
    float _381 = _205 * (-0.100000001490116119384765625);
    float _383 = _337;
    if (!_375)
    {
        discard_fragment();
    }
    float _385 = in.m_35.z;
    float _387 = fma(_171, _193, _379);
    float _389 = fma(_211, _193, _381);
    float _391 = _69 * 0.004999999888241291046142578125;
    float _393 = _69 * 0.039999999105930328369140625;
    float _395 = floor(_391);
    float _397 = floor(_393);
    float _399 = -_395;
    float _401 = _391 + _399;
    float _403 = -_397;
    float _405 = _393 + _403;
    float _407 = _203 + _385;
    float2 _1166 = float2(_387, _389);
    float _409 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1166, float2(0.0), isnan(_1166))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_1166, float2(0.0), isnan(_1166))).x;
    float _411 = fma(_203, 2.0, -1.0);
    float _413 = fma(_407, 0.550000011920928955078125, _401);
    float _415 = in.m_35.w;
    float _417 = _411 * _411;
    float _419 = _411 * _417;
    float _421 = fma(_419, 0.4000000059604644775390625, _413);
    float _423 = _183 + _415;
    float _425 = fma(_183, 2.0, -1.0);
    float _427 = fma(_423, 0.699999988079071044921875, _405);
    float _429 = _425 * _425;
    float _431 = _425 * _429;
    float _433 = fma(_431, 0.100000001490116119384765625, _427);
    float2 _1210 = float2(_421, _433);
    float _435 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1210, float2(0.0), isnan(_1210))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1210, float2(0.0), isnan(_1210))).w;
    float _437 = in.m_49.x;
    float _439 = gl_FragCoord.w;
    float _441 = _437 * _439;
    float _443 = in.m_49.y;
    float _445 = gl_FragCoord.w;
    float _447 = _443 * _445;
    float _449 = in.m_49.z;
    float _451 = gl_FragCoord.w;
    float _453 = _449 * _451;
    float _455 = fma(_299, 2.0, -1.0);
    float _457 = _235 * 20.0;
    float _459 = precise::clamp(_457, 0.0, 1.0);
    float _461 = _455 * _455;
    float _463 = fma(_459, -2.0, 3.0);
    float _465 = _459 * _459;
    float _467 = fma(_455, _461, _455);
    float _469 = _463 * _465;
    float _471 = _467 * 0.5;
    float _473 = in.m_51.x;
    float _475 = gl_FragCoord.w;
    float _477 = _473 * _475;
    float _479 = fma(_471, _469, 0.5);
    float _481 = fma(_479, 2.0, -1.0);
    float _483 = fma(_479, -2.0, 1.0);
    float _485 = precise::clamp(_483, 0.0, 1.0);
    float _487 = abs(_481);
    float _489 = -_487;
    float _491 = _489 + 1.0;
    float _493 = 0.0 + _481;
    float _495 = precise::clamp(_493, 0.0, 1.0);
    float _497 = _87 * _441;
    float _499 = _87 * _447;
    float _501 = _87 * _453;
    float _503 = in.m_51.y;
    float _505 = gl_FragCoord.w;
    float _507 = _503 * _505;
    float _509 = in.m_51.z;
    float _511 = gl_FragCoord.w;
    float _513 = _509 * _511;
    float _515 = _497 * _491;
    float _517 = _499 * _491;
    float _519 = _501 * _491;
    float _521 = fma(_485, (*spvDescriptorSet0.fp_c9)._m0[192].y, _515);
    float _523 = fma(_485, (*spvDescriptorSet0.fp_c9)._m0[192].z, _517);
    float _525 = fma(_485, (*spvDescriptorSet0.fp_c9)._m0[192].w, _519);
    float _527 = fma(_495, (*spvDescriptorSet0.fp_c9)._m0[191].z, _521);
    float _529 = fma(_495, (*spvDescriptorSet0.fp_c9)._m0[191].w, _523);
    float _531 = fma(_495, (*spvDescriptorSet0.fp_c9)._m0[192].x, _525);
    float _533 = _87 * _477;
    float _535 = _87 * _507;
    float _537 = _87 * _513;
    float _539 = abs(_409);
    float _541 = log2(_539);
    float _543 = _541 * 200.0;
    float _545 = fma(_535, _235, _529);
    float _547 = exp2(_543);
    float _549 = precise::max(_547, 0.20000000298023223876953125);
    float _551 = precise::min(_549, 0.300000011920928955078125);
    float _553 = precise::max(_435, 0.4000000059604644775390625);
    float _555 = precise::min(_553, 0.89999997615814208984375);
    float _557 = fma(_555, 2.0000002384185791015625, -0.800000131130218505859375);
    float _559 = fma(_533, _235, _527);
    float _561 = fma(_537, _235, _531);
    float _563 = _557 * _557;
    float _565 = fma(_563, 0.1500000059604644775390625, _333);
    float _567 = _565 * 4.0;
    float _569 = fma(_551, 3.9999997615814208984375, -0.2000000476837158203125);
    float _571 = _533 * _567;
    float _573 = _535 * _567;
    float _575 = _537 * _567;
    float _577 = fma(_559, _569, _571);
    float _579 = fma(_545, _569, _573);
    float _581 = fma(_561, _569, _575);
    if (!_375)
    {
        out.m_58.x = _577;
        out.m_58.y = _579;
        out.m_58.z = _581;
        out.m_58.w = _351;
        return out;
    }
    float _583 = _579 * 0.715200006961822509765625;
    float _585 = in.m_60.w;
    float _587 = gl_FragCoord.w;
    float _589 = _585 * _587;
    float _591 = in.m_60.x;
    float _593 = gl_FragCoord.w;
    float _595 = _591 * _593;
    float _597 = in.m_60.y;
    float _599 = gl_FragCoord.w;
    float _601 = _597 * _599;
    float _603 = fma(_577, 0.2125999927520751953125, _583);
    float _605 = in.m_60.z;
    float _607 = gl_FragCoord.w;
    float _609 = _605 * _607;
    float _611 = fma(_581, 0.072200000286102294921875, _603);
    bool _613 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _615 = 1.0 / _611;
    float _617 = (*spvDescriptorSet0.fp_c15)._m0[2].y;
    if (_613)
    {
        float _619 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _621 = _337 + _619;
        _383 = _621;
    }
    float _623 = _383;
    float _625 = _615 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _627 = precise::clamp(_625, 0.0, 1.0);
    float _629 = fma(_627, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _631 = _87 * _589;
    if (_613)
    {
        float _633 = _623 * 8.0;
        float _635 = precise::clamp(_633, 0.0, 1.0);
        _617 = _635;
    }
    float _637 = _617;
    float _639 = _87 * _595;
    float _641 = _87 * _601;
    float _643 = _629 * _631;
    float _645 = 0.0 + _363;
    float _647 = precise::clamp(_645, 0.0, 1.0);
    float _649 = _87 * _609;
    float _651 = fma(_577, _643, _639);
    float _653 = _647;
    if (_613)
    {
        float _655 = _647 * _637;
        _653 = _655;
    }
    float _657 = _653;
    float _659 = fma(_579, _643, _641);
    float _661 = fma(_581, _643, _649);
    float _663 = 0.0 + _657;
    float _665 = precise::clamp(_663, 0.0, 1.0);
    out.m_58.x = _651;
    out.m_58.y = _659;
    out.m_58.z = _661;
    out.m_58.w = _665;
    return out;
}

