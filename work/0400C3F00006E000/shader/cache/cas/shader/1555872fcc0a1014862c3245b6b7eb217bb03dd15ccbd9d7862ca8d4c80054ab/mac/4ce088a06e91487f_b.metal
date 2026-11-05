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
    sampler vp_t_tcb_8Smplr_w [[id(7)]];
    constant dm_border_t* dm_border [[id(8)]];
};

struct main0_out
{
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_35 [[attribute(0)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_BaseInstance [[base_instance]])
{
    main0_out out = {};
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _49 = in.m_35.x;
    float _51 = in.m_35.y;
    float _53 = -(*spvDescriptorSet0.vp_c15)._m0[3].x;
    float _55 = _53 + (*spvDescriptorSet0.vp_c15)._m0[3].y;
    int _58 = 16 + as_type<int>(as_type<float>(gl_BaseInstance));
    float _60 = -(*spvDescriptorSet0.vp_c15)._m0[3].z;
    float _62 = _60 + (*spvDescriptorSet0.vp_c15)._m0[3].w;
    int _64 = _58 << 4;
    bool _68 = _64 == 0;
    bool _70 = _64 == 16;
    bool _72 = _64 == 32;
    bool _74 = _64 == 48;
    bool _76 = _64 == 64;
    float _78 = fma(_55, _49, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _80 = fma(_62, _49, (*spvDescriptorSet0.vp_c15)._m0[3].z);
    bool _82 = _64 == 80;
    float _84 = as_type<float>(gl_BaseInstance);
    if (_68)
    {
        _84 = (*spvDescriptorSet0.vp_c14)._m0[268].x;
    }
    float _86 = _84;
    float _88 = -_78;
    float _90 = _88 + _80;
    bool _92 = _64 == 96;
    float _94 = fma(_90, _51, _78);
    float _96 = fma(_49, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _98 = 0.0;
    float _100 = _86;
    float _102 = (*spvDescriptorSet0.vp_c15)._m0[0].y;
    if (_68)
    {
        _98 = (*spvDescriptorSet0.vp_c14)._m0[268].z;
    }
    float _104 = _98;
    float _106 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _108 = _94 + _106;
    float _110 = _104;
    if (_70)
    {
        _100 = (*spvDescriptorSet0.vp_c14)._m0[269].x;
    }
    float _112 = _100;
    float _114 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _116 = _96 + _114;
    float _118 = fma(_51, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _120 = _108 * _108;
    bool _122 = _64 == 112;
    float _124 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _126 = _118 + _124;
    float _128 = fma(_116, _116, _120);
    float _130 = _112;
    if (_70)
    {
        _110 = (*spvDescriptorSet0.vp_c14)._m0[269].z;
    }
    float _132 = _110;
    float _134 = _132;
    if (_72)
    {
        _130 = (*spvDescriptorSet0.vp_c14)._m0[270].x;
    }
    float _136 = _130;
    float _138 = fma(_126, _126, _128);
    bool _140 = _64 == 128;
    float _142 = _136;
    if (_72)
    {
        _134 = (*spvDescriptorSet0.vp_c14)._m0[270].z;
    }
    float _144 = _134;
    float _146 = rsqrt(_138);
    float _148 = _144;
    if (_74)
    {
        _142 = (*spvDescriptorSet0.vp_c14)._m0[271].x;
    }
    float _150 = _142;
    bool _152 = _64 == 144;
    float _154 = _150;
    if (_74)
    {
        _148 = (*spvDescriptorSet0.vp_c14)._m0[271].z;
    }
    float _156 = _148;
    float _158 = _156;
    if (_76)
    {
        _154 = (*spvDescriptorSet0.vp_c14)._m0[272].x;
    }
    float _160 = _154;
    bool _162 = _64 == 160;
    float _164 = _160;
    if (_76)
    {
        _158 = (*spvDescriptorSet0.vp_c14)._m0[272].z;
    }
    float _166 = _158;
    float _168 = _166;
    if (_82)
    {
        _164 = (*spvDescriptorSet0.vp_c14)._m0[273].x;
    }
    float _170 = _164;
    bool _172 = _64 == 176;
    float _174 = _146 * (*spvDescriptorSet0.vp_c14)._m0[268].x;
    float _176 = _170;
    if (_82)
    {
        _168 = (*spvDescriptorSet0.vp_c14)._m0[273].z;
    }
    float _178 = _168;
    bool _180 = _64 == 192;
    float _182 = _178;
    if (_92)
    {
        _176 = (*spvDescriptorSet0.vp_c14)._m0[274].x;
    }
    float _184 = _176;
    float _186 = log2(_174);
    float _188 = _184;
    if (_92)
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
    bool _196 = _64 == 208;
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
    bool _206 = _64 == 224;
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
    bool _218 = _64 == 240;
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
    bool _232 = _64 == 256;
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
    bool _242 = _64 == 272;
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
    bool _252 = _64 == 288;
    float _254 = _250;
    if (_180)
    {
        _248 = (*spvDescriptorSet0.vp_c14)._m0[280].z;
    }
    float _256 = _248;
    int _258 = min(_230, 15);
    bool _260 = _64 == 304;
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
    float _278 = as_type<float>(_274);
    if (_206)
    {
        _268 = (*spvDescriptorSet0.vp_c14)._m0[282].x;
    }
    float _280 = _268;
    bool _282 = _64 == 320;
    float _284 = -_266;
    float _286 = _284 + (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _288 = _280;
    if (_206)
    {
        _276 = (*spvDescriptorSet0.vp_c14)._m0[282].z;
    }
    float _290 = _276;
    float _292 = _290;
    if (_218)
    {
        _288 = (*spvDescriptorSet0.vp_c14)._m0[283].x;
    }
    float _294 = _288;
    float _296 = _286 + 1.0;
    bool _298 = _64 == 336;
    float _300 = _294;
    if (_218)
    {
        _292 = (*spvDescriptorSet0.vp_c14)._m0[283].z;
    }
    float _302 = _292;
    float _304 = _302;
    if (_232)
    {
        _300 = (*spvDescriptorSet0.vp_c14)._m0[284].x;
    }
    float _306 = _300;
    float _308 = exp2(_296);
    bool _310 = _64 == 352;
    float _312 = _306;
    if (_232)
    {
        _304 = (*spvDescriptorSet0.vp_c14)._m0[284].z;
    }
    float _314 = _304;
    float _316 = _314;
    if (_242)
    {
        _312 = (*spvDescriptorSet0.vp_c14)._m0[285].x;
    }
    float _318 = _312;
    bool _320 = _64 == 368;
    float _322 = _318;
    if (_242)
    {
        _316 = (*spvDescriptorSet0.vp_c14)._m0[285].z;
    }
    float _324 = _316;
    float _326 = _324;
    if (_252)
    {
        _322 = (*spvDescriptorSet0.vp_c14)._m0[286].x;
    }
    float _328 = _322;
    bool _330 = _64 == 384;
    float _332 = _328;
    if (_252)
    {
        _326 = (*spvDescriptorSet0.vp_c14)._m0[286].z;
    }
    float _334 = _326;
    float _336 = 1.0 / _308;
    float _338 = _334;
    if (_260)
    {
        _332 = (*spvDescriptorSet0.vp_c14)._m0[287].x;
    }
    float _340 = _332;
    bool _342 = _64 == 400;
    float _344 = _340;
    if (_260)
    {
        _338 = (*spvDescriptorSet0.vp_c14)._m0[287].z;
    }
    float _346 = _338;
    bool _348 = _64 == 416;
    float _350 = _346;
    if (_282)
    {
        _344 = (*spvDescriptorSet0.vp_c14)._m0[288].x;
    }
    float _352 = _344;
    float _354 = _352;
    if (_282)
    {
        _350 = (*spvDescriptorSet0.vp_c14)._m0[288].z;
    }
    float _356 = _350;
    float _358 = _356;
    if (_298)
    {
        _354 = (*spvDescriptorSet0.vp_c14)._m0[289].x;
    }
    float _360 = _354;
    bool _362 = _64 == 432;
    float _364 = _360;
    if (_298)
    {
        _358 = (*spvDescriptorSet0.vp_c14)._m0[289].z;
    }
    float _366 = _358;
    float _368 = _366;
    if (_310)
    {
        _364 = (*spvDescriptorSet0.vp_c14)._m0[290].x;
    }
    float _370 = _364;
    bool _372 = _64 == 448;
    float _374 = _370;
    if (_310)
    {
        _368 = (*spvDescriptorSet0.vp_c14)._m0[290].z;
    }
    float _376 = _368;
    float _378 = _376;
    if (_320)
    {
        _374 = (*spvDescriptorSet0.vp_c14)._m0[291].x;
    }
    float _380 = _374;
    bool _382 = _64 == 464;
    float _384 = _380;
    if (_320)
    {
        _378 = (*spvDescriptorSet0.vp_c14)._m0[291].z;
    }
    float _386 = _378;
    float _388 = _386;
    if (_330)
    {
        _384 = (*spvDescriptorSet0.vp_c14)._m0[292].x;
    }
    float _390 = _384;
    bool _392 = _64 == 480;
    float _394 = _390;
    if (_330)
    {
        _388 = (*spvDescriptorSet0.vp_c14)._m0[292].z;
    }
    float _396 = _388;
    float _398 = _396;
    if (_342)
    {
        _394 = (*spvDescriptorSet0.vp_c14)._m0[293].x;
    }
    float _400 = _394;
    bool _402 = _64 == 496;
    float _404 = _400;
    if (_342)
    {
        _398 = (*spvDescriptorSet0.vp_c14)._m0[293].z;
    }
    float _406 = _398;
    float _408 = _406;
    if (_348)
    {
        _404 = (*spvDescriptorSet0.vp_c14)._m0[294].x;
    }
    float _410 = _404;
    bool _412 = _64 == 512;
    float _414 = _410;
    if (_348)
    {
        _408 = (*spvDescriptorSet0.vp_c14)._m0[294].z;
    }
    float _416 = _408;
    bool _418 = _64 == 528;
    float _420 = _416;
    if (_362)
    {
        _414 = (*spvDescriptorSet0.vp_c14)._m0[295].x;
    }
    float _422 = _414;
    float _424 = _422;
    if (_362)
    {
        _420 = (*spvDescriptorSet0.vp_c14)._m0[295].z;
    }
    float _426 = _420;
    float _428 = _426;
    if (_372)
    {
        _424 = (*spvDescriptorSet0.vp_c14)._m0[296].x;
    }
    float _430 = _424;
    bool _432 = _64 == 544;
    float _434 = _430;
    if (_372)
    {
        _428 = (*spvDescriptorSet0.vp_c14)._m0[296].z;
    }
    float _436 = _428;
    float _438 = _436;
    if (_382)
    {
        _434 = (*spvDescriptorSet0.vp_c14)._m0[297].x;
    }
    float _440 = _434;
    bool _442 = _64 == 560;
    float _444 = _440;
    if (_382)
    {
        _438 = (*spvDescriptorSet0.vp_c14)._m0[297].z;
    }
    float _446 = _438;
    float _448 = _446;
    if (_392)
    {
        _444 = (*spvDescriptorSet0.vp_c14)._m0[298].x;
    }
    float _450 = _444;
    bool _452 = _64 == 576;
    float _454 = _450;
    if (_392)
    {
        _448 = (*spvDescriptorSet0.vp_c14)._m0[298].z;
    }
    float _456 = _448;
    float _458 = _456;
    if (_402)
    {
        _454 = (*spvDescriptorSet0.vp_c14)._m0[299].x;
    }
    float _460 = _454;
    bool _462 = _64 == 592;
    float _464 = _460;
    if (_402)
    {
        _458 = (*spvDescriptorSet0.vp_c14)._m0[299].z;
    }
    float _466 = _458;
    float _468 = _466;
    if (_412)
    {
        _464 = (*spvDescriptorSet0.vp_c14)._m0[300].x;
    }
    float _470 = _464;
    bool _472 = _64 == 608;
    float _474 = _470;
    if (_412)
    {
        _468 = (*spvDescriptorSet0.vp_c14)._m0[300].z;
    }
    float _476 = _468;
    float _478 = _476;
    if (_418)
    {
        _474 = (*spvDescriptorSet0.vp_c14)._m0[301].x;
    }
    float _480 = _474;
    bool _482 = _64 == 624;
    float _484 = _480;
    if (_418)
    {
        _478 = (*spvDescriptorSet0.vp_c14)._m0[301].z;
    }
    float _486 = _478;
    bool _488 = _64 == 640;
    float _490 = _486;
    if (_432)
    {
        _484 = (*spvDescriptorSet0.vp_c14)._m0[302].x;
    }
    float _492 = _484;
    float _494 = _492;
    if (_432)
    {
        _490 = (*spvDescriptorSet0.vp_c14)._m0[302].z;
    }
    float _496 = _490;
    float _498 = _496;
    if (_442)
    {
        _494 = (*spvDescriptorSet0.vp_c14)._m0[303].x;
    }
    float _500 = _494;
    bool _502 = _64 == 656;
    float _504 = _500;
    if (_442)
    {
        _498 = (*spvDescriptorSet0.vp_c14)._m0[303].z;
    }
    float _506 = _498;
    float _508 = _506;
    if (_452)
    {
        _504 = (*spvDescriptorSet0.vp_c14)._m0[304].x;
    }
    float _510 = _504;
    bool _512 = _64 == 672;
    float _514 = _510;
    if (_452)
    {
        _508 = (*spvDescriptorSet0.vp_c14)._m0[304].z;
    }
    float _516 = _508;
    float _518 = _516;
    if (_462)
    {
        _514 = (*spvDescriptorSet0.vp_c14)._m0[305].x;
    }
    float _520 = _514;
    bool _522 = _64 == 688;
    float _524 = _520;
    if (_462)
    {
        _518 = (*spvDescriptorSet0.vp_c14)._m0[305].z;
    }
    float _526 = _518;
    float _528 = _526;
    if (_472)
    {
        _524 = (*spvDescriptorSet0.vp_c14)._m0[306].x;
    }
    float _530 = _524;
    bool _532 = _64 == 704;
    float _534 = _530;
    if (_472)
    {
        _528 = (*spvDescriptorSet0.vp_c14)._m0[306].z;
    }
    float _536 = _528;
    float _538 = _536;
    if (_482)
    {
        _534 = (*spvDescriptorSet0.vp_c14)._m0[307].x;
    }
    float _540 = _534;
    bool _542 = _64 == 720;
    float _544 = _540;
    if (_482)
    {
        _538 = (*spvDescriptorSet0.vp_c14)._m0[307].z;
    }
    float _546 = _538;
    float _548 = _546;
    if (_488)
    {
        _544 = (*spvDescriptorSet0.vp_c14)._m0[308].x;
    }
    float _550 = _544;
    bool _552 = _64 == 736;
    float _554 = _550;
    if (_488)
    {
        _548 = (*spvDescriptorSet0.vp_c14)._m0[308].z;
    }
    float _556 = _548;
    bool _558 = _64 == 752;
    float _560 = _556;
    if (_502)
    {
        _554 = (*spvDescriptorSet0.vp_c14)._m0[309].x;
    }
    float _562 = _554;
    float _564 = _562;
    if (_512)
    {
        _564 = (*spvDescriptorSet0.vp_c14)._m0[310].x;
    }
    float _566 = _564;
    float _568 = _566;
    if (_522)
    {
        _568 = (*spvDescriptorSet0.vp_c14)._m0[311].x;
    }
    float _570 = _568;
    float _572 = _570;
    if (_532)
    {
        _572 = (*spvDescriptorSet0.vp_c14)._m0[312].x;
    }
    float _574 = _572;
    float _576 = _574;
    if (_542)
    {
        _576 = (*spvDescriptorSet0.vp_c14)._m0[313].x;
    }
    float _578 = _576;
    float _580 = _578;
    if (_552)
    {
        _580 = (*spvDescriptorSet0.vp_c14)._m0[314].x;
    }
    float _582 = _580;
    float _584 = _582;
    if (_558)
    {
        _584 = (*spvDescriptorSet0.vp_c14)._m0[315].x;
    }
    float _586 = _584;
    float _588 = _336 * _586;
    if (_502)
    {
        _560 = (*spvDescriptorSet0.vp_c14)._m0[309].z;
    }
    float _590 = _560;
    float _592 = _590;
    if (_512)
    {
        _592 = (*spvDescriptorSet0.vp_c14)._m0[310].z;
    }
    float _594 = _592;
    float _596 = _588 * _49;
    float _598 = _588 * _51;
    float _600 = _594;
    if (_522)
    {
        _600 = (*spvDescriptorSet0.vp_c14)._m0[311].z;
    }
    float _602 = _600;
    float _604 = floor(_596);
    float _606 = _602;
    if (_532)
    {
        _606 = (*spvDescriptorSet0.vp_c14)._m0[312].z;
    }
    float _608 = _606;
    float _610 = _608;
    if (_542)
    {
        _610 = (*spvDescriptorSet0.vp_c14)._m0[313].z;
    }
    float _612 = _610;
    float _614 = _612;
    if (_552)
    {
        _614 = (*spvDescriptorSet0.vp_c14)._m0[314].z;
    }
    float _616 = _614;
    float _618 = _616;
    if (_558)
    {
        _618 = (*spvDescriptorSet0.vp_c14)._m0[315].z;
    }
    float _620 = _618;
    float _622 = floor(_598);
    float _624 = _308 * _620;
    float _626 = -_604;
    float _628 = _596 + _626;
    float _630 = _628 * 2.0;
    float _632 = -_628;
    float _634 = fma(_624, _632, _49);
    int _636 = _274 + 8;
    uint _639 = uint(int(uint(_636) >> uint(2)));
    uint _641 = uint(int(uint(int(_639)) >> uint(2)));
    int _643 = int(_639) & 3;
    float _645 = (*spvDescriptorSet0.vp_c14)._m0[int(_641)][_643];
    int _647 = int(_639) + 1;
    uint _649 = uint(int(uint(_647) >> uint(2)));
    int _651 = _647 & 3;
    float _653 = (*spvDescriptorSet0.vp_c14)._m0[int(_649)][_651];
    float _655 = -_622;
    float _657 = _598 + _655;
    float _659 = floor(_630);
    float _661 = _657 * 2.0;
    float _663 = -_657;
    float _665 = fma(_624, _663, _51);
    float _667 = floor(_661);
    float _669 = _624 * _659;
    float _671 = _669 * 0.5;
    float _673 = _671 + _634;
    float _675 = fma(_55, _673, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _677 = _624 * _667;
    float _679 = _677 * 0.5;
    float _681 = fma(_62, _673, (*spvDescriptorSet0.vp_c15)._m0[3].z);
    float _683 = fma(_673, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _685 = _679 + _665;
    float _687 = -_675;
    float _689 = _687 + _681;
    float _691 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _693 = _683 + _691;
    float _695 = fma(_685, _689, _675);
    float _697 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _699 = _695 + _697;
    float _701 = fma(_685, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _703 = _699 * _699;
    float _705 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _707 = _701 + _705;
    float _709 = fma(_693, _693, _703);
    float _711 = fma(_707, _707, _709);
    float _713 = sqrt(_711);
    float _715 = -_653;
    float _717 = fma(_713, _645, _715);
    float _719 = precise::clamp(_717, 0.0, 1.0);
    float _721 = -_671;
    float _723 = fma(_721, _719, _673);
    float _725 = -_679;
    float _727 = fma(_725, _719, _685);
    float _729 = fma(_723, (*spvDescriptorSet0.vp_c15)._m0[6].x, (*spvDescriptorSet0.vp_c15)._m0[6].z);
    float _731 = fma(_727, (*spvDescriptorSet0.vp_c15)._m0[6].x, (*spvDescriptorSet0.vp_c15)._m0[6].w);
    float _733 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _729);
    float _735 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _731);
    float2 _2120 = float2(_733, _735);
    float _737 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2120, float2(0.0), isnan(_2120)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2120, float2(0.0), isnan(_2120)), level(0.0)).x;
    float _739 = fma(_727, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _741 = fma(_723, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _743 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _745 = _739 + _743;
    float _747 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _749 = _741 + _747;
    float _751 = _745 * _745;
    float _753 = fma(_749, _749, _751);
    float _755 = sqrt(_753);
    bool _757 = _755 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _759 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _761 = _755 + _759;
    float _763 = _727;
    float _765 = _761;
    float _767 = (*spvDescriptorSet0.vp_c14)._m0[0].y;
    float _769 = _645;
    if (_757)
    {
        float _771 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        _763 = _771;
    }
    float _773 = _763;
    if (_757)
    {
        float _775 = _761 * _773;
        _765 = _775;
    }
    float _777 = _765;
    if (_757)
    {
        float _779 = _777 * 0.15915493667125701904296875;
        _278 = _779;
    }
    float _781 = _278;
    float _783 = _777;
    if (_757)
    {
        float _785 = _781 * 6.283185482025146484375;
        float _787 = cos(_785);
        _783 = _787;
    }
    float _789 = _783;
    float _791 = _773;
    if (_757)
    {
        float _793 = _781 * 6.283185482025146484375;
        float _795 = sin(_793);
        _791 = _795;
    }
    float _797 = _791;
    float _799 = _735;
    if (_757)
    {
        float _801 = rsqrt(_753);
        _799 = _801;
    }
    float _803 = _799;
    float _805 = fma(_737, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _807 = _789;
    if (_757)
    {
        float _809 = _789 + (-1.0);
        _767 = _809;
    }
    float _811 = _767;
    float _813 = _811;
    if (_757)
    {
        float _815 = _805 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        _102 = _815;
    }
    float _817 = _102;
    float _819 = _817;
    if (_757)
    {
        float _821 = _811 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        _813 = _821;
    }
    float _823 = _813;
    float _825 = _797;
    if (_757)
    {
        float _827 = fma(_797, _817, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        _819 = _827;
    }
    float _829 = _819;
    float _831 = _829;
    if (!_757)
    {
        _825 = _805;
    }
    float _833 = _825;
    float _835 = _833;
    if (_757)
    {
        float _837 = fma(_805, _789, _823);
        _835 = _837;
    }
    float _839 = _835;
    if (!_757)
    {
        _807 = _739;
    }
    float _841 = _807;
    float _843 = _841;
    if (_757)
    {
        float _845 = _803 * _829;
        _769 = _845;
    }
    float _847 = _769;
    if (!_757)
    {
        _831 = _741;
    }
    float _849 = _831;
    float _851 = _839 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _853 = _839 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _855 = _849;
    if (_757)
    {
        float _857 = fma(_749, _847, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        _855 = _857;
    }
    float _859 = _855;
    if (_757)
    {
        float _861 = fma(_745, _847, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        _843 = _861;
    }
    float _863 = _843;
    float _865 = _839 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _867 = fma(_859, (*spvDescriptorSet0.vp_c4)._m0[1].x, _851);
    float _869 = fma(_859, (*spvDescriptorSet0.vp_c4)._m0[0].x, _853);
    float _871 = fma(_859, (*spvDescriptorSet0.vp_c4)._m0[2].x, _865);
    float _873 = fma(_863, (*spvDescriptorSet0.vp_c4)._m0[1].z, _867);
    float _875 = fma(_863, (*spvDescriptorSet0.vp_c4)._m0[0].z, _869);
    float _877 = fma(_863, (*spvDescriptorSet0.vp_c4)._m0[2].z, _871);
    float _879 = _873 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _881 = _875 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _883 = _877 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _885 = _879 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _887 = _879 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _889 = _879 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _891 = _879 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _893 = fma(_881, (*spvDescriptorSet0.vp_c4)._m0[8].x, _885);
    float _895 = fma(_881, (*spvDescriptorSet0.vp_c4)._m0[7].x, _887);
    float _897 = fma(_881, (*spvDescriptorSet0.vp_c4)._m0[9].x, _889);
    float _899 = fma(_881, (*spvDescriptorSet0.vp_c4)._m0[10].x, _891);
    float _901 = fma(_883, (*spvDescriptorSet0.vp_c4)._m0[8].z, _893);
    float _903 = fma(_883, (*spvDescriptorSet0.vp_c4)._m0[7].z, _895);
    float _905 = fma(_883, (*spvDescriptorSet0.vp_c4)._m0[9].z, _897);
    float _907 = fma(_883, (*spvDescriptorSet0.vp_c4)._m0[10].z, _899);
    float _909 = _901 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _911 = _903 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _913 = _905 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _915 = _907 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.gl_Position.x = _911;
    out.gl_Position.y = _909;
    out.gl_Position.z = _913;
    out.gl_Position.w = _915;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_BaseInstance [[base_instance]])
{
    main0_out out = {};
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _49 = in.m_35.x;
    float _51 = in.m_35.y;
    float _53 = -(*spvDescriptorSet0.vp_c15)._m0[3].x;
    float _55 = _53 + (*spvDescriptorSet0.vp_c15)._m0[3].y;
    int _58 = 16 + as_type<int>(as_type<float>(gl_BaseInstance));
    float _60 = -(*spvDescriptorSet0.vp_c15)._m0[3].z;
    float _62 = _60 + (*spvDescriptorSet0.vp_c15)._m0[3].w;
    int _64 = _58 << 4;
    bool _68 = _64 == 0;
    bool _70 = _64 == 16;
    bool _72 = _64 == 32;
    bool _74 = _64 == 48;
    bool _76 = _64 == 64;
    float _78 = fma(_55, _49, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _80 = fma(_62, _49, (*spvDescriptorSet0.vp_c15)._m0[3].z);
    bool _82 = _64 == 80;
    float _84 = as_type<float>(gl_BaseInstance);
    if (_68)
    {
        _84 = (*spvDescriptorSet0.vp_c14)._m0[268].x;
    }
    float _86 = _84;
    float _88 = -_78;
    float _90 = _88 + _80;
    bool _92 = _64 == 96;
    float _94 = fma(_90, _51, _78);
    float _96 = fma(_49, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _98 = 0.0;
    float _100 = _86;
    float _102 = (*spvDescriptorSet0.vp_c15)._m0[0].y;
    if (_68)
    {
        _98 = (*spvDescriptorSet0.vp_c14)._m0[268].z;
    }
    float _104 = _98;
    float _106 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _108 = _94 + _106;
    float _110 = _104;
    if (_70)
    {
        _100 = (*spvDescriptorSet0.vp_c14)._m0[269].x;
    }
    float _112 = _100;
    float _114 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _116 = _96 + _114;
    float _118 = fma(_51, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _120 = _108 * _108;
    bool _122 = _64 == 112;
    float _124 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _126 = _118 + _124;
    float _128 = fma(_116, _116, _120);
    float _130 = _112;
    if (_70)
    {
        _110 = (*spvDescriptorSet0.vp_c14)._m0[269].z;
    }
    float _132 = _110;
    float _134 = _132;
    if (_72)
    {
        _130 = (*spvDescriptorSet0.vp_c14)._m0[270].x;
    }
    float _136 = _130;
    float _138 = fma(_126, _126, _128);
    bool _140 = _64 == 128;
    float _142 = _136;
    if (_72)
    {
        _134 = (*spvDescriptorSet0.vp_c14)._m0[270].z;
    }
    float _144 = _134;
    float _146 = rsqrt(_138);
    float _148 = _144;
    if (_74)
    {
        _142 = (*spvDescriptorSet0.vp_c14)._m0[271].x;
    }
    float _150 = _142;
    bool _152 = _64 == 144;
    float _154 = _150;
    if (_74)
    {
        _148 = (*spvDescriptorSet0.vp_c14)._m0[271].z;
    }
    float _156 = _148;
    float _158 = _156;
    if (_76)
    {
        _154 = (*spvDescriptorSet0.vp_c14)._m0[272].x;
    }
    float _160 = _154;
    bool _162 = _64 == 160;
    float _164 = _160;
    if (_76)
    {
        _158 = (*spvDescriptorSet0.vp_c14)._m0[272].z;
    }
    float _166 = _158;
    float _168 = _166;
    if (_82)
    {
        _164 = (*spvDescriptorSet0.vp_c14)._m0[273].x;
    }
    float _170 = _164;
    bool _172 = _64 == 176;
    float _174 = _146 * (*spvDescriptorSet0.vp_c14)._m0[268].x;
    float _176 = _170;
    if (_82)
    {
        _168 = (*spvDescriptorSet0.vp_c14)._m0[273].z;
    }
    float _178 = _168;
    bool _180 = _64 == 192;
    float _182 = _178;
    if (_92)
    {
        _176 = (*spvDescriptorSet0.vp_c14)._m0[274].x;
    }
    float _184 = _176;
    float _186 = log2(_174);
    float _188 = _184;
    if (_92)
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
    bool _196 = _64 == 208;
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
    bool _206 = _64 == 224;
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
    bool _218 = _64 == 240;
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
    bool _232 = _64 == 256;
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
    bool _242 = _64 == 272;
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
    bool _252 = _64 == 288;
    float _254 = _250;
    if (_180)
    {
        _248 = (*spvDescriptorSet0.vp_c14)._m0[280].z;
    }
    float _256 = _248;
    int _258 = min(_230, 15);
    bool _260 = _64 == 304;
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
    float _278 = as_type<float>(_274);
    if (_206)
    {
        _268 = (*spvDescriptorSet0.vp_c14)._m0[282].x;
    }
    float _280 = _268;
    bool _282 = _64 == 320;
    float _284 = -_266;
    float _286 = _284 + (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _288 = _280;
    if (_206)
    {
        _276 = (*spvDescriptorSet0.vp_c14)._m0[282].z;
    }
    float _290 = _276;
    float _292 = _290;
    if (_218)
    {
        _288 = (*spvDescriptorSet0.vp_c14)._m0[283].x;
    }
    float _294 = _288;
    float _296 = _286 + 1.0;
    bool _298 = _64 == 336;
    float _300 = _294;
    if (_218)
    {
        _292 = (*spvDescriptorSet0.vp_c14)._m0[283].z;
    }
    float _302 = _292;
    float _304 = _302;
    if (_232)
    {
        _300 = (*spvDescriptorSet0.vp_c14)._m0[284].x;
    }
    float _306 = _300;
    float _308 = exp2(_296);
    bool _310 = _64 == 352;
    float _312 = _306;
    if (_232)
    {
        _304 = (*spvDescriptorSet0.vp_c14)._m0[284].z;
    }
    float _314 = _304;
    float _316 = _314;
    if (_242)
    {
        _312 = (*spvDescriptorSet0.vp_c14)._m0[285].x;
    }
    float _318 = _312;
    bool _320 = _64 == 368;
    float _322 = _318;
    if (_242)
    {
        _316 = (*spvDescriptorSet0.vp_c14)._m0[285].z;
    }
    float _324 = _316;
    float _326 = _324;
    if (_252)
    {
        _322 = (*spvDescriptorSet0.vp_c14)._m0[286].x;
    }
    float _328 = _322;
    bool _330 = _64 == 384;
    float _332 = _328;
    if (_252)
    {
        _326 = (*spvDescriptorSet0.vp_c14)._m0[286].z;
    }
    float _334 = _326;
    float _336 = 1.0 / _308;
    float _338 = _334;
    if (_260)
    {
        _332 = (*spvDescriptorSet0.vp_c14)._m0[287].x;
    }
    float _340 = _332;
    bool _342 = _64 == 400;
    float _344 = _340;
    if (_260)
    {
        _338 = (*spvDescriptorSet0.vp_c14)._m0[287].z;
    }
    float _346 = _338;
    bool _348 = _64 == 416;
    float _350 = _346;
    if (_282)
    {
        _344 = (*spvDescriptorSet0.vp_c14)._m0[288].x;
    }
    float _352 = _344;
    float _354 = _352;
    if (_282)
    {
        _350 = (*spvDescriptorSet0.vp_c14)._m0[288].z;
    }
    float _356 = _350;
    float _358 = _356;
    if (_298)
    {
        _354 = (*spvDescriptorSet0.vp_c14)._m0[289].x;
    }
    float _360 = _354;
    bool _362 = _64 == 432;
    float _364 = _360;
    if (_298)
    {
        _358 = (*spvDescriptorSet0.vp_c14)._m0[289].z;
    }
    float _366 = _358;
    float _368 = _366;
    if (_310)
    {
        _364 = (*spvDescriptorSet0.vp_c14)._m0[290].x;
    }
    float _370 = _364;
    bool _372 = _64 == 448;
    float _374 = _370;
    if (_310)
    {
        _368 = (*spvDescriptorSet0.vp_c14)._m0[290].z;
    }
    float _376 = _368;
    float _378 = _376;
    if (_320)
    {
        _374 = (*spvDescriptorSet0.vp_c14)._m0[291].x;
    }
    float _380 = _374;
    bool _382 = _64 == 464;
    float _384 = _380;
    if (_320)
    {
        _378 = (*spvDescriptorSet0.vp_c14)._m0[291].z;
    }
    float _386 = _378;
    float _388 = _386;
    if (_330)
    {
        _384 = (*spvDescriptorSet0.vp_c14)._m0[292].x;
    }
    float _390 = _384;
    bool _392 = _64 == 480;
    float _394 = _390;
    if (_330)
    {
        _388 = (*spvDescriptorSet0.vp_c14)._m0[292].z;
    }
    float _396 = _388;
    float _398 = _396;
    if (_342)
    {
        _394 = (*spvDescriptorSet0.vp_c14)._m0[293].x;
    }
    float _400 = _394;
    bool _402 = _64 == 496;
    float _404 = _400;
    if (_342)
    {
        _398 = (*spvDescriptorSet0.vp_c14)._m0[293].z;
    }
    float _406 = _398;
    float _408 = _406;
    if (_348)
    {
        _404 = (*spvDescriptorSet0.vp_c14)._m0[294].x;
    }
    float _410 = _404;
    bool _412 = _64 == 512;
    float _414 = _410;
    if (_348)
    {
        _408 = (*spvDescriptorSet0.vp_c14)._m0[294].z;
    }
    float _416 = _408;
    bool _418 = _64 == 528;
    float _420 = _416;
    if (_362)
    {
        _414 = (*spvDescriptorSet0.vp_c14)._m0[295].x;
    }
    float _422 = _414;
    float _424 = _422;
    if (_362)
    {
        _420 = (*spvDescriptorSet0.vp_c14)._m0[295].z;
    }
    float _426 = _420;
    float _428 = _426;
    if (_372)
    {
        _424 = (*spvDescriptorSet0.vp_c14)._m0[296].x;
    }
    float _430 = _424;
    bool _432 = _64 == 544;
    float _434 = _430;
    if (_372)
    {
        _428 = (*spvDescriptorSet0.vp_c14)._m0[296].z;
    }
    float _436 = _428;
    float _438 = _436;
    if (_382)
    {
        _434 = (*spvDescriptorSet0.vp_c14)._m0[297].x;
    }
    float _440 = _434;
    bool _442 = _64 == 560;
    float _444 = _440;
    if (_382)
    {
        _438 = (*spvDescriptorSet0.vp_c14)._m0[297].z;
    }
    float _446 = _438;
    float _448 = _446;
    if (_392)
    {
        _444 = (*spvDescriptorSet0.vp_c14)._m0[298].x;
    }
    float _450 = _444;
    bool _452 = _64 == 576;
    float _454 = _450;
    if (_392)
    {
        _448 = (*spvDescriptorSet0.vp_c14)._m0[298].z;
    }
    float _456 = _448;
    float _458 = _456;
    if (_402)
    {
        _454 = (*spvDescriptorSet0.vp_c14)._m0[299].x;
    }
    float _460 = _454;
    bool _462 = _64 == 592;
    float _464 = _460;
    if (_402)
    {
        _458 = (*spvDescriptorSet0.vp_c14)._m0[299].z;
    }
    float _466 = _458;
    float _468 = _466;
    if (_412)
    {
        _464 = (*spvDescriptorSet0.vp_c14)._m0[300].x;
    }
    float _470 = _464;
    bool _472 = _64 == 608;
    float _474 = _470;
    if (_412)
    {
        _468 = (*spvDescriptorSet0.vp_c14)._m0[300].z;
    }
    float _476 = _468;
    float _478 = _476;
    if (_418)
    {
        _474 = (*spvDescriptorSet0.vp_c14)._m0[301].x;
    }
    float _480 = _474;
    bool _482 = _64 == 624;
    float _484 = _480;
    if (_418)
    {
        _478 = (*spvDescriptorSet0.vp_c14)._m0[301].z;
    }
    float _486 = _478;
    bool _488 = _64 == 640;
    float _490 = _486;
    if (_432)
    {
        _484 = (*spvDescriptorSet0.vp_c14)._m0[302].x;
    }
    float _492 = _484;
    float _494 = _492;
    if (_432)
    {
        _490 = (*spvDescriptorSet0.vp_c14)._m0[302].z;
    }
    float _496 = _490;
    float _498 = _496;
    if (_442)
    {
        _494 = (*spvDescriptorSet0.vp_c14)._m0[303].x;
    }
    float _500 = _494;
    bool _502 = _64 == 656;
    float _504 = _500;
    if (_442)
    {
        _498 = (*spvDescriptorSet0.vp_c14)._m0[303].z;
    }
    float _506 = _498;
    float _508 = _506;
    if (_452)
    {
        _504 = (*spvDescriptorSet0.vp_c14)._m0[304].x;
    }
    float _510 = _504;
    bool _512 = _64 == 672;
    float _514 = _510;
    if (_452)
    {
        _508 = (*spvDescriptorSet0.vp_c14)._m0[304].z;
    }
    float _516 = _508;
    float _518 = _516;
    if (_462)
    {
        _514 = (*spvDescriptorSet0.vp_c14)._m0[305].x;
    }
    float _520 = _514;
    bool _522 = _64 == 688;
    float _524 = _520;
    if (_462)
    {
        _518 = (*spvDescriptorSet0.vp_c14)._m0[305].z;
    }
    float _526 = _518;
    float _528 = _526;
    if (_472)
    {
        _524 = (*spvDescriptorSet0.vp_c14)._m0[306].x;
    }
    float _530 = _524;
    bool _532 = _64 == 704;
    float _534 = _530;
    if (_472)
    {
        _528 = (*spvDescriptorSet0.vp_c14)._m0[306].z;
    }
    float _536 = _528;
    float _538 = _536;
    if (_482)
    {
        _534 = (*spvDescriptorSet0.vp_c14)._m0[307].x;
    }
    float _540 = _534;
    bool _542 = _64 == 720;
    float _544 = _540;
    if (_482)
    {
        _538 = (*spvDescriptorSet0.vp_c14)._m0[307].z;
    }
    float _546 = _538;
    float _548 = _546;
    if (_488)
    {
        _544 = (*spvDescriptorSet0.vp_c14)._m0[308].x;
    }
    float _550 = _544;
    bool _552 = _64 == 736;
    float _554 = _550;
    if (_488)
    {
        _548 = (*spvDescriptorSet0.vp_c14)._m0[308].z;
    }
    float _556 = _548;
    bool _558 = _64 == 752;
    float _560 = _556;
    if (_502)
    {
        _554 = (*spvDescriptorSet0.vp_c14)._m0[309].x;
    }
    float _562 = _554;
    float _564 = _562;
    if (_512)
    {
        _564 = (*spvDescriptorSet0.vp_c14)._m0[310].x;
    }
    float _566 = _564;
    float _568 = _566;
    if (_522)
    {
        _568 = (*spvDescriptorSet0.vp_c14)._m0[311].x;
    }
    float _570 = _568;
    float _572 = _570;
    if (_532)
    {
        _572 = (*spvDescriptorSet0.vp_c14)._m0[312].x;
    }
    float _574 = _572;
    float _576 = _574;
    if (_542)
    {
        _576 = (*spvDescriptorSet0.vp_c14)._m0[313].x;
    }
    float _578 = _576;
    float _580 = _578;
    if (_552)
    {
        _580 = (*spvDescriptorSet0.vp_c14)._m0[314].x;
    }
    float _582 = _580;
    float _584 = _582;
    if (_558)
    {
        _584 = (*spvDescriptorSet0.vp_c14)._m0[315].x;
    }
    float _586 = _584;
    float _588 = _336 * _586;
    if (_502)
    {
        _560 = (*spvDescriptorSet0.vp_c14)._m0[309].z;
    }
    float _590 = _560;
    float _592 = _590;
    if (_512)
    {
        _592 = (*spvDescriptorSet0.vp_c14)._m0[310].z;
    }
    float _594 = _592;
    float _596 = _588 * _49;
    float _598 = _588 * _51;
    float _600 = _594;
    if (_522)
    {
        _600 = (*spvDescriptorSet0.vp_c14)._m0[311].z;
    }
    float _602 = _600;
    float _604 = floor(_596);
    float _606 = _602;
    if (_532)
    {
        _606 = (*spvDescriptorSet0.vp_c14)._m0[312].z;
    }
    float _608 = _606;
    float _610 = _608;
    if (_542)
    {
        _610 = (*spvDescriptorSet0.vp_c14)._m0[313].z;
    }
    float _612 = _610;
    float _614 = _612;
    if (_552)
    {
        _614 = (*spvDescriptorSet0.vp_c14)._m0[314].z;
    }
    float _616 = _614;
    float _618 = _616;
    if (_558)
    {
        _618 = (*spvDescriptorSet0.vp_c14)._m0[315].z;
    }
    float _620 = _618;
    float _622 = floor(_598);
    float _624 = _308 * _620;
    float _626 = -_604;
    float _628 = _596 + _626;
    float _630 = _628 * 2.0;
    float _632 = -_628;
    float _634 = fma(_624, _632, _49);
    int _636 = _274 + 8;
    uint _639 = uint(int(uint(_636) >> uint(2)));
    uint _641 = uint(int(uint(int(_639)) >> uint(2)));
    int _643 = int(_639) & 3;
    float _645 = (*spvDescriptorSet0.vp_c14)._m0[int(_641)][_643];
    int _647 = int(_639) + 1;
    uint _649 = uint(int(uint(_647) >> uint(2)));
    int _651 = _647 & 3;
    float _653 = (*spvDescriptorSet0.vp_c14)._m0[int(_649)][_651];
    float _655 = -_622;
    float _657 = _598 + _655;
    float _659 = floor(_630);
    float _661 = _657 * 2.0;
    float _663 = -_657;
    float _665 = fma(_624, _663, _51);
    float _667 = floor(_661);
    float _669 = _624 * _659;
    float _671 = _669 * 0.5;
    float _673 = _671 + _634;
    float _675 = fma(_55, _673, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _677 = _624 * _667;
    float _679 = _677 * 0.5;
    float _681 = fma(_62, _673, (*spvDescriptorSet0.vp_c15)._m0[3].z);
    float _683 = fma(_673, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _685 = _679 + _665;
    float _687 = -_675;
    float _689 = _687 + _681;
    float _691 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _693 = _683 + _691;
    float _695 = fma(_685, _689, _675);
    float _697 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _699 = _695 + _697;
    float _701 = fma(_685, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _703 = _699 * _699;
    float _705 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _707 = _701 + _705;
    float _709 = fma(_693, _693, _703);
    float _711 = fma(_707, _707, _709);
    float _713 = sqrt(_711);
    float _715 = -_653;
    float _717 = fma(_713, _645, _715);
    float _719 = precise::clamp(_717, 0.0, 1.0);
    float _721 = -_671;
    float _723 = fma(_721, _719, _673);
    float _725 = -_679;
    float _727 = fma(_725, _719, _685);
    float _729 = fma(_723, (*spvDescriptorSet0.vp_c15)._m0[6].x, (*spvDescriptorSet0.vp_c15)._m0[6].z);
    float _731 = fma(_727, (*spvDescriptorSet0.vp_c15)._m0[6].x, (*spvDescriptorSet0.vp_c15)._m0[6].w);
    float _733 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _729);
    float _735 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _731);
    float2 _2120 = float2(_733, _735);
    float _737 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2120, float2(0.0), isnan(_2120)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2120, float2(0.0), isnan(_2120)), level(0.0)).x;
    float _739 = fma(_727, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _741 = fma(_723, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _743 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _745 = _739 + _743;
    float _747 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _749 = _741 + _747;
    float _751 = _745 * _745;
    float _753 = fma(_749, _749, _751);
    float _755 = sqrt(_753);
    bool _757 = _755 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _759 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _761 = _755 + _759;
    float _763 = _727;
    float _765 = _761;
    float _767 = (*spvDescriptorSet0.vp_c14)._m0[0].y;
    float _769 = _645;
    if (_757)
    {
        float _771 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        _763 = _771;
    }
    float _773 = _763;
    if (_757)
    {
        float _775 = _761 * _773;
        _765 = _775;
    }
    float _777 = _765;
    if (_757)
    {
        float _779 = _777 * 0.15915493667125701904296875;
        _278 = _779;
    }
    float _781 = _278;
    float _783 = _777;
    if (_757)
    {
        float _785 = _781 * 6.283185482025146484375;
        float _787 = cos(_785);
        _783 = _787;
    }
    float _789 = _783;
    float _791 = _773;
    if (_757)
    {
        float _793 = _781 * 6.283185482025146484375;
        float _795 = sin(_793);
        _791 = _795;
    }
    float _797 = _791;
    float _799 = _735;
    if (_757)
    {
        float _801 = rsqrt(_753);
        _799 = _801;
    }
    float _803 = _799;
    float _805 = fma(_737, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _807 = _789;
    if (_757)
    {
        float _809 = _789 + (-1.0);
        _767 = _809;
    }
    float _811 = _767;
    float _813 = _811;
    if (_757)
    {
        float _815 = _805 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        _102 = _815;
    }
    float _817 = _102;
    float _819 = _817;
    if (_757)
    {
        float _821 = _811 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        _813 = _821;
    }
    float _823 = _813;
    float _825 = _797;
    if (_757)
    {
        float _827 = fma(_797, _817, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        _819 = _827;
    }
    float _829 = _819;
    float _831 = _829;
    if (!_757)
    {
        _825 = _805;
    }
    float _833 = _825;
    float _835 = _833;
    if (_757)
    {
        float _837 = fma(_805, _789, _823);
        _835 = _837;
    }
    float _839 = _835;
    if (!_757)
    {
        _807 = _739;
    }
    float _841 = _807;
    float _843 = _841;
    if (_757)
    {
        float _845 = _803 * _829;
        _769 = _845;
    }
    float _847 = _769;
    if (!_757)
    {
        _831 = _741;
    }
    float _849 = _831;
    float _851 = _839 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _853 = _839 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _855 = _849;
    if (_757)
    {
        float _857 = fma(_749, _847, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        _855 = _857;
    }
    float _859 = _855;
    if (_757)
    {
        float _861 = fma(_745, _847, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        _843 = _861;
    }
    float _863 = _843;
    float _865 = _839 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _867 = fma(_859, (*spvDescriptorSet0.vp_c4)._m0[1].x, _851);
    float _869 = fma(_859, (*spvDescriptorSet0.vp_c4)._m0[0].x, _853);
    float _871 = fma(_859, (*spvDescriptorSet0.vp_c4)._m0[2].x, _865);
    float _873 = fma(_863, (*spvDescriptorSet0.vp_c4)._m0[1].z, _867);
    float _875 = fma(_863, (*spvDescriptorSet0.vp_c4)._m0[0].z, _869);
    float _877 = fma(_863, (*spvDescriptorSet0.vp_c4)._m0[2].z, _871);
    float _879 = _873 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _881 = _875 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _883 = _877 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _885 = _879 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _887 = _879 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _889 = _879 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _891 = _879 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _893 = fma(_881, (*spvDescriptorSet0.vp_c4)._m0[8].x, _885);
    float _895 = fma(_881, (*spvDescriptorSet0.vp_c4)._m0[7].x, _887);
    float _897 = fma(_881, (*spvDescriptorSet0.vp_c4)._m0[9].x, _889);
    float _899 = fma(_881, (*spvDescriptorSet0.vp_c4)._m0[10].x, _891);
    float _901 = fma(_883, (*spvDescriptorSet0.vp_c4)._m0[8].z, _893);
    float _903 = fma(_883, (*spvDescriptorSet0.vp_c4)._m0[7].z, _895);
    float _905 = fma(_883, (*spvDescriptorSet0.vp_c4)._m0[9].z, _897);
    float _907 = fma(_883, (*spvDescriptorSet0.vp_c4)._m0[10].z, _899);
    float _909 = _901 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _911 = _903 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _913 = _905 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _915 = _907 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.gl_Position.x = _911;
    out.gl_Position.y = _909;
    out.gl_Position.z = _913;
    out.gl_Position.w = _915;
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
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _49 = in.m_35.x;
    float _51 = in.m_35.y;
    float _53 = -(*spvDescriptorSet0.vp_c15)._m0[3].x;
    float _55 = _53 + (*spvDescriptorSet0.vp_c15)._m0[3].y;
    int _58 = 16 + as_type<int>(as_type<float>(gl_BaseInstance));
    float _60 = -(*spvDescriptorSet0.vp_c15)._m0[3].z;
    float _62 = _60 + (*spvDescriptorSet0.vp_c15)._m0[3].w;
    int _64 = _58 << 4;
    bool _68 = _64 == 0;
    bool _70 = _64 == 16;
    bool _72 = _64 == 32;
    bool _74 = _64 == 48;
    bool _76 = _64 == 64;
    float _78 = fma(_55, _49, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _80 = fma(_62, _49, (*spvDescriptorSet0.vp_c15)._m0[3].z);
    bool _82 = _64 == 80;
    float _84 = as_type<float>(gl_BaseInstance);
    if (_68)
    {
        _84 = (*spvDescriptorSet0.vp_c14)._m0[268].x;
    }
    float _86 = _84;
    float _88 = -_78;
    float _90 = _88 + _80;
    bool _92 = _64 == 96;
    float _94 = fma(_90, _51, _78);
    float _96 = fma(_49, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _98 = 0.0;
    float _100 = _86;
    float _102 = (*spvDescriptorSet0.vp_c15)._m0[0].y;
    if (_68)
    {
        _98 = (*spvDescriptorSet0.vp_c14)._m0[268].z;
    }
    float _104 = _98;
    float _106 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _108 = _94 + _106;
    float _110 = _104;
    if (_70)
    {
        _100 = (*spvDescriptorSet0.vp_c14)._m0[269].x;
    }
    float _112 = _100;
    float _114 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _116 = _96 + _114;
    float _118 = fma(_51, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _120 = _108 * _108;
    bool _122 = _64 == 112;
    float _124 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _126 = _118 + _124;
    float _128 = fma(_116, _116, _120);
    float _130 = _112;
    if (_70)
    {
        _110 = (*spvDescriptorSet0.vp_c14)._m0[269].z;
    }
    float _132 = _110;
    float _134 = _132;
    if (_72)
    {
        _130 = (*spvDescriptorSet0.vp_c14)._m0[270].x;
    }
    float _136 = _130;
    float _138 = fma(_126, _126, _128);
    bool _140 = _64 == 128;
    float _142 = _136;
    if (_72)
    {
        _134 = (*spvDescriptorSet0.vp_c14)._m0[270].z;
    }
    float _144 = _134;
    float _146 = rsqrt(_138);
    float _148 = _144;
    if (_74)
    {
        _142 = (*spvDescriptorSet0.vp_c14)._m0[271].x;
    }
    float _150 = _142;
    bool _152 = _64 == 144;
    float _154 = _150;
    if (_74)
    {
        _148 = (*spvDescriptorSet0.vp_c14)._m0[271].z;
    }
    float _156 = _148;
    float _158 = _156;
    if (_76)
    {
        _154 = (*spvDescriptorSet0.vp_c14)._m0[272].x;
    }
    float _160 = _154;
    bool _162 = _64 == 160;
    float _164 = _160;
    if (_76)
    {
        _158 = (*spvDescriptorSet0.vp_c14)._m0[272].z;
    }
    float _166 = _158;
    float _168 = _166;
    if (_82)
    {
        _164 = (*spvDescriptorSet0.vp_c14)._m0[273].x;
    }
    float _170 = _164;
    bool _172 = _64 == 176;
    float _174 = _146 * (*spvDescriptorSet0.vp_c14)._m0[268].x;
    float _176 = _170;
    if (_82)
    {
        _168 = (*spvDescriptorSet0.vp_c14)._m0[273].z;
    }
    float _178 = _168;
    bool _180 = _64 == 192;
    float _182 = _178;
    if (_92)
    {
        _176 = (*spvDescriptorSet0.vp_c14)._m0[274].x;
    }
    float _184 = _176;
    float _186 = log2(_174);
    float _188 = _184;
    if (_92)
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
    bool _196 = _64 == 208;
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
    bool _206 = _64 == 224;
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
    bool _218 = _64 == 240;
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
    bool _232 = _64 == 256;
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
    bool _242 = _64 == 272;
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
    bool _252 = _64 == 288;
    float _254 = _250;
    if (_180)
    {
        _248 = (*spvDescriptorSet0.vp_c14)._m0[280].z;
    }
    float _256 = _248;
    int _258 = min(_230, 15);
    bool _260 = _64 == 304;
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
    float _278 = as_type<float>(_274);
    if (_206)
    {
        _268 = (*spvDescriptorSet0.vp_c14)._m0[282].x;
    }
    float _280 = _268;
    bool _282 = _64 == 320;
    float _284 = -_266;
    float _286 = _284 + (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _288 = _280;
    if (_206)
    {
        _276 = (*spvDescriptorSet0.vp_c14)._m0[282].z;
    }
    float _290 = _276;
    float _292 = _290;
    if (_218)
    {
        _288 = (*spvDescriptorSet0.vp_c14)._m0[283].x;
    }
    float _294 = _288;
    float _296 = _286 + 1.0;
    bool _298 = _64 == 336;
    float _300 = _294;
    if (_218)
    {
        _292 = (*spvDescriptorSet0.vp_c14)._m0[283].z;
    }
    float _302 = _292;
    float _304 = _302;
    if (_232)
    {
        _300 = (*spvDescriptorSet0.vp_c14)._m0[284].x;
    }
    float _306 = _300;
    float _308 = exp2(_296);
    bool _310 = _64 == 352;
    float _312 = _306;
    if (_232)
    {
        _304 = (*spvDescriptorSet0.vp_c14)._m0[284].z;
    }
    float _314 = _304;
    float _316 = _314;
    if (_242)
    {
        _312 = (*spvDescriptorSet0.vp_c14)._m0[285].x;
    }
    float _318 = _312;
    bool _320 = _64 == 368;
    float _322 = _318;
    if (_242)
    {
        _316 = (*spvDescriptorSet0.vp_c14)._m0[285].z;
    }
    float _324 = _316;
    float _326 = _324;
    if (_252)
    {
        _322 = (*spvDescriptorSet0.vp_c14)._m0[286].x;
    }
    float _328 = _322;
    bool _330 = _64 == 384;
    float _332 = _328;
    if (_252)
    {
        _326 = (*spvDescriptorSet0.vp_c14)._m0[286].z;
    }
    float _334 = _326;
    float _336 = 1.0 / _308;
    float _338 = _334;
    if (_260)
    {
        _332 = (*spvDescriptorSet0.vp_c14)._m0[287].x;
    }
    float _340 = _332;
    bool _342 = _64 == 400;
    float _344 = _340;
    if (_260)
    {
        _338 = (*spvDescriptorSet0.vp_c14)._m0[287].z;
    }
    float _346 = _338;
    bool _348 = _64 == 416;
    float _350 = _346;
    if (_282)
    {
        _344 = (*spvDescriptorSet0.vp_c14)._m0[288].x;
    }
    float _352 = _344;
    float _354 = _352;
    if (_282)
    {
        _350 = (*spvDescriptorSet0.vp_c14)._m0[288].z;
    }
    float _356 = _350;
    float _358 = _356;
    if (_298)
    {
        _354 = (*spvDescriptorSet0.vp_c14)._m0[289].x;
    }
    float _360 = _354;
    bool _362 = _64 == 432;
    float _364 = _360;
    if (_298)
    {
        _358 = (*spvDescriptorSet0.vp_c14)._m0[289].z;
    }
    float _366 = _358;
    float _368 = _366;
    if (_310)
    {
        _364 = (*spvDescriptorSet0.vp_c14)._m0[290].x;
    }
    float _370 = _364;
    bool _372 = _64 == 448;
    float _374 = _370;
    if (_310)
    {
        _368 = (*spvDescriptorSet0.vp_c14)._m0[290].z;
    }
    float _376 = _368;
    float _378 = _376;
    if (_320)
    {
        _374 = (*spvDescriptorSet0.vp_c14)._m0[291].x;
    }
    float _380 = _374;
    bool _382 = _64 == 464;
    float _384 = _380;
    if (_320)
    {
        _378 = (*spvDescriptorSet0.vp_c14)._m0[291].z;
    }
    float _386 = _378;
    float _388 = _386;
    if (_330)
    {
        _384 = (*spvDescriptorSet0.vp_c14)._m0[292].x;
    }
    float _390 = _384;
    bool _392 = _64 == 480;
    float _394 = _390;
    if (_330)
    {
        _388 = (*spvDescriptorSet0.vp_c14)._m0[292].z;
    }
    float _396 = _388;
    float _398 = _396;
    if (_342)
    {
        _394 = (*spvDescriptorSet0.vp_c14)._m0[293].x;
    }
    float _400 = _394;
    bool _402 = _64 == 496;
    float _404 = _400;
    if (_342)
    {
        _398 = (*spvDescriptorSet0.vp_c14)._m0[293].z;
    }
    float _406 = _398;
    float _408 = _406;
    if (_348)
    {
        _404 = (*spvDescriptorSet0.vp_c14)._m0[294].x;
    }
    float _410 = _404;
    bool _412 = _64 == 512;
    float _414 = _410;
    if (_348)
    {
        _408 = (*spvDescriptorSet0.vp_c14)._m0[294].z;
    }
    float _416 = _408;
    bool _418 = _64 == 528;
    float _420 = _416;
    if (_362)
    {
        _414 = (*spvDescriptorSet0.vp_c14)._m0[295].x;
    }
    float _422 = _414;
    float _424 = _422;
    if (_362)
    {
        _420 = (*spvDescriptorSet0.vp_c14)._m0[295].z;
    }
    float _426 = _420;
    float _428 = _426;
    if (_372)
    {
        _424 = (*spvDescriptorSet0.vp_c14)._m0[296].x;
    }
    float _430 = _424;
    bool _432 = _64 == 544;
    float _434 = _430;
    if (_372)
    {
        _428 = (*spvDescriptorSet0.vp_c14)._m0[296].z;
    }
    float _436 = _428;
    float _438 = _436;
    if (_382)
    {
        _434 = (*spvDescriptorSet0.vp_c14)._m0[297].x;
    }
    float _440 = _434;
    bool _442 = _64 == 560;
    float _444 = _440;
    if (_382)
    {
        _438 = (*spvDescriptorSet0.vp_c14)._m0[297].z;
    }
    float _446 = _438;
    float _448 = _446;
    if (_392)
    {
        _444 = (*spvDescriptorSet0.vp_c14)._m0[298].x;
    }
    float _450 = _444;
    bool _452 = _64 == 576;
    float _454 = _450;
    if (_392)
    {
        _448 = (*spvDescriptorSet0.vp_c14)._m0[298].z;
    }
    float _456 = _448;
    float _458 = _456;
    if (_402)
    {
        _454 = (*spvDescriptorSet0.vp_c14)._m0[299].x;
    }
    float _460 = _454;
    bool _462 = _64 == 592;
    float _464 = _460;
    if (_402)
    {
        _458 = (*spvDescriptorSet0.vp_c14)._m0[299].z;
    }
    float _466 = _458;
    float _468 = _466;
    if (_412)
    {
        _464 = (*spvDescriptorSet0.vp_c14)._m0[300].x;
    }
    float _470 = _464;
    bool _472 = _64 == 608;
    float _474 = _470;
    if (_412)
    {
        _468 = (*spvDescriptorSet0.vp_c14)._m0[300].z;
    }
    float _476 = _468;
    float _478 = _476;
    if (_418)
    {
        _474 = (*spvDescriptorSet0.vp_c14)._m0[301].x;
    }
    float _480 = _474;
    bool _482 = _64 == 624;
    float _484 = _480;
    if (_418)
    {
        _478 = (*spvDescriptorSet0.vp_c14)._m0[301].z;
    }
    float _486 = _478;
    bool _488 = _64 == 640;
    float _490 = _486;
    if (_432)
    {
        _484 = (*spvDescriptorSet0.vp_c14)._m0[302].x;
    }
    float _492 = _484;
    float _494 = _492;
    if (_432)
    {
        _490 = (*spvDescriptorSet0.vp_c14)._m0[302].z;
    }
    float _496 = _490;
    float _498 = _496;
    if (_442)
    {
        _494 = (*spvDescriptorSet0.vp_c14)._m0[303].x;
    }
    float _500 = _494;
    bool _502 = _64 == 656;
    float _504 = _500;
    if (_442)
    {
        _498 = (*spvDescriptorSet0.vp_c14)._m0[303].z;
    }
    float _506 = _498;
    float _508 = _506;
    if (_452)
    {
        _504 = (*spvDescriptorSet0.vp_c14)._m0[304].x;
    }
    float _510 = _504;
    bool _512 = _64 == 672;
    float _514 = _510;
    if (_452)
    {
        _508 = (*spvDescriptorSet0.vp_c14)._m0[304].z;
    }
    float _516 = _508;
    float _518 = _516;
    if (_462)
    {
        _514 = (*spvDescriptorSet0.vp_c14)._m0[305].x;
    }
    float _520 = _514;
    bool _522 = _64 == 688;
    float _524 = _520;
    if (_462)
    {
        _518 = (*spvDescriptorSet0.vp_c14)._m0[305].z;
    }
    float _526 = _518;
    float _528 = _526;
    if (_472)
    {
        _524 = (*spvDescriptorSet0.vp_c14)._m0[306].x;
    }
    float _530 = _524;
    bool _532 = _64 == 704;
    float _534 = _530;
    if (_472)
    {
        _528 = (*spvDescriptorSet0.vp_c14)._m0[306].z;
    }
    float _536 = _528;
    float _538 = _536;
    if (_482)
    {
        _534 = (*spvDescriptorSet0.vp_c14)._m0[307].x;
    }
    float _540 = _534;
    bool _542 = _64 == 720;
    float _544 = _540;
    if (_482)
    {
        _538 = (*spvDescriptorSet0.vp_c14)._m0[307].z;
    }
    float _546 = _538;
    float _548 = _546;
    if (_488)
    {
        _544 = (*spvDescriptorSet0.vp_c14)._m0[308].x;
    }
    float _550 = _544;
    bool _552 = _64 == 736;
    float _554 = _550;
    if (_488)
    {
        _548 = (*spvDescriptorSet0.vp_c14)._m0[308].z;
    }
    float _556 = _548;
    bool _558 = _64 == 752;
    float _560 = _556;
    if (_502)
    {
        _554 = (*spvDescriptorSet0.vp_c14)._m0[309].x;
    }
    float _562 = _554;
    float _564 = _562;
    if (_512)
    {
        _564 = (*spvDescriptorSet0.vp_c14)._m0[310].x;
    }
    float _566 = _564;
    float _568 = _566;
    if (_522)
    {
        _568 = (*spvDescriptorSet0.vp_c14)._m0[311].x;
    }
    float _570 = _568;
    float _572 = _570;
    if (_532)
    {
        _572 = (*spvDescriptorSet0.vp_c14)._m0[312].x;
    }
    float _574 = _572;
    float _576 = _574;
    if (_542)
    {
        _576 = (*spvDescriptorSet0.vp_c14)._m0[313].x;
    }
    float _578 = _576;
    float _580 = _578;
    if (_552)
    {
        _580 = (*spvDescriptorSet0.vp_c14)._m0[314].x;
    }
    float _582 = _580;
    float _584 = _582;
    if (_558)
    {
        _584 = (*spvDescriptorSet0.vp_c14)._m0[315].x;
    }
    float _586 = _584;
    float _588 = _336 * _586;
    if (_502)
    {
        _560 = (*spvDescriptorSet0.vp_c14)._m0[309].z;
    }
    float _590 = _560;
    float _592 = _590;
    if (_512)
    {
        _592 = (*spvDescriptorSet0.vp_c14)._m0[310].z;
    }
    float _594 = _592;
    float _596 = _588 * _49;
    float _598 = _588 * _51;
    float _600 = _594;
    if (_522)
    {
        _600 = (*spvDescriptorSet0.vp_c14)._m0[311].z;
    }
    float _602 = _600;
    float _604 = floor(_596);
    float _606 = _602;
    if (_532)
    {
        _606 = (*spvDescriptorSet0.vp_c14)._m0[312].z;
    }
    float _608 = _606;
    float _610 = _608;
    if (_542)
    {
        _610 = (*spvDescriptorSet0.vp_c14)._m0[313].z;
    }
    float _612 = _610;
    float _614 = _612;
    if (_552)
    {
        _614 = (*spvDescriptorSet0.vp_c14)._m0[314].z;
    }
    float _616 = _614;
    float _618 = _616;
    if (_558)
    {
        _618 = (*spvDescriptorSet0.vp_c14)._m0[315].z;
    }
    float _620 = _618;
    float _622 = floor(_598);
    float _624 = _308 * _620;
    float _626 = -_604;
    float _628 = _596 + _626;
    float _630 = _628 * 2.0;
    float _632 = -_628;
    float _634 = fma(_624, _632, _49);
    int _636 = _274 + 8;
    uint _639 = uint(int(uint(_636) >> uint(2)));
    uint _641 = uint(int(uint(int(_639)) >> uint(2)));
    int _643 = int(_639) & 3;
    float _645 = (*spvDescriptorSet0.vp_c14)._m0[int(_641)][_643];
    int _647 = int(_639) + 1;
    uint _649 = uint(int(uint(_647) >> uint(2)));
    int _651 = _647 & 3;
    float _653 = (*spvDescriptorSet0.vp_c14)._m0[int(_649)][_651];
    float _655 = -_622;
    float _657 = _598 + _655;
    float _659 = floor(_630);
    float _661 = _657 * 2.0;
    float _663 = -_657;
    float _665 = fma(_624, _663, _51);
    float _667 = floor(_661);
    float _669 = _624 * _659;
    float _671 = _669 * 0.5;
    float _673 = _671 + _634;
    float _675 = fma(_55, _673, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _677 = _624 * _667;
    float _679 = _677 * 0.5;
    float _681 = fma(_62, _673, (*spvDescriptorSet0.vp_c15)._m0[3].z);
    float _683 = fma(_673, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _685 = _679 + _665;
    float _687 = -_675;
    float _689 = _687 + _681;
    float _691 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _693 = _683 + _691;
    float _695 = fma(_685, _689, _675);
    float _697 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _699 = _695 + _697;
    float _701 = fma(_685, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _703 = _699 * _699;
    float _705 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _707 = _701 + _705;
    float _709 = fma(_693, _693, _703);
    float _711 = fma(_707, _707, _709);
    float _713 = sqrt(_711);
    float _715 = -_653;
    float _717 = fma(_713, _645, _715);
    float _719 = precise::clamp(_717, 0.0, 1.0);
    float _721 = -_671;
    float _723 = fma(_721, _719, _673);
    float _725 = -_679;
    float _727 = fma(_725, _719, _685);
    float _729 = fma(_723, (*spvDescriptorSet0.vp_c15)._m0[6].x, (*spvDescriptorSet0.vp_c15)._m0[6].z);
    float _731 = fma(_727, (*spvDescriptorSet0.vp_c15)._m0[6].x, (*spvDescriptorSet0.vp_c15)._m0[6].w);
    float _733 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _729);
    float _735 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _731);
    float2 _2120 = float2(_733, _735);
    float _737 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2120, float2(0.0), isnan(_2120)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2120, float2(0.0), isnan(_2120)), level(0.0)).x;
    float _739 = fma(_727, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _741 = fma(_723, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _743 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _745 = _739 + _743;
    float _747 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _749 = _741 + _747;
    float _751 = _745 * _745;
    float _753 = fma(_749, _749, _751);
    float _755 = sqrt(_753);
    bool _757 = _755 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _759 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _761 = _755 + _759;
    float _763 = _727;
    float _765 = _761;
    float _767 = (*spvDescriptorSet0.vp_c14)._m0[0].y;
    float _769 = _645;
    if (_757)
    {
        float _771 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        _763 = _771;
    }
    float _773 = _763;
    if (_757)
    {
        float _775 = _761 * _773;
        _765 = _775;
    }
    float _777 = _765;
    if (_757)
    {
        float _779 = _777 * 0.15915493667125701904296875;
        _278 = _779;
    }
    float _781 = _278;
    float _783 = _777;
    if (_757)
    {
        float _785 = _781 * 6.283185482025146484375;
        float _787 = cos(_785);
        _783 = _787;
    }
    float _789 = _783;
    float _791 = _773;
    if (_757)
    {
        float _793 = _781 * 6.283185482025146484375;
        float _795 = sin(_793);
        _791 = _795;
    }
    float _797 = _791;
    float _799 = _735;
    if (_757)
    {
        float _801 = rsqrt(_753);
        _799 = _801;
    }
    float _803 = _799;
    float _805 = fma(_737, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _807 = _789;
    if (_757)
    {
        float _809 = _789 + (-1.0);
        _767 = _809;
    }
    float _811 = _767;
    float _813 = _811;
    if (_757)
    {
        float _815 = _805 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        _102 = _815;
    }
    float _817 = _102;
    float _819 = _817;
    if (_757)
    {
        float _821 = _811 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        _813 = _821;
    }
    float _823 = _813;
    float _825 = _797;
    if (_757)
    {
        float _827 = fma(_797, _817, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        _819 = _827;
    }
    float _829 = _819;
    float _831 = _829;
    if (!_757)
    {
        _825 = _805;
    }
    float _833 = _825;
    float _835 = _833;
    if (_757)
    {
        float _837 = fma(_805, _789, _823);
        _835 = _837;
    }
    float _839 = _835;
    if (!_757)
    {
        _807 = _739;
    }
    float _841 = _807;
    float _843 = _841;
    if (_757)
    {
        float _845 = _803 * _829;
        _769 = _845;
    }
    float _847 = _769;
    if (!_757)
    {
        _831 = _741;
    }
    float _849 = _831;
    float _851 = _839 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _853 = _839 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _855 = _849;
    if (_757)
    {
        float _857 = fma(_749, _847, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        _855 = _857;
    }
    float _859 = _855;
    if (_757)
    {
        float _861 = fma(_745, _847, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        _843 = _861;
    }
    float _863 = _843;
    float _865 = _839 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _867 = fma(_859, (*spvDescriptorSet0.vp_c4)._m0[1].x, _851);
    float _869 = fma(_859, (*spvDescriptorSet0.vp_c4)._m0[0].x, _853);
    float _871 = fma(_859, (*spvDescriptorSet0.vp_c4)._m0[2].x, _865);
    float _873 = fma(_863, (*spvDescriptorSet0.vp_c4)._m0[1].z, _867);
    float _875 = fma(_863, (*spvDescriptorSet0.vp_c4)._m0[0].z, _869);
    float _877 = fma(_863, (*spvDescriptorSet0.vp_c4)._m0[2].z, _871);
    float _879 = _873 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _881 = _875 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _883 = _877 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _885 = _879 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _887 = _879 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _889 = _879 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _891 = _879 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _893 = fma(_881, (*spvDescriptorSet0.vp_c4)._m0[8].x, _885);
    float _895 = fma(_881, (*spvDescriptorSet0.vp_c4)._m0[7].x, _887);
    float _897 = fma(_881, (*spvDescriptorSet0.vp_c4)._m0[9].x, _889);
    float _899 = fma(_881, (*spvDescriptorSet0.vp_c4)._m0[10].x, _891);
    float _901 = fma(_883, (*spvDescriptorSet0.vp_c4)._m0[8].z, _893);
    float _903 = fma(_883, (*spvDescriptorSet0.vp_c4)._m0[7].z, _895);
    float _905 = fma(_883, (*spvDescriptorSet0.vp_c4)._m0[9].z, _897);
    float _907 = fma(_883, (*spvDescriptorSet0.vp_c4)._m0[10].z, _899);
    float _909 = _901 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _911 = _903 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _913 = _905 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _915 = _907 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.gl_Position.x = _911;
    out.gl_Position.y = _909;
    out.gl_Position.z = _913;
    out.gl_Position.w = _915;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, 0u); dm_cw(dm_gs, dm_p, 17, 0u); dm_cw(dm_gs, dm_p, 18, 0u); dm_cw(dm_gs, dm_p, 19, 0x3f800000u); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

