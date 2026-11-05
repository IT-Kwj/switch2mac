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
};

static inline __attribute__((always_inline))
int _42(thread const int& _1629, thread const int& _1630, constant _10& support_buffer)
{
    int _1633 = 1 + _1630;
    float _1635 = support_buffer._m5[_1633].x;
    float _1637 = abs(_1635);
    bool _1639 = _1637 == 1.0;
    if (_1639)
    {
        return _1629;
    }
    float _1641 = float(_1629);
    float _1643 = _1641 / _1637;
    int _1645 = int(_1643);
    return _1645;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _46 = gl_FragCoord.w;
    float _48 = in.m_33.x;
    float _50 = gl_FragCoord.w;
    float _52 = _48 * _50;
    float _54 = in.m_33.y;
    float _56 = gl_FragCoord.w;
    float _58 = _54 * _56;
    float _60 = 1.0 / _46;
    float _62 = _60 * _52;
    float _64 = _60 * _58;
    float2 _726 = float2(_62, _64);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_726, float2(0.0), isnan(_726))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_726, float2(0.0), isnan(_726))).x;
    float2 _737 = float2(_62, _64);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_737, float2(0.0), isnan(_737))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_737, float2(0.0), isnan(_737))).x;
    float _70 = -_66;
    float _72 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _74 = 1.0 / _72;
    float _76 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _78 = precise::clamp(_76, 0.0, 1.0);
    bool _82 = _74 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    bool _84 = !_82;
    float _86 = _84 ? _78 : 0.0;
    float _88 = precise::max(_68, _86);
    float _90 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _92 = precise::clamp(_90, 0.0, 1.0);
    float _94 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _96 = precise::clamp(_94, 0.0, 1.0);
    bool _98 = _88 != 0.0;
    bool _100 = isnan(_88);
    bool _102 = _98 || _100;
    bool _104 = isnan(0.0);
    bool _106 = _102 || _104;
    float _108 = precise::min(_92, _96);
    bool _110 = !_106;
    if (!_110)
    {
        float _112 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _114 = fma(_88, _112, 1.0);
        float _116 = log2(_114);
        float _118 = _116 + (-1.0);
        float _120 = trunc(_118);
        int _122 = int(_120);
        float _124 = float(_122);
        float _126 = trunc(_124);
        int _128 = int(_126);
        float _130 = _124 + 1.0;
        float _132 = trunc(_130);
        int _134 = int(_132);
        int _136 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_128), spvDescriptorSet0.fp_t_tcb_A.get_height(_128)).x;
        int _138 = _136;
        int _140 = 2;
        int _142 = _42(_138, _140, (*spvDescriptorSet0.support_buffer));
        int _144 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_128), spvDescriptorSet0.fp_t_tcb_A.get_height(_128)).y;
        int _146 = _144;
        int _148 = 2;
        int _150 = _42(_146, _148, (*spvDescriptorSet0.support_buffer));
        int _152 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_134), spvDescriptorSet0.fp_t_tcb_A.get_height(_134)).x;
        int _154 = _152;
        int _156 = 2;
        int _158 = _42(_154, _156, (*spvDescriptorSet0.support_buffer));
        int _160 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_134), spvDescriptorSet0.fp_t_tcb_A.get_height(_134)).y;
        int _162 = _160;
        int _164 = 2;
        int _166 = _42(_162, _164, (*spvDescriptorSet0.support_buffer));
        float _168 = float(_142);
        float _170 = float(_150);
        float _172 = 1.0 / _168;
        float _174 = fma(_62, _168, -0.5);
        float _176 = fma(_64, _170, -0.5);
        float _178 = floor(_174);
        float _180 = floor(_176);
        float _182 = float(_158);
        float _184 = float(_166);
        float _186 = fma(_62, _182, -0.5);
        float _188 = -_178;
        float _190 = _174 + _188;
        float _192 = fma(_64, _184, -0.5);
        float _194 = floor(_186);
        float _196 = _178 + (-0.5);
        float _198 = -_190;
        float _200 = _198 + 1.0;
        float _202 = -_190;
        float _204 = _202 + 2.0;
        float _206 = _200 * _200;
        float _208 = -_180;
        float _210 = _176 + _208;
        float _212 = _204 * _204;
        float _214 = floor(_192);
        float _216 = _200 * _206;
        float _218 = -_210;
        float _220 = _218 + 1.0;
        float _222 = -_210;
        float _224 = _222 + 2.0;
        float _226 = _180 + 1.5;
        float _228 = _216 * 4.0;
        float _230 = _220 * _220;
        float _232 = 1.0 / _170;
        float _234 = -_228;
        float _236 = fma(_204, _212, _234);
        float _238 = -_216;
        float _240 = _238 + 6.0;
        float _242 = _220 * _230;
        float _244 = _224 * _224;
        float _246 = _216 + _236;
        float _248 = -_236;
        float _250 = _248 + _240;
        float _252 = _242 * 4.0;
        float _254 = 1.0 / _182;
        float _256 = _246 * 0.16666667163372039794921875;
        float _258 = _250 * 0.16666667163372039794921875;
        float _260 = -_194;
        float _262 = _186 + _260;
        float _264 = -_252;
        float _266 = fma(_224, _244, _264);
        float _268 = -_242;
        float _270 = _268 + 6.0;
        float _272 = -_214;
        float _274 = _192 + _272;
        float _276 = -_262;
        float _278 = _276 + 1.0;
        float _280 = -_262;
        float _282 = _280 + 2.0;
        float _284 = -_266;
        float _286 = _284 + _270;
        float _288 = -_274;
        float _290 = _288 + 1.0;
        float _292 = _278 * _278;
        float _294 = -_274;
        float _296 = _294 + 2.0;
        float _298 = _286 * 0.16666667163372039794921875;
        float _300 = _290 * _290;
        float _302 = _278 * _292;
        float _304 = _242 + _266;
        float _306 = 1.0 / _256;
        float _308 = _290 * _300;
        float _310 = _282 * _282;
        float _312 = _302 * 4.0;
        float _314 = -_302;
        float _316 = _314 + 6.0;
        float _318 = _308 * 4.0;
        float _320 = -_308;
        float _322 = _320 + 6.0;
        float _324 = -_312;
        float _326 = fma(_282, _310, _324);
        float _328 = _296 * _296;
        float _330 = 1.0 / _258;
        float _332 = _304 * 0.16666667163372039794921875;
        float _334 = -_326;
        float _336 = _334 + _316;
        float _338 = -_318;
        float _340 = fma(_296, _328, _338);
        float _342 = _190 * _190;
        float _344 = _210 * _210;
        float _346 = _336 * 0.16666667163372039794921875;
        float _348 = -_340;
        float _350 = _348 + _322;
        float _352 = _190 * _342;
        float _354 = 1.0 / _298;
        float _356 = _178 + 1.5;
        float _358 = _350 * 0.16666667163372039794921875;
        float _360 = _302 + _326;
        float _362 = _210 * _344;
        float _364 = _236 * 0.16666667163372039794921875;
        float _366 = _352 * 0.16666667163372039794921875;
        float _368 = _360 * 0.16666667163372039794921875;
        float _370 = 1.0 / _332;
        float _372 = _180 + (-0.5);
        float _374 = _308 + _340;
        float _376 = _362 * 0.16666667163372039794921875;
        float _378 = fma(_364, _306, _196);
        float _380 = fma(_366, _330, _356);
        float _382 = _374 * 0.16666667163372039794921875;
        float _384 = _266 * 0.16666667163372039794921875;
        float _386 = 1.0 / _368;
        float _388 = fma(_376, _354, _226);
        float _390 = _378 * _172;
        float _392 = _262 * _262;
        float _394 = _380 * _172;
        float _396 = _274 * _274;
        float _398 = _194 + 1.5;
        float _400 = _262 * _392;
        float _402 = 1.0 / _346;
        float _404 = fma(_384, _370, _372);
        float _406 = _274 * _396;
        float _408 = _194 + (-0.5);
        float _410 = _326 * 0.16666667163372039794921875;
        float _412 = _404 * _232;
        float _414 = _214 + (-0.5);
        float _416 = _400 * 0.16666667163372039794921875;
        float _418 = 1.0 / _382;
        float _420 = _340 * 0.16666667163372039794921875;
        float _422 = _214 + 1.5;
        float _424 = _406 * 0.16666667163372039794921875;
        float _426 = fma(_410, _386, _408);
        float _428 = _388 * _232;
        float _430 = 1.0 / _358;
        float _432 = fma(_416, _402, _398);
        float _434 = 1.0 / _184;
        float _436 = fma(_420, _418, _414);
        float _438 = fma(_424, _430, _422);
        float _440 = _426 * _254;
        float _442 = _432 * _254;
        float2 _1220 = float2(_390, _412);
        float3 _446 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1220, float2(0.0), isnan(_1220)), level(_124)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1220, float2(0.0), isnan(_1220)), level(_124)).xyz;
        float _448 = _446.x;
        float _450 = _446.y;
        float _452 = _446.z;
        float _454 = _436 * _434;
        float _456 = _438 * _434;
        float2 _1241 = float2(_394, _412);
        float3 _458 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1241, float2(0.0), isnan(_1241)), level(_124)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1241, float2(0.0), isnan(_1241)), level(_124)).xyz;
        float _460 = _458.x;
        float _462 = _458.y;
        float _464 = _458.z;
        float2 _1256 = float2(_390, _428);
        float3 _466 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1256, float2(0.0), isnan(_1256)), level(_124)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1256, float2(0.0), isnan(_1256)), level(_124)).xyz;
        float _468 = _466.x;
        float _470 = _466.y;
        float _472 = _466.z;
        float2 _1271 = float2(_394, _428);
        float3 _474 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1271, float2(0.0), isnan(_1271)), level(_124)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1271, float2(0.0), isnan(_1271)), level(_124)).xyz;
        float _476 = _474.x;
        float _478 = _474.y;
        float _480 = _474.z;
        float2 _1286 = float2(_440, _454);
        float3 _482 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1286, float2(0.0), isnan(_1286)), level(_130)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1286, float2(0.0), isnan(_1286)), level(_130)).xyz;
        float _484 = _482.x;
        float _486 = _482.y;
        float _488 = _482.z;
        float2 _1301 = float2(_442, _454);
        float3 _490 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1301, float2(0.0), isnan(_1301)), level(_130)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1301, float2(0.0), isnan(_1301)), level(_130)).xyz;
        float _492 = _490.x;
        float _494 = _490.y;
        float _496 = _490.z;
        float2 _1316 = float2(_440, _456);
        float3 _498 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1316, float2(0.0), isnan(_1316)), level(_130)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1316, float2(0.0), isnan(_1316)), level(_130)).xyz;
        float _500 = _498.x;
        float _502 = _498.y;
        float _504 = _498.z;
        float2 _1331 = float2(_442, _456);
        float3 _506 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1331, float2(0.0), isnan(_1331)), level(_130)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1331, float2(0.0), isnan(_1331)), level(_130)).xyz;
        float _508 = _506.x;
        float _510 = _506.y;
        float _512 = _506.z;
        float _514 = 0.0 + _116;
        float _516 = precise::clamp(_514, 0.0, 1.0);
        float _518 = -_124;
        float _520 = _118 + _518;
        float _522 = precise::clamp(_520, 0.0, 1.0);
        float _524 = -_460;
        float _526 = _448 + _524;
        float _528 = -_462;
        float _530 = _450 + _528;
        float _532 = -_464;
        float _534 = _452 + _532;
        float _536 = fma(_256, _526, _460);
        float _538 = -_478;
        float _540 = _470 + _538;
        float _542 = fma(_256, _530, _462);
        float _544 = -_476;
        float _546 = _468 + _544;
        float _548 = fma(_256, _534, _464);
        float _550 = fma(_256, _540, _478);
        float _552 = -_494;
        float _554 = _486 + _552;
        float _556 = -_492;
        float _558 = _484 + _556;
        float _560 = fma(_256, _546, _476);
        float _562 = -_550;
        float _564 = _562 + _542;
        float _566 = -_510;
        float _568 = _502 + _566;
        float _570 = fma(_368, _554, _494);
        float _572 = -_508;
        float _574 = _500 + _572;
        float _576 = -_480;
        float _578 = _472 + _576;
        float _580 = fma(_368, _568, _510);
        float _582 = fma(_368, _558, _492);
        float _584 = -_496;
        float _586 = _488 + _584;
        float _588 = -_512;
        float _590 = _504 + _588;
        float _592 = fma(_368, _574, _508);
        float _594 = -_580;
        float _596 = _594 + _570;
        float _598 = -_560;
        float _600 = _598 + _536;
        float _602 = fma(_256, _578, _480);
        float _604 = fma(_332, _564, _550);
        float _606 = fma(_368, _586, _496);
        float _608 = fma(_368, _590, _512);
        float _610 = -_592;
        float _612 = _610 + _582;
        float _614 = fma(_382, _596, _580);
        float _616 = fma(_332, _600, _560);
        float _618 = -_602;
        float _620 = _618 + _548;
        float _622 = -_608;
        float _624 = _622 + _606;
        float _626 = fma(_382, _612, _592);
        float _628 = -_604;
        float _630 = _628 + _614;
        float _632 = fma(_332, _620, _602);
        float _634 = fma(_382, _624, _608);
        float _636 = -_616;
        float _638 = _636 + _626;
        float _640 = fma(_522, _630, _604);
        float _642 = -_632;
        float _644 = _642 + _634;
        float _646 = fma(_522, _638, _616);
        float _648 = _640 * 0.586600005626678466796875;
        float _650 = _108 * (*spvDescriptorSet0.fp_c3)._m0[0].w;
        float _652 = fma(_522, _644, _632);
        float _654 = fma(_646, 0.29890000820159912109375, _648);
        float _656 = fma(_652, 0.1143999993801116943359375, _654);
        float _658 = -_646;
        float _660 = _658 + _656;
        float _662 = -_640;
        float _664 = _662 + _656;
        float _666 = -_652;
        float _668 = _666 + _656;
        float _670 = fma(_650, _660, _646);
        float _672 = fma(_650, _664, _640);
        float _674 = fma(_650, _668, _652);
        float _676 = -_670;
        float _678 = fma(_670, (*spvDescriptorSet0.fp_c3)._m0[13].x, _676);
        float _680 = -_672;
        float _682 = fma(_672, (*spvDescriptorSet0.fp_c3)._m0[13].y, _680);
        float _684 = -_674;
        float _686 = fma(_674, (*spvDescriptorSet0.fp_c3)._m0[13].z, _684);
        float _688 = fma(_108, _678, _670);
        float _690 = fma(_108, _682, _672);
        float _692 = fma(_108, _686, _674);
        out.m_36.x = _688;
        out.m_36.y = _690;
        out.m_36.z = _692;
        out.m_36.w = _516;
        return out;
    }
    discard_fragment();
    return out;
}

