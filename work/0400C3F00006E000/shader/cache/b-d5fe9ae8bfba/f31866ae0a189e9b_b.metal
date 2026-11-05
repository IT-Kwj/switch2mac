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
    texture2d<float> fp_t_tcb_10 [[id(5)]];
    sampler fp_t_tcb_10Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_A [[id(7)]];
    sampler fp_t_tcb_ASmplr [[id(8)]];
    texturecube<float> fp_t_tcb_1E [[id(9)]];
    sampler fp_t_tcb_1ESmplr [[id(10)]];
    sampler fp_t_tcb_8Smplr_w [[id(11)]];
    sampler fp_t_tcb_10Smplr_w [[id(12)]];
    sampler fp_t_tcb_ASmplr_w [[id(13)]];
    sampler fp_t_tcb_1ESmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_65 [[color(0)]];
};

struct main0_in
{
    float4 m_48 [[user(locn0)]];
    float4 m_50 [[user(locn1)]];
    float4 m_52 [[user(locn2)]];
    float4 m_69 [[user(locn3)]];
    float4 m_46 [[user(locn4)]];
    float4 m_44 [[user(locn5)]];
    float4 m_42 [[user(locn6)]];
    float4 m_62 [[user(locn7)]];
    float4 m_56 [[user(locn8)]];
    float4 m_54 [[user(locn9)]];
    float4 m_71 [[user(locn10)]];
    float4 m_67 [[user(locn11)]];
    float4 m_73 [[user(locn12)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], bool gl_FrontFacing [[front_facing]])
{
    main0_out out = {};
    float _80 = gl_FragCoord.w;
    float _82 = in.m_42.w;
    float _84 = gl_FragCoord.w;
    float _86 = _82 * _84;
    float _88 = in.m_44.x;
    float _90 = gl_FragCoord.w;
    float _92 = _88 * _90;
    float _94 = in.m_44.y;
    float _96 = gl_FragCoord.w;
    float _98 = _94 * _96;
    float _100 = in.m_42.y;
    float _102 = gl_FragCoord.w;
    float _104 = _100 * _102;
    float _106 = in.m_42.x;
    float _108 = gl_FragCoord.w;
    float _110 = _106 * _108;
    float _112 = 1.0 / _80;
    float _114 = _112 * _86;
    float _116 = _112 * _92;
    float _118 = _112 * _98;
    float _120 = _112 * _104;
    float _122 = _112 * _110;
    float _124 = 1.0 / _114;
    float2 _752 = float2(_116, _118);
    float _126 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_752, float2(0.0), isnan(_752))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_752, float2(0.0), isnan(_752))).w;
    float _128 = _120 * _124;
    float _130 = _122 * _124;
    float2 _769 = float2(_130, _128);
    float _132 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_769, float2(0.0), isnan(_769))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_769, float2(0.0), isnan(_769))).x;
    float _134 = in.m_42.z;
    float _136 = gl_FragCoord.w;
    float _138 = _134 * _136;
    float _140 = in.m_46.w;
    float _142 = gl_FragCoord.w;
    float _144 = _140 * _142;
    float _146 = in.m_48.w;
    float _148 = gl_FragCoord.w;
    float _150 = _146 * _148;
    float _152 = in.m_50.w;
    float _154 = gl_FragCoord.w;
    float _156 = _152 * _154;
    float _158 = in.m_52.x;
    float _160 = gl_FragCoord.w;
    float _162 = _158 * _160;
    float _164 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _166 = _112 * _138;
    float _168 = _112 * _144;
    float _170 = _112 * _150;
    float _172 = _166 * _124;
    float _174 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _176 = fma(_172, (*spvDescriptorSet0.fp_c8)._m0[30].w, _174);
    float _178 = -_170;
    float _180 = _178 + 1.0;
    float _182 = 1.0 / _176;
    float _184 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _186 = _182 * _184;
    float _188 = _126 + _168;
    float _190 = _188 * 0.5;
    float _192 = precise::max(_180, _190);
    float _194 = _112 * _162;
    float _196 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _198 = fma(_132, (*spvDescriptorSet0.fp_c8)._m0[30].w, _196);
    float _200 = -_170;
    float _202 = _200 + 1.14999997615814208984375;
    float _204 = precise::min(_202, _192);
    float _206 = 1.0 / _198;
    float _208 = -_180;
    float _210 = _208 + _204;
    float _212 = _210 * 6.666667938232421875;
    float _214 = _168 * _212;
    float _216 = _112 * _156;
    float _218 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _220 = -_186;
    float _222 = fma(_206, _218, _220);
    float _224 = _214 * _216;
    float _226 = _222 * _164;
    float _228 = precise::clamp(_226, 0.0, 1.0);
    float _230 = 0.0 + _224;
    float _232 = precise::clamp(_230, 0.0, 1.0);
    float _234 = _232 * _228;
    float _236 = _234 * _194;
    bool _239 = _236 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _241 = isnan(_236);
    bool _243 = _239 || _241;
    bool _245 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _247 = _243 || _245;
    float _249 = in.m_44.z;
    float _251 = gl_FragCoord.w;
    float _253 = _249 * _251;
    float _255 = in.m_44.w;
    float _257 = gl_FragCoord.w;
    float _259 = _255 * _257;
    float _261 = _186;
    if (!_247)
    {
        discard_fragment();
    }
    float _263 = _118 + 0.02999999932944774627685546875;
    float _265 = _116 + (-0.02999999932944774627685546875);
    float2 _964 = float2(_116, _263);
    float _267 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_964, float2(0.0), isnan(_964))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_964, float2(0.0), isnan(_964))).w;
    float2 _972 = float2(_265, _118);
    float _269 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_972, float2(0.0), isnan(_972))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_972, float2(0.0), isnan(_972))).w;
    float _271 = _112 * _253;
    float _273 = _112 * _259;
    float2 _986 = float2(_271, _273);
    float2 _277 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_986, float2(0.0), isnan(_986))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_986, float2(0.0), isnan(_986))).xy;
    float _279 = _277.x;
    float _281 = _277.y;
    float _283 = in.m_54.y;
    float _285 = gl_FragCoord.w;
    float _287 = _283 * _285;
    float _289 = in.m_54.x;
    float _291 = gl_FragCoord.w;
    float _293 = _289 * _291;
    float _295 = in.m_56.y;
    float _297 = gl_FragCoord.w;
    float _299 = _295 * _297;
    float _301 = as_type<float>(gl_FrontFacing ? (-1) : 0);
    float _303 = in.m_56.x;
    float _305 = gl_FragCoord.w;
    float _307 = _303 * _305;
    float _309 = in.m_56.z;
    float _311 = gl_FragCoord.w;
    float _313 = _309 * _311;
    float _315 = in.m_54.z;
    float _317 = gl_FragCoord.w;
    float _319 = _315 * _317;
    float _321 = in.m_62.y;
    float _323 = gl_FragCoord.w;
    float _325 = _321 * _323;
    float _327 = in.m_62.x;
    float _329 = gl_FragCoord.w;
    float _331 = _327 * _329;
    float _333 = -_170;
    float _335 = _333 + 1.2999999523162841796875;
    float _337 = _112 * _287;
    float _339 = _112 * _293;
    float _341 = _112 * _299;
    bool _343 = as_type<int>(_301) != 0;
    float _345 = _337 * _337;
    float _347 = _112 * _313;
    float _349 = _112 * _319;
    bool _351 = !_343;
    float _353 = -_341;
    float _355 = _351 ? _353 : _341;
    float _357 = fma(_339, _339, _345);
    float _359 = _112 * _307;
    bool _361 = !_343;
    float _363 = -_347;
    float _365 = _361 ? _363 : _347;
    float _367 = in.m_62.z;
    float _369 = gl_FragCoord.w;
    float _371 = _367 * _369;
    float _373 = _355 * _355;
    float _375 = fma(_349, _349, _357);
    bool _377 = !_343;
    float _379 = -_359;
    float _381 = _377 ? _379 : _359;
    float _383 = fma(_381, _381, _373);
    float _385 = rsqrt(_375);
    float _387 = fma(_365, _365, _383);
    float _389 = precise::min(_192, _335);
    float _391 = _112 * _325;
    float _393 = _112 * _331;
    float _395 = in.m_48.y;
    float _397 = gl_FragCoord.w;
    float _399 = _395 * _397;
    float _401 = rsqrt(_387);
    float _403 = -_180;
    float _405 = _403 + _389;
    float _407 = _391 * _391;
    float _409 = in.m_48.x;
    float _411 = gl_FragCoord.w;
    float _413 = _409 * _411;
    float _415 = in.m_48.z;
    float _417 = gl_FragCoord.w;
    float _419 = _415 * _417;
    float _421 = fma(_405, 6.666667938232421875, -1.0);
    float _423 = fma(_393, _393, _407);
    float _425 = _337 * _385;
    float _427 = abs(_421);
    float _429 = _427 * (*spvDescriptorSet0.fp_c9)._m0[191].x;
    float _431 = _349 * _385;
    float _433 = _112 * _371;
    float _435 = _355 * _401;
    float _437 = _381 * _401;
    float _439 = _365 * _401;
    float _441 = fma(_433, _433, _423);
    float _443 = _435 * _435;
    float _445 = rsqrt(_441);
    float _447 = fma(_437, _437, _443);
    float _449 = -_267;
    float _451 = _126 + _449;
    float _453 = -_126;
    float _455 = _453 + _269;
    float _457 = _451 * _429;
    float _459 = _455 * _429;
    float _461 = fma(_439, _439, _447);
    float _463 = rsqrt(_461);
    float _465 = fma(_281, 2.0, _457);
    float _467 = fma(_279, 2.0, _459);
    float _469 = _112 * _399;
    float _471 = _112 * _419;
    float _473 = _465 * _465;
    float _475 = _465 * _445;
    float _477 = fma(_467, _467, _473);
    float _479 = precise::clamp(_477, 0.0, 1.0);
    float _481 = _112 * _413;
    float _483 = -_479;
    float _485 = _483 + 1.0;
    float _487 = sqrt(_485);
    if (!_247)
    {
        out.m_65.x = _481;
        out.m_65.y = _469;
        out.m_65.z = _471;
        out.m_65.w = _224;
        return out;
    }
    float _489 = _433 * _475;
    float _491 = _391 * _475;
    float _493 = in.m_67.x;
    float _495 = gl_FragCoord.w;
    float _497 = _493 * _495;
    float _499 = _463 * _487;
    float _501 = fma(_467, _431, _489);
    float _503 = fma(_467, _425, _491);
    float _505 = abs(_437);
    float _507 = abs(_435);
    float _509 = precise::max(_505, _507);
    float _511 = fma(_439, _499, _501);
    float _513 = fma(_435, _499, _503);
    float _515 = _511 * (-0.577381789684295654296875);
    float _517 = abs(_439);
    float _519 = precise::max(_517, _509);
    float _521 = fma(_513, -0.816474258899688720703125, _515);
    float _523 = 1.0 / _519;
    float _525 = fma(_521, 0.5, 0.5);
    float _527 = precise::max(0.0, _525);
    float _529 = precise::min(_527, 0.5);
    float _531 = _435 * _523;
    float _533 = _112 * _497;
    float _535 = fma(_529, 1.60000002384185791015625, _533);
    float _537 = _437 * _523;
    float _539 = -_523;
    float _541 = _439 * _539;
    float _543 = precise::min(_535, 1.0);
    float3 _1373 = float3(_537, _531, _541);
    float3 _547 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1373, float3(0.0), isnan(_1373)), level(_543)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1373, float3(0.0), isnan(_1373)), level(_543)).xyz;
    float _549 = _547.x;
    float _551 = _547.y;
    float _553 = _547.z;
    float _555 = in.m_69.x;
    float _557 = gl_FragCoord.w;
    float _559 = _555 * _557;
    float _561 = in.m_69.z;
    float _563 = gl_FragCoord.w;
    float _565 = _561 * _563;
    float _567 = in.m_69.y;
    float _569 = gl_FragCoord.w;
    float _571 = _567 * _569;
    float _573 = in.m_71.x;
    float _575 = gl_FragCoord.w;
    float _577 = _573 * _575;
    float _579 = in.m_71.z;
    float _581 = gl_FragCoord.w;
    float _583 = _579 * _581;
    float _585 = in.m_71.y;
    float _587 = gl_FragCoord.w;
    float _589 = _585 * _587;
    float _591 = in.m_73.x;
    float _593 = gl_FragCoord.w;
    float _595 = _591 * _593;
    float _597 = in.m_73.y;
    float _599 = gl_FragCoord.w;
    float _601 = _597 * _599;
    float _603 = in.m_73.z;
    float _605 = gl_FragCoord.w;
    float _607 = _603 * _605;
    float _609 = in.m_73.w;
    float _611 = gl_FragCoord.w;
    float _613 = _609 * _611;
    bool _615 = 0.5 <= (*spvDescriptorSet0.fp_c15)._m0[653].w;
    if (_615)
    {
        float _617 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _619 = _186 + _617;
        _261 = _619;
    }
    float _621 = _261;
    float _623 = _621;
    if (_615)
    {
        float _625 = _621 * 8.0;
        float _627 = precise::clamp(_625, 0.0, 1.0);
        _623 = _627;
    }
    float _629 = _623;
    float _631 = _112 * _559;
    float _633 = _112 * _565;
    float _635 = _112 * _577;
    float _637 = _112 * _583;
    float _639 = _112 * _589;
    float _641 = _112 * _601;
    float _643 = fma(_549, 0.20999999344348907470703125, _631);
    float _645 = _112 * _571;
    float _647 = fma(_553, 0.20999999344348907470703125, _633);
    float _649 = _112 * _595;
    float _651 = _643 + _635;
    float _653 = fma(_551, 0.20999999344348907470703125, _645);
    float _655 = _647 + _637;
    float _657 = 0.0 + _236;
    float _659 = precise::clamp(_657, 0.0, 1.0);
    float _661 = _112 * _607;
    float _663 = _653 + _639;
    float _665 = _112 * _613;
    float _667 = _481 * _651;
    float _669 = _471 * _655;
    float _671 = _469 * _663;
    float _673 = _659;
    if (_615)
    {
        float _675 = _659 * _629;
        _673 = _675;
    }
    float _677 = _673;
    float _679 = fma(_667, _665, _649);
    float _681 = fma(_669, _665, _661);
    float _683 = fma(_671, _665, _641);
    float _685 = 0.0 + _677;
    float _687 = precise::clamp(_685, 0.0, 1.0);
    out.m_65.x = _679;
    out.m_65.y = _683;
    out.m_65.z = _681;
    out.m_65.w = _687;
    return out;
}

