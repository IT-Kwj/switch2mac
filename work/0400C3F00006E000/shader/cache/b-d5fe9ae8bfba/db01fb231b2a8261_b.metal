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
    texture2d<float> vp_t_tcb_A [[id(7)]];
    sampler vp_t_tcb_ASmplr [[id(8)]];
    texture2d_array<float> vp_t_tcb_C [[id(9)]];
    sampler vp_t_tcb_CSmplr [[id(10)]];
    sampler vp_t_tcb_8Smplr_w [[id(11)]];
    sampler vp_t_tcb_ASmplr_w [[id(12)]];
    sampler vp_t_tcb_CSmplr_w [[id(13)]];
    constant dm_border_t* dm_border [[id(14)]];
};

struct main0_out
{
    float4 m_47 [[user(locn0)]];
    float4 m_49 [[user(locn1)]];
    float4 m_45 [[user(locn5)]];
    float4 m_51 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_42 [[attribute(0)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_BaseInstance [[base_instance]])
{
    main0_out out = {};
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    bool _923 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _65 = in.m_42.x;
    float _67 = in.m_42.y;
    float _69 = -(*spvDescriptorSet0.vp_c15)._m0[3].x;
    float _71 = _69 + (*spvDescriptorSet0.vp_c15)._m0[3].y;
    int _74 = 16 + as_type<int>(as_type<float>(gl_BaseInstance));
    int _76 = _74 << 4;
    bool _80 = _76 == 0;
    bool _82 = _76 == 16;
    bool _84 = _76 == 32;
    bool _86 = _76 == 48;
    bool _88 = _76 == 64;
    float _90 = fma(_71, _65, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _92 = fma(_65, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    bool _94 = _76 == 80;
    bool _96 = _67 >= 0.5;
    bool _98 = isnan(_67);
    bool _100 = _96 || _98;
    bool _102 = isnan(0.5);
    bool _104 = _100 || _102;
    float _106 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _108 = _90 + _106;
    float _110 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _112 = _92 + _110;
    float _114 = as_type<float>(gl_BaseInstance);
    if (_80)
    {
        _114 = (*spvDescriptorSet0.vp_c14)._m0[268].x;
    }
    float _116 = _114;
    float _118 = _108 * _108;
    bool _120 = _76 == 96;
    float _122 = 0.0;
    float _124 = _116;
    float _126 = (*spvDescriptorSet0.vp_c15)._m0[5].x;
    if (_80)
    {
        _122 = (*spvDescriptorSet0.vp_c14)._m0[268].z;
    }
    float _128 = _122;
    float _130 = fma(_112, _112, _118);
    float _132 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _134 = (*spvDescriptorSet0.vp_c15)._m0[0].w + _132;
    float _136 = _128;
    float _138 = _134;
    if (_82)
    {
        _124 = (*spvDescriptorSet0.vp_c14)._m0[269].x;
    }
    float _140 = _124;
    bool _142 = _76 == 112;
    float _144 = fma(_134, _134, _130);
    float _146 = _140;
    if (_82)
    {
        _136 = (*spvDescriptorSet0.vp_c14)._m0[269].z;
    }
    float _148 = _136;
    float _150 = _148;
    if (_84)
    {
        _146 = (*spvDescriptorSet0.vp_c14)._m0[270].x;
    }
    float _152 = _146;
    float _154 = rsqrt(_144);
    bool _156 = _76 == 128;
    float _158 = _152;
    if (_84)
    {
        _150 = (*spvDescriptorSet0.vp_c14)._m0[270].z;
    }
    float _160 = _150;
    float _162 = _160;
    if (_86)
    {
        _158 = (*spvDescriptorSet0.vp_c14)._m0[271].x;
    }
    float _164 = _158;
    bool _166 = _76 == 144;
    float _168 = _164;
    if (_86)
    {
        _162 = (*spvDescriptorSet0.vp_c14)._m0[271].z;
    }
    float _170 = _162;
    float _172 = _170;
    if (_88)
    {
        _168 = (*spvDescriptorSet0.vp_c14)._m0[272].x;
    }
    float _174 = _168;
    bool _176 = _76 == 160;
    float _178 = _174;
    if (_88)
    {
        _172 = (*spvDescriptorSet0.vp_c14)._m0[272].z;
    }
    float _180 = _172;
    float _182 = _154 * (*spvDescriptorSet0.vp_c14)._m0[268].x;
    float _184 = _180;
    if (_94)
    {
        _178 = (*spvDescriptorSet0.vp_c14)._m0[273].x;
    }
    float _186 = _178;
    bool _188 = _76 == 176;
    float _190 = _186;
    if (_94)
    {
        _184 = (*spvDescriptorSet0.vp_c14)._m0[273].z;
    }
    float _192 = _184;
    float _194 = log2(_182);
    bool _196 = _76 == 192;
    float _198 = _192;
    if (_120)
    {
        _190 = (*spvDescriptorSet0.vp_c14)._m0[274].x;
    }
    float _200 = _190;
    float _202 = _200;
    if (_120)
    {
        _198 = (*spvDescriptorSet0.vp_c14)._m0[274].z;
    }
    float _204 = _198;
    float _206 = _204;
    if (_142)
    {
        _202 = (*spvDescriptorSet0.vp_c14)._m0[275].x;
    }
    float _208 = _202;
    bool _210 = _76 == 208;
    float _212 = _208;
    if (_142)
    {
        _206 = (*spvDescriptorSet0.vp_c14)._m0[275].z;
    }
    float _214 = _206;
    float _216 = _214;
    if (_156)
    {
        _212 = (*spvDescriptorSet0.vp_c14)._m0[276].x;
    }
    float _218 = _212;
    bool _220 = _76 == 224;
    float _222 = _194 + 1.2999999523162841796875;
    float _224 = _218;
    if (_156)
    {
        _216 = (*spvDescriptorSet0.vp_c14)._m0[276].z;
    }
    float _226 = _216;
    float _228 = _226;
    if (_166)
    {
        _224 = (*spvDescriptorSet0.vp_c14)._m0[277].x;
    }
    float _230 = _224;
    bool _232 = _76 == 240;
    float _234 = trunc(_222);
    int _236 = int(_234);
    float _238 = _230;
    if (_166)
    {
        _228 = (*spvDescriptorSet0.vp_c14)._m0[277].z;
    }
    float _240 = _228;
    float _242 = _240;
    if (_176)
    {
        _238 = (*spvDescriptorSet0.vp_c14)._m0[278].x;
    }
    float _244 = _238;
    bool _246 = _76 == 256;
    float _248 = _244;
    if (_176)
    {
        _242 = (*spvDescriptorSet0.vp_c14)._m0[278].z;
    }
    float _250 = _242;
    float _252 = _250;
    if (_188)
    {
        _248 = (*spvDescriptorSet0.vp_c14)._m0[279].x;
    }
    float _254 = _248;
    bool _256 = _76 == 272;
    float _258 = _254;
    if (_188)
    {
        _252 = (*spvDescriptorSet0.vp_c14)._m0[279].z;
    }
    float _260 = _252;
    float _262 = _260;
    if (_196)
    {
        _258 = (*spvDescriptorSet0.vp_c14)._m0[280].x;
    }
    float _264 = _258;
    int _266 = min(_236, 15);
    bool _268 = _76 == 288;
    float _270 = _264;
    if (_196)
    {
        _262 = (*spvDescriptorSet0.vp_c14)._m0[280].z;
    }
    float _272 = _262;
    float _274 = float(_266);
    bool _276 = _76 == 304;
    int _278 = _266 << 4;
    int _280 = _278 + 4288;
    float _282 = _272;
    if (_210)
    {
        _270 = (*spvDescriptorSet0.vp_c14)._m0[281].x;
    }
    float _284 = _270;
    float _286 = _284;
    if (_210)
    {
        _282 = (*spvDescriptorSet0.vp_c14)._m0[281].z;
    }
    float _288 = _282;
    float _290 = -_274;
    float _292 = _290 + (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _294 = _288;
    if (_220)
    {
        _286 = (*spvDescriptorSet0.vp_c14)._m0[282].x;
    }
    float _296 = _286;
    bool _298 = _76 == 320;
    float _300 = _292 + 1.0;
    float _302 = _296;
    if (_220)
    {
        _294 = (*spvDescriptorSet0.vp_c14)._m0[282].z;
    }
    float _304 = _294;
    float _306 = _304;
    if (_232)
    {
        _302 = (*spvDescriptorSet0.vp_c14)._m0[283].x;
    }
    float _308 = _302;
    bool _310 = _76 == 336;
    float _312 = exp2(_300);
    float _314 = _308;
    if (_232)
    {
        _306 = (*spvDescriptorSet0.vp_c14)._m0[283].z;
    }
    float _316 = _306;
    float _318 = _316;
    if (_246)
    {
        _314 = (*spvDescriptorSet0.vp_c14)._m0[284].x;
    }
    float _320 = _314;
    bool _322 = _76 == 352;
    float _324 = _320;
    if (_246)
    {
        _318 = (*spvDescriptorSet0.vp_c14)._m0[284].z;
    }
    float _326 = _318;
    float _328 = _326;
    if (_256)
    {
        _324 = (*spvDescriptorSet0.vp_c14)._m0[285].x;
    }
    float _330 = _324;
    bool _332 = _76 == 368;
    float _334 = _330;
    if (_256)
    {
        _328 = (*spvDescriptorSet0.vp_c14)._m0[285].z;
    }
    float _336 = _328;
    float _338 = _336;
    if (_268)
    {
        _334 = (*spvDescriptorSet0.vp_c14)._m0[286].x;
    }
    float _340 = _334;
    float _342 = 1.0 / _312;
    bool _344 = _76 == 384;
    float _346 = _340;
    if (_268)
    {
        _338 = (*spvDescriptorSet0.vp_c14)._m0[286].z;
    }
    float _348 = _338;
    float _350 = _348;
    if (_276)
    {
        _346 = (*spvDescriptorSet0.vp_c14)._m0[287].x;
    }
    float _352 = _346;
    bool _354 = _76 == 400;
    float _356 = _352;
    if (_276)
    {
        _350 = (*spvDescriptorSet0.vp_c14)._m0[287].z;
    }
    float _358 = _350;
    bool _360 = _76 == 416;
    float _362 = _358;
    if (_298)
    {
        _356 = (*spvDescriptorSet0.vp_c14)._m0[288].x;
    }
    float _364 = _356;
    float _366 = _364;
    if (_298)
    {
        _362 = (*spvDescriptorSet0.vp_c14)._m0[288].z;
    }
    float _368 = _362;
    float _370 = _368;
    if (_310)
    {
        _366 = (*spvDescriptorSet0.vp_c14)._m0[289].x;
    }
    float _372 = _366;
    bool _374 = _76 == 432;
    float _376 = _372;
    if (_310)
    {
        _370 = (*spvDescriptorSet0.vp_c14)._m0[289].z;
    }
    float _378 = _370;
    float _380 = _378;
    if (_322)
    {
        _376 = (*spvDescriptorSet0.vp_c14)._m0[290].x;
    }
    float _382 = _376;
    bool _384 = _76 == 448;
    float _386 = _382;
    if (_322)
    {
        _380 = (*spvDescriptorSet0.vp_c14)._m0[290].z;
    }
    float _388 = _380;
    float _390 = _388;
    if (_332)
    {
        _386 = (*spvDescriptorSet0.vp_c14)._m0[291].x;
    }
    float _392 = _386;
    bool _394 = _76 == 464;
    float _396 = _392;
    if (_332)
    {
        _390 = (*spvDescriptorSet0.vp_c14)._m0[291].z;
    }
    float _398 = _390;
    float _400 = _398;
    if (_344)
    {
        _396 = (*spvDescriptorSet0.vp_c14)._m0[292].x;
    }
    float _402 = _396;
    bool _404 = _76 == 480;
    float _406 = _402;
    if (_344)
    {
        _400 = (*spvDescriptorSet0.vp_c14)._m0[292].z;
    }
    float _408 = _400;
    float _410 = _408;
    if (_354)
    {
        _406 = (*spvDescriptorSet0.vp_c14)._m0[293].x;
    }
    float _412 = _406;
    bool _414 = _76 == 496;
    float _416 = _412;
    if (_354)
    {
        _410 = (*spvDescriptorSet0.vp_c14)._m0[293].z;
    }
    float _418 = _410;
    float _420 = _418;
    if (_360)
    {
        _416 = (*spvDescriptorSet0.vp_c14)._m0[294].x;
    }
    float _422 = _416;
    bool _424 = _76 == 512;
    float _426 = _422;
    if (_360)
    {
        _420 = (*spvDescriptorSet0.vp_c14)._m0[294].z;
    }
    float _428 = _420;
    bool _430 = _76 == 528;
    float _432 = _428;
    if (_374)
    {
        _426 = (*spvDescriptorSet0.vp_c14)._m0[295].x;
    }
    float _434 = _426;
    float _436 = _434;
    if (_374)
    {
        _432 = (*spvDescriptorSet0.vp_c14)._m0[295].z;
    }
    float _438 = _432;
    float _440 = _438;
    if (_384)
    {
        _436 = (*spvDescriptorSet0.vp_c14)._m0[296].x;
    }
    float _442 = _436;
    bool _444 = _76 == 544;
    float _446 = _442;
    if (_384)
    {
        _440 = (*spvDescriptorSet0.vp_c14)._m0[296].z;
    }
    float _448 = _440;
    float _450 = _448;
    if (_394)
    {
        _446 = (*spvDescriptorSet0.vp_c14)._m0[297].x;
    }
    float _452 = _446;
    bool _454 = _76 == 560;
    float _456 = _452;
    if (_394)
    {
        _450 = (*spvDescriptorSet0.vp_c14)._m0[297].z;
    }
    float _458 = _450;
    float _460 = _458;
    if (_404)
    {
        _456 = (*spvDescriptorSet0.vp_c14)._m0[298].x;
    }
    float _462 = _456;
    bool _464 = _76 == 576;
    float _466 = _462;
    if (_404)
    {
        _460 = (*spvDescriptorSet0.vp_c14)._m0[298].z;
    }
    float _468 = _460;
    float _470 = _468;
    if (_414)
    {
        _466 = (*spvDescriptorSet0.vp_c14)._m0[299].x;
    }
    float _472 = _466;
    bool _474 = _76 == 592;
    float _476 = _472;
    if (_414)
    {
        _470 = (*spvDescriptorSet0.vp_c14)._m0[299].z;
    }
    float _478 = _470;
    float _480 = _478;
    if (_424)
    {
        _476 = (*spvDescriptorSet0.vp_c14)._m0[300].x;
    }
    float _482 = _476;
    bool _484 = _76 == 608;
    float _486 = _482;
    if (_424)
    {
        _480 = (*spvDescriptorSet0.vp_c14)._m0[300].z;
    }
    float _488 = _480;
    float _490 = _488;
    if (_430)
    {
        _486 = (*spvDescriptorSet0.vp_c14)._m0[301].x;
    }
    float _492 = _486;
    bool _494 = _76 == 624;
    float _496 = _492;
    if (_430)
    {
        _490 = (*spvDescriptorSet0.vp_c14)._m0[301].z;
    }
    float _498 = _490;
    bool _500 = _76 == 640;
    float _502 = _498;
    if (_444)
    {
        _496 = (*spvDescriptorSet0.vp_c14)._m0[302].x;
    }
    float _504 = _496;
    float _506 = _504;
    if (_444)
    {
        _502 = (*spvDescriptorSet0.vp_c14)._m0[302].z;
    }
    float _508 = _502;
    float _510 = _508;
    if (_454)
    {
        _506 = (*spvDescriptorSet0.vp_c14)._m0[303].x;
    }
    float _512 = _506;
    bool _514 = _76 == 656;
    float _516 = _512;
    if (_454)
    {
        _510 = (*spvDescriptorSet0.vp_c14)._m0[303].z;
    }
    float _518 = _510;
    float _520 = _518;
    if (_464)
    {
        _516 = (*spvDescriptorSet0.vp_c14)._m0[304].x;
    }
    float _522 = _516;
    bool _524 = _76 == 672;
    float _526 = _522;
    if (_464)
    {
        _520 = (*spvDescriptorSet0.vp_c14)._m0[304].z;
    }
    float _528 = _520;
    float _530 = _528;
    if (_474)
    {
        _526 = (*spvDescriptorSet0.vp_c14)._m0[305].x;
    }
    float _532 = _526;
    bool _534 = _76 == 688;
    float _536 = _532;
    if (_474)
    {
        _530 = (*spvDescriptorSet0.vp_c14)._m0[305].z;
    }
    float _538 = _530;
    float _540 = _538;
    if (_484)
    {
        _536 = (*spvDescriptorSet0.vp_c14)._m0[306].x;
    }
    float _542 = _536;
    bool _544 = _76 == 704;
    float _546 = _542;
    if (_484)
    {
        _540 = (*spvDescriptorSet0.vp_c14)._m0[306].z;
    }
    float _548 = _540;
    float _550 = _548;
    if (_494)
    {
        _546 = (*spvDescriptorSet0.vp_c14)._m0[307].x;
    }
    float _552 = _546;
    bool _554 = _76 == 720;
    float _556 = _552;
    if (_494)
    {
        _550 = (*spvDescriptorSet0.vp_c14)._m0[307].z;
    }
    float _558 = _550;
    float _560 = _558;
    if (_500)
    {
        _556 = (*spvDescriptorSet0.vp_c14)._m0[308].x;
    }
    float _562 = _556;
    bool _564 = _76 == 736;
    float _566 = _562;
    if (_500)
    {
        _560 = (*spvDescriptorSet0.vp_c14)._m0[308].z;
    }
    float _568 = _560;
    bool _570 = _76 == 752;
    float _572 = _568;
    if (_514)
    {
        _566 = (*spvDescriptorSet0.vp_c14)._m0[309].x;
    }
    float _574 = _566;
    float _576 = _574;
    if (_524)
    {
        _576 = (*spvDescriptorSet0.vp_c14)._m0[310].x;
    }
    float _578 = _576;
    float _580 = _578;
    if (_534)
    {
        _580 = (*spvDescriptorSet0.vp_c14)._m0[311].x;
    }
    float _582 = _580;
    float _584 = _582;
    if (_544)
    {
        _584 = (*spvDescriptorSet0.vp_c14)._m0[312].x;
    }
    float _586 = _584;
    float _588 = _586;
    if (_554)
    {
        _588 = (*spvDescriptorSet0.vp_c14)._m0[313].x;
    }
    float _590 = _588;
    float _592 = _590;
    if (_564)
    {
        _592 = (*spvDescriptorSet0.vp_c14)._m0[314].x;
    }
    float _594 = _592;
    float _596 = _594;
    if (_570)
    {
        _596 = (*spvDescriptorSet0.vp_c14)._m0[315].x;
    }
    float _598 = _596;
    float _600 = _342 * _598;
    if (_514)
    {
        _572 = (*spvDescriptorSet0.vp_c14)._m0[309].z;
    }
    float _602 = _572;
    float _604 = _602;
    if (_524)
    {
        _604 = (*spvDescriptorSet0.vp_c14)._m0[310].z;
    }
    float _606 = _604;
    float _608 = _600 * _65;
    float _610 = _606;
    if (_534)
    {
        _610 = (*spvDescriptorSet0.vp_c14)._m0[311].z;
    }
    float _612 = _610;
    float _614 = _612;
    if (_544)
    {
        _614 = (*spvDescriptorSet0.vp_c14)._m0[312].z;
    }
    float _616 = _614;
    float _618 = floor(_608);
    float _620 = _616;
    if (_554)
    {
        _620 = (*spvDescriptorSet0.vp_c14)._m0[313].z;
    }
    float _622 = _620;
    float _624 = _622;
    if (_564)
    {
        _624 = (*spvDescriptorSet0.vp_c14)._m0[314].z;
    }
    float _626 = _624;
    float _628 = _626;
    if (_570)
    {
        _628 = (*spvDescriptorSet0.vp_c14)._m0[315].z;
    }
    float _630 = _628;
    float _632 = -_618;
    float _634 = _608 + _632;
    float _636 = _312 * _630;
    int _638 = _280 + 8;
    uint _641 = uint(int(uint(_638) >> uint(2)));
    uint _643 = uint(int(uint(int(_641)) >> uint(2)));
    int _645 = int(_641) & 3;
    float _647 = (*spvDescriptorSet0.vp_c14)._m0[int(_643)][_645];
    int _649 = int(_641) + 1;
    uint _651 = uint(int(uint(_649) >> uint(2)));
    int _653 = _649 & 3;
    float _655 = (*spvDescriptorSet0.vp_c14)._m0[int(_651)][_653];
    float _657 = _634 * 2.0;
    float _659 = -_634;
    float _661 = fma(_636, _659, _65);
    float _663 = floor(_657);
    float _665 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].w);
    float _667 = _636 * _663;
    float _669 = _667 * 0.5;
    float _671 = _669 + _661;
    float _673 = fma(_71, _671, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _675 = fma(_671, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _677 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _679 = _673 + _677;
    float _681 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _683 = _675 + _681;
    float _685 = _679 * _679;
    float _687 = fma(_683, _683, _685);
    float _689 = fma(_134, _134, _687);
    float _691 = sqrt(_689);
    float _693 = -_655;
    float _695 = fma(_691, _647, _693);
    float _697 = precise::clamp(_695, 0.0, 1.0);
    float _699 = -_669;
    float _701 = fma(_699, _697, _671);
    float _703 = fma(_701, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _705 = _701;
    float _707 = _655;
    float _709 = _636;
    float _711 = _671;
    float _713 = _689;
    if (!_104)
    {
        _705 = (*spvDescriptorSet0.vp_c15)._m0[6].x;
    }
    float _715 = _705;
    float _717 = fma(_703, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].z);
    float _719 = _715;
    if (!_104)
    {
        float _721 = fma(_665, _715, (*spvDescriptorSet0.vp_c15)._m0[6].w);
        _126 = _721;
    }
    float _723 = _126;
    float _725 = _723;
    if (!_104)
    {
        float _727 = fma(_717, _715, (*spvDescriptorSet0.vp_c15)._m0[6].z);
        _719 = _727;
    }
    float _729 = _719;
    float _731 = _729;
    if (!_104)
    {
        float _733 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _723);
        _725 = _733;
    }
    float _735 = _725;
    if (!_104)
    {
        float _737 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _729);
        _731 = _737;
    }
    float _739 = _731;
    if (!_104)
    {
        float2 _2432 = float2(_739, _735);
        float _741 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2432, float2(0.0), isnan(_2432)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2432, float2(0.0), isnan(_2432)), level(0.0)).x;
        _707 = _741;
    }
    float _743 = _707;
    if (_104)
    {
        _709 = (*spvDescriptorSet0.vp_c15)._m0[14].x;
    }
    float _745 = _709;
    if (_104)
    {
        _711 = (*spvDescriptorSet0.vp_c15)._m0[15].x;
    }
    float _747 = _711;
    if (_104)
    {
        float _749 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, _745, (*spvDescriptorSet0.vp_c15)._m0[14].w);
        _713 = _749;
    }
    float _751 = _713;
    float _753 = _751;
    if (_104)
    {
        float _755 = fma(_703, _745, (*spvDescriptorSet0.vp_c15)._m0[14].z);
        _138 = _755;
    }
    float _757 = _138;
    float _759 = _757;
    if (_104)
    {
        float _761 = fma(_751, _747, (*spvDescriptorSet0.vp_c15)._m0[15].w);
        _753 = _761;
    }
    float _763 = _753;
    float _765 = _763;
    if (_104)
    {
        float _767 = fma(_757, _747, (*spvDescriptorSet0.vp_c15)._m0[15].z);
        _759 = _767;
    }
    float _769 = _759;
    float _771 = _769;
    if (_104)
    {
        float _773 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _763);
        _765 = _773;
    }
    float _775 = _765;
    if (_104)
    {
        float _777 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _769);
        _771 = _777;
    }
    float _779 = _771;
    float _781 = _743;
    if (_104)
    {
        float2 _2524 = float2(_779, _775);
        float _783 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_2524, float2(0.0), isnan(_2524)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_2524, float2(0.0), isnan(_2524)), level(0.0)).x;
        _781 = _783;
    }
    float _785 = _781;
    float _787 = fma(_665, (*spvDescriptorSet0.vp_c15)._m0[8].x, (*spvDescriptorSet0.vp_c15)._m0[8].w);
    float _789 = fma(_717, (*spvDescriptorSet0.vp_c15)._m0[8].x, (*spvDescriptorSet0.vp_c15)._m0[8].z);
    float _791 = fma(_665, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].w);
    float _793 = fma(_717, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].z);
    int _795 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[40].w) & 2;
    bool _797 = _795 != 0;
    float _799 = fma(_785, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _801 = _799 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _803 = _799 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _805 = _799 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _807 = fma(_703, (*spvDescriptorSet0.vp_c4)._m0[1].x, _801);
    float _809 = fma(_703, (*spvDescriptorSet0.vp_c4)._m0[0].x, _803);
    float _811 = fma(_703, (*spvDescriptorSet0.vp_c4)._m0[2].x, _805);
    float _813 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, (*spvDescriptorSet0.vp_c4)._m0[1].z, _807);
    float _815 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, (*spvDescriptorSet0.vp_c4)._m0[0].z, _809);
    float _817 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, (*spvDescriptorSet0.vp_c4)._m0[2].z, _811);
    float _819 = _813 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _821 = _815 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _823 = _817 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _825 = _819 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _827 = _819 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _829 = _819 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _831 = _819 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _833 = fma(_821, (*spvDescriptorSet0.vp_c4)._m0[8].x, _825);
    float _835 = fma(_821, (*spvDescriptorSet0.vp_c4)._m0[7].x, _827);
    float _837 = fma(_821, (*spvDescriptorSet0.vp_c4)._m0[9].x, _829);
    float _839 = fma(_821, (*spvDescriptorSet0.vp_c4)._m0[10].x, _831);
    float _841 = fma(_823, (*spvDescriptorSet0.vp_c4)._m0[8].z, _833);
    float _843 = fma(_823, (*spvDescriptorSet0.vp_c4)._m0[7].z, _835);
    float _845 = fma(_823, (*spvDescriptorSet0.vp_c4)._m0[9].z, _837);
    float _847 = fma(_823, (*spvDescriptorSet0.vp_c4)._m0[10].z, _839);
    float _849 = _841 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _851 = _843 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _853 = _845 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _855 = _847 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    bool _857 = !_797;
    float _859;
    float _861;
    float _863;
    int _865;
    int _867;
    int _869;
    int _871;
    int _873;
    int _875;
    int _877;
    int _879;
    float _881;
    float _883;
    float _885;
    float _887;
    float _889;
    float _891;
    float _893;
    float _895;
    float _897;
    float _899;
    float _901;
    float _903;
    float _905;
    float _907;
    float _909;
    float _911;
    float _913;
    int _915;
    float _917;
    float _919;
    float _921;
    if (!_857)
    {
        _859 = (*spvDescriptorSet0.vp_c9)._m0[919].x;
        _861 = (*spvDescriptorSet0.vp_c9)._m0[919].y;
        _863 = (*spvDescriptorSet0.vp_c9)._m0[919].z;
        _865 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[919].w);
        _867 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].x);
        _869 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].y);
        _871 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].z);
        _873 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].w);
        _875 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].x);
        _877 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].y);
        _879 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].w);
        _881 = (*spvDescriptorSet0.vp_c9)._m0[923].y;
        _883 = (*spvDescriptorSet0.vp_c9)._m0[922].y;
        _885 = (*spvDescriptorSet0.vp_c9)._m0[917].x;
        _887 = (*spvDescriptorSet0.vp_c9)._m0[916].w;
        _889 = (*spvDescriptorSet0.vp_c9)._m0[923].x;
        _891 = (*spvDescriptorSet0.vp_c9)._m0[922].x;
        _893 = (*spvDescriptorSet0.vp_c9)._m0[917].y;
        _895 = (*spvDescriptorSet0.vp_c9)._m0[916].y;
        _897 = (*spvDescriptorSet0.vp_c9)._m0[923].z;
        _899 = (*spvDescriptorSet0.vp_c9)._m0[922].z;
        _901 = (*spvDescriptorSet0.vp_c9)._m0[916].x;
        _903 = (*spvDescriptorSet0.vp_c9)._m0[916].z;
        _905 = (*spvDescriptorSet0.vp_c9)._m0[923].w;
        _907 = (*spvDescriptorSet0.vp_c9)._m0[922].w;
        _909 = (*spvDescriptorSet0.vp_c9)._m0[917].w;
        _911 = (*spvDescriptorSet0.vp_c9)._m0[917].z;
        _913 = (*spvDescriptorSet0.vp_c9)._m0[918].x;
        _915 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].z);
        _917 = (*spvDescriptorSet0.vp_c9)._m0[918].z;
        _919 = (*spvDescriptorSet0.vp_c9)._m0[918].y;
        _921 = (*spvDescriptorSet0.vp_c9)._m0[918].w;
        _923 = true;
    }
    else
    {
        float _925 = fma(_703, 6.2500002968590706586837768554688e-05, 0.5);
        float _927 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, 6.2500002968590706586837768554688e-05, 0.5);
        float3 _2800 = float3(_925, _927, float(0));
        float3 _2804 = select(_2800, float3(0.0), isnan(_2800));
        float4 _930 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2804.xy, uint(rint(_2804.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2804.xy, uint(rint(_2804.z)), level(0.0)).xyzw;
        float _932 = _930.x;
        float _934 = _930.y;
        float _936 = _930.z;
        float _938 = _930.w;
        float3 _2819 = float3(_925, _927, float(1));
        float3 _2821 = select(_2819, float3(0.0), isnan(_2819));
        float4 _940 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2821.xy, uint(rint(_2821.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2821.xy, uint(rint(_2821.z)), level(0.0)).xyzw;
        float _942 = _940.x;
        float _944 = _940.y;
        float _946 = _940.z;
        float _948 = _940.w;
        float3 _2836 = float3(_925, _927, float(2));
        float3 _2838 = select(_2836, float3(0.0), isnan(_2836));
        float4 _950 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2838.xy, uint(rint(_2838.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2838.xy, uint(rint(_2838.z)), level(0.0)).xyzw;
        float _952 = _950.x;
        float _954 = _950.y;
        float _956 = _950.z;
        float _958 = _950.w;
        float3 _2853 = float3(_925, _927, float(3));
        float3 _2855 = select(_2853, float3(0.0), isnan(_2853));
        float4 _960 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2855.xy, uint(rint(_2855.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2855.xy, uint(rint(_2855.z)), level(0.0)).xyzw;
        float _962 = _960.x;
        float _964 = _960.y;
        float _966 = _960.z;
        float _968 = _960.w;
        float3 _2870 = float3(_925, _927, float(4));
        float3 _2872 = select(_2870, float3(0.0), isnan(_2870));
        float4 _970 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2872.xy, uint(rint(_2872.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2872.xy, uint(rint(_2872.z)), level(0.0)).xyzw;
        float _972 = _970.x;
        float _974 = _970.y;
        float _976 = _970.z;
        float _978 = _970.w;
        float3 _2887 = float3(_925, _927, float(5));
        float3 _2889 = select(_2887, float3(0.0), isnan(_2887));
        float4 _980 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2889.xy, uint(rint(_2889.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2889.xy, uint(rint(_2889.z)), level(0.0)).xyzw;
        float _982 = _980.x;
        float _984 = _980.y;
        float _986 = _980.z;
        float _988 = _980.w;
        float3 _2904 = float3(_925, _927, float(6));
        float3 _2906 = select(_2904, float3(0.0), isnan(_2904));
        float4 _990 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2906.xy, uint(rint(_2906.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2906.xy, uint(rint(_2906.z)), level(0.0)).xyzw;
        float _992 = _990.x;
        float _994 = _990.y;
        float _996 = _990.z;
        float _998 = _990.w;
        float3 _2921 = float3(_925, _927, float(7));
        float3 _2923 = select(_2921, float3(0.0), isnan(_2921));
        float4 _1000 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2923.xy, uint(rint(_2923.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2923.xy, uint(rint(_2923.z)), level(0.0)).xyzw;
        float _1002 = _1000.x;
        float _1004 = _1000.y;
        float _1006 = _1000.z;
        float _1008 = _1000.w;
        _859 = _962;
        _861 = _964;
        _863 = _966;
        _865 = as_type<int>(_968);
        _867 = as_type<int>(_972);
        _869 = as_type<int>(_974);
        _871 = as_type<int>(_976);
        _873 = as_type<int>(_978);
        _875 = as_type<int>(_982);
        _877 = as_type<int>(_984);
        _879 = as_type<int>(_988);
        _881 = _1004;
        _883 = _994;
        _885 = _942;
        _887 = _938;
        _889 = _1002;
        _891 = _992;
        _893 = _944;
        _895 = _934;
        _897 = _1006;
        _899 = _996;
        _901 = _932;
        _903 = _936;
        _905 = _1008;
        _907 = _998;
        _909 = _948;
        _911 = _946;
        _913 = _952;
        _915 = as_type<int>(_986);
        _917 = _956;
        _919 = _954;
        _921 = _958;
    }
    _923 = false;
    float _1010 = _859;
    float _1012 = _861;
    float _1014 = _863;
    int _1016 = _865;
    int _1018 = _867;
    int _1020 = _869;
    int _1022 = _871;
    int _1024 = _873;
    int _1026 = _875;
    int _1028 = _877;
    int _1030 = _879;
    float _1032 = _881;
    float _1034 = _883;
    float _1036 = _885;
    float _1038 = _887;
    float _1040 = _889;
    float _1042 = _891;
    float _1044 = _893;
    float _1046 = _895;
    float _1048 = _897;
    float _1050 = _899;
    float _1052 = _901;
    float _1054 = _903;
    float _1056 = _905;
    float _1058 = _907;
    float _1060 = _909;
    float _1062 = _911;
    float _1064 = _913;
    int _1066 = _915;
    float _1068 = _917;
    float _1070 = _919;
    float _1072 = _921;
    float _1074 = -(*spvDescriptorSet0.vp_c4)._m0[12].w;
    float _1076 = _799 + _1074;
    float _1078 = -(*spvDescriptorSet0.vp_c4)._m0[11].w;
    float _1080 = _703 + _1078;
    float _1082 = -(*spvDescriptorSet0.vp_c4)._m0[13].w;
    float _1084 = (*spvDescriptorSet0.vp_c15)._m0[0].w + _1082;
    out.gl_Position.x = _851;
    out.gl_Position.y = _849;
    out.gl_Position.z = _853;
    out.gl_Position.w = _855;
    float _1086 = _1076 * _1076;
    float _1088 = _1010 * 0.88622701168060302734375;
    float _1090 = _1012 * 0.88622701168060302734375;
    float _1092 = _1014 * 0.88622701168060302734375;
    float _1094 = fma(_1080, _1080, _1086);
    float _1096 = _797 ? as_type<float>(_1016) : 0.0;
    out.m_45.x = _703;
    out.m_45.y = _799;
    out.m_45.z = (*spvDescriptorSet0.vp_c15)._m0[0].w;
    float _1098 = _797 ? as_type<float>(_1018) : 0.0;
    float _1100 = fma(_1084, _1084, _1094);
    float _1102 = _797 ? as_type<float>(_1020) : 0.0;
    out.m_47.z = _793;
    out.m_47.w = _791;
    float _1104 = _797 ? _1088 : 0.0;
    float _1106 = _797 ? _1090 : 0.0;
    float _1108 = rsqrt(_1100);
    float _1110 = _797 ? _1092 : 0.0;
    out.m_49.x = _789;
    float _1112 = _797 ? as_type<float>(_1022) : 0.0;
    float _1114 = _797 ? as_type<float>(_1024) : 0.0;
    out.m_49.y = _787;
    float _1116 = _797 ? as_type<float>(_1026) : 0.0;
    float _1118 = _797 ? as_type<float>(_1028) : 0.0;
    float _1120 = _797 ? as_type<float>(_1030) : 0.0;
    float _1122 = _1108 * 1.02332699298858642578125;
    float _1124 = _1084 * _1108;
    float _1126 = _1076 * _1122;
    float _1128 = _1124 * (-1.02332699298858642578125);
    float _1130 = _1080 * _1122;
    float _1132 = _1126 * _1032;
    float _1134 = _1126 * _1034;
    float _1136 = _1126 * _1036;
    float _1138 = _1126 * _1038;
    float _1140 = fma(_1040, 0.88622701168060302734375, _1132);
    float _1142 = fma(_1042, 0.88622701168060302734375, _1134);
    float _1144 = _1126 * _1044;
    float _1146 = fma(_1046, 0.88622701168060302734375, _1136);
    float _1148 = fma(_1128, _1048, _1140);
    float _1150 = fma(_1128, _1050, _1142);
    float _1152 = fma(_1052, 0.88622701168060302734375, _1138);
    float _1154 = fma(_1054, 0.88622701168060302734375, _1144);
    float _1156 = fma(_1130, _1056, _1148);
    float _1158 = fma(_1130, _1058, _1150);
    float _1160 = fma(_1096, _1126, _1104);
    float _1162 = fma(_1098, _1126, _1106);
    float _1164 = fma(_1102, _1126, _1110);
    float _1166 = precise::max(0.0, _1156);
    float _1168 = fma(_1128, _1060, _1146);
    float _1170 = precise::max(0.0, _1158);
    float _1172 = fma(_1128, _1062, _1152);
    float _1174 = fma(_1128, _1064, _1154);
    float _1176 = _1166 * 0.31830990314483642578125;
    float _1178 = precise::clamp(_1176, 0.0, 1.0);
    float _1180 = fma(_1112, _1128, _1160);
    float _1182 = fma(_1114, _1128, _1162);
    float _1184 = fma(_1116, _1128, _1164);
    float _1186 = _1170 * 0.31830990314483642578125;
    float _1188 = precise::clamp(_1186, 0.0, 1.0);
    float _1190 = _797 ? as_type<float>(_1066) : 0.0;
    float _1192 = fma(_1130, _1068, _1168);
    float _1194 = fma(_1130, _1070, _1172);
    float _1196 = -_1178;
    float _1198 = _1196 + 1.0;
    float _1200 = fma(_1130, _1072, _1174);
    float _1202 = _1188 * 0.88622701168060302734375;
    float _1204 = fma(_1190, _1130, _1182);
    float _1206 = fma(_1118, _1130, _1180);
    float _1208 = fma(_1120, _1130, _1184);
    float _1210 = fma(_1198, (*spvDescriptorSet0.vp_c9)._m0[37].y, _1178);
    float _1212 = precise::max(0.0, _1192);
    float _1214 = _1202 * (*spvDescriptorSet0.vp_c9)._m0[991].y;
    float _1216 = precise::max(0.0, _1194);
    float _1218 = _1202 * (*spvDescriptorSet0.vp_c9)._m0[991].x;
    float _1220 = precise::max(0.0, _1200);
    float _1222 = _1202 * (*spvDescriptorSet0.vp_c9)._m0[991].z;
    float _1224 = precise::max(0.0, _1204);
    float _1226 = _1210 * (*spvDescriptorSet0.vp_c9)._m0[40].z;
    float _1228 = precise::max(0.0, _1206);
    float _1230 = fma(_1212, (*spvDescriptorSet0.vp_c9)._m0[68].y, _1214);
    float _1232 = precise::max(0.0, _1208);
    float _1234 = fma(_1216, (*spvDescriptorSet0.vp_c9)._m0[68].x, _1218);
    float _1236 = fma(_1220, (*spvDescriptorSet0.vp_c9)._m0[68].z, _1222);
    float _1238 = fma(_1224, _1226, _1230);
    float _1240 = fma(_1228, _1226, _1234);
    float _1242 = fma(_1232, _1226, _1236);
    out.m_49.w = (*spvDescriptorSet0.vp_c15)._m0[7].y;
    out.m_51.x = _1240;
    out.m_51.y = _1238;
    out.m_51.z = _1242;
    out.m_51.w = _823;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_BaseInstance [[base_instance]])
{
    main0_out out = {};
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    bool _923 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _65 = in.m_42.x;
    float _67 = in.m_42.y;
    float _69 = -(*spvDescriptorSet0.vp_c15)._m0[3].x;
    float _71 = _69 + (*spvDescriptorSet0.vp_c15)._m0[3].y;
    int _74 = 16 + as_type<int>(as_type<float>(gl_BaseInstance));
    int _76 = _74 << 4;
    bool _80 = _76 == 0;
    bool _82 = _76 == 16;
    bool _84 = _76 == 32;
    bool _86 = _76 == 48;
    bool _88 = _76 == 64;
    float _90 = fma(_71, _65, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _92 = fma(_65, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    bool _94 = _76 == 80;
    bool _96 = _67 >= 0.5;
    bool _98 = isnan(_67);
    bool _100 = _96 || _98;
    bool _102 = isnan(0.5);
    bool _104 = _100 || _102;
    float _106 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _108 = _90 + _106;
    float _110 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _112 = _92 + _110;
    float _114 = as_type<float>(gl_BaseInstance);
    if (_80)
    {
        _114 = (*spvDescriptorSet0.vp_c14)._m0[268].x;
    }
    float _116 = _114;
    float _118 = _108 * _108;
    bool _120 = _76 == 96;
    float _122 = 0.0;
    float _124 = _116;
    float _126 = (*spvDescriptorSet0.vp_c15)._m0[5].x;
    if (_80)
    {
        _122 = (*spvDescriptorSet0.vp_c14)._m0[268].z;
    }
    float _128 = _122;
    float _130 = fma(_112, _112, _118);
    float _132 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _134 = (*spvDescriptorSet0.vp_c15)._m0[0].w + _132;
    float _136 = _128;
    float _138 = _134;
    if (_82)
    {
        _124 = (*spvDescriptorSet0.vp_c14)._m0[269].x;
    }
    float _140 = _124;
    bool _142 = _76 == 112;
    float _144 = fma(_134, _134, _130);
    float _146 = _140;
    if (_82)
    {
        _136 = (*spvDescriptorSet0.vp_c14)._m0[269].z;
    }
    float _148 = _136;
    float _150 = _148;
    if (_84)
    {
        _146 = (*spvDescriptorSet0.vp_c14)._m0[270].x;
    }
    float _152 = _146;
    float _154 = rsqrt(_144);
    bool _156 = _76 == 128;
    float _158 = _152;
    if (_84)
    {
        _150 = (*spvDescriptorSet0.vp_c14)._m0[270].z;
    }
    float _160 = _150;
    float _162 = _160;
    if (_86)
    {
        _158 = (*spvDescriptorSet0.vp_c14)._m0[271].x;
    }
    float _164 = _158;
    bool _166 = _76 == 144;
    float _168 = _164;
    if (_86)
    {
        _162 = (*spvDescriptorSet0.vp_c14)._m0[271].z;
    }
    float _170 = _162;
    float _172 = _170;
    if (_88)
    {
        _168 = (*spvDescriptorSet0.vp_c14)._m0[272].x;
    }
    float _174 = _168;
    bool _176 = _76 == 160;
    float _178 = _174;
    if (_88)
    {
        _172 = (*spvDescriptorSet0.vp_c14)._m0[272].z;
    }
    float _180 = _172;
    float _182 = _154 * (*spvDescriptorSet0.vp_c14)._m0[268].x;
    float _184 = _180;
    if (_94)
    {
        _178 = (*spvDescriptorSet0.vp_c14)._m0[273].x;
    }
    float _186 = _178;
    bool _188 = _76 == 176;
    float _190 = _186;
    if (_94)
    {
        _184 = (*spvDescriptorSet0.vp_c14)._m0[273].z;
    }
    float _192 = _184;
    float _194 = log2(_182);
    bool _196 = _76 == 192;
    float _198 = _192;
    if (_120)
    {
        _190 = (*spvDescriptorSet0.vp_c14)._m0[274].x;
    }
    float _200 = _190;
    float _202 = _200;
    if (_120)
    {
        _198 = (*spvDescriptorSet0.vp_c14)._m0[274].z;
    }
    float _204 = _198;
    float _206 = _204;
    if (_142)
    {
        _202 = (*spvDescriptorSet0.vp_c14)._m0[275].x;
    }
    float _208 = _202;
    bool _210 = _76 == 208;
    float _212 = _208;
    if (_142)
    {
        _206 = (*spvDescriptorSet0.vp_c14)._m0[275].z;
    }
    float _214 = _206;
    float _216 = _214;
    if (_156)
    {
        _212 = (*spvDescriptorSet0.vp_c14)._m0[276].x;
    }
    float _218 = _212;
    bool _220 = _76 == 224;
    float _222 = _194 + 1.2999999523162841796875;
    float _224 = _218;
    if (_156)
    {
        _216 = (*spvDescriptorSet0.vp_c14)._m0[276].z;
    }
    float _226 = _216;
    float _228 = _226;
    if (_166)
    {
        _224 = (*spvDescriptorSet0.vp_c14)._m0[277].x;
    }
    float _230 = _224;
    bool _232 = _76 == 240;
    float _234 = trunc(_222);
    int _236 = int(_234);
    float _238 = _230;
    if (_166)
    {
        _228 = (*spvDescriptorSet0.vp_c14)._m0[277].z;
    }
    float _240 = _228;
    float _242 = _240;
    if (_176)
    {
        _238 = (*spvDescriptorSet0.vp_c14)._m0[278].x;
    }
    float _244 = _238;
    bool _246 = _76 == 256;
    float _248 = _244;
    if (_176)
    {
        _242 = (*spvDescriptorSet0.vp_c14)._m0[278].z;
    }
    float _250 = _242;
    float _252 = _250;
    if (_188)
    {
        _248 = (*spvDescriptorSet0.vp_c14)._m0[279].x;
    }
    float _254 = _248;
    bool _256 = _76 == 272;
    float _258 = _254;
    if (_188)
    {
        _252 = (*spvDescriptorSet0.vp_c14)._m0[279].z;
    }
    float _260 = _252;
    float _262 = _260;
    if (_196)
    {
        _258 = (*spvDescriptorSet0.vp_c14)._m0[280].x;
    }
    float _264 = _258;
    int _266 = min(_236, 15);
    bool _268 = _76 == 288;
    float _270 = _264;
    if (_196)
    {
        _262 = (*spvDescriptorSet0.vp_c14)._m0[280].z;
    }
    float _272 = _262;
    float _274 = float(_266);
    bool _276 = _76 == 304;
    int _278 = _266 << 4;
    int _280 = _278 + 4288;
    float _282 = _272;
    if (_210)
    {
        _270 = (*spvDescriptorSet0.vp_c14)._m0[281].x;
    }
    float _284 = _270;
    float _286 = _284;
    if (_210)
    {
        _282 = (*spvDescriptorSet0.vp_c14)._m0[281].z;
    }
    float _288 = _282;
    float _290 = -_274;
    float _292 = _290 + (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _294 = _288;
    if (_220)
    {
        _286 = (*spvDescriptorSet0.vp_c14)._m0[282].x;
    }
    float _296 = _286;
    bool _298 = _76 == 320;
    float _300 = _292 + 1.0;
    float _302 = _296;
    if (_220)
    {
        _294 = (*spvDescriptorSet0.vp_c14)._m0[282].z;
    }
    float _304 = _294;
    float _306 = _304;
    if (_232)
    {
        _302 = (*spvDescriptorSet0.vp_c14)._m0[283].x;
    }
    float _308 = _302;
    bool _310 = _76 == 336;
    float _312 = exp2(_300);
    float _314 = _308;
    if (_232)
    {
        _306 = (*spvDescriptorSet0.vp_c14)._m0[283].z;
    }
    float _316 = _306;
    float _318 = _316;
    if (_246)
    {
        _314 = (*spvDescriptorSet0.vp_c14)._m0[284].x;
    }
    float _320 = _314;
    bool _322 = _76 == 352;
    float _324 = _320;
    if (_246)
    {
        _318 = (*spvDescriptorSet0.vp_c14)._m0[284].z;
    }
    float _326 = _318;
    float _328 = _326;
    if (_256)
    {
        _324 = (*spvDescriptorSet0.vp_c14)._m0[285].x;
    }
    float _330 = _324;
    bool _332 = _76 == 368;
    float _334 = _330;
    if (_256)
    {
        _328 = (*spvDescriptorSet0.vp_c14)._m0[285].z;
    }
    float _336 = _328;
    float _338 = _336;
    if (_268)
    {
        _334 = (*spvDescriptorSet0.vp_c14)._m0[286].x;
    }
    float _340 = _334;
    float _342 = 1.0 / _312;
    bool _344 = _76 == 384;
    float _346 = _340;
    if (_268)
    {
        _338 = (*spvDescriptorSet0.vp_c14)._m0[286].z;
    }
    float _348 = _338;
    float _350 = _348;
    if (_276)
    {
        _346 = (*spvDescriptorSet0.vp_c14)._m0[287].x;
    }
    float _352 = _346;
    bool _354 = _76 == 400;
    float _356 = _352;
    if (_276)
    {
        _350 = (*spvDescriptorSet0.vp_c14)._m0[287].z;
    }
    float _358 = _350;
    bool _360 = _76 == 416;
    float _362 = _358;
    if (_298)
    {
        _356 = (*spvDescriptorSet0.vp_c14)._m0[288].x;
    }
    float _364 = _356;
    float _366 = _364;
    if (_298)
    {
        _362 = (*spvDescriptorSet0.vp_c14)._m0[288].z;
    }
    float _368 = _362;
    float _370 = _368;
    if (_310)
    {
        _366 = (*spvDescriptorSet0.vp_c14)._m0[289].x;
    }
    float _372 = _366;
    bool _374 = _76 == 432;
    float _376 = _372;
    if (_310)
    {
        _370 = (*spvDescriptorSet0.vp_c14)._m0[289].z;
    }
    float _378 = _370;
    float _380 = _378;
    if (_322)
    {
        _376 = (*spvDescriptorSet0.vp_c14)._m0[290].x;
    }
    float _382 = _376;
    bool _384 = _76 == 448;
    float _386 = _382;
    if (_322)
    {
        _380 = (*spvDescriptorSet0.vp_c14)._m0[290].z;
    }
    float _388 = _380;
    float _390 = _388;
    if (_332)
    {
        _386 = (*spvDescriptorSet0.vp_c14)._m0[291].x;
    }
    float _392 = _386;
    bool _394 = _76 == 464;
    float _396 = _392;
    if (_332)
    {
        _390 = (*spvDescriptorSet0.vp_c14)._m0[291].z;
    }
    float _398 = _390;
    float _400 = _398;
    if (_344)
    {
        _396 = (*spvDescriptorSet0.vp_c14)._m0[292].x;
    }
    float _402 = _396;
    bool _404 = _76 == 480;
    float _406 = _402;
    if (_344)
    {
        _400 = (*spvDescriptorSet0.vp_c14)._m0[292].z;
    }
    float _408 = _400;
    float _410 = _408;
    if (_354)
    {
        _406 = (*spvDescriptorSet0.vp_c14)._m0[293].x;
    }
    float _412 = _406;
    bool _414 = _76 == 496;
    float _416 = _412;
    if (_354)
    {
        _410 = (*spvDescriptorSet0.vp_c14)._m0[293].z;
    }
    float _418 = _410;
    float _420 = _418;
    if (_360)
    {
        _416 = (*spvDescriptorSet0.vp_c14)._m0[294].x;
    }
    float _422 = _416;
    bool _424 = _76 == 512;
    float _426 = _422;
    if (_360)
    {
        _420 = (*spvDescriptorSet0.vp_c14)._m0[294].z;
    }
    float _428 = _420;
    bool _430 = _76 == 528;
    float _432 = _428;
    if (_374)
    {
        _426 = (*spvDescriptorSet0.vp_c14)._m0[295].x;
    }
    float _434 = _426;
    float _436 = _434;
    if (_374)
    {
        _432 = (*spvDescriptorSet0.vp_c14)._m0[295].z;
    }
    float _438 = _432;
    float _440 = _438;
    if (_384)
    {
        _436 = (*spvDescriptorSet0.vp_c14)._m0[296].x;
    }
    float _442 = _436;
    bool _444 = _76 == 544;
    float _446 = _442;
    if (_384)
    {
        _440 = (*spvDescriptorSet0.vp_c14)._m0[296].z;
    }
    float _448 = _440;
    float _450 = _448;
    if (_394)
    {
        _446 = (*spvDescriptorSet0.vp_c14)._m0[297].x;
    }
    float _452 = _446;
    bool _454 = _76 == 560;
    float _456 = _452;
    if (_394)
    {
        _450 = (*spvDescriptorSet0.vp_c14)._m0[297].z;
    }
    float _458 = _450;
    float _460 = _458;
    if (_404)
    {
        _456 = (*spvDescriptorSet0.vp_c14)._m0[298].x;
    }
    float _462 = _456;
    bool _464 = _76 == 576;
    float _466 = _462;
    if (_404)
    {
        _460 = (*spvDescriptorSet0.vp_c14)._m0[298].z;
    }
    float _468 = _460;
    float _470 = _468;
    if (_414)
    {
        _466 = (*spvDescriptorSet0.vp_c14)._m0[299].x;
    }
    float _472 = _466;
    bool _474 = _76 == 592;
    float _476 = _472;
    if (_414)
    {
        _470 = (*spvDescriptorSet0.vp_c14)._m0[299].z;
    }
    float _478 = _470;
    float _480 = _478;
    if (_424)
    {
        _476 = (*spvDescriptorSet0.vp_c14)._m0[300].x;
    }
    float _482 = _476;
    bool _484 = _76 == 608;
    float _486 = _482;
    if (_424)
    {
        _480 = (*spvDescriptorSet0.vp_c14)._m0[300].z;
    }
    float _488 = _480;
    float _490 = _488;
    if (_430)
    {
        _486 = (*spvDescriptorSet0.vp_c14)._m0[301].x;
    }
    float _492 = _486;
    bool _494 = _76 == 624;
    float _496 = _492;
    if (_430)
    {
        _490 = (*spvDescriptorSet0.vp_c14)._m0[301].z;
    }
    float _498 = _490;
    bool _500 = _76 == 640;
    float _502 = _498;
    if (_444)
    {
        _496 = (*spvDescriptorSet0.vp_c14)._m0[302].x;
    }
    float _504 = _496;
    float _506 = _504;
    if (_444)
    {
        _502 = (*spvDescriptorSet0.vp_c14)._m0[302].z;
    }
    float _508 = _502;
    float _510 = _508;
    if (_454)
    {
        _506 = (*spvDescriptorSet0.vp_c14)._m0[303].x;
    }
    float _512 = _506;
    bool _514 = _76 == 656;
    float _516 = _512;
    if (_454)
    {
        _510 = (*spvDescriptorSet0.vp_c14)._m0[303].z;
    }
    float _518 = _510;
    float _520 = _518;
    if (_464)
    {
        _516 = (*spvDescriptorSet0.vp_c14)._m0[304].x;
    }
    float _522 = _516;
    bool _524 = _76 == 672;
    float _526 = _522;
    if (_464)
    {
        _520 = (*spvDescriptorSet0.vp_c14)._m0[304].z;
    }
    float _528 = _520;
    float _530 = _528;
    if (_474)
    {
        _526 = (*spvDescriptorSet0.vp_c14)._m0[305].x;
    }
    float _532 = _526;
    bool _534 = _76 == 688;
    float _536 = _532;
    if (_474)
    {
        _530 = (*spvDescriptorSet0.vp_c14)._m0[305].z;
    }
    float _538 = _530;
    float _540 = _538;
    if (_484)
    {
        _536 = (*spvDescriptorSet0.vp_c14)._m0[306].x;
    }
    float _542 = _536;
    bool _544 = _76 == 704;
    float _546 = _542;
    if (_484)
    {
        _540 = (*spvDescriptorSet0.vp_c14)._m0[306].z;
    }
    float _548 = _540;
    float _550 = _548;
    if (_494)
    {
        _546 = (*spvDescriptorSet0.vp_c14)._m0[307].x;
    }
    float _552 = _546;
    bool _554 = _76 == 720;
    float _556 = _552;
    if (_494)
    {
        _550 = (*spvDescriptorSet0.vp_c14)._m0[307].z;
    }
    float _558 = _550;
    float _560 = _558;
    if (_500)
    {
        _556 = (*spvDescriptorSet0.vp_c14)._m0[308].x;
    }
    float _562 = _556;
    bool _564 = _76 == 736;
    float _566 = _562;
    if (_500)
    {
        _560 = (*spvDescriptorSet0.vp_c14)._m0[308].z;
    }
    float _568 = _560;
    bool _570 = _76 == 752;
    float _572 = _568;
    if (_514)
    {
        _566 = (*spvDescriptorSet0.vp_c14)._m0[309].x;
    }
    float _574 = _566;
    float _576 = _574;
    if (_524)
    {
        _576 = (*spvDescriptorSet0.vp_c14)._m0[310].x;
    }
    float _578 = _576;
    float _580 = _578;
    if (_534)
    {
        _580 = (*spvDescriptorSet0.vp_c14)._m0[311].x;
    }
    float _582 = _580;
    float _584 = _582;
    if (_544)
    {
        _584 = (*spvDescriptorSet0.vp_c14)._m0[312].x;
    }
    float _586 = _584;
    float _588 = _586;
    if (_554)
    {
        _588 = (*spvDescriptorSet0.vp_c14)._m0[313].x;
    }
    float _590 = _588;
    float _592 = _590;
    if (_564)
    {
        _592 = (*spvDescriptorSet0.vp_c14)._m0[314].x;
    }
    float _594 = _592;
    float _596 = _594;
    if (_570)
    {
        _596 = (*spvDescriptorSet0.vp_c14)._m0[315].x;
    }
    float _598 = _596;
    float _600 = _342 * _598;
    if (_514)
    {
        _572 = (*spvDescriptorSet0.vp_c14)._m0[309].z;
    }
    float _602 = _572;
    float _604 = _602;
    if (_524)
    {
        _604 = (*spvDescriptorSet0.vp_c14)._m0[310].z;
    }
    float _606 = _604;
    float _608 = _600 * _65;
    float _610 = _606;
    if (_534)
    {
        _610 = (*spvDescriptorSet0.vp_c14)._m0[311].z;
    }
    float _612 = _610;
    float _614 = _612;
    if (_544)
    {
        _614 = (*spvDescriptorSet0.vp_c14)._m0[312].z;
    }
    float _616 = _614;
    float _618 = floor(_608);
    float _620 = _616;
    if (_554)
    {
        _620 = (*spvDescriptorSet0.vp_c14)._m0[313].z;
    }
    float _622 = _620;
    float _624 = _622;
    if (_564)
    {
        _624 = (*spvDescriptorSet0.vp_c14)._m0[314].z;
    }
    float _626 = _624;
    float _628 = _626;
    if (_570)
    {
        _628 = (*spvDescriptorSet0.vp_c14)._m0[315].z;
    }
    float _630 = _628;
    float _632 = -_618;
    float _634 = _608 + _632;
    float _636 = _312 * _630;
    int _638 = _280 + 8;
    uint _641 = uint(int(uint(_638) >> uint(2)));
    uint _643 = uint(int(uint(int(_641)) >> uint(2)));
    int _645 = int(_641) & 3;
    float _647 = (*spvDescriptorSet0.vp_c14)._m0[int(_643)][_645];
    int _649 = int(_641) + 1;
    uint _651 = uint(int(uint(_649) >> uint(2)));
    int _653 = _649 & 3;
    float _655 = (*spvDescriptorSet0.vp_c14)._m0[int(_651)][_653];
    float _657 = _634 * 2.0;
    float _659 = -_634;
    float _661 = fma(_636, _659, _65);
    float _663 = floor(_657);
    float _665 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].w);
    float _667 = _636 * _663;
    float _669 = _667 * 0.5;
    float _671 = _669 + _661;
    float _673 = fma(_71, _671, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _675 = fma(_671, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _677 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _679 = _673 + _677;
    float _681 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _683 = _675 + _681;
    float _685 = _679 * _679;
    float _687 = fma(_683, _683, _685);
    float _689 = fma(_134, _134, _687);
    float _691 = sqrt(_689);
    float _693 = -_655;
    float _695 = fma(_691, _647, _693);
    float _697 = precise::clamp(_695, 0.0, 1.0);
    float _699 = -_669;
    float _701 = fma(_699, _697, _671);
    float _703 = fma(_701, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _705 = _701;
    float _707 = _655;
    float _709 = _636;
    float _711 = _671;
    float _713 = _689;
    if (!_104)
    {
        _705 = (*spvDescriptorSet0.vp_c15)._m0[6].x;
    }
    float _715 = _705;
    float _717 = fma(_703, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].z);
    float _719 = _715;
    if (!_104)
    {
        float _721 = fma(_665, _715, (*spvDescriptorSet0.vp_c15)._m0[6].w);
        _126 = _721;
    }
    float _723 = _126;
    float _725 = _723;
    if (!_104)
    {
        float _727 = fma(_717, _715, (*spvDescriptorSet0.vp_c15)._m0[6].z);
        _719 = _727;
    }
    float _729 = _719;
    float _731 = _729;
    if (!_104)
    {
        float _733 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _723);
        _725 = _733;
    }
    float _735 = _725;
    if (!_104)
    {
        float _737 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _729);
        _731 = _737;
    }
    float _739 = _731;
    if (!_104)
    {
        float2 _2432 = float2(_739, _735);
        float _741 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2432, float2(0.0), isnan(_2432)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2432, float2(0.0), isnan(_2432)), level(0.0)).x;
        _707 = _741;
    }
    float _743 = _707;
    if (_104)
    {
        _709 = (*spvDescriptorSet0.vp_c15)._m0[14].x;
    }
    float _745 = _709;
    if (_104)
    {
        _711 = (*spvDescriptorSet0.vp_c15)._m0[15].x;
    }
    float _747 = _711;
    if (_104)
    {
        float _749 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, _745, (*spvDescriptorSet0.vp_c15)._m0[14].w);
        _713 = _749;
    }
    float _751 = _713;
    float _753 = _751;
    if (_104)
    {
        float _755 = fma(_703, _745, (*spvDescriptorSet0.vp_c15)._m0[14].z);
        _138 = _755;
    }
    float _757 = _138;
    float _759 = _757;
    if (_104)
    {
        float _761 = fma(_751, _747, (*spvDescriptorSet0.vp_c15)._m0[15].w);
        _753 = _761;
    }
    float _763 = _753;
    float _765 = _763;
    if (_104)
    {
        float _767 = fma(_757, _747, (*spvDescriptorSet0.vp_c15)._m0[15].z);
        _759 = _767;
    }
    float _769 = _759;
    float _771 = _769;
    if (_104)
    {
        float _773 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _763);
        _765 = _773;
    }
    float _775 = _765;
    if (_104)
    {
        float _777 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _769);
        _771 = _777;
    }
    float _779 = _771;
    float _781 = _743;
    if (_104)
    {
        float2 _2524 = float2(_779, _775);
        float _783 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_2524, float2(0.0), isnan(_2524)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_2524, float2(0.0), isnan(_2524)), level(0.0)).x;
        _781 = _783;
    }
    float _785 = _781;
    float _787 = fma(_665, (*spvDescriptorSet0.vp_c15)._m0[8].x, (*spvDescriptorSet0.vp_c15)._m0[8].w);
    float _789 = fma(_717, (*spvDescriptorSet0.vp_c15)._m0[8].x, (*spvDescriptorSet0.vp_c15)._m0[8].z);
    float _791 = fma(_665, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].w);
    float _793 = fma(_717, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].z);
    int _795 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[40].w) & 2;
    bool _797 = _795 != 0;
    float _799 = fma(_785, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _801 = _799 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _803 = _799 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _805 = _799 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _807 = fma(_703, (*spvDescriptorSet0.vp_c4)._m0[1].x, _801);
    float _809 = fma(_703, (*spvDescriptorSet0.vp_c4)._m0[0].x, _803);
    float _811 = fma(_703, (*spvDescriptorSet0.vp_c4)._m0[2].x, _805);
    float _813 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, (*spvDescriptorSet0.vp_c4)._m0[1].z, _807);
    float _815 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, (*spvDescriptorSet0.vp_c4)._m0[0].z, _809);
    float _817 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, (*spvDescriptorSet0.vp_c4)._m0[2].z, _811);
    float _819 = _813 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _821 = _815 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _823 = _817 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _825 = _819 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _827 = _819 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _829 = _819 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _831 = _819 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _833 = fma(_821, (*spvDescriptorSet0.vp_c4)._m0[8].x, _825);
    float _835 = fma(_821, (*spvDescriptorSet0.vp_c4)._m0[7].x, _827);
    float _837 = fma(_821, (*spvDescriptorSet0.vp_c4)._m0[9].x, _829);
    float _839 = fma(_821, (*spvDescriptorSet0.vp_c4)._m0[10].x, _831);
    float _841 = fma(_823, (*spvDescriptorSet0.vp_c4)._m0[8].z, _833);
    float _843 = fma(_823, (*spvDescriptorSet0.vp_c4)._m0[7].z, _835);
    float _845 = fma(_823, (*spvDescriptorSet0.vp_c4)._m0[9].z, _837);
    float _847 = fma(_823, (*spvDescriptorSet0.vp_c4)._m0[10].z, _839);
    float _849 = _841 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _851 = _843 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _853 = _845 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _855 = _847 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    bool _857 = !_797;
    float _859;
    float _861;
    float _863;
    int _865;
    int _867;
    int _869;
    int _871;
    int _873;
    int _875;
    int _877;
    int _879;
    float _881;
    float _883;
    float _885;
    float _887;
    float _889;
    float _891;
    float _893;
    float _895;
    float _897;
    float _899;
    float _901;
    float _903;
    float _905;
    float _907;
    float _909;
    float _911;
    float _913;
    int _915;
    float _917;
    float _919;
    float _921;
    if (!_857)
    {
        _859 = (*spvDescriptorSet0.vp_c9)._m0[919].x;
        _861 = (*spvDescriptorSet0.vp_c9)._m0[919].y;
        _863 = (*spvDescriptorSet0.vp_c9)._m0[919].z;
        _865 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[919].w);
        _867 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].x);
        _869 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].y);
        _871 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].z);
        _873 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].w);
        _875 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].x);
        _877 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].y);
        _879 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].w);
        _881 = (*spvDescriptorSet0.vp_c9)._m0[923].y;
        _883 = (*spvDescriptorSet0.vp_c9)._m0[922].y;
        _885 = (*spvDescriptorSet0.vp_c9)._m0[917].x;
        _887 = (*spvDescriptorSet0.vp_c9)._m0[916].w;
        _889 = (*spvDescriptorSet0.vp_c9)._m0[923].x;
        _891 = (*spvDescriptorSet0.vp_c9)._m0[922].x;
        _893 = (*spvDescriptorSet0.vp_c9)._m0[917].y;
        _895 = (*spvDescriptorSet0.vp_c9)._m0[916].y;
        _897 = (*spvDescriptorSet0.vp_c9)._m0[923].z;
        _899 = (*spvDescriptorSet0.vp_c9)._m0[922].z;
        _901 = (*spvDescriptorSet0.vp_c9)._m0[916].x;
        _903 = (*spvDescriptorSet0.vp_c9)._m0[916].z;
        _905 = (*spvDescriptorSet0.vp_c9)._m0[923].w;
        _907 = (*spvDescriptorSet0.vp_c9)._m0[922].w;
        _909 = (*spvDescriptorSet0.vp_c9)._m0[917].w;
        _911 = (*spvDescriptorSet0.vp_c9)._m0[917].z;
        _913 = (*spvDescriptorSet0.vp_c9)._m0[918].x;
        _915 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].z);
        _917 = (*spvDescriptorSet0.vp_c9)._m0[918].z;
        _919 = (*spvDescriptorSet0.vp_c9)._m0[918].y;
        _921 = (*spvDescriptorSet0.vp_c9)._m0[918].w;
        _923 = true;
    }
    else
    {
        float _925 = fma(_703, 6.2500002968590706586837768554688e-05, 0.5);
        float _927 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, 6.2500002968590706586837768554688e-05, 0.5);
        float3 _2800 = float3(_925, _927, float(0));
        float3 _2804 = select(_2800, float3(0.0), isnan(_2800));
        float4 _930 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2804.xy, uint(rint(_2804.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2804.xy, uint(rint(_2804.z)), level(0.0)).xyzw;
        float _932 = _930.x;
        float _934 = _930.y;
        float _936 = _930.z;
        float _938 = _930.w;
        float3 _2819 = float3(_925, _927, float(1));
        float3 _2821 = select(_2819, float3(0.0), isnan(_2819));
        float4 _940 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2821.xy, uint(rint(_2821.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2821.xy, uint(rint(_2821.z)), level(0.0)).xyzw;
        float _942 = _940.x;
        float _944 = _940.y;
        float _946 = _940.z;
        float _948 = _940.w;
        float3 _2836 = float3(_925, _927, float(2));
        float3 _2838 = select(_2836, float3(0.0), isnan(_2836));
        float4 _950 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2838.xy, uint(rint(_2838.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2838.xy, uint(rint(_2838.z)), level(0.0)).xyzw;
        float _952 = _950.x;
        float _954 = _950.y;
        float _956 = _950.z;
        float _958 = _950.w;
        float3 _2853 = float3(_925, _927, float(3));
        float3 _2855 = select(_2853, float3(0.0), isnan(_2853));
        float4 _960 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2855.xy, uint(rint(_2855.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2855.xy, uint(rint(_2855.z)), level(0.0)).xyzw;
        float _962 = _960.x;
        float _964 = _960.y;
        float _966 = _960.z;
        float _968 = _960.w;
        float3 _2870 = float3(_925, _927, float(4));
        float3 _2872 = select(_2870, float3(0.0), isnan(_2870));
        float4 _970 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2872.xy, uint(rint(_2872.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2872.xy, uint(rint(_2872.z)), level(0.0)).xyzw;
        float _972 = _970.x;
        float _974 = _970.y;
        float _976 = _970.z;
        float _978 = _970.w;
        float3 _2887 = float3(_925, _927, float(5));
        float3 _2889 = select(_2887, float3(0.0), isnan(_2887));
        float4 _980 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2889.xy, uint(rint(_2889.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2889.xy, uint(rint(_2889.z)), level(0.0)).xyzw;
        float _982 = _980.x;
        float _984 = _980.y;
        float _986 = _980.z;
        float _988 = _980.w;
        float3 _2904 = float3(_925, _927, float(6));
        float3 _2906 = select(_2904, float3(0.0), isnan(_2904));
        float4 _990 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2906.xy, uint(rint(_2906.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2906.xy, uint(rint(_2906.z)), level(0.0)).xyzw;
        float _992 = _990.x;
        float _994 = _990.y;
        float _996 = _990.z;
        float _998 = _990.w;
        float3 _2921 = float3(_925, _927, float(7));
        float3 _2923 = select(_2921, float3(0.0), isnan(_2921));
        float4 _1000 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2923.xy, uint(rint(_2923.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2923.xy, uint(rint(_2923.z)), level(0.0)).xyzw;
        float _1002 = _1000.x;
        float _1004 = _1000.y;
        float _1006 = _1000.z;
        float _1008 = _1000.w;
        _859 = _962;
        _861 = _964;
        _863 = _966;
        _865 = as_type<int>(_968);
        _867 = as_type<int>(_972);
        _869 = as_type<int>(_974);
        _871 = as_type<int>(_976);
        _873 = as_type<int>(_978);
        _875 = as_type<int>(_982);
        _877 = as_type<int>(_984);
        _879 = as_type<int>(_988);
        _881 = _1004;
        _883 = _994;
        _885 = _942;
        _887 = _938;
        _889 = _1002;
        _891 = _992;
        _893 = _944;
        _895 = _934;
        _897 = _1006;
        _899 = _996;
        _901 = _932;
        _903 = _936;
        _905 = _1008;
        _907 = _998;
        _909 = _948;
        _911 = _946;
        _913 = _952;
        _915 = as_type<int>(_986);
        _917 = _956;
        _919 = _954;
        _921 = _958;
    }
    _923 = false;
    float _1010 = _859;
    float _1012 = _861;
    float _1014 = _863;
    int _1016 = _865;
    int _1018 = _867;
    int _1020 = _869;
    int _1022 = _871;
    int _1024 = _873;
    int _1026 = _875;
    int _1028 = _877;
    int _1030 = _879;
    float _1032 = _881;
    float _1034 = _883;
    float _1036 = _885;
    float _1038 = _887;
    float _1040 = _889;
    float _1042 = _891;
    float _1044 = _893;
    float _1046 = _895;
    float _1048 = _897;
    float _1050 = _899;
    float _1052 = _901;
    float _1054 = _903;
    float _1056 = _905;
    float _1058 = _907;
    float _1060 = _909;
    float _1062 = _911;
    float _1064 = _913;
    int _1066 = _915;
    float _1068 = _917;
    float _1070 = _919;
    float _1072 = _921;
    float _1074 = -(*spvDescriptorSet0.vp_c4)._m0[12].w;
    float _1076 = _799 + _1074;
    float _1078 = -(*spvDescriptorSet0.vp_c4)._m0[11].w;
    float _1080 = _703 + _1078;
    float _1082 = -(*spvDescriptorSet0.vp_c4)._m0[13].w;
    float _1084 = (*spvDescriptorSet0.vp_c15)._m0[0].w + _1082;
    out.gl_Position.x = _851;
    out.gl_Position.y = _849;
    out.gl_Position.z = _853;
    out.gl_Position.w = _855;
    float _1086 = _1076 * _1076;
    float _1088 = _1010 * 0.88622701168060302734375;
    float _1090 = _1012 * 0.88622701168060302734375;
    float _1092 = _1014 * 0.88622701168060302734375;
    float _1094 = fma(_1080, _1080, _1086);
    float _1096 = _797 ? as_type<float>(_1016) : 0.0;
    out.m_45.x = _703;
    out.m_45.y = _799;
    out.m_45.z = (*spvDescriptorSet0.vp_c15)._m0[0].w;
    float _1098 = _797 ? as_type<float>(_1018) : 0.0;
    float _1100 = fma(_1084, _1084, _1094);
    float _1102 = _797 ? as_type<float>(_1020) : 0.0;
    out.m_47.z = _793;
    out.m_47.w = _791;
    float _1104 = _797 ? _1088 : 0.0;
    float _1106 = _797 ? _1090 : 0.0;
    float _1108 = rsqrt(_1100);
    float _1110 = _797 ? _1092 : 0.0;
    out.m_49.x = _789;
    float _1112 = _797 ? as_type<float>(_1022) : 0.0;
    float _1114 = _797 ? as_type<float>(_1024) : 0.0;
    out.m_49.y = _787;
    float _1116 = _797 ? as_type<float>(_1026) : 0.0;
    float _1118 = _797 ? as_type<float>(_1028) : 0.0;
    float _1120 = _797 ? as_type<float>(_1030) : 0.0;
    float _1122 = _1108 * 1.02332699298858642578125;
    float _1124 = _1084 * _1108;
    float _1126 = _1076 * _1122;
    float _1128 = _1124 * (-1.02332699298858642578125);
    float _1130 = _1080 * _1122;
    float _1132 = _1126 * _1032;
    float _1134 = _1126 * _1034;
    float _1136 = _1126 * _1036;
    float _1138 = _1126 * _1038;
    float _1140 = fma(_1040, 0.88622701168060302734375, _1132);
    float _1142 = fma(_1042, 0.88622701168060302734375, _1134);
    float _1144 = _1126 * _1044;
    float _1146 = fma(_1046, 0.88622701168060302734375, _1136);
    float _1148 = fma(_1128, _1048, _1140);
    float _1150 = fma(_1128, _1050, _1142);
    float _1152 = fma(_1052, 0.88622701168060302734375, _1138);
    float _1154 = fma(_1054, 0.88622701168060302734375, _1144);
    float _1156 = fma(_1130, _1056, _1148);
    float _1158 = fma(_1130, _1058, _1150);
    float _1160 = fma(_1096, _1126, _1104);
    float _1162 = fma(_1098, _1126, _1106);
    float _1164 = fma(_1102, _1126, _1110);
    float _1166 = precise::max(0.0, _1156);
    float _1168 = fma(_1128, _1060, _1146);
    float _1170 = precise::max(0.0, _1158);
    float _1172 = fma(_1128, _1062, _1152);
    float _1174 = fma(_1128, _1064, _1154);
    float _1176 = _1166 * 0.31830990314483642578125;
    float _1178 = precise::clamp(_1176, 0.0, 1.0);
    float _1180 = fma(_1112, _1128, _1160);
    float _1182 = fma(_1114, _1128, _1162);
    float _1184 = fma(_1116, _1128, _1164);
    float _1186 = _1170 * 0.31830990314483642578125;
    float _1188 = precise::clamp(_1186, 0.0, 1.0);
    float _1190 = _797 ? as_type<float>(_1066) : 0.0;
    float _1192 = fma(_1130, _1068, _1168);
    float _1194 = fma(_1130, _1070, _1172);
    float _1196 = -_1178;
    float _1198 = _1196 + 1.0;
    float _1200 = fma(_1130, _1072, _1174);
    float _1202 = _1188 * 0.88622701168060302734375;
    float _1204 = fma(_1190, _1130, _1182);
    float _1206 = fma(_1118, _1130, _1180);
    float _1208 = fma(_1120, _1130, _1184);
    float _1210 = fma(_1198, (*spvDescriptorSet0.vp_c9)._m0[37].y, _1178);
    float _1212 = precise::max(0.0, _1192);
    float _1214 = _1202 * (*spvDescriptorSet0.vp_c9)._m0[991].y;
    float _1216 = precise::max(0.0, _1194);
    float _1218 = _1202 * (*spvDescriptorSet0.vp_c9)._m0[991].x;
    float _1220 = precise::max(0.0, _1200);
    float _1222 = _1202 * (*spvDescriptorSet0.vp_c9)._m0[991].z;
    float _1224 = precise::max(0.0, _1204);
    float _1226 = _1210 * (*spvDescriptorSet0.vp_c9)._m0[40].z;
    float _1228 = precise::max(0.0, _1206);
    float _1230 = fma(_1212, (*spvDescriptorSet0.vp_c9)._m0[68].y, _1214);
    float _1232 = precise::max(0.0, _1208);
    float _1234 = fma(_1216, (*spvDescriptorSet0.vp_c9)._m0[68].x, _1218);
    float _1236 = fma(_1220, (*spvDescriptorSet0.vp_c9)._m0[68].z, _1222);
    float _1238 = fma(_1224, _1226, _1230);
    float _1240 = fma(_1228, _1226, _1234);
    float _1242 = fma(_1232, _1226, _1236);
    out.m_49.w = (*spvDescriptorSet0.vp_c15)._m0[7].y;
    out.m_51.x = _1240;
    out.m_51.y = _1238;
    out.m_51.z = _1242;
    out.m_51.w = _823;
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
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    bool _923 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _65 = in.m_42.x;
    float _67 = in.m_42.y;
    float _69 = -(*spvDescriptorSet0.vp_c15)._m0[3].x;
    float _71 = _69 + (*spvDescriptorSet0.vp_c15)._m0[3].y;
    int _74 = 16 + as_type<int>(as_type<float>(gl_BaseInstance));
    int _76 = _74 << 4;
    bool _80 = _76 == 0;
    bool _82 = _76 == 16;
    bool _84 = _76 == 32;
    bool _86 = _76 == 48;
    bool _88 = _76 == 64;
    float _90 = fma(_71, _65, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _92 = fma(_65, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    bool _94 = _76 == 80;
    bool _96 = _67 >= 0.5;
    bool _98 = isnan(_67);
    bool _100 = _96 || _98;
    bool _102 = isnan(0.5);
    bool _104 = _100 || _102;
    float _106 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _108 = _90 + _106;
    float _110 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _112 = _92 + _110;
    float _114 = as_type<float>(gl_BaseInstance);
    if (_80)
    {
        _114 = (*spvDescriptorSet0.vp_c14)._m0[268].x;
    }
    float _116 = _114;
    float _118 = _108 * _108;
    bool _120 = _76 == 96;
    float _122 = 0.0;
    float _124 = _116;
    float _126 = (*spvDescriptorSet0.vp_c15)._m0[5].x;
    if (_80)
    {
        _122 = (*spvDescriptorSet0.vp_c14)._m0[268].z;
    }
    float _128 = _122;
    float _130 = fma(_112, _112, _118);
    float _132 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _134 = (*spvDescriptorSet0.vp_c15)._m0[0].w + _132;
    float _136 = _128;
    float _138 = _134;
    if (_82)
    {
        _124 = (*spvDescriptorSet0.vp_c14)._m0[269].x;
    }
    float _140 = _124;
    bool _142 = _76 == 112;
    float _144 = fma(_134, _134, _130);
    float _146 = _140;
    if (_82)
    {
        _136 = (*spvDescriptorSet0.vp_c14)._m0[269].z;
    }
    float _148 = _136;
    float _150 = _148;
    if (_84)
    {
        _146 = (*spvDescriptorSet0.vp_c14)._m0[270].x;
    }
    float _152 = _146;
    float _154 = rsqrt(_144);
    bool _156 = _76 == 128;
    float _158 = _152;
    if (_84)
    {
        _150 = (*spvDescriptorSet0.vp_c14)._m0[270].z;
    }
    float _160 = _150;
    float _162 = _160;
    if (_86)
    {
        _158 = (*spvDescriptorSet0.vp_c14)._m0[271].x;
    }
    float _164 = _158;
    bool _166 = _76 == 144;
    float _168 = _164;
    if (_86)
    {
        _162 = (*spvDescriptorSet0.vp_c14)._m0[271].z;
    }
    float _170 = _162;
    float _172 = _170;
    if (_88)
    {
        _168 = (*spvDescriptorSet0.vp_c14)._m0[272].x;
    }
    float _174 = _168;
    bool _176 = _76 == 160;
    float _178 = _174;
    if (_88)
    {
        _172 = (*spvDescriptorSet0.vp_c14)._m0[272].z;
    }
    float _180 = _172;
    float _182 = _154 * (*spvDescriptorSet0.vp_c14)._m0[268].x;
    float _184 = _180;
    if (_94)
    {
        _178 = (*spvDescriptorSet0.vp_c14)._m0[273].x;
    }
    float _186 = _178;
    bool _188 = _76 == 176;
    float _190 = _186;
    if (_94)
    {
        _184 = (*spvDescriptorSet0.vp_c14)._m0[273].z;
    }
    float _192 = _184;
    float _194 = log2(_182);
    bool _196 = _76 == 192;
    float _198 = _192;
    if (_120)
    {
        _190 = (*spvDescriptorSet0.vp_c14)._m0[274].x;
    }
    float _200 = _190;
    float _202 = _200;
    if (_120)
    {
        _198 = (*spvDescriptorSet0.vp_c14)._m0[274].z;
    }
    float _204 = _198;
    float _206 = _204;
    if (_142)
    {
        _202 = (*spvDescriptorSet0.vp_c14)._m0[275].x;
    }
    float _208 = _202;
    bool _210 = _76 == 208;
    float _212 = _208;
    if (_142)
    {
        _206 = (*spvDescriptorSet0.vp_c14)._m0[275].z;
    }
    float _214 = _206;
    float _216 = _214;
    if (_156)
    {
        _212 = (*spvDescriptorSet0.vp_c14)._m0[276].x;
    }
    float _218 = _212;
    bool _220 = _76 == 224;
    float _222 = _194 + 1.2999999523162841796875;
    float _224 = _218;
    if (_156)
    {
        _216 = (*spvDescriptorSet0.vp_c14)._m0[276].z;
    }
    float _226 = _216;
    float _228 = _226;
    if (_166)
    {
        _224 = (*spvDescriptorSet0.vp_c14)._m0[277].x;
    }
    float _230 = _224;
    bool _232 = _76 == 240;
    float _234 = trunc(_222);
    int _236 = int(_234);
    float _238 = _230;
    if (_166)
    {
        _228 = (*spvDescriptorSet0.vp_c14)._m0[277].z;
    }
    float _240 = _228;
    float _242 = _240;
    if (_176)
    {
        _238 = (*spvDescriptorSet0.vp_c14)._m0[278].x;
    }
    float _244 = _238;
    bool _246 = _76 == 256;
    float _248 = _244;
    if (_176)
    {
        _242 = (*spvDescriptorSet0.vp_c14)._m0[278].z;
    }
    float _250 = _242;
    float _252 = _250;
    if (_188)
    {
        _248 = (*spvDescriptorSet0.vp_c14)._m0[279].x;
    }
    float _254 = _248;
    bool _256 = _76 == 272;
    float _258 = _254;
    if (_188)
    {
        _252 = (*spvDescriptorSet0.vp_c14)._m0[279].z;
    }
    float _260 = _252;
    float _262 = _260;
    if (_196)
    {
        _258 = (*spvDescriptorSet0.vp_c14)._m0[280].x;
    }
    float _264 = _258;
    int _266 = min(_236, 15);
    bool _268 = _76 == 288;
    float _270 = _264;
    if (_196)
    {
        _262 = (*spvDescriptorSet0.vp_c14)._m0[280].z;
    }
    float _272 = _262;
    float _274 = float(_266);
    bool _276 = _76 == 304;
    int _278 = _266 << 4;
    int _280 = _278 + 4288;
    float _282 = _272;
    if (_210)
    {
        _270 = (*spvDescriptorSet0.vp_c14)._m0[281].x;
    }
    float _284 = _270;
    float _286 = _284;
    if (_210)
    {
        _282 = (*spvDescriptorSet0.vp_c14)._m0[281].z;
    }
    float _288 = _282;
    float _290 = -_274;
    float _292 = _290 + (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _294 = _288;
    if (_220)
    {
        _286 = (*spvDescriptorSet0.vp_c14)._m0[282].x;
    }
    float _296 = _286;
    bool _298 = _76 == 320;
    float _300 = _292 + 1.0;
    float _302 = _296;
    if (_220)
    {
        _294 = (*spvDescriptorSet0.vp_c14)._m0[282].z;
    }
    float _304 = _294;
    float _306 = _304;
    if (_232)
    {
        _302 = (*spvDescriptorSet0.vp_c14)._m0[283].x;
    }
    float _308 = _302;
    bool _310 = _76 == 336;
    float _312 = exp2(_300);
    float _314 = _308;
    if (_232)
    {
        _306 = (*spvDescriptorSet0.vp_c14)._m0[283].z;
    }
    float _316 = _306;
    float _318 = _316;
    if (_246)
    {
        _314 = (*spvDescriptorSet0.vp_c14)._m0[284].x;
    }
    float _320 = _314;
    bool _322 = _76 == 352;
    float _324 = _320;
    if (_246)
    {
        _318 = (*spvDescriptorSet0.vp_c14)._m0[284].z;
    }
    float _326 = _318;
    float _328 = _326;
    if (_256)
    {
        _324 = (*spvDescriptorSet0.vp_c14)._m0[285].x;
    }
    float _330 = _324;
    bool _332 = _76 == 368;
    float _334 = _330;
    if (_256)
    {
        _328 = (*spvDescriptorSet0.vp_c14)._m0[285].z;
    }
    float _336 = _328;
    float _338 = _336;
    if (_268)
    {
        _334 = (*spvDescriptorSet0.vp_c14)._m0[286].x;
    }
    float _340 = _334;
    float _342 = 1.0 / _312;
    bool _344 = _76 == 384;
    float _346 = _340;
    if (_268)
    {
        _338 = (*spvDescriptorSet0.vp_c14)._m0[286].z;
    }
    float _348 = _338;
    float _350 = _348;
    if (_276)
    {
        _346 = (*spvDescriptorSet0.vp_c14)._m0[287].x;
    }
    float _352 = _346;
    bool _354 = _76 == 400;
    float _356 = _352;
    if (_276)
    {
        _350 = (*spvDescriptorSet0.vp_c14)._m0[287].z;
    }
    float _358 = _350;
    bool _360 = _76 == 416;
    float _362 = _358;
    if (_298)
    {
        _356 = (*spvDescriptorSet0.vp_c14)._m0[288].x;
    }
    float _364 = _356;
    float _366 = _364;
    if (_298)
    {
        _362 = (*spvDescriptorSet0.vp_c14)._m0[288].z;
    }
    float _368 = _362;
    float _370 = _368;
    if (_310)
    {
        _366 = (*spvDescriptorSet0.vp_c14)._m0[289].x;
    }
    float _372 = _366;
    bool _374 = _76 == 432;
    float _376 = _372;
    if (_310)
    {
        _370 = (*spvDescriptorSet0.vp_c14)._m0[289].z;
    }
    float _378 = _370;
    float _380 = _378;
    if (_322)
    {
        _376 = (*spvDescriptorSet0.vp_c14)._m0[290].x;
    }
    float _382 = _376;
    bool _384 = _76 == 448;
    float _386 = _382;
    if (_322)
    {
        _380 = (*spvDescriptorSet0.vp_c14)._m0[290].z;
    }
    float _388 = _380;
    float _390 = _388;
    if (_332)
    {
        _386 = (*spvDescriptorSet0.vp_c14)._m0[291].x;
    }
    float _392 = _386;
    bool _394 = _76 == 464;
    float _396 = _392;
    if (_332)
    {
        _390 = (*spvDescriptorSet0.vp_c14)._m0[291].z;
    }
    float _398 = _390;
    float _400 = _398;
    if (_344)
    {
        _396 = (*spvDescriptorSet0.vp_c14)._m0[292].x;
    }
    float _402 = _396;
    bool _404 = _76 == 480;
    float _406 = _402;
    if (_344)
    {
        _400 = (*spvDescriptorSet0.vp_c14)._m0[292].z;
    }
    float _408 = _400;
    float _410 = _408;
    if (_354)
    {
        _406 = (*spvDescriptorSet0.vp_c14)._m0[293].x;
    }
    float _412 = _406;
    bool _414 = _76 == 496;
    float _416 = _412;
    if (_354)
    {
        _410 = (*spvDescriptorSet0.vp_c14)._m0[293].z;
    }
    float _418 = _410;
    float _420 = _418;
    if (_360)
    {
        _416 = (*spvDescriptorSet0.vp_c14)._m0[294].x;
    }
    float _422 = _416;
    bool _424 = _76 == 512;
    float _426 = _422;
    if (_360)
    {
        _420 = (*spvDescriptorSet0.vp_c14)._m0[294].z;
    }
    float _428 = _420;
    bool _430 = _76 == 528;
    float _432 = _428;
    if (_374)
    {
        _426 = (*spvDescriptorSet0.vp_c14)._m0[295].x;
    }
    float _434 = _426;
    float _436 = _434;
    if (_374)
    {
        _432 = (*spvDescriptorSet0.vp_c14)._m0[295].z;
    }
    float _438 = _432;
    float _440 = _438;
    if (_384)
    {
        _436 = (*spvDescriptorSet0.vp_c14)._m0[296].x;
    }
    float _442 = _436;
    bool _444 = _76 == 544;
    float _446 = _442;
    if (_384)
    {
        _440 = (*spvDescriptorSet0.vp_c14)._m0[296].z;
    }
    float _448 = _440;
    float _450 = _448;
    if (_394)
    {
        _446 = (*spvDescriptorSet0.vp_c14)._m0[297].x;
    }
    float _452 = _446;
    bool _454 = _76 == 560;
    float _456 = _452;
    if (_394)
    {
        _450 = (*spvDescriptorSet0.vp_c14)._m0[297].z;
    }
    float _458 = _450;
    float _460 = _458;
    if (_404)
    {
        _456 = (*spvDescriptorSet0.vp_c14)._m0[298].x;
    }
    float _462 = _456;
    bool _464 = _76 == 576;
    float _466 = _462;
    if (_404)
    {
        _460 = (*spvDescriptorSet0.vp_c14)._m0[298].z;
    }
    float _468 = _460;
    float _470 = _468;
    if (_414)
    {
        _466 = (*spvDescriptorSet0.vp_c14)._m0[299].x;
    }
    float _472 = _466;
    bool _474 = _76 == 592;
    float _476 = _472;
    if (_414)
    {
        _470 = (*spvDescriptorSet0.vp_c14)._m0[299].z;
    }
    float _478 = _470;
    float _480 = _478;
    if (_424)
    {
        _476 = (*spvDescriptorSet0.vp_c14)._m0[300].x;
    }
    float _482 = _476;
    bool _484 = _76 == 608;
    float _486 = _482;
    if (_424)
    {
        _480 = (*spvDescriptorSet0.vp_c14)._m0[300].z;
    }
    float _488 = _480;
    float _490 = _488;
    if (_430)
    {
        _486 = (*spvDescriptorSet0.vp_c14)._m0[301].x;
    }
    float _492 = _486;
    bool _494 = _76 == 624;
    float _496 = _492;
    if (_430)
    {
        _490 = (*spvDescriptorSet0.vp_c14)._m0[301].z;
    }
    float _498 = _490;
    bool _500 = _76 == 640;
    float _502 = _498;
    if (_444)
    {
        _496 = (*spvDescriptorSet0.vp_c14)._m0[302].x;
    }
    float _504 = _496;
    float _506 = _504;
    if (_444)
    {
        _502 = (*spvDescriptorSet0.vp_c14)._m0[302].z;
    }
    float _508 = _502;
    float _510 = _508;
    if (_454)
    {
        _506 = (*spvDescriptorSet0.vp_c14)._m0[303].x;
    }
    float _512 = _506;
    bool _514 = _76 == 656;
    float _516 = _512;
    if (_454)
    {
        _510 = (*spvDescriptorSet0.vp_c14)._m0[303].z;
    }
    float _518 = _510;
    float _520 = _518;
    if (_464)
    {
        _516 = (*spvDescriptorSet0.vp_c14)._m0[304].x;
    }
    float _522 = _516;
    bool _524 = _76 == 672;
    float _526 = _522;
    if (_464)
    {
        _520 = (*spvDescriptorSet0.vp_c14)._m0[304].z;
    }
    float _528 = _520;
    float _530 = _528;
    if (_474)
    {
        _526 = (*spvDescriptorSet0.vp_c14)._m0[305].x;
    }
    float _532 = _526;
    bool _534 = _76 == 688;
    float _536 = _532;
    if (_474)
    {
        _530 = (*spvDescriptorSet0.vp_c14)._m0[305].z;
    }
    float _538 = _530;
    float _540 = _538;
    if (_484)
    {
        _536 = (*spvDescriptorSet0.vp_c14)._m0[306].x;
    }
    float _542 = _536;
    bool _544 = _76 == 704;
    float _546 = _542;
    if (_484)
    {
        _540 = (*spvDescriptorSet0.vp_c14)._m0[306].z;
    }
    float _548 = _540;
    float _550 = _548;
    if (_494)
    {
        _546 = (*spvDescriptorSet0.vp_c14)._m0[307].x;
    }
    float _552 = _546;
    bool _554 = _76 == 720;
    float _556 = _552;
    if (_494)
    {
        _550 = (*spvDescriptorSet0.vp_c14)._m0[307].z;
    }
    float _558 = _550;
    float _560 = _558;
    if (_500)
    {
        _556 = (*spvDescriptorSet0.vp_c14)._m0[308].x;
    }
    float _562 = _556;
    bool _564 = _76 == 736;
    float _566 = _562;
    if (_500)
    {
        _560 = (*spvDescriptorSet0.vp_c14)._m0[308].z;
    }
    float _568 = _560;
    bool _570 = _76 == 752;
    float _572 = _568;
    if (_514)
    {
        _566 = (*spvDescriptorSet0.vp_c14)._m0[309].x;
    }
    float _574 = _566;
    float _576 = _574;
    if (_524)
    {
        _576 = (*spvDescriptorSet0.vp_c14)._m0[310].x;
    }
    float _578 = _576;
    float _580 = _578;
    if (_534)
    {
        _580 = (*spvDescriptorSet0.vp_c14)._m0[311].x;
    }
    float _582 = _580;
    float _584 = _582;
    if (_544)
    {
        _584 = (*spvDescriptorSet0.vp_c14)._m0[312].x;
    }
    float _586 = _584;
    float _588 = _586;
    if (_554)
    {
        _588 = (*spvDescriptorSet0.vp_c14)._m0[313].x;
    }
    float _590 = _588;
    float _592 = _590;
    if (_564)
    {
        _592 = (*spvDescriptorSet0.vp_c14)._m0[314].x;
    }
    float _594 = _592;
    float _596 = _594;
    if (_570)
    {
        _596 = (*spvDescriptorSet0.vp_c14)._m0[315].x;
    }
    float _598 = _596;
    float _600 = _342 * _598;
    if (_514)
    {
        _572 = (*spvDescriptorSet0.vp_c14)._m0[309].z;
    }
    float _602 = _572;
    float _604 = _602;
    if (_524)
    {
        _604 = (*spvDescriptorSet0.vp_c14)._m0[310].z;
    }
    float _606 = _604;
    float _608 = _600 * _65;
    float _610 = _606;
    if (_534)
    {
        _610 = (*spvDescriptorSet0.vp_c14)._m0[311].z;
    }
    float _612 = _610;
    float _614 = _612;
    if (_544)
    {
        _614 = (*spvDescriptorSet0.vp_c14)._m0[312].z;
    }
    float _616 = _614;
    float _618 = floor(_608);
    float _620 = _616;
    if (_554)
    {
        _620 = (*spvDescriptorSet0.vp_c14)._m0[313].z;
    }
    float _622 = _620;
    float _624 = _622;
    if (_564)
    {
        _624 = (*spvDescriptorSet0.vp_c14)._m0[314].z;
    }
    float _626 = _624;
    float _628 = _626;
    if (_570)
    {
        _628 = (*spvDescriptorSet0.vp_c14)._m0[315].z;
    }
    float _630 = _628;
    float _632 = -_618;
    float _634 = _608 + _632;
    float _636 = _312 * _630;
    int _638 = _280 + 8;
    uint _641 = uint(int(uint(_638) >> uint(2)));
    uint _643 = uint(int(uint(int(_641)) >> uint(2)));
    int _645 = int(_641) & 3;
    float _647 = (*spvDescriptorSet0.vp_c14)._m0[int(_643)][_645];
    int _649 = int(_641) + 1;
    uint _651 = uint(int(uint(_649) >> uint(2)));
    int _653 = _649 & 3;
    float _655 = (*spvDescriptorSet0.vp_c14)._m0[int(_651)][_653];
    float _657 = _634 * 2.0;
    float _659 = -_634;
    float _661 = fma(_636, _659, _65);
    float _663 = floor(_657);
    float _665 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].w);
    float _667 = _636 * _663;
    float _669 = _667 * 0.5;
    float _671 = _669 + _661;
    float _673 = fma(_71, _671, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _675 = fma(_671, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _677 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _679 = _673 + _677;
    float _681 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _683 = _675 + _681;
    float _685 = _679 * _679;
    float _687 = fma(_683, _683, _685);
    float _689 = fma(_134, _134, _687);
    float _691 = sqrt(_689);
    float _693 = -_655;
    float _695 = fma(_691, _647, _693);
    float _697 = precise::clamp(_695, 0.0, 1.0);
    float _699 = -_669;
    float _701 = fma(_699, _697, _671);
    float _703 = fma(_701, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _705 = _701;
    float _707 = _655;
    float _709 = _636;
    float _711 = _671;
    float _713 = _689;
    if (!_104)
    {
        _705 = (*spvDescriptorSet0.vp_c15)._m0[6].x;
    }
    float _715 = _705;
    float _717 = fma(_703, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].z);
    float _719 = _715;
    if (!_104)
    {
        float _721 = fma(_665, _715, (*spvDescriptorSet0.vp_c15)._m0[6].w);
        _126 = _721;
    }
    float _723 = _126;
    float _725 = _723;
    if (!_104)
    {
        float _727 = fma(_717, _715, (*spvDescriptorSet0.vp_c15)._m0[6].z);
        _719 = _727;
    }
    float _729 = _719;
    float _731 = _729;
    if (!_104)
    {
        float _733 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _723);
        _725 = _733;
    }
    float _735 = _725;
    if (!_104)
    {
        float _737 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _729);
        _731 = _737;
    }
    float _739 = _731;
    if (!_104)
    {
        float2 _2432 = float2(_739, _735);
        float _741 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2432, float2(0.0), isnan(_2432)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2432, float2(0.0), isnan(_2432)), level(0.0)).x;
        _707 = _741;
    }
    float _743 = _707;
    if (_104)
    {
        _709 = (*spvDescriptorSet0.vp_c15)._m0[14].x;
    }
    float _745 = _709;
    if (_104)
    {
        _711 = (*spvDescriptorSet0.vp_c15)._m0[15].x;
    }
    float _747 = _711;
    if (_104)
    {
        float _749 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, _745, (*spvDescriptorSet0.vp_c15)._m0[14].w);
        _713 = _749;
    }
    float _751 = _713;
    float _753 = _751;
    if (_104)
    {
        float _755 = fma(_703, _745, (*spvDescriptorSet0.vp_c15)._m0[14].z);
        _138 = _755;
    }
    float _757 = _138;
    float _759 = _757;
    if (_104)
    {
        float _761 = fma(_751, _747, (*spvDescriptorSet0.vp_c15)._m0[15].w);
        _753 = _761;
    }
    float _763 = _753;
    float _765 = _763;
    if (_104)
    {
        float _767 = fma(_757, _747, (*spvDescriptorSet0.vp_c15)._m0[15].z);
        _759 = _767;
    }
    float _769 = _759;
    float _771 = _769;
    if (_104)
    {
        float _773 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _763);
        _765 = _773;
    }
    float _775 = _765;
    if (_104)
    {
        float _777 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _769);
        _771 = _777;
    }
    float _779 = _771;
    float _781 = _743;
    if (_104)
    {
        float2 _2524 = float2(_779, _775);
        float _783 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_2524, float2(0.0), isnan(_2524)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_2524, float2(0.0), isnan(_2524)), level(0.0)).x;
        _781 = _783;
    }
    float _785 = _781;
    float _787 = fma(_665, (*spvDescriptorSet0.vp_c15)._m0[8].x, (*spvDescriptorSet0.vp_c15)._m0[8].w);
    float _789 = fma(_717, (*spvDescriptorSet0.vp_c15)._m0[8].x, (*spvDescriptorSet0.vp_c15)._m0[8].z);
    float _791 = fma(_665, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].w);
    float _793 = fma(_717, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].z);
    int _795 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[40].w) & 2;
    bool _797 = _795 != 0;
    float _799 = fma(_785, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _801 = _799 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _803 = _799 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _805 = _799 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _807 = fma(_703, (*spvDescriptorSet0.vp_c4)._m0[1].x, _801);
    float _809 = fma(_703, (*spvDescriptorSet0.vp_c4)._m0[0].x, _803);
    float _811 = fma(_703, (*spvDescriptorSet0.vp_c4)._m0[2].x, _805);
    float _813 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, (*spvDescriptorSet0.vp_c4)._m0[1].z, _807);
    float _815 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, (*spvDescriptorSet0.vp_c4)._m0[0].z, _809);
    float _817 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, (*spvDescriptorSet0.vp_c4)._m0[2].z, _811);
    float _819 = _813 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _821 = _815 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _823 = _817 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _825 = _819 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _827 = _819 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _829 = _819 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _831 = _819 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _833 = fma(_821, (*spvDescriptorSet0.vp_c4)._m0[8].x, _825);
    float _835 = fma(_821, (*spvDescriptorSet0.vp_c4)._m0[7].x, _827);
    float _837 = fma(_821, (*spvDescriptorSet0.vp_c4)._m0[9].x, _829);
    float _839 = fma(_821, (*spvDescriptorSet0.vp_c4)._m0[10].x, _831);
    float _841 = fma(_823, (*spvDescriptorSet0.vp_c4)._m0[8].z, _833);
    float _843 = fma(_823, (*spvDescriptorSet0.vp_c4)._m0[7].z, _835);
    float _845 = fma(_823, (*spvDescriptorSet0.vp_c4)._m0[9].z, _837);
    float _847 = fma(_823, (*spvDescriptorSet0.vp_c4)._m0[10].z, _839);
    float _849 = _841 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _851 = _843 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _853 = _845 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _855 = _847 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    bool _857 = !_797;
    float _859;
    float _861;
    float _863;
    int _865;
    int _867;
    int _869;
    int _871;
    int _873;
    int _875;
    int _877;
    int _879;
    float _881;
    float _883;
    float _885;
    float _887;
    float _889;
    float _891;
    float _893;
    float _895;
    float _897;
    float _899;
    float _901;
    float _903;
    float _905;
    float _907;
    float _909;
    float _911;
    float _913;
    int _915;
    float _917;
    float _919;
    float _921;
    if (!_857)
    {
        _859 = (*spvDescriptorSet0.vp_c9)._m0[919].x;
        _861 = (*spvDescriptorSet0.vp_c9)._m0[919].y;
        _863 = (*spvDescriptorSet0.vp_c9)._m0[919].z;
        _865 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[919].w);
        _867 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].x);
        _869 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].y);
        _871 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].z);
        _873 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].w);
        _875 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].x);
        _877 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].y);
        _879 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].w);
        _881 = (*spvDescriptorSet0.vp_c9)._m0[923].y;
        _883 = (*spvDescriptorSet0.vp_c9)._m0[922].y;
        _885 = (*spvDescriptorSet0.vp_c9)._m0[917].x;
        _887 = (*spvDescriptorSet0.vp_c9)._m0[916].w;
        _889 = (*spvDescriptorSet0.vp_c9)._m0[923].x;
        _891 = (*spvDescriptorSet0.vp_c9)._m0[922].x;
        _893 = (*spvDescriptorSet0.vp_c9)._m0[917].y;
        _895 = (*spvDescriptorSet0.vp_c9)._m0[916].y;
        _897 = (*spvDescriptorSet0.vp_c9)._m0[923].z;
        _899 = (*spvDescriptorSet0.vp_c9)._m0[922].z;
        _901 = (*spvDescriptorSet0.vp_c9)._m0[916].x;
        _903 = (*spvDescriptorSet0.vp_c9)._m0[916].z;
        _905 = (*spvDescriptorSet0.vp_c9)._m0[923].w;
        _907 = (*spvDescriptorSet0.vp_c9)._m0[922].w;
        _909 = (*spvDescriptorSet0.vp_c9)._m0[917].w;
        _911 = (*spvDescriptorSet0.vp_c9)._m0[917].z;
        _913 = (*spvDescriptorSet0.vp_c9)._m0[918].x;
        _915 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].z);
        _917 = (*spvDescriptorSet0.vp_c9)._m0[918].z;
        _919 = (*spvDescriptorSet0.vp_c9)._m0[918].y;
        _921 = (*spvDescriptorSet0.vp_c9)._m0[918].w;
        _923 = true;
    }
    else
    {
        float _925 = fma(_703, 6.2500002968590706586837768554688e-05, 0.5);
        float _927 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, 6.2500002968590706586837768554688e-05, 0.5);
        float3 _2800 = float3(_925, _927, float(0));
        float3 _2804 = select(_2800, float3(0.0), isnan(_2800));
        float4 _930 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2804.xy, uint(rint(_2804.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2804.xy, uint(rint(_2804.z)), level(0.0)).xyzw;
        float _932 = _930.x;
        float _934 = _930.y;
        float _936 = _930.z;
        float _938 = _930.w;
        float3 _2819 = float3(_925, _927, float(1));
        float3 _2821 = select(_2819, float3(0.0), isnan(_2819));
        float4 _940 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2821.xy, uint(rint(_2821.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2821.xy, uint(rint(_2821.z)), level(0.0)).xyzw;
        float _942 = _940.x;
        float _944 = _940.y;
        float _946 = _940.z;
        float _948 = _940.w;
        float3 _2836 = float3(_925, _927, float(2));
        float3 _2838 = select(_2836, float3(0.0), isnan(_2836));
        float4 _950 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2838.xy, uint(rint(_2838.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2838.xy, uint(rint(_2838.z)), level(0.0)).xyzw;
        float _952 = _950.x;
        float _954 = _950.y;
        float _956 = _950.z;
        float _958 = _950.w;
        float3 _2853 = float3(_925, _927, float(3));
        float3 _2855 = select(_2853, float3(0.0), isnan(_2853));
        float4 _960 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2855.xy, uint(rint(_2855.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2855.xy, uint(rint(_2855.z)), level(0.0)).xyzw;
        float _962 = _960.x;
        float _964 = _960.y;
        float _966 = _960.z;
        float _968 = _960.w;
        float3 _2870 = float3(_925, _927, float(4));
        float3 _2872 = select(_2870, float3(0.0), isnan(_2870));
        float4 _970 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2872.xy, uint(rint(_2872.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2872.xy, uint(rint(_2872.z)), level(0.0)).xyzw;
        float _972 = _970.x;
        float _974 = _970.y;
        float _976 = _970.z;
        float _978 = _970.w;
        float3 _2887 = float3(_925, _927, float(5));
        float3 _2889 = select(_2887, float3(0.0), isnan(_2887));
        float4 _980 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2889.xy, uint(rint(_2889.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2889.xy, uint(rint(_2889.z)), level(0.0)).xyzw;
        float _982 = _980.x;
        float _984 = _980.y;
        float _986 = _980.z;
        float _988 = _980.w;
        float3 _2904 = float3(_925, _927, float(6));
        float3 _2906 = select(_2904, float3(0.0), isnan(_2904));
        float4 _990 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2906.xy, uint(rint(_2906.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2906.xy, uint(rint(_2906.z)), level(0.0)).xyzw;
        float _992 = _990.x;
        float _994 = _990.y;
        float _996 = _990.z;
        float _998 = _990.w;
        float3 _2921 = float3(_925, _927, float(7));
        float3 _2923 = select(_2921, float3(0.0), isnan(_2921));
        float4 _1000 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, _2923.xy, uint(rint(_2923.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, _2923.xy, uint(rint(_2923.z)), level(0.0)).xyzw;
        float _1002 = _1000.x;
        float _1004 = _1000.y;
        float _1006 = _1000.z;
        float _1008 = _1000.w;
        _859 = _962;
        _861 = _964;
        _863 = _966;
        _865 = as_type<int>(_968);
        _867 = as_type<int>(_972);
        _869 = as_type<int>(_974);
        _871 = as_type<int>(_976);
        _873 = as_type<int>(_978);
        _875 = as_type<int>(_982);
        _877 = as_type<int>(_984);
        _879 = as_type<int>(_988);
        _881 = _1004;
        _883 = _994;
        _885 = _942;
        _887 = _938;
        _889 = _1002;
        _891 = _992;
        _893 = _944;
        _895 = _934;
        _897 = _1006;
        _899 = _996;
        _901 = _932;
        _903 = _936;
        _905 = _1008;
        _907 = _998;
        _909 = _948;
        _911 = _946;
        _913 = _952;
        _915 = as_type<int>(_986);
        _917 = _956;
        _919 = _954;
        _921 = _958;
    }
    _923 = false;
    float _1010 = _859;
    float _1012 = _861;
    float _1014 = _863;
    int _1016 = _865;
    int _1018 = _867;
    int _1020 = _869;
    int _1022 = _871;
    int _1024 = _873;
    int _1026 = _875;
    int _1028 = _877;
    int _1030 = _879;
    float _1032 = _881;
    float _1034 = _883;
    float _1036 = _885;
    float _1038 = _887;
    float _1040 = _889;
    float _1042 = _891;
    float _1044 = _893;
    float _1046 = _895;
    float _1048 = _897;
    float _1050 = _899;
    float _1052 = _901;
    float _1054 = _903;
    float _1056 = _905;
    float _1058 = _907;
    float _1060 = _909;
    float _1062 = _911;
    float _1064 = _913;
    int _1066 = _915;
    float _1068 = _917;
    float _1070 = _919;
    float _1072 = _921;
    float _1074 = -(*spvDescriptorSet0.vp_c4)._m0[12].w;
    float _1076 = _799 + _1074;
    float _1078 = -(*spvDescriptorSet0.vp_c4)._m0[11].w;
    float _1080 = _703 + _1078;
    float _1082 = -(*spvDescriptorSet0.vp_c4)._m0[13].w;
    float _1084 = (*spvDescriptorSet0.vp_c15)._m0[0].w + _1082;
    out.gl_Position.x = _851;
    out.gl_Position.y = _849;
    out.gl_Position.z = _853;
    out.gl_Position.w = _855;
    float _1086 = _1076 * _1076;
    float _1088 = _1010 * 0.88622701168060302734375;
    float _1090 = _1012 * 0.88622701168060302734375;
    float _1092 = _1014 * 0.88622701168060302734375;
    float _1094 = fma(_1080, _1080, _1086);
    float _1096 = _797 ? as_type<float>(_1016) : 0.0;
    out.m_45.x = _703;
    out.m_45.y = _799;
    out.m_45.z = (*spvDescriptorSet0.vp_c15)._m0[0].w;
    float _1098 = _797 ? as_type<float>(_1018) : 0.0;
    float _1100 = fma(_1084, _1084, _1094);
    float _1102 = _797 ? as_type<float>(_1020) : 0.0;
    out.m_47.z = _793;
    out.m_47.w = _791;
    float _1104 = _797 ? _1088 : 0.0;
    float _1106 = _797 ? _1090 : 0.0;
    float _1108 = rsqrt(_1100);
    float _1110 = _797 ? _1092 : 0.0;
    out.m_49.x = _789;
    float _1112 = _797 ? as_type<float>(_1022) : 0.0;
    float _1114 = _797 ? as_type<float>(_1024) : 0.0;
    out.m_49.y = _787;
    float _1116 = _797 ? as_type<float>(_1026) : 0.0;
    float _1118 = _797 ? as_type<float>(_1028) : 0.0;
    float _1120 = _797 ? as_type<float>(_1030) : 0.0;
    float _1122 = _1108 * 1.02332699298858642578125;
    float _1124 = _1084 * _1108;
    float _1126 = _1076 * _1122;
    float _1128 = _1124 * (-1.02332699298858642578125);
    float _1130 = _1080 * _1122;
    float _1132 = _1126 * _1032;
    float _1134 = _1126 * _1034;
    float _1136 = _1126 * _1036;
    float _1138 = _1126 * _1038;
    float _1140 = fma(_1040, 0.88622701168060302734375, _1132);
    float _1142 = fma(_1042, 0.88622701168060302734375, _1134);
    float _1144 = _1126 * _1044;
    float _1146 = fma(_1046, 0.88622701168060302734375, _1136);
    float _1148 = fma(_1128, _1048, _1140);
    float _1150 = fma(_1128, _1050, _1142);
    float _1152 = fma(_1052, 0.88622701168060302734375, _1138);
    float _1154 = fma(_1054, 0.88622701168060302734375, _1144);
    float _1156 = fma(_1130, _1056, _1148);
    float _1158 = fma(_1130, _1058, _1150);
    float _1160 = fma(_1096, _1126, _1104);
    float _1162 = fma(_1098, _1126, _1106);
    float _1164 = fma(_1102, _1126, _1110);
    float _1166 = precise::max(0.0, _1156);
    float _1168 = fma(_1128, _1060, _1146);
    float _1170 = precise::max(0.0, _1158);
    float _1172 = fma(_1128, _1062, _1152);
    float _1174 = fma(_1128, _1064, _1154);
    float _1176 = _1166 * 0.31830990314483642578125;
    float _1178 = precise::clamp(_1176, 0.0, 1.0);
    float _1180 = fma(_1112, _1128, _1160);
    float _1182 = fma(_1114, _1128, _1162);
    float _1184 = fma(_1116, _1128, _1164);
    float _1186 = _1170 * 0.31830990314483642578125;
    float _1188 = precise::clamp(_1186, 0.0, 1.0);
    float _1190 = _797 ? as_type<float>(_1066) : 0.0;
    float _1192 = fma(_1130, _1068, _1168);
    float _1194 = fma(_1130, _1070, _1172);
    float _1196 = -_1178;
    float _1198 = _1196 + 1.0;
    float _1200 = fma(_1130, _1072, _1174);
    float _1202 = _1188 * 0.88622701168060302734375;
    float _1204 = fma(_1190, _1130, _1182);
    float _1206 = fma(_1118, _1130, _1180);
    float _1208 = fma(_1120, _1130, _1184);
    float _1210 = fma(_1198, (*spvDescriptorSet0.vp_c9)._m0[37].y, _1178);
    float _1212 = precise::max(0.0, _1192);
    float _1214 = _1202 * (*spvDescriptorSet0.vp_c9)._m0[991].y;
    float _1216 = precise::max(0.0, _1194);
    float _1218 = _1202 * (*spvDescriptorSet0.vp_c9)._m0[991].x;
    float _1220 = precise::max(0.0, _1200);
    float _1222 = _1202 * (*spvDescriptorSet0.vp_c9)._m0[991].z;
    float _1224 = precise::max(0.0, _1204);
    float _1226 = _1210 * (*spvDescriptorSet0.vp_c9)._m0[40].z;
    float _1228 = precise::max(0.0, _1206);
    float _1230 = fma(_1212, (*spvDescriptorSet0.vp_c9)._m0[68].y, _1214);
    float _1232 = precise::max(0.0, _1208);
    float _1234 = fma(_1216, (*spvDescriptorSet0.vp_c9)._m0[68].x, _1218);
    float _1236 = fma(_1220, (*spvDescriptorSet0.vp_c9)._m0[68].z, _1222);
    float _1238 = fma(_1224, _1226, _1230);
    float _1240 = fma(_1228, _1226, _1234);
    float _1242 = fma(_1232, _1226, _1236);
    out.m_49.w = (*spvDescriptorSet0.vp_c15)._m0[7].y;
    out.m_51.x = _1240;
    out.m_51.y = _1238;
    out.m_51.z = _1242;
    out.m_51.w = _823;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

