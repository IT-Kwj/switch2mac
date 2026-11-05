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
    texture2d_array<float> fp_t_tcb_A [[id(6)]];
    sampler fp_t_tcb_ASmplr [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    sampler fp_t_tcb_ASmplr_w [[id(9)]];
    constant dm_border_t* dm_border [[id(10)]];
};

struct main0_out
{
    float4 m_63 [[color(0)]];
};

struct main0_in
{
    float4 m_44 [[user(locn0)]];
    float4 m_46 [[user(locn1)]];
    float4 m_58 [[user(locn2), flat]];
    float4 m_67 [[user(locn3)]];
    float4 m_48 [[user(locn4)]];
    float4 m_42 [[user(locn5)]];
    float4 m_60 [[user(locn6)]];
    float4 m_40 [[user(locn7), flat]];
    float4 m_50 [[user(locn8)]];
    float4 m_56 [[user(locn9)]];
    float4 m_65 [[user(locn10)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], bool gl_FrontFacing [[front_facing]])
{
    main0_out out = {};
    float _74 = gl_FragCoord.w;
    float _76 = in.m_40.y;
    float _78 = in.m_42.x;
    float _80 = gl_FragCoord.w;
    float _82 = _78 * _80;
    float _84 = in.m_42.y;
    float _86 = gl_FragCoord.w;
    float _88 = _84 * _86;
    float _90 = in.m_42.z;
    float _92 = gl_FragCoord.w;
    float _94 = _90 * _92;
    float _96 = in.m_42.w;
    float _98 = gl_FragCoord.w;
    float _100 = _96 * _98;
    float _102 = 1.0 / _74;
    float _104 = rint(_76);
    float _106 = precise::max(_104, 0.0);
    uint _109 = uint(_106);
    uint _111 = clamp(_109, 0u, 65535u);
    float _113 = _102 * _82;
    float _115 = _102 * _88;
    float _117 = _102 * _94;
    float _119 = _102 * _100;
    float2 _687 = float2(_113, _115);
    float _121 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_687, float2(0.0), isnan(_687))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_687, float2(0.0), isnan(_687))).w;
    float3 _701 = float3(_117, _119, float(int(_111)));
    float3 _705 = select(_701, float3(0.0), isnan(_701));
    float _123 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _705.xy, uint(rint(_705.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _705.xy, uint(rint(_705.z))).w;
    float _125 = in.m_44.w;
    float _127 = gl_FragCoord.w;
    float _129 = _125 * _127;
    float _131 = in.m_46.w;
    float _133 = gl_FragCoord.w;
    float _135 = _131 * _133;
    float _137 = in.m_48.x;
    float _139 = gl_FragCoord.w;
    float _141 = _137 * _139;
    float _143 = _102 * _129;
    float _145 = _102 * _141;
    float _147 = in.m_50.y;
    float _149 = gl_FragCoord.w;
    float _151 = _147 * _149;
    float _153 = as_type<float>(gl_FrontFacing ? (-1) : 0);
    float _155 = in.m_50.x;
    float _157 = gl_FragCoord.w;
    float _159 = _155 * _157;
    float _161 = in.m_50.z;
    float _163 = gl_FragCoord.w;
    float _165 = _161 * _163;
    float _167 = _102 * _151;
    bool _170 = as_type<int>(_153) != 0;
    float _172 = _102 * _159;
    bool _174 = !_170;
    float _176 = -_167;
    float _178 = _174 ? _176 : _167;
    bool _180 = !_170;
    float _182 = -_172;
    float _184 = _180 ? _182 : _172;
    float _186 = _178 * _178;
    float _188 = fma(_184, _184, _186);
    float _190 = -_143;
    float _192 = fma(_190, _121, 1.0);
    float _194 = _102 * _135;
    float _196 = _192 * _123;
    float _198 = _194 * _196;
    float _200 = 0.0 + _198;
    float _202 = precise::clamp(_200, 0.0, 1.0);
    float _204 = _202 * _145;
    bool _206 = _204 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _208 = isnan(_204);
    bool _210 = _206 || _208;
    bool _212 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _214 = _210 || _212;
    float _216 = in.m_56.y;
    float _218 = gl_FragCoord.w;
    float _220 = _216 * _218;
    float _222 = in.m_56.x;
    float _224 = gl_FragCoord.w;
    float _226 = _222 * _224;
    float _228 = in.m_56.z;
    float _230 = gl_FragCoord.w;
    float _232 = _228 * _230;
    if (!_214)
    {
        discard_fragment();
    }
    float _234 = in.m_44.z;
    float _236 = gl_FragCoord.w;
    float _238 = _234 * _236;
    float _240 = _102 * _220;
    float _242 = _102 * _226;
    float _244 = _102 * _232;
    float _246 = -(*spvDescriptorSet0.fp_c8)._m0[29].y;
    float _248 = _240 + _246;
    float _250 = -(*spvDescriptorSet0.fp_c8)._m0[29].x;
    float _252 = _242 + _250;
    float _254 = -(*spvDescriptorSet0.fp_c8)._m0[29].z;
    float _256 = _244 + _254;
    float _258 = -(*spvDescriptorSet0.fp_c10)._m0[9].w;
    float _260 = _240 + _258;
    float _262 = _248 * _248;
    float _264 = -(*spvDescriptorSet0.fp_c10)._m0[8].w;
    float _266 = _242 + _264;
    float _268 = -(*spvDescriptorSet0.fp_c10)._m0[10].w;
    float _270 = _244 + _268;
    float _272 = fma(_252, _252, _262);
    float _274 = fma(_256, _256, _272);
    float _276 = rsqrt(_274);
    float _278 = _252 * _276;
    float _280 = _248 * _276;
    float _282 = _256 * _276;
    float _284 = _102 * _165;
    bool _286 = !_170;
    float _288 = -_284;
    float _290 = _286 ? _288 : _284;
    float _292 = fma(_290, _290, _188);
    float _294 = rsqrt(_292);
    float _296 = _178 * _294;
    float _298 = _184 * _294;
    float _300 = _290 * _294;
    float _302 = _296 * _296;
    float _304 = fma(_298, _298, _302);
    float _306 = _260 * _260;
    float _308 = fma(_300, _300, _304);
    float _310 = fma(_266, _266, _306);
    float _312 = fma(_270, _270, _310);
    float _314 = rsqrt(_308);
    float _316 = rsqrt(_312);
    float _318 = _298 * _314;
    float _320 = _296 * _314;
    float _322 = _300 * _314;
    float _324 = in.m_46.z;
    float _326 = gl_FragCoord.w;
    float _328 = _324 * _326;
    float _330 = _270 * _316;
    float _332 = _280 * _280;
    float _334 = _266 * _316;
    float _336 = _260 * _316;
    float _338 = fma(_278, _278, _332);
    float _340 = _320 * _336;
    float _342 = fma(_282, _282, _338);
    float _344 = fma(_318, _334, _340);
    float _346 = rsqrt(_342);
    float _348 = in.m_44.x;
    float _350 = gl_FragCoord.w;
    float _352 = _348 * _350;
    float _354 = _280 * _346;
    float _356 = _278 * _346;
    float _358 = _282 * _346;
    float _360 = _320 * _354;
    float _362 = in.m_46.x;
    float _364 = gl_FragCoord.w;
    float _366 = _362 * _364;
    float _368 = fma(_318, _356, _360);
    float _370 = in.m_58.y;
    float _372 = in.m_46.y;
    float _374 = gl_FragCoord.w;
    float _376 = _372 * _374;
    float _378 = fma(_322, _358, _368);
    float _380 = fma(_322, _330, _344);
    float _382 = in.m_60.y;
    float _384 = gl_FragCoord.w;
    float _386 = _382 * _384;
    float _388 = in.m_44.y;
    float _390 = gl_FragCoord.w;
    float _392 = _388 * _390;
    float _394 = _102 * _386;
    float _396 = _394 * _370;
    float _398 = (*spvDescriptorSet0.fp_c10)._m0[2].x * 0.100000001490116119384765625;
    float _400 = fma(_396, 4.0, _398);
    float _402 = _400 * 0.15915493667125701904296875;
    float _404 = _402 * 6.283185482025146484375;
    float _406 = sin(_404);
    float _408 = fma(_406, 0.5, 0.5);
    float _410 = _102 * _366;
    float _412 = _408 * _408;
    float _414 = -_410;
    float _416 = _414 + 0.75;
    float _418 = _408 * _412;
    float _420 = _102 * _376;
    float _422 = _102 * _352;
    float _424 = _102 * _238;
    float _426 = _418 * 0.20000000298023223876953125;
    float _428 = -_420;
    float _430 = _428 + 0.75;
    float _432 = -_422;
    float _434 = _432 + 0.75;
    float _436 = -_424;
    float _438 = _436 + 0.75;
    float _440 = fma(_426, _416, _410);
    float _442 = _102 * _328;
    float _444 = fma(_426, _430, _420);
    float _446 = fma(_426, _434, _422);
    float _448 = -_442;
    float _450 = _448 + 0.75;
    float _452 = _102 * _392;
    float _454 = fma(_426, _438, _424);
    float _456 = fma(_426, _450, _442);
    float _458 = -_452;
    float _460 = _458 + 0.75;
    float _462 = abs(_378);
    float _464 = fma(_462, -1.66666662693023681640625, 1.33333337306976318359375);
    float _466 = precise::clamp(_464, 0.0, 1.0);
    float _468 = fma(_426, _460, _452);
    bool _470 = _380 >= 0.0;
    bool _472 = isnan(_380);
    bool _474 = _470 || _472;
    bool _476 = isnan(0.0);
    bool _478 = _474 || _476;
    float _480 = float(_478);
    float _482 = fma(_466, -2.0, 3.0);
    float _484 = _466 * _466;
    float _486 = _482 * _484;
    float _488 = fma(_486, 0.25, _446);
    float _490 = fma(_486, 0.25, _468);
    float _492 = fma(_486, 0.25, _454);
    float _494 = -_440;
    float _496 = _494 + _488;
    float _498 = -_444;
    float _500 = _498 + _490;
    float _502 = -_456;
    float _504 = _502 + _492;
    float _506 = fma(_480, _496, _440);
    float _508 = fma(_480, _500, _444);
    float _510 = fma(_480, _504, _456);
    if (!_214)
    {
        out.m_63.x = _506;
        out.m_63.y = _508;
        out.m_63.z = _510;
        out.m_63.w = _198;
        return out;
    }
    float _512 = _508 * 0.715200006961822509765625;
    float _514 = in.m_65.w;
    float _516 = gl_FragCoord.w;
    float _518 = _514 * _516;
    float _520 = in.m_65.x;
    float _522 = gl_FragCoord.w;
    float _524 = _520 * _522;
    float _526 = in.m_65.y;
    float _528 = gl_FragCoord.w;
    float _530 = _526 * _528;
    float _532 = fma(_506, 0.2125999927520751953125, _512);
    float _534 = in.m_65.z;
    float _536 = gl_FragCoord.w;
    float _538 = _534 * _536;
    bool _540 = 0.5 <= (*spvDescriptorSet0.fp_c15)._m0[653].w;
    float _542 = fma(_510, 0.072200000286102294921875, _532);
    float _544 = 1.0 / _542;
    float _546 = _544 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _548 = precise::clamp(_546, 0.0, 1.0);
    float _550 = 0.0 + _204;
    float _552 = precise::clamp(_550, 0.0, 1.0);
    float _554 = _102 * _518;
    float _556 = fma(_548, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _558 = _102 * _530;
    float _560 = _102 * _538;
    float _562 = _556 * _554;
    float _564 = _102 * _524;
    float _566 = fma(_508, _562, _558);
    float _568 = fma(_506, _562, _564);
    float _570 = fma(_510, _562, _560);
    bool _572 = !_540;
    float _574 = _552;
    if (!_572)
    {
        float _576 = in.m_67.w;
        float _578 = gl_FragCoord.w;
        float _580 = _576 * _578;
        float _582 = in.m_67.z;
        float _584 = gl_FragCoord.w;
        float _586 = _582 * _584;
        float _588 = _102 * _580;
        float _590 = _102 * _586;
        float _592 = 1.0 / _588;
        float _594 = _590 * _592;
        float _596 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _598 = fma(_594, (*spvDescriptorSet0.fp_c8)._m0[30].w, _596);
        float _600 = 1.0 / _598;
        float _602 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _604 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _606 = fma(_600, _602, _604);
        float _608 = _606 * 8.0;
        float _610 = precise::clamp(_608, 0.0, 1.0);
        float _612 = _552 * _610;
        _574 = _612;
    }
    float _614 = _574;
    float _616 = 0.0 + _614;
    float _618 = precise::clamp(_616, 0.0, 1.0);
    out.m_63.x = _568;
    out.m_63.y = _566;
    out.m_63.z = _570;
    out.m_63.w = _618;
    return out;
}

