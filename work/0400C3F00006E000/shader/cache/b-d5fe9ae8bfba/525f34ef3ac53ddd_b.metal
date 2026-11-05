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
    constant _16* fp_c10 [[id(1)]];
    constant _16* fp_c8 [[id(2)]];
    constant _16* fp_c15 [[id(3)]];
    texture2d<float> fp_t_tcb_A [[id(4)]];
    sampler fp_t_tcb_ASmplr [[id(5)]];
    texture2d<float> fp_t_tcb_8 [[id(6)]];
    sampler fp_t_tcb_8Smplr [[id(7)]];
    texturecube<float> fp_t_tcb_1E [[id(8)]];
    sampler fp_t_tcb_1ESmplr [[id(9)]];
    sampler fp_t_tcb_ASmplr_w [[id(10)]];
    sampler fp_t_tcb_8Smplr_w [[id(11)]];
    sampler fp_t_tcb_1ESmplr_w [[id(12)]];
    constant dm_border_t* dm_border [[id(13)]];
};

struct main0_out
{
    float4 m_61 [[color(0)]];
};

struct main0_in
{
    float4 m_50 [[user(locn0)]];
    float4 m_58 [[user(locn1)]];
    float4 m_63 [[user(locn2)]];
    float4 m_42 [[user(locn3)]];
    float4 m_52 [[user(locn4)]];
    float4 m_69 [[user(locn5)]];
    float4 m_54 [[user(locn6)]];
    float4 m_44 [[user(locn7)]];
    float4 m_46 [[user(locn8)]];
    float4 m_48 [[user(locn9)]];
    float4 m_65 [[user(locn10)]];
    float4 m_56 [[user(locn11)]];
    float4 m_67 [[user(locn12)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _76 = gl_FragCoord.w;
    float _78 = in.m_42.y;
    float _80 = gl_FragCoord.w;
    float _82 = _78 * _80;
    float _84 = in.m_42.z;
    float _86 = gl_FragCoord.w;
    float _88 = _84 * _86;
    float _90 = in.m_42.x;
    float _92 = gl_FragCoord.w;
    float _94 = _90 * _92;
    float _96 = in.m_44.x;
    float _98 = gl_FragCoord.w;
    float _100 = _96 * _98;
    float _102 = in.m_44.y;
    float _104 = gl_FragCoord.w;
    float _106 = _102 * _104;
    float _108 = (*spvDescriptorSet0.fp_c10)._m0[2].x * 0.0166666693985462188720703125;
    float _110 = 1.0 / _76;
    float _112 = _110 * _82;
    float _114 = _110 * _88;
    float _116 = _110 * _94;
    float _118 = -_108;
    float _120 = fma(_118, (*spvDescriptorSet0.fp_c9)._m0[194].z, _112);
    float _122 = -_108;
    float _124 = fma(_122, (*spvDescriptorSet0.fp_c9)._m0[194].z, _114);
    float _126 = _116 * (*spvDescriptorSet0.fp_c9)._m0[194].w;
    float _128 = _110 * _100;
    float _130 = _120 * (*spvDescriptorSet0.fp_c9)._m0[194].w;
    float _132 = _124 * (*spvDescriptorSet0.fp_c9)._m0[194].w;
    float _134 = _110 * _106;
    float2 _704 = float2(_126, _132);
    float _136 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_704, float2(0.0), isnan(_704))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_704, float2(0.0), isnan(_704))).w;
    float2 _715 = float2(_132, _130);
    float _138 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_715, float2(0.0), isnan(_715))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_715, float2(0.0), isnan(_715))).w;
    float2 _723 = float2(_128, _134);
    float _140 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_723, float2(0.0), isnan(_723))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_723, float2(0.0), isnan(_723))).w;
    float _142 = in.m_46.y;
    float _144 = gl_FragCoord.w;
    float _146 = _142 * _144;
    float _148 = in.m_46.x;
    float _150 = gl_FragCoord.w;
    float _152 = _148 * _150;
    float _154 = in.m_46.z;
    float _156 = gl_FragCoord.w;
    float _158 = _154 * _156;
    float _160 = in.m_48.y;
    float _162 = gl_FragCoord.w;
    float _164 = _160 * _162;
    float _166 = in.m_48.x;
    float _168 = gl_FragCoord.w;
    float _170 = _166 * _168;
    float _172 = in.m_48.z;
    float _174 = gl_FragCoord.w;
    float _176 = _172 * _174;
    float _178 = _110 * _146;
    float _180 = _110 * _152;
    float _182 = _110 * _158;
    float _184 = _178 * _178;
    float _186 = fma(_180, _180, _184);
    float _188 = fma(_182, _182, _186);
    float _190 = _110 * _164;
    float _192 = _110 * _170;
    float _194 = in.m_50.w;
    float _196 = gl_FragCoord.w;
    float _198 = _194 * _196;
    float _200 = -(*spvDescriptorSet0.fp_c8)._m0[29].y;
    float _202 = _190 + _200;
    float _204 = rsqrt(_188);
    float _206 = _110 * _176;
    float _208 = -(*spvDescriptorSet0.fp_c8)._m0[29].x;
    float _210 = _192 + _208;
    float _212 = _202 * _202;
    float _214 = in.m_52.x;
    float _216 = gl_FragCoord.w;
    float _218 = _214 * _216;
    float _220 = -(*spvDescriptorSet0.fp_c8)._m0[29].z;
    float _222 = _206 + _220;
    float _224 = fma(_210, _210, _212);
    float _226 = _178 * _204;
    float _228 = _180 * _204;
    float _230 = fma(_222, _222, _224);
    float _232 = _182 * _204;
    float _234 = _226 * _226;
    float _236 = fma(_228, _228, _234);
    float _238 = rsqrt(_230);
    float _240 = fma(_232, _232, _236);
    float _242 = rsqrt(_240);
    float _244 = _202 * _238;
    float _246 = _210 * _238;
    float _248 = _222 * _238;
    float _250 = _226 * _242;
    float _252 = _232 * _242;
    float _254 = _244 * _250;
    float _256 = _228 * _242;
    float _258 = in.m_54.x;
    float _260 = gl_FragCoord.w;
    float _262 = _258 * _260;
    float _264 = fma(_246, _256, _254);
    float _266 = _110 * _218;
    float _268 = fma(_248, _252, _264);
    float _270 = -_268;
    float _272 = 0.0 + _270;
    float _274 = precise::clamp(_272, 0.0, 1.0);
    float _276 = _274 * _274;
    float _278 = -_136;
    float _280 = _278 + _138;
    float _282 = _140 * _140;
    float _284 = _110 * _262;
    float _286 = fma(_266, _280, _136);
    float _288 = _282 * _276;
    float _290 = _110 * _198;
    float _292 = _288 * _286;
    float _294 = _290 * _292;
    float _296 = precise::clamp(_294, 0.0, 1.0);
    float _298 = _296 * _284;
    bool _302 = _298 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _304 = isnan(_298);
    bool _306 = _302 || _304;
    bool _308 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _310 = _306 || _308;
    float _312 = abs(_228);
    float _314 = abs(_226);
    float _316 = precise::max(_312, _314);
    float _318 = abs(_232);
    float _320 = precise::max(_318, _316);
    if (!_310)
    {
        discard_fragment();
    }
    float _322 = 1.0 / _320;
    float _324 = _228 * _322;
    float _326 = _226 * _322;
    float _328 = in.m_56.x;
    float _330 = gl_FragCoord.w;
    float _332 = _328 * _330;
    float _334 = -_322;
    float _336 = _232 * _334;
    float _338 = _110 * _332;
    float _340 = precise::min(_338, 1.0);
    float3 _1010 = float3(_324, _326, _336);
    float3 _344 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1010, float3(0.0), isnan(_1010)), level(_340)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1010, float3(0.0), isnan(_1010)), level(_340)).xyz;
    float _346 = _344.x;
    float _348 = _344.y;
    float _350 = _344.z;
    float _352 = in.m_58.x;
    float _354 = gl_FragCoord.w;
    float _356 = _352 * _354;
    float _358 = in.m_50.x;
    float _360 = gl_FragCoord.w;
    float _362 = _358 * _360;
    float _364 = in.m_58.y;
    float _366 = gl_FragCoord.w;
    float _368 = _364 * _366;
    float _370 = in.m_50.y;
    float _372 = gl_FragCoord.w;
    float _374 = _370 * _372;
    float _376 = in.m_58.z;
    float _378 = gl_FragCoord.w;
    float _380 = _376 * _378;
    float _382 = in.m_50.z;
    float _384 = gl_FragCoord.w;
    float _386 = _382 * _384;
    float _388 = _110 * _356;
    float _390 = _110 * _362;
    float _392 = _110 * _368;
    float _394 = _110 * _374;
    float _396 = _110 * _380;
    float _398 = _110 * _386;
    float _400 = -_388;
    float _402 = _400 + _390;
    float _404 = -_392;
    float _406 = _404 + _394;
    float _408 = -_396;
    float _410 = _408 + _398;
    float _412 = fma(_282, _402, _388);
    float _414 = fma(_282, _406, _392);
    float _416 = fma(_282, _410, _396);
    if (!_310)
    {
        out.m_61.x = _412;
        out.m_61.y = _414;
        out.m_61.z = _416;
        out.m_61.w = _296;
        return out;
    }
    float _418 = in.m_63.y;
    float _420 = gl_FragCoord.w;
    float _422 = _418 * _420;
    float _424 = _282 * (*spvDescriptorSet0.fp_c9)._m0[193].z;
    float _426 = in.m_63.x;
    float _428 = gl_FragCoord.w;
    float _430 = _426 * _428;
    float _432 = in.m_63.z;
    float _434 = gl_FragCoord.w;
    float _436 = _432 * _434;
    float _438 = in.m_65.z;
    float _440 = gl_FragCoord.w;
    float _442 = _438 * _440;
    float _444 = _424 * (*spvDescriptorSet0.fp_c9)._m0[194].x;
    float _446 = _424 * (*spvDescriptorSet0.fp_c9)._m0[193].w;
    float _448 = _424 * (*spvDescriptorSet0.fp_c9)._m0[194].y;
    float _450 = in.m_65.x;
    float _452 = gl_FragCoord.w;
    float _454 = _450 * _452;
    float _456 = _444 * 0.715200006961822509765625;
    float _458 = in.m_65.y;
    float _460 = gl_FragCoord.w;
    float _462 = _458 * _460;
    float _464 = in.m_67.w;
    float _466 = gl_FragCoord.w;
    float _468 = _464 * _466;
    float _470 = in.m_67.x;
    float _472 = gl_FragCoord.w;
    float _474 = _470 * _472;
    float _476 = fma(_446, 0.2125999927520751953125, _456);
    float _478 = in.m_67.y;
    float _480 = gl_FragCoord.w;
    float _482 = _478 * _480;
    float _484 = 0.0 + _298;
    float _486 = precise::clamp(_484, 0.0, 1.0);
    float _488 = fma(_448, 0.072200000286102294921875, _476);
    float _490 = in.m_67.z;
    float _492 = gl_FragCoord.w;
    float _494 = _490 * _492;
    float _496 = 1.0 / _488;
    float _498 = _496 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _500 = precise::clamp(_498, 0.0, 1.0);
    float _502 = fma(_500, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _504 = _110 * _422;
    float _506 = _110 * _430;
    float _508 = _110 * _436;
    float _510 = _446 * _502;
    float _512 = _444 * _502;
    float _514 = _448 * _502;
    float _516 = fma(_350, 0.20999999344348907470703125, _508);
    float _518 = fma(_346, 0.20999999344348907470703125, _506);
    float _520 = _110 * _442;
    bool _522 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _524 = fma(_348, 0.20999999344348907470703125, _504);
    float _526 = _110 * _454;
    float _528 = _110 * _462;
    float _530 = _516 + _520;
    float _532 = _110 * _468;
    float _534 = _518 + _526;
    float _536 = _524 + _528;
    float _538 = fma(_416, _530, _514);
    float _540 = _110 * _494;
    float _542 = fma(_412, _534, _510);
    float _544 = fma(_414, _536, _512);
    float _546 = _110 * _474;
    float _548 = _110 * _482;
    float _550 = fma(_538, _532, _540);
    float _552 = _540;
    if (!_522)
    {
        _552 = _486;
    }
    float _554 = _552;
    float _556 = fma(_542, _532, _546);
    float _558 = fma(_544, _532, _548);
    bool _560 = !_522;
    float _562 = _554;
    if (!_560)
    {
        float _564 = in.m_69.w;
        float _566 = gl_FragCoord.w;
        float _568 = _564 * _566;
        float _570 = in.m_69.z;
        float _572 = gl_FragCoord.w;
        float _574 = _570 * _572;
        float _576 = _110 * _568;
        float _578 = _110 * _574;
        float _580 = 1.0 / _576;
        float _582 = _578 * _580;
        float _584 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _586 = fma(_582, (*spvDescriptorSet0.fp_c8)._m0[30].w, _584);
        float _588 = 1.0 / _586;
        float _590 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _592 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _594 = fma(_588, _590, _592);
        float _596 = _594 * 8.0;
        float _598 = precise::clamp(_596, 0.0, 1.0);
        float _600 = _486 * _598;
        _562 = _600;
    }
    float _602 = _562;
    float _604 = 0.0 + _602;
    float _606 = precise::clamp(_604, 0.0, 1.0);
    out.m_61.x = _556;
    out.m_61.y = _558;
    out.m_61.z = _550;
    out.m_61.w = _606;
    return out;
}

