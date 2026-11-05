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
    constant _16* fp_c8 [[id(0)]];
    constant _16* fp_c9 [[id(1)]];
    constant _16* fp_c15 [[id(2)]];
    texture2d<float> fp_t_tcb_10 [[id(3)]];
    sampler fp_t_tcb_10Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_A [[id(7)]];
    sampler fp_t_tcb_ASmplr [[id(8)]];
    texture2d<float> fp_t_tcb_C [[id(9)]];
    sampler fp_t_tcb_CSmplr [[id(10)]];
    texture2d<float> fp_t_tcb_34 [[id(11)]];
    sampler fp_t_tcb_34Smplr [[id(12)]];
    texturecube<float> fp_t_tcb_1E [[id(13)]];
    sampler fp_t_tcb_1ESmplr [[id(14)]];
    sampler fp_t_tcb_10Smplr_w [[id(15)]];
    sampler fp_t_tcb_8Smplr_w [[id(16)]];
    sampler fp_t_tcb_ASmplr_w [[id(17)]];
    sampler fp_t_tcb_CSmplr_w [[id(18)]];
    sampler fp_t_tcb_34Smplr_w [[id(19)]];
    sampler fp_t_tcb_1ESmplr_w [[id(20)]];
    constant dm_border_t* dm_border [[id(21)]];
};

struct main0_out
{
    float4 m_61 [[color(0)]];
};

struct main0_in
{
    float4 m_56 [[user(locn0)]];
    float4 m_58 [[user(locn2)]];
    float4 m_67 [[user(locn3)]];
    float4 m_54 [[user(locn4)]];
    float4 m_48 [[user(locn5)]];
    float4 m_46 [[user(locn6)]];
    float4 m_50 [[user(locn7)]];
    float4 m_52 [[user(locn8)]];
    float4 m_63 [[user(locn9)]];
    float4 m_69 [[user(locn10)]];
    float4 m_65 [[user(locn11)]];
    float4 m_71 [[user(locn12)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _78 = gl_FragCoord.w;
    float _80 = in.m_46.w;
    float _82 = gl_FragCoord.w;
    float _84 = _80 * _82;
    float _86 = in.m_48.z;
    float _88 = gl_FragCoord.w;
    float _90 = _86 * _88;
    float _92 = in.m_46.x;
    float _94 = gl_FragCoord.w;
    float _96 = _92 * _94;
    float _98 = in.m_46.y;
    float _100 = gl_FragCoord.w;
    float _102 = _98 * _100;
    float _104 = in.m_50.x;
    float _106 = gl_FragCoord.w;
    float _108 = _104 * _106;
    float _110 = in.m_48.x;
    float _112 = gl_FragCoord.w;
    float _114 = _110 * _112;
    float _116 = in.m_48.y;
    float _118 = gl_FragCoord.w;
    float _120 = _116 * _118;
    float _122 = in.m_48.w;
    float _124 = gl_FragCoord.w;
    float _126 = _122 * _124;
    float _128 = in.m_50.y;
    float _130 = gl_FragCoord.w;
    float _132 = _128 * _130;
    float _134 = in.m_52.x;
    float _136 = gl_FragCoord.w;
    float _138 = _134 * _136;
    float _140 = in.m_52.y;
    float _142 = gl_FragCoord.w;
    float _144 = _140 * _142;
    float _146 = 1.0 / _78;
    float _148 = _146 * _84;
    float _150 = _146 * _90;
    float _152 = _146 * _96;
    float _154 = _146 * _102;
    float _156 = 1.0 / _148;
    float _158 = _146 * _108;
    float _160 = _146 * _114;
    float _162 = _146 * _120;
    float _164 = _146 * _126;
    float _166 = _146 * _144;
    float _168 = _152 * _156;
    float _170 = _154 * _156;
    float _172 = _146 * _132;
    float _174 = _146 * _138;
    float2 _677 = float2(_168, _170);
    float _176 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_677, float2(0.0), isnan(_677))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_677, float2(0.0), isnan(_677))).x;
    float2 _688 = float2(_160, _162);
    float _178 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_688, float2(0.0), isnan(_688))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_688, float2(0.0), isnan(_688))).w;
    float2 _696 = float2(_150, _164);
    float _180 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_696, float2(0.0), isnan(_696))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_696, float2(0.0), isnan(_696))).w;
    float2 _704 = float2(_158, _172);
    float _182 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_704, float2(0.0), isnan(_704))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_704, float2(0.0), isnan(_704))).w;
    float2 _712 = float2(_174, _166);
    float _184 = dm_bs(spvDescriptorSet0.fp_t_tcb_34.sample(spvDescriptorSet0.fp_t_tcb_34Smplr, select(_712, float2(0.0), isnan(_712))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_34, spvDescriptorSet0.fp_t_tcb_34Smplr_w, select(_712, float2(0.0), isnan(_712))).w;
    float _186 = in.m_46.z;
    float _188 = gl_FragCoord.w;
    float _190 = _186 * _188;
    float _192 = in.m_54.w;
    float _194 = gl_FragCoord.w;
    float _196 = _192 * _194;
    float _198 = in.m_56.w;
    float _200 = gl_FragCoord.w;
    float _202 = _198 * _200;
    float _204 = in.m_58.x;
    float _206 = gl_FragCoord.w;
    float _208 = _204 * _206;
    float _210 = _146 * _190;
    float _212 = _210 * _156;
    float _214 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _216 = fma(_212, (*spvDescriptorSet0.fp_c8)._m0[30].w, _214);
    float _218 = 1.0 / _216;
    float _220 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _222 = _218 * _220;
    float _224 = _146 * _208;
    float _226 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _228 = fma(_176, (*spvDescriptorSet0.fp_c8)._m0[30].w, _226);
    float _230 = _178 + _180;
    float _232 = _146 * _196;
    float _234 = 1.0 / _228;
    float _236 = _230 * _182;
    float _238 = _236 * _184;
    float _240 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _242 = _238 * _232;
    float _244 = _146 * _202;
    float _246 = _244 * _242;
    float _248 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _250 = -_222;
    float _252 = fma(_234, _248, _250);
    float _254 = 0.0 + _246;
    float _256 = precise::clamp(_254, 0.0, 1.0);
    float _258 = _252 * _240;
    float _260 = precise::clamp(_258, 0.0, 1.0);
    float _262 = _256 * _260;
    float _264 = _262 * _224;
    bool _268 = _264 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _270 = isnan(_264);
    bool _272 = _268 || _270;
    bool _274 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _276 = _272 || _274;
    float _278 = in.m_56.x;
    float _280 = gl_FragCoord.w;
    float _282 = _278 * _280;
    float _284 = in.m_54.x;
    float _286 = gl_FragCoord.w;
    float _288 = _284 * _286;
    float _290 = _222;
    if (!_276)
    {
        discard_fragment();
    }
    float _292 = in.m_54.z;
    float _294 = gl_FragCoord.w;
    float _296 = _292 * _294;
    float _298 = _146 * _282;
    float _300 = _146 * _288;
    float _302 = in.m_54.y;
    float _304 = gl_FragCoord.w;
    float _306 = _302 * _304;
    float _308 = _298 * _300;
    float _310 = in.m_56.y;
    float _312 = gl_FragCoord.w;
    float _314 = _310 * _312;
    float _316 = _146 * _306;
    float _318 = in.m_56.z;
    float _320 = gl_FragCoord.w;
    float _322 = _318 * _320;
    float _324 = _146 * _314;
    float _326 = _324 * _316;
    float _328 = _146 * _322;
    float _330 = _146 * _296;
    float _332 = _328 * _330;
    if (!_276)
    {
        out.m_61.x = _308;
        out.m_61.y = _326;
        out.m_61.z = _332;
        out.m_61.w = _246;
        return out;
    }
    float _334 = in.m_63.y;
    float _336 = gl_FragCoord.w;
    float _338 = _334 * _336;
    float _340 = in.m_63.x;
    float _342 = gl_FragCoord.w;
    float _344 = _340 * _342;
    float _346 = in.m_63.z;
    float _348 = gl_FragCoord.w;
    float _350 = _346 * _348;
    float _352 = _146 * _338;
    float _354 = _146 * _344;
    float _356 = _146 * _350;
    float _358 = _352 * _352;
    float _360 = in.m_65.x;
    float _362 = gl_FragCoord.w;
    float _364 = _360 * _362;
    float _366 = fma(_354, _354, _358);
    float _368 = fma(_356, _356, _366);
    float _370 = rsqrt(_368);
    float _372 = _354 * _370;
    float _374 = _352 * _370;
    float _376 = _356 * _370;
    float _378 = _146 * _364;
    float _380 = abs(_372);
    float _382 = abs(_374);
    float _384 = precise::max(_380, _382);
    float _386 = precise::min(_378, 1.0);
    float _388 = abs(_376);
    float _390 = precise::max(_388, _384);
    float _392 = 1.0 / _390;
    float _394 = -_392;
    float _396 = _376 * _394;
    float _398 = _372 * _392;
    float _400 = _374 * _392;
    float3 _1028 = float3(_398, _400, _396);
    float3 _404 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1028, float3(0.0), isnan(_1028)), level(_386)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1028, float3(0.0), isnan(_1028)), level(_386)).xyz;
    float _406 = _404.x;
    float _408 = _404.y;
    float _410 = _404.z;
    float _412 = in.m_67.x;
    float _414 = gl_FragCoord.w;
    float _416 = _412 * _414;
    float _418 = in.m_67.z;
    float _420 = gl_FragCoord.w;
    float _422 = _418 * _420;
    float _424 = in.m_67.y;
    float _426 = gl_FragCoord.w;
    float _428 = _424 * _426;
    float _430 = in.m_69.z;
    float _432 = gl_FragCoord.w;
    float _434 = _430 * _432;
    float _436 = in.m_69.x;
    float _438 = gl_FragCoord.w;
    float _440 = _436 * _438;
    float _442 = in.m_69.y;
    float _444 = gl_FragCoord.w;
    float _446 = _442 * _444;
    float _448 = in.m_71.x;
    float _450 = gl_FragCoord.w;
    float _452 = _448 * _450;
    float _454 = in.m_71.y;
    float _456 = gl_FragCoord.w;
    float _458 = _454 * _456;
    float _460 = in.m_71.z;
    float _462 = gl_FragCoord.w;
    float _464 = _460 * _462;
    float _466 = in.m_71.w;
    float _468 = gl_FragCoord.w;
    float _470 = _466 * _468;
    bool _472 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    if (_472)
    {
        float _474 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _476 = _222 + _474;
        _290 = _476;
    }
    float _478 = _290;
    float _480 = _478;
    if (_472)
    {
        float _482 = _478 * 8.0;
        float _484 = precise::clamp(_482, 0.0, 1.0);
        _480 = _484;
    }
    float _486 = _480;
    float _488 = _146 * _416;
    float _490 = _146 * _422;
    float _492 = _146 * _434;
    float _494 = _146 * _440;
    float _496 = _146 * _446;
    float _498 = _146 * _458;
    float _500 = fma(_406, 0.20999999344348907470703125, _488);
    float _502 = _146 * _428;
    float _504 = fma(_410, 0.20999999344348907470703125, _490);
    float _506 = _146 * _452;
    float _508 = _500 + _494;
    float _510 = fma(_408, 0.20999999344348907470703125, _502);
    float _512 = _504 + _492;
    float _514 = 0.0 + _264;
    float _516 = precise::clamp(_514, 0.0, 1.0);
    float _518 = _146 * _464;
    float _520 = _510 + _496;
    float _522 = _146 * _470;
    float _524 = _308 * _508;
    float _526 = _332 * _512;
    float _528 = _326 * _520;
    float _530 = _516;
    if (_472)
    {
        float _532 = _516 * _486;
        _530 = _532;
    }
    float _534 = _530;
    float _536 = fma(_524, _522, _506);
    float _538 = fma(_526, _522, _518);
    float _540 = fma(_528, _522, _498);
    float _542 = 0.0 + _534;
    float _544 = precise::clamp(_542, 0.0, 1.0);
    out.m_61.x = _536;
    out.m_61.y = _540;
    out.m_61.z = _538;
    out.m_61.w = _544;
    return out;
}

