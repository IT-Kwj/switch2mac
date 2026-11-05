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
    float4 m_43 [[user(locn5)]];
    float4 m_47 [[user(locn6)]];
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
    bool _883 = false;
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
    float2 _2404 = float2(_743, _741);
    float _745 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2404, float2(0.0), isnan(_2404)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2404, float2(0.0), isnan(_2404)), level(0.0)).x;
    float _747 = fma(_735, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _749 = fma(_731, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _751 = fma(_735, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].z);
    float _753 = fma(_731, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].w);
    int _755 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[40].w) & 2;
    bool _757 = _755 != 0;
    float _759 = fma(_745, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _761 = _759 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _763 = _759 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _765 = _759 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _767 = fma(_747, (*spvDescriptorSet0.vp_c4)._m0[1].x, _761);
    float _769 = fma(_747, (*spvDescriptorSet0.vp_c4)._m0[0].x, _763);
    float _771 = fma(_747, (*spvDescriptorSet0.vp_c4)._m0[2].x, _765);
    float _773 = fma(_749, (*spvDescriptorSet0.vp_c4)._m0[1].z, _767);
    float _775 = fma(_749, (*spvDescriptorSet0.vp_c4)._m0[0].z, _769);
    float _777 = fma(_749, (*spvDescriptorSet0.vp_c4)._m0[2].z, _771);
    float _779 = _773 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _781 = _775 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _783 = _777 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _785 = _779 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _787 = _779 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _789 = _779 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _791 = _779 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _793 = fma(_781, (*spvDescriptorSet0.vp_c4)._m0[7].x, _785);
    float _795 = fma(_781, (*spvDescriptorSet0.vp_c4)._m0[8].x, _787);
    float _797 = fma(_781, (*spvDescriptorSet0.vp_c4)._m0[9].x, _789);
    float _799 = fma(_781, (*spvDescriptorSet0.vp_c4)._m0[10].x, _791);
    float _801 = fma(_783, (*spvDescriptorSet0.vp_c4)._m0[7].z, _793);
    float _803 = fma(_783, (*spvDescriptorSet0.vp_c4)._m0[8].z, _795);
    float _805 = fma(_783, (*spvDescriptorSet0.vp_c4)._m0[9].z, _797);
    float _807 = fma(_783, (*spvDescriptorSet0.vp_c4)._m0[10].z, _799);
    float _809 = _801 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _811 = _803 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _813 = _805 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _815 = _807 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    bool _817 = !_757;
    float _819;
    float _821;
    float _823;
    int _825;
    int _827;
    int _829;
    int _831;
    int _833;
    int _835;
    int _837;
    int _839;
    float _841;
    float _843;
    float _845;
    float _847;
    float _849;
    float _851;
    float _853;
    float _855;
    float _857;
    float _859;
    float _861;
    float _863;
    float _865;
    float _867;
    float _869;
    float _871;
    float _873;
    float _875;
    int _877;
    float _879;
    float _881;
    if (!_817)
    {
        _819 = (*spvDescriptorSet0.vp_c9)._m0[919].z;
        _821 = (*spvDescriptorSet0.vp_c9)._m0[919].x;
        _823 = (*spvDescriptorSet0.vp_c9)._m0[919].y;
        _825 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[919].w);
        _827 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].x);
        _829 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].y);
        _831 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].z);
        _833 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].w);
        _835 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].x);
        _837 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].y);
        _839 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].w);
        _841 = (*spvDescriptorSet0.vp_c9)._m0[922].y;
        _843 = (*spvDescriptorSet0.vp_c9)._m0[923].y;
        _845 = (*spvDescriptorSet0.vp_c9)._m0[916].w;
        _847 = (*spvDescriptorSet0.vp_c9)._m0[917].x;
        _849 = (*spvDescriptorSet0.vp_c9)._m0[922].x;
        _851 = (*spvDescriptorSet0.vp_c9)._m0[923].x;
        _853 = (*spvDescriptorSet0.vp_c9)._m0[916].x;
        _855 = (*spvDescriptorSet0.vp_c9)._m0[917].y;
        _857 = (*spvDescriptorSet0.vp_c9)._m0[922].z;
        _859 = (*spvDescriptorSet0.vp_c9)._m0[923].z;
        _861 = (*spvDescriptorSet0.vp_c9)._m0[917].z;
        _863 = (*spvDescriptorSet0.vp_c9)._m0[916].y;
        _865 = (*spvDescriptorSet0.vp_c9)._m0[922].w;
        _867 = (*spvDescriptorSet0.vp_c9)._m0[923].w;
        _869 = (*spvDescriptorSet0.vp_c9)._m0[916].z;
        _871 = (*spvDescriptorSet0.vp_c9)._m0[918].y;
        _873 = (*spvDescriptorSet0.vp_c9)._m0[917].w;
        _875 = (*spvDescriptorSet0.vp_c9)._m0[918].x;
        _877 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].z);
        _879 = (*spvDescriptorSet0.vp_c9)._m0[918].z;
        _881 = (*spvDescriptorSet0.vp_c9)._m0[918].w;
        _883 = true;
    }
    else
    {
        float _885 = fma(_747, 6.2500002968590706586837768554688e-05, 0.5);
        float _887 = fma(_749, 6.2500002968590706586837768554688e-05, 0.5);
        float3 _2675 = float3(_885, _887, float(0));
        float3 _2679 = select(_2675, float3(0.0), isnan(_2675));
        float4 _890 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _2679.xy, uint(rint(_2679.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _2679.xy, uint(rint(_2679.z)), level(0.0)).xyzw;
        float _892 = _890.x;
        float _894 = _890.y;
        float _896 = _890.z;
        float _898 = _890.w;
        float3 _2694 = float3(_885, _887, float(1));
        float3 _2696 = select(_2694, float3(0.0), isnan(_2694));
        float4 _900 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _2696.xy, uint(rint(_2696.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _2696.xy, uint(rint(_2696.z)), level(0.0)).xyzw;
        float _902 = _900.x;
        float _904 = _900.y;
        float _906 = _900.z;
        float _908 = _900.w;
        float3 _2711 = float3(_885, _887, float(2));
        float3 _2713 = select(_2711, float3(0.0), isnan(_2711));
        float4 _910 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _2713.xy, uint(rint(_2713.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _2713.xy, uint(rint(_2713.z)), level(0.0)).xyzw;
        float _912 = _910.x;
        float _914 = _910.y;
        float _916 = _910.z;
        float _918 = _910.w;
        float3 _2728 = float3(_885, _887, float(3));
        float3 _2730 = select(_2728, float3(0.0), isnan(_2728));
        float4 _920 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _2730.xy, uint(rint(_2730.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _2730.xy, uint(rint(_2730.z)), level(0.0)).xyzw;
        float _922 = _920.x;
        float _924 = _920.y;
        float _926 = _920.z;
        float _928 = _920.w;
        float3 _2745 = float3(_885, _887, float(4));
        float3 _2747 = select(_2745, float3(0.0), isnan(_2745));
        float4 _930 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _2747.xy, uint(rint(_2747.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _2747.xy, uint(rint(_2747.z)), level(0.0)).xyzw;
        float _932 = _930.x;
        float _934 = _930.y;
        float _936 = _930.z;
        float _938 = _930.w;
        float3 _2763 = float3(_885, _887, float(5));
        float3 _2765 = select(_2763, float3(0.0), isnan(_2763));
        float4 _940 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _2765.xy, uint(rint(_2765.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _2765.xy, uint(rint(_2765.z)), level(0.0)).xyzw;
        float _942 = _940.x;
        float _944 = _940.y;
        float _946 = _940.z;
        float _948 = _940.w;
        float3 _2780 = float3(_885, _887, float(6));
        float3 _2782 = select(_2780, float3(0.0), isnan(_2780));
        float4 _950 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _2782.xy, uint(rint(_2782.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _2782.xy, uint(rint(_2782.z)), level(0.0)).xyzw;
        float _952 = _950.x;
        float _954 = _950.y;
        float _956 = _950.z;
        float _958 = _950.w;
        float3 _2797 = float3(_885, _887, float(7));
        float3 _2799 = select(_2797, float3(0.0), isnan(_2797));
        float4 _960 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _2799.xy, uint(rint(_2799.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _2799.xy, uint(rint(_2799.z)), level(0.0)).xyzw;
        float _962 = _960.x;
        float _964 = _960.y;
        float _966 = _960.z;
        float _968 = _960.w;
        _819 = _926;
        _821 = _922;
        _823 = _924;
        _825 = as_type<int>(_928);
        _827 = as_type<int>(_932);
        _829 = as_type<int>(_934);
        _831 = as_type<int>(_936);
        _833 = as_type<int>(_938);
        _835 = as_type<int>(_942);
        _837 = as_type<int>(_944);
        _839 = as_type<int>(_948);
        _841 = _954;
        _843 = _964;
        _845 = _898;
        _847 = _902;
        _849 = _952;
        _851 = _962;
        _853 = _892;
        _855 = _904;
        _857 = _956;
        _859 = _966;
        _861 = _906;
        _863 = _894;
        _865 = _958;
        _867 = _968;
        _869 = _896;
        _871 = _914;
        _873 = _908;
        _875 = _912;
        _877 = as_type<int>(_946);
        _879 = _916;
        _881 = _918;
    }
    _883 = false;
    float _970 = _819;
    float _972 = _821;
    float _974 = _823;
    int _976 = _825;
    int _978 = _827;
    int _980 = _829;
    int _982 = _831;
    int _984 = _833;
    int _986 = _835;
    int _988 = _837;
    int _990 = _839;
    float _992 = _841;
    float _994 = _843;
    float _996 = _845;
    float _998 = _847;
    float _1000 = _849;
    float _1002 = _851;
    float _1004 = _853;
    float _1006 = _855;
    float _1008 = _857;
    float _1010 = _859;
    float _1012 = _861;
    float _1014 = _863;
    float _1016 = _865;
    float _1018 = _867;
    float _1020 = _869;
    float _1022 = _871;
    float _1024 = _873;
    float _1026 = _875;
    int _1028 = _877;
    float _1030 = _879;
    float _1032 = _881;
    float _1034 = -(*spvDescriptorSet0.vp_c4)._m0[12].w;
    float _1036 = _759 + _1034;
    float _1038 = -(*spvDescriptorSet0.vp_c4)._m0[11].w;
    float _1040 = _747 + _1038;
    float _1042 = -(*spvDescriptorSet0.vp_c4)._m0[13].w;
    float _1044 = _749 + _1042;
    float _1046 = _970 * 0.88622701168060302734375;
    float _1048 = _1036 * _1036;
    float _1050 = _972 * 0.88622701168060302734375;
    float _1052 = _974 * 0.88622701168060302734375;
    float _1054 = _757 ? as_type<float>(_976) : 0.0;
    float _1056 = fma(_1040, _1040, _1048);
    float _1058 = _757 ? as_type<float>(_978) : 0.0;
    out.gl_Position.x = _809;
    out.gl_Position.y = _811;
    out.gl_Position.z = _813;
    out.gl_Position.w = _815;
    float _1060 = _757 ? as_type<float>(_980) : 0.0;
    float _1062 = fma(_1044, _1044, _1056);
    float _1064 = _757 ? _1050 : 0.0;
    out.m_43.x = _747;
    out.m_43.y = _759;
    out.m_43.z = _749;
    float _1066 = _757 ? _1052 : 0.0;
    float _1068 = _757 ? _1046 : 0.0;
    float _1070 = rsqrt(_1062);
    float _1072 = _757 ? as_type<float>(_982) : 0.0;
    out.m_45.z = _751;
    out.m_45.w = _753;
    float _1074 = _757 ? as_type<float>(_984) : 0.0;
    float _1076 = _757 ? as_type<float>(_986) : 0.0;
    float _1078 = _757 ? as_type<float>(_988) : 0.0;
    float _1080 = _757 ? as_type<float>(_990) : 0.0;
    float _1082 = _1070 * 1.02332699298858642578125;
    float _1084 = _1044 * _1070;
    float _1086 = _1036 * _1082;
    float _1088 = _1084 * (-1.02332699298858642578125);
    float _1090 = _1040 * _1082;
    float _1092 = _1086 * _992;
    float _1094 = _1086 * _994;
    float _1096 = _1086 * _996;
    float _1098 = _1086 * _998;
    float _1100 = fma(_1000, 0.88622701168060302734375, _1092);
    float _1102 = fma(_1002, 0.88622701168060302734375, _1094);
    float _1104 = fma(_1004, 0.88622701168060302734375, _1096);
    float _1106 = _1086 * _1006;
    float _1108 = fma(_1088, _1008, _1100);
    float _1110 = fma(_1088, _1010, _1102);
    float _1112 = fma(_1088, _1012, _1104);
    float _1114 = fma(_1014, 0.88622701168060302734375, _1098);
    float _1116 = fma(_1090, _1016, _1108);
    float _1118 = fma(_1090, _1018, _1110);
    float _1120 = fma(_1020, 0.88622701168060302734375, _1106);
    float _1122 = fma(_1054, _1086, _1064);
    float _1124 = fma(_1058, _1086, _1066);
    float _1126 = precise::max(0.0, _1116);
    float _1128 = fma(_1060, _1086, _1068);
    float _1130 = precise::max(0.0, _1118);
    float _1132 = fma(_1090, _1022, _1112);
    float _1134 = fma(_1088, _1024, _1114);
    float _1136 = _1126 * 0.31830990314483642578125;
    float _1138 = precise::clamp(_1136, 0.0, 1.0);
    float _1140 = fma(_1088, _1026, _1120);
    float _1142 = fma(_1072, _1088, _1122);
    float _1144 = fma(_1074, _1088, _1124);
    float _1146 = _1138 * 0.88622701168060302734375;
    float _1148 = fma(_1076, _1088, _1128);
    float _1150 = _1130 * 0.31830990314483642578125;
    float _1152 = precise::clamp(_1150, 0.0, 1.0);
    float _1154 = _757 ? as_type<float>(_1028) : 0.0;
    float _1156 = fma(_1090, _1030, _1134);
    float _1158 = precise::max(0.0, _1132);
    float _1160 = _1146 * (*spvDescriptorSet0.vp_c9)._m0[991].x;
    float _1162 = fma(_1090, _1032, _1140);
    float _1164 = -_1152;
    float _1166 = _1164 + 1.0;
    float _1168 = fma(_1154, _1090, _1144);
    float _1170 = fma(_1078, _1090, _1142);
    float _1172 = fma(_1080, _1090, _1148);
    float _1174 = fma(_1158, (*spvDescriptorSet0.vp_c9)._m0[68].x, _1160);
    float _1176 = precise::max(0.0, _1156);
    float _1178 = fma(_1166, (*spvDescriptorSet0.vp_c9)._m0[37].y, _1152);
    float _1180 = _1146 * (*spvDescriptorSet0.vp_c9)._m0[991].y;
    float _1182 = precise::max(0.0, _1162);
    float _1184 = _1146 * (*spvDescriptorSet0.vp_c9)._m0[991].z;
    float _1186 = precise::max(0.0, _1168);
    float _1188 = _1178 * (*spvDescriptorSet0.vp_c9)._m0[40].z;
    float _1190 = precise::max(0.0, _1170);
    float _1192 = fma(_1176, (*spvDescriptorSet0.vp_c9)._m0[68].y, _1180);
    float _1194 = precise::max(0.0, _1172);
    float _1196 = fma(_1182, (*spvDescriptorSet0.vp_c9)._m0[68].z, _1184);
    float _1198 = fma(_1186, _1188, _1192);
    float _1200 = fma(_1190, _1188, _1174);
    float _1202 = fma(_1194, _1188, _1196);
    out.m_47.x = _1200;
    out.m_47.y = _1198;
    out.m_47.z = _1202;
    out.m_47.w = _783;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_BaseInstance [[base_instance]])
{
    main0_out out = {};
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    bool _883 = false;
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
    float2 _2404 = float2(_743, _741);
    float _745 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2404, float2(0.0), isnan(_2404)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2404, float2(0.0), isnan(_2404)), level(0.0)).x;
    float _747 = fma(_735, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _749 = fma(_731, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _751 = fma(_735, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].z);
    float _753 = fma(_731, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].w);
    int _755 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[40].w) & 2;
    bool _757 = _755 != 0;
    float _759 = fma(_745, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _761 = _759 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _763 = _759 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _765 = _759 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _767 = fma(_747, (*spvDescriptorSet0.vp_c4)._m0[1].x, _761);
    float _769 = fma(_747, (*spvDescriptorSet0.vp_c4)._m0[0].x, _763);
    float _771 = fma(_747, (*spvDescriptorSet0.vp_c4)._m0[2].x, _765);
    float _773 = fma(_749, (*spvDescriptorSet0.vp_c4)._m0[1].z, _767);
    float _775 = fma(_749, (*spvDescriptorSet0.vp_c4)._m0[0].z, _769);
    float _777 = fma(_749, (*spvDescriptorSet0.vp_c4)._m0[2].z, _771);
    float _779 = _773 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _781 = _775 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _783 = _777 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _785 = _779 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _787 = _779 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _789 = _779 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _791 = _779 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _793 = fma(_781, (*spvDescriptorSet0.vp_c4)._m0[7].x, _785);
    float _795 = fma(_781, (*spvDescriptorSet0.vp_c4)._m0[8].x, _787);
    float _797 = fma(_781, (*spvDescriptorSet0.vp_c4)._m0[9].x, _789);
    float _799 = fma(_781, (*spvDescriptorSet0.vp_c4)._m0[10].x, _791);
    float _801 = fma(_783, (*spvDescriptorSet0.vp_c4)._m0[7].z, _793);
    float _803 = fma(_783, (*spvDescriptorSet0.vp_c4)._m0[8].z, _795);
    float _805 = fma(_783, (*spvDescriptorSet0.vp_c4)._m0[9].z, _797);
    float _807 = fma(_783, (*spvDescriptorSet0.vp_c4)._m0[10].z, _799);
    float _809 = _801 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _811 = _803 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _813 = _805 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _815 = _807 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    bool _817 = !_757;
    float _819;
    float _821;
    float _823;
    int _825;
    int _827;
    int _829;
    int _831;
    int _833;
    int _835;
    int _837;
    int _839;
    float _841;
    float _843;
    float _845;
    float _847;
    float _849;
    float _851;
    float _853;
    float _855;
    float _857;
    float _859;
    float _861;
    float _863;
    float _865;
    float _867;
    float _869;
    float _871;
    float _873;
    float _875;
    int _877;
    float _879;
    float _881;
    if (!_817)
    {
        _819 = (*spvDescriptorSet0.vp_c9)._m0[919].z;
        _821 = (*spvDescriptorSet0.vp_c9)._m0[919].x;
        _823 = (*spvDescriptorSet0.vp_c9)._m0[919].y;
        _825 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[919].w);
        _827 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].x);
        _829 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].y);
        _831 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].z);
        _833 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].w);
        _835 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].x);
        _837 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].y);
        _839 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].w);
        _841 = (*spvDescriptorSet0.vp_c9)._m0[922].y;
        _843 = (*spvDescriptorSet0.vp_c9)._m0[923].y;
        _845 = (*spvDescriptorSet0.vp_c9)._m0[916].w;
        _847 = (*spvDescriptorSet0.vp_c9)._m0[917].x;
        _849 = (*spvDescriptorSet0.vp_c9)._m0[922].x;
        _851 = (*spvDescriptorSet0.vp_c9)._m0[923].x;
        _853 = (*spvDescriptorSet0.vp_c9)._m0[916].x;
        _855 = (*spvDescriptorSet0.vp_c9)._m0[917].y;
        _857 = (*spvDescriptorSet0.vp_c9)._m0[922].z;
        _859 = (*spvDescriptorSet0.vp_c9)._m0[923].z;
        _861 = (*spvDescriptorSet0.vp_c9)._m0[917].z;
        _863 = (*spvDescriptorSet0.vp_c9)._m0[916].y;
        _865 = (*spvDescriptorSet0.vp_c9)._m0[922].w;
        _867 = (*spvDescriptorSet0.vp_c9)._m0[923].w;
        _869 = (*spvDescriptorSet0.vp_c9)._m0[916].z;
        _871 = (*spvDescriptorSet0.vp_c9)._m0[918].y;
        _873 = (*spvDescriptorSet0.vp_c9)._m0[917].w;
        _875 = (*spvDescriptorSet0.vp_c9)._m0[918].x;
        _877 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].z);
        _879 = (*spvDescriptorSet0.vp_c9)._m0[918].z;
        _881 = (*spvDescriptorSet0.vp_c9)._m0[918].w;
        _883 = true;
    }
    else
    {
        float _885 = fma(_747, 6.2500002968590706586837768554688e-05, 0.5);
        float _887 = fma(_749, 6.2500002968590706586837768554688e-05, 0.5);
        float3 _2675 = float3(_885, _887, float(0));
        float3 _2679 = select(_2675, float3(0.0), isnan(_2675));
        float4 _890 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _2679.xy, uint(rint(_2679.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _2679.xy, uint(rint(_2679.z)), level(0.0)).xyzw;
        float _892 = _890.x;
        float _894 = _890.y;
        float _896 = _890.z;
        float _898 = _890.w;
        float3 _2694 = float3(_885, _887, float(1));
        float3 _2696 = select(_2694, float3(0.0), isnan(_2694));
        float4 _900 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _2696.xy, uint(rint(_2696.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _2696.xy, uint(rint(_2696.z)), level(0.0)).xyzw;
        float _902 = _900.x;
        float _904 = _900.y;
        float _906 = _900.z;
        float _908 = _900.w;
        float3 _2711 = float3(_885, _887, float(2));
        float3 _2713 = select(_2711, float3(0.0), isnan(_2711));
        float4 _910 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _2713.xy, uint(rint(_2713.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _2713.xy, uint(rint(_2713.z)), level(0.0)).xyzw;
        float _912 = _910.x;
        float _914 = _910.y;
        float _916 = _910.z;
        float _918 = _910.w;
        float3 _2728 = float3(_885, _887, float(3));
        float3 _2730 = select(_2728, float3(0.0), isnan(_2728));
        float4 _920 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _2730.xy, uint(rint(_2730.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _2730.xy, uint(rint(_2730.z)), level(0.0)).xyzw;
        float _922 = _920.x;
        float _924 = _920.y;
        float _926 = _920.z;
        float _928 = _920.w;
        float3 _2745 = float3(_885, _887, float(4));
        float3 _2747 = select(_2745, float3(0.0), isnan(_2745));
        float4 _930 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _2747.xy, uint(rint(_2747.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _2747.xy, uint(rint(_2747.z)), level(0.0)).xyzw;
        float _932 = _930.x;
        float _934 = _930.y;
        float _936 = _930.z;
        float _938 = _930.w;
        float3 _2763 = float3(_885, _887, float(5));
        float3 _2765 = select(_2763, float3(0.0), isnan(_2763));
        float4 _940 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _2765.xy, uint(rint(_2765.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _2765.xy, uint(rint(_2765.z)), level(0.0)).xyzw;
        float _942 = _940.x;
        float _944 = _940.y;
        float _946 = _940.z;
        float _948 = _940.w;
        float3 _2780 = float3(_885, _887, float(6));
        float3 _2782 = select(_2780, float3(0.0), isnan(_2780));
        float4 _950 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _2782.xy, uint(rint(_2782.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _2782.xy, uint(rint(_2782.z)), level(0.0)).xyzw;
        float _952 = _950.x;
        float _954 = _950.y;
        float _956 = _950.z;
        float _958 = _950.w;
        float3 _2797 = float3(_885, _887, float(7));
        float3 _2799 = select(_2797, float3(0.0), isnan(_2797));
        float4 _960 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _2799.xy, uint(rint(_2799.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _2799.xy, uint(rint(_2799.z)), level(0.0)).xyzw;
        float _962 = _960.x;
        float _964 = _960.y;
        float _966 = _960.z;
        float _968 = _960.w;
        _819 = _926;
        _821 = _922;
        _823 = _924;
        _825 = as_type<int>(_928);
        _827 = as_type<int>(_932);
        _829 = as_type<int>(_934);
        _831 = as_type<int>(_936);
        _833 = as_type<int>(_938);
        _835 = as_type<int>(_942);
        _837 = as_type<int>(_944);
        _839 = as_type<int>(_948);
        _841 = _954;
        _843 = _964;
        _845 = _898;
        _847 = _902;
        _849 = _952;
        _851 = _962;
        _853 = _892;
        _855 = _904;
        _857 = _956;
        _859 = _966;
        _861 = _906;
        _863 = _894;
        _865 = _958;
        _867 = _968;
        _869 = _896;
        _871 = _914;
        _873 = _908;
        _875 = _912;
        _877 = as_type<int>(_946);
        _879 = _916;
        _881 = _918;
    }
    _883 = false;
    float _970 = _819;
    float _972 = _821;
    float _974 = _823;
    int _976 = _825;
    int _978 = _827;
    int _980 = _829;
    int _982 = _831;
    int _984 = _833;
    int _986 = _835;
    int _988 = _837;
    int _990 = _839;
    float _992 = _841;
    float _994 = _843;
    float _996 = _845;
    float _998 = _847;
    float _1000 = _849;
    float _1002 = _851;
    float _1004 = _853;
    float _1006 = _855;
    float _1008 = _857;
    float _1010 = _859;
    float _1012 = _861;
    float _1014 = _863;
    float _1016 = _865;
    float _1018 = _867;
    float _1020 = _869;
    float _1022 = _871;
    float _1024 = _873;
    float _1026 = _875;
    int _1028 = _877;
    float _1030 = _879;
    float _1032 = _881;
    float _1034 = -(*spvDescriptorSet0.vp_c4)._m0[12].w;
    float _1036 = _759 + _1034;
    float _1038 = -(*spvDescriptorSet0.vp_c4)._m0[11].w;
    float _1040 = _747 + _1038;
    float _1042 = -(*spvDescriptorSet0.vp_c4)._m0[13].w;
    float _1044 = _749 + _1042;
    float _1046 = _970 * 0.88622701168060302734375;
    float _1048 = _1036 * _1036;
    float _1050 = _972 * 0.88622701168060302734375;
    float _1052 = _974 * 0.88622701168060302734375;
    float _1054 = _757 ? as_type<float>(_976) : 0.0;
    float _1056 = fma(_1040, _1040, _1048);
    float _1058 = _757 ? as_type<float>(_978) : 0.0;
    out.gl_Position.x = _809;
    out.gl_Position.y = _811;
    out.gl_Position.z = _813;
    out.gl_Position.w = _815;
    float _1060 = _757 ? as_type<float>(_980) : 0.0;
    float _1062 = fma(_1044, _1044, _1056);
    float _1064 = _757 ? _1050 : 0.0;
    out.m_43.x = _747;
    out.m_43.y = _759;
    out.m_43.z = _749;
    float _1066 = _757 ? _1052 : 0.0;
    float _1068 = _757 ? _1046 : 0.0;
    float _1070 = rsqrt(_1062);
    float _1072 = _757 ? as_type<float>(_982) : 0.0;
    out.m_45.z = _751;
    out.m_45.w = _753;
    float _1074 = _757 ? as_type<float>(_984) : 0.0;
    float _1076 = _757 ? as_type<float>(_986) : 0.0;
    float _1078 = _757 ? as_type<float>(_988) : 0.0;
    float _1080 = _757 ? as_type<float>(_990) : 0.0;
    float _1082 = _1070 * 1.02332699298858642578125;
    float _1084 = _1044 * _1070;
    float _1086 = _1036 * _1082;
    float _1088 = _1084 * (-1.02332699298858642578125);
    float _1090 = _1040 * _1082;
    float _1092 = _1086 * _992;
    float _1094 = _1086 * _994;
    float _1096 = _1086 * _996;
    float _1098 = _1086 * _998;
    float _1100 = fma(_1000, 0.88622701168060302734375, _1092);
    float _1102 = fma(_1002, 0.88622701168060302734375, _1094);
    float _1104 = fma(_1004, 0.88622701168060302734375, _1096);
    float _1106 = _1086 * _1006;
    float _1108 = fma(_1088, _1008, _1100);
    float _1110 = fma(_1088, _1010, _1102);
    float _1112 = fma(_1088, _1012, _1104);
    float _1114 = fma(_1014, 0.88622701168060302734375, _1098);
    float _1116 = fma(_1090, _1016, _1108);
    float _1118 = fma(_1090, _1018, _1110);
    float _1120 = fma(_1020, 0.88622701168060302734375, _1106);
    float _1122 = fma(_1054, _1086, _1064);
    float _1124 = fma(_1058, _1086, _1066);
    float _1126 = precise::max(0.0, _1116);
    float _1128 = fma(_1060, _1086, _1068);
    float _1130 = precise::max(0.0, _1118);
    float _1132 = fma(_1090, _1022, _1112);
    float _1134 = fma(_1088, _1024, _1114);
    float _1136 = _1126 * 0.31830990314483642578125;
    float _1138 = precise::clamp(_1136, 0.0, 1.0);
    float _1140 = fma(_1088, _1026, _1120);
    float _1142 = fma(_1072, _1088, _1122);
    float _1144 = fma(_1074, _1088, _1124);
    float _1146 = _1138 * 0.88622701168060302734375;
    float _1148 = fma(_1076, _1088, _1128);
    float _1150 = _1130 * 0.31830990314483642578125;
    float _1152 = precise::clamp(_1150, 0.0, 1.0);
    float _1154 = _757 ? as_type<float>(_1028) : 0.0;
    float _1156 = fma(_1090, _1030, _1134);
    float _1158 = precise::max(0.0, _1132);
    float _1160 = _1146 * (*spvDescriptorSet0.vp_c9)._m0[991].x;
    float _1162 = fma(_1090, _1032, _1140);
    float _1164 = -_1152;
    float _1166 = _1164 + 1.0;
    float _1168 = fma(_1154, _1090, _1144);
    float _1170 = fma(_1078, _1090, _1142);
    float _1172 = fma(_1080, _1090, _1148);
    float _1174 = fma(_1158, (*spvDescriptorSet0.vp_c9)._m0[68].x, _1160);
    float _1176 = precise::max(0.0, _1156);
    float _1178 = fma(_1166, (*spvDescriptorSet0.vp_c9)._m0[37].y, _1152);
    float _1180 = _1146 * (*spvDescriptorSet0.vp_c9)._m0[991].y;
    float _1182 = precise::max(0.0, _1162);
    float _1184 = _1146 * (*spvDescriptorSet0.vp_c9)._m0[991].z;
    float _1186 = precise::max(0.0, _1168);
    float _1188 = _1178 * (*spvDescriptorSet0.vp_c9)._m0[40].z;
    float _1190 = precise::max(0.0, _1170);
    float _1192 = fma(_1176, (*spvDescriptorSet0.vp_c9)._m0[68].y, _1180);
    float _1194 = precise::max(0.0, _1172);
    float _1196 = fma(_1182, (*spvDescriptorSet0.vp_c9)._m0[68].z, _1184);
    float _1198 = fma(_1186, _1188, _1192);
    float _1200 = fma(_1190, _1188, _1174);
    float _1202 = fma(_1194, _1188, _1196);
    out.m_47.x = _1200;
    out.m_47.y = _1198;
    out.m_47.z = _1202;
    out.m_47.w = _783;
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
    bool _883 = false;
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
    float2 _2404 = float2(_743, _741);
    float _745 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2404, float2(0.0), isnan(_2404)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2404, float2(0.0), isnan(_2404)), level(0.0)).x;
    float _747 = fma(_735, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _749 = fma(_731, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _751 = fma(_735, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].z);
    float _753 = fma(_731, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].w);
    int _755 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[40].w) & 2;
    bool _757 = _755 != 0;
    float _759 = fma(_745, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _761 = _759 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _763 = _759 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _765 = _759 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _767 = fma(_747, (*spvDescriptorSet0.vp_c4)._m0[1].x, _761);
    float _769 = fma(_747, (*spvDescriptorSet0.vp_c4)._m0[0].x, _763);
    float _771 = fma(_747, (*spvDescriptorSet0.vp_c4)._m0[2].x, _765);
    float _773 = fma(_749, (*spvDescriptorSet0.vp_c4)._m0[1].z, _767);
    float _775 = fma(_749, (*spvDescriptorSet0.vp_c4)._m0[0].z, _769);
    float _777 = fma(_749, (*spvDescriptorSet0.vp_c4)._m0[2].z, _771);
    float _779 = _773 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _781 = _775 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _783 = _777 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _785 = _779 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _787 = _779 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _789 = _779 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _791 = _779 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _793 = fma(_781, (*spvDescriptorSet0.vp_c4)._m0[7].x, _785);
    float _795 = fma(_781, (*spvDescriptorSet0.vp_c4)._m0[8].x, _787);
    float _797 = fma(_781, (*spvDescriptorSet0.vp_c4)._m0[9].x, _789);
    float _799 = fma(_781, (*spvDescriptorSet0.vp_c4)._m0[10].x, _791);
    float _801 = fma(_783, (*spvDescriptorSet0.vp_c4)._m0[7].z, _793);
    float _803 = fma(_783, (*spvDescriptorSet0.vp_c4)._m0[8].z, _795);
    float _805 = fma(_783, (*spvDescriptorSet0.vp_c4)._m0[9].z, _797);
    float _807 = fma(_783, (*spvDescriptorSet0.vp_c4)._m0[10].z, _799);
    float _809 = _801 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _811 = _803 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _813 = _805 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _815 = _807 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    bool _817 = !_757;
    float _819;
    float _821;
    float _823;
    int _825;
    int _827;
    int _829;
    int _831;
    int _833;
    int _835;
    int _837;
    int _839;
    float _841;
    float _843;
    float _845;
    float _847;
    float _849;
    float _851;
    float _853;
    float _855;
    float _857;
    float _859;
    float _861;
    float _863;
    float _865;
    float _867;
    float _869;
    float _871;
    float _873;
    float _875;
    int _877;
    float _879;
    float _881;
    if (!_817)
    {
        _819 = (*spvDescriptorSet0.vp_c9)._m0[919].z;
        _821 = (*spvDescriptorSet0.vp_c9)._m0[919].x;
        _823 = (*spvDescriptorSet0.vp_c9)._m0[919].y;
        _825 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[919].w);
        _827 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].x);
        _829 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].y);
        _831 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].z);
        _833 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].w);
        _835 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].x);
        _837 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].y);
        _839 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].w);
        _841 = (*spvDescriptorSet0.vp_c9)._m0[922].y;
        _843 = (*spvDescriptorSet0.vp_c9)._m0[923].y;
        _845 = (*spvDescriptorSet0.vp_c9)._m0[916].w;
        _847 = (*spvDescriptorSet0.vp_c9)._m0[917].x;
        _849 = (*spvDescriptorSet0.vp_c9)._m0[922].x;
        _851 = (*spvDescriptorSet0.vp_c9)._m0[923].x;
        _853 = (*spvDescriptorSet0.vp_c9)._m0[916].x;
        _855 = (*spvDescriptorSet0.vp_c9)._m0[917].y;
        _857 = (*spvDescriptorSet0.vp_c9)._m0[922].z;
        _859 = (*spvDescriptorSet0.vp_c9)._m0[923].z;
        _861 = (*spvDescriptorSet0.vp_c9)._m0[917].z;
        _863 = (*spvDescriptorSet0.vp_c9)._m0[916].y;
        _865 = (*spvDescriptorSet0.vp_c9)._m0[922].w;
        _867 = (*spvDescriptorSet0.vp_c9)._m0[923].w;
        _869 = (*spvDescriptorSet0.vp_c9)._m0[916].z;
        _871 = (*spvDescriptorSet0.vp_c9)._m0[918].y;
        _873 = (*spvDescriptorSet0.vp_c9)._m0[917].w;
        _875 = (*spvDescriptorSet0.vp_c9)._m0[918].x;
        _877 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].z);
        _879 = (*spvDescriptorSet0.vp_c9)._m0[918].z;
        _881 = (*spvDescriptorSet0.vp_c9)._m0[918].w;
        _883 = true;
    }
    else
    {
        float _885 = fma(_747, 6.2500002968590706586837768554688e-05, 0.5);
        float _887 = fma(_749, 6.2500002968590706586837768554688e-05, 0.5);
        float3 _2675 = float3(_885, _887, float(0));
        float3 _2679 = select(_2675, float3(0.0), isnan(_2675));
        float4 _890 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _2679.xy, uint(rint(_2679.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _2679.xy, uint(rint(_2679.z)), level(0.0)).xyzw;
        float _892 = _890.x;
        float _894 = _890.y;
        float _896 = _890.z;
        float _898 = _890.w;
        float3 _2694 = float3(_885, _887, float(1));
        float3 _2696 = select(_2694, float3(0.0), isnan(_2694));
        float4 _900 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _2696.xy, uint(rint(_2696.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _2696.xy, uint(rint(_2696.z)), level(0.0)).xyzw;
        float _902 = _900.x;
        float _904 = _900.y;
        float _906 = _900.z;
        float _908 = _900.w;
        float3 _2711 = float3(_885, _887, float(2));
        float3 _2713 = select(_2711, float3(0.0), isnan(_2711));
        float4 _910 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _2713.xy, uint(rint(_2713.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _2713.xy, uint(rint(_2713.z)), level(0.0)).xyzw;
        float _912 = _910.x;
        float _914 = _910.y;
        float _916 = _910.z;
        float _918 = _910.w;
        float3 _2728 = float3(_885, _887, float(3));
        float3 _2730 = select(_2728, float3(0.0), isnan(_2728));
        float4 _920 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _2730.xy, uint(rint(_2730.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _2730.xy, uint(rint(_2730.z)), level(0.0)).xyzw;
        float _922 = _920.x;
        float _924 = _920.y;
        float _926 = _920.z;
        float _928 = _920.w;
        float3 _2745 = float3(_885, _887, float(4));
        float3 _2747 = select(_2745, float3(0.0), isnan(_2745));
        float4 _930 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _2747.xy, uint(rint(_2747.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _2747.xy, uint(rint(_2747.z)), level(0.0)).xyzw;
        float _932 = _930.x;
        float _934 = _930.y;
        float _936 = _930.z;
        float _938 = _930.w;
        float3 _2763 = float3(_885, _887, float(5));
        float3 _2765 = select(_2763, float3(0.0), isnan(_2763));
        float4 _940 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _2765.xy, uint(rint(_2765.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _2765.xy, uint(rint(_2765.z)), level(0.0)).xyzw;
        float _942 = _940.x;
        float _944 = _940.y;
        float _946 = _940.z;
        float _948 = _940.w;
        float3 _2780 = float3(_885, _887, float(6));
        float3 _2782 = select(_2780, float3(0.0), isnan(_2780));
        float4 _950 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _2782.xy, uint(rint(_2782.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _2782.xy, uint(rint(_2782.z)), level(0.0)).xyzw;
        float _952 = _950.x;
        float _954 = _950.y;
        float _956 = _950.z;
        float _958 = _950.w;
        float3 _2797 = float3(_885, _887, float(7));
        float3 _2799 = select(_2797, float3(0.0), isnan(_2797));
        float4 _960 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _2799.xy, uint(rint(_2799.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _2799.xy, uint(rint(_2799.z)), level(0.0)).xyzw;
        float _962 = _960.x;
        float _964 = _960.y;
        float _966 = _960.z;
        float _968 = _960.w;
        _819 = _926;
        _821 = _922;
        _823 = _924;
        _825 = as_type<int>(_928);
        _827 = as_type<int>(_932);
        _829 = as_type<int>(_934);
        _831 = as_type<int>(_936);
        _833 = as_type<int>(_938);
        _835 = as_type<int>(_942);
        _837 = as_type<int>(_944);
        _839 = as_type<int>(_948);
        _841 = _954;
        _843 = _964;
        _845 = _898;
        _847 = _902;
        _849 = _952;
        _851 = _962;
        _853 = _892;
        _855 = _904;
        _857 = _956;
        _859 = _966;
        _861 = _906;
        _863 = _894;
        _865 = _958;
        _867 = _968;
        _869 = _896;
        _871 = _914;
        _873 = _908;
        _875 = _912;
        _877 = as_type<int>(_946);
        _879 = _916;
        _881 = _918;
    }
    _883 = false;
    float _970 = _819;
    float _972 = _821;
    float _974 = _823;
    int _976 = _825;
    int _978 = _827;
    int _980 = _829;
    int _982 = _831;
    int _984 = _833;
    int _986 = _835;
    int _988 = _837;
    int _990 = _839;
    float _992 = _841;
    float _994 = _843;
    float _996 = _845;
    float _998 = _847;
    float _1000 = _849;
    float _1002 = _851;
    float _1004 = _853;
    float _1006 = _855;
    float _1008 = _857;
    float _1010 = _859;
    float _1012 = _861;
    float _1014 = _863;
    float _1016 = _865;
    float _1018 = _867;
    float _1020 = _869;
    float _1022 = _871;
    float _1024 = _873;
    float _1026 = _875;
    int _1028 = _877;
    float _1030 = _879;
    float _1032 = _881;
    float _1034 = -(*spvDescriptorSet0.vp_c4)._m0[12].w;
    float _1036 = _759 + _1034;
    float _1038 = -(*spvDescriptorSet0.vp_c4)._m0[11].w;
    float _1040 = _747 + _1038;
    float _1042 = -(*spvDescriptorSet0.vp_c4)._m0[13].w;
    float _1044 = _749 + _1042;
    float _1046 = _970 * 0.88622701168060302734375;
    float _1048 = _1036 * _1036;
    float _1050 = _972 * 0.88622701168060302734375;
    float _1052 = _974 * 0.88622701168060302734375;
    float _1054 = _757 ? as_type<float>(_976) : 0.0;
    float _1056 = fma(_1040, _1040, _1048);
    float _1058 = _757 ? as_type<float>(_978) : 0.0;
    out.gl_Position.x = _809;
    out.gl_Position.y = _811;
    out.gl_Position.z = _813;
    out.gl_Position.w = _815;
    float _1060 = _757 ? as_type<float>(_980) : 0.0;
    float _1062 = fma(_1044, _1044, _1056);
    float _1064 = _757 ? _1050 : 0.0;
    out.m_43.x = _747;
    out.m_43.y = _759;
    out.m_43.z = _749;
    float _1066 = _757 ? _1052 : 0.0;
    float _1068 = _757 ? _1046 : 0.0;
    float _1070 = rsqrt(_1062);
    float _1072 = _757 ? as_type<float>(_982) : 0.0;
    out.m_45.z = _751;
    out.m_45.w = _753;
    float _1074 = _757 ? as_type<float>(_984) : 0.0;
    float _1076 = _757 ? as_type<float>(_986) : 0.0;
    float _1078 = _757 ? as_type<float>(_988) : 0.0;
    float _1080 = _757 ? as_type<float>(_990) : 0.0;
    float _1082 = _1070 * 1.02332699298858642578125;
    float _1084 = _1044 * _1070;
    float _1086 = _1036 * _1082;
    float _1088 = _1084 * (-1.02332699298858642578125);
    float _1090 = _1040 * _1082;
    float _1092 = _1086 * _992;
    float _1094 = _1086 * _994;
    float _1096 = _1086 * _996;
    float _1098 = _1086 * _998;
    float _1100 = fma(_1000, 0.88622701168060302734375, _1092);
    float _1102 = fma(_1002, 0.88622701168060302734375, _1094);
    float _1104 = fma(_1004, 0.88622701168060302734375, _1096);
    float _1106 = _1086 * _1006;
    float _1108 = fma(_1088, _1008, _1100);
    float _1110 = fma(_1088, _1010, _1102);
    float _1112 = fma(_1088, _1012, _1104);
    float _1114 = fma(_1014, 0.88622701168060302734375, _1098);
    float _1116 = fma(_1090, _1016, _1108);
    float _1118 = fma(_1090, _1018, _1110);
    float _1120 = fma(_1020, 0.88622701168060302734375, _1106);
    float _1122 = fma(_1054, _1086, _1064);
    float _1124 = fma(_1058, _1086, _1066);
    float _1126 = precise::max(0.0, _1116);
    float _1128 = fma(_1060, _1086, _1068);
    float _1130 = precise::max(0.0, _1118);
    float _1132 = fma(_1090, _1022, _1112);
    float _1134 = fma(_1088, _1024, _1114);
    float _1136 = _1126 * 0.31830990314483642578125;
    float _1138 = precise::clamp(_1136, 0.0, 1.0);
    float _1140 = fma(_1088, _1026, _1120);
    float _1142 = fma(_1072, _1088, _1122);
    float _1144 = fma(_1074, _1088, _1124);
    float _1146 = _1138 * 0.88622701168060302734375;
    float _1148 = fma(_1076, _1088, _1128);
    float _1150 = _1130 * 0.31830990314483642578125;
    float _1152 = precise::clamp(_1150, 0.0, 1.0);
    float _1154 = _757 ? as_type<float>(_1028) : 0.0;
    float _1156 = fma(_1090, _1030, _1134);
    float _1158 = precise::max(0.0, _1132);
    float _1160 = _1146 * (*spvDescriptorSet0.vp_c9)._m0[991].x;
    float _1162 = fma(_1090, _1032, _1140);
    float _1164 = -_1152;
    float _1166 = _1164 + 1.0;
    float _1168 = fma(_1154, _1090, _1144);
    float _1170 = fma(_1078, _1090, _1142);
    float _1172 = fma(_1080, _1090, _1148);
    float _1174 = fma(_1158, (*spvDescriptorSet0.vp_c9)._m0[68].x, _1160);
    float _1176 = precise::max(0.0, _1156);
    float _1178 = fma(_1166, (*spvDescriptorSet0.vp_c9)._m0[37].y, _1152);
    float _1180 = _1146 * (*spvDescriptorSet0.vp_c9)._m0[991].y;
    float _1182 = precise::max(0.0, _1162);
    float _1184 = _1146 * (*spvDescriptorSet0.vp_c9)._m0[991].z;
    float _1186 = precise::max(0.0, _1168);
    float _1188 = _1178 * (*spvDescriptorSet0.vp_c9)._m0[40].z;
    float _1190 = precise::max(0.0, _1170);
    float _1192 = fma(_1176, (*spvDescriptorSet0.vp_c9)._m0[68].y, _1180);
    float _1194 = precise::max(0.0, _1172);
    float _1196 = fma(_1182, (*spvDescriptorSet0.vp_c9)._m0[68].z, _1184);
    float _1198 = fma(_1186, _1188, _1192);
    float _1200 = fma(_1190, _1188, _1174);
    float _1202 = fma(_1194, _1188, _1196);
    out.m_47.x = _1200;
    out.m_47.y = _1198;
    out.m_47.z = _1202;
    out.m_47.w = _783;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

