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
int _42(thread const int& _1608, thread const int& _1609, constant _10& support_buffer)
{
    int _1612 = 1 + _1609;
    float _1614 = support_buffer._m5[_1612].x;
    float _1616 = abs(_1614);
    bool _1618 = _1616 == 1.0;
    if (_1618)
    {
        return _1608;
    }
    float _1620 = float(_1608);
    float _1622 = _1620 / _1616;
    int _1624 = int(_1622);
    return _1624;
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
    float _96 = _60 * _82;
    float _98 = _60 * _88;
    float _100 = precise::max(_92, _94);
    bool _102 = _100 != 0.0;
    bool _104 = isnan(_100);
    bool _106 = _102 || _104;
    bool _108 = isnan(0.0);
    bool _110 = _106 || _108;
    bool _112 = !_110;
    if (!_112)
    {
        float _114 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _116 = fma(_100, _114, 1.0);
        float _118 = log2(_116);
        float _120 = _118 + (-1.0);
        float _122 = trunc(_120);
        int _124 = int(_122);
        float _126 = float(_124);
        float _128 = trunc(_126);
        int _130 = int(_128);
        float _132 = _126 + 1.0;
        float _134 = trunc(_132);
        int _136 = int(_134);
        int _138 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_130), spvDescriptorSet0.fp_t_tcb_A.get_height(_130)).x;
        int _140 = _138;
        int _142 = 1;
        int _144 = _42(_140, _142, (*spvDescriptorSet0.support_buffer));
        int _146 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_130), spvDescriptorSet0.fp_t_tcb_A.get_height(_130)).y;
        int _148 = _146;
        int _150 = 1;
        int _152 = _42(_148, _150, (*spvDescriptorSet0.support_buffer));
        int _154 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_136), spvDescriptorSet0.fp_t_tcb_A.get_height(_136)).x;
        int _156 = _154;
        int _158 = 1;
        int _160 = _42(_156, _158, (*spvDescriptorSet0.support_buffer));
        int _162 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_136), spvDescriptorSet0.fp_t_tcb_A.get_height(_136)).y;
        int _164 = _162;
        int _166 = 1;
        int _168 = _42(_164, _166, (*spvDescriptorSet0.support_buffer));
        float _170 = float(_144);
        float _172 = float(_152);
        float _174 = 1.0 / _170;
        float _176 = fma(_62, _170, -0.5);
        float _178 = fma(_64, _172, -0.5);
        float _180 = floor(_176);
        float _182 = float(_160);
        float _184 = float(_168);
        float _186 = fma(_62, _182, -0.5);
        float _188 = floor(_178);
        float _190 = fma(_64, _184, -0.5);
        float _192 = -_180;
        float _194 = _176 + _192;
        float _196 = floor(_186);
        float _198 = -_194;
        float _200 = _198 + 1.0;
        float _202 = -_194;
        float _204 = _202 + 2.0;
        float _206 = -_188;
        float _208 = _178 + _206;
        float _210 = _200 * _200;
        float _212 = floor(_190);
        float _214 = _204 * _204;
        float _216 = -_208;
        float _218 = _216 + 1.0;
        float _220 = _200 * _210;
        float _222 = -_208;
        float _224 = _222 + 2.0;
        float _226 = _188 + (-0.5);
        float _228 = _218 * _218;
        float _230 = _220 * 4.0;
        float _232 = _188 + 1.5;
        float _234 = 1.0 / _172;
        float _236 = _218 * _228;
        float _238 = -_196;
        float _240 = _186 + _238;
        float _242 = -_230;
        float _244 = fma(_204, _214, _242);
        float _246 = _224 * _224;
        float _248 = _236 * 4.0;
        float _250 = -_240;
        float _252 = _250 + 1.0;
        float _254 = -_220;
        float _256 = _254 + 6.0;
        float _258 = -_240;
        float _260 = _258 + 2.0;
        float _262 = -_248;
        float _264 = fma(_224, _246, _262);
        float _266 = -_236;
        float _268 = _266 + 6.0;
        float _270 = _252 * _252;
        float _272 = -_212;
        float _274 = _190 + _272;
        float _276 = -_244;
        float _278 = _276 + _256;
        float _280 = -_264;
        float _282 = _280 + _268;
        float _284 = _252 * _270;
        float _286 = -_274;
        float _288 = _286 + 1.0;
        float _290 = _220 + _244;
        float _292 = _282 * 0.16666667163372039794921875;
        float _294 = _260 * _260;
        float _296 = _284 * 4.0;
        float _298 = _278 * 0.16666667163372039794921875;
        float _300 = _290 * 0.16666667163372039794921875;
        float _302 = 1.0 / _182;
        float _304 = -_296;
        float _306 = fma(_260, _294, _304);
        float _308 = _288 * _288;
        float _310 = -_284;
        float _312 = _310 + 6.0;
        float _314 = _288 * _308;
        float _316 = -_306;
        float _318 = _316 + _312;
        float _320 = 1.0 / _298;
        float _322 = _194 * _194;
        float _324 = _314 * 4.0;
        float _326 = _236 + _264;
        float _328 = _318 * 0.16666667163372039794921875;
        float _330 = _194 * _322;
        float _332 = _180 + 1.5;
        float _334 = _264 * 0.16666667163372039794921875;
        float _336 = 1.0 / _300;
        float _338 = -_274;
        float _340 = _338 + 2.0;
        float _342 = _340 * _340;
        float _344 = 1.0 / _292;
        float _346 = -_324;
        float _348 = fma(_340, _342, _346);
        float _350 = _326 * 0.16666667163372039794921875;
        float _352 = -_314;
        float _354 = _352 + 6.0;
        float _356 = _330 * 0.16666667163372039794921875;
        float _358 = _284 + _306;
        float _360 = -_348;
        float _362 = _360 + _354;
        float _364 = 1.0 / _350;
        float _366 = fma(_356, _320, _332);
        float _368 = _208 * _208;
        float _370 = _362 * 0.16666667163372039794921875;
        float _372 = _180 + (-0.5);
        float _374 = _244 * 0.16666667163372039794921875;
        float _376 = _208 * _368;
        float _378 = _314 + _348;
        float _380 = 1.0 / _328;
        float _382 = _358 * 0.16666667163372039794921875;
        float _384 = fma(_374, _336, _372);
        float _386 = _378 * 0.16666667163372039794921875;
        float _388 = _348 * 0.16666667163372039794921875;
        float _390 = 1.0 / _382;
        float _392 = _376 * 0.16666667163372039794921875;
        float _394 = fma(_392, _344, _232);
        float _396 = fma(_334, _364, _226);
        float _398 = _384 * _174;
        float _400 = 1.0 / _386;
        float _402 = _366 * _174;
        float _404 = _240 * _240;
        float _406 = _274 * _274;
        float _408 = _196 + (-0.5);
        float _410 = _396 * _234;
        float _412 = _240 * _404;
        float _414 = _274 * _406;
        float _416 = 1.0 / _370;
        float _418 = _196 + 1.5;
        float _420 = _306 * 0.16666667163372039794921875;
        float _422 = _412 * 0.16666667163372039794921875;
        float _424 = _212 + (-0.5);
        float _426 = _394 * _234;
        float _428 = fma(_420, _390, _408);
        float _430 = fma(_422, _380, _418);
        float _432 = 1.0 / _184;
        float _434 = _212 + 1.5;
        float _436 = _414 * 0.16666667163372039794921875;
        float _438 = fma(_388, _400, _424);
        float _440 = _428 * _302;
        float _442 = _430 * _302;
        float _444 = fma(_436, _416, _434);
        float2 _1210 = float2(_398, _410);
        float3 _448 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1210, float2(0.0), isnan(_1210)), level(_126)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1210, float2(0.0), isnan(_1210)), level(_126)).xyz;
        float _450 = _448.x;
        float _452 = _448.y;
        float _454 = _448.z;
        float _456 = _438 * _432;
        float _458 = _444 * _432;
        float2 _1231 = float2(_402, _410);
        float3 _460 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1231, float2(0.0), isnan(_1231)), level(_126)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1231, float2(0.0), isnan(_1231)), level(_126)).xyz;
        float _462 = _460.x;
        float _464 = _460.y;
        float _466 = _460.z;
        float2 _1246 = float2(_398, _426);
        float3 _468 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1246, float2(0.0), isnan(_1246)), level(_126)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1246, float2(0.0), isnan(_1246)), level(_126)).xyz;
        float _470 = _468.x;
        float _472 = _468.y;
        float _474 = _468.z;
        float2 _1261 = float2(_402, _426);
        float3 _476 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1261, float2(0.0), isnan(_1261)), level(_126)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1261, float2(0.0), isnan(_1261)), level(_126)).xyz;
        float _478 = _476.x;
        float _480 = _476.y;
        float _482 = _476.z;
        float2 _1276 = float2(_440, _456);
        float3 _484 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1276, float2(0.0), isnan(_1276)), level(_132)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1276, float2(0.0), isnan(_1276)), level(_132)).xyz;
        float _486 = _484.x;
        float _488 = _484.y;
        float _490 = _484.z;
        float2 _1291 = float2(_442, _456);
        float3 _492 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1291, float2(0.0), isnan(_1291)), level(_132)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1291, float2(0.0), isnan(_1291)), level(_132)).xyz;
        float _494 = _492.x;
        float _496 = _492.y;
        float _498 = _492.z;
        float2 _1306 = float2(_440, _458);
        float3 _500 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1306, float2(0.0), isnan(_1306)), level(_132)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1306, float2(0.0), isnan(_1306)), level(_132)).xyz;
        float _502 = _500.x;
        float _504 = _500.y;
        float _506 = _500.z;
        float2 _1321 = float2(_442, _458);
        float3 _508 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1321, float2(0.0), isnan(_1321)), level(_132)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1321, float2(0.0), isnan(_1321)), level(_132)).xyz;
        float _510 = _508.x;
        float _512 = _508.y;
        float _514 = _508.z;
        float _516 = -_126;
        float _518 = _120 + _516;
        float _520 = precise::clamp(_518, 0.0, 1.0);
        float _522 = -_462;
        float _524 = _450 + _522;
        float _526 = -_464;
        float _528 = _452 + _526;
        float _530 = -_478;
        float _532 = _470 + _530;
        float _534 = -_466;
        float _536 = _454 + _534;
        float _538 = fma(_300, _524, _462);
        float _540 = -_480;
        float _542 = _472 + _540;
        float _544 = fma(_300, _532, _478);
        float _546 = -_482;
        float _548 = _474 + _546;
        float _550 = fma(_300, _528, _464);
        float _552 = fma(_300, _542, _480);
        float _554 = -_494;
        float _556 = _486 + _554;
        float _558 = fma(_300, _548, _482);
        float _560 = -_498;
        float _562 = _490 + _560;
        float _564 = -_552;
        float _566 = _564 + _550;
        float _568 = -_496;
        float _570 = _488 + _568;
        float _572 = -_510;
        float _574 = _502 + _572;
        float _576 = -_514;
        float _578 = _506 + _576;
        float _580 = fma(_350, _566, _552);
        float _582 = fma(_382, _570, _496);
        float _584 = -_512;
        float _586 = _504 + _584;
        float _588 = fma(_382, _556, _494);
        float _590 = fma(_382, _562, _498);
        float _592 = fma(_382, _574, _510);
        float _594 = fma(_382, _586, _512);
        float _596 = fma(_300, _536, _466);
        float _598 = fma(_382, _578, _514);
        float _600 = -_544;
        float _602 = _600 + _538;
        float _604 = -_592;
        float _606 = _604 + _588;
        float _608 = -_558;
        float _610 = _608 + _596;
        float _612 = -_594;
        float _614 = _612 + _582;
        float _616 = -_598;
        float _618 = _616 + _590;
        float _620 = fma(_350, _602, _544);
        float _622 = fma(_386, _606, _592);
        float _624 = 0.0 + _118;
        float _626 = precise::clamp(_624, 0.0, 1.0);
        float _628 = fma(_350, _610, _558);
        float _630 = fma(_386, _614, _594);
        float _632 = fma(_386, _618, _598);
        float _634 = -_620;
        float _636 = _634 + _622;
        float _638 = fma(_98, _626, _96);
        float _640 = -_580;
        float _642 = _640 + _630;
        float _644 = -_628;
        float _646 = _644 + _632;
        float _648 = fma(_520, _636, _620);
        float _650 = 1.0 / _638;
        float _652 = fma(_520, _642, _580);
        float _654 = fma(_520, _646, _628);
        float _656 = _626 * _648;
        float _658 = _626 * _652;
        float _660 = _626 * _654;
        float _662 = -_656;
        float _664 = _662 + (*spvDescriptorSet0.fp_c3)._m0[12].x;
        float _666 = -_658;
        float _668 = _666 + (*spvDescriptorSet0.fp_c3)._m0[12].y;
        float _670 = -_660;
        float _672 = _670 + (*spvDescriptorSet0.fp_c3)._m0[12].z;
        float _674 = fma(_96, _664, _656);
        float _676 = fma(_96, _668, _658);
        float _678 = fma(_96, _672, _660);
        float _680 = _674 * _650;
        float _682 = _676 * _650;
        float _684 = _678 * _650;
        out.m_34.x = _680;
        out.m_34.y = _682;
        out.m_34.z = _684;
        out.m_34.w = _638;
        return out;
    }
    out.m_34.x = (*spvDescriptorSet0.fp_c3)._m0[12].x;
    out.m_34.y = (*spvDescriptorSet0.fp_c3)._m0[12].y;
    out.m_34.z = (*spvDescriptorSet0.fp_c3)._m0[12].z;
    out.m_34.w = _96;
    return out;
}

