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
    float _104 = (*spvDescriptorSet0.vp_c15)._m0[0].x;
    if (_68)
    {
        _98 = (*spvDescriptorSet0.vp_c14)._m0[268].z;
    }
    float _106 = _98;
    float _108 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _110 = _94 + _108;
    float _112 = _106;
    if (_70)
    {
        _100 = (*spvDescriptorSet0.vp_c14)._m0[269].x;
    }
    float _114 = _100;
    float _116 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _118 = _96 + _116;
    float _120 = fma(_51, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _122 = _110 * _110;
    bool _124 = _64 == 112;
    float _126 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _128 = _120 + _126;
    float _130 = fma(_118, _118, _122);
    float _132 = _114;
    if (_70)
    {
        _112 = (*spvDescriptorSet0.vp_c14)._m0[269].z;
    }
    float _134 = _112;
    float _136 = _134;
    if (_72)
    {
        _132 = (*spvDescriptorSet0.vp_c14)._m0[270].x;
    }
    float _138 = _132;
    float _140 = fma(_128, _128, _130);
    bool _142 = _64 == 128;
    float _144 = _138;
    if (_72)
    {
        _136 = (*spvDescriptorSet0.vp_c14)._m0[270].z;
    }
    float _146 = _136;
    float _148 = rsqrt(_140);
    float _150 = _146;
    if (_74)
    {
        _144 = (*spvDescriptorSet0.vp_c14)._m0[271].x;
    }
    float _152 = _144;
    bool _154 = _64 == 144;
    float _156 = _152;
    if (_74)
    {
        _150 = (*spvDescriptorSet0.vp_c14)._m0[271].z;
    }
    float _158 = _150;
    float _160 = _158;
    if (_76)
    {
        _156 = (*spvDescriptorSet0.vp_c14)._m0[272].x;
    }
    float _162 = _156;
    bool _164 = _64 == 160;
    float _166 = _162;
    if (_76)
    {
        _160 = (*spvDescriptorSet0.vp_c14)._m0[272].z;
    }
    float _168 = _160;
    float _170 = _168;
    if (_82)
    {
        _166 = (*spvDescriptorSet0.vp_c14)._m0[273].x;
    }
    float _172 = _166;
    bool _174 = _64 == 176;
    float _176 = _148 * (*spvDescriptorSet0.vp_c14)._m0[268].x;
    float _178 = _172;
    if (_82)
    {
        _170 = (*spvDescriptorSet0.vp_c14)._m0[273].z;
    }
    float _180 = _170;
    bool _182 = _64 == 192;
    float _184 = _180;
    if (_92)
    {
        _178 = (*spvDescriptorSet0.vp_c14)._m0[274].x;
    }
    float _186 = _178;
    float _188 = log2(_176);
    float _190 = _186;
    if (_92)
    {
        _184 = (*spvDescriptorSet0.vp_c14)._m0[274].z;
    }
    float _192 = _184;
    float _194 = _192;
    if (_124)
    {
        _190 = (*spvDescriptorSet0.vp_c14)._m0[275].x;
    }
    float _196 = _190;
    bool _198 = _64 == 208;
    float _200 = _196;
    if (_124)
    {
        _194 = (*spvDescriptorSet0.vp_c14)._m0[275].z;
    }
    float _202 = _194;
    float _204 = _202;
    if (_142)
    {
        _200 = (*spvDescriptorSet0.vp_c14)._m0[276].x;
    }
    float _206 = _200;
    bool _208 = _64 == 224;
    float _210 = _206;
    if (_142)
    {
        _204 = (*spvDescriptorSet0.vp_c14)._m0[276].z;
    }
    float _212 = _204;
    float _214 = _212;
    if (_154)
    {
        _210 = (*spvDescriptorSet0.vp_c14)._m0[277].x;
    }
    float _216 = _210;
    float _218 = _188 + 1.2999999523162841796875;
    bool _220 = _64 == 240;
    float _222 = _216;
    if (_154)
    {
        _214 = (*spvDescriptorSet0.vp_c14)._m0[277].z;
    }
    float _224 = _214;
    float _226 = _224;
    if (_164)
    {
        _222 = (*spvDescriptorSet0.vp_c14)._m0[278].x;
    }
    float _228 = _222;
    float _230 = trunc(_218);
    int _232 = int(_230);
    bool _234 = _64 == 256;
    float _236 = _228;
    if (_164)
    {
        _226 = (*spvDescriptorSet0.vp_c14)._m0[278].z;
    }
    float _238 = _226;
    float _240 = _238;
    if (_174)
    {
        _236 = (*spvDescriptorSet0.vp_c14)._m0[279].x;
    }
    float _242 = _236;
    bool _244 = _64 == 272;
    float _246 = _242;
    if (_174)
    {
        _240 = (*spvDescriptorSet0.vp_c14)._m0[279].z;
    }
    float _248 = _240;
    float _250 = _248;
    if (_182)
    {
        _246 = (*spvDescriptorSet0.vp_c14)._m0[280].x;
    }
    float _252 = _246;
    bool _254 = _64 == 288;
    float _256 = _252;
    if (_182)
    {
        _250 = (*spvDescriptorSet0.vp_c14)._m0[280].z;
    }
    float _258 = _250;
    int _260 = min(_232, 15);
    bool _262 = _64 == 304;
    float _264 = _258;
    if (_198)
    {
        _256 = (*spvDescriptorSet0.vp_c14)._m0[281].x;
    }
    float _266 = _256;
    float _268 = float(_260);
    float _270 = _266;
    if (_198)
    {
        _264 = (*spvDescriptorSet0.vp_c14)._m0[281].z;
    }
    float _272 = _264;
    int _274 = _260 << 4;
    int _276 = _274 + 4288;
    float _278 = _272;
    float _280 = as_type<float>(_276);
    if (_208)
    {
        _270 = (*spvDescriptorSet0.vp_c14)._m0[282].x;
    }
    float _282 = _270;
    bool _284 = _64 == 320;
    float _286 = -_268;
    float _288 = _286 + (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _290 = _282;
    if (_208)
    {
        _278 = (*spvDescriptorSet0.vp_c14)._m0[282].z;
    }
    float _292 = _278;
    float _294 = _292;
    if (_220)
    {
        _290 = (*spvDescriptorSet0.vp_c14)._m0[283].x;
    }
    float _296 = _290;
    float _298 = _288 + 1.0;
    bool _300 = _64 == 336;
    float _302 = _296;
    if (_220)
    {
        _294 = (*spvDescriptorSet0.vp_c14)._m0[283].z;
    }
    float _304 = _294;
    float _306 = _304;
    if (_234)
    {
        _302 = (*spvDescriptorSet0.vp_c14)._m0[284].x;
    }
    float _308 = _302;
    float _310 = exp2(_298);
    bool _312 = _64 == 352;
    float _314 = _308;
    if (_234)
    {
        _306 = (*spvDescriptorSet0.vp_c14)._m0[284].z;
    }
    float _316 = _306;
    float _318 = _316;
    if (_244)
    {
        _314 = (*spvDescriptorSet0.vp_c14)._m0[285].x;
    }
    float _320 = _314;
    bool _322 = _64 == 368;
    float _324 = _320;
    if (_244)
    {
        _318 = (*spvDescriptorSet0.vp_c14)._m0[285].z;
    }
    float _326 = _318;
    float _328 = _326;
    if (_254)
    {
        _324 = (*spvDescriptorSet0.vp_c14)._m0[286].x;
    }
    float _330 = _324;
    bool _332 = _64 == 384;
    float _334 = _330;
    if (_254)
    {
        _328 = (*spvDescriptorSet0.vp_c14)._m0[286].z;
    }
    float _336 = _328;
    float _338 = 1.0 / _310;
    float _340 = _336;
    if (_262)
    {
        _334 = (*spvDescriptorSet0.vp_c14)._m0[287].x;
    }
    float _342 = _334;
    bool _344 = _64 == 400;
    float _346 = _342;
    if (_262)
    {
        _340 = (*spvDescriptorSet0.vp_c14)._m0[287].z;
    }
    float _348 = _340;
    bool _350 = _64 == 416;
    float _352 = _348;
    if (_284)
    {
        _346 = (*spvDescriptorSet0.vp_c14)._m0[288].x;
    }
    float _354 = _346;
    float _356 = _354;
    if (_284)
    {
        _352 = (*spvDescriptorSet0.vp_c14)._m0[288].z;
    }
    float _358 = _352;
    float _360 = _358;
    if (_300)
    {
        _356 = (*spvDescriptorSet0.vp_c14)._m0[289].x;
    }
    float _362 = _356;
    bool _364 = _64 == 432;
    float _366 = _362;
    if (_300)
    {
        _360 = (*spvDescriptorSet0.vp_c14)._m0[289].z;
    }
    float _368 = _360;
    float _370 = _368;
    if (_312)
    {
        _366 = (*spvDescriptorSet0.vp_c14)._m0[290].x;
    }
    float _372 = _366;
    bool _374 = _64 == 448;
    float _376 = _372;
    if (_312)
    {
        _370 = (*spvDescriptorSet0.vp_c14)._m0[290].z;
    }
    float _378 = _370;
    float _380 = _378;
    if (_322)
    {
        _376 = (*spvDescriptorSet0.vp_c14)._m0[291].x;
    }
    float _382 = _376;
    bool _384 = _64 == 464;
    float _386 = _382;
    if (_322)
    {
        _380 = (*spvDescriptorSet0.vp_c14)._m0[291].z;
    }
    float _388 = _380;
    float _390 = _388;
    if (_332)
    {
        _386 = (*spvDescriptorSet0.vp_c14)._m0[292].x;
    }
    float _392 = _386;
    bool _394 = _64 == 480;
    float _396 = _392;
    if (_332)
    {
        _390 = (*spvDescriptorSet0.vp_c14)._m0[292].z;
    }
    float _398 = _390;
    float _400 = _398;
    if (_344)
    {
        _396 = (*spvDescriptorSet0.vp_c14)._m0[293].x;
    }
    float _402 = _396;
    bool _404 = _64 == 496;
    float _406 = _402;
    if (_344)
    {
        _400 = (*spvDescriptorSet0.vp_c14)._m0[293].z;
    }
    float _408 = _400;
    float _410 = _408;
    if (_350)
    {
        _406 = (*spvDescriptorSet0.vp_c14)._m0[294].x;
    }
    float _412 = _406;
    bool _414 = _64 == 512;
    float _416 = _412;
    if (_350)
    {
        _410 = (*spvDescriptorSet0.vp_c14)._m0[294].z;
    }
    float _418 = _410;
    bool _420 = _64 == 528;
    float _422 = _418;
    if (_364)
    {
        _416 = (*spvDescriptorSet0.vp_c14)._m0[295].x;
    }
    float _424 = _416;
    float _426 = _424;
    if (_364)
    {
        _422 = (*spvDescriptorSet0.vp_c14)._m0[295].z;
    }
    float _428 = _422;
    float _430 = _428;
    if (_374)
    {
        _426 = (*spvDescriptorSet0.vp_c14)._m0[296].x;
    }
    float _432 = _426;
    bool _434 = _64 == 544;
    float _436 = _432;
    if (_374)
    {
        _430 = (*spvDescriptorSet0.vp_c14)._m0[296].z;
    }
    float _438 = _430;
    float _440 = _438;
    if (_384)
    {
        _436 = (*spvDescriptorSet0.vp_c14)._m0[297].x;
    }
    float _442 = _436;
    bool _444 = _64 == 560;
    float _446 = _442;
    if (_384)
    {
        _440 = (*spvDescriptorSet0.vp_c14)._m0[297].z;
    }
    float _448 = _440;
    float _450 = _448;
    if (_394)
    {
        _446 = (*spvDescriptorSet0.vp_c14)._m0[298].x;
    }
    float _452 = _446;
    bool _454 = _64 == 576;
    float _456 = _452;
    if (_394)
    {
        _450 = (*spvDescriptorSet0.vp_c14)._m0[298].z;
    }
    float _458 = _450;
    float _460 = _458;
    if (_404)
    {
        _456 = (*spvDescriptorSet0.vp_c14)._m0[299].x;
    }
    float _462 = _456;
    bool _464 = _64 == 592;
    float _466 = _462;
    if (_404)
    {
        _460 = (*spvDescriptorSet0.vp_c14)._m0[299].z;
    }
    float _468 = _460;
    float _470 = _468;
    if (_414)
    {
        _466 = (*spvDescriptorSet0.vp_c14)._m0[300].x;
    }
    float _472 = _466;
    bool _474 = _64 == 608;
    float _476 = _472;
    if (_414)
    {
        _470 = (*spvDescriptorSet0.vp_c14)._m0[300].z;
    }
    float _478 = _470;
    float _480 = _478;
    if (_420)
    {
        _476 = (*spvDescriptorSet0.vp_c14)._m0[301].x;
    }
    float _482 = _476;
    bool _484 = _64 == 624;
    float _486 = _482;
    if (_420)
    {
        _480 = (*spvDescriptorSet0.vp_c14)._m0[301].z;
    }
    float _488 = _480;
    bool _490 = _64 == 640;
    float _492 = _488;
    if (_434)
    {
        _486 = (*spvDescriptorSet0.vp_c14)._m0[302].x;
    }
    float _494 = _486;
    float _496 = _494;
    if (_434)
    {
        _492 = (*spvDescriptorSet0.vp_c14)._m0[302].z;
    }
    float _498 = _492;
    float _500 = _498;
    if (_444)
    {
        _496 = (*spvDescriptorSet0.vp_c14)._m0[303].x;
    }
    float _502 = _496;
    bool _504 = _64 == 656;
    float _506 = _502;
    if (_444)
    {
        _500 = (*spvDescriptorSet0.vp_c14)._m0[303].z;
    }
    float _508 = _500;
    float _510 = _508;
    if (_454)
    {
        _506 = (*spvDescriptorSet0.vp_c14)._m0[304].x;
    }
    float _512 = _506;
    bool _514 = _64 == 672;
    float _516 = _512;
    if (_454)
    {
        _510 = (*spvDescriptorSet0.vp_c14)._m0[304].z;
    }
    float _518 = _510;
    float _520 = _518;
    if (_464)
    {
        _516 = (*spvDescriptorSet0.vp_c14)._m0[305].x;
    }
    float _522 = _516;
    bool _524 = _64 == 688;
    float _526 = _522;
    if (_464)
    {
        _520 = (*spvDescriptorSet0.vp_c14)._m0[305].z;
    }
    float _528 = _520;
    float _530 = _528;
    if (_474)
    {
        _526 = (*spvDescriptorSet0.vp_c14)._m0[306].x;
    }
    float _532 = _526;
    bool _534 = _64 == 704;
    float _536 = _532;
    if (_474)
    {
        _530 = (*spvDescriptorSet0.vp_c14)._m0[306].z;
    }
    float _538 = _530;
    float _540 = _538;
    if (_484)
    {
        _536 = (*spvDescriptorSet0.vp_c14)._m0[307].x;
    }
    float _542 = _536;
    bool _544 = _64 == 720;
    float _546 = _542;
    if (_484)
    {
        _540 = (*spvDescriptorSet0.vp_c14)._m0[307].z;
    }
    float _548 = _540;
    float _550 = _548;
    if (_490)
    {
        _546 = (*spvDescriptorSet0.vp_c14)._m0[308].x;
    }
    float _552 = _546;
    bool _554 = _64 == 736;
    float _556 = _552;
    if (_490)
    {
        _550 = (*spvDescriptorSet0.vp_c14)._m0[308].z;
    }
    float _558 = _550;
    bool _560 = _64 == 752;
    float _562 = _558;
    if (_504)
    {
        _556 = (*spvDescriptorSet0.vp_c14)._m0[309].x;
    }
    float _564 = _556;
    float _566 = _564;
    if (_514)
    {
        _566 = (*spvDescriptorSet0.vp_c14)._m0[310].x;
    }
    float _568 = _566;
    float _570 = _568;
    if (_524)
    {
        _570 = (*spvDescriptorSet0.vp_c14)._m0[311].x;
    }
    float _572 = _570;
    float _574 = _572;
    if (_534)
    {
        _574 = (*spvDescriptorSet0.vp_c14)._m0[312].x;
    }
    float _576 = _574;
    float _578 = _576;
    if (_544)
    {
        _578 = (*spvDescriptorSet0.vp_c14)._m0[313].x;
    }
    float _580 = _578;
    float _582 = _580;
    if (_554)
    {
        _582 = (*spvDescriptorSet0.vp_c14)._m0[314].x;
    }
    float _584 = _582;
    float _586 = _584;
    if (_560)
    {
        _586 = (*spvDescriptorSet0.vp_c14)._m0[315].x;
    }
    float _588 = _586;
    float _590 = _338 * _588;
    if (_504)
    {
        _562 = (*spvDescriptorSet0.vp_c14)._m0[309].z;
    }
    float _592 = _562;
    float _594 = _592;
    if (_514)
    {
        _594 = (*spvDescriptorSet0.vp_c14)._m0[310].z;
    }
    float _596 = _594;
    float _598 = _590 * _49;
    float _600 = _590 * _51;
    float _602 = _596;
    if (_524)
    {
        _602 = (*spvDescriptorSet0.vp_c14)._m0[311].z;
    }
    float _604 = _602;
    float _606 = floor(_598);
    float _608 = _604;
    if (_534)
    {
        _608 = (*spvDescriptorSet0.vp_c14)._m0[312].z;
    }
    float _610 = _608;
    float _612 = _610;
    if (_544)
    {
        _612 = (*spvDescriptorSet0.vp_c14)._m0[313].z;
    }
    float _614 = _612;
    float _616 = _614;
    if (_554)
    {
        _616 = (*spvDescriptorSet0.vp_c14)._m0[314].z;
    }
    float _618 = _616;
    float _620 = _618;
    if (_560)
    {
        _620 = (*spvDescriptorSet0.vp_c14)._m0[315].z;
    }
    float _622 = _620;
    float _624 = floor(_600);
    float _626 = _310 * _622;
    float _628 = -_606;
    float _630 = _598 + _628;
    float _632 = _630 * 2.0;
    float _634 = -_630;
    float _636 = fma(_626, _634, _49);
    int _638 = _276 + 8;
    uint _641 = uint(int(uint(_638) >> uint(2)));
    uint _643 = uint(int(uint(int(_641)) >> uint(2)));
    int _645 = int(_641) & 3;
    float _647 = (*spvDescriptorSet0.vp_c14)._m0[int(_643)][_645];
    int _649 = int(_641) + 1;
    uint _651 = uint(int(uint(_649) >> uint(2)));
    int _653 = _649 & 3;
    float _655 = (*spvDescriptorSet0.vp_c14)._m0[int(_651)][_653];
    float _657 = -_624;
    float _659 = _600 + _657;
    float _661 = floor(_632);
    float _663 = _659 * 2.0;
    float _665 = -_659;
    float _667 = fma(_626, _665, _51);
    float _669 = floor(_663);
    float _671 = _626 * _661;
    float _673 = _671 * 0.5;
    float _675 = _673 + _636;
    float _677 = fma(_55, _675, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _679 = _626 * _669;
    float _681 = _679 * 0.5;
    float _683 = fma(_62, _675, (*spvDescriptorSet0.vp_c15)._m0[3].z);
    float _685 = fma(_675, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _687 = _681 + _667;
    float _689 = -_677;
    float _691 = _689 + _683;
    float _693 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _695 = _685 + _693;
    float _697 = fma(_687, _691, _677);
    float _699 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _701 = _697 + _699;
    float _703 = fma(_687, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _705 = _701 * _701;
    float _707 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _709 = _703 + _707;
    float _711 = fma(_695, _695, _705);
    float _713 = fma(_709, _709, _711);
    float _715 = sqrt(_713);
    float _717 = -_655;
    float _719 = fma(_715, _647, _717);
    float _721 = precise::clamp(_719, 0.0, 1.0);
    float _723 = -_673;
    float _725 = fma(_723, _721, _675);
    float _727 = -_681;
    float _729 = fma(_727, _721, _687);
    float _731 = fma(_725, (*spvDescriptorSet0.vp_c15)._m0[6].x, (*spvDescriptorSet0.vp_c15)._m0[6].z);
    float _733 = fma(_729, (*spvDescriptorSet0.vp_c15)._m0[6].x, (*spvDescriptorSet0.vp_c15)._m0[6].w);
    float _735 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _731);
    float _737 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _733);
    float2 _2150 = float2(_735, _737);
    float _739 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2150, float2(0.0), isnan(_2150)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2150, float2(0.0), isnan(_2150)), level(0.0)).x;
    float _741 = fma(_729, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _743 = fma(_725, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _745 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _747 = _741 + _745;
    float _749 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _751 = _743 + _749;
    float _753 = _747 * _747;
    float _755 = fma(_751, _751, _753);
    float _757 = sqrt(_755);
    bool _759 = _757 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _761 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _763 = _757 + _761;
    float _765 = _729;
    float _767 = _763;
    float _769 = _655;
    if (_759)
    {
        float _771 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        _765 = _771;
    }
    float _773 = _765;
    if (_759)
    {
        float _775 = rsqrt(_755);
        _102 = _775;
    }
    float _777 = _102;
    float _779 = _777;
    if (_759)
    {
        float _781 = _763 * _773;
        _767 = _781;
    }
    float _783 = _767;
    float _785 = (*spvDescriptorSet0.vp_c14)._m0[0].y;
    if (_759)
    {
        float _787 = _783 * 0.15915493667125701904296875;
        _280 = _787;
    }
    float _789 = _280;
    float _791 = _783;
    if (_759)
    {
        float _793 = _789 * 6.283185482025146484375;
        float _795 = sin(_793);
        _791 = _795;
    }
    float _797 = _791;
    float _799 = _737;
    if (_759)
    {
        float _801 = _789 * 6.283185482025146484375;
        float _803 = cos(_801);
        _799 = _803;
    }
    float _805 = _799;
    float _807 = fma(_739, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _809 = _739;
    if (_759)
    {
        float _811 = _807 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        _785 = _811;
    }
    float _813 = _785;
    float _815 = _813;
    if (_759)
    {
        float _817 = fma(_797, _813, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        _104 = _817;
    }
    float _819 = _104;
    if (_759)
    {
        float _821 = _805 + (-1.0);
        _815 = _821;
    }
    float _823 = _815;
    float _825 = _807 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _827 = _823;
    float _829 = _825;
    if (_759)
    {
        float _831 = _777 * _819;
        _769 = _831;
    }
    float _833 = _769;
    if (_759)
    {
        float _835 = _823 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        _809 = _835;
    }
    float _837 = _809;
    float _839 = fma(_743, (*spvDescriptorSet0.vp_c4)._m0[2].x, _825);
    if (!_759)
    {
        _827 = _807;
    }
    float _841 = _827;
    float _843 = _841;
    if (_759)
    {
        float _845 = fma(_807, _805, _837);
        _843 = _845;
    }
    float _847 = _843;
    float _849 = fma(_741, (*spvDescriptorSet0.vp_c4)._m0[2].z, _839);
    float _851 = _849;
    if (!_759)
    {
        _779 = _743;
    }
    float _853 = _779;
    float _855 = _853;
    if (_759)
    {
        float _857 = fma(_751, _833, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        _855 = _857;
    }
    float _859 = _855;
    float _861 = _847 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _863 = _849 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    if (!_759)
    {
        _829 = _741;
    }
    float _865 = _829;
    float _867 = _865;
    if (_759)
    {
        float _869 = _847 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        _851 = _869;
    }
    float _871 = _851;
    float _873 = _871;
    if (_759)
    {
        float _875 = fma(_747, _833, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        _867 = _875;
    }
    float _877 = _867;
    float _879 = _847 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _881 = fma(_859, (*spvDescriptorSet0.vp_c4)._m0[1].x, _861);
    float _883 = _879;
    if (_759)
    {
        float _885 = fma(_859, (*spvDescriptorSet0.vp_c4)._m0[2].x, _871);
        _873 = _885;
    }
    float _887 = _873;
    float _889 = fma(_859, (*spvDescriptorSet0.vp_c4)._m0[0].x, _879);
    float _891 = fma(_877, (*spvDescriptorSet0.vp_c4)._m0[1].z, _881);
    float _893 = _887;
    if (!_759)
    {
        _883 = _863;
    }
    float _895 = _883;
    float _897 = _895;
    if (_759)
    {
        float _899 = fma(_877, (*spvDescriptorSet0.vp_c4)._m0[2].z, _887);
        _893 = _899;
    }
    float _901 = _893;
    float _903 = fma(_877, (*spvDescriptorSet0.vp_c4)._m0[0].z, _889);
    float _905 = _891 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    if (_759)
    {
        float _907 = _901 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _897 = _907;
    }
    float _909 = _897;
    float _911 = _903 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _913 = _905 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _915 = _905 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _917 = _905 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _919 = _905 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _921 = fma(_911, (*spvDescriptorSet0.vp_c4)._m0[8].x, _913);
    float _923 = fma(_911, (*spvDescriptorSet0.vp_c4)._m0[7].x, _915);
    float _925 = fma(_911, (*spvDescriptorSet0.vp_c4)._m0[9].x, _917);
    float _927 = fma(_911, (*spvDescriptorSet0.vp_c4)._m0[10].x, _919);
    float _929 = fma(_909, (*spvDescriptorSet0.vp_c4)._m0[8].z, _921);
    float _931 = fma(_909, (*spvDescriptorSet0.vp_c4)._m0[7].z, _923);
    float _933 = fma(_909, (*spvDescriptorSet0.vp_c4)._m0[9].z, _925);
    float _935 = fma(_909, (*spvDescriptorSet0.vp_c4)._m0[10].z, _927);
    float _937 = _929 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _939 = _931 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _941 = _933 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _943 = _935 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.gl_Position.x = _939;
    out.gl_Position.y = _937;
    out.gl_Position.z = _941;
    out.gl_Position.w = _943;
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
    float _104 = (*spvDescriptorSet0.vp_c15)._m0[0].x;
    if (_68)
    {
        _98 = (*spvDescriptorSet0.vp_c14)._m0[268].z;
    }
    float _106 = _98;
    float _108 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _110 = _94 + _108;
    float _112 = _106;
    if (_70)
    {
        _100 = (*spvDescriptorSet0.vp_c14)._m0[269].x;
    }
    float _114 = _100;
    float _116 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _118 = _96 + _116;
    float _120 = fma(_51, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _122 = _110 * _110;
    bool _124 = _64 == 112;
    float _126 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _128 = _120 + _126;
    float _130 = fma(_118, _118, _122);
    float _132 = _114;
    if (_70)
    {
        _112 = (*spvDescriptorSet0.vp_c14)._m0[269].z;
    }
    float _134 = _112;
    float _136 = _134;
    if (_72)
    {
        _132 = (*spvDescriptorSet0.vp_c14)._m0[270].x;
    }
    float _138 = _132;
    float _140 = fma(_128, _128, _130);
    bool _142 = _64 == 128;
    float _144 = _138;
    if (_72)
    {
        _136 = (*spvDescriptorSet0.vp_c14)._m0[270].z;
    }
    float _146 = _136;
    float _148 = rsqrt(_140);
    float _150 = _146;
    if (_74)
    {
        _144 = (*spvDescriptorSet0.vp_c14)._m0[271].x;
    }
    float _152 = _144;
    bool _154 = _64 == 144;
    float _156 = _152;
    if (_74)
    {
        _150 = (*spvDescriptorSet0.vp_c14)._m0[271].z;
    }
    float _158 = _150;
    float _160 = _158;
    if (_76)
    {
        _156 = (*spvDescriptorSet0.vp_c14)._m0[272].x;
    }
    float _162 = _156;
    bool _164 = _64 == 160;
    float _166 = _162;
    if (_76)
    {
        _160 = (*spvDescriptorSet0.vp_c14)._m0[272].z;
    }
    float _168 = _160;
    float _170 = _168;
    if (_82)
    {
        _166 = (*spvDescriptorSet0.vp_c14)._m0[273].x;
    }
    float _172 = _166;
    bool _174 = _64 == 176;
    float _176 = _148 * (*spvDescriptorSet0.vp_c14)._m0[268].x;
    float _178 = _172;
    if (_82)
    {
        _170 = (*spvDescriptorSet0.vp_c14)._m0[273].z;
    }
    float _180 = _170;
    bool _182 = _64 == 192;
    float _184 = _180;
    if (_92)
    {
        _178 = (*spvDescriptorSet0.vp_c14)._m0[274].x;
    }
    float _186 = _178;
    float _188 = log2(_176);
    float _190 = _186;
    if (_92)
    {
        _184 = (*spvDescriptorSet0.vp_c14)._m0[274].z;
    }
    float _192 = _184;
    float _194 = _192;
    if (_124)
    {
        _190 = (*spvDescriptorSet0.vp_c14)._m0[275].x;
    }
    float _196 = _190;
    bool _198 = _64 == 208;
    float _200 = _196;
    if (_124)
    {
        _194 = (*spvDescriptorSet0.vp_c14)._m0[275].z;
    }
    float _202 = _194;
    float _204 = _202;
    if (_142)
    {
        _200 = (*spvDescriptorSet0.vp_c14)._m0[276].x;
    }
    float _206 = _200;
    bool _208 = _64 == 224;
    float _210 = _206;
    if (_142)
    {
        _204 = (*spvDescriptorSet0.vp_c14)._m0[276].z;
    }
    float _212 = _204;
    float _214 = _212;
    if (_154)
    {
        _210 = (*spvDescriptorSet0.vp_c14)._m0[277].x;
    }
    float _216 = _210;
    float _218 = _188 + 1.2999999523162841796875;
    bool _220 = _64 == 240;
    float _222 = _216;
    if (_154)
    {
        _214 = (*spvDescriptorSet0.vp_c14)._m0[277].z;
    }
    float _224 = _214;
    float _226 = _224;
    if (_164)
    {
        _222 = (*spvDescriptorSet0.vp_c14)._m0[278].x;
    }
    float _228 = _222;
    float _230 = trunc(_218);
    int _232 = int(_230);
    bool _234 = _64 == 256;
    float _236 = _228;
    if (_164)
    {
        _226 = (*spvDescriptorSet0.vp_c14)._m0[278].z;
    }
    float _238 = _226;
    float _240 = _238;
    if (_174)
    {
        _236 = (*spvDescriptorSet0.vp_c14)._m0[279].x;
    }
    float _242 = _236;
    bool _244 = _64 == 272;
    float _246 = _242;
    if (_174)
    {
        _240 = (*spvDescriptorSet0.vp_c14)._m0[279].z;
    }
    float _248 = _240;
    float _250 = _248;
    if (_182)
    {
        _246 = (*spvDescriptorSet0.vp_c14)._m0[280].x;
    }
    float _252 = _246;
    bool _254 = _64 == 288;
    float _256 = _252;
    if (_182)
    {
        _250 = (*spvDescriptorSet0.vp_c14)._m0[280].z;
    }
    float _258 = _250;
    int _260 = min(_232, 15);
    bool _262 = _64 == 304;
    float _264 = _258;
    if (_198)
    {
        _256 = (*spvDescriptorSet0.vp_c14)._m0[281].x;
    }
    float _266 = _256;
    float _268 = float(_260);
    float _270 = _266;
    if (_198)
    {
        _264 = (*spvDescriptorSet0.vp_c14)._m0[281].z;
    }
    float _272 = _264;
    int _274 = _260 << 4;
    int _276 = _274 + 4288;
    float _278 = _272;
    float _280 = as_type<float>(_276);
    if (_208)
    {
        _270 = (*spvDescriptorSet0.vp_c14)._m0[282].x;
    }
    float _282 = _270;
    bool _284 = _64 == 320;
    float _286 = -_268;
    float _288 = _286 + (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _290 = _282;
    if (_208)
    {
        _278 = (*spvDescriptorSet0.vp_c14)._m0[282].z;
    }
    float _292 = _278;
    float _294 = _292;
    if (_220)
    {
        _290 = (*spvDescriptorSet0.vp_c14)._m0[283].x;
    }
    float _296 = _290;
    float _298 = _288 + 1.0;
    bool _300 = _64 == 336;
    float _302 = _296;
    if (_220)
    {
        _294 = (*spvDescriptorSet0.vp_c14)._m0[283].z;
    }
    float _304 = _294;
    float _306 = _304;
    if (_234)
    {
        _302 = (*spvDescriptorSet0.vp_c14)._m0[284].x;
    }
    float _308 = _302;
    float _310 = exp2(_298);
    bool _312 = _64 == 352;
    float _314 = _308;
    if (_234)
    {
        _306 = (*spvDescriptorSet0.vp_c14)._m0[284].z;
    }
    float _316 = _306;
    float _318 = _316;
    if (_244)
    {
        _314 = (*spvDescriptorSet0.vp_c14)._m0[285].x;
    }
    float _320 = _314;
    bool _322 = _64 == 368;
    float _324 = _320;
    if (_244)
    {
        _318 = (*spvDescriptorSet0.vp_c14)._m0[285].z;
    }
    float _326 = _318;
    float _328 = _326;
    if (_254)
    {
        _324 = (*spvDescriptorSet0.vp_c14)._m0[286].x;
    }
    float _330 = _324;
    bool _332 = _64 == 384;
    float _334 = _330;
    if (_254)
    {
        _328 = (*spvDescriptorSet0.vp_c14)._m0[286].z;
    }
    float _336 = _328;
    float _338 = 1.0 / _310;
    float _340 = _336;
    if (_262)
    {
        _334 = (*spvDescriptorSet0.vp_c14)._m0[287].x;
    }
    float _342 = _334;
    bool _344 = _64 == 400;
    float _346 = _342;
    if (_262)
    {
        _340 = (*spvDescriptorSet0.vp_c14)._m0[287].z;
    }
    float _348 = _340;
    bool _350 = _64 == 416;
    float _352 = _348;
    if (_284)
    {
        _346 = (*spvDescriptorSet0.vp_c14)._m0[288].x;
    }
    float _354 = _346;
    float _356 = _354;
    if (_284)
    {
        _352 = (*spvDescriptorSet0.vp_c14)._m0[288].z;
    }
    float _358 = _352;
    float _360 = _358;
    if (_300)
    {
        _356 = (*spvDescriptorSet0.vp_c14)._m0[289].x;
    }
    float _362 = _356;
    bool _364 = _64 == 432;
    float _366 = _362;
    if (_300)
    {
        _360 = (*spvDescriptorSet0.vp_c14)._m0[289].z;
    }
    float _368 = _360;
    float _370 = _368;
    if (_312)
    {
        _366 = (*spvDescriptorSet0.vp_c14)._m0[290].x;
    }
    float _372 = _366;
    bool _374 = _64 == 448;
    float _376 = _372;
    if (_312)
    {
        _370 = (*spvDescriptorSet0.vp_c14)._m0[290].z;
    }
    float _378 = _370;
    float _380 = _378;
    if (_322)
    {
        _376 = (*spvDescriptorSet0.vp_c14)._m0[291].x;
    }
    float _382 = _376;
    bool _384 = _64 == 464;
    float _386 = _382;
    if (_322)
    {
        _380 = (*spvDescriptorSet0.vp_c14)._m0[291].z;
    }
    float _388 = _380;
    float _390 = _388;
    if (_332)
    {
        _386 = (*spvDescriptorSet0.vp_c14)._m0[292].x;
    }
    float _392 = _386;
    bool _394 = _64 == 480;
    float _396 = _392;
    if (_332)
    {
        _390 = (*spvDescriptorSet0.vp_c14)._m0[292].z;
    }
    float _398 = _390;
    float _400 = _398;
    if (_344)
    {
        _396 = (*spvDescriptorSet0.vp_c14)._m0[293].x;
    }
    float _402 = _396;
    bool _404 = _64 == 496;
    float _406 = _402;
    if (_344)
    {
        _400 = (*spvDescriptorSet0.vp_c14)._m0[293].z;
    }
    float _408 = _400;
    float _410 = _408;
    if (_350)
    {
        _406 = (*spvDescriptorSet0.vp_c14)._m0[294].x;
    }
    float _412 = _406;
    bool _414 = _64 == 512;
    float _416 = _412;
    if (_350)
    {
        _410 = (*spvDescriptorSet0.vp_c14)._m0[294].z;
    }
    float _418 = _410;
    bool _420 = _64 == 528;
    float _422 = _418;
    if (_364)
    {
        _416 = (*spvDescriptorSet0.vp_c14)._m0[295].x;
    }
    float _424 = _416;
    float _426 = _424;
    if (_364)
    {
        _422 = (*spvDescriptorSet0.vp_c14)._m0[295].z;
    }
    float _428 = _422;
    float _430 = _428;
    if (_374)
    {
        _426 = (*spvDescriptorSet0.vp_c14)._m0[296].x;
    }
    float _432 = _426;
    bool _434 = _64 == 544;
    float _436 = _432;
    if (_374)
    {
        _430 = (*spvDescriptorSet0.vp_c14)._m0[296].z;
    }
    float _438 = _430;
    float _440 = _438;
    if (_384)
    {
        _436 = (*spvDescriptorSet0.vp_c14)._m0[297].x;
    }
    float _442 = _436;
    bool _444 = _64 == 560;
    float _446 = _442;
    if (_384)
    {
        _440 = (*spvDescriptorSet0.vp_c14)._m0[297].z;
    }
    float _448 = _440;
    float _450 = _448;
    if (_394)
    {
        _446 = (*spvDescriptorSet0.vp_c14)._m0[298].x;
    }
    float _452 = _446;
    bool _454 = _64 == 576;
    float _456 = _452;
    if (_394)
    {
        _450 = (*spvDescriptorSet0.vp_c14)._m0[298].z;
    }
    float _458 = _450;
    float _460 = _458;
    if (_404)
    {
        _456 = (*spvDescriptorSet0.vp_c14)._m0[299].x;
    }
    float _462 = _456;
    bool _464 = _64 == 592;
    float _466 = _462;
    if (_404)
    {
        _460 = (*spvDescriptorSet0.vp_c14)._m0[299].z;
    }
    float _468 = _460;
    float _470 = _468;
    if (_414)
    {
        _466 = (*spvDescriptorSet0.vp_c14)._m0[300].x;
    }
    float _472 = _466;
    bool _474 = _64 == 608;
    float _476 = _472;
    if (_414)
    {
        _470 = (*spvDescriptorSet0.vp_c14)._m0[300].z;
    }
    float _478 = _470;
    float _480 = _478;
    if (_420)
    {
        _476 = (*spvDescriptorSet0.vp_c14)._m0[301].x;
    }
    float _482 = _476;
    bool _484 = _64 == 624;
    float _486 = _482;
    if (_420)
    {
        _480 = (*spvDescriptorSet0.vp_c14)._m0[301].z;
    }
    float _488 = _480;
    bool _490 = _64 == 640;
    float _492 = _488;
    if (_434)
    {
        _486 = (*spvDescriptorSet0.vp_c14)._m0[302].x;
    }
    float _494 = _486;
    float _496 = _494;
    if (_434)
    {
        _492 = (*spvDescriptorSet0.vp_c14)._m0[302].z;
    }
    float _498 = _492;
    float _500 = _498;
    if (_444)
    {
        _496 = (*spvDescriptorSet0.vp_c14)._m0[303].x;
    }
    float _502 = _496;
    bool _504 = _64 == 656;
    float _506 = _502;
    if (_444)
    {
        _500 = (*spvDescriptorSet0.vp_c14)._m0[303].z;
    }
    float _508 = _500;
    float _510 = _508;
    if (_454)
    {
        _506 = (*spvDescriptorSet0.vp_c14)._m0[304].x;
    }
    float _512 = _506;
    bool _514 = _64 == 672;
    float _516 = _512;
    if (_454)
    {
        _510 = (*spvDescriptorSet0.vp_c14)._m0[304].z;
    }
    float _518 = _510;
    float _520 = _518;
    if (_464)
    {
        _516 = (*spvDescriptorSet0.vp_c14)._m0[305].x;
    }
    float _522 = _516;
    bool _524 = _64 == 688;
    float _526 = _522;
    if (_464)
    {
        _520 = (*spvDescriptorSet0.vp_c14)._m0[305].z;
    }
    float _528 = _520;
    float _530 = _528;
    if (_474)
    {
        _526 = (*spvDescriptorSet0.vp_c14)._m0[306].x;
    }
    float _532 = _526;
    bool _534 = _64 == 704;
    float _536 = _532;
    if (_474)
    {
        _530 = (*spvDescriptorSet0.vp_c14)._m0[306].z;
    }
    float _538 = _530;
    float _540 = _538;
    if (_484)
    {
        _536 = (*spvDescriptorSet0.vp_c14)._m0[307].x;
    }
    float _542 = _536;
    bool _544 = _64 == 720;
    float _546 = _542;
    if (_484)
    {
        _540 = (*spvDescriptorSet0.vp_c14)._m0[307].z;
    }
    float _548 = _540;
    float _550 = _548;
    if (_490)
    {
        _546 = (*spvDescriptorSet0.vp_c14)._m0[308].x;
    }
    float _552 = _546;
    bool _554 = _64 == 736;
    float _556 = _552;
    if (_490)
    {
        _550 = (*spvDescriptorSet0.vp_c14)._m0[308].z;
    }
    float _558 = _550;
    bool _560 = _64 == 752;
    float _562 = _558;
    if (_504)
    {
        _556 = (*spvDescriptorSet0.vp_c14)._m0[309].x;
    }
    float _564 = _556;
    float _566 = _564;
    if (_514)
    {
        _566 = (*spvDescriptorSet0.vp_c14)._m0[310].x;
    }
    float _568 = _566;
    float _570 = _568;
    if (_524)
    {
        _570 = (*spvDescriptorSet0.vp_c14)._m0[311].x;
    }
    float _572 = _570;
    float _574 = _572;
    if (_534)
    {
        _574 = (*spvDescriptorSet0.vp_c14)._m0[312].x;
    }
    float _576 = _574;
    float _578 = _576;
    if (_544)
    {
        _578 = (*spvDescriptorSet0.vp_c14)._m0[313].x;
    }
    float _580 = _578;
    float _582 = _580;
    if (_554)
    {
        _582 = (*spvDescriptorSet0.vp_c14)._m0[314].x;
    }
    float _584 = _582;
    float _586 = _584;
    if (_560)
    {
        _586 = (*spvDescriptorSet0.vp_c14)._m0[315].x;
    }
    float _588 = _586;
    float _590 = _338 * _588;
    if (_504)
    {
        _562 = (*spvDescriptorSet0.vp_c14)._m0[309].z;
    }
    float _592 = _562;
    float _594 = _592;
    if (_514)
    {
        _594 = (*spvDescriptorSet0.vp_c14)._m0[310].z;
    }
    float _596 = _594;
    float _598 = _590 * _49;
    float _600 = _590 * _51;
    float _602 = _596;
    if (_524)
    {
        _602 = (*spvDescriptorSet0.vp_c14)._m0[311].z;
    }
    float _604 = _602;
    float _606 = floor(_598);
    float _608 = _604;
    if (_534)
    {
        _608 = (*spvDescriptorSet0.vp_c14)._m0[312].z;
    }
    float _610 = _608;
    float _612 = _610;
    if (_544)
    {
        _612 = (*spvDescriptorSet0.vp_c14)._m0[313].z;
    }
    float _614 = _612;
    float _616 = _614;
    if (_554)
    {
        _616 = (*spvDescriptorSet0.vp_c14)._m0[314].z;
    }
    float _618 = _616;
    float _620 = _618;
    if (_560)
    {
        _620 = (*spvDescriptorSet0.vp_c14)._m0[315].z;
    }
    float _622 = _620;
    float _624 = floor(_600);
    float _626 = _310 * _622;
    float _628 = -_606;
    float _630 = _598 + _628;
    float _632 = _630 * 2.0;
    float _634 = -_630;
    float _636 = fma(_626, _634, _49);
    int _638 = _276 + 8;
    uint _641 = uint(int(uint(_638) >> uint(2)));
    uint _643 = uint(int(uint(int(_641)) >> uint(2)));
    int _645 = int(_641) & 3;
    float _647 = (*spvDescriptorSet0.vp_c14)._m0[int(_643)][_645];
    int _649 = int(_641) + 1;
    uint _651 = uint(int(uint(_649) >> uint(2)));
    int _653 = _649 & 3;
    float _655 = (*spvDescriptorSet0.vp_c14)._m0[int(_651)][_653];
    float _657 = -_624;
    float _659 = _600 + _657;
    float _661 = floor(_632);
    float _663 = _659 * 2.0;
    float _665 = -_659;
    float _667 = fma(_626, _665, _51);
    float _669 = floor(_663);
    float _671 = _626 * _661;
    float _673 = _671 * 0.5;
    float _675 = _673 + _636;
    float _677 = fma(_55, _675, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _679 = _626 * _669;
    float _681 = _679 * 0.5;
    float _683 = fma(_62, _675, (*spvDescriptorSet0.vp_c15)._m0[3].z);
    float _685 = fma(_675, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _687 = _681 + _667;
    float _689 = -_677;
    float _691 = _689 + _683;
    float _693 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _695 = _685 + _693;
    float _697 = fma(_687, _691, _677);
    float _699 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _701 = _697 + _699;
    float _703 = fma(_687, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _705 = _701 * _701;
    float _707 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _709 = _703 + _707;
    float _711 = fma(_695, _695, _705);
    float _713 = fma(_709, _709, _711);
    float _715 = sqrt(_713);
    float _717 = -_655;
    float _719 = fma(_715, _647, _717);
    float _721 = precise::clamp(_719, 0.0, 1.0);
    float _723 = -_673;
    float _725 = fma(_723, _721, _675);
    float _727 = -_681;
    float _729 = fma(_727, _721, _687);
    float _731 = fma(_725, (*spvDescriptorSet0.vp_c15)._m0[6].x, (*spvDescriptorSet0.vp_c15)._m0[6].z);
    float _733 = fma(_729, (*spvDescriptorSet0.vp_c15)._m0[6].x, (*spvDescriptorSet0.vp_c15)._m0[6].w);
    float _735 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _731);
    float _737 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _733);
    float2 _2150 = float2(_735, _737);
    float _739 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2150, float2(0.0), isnan(_2150)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2150, float2(0.0), isnan(_2150)), level(0.0)).x;
    float _741 = fma(_729, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _743 = fma(_725, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _745 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _747 = _741 + _745;
    float _749 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _751 = _743 + _749;
    float _753 = _747 * _747;
    float _755 = fma(_751, _751, _753);
    float _757 = sqrt(_755);
    bool _759 = _757 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _761 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _763 = _757 + _761;
    float _765 = _729;
    float _767 = _763;
    float _769 = _655;
    if (_759)
    {
        float _771 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        _765 = _771;
    }
    float _773 = _765;
    if (_759)
    {
        float _775 = rsqrt(_755);
        _102 = _775;
    }
    float _777 = _102;
    float _779 = _777;
    if (_759)
    {
        float _781 = _763 * _773;
        _767 = _781;
    }
    float _783 = _767;
    float _785 = (*spvDescriptorSet0.vp_c14)._m0[0].y;
    if (_759)
    {
        float _787 = _783 * 0.15915493667125701904296875;
        _280 = _787;
    }
    float _789 = _280;
    float _791 = _783;
    if (_759)
    {
        float _793 = _789 * 6.283185482025146484375;
        float _795 = sin(_793);
        _791 = _795;
    }
    float _797 = _791;
    float _799 = _737;
    if (_759)
    {
        float _801 = _789 * 6.283185482025146484375;
        float _803 = cos(_801);
        _799 = _803;
    }
    float _805 = _799;
    float _807 = fma(_739, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _809 = _739;
    if (_759)
    {
        float _811 = _807 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        _785 = _811;
    }
    float _813 = _785;
    float _815 = _813;
    if (_759)
    {
        float _817 = fma(_797, _813, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        _104 = _817;
    }
    float _819 = _104;
    if (_759)
    {
        float _821 = _805 + (-1.0);
        _815 = _821;
    }
    float _823 = _815;
    float _825 = _807 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _827 = _823;
    float _829 = _825;
    if (_759)
    {
        float _831 = _777 * _819;
        _769 = _831;
    }
    float _833 = _769;
    if (_759)
    {
        float _835 = _823 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        _809 = _835;
    }
    float _837 = _809;
    float _839 = fma(_743, (*spvDescriptorSet0.vp_c4)._m0[2].x, _825);
    if (!_759)
    {
        _827 = _807;
    }
    float _841 = _827;
    float _843 = _841;
    if (_759)
    {
        float _845 = fma(_807, _805, _837);
        _843 = _845;
    }
    float _847 = _843;
    float _849 = fma(_741, (*spvDescriptorSet0.vp_c4)._m0[2].z, _839);
    float _851 = _849;
    if (!_759)
    {
        _779 = _743;
    }
    float _853 = _779;
    float _855 = _853;
    if (_759)
    {
        float _857 = fma(_751, _833, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        _855 = _857;
    }
    float _859 = _855;
    float _861 = _847 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _863 = _849 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    if (!_759)
    {
        _829 = _741;
    }
    float _865 = _829;
    float _867 = _865;
    if (_759)
    {
        float _869 = _847 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        _851 = _869;
    }
    float _871 = _851;
    float _873 = _871;
    if (_759)
    {
        float _875 = fma(_747, _833, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        _867 = _875;
    }
    float _877 = _867;
    float _879 = _847 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _881 = fma(_859, (*spvDescriptorSet0.vp_c4)._m0[1].x, _861);
    float _883 = _879;
    if (_759)
    {
        float _885 = fma(_859, (*spvDescriptorSet0.vp_c4)._m0[2].x, _871);
        _873 = _885;
    }
    float _887 = _873;
    float _889 = fma(_859, (*spvDescriptorSet0.vp_c4)._m0[0].x, _879);
    float _891 = fma(_877, (*spvDescriptorSet0.vp_c4)._m0[1].z, _881);
    float _893 = _887;
    if (!_759)
    {
        _883 = _863;
    }
    float _895 = _883;
    float _897 = _895;
    if (_759)
    {
        float _899 = fma(_877, (*spvDescriptorSet0.vp_c4)._m0[2].z, _887);
        _893 = _899;
    }
    float _901 = _893;
    float _903 = fma(_877, (*spvDescriptorSet0.vp_c4)._m0[0].z, _889);
    float _905 = _891 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    if (_759)
    {
        float _907 = _901 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _897 = _907;
    }
    float _909 = _897;
    float _911 = _903 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _913 = _905 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _915 = _905 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _917 = _905 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _919 = _905 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _921 = fma(_911, (*spvDescriptorSet0.vp_c4)._m0[8].x, _913);
    float _923 = fma(_911, (*spvDescriptorSet0.vp_c4)._m0[7].x, _915);
    float _925 = fma(_911, (*spvDescriptorSet0.vp_c4)._m0[9].x, _917);
    float _927 = fma(_911, (*spvDescriptorSet0.vp_c4)._m0[10].x, _919);
    float _929 = fma(_909, (*spvDescriptorSet0.vp_c4)._m0[8].z, _921);
    float _931 = fma(_909, (*spvDescriptorSet0.vp_c4)._m0[7].z, _923);
    float _933 = fma(_909, (*spvDescriptorSet0.vp_c4)._m0[9].z, _925);
    float _935 = fma(_909, (*spvDescriptorSet0.vp_c4)._m0[10].z, _927);
    float _937 = _929 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _939 = _931 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _941 = _933 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _943 = _935 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.gl_Position.x = _939;
    out.gl_Position.y = _937;
    out.gl_Position.z = _941;
    out.gl_Position.w = _943;
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
    float _104 = (*spvDescriptorSet0.vp_c15)._m0[0].x;
    if (_68)
    {
        _98 = (*spvDescriptorSet0.vp_c14)._m0[268].z;
    }
    float _106 = _98;
    float _108 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _110 = _94 + _108;
    float _112 = _106;
    if (_70)
    {
        _100 = (*spvDescriptorSet0.vp_c14)._m0[269].x;
    }
    float _114 = _100;
    float _116 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _118 = _96 + _116;
    float _120 = fma(_51, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _122 = _110 * _110;
    bool _124 = _64 == 112;
    float _126 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _128 = _120 + _126;
    float _130 = fma(_118, _118, _122);
    float _132 = _114;
    if (_70)
    {
        _112 = (*spvDescriptorSet0.vp_c14)._m0[269].z;
    }
    float _134 = _112;
    float _136 = _134;
    if (_72)
    {
        _132 = (*spvDescriptorSet0.vp_c14)._m0[270].x;
    }
    float _138 = _132;
    float _140 = fma(_128, _128, _130);
    bool _142 = _64 == 128;
    float _144 = _138;
    if (_72)
    {
        _136 = (*spvDescriptorSet0.vp_c14)._m0[270].z;
    }
    float _146 = _136;
    float _148 = rsqrt(_140);
    float _150 = _146;
    if (_74)
    {
        _144 = (*spvDescriptorSet0.vp_c14)._m0[271].x;
    }
    float _152 = _144;
    bool _154 = _64 == 144;
    float _156 = _152;
    if (_74)
    {
        _150 = (*spvDescriptorSet0.vp_c14)._m0[271].z;
    }
    float _158 = _150;
    float _160 = _158;
    if (_76)
    {
        _156 = (*spvDescriptorSet0.vp_c14)._m0[272].x;
    }
    float _162 = _156;
    bool _164 = _64 == 160;
    float _166 = _162;
    if (_76)
    {
        _160 = (*spvDescriptorSet0.vp_c14)._m0[272].z;
    }
    float _168 = _160;
    float _170 = _168;
    if (_82)
    {
        _166 = (*spvDescriptorSet0.vp_c14)._m0[273].x;
    }
    float _172 = _166;
    bool _174 = _64 == 176;
    float _176 = _148 * (*spvDescriptorSet0.vp_c14)._m0[268].x;
    float _178 = _172;
    if (_82)
    {
        _170 = (*spvDescriptorSet0.vp_c14)._m0[273].z;
    }
    float _180 = _170;
    bool _182 = _64 == 192;
    float _184 = _180;
    if (_92)
    {
        _178 = (*spvDescriptorSet0.vp_c14)._m0[274].x;
    }
    float _186 = _178;
    float _188 = log2(_176);
    float _190 = _186;
    if (_92)
    {
        _184 = (*spvDescriptorSet0.vp_c14)._m0[274].z;
    }
    float _192 = _184;
    float _194 = _192;
    if (_124)
    {
        _190 = (*spvDescriptorSet0.vp_c14)._m0[275].x;
    }
    float _196 = _190;
    bool _198 = _64 == 208;
    float _200 = _196;
    if (_124)
    {
        _194 = (*spvDescriptorSet0.vp_c14)._m0[275].z;
    }
    float _202 = _194;
    float _204 = _202;
    if (_142)
    {
        _200 = (*spvDescriptorSet0.vp_c14)._m0[276].x;
    }
    float _206 = _200;
    bool _208 = _64 == 224;
    float _210 = _206;
    if (_142)
    {
        _204 = (*spvDescriptorSet0.vp_c14)._m0[276].z;
    }
    float _212 = _204;
    float _214 = _212;
    if (_154)
    {
        _210 = (*spvDescriptorSet0.vp_c14)._m0[277].x;
    }
    float _216 = _210;
    float _218 = _188 + 1.2999999523162841796875;
    bool _220 = _64 == 240;
    float _222 = _216;
    if (_154)
    {
        _214 = (*spvDescriptorSet0.vp_c14)._m0[277].z;
    }
    float _224 = _214;
    float _226 = _224;
    if (_164)
    {
        _222 = (*spvDescriptorSet0.vp_c14)._m0[278].x;
    }
    float _228 = _222;
    float _230 = trunc(_218);
    int _232 = int(_230);
    bool _234 = _64 == 256;
    float _236 = _228;
    if (_164)
    {
        _226 = (*spvDescriptorSet0.vp_c14)._m0[278].z;
    }
    float _238 = _226;
    float _240 = _238;
    if (_174)
    {
        _236 = (*spvDescriptorSet0.vp_c14)._m0[279].x;
    }
    float _242 = _236;
    bool _244 = _64 == 272;
    float _246 = _242;
    if (_174)
    {
        _240 = (*spvDescriptorSet0.vp_c14)._m0[279].z;
    }
    float _248 = _240;
    float _250 = _248;
    if (_182)
    {
        _246 = (*spvDescriptorSet0.vp_c14)._m0[280].x;
    }
    float _252 = _246;
    bool _254 = _64 == 288;
    float _256 = _252;
    if (_182)
    {
        _250 = (*spvDescriptorSet0.vp_c14)._m0[280].z;
    }
    float _258 = _250;
    int _260 = min(_232, 15);
    bool _262 = _64 == 304;
    float _264 = _258;
    if (_198)
    {
        _256 = (*spvDescriptorSet0.vp_c14)._m0[281].x;
    }
    float _266 = _256;
    float _268 = float(_260);
    float _270 = _266;
    if (_198)
    {
        _264 = (*spvDescriptorSet0.vp_c14)._m0[281].z;
    }
    float _272 = _264;
    int _274 = _260 << 4;
    int _276 = _274 + 4288;
    float _278 = _272;
    float _280 = as_type<float>(_276);
    if (_208)
    {
        _270 = (*spvDescriptorSet0.vp_c14)._m0[282].x;
    }
    float _282 = _270;
    bool _284 = _64 == 320;
    float _286 = -_268;
    float _288 = _286 + (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _290 = _282;
    if (_208)
    {
        _278 = (*spvDescriptorSet0.vp_c14)._m0[282].z;
    }
    float _292 = _278;
    float _294 = _292;
    if (_220)
    {
        _290 = (*spvDescriptorSet0.vp_c14)._m0[283].x;
    }
    float _296 = _290;
    float _298 = _288 + 1.0;
    bool _300 = _64 == 336;
    float _302 = _296;
    if (_220)
    {
        _294 = (*spvDescriptorSet0.vp_c14)._m0[283].z;
    }
    float _304 = _294;
    float _306 = _304;
    if (_234)
    {
        _302 = (*spvDescriptorSet0.vp_c14)._m0[284].x;
    }
    float _308 = _302;
    float _310 = exp2(_298);
    bool _312 = _64 == 352;
    float _314 = _308;
    if (_234)
    {
        _306 = (*spvDescriptorSet0.vp_c14)._m0[284].z;
    }
    float _316 = _306;
    float _318 = _316;
    if (_244)
    {
        _314 = (*spvDescriptorSet0.vp_c14)._m0[285].x;
    }
    float _320 = _314;
    bool _322 = _64 == 368;
    float _324 = _320;
    if (_244)
    {
        _318 = (*spvDescriptorSet0.vp_c14)._m0[285].z;
    }
    float _326 = _318;
    float _328 = _326;
    if (_254)
    {
        _324 = (*spvDescriptorSet0.vp_c14)._m0[286].x;
    }
    float _330 = _324;
    bool _332 = _64 == 384;
    float _334 = _330;
    if (_254)
    {
        _328 = (*spvDescriptorSet0.vp_c14)._m0[286].z;
    }
    float _336 = _328;
    float _338 = 1.0 / _310;
    float _340 = _336;
    if (_262)
    {
        _334 = (*spvDescriptorSet0.vp_c14)._m0[287].x;
    }
    float _342 = _334;
    bool _344 = _64 == 400;
    float _346 = _342;
    if (_262)
    {
        _340 = (*spvDescriptorSet0.vp_c14)._m0[287].z;
    }
    float _348 = _340;
    bool _350 = _64 == 416;
    float _352 = _348;
    if (_284)
    {
        _346 = (*spvDescriptorSet0.vp_c14)._m0[288].x;
    }
    float _354 = _346;
    float _356 = _354;
    if (_284)
    {
        _352 = (*spvDescriptorSet0.vp_c14)._m0[288].z;
    }
    float _358 = _352;
    float _360 = _358;
    if (_300)
    {
        _356 = (*spvDescriptorSet0.vp_c14)._m0[289].x;
    }
    float _362 = _356;
    bool _364 = _64 == 432;
    float _366 = _362;
    if (_300)
    {
        _360 = (*spvDescriptorSet0.vp_c14)._m0[289].z;
    }
    float _368 = _360;
    float _370 = _368;
    if (_312)
    {
        _366 = (*spvDescriptorSet0.vp_c14)._m0[290].x;
    }
    float _372 = _366;
    bool _374 = _64 == 448;
    float _376 = _372;
    if (_312)
    {
        _370 = (*spvDescriptorSet0.vp_c14)._m0[290].z;
    }
    float _378 = _370;
    float _380 = _378;
    if (_322)
    {
        _376 = (*spvDescriptorSet0.vp_c14)._m0[291].x;
    }
    float _382 = _376;
    bool _384 = _64 == 464;
    float _386 = _382;
    if (_322)
    {
        _380 = (*spvDescriptorSet0.vp_c14)._m0[291].z;
    }
    float _388 = _380;
    float _390 = _388;
    if (_332)
    {
        _386 = (*spvDescriptorSet0.vp_c14)._m0[292].x;
    }
    float _392 = _386;
    bool _394 = _64 == 480;
    float _396 = _392;
    if (_332)
    {
        _390 = (*spvDescriptorSet0.vp_c14)._m0[292].z;
    }
    float _398 = _390;
    float _400 = _398;
    if (_344)
    {
        _396 = (*spvDescriptorSet0.vp_c14)._m0[293].x;
    }
    float _402 = _396;
    bool _404 = _64 == 496;
    float _406 = _402;
    if (_344)
    {
        _400 = (*spvDescriptorSet0.vp_c14)._m0[293].z;
    }
    float _408 = _400;
    float _410 = _408;
    if (_350)
    {
        _406 = (*spvDescriptorSet0.vp_c14)._m0[294].x;
    }
    float _412 = _406;
    bool _414 = _64 == 512;
    float _416 = _412;
    if (_350)
    {
        _410 = (*spvDescriptorSet0.vp_c14)._m0[294].z;
    }
    float _418 = _410;
    bool _420 = _64 == 528;
    float _422 = _418;
    if (_364)
    {
        _416 = (*spvDescriptorSet0.vp_c14)._m0[295].x;
    }
    float _424 = _416;
    float _426 = _424;
    if (_364)
    {
        _422 = (*spvDescriptorSet0.vp_c14)._m0[295].z;
    }
    float _428 = _422;
    float _430 = _428;
    if (_374)
    {
        _426 = (*spvDescriptorSet0.vp_c14)._m0[296].x;
    }
    float _432 = _426;
    bool _434 = _64 == 544;
    float _436 = _432;
    if (_374)
    {
        _430 = (*spvDescriptorSet0.vp_c14)._m0[296].z;
    }
    float _438 = _430;
    float _440 = _438;
    if (_384)
    {
        _436 = (*spvDescriptorSet0.vp_c14)._m0[297].x;
    }
    float _442 = _436;
    bool _444 = _64 == 560;
    float _446 = _442;
    if (_384)
    {
        _440 = (*spvDescriptorSet0.vp_c14)._m0[297].z;
    }
    float _448 = _440;
    float _450 = _448;
    if (_394)
    {
        _446 = (*spvDescriptorSet0.vp_c14)._m0[298].x;
    }
    float _452 = _446;
    bool _454 = _64 == 576;
    float _456 = _452;
    if (_394)
    {
        _450 = (*spvDescriptorSet0.vp_c14)._m0[298].z;
    }
    float _458 = _450;
    float _460 = _458;
    if (_404)
    {
        _456 = (*spvDescriptorSet0.vp_c14)._m0[299].x;
    }
    float _462 = _456;
    bool _464 = _64 == 592;
    float _466 = _462;
    if (_404)
    {
        _460 = (*spvDescriptorSet0.vp_c14)._m0[299].z;
    }
    float _468 = _460;
    float _470 = _468;
    if (_414)
    {
        _466 = (*spvDescriptorSet0.vp_c14)._m0[300].x;
    }
    float _472 = _466;
    bool _474 = _64 == 608;
    float _476 = _472;
    if (_414)
    {
        _470 = (*spvDescriptorSet0.vp_c14)._m0[300].z;
    }
    float _478 = _470;
    float _480 = _478;
    if (_420)
    {
        _476 = (*spvDescriptorSet0.vp_c14)._m0[301].x;
    }
    float _482 = _476;
    bool _484 = _64 == 624;
    float _486 = _482;
    if (_420)
    {
        _480 = (*spvDescriptorSet0.vp_c14)._m0[301].z;
    }
    float _488 = _480;
    bool _490 = _64 == 640;
    float _492 = _488;
    if (_434)
    {
        _486 = (*spvDescriptorSet0.vp_c14)._m0[302].x;
    }
    float _494 = _486;
    float _496 = _494;
    if (_434)
    {
        _492 = (*spvDescriptorSet0.vp_c14)._m0[302].z;
    }
    float _498 = _492;
    float _500 = _498;
    if (_444)
    {
        _496 = (*spvDescriptorSet0.vp_c14)._m0[303].x;
    }
    float _502 = _496;
    bool _504 = _64 == 656;
    float _506 = _502;
    if (_444)
    {
        _500 = (*spvDescriptorSet0.vp_c14)._m0[303].z;
    }
    float _508 = _500;
    float _510 = _508;
    if (_454)
    {
        _506 = (*spvDescriptorSet0.vp_c14)._m0[304].x;
    }
    float _512 = _506;
    bool _514 = _64 == 672;
    float _516 = _512;
    if (_454)
    {
        _510 = (*spvDescriptorSet0.vp_c14)._m0[304].z;
    }
    float _518 = _510;
    float _520 = _518;
    if (_464)
    {
        _516 = (*spvDescriptorSet0.vp_c14)._m0[305].x;
    }
    float _522 = _516;
    bool _524 = _64 == 688;
    float _526 = _522;
    if (_464)
    {
        _520 = (*spvDescriptorSet0.vp_c14)._m0[305].z;
    }
    float _528 = _520;
    float _530 = _528;
    if (_474)
    {
        _526 = (*spvDescriptorSet0.vp_c14)._m0[306].x;
    }
    float _532 = _526;
    bool _534 = _64 == 704;
    float _536 = _532;
    if (_474)
    {
        _530 = (*spvDescriptorSet0.vp_c14)._m0[306].z;
    }
    float _538 = _530;
    float _540 = _538;
    if (_484)
    {
        _536 = (*spvDescriptorSet0.vp_c14)._m0[307].x;
    }
    float _542 = _536;
    bool _544 = _64 == 720;
    float _546 = _542;
    if (_484)
    {
        _540 = (*spvDescriptorSet0.vp_c14)._m0[307].z;
    }
    float _548 = _540;
    float _550 = _548;
    if (_490)
    {
        _546 = (*spvDescriptorSet0.vp_c14)._m0[308].x;
    }
    float _552 = _546;
    bool _554 = _64 == 736;
    float _556 = _552;
    if (_490)
    {
        _550 = (*spvDescriptorSet0.vp_c14)._m0[308].z;
    }
    float _558 = _550;
    bool _560 = _64 == 752;
    float _562 = _558;
    if (_504)
    {
        _556 = (*spvDescriptorSet0.vp_c14)._m0[309].x;
    }
    float _564 = _556;
    float _566 = _564;
    if (_514)
    {
        _566 = (*spvDescriptorSet0.vp_c14)._m0[310].x;
    }
    float _568 = _566;
    float _570 = _568;
    if (_524)
    {
        _570 = (*spvDescriptorSet0.vp_c14)._m0[311].x;
    }
    float _572 = _570;
    float _574 = _572;
    if (_534)
    {
        _574 = (*spvDescriptorSet0.vp_c14)._m0[312].x;
    }
    float _576 = _574;
    float _578 = _576;
    if (_544)
    {
        _578 = (*spvDescriptorSet0.vp_c14)._m0[313].x;
    }
    float _580 = _578;
    float _582 = _580;
    if (_554)
    {
        _582 = (*spvDescriptorSet0.vp_c14)._m0[314].x;
    }
    float _584 = _582;
    float _586 = _584;
    if (_560)
    {
        _586 = (*spvDescriptorSet0.vp_c14)._m0[315].x;
    }
    float _588 = _586;
    float _590 = _338 * _588;
    if (_504)
    {
        _562 = (*spvDescriptorSet0.vp_c14)._m0[309].z;
    }
    float _592 = _562;
    float _594 = _592;
    if (_514)
    {
        _594 = (*spvDescriptorSet0.vp_c14)._m0[310].z;
    }
    float _596 = _594;
    float _598 = _590 * _49;
    float _600 = _590 * _51;
    float _602 = _596;
    if (_524)
    {
        _602 = (*spvDescriptorSet0.vp_c14)._m0[311].z;
    }
    float _604 = _602;
    float _606 = floor(_598);
    float _608 = _604;
    if (_534)
    {
        _608 = (*spvDescriptorSet0.vp_c14)._m0[312].z;
    }
    float _610 = _608;
    float _612 = _610;
    if (_544)
    {
        _612 = (*spvDescriptorSet0.vp_c14)._m0[313].z;
    }
    float _614 = _612;
    float _616 = _614;
    if (_554)
    {
        _616 = (*spvDescriptorSet0.vp_c14)._m0[314].z;
    }
    float _618 = _616;
    float _620 = _618;
    if (_560)
    {
        _620 = (*spvDescriptorSet0.vp_c14)._m0[315].z;
    }
    float _622 = _620;
    float _624 = floor(_600);
    float _626 = _310 * _622;
    float _628 = -_606;
    float _630 = _598 + _628;
    float _632 = _630 * 2.0;
    float _634 = -_630;
    float _636 = fma(_626, _634, _49);
    int _638 = _276 + 8;
    uint _641 = uint(int(uint(_638) >> uint(2)));
    uint _643 = uint(int(uint(int(_641)) >> uint(2)));
    int _645 = int(_641) & 3;
    float _647 = (*spvDescriptorSet0.vp_c14)._m0[int(_643)][_645];
    int _649 = int(_641) + 1;
    uint _651 = uint(int(uint(_649) >> uint(2)));
    int _653 = _649 & 3;
    float _655 = (*spvDescriptorSet0.vp_c14)._m0[int(_651)][_653];
    float _657 = -_624;
    float _659 = _600 + _657;
    float _661 = floor(_632);
    float _663 = _659 * 2.0;
    float _665 = -_659;
    float _667 = fma(_626, _665, _51);
    float _669 = floor(_663);
    float _671 = _626 * _661;
    float _673 = _671 * 0.5;
    float _675 = _673 + _636;
    float _677 = fma(_55, _675, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _679 = _626 * _669;
    float _681 = _679 * 0.5;
    float _683 = fma(_62, _675, (*spvDescriptorSet0.vp_c15)._m0[3].z);
    float _685 = fma(_675, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _687 = _681 + _667;
    float _689 = -_677;
    float _691 = _689 + _683;
    float _693 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _695 = _685 + _693;
    float _697 = fma(_687, _691, _677);
    float _699 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _701 = _697 + _699;
    float _703 = fma(_687, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _705 = _701 * _701;
    float _707 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _709 = _703 + _707;
    float _711 = fma(_695, _695, _705);
    float _713 = fma(_709, _709, _711);
    float _715 = sqrt(_713);
    float _717 = -_655;
    float _719 = fma(_715, _647, _717);
    float _721 = precise::clamp(_719, 0.0, 1.0);
    float _723 = -_673;
    float _725 = fma(_723, _721, _675);
    float _727 = -_681;
    float _729 = fma(_727, _721, _687);
    float _731 = fma(_725, (*spvDescriptorSet0.vp_c15)._m0[6].x, (*spvDescriptorSet0.vp_c15)._m0[6].z);
    float _733 = fma(_729, (*spvDescriptorSet0.vp_c15)._m0[6].x, (*spvDescriptorSet0.vp_c15)._m0[6].w);
    float _735 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _731);
    float _737 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _733);
    float2 _2150 = float2(_735, _737);
    float _739 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2150, float2(0.0), isnan(_2150)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2150, float2(0.0), isnan(_2150)), level(0.0)).x;
    float _741 = fma(_729, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _743 = fma(_725, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _745 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _747 = _741 + _745;
    float _749 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _751 = _743 + _749;
    float _753 = _747 * _747;
    float _755 = fma(_751, _751, _753);
    float _757 = sqrt(_755);
    bool _759 = _757 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _761 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _763 = _757 + _761;
    float _765 = _729;
    float _767 = _763;
    float _769 = _655;
    if (_759)
    {
        float _771 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        _765 = _771;
    }
    float _773 = _765;
    if (_759)
    {
        float _775 = rsqrt(_755);
        _102 = _775;
    }
    float _777 = _102;
    float _779 = _777;
    if (_759)
    {
        float _781 = _763 * _773;
        _767 = _781;
    }
    float _783 = _767;
    float _785 = (*spvDescriptorSet0.vp_c14)._m0[0].y;
    if (_759)
    {
        float _787 = _783 * 0.15915493667125701904296875;
        _280 = _787;
    }
    float _789 = _280;
    float _791 = _783;
    if (_759)
    {
        float _793 = _789 * 6.283185482025146484375;
        float _795 = sin(_793);
        _791 = _795;
    }
    float _797 = _791;
    float _799 = _737;
    if (_759)
    {
        float _801 = _789 * 6.283185482025146484375;
        float _803 = cos(_801);
        _799 = _803;
    }
    float _805 = _799;
    float _807 = fma(_739, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _809 = _739;
    if (_759)
    {
        float _811 = _807 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        _785 = _811;
    }
    float _813 = _785;
    float _815 = _813;
    if (_759)
    {
        float _817 = fma(_797, _813, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        _104 = _817;
    }
    float _819 = _104;
    if (_759)
    {
        float _821 = _805 + (-1.0);
        _815 = _821;
    }
    float _823 = _815;
    float _825 = _807 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _827 = _823;
    float _829 = _825;
    if (_759)
    {
        float _831 = _777 * _819;
        _769 = _831;
    }
    float _833 = _769;
    if (_759)
    {
        float _835 = _823 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        _809 = _835;
    }
    float _837 = _809;
    float _839 = fma(_743, (*spvDescriptorSet0.vp_c4)._m0[2].x, _825);
    if (!_759)
    {
        _827 = _807;
    }
    float _841 = _827;
    float _843 = _841;
    if (_759)
    {
        float _845 = fma(_807, _805, _837);
        _843 = _845;
    }
    float _847 = _843;
    float _849 = fma(_741, (*spvDescriptorSet0.vp_c4)._m0[2].z, _839);
    float _851 = _849;
    if (!_759)
    {
        _779 = _743;
    }
    float _853 = _779;
    float _855 = _853;
    if (_759)
    {
        float _857 = fma(_751, _833, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        _855 = _857;
    }
    float _859 = _855;
    float _861 = _847 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _863 = _849 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    if (!_759)
    {
        _829 = _741;
    }
    float _865 = _829;
    float _867 = _865;
    if (_759)
    {
        float _869 = _847 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        _851 = _869;
    }
    float _871 = _851;
    float _873 = _871;
    if (_759)
    {
        float _875 = fma(_747, _833, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        _867 = _875;
    }
    float _877 = _867;
    float _879 = _847 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _881 = fma(_859, (*spvDescriptorSet0.vp_c4)._m0[1].x, _861);
    float _883 = _879;
    if (_759)
    {
        float _885 = fma(_859, (*spvDescriptorSet0.vp_c4)._m0[2].x, _871);
        _873 = _885;
    }
    float _887 = _873;
    float _889 = fma(_859, (*spvDescriptorSet0.vp_c4)._m0[0].x, _879);
    float _891 = fma(_877, (*spvDescriptorSet0.vp_c4)._m0[1].z, _881);
    float _893 = _887;
    if (!_759)
    {
        _883 = _863;
    }
    float _895 = _883;
    float _897 = _895;
    if (_759)
    {
        float _899 = fma(_877, (*spvDescriptorSet0.vp_c4)._m0[2].z, _887);
        _893 = _899;
    }
    float _901 = _893;
    float _903 = fma(_877, (*spvDescriptorSet0.vp_c4)._m0[0].z, _889);
    float _905 = _891 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    if (_759)
    {
        float _907 = _901 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _897 = _907;
    }
    float _909 = _897;
    float _911 = _903 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _913 = _905 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _915 = _905 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _917 = _905 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _919 = _905 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _921 = fma(_911, (*spvDescriptorSet0.vp_c4)._m0[8].x, _913);
    float _923 = fma(_911, (*spvDescriptorSet0.vp_c4)._m0[7].x, _915);
    float _925 = fma(_911, (*spvDescriptorSet0.vp_c4)._m0[9].x, _917);
    float _927 = fma(_911, (*spvDescriptorSet0.vp_c4)._m0[10].x, _919);
    float _929 = fma(_909, (*spvDescriptorSet0.vp_c4)._m0[8].z, _921);
    float _931 = fma(_909, (*spvDescriptorSet0.vp_c4)._m0[7].z, _923);
    float _933 = fma(_909, (*spvDescriptorSet0.vp_c4)._m0[9].z, _925);
    float _935 = fma(_909, (*spvDescriptorSet0.vp_c4)._m0[10].z, _927);
    float _937 = _929 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _939 = _931 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _941 = _933 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _943 = _935 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.gl_Position.x = _939;
    out.gl_Position.y = _937;
    out.gl_Position.z = _941;
    out.gl_Position.w = _943;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, 0u); dm_cw(dm_gs, dm_p, 17, 0u); dm_cw(dm_gs, dm_p, 18, 0u); dm_cw(dm_gs, dm_p, 19, 0x3f800000u); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

