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
int _42(thread const int& _1663, thread const int& _1664, constant _10& support_buffer)
{
    int _1667 = 1 + _1664;
    float _1669 = support_buffer._m5[_1667].x;
    float _1671 = abs(_1669);
    bool _1673 = _1671 == 1.0;
    if (_1673)
    {
        return _1663;
    }
    float _1675 = float(_1663);
    float _1677 = _1675 / _1671;
    int _1679 = int(_1677);
    return _1679;
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
    bool _70 = _66 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    if (_70)
    {
        discard_fragment();
    }
    if (_70)
    {
        out.m_34.x = 0.0;
        out.m_34.y = 0.0;
        out.m_34.z = 0.0;
        out.m_34.w = 0.0;
        return out;
    }
    float _72 = in.m_36.z;
    float _74 = gl_FragCoord.w;
    float _76 = _72 * _74;
    float _78 = in.m_36.x;
    float _80 = gl_FragCoord.w;
    float _82 = _78 * _80;
    float _84 = in.m_36.y;
    float _86 = gl_FragCoord.w;
    float _88 = _84 * _86;
    float _90 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _92 = precise::clamp(_90, 0.0, 1.0);
    float _94 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _96 = precise::clamp(_94, 0.0, 1.0);
    float _98 = _60 * _76;
    float _100 = precise::max(_92, _98);
    float _102 = _60 * _88;
    bool _104 = _100 != 0.0;
    bool _106 = isnan(_100);
    bool _108 = _104 || _106;
    bool _110 = isnan(0.0);
    bool _112 = _108 || _110;
    float _114 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _116 = precise::clamp(_114, 0.0, 1.0);
    float _118 = _60 * _82;
    float _120 = precise::min(_116, _96);
    bool _122 = !_112;
    if (!_122)
    {
        float _124 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _126 = fma(_100, _124, 1.0);
        float _128 = log2(_126);
        float _130 = _128 + (-1.0);
        float _132 = trunc(_130);
        int _134 = int(_132);
        float _136 = float(_134);
        float _138 = trunc(_136);
        int _140 = int(_138);
        float _142 = _136 + 1.0;
        float _144 = trunc(_142);
        int _146 = int(_144);
        int _148 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_140), spvDescriptorSet0.fp_t_tcb_A.get_height(_140)).x;
        int _150 = _148;
        int _152 = 1;
        int _154 = _42(_150, _152, (*spvDescriptorSet0.support_buffer));
        int _156 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_140), spvDescriptorSet0.fp_t_tcb_A.get_height(_140)).y;
        int _158 = _156;
        int _160 = 1;
        int _162 = _42(_158, _160, (*spvDescriptorSet0.support_buffer));
        int _164 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_146), spvDescriptorSet0.fp_t_tcb_A.get_height(_146)).x;
        int _166 = _164;
        int _168 = 1;
        int _170 = _42(_166, _168, (*spvDescriptorSet0.support_buffer));
        int _172 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_146), spvDescriptorSet0.fp_t_tcb_A.get_height(_146)).y;
        int _174 = _172;
        int _176 = 1;
        int _178 = _42(_174, _176, (*spvDescriptorSet0.support_buffer));
        float _180 = float(_154);
        float _182 = float(_162);
        float _184 = 1.0 / _180;
        float _186 = fma(_62, _180, -0.5);
        float _188 = fma(_64, _182, -0.5);
        float _190 = floor(_186);
        float _192 = floor(_188);
        float _194 = -_190;
        float _196 = _186 + _194;
        float _198 = float(_170);
        float _200 = 1.0 / _182;
        float _202 = _190 + 1.5;
        float _204 = -_196;
        float _206 = _204 + 1.0;
        float _208 = -_196;
        float _210 = _208 + 2.0;
        float _212 = fma(_62, _198, -0.5);
        float _214 = _190 + (-0.5);
        float _216 = _206 * _206;
        float _218 = -_192;
        float _220 = _188 + _218;
        float _222 = floor(_212);
        float _224 = _206 * _216;
        float _226 = float(_178);
        float _228 = _210 * _210;
        float _230 = -_220;
        float _232 = _230 + 2.0;
        float _234 = _224 * 4.0;
        float _236 = _220 * _220;
        float _238 = fma(_64, _226, -0.5);
        float _240 = -_224;
        float _242 = _240 + 6.0;
        float _244 = -_234;
        float _246 = fma(_210, _228, _244);
        float _248 = -_220;
        float _250 = _248 + 1.0;
        float _252 = floor(_238);
        float _254 = _232 * _232;
        float _256 = -_246;
        float _258 = _256 + _242;
        float _260 = _250 * _250;
        float _262 = _220 * _236;
        float _264 = _258 * 0.16666667163372039794921875;
        float _266 = _250 * _260;
        float _268 = _196 * _196;
        float _270 = _262 * 0.16666667163372039794921875;
        float _272 = 1.0 / _264;
        float _274 = _266 * 4.0;
        float _276 = _196 * _268;
        float _278 = -_222;
        float _280 = _212 + _278;
        float _282 = -_274;
        float _284 = fma(_232, _254, _282);
        float _286 = -_266;
        float _288 = _286 + 6.0;
        float _290 = -_280;
        float _292 = _290 + 1.0;
        float _294 = _276 * 0.16666667163372039794921875;
        float _296 = -_252;
        float _298 = _238 + _296;
        float _300 = -_284;
        float _302 = _300 + _288;
        float _304 = _292 * _292;
        float _306 = 1.0 / _198;
        float _308 = _302 * 0.16666667163372039794921875;
        float _310 = _292 * _304;
        float _312 = fma(_294, _272, _202);
        float _314 = -_298;
        float _316 = _314 + 1.0;
        float _318 = _224 + _246;
        float _320 = _310 * 4.0;
        float _322 = -_298;
        float _324 = _322 + 2.0;
        float _326 = -_280;
        float _328 = _326 + 2.0;
        float _330 = _316 * _316;
        float _332 = _318 * 0.16666667163372039794921875;
        float _334 = _266 + _284;
        float _336 = _328 * _328;
        float _338 = _316 * _330;
        float _340 = 1.0 / _332;
        float _342 = _334 * 0.16666667163372039794921875;
        float _344 = -_320;
        float _346 = fma(_328, _336, _344);
        float _348 = _324 * _324;
        float _350 = _338 * 4.0;
        float _352 = -_310;
        float _354 = _352 + 6.0;
        float _356 = _310 + _346;
        float _358 = _246 * 0.16666667163372039794921875;
        float _360 = 1.0 / _308;
        float _362 = -_346;
        float _364 = _362 + _354;
        float _366 = _356 * 0.16666667163372039794921875;
        float _368 = _192 + (-0.5);
        float _370 = _346 * 0.16666667163372039794921875;
        float _372 = _364 * 0.16666667163372039794921875;
        float _374 = 1.0 / _342;
        float _376 = -_350;
        float _378 = fma(_324, _348, _376);
        float _380 = -_338;
        float _382 = _380 + 6.0;
        float _384 = fma(_358, _340, _214);
        float _386 = _192 + 1.5;
        float _388 = _338 + _378;
        float _390 = -_378;
        float _392 = _390 + _382;
        float _394 = _284 * 0.16666667163372039794921875;
        float _396 = 1.0 / _366;
        float _398 = _388 * 0.16666667163372039794921875;
        float _400 = _392 * 0.16666667163372039794921875;
        float _402 = fma(_270, _360, _386);
        float _404 = _298 * _298;
        float _406 = _384 * _184;
        float _408 = _312 * _184;
        float _410 = 1.0 / _400;
        float _412 = fma(_394, _374, _368);
        float _414 = _280 * _280;
        float _416 = _298 * _404;
        float _418 = _222 + (-0.5);
        float _420 = _252 + 1.5;
        float _422 = _280 * _414;
        float _424 = _222 + 1.5;
        float _426 = 1.0 / _226;
        float _428 = _416 * 0.16666667163372039794921875;
        float _430 = _412 * _200;
        float _432 = fma(_370, _396, _418);
        float _434 = _252 + (-0.5);
        float _436 = _378 * 0.16666667163372039794921875;
        float _438 = _402 * _200;
        float _440 = 1.0 / _398;
        float _442 = fma(_428, _410, _420);
        float _444 = _432 * _306;
        float _446 = _422 * 0.16666667163372039794921875;
        float _448 = 1.0 / _372;
        float _450 = _442 * _426;
        float _452 = fma(_436, _440, _434);
        float _454 = _452 * _426;
        float2 _1250 = float2(_406, _430);
        float3 _458 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1250, float2(0.0), isnan(_1250)), level(_136)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1250, float2(0.0), isnan(_1250)), level(_136)).xyz;
        float _460 = _458.x;
        float _462 = _458.y;
        float _464 = _458.z;
        float2 _1265 = float2(_408, _430);
        float3 _466 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1265, float2(0.0), isnan(_1265)), level(_136)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1265, float2(0.0), isnan(_1265)), level(_136)).xyz;
        float _468 = _466.x;
        float _470 = _466.y;
        float _472 = _466.z;
        float2 _1280 = float2(_406, _438);
        float3 _474 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1280, float2(0.0), isnan(_1280)), level(_136)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1280, float2(0.0), isnan(_1280)), level(_136)).xyz;
        float _476 = _474.x;
        float _478 = _474.y;
        float _480 = _474.z;
        float _482 = fma(_446, _448, _424);
        float2 _1299 = float2(_408, _438);
        float3 _484 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1299, float2(0.0), isnan(_1299)), level(_136)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1299, float2(0.0), isnan(_1299)), level(_136)).xyz;
        float _486 = _484.x;
        float _488 = _484.y;
        float _490 = _484.z;
        float _492 = _482 * _306;
        float2 _1317 = float2(_444, _454);
        float3 _494 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1317, float2(0.0), isnan(_1317)), level(_142)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1317, float2(0.0), isnan(_1317)), level(_142)).xyz;
        float _496 = _494.x;
        float _498 = _494.y;
        float _500 = _494.z;
        float2 _1332 = float2(_492, _454);
        float3 _502 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1332, float2(0.0), isnan(_1332)), level(_142)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1332, float2(0.0), isnan(_1332)), level(_142)).xyz;
        float _504 = _502.x;
        float _506 = _502.y;
        float _508 = _502.z;
        float2 _1347 = float2(_444, _450);
        float3 _510 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1347, float2(0.0), isnan(_1347)), level(_142)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1347, float2(0.0), isnan(_1347)), level(_142)).xyz;
        float _512 = _510.x;
        float _514 = _510.y;
        float _516 = _510.z;
        float2 _1362 = float2(_492, _450);
        float3 _518 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1362, float2(0.0), isnan(_1362)), level(_142)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1362, float2(0.0), isnan(_1362)), level(_142)).xyz;
        float _520 = _518.x;
        float _522 = _518.y;
        float _524 = _518.z;
        float _526 = -_136;
        float _528 = _130 + _526;
        float _530 = precise::clamp(_528, 0.0, 1.0);
        float _532 = -_470;
        float _534 = _462 + _532;
        float _536 = -_468;
        float _538 = _460 + _536;
        float _540 = fma(_332, _534, _470);
        float _542 = -_472;
        float _544 = _464 + _542;
        float _546 = -_488;
        float _548 = _478 + _546;
        float _550 = -_486;
        float _552 = _476 + _550;
        float _554 = fma(_332, _538, _468);
        float _556 = -_490;
        float _558 = _480 + _556;
        float _560 = fma(_332, _548, _488);
        float _562 = fma(_332, _552, _486);
        float _564 = fma(_332, _544, _472);
        float _566 = -_506;
        float _568 = _498 + _566;
        float _570 = -_560;
        float _572 = _570 + _540;
        float _574 = -_504;
        float _576 = _496 + _574;
        float _578 = -_508;
        float _580 = _500 + _578;
        float _582 = fma(_366, _568, _506);
        float _584 = fma(_342, _572, _560);
        float _586 = -_522;
        float _588 = _514 + _586;
        float _590 = -_520;
        float _592 = _512 + _590;
        float _594 = fma(_366, _576, _504);
        float _596 = -_524;
        float _598 = _516 + _596;
        float _600 = fma(_366, _588, _522);
        float _602 = fma(_366, _592, _520);
        float _604 = -_562;
        float _606 = _604 + _554;
        float _608 = fma(_332, _558, _490);
        float _610 = -_600;
        float _612 = _610 + _582;
        float _614 = fma(_366, _580, _508);
        float _616 = fma(_366, _598, _524);
        float _618 = -_602;
        float _620 = _618 + _594;
        float _622 = fma(_398, _612, _600);
        float _624 = fma(_342, _606, _562);
        float _626 = -_608;
        float _628 = _626 + _564;
        float _630 = -_616;
        float _632 = _630 + _614;
        float _634 = fma(_398, _620, _602);
        float _636 = -_584;
        float _638 = _636 + _622;
        float _640 = fma(_342, _628, _608);
        float _642 = fma(_398, _632, _616);
        float _644 = -_624;
        float _646 = _644 + _634;
        float _648 = fma(_530, _638, _584);
        float _650 = _120 * (*spvDescriptorSet0.fp_c3)._m0[0].w;
        float _652 = -_640;
        float _654 = _652 + _642;
        float _656 = fma(_530, _646, _624);
        float _658 = _648 * 0.586600005626678466796875;
        float _660 = fma(_530, _654, _640);
        float _662 = fma(_656, 0.29890000820159912109375, _658);
        float _664 = fma(_660, 0.1143999993801116943359375, _662);
        float _666 = -_656;
        float _668 = _666 + _664;
        float _670 = -_648;
        float _672 = _670 + _664;
        float _674 = -_660;
        float _676 = _674 + _664;
        float _678 = fma(_650, _668, _656);
        float _680 = fma(_650, _672, _648);
        float _682 = fma(_650, _676, _660);
        float _684 = 0.0 + _128;
        float _686 = precise::clamp(_684, 0.0, 1.0);
        float _688 = -_678;
        float _690 = fma(_678, (*spvDescriptorSet0.fp_c3)._m0[13].x, _688);
        float _692 = -_680;
        float _694 = fma(_680, (*spvDescriptorSet0.fp_c3)._m0[13].y, _692);
        float _696 = -_682;
        float _698 = fma(_682, (*spvDescriptorSet0.fp_c3)._m0[13].z, _696);
        float _700 = fma(_102, _686, _118);
        float _702 = fma(_120, _690, _678);
        float _704 = fma(_120, _694, _680);
        float _706 = fma(_120, _698, _682);
        out.m_34.x = _702;
        out.m_34.y = _704;
        out.m_34.z = _706;
        out.m_34.w = _700;
        return out;
    }
    discard_fragment();
    return out;
}

