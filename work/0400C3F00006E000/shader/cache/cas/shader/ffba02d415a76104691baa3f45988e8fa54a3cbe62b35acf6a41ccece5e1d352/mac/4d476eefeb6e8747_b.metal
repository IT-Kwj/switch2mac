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
    float4 m_36 [[color(0)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0)]];
    float4 m_33 [[user(locn1)]];
};

static inline __attribute__((always_inline))
int _42(thread const int& _1596, thread const int& _1597, constant _10& support_buffer)
{
    int _1600 = 1 + _1597;
    float _1602 = support_buffer._m5[_1600].x;
    float _1604 = abs(_1602);
    bool _1606 = _1604 == 1.0;
    if (_1606)
    {
        return _1596;
    }
    float _1608 = float(_1596);
    float _1610 = _1608 / _1604;
    int _1612 = int(_1610);
    return _1612;
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
    float2 _718 = float2(_62, _64);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_718, float2(0.0), isnan(_718))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_718, float2(0.0), isnan(_718))).x;
    float _68 = in.m_33.x;
    float _70 = gl_FragCoord.w;
    float _72 = _68 * _70;
    float _74 = in.m_33.y;
    float _76 = gl_FragCoord.w;
    float _78 = _74 * _76;
    float _80 = in.m_33.z;
    float _82 = gl_FragCoord.w;
    float _84 = _80 * _82;
    float _86 = _60 * _72;
    float _88 = _60 * _78;
    float _90 = _60 * _84;
    float _92 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _94 = precise::clamp(_92, 0.0, 1.0);
    float _96 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[4].y, (*spvDescriptorSet0.fp_c3)._m0[5].y);
    float _98 = precise::clamp(_96, 0.0, 1.0);
    float _100 = precise::max(_94, _98);
    float _102 = precise::max(_100, _90);
    bool _106 = _102 != 0.0;
    bool _108 = isnan(_102);
    bool _110 = _106 || _108;
    bool _112 = isnan(0.0);
    bool _114 = _110 || _112;
    float _116 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _118 = precise::clamp(_116, 0.0, 1.0);
    float _120 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _122 = precise::clamp(_120, 0.0, 1.0);
    float _124 = precise::min(_118, _122);
    bool _126 = !_114;
    if (!_126)
    {
        float _128 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _130 = fma(_102, _128, 1.0);
        float _132 = log2(_130);
        float _134 = _132 + (-1.0);
        float _136 = trunc(_134);
        int _138 = int(_136);
        float _140 = float(_138);
        float _142 = trunc(_140);
        int _144 = int(_142);
        float _146 = _140 + 1.0;
        float _148 = trunc(_146);
        int _150 = int(_148);
        int _152 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_144), spvDescriptorSet0.fp_t_tcb_A.get_height(_144)).x;
        int _154 = _152;
        int _156 = 1;
        int _158 = _42(_154, _156, (*spvDescriptorSet0.support_buffer));
        int _160 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_144), spvDescriptorSet0.fp_t_tcb_A.get_height(_144)).y;
        int _162 = _160;
        int _164 = 1;
        int _166 = _42(_162, _164, (*spvDescriptorSet0.support_buffer));
        int _168 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_150), spvDescriptorSet0.fp_t_tcb_A.get_height(_150)).x;
        int _170 = _168;
        int _172 = 1;
        int _174 = _42(_170, _172, (*spvDescriptorSet0.support_buffer));
        int _176 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_150), spvDescriptorSet0.fp_t_tcb_A.get_height(_150)).y;
        int _178 = _176;
        int _180 = 1;
        int _182 = _42(_178, _180, (*spvDescriptorSet0.support_buffer));
        float _184 = float(_158);
        float _186 = float(_166);
        float _188 = 1.0 / _184;
        float _190 = fma(_62, _184, -0.5);
        float _192 = fma(_64, _186, -0.5);
        float _194 = floor(_190);
        float _196 = float(_174);
        float _198 = float(_182);
        float _200 = fma(_62, _196, -0.5);
        float _202 = floor(_192);
        float _204 = -_194;
        float _206 = _190 + _204;
        float _208 = 1.0 / _186;
        float _210 = _194 + (-0.5);
        float _212 = -_206;
        float _214 = _212 + 1.0;
        float _216 = -_206;
        float _218 = _216 + 2.0;
        float _220 = _214 * _214;
        float _222 = _218 * _218;
        float _224 = -_202;
        float _226 = _192 + _224;
        float _228 = floor(_200);
        float _230 = _214 * _220;
        float _232 = fma(_64, _198, -0.5);
        float _234 = -_226;
        float _236 = _234 + 1.0;
        float _238 = _206 * _206;
        float _240 = _230 * 4.0;
        float _242 = -_230;
        float _244 = _242 + 6.0;
        float _246 = _236 * _236;
        float _248 = 1.0 / _198;
        float _250 = -_240;
        float _252 = fma(_218, _222, _250);
        float _254 = -_226;
        float _256 = _254 + 2.0;
        float _258 = _236 * _246;
        float _260 = -_252;
        float _262 = _260 + _244;
        float _264 = _256 * _256;
        float _266 = _258 * 4.0;
        float _268 = floor(_232);
        float _270 = _262 * 0.16666667163372039794921875;
        float _272 = _206 * _238;
        float _274 = -_228;
        float _276 = _200 + _274;
        float _278 = -_266;
        float _280 = fma(_256, _264, _278);
        float _282 = -_258;
        float _284 = _282 + 6.0;
        float _286 = _194 + 1.5;
        float _288 = -_276;
        float _290 = _288 + 1.0;
        float _292 = 1.0 / _270;
        float _294 = _272 * 0.16666667163372039794921875;
        float _296 = -_280;
        float _298 = _296 + _284;
        float _300 = -_268;
        float _302 = _232 + _300;
        float _304 = _290 * _290;
        float _306 = 1.0 / _196;
        float _308 = -_302;
        float _310 = _308 + 2.0;
        float _312 = _290 * _304;
        float _314 = _298 * 0.16666667163372039794921875;
        float _316 = fma(_294, _292, _286);
        float _318 = -_302;
        float _320 = _318 + 1.0;
        float _322 = -_276;
        float _324 = _322 + 2.0;
        float _326 = _312 * 4.0;
        float _328 = _230 + _252;
        float _330 = _320 * _320;
        float _332 = _324 * _324;
        float _334 = 1.0 / _314;
        float _336 = _328 * 0.16666667163372039794921875;
        float _338 = _320 * _330;
        float _340 = -_326;
        float _342 = fma(_324, _332, _340);
        float _344 = _258 + _280;
        float _346 = _310 * _310;
        float _348 = _338 * 4.0;
        float _350 = -_312;
        float _352 = _350 + 6.0;
        float _354 = 1.0 / _336;
        float _356 = _344 * 0.16666667163372039794921875;
        float _358 = -_348;
        float _360 = fma(_310, _346, _358);
        float _362 = -_338;
        float _364 = _362 + 6.0;
        float _366 = _312 + _342;
        float _368 = _252 * 0.16666667163372039794921875;
        float _370 = -_342;
        float _372 = _370 + _352;
        float _374 = -_360;
        float _376 = _374 + _364;
        float _378 = 1.0 / _356;
        float _380 = _338 + _360;
        float _382 = _372 * 0.16666667163372039794921875;
        float _384 = _376 * 0.16666667163372039794921875;
        float _386 = _226 * _226;
        float _388 = _280 * 0.16666667163372039794921875;
        float _390 = _342 * 0.16666667163372039794921875;
        float _392 = _226 * _386;
        float _394 = _366 * 0.16666667163372039794921875;
        float _396 = fma(_368, _354, _210);
        float _398 = _202 + (-0.5);
        float _400 = _202 + 1.5;
        float _402 = 1.0 / _394;
        float _404 = _380 * 0.16666667163372039794921875;
        float _406 = _392 * 0.16666667163372039794921875;
        float _408 = fma(_388, _378, _398);
        float _410 = _276 * _276;
        float _412 = _396 * _188;
        float _414 = fma(_406, _334, _400);
        float _416 = _302 * _302;
        float _418 = 1.0 / _404;
        float _420 = _316 * _188;
        float _422 = _276 * _410;
        float _424 = _408 * _208;
        float _426 = _228 + (-0.5);
        float _428 = _302 * _416;
        float _430 = _414 * _208;
        float _432 = _228 + 1.5;
        float _434 = 1.0 / _382;
        float _436 = _268 + (-0.5);
        float _438 = _360 * 0.16666667163372039794921875;
        float _440 = fma(_390, _402, _426);
        float _442 = _268 + 1.5;
        float _444 = _422 * 0.16666667163372039794921875;
        float _446 = _428 * 0.16666667163372039794921875;
        float _448 = 1.0 / _384;
        float _450 = fma(_438, _418, _436);
        float _452 = _440 * _306;
        float2 _1214 = float2(_412, _424);
        float3 _456 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1214, float2(0.0), isnan(_1214)), level(_140)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1214, float2(0.0), isnan(_1214)), level(_140)).xyz;
        float _458 = _456.x;
        float _460 = _456.y;
        float _462 = _456.z;
        float2 _1229 = float2(_420, _424);
        float3 _464 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1229, float2(0.0), isnan(_1229)), level(_140)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1229, float2(0.0), isnan(_1229)), level(_140)).xyz;
        float _466 = _464.x;
        float _468 = _464.y;
        float _470 = _464.z;
        float _472 = fma(_444, _434, _432);
        float _474 = _472 * _306;
        float _476 = fma(_446, _448, _442);
        float _478 = _450 * _248;
        float _480 = _476 * _248;
        float2 _1261 = float2(_412, _430);
        float3 _482 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1261, float2(0.0), isnan(_1261)), level(_140)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1261, float2(0.0), isnan(_1261)), level(_140)).xyz;
        float _484 = _482.x;
        float _486 = _482.y;
        float _488 = _482.z;
        float2 _1276 = float2(_420, _430);
        float3 _490 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1276, float2(0.0), isnan(_1276)), level(_140)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1276, float2(0.0), isnan(_1276)), level(_140)).xyz;
        float _492 = _490.x;
        float _494 = _490.y;
        float _496 = _490.z;
        float2 _1291 = float2(_452, _478);
        float3 _498 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1291, float2(0.0), isnan(_1291)), level(_146)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1291, float2(0.0), isnan(_1291)), level(_146)).xyz;
        float _500 = _498.x;
        float _502 = _498.y;
        float _504 = _498.z;
        float2 _1306 = float2(_474, _478);
        float3 _506 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1306, float2(0.0), isnan(_1306)), level(_146)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1306, float2(0.0), isnan(_1306)), level(_146)).xyz;
        float _508 = _506.x;
        float _510 = _506.y;
        float _512 = _506.z;
        float2 _1321 = float2(_452, _480);
        float3 _514 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1321, float2(0.0), isnan(_1321)), level(_146)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1321, float2(0.0), isnan(_1321)), level(_146)).xyz;
        float _516 = _514.x;
        float _518 = _514.y;
        float _520 = _514.z;
        float2 _1336 = float2(_474, _480);
        float3 _522 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1336, float2(0.0), isnan(_1336)), level(_146)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1336, float2(0.0), isnan(_1336)), level(_146)).xyz;
        float _524 = _522.x;
        float _526 = _522.y;
        float _528 = _522.z;
        float _530 = 0.0 + _132;
        float _532 = precise::clamp(_530, 0.0, 1.0);
        float _534 = fma(_88, _532, _86);
        float _536 = -_466;
        float _538 = _458 + _536;
        float _540 = -_468;
        float _542 = _460 + _540;
        float _544 = -_470;
        float _546 = _462 + _544;
        float _548 = fma(_336, _538, _466);
        float _550 = fma(_336, _542, _468);
        float _552 = fma(_336, _546, _470);
        float _554 = -_494;
        float _556 = _486 + _554;
        float _558 = -_492;
        float _560 = _484 + _558;
        float _562 = -_496;
        float _564 = _488 + _562;
        float _566 = fma(_336, _556, _494);
        float _568 = fma(_336, _560, _492);
        float _570 = -_140;
        float _572 = _134 + _570;
        float _574 = precise::clamp(_572, 0.0, 1.0);
        float _576 = -_510;
        float _578 = _502 + _576;
        float _580 = -_566;
        float _582 = _580 + _550;
        float _584 = -_508;
        float _586 = _500 + _584;
        float _588 = -_512;
        float _590 = _504 + _588;
        float _592 = fma(_394, _578, _510);
        float _594 = fma(_356, _582, _566);
        float _596 = -_524;
        float _598 = _516 + _596;
        float _600 = -_526;
        float _602 = _518 + _600;
        float _604 = -_528;
        float _606 = _520 + _604;
        float _608 = fma(_394, _586, _508);
        float _610 = fma(_394, _598, _524);
        float _612 = fma(_394, _602, _526);
        float _614 = fma(_336, _564, _496);
        float _616 = fma(_394, _590, _512);
        float _618 = fma(_394, _606, _528);
        float _620 = -_568;
        float _622 = _620 + _548;
        float _624 = -_610;
        float _626 = _624 + _608;
        float _628 = -_612;
        float _630 = _628 + _592;
        float _632 = -_614;
        float _634 = _632 + _552;
        float _636 = -_618;
        float _638 = _636 + _616;
        float _640 = fma(_356, _622, _568);
        float _642 = fma(_404, _626, _610);
        float _644 = fma(_404, _630, _612);
        float _646 = fma(_356, _634, _614);
        float _648 = fma(_404, _638, _618);
        float _650 = -_640;
        float _652 = _650 + _642;
        float _654 = -_594;
        float _656 = _654 + _644;
        float _658 = -_646;
        float _660 = _658 + _648;
        float _662 = fma(_574, _652, _640);
        float _664 = fma(_574, _656, _594);
        float _666 = fma(_574, _660, _646);
        float _668 = -_662;
        float _670 = fma(_662, (*spvDescriptorSet0.fp_c3)._m0[13].x, _668);
        float _672 = -_664;
        float _674 = fma(_664, (*spvDescriptorSet0.fp_c3)._m0[13].y, _672);
        float _676 = -_666;
        float _678 = fma(_666, (*spvDescriptorSet0.fp_c3)._m0[13].z, _676);
        float _680 = fma(_124, _670, _662);
        float _682 = fma(_124, _674, _664);
        float _684 = fma(_124, _678, _666);
        out.m_36.x = _680;
        out.m_36.y = _682;
        out.m_36.z = _684;
        out.m_36.w = _534;
        return out;
    }
    discard_fragment();
    return out;
}

