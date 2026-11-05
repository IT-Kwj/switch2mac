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
    constant _16* fp_c10 [[id(0)]];
    constant _16* fp_c8 [[id(1)]];
    constant _16* fp_c7 [[id(2)]];
    constant _16* fp_c9 [[id(3)]];
    constant _16* fp_c15 [[id(4)]];
    texture2d<float> fp_t_tcb_10 [[id(5)]];
    sampler fp_t_tcb_10Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_8 [[id(7)]];
    sampler fp_t_tcb_8Smplr [[id(8)]];
    texture2d<float> fp_t_tcb_A [[id(9)]];
    sampler fp_t_tcb_ASmplr [[id(10)]];
    texture2d<float> fp_t_tcb_C [[id(11)]];
    sampler fp_t_tcb_CSmplr [[id(12)]];
    texturecube<float> fp_t_tcb_1E [[id(13)]];
    sampler fp_t_tcb_1ESmplr [[id(14)]];
    sampler fp_t_tcb_10Smplr_w [[id(15)]];
    sampler fp_t_tcb_8Smplr_w [[id(16)]];
    sampler fp_t_tcb_ASmplr_w [[id(17)]];
    sampler fp_t_tcb_CSmplr_w [[id(18)]];
    sampler fp_t_tcb_1ESmplr_w [[id(19)]];
    constant dm_border_t* dm_border [[id(20)]];
};

struct main0_out
{
    float4 m_63 [[color(0)]];
};

struct main0_in
{
    float4 m_54 [[user(locn0)]];
    float4 m_56 [[user(locn1)]];
    float4 m_58 [[user(locn2)]];
    float4 m_69 [[user(locn3)]];
    float4 m_65 [[user(locn4), flat]];
    float4 m_50 [[user(locn5)]];
    float4 m_48 [[user(locn6)]];
    float4 m_52 [[user(locn7)]];
    float4 m_60 [[user(locn8)]];
    float4 m_71 [[user(locn9)]];
    float4 m_67 [[user(locn10)]];
    float4 m_73 [[user(locn11)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _80 = gl_FragCoord.w;
    float _82 = in.m_48.w;
    float _84 = gl_FragCoord.w;
    float _86 = _82 * _84;
    float _88 = in.m_48.x;
    float _90 = gl_FragCoord.w;
    float _92 = _88 * _90;
    float _94 = in.m_48.y;
    float _96 = gl_FragCoord.w;
    float _98 = _94 * _96;
    float _100 = in.m_50.x;
    float _102 = gl_FragCoord.w;
    float _104 = _100 * _102;
    float _106 = in.m_50.z;
    float _108 = gl_FragCoord.w;
    float _110 = _106 * _108;
    float _112 = in.m_50.y;
    float _114 = gl_FragCoord.w;
    float _116 = _112 * _114;
    float _118 = in.m_50.w;
    float _120 = gl_FragCoord.w;
    float _122 = _118 * _120;
    float _124 = in.m_52.y;
    float _126 = gl_FragCoord.w;
    float _128 = _124 * _126;
    float _130 = in.m_52.x;
    float _132 = gl_FragCoord.w;
    float _134 = _130 * _132;
    float _136 = 1.0 / _80;
    float _138 = _136 * _86;
    float _140 = _136 * _92;
    float _142 = _136 * _98;
    float _144 = _136 * _104;
    float _146 = 1.0 / _138;
    float _148 = _136 * _110;
    float _150 = _136 * _116;
    float _152 = _136 * _128;
    float _154 = _140 * _146;
    float _156 = _142 * _146;
    float _158 = _136 * _122;
    float _160 = _136 * _134;
    float2 _699 = float2(_154, _156);
    float _162 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_699, float2(0.0), isnan(_699))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_699, float2(0.0), isnan(_699))).x;
    float2 _710 = float2(_144, _150);
    float _164 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_710, float2(0.0), isnan(_710))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_710, float2(0.0), isnan(_710))).w;
    float2 _718 = float2(_148, _158);
    float _166 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_718, float2(0.0), isnan(_718))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_718, float2(0.0), isnan(_718))).w;
    float2 _726 = float2(_160, _152);
    float _168 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_726, float2(0.0), isnan(_726))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_726, float2(0.0), isnan(_726))).w;
    float _170 = in.m_48.z;
    float _172 = gl_FragCoord.w;
    float _174 = _170 * _172;
    float _176 = in.m_54.w;
    float _178 = gl_FragCoord.w;
    float _180 = _176 * _178;
    float _182 = in.m_56.w;
    float _184 = gl_FragCoord.w;
    float _186 = _182 * _184;
    float _188 = in.m_58.x;
    float _190 = gl_FragCoord.w;
    float _192 = _188 * _190;
    float _194 = (*spvDescriptorSet0.fp_c10)._m0[3].x + (-1.0);
    float _196 = _136 * _174;
    float _198 = _196 * _146;
    float _200 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _202 = fma(_198, (*spvDescriptorSet0.fp_c8)._m0[30].w, _200);
    float _204 = 1.0 / _202;
    float _206 = in.m_60.z;
    float _208 = gl_FragCoord.w;
    float _210 = _206 * _208;
    float _212 = in.m_56.y;
    float _214 = gl_FragCoord.w;
    float _216 = _212 * _214;
    float _218 = in.m_56.z;
    float _220 = gl_FragCoord.w;
    float _222 = _218 * _220;
    float _224 = in.m_54.y;
    float _226 = gl_FragCoord.w;
    float _228 = _224 * _226;
    float _230 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _232 = fma(_162, (*spvDescriptorSet0.fp_c8)._m0[30].w, _230);
    float _234 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _236 = _204 * _234;
    float _238 = precise::max(_164, _166);
    float _240 = 1.0 / _232;
    float _242 = -_168;
    float _244 = _238 + _242;
    float _246 = -(*spvDescriptorSet0.fp_c7)._m0[0].x;
    float _248 = _244 + _246;
    float _250 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _252 = _248 + _194;
    float _254 = precise::clamp(_252, 0.0, 1.0);
    float _256 = _136 * _180;
    float _258 = -_256;
    float _260 = _258 + _254;
    float _262 = _136 * _186;
    float _264 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _266 = -_236;
    float _268 = fma(_240, _264, _266);
    float _270 = _136 * _192;
    float _272 = _262 * _260;
    float _274 = precise::clamp(_272, 0.0, 1.0);
    float _276 = _268 * _250;
    float _278 = precise::clamp(_276, 0.0, 1.0);
    float _280 = _274 * _278;
    float _282 = _280 * _270;
    bool _286 = _282 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _288 = isnan(_282);
    bool _290 = _286 || _288;
    bool _292 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _294 = _290 || _292;
    float _296 = in.m_60.y;
    float _298 = gl_FragCoord.w;
    float _300 = _296 * _298;
    float _302 = in.m_60.x;
    float _304 = gl_FragCoord.w;
    float _306 = _302 * _304;
    float _308 = _236;
    if (!_294)
    {
        discard_fragment();
    }
    float _310 = in.m_56.x;
    float _312 = gl_FragCoord.w;
    float _314 = _310 * _312;
    float _316 = in.m_54.x;
    float _318 = gl_FragCoord.w;
    float _320 = _316 * _318;
    float _322 = _166 * 0.5;
    float _324 = precise::max(_164, _322);
    float _326 = _136 * _216;
    float _328 = _324 * _324;
    float _330 = _136 * _222;
    float _332 = _136 * _300;
    float _334 = _136 * _306;
    float _336 = _136 * _210;
    float _338 = _332 * _332;
    float _340 = in.m_54.z;
    float _342 = gl_FragCoord.w;
    float _344 = _340 * _342;
    float _346 = fma(_334, _334, _338);
    float _348 = -_328;
    float _350 = _348 + 1.0;
    float _352 = fma(_336, _336, _346);
    float _354 = _330 * _350;
    float _356 = _136 * _314;
    float _358 = rsqrt(_352);
    float _360 = _356 * _350;
    float _362 = _332 * _358;
    float _364 = _334 * _358;
    float _366 = _336 * _358;
    float _368 = _326 * _350;
    float _370 = _362 * _362;
    float _372 = _136 * _320;
    float _374 = _136 * _228;
    float _376 = _136 * _344;
    float _378 = fma(_364, _364, _370);
    float _380 = fma(_328, _372, _360);
    float _382 = fma(_328, _374, _368);
    float _384 = fma(_328, _376, _354);
    float _386 = fma(_366, _366, _378);
    if (!_294)
    {
        out.m_63.x = _380;
        out.m_63.y = _382;
        out.m_63.z = _384;
        out.m_63.w = _274;
        return out;
    }
    float _388 = in.m_65.x;
    float _390 = rsqrt(_386);
    float _392 = in.m_67.x;
    float _394 = gl_FragCoord.w;
    float _396 = _392 * _394;
    float _398 = abs(_364);
    float _400 = abs(_362);
    float _402 = precise::max(_398, _400);
    float _404 = abs(_366);
    float _406 = precise::max(_404, _402);
    float _408 = 1.0 / _406;
    float _410 = _362 * _390;
    float _412 = fma(_410, 0.5, 0.5);
    float _414 = -_412;
    float _416 = fma(_414, _412, 1.0);
    float _418 = -_328;
    float _420 = _418 + _416;
    float _422 = -_408;
    float _424 = _366 * _422;
    float _426 = _364 * _408;
    float _428 = -_388;
    float _430 = fma(_428, _388, 1.0);
    float _432 = _362 * _408;
    float _434 = _136 * _396;
    float _436 = _420 * _430;
    float _438 = precise::clamp(_436, 0.0, 1.0);
    float _440 = _438 + _434;
    float _442 = precise::min(_440, 1.0);
    float3 _1124 = float3(_426, _432, _424);
    float3 _446 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1124, float3(0.0), isnan(_1124)), level(_442)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1124, float3(0.0), isnan(_1124)), level(_442)).xyz;
    float _448 = _446.x;
    float _450 = _446.y;
    float _452 = _446.z;
    float _454 = in.m_69.x;
    float _456 = gl_FragCoord.w;
    float _458 = _454 * _456;
    float _460 = in.m_69.z;
    float _462 = gl_FragCoord.w;
    float _464 = _460 * _462;
    float _466 = in.m_69.y;
    float _468 = gl_FragCoord.w;
    float _470 = _466 * _468;
    float _472 = in.m_71.z;
    float _474 = gl_FragCoord.w;
    float _476 = _472 * _474;
    float _478 = in.m_71.x;
    float _480 = gl_FragCoord.w;
    float _482 = _478 * _480;
    float _484 = in.m_71.y;
    float _486 = gl_FragCoord.w;
    float _488 = _484 * _486;
    float _490 = in.m_73.x;
    float _492 = gl_FragCoord.w;
    float _494 = _490 * _492;
    float _496 = in.m_73.y;
    float _498 = gl_FragCoord.w;
    float _500 = _496 * _498;
    float _502 = in.m_73.z;
    float _504 = gl_FragCoord.w;
    float _506 = _502 * _504;
    float _508 = in.m_73.w;
    float _510 = gl_FragCoord.w;
    float _512 = _508 * _510;
    bool _514 = 0.5 <= (*spvDescriptorSet0.fp_c15)._m0[653].w;
    if (_514)
    {
        float _516 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _518 = _236 + _516;
        _308 = _518;
    }
    float _520 = _308;
    float _522 = _520;
    if (_514)
    {
        float _524 = _520 * 8.0;
        float _526 = precise::clamp(_524, 0.0, 1.0);
        _522 = _526;
    }
    float _528 = _522;
    float _530 = _136 * _458;
    float _532 = _136 * _464;
    float _534 = _136 * _476;
    float _536 = _136 * _482;
    float _538 = _136 * _500;
    float _540 = _136 * _506;
    float _542 = fma(_448, 0.20999999344348907470703125, _530);
    float _544 = _136 * _470;
    float _546 = fma(_452, 0.20999999344348907470703125, _532);
    float _548 = _136 * _488;
    float _550 = _542 + _536;
    float _552 = fma(_450, 0.20999999344348907470703125, _544);
    float _554 = _546 + _534;
    float _556 = 0.0 + _282;
    float _558 = precise::clamp(_556, 0.0, 1.0);
    float _560 = _136 * _494;
    float _562 = _552 + _548;
    float _564 = _136 * _512;
    float _566 = _380 * _550;
    float _568 = _384 * _554;
    float _570 = _382 * _562;
    float _572 = _558;
    if (_514)
    {
        float _574 = _558 * _528;
        _572 = _574;
    }
    float _576 = _572;
    float _578 = fma(_566, _564, _560);
    float _580 = fma(_568, _564, _540);
    float _582 = fma(_570, _564, _538);
    float _584 = 0.0 + _576;
    float _586 = precise::clamp(_584, 0.0, 1.0);
    out.m_63.x = _578;
    out.m_63.y = _582;
    out.m_63.z = _580;
    out.m_63.w = _586;
    return out;
}

