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
int _40(thread const int& _1529, thread const int& _1530, constant _10& support_buffer)
{
    int _1533 = 1 + _1530;
    float _1535 = support_buffer._m5[_1533].x;
    float _1537 = abs(_1535);
    bool _1539 = _1537 == 1.0;
    if (_1539)
    {
        return _1529;
    }
    float _1541 = float(_1529);
    float _1543 = _1541 / _1537;
    int _1545 = int(_1543);
    return _1545;
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
    float2 _688 = float2(_60, _62);
    float _64 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_688, float2(0.0), isnan(_688))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_688, float2(0.0), isnan(_688))).x;
    float _66 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _68 = precise::clamp(_66, 0.0, 1.0);
    float _70 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[4].y, (*spvDescriptorSet0.fp_c3)._m0[5].y);
    float _72 = precise::clamp(_70, 0.0, 1.0);
    float _74 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _76 = precise::clamp(_74, 0.0, 1.0);
    float _78 = precise::max(_68, _72);
    float _80 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _82 = precise::clamp(_80, 0.0, 1.0);
    bool _86 = _78 != 0.0;
    bool _88 = isnan(_78);
    bool _90 = _86 || _88;
    bool _92 = isnan(0.0);
    bool _94 = _90 || _92;
    float _96 = precise::min(_82, _76);
    bool _98 = !_94;
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
        float _294 = 1.0 / _246;
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
        float _318 = 1.0 / _286;
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
        float _342 = 1.0 / _244;
        float _344 = _166 + 1.5;
        float _346 = _338 * 0.16666667163372039794921875;
        float _348 = _290 + _314;
        float _350 = _198 * _332;
        float _352 = _340 * 0.16666667163372039794921875;
        float _354 = _224 * 0.16666667163372039794921875;
        float _356 = _348 * 0.16666667163372039794921875;
        float _358 = _168 + (-0.5);
        float _360 = _296 + _328;
        float _362 = 1.0 / _320;
        float _364 = fma(_352, _294, _344);
        float _366 = _350 * 0.16666667163372039794921875;
        float _368 = _360 * 0.16666667163372039794921875;
        float _370 = _254 * 0.16666667163372039794921875;
        float _372 = _262 * _262;
        float _374 = fma(_366, _318, _214);
        float _376 = _250 * _250;
        float _378 = 1.0 / _356;
        float _380 = fma(_354, _342, _184);
        float _382 = _262 * _372;
        float _384 = _250 * _376;
        float _386 = _182 + (-0.5);
        float _388 = _380 * _160;
        float _390 = _364 * _160;
        float _392 = _182 + 1.5;
        float _394 = 1.0 / _334;
        float _396 = fma(_370, _362, _358);
        float _398 = _314 * 0.16666667163372039794921875;
        float _400 = _202 + (-0.5);
        float _402 = _384 * 0.16666667163372039794921875;
        float _404 = _328 * 0.16666667163372039794921875;
        float _406 = _396 * _220;
        float _408 = _202 + 1.5;
        float _410 = 1.0 / _368;
        float _412 = _382 * 0.16666667163372039794921875;
        float _414 = fma(_398, _378, _386);
        float _416 = _374 * _220;
        float _418 = 1.0 / _346;
        float _420 = fma(_402, _394, _392);
        float _422 = 1.0 / _172;
        float _424 = fma(_404, _410, _400);
        float2 _1152 = float2(_388, _406);
        float3 _428 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1152, float2(0.0), isnan(_1152)), level(_112)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1152, float2(0.0), isnan(_1152)), level(_112)).xyz;
        float _430 = _428.x;
        float _432 = _428.y;
        float _434 = _428.z;
        float _436 = fma(_412, _418, _408);
        float _438 = _414 * _242;
        float _440 = _420 * _242;
        float _442 = _424 * _422;
        float _444 = _436 * _422;
        float2 _1183 = float2(_390, _406);
        float3 _446 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1183, float2(0.0), isnan(_1183)), level(_112)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1183, float2(0.0), isnan(_1183)), level(_112)).xyz;
        float _448 = _446.x;
        float _450 = _446.y;
        float _452 = _446.z;
        float2 _1198 = float2(_388, _416);
        float3 _454 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1198, float2(0.0), isnan(_1198)), level(_112)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1198, float2(0.0), isnan(_1198)), level(_112)).xyz;
        float _456 = _454.x;
        float _458 = _454.y;
        float _460 = _454.z;
        float2 _1213 = float2(_390, _416);
        float3 _462 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1213, float2(0.0), isnan(_1213)), level(_112)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1213, float2(0.0), isnan(_1213)), level(_112)).xyz;
        float _464 = _462.x;
        float _466 = _462.y;
        float _468 = _462.z;
        float2 _1228 = float2(_438, _442);
        float3 _470 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1228, float2(0.0), isnan(_1228)), level(_118)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1228, float2(0.0), isnan(_1228)), level(_118)).xyz;
        float _472 = _470.x;
        float _474 = _470.y;
        float _476 = _470.z;
        float2 _1243 = float2(_440, _442);
        float3 _478 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1243, float2(0.0), isnan(_1243)), level(_118)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1243, float2(0.0), isnan(_1243)), level(_118)).xyz;
        float _480 = _478.x;
        float _482 = _478.y;
        float _484 = _478.z;
        float2 _1258 = float2(_438, _444);
        float3 _486 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1258, float2(0.0), isnan(_1258)), level(_118)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1258, float2(0.0), isnan(_1258)), level(_118)).xyz;
        float _488 = _486.x;
        float _490 = _486.y;
        float _492 = _486.z;
        float2 _1273 = float2(_440, _444);
        float3 _494 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1273, float2(0.0), isnan(_1273)), level(_118)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1273, float2(0.0), isnan(_1273)), level(_118)).xyz;
        float _496 = _494.x;
        float _498 = _494.y;
        float _500 = _494.z;
        float _502 = 0.0 + _104;
        float _504 = precise::clamp(_502, 0.0, 1.0);
        float _506 = -_112;
        float _508 = _106 + _506;
        float _510 = precise::clamp(_508, 0.0, 1.0);
        float _512 = -_448;
        float _514 = _430 + _512;
        float _516 = -_450;
        float _518 = _432 + _516;
        float _520 = -_452;
        float _522 = _434 + _520;
        float _524 = -_466;
        float _526 = _458 + _524;
        float _528 = fma(_244, _518, _450);
        float _530 = -_468;
        float _532 = _460 + _530;
        float _534 = fma(_244, _514, _448);
        float _536 = fma(_244, _526, _466);
        float _538 = -_464;
        float _540 = _456 + _538;
        float _542 = fma(_244, _532, _468);
        float _544 = -_480;
        float _546 = _472 + _544;
        float _548 = -_536;
        float _550 = _548 + _528;
        float _552 = -_496;
        float _554 = _488 + _552;
        float _556 = -_482;
        float _558 = _474 + _556;
        float _560 = -_484;
        float _562 = _476 + _560;
        float _564 = fma(_320, _550, _536);
        float _566 = -_498;
        float _568 = _490 + _566;
        float _570 = -_500;
        float _572 = _492 + _570;
        float _574 = fma(_244, _540, _464);
        float _576 = fma(_356, _546, _480);
        float _578 = fma(_356, _554, _496);
        float _580 = fma(_356, _558, _482);
        float _582 = fma(_356, _568, _498);
        float _584 = fma(_244, _522, _452);
        float _586 = fma(_356, _562, _484);
        float _588 = fma(_356, _572, _500);
        float _590 = -_574;
        float _592 = _590 + _534;
        float _594 = -_578;
        float _596 = _594 + _576;
        float _598 = -_582;
        float _600 = _598 + _580;
        float _602 = -_542;
        float _604 = _602 + _584;
        float _606 = -_588;
        float _608 = _606 + _586;
        float _610 = fma(_320, _592, _574);
        float _612 = fma(_368, _596, _578);
        float _614 = fma(_368, _600, _582);
        float _616 = fma(_320, _604, _542);
        float _618 = fma(_368, _608, _588);
        float _620 = -_610;
        float _622 = _620 + _612;
        float _624 = -_564;
        float _626 = _624 + _614;
        float _628 = -_616;
        float _630 = _628 + _618;
        float _632 = fma(_510, _622, _610);
        float _634 = fma(_510, _626, _564);
        float _636 = fma(_510, _630, _616);
        float _638 = -_632;
        float _640 = fma(_632, (*spvDescriptorSet0.fp_c3)._m0[13].x, _638);
        float _642 = -_634;
        float _644 = fma(_634, (*spvDescriptorSet0.fp_c3)._m0[13].y, _642);
        float _646 = -_636;
        float _648 = fma(_636, (*spvDescriptorSet0.fp_c3)._m0[13].z, _646);
        float _650 = fma(_96, _640, _632);
        float _652 = fma(_96, _644, _634);
        float _654 = fma(_96, _648, _636);
        out.m_34.x = _650;
        out.m_34.y = _652;
        out.m_34.z = _654;
        out.m_34.w = _504;
        return out;
    }
    discard_fragment();
    return out;
}

