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
    constant _16* fp_c15 [[id(1)]];
    constant _16* fp_c8 [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_C [[id(5)]];
    sampler fp_t_tcb_CSmplr [[id(6)]];
    texture2d<float> fp_t_tcb_A [[id(7)]];
    sampler fp_t_tcb_ASmplr [[id(8)]];
    texturecube<float> fp_t_tcb_1E [[id(9)]];
    sampler fp_t_tcb_1ESmplr [[id(10)]];
    sampler fp_t_tcb_8Smplr_w [[id(11)]];
    sampler fp_t_tcb_CSmplr_w [[id(12)]];
    sampler fp_t_tcb_ASmplr_w [[id(13)]];
    sampler fp_t_tcb_1ESmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_55 [[color(0)]];
};

struct main0_in
{
    float4 m_44 [[user(locn0)]];
    float4 m_48 [[user(locn1)]];
    float4 m_50 [[user(locn2)]];
    float4 m_69 [[user(locn3)]];
    float4 m_46 [[user(locn4)]];
    float4 m_42 [[user(locn5)]];
    float4 m_75 [[user(locn6)]];
    float4 m_52 [[user(locn7)]];
    float4 m_59 [[user(locn8)]];
    float4 m_61 [[user(locn9)]];
    float4 m_57 [[user(locn10)]];
    float4 m_71 [[user(locn11)]];
    float4 m_67 [[user(locn12)]];
    float4 m_73 [[user(locn13)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], bool gl_FrontFacing [[front_facing]])
{
    main0_out out = {};
    float _82 = gl_FragCoord.w;
    float _84 = in.m_42.x;
    float _86 = gl_FragCoord.w;
    float _88 = _84 * _86;
    float _90 = in.m_42.y;
    float _92 = gl_FragCoord.w;
    float _94 = _90 * _92;
    float _96 = 1.0 / _82;
    float _98 = _96 * _88;
    float _100 = _96 * _94;
    float2 _719 = float2(_98, _100);
    float4 _103 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_719, float2(0.0), isnan(_719))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_719, float2(0.0), isnan(_719))).xyzw;
    float _105 = _103.x;
    float _107 = _103.y;
    float _109 = _103.z;
    float _111 = _103.w;
    float _113 = in.m_44.w;
    float _115 = gl_FragCoord.w;
    float _117 = _113 * _115;
    float _119 = in.m_46.w;
    float _121 = gl_FragCoord.w;
    float _123 = _119 * _121;
    float _125 = in.m_48.w;
    float _127 = gl_FragCoord.w;
    float _129 = _125 * _127;
    float _131 = in.m_50.x;
    float _133 = gl_FragCoord.w;
    float _135 = _131 * _133;
    float _137 = _96 * _117;
    float _139 = _96 * _123;
    float _141 = _96 * _129;
    float _143 = in.m_52.y;
    float _145 = gl_FragCoord.w;
    float _147 = _143 * _145;
    float _149 = in.m_42.w;
    float _151 = gl_FragCoord.w;
    float _153 = _149 * _151;
    float _155 = _96 * _153;
    float _157 = -_137;
    float _159 = fma(_111, _139, _157);
    float _161 = _141 * _159;
    float _163 = _96 * _135;
    float _165 = 0.0 + _161;
    float _167 = precise::clamp(_165, 0.0, 1.0);
    float _169 = _167 * _163;
    bool _172 = _169 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _174 = isnan(_169);
    bool _176 = _172 || _174;
    bool _178 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _180 = _176 || _178;
    float _182 = in.m_52.x;
    float _184 = gl_FragCoord.w;
    float _186 = _182 * _184;
    float _188 = in.m_42.z;
    float _190 = gl_FragCoord.w;
    float _192 = _188 * _190;
    if (!_180)
    {
        discard_fragment();
    }
    float _194 = _96 * _186;
    float _196 = _96 * _147;
    float _198 = _96 * _192;
    float2 _857 = float2(_194, _196);
    float3 _202 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_857, float2(0.0), isnan(_857))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_857, float2(0.0), isnan(_857))).xyz;
    float _204 = _202.x;
    float _206 = _202.y;
    float _208 = _202.z;
    float2 _871 = float2(_198, _155);
    float2 _212 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_871, float2(0.0), isnan(_871))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_871, float2(0.0), isnan(_871))).xy;
    float _214 = _212.x;
    float _216 = _212.y;
    float _218 = in.m_44.x;
    float _220 = gl_FragCoord.w;
    float _222 = _218 * _220;
    float _224 = in.m_44.y;
    float _226 = gl_FragCoord.w;
    float _228 = _224 * _226;
    float _230 = in.m_48.y;
    float _232 = gl_FragCoord.w;
    float _234 = _230 * _232;
    float _236 = in.m_48.x;
    float _238 = gl_FragCoord.w;
    float _240 = _236 * _238;
    float _242 = in.m_44.z;
    float _244 = gl_FragCoord.w;
    float _246 = _242 * _244;
    float _248 = in.m_48.z;
    float _250 = gl_FragCoord.w;
    float _252 = _248 * _250;
    float _254 = in.m_46.x;
    float _256 = gl_FragCoord.w;
    float _258 = _254 * _256;
    float _260 = in.m_46.y;
    float _262 = gl_FragCoord.w;
    float _264 = _260 * _262;
    float _266 = in.m_46.z;
    float _268 = gl_FragCoord.w;
    float _270 = _266 * _268;
    float _272 = _96 * _222;
    float _274 = _96 * _234;
    float _276 = _96 * _240;
    float _278 = -_276;
    float _280 = _272 + _278;
    float _282 = _105 * _204;
    float _284 = _96 * _228;
    float _286 = _107 * _206;
    float _288 = _96 * _246;
    float _290 = _96 * _252;
    float _292 = -_274;
    float _294 = _284 + _292;
    float _296 = _109 * _208;
    float _298 = fma(_282, _280, _276);
    float _300 = -_290;
    float _302 = _288 + _300;
    float _304 = fma(_286, _294, _274);
    float _306 = _96 * _258;
    float _308 = _96 * _264;
    float _310 = fma(_296, _302, _290);
    float _312 = _96 * _270;
    float _314 = _298 * _306;
    float _316 = _304 * _308;
    float _318 = _310 * _312;
    if (!_180)
    {
        out.m_55.x = _314;
        out.m_55.y = _316;
        out.m_55.z = _318;
        out.m_55.w = _161;
        return out;
    }
    float _320 = in.m_57.y;
    float _322 = gl_FragCoord.w;
    float _324 = _320 * _322;
    float _326 = in.m_57.x;
    float _328 = gl_FragCoord.w;
    float _330 = _326 * _328;
    float _332 = in.m_57.z;
    float _334 = gl_FragCoord.w;
    float _336 = _332 * _334;
    float _338 = in.m_59.y;
    float _340 = gl_FragCoord.w;
    float _342 = _338 * _340;
    float _344 = in.m_59.x;
    float _346 = gl_FragCoord.w;
    float _348 = _344 * _346;
    float _350 = in.m_59.z;
    float _352 = gl_FragCoord.w;
    float _354 = _350 * _352;
    float _356 = in.m_61.y;
    float _358 = gl_FragCoord.w;
    float _360 = _356 * _358;
    float _362 = in.m_61.x;
    float _364 = gl_FragCoord.w;
    float _366 = _362 * _364;
    float _368 = in.m_61.z;
    float _370 = gl_FragCoord.w;
    float _372 = _368 * _370;
    float _374 = _216 * _216;
    float _376 = as_type<float>(gl_FrontFacing ? (-1) : 0);
    float _378 = fma(_214, _214, _374);
    float _380 = precise::clamp(_378, 0.0, 1.0);
    float _382 = -_380;
    float _384 = _382 + 1.0;
    float _386 = sqrt(_384);
    float _388 = _96 * _324;
    float _390 = _96 * _330;
    float _392 = _96 * _336;
    float _394 = _96 * _342;
    float _396 = _388 * _388;
    float _398 = _96 * _354;
    float _400 = _96 * _360;
    float _402 = _96 * _366;
    float _404 = fma(_390, _390, _396);
    float _406 = _96 * _348;
    float _408 = _394 * _394;
    float _410 = _400 * _400;
    float _412 = fma(_392, _392, _404);
    float _414 = _96 * _372;
    float _416 = fma(_406, _406, _408);
    float _418 = fma(_402, _402, _410);
    bool _420 = as_type<int>(_376) != 0;
    float _422 = fma(_398, _398, _416);
    float _424 = fma(_414, _414, _418);
    float _426 = rsqrt(_412);
    float _428 = rsqrt(_422);
    float _430 = rsqrt(_424);
    float _432 = _426 * _214;
    float _434 = _428 * _216;
    float _436 = _394 * _434;
    float _438 = _406 * _434;
    float _440 = _398 * _434;
    float _442 = _430 * _386;
    float _444 = fma(_388, _432, _436);
    float _446 = fma(_390, _432, _438);
    float _448 = fma(_392, _432, _440);
    float _450 = fma(_400, _442, _444);
    float _452 = fma(_402, _442, _446);
    float _454 = fma(_414, _442, _448);
    float _456 = in.m_67.x;
    float _458 = gl_FragCoord.w;
    float _460 = _456 * _458;
    bool _462 = !_420;
    float _464 = -_450;
    float _466 = _462 ? _464 : _450;
    bool _468 = !_420;
    float _470 = -_452;
    float _472 = _468 ? _470 : _452;
    bool _474 = !_420;
    float _476 = -_454;
    float _478 = _474 ? _476 : _454;
    float _480 = _466 * _466;
    float _482 = fma(_472, _472, _480);
    float _484 = fma(_478, _478, _482);
    float _486 = rsqrt(_484);
    float _488 = _472 * _486;
    float _490 = _466 * _486;
    float _492 = _478 * _486;
    float _494 = abs(_488);
    float _496 = abs(_490);
    float _498 = precise::max(_494, _496);
    float _500 = abs(_492);
    float _502 = precise::max(_500, _498);
    float _504 = _96 * _460;
    float _506 = 1.0 / _502;
    float _508 = _490 * _506;
    float _510 = _488 * _506;
    float _512 = -_506;
    float _514 = _492 * _512;
    float _516 = precise::min(_504, 1.0);
    float3 _1308 = float3(_510, _508, _514);
    float3 _518 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1308, float3(0.0), isnan(_1308)), level(_516)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1308, float3(0.0), isnan(_1308)), level(_516)).xyz;
    float _520 = _518.x;
    float _522 = _518.y;
    float _524 = _518.z;
    float _526 = in.m_69.x;
    float _528 = gl_FragCoord.w;
    float _530 = _526 * _528;
    float _532 = in.m_69.y;
    float _534 = gl_FragCoord.w;
    float _536 = _532 * _534;
    float _538 = in.m_69.z;
    float _540 = gl_FragCoord.w;
    float _542 = _538 * _540;
    float _544 = in.m_71.y;
    float _546 = gl_FragCoord.w;
    float _548 = _544 * _546;
    float _550 = in.m_71.z;
    float _552 = gl_FragCoord.w;
    float _554 = _550 * _552;
    float _556 = in.m_71.x;
    float _558 = gl_FragCoord.w;
    float _560 = _556 * _558;
    float _562 = in.m_73.x;
    float _564 = gl_FragCoord.w;
    float _566 = _562 * _564;
    float _568 = in.m_73.w;
    float _570 = gl_FragCoord.w;
    float _572 = _568 * _570;
    float _574 = in.m_73.y;
    float _576 = gl_FragCoord.w;
    float _578 = _574 * _576;
    float _580 = in.m_73.z;
    float _582 = gl_FragCoord.w;
    float _584 = _580 * _582;
    float _586 = _96 * _530;
    float _588 = _96 * _536;
    float _590 = _96 * _542;
    bool _592 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _594 = fma(_522, 0.20999999344348907470703125, _588);
    float _596 = fma(_524, 0.20999999344348907470703125, _590);
    float _598 = _96 * _548;
    float _600 = fma(_520, 0.20999999344348907470703125, _586);
    float _602 = _96 * _554;
    float _604 = _96 * _560;
    float _606 = _594 + _598;
    float _608 = _96 * _584;
    float _610 = _596 + _602;
    float _612 = _600 + _604;
    float _614 = _316 * _606;
    float _616 = 0.0 + _169;
    float _618 = precise::clamp(_616, 0.0, 1.0);
    float _620 = _318 * _610;
    float _622 = _314 * _612;
    float _624 = _96 * _566;
    float _626 = _96 * _572;
    float _628 = _96 * _578;
    float _630 = fma(_622, _626, _624);
    float _632 = fma(_614, _626, _628);
    float _634 = fma(_620, _626, _608);
    float _636 = _624;
    if (!_592)
    {
        _636 = _618;
    }
    float _638 = _636;
    bool _640 = !_592;
    float _642 = _638;
    if (!_640)
    {
        float _644 = in.m_75.w;
        float _646 = gl_FragCoord.w;
        float _648 = _644 * _646;
        float _650 = in.m_75.z;
        float _652 = gl_FragCoord.w;
        float _654 = _650 * _652;
        float _656 = _96 * _648;
        float _658 = _96 * _654;
        float _660 = 1.0 / _656;
        float _662 = _658 * _660;
        float _664 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _666 = fma(_662, (*spvDescriptorSet0.fp_c8)._m0[30].w, _664);
        float _668 = 1.0 / _666;
        float _670 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _672 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _674 = fma(_668, _670, _672);
        float _676 = _674 * 8.0;
        float _678 = precise::clamp(_676, 0.0, 1.0);
        float _680 = _618 * _678;
        _642 = _680;
    }
    float _682 = _642;
    float _684 = 0.0 + _682;
    float _686 = precise::clamp(_684, 0.0, 1.0);
    out.m_55.x = _630;
    out.m_55.y = _632;
    out.m_55.z = _634;
    out.m_55.w = _686;
    return out;
}

