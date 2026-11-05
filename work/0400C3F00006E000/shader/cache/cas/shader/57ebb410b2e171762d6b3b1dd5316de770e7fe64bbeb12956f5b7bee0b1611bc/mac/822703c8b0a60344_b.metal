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
    constant _16* fp_c13 [[id(1)]];
    constant _16* fp_c8 [[id(2)]];
    constant _16* fp_c15 [[id(3)]];
    texture2d<float> fp_t_tcb_8 [[id(4)]];
    sampler fp_t_tcb_8Smplr [[id(5)]];
    texture2d<float> fp_t_tcb_C [[id(6)]];
    sampler fp_t_tcb_CSmplr [[id(7)]];
    texture2d<float> fp_t_tcb_A [[id(8)]];
    sampler fp_t_tcb_ASmplr [[id(9)]];
    texture2d<float> fp_t_tcb_10 [[id(10)]];
    sampler fp_t_tcb_10Smplr [[id(11)]];
    sampler fp_t_tcb_8Smplr_w [[id(12)]];
    sampler fp_t_tcb_CSmplr_w [[id(13)]];
    sampler fp_t_tcb_ASmplr_w [[id(14)]];
    sampler fp_t_tcb_10Smplr_w [[id(15)]];
    constant dm_border_t* dm_border [[id(16)]];
};

struct main0_out
{
    float4 m_58 [[color(0)]];
};

struct main0_in
{
    float4 m_55 [[user(locn0)]];
    float4 m_53 [[user(locn1)]];
    float4 m_68 [[user(locn2)]];
    float4 m_62 [[user(locn3), flat]];
    float4 m_66 [[user(locn4)]];
    float4 m_45 [[user(locn5)]];
    float4 m_47 [[user(locn6)]];
    float4 m_43 [[user(locn7)]];
    float4 m_41 [[user(locn8)]];
    float4 m_60 [[user(locn10)]];
    float4 m_51 [[user(locn11)]];
    float4 m_49 [[user(locn12)]];
    float4 m_64 [[user(locn13), flat]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _75 = gl_FragCoord.w;
    float _77 = in.m_41.x;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = in.m_41.y;
    float _85 = gl_FragCoord.w;
    float _87 = _83 * _85;
    float _89 = 1.0 / _75;
    float _91 = _89 * _81;
    float _93 = _89 * _87;
    float2 _605 = float2(_91, _93);
    float2 _97 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_605, float2(0.0), isnan(_605))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_605, float2(0.0), isnan(_605))).xy;
    float _99 = _97.x;
    float _101 = _97.y;
    float _103 = in.m_43.x;
    float _105 = gl_FragCoord.w;
    float _107 = _103 * _105;
    float _109 = in.m_43.y;
    float _111 = gl_FragCoord.w;
    float _113 = _109 * _111;
    float _115 = _89 * _107;
    float _117 = _89 * _113;
    float _119 = fma(_99, 2.0, -1.0);
    float _121 = fma(_101, 2.0, -1.0);
    float _123 = fma(_119, (*spvDescriptorSet0.fp_c9)._m0[194].w, _115);
    float _125 = fma(_121, (*spvDescriptorSet0.fp_c9)._m0[194].w, _117);
    float2 _659 = float2(_123, _125);
    float4 _128 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_659, float2(0.0), isnan(_659))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_659, float2(0.0), isnan(_659))).xyzw;
    float _130 = _128.x;
    float _132 = _128.y;
    float _134 = _128.z;
    float _136 = _128.w;
    float _138 = in.m_41.z;
    float _140 = gl_FragCoord.w;
    float _142 = _138 * _140;
    float _144 = in.m_41.w;
    float _146 = gl_FragCoord.w;
    float _148 = _144 * _146;
    float _150 = in.m_45.x;
    float _152 = gl_FragCoord.w;
    float _154 = _150 * _152;
    float _156 = in.m_45.y;
    float _158 = gl_FragCoord.w;
    float _160 = _156 * _158;
    float _162 = _89 * _142;
    float _164 = _89 * _148;
    float _166 = _89 * _154;
    float _168 = fma(_119, (*spvDescriptorSet0.fp_c9)._m0[194].w, _162);
    float _170 = _89 * _160;
    float _172 = fma(_121, (*spvDescriptorSet0.fp_c9)._m0[194].w, _164);
    float _174 = _166 + (-0.5);
    float _176 = _170 + (-0.5);
    float _178 = _136 * (-0.0500000007450580596923828125);
    float _180 = fma(_174, _178, _168);
    float _182 = fma(_176, _178, _172);
    float2 _742 = float2(_180, _182);
    float4 _184 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_742, float2(0.0), isnan(_742))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_742, float2(0.0), isnan(_742))).xyzw;
    float _186 = _184.x;
    float _188 = _184.y;
    float _190 = _184.z;
    float _192 = _184.w;
    float _194 = in.m_47.w;
    float _196 = gl_FragCoord.w;
    float _198 = _194 * _196;
    float _200 = in.m_49.x;
    float _202 = gl_FragCoord.w;
    float _204 = _200 * _202;
    float _206 = _89 * _198;
    float _208 = -_206;
    float _210 = _208 + 1.0;
    float _212 = in.m_51.y;
    float _214 = gl_FragCoord.w;
    float _216 = _212 * _214;
    float _218 = _89 * _216;
    float _220 = -_210;
    float _222 = fma(_220, _210, _192);
    float _224 = precise::max(_222, 0.0599999986588954925537109375);
    float _226 = precise::min(_224, 1.0);
    float _228 = fma(_226, 1.06382977962493896484375, -0.063829787075519561767578125);
    float _230 = _89 * _204;
    float _232 = 0.0 + _228;
    float _234 = precise::clamp(_232, 0.0, 1.0);
    float _236 = _234 * _230;
    bool _240 = _236 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _242 = isnan(_236);
    bool _244 = _240 || _242;
    bool _246 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _248 = _244 || _246;
    float _250 = in.m_51.w;
    float _252 = gl_FragCoord.w;
    float _254 = _250 * _252;
    if (!_248)
    {
        discard_fragment();
    }
    float _256 = in.m_51.x;
    float _258 = gl_FragCoord.w;
    float _260 = _256 * _258;
    float _262 = _89 * _254;
    float _264 = 1.0 / _262;
    float _266 = _89 * _260;
    float _268 = _266 * _264;
    float _270 = _218 * _264;
    float2 _862 = float2(_268, _270);
    float _272 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_862, float2(0.0), isnan(_862))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_862, float2(0.0), isnan(_862))).x;
    float _274 = in.m_53.x;
    float _276 = gl_FragCoord.w;
    float _278 = _274 * _276;
    float _280 = in.m_53.y;
    float _282 = gl_FragCoord.w;
    float _284 = _280 * _282;
    float _286 = in.m_53.z;
    float _288 = gl_FragCoord.w;
    float _290 = _286 * _288;
    float _292 = in.m_55.y;
    float _294 = gl_FragCoord.w;
    float _296 = _292 * _294;
    float _298 = in.m_55.x;
    float _300 = gl_FragCoord.w;
    float _302 = _298 * _300;
    float _304 = in.m_55.z;
    float _306 = gl_FragCoord.w;
    float _308 = _304 * _306;
    float _310 = _130 * _222;
    float _312 = _310 * 2.0;
    float _314 = precise::clamp(_312, 0.0, 1.0);
    float _316 = _132 * _222;
    float _318 = _316 * 2.0;
    float _320 = precise::clamp(_318, 0.0, 1.0);
    float _322 = _134 * _222;
    float _324 = _322 * 2.0;
    float _326 = precise::clamp(_324, 0.0, 1.0);
    float _328 = fma(_186, _186, _314);
    float _330 = fma(_188, _188, _320);
    float _332 = fma(_190, _190, _326);
    float _334 = -_328;
    float _336 = _334 + 1.0;
    float _338 = -_330;
    float _340 = _338 + 1.0;
    float _342 = -_332;
    float _344 = _342 + 1.0;
    float _346 = _89 * _278;
    float _348 = _89 * _284;
    float _350 = _89 * _290;
    float _352 = _346 * _336;
    float _354 = _348 * _340;
    float _356 = _350 * _344;
    float _358 = _89 * _296;
    float _360 = _89 * _302;
    float _362 = _89 * _308;
    float _364 = fma(_330, _358, _354);
    float _366 = fma(_328, _360, _352);
    float _368 = fma(_332, _362, _356);
    if (!_248)
    {
        out.m_58.x = _366;
        out.m_58.y = _364;
        out.m_58.z = _368;
        out.m_58.w = _228;
        return out;
    }
    float _370 = in.m_60.y;
    float _372 = gl_FragCoord.w;
    float _374 = _370 * _372;
    float _376 = in.m_60.x;
    float _378 = gl_FragCoord.w;
    float _380 = _376 * _378;
    float _382 = in.m_62.y;
    float _384 = in.m_62.x;
    float _386 = in.m_60.z;
    float _388 = gl_FragCoord.w;
    float _390 = _386 * _388;
    float _392 = in.m_51.z;
    float _394 = gl_FragCoord.w;
    float _396 = _392 * _394;
    float _398 = in.m_62.z;
    float _400 = in.m_64.x;
    float _402 = _89 * _374;
    float _404 = _89 * _380;
    float _406 = -_382;
    float _408 = _402 + _406;
    float _410 = -_384;
    float _412 = _404 + _410;
    float _414 = _89 * _390;
    float _416 = _89 * _396;
    float _418 = _408 * _408;
    float _420 = _400 * (*spvDescriptorSet0.fp_c13)._m0[2].y;
    float _422 = -_398;
    float _424 = _414 + _422;
    float _426 = _416 * _264;
    float _428 = fma(_412, _412, _418);
    float _430 = in.m_66.w;
    float _432 = gl_FragCoord.w;
    float _434 = _430 * _432;
    float _436 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _438 = fma(_272, (*spvDescriptorSet0.fp_c8)._m0[30].w, _436);
    float _440 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _442 = fma(_426, (*spvDescriptorSet0.fp_c8)._m0[30].w, _440);
    float _444 = fma(_424, _424, _428);
    float _446 = in.m_68.w;
    float _448 = gl_FragCoord.w;
    float _450 = _446 * _448;
    float _452 = in.m_68.x;
    float _454 = gl_FragCoord.w;
    float _456 = _452 * _454;
    float _458 = 1.0 / _442;
    float _460 = -_444;
    float _462 = fma(_420, _420, _460);
    float _464 = _364 * 0.715200006961822509765625;
    float _466 = in.m_68.y;
    float _468 = gl_FragCoord.w;
    float _470 = _466 * _468;
    float _472 = in.m_68.z;
    float _474 = gl_FragCoord.w;
    float _476 = _472 * _474;
    float _478 = precise::max(0.0, _462);
    float _480 = fma(_366, 0.2125999927520751953125, _464);
    float _482 = 1.0 / _438;
    float _484 = fma(_368, 0.072200000286102294921875, _480);
    float _486 = sqrt(_478);
    float _488 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _490 = _458 * _488;
    float _492 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _494 = -_490;
    float _496 = fma(_482, _492, _494);
    float _498 = 1.0 / _484;
    float _500 = _89 * _434;
    float _502 = _486 + _496;
    float _504 = -_500;
    float _506 = _502 + _504;
    bool _508 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _510 = _506 * (*spvDescriptorSet0.fp_c13)._m0[2].z;
    float _512 = _498 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _514 = precise::clamp(_512, 0.0, 1.0);
    float _516 = _510 * (-1.44269502162933349609375);
    float _518 = exp2(_516);
    float _520 = fma(_514, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _522 = _89 * _450;
    float _524 = _482;
    if (_508)
    {
        float _526 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _528 = _490 + _526;
        _524 = _528;
    }
    float _530 = _524;
    float _532 = _520 * _522;
    float _534 = _89 * _456;
    float _536 = _89 * _470;
    float _538 = _89 * _476;
    float _540 = fma(_366, _532, _534);
    float _542 = fma(_364, _532, _536);
    float _544 = fma(_368, _532, _538);
    float _546 = -_518;
    float _548 = _546 + 1.0;
    float _550 = precise::clamp(_548, 0.0, 1.0);
    float _552 = _236 * _550;
    float _554 = precise::clamp(_552, 0.0, 1.0);
    float _556 = _550;
    float _558 = _554;
    if (_508)
    {
        float _560 = _530 * 8.0;
        float _562 = precise::clamp(_560, 0.0, 1.0);
        _556 = _562;
    }
    float _564 = _556;
    if (_508)
    {
        float _566 = _554 * _564;
        _558 = _566;
    }
    float _568 = _558;
    float _570 = 0.0 + _568;
    float _572 = precise::clamp(_570, 0.0, 1.0);
    out.m_58.x = _540;
    out.m_58.y = _542;
    out.m_58.z = _544;
    out.m_58.w = _572;
    return out;
}

