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
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_10 [[id(5)]];
    sampler fp_t_tcb_10Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_C [[id(7)]];
    sampler fp_t_tcb_CSmplr [[id(8)]];
    texture2d_array<float> fp_t_tcb_A [[id(9)]];
    sampler fp_t_tcb_ASmplr [[id(10)]];
    texturecube<float> fp_t_tcb_1E [[id(11)]];
    sampler fp_t_tcb_1ESmplr [[id(12)]];
    sampler fp_t_tcb_8Smplr_w [[id(13)]];
    sampler fp_t_tcb_10Smplr_w [[id(14)]];
    sampler fp_t_tcb_CSmplr_w [[id(15)]];
    sampler fp_t_tcb_ASmplr_w [[id(16)]];
    sampler fp_t_tcb_1ESmplr_w [[id(17)]];
    constant dm_border_t* dm_border [[id(18)]];
};

struct main0_out
{
    float4 m_66 [[color(0)]];
};

struct main0_in
{
    float4 m_59 [[user(locn0)]];
    float4 m_61 [[user(locn1)]];
    float4 m_63 [[user(locn2)]];
    float4 m_72 [[user(locn3)]];
    float4 m_57 [[user(locn4), flat]];
    float4 m_47 [[user(locn5)]];
    float4 m_51 [[user(locn6)]];
    float4 m_55 [[user(locn7), flat]];
    float4 m_53 [[user(locn8)]];
    float4 m_49 [[user(locn9), flat]];
    float4 m_68 [[user(locn10)]];
    float4 m_74 [[user(locn11)]];
    float4 m_70 [[user(locn12)]];
    float4 m_76 [[user(locn13)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _83 = gl_FragCoord.w;
    float _85 = in.m_47.x;
    float _87 = gl_FragCoord.w;
    float _89 = _85 * _87;
    float _91 = in.m_47.y;
    float _93 = gl_FragCoord.w;
    float _95 = _91 * _93;
    float _97 = 1.0 / _83;
    float _99 = _97 * _89;
    float _101 = _97 * _95;
    float2 _689 = float2(_99, _101);
    float2 _105 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_689, float2(0.0), isnan(_689))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_689, float2(0.0), isnan(_689))).xy;
    float _107 = _105.x;
    float _109 = _105.y;
    float _111 = in.m_49.y;
    float _113 = in.m_51.w;
    float _115 = gl_FragCoord.w;
    float _117 = _113 * _115;
    float _119 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[31].x;
    float _121 = in.m_51.x;
    float _123 = gl_FragCoord.w;
    float _125 = _121 * _123;
    float _127 = in.m_51.y;
    float _129 = gl_FragCoord.w;
    float _131 = _127 * _129;
    float _133 = in.m_53.y;
    float _135 = gl_FragCoord.w;
    float _137 = _133 * _135;
    float _139 = in.m_53.x;
    float _141 = gl_FragCoord.w;
    float _143 = _139 * _141;
    float _145 = in.m_47.z;
    float _147 = gl_FragCoord.w;
    float _149 = _145 * _147;
    float _151 = in.m_55.x;
    float _153 = in.m_47.w;
    float _155 = gl_FragCoord.w;
    float _157 = _153 * _155;
    float _159 = _111 + 1.0;
    float _161 = _97 * _117;
    float _163 = rint(_111);
    float _165 = precise::max(_163, 0.0);
    uint _168 = uint(_165);
    uint _170 = clamp(_168, 0u, 65535u);
    float _172 = _97 * _125;
    float _174 = _159 * _119;
    float _176 = _97 * _143;
    float _178 = _97 * _149;
    float _180 = floor(_174);
    float _182 = 1.0 / _161;
    float _184 = -_180;
    float _186 = fma(_184, (*spvDescriptorSet0.fp_c9)._m0[31].x, _159);
    float _188 = _97 * _131;
    float _190 = _97 * _137;
    float _192 = _172 * _182;
    float _194 = _188 * _182;
    float _196 = rint(_186);
    float _198 = precise::max(_196, 0.0);
    uint _200 = uint(_198);
    uint _202 = clamp(_200, 0u, 65535u);
    float2 _822 = float2(_192, _194);
    float _204 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_822, float2(0.0), isnan(_822))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_822, float2(0.0), isnan(_822))).x;
    float _206 = fma(_107, _151, _176);
    float _208 = fma(_107, _151, _178);
    float _210 = _97 * _157;
    float _212 = fma(_109, _151, _190);
    float _214 = fma(_109, _151, _210);
    float2 _849 = float2(_206, _212);
    float _216 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_849, float2(0.0), isnan(_849))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_849, float2(0.0), isnan(_849))).w;
    float3 _860 = float3(_208, _214, float(int(_170)));
    float3 _864 = select(_860, float3(0.0), isnan(_860));
    float2 _218 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _864.xy, uint(rint(_864.z))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _864.xy, uint(rint(_864.z))).xw;
    float _220 = _218.x;
    float _222 = _218.y;
    float3 _877 = float3(_208, _214, float(int(_202)));
    float3 _879 = select(_877, float3(0.0), isnan(_877));
    float2 _224 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _879.xy, uint(rint(_879.z))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _879.xy, uint(rint(_879.z))).xw;
    float _226 = _224.x;
    float _228 = _224.y;
    float _230 = in.m_57.y;
    float _232 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[31].y;
    float _234 = in.m_51.z;
    float _236 = gl_FragCoord.w;
    float _238 = _234 * _236;
    float _240 = in.m_59.w;
    float _242 = gl_FragCoord.w;
    float _244 = _240 * _242;
    float _246 = in.m_61.w;
    float _248 = gl_FragCoord.w;
    float _250 = _246 * _248;
    float _252 = _230 * _232;
    float _254 = _97 * _238;
    float _256 = _252 * _232;
    float _258 = _97 * _244;
    float _260 = _254 * _182;
    float _262 = floor(_256);
    float _264 = -_258;
    float _266 = _264 + 1.0;
    float _268 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _270 = fma(_260, (*spvDescriptorSet0.fp_c8)._m0[30].w, _268);
    float _272 = -_258;
    float _274 = _272 + 1.14999997615814208984375;
    float _276 = -_262;
    float _278 = fma(_276, (*spvDescriptorSet0.fp_c9)._m0[31].y, _252);
    float _280 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _282 = fma(_204, (*spvDescriptorSet0.fp_c8)._m0[30].w, _280);
    float _284 = 1.0 / _270;
    float _286 = _278 + 9.9999997473787516355514526367188e-05;
    float _288 = in.m_63.x;
    float _290 = gl_FragCoord.w;
    float _292 = _288 * _290;
    float _294 = floor(_286);
    float _296 = 1.0 / _282;
    float _298 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _300 = _284 * _298;
    float _302 = -_294;
    float _304 = _286 + _302;
    float _306 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _308 = -_300;
    float _310 = fma(_296, _306, _308);
    float _312 = in.m_59.z;
    float _314 = gl_FragCoord.w;
    float _316 = _312 * _314;
    float _318 = in.m_59.y;
    float _320 = gl_FragCoord.w;
    float _322 = _318 * _320;
    float _324 = precise::max(_266, _216);
    float _326 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _328 = precise::min(_274, _324);
    float _330 = -_222;
    float _332 = _330 + _228;
    float _334 = _97 * _292;
    float _336 = -_266;
    float _338 = _336 + _328;
    float _340 = fma(_304, _332, _222);
    float _342 = _97 * _250;
    float _344 = _338 * 6.666667938232421875;
    float _346 = _340 * _344;
    float _348 = _310 * _326;
    float _350 = precise::clamp(_348, 0.0, 1.0);
    float _352 = _342 * _346;
    float _354 = 0.0 + _352;
    float _356 = precise::clamp(_354, 0.0, 1.0);
    float _358 = _356 * _350;
    float _360 = _358 * _334;
    bool _364 = _360 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _366 = isnan(_360);
    bool _368 = _364 || _366;
    bool _370 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _372 = _368 || _370;
    float _374 = in.m_61.x;
    float _376 = gl_FragCoord.w;
    float _378 = _374 * _376;
    float _380 = in.m_59.x;
    float _382 = gl_FragCoord.w;
    float _384 = _380 * _382;
    float _386 = in.m_61.y;
    float _388 = gl_FragCoord.w;
    float _390 = _386 * _388;
    float _392 = in.m_61.z;
    float _394 = gl_FragCoord.w;
    float _396 = _392 * _394;
    float _398 = _300;
    if (!_372)
    {
        discard_fragment();
    }
    float _400 = -_220;
    float _402 = _400 + _226;
    float _404 = _97 * _322;
    float _406 = fma(_304, _402, _220);
    float _408 = fma(_406, 1.4285714626312255859375, -0.2857142984867095947265625);
    float _410 = precise::clamp(_408, 0.0, 1.0);
    float _412 = fma(_410, -2.0, 3.0);
    float _414 = _97 * _378;
    float _416 = _97 * _384;
    float _418 = _97 * _390;
    float _420 = _410 * _410;
    float _422 = _97 * _396;
    float _424 = _97 * _316;
    float _426 = -_414;
    float _428 = _426 + _416;
    float _430 = _412 * _420;
    float _432 = -_418;
    float _434 = _432 + _404;
    float _436 = -_422;
    float _438 = _436 + _424;
    float _440 = fma(_430, _428, _414);
    float _442 = fma(_430, _434, _418);
    float _444 = fma(_430, _438, _422);
    if (!_372)
    {
        out.m_66.x = _440;
        out.m_66.y = _442;
        out.m_66.z = _444;
        out.m_66.w = _352;
        return out;
    }
    float _446 = in.m_68.y;
    float _448 = gl_FragCoord.w;
    float _450 = _446 * _448;
    float _452 = in.m_68.x;
    float _454 = gl_FragCoord.w;
    float _456 = _452 * _454;
    float _458 = in.m_68.z;
    float _460 = gl_FragCoord.w;
    float _462 = _458 * _460;
    float _464 = _97 * _450;
    float _466 = _97 * _456;
    float _468 = _97 * _462;
    float _470 = _464 * _464;
    float _472 = in.m_70.x;
    float _474 = gl_FragCoord.w;
    float _476 = _472 * _474;
    float _478 = fma(_466, _466, _470);
    float _480 = fma(_468, _468, _478);
    float _482 = rsqrt(_480);
    float _484 = _466 * _482;
    float _486 = _464 * _482;
    float _488 = _468 * _482;
    float _490 = _97 * _476;
    float _492 = abs(_484);
    float _494 = abs(_486);
    float _496 = precise::max(_492, _494);
    float _498 = precise::min(_490, 1.0);
    float _500 = abs(_488);
    float _502 = precise::max(_500, _496);
    float _504 = 1.0 / _502;
    float _506 = -_504;
    float _508 = _488 * _506;
    float _510 = _484 * _504;
    float _512 = _486 * _504;
    float3 _1291 = float3(_510, _512, _508);
    float3 _516 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1291, float3(0.0), isnan(_1291)), level(_498)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1291, float3(0.0), isnan(_1291)), level(_498)).xyz;
    float _518 = _516.x;
    float _520 = _516.y;
    float _522 = _516.z;
    float _524 = in.m_72.x;
    float _526 = gl_FragCoord.w;
    float _528 = _524 * _526;
    float _530 = in.m_72.z;
    float _532 = gl_FragCoord.w;
    float _534 = _530 * _532;
    float _536 = in.m_72.y;
    float _538 = gl_FragCoord.w;
    float _540 = _536 * _538;
    float _542 = in.m_74.z;
    float _544 = gl_FragCoord.w;
    float _546 = _542 * _544;
    float _548 = in.m_74.x;
    float _550 = gl_FragCoord.w;
    float _552 = _548 * _550;
    float _554 = in.m_74.y;
    float _556 = gl_FragCoord.w;
    float _558 = _554 * _556;
    float _560 = in.m_76.x;
    float _562 = gl_FragCoord.w;
    float _564 = _560 * _562;
    float _566 = in.m_76.y;
    float _568 = gl_FragCoord.w;
    float _570 = _566 * _568;
    float _572 = in.m_76.z;
    float _574 = gl_FragCoord.w;
    float _576 = _572 * _574;
    float _578 = in.m_76.w;
    float _580 = gl_FragCoord.w;
    float _582 = _578 * _580;
    bool _584 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    if (_584)
    {
        float _586 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _588 = _300 + _586;
        _398 = _588;
    }
    float _590 = _398;
    float _592 = _590;
    if (_584)
    {
        float _594 = _590 * 8.0;
        float _596 = precise::clamp(_594, 0.0, 1.0);
        _592 = _596;
    }
    float _598 = _592;
    float _600 = _97 * _528;
    float _602 = _97 * _534;
    float _604 = _97 * _546;
    float _606 = _97 * _552;
    float _608 = _97 * _558;
    float _610 = _97 * _570;
    float _612 = fma(_518, 0.20999999344348907470703125, _600);
    float _614 = _97 * _540;
    float _616 = fma(_522, 0.20999999344348907470703125, _602);
    float _618 = _97 * _564;
    float _620 = _612 + _606;
    float _622 = fma(_520, 0.20999999344348907470703125, _614);
    float _624 = _616 + _604;
    float _626 = 0.0 + _360;
    float _628 = precise::clamp(_626, 0.0, 1.0);
    float _630 = _97 * _576;
    float _632 = _622 + _608;
    float _634 = _97 * _582;
    float _636 = _440 * _620;
    float _638 = _444 * _624;
    float _640 = _442 * _632;
    float _642 = _628;
    if (_584)
    {
        float _644 = _628 * _598;
        _642 = _644;
    }
    float _646 = _642;
    float _648 = fma(_636, _634, _618);
    float _650 = fma(_638, _634, _630);
    float _652 = fma(_640, _634, _610);
    float _654 = 0.0 + _646;
    float _656 = precise::clamp(_654, 0.0, 1.0);
    out.m_66.x = _648;
    out.m_66.y = _652;
    out.m_66.z = _650;
    out.m_66.w = _656;
    return out;
}

