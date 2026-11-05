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
    texture2d<float> fp_t_tcb_34 [[id(4)]];
    sampler fp_t_tcb_34Smplr [[id(5)]];
    texture2d<float> fp_t_tcb_10 [[id(6)]];
    sampler fp_t_tcb_10Smplr [[id(7)]];
    texture2d<float> fp_t_tcb_8 [[id(8)]];
    sampler fp_t_tcb_8Smplr [[id(9)]];
    texture2d<float> fp_t_tcb_A [[id(10)]];
    sampler fp_t_tcb_ASmplr [[id(11)]];
    texture2d<float> fp_t_tcb_36 [[id(12)]];
    sampler fp_t_tcb_36Smplr [[id(13)]];
    texture2d<float> fp_t_tcb_C [[id(14)]];
    sampler fp_t_tcb_CSmplr [[id(15)]];
    sampler fp_t_tcb_34Smplr_w [[id(16)]];
    sampler fp_t_tcb_10Smplr_w [[id(17)]];
    sampler fp_t_tcb_8Smplr_w [[id(18)]];
    sampler fp_t_tcb_ASmplr_w [[id(19)]];
    sampler fp_t_tcb_36Smplr_w [[id(20)]];
    sampler fp_t_tcb_CSmplr_w [[id(21)]];
    constant dm_border_t* dm_border [[id(22)]];
};

struct main0_out
{
    float4 m_70 [[color(0)]];
};

struct main0_in
{
    float4 m_59 [[user(locn0)]];
    float4 m_57 [[user(locn1)]];
    float4 m_47 [[user(locn2)]];
    float4 m_63 [[user(locn3)]];
    float4 m_49 [[user(locn4)]];
    float4 m_53 [[user(locn5), flat]];
    float4 m_67 [[user(locn6), flat]];
    float4 m_61 [[user(locn7), flat]];
    float4 m_65 [[user(locn8)]];
    float4 m_45 [[user(locn9)]];
    float4 m_51 [[user(locn10)]];
    float4 m_55 [[user(locn12)]];
    float4 m_72 [[user(locn13)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _79 = gl_FragCoord.w;
    float _81 = in.m_45.x;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = in.m_45.y;
    float _89 = gl_FragCoord.w;
    float _91 = _87 * _89;
    float _93 = 1.0 / _79;
    float _95 = _93 * _85;
    float _97 = _93 * _91;
    float2 _629 = float2(_95, _97);
    float2 _101 = dm_bs(spvDescriptorSet0.fp_t_tcb_34.sample(spvDescriptorSet0.fp_t_tcb_34Smplr, select(_629, float2(0.0), isnan(_629))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_34, spvDescriptorSet0.fp_t_tcb_34Smplr_w, select(_629, float2(0.0), isnan(_629))).xy;
    float _103 = _101.x;
    float _105 = _101.y;
    float _107 = in.m_47.w;
    float _109 = gl_FragCoord.w;
    float _111 = _107 * _109;
    float _113 = in.m_49.y;
    float _115 = gl_FragCoord.w;
    float _117 = _113 * _115;
    float _119 = in.m_47.x;
    float _121 = gl_FragCoord.w;
    float _123 = _119 * _121;
    float _125 = in.m_49.z;
    float _127 = gl_FragCoord.w;
    float _129 = _125 * _127;
    float _131 = in.m_47.y;
    float _133 = gl_FragCoord.w;
    float _135 = _131 * _133;
    float _137 = in.m_51.x;
    float _139 = gl_FragCoord.w;
    float _141 = _137 * _139;
    float _143 = in.m_49.x;
    float _145 = gl_FragCoord.w;
    float _147 = _143 * _145;
    float _149 = in.m_49.w;
    float _151 = gl_FragCoord.w;
    float _153 = _149 * _151;
    float _155 = in.m_53.x;
    float _157 = in.m_53.y;
    float _159 = in.m_51.y;
    float _161 = gl_FragCoord.w;
    float _163 = _159 * _161;
    float _165 = _93 * _111;
    float _167 = _93 * _129;
    float _169 = _93 * _135;
    float _171 = _93 * _141;
    float _173 = 1.0 / _165;
    float _175 = _93 * _163;
    float _177 = _169 * _173;
    float _179 = fma(_103, 2.0, -1.0);
    float _181 = fma(_105, 2.0, -1.0);
    float _183 = _93 * _117;
    float _185 = _93 * _123;
    float _187 = _93 * _147;
    float _189 = _93 * _153;
    float _191 = fma(_181, _157, _183);
    float _193 = _185 * _173;
    float _195 = fma(_179, _155, _187);
    float _197 = fma(_179, _155, _167);
    float _199 = fma(_181, _157, _189);
    float _201 = fma(_179, _155, _171);
    float _203 = fma(_181, _157, _175);
    float2 _778 = float2(_193, _177);
    float _205 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_778, float2(0.0), isnan(_778))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_778, float2(0.0), isnan(_778))).x;
    float2 _786 = float2(_195, _191);
    float4 _208 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_786, float2(0.0), isnan(_786))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_786, float2(0.0), isnan(_786))).xyzw;
    float _210 = _208.x;
    float _212 = _208.y;
    float _214 = _208.z;
    float _216 = _208.w;
    float2 _802 = float2(_197, _199);
    float4 _218 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_802, float2(0.0), isnan(_802))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_802, float2(0.0), isnan(_802))).xyzw;
    float _220 = _218.x;
    float _222 = _218.y;
    float _224 = _218.z;
    float _226 = _218.w;
    float2 _818 = float2(_201, _203);
    float _228 = dm_bs(spvDescriptorSet0.fp_t_tcb_36.sample(spvDescriptorSet0.fp_t_tcb_36Smplr, select(_818, float2(0.0), isnan(_818))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_36, spvDescriptorSet0.fp_t_tcb_36Smplr_w, select(_818, float2(0.0), isnan(_818))).w;
    float _230 = in.m_55.y;
    float _232 = gl_FragCoord.w;
    float _234 = _230 * _232;
    float _236 = in.m_55.x;
    float _238 = gl_FragCoord.w;
    float _240 = _236 * _238;
    float _242 = in.m_55.z;
    float _244 = gl_FragCoord.w;
    float _246 = _242 * _244;
    float _248 = in.m_47.z;
    float _250 = gl_FragCoord.w;
    float _252 = _248 * _250;
    float _254 = _93 * _234;
    float _256 = _93 * _240;
    float _258 = -_254;
    float _260 = _258 + (*spvDescriptorSet0.fp_c10)._m0[9].w;
    float _262 = -_256;
    float _264 = _262 + (*spvDescriptorSet0.fp_c10)._m0[8].w;
    float _266 = _93 * _246;
    float _268 = _260 * _260;
    float _270 = -_266;
    float _272 = _270 + (*spvDescriptorSet0.fp_c10)._m0[10].w;
    float _274 = fma(_264, _264, _268);
    float _276 = in.m_57.w;
    float _278 = gl_FragCoord.w;
    float _280 = _276 * _278;
    float _282 = fma(_272, _272, _274);
    float _284 = _93 * _252;
    float _286 = in.m_59.w;
    float _288 = gl_FragCoord.w;
    float _290 = _286 * _288;
    float _292 = _284 * _173;
    float _294 = sqrt(_282);
    float _296 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _298 = fma(_292, (*spvDescriptorSet0.fp_c8)._m0[30].w, _296);
    float _300 = 1.0 / _298;
    float _302 = precise::max(_294, 4.0);
    float _304 = precise::min(_302, 12.0);
    float _306 = fma(_304, 0.125, -0.5);
    float _308 = precise::clamp(_306, 0.0, 1.0);
    float _310 = _308 * _308;
    float _312 = _310 * 10.0;
    float _314 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _316 = fma(_205, (*spvDescriptorSet0.fp_c8)._m0[30].w, _314);
    float _318 = in.m_61.x;
    float _320 = _216 * _226;
    float _322 = 1.0 / _316;
    float _324 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _326 = -_312;
    float _328 = fma(_322, _324, _326);
    float _330 = in.m_63.x;
    float _332 = gl_FragCoord.w;
    float _334 = _330 * _332;
    float _336 = fma(_300, (*spvDescriptorSet0.fp_c8)._m0[30].z, _328);
    float _338 = _336 * 0.20000000298023223876953125;
    float _340 = precise::clamp(_338, 0.0, 1.0);
    float _342 = _320 * _340;
    float _344 = _93 * _280;
    float _346 = -_342;
    float _348 = fma(_342, _228, _346);
    float _350 = fma(_318, _348, _342);
    float _352 = _93 * _290;
    float _354 = _352 * _350;
    float _356 = _344 * _354;
    float _358 = 0.0 + _356;
    float _360 = precise::clamp(_358, 0.0, 1.0);
    float _362 = _93 * _334;
    float _364 = _360 * _362;
    bool _368 = _364 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _370 = isnan(_364);
    bool _372 = _368 || _370;
    bool _374 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _376 = _372 || _374;
    float _378 = in.m_65.x;
    float _380 = gl_FragCoord.w;
    float _382 = _378 * _380;
    float _384 = _300;
    if (!_376)
    {
        discard_fragment();
    }
    float _386 = _93 * _382;
    float _388 = fma(_179, _155, _386);
    float _390 = in.m_65.y;
    float _392 = gl_FragCoord.w;
    float _394 = _390 * _392;
    float _396 = _93 * _394;
    float _398 = fma(_181, _157, _396);
    float2 _1072 = float2(_388, _398);
    float3 _402 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1072, float2(0.0), isnan(_1072))), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1072, float2(0.0), isnan(_1072))).xyz;
    float _404 = _402.x;
    float _406 = _402.y;
    float _408 = _402.z;
    float _410 = in.m_67.x;
    float _412 = in.m_57.x;
    float _414 = gl_FragCoord.w;
    float _416 = _412 * _414;
    float _418 = in.m_57.y;
    float _420 = gl_FragCoord.w;
    float _422 = _418 * _420;
    float _424 = in.m_57.z;
    float _426 = gl_FragCoord.w;
    float _428 = _424 * _426;
    float _430 = in.m_59.x;
    float _432 = gl_FragCoord.w;
    float _434 = _430 * _432;
    float _436 = in.m_59.y;
    float _438 = gl_FragCoord.w;
    float _440 = _436 * _438;
    float _442 = in.m_59.z;
    float _444 = gl_FragCoord.w;
    float _446 = _442 * _444;
    float _448 = _210 * _220;
    float _450 = _212 * _222;
    float _452 = _214 * _224;
    float _454 = _93 * _422;
    float _456 = _93 * _428;
    float _458 = _93 * _446;
    float _460 = -_448;
    float _462 = fma(_448, _404, _460);
    float _464 = -_450;
    float _466 = fma(_450, _406, _464);
    float _468 = -_452;
    float _470 = fma(_452, _408, _468);
    float _472 = fma(_410, _462, _448);
    float _474 = fma(_410, _466, _450);
    float _476 = fma(_410, _470, _452);
    float _478 = _93 * _416;
    float _480 = -_472;
    float _482 = _480 + 1.0;
    float _484 = -_474;
    float _486 = _484 + 1.0;
    float _488 = -_476;
    float _490 = _488 + 1.0;
    float _492 = _478 * _482;
    float _494 = _454 * _486;
    float _496 = _456 * _490;
    float _498 = _93 * _434;
    float _500 = _93 * _440;
    float _502 = fma(_476, _458, _496);
    float _504 = fma(_472, _498, _492);
    float _506 = fma(_474, _500, _494);
    float _508 = _494;
    if (!_376)
    {
        out.m_70.x = _504;
        out.m_70.y = _506;
        out.m_70.z = _502;
        out.m_70.w = _356;
        return out;
    }
    float _510 = _506 * 0.715200006961822509765625;
    float _512 = in.m_72.w;
    float _514 = gl_FragCoord.w;
    float _516 = _512 * _514;
    float _518 = in.m_72.y;
    float _520 = gl_FragCoord.w;
    float _522 = _518 * _520;
    float _524 = in.m_72.x;
    float _526 = gl_FragCoord.w;
    float _528 = _524 * _526;
    float _530 = fma(_504, 0.2125999927520751953125, _510);
    float _532 = in.m_72.z;
    float _534 = gl_FragCoord.w;
    float _536 = _532 * _534;
    float _538 = fma(_502, 0.072200000286102294921875, _530);
    bool _540 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _542 = 1.0 / _538;
    if (_540)
    {
        _508 = (*spvDescriptorSet0.fp_c8)._m0[30].z;
    }
    float _544 = _508;
    float _546 = _542 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _548 = precise::clamp(_546, 0.0, 1.0);
    float _550 = _544;
    if (_540)
    {
        float _552 = -_544;
        float _554 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _556 = fma(_300, _552, _554);
        _384 = _556;
    }
    float _558 = _384;
    float _560 = fma(_548, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _562 = _93 * _516;
    if (_540)
    {
        float _564 = _558 * 8.0;
        float _566 = precise::clamp(_564, 0.0, 1.0);
        _550 = _566;
    }
    float _568 = _550;
    float _570 = _93 * _522;
    float _572 = _93 * _528;
    float _574 = _560 * _562;
    float _576 = 0.0 + _364;
    float _578 = precise::clamp(_576, 0.0, 1.0);
    float _580 = _93 * _536;
    float _582 = fma(_504, _574, _572);
    float _584 = _578;
    if (_540)
    {
        float _586 = _578 * _568;
        _584 = _586;
    }
    float _588 = _584;
    float _590 = fma(_506, _574, _570);
    float _592 = fma(_502, _574, _580);
    float _594 = 0.0 + _588;
    float _596 = precise::clamp(_594, 0.0, 1.0);
    out.m_70.x = _582;
    out.m_70.y = _590;
    out.m_70.z = _592;
    out.m_70.w = _596;
    return out;
}

