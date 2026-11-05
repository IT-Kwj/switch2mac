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
    constant _16* fp_c9 [[id(0)]];
    constant _16* fp_c10 [[id(1)]];
    constant _16* fp_c15 [[id(2)]];
    constant _16* fp_c8 [[id(3)]];
    texture2d<float> fp_t_tcb_8 [[id(4)]];
    sampler fp_t_tcb_8Smplr [[id(5)]];
    texture2d<float> fp_t_tcb_A [[id(6)]];
    sampler fp_t_tcb_ASmplr [[id(7)]];
    texture2d<float> fp_t_tcb_C [[id(8)]];
    sampler fp_t_tcb_CSmplr [[id(9)]];
    texturecube<float> fp_t_tcb_1E [[id(10)]];
    sampler fp_t_tcb_1ESmplr [[id(11)]];
    sampler fp_t_tcb_8Smplr_w [[id(12)]];
    sampler fp_t_tcb_ASmplr_w [[id(13)]];
    sampler fp_t_tcb_CSmplr_w [[id(14)]];
    sampler fp_t_tcb_1ESmplr_w [[id(15)]];
    constant dm_border_t* dm_border [[id(16)]];
};

struct main0_out
{
    float4 m_57 [[color(0)]];
};

struct main0_in
{
    float4 m_48 [[user(locn0)]];
    float4 m_50 [[user(locn1)]];
    float4 m_44 [[user(locn2)]];
    float4 m_69 [[user(locn3)]];
    float4 m_63 [[user(locn4)]];
    float4 m_52 [[user(locn5)]];
    float4 m_54 [[user(locn6)]];
    float4 m_46 [[user(locn7)]];
    float4 m_59 [[user(locn8)]];
    float4 m_65 [[user(locn9)]];
    float4 m_61 [[user(locn10)]];
    float4 m_67 [[user(locn11)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _76 = gl_FragCoord.w;
    float _78 = in.m_44.x;
    float _80 = gl_FragCoord.w;
    float _82 = _78 * _80;
    float _84 = in.m_44.y;
    float _86 = gl_FragCoord.w;
    float _88 = _84 * _86;
    float _90 = in.m_44.w;
    float _92 = gl_FragCoord.w;
    float _94 = _90 * _92;
    float _96 = in.m_44.z;
    float _98 = gl_FragCoord.w;
    float _100 = _96 * _98;
    float _102 = in.m_46.x;
    float _104 = gl_FragCoord.w;
    float _106 = _102 * _104;
    float _108 = in.m_46.y;
    float _110 = gl_FragCoord.w;
    float _112 = _108 * _110;
    float _114 = 1.0 / _76;
    float _116 = _114 * _82;
    float _118 = _114 * _88;
    float _120 = _114 * _94;
    float _122 = _114 * _100;
    float _124 = _114 * _106;
    float _126 = _114 * _112;
    float2 _751 = float2(_116, _118);
    float _128 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_751, float2(0.0), isnan(_751))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_751, float2(0.0), isnan(_751))).w;
    float2 _762 = float2(_122, _120);
    float _130 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_762, float2(0.0), isnan(_762))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_762, float2(0.0), isnan(_762))).w;
    float2 _770 = float2(_124, _126);
    float _132 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_770, float2(0.0), isnan(_770))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_770, float2(0.0), isnan(_770))).w;
    float _134 = in.m_48.w;
    float _136 = gl_FragCoord.w;
    float _138 = _134 * _136;
    float _140 = in.m_50.w;
    float _142 = gl_FragCoord.w;
    float _144 = _140 * _142;
    float _146 = in.m_52.x;
    float _148 = gl_FragCoord.w;
    float _150 = _146 * _148;
    float _152 = _114 * _144;
    float _154 = in.m_50.y;
    float _156 = gl_FragCoord.w;
    float _158 = _154 * _156;
    float _160 = in.m_48.y;
    float _162 = gl_FragCoord.w;
    float _164 = _160 * _162;
    float _166 = in.m_50.x;
    float _168 = gl_FragCoord.w;
    float _170 = _166 * _168;
    float _172 = in.m_48.x;
    float _174 = gl_FragCoord.w;
    float _176 = _172 * _174;
    float _178 = _114 * _164;
    float _180 = _128 + _130;
    float _182 = fma(_132, (*spvDescriptorSet0.fp_c9)._m0[194].w, _180);
    float _184 = precise::clamp(_182, 0.0, 1.0);
    float _186 = _114 * _138;
    float _188 = (*spvDescriptorSet0.fp_c10)._m0[13].z * (*spvDescriptorSet0.fp_c10)._m0[13].z;
    float _190 = -_186;
    float _192 = _184 + _190;
    float _194 = _188 * _188;
    float _196 = _152 * _192;
    float _198 = _114 * _150;
    float _200 = _196 * _194;
    float _202 = precise::clamp(_200, 0.0, 1.0);
    float _204 = _202 * _198;
    bool _208 = _204 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _210 = isnan(_204);
    bool _212 = _208 || _210;
    bool _214 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _216 = _212 || _214;
    float _218 = in.m_54.y;
    float _220 = gl_FragCoord.w;
    float _222 = _218 * _220;
    if (!_216)
    {
        discard_fragment();
    }
    float _224 = in.m_50.z;
    float _226 = gl_FragCoord.w;
    float _228 = _224 * _226;
    float _230 = in.m_48.z;
    float _232 = gl_FragCoord.w;
    float _234 = _230 * _232;
    float _236 = _114 * _222;
    float _238 = precise::max(_236, 0.5);
    float _240 = precise::min(_238, 1.0);
    float _242 = fma(_240, 2.0, -1.0);
    float _244 = _114 * _228;
    float _246 = _242 * _242;
    float _248 = _114 * _234;
    float _250 = _246 * _246;
    float _252 = _114 * _158;
    float _254 = _184 + _250;
    float _256 = _250 * 3.0;
    float _258 = _114 * _176;
    float _260 = -_254;
    float _262 = _260 + 1.0;
    float _264 = _252 * _262;
    float _266 = _244 * _262;
    float _268 = _114 * _170;
    float _270 = fma(_254, _178, _264);
    float _272 = fma(_254, _248, _266);
    float _274 = _268 * _262;
    float _276 = fma(_270, _256, _270);
    float _278 = fma(_272, _256, _272);
    float _280 = fma(_254, _258, _274);
    float _282 = -_278;
    float _284 = _276 + _282;
    bool _286 = _276 >= _278;
    bool _288 = isnan(_276);
    bool _290 = _286 || _288;
    bool _292 = isnan(_278);
    bool _294 = _290 || _292;
    float _296 = float(_294);
    float _298 = fma(_280, _256, _280);
    float _300 = fma(_296, _284, _278);
    float _302 = -_276;
    float _304 = _302 + _278;
    float _306 = -_298;
    float _308 = _306 + _300;
    bool _310 = _298 >= _300;
    bool _312 = isnan(_298);
    bool _314 = _310 || _312;
    bool _316 = isnan(_300);
    bool _318 = _314 || _316;
    float _320 = float(_318);
    float _322 = fma(_296, _304, _276);
    float _324 = fma(_320, _308, _298);
    float _326 = -_300;
    float _328 = _298 + _326;
    float _330 = precise::min(_322, _324);
    float _332 = fma(_320, _328, _300);
    float _334 = -_322;
    float _336 = _334 + _324;
    float _338 = -_330;
    float _340 = _332 + _338;
    float _342 = fma(_340, 6.0, 1.0000000133514319600180897396058e-10);
    float _344 = _296 + (-1.0);
    float _346 = -_296;
    float _348 = _346 + 0.666666686534881591796875;
    float _350 = 1.0 / _342;
    float _352 = -_348;
    float _354 = _344 + _352;
    float _356 = fma(_320, _354, _348);
    float _358 = precise::max(0.0, (*spvDescriptorSet0.fp_c10)._m0[2].x);
    float _360 = precise::min(_358, 20.0);
    float _362 = fma(_336, _350, _356);
    float _364 = abs(_362);
    float _366 = fma(_360, 0.0500000007450580596923828125, _364);
    float _368 = spvFAdd(_332, 1.0000000133514319600180897396058e-10);
    float _370 = _366 + 0.666666686534881591796875;
    float _372 = _366 + 0.3333333432674407958984375;
    float _374 = floor(_366);
    float _376 = fma(_366, 6.0, 4.0);
    float _378 = fma(_366, 6.0, 2.0);
    float _380 = floor(_370);
    float _382 = floor(_372);
    float _384 = -_374;
    float _386 = _366 + _384;
    float _388 = fma(_386, 6.0, -3.0);
    float _390 = 1.0 / _368;
    float _392 = fma(_380, -6.0, _376);
    float _394 = abs(_388);
    float _396 = _394 + (-1.0);
    float _398 = precise::clamp(_396, 0.0, 1.0);
    float _400 = _392 + (-3.0);
    float _402 = _398 + (-1.0);
    float _404 = fma(_382, -6.0, _378);
    float _406 = abs(_400);
    float _408 = _406 + (-1.0);
    float _410 = precise::clamp(_408, 0.0, 1.0);
    float _412 = _404 + (-3.0);
    float _414 = _410 + (-1.0);
    float _416 = abs(_412);
    float _418 = _416 + (-1.0);
    float _420 = precise::clamp(_418, 0.0, 1.0);
    float _422 = _340 * _390;
    float _424 = _420 + (-1.0);
    float _426 = fma(_422, _402, 1.0);
    float _428 = fma(_422, _414, 1.0);
    float _430 = fma(_422, _424, 1.0);
    float _432 = _332 * _426;
    float _434 = _332 * _428;
    float _436 = _332 * _430;
    if (!_216)
    {
        out.m_57.x = _432;
        out.m_57.y = _434;
        out.m_57.z = _436;
        out.m_57.w = _202;
        return out;
    }
    float _438 = in.m_59.y;
    float _440 = gl_FragCoord.w;
    float _442 = _438 * _440;
    float _444 = in.m_59.x;
    float _446 = gl_FragCoord.w;
    float _448 = _444 * _446;
    float _450 = in.m_59.z;
    float _452 = gl_FragCoord.w;
    float _454 = _450 * _452;
    float _456 = _114 * _442;
    float _458 = _114 * _448;
    float _460 = _114 * _454;
    float _462 = _456 * _456;
    float _464 = in.m_61.x;
    float _466 = gl_FragCoord.w;
    float _468 = _464 * _466;
    float _470 = fma(_458, _458, _462);
    float _472 = fma(_460, _460, _470);
    float _474 = rsqrt(_472);
    float _476 = _458 * _474;
    float _478 = _456 * _474;
    float _480 = _460 * _474;
    float _482 = _114 * _468;
    float _484 = abs(_476);
    float _486 = abs(_478);
    float _488 = precise::max(_484, _486);
    float _490 = abs(_480);
    float _492 = precise::max(_490, _488);
    float _494 = 1.0 / _492;
    float _496 = _478 * _494;
    float _498 = -_494;
    float _500 = _480 * _498;
    float _502 = precise::min(_482, 1.0);
    float _504 = _476 * _494;
    float3 _1298 = float3(_504, _496, _500);
    float3 _508 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1298, float3(0.0), isnan(_1298)), level(_502)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1298, float3(0.0), isnan(_1298)), level(_502)).xyz;
    float _510 = _508.x;
    float _512 = _508.y;
    float _514 = _508.z;
    float _516 = in.m_63.y;
    float _518 = gl_FragCoord.w;
    float _520 = _516 * _518;
    float _522 = in.m_63.z;
    float _524 = gl_FragCoord.w;
    float _526 = _522 * _524;
    float _528 = in.m_63.x;
    float _530 = gl_FragCoord.w;
    float _532 = _528 * _530;
    float _534 = in.m_65.y;
    float _536 = gl_FragCoord.w;
    float _538 = _534 * _536;
    float _540 = in.m_65.z;
    float _542 = gl_FragCoord.w;
    float _544 = _540 * _542;
    float _546 = in.m_65.x;
    float _548 = gl_FragCoord.w;
    float _550 = _546 * _548;
    float _552 = in.m_67.x;
    float _554 = gl_FragCoord.w;
    float _556 = _552 * _554;
    float _558 = in.m_67.w;
    float _560 = gl_FragCoord.w;
    float _562 = _558 * _560;
    float _564 = in.m_67.y;
    float _566 = gl_FragCoord.w;
    float _568 = _564 * _566;
    float _570 = in.m_67.z;
    float _572 = gl_FragCoord.w;
    float _574 = _570 * _572;
    float _576 = _114 * _520;
    float _578 = _114 * _526;
    float _580 = _114 * _532;
    bool _582 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _584 = fma(_512, 0.20999999344348907470703125, _576);
    float _586 = fma(_514, 0.20999999344348907470703125, _578);
    float _588 = fma(_510, 0.20999999344348907470703125, _580);
    float _590 = _114 * _538;
    float _592 = _114 * _544;
    float _594 = _114 * _550;
    float _596 = _584 + _590;
    float _598 = _586 + _592;
    float _600 = _588 + _594;
    float _602 = _114 * _562;
    float _604 = _434 * _596;
    float _606 = _436 * _598;
    float _608 = _432 * _600;
    float _610 = 0.0 + _204;
    float _612 = precise::clamp(_610, 0.0, 1.0);
    float _614 = _114 * _556;
    float _616 = _114 * _568;
    float _618 = _114 * _574;
    float _620 = fma(_608, _602, _614);
    float _622 = fma(_604, _602, _616);
    float _624 = fma(_606, _602, _618);
    float _626 = _614;
    if (!_582)
    {
        _626 = _612;
    }
    float _628 = _626;
    bool _630 = !_582;
    float _632 = _628;
    if (!_630)
    {
        float _634 = in.m_69.w;
        float _636 = gl_FragCoord.w;
        float _638 = _634 * _636;
        float _640 = in.m_69.z;
        float _642 = gl_FragCoord.w;
        float _644 = _640 * _642;
        float _646 = _114 * _638;
        float _648 = _114 * _644;
        float _650 = 1.0 / _646;
        float _652 = _648 * _650;
        float _654 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _656 = fma(_652, (*spvDescriptorSet0.fp_c8)._m0[30].w, _654);
        float _658 = 1.0 / _656;
        float _660 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _662 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _664 = fma(_658, _660, _662);
        float _666 = _664 * 8.0;
        float _668 = precise::clamp(_666, 0.0, 1.0);
        float _670 = _612 * _668;
        _632 = _670;
    }
    float _672 = _632;
    float _674 = 0.0 + _672;
    float _676 = precise::clamp(_674, 0.0, 1.0);
    out.m_57.x = _620;
    out.m_57.y = _622;
    out.m_57.z = _624;
    out.m_57.w = _676;
    return out;
}

