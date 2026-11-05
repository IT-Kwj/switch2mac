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
    constant _16* fp_c8 [[id(2)]];
    constant _16* fp_c15 [[id(3)]];
    texture2d<float> fp_t_tcb_8 [[id(4)]];
    sampler fp_t_tcb_8Smplr [[id(5)]];
    texture2d<float> fp_t_tcb_A [[id(6)]];
    sampler fp_t_tcb_ASmplr [[id(7)]];
    texture2d<float> fp_t_tcb_C [[id(8)]];
    sampler fp_t_tcb_CSmplr [[id(9)]];
    texture2d<float> fp_t_tcb_10 [[id(10)]];
    sampler fp_t_tcb_10Smplr [[id(11)]];
    texture2d<float> fp_t_tcb_34 [[id(12)]];
    sampler fp_t_tcb_34Smplr [[id(13)]];
    texture2d<float> fp_t_tcb_36 [[id(14)]];
    sampler fp_t_tcb_36Smplr [[id(15)]];
    sampler fp_t_tcb_8Smplr_w [[id(16)]];
    sampler fp_t_tcb_ASmplr_w [[id(17)]];
    sampler fp_t_tcb_CSmplr_w [[id(18)]];
    sampler fp_t_tcb_10Smplr_w [[id(19)]];
    sampler fp_t_tcb_34Smplr_w [[id(20)]];
    sampler fp_t_tcb_36Smplr_w [[id(21)]];
    constant dm_border_t* dm_border [[id(22)]];
};

struct main0_out
{
    float4 m_70 [[color(0)]];
};

struct main0_in
{
    float4 m_59 [[user(locn0)]];
    float4 m_61 [[user(locn1)]];
    float4 m_45 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_63 [[user(locn4)]];
    float4 m_57 [[user(locn5), flat]];
    float4 m_65 [[user(locn6), flat]];
    float4 m_67 [[user(locn7), flat]];
    float4 m_49 [[user(locn8), flat]];
    float4 m_51 [[user(locn9)]];
    float4 m_55 [[user(locn10)]];
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
    float2 _633 = float2(_95, _97);
    float2 _101 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_633, float2(0.0), isnan(_633))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_633, float2(0.0), isnan(_633))).xy;
    float _103 = _101.x;
    float _105 = _101.y;
    float _107 = in.m_47.w;
    float _109 = gl_FragCoord.w;
    float _111 = _107 * _109;
    float _113 = in.m_49.x;
    float _115 = in.m_45.z;
    float _117 = gl_FragCoord.w;
    float _119 = _115 * _117;
    float _121 = in.m_45.w;
    float _123 = gl_FragCoord.w;
    float _125 = _121 * _123;
    float _127 = in.m_47.x;
    float _129 = gl_FragCoord.w;
    float _131 = _127 * _129;
    float _133 = in.m_47.y;
    float _135 = gl_FragCoord.w;
    float _137 = _133 * _135;
    float _139 = in.m_51.x;
    float _141 = gl_FragCoord.w;
    float _143 = _139 * _141;
    float _145 = in.m_51.y;
    float _147 = gl_FragCoord.w;
    float _149 = _145 * _147;
    float _151 = in.m_53.x;
    float _153 = gl_FragCoord.w;
    float _155 = _151 * _153;
    float _157 = in.m_55.x;
    float _159 = gl_FragCoord.w;
    float _161 = _157 * _159;
    float _163 = in.m_55.y;
    float _165 = gl_FragCoord.w;
    float _167 = _163 * _165;
    float _169 = in.m_53.y;
    float _171 = gl_FragCoord.w;
    float _173 = _169 * _171;
    float _175 = _93 * _111;
    float _177 = _113 * (*spvDescriptorSet0.fp_c9)._m0[191].x;
    float _179 = _113 * (*spvDescriptorSet0.fp_c9)._m0[191].y;
    float _181 = _93 * _137;
    float _183 = 1.0 / _175;
    float _185 = _93 * _173;
    float _187 = fma(_103, 2.0, -1.0);
    float _189 = fma(_105, 2.0, -1.0);
    float _191 = _93 * _119;
    float _193 = _93 * _125;
    float _195 = _93 * _167;
    float _197 = fma(_187, _177, _191);
    float _199 = fma(_189, _179, _193);
    float _201 = _93 * _131;
    float _203 = _93 * _143;
    float _205 = _93 * _149;
    float _207 = _93 * _155;
    float _209 = _201 * _183;
    float2 _788 = float2(_197, _199);
    float2 _211 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_788, float2(0.0), isnan(_788))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_788, float2(0.0), isnan(_788))).xw;
    float _213 = _211.x;
    float _215 = _211.y;
    float _217 = _181 * _183;
    float _219 = _93 * _161;
    float2 _806 = float2(_203, _205);
    float4 _222 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_806, float2(0.0), isnan(_806))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_806, float2(0.0), isnan(_806))).xyzw;
    float _224 = _222.x;
    float _226 = _222.y;
    float _228 = _222.z;
    float _230 = _222.w;
    float2 _822 = float2(_209, _217);
    float _232 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_822, float2(0.0), isnan(_822))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_822, float2(0.0), isnan(_822))).x;
    float2 _830 = float2(_219, _195);
    float4 _234 = dm_bs(spvDescriptorSet0.fp_t_tcb_34.sample(spvDescriptorSet0.fp_t_tcb_34Smplr, select(_830, float2(0.0), isnan(_830))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_34, spvDescriptorSet0.fp_t_tcb_34Smplr_w, select(_830, float2(0.0), isnan(_830))).xyzw;
    float _236 = _234.x;
    float _238 = _234.y;
    float _240 = _234.z;
    float _242 = _234.w;
    float2 _846 = float2(_207, _185);
    float _244 = dm_bs(spvDescriptorSet0.fp_t_tcb_36.sample(spvDescriptorSet0.fp_t_tcb_36Smplr, select(_846, float2(0.0), isnan(_846))), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_36, spvDescriptorSet0.fp_t_tcb_36Smplr_w, select(_846, float2(0.0), isnan(_846))).w;
    float _246 = in.m_57.x;
    float _248 = in.m_47.z;
    float _250 = gl_FragCoord.w;
    float _252 = _248 * _250;
    float _254 = in.m_59.w;
    float _256 = gl_FragCoord.w;
    float _258 = _254 * _256;
    float _260 = in.m_61.w;
    float _262 = gl_FragCoord.w;
    float _264 = _260 * _262;
    float _266 = abs((*spvDescriptorSet0.fp_c10)._m0[13].z);
    float _268 = log2(_266);
    float _270 = -(*spvDescriptorSet0.fp_c10)._m0[13].z;
    float _272 = fma(_270, 5.0, 5.0);
    float _274 = precise::clamp(_272, 0.0, 1.0);
    float _276 = fma(_274, 3.0, 1.0);
    float _278 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _280 = _268 * 0.60000002384185791015625;
    float _282 = _246 * _246;
    float _284 = _93 * _252;
    float _286 = _93 * _258;
    float _288 = _282 * _276;
    float _290 = _284 * _183;
    float _292 = _93 * _264;
    float _294 = exp2(_280);
    float _296 = 0.0 + _288;
    float _298 = precise::clamp(_296, 0.0, 1.0);
    float _300 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _302 = fma(_290, (*spvDescriptorSet0.fp_c8)._m0[30].w, _300);
    float _304 = _288 + (-1.0);
    float _306 = precise::clamp(_304, 0.0, 1.0);
    float _308 = 1.0 / _302;
    float _310 = -_213;
    float _312 = _310 + _215;
    float _314 = fma(_298, _312, _213);
    float _316 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _318 = fma(_232, (*spvDescriptorSet0.fp_c8)._m0[30].w, _316);
    float _320 = in.m_63.x;
    float _322 = gl_FragCoord.w;
    float _324 = _320 * _322;
    float _326 = _314 * _230;
    float _328 = 1.0 / _318;
    float _330 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _332 = _308 * _330;
    float _334 = _242 * _326;
    float _336 = _306 * 2.0;
    float _338 = _286 * _334;
    float _340 = _334 * _244;
    float _342 = _292 * _338;
    float _344 = -_342;
    float _346 = fma(_340, 3.0, _344);
    float _348 = fma(_336, _346, _342);
    float _350 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _352 = -_332;
    float _354 = fma(_328, _350, _352);
    float _356 = _348 * _294;
    float _358 = _354 * _278;
    float _360 = precise::clamp(_358, 0.0, 1.0);
    float _362 = 0.0 + _356;
    float _364 = precise::clamp(_362, 0.0, 1.0);
    float _366 = _93 * _324;
    float _368 = _364 * _360;
    float _370 = _368 * _366;
    bool _374 = _370 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _376 = isnan(_370);
    bool _378 = _374 || _376;
    bool _380 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _382 = _378 || _380;
    float _384 = in.m_59.x;
    float _386 = gl_FragCoord.w;
    float _388 = _384 * _386;
    float _390 = in.m_65.x;
    float _392 = _332;
    float _394 = _228;
    if (!_382)
    {
        discard_fragment();
    }
    float _396 = in.m_65.y;
    float _398 = in.m_59.z;
    float _400 = gl_FragCoord.w;
    float _402 = _398 * _400;
    float _404 = in.m_67.x;
    float _406 = in.m_61.z;
    float _408 = gl_FragCoord.w;
    float _410 = _406 * _408;
    float _412 = _93 * _388;
    float _414 = -_412;
    float _416 = fma(_390, (*spvDescriptorSet0.fp_c9)._m0[191].z, _414);
    float _418 = fma(_274, _416, _412);
    float _420 = in.m_59.y;
    float _422 = gl_FragCoord.w;
    float _424 = _420 * _422;
    float _426 = _93 * _402;
    float _428 = _93 * _410;
    float _430 = _93 * _424;
    float _432 = -_430;
    float _434 = fma(_396, (*spvDescriptorSet0.fp_c9)._m0[191].z, _432);
    float _436 = fma(_274, _434, _430);
    float _438 = in.m_65.z;
    float _440 = -_426;
    float _442 = fma(_438, (*spvDescriptorSet0.fp_c9)._m0[191].z, _440);
    float _444 = fma(_274, _442, _426);
    float _446 = in.m_61.x;
    float _448 = gl_FragCoord.w;
    float _450 = _446 * _448;
    float _452 = _93 * _450;
    float _454 = -_452;
    float _456 = fma(_404, (*spvDescriptorSet0.fp_c9)._m0[191].z, _454);
    float _458 = fma(_274, _456, _452);
    float _460 = in.m_61.y;
    float _462 = gl_FragCoord.w;
    float _464 = _460 * _462;
    float _466 = in.m_67.y;
    float _468 = _93 * _464;
    float _470 = -_468;
    float _472 = fma(_466, (*spvDescriptorSet0.fp_c9)._m0[191].z, _470);
    float _474 = fma(_274, _472, _468);
    float _476 = _314 * _224;
    float _478 = in.m_67.z;
    float _480 = _314 * _226;
    float _482 = _314 * _228;
    float _484 = _476 * _236;
    float _486 = _480 * _238;
    float _488 = _482 * _240;
    float _490 = -_484;
    float _492 = _490 + 1.0;
    float _494 = -_488;
    float _496 = _494 + 1.0;
    float _498 = _492 * _458;
    float _500 = fma(_484, _418, _498);
    float _502 = -_428;
    float _504 = fma(_478, (*spvDescriptorSet0.fp_c9)._m0[191].z, _502);
    float _506 = fma(_274, _504, _428);
    float _508 = -_486;
    float _510 = _508 + 1.0;
    float _512 = _510 * _474;
    float _514 = _496 * _506;
    float _516 = fma(_486, _436, _512);
    float _518 = fma(_488, _444, _514);
    if (!_382)
    {
        out.m_70.x = _500;
        out.m_70.y = _516;
        out.m_70.z = _518;
        out.m_70.w = _356;
        return out;
    }
    float _520 = _516 * 0.715200006961822509765625;
    float _522 = in.m_72.w;
    float _524 = gl_FragCoord.w;
    float _526 = _522 * _524;
    float _528 = in.m_72.y;
    float _530 = gl_FragCoord.w;
    float _532 = _528 * _530;
    float _534 = in.m_72.x;
    float _536 = gl_FragCoord.w;
    float _538 = _534 * _536;
    float _540 = fma(_500, 0.2125999927520751953125, _520);
    float _542 = in.m_72.z;
    float _544 = gl_FragCoord.w;
    float _546 = _542 * _544;
    float _548 = fma(_518, 0.072200000286102294921875, _540);
    bool _550 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _552 = 1.0 / _548;
    if (_550)
    {
        float _554 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _556 = _332 + _554;
        _392 = _556;
    }
    float _558 = _392;
    if (_550)
    {
        float _560 = _558 * 8.0;
        float _562 = precise::clamp(_560, 0.0, 1.0);
        _394 = _562;
    }
    float _564 = _394;
    float _566 = _552 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _568 = precise::clamp(_566, 0.0, 1.0);
    float _570 = fma(_568, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _572 = _93 * _526;
    float _574 = _93 * _532;
    float _576 = _93 * _538;
    float _578 = _570 * _572;
    float _580 = 0.0 + _370;
    float _582 = precise::clamp(_580, 0.0, 1.0);
    float _584 = _93 * _546;
    float _586 = fma(_500, _578, _576);
    float _588 = _582;
    if (_550)
    {
        float _590 = _582 * _564;
        _588 = _590;
    }
    float _592 = _588;
    float _594 = fma(_516, _578, _574);
    float _596 = fma(_518, _578, _584);
    float _598 = 0.0 + _592;
    float _600 = precise::clamp(_598, 0.0, 1.0);
    out.m_70.x = _586;
    out.m_70.y = _594;
    out.m_70.z = _596;
    out.m_70.w = _600;
    return out;
}

