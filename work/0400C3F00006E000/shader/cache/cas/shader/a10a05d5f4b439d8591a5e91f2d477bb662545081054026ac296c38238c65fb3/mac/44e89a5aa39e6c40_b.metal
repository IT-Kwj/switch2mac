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
    texture2d<float> fp_t_tcb_C [[id(3)]];
    sampler fp_t_tcb_CSmplr [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_A [[id(7)]];
    sampler fp_t_tcb_ASmplr [[id(8)]];
    texturecube<float> fp_t_tcb_1E [[id(9)]];
    sampler fp_t_tcb_1ESmplr [[id(10)]];
    sampler fp_t_tcb_CSmplr_w [[id(11)]];
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
    float4 m_46 [[user(locn0)]];
    float4 m_48 [[user(locn1)]];
    float4 m_44 [[user(locn2)]];
    float4 m_69 [[user(locn3)]];
    float4 m_63 [[user(locn4)]];
    float4 m_50 [[user(locn5)]];
    float4 m_42 [[user(locn6)]];
    float4 m_56 [[user(locn7)]];
    float4 m_52 [[user(locn8)]];
    float4 m_54 [[user(locn9)]];
    float4 m_65 [[user(locn10)]];
    float4 m_61 [[user(locn11)]];
    float4 m_67 [[user(locn12)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _76 = gl_FragCoord.w;
    float _78 = in.m_42.x;
    float _80 = gl_FragCoord.w;
    float _82 = _78 * _80;
    float _84 = in.m_42.y;
    float _86 = gl_FragCoord.w;
    float _88 = _84 * _86;
    float _90 = in.m_44.x;
    float _92 = gl_FragCoord.w;
    float _94 = _90 * _92;
    float _96 = in.m_44.y;
    float _98 = gl_FragCoord.w;
    float _100 = _96 * _98;
    float _102 = 1.0 / _76;
    float _104 = _102 * _82;
    float _106 = _102 * _88;
    float _108 = _102 * _94;
    float _110 = _102 * _100;
    float2 _747 = float2(_104, _106);
    float _112 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_747, float2(0.0), isnan(_747))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_747, float2(0.0), isnan(_747))).w;
    float2 _758 = float2(_108, _110);
    float2 _116 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_758, float2(0.0), isnan(_758))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_758, float2(0.0), isnan(_758))).xw;
    float _118 = _116.x;
    float _120 = _116.y;
    float _122 = in.m_46.w;
    float _124 = gl_FragCoord.w;
    float _126 = _122 * _124;
    float _128 = in.m_48.w;
    float _130 = gl_FragCoord.w;
    float _132 = _128 * _130;
    float _134 = in.m_50.x;
    float _136 = gl_FragCoord.w;
    float _138 = _134 * _136;
    float _140 = _102 * _126;
    float _142 = _102 * _132;
    float _144 = in.m_44.z;
    float _146 = gl_FragCoord.w;
    float _148 = _144 * _146;
    float _150 = _102 * _148;
    float _152 = _112 * _120;
    float _154 = _102 * _138;
    float _156 = -_152;
    float _158 = _120 + _156;
    float _160 = fma(_140, _158, _152);
    bool _164 = _160 >= _142;
    bool _166 = isnan(_160);
    bool _168 = _164 || _166;
    bool _170 = isnan(_142);
    bool _172 = _168 || _170;
    float _174 = float(_172);
    float _176 = 0.0 + _174;
    float _178 = precise::clamp(_176, 0.0, 1.0);
    float _180 = _178 * _154;
    bool _182 = _180 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _184 = isnan(_180);
    bool _186 = _182 || _184;
    bool _188 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _190 = _186 || _188;
    float _192 = in.m_44.w;
    float _194 = gl_FragCoord.w;
    float _196 = _192 * _194;
    if (!_190)
    {
        discard_fragment();
    }
    float _198 = _102 * _196;
    float2 _877 = float2(_150, _198);
    float2 _200 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_877, float2(0.0), isnan(_877))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_877, float2(0.0), isnan(_877))).xy;
    float _202 = _200.x;
    float _204 = _200.y;
    float _206 = in.m_52.y;
    float _208 = gl_FragCoord.w;
    float _210 = _206 * _208;
    float _212 = in.m_52.x;
    float _214 = gl_FragCoord.w;
    float _216 = _212 * _214;
    float _218 = in.m_52.z;
    float _220 = gl_FragCoord.w;
    float _222 = _218 * _220;
    float _224 = in.m_54.y;
    float _226 = gl_FragCoord.w;
    float _228 = _224 * _226;
    float _230 = in.m_54.x;
    float _232 = gl_FragCoord.w;
    float _234 = _230 * _232;
    float _236 = in.m_56.y;
    float _238 = gl_FragCoord.w;
    float _240 = _236 * _238;
    float _242 = in.m_54.z;
    float _244 = gl_FragCoord.w;
    float _246 = _242 * _244;
    float _248 = in.m_56.x;
    float _250 = gl_FragCoord.w;
    float _252 = _248 * _250;
    float _254 = in.m_56.z;
    float _256 = gl_FragCoord.w;
    float _258 = _254 * _256;
    float _260 = in.m_46.z;
    float _262 = gl_FragCoord.w;
    float _264 = _260 * _262;
    float _266 = _102 * _210;
    float _268 = _102 * _216;
    float _270 = _102 * _222;
    float _272 = _102 * _228;
    float _274 = _266 * _266;
    float _276 = _102 * _234;
    float _278 = _102 * _240;
    float _280 = _102 * _246;
    float _282 = fma(_268, _268, _274);
    float _284 = _102 * _252;
    float _286 = _278 * _278;
    float _288 = in.m_46.x;
    float _290 = gl_FragCoord.w;
    float _292 = _288 * _290;
    float _294 = fma(_270, _270, _282);
    float _296 = _272 * _272;
    float _298 = fma(_284, _284, _286);
    float _300 = fma(_276, _276, _296);
    float _302 = rsqrt(_294);
    float _304 = fma(_280, _280, _300);
    float _306 = _102 * _258;
    float _308 = in.m_46.y;
    float _310 = gl_FragCoord.w;
    float _312 = _308 * _310;
    float _314 = fma(_306, _306, _298);
    float _316 = rsqrt(_304);
    float _318 = _266 * _302;
    float _320 = _268 * _302;
    float _322 = _270 * _302;
    float _324 = rsqrt(_314);
    float _326 = _318 * _318;
    float _328 = fma(_320, _320, _326);
    float _330 = fma(_322, _322, _328);
    float _332 = rsqrt(_330);
    float _334 = _204 * _204;
    float _336 = _204 * _324;
    float _338 = _316 * _202;
    float _340 = fma(_202, _202, _334);
    float _342 = precise::clamp(_340, 0.0, 1.0);
    float _344 = _278 * _336;
    float _346 = _284 * _336;
    float _348 = _318 * _332;
    float _350 = -_342;
    float _352 = _350 + 1.0;
    float _354 = fma(_272, _338, _344);
    float _356 = _306 * _336;
    float _358 = _320 * _332;
    float _360 = sqrt(_352);
    float _362 = fma(_276, _338, _346);
    float _364 = fma(_280, _338, _356);
    float _366 = _322 * _332;
    float _368 = in.m_48.x;
    float _370 = gl_FragCoord.w;
    float _372 = _368 * _370;
    float _374 = in.m_48.y;
    float _376 = gl_FragCoord.w;
    float _378 = _374 * _376;
    float _380 = in.m_48.z;
    float _382 = gl_FragCoord.w;
    float _384 = _380 * _382;
    float _386 = fma(_348, _360, _354);
    float _388 = fma(_358, _360, _362);
    float _390 = fma(_366, _360, _364);
    float _392 = _386 * _386;
    float _394 = fma(_388, _388, _392);
    float _396 = fma(_390, _390, _394);
    float _398 = rsqrt(_396);
    float _400 = (*spvDescriptorSet0.fp_c8)._m0[28].y * (*spvDescriptorSet0.fp_c8)._m0[28].y;
    float _402 = _102 * _384;
    float _404 = fma((*spvDescriptorSet0.fp_c8)._m0[28].x, (*spvDescriptorSet0.fp_c8)._m0[28].x, _400);
    float _406 = _102 * _372;
    float _408 = _102 * _292;
    float _410 = fma((*spvDescriptorSet0.fp_c8)._m0[28].z, (*spvDescriptorSet0.fp_c8)._m0[28].z, _404);
    float _412 = -_406;
    float _414 = _412 + _408;
    float _416 = rsqrt(_410);
    float _418 = _386 * _398;
    float _420 = _390 * _398;
    float _422 = _102 * _264;
    float _424 = _418 * (-0.816474258899688720703125);
    float _426 = -_402;
    float _428 = _426 + _422;
    float _430 = -_424;
    float _432 = fma(_420, 0.577381789684295654296875, _430);
    float _434 = _102 * _378;
    float _436 = _102 * _312;
    float _438 = fma(_432, 0.5, 0.5);
    float _440 = -_434;
    float _442 = _440 + _436;
    float _444 = _438 * _438;
    float _446 = fma(_444, _414, _406);
    float _448 = fma(_444, _442, _434);
    float _450 = fma(_444, _428, _402);
    if (!_190)
    {
        out.m_59.x = _446;
        out.m_59.y = _448;
        out.m_59.z = _450;
        out.m_59.w = _174;
        return out;
    }
    float _452 = in.m_61.x;
    float _454 = gl_FragCoord.w;
    float _456 = _452 * _454;
    float _458 = _416 * (*spvDescriptorSet0.fp_c8)._m0[28].y;
    float _460 = _388 * _398;
    float _462 = -_444;
    float _464 = _462 + 1.0;
    float _466 = _418 * _458;
    float _468 = _416 * (*spvDescriptorSet0.fp_c8)._m0[28].x;
    float _470 = _416 * (*spvDescriptorSet0.fp_c8)._m0[28].z;
    float _472 = -_464;
    float _474 = fma(_472, (*spvDescriptorSet0.fp_c9)._m0[191].y, 1.0);
    float _476 = -_118;
    float _478 = _476 + 1.0;
    float _480 = fma(_460, _468, _466);
    float _482 = abs(_358);
    float _484 = abs(_348);
    float _486 = precise::max(_482, _484);
    float _488 = fma(_420, _470, _480);
    float _490 = abs(_366);
    float _492 = precise::max(_490, _486);
    float _494 = fma(_488, -0.5, 0.5);
    float _496 = 1.0 / _492;
    float _498 = fma(_494, (*spvDescriptorSet0.fp_c9)._m0[191].z, _474);
    float _500 = precise::clamp(_498, 0.0, 1.0);
    float _502 = -_500;
    float _504 = _502 + 1.0;
    float _506 = fma(_478, (*spvDescriptorSet0.fp_c9)._m0[191].x, _504);
    float _508 = precise::clamp(_506, 0.0, 1.0);
    float _510 = _102 * _456;
    float _512 = _508 + _510;
    float _514 = _358 * _496;
    float _516 = _348 * _496;
    float _518 = -_496;
    float _520 = _366 * _518;
    float _522 = precise::min(_512, 1.0);
    float3 _1360 = float3(_514, _516, _520);
    float3 _526 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1360, float3(0.0), isnan(_1360)), level(_522)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1360, float3(0.0), isnan(_1360)), level(_522)).xyz;
    float _528 = _526.x;
    float _530 = _526.y;
    float _532 = _526.z;
    float _534 = in.m_63.y;
    float _536 = gl_FragCoord.w;
    float _538 = _534 * _536;
    float _540 = in.m_63.z;
    float _542 = gl_FragCoord.w;
    float _544 = _540 * _542;
    float _546 = in.m_63.x;
    float _548 = gl_FragCoord.w;
    float _550 = _546 * _548;
    float _552 = in.m_65.x;
    float _554 = gl_FragCoord.w;
    float _556 = _552 * _554;
    float _558 = in.m_65.z;
    float _560 = gl_FragCoord.w;
    float _562 = _558 * _560;
    float _564 = in.m_65.y;
    float _566 = gl_FragCoord.w;
    float _568 = _564 * _566;
    float _570 = in.m_67.x;
    float _572 = gl_FragCoord.w;
    float _574 = _570 * _572;
    float _576 = in.m_67.w;
    float _578 = gl_FragCoord.w;
    float _580 = _576 * _578;
    float _582 = in.m_67.y;
    float _584 = gl_FragCoord.w;
    float _586 = _582 * _584;
    float _588 = in.m_67.z;
    float _590 = gl_FragCoord.w;
    float _592 = _588 * _590;
    bool _594 = 0.5 <= (*spvDescriptorSet0.fp_c15)._m0[653].w;
    float _596 = _102 * _538;
    float _598 = _102 * _544;
    float _600 = _102 * _550;
    float _602 = fma(_530, 0.20999999344348907470703125, _596);
    float _604 = fma(_532, 0.20999999344348907470703125, _598);
    float _606 = fma(_528, 0.20999999344348907470703125, _600);
    float _608 = _102 * _556;
    float _610 = _102 * _562;
    float _612 = _102 * _568;
    float _614 = _606 + _608;
    float _616 = _604 + _610;
    float _618 = _602 + _612;
    float _620 = _102 * _580;
    float _622 = _446 * _614;
    float _624 = _450 * _616;
    float _626 = _448 * _618;
    float _628 = 0.0 + _180;
    float _630 = precise::clamp(_628, 0.0, 1.0);
    float _632 = _102 * _574;
    float _634 = _102 * _586;
    float _636 = _102 * _592;
    float _638 = fma(_622, _620, _632);
    float _640 = fma(_626, _620, _634);
    float _642 = fma(_624, _620, _636);
    float _644 = _632;
    if (!_594)
    {
        _644 = _630;
    }
    float _646 = _644;
    bool _648 = !_594;
    float _650 = _646;
    if (!_648)
    {
        float _652 = in.m_69.w;
        float _654 = gl_FragCoord.w;
        float _656 = _652 * _654;
        float _658 = in.m_69.z;
        float _660 = gl_FragCoord.w;
        float _662 = _658 * _660;
        float _664 = _102 * _656;
        float _666 = _102 * _662;
        float _668 = 1.0 / _664;
        float _670 = _666 * _668;
        float _672 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _674 = fma(_670, (*spvDescriptorSet0.fp_c8)._m0[30].w, _672);
        float _676 = 1.0 / _674;
        float _678 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _680 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _682 = fma(_676, _678, _680);
        float _684 = _682 * 8.0;
        float _686 = precise::clamp(_684, 0.0, 1.0);
        float _688 = _630 * _686;
        _650 = _688;
    }
    float _690 = _650;
    float _692 = 0.0 + _690;
    float _694 = precise::clamp(_692, 0.0, 1.0);
    out.m_59.x = _638;
    out.m_59.y = _640;
    out.m_59.z = _642;
    out.m_59.w = _694;
    return out;
}

