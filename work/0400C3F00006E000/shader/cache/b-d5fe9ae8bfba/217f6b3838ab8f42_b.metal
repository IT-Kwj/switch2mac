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
    constant _16* fp_c15 [[id(2)]];
    constant _16* fp_c8 [[id(3)]];
    texture2d<float> fp_t_tcb_8 [[id(4)]];
    sampler fp_t_tcb_8Smplr [[id(5)]];
    texture2d<float> fp_t_tcb_34 [[id(6)]];
    sampler fp_t_tcb_34Smplr [[id(7)]];
    texture2d<float> fp_t_tcb_A [[id(8)]];
    sampler fp_t_tcb_ASmplr [[id(9)]];
    sampler fp_t_tcb_8Smplr_w [[id(10)]];
    sampler fp_t_tcb_34Smplr_w [[id(11)]];
    sampler fp_t_tcb_ASmplr_w [[id(12)]];
    constant dm_border_t* dm_border [[id(13)]];
};

struct main0_out
{
    float4 m_58 [[color(0)]];
};

struct main0_in
{
    float4 m_45 [[user(locn0)]];
    float4 m_43 [[user(locn1)]];
    float4 m_62 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_39 [[user(locn4)]];
    float4 m_41 [[user(locn5)]];
    float4 m_49 [[user(locn6)]];
    float4 m_55 [[user(locn7)]];
    float4 m_60 [[user(locn8)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], bool gl_FrontFacing [[front_facing]])
{
    main0_out out = {};
    float _69 = gl_FragCoord.w;
    float _71 = in.m_39.x;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = in.m_41.y;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = in.m_39.y;
    float _85 = gl_FragCoord.w;
    float _87 = _83 * _85;
    float _89 = in.m_41.x;
    float _91 = gl_FragCoord.w;
    float _93 = _89 * _91;
    float _95 = 1.0 / _69;
    float _97 = _95 * _75;
    float _99 = _95 * _81;
    float _101 = _95 * _87;
    float _103 = _95 * _93;
    float2 _578 = float2(_97, _101);
    float _105 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_578, float2(0.0), isnan(_578))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_578, float2(0.0), isnan(_578))).w;
    float2 _589 = float2(_103, _99);
    float _107 = dm_bs(spvDescriptorSet0.fp_t_tcb_34.sample(spvDescriptorSet0.fp_t_tcb_34Smplr, select(_589, float2(0.0), isnan(_589))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_34, spvDescriptorSet0.fp_t_tcb_34Smplr_w, select(_589, float2(0.0), isnan(_589))).w;
    float _109 = in.m_43.w;
    float _111 = gl_FragCoord.w;
    float _113 = _109 * _111;
    float _115 = in.m_45.w;
    float _117 = gl_FragCoord.w;
    float _119 = _115 * _117;
    float _121 = in.m_47.x;
    float _123 = gl_FragCoord.w;
    float _125 = _121 * _123;
    float _127 = _95 * _113;
    float _129 = -_127;
    float _131 = _129 + 1.0;
    float _133 = -_127;
    float _135 = _133 + 1.10000002384185791015625;
    float _137 = _105 * _107;
    float _139 = precise::max(_131, _137);
    float _141 = precise::min(_135, _139);
    float _143 = -_131;
    float _145 = _143 + _141;
    float _147 = _95 * _119;
    float _149 = _145 * 9.9999980926513671875;
    float _151 = _147 * _149;
    float _153 = _95 * _125;
    float _155 = 0.0 + _151;
    float _157 = precise::clamp(_155, 0.0, 1.0);
    float _159 = _157 * _153;
    bool _162 = _159 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _164 = isnan(_159);
    bool _166 = _162 || _164;
    bool _168 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _170 = _166 || _168;
    float _172 = in.m_39.z;
    float _174 = gl_FragCoord.w;
    float _176 = _172 * _174;
    float _178 = in.m_39.w;
    float _180 = gl_FragCoord.w;
    float _182 = _178 * _180;
    if (!_170)
    {
        discard_fragment();
    }
    float _184 = _95 * _176;
    float _186 = _95 * _182;
    float2 _706 = float2(_184, _186);
    float3 _190 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_706, float2(0.0), isnan(_706))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_706, float2(0.0), isnan(_706))).xyz;
    float _192 = _190.x;
    float _194 = _190.y;
    float _196 = _190.z;
    float _198 = in.m_49.y;
    float _200 = gl_FragCoord.w;
    float _202 = _198 * _200;
    float _204 = as_type<float>(gl_FrontFacing ? (-1) : 0);
    float _206 = in.m_49.x;
    float _208 = gl_FragCoord.w;
    float _210 = _206 * _208;
    float _212 = in.m_49.z;
    float _214 = gl_FragCoord.w;
    float _216 = _212 * _214;
    float _218 = in.m_55.y;
    float _220 = gl_FragCoord.w;
    float _222 = _218 * _220;
    float _224 = in.m_55.z;
    float _226 = gl_FragCoord.w;
    float _228 = _224 * _226;
    float _230 = in.m_55.x;
    float _232 = gl_FragCoord.w;
    float _234 = _230 * _232;
    float _236 = in.m_43.y;
    float _238 = gl_FragCoord.w;
    float _240 = _236 * _238;
    float _242 = in.m_43.z;
    float _244 = gl_FragCoord.w;
    float _246 = _242 * _244;
    float _248 = in.m_45.x;
    float _250 = gl_FragCoord.w;
    float _252 = _248 * _250;
    float _254 = in.m_45.y;
    float _256 = gl_FragCoord.w;
    float _258 = _254 * _256;
    float _260 = _95 * _202;
    bool _262 = as_type<int>(_204) != 0;
    float _264 = _95 * _210;
    bool _266 = !_262;
    float _268 = -_260;
    float _270 = _266 ? _268 : _260;
    float _272 = _95 * _216;
    bool _274 = !_262;
    float _276 = -_264;
    float _278 = _274 ? _276 : _264;
    float _280 = _95 * _234;
    float _282 = _270 * _270;
    bool _284 = !_262;
    float _286 = -_272;
    float _288 = _284 ? _286 : _272;
    float _290 = _95 * _222;
    float _292 = -(*spvDescriptorSet0.fp_c10)._m0[8].w;
    float _294 = _280 + _292;
    float _296 = fma(_278, _278, _282);
    float _298 = -(*spvDescriptorSet0.fp_c10)._m0[9].w;
    float _300 = _290 + _298;
    float _302 = _95 * _228;
    float _304 = fma(_288, _288, _296);
    float _306 = in.m_43.x;
    float _308 = gl_FragCoord.w;
    float _310 = _306 * _308;
    float _312 = _300 * _300;
    float _314 = -(*spvDescriptorSet0.fp_c10)._m0[10].w;
    float _316 = _302 + _314;
    float _318 = rsqrt(_304);
    float _320 = fma(_294, _294, _312);
    float _322 = fma(_316, _316, _320);
    float _324 = rsqrt(_322);
    float _326 = _270 * _318;
    float _328 = _278 * _318;
    float _330 = _288 * _318;
    float _332 = _95 * _246;
    float _334 = _326 * _326;
    float _336 = -_332;
    float _338 = _336 + 1.0;
    float _340 = fma(_328, _328, _334);
    float _342 = _300 * _324;
    float _344 = _294 * _324;
    float _346 = _316 * _324;
    float _348 = fma(_330, _330, _340);
    float _350 = in.m_45.z;
    float _352 = gl_FragCoord.w;
    float _354 = _350 * _352;
    float _356 = rsqrt(_348);
    float _358 = _326 * _356;
    float _360 = _330 * _356;
    float _362 = _342 * _358;
    float _364 = _328 * _356;
    float _366 = _95 * _258;
    float _368 = fma(_344, _364, _362);
    float _370 = _95 * _252;
    float _372 = _95 * _354;
    float _374 = fma(_346, _360, _368);
    float _376 = _95 * _310;
    float _378 = fma(_374, 0.5, 0.5);
    float _380 = _95 * _240;
    float _382 = -_376;
    float _384 = _382 + 1.0;
    bool _386 = _378 < 0.5;
    float _388 = float(_386);
    float _390 = -_380;
    float _392 = _390 + 1.0;
    float _394 = -_384;
    float _396 = fma(_394, _388, 1.0);
    float _398 = -_392;
    float _400 = fma(_398, _388, 1.0);
    float _402 = -_338;
    float _404 = fma(_402, _388, 1.0);
    float _406 = _370 * _192;
    float _408 = _366 * _194;
    float _410 = _372 * _196;
    float _412 = _396 * _406;
    float _414 = _400 * _408;
    float _416 = _404 * _410;
    if (!_170)
    {
        out.m_58.x = _412;
        out.m_58.y = _414;
        out.m_58.z = _416;
        out.m_58.w = _151;
        return out;
    }
    float _418 = _414 * 0.715200006961822509765625;
    float _420 = in.m_60.w;
    float _422 = gl_FragCoord.w;
    float _424 = _420 * _422;
    float _426 = in.m_60.x;
    float _428 = gl_FragCoord.w;
    float _430 = _426 * _428;
    float _432 = in.m_60.y;
    float _434 = gl_FragCoord.w;
    float _436 = _432 * _434;
    float _438 = fma(_412, 0.2125999927520751953125, _418);
    float _440 = in.m_60.z;
    float _442 = gl_FragCoord.w;
    float _444 = _440 * _442;
    bool _446 = 0.5 <= (*spvDescriptorSet0.fp_c15)._m0[653].w;
    float _448 = fma(_416, 0.072200000286102294921875, _438);
    float _450 = 1.0 / _448;
    float _452 = _450 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _454 = precise::clamp(_452, 0.0, 1.0);
    float _456 = 0.0 + _159;
    float _458 = precise::clamp(_456, 0.0, 1.0);
    float _460 = _95 * _424;
    float _462 = fma(_454, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _464 = _95 * _430;
    float _466 = _462 * _460;
    float _468 = _95 * _436;
    float _470 = _95 * _444;
    float _472 = fma(_412, _466, _464);
    float _474 = fma(_414, _466, _468);
    float _476 = fma(_416, _466, _470);
    bool _478 = !_446;
    float _480 = _458;
    if (!_478)
    {
        float _482 = in.m_62.w;
        float _484 = gl_FragCoord.w;
        float _486 = _482 * _484;
        float _488 = in.m_62.z;
        float _490 = gl_FragCoord.w;
        float _492 = _488 * _490;
        float _494 = _95 * _486;
        float _496 = _95 * _492;
        float _498 = 1.0 / _494;
        float _500 = _496 * _498;
        float _502 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _504 = fma(_500, (*spvDescriptorSet0.fp_c8)._m0[30].w, _502);
        float _506 = 1.0 / _504;
        float _508 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _510 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _512 = fma(_506, _508, _510);
        float _514 = _512 * 8.0;
        float _516 = precise::clamp(_514, 0.0, 1.0);
        float _518 = _458 * _516;
        _480 = _518;
    }
    float _520 = _480;
    float _522 = 0.0 + _520;
    float _524 = precise::clamp(_522, 0.0, 1.0);
    out.m_58.x = _472;
    out.m_58.y = _474;
    out.m_58.z = _476;
    out.m_58.w = _524;
    return out;
}

