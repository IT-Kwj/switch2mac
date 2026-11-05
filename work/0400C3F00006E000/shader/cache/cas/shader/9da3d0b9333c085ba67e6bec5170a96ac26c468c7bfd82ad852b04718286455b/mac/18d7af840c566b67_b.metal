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
    texture2d<float> fp_t_tcb_A [[id(6)]];
    sampler fp_t_tcb_ASmplr [[id(7)]];
    texture2d<float> fp_t_tcb_C [[id(8)]];
    sampler fp_t_tcb_CSmplr [[id(9)]];
    texture2d<float> fp_t_tcb_8 [[id(10)]];
    sampler fp_t_tcb_8Smplr [[id(11)]];
    sampler fp_t_tcb_10Smplr_w [[id(12)]];
    sampler fp_t_tcb_ASmplr_w [[id(13)]];
    sampler fp_t_tcb_CSmplr_w [[id(14)]];
    sampler fp_t_tcb_8Smplr_w [[id(15)]];
    constant dm_border_t* dm_border [[id(16)]];
};

struct main0_out
{
    float4 m_62 [[color(0)]];
};

struct main0_in
{
    float4 m_53 [[user(locn0)]];
    float4 m_59 [[user(locn1)]];
    float4 m_49 [[user(locn2)]];
    float4 m_41 [[user(locn3)]];
    float4 m_57 [[user(locn4)]];
    float4 m_55 [[user(locn5)]];
    float4 m_45 [[user(locn6)]];
    float4 m_47 [[user(locn7)]];
    float4 m_51 [[user(locn8)]];
    float4 m_43 [[user(locn9)]];
    float4 m_64 [[user(locn10)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _71 = gl_FragCoord.w;
    float _73 = in.m_41.w;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = in.m_43.y;
    float _81 = gl_FragCoord.w;
    float _83 = _79 * _81;
    float _85 = in.m_41.x;
    float _87 = gl_FragCoord.w;
    float _89 = _85 * _87;
    float _91 = in.m_41.y;
    float _93 = gl_FragCoord.w;
    float _95 = _91 * _93;
    float _97 = in.m_45.z;
    float _99 = gl_FragCoord.w;
    float _101 = _97 * _99;
    float _103 = in.m_47.x;
    float _105 = gl_FragCoord.w;
    float _107 = _103 * _105;
    float _109 = (*spvDescriptorSet0.fp_c10)._m0[2].x * (*spvDescriptorSet0.fp_c9)._m0[194].z;
    float _111 = 1.0 / _71;
    float _113 = _111 * _77;
    float _115 = _111 * _83;
    float _117 = _111 * _89;
    float _119 = _111 * _95;
    float _121 = _111 * _107;
    float _123 = -_109;
    float _125 = fma(_115, (*spvDescriptorSet0.fp_c9)._m0[194].w, _123);
    float _127 = 1.0 / _113;
    float _129 = _125 + 0.5;
    float _131 = _117 * _127;
    float _133 = _119 * _127;
    float _135 = _111 * _101;
    float2 _639 = float2(_131, _133);
    float _137 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_639, float2(0.0), isnan(_639))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_639, float2(0.0), isnan(_639))).x;
    float2 _650 = float2(_135, _129);
    float4 _140 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_650, float2(0.0), isnan(_650))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_650, float2(0.0), isnan(_650))).xyzw;
    float _142 = _140.x;
    float _144 = _140.y;
    float _146 = _140.z;
    float _148 = _140.w;
    float2 _666 = float2(_121, _129);
    float4 _150 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_666, float2(0.0), isnan(_666))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_666, float2(0.0), isnan(_666))).xyzw;
    float _152 = _150.x;
    float _154 = _150.y;
    float _156 = _150.z;
    float _158 = _150.w;
    float _160 = in.m_49.y;
    float _162 = gl_FragCoord.w;
    float _164 = _160 * _162;
    float _166 = in.m_49.x;
    float _168 = gl_FragCoord.w;
    float _170 = _166 * _168;
    float _172 = in.m_49.z;
    float _174 = gl_FragCoord.w;
    float _176 = _172 * _174;
    float _178 = in.m_51.y;
    float _180 = gl_FragCoord.w;
    float _182 = _178 * _180;
    float _184 = in.m_51.x;
    float _186 = gl_FragCoord.w;
    float _188 = _184 * _186;
    float _190 = in.m_51.z;
    float _192 = gl_FragCoord.w;
    float _194 = _190 * _192;
    float _196 = in.m_41.z;
    float _198 = gl_FragCoord.w;
    float _200 = _196 * _198;
    float _202 = _111 * _164;
    float _204 = _111 * _170;
    float _206 = _202 * _202;
    float _208 = _111 * _176;
    float _210 = fma(_204, _204, _206);
    float _212 = _111 * _182;
    float _214 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _216 = _214 + (*spvDescriptorSet0.fp_c9)._m0[139].w;
    float _218 = fma(_208, _208, _210);
    float _220 = 1.0 / _216;
    float _222 = rsqrt(_218);
    float _224 = _202 * _222;
    float _226 = _208 * _222;
    float _228 = in.m_53.w;
    float _230 = gl_FragCoord.w;
    float _232 = _228 * _230;
    float _234 = _212 * _224;
    float _236 = _111 * _188;
    float _238 = _204 * _222;
    float _240 = _111 * _194;
    float _242 = in.m_55.w;
    float _244 = gl_FragCoord.w;
    float _246 = _242 * _244;
    float _248 = fma(_236, _238, _234);
    float _250 = fma(_240, _226, _248);
    float _252 = _111 * _200;
    float _254 = abs(_250);
    float _256 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _258 = _254 + _256;
    float _260 = _252 * _127;
    float _262 = _258 * _220;
    float _264 = precise::clamp(_262, 0.0, 1.0);
    float _266 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _268 = fma(_260, (*spvDescriptorSet0.fp_c8)._m0[30].w, _266);
    float _270 = in.m_57.x;
    float _272 = gl_FragCoord.w;
    float _274 = _270 * _272;
    float _276 = fma(_264, -2.0, 3.0);
    float _278 = _264 * _264;
    float _280 = 1.0 / _268;
    float _282 = _276 * _278;
    float _284 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _286 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _288 = _280 * _286;
    float _290 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _292 = fma(_137, (*spvDescriptorSet0.fp_c8)._m0[30].w, _290);
    float _294 = _111 * _246;
    float _296 = _148 + _158;
    float _298 = 1.0 / _292;
    float _300 = _296 * _294;
    float _302 = _111 * _232;
    float _304 = _302 * _300;
    float _306 = fma(_288, 0.0500000007450580596923828125, -0.25);
    float _308 = precise::clamp(_306, 0.0, 1.0);
    float _310 = _304 * _308;
    float _312 = precise::clamp(_310, 0.0, 1.0);
    float _314 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _316 = -_288;
    float _318 = fma(_298, _314, _316);
    float _320 = _318 * _284;
    float _322 = precise::clamp(_320, 0.0, 1.0);
    float _324 = _111 * _274;
    float _326 = _312 * _322;
    float _328 = _326 * _282;
    float _330 = _328 * _324;
    bool _334 = _330 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _336 = isnan(_330);
    bool _338 = _334 || _336;
    bool _340 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _342 = _338 || _340;
    float _344 = in.m_45.x;
    float _346 = gl_FragCoord.w;
    float _348 = _344 * _346;
    float _350 = in.m_45.y;
    float _352 = gl_FragCoord.w;
    float _354 = _350 * _352;
    if (!_342)
    {
        discard_fragment();
    }
    float _356 = _111 * _348;
    float _358 = _111 * _354;
    float2 _965 = float2(_356, _358);
    float3 _362 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_965, float2(0.0), isnan(_965))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_965, float2(0.0), isnan(_965))).xyz;
    float _364 = _362.x;
    float _366 = _362.y;
    float _368 = _362.z;
    float _370 = in.m_59.x;
    float _372 = gl_FragCoord.w;
    float _374 = _370 * _372;
    float _376 = in.m_59.y;
    float _378 = gl_FragCoord.w;
    float _380 = _376 * _378;
    float _382 = in.m_59.z;
    float _384 = gl_FragCoord.w;
    float _386 = _382 * _384;
    float _388 = in.m_53.x;
    float _390 = gl_FragCoord.w;
    float _392 = _388 * _390;
    float _394 = in.m_53.y;
    float _396 = gl_FragCoord.w;
    float _398 = _394 * _396;
    float _400 = in.m_53.z;
    float _402 = gl_FragCoord.w;
    float _404 = _400 * _402;
    float _406 = fma(_142, _142, _364);
    float _408 = fma(_144, _144, _366);
    float _410 = fma(_146, _146, _368);
    float _412 = _111 * _374;
    float _414 = fma(_152, _152, _406);
    float _416 = fma(_154, _154, _408);
    float _418 = fma(_156, _156, _410);
    float _420 = _111 * _380;
    float _422 = -_414;
    float _424 = _422 + 1.0;
    float _426 = -_416;
    float _428 = _426 + 1.0;
    float _430 = _111 * _386;
    float _432 = -_418;
    float _434 = _432 + 1.0;
    float _436 = _412 * _424;
    float _438 = _420 * _428;
    float _440 = _111 * _392;
    float _442 = _430 * _434;
    float _444 = _111 * _398;
    float _446 = _111 * _404;
    float _448 = fma(_414, _440, _436);
    float _450 = fma(_416, _444, _438);
    float _452 = fma(_418, _446, _442);
    if (!_342)
    {
        out.m_62.x = _448;
        out.m_62.y = _450;
        out.m_62.z = _452;
        out.m_62.w = _312;
        return out;
    }
    float _454 = _450 * 0.715200006961822509765625;
    float _456 = in.m_64.w;
    float _458 = gl_FragCoord.w;
    float _460 = _456 * _458;
    float _462 = in.m_64.x;
    float _464 = gl_FragCoord.w;
    float _466 = _462 * _464;
    float _468 = in.m_64.y;
    float _470 = gl_FragCoord.w;
    float _472 = _468 * _470;
    float _474 = fma(_448, 0.2125999927520751953125, _454);
    float _476 = in.m_64.z;
    float _478 = gl_FragCoord.w;
    float _480 = _476 * _478;
    float _482 = fma(_452, 0.072200000286102294921875, _474);
    bool _484 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _486 = 1.0 / _482;
    float _488 = (*spvDescriptorSet0.fp_c15)._m0[653].w;
    if (_484)
    {
        float _490 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _492 = _288 + _490;
        _488 = _492;
    }
    float _494 = _488;
    float _496 = _486 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _498 = precise::clamp(_496, 0.0, 1.0);
    float _500 = fma(_498, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _502 = _111 * _460;
    float _504 = _111 * _472;
    float _506 = _500 * _502;
    float _508 = 0.0 + _330;
    float _510 = precise::clamp(_508, 0.0, 1.0);
    float _512 = _502;
    float _514 = _510;
    if (_484)
    {
        float _516 = _494 * 8.0;
        float _518 = precise::clamp(_516, 0.0, 1.0);
        _512 = _518;
    }
    float _520 = _512;
    float _522 = _111 * _466;
    float _524 = _111 * _480;
    float _526 = fma(_450, _506, _504);
    if (_484)
    {
        float _528 = _510 * _520;
        _514 = _528;
    }
    float _530 = _514;
    float _532 = fma(_448, _506, _522);
    float _534 = fma(_452, _506, _524);
    float _536 = 0.0 + _530;
    float _538 = precise::clamp(_536, 0.0, 1.0);
    out.m_62.x = _532;
    out.m_62.y = _526;
    out.m_62.z = _534;
    out.m_62.w = _538;
    return out;
}

