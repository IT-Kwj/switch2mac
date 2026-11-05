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
int _42(thread const int& _1612, thread const int& _1613, constant _10& support_buffer)
{
    int _1616 = 1 + _1613;
    float _1618 = support_buffer._m5[_1616].x;
    float _1620 = abs(_1618);
    bool _1622 = _1620 == 1.0;
    if (_1622)
    {
        return _1612;
    }
    float _1624 = float(_1612);
    float _1626 = _1624 / _1620;
    int _1628 = int(_1626);
    return _1628;
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
    float2 _720 = float2(_62, _64);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_720, float2(0.0), isnan(_720))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_720, float2(0.0), isnan(_720))).x;
    float2 _731 = float2(_62, _64);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_731, float2(0.0), isnan(_731))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_731, float2(0.0), isnan(_731))).x;
    float _70 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _72 = precise::clamp(_70, 0.0, 1.0);
    bool _76 = _66 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    bool _78 = !_76;
    float _80 = _78 ? _72 : 0.0;
    float _82 = precise::max(_68, _80);
    float _84 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _86 = precise::clamp(_84, 0.0, 1.0);
    float _88 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _90 = precise::clamp(_88, 0.0, 1.0);
    bool _92 = _82 != 0.0;
    bool _94 = isnan(_82);
    bool _96 = _92 || _94;
    bool _98 = isnan(0.0);
    bool _100 = _96 || _98;
    float _102 = precise::min(_86, _90);
    bool _104 = !_100;
    if (!_104)
    {
        float _106 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _108 = fma(_82, _106, 1.0);
        float _110 = log2(_108);
        float _112 = _110 + (-1.0);
        float _114 = trunc(_112);
        int _116 = int(_114);
        float _118 = float(_116);
        float _120 = trunc(_118);
        int _122 = int(_120);
        float _124 = _118 + 1.0;
        float _126 = trunc(_124);
        int _128 = int(_126);
        int _130 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_122), spvDescriptorSet0.fp_t_tcb_A.get_height(_122)).x;
        int _132 = _130;
        int _134 = 2;
        int _136 = _42(_132, _134, (*spvDescriptorSet0.support_buffer));
        int _138 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_122), spvDescriptorSet0.fp_t_tcb_A.get_height(_122)).y;
        int _140 = _138;
        int _142 = 2;
        int _144 = _42(_140, _142, (*spvDescriptorSet0.support_buffer));
        int _146 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_128), spvDescriptorSet0.fp_t_tcb_A.get_height(_128)).x;
        int _148 = _146;
        int _150 = 2;
        int _152 = _42(_148, _150, (*spvDescriptorSet0.support_buffer));
        int _154 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_128), spvDescriptorSet0.fp_t_tcb_A.get_height(_128)).y;
        int _156 = _154;
        int _158 = 2;
        int _160 = _42(_156, _158, (*spvDescriptorSet0.support_buffer));
        float _162 = float(_136);
        float _164 = float(_144);
        float _166 = 1.0 / _162;
        float _168 = fma(_62, _162, -0.5);
        float _170 = fma(_64, _164, -0.5);
        float _172 = floor(_168);
        float _174 = floor(_170);
        float _176 = float(_152);
        float _178 = float(_160);
        float _180 = fma(_62, _176, -0.5);
        float _182 = -_172;
        float _184 = _168 + _182;
        float _186 = fma(_64, _178, -0.5);
        float _188 = floor(_180);
        float _190 = _172 + (-0.5);
        float _192 = -_184;
        float _194 = _192 + 1.0;
        float _196 = -_184;
        float _198 = _196 + 2.0;
        float _200 = _194 * _194;
        float _202 = -_174;
        float _204 = _170 + _202;
        float _206 = _198 * _198;
        float _208 = floor(_186);
        float _210 = _194 * _200;
        float _212 = -_204;
        float _214 = _212 + 1.0;
        float _216 = -_204;
        float _218 = _216 + 2.0;
        float _220 = _174 + 1.5;
        float _222 = _210 * 4.0;
        float _224 = _214 * _214;
        float _226 = 1.0 / _164;
        float _228 = -_222;
        float _230 = fma(_198, _206, _228);
        float _232 = -_210;
        float _234 = _232 + 6.0;
        float _236 = _214 * _224;
        float _238 = _218 * _218;
        float _240 = _210 + _230;
        float _242 = -_230;
        float _244 = _242 + _234;
        float _246 = _236 * 4.0;
        float _248 = 1.0 / _176;
        float _250 = _240 * 0.16666667163372039794921875;
        float _252 = _244 * 0.16666667163372039794921875;
        float _254 = -_188;
        float _256 = _180 + _254;
        float _258 = -_246;
        float _260 = fma(_218, _238, _258);
        float _262 = -_236;
        float _264 = _262 + 6.0;
        float _266 = -_208;
        float _268 = _186 + _266;
        float _270 = -_256;
        float _272 = _270 + 1.0;
        float _274 = -_256;
        float _276 = _274 + 2.0;
        float _278 = -_260;
        float _280 = _278 + _264;
        float _282 = -_268;
        float _284 = _282 + 1.0;
        float _286 = _272 * _272;
        float _288 = -_268;
        float _290 = _288 + 2.0;
        float _292 = _280 * 0.16666667163372039794921875;
        float _294 = _284 * _284;
        float _296 = _272 * _286;
        float _298 = _236 + _260;
        float _300 = 1.0 / _250;
        float _302 = _284 * _294;
        float _304 = _276 * _276;
        float _306 = _296 * 4.0;
        float _308 = -_296;
        float _310 = _308 + 6.0;
        float _312 = _302 * 4.0;
        float _314 = -_302;
        float _316 = _314 + 6.0;
        float _318 = -_306;
        float _320 = fma(_276, _304, _318);
        float _322 = _290 * _290;
        float _324 = 1.0 / _252;
        float _326 = _298 * 0.16666667163372039794921875;
        float _328 = -_320;
        float _330 = _328 + _310;
        float _332 = -_312;
        float _334 = fma(_290, _322, _332);
        float _336 = _184 * _184;
        float _338 = _204 * _204;
        float _340 = _330 * 0.16666667163372039794921875;
        float _342 = -_334;
        float _344 = _342 + _316;
        float _346 = _184 * _336;
        float _348 = 1.0 / _292;
        float _350 = _172 + 1.5;
        float _352 = _344 * 0.16666667163372039794921875;
        float _354 = _296 + _320;
        float _356 = _204 * _338;
        float _358 = _230 * 0.16666667163372039794921875;
        float _360 = _346 * 0.16666667163372039794921875;
        float _362 = _354 * 0.16666667163372039794921875;
        float _364 = 1.0 / _326;
        float _366 = _174 + (-0.5);
        float _368 = _302 + _334;
        float _370 = _356 * 0.16666667163372039794921875;
        float _372 = fma(_358, _300, _190);
        float _374 = fma(_360, _324, _350);
        float _376 = _368 * 0.16666667163372039794921875;
        float _378 = _260 * 0.16666667163372039794921875;
        float _380 = 1.0 / _362;
        float _382 = fma(_370, _348, _220);
        float _384 = _372 * _166;
        float _386 = _256 * _256;
        float _388 = _374 * _166;
        float _390 = _268 * _268;
        float _392 = _188 + 1.5;
        float _394 = _256 * _386;
        float _396 = 1.0 / _340;
        float _398 = fma(_378, _364, _366);
        float _400 = _268 * _390;
        float _402 = _188 + (-0.5);
        float _404 = _320 * 0.16666667163372039794921875;
        float _406 = _398 * _226;
        float _408 = _208 + (-0.5);
        float _410 = _394 * 0.16666667163372039794921875;
        float _412 = 1.0 / _376;
        float _414 = _334 * 0.16666667163372039794921875;
        float _416 = _208 + 1.5;
        float _418 = _400 * 0.16666667163372039794921875;
        float _420 = fma(_404, _380, _402);
        float _422 = _382 * _226;
        float _424 = 1.0 / _352;
        float _426 = fma(_410, _396, _392);
        float _428 = 1.0 / _178;
        float _430 = fma(_414, _412, _408);
        float _432 = fma(_418, _424, _416);
        float _434 = _420 * _248;
        float _436 = _426 * _248;
        float2 _1203 = float2(_384, _406);
        float3 _440 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1203, float2(0.0), isnan(_1203)), level(_118)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1203, float2(0.0), isnan(_1203)), level(_118)).xyz;
        float _442 = _440.x;
        float _444 = _440.y;
        float _446 = _440.z;
        float _448 = _430 * _428;
        float _450 = _432 * _428;
        float2 _1224 = float2(_388, _406);
        float3 _452 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1224, float2(0.0), isnan(_1224)), level(_118)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1224, float2(0.0), isnan(_1224)), level(_118)).xyz;
        float _454 = _452.x;
        float _456 = _452.y;
        float _458 = _452.z;
        float2 _1239 = float2(_384, _422);
        float3 _460 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1239, float2(0.0), isnan(_1239)), level(_118)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1239, float2(0.0), isnan(_1239)), level(_118)).xyz;
        float _462 = _460.x;
        float _464 = _460.y;
        float _466 = _460.z;
        float2 _1254 = float2(_388, _422);
        float3 _468 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1254, float2(0.0), isnan(_1254)), level(_118)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1254, float2(0.0), isnan(_1254)), level(_118)).xyz;
        float _470 = _468.x;
        float _472 = _468.y;
        float _474 = _468.z;
        float2 _1269 = float2(_434, _448);
        float3 _476 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1269, float2(0.0), isnan(_1269)), level(_124)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1269, float2(0.0), isnan(_1269)), level(_124)).xyz;
        float _478 = _476.x;
        float _480 = _476.y;
        float _482 = _476.z;
        float2 _1284 = float2(_436, _448);
        float3 _484 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1284, float2(0.0), isnan(_1284)), level(_124)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1284, float2(0.0), isnan(_1284)), level(_124)).xyz;
        float _486 = _484.x;
        float _488 = _484.y;
        float _490 = _484.z;
        float2 _1299 = float2(_434, _450);
        float3 _492 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1299, float2(0.0), isnan(_1299)), level(_124)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1299, float2(0.0), isnan(_1299)), level(_124)).xyz;
        float _494 = _492.x;
        float _496 = _492.y;
        float _498 = _492.z;
        float2 _1314 = float2(_436, _450);
        float3 _500 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1314, float2(0.0), isnan(_1314)), level(_124)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1314, float2(0.0), isnan(_1314)), level(_124)).xyz;
        float _502 = _500.x;
        float _504 = _500.y;
        float _506 = _500.z;
        float _508 = 0.0 + _110;
        float _510 = precise::clamp(_508, 0.0, 1.0);
        float _512 = -_118;
        float _514 = _112 + _512;
        float _516 = precise::clamp(_514, 0.0, 1.0);
        float _518 = -_454;
        float _520 = _442 + _518;
        float _522 = -_456;
        float _524 = _444 + _522;
        float _526 = -_458;
        float _528 = _446 + _526;
        float _530 = fma(_250, _520, _454);
        float _532 = -_472;
        float _534 = _464 + _532;
        float _536 = fma(_250, _524, _456);
        float _538 = -_470;
        float _540 = _462 + _538;
        float _542 = fma(_250, _528, _458);
        float _544 = fma(_250, _534, _472);
        float _546 = -_488;
        float _548 = _480 + _546;
        float _550 = -_486;
        float _552 = _478 + _550;
        float _554 = fma(_250, _540, _470);
        float _556 = -_544;
        float _558 = _556 + _536;
        float _560 = -_504;
        float _562 = _496 + _560;
        float _564 = fma(_362, _548, _488);
        float _566 = -_502;
        float _568 = _494 + _566;
        float _570 = -_474;
        float _572 = _466 + _570;
        float _574 = fma(_362, _562, _504);
        float _576 = fma(_362, _552, _486);
        float _578 = -_490;
        float _580 = _482 + _578;
        float _582 = -_506;
        float _584 = _498 + _582;
        float _586 = fma(_362, _568, _502);
        float _588 = -_574;
        float _590 = _588 + _564;
        float _592 = -_554;
        float _594 = _592 + _530;
        float _596 = fma(_250, _572, _474);
        float _598 = fma(_326, _558, _544);
        float _600 = fma(_362, _580, _490);
        float _602 = fma(_362, _584, _506);
        float _604 = -_586;
        float _606 = _604 + _576;
        float _608 = fma(_376, _590, _574);
        float _610 = fma(_326, _594, _554);
        float _612 = -_596;
        float _614 = _612 + _542;
        float _616 = -_602;
        float _618 = _616 + _600;
        float _620 = fma(_376, _606, _586);
        float _622 = -_598;
        float _624 = _622 + _608;
        float _626 = fma(_326, _614, _596);
        float _628 = fma(_376, _618, _602);
        float _630 = -_610;
        float _632 = _630 + _620;
        float _634 = fma(_516, _624, _598);
        float _636 = -_626;
        float _638 = _636 + _628;
        float _640 = fma(_516, _632, _610);
        float _642 = _634 * 0.586600005626678466796875;
        float _644 = _102 * (*spvDescriptorSet0.fp_c3)._m0[0].w;
        float _646 = fma(_516, _638, _626);
        float _648 = fma(_640, 0.29890000820159912109375, _642);
        float _650 = fma(_646, 0.1143999993801116943359375, _648);
        float _652 = -_640;
        float _654 = _652 + _650;
        float _656 = -_634;
        float _658 = _656 + _650;
        float _660 = -_646;
        float _662 = _660 + _650;
        float _664 = fma(_644, _654, _640);
        float _666 = fma(_644, _658, _634);
        float _668 = fma(_644, _662, _646);
        float _670 = -_664;
        float _672 = fma(_664, (*spvDescriptorSet0.fp_c3)._m0[13].x, _670);
        float _674 = -_666;
        float _676 = fma(_666, (*spvDescriptorSet0.fp_c3)._m0[13].y, _674);
        float _678 = -_668;
        float _680 = fma(_668, (*spvDescriptorSet0.fp_c3)._m0[13].z, _678);
        float _682 = fma(_102, _672, _664);
        float _684 = fma(_102, _676, _666);
        float _686 = fma(_102, _680, _668);
        out.m_36.x = _682;
        out.m_36.y = _684;
        out.m_36.z = _686;
        out.m_36.w = _510;
        return out;
    }
    discard_fragment();
    return out;
}

