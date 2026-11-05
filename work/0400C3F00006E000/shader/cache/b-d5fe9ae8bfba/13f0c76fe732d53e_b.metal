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
int _42(thread const int& _1595, thread const int& _1596, constant _10& support_buffer)
{
    int _1599 = 1 + _1596;
    float _1601 = support_buffer._m5[_1599].x;
    float _1603 = abs(_1601);
    bool _1605 = _1603 == 1.0;
    if (_1605)
    {
        return _1595;
    }
    float _1607 = float(_1595);
    float _1609 = _1607 / _1603;
    int _1611 = int(_1609);
    return _1611;
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
    float2 _714 = float2(_62, _64);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_714, float2(0.0), isnan(_714))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_714, float2(0.0), isnan(_714))).x;
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
    float _94 = _60 * _76;
    float _96 = precise::max(_92, _94);
    float _98 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _100 = precise::clamp(_98, 0.0, 1.0);
    bool _102 = _96 != 0.0;
    bool _104 = isnan(_96);
    bool _106 = _102 || _104;
    bool _108 = isnan(0.0);
    bool _110 = _106 || _108;
    float _112 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _114 = precise::clamp(_112, 0.0, 1.0);
    float _116 = _60 * _82;
    float _118 = _60 * _88;
    float _120 = precise::min(_114, _100);
    bool _122 = !_110;
    if (!_122)
    {
        float _124 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _126 = fma(_96, _124, 1.0);
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
        float _204 = 1.0 / _182;
        float _206 = _190 + (-0.5);
        float _208 = -_202;
        float _210 = _208 + 1.0;
        float _212 = -_202;
        float _214 = _212 + 2.0;
        float _216 = _210 * _210;
        float _218 = _214 * _214;
        float _220 = -_198;
        float _222 = _188 + _220;
        float _224 = floor(_196);
        float _226 = _210 * _216;
        float _228 = fma(_64, _194, -0.5);
        float _230 = -_222;
        float _232 = _230 + 1.0;
        float _234 = _202 * _202;
        float _236 = _226 * 4.0;
        float _238 = -_226;
        float _240 = _238 + 6.0;
        float _242 = _232 * _232;
        float _244 = 1.0 / _194;
        float _246 = -_236;
        float _248 = fma(_214, _218, _246);
        float _250 = -_222;
        float _252 = _250 + 2.0;
        float _254 = _232 * _242;
        float _256 = -_248;
        float _258 = _256 + _240;
        float _260 = _252 * _252;
        float _262 = _254 * 4.0;
        float _264 = floor(_228);
        float _266 = _258 * 0.16666667163372039794921875;
        float _268 = _202 * _234;
        float _270 = -_224;
        float _272 = _196 + _270;
        float _274 = -_262;
        float _276 = fma(_252, _260, _274);
        float _278 = -_254;
        float _280 = _278 + 6.0;
        float _282 = _190 + 1.5;
        float _284 = -_272;
        float _286 = _284 + 1.0;
        float _288 = 1.0 / _266;
        float _290 = _268 * 0.16666667163372039794921875;
        float _292 = -_276;
        float _294 = _292 + _280;
        float _296 = -_264;
        float _298 = _228 + _296;
        float _300 = _286 * _286;
        float _302 = 1.0 / _192;
        float _304 = -_298;
        float _306 = _304 + 2.0;
        float _308 = _286 * _300;
        float _310 = _294 * 0.16666667163372039794921875;
        float _312 = fma(_290, _288, _282);
        float _314 = -_298;
        float _316 = _314 + 1.0;
        float _318 = -_272;
        float _320 = _318 + 2.0;
        float _322 = _308 * 4.0;
        float _324 = _226 + _248;
        float _326 = _316 * _316;
        float _328 = _320 * _320;
        float _330 = 1.0 / _310;
        float _332 = _324 * 0.16666667163372039794921875;
        float _334 = _316 * _326;
        float _336 = -_322;
        float _338 = fma(_320, _328, _336);
        float _340 = _254 + _276;
        float _342 = _306 * _306;
        float _344 = _334 * 4.0;
        float _346 = -_308;
        float _348 = _346 + 6.0;
        float _350 = 1.0 / _332;
        float _352 = _340 * 0.16666667163372039794921875;
        float _354 = -_344;
        float _356 = fma(_306, _342, _354);
        float _358 = -_334;
        float _360 = _358 + 6.0;
        float _362 = _308 + _338;
        float _364 = _248 * 0.16666667163372039794921875;
        float _366 = -_338;
        float _368 = _366 + _348;
        float _370 = -_356;
        float _372 = _370 + _360;
        float _374 = 1.0 / _352;
        float _376 = _334 + _356;
        float _378 = _368 * 0.16666667163372039794921875;
        float _380 = _372 * 0.16666667163372039794921875;
        float _382 = _222 * _222;
        float _384 = _276 * 0.16666667163372039794921875;
        float _386 = _338 * 0.16666667163372039794921875;
        float _388 = _222 * _382;
        float _390 = _362 * 0.16666667163372039794921875;
        float _392 = fma(_364, _350, _206);
        float _394 = _198 + (-0.5);
        float _396 = _198 + 1.5;
        float _398 = 1.0 / _390;
        float _400 = _376 * 0.16666667163372039794921875;
        float _402 = _388 * 0.16666667163372039794921875;
        float _404 = fma(_384, _374, _394);
        float _406 = _272 * _272;
        float _408 = _392 * _184;
        float _410 = fma(_402, _330, _396);
        float _412 = _298 * _298;
        float _414 = 1.0 / _400;
        float _416 = _312 * _184;
        float _418 = _272 * _406;
        float _420 = _404 * _204;
        float _422 = _224 + (-0.5);
        float _424 = _298 * _412;
        float _426 = _410 * _204;
        float _428 = _224 + 1.5;
        float _430 = 1.0 / _378;
        float _432 = _264 + (-0.5);
        float _434 = _356 * 0.16666667163372039794921875;
        float _436 = fma(_386, _398, _422);
        float _438 = _264 + 1.5;
        float _440 = _418 * 0.16666667163372039794921875;
        float _442 = _424 * 0.16666667163372039794921875;
        float _444 = 1.0 / _380;
        float _446 = fma(_434, _414, _432);
        float _448 = _436 * _302;
        float2 _1214 = float2(_408, _420);
        float3 _452 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1214, float2(0.0), isnan(_1214)), level(_136)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1214, float2(0.0), isnan(_1214)), level(_136)).xyz;
        float _454 = _452.x;
        float _456 = _452.y;
        float _458 = _452.z;
        float2 _1229 = float2(_416, _420);
        float3 _460 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1229, float2(0.0), isnan(_1229)), level(_136)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1229, float2(0.0), isnan(_1229)), level(_136)).xyz;
        float _462 = _460.x;
        float _464 = _460.y;
        float _466 = _460.z;
        float _468 = fma(_440, _430, _428);
        float _470 = _468 * _302;
        float _472 = fma(_442, _444, _438);
        float _474 = _446 * _244;
        float _476 = _472 * _244;
        float2 _1261 = float2(_408, _426);
        float3 _478 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1261, float2(0.0), isnan(_1261)), level(_136)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1261, float2(0.0), isnan(_1261)), level(_136)).xyz;
        float _480 = _478.x;
        float _482 = _478.y;
        float _484 = _478.z;
        float2 _1276 = float2(_416, _426);
        float3 _486 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1276, float2(0.0), isnan(_1276)), level(_136)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1276, float2(0.0), isnan(_1276)), level(_136)).xyz;
        float _488 = _486.x;
        float _490 = _486.y;
        float _492 = _486.z;
        float2 _1291 = float2(_448, _474);
        float3 _494 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1291, float2(0.0), isnan(_1291)), level(_142)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1291, float2(0.0), isnan(_1291)), level(_142)).xyz;
        float _496 = _494.x;
        float _498 = _494.y;
        float _500 = _494.z;
        float2 _1306 = float2(_470, _474);
        float3 _502 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1306, float2(0.0), isnan(_1306)), level(_142)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1306, float2(0.0), isnan(_1306)), level(_142)).xyz;
        float _504 = _502.x;
        float _506 = _502.y;
        float _508 = _502.z;
        float2 _1321 = float2(_448, _476);
        float3 _510 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1321, float2(0.0), isnan(_1321)), level(_142)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1321, float2(0.0), isnan(_1321)), level(_142)).xyz;
        float _512 = _510.x;
        float _514 = _510.y;
        float _516 = _510.z;
        float2 _1336 = float2(_470, _476);
        float3 _518 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1336, float2(0.0), isnan(_1336)), level(_142)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1336, float2(0.0), isnan(_1336)), level(_142)).xyz;
        float _520 = _518.x;
        float _522 = _518.y;
        float _524 = _518.z;
        float _526 = 0.0 + _128;
        float _528 = precise::clamp(_526, 0.0, 1.0);
        float _530 = fma(_118, _528, _116);
        float _532 = -_462;
        float _534 = _454 + _532;
        float _536 = -_464;
        float _538 = _456 + _536;
        float _540 = -_466;
        float _542 = _458 + _540;
        float _544 = fma(_332, _534, _462);
        float _546 = fma(_332, _538, _464);
        float _548 = fma(_332, _542, _466);
        float _550 = -_490;
        float _552 = _482 + _550;
        float _554 = -_488;
        float _556 = _480 + _554;
        float _558 = -_492;
        float _560 = _484 + _558;
        float _562 = fma(_332, _552, _490);
        float _564 = fma(_332, _556, _488);
        float _566 = -_136;
        float _568 = _130 + _566;
        float _570 = precise::clamp(_568, 0.0, 1.0);
        float _572 = -_506;
        float _574 = _498 + _572;
        float _576 = -_562;
        float _578 = _576 + _546;
        float _580 = -_504;
        float _582 = _496 + _580;
        float _584 = -_508;
        float _586 = _500 + _584;
        float _588 = fma(_390, _574, _506);
        float _590 = fma(_352, _578, _562);
        float _592 = -_520;
        float _594 = _512 + _592;
        float _596 = -_522;
        float _598 = _514 + _596;
        float _600 = -_524;
        float _602 = _516 + _600;
        float _604 = fma(_390, _582, _504);
        float _606 = fma(_390, _594, _520);
        float _608 = fma(_390, _598, _522);
        float _610 = fma(_332, _560, _492);
        float _612 = fma(_390, _586, _508);
        float _614 = fma(_390, _602, _524);
        float _616 = -_564;
        float _618 = _616 + _544;
        float _620 = -_606;
        float _622 = _620 + _604;
        float _624 = -_608;
        float _626 = _624 + _588;
        float _628 = -_610;
        float _630 = _628 + _548;
        float _632 = -_614;
        float _634 = _632 + _612;
        float _636 = fma(_352, _618, _564);
        float _638 = fma(_400, _622, _606);
        float _640 = fma(_400, _626, _608);
        float _642 = fma(_352, _630, _610);
        float _644 = fma(_400, _634, _614);
        float _646 = -_636;
        float _648 = _646 + _638;
        float _650 = -_590;
        float _652 = _650 + _640;
        float _654 = -_642;
        float _656 = _654 + _644;
        float _658 = fma(_570, _648, _636);
        float _660 = fma(_570, _652, _590);
        float _662 = fma(_570, _656, _642);
        float _664 = -_658;
        float _666 = fma(_658, (*spvDescriptorSet0.fp_c3)._m0[13].x, _664);
        float _668 = -_660;
        float _670 = fma(_660, (*spvDescriptorSet0.fp_c3)._m0[13].y, _668);
        float _672 = -_662;
        float _674 = fma(_662, (*spvDescriptorSet0.fp_c3)._m0[13].z, _672);
        float _676 = fma(_120, _666, _658);
        float _678 = fma(_120, _670, _660);
        float _680 = fma(_120, _674, _662);
        out.m_34.x = _676;
        out.m_34.y = _678;
        out.m_34.z = _680;
        out.m_34.w = _530;
        return out;
    }
    discard_fragment();
    return out;
}

