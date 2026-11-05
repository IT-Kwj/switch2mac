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
    constant _16* fp_c9 [[id(2)]];
    constant _16* fp_c15 [[id(3)]];
    texture2d<float> fp_t_tcb_8 [[id(4)]];
    sampler fp_t_tcb_8Smplr [[id(5)]];
    texture2d<float> fp_t_tcb_A [[id(6)]];
    sampler fp_t_tcb_ASmplr [[id(7)]];
    texture2d<float> fp_t_tcb_10 [[id(8)]];
    sampler fp_t_tcb_10Smplr [[id(9)]];
    texture2d<float> fp_t_tcb_C [[id(10)]];
    sampler fp_t_tcb_CSmplr [[id(11)]];
    texturecube<float> fp_t_tcb_1E [[id(12)]];
    sampler fp_t_tcb_1ESmplr [[id(13)]];
    sampler fp_t_tcb_8Smplr_w [[id(14)]];
    sampler fp_t_tcb_ASmplr_w [[id(15)]];
    sampler fp_t_tcb_10Smplr_w [[id(16)]];
    sampler fp_t_tcb_CSmplr_w [[id(17)]];
    sampler fp_t_tcb_1ESmplr_w [[id(18)]];
    constant dm_border_t* dm_border [[id(19)]];
};

struct main0_out
{
    float4 m_63 [[color(0)]];
};

struct main0_in
{
    float4 m_54 [[user(locn0)]];
    float4 m_58 [[user(locn1)]];
    float4 m_56 [[user(locn2)]];
    float4 m_69 [[user(locn3)]];
    float4 m_65 [[user(locn4), flat]];
    float4 m_48 [[user(locn5)]];
    float4 m_46 [[user(locn6)]];
    float4 m_52 [[user(locn7), flat]];
    float4 m_50 [[user(locn8)]];
    float4 m_60 [[user(locn9)]];
    float4 m_71 [[user(locn10)]];
    float4 m_67 [[user(locn11)]];
    float4 m_73 [[user(locn12)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _80 = gl_FragCoord.w;
    float _82 = in.m_46.w;
    float _84 = gl_FragCoord.w;
    float _86 = _82 * _84;
    float _88 = in.m_48.y;
    float _90 = gl_FragCoord.w;
    float _92 = _88 * _90;
    float _94 = in.m_48.w;
    float _96 = gl_FragCoord.w;
    float _98 = _94 * _96;
    float _100 = in.m_48.x;
    float _102 = gl_FragCoord.w;
    float _104 = _100 * _102;
    float _106 = in.m_46.x;
    float _108 = gl_FragCoord.w;
    float _110 = _106 * _108;
    float _112 = in.m_46.y;
    float _114 = gl_FragCoord.w;
    float _116 = _112 * _114;
    float _118 = in.m_48.z;
    float _120 = gl_FragCoord.w;
    float _122 = _118 * _120;
    float _124 = in.m_50.x;
    float _126 = gl_FragCoord.w;
    float _128 = _124 * _126;
    float _130 = in.m_50.y;
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
    float _152 = _136 * _122;
    float _154 = _136 * _128;
    float _156 = _136 * _134;
    float2 _697 = float2(_144, _140);
    float _158 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_697, float2(0.0), isnan(_697))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_697, float2(0.0), isnan(_697))).w;
    float2 _708 = float2(_152, _142);
    float _160 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_708, float2(0.0), isnan(_708))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_708, float2(0.0), isnan(_708))).w;
    float _162 = _148 * _146;
    float _164 = _150 * _146;
    float2 _722 = float2(_162, _164);
    float _166 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_722, float2(0.0), isnan(_722))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_722, float2(0.0), isnan(_722))).x;
    float2 _730 = float2(_154, _156);
    float _168 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_730, float2(0.0), isnan(_730))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_730, float2(0.0), isnan(_730))).w;
    float _170 = in.m_46.z;
    float _172 = gl_FragCoord.w;
    float _174 = _170 * _172;
    float _176 = in.m_52.x;
    float _178 = in.m_54.w;
    float _180 = gl_FragCoord.w;
    float _182 = _178 * _180;
    float _184 = in.m_56.x;
    float _186 = gl_FragCoord.w;
    float _188 = _184 * _186;
    float _190 = (*spvDescriptorSet0.fp_c10)._m0[3].x + (-1.0);
    float _192 = _136 * _174;
    float _194 = _176 + (-1.0);
    float _196 = _192 * _146;
    float _198 = in.m_58.w;
    float _200 = gl_FragCoord.w;
    float _202 = _198 * _200;
    float _204 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _206 = fma(_196, (*spvDescriptorSet0.fp_c8)._m0[30].w, _204);
    float _208 = 1.0 / _206;
    float _210 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _212 = _208 * _210;
    float _214 = in.m_60.z;
    float _216 = gl_FragCoord.w;
    float _218 = _214 * _216;
    float _220 = in.m_58.y;
    float _222 = gl_FragCoord.w;
    float _224 = _220 * _222;
    float _226 = in.m_58.z;
    float _228 = gl_FragCoord.w;
    float _230 = _226 * _228;
    float _232 = in.m_54.y;
    float _234 = gl_FragCoord.w;
    float _236 = _232 * _234;
    float _238 = precise::max(_158, _160);
    float _240 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _242 = fma(_166, (*spvDescriptorSet0.fp_c8)._m0[30].w, _240);
    float _244 = -_168;
    float _246 = _238 + _244;
    float _248 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _250 = _246 + _194;
    float _252 = _250 + _190;
    float _254 = precise::clamp(_252, 0.0, 1.0);
    float _256 = _136 * _182;
    float _258 = 1.0 / _242;
    float _260 = -_256;
    float _262 = _260 + _254;
    float _264 = _136 * _202;
    float _266 = _264 * _262;
    float _268 = 0.0 + _266;
    float _270 = precise::clamp(_268, 0.0, 1.0);
    float _272 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _274 = -_212;
    float _276 = fma(_258, _272, _274);
    float _278 = _136 * _188;
    float _280 = _276 * _248;
    float _282 = precise::clamp(_280, 0.0, 1.0);
    float _284 = _270 * _282;
    float _286 = _284 * _278;
    bool _290 = _286 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _292 = isnan(_286);
    bool _294 = _290 || _292;
    bool _296 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _298 = _294 || _296;
    float _300 = in.m_60.y;
    float _302 = gl_FragCoord.w;
    float _304 = _300 * _302;
    float _306 = in.m_60.x;
    float _308 = gl_FragCoord.w;
    float _310 = _306 * _308;
    float _312 = _212;
    if (!_298)
    {
        discard_fragment();
    }
    float _314 = in.m_58.x;
    float _316 = gl_FragCoord.w;
    float _318 = _314 * _316;
    float _320 = in.m_54.x;
    float _322 = gl_FragCoord.w;
    float _324 = _320 * _322;
    float _326 = _160 * 0.5;
    float _328 = precise::max(_158, _326);
    float _330 = _136 * _224;
    float _332 = _328 * _328;
    float _334 = _136 * _230;
    float _336 = _136 * _304;
    float _338 = _136 * _310;
    float _340 = _136 * _218;
    float _342 = _336 * _336;
    float _344 = in.m_54.z;
    float _346 = gl_FragCoord.w;
    float _348 = _344 * _346;
    float _350 = fma(_338, _338, _342);
    float _352 = -_332;
    float _354 = _352 + 1.0;
    float _356 = fma(_340, _340, _350);
    float _358 = _334 * _354;
    float _360 = _136 * _318;
    float _362 = rsqrt(_356);
    float _364 = _360 * _354;
    float _366 = _336 * _362;
    float _368 = _338 * _362;
    float _370 = _340 * _362;
    float _372 = _330 * _354;
    float _374 = _366 * _366;
    float _376 = _136 * _324;
    float _378 = _136 * _236;
    float _380 = _136 * _348;
    float _382 = fma(_368, _368, _374);
    float _384 = fma(_332, _376, _364);
    float _386 = fma(_332, _378, _372);
    float _388 = fma(_332, _380, _358);
    float _390 = fma(_370, _370, _382);
    if (!_298)
    {
        out.m_63.x = _384;
        out.m_63.y = _386;
        out.m_63.z = _388;
        out.m_63.w = _266;
        return out;
    }
    float _392 = in.m_65.x;
    float _394 = rsqrt(_390);
    float _396 = in.m_67.x;
    float _398 = gl_FragCoord.w;
    float _400 = _396 * _398;
    float _402 = abs(_368);
    float _404 = abs(_366);
    float _406 = precise::max(_402, _404);
    float _408 = abs(_370);
    float _410 = precise::max(_408, _406);
    float _412 = 1.0 / _410;
    float _414 = _366 * _394;
    float _416 = fma(_414, 0.5, 0.5);
    float _418 = -_416;
    float _420 = fma(_418, _416, 1.0);
    float _422 = -_332;
    float _424 = _422 + _420;
    float _426 = -_412;
    float _428 = _370 * _426;
    float _430 = _368 * _412;
    float _432 = -_392;
    float _434 = fma(_432, _392, 1.0);
    float _436 = _366 * _412;
    float _438 = _136 * _400;
    float _440 = _424 * _434;
    float _442 = precise::clamp(_440, 0.0, 1.0);
    float _444 = _442 + _438;
    float _446 = precise::min(_444, 1.0);
    float3 _1131 = float3(_430, _436, _428);
    float3 _450 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1131, float3(0.0), isnan(_1131)), level(_446)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1131, float3(0.0), isnan(_1131)), level(_446)).xyz;
    float _452 = _450.x;
    float _454 = _450.y;
    float _456 = _450.z;
    float _458 = in.m_69.x;
    float _460 = gl_FragCoord.w;
    float _462 = _458 * _460;
    float _464 = in.m_69.z;
    float _466 = gl_FragCoord.w;
    float _468 = _464 * _466;
    float _470 = in.m_69.y;
    float _472 = gl_FragCoord.w;
    float _474 = _470 * _472;
    float _476 = in.m_71.z;
    float _478 = gl_FragCoord.w;
    float _480 = _476 * _478;
    float _482 = in.m_71.x;
    float _484 = gl_FragCoord.w;
    float _486 = _482 * _484;
    float _488 = in.m_71.y;
    float _490 = gl_FragCoord.w;
    float _492 = _488 * _490;
    float _494 = in.m_73.x;
    float _496 = gl_FragCoord.w;
    float _498 = _494 * _496;
    float _500 = in.m_73.y;
    float _502 = gl_FragCoord.w;
    float _504 = _500 * _502;
    float _506 = in.m_73.z;
    float _508 = gl_FragCoord.w;
    float _510 = _506 * _508;
    float _512 = in.m_73.w;
    float _514 = gl_FragCoord.w;
    float _516 = _512 * _514;
    bool _518 = 0.5 <= (*spvDescriptorSet0.fp_c15)._m0[653].w;
    if (_518)
    {
        float _520 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _522 = _212 + _520;
        _312 = _522;
    }
    float _524 = _312;
    float _526 = _524;
    if (_518)
    {
        float _528 = _524 * 8.0;
        float _530 = precise::clamp(_528, 0.0, 1.0);
        _526 = _530;
    }
    float _532 = _526;
    float _534 = _136 * _462;
    float _536 = _136 * _468;
    float _538 = _136 * _480;
    float _540 = _136 * _486;
    float _542 = _136 * _504;
    float _544 = _136 * _510;
    float _546 = fma(_452, 0.20999999344348907470703125, _534);
    float _548 = _136 * _474;
    float _550 = fma(_456, 0.20999999344348907470703125, _536);
    float _552 = _136 * _492;
    float _554 = _546 + _540;
    float _556 = fma(_454, 0.20999999344348907470703125, _548);
    float _558 = _550 + _538;
    float _560 = 0.0 + _286;
    float _562 = precise::clamp(_560, 0.0, 1.0);
    float _564 = _136 * _498;
    float _566 = _556 + _552;
    float _568 = _136 * _516;
    float _570 = _384 * _554;
    float _572 = _388 * _558;
    float _574 = _386 * _566;
    float _576 = _562;
    if (_518)
    {
        float _578 = _562 * _532;
        _576 = _578;
    }
    float _580 = _576;
    float _582 = fma(_570, _568, _564);
    float _584 = fma(_572, _568, _544);
    float _586 = fma(_574, _568, _542);
    float _588 = 0.0 + _580;
    float _590 = precise::clamp(_588, 0.0, 1.0);
    out.m_63.x = _582;
    out.m_63.y = _586;
    out.m_63.z = _584;
    out.m_63.w = _590;
    return out;
}

