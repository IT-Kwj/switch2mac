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
    constant _16* fp_c8 [[id(1)]];
    constant _16* fp_c15 [[id(2)]];
    texture2d<float> fp_t_tcb_10 [[id(3)]];
    sampler fp_t_tcb_10Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    texturecube<float> fp_t_tcb_1E [[id(7)]];
    sampler fp_t_tcb_1ESmplr [[id(8)]];
    sampler fp_t_tcb_10Smplr_w [[id(9)]];
    sampler fp_t_tcb_8Smplr_w [[id(10)]];
    sampler fp_t_tcb_1ESmplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_57 [[color(0)]];
};

struct main0_in
{
    float4 m_50 [[user(locn0)]];
    float4 m_54 [[user(locn1)]];
    float4 m_44 [[user(locn2)]];
    float4 m_61 [[user(locn3)]];
    float4 m_48 [[user(locn4)]];
    float4 m_42 [[user(locn5)]];
    float4 m_40 [[user(locn6)]];
    float4 m_52 [[user(locn7)]];
    float4 m_46 [[user(locn8)]];
    float4 m_63 [[user(locn9)]];
    float4 m_59 [[user(locn10)]];
    float4 m_65 [[user(locn11)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _72 = gl_FragCoord.w;
    float _74 = in.m_40.w;
    float _76 = gl_FragCoord.w;
    float _78 = _74 * _76;
    float _80 = in.m_40.x;
    float _82 = gl_FragCoord.w;
    float _84 = _80 * _82;
    float _86 = in.m_40.y;
    float _88 = gl_FragCoord.w;
    float _90 = _86 * _88;
    float _92 = in.m_42.x;
    float _94 = gl_FragCoord.w;
    float _96 = _92 * _94;
    float _98 = in.m_42.y;
    float _100 = gl_FragCoord.w;
    float _102 = _98 * _100;
    float _104 = 1.0 / _72;
    float _106 = _104 * _78;
    float _108 = _104 * _84;
    float _110 = _104 * _90;
    float _112 = _104 * _102;
    float _114 = 1.0 / _106;
    float _116 = _108 * _114;
    float _118 = _110 * _114;
    float _120 = _104 * _96;
    float2 _664 = float2(_116, _118);
    float _122 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_664, float2(0.0), isnan(_664))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_664, float2(0.0), isnan(_664))).x;
    float2 _675 = float2(_120, _112);
    float _124 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_675, float2(0.0), isnan(_675))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_675, float2(0.0), isnan(_675))).w;
    float _126 = in.m_44.y;
    float _128 = gl_FragCoord.w;
    float _130 = _126 * _128;
    float _132 = in.m_44.x;
    float _134 = gl_FragCoord.w;
    float _136 = _132 * _134;
    float _138 = in.m_44.z;
    float _140 = gl_FragCoord.w;
    float _142 = _138 * _140;
    float _144 = in.m_46.y;
    float _146 = gl_FragCoord.w;
    float _148 = _144 * _146;
    float _150 = in.m_46.x;
    float _152 = gl_FragCoord.w;
    float _154 = _150 * _152;
    float _156 = in.m_46.z;
    float _158 = gl_FragCoord.w;
    float _160 = _156 * _158;
    float _162 = in.m_40.z;
    float _164 = gl_FragCoord.w;
    float _166 = _162 * _164;
    float _168 = _104 * _130;
    float _170 = _104 * _136;
    float _172 = _104 * _142;
    float _174 = _168 * _168;
    float _176 = fma(_170, _170, _174);
    float _178 = fma(_172, _172, _176);
    float _180 = rsqrt(_178);
    float _182 = _104 * _148;
    float _184 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _186 = _184 + (*spvDescriptorSet0.fp_c9)._m0[139].w;
    float _188 = 1.0 / _186;
    float _190 = _168 * _180;
    float _192 = _104 * _154;
    float _194 = _170 * _180;
    float _196 = in.m_48.w;
    float _198 = gl_FragCoord.w;
    float _200 = _196 * _198;
    float _202 = _182 * _190;
    float _204 = _172 * _180;
    float _206 = _104 * _160;
    float _208 = _104 * _166;
    float _210 = fma(_192, _194, _202);
    float _212 = in.m_50.w;
    float _214 = gl_FragCoord.w;
    float _216 = _212 * _214;
    float _218 = _208 * _114;
    float _220 = fma(_206, _204, _210);
    float _222 = in.m_52.x;
    float _224 = gl_FragCoord.w;
    float _226 = _222 * _224;
    float _228 = abs(_220);
    float _230 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _232 = _228 + _230;
    float _234 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _236 = fma(_218, (*spvDescriptorSet0.fp_c8)._m0[30].w, _234);
    float _238 = _232 * _188;
    float _240 = precise::clamp(_238, 0.0, 1.0);
    float _242 = fma(_240, -2.0, 3.0);
    float _244 = _240 * _240;
    float _246 = 1.0 / _236;
    float _248 = _242 * _244;
    float _250 = _104 * _200;
    float _252 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _254 = _246 * _252;
    float _256 = in.m_54.z;
    float _258 = gl_FragCoord.w;
    float _260 = _256 * _258;
    float _262 = in.m_50.x;
    float _264 = gl_FragCoord.w;
    float _266 = _262 * _264;
    float _268 = in.m_50.z;
    float _270 = gl_FragCoord.w;
    float _272 = _268 * _270;
    float _274 = _104 * _260;
    float _276 = _104 * _266;
    float _278 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _280 = fma(_122, (*spvDescriptorSet0.fp_c8)._m0[30].w, _278);
    float _282 = _124 * 2.0;
    float _284 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _286 = -(*spvDescriptorSet0.fp_c9)._m0[194].w;
    float _288 = fma(_282, _250, _286);
    float _290 = precise::clamp(_288, 0.0, 1.0);
    float _292 = fma(_124, _250, _290);
    float _294 = precise::clamp(_292, 0.0, 1.0);
    float _296 = 1.0 / _280;
    float _298 = _104 * _216;
    float _300 = _294 * _298;
    float _302 = 0.0 + _300;
    float _304 = precise::clamp(_302, 0.0, 1.0);
    float _306 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _308 = -_254;
    float _310 = fma(_296, _306, _308);
    float _312 = _104 * _226;
    float _314 = _310 * _284;
    float _316 = precise::clamp(_314, 0.0, 1.0);
    float _318 = _304 * _316;
    float _320 = _318 * _248;
    float _322 = _320 * _312;
    bool _326 = _322 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _328 = isnan(_322);
    bool _330 = _326 || _328;
    bool _332 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _334 = _330 || _332;
    float _336 = in.m_54.x;
    float _338 = gl_FragCoord.w;
    float _340 = _336 * _338;
    float _342 = in.m_54.y;
    float _344 = gl_FragCoord.w;
    float _346 = _342 * _344;
    float _348 = in.m_50.y;
    float _350 = gl_FragCoord.w;
    float _352 = _348 * _350;
    float _354 = _254;
    if (!_334)
    {
        discard_fragment();
    }
    float _356 = -_294;
    float _358 = _356 + 1.0;
    float _360 = _104 * _272;
    float _362 = _104 * _340;
    float _364 = _104 * _346;
    float _366 = _104 * _352;
    float _368 = _362 * _358;
    float _370 = _364 * _358;
    float _372 = _274 * _358;
    float _374 = fma(_294, _276, _368);
    float _376 = fma(_294, _366, _370);
    float _378 = fma(_294, _360, _372);
    if (!_334)
    {
        out.m_57.x = _374;
        out.m_57.y = _376;
        out.m_57.z = _378;
        out.m_57.w = _300;
        return out;
    }
    float _380 = _182 * _182;
    float _382 = in.m_59.x;
    float _384 = gl_FragCoord.w;
    float _386 = _382 * _384;
    float _388 = fma(_192, _192, _380);
    float _390 = fma(_206, _206, _388);
    float _392 = rsqrt(_390);
    float _394 = _192 * _392;
    float _396 = _182 * _392;
    float _398 = _206 * _392;
    float _400 = _104 * _386;
    float _402 = abs(_394);
    float _404 = abs(_396);
    float _406 = precise::max(_402, _404);
    float _408 = precise::min(_400, 1.0);
    float _410 = abs(_398);
    float _412 = precise::max(_410, _406);
    float _414 = 1.0 / _412;
    float _416 = -_414;
    float _418 = _398 * _416;
    float _420 = _394 * _414;
    float _422 = _396 * _414;
    float3 _1114 = float3(_420, _422, _418);
    float3 _426 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1114, float3(0.0), isnan(_1114)), level(_408)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1114, float3(0.0), isnan(_1114)), level(_408)).xyz;
    float _428 = _426.x;
    float _430 = _426.y;
    float _432 = _426.z;
    float _434 = _366 * (*spvDescriptorSet0.fp_c9)._m0[194].z;
    float _436 = _276 * (*spvDescriptorSet0.fp_c9)._m0[194].z;
    float _438 = in.m_61.x;
    float _440 = gl_FragCoord.w;
    float _442 = _438 * _440;
    float _444 = _360 * (*spvDescriptorSet0.fp_c9)._m0[194].z;
    float _446 = _434 * 0.715200006961822509765625;
    float _448 = in.m_61.z;
    float _450 = gl_FragCoord.w;
    float _452 = _448 * _450;
    float _454 = in.m_61.y;
    float _456 = gl_FragCoord.w;
    float _458 = _454 * _456;
    float _460 = in.m_63.z;
    float _462 = gl_FragCoord.w;
    float _464 = _460 * _462;
    float _466 = fma(_436, 0.2125999927520751953125, _446);
    float _468 = in.m_63.x;
    float _470 = gl_FragCoord.w;
    float _472 = _468 * _470;
    float _474 = in.m_63.y;
    float _476 = gl_FragCoord.w;
    float _478 = _474 * _476;
    float _480 = in.m_65.x;
    float _482 = gl_FragCoord.w;
    float _484 = _480 * _482;
    float _486 = fma(_444, 0.072200000286102294921875, _466);
    float _488 = in.m_65.y;
    float _490 = gl_FragCoord.w;
    float _492 = _488 * _490;
    float _494 = in.m_65.z;
    float _496 = gl_FragCoord.w;
    float _498 = _494 * _496;
    float _500 = in.m_65.w;
    float _502 = gl_FragCoord.w;
    float _504 = _500 * _502;
    float _506 = 1.0 / _486;
    bool _508 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _510 = _506 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _512 = precise::clamp(_510, 0.0, 1.0);
    if (_508)
    {
        float _514 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _516 = _254 + _514;
        _354 = _516;
    }
    float _518 = _354;
    float _520 = fma(_512, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _522 = _104 * _442;
    float _524 = _104 * _464;
    float _526 = _104 * _472;
    float _528 = _436 * _520;
    float _530 = _434 * _520;
    float _532 = _444 * _520;
    float _534 = _104 * _452;
    float _536 = _104 * _478;
    float _538 = _518;
    if (_508)
    {
        float _540 = _518 * 8.0;
        float _542 = precise::clamp(_540, 0.0, 1.0);
        _538 = _542;
    }
    float _544 = _538;
    float _546 = _104 * _492;
    float _548 = _104 * _498;
    float _550 = fma(_428, 0.20999999344348907470703125, _522);
    float _552 = _104 * _458;
    float _554 = fma(_432, 0.20999999344348907470703125, _534);
    float _556 = _104 * _484;
    float _558 = _550 + _526;
    float _560 = fma(_430, 0.20999999344348907470703125, _552);
    float _562 = _554 + _524;
    float _564 = 0.0 + _322;
    float _566 = precise::clamp(_564, 0.0, 1.0);
    float _568 = _104 * _504;
    float _570 = _560 + _536;
    float _572 = fma(_374, _558, _528);
    float _574 = fma(_378, _562, _532);
    float _576 = _566;
    if (_508)
    {
        float _578 = _566 * _544;
        _576 = _578;
    }
    float _580 = _576;
    float _582 = fma(_376, _570, _530);
    float _584 = fma(_572, _568, _556);
    float _586 = fma(_574, _568, _548);
    float _588 = 0.0 + _580;
    float _590 = precise::clamp(_588, 0.0, 1.0);
    float _592 = fma(_582, _568, _546);
    out.m_57.x = _584;
    out.m_57.y = _592;
    out.m_57.z = _586;
    out.m_57.w = _590;
    return out;
}

