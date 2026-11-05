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
    float2 _611 = float2(_91, _93);
    float2 _97 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_611, float2(0.0), isnan(_611))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_611, float2(0.0), isnan(_611))).xy;
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
    float2 _665 = float2(_123, _125);
    float4 _128 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_665, float2(0.0), isnan(_665))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_665, float2(0.0), isnan(_665))).xyzw;
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
    float2 _748 = float2(_180, _182);
    float4 _184 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_748, float2(0.0), isnan(_748))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_748, float2(0.0), isnan(_748))).xyzw;
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
    float2 _868 = float2(_268, _270);
    float _272 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_868, float2(0.0), isnan(_868))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_868, float2(0.0), isnan(_868))).x;
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
    float _310 = _130 * _130;
    float _312 = _132 * _132;
    float _314 = _134 * _134;
    float _316 = _310 * _222;
    float _318 = _316 * 2.0;
    float _320 = precise::clamp(_318, 0.0, 1.0);
    float _322 = _312 * _222;
    float _324 = _322 * 2.0;
    float _326 = precise::clamp(_324, 0.0, 1.0);
    float _328 = _314 * _222;
    float _330 = _328 * 2.0;
    float _332 = precise::clamp(_330, 0.0, 1.0);
    float _334 = fma(_186, _186, _320);
    float _336 = fma(_188, _188, _326);
    float _338 = fma(_190, _190, _332);
    float _340 = -_334;
    float _342 = _340 + 1.0;
    float _344 = -_336;
    float _346 = _344 + 1.0;
    float _348 = -_338;
    float _350 = _348 + 1.0;
    float _352 = _89 * _278;
    float _354 = _89 * _284;
    float _356 = _89 * _290;
    float _358 = _352 * _342;
    float _360 = _354 * _346;
    float _362 = _356 * _350;
    float _364 = _89 * _296;
    float _366 = _89 * _302;
    float _368 = _89 * _308;
    float _370 = fma(_336, _364, _360);
    float _372 = fma(_334, _366, _358);
    float _374 = fma(_338, _368, _362);
    if (!_248)
    {
        out.m_58.x = _372;
        out.m_58.y = _370;
        out.m_58.z = _374;
        out.m_58.w = _228;
        return out;
    }
    float _376 = in.m_60.y;
    float _378 = gl_FragCoord.w;
    float _380 = _376 * _378;
    float _382 = in.m_60.x;
    float _384 = gl_FragCoord.w;
    float _386 = _382 * _384;
    float _388 = in.m_62.y;
    float _390 = in.m_62.x;
    float _392 = in.m_60.z;
    float _394 = gl_FragCoord.w;
    float _396 = _392 * _394;
    float _398 = in.m_51.z;
    float _400 = gl_FragCoord.w;
    float _402 = _398 * _400;
    float _404 = in.m_62.z;
    float _406 = in.m_64.x;
    float _408 = _89 * _380;
    float _410 = _89 * _386;
    float _412 = -_388;
    float _414 = _408 + _412;
    float _416 = -_390;
    float _418 = _410 + _416;
    float _420 = _89 * _396;
    float _422 = _89 * _402;
    float _424 = _414 * _414;
    float _426 = _406 * (*spvDescriptorSet0.fp_c13)._m0[2].y;
    float _428 = -_404;
    float _430 = _420 + _428;
    float _432 = _422 * _264;
    float _434 = fma(_418, _418, _424);
    float _436 = in.m_66.w;
    float _438 = gl_FragCoord.w;
    float _440 = _436 * _438;
    float _442 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _444 = fma(_272, (*spvDescriptorSet0.fp_c8)._m0[30].w, _442);
    float _446 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _448 = fma(_432, (*spvDescriptorSet0.fp_c8)._m0[30].w, _446);
    float _450 = fma(_430, _430, _434);
    float _452 = in.m_68.w;
    float _454 = gl_FragCoord.w;
    float _456 = _452 * _454;
    float _458 = in.m_68.x;
    float _460 = gl_FragCoord.w;
    float _462 = _458 * _460;
    float _464 = 1.0 / _448;
    float _466 = -_450;
    float _468 = fma(_426, _426, _466);
    float _470 = _370 * 0.715200006961822509765625;
    float _472 = in.m_68.y;
    float _474 = gl_FragCoord.w;
    float _476 = _472 * _474;
    float _478 = in.m_68.z;
    float _480 = gl_FragCoord.w;
    float _482 = _478 * _480;
    float _484 = precise::max(0.0, _468);
    float _486 = fma(_372, 0.2125999927520751953125, _470);
    float _488 = 1.0 / _444;
    float _490 = fma(_374, 0.072200000286102294921875, _486);
    float _492 = sqrt(_484);
    float _494 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _496 = _464 * _494;
    float _498 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _500 = -_496;
    float _502 = fma(_488, _498, _500);
    float _504 = 1.0 / _490;
    float _506 = _89 * _440;
    float _508 = _492 + _502;
    float _510 = -_506;
    float _512 = _508 + _510;
    bool _514 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _516 = _512 * (*spvDescriptorSet0.fp_c13)._m0[2].z;
    float _518 = _504 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _520 = precise::clamp(_518, 0.0, 1.0);
    float _522 = _516 * (-1.44269502162933349609375);
    float _524 = exp2(_522);
    float _526 = fma(_520, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _528 = _89 * _456;
    float _530 = _488;
    if (_514)
    {
        float _532 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _534 = _496 + _532;
        _530 = _534;
    }
    float _536 = _530;
    float _538 = _526 * _528;
    float _540 = _89 * _462;
    float _542 = _89 * _476;
    float _544 = _89 * _482;
    float _546 = fma(_372, _538, _540);
    float _548 = fma(_370, _538, _542);
    float _550 = fma(_374, _538, _544);
    float _552 = -_524;
    float _554 = _552 + 1.0;
    float _556 = precise::clamp(_554, 0.0, 1.0);
    float _558 = _236 * _556;
    float _560 = precise::clamp(_558, 0.0, 1.0);
    float _562 = _556;
    float _564 = _560;
    if (_514)
    {
        float _566 = _536 * 8.0;
        float _568 = precise::clamp(_566, 0.0, 1.0);
        _562 = _568;
    }
    float _570 = _562;
    if (_514)
    {
        float _572 = _560 * _570;
        _564 = _572;
    }
    float _574 = _564;
    float _576 = 0.0 + _574;
    float _578 = precise::clamp(_576, 0.0, 1.0);
    out.m_58.x = _546;
    out.m_58.y = _548;
    out.m_58.z = _550;
    out.m_58.w = _578;
    return out;
}

