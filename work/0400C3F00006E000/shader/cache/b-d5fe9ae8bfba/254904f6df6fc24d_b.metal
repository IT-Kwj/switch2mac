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
    constant _16* fp_c7 [[id(0)]];
    constant _16* fp_c8 [[id(1)]];
    constant _16* fp_c9 [[id(2)]];
    constant _16* fp_c10 [[id(3)]];
    constant _16* fp_c15 [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_A [[id(7)]];
    sampler fp_t_tcb_ASmplr [[id(8)]];
    texture2d<float> fp_t_tcb_C [[id(9)]];
    sampler fp_t_tcb_CSmplr [[id(10)]];
    texture2d<float> fp_t_tcb_10 [[id(11)]];
    sampler fp_t_tcb_10Smplr [[id(12)]];
    texturecube<float> fp_t_tcb_1E [[id(13)]];
    sampler fp_t_tcb_1ESmplr [[id(14)]];
    sampler fp_t_tcb_8Smplr_w [[id(15)]];
    sampler fp_t_tcb_ASmplr_w [[id(16)]];
    sampler fp_t_tcb_CSmplr_w [[id(17)]];
    sampler fp_t_tcb_10Smplr_w [[id(18)]];
    sampler fp_t_tcb_1ESmplr_w [[id(19)]];
    constant dm_border_t* dm_border [[id(20)]];
};

struct main0_out
{
    float4 m_65 [[color(0)]];
};

struct main0_in
{
    float4 m_56 [[user(locn0)]];
    float4 m_58 [[user(locn1)]];
    float4 m_60 [[user(locn2)]];
    float4 m_71 [[user(locn3)]];
    float4 m_67 [[user(locn4), flat]];
    float4 m_50 [[user(locn5)]];
    float4 m_48 [[user(locn6)]];
    float4 m_52 [[user(locn7)]];
    float4 m_62 [[user(locn8)]];
    float4 m_54 [[user(locn9)]];
    float4 m_73 [[user(locn10)]];
    float4 m_69 [[user(locn11)]];
    float4 m_75 [[user(locn12)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _82 = gl_FragCoord.w;
    float _84 = in.m_48.w;
    float _86 = gl_FragCoord.w;
    float _88 = _84 * _86;
    float _90 = in.m_50.x;
    float _92 = gl_FragCoord.w;
    float _94 = _90 * _92;
    float _96 = in.m_50.z;
    float _98 = gl_FragCoord.w;
    float _100 = _96 * _98;
    float _102 = in.m_50.y;
    float _104 = gl_FragCoord.w;
    float _106 = _102 * _104;
    float _108 = in.m_50.w;
    float _110 = gl_FragCoord.w;
    float _112 = _108 * _110;
    float _114 = in.m_48.x;
    float _116 = gl_FragCoord.w;
    float _118 = _114 * _116;
    float _120 = in.m_48.y;
    float _122 = gl_FragCoord.w;
    float _124 = _120 * _122;
    float _126 = in.m_52.y;
    float _128 = gl_FragCoord.w;
    float _130 = _126 * _128;
    float _132 = in.m_52.x;
    float _134 = gl_FragCoord.w;
    float _136 = _132 * _134;
    float _138 = 1.0 / _82;
    float _140 = _138 * _88;
    float _142 = _138 * _94;
    float _144 = _138 * _100;
    float _146 = _138 * _106;
    float _148 = 1.0 / _140;
    float _150 = _138 * _112;
    float _152 = _138 * _118;
    float _154 = _138 * _124;
    float _156 = _138 * _130;
    float2 _718 = float2(_142, _146);
    float _158 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_718, float2(0.0), isnan(_718))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_718, float2(0.0), isnan(_718))).w;
    float2 _729 = float2(_144, _150);
    float _160 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_729, float2(0.0), isnan(_729))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_729, float2(0.0), isnan(_729))).w;
    float _162 = _138 * _136;
    float2 _740 = float2(_162, _156);
    float _164 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_740, float2(0.0), isnan(_740))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_740, float2(0.0), isnan(_740))).w;
    float _166 = _152 * _148;
    float _168 = _154 * _148;
    float2 _754 = float2(_166, _168);
    float _170 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_754, float2(0.0), isnan(_754))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_754, float2(0.0), isnan(_754))).x;
    float _172 = in.m_48.z;
    float _174 = gl_FragCoord.w;
    float _176 = _172 * _174;
    float _178 = in.m_54.x;
    float _180 = gl_FragCoord.w;
    float _182 = _178 * _180;
    float _184 = (*spvDescriptorSet0.fp_c7)._m0[2].y * (*spvDescriptorSet0.fp_c7)._m0[2].y;
    float _186 = in.m_56.w;
    float _188 = gl_FragCoord.w;
    float _190 = _186 * _188;
    float _192 = fma((*spvDescriptorSet0.fp_c7)._m0[2].x, (*spvDescriptorSet0.fp_c7)._m0[2].x, _184);
    float _194 = in.m_58.w;
    float _196 = gl_FragCoord.w;
    float _198 = _194 * _196;
    float _200 = fma((*spvDescriptorSet0.fp_c7)._m0[2].z, (*spvDescriptorSet0.fp_c7)._m0[2].z, _192);
    float _202 = sqrt(_200);
    float _204 = _138 * _176;
    float _206 = precise::max(_202, 0.20000000298023223876953125);
    float _208 = _204 * _148;
    float _210 = in.m_60.x;
    float _212 = gl_FragCoord.w;
    float _214 = _210 * _212;
    float _216 = precise::min(_206, 0.5);
    float _218 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _220 = fma(_208, (*spvDescriptorSet0.fp_c8)._m0[30].w, _218);
    float _222 = fma(_216, 3.3333332538604736328125, -1.6666667461395263671875);
    float _224 = 1.0 / _220;
    float _226 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _228 = _224 * _226;
    float _230 = in.m_62.z;
    float _232 = gl_FragCoord.w;
    float _234 = _230 * _232;
    float _236 = in.m_58.y;
    float _238 = gl_FragCoord.w;
    float _240 = _236 * _238;
    float _242 = in.m_58.z;
    float _244 = gl_FragCoord.w;
    float _246 = _242 * _244;
    float _248 = in.m_56.y;
    float _250 = gl_FragCoord.w;
    float _252 = _248 * _250;
    float _254 = precise::max(_158, _160);
    float _256 = -_164;
    float _258 = _254 + _256;
    float _260 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _262 = _258 + _222;
    float _264 = (-1.0) + (*spvDescriptorSet0.fp_c10)._m0[3].x;
    float _266 = _138 * _182;
    float _268 = _262 + _264;
    float _270 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _272 = fma(_170, (*spvDescriptorSet0.fp_c8)._m0[30].w, _270);
    float _274 = _266 + (-1.0);
    float _276 = _268 + _274;
    float _278 = precise::clamp(_276, 0.0, 1.0);
    float _280 = 1.0 / _272;
    float _282 = _138 * _190;
    float _284 = -_282;
    float _286 = _284 + _278;
    float _288 = _138 * _198;
    float _290 = _288 * _286;
    float _292 = 0.0 + _290;
    float _294 = precise::clamp(_292, 0.0, 1.0);
    float _296 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _298 = -_228;
    float _300 = fma(_280, _296, _298);
    float _302 = _138 * _214;
    float _304 = _300 * _260;
    float _306 = precise::clamp(_304, 0.0, 1.0);
    float _308 = _294 * _306;
    float _310 = _308 * _302;
    bool _314 = _310 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _316 = isnan(_310);
    bool _318 = _314 || _316;
    bool _320 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _322 = _318 || _320;
    float _324 = in.m_62.y;
    float _326 = gl_FragCoord.w;
    float _328 = _324 * _326;
    float _330 = in.m_62.x;
    float _332 = gl_FragCoord.w;
    float _334 = _330 * _332;
    float _336 = _228;
    if (!_322)
    {
        discard_fragment();
    }
    float _338 = in.m_58.x;
    float _340 = gl_FragCoord.w;
    float _342 = _338 * _340;
    float _344 = in.m_56.x;
    float _346 = gl_FragCoord.w;
    float _348 = _344 * _346;
    float _350 = _160 * 0.5;
    float _352 = precise::max(_158, _350);
    float _354 = _138 * _240;
    float _356 = _352 * _352;
    float _358 = _138 * _246;
    float _360 = _138 * _328;
    float _362 = _138 * _334;
    float _364 = _138 * _234;
    float _366 = _360 * _360;
    float _368 = in.m_56.z;
    float _370 = gl_FragCoord.w;
    float _372 = _368 * _370;
    float _374 = fma(_362, _362, _366);
    float _376 = -_356;
    float _378 = _376 + 1.0;
    float _380 = fma(_364, _364, _374);
    float _382 = _358 * _378;
    float _384 = _138 * _342;
    float _386 = rsqrt(_380);
    float _388 = _384 * _378;
    float _390 = _360 * _386;
    float _392 = _362 * _386;
    float _394 = _364 * _386;
    float _396 = _354 * _378;
    float _398 = _390 * _390;
    float _400 = _138 * _348;
    float _402 = _138 * _252;
    float _404 = _138 * _372;
    float _406 = fma(_392, _392, _398);
    float _408 = fma(_356, _400, _388);
    float _410 = fma(_356, _402, _396);
    float _412 = fma(_356, _404, _382);
    float _414 = fma(_394, _394, _406);
    if (!_322)
    {
        out.m_65.x = _408;
        out.m_65.y = _410;
        out.m_65.z = _412;
        out.m_65.w = _290;
        return out;
    }
    float _416 = in.m_67.x;
    float _418 = rsqrt(_414);
    float _420 = in.m_69.x;
    float _422 = gl_FragCoord.w;
    float _424 = _420 * _422;
    float _426 = abs(_392);
    float _428 = abs(_390);
    float _430 = precise::max(_426, _428);
    float _432 = abs(_394);
    float _434 = precise::max(_432, _430);
    float _436 = 1.0 / _434;
    float _438 = _390 * _418;
    float _440 = fma(_438, 0.5, 0.5);
    float _442 = -_440;
    float _444 = fma(_442, _440, 1.0);
    float _446 = -_356;
    float _448 = _446 + _444;
    float _450 = -_436;
    float _452 = _394 * _450;
    float _454 = _392 * _436;
    float _456 = -_416;
    float _458 = fma(_456, _416, 1.0);
    float _460 = _390 * _436;
    float _462 = _138 * _424;
    float _464 = _448 * _458;
    float _466 = precise::clamp(_464, 0.0, 1.0);
    float _468 = _466 + _462;
    float _470 = precise::min(_468, 1.0);
    float3 _1194 = float3(_454, _460, _452);
    float3 _474 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1194, float3(0.0), isnan(_1194)), level(_470)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1194, float3(0.0), isnan(_1194)), level(_470)).xyz;
    float _476 = _474.x;
    float _478 = _474.y;
    float _480 = _474.z;
    float _482 = in.m_71.x;
    float _484 = gl_FragCoord.w;
    float _486 = _482 * _484;
    float _488 = in.m_71.z;
    float _490 = gl_FragCoord.w;
    float _492 = _488 * _490;
    float _494 = in.m_71.y;
    float _496 = gl_FragCoord.w;
    float _498 = _494 * _496;
    float _500 = in.m_73.z;
    float _502 = gl_FragCoord.w;
    float _504 = _500 * _502;
    float _506 = in.m_73.x;
    float _508 = gl_FragCoord.w;
    float _510 = _506 * _508;
    float _512 = in.m_73.y;
    float _514 = gl_FragCoord.w;
    float _516 = _512 * _514;
    float _518 = in.m_75.x;
    float _520 = gl_FragCoord.w;
    float _522 = _518 * _520;
    float _524 = in.m_75.y;
    float _526 = gl_FragCoord.w;
    float _528 = _524 * _526;
    float _530 = in.m_75.z;
    float _532 = gl_FragCoord.w;
    float _534 = _530 * _532;
    float _536 = in.m_75.w;
    float _538 = gl_FragCoord.w;
    float _540 = _536 * _538;
    bool _542 = 0.5 <= (*spvDescriptorSet0.fp_c15)._m0[653].w;
    if (_542)
    {
        float _544 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _546 = _228 + _544;
        _336 = _546;
    }
    float _548 = _336;
    float _550 = _548;
    if (_542)
    {
        float _552 = _548 * 8.0;
        float _554 = precise::clamp(_552, 0.0, 1.0);
        _550 = _554;
    }
    float _556 = _550;
    float _558 = _138 * _486;
    float _560 = _138 * _492;
    float _562 = _138 * _504;
    float _564 = _138 * _510;
    float _566 = _138 * _528;
    float _568 = _138 * _534;
    float _570 = fma(_476, 0.20999999344348907470703125, _558);
    float _572 = _138 * _498;
    float _574 = fma(_480, 0.20999999344348907470703125, _560);
    float _576 = _138 * _516;
    float _578 = _570 + _564;
    float _580 = fma(_478, 0.20999999344348907470703125, _572);
    float _582 = _574 + _562;
    float _584 = 0.0 + _310;
    float _586 = precise::clamp(_584, 0.0, 1.0);
    float _588 = _138 * _522;
    float _590 = _580 + _576;
    float _592 = _138 * _540;
    float _594 = _408 * _578;
    float _596 = _412 * _582;
    float _598 = _410 * _590;
    float _600 = _586;
    if (_542)
    {
        float _602 = _586 * _556;
        _600 = _602;
    }
    float _604 = _600;
    float _606 = fma(_594, _592, _588);
    float _608 = fma(_596, _592, _568);
    float _610 = fma(_598, _592, _566);
    float _612 = 0.0 + _604;
    float _614 = precise::clamp(_612, 0.0, 1.0);
    out.m_65.x = _606;
    out.m_65.y = _610;
    out.m_65.z = _608;
    out.m_65.w = _614;
    return out;
}

