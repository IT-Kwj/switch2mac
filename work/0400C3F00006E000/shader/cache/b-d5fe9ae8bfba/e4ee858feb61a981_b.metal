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
    constant _16* fp_c8 [[id(0)]];
    constant _16* fp_c9 [[id(1)]];
    constant _16* fp_c15 [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    texture2d_array<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    texture2d<float> fp_t_tcb_C [[id(7)]];
    sampler fp_t_tcb_CSmplr [[id(8)]];
    sampler fp_t_tcb_8Smplr_w [[id(9)]];
    sampler fp_t_tcb_ASmplr_w [[id(10)]];
    sampler fp_t_tcb_CSmplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_61 [[color(0)]];
};

struct main0_in
{
    float4 m_56 [[user(locn0)]];
    float4 m_58 [[user(locn1)]];
    float4 m_52 [[user(locn2)]];
    float4 m_44 [[user(locn3), flat]];
    float4 m_40 [[user(locn4)]];
    float4 m_65 [[user(locn5)]];
    float4 m_54 [[user(locn6)]];
    float4 m_42 [[user(locn7), flat]];
    float4 m_46 [[user(locn8)]];
    float4 m_48 [[user(locn9)]];
    float4 m_50 [[user(locn10)]];
    float4 m_63 [[user(locn11)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _72 = gl_FragCoord.w;
    float _74 = in.m_40.x;
    float _76 = gl_FragCoord.w;
    float _78 = _74 * _76;
    float _80 = in.m_40.y;
    float _82 = gl_FragCoord.w;
    float _84 = _80 * _82;
    float _86 = 1.0 / _72;
    float _88 = _86 * _78;
    float _90 = _86 * _84;
    float2 _706 = float2(_88, _90);
    float _92 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_706, float2(0.0), isnan(_706))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_706, float2(0.0), isnan(_706))).w;
    float _94 = in.m_42.y;
    float _96 = in.m_42.z;
    float _98 = in.m_44.y;
    float _100 = in.m_42.x;
    float _102 = in.m_40.w;
    float _104 = gl_FragCoord.w;
    float _106 = _102 * _104;
    float _108 = in.m_40.z;
    float _110 = gl_FragCoord.w;
    float _112 = _108 * _110;
    float _114 = in.m_46.x;
    float _116 = gl_FragCoord.w;
    float _118 = _114 * _116;
    float _120 = in.m_46.y;
    float _122 = gl_FragCoord.w;
    float _124 = _120 * _122;
    float _126 = _94 * 4.0;
    float _128 = _96 * 3.0;
    float _130 = fma(_98, 0.14000000059604644775390625, _94);
    float _132 = fma(_98, 0.10999999940395355224609375, _100);
    float _134 = floor(_128);
    float _136 = _86 * _106;
    float _138 = _86 * _112;
    float _140 = floor(_126);
    float _142 = rint(_132);
    float _144 = _140 + _134;
    float _146 = rint(_130);
    float _148 = fma(_136, 1.7999999523162841796875, -0.4000000059604644775390625);
    float _150 = fma(_142, -0.3300000131130218505859375, _136);
    float _152 = rint(_144);
    float _154 = precise::max(_152, 0.0);
    uint _157 = uint(_154);
    uint _159 = clamp(_157, 0u, 65535u);
    float _161 = fma(_138, 1.7999999523162841796875, -0.4000000059604644775390625);
    float _163 = rint(_140);
    float _165 = precise::max(_163, 0.0);
    uint _167 = uint(_165);
    uint _169 = clamp(_167, 0u, 65535u);
    float _171 = fma(_146, -0.3300000131130218505859375, _148);
    float _173 = _86 * _118;
    float _175 = _86 * _124;
    float _177 = fma(_92, 2.0, -1.0);
    float _179 = fma(_177, 0.07999999821186065673828125, _150);
    float _181 = fma(_177, 0.20000000298023223876953125, _138);
    float3 _839 = float3(_161, _171, float(int(_159)));
    float3 _843 = select(_839, float3(0.0), isnan(_839));
    float _183 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _843.xy, uint(rint(_843.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _843.xy, uint(rint(_843.z))).w;
    float3 _852 = float3(_181, _179, float(int(_169)));
    float3 _854 = select(_852, float3(0.0), isnan(_852));
    float _185 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _854.xy, uint(rint(_854.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _854.xy, uint(rint(_854.z))).w;
    float2 _860 = float2(_173, _175);
    float4 _188 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_860, float2(0.0), isnan(_860))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_860, float2(0.0), isnan(_860))).xyzw;
    float _190 = _188.x;
    float _192 = _188.y;
    float _194 = _188.z;
    float _196 = _188.w;
    float _198 = in.m_48.y;
    float _200 = gl_FragCoord.w;
    float _202 = _198 * _200;
    float _204 = in.m_50.y;
    float _206 = gl_FragCoord.w;
    float _208 = _204 * _206;
    float _210 = in.m_48.x;
    float _212 = gl_FragCoord.w;
    float _214 = _210 * _212;
    float _216 = in.m_50.x;
    float _218 = gl_FragCoord.w;
    float _220 = _216 * _218;
    float _222 = in.m_50.z;
    float _224 = gl_FragCoord.w;
    float _226 = _222 * _224;
    float _228 = in.m_48.z;
    float _230 = gl_FragCoord.w;
    float _232 = _228 * _230;
    float _234 = _86 * _202;
    float _236 = _86 * _208;
    float _238 = _86 * _214;
    float _240 = _86 * _220;
    float _242 = _234 * _234;
    float _244 = -(*spvDescriptorSet0.fp_c8)._m0[29].y;
    float _246 = _236 + _244;
    float _248 = _86 * _226;
    float _250 = -(*spvDescriptorSet0.fp_c8)._m0[29].x;
    float _252 = _240 + _250;
    float _254 = fma(_238, _238, _242);
    float _256 = _246 * _246;
    float _258 = _86 * _232;
    float _260 = -(*spvDescriptorSet0.fp_c8)._m0[29].z;
    float _262 = _248 + _260;
    float _264 = in.m_52.w;
    float _266 = gl_FragCoord.w;
    float _268 = _264 * _266;
    float _270 = fma(_252, _252, _256);
    float _272 = fma(_258, _258, _254);
    float _274 = in.m_54.x;
    float _276 = gl_FragCoord.w;
    float _278 = _274 * _276;
    float _280 = fma(_262, _262, _270);
    float _282 = rsqrt(_272);
    float _284 = rsqrt(_280);
    float _286 = _238 * _282;
    float _288 = _234 * _282;
    float _290 = _258 * _282;
    float _292 = _288 * _288;
    float _294 = _246 * _284;
    float _296 = _252 * _284;
    float _298 = _262 * _284;
    float _300 = fma(_286, _286, _292);
    float _302 = _294 * _294;
    float _304 = fma(_290, _290, _300);
    float _306 = fma(_296, _296, _302);
    float _308 = in.m_52.y;
    float _310 = gl_FragCoord.w;
    float _312 = _308 * _310;
    float _314 = fma(_298, _298, _306);
    float _316 = rsqrt(_304);
    float _318 = _86 * _268;
    float _320 = rsqrt(_314);
    float _322 = abs(_318);
    float _324 = log2(_322);
    float _326 = _288 * _316;
    float _328 = _286 * _316;
    float _330 = _290 * _316;
    float _332 = _294 * _320;
    float _334 = _296 * _320;
    float _336 = in.m_52.x;
    float _338 = gl_FragCoord.w;
    float _340 = _336 * _338;
    float _342 = _298 * _320;
    float _344 = _326 * _332;
    float _346 = in.m_56.w;
    float _348 = gl_FragCoord.w;
    float _350 = _346 * _348;
    float _352 = _324 * 12.0;
    float _354 = fma(_328, _334, _344);
    float _356 = fma(_330, _342, _354);
    float _358 = exp2(_352);
    float _360 = _318 * _318;
    float _362 = abs(_356);
    float _364 = fma(_362, 2.5000002384185791015625, -0.75000011920928955078125);
    float _366 = precise::clamp(_364, 0.0, 1.0);
    float _368 = fma(_366, -2.0, 3.0);
    float _370 = _366 * _366;
    float _372 = _368 * _370;
    float _374 = _86 * _340;
    float _376 = _358 * 0.5;
    float _378 = _374 * _372;
    float _380 = in.m_58.x;
    float _382 = gl_FragCoord.w;
    float _384 = _380 * _382;
    float _386 = in.m_56.y;
    float _388 = gl_FragCoord.w;
    float _390 = _386 * _388;
    float _392 = in.m_58.y;
    float _394 = gl_FragCoord.w;
    float _396 = _392 * _394;
    float _398 = fma(_183, 0.100000001490116119384765625, _185);
    float _400 = _86 * _312;
    float _402 = fma(_196, _360, _376);
    float _404 = _86 * _350;
    float _406 = _398 * 2.0;
    float _408 = precise::clamp(_406, 0.0, 1.0);
    float _410 = _360 * _408;
    float _412 = _400 * _410;
    float _414 = fma(_402, _378, _412);
    float _416 = _404 * _414;
    float _418 = _372 * _416;
    float _420 = _86 * _278;
    float _422 = 0.0 + _418;
    float _424 = precise::clamp(_422, 0.0, 1.0);
    float _426 = _424 * _420;
    bool _430 = _426 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _432 = isnan(_426);
    bool _434 = _430 || _432;
    bool _436 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _438 = _434 || _436;
    float _440 = in.m_52.z;
    float _442 = gl_FragCoord.w;
    float _444 = _440 * _442;
    float _446 = in.m_56.x;
    float _448 = gl_FragCoord.w;
    float _450 = _446 * _448;
    if (!_438)
    {
        discard_fragment();
    }
    float _452 = in.m_56.z;
    float _454 = gl_FragCoord.w;
    float _456 = _452 * _454;
    float _458 = precise::max(_398, 0.5);
    float _460 = _190 * _190;
    float _462 = in.m_58.z;
    float _464 = gl_FragCoord.w;
    float _466 = _462 * _464;
    float _468 = _192 * _192;
    float _470 = precise::min(_458, 0.89999997615814208984375);
    float _472 = _194 * _194;
    float _474 = fma(_460, _360, _376);
    float _476 = fma(_470, 2.5000002384185791015625, -1.25000011920928955078125);
    float _478 = _86 * _444;
    float _480 = -_478;
    float _482 = _480 + 1.0;
    float _484 = fma(_482, _482, _476);
    float _486 = _86 * _450;
    float _488 = _86 * _384;
    float _490 = _86 * _390;
    float _492 = _318 * _484;
    float _494 = _86 * _396;
    float _496 = -_488;
    float _498 = _486 + _496;
    float _500 = _486 * 0.5;
    float _502 = _86 * _456;
    float _504 = fma(_492, _498, _488);
    float _506 = fma(_468, _360, _376);
    float _508 = -_494;
    float _510 = _490 + _508;
    float _512 = fma(_472, _360, _376);
    float _514 = _86 * _466;
    float _516 = _490 * 0.5;
    float _518 = _502 * 0.5;
    float _520 = _474 * _378;
    float _522 = _506 * _378;
    float _524 = _512 * _378;
    float _526 = -_514;
    float _528 = _502 + _526;
    float _530 = -_516;
    float _532 = _530 + 0.100000001490116119384765625;
    float _534 = -_518;
    float _536 = _534 + 0.5;
    float _538 = fma(_492, _510, _494);
    float _540 = fma(_492, _528, _514);
    float _542 = -_500;
    float _544 = fma(_542, _520, _500);
    float _546 = fma(_522, _532, _516);
    float _548 = fma(_524, _536, _518);
    float _550 = fma(_400, _504, _544);
    float _552 = fma(_400, _538, _546);
    float _554 = fma(_400, _540, _548);
    float _556 = _404 * _550;
    float _558 = _404 * _552;
    float _560 = _404 * _554;
    if (!_438)
    {
        out.m_61.x = _556;
        out.m_61.y = _558;
        out.m_61.z = _560;
        out.m_61.w = _418;
        return out;
    }
    float _562 = _558 * 0.715200006961822509765625;
    float _564 = in.m_63.w;
    float _566 = gl_FragCoord.w;
    float _568 = _564 * _566;
    float _570 = in.m_63.z;
    float _572 = gl_FragCoord.w;
    float _574 = _570 * _572;
    float _576 = in.m_63.x;
    float _578 = gl_FragCoord.w;
    float _580 = _576 * _578;
    float _582 = fma(_556, 0.2125999927520751953125, _562);
    float _584 = in.m_63.y;
    float _586 = gl_FragCoord.w;
    float _588 = _584 * _586;
    float _590 = 0.0 + _426;
    float _592 = precise::clamp(_590, 0.0, 1.0);
    float _594 = fma(_560, 0.072200000286102294921875, _582);
    bool _596 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _598 = 1.0 / _594;
    float _600 = _598 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _602 = precise::clamp(_600, 0.0, 1.0);
    float _604 = _86 * _568;
    float _606 = fma(_602, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _608 = _86 * _574;
    float _610 = _606 * _604;
    float _612 = _86 * _580;
    float _614 = _86 * _588;
    float _616 = fma(_560, _610, _608);
    float _618 = fma(_556, _610, _612);
    float _620 = fma(_558, _610, _614);
    float _622 = _608;
    if (!_596)
    {
        _622 = _592;
    }
    float _624 = _622;
    bool _626 = !_596;
    float _628 = _624;
    if (!_626)
    {
        float _630 = in.m_65.w;
        float _632 = gl_FragCoord.w;
        float _634 = _630 * _632;
        float _636 = in.m_65.z;
        float _638 = gl_FragCoord.w;
        float _640 = _636 * _638;
        float _642 = _86 * _634;
        float _644 = _86 * _640;
        float _646 = 1.0 / _642;
        float _648 = _644 * _646;
        float _650 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _652 = fma(_648, (*spvDescriptorSet0.fp_c8)._m0[30].w, _650);
        float _654 = 1.0 / _652;
        float _656 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _658 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _660 = fma(_654, _656, _658);
        float _662 = _660 * 8.0;
        float _664 = precise::clamp(_662, 0.0, 1.0);
        float _666 = _592 * _664;
        _628 = _666;
    }
    float _668 = _628;
    float _670 = 0.0 + _668;
    float _672 = precise::clamp(_670, 0.0, 1.0);
    out.m_61.x = _618;
    out.m_61.y = _620;
    out.m_61.z = _616;
    out.m_61.w = _672;
    return out;
}

