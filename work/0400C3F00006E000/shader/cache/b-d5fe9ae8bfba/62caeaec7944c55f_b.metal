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
    texture2d<float> fp_t_tcb_A [[id(4)]];
    sampler fp_t_tcb_ASmplr [[id(5)]];
    sampler fp_t_tcb_8Smplr_w [[id(6)]];
    sampler fp_t_tcb_ASmplr_w [[id(7)]];
    constant dm_border_t* dm_border [[id(8)]];
};

struct main0_out
{
    float4 m_34 [[color(0)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0)]];
    float4 m_36 [[user(locn1)]];
};

static inline __attribute__((always_inline))
int _42(thread const int& _1668, thread const int& _1669, constant _10& support_buffer)
{
    int _1672 = 1 + _1669;
    float _1674 = support_buffer._m5[_1672].x;
    float _1676 = abs(_1674);
    bool _1678 = _1676 == 1.0;
    if (_1678)
    {
        return _1668;
    }
    float _1680 = float(_1668);
    float _1682 = _1680 / _1676;
    int _1684 = int(_1682);
    return _1684;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _46 = gl_FragCoord.w;
    float _48 = in.m_31.x;
    float _50 = gl_FragCoord.w;
    float _52 = _48 * _50;
    float _54 = in.m_31.y;
    float _56 = gl_FragCoord.w;
    float _58 = _54 * _56;
    float _60 = 1.0 / _46;
    float _62 = _60 * _52;
    float _64 = _60 * _58;
    float2 _740 = float2(_62, _64);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_740, float2(0.0), isnan(_740))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_740, float2(0.0), isnan(_740))).x;
    float _68 = -_66;
    float _70 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _72 = 1.0 / _70;
    bool _76 = _72 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    if (_76)
    {
        discard_fragment();
    }
    if (_76)
    {
        out.m_34.x = 0.0;
        out.m_34.y = 0.0;
        out.m_34.z = 0.0;
        out.m_34.w = 0.0;
        return out;
    }
    float _78 = in.m_36.z;
    float _80 = gl_FragCoord.w;
    float _82 = _78 * _80;
    float _84 = in.m_36.x;
    float _86 = gl_FragCoord.w;
    float _88 = _84 * _86;
    float _90 = in.m_36.y;
    float _92 = gl_FragCoord.w;
    float _94 = _90 * _92;
    float _96 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _98 = precise::clamp(_96, 0.0, 1.0);
    float _100 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[4].y, (*spvDescriptorSet0.fp_c3)._m0[5].y);
    float _102 = precise::clamp(_100, 0.0, 1.0);
    float _104 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _106 = precise::clamp(_104, 0.0, 1.0);
    float _108 = precise::max(_98, _102);
    float _110 = _60 * _82;
    float _112 = _60 * _94;
    float _114 = precise::max(_108, _110);
    bool _116 = _114 != 0.0;
    bool _118 = isnan(_114);
    bool _120 = _116 || _118;
    bool _122 = isnan(0.0);
    bool _124 = _120 || _122;
    float _126 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _128 = precise::clamp(_126, 0.0, 1.0);
    float _130 = _60 * _88;
    float _132 = precise::min(_106, _128);
    bool _134 = !_124;
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
        int _164 = 1;
        int _166 = _42(_162, _164, (*spvDescriptorSet0.support_buffer));
        int _168 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_152), spvDescriptorSet0.fp_t_tcb_A.get_height(_152)).y;
        int _170 = _168;
        int _172 = 1;
        int _174 = _42(_170, _172, (*spvDescriptorSet0.support_buffer));
        int _176 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_158), spvDescriptorSet0.fp_t_tcb_A.get_height(_158)).x;
        int _178 = _176;
        int _180 = 1;
        int _182 = _42(_178, _180, (*spvDescriptorSet0.support_buffer));
        int _184 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_158), spvDescriptorSet0.fp_t_tcb_A.get_height(_158)).y;
        int _186 = _184;
        int _188 = 1;
        int _190 = _42(_186, _188, (*spvDescriptorSet0.support_buffer));
        float _192 = float(_166);
        float _194 = float(_174);
        float _196 = 1.0 / _192;
        float _198 = fma(_62, _192, -0.5);
        float _200 = fma(_64, _194, -0.5);
        float _202 = floor(_198);
        float _204 = float(_182);
        float _206 = float(_190);
        float _208 = fma(_62, _204, -0.5);
        float _210 = floor(_200);
        float _212 = -_202;
        float _214 = _198 + _212;
        float _216 = floor(_208);
        float _218 = _202 + (-0.5);
        float _220 = -_214;
        float _222 = _220 + 1.0;
        float _224 = -_214;
        float _226 = _224 + 2.0;
        float _228 = _222 * _222;
        float _230 = _226 * _226;
        float _232 = -_210;
        float _234 = _200 + _232;
        float _236 = 1.0 / _194;
        float _238 = _222 * _228;
        float _240 = _238 * 4.0;
        float _242 = -_240;
        float _244 = fma(_226, _230, _242);
        float _246 = fma(_64, _206, -0.5);
        float _248 = -_238;
        float _250 = _248 + 6.0;
        float _252 = -_234;
        float _254 = _252 + 1.0;
        float _256 = -_234;
        float _258 = _256 + 2.0;
        float _260 = floor(_246);
        float _262 = -_244;
        float _264 = _262 + _250;
        float _266 = _254 * _254;
        float _268 = _258 * _258;
        float _270 = _264 * 0.16666667163372039794921875;
        float _272 = _214 * _214;
        float _274 = _254 * _266;
        float _276 = 1.0 / _206;
        float _278 = _214 * _272;
        float _280 = -_216;
        float _282 = _208 + _280;
        float _284 = _274 * 4.0;
        float _286 = _202 + 1.5;
        float _288 = -_282;
        float _290 = _288 + 1.0;
        float _292 = 1.0 / _270;
        float _294 = -_284;
        float _296 = fma(_258, _268, _294);
        float _298 = -_274;
        float _300 = _298 + 6.0;
        float _302 = _290 * _290;
        float _304 = _278 * 0.16666667163372039794921875;
        float _306 = -_260;
        float _308 = _246 + _306;
        float _310 = -_296;
        float _312 = _310 + _300;
        float _314 = _290 * _302;
        float _316 = 1.0 / _204;
        float _318 = -_308;
        float _320 = _318 + 1.0;
        float _322 = _314 * 4.0;
        float _324 = fma(_304, _292, _286);
        float _326 = -_282;
        float _328 = _326 + 2.0;
        float _330 = _238 + _244;
        float _332 = _312 * 0.16666667163372039794921875;
        float _334 = _320 * _320;
        float _336 = _328 * _328;
        float _338 = _330 * 0.16666667163372039794921875;
        float _340 = _244 * 0.16666667163372039794921875;
        float _342 = _320 * _334;
        float _344 = -_322;
        float _346 = fma(_328, _336, _344);
        float _348 = _274 + _296;
        float _350 = -_314;
        float _352 = _350 + 6.0;
        float _354 = -_308;
        float _356 = _354 + 2.0;
        float _358 = 1.0 / _338;
        float _360 = _348 * 0.16666667163372039794921875;
        float _362 = _342 * 4.0;
        float _364 = _356 * _356;
        float _366 = -_346;
        float _368 = _366 + _352;
        float _370 = _314 + _346;
        float _372 = _346 * 0.16666667163372039794921875;
        float _374 = -_362;
        float _376 = fma(_356, _364, _374);
        float _378 = 1.0 / _360;
        float _380 = _234 * _234;
        float _382 = -_342;
        float _384 = _382 + 6.0;
        float _386 = _342 + _376;
        float _388 = _210 + 1.5;
        float _390 = _234 * _380;
        float _392 = _370 * 0.16666667163372039794921875;
        float _394 = _210 + (-0.5);
        float _396 = 1.0 / _332;
        float _398 = fma(_340, _358, _218);
        float _400 = _296 * 0.16666667163372039794921875;
        float _402 = _390 * 0.16666667163372039794921875;
        float _404 = -_376;
        float _406 = _404 + _384;
        float _408 = _386 * 0.16666667163372039794921875;
        float _410 = _368 * 0.16666667163372039794921875;
        float _412 = _398 * _196;
        float _414 = 1.0 / _392;
        float _416 = fma(_400, _378, _394);
        float _418 = _406 * 0.16666667163372039794921875;
        float _420 = _308 * _308;
        float _422 = _324 * _196;
        float _424 = _416 * _236;
        float _426 = _308 * _420;
        float _428 = 1.0 / _408;
        float _430 = fma(_402, _396, _388);
        float _432 = _282 * _282;
        float _434 = _216 + (-0.5);
        float _436 = _216 + 1.5;
        float _438 = _430 * _236;
        float _440 = _282 * _432;
        float _442 = _260 + (-0.5);
        float _444 = 1.0 / _410;
        float _446 = _260 + 1.5;
        float _448 = _376 * 0.16666667163372039794921875;
        float _450 = fma(_372, _414, _434);
        float _452 = _440 * 0.16666667163372039794921875;
        float _454 = _426 * 0.16666667163372039794921875;
        float _456 = _450 * _316;
        float _458 = 1.0 / _418;
        float _460 = fma(_448, _428, _442);
        float _462 = _460 * _276;
        float _464 = fma(_452, _444, _436);
        float _466 = _464 * _316;
        float _468 = fma(_454, _458, _446);
        float2 _1276 = float2(_412, _424);
        float3 _472 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1276, float2(0.0), isnan(_1276)), level(_148)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1276, float2(0.0), isnan(_1276)), level(_148)).xyz;
        float _474 = _472.x;
        float _476 = _472.y;
        float _478 = _472.z;
        float2 _1291 = float2(_422, _424);
        float3 _480 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1291, float2(0.0), isnan(_1291)), level(_148)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1291, float2(0.0), isnan(_1291)), level(_148)).xyz;
        float _482 = _480.x;
        float _484 = _480.y;
        float _486 = _480.z;
        float _488 = _468 * _276;
        float2 _1309 = float2(_412, _438);
        float3 _490 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1309, float2(0.0), isnan(_1309)), level(_148)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1309, float2(0.0), isnan(_1309)), level(_148)).xyz;
        float _492 = _490.x;
        float _494 = _490.y;
        float _496 = _490.z;
        float2 _1324 = float2(_422, _438);
        float3 _498 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1324, float2(0.0), isnan(_1324)), level(_148)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1324, float2(0.0), isnan(_1324)), level(_148)).xyz;
        float _500 = _498.x;
        float _502 = _498.y;
        float _504 = _498.z;
        float2 _1339 = float2(_456, _462);
        float3 _506 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1339, float2(0.0), isnan(_1339)), level(_154)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1339, float2(0.0), isnan(_1339)), level(_154)).xyz;
        float _508 = _506.x;
        float _510 = _506.y;
        float _512 = _506.z;
        float2 _1354 = float2(_466, _462);
        float3 _514 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1354, float2(0.0), isnan(_1354)), level(_154)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1354, float2(0.0), isnan(_1354)), level(_154)).xyz;
        float _516 = _514.x;
        float _518 = _514.y;
        float _520 = _514.z;
        float2 _1369 = float2(_456, _488);
        float3 _522 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1369, float2(0.0), isnan(_1369)), level(_154)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1369, float2(0.0), isnan(_1369)), level(_154)).xyz;
        float _524 = _522.x;
        float _526 = _522.y;
        float _528 = _522.z;
        float2 _1384 = float2(_466, _488);
        float3 _530 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1384, float2(0.0), isnan(_1384)), level(_154)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1384, float2(0.0), isnan(_1384)), level(_154)).xyz;
        float _532 = _530.x;
        float _534 = _530.y;
        float _536 = _530.z;
        float _538 = -_148;
        float _540 = _142 + _538;
        float _542 = precise::clamp(_540, 0.0, 1.0);
        float _544 = 0.0 + _140;
        float _546 = precise::clamp(_544, 0.0, 1.0);
        float _548 = fma(_112, _546, _130);
        float _550 = _546 * _112;
        float _552 = -_482;
        float _554 = _474 + _552;
        float _556 = -_484;
        float _558 = _476 + _556;
        float _560 = -_486;
        float _562 = _478 + _560;
        float _564 = fma(_338, _554, _482);
        float _566 = -_516;
        float _568 = _508 + _566;
        float _570 = -_518;
        float _572 = _510 + _570;
        float _574 = -_500;
        float _576 = _492 + _574;
        float _578 = -_502;
        float _580 = _494 + _578;
        float _582 = -_504;
        float _584 = _496 + _582;
        float _586 = fma(_392, _568, _516);
        float _588 = -_520;
        float _590 = _512 + _588;
        float _592 = -_536;
        float _594 = _528 + _592;
        float _596 = fma(_392, _572, _518);
        float _598 = -_532;
        float _600 = _524 + _598;
        float _602 = fma(_338, _558, _484);
        float _604 = fma(_338, _562, _486);
        float _606 = fma(_338, _576, _500);
        float _608 = fma(_338, _580, _502);
        float _610 = -_534;
        float _612 = _526 + _610;
        float _614 = fma(_338, _584, _504);
        float _616 = fma(_392, _590, _520);
        float _618 = fma(_392, _594, _536);
        float _620 = fma(_392, _600, _532);
        float _622 = fma(_392, _612, _534);
        float _624 = -_614;
        float _626 = _624 + _604;
        float _628 = -_618;
        float _630 = _628 + _616;
        float _632 = -_606;
        float _634 = _632 + _564;
        float _636 = -_620;
        float _638 = _636 + _586;
        float _640 = -_622;
        float _642 = _640 + _596;
        float _644 = -_608;
        float _646 = _644 + _602;
        float _648 = fma(_360, _626, _614);
        float _650 = fma(_408, _630, _618);
        float _652 = fma(_360, _634, _606);
        float _654 = fma(_408, _638, _620);
        float _656 = fma(_408, _642, _622);
        float _658 = 1.0 / _548;
        float _660 = fma(_360, _646, _608);
        float _662 = -_648;
        float _664 = _662 + _650;
        float _666 = -_652;
        float _668 = _666 + _654;
        float _670 = -_660;
        float _672 = _670 + _656;
        float _674 = fma(_542, _664, _648);
        float _676 = fma(_542, _668, _652);
        float _678 = fma(_542, _672, _660);
        float _680 = -_674;
        float _682 = fma(_674, (*spvDescriptorSet0.fp_c3)._m0[13].z, _680);
        float _684 = -_676;
        float _686 = fma(_676, (*spvDescriptorSet0.fp_c3)._m0[13].x, _684);
        float _688 = -_678;
        float _690 = fma(_678, (*spvDescriptorSet0.fp_c3)._m0[13].y, _688);
        float _692 = fma(_132, _682, _674);
        float _694 = fma(_132, _686, _676);
        float _696 = _658 * _550;
        float _698 = fma(_132, _690, _678);
        float _700 = _692 * _550;
        float _702 = _694 * _696;
        float _704 = _698 * _696;
        float _706 = _700 * _658;
        out.m_34.x = _702;
        out.m_34.y = _704;
        out.m_34.z = _706;
        out.m_34.w = _548;
        return out;
    }
    out.m_34.x = 0.0;
    out.m_34.y = 0.0;
    out.m_34.z = 0.0;
    out.m_34.w = _130;
    return out;
}

