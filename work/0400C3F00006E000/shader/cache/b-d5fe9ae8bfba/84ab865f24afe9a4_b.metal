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
    constant _16* fp_c9 [[id(1)]];
    constant _16* fp_c8 [[id(2)]];
    constant _16* fp_c15 [[id(3)]];
    texture2d<float> fp_t_tcb_10 [[id(4)]];
    sampler fp_t_tcb_10Smplr [[id(5)]];
    texture2d<float> fp_t_tcb_8 [[id(6)]];
    sampler fp_t_tcb_8Smplr [[id(7)]];
    texture2d<float> fp_t_tcb_A [[id(8)]];
    sampler fp_t_tcb_ASmplr [[id(9)]];
    texture2d<float> fp_t_tcb_C [[id(10)]];
    sampler fp_t_tcb_CSmplr [[id(11)]];
    texturecube<float> fp_t_tcb_1E [[id(12)]];
    sampler fp_t_tcb_1ESmplr [[id(13)]];
    sampler fp_t_tcb_10Smplr_w [[id(14)]];
    sampler fp_t_tcb_8Smplr_w [[id(15)]];
    sampler fp_t_tcb_ASmplr_w [[id(16)]];
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
    float4 m_56 [[user(locn0)]];
    float4 m_58 [[user(locn1)]];
    float4 m_52 [[user(locn2)]];
    float4 m_46 [[user(locn3)]];
    float4 m_67 [[user(locn4)]];
    float4 m_60 [[user(locn5)]];
    float4 m_48 [[user(locn6)]];
    float4 m_50 [[user(locn7)]];
    float4 m_54 [[user(locn8)]];
    float4 m_69 [[user(locn9)]];
    float4 m_65 [[user(locn10)]];
    float4 m_71 [[user(locn11)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _78 = gl_FragCoord.w;
    float _80 = in.m_46.w;
    float _82 = gl_FragCoord.w;
    float _84 = _80 * _82;
    float _86 = in.m_46.x;
    float _88 = gl_FragCoord.w;
    float _90 = _86 * _88;
    float _92 = in.m_46.y;
    float _94 = gl_FragCoord.w;
    float _96 = _92 * _94;
    float _98 = in.m_48.x;
    float _100 = gl_FragCoord.w;
    float _102 = _98 * _100;
    float _104 = in.m_48.z;
    float _106 = gl_FragCoord.w;
    float _108 = _104 * _106;
    float _110 = in.m_48.y;
    float _112 = gl_FragCoord.w;
    float _114 = _110 * _112;
    float _116 = (*spvDescriptorSet0.fp_c10)._m0[5].x * (*spvDescriptorSet0.fp_c10)._m0[5].x;
    float _118 = in.m_48.w;
    float _120 = gl_FragCoord.w;
    float _122 = _118 * _120;
    float _124 = in.m_50.x;
    float _126 = gl_FragCoord.w;
    float _128 = _124 * _126;
    float _130 = in.m_50.y;
    float _132 = gl_FragCoord.w;
    float _134 = _130 * _132;
    float _136 = fma((*spvDescriptorSet0.fp_c10)._m0[4].x, (*spvDescriptorSet0.fp_c10)._m0[4].x, _116);
    float _138 = fma((*spvDescriptorSet0.fp_c10)._m0[6].x, (*spvDescriptorSet0.fp_c10)._m0[6].x, _136);
    float _140 = sqrt(_138);
    float _142 = 1.0 / _78;
    float _144 = _142 * _84;
    float _146 = _142 * _90;
    float _148 = _142 * _96;
    float _150 = _142 * _102;
    float _152 = _142 * _108;
    float _154 = 1.0 / _144;
    float _156 = _150 * _140;
    float _158 = _152 * _140;
    float _160 = _142 * _114;
    float _162 = _142 * _122;
    float _164 = _142 * _128;
    float _166 = _142 * _134;
    float _168 = _146 * _154;
    float _170 = _148 * _154;
    float2 _729 = float2(_168, _170);
    float _172 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_729, float2(0.0), isnan(_729))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_729, float2(0.0), isnan(_729))).x;
    float2 _740 = float2(_156, _160);
    float _174 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_740, float2(0.0), isnan(_740))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_740, float2(0.0), isnan(_740))).w;
    float2 _748 = float2(_158, _162);
    float _176 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_748, float2(0.0), isnan(_748))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_748, float2(0.0), isnan(_748))).w;
    float2 _756 = float2(_164, _166);
    float _178 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_756, float2(0.0), isnan(_756))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_756, float2(0.0), isnan(_756))).w;
    float _180 = in.m_52.y;
    float _182 = gl_FragCoord.w;
    float _184 = _180 * _182;
    float _186 = in.m_52.x;
    float _188 = gl_FragCoord.w;
    float _190 = _186 * _188;
    float _192 = in.m_52.z;
    float _194 = gl_FragCoord.w;
    float _196 = _192 * _194;
    float _198 = in.m_54.y;
    float _200 = gl_FragCoord.w;
    float _202 = _198 * _200;
    float _204 = in.m_54.x;
    float _206 = gl_FragCoord.w;
    float _208 = _204 * _206;
    float _210 = in.m_46.z;
    float _212 = gl_FragCoord.w;
    float _214 = _210 * _212;
    float _216 = in.m_54.z;
    float _218 = gl_FragCoord.w;
    float _220 = _216 * _218;
    float _222 = _142 * _184;
    float _224 = _142 * _190;
    float _226 = _142 * _196;
    float _228 = _142 * _202;
    float _230 = _222 * _222;
    float _232 = _142 * _208;
    float _234 = in.m_56.w;
    float _236 = gl_FragCoord.w;
    float _238 = _234 * _236;
    float _240 = fma(_224, _224, _230);
    float _242 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _244 = _242 + (*spvDescriptorSet0.fp_c9)._m0[139].w;
    float _246 = fma(_226, _226, _240);
    float _248 = 1.0 / _244;
    float _250 = rsqrt(_246);
    float _252 = _222 * _250;
    float _254 = _224 * _250;
    float _256 = _226 * _250;
    float _258 = _228 * _252;
    float _260 = _142 * _220;
    float _262 = fma(_232, _254, _258);
    float _264 = _142 * _214;
    float _266 = in.m_58.w;
    float _268 = gl_FragCoord.w;
    float _270 = _266 * _268;
    float _272 = fma(_260, _256, _262);
    float _274 = _264 * _154;
    float _276 = abs(_272);
    float _278 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _280 = _276 + _278;
    float _282 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _284 = fma(_274, (*spvDescriptorSet0.fp_c8)._m0[30].w, _282);
    float _286 = _280 * _248;
    float _288 = precise::clamp(_286, 0.0, 1.0);
    float _290 = in.m_60.x;
    float _292 = gl_FragCoord.w;
    float _294 = _290 * _292;
    float _296 = 1.0 / _284;
    float _298 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _300 = fma(_172, (*spvDescriptorSet0.fp_c8)._m0[30].w, _298);
    float _302 = fma(_288, -2.0, 3.0);
    float _304 = _174 + _176;
    float _306 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _308 = _288 * _288;
    float _310 = _142 * _270;
    float _312 = _304 * _178;
    float _314 = precise::clamp(_312, 0.0, 1.0);
    float _316 = _142 * _238;
    float _318 = _302 * _308;
    float _320 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _322 = _296 * _320;
    float _324 = 1.0 / _300;
    float _326 = -_316;
    float _328 = _326 + _314;
    float _330 = _328 * _310;
    float _332 = 0.0 + _330;
    float _334 = precise::clamp(_332, 0.0, 1.0);
    float _336 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _338 = -_322;
    float _340 = fma(_324, _336, _338);
    float _342 = _340 * _306;
    float _344 = precise::clamp(_342, 0.0, 1.0);
    float _346 = _334 * _344;
    float _348 = abs(_340);
    bool _352 = _348 < (*spvDescriptorSet0.fp_c9)._m0[141].x;
    float _354 = float(_352);
    float _356 = _346 * _318;
    float _358 = _142 * _294;
    float _360 = _356 * _354;
    float _362 = _360 * _358;
    bool _364 = _362 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _366 = isnan(_362);
    bool _368 = _364 || _366;
    bool _370 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _372 = _368 || _370;
    float _374 = in.m_56.x;
    float _376 = gl_FragCoord.w;
    float _378 = _374 * _376;
    float _380 = in.m_56.y;
    float _382 = gl_FragCoord.w;
    float _384 = _380 * _382;
    float _386 = in.m_56.z;
    float _388 = gl_FragCoord.w;
    float _390 = _386 * _388;
    float _392 = _322;
    if (!_372)
    {
        discard_fragment();
    }
    float _394 = _142 * _378;
    float _396 = _142 * _384;
    float _398 = _142 * _390;
    if (!_372)
    {
        out.m_63.x = _394;
        out.m_63.y = _396;
        out.m_63.z = _398;
        out.m_63.w = _330;
        return out;
    }
    float _400 = _228 * _228;
    float _402 = in.m_65.x;
    float _404 = gl_FragCoord.w;
    float _406 = _402 * _404;
    float _408 = fma(_232, _232, _400);
    float _410 = fma(_260, _260, _408);
    float _412 = rsqrt(_410);
    float _414 = _232 * _412;
    float _416 = _228 * _412;
    float _418 = _260 * _412;
    float _420 = _142 * _406;
    float _422 = abs(_414);
    float _424 = abs(_416);
    float _426 = precise::max(_422, _424);
    float _428 = precise::min(_420, 1.0);
    float _430 = abs(_418);
    float _432 = precise::max(_430, _426);
    float _434 = 1.0 / _432;
    float _436 = -_434;
    float _438 = _418 * _436;
    float _440 = _414 * _434;
    float _442 = _416 * _434;
    float3 _1142 = float3(_440, _442, _438);
    float3 _446 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1142, float3(0.0), isnan(_1142)), level(_428)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1142, float3(0.0), isnan(_1142)), level(_428)).xyz;
    float _448 = _446.x;
    float _450 = _446.y;
    float _452 = _446.z;
    float _454 = in.m_67.x;
    float _456 = gl_FragCoord.w;
    float _458 = _454 * _456;
    float _460 = in.m_67.z;
    float _462 = gl_FragCoord.w;
    float _464 = _460 * _462;
    float _466 = in.m_67.y;
    float _468 = gl_FragCoord.w;
    float _470 = _466 * _468;
    float _472 = in.m_69.z;
    float _474 = gl_FragCoord.w;
    float _476 = _472 * _474;
    float _478 = in.m_69.x;
    float _480 = gl_FragCoord.w;
    float _482 = _478 * _480;
    float _484 = in.m_69.y;
    float _486 = gl_FragCoord.w;
    float _488 = _484 * _486;
    float _490 = in.m_71.x;
    float _492 = gl_FragCoord.w;
    float _494 = _490 * _492;
    float _496 = in.m_71.y;
    float _498 = gl_FragCoord.w;
    float _500 = _496 * _498;
    float _502 = in.m_71.z;
    float _504 = gl_FragCoord.w;
    float _506 = _502 * _504;
    float _508 = in.m_71.w;
    float _510 = gl_FragCoord.w;
    float _512 = _508 * _510;
    bool _514 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    if (_514)
    {
        float _516 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _518 = _322 + _516;
        _392 = _518;
    }
    float _520 = _392;
    float _522 = _520;
    if (_514)
    {
        float _524 = _520 * 8.0;
        float _526 = precise::clamp(_524, 0.0, 1.0);
        _522 = _526;
    }
    float _528 = _522;
    float _530 = _142 * _458;
    float _532 = _142 * _464;
    float _534 = _142 * _476;
    float _536 = _142 * _482;
    float _538 = _142 * _488;
    float _540 = _142 * _500;
    float _542 = fma(_448, 0.20999999344348907470703125, _530);
    float _544 = _142 * _470;
    float _546 = fma(_452, 0.20999999344348907470703125, _532);
    float _548 = _142 * _494;
    float _550 = _542 + _536;
    float _552 = fma(_450, 0.20999999344348907470703125, _544);
    float _554 = _546 + _534;
    float _556 = 0.0 + _362;
    float _558 = precise::clamp(_556, 0.0, 1.0);
    float _560 = _142 * _506;
    float _562 = _552 + _538;
    float _564 = _142 * _512;
    float _566 = _394 * _550;
    float _568 = _398 * _554;
    float _570 = _396 * _562;
    float _572 = _558;
    if (_514)
    {
        float _574 = _558 * _528;
        _572 = _574;
    }
    float _576 = _572;
    float _578 = fma(_566, _564, _548);
    float _580 = fma(_568, _564, _560);
    float _582 = fma(_570, _564, _540);
    float _584 = 0.0 + _576;
    float _586 = precise::clamp(_584, 0.0, 1.0);
    out.m_63.x = _578;
    out.m_63.y = _582;
    out.m_63.z = _580;
    out.m_63.w = _586;
    return out;
}

