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
    uint _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _16* fp_c9 [[id(0)]];
    constant _16* fp_c8 [[id(1)]];
    constant _16* fp_c15 [[id(2)]];
    texture2d<float> fp_t_tcb_10 [[id(3)]];
    sampler fp_t_tcb_10Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_A [[id(7)]];
    sampler fp_t_tcb_ASmplr [[id(8)]];
    texturecube<float> fp_t_tcb_1E [[id(9)]];
    sampler fp_t_tcb_1ESmplr [[id(10)]];
    sampler fp_t_tcb_10Smplr_w [[id(11)]];
    sampler fp_t_tcb_8Smplr_w [[id(12)]];
    sampler fp_t_tcb_ASmplr_w [[id(13)]];
    sampler fp_t_tcb_1ESmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_59 [[color(0)]];
};

struct main0_in
{
    float4 m_56 [[user(locn0)]];
    float4 m_46 [[user(locn1)]];
    float4 m_44 [[user(locn2)]];
    float4 m_42 [[user(locn3)]];
    float4 m_63 [[user(locn4)]];
    float4 m_48 [[user(locn5)]];
    float4 m_54 [[user(locn7)]];
    float4 m_50 [[user(locn8)]];
    float4 m_52 [[user(locn9)]];
    float4 m_65 [[user(locn10)]];
    float4 m_61 [[user(locn11)]];
    float4 m_67 [[user(locn12)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _74 = gl_FragCoord.w;
    float _76 = in.m_42.w;
    float _78 = gl_FragCoord.w;
    float _80 = _76 * _78;
    float _82 = in.m_42.x;
    float _84 = gl_FragCoord.w;
    float _86 = _82 * _84;
    float _88 = in.m_42.y;
    float _90 = gl_FragCoord.w;
    float _92 = _88 * _90;
    float _94 = in.m_44.x;
    float _96 = gl_FragCoord.w;
    float _98 = _94 * _96;
    float _100 = in.m_44.y;
    float _102 = gl_FragCoord.w;
    float _104 = _100 * _102;
    float _106 = 1.0 / _74;
    float _108 = _106 * _80;
    float _110 = _106 * _86;
    float _112 = _106 * _92;
    float _114 = _106 * _98;
    float _116 = 1.0 / _108;
    float _118 = _106 * _104;
    float _120 = _110 * _116;
    float _122 = _112 * _116;
    float2 _773 = float2(_120, _122);
    float _124 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_773, float2(0.0), isnan(_773))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_773, float2(0.0), isnan(_773))).x;
    float2 _784 = float2(_114, _118);
    float2 _128 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_784, float2(0.0), isnan(_784))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_784, float2(0.0), isnan(_784))).xw;
    float _130 = _128.x;
    float _132 = _128.y;
    float _134 = in.m_42.z;
    float _136 = gl_FragCoord.w;
    float _138 = _134 * _136;
    float _140 = in.m_46.w;
    float _142 = gl_FragCoord.w;
    float _144 = _140 * _142;
    float _146 = in.m_48.x;
    float _148 = gl_FragCoord.w;
    float _150 = _146 * _148;
    float _152 = _106 * _138;
    float _154 = _152 * _116;
    float _156 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _158 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _160 = fma(_154, (*spvDescriptorSet0.fp_c8)._m0[30].w, _158);
    float _162 = _106 * _144;
    float _164 = 1.0 / _160;
    float _166 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _168 = _164 * _166;
    float _170 = in.m_44.z;
    float _172 = gl_FragCoord.w;
    float _174 = _170 * _172;
    float _176 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _178 = fma(_124, (*spvDescriptorSet0.fp_c8)._m0[30].w, _176);
    float _180 = 1.0 / _178;
    bool _184 = _132 >= _162;
    bool _186 = isnan(_132);
    bool _188 = _184 || _186;
    bool _190 = isnan(_162);
    bool _192 = _188 || _190;
    float _194 = float(_192);
    float _196 = _106 * _150;
    float _198 = 0.0 + _194;
    float _200 = precise::clamp(_198, 0.0, 1.0);
    float _202 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _204 = -_168;
    float _206 = fma(_180, _202, _204);
    float _208 = _206 * _156;
    float _210 = precise::clamp(_208, 0.0, 1.0);
    float _212 = _200 * _210;
    float _214 = _212 * _196;
    bool _216 = _214 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _218 = isnan(_214);
    bool _220 = _216 || _218;
    bool _222 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _224 = _220 || _222;
    float _226 = in.m_44.w;
    float _228 = gl_FragCoord.w;
    float _230 = _226 * _228;
    float _232 = _106;
    if (!_224)
    {
        discard_fragment();
    }
    float _234 = _106 * _174;
    float _236 = _106 * _230;
    float2 _943 = float2(_234, _236);
    float2 _238 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_943, float2(0.0), isnan(_943))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_943, float2(0.0), isnan(_943))).xy;
    float _240 = _238.x;
    float _242 = _238.y;
    float _244 = in.m_50.y;
    float _246 = gl_FragCoord.w;
    float _248 = _244 * _246;
    float _250 = in.m_50.x;
    float _252 = gl_FragCoord.w;
    float _254 = _250 * _252;
    float _256 = in.m_50.z;
    float _258 = gl_FragCoord.w;
    float _260 = _256 * _258;
    float _262 = in.m_52.y;
    float _264 = gl_FragCoord.w;
    float _266 = _262 * _264;
    float _268 = in.m_52.x;
    float _270 = gl_FragCoord.w;
    float _272 = _268 * _270;
    float _274 = in.m_54.y;
    float _276 = gl_FragCoord.w;
    float _278 = _274 * _276;
    float _280 = in.m_54.x;
    float _282 = gl_FragCoord.w;
    float _284 = _280 * _282;
    float _286 = in.m_54.z;
    float _288 = gl_FragCoord.w;
    float _290 = _286 * _288;
    float _292 = in.m_52.z;
    float _294 = gl_FragCoord.w;
    float _296 = _292 * _294;
    float _298 = _106 * _248;
    float _300 = _106 * _254;
    float _302 = _106 * _260;
    float _304 = _298 * _298;
    float _306 = _106 * _278;
    float _308 = _106 * _290;
    float _310 = fma(_300, _300, _304);
    float _312 = _106 * _272;
    float _314 = _106 * _296;
    float _316 = in.m_56.y;
    float _318 = gl_FragCoord.w;
    float _320 = _316 * _318;
    float _322 = fma(_302, _302, _310);
    float _324 = _106 * _266;
    float _326 = _306 * _306;
    float _328 = in.m_46.z;
    float _330 = gl_FragCoord.w;
    float _332 = _328 * _330;
    float _334 = rsqrt(_322);
    float _336 = _324 * _324;
    float _338 = in.m_56.z;
    float _340 = gl_FragCoord.w;
    float _342 = _338 * _340;
    float _344 = fma(_312, _312, _336);
    float _346 = _106 * _284;
    float _348 = in.m_56.x;
    float _350 = gl_FragCoord.w;
    float _352 = _348 * _350;
    float _354 = fma(_314, _314, _344);
    float _356 = fma(_346, _346, _326);
    float _358 = fma(_308, _308, _356);
    float _360 = rsqrt(_354);
    float _362 = _298 * _334;
    float _364 = _300 * _334;
    float _366 = _302 * _334;
    float _368 = _362 * _362;
    float _370 = rsqrt(_358);
    float _372 = fma(_364, _364, _368);
    float _374 = fma(_366, _366, _372);
    float _376 = rsqrt(_374);
    float _378 = _308 * _370;
    float _380 = _242 * _242;
    float _382 = _242 * _370;
    float _384 = _240 * _360;
    float _386 = fma(_240, _240, _380);
    float _388 = precise::clamp(_386, 0.0, 1.0);
    float _390 = _306 * _382;
    float _392 = _346 * _382;
    float _394 = -_388;
    float _396 = _394 + 1.0;
    float _398 = fma(_324, _384, _390);
    float _400 = _242 * _378;
    float _402 = fma(_312, _384, _392);
    float _404 = _106 * _332;
    float _406 = _106 * _342;
    float _408 = sqrt(_396);
    float _410 = fma(_314, _384, _400);
    float _412 = in.m_46.x;
    float _414 = gl_FragCoord.w;
    float _416 = _412 * _414;
    float _418 = -_404;
    float _420 = _418 + _406;
    float _422 = _376 * _408;
    float _424 = fma(_362, _422, _398);
    float _426 = fma(_364, _422, _402);
    float _428 = fma(_366, _422, _410);
    float _430 = _424 * _424;
    float _432 = in.m_46.y;
    float _434 = gl_FragCoord.w;
    float _436 = _432 * _434;
    float _438 = fma(_426, _426, _430);
    float _440 = fma(_428, _428, _438);
    float _442 = rsqrt(_440);
    float _444 = (*spvDescriptorSet0.fp_c8)._m0[28].y * (*spvDescriptorSet0.fp_c8)._m0[28].y;
    float _446 = fma((*spvDescriptorSet0.fp_c8)._m0[28].x, (*spvDescriptorSet0.fp_c8)._m0[28].x, _444);
    float _448 = _106 * _416;
    float _450 = _424 * _442;
    float _452 = _428 * _442;
    float _454 = _106 * _436;
    float _456 = _450 * (-0.816474258899688720703125);
    float _458 = _106 * _320;
    float _460 = -_456;
    float _462 = fma(_452, 0.577381789684295654296875, _460);
    float _464 = _106 * _352;
    float _466 = -_454;
    float _468 = _466 + _458;
    float _470 = fma(_462, 0.5, 0.5);
    float _472 = -_448;
    float _474 = _472 + _464;
    float _476 = _470 * _470;
    float _478 = fma((*spvDescriptorSet0.fp_c8)._m0[28].z, (*spvDescriptorSet0.fp_c8)._m0[28].z, _446);
    float _480 = fma(_476, _474, _448);
    float _482 = fma(_476, _468, _454);
    float _484 = fma(_476, _420, _404);
    float _486 = rsqrt(_478);
    if (!_224)
    {
        out.m_59.x = _480;
        out.m_59.y = _482;
        out.m_59.z = _484;
        out.m_59.w = _194;
        return out;
    }
    float _488 = in.m_61.x;
    float _490 = gl_FragCoord.w;
    float _492 = _488 * _490;
    float _494 = _486 * (*spvDescriptorSet0.fp_c8)._m0[28].y;
    float _496 = _426 * _442;
    float _498 = _486 * (*spvDescriptorSet0.fp_c8)._m0[28].x;
    float _500 = _486 * (*spvDescriptorSet0.fp_c8)._m0[28].z;
    float _502 = _450 * _494;
    float _504 = abs(_364);
    float _506 = abs(_362);
    float _508 = precise::max(_504, _506);
    float _510 = -_476;
    float _512 = _510 + 1.0;
    float _514 = fma(_496, _498, _502);
    float _516 = fma(_452, _500, _514);
    float _518 = abs(_366);
    float _520 = precise::max(_518, _508);
    float _522 = -_512;
    float _524 = fma(_522, (*spvDescriptorSet0.fp_c9)._m0[191].y, 1.0);
    float _526 = -_130;
    float _528 = _526 + 1.0;
    float _530 = fma(_516, -0.5, 0.5);
    float _532 = 1.0 / _520;
    float _534 = fma(_530, (*spvDescriptorSet0.fp_c9)._m0[191].z, _524);
    float _536 = precise::clamp(_534, 0.0, 1.0);
    float _538 = -_536;
    float _540 = _538 + 1.0;
    float _542 = fma(_528, (*spvDescriptorSet0.fp_c9)._m0[191].x, _540);
    float _544 = precise::clamp(_542, 0.0, 1.0);
    float _546 = _106 * _492;
    float _548 = _364 * _532;
    float _550 = _362 * _532;
    float _552 = _544 + _546;
    float _554 = -_532;
    float _556 = _366 * _554;
    float _558 = precise::min(_552, 1.0);
    float3 _1423 = float3(_548, _550, _556);
    float3 _562 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1423, float3(0.0), isnan(_1423)), level(_558)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1423, float3(0.0), isnan(_1423)), level(_558)).xyz;
    float _564 = _562.x;
    float _566 = _562.y;
    float _568 = _562.z;
    float _570 = in.m_63.x;
    float _572 = gl_FragCoord.w;
    float _574 = _570 * _572;
    float _576 = in.m_63.z;
    float _578 = gl_FragCoord.w;
    float _580 = _576 * _578;
    float _582 = in.m_63.y;
    float _584 = gl_FragCoord.w;
    float _586 = _582 * _584;
    float _588 = in.m_65.x;
    float _590 = gl_FragCoord.w;
    float _592 = _588 * _590;
    float _594 = in.m_65.y;
    float _596 = gl_FragCoord.w;
    float _598 = _594 * _596;
    float _600 = in.m_65.z;
    float _602 = gl_FragCoord.w;
    float _604 = _600 * _602;
    float _606 = in.m_67.x;
    float _608 = gl_FragCoord.w;
    float _610 = _606 * _608;
    float _612 = in.m_67.y;
    float _614 = gl_FragCoord.w;
    float _616 = _612 * _614;
    float _618 = in.m_67.z;
    float _620 = gl_FragCoord.w;
    float _622 = _618 * _620;
    float _624 = in.m_67.w;
    float _626 = gl_FragCoord.w;
    float _628 = _624 * _626;
    bool _630 = 0.5 <= (*spvDescriptorSet0.fp_c15)._m0[653].w;
    float _632 = _106 * _574;
    float _634 = _106 * _586;
    float _636 = _106 * _592;
    float _638 = _106 * _598;
    float _640 = _106 * _604;
    float _642 = _106 * _616;
    float _644 = _106 * _622;
    float _646 = _106 * _628;
    float _648 = fma(_564, 0.20999999344348907470703125, _632);
    float _650 = _106 * _580;
    float _652 = _106 * _610;
    float _654 = fma(_566, 0.20999999344348907470703125, _634);
    if (_630)
    {
        float _656 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _658 = _168 + _656;
        _232 = _658;
    }
    float _660 = _232;
    float _662 = fma(_568, 0.20999999344348907470703125, _650);
    float _664 = _648 + _636;
    float _666 = _654 + _638;
    float _668 = _660;
    if (_630)
    {
        float _670 = _660 * 8.0;
        float _672 = precise::clamp(_670, 0.0, 1.0);
        _668 = _672;
    }
    float _674 = _668;
    float _676 = _662 + _640;
    float _678 = 0.0 + _214;
    float _680 = precise::clamp(_678, 0.0, 1.0);
    float _682 = _480 * _664;
    float _684 = _482 * _666;
    float _686 = _484 * _676;
    float _688 = _680;
    if (_630)
    {
        float _690 = _680 * _674;
        _688 = _690;
    }
    float _692 = _688;
    float _694 = fma(_682, _646, _652);
    float _696 = fma(_684, _646, _642);
    float _698 = fma(_686, _646, _644);
    float _700 = 0.0 + _692;
    float _702 = precise::clamp(_700, 0.0, 1.0);
    out.m_59.x = _694;
    out.m_59.y = _696;
    out.m_59.z = _698;
    out.m_59.w = _702;
    return out;
}

