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
    texture2d<float> fp_t_tcb_A [[id(6)]];
    sampler fp_t_tcb_ASmplr [[id(7)]];
    texture2d<float> fp_t_tcb_34 [[id(8)]];
    sampler fp_t_tcb_34Smplr [[id(9)]];
    texture2d<float> fp_t_tcb_36 [[id(10)]];
    sampler fp_t_tcb_36Smplr [[id(11)]];
    texture2d<float> fp_t_tcb_C [[id(12)]];
    sampler fp_t_tcb_CSmplr [[id(13)]];
    texture2d<float> fp_t_tcb_10 [[id(14)]];
    sampler fp_t_tcb_10Smplr [[id(15)]];
    sampler fp_t_tcb_8Smplr_w [[id(16)]];
    sampler fp_t_tcb_ASmplr_w [[id(17)]];
    sampler fp_t_tcb_34Smplr_w [[id(18)]];
    sampler fp_t_tcb_36Smplr_w [[id(19)]];
    sampler fp_t_tcb_CSmplr_w [[id(20)]];
    sampler fp_t_tcb_10Smplr_w [[id(21)]];
    constant dm_border_t* dm_border [[id(22)]];
};

struct main0_out
{
    float4 m_70 [[color(0)]];
};

struct main0_in
{
    float4 m_63 [[user(locn0)]];
    float4 m_65 [[user(locn1)]];
    float4 m_45 [[user(locn2)]];
    float4 m_55 [[user(locn3)]];
    float4 m_67 [[user(locn4)]];
    float4 m_61 [[user(locn5), flat]];
    float4 m_59 [[user(locn6), flat]];
    float4 m_47 [[user(locn7), flat]];
    float4 m_57 [[user(locn8), flat]];
    float4 m_49 [[user(locn9)]];
    float4 m_51 [[user(locn10)]];
    float4 m_53 [[user(locn11)]];
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
    float2 _607 = float2(_95, _97);
    float2 _101 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_607, float2(0.0), isnan(_607))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_607, float2(0.0), isnan(_607))).xy;
    float _103 = _101.x;
    float _105 = _101.y;
    float _107 = in.m_47.x;
    float _109 = in.m_45.z;
    float _111 = gl_FragCoord.w;
    float _113 = _109 * _111;
    float _115 = in.m_45.w;
    float _117 = gl_FragCoord.w;
    float _119 = _115 * _117;
    float _121 = in.m_49.x;
    float _123 = gl_FragCoord.w;
    float _125 = _121 * _123;
    float _127 = in.m_51.x;
    float _129 = gl_FragCoord.w;
    float _131 = _127 * _129;
    float _133 = in.m_51.y;
    float _135 = gl_FragCoord.w;
    float _137 = _133 * _135;
    float _139 = in.m_53.x;
    float _141 = gl_FragCoord.w;
    float _143 = _139 * _141;
    float _145 = in.m_49.y;
    float _147 = gl_FragCoord.w;
    float _149 = _145 * _147;
    float _151 = in.m_53.y;
    float _153 = gl_FragCoord.w;
    float _155 = _151 * _153;
    float _157 = in.m_55.w;
    float _159 = gl_FragCoord.w;
    float _161 = _157 * _159;
    float _163 = in.m_55.x;
    float _165 = gl_FragCoord.w;
    float _167 = _163 * _165;
    float _169 = in.m_55.y;
    float _171 = gl_FragCoord.w;
    float _173 = _169 * _171;
    float _175 = _107 * (*spvDescriptorSet0.fp_c9)._m0[191].x;
    float _177 = _107 * (*spvDescriptorSet0.fp_c9)._m0[191].y;
    float _179 = _93 * _119;
    float _181 = _93 * _131;
    float _183 = _93 * _137;
    float _185 = _93 * _143;
    float _187 = _93 * _161;
    float _189 = fma(_103, 2.0, -1.0);
    float _191 = fma(_105, 2.0, -1.0);
    float _193 = _93 * _113;
    float _195 = _93 * _149;
    float _197 = _93 * _155;
    float _199 = fma(_191, _177, _179);
    float _201 = fma(_189, _175, _193);
    float _203 = _93 * _125;
    float _205 = 1.0 / _187;
    float _207 = _93 * _167;
    float2 _759 = float2(_201, _199);
    float2 _209 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_759, float2(0.0), isnan(_759))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_759, float2(0.0), isnan(_759))).xw;
    float _211 = _209.x;
    float _213 = _209.y;
    float2 _771 = float2(_181, _183);
    float _215 = dm_bs(spvDescriptorSet0.fp_t_tcb_34.sample(spvDescriptorSet0.fp_t_tcb_34Smplr, select(_771, float2(0.0), isnan(_771))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_34, spvDescriptorSet0.fp_t_tcb_34Smplr_w, select(_771, float2(0.0), isnan(_771))).w;
    float2 _779 = float2(_185, _197);
    float _217 = dm_bs(spvDescriptorSet0.fp_t_tcb_36.sample(spvDescriptorSet0.fp_t_tcb_36Smplr, select(_779, float2(0.0), isnan(_779))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_36, spvDescriptorSet0.fp_t_tcb_36Smplr_w, select(_779, float2(0.0), isnan(_779))).x;
    float2 _787 = float2(_203, _195);
    float4 _220 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_787, float2(0.0), isnan(_787))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_787, float2(0.0), isnan(_787))).xyzw;
    float _222 = _220.x;
    float _224 = _220.y;
    float _226 = _220.z;
    float _228 = _220.w;
    float _230 = _93 * _173;
    float _232 = _207 * _205;
    float _234 = _230 * _205;
    float2 _812 = float2(_232, _234);
    float _236 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_812, float2(0.0), isnan(_812))), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_812, float2(0.0), isnan(_812))).x;
    float _238 = in.m_57.x;
    float _240 = in.m_59.x;
    float _242 = in.m_61.x;
    float _244 = in.m_63.w;
    float _246 = gl_FragCoord.w;
    float _248 = _244 * _246;
    float _250 = in.m_65.w;
    float _252 = gl_FragCoord.w;
    float _254 = _250 * _252;
    float _256 = in.m_55.z;
    float _258 = gl_FragCoord.w;
    float _260 = _256 * _258;
    float _262 = _242 * 1.2000000476837158203125;
    float _264 = precise::clamp(_262, 0.0, 1.0);
    float _266 = _93 * _248;
    float _268 = _93 * _260;
    float _270 = _266 + (-1.0);
    float _272 = _268 * _205;
    float _274 = in.m_67.x;
    float _276 = gl_FragCoord.w;
    float _278 = _274 * _276;
    float _280 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _282 = fma(_272, (*spvDescriptorSet0.fp_c8)._m0[30].w, _280);
    float _284 = 1.0 / _282;
    float _286 = in.m_65.z;
    float _288 = gl_FragCoord.w;
    float _290 = _286 * _288;
    float _292 = in.m_63.z;
    float _294 = gl_FragCoord.w;
    float _296 = _292 * _294;
    float _298 = -_242;
    float _300 = _298 + 1.0;
    float _302 = _211 * _211;
    float _304 = _215 + (-1.0);
    float _306 = _217 + (-1.0);
    float _308 = -_302;
    float _310 = _213 + _308;
    float _312 = fma(_264, _306, 1.0);
    float _314 = fma(_238, _310, _302);
    float _316 = fma(_240, _304, 1.0);
    float _318 = _93 * _254;
    float _320 = _314 * _228;
    float _322 = _316 * _320;
    float _324 = fma(_322, _312, _270);
    float _326 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _328 = fma(_236, (*spvDescriptorSet0.fp_c8)._m0[30].w, _326);
    float _330 = _266 * _322;
    float _332 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _334 = _284 * _332;
    float _336 = _324 * 4.0;
    float _338 = precise::clamp(_336, 0.0, 1.0);
    float _340 = _93 * _278;
    float _342 = _318 * _330;
    float _344 = 1.0 / _328;
    float _346 = _318 * _338;
    float _348 = fma(_346, 4.999999523162841796875, -0.4999999701976776123046875);
    float _350 = precise::clamp(_348, 0.0, 1.0);
    float _352 = fma(_350, -2.0, 3.0);
    float _354 = _350 * _350;
    float _356 = _352 * _354;
    float _358 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _360 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _362 = -_334;
    float _364 = fma(_344, _360, _362);
    float _366 = _346 * _356;
    float _368 = abs(_366);
    float _370 = log2(_368);
    float _372 = _364 * _358;
    float _374 = precise::clamp(_372, 0.0, 1.0);
    float _376 = _370 * 0.800000011920928955078125;
    float _378 = exp2(_376);
    float _380 = -_342;
    float _382 = _380 + _378;
    float _384 = fma(_240, _382, _342);
    float _386 = 0.0 + _384;
    float _388 = precise::clamp(_386, 0.0, 1.0);
    float _390 = _388 * _374;
    float _392 = _390 * _340;
    bool _396 = _392 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _398 = isnan(_392);
    bool _400 = _396 || _398;
    bool _402 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _404 = _400 || _402;
    float _406 = in.m_65.x;
    float _408 = gl_FragCoord.w;
    float _410 = _406 * _408;
    float _412 = in.m_65.y;
    float _414 = gl_FragCoord.w;
    float _416 = _412 * _414;
    float _418 = (*spvDescriptorSet0.fp_c10)._m0[2].x * 0.15915493667125701904296875;
    float _420 = _334;
    if (!_404)
    {
        discard_fragment();
    }
    float _422 = in.m_63.x;
    float _424 = gl_FragCoord.w;
    float _426 = _422 * _424;
    float _428 = in.m_63.y;
    float _430 = gl_FragCoord.w;
    float _432 = _428 * _430;
    float _434 = _418 * 6.283185482025146484375;
    float _436 = sin(_434);
    float _438 = _314 * _316;
    float _440 = _93 * _290;
    float _442 = _436 * _300;
    float _444 = _442 * 0.5;
    float _446 = _93 * _410;
    float _448 = _93 * _416;
    float _450 = -_444;
    float _452 = fma(_224, _438, _450);
    float _454 = -_444;
    float _456 = fma(_226, _438, _454);
    float _458 = -_444;
    float _460 = fma(_222, _438, _458);
    float _462 = -_452;
    float _464 = _462 + 1.0;
    float _466 = -_456;
    float _468 = _466 + 1.0;
    float _470 = -_460;
    float _472 = _470 + 1.0;
    float _474 = _448 * _464;
    float _476 = _440 * _468;
    float _478 = _446 * _472;
    float _480 = _93 * _426;
    float _482 = _93 * _432;
    float _484 = _93 * _296;
    float _486 = fma(_460, _480, _478);
    float _488 = fma(_452, _482, _474);
    float _490 = fma(_456, _484, _476);
    float _492 = _456;
    if (!_404)
    {
        out.m_70.x = _486;
        out.m_70.y = _488;
        out.m_70.z = _490;
        out.m_70.w = _384;
        return out;
    }
    float _494 = _488 * 0.715200006961822509765625;
    float _496 = in.m_72.w;
    float _498 = gl_FragCoord.w;
    float _500 = _496 * _498;
    float _502 = in.m_72.x;
    float _504 = gl_FragCoord.w;
    float _506 = _502 * _504;
    float _508 = in.m_72.y;
    float _510 = gl_FragCoord.w;
    float _512 = _508 * _510;
    float _514 = fma(_486, 0.2125999927520751953125, _494);
    float _516 = in.m_72.z;
    float _518 = gl_FragCoord.w;
    float _520 = _516 * _518;
    float _522 = fma(_490, 0.072200000286102294921875, _514);
    bool _524 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _526 = 1.0 / _522;
    if (_524)
    {
        float _528 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _530 = _334 + _528;
        _420 = _530;
    }
    float _532 = _420;
    if (_524)
    {
        float _534 = _532 * 8.0;
        float _536 = precise::clamp(_534, 0.0, 1.0);
        _492 = _536;
    }
    float _538 = _492;
    float _540 = _526 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _542 = precise::clamp(_540, 0.0, 1.0);
    float _544 = fma(_542, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _546 = _93 * _500;
    float _548 = _93 * _506;
    float _550 = _544 * _546;
    float _552 = 0.0 + _392;
    float _554 = precise::clamp(_552, 0.0, 1.0);
    float _556 = _93 * _512;
    float _558 = _93 * _520;
    float _560 = fma(_486, _550, _548);
    float _562 = _554;
    if (_524)
    {
        float _564 = _554 * _538;
        _562 = _564;
    }
    float _566 = _562;
    float _568 = fma(_488, _550, _556);
    float _570 = fma(_490, _550, _558);
    float _572 = 0.0 + _566;
    float _574 = precise::clamp(_572, 0.0, 1.0);
    out.m_70.x = _560;
    out.m_70.y = _568;
    out.m_70.z = _570;
    out.m_70.w = _574;
    return out;
}

