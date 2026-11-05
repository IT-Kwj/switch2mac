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
    constant _16* fp_c9 [[id(1)]];
    constant _16* fp_c15 [[id(2)]];
    texture2d<float> fp_t_tcb_10 [[id(3)]];
    sampler fp_t_tcb_10Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_C [[id(5)]];
    sampler fp_t_tcb_CSmplr [[id(6)]];
    texture2d<float> fp_t_tcb_8 [[id(7)]];
    sampler fp_t_tcb_8Smplr [[id(8)]];
    texture2d<float> fp_t_tcb_A [[id(9)]];
    sampler fp_t_tcb_ASmplr [[id(10)]];
    texturecube<float> fp_t_tcb_1E [[id(11)]];
    sampler fp_t_tcb_1ESmplr [[id(12)]];
    sampler fp_t_tcb_10Smplr_w [[id(13)]];
    sampler fp_t_tcb_CSmplr_w [[id(14)]];
    sampler fp_t_tcb_8Smplr_w [[id(15)]];
    sampler fp_t_tcb_ASmplr_w [[id(16)]];
    sampler fp_t_tcb_1ESmplr_w [[id(17)]];
    constant dm_border_t* dm_border [[id(18)]];
};

struct main0_out
{
    float4 m_59 [[color(0)]];
};

struct main0_in
{
    float4 m_50 [[user(locn0)]];
    float4 m_54 [[user(locn1)]];
    float4 m_56 [[user(locn2)]];
    float4 m_69 [[user(locn3)]];
    float4 m_52 [[user(locn4)]];
    float4 m_48 [[user(locn5)]];
    float4 m_44 [[user(locn6)]];
    float4 m_46 [[user(locn7)]];
    float4 m_63 [[user(locn8)]];
    float4 m_65 [[user(locn9)]];
    float4 m_61 [[user(locn10)]];
    float4 m_71 [[user(locn11)]];
    float4 m_67 [[user(locn12)]];
    float4 m_73 [[user(locn13)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _80 = gl_FragCoord.w;
    float _82 = in.m_44.w;
    float _84 = gl_FragCoord.w;
    float _86 = _82 * _84;
    float _88 = in.m_44.y;
    float _90 = gl_FragCoord.w;
    float _92 = _88 * _90;
    float _94 = in.m_44.x;
    float _96 = gl_FragCoord.w;
    float _98 = _94 * _96;
    float _100 = in.m_46.x;
    float _102 = gl_FragCoord.w;
    float _104 = _100 * _102;
    float _106 = in.m_48.x;
    float _108 = gl_FragCoord.w;
    float _110 = _106 * _108;
    float _112 = in.m_48.y;
    float _114 = gl_FragCoord.w;
    float _116 = _112 * _114;
    float _118 = in.m_46.y;
    float _120 = gl_FragCoord.w;
    float _122 = _118 * _120;
    float _124 = 1.0 / _80;
    float _126 = _124 * _86;
    float _128 = _124 * _92;
    float _130 = _124 * _98;
    float _132 = _124 * _104;
    float _134 = _124 * _110;
    float _136 = _124 * _116;
    float _138 = 1.0 / _126;
    float _140 = _124 * _122;
    float _142 = _128 * _138;
    float _144 = _130 * _138;
    float2 _796 = float2(_144, _142);
    float _146 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_796, float2(0.0), isnan(_796))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_796, float2(0.0), isnan(_796))).x;
    float2 _807 = float2(_132, _140);
    float _148 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_807, float2(0.0), isnan(_807))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_807, float2(0.0), isnan(_807))).w;
    float2 _815 = float2(_134, _136);
    float4 _151 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_815, float2(0.0), isnan(_815))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_815, float2(0.0), isnan(_815))).xyzw;
    float _153 = _151.x;
    float _155 = _151.y;
    float _157 = _151.z;
    float _159 = _151.w;
    float _161 = in.m_44.z;
    float _163 = gl_FragCoord.w;
    float _165 = _161 * _163;
    float _167 = in.m_50.w;
    float _169 = gl_FragCoord.w;
    float _171 = _167 * _169;
    float _173 = in.m_52.w;
    float _175 = gl_FragCoord.w;
    float _177 = _173 * _175;
    float _179 = in.m_54.w;
    float _181 = gl_FragCoord.w;
    float _183 = _179 * _181;
    float _185 = in.m_56.x;
    float _187 = gl_FragCoord.w;
    float _189 = _185 * _187;
    float _191 = _124 * _165;
    float _193 = _191 * _138;
    float _195 = _124 * _171;
    float _197 = _124 * _177;
    float _199 = _124 * _189;
    float _201 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _203 = fma(_193, (*spvDescriptorSet0.fp_c8)._m0[30].w, _201);
    float _205 = 1.0 / _203;
    float _207 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _209 = fma(_146, (*spvDescriptorSet0.fp_c8)._m0[30].w, _207);
    float _211 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _213 = _159 * _148;
    float _215 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _217 = _205 * _215;
    float _219 = -_195;
    float _221 = fma(_213, _197, _219);
    float _223 = _124 * _183;
    float _225 = 1.0 / _209;
    float _227 = _223 * _221;
    float _229 = 0.0 + _227;
    float _231 = precise::clamp(_229, 0.0, 1.0);
    float _233 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _235 = -_217;
    float _237 = fma(_225, _233, _235);
    float _239 = _237 * _211;
    float _241 = precise::clamp(_239, 0.0, 1.0);
    float _243 = _231 * _241;
    float _245 = _243 * _199;
    bool _249 = _245 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _251 = isnan(_245);
    bool _253 = _249 || _251;
    bool _255 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _257 = _253 || _255;
    float _259 = in.m_48.z;
    float _261 = gl_FragCoord.w;
    float _263 = _259 * _261;
    float _265 = in.m_48.w;
    float _267 = gl_FragCoord.w;
    float _269 = _265 * _267;
    if (!_257)
    {
        discard_fragment();
    }
    float _271 = _124 * _263;
    float _273 = _124 * _269;
    float2 _994 = float2(_271, _273);
    float2 _277 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_994, float2(0.0), isnan(_994))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_994, float2(0.0), isnan(_994))).xy;
    float _279 = _277.x;
    float _281 = _277.y;
    float _283 = in.m_50.x;
    float _285 = gl_FragCoord.w;
    float _287 = _283 * _285;
    float _289 = in.m_50.y;
    float _291 = gl_FragCoord.w;
    float _293 = _289 * _291;
    float _295 = in.m_54.x;
    float _297 = gl_FragCoord.w;
    float _299 = _295 * _297;
    float _301 = in.m_50.z;
    float _303 = gl_FragCoord.w;
    float _305 = _301 * _303;
    float _307 = in.m_54.z;
    float _309 = gl_FragCoord.w;
    float _311 = _307 * _309;
    float _313 = in.m_54.y;
    float _315 = gl_FragCoord.w;
    float _317 = _313 * _315;
    float _319 = in.m_52.x;
    float _321 = gl_FragCoord.w;
    float _323 = _319 * _321;
    float _325 = in.m_52.y;
    float _327 = gl_FragCoord.w;
    float _329 = _325 * _327;
    float _331 = in.m_52.z;
    float _333 = gl_FragCoord.w;
    float _335 = _331 * _333;
    float _337 = _153 * _153;
    float _339 = _157 * _157;
    float _341 = _155 * _155;
    float _343 = _124 * _287;
    float _345 = _124 * _293;
    float _347 = _124 * _299;
    float _349 = _124 * _305;
    float _351 = _124 * _311;
    float _353 = _124 * _317;
    float _355 = -_347;
    float _357 = _343 + _355;
    float _359 = -_351;
    float _361 = _349 + _359;
    float _363 = -_353;
    float _365 = _345 + _363;
    float _367 = fma(_337, _357, _347);
    float _369 = _124 * _323;
    float _371 = fma(_339, _361, _351);
    float _373 = fma(_341, _365, _353);
    float _375 = _124 * _329;
    float _377 = _124 * _335;
    float _379 = _367 * _369;
    float _381 = _373 * _375;
    float _383 = _371 * _377;
    if (!_257)
    {
        out.m_59.x = _379;
        out.m_59.y = _381;
        out.m_59.z = _383;
        out.m_59.w = _227;
        return out;
    }
    float _385 = in.m_61.x;
    float _387 = gl_FragCoord.w;
    float _389 = _385 * _387;
    float _391 = in.m_61.z;
    float _393 = gl_FragCoord.w;
    float _395 = _391 * _393;
    float _397 = in.m_63.y;
    float _399 = gl_FragCoord.w;
    float _401 = _397 * _399;
    float _403 = in.m_61.y;
    float _405 = gl_FragCoord.w;
    float _407 = _403 * _405;
    float _409 = in.m_63.x;
    float _411 = gl_FragCoord.w;
    float _413 = _409 * _411;
    float _415 = in.m_65.y;
    float _417 = gl_FragCoord.w;
    float _419 = _415 * _417;
    float _421 = in.m_63.z;
    float _423 = gl_FragCoord.w;
    float _425 = _421 * _423;
    float _427 = in.m_65.x;
    float _429 = gl_FragCoord.w;
    float _431 = _427 * _429;
    float _433 = in.m_65.z;
    float _435 = gl_FragCoord.w;
    float _437 = _433 * _435;
    float _439 = _281 * _281;
    float _441 = fma(_279, _279, _439);
    float _443 = precise::clamp(_441, 0.0, 1.0);
    float _445 = _124 * _389;
    float _447 = -_443;
    float _449 = _447 + 1.0;
    float _451 = _124 * _395;
    float _453 = _124 * _401;
    float _455 = _124 * _407;
    float _457 = _124 * _413;
    float _459 = _124 * _419;
    float _461 = _453 * _453;
    float _463 = _455 * _455;
    float _465 = _124 * _425;
    float _467 = _124 * _431;
    float _469 = fma(_457, _457, _461);
    float _471 = _459 * _459;
    float _473 = fma(_445, _445, _463);
    float _475 = _124 * _437;
    float _477 = fma(_465, _465, _469);
    float _479 = fma(_467, _467, _471);
    float _481 = fma(_451, _451, _473);
    float _483 = sqrt(_449);
    float _485 = fma(_475, _475, _479);
    float _487 = rsqrt(_477);
    float _489 = rsqrt(_481);
    float _491 = rsqrt(_485);
    float _493 = _281 * _487;
    float _495 = _453 * _493;
    float _497 = _457 * _493;
    float _499 = _465 * _493;
    float _501 = _279 * _489;
    float _503 = fma(_455, _501, _495);
    float _505 = fma(_445, _501, _497);
    float _507 = fma(_451, _501, _499);
    float _509 = _483 * _491;
    float _511 = in.m_67.x;
    float _513 = gl_FragCoord.w;
    float _515 = _511 * _513;
    float _517 = fma(_459, _509, _503);
    float _519 = fma(_467, _509, _505);
    float _521 = fma(_475, _509, _507);
    float _523 = _517 * _517;
    float _525 = fma(_519, _519, _523);
    float _527 = fma(_521, _521, _525);
    float _529 = rsqrt(_527);
    float _531 = _124 * _515;
    float _533 = _519 * _529;
    float _535 = _517 * _529;
    float _537 = _521 * _529;
    float _539 = precise::min(_531, 1.0);
    float _541 = abs(_533);
    float _543 = abs(_535);
    float _545 = precise::max(_541, _543);
    float _547 = abs(_537);
    float _549 = precise::max(_547, _545);
    float _551 = 1.0 / _549;
    float _553 = _533 * _551;
    float _555 = _535 * _551;
    float _557 = -_551;
    float _559 = _537 * _557;
    float3 _1400 = float3(_553, _555, _559);
    float3 _563 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1400, float3(0.0), isnan(_1400)), level(_539)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1400, float3(0.0), isnan(_1400)), level(_539)).xyz;
    float _565 = _563.x;
    float _567 = _563.y;
    float _569 = _563.z;
    float _571 = in.m_69.x;
    float _573 = gl_FragCoord.w;
    float _575 = _571 * _573;
    float _577 = in.m_69.z;
    float _579 = gl_FragCoord.w;
    float _581 = _577 * _579;
    float _583 = in.m_69.y;
    float _585 = gl_FragCoord.w;
    float _587 = _583 * _585;
    float _589 = in.m_71.z;
    float _591 = gl_FragCoord.w;
    float _593 = _589 * _591;
    float _595 = in.m_71.x;
    float _597 = gl_FragCoord.w;
    float _599 = _595 * _597;
    float _601 = in.m_71.y;
    float _603 = gl_FragCoord.w;
    float _605 = _601 * _603;
    float _607 = in.m_73.x;
    float _609 = gl_FragCoord.w;
    float _611 = _607 * _609;
    float _613 = in.m_73.y;
    float _615 = gl_FragCoord.w;
    float _617 = _613 * _615;
    float _619 = in.m_73.z;
    float _621 = gl_FragCoord.w;
    float _623 = _619 * _621;
    float _625 = in.m_73.w;
    float _627 = gl_FragCoord.w;
    float _629 = _625 * _627;
    bool _631 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _633 = _124 * _575;
    float _635 = _124 * _587;
    float _637 = _124 * _593;
    float _639 = _124 * _599;
    float _641 = _124 * _605;
    float _643 = _124 * _617;
    float _645 = _124 * _623;
    float _647 = fma(_565, 0.20999999344348907470703125, _633);
    float _649 = _124 * _581;
    float _651 = fma(_567, 0.20999999344348907470703125, _635);
    float _653 = _124 * _611;
    float _655 = _647 + _639;
    float _657 = fma(_569, 0.20999999344348907470703125, _649);
    float _659 = _649;
    if (_631)
    {
        float _661 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _663 = _217 + _661;
        _659 = _663;
    }
    float _665 = _659;
    float _667 = _651 + _641;
    float _669 = _124 * _629;
    float _671 = _657 + _637;
    float _673 = 0.0 + _245;
    float _675 = precise::clamp(_673, 0.0, 1.0);
    float _677 = _665;
    float _679 = _675;
    if (_631)
    {
        float _681 = _665 * 8.0;
        float _683 = precise::clamp(_681, 0.0, 1.0);
        _677 = _683;
    }
    float _685 = _677;
    float _687 = _379 * _655;
    float _689 = _381 * _667;
    float _691 = _383 * _671;
    if (_631)
    {
        float _693 = _675 * _685;
        _679 = _693;
    }
    float _695 = _679;
    float _697 = fma(_687, _669, _653);
    float _699 = fma(_689, _669, _643);
    float _701 = fma(_691, _669, _645);
    float _703 = 0.0 + _695;
    float _705 = precise::clamp(_703, 0.0, 1.0);
    out.m_59.x = _697;
    out.m_59.y = _699;
    out.m_59.z = _701;
    out.m_59.w = _705;
    return out;
}

