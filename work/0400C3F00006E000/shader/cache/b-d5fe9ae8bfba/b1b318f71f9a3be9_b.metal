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
    texture2d<float> fp_t_tcb_10 [[id(6)]];
    sampler fp_t_tcb_10Smplr [[id(7)]];
    texture2d<float> fp_t_tcb_A [[id(8)]];
    sampler fp_t_tcb_ASmplr [[id(9)]];
    texturecube<float> fp_t_tcb_1E [[id(10)]];
    sampler fp_t_tcb_1ESmplr [[id(11)]];
    sampler fp_t_tcb_8Smplr_w [[id(12)]];
    sampler fp_t_tcb_10Smplr_w [[id(13)]];
    sampler fp_t_tcb_ASmplr_w [[id(14)]];
    sampler fp_t_tcb_1ESmplr_w [[id(15)]];
    constant dm_border_t* dm_border [[id(16)]];
};

struct main0_out
{
    float4 m_59 [[color(0)]];
};

struct main0_in
{
    float4 m_52 [[user(locn0)]];
    float4 m_54 [[user(locn1)]];
    float4 m_56 [[user(locn2)]];
    float4 m_65 [[user(locn3)]];
    float4 m_48 [[user(locn4), flat]];
    float4 m_61 [[user(locn5)]];
    float4 m_67 [[user(locn6)]];
    float4 m_50 [[user(locn7), flat]];
    float4 m_44 [[user(locn8)]];
    float4 m_63 [[user(locn9)]];
    float4 m_69 [[user(locn10)]];
    float4 m_46 [[user(locn11)]];
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
    float _90 = 1.0 / _76;
    float _92 = _90 * _82;
    float _94 = _90 * _88;
    float2 _563 = float2(_92, _94);
    float2 _98 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_563, float2(0.0), isnan(_563))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_563, float2(0.0), isnan(_563))).xy;
    float _100 = _98.x;
    float _102 = _98.y;
    float _104 = in.m_46.w;
    float _106 = gl_FragCoord.w;
    float _108 = _104 * _106;
    float _110 = in.m_46.x;
    float _112 = gl_FragCoord.w;
    float _114 = _110 * _112;
    float _116 = in.m_46.y;
    float _118 = gl_FragCoord.w;
    float _120 = _116 * _118;
    float _122 = in.m_44.z;
    float _124 = gl_FragCoord.w;
    float _126 = _122 * _124;
    float _128 = in.m_48.x;
    float _130 = in.m_44.w;
    float _132 = gl_FragCoord.w;
    float _134 = _130 * _132;
    float _136 = _90 * _108;
    float _138 = _90 * _114;
    float _140 = _90 * _120;
    float _142 = _90 * _126;
    float _144 = _128 * 0.20000000298023223876953125;
    float _146 = _90 * _134;
    float _148 = 1.0 / _136;
    float _150 = _138 * _148;
    float _152 = _140 * _148;
    float2 _642 = float2(_150, _152);
    float _154 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_642, float2(0.0), isnan(_642))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_642, float2(0.0), isnan(_642))).x;
    float _156 = fma(_102, _144, _146);
    float _158 = fma(_100, _144, _142);
    float2 _659 = float2(_158, _156);
    float _160 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_659, float2(0.0), isnan(_659))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_659, float2(0.0), isnan(_659))).w;
    float _162 = in.m_50.y;
    float _164 = in.m_50.x;
    float _166 = in.m_50.z;
    float _168 = in.m_46.z;
    float _170 = gl_FragCoord.w;
    float _172 = _168 * _170;
    float _174 = in.m_52.w;
    float _176 = gl_FragCoord.w;
    float _178 = _174 * _176;
    float _180 = in.m_54.w;
    float _182 = gl_FragCoord.w;
    float _184 = _180 * _182;
    float _186 = in.m_56.x;
    float _188 = gl_FragCoord.w;
    float _190 = _186 * _188;
    float _192 = -(*spvDescriptorSet0.fp_c10)._m0[9].w;
    float _194 = _162 + _192;
    float _196 = -(*spvDescriptorSet0.fp_c10)._m0[8].w;
    float _198 = _164 + _196;
    float _200 = -(*spvDescriptorSet0.fp_c10)._m0[10].w;
    float _202 = _166 + _200;
    float _204 = _194 * _194;
    float _206 = fma(_198, _198, _204);
    float _208 = fma(_202, _202, _206);
    float _210 = rsqrt(_208);
    float _212 = _90 * _172;
    float _214 = _212 * _148;
    float _216 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _218 = fma(_214, (*spvDescriptorSet0.fp_c8)._m0[30].w, _216);
    float _220 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _222 = fma(_154, (*spvDescriptorSet0.fp_c8)._m0[30].w, _220);
    float _224 = _90 * _190;
    float _226 = _194 * _210;
    float _228 = _198 * _210;
    float _230 = _202 * _210;
    float _232 = 1.0 / _218;
    float _234 = _226 * (*spvDescriptorSet0.fp_c10)._m0[9].z;
    float _236 = fma(_228, (*spvDescriptorSet0.fp_c10)._m0[8].z, _234);
    float _238 = 1.0 / _222;
    float _240 = fma(_230, (*spvDescriptorSet0.fp_c10)._m0[10].z, _236);
    float _242 = precise::max(0.0, _240);
    float _244 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _246 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _248 = _232 * _246;
    float _250 = precise::min(_242, 0.5);
    float _252 = _90 * _178;
    float _254 = _250 * 2.0;
    float _256 = in.m_52.z;
    float _258 = gl_FragCoord.w;
    float _260 = _256 * _258;
    float _262 = -_252;
    float _264 = fma(_160, _254, _262);
    float _266 = _90 * _184;
    float _268 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _270 = -_248;
    float _272 = fma(_238, _268, _270);
    float _274 = _264 * _266;
    float _276 = _272 * _244;
    float _278 = precise::clamp(_276, 0.0, 1.0);
    float _280 = 0.0 + _274;
    float _282 = precise::clamp(_280, 0.0, 1.0);
    float _284 = _282 * _278;
    float _286 = _284 * _224;
    bool _290 = _286 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _292 = isnan(_286);
    bool _294 = _290 || _292;
    bool _296 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _298 = _294 || _296;
    float _300 = in.m_52.x;
    float _302 = gl_FragCoord.w;
    float _304 = _300 * _302;
    float _306 = in.m_52.y;
    float _308 = gl_FragCoord.w;
    float _310 = _306 * _308;
    float _312 = _248;
    if (!_298)
    {
        discard_fragment();
    }
    float _314 = _90 * _260;
    float _316 = _90 * _304;
    float _318 = _90 * _310;
    if (!_298)
    {
        out.m_59.x = _316;
        out.m_59.y = _318;
        out.m_59.z = _314;
        out.m_59.w = _274;
        return out;
    }
    float _320 = in.m_61.y;
    float _322 = gl_FragCoord.w;
    float _324 = _320 * _322;
    float _326 = in.m_61.x;
    float _328 = gl_FragCoord.w;
    float _330 = _326 * _328;
    float _332 = in.m_61.z;
    float _334 = gl_FragCoord.w;
    float _336 = _332 * _334;
    float _338 = _90 * _324;
    float _340 = _90 * _330;
    float _342 = _90 * _336;
    float _344 = _338 * _338;
    float _346 = in.m_63.x;
    float _348 = gl_FragCoord.w;
    float _350 = _346 * _348;
    float _352 = fma(_340, _340, _344);
    float _354 = fma(_342, _342, _352);
    float _356 = rsqrt(_354);
    float _358 = _340 * _356;
    float _360 = _338 * _356;
    float _362 = _342 * _356;
    float _364 = _90 * _350;
    float _366 = abs(_358);
    float _368 = abs(_360);
    float _370 = precise::max(_366, _368);
    float _372 = precise::min(_364, 1.0);
    float _374 = abs(_362);
    float _376 = precise::max(_374, _370);
    float _378 = 1.0 / _376;
    float _380 = -_378;
    float _382 = _362 * _380;
    float _384 = _358 * _378;
    float _386 = _360 * _378;
    float3 _1000 = float3(_384, _386, _382);
    float3 _390 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1000, float3(0.0), isnan(_1000)), level(_372)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1000, float3(0.0), isnan(_1000)), level(_372)).xyz;
    float _392 = _390.x;
    float _394 = _390.y;
    float _396 = _390.z;
    float _398 = in.m_65.x;
    float _400 = gl_FragCoord.w;
    float _402 = _398 * _400;
    float _404 = in.m_65.z;
    float _406 = gl_FragCoord.w;
    float _408 = _404 * _406;
    float _410 = in.m_65.y;
    float _412 = gl_FragCoord.w;
    float _414 = _410 * _412;
    float _416 = in.m_67.z;
    float _418 = gl_FragCoord.w;
    float _420 = _416 * _418;
    float _422 = in.m_67.x;
    float _424 = gl_FragCoord.w;
    float _426 = _422 * _424;
    float _428 = in.m_67.y;
    float _430 = gl_FragCoord.w;
    float _432 = _428 * _430;
    float _434 = in.m_69.x;
    float _436 = gl_FragCoord.w;
    float _438 = _434 * _436;
    float _440 = in.m_69.y;
    float _442 = gl_FragCoord.w;
    float _444 = _440 * _442;
    float _446 = in.m_69.z;
    float _448 = gl_FragCoord.w;
    float _450 = _446 * _448;
    float _452 = in.m_69.w;
    float _454 = gl_FragCoord.w;
    float _456 = _452 * _454;
    bool _458 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    if (_458)
    {
        float _460 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _462 = _248 + _460;
        _312 = _462;
    }
    float _464 = _312;
    float _466 = _464;
    if (_458)
    {
        float _468 = _464 * 8.0;
        float _470 = precise::clamp(_468, 0.0, 1.0);
        _466 = _470;
    }
    float _472 = _466;
    float _474 = _90 * _402;
    float _476 = _90 * _408;
    float _478 = _90 * _420;
    float _480 = _90 * _426;
    float _482 = _90 * _432;
    float _484 = _90 * _444;
    float _486 = fma(_392, 0.20999999344348907470703125, _474);
    float _488 = _90 * _414;
    float _490 = fma(_396, 0.20999999344348907470703125, _476);
    float _492 = _90 * _438;
    float _494 = _486 + _480;
    float _496 = fma(_394, 0.20999999344348907470703125, _488);
    float _498 = _490 + _478;
    float _500 = 0.0 + _286;
    float _502 = precise::clamp(_500, 0.0, 1.0);
    float _504 = _90 * _450;
    float _506 = _496 + _482;
    float _508 = _90 * _456;
    float _510 = _316 * _494;
    float _512 = _314 * _498;
    float _514 = _318 * _506;
    float _516 = _502;
    if (_458)
    {
        float _518 = _502 * _472;
        _516 = _518;
    }
    float _520 = _516;
    float _522 = fma(_510, _508, _492);
    float _524 = fma(_512, _508, _504);
    float _526 = fma(_514, _508, _484);
    float _528 = 0.0 + _520;
    float _530 = precise::clamp(_528, 0.0, 1.0);
    out.m_59.x = _522;
    out.m_59.y = _526;
    out.m_59.z = _524;
    out.m_59.w = _530;
    return out;
}

