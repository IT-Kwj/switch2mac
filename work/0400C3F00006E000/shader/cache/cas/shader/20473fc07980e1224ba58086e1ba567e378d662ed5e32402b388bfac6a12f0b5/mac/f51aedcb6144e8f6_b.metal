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
    constant _16* vp_c12 [[id(3)]];
    constant _16* vp_c4 [[id(4)]];
    constant _16* vp_c9 [[id(5)]];
    texture2d<float> vp_t_tcb_8 [[id(6)]];
    sampler vp_t_tcb_8Smplr [[id(7)]];
    sampler vp_t_tcb_8Smplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_37 [[attribute(0)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_BaseInstance [[base_instance]])
{
    main0_out out = {};
    bool _911 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _51 = in.m_37.x;
    float _53 = in.m_37.y;
    float _55 = -(*spvDescriptorSet0.vp_c15)._m0[3].x;
    float _57 = _55 + (*spvDescriptorSet0.vp_c15)._m0[3].y;
    int _60 = 16 + as_type<int>(as_type<float>(gl_BaseInstance));
    float _62 = -(*spvDescriptorSet0.vp_c15)._m0[3].z;
    float _64 = _62 + (*spvDescriptorSet0.vp_c15)._m0[3].w;
    int _66 = _60 << 4;
    bool _70 = _66 == 0;
    bool _72 = _66 == 16;
    bool _74 = _66 == 32;
    bool _76 = _66 == 48;
    bool _78 = _66 == 64;
    float _80 = fma(_57, _51, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _82 = fma(_64, _51, (*spvDescriptorSet0.vp_c15)._m0[3].z);
    bool _84 = _66 == 80;
    float _86 = as_type<float>(gl_BaseInstance);
    if (_70)
    {
        _86 = (*spvDescriptorSet0.vp_c14)._m0[268].x;
    }
    float _88 = _86;
    float _90 = -_80;
    float _92 = _90 + _82;
    bool _94 = _66 == 96;
    float _96 = fma(_92, _53, _80);
    float _98 = fma(_51, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _100 = 0.0;
    float _102 = _88;
    if (_70)
    {
        _100 = (*spvDescriptorSet0.vp_c14)._m0[268].z;
    }
    float _104 = _100;
    float _106 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _108 = _96 + _106;
    float _110 = _104;
    if (_72)
    {
        _102 = (*spvDescriptorSet0.vp_c14)._m0[269].x;
    }
    float _112 = _102;
    float _114 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _116 = _98 + _114;
    float _118 = fma(_53, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _120 = _108 * _108;
    bool _122 = _66 == 112;
    float _124 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _126 = _118 + _124;
    float _128 = fma(_116, _116, _120);
    float _130 = _112;
    if (_72)
    {
        _110 = (*spvDescriptorSet0.vp_c14)._m0[269].z;
    }
    float _132 = _110;
    float _134 = _132;
    if (_74)
    {
        _130 = (*spvDescriptorSet0.vp_c14)._m0[270].x;
    }
    float _136 = _130;
    float _138 = fma(_126, _126, _128);
    bool _140 = _66 == 128;
    float _142 = _136;
    if (_74)
    {
        _134 = (*spvDescriptorSet0.vp_c14)._m0[270].z;
    }
    float _144 = _134;
    float _146 = rsqrt(_138);
    float _148 = _144;
    if (_76)
    {
        _142 = (*spvDescriptorSet0.vp_c14)._m0[271].x;
    }
    float _150 = _142;
    bool _152 = _66 == 144;
    float _154 = _150;
    if (_76)
    {
        _148 = (*spvDescriptorSet0.vp_c14)._m0[271].z;
    }
    float _156 = _148;
    float _158 = _156;
    if (_78)
    {
        _154 = (*spvDescriptorSet0.vp_c14)._m0[272].x;
    }
    float _160 = _154;
    bool _162 = _66 == 160;
    float _164 = _160;
    if (_78)
    {
        _158 = (*spvDescriptorSet0.vp_c14)._m0[272].z;
    }
    float _166 = _158;
    float _168 = _166;
    if (_84)
    {
        _164 = (*spvDescriptorSet0.vp_c14)._m0[273].x;
    }
    float _170 = _164;
    bool _172 = _66 == 176;
    float _174 = _146 * (*spvDescriptorSet0.vp_c14)._m0[268].x;
    float _176 = _170;
    if (_84)
    {
        _168 = (*spvDescriptorSet0.vp_c14)._m0[273].z;
    }
    float _178 = _168;
    bool _180 = _66 == 192;
    float _182 = _178;
    if (_94)
    {
        _176 = (*spvDescriptorSet0.vp_c14)._m0[274].x;
    }
    float _184 = _176;
    float _186 = log2(_174);
    float _188 = _184;
    if (_94)
    {
        _182 = (*spvDescriptorSet0.vp_c14)._m0[274].z;
    }
    float _190 = _182;
    float _192 = _190;
    if (_122)
    {
        _188 = (*spvDescriptorSet0.vp_c14)._m0[275].x;
    }
    float _194 = _188;
    bool _196 = _66 == 208;
    float _198 = _194;
    if (_122)
    {
        _192 = (*spvDescriptorSet0.vp_c14)._m0[275].z;
    }
    float _200 = _192;
    float _202 = _200;
    if (_140)
    {
        _198 = (*spvDescriptorSet0.vp_c14)._m0[276].x;
    }
    float _204 = _198;
    bool _206 = _66 == 224;
    float _208 = _204;
    if (_140)
    {
        _202 = (*spvDescriptorSet0.vp_c14)._m0[276].z;
    }
    float _210 = _202;
    float _212 = _210;
    if (_152)
    {
        _208 = (*spvDescriptorSet0.vp_c14)._m0[277].x;
    }
    float _214 = _208;
    float _216 = _186 + 1.2999999523162841796875;
    bool _218 = _66 == 240;
    float _220 = _214;
    if (_152)
    {
        _212 = (*spvDescriptorSet0.vp_c14)._m0[277].z;
    }
    float _222 = _212;
    float _224 = _222;
    if (_162)
    {
        _220 = (*spvDescriptorSet0.vp_c14)._m0[278].x;
    }
    float _226 = _220;
    float _228 = trunc(_216);
    int _230 = int(_228);
    bool _232 = _66 == 256;
    float _234 = _226;
    if (_162)
    {
        _224 = (*spvDescriptorSet0.vp_c14)._m0[278].z;
    }
    float _236 = _224;
    float _238 = _236;
    if (_172)
    {
        _234 = (*spvDescriptorSet0.vp_c14)._m0[279].x;
    }
    float _240 = _234;
    bool _242 = _66 == 272;
    float _244 = _240;
    if (_172)
    {
        _238 = (*spvDescriptorSet0.vp_c14)._m0[279].z;
    }
    float _246 = _238;
    float _248 = _246;
    if (_180)
    {
        _244 = (*spvDescriptorSet0.vp_c14)._m0[280].x;
    }
    float _250 = _244;
    bool _252 = _66 == 288;
    float _254 = _250;
    if (_180)
    {
        _248 = (*spvDescriptorSet0.vp_c14)._m0[280].z;
    }
    float _256 = _248;
    int _258 = min(_230, 15);
    bool _260 = _66 == 304;
    float _262 = _256;
    if (_196)
    {
        _254 = (*spvDescriptorSet0.vp_c14)._m0[281].x;
    }
    float _264 = _254;
    float _266 = float(_258);
    float _268 = _264;
    if (_196)
    {
        _262 = (*spvDescriptorSet0.vp_c14)._m0[281].z;
    }
    float _270 = _262;
    int _272 = _258 << 4;
    int _274 = _272 + 4288;
    float _276 = _270;
    if (_206)
    {
        _268 = (*spvDescriptorSet0.vp_c14)._m0[282].x;
    }
    float _278 = _268;
    bool _280 = _66 == 320;
    float _282 = -_266;
    float _284 = _282 + (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _286 = _278;
    if (_206)
    {
        _276 = (*spvDescriptorSet0.vp_c14)._m0[282].z;
    }
    float _288 = _276;
    float _290 = _288;
    if (_218)
    {
        _286 = (*spvDescriptorSet0.vp_c14)._m0[283].x;
    }
    float _292 = _286;
    float _294 = _284 + 1.0;
    bool _296 = _66 == 336;
    float _298 = _292;
    if (_218)
    {
        _290 = (*spvDescriptorSet0.vp_c14)._m0[283].z;
    }
    float _300 = _290;
    float _302 = _300;
    if (_232)
    {
        _298 = (*spvDescriptorSet0.vp_c14)._m0[284].x;
    }
    float _304 = _298;
    float _306 = exp2(_294);
    bool _308 = _66 == 352;
    float _310 = _304;
    if (_232)
    {
        _302 = (*spvDescriptorSet0.vp_c14)._m0[284].z;
    }
    float _312 = _302;
    float _314 = _312;
    if (_242)
    {
        _310 = (*spvDescriptorSet0.vp_c14)._m0[285].x;
    }
    float _316 = _310;
    bool _318 = _66 == 368;
    float _320 = _316;
    if (_242)
    {
        _314 = (*spvDescriptorSet0.vp_c14)._m0[285].z;
    }
    float _322 = _314;
    float _324 = _322;
    if (_252)
    {
        _320 = (*spvDescriptorSet0.vp_c14)._m0[286].x;
    }
    float _326 = _320;
    bool _328 = _66 == 384;
    float _330 = _326;
    if (_252)
    {
        _324 = (*spvDescriptorSet0.vp_c14)._m0[286].z;
    }
    float _332 = _324;
    float _334 = 1.0 / _306;
    float _336 = _332;
    if (_260)
    {
        _330 = (*spvDescriptorSet0.vp_c14)._m0[287].x;
    }
    float _338 = _330;
    bool _340 = _66 == 400;
    float _342 = _338;
    if (_260)
    {
        _336 = (*spvDescriptorSet0.vp_c14)._m0[287].z;
    }
    float _344 = _336;
    bool _346 = _66 == 416;
    float _348 = _344;
    if (_280)
    {
        _342 = (*spvDescriptorSet0.vp_c14)._m0[288].x;
    }
    float _350 = _342;
    float _352 = _350;
    if (_280)
    {
        _348 = (*spvDescriptorSet0.vp_c14)._m0[288].z;
    }
    float _354 = _348;
    float _356 = _354;
    if (_296)
    {
        _352 = (*spvDescriptorSet0.vp_c14)._m0[289].x;
    }
    float _358 = _352;
    bool _360 = _66 == 432;
    float _362 = _358;
    if (_296)
    {
        _356 = (*spvDescriptorSet0.vp_c14)._m0[289].z;
    }
    float _364 = _356;
    float _366 = _364;
    if (_308)
    {
        _362 = (*spvDescriptorSet0.vp_c14)._m0[290].x;
    }
    float _368 = _362;
    bool _370 = _66 == 448;
    float _372 = _368;
    if (_308)
    {
        _366 = (*spvDescriptorSet0.vp_c14)._m0[290].z;
    }
    float _374 = _366;
    float _376 = _374;
    if (_318)
    {
        _372 = (*spvDescriptorSet0.vp_c14)._m0[291].x;
    }
    float _378 = _372;
    bool _380 = _66 == 464;
    float _382 = _378;
    if (_318)
    {
        _376 = (*spvDescriptorSet0.vp_c14)._m0[291].z;
    }
    float _384 = _376;
    float _386 = _384;
    if (_328)
    {
        _382 = (*spvDescriptorSet0.vp_c14)._m0[292].x;
    }
    float _388 = _382;
    bool _390 = _66 == 480;
    float _392 = _388;
    if (_328)
    {
        _386 = (*spvDescriptorSet0.vp_c14)._m0[292].z;
    }
    float _394 = _386;
    float _396 = _394;
    if (_340)
    {
        _392 = (*spvDescriptorSet0.vp_c14)._m0[293].x;
    }
    float _398 = _392;
    bool _400 = _66 == 496;
    float _402 = _398;
    if (_340)
    {
        _396 = (*spvDescriptorSet0.vp_c14)._m0[293].z;
    }
    float _404 = _396;
    float _406 = _404;
    if (_346)
    {
        _402 = (*spvDescriptorSet0.vp_c14)._m0[294].x;
    }
    float _408 = _402;
    bool _410 = _66 == 512;
    float _412 = _408;
    if (_346)
    {
        _406 = (*spvDescriptorSet0.vp_c14)._m0[294].z;
    }
    float _414 = _406;
    bool _416 = _66 == 528;
    float _418 = _414;
    if (_360)
    {
        _412 = (*spvDescriptorSet0.vp_c14)._m0[295].x;
    }
    float _420 = _412;
    float _422 = _420;
    if (_360)
    {
        _418 = (*spvDescriptorSet0.vp_c14)._m0[295].z;
    }
    float _424 = _418;
    float _426 = _424;
    if (_370)
    {
        _422 = (*spvDescriptorSet0.vp_c14)._m0[296].x;
    }
    float _428 = _422;
    bool _430 = _66 == 544;
    float _432 = _428;
    if (_370)
    {
        _426 = (*spvDescriptorSet0.vp_c14)._m0[296].z;
    }
    float _434 = _426;
    float _436 = _434;
    if (_380)
    {
        _432 = (*spvDescriptorSet0.vp_c14)._m0[297].x;
    }
    float _438 = _432;
    bool _440 = _66 == 560;
    float _442 = _438;
    if (_380)
    {
        _436 = (*spvDescriptorSet0.vp_c14)._m0[297].z;
    }
    float _444 = _436;
    float _446 = _444;
    if (_390)
    {
        _442 = (*spvDescriptorSet0.vp_c14)._m0[298].x;
    }
    float _448 = _442;
    bool _450 = _66 == 576;
    float _452 = _448;
    if (_390)
    {
        _446 = (*spvDescriptorSet0.vp_c14)._m0[298].z;
    }
    float _454 = _446;
    float _456 = _454;
    if (_400)
    {
        _452 = (*spvDescriptorSet0.vp_c14)._m0[299].x;
    }
    float _458 = _452;
    bool _460 = _66 == 592;
    float _462 = _458;
    if (_400)
    {
        _456 = (*spvDescriptorSet0.vp_c14)._m0[299].z;
    }
    float _464 = _456;
    float _466 = _464;
    if (_410)
    {
        _462 = (*spvDescriptorSet0.vp_c14)._m0[300].x;
    }
    float _468 = _462;
    bool _470 = _66 == 608;
    float _472 = _468;
    if (_410)
    {
        _466 = (*spvDescriptorSet0.vp_c14)._m0[300].z;
    }
    float _474 = _466;
    float _476 = _474;
    if (_416)
    {
        _472 = (*spvDescriptorSet0.vp_c14)._m0[301].x;
    }
    float _478 = _472;
    bool _480 = _66 == 624;
    float _482 = _478;
    if (_416)
    {
        _476 = (*spvDescriptorSet0.vp_c14)._m0[301].z;
    }
    float _484 = _476;
    bool _486 = _66 == 640;
    float _488 = _484;
    if (_430)
    {
        _482 = (*spvDescriptorSet0.vp_c14)._m0[302].x;
    }
    float _490 = _482;
    float _492 = _490;
    if (_430)
    {
        _488 = (*spvDescriptorSet0.vp_c14)._m0[302].z;
    }
    float _494 = _488;
    float _496 = _494;
    if (_440)
    {
        _492 = (*spvDescriptorSet0.vp_c14)._m0[303].x;
    }
    float _498 = _492;
    bool _500 = _66 == 656;
    float _502 = _498;
    if (_440)
    {
        _496 = (*spvDescriptorSet0.vp_c14)._m0[303].z;
    }
    float _504 = _496;
    float _506 = _504;
    if (_450)
    {
        _502 = (*spvDescriptorSet0.vp_c14)._m0[304].x;
    }
    float _508 = _502;
    bool _510 = _66 == 672;
    float _512 = _508;
    if (_450)
    {
        _506 = (*spvDescriptorSet0.vp_c14)._m0[304].z;
    }
    float _514 = _506;
    float _516 = _514;
    if (_460)
    {
        _512 = (*spvDescriptorSet0.vp_c14)._m0[305].x;
    }
    float _518 = _512;
    bool _520 = _66 == 688;
    float _522 = _518;
    if (_460)
    {
        _516 = (*spvDescriptorSet0.vp_c14)._m0[305].z;
    }
    float _524 = _516;
    float _526 = _524;
    if (_470)
    {
        _522 = (*spvDescriptorSet0.vp_c14)._m0[306].x;
    }
    float _528 = _522;
    bool _530 = _66 == 704;
    float _532 = _528;
    if (_470)
    {
        _526 = (*spvDescriptorSet0.vp_c14)._m0[306].z;
    }
    float _534 = _526;
    float _536 = _534;
    if (_480)
    {
        _532 = (*spvDescriptorSet0.vp_c14)._m0[307].x;
    }
    float _538 = _532;
    bool _540 = _66 == 720;
    float _542 = _538;
    if (_480)
    {
        _536 = (*spvDescriptorSet0.vp_c14)._m0[307].z;
    }
    float _544 = _536;
    float _546 = _544;
    if (_486)
    {
        _542 = (*spvDescriptorSet0.vp_c14)._m0[308].x;
    }
    float _548 = _542;
    bool _550 = _66 == 736;
    float _552 = _548;
    if (_486)
    {
        _546 = (*spvDescriptorSet0.vp_c14)._m0[308].z;
    }
    float _554 = _546;
    bool _556 = _66 == 752;
    float _558 = _554;
    if (_500)
    {
        _552 = (*spvDescriptorSet0.vp_c14)._m0[309].x;
    }
    float _560 = _552;
    float _562 = _560;
    if (_510)
    {
        _562 = (*spvDescriptorSet0.vp_c14)._m0[310].x;
    }
    float _564 = _562;
    float _566 = _564;
    if (_520)
    {
        _566 = (*spvDescriptorSet0.vp_c14)._m0[311].x;
    }
    float _568 = _566;
    float _570 = _568;
    if (_530)
    {
        _570 = (*spvDescriptorSet0.vp_c14)._m0[312].x;
    }
    float _572 = _570;
    float _574 = _572;
    if (_540)
    {
        _574 = (*spvDescriptorSet0.vp_c14)._m0[313].x;
    }
    float _576 = _574;
    float _578 = _576;
    if (_550)
    {
        _578 = (*spvDescriptorSet0.vp_c14)._m0[314].x;
    }
    float _580 = _578;
    float _582 = _580;
    if (_556)
    {
        _582 = (*spvDescriptorSet0.vp_c14)._m0[315].x;
    }
    float _584 = _582;
    float _586 = _334 * _584;
    if (_500)
    {
        _558 = (*spvDescriptorSet0.vp_c14)._m0[309].z;
    }
    float _588 = _558;
    float _590 = _588;
    if (_510)
    {
        _590 = (*spvDescriptorSet0.vp_c14)._m0[310].z;
    }
    float _592 = _590;
    float _594 = _586 * _51;
    float _596 = _586 * _53;
    float _598 = _592;
    if (_520)
    {
        _598 = (*spvDescriptorSet0.vp_c14)._m0[311].z;
    }
    float _600 = _598;
    float _602 = floor(_594);
    float _604 = _600;
    if (_530)
    {
        _604 = (*spvDescriptorSet0.vp_c14)._m0[312].z;
    }
    float _606 = _604;
    float _608 = _606;
    if (_540)
    {
        _608 = (*spvDescriptorSet0.vp_c14)._m0[313].z;
    }
    float _610 = _608;
    float _612 = _610;
    if (_550)
    {
        _612 = (*spvDescriptorSet0.vp_c14)._m0[314].z;
    }
    float _614 = _612;
    float _616 = _614;
    if (_556)
    {
        _616 = (*spvDescriptorSet0.vp_c14)._m0[315].z;
    }
    float _618 = _616;
    float _620 = floor(_596);
    float _622 = _306 * _618;
    float _624 = -_602;
    float _626 = _594 + _624;
    float _628 = _626 * 2.0;
    float _630 = -_626;
    float _632 = fma(_622, _630, _51);
    int _634 = _274 + 8;
    uint _637 = uint(int(uint(_634) >> uint(2)));
    uint _639 = uint(int(uint(int(_637)) >> uint(2)));
    int _641 = int(_637) & 3;
    float _643 = (*spvDescriptorSet0.vp_c14)._m0[int(_639)][_641];
    int _645 = int(_637) + 1;
    uint _647 = uint(int(uint(_645) >> uint(2)));
    int _649 = _645 & 3;
    float _651 = (*spvDescriptorSet0.vp_c14)._m0[int(_647)][_649];
    float _653 = -_620;
    float _655 = _596 + _653;
    float _657 = floor(_628);
    float _659 = _655 * 2.0;
    float _661 = -_655;
    float _663 = fma(_622, _661, _53);
    float _665 = floor(_659);
    float _667 = _622 * _657;
    float _669 = _667 * 0.5;
    float _671 = _669 + _632;
    float _673 = fma(_57, _671, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _675 = _622 * _665;
    float _677 = _675 * 0.5;
    float _679 = fma(_64, _671, (*spvDescriptorSet0.vp_c15)._m0[3].z);
    float _681 = fma(_671, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _683 = _677 + _663;
    float _685 = -_673;
    float _687 = _685 + _679;
    float _689 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _691 = _681 + _689;
    float _693 = fma(_683, _687, _673);
    float _695 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _697 = _693 + _695;
    float _699 = fma(_683, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _701 = _697 * _697;
    float _703 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _705 = _699 + _703;
    float _707 = fma(_691, _691, _701);
    float _709 = fma(_705, _705, _707);
    float _711 = sqrt(_709);
    float _713 = -_651;
    float _715 = fma(_711, _643, _713);
    float _717 = precise::clamp(_715, 0.0, 1.0);
    float _719 = -_669;
    float _721 = fma(_719, _717, _671);
    float _723 = -_677;
    float _725 = fma(_723, _717, _683);
    float _727 = fma(_721, (*spvDescriptorSet0.vp_c15)._m0[6].x, (*spvDescriptorSet0.vp_c15)._m0[6].z);
    float _729 = fma(_725, (*spvDescriptorSet0.vp_c15)._m0[6].x, (*spvDescriptorSet0.vp_c15)._m0[6].w);
    float _731 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _727);
    float _733 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _729);
    float2 _2153 = float2(_731, _733);
    float _735 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2153, float2(0.0), isnan(_2153)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2153, float2(0.0), isnan(_2153)), level(0.0)).x;
    float _737 = fma(_721, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    bool _739 = 0 != as_type<int>((*spvDescriptorSet0.vp_c12)._m0[4].y);
    float _741 = fma(_725, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _743 = fma(_735, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _745 = _743 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _747 = _743 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _749 = _743 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _751 = fma(_737, (*spvDescriptorSet0.vp_c4)._m0[0].x, _745);
    float _753 = fma(_737, (*spvDescriptorSet0.vp_c4)._m0[1].x, _747);
    float _755 = fma(_737, (*spvDescriptorSet0.vp_c4)._m0[2].x, _749);
    float _757 = fma(_741, (*spvDescriptorSet0.vp_c4)._m0[0].z, _751);
    float _759 = fma(_741, (*spvDescriptorSet0.vp_c4)._m0[1].z, _753);
    float _761 = fma(_741, (*spvDescriptorSet0.vp_c4)._m0[2].z, _755);
    float _763 = _757 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _765 = _759 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _767 = _761 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _769 = _761;
    float _771 = _759;
    int _903;
    int _905;
    int _907;
    int _909;
    if (!_739)
    {
        float _773 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
        float _775 = _741 + _773;
        float _777 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
        float _779 = _737 + _777;
        float _781 = _775 * _775;
        float _783 = fma(_779, _779, _781);
        float _785 = sqrt(_783);
        bool _787 = _785 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _789 = _781;
        if (!_787)
        {
            _769 = _767;
        }
        float _791 = _769;
        float _793 = _791;
        if (!_787)
        {
            _771 = _765;
        }
        float _795 = _771;
        float _797 = _795;
        if (!_787)
        {
            _789 = _763;
        }
        float _799 = _789;
        bool _801 = !_787;
        float _803 = _799;
        if (!_801)
        {
            float _805 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
            float _807 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
            float _809 = _785 + _807;
            float _811 = _743 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
            float _813 = rsqrt(_783);
            float _815 = _809 * _805;
            float _817 = _815 * 0.15915493667125701904296875;
            float _819 = _817 * 6.283185482025146484375;
            float _821 = cos(_819);
            float _823 = _817 * 6.283185482025146484375;
            float _825 = sin(_823);
            float _827 = _821 + (-1.0);
            float _829 = _827 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
            float _831 = fma(_825, _811, (*spvDescriptorSet0.vp_c9)._m0[42].y);
            float _833 = fma(_743, _821, _829);
            float _835 = _813 * _831;
            float _837 = _833 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
            float _839 = _833 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
            float _841 = _833 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
            float _843 = fma(_779, _835, (*spvDescriptorSet0.vp_c9)._m0[26].x);
            float _845 = fma(_775, _835, (*spvDescriptorSet0.vp_c9)._m0[26].z);
            float _847 = fma(_843, (*spvDescriptorSet0.vp_c4)._m0[0].x, _837);
            float _849 = fma(_843, (*spvDescriptorSet0.vp_c4)._m0[1].x, _839);
            float _851 = fma(_843, (*spvDescriptorSet0.vp_c4)._m0[2].x, _841);
            float _853 = fma(_845, (*spvDescriptorSet0.vp_c4)._m0[0].z, _847);
            float _855 = fma(_845, (*spvDescriptorSet0.vp_c4)._m0[1].z, _849);
            float _857 = fma(_845, (*spvDescriptorSet0.vp_c4)._m0[2].z, _851);
            float _859 = _853 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
            float _861 = _855 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
            float _863 = _857 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
            _797 = _861;
            _803 = _859;
            _793 = _863;
        }
        float _865 = _797;
        float _867 = _803;
        float _869 = _793;
        float _871 = _865 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
        float _873 = _865 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
        float _875 = _865 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
        float _877 = _865 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
        float _879 = fma(_867, (*spvDescriptorSet0.vp_c4)._m0[7].x, _871);
        float _881 = fma(_867, (*spvDescriptorSet0.vp_c4)._m0[8].x, _873);
        float _883 = fma(_867, (*spvDescriptorSet0.vp_c4)._m0[9].x, _875);
        float _885 = fma(_867, (*spvDescriptorSet0.vp_c4)._m0[10].x, _877);
        float _887 = fma(_869, (*spvDescriptorSet0.vp_c4)._m0[7].z, _879);
        float _889 = fma(_869, (*spvDescriptorSet0.vp_c4)._m0[8].z, _881);
        float _891 = fma(_869, (*spvDescriptorSet0.vp_c4)._m0[9].z, _883);
        float _893 = fma(_869, (*spvDescriptorSet0.vp_c4)._m0[10].z, _885);
        float _895 = _887 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
        float _897 = _889 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
        float _899 = _891 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
        float _901 = _893 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
        _903 = as_type<int>(_895);
        _905 = as_type<int>(_897);
        _907 = as_type<int>(_899);
        _909 = as_type<int>(_901);
        _911 = true;
    }
    else
    {
        float _913 = _765 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
        float _915 = _765 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
        float _917 = _765 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
        float _919 = _765 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
        float _921 = fma(_763, (*spvDescriptorSet0.vp_c4)._m0[7].x, _913);
        float _923 = fma(_763, (*spvDescriptorSet0.vp_c4)._m0[8].x, _915);
        float _925 = fma(_763, (*spvDescriptorSet0.vp_c4)._m0[9].x, _917);
        float _927 = fma(_763, (*spvDescriptorSet0.vp_c4)._m0[10].x, _919);
        float _929 = fma(_767, (*spvDescriptorSet0.vp_c4)._m0[7].z, _921);
        float _931 = fma(_767, (*spvDescriptorSet0.vp_c4)._m0[8].z, _923);
        float _933 = fma(_767, (*spvDescriptorSet0.vp_c4)._m0[9].z, _925);
        float _935 = fma(_767, (*spvDescriptorSet0.vp_c4)._m0[10].z, _927);
        float _937 = _929 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
        float _939 = _931 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
        float _941 = _933 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
        float _943 = _935 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
        _903 = as_type<int>(_937);
        _905 = as_type<int>(_939);
        _907 = as_type<int>(_941);
        _909 = as_type<int>(_943);
    }
    _911 = false;
    int _945 = _903;
    int _947 = _905;
    int _949 = _907;
    int _951 = _909;
    float _2587 = as_type<float>(_945);
    out.gl_Position.x = _2587;
    float _2590 = as_type<float>(_947);
    out.gl_Position.y = _2590;
    float _2593 = as_type<float>(_949);
    out.gl_Position.z = _2593;
    float _2596 = as_type<float>(_951);
    out.gl_Position.w = _2596;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_BaseInstance [[base_instance]])
{
    main0_out out = {};
    bool _911 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _51 = in.m_37.x;
    float _53 = in.m_37.y;
    float _55 = -(*spvDescriptorSet0.vp_c15)._m0[3].x;
    float _57 = _55 + (*spvDescriptorSet0.vp_c15)._m0[3].y;
    int _60 = 16 + as_type<int>(as_type<float>(gl_BaseInstance));
    float _62 = -(*spvDescriptorSet0.vp_c15)._m0[3].z;
    float _64 = _62 + (*spvDescriptorSet0.vp_c15)._m0[3].w;
    int _66 = _60 << 4;
    bool _70 = _66 == 0;
    bool _72 = _66 == 16;
    bool _74 = _66 == 32;
    bool _76 = _66 == 48;
    bool _78 = _66 == 64;
    float _80 = fma(_57, _51, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _82 = fma(_64, _51, (*spvDescriptorSet0.vp_c15)._m0[3].z);
    bool _84 = _66 == 80;
    float _86 = as_type<float>(gl_BaseInstance);
    if (_70)
    {
        _86 = (*spvDescriptorSet0.vp_c14)._m0[268].x;
    }
    float _88 = _86;
    float _90 = -_80;
    float _92 = _90 + _82;
    bool _94 = _66 == 96;
    float _96 = fma(_92, _53, _80);
    float _98 = fma(_51, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _100 = 0.0;
    float _102 = _88;
    if (_70)
    {
        _100 = (*spvDescriptorSet0.vp_c14)._m0[268].z;
    }
    float _104 = _100;
    float _106 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _108 = _96 + _106;
    float _110 = _104;
    if (_72)
    {
        _102 = (*spvDescriptorSet0.vp_c14)._m0[269].x;
    }
    float _112 = _102;
    float _114 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _116 = _98 + _114;
    float _118 = fma(_53, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _120 = _108 * _108;
    bool _122 = _66 == 112;
    float _124 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _126 = _118 + _124;
    float _128 = fma(_116, _116, _120);
    float _130 = _112;
    if (_72)
    {
        _110 = (*spvDescriptorSet0.vp_c14)._m0[269].z;
    }
    float _132 = _110;
    float _134 = _132;
    if (_74)
    {
        _130 = (*spvDescriptorSet0.vp_c14)._m0[270].x;
    }
    float _136 = _130;
    float _138 = fma(_126, _126, _128);
    bool _140 = _66 == 128;
    float _142 = _136;
    if (_74)
    {
        _134 = (*spvDescriptorSet0.vp_c14)._m0[270].z;
    }
    float _144 = _134;
    float _146 = rsqrt(_138);
    float _148 = _144;
    if (_76)
    {
        _142 = (*spvDescriptorSet0.vp_c14)._m0[271].x;
    }
    float _150 = _142;
    bool _152 = _66 == 144;
    float _154 = _150;
    if (_76)
    {
        _148 = (*spvDescriptorSet0.vp_c14)._m0[271].z;
    }
    float _156 = _148;
    float _158 = _156;
    if (_78)
    {
        _154 = (*spvDescriptorSet0.vp_c14)._m0[272].x;
    }
    float _160 = _154;
    bool _162 = _66 == 160;
    float _164 = _160;
    if (_78)
    {
        _158 = (*spvDescriptorSet0.vp_c14)._m0[272].z;
    }
    float _166 = _158;
    float _168 = _166;
    if (_84)
    {
        _164 = (*spvDescriptorSet0.vp_c14)._m0[273].x;
    }
    float _170 = _164;
    bool _172 = _66 == 176;
    float _174 = _146 * (*spvDescriptorSet0.vp_c14)._m0[268].x;
    float _176 = _170;
    if (_84)
    {
        _168 = (*spvDescriptorSet0.vp_c14)._m0[273].z;
    }
    float _178 = _168;
    bool _180 = _66 == 192;
    float _182 = _178;
    if (_94)
    {
        _176 = (*spvDescriptorSet0.vp_c14)._m0[274].x;
    }
    float _184 = _176;
    float _186 = log2(_174);
    float _188 = _184;
    if (_94)
    {
        _182 = (*spvDescriptorSet0.vp_c14)._m0[274].z;
    }
    float _190 = _182;
    float _192 = _190;
    if (_122)
    {
        _188 = (*spvDescriptorSet0.vp_c14)._m0[275].x;
    }
    float _194 = _188;
    bool _196 = _66 == 208;
    float _198 = _194;
    if (_122)
    {
        _192 = (*spvDescriptorSet0.vp_c14)._m0[275].z;
    }
    float _200 = _192;
    float _202 = _200;
    if (_140)
    {
        _198 = (*spvDescriptorSet0.vp_c14)._m0[276].x;
    }
    float _204 = _198;
    bool _206 = _66 == 224;
    float _208 = _204;
    if (_140)
    {
        _202 = (*spvDescriptorSet0.vp_c14)._m0[276].z;
    }
    float _210 = _202;
    float _212 = _210;
    if (_152)
    {
        _208 = (*spvDescriptorSet0.vp_c14)._m0[277].x;
    }
    float _214 = _208;
    float _216 = _186 + 1.2999999523162841796875;
    bool _218 = _66 == 240;
    float _220 = _214;
    if (_152)
    {
        _212 = (*spvDescriptorSet0.vp_c14)._m0[277].z;
    }
    float _222 = _212;
    float _224 = _222;
    if (_162)
    {
        _220 = (*spvDescriptorSet0.vp_c14)._m0[278].x;
    }
    float _226 = _220;
    float _228 = trunc(_216);
    int _230 = int(_228);
    bool _232 = _66 == 256;
    float _234 = _226;
    if (_162)
    {
        _224 = (*spvDescriptorSet0.vp_c14)._m0[278].z;
    }
    float _236 = _224;
    float _238 = _236;
    if (_172)
    {
        _234 = (*spvDescriptorSet0.vp_c14)._m0[279].x;
    }
    float _240 = _234;
    bool _242 = _66 == 272;
    float _244 = _240;
    if (_172)
    {
        _238 = (*spvDescriptorSet0.vp_c14)._m0[279].z;
    }
    float _246 = _238;
    float _248 = _246;
    if (_180)
    {
        _244 = (*spvDescriptorSet0.vp_c14)._m0[280].x;
    }
    float _250 = _244;
    bool _252 = _66 == 288;
    float _254 = _250;
    if (_180)
    {
        _248 = (*spvDescriptorSet0.vp_c14)._m0[280].z;
    }
    float _256 = _248;
    int _258 = min(_230, 15);
    bool _260 = _66 == 304;
    float _262 = _256;
    if (_196)
    {
        _254 = (*spvDescriptorSet0.vp_c14)._m0[281].x;
    }
    float _264 = _254;
    float _266 = float(_258);
    float _268 = _264;
    if (_196)
    {
        _262 = (*spvDescriptorSet0.vp_c14)._m0[281].z;
    }
    float _270 = _262;
    int _272 = _258 << 4;
    int _274 = _272 + 4288;
    float _276 = _270;
    if (_206)
    {
        _268 = (*spvDescriptorSet0.vp_c14)._m0[282].x;
    }
    float _278 = _268;
    bool _280 = _66 == 320;
    float _282 = -_266;
    float _284 = _282 + (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _286 = _278;
    if (_206)
    {
        _276 = (*spvDescriptorSet0.vp_c14)._m0[282].z;
    }
    float _288 = _276;
    float _290 = _288;
    if (_218)
    {
        _286 = (*spvDescriptorSet0.vp_c14)._m0[283].x;
    }
    float _292 = _286;
    float _294 = _284 + 1.0;
    bool _296 = _66 == 336;
    float _298 = _292;
    if (_218)
    {
        _290 = (*spvDescriptorSet0.vp_c14)._m0[283].z;
    }
    float _300 = _290;
    float _302 = _300;
    if (_232)
    {
        _298 = (*spvDescriptorSet0.vp_c14)._m0[284].x;
    }
    float _304 = _298;
    float _306 = exp2(_294);
    bool _308 = _66 == 352;
    float _310 = _304;
    if (_232)
    {
        _302 = (*spvDescriptorSet0.vp_c14)._m0[284].z;
    }
    float _312 = _302;
    float _314 = _312;
    if (_242)
    {
        _310 = (*spvDescriptorSet0.vp_c14)._m0[285].x;
    }
    float _316 = _310;
    bool _318 = _66 == 368;
    float _320 = _316;
    if (_242)
    {
        _314 = (*spvDescriptorSet0.vp_c14)._m0[285].z;
    }
    float _322 = _314;
    float _324 = _322;
    if (_252)
    {
        _320 = (*spvDescriptorSet0.vp_c14)._m0[286].x;
    }
    float _326 = _320;
    bool _328 = _66 == 384;
    float _330 = _326;
    if (_252)
    {
        _324 = (*spvDescriptorSet0.vp_c14)._m0[286].z;
    }
    float _332 = _324;
    float _334 = 1.0 / _306;
    float _336 = _332;
    if (_260)
    {
        _330 = (*spvDescriptorSet0.vp_c14)._m0[287].x;
    }
    float _338 = _330;
    bool _340 = _66 == 400;
    float _342 = _338;
    if (_260)
    {
        _336 = (*spvDescriptorSet0.vp_c14)._m0[287].z;
    }
    float _344 = _336;
    bool _346 = _66 == 416;
    float _348 = _344;
    if (_280)
    {
        _342 = (*spvDescriptorSet0.vp_c14)._m0[288].x;
    }
    float _350 = _342;
    float _352 = _350;
    if (_280)
    {
        _348 = (*spvDescriptorSet0.vp_c14)._m0[288].z;
    }
    float _354 = _348;
    float _356 = _354;
    if (_296)
    {
        _352 = (*spvDescriptorSet0.vp_c14)._m0[289].x;
    }
    float _358 = _352;
    bool _360 = _66 == 432;
    float _362 = _358;
    if (_296)
    {
        _356 = (*spvDescriptorSet0.vp_c14)._m0[289].z;
    }
    float _364 = _356;
    float _366 = _364;
    if (_308)
    {
        _362 = (*spvDescriptorSet0.vp_c14)._m0[290].x;
    }
    float _368 = _362;
    bool _370 = _66 == 448;
    float _372 = _368;
    if (_308)
    {
        _366 = (*spvDescriptorSet0.vp_c14)._m0[290].z;
    }
    float _374 = _366;
    float _376 = _374;
    if (_318)
    {
        _372 = (*spvDescriptorSet0.vp_c14)._m0[291].x;
    }
    float _378 = _372;
    bool _380 = _66 == 464;
    float _382 = _378;
    if (_318)
    {
        _376 = (*spvDescriptorSet0.vp_c14)._m0[291].z;
    }
    float _384 = _376;
    float _386 = _384;
    if (_328)
    {
        _382 = (*spvDescriptorSet0.vp_c14)._m0[292].x;
    }
    float _388 = _382;
    bool _390 = _66 == 480;
    float _392 = _388;
    if (_328)
    {
        _386 = (*spvDescriptorSet0.vp_c14)._m0[292].z;
    }
    float _394 = _386;
    float _396 = _394;
    if (_340)
    {
        _392 = (*spvDescriptorSet0.vp_c14)._m0[293].x;
    }
    float _398 = _392;
    bool _400 = _66 == 496;
    float _402 = _398;
    if (_340)
    {
        _396 = (*spvDescriptorSet0.vp_c14)._m0[293].z;
    }
    float _404 = _396;
    float _406 = _404;
    if (_346)
    {
        _402 = (*spvDescriptorSet0.vp_c14)._m0[294].x;
    }
    float _408 = _402;
    bool _410 = _66 == 512;
    float _412 = _408;
    if (_346)
    {
        _406 = (*spvDescriptorSet0.vp_c14)._m0[294].z;
    }
    float _414 = _406;
    bool _416 = _66 == 528;
    float _418 = _414;
    if (_360)
    {
        _412 = (*spvDescriptorSet0.vp_c14)._m0[295].x;
    }
    float _420 = _412;
    float _422 = _420;
    if (_360)
    {
        _418 = (*spvDescriptorSet0.vp_c14)._m0[295].z;
    }
    float _424 = _418;
    float _426 = _424;
    if (_370)
    {
        _422 = (*spvDescriptorSet0.vp_c14)._m0[296].x;
    }
    float _428 = _422;
    bool _430 = _66 == 544;
    float _432 = _428;
    if (_370)
    {
        _426 = (*spvDescriptorSet0.vp_c14)._m0[296].z;
    }
    float _434 = _426;
    float _436 = _434;
    if (_380)
    {
        _432 = (*spvDescriptorSet0.vp_c14)._m0[297].x;
    }
    float _438 = _432;
    bool _440 = _66 == 560;
    float _442 = _438;
    if (_380)
    {
        _436 = (*spvDescriptorSet0.vp_c14)._m0[297].z;
    }
    float _444 = _436;
    float _446 = _444;
    if (_390)
    {
        _442 = (*spvDescriptorSet0.vp_c14)._m0[298].x;
    }
    float _448 = _442;
    bool _450 = _66 == 576;
    float _452 = _448;
    if (_390)
    {
        _446 = (*spvDescriptorSet0.vp_c14)._m0[298].z;
    }
    float _454 = _446;
    float _456 = _454;
    if (_400)
    {
        _452 = (*spvDescriptorSet0.vp_c14)._m0[299].x;
    }
    float _458 = _452;
    bool _460 = _66 == 592;
    float _462 = _458;
    if (_400)
    {
        _456 = (*spvDescriptorSet0.vp_c14)._m0[299].z;
    }
    float _464 = _456;
    float _466 = _464;
    if (_410)
    {
        _462 = (*spvDescriptorSet0.vp_c14)._m0[300].x;
    }
    float _468 = _462;
    bool _470 = _66 == 608;
    float _472 = _468;
    if (_410)
    {
        _466 = (*spvDescriptorSet0.vp_c14)._m0[300].z;
    }
    float _474 = _466;
    float _476 = _474;
    if (_416)
    {
        _472 = (*spvDescriptorSet0.vp_c14)._m0[301].x;
    }
    float _478 = _472;
    bool _480 = _66 == 624;
    float _482 = _478;
    if (_416)
    {
        _476 = (*spvDescriptorSet0.vp_c14)._m0[301].z;
    }
    float _484 = _476;
    bool _486 = _66 == 640;
    float _488 = _484;
    if (_430)
    {
        _482 = (*spvDescriptorSet0.vp_c14)._m0[302].x;
    }
    float _490 = _482;
    float _492 = _490;
    if (_430)
    {
        _488 = (*spvDescriptorSet0.vp_c14)._m0[302].z;
    }
    float _494 = _488;
    float _496 = _494;
    if (_440)
    {
        _492 = (*spvDescriptorSet0.vp_c14)._m0[303].x;
    }
    float _498 = _492;
    bool _500 = _66 == 656;
    float _502 = _498;
    if (_440)
    {
        _496 = (*spvDescriptorSet0.vp_c14)._m0[303].z;
    }
    float _504 = _496;
    float _506 = _504;
    if (_450)
    {
        _502 = (*spvDescriptorSet0.vp_c14)._m0[304].x;
    }
    float _508 = _502;
    bool _510 = _66 == 672;
    float _512 = _508;
    if (_450)
    {
        _506 = (*spvDescriptorSet0.vp_c14)._m0[304].z;
    }
    float _514 = _506;
    float _516 = _514;
    if (_460)
    {
        _512 = (*spvDescriptorSet0.vp_c14)._m0[305].x;
    }
    float _518 = _512;
    bool _520 = _66 == 688;
    float _522 = _518;
    if (_460)
    {
        _516 = (*spvDescriptorSet0.vp_c14)._m0[305].z;
    }
    float _524 = _516;
    float _526 = _524;
    if (_470)
    {
        _522 = (*spvDescriptorSet0.vp_c14)._m0[306].x;
    }
    float _528 = _522;
    bool _530 = _66 == 704;
    float _532 = _528;
    if (_470)
    {
        _526 = (*spvDescriptorSet0.vp_c14)._m0[306].z;
    }
    float _534 = _526;
    float _536 = _534;
    if (_480)
    {
        _532 = (*spvDescriptorSet0.vp_c14)._m0[307].x;
    }
    float _538 = _532;
    bool _540 = _66 == 720;
    float _542 = _538;
    if (_480)
    {
        _536 = (*spvDescriptorSet0.vp_c14)._m0[307].z;
    }
    float _544 = _536;
    float _546 = _544;
    if (_486)
    {
        _542 = (*spvDescriptorSet0.vp_c14)._m0[308].x;
    }
    float _548 = _542;
    bool _550 = _66 == 736;
    float _552 = _548;
    if (_486)
    {
        _546 = (*spvDescriptorSet0.vp_c14)._m0[308].z;
    }
    float _554 = _546;
    bool _556 = _66 == 752;
    float _558 = _554;
    if (_500)
    {
        _552 = (*spvDescriptorSet0.vp_c14)._m0[309].x;
    }
    float _560 = _552;
    float _562 = _560;
    if (_510)
    {
        _562 = (*spvDescriptorSet0.vp_c14)._m0[310].x;
    }
    float _564 = _562;
    float _566 = _564;
    if (_520)
    {
        _566 = (*spvDescriptorSet0.vp_c14)._m0[311].x;
    }
    float _568 = _566;
    float _570 = _568;
    if (_530)
    {
        _570 = (*spvDescriptorSet0.vp_c14)._m0[312].x;
    }
    float _572 = _570;
    float _574 = _572;
    if (_540)
    {
        _574 = (*spvDescriptorSet0.vp_c14)._m0[313].x;
    }
    float _576 = _574;
    float _578 = _576;
    if (_550)
    {
        _578 = (*spvDescriptorSet0.vp_c14)._m0[314].x;
    }
    float _580 = _578;
    float _582 = _580;
    if (_556)
    {
        _582 = (*spvDescriptorSet0.vp_c14)._m0[315].x;
    }
    float _584 = _582;
    float _586 = _334 * _584;
    if (_500)
    {
        _558 = (*spvDescriptorSet0.vp_c14)._m0[309].z;
    }
    float _588 = _558;
    float _590 = _588;
    if (_510)
    {
        _590 = (*spvDescriptorSet0.vp_c14)._m0[310].z;
    }
    float _592 = _590;
    float _594 = _586 * _51;
    float _596 = _586 * _53;
    float _598 = _592;
    if (_520)
    {
        _598 = (*spvDescriptorSet0.vp_c14)._m0[311].z;
    }
    float _600 = _598;
    float _602 = floor(_594);
    float _604 = _600;
    if (_530)
    {
        _604 = (*spvDescriptorSet0.vp_c14)._m0[312].z;
    }
    float _606 = _604;
    float _608 = _606;
    if (_540)
    {
        _608 = (*spvDescriptorSet0.vp_c14)._m0[313].z;
    }
    float _610 = _608;
    float _612 = _610;
    if (_550)
    {
        _612 = (*spvDescriptorSet0.vp_c14)._m0[314].z;
    }
    float _614 = _612;
    float _616 = _614;
    if (_556)
    {
        _616 = (*spvDescriptorSet0.vp_c14)._m0[315].z;
    }
    float _618 = _616;
    float _620 = floor(_596);
    float _622 = _306 * _618;
    float _624 = -_602;
    float _626 = _594 + _624;
    float _628 = _626 * 2.0;
    float _630 = -_626;
    float _632 = fma(_622, _630, _51);
    int _634 = _274 + 8;
    uint _637 = uint(int(uint(_634) >> uint(2)));
    uint _639 = uint(int(uint(int(_637)) >> uint(2)));
    int _641 = int(_637) & 3;
    float _643 = (*spvDescriptorSet0.vp_c14)._m0[int(_639)][_641];
    int _645 = int(_637) + 1;
    uint _647 = uint(int(uint(_645) >> uint(2)));
    int _649 = _645 & 3;
    float _651 = (*spvDescriptorSet0.vp_c14)._m0[int(_647)][_649];
    float _653 = -_620;
    float _655 = _596 + _653;
    float _657 = floor(_628);
    float _659 = _655 * 2.0;
    float _661 = -_655;
    float _663 = fma(_622, _661, _53);
    float _665 = floor(_659);
    float _667 = _622 * _657;
    float _669 = _667 * 0.5;
    float _671 = _669 + _632;
    float _673 = fma(_57, _671, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _675 = _622 * _665;
    float _677 = _675 * 0.5;
    float _679 = fma(_64, _671, (*spvDescriptorSet0.vp_c15)._m0[3].z);
    float _681 = fma(_671, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _683 = _677 + _663;
    float _685 = -_673;
    float _687 = _685 + _679;
    float _689 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _691 = _681 + _689;
    float _693 = fma(_683, _687, _673);
    float _695 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _697 = _693 + _695;
    float _699 = fma(_683, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _701 = _697 * _697;
    float _703 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _705 = _699 + _703;
    float _707 = fma(_691, _691, _701);
    float _709 = fma(_705, _705, _707);
    float _711 = sqrt(_709);
    float _713 = -_651;
    float _715 = fma(_711, _643, _713);
    float _717 = precise::clamp(_715, 0.0, 1.0);
    float _719 = -_669;
    float _721 = fma(_719, _717, _671);
    float _723 = -_677;
    float _725 = fma(_723, _717, _683);
    float _727 = fma(_721, (*spvDescriptorSet0.vp_c15)._m0[6].x, (*spvDescriptorSet0.vp_c15)._m0[6].z);
    float _729 = fma(_725, (*spvDescriptorSet0.vp_c15)._m0[6].x, (*spvDescriptorSet0.vp_c15)._m0[6].w);
    float _731 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _727);
    float _733 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _729);
    float2 _2153 = float2(_731, _733);
    float _735 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2153, float2(0.0), isnan(_2153)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2153, float2(0.0), isnan(_2153)), level(0.0)).x;
    float _737 = fma(_721, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    bool _739 = 0 != as_type<int>((*spvDescriptorSet0.vp_c12)._m0[4].y);
    float _741 = fma(_725, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _743 = fma(_735, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _745 = _743 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _747 = _743 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _749 = _743 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _751 = fma(_737, (*spvDescriptorSet0.vp_c4)._m0[0].x, _745);
    float _753 = fma(_737, (*spvDescriptorSet0.vp_c4)._m0[1].x, _747);
    float _755 = fma(_737, (*spvDescriptorSet0.vp_c4)._m0[2].x, _749);
    float _757 = fma(_741, (*spvDescriptorSet0.vp_c4)._m0[0].z, _751);
    float _759 = fma(_741, (*spvDescriptorSet0.vp_c4)._m0[1].z, _753);
    float _761 = fma(_741, (*spvDescriptorSet0.vp_c4)._m0[2].z, _755);
    float _763 = _757 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _765 = _759 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _767 = _761 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _769 = _761;
    float _771 = _759;
    int _903;
    int _905;
    int _907;
    int _909;
    if (!_739)
    {
        float _773 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
        float _775 = _741 + _773;
        float _777 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
        float _779 = _737 + _777;
        float _781 = _775 * _775;
        float _783 = fma(_779, _779, _781);
        float _785 = sqrt(_783);
        bool _787 = _785 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _789 = _781;
        if (!_787)
        {
            _769 = _767;
        }
        float _791 = _769;
        float _793 = _791;
        if (!_787)
        {
            _771 = _765;
        }
        float _795 = _771;
        float _797 = _795;
        if (!_787)
        {
            _789 = _763;
        }
        float _799 = _789;
        bool _801 = !_787;
        float _803 = _799;
        if (!_801)
        {
            float _805 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
            float _807 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
            float _809 = _785 + _807;
            float _811 = _743 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
            float _813 = rsqrt(_783);
            float _815 = _809 * _805;
            float _817 = _815 * 0.15915493667125701904296875;
            float _819 = _817 * 6.283185482025146484375;
            float _821 = cos(_819);
            float _823 = _817 * 6.283185482025146484375;
            float _825 = sin(_823);
            float _827 = _821 + (-1.0);
            float _829 = _827 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
            float _831 = fma(_825, _811, (*spvDescriptorSet0.vp_c9)._m0[42].y);
            float _833 = fma(_743, _821, _829);
            float _835 = _813 * _831;
            float _837 = _833 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
            float _839 = _833 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
            float _841 = _833 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
            float _843 = fma(_779, _835, (*spvDescriptorSet0.vp_c9)._m0[26].x);
            float _845 = fma(_775, _835, (*spvDescriptorSet0.vp_c9)._m0[26].z);
            float _847 = fma(_843, (*spvDescriptorSet0.vp_c4)._m0[0].x, _837);
            float _849 = fma(_843, (*spvDescriptorSet0.vp_c4)._m0[1].x, _839);
            float _851 = fma(_843, (*spvDescriptorSet0.vp_c4)._m0[2].x, _841);
            float _853 = fma(_845, (*spvDescriptorSet0.vp_c4)._m0[0].z, _847);
            float _855 = fma(_845, (*spvDescriptorSet0.vp_c4)._m0[1].z, _849);
            float _857 = fma(_845, (*spvDescriptorSet0.vp_c4)._m0[2].z, _851);
            float _859 = _853 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
            float _861 = _855 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
            float _863 = _857 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
            _797 = _861;
            _803 = _859;
            _793 = _863;
        }
        float _865 = _797;
        float _867 = _803;
        float _869 = _793;
        float _871 = _865 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
        float _873 = _865 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
        float _875 = _865 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
        float _877 = _865 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
        float _879 = fma(_867, (*spvDescriptorSet0.vp_c4)._m0[7].x, _871);
        float _881 = fma(_867, (*spvDescriptorSet0.vp_c4)._m0[8].x, _873);
        float _883 = fma(_867, (*spvDescriptorSet0.vp_c4)._m0[9].x, _875);
        float _885 = fma(_867, (*spvDescriptorSet0.vp_c4)._m0[10].x, _877);
        float _887 = fma(_869, (*spvDescriptorSet0.vp_c4)._m0[7].z, _879);
        float _889 = fma(_869, (*spvDescriptorSet0.vp_c4)._m0[8].z, _881);
        float _891 = fma(_869, (*spvDescriptorSet0.vp_c4)._m0[9].z, _883);
        float _893 = fma(_869, (*spvDescriptorSet0.vp_c4)._m0[10].z, _885);
        float _895 = _887 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
        float _897 = _889 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
        float _899 = _891 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
        float _901 = _893 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
        _903 = as_type<int>(_895);
        _905 = as_type<int>(_897);
        _907 = as_type<int>(_899);
        _909 = as_type<int>(_901);
        _911 = true;
    }
    else
    {
        float _913 = _765 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
        float _915 = _765 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
        float _917 = _765 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
        float _919 = _765 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
        float _921 = fma(_763, (*spvDescriptorSet0.vp_c4)._m0[7].x, _913);
        float _923 = fma(_763, (*spvDescriptorSet0.vp_c4)._m0[8].x, _915);
        float _925 = fma(_763, (*spvDescriptorSet0.vp_c4)._m0[9].x, _917);
        float _927 = fma(_763, (*spvDescriptorSet0.vp_c4)._m0[10].x, _919);
        float _929 = fma(_767, (*spvDescriptorSet0.vp_c4)._m0[7].z, _921);
        float _931 = fma(_767, (*spvDescriptorSet0.vp_c4)._m0[8].z, _923);
        float _933 = fma(_767, (*spvDescriptorSet0.vp_c4)._m0[9].z, _925);
        float _935 = fma(_767, (*spvDescriptorSet0.vp_c4)._m0[10].z, _927);
        float _937 = _929 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
        float _939 = _931 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
        float _941 = _933 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
        float _943 = _935 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
        _903 = as_type<int>(_937);
        _905 = as_type<int>(_939);
        _907 = as_type<int>(_941);
        _909 = as_type<int>(_943);
    }
    _911 = false;
    int _945 = _903;
    int _947 = _905;
    int _949 = _907;
    int _951 = _909;
    float _2587 = as_type<float>(_945);
    out.gl_Position.x = _2587;
    float _2590 = as_type<float>(_947);
    out.gl_Position.y = _2590;
    float _2593 = as_type<float>(_949);
    out.gl_Position.z = _2593;
    float _2596 = as_type<float>(_951);
    out.gl_Position.w = _2596;
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
    bool _911 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _51 = in.m_37.x;
    float _53 = in.m_37.y;
    float _55 = -(*spvDescriptorSet0.vp_c15)._m0[3].x;
    float _57 = _55 + (*spvDescriptorSet0.vp_c15)._m0[3].y;
    int _60 = 16 + as_type<int>(as_type<float>(gl_BaseInstance));
    float _62 = -(*spvDescriptorSet0.vp_c15)._m0[3].z;
    float _64 = _62 + (*spvDescriptorSet0.vp_c15)._m0[3].w;
    int _66 = _60 << 4;
    bool _70 = _66 == 0;
    bool _72 = _66 == 16;
    bool _74 = _66 == 32;
    bool _76 = _66 == 48;
    bool _78 = _66 == 64;
    float _80 = fma(_57, _51, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _82 = fma(_64, _51, (*spvDescriptorSet0.vp_c15)._m0[3].z);
    bool _84 = _66 == 80;
    float _86 = as_type<float>(gl_BaseInstance);
    if (_70)
    {
        _86 = (*spvDescriptorSet0.vp_c14)._m0[268].x;
    }
    float _88 = _86;
    float _90 = -_80;
    float _92 = _90 + _82;
    bool _94 = _66 == 96;
    float _96 = fma(_92, _53, _80);
    float _98 = fma(_51, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _100 = 0.0;
    float _102 = _88;
    if (_70)
    {
        _100 = (*spvDescriptorSet0.vp_c14)._m0[268].z;
    }
    float _104 = _100;
    float _106 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _108 = _96 + _106;
    float _110 = _104;
    if (_72)
    {
        _102 = (*spvDescriptorSet0.vp_c14)._m0[269].x;
    }
    float _112 = _102;
    float _114 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _116 = _98 + _114;
    float _118 = fma(_53, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _120 = _108 * _108;
    bool _122 = _66 == 112;
    float _124 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _126 = _118 + _124;
    float _128 = fma(_116, _116, _120);
    float _130 = _112;
    if (_72)
    {
        _110 = (*spvDescriptorSet0.vp_c14)._m0[269].z;
    }
    float _132 = _110;
    float _134 = _132;
    if (_74)
    {
        _130 = (*spvDescriptorSet0.vp_c14)._m0[270].x;
    }
    float _136 = _130;
    float _138 = fma(_126, _126, _128);
    bool _140 = _66 == 128;
    float _142 = _136;
    if (_74)
    {
        _134 = (*spvDescriptorSet0.vp_c14)._m0[270].z;
    }
    float _144 = _134;
    float _146 = rsqrt(_138);
    float _148 = _144;
    if (_76)
    {
        _142 = (*spvDescriptorSet0.vp_c14)._m0[271].x;
    }
    float _150 = _142;
    bool _152 = _66 == 144;
    float _154 = _150;
    if (_76)
    {
        _148 = (*spvDescriptorSet0.vp_c14)._m0[271].z;
    }
    float _156 = _148;
    float _158 = _156;
    if (_78)
    {
        _154 = (*spvDescriptorSet0.vp_c14)._m0[272].x;
    }
    float _160 = _154;
    bool _162 = _66 == 160;
    float _164 = _160;
    if (_78)
    {
        _158 = (*spvDescriptorSet0.vp_c14)._m0[272].z;
    }
    float _166 = _158;
    float _168 = _166;
    if (_84)
    {
        _164 = (*spvDescriptorSet0.vp_c14)._m0[273].x;
    }
    float _170 = _164;
    bool _172 = _66 == 176;
    float _174 = _146 * (*spvDescriptorSet0.vp_c14)._m0[268].x;
    float _176 = _170;
    if (_84)
    {
        _168 = (*spvDescriptorSet0.vp_c14)._m0[273].z;
    }
    float _178 = _168;
    bool _180 = _66 == 192;
    float _182 = _178;
    if (_94)
    {
        _176 = (*spvDescriptorSet0.vp_c14)._m0[274].x;
    }
    float _184 = _176;
    float _186 = log2(_174);
    float _188 = _184;
    if (_94)
    {
        _182 = (*spvDescriptorSet0.vp_c14)._m0[274].z;
    }
    float _190 = _182;
    float _192 = _190;
    if (_122)
    {
        _188 = (*spvDescriptorSet0.vp_c14)._m0[275].x;
    }
    float _194 = _188;
    bool _196 = _66 == 208;
    float _198 = _194;
    if (_122)
    {
        _192 = (*spvDescriptorSet0.vp_c14)._m0[275].z;
    }
    float _200 = _192;
    float _202 = _200;
    if (_140)
    {
        _198 = (*spvDescriptorSet0.vp_c14)._m0[276].x;
    }
    float _204 = _198;
    bool _206 = _66 == 224;
    float _208 = _204;
    if (_140)
    {
        _202 = (*spvDescriptorSet0.vp_c14)._m0[276].z;
    }
    float _210 = _202;
    float _212 = _210;
    if (_152)
    {
        _208 = (*spvDescriptorSet0.vp_c14)._m0[277].x;
    }
    float _214 = _208;
    float _216 = _186 + 1.2999999523162841796875;
    bool _218 = _66 == 240;
    float _220 = _214;
    if (_152)
    {
        _212 = (*spvDescriptorSet0.vp_c14)._m0[277].z;
    }
    float _222 = _212;
    float _224 = _222;
    if (_162)
    {
        _220 = (*spvDescriptorSet0.vp_c14)._m0[278].x;
    }
    float _226 = _220;
    float _228 = trunc(_216);
    int _230 = int(_228);
    bool _232 = _66 == 256;
    float _234 = _226;
    if (_162)
    {
        _224 = (*spvDescriptorSet0.vp_c14)._m0[278].z;
    }
    float _236 = _224;
    float _238 = _236;
    if (_172)
    {
        _234 = (*spvDescriptorSet0.vp_c14)._m0[279].x;
    }
    float _240 = _234;
    bool _242 = _66 == 272;
    float _244 = _240;
    if (_172)
    {
        _238 = (*spvDescriptorSet0.vp_c14)._m0[279].z;
    }
    float _246 = _238;
    float _248 = _246;
    if (_180)
    {
        _244 = (*spvDescriptorSet0.vp_c14)._m0[280].x;
    }
    float _250 = _244;
    bool _252 = _66 == 288;
    float _254 = _250;
    if (_180)
    {
        _248 = (*spvDescriptorSet0.vp_c14)._m0[280].z;
    }
    float _256 = _248;
    int _258 = min(_230, 15);
    bool _260 = _66 == 304;
    float _262 = _256;
    if (_196)
    {
        _254 = (*spvDescriptorSet0.vp_c14)._m0[281].x;
    }
    float _264 = _254;
    float _266 = float(_258);
    float _268 = _264;
    if (_196)
    {
        _262 = (*spvDescriptorSet0.vp_c14)._m0[281].z;
    }
    float _270 = _262;
    int _272 = _258 << 4;
    int _274 = _272 + 4288;
    float _276 = _270;
    if (_206)
    {
        _268 = (*spvDescriptorSet0.vp_c14)._m0[282].x;
    }
    float _278 = _268;
    bool _280 = _66 == 320;
    float _282 = -_266;
    float _284 = _282 + (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _286 = _278;
    if (_206)
    {
        _276 = (*spvDescriptorSet0.vp_c14)._m0[282].z;
    }
    float _288 = _276;
    float _290 = _288;
    if (_218)
    {
        _286 = (*spvDescriptorSet0.vp_c14)._m0[283].x;
    }
    float _292 = _286;
    float _294 = _284 + 1.0;
    bool _296 = _66 == 336;
    float _298 = _292;
    if (_218)
    {
        _290 = (*spvDescriptorSet0.vp_c14)._m0[283].z;
    }
    float _300 = _290;
    float _302 = _300;
    if (_232)
    {
        _298 = (*spvDescriptorSet0.vp_c14)._m0[284].x;
    }
    float _304 = _298;
    float _306 = exp2(_294);
    bool _308 = _66 == 352;
    float _310 = _304;
    if (_232)
    {
        _302 = (*spvDescriptorSet0.vp_c14)._m0[284].z;
    }
    float _312 = _302;
    float _314 = _312;
    if (_242)
    {
        _310 = (*spvDescriptorSet0.vp_c14)._m0[285].x;
    }
    float _316 = _310;
    bool _318 = _66 == 368;
    float _320 = _316;
    if (_242)
    {
        _314 = (*spvDescriptorSet0.vp_c14)._m0[285].z;
    }
    float _322 = _314;
    float _324 = _322;
    if (_252)
    {
        _320 = (*spvDescriptorSet0.vp_c14)._m0[286].x;
    }
    float _326 = _320;
    bool _328 = _66 == 384;
    float _330 = _326;
    if (_252)
    {
        _324 = (*spvDescriptorSet0.vp_c14)._m0[286].z;
    }
    float _332 = _324;
    float _334 = 1.0 / _306;
    float _336 = _332;
    if (_260)
    {
        _330 = (*spvDescriptorSet0.vp_c14)._m0[287].x;
    }
    float _338 = _330;
    bool _340 = _66 == 400;
    float _342 = _338;
    if (_260)
    {
        _336 = (*spvDescriptorSet0.vp_c14)._m0[287].z;
    }
    float _344 = _336;
    bool _346 = _66 == 416;
    float _348 = _344;
    if (_280)
    {
        _342 = (*spvDescriptorSet0.vp_c14)._m0[288].x;
    }
    float _350 = _342;
    float _352 = _350;
    if (_280)
    {
        _348 = (*spvDescriptorSet0.vp_c14)._m0[288].z;
    }
    float _354 = _348;
    float _356 = _354;
    if (_296)
    {
        _352 = (*spvDescriptorSet0.vp_c14)._m0[289].x;
    }
    float _358 = _352;
    bool _360 = _66 == 432;
    float _362 = _358;
    if (_296)
    {
        _356 = (*spvDescriptorSet0.vp_c14)._m0[289].z;
    }
    float _364 = _356;
    float _366 = _364;
    if (_308)
    {
        _362 = (*spvDescriptorSet0.vp_c14)._m0[290].x;
    }
    float _368 = _362;
    bool _370 = _66 == 448;
    float _372 = _368;
    if (_308)
    {
        _366 = (*spvDescriptorSet0.vp_c14)._m0[290].z;
    }
    float _374 = _366;
    float _376 = _374;
    if (_318)
    {
        _372 = (*spvDescriptorSet0.vp_c14)._m0[291].x;
    }
    float _378 = _372;
    bool _380 = _66 == 464;
    float _382 = _378;
    if (_318)
    {
        _376 = (*spvDescriptorSet0.vp_c14)._m0[291].z;
    }
    float _384 = _376;
    float _386 = _384;
    if (_328)
    {
        _382 = (*spvDescriptorSet0.vp_c14)._m0[292].x;
    }
    float _388 = _382;
    bool _390 = _66 == 480;
    float _392 = _388;
    if (_328)
    {
        _386 = (*spvDescriptorSet0.vp_c14)._m0[292].z;
    }
    float _394 = _386;
    float _396 = _394;
    if (_340)
    {
        _392 = (*spvDescriptorSet0.vp_c14)._m0[293].x;
    }
    float _398 = _392;
    bool _400 = _66 == 496;
    float _402 = _398;
    if (_340)
    {
        _396 = (*spvDescriptorSet0.vp_c14)._m0[293].z;
    }
    float _404 = _396;
    float _406 = _404;
    if (_346)
    {
        _402 = (*spvDescriptorSet0.vp_c14)._m0[294].x;
    }
    float _408 = _402;
    bool _410 = _66 == 512;
    float _412 = _408;
    if (_346)
    {
        _406 = (*spvDescriptorSet0.vp_c14)._m0[294].z;
    }
    float _414 = _406;
    bool _416 = _66 == 528;
    float _418 = _414;
    if (_360)
    {
        _412 = (*spvDescriptorSet0.vp_c14)._m0[295].x;
    }
    float _420 = _412;
    float _422 = _420;
    if (_360)
    {
        _418 = (*spvDescriptorSet0.vp_c14)._m0[295].z;
    }
    float _424 = _418;
    float _426 = _424;
    if (_370)
    {
        _422 = (*spvDescriptorSet0.vp_c14)._m0[296].x;
    }
    float _428 = _422;
    bool _430 = _66 == 544;
    float _432 = _428;
    if (_370)
    {
        _426 = (*spvDescriptorSet0.vp_c14)._m0[296].z;
    }
    float _434 = _426;
    float _436 = _434;
    if (_380)
    {
        _432 = (*spvDescriptorSet0.vp_c14)._m0[297].x;
    }
    float _438 = _432;
    bool _440 = _66 == 560;
    float _442 = _438;
    if (_380)
    {
        _436 = (*spvDescriptorSet0.vp_c14)._m0[297].z;
    }
    float _444 = _436;
    float _446 = _444;
    if (_390)
    {
        _442 = (*spvDescriptorSet0.vp_c14)._m0[298].x;
    }
    float _448 = _442;
    bool _450 = _66 == 576;
    float _452 = _448;
    if (_390)
    {
        _446 = (*spvDescriptorSet0.vp_c14)._m0[298].z;
    }
    float _454 = _446;
    float _456 = _454;
    if (_400)
    {
        _452 = (*spvDescriptorSet0.vp_c14)._m0[299].x;
    }
    float _458 = _452;
    bool _460 = _66 == 592;
    float _462 = _458;
    if (_400)
    {
        _456 = (*spvDescriptorSet0.vp_c14)._m0[299].z;
    }
    float _464 = _456;
    float _466 = _464;
    if (_410)
    {
        _462 = (*spvDescriptorSet0.vp_c14)._m0[300].x;
    }
    float _468 = _462;
    bool _470 = _66 == 608;
    float _472 = _468;
    if (_410)
    {
        _466 = (*spvDescriptorSet0.vp_c14)._m0[300].z;
    }
    float _474 = _466;
    float _476 = _474;
    if (_416)
    {
        _472 = (*spvDescriptorSet0.vp_c14)._m0[301].x;
    }
    float _478 = _472;
    bool _480 = _66 == 624;
    float _482 = _478;
    if (_416)
    {
        _476 = (*spvDescriptorSet0.vp_c14)._m0[301].z;
    }
    float _484 = _476;
    bool _486 = _66 == 640;
    float _488 = _484;
    if (_430)
    {
        _482 = (*spvDescriptorSet0.vp_c14)._m0[302].x;
    }
    float _490 = _482;
    float _492 = _490;
    if (_430)
    {
        _488 = (*spvDescriptorSet0.vp_c14)._m0[302].z;
    }
    float _494 = _488;
    float _496 = _494;
    if (_440)
    {
        _492 = (*spvDescriptorSet0.vp_c14)._m0[303].x;
    }
    float _498 = _492;
    bool _500 = _66 == 656;
    float _502 = _498;
    if (_440)
    {
        _496 = (*spvDescriptorSet0.vp_c14)._m0[303].z;
    }
    float _504 = _496;
    float _506 = _504;
    if (_450)
    {
        _502 = (*spvDescriptorSet0.vp_c14)._m0[304].x;
    }
    float _508 = _502;
    bool _510 = _66 == 672;
    float _512 = _508;
    if (_450)
    {
        _506 = (*spvDescriptorSet0.vp_c14)._m0[304].z;
    }
    float _514 = _506;
    float _516 = _514;
    if (_460)
    {
        _512 = (*spvDescriptorSet0.vp_c14)._m0[305].x;
    }
    float _518 = _512;
    bool _520 = _66 == 688;
    float _522 = _518;
    if (_460)
    {
        _516 = (*spvDescriptorSet0.vp_c14)._m0[305].z;
    }
    float _524 = _516;
    float _526 = _524;
    if (_470)
    {
        _522 = (*spvDescriptorSet0.vp_c14)._m0[306].x;
    }
    float _528 = _522;
    bool _530 = _66 == 704;
    float _532 = _528;
    if (_470)
    {
        _526 = (*spvDescriptorSet0.vp_c14)._m0[306].z;
    }
    float _534 = _526;
    float _536 = _534;
    if (_480)
    {
        _532 = (*spvDescriptorSet0.vp_c14)._m0[307].x;
    }
    float _538 = _532;
    bool _540 = _66 == 720;
    float _542 = _538;
    if (_480)
    {
        _536 = (*spvDescriptorSet0.vp_c14)._m0[307].z;
    }
    float _544 = _536;
    float _546 = _544;
    if (_486)
    {
        _542 = (*spvDescriptorSet0.vp_c14)._m0[308].x;
    }
    float _548 = _542;
    bool _550 = _66 == 736;
    float _552 = _548;
    if (_486)
    {
        _546 = (*spvDescriptorSet0.vp_c14)._m0[308].z;
    }
    float _554 = _546;
    bool _556 = _66 == 752;
    float _558 = _554;
    if (_500)
    {
        _552 = (*spvDescriptorSet0.vp_c14)._m0[309].x;
    }
    float _560 = _552;
    float _562 = _560;
    if (_510)
    {
        _562 = (*spvDescriptorSet0.vp_c14)._m0[310].x;
    }
    float _564 = _562;
    float _566 = _564;
    if (_520)
    {
        _566 = (*spvDescriptorSet0.vp_c14)._m0[311].x;
    }
    float _568 = _566;
    float _570 = _568;
    if (_530)
    {
        _570 = (*spvDescriptorSet0.vp_c14)._m0[312].x;
    }
    float _572 = _570;
    float _574 = _572;
    if (_540)
    {
        _574 = (*spvDescriptorSet0.vp_c14)._m0[313].x;
    }
    float _576 = _574;
    float _578 = _576;
    if (_550)
    {
        _578 = (*spvDescriptorSet0.vp_c14)._m0[314].x;
    }
    float _580 = _578;
    float _582 = _580;
    if (_556)
    {
        _582 = (*spvDescriptorSet0.vp_c14)._m0[315].x;
    }
    float _584 = _582;
    float _586 = _334 * _584;
    if (_500)
    {
        _558 = (*spvDescriptorSet0.vp_c14)._m0[309].z;
    }
    float _588 = _558;
    float _590 = _588;
    if (_510)
    {
        _590 = (*spvDescriptorSet0.vp_c14)._m0[310].z;
    }
    float _592 = _590;
    float _594 = _586 * _51;
    float _596 = _586 * _53;
    float _598 = _592;
    if (_520)
    {
        _598 = (*spvDescriptorSet0.vp_c14)._m0[311].z;
    }
    float _600 = _598;
    float _602 = floor(_594);
    float _604 = _600;
    if (_530)
    {
        _604 = (*spvDescriptorSet0.vp_c14)._m0[312].z;
    }
    float _606 = _604;
    float _608 = _606;
    if (_540)
    {
        _608 = (*spvDescriptorSet0.vp_c14)._m0[313].z;
    }
    float _610 = _608;
    float _612 = _610;
    if (_550)
    {
        _612 = (*spvDescriptorSet0.vp_c14)._m0[314].z;
    }
    float _614 = _612;
    float _616 = _614;
    if (_556)
    {
        _616 = (*spvDescriptorSet0.vp_c14)._m0[315].z;
    }
    float _618 = _616;
    float _620 = floor(_596);
    float _622 = _306 * _618;
    float _624 = -_602;
    float _626 = _594 + _624;
    float _628 = _626 * 2.0;
    float _630 = -_626;
    float _632 = fma(_622, _630, _51);
    int _634 = _274 + 8;
    uint _637 = uint(int(uint(_634) >> uint(2)));
    uint _639 = uint(int(uint(int(_637)) >> uint(2)));
    int _641 = int(_637) & 3;
    float _643 = (*spvDescriptorSet0.vp_c14)._m0[int(_639)][_641];
    int _645 = int(_637) + 1;
    uint _647 = uint(int(uint(_645) >> uint(2)));
    int _649 = _645 & 3;
    float _651 = (*spvDescriptorSet0.vp_c14)._m0[int(_647)][_649];
    float _653 = -_620;
    float _655 = _596 + _653;
    float _657 = floor(_628);
    float _659 = _655 * 2.0;
    float _661 = -_655;
    float _663 = fma(_622, _661, _53);
    float _665 = floor(_659);
    float _667 = _622 * _657;
    float _669 = _667 * 0.5;
    float _671 = _669 + _632;
    float _673 = fma(_57, _671, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _675 = _622 * _665;
    float _677 = _675 * 0.5;
    float _679 = fma(_64, _671, (*spvDescriptorSet0.vp_c15)._m0[3].z);
    float _681 = fma(_671, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _683 = _677 + _663;
    float _685 = -_673;
    float _687 = _685 + _679;
    float _689 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _691 = _681 + _689;
    float _693 = fma(_683, _687, _673);
    float _695 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _697 = _693 + _695;
    float _699 = fma(_683, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _701 = _697 * _697;
    float _703 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _705 = _699 + _703;
    float _707 = fma(_691, _691, _701);
    float _709 = fma(_705, _705, _707);
    float _711 = sqrt(_709);
    float _713 = -_651;
    float _715 = fma(_711, _643, _713);
    float _717 = precise::clamp(_715, 0.0, 1.0);
    float _719 = -_669;
    float _721 = fma(_719, _717, _671);
    float _723 = -_677;
    float _725 = fma(_723, _717, _683);
    float _727 = fma(_721, (*spvDescriptorSet0.vp_c15)._m0[6].x, (*spvDescriptorSet0.vp_c15)._m0[6].z);
    float _729 = fma(_725, (*spvDescriptorSet0.vp_c15)._m0[6].x, (*spvDescriptorSet0.vp_c15)._m0[6].w);
    float _731 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _727);
    float _733 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _729);
    float2 _2153 = float2(_731, _733);
    float _735 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2153, float2(0.0), isnan(_2153)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2153, float2(0.0), isnan(_2153)), level(0.0)).x;
    float _737 = fma(_721, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    bool _739 = 0 != as_type<int>((*spvDescriptorSet0.vp_c12)._m0[4].y);
    float _741 = fma(_725, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _743 = fma(_735, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _745 = _743 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _747 = _743 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _749 = _743 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _751 = fma(_737, (*spvDescriptorSet0.vp_c4)._m0[0].x, _745);
    float _753 = fma(_737, (*spvDescriptorSet0.vp_c4)._m0[1].x, _747);
    float _755 = fma(_737, (*spvDescriptorSet0.vp_c4)._m0[2].x, _749);
    float _757 = fma(_741, (*spvDescriptorSet0.vp_c4)._m0[0].z, _751);
    float _759 = fma(_741, (*spvDescriptorSet0.vp_c4)._m0[1].z, _753);
    float _761 = fma(_741, (*spvDescriptorSet0.vp_c4)._m0[2].z, _755);
    float _763 = _757 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _765 = _759 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _767 = _761 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _769 = _761;
    float _771 = _759;
    int _903;
    int _905;
    int _907;
    int _909;
    if (!_739)
    {
        float _773 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
        float _775 = _741 + _773;
        float _777 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
        float _779 = _737 + _777;
        float _781 = _775 * _775;
        float _783 = fma(_779, _779, _781);
        float _785 = sqrt(_783);
        bool _787 = _785 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _789 = _781;
        if (!_787)
        {
            _769 = _767;
        }
        float _791 = _769;
        float _793 = _791;
        if (!_787)
        {
            _771 = _765;
        }
        float _795 = _771;
        float _797 = _795;
        if (!_787)
        {
            _789 = _763;
        }
        float _799 = _789;
        bool _801 = !_787;
        float _803 = _799;
        if (!_801)
        {
            float _805 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
            float _807 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
            float _809 = _785 + _807;
            float _811 = _743 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
            float _813 = rsqrt(_783);
            float _815 = _809 * _805;
            float _817 = _815 * 0.15915493667125701904296875;
            float _819 = _817 * 6.283185482025146484375;
            float _821 = cos(_819);
            float _823 = _817 * 6.283185482025146484375;
            float _825 = sin(_823);
            float _827 = _821 + (-1.0);
            float _829 = _827 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
            float _831 = fma(_825, _811, (*spvDescriptorSet0.vp_c9)._m0[42].y);
            float _833 = fma(_743, _821, _829);
            float _835 = _813 * _831;
            float _837 = _833 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
            float _839 = _833 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
            float _841 = _833 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
            float _843 = fma(_779, _835, (*spvDescriptorSet0.vp_c9)._m0[26].x);
            float _845 = fma(_775, _835, (*spvDescriptorSet0.vp_c9)._m0[26].z);
            float _847 = fma(_843, (*spvDescriptorSet0.vp_c4)._m0[0].x, _837);
            float _849 = fma(_843, (*spvDescriptorSet0.vp_c4)._m0[1].x, _839);
            float _851 = fma(_843, (*spvDescriptorSet0.vp_c4)._m0[2].x, _841);
            float _853 = fma(_845, (*spvDescriptorSet0.vp_c4)._m0[0].z, _847);
            float _855 = fma(_845, (*spvDescriptorSet0.vp_c4)._m0[1].z, _849);
            float _857 = fma(_845, (*spvDescriptorSet0.vp_c4)._m0[2].z, _851);
            float _859 = _853 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
            float _861 = _855 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
            float _863 = _857 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
            _797 = _861;
            _803 = _859;
            _793 = _863;
        }
        float _865 = _797;
        float _867 = _803;
        float _869 = _793;
        float _871 = _865 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
        float _873 = _865 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
        float _875 = _865 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
        float _877 = _865 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
        float _879 = fma(_867, (*spvDescriptorSet0.vp_c4)._m0[7].x, _871);
        float _881 = fma(_867, (*spvDescriptorSet0.vp_c4)._m0[8].x, _873);
        float _883 = fma(_867, (*spvDescriptorSet0.vp_c4)._m0[9].x, _875);
        float _885 = fma(_867, (*spvDescriptorSet0.vp_c4)._m0[10].x, _877);
        float _887 = fma(_869, (*spvDescriptorSet0.vp_c4)._m0[7].z, _879);
        float _889 = fma(_869, (*spvDescriptorSet0.vp_c4)._m0[8].z, _881);
        float _891 = fma(_869, (*spvDescriptorSet0.vp_c4)._m0[9].z, _883);
        float _893 = fma(_869, (*spvDescriptorSet0.vp_c4)._m0[10].z, _885);
        float _895 = _887 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
        float _897 = _889 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
        float _899 = _891 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
        float _901 = _893 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
        _903 = as_type<int>(_895);
        _905 = as_type<int>(_897);
        _907 = as_type<int>(_899);
        _909 = as_type<int>(_901);
        _911 = true;
    }
    else
    {
        float _913 = _765 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
        float _915 = _765 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
        float _917 = _765 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
        float _919 = _765 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
        float _921 = fma(_763, (*spvDescriptorSet0.vp_c4)._m0[7].x, _913);
        float _923 = fma(_763, (*spvDescriptorSet0.vp_c4)._m0[8].x, _915);
        float _925 = fma(_763, (*spvDescriptorSet0.vp_c4)._m0[9].x, _917);
        float _927 = fma(_763, (*spvDescriptorSet0.vp_c4)._m0[10].x, _919);
        float _929 = fma(_767, (*spvDescriptorSet0.vp_c4)._m0[7].z, _921);
        float _931 = fma(_767, (*spvDescriptorSet0.vp_c4)._m0[8].z, _923);
        float _933 = fma(_767, (*spvDescriptorSet0.vp_c4)._m0[9].z, _925);
        float _935 = fma(_767, (*spvDescriptorSet0.vp_c4)._m0[10].z, _927);
        float _937 = _929 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
        float _939 = _931 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
        float _941 = _933 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
        float _943 = _935 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
        _903 = as_type<int>(_937);
        _905 = as_type<int>(_939);
        _907 = as_type<int>(_941);
        _909 = as_type<int>(_943);
    }
    _911 = false;
    int _945 = _903;
    int _947 = _905;
    int _949 = _907;
    int _951 = _909;
    float _2587 = as_type<float>(_945);
    out.gl_Position.x = _2587;
    float _2590 = as_type<float>(_947);
    out.gl_Position.y = _2590;
    float _2593 = as_type<float>(_949);
    out.gl_Position.z = _2593;
    float _2596 = as_type<float>(_951);
    out.gl_Position.w = _2596;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, 0u); dm_cw(dm_gs, dm_p, 17, 0u); dm_cw(dm_gs, dm_p, 18, 0u); dm_cw(dm_gs, dm_p, 19, 0x3f800000u); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

