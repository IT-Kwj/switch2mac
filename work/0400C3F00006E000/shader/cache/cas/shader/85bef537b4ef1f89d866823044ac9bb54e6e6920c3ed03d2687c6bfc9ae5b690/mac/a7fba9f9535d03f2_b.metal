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
    constant _16* fp_c3 [[id(1)]];
    texture2d<float> fp_t_tcb_8 [[id(2)]];
    sampler fp_t_tcb_8Smplr [[id(3)]];
    texture2d<float> fp_t_tcb_C [[id(4)]];
    sampler fp_t_tcb_CSmplr [[id(5)]];
    texture2d<float> fp_t_tcb_A [[id(6)]];
    sampler fp_t_tcb_ASmplr [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    sampler fp_t_tcb_CSmplr_w [[id(9)]];
    sampler fp_t_tcb_ASmplr_w [[id(10)]];
    constant dm_border_t* dm_border [[id(11)]];
};

struct main0_out
{
    float4 m_36 [[color(0)]];
};

struct main0_in
{
    float4 m_33 [[user(locn0)]];
    float4 m_38 [[user(locn1)]];
};

static inline __attribute__((always_inline))
int _44(thread const int& _1723, thread const int& _1724, constant _10& support_buffer)
{
    int _1727 = 1 + _1724;
    float _1729 = support_buffer._m5[_1727].x;
    float _1731 = abs(_1729);
    bool _1733 = _1731 == 1.0;
    if (_1733)
    {
        return _1723;
    }
    float _1735 = float(_1723);
    float _1737 = _1735 / _1731;
    int _1739 = int(_1737);
    return _1739;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _48 = gl_FragCoord.w;
    float _50 = in.m_33.x;
    float _52 = gl_FragCoord.w;
    float _54 = _50 * _52;
    float _56 = in.m_33.y;
    float _58 = gl_FragCoord.w;
    float _60 = _56 * _58;
    float _62 = 1.0 / _48;
    float _64 = _62 * _54;
    float _66 = _62 * _60;
    float2 _758 = float2(_64, _66);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_758, float2(0.0), isnan(_758))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_758, float2(0.0), isnan(_758))).x;
    float _70 = -_68;
    float _72 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _74 = 1.0 / _72;
    bool _78 = _74 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    if (_78)
    {
        discard_fragment();
    }
    float2 _790 = float2(_64, _66);
    float _80 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_790, float2(0.0), isnan(_790))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_790, float2(0.0), isnan(_790))).x;
    if (_78)
    {
        out.m_36.x = 0.0;
        out.m_36.y = 0.0;
        out.m_36.z = 0.0;
        out.m_36.w = 0.0;
        return out;
    }
    float _82 = in.m_38.z;
    float _84 = gl_FragCoord.w;
    float _86 = _82 * _84;
    float _88 = in.m_38.x;
    float _90 = gl_FragCoord.w;
    float _92 = _88 * _90;
    float _94 = in.m_38.y;
    float _96 = gl_FragCoord.w;
    float _98 = _94 * _96;
    float _100 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _102 = precise::clamp(_100, 0.0, 1.0);
    float _104 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _106 = precise::clamp(_104, 0.0, 1.0);
    float _108 = precise::max(_80, _102);
    float _110 = _62 * _86;
    float _112 = _62 * _98;
    float _114 = precise::max(_108, _110);
    float _116 = _62 * _92;
    bool _118 = _114 != 0.0;
    bool _120 = isnan(_114);
    bool _122 = _118 || _120;
    bool _124 = isnan(0.0);
    bool _126 = _122 || _124;
    float _128 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _130 = precise::clamp(_128, 0.0, 1.0);
    float _132 = precise::min(_130, _106);
    bool _134 = !_126;
    if (!_134)
    {
        float _136 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _138 = fma(_114, _136, 1.0);
        float _140 = log2(_138);
        float _142 = _140 + (-1.0);
        float _144 = trunc(_142);
        int _146 = int(_144);
        float _148 = float(_146);
        float _150 = trunc(_148);
        int _152 = int(_150);
        float _154 = _148 + 1.0;
        float _156 = trunc(_154);
        int _158 = int(_156);
        int _160 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_152), spvDescriptorSet0.fp_t_tcb_A.get_height(_152)).x;
        int _162 = _160;
        int _164 = 2;
        int _166 = _44(_162, _164, (*spvDescriptorSet0.support_buffer));
        int _168 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_152), spvDescriptorSet0.fp_t_tcb_A.get_height(_152)).y;
        int _170 = _168;
        int _172 = 2;
        int _174 = _44(_170, _172, (*spvDescriptorSet0.support_buffer));
        int _176 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_158), spvDescriptorSet0.fp_t_tcb_A.get_height(_158)).x;
        int _178 = _176;
        int _180 = 2;
        int _182 = _44(_178, _180, (*spvDescriptorSet0.support_buffer));
        int _184 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_158), spvDescriptorSet0.fp_t_tcb_A.get_height(_158)).y;
        int _186 = _184;
        int _188 = 2;
        int _190 = _44(_186, _188, (*spvDescriptorSet0.support_buffer));
        float _192 = float(_166);
        float _194 = float(_174);
        float _196 = 1.0 / _192;
        float _198 = fma(_64, _192, -0.5);
        float _200 = fma(_66, _194, -0.5);
        float _202 = floor(_198);
        float _204 = float(_182);
        float _206 = fma(_64, _204, -0.5);
        float _208 = floor(_200);
        float _210 = -_202;
        float _212 = _198 + _210;
        float _214 = floor(_206);
        float _216 = _202 + 1.5;
        float _218 = _202 + (-0.5);
        float _220 = -_212;
        float _222 = _220 + 1.0;
        float _224 = -_212;
        float _226 = _224 + 2.0;
        float _228 = _222 * _222;
        float _230 = _226 * _226;
        float _232 = -_208;
        float _234 = _200 + _232;
        float _236 = 1.0 / _194;
        float _238 = _222 * _228;
        float _240 = float(_190);
        float _242 = -_234;
        float _244 = _242 + 1.0;
        float _246 = _234 * _234;
        float _248 = _238 * 4.0;
        float _250 = fma(_66, _240, -0.5);
        float _252 = -_238;
        float _254 = _252 + 6.0;
        float _256 = -_248;
        float _258 = fma(_226, _230, _256);
        float _260 = _244 * _244;
        float _262 = floor(_250);
        float _264 = -_234;
        float _266 = _264 + 2.0;
        float _268 = -_258;
        float _270 = _268 + _254;
        float _272 = _238 + _258;
        float _274 = _258 * 0.16666667163372039794921875;
        float _276 = _266 * _266;
        float _278 = _270 * 0.16666667163372039794921875;
        float _280 = _244 * _260;
        float _282 = _212 * _212;
        float _284 = -_214;
        float _286 = _206 + _284;
        float _288 = 1.0 / _278;
        float _290 = _280 * 4.0;
        float _292 = _212 * _282;
        float _294 = -_286;
        float _296 = _294 + 1.0;
        float _298 = _272 * 0.16666667163372039794921875;
        float _300 = -_290;
        float _302 = fma(_266, _276, _300);
        float _304 = _292 * 0.16666667163372039794921875;
        float _306 = -_262;
        float _308 = _250 + _306;
        float _310 = -_280;
        float _312 = _310 + 6.0;
        float _314 = _296 * _296;
        float _316 = 1.0 / _204;
        float _318 = _280 + _302;
        float _320 = -_302;
        float _322 = _320 + _312;
        float _324 = _296 * _314;
        float _326 = -_308;
        float _328 = _326 + 2.0;
        float _330 = _318 * 0.16666667163372039794921875;
        float _332 = fma(_304, _288, _216);
        float _334 = -_308;
        float _336 = _334 + 1.0;
        float _338 = _324 * 4.0;
        float _340 = -_286;
        float _342 = _340 + 2.0;
        float _344 = 1.0 / _298;
        float _346 = _336 * _336;
        float _348 = _322 * 0.16666667163372039794921875;
        float _350 = _342 * _342;
        float _352 = _234 * _246;
        float _354 = _336 * _346;
        float _356 = -_338;
        float _358 = fma(_342, _350, _356);
        float _360 = -_324;
        float _362 = _360 + 6.0;
        float _364 = 1.0 / _348;
        float _366 = _328 * _328;
        float _368 = _354 * 4.0;
        float _370 = _324 + _358;
        float _372 = _352 * 0.16666667163372039794921875;
        float _374 = -_368;
        float _376 = fma(_328, _366, _374);
        float _378 = -_354;
        float _380 = _378 + 6.0;
        float _382 = _370 * 0.16666667163372039794921875;
        float _384 = -_358;
        float _386 = _384 + _362;
        float _388 = _354 + _376;
        float _390 = 1.0 / _330;
        float _392 = -_376;
        float _394 = _392 + _380;
        float _396 = _386 * 0.16666667163372039794921875;
        float _398 = fma(_274, _344, _218);
        float _400 = _208 + (-0.5);
        float _402 = _208 + 1.5;
        float _404 = _394 * 0.16666667163372039794921875;
        float _406 = _388 * 0.16666667163372039794921875;
        float _408 = 1.0 / _396;
        float _410 = fma(_372, _364, _402);
        float _412 = _302 * 0.16666667163372039794921875;
        float _414 = _286 * _286;
        float _416 = _398 * _196;
        float _418 = _332 * _196;
        float _420 = _214 + 1.5;
        float _422 = _286 * _414;
        float _424 = 1.0 / _382;
        float _426 = fma(_412, _390, _400);
        float _428 = _308 * _308;
        float _430 = _262 + 1.5;
        float _432 = _358 * 0.16666667163372039794921875;
        float _434 = _426 * _236;
        float _436 = _308 * _428;
        float _438 = _214 + (-0.5);
        float _440 = 1.0 / _406;
        float _442 = _262 + (-0.5);
        float _444 = _422 * 0.16666667163372039794921875;
        float _446 = _376 * 0.16666667163372039794921875;
        float _448 = _436 * 0.16666667163372039794921875;
        float _450 = _410 * _236;
        float _452 = fma(_444, _408, _420);
        float _454 = 1.0 / _404;
        float _456 = fma(_432, _424, _438);
        float _458 = _452 * _316;
        float _460 = 1.0 / _240;
        float _462 = fma(_446, _440, _442);
        float _464 = fma(_448, _454, _430);
        float _466 = _456 * _316;
        float _468 = _462 * _460;
        float _470 = _464 * _460;
        float2 _1297 = float2(_416, _434);
        float3 _474 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1297, float2(0.0), isnan(_1297)), level(_148)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1297, float2(0.0), isnan(_1297)), level(_148)).xyz;
        float _476 = _474.x;
        float _478 = _474.y;
        float _480 = _474.z;
        float2 _1312 = float2(_418, _434);
        float3 _482 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1312, float2(0.0), isnan(_1312)), level(_148)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1312, float2(0.0), isnan(_1312)), level(_148)).xyz;
        float _484 = _482.x;
        float _486 = _482.y;
        float _488 = _482.z;
        float2 _1327 = float2(_416, _450);
        float3 _490 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1327, float2(0.0), isnan(_1327)), level(_148)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1327, float2(0.0), isnan(_1327)), level(_148)).xyz;
        float _492 = _490.x;
        float _494 = _490.y;
        float _496 = _490.z;
        float2 _1342 = float2(_418, _450);
        float3 _498 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1342, float2(0.0), isnan(_1342)), level(_148)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1342, float2(0.0), isnan(_1342)), level(_148)).xyz;
        float _500 = _498.x;
        float _502 = _498.y;
        float _504 = _498.z;
        float2 _1357 = float2(_466, _468);
        float3 _506 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1357, float2(0.0), isnan(_1357)), level(_154)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1357, float2(0.0), isnan(_1357)), level(_154)).xyz;
        float _508 = _506.x;
        float _510 = _506.y;
        float _512 = _506.z;
        float2 _1372 = float2(_458, _468);
        float3 _514 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1372, float2(0.0), isnan(_1372)), level(_154)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1372, float2(0.0), isnan(_1372)), level(_154)).xyz;
        float _516 = _514.x;
        float _518 = _514.y;
        float _520 = _514.z;
        float2 _1387 = float2(_466, _470);
        float3 _522 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1387, float2(0.0), isnan(_1387)), level(_154)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1387, float2(0.0), isnan(_1387)), level(_154)).xyz;
        float _524 = _522.x;
        float _526 = _522.y;
        float _528 = _522.z;
        float2 _1402 = float2(_458, _470);
        float3 _530 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1402, float2(0.0), isnan(_1402)), level(_154)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1402, float2(0.0), isnan(_1402)), level(_154)).xyz;
        float _532 = _530.x;
        float _534 = _530.y;
        float _536 = _530.z;
        float _538 = -_148;
        float _540 = _142 + _538;
        float _542 = precise::clamp(_540, 0.0, 1.0);
        float _544 = -_484;
        float _546 = _476 + _544;
        float _548 = -_486;
        float _550 = _478 + _548;
        float _552 = -_500;
        float _554 = _492 + _552;
        float _556 = -_504;
        float _558 = _496 + _556;
        float _560 = fma(_298, _546, _484);
        float _562 = -_488;
        float _564 = _480 + _562;
        float _566 = -_502;
        float _568 = _494 + _566;
        float _570 = fma(_298, _550, _486);
        float _572 = fma(_298, _554, _500);
        float _574 = -_516;
        float _576 = _508 + _574;
        float _578 = -_518;
        float _580 = _510 + _578;
        float _582 = -_520;
        float _584 = _512 + _582;
        float _586 = -_532;
        float _588 = _524 + _586;
        float _590 = fma(_382, _576, _516);
        float _592 = fma(_382, _580, _518);
        float _594 = -_534;
        float _596 = _526 + _594;
        float _598 = -_536;
        float _600 = _528 + _598;
        float _602 = fma(_298, _564, _488);
        float _604 = fma(_298, _568, _502);
        float _606 = fma(_298, _558, _504);
        float _608 = fma(_382, _588, _532);
        float _610 = fma(_382, _596, _534);
        float _612 = fma(_382, _584, _520);
        float _614 = fma(_382, _600, _536);
        float _616 = -_572;
        float _618 = _616 + _560;
        float _620 = -_604;
        float _622 = _620 + _570;
        float _624 = -_608;
        float _626 = _624 + _590;
        float _628 = -_610;
        float _630 = _628 + _592;
        float _632 = -_606;
        float _634 = _632 + _602;
        float _636 = -_614;
        float _638 = _636 + _612;
        float _640 = fma(_330, _618, _572);
        float _642 = fma(_330, _622, _604);
        float _644 = fma(_406, _626, _608);
        float _646 = fma(_406, _630, _610);
        float _648 = fma(_330, _634, _606);
        float _650 = fma(_406, _638, _614);
        float _652 = -_640;
        float _654 = _652 + _644;
        float _656 = -_642;
        float _658 = _656 + _646;
        float _660 = 0.0 + _140;
        float _662 = precise::clamp(_660, 0.0, 1.0);
        float _664 = -_648;
        float _666 = _664 + _650;
        float _668 = fma(_542, _654, _640);
        float _670 = fma(_542, _658, _642);
        float _672 = fma(_542, _666, _648);
        float _674 = -_668;
        float _676 = fma(_668, (*spvDescriptorSet0.fp_c3)._m0[13].x, _674);
        float _678 = fma(_112, _662, _116);
        float _680 = -_670;
        float _682 = fma(_670, (*spvDescriptorSet0.fp_c3)._m0[13].y, _680);
        float _684 = -_672;
        float _686 = fma(_672, (*spvDescriptorSet0.fp_c3)._m0[13].z, _684);
        float _688 = fma(_132, _676, _668);
        float _690 = 1.0 / _678;
        float _692 = fma(_132, _682, _670);
        float _694 = fma(_132, _686, _672);
        float _696 = _662 * _688;
        float _698 = _662 * _692;
        float _700 = _662 * _694;
        float _702 = -_696;
        float _704 = _702 + (*spvDescriptorSet0.fp_c3)._m0[12].x;
        float _706 = -_698;
        float _708 = _706 + (*spvDescriptorSet0.fp_c3)._m0[12].y;
        float _710 = -_700;
        float _712 = _710 + (*spvDescriptorSet0.fp_c3)._m0[12].z;
        float _714 = fma(_116, _704, _696);
        float _716 = fma(_116, _708, _698);
        float _718 = fma(_116, _712, _700);
        float _720 = _714 * _690;
        float _722 = _716 * _690;
        float _724 = _718 * _690;
        out.m_36.x = _720;
        out.m_36.y = _722;
        out.m_36.z = _724;
        out.m_36.w = _678;
        return out;
    }
    out.m_36.x = (*spvDescriptorSet0.fp_c3)._m0[12].x;
    out.m_36.y = (*spvDescriptorSet0.fp_c3)._m0[12].y;
    out.m_36.z = (*spvDescriptorSet0.fp_c3)._m0[12].z;
    out.m_36.w = _116;
    return out;
}

