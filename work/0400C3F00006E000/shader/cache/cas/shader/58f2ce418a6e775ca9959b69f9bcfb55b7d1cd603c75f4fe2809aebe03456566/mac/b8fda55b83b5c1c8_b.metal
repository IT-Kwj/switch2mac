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
int _42(thread const int& _1702, thread const int& _1703, constant _10& support_buffer)
{
    int _1706 = 1 + _1703;
    float _1708 = support_buffer._m5[_1706].x;
    float _1710 = abs(_1708);
    bool _1712 = _1710 == 1.0;
    if (_1712)
    {
        return _1702;
    }
    float _1714 = float(_1702);
    float _1716 = _1714 / _1710;
    int _1718 = int(_1716);
    return _1718;
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
    float2 _754 = float2(_62, _64);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_754, float2(0.0), isnan(_754))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_754, float2(0.0), isnan(_754))).x;
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
    float _100 = _60 * _82;
    float _102 = precise::max(_92, _98);
    bool _104 = _102 != 0.0;
    bool _106 = isnan(_102);
    bool _108 = _104 || _106;
    bool _110 = isnan(0.0);
    bool _112 = _108 || _110;
    float _114 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _116 = precise::clamp(_114, 0.0, 1.0);
    float _118 = _60 * _88;
    float _120 = precise::min(_116, _96);
    bool _122 = !_112;
    if (!_122)
    {
        float _124 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _126 = fma(_102, _124, 1.0);
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
        float _192 = float(_170);
        float _194 = float(_178);
        float _196 = fma(_62, _192, -0.5);
        float _198 = floor(_188);
        float _200 = -_190;
        float _202 = _186 + _200;
        float _204 = fma(_64, _194, -0.5);
        float _206 = floor(_196);
        float _208 = _190 + 1.5;
        float _210 = -_202;
        float _212 = _210 + 1.0;
        float _214 = -_202;
        float _216 = _214 + 2.0;
        float _218 = _190 + (-0.5);
        float _220 = _212 * _212;
        float _222 = _216 * _216;
        float _224 = -_198;
        float _226 = _188 + _224;
        float _228 = 1.0 / _182;
        float _230 = _212 * _220;
        float _232 = -_226;
        float _234 = _232 + 2.0;
        float _236 = _226 * _226;
        float _238 = _230 * 4.0;
        float _240 = -_230;
        float _242 = _240 + 6.0;
        float _244 = -_206;
        float _246 = _196 + _244;
        float _248 = _234 * _234;
        float _250 = -_238;
        float _252 = fma(_216, _222, _250);
        float _254 = -_226;
        float _256 = _254 + 1.0;
        float _258 = floor(_204);
        float _260 = -_246;
        float _262 = _260 + 1.0;
        float _264 = -_252;
        float _266 = _264 + _242;
        float _268 = _256 * _256;
        float _270 = _226 * _236;
        float _272 = _266 * 0.16666667163372039794921875;
        float _274 = _256 * _268;
        float _276 = _202 * _202;
        float _278 = _270 * 0.16666667163372039794921875;
        float _280 = 1.0 / _194;
        float _282 = _274 * 4.0;
        float _284 = _202 * _276;
        float _286 = -_282;
        float _288 = fma(_234, _248, _286);
        float _290 = -_258;
        float _292 = _204 + _290;
        float _294 = -_274;
        float _296 = _294 + 6.0;
        float _298 = 1.0 / _272;
        float _300 = _262 * _262;
        float _302 = _284 * 0.16666667163372039794921875;
        float _304 = -_292;
        float _306 = _304 + 1.0;
        float _308 = -_288;
        float _310 = _308 + _296;
        float _312 = _262 * _300;
        float _314 = -_292;
        float _316 = _314 + 2.0;
        float _318 = _306 * _306;
        float _320 = 1.0 / _192;
        float _322 = _312 * 4.0;
        float _324 = _310 * 0.16666667163372039794921875;
        float _326 = _306 * _318;
        float _328 = _274 + _288;
        float _330 = _326 * 4.0;
        float _332 = fma(_302, _298, _208);
        float _334 = -_246;
        float _336 = _334 + 2.0;
        float _338 = _230 + _252;
        float _340 = 1.0 / _324;
        float _342 = _328 * 0.16666667163372039794921875;
        float _344 = _336 * _336;
        float _346 = _338 * 0.16666667163372039794921875;
        float _348 = _252 * 0.16666667163372039794921875;
        float _350 = -_322;
        float _352 = fma(_336, _344, _350);
        float _354 = _316 * _316;
        float _356 = 1.0 / _346;
        float _358 = -_312;
        float _360 = _358 + 6.0;
        float _362 = _312 + _352;
        float _364 = -_330;
        float _366 = fma(_316, _354, _364);
        float _368 = -_326;
        float _370 = _368 + 6.0;
        float _372 = -_352;
        float _374 = _372 + _360;
        float _376 = _362 * 0.16666667163372039794921875;
        float _378 = _326 + _366;
        float _380 = 1.0 / _342;
        float _382 = -_366;
        float _384 = _382 + _370;
        float _386 = _198 + (-0.5);
        float _388 = _288 * 0.16666667163372039794921875;
        float _390 = _374 * 0.16666667163372039794921875;
        float _392 = _384 * 0.16666667163372039794921875;
        float _394 = _352 * 0.16666667163372039794921875;
        float _396 = fma(_348, _356, _218);
        float _398 = _198 + 1.5;
        float _400 = 1.0 / _376;
        float _402 = _378 * 0.16666667163372039794921875;
        float _404 = _396 * _184;
        float _406 = fma(_278, _340, _398);
        float _408 = _292 * _292;
        float _410 = _332 * _184;
        float _412 = fma(_388, _380, _386);
        float _414 = _246 * _246;
        float _416 = 1.0 / _392;
        float _418 = _292 * _408;
        float _420 = _206 + (-0.5);
        float _422 = _246 * _414;
        float _424 = _206 + 1.5;
        float _426 = _258 + 1.5;
        float _428 = _418 * 0.16666667163372039794921875;
        float _430 = _412 * _228;
        float _432 = 1.0 / _402;
        float _434 = fma(_394, _400, _420);
        float _436 = _258 + (-0.5);
        float _438 = _366 * 0.16666667163372039794921875;
        float _440 = _406 * _228;
        float _442 = _422 * 0.16666667163372039794921875;
        float _444 = 1.0 / _390;
        float _446 = fma(_428, _416, _426);
        float _448 = _434 * _320;
        float _450 = _446 * _280;
        float _452 = fma(_438, _432, _436);
        float _454 = _452 * _280;
        float2 _1264 = float2(_404, _430);
        float3 _458 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1264, float2(0.0), isnan(_1264)), level(_136)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1264, float2(0.0), isnan(_1264)), level(_136)).xyz;
        float _460 = _458.x;
        float _462 = _458.y;
        float _464 = _458.z;
        float2 _1279 = float2(_410, _430);
        float3 _466 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1279, float2(0.0), isnan(_1279)), level(_136)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1279, float2(0.0), isnan(_1279)), level(_136)).xyz;
        float _468 = _466.x;
        float _470 = _466.y;
        float _472 = _466.z;
        float2 _1294 = float2(_404, _440);
        float3 _474 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1294, float2(0.0), isnan(_1294)), level(_136)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1294, float2(0.0), isnan(_1294)), level(_136)).xyz;
        float _476 = _474.x;
        float _478 = _474.y;
        float _480 = _474.z;
        float _482 = fma(_442, _444, _424);
        float2 _1313 = float2(_410, _440);
        float3 _484 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1313, float2(0.0), isnan(_1313)), level(_136)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1313, float2(0.0), isnan(_1313)), level(_136)).xyz;
        float _486 = _484.x;
        float _488 = _484.y;
        float _490 = _484.z;
        float _492 = _482 * _320;
        float2 _1331 = float2(_448, _454);
        float3 _494 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1331, float2(0.0), isnan(_1331)), level(_142)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1331, float2(0.0), isnan(_1331)), level(_142)).xyz;
        float _496 = _494.x;
        float _498 = _494.y;
        float _500 = _494.z;
        float2 _1346 = float2(_492, _454);
        float3 _502 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1346, float2(0.0), isnan(_1346)), level(_142)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1346, float2(0.0), isnan(_1346)), level(_142)).xyz;
        float _504 = _502.x;
        float _506 = _502.y;
        float _508 = _502.z;
        float2 _1361 = float2(_448, _450);
        float3 _510 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1361, float2(0.0), isnan(_1361)), level(_142)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1361, float2(0.0), isnan(_1361)), level(_142)).xyz;
        float _512 = _510.x;
        float _514 = _510.y;
        float _516 = _510.z;
        float2 _1376 = float2(_492, _450);
        float3 _518 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1376, float2(0.0), isnan(_1376)), level(_142)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1376, float2(0.0), isnan(_1376)), level(_142)).xyz;
        float _520 = _518.x;
        float _522 = _518.y;
        float _524 = _518.z;
        float _526 = -_136;
        float _528 = _130 + _526;
        float _530 = precise::clamp(_528, 0.0, 1.0);
        float _532 = 0.0 + _128;
        float _534 = precise::clamp(_532, 0.0, 1.0);
        float _536 = fma(_118, _534, _100);
        float _538 = -_470;
        float _540 = _462 + _538;
        float _542 = -_468;
        float _544 = _460 + _542;
        float _546 = fma(_346, _540, _470);
        float _548 = -_472;
        float _550 = _464 + _548;
        float _552 = -_488;
        float _554 = _478 + _552;
        float _556 = -_486;
        float _558 = _476 + _556;
        float _560 = -_490;
        float _562 = _480 + _560;
        float _564 = fma(_346, _544, _468);
        float _566 = fma(_346, _554, _488);
        float _568 = fma(_346, _558, _486);
        float _570 = fma(_346, _550, _472);
        float _572 = -_506;
        float _574 = _498 + _572;
        float _576 = -_566;
        float _578 = _576 + _546;
        float _580 = -_504;
        float _582 = _496 + _580;
        float _584 = -_508;
        float _586 = _500 + _584;
        float _588 = fma(_376, _574, _506);
        float _590 = fma(_342, _578, _566);
        float _592 = -_522;
        float _594 = _514 + _592;
        float _596 = -_520;
        float _598 = _512 + _596;
        float _600 = -_524;
        float _602 = _516 + _600;
        float _604 = fma(_376, _582, _504);
        float _606 = fma(_376, _594, _522);
        float _608 = fma(_376, _598, _520);
        float _610 = fma(_346, _562, _490);
        float _612 = fma(_376, _586, _508);
        float _614 = -_606;
        float _616 = _614 + _588;
        float _618 = fma(_376, _602, _524);
        float _620 = -_568;
        float _622 = _620 + _564;
        float _624 = -_608;
        float _626 = _624 + _604;
        float _628 = fma(_402, _616, _606);
        float _630 = -_610;
        float _632 = _630 + _570;
        float _634 = -_618;
        float _636 = _634 + _612;
        float _638 = fma(_342, _622, _568);
        float _640 = fma(_402, _626, _608);
        float _642 = -_590;
        float _644 = _642 + _628;
        float _646 = fma(_342, _632, _610);
        float _648 = fma(_402, _636, _618);
        float _650 = -_638;
        float _652 = _650 + _640;
        float _654 = fma(_530, _644, _590);
        float _656 = _534 * _118;
        float _658 = -_646;
        float _660 = _658 + _648;
        float _662 = fma(_530, _652, _638);
        float _664 = _654 * 0.586600005626678466796875;
        float _666 = 1.0 / _536;
        float _668 = fma(_530, _660, _646);
        float _670 = _120 * (*spvDescriptorSet0.fp_c3)._m0[0].w;
        float _672 = fma(_662, 0.29890000820159912109375, _664);
        float _674 = fma(_668, 0.1143999993801116943359375, _672);
        float _676 = -_668;
        float _678 = _676 + _674;
        float _680 = -_662;
        float _682 = _680 + _674;
        float _684 = -_654;
        float _686 = _684 + _674;
        float _688 = fma(_670, _678, _668);
        float _690 = fma(_670, _682, _662);
        float _692 = fma(_670, _686, _654);
        float _694 = -_688;
        float _696 = fma(_688, (*spvDescriptorSet0.fp_c3)._m0[13].z, _694);
        float _698 = -_690;
        float _700 = fma(_690, (*spvDescriptorSet0.fp_c3)._m0[13].x, _698);
        float _702 = -_692;
        float _704 = fma(_692, (*spvDescriptorSet0.fp_c3)._m0[13].y, _702);
        float _706 = fma(_120, _696, _688);
        float _708 = fma(_120, _700, _690);
        float _710 = _666 * _656;
        float _712 = fma(_120, _704, _692);
        float _714 = _706 * _656;
        float _716 = _708 * _710;
        float _718 = _712 * _710;
        float _720 = _714 * _666;
        out.m_34.x = _716;
        out.m_34.y = _718;
        out.m_34.z = _720;
        out.m_34.w = _536;
        return out;
    }
    out.m_34.x = 0.0;
    out.m_34.y = 0.0;
    out.m_34.z = 0.0;
    out.m_34.w = _100;
    return out;
}

