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
    texture2d<float> fp_t_tcb_10 [[id(3)]];
    sampler fp_t_tcb_10Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    sampler fp_t_tcb_10Smplr_w [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_56 [[color(0)]];
};

struct main0_in
{
    float4 m_51 [[user(locn0)]];
    float4 m_49 [[user(locn1)]];
    float4 m_53 [[user(locn2)]];
    float4 m_39 [[user(locn3), flat]];
    float4 m_41 [[user(locn4)]];
    float4 m_47 [[user(locn5)]];
    float4 m_43 [[user(locn6)]];
    float4 m_45 [[user(locn7), flat]];
    float4 m_35 [[user(locn8)]];
    float4 m_37 [[user(locn9)]];
    float4 m_58 [[user(locn10)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _65 = gl_FragCoord.w;
    float _67 = in.m_35.y;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = in.m_35.x;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = in.m_35.z;
    float _81 = gl_FragCoord.w;
    float _83 = _79 * _81;
    float _85 = in.m_37.y;
    float _87 = gl_FragCoord.w;
    float _89 = _85 * _87;
    float _91 = in.m_37.x;
    float _93 = gl_FragCoord.w;
    float _95 = _91 * _93;
    float _97 = in.m_37.z;
    float _99 = gl_FragCoord.w;
    float _101 = _97 * _99;
    float _103 = in.m_39.y;
    float _105 = in.m_41.w;
    float _107 = gl_FragCoord.w;
    float _109 = _105 * _107;
    float _111 = in.m_43.w;
    float _113 = gl_FragCoord.w;
    float _115 = _111 * _113;
    float _117 = 1.0 / _65;
    float _119 = _117 * _71;
    float _121 = _117 * _77;
    float _123 = _117 * _83;
    float _125 = _117 * _89;
    float _127 = _119 * _119;
    float _129 = in.m_39.x;
    float _131 = -(*spvDescriptorSet0.fp_c8)._m0[29].y;
    float _133 = _125 + _131;
    float _135 = fma(_121, _121, _127);
    float _137 = _117 * _95;
    float _139 = _133 * _133;
    float _141 = fma(_123, _123, _135);
    float _143 = -(*spvDescriptorSet0.fp_c8)._m0[29].x;
    float _145 = _137 + _143;
    float _147 = _117 * _101;
    float _149 = fma(_145, _145, _139);
    float _151 = rsqrt(_141);
    float _153 = -(*spvDescriptorSet0.fp_c8)._m0[29].z;
    float _155 = _147 + _153;
    float _157 = fma(_155, _155, _149);
    float _159 = rsqrt(_157);
    float _161 = _119 * _151;
    float _163 = _123 * _151;
    float _165 = _121 * _151;
    float _167 = in.m_45.x;
    float _169 = _161 * _161;
    float _171 = in.m_43.x;
    float _173 = gl_FragCoord.w;
    float _175 = _171 * _173;
    float _177 = in.m_41.x;
    float _179 = gl_FragCoord.w;
    float _181 = _177 * _179;
    float _183 = fma(_165, _165, _169);
    float _185 = _133 * _159;
    float _187 = _145 * _159;
    float _189 = _155 * _159;
    float _191 = fma(_163, _163, _183);
    float _193 = fma(_103, 2.0, -1.0);
    float _195 = _117 * _109;
    float _197 = rsqrt(_191);
    bool _201 = _193 > 0.0;
    float _203 = fma(_195, 2.0, -1.0);
    bool _205 = _193 >= 0.0;
    bool _207 = isnan(_193);
    bool _209 = _205 || _207;
    bool _211 = isnan(0.0);
    bool _213 = _209 || _211;
    float _215 = _195 + _129;
    float _217 = _117 * _115;
    float _219 = in.m_43.y;
    float _221 = gl_FragCoord.w;
    float _223 = _219 * _221;
    int _226 = _213 ? 0 : 1;
    float _228 = _215 * 20.0;
    float _230 = in.m_41.y;
    float _232 = gl_FragCoord.w;
    float _234 = _230 * _232;
    int _236 = ~_226;
    int _238 = _236 + 1;
    int _240 = _238 + 1;
    float _242 = _228 * 0.15915493667125701904296875;
    int _244 = _240;
    if (!_201)
    {
        int _246 = ~_226;
        int _248 = _246 + 1;
        _244 = _248;
    }
    int _250 = _244;
    float _252 = _161 * _197;
    float _254 = _167 * _203;
    float _256 = _242 * 6.283185482025146484375;
    float _258 = sin(_256);
    float _260 = _117 * _175;
    float _262 = _185 * _252;
    float _264 = _165 * _197;
    float _266 = _163 * _197;
    float _268 = float(_250);
    float _270 = _117 * _181;
    float _272 = fma(_187, _264, _262);
    float _274 = 1.0 / _217;
    float _276 = _254 * _268;
    float _278 = fma(_189, _266, _272);
    float _280 = abs(_278);
    float _282 = -_280;
    float _284 = _282 + 1.0;
    float _286 = _258 * 0.100000001490116119384765625;
    float _288 = _117 * _223;
    float _290 = fma(_284, _286, _276);
    float _292 = _260 * _274;
    float _294 = _288 * _274;
    float _296 = _117 * _234;
    float _298 = _270 + _290;
    float2 _988 = float2(_292, _294);
    float _300 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_988, float2(0.0), isnan(_988))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_988, float2(0.0), isnan(_988))).x;
    float2 _998 = float2(_298, _296);
    float _302 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_998, float2(0.0), isnan(_998))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_998, float2(0.0), isnan(_998))).w;
    float _304 = in.m_43.z;
    float _306 = gl_FragCoord.w;
    float _308 = _304 * _306;
    float _310 = in.m_45.y;
    float _312 = in.m_47.w;
    float _314 = gl_FragCoord.w;
    float _316 = _312 * _314;
    float _318 = in.m_49.w;
    float _320 = gl_FragCoord.w;
    float _322 = _318 * _320;
    float _324 = _117 * _308;
    float _326 = _310 + 0.20000000298023223876953125;
    float _328 = _324 * _274;
    float _330 = abs(_278);
    float _332 = precise::max(_326, _330);
    float _334 = abs(_278);
    float _336 = _334 + 0.100000001490116119384765625;
    float _338 = precise::clamp(_336, 0.0, 1.0);
    float _340 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _342 = fma(_328, (*spvDescriptorSet0.fp_c8)._m0[30].w, _340);
    float _344 = precise::min(_332, 1.2999999523162841796875);
    float _346 = 1.0 / _342;
    float _348 = -_326;
    float _350 = _348 + _344;
    float _352 = precise::max(_310, _284);
    float _354 = precise::max(_284, 0.60000002384185791015625);
    float _356 = precise::min(_352, 0.75);
    float _358 = precise::min(_354, 0.800000011920928955078125);
    float _360 = -_310;
    float _362 = _360 + _356;
    float _364 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _366 = _346 * _364;
    float _368 = in.m_49.x;
    float _370 = gl_FragCoord.w;
    float _372 = _368 * _370;
    float _374 = in.m_49.y;
    float _376 = gl_FragCoord.w;
    float _378 = _374 * _376;
    float _380 = in.m_49.z;
    float _382 = gl_FragCoord.w;
    float _384 = _380 * _382;
    float _386 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _388 = fma(_300, (*spvDescriptorSet0.fp_c8)._m0[30].w, _386);
    float _390 = -_310;
    float _392 = spvFAdd(_390, 0.75);
    float _394 = -_310;
    float _396 = spvFAdd(_394, 1.099999904632568359375);
    float _398 = 1.0 / _388;
    float _400 = 1.0 / _392;
    float _402 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _404 = -_366;
    float _406 = fma(_398, _402, _404);
    float _408 = precise::clamp(_406, 0.0, 1.0);
    float _410 = precise::max(_302, 0.0500000007450580596923828125);
    float _412 = 1.0 / _396;
    float _414 = fma(_408, -0.4000000059604644775390625, 0.4000000059604644775390625);
    float _416 = in.m_51.w;
    float _418 = gl_FragCoord.w;
    float _420 = _416 * _418;
    float _422 = precise::min(_410, 0.20000000298023223876953125);
    float _424 = fma(_362, _400, _414);
    float _426 = _414 + _302;
    float _428 = fma(_358, 5.000000476837158203125, -3.000000476837158203125);
    float _430 = _117 * _316;
    float _432 = fma(_422, 6.666666507720947265625, -0.3333333432674407958984375);
    float _434 = -_428;
    float _436 = fma(_434, _432, 1.0);
    float _438 = fma(_350, _412, _424);
    float _440 = fma(_338, -0.85000002384185791015625, 1.0);
    float _442 = in.m_53.x;
    float _444 = gl_FragCoord.w;
    float _446 = _442 * _444;
    float _448 = _117 * _322;
    float _450 = _438 * _438;
    float _452 = _450 * _436;
    float _454 = fma(_452, 0.20000000298023223876953125, _426);
    float _456 = _430 * _430;
    float _458 = _454 * _456;
    float _460 = _458 * _440;
    float _462 = -_448;
    float _464 = _462 + 1.0;
    float _466 = _117 * _420;
    float _468 = -_448;
    float _470 = _468 + 1.019999980926513671875;
    float _472 = precise::max(_464, _460);
    float _474 = precise::max(_466, _450);
    float _476 = precise::min(_470, _472);
    float _478 = _456 * _474;
    float _480 = precise::clamp(_478, 0.0, 1.0);
    float _482 = -_464;
    float _484 = _482 + _476;
    float _486 = _436 * _480;
    float _488 = _484 * 50.000049591064453125;
    float _490 = _486 * _488;
    float _492 = _117 * _446;
    float _494 = 0.0 + _490;
    float _496 = precise::clamp(_494, 0.0, 1.0);
    float _498 = _496 * _492;
    bool _500 = _498 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _502 = isnan(_498);
    bool _504 = _500 || _502;
    bool _506 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _508 = _504 || _506;
    float _510 = in.m_51.x;
    float _512 = gl_FragCoord.w;
    float _514 = _510 * _512;
    float _516 = in.m_51.y;
    float _518 = gl_FragCoord.w;
    float _520 = _516 * _518;
    float _522 = in.m_51.z;
    float _524 = gl_FragCoord.w;
    float _526 = _522 * _524;
    float _528 = _366;
    if (!_508)
    {
        discard_fragment();
    }
    float _530 = -_448;
    float _532 = _530 + 0.959999978542327880859375;
    float _534 = -_448;
    float _536 = _534 + 1.03999996185302734375;
    float _538 = _450 * 4.0;
    float _540 = _117 * _384;
    float _542 = precise::max(_532, _460);
    float _544 = precise::min(_536, _542);
    float _546 = -_532;
    float _548 = _546 + _544;
    float _550 = _117 * _514;
    float _552 = _117 * _372;
    float _554 = _117 * _526;
    float _556 = fma(_548, -12.50000286102294921875, 1.0);
    float _558 = _117 * _520;
    float _560 = _117 * _378;
    float _562 = fma(_552, _538, _550);
    float _564 = _556 * 2.0;
    float _566 = fma(_540, _538, _554);
    float _568 = fma(_560, _538, _558);
    float _570 = fma(_552, _564, _562);
    float _572 = fma(_560, _564, _568);
    float _574 = fma(_540, _564, _566);
    float _576 = _456 * _570;
    float _578 = _456 * _572;
    float _580 = _456 * _574;
    if (!_508)
    {
        out.m_56.x = _576;
        out.m_56.y = _578;
        out.m_56.z = _580;
        out.m_56.w = _490;
        return out;
    }
    float _582 = _578 * 0.715200006961822509765625;
    float _584 = in.m_58.w;
    float _586 = gl_FragCoord.w;
    float _588 = _584 * _586;
    float _590 = in.m_58.x;
    float _592 = gl_FragCoord.w;
    float _594 = _590 * _592;
    float _596 = in.m_58.y;
    float _598 = gl_FragCoord.w;
    float _600 = _596 * _598;
    float _602 = fma(_576, 0.2125999927520751953125, _582);
    float _604 = in.m_58.z;
    float _606 = gl_FragCoord.w;
    float _608 = _604 * _606;
    float _610 = fma(_580, 0.072200000286102294921875, _602);
    bool _612 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _614 = 1.0 / _610;
    if (_612)
    {
        float _616 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _618 = _366 + _616;
        _528 = _618;
    }
    float _620 = _528;
    float _622 = _614 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _624 = precise::clamp(_622, 0.0, 1.0);
    float _626 = fma(_624, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _628 = _117 * _588;
    float _630 = _626 * _628;
    float _632 = 0.0 + _498;
    float _634 = precise::clamp(_632, 0.0, 1.0);
    float _636 = _628;
    float _638 = _634;
    if (_612)
    {
        float _640 = _620 * 8.0;
        float _642 = precise::clamp(_640, 0.0, 1.0);
        _636 = _642;
    }
    float _644 = _636;
    float _646 = _117 * _594;
    float _648 = _117 * _600;
    float _650 = _117 * _608;
    if (_612)
    {
        float _652 = _634 * _644;
        _638 = _652;
    }
    float _654 = _638;
    float _656 = fma(_576, _630, _646);
    float _658 = fma(_578, _630, _648);
    float _660 = fma(_580, _630, _650);
    float _662 = 0.0 + _654;
    float _664 = precise::clamp(_662, 0.0, 1.0);
    out.m_56.x = _656;
    out.m_56.y = _658;
    out.m_56.z = _660;
    out.m_56.w = _664;
    return out;
}

