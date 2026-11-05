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
int _40(thread const int& _1597, thread const int& _1598, constant _10& support_buffer)
{
    int _1601 = 1 + _1598;
    float _1603 = support_buffer._m5[_1601].x;
    float _1605 = abs(_1603);
    bool _1607 = _1605 == 1.0;
    if (_1607)
    {
        return _1597;
    }
    float _1609 = float(_1597);
    float _1611 = _1609 / _1605;
    int _1613 = int(_1611);
    return _1613;
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
    float2 _714 = float2(_60, _62);
    float _64 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_714, float2(0.0), isnan(_714))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_714, float2(0.0), isnan(_714))).x;
    float _66 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _68 = precise::clamp(_66, 0.0, 1.0);
    float _70 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[4].y, (*spvDescriptorSet0.fp_c3)._m0[5].y);
    float _72 = precise::clamp(_70, 0.0, 1.0);
    float _74 = precise::max(_68, _72);
    bool _78 = _74 != 0.0;
    bool _80 = isnan(_74);
    bool _82 = _78 || _80;
    bool _84 = isnan(0.0);
    bool _86 = _82 || _84;
    float _88 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _90 = precise::clamp(_88, 0.0, 1.0);
    float _92 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _94 = precise::clamp(_92, 0.0, 1.0);
    float _96 = precise::min(_90, _94);
    bool _98 = !_86;
    if (!_98)
    {
        float _100 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _102 = fma(_74, _100, 1.0);
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
        float _180 = fma(_62, _172, -0.5);
        float _182 = floor(_174);
        float _184 = _166 + (-0.5);
        float _186 = -_178;
        float _188 = _186 + 1.0;
        float _190 = -_178;
        float _192 = _190 + 2.0;
        float _194 = _188 * _188;
        float _196 = -_168;
        float _198 = _164 + _196;
        float _200 = _192 * _192;
        float _202 = floor(_180);
        float _204 = _188 * _194;
        float _206 = -_198;
        float _208 = _206 + 1.0;
        float _210 = -_198;
        float _212 = _210 + 2.0;
        float _214 = _168 + 1.5;
        float _216 = _204 * 4.0;
        float _218 = _208 * _208;
        float _220 = 1.0 / _158;
        float _222 = -_216;
        float _224 = fma(_192, _200, _222);
        float _226 = -_204;
        float _228 = _226 + 6.0;
        float _230 = _208 * _218;
        float _232 = _212 * _212;
        float _234 = _204 + _224;
        float _236 = -_224;
        float _238 = _236 + _228;
        float _240 = _230 * 4.0;
        float _242 = 1.0 / _170;
        float _244 = _234 * 0.16666667163372039794921875;
        float _246 = _238 * 0.16666667163372039794921875;
        float _248 = -_182;
        float _250 = _174 + _248;
        float _252 = -_240;
        float _254 = fma(_212, _232, _252);
        float _256 = -_230;
        float _258 = _256 + 6.0;
        float _260 = -_202;
        float _262 = _180 + _260;
        float _264 = -_250;
        float _266 = _264 + 1.0;
        float _268 = -_250;
        float _270 = _268 + 2.0;
        float _272 = -_254;
        float _274 = _272 + _258;
        float _276 = -_262;
        float _278 = _276 + 1.0;
        float _280 = _266 * _266;
        float _282 = -_262;
        float _284 = _282 + 2.0;
        float _286 = _274 * 0.16666667163372039794921875;
        float _288 = _278 * _278;
        float _290 = _266 * _280;
        float _292 = _230 + _254;
        float _294 = 1.0 / _244;
        float _296 = _278 * _288;
        float _298 = _270 * _270;
        float _300 = _290 * 4.0;
        float _302 = -_290;
        float _304 = _302 + 6.0;
        float _306 = _296 * 4.0;
        float _308 = -_296;
        float _310 = _308 + 6.0;
        float _312 = -_300;
        float _314 = fma(_270, _298, _312);
        float _316 = _284 * _284;
        float _318 = 1.0 / _246;
        float _320 = _292 * 0.16666667163372039794921875;
        float _322 = -_314;
        float _324 = _322 + _304;
        float _326 = -_306;
        float _328 = fma(_284, _316, _326);
        float _330 = _178 * _178;
        float _332 = _198 * _198;
        float _334 = _324 * 0.16666667163372039794921875;
        float _336 = -_328;
        float _338 = _336 + _310;
        float _340 = _178 * _330;
        float _342 = 1.0 / _286;
        float _344 = _166 + 1.5;
        float _346 = _338 * 0.16666667163372039794921875;
        float _348 = _290 + _314;
        float _350 = _198 * _332;
        float _352 = _224 * 0.16666667163372039794921875;
        float _354 = _340 * 0.16666667163372039794921875;
        float _356 = _348 * 0.16666667163372039794921875;
        float _358 = 1.0 / _320;
        float _360 = _168 + (-0.5);
        float _362 = _296 + _328;
        float _364 = _350 * 0.16666667163372039794921875;
        float _366 = fma(_352, _294, _184);
        float _368 = fma(_354, _318, _344);
        float _370 = _362 * 0.16666667163372039794921875;
        float _372 = _254 * 0.16666667163372039794921875;
        float _374 = 1.0 / _356;
        float _376 = fma(_364, _342, _214);
        float _378 = _366 * _160;
        float _380 = _250 * _250;
        float _382 = _368 * _160;
        float _384 = _262 * _262;
        float _386 = _182 + 1.5;
        float _388 = _250 * _380;
        float _390 = 1.0 / _334;
        float _392 = fma(_372, _358, _360);
        float _394 = _262 * _384;
        float _396 = _182 + (-0.5);
        float _398 = _314 * 0.16666667163372039794921875;
        float _400 = _392 * _220;
        float _402 = _202 + (-0.5);
        float _404 = _388 * 0.16666667163372039794921875;
        float _406 = 1.0 / _370;
        float _408 = _328 * 0.16666667163372039794921875;
        float _410 = _202 + 1.5;
        float _412 = _394 * 0.16666667163372039794921875;
        float _414 = fma(_398, _374, _396);
        float _416 = _376 * _220;
        float _418 = 1.0 / _346;
        float _420 = fma(_404, _390, _386);
        float _422 = 1.0 / _172;
        float _424 = fma(_408, _406, _402);
        float _426 = fma(_412, _418, _410);
        float _428 = _414 * _242;
        float _430 = _420 * _242;
        float2 _1188 = float2(_378, _400);
        float3 _434 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1188, float2(0.0), isnan(_1188)), level(_112)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1188, float2(0.0), isnan(_1188)), level(_112)).xyz;
        float _436 = _434.x;
        float _438 = _434.y;
        float _440 = _434.z;
        float _442 = _424 * _422;
        float _444 = _426 * _422;
        float2 _1209 = float2(_382, _400);
        float3 _446 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1209, float2(0.0), isnan(_1209)), level(_112)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1209, float2(0.0), isnan(_1209)), level(_112)).xyz;
        float _448 = _446.x;
        float _450 = _446.y;
        float _452 = _446.z;
        float2 _1224 = float2(_378, _416);
        float3 _454 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1224, float2(0.0), isnan(_1224)), level(_112)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1224, float2(0.0), isnan(_1224)), level(_112)).xyz;
        float _456 = _454.x;
        float _458 = _454.y;
        float _460 = _454.z;
        float2 _1239 = float2(_382, _416);
        float3 _462 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1239, float2(0.0), isnan(_1239)), level(_112)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1239, float2(0.0), isnan(_1239)), level(_112)).xyz;
        float _464 = _462.x;
        float _466 = _462.y;
        float _468 = _462.z;
        float2 _1254 = float2(_428, _442);
        float3 _470 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1254, float2(0.0), isnan(_1254)), level(_118)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1254, float2(0.0), isnan(_1254)), level(_118)).xyz;
        float _472 = _470.x;
        float _474 = _470.y;
        float _476 = _470.z;
        float2 _1269 = float2(_430, _442);
        float3 _478 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1269, float2(0.0), isnan(_1269)), level(_118)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1269, float2(0.0), isnan(_1269)), level(_118)).xyz;
        float _480 = _478.x;
        float _482 = _478.y;
        float _484 = _478.z;
        float2 _1284 = float2(_428, _444);
        float3 _486 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1284, float2(0.0), isnan(_1284)), level(_118)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1284, float2(0.0), isnan(_1284)), level(_118)).xyz;
        float _488 = _486.x;
        float _490 = _486.y;
        float _492 = _486.z;
        float2 _1299 = float2(_430, _444);
        float3 _494 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1299, float2(0.0), isnan(_1299)), level(_118)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1299, float2(0.0), isnan(_1299)), level(_118)).xyz;
        float _496 = _494.x;
        float _498 = _494.y;
        float _500 = _494.z;
        float _502 = 0.0 + _104;
        float _504 = precise::clamp(_502, 0.0, 1.0);
        float _506 = -_112;
        float _508 = _106 + _506;
        float _510 = precise::clamp(_508, 0.0, 1.0);
        float _512 = -_448;
        float _514 = _436 + _512;
        float _516 = -_450;
        float _518 = _438 + _516;
        float _520 = -_452;
        float _522 = _440 + _520;
        float _524 = fma(_244, _514, _448);
        float _526 = -_466;
        float _528 = _458 + _526;
        float _530 = fma(_244, _518, _450);
        float _532 = -_464;
        float _534 = _456 + _532;
        float _536 = fma(_244, _522, _452);
        float _538 = fma(_244, _528, _466);
        float _540 = -_482;
        float _542 = _474 + _540;
        float _544 = -_480;
        float _546 = _472 + _544;
        float _548 = fma(_244, _534, _464);
        float _550 = -_538;
        float _552 = _550 + _530;
        float _554 = -_498;
        float _556 = _490 + _554;
        float _558 = fma(_356, _542, _482);
        float _560 = -_496;
        float _562 = _488 + _560;
        float _564 = -_468;
        float _566 = _460 + _564;
        float _568 = fma(_356, _556, _498);
        float _570 = fma(_356, _546, _480);
        float _572 = -_484;
        float _574 = _476 + _572;
        float _576 = -_500;
        float _578 = _492 + _576;
        float _580 = fma(_356, _562, _496);
        float _582 = -_568;
        float _584 = _582 + _558;
        float _586 = -_548;
        float _588 = _586 + _524;
        float _590 = fma(_244, _566, _468);
        float _592 = fma(_320, _552, _538);
        float _594 = fma(_356, _574, _484);
        float _596 = fma(_356, _578, _500);
        float _598 = -_580;
        float _600 = _598 + _570;
        float _602 = fma(_370, _584, _568);
        float _604 = fma(_320, _588, _548);
        float _606 = -_590;
        float _608 = _606 + _536;
        float _610 = -_596;
        float _612 = _610 + _594;
        float _614 = fma(_370, _600, _580);
        float _616 = -_592;
        float _618 = _616 + _602;
        float _620 = fma(_320, _608, _590);
        float _622 = fma(_370, _612, _596);
        float _624 = -_604;
        float _626 = _624 + _614;
        float _628 = fma(_510, _618, _592);
        float _630 = -_620;
        float _632 = _630 + _622;
        float _634 = fma(_510, _626, _604);
        float _636 = _628 * 0.586600005626678466796875;
        float _638 = _96 * (*spvDescriptorSet0.fp_c3)._m0[0].w;
        float _640 = fma(_510, _632, _620);
        float _642 = fma(_634, 0.29890000820159912109375, _636);
        float _644 = fma(_640, 0.1143999993801116943359375, _642);
        float _646 = -_634;
        float _648 = _646 + _644;
        float _650 = -_628;
        float _652 = _650 + _644;
        float _654 = -_640;
        float _656 = _654 + _644;
        float _658 = fma(_638, _648, _634);
        float _660 = fma(_638, _652, _628);
        float _662 = fma(_638, _656, _640);
        float _664 = -_658;
        float _666 = fma(_658, (*spvDescriptorSet0.fp_c3)._m0[13].x, _664);
        float _668 = -_660;
        float _670 = fma(_660, (*spvDescriptorSet0.fp_c3)._m0[13].y, _668);
        float _672 = -_662;
        float _674 = fma(_662, (*spvDescriptorSet0.fp_c3)._m0[13].z, _672);
        float _676 = fma(_96, _666, _658);
        float _678 = fma(_96, _670, _660);
        float _680 = fma(_96, _674, _662);
        out.m_34.x = _676;
        out.m_34.y = _678;
        out.m_34.z = _680;
        out.m_34.w = _504;
        return out;
    }
    discard_fragment();
    return out;
}

