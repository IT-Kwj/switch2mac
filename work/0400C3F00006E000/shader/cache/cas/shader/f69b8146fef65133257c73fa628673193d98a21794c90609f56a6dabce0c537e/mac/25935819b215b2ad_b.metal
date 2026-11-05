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
    constant _16* fp_c8 [[id(0)]];
    constant _16* fp_c9 [[id(1)]];
    constant _16* fp_c15 [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_10 [[id(5)]];
    sampler fp_t_tcb_10Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_C [[id(7)]];
    sampler fp_t_tcb_CSmplr [[id(8)]];
    texture2d<float> fp_t_tcb_A [[id(9)]];
    sampler fp_t_tcb_ASmplr [[id(10)]];
    sampler fp_t_tcb_8Smplr_w [[id(11)]];
    sampler fp_t_tcb_10Smplr_w [[id(12)]];
    sampler fp_t_tcb_CSmplr_w [[id(13)]];
    sampler fp_t_tcb_ASmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_58 [[color(0)]];
};

struct main0_in
{
    float4 m_53 [[user(locn0)]];
    float4 m_51 [[user(locn1)]];
    float4 m_41 [[user(locn2)]];
    float4 m_55 [[user(locn3)]];
    float4 m_39 [[user(locn4)]];
    float4 m_49 [[user(locn5), flat]];
    float4 m_43 [[user(locn6)]];
    float4 m_45 [[user(locn7)]];
    float4 m_47 [[user(locn8)]];
    float4 m_60 [[user(locn9)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _67 = gl_FragCoord.w;
    float _69 = in.m_39.y;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_39.x;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_41.w;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = in.m_41.x;
    float _89 = gl_FragCoord.w;
    float _91 = _87 * _89;
    float _93 = in.m_41.y;
    float _95 = gl_FragCoord.w;
    float _97 = _93 * _95;
    float _99 = in.m_43.x;
    float _101 = gl_FragCoord.w;
    float _103 = _99 * _101;
    float _105 = in.m_43.y;
    float _107 = gl_FragCoord.w;
    float _109 = _105 * _107;
    float _111 = 1.0 / _67;
    float _113 = _111 * _73;
    float _115 = _111 * _79;
    float _117 = _111 * _85;
    float _119 = _111 * _91;
    float _121 = _111 * _97;
    float _123 = _111 * _103;
    float2 _663 = float2(_115, _113);
    float _125 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_663, float2(0.0), isnan(_663))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_663, float2(0.0), isnan(_663))).y;
    float _127 = _111 * _109;
    float _129 = 1.0 / _117;
    float _131 = _119 * _129;
    float _133 = _121 * _129;
    float2 _685 = float2(_131, _133);
    float _135 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_685, float2(0.0), isnan(_685))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_685, float2(0.0), isnan(_685))).x;
    float2 _693 = float2(_123, _127);
    float _137 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_693, float2(0.0), isnan(_693))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_693, float2(0.0), isnan(_693))).w;
    float _139 = in.m_39.w;
    float _141 = gl_FragCoord.w;
    float _143 = _139 * _141;
    float _145 = in.m_39.z;
    float _147 = gl_FragCoord.w;
    float _149 = _145 * _147;
    float _151 = _111 * _143;
    float _153 = fma(_125, 0.20000000298023223876953125, _151);
    float _155 = _111 * _149;
    float2 _727 = float2(_155, _153);
    float4 _158 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_727, float2(0.0), isnan(_727))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_727, float2(0.0), isnan(_727))).xyzw;
    float _160 = _158.x;
    float _162 = _158.y;
    float _164 = _158.z;
    float _166 = _158.w;
    float _168 = in.m_45.y;
    float _170 = gl_FragCoord.w;
    float _172 = _168 * _170;
    float _174 = in.m_47.y;
    float _176 = gl_FragCoord.w;
    float _178 = _174 * _176;
    float _180 = in.m_45.x;
    float _182 = gl_FragCoord.w;
    float _184 = _180 * _182;
    float _186 = in.m_47.x;
    float _188 = gl_FragCoord.w;
    float _190 = _186 * _188;
    float _192 = in.m_47.z;
    float _194 = gl_FragCoord.w;
    float _196 = _192 * _194;
    float _198 = in.m_45.z;
    float _200 = gl_FragCoord.w;
    float _202 = _198 * _200;
    float _204 = _111 * _172;
    float _206 = _111 * _178;
    float _208 = _111 * _184;
    float _210 = _111 * _190;
    float _212 = _204 * _204;
    float _214 = -(*spvDescriptorSet0.fp_c8)._m0[29].y;
    float _216 = _206 + _214;
    float _218 = _111 * _196;
    float _220 = _111 * _202;
    float _222 = fma(_208, _208, _212);
    float _224 = -(*spvDescriptorSet0.fp_c8)._m0[29].x;
    float _226 = _210 + _224;
    float _228 = _216 * _216;
    float _230 = -(*spvDescriptorSet0.fp_c8)._m0[29].z;
    float _232 = _218 + _230;
    float _234 = fma(_220, _220, _222);
    float _236 = in.m_41.z;
    float _238 = gl_FragCoord.w;
    float _240 = _236 * _238;
    float _242 = fma(_226, _226, _228);
    float _244 = precise::max(0.0, _137);
    float _246 = fma(_232, _232, _242);
    float _248 = rsqrt(_234);
    float _250 = rsqrt(_246);
    float _252 = _204 * _248;
    float _254 = _208 * _248;
    float _256 = _220 * _248;
    float _258 = _252 * _252;
    float _260 = _216 * _250;
    float _262 = fma(_254, _254, _258);
    float _264 = _226 * _250;
    float _266 = _232 * _250;
    float _268 = _260 * _260;
    float _270 = in.m_49.x;
    float _272 = fma(_256, _256, _262);
    float _274 = fma(_264, _264, _268);
    float _276 = fma(_266, _266, _274);
    float _278 = rsqrt(_272);
    float _280 = rsqrt(_276);
    float _282 = _252 * _278;
    float _284 = _254 * _278;
    float _286 = _256 * _278;
    float _288 = _260 * _280;
    float _290 = -_270;
    float _292 = 1.0 / _290;
    float _294 = _264 * _280;
    float _296 = _266 * _280;
    float _298 = _282 * _288;
    float _300 = _111 * _240;
    float _302 = fma(_284, _294, _298);
    float _304 = _300 * _129;
    float _306 = in.m_51.w;
    float _308 = gl_FragCoord.w;
    float _310 = _306 * _308;
    float _312 = fma(_286, _296, _302);
    float _314 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _316 = fma(_304, (*spvDescriptorSet0.fp_c8)._m0[30].w, _314);
    float _318 = in.m_53.w;
    float _320 = gl_FragCoord.w;
    float _322 = _318 * _320;
    float _324 = -_270;
    float _326 = abs(_312);
    float _328 = _324 + _326;
    float _330 = 1.0 / _316;
    float _332 = _328 * _292;
    float _334 = precise::clamp(_332, 0.0, 1.0);
    float _336 = fma(_334, -2.0, 3.0);
    float _338 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _340 = fma(_135, (*spvDescriptorSet0.fp_c8)._m0[30].w, _338);
    float _342 = _334 * _334;
    float _344 = _336 * _342;
    float _346 = 1.0 / _340;
    float _348 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _350 = _330 * _348;
    float _352 = in.m_55.x;
    float _354 = gl_FragCoord.w;
    float _356 = _352 * _354;
    float _358 = _111 * _310;
    float _360 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _362 = -_350;
    float _364 = fma(_346, _360, _362);
    float _366 = _358 * _364;
    float _368 = precise::clamp(_366, 0.0, 1.0);
    float _370 = precise::min(_244, 0.300000011920928955078125);
    float _372 = -_368;
    float _374 = _372 + 1.0;
    float _376 = _370 * 3.3333332538604736328125;
    float _378 = in.m_51.z;
    float _380 = gl_FragCoord.w;
    float _382 = _378 * _380;
    float _384 = in.m_53.y;
    float _386 = gl_FragCoord.w;
    float _388 = _384 * _386;
    float _390 = in.m_53.z;
    float _392 = gl_FragCoord.w;
    float _394 = _390 * _392;
    float _396 = fma(_368, -0.20000000298023223876953125, 0.20000000298023223876953125);
    float _398 = _166 * _344;
    float _400 = fma(_166, _374, _398);
    float _402 = _111 * _322;
    float _404 = _400 * _376;
    float _406 = _402 + 0.3499999940395355224609375;
    float _408 = precise::max(_402, _404);
    float _410 = precise::min(_406, _408);
    float _412 = _111 * _356;
    float _414 = -_402;
    float _416 = _414 + _410;
    float _418 = _416 * 2.857142925262451171875;
    float _420 = 0.0 + _418;
    float _422 = precise::clamp(_420, 0.0, 1.0);
    float _424 = _422 * _412;
    bool _428 = _424 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _430 = isnan(_424);
    bool _432 = _428 || _430;
    bool _434 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _436 = _432 || _434;
    float _438 = in.m_51.x;
    float _440 = gl_FragCoord.w;
    float _442 = _438 * _440;
    float _444 = in.m_51.y;
    float _446 = gl_FragCoord.w;
    float _448 = _444 * _446;
    float _450 = in.m_53.x;
    float _452 = gl_FragCoord.w;
    float _454 = _450 * _452;
    float _456 = _350;
    if (!_436)
    {
        discard_fragment();
    }
    float _458 = -_160;
    float _460 = _458 + 1.0;
    float _462 = -_162;
    float _464 = _462 + 1.0;
    float _466 = -_164;
    float _468 = _466 + 1.0;
    float _470 = _111 * _442;
    float _472 = _111 * _448;
    float _474 = _111 * _382;
    float _476 = _470 * _460;
    float _478 = _472 * _464;
    float _480 = _474 * _468;
    float _482 = _111 * _454;
    float _484 = _111 * _388;
    float _486 = _111 * _394;
    float _488 = fma(_160, _482, _476);
    float _490 = fma(_162, _484, _478);
    float _492 = fma(_164, _486, _480);
    float _494 = _488 + _396;
    float _496 = _490 + _396;
    float _498 = _492 + _396;
    if (!_436)
    {
        out.m_58.x = _494;
        out.m_58.y = _496;
        out.m_58.z = _498;
        out.m_58.w = _418;
        return out;
    }
    float _500 = _496 * 0.715200006961822509765625;
    float _502 = in.m_60.w;
    float _504 = gl_FragCoord.w;
    float _506 = _502 * _504;
    float _508 = in.m_60.x;
    float _510 = gl_FragCoord.w;
    float _512 = _508 * _510;
    float _514 = in.m_60.y;
    float _516 = gl_FragCoord.w;
    float _518 = _514 * _516;
    float _520 = fma(_494, 0.2125999927520751953125, _500);
    float _522 = in.m_60.z;
    float _524 = gl_FragCoord.w;
    float _526 = _522 * _524;
    float _528 = fma(_498, 0.072200000286102294921875, _520);
    bool _530 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _532 = 1.0 / _528;
    float _534 = (*spvDescriptorSet0.fp_c15)._m0[2].y;
    if (_530)
    {
        float _536 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _538 = _350 + _536;
        _456 = _538;
    }
    float _540 = _456;
    float _542 = _532 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _544 = precise::clamp(_542, 0.0, 1.0);
    float _546 = fma(_544, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _548 = _111 * _506;
    if (_530)
    {
        float _550 = _540 * 8.0;
        float _552 = precise::clamp(_550, 0.0, 1.0);
        _534 = _552;
    }
    float _554 = _534;
    float _556 = _111 * _512;
    float _558 = _546 * _548;
    float _560 = 0.0 + _424;
    float _562 = precise::clamp(_560, 0.0, 1.0);
    float _564 = _111 * _518;
    float _566 = _111 * _526;
    float _568 = fma(_494, _558, _556);
    float _570 = _562;
    if (_530)
    {
        float _572 = _562 * _554;
        _570 = _572;
    }
    float _574 = _570;
    float _576 = fma(_496, _558, _564);
    float _578 = fma(_498, _558, _566);
    float _580 = 0.0 + _574;
    float _582 = precise::clamp(_580, 0.0, 1.0);
    out.m_58.x = _568;
    out.m_58.y = _576;
    out.m_58.z = _578;
    out.m_58.w = _582;
    return out;
}

