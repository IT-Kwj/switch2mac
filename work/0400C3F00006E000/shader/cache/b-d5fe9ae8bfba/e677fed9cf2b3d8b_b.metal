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

template<typename T>
[[clang::optnone]] T spvFAdd(T l, T r)
{
    return fma(T(1), l, r);
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
    texture2d_array<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_10 [[id(7)]];
    sampler fp_t_tcb_10Smplr [[id(8)]];
    texture2d<float> fp_t_tcb_34 [[id(9)]];
    sampler fp_t_tcb_34Smplr [[id(10)]];
    texture2d<float> fp_t_tcb_C [[id(11)]];
    sampler fp_t_tcb_CSmplr [[id(12)]];
    texturecube<float> fp_t_tcb_1E [[id(13)]];
    sampler fp_t_tcb_1ESmplr [[id(14)]];
    sampler fp_t_tcb_ASmplr_w [[id(15)]];
    sampler fp_t_tcb_8Smplr_w [[id(16)]];
    sampler fp_t_tcb_10Smplr_w [[id(17)]];
    sampler fp_t_tcb_34Smplr_w [[id(18)]];
    sampler fp_t_tcb_CSmplr_w [[id(19)]];
    sampler fp_t_tcb_1ESmplr_w [[id(20)]];
    constant dm_border_t* dm_border [[id(21)]];
};

struct main0_out
{
    float4 m_68 [[color(0)]];
};

struct main0_in
{
    float4 m_59 [[user(locn0)]];
    float4 m_63 [[user(locn1), flat]];
    float4 m_70 [[user(locn2)]];
    float4 m_74 [[user(locn3)]];
    float4 m_51 [[user(locn4), flat]];
    float4 m_76 [[user(locn5)]];
    float4 m_72 [[user(locn6)]];
    float4 m_57 [[user(locn7)]];
    float4 m_49 [[user(locn8)]];
    float4 m_55 [[user(locn9), flat]];
    float4 m_65 [[user(locn10), flat]];
    float4 m_53 [[user(locn11)]];
    float4 m_61 [[user(locn12)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _83 = gl_FragCoord.w;
    float _85 = in.m_49.z;
    float _87 = gl_FragCoord.w;
    float _89 = _85 * _87;
    float _91 = in.m_49.w;
    float _93 = gl_FragCoord.w;
    float _95 = _91 * _93;
    float _97 = 1.0 / _83;
    float _99 = _97 * _89;
    float _101 = _97 * _95;
    float2 _682 = float2(_99, _101);
    float2 _105 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_682, float2(0.0), isnan(_682))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_682, float2(0.0), isnan(_682))).xy;
    float _107 = _105.x;
    float _109 = _105.y;
    float _111 = in.m_51.y;
    float _113 = in.m_51.x;
    float _115 = in.m_51.z;
    float _117 = in.m_53.w;
    float _119 = gl_FragCoord.w;
    float _121 = _117 * _119;
    float _123 = in.m_55.x;
    float _125 = in.m_49.x;
    float _127 = gl_FragCoord.w;
    float _129 = _125 * _127;
    float _131 = in.m_49.y;
    float _133 = gl_FragCoord.w;
    float _135 = _131 * _133;
    float _137 = in.m_53.x;
    float _139 = gl_FragCoord.w;
    float _141 = _137 * _139;
    float _143 = in.m_53.y;
    float _145 = gl_FragCoord.w;
    float _147 = _143 * _145;
    float _149 = in.m_57.x;
    float _151 = gl_FragCoord.w;
    float _153 = _149 * _151;
    float _155 = in.m_57.y;
    float _157 = gl_FragCoord.w;
    float _159 = _155 * _157;
    float _161 = -_111;
    float _163 = _161 + (*spvDescriptorSet0.fp_c8)._m0[29].y;
    float _165 = -_113;
    float _167 = _165 + (*spvDescriptorSet0.fp_c8)._m0[29].x;
    float _169 = -_115;
    float _171 = _169 + (*spvDescriptorSet0.fp_c8)._m0[29].z;
    float _173 = _97 * _121;
    float _175 = _163 * _163;
    float _177 = fma(_167, _167, _175);
    float _179 = 1.0 / _173;
    float _181 = fma(_171, _171, _177);
    float _183 = sqrt(_181);
    float _185 = -(*spvDescriptorSet0.fp_c9)._m0[191].z;
    float _187 = (*spvDescriptorSet0.fp_c9)._m0[191].w + _185;
    float _189 = 1.0 / _187;
    float _191 = precise::max(_183, (*spvDescriptorSet0.fp_c9)._m0[191].z);
    float _193 = precise::min(_191, (*spvDescriptorSet0.fp_c9)._m0[191].w);
    float _195 = -(*spvDescriptorSet0.fp_c9)._m0[191].z;
    float _197 = _193 + _195;
    float _199 = _197 * _189;
    float _201 = _97 * _129;
    float _203 = rint(_123);
    float _205 = precise::max(_203, 0.0);
    uint _208 = uint(_205);
    uint _210 = clamp(_208, 0u, 65535u);
    float _212 = _97 * _135;
    float _214 = fma(_199, -0.5, 1.0);
    float _216 = _199 * 0.25;
    float _218 = fma(_201, _214, _216);
    float _220 = fma(_212, _214, _216);
    float _222 = _199 * 0.1500000059604644775390625;
    float _224 = _97 * _141;
    float _226 = _109 * _109;
    float _228 = _107 * _107;
    float _230 = _97 * _153;
    float _232 = _224 * _179;
    float _234 = fma(_226, _222, _220);
    float _236 = fma(_228, _222, _218);
    float _238 = _97 * _147;
    float _240 = _97 * _159;
    float3 _887 = float3(_236, _234, float(int(_210)));
    float3 _891 = select(_887, float3(0.0), isnan(_887));
    float _242 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _891.xy, uint(rint(_891.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _891.xy, uint(rint(_891.z))).w;
    float _244 = _238 * _179;
    float2 _900 = float2(_232, _244);
    float _246 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_900, float2(0.0), isnan(_900))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_900, float2(0.0), isnan(_900))).x;
    float2 _908 = float2(_230, _240);
    float _248 = dm_bs(spvDescriptorSet0.fp_t_tcb_34.sample(spvDescriptorSet0.fp_t_tcb_34Smplr, select(_908, float2(0.0), isnan(_908))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_34, spvDescriptorSet0.fp_t_tcb_34Smplr_w, select(_908, float2(0.0), isnan(_908))).w;
    float _250 = in.m_53.z;
    float _252 = gl_FragCoord.w;
    float _254 = _250 * _252;
    float _256 = in.m_59.w;
    float _258 = gl_FragCoord.w;
    float _260 = _256 * _258;
    float _262 = in.m_61.x;
    float _264 = gl_FragCoord.w;
    float _266 = _262 * _264;
    float _268 = _97 * _254;
    float _270 = _199 * 0.75;
    float _272 = _268 * _179;
    float _274 = -_270;
    float _276 = spvFAdd(_274, 1.0);
    float _278 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _280 = fma(_272, (*spvDescriptorSet0.fp_c8)._m0[30].w, _278);
    float _282 = 1.0 / _276;
    float _284 = 1.0 / _280;
    float _286 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _288 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _290 = _284 * _288;
    float _292 = _97 * _266;
    float _294 = precise::max(_270, _242);
    float _296 = precise::min(_294, 1.0);
    float _298 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _300 = fma(_246, (*spvDescriptorSet0.fp_c8)._m0[30].w, _298);
    float _302 = -_270;
    float _304 = _302 + _296;
    float _306 = 1.0 / _300;
    float _308 = -_304;
    float _310 = fma(_308, _282, 1.0);
    float _312 = -_310;
    float _314 = fma(_312, _310, 1.0);
    float _316 = -_248;
    float _318 = _316 + _314;
    float _320 = fma(_199, _318, _248);
    float _322 = _97 * _260;
    float _324 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _326 = -_290;
    float _328 = fma(_306, _324, _326);
    float _330 = _322 * _320;
    float _332 = _328 * _286;
    float _334 = precise::clamp(_332, 0.0, 1.0);
    float _336 = 0.0 + _330;
    float _338 = precise::clamp(_336, 0.0, 1.0);
    float _340 = _338 * _334;
    float _342 = _340 * _292;
    bool _346 = _342 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _348 = isnan(_342);
    bool _350 = _346 || _348;
    bool _352 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _354 = _350 || _352;
    float _356 = in.m_63.x;
    float _358 = in.m_65.y;
    float _360 = _290;
    if (!_354)
    {
        discard_fragment();
    }
    float _362 = fma(_358, 0.001000000047497451305389404296875, _356);
    float2 _1073 = float2(0.0, _362);
    float3 _366 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1073, float2(0.0), isnan(_1073))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1073, float2(0.0), isnan(_1073))).xyz;
    float _368 = _366.x;
    float _370 = _366.y;
    float _372 = _366.z;
    float _374 = in.m_59.x;
    float _376 = gl_FragCoord.w;
    float _378 = _374 * _376;
    float _380 = in.m_59.y;
    float _382 = gl_FragCoord.w;
    float _384 = _380 * _382;
    float _386 = in.m_59.z;
    float _388 = gl_FragCoord.w;
    float _390 = _386 * _388;
    float _392 = precise::max(_183, (*spvDescriptorSet0.fp_c9)._m0[191].x);
    float _394 = -(*spvDescriptorSet0.fp_c9)._m0[191].x;
    float _396 = (*spvDescriptorSet0.fp_c9)._m0[191].y + _394;
    float _398 = precise::min(_392, (*spvDescriptorSet0.fp_c9)._m0[191].y);
    float _400 = 1.0 / _396;
    float _402 = -(*spvDescriptorSet0.fp_c9)._m0[191].x;
    float _404 = _398 + _402;
    float _406 = _404 * _400;
    float _408 = _97 * _378;
    float _410 = _97 * _384;
    float _412 = _97 * _390;
    float _414 = -_368;
    float _416 = _414 + _408;
    float _418 = -_370;
    float _420 = _418 + _410;
    float _422 = -_372;
    float _424 = _422 + _412;
    float _426 = fma(_406, _416, _368);
    float _428 = fma(_406, _420, _370);
    float _430 = fma(_406, _424, _372);
    if (!_354)
    {
        out.m_68.x = _426;
        out.m_68.y = _428;
        out.m_68.z = _430;
        out.m_68.w = _330;
        return out;
    }
    float _432 = in.m_70.y;
    float _434 = gl_FragCoord.w;
    float _436 = _432 * _434;
    float _438 = in.m_70.x;
    float _440 = gl_FragCoord.w;
    float _442 = _438 * _440;
    float _444 = in.m_70.z;
    float _446 = gl_FragCoord.w;
    float _448 = _444 * _446;
    float _450 = _97 * _436;
    float _452 = _97 * _442;
    float _454 = _97 * _448;
    float _456 = _450 * _450;
    float _458 = fma(_452, _452, _456);
    float _460 = fma(_454, _454, _458);
    float _462 = rsqrt(_460);
    float _464 = _452 * _462;
    float _466 = _450 * _462;
    float _468 = _454 * _462;
    float _470 = abs(_464);
    float _472 = abs(_466);
    float _474 = precise::max(_470, _472);
    float _476 = abs(_468);
    float _478 = precise::max(_476, _474);
    float _480 = 1.0 / _478;
    float _482 = -_480;
    float _484 = _468 * _482;
    float _486 = _464 * _480;
    float _488 = _466 * _480;
    float3 _1261 = float3(_486, _488, _484);
    float3 _490 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1261, float3(0.0), isnan(_1261)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1261, float3(0.0), isnan(_1261)), level(0.0)).xyz;
    float _492 = _490.x;
    float _494 = _490.y;
    float _496 = _490.z;
    float _498 = _370 * 0.715200006961822509765625;
    float _500 = in.m_72.x;
    float _502 = gl_FragCoord.w;
    float _504 = _500 * _502;
    float _506 = in.m_72.z;
    float _508 = gl_FragCoord.w;
    float _510 = _506 * _508;
    float _512 = in.m_72.y;
    float _514 = gl_FragCoord.w;
    float _516 = _512 * _514;
    float _518 = fma(_368, 0.2125999927520751953125, _498);
    float _520 = in.m_74.z;
    float _522 = gl_FragCoord.w;
    float _524 = _520 * _522;
    float _526 = in.m_74.x;
    float _528 = gl_FragCoord.w;
    float _530 = _526 * _528;
    float _532 = in.m_74.y;
    float _534 = gl_FragCoord.w;
    float _536 = _532 * _534;
    float _538 = fma(_372, 0.072200000286102294921875, _518);
    float _540 = in.m_76.x;
    float _542 = gl_FragCoord.w;
    float _544 = _540 * _542;
    float _546 = in.m_76.y;
    float _548 = gl_FragCoord.w;
    float _550 = _546 * _548;
    float _552 = in.m_76.w;
    float _554 = gl_FragCoord.w;
    float _556 = _552 * _554;
    float _558 = 1.0 / _538;
    float _560 = in.m_76.z;
    float _562 = gl_FragCoord.w;
    float _564 = _560 * _562;
    bool _566 = 0.5 <= (*spvDescriptorSet0.fp_c15)._m0[653].w;
    float _568 = _558 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _570 = precise::clamp(_568, 0.0, 1.0);
    if (_566)
    {
        float _572 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _574 = _290 + _572;
        _360 = _574;
    }
    float _576 = _360;
    float _578 = fma(_570, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _580 = _97 * _504;
    float _582 = _576;
    if (_566)
    {
        float _584 = _576 * 8.0;
        float _586 = precise::clamp(_584, 0.0, 1.0);
        _582 = _586;
    }
    float _588 = _582;
    float _590 = _368 * _578;
    float _592 = _370 * _578;
    float _594 = _372 * _578;
    float _596 = _97 * _510;
    float _598 = _97 * _524;
    float _600 = _97 * _530;
    float _602 = _97 * _544;
    float _604 = _97 * _550;
    float _606 = fma(_492, 0.20999999344348907470703125, _580);
    float _608 = _97 * _516;
    float _610 = fma(_496, 0.20999999344348907470703125, _596);
    float _612 = _97 * _536;
    float _614 = _606 + _600;
    float _616 = fma(_494, 0.20999999344348907470703125, _608);
    float _618 = _610 + _598;
    float _620 = 0.0 + _342;
    float _622 = precise::clamp(_620, 0.0, 1.0);
    float _624 = _97 * _564;
    float _626 = _616 + _612;
    float _628 = _97 * _556;
    float _630 = fma(_426, _614, _590);
    float _632 = fma(_430, _618, _594);
    float _634 = fma(_428, _626, _592);
    float _636 = _622;
    if (_566)
    {
        float _638 = _622 * _588;
        _636 = _638;
    }
    float _640 = _636;
    float _642 = fma(_630, _628, _602);
    float _644 = fma(_632, _628, _624);
    float _646 = fma(_634, _628, _604);
    float _648 = 0.0 + _640;
    float _650 = precise::clamp(_648, 0.0, 1.0);
    out.m_68.x = _642;
    out.m_68.y = _646;
    out.m_68.z = _644;
    out.m_68.w = _650;
    return out;
}

