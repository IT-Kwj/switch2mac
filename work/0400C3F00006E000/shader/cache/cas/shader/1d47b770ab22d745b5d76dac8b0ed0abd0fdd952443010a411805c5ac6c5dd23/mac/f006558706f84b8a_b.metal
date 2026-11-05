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
    constant _16* fp_c3 [[id(0)]];
    texture2d<float> fp_t_tcb_A [[id(1)]];
    sampler fp_t_tcb_ASmplr [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    sampler fp_t_tcb_ASmplr_w [[id(5)]];
    sampler fp_t_tcb_8Smplr_w [[id(6)]];
    constant dm_border_t* dm_border [[id(7)]];
};

struct main0_out
{
    float4 m_34 [[color(0)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _41 = gl_FragCoord.w;
    float _43 = in.m_31.z;
    float _45 = gl_FragCoord.w;
    float _47 = _43 * _45;
    float _49 = in.m_31.w;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = in.m_31.x;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = in.m_31.y;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = 1.0 / _41;
    float _69 = _67 * _47;
    float _71 = _67 * _53;
    float _73 = _67 * _59;
    float _75 = _67 * _65;
    float2 _1779 = float2(_69, _71);
    float2 _79 = spvDescriptorSet0.fp_t_tcb_A.gather(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1779, float2(0.0), isnan(_1779)), int2(0), component::x).xz;
    float _81 = _79.x;
    float _83 = _79.y;
    float2 _1794 = float2(_73, _75);
    float3 _87 = spvDescriptorSet0.fp_t_tcb_A.gather(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1794, float2(0.0), isnan(_1794)), int2(0), component::x).xzw;
    float _89 = _87.x;
    float _91 = _87.y;
    float _93 = _87.z;
    float _95 = precise::max(_81, _83);
    float _97 = precise::max(_89, _91);
    float _99 = precise::min(_81, _83);
    float _101 = precise::min(_89, _91);
    float _103 = precise::max(_95, _97);
    float _105 = precise::min(_99, _101);
    float _107 = precise::max(_93, _103);
    float _109 = precise::min(_93, _105);
    float _111 = _107 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _113 = -_109;
    float _115 = _107 + _113;
    float _117 = precise::max(_111, (*spvDescriptorSet0.fp_c3)._m0[3].y);
    bool _121 = _115 >= _117;
    bool _123 = isnan(_115);
    bool _125 = _121 || _123;
    bool _127 = isnan(_117);
    bool _129 = _125 || _127;
    if (!_129)
    {
        float2 _1863 = float2(_73, _75);
        float4 _132 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1863, float2(0.0), isnan(_1863))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1863, float2(0.0), isnan(_1863))).xyzw;
        float _134 = _132.x;
        float _136 = _132.y;
        float _138 = _132.z;
        float _140 = _132.w;
        out.m_34.x = _134;
        out.m_34.y = _136;
        out.m_34.z = _138;
        out.m_34.w = _140;
        return out;
    }
    float2 _1889 = float2(_73, _75);
    float _142 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1889, float2(0.0), isnan(_1889)), int2(1, -1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1889, float2(0.0), isnan(_1889)), int2(1, -1)).x;
    float2 _1900 = float2(_73, _75);
    float _144 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1900, float2(0.0), isnan(_1900)), int2(-1, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1900, float2(0.0), isnan(_1900)), int2(-1, 1)).x;
    float _146 = _91 + _81;
    float _148 = _89 + _83;
    float _150 = fma(_93, -2.0, _146);
    float _152 = fma(_93, -2.0, _148);
    float _154 = _81 + _142;
    float _156 = _91 + _142;
    float _158 = _81 + _144;
    float _160 = _91 + _144;
    float _162 = fma(_83, -2.0, _154);
    float _164 = fma(_91, -2.0, _156);
    float _166 = fma(_81, -2.0, _158);
    float _168 = fma(_89, -2.0, _160);
    float _170 = abs(_150);
    float _172 = abs(_162);
    float _174 = fma(_170, 2.0, _172);
    float _176 = abs(_152);
    float _178 = abs(_166);
    float _180 = fma(_176, 2.0, _178);
    float _182 = abs(_168);
    float _184 = _182 + _174;
    float _186 = abs(_164);
    float _188 = _186 + _180;
    bool _190 = _188 >= _184;
    float _192 = float(_190);
    bool _194 = _188 < _184;
    bool _196 = isnan(_188);
    bool _198 = _194 || _196;
    bool _200 = isnan(_184);
    bool _202 = _198 || _200;
    float _204 = float(_202);
    float _206 = _83 * _192;
    float _208 = _89 * _192;
    float _210 = _192 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _212 = _192 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _214 = fma(_81, _204, _206);
    float _216 = fma(_91, _204, _208);
    float _218 = fma(_204, (*spvDescriptorSet0.fp_c3)._m0[0].x, _210);
    float _220 = _204 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _222 = -_93;
    float _224 = _222 + _214;
    float _226 = -_93;
    float _228 = _226 + _216;
    float _230 = abs(_224);
    float _232 = abs(_228);
    bool _234 = _230 >= _232;
    float _236 = -_218;
    float _238 = _234 ? _236 : _218;
    float _240 = _238 * 0.5;
    float _242 = fma(_204, _240, _73);
    float _244 = fma(_192, _240, _75);
    float _246 = -_212;
    float _248 = _246 + _242;
    float _250 = -_220;
    float _252 = _250 + _244;
    float _254 = _212 + _242;
    float _256 = _220 + _244;
    float2 _2072 = float2(_248, _252);
    float3 _258 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2072, float2(0.0), isnan(_2072))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2072, float2(0.0), isnan(_2072))).xyz;
    float _260 = _258.x;
    float _262 = _258.y;
    float _264 = _258.z;
    float2 _2086 = float2(_254, _256);
    float3 _266 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2086, float2(0.0), isnan(_2086))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2086, float2(0.0), isnan(_2086))).xyz;
    float _268 = _266.x;
    float _270 = _266.y;
    float _272 = _266.z;
    float _274 = 1.0 / _115;
    float _276 = _148 + _146;
    float _278 = _156 + _158;
    float _280 = _234 ? _214 : _216;
    float _282 = abs(_224);
    float _284 = abs(_228);
    float _286 = _234 ? _282 : _284;
    float _288 = fma(_276, 2.0, _278);
    float _290 = fma(_288, -0.083333335816860198974609375, _93);
    float _292 = abs(_290);
    float _294 = _292 * _274;
    float _296 = precise::clamp(_294, 0.0, 1.0);
    float _298 = fma(_296, 6.0, -15.0);
    float _300 = _296 * _296;
    float _302 = fma(_296, _298, 10.0);
    float _304 = _302 * _300;
    float _306 = _296 * _304;
    float _308 = _262 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _310 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[2].x, _308);
    float _312 = _93 + _280;
    float _314 = _270 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _316 = _286 * 0.25;
    float _318 = fma(_264, (*spvDescriptorSet0.fp_c3)._m0[2].z, _310);
    float _320 = _312 * 0.5;
    float _322 = fma(_268, (*spvDescriptorSet0.fp_c3)._m0[2].x, _314);
    float _324 = -_320;
    float _326 = _324 + _318;
    float _328 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[2].z, _322);
    float _330 = abs(_326);
    bool _332 = _330 >= _316;
    float _334 = -_320;
    float _336 = _334 + _328;
    float _338 = abs(_336);
    bool _340 = _338 >= _316;
    bool _342 = !_340;
    int _345 = _342 ? 0 : 1;
    int _347 = as_type<int>(_310);
    float _349 = _326;
    float _351 = _248;
    float _353 = _252;
    int _355 = _345;
    float _357 = _254;
    float _359 = _256;
    float _361 = _336;
    float _363 = _146;
    int _365 = as_type<int>(_328);
    int _367 = _340 ? (-1) : 0;
    if (_332)
    {
        bool _369 = !_332;
        int _371 = _369 ? 0 : 1;
        _347 = _371;
    }
    int _373 = _347;
    int _375 = _373;
    if (!_332)
    {
        float _377 = -_212;
        float _379 = _377 + _248;
        float _381 = -_220;
        float _383 = _381 + _252;
        float2 _2248 = float2(_379, _383);
        float3 _385 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2248, float2(0.0), isnan(_2248))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2248, float2(0.0), isnan(_2248))).xyz;
        float _387 = _385.x;
        float _389 = _385.y;
        float _391 = _385.z;
        float _393 = _389 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
        float _395 = fma(_387, (*spvDescriptorSet0.fp_c3)._m0[2].x, _393);
        float _397 = fma(_391, (*spvDescriptorSet0.fp_c3)._m0[2].z, _395);
        float _399 = -_320;
        float _401 = _399 + _397;
        float _403 = abs(_401);
        bool _405 = _403 >= _316;
        bool _407 = !_405;
        int _409 = _407 ? 0 : 1;
        _375 = _409;
        _349 = _401;
        _351 = _379;
        _353 = _383;
    }
    int _411 = _375;
    float _413 = _349;
    float _415 = _351;
    float _417 = _353;
    int _419 = _411;
    float _421 = _415;
    float _423 = _417;
    if (!_340)
    {
        float _425 = _212 + _254;
        float _427 = _220 + _256;
        float2 _2311 = float2(_425, _427);
        float3 _429 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2311, float2(0.0), isnan(_2311))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2311, float2(0.0), isnan(_2311))).xyz;
        float _431 = _429.x;
        float _433 = _429.y;
        float _435 = _429.z;
        float _437 = _433 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
        float _439 = fma(_431, (*spvDescriptorSet0.fp_c3)._m0[2].x, _437);
        float _441 = fma(_435, (*spvDescriptorSet0.fp_c3)._m0[2].z, _439);
        float _443 = -_320;
        float _445 = _443 + _441;
        float _447 = abs(_445);
        bool _449 = _447 >= _316;
        bool _451 = !_449;
        int _453 = _451 ? 0 : 1;
        _355 = _453;
        _357 = _425;
        _359 = _427;
        _361 = _445;
    }
    int _455 = _355;
    float _457 = _357;
    float _459 = _359;
    float _461 = _361;
    int _463 = _411 & 1;
    bool _465 = _463 != 0;
    float _467 = _457;
    float _469 = _459;
    float _471 = _461;
    if (_465)
    {
        _363 = _413;
    }
    float _473 = _363;
    float _475 = _473;
    if (!_465)
    {
        float _477 = -_212;
        float _479 = _477 + _415;
        float _481 = -_220;
        float _483 = _481 + _417;
        float2 _2388 = float2(_479, _483);
        float3 _485 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2388, float2(0.0), isnan(_2388))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2388, float2(0.0), isnan(_2388))).xyz;
        float _487 = _485.x;
        float _489 = _485.y;
        float _491 = _485.z;
        float _493 = _489 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
        float _495 = fma(_487, (*spvDescriptorSet0.fp_c3)._m0[2].x, _493);
        float _497 = fma(_491, (*spvDescriptorSet0.fp_c3)._m0[2].z, _495);
        float _499 = -_320;
        float _501 = _499 + _497;
        float _503 = abs(_501);
        bool _505 = _503 >= _316;
        bool _507 = !_505;
        int _509 = _507 ? 0 : 1;
        _419 = _509;
        _421 = _479;
        _423 = _483;
        _475 = _501;
    }
    int _511 = _419;
    float _513 = _421;
    float _515 = _423;
    float _517 = _475;
    int _519 = _455 & 1;
    bool _521 = _519 != 0;
    int _523 = _511;
    float _525 = _513;
    float _527 = _515;
    float _529 = _517;
    if (_521)
    {
        _365 = _455;
    }
    int _531 = _365;
    int _533 = _531;
    if (!_521)
    {
        float _535 = _212 + _457;
        float _537 = _220 + _459;
        float2 _2462 = float2(_535, _537);
        float3 _539 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2462, float2(0.0), isnan(_2462))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2462, float2(0.0), isnan(_2462))).xyz;
        float _541 = _539.x;
        float _543 = _539.y;
        float _545 = _539.z;
        float _547 = _543 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
        float _549 = fma(_541, (*spvDescriptorSet0.fp_c3)._m0[2].x, _547);
        float _551 = fma(_545, (*spvDescriptorSet0.fp_c3)._m0[2].z, _549);
        float _553 = -_320;
        float _555 = _553 + _551;
        float _557 = abs(_555);
        bool _559 = _557 >= _316;
        bool _561 = !_559;
        int _563 = _561 ? 0 : 1;
        _533 = _563;
        _467 = _535;
        _469 = _537;
        _471 = _555;
    }
    int _565 = _533;
    float _567 = _467;
    float _569 = _469;
    float _571 = _471;
    int _573 = _511 & 1;
    bool _575 = _573 != 0;
    int _577 = _565;
    float _579 = _567;
    float _581 = _569;
    float _583 = _571;
    if (!_575)
    {
        float _585 = -_212;
        float _587 = _585 + _513;
        float _589 = -_220;
        float _591 = _589 + _515;
        float2 _2534 = float2(_587, _591);
        float3 _593 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2534, float2(0.0), isnan(_2534))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2534, float2(0.0), isnan(_2534))).xyz;
        float _595 = _593.x;
        float _597 = _593.y;
        float _599 = _593.z;
        float _601 = _597 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
        float _603 = fma(_595, (*spvDescriptorSet0.fp_c3)._m0[2].x, _601);
        float _605 = fma(_599, (*spvDescriptorSet0.fp_c3)._m0[2].z, _603);
        float _607 = -_320;
        float _609 = _607 + _605;
        float _611 = abs(_609);
        bool _613 = _611 >= _316;
        bool _615 = !_613;
        int _617 = _615 ? 0 : 1;
        _523 = _617;
        _525 = _587;
        _527 = _591;
        _529 = _609;
    }
    int _619 = _523;
    float _621 = _525;
    float _623 = _527;
    float _625 = _529;
    int _627 = _565 & 1;
    bool _629 = _627 != 0;
    int _631 = _619;
    float _633 = _621;
    float _635 = _623;
    float _637 = _625;
    if (!_629)
    {
        float _639 = _212 + _567;
        float _641 = _220 + _569;
        float2 _2602 = float2(_639, _641);
        float3 _643 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2602, float2(0.0), isnan(_2602))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2602, float2(0.0), isnan(_2602))).xyz;
        float _645 = _643.x;
        float _647 = _643.y;
        float _649 = _643.z;
        float _651 = _647 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
        float _653 = fma(_645, (*spvDescriptorSet0.fp_c3)._m0[2].x, _651);
        float _655 = fma(_649, (*spvDescriptorSet0.fp_c3)._m0[2].z, _653);
        float _657 = -_320;
        float _659 = _657 + _655;
        float _661 = abs(_659);
        bool _663 = _661 >= _316;
        bool _665 = !_663;
        int _667 = _665 ? 0 : 1;
        _577 = _667;
        _579 = _639;
        _581 = _641;
        _583 = _659;
    }
    int _669 = _577;
    float _671 = _579;
    float _673 = _581;
    float _675 = _583;
    int _677 = _619 & 1;
    bool _679 = _677 != 0;
    int _681 = _669;
    float _683 = _671;
    float _685 = _673;
    float _687 = _675;
    if (!_679)
    {
        float _689 = -_212;
        float _691 = _689 + _621;
        float _693 = -_220;
        float _695 = _693 + _623;
        float2 _2674 = float2(_691, _695);
        float3 _697 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2674, float2(0.0), isnan(_2674))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2674, float2(0.0), isnan(_2674))).xyz;
        float _699 = _697.x;
        float _701 = _697.y;
        float _703 = _697.z;
        float _705 = _701 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
        float _707 = fma(_699, (*spvDescriptorSet0.fp_c3)._m0[2].x, _705);
        float _709 = fma(_703, (*spvDescriptorSet0.fp_c3)._m0[2].z, _707);
        float _711 = -_320;
        float _713 = _711 + _709;
        float _715 = abs(_713);
        bool _717 = _715 >= _316;
        bool _719 = !_717;
        int _721 = _719 ? 0 : 1;
        _631 = _721;
        _633 = _691;
        _635 = _695;
        _637 = _713;
    }
    int _723 = _631;
    float _725 = _633;
    float _727 = _635;
    float _729 = _637;
    int _731 = _669 & 1;
    bool _733 = _731 != 0;
    int _735 = _723;
    float _737 = _725;
    float _739 = _727;
    float _741 = _729;
    if (!_733)
    {
        float _743 = _212 + _671;
        float _745 = _220 + _673;
        float2 _2742 = float2(_743, _745);
        float3 _747 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2742, float2(0.0), isnan(_2742))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2742, float2(0.0), isnan(_2742))).xyz;
        float _749 = _747.x;
        float _751 = _747.y;
        float _753 = _747.z;
        float _755 = _751 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
        float _757 = fma(_749, (*spvDescriptorSet0.fp_c3)._m0[2].x, _755);
        float _759 = fma(_753, (*spvDescriptorSet0.fp_c3)._m0[2].z, _757);
        float _761 = -_320;
        float _763 = _761 + _759;
        float _765 = abs(_763);
        bool _767 = _765 >= _316;
        bool _769 = !_767;
        int _771 = _769 ? 0 : 1;
        _681 = _771;
        _683 = _743;
        _685 = _745;
        _687 = _763;
    }
    int _773 = _681;
    float _775 = _683;
    float _777 = _685;
    float _779 = _687;
    int _781 = _723 & 1;
    bool _783 = _781 != 0;
    int _785 = _773;
    float _787 = _775;
    float _789 = _777;
    float _791 = _779;
    if (!_783)
    {
        float _793 = -_212;
        float _795 = _793 + _725;
        float _797 = -_220;
        float _799 = _797 + _727;
        float2 _2814 = float2(_795, _799);
        float3 _801 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2814, float2(0.0), isnan(_2814))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2814, float2(0.0), isnan(_2814))).xyz;
        float _803 = _801.x;
        float _805 = _801.y;
        float _807 = _801.z;
        float _809 = _805 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
        float _811 = fma(_803, (*spvDescriptorSet0.fp_c3)._m0[2].x, _809);
        float _813 = fma(_807, (*spvDescriptorSet0.fp_c3)._m0[2].z, _811);
        float _815 = -_320;
        float _817 = _815 + _813;
        float _819 = abs(_817);
        bool _821 = _819 >= _316;
        bool _823 = !_821;
        int _825 = _823 ? 0 : 1;
        _735 = _825;
        _737 = _795;
        _739 = _799;
        _741 = _817;
    }
    int _827 = _735;
    float _829 = _737;
    float _831 = _739;
    float _833 = _741;
    int _835 = _773 & 1;
    bool _837 = _835 != 0;
    int _839 = _827;
    float _841 = _829;
    float _843 = _831;
    float _845 = _833;
    if (!_837)
    {
        float _847 = _212 + _775;
        float _849 = _220 + _777;
        float2 _2882 = float2(_847, _849);
        float3 _851 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2882, float2(0.0), isnan(_2882))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2882, float2(0.0), isnan(_2882))).xyz;
        float _853 = _851.x;
        float _855 = _851.y;
        float _857 = _851.z;
        float _859 = _855 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
        float _861 = fma(_853, (*spvDescriptorSet0.fp_c3)._m0[2].x, _859);
        float _863 = fma(_857, (*spvDescriptorSet0.fp_c3)._m0[2].z, _861);
        float _865 = -_320;
        float _867 = _865 + _863;
        float _869 = abs(_867);
        bool _871 = _869 >= _316;
        bool _873 = !_871;
        int _875 = _873 ? 0 : 1;
        _785 = _875;
        _787 = _847;
        _789 = _849;
        _791 = _867;
    }
    int _877 = _785;
    float _879 = _787;
    float _881 = _789;
    float _883 = _791;
    int _885 = _827 & 1;
    bool _887 = _885 != 0;
    int _889 = _877;
    float _891 = _879;
    float _893 = _881;
    float _895 = _883;
    if (!_887)
    {
        float _897 = fma(_212, -1.5, _829);
        float _899 = fma(_220, -1.5, _831);
        float2 _2951 = float2(_897, _899);
        float3 _901 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2951, float2(0.0), isnan(_2951))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2951, float2(0.0), isnan(_2951))).xyz;
        float _903 = _901.x;
        float _905 = _901.y;
        float _907 = _901.z;
        float _909 = _905 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
        float _911 = fma(_903, (*spvDescriptorSet0.fp_c3)._m0[2].x, _909);
        float _913 = fma(_907, (*spvDescriptorSet0.fp_c3)._m0[2].z, _911);
        float _915 = -_320;
        float _917 = _915 + _913;
        float _919 = abs(_917);
        bool _921 = _919 >= _316;
        bool _923 = !_921;
        int _925 = _923 ? 0 : 1;
        _839 = _925;
        _841 = _897;
        _843 = _899;
        _845 = _917;
    }
    int _927 = _839;
    float _929 = _841;
    float _931 = _843;
    float _933 = _845;
    int _935 = _877 & 1;
    bool _937 = _935 != 0;
    int _939 = _927;
    float _941 = _929;
    float _943 = _931;
    float _945 = _933;
    if (!_937)
    {
        float _947 = fma(_212, 1.5, _879);
        float _949 = fma(_220, 1.5, _881);
        float2 _3020 = float2(_947, _949);
        float3 _951 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3020, float2(0.0), isnan(_3020))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3020, float2(0.0), isnan(_3020))).xyz;
        float _953 = _951.x;
        float _955 = _951.y;
        float _957 = _951.z;
        float _959 = _955 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
        float _961 = fma(_953, (*spvDescriptorSet0.fp_c3)._m0[2].x, _959);
        float _963 = fma(_957, (*spvDescriptorSet0.fp_c3)._m0[2].z, _961);
        float _965 = -_320;
        float _967 = _965 + _963;
        float _969 = abs(_967);
        bool _971 = _969 >= _316;
        bool _973 = !_971;
        int _975 = _973 ? 0 : 1;
        _889 = _975;
        _891 = _947;
        _893 = _949;
        _895 = _967;
    }
    int _977 = _889;
    float _979 = _891;
    float _981 = _893;
    float _983 = _895;
    int _985 = _927 & 1;
    bool _987 = _985 != 0;
    int _989 = _977;
    float _991 = _979;
    float _993 = _981;
    float _995 = _983;
    if (!_987)
    {
        float _997 = fma(_212, -2.0, _929);
        float _999 = fma(_220, -2.0, _931);
        float2 _3088 = float2(_997, _999);
        float3 _1001 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3088, float2(0.0), isnan(_3088))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3088, float2(0.0), isnan(_3088))).xyz;
        float _1003 = _1001.x;
        float _1005 = _1001.y;
        float _1007 = _1001.z;
        float _1009 = _1005 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
        float _1011 = fma(_1003, (*spvDescriptorSet0.fp_c3)._m0[2].x, _1009);
        float _1013 = fma(_1007, (*spvDescriptorSet0.fp_c3)._m0[2].z, _1011);
        float _1015 = -_320;
        float _1017 = _1015 + _1013;
        float _1019 = abs(_1017);
        bool _1021 = _1019 >= _316;
        bool _1023 = !_1021;
        int _1025 = _1023 ? 0 : 1;
        _939 = _1025;
        _941 = _997;
        _943 = _999;
        _945 = _1017;
    }
    int _1027 = _939;
    float _1029 = _941;
    float _1031 = _943;
    float _1033 = _945;
    int _1035 = _977 & 1;
    bool _1037 = _1035 != 0;
    int _1039 = _1027;
    float _1041 = _1029;
    float _1043 = _1031;
    float _1045 = _1033;
    if (!_1037)
    {
        float _1047 = fma(_212, 2.0, _979);
        float _1049 = fma(_220, 2.0, _981);
        float2 _3156 = float2(_1047, _1049);
        float3 _1051 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3156, float2(0.0), isnan(_3156))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3156, float2(0.0), isnan(_3156))).xyz;
        float _1053 = _1051.x;
        float _1055 = _1051.y;
        float _1057 = _1051.z;
        float _1059 = _1055 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
        float _1061 = fma(_1053, (*spvDescriptorSet0.fp_c3)._m0[2].x, _1059);
        float _1063 = fma(_1057, (*spvDescriptorSet0.fp_c3)._m0[2].z, _1061);
        float _1065 = -_320;
        float _1067 = _1065 + _1063;
        float _1069 = abs(_1067);
        bool _1071 = _1069 >= _316;
        bool _1073 = !_1071;
        int _1075 = _1073 ? 0 : 1;
        _989 = _1075;
        _991 = _1047;
        _993 = _1049;
        _995 = _1067;
    }
    int _1077 = _989;
    float _1079 = _991;
    float _1081 = _993;
    float _1083 = _995;
    int _1085 = _1027 & 1;
    bool _1087 = _1085 != 0;
    int _1089 = _1077;
    float _1091 = _1079;
    float _1093 = _1081;
    float _1095 = _1083;
    if (!_1087)
    {
        float _1097 = fma(_212, -2.0, _1029);
        float _1099 = fma(_220, -2.0, _1031);
        float2 _3224 = float2(_1097, _1099);
        float3 _1101 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3224, float2(0.0), isnan(_3224))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3224, float2(0.0), isnan(_3224))).xyz;
        float _1103 = _1101.x;
        float _1105 = _1101.y;
        float _1107 = _1101.z;
        float _1109 = _1105 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
        float _1111 = fma(_1103, (*spvDescriptorSet0.fp_c3)._m0[2].x, _1109);
        float _1113 = fma(_1107, (*spvDescriptorSet0.fp_c3)._m0[2].z, _1111);
        float _1115 = -_320;
        float _1117 = _1115 + _1113;
        float _1119 = abs(_1117);
        bool _1121 = _1119 >= _316;
        bool _1123 = !_1121;
        int _1125 = _1123 ? 0 : 1;
        _1039 = _1125;
        _1041 = _1097;
        _1043 = _1099;
        _1045 = _1117;
    }
    int _1127 = _1039;
    float _1129 = _1041;
    float _1131 = _1043;
    float _1133 = _1045;
    int _1135 = _1077 & 1;
    bool _1137 = _1135 != 0;
    int _1139 = _1127;
    float _1141 = _1129;
    float _1143 = _1131;
    float _1145 = _1133;
    if (!_1137)
    {
        float _1147 = fma(_212, 2.0, _1079);
        float _1149 = fma(_220, 2.0, _1081);
        float2 _3292 = float2(_1147, _1149);
        float3 _1151 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3292, float2(0.0), isnan(_3292))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3292, float2(0.0), isnan(_3292))).xyz;
        float _1153 = _1151.x;
        float _1155 = _1151.y;
        float _1157 = _1151.z;
        float _1159 = _1155 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
        float _1161 = fma(_1153, (*spvDescriptorSet0.fp_c3)._m0[2].x, _1159);
        float _1163 = fma(_1157, (*spvDescriptorSet0.fp_c3)._m0[2].z, _1161);
        float _1165 = -_320;
        float _1167 = _1165 + _1163;
        float _1169 = abs(_1167);
        bool _1171 = _1169 >= _316;
        bool _1173 = !_1171;
        int _1175 = _1173 ? 0 : 1;
        _1089 = _1175;
        _1091 = _1147;
        _1093 = _1149;
        _1095 = _1167;
    }
    int _1177 = _1089;
    float _1179 = _1091;
    float _1181 = _1093;
    float _1183 = _1095;
    int _1185 = _1127 & 1;
    bool _1187 = _1185 != 0;
    int _1189 = _1177;
    float _1191 = _1179;
    float _1193 = _1181;
    float _1195 = _1183;
    if (!_1187)
    {
        float _1197 = fma(_212, -2.0, _1129);
        float _1199 = fma(_220, -2.0, _1131);
        float2 _3360 = float2(_1197, _1199);
        float3 _1201 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3360, float2(0.0), isnan(_3360))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3360, float2(0.0), isnan(_3360))).xyz;
        float _1203 = _1201.x;
        float _1205 = _1201.y;
        float _1207 = _1201.z;
        float _1209 = _1205 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
        float _1211 = fma(_1203, (*spvDescriptorSet0.fp_c3)._m0[2].x, _1209);
        float _1213 = fma(_1207, (*spvDescriptorSet0.fp_c3)._m0[2].z, _1211);
        float _1215 = -_320;
        float _1217 = _1215 + _1213;
        float _1219 = abs(_1217);
        bool _1221 = _1219 >= _316;
        bool _1223 = !_1221;
        int _1225 = _1223 ? 0 : 1;
        _1139 = _1225;
        _1141 = _1197;
        _1143 = _1199;
        _1145 = _1217;
    }
    int _1227 = _1139;
    float _1229 = _1141;
    float _1231 = _1143;
    float _1233 = _1145;
    int _1235 = _1177 & 1;
    bool _1237 = _1235 != 0;
    int _1239 = _1227;
    float _1241 = _1229;
    float _1243 = _1231;
    float _1245 = _1233;
    if (!_1237)
    {
        float _1247 = fma(_212, 2.0, _1179);
        float _1249 = fma(_220, 2.0, _1181);
        float2 _3428 = float2(_1247, _1249);
        float3 _1251 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3428, float2(0.0), isnan(_3428))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3428, float2(0.0), isnan(_3428))).xyz;
        float _1253 = _1251.x;
        float _1255 = _1251.y;
        float _1257 = _1251.z;
        float _1259 = _1255 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
        float _1261 = fma(_1253, (*spvDescriptorSet0.fp_c3)._m0[2].x, _1259);
        float _1263 = fma(_1257, (*spvDescriptorSet0.fp_c3)._m0[2].z, _1261);
        float _1265 = -_320;
        float _1267 = _1265 + _1263;
        float _1269 = abs(_1267);
        bool _1271 = _1269 >= _316;
        bool _1273 = !_1271;
        int _1275 = _1273 ? 0 : 1;
        _1189 = _1275;
        _1191 = _1247;
        _1193 = _1249;
        _1195 = _1267;
    }
    int _1277 = _1189;
    float _1279 = _1191;
    float _1281 = _1193;
    float _1283 = _1195;
    int _1285 = _1227 & 1;
    bool _1287 = _1285 != 0;
    int _1289 = _1277;
    float _1291 = _1279;
    float _1293 = _1281;
    float _1295 = _1283;
    if (!_1287)
    {
        float _1297 = fma(_212, -2.0, _1229);
        float _1299 = fma(_220, -2.0, _1231);
        float2 _3496 = float2(_1297, _1299);
        float3 _1301 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3496, float2(0.0), isnan(_3496))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3496, float2(0.0), isnan(_3496))).xyz;
        float _1303 = _1301.x;
        float _1305 = _1301.y;
        float _1307 = _1301.z;
        float _1309 = _1305 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
        float _1311 = fma(_1303, (*spvDescriptorSet0.fp_c3)._m0[2].x, _1309);
        float _1313 = fma(_1307, (*spvDescriptorSet0.fp_c3)._m0[2].z, _1311);
        float _1315 = -_320;
        float _1317 = _1315 + _1313;
        float _1319 = abs(_1317);
        bool _1321 = _1319 >= _316;
        bool _1323 = !_1321;
        int _1325 = _1323 ? 0 : 1;
        _1239 = _1325;
        _1241 = _1297;
        _1243 = _1299;
        _1245 = _1317;
    }
    int _1327 = _1239;
    float _1329 = _1241;
    float _1331 = _1243;
    float _1333 = _1245;
    int _1335 = _1277 & 1;
    bool _1337 = _1335 != 0;
    int _1339 = _1327;
    float _1341 = _1333;
    float _1343 = _1329;
    float _1345 = _1331;
    if (!_1337)
    {
        float _1347 = fma(_212, 2.0, _1279);
        float _1349 = fma(_220, 2.0, _1281);
        float2 _3564 = float2(_1347, _1349);
        float3 _1351 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3564, float2(0.0), isnan(_3564))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3564, float2(0.0), isnan(_3564))).xyz;
        float _1353 = _1351.x;
        float _1355 = _1351.y;
        float _1357 = _1351.z;
        float _1359 = _1355 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
        float _1361 = fma(_1353, (*spvDescriptorSet0.fp_c3)._m0[2].x, _1359);
        float _1363 = fma(_1357, (*spvDescriptorSet0.fp_c3)._m0[2].z, _1361);
        float _1365 = -_320;
        float _1367 = _1365 + _1363;
        float _1369 = abs(_1367);
        bool _1371 = _1369 >= _316;
        bool _1373 = !_1371;
        int _1375 = _1373 ? 0 : 1;
        _1289 = _1375;
        _1291 = _1347;
        _1293 = _1349;
        _1295 = _1367;
    }
    int _1377 = _1289;
    float _1379 = _1291;
    float _1381 = _1293;
    float _1383 = _1295;
    int _1385 = _1327 & 1;
    bool _1387 = _1385 != 0;
    int _1389 = _1377;
    float _1391 = _1383;
    float _1393 = _1379;
    float _1395 = _1381;
    if (!_1387)
    {
        float _1397 = fma(_212, -4.0, _1329);
        float _1399 = fma(_220, -4.0, _1331);
        float2 _3633 = float2(_1397, _1399);
        float3 _1401 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3633, float2(0.0), isnan(_3633))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3633, float2(0.0), isnan(_3633))).xyz;
        float _1403 = _1401.x;
        float _1405 = _1401.y;
        float _1407 = _1401.z;
        float _1409 = _1405 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
        float _1411 = fma(_1403, (*spvDescriptorSet0.fp_c3)._m0[2].x, _1409);
        float _1413 = fma(_1407, (*spvDescriptorSet0.fp_c3)._m0[2].z, _1411);
        float _1415 = -_320;
        float _1417 = _1415 + _1413;
        float _1419 = abs(_1417);
        bool _1421 = _1419 >= _316;
        bool _1423 = !_1421;
        int _1425 = _1423 ? 0 : 1;
        _1339 = _1425;
        _1341 = _1417;
        _1343 = _1397;
        _1345 = _1399;
    }
    int _1427 = _1339;
    float _1429 = _1341;
    float _1431 = _1343;
    float _1433 = _1345;
    int _1435 = _1377 & 1;
    bool _1437 = _1435 != 0;
    float _1439 = _1433;
    float _1441 = _1431;
    if (!_1437)
    {
        float _1443 = fma(_212, 4.0, _1379);
        float _1445 = fma(_220, 4.0, _1381);
        float2 _3700 = float2(_1443, _1445);
        float3 _1447 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3700, float2(0.0), isnan(_3700))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3700, float2(0.0), isnan(_3700))).xyz;
        float _1449 = _1447.x;
        float _1451 = _1447.y;
        float _1453 = _1447.z;
        float _1455 = _1451 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
        float _1457 = fma(_1449, (*spvDescriptorSet0.fp_c3)._m0[2].x, _1455);
        float _1459 = fma(_1453, (*spvDescriptorSet0.fp_c3)._m0[2].z, _1457);
        float _1461 = -_320;
        float _1463 = _1461 + _1459;
        float _1465 = abs(_1463);
        bool _1467 = _1465 >= _316;
        bool _1469 = !_1467;
        int _1471 = _1469 ? 0 : 1;
        _1389 = _1471;
        _1391 = _1463;
        _1393 = _1443;
        _1395 = _1445;
    }
    int _1473 = _1389;
    float _1475 = _1391;
    float _1477 = _1393;
    float _1479 = _1395;
    int _1481 = _1427 & 1;
    bool _1483 = _1481 != 0;
    int _1485 = _1483 ? (-1) : 0;
    float _1487 = _1479;
    float _1489 = _1477;
    if (_1483)
    {
        bool _1491 = _1429 >= 0.0;
        bool _1493 = isnan(_1429);
        bool _1495 = _1491 || _1493;
        bool _1497 = isnan(0.0);
        bool _1499 = _1495 || _1497;
        _367 = _1499 ? (-1) : 0;
    }
    int _1501 = _367;
    int _1503 = _1501;
    if (!_1483)
    {
        float _1505 = fma(_212, -8.0, _1431);
        float _1507 = fma(_220, -8.0, _1433);
        float2 _3787 = float2(_1505, _1507);
        float3 _1509 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3787, float2(0.0), isnan(_3787))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3787, float2(0.0), isnan(_3787))).xyz;
        float _1511 = _1509.x;
        float _1513 = _1509.y;
        float _1515 = _1509.z;
        float _1517 = _1513 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
        float _1519 = fma(_1511, (*spvDescriptorSet0.fp_c3)._m0[2].x, _1517);
        float _1521 = fma(_1515, (*spvDescriptorSet0.fp_c3)._m0[2].z, _1519);
        float _1523 = -_320;
        float _1525 = _1523 + _1521;
        bool _1527 = _1525 >= 0.0;
        bool _1529 = isnan(_1525);
        bool _1531 = _1527 || _1529;
        bool _1533 = isnan(0.0);
        bool _1535 = _1531 || _1533;
        _1439 = _1507;
        _1441 = _1505;
        _1503 = _1535 ? (-1) : 0;
    }
    float _1537 = _1439;
    float _1539 = _1441;
    int _1541 = _1503;
    int _1543 = _1473 & 1;
    bool _1545 = _1543 != 0;
    if (_1545)
    {
        bool _1547 = _1475 >= 0.0;
        bool _1549 = isnan(_1475);
        bool _1551 = _1547 || _1549;
        bool _1553 = isnan(0.0);
        bool _1555 = _1551 || _1553;
        _1485 = _1555 ? (-1) : 0;
    }
    int _1557 = _1485;
    int _1559 = _1557;
    if (!_1545)
    {
        float _1561 = fma(_212, 8.0, _1477);
        float _1563 = fma(_220, 8.0, _1479);
        float2 _3871 = float2(_1561, _1563);
        float3 _1565 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3871, float2(0.0), isnan(_3871))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3871, float2(0.0), isnan(_3871))).xyz;
        float _1567 = _1565.x;
        float _1569 = _1565.y;
        float _1571 = _1565.z;
        float _1573 = _1569 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
        float _1575 = fma(_1567, (*spvDescriptorSet0.fp_c3)._m0[2].x, _1573);
        float _1577 = fma(_1571, (*spvDescriptorSet0.fp_c3)._m0[2].z, _1575);
        float _1579 = -_320;
        float _1581 = _1579 + _1577;
        bool _1583 = _1581 >= 0.0;
        bool _1585 = isnan(_1581);
        bool _1587 = _1583 || _1585;
        bool _1589 = isnan(0.0);
        bool _1591 = _1587 || _1589;
        _1487 = _1563;
        _1489 = _1561;
        _1559 = _1591 ? (-1) : 0;
    }
    float _1593 = _1487;
    float _1595 = _1489;
    int _1597 = _1559;
    float _1599 = -_1537;
    float _1601 = _75 + _1599;
    float _1603 = -_75;
    float _1605 = _1603 + _1593;
    float _1607 = -_1539;
    float _1609 = _73 + _1607;
    float _1611 = -_73;
    float _1613 = _1611 + _1595;
    float _1615 = _204 * _1601;
    float _1617 = _204 * _1605;
    float _1619 = _306 * 0.75;
    float _1621 = fma(_192, _1609, _1615);
    float _1623 = fma(_192, _1613, _1617);
    float _1625 = _1621 + _1623;
    bool _1627 = _1621 < _1623;
    int _1629 = ~_1541;
    int _1631 = (_1627 ? (-1) : 0) & _1629;
    bool _1633 = _1621 >= _1623;
    bool _1635 = isnan(_1621);
    bool _1637 = _1633 || _1635;
    bool _1639 = isnan(_1623);
    bool _1641 = _1637 || _1639;
    int _1643 = ~_1597;
    int _1645 = (_1641 ? (-1) : 0) & _1643;
    float _1647 = precise::min(_1621, _1623);
    float _1649 = 1.0 / _1625;
    int _1651 = ~_1631;
    int _1653 = _1651 & _1645;
    int _1655 = ~_1645;
    int _1657 = _1631 & _1655;
    int _1659 = _1653 | _1657;
    int _1661 = _1631 & _1645;
    int _1663 = _1659 | _1661;
    bool _1665 = _93 < _320;
    int _1667 = (_1665 ? (-1) : 0) ^ _1663;
    float _1669 = -_1647;
    float _1671 = fma(_1669, _1649, 0.5);
    float _1673 = (_1667 != 0) ? _1671 : 0.0;
    float _1675 = precise::max(_1619, _1673);
    float _1677 = _238 * _1675;
    float _1679 = fma(_204, _1677, _73);
    float _1681 = fma(_192, _1677, _75);
    float2 _4045 = float2(_73, _75);
    float4 _1683 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_4045, float2(0.0), isnan(_4045))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_4045, float2(0.0), isnan(_4045))).xyzw;
    float _1685 = _1683.x;
    float _1687 = _1683.y;
    float _1689 = _1683.z;
    float _1691 = _1683.w;
    float2 _4061 = float2(_1679, _1681);
    float4 _1693 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_4061, float2(0.0), isnan(_4061))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_4061, float2(0.0), isnan(_4061))).xyzw;
    float _1695 = _1693.x;
    float _1697 = _1693.y;
    float _1699 = _1693.z;
    float _1701 = _1693.w;
    float _1703 = -_1695;
    float _1705 = _1685 + _1703;
    float _1707 = -_1699;
    float _1709 = _1689 + _1707;
    float _1711 = -_1697;
    float _1713 = _1687 + _1711;
    float _1715 = -_1701;
    float _1717 = _1691 + _1715;
    float _1719 = fma(_1705, (*spvDescriptorSet0.fp_c3)._m0[5].x, _1695);
    float _1721 = fma(_1709, (*spvDescriptorSet0.fp_c3)._m0[5].x, _1699);
    float _1723 = fma(_1713, (*spvDescriptorSet0.fp_c3)._m0[5].x, _1697);
    float _1725 = fma(_1717, (*spvDescriptorSet0.fp_c3)._m0[5].x, _1701);
    out.m_34.x = _1719;
    out.m_34.y = _1723;
    out.m_34.z = _1721;
    out.m_34.w = _1725;
    return out;
}

