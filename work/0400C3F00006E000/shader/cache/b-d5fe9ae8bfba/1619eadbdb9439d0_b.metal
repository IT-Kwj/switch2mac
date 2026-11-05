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
    constant _16* fp_c3 [[id(0)]];
    texturecube_array<float> fp_t_tcb_8 [[id(1)]];
    sampler fp_t_tcb_8Smplr [[id(2)]];
    sampler fp_t_tcb_8Smplr_w [[id(3)]];
    constant dm_border_t* dm_border [[id(4)]];
};

struct main0_out
{
    float4 m_36 [[color(0)]];
};

struct main0_in
{
    float4 m_29 [[user(locn0)]];
    float4 m_31 [[user(locn1)]];
    float4 m_33 [[user(locn2)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _43 = gl_FragCoord.w;
    float _45 = in.m_29.y;
    float _47 = gl_FragCoord.w;
    float _49 = _45 * _47;
    float _51 = in.m_29.x;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = in.m_31.x;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = in.m_31.y;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = in.m_33.x;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_33.y;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_29.z;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = in.m_31.z;
    float _89 = gl_FragCoord.w;
    float _91 = _87 * _89;
    float _93 = in.m_33.z;
    float _95 = gl_FragCoord.w;
    float _97 = _93 * _95;
    float _99 = in.m_29.w;
    float _101 = gl_FragCoord.w;
    float _103 = _99 * _101;
    float _105 = 1.0 / _43;
    float _107 = _105 * _49;
    float _109 = _105 * _55;
    float _111 = _105 * _61;
    float _113 = _105 * _67;
    float _115 = _105 * _73;
    float _117 = _105 * _79;
    float _119 = _105 * _85;
    float _121 = _105 * _91;
    float _123 = fma(_111, 2.0, _109);
    float _125 = fma(_113, 2.0, _107);
    float _127 = _109 + _111;
    float _129 = _107 + _113;
    float _131 = _105 * _97;
    float _133 = _109 + _115;
    float _135 = _107 + _117;
    float _137 = fma(_111, 3.0, _109);
    float _139 = fma(_113, 3.0, _107);
    float _141 = fma(_121, 2.0, _119);
    float _143 = _123 + _115;
    float _145 = _125 + _117;
    float _147 = _119 + _121;
    float _149 = _127 + _115;
    float _151 = _129 + _117;
    float _153 = _119 + _131;
    float _155 = abs(_133);
    float _157 = abs(_135);
    float _159 = precise::max(_155, _157);
    float _161 = fma(_121, 3.0, _119);
    float _163 = _141 + _131;
    float _165 = _137 + _115;
    float _167 = _139 + _117;
    float _169 = abs(_143);
    float _171 = abs(_145);
    float _173 = precise::max(_169, _171);
    float _175 = _147 + _131;
    float _177 = abs(_149);
    float _179 = abs(_151);
    float _181 = precise::max(_177, _179);
    float _183 = _161 + _131;
    float _185 = abs(_153);
    float _187 = precise::max(_185, _159);
    float _189 = _105 * _103;
    float _191 = abs(_163);
    float _193 = precise::max(_191, _173);
    float _195 = abs(_165);
    float _197 = abs(_167);
    float _199 = precise::max(_195, _197);
    float _201 = abs(_175);
    float _203 = precise::max(_201, _181);
    float _205 = 1.0 / _187;
    float _207 = abs(_183);
    float _209 = precise::max(_207, _199);
    float _211 = 1.0 / _193;
    float _213 = rint(_189);
    float _215 = precise::max(_213, 0.0);
    uint _218 = uint(_215);
    uint _220 = clamp(_218, 0u, 65535u);
    float _222 = _135 * _205;
    float _224 = _153 * _205;
    float _226 = _133 * _205;
    float _228 = 1.0 / _203;
    float _230 = _143 * _211;
    float _232 = _145 * _211;
    float _234 = _163 * _211;
    float _236 = 1.0 / _209;
    float _238 = _149 * _228;
    float _240 = _151 * _228;
    float _242 = _175 * _228;
    float4 _2439 = float4(_226, _222, _224, float(int(_220)));
    float4 _2443 = select(_2439, float4(0.0), isnan(_2439));
    float2 _246 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _2443.xyz, uint(rint(_2443.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _2443.xyz, uint(rint(_2443.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xy;
    float _248 = _246.x;
    float _250 = _246.y;
    float _252 = _165 * _236;
    float _254 = _167 * _236;
    float _256 = _183 * _236;
    float4 _2469 = float4(_238, _240, _242, float(int(_220)));
    float4 _2471 = select(_2469, float4(0.0), isnan(_2469));
    float2 _258 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _2471.xyz, uint(rint(_2471.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _2471.xyz, uint(rint(_2471.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xy;
    float _260 = _258.x;
    float _262 = _258.y;
    float4 _2487 = float4(_230, _232, _234, float(int(_220)));
    float4 _2489 = select(_2487, float4(0.0), isnan(_2487));
    float2 _264 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _2489.xyz, uint(rint(_2489.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _2489.xyz, uint(rint(_2489.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xy;
    float _266 = _264.x;
    float _268 = _264.y;
    float4 _2505 = float4(_252, _254, _256, float(int(_220)));
    float4 _2507 = select(_2505, float4(0.0), isnan(_2505));
    float2 _270 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _2507.xyz, uint(rint(_2507.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _2507.xyz, uint(rint(_2507.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xy;
    float _272 = _270.x;
    float _274 = _270.y;
    float _276 = fma(_115, 2.0, _109);
    float _278 = fma(_117, 2.0, _107);
    float _280 = fma(_131, 2.0, _119);
    float _282 = fma(_115, 2.0, _127);
    float _284 = fma(_117, 2.0, _129);
    float _286 = abs(_109);
    float _288 = abs(_107);
    float _290 = precise::max(_286, _288);
    float _292 = abs(_276);
    float _294 = abs(_278);
    float _296 = precise::max(_292, _294);
    float _298 = abs(_119);
    float _300 = precise::max(_298, _290);
    float _302 = abs(_280);
    float _304 = precise::max(_302, _296);
    float _306 = fma(_131, 2.0, _147);
    float _308 = abs(_282);
    float _310 = abs(_284);
    float _312 = precise::max(_308, _310);
    float _314 = 1.0 / _304;
    float _316 = abs(_306);
    float _318 = precise::max(_316, _312);
    float _320 = abs(_123);
    float _322 = abs(_125);
    float _324 = precise::max(_320, _322);
    float _326 = 1.0 / _300;
    float _328 = abs(_141);
    float _330 = precise::max(_328, _324);
    float _332 = abs(_137);
    float _334 = abs(_139);
    float _336 = precise::max(_332, _334);
    float _338 = 1.0 / _330;
    float _340 = abs(_161);
    float _342 = precise::max(_340, _336);
    float _344 = _278 * _314;
    float _346 = abs(_127);
    float _348 = abs(_129);
    float _350 = precise::max(_346, _348);
    float _352 = _276 * _314;
    float _354 = _280 * _314;
    float _356 = abs(_147);
    float _358 = precise::max(_356, _350);
    float _360 = 1.0 / _342;
    float _362 = _109 * _326;
    float _364 = _107 * _326;
    float _366 = _119 * _326;
    float _368 = _123 * _338;
    float _370 = 1.0 / _358;
    float _372 = _125 * _338;
    float _374 = _141 * _338;
    float _376 = 1.0 / _318;
    float _378 = _137 * _360;
    float _380 = _139 * _360;
    float _382 = _161 * _360;
    float4 _2661 = float4(_368, _372, _374, float(int(_220)));
    float4 _2663 = select(_2661, float4(0.0), isnan(_2661));
    float2 _384 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _2663.xyz, uint(rint(_2663.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _2663.xyz, uint(rint(_2663.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xy;
    float _386 = _384.x;
    float _388 = _384.y;
    float _390 = _127 * _370;
    float _392 = _129 * _370;
    float _394 = _147 * _370;
    float4 _2688 = float4(_378, _380, _382, float(int(_220)));
    float4 _2690 = select(_2688, float4(0.0), isnan(_2688));
    float2 _396 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _2690.xyz, uint(rint(_2690.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _2690.xyz, uint(rint(_2690.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xy;
    float _398 = _396.x;
    float _400 = _396.y;
    float4 _2706 = float4(_362, _364, _366, float(int(_220)));
    float4 _2708 = select(_2706, float4(0.0), isnan(_2706));
    float2 _402 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _2708.xyz, uint(rint(_2708.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _2708.xyz, uint(rint(_2708.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xy;
    float _404 = _402.x;
    float _406 = _402.y;
    float _408 = _282 * _376;
    float _410 = _284 * _376;
    float _412 = _306 * _376;
    float4 _2733 = float4(_390, _392, _394, float(int(_220)));
    float4 _2735 = select(_2733, float4(0.0), isnan(_2733));
    float2 _414 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _2735.xyz, uint(rint(_2735.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _2735.xyz, uint(rint(_2735.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xy;
    float _416 = _414.x;
    float _418 = _414.y;
    float4 _2751 = float4(_352, _344, _354, float(int(_220)));
    float4 _2753 = select(_2751, float4(0.0), isnan(_2751));
    float2 _420 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _2753.xyz, uint(rint(_2753.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _2753.xyz, uint(rint(_2753.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xy;
    float _422 = _420.x;
    float _424 = _420.y;
    float4 _2769 = float4(_408, _410, _412, float(int(_220)));
    float4 _2771 = select(_2769, float4(0.0), isnan(_2769));
    float2 _426 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _2771.xyz, uint(rint(_2771.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _2771.xyz, uint(rint(_2771.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xy;
    float _428 = _426.x;
    float _430 = _426.y;
    float _432 = fma(_115, 2.0, _123);
    float _434 = fma(_117, 2.0, _125);
    float _436 = fma(_115, 3.0, _109);
    float _438 = fma(_131, 2.0, _141);
    float _440 = fma(_115, 2.0, _137);
    float _442 = fma(_117, 2.0, _139);
    float _444 = fma(_131, 2.0, _161);
    float _446 = fma(_115, 3.0, _123);
    float _448 = fma(_117, 3.0, _125);
    float _450 = fma(_115, 3.0, _137);
    float _452 = fma(_117, 3.0, _139);
    float _454 = fma(_131, 3.0, _141);
    float _456 = abs(_432);
    float _458 = abs(_434);
    float _460 = precise::max(_456, _458);
    float _462 = abs(_440);
    float _464 = abs(_442);
    float _466 = precise::max(_462, _464);
    float _468 = fma(_117, 3.0, _107);
    float _470 = fma(_115, 3.0, _127);
    float _472 = fma(_117, 3.0, _129);
    float _474 = abs(_444);
    float _476 = precise::max(_474, _466);
    float _478 = fma(_131, 3.0, _119);
    float _480 = fma(_131, 3.0, _147);
    float _482 = fma(_131, 3.0, _161);
    float _484 = abs(_436);
    float _486 = abs(_468);
    float _488 = precise::max(_484, _486);
    float _490 = 1.0 / _476;
    float _492 = abs(_450);
    float _494 = abs(_452);
    float _496 = precise::max(_492, _494);
    float _498 = abs(_470);
    float _500 = abs(_472);
    float _502 = precise::max(_498, _500);
    float _504 = abs(_438);
    float _506 = precise::max(_504, _460);
    float _508 = abs(_478);
    float _510 = precise::max(_508, _488);
    float _512 = abs(_482);
    float _514 = precise::max(_512, _496);
    float _516 = abs(_480);
    float _518 = precise::max(_516, _502);
    float _520 = 1.0 / _506;
    float _522 = _440 * _490;
    float _524 = _442 * _490;
    float _526 = _444 * _490;
    float _528 = abs(_446);
    float _530 = abs(_448);
    float _532 = precise::max(_528, _530);
    float _534 = 1.0 / _514;
    float _536 = abs(_454);
    float _538 = precise::max(_536, _532);
    float _540 = 1.0 / _510;
    float _542 = _432 * _520;
    float _544 = _434 * _520;
    float _546 = _438 * _520;
    float _548 = 1.0 / _538;
    float _550 = _450 * _534;
    float _552 = _452 * _534;
    float _554 = _482 * _534;
    float _556 = 1.0 / _518;
    float _558 = _436 * _540;
    float _560 = _468 * _540;
    float _562 = _478 * _540;
    float _564 = _446 * _548;
    float _566 = _448 * _548;
    float _568 = _454 * _548;
    float4 _2970 = float4(_542, _544, _546, float(int(_220)));
    float4 _2972 = select(_2970, float4(0.0), isnan(_2970));
    float2 _570 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _2972.xyz, uint(rint(_2972.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _2972.xyz, uint(rint(_2972.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xy;
    float _572 = _570.x;
    float _574 = _570.y;
    float _576 = _470 * _556;
    float _578 = _472 * _556;
    float _580 = _480 * _556;
    float4 _2997 = float4(_522, _524, _526, float(int(_220)));
    float4 _2999 = select(_2997, float4(0.0), isnan(_2997));
    float2 _582 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _2999.xyz, uint(rint(_2999.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _2999.xyz, uint(rint(_2999.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xy;
    float _584 = _582.x;
    float _586 = _582.y;
    float4 _3015 = float4(_558, _560, _562, float(int(_220)));
    float4 _3017 = select(_3015, float4(0.0), isnan(_3015));
    float2 _588 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _3017.xyz, uint(rint(_3017.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _3017.xyz, uint(rint(_3017.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xy;
    float _590 = _588.x;
    float _592 = _588.y;
    float4 _3033 = float4(_576, _578, _580, float(int(_220)));
    float4 _3035 = select(_3033, float4(0.0), isnan(_3033));
    float2 _594 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _3035.xyz, uint(rint(_3035.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _3035.xyz, uint(rint(_3035.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xy;
    float _596 = _594.x;
    float _598 = _594.y;
    float4 _3051 = float4(_564, _566, _568, float(int(_220)));
    float4 _3053 = select(_3051, float4(0.0), isnan(_3051));
    float2 _600 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _3053.xyz, uint(rint(_3053.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _3053.xyz, uint(rint(_3053.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xy;
    float _602 = _600.x;
    float _604 = _600.y;
    float4 _3069 = float4(_550, _552, _554, float(int(_220)));
    float4 _3071 = select(_3069, float4(0.0), isnan(_3069));
    float2 _606 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _3071.xyz, uint(rint(_3071.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _3071.xyz, uint(rint(_3071.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xy;
    float _608 = _606.x;
    float _610 = _606.y;
    float _612 = precise::max(_248, _260);
    float _614 = precise::max(_266, _272);
    float _616 = precise::min(_248, _260);
    float _618 = precise::max(_250, _262);
    float _620 = precise::min(_266, _272);
    float _622 = precise::max(_268, _274);
    float _624 = precise::max(_612, _614);
    float _626 = precise::min(_616, _620);
    float _628 = precise::max(_618, _622);
    float _630 = precise::min(_250, _262);
    float _632 = precise::min(_268, _274);
    float _634 = precise::min(_630, _632);
    float _636 = precise::max(_386, _398);
    float _638 = precise::min(_386, _398);
    float _640 = precise::max(_388, _400);
    float _642 = precise::min(_388, _400);
    float _644 = precise::max(_404, _416);
    float _646 = precise::min(_404, _416);
    float _648 = precise::max(_406, _418);
    float _650 = precise::max(_644, _636);
    float _652 = precise::min(_406, _418);
    float _654 = precise::min(_646, _638);
    float _656 = precise::max(_648, _640);
    float _658 = precise::max(_650, _624);
    float _660 = precise::min(_652, _642);
    float _662 = precise::min(_654, _626);
    float _664 = precise::max(_422, _428);
    float _666 = precise::max(_656, _628);
    float _668 = precise::min(_422, _428);
    float _670 = precise::min(_660, _634);
    float _672 = precise::min(_424, _430);
    float _674 = precise::max(_572, _584);
    float _676 = precise::max(_590, _596);
    float _678 = precise::min(_572, _584);
    float _680 = precise::max(_602, _608);
    float _682 = precise::max(_664, _674);
    float _684 = precise::max(_676, _680);
    float _686 = precise::min(_668, _678);
    float _688 = precise::max(_424, _430);
    float _690 = precise::max(_574, _586);
    float _692 = precise::min(_590, _596);
    float _694 = precise::min(_602, _608);
    float _696 = precise::max(_682, _684);
    float _698 = precise::max(_688, _690);
    float _700 = precise::min(_692, _694);
    float _702 = precise::max(_658, _696);
    float _704 = precise::min(_574, _586);
    float _706 = precise::min(_592, _598);
    float _708 = _702 * 255.0;
    float _710 = precise::min(_604, _610);
    float _712 = precise::min(_686, _700);
    float _714 = precise::min(_672, _704);
    float _716 = trunc(_708);
    float _718 = precise::max(_716, 0.0);
    uint _720 = uint(_718);
    float _722 = precise::min(_706, _710);
    float _724 = precise::min(_662, _712);
    float _726 = precise::max(_592, _598);
    float _728 = precise::max(_604, _610);
    float _730 = _724 * 255.0;
    float _732 = precise::min(_714, _722);
    float _734 = precise::max(_726, _728);
    float _736 = precise::min(_670, _732);
    float _738 = trunc(_730);
    float _740 = precise::max(_738, 0.0);
    uint _742 = uint(_740);
    float _744 = precise::max(_698, _734);
    float _746 = _736 * 255.0;
    float _748 = precise::max(_666, _744);
    float _750 = trunc(_746);
    float _752 = precise::max(_750, 0.0);
    uint _754 = uint(_752);
    float _756 = _748 * 255.0;
    bool _760 = _720 > _742;
    float _762 = trunc(_756);
    float _764 = precise::max(_762, 0.0);
    uint _766 = uint(_764);
    int _769 = int(_742) << 8;
    int _771 = _769 & 65280;
    int _773 = int(_754) << 8;
    int _775 = 255 & int(_720);
    int _777 = _771 | _775;
    int _779 = _773 & 65280;
    int _781 = _771;
    int _783 = _779;
    int _785 = int(_754);
    int _787 = as_type<int>(_386);
    int _789 = as_type<int>(_724);
    if (!_760)
    {
        _781 = 0;
    }
    int _791 = _781;
    bool _793 = _766 > _754;
    int _795 = 255 & int(_766);
    int _797 = _779 | _795;
    int _799 = int(_766);
    int _801 = _791;
    if (!_760)
    {
        _783 = 0;
    }
    int _803 = _783;
    int _805 = _803;
    if (!_760)
    {
        _799 = 0;
    }
    int _807 = _799;
    bool _809 = !_760;
    int _811 = _807;
    if (!_809)
    {
        float _813 = -_724;
        float _815 = _702 + _813;
        float _817 = -_724;
        float _819 = _404 + _817;
        float _821 = -_724;
        float _823 = _416 + _821;
        float _825 = -_724;
        float _827 = _386 + _825;
        float _829 = -_724;
        float _831 = _398 + _829;
        float _833 = 1.0 / _815;
        float _835 = -_724;
        float _837 = _248 + _835;
        float _839 = -_724;
        float _841 = _260 + _839;
        float _843 = -_724;
        float _845 = _266 + _843;
        float _847 = -_724;
        float _849 = _272 + _847;
        float _851 = -_724;
        float _853 = _422 + _851;
        float _855 = -_724;
        float _857 = _428 + _855;
        float _859 = -_724;
        float _861 = _572 + _859;
        float _863 = -_724;
        float _865 = _584 + _863;
        float _867 = -_724;
        float _869 = _590 + _867;
        float _871 = -_724;
        float _873 = _596 + _871;
        float _875 = -_724;
        float _877 = _602 + _875;
        float _879 = -_724;
        float _881 = _608 + _879;
        float _883 = _819 * _833;
        float _885 = _823 * _833;
        float _887 = _827 * _833;
        float _889 = fma(_883, -1.99999904632568359375, 1.99999904632568359375);
        float _891 = _831 * _833;
        float _893 = fma(_883, -7.99999904632568359375, 7.99999904632568359375);
        float _895 = fma(_885, -1.99999904632568359375, 1.99999904632568359375);
        float _897 = fma(_885, -7.99999904632568359375, 7.99999904632568359375);
        float _899 = _837 * _833;
        float _901 = -_883;
        float _903 = _901 + 0.5;
        float _905 = -_885;
        float _907 = _905 + 0.5;
        float _909 = trunc(_889);
        float _911 = precise::max(_909, 0.0);
        uint _913 = uint(_911);
        float _915 = fma(_887, -1.99999904632568359375, 1.99999904632568359375);
        float _917 = fma(_887, -7.99999904632568359375, 7.99999904632568359375);
        float _919 = fma(_891, -1.99999904632568359375, 1.99999904632568359375);
        float _921 = fma(_891, -7.99999904632568359375, 7.99999904632568359375);
        float _923 = _841 * _833;
        float _925 = _845 * _833;
        float _927 = fma(_899, -1.99999904632568359375, 1.99999904632568359375);
        float _929 = trunc(_893);
        float _931 = precise::max(_929, 0.0);
        uint _933 = uint(_931);
        float _935 = fma(_899, -7.99999904632568359375, 7.99999904632568359375);
        float _937 = abs(_903);
        bool _939 = _937 >= 0.375;
        float _941 = _849 * _833;
        float _943 = _865 * _833;
        float _945 = abs(_907);
        bool _947 = _945 >= 0.375;
        float _949 = fma(_923, -1.99999904632568359375, 1.99999904632568359375);
        float _951 = -_887;
        float _953 = _951 + 0.5;
        float _955 = trunc(_895);
        float _957 = precise::max(_955, 0.0);
        uint _959 = uint(_957);
        float _961 = fma(_923, -7.99999904632568359375, 7.99999904632568359375);
        float _963 = -_891;
        float _965 = _963 + 0.5;
        float _967 = -_899;
        float _969 = _967 + 0.5;
        float _971 = fma(_925, -1.99999904632568359375, 1.99999904632568359375);
        float _973 = fma(_925, -7.99999904632568359375, 7.99999904632568359375);
        float _975 = -_923;
        float _977 = _975 + 0.5;
        float _979 = abs(_953);
        bool _981 = _979 >= 0.375;
        float _983 = trunc(_897);
        float _985 = precise::max(_983, 0.0);
        uint _987 = uint(_985);
        float _989 = abs(_965);
        bool _991 = _989 >= 0.375;
        float _993 = fma(_941, -7.99999904632568359375, 7.99999904632568359375);
        float _995 = abs(_969);
        bool _997 = _995 >= 0.375;
        float _999 = fma(_941, -1.99999904632568359375, 1.99999904632568359375);
        float _1001 = -_925;
        float _1003 = _1001 + 0.5;
        float _1005 = abs(_977);
        bool _1007 = _1005 >= 0.375;
        float _1009 = _853 * _833;
        float _1011 = trunc(_915);
        float _1013 = precise::max(_1011, 0.0);
        uint _1015 = uint(_1013);
        float _1017 = _857 * _833;
        float _1019 = -_941;
        float _1021 = _1019 + 0.5;
        int _1023 = int(_913);
        int _1025 = int(_959);
        int _1027 = int(_1015);
        if (!_939)
        {
            int _1029 = int(_933) + 1;
            _1023 = _1029;
        }
        int _1031 = _1023;
        float _1033 = _861 * _833;
        float _1035 = _869 * _833;
        float _1037 = _873 * _833;
        float _1039 = _877 * _833;
        float _1041 = trunc(_917);
        float _1043 = precise::max(_1041, 0.0);
        uint _1045 = uint(_1043);
        float _1047 = abs(_1003);
        bool _1049 = _1047 >= 0.375;
        float _1051 = _881 * _833;
        if (!_947)
        {
            int _1053 = int(_987) + 1;
            _1025 = _1053;
        }
        int _1055 = _1025;
        float _1057 = fma(_1009, -1.99999904632568359375, 1.99999904632568359375);
        float _1059 = fma(_1009, -7.99999904632568359375, 7.99999904632568359375);
        float _1061 = fma(_1017, -1.99999904632568359375, 1.99999904632568359375);
        float _1063 = fma(_1017, -7.99999904632568359375, 7.99999904632568359375);
        float _1065 = trunc(_919);
        float _1067 = precise::max(_1065, 0.0);
        uint _1069 = uint(_1067);
        float _1071 = abs(_1021);
        bool _1073 = _1071 >= 0.375;
        float _1075 = -_1009;
        float _1077 = _1075 + 0.5;
        float _1079 = -_1017;
        float _1081 = _1079 + 0.5;
        float _1083 = fma(_1033, -7.99999904632568359375, 7.99999904632568359375);
        float _1085 = fma(_943, -7.99999904632568359375, 7.99999904632568359375);
        float _1087 = fma(_1035, -7.99999904632568359375, 7.99999904632568359375);
        float _1089 = fma(_1037, -7.99999904632568359375, 7.99999904632568359375);
        float _1091 = trunc(_921);
        float _1093 = precise::max(_1091, 0.0);
        uint _1095 = uint(_1093);
        int _1097 = int(_1069);
        if (!_981)
        {
            int _1099 = int(_1045) + 1;
            _1027 = _1099;
        }
        int _1101 = _1027;
        float _1103 = fma(_1033, -1.99999904632568359375, 1.99999904632568359375);
        float _1105 = abs(_1077);
        bool _1107 = _1105 >= 0.375;
        float _1109 = -_1033;
        float _1111 = _1109 + 0.5;
        int _1113 = _1055 << 3;
        int _1115 = _1101 << 6;
        float _1117 = trunc(_927);
        float _1119 = precise::max(_1117, 0.0);
        uint _1121 = uint(_1119);
        int _1123 = _1031 | _1113;
        float _1125 = trunc(_935);
        float _1127 = precise::max(_1125, 0.0);
        uint _1129 = uint(_1127);
        int _1131 = int(_1121);
        if (!_991)
        {
            int _1133 = int(_1095) + 1;
            _1097 = _1133;
        }
        int _1135 = _1097;
        float _1137 = fma(_943, -1.99999904632568359375, 1.99999904632568359375);
        float _1139 = abs(_1081);
        bool _1141 = _1139 >= 0.375;
        float _1143 = -_943;
        float _1145 = _1143 + 0.5;
        int _1147 = _1135 << 9;
        float _1149 = trunc(_949);
        float _1151 = precise::max(_1149, 0.0);
        uint _1153 = uint(_1151);
        int _1155 = _1123 | _1115;
        int _1157 = _1147 | _1155;
        float _1159 = trunc(_961);
        float _1161 = precise::max(_1159, 0.0);
        uint _1163 = uint(_1161);
        int _1165 = int(_1153);
        if (!_997)
        {
            int _1167 = int(_1129) + 1;
            _1131 = _1167;
        }
        int _1169 = _1131;
        float _1171 = fma(_1035, -1.99999904632568359375, 1.99999904632568359375);
        float _1173 = -_1035;
        float _1175 = _1173 + 0.5;
        float _1177 = abs(_1111);
        bool _1179 = _1177 >= 0.375;
        int _1181 = _1169 << 12;
        float _1183 = trunc(_971);
        float _1185 = precise::max(_1183, 0.0);
        uint _1187 = uint(_1185);
        float _1189 = trunc(_973);
        float _1191 = precise::max(_1189, 0.0);
        uint _1193 = uint(_1191);
        int _1195 = int(_1187);
        if (!_1007)
        {
            int _1197 = int(_1163) + 1;
            _1165 = _1197;
        }
        int _1199 = _1165;
        float _1201 = fma(_1037, -1.99999904632568359375, 1.99999904632568359375);
        float _1203 = -_1037;
        float _1205 = _1203 + 0.5;
        float _1207 = abs(_1145);
        bool _1209 = _1207 >= 0.375;
        int _1211 = _1199 << 15;
        float _1213 = trunc(_999);
        float _1215 = precise::max(_1213, 0.0);
        uint _1217 = uint(_1215);
        int _1219 = _1157 | _1181;
        int _1221 = _1211 | _1219;
        float _1223 = trunc(_993);
        float _1225 = precise::max(_1223, 0.0);
        uint _1227 = uint(_1225);
        int _1229 = int(_1217);
        if (!_1049)
        {
            int _1231 = int(_1193) + 1;
            _1195 = _1231;
        }
        int _1233 = _1195;
        float _1235 = fma(_1039, -1.99999904632568359375, 1.99999904632568359375);
        float _1237 = abs(_1175);
        bool _1239 = _1237 >= 0.375;
        float _1241 = fma(_1039, -7.99999904632568359375, 7.99999904632568359375);
        float _1243 = fma(_1051, -7.99999904632568359375, 7.99999904632568359375);
        float _1245 = -_1039;
        float _1247 = _1245 + 0.5;
        int _1249 = _1233 << 18;
        float _1251 = trunc(_1057);
        float _1253 = precise::max(_1251, 0.0);
        uint _1255 = uint(_1253);
        float _1257 = trunc(_1059);
        float _1259 = precise::max(_1257, 0.0);
        uint _1261 = uint(_1259);
        int _1263 = int(_1255);
        _785 = _1249;
        if (!_1073)
        {
            int _1265 = int(_1227) + 1;
            _1229 = _1265;
        }
        int _1267 = _1229;
        float _1269 = abs(_1205);
        bool _1271 = _1269 >= 0.375;
        float _1273 = fma(_1051, -1.99999904632568359375, 1.99999904632568359375);
        float _1275 = -_1051;
        float _1277 = _1275 + 0.5;
        int _1279 = _1267 << 21;
        float _1281 = trunc(_1061);
        float _1283 = precise::max(_1281, 0.0);
        uint _1285 = uint(_1283);
        int _1287 = _1221 | _1249;
        int _1289 = _1279 | _1287;
        int _1291 = _1289 << 16;
        float _1293 = trunc(_1063);
        float _1295 = precise::max(_1293, 0.0);
        uint _1297 = uint(_1295);
        int _1299 = int(_1285);
        _801 = _1291;
        _787 = _1289;
        if (!_1107)
        {
            int _1301 = int(_1261) + 1;
            _1263 = _1301;
        }
        int _1303 = _1263;
        float _1305 = abs(_1247);
        bool _1307 = _1305 >= 0.375;
        float _1309 = trunc(_1103);
        float _1311 = precise::max(_1309, 0.0);
        uint _1313 = uint(_1311);
        float _1315 = trunc(_1083);
        float _1317 = precise::max(_1315, 0.0);
        uint _1319 = uint(_1317);
        int _1321 = int(_1313);
        if (!_1141)
        {
            int _1323 = int(_1297) + 1;
            _1299 = _1323;
        }
        int _1325 = _1299;
        float _1327 = abs(_1277);
        bool _1329 = _1327 >= 0.375;
        int _1331 = _1325 << 3;
        float _1333 = trunc(_1137);
        float _1335 = precise::max(_1333, 0.0);
        uint _1337 = uint(_1335);
        int _1339 = _1303 | _1331;
        float _1341 = trunc(_1085);
        float _1343 = precise::max(_1341, 0.0);
        uint _1345 = uint(_1343);
        int _1347 = int(_1337);
        if (!_1179)
        {
            int _1349 = int(_1319) + 1;
            _1321 = _1349;
        }
        int _1351 = _1321;
        int _1353 = _1351 << 6;
        float _1355 = trunc(_1171);
        float _1357 = precise::max(_1355, 0.0);
        uint _1359 = uint(_1357);
        float _1361 = trunc(_1087);
        float _1363 = precise::max(_1361, 0.0);
        uint _1365 = uint(_1363);
        int _1367 = int(_1359);
        if (!_1209)
        {
            int _1369 = int(_1345) + 1;
            _1347 = _1369;
        }
        int _1371 = _1347;
        int _1373 = _1371 << 9;
        float _1375 = trunc(_1201);
        float _1377 = precise::max(_1375, 0.0);
        uint _1379 = uint(_1377);
        int _1381 = _1339 | _1353;
        int _1383 = _1373 | _1381;
        float _1385 = trunc(_1089);
        float _1387 = precise::max(_1385, 0.0);
        uint _1389 = uint(_1387);
        int _1391 = int(_1379);
        if (!_1239)
        {
            int _1393 = int(_1365) + 1;
            _1367 = _1393;
        }
        int _1395 = _1367;
        int _1397 = _1395 << 12;
        float _1399 = trunc(_1235);
        float _1401 = precise::max(_1399, 0.0);
        uint _1403 = uint(_1401);
        float _1405 = trunc(_1241);
        float _1407 = precise::max(_1405, 0.0);
        uint _1409 = uint(_1407);
        int _1411 = int(_1403);
        if (!_1271)
        {
            int _1413 = int(_1389) + 1;
            _1391 = _1413;
        }
        int _1415 = _1391;
        int _1417 = _1415 << 15;
        float _1419 = trunc(_1273);
        float _1421 = precise::max(_1419, 0.0);
        uint _1423 = uint(_1421);
        int _1425 = _1383 | _1397;
        int _1427 = _1417 | _1425;
        float _1429 = trunc(_1243);
        float _1431 = precise::max(_1429, 0.0);
        uint _1433 = uint(_1431);
        int _1435 = int(_1423);
        if (!_1307)
        {
            int _1437 = int(_1409) + 1;
            _1411 = _1437;
        }
        int _1439 = _1411;
        int _1441 = _1439 << 18;
        if (!_1329)
        {
            int _1443 = int(_1433) + 1;
            _1435 = _1443;
        }
        int _1445 = _1435;
        int _1447 = _1445 << 21;
        int _1449 = _1427 | _1441;
        int _1451 = _1447 | _1449;
        uint _1453 = uint(int(uint(_1289) >> uint(16)));
        int _1455 = _1451 << 8;
        uint _1457 = uint(int(uint(_1451) >> uint(8)));
        int _1459 = 65280 & _1455;
        int _1461 = int(_1453) | _1459;
        int _1463 = int(_1457) << 16;
        _811 = _1463;
        _805 = _1461;
        _789 = int(_1453);
    }
    int _1465 = _801;
    int _1467 = _811;
    int _1469 = _805;
    int _1471 = _785;
    int _1473 = _787;
    int _1475 = _789;
    int _1477 = _1471;
    int _1479 = _1475;
    int _1481 = _1473;
    if (!_793)
    {
        _1477 = 0;
    }
    int _1483 = _1477;
    int _1485 = _1483;
    if (!_793)
    {
        _1479 = 0;
    }
    int _1487 = _1479;
    int _1489 = _1487;
    if (!_793)
    {
        _1481 = 0;
    }
    int _1491 = _1481;
    bool _1493 = !_793;
    int _1495 = _1491;
    if (!_1493)
    {
        float _1497 = -_736;
        float _1499 = _748 + _1497;
        float _1501 = -_736;
        float _1503 = _406 + _1501;
        float _1505 = -_736;
        float _1507 = _418 + _1505;
        float _1509 = -_736;
        float _1511 = _388 + _1509;
        float _1513 = -_736;
        float _1515 = _430 + _1513;
        float _1517 = 1.0 / _1499;
        float _1519 = -_736;
        float _1521 = _400 + _1519;
        float _1523 = -_736;
        float _1525 = _250 + _1523;
        float _1527 = -_736;
        float _1529 = _262 + _1527;
        float _1531 = -_736;
        float _1533 = _268 + _1531;
        float _1535 = -_736;
        float _1537 = _274 + _1535;
        float _1539 = -_736;
        float _1541 = _424 + _1539;
        float _1543 = -_736;
        float _1545 = _586 + _1543;
        float _1547 = -_736;
        float _1549 = _574 + _1547;
        float _1551 = -_736;
        float _1553 = _604 + _1551;
        float _1555 = -_736;
        float _1557 = _610 + _1555;
        float _1559 = _1503 * _1517;
        float _1561 = _1507 * _1517;
        float _1563 = _1511 * _1517;
        float _1565 = _1515 * _1517;
        float _1567 = -_736;
        float _1569 = _598 + _1567;
        float _1571 = -_1559;
        float _1573 = _1571 + 0.5;
        float _1575 = fma(_1559, -1.99999904632568359375, 1.99999904632568359375);
        float _1577 = fma(_1559, -7.99999904632568359375, 7.99999904632568359375);
        float _1579 = fma(_1561, -1.99999904632568359375, 1.99999904632568359375);
        float _1581 = fma(_1561, -7.99999904632568359375, 7.99999904632568359375);
        float _1583 = fma(_1563, -1.99999904632568359375, 1.99999904632568359375);
        float _1585 = fma(_1563, -7.99999904632568359375, 7.99999904632568359375);
        float _1587 = _1521 * _1517;
        float _1589 = _1525 * _1517;
        float _1591 = _1529 * _1517;
        float _1593 = abs(_1573);
        bool _1595 = _1593 >= 0.375;
        float _1597 = fma(_1587, -1.99999904632568359375, 1.99999904632568359375);
        float _1599 = fma(_1587, -7.99999904632568359375, 7.99999904632568359375);
        float _1601 = fma(_1589, -1.99999904632568359375, 1.99999904632568359375);
        float _1603 = fma(_1589, -7.99999904632568359375, 7.99999904632568359375);
        float _1605 = fma(_1591, -1.99999904632568359375, 1.99999904632568359375);
        float _1607 = fma(_1591, -7.99999904632568359375, 7.99999904632568359375);
        float _1609 = -_1561;
        float _1611 = _1609 + 0.5;
        float _1613 = -_1563;
        float _1615 = _1613 + 0.5;
        float _1617 = trunc(_1575);
        float _1619 = precise::max(_1617, 0.0);
        uint _1621 = uint(_1619);
        float _1623 = _1533 * _1517;
        float _1625 = -_1587;
        float _1627 = _1625 + 0.5;
        float _1629 = -_1589;
        float _1631 = _1629 + 0.5;
        float _1633 = -_1591;
        float _1635 = _1633 + 0.5;
        float _1637 = abs(_1611);
        bool _1639 = _1637 >= 0.375;
        float _1641 = fma(_1623, -1.99999904632568359375, 1.99999904632568359375);
        float _1643 = abs(_1615);
        bool _1645 = _1643 >= 0.375;
        float _1647 = trunc(_1577);
        float _1649 = precise::max(_1647, 0.0);
        uint _1651 = uint(_1649);
        float _1653 = fma(_1623, -7.99999904632568359375, 7.99999904632568359375);
        float _1655 = _1537 * _1517;
        float _1657 = _1541 * _1517;
        float _1659 = _1545 * _1517;
        float _1661 = -_736;
        float _1663 = _592 + _1661;
        float _1665 = abs(_1627);
        bool _1667 = _1665 >= 0.375;
        float _1669 = fma(_1655, -1.99999904632568359375, 1.99999904632568359375);
        float _1671 = trunc(_1579);
        float _1673 = precise::max(_1671, 0.0);
        uint _1675 = uint(_1673);
        float _1677 = abs(_1631);
        bool _1679 = _1677 >= 0.375;
        float _1681 = fma(_1655, -7.99999904632568359375, 7.99999904632568359375);
        float _1683 = abs(_1635);
        bool _1685 = _1683 >= 0.375;
        float _1687 = fma(_1657, -1.99999904632568359375, 1.99999904632568359375);
        float _1689 = fma(_1657, -7.99999904632568359375, 7.99999904632568359375);
        float _1691 = fma(_1565, -1.99999904632568359375, 1.99999904632568359375);
        float _1693 = fma(_1565, -7.99999904632568359375, 7.99999904632568359375);
        float _1695 = trunc(_1581);
        float _1697 = precise::max(_1695, 0.0);
        uint _1699 = uint(_1697);
        float _1701 = _1549 * _1517;
        float _1703 = -_1623;
        float _1705 = _1703 + 0.5;
        float _1707 = _1663 * _1517;
        float _1709 = fma(_1659, -1.99999904632568359375, 1.99999904632568359375);
        float _1711 = fma(_1701, -1.99999904632568359375, 1.99999904632568359375);
        float _1713 = fma(_1701, -7.99999904632568359375, 7.99999904632568359375);
        float _1715 = -_1655;
        float _1717 = _1715 + 0.5;
        float _1719 = trunc(_1583);
        float _1721 = precise::max(_1719, 0.0);
        uint _1723 = uint(_1721);
        float _1725 = -_1657;
        float _1727 = _1725 + 0.5;
        float _1729 = -_1565;
        float _1731 = _1729 + 0.5;
        float _1733 = _1569 * _1517;
        float _1735 = abs(_1705);
        bool _1737 = _1735 >= 0.375;
        float _1739 = fma(_1659, -7.99999904632568359375, 7.99999904632568359375);
        float _1741 = fma(_1707, -1.99999904632568359375, 1.99999904632568359375);
        float _1743 = fma(_1707, -7.99999904632568359375, 7.99999904632568359375);
        float _1745 = trunc(_1585);
        float _1747 = precise::max(_1745, 0.0);
        uint _1749 = uint(_1747);
        int _1751 = int(_1621);
        int _1753 = int(_1675);
        int _1755 = int(_1723);
        if (!_1595)
        {
            int _1757 = int(_1651) + 1;
            _1751 = _1757;
        }
        int _1759 = _1751;
        float _1761 = -_1701;
        float _1763 = _1761 + 0.5;
        if (!_1639)
        {
            int _1765 = int(_1699) + 1;
            _1753 = _1765;
        }
        int _1767 = _1753;
        float _1769 = -_1659;
        float _1771 = _1769 + 0.5;
        float _1773 = -_1707;
        float _1775 = _1773 + 0.5;
        float _1777 = _1553 * _1517;
        float _1779 = _1557 * _1517;
        float _1781 = trunc(_1597);
        float _1783 = precise::max(_1781, 0.0);
        uint _1785 = uint(_1783);
        float _1787 = fma(_1733, -1.99999904632568359375, 1.99999904632568359375);
        float _1789 = abs(_1717);
        bool _1791 = _1789 >= 0.375;
        float _1793 = fma(_1733, -7.99999904632568359375, 7.99999904632568359375);
        float _1795 = abs(_1727);
        bool _1797 = _1795 >= 0.375;
        float _1799 = fma(_1777, -1.99999904632568359375, 1.99999904632568359375);
        float _1801 = -_1733;
        float _1803 = _1801 + 0.5;
        float _1805 = fma(_1779, -1.99999904632568359375, 1.99999904632568359375);
        float _1807 = trunc(_1599);
        float _1809 = precise::max(_1807, 0.0);
        uint _1811 = uint(_1809);
        int _1813 = int(_1785);
        if (!_1645)
        {
            int _1815 = int(_1749) + 1;
            _1755 = _1815;
        }
        int _1817 = _1755;
        float _1819 = abs(_1731);
        bool _1821 = _1819 >= 0.375;
        int _1823 = _1817 << 6;
        float _1825 = trunc(_1601);
        float _1827 = precise::max(_1825, 0.0);
        uint _1829 = uint(_1827);
        float _1831 = trunc(_1603);
        float _1833 = precise::max(_1831, 0.0);
        uint _1835 = uint(_1833);
        int _1837 = int(_1829);
        if (!_1667)
        {
            int _1839 = int(_1811) + 1;
            _1813 = _1839;
        }
        int _1841 = _1813;
        float _1843 = abs(_1763);
        bool _1845 = _1843 >= 0.375;
        int _1847 = _1841 << 9;
        float _1849 = trunc(_1605);
        float _1851 = precise::max(_1849, 0.0);
        uint _1853 = uint(_1851);
        float _1855 = trunc(_1607);
        float _1857 = precise::max(_1855, 0.0);
        uint _1859 = uint(_1857);
        int _1861 = int(_1853);
        if (!_1679)
        {
            int _1863 = int(_1835) + 1;
            _1837 = _1863;
        }
        int _1865 = _1837;
        float _1867 = abs(_1771);
        bool _1869 = _1867 >= 0.375;
        float _1871 = trunc(_1641);
        float _1873 = precise::max(_1871, 0.0);
        uint _1875 = uint(_1873);
        float _1877 = trunc(_1653);
        float _1879 = precise::max(_1877, 0.0);
        uint _1881 = uint(_1879);
        int _1883 = int(_1875);
        if (!_1685)
        {
            int _1885 = int(_1859) + 1;
            _1861 = _1885;
        }
        int _1887 = _1861;
        float _1889 = abs(_1775);
        bool _1891 = _1889 >= 0.375;
        float _1893 = fma(_1779, -7.99999904632568359375, 7.99999904632568359375);
        float _1895 = -_1779;
        float _1897 = _1895 + 0.5;
        int _1899 = _1887 << 15;
        float _1901 = trunc(_1669);
        float _1903 = precise::max(_1901, 0.0);
        uint _1905 = uint(_1903);
        float _1907 = trunc(_1681);
        float _1909 = precise::max(_1907, 0.0);
        uint _1911 = uint(_1909);
        int _1913 = int(_1905);
        if (!_1737)
        {
            int _1915 = int(_1881) + 1;
            _1883 = _1915;
        }
        int _1917 = _1883;
        float _1919 = abs(_1803);
        bool _1921 = _1919 >= 0.375;
        int _1923 = _1917 << 18;
        float _1925 = trunc(_1687);
        float _1927 = precise::max(_1925, 0.0);
        uint _1929 = uint(_1927);
        float _1931 = trunc(_1689);
        float _1933 = precise::max(_1931, 0.0);
        uint _1935 = uint(_1933);
        int _1937 = int(_1929);
        if (!_1791)
        {
            int _1939 = int(_1911) + 1;
            _1913 = _1939;
        }
        int _1941 = _1913;
        int _1943 = _1941 << 21;
        float _1945 = trunc(_1691);
        float _1947 = precise::max(_1945, 0.0);
        uint _1949 = uint(_1947);
        float _1951 = trunc(_1693);
        float _1953 = precise::max(_1951, 0.0);
        uint _1955 = uint(_1953);
        int _1957 = int(_1949);
        if (!_1797)
        {
            int _1959 = int(_1935) + 1;
            _1937 = _1959;
        }
        int _1961 = _1937;
        float _1963 = abs(_1897);
        bool _1965 = _1963 >= 0.375;
        float _1967 = trunc(_1711);
        float _1969 = precise::max(_1967, 0.0);
        uint _1971 = uint(_1969);
        float _1973 = trunc(_1713);
        float _1975 = precise::max(_1973, 0.0);
        uint _1977 = uint(_1975);
        int _1979 = int(_1971);
        if (!_1821)
        {
            int _1981 = int(_1955) + 1;
            _1957 = _1981;
        }
        int _1983 = _1957;
        int _1985 = _1983 << 3;
        float _1987 = trunc(_1709);
        float _1989 = precise::max(_1987, 0.0);
        uint _1991 = uint(_1989);
        int _1993 = _1961 | _1985;
        float _1995 = trunc(_1739);
        float _1997 = precise::max(_1995, 0.0);
        uint _1999 = uint(_1997);
        int _2001 = int(_1991);
        if (!_1845)
        {
            int _2003 = int(_1977) + 1;
            _1979 = _2003;
        }
        int _2005 = _1979;
        float _2007 = trunc(_1787);
        float _2009 = precise::max(_2007, 0.0);
        uint _2011 = uint(_2009);
        float _2013 = trunc(_1741);
        float _2015 = precise::max(_2013, 0.0);
        uint _2017 = uint(_2015);
        float _2019 = fma(_1777, -7.99999904632568359375, 7.99999904632568359375);
        float _2021 = -_1777;
        float _2023 = _2021 + 0.5;
        int _2025 = int(_2017);
        int _2027 = int(_2011);
        if (!_1869)
        {
            int _2029 = int(_1999) + 1;
            _2001 = _2029;
        }
        int _2031 = _2001;
        int _2033 = _1767 << 3;
        float _2035 = abs(_2023);
        bool _2037 = _2035 >= 0.375;
        float _2039 = trunc(_1743);
        float _2041 = precise::max(_2039, 0.0);
        uint _2043 = uint(_2041);
        int _2045 = _2005 << 6;
        int _2047 = _2031 << 9;
        int _2049 = _1759 | _2033;
        int _2051 = _1993 | _2045;
        int _2053 = _2047 | _2051;
        float _2055 = trunc(_1793);
        float _2057 = precise::max(_2055, 0.0);
        uint _2059 = uint(_2057);
        int _2061 = _2049 | _1823;
        int _2063 = _1847 | _2061;
        int _2065 = _1865 << 12;
        int _2067 = _2063 | _2065;
        int _2069 = _1899 | _2067;
        float _2071 = trunc(_1799);
        float _2073 = precise::max(_2071, 0.0);
        uint _2075 = uint(_2073);
        int _2077 = int(_2075);
        if (!_1891)
        {
            int _2079 = int(_2043) + 1;
            _2025 = _2079;
        }
        int _2081 = _2025;
        int _2083 = _2069 | _1923;
        int _2085 = _1943 | _2083;
        int _2087 = _2081 << 12;
        uint _2089 = uint(int(uint(_2085) >> uint(16)));
        float _2091 = trunc(_2019);
        float _2093 = precise::max(_2091, 0.0);
        uint _2095 = uint(_2093);
        if (!_1921)
        {
            int _2097 = int(_2059) + 1;
            _2027 = _2097;
        }
        int _2099 = _2027;
        int _2101 = _2085 << 16;
        int _2103 = _2099 << 15;
        float _2105 = trunc(_1805);
        float _2107 = precise::max(_2105, 0.0);
        uint _2109 = uint(_2107);
        int _2111 = _2053 | _2087;
        int _2113 = _2103 | _2111;
        float _2115 = trunc(_1893);
        float _2117 = precise::max(_2115, 0.0);
        uint _2119 = uint(_2117);
        int _2121 = int(_2109);
        _1485 = _2101;
        if (!_2037)
        {
            int _2123 = int(_2095) + 1;
            _2077 = _2123;
        }
        int _2125 = _2077;
        int _2127 = _2125 << 18;
        if (!_1965)
        {
            int _2129 = int(_2119) + 1;
            _2121 = _2129;
        }
        int _2131 = _2121;
        int _2133 = _2131 << 21;
        int _2135 = _2113 | _2127;
        int _2137 = _2133 | _2135;
        int _2139 = _2137 << 8;
        uint _2141 = uint(int(uint(_2137) >> uint(8)));
        int _2143 = 65280 & _2139;
        int _2145 = int(_2089) | _2143;
        int _2147 = int(_2141) << 16;
        _1495 = _2147;
        _1489 = _2145;
    }
    int _2149 = _1485;
    int _2151 = _1495;
    int _2153 = _1489;
    int _2155 = _1465 | _777;
    int _2157 = _1467 | _1469;
    int _2159 = _2149 | _797;
    int _2161 = _2151 | _2153;
    out.m_36.x = as_type<float>(_2155);
    out.m_36.y = as_type<float>(_2157);
    out.m_36.z = as_type<float>(_2159);
    out.m_36.w = as_type<float>(_2161);
    return out;
}


struct main0_out_u
{
    uint4 m_36 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _43 = gl_FragCoord.w;
    float _45 = in.m_29.y;
    float _47 = gl_FragCoord.w;
    float _49 = _45 * _47;
    float _51 = in.m_29.x;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = in.m_31.x;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = in.m_31.y;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = in.m_33.x;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_33.y;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_29.z;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = in.m_31.z;
    float _89 = gl_FragCoord.w;
    float _91 = _87 * _89;
    float _93 = in.m_33.z;
    float _95 = gl_FragCoord.w;
    float _97 = _93 * _95;
    float _99 = in.m_29.w;
    float _101 = gl_FragCoord.w;
    float _103 = _99 * _101;
    float _105 = 1.0 / _43;
    float _107 = _105 * _49;
    float _109 = _105 * _55;
    float _111 = _105 * _61;
    float _113 = _105 * _67;
    float _115 = _105 * _73;
    float _117 = _105 * _79;
    float _119 = _105 * _85;
    float _121 = _105 * _91;
    float _123 = fma(_111, 2.0, _109);
    float _125 = fma(_113, 2.0, _107);
    float _127 = _109 + _111;
    float _129 = _107 + _113;
    float _131 = _105 * _97;
    float _133 = _109 + _115;
    float _135 = _107 + _117;
    float _137 = fma(_111, 3.0, _109);
    float _139 = fma(_113, 3.0, _107);
    float _141 = fma(_121, 2.0, _119);
    float _143 = _123 + _115;
    float _145 = _125 + _117;
    float _147 = _119 + _121;
    float _149 = _127 + _115;
    float _151 = _129 + _117;
    float _153 = _119 + _131;
    float _155 = abs(_133);
    float _157 = abs(_135);
    float _159 = precise::max(_155, _157);
    float _161 = fma(_121, 3.0, _119);
    float _163 = _141 + _131;
    float _165 = _137 + _115;
    float _167 = _139 + _117;
    float _169 = abs(_143);
    float _171 = abs(_145);
    float _173 = precise::max(_169, _171);
    float _175 = _147 + _131;
    float _177 = abs(_149);
    float _179 = abs(_151);
    float _181 = precise::max(_177, _179);
    float _183 = _161 + _131;
    float _185 = abs(_153);
    float _187 = precise::max(_185, _159);
    float _189 = _105 * _103;
    float _191 = abs(_163);
    float _193 = precise::max(_191, _173);
    float _195 = abs(_165);
    float _197 = abs(_167);
    float _199 = precise::max(_195, _197);
    float _201 = abs(_175);
    float _203 = precise::max(_201, _181);
    float _205 = 1.0 / _187;
    float _207 = abs(_183);
    float _209 = precise::max(_207, _199);
    float _211 = 1.0 / _193;
    float _213 = rint(_189);
    float _215 = precise::max(_213, 0.0);
    uint _218 = uint(_215);
    uint _220 = clamp(_218, 0u, 65535u);
    float _222 = _135 * _205;
    float _224 = _153 * _205;
    float _226 = _133 * _205;
    float _228 = 1.0 / _203;
    float _230 = _143 * _211;
    float _232 = _145 * _211;
    float _234 = _163 * _211;
    float _236 = 1.0 / _209;
    float _238 = _149 * _228;
    float _240 = _151 * _228;
    float _242 = _175 * _228;
    float4 _2439 = float4(_226, _222, _224, float(int(_220)));
    float4 _2443 = select(_2439, float4(0.0), isnan(_2439));
    float2 _246 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _2443.xyz, uint(rint(_2443.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _2443.xyz, uint(rint(_2443.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xy;
    float _248 = _246.x;
    float _250 = _246.y;
    float _252 = _165 * _236;
    float _254 = _167 * _236;
    float _256 = _183 * _236;
    float4 _2469 = float4(_238, _240, _242, float(int(_220)));
    float4 _2471 = select(_2469, float4(0.0), isnan(_2469));
    float2 _258 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _2471.xyz, uint(rint(_2471.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _2471.xyz, uint(rint(_2471.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xy;
    float _260 = _258.x;
    float _262 = _258.y;
    float4 _2487 = float4(_230, _232, _234, float(int(_220)));
    float4 _2489 = select(_2487, float4(0.0), isnan(_2487));
    float2 _264 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _2489.xyz, uint(rint(_2489.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _2489.xyz, uint(rint(_2489.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xy;
    float _266 = _264.x;
    float _268 = _264.y;
    float4 _2505 = float4(_252, _254, _256, float(int(_220)));
    float4 _2507 = select(_2505, float4(0.0), isnan(_2505));
    float2 _270 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _2507.xyz, uint(rint(_2507.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _2507.xyz, uint(rint(_2507.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xy;
    float _272 = _270.x;
    float _274 = _270.y;
    float _276 = fma(_115, 2.0, _109);
    float _278 = fma(_117, 2.0, _107);
    float _280 = fma(_131, 2.0, _119);
    float _282 = fma(_115, 2.0, _127);
    float _284 = fma(_117, 2.0, _129);
    float _286 = abs(_109);
    float _288 = abs(_107);
    float _290 = precise::max(_286, _288);
    float _292 = abs(_276);
    float _294 = abs(_278);
    float _296 = precise::max(_292, _294);
    float _298 = abs(_119);
    float _300 = precise::max(_298, _290);
    float _302 = abs(_280);
    float _304 = precise::max(_302, _296);
    float _306 = fma(_131, 2.0, _147);
    float _308 = abs(_282);
    float _310 = abs(_284);
    float _312 = precise::max(_308, _310);
    float _314 = 1.0 / _304;
    float _316 = abs(_306);
    float _318 = precise::max(_316, _312);
    float _320 = abs(_123);
    float _322 = abs(_125);
    float _324 = precise::max(_320, _322);
    float _326 = 1.0 / _300;
    float _328 = abs(_141);
    float _330 = precise::max(_328, _324);
    float _332 = abs(_137);
    float _334 = abs(_139);
    float _336 = precise::max(_332, _334);
    float _338 = 1.0 / _330;
    float _340 = abs(_161);
    float _342 = precise::max(_340, _336);
    float _344 = _278 * _314;
    float _346 = abs(_127);
    float _348 = abs(_129);
    float _350 = precise::max(_346, _348);
    float _352 = _276 * _314;
    float _354 = _280 * _314;
    float _356 = abs(_147);
    float _358 = precise::max(_356, _350);
    float _360 = 1.0 / _342;
    float _362 = _109 * _326;
    float _364 = _107 * _326;
    float _366 = _119 * _326;
    float _368 = _123 * _338;
    float _370 = 1.0 / _358;
    float _372 = _125 * _338;
    float _374 = _141 * _338;
    float _376 = 1.0 / _318;
    float _378 = _137 * _360;
    float _380 = _139 * _360;
    float _382 = _161 * _360;
    float4 _2661 = float4(_368, _372, _374, float(int(_220)));
    float4 _2663 = select(_2661, float4(0.0), isnan(_2661));
    float2 _384 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _2663.xyz, uint(rint(_2663.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _2663.xyz, uint(rint(_2663.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xy;
    float _386 = _384.x;
    float _388 = _384.y;
    float _390 = _127 * _370;
    float _392 = _129 * _370;
    float _394 = _147 * _370;
    float4 _2688 = float4(_378, _380, _382, float(int(_220)));
    float4 _2690 = select(_2688, float4(0.0), isnan(_2688));
    float2 _396 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _2690.xyz, uint(rint(_2690.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _2690.xyz, uint(rint(_2690.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xy;
    float _398 = _396.x;
    float _400 = _396.y;
    float4 _2706 = float4(_362, _364, _366, float(int(_220)));
    float4 _2708 = select(_2706, float4(0.0), isnan(_2706));
    float2 _402 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _2708.xyz, uint(rint(_2708.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _2708.xyz, uint(rint(_2708.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xy;
    float _404 = _402.x;
    float _406 = _402.y;
    float _408 = _282 * _376;
    float _410 = _284 * _376;
    float _412 = _306 * _376;
    float4 _2733 = float4(_390, _392, _394, float(int(_220)));
    float4 _2735 = select(_2733, float4(0.0), isnan(_2733));
    float2 _414 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _2735.xyz, uint(rint(_2735.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _2735.xyz, uint(rint(_2735.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xy;
    float _416 = _414.x;
    float _418 = _414.y;
    float4 _2751 = float4(_352, _344, _354, float(int(_220)));
    float4 _2753 = select(_2751, float4(0.0), isnan(_2751));
    float2 _420 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _2753.xyz, uint(rint(_2753.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _2753.xyz, uint(rint(_2753.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xy;
    float _422 = _420.x;
    float _424 = _420.y;
    float4 _2769 = float4(_408, _410, _412, float(int(_220)));
    float4 _2771 = select(_2769, float4(0.0), isnan(_2769));
    float2 _426 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _2771.xyz, uint(rint(_2771.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _2771.xyz, uint(rint(_2771.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xy;
    float _428 = _426.x;
    float _430 = _426.y;
    float _432 = fma(_115, 2.0, _123);
    float _434 = fma(_117, 2.0, _125);
    float _436 = fma(_115, 3.0, _109);
    float _438 = fma(_131, 2.0, _141);
    float _440 = fma(_115, 2.0, _137);
    float _442 = fma(_117, 2.0, _139);
    float _444 = fma(_131, 2.0, _161);
    float _446 = fma(_115, 3.0, _123);
    float _448 = fma(_117, 3.0, _125);
    float _450 = fma(_115, 3.0, _137);
    float _452 = fma(_117, 3.0, _139);
    float _454 = fma(_131, 3.0, _141);
    float _456 = abs(_432);
    float _458 = abs(_434);
    float _460 = precise::max(_456, _458);
    float _462 = abs(_440);
    float _464 = abs(_442);
    float _466 = precise::max(_462, _464);
    float _468 = fma(_117, 3.0, _107);
    float _470 = fma(_115, 3.0, _127);
    float _472 = fma(_117, 3.0, _129);
    float _474 = abs(_444);
    float _476 = precise::max(_474, _466);
    float _478 = fma(_131, 3.0, _119);
    float _480 = fma(_131, 3.0, _147);
    float _482 = fma(_131, 3.0, _161);
    float _484 = abs(_436);
    float _486 = abs(_468);
    float _488 = precise::max(_484, _486);
    float _490 = 1.0 / _476;
    float _492 = abs(_450);
    float _494 = abs(_452);
    float _496 = precise::max(_492, _494);
    float _498 = abs(_470);
    float _500 = abs(_472);
    float _502 = precise::max(_498, _500);
    float _504 = abs(_438);
    float _506 = precise::max(_504, _460);
    float _508 = abs(_478);
    float _510 = precise::max(_508, _488);
    float _512 = abs(_482);
    float _514 = precise::max(_512, _496);
    float _516 = abs(_480);
    float _518 = precise::max(_516, _502);
    float _520 = 1.0 / _506;
    float _522 = _440 * _490;
    float _524 = _442 * _490;
    float _526 = _444 * _490;
    float _528 = abs(_446);
    float _530 = abs(_448);
    float _532 = precise::max(_528, _530);
    float _534 = 1.0 / _514;
    float _536 = abs(_454);
    float _538 = precise::max(_536, _532);
    float _540 = 1.0 / _510;
    float _542 = _432 * _520;
    float _544 = _434 * _520;
    float _546 = _438 * _520;
    float _548 = 1.0 / _538;
    float _550 = _450 * _534;
    float _552 = _452 * _534;
    float _554 = _482 * _534;
    float _556 = 1.0 / _518;
    float _558 = _436 * _540;
    float _560 = _468 * _540;
    float _562 = _478 * _540;
    float _564 = _446 * _548;
    float _566 = _448 * _548;
    float _568 = _454 * _548;
    float4 _2970 = float4(_542, _544, _546, float(int(_220)));
    float4 _2972 = select(_2970, float4(0.0), isnan(_2970));
    float2 _570 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _2972.xyz, uint(rint(_2972.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _2972.xyz, uint(rint(_2972.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xy;
    float _572 = _570.x;
    float _574 = _570.y;
    float _576 = _470 * _556;
    float _578 = _472 * _556;
    float _580 = _480 * _556;
    float4 _2997 = float4(_522, _524, _526, float(int(_220)));
    float4 _2999 = select(_2997, float4(0.0), isnan(_2997));
    float2 _582 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _2999.xyz, uint(rint(_2999.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _2999.xyz, uint(rint(_2999.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xy;
    float _584 = _582.x;
    float _586 = _582.y;
    float4 _3015 = float4(_558, _560, _562, float(int(_220)));
    float4 _3017 = select(_3015, float4(0.0), isnan(_3015));
    float2 _588 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _3017.xyz, uint(rint(_3017.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _3017.xyz, uint(rint(_3017.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xy;
    float _590 = _588.x;
    float _592 = _588.y;
    float4 _3033 = float4(_576, _578, _580, float(int(_220)));
    float4 _3035 = select(_3033, float4(0.0), isnan(_3033));
    float2 _594 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _3035.xyz, uint(rint(_3035.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _3035.xyz, uint(rint(_3035.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xy;
    float _596 = _594.x;
    float _598 = _594.y;
    float4 _3051 = float4(_564, _566, _568, float(int(_220)));
    float4 _3053 = select(_3051, float4(0.0), isnan(_3051));
    float2 _600 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _3053.xyz, uint(rint(_3053.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _3053.xyz, uint(rint(_3053.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xy;
    float _602 = _600.x;
    float _604 = _600.y;
    float4 _3069 = float4(_550, _552, _554, float(int(_220)));
    float4 _3071 = select(_3069, float4(0.0), isnan(_3069));
    float2 _606 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _3071.xyz, uint(rint(_3071.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _3071.xyz, uint(rint(_3071.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xy;
    float _608 = _606.x;
    float _610 = _606.y;
    float _612 = precise::max(_248, _260);
    float _614 = precise::max(_266, _272);
    float _616 = precise::min(_248, _260);
    float _618 = precise::max(_250, _262);
    float _620 = precise::min(_266, _272);
    float _622 = precise::max(_268, _274);
    float _624 = precise::max(_612, _614);
    float _626 = precise::min(_616, _620);
    float _628 = precise::max(_618, _622);
    float _630 = precise::min(_250, _262);
    float _632 = precise::min(_268, _274);
    float _634 = precise::min(_630, _632);
    float _636 = precise::max(_386, _398);
    float _638 = precise::min(_386, _398);
    float _640 = precise::max(_388, _400);
    float _642 = precise::min(_388, _400);
    float _644 = precise::max(_404, _416);
    float _646 = precise::min(_404, _416);
    float _648 = precise::max(_406, _418);
    float _650 = precise::max(_644, _636);
    float _652 = precise::min(_406, _418);
    float _654 = precise::min(_646, _638);
    float _656 = precise::max(_648, _640);
    float _658 = precise::max(_650, _624);
    float _660 = precise::min(_652, _642);
    float _662 = precise::min(_654, _626);
    float _664 = precise::max(_422, _428);
    float _666 = precise::max(_656, _628);
    float _668 = precise::min(_422, _428);
    float _670 = precise::min(_660, _634);
    float _672 = precise::min(_424, _430);
    float _674 = precise::max(_572, _584);
    float _676 = precise::max(_590, _596);
    float _678 = precise::min(_572, _584);
    float _680 = precise::max(_602, _608);
    float _682 = precise::max(_664, _674);
    float _684 = precise::max(_676, _680);
    float _686 = precise::min(_668, _678);
    float _688 = precise::max(_424, _430);
    float _690 = precise::max(_574, _586);
    float _692 = precise::min(_590, _596);
    float _694 = precise::min(_602, _608);
    float _696 = precise::max(_682, _684);
    float _698 = precise::max(_688, _690);
    float _700 = precise::min(_692, _694);
    float _702 = precise::max(_658, _696);
    float _704 = precise::min(_574, _586);
    float _706 = precise::min(_592, _598);
    float _708 = _702 * 255.0;
    float _710 = precise::min(_604, _610);
    float _712 = precise::min(_686, _700);
    float _714 = precise::min(_672, _704);
    float _716 = trunc(_708);
    float _718 = precise::max(_716, 0.0);
    uint _720 = uint(_718);
    float _722 = precise::min(_706, _710);
    float _724 = precise::min(_662, _712);
    float _726 = precise::max(_592, _598);
    float _728 = precise::max(_604, _610);
    float _730 = _724 * 255.0;
    float _732 = precise::min(_714, _722);
    float _734 = precise::max(_726, _728);
    float _736 = precise::min(_670, _732);
    float _738 = trunc(_730);
    float _740 = precise::max(_738, 0.0);
    uint _742 = uint(_740);
    float _744 = precise::max(_698, _734);
    float _746 = _736 * 255.0;
    float _748 = precise::max(_666, _744);
    float _750 = trunc(_746);
    float _752 = precise::max(_750, 0.0);
    uint _754 = uint(_752);
    float _756 = _748 * 255.0;
    bool _760 = _720 > _742;
    float _762 = trunc(_756);
    float _764 = precise::max(_762, 0.0);
    uint _766 = uint(_764);
    int _769 = int(_742) << 8;
    int _771 = _769 & 65280;
    int _773 = int(_754) << 8;
    int _775 = 255 & int(_720);
    int _777 = _771 | _775;
    int _779 = _773 & 65280;
    int _781 = _771;
    int _783 = _779;
    int _785 = int(_754);
    int _787 = as_type<int>(_386);
    int _789 = as_type<int>(_724);
    if (!_760)
    {
        _781 = 0;
    }
    int _791 = _781;
    bool _793 = _766 > _754;
    int _795 = 255 & int(_766);
    int _797 = _779 | _795;
    int _799 = int(_766);
    int _801 = _791;
    if (!_760)
    {
        _783 = 0;
    }
    int _803 = _783;
    int _805 = _803;
    if (!_760)
    {
        _799 = 0;
    }
    int _807 = _799;
    bool _809 = !_760;
    int _811 = _807;
    if (!_809)
    {
        float _813 = -_724;
        float _815 = _702 + _813;
        float _817 = -_724;
        float _819 = _404 + _817;
        float _821 = -_724;
        float _823 = _416 + _821;
        float _825 = -_724;
        float _827 = _386 + _825;
        float _829 = -_724;
        float _831 = _398 + _829;
        float _833 = 1.0 / _815;
        float _835 = -_724;
        float _837 = _248 + _835;
        float _839 = -_724;
        float _841 = _260 + _839;
        float _843 = -_724;
        float _845 = _266 + _843;
        float _847 = -_724;
        float _849 = _272 + _847;
        float _851 = -_724;
        float _853 = _422 + _851;
        float _855 = -_724;
        float _857 = _428 + _855;
        float _859 = -_724;
        float _861 = _572 + _859;
        float _863 = -_724;
        float _865 = _584 + _863;
        float _867 = -_724;
        float _869 = _590 + _867;
        float _871 = -_724;
        float _873 = _596 + _871;
        float _875 = -_724;
        float _877 = _602 + _875;
        float _879 = -_724;
        float _881 = _608 + _879;
        float _883 = _819 * _833;
        float _885 = _823 * _833;
        float _887 = _827 * _833;
        float _889 = fma(_883, -1.99999904632568359375, 1.99999904632568359375);
        float _891 = _831 * _833;
        float _893 = fma(_883, -7.99999904632568359375, 7.99999904632568359375);
        float _895 = fma(_885, -1.99999904632568359375, 1.99999904632568359375);
        float _897 = fma(_885, -7.99999904632568359375, 7.99999904632568359375);
        float _899 = _837 * _833;
        float _901 = -_883;
        float _903 = _901 + 0.5;
        float _905 = -_885;
        float _907 = _905 + 0.5;
        float _909 = trunc(_889);
        float _911 = precise::max(_909, 0.0);
        uint _913 = uint(_911);
        float _915 = fma(_887, -1.99999904632568359375, 1.99999904632568359375);
        float _917 = fma(_887, -7.99999904632568359375, 7.99999904632568359375);
        float _919 = fma(_891, -1.99999904632568359375, 1.99999904632568359375);
        float _921 = fma(_891, -7.99999904632568359375, 7.99999904632568359375);
        float _923 = _841 * _833;
        float _925 = _845 * _833;
        float _927 = fma(_899, -1.99999904632568359375, 1.99999904632568359375);
        float _929 = trunc(_893);
        float _931 = precise::max(_929, 0.0);
        uint _933 = uint(_931);
        float _935 = fma(_899, -7.99999904632568359375, 7.99999904632568359375);
        float _937 = abs(_903);
        bool _939 = _937 >= 0.375;
        float _941 = _849 * _833;
        float _943 = _865 * _833;
        float _945 = abs(_907);
        bool _947 = _945 >= 0.375;
        float _949 = fma(_923, -1.99999904632568359375, 1.99999904632568359375);
        float _951 = -_887;
        float _953 = _951 + 0.5;
        float _955 = trunc(_895);
        float _957 = precise::max(_955, 0.0);
        uint _959 = uint(_957);
        float _961 = fma(_923, -7.99999904632568359375, 7.99999904632568359375);
        float _963 = -_891;
        float _965 = _963 + 0.5;
        float _967 = -_899;
        float _969 = _967 + 0.5;
        float _971 = fma(_925, -1.99999904632568359375, 1.99999904632568359375);
        float _973 = fma(_925, -7.99999904632568359375, 7.99999904632568359375);
        float _975 = -_923;
        float _977 = _975 + 0.5;
        float _979 = abs(_953);
        bool _981 = _979 >= 0.375;
        float _983 = trunc(_897);
        float _985 = precise::max(_983, 0.0);
        uint _987 = uint(_985);
        float _989 = abs(_965);
        bool _991 = _989 >= 0.375;
        float _993 = fma(_941, -7.99999904632568359375, 7.99999904632568359375);
        float _995 = abs(_969);
        bool _997 = _995 >= 0.375;
        float _999 = fma(_941, -1.99999904632568359375, 1.99999904632568359375);
        float _1001 = -_925;
        float _1003 = _1001 + 0.5;
        float _1005 = abs(_977);
        bool _1007 = _1005 >= 0.375;
        float _1009 = _853 * _833;
        float _1011 = trunc(_915);
        float _1013 = precise::max(_1011, 0.0);
        uint _1015 = uint(_1013);
        float _1017 = _857 * _833;
        float _1019 = -_941;
        float _1021 = _1019 + 0.5;
        int _1023 = int(_913);
        int _1025 = int(_959);
        int _1027 = int(_1015);
        if (!_939)
        {
            int _1029 = int(_933) + 1;
            _1023 = _1029;
        }
        int _1031 = _1023;
        float _1033 = _861 * _833;
        float _1035 = _869 * _833;
        float _1037 = _873 * _833;
        float _1039 = _877 * _833;
        float _1041 = trunc(_917);
        float _1043 = precise::max(_1041, 0.0);
        uint _1045 = uint(_1043);
        float _1047 = abs(_1003);
        bool _1049 = _1047 >= 0.375;
        float _1051 = _881 * _833;
        if (!_947)
        {
            int _1053 = int(_987) + 1;
            _1025 = _1053;
        }
        int _1055 = _1025;
        float _1057 = fma(_1009, -1.99999904632568359375, 1.99999904632568359375);
        float _1059 = fma(_1009, -7.99999904632568359375, 7.99999904632568359375);
        float _1061 = fma(_1017, -1.99999904632568359375, 1.99999904632568359375);
        float _1063 = fma(_1017, -7.99999904632568359375, 7.99999904632568359375);
        float _1065 = trunc(_919);
        float _1067 = precise::max(_1065, 0.0);
        uint _1069 = uint(_1067);
        float _1071 = abs(_1021);
        bool _1073 = _1071 >= 0.375;
        float _1075 = -_1009;
        float _1077 = _1075 + 0.5;
        float _1079 = -_1017;
        float _1081 = _1079 + 0.5;
        float _1083 = fma(_1033, -7.99999904632568359375, 7.99999904632568359375);
        float _1085 = fma(_943, -7.99999904632568359375, 7.99999904632568359375);
        float _1087 = fma(_1035, -7.99999904632568359375, 7.99999904632568359375);
        float _1089 = fma(_1037, -7.99999904632568359375, 7.99999904632568359375);
        float _1091 = trunc(_921);
        float _1093 = precise::max(_1091, 0.0);
        uint _1095 = uint(_1093);
        int _1097 = int(_1069);
        if (!_981)
        {
            int _1099 = int(_1045) + 1;
            _1027 = _1099;
        }
        int _1101 = _1027;
        float _1103 = fma(_1033, -1.99999904632568359375, 1.99999904632568359375);
        float _1105 = abs(_1077);
        bool _1107 = _1105 >= 0.375;
        float _1109 = -_1033;
        float _1111 = _1109 + 0.5;
        int _1113 = _1055 << 3;
        int _1115 = _1101 << 6;
        float _1117 = trunc(_927);
        float _1119 = precise::max(_1117, 0.0);
        uint _1121 = uint(_1119);
        int _1123 = _1031 | _1113;
        float _1125 = trunc(_935);
        float _1127 = precise::max(_1125, 0.0);
        uint _1129 = uint(_1127);
        int _1131 = int(_1121);
        if (!_991)
        {
            int _1133 = int(_1095) + 1;
            _1097 = _1133;
        }
        int _1135 = _1097;
        float _1137 = fma(_943, -1.99999904632568359375, 1.99999904632568359375);
        float _1139 = abs(_1081);
        bool _1141 = _1139 >= 0.375;
        float _1143 = -_943;
        float _1145 = _1143 + 0.5;
        int _1147 = _1135 << 9;
        float _1149 = trunc(_949);
        float _1151 = precise::max(_1149, 0.0);
        uint _1153 = uint(_1151);
        int _1155 = _1123 | _1115;
        int _1157 = _1147 | _1155;
        float _1159 = trunc(_961);
        float _1161 = precise::max(_1159, 0.0);
        uint _1163 = uint(_1161);
        int _1165 = int(_1153);
        if (!_997)
        {
            int _1167 = int(_1129) + 1;
            _1131 = _1167;
        }
        int _1169 = _1131;
        float _1171 = fma(_1035, -1.99999904632568359375, 1.99999904632568359375);
        float _1173 = -_1035;
        float _1175 = _1173 + 0.5;
        float _1177 = abs(_1111);
        bool _1179 = _1177 >= 0.375;
        int _1181 = _1169 << 12;
        float _1183 = trunc(_971);
        float _1185 = precise::max(_1183, 0.0);
        uint _1187 = uint(_1185);
        float _1189 = trunc(_973);
        float _1191 = precise::max(_1189, 0.0);
        uint _1193 = uint(_1191);
        int _1195 = int(_1187);
        if (!_1007)
        {
            int _1197 = int(_1163) + 1;
            _1165 = _1197;
        }
        int _1199 = _1165;
        float _1201 = fma(_1037, -1.99999904632568359375, 1.99999904632568359375);
        float _1203 = -_1037;
        float _1205 = _1203 + 0.5;
        float _1207 = abs(_1145);
        bool _1209 = _1207 >= 0.375;
        int _1211 = _1199 << 15;
        float _1213 = trunc(_999);
        float _1215 = precise::max(_1213, 0.0);
        uint _1217 = uint(_1215);
        int _1219 = _1157 | _1181;
        int _1221 = _1211 | _1219;
        float _1223 = trunc(_993);
        float _1225 = precise::max(_1223, 0.0);
        uint _1227 = uint(_1225);
        int _1229 = int(_1217);
        if (!_1049)
        {
            int _1231 = int(_1193) + 1;
            _1195 = _1231;
        }
        int _1233 = _1195;
        float _1235 = fma(_1039, -1.99999904632568359375, 1.99999904632568359375);
        float _1237 = abs(_1175);
        bool _1239 = _1237 >= 0.375;
        float _1241 = fma(_1039, -7.99999904632568359375, 7.99999904632568359375);
        float _1243 = fma(_1051, -7.99999904632568359375, 7.99999904632568359375);
        float _1245 = -_1039;
        float _1247 = _1245 + 0.5;
        int _1249 = _1233 << 18;
        float _1251 = trunc(_1057);
        float _1253 = precise::max(_1251, 0.0);
        uint _1255 = uint(_1253);
        float _1257 = trunc(_1059);
        float _1259 = precise::max(_1257, 0.0);
        uint _1261 = uint(_1259);
        int _1263 = int(_1255);
        _785 = _1249;
        if (!_1073)
        {
            int _1265 = int(_1227) + 1;
            _1229 = _1265;
        }
        int _1267 = _1229;
        float _1269 = abs(_1205);
        bool _1271 = _1269 >= 0.375;
        float _1273 = fma(_1051, -1.99999904632568359375, 1.99999904632568359375);
        float _1275 = -_1051;
        float _1277 = _1275 + 0.5;
        int _1279 = _1267 << 21;
        float _1281 = trunc(_1061);
        float _1283 = precise::max(_1281, 0.0);
        uint _1285 = uint(_1283);
        int _1287 = _1221 | _1249;
        int _1289 = _1279 | _1287;
        int _1291 = _1289 << 16;
        float _1293 = trunc(_1063);
        float _1295 = precise::max(_1293, 0.0);
        uint _1297 = uint(_1295);
        int _1299 = int(_1285);
        _801 = _1291;
        _787 = _1289;
        if (!_1107)
        {
            int _1301 = int(_1261) + 1;
            _1263 = _1301;
        }
        int _1303 = _1263;
        float _1305 = abs(_1247);
        bool _1307 = _1305 >= 0.375;
        float _1309 = trunc(_1103);
        float _1311 = precise::max(_1309, 0.0);
        uint _1313 = uint(_1311);
        float _1315 = trunc(_1083);
        float _1317 = precise::max(_1315, 0.0);
        uint _1319 = uint(_1317);
        int _1321 = int(_1313);
        if (!_1141)
        {
            int _1323 = int(_1297) + 1;
            _1299 = _1323;
        }
        int _1325 = _1299;
        float _1327 = abs(_1277);
        bool _1329 = _1327 >= 0.375;
        int _1331 = _1325 << 3;
        float _1333 = trunc(_1137);
        float _1335 = precise::max(_1333, 0.0);
        uint _1337 = uint(_1335);
        int _1339 = _1303 | _1331;
        float _1341 = trunc(_1085);
        float _1343 = precise::max(_1341, 0.0);
        uint _1345 = uint(_1343);
        int _1347 = int(_1337);
        if (!_1179)
        {
            int _1349 = int(_1319) + 1;
            _1321 = _1349;
        }
        int _1351 = _1321;
        int _1353 = _1351 << 6;
        float _1355 = trunc(_1171);
        float _1357 = precise::max(_1355, 0.0);
        uint _1359 = uint(_1357);
        float _1361 = trunc(_1087);
        float _1363 = precise::max(_1361, 0.0);
        uint _1365 = uint(_1363);
        int _1367 = int(_1359);
        if (!_1209)
        {
            int _1369 = int(_1345) + 1;
            _1347 = _1369;
        }
        int _1371 = _1347;
        int _1373 = _1371 << 9;
        float _1375 = trunc(_1201);
        float _1377 = precise::max(_1375, 0.0);
        uint _1379 = uint(_1377);
        int _1381 = _1339 | _1353;
        int _1383 = _1373 | _1381;
        float _1385 = trunc(_1089);
        float _1387 = precise::max(_1385, 0.0);
        uint _1389 = uint(_1387);
        int _1391 = int(_1379);
        if (!_1239)
        {
            int _1393 = int(_1365) + 1;
            _1367 = _1393;
        }
        int _1395 = _1367;
        int _1397 = _1395 << 12;
        float _1399 = trunc(_1235);
        float _1401 = precise::max(_1399, 0.0);
        uint _1403 = uint(_1401);
        float _1405 = trunc(_1241);
        float _1407 = precise::max(_1405, 0.0);
        uint _1409 = uint(_1407);
        int _1411 = int(_1403);
        if (!_1271)
        {
            int _1413 = int(_1389) + 1;
            _1391 = _1413;
        }
        int _1415 = _1391;
        int _1417 = _1415 << 15;
        float _1419 = trunc(_1273);
        float _1421 = precise::max(_1419, 0.0);
        uint _1423 = uint(_1421);
        int _1425 = _1383 | _1397;
        int _1427 = _1417 | _1425;
        float _1429 = trunc(_1243);
        float _1431 = precise::max(_1429, 0.0);
        uint _1433 = uint(_1431);
        int _1435 = int(_1423);
        if (!_1307)
        {
            int _1437 = int(_1409) + 1;
            _1411 = _1437;
        }
        int _1439 = _1411;
        int _1441 = _1439 << 18;
        if (!_1329)
        {
            int _1443 = int(_1433) + 1;
            _1435 = _1443;
        }
        int _1445 = _1435;
        int _1447 = _1445 << 21;
        int _1449 = _1427 | _1441;
        int _1451 = _1447 | _1449;
        uint _1453 = uint(int(uint(_1289) >> uint(16)));
        int _1455 = _1451 << 8;
        uint _1457 = uint(int(uint(_1451) >> uint(8)));
        int _1459 = 65280 & _1455;
        int _1461 = int(_1453) | _1459;
        int _1463 = int(_1457) << 16;
        _811 = _1463;
        _805 = _1461;
        _789 = int(_1453);
    }
    int _1465 = _801;
    int _1467 = _811;
    int _1469 = _805;
    int _1471 = _785;
    int _1473 = _787;
    int _1475 = _789;
    int _1477 = _1471;
    int _1479 = _1475;
    int _1481 = _1473;
    if (!_793)
    {
        _1477 = 0;
    }
    int _1483 = _1477;
    int _1485 = _1483;
    if (!_793)
    {
        _1479 = 0;
    }
    int _1487 = _1479;
    int _1489 = _1487;
    if (!_793)
    {
        _1481 = 0;
    }
    int _1491 = _1481;
    bool _1493 = !_793;
    int _1495 = _1491;
    if (!_1493)
    {
        float _1497 = -_736;
        float _1499 = _748 + _1497;
        float _1501 = -_736;
        float _1503 = _406 + _1501;
        float _1505 = -_736;
        float _1507 = _418 + _1505;
        float _1509 = -_736;
        float _1511 = _388 + _1509;
        float _1513 = -_736;
        float _1515 = _430 + _1513;
        float _1517 = 1.0 / _1499;
        float _1519 = -_736;
        float _1521 = _400 + _1519;
        float _1523 = -_736;
        float _1525 = _250 + _1523;
        float _1527 = -_736;
        float _1529 = _262 + _1527;
        float _1531 = -_736;
        float _1533 = _268 + _1531;
        float _1535 = -_736;
        float _1537 = _274 + _1535;
        float _1539 = -_736;
        float _1541 = _424 + _1539;
        float _1543 = -_736;
        float _1545 = _586 + _1543;
        float _1547 = -_736;
        float _1549 = _574 + _1547;
        float _1551 = -_736;
        float _1553 = _604 + _1551;
        float _1555 = -_736;
        float _1557 = _610 + _1555;
        float _1559 = _1503 * _1517;
        float _1561 = _1507 * _1517;
        float _1563 = _1511 * _1517;
        float _1565 = _1515 * _1517;
        float _1567 = -_736;
        float _1569 = _598 + _1567;
        float _1571 = -_1559;
        float _1573 = _1571 + 0.5;
        float _1575 = fma(_1559, -1.99999904632568359375, 1.99999904632568359375);
        float _1577 = fma(_1559, -7.99999904632568359375, 7.99999904632568359375);
        float _1579 = fma(_1561, -1.99999904632568359375, 1.99999904632568359375);
        float _1581 = fma(_1561, -7.99999904632568359375, 7.99999904632568359375);
        float _1583 = fma(_1563, -1.99999904632568359375, 1.99999904632568359375);
        float _1585 = fma(_1563, -7.99999904632568359375, 7.99999904632568359375);
        float _1587 = _1521 * _1517;
        float _1589 = _1525 * _1517;
        float _1591 = _1529 * _1517;
        float _1593 = abs(_1573);
        bool _1595 = _1593 >= 0.375;
        float _1597 = fma(_1587, -1.99999904632568359375, 1.99999904632568359375);
        float _1599 = fma(_1587, -7.99999904632568359375, 7.99999904632568359375);
        float _1601 = fma(_1589, -1.99999904632568359375, 1.99999904632568359375);
        float _1603 = fma(_1589, -7.99999904632568359375, 7.99999904632568359375);
        float _1605 = fma(_1591, -1.99999904632568359375, 1.99999904632568359375);
        float _1607 = fma(_1591, -7.99999904632568359375, 7.99999904632568359375);
        float _1609 = -_1561;
        float _1611 = _1609 + 0.5;
        float _1613 = -_1563;
        float _1615 = _1613 + 0.5;
        float _1617 = trunc(_1575);
        float _1619 = precise::max(_1617, 0.0);
        uint _1621 = uint(_1619);
        float _1623 = _1533 * _1517;
        float _1625 = -_1587;
        float _1627 = _1625 + 0.5;
        float _1629 = -_1589;
        float _1631 = _1629 + 0.5;
        float _1633 = -_1591;
        float _1635 = _1633 + 0.5;
        float _1637 = abs(_1611);
        bool _1639 = _1637 >= 0.375;
        float _1641 = fma(_1623, -1.99999904632568359375, 1.99999904632568359375);
        float _1643 = abs(_1615);
        bool _1645 = _1643 >= 0.375;
        float _1647 = trunc(_1577);
        float _1649 = precise::max(_1647, 0.0);
        uint _1651 = uint(_1649);
        float _1653 = fma(_1623, -7.99999904632568359375, 7.99999904632568359375);
        float _1655 = _1537 * _1517;
        float _1657 = _1541 * _1517;
        float _1659 = _1545 * _1517;
        float _1661 = -_736;
        float _1663 = _592 + _1661;
        float _1665 = abs(_1627);
        bool _1667 = _1665 >= 0.375;
        float _1669 = fma(_1655, -1.99999904632568359375, 1.99999904632568359375);
        float _1671 = trunc(_1579);
        float _1673 = precise::max(_1671, 0.0);
        uint _1675 = uint(_1673);
        float _1677 = abs(_1631);
        bool _1679 = _1677 >= 0.375;
        float _1681 = fma(_1655, -7.99999904632568359375, 7.99999904632568359375);
        float _1683 = abs(_1635);
        bool _1685 = _1683 >= 0.375;
        float _1687 = fma(_1657, -1.99999904632568359375, 1.99999904632568359375);
        float _1689 = fma(_1657, -7.99999904632568359375, 7.99999904632568359375);
        float _1691 = fma(_1565, -1.99999904632568359375, 1.99999904632568359375);
        float _1693 = fma(_1565, -7.99999904632568359375, 7.99999904632568359375);
        float _1695 = trunc(_1581);
        float _1697 = precise::max(_1695, 0.0);
        uint _1699 = uint(_1697);
        float _1701 = _1549 * _1517;
        float _1703 = -_1623;
        float _1705 = _1703 + 0.5;
        float _1707 = _1663 * _1517;
        float _1709 = fma(_1659, -1.99999904632568359375, 1.99999904632568359375);
        float _1711 = fma(_1701, -1.99999904632568359375, 1.99999904632568359375);
        float _1713 = fma(_1701, -7.99999904632568359375, 7.99999904632568359375);
        float _1715 = -_1655;
        float _1717 = _1715 + 0.5;
        float _1719 = trunc(_1583);
        float _1721 = precise::max(_1719, 0.0);
        uint _1723 = uint(_1721);
        float _1725 = -_1657;
        float _1727 = _1725 + 0.5;
        float _1729 = -_1565;
        float _1731 = _1729 + 0.5;
        float _1733 = _1569 * _1517;
        float _1735 = abs(_1705);
        bool _1737 = _1735 >= 0.375;
        float _1739 = fma(_1659, -7.99999904632568359375, 7.99999904632568359375);
        float _1741 = fma(_1707, -1.99999904632568359375, 1.99999904632568359375);
        float _1743 = fma(_1707, -7.99999904632568359375, 7.99999904632568359375);
        float _1745 = trunc(_1585);
        float _1747 = precise::max(_1745, 0.0);
        uint _1749 = uint(_1747);
        int _1751 = int(_1621);
        int _1753 = int(_1675);
        int _1755 = int(_1723);
        if (!_1595)
        {
            int _1757 = int(_1651) + 1;
            _1751 = _1757;
        }
        int _1759 = _1751;
        float _1761 = -_1701;
        float _1763 = _1761 + 0.5;
        if (!_1639)
        {
            int _1765 = int(_1699) + 1;
            _1753 = _1765;
        }
        int _1767 = _1753;
        float _1769 = -_1659;
        float _1771 = _1769 + 0.5;
        float _1773 = -_1707;
        float _1775 = _1773 + 0.5;
        float _1777 = _1553 * _1517;
        float _1779 = _1557 * _1517;
        float _1781 = trunc(_1597);
        float _1783 = precise::max(_1781, 0.0);
        uint _1785 = uint(_1783);
        float _1787 = fma(_1733, -1.99999904632568359375, 1.99999904632568359375);
        float _1789 = abs(_1717);
        bool _1791 = _1789 >= 0.375;
        float _1793 = fma(_1733, -7.99999904632568359375, 7.99999904632568359375);
        float _1795 = abs(_1727);
        bool _1797 = _1795 >= 0.375;
        float _1799 = fma(_1777, -1.99999904632568359375, 1.99999904632568359375);
        float _1801 = -_1733;
        float _1803 = _1801 + 0.5;
        float _1805 = fma(_1779, -1.99999904632568359375, 1.99999904632568359375);
        float _1807 = trunc(_1599);
        float _1809 = precise::max(_1807, 0.0);
        uint _1811 = uint(_1809);
        int _1813 = int(_1785);
        if (!_1645)
        {
            int _1815 = int(_1749) + 1;
            _1755 = _1815;
        }
        int _1817 = _1755;
        float _1819 = abs(_1731);
        bool _1821 = _1819 >= 0.375;
        int _1823 = _1817 << 6;
        float _1825 = trunc(_1601);
        float _1827 = precise::max(_1825, 0.0);
        uint _1829 = uint(_1827);
        float _1831 = trunc(_1603);
        float _1833 = precise::max(_1831, 0.0);
        uint _1835 = uint(_1833);
        int _1837 = int(_1829);
        if (!_1667)
        {
            int _1839 = int(_1811) + 1;
            _1813 = _1839;
        }
        int _1841 = _1813;
        float _1843 = abs(_1763);
        bool _1845 = _1843 >= 0.375;
        int _1847 = _1841 << 9;
        float _1849 = trunc(_1605);
        float _1851 = precise::max(_1849, 0.0);
        uint _1853 = uint(_1851);
        float _1855 = trunc(_1607);
        float _1857 = precise::max(_1855, 0.0);
        uint _1859 = uint(_1857);
        int _1861 = int(_1853);
        if (!_1679)
        {
            int _1863 = int(_1835) + 1;
            _1837 = _1863;
        }
        int _1865 = _1837;
        float _1867 = abs(_1771);
        bool _1869 = _1867 >= 0.375;
        float _1871 = trunc(_1641);
        float _1873 = precise::max(_1871, 0.0);
        uint _1875 = uint(_1873);
        float _1877 = trunc(_1653);
        float _1879 = precise::max(_1877, 0.0);
        uint _1881 = uint(_1879);
        int _1883 = int(_1875);
        if (!_1685)
        {
            int _1885 = int(_1859) + 1;
            _1861 = _1885;
        }
        int _1887 = _1861;
        float _1889 = abs(_1775);
        bool _1891 = _1889 >= 0.375;
        float _1893 = fma(_1779, -7.99999904632568359375, 7.99999904632568359375);
        float _1895 = -_1779;
        float _1897 = _1895 + 0.5;
        int _1899 = _1887 << 15;
        float _1901 = trunc(_1669);
        float _1903 = precise::max(_1901, 0.0);
        uint _1905 = uint(_1903);
        float _1907 = trunc(_1681);
        float _1909 = precise::max(_1907, 0.0);
        uint _1911 = uint(_1909);
        int _1913 = int(_1905);
        if (!_1737)
        {
            int _1915 = int(_1881) + 1;
            _1883 = _1915;
        }
        int _1917 = _1883;
        float _1919 = abs(_1803);
        bool _1921 = _1919 >= 0.375;
        int _1923 = _1917 << 18;
        float _1925 = trunc(_1687);
        float _1927 = precise::max(_1925, 0.0);
        uint _1929 = uint(_1927);
        float _1931 = trunc(_1689);
        float _1933 = precise::max(_1931, 0.0);
        uint _1935 = uint(_1933);
        int _1937 = int(_1929);
        if (!_1791)
        {
            int _1939 = int(_1911) + 1;
            _1913 = _1939;
        }
        int _1941 = _1913;
        int _1943 = _1941 << 21;
        float _1945 = trunc(_1691);
        float _1947 = precise::max(_1945, 0.0);
        uint _1949 = uint(_1947);
        float _1951 = trunc(_1693);
        float _1953 = precise::max(_1951, 0.0);
        uint _1955 = uint(_1953);
        int _1957 = int(_1949);
        if (!_1797)
        {
            int _1959 = int(_1935) + 1;
            _1937 = _1959;
        }
        int _1961 = _1937;
        float _1963 = abs(_1897);
        bool _1965 = _1963 >= 0.375;
        float _1967 = trunc(_1711);
        float _1969 = precise::max(_1967, 0.0);
        uint _1971 = uint(_1969);
        float _1973 = trunc(_1713);
        float _1975 = precise::max(_1973, 0.0);
        uint _1977 = uint(_1975);
        int _1979 = int(_1971);
        if (!_1821)
        {
            int _1981 = int(_1955) + 1;
            _1957 = _1981;
        }
        int _1983 = _1957;
        int _1985 = _1983 << 3;
        float _1987 = trunc(_1709);
        float _1989 = precise::max(_1987, 0.0);
        uint _1991 = uint(_1989);
        int _1993 = _1961 | _1985;
        float _1995 = trunc(_1739);
        float _1997 = precise::max(_1995, 0.0);
        uint _1999 = uint(_1997);
        int _2001 = int(_1991);
        if (!_1845)
        {
            int _2003 = int(_1977) + 1;
            _1979 = _2003;
        }
        int _2005 = _1979;
        float _2007 = trunc(_1787);
        float _2009 = precise::max(_2007, 0.0);
        uint _2011 = uint(_2009);
        float _2013 = trunc(_1741);
        float _2015 = precise::max(_2013, 0.0);
        uint _2017 = uint(_2015);
        float _2019 = fma(_1777, -7.99999904632568359375, 7.99999904632568359375);
        float _2021 = -_1777;
        float _2023 = _2021 + 0.5;
        int _2025 = int(_2017);
        int _2027 = int(_2011);
        if (!_1869)
        {
            int _2029 = int(_1999) + 1;
            _2001 = _2029;
        }
        int _2031 = _2001;
        int _2033 = _1767 << 3;
        float _2035 = abs(_2023);
        bool _2037 = _2035 >= 0.375;
        float _2039 = trunc(_1743);
        float _2041 = precise::max(_2039, 0.0);
        uint _2043 = uint(_2041);
        int _2045 = _2005 << 6;
        int _2047 = _2031 << 9;
        int _2049 = _1759 | _2033;
        int _2051 = _1993 | _2045;
        int _2053 = _2047 | _2051;
        float _2055 = trunc(_1793);
        float _2057 = precise::max(_2055, 0.0);
        uint _2059 = uint(_2057);
        int _2061 = _2049 | _1823;
        int _2063 = _1847 | _2061;
        int _2065 = _1865 << 12;
        int _2067 = _2063 | _2065;
        int _2069 = _1899 | _2067;
        float _2071 = trunc(_1799);
        float _2073 = precise::max(_2071, 0.0);
        uint _2075 = uint(_2073);
        int _2077 = int(_2075);
        if (!_1891)
        {
            int _2079 = int(_2043) + 1;
            _2025 = _2079;
        }
        int _2081 = _2025;
        int _2083 = _2069 | _1923;
        int _2085 = _1943 | _2083;
        int _2087 = _2081 << 12;
        uint _2089 = uint(int(uint(_2085) >> uint(16)));
        float _2091 = trunc(_2019);
        float _2093 = precise::max(_2091, 0.0);
        uint _2095 = uint(_2093);
        if (!_1921)
        {
            int _2097 = int(_2059) + 1;
            _2027 = _2097;
        }
        int _2099 = _2027;
        int _2101 = _2085 << 16;
        int _2103 = _2099 << 15;
        float _2105 = trunc(_1805);
        float _2107 = precise::max(_2105, 0.0);
        uint _2109 = uint(_2107);
        int _2111 = _2053 | _2087;
        int _2113 = _2103 | _2111;
        float _2115 = trunc(_1893);
        float _2117 = precise::max(_2115, 0.0);
        uint _2119 = uint(_2117);
        int _2121 = int(_2109);
        _1485 = _2101;
        if (!_2037)
        {
            int _2123 = int(_2095) + 1;
            _2077 = _2123;
        }
        int _2125 = _2077;
        int _2127 = _2125 << 18;
        if (!_1965)
        {
            int _2129 = int(_2119) + 1;
            _2121 = _2129;
        }
        int _2131 = _2121;
        int _2133 = _2131 << 21;
        int _2135 = _2113 | _2127;
        int _2137 = _2133 | _2135;
        int _2139 = _2137 << 8;
        uint _2141 = uint(int(uint(_2137) >> uint(8)));
        int _2143 = 65280 & _2139;
        int _2145 = int(_2089) | _2143;
        int _2147 = int(_2141) << 16;
        _1495 = _2147;
        _1489 = _2145;
    }
    int _2149 = _1485;
    int _2151 = _1495;
    int _2153 = _1489;
    int _2155 = _1465 | _777;
    int _2157 = _1467 | _1469;
    int _2159 = _2149 | _797;
    int _2161 = _2151 | _2153;
    out.m_36.x = as_type<float>(_2155);
    out.m_36.y = as_type<float>(_2157);
    out.m_36.z = as_type<float>(_2159);
    out.m_36.w = as_type<float>(_2161);
    return main0_out_u{as_type<uint4>(out.m_36)};
}

