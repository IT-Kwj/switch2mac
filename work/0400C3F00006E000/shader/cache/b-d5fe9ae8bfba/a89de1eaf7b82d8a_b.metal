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
    constant _16* fp_c15 [[id(2)]];
    constant _16* fp_c8 [[id(3)]];
    texture2d<float> fp_t_tcb_8 [[id(4)]];
    sampler fp_t_tcb_8Smplr [[id(5)]];
    sampler fp_t_tcb_8Smplr_w [[id(6)]];
    constant dm_border_t* dm_border [[id(7)]];
};

struct main0_out
{
    float4 m_44 [[color(0)]];
};

struct main0_in
{
    float4 m_41 [[user(locn0)]];
    float4 m_39 [[user(locn1)]];
    float4 m_37 [[user(locn2), flat]];
    float4 m_48 [[user(locn3)]];
    float4 m_35 [[user(locn4)]];
    float4 m_46 [[user(locn6)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _55 = gl_FragCoord.w;
    float _57 = in.m_35.x;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = in.m_35.y;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = 1.0 / _55;
    float _71 = _69 * _61;
    float _73 = _69 * _67;
    float2 _698 = float2(_71, _73);
    float4 _76 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_698, float2(0.0), isnan(_698))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_698, float2(0.0), isnan(_698))).xyzw;
    float _78 = _76.x;
    float _80 = _76.y;
    float _82 = _76.z;
    float _84 = _76.w;
    float _86 = in.m_37.y;
    float _88 = in.m_37.x;
    float _90 = in.m_37.z;
    float _92 = in.m_39.x;
    float _94 = gl_FragCoord.w;
    float _96 = _92 * _94;
    float _98 = -_86;
    float _100 = _98 + (*spvDescriptorSet0.fp_c10)._m0[9].w;
    float _102 = -_88;
    float _104 = _102 + (*spvDescriptorSet0.fp_c10)._m0[8].w;
    float _106 = -_90;
    float _108 = _106 + (*spvDescriptorSet0.fp_c10)._m0[10].w;
    float _110 = _100 * _100;
    float _112 = fma(_104, _104, _110);
    float _114 = fma(_108, _108, _112);
    float _116 = sqrt(_114);
    float _118 = precise::max(_116, 300.0);
    float _120 = precise::min(_118, 400.0);
    float _122 = fma(_120, -0.00999999977648258209228515625, 4.0);
    float _124 = (*spvDescriptorSet0.fp_c9)._m0[191].x * (-0.0199999995529651641845703125);
    float _126 = _124 * (*spvDescriptorSet0.fp_c10)._m0[2].x;
    float _128 = fma(_116, 0.004999999888241291046142578125, _126);
    float _130 = floor(_128);
    float _132 = -_130;
    float _134 = _128 + _132;
    float _136 = precise::clamp(_134, 0.0, 1.0);
    float _138 = -(*spvDescriptorSet0.fp_c9)._m0[124].w;
    float _140 = _136 + _138;
    float _142 = -(*spvDescriptorSet0.fp_c9)._m0[123].x;
    float _144 = (*spvDescriptorSet0.fp_c9)._m0[124].x + _142;
    float _146 = _84 * _122;
    float _148 = _69 * _96;
    float _150 = 0.0 + _146;
    float _152 = precise::clamp(_150, 0.0, 1.0);
    float _154 = _152 * _148;
    bool _158 = _154 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _160 = isnan(_154);
    bool _162 = _158 || _160;
    bool _164 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _166 = _162 || _164;
    if (!_166)
    {
        discard_fragment();
    }
    float _168 = -(*spvDescriptorSet0.fp_c9)._m0[123].w;
    float _170 = (*spvDescriptorSet0.fp_c9)._m0[124].w + _168;
    float _172 = -(*spvDescriptorSet0.fp_c9)._m0[124].w;
    float _174 = _172 + (*spvDescriptorSet0.fp_c9)._m0[125].w;
    float _176 = -(*spvDescriptorSet0.fp_c9)._m0[123].w;
    float _178 = _136 + _176;
    float _180 = 1.0 / _170;
    float _182 = 1.0 / _174;
    float _184 = _178 * _180;
    float _186 = -(*spvDescriptorSet0.fp_c9)._m0[123].z;
    float _188 = (*spvDescriptorSet0.fp_c9)._m0[124].z + _186;
    float _190 = -(*spvDescriptorSet0.fp_c9)._m0[123].y;
    float _192 = (*spvDescriptorSet0.fp_c9)._m0[124].y + _190;
    float _194 = fma(_144, _184, (*spvDescriptorSet0.fp_c9)._m0[123].x);
    float _196 = fma(_188, _184, (*spvDescriptorSet0.fp_c9)._m0[123].z);
    float _198 = fma(_192, _184, (*spvDescriptorSet0.fp_c9)._m0[123].y);
    float _200 = _140 * _182;
    float _202 = -(*spvDescriptorSet0.fp_c9)._m0[124].x;
    float _204 = _202 + (*spvDescriptorSet0.fp_c9)._m0[125].x;
    float _206 = -(*spvDescriptorSet0.fp_c9)._m0[124].z;
    float _208 = _206 + (*spvDescriptorSet0.fp_c9)._m0[125].z;
    bool _210 = _136 >= (*spvDescriptorSet0.fp_c9)._m0[124].w;
    bool _212 = isnan(_136);
    bool _214 = _210 || _212;
    bool _216 = isnan((*spvDescriptorSet0.fp_c9)._m0[124].w);
    bool _218 = _214 || _216;
    float _220 = float(_218);
    float _222 = -(*spvDescriptorSet0.fp_c9)._m0[124].y;
    float _224 = _222 + (*spvDescriptorSet0.fp_c9)._m0[125].y;
    bool _226 = _136 >= (*spvDescriptorSet0.fp_c9)._m0[123].w;
    bool _228 = isnan(_136);
    bool _230 = _226 || _228;
    bool _232 = isnan((*spvDescriptorSet0.fp_c9)._m0[123].w);
    bool _234 = _230 || _232;
    float _236 = float(_234);
    float _238 = fma(_204, _200, (*spvDescriptorSet0.fp_c9)._m0[124].x);
    float _240 = fma(_208, _200, (*spvDescriptorSet0.fp_c9)._m0[124].z);
    float _242 = -_220;
    float _244 = _242 + 1.0;
    float _246 = fma(_224, _200, (*spvDescriptorSet0.fp_c9)._m0[124].y);
    float _248 = _236 * _244;
    float _250 = -_236;
    float _252 = _250 + 1.0;
    float _254 = _194 * _248;
    float _256 = _198 * _248;
    float _258 = _196 * _248;
    float _260 = fma(_252, (*spvDescriptorSet0.fp_c9)._m0[123].x, _254);
    float _262 = fma(_252, (*spvDescriptorSet0.fp_c9)._m0[123].y, _256);
    float _264 = fma(_252, (*spvDescriptorSet0.fp_c9)._m0[123].z, _258);
    bool _266 = _136 >= (*spvDescriptorSet0.fp_c9)._m0[125].w;
    bool _268 = isnan(_136);
    bool _270 = _266 || _268;
    bool _272 = isnan((*spvDescriptorSet0.fp_c9)._m0[125].w);
    bool _274 = _270 || _272;
    float _276 = float(_274);
    float _278 = -_276;
    float _280 = _278 + 1.0;
    float _282 = _220 * _280;
    float _284 = fma(_238, _282, _260);
    float _286 = -(*spvDescriptorSet0.fp_c9)._m0[125].w;
    float _288 = (*spvDescriptorSet0.fp_c9)._m0[126].w + _286;
    bool _290 = _136 >= (*spvDescriptorSet0.fp_c9)._m0[126].w;
    bool _292 = isnan(_136);
    bool _294 = _290 || _292;
    bool _296 = isnan((*spvDescriptorSet0.fp_c9)._m0[126].w);
    bool _298 = _294 || _296;
    float _300 = float(_298);
    float _302 = fma(_246, _282, _262);
    float _304 = fma(_240, _282, _264);
    float _306 = -(*spvDescriptorSet0.fp_c9)._m0[125].w;
    float _308 = _136 + _306;
    float _310 = 1.0 / _288;
    float _312 = -_300;
    float _314 = _312 + 1.0;
    float _316 = _276 * _314;
    float _318 = -(*spvDescriptorSet0.fp_c9)._m0[126].w;
    float _320 = _318 + (*spvDescriptorSet0.fp_c9)._m0[127].w;
    float _322 = 1.0 / _320;
    float _324 = _308 * _310;
    float _326 = -(*spvDescriptorSet0.fp_c9)._m0[125].x;
    float _328 = (*spvDescriptorSet0.fp_c9)._m0[126].x + _326;
    float _330 = -(*spvDescriptorSet0.fp_c9)._m0[126].w;
    float _332 = _136 + _330;
    float _334 = fma(_328, _324, (*spvDescriptorSet0.fp_c9)._m0[125].x);
    float _336 = fma(_334, _316, _284);
    float _338 = -(*spvDescriptorSet0.fp_c9)._m0[125].y;
    float _340 = (*spvDescriptorSet0.fp_c9)._m0[126].y + _338;
    float _342 = _332 * _322;
    bool _344 = _136 >= (*spvDescriptorSet0.fp_c9)._m0[127].w;
    bool _346 = isnan(_136);
    bool _348 = _344 || _346;
    bool _350 = isnan((*spvDescriptorSet0.fp_c9)._m0[127].w);
    bool _352 = _348 || _350;
    float _354 = float(_352);
    float _356 = fma(_340, _324, (*spvDescriptorSet0.fp_c9)._m0[125].y);
    float _358 = -(*spvDescriptorSet0.fp_c9)._m0[126].x;
    float _360 = _358 + (*spvDescriptorSet0.fp_c9)._m0[127].x;
    float _362 = -(*spvDescriptorSet0.fp_c9)._m0[126].y;
    float _364 = _362 + (*spvDescriptorSet0.fp_c9)._m0[127].y;
    float _366 = -(*spvDescriptorSet0.fp_c9)._m0[126].z;
    float _368 = _366 + (*spvDescriptorSet0.fp_c9)._m0[127].z;
    float _370 = fma(_356, _316, _302);
    float _372 = -(*spvDescriptorSet0.fp_c9)._m0[125].z;
    float _374 = (*spvDescriptorSet0.fp_c9)._m0[126].z + _372;
    float _376 = fma(_360, _342, (*spvDescriptorSet0.fp_c9)._m0[126].x);
    float _378 = fma(_364, _342, (*spvDescriptorSet0.fp_c9)._m0[126].y);
    float _380 = fma(_368, _342, (*spvDescriptorSet0.fp_c9)._m0[126].z);
    float _382 = fma(_374, _324, (*spvDescriptorSet0.fp_c9)._m0[125].z);
    float _384 = fma(_382, _316, _304);
    float _386 = -_354;
    float _388 = _386 + 1.0;
    float _390 = _300 * _388;
    bool _392 = _136 >= (*spvDescriptorSet0.fp_c9)._m0[128].w;
    bool _394 = isnan(_136);
    bool _396 = _392 || _394;
    bool _398 = isnan((*spvDescriptorSet0.fp_c9)._m0[128].w);
    bool _400 = _396 || _398;
    float _402 = float(_400);
    float _404 = fma(_376, _390, _336);
    float _406 = -(*spvDescriptorSet0.fp_c9)._m0[127].w;
    float _408 = (*spvDescriptorSet0.fp_c9)._m0[128].w + _406;
    float _410 = fma(_378, _390, _370);
    float _412 = fma(_380, _390, _384);
    float _414 = -(*spvDescriptorSet0.fp_c9)._m0[127].w;
    float _416 = _136 + _414;
    float _418 = -_402;
    float _420 = _418 + 1.0;
    float _422 = 1.0 / _408;
    float _424 = _354 * _420;
    float _426 = -(*spvDescriptorSet0.fp_c9)._m0[128].w;
    float _428 = _426 + (*spvDescriptorSet0.fp_c9)._m0[129].w;
    float _430 = 1.0 / _428;
    float _432 = _416 * _422;
    float _434 = -(*spvDescriptorSet0.fp_c9)._m0[127].x;
    float _436 = (*spvDescriptorSet0.fp_c9)._m0[128].x + _434;
    float _438 = -(*spvDescriptorSet0.fp_c9)._m0[128].w;
    float _440 = _136 + _438;
    bool _442 = _136 >= (*spvDescriptorSet0.fp_c9)._m0[129].w;
    bool _444 = isnan(_136);
    bool _446 = _442 || _444;
    bool _448 = isnan((*spvDescriptorSet0.fp_c9)._m0[129].w);
    bool _450 = _446 || _448;
    float _452 = float(_450);
    float _454 = fma(_436, _432, (*spvDescriptorSet0.fp_c9)._m0[127].x);
    float _456 = fma(_454, _424, _404);
    float _458 = -(*spvDescriptorSet0.fp_c9)._m0[127].y;
    float _460 = (*spvDescriptorSet0.fp_c9)._m0[128].y + _458;
    float _462 = _440 * _430;
    float _464 = -(*spvDescriptorSet0.fp_c9)._m0[128].x;
    float _466 = _464 + (*spvDescriptorSet0.fp_c9)._m0[129].x;
    float _468 = fma(_460, _432, (*spvDescriptorSet0.fp_c9)._m0[127].y);
    float _470 = in.m_41.y;
    float _472 = gl_FragCoord.w;
    float _474 = _470 * _472;
    float _476 = -(*spvDescriptorSet0.fp_c9)._m0[128].y;
    float _478 = _476 + (*spvDescriptorSet0.fp_c9)._m0[129].y;
    float _480 = -(*spvDescriptorSet0.fp_c9)._m0[128].z;
    float _482 = _480 + (*spvDescriptorSet0.fp_c9)._m0[129].z;
    float _484 = fma(_468, _424, _410);
    float _486 = -(*spvDescriptorSet0.fp_c9)._m0[127].z;
    float _488 = (*spvDescriptorSet0.fp_c9)._m0[128].z + _486;
    float _490 = fma(_478, _462, (*spvDescriptorSet0.fp_c9)._m0[128].y);
    float _492 = fma(_482, _462, (*spvDescriptorSet0.fp_c9)._m0[128].z);
    float _494 = fma(_466, _462, (*spvDescriptorSet0.fp_c9)._m0[128].x);
    float _496 = fma(_488, _432, (*spvDescriptorSet0.fp_c9)._m0[127].z);
    float _498 = fma(_496, _424, _412);
    float _500 = -_452;
    float _502 = _500 + 1.0;
    float _504 = in.m_41.z;
    float _506 = gl_FragCoord.w;
    float _508 = _504 * _506;
    float _510 = _402 * _502;
    float _512 = in.m_41.x;
    float _514 = gl_FragCoord.w;
    float _516 = _512 * _514;
    float _518 = fma(_490, _510, _484);
    float _520 = fma(_492, _510, _498);
    float _522 = fma(_494, _510, _456);
    float _524 = fma(_452, (*spvDescriptorSet0.fp_c9)._m0[129].y, _518);
    float _526 = fma(_452, (*spvDescriptorSet0.fp_c9)._m0[129].z, _520);
    float _528 = fma(_452, (*spvDescriptorSet0.fp_c9)._m0[129].x, _522);
    float _530 = _524 * (*spvDescriptorSet0.fp_c9)._m0[106].x;
    float _532 = _526 * (*spvDescriptorSet0.fp_c9)._m0[106].x;
    float _534 = _78 * _78;
    float _536 = _80 * _80;
    float _538 = _528 * (*spvDescriptorSet0.fp_c9)._m0[106].x;
    float _540 = _82 * _82;
    float _542 = _69 * _508;
    float _544 = fma(_542, _540, _532);
    float _546 = _69 * _516;
    float _548 = _69 * _474;
    float _550 = fma(_546, _534, _538);
    float _552 = fma(_548, _536, _530);
    if (!_166)
    {
        out.m_44.x = _550;
        out.m_44.y = _552;
        out.m_44.z = _544;
        out.m_44.w = _146;
        return out;
    }
    float _554 = _552 * 0.715200006961822509765625;
    float _556 = in.m_46.w;
    float _558 = gl_FragCoord.w;
    float _560 = _556 * _558;
    float _562 = in.m_46.z;
    float _564 = gl_FragCoord.w;
    float _566 = _562 * _564;
    float _568 = in.m_46.x;
    float _570 = gl_FragCoord.w;
    float _572 = _568 * _570;
    float _574 = fma(_550, 0.2125999927520751953125, _554);
    float _576 = in.m_46.y;
    float _578 = gl_FragCoord.w;
    float _580 = _576 * _578;
    float _582 = 0.0 + _154;
    float _584 = precise::clamp(_582, 0.0, 1.0);
    float _586 = fma(_544, 0.072200000286102294921875, _574);
    bool _588 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _590 = 1.0 / _586;
    float _592 = _590 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _594 = precise::clamp(_592, 0.0, 1.0);
    float _596 = _69 * _560;
    float _598 = fma(_594, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _600 = _69 * _566;
    float _602 = _598 * _596;
    float _604 = _69 * _572;
    float _606 = _69 * _580;
    float _608 = fma(_544, _602, _600);
    float _610 = fma(_550, _602, _604);
    float _612 = fma(_552, _602, _606);
    float _614 = _600;
    if (!_588)
    {
        _614 = _584;
    }
    float _616 = _614;
    bool _618 = !_588;
    float _620 = _616;
    if (!_618)
    {
        float _622 = in.m_48.w;
        float _624 = gl_FragCoord.w;
        float _626 = _622 * _624;
        float _628 = in.m_48.z;
        float _630 = gl_FragCoord.w;
        float _632 = _628 * _630;
        float _634 = _69 * _626;
        float _636 = _69 * _632;
        float _638 = 1.0 / _634;
        float _640 = _636 * _638;
        float _642 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _644 = fma(_640, (*spvDescriptorSet0.fp_c8)._m0[30].w, _642);
        float _646 = 1.0 / _644;
        float _648 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _650 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _652 = fma(_646, _648, _650);
        float _654 = _652 * 8.0;
        float _656 = precise::clamp(_654, 0.0, 1.0);
        float _658 = _584 * _656;
        _620 = _658;
    }
    float _660 = _620;
    float _662 = 0.0 + _660;
    float _664 = precise::clamp(_662, 0.0, 1.0);
    out.m_44.x = _610;
    out.m_44.y = _612;
    out.m_44.z = _608;
    out.m_44.w = _664;
    return out;
}

