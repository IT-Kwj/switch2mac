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
    constant _16* vp_c0 [[id(0)]];
    constant _16* vp_c14 [[id(1)]];
    constant _16* vp_c15 [[id(2)]];
    constant _16* vp_c9 [[id(3)]];
    constant _16* vp_c4 [[id(4)]];
    texture2d<float> vp_t_tcb_8 [[id(5)]];
    sampler vp_t_tcb_8Smplr [[id(6)]];
    texture2d_array<float> vp_t_tcb_A [[id(7)]];
    sampler vp_t_tcb_ASmplr [[id(8)]];
    sampler vp_t_tcb_8Smplr_w [[id(9)]];
    sampler vp_t_tcb_ASmplr_w [[id(10)]];
    constant dm_border_t* dm_border [[id(11)]];
};

struct main0_out
{
    float4 m_45 [[user(locn0)]];
    float4 m_43 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_40 [[attribute(0)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_BaseInstance [[base_instance]])
{
    main0_out out = {};
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1031 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _61 = in.m_40.x;
    float _63 = in.m_40.y;
    float _65 = -(*spvDescriptorSet0.vp_c15)._m0[3].x;
    float _67 = _65 + (*spvDescriptorSet0.vp_c15)._m0[3].y;
    int _70 = 16 + as_type<int>(as_type<float>(gl_BaseInstance));
    float _72 = -(*spvDescriptorSet0.vp_c15)._m0[3].z;
    float _74 = _72 + (*spvDescriptorSet0.vp_c15)._m0[3].w;
    int _76 = _70 << 4;
    bool _80 = _76 == 0;
    bool _82 = _76 == 16;
    bool _84 = _76 == 32;
    bool _86 = _76 == 48;
    bool _88 = _76 == 64;
    float _90 = fma(_67, _61, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _92 = fma(_74, _61, (*spvDescriptorSet0.vp_c15)._m0[3].z);
    bool _94 = _76 == 80;
    float _96 = as_type<float>(gl_BaseInstance);
    if (_80)
    {
        _96 = (*spvDescriptorSet0.vp_c14)._m0[268].x;
    }
    float _98 = _96;
    float _100 = -_90;
    float _102 = _100 + _92;
    bool _104 = _76 == 96;
    float _106 = fma(_102, _63, _90);
    float _108 = fma(_61, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _110 = 0.0;
    float _112 = _98;
    if (_80)
    {
        _110 = (*spvDescriptorSet0.vp_c14)._m0[268].z;
    }
    float _114 = _110;
    float _116 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _118 = _106 + _116;
    float _120 = _114;
    if (_82)
    {
        _112 = (*spvDescriptorSet0.vp_c14)._m0[269].x;
    }
    float _122 = _112;
    float _124 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _126 = _108 + _124;
    float _128 = fma(_63, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _130 = _118 * _118;
    bool _132 = _76 == 112;
    float _134 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _136 = _128 + _134;
    float _138 = fma(_126, _126, _130);
    float _140 = _122;
    if (_82)
    {
        _120 = (*spvDescriptorSet0.vp_c14)._m0[269].z;
    }
    float _142 = _120;
    float _144 = _142;
    if (_84)
    {
        _140 = (*spvDescriptorSet0.vp_c14)._m0[270].x;
    }
    float _146 = _140;
    float _148 = fma(_136, _136, _138);
    bool _150 = _76 == 128;
    float _152 = _146;
    if (_84)
    {
        _144 = (*spvDescriptorSet0.vp_c14)._m0[270].z;
    }
    float _154 = _144;
    float _156 = rsqrt(_148);
    float _158 = _154;
    if (_86)
    {
        _152 = (*spvDescriptorSet0.vp_c14)._m0[271].x;
    }
    float _160 = _152;
    bool _162 = _76 == 144;
    float _164 = _160;
    if (_86)
    {
        _158 = (*spvDescriptorSet0.vp_c14)._m0[271].z;
    }
    float _166 = _158;
    float _168 = _166;
    if (_88)
    {
        _164 = (*spvDescriptorSet0.vp_c14)._m0[272].x;
    }
    float _170 = _164;
    bool _172 = _76 == 160;
    float _174 = _170;
    if (_88)
    {
        _168 = (*spvDescriptorSet0.vp_c14)._m0[272].z;
    }
    float _176 = _168;
    float _178 = _176;
    if (_94)
    {
        _174 = (*spvDescriptorSet0.vp_c14)._m0[273].x;
    }
    float _180 = _174;
    bool _182 = _76 == 176;
    float _184 = _156 * (*spvDescriptorSet0.vp_c14)._m0[268].x;
    float _186 = _180;
    if (_94)
    {
        _178 = (*spvDescriptorSet0.vp_c14)._m0[273].z;
    }
    float _188 = _178;
    bool _190 = _76 == 192;
    float _192 = _188;
    if (_104)
    {
        _186 = (*spvDescriptorSet0.vp_c14)._m0[274].x;
    }
    float _194 = _186;
    float _196 = log2(_184);
    float _198 = _194;
    if (_104)
    {
        _192 = (*spvDescriptorSet0.vp_c14)._m0[274].z;
    }
    float _200 = _192;
    float _202 = _200;
    if (_132)
    {
        _198 = (*spvDescriptorSet0.vp_c14)._m0[275].x;
    }
    float _204 = _198;
    bool _206 = _76 == 208;
    float _208 = _204;
    if (_132)
    {
        _202 = (*spvDescriptorSet0.vp_c14)._m0[275].z;
    }
    float _210 = _202;
    float _212 = _210;
    if (_150)
    {
        _208 = (*spvDescriptorSet0.vp_c14)._m0[276].x;
    }
    float _214 = _208;
    bool _216 = _76 == 224;
    float _218 = _214;
    if (_150)
    {
        _212 = (*spvDescriptorSet0.vp_c14)._m0[276].z;
    }
    float _220 = _212;
    float _222 = _220;
    if (_162)
    {
        _218 = (*spvDescriptorSet0.vp_c14)._m0[277].x;
    }
    float _224 = _218;
    float _226 = _196 + 1.2999999523162841796875;
    bool _228 = _76 == 240;
    float _230 = _224;
    if (_162)
    {
        _222 = (*spvDescriptorSet0.vp_c14)._m0[277].z;
    }
    float _232 = _222;
    float _234 = _232;
    if (_172)
    {
        _230 = (*spvDescriptorSet0.vp_c14)._m0[278].x;
    }
    float _236 = _230;
    float _238 = trunc(_226);
    int _240 = int(_238);
    bool _242 = _76 == 256;
    float _244 = _236;
    if (_172)
    {
        _234 = (*spvDescriptorSet0.vp_c14)._m0[278].z;
    }
    float _246 = _234;
    float _248 = _246;
    if (_182)
    {
        _244 = (*spvDescriptorSet0.vp_c14)._m0[279].x;
    }
    float _250 = _244;
    bool _252 = _76 == 272;
    float _254 = _250;
    if (_182)
    {
        _248 = (*spvDescriptorSet0.vp_c14)._m0[279].z;
    }
    float _256 = _248;
    float _258 = _256;
    if (_190)
    {
        _254 = (*spvDescriptorSet0.vp_c14)._m0[280].x;
    }
    float _260 = _254;
    bool _262 = _76 == 288;
    float _264 = _260;
    if (_190)
    {
        _258 = (*spvDescriptorSet0.vp_c14)._m0[280].z;
    }
    float _266 = _258;
    int _268 = min(_240, 15);
    bool _270 = _76 == 304;
    float _272 = _266;
    if (_206)
    {
        _264 = (*spvDescriptorSet0.vp_c14)._m0[281].x;
    }
    float _274 = _264;
    float _276 = float(_268);
    float _278 = _274;
    if (_206)
    {
        _272 = (*spvDescriptorSet0.vp_c14)._m0[281].z;
    }
    float _280 = _272;
    int _282 = _268 << 4;
    int _284 = _282 + 4288;
    float _286 = _280;
    if (_216)
    {
        _278 = (*spvDescriptorSet0.vp_c14)._m0[282].x;
    }
    float _288 = _278;
    bool _290 = _76 == 320;
    float _292 = -_276;
    float _294 = _292 + (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _296 = _288;
    if (_216)
    {
        _286 = (*spvDescriptorSet0.vp_c14)._m0[282].z;
    }
    float _298 = _286;
    float _300 = _298;
    if (_228)
    {
        _296 = (*spvDescriptorSet0.vp_c14)._m0[283].x;
    }
    float _302 = _296;
    float _304 = _294 + 1.0;
    bool _306 = _76 == 336;
    float _308 = _302;
    if (_228)
    {
        _300 = (*spvDescriptorSet0.vp_c14)._m0[283].z;
    }
    float _310 = _300;
    float _312 = _310;
    if (_242)
    {
        _308 = (*spvDescriptorSet0.vp_c14)._m0[284].x;
    }
    float _314 = _308;
    float _316 = exp2(_304);
    bool _318 = _76 == 352;
    float _320 = _314;
    if (_242)
    {
        _312 = (*spvDescriptorSet0.vp_c14)._m0[284].z;
    }
    float _322 = _312;
    float _324 = _322;
    if (_252)
    {
        _320 = (*spvDescriptorSet0.vp_c14)._m0[285].x;
    }
    float _326 = _320;
    bool _328 = _76 == 368;
    float _330 = _326;
    if (_252)
    {
        _324 = (*spvDescriptorSet0.vp_c14)._m0[285].z;
    }
    float _332 = _324;
    float _334 = _332;
    if (_262)
    {
        _330 = (*spvDescriptorSet0.vp_c14)._m0[286].x;
    }
    float _336 = _330;
    bool _338 = _76 == 384;
    float _340 = _336;
    if (_262)
    {
        _334 = (*spvDescriptorSet0.vp_c14)._m0[286].z;
    }
    float _342 = _334;
    float _344 = 1.0 / _316;
    float _346 = _342;
    if (_270)
    {
        _340 = (*spvDescriptorSet0.vp_c14)._m0[287].x;
    }
    float _348 = _340;
    bool _350 = _76 == 400;
    float _352 = _348;
    if (_270)
    {
        _346 = (*spvDescriptorSet0.vp_c14)._m0[287].z;
    }
    float _354 = _346;
    bool _356 = _76 == 416;
    float _358 = _354;
    if (_290)
    {
        _352 = (*spvDescriptorSet0.vp_c14)._m0[288].x;
    }
    float _360 = _352;
    float _362 = _360;
    if (_290)
    {
        _358 = (*spvDescriptorSet0.vp_c14)._m0[288].z;
    }
    float _364 = _358;
    float _366 = _364;
    if (_306)
    {
        _362 = (*spvDescriptorSet0.vp_c14)._m0[289].x;
    }
    float _368 = _362;
    bool _370 = _76 == 432;
    float _372 = _368;
    if (_306)
    {
        _366 = (*spvDescriptorSet0.vp_c14)._m0[289].z;
    }
    float _374 = _366;
    float _376 = _374;
    if (_318)
    {
        _372 = (*spvDescriptorSet0.vp_c14)._m0[290].x;
    }
    float _378 = _372;
    bool _380 = _76 == 448;
    float _382 = _378;
    if (_318)
    {
        _376 = (*spvDescriptorSet0.vp_c14)._m0[290].z;
    }
    float _384 = _376;
    float _386 = _384;
    if (_328)
    {
        _382 = (*spvDescriptorSet0.vp_c14)._m0[291].x;
    }
    float _388 = _382;
    bool _390 = _76 == 464;
    float _392 = _388;
    if (_328)
    {
        _386 = (*spvDescriptorSet0.vp_c14)._m0[291].z;
    }
    float _394 = _386;
    float _396 = _394;
    if (_338)
    {
        _392 = (*spvDescriptorSet0.vp_c14)._m0[292].x;
    }
    float _398 = _392;
    bool _400 = _76 == 480;
    float _402 = _398;
    if (_338)
    {
        _396 = (*spvDescriptorSet0.vp_c14)._m0[292].z;
    }
    float _404 = _396;
    float _406 = _404;
    if (_350)
    {
        _402 = (*spvDescriptorSet0.vp_c14)._m0[293].x;
    }
    float _408 = _402;
    bool _410 = _76 == 496;
    float _412 = _408;
    if (_350)
    {
        _406 = (*spvDescriptorSet0.vp_c14)._m0[293].z;
    }
    float _414 = _406;
    float _416 = _414;
    if (_356)
    {
        _412 = (*spvDescriptorSet0.vp_c14)._m0[294].x;
    }
    float _418 = _412;
    bool _420 = _76 == 512;
    float _422 = _418;
    if (_356)
    {
        _416 = (*spvDescriptorSet0.vp_c14)._m0[294].z;
    }
    float _424 = _416;
    bool _426 = _76 == 528;
    float _428 = _424;
    if (_370)
    {
        _422 = (*spvDescriptorSet0.vp_c14)._m0[295].x;
    }
    float _430 = _422;
    float _432 = _430;
    if (_370)
    {
        _428 = (*spvDescriptorSet0.vp_c14)._m0[295].z;
    }
    float _434 = _428;
    float _436 = _434;
    if (_380)
    {
        _432 = (*spvDescriptorSet0.vp_c14)._m0[296].x;
    }
    float _438 = _432;
    bool _440 = _76 == 544;
    float _442 = _438;
    if (_380)
    {
        _436 = (*spvDescriptorSet0.vp_c14)._m0[296].z;
    }
    float _444 = _436;
    float _446 = _444;
    if (_390)
    {
        _442 = (*spvDescriptorSet0.vp_c14)._m0[297].x;
    }
    float _448 = _442;
    bool _450 = _76 == 560;
    float _452 = _448;
    if (_390)
    {
        _446 = (*spvDescriptorSet0.vp_c14)._m0[297].z;
    }
    float _454 = _446;
    float _456 = _454;
    if (_400)
    {
        _452 = (*spvDescriptorSet0.vp_c14)._m0[298].x;
    }
    float _458 = _452;
    bool _460 = _76 == 576;
    float _462 = _458;
    if (_400)
    {
        _456 = (*spvDescriptorSet0.vp_c14)._m0[298].z;
    }
    float _464 = _456;
    float _466 = _464;
    if (_410)
    {
        _462 = (*spvDescriptorSet0.vp_c14)._m0[299].x;
    }
    float _468 = _462;
    bool _470 = _76 == 592;
    float _472 = _468;
    if (_410)
    {
        _466 = (*spvDescriptorSet0.vp_c14)._m0[299].z;
    }
    float _474 = _466;
    float _476 = _474;
    if (_420)
    {
        _472 = (*spvDescriptorSet0.vp_c14)._m0[300].x;
    }
    float _478 = _472;
    bool _480 = _76 == 608;
    float _482 = _478;
    if (_420)
    {
        _476 = (*spvDescriptorSet0.vp_c14)._m0[300].z;
    }
    float _484 = _476;
    float _486 = _484;
    if (_426)
    {
        _482 = (*spvDescriptorSet0.vp_c14)._m0[301].x;
    }
    float _488 = _482;
    bool _490 = _76 == 624;
    float _492 = _488;
    if (_426)
    {
        _486 = (*spvDescriptorSet0.vp_c14)._m0[301].z;
    }
    float _494 = _486;
    bool _496 = _76 == 640;
    float _498 = _494;
    if (_440)
    {
        _492 = (*spvDescriptorSet0.vp_c14)._m0[302].x;
    }
    float _500 = _492;
    float _502 = _500;
    if (_440)
    {
        _498 = (*spvDescriptorSet0.vp_c14)._m0[302].z;
    }
    float _504 = _498;
    float _506 = _504;
    if (_450)
    {
        _502 = (*spvDescriptorSet0.vp_c14)._m0[303].x;
    }
    float _508 = _502;
    bool _510 = _76 == 656;
    float _512 = _508;
    if (_450)
    {
        _506 = (*spvDescriptorSet0.vp_c14)._m0[303].z;
    }
    float _514 = _506;
    float _516 = _514;
    if (_460)
    {
        _512 = (*spvDescriptorSet0.vp_c14)._m0[304].x;
    }
    float _518 = _512;
    bool _520 = _76 == 672;
    float _522 = _518;
    if (_460)
    {
        _516 = (*spvDescriptorSet0.vp_c14)._m0[304].z;
    }
    float _524 = _516;
    float _526 = _524;
    if (_470)
    {
        _522 = (*spvDescriptorSet0.vp_c14)._m0[305].x;
    }
    float _528 = _522;
    bool _530 = _76 == 688;
    float _532 = _528;
    if (_470)
    {
        _526 = (*spvDescriptorSet0.vp_c14)._m0[305].z;
    }
    float _534 = _526;
    float _536 = _534;
    if (_480)
    {
        _532 = (*spvDescriptorSet0.vp_c14)._m0[306].x;
    }
    float _538 = _532;
    bool _540 = _76 == 704;
    float _542 = _538;
    if (_480)
    {
        _536 = (*spvDescriptorSet0.vp_c14)._m0[306].z;
    }
    float _544 = _536;
    float _546 = _544;
    if (_490)
    {
        _542 = (*spvDescriptorSet0.vp_c14)._m0[307].x;
    }
    float _548 = _542;
    bool _550 = _76 == 720;
    float _552 = _548;
    if (_490)
    {
        _546 = (*spvDescriptorSet0.vp_c14)._m0[307].z;
    }
    float _554 = _546;
    float _556 = _554;
    if (_496)
    {
        _552 = (*spvDescriptorSet0.vp_c14)._m0[308].x;
    }
    float _558 = _552;
    bool _560 = _76 == 736;
    float _562 = _558;
    if (_496)
    {
        _556 = (*spvDescriptorSet0.vp_c14)._m0[308].z;
    }
    float _564 = _556;
    bool _566 = _76 == 752;
    float _568 = _564;
    if (_510)
    {
        _562 = (*spvDescriptorSet0.vp_c14)._m0[309].x;
    }
    float _570 = _562;
    float _572 = _570;
    if (_520)
    {
        _572 = (*spvDescriptorSet0.vp_c14)._m0[310].x;
    }
    float _574 = _572;
    float _576 = _574;
    if (_530)
    {
        _576 = (*spvDescriptorSet0.vp_c14)._m0[311].x;
    }
    float _578 = _576;
    float _580 = _578;
    if (_540)
    {
        _580 = (*spvDescriptorSet0.vp_c14)._m0[312].x;
    }
    float _582 = _580;
    float _584 = _582;
    if (_550)
    {
        _584 = (*spvDescriptorSet0.vp_c14)._m0[313].x;
    }
    float _586 = _584;
    float _588 = _586;
    if (_560)
    {
        _588 = (*spvDescriptorSet0.vp_c14)._m0[314].x;
    }
    float _590 = _588;
    float _592 = _590;
    if (_566)
    {
        _592 = (*spvDescriptorSet0.vp_c14)._m0[315].x;
    }
    float _594 = _592;
    float _596 = _344 * _594;
    if (_510)
    {
        _568 = (*spvDescriptorSet0.vp_c14)._m0[309].z;
    }
    float _598 = _568;
    float _600 = _598;
    if (_520)
    {
        _600 = (*spvDescriptorSet0.vp_c14)._m0[310].z;
    }
    float _602 = _600;
    float _604 = _596 * _61;
    float _606 = _596 * _63;
    float _608 = _602;
    if (_530)
    {
        _608 = (*spvDescriptorSet0.vp_c14)._m0[311].z;
    }
    float _610 = _608;
    float _612 = floor(_604);
    float _614 = _610;
    if (_540)
    {
        _614 = (*spvDescriptorSet0.vp_c14)._m0[312].z;
    }
    float _616 = _614;
    float _618 = _616;
    if (_550)
    {
        _618 = (*spvDescriptorSet0.vp_c14)._m0[313].z;
    }
    float _620 = _618;
    float _622 = _620;
    if (_560)
    {
        _622 = (*spvDescriptorSet0.vp_c14)._m0[314].z;
    }
    float _624 = _622;
    float _626 = _624;
    if (_566)
    {
        _626 = (*spvDescriptorSet0.vp_c14)._m0[315].z;
    }
    float _628 = _626;
    float _630 = floor(_606);
    float _632 = _316 * _628;
    float _634 = -_612;
    float _636 = _604 + _634;
    float _638 = _636 * 2.0;
    float _640 = -_636;
    float _642 = fma(_632, _640, _61);
    int _644 = _284 + 8;
    uint _647 = uint(int(uint(_644) >> uint(2)));
    uint _649 = uint(int(uint(int(_647)) >> uint(2)));
    int _651 = int(_647) & 3;
    float _653 = (*spvDescriptorSet0.vp_c14)._m0[int(_649)][_651];
    int _655 = int(_647) + 1;
    uint _657 = uint(int(uint(_655) >> uint(2)));
    int _659 = _655 & 3;
    float _661 = (*spvDescriptorSet0.vp_c14)._m0[int(_657)][_659];
    float _663 = -_630;
    float _665 = _606 + _663;
    float _667 = floor(_638);
    float _669 = _665 * 2.0;
    float _671 = -_665;
    float _673 = fma(_632, _671, _63);
    float _675 = floor(_669);
    float _677 = _632 * _667;
    float _679 = _677 * 0.5;
    float _681 = _679 + _642;
    float _683 = fma(_67, _681, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _685 = _632 * _675;
    float _687 = _685 * 0.5;
    float _689 = fma(_74, _681, (*spvDescriptorSet0.vp_c15)._m0[3].z);
    float _691 = fma(_681, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _693 = _687 + _673;
    float _695 = -_683;
    float _697 = _695 + _689;
    float _699 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _701 = _691 + _699;
    float _703 = fma(_693, _697, _683);
    float _705 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _707 = _703 + _705;
    float _709 = fma(_693, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _711 = _707 * _707;
    float _713 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _715 = _709 + _713;
    float _717 = fma(_701, _701, _711);
    float _719 = fma(_715, _715, _717);
    float _721 = sqrt(_719);
    float _723 = -_661;
    float _725 = fma(_721, _653, _723);
    float _727 = precise::clamp(_725, 0.0, 1.0);
    float _729 = -_687;
    float _731 = fma(_729, _727, _693);
    float _733 = -_679;
    float _735 = fma(_733, _727, _681);
    float _737 = fma(_731, (*spvDescriptorSet0.vp_c15)._m0[6].x, (*spvDescriptorSet0.vp_c15)._m0[6].w);
    float _739 = fma(_735, (*spvDescriptorSet0.vp_c15)._m0[6].x, (*spvDescriptorSet0.vp_c15)._m0[6].z);
    float _741 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _737);
    float _743 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _739);
    float2 _2552 = float2(_743, _741);
    float _745 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2552, float2(0.0), isnan(_2552)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2552, float2(0.0), isnan(_2552)), level(0.0)).x;
    float _747 = fma(_731, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _749 = fma(_735, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _751 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _753 = _747 + _751;
    float _755 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _757 = _749 + _755;
    float _759 = fma(_735, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].z);
    float _761 = _753 * _753;
    float _763 = fma(_731, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].w);
    float _765 = fma(_757, _757, _761);
    float _767 = sqrt(_765);
    bool _769 = _767 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _771 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _773 = _767 + _771;
    float _775 = (*spvDescriptorSet0.vp_c15)._m0[4].x;
    float _777 = _767;
    float _779 = (*spvDescriptorSet0.vp_c15)._m0[6].x;
    float _781 = _765;
    if (_769)
    {
        float _783 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        _775 = _783;
    }
    float _785 = _775;
    float _787 = _785;
    float _789 = (*spvDescriptorSet0.vp_c14)._m0[0].y;
    if (_769)
    {
        float _791 = _773 * _785;
        _777 = _791;
    }
    float _793 = _777;
    if (_769)
    {
        float _795 = rsqrt(_765);
        _787 = _795;
    }
    float _797 = _787;
    float _799 = _797;
    if (_769)
    {
        float _801 = _793 * 0.15915493667125701904296875;
        _779 = _801;
    }
    float _803 = _779;
    float _805 = _793;
    if (_769)
    {
        float _807 = _803 * 6.283185482025146484375;
        float _809 = sin(_807);
        _805 = _809;
    }
    float _811 = _805;
    float _813 = _773;
    if (_769)
    {
        float _815 = _803 * 6.283185482025146484375;
        float _817 = cos(_815);
        _813 = _817;
    }
    float _819 = _813;
    float _821 = fma(_745, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    if (_769)
    {
        float _823 = _821 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        _789 = _823;
    }
    float _825 = _789;
    float _827 = _821 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _829 = _825;
    float _831 = _811;
    if (_769)
    {
        float _833 = fma(_811, _825, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        _829 = _833;
    }
    float _835 = _829;
    float _837 = _835;
    float _839 = _819;
    if (_769)
    {
        float _841 = _819 + (-1.0);
        _831 = _841;
    }
    float _843 = _831;
    float _845 = fma(_749, (*spvDescriptorSet0.vp_c4)._m0[2].x, _827);
    float _847 = 0.0;
    float _849 = _843;
    if (_769)
    {
        float _851 = _797 * _835;
        _847 = _851;
    }
    float _853 = _847;
    if (_769)
    {
        float _855 = _843 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        _781 = _855;
    }
    float _857 = _781;
    if (!_769)
    {
        _837 = _821;
    }
    float _859 = _837;
    float _861 = fma(_747, (*spvDescriptorSet0.vp_c4)._m0[2].z, _845);
    float _863 = _859;
    if (!_769)
    {
        _799 = _749;
    }
    float _865 = _799;
    float _867 = _865;
    if (_769)
    {
        float _869 = fma(_821, _819, _857);
        _863 = _869;
    }
    float _871 = _863;
    if (_769)
    {
        float _873 = fma(_757, _853, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        _867 = _873;
    }
    float _875 = _867;
    if (!_769)
    {
        _849 = _747;
    }
    float _877 = _849;
    float _879 = _877;
    if (_769)
    {
        float _881 = fma(_753, _853, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        _879 = _881;
    }
    float _883 = _879;
    float _885 = _871 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    if (_769)
    {
        float _887 = _871 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        _839 = _887;
    }
    float _889 = _839;
    float _891 = _871 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _893 = _861 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _895 = fma(_875, (*spvDescriptorSet0.vp_c4)._m0[1].x, _885);
    float _897 = _889;
    float _899 = _891;
    if (_769)
    {
        float _901 = fma(_875, (*spvDescriptorSet0.vp_c4)._m0[2].x, _889);
        _897 = _901;
    }
    float _903 = _897;
    float _905 = fma(_875, (*spvDescriptorSet0.vp_c4)._m0[0].x, _891);
    float _907 = fma(_883, (*spvDescriptorSet0.vp_c4)._m0[1].z, _895);
    float _909 = _903;
    if (_769)
    {
        float _911 = fma(_883, (*spvDescriptorSet0.vp_c4)._m0[2].z, _903);
        _909 = _911;
    }
    float _913 = _909;
    float _915 = fma(_883, (*spvDescriptorSet0.vp_c4)._m0[0].z, _905);
    int _917 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[40].w) & 2;
    bool _919 = _917 != 0;
    float _921 = _907 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    if (!_769)
    {
        _899 = _893;
    }
    float _923 = _899;
    float _925 = _915 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _927 = _923;
    if (_769)
    {
        float _929 = _913 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _927 = _929;
    }
    float _931 = _927;
    float _933 = _921 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _935 = _921 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _937 = _921 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _939 = _921 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _941 = fma(_925, (*spvDescriptorSet0.vp_c4)._m0[7].x, _933);
    float _943 = fma(_925, (*spvDescriptorSet0.vp_c4)._m0[8].x, _935);
    float _945 = fma(_925, (*spvDescriptorSet0.vp_c4)._m0[9].x, _937);
    float _947 = fma(_925, (*spvDescriptorSet0.vp_c4)._m0[10].x, _939);
    float _949 = fma(_931, (*spvDescriptorSet0.vp_c4)._m0[7].z, _941);
    float _951 = fma(_931, (*spvDescriptorSet0.vp_c4)._m0[8].z, _943);
    float _953 = fma(_931, (*spvDescriptorSet0.vp_c4)._m0[9].z, _945);
    float _955 = fma(_931, (*spvDescriptorSet0.vp_c4)._m0[10].z, _947);
    float _957 = _949 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _959 = _951 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _961 = _953 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _963 = _955 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    bool _965 = !_919;
    float _967;
    float _969;
    float _971;
    int _973;
    int _975;
    int _977;
    int _979;
    int _981;
    int _983;
    int _985;
    int _987;
    float _989;
    float _991;
    float _993;
    float _995;
    float _997;
    float _999;
    float _1001;
    float _1003;
    float _1005;
    float _1007;
    float _1009;
    float _1011;
    float _1013;
    float _1015;
    float _1017;
    float _1019;
    float _1021;
    float _1023;
    int _1025;
    float _1027;
    float _1029;
    if (!_965)
    {
        _967 = (*spvDescriptorSet0.vp_c9)._m0[919].z;
        _969 = (*spvDescriptorSet0.vp_c9)._m0[919].x;
        _971 = (*spvDescriptorSet0.vp_c9)._m0[919].y;
        _973 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[919].w);
        _975 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].x);
        _977 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].y);
        _979 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].z);
        _981 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].w);
        _983 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].x);
        _985 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].y);
        _987 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].w);
        _989 = (*spvDescriptorSet0.vp_c9)._m0[922].y;
        _991 = (*spvDescriptorSet0.vp_c9)._m0[923].y;
        _993 = (*spvDescriptorSet0.vp_c9)._m0[916].w;
        _995 = (*spvDescriptorSet0.vp_c9)._m0[917].x;
        _997 = (*spvDescriptorSet0.vp_c9)._m0[922].x;
        _999 = (*spvDescriptorSet0.vp_c9)._m0[923].x;
        _1001 = (*spvDescriptorSet0.vp_c9)._m0[916].x;
        _1003 = (*spvDescriptorSet0.vp_c9)._m0[917].y;
        _1005 = (*spvDescriptorSet0.vp_c9)._m0[922].z;
        _1007 = (*spvDescriptorSet0.vp_c9)._m0[923].z;
        _1009 = (*spvDescriptorSet0.vp_c9)._m0[917].z;
        _1011 = (*spvDescriptorSet0.vp_c9)._m0[916].y;
        _1013 = (*spvDescriptorSet0.vp_c9)._m0[922].w;
        _1015 = (*spvDescriptorSet0.vp_c9)._m0[923].w;
        _1017 = (*spvDescriptorSet0.vp_c9)._m0[916].z;
        _1019 = (*spvDescriptorSet0.vp_c9)._m0[918].y;
        _1021 = (*spvDescriptorSet0.vp_c9)._m0[917].w;
        _1023 = (*spvDescriptorSet0.vp_c9)._m0[918].x;
        _1025 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].z);
        _1027 = (*spvDescriptorSet0.vp_c9)._m0[918].z;
        _1029 = (*spvDescriptorSet0.vp_c9)._m0[918].w;
        _1031 = true;
    }
    else
    {
        float _1033 = fma(_749, 6.2500002968590706586837768554688e-05, 0.5);
        float _1035 = fma(_747, 6.2500002968590706586837768554688e-05, 0.5);
        float3 _3065 = float3(_1033, _1035, float(0));
        float3 _3069 = select(_3065, float3(0.0), isnan(_3065));
        float4 _1038 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _3069.xy, uint(rint(_3069.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _3069.xy, uint(rint(_3069.z)), level(0.0)).xyzw;
        float _1040 = _1038.x;
        float _1042 = _1038.y;
        float _1044 = _1038.z;
        float _1046 = _1038.w;
        float3 _3084 = float3(_1033, _1035, float(1));
        float3 _3086 = select(_3084, float3(0.0), isnan(_3084));
        float4 _1048 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _3086.xy, uint(rint(_3086.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _3086.xy, uint(rint(_3086.z)), level(0.0)).xyzw;
        float _1050 = _1048.x;
        float _1052 = _1048.y;
        float _1054 = _1048.z;
        float _1056 = _1048.w;
        float3 _3101 = float3(_1033, _1035, float(2));
        float3 _3103 = select(_3101, float3(0.0), isnan(_3101));
        float4 _1058 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _3103.xy, uint(rint(_3103.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _3103.xy, uint(rint(_3103.z)), level(0.0)).xyzw;
        float _1060 = _1058.x;
        float _1062 = _1058.y;
        float _1064 = _1058.z;
        float _1066 = _1058.w;
        float3 _3118 = float3(_1033, _1035, float(3));
        float3 _3120 = select(_3118, float3(0.0), isnan(_3118));
        float4 _1068 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _3120.xy, uint(rint(_3120.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _3120.xy, uint(rint(_3120.z)), level(0.0)).xyzw;
        float _1070 = _1068.x;
        float _1072 = _1068.y;
        float _1074 = _1068.z;
        float _1076 = _1068.w;
        float3 _3135 = float3(_1033, _1035, float(4));
        float3 _3137 = select(_3135, float3(0.0), isnan(_3135));
        float4 _1078 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _3137.xy, uint(rint(_3137.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _3137.xy, uint(rint(_3137.z)), level(0.0)).xyzw;
        float _1080 = _1078.x;
        float _1082 = _1078.y;
        float _1084 = _1078.z;
        float _1086 = _1078.w;
        float3 _3153 = float3(_1033, _1035, float(5));
        float3 _3155 = select(_3153, float3(0.0), isnan(_3153));
        float4 _1088 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _3155.xy, uint(rint(_3155.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _3155.xy, uint(rint(_3155.z)), level(0.0)).xyzw;
        float _1090 = _1088.x;
        float _1092 = _1088.y;
        float _1094 = _1088.z;
        float _1096 = _1088.w;
        float3 _3170 = float3(_1033, _1035, float(6));
        float3 _3172 = select(_3170, float3(0.0), isnan(_3170));
        float4 _1098 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _3172.xy, uint(rint(_3172.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _3172.xy, uint(rint(_3172.z)), level(0.0)).xyzw;
        float _1100 = _1098.x;
        float _1102 = _1098.y;
        float _1104 = _1098.z;
        float _1106 = _1098.w;
        float3 _3187 = float3(_1033, _1035, float(7));
        float3 _3189 = select(_3187, float3(0.0), isnan(_3187));
        float4 _1108 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _3189.xy, uint(rint(_3189.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _3189.xy, uint(rint(_3189.z)), level(0.0)).xyzw;
        float _1110 = _1108.x;
        float _1112 = _1108.y;
        float _1114 = _1108.z;
        float _1116 = _1108.w;
        _967 = _1074;
        _969 = _1070;
        _971 = _1072;
        _973 = as_type<int>(_1076);
        _975 = as_type<int>(_1080);
        _977 = as_type<int>(_1082);
        _979 = as_type<int>(_1084);
        _981 = as_type<int>(_1086);
        _983 = as_type<int>(_1090);
        _985 = as_type<int>(_1092);
        _987 = as_type<int>(_1096);
        _989 = _1102;
        _991 = _1112;
        _993 = _1046;
        _995 = _1050;
        _997 = _1100;
        _999 = _1110;
        _1001 = _1040;
        _1003 = _1052;
        _1005 = _1104;
        _1007 = _1114;
        _1009 = _1054;
        _1011 = _1042;
        _1013 = _1106;
        _1015 = _1116;
        _1017 = _1044;
        _1019 = _1062;
        _1021 = _1056;
        _1023 = _1060;
        _1025 = as_type<int>(_1094);
        _1027 = _1064;
        _1029 = _1066;
    }
    _1031 = false;
    float _1118 = _967;
    float _1120 = _969;
    float _1122 = _971;
    int _1124 = _973;
    int _1126 = _975;
    int _1128 = _977;
    int _1130 = _979;
    int _1132 = _981;
    int _1134 = _983;
    int _1136 = _985;
    int _1138 = _987;
    float _1140 = _989;
    float _1142 = _991;
    float _1144 = _993;
    float _1146 = _995;
    float _1148 = _997;
    float _1150 = _999;
    float _1152 = _1001;
    float _1154 = _1003;
    float _1156 = _1005;
    float _1158 = _1007;
    float _1160 = _1009;
    float _1162 = _1011;
    float _1164 = _1013;
    float _1166 = _1015;
    float _1168 = _1017;
    float _1170 = _1019;
    float _1172 = _1021;
    float _1174 = _1023;
    int _1176 = _1025;
    float _1178 = _1027;
    float _1180 = _1029;
    float _1182 = -(*spvDescriptorSet0.vp_c4)._m0[12].w;
    float _1184 = _821 + _1182;
    float _1186 = -(*spvDescriptorSet0.vp_c4)._m0[11].w;
    float _1188 = _749 + _1186;
    float _1190 = -(*spvDescriptorSet0.vp_c4)._m0[13].w;
    float _1192 = _747 + _1190;
    float _1194 = _1118 * 0.88622701168060302734375;
    float _1196 = _1184 * _1184;
    float _1198 = _1120 * 0.88622701168060302734375;
    float _1200 = _1122 * 0.88622701168060302734375;
    float _1202 = _919 ? as_type<float>(_1124) : 0.0;
    float _1204 = fma(_1188, _1188, _1196);
    float _1206 = _919 ? as_type<float>(_1126) : 0.0;
    out.gl_Position.x = _957;
    out.gl_Position.y = _959;
    out.gl_Position.z = _961;
    out.gl_Position.w = _963;
    float _1208 = _919 ? as_type<float>(_1128) : 0.0;
    float _1210 = fma(_1192, _1192, _1204);
    float _1212 = _919 ? _1198 : 0.0;
    out.m_43.x = _749;
    out.m_43.y = _821;
    out.m_43.z = _747;
    float _1214 = _919 ? _1200 : 0.0;
    float _1216 = _919 ? _1194 : 0.0;
    float _1218 = rsqrt(_1210);
    float _1220 = _919 ? as_type<float>(_1130) : 0.0;
    out.m_45.z = _759;
    out.m_45.w = _763;
    float _1222 = _919 ? as_type<float>(_1132) : 0.0;
    float _1224 = _919 ? as_type<float>(_1134) : 0.0;
    float _1226 = _919 ? as_type<float>(_1136) : 0.0;
    float _1228 = _919 ? as_type<float>(_1138) : 0.0;
    float _1230 = _1218 * 1.02332699298858642578125;
    float _1232 = _1192 * _1218;
    float _1234 = _1184 * _1230;
    float _1236 = _1232 * (-1.02332699298858642578125);
    float _1238 = _1188 * _1230;
    float _1240 = _1234 * _1140;
    float _1242 = _1234 * _1142;
    float _1244 = _1234 * _1144;
    float _1246 = _1234 * _1146;
    float _1248 = fma(_1148, 0.88622701168060302734375, _1240);
    float _1250 = fma(_1150, 0.88622701168060302734375, _1242);
    float _1252 = fma(_1152, 0.88622701168060302734375, _1244);
    float _1254 = _1234 * _1154;
    float _1256 = fma(_1236, _1156, _1248);
    float _1258 = fma(_1236, _1158, _1250);
    float _1260 = fma(_1236, _1160, _1252);
    float _1262 = fma(_1162, 0.88622701168060302734375, _1246);
    float _1264 = fma(_1238, _1164, _1256);
    float _1266 = fma(_1238, _1166, _1258);
    float _1268 = fma(_1168, 0.88622701168060302734375, _1254);
    float _1270 = fma(_1202, _1234, _1212);
    float _1272 = fma(_1206, _1234, _1214);
    float _1274 = precise::max(0.0, _1264);
    float _1276 = fma(_1208, _1234, _1216);
    float _1278 = precise::max(0.0, _1266);
    float _1280 = fma(_1238, _1170, _1260);
    float _1282 = fma(_1236, _1172, _1262);
    float _1284 = _1274 * 0.31830990314483642578125;
    float _1286 = precise::clamp(_1284, 0.0, 1.0);
    float _1288 = fma(_1236, _1174, _1268);
    float _1290 = fma(_1220, _1236, _1270);
    float _1292 = fma(_1222, _1236, _1272);
    float _1294 = _1286 * 0.88622701168060302734375;
    float _1296 = fma(_1224, _1236, _1276);
    float _1298 = _1278 * 0.31830990314483642578125;
    float _1300 = precise::clamp(_1298, 0.0, 1.0);
    float _1302 = _919 ? as_type<float>(_1176) : 0.0;
    float _1304 = fma(_1238, _1178, _1282);
    float _1306 = precise::max(0.0, _1280);
    float _1308 = _1294 * (*spvDescriptorSet0.vp_c9)._m0[991].x;
    float _1310 = fma(_1238, _1180, _1288);
    float _1312 = -_1300;
    float _1314 = _1312 + 1.0;
    float _1316 = fma(_1302, _1238, _1292);
    float _1318 = fma(_1226, _1238, _1290);
    float _1320 = fma(_1228, _1238, _1296);
    float _1322 = fma(_1306, (*spvDescriptorSet0.vp_c9)._m0[68].x, _1308);
    float _1324 = precise::max(0.0, _1304);
    float _1326 = fma(_1314, (*spvDescriptorSet0.vp_c9)._m0[37].y, _1300);
    float _1328 = _1294 * (*spvDescriptorSet0.vp_c9)._m0[991].y;
    float _1330 = precise::max(0.0, _1310);
    float _1332 = _1294 * (*spvDescriptorSet0.vp_c9)._m0[991].z;
    float _1334 = precise::max(0.0, _1316);
    float _1336 = _1326 * (*spvDescriptorSet0.vp_c9)._m0[40].z;
    float _1338 = precise::max(0.0, _1318);
    float _1340 = fma(_1324, (*spvDescriptorSet0.vp_c9)._m0[68].y, _1328);
    float _1342 = precise::max(0.0, _1320);
    float _1344 = fma(_1330, (*spvDescriptorSet0.vp_c9)._m0[68].z, _1332);
    float _1346 = fma(_1334, _1336, _1340);
    float _1348 = fma(_1338, _1336, _1322);
    float _1350 = fma(_1342, _1336, _1344);
    out.m_47.x = _1348;
    out.m_47.y = _1346;
    out.m_47.z = _1350;
    out.m_47.w = _893;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_BaseInstance [[base_instance]])
{
    main0_out out = {};
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1031 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _61 = in.m_40.x;
    float _63 = in.m_40.y;
    float _65 = -(*spvDescriptorSet0.vp_c15)._m0[3].x;
    float _67 = _65 + (*spvDescriptorSet0.vp_c15)._m0[3].y;
    int _70 = 16 + as_type<int>(as_type<float>(gl_BaseInstance));
    float _72 = -(*spvDescriptorSet0.vp_c15)._m0[3].z;
    float _74 = _72 + (*spvDescriptorSet0.vp_c15)._m0[3].w;
    int _76 = _70 << 4;
    bool _80 = _76 == 0;
    bool _82 = _76 == 16;
    bool _84 = _76 == 32;
    bool _86 = _76 == 48;
    bool _88 = _76 == 64;
    float _90 = fma(_67, _61, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _92 = fma(_74, _61, (*spvDescriptorSet0.vp_c15)._m0[3].z);
    bool _94 = _76 == 80;
    float _96 = as_type<float>(gl_BaseInstance);
    if (_80)
    {
        _96 = (*spvDescriptorSet0.vp_c14)._m0[268].x;
    }
    float _98 = _96;
    float _100 = -_90;
    float _102 = _100 + _92;
    bool _104 = _76 == 96;
    float _106 = fma(_102, _63, _90);
    float _108 = fma(_61, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _110 = 0.0;
    float _112 = _98;
    if (_80)
    {
        _110 = (*spvDescriptorSet0.vp_c14)._m0[268].z;
    }
    float _114 = _110;
    float _116 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _118 = _106 + _116;
    float _120 = _114;
    if (_82)
    {
        _112 = (*spvDescriptorSet0.vp_c14)._m0[269].x;
    }
    float _122 = _112;
    float _124 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _126 = _108 + _124;
    float _128 = fma(_63, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _130 = _118 * _118;
    bool _132 = _76 == 112;
    float _134 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _136 = _128 + _134;
    float _138 = fma(_126, _126, _130);
    float _140 = _122;
    if (_82)
    {
        _120 = (*spvDescriptorSet0.vp_c14)._m0[269].z;
    }
    float _142 = _120;
    float _144 = _142;
    if (_84)
    {
        _140 = (*spvDescriptorSet0.vp_c14)._m0[270].x;
    }
    float _146 = _140;
    float _148 = fma(_136, _136, _138);
    bool _150 = _76 == 128;
    float _152 = _146;
    if (_84)
    {
        _144 = (*spvDescriptorSet0.vp_c14)._m0[270].z;
    }
    float _154 = _144;
    float _156 = rsqrt(_148);
    float _158 = _154;
    if (_86)
    {
        _152 = (*spvDescriptorSet0.vp_c14)._m0[271].x;
    }
    float _160 = _152;
    bool _162 = _76 == 144;
    float _164 = _160;
    if (_86)
    {
        _158 = (*spvDescriptorSet0.vp_c14)._m0[271].z;
    }
    float _166 = _158;
    float _168 = _166;
    if (_88)
    {
        _164 = (*spvDescriptorSet0.vp_c14)._m0[272].x;
    }
    float _170 = _164;
    bool _172 = _76 == 160;
    float _174 = _170;
    if (_88)
    {
        _168 = (*spvDescriptorSet0.vp_c14)._m0[272].z;
    }
    float _176 = _168;
    float _178 = _176;
    if (_94)
    {
        _174 = (*spvDescriptorSet0.vp_c14)._m0[273].x;
    }
    float _180 = _174;
    bool _182 = _76 == 176;
    float _184 = _156 * (*spvDescriptorSet0.vp_c14)._m0[268].x;
    float _186 = _180;
    if (_94)
    {
        _178 = (*spvDescriptorSet0.vp_c14)._m0[273].z;
    }
    float _188 = _178;
    bool _190 = _76 == 192;
    float _192 = _188;
    if (_104)
    {
        _186 = (*spvDescriptorSet0.vp_c14)._m0[274].x;
    }
    float _194 = _186;
    float _196 = log2(_184);
    float _198 = _194;
    if (_104)
    {
        _192 = (*spvDescriptorSet0.vp_c14)._m0[274].z;
    }
    float _200 = _192;
    float _202 = _200;
    if (_132)
    {
        _198 = (*spvDescriptorSet0.vp_c14)._m0[275].x;
    }
    float _204 = _198;
    bool _206 = _76 == 208;
    float _208 = _204;
    if (_132)
    {
        _202 = (*spvDescriptorSet0.vp_c14)._m0[275].z;
    }
    float _210 = _202;
    float _212 = _210;
    if (_150)
    {
        _208 = (*spvDescriptorSet0.vp_c14)._m0[276].x;
    }
    float _214 = _208;
    bool _216 = _76 == 224;
    float _218 = _214;
    if (_150)
    {
        _212 = (*spvDescriptorSet0.vp_c14)._m0[276].z;
    }
    float _220 = _212;
    float _222 = _220;
    if (_162)
    {
        _218 = (*spvDescriptorSet0.vp_c14)._m0[277].x;
    }
    float _224 = _218;
    float _226 = _196 + 1.2999999523162841796875;
    bool _228 = _76 == 240;
    float _230 = _224;
    if (_162)
    {
        _222 = (*spvDescriptorSet0.vp_c14)._m0[277].z;
    }
    float _232 = _222;
    float _234 = _232;
    if (_172)
    {
        _230 = (*spvDescriptorSet0.vp_c14)._m0[278].x;
    }
    float _236 = _230;
    float _238 = trunc(_226);
    int _240 = int(_238);
    bool _242 = _76 == 256;
    float _244 = _236;
    if (_172)
    {
        _234 = (*spvDescriptorSet0.vp_c14)._m0[278].z;
    }
    float _246 = _234;
    float _248 = _246;
    if (_182)
    {
        _244 = (*spvDescriptorSet0.vp_c14)._m0[279].x;
    }
    float _250 = _244;
    bool _252 = _76 == 272;
    float _254 = _250;
    if (_182)
    {
        _248 = (*spvDescriptorSet0.vp_c14)._m0[279].z;
    }
    float _256 = _248;
    float _258 = _256;
    if (_190)
    {
        _254 = (*spvDescriptorSet0.vp_c14)._m0[280].x;
    }
    float _260 = _254;
    bool _262 = _76 == 288;
    float _264 = _260;
    if (_190)
    {
        _258 = (*spvDescriptorSet0.vp_c14)._m0[280].z;
    }
    float _266 = _258;
    int _268 = min(_240, 15);
    bool _270 = _76 == 304;
    float _272 = _266;
    if (_206)
    {
        _264 = (*spvDescriptorSet0.vp_c14)._m0[281].x;
    }
    float _274 = _264;
    float _276 = float(_268);
    float _278 = _274;
    if (_206)
    {
        _272 = (*spvDescriptorSet0.vp_c14)._m0[281].z;
    }
    float _280 = _272;
    int _282 = _268 << 4;
    int _284 = _282 + 4288;
    float _286 = _280;
    if (_216)
    {
        _278 = (*spvDescriptorSet0.vp_c14)._m0[282].x;
    }
    float _288 = _278;
    bool _290 = _76 == 320;
    float _292 = -_276;
    float _294 = _292 + (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _296 = _288;
    if (_216)
    {
        _286 = (*spvDescriptorSet0.vp_c14)._m0[282].z;
    }
    float _298 = _286;
    float _300 = _298;
    if (_228)
    {
        _296 = (*spvDescriptorSet0.vp_c14)._m0[283].x;
    }
    float _302 = _296;
    float _304 = _294 + 1.0;
    bool _306 = _76 == 336;
    float _308 = _302;
    if (_228)
    {
        _300 = (*spvDescriptorSet0.vp_c14)._m0[283].z;
    }
    float _310 = _300;
    float _312 = _310;
    if (_242)
    {
        _308 = (*spvDescriptorSet0.vp_c14)._m0[284].x;
    }
    float _314 = _308;
    float _316 = exp2(_304);
    bool _318 = _76 == 352;
    float _320 = _314;
    if (_242)
    {
        _312 = (*spvDescriptorSet0.vp_c14)._m0[284].z;
    }
    float _322 = _312;
    float _324 = _322;
    if (_252)
    {
        _320 = (*spvDescriptorSet0.vp_c14)._m0[285].x;
    }
    float _326 = _320;
    bool _328 = _76 == 368;
    float _330 = _326;
    if (_252)
    {
        _324 = (*spvDescriptorSet0.vp_c14)._m0[285].z;
    }
    float _332 = _324;
    float _334 = _332;
    if (_262)
    {
        _330 = (*spvDescriptorSet0.vp_c14)._m0[286].x;
    }
    float _336 = _330;
    bool _338 = _76 == 384;
    float _340 = _336;
    if (_262)
    {
        _334 = (*spvDescriptorSet0.vp_c14)._m0[286].z;
    }
    float _342 = _334;
    float _344 = 1.0 / _316;
    float _346 = _342;
    if (_270)
    {
        _340 = (*spvDescriptorSet0.vp_c14)._m0[287].x;
    }
    float _348 = _340;
    bool _350 = _76 == 400;
    float _352 = _348;
    if (_270)
    {
        _346 = (*spvDescriptorSet0.vp_c14)._m0[287].z;
    }
    float _354 = _346;
    bool _356 = _76 == 416;
    float _358 = _354;
    if (_290)
    {
        _352 = (*spvDescriptorSet0.vp_c14)._m0[288].x;
    }
    float _360 = _352;
    float _362 = _360;
    if (_290)
    {
        _358 = (*spvDescriptorSet0.vp_c14)._m0[288].z;
    }
    float _364 = _358;
    float _366 = _364;
    if (_306)
    {
        _362 = (*spvDescriptorSet0.vp_c14)._m0[289].x;
    }
    float _368 = _362;
    bool _370 = _76 == 432;
    float _372 = _368;
    if (_306)
    {
        _366 = (*spvDescriptorSet0.vp_c14)._m0[289].z;
    }
    float _374 = _366;
    float _376 = _374;
    if (_318)
    {
        _372 = (*spvDescriptorSet0.vp_c14)._m0[290].x;
    }
    float _378 = _372;
    bool _380 = _76 == 448;
    float _382 = _378;
    if (_318)
    {
        _376 = (*spvDescriptorSet0.vp_c14)._m0[290].z;
    }
    float _384 = _376;
    float _386 = _384;
    if (_328)
    {
        _382 = (*spvDescriptorSet0.vp_c14)._m0[291].x;
    }
    float _388 = _382;
    bool _390 = _76 == 464;
    float _392 = _388;
    if (_328)
    {
        _386 = (*spvDescriptorSet0.vp_c14)._m0[291].z;
    }
    float _394 = _386;
    float _396 = _394;
    if (_338)
    {
        _392 = (*spvDescriptorSet0.vp_c14)._m0[292].x;
    }
    float _398 = _392;
    bool _400 = _76 == 480;
    float _402 = _398;
    if (_338)
    {
        _396 = (*spvDescriptorSet0.vp_c14)._m0[292].z;
    }
    float _404 = _396;
    float _406 = _404;
    if (_350)
    {
        _402 = (*spvDescriptorSet0.vp_c14)._m0[293].x;
    }
    float _408 = _402;
    bool _410 = _76 == 496;
    float _412 = _408;
    if (_350)
    {
        _406 = (*spvDescriptorSet0.vp_c14)._m0[293].z;
    }
    float _414 = _406;
    float _416 = _414;
    if (_356)
    {
        _412 = (*spvDescriptorSet0.vp_c14)._m0[294].x;
    }
    float _418 = _412;
    bool _420 = _76 == 512;
    float _422 = _418;
    if (_356)
    {
        _416 = (*spvDescriptorSet0.vp_c14)._m0[294].z;
    }
    float _424 = _416;
    bool _426 = _76 == 528;
    float _428 = _424;
    if (_370)
    {
        _422 = (*spvDescriptorSet0.vp_c14)._m0[295].x;
    }
    float _430 = _422;
    float _432 = _430;
    if (_370)
    {
        _428 = (*spvDescriptorSet0.vp_c14)._m0[295].z;
    }
    float _434 = _428;
    float _436 = _434;
    if (_380)
    {
        _432 = (*spvDescriptorSet0.vp_c14)._m0[296].x;
    }
    float _438 = _432;
    bool _440 = _76 == 544;
    float _442 = _438;
    if (_380)
    {
        _436 = (*spvDescriptorSet0.vp_c14)._m0[296].z;
    }
    float _444 = _436;
    float _446 = _444;
    if (_390)
    {
        _442 = (*spvDescriptorSet0.vp_c14)._m0[297].x;
    }
    float _448 = _442;
    bool _450 = _76 == 560;
    float _452 = _448;
    if (_390)
    {
        _446 = (*spvDescriptorSet0.vp_c14)._m0[297].z;
    }
    float _454 = _446;
    float _456 = _454;
    if (_400)
    {
        _452 = (*spvDescriptorSet0.vp_c14)._m0[298].x;
    }
    float _458 = _452;
    bool _460 = _76 == 576;
    float _462 = _458;
    if (_400)
    {
        _456 = (*spvDescriptorSet0.vp_c14)._m0[298].z;
    }
    float _464 = _456;
    float _466 = _464;
    if (_410)
    {
        _462 = (*spvDescriptorSet0.vp_c14)._m0[299].x;
    }
    float _468 = _462;
    bool _470 = _76 == 592;
    float _472 = _468;
    if (_410)
    {
        _466 = (*spvDescriptorSet0.vp_c14)._m0[299].z;
    }
    float _474 = _466;
    float _476 = _474;
    if (_420)
    {
        _472 = (*spvDescriptorSet0.vp_c14)._m0[300].x;
    }
    float _478 = _472;
    bool _480 = _76 == 608;
    float _482 = _478;
    if (_420)
    {
        _476 = (*spvDescriptorSet0.vp_c14)._m0[300].z;
    }
    float _484 = _476;
    float _486 = _484;
    if (_426)
    {
        _482 = (*spvDescriptorSet0.vp_c14)._m0[301].x;
    }
    float _488 = _482;
    bool _490 = _76 == 624;
    float _492 = _488;
    if (_426)
    {
        _486 = (*spvDescriptorSet0.vp_c14)._m0[301].z;
    }
    float _494 = _486;
    bool _496 = _76 == 640;
    float _498 = _494;
    if (_440)
    {
        _492 = (*spvDescriptorSet0.vp_c14)._m0[302].x;
    }
    float _500 = _492;
    float _502 = _500;
    if (_440)
    {
        _498 = (*spvDescriptorSet0.vp_c14)._m0[302].z;
    }
    float _504 = _498;
    float _506 = _504;
    if (_450)
    {
        _502 = (*spvDescriptorSet0.vp_c14)._m0[303].x;
    }
    float _508 = _502;
    bool _510 = _76 == 656;
    float _512 = _508;
    if (_450)
    {
        _506 = (*spvDescriptorSet0.vp_c14)._m0[303].z;
    }
    float _514 = _506;
    float _516 = _514;
    if (_460)
    {
        _512 = (*spvDescriptorSet0.vp_c14)._m0[304].x;
    }
    float _518 = _512;
    bool _520 = _76 == 672;
    float _522 = _518;
    if (_460)
    {
        _516 = (*spvDescriptorSet0.vp_c14)._m0[304].z;
    }
    float _524 = _516;
    float _526 = _524;
    if (_470)
    {
        _522 = (*spvDescriptorSet0.vp_c14)._m0[305].x;
    }
    float _528 = _522;
    bool _530 = _76 == 688;
    float _532 = _528;
    if (_470)
    {
        _526 = (*spvDescriptorSet0.vp_c14)._m0[305].z;
    }
    float _534 = _526;
    float _536 = _534;
    if (_480)
    {
        _532 = (*spvDescriptorSet0.vp_c14)._m0[306].x;
    }
    float _538 = _532;
    bool _540 = _76 == 704;
    float _542 = _538;
    if (_480)
    {
        _536 = (*spvDescriptorSet0.vp_c14)._m0[306].z;
    }
    float _544 = _536;
    float _546 = _544;
    if (_490)
    {
        _542 = (*spvDescriptorSet0.vp_c14)._m0[307].x;
    }
    float _548 = _542;
    bool _550 = _76 == 720;
    float _552 = _548;
    if (_490)
    {
        _546 = (*spvDescriptorSet0.vp_c14)._m0[307].z;
    }
    float _554 = _546;
    float _556 = _554;
    if (_496)
    {
        _552 = (*spvDescriptorSet0.vp_c14)._m0[308].x;
    }
    float _558 = _552;
    bool _560 = _76 == 736;
    float _562 = _558;
    if (_496)
    {
        _556 = (*spvDescriptorSet0.vp_c14)._m0[308].z;
    }
    float _564 = _556;
    bool _566 = _76 == 752;
    float _568 = _564;
    if (_510)
    {
        _562 = (*spvDescriptorSet0.vp_c14)._m0[309].x;
    }
    float _570 = _562;
    float _572 = _570;
    if (_520)
    {
        _572 = (*spvDescriptorSet0.vp_c14)._m0[310].x;
    }
    float _574 = _572;
    float _576 = _574;
    if (_530)
    {
        _576 = (*spvDescriptorSet0.vp_c14)._m0[311].x;
    }
    float _578 = _576;
    float _580 = _578;
    if (_540)
    {
        _580 = (*spvDescriptorSet0.vp_c14)._m0[312].x;
    }
    float _582 = _580;
    float _584 = _582;
    if (_550)
    {
        _584 = (*spvDescriptorSet0.vp_c14)._m0[313].x;
    }
    float _586 = _584;
    float _588 = _586;
    if (_560)
    {
        _588 = (*spvDescriptorSet0.vp_c14)._m0[314].x;
    }
    float _590 = _588;
    float _592 = _590;
    if (_566)
    {
        _592 = (*spvDescriptorSet0.vp_c14)._m0[315].x;
    }
    float _594 = _592;
    float _596 = _344 * _594;
    if (_510)
    {
        _568 = (*spvDescriptorSet0.vp_c14)._m0[309].z;
    }
    float _598 = _568;
    float _600 = _598;
    if (_520)
    {
        _600 = (*spvDescriptorSet0.vp_c14)._m0[310].z;
    }
    float _602 = _600;
    float _604 = _596 * _61;
    float _606 = _596 * _63;
    float _608 = _602;
    if (_530)
    {
        _608 = (*spvDescriptorSet0.vp_c14)._m0[311].z;
    }
    float _610 = _608;
    float _612 = floor(_604);
    float _614 = _610;
    if (_540)
    {
        _614 = (*spvDescriptorSet0.vp_c14)._m0[312].z;
    }
    float _616 = _614;
    float _618 = _616;
    if (_550)
    {
        _618 = (*spvDescriptorSet0.vp_c14)._m0[313].z;
    }
    float _620 = _618;
    float _622 = _620;
    if (_560)
    {
        _622 = (*spvDescriptorSet0.vp_c14)._m0[314].z;
    }
    float _624 = _622;
    float _626 = _624;
    if (_566)
    {
        _626 = (*spvDescriptorSet0.vp_c14)._m0[315].z;
    }
    float _628 = _626;
    float _630 = floor(_606);
    float _632 = _316 * _628;
    float _634 = -_612;
    float _636 = _604 + _634;
    float _638 = _636 * 2.0;
    float _640 = -_636;
    float _642 = fma(_632, _640, _61);
    int _644 = _284 + 8;
    uint _647 = uint(int(uint(_644) >> uint(2)));
    uint _649 = uint(int(uint(int(_647)) >> uint(2)));
    int _651 = int(_647) & 3;
    float _653 = (*spvDescriptorSet0.vp_c14)._m0[int(_649)][_651];
    int _655 = int(_647) + 1;
    uint _657 = uint(int(uint(_655) >> uint(2)));
    int _659 = _655 & 3;
    float _661 = (*spvDescriptorSet0.vp_c14)._m0[int(_657)][_659];
    float _663 = -_630;
    float _665 = _606 + _663;
    float _667 = floor(_638);
    float _669 = _665 * 2.0;
    float _671 = -_665;
    float _673 = fma(_632, _671, _63);
    float _675 = floor(_669);
    float _677 = _632 * _667;
    float _679 = _677 * 0.5;
    float _681 = _679 + _642;
    float _683 = fma(_67, _681, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _685 = _632 * _675;
    float _687 = _685 * 0.5;
    float _689 = fma(_74, _681, (*spvDescriptorSet0.vp_c15)._m0[3].z);
    float _691 = fma(_681, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _693 = _687 + _673;
    float _695 = -_683;
    float _697 = _695 + _689;
    float _699 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _701 = _691 + _699;
    float _703 = fma(_693, _697, _683);
    float _705 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _707 = _703 + _705;
    float _709 = fma(_693, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _711 = _707 * _707;
    float _713 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _715 = _709 + _713;
    float _717 = fma(_701, _701, _711);
    float _719 = fma(_715, _715, _717);
    float _721 = sqrt(_719);
    float _723 = -_661;
    float _725 = fma(_721, _653, _723);
    float _727 = precise::clamp(_725, 0.0, 1.0);
    float _729 = -_687;
    float _731 = fma(_729, _727, _693);
    float _733 = -_679;
    float _735 = fma(_733, _727, _681);
    float _737 = fma(_731, (*spvDescriptorSet0.vp_c15)._m0[6].x, (*spvDescriptorSet0.vp_c15)._m0[6].w);
    float _739 = fma(_735, (*spvDescriptorSet0.vp_c15)._m0[6].x, (*spvDescriptorSet0.vp_c15)._m0[6].z);
    float _741 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _737);
    float _743 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _739);
    float2 _2552 = float2(_743, _741);
    float _745 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2552, float2(0.0), isnan(_2552)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2552, float2(0.0), isnan(_2552)), level(0.0)).x;
    float _747 = fma(_731, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _749 = fma(_735, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _751 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _753 = _747 + _751;
    float _755 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _757 = _749 + _755;
    float _759 = fma(_735, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].z);
    float _761 = _753 * _753;
    float _763 = fma(_731, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].w);
    float _765 = fma(_757, _757, _761);
    float _767 = sqrt(_765);
    bool _769 = _767 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _771 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _773 = _767 + _771;
    float _775 = (*spvDescriptorSet0.vp_c15)._m0[4].x;
    float _777 = _767;
    float _779 = (*spvDescriptorSet0.vp_c15)._m0[6].x;
    float _781 = _765;
    if (_769)
    {
        float _783 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        _775 = _783;
    }
    float _785 = _775;
    float _787 = _785;
    float _789 = (*spvDescriptorSet0.vp_c14)._m0[0].y;
    if (_769)
    {
        float _791 = _773 * _785;
        _777 = _791;
    }
    float _793 = _777;
    if (_769)
    {
        float _795 = rsqrt(_765);
        _787 = _795;
    }
    float _797 = _787;
    float _799 = _797;
    if (_769)
    {
        float _801 = _793 * 0.15915493667125701904296875;
        _779 = _801;
    }
    float _803 = _779;
    float _805 = _793;
    if (_769)
    {
        float _807 = _803 * 6.283185482025146484375;
        float _809 = sin(_807);
        _805 = _809;
    }
    float _811 = _805;
    float _813 = _773;
    if (_769)
    {
        float _815 = _803 * 6.283185482025146484375;
        float _817 = cos(_815);
        _813 = _817;
    }
    float _819 = _813;
    float _821 = fma(_745, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    if (_769)
    {
        float _823 = _821 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        _789 = _823;
    }
    float _825 = _789;
    float _827 = _821 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _829 = _825;
    float _831 = _811;
    if (_769)
    {
        float _833 = fma(_811, _825, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        _829 = _833;
    }
    float _835 = _829;
    float _837 = _835;
    float _839 = _819;
    if (_769)
    {
        float _841 = _819 + (-1.0);
        _831 = _841;
    }
    float _843 = _831;
    float _845 = fma(_749, (*spvDescriptorSet0.vp_c4)._m0[2].x, _827);
    float _847 = 0.0;
    float _849 = _843;
    if (_769)
    {
        float _851 = _797 * _835;
        _847 = _851;
    }
    float _853 = _847;
    if (_769)
    {
        float _855 = _843 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        _781 = _855;
    }
    float _857 = _781;
    if (!_769)
    {
        _837 = _821;
    }
    float _859 = _837;
    float _861 = fma(_747, (*spvDescriptorSet0.vp_c4)._m0[2].z, _845);
    float _863 = _859;
    if (!_769)
    {
        _799 = _749;
    }
    float _865 = _799;
    float _867 = _865;
    if (_769)
    {
        float _869 = fma(_821, _819, _857);
        _863 = _869;
    }
    float _871 = _863;
    if (_769)
    {
        float _873 = fma(_757, _853, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        _867 = _873;
    }
    float _875 = _867;
    if (!_769)
    {
        _849 = _747;
    }
    float _877 = _849;
    float _879 = _877;
    if (_769)
    {
        float _881 = fma(_753, _853, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        _879 = _881;
    }
    float _883 = _879;
    float _885 = _871 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    if (_769)
    {
        float _887 = _871 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        _839 = _887;
    }
    float _889 = _839;
    float _891 = _871 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _893 = _861 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _895 = fma(_875, (*spvDescriptorSet0.vp_c4)._m0[1].x, _885);
    float _897 = _889;
    float _899 = _891;
    if (_769)
    {
        float _901 = fma(_875, (*spvDescriptorSet0.vp_c4)._m0[2].x, _889);
        _897 = _901;
    }
    float _903 = _897;
    float _905 = fma(_875, (*spvDescriptorSet0.vp_c4)._m0[0].x, _891);
    float _907 = fma(_883, (*spvDescriptorSet0.vp_c4)._m0[1].z, _895);
    float _909 = _903;
    if (_769)
    {
        float _911 = fma(_883, (*spvDescriptorSet0.vp_c4)._m0[2].z, _903);
        _909 = _911;
    }
    float _913 = _909;
    float _915 = fma(_883, (*spvDescriptorSet0.vp_c4)._m0[0].z, _905);
    int _917 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[40].w) & 2;
    bool _919 = _917 != 0;
    float _921 = _907 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    if (!_769)
    {
        _899 = _893;
    }
    float _923 = _899;
    float _925 = _915 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _927 = _923;
    if (_769)
    {
        float _929 = _913 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _927 = _929;
    }
    float _931 = _927;
    float _933 = _921 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _935 = _921 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _937 = _921 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _939 = _921 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _941 = fma(_925, (*spvDescriptorSet0.vp_c4)._m0[7].x, _933);
    float _943 = fma(_925, (*spvDescriptorSet0.vp_c4)._m0[8].x, _935);
    float _945 = fma(_925, (*spvDescriptorSet0.vp_c4)._m0[9].x, _937);
    float _947 = fma(_925, (*spvDescriptorSet0.vp_c4)._m0[10].x, _939);
    float _949 = fma(_931, (*spvDescriptorSet0.vp_c4)._m0[7].z, _941);
    float _951 = fma(_931, (*spvDescriptorSet0.vp_c4)._m0[8].z, _943);
    float _953 = fma(_931, (*spvDescriptorSet0.vp_c4)._m0[9].z, _945);
    float _955 = fma(_931, (*spvDescriptorSet0.vp_c4)._m0[10].z, _947);
    float _957 = _949 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _959 = _951 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _961 = _953 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _963 = _955 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    bool _965 = !_919;
    float _967;
    float _969;
    float _971;
    int _973;
    int _975;
    int _977;
    int _979;
    int _981;
    int _983;
    int _985;
    int _987;
    float _989;
    float _991;
    float _993;
    float _995;
    float _997;
    float _999;
    float _1001;
    float _1003;
    float _1005;
    float _1007;
    float _1009;
    float _1011;
    float _1013;
    float _1015;
    float _1017;
    float _1019;
    float _1021;
    float _1023;
    int _1025;
    float _1027;
    float _1029;
    if (!_965)
    {
        _967 = (*spvDescriptorSet0.vp_c9)._m0[919].z;
        _969 = (*spvDescriptorSet0.vp_c9)._m0[919].x;
        _971 = (*spvDescriptorSet0.vp_c9)._m0[919].y;
        _973 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[919].w);
        _975 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].x);
        _977 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].y);
        _979 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].z);
        _981 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].w);
        _983 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].x);
        _985 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].y);
        _987 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].w);
        _989 = (*spvDescriptorSet0.vp_c9)._m0[922].y;
        _991 = (*spvDescriptorSet0.vp_c9)._m0[923].y;
        _993 = (*spvDescriptorSet0.vp_c9)._m0[916].w;
        _995 = (*spvDescriptorSet0.vp_c9)._m0[917].x;
        _997 = (*spvDescriptorSet0.vp_c9)._m0[922].x;
        _999 = (*spvDescriptorSet0.vp_c9)._m0[923].x;
        _1001 = (*spvDescriptorSet0.vp_c9)._m0[916].x;
        _1003 = (*spvDescriptorSet0.vp_c9)._m0[917].y;
        _1005 = (*spvDescriptorSet0.vp_c9)._m0[922].z;
        _1007 = (*spvDescriptorSet0.vp_c9)._m0[923].z;
        _1009 = (*spvDescriptorSet0.vp_c9)._m0[917].z;
        _1011 = (*spvDescriptorSet0.vp_c9)._m0[916].y;
        _1013 = (*spvDescriptorSet0.vp_c9)._m0[922].w;
        _1015 = (*spvDescriptorSet0.vp_c9)._m0[923].w;
        _1017 = (*spvDescriptorSet0.vp_c9)._m0[916].z;
        _1019 = (*spvDescriptorSet0.vp_c9)._m0[918].y;
        _1021 = (*spvDescriptorSet0.vp_c9)._m0[917].w;
        _1023 = (*spvDescriptorSet0.vp_c9)._m0[918].x;
        _1025 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].z);
        _1027 = (*spvDescriptorSet0.vp_c9)._m0[918].z;
        _1029 = (*spvDescriptorSet0.vp_c9)._m0[918].w;
        _1031 = true;
    }
    else
    {
        float _1033 = fma(_749, 6.2500002968590706586837768554688e-05, 0.5);
        float _1035 = fma(_747, 6.2500002968590706586837768554688e-05, 0.5);
        float3 _3065 = float3(_1033, _1035, float(0));
        float3 _3069 = select(_3065, float3(0.0), isnan(_3065));
        float4 _1038 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _3069.xy, uint(rint(_3069.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _3069.xy, uint(rint(_3069.z)), level(0.0)).xyzw;
        float _1040 = _1038.x;
        float _1042 = _1038.y;
        float _1044 = _1038.z;
        float _1046 = _1038.w;
        float3 _3084 = float3(_1033, _1035, float(1));
        float3 _3086 = select(_3084, float3(0.0), isnan(_3084));
        float4 _1048 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _3086.xy, uint(rint(_3086.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _3086.xy, uint(rint(_3086.z)), level(0.0)).xyzw;
        float _1050 = _1048.x;
        float _1052 = _1048.y;
        float _1054 = _1048.z;
        float _1056 = _1048.w;
        float3 _3101 = float3(_1033, _1035, float(2));
        float3 _3103 = select(_3101, float3(0.0), isnan(_3101));
        float4 _1058 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _3103.xy, uint(rint(_3103.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _3103.xy, uint(rint(_3103.z)), level(0.0)).xyzw;
        float _1060 = _1058.x;
        float _1062 = _1058.y;
        float _1064 = _1058.z;
        float _1066 = _1058.w;
        float3 _3118 = float3(_1033, _1035, float(3));
        float3 _3120 = select(_3118, float3(0.0), isnan(_3118));
        float4 _1068 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _3120.xy, uint(rint(_3120.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _3120.xy, uint(rint(_3120.z)), level(0.0)).xyzw;
        float _1070 = _1068.x;
        float _1072 = _1068.y;
        float _1074 = _1068.z;
        float _1076 = _1068.w;
        float3 _3135 = float3(_1033, _1035, float(4));
        float3 _3137 = select(_3135, float3(0.0), isnan(_3135));
        float4 _1078 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _3137.xy, uint(rint(_3137.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _3137.xy, uint(rint(_3137.z)), level(0.0)).xyzw;
        float _1080 = _1078.x;
        float _1082 = _1078.y;
        float _1084 = _1078.z;
        float _1086 = _1078.w;
        float3 _3153 = float3(_1033, _1035, float(5));
        float3 _3155 = select(_3153, float3(0.0), isnan(_3153));
        float4 _1088 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _3155.xy, uint(rint(_3155.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _3155.xy, uint(rint(_3155.z)), level(0.0)).xyzw;
        float _1090 = _1088.x;
        float _1092 = _1088.y;
        float _1094 = _1088.z;
        float _1096 = _1088.w;
        float3 _3170 = float3(_1033, _1035, float(6));
        float3 _3172 = select(_3170, float3(0.0), isnan(_3170));
        float4 _1098 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _3172.xy, uint(rint(_3172.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _3172.xy, uint(rint(_3172.z)), level(0.0)).xyzw;
        float _1100 = _1098.x;
        float _1102 = _1098.y;
        float _1104 = _1098.z;
        float _1106 = _1098.w;
        float3 _3187 = float3(_1033, _1035, float(7));
        float3 _3189 = select(_3187, float3(0.0), isnan(_3187));
        float4 _1108 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _3189.xy, uint(rint(_3189.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _3189.xy, uint(rint(_3189.z)), level(0.0)).xyzw;
        float _1110 = _1108.x;
        float _1112 = _1108.y;
        float _1114 = _1108.z;
        float _1116 = _1108.w;
        _967 = _1074;
        _969 = _1070;
        _971 = _1072;
        _973 = as_type<int>(_1076);
        _975 = as_type<int>(_1080);
        _977 = as_type<int>(_1082);
        _979 = as_type<int>(_1084);
        _981 = as_type<int>(_1086);
        _983 = as_type<int>(_1090);
        _985 = as_type<int>(_1092);
        _987 = as_type<int>(_1096);
        _989 = _1102;
        _991 = _1112;
        _993 = _1046;
        _995 = _1050;
        _997 = _1100;
        _999 = _1110;
        _1001 = _1040;
        _1003 = _1052;
        _1005 = _1104;
        _1007 = _1114;
        _1009 = _1054;
        _1011 = _1042;
        _1013 = _1106;
        _1015 = _1116;
        _1017 = _1044;
        _1019 = _1062;
        _1021 = _1056;
        _1023 = _1060;
        _1025 = as_type<int>(_1094);
        _1027 = _1064;
        _1029 = _1066;
    }
    _1031 = false;
    float _1118 = _967;
    float _1120 = _969;
    float _1122 = _971;
    int _1124 = _973;
    int _1126 = _975;
    int _1128 = _977;
    int _1130 = _979;
    int _1132 = _981;
    int _1134 = _983;
    int _1136 = _985;
    int _1138 = _987;
    float _1140 = _989;
    float _1142 = _991;
    float _1144 = _993;
    float _1146 = _995;
    float _1148 = _997;
    float _1150 = _999;
    float _1152 = _1001;
    float _1154 = _1003;
    float _1156 = _1005;
    float _1158 = _1007;
    float _1160 = _1009;
    float _1162 = _1011;
    float _1164 = _1013;
    float _1166 = _1015;
    float _1168 = _1017;
    float _1170 = _1019;
    float _1172 = _1021;
    float _1174 = _1023;
    int _1176 = _1025;
    float _1178 = _1027;
    float _1180 = _1029;
    float _1182 = -(*spvDescriptorSet0.vp_c4)._m0[12].w;
    float _1184 = _821 + _1182;
    float _1186 = -(*spvDescriptorSet0.vp_c4)._m0[11].w;
    float _1188 = _749 + _1186;
    float _1190 = -(*spvDescriptorSet0.vp_c4)._m0[13].w;
    float _1192 = _747 + _1190;
    float _1194 = _1118 * 0.88622701168060302734375;
    float _1196 = _1184 * _1184;
    float _1198 = _1120 * 0.88622701168060302734375;
    float _1200 = _1122 * 0.88622701168060302734375;
    float _1202 = _919 ? as_type<float>(_1124) : 0.0;
    float _1204 = fma(_1188, _1188, _1196);
    float _1206 = _919 ? as_type<float>(_1126) : 0.0;
    out.gl_Position.x = _957;
    out.gl_Position.y = _959;
    out.gl_Position.z = _961;
    out.gl_Position.w = _963;
    float _1208 = _919 ? as_type<float>(_1128) : 0.0;
    float _1210 = fma(_1192, _1192, _1204);
    float _1212 = _919 ? _1198 : 0.0;
    out.m_43.x = _749;
    out.m_43.y = _821;
    out.m_43.z = _747;
    float _1214 = _919 ? _1200 : 0.0;
    float _1216 = _919 ? _1194 : 0.0;
    float _1218 = rsqrt(_1210);
    float _1220 = _919 ? as_type<float>(_1130) : 0.0;
    out.m_45.z = _759;
    out.m_45.w = _763;
    float _1222 = _919 ? as_type<float>(_1132) : 0.0;
    float _1224 = _919 ? as_type<float>(_1134) : 0.0;
    float _1226 = _919 ? as_type<float>(_1136) : 0.0;
    float _1228 = _919 ? as_type<float>(_1138) : 0.0;
    float _1230 = _1218 * 1.02332699298858642578125;
    float _1232 = _1192 * _1218;
    float _1234 = _1184 * _1230;
    float _1236 = _1232 * (-1.02332699298858642578125);
    float _1238 = _1188 * _1230;
    float _1240 = _1234 * _1140;
    float _1242 = _1234 * _1142;
    float _1244 = _1234 * _1144;
    float _1246 = _1234 * _1146;
    float _1248 = fma(_1148, 0.88622701168060302734375, _1240);
    float _1250 = fma(_1150, 0.88622701168060302734375, _1242);
    float _1252 = fma(_1152, 0.88622701168060302734375, _1244);
    float _1254 = _1234 * _1154;
    float _1256 = fma(_1236, _1156, _1248);
    float _1258 = fma(_1236, _1158, _1250);
    float _1260 = fma(_1236, _1160, _1252);
    float _1262 = fma(_1162, 0.88622701168060302734375, _1246);
    float _1264 = fma(_1238, _1164, _1256);
    float _1266 = fma(_1238, _1166, _1258);
    float _1268 = fma(_1168, 0.88622701168060302734375, _1254);
    float _1270 = fma(_1202, _1234, _1212);
    float _1272 = fma(_1206, _1234, _1214);
    float _1274 = precise::max(0.0, _1264);
    float _1276 = fma(_1208, _1234, _1216);
    float _1278 = precise::max(0.0, _1266);
    float _1280 = fma(_1238, _1170, _1260);
    float _1282 = fma(_1236, _1172, _1262);
    float _1284 = _1274 * 0.31830990314483642578125;
    float _1286 = precise::clamp(_1284, 0.0, 1.0);
    float _1288 = fma(_1236, _1174, _1268);
    float _1290 = fma(_1220, _1236, _1270);
    float _1292 = fma(_1222, _1236, _1272);
    float _1294 = _1286 * 0.88622701168060302734375;
    float _1296 = fma(_1224, _1236, _1276);
    float _1298 = _1278 * 0.31830990314483642578125;
    float _1300 = precise::clamp(_1298, 0.0, 1.0);
    float _1302 = _919 ? as_type<float>(_1176) : 0.0;
    float _1304 = fma(_1238, _1178, _1282);
    float _1306 = precise::max(0.0, _1280);
    float _1308 = _1294 * (*spvDescriptorSet0.vp_c9)._m0[991].x;
    float _1310 = fma(_1238, _1180, _1288);
    float _1312 = -_1300;
    float _1314 = _1312 + 1.0;
    float _1316 = fma(_1302, _1238, _1292);
    float _1318 = fma(_1226, _1238, _1290);
    float _1320 = fma(_1228, _1238, _1296);
    float _1322 = fma(_1306, (*spvDescriptorSet0.vp_c9)._m0[68].x, _1308);
    float _1324 = precise::max(0.0, _1304);
    float _1326 = fma(_1314, (*spvDescriptorSet0.vp_c9)._m0[37].y, _1300);
    float _1328 = _1294 * (*spvDescriptorSet0.vp_c9)._m0[991].y;
    float _1330 = precise::max(0.0, _1310);
    float _1332 = _1294 * (*spvDescriptorSet0.vp_c9)._m0[991].z;
    float _1334 = precise::max(0.0, _1316);
    float _1336 = _1326 * (*spvDescriptorSet0.vp_c9)._m0[40].z;
    float _1338 = precise::max(0.0, _1318);
    float _1340 = fma(_1324, (*spvDescriptorSet0.vp_c9)._m0[68].y, _1328);
    float _1342 = precise::max(0.0, _1320);
    float _1344 = fma(_1330, (*spvDescriptorSet0.vp_c9)._m0[68].z, _1332);
    float _1346 = fma(_1334, _1336, _1340);
    float _1348 = fma(_1338, _1336, _1322);
    float _1350 = fma(_1342, _1336, _1344);
    out.m_47.x = _1348;
    out.m_47.y = _1346;
    out.m_47.z = _1350;
    out.m_47.w = _893;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_BaseInstance [[base_instance]], uint dm_vid [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1031 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _61 = in.m_40.x;
    float _63 = in.m_40.y;
    float _65 = -(*spvDescriptorSet0.vp_c15)._m0[3].x;
    float _67 = _65 + (*spvDescriptorSet0.vp_c15)._m0[3].y;
    int _70 = 16 + as_type<int>(as_type<float>(gl_BaseInstance));
    float _72 = -(*spvDescriptorSet0.vp_c15)._m0[3].z;
    float _74 = _72 + (*spvDescriptorSet0.vp_c15)._m0[3].w;
    int _76 = _70 << 4;
    bool _80 = _76 == 0;
    bool _82 = _76 == 16;
    bool _84 = _76 == 32;
    bool _86 = _76 == 48;
    bool _88 = _76 == 64;
    float _90 = fma(_67, _61, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _92 = fma(_74, _61, (*spvDescriptorSet0.vp_c15)._m0[3].z);
    bool _94 = _76 == 80;
    float _96 = as_type<float>(gl_BaseInstance);
    if (_80)
    {
        _96 = (*spvDescriptorSet0.vp_c14)._m0[268].x;
    }
    float _98 = _96;
    float _100 = -_90;
    float _102 = _100 + _92;
    bool _104 = _76 == 96;
    float _106 = fma(_102, _63, _90);
    float _108 = fma(_61, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _110 = 0.0;
    float _112 = _98;
    if (_80)
    {
        _110 = (*spvDescriptorSet0.vp_c14)._m0[268].z;
    }
    float _114 = _110;
    float _116 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _118 = _106 + _116;
    float _120 = _114;
    if (_82)
    {
        _112 = (*spvDescriptorSet0.vp_c14)._m0[269].x;
    }
    float _122 = _112;
    float _124 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _126 = _108 + _124;
    float _128 = fma(_63, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _130 = _118 * _118;
    bool _132 = _76 == 112;
    float _134 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _136 = _128 + _134;
    float _138 = fma(_126, _126, _130);
    float _140 = _122;
    if (_82)
    {
        _120 = (*spvDescriptorSet0.vp_c14)._m0[269].z;
    }
    float _142 = _120;
    float _144 = _142;
    if (_84)
    {
        _140 = (*spvDescriptorSet0.vp_c14)._m0[270].x;
    }
    float _146 = _140;
    float _148 = fma(_136, _136, _138);
    bool _150 = _76 == 128;
    float _152 = _146;
    if (_84)
    {
        _144 = (*spvDescriptorSet0.vp_c14)._m0[270].z;
    }
    float _154 = _144;
    float _156 = rsqrt(_148);
    float _158 = _154;
    if (_86)
    {
        _152 = (*spvDescriptorSet0.vp_c14)._m0[271].x;
    }
    float _160 = _152;
    bool _162 = _76 == 144;
    float _164 = _160;
    if (_86)
    {
        _158 = (*spvDescriptorSet0.vp_c14)._m0[271].z;
    }
    float _166 = _158;
    float _168 = _166;
    if (_88)
    {
        _164 = (*spvDescriptorSet0.vp_c14)._m0[272].x;
    }
    float _170 = _164;
    bool _172 = _76 == 160;
    float _174 = _170;
    if (_88)
    {
        _168 = (*spvDescriptorSet0.vp_c14)._m0[272].z;
    }
    float _176 = _168;
    float _178 = _176;
    if (_94)
    {
        _174 = (*spvDescriptorSet0.vp_c14)._m0[273].x;
    }
    float _180 = _174;
    bool _182 = _76 == 176;
    float _184 = _156 * (*spvDescriptorSet0.vp_c14)._m0[268].x;
    float _186 = _180;
    if (_94)
    {
        _178 = (*spvDescriptorSet0.vp_c14)._m0[273].z;
    }
    float _188 = _178;
    bool _190 = _76 == 192;
    float _192 = _188;
    if (_104)
    {
        _186 = (*spvDescriptorSet0.vp_c14)._m0[274].x;
    }
    float _194 = _186;
    float _196 = log2(_184);
    float _198 = _194;
    if (_104)
    {
        _192 = (*spvDescriptorSet0.vp_c14)._m0[274].z;
    }
    float _200 = _192;
    float _202 = _200;
    if (_132)
    {
        _198 = (*spvDescriptorSet0.vp_c14)._m0[275].x;
    }
    float _204 = _198;
    bool _206 = _76 == 208;
    float _208 = _204;
    if (_132)
    {
        _202 = (*spvDescriptorSet0.vp_c14)._m0[275].z;
    }
    float _210 = _202;
    float _212 = _210;
    if (_150)
    {
        _208 = (*spvDescriptorSet0.vp_c14)._m0[276].x;
    }
    float _214 = _208;
    bool _216 = _76 == 224;
    float _218 = _214;
    if (_150)
    {
        _212 = (*spvDescriptorSet0.vp_c14)._m0[276].z;
    }
    float _220 = _212;
    float _222 = _220;
    if (_162)
    {
        _218 = (*spvDescriptorSet0.vp_c14)._m0[277].x;
    }
    float _224 = _218;
    float _226 = _196 + 1.2999999523162841796875;
    bool _228 = _76 == 240;
    float _230 = _224;
    if (_162)
    {
        _222 = (*spvDescriptorSet0.vp_c14)._m0[277].z;
    }
    float _232 = _222;
    float _234 = _232;
    if (_172)
    {
        _230 = (*spvDescriptorSet0.vp_c14)._m0[278].x;
    }
    float _236 = _230;
    float _238 = trunc(_226);
    int _240 = int(_238);
    bool _242 = _76 == 256;
    float _244 = _236;
    if (_172)
    {
        _234 = (*spvDescriptorSet0.vp_c14)._m0[278].z;
    }
    float _246 = _234;
    float _248 = _246;
    if (_182)
    {
        _244 = (*spvDescriptorSet0.vp_c14)._m0[279].x;
    }
    float _250 = _244;
    bool _252 = _76 == 272;
    float _254 = _250;
    if (_182)
    {
        _248 = (*spvDescriptorSet0.vp_c14)._m0[279].z;
    }
    float _256 = _248;
    float _258 = _256;
    if (_190)
    {
        _254 = (*spvDescriptorSet0.vp_c14)._m0[280].x;
    }
    float _260 = _254;
    bool _262 = _76 == 288;
    float _264 = _260;
    if (_190)
    {
        _258 = (*spvDescriptorSet0.vp_c14)._m0[280].z;
    }
    float _266 = _258;
    int _268 = min(_240, 15);
    bool _270 = _76 == 304;
    float _272 = _266;
    if (_206)
    {
        _264 = (*spvDescriptorSet0.vp_c14)._m0[281].x;
    }
    float _274 = _264;
    float _276 = float(_268);
    float _278 = _274;
    if (_206)
    {
        _272 = (*spvDescriptorSet0.vp_c14)._m0[281].z;
    }
    float _280 = _272;
    int _282 = _268 << 4;
    int _284 = _282 + 4288;
    float _286 = _280;
    if (_216)
    {
        _278 = (*spvDescriptorSet0.vp_c14)._m0[282].x;
    }
    float _288 = _278;
    bool _290 = _76 == 320;
    float _292 = -_276;
    float _294 = _292 + (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _296 = _288;
    if (_216)
    {
        _286 = (*spvDescriptorSet0.vp_c14)._m0[282].z;
    }
    float _298 = _286;
    float _300 = _298;
    if (_228)
    {
        _296 = (*spvDescriptorSet0.vp_c14)._m0[283].x;
    }
    float _302 = _296;
    float _304 = _294 + 1.0;
    bool _306 = _76 == 336;
    float _308 = _302;
    if (_228)
    {
        _300 = (*spvDescriptorSet0.vp_c14)._m0[283].z;
    }
    float _310 = _300;
    float _312 = _310;
    if (_242)
    {
        _308 = (*spvDescriptorSet0.vp_c14)._m0[284].x;
    }
    float _314 = _308;
    float _316 = exp2(_304);
    bool _318 = _76 == 352;
    float _320 = _314;
    if (_242)
    {
        _312 = (*spvDescriptorSet0.vp_c14)._m0[284].z;
    }
    float _322 = _312;
    float _324 = _322;
    if (_252)
    {
        _320 = (*spvDescriptorSet0.vp_c14)._m0[285].x;
    }
    float _326 = _320;
    bool _328 = _76 == 368;
    float _330 = _326;
    if (_252)
    {
        _324 = (*spvDescriptorSet0.vp_c14)._m0[285].z;
    }
    float _332 = _324;
    float _334 = _332;
    if (_262)
    {
        _330 = (*spvDescriptorSet0.vp_c14)._m0[286].x;
    }
    float _336 = _330;
    bool _338 = _76 == 384;
    float _340 = _336;
    if (_262)
    {
        _334 = (*spvDescriptorSet0.vp_c14)._m0[286].z;
    }
    float _342 = _334;
    float _344 = 1.0 / _316;
    float _346 = _342;
    if (_270)
    {
        _340 = (*spvDescriptorSet0.vp_c14)._m0[287].x;
    }
    float _348 = _340;
    bool _350 = _76 == 400;
    float _352 = _348;
    if (_270)
    {
        _346 = (*spvDescriptorSet0.vp_c14)._m0[287].z;
    }
    float _354 = _346;
    bool _356 = _76 == 416;
    float _358 = _354;
    if (_290)
    {
        _352 = (*spvDescriptorSet0.vp_c14)._m0[288].x;
    }
    float _360 = _352;
    float _362 = _360;
    if (_290)
    {
        _358 = (*spvDescriptorSet0.vp_c14)._m0[288].z;
    }
    float _364 = _358;
    float _366 = _364;
    if (_306)
    {
        _362 = (*spvDescriptorSet0.vp_c14)._m0[289].x;
    }
    float _368 = _362;
    bool _370 = _76 == 432;
    float _372 = _368;
    if (_306)
    {
        _366 = (*spvDescriptorSet0.vp_c14)._m0[289].z;
    }
    float _374 = _366;
    float _376 = _374;
    if (_318)
    {
        _372 = (*spvDescriptorSet0.vp_c14)._m0[290].x;
    }
    float _378 = _372;
    bool _380 = _76 == 448;
    float _382 = _378;
    if (_318)
    {
        _376 = (*spvDescriptorSet0.vp_c14)._m0[290].z;
    }
    float _384 = _376;
    float _386 = _384;
    if (_328)
    {
        _382 = (*spvDescriptorSet0.vp_c14)._m0[291].x;
    }
    float _388 = _382;
    bool _390 = _76 == 464;
    float _392 = _388;
    if (_328)
    {
        _386 = (*spvDescriptorSet0.vp_c14)._m0[291].z;
    }
    float _394 = _386;
    float _396 = _394;
    if (_338)
    {
        _392 = (*spvDescriptorSet0.vp_c14)._m0[292].x;
    }
    float _398 = _392;
    bool _400 = _76 == 480;
    float _402 = _398;
    if (_338)
    {
        _396 = (*spvDescriptorSet0.vp_c14)._m0[292].z;
    }
    float _404 = _396;
    float _406 = _404;
    if (_350)
    {
        _402 = (*spvDescriptorSet0.vp_c14)._m0[293].x;
    }
    float _408 = _402;
    bool _410 = _76 == 496;
    float _412 = _408;
    if (_350)
    {
        _406 = (*spvDescriptorSet0.vp_c14)._m0[293].z;
    }
    float _414 = _406;
    float _416 = _414;
    if (_356)
    {
        _412 = (*spvDescriptorSet0.vp_c14)._m0[294].x;
    }
    float _418 = _412;
    bool _420 = _76 == 512;
    float _422 = _418;
    if (_356)
    {
        _416 = (*spvDescriptorSet0.vp_c14)._m0[294].z;
    }
    float _424 = _416;
    bool _426 = _76 == 528;
    float _428 = _424;
    if (_370)
    {
        _422 = (*spvDescriptorSet0.vp_c14)._m0[295].x;
    }
    float _430 = _422;
    float _432 = _430;
    if (_370)
    {
        _428 = (*spvDescriptorSet0.vp_c14)._m0[295].z;
    }
    float _434 = _428;
    float _436 = _434;
    if (_380)
    {
        _432 = (*spvDescriptorSet0.vp_c14)._m0[296].x;
    }
    float _438 = _432;
    bool _440 = _76 == 544;
    float _442 = _438;
    if (_380)
    {
        _436 = (*spvDescriptorSet0.vp_c14)._m0[296].z;
    }
    float _444 = _436;
    float _446 = _444;
    if (_390)
    {
        _442 = (*spvDescriptorSet0.vp_c14)._m0[297].x;
    }
    float _448 = _442;
    bool _450 = _76 == 560;
    float _452 = _448;
    if (_390)
    {
        _446 = (*spvDescriptorSet0.vp_c14)._m0[297].z;
    }
    float _454 = _446;
    float _456 = _454;
    if (_400)
    {
        _452 = (*spvDescriptorSet0.vp_c14)._m0[298].x;
    }
    float _458 = _452;
    bool _460 = _76 == 576;
    float _462 = _458;
    if (_400)
    {
        _456 = (*spvDescriptorSet0.vp_c14)._m0[298].z;
    }
    float _464 = _456;
    float _466 = _464;
    if (_410)
    {
        _462 = (*spvDescriptorSet0.vp_c14)._m0[299].x;
    }
    float _468 = _462;
    bool _470 = _76 == 592;
    float _472 = _468;
    if (_410)
    {
        _466 = (*spvDescriptorSet0.vp_c14)._m0[299].z;
    }
    float _474 = _466;
    float _476 = _474;
    if (_420)
    {
        _472 = (*spvDescriptorSet0.vp_c14)._m0[300].x;
    }
    float _478 = _472;
    bool _480 = _76 == 608;
    float _482 = _478;
    if (_420)
    {
        _476 = (*spvDescriptorSet0.vp_c14)._m0[300].z;
    }
    float _484 = _476;
    float _486 = _484;
    if (_426)
    {
        _482 = (*spvDescriptorSet0.vp_c14)._m0[301].x;
    }
    float _488 = _482;
    bool _490 = _76 == 624;
    float _492 = _488;
    if (_426)
    {
        _486 = (*spvDescriptorSet0.vp_c14)._m0[301].z;
    }
    float _494 = _486;
    bool _496 = _76 == 640;
    float _498 = _494;
    if (_440)
    {
        _492 = (*spvDescriptorSet0.vp_c14)._m0[302].x;
    }
    float _500 = _492;
    float _502 = _500;
    if (_440)
    {
        _498 = (*spvDescriptorSet0.vp_c14)._m0[302].z;
    }
    float _504 = _498;
    float _506 = _504;
    if (_450)
    {
        _502 = (*spvDescriptorSet0.vp_c14)._m0[303].x;
    }
    float _508 = _502;
    bool _510 = _76 == 656;
    float _512 = _508;
    if (_450)
    {
        _506 = (*spvDescriptorSet0.vp_c14)._m0[303].z;
    }
    float _514 = _506;
    float _516 = _514;
    if (_460)
    {
        _512 = (*spvDescriptorSet0.vp_c14)._m0[304].x;
    }
    float _518 = _512;
    bool _520 = _76 == 672;
    float _522 = _518;
    if (_460)
    {
        _516 = (*spvDescriptorSet0.vp_c14)._m0[304].z;
    }
    float _524 = _516;
    float _526 = _524;
    if (_470)
    {
        _522 = (*spvDescriptorSet0.vp_c14)._m0[305].x;
    }
    float _528 = _522;
    bool _530 = _76 == 688;
    float _532 = _528;
    if (_470)
    {
        _526 = (*spvDescriptorSet0.vp_c14)._m0[305].z;
    }
    float _534 = _526;
    float _536 = _534;
    if (_480)
    {
        _532 = (*spvDescriptorSet0.vp_c14)._m0[306].x;
    }
    float _538 = _532;
    bool _540 = _76 == 704;
    float _542 = _538;
    if (_480)
    {
        _536 = (*spvDescriptorSet0.vp_c14)._m0[306].z;
    }
    float _544 = _536;
    float _546 = _544;
    if (_490)
    {
        _542 = (*spvDescriptorSet0.vp_c14)._m0[307].x;
    }
    float _548 = _542;
    bool _550 = _76 == 720;
    float _552 = _548;
    if (_490)
    {
        _546 = (*spvDescriptorSet0.vp_c14)._m0[307].z;
    }
    float _554 = _546;
    float _556 = _554;
    if (_496)
    {
        _552 = (*spvDescriptorSet0.vp_c14)._m0[308].x;
    }
    float _558 = _552;
    bool _560 = _76 == 736;
    float _562 = _558;
    if (_496)
    {
        _556 = (*spvDescriptorSet0.vp_c14)._m0[308].z;
    }
    float _564 = _556;
    bool _566 = _76 == 752;
    float _568 = _564;
    if (_510)
    {
        _562 = (*spvDescriptorSet0.vp_c14)._m0[309].x;
    }
    float _570 = _562;
    float _572 = _570;
    if (_520)
    {
        _572 = (*spvDescriptorSet0.vp_c14)._m0[310].x;
    }
    float _574 = _572;
    float _576 = _574;
    if (_530)
    {
        _576 = (*spvDescriptorSet0.vp_c14)._m0[311].x;
    }
    float _578 = _576;
    float _580 = _578;
    if (_540)
    {
        _580 = (*spvDescriptorSet0.vp_c14)._m0[312].x;
    }
    float _582 = _580;
    float _584 = _582;
    if (_550)
    {
        _584 = (*spvDescriptorSet0.vp_c14)._m0[313].x;
    }
    float _586 = _584;
    float _588 = _586;
    if (_560)
    {
        _588 = (*spvDescriptorSet0.vp_c14)._m0[314].x;
    }
    float _590 = _588;
    float _592 = _590;
    if (_566)
    {
        _592 = (*spvDescriptorSet0.vp_c14)._m0[315].x;
    }
    float _594 = _592;
    float _596 = _344 * _594;
    if (_510)
    {
        _568 = (*spvDescriptorSet0.vp_c14)._m0[309].z;
    }
    float _598 = _568;
    float _600 = _598;
    if (_520)
    {
        _600 = (*spvDescriptorSet0.vp_c14)._m0[310].z;
    }
    float _602 = _600;
    float _604 = _596 * _61;
    float _606 = _596 * _63;
    float _608 = _602;
    if (_530)
    {
        _608 = (*spvDescriptorSet0.vp_c14)._m0[311].z;
    }
    float _610 = _608;
    float _612 = floor(_604);
    float _614 = _610;
    if (_540)
    {
        _614 = (*spvDescriptorSet0.vp_c14)._m0[312].z;
    }
    float _616 = _614;
    float _618 = _616;
    if (_550)
    {
        _618 = (*spvDescriptorSet0.vp_c14)._m0[313].z;
    }
    float _620 = _618;
    float _622 = _620;
    if (_560)
    {
        _622 = (*spvDescriptorSet0.vp_c14)._m0[314].z;
    }
    float _624 = _622;
    float _626 = _624;
    if (_566)
    {
        _626 = (*spvDescriptorSet0.vp_c14)._m0[315].z;
    }
    float _628 = _626;
    float _630 = floor(_606);
    float _632 = _316 * _628;
    float _634 = -_612;
    float _636 = _604 + _634;
    float _638 = _636 * 2.0;
    float _640 = -_636;
    float _642 = fma(_632, _640, _61);
    int _644 = _284 + 8;
    uint _647 = uint(int(uint(_644) >> uint(2)));
    uint _649 = uint(int(uint(int(_647)) >> uint(2)));
    int _651 = int(_647) & 3;
    float _653 = (*spvDescriptorSet0.vp_c14)._m0[int(_649)][_651];
    int _655 = int(_647) + 1;
    uint _657 = uint(int(uint(_655) >> uint(2)));
    int _659 = _655 & 3;
    float _661 = (*spvDescriptorSet0.vp_c14)._m0[int(_657)][_659];
    float _663 = -_630;
    float _665 = _606 + _663;
    float _667 = floor(_638);
    float _669 = _665 * 2.0;
    float _671 = -_665;
    float _673 = fma(_632, _671, _63);
    float _675 = floor(_669);
    float _677 = _632 * _667;
    float _679 = _677 * 0.5;
    float _681 = _679 + _642;
    float _683 = fma(_67, _681, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _685 = _632 * _675;
    float _687 = _685 * 0.5;
    float _689 = fma(_74, _681, (*spvDescriptorSet0.vp_c15)._m0[3].z);
    float _691 = fma(_681, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _693 = _687 + _673;
    float _695 = -_683;
    float _697 = _695 + _689;
    float _699 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _701 = _691 + _699;
    float _703 = fma(_693, _697, _683);
    float _705 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _707 = _703 + _705;
    float _709 = fma(_693, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _711 = _707 * _707;
    float _713 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _715 = _709 + _713;
    float _717 = fma(_701, _701, _711);
    float _719 = fma(_715, _715, _717);
    float _721 = sqrt(_719);
    float _723 = -_661;
    float _725 = fma(_721, _653, _723);
    float _727 = precise::clamp(_725, 0.0, 1.0);
    float _729 = -_687;
    float _731 = fma(_729, _727, _693);
    float _733 = -_679;
    float _735 = fma(_733, _727, _681);
    float _737 = fma(_731, (*spvDescriptorSet0.vp_c15)._m0[6].x, (*spvDescriptorSet0.vp_c15)._m0[6].w);
    float _739 = fma(_735, (*spvDescriptorSet0.vp_c15)._m0[6].x, (*spvDescriptorSet0.vp_c15)._m0[6].z);
    float _741 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _737);
    float _743 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _739);
    float2 _2552 = float2(_743, _741);
    float _745 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2552, float2(0.0), isnan(_2552)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2552, float2(0.0), isnan(_2552)), level(0.0)).x;
    float _747 = fma(_731, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _749 = fma(_735, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _751 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _753 = _747 + _751;
    float _755 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _757 = _749 + _755;
    float _759 = fma(_735, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].z);
    float _761 = _753 * _753;
    float _763 = fma(_731, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].w);
    float _765 = fma(_757, _757, _761);
    float _767 = sqrt(_765);
    bool _769 = _767 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _771 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _773 = _767 + _771;
    float _775 = (*spvDescriptorSet0.vp_c15)._m0[4].x;
    float _777 = _767;
    float _779 = (*spvDescriptorSet0.vp_c15)._m0[6].x;
    float _781 = _765;
    if (_769)
    {
        float _783 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        _775 = _783;
    }
    float _785 = _775;
    float _787 = _785;
    float _789 = (*spvDescriptorSet0.vp_c14)._m0[0].y;
    if (_769)
    {
        float _791 = _773 * _785;
        _777 = _791;
    }
    float _793 = _777;
    if (_769)
    {
        float _795 = rsqrt(_765);
        _787 = _795;
    }
    float _797 = _787;
    float _799 = _797;
    if (_769)
    {
        float _801 = _793 * 0.15915493667125701904296875;
        _779 = _801;
    }
    float _803 = _779;
    float _805 = _793;
    if (_769)
    {
        float _807 = _803 * 6.283185482025146484375;
        float _809 = sin(_807);
        _805 = _809;
    }
    float _811 = _805;
    float _813 = _773;
    if (_769)
    {
        float _815 = _803 * 6.283185482025146484375;
        float _817 = cos(_815);
        _813 = _817;
    }
    float _819 = _813;
    float _821 = fma(_745, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    if (_769)
    {
        float _823 = _821 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        _789 = _823;
    }
    float _825 = _789;
    float _827 = _821 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _829 = _825;
    float _831 = _811;
    if (_769)
    {
        float _833 = fma(_811, _825, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        _829 = _833;
    }
    float _835 = _829;
    float _837 = _835;
    float _839 = _819;
    if (_769)
    {
        float _841 = _819 + (-1.0);
        _831 = _841;
    }
    float _843 = _831;
    float _845 = fma(_749, (*spvDescriptorSet0.vp_c4)._m0[2].x, _827);
    float _847 = 0.0;
    float _849 = _843;
    if (_769)
    {
        float _851 = _797 * _835;
        _847 = _851;
    }
    float _853 = _847;
    if (_769)
    {
        float _855 = _843 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        _781 = _855;
    }
    float _857 = _781;
    if (!_769)
    {
        _837 = _821;
    }
    float _859 = _837;
    float _861 = fma(_747, (*spvDescriptorSet0.vp_c4)._m0[2].z, _845);
    float _863 = _859;
    if (!_769)
    {
        _799 = _749;
    }
    float _865 = _799;
    float _867 = _865;
    if (_769)
    {
        float _869 = fma(_821, _819, _857);
        _863 = _869;
    }
    float _871 = _863;
    if (_769)
    {
        float _873 = fma(_757, _853, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        _867 = _873;
    }
    float _875 = _867;
    if (!_769)
    {
        _849 = _747;
    }
    float _877 = _849;
    float _879 = _877;
    if (_769)
    {
        float _881 = fma(_753, _853, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        _879 = _881;
    }
    float _883 = _879;
    float _885 = _871 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    if (_769)
    {
        float _887 = _871 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        _839 = _887;
    }
    float _889 = _839;
    float _891 = _871 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _893 = _861 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _895 = fma(_875, (*spvDescriptorSet0.vp_c4)._m0[1].x, _885);
    float _897 = _889;
    float _899 = _891;
    if (_769)
    {
        float _901 = fma(_875, (*spvDescriptorSet0.vp_c4)._m0[2].x, _889);
        _897 = _901;
    }
    float _903 = _897;
    float _905 = fma(_875, (*spvDescriptorSet0.vp_c4)._m0[0].x, _891);
    float _907 = fma(_883, (*spvDescriptorSet0.vp_c4)._m0[1].z, _895);
    float _909 = _903;
    if (_769)
    {
        float _911 = fma(_883, (*spvDescriptorSet0.vp_c4)._m0[2].z, _903);
        _909 = _911;
    }
    float _913 = _909;
    float _915 = fma(_883, (*spvDescriptorSet0.vp_c4)._m0[0].z, _905);
    int _917 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[40].w) & 2;
    bool _919 = _917 != 0;
    float _921 = _907 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    if (!_769)
    {
        _899 = _893;
    }
    float _923 = _899;
    float _925 = _915 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _927 = _923;
    if (_769)
    {
        float _929 = _913 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _927 = _929;
    }
    float _931 = _927;
    float _933 = _921 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _935 = _921 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _937 = _921 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _939 = _921 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _941 = fma(_925, (*spvDescriptorSet0.vp_c4)._m0[7].x, _933);
    float _943 = fma(_925, (*spvDescriptorSet0.vp_c4)._m0[8].x, _935);
    float _945 = fma(_925, (*spvDescriptorSet0.vp_c4)._m0[9].x, _937);
    float _947 = fma(_925, (*spvDescriptorSet0.vp_c4)._m0[10].x, _939);
    float _949 = fma(_931, (*spvDescriptorSet0.vp_c4)._m0[7].z, _941);
    float _951 = fma(_931, (*spvDescriptorSet0.vp_c4)._m0[8].z, _943);
    float _953 = fma(_931, (*spvDescriptorSet0.vp_c4)._m0[9].z, _945);
    float _955 = fma(_931, (*spvDescriptorSet0.vp_c4)._m0[10].z, _947);
    float _957 = _949 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _959 = _951 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _961 = _953 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _963 = _955 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    bool _965 = !_919;
    float _967;
    float _969;
    float _971;
    int _973;
    int _975;
    int _977;
    int _979;
    int _981;
    int _983;
    int _985;
    int _987;
    float _989;
    float _991;
    float _993;
    float _995;
    float _997;
    float _999;
    float _1001;
    float _1003;
    float _1005;
    float _1007;
    float _1009;
    float _1011;
    float _1013;
    float _1015;
    float _1017;
    float _1019;
    float _1021;
    float _1023;
    int _1025;
    float _1027;
    float _1029;
    if (!_965)
    {
        _967 = (*spvDescriptorSet0.vp_c9)._m0[919].z;
        _969 = (*spvDescriptorSet0.vp_c9)._m0[919].x;
        _971 = (*spvDescriptorSet0.vp_c9)._m0[919].y;
        _973 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[919].w);
        _975 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].x);
        _977 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].y);
        _979 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].z);
        _981 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].w);
        _983 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].x);
        _985 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].y);
        _987 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].w);
        _989 = (*spvDescriptorSet0.vp_c9)._m0[922].y;
        _991 = (*spvDescriptorSet0.vp_c9)._m0[923].y;
        _993 = (*spvDescriptorSet0.vp_c9)._m0[916].w;
        _995 = (*spvDescriptorSet0.vp_c9)._m0[917].x;
        _997 = (*spvDescriptorSet0.vp_c9)._m0[922].x;
        _999 = (*spvDescriptorSet0.vp_c9)._m0[923].x;
        _1001 = (*spvDescriptorSet0.vp_c9)._m0[916].x;
        _1003 = (*spvDescriptorSet0.vp_c9)._m0[917].y;
        _1005 = (*spvDescriptorSet0.vp_c9)._m0[922].z;
        _1007 = (*spvDescriptorSet0.vp_c9)._m0[923].z;
        _1009 = (*spvDescriptorSet0.vp_c9)._m0[917].z;
        _1011 = (*spvDescriptorSet0.vp_c9)._m0[916].y;
        _1013 = (*spvDescriptorSet0.vp_c9)._m0[922].w;
        _1015 = (*spvDescriptorSet0.vp_c9)._m0[923].w;
        _1017 = (*spvDescriptorSet0.vp_c9)._m0[916].z;
        _1019 = (*spvDescriptorSet0.vp_c9)._m0[918].y;
        _1021 = (*spvDescriptorSet0.vp_c9)._m0[917].w;
        _1023 = (*spvDescriptorSet0.vp_c9)._m0[918].x;
        _1025 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].z);
        _1027 = (*spvDescriptorSet0.vp_c9)._m0[918].z;
        _1029 = (*spvDescriptorSet0.vp_c9)._m0[918].w;
        _1031 = true;
    }
    else
    {
        float _1033 = fma(_749, 6.2500002968590706586837768554688e-05, 0.5);
        float _1035 = fma(_747, 6.2500002968590706586837768554688e-05, 0.5);
        float3 _3065 = float3(_1033, _1035, float(0));
        float3 _3069 = select(_3065, float3(0.0), isnan(_3065));
        float4 _1038 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _3069.xy, uint(rint(_3069.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _3069.xy, uint(rint(_3069.z)), level(0.0)).xyzw;
        float _1040 = _1038.x;
        float _1042 = _1038.y;
        float _1044 = _1038.z;
        float _1046 = _1038.w;
        float3 _3084 = float3(_1033, _1035, float(1));
        float3 _3086 = select(_3084, float3(0.0), isnan(_3084));
        float4 _1048 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _3086.xy, uint(rint(_3086.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _3086.xy, uint(rint(_3086.z)), level(0.0)).xyzw;
        float _1050 = _1048.x;
        float _1052 = _1048.y;
        float _1054 = _1048.z;
        float _1056 = _1048.w;
        float3 _3101 = float3(_1033, _1035, float(2));
        float3 _3103 = select(_3101, float3(0.0), isnan(_3101));
        float4 _1058 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _3103.xy, uint(rint(_3103.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _3103.xy, uint(rint(_3103.z)), level(0.0)).xyzw;
        float _1060 = _1058.x;
        float _1062 = _1058.y;
        float _1064 = _1058.z;
        float _1066 = _1058.w;
        float3 _3118 = float3(_1033, _1035, float(3));
        float3 _3120 = select(_3118, float3(0.0), isnan(_3118));
        float4 _1068 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _3120.xy, uint(rint(_3120.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _3120.xy, uint(rint(_3120.z)), level(0.0)).xyzw;
        float _1070 = _1068.x;
        float _1072 = _1068.y;
        float _1074 = _1068.z;
        float _1076 = _1068.w;
        float3 _3135 = float3(_1033, _1035, float(4));
        float3 _3137 = select(_3135, float3(0.0), isnan(_3135));
        float4 _1078 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _3137.xy, uint(rint(_3137.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _3137.xy, uint(rint(_3137.z)), level(0.0)).xyzw;
        float _1080 = _1078.x;
        float _1082 = _1078.y;
        float _1084 = _1078.z;
        float _1086 = _1078.w;
        float3 _3153 = float3(_1033, _1035, float(5));
        float3 _3155 = select(_3153, float3(0.0), isnan(_3153));
        float4 _1088 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _3155.xy, uint(rint(_3155.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _3155.xy, uint(rint(_3155.z)), level(0.0)).xyzw;
        float _1090 = _1088.x;
        float _1092 = _1088.y;
        float _1094 = _1088.z;
        float _1096 = _1088.w;
        float3 _3170 = float3(_1033, _1035, float(6));
        float3 _3172 = select(_3170, float3(0.0), isnan(_3170));
        float4 _1098 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _3172.xy, uint(rint(_3172.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _3172.xy, uint(rint(_3172.z)), level(0.0)).xyzw;
        float _1100 = _1098.x;
        float _1102 = _1098.y;
        float _1104 = _1098.z;
        float _1106 = _1098.w;
        float3 _3187 = float3(_1033, _1035, float(7));
        float3 _3189 = select(_3187, float3(0.0), isnan(_3187));
        float4 _1108 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _3189.xy, uint(rint(_3189.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _3189.xy, uint(rint(_3189.z)), level(0.0)).xyzw;
        float _1110 = _1108.x;
        float _1112 = _1108.y;
        float _1114 = _1108.z;
        float _1116 = _1108.w;
        _967 = _1074;
        _969 = _1070;
        _971 = _1072;
        _973 = as_type<int>(_1076);
        _975 = as_type<int>(_1080);
        _977 = as_type<int>(_1082);
        _979 = as_type<int>(_1084);
        _981 = as_type<int>(_1086);
        _983 = as_type<int>(_1090);
        _985 = as_type<int>(_1092);
        _987 = as_type<int>(_1096);
        _989 = _1102;
        _991 = _1112;
        _993 = _1046;
        _995 = _1050;
        _997 = _1100;
        _999 = _1110;
        _1001 = _1040;
        _1003 = _1052;
        _1005 = _1104;
        _1007 = _1114;
        _1009 = _1054;
        _1011 = _1042;
        _1013 = _1106;
        _1015 = _1116;
        _1017 = _1044;
        _1019 = _1062;
        _1021 = _1056;
        _1023 = _1060;
        _1025 = as_type<int>(_1094);
        _1027 = _1064;
        _1029 = _1066;
    }
    _1031 = false;
    float _1118 = _967;
    float _1120 = _969;
    float _1122 = _971;
    int _1124 = _973;
    int _1126 = _975;
    int _1128 = _977;
    int _1130 = _979;
    int _1132 = _981;
    int _1134 = _983;
    int _1136 = _985;
    int _1138 = _987;
    float _1140 = _989;
    float _1142 = _991;
    float _1144 = _993;
    float _1146 = _995;
    float _1148 = _997;
    float _1150 = _999;
    float _1152 = _1001;
    float _1154 = _1003;
    float _1156 = _1005;
    float _1158 = _1007;
    float _1160 = _1009;
    float _1162 = _1011;
    float _1164 = _1013;
    float _1166 = _1015;
    float _1168 = _1017;
    float _1170 = _1019;
    float _1172 = _1021;
    float _1174 = _1023;
    int _1176 = _1025;
    float _1178 = _1027;
    float _1180 = _1029;
    float _1182 = -(*spvDescriptorSet0.vp_c4)._m0[12].w;
    float _1184 = _821 + _1182;
    float _1186 = -(*spvDescriptorSet0.vp_c4)._m0[11].w;
    float _1188 = _749 + _1186;
    float _1190 = -(*spvDescriptorSet0.vp_c4)._m0[13].w;
    float _1192 = _747 + _1190;
    float _1194 = _1118 * 0.88622701168060302734375;
    float _1196 = _1184 * _1184;
    float _1198 = _1120 * 0.88622701168060302734375;
    float _1200 = _1122 * 0.88622701168060302734375;
    float _1202 = _919 ? as_type<float>(_1124) : 0.0;
    float _1204 = fma(_1188, _1188, _1196);
    float _1206 = _919 ? as_type<float>(_1126) : 0.0;
    out.gl_Position.x = _957;
    out.gl_Position.y = _959;
    out.gl_Position.z = _961;
    out.gl_Position.w = _963;
    float _1208 = _919 ? as_type<float>(_1128) : 0.0;
    float _1210 = fma(_1192, _1192, _1204);
    float _1212 = _919 ? _1198 : 0.0;
    out.m_43.x = _749;
    out.m_43.y = _821;
    out.m_43.z = _747;
    float _1214 = _919 ? _1200 : 0.0;
    float _1216 = _919 ? _1194 : 0.0;
    float _1218 = rsqrt(_1210);
    float _1220 = _919 ? as_type<float>(_1130) : 0.0;
    out.m_45.z = _759;
    out.m_45.w = _763;
    float _1222 = _919 ? as_type<float>(_1132) : 0.0;
    float _1224 = _919 ? as_type<float>(_1134) : 0.0;
    float _1226 = _919 ? as_type<float>(_1136) : 0.0;
    float _1228 = _919 ? as_type<float>(_1138) : 0.0;
    float _1230 = _1218 * 1.02332699298858642578125;
    float _1232 = _1192 * _1218;
    float _1234 = _1184 * _1230;
    float _1236 = _1232 * (-1.02332699298858642578125);
    float _1238 = _1188 * _1230;
    float _1240 = _1234 * _1140;
    float _1242 = _1234 * _1142;
    float _1244 = _1234 * _1144;
    float _1246 = _1234 * _1146;
    float _1248 = fma(_1148, 0.88622701168060302734375, _1240);
    float _1250 = fma(_1150, 0.88622701168060302734375, _1242);
    float _1252 = fma(_1152, 0.88622701168060302734375, _1244);
    float _1254 = _1234 * _1154;
    float _1256 = fma(_1236, _1156, _1248);
    float _1258 = fma(_1236, _1158, _1250);
    float _1260 = fma(_1236, _1160, _1252);
    float _1262 = fma(_1162, 0.88622701168060302734375, _1246);
    float _1264 = fma(_1238, _1164, _1256);
    float _1266 = fma(_1238, _1166, _1258);
    float _1268 = fma(_1168, 0.88622701168060302734375, _1254);
    float _1270 = fma(_1202, _1234, _1212);
    float _1272 = fma(_1206, _1234, _1214);
    float _1274 = precise::max(0.0, _1264);
    float _1276 = fma(_1208, _1234, _1216);
    float _1278 = precise::max(0.0, _1266);
    float _1280 = fma(_1238, _1170, _1260);
    float _1282 = fma(_1236, _1172, _1262);
    float _1284 = _1274 * 0.31830990314483642578125;
    float _1286 = precise::clamp(_1284, 0.0, 1.0);
    float _1288 = fma(_1236, _1174, _1268);
    float _1290 = fma(_1220, _1236, _1270);
    float _1292 = fma(_1222, _1236, _1272);
    float _1294 = _1286 * 0.88622701168060302734375;
    float _1296 = fma(_1224, _1236, _1276);
    float _1298 = _1278 * 0.31830990314483642578125;
    float _1300 = precise::clamp(_1298, 0.0, 1.0);
    float _1302 = _919 ? as_type<float>(_1176) : 0.0;
    float _1304 = fma(_1238, _1178, _1282);
    float _1306 = precise::max(0.0, _1280);
    float _1308 = _1294 * (*spvDescriptorSet0.vp_c9)._m0[991].x;
    float _1310 = fma(_1238, _1180, _1288);
    float _1312 = -_1300;
    float _1314 = _1312 + 1.0;
    float _1316 = fma(_1302, _1238, _1292);
    float _1318 = fma(_1226, _1238, _1290);
    float _1320 = fma(_1228, _1238, _1296);
    float _1322 = fma(_1306, (*spvDescriptorSet0.vp_c9)._m0[68].x, _1308);
    float _1324 = precise::max(0.0, _1304);
    float _1326 = fma(_1314, (*spvDescriptorSet0.vp_c9)._m0[37].y, _1300);
    float _1328 = _1294 * (*spvDescriptorSet0.vp_c9)._m0[991].y;
    float _1330 = precise::max(0.0, _1310);
    float _1332 = _1294 * (*spvDescriptorSet0.vp_c9)._m0[991].z;
    float _1334 = precise::max(0.0, _1316);
    float _1336 = _1326 * (*spvDescriptorSet0.vp_c9)._m0[40].z;
    float _1338 = precise::max(0.0, _1318);
    float _1340 = fma(_1324, (*spvDescriptorSet0.vp_c9)._m0[68].y, _1328);
    float _1342 = precise::max(0.0, _1320);
    float _1344 = fma(_1330, (*spvDescriptorSet0.vp_c9)._m0[68].z, _1332);
    float _1346 = fma(_1334, _1336, _1340);
    float _1348 = fma(_1338, _1336, _1322);
    float _1350 = fma(_1342, _1336, _1344);
    out.m_47.x = _1348;
    out.m_47.y = _1346;
    out.m_47.z = _1350;
    out.m_47.w = _893;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

