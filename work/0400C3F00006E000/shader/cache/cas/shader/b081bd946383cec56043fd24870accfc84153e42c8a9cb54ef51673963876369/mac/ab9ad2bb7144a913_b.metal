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
};

static inline __attribute__((always_inline))
int _40(thread const int& _1613, thread const int& _1614, constant _10& support_buffer)
{
    int _1617 = 1 + _1614;
    float _1619 = support_buffer._m5[_1617].x;
    float _1621 = abs(_1619);
    bool _1623 = _1621 == 1.0;
    if (_1623)
    {
        return _1613;
    }
    float _1625 = float(_1613);
    float _1627 = _1625 / _1621;
    int _1629 = int(_1627);
    return _1629;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _44 = gl_FragCoord.w;
    float _46 = in.m_31.x;
    float _48 = gl_FragCoord.w;
    float _50 = _46 * _48;
    float _52 = in.m_31.y;
    float _54 = gl_FragCoord.w;
    float _56 = _52 * _54;
    float _58 = 1.0 / _44;
    float _60 = _58 * _50;
    float _62 = _58 * _56;
    float2 _716 = float2(_60, _62);
    float _64 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_716, float2(0.0), isnan(_716))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_716, float2(0.0), isnan(_716))).x;
    float _66 = -_64;
    float _68 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _70 = 1.0 / _68;
    bool _74 = _70 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    if (_74)
    {
        discard_fragment();
    }
    if (_74)
    {
        out.m_34.x = 0.0;
        out.m_34.y = 0.0;
        out.m_34.z = 0.0;
        out.m_34.w = 0.0;
        return out;
    }
    float _76 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _78 = precise::clamp(_76, 0.0, 1.0);
    float _80 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _82 = precise::clamp(_80, 0.0, 1.0);
    float _84 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _86 = precise::clamp(_84, 0.0, 1.0);
    bool _88 = _78 != 0.0;
    bool _90 = isnan(_78);
    bool _92 = _88 || _90;
    bool _94 = isnan(0.0);
    bool _96 = _92 || _94;
    bool _98 = !_96;
    if (!_98)
    {
        float _100 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _102 = fma(_78, _100, 1.0);
        float _104 = log2(_102);
        float _106 = _104 + (-1.0);
        float _108 = trunc(_106);
        int _110 = int(_108);
        float _112 = float(_110);
        float _114 = trunc(_112);
        int _116 = int(_114);
        float _118 = _112 + 1.0;
        float _120 = trunc(_118);
        int _122 = int(_120);
        int _124 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_116), spvDescriptorSet0.fp_t_tcb_A.get_height(_116)).x;
        int _126 = _124;
        int _128 = 1;
        int _130 = _40(_126, _128, (*spvDescriptorSet0.support_buffer));
        int _132 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_116), spvDescriptorSet0.fp_t_tcb_A.get_height(_116)).y;
        int _134 = _132;
        int _136 = 1;
        int _138 = _40(_134, _136, (*spvDescriptorSet0.support_buffer));
        int _140 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_122), spvDescriptorSet0.fp_t_tcb_A.get_height(_122)).x;
        int _142 = _140;
        int _144 = 1;
        int _146 = _40(_142, _144, (*spvDescriptorSet0.support_buffer));
        int _148 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_122), spvDescriptorSet0.fp_t_tcb_A.get_height(_122)).y;
        int _150 = _148;
        int _152 = 1;
        int _154 = _40(_150, _152, (*spvDescriptorSet0.support_buffer));
        float _156 = float(_130);
        float _158 = float(_138);
        float _160 = 1.0 / _156;
        float _162 = fma(_60, _156, -0.5);
        float _164 = fma(_62, _158, -0.5);
        float _166 = floor(_162);
        float _168 = floor(_164);
        float _170 = float(_146);
        float _172 = float(_154);
        float _174 = fma(_60, _170, -0.5);
        float _176 = -_166;
        float _178 = _162 + _176;
        float _180 = 1.0 / _158;
        float _182 = fma(_62, _172, -0.5);
        float _184 = -_178;
        float _186 = _184 + 1.0;
        float _188 = -_178;
        float _190 = _188 + 2.0;
        float _192 = -_168;
        float _194 = _164 + _192;
        float _196 = floor(_174);
        float _198 = _186 * _186;
        float _200 = -_194;
        float _202 = _200 + 1.0;
        float _204 = -_194;
        float _206 = _204 + 2.0;
        float _208 = _186 * _198;
        float _210 = _190 * _190;
        float _212 = _202 * _202;
        float _214 = floor(_182);
        float _216 = _208 * 4.0;
        float _218 = _202 * _212;
        float _220 = _206 * _206;
        float _222 = -_216;
        float _224 = fma(_190, _210, _222);
        float _226 = -_208;
        float _228 = _226 + 6.0;
        float _230 = _218 * 4.0;
        float _232 = -_196;
        float _234 = _174 + _232;
        float _236 = _208 + _224;
        float _238 = -_224;
        float _240 = _238 + _228;
        float _242 = -_230;
        float _244 = fma(_206, _220, _242);
        float _246 = -_234;
        float _248 = _246 + 1.0;
        float _250 = -_218;
        float _252 = _250 + 6.0;
        float _254 = _240 * 0.16666667163372039794921875;
        float _256 = -_234;
        float _258 = _256 + 2.0;
        float _260 = _248 * _248;
        float _262 = -_244;
        float _264 = _262 + _252;
        float _266 = -_214;
        float _268 = _182 + _266;
        float _270 = _258 * _258;
        float _272 = _248 * _260;
        float _274 = _264 * 0.16666667163372039794921875;
        float _276 = -_268;
        float _278 = _276 + 1.0;
        float _280 = 1.0 / _254;
        float _282 = _272 * 4.0;
        float _284 = -_272;
        float _286 = _284 + 6.0;
        float _288 = _236 * 0.16666667163372039794921875;
        float _290 = _178 * _178;
        float _292 = -_282;
        float _294 = fma(_258, _270, _292);
        float _296 = _278 * _278;
        float _298 = -_268;
        float _300 = _298 + 2.0;
        float _302 = 1.0 / _288;
        float _304 = -_294;
        float _306 = _304 + _286;
        float _308 = _278 * _296;
        float _310 = _300 * _300;
        float _312 = _178 * _290;
        float _314 = _306 * 0.16666667163372039794921875;
        float _316 = _218 + _244;
        float _318 = _308 * 4.0;
        float _320 = 1.0 / _274;
        float _322 = -_308;
        float _324 = _322 + 6.0;
        float _326 = _316 * 0.16666667163372039794921875;
        float _328 = -_318;
        float _330 = fma(_300, _310, _328);
        float _332 = _166 + 1.5;
        float _334 = _312 * 0.16666667163372039794921875;
        float _336 = _272 + _294;
        float _338 = _224 * 0.16666667163372039794921875;
        float _340 = 1.0 / _326;
        float _342 = fma(_334, _280, _332);
        float _344 = _166 + (-0.5);
        float _346 = _194 * _194;
        float _348 = _336 * 0.16666667163372039794921875;
        float _350 = -_330;
        float _352 = _350 + _324;
        float _354 = _168 + 1.5;
        float _356 = _194 * _346;
        float _358 = fma(_338, _302, _344);
        float _360 = _308 + _330;
        float _362 = _168 + (-0.5);
        float _364 = 1.0 / _348;
        float _366 = _244 * 0.16666667163372039794921875;
        float _368 = _352 * 0.16666667163372039794921875;
        float _370 = _356 * 0.16666667163372039794921875;
        float _372 = _360 * 0.16666667163372039794921875;
        float _374 = fma(_366, _340, _362);
        float _376 = _234 * _234;
        float _378 = fma(_370, _320, _354);
        float _380 = 1.0 / _314;
        float _382 = _268 * _268;
        float _384 = _234 * _376;
        float _386 = _358 * _160;
        float _388 = _374 * _180;
        float _390 = _268 * _382;
        float _392 = _378 * _180;
        float _394 = _196 + (-0.5);
        float _396 = 1.0 / _170;
        float _398 = _294 * 0.16666667163372039794921875;
        float _400 = _196 + 1.5;
        float _402 = _384 * 0.16666667163372039794921875;
        float _404 = _214 + (-0.5);
        float _406 = fma(_398, _364, _394);
        float _408 = _330 * 0.16666667163372039794921875;
        float _410 = _342 * _160;
        float _412 = 1.0 / _372;
        float _414 = fma(_402, _380, _400);
        float _416 = _214 + 1.5;
        float _418 = _390 * 0.16666667163372039794921875;
        float _420 = 1.0 / _368;
        float _422 = _406 * _396;
        float _424 = _414 * _396;
        float _426 = 1.0 / _172;
        float _428 = fma(_408, _412, _404);
        float2 _1198 = float2(_386, _388);
        float3 _432 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1198, float2(0.0), isnan(_1198)), level(_112)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1198, float2(0.0), isnan(_1198)), level(_112)).xyz;
        float _434 = _432.x;
        float _436 = _432.y;
        float _438 = _432.z;
        float _440 = fma(_418, _420, _416);
        float _442 = _428 * _426;
        float _444 = _440 * _426;
        float2 _1223 = float2(_410, _388);
        float3 _446 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1223, float2(0.0), isnan(_1223)), level(_112)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1223, float2(0.0), isnan(_1223)), level(_112)).xyz;
        float _448 = _446.x;
        float _450 = _446.y;
        float _452 = _446.z;
        float2 _1238 = float2(_386, _392);
        float3 _454 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1238, float2(0.0), isnan(_1238)), level(_112)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1238, float2(0.0), isnan(_1238)), level(_112)).xyz;
        float _456 = _454.x;
        float _458 = _454.y;
        float _460 = _454.z;
        float2 _1253 = float2(_410, _392);
        float3 _462 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1253, float2(0.0), isnan(_1253)), level(_112)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1253, float2(0.0), isnan(_1253)), level(_112)).xyz;
        float _464 = _462.x;
        float _466 = _462.y;
        float _468 = _462.z;
        float2 _1268 = float2(_422, _442);
        float3 _470 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1268, float2(0.0), isnan(_1268)), level(_118)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1268, float2(0.0), isnan(_1268)), level(_118)).xyz;
        float _472 = _470.x;
        float _474 = _470.y;
        float _476 = _470.z;
        float2 _1283 = float2(_424, _442);
        float3 _478 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1283, float2(0.0), isnan(_1283)), level(_118)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1283, float2(0.0), isnan(_1283)), level(_118)).xyz;
        float _480 = _478.x;
        float _482 = _478.y;
        float _484 = _478.z;
        float2 _1298 = float2(_422, _444);
        float3 _486 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1298, float2(0.0), isnan(_1298)), level(_118)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1298, float2(0.0), isnan(_1298)), level(_118)).xyz;
        float _488 = _486.x;
        float _490 = _486.y;
        float _492 = _486.z;
        float2 _1313 = float2(_424, _444);
        float3 _494 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1313, float2(0.0), isnan(_1313)), level(_118)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1313, float2(0.0), isnan(_1313)), level(_118)).xyz;
        float _496 = _494.x;
        float _498 = _494.y;
        float _500 = _494.z;
        float _502 = precise::min(_82, _86);
        float _504 = -_112;
        float _506 = _106 + _504;
        float _508 = precise::clamp(_506, 0.0, 1.0);
        float _510 = 0.0 + _104;
        float _512 = precise::clamp(_510, 0.0, 1.0);
        float _514 = -_448;
        float _516 = _434 + _514;
        float _518 = -_450;
        float _520 = _436 + _518;
        float _522 = -_464;
        float _524 = _456 + _522;
        float _526 = -_452;
        float _528 = _438 + _526;
        float _530 = fma(_288, _516, _448);
        float _532 = -_466;
        float _534 = _458 + _532;
        float _536 = fma(_288, _524, _464);
        float _538 = fma(_288, _520, _450);
        float _540 = -_468;
        float _542 = _460 + _540;
        float _544 = fma(_288, _534, _466);
        float _546 = -_536;
        float _548 = _546 + _530;
        float _550 = -_480;
        float _552 = _472 + _550;
        float _554 = -_484;
        float _556 = _476 + _554;
        float _558 = -_498;
        float _560 = _490 + _558;
        float _562 = fma(_326, _548, _536);
        float _564 = -_482;
        float _566 = _474 + _564;
        float _568 = -_496;
        float _570 = _488 + _568;
        float _572 = fma(_348, _560, _498);
        float _574 = -_544;
        float _576 = _574 + _538;
        float _578 = fma(_348, _566, _482);
        float _580 = fma(_348, _552, _480);
        float _582 = fma(_348, _570, _496);
        float _584 = -_500;
        float _586 = _492 + _584;
        float _588 = -_572;
        float _590 = _588 + _578;
        float _592 = fma(_288, _528, _452);
        float _594 = fma(_288, _542, _468);
        float _596 = fma(_326, _576, _544);
        float _598 = fma(_348, _556, _484);
        float _600 = -_582;
        float _602 = _600 + _580;
        float _604 = fma(_348, _586, _500);
        float _606 = fma(_372, _590, _572);
        float _608 = -_594;
        float _610 = _608 + _592;
        float _612 = fma(_372, _602, _582);
        float _614 = -_604;
        float _616 = _614 + _598;
        float _618 = -_596;
        float _620 = _618 + _606;
        float _622 = fma(_326, _610, _594);
        float _624 = -_562;
        float _626 = _624 + _612;
        float _628 = fma(_372, _616, _604);
        float _630 = fma(_508, _620, _596);
        float _632 = fma(_508, _626, _562);
        float _634 = -_622;
        float _636 = _634 + _628;
        float _638 = _630 * 0.586600005626678466796875;
        float _640 = _502 * (*spvDescriptorSet0.fp_c3)._m0[0].w;
        float _642 = fma(_508, _636, _622);
        float _644 = fma(_632, 0.29890000820159912109375, _638);
        float _646 = fma(_642, 0.1143999993801116943359375, _644);
        float _648 = -_632;
        float _650 = _648 + _646;
        float _652 = -_630;
        float _654 = _652 + _646;
        float _656 = -_642;
        float _658 = _656 + _646;
        float _660 = fma(_640, _650, _632);
        float _662 = fma(_640, _654, _630);
        float _664 = fma(_640, _658, _642);
        float _666 = -_660;
        float _668 = fma(_660, (*spvDescriptorSet0.fp_c3)._m0[13].x, _666);
        float _670 = -_662;
        float _672 = fma(_662, (*spvDescriptorSet0.fp_c3)._m0[13].y, _670);
        float _674 = -_664;
        float _676 = fma(_664, (*spvDescriptorSet0.fp_c3)._m0[13].z, _674);
        float _678 = fma(_502, _668, _660);
        float _680 = fma(_502, _672, _662);
        float _682 = fma(_502, _676, _664);
        out.m_34.x = _678;
        out.m_34.y = _680;
        out.m_34.z = _682;
        out.m_34.w = _512;
        return out;
    }
    discard_fragment();
    return out;
}

