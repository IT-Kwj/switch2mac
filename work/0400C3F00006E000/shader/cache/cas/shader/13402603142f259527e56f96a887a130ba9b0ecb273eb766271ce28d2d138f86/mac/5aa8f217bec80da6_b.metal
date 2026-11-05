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
    texture2d<float> fp_t_tcb_C [[id(2)]];
    sampler fp_t_tcb_CSmplr [[id(3)]];
    texture2d<float> fp_t_tcb_A [[id(4)]];
    sampler fp_t_tcb_ASmplr [[id(5)]];
    sampler fp_t_tcb_CSmplr_w [[id(6)]];
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
int _42(thread const int& _1484, thread const int& _1485, constant _10& support_buffer)
{
    int _1488 = 1 + _1485;
    float _1490 = support_buffer._m5[_1488].x;
    float _1492 = abs(_1490);
    bool _1494 = _1492 == 1.0;
    if (_1494)
    {
        return _1484;
    }
    float _1496 = float(_1484);
    float _1498 = _1496 / _1492;
    int _1500 = int(_1498);
    return _1500;
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
    float2 _680 = float2(_62, _64);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_680, float2(0.0), isnan(_680))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_680, float2(0.0), isnan(_680))).x;
    float _68 = in.m_33.z;
    float _70 = gl_FragCoord.w;
    float _72 = _68 * _70;
    float _74 = in.m_33.x;
    float _76 = gl_FragCoord.w;
    float _78 = _74 * _76;
    float _80 = in.m_33.y;
    float _82 = gl_FragCoord.w;
    float _84 = _80 * _82;
    float _86 = _60 * _72;
    float _88 = _60 * _78;
    float _90 = _60 * _84;
    float _92 = precise::max(_66, _86);
    bool _96 = _92 != 0.0;
    bool _98 = isnan(_92);
    bool _100 = _96 || _98;
    bool _102 = isnan(0.0);
    bool _104 = _100 || _102;
    bool _106 = !_104;
    if (!_106)
    {
        float _108 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _110 = fma(_92, _108, 1.0);
        float _112 = log2(_110);
        float _114 = _112 + (-1.0);
        float _116 = trunc(_114);
        int _118 = int(_116);
        float _120 = float(_118);
        float _122 = trunc(_120);
        int _124 = int(_122);
        float _126 = _120 + 1.0;
        float _128 = trunc(_126);
        int _130 = int(_128);
        int _132 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_124), spvDescriptorSet0.fp_t_tcb_A.get_height(_124)).x;
        int _134 = _132;
        int _136 = 1;
        int _138 = _42(_134, _136, (*spvDescriptorSet0.support_buffer));
        int _140 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_124), spvDescriptorSet0.fp_t_tcb_A.get_height(_124)).y;
        int _142 = _140;
        int _144 = 1;
        int _146 = _42(_142, _144, (*spvDescriptorSet0.support_buffer));
        int _148 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_130), spvDescriptorSet0.fp_t_tcb_A.get_height(_130)).x;
        int _150 = _148;
        int _152 = 1;
        int _154 = _42(_150, _152, (*spvDescriptorSet0.support_buffer));
        int _156 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_130), spvDescriptorSet0.fp_t_tcb_A.get_height(_130)).y;
        int _158 = _156;
        int _160 = 1;
        int _162 = _42(_158, _160, (*spvDescriptorSet0.support_buffer));
        float _164 = float(_138);
        float _166 = float(_146);
        float _168 = 1.0 / _164;
        float _170 = fma(_62, _164, -0.5);
        float _172 = fma(_64, _166, -0.5);
        float _174 = floor(_170);
        float _176 = floor(_172);
        float _178 = float(_154);
        float _180 = float(_162);
        float _182 = fma(_62, _178, -0.5);
        float _184 = -_174;
        float _186 = _170 + _184;
        float _188 = fma(_64, _180, -0.5);
        float _190 = floor(_182);
        float _192 = -_186;
        float _194 = _192 + 1.0;
        float _196 = -_186;
        float _198 = _196 + 2.0;
        float _200 = -_176;
        float _202 = _172 + _200;
        float _204 = _194 * _194;
        float _206 = _198 * _198;
        float _208 = floor(_188);
        float _210 = -_202;
        float _212 = _210 + 1.0;
        float _214 = _194 * _204;
        float _216 = -_202;
        float _218 = _216 + 2.0;
        float _220 = _212 * _212;
        float _222 = _214 * 4.0;
        float _224 = 1.0 / _166;
        float _226 = _212 * _220;
        float _228 = -_222;
        float _230 = fma(_198, _206, _228);
        float _232 = -_214;
        float _234 = _232 + 6.0;
        float _236 = _218 * _218;
        float _238 = _226 * 4.0;
        float _240 = -_190;
        float _242 = _182 + _240;
        float _244 = -_230;
        float _246 = _244 + _234;
        float _248 = 1.0 / _180;
        float _250 = -_238;
        float _252 = fma(_218, _236, _250);
        float _254 = -_242;
        float _256 = _254 + 1.0;
        float _258 = -_226;
        float _260 = _258 + 6.0;
        float _262 = _246 * 0.16666667163372039794921875;
        float _264 = -_242;
        float _266 = _264 + 2.0;
        float _268 = _256 * _256;
        float _270 = -_252;
        float _272 = _270 + _260;
        float _274 = -_208;
        float _276 = _188 + _274;
        float _278 = _266 * _266;
        float _280 = _256 * _268;
        float _282 = _272 * 0.16666667163372039794921875;
        float _284 = -_276;
        float _286 = _284 + 1.0;
        float _288 = _214 + _230;
        float _290 = _280 * 4.0;
        float _292 = -_280;
        float _294 = _292 + 6.0;
        float _296 = 1.0 / _262;
        float _298 = _288 * 0.16666667163372039794921875;
        float _300 = -_290;
        float _302 = fma(_266, _278, _300);
        float _304 = _286 * _286;
        float _306 = -_276;
        float _308 = _306 + 2.0;
        float _310 = _186 * _186;
        float _312 = -_302;
        float _314 = _312 + _294;
        float _316 = _286 * _304;
        float _318 = 1.0 / _298;
        float _320 = _308 * _308;
        float _322 = _314 * 0.16666667163372039794921875;
        float _324 = _316 * 4.0;
        float _326 = _186 * _310;
        float _328 = _226 + _252;
        float _330 = -_316;
        float _332 = _330 + 6.0;
        float _334 = -_324;
        float _336 = fma(_308, _320, _334);
        float _338 = _174 + 1.5;
        float _340 = _326 * 0.16666667163372039794921875;
        float _342 = _328 * 0.16666667163372039794921875;
        float _344 = 1.0 / _282;
        float _346 = _230 * 0.16666667163372039794921875;
        float _348 = fma(_340, _296, _338);
        float _350 = _174 + (-0.5);
        float _352 = _202 * _202;
        float _354 = -_336;
        float _356 = _354 + _332;
        float _358 = _280 + _302;
        float _360 = fma(_346, _318, _350);
        float _362 = 1.0 / _342;
        float _364 = _202 * _352;
        float _366 = _356 * 0.16666667163372039794921875;
        float _368 = _316 + _336;
        float _370 = _176 + (-0.5);
        float _372 = _358 * 0.16666667163372039794921875;
        float _374 = _252 * 0.16666667163372039794921875;
        float _376 = _368 * 0.16666667163372039794921875;
        float _378 = 1.0 / _322;
        float _380 = 1.0 / _366;
        float _382 = _176 + 1.5;
        float _384 = _364 * 0.16666667163372039794921875;
        float _386 = fma(_374, _362, _370);
        float _388 = _276 * _276;
        float _390 = _242 * _242;
        float _392 = fma(_384, _344, _382);
        float _394 = _360 * _168;
        float _396 = 1.0 / _376;
        float _398 = _276 * _388;
        float _400 = _242 * _390;
        float _402 = _208 + (-0.5);
        float _404 = _386 * _224;
        float _406 = _208 + 1.5;
        float _408 = _302 * 0.16666667163372039794921875;
        float _410 = _398 * 0.16666667163372039794921875;
        float _412 = 1.0 / _372;
        float _414 = _336 * 0.16666667163372039794921875;
        float _416 = _392 * _224;
        float _418 = _190 + (-0.5);
        float _420 = _190 + 1.5;
        float _422 = _400 * 0.16666667163372039794921875;
        float _424 = fma(_410, _380, _406);
        float _426 = _348 * _168;
        float _428 = 1.0 / _178;
        float _430 = fma(_414, _396, _402);
        float _432 = fma(_422, _378, _420);
        float _434 = _430 * _248;
        float _436 = fma(_408, _412, _418);
        float2 _1144 = float2(_394, _404);
        float3 _440 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1144, float2(0.0), isnan(_1144)), level(_120)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1144, float2(0.0), isnan(_1144)), level(_120)).xyz;
        float _442 = _440.x;
        float _444 = _440.y;
        float _446 = _440.z;
        float2 _1159 = float2(_426, _404);
        float3 _448 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1159, float2(0.0), isnan(_1159)), level(_120)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1159, float2(0.0), isnan(_1159)), level(_120)).xyz;
        float _450 = _448.x;
        float _452 = _448.y;
        float _454 = _448.z;
        float2 _1174 = float2(_394, _416);
        float3 _456 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1174, float2(0.0), isnan(_1174)), level(_120)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1174, float2(0.0), isnan(_1174)), level(_120)).xyz;
        float _458 = _456.x;
        float _460 = _456.y;
        float _462 = _456.z;
        float _464 = _436 * _428;
        float _466 = _432 * _428;
        float _468 = _424 * _248;
        float2 _1198 = float2(_426, _416);
        float3 _470 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1198, float2(0.0), isnan(_1198)), level(_120)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1198, float2(0.0), isnan(_1198)), level(_120)).xyz;
        float _472 = _470.x;
        float _474 = _470.y;
        float _476 = _470.z;
        float2 _1213 = float2(_464, _434);
        float3 _478 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1213, float2(0.0), isnan(_1213)), level(_126)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1213, float2(0.0), isnan(_1213)), level(_126)).xyz;
        float _480 = _478.x;
        float _482 = _478.y;
        float _484 = _478.z;
        float2 _1228 = float2(_466, _434);
        float3 _486 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1228, float2(0.0), isnan(_1228)), level(_126)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1228, float2(0.0), isnan(_1228)), level(_126)).xyz;
        float _488 = _486.x;
        float _490 = _486.y;
        float _492 = _486.z;
        float2 _1243 = float2(_464, _468);
        float3 _494 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1243, float2(0.0), isnan(_1243)), level(_126)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1243, float2(0.0), isnan(_1243)), level(_126)).xyz;
        float _496 = _494.x;
        float _498 = _494.y;
        float _500 = _494.z;
        float2 _1258 = float2(_466, _468);
        float3 _502 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1258, float2(0.0), isnan(_1258)), level(_126)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1258, float2(0.0), isnan(_1258)), level(_126)).xyz;
        float _504 = _502.x;
        float _506 = _502.y;
        float _508 = _502.z;
        float _510 = 0.0 + _112;
        float _512 = precise::clamp(_510, 0.0, 1.0);
        float _514 = fma(_90, _512, _88);
        float _516 = -_120;
        float _518 = _114 + _516;
        float _520 = precise::clamp(_518, 0.0, 1.0);
        float _522 = -_450;
        float _524 = _442 + _522;
        float _526 = -_452;
        float _528 = _444 + _526;
        float _530 = -_454;
        float _532 = _446 + _530;
        float _534 = fma(_298, _524, _450);
        float _536 = fma(_298, _528, _452);
        float _538 = fma(_298, _532, _454);
        float _540 = -_474;
        float _542 = _460 + _540;
        float _544 = -_472;
        float _546 = _458 + _544;
        float _548 = -_476;
        float _550 = _462 + _548;
        float _552 = fma(_298, _542, _474);
        float _554 = -_488;
        float _556 = _480 + _554;
        float _558 = -_490;
        float _560 = _482 + _558;
        float _562 = -_492;
        float _564 = _484 + _562;
        float _566 = fma(_298, _546, _472);
        float _568 = fma(_372, _556, _488);
        float _570 = fma(_372, _560, _490);
        float _572 = fma(_298, _550, _476);
        float _574 = -_504;
        float _576 = _496 + _574;
        float _578 = -_506;
        float _580 = _498 + _578;
        float _582 = -_508;
        float _584 = _500 + _582;
        float _586 = fma(_372, _564, _492);
        float _588 = fma(_372, _576, _504);
        float _590 = fma(_372, _580, _506);
        float _592 = fma(_372, _584, _508);
        float _594 = -_566;
        float _596 = _594 + _534;
        float _598 = -_552;
        float _600 = _598 + _536;
        float _602 = -_588;
        float _604 = _602 + _568;
        float _606 = -_590;
        float _608 = _606 + _570;
        float _610 = -_572;
        float _612 = _610 + _538;
        float _614 = -_592;
        float _616 = _614 + _586;
        float _618 = fma(_342, _596, _566);
        float _620 = fma(_342, _600, _552);
        float _622 = fma(_376, _604, _588);
        float _624 = fma(_376, _608, _590);
        float _626 = fma(_342, _612, _572);
        float _628 = fma(_376, _616, _592);
        float _630 = -_618;
        float _632 = _630 + _622;
        float _634 = -_620;
        float _636 = _634 + _624;
        float _638 = -_626;
        float _640 = _638 + _628;
        float _642 = fma(_520, _632, _618);
        float _644 = fma(_520, _636, _620);
        float _646 = fma(_520, _640, _626);
        out.m_36.x = _642;
        out.m_36.y = _644;
        out.m_36.z = _646;
        out.m_36.w = _514;
        return out;
    }
    discard_fragment();
    return out;
}

