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
    texture2d<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    texture2d<float> fp_t_tcb_10 [[id(5)]];
    sampler fp_t_tcb_10Smplr [[id(6)]];
    texturecube<float> fp_t_tcb_1E [[id(7)]];
    sampler fp_t_tcb_1ESmplr [[id(8)]];
    sampler fp_t_tcb_ASmplr_w [[id(9)]];
    sampler fp_t_tcb_10Smplr_w [[id(10)]];
    sampler fp_t_tcb_1ESmplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_59 [[color(0)]];
};

struct main0_in
{
    float4 m_56 [[user(locn0)]];
    float4 m_42 [[user(locn1)]];
    float4 m_54 [[user(locn2)]];
    float4 m_63 [[user(locn3)]];
    float4 m_52 [[user(locn4)]];
    float4 m_40 [[user(locn5)]];
    float4 m_50 [[user(locn6)]];
    float4 m_46 [[user(locn7)]];
    float4 m_44 [[user(locn8)]];
    float4 m_48 [[user(locn9)]];
    float4 m_65 [[user(locn10)]];
    float4 m_61 [[user(locn11)]];
    float4 m_67 [[user(locn12)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _74 = gl_FragCoord.w;
    float _76 = in.m_40.z;
    float _78 = gl_FragCoord.w;
    float _80 = _76 * _78;
    float _82 = in.m_40.w;
    float _84 = gl_FragCoord.w;
    float _86 = _82 * _84;
    float _88 = in.m_42.w;
    float _90 = gl_FragCoord.w;
    float _92 = _88 * _90;
    float _94 = in.m_42.x;
    float _96 = gl_FragCoord.w;
    float _98 = _94 * _96;
    float _100 = in.m_42.y;
    float _102 = gl_FragCoord.w;
    float _104 = _100 * _102;
    float _106 = 1.0 / _74;
    float _108 = _106 * _80;
    float _110 = _106 * _86;
    float _112 = _106 * _92;
    float _114 = _106 * _98;
    float _116 = _106 * _104;
    float2 _724 = float2(_108, _110);
    float2 _120 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_724, float2(0.0), isnan(_724))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_724, float2(0.0), isnan(_724))).xy;
    float _122 = _120.x;
    float _124 = _120.y;
    float _126 = 1.0 / _112;
    float _128 = _114 * _126;
    float _130 = _116 * _126;
    float2 _747 = float2(_128, _130);
    float _132 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_747, float2(0.0), isnan(_747))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_747, float2(0.0), isnan(_747))).x;
    float _134 = in.m_44.y;
    float _136 = gl_FragCoord.w;
    float _138 = _134 * _136;
    float _140 = in.m_44.x;
    float _142 = gl_FragCoord.w;
    float _144 = _140 * _142;
    float _146 = in.m_44.z;
    float _148 = gl_FragCoord.w;
    float _150 = _146 * _148;
    float _152 = in.m_46.y;
    float _154 = gl_FragCoord.w;
    float _156 = _152 * _154;
    float _158 = in.m_46.x;
    float _160 = gl_FragCoord.w;
    float _162 = _158 * _160;
    float _164 = in.m_46.z;
    float _166 = gl_FragCoord.w;
    float _168 = _164 * _166;
    float _170 = in.m_48.y;
    float _172 = gl_FragCoord.w;
    float _174 = _170 * _172;
    float _176 = in.m_48.x;
    float _178 = gl_FragCoord.w;
    float _180 = _176 * _178;
    float _182 = in.m_50.y;
    float _184 = gl_FragCoord.w;
    float _186 = _182 * _184;
    float _188 = in.m_48.z;
    float _190 = gl_FragCoord.w;
    float _192 = _188 * _190;
    float _194 = in.m_50.x;
    float _196 = gl_FragCoord.w;
    float _198 = _194 * _196;
    float _200 = in.m_50.z;
    float _202 = gl_FragCoord.w;
    float _204 = _200 * _202;
    float _206 = _106 * _138;
    float _208 = _106 * _144;
    float _210 = -(*spvDescriptorSet0.fp_c8)._m0[29].y;
    float _212 = _206 + _210;
    float _214 = _106 * _150;
    float _216 = -(*spvDescriptorSet0.fp_c8)._m0[29].x;
    float _218 = _208 + _216;
    float _220 = _212 * _212;
    float _222 = -(*spvDescriptorSet0.fp_c8)._m0[29].z;
    float _224 = _214 + _222;
    float _226 = _106 * _162;
    float _228 = fma(_218, _218, _220);
    float _230 = _106 * _168;
    float _232 = fma(_224, _224, _228);
    float _234 = _106 * _156;
    float _236 = _106 * _198;
    float _238 = rsqrt(_232);
    float _240 = _234 * _234;
    float _242 = fma(_226, _226, _240);
    float _244 = fma(_230, _230, _242);
    float _246 = _106 * _186;
    float _248 = rsqrt(_244);
    float _250 = _212 * _238;
    float _252 = _218 * _238;
    float _254 = _224 * _238;
    float _256 = _106 * _174;
    float _258 = _250 * _250;
    float _260 = _106 * _204;
    float _262 = _256 * _256;
    float _264 = fma(_252, _252, _258);
    float _266 = _106 * _180;
    float _268 = fma(_254, _254, _264);
    float _270 = fma(_266, _266, _262);
    float _272 = _106 * _192;
    float _274 = _246 * _246;
    float _276 = _234 * _248;
    float _278 = _226 * _248;
    float _280 = fma(_272, _272, _270);
    float _282 = fma(_236, _236, _274);
    float _284 = in.m_42.z;
    float _286 = gl_FragCoord.w;
    float _288 = _284 * _286;
    float _290 = _276 * _276;
    float _292 = rsqrt(_280);
    float _294 = fma(_260, _260, _282);
    float _296 = _230 * _248;
    float _298 = fma(_278, _278, _290);
    float _300 = fma(_296, _296, _298);
    float _302 = rsqrt(_294);
    float _304 = rsqrt(_300);
    float _306 = rsqrt(_268);
    float _308 = _260 * _302;
    float _310 = _106 * _288;
    float _312 = _310 * _126;
    float _314 = _250 * _306;
    float _316 = _252 * _306;
    float _318 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _320 = fma(_312, (*spvDescriptorSet0.fp_c8)._m0[30].w, _318);
    float _322 = _254 * _306;
    float _324 = _124 * _124;
    float _326 = _124 * _302;
    float _328 = _122 * _292;
    float _330 = _124 * _308;
    float _332 = fma(_122, _122, _324);
    float _334 = precise::clamp(_332, 0.0, 1.0);
    float _336 = _246 * _326;
    float _338 = _236 * _326;
    float _340 = -_334;
    float _342 = _340 + 1.0;
    float _344 = in.m_52.w;
    float _346 = gl_FragCoord.w;
    float _348 = _344 * _346;
    float _350 = fma(_256, _328, _336);
    float _352 = fma(_266, _328, _338);
    float _354 = fma(_272, _328, _330);
    float _356 = sqrt(_342);
    float _358 = in.m_54.x;
    float _360 = gl_FragCoord.w;
    float _362 = _358 * _360;
    float _364 = 1.0 / _320;
    float _366 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _368 = fma(_132, (*spvDescriptorSet0.fp_c8)._m0[30].w, _366);
    float _370 = _304 * _356;
    float _372 = 1.0 / _368;
    float _374 = fma(_276, _370, _350);
    float _376 = fma(_278, _370, _352);
    float _378 = fma(_296, _370, _354);
    float _380 = _374 * _314;
    float _382 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _384 = _364 * _382;
    float _386 = fma(_376, _316, _380);
    float _388 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _390 = fma(_378, _322, _386);
    float _392 = abs(_390);
    float _394 = fma(_392, 3.3333332538604736328125, -0.666666686534881591796875);
    float _396 = precise::clamp(_394, 0.0, 1.0);
    float _398 = fma(_396, -2.0, 3.0);
    float _400 = _396 * _396;
    float _402 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _404 = -_384;
    float _406 = fma(_372, _402, _404);
    float _408 = _106 * _362;
    float _410 = _398 * _400;
    float _412 = _106 * _348;
    float _414 = _406 * _388;
    float _416 = precise::clamp(_414, 0.0, 1.0);
    float _418 = _410 * _412;
    float _420 = 0.0 + _418;
    float _422 = precise::clamp(_420, 0.0, 1.0);
    float _424 = _422 * _416;
    float _426 = _424 * _408;
    bool _430 = _426 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _432 = isnan(_426);
    bool _434 = _430 || _432;
    bool _436 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _438 = _434 || _436;
    float _440 = in.m_56.x;
    float _442 = gl_FragCoord.w;
    float _444 = _440 * _442;
    float _446 = in.m_56.y;
    float _448 = gl_FragCoord.w;
    float _450 = _446 * _448;
    float _452 = in.m_56.z;
    float _454 = gl_FragCoord.w;
    float _456 = _452 * _454;
    float _458 = _384;
    if (!_438)
    {
        discard_fragment();
    }
    float _460 = _106 * _444;
    float _462 = _106 * _450;
    float _464 = _106 * _456;
    if (!_438)
    {
        out.m_59.x = _460;
        out.m_59.y = _462;
        out.m_59.z = _464;
        out.m_59.w = _418;
        return out;
    }
    float _466 = in.m_61.x;
    float _468 = gl_FragCoord.w;
    float _470 = _466 * _468;
    float _472 = _378 * (-0.577381789684295654296875);
    float _474 = abs(_278);
    float _476 = abs(_276);
    float _478 = precise::max(_474, _476);
    float _480 = -(*spvDescriptorSet0.fp_c9)._m0[191].x;
    float _482 = _480 + (*spvDescriptorSet0.fp_c9)._m0[191].y;
    float _484 = fma(_374, -0.816474258899688720703125, _472);
    float _486 = abs(_296);
    float _488 = precise::max(_486, _478);
    float _490 = fma(_484, 0.5, 0.5);
    float _492 = 1.0 / _482;
    float _494 = precise::max(_490, (*spvDescriptorSet0.fp_c9)._m0[191].x);
    float _496 = 1.0 / _488;
    float _498 = precise::min(_494, (*spvDescriptorSet0.fp_c9)._m0[191].y);
    float _500 = -(*spvDescriptorSet0.fp_c9)._m0[191].x;
    float _502 = _498 + _500;
    float _504 = _106 * _470;
    float _506 = fma(_502, _492, _504);
    float _508 = _278 * _496;
    float _510 = _276 * _496;
    float _512 = -_496;
    float _514 = _296 * _512;
    float _516 = precise::min(_506, 1.0);
    float3 _1321 = float3(_508, _510, _514);
    float3 _520 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1321, float3(0.0), isnan(_1321)), level(_516)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1321, float3(0.0), isnan(_1321)), level(_516)).xyz;
    float _522 = _520.x;
    float _524 = _520.y;
    float _526 = _520.z;
    float _528 = in.m_63.x;
    float _530 = gl_FragCoord.w;
    float _532 = _528 * _530;
    float _534 = in.m_63.y;
    float _536 = gl_FragCoord.w;
    float _538 = _534 * _536;
    float _540 = in.m_63.z;
    float _542 = gl_FragCoord.w;
    float _544 = _540 * _542;
    float _546 = in.m_65.x;
    float _548 = gl_FragCoord.w;
    float _550 = _546 * _548;
    float _552 = in.m_65.y;
    float _554 = gl_FragCoord.w;
    float _556 = _552 * _554;
    float _558 = in.m_65.z;
    float _560 = gl_FragCoord.w;
    float _562 = _558 * _560;
    float _564 = in.m_67.x;
    float _566 = gl_FragCoord.w;
    float _568 = _564 * _566;
    float _570 = in.m_67.y;
    float _572 = gl_FragCoord.w;
    float _574 = _570 * _572;
    float _576 = in.m_67.z;
    float _578 = gl_FragCoord.w;
    float _580 = _576 * _578;
    float _582 = in.m_67.w;
    float _584 = gl_FragCoord.w;
    float _586 = _582 * _584;
    bool _588 = 0.5 <= (*spvDescriptorSet0.fp_c15)._m0[653].w;
    if (_588)
    {
        float _590 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _592 = _384 + _590;
        _458 = _592;
    }
    float _594 = _458;
    float _596 = _594;
    if (_588)
    {
        float _598 = _594 * 8.0;
        float _600 = precise::clamp(_598, 0.0, 1.0);
        _596 = _600;
    }
    float _602 = _596;
    float _604 = _106 * _532;
    float _606 = _106 * _544;
    float _608 = _106 * _550;
    float _610 = _106 * _562;
    float _612 = _106 * _574;
    float _614 = _106 * _580;
    float _616 = fma(_522, 0.20999999344348907470703125, _604);
    float _618 = _106 * _538;
    float _620 = _106 * _556;
    float _622 = fma(_526, 0.20999999344348907470703125, _606);
    float _624 = _106 * _568;
    float _626 = fma(_524, 0.20999999344348907470703125, _618);
    float _628 = _616 + _608;
    float _630 = _622 + _610;
    float _632 = 0.0 + _426;
    float _634 = precise::clamp(_632, 0.0, 1.0);
    float _636 = _626 + _620;
    float _638 = _106 * _586;
    float _640 = _460 * _628;
    float _642 = _464 * _630;
    float _644 = _462 * _636;
    float _646 = _634;
    if (_588)
    {
        float _648 = _634 * _602;
        _646 = _648;
    }
    float _650 = _646;
    float _652 = fma(_640, _638, _624);
    float _654 = fma(_642, _638, _614);
    float _656 = fma(_644, _638, _612);
    float _658 = 0.0 + _650;
    float _660 = precise::clamp(_658, 0.0, 1.0);
    out.m_59.x = _652;
    out.m_59.y = _656;
    out.m_59.z = _654;
    out.m_59.w = _660;
    return out;
}

