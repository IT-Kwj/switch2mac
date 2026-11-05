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
    float4 m_63 [[color(0)]];
};

struct main0_in
{
    float4 m_50 [[user(locn0)]];
    float4 m_52 [[user(locn1)]];
    float4 m_48 [[user(locn2)]];
    float4 m_44 [[user(locn3)]];
    float4 m_67 [[user(locn4)]];
    float4 m_54 [[user(locn5)]];
    float4 m_46 [[user(locn6)]];
    float4 m_60 [[user(locn7)]];
    float4 m_56 [[user(locn8)]];
    float4 m_58 [[user(locn9)]];
    float4 m_69 [[user(locn10)]];
    float4 m_65 [[user(locn11)]];
    float4 m_71 [[user(locn12)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _78 = gl_FragCoord.w;
    float _80 = in.m_44.w;
    float _82 = gl_FragCoord.w;
    float _84 = _80 * _82;
    float _86 = in.m_44.y;
    float _88 = gl_FragCoord.w;
    float _90 = _86 * _88;
    float _92 = in.m_44.x;
    float _94 = gl_FragCoord.w;
    float _96 = _92 * _94;
    float _98 = in.m_46.x;
    float _100 = gl_FragCoord.w;
    float _102 = _98 * _100;
    float _104 = in.m_48.x;
    float _106 = gl_FragCoord.w;
    float _108 = _104 * _106;
    float _110 = in.m_48.y;
    float _112 = gl_FragCoord.w;
    float _114 = _110 * _112;
    float _116 = in.m_46.y;
    float _118 = gl_FragCoord.w;
    float _120 = _116 * _118;
    float _122 = 1.0 / _78;
    float _124 = _122 * _84;
    float _126 = _122 * _90;
    float _128 = _122 * _96;
    float _130 = _122 * _102;
    float _132 = _122 * _108;
    float _134 = _122 * _114;
    float _136 = 1.0 / _124;
    float _138 = _122 * _120;
    float _140 = _126 * _136;
    float _142 = _128 * _136;
    float2 _831 = float2(_142, _140);
    float _144 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_831, float2(0.0), isnan(_831))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_831, float2(0.0), isnan(_831))).x;
    float2 _842 = float2(_130, _138);
    float _146 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_842, float2(0.0), isnan(_842))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_842, float2(0.0), isnan(_842))).w;
    float2 _850 = float2(_132, _134);
    float2 _150 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_850, float2(0.0), isnan(_850))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_850, float2(0.0), isnan(_850))).xw;
    float _152 = _150.x;
    float _154 = _150.y;
    float _156 = in.m_44.z;
    float _158 = gl_FragCoord.w;
    float _160 = _156 * _158;
    float _162 = in.m_50.w;
    float _164 = gl_FragCoord.w;
    float _166 = _162 * _164;
    float _168 = in.m_52.w;
    float _170 = gl_FragCoord.w;
    float _172 = _168 * _170;
    float _174 = in.m_54.x;
    float _176 = gl_FragCoord.w;
    float _178 = _174 * _176;
    float _180 = _122 * _160;
    float _182 = _180 * _136;
    float _184 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _186 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _188 = fma(_182, (*spvDescriptorSet0.fp_c8)._m0[30].w, _186);
    float _190 = 1.0 / _188;
    float _192 = _122 * _178;
    float _194 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _196 = fma(_144, (*spvDescriptorSet0.fp_c8)._m0[30].w, _194);
    float _198 = _146 * _154;
    float _200 = _122 * _166;
    float _202 = 1.0 / _196;
    float _204 = -_198;
    float _206 = _154 + _204;
    float _208 = fma(_200, _206, _198);
    float _210 = _122 * _172;
    float _212 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _214 = _190 * _212;
    bool _218 = _208 >= _210;
    bool _220 = isnan(_208);
    bool _222 = _218 || _220;
    bool _224 = isnan(_210);
    bool _226 = _222 || _224;
    float _228 = float(_226);
    float _230 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _232 = -_214;
    float _234 = fma(_202, _230, _232);
    float _236 = 0.0 + _228;
    float _238 = precise::clamp(_236, 0.0, 1.0);
    float _240 = _234 * _184;
    float _242 = precise::clamp(_240, 0.0, 1.0);
    float _244 = _238 * _242;
    float _246 = _244 * _192;
    bool _248 = _246 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _250 = isnan(_246);
    bool _252 = _248 || _250;
    bool _254 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _256 = _252 || _254;
    float _258 = in.m_48.z;
    float _260 = gl_FragCoord.w;
    float _262 = _258 * _260;
    float _264 = in.m_48.w;
    float _266 = gl_FragCoord.w;
    float _268 = _264 * _266;
    float _270 = _122;
    if (!_256)
    {
        discard_fragment();
    }
    float _272 = _122 * _262;
    float _274 = _122 * _268;
    float2 _1031 = float2(_272, _274);
    float2 _276 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1031, float2(0.0), isnan(_1031))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1031, float2(0.0), isnan(_1031))).xy;
    float _278 = _276.x;
    float _280 = _276.y;
    float _282 = in.m_56.y;
    float _284 = gl_FragCoord.w;
    float _286 = _282 * _284;
    float _288 = in.m_56.x;
    float _290 = gl_FragCoord.w;
    float _292 = _288 * _290;
    float _294 = in.m_56.z;
    float _296 = gl_FragCoord.w;
    float _298 = _294 * _296;
    float _300 = in.m_58.y;
    float _302 = gl_FragCoord.w;
    float _304 = _300 * _302;
    float _306 = in.m_58.x;
    float _308 = gl_FragCoord.w;
    float _310 = _306 * _308;
    float _312 = in.m_60.y;
    float _314 = gl_FragCoord.w;
    float _316 = _312 * _314;
    float _318 = in.m_60.x;
    float _320 = gl_FragCoord.w;
    float _322 = _318 * _320;
    float _324 = in.m_60.z;
    float _326 = gl_FragCoord.w;
    float _328 = _324 * _326;
    float _330 = in.m_58.z;
    float _332 = gl_FragCoord.w;
    float _334 = _330 * _332;
    float _336 = _122 * _286;
    float _338 = _122 * _292;
    float _340 = _122 * _298;
    float _342 = _336 * _336;
    float _344 = _122 * _316;
    float _346 = _122 * _328;
    float _348 = fma(_338, _338, _342);
    float _350 = _122 * _310;
    float _352 = _122 * _334;
    float _354 = in.m_50.y;
    float _356 = gl_FragCoord.w;
    float _358 = _354 * _356;
    float _360 = fma(_340, _340, _348);
    float _362 = _122 * _304;
    float _364 = _344 * _344;
    float _366 = in.m_52.z;
    float _368 = gl_FragCoord.w;
    float _370 = _366 * _368;
    float _372 = rsqrt(_360);
    float _374 = _362 * _362;
    float _376 = in.m_50.z;
    float _378 = gl_FragCoord.w;
    float _380 = _376 * _378;
    float _382 = fma(_350, _350, _374);
    float _384 = _122 * _322;
    float _386 = in.m_50.x;
    float _388 = gl_FragCoord.w;
    float _390 = _386 * _388;
    float _392 = fma(_352, _352, _382);
    float _394 = fma(_384, _384, _364);
    float _396 = fma(_346, _346, _394);
    float _398 = rsqrt(_392);
    float _400 = _336 * _372;
    float _402 = _338 * _372;
    float _404 = _340 * _372;
    float _406 = _400 * _400;
    float _408 = rsqrt(_396);
    float _410 = fma(_402, _402, _406);
    float _412 = fma(_404, _404, _410);
    float _414 = rsqrt(_412);
    float _416 = _346 * _408;
    float _418 = _280 * _280;
    float _420 = _280 * _408;
    float _422 = _278 * _398;
    float _424 = fma(_278, _278, _418);
    float _426 = precise::clamp(_424, 0.0, 1.0);
    float _428 = _344 * _420;
    float _430 = _384 * _420;
    float _432 = -_426;
    float _434 = _432 + 1.0;
    float _436 = fma(_362, _422, _428);
    float _438 = _280 * _416;
    float _440 = fma(_350, _422, _430);
    float _442 = _122 * _370;
    float _444 = _122 * _380;
    float _446 = sqrt(_434);
    float _448 = fma(_352, _422, _438);
    float _450 = in.m_52.x;
    float _452 = gl_FragCoord.w;
    float _454 = _450 * _452;
    float _456 = -_442;
    float _458 = _456 + _444;
    float _460 = _414 * _446;
    float _462 = fma(_400, _460, _436);
    float _464 = fma(_402, _460, _440);
    float _466 = fma(_404, _460, _448);
    float _468 = _462 * _462;
    float _470 = in.m_52.y;
    float _472 = gl_FragCoord.w;
    float _474 = _470 * _472;
    float _476 = fma(_464, _464, _468);
    float _478 = fma(_466, _466, _476);
    float _480 = rsqrt(_478);
    float _482 = (*spvDescriptorSet0.fp_c8)._m0[28].y * (*spvDescriptorSet0.fp_c8)._m0[28].y;
    float _484 = fma((*spvDescriptorSet0.fp_c8)._m0[28].x, (*spvDescriptorSet0.fp_c8)._m0[28].x, _482);
    float _486 = _122 * _454;
    float _488 = _462 * _480;
    float _490 = _466 * _480;
    float _492 = _122 * _474;
    float _494 = _488 * (-0.816474258899688720703125);
    float _496 = _122 * _358;
    float _498 = -_494;
    float _500 = fma(_490, 0.577381789684295654296875, _498);
    float _502 = _122 * _390;
    float _504 = -_492;
    float _506 = _504 + _496;
    float _508 = fma(_500, 0.5, 0.5);
    float _510 = -_486;
    float _512 = _510 + _502;
    float _514 = _508 * _508;
    float _516 = fma((*spvDescriptorSet0.fp_c8)._m0[28].z, (*spvDescriptorSet0.fp_c8)._m0[28].z, _484);
    float _518 = fma(_514, _512, _486);
    float _520 = fma(_514, _506, _492);
    float _522 = fma(_514, _458, _442);
    float _524 = rsqrt(_516);
    if (!_256)
    {
        out.m_63.x = _518;
        out.m_63.y = _520;
        out.m_63.z = _522;
        out.m_63.w = _228;
        return out;
    }
    float _526 = in.m_65.x;
    float _528 = gl_FragCoord.w;
    float _530 = _526 * _528;
    float _532 = _524 * (*spvDescriptorSet0.fp_c8)._m0[28].y;
    float _534 = _464 * _480;
    float _536 = _524 * (*spvDescriptorSet0.fp_c8)._m0[28].x;
    float _538 = _524 * (*spvDescriptorSet0.fp_c8)._m0[28].z;
    float _540 = _488 * _532;
    float _542 = abs(_402);
    float _544 = abs(_400);
    float _546 = precise::max(_542, _544);
    float _548 = -_514;
    float _550 = _548 + 1.0;
    float _552 = fma(_534, _536, _540);
    float _554 = fma(_490, _538, _552);
    float _556 = abs(_404);
    float _558 = precise::max(_556, _546);
    float _560 = -_550;
    float _562 = fma(_560, (*spvDescriptorSet0.fp_c9)._m0[191].y, 1.0);
    float _564 = -_152;
    float _566 = _564 + 1.0;
    float _568 = fma(_554, -0.5, 0.5);
    float _570 = 1.0 / _558;
    float _572 = fma(_568, (*spvDescriptorSet0.fp_c9)._m0[191].z, _562);
    float _574 = precise::clamp(_572, 0.0, 1.0);
    float _576 = -_574;
    float _578 = _576 + 1.0;
    float _580 = fma(_566, (*spvDescriptorSet0.fp_c9)._m0[191].x, _578);
    float _582 = precise::clamp(_580, 0.0, 1.0);
    float _584 = _122 * _530;
    float _586 = _402 * _570;
    float _588 = _400 * _570;
    float _590 = _582 + _584;
    float _592 = -_570;
    float _594 = _404 * _592;
    float _596 = precise::min(_590, 1.0);
    float3 _1511 = float3(_586, _588, _594);
    float3 _600 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1511, float3(0.0), isnan(_1511)), level(_596)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1511, float3(0.0), isnan(_1511)), level(_596)).xyz;
    float _602 = _600.x;
    float _604 = _600.y;
    float _606 = _600.z;
    float _608 = in.m_67.x;
    float _610 = gl_FragCoord.w;
    float _612 = _608 * _610;
    float _614 = in.m_67.z;
    float _616 = gl_FragCoord.w;
    float _618 = _614 * _616;
    float _620 = in.m_67.y;
    float _622 = gl_FragCoord.w;
    float _624 = _620 * _622;
    float _626 = in.m_69.x;
    float _628 = gl_FragCoord.w;
    float _630 = _626 * _628;
    float _632 = in.m_69.y;
    float _634 = gl_FragCoord.w;
    float _636 = _632 * _634;
    float _638 = in.m_69.z;
    float _640 = gl_FragCoord.w;
    float _642 = _638 * _640;
    float _644 = in.m_71.x;
    float _646 = gl_FragCoord.w;
    float _648 = _644 * _646;
    float _650 = in.m_71.y;
    float _652 = gl_FragCoord.w;
    float _654 = _650 * _652;
    float _656 = in.m_71.z;
    float _658 = gl_FragCoord.w;
    float _660 = _656 * _658;
    float _662 = in.m_71.w;
    float _664 = gl_FragCoord.w;
    float _666 = _662 * _664;
    bool _668 = 0.5 <= (*spvDescriptorSet0.fp_c15)._m0[653].w;
    float _670 = _122 * _612;
    float _672 = _122 * _624;
    float _674 = _122 * _630;
    float _676 = _122 * _636;
    float _678 = _122 * _642;
    float _680 = _122 * _654;
    float _682 = _122 * _660;
    float _684 = _122 * _666;
    float _686 = fma(_602, 0.20999999344348907470703125, _670);
    float _688 = _122 * _618;
    float _690 = _122 * _648;
    float _692 = fma(_604, 0.20999999344348907470703125, _672);
    if (_668)
    {
        float _694 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _696 = _214 + _694;
        _270 = _696;
    }
    float _698 = _270;
    float _700 = fma(_606, 0.20999999344348907470703125, _688);
    float _702 = _686 + _674;
    float _704 = _692 + _676;
    float _706 = _698;
    if (_668)
    {
        float _708 = _698 * 8.0;
        float _710 = precise::clamp(_708, 0.0, 1.0);
        _706 = _710;
    }
    float _712 = _706;
    float _714 = _700 + _678;
    float _716 = 0.0 + _246;
    float _718 = precise::clamp(_716, 0.0, 1.0);
    float _720 = _518 * _702;
    float _722 = _520 * _704;
    float _724 = _522 * _714;
    float _726 = _718;
    if (_668)
    {
        float _728 = _718 * _712;
        _726 = _728;
    }
    float _730 = _726;
    float _732 = fma(_720, _684, _690);
    float _734 = fma(_722, _684, _680);
    float _736 = fma(_724, _684, _682);
    float _738 = 0.0 + _730;
    float _740 = precise::clamp(_738, 0.0, 1.0);
    out.m_63.x = _732;
    out.m_63.y = _734;
    out.m_63.z = _736;
    out.m_63.w = _740;
    return out;
}

