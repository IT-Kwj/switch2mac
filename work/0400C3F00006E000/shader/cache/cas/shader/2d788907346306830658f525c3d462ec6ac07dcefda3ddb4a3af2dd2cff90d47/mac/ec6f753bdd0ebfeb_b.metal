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
    constant _16* fp_c10 [[id(2)]];
    constant _16* fp_c15 [[id(3)]];
    texture2d<float> fp_t_tcb_8 [[id(4)]];
    sampler fp_t_tcb_8Smplr [[id(5)]];
    texture2d<float> fp_t_tcb_10 [[id(6)]];
    sampler fp_t_tcb_10Smplr [[id(7)]];
    texture2d<float> fp_t_tcb_A [[id(8)]];
    sampler fp_t_tcb_ASmplr [[id(9)]];
    texture2d<float> fp_t_tcb_C [[id(10)]];
    sampler fp_t_tcb_CSmplr [[id(11)]];
    sampler fp_t_tcb_8Smplr_w [[id(12)]];
    sampler fp_t_tcb_10Smplr_w [[id(13)]];
    sampler fp_t_tcb_ASmplr_w [[id(14)]];
    sampler fp_t_tcb_CSmplr_w [[id(15)]];
    constant dm_border_t* dm_border [[id(16)]];
};

struct main0_out
{
    float4 m_56 [[color(0)]];
};

struct main0_in
{
    float4 m_45 [[user(locn0)]];
    float4 m_47 [[user(locn1)]];
    float4 m_41 [[user(locn2)]];
    float4 m_43 [[user(locn3)]];
    float4 m_49 [[user(locn4)]];
    float4 m_53 [[user(locn5), flat]];
    float4 m_51 [[user(locn7)]];
    float4 m_58 [[user(locn8)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _65 = gl_FragCoord.w;
    float _67 = in.m_41.x;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = in.m_41.y;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = 1.0 / _65;
    float _81 = _79 * _71;
    float _83 = _79 * _77;
    float2 _609 = float2(_81, _83);
    float2 _87 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_609, float2(0.0), isnan(_609))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_609, float2(0.0), isnan(_609))).xy;
    float _89 = _87.x;
    float _91 = _87.y;
    float _93 = in.m_43.w;
    float _95 = gl_FragCoord.w;
    float _97 = _93 * _95;
    float _99 = in.m_41.z;
    float _101 = gl_FragCoord.w;
    float _103 = _99 * _101;
    float _105 = in.m_41.w;
    float _107 = gl_FragCoord.w;
    float _109 = _105 * _107;
    float _111 = in.m_43.x;
    float _113 = gl_FragCoord.w;
    float _115 = _111 * _113;
    float _117 = in.m_43.y;
    float _119 = gl_FragCoord.w;
    float _121 = _117 * _119;
    float _123 = _79 * _97;
    float _125 = _79 * _103;
    float _127 = _79 * _109;
    float _129 = _79 * _115;
    float _131 = 1.0 / _123;
    float _133 = _129 * _131;
    float _135 = _89 * _89;
    float _137 = _91 * _91;
    float _139 = _79 * _121;
    float _141 = _135 * (*spvDescriptorSet0.fp_c9)._m0[194].w;
    float _143 = _137 * (*spvDescriptorSet0.fp_c9)._m0[194].w;
    float _145 = _139 * _131;
    float _147 = _125 + _141;
    float _149 = _127 + _143;
    float2 _705 = float2(_133, _145);
    float _151 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_705, float2(0.0), isnan(_705))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_705, float2(0.0), isnan(_705))).x;
    float2 _713 = float2(_147, _149);
    float4 _154 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_713, float2(0.0), isnan(_713))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_713, float2(0.0), isnan(_713))).xyzw;
    float _156 = _154.x;
    float _158 = _154.y;
    float _160 = _154.z;
    float _162 = _154.w;
    float _164 = in.m_43.z;
    float _166 = gl_FragCoord.w;
    float _168 = _164 * _166;
    float _170 = in.m_45.w;
    float _172 = gl_FragCoord.w;
    float _174 = _170 * _172;
    float _176 = in.m_47.w;
    float _178 = gl_FragCoord.w;
    float _180 = _176 * _178;
    float _182 = in.m_49.x;
    float _184 = gl_FragCoord.w;
    float _186 = _182 * _184;
    float _188 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _190 = _79 * _168;
    float _192 = _190 * _131;
    float _194 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _196 = fma(_192, (*spvDescriptorSet0.fp_c8)._m0[30].w, _194);
    float _198 = _79 * _174;
    float _200 = 1.0 / _196;
    float _202 = _79 * _180;
    float _204 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _206 = _200 * _204;
    float _208 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _210 = fma(_151, (*spvDescriptorSet0.fp_c8)._m0[30].w, _208);
    float _212 = 1.0 / _210;
    float _214 = _162 * _198;
    float _216 = _202 * _214;
    float _218 = 0.0 + _216;
    float _220 = precise::clamp(_218, 0.0, 1.0);
    float _222 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _224 = -_206;
    float _226 = fma(_212, _222, _224);
    float _228 = _226 * _188;
    float _230 = precise::clamp(_228, 0.0, 1.0);
    float _232 = _79 * _186;
    float _234 = _220 * _230;
    float _236 = _234 * _232;
    bool _240 = _236 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _242 = isnan(_236);
    bool _244 = _240 || _242;
    bool _246 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _248 = _244 || _246;
    float _250 = in.m_51.y;
    float _252 = gl_FragCoord.w;
    float _254 = _250 * _252;
    float _256 = in.m_51.x;
    float _258 = gl_FragCoord.w;
    float _260 = _256 * _258;
    if (!_248)
    {
        discard_fragment();
    }
    float _262 = _79 * _254;
    float _264 = _79 * _260;
    float _266 = (*spvDescriptorSet0.fp_c10)._m0[9].w * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _268 = _262 * (*spvDescriptorSet0.fp_c8)._m0[0].y;
    float _270 = _262 * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _272 = _262 * (*spvDescriptorSet0.fp_c8)._m0[2].y;
    float _274 = fma((*spvDescriptorSet0.fp_c10)._m0[8].w, (*spvDescriptorSet0.fp_c8)._m0[1].x, _266);
    float _276 = fma(_264, (*spvDescriptorSet0.fp_c8)._m0[0].x, _268);
    float _278 = fma(_264, (*spvDescriptorSet0.fp_c8)._m0[1].x, _270);
    float _280 = fma(_264, (*spvDescriptorSet0.fp_c8)._m0[2].x, _272);
    float _282 = in.m_51.z;
    float _284 = gl_FragCoord.w;
    float _286 = _282 * _284;
    float _288 = _79 * _286;
    float _290 = fma(_288, (*spvDescriptorSet0.fp_c8)._m0[2].z, _280);
    float _292 = fma(_288, (*spvDescriptorSet0.fp_c8)._m0[0].z, _276);
    float _294 = fma(_288, (*spvDescriptorSet0.fp_c8)._m0[1].z, _278);
    float _296 = (*spvDescriptorSet0.fp_c10)._m0[9].w * (*spvDescriptorSet0.fp_c8)._m0[0].y;
    float _298 = _290 + (*spvDescriptorSet0.fp_c8)._m0[2].w;
    float _300 = (*spvDescriptorSet0.fp_c10)._m0[9].w * (*spvDescriptorSet0.fp_c8)._m0[2].y;
    float _302 = _292 + (*spvDescriptorSet0.fp_c8)._m0[0].w;
    float _304 = fma((*spvDescriptorSet0.fp_c10)._m0[8].w, (*spvDescriptorSet0.fp_c8)._m0[0].x, _296);
    float _306 = _294 + (*spvDescriptorSet0.fp_c8)._m0[1].w;
    float _308 = fma((*spvDescriptorSet0.fp_c10)._m0[8].w, (*spvDescriptorSet0.fp_c8)._m0[2].x, _300);
    float _310 = 1.0 / _298;
    float _312 = fma((*spvDescriptorSet0.fp_c10)._m0[10].w, (*spvDescriptorSet0.fp_c8)._m0[2].z, _308);
    float _314 = fma((*spvDescriptorSet0.fp_c10)._m0[10].w, (*spvDescriptorSet0.fp_c8)._m0[0].z, _304);
    float _316 = fma((*spvDescriptorSet0.fp_c10)._m0[10].w, (*spvDescriptorSet0.fp_c8)._m0[1].z, _274);
    float _318 = _312 + (*spvDescriptorSet0.fp_c8)._m0[2].w;
    float _320 = _314 + (*spvDescriptorSet0.fp_c8)._m0[0].w;
    float _322 = _316 + (*spvDescriptorSet0.fp_c8)._m0[1].w;
    float _324 = _318 * _310;
    float _326 = in.m_53.x;
    float _328 = -_320;
    float _330 = fma(_302, _324, _328);
    float _332 = -_324;
    float _334 = fma(_306, _332, _322);
    float _336 = fma(_330, (*spvDescriptorSet0.fp_c9)._m0[194].y, _326);
    float _338 = fma(_334, (*spvDescriptorSet0.fp_c9)._m0[194].y, _326);
    float _340 = (*spvDescriptorSet0.fp_c10)._m0[2].x * 0.0166666693985462188720703125;
    float _342 = fma(_338, 1.125, 0.5);
    float _344 = _340 * (*spvDescriptorSet0.fp_c9)._m0[194].x;
    float _346 = _338 + _344;
    float _348 = fma(_344, 0.75, _342);
    float _350 = fma(_336, 1.125, 0.5);
    float _352 = fma(_143, 0.5, _346);
    float _354 = fma(_143, 0.5, _348);
    float _356 = fma(_141, 0.5, _336);
    float _358 = fma(_141, 0.5, _350);
    float2 _1066 = float2(_356, _352);
    float3 _362 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1066, float2(0.0), isnan(_1066))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1066, float2(0.0), isnan(_1066))).xyz;
    float _364 = _362.x;
    float _366 = _362.y;
    float _368 = _362.z;
    float2 _1080 = float2(_358, _354);
    float3 _370 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1080, float2(0.0), isnan(_1080))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1080, float2(0.0), isnan(_1080))).xyz;
    float _372 = _370.x;
    float _374 = _370.y;
    float _376 = _370.z;
    float _378 = in.m_47.x;
    float _380 = gl_FragCoord.w;
    float _382 = _378 * _380;
    float _384 = in.m_47.y;
    float _386 = gl_FragCoord.w;
    float _388 = _384 * _386;
    float _390 = in.m_47.z;
    float _392 = gl_FragCoord.w;
    float _394 = _390 * _392;
    float _396 = in.m_45.x;
    float _398 = gl_FragCoord.w;
    float _400 = _396 * _398;
    float _402 = in.m_45.y;
    float _404 = gl_FragCoord.w;
    float _406 = _402 * _404;
    float _408 = in.m_45.z;
    float _410 = gl_FragCoord.w;
    float _412 = _408 * _410;
    float _414 = _156 * _156;
    float _416 = _158 * _158;
    float _418 = _160 * _160;
    float _420 = _79 * _388;
    float _422 = _79 * _400;
    float _424 = _79 * _412;
    float _426 = _364 * _364;
    float _428 = _372 * _372;
    float _430 = _428 * 0.5;
    float _432 = _366 * _366;
    float _434 = _368 * _368;
    float _436 = _374 * _374;
    float _438 = _436 * 0.5;
    float _440 = _376 * _376;
    float _442 = _440 * 0.5;
    float _444 = precise::max(_426, _430);
    float _446 = _79 * _382;
    float _448 = _79 * _394;
    float _450 = precise::max(_432, _438);
    float _452 = precise::max(_434, _442);
    float _454 = fma(_444, (*spvDescriptorSet0.fp_c9)._m0[194].z, _414);
    float _456 = fma(_450, (*spvDescriptorSet0.fp_c9)._m0[194].z, _416);
    float _458 = fma(_452, (*spvDescriptorSet0.fp_c9)._m0[194].z, _418);
    float _460 = -_454;
    float _462 = _460 + 1.0;
    float _464 = -_456;
    float _466 = _464 + 1.0;
    float _468 = -_458;
    float _470 = _468 + 1.0;
    float _472 = _446 * _462;
    float _474 = _420 * _466;
    float _476 = _79 * _406;
    float _478 = _448 * _470;
    float _480 = fma(_454, _422, _472);
    float _482 = fma(_456, _476, _474);
    float _484 = fma(_458, _424, _478);
    float _486 = fma(_414, _414, _480);
    float _488 = fma(_416, _416, _482);
    float _490 = fma(_418, _418, _484);
    float _492 = _416;
    if (!_248)
    {
        out.m_56.x = _486;
        out.m_56.y = _488;
        out.m_56.z = _490;
        out.m_56.w = _216;
        return out;
    }
    float _494 = _488 * 0.715200006961822509765625;
    float _496 = in.m_58.w;
    float _498 = gl_FragCoord.w;
    float _500 = _496 * _498;
    float _502 = in.m_58.x;
    float _504 = gl_FragCoord.w;
    float _506 = _502 * _504;
    float _508 = in.m_58.y;
    float _510 = gl_FragCoord.w;
    float _512 = _508 * _510;
    float _514 = fma(_486, 0.2125999927520751953125, _494);
    float _516 = in.m_58.z;
    float _518 = gl_FragCoord.w;
    float _520 = _516 * _518;
    bool _522 = 0.5 <= (*spvDescriptorSet0.fp_c15)._m0[653].w;
    float _524 = fma(_490, 0.072200000286102294921875, _514);
    float _526 = 1.0 / _524;
    if (_522)
    {
        float _528 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _530 = _206 + _528;
        _492 = _530;
    }
    float _532 = _492;
    float _534 = _526 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _536 = precise::clamp(_534, 0.0, 1.0);
    float _538 = fma(_536, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _540 = _79 * _500;
    float _542 = _79 * _512;
    float _544 = _538 * _540;
    float _546 = 0.0 + _236;
    float _548 = precise::clamp(_546, 0.0, 1.0);
    float _550 = _540;
    float _552 = _548;
    if (_522)
    {
        float _554 = _532 * 8.0;
        float _556 = precise::clamp(_554, 0.0, 1.0);
        _550 = _556;
    }
    float _558 = _550;
    float _560 = _79 * _506;
    float _562 = _79 * _520;
    float _564 = fma(_488, _544, _542);
    if (_522)
    {
        float _566 = _548 * _558;
        _552 = _566;
    }
    float _568 = _552;
    float _570 = fma(_486, _544, _560);
    float _572 = fma(_490, _544, _562);
    float _574 = 0.0 + _568;
    float _576 = precise::clamp(_574, 0.0, 1.0);
    out.m_56.x = _570;
    out.m_56.y = _564;
    out.m_56.z = _572;
    out.m_56.w = _576;
    return out;
}

