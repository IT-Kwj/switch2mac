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
    texture2d_array<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_A [[id(7)]];
    sampler fp_t_tcb_ASmplr [[id(8)]];
    sampler fp_t_tcb_10Smplr_w [[id(9)]];
    sampler fp_t_tcb_8Smplr_w [[id(10)]];
    sampler fp_t_tcb_ASmplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_57 [[color(0)]];
};

struct main0_in
{
    float4 m_48 [[user(locn0)]];
    float4 m_52 [[user(locn1)]];
    float4 m_54 [[user(locn2)]];
    float4 m_44 [[user(locn3)]];
    float4 m_50 [[user(locn4)]];
    float4 m_46 [[user(locn5), flat]];
    float4 m_42 [[user(locn6)]];
    float4 m_40 [[user(locn7), flat]];
    float4 m_59 [[user(locn9)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _66 = gl_FragCoord.w;
    float _68 = in.m_40.x;
    float _70 = in.m_42.w;
    float _72 = gl_FragCoord.w;
    float _74 = _70 * _72;
    float _76 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[22].x;
    float _78 = in.m_42.x;
    float _80 = gl_FragCoord.w;
    float _82 = _78 * _80;
    float _84 = in.m_44.x;
    float _86 = gl_FragCoord.w;
    float _88 = _84 * _86;
    float _90 = in.m_42.y;
    float _92 = gl_FragCoord.w;
    float _94 = _90 * _92;
    float _96 = in.m_44.y;
    float _98 = gl_FragCoord.w;
    float _100 = _96 * _98;
    float _102 = in.m_44.z;
    float _104 = gl_FragCoord.w;
    float _106 = _102 * _104;
    float _108 = in.m_44.w;
    float _110 = gl_FragCoord.w;
    float _112 = _108 * _110;
    float _114 = 1.0 / _66;
    float _116 = _68 + 1.0;
    float _118 = _116 * _76;
    float _120 = rint(_68);
    float _122 = precise::max(_120, 0.0);
    uint _125 = uint(_122);
    uint _127 = clamp(_125, 0u, 65535u);
    float _129 = floor(_118);
    float _131 = _114 * _74;
    float _133 = _114 * _82;
    float _135 = _114 * _94;
    float _137 = _114 * _88;
    float _139 = _114 * _106;
    float _141 = 1.0 / _131;
    float _143 = -_129;
    float _145 = fma(_143, (*spvDescriptorSet0.fp_c9)._m0[22].x, _116);
    float _147 = _114 * _100;
    float _149 = rint(_145);
    float _151 = precise::max(_149, 0.0);
    uint _153 = uint(_151);
    uint _155 = clamp(_153, 0u, 65535u);
    float _157 = _133 * _141;
    float _159 = _135 * _141;
    float _161 = _114 * _112;
    float2 _672 = float2(_157, _159);
    float _163 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_672, float2(0.0), isnan(_672))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_672, float2(0.0), isnan(_672))).x;
    float3 _686 = float3(_137, _147, float(int(_127)));
    float3 _690 = select(_686, float3(0.0), isnan(_686));
    float4 _166 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _690.xy, uint(rint(_690.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _690.xy, uint(rint(_690.z))).xyzw;
    float _168 = _166.x;
    float _170 = _166.y;
    float _172 = _166.z;
    float _174 = _166.w;
    float3 _707 = float3(_137, _147, float(int(_155)));
    float3 _709 = select(_707, float3(0.0), isnan(_707));
    float4 _176 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _709.xy, uint(rint(_709.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _709.xy, uint(rint(_709.z))).xyzw;
    float _178 = _176.x;
    float _180 = _176.y;
    float _182 = _176.z;
    float _184 = _176.w;
    float2 _723 = float2(_139, _161);
    float4 _186 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_723, float2(0.0), isnan(_723))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_723, float2(0.0), isnan(_723))).xyzw;
    float _188 = _186.x;
    float _190 = _186.y;
    float _192 = _186.z;
    float _194 = _186.w;
    float _196 = in.m_46.y;
    float _198 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[22].y;
    float _200 = in.m_42.z;
    float _202 = gl_FragCoord.w;
    float _204 = _200 * _202;
    float _206 = in.m_48.w;
    float _208 = gl_FragCoord.w;
    float _210 = _206 * _208;
    float _212 = in.m_50.w;
    float _214 = gl_FragCoord.w;
    float _216 = _212 * _214;
    float _218 = in.m_52.w;
    float _220 = gl_FragCoord.w;
    float _222 = _218 * _220;
    float _224 = in.m_54.x;
    float _226 = gl_FragCoord.w;
    float _228 = _224 * _226;
    float _230 = _196 * _198;
    float _232 = _114 * _204;
    float _234 = _230 * _198;
    float _236 = _232 * _141;
    float _238 = floor(_234);
    float _240 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _242 = fma(_236, (*spvDescriptorSet0.fp_c8)._m0[30].w, _240);
    float _244 = 1.0 / _242;
    float _246 = -_238;
    float _248 = fma(_246, (*spvDescriptorSet0.fp_c9)._m0[22].y, _230);
    float _250 = _248 + 9.9999997473787516355514526367188e-05;
    float _252 = floor(_250);
    float _254 = -_252;
    float _256 = _250 + _254;
    float _258 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _260 = in.m_52.x;
    float _262 = gl_FragCoord.w;
    float _264 = _260 * _262;
    float _266 = in.m_48.y;
    float _268 = gl_FragCoord.w;
    float _270 = _266 * _268;
    float _272 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _274 = fma(_163, (*spvDescriptorSet0.fp_c8)._m0[30].w, _272);
    float _276 = _114 * _216;
    float _278 = 1.0 / _274;
    float _280 = -_174;
    float _282 = _280 + _184;
    float _284 = fma(_256, _282, _174);
    float _286 = _114 * _210;
    float _288 = _284 * _194;
    float _290 = -_286;
    float _292 = fma(_288, _276, _290);
    float _294 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _296 = _244 * _294;
    float _298 = _114 * _222;
    float _300 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _302 = -_296;
    float _304 = fma(_278, _300, _302);
    float _306 = _298 * _292;
    float _308 = _304 * _258;
    float _310 = precise::clamp(_308, 0.0, 1.0);
    float _312 = 0.0 + _306;
    float _314 = precise::clamp(_312, 0.0, 1.0);
    float _316 = _114 * _228;
    float _318 = _314 * _310;
    float _320 = _318 * _316;
    bool _324 = _320 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _326 = isnan(_320);
    bool _328 = _324 || _326;
    bool _330 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _332 = _328 || _330;
    float _334 = in.m_48.x;
    float _336 = gl_FragCoord.w;
    float _338 = _334 * _336;
    float _340 = in.m_48.z;
    float _342 = gl_FragCoord.w;
    float _344 = _340 * _342;
    float _346 = in.m_52.z;
    float _348 = gl_FragCoord.w;
    float _350 = _346 * _348;
    float _352 = in.m_52.y;
    float _354 = gl_FragCoord.w;
    float _356 = _352 * _354;
    float _358 = in.m_50.x;
    float _360 = gl_FragCoord.w;
    float _362 = _358 * _360;
    float _364 = _296;
    float _366 = _188;
    if (!_332)
    {
        discard_fragment();
    }
    float _368 = in.m_50.y;
    float _370 = gl_FragCoord.w;
    float _372 = _368 * _370;
    float _374 = in.m_50.z;
    float _376 = gl_FragCoord.w;
    float _378 = _374 * _376;
    float _380 = -_168;
    float _382 = _380 + _178;
    float _384 = -_172;
    float _386 = _384 + _182;
    float _388 = -_170;
    float _390 = _388 + _180;
    float _392 = _188 * _188;
    float _394 = fma(_256, _382, _168);
    float _396 = fma(_256, _386, _172);
    float _398 = fma(_256, _390, _170);
    float _400 = _114 * _264;
    float _402 = _394 * _394;
    float _404 = _192 * _192;
    float _406 = _396 * _396;
    float _408 = _190 * _190;
    float _410 = _402 * _392;
    float _412 = _114 * _338;
    float _414 = _114 * _344;
    float _416 = _114 * _350;
    float _418 = _398 * _398;
    float _420 = _114 * _270;
    float _422 = _114 * _356;
    float _424 = _406 * _404;
    float _426 = -_400;
    float _428 = _412 + _426;
    float _430 = -_416;
    float _432 = _414 + _430;
    float _434 = _418 * _408;
    float _436 = -_422;
    float _438 = _420 + _436;
    float _440 = fma(_410, _428, _400);
    float _442 = fma(_424, _432, _416);
    float _444 = _114 * _362;
    float _446 = fma(_434, _438, _422);
    float _448 = _114 * _372;
    float _450 = _114 * _378;
    float _452 = _440 * _444;
    float _454 = _446 * _448;
    float _456 = _442 * _450;
    if (!_332)
    {
        out.m_57.x = _452;
        out.m_57.y = _454;
        out.m_57.z = _456;
        out.m_57.w = _306;
        return out;
    }
    float _458 = _454 * 0.715200006961822509765625;
    float _460 = in.m_59.w;
    float _462 = gl_FragCoord.w;
    float _464 = _460 * _462;
    float _466 = in.m_59.y;
    float _468 = gl_FragCoord.w;
    float _470 = _466 * _468;
    float _472 = in.m_59.x;
    float _474 = gl_FragCoord.w;
    float _476 = _472 * _474;
    float _478 = fma(_452, 0.2125999927520751953125, _458);
    float _480 = in.m_59.z;
    float _482 = gl_FragCoord.w;
    float _484 = _480 * _482;
    float _486 = fma(_456, 0.072200000286102294921875, _478);
    bool _488 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _490 = 1.0 / _486;
    if (_488)
    {
        float _492 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _494 = _296 + _492;
        _364 = _494;
    }
    float _496 = _364;
    if (_488)
    {
        float _498 = _496 * 8.0;
        float _500 = precise::clamp(_498, 0.0, 1.0);
        _366 = _500;
    }
    float _502 = _366;
    float _504 = _490 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _506 = precise::clamp(_504, 0.0, 1.0);
    float _508 = fma(_506, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _510 = _114 * _464;
    float _512 = _114 * _470;
    float _514 = _114 * _476;
    float _516 = _508 * _510;
    float _518 = 0.0 + _320;
    float _520 = precise::clamp(_518, 0.0, 1.0);
    float _522 = _114 * _484;
    float _524 = fma(_452, _516, _514);
    float _526 = _520;
    if (_488)
    {
        float _528 = _520 * _502;
        _526 = _528;
    }
    float _530 = _526;
    float _532 = fma(_454, _516, _512);
    float _534 = fma(_456, _516, _522);
    float _536 = 0.0 + _530;
    float _538 = precise::clamp(_536, 0.0, 1.0);
    out.m_57.x = _524;
    out.m_57.y = _532;
    out.m_57.z = _534;
    out.m_57.w = _538;
    return out;
}

