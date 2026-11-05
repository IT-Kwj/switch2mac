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
    float4 m_47 [[user(locn0)]];
    float4 m_45 [[user(locn1)]];
    float4 m_51 [[user(locn2)]];
    float4 m_43 [[user(locn3)]];
    float4 m_49 [[user(locn4)]];
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
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1039 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _65 = in.m_40.x;
    float _67 = in.m_40.y;
    float _69 = -(*spvDescriptorSet0.vp_c15)._m0[3].x;
    float _71 = _69 + (*spvDescriptorSet0.vp_c15)._m0[3].y;
    int _74 = 16 + as_type<int>(as_type<float>(gl_BaseInstance));
    float _76 = -(*spvDescriptorSet0.vp_c15)._m0[3].z;
    float _78 = _76 + (*spvDescriptorSet0.vp_c15)._m0[3].w;
    int _80 = _74 << 4;
    bool _84 = _80 == 0;
    bool _86 = _80 == 16;
    bool _88 = _80 == 32;
    bool _90 = _80 == 48;
    bool _92 = _80 == 64;
    float _94 = fma(_71, _65, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _96 = fma(_78, _65, (*spvDescriptorSet0.vp_c15)._m0[3].z);
    bool _98 = _80 == 80;
    float _100 = as_type<float>(gl_BaseInstance);
    if (_84)
    {
        _100 = (*spvDescriptorSet0.vp_c14)._m0[268].x;
    }
    float _102 = _100;
    float _104 = -_94;
    float _106 = _104 + _96;
    bool _108 = _80 == 96;
    float _110 = fma(_106, _67, _94);
    float _112 = fma(_65, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _114 = 0.0;
    float _116 = _102;
    if (_84)
    {
        _114 = (*spvDescriptorSet0.vp_c14)._m0[268].z;
    }
    float _118 = _114;
    float _120 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _122 = _110 + _120;
    float _124 = _118;
    if (_86)
    {
        _116 = (*spvDescriptorSet0.vp_c14)._m0[269].x;
    }
    float _126 = _116;
    float _128 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _130 = _112 + _128;
    float _132 = fma(_67, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _134 = _122 * _122;
    bool _136 = _80 == 112;
    float _138 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _140 = _132 + _138;
    float _142 = fma(_130, _130, _134);
    float _144 = _126;
    if (_86)
    {
        _124 = (*spvDescriptorSet0.vp_c14)._m0[269].z;
    }
    float _146 = _124;
    float _148 = _146;
    if (_88)
    {
        _144 = (*spvDescriptorSet0.vp_c14)._m0[270].x;
    }
    float _150 = _144;
    float _152 = fma(_140, _140, _142);
    bool _154 = _80 == 128;
    float _156 = _150;
    if (_88)
    {
        _148 = (*spvDescriptorSet0.vp_c14)._m0[270].z;
    }
    float _158 = _148;
    float _160 = rsqrt(_152);
    float _162 = _158;
    if (_90)
    {
        _156 = (*spvDescriptorSet0.vp_c14)._m0[271].x;
    }
    float _164 = _156;
    bool _166 = _80 == 144;
    float _168 = _164;
    if (_90)
    {
        _162 = (*spvDescriptorSet0.vp_c14)._m0[271].z;
    }
    float _170 = _162;
    float _172 = _170;
    if (_92)
    {
        _168 = (*spvDescriptorSet0.vp_c14)._m0[272].x;
    }
    float _174 = _168;
    bool _176 = _80 == 160;
    float _178 = _174;
    if (_92)
    {
        _172 = (*spvDescriptorSet0.vp_c14)._m0[272].z;
    }
    float _180 = _172;
    float _182 = _180;
    if (_98)
    {
        _178 = (*spvDescriptorSet0.vp_c14)._m0[273].x;
    }
    float _184 = _178;
    bool _186 = _80 == 176;
    float _188 = _160 * (*spvDescriptorSet0.vp_c14)._m0[268].x;
    float _190 = _184;
    if (_98)
    {
        _182 = (*spvDescriptorSet0.vp_c14)._m0[273].z;
    }
    float _192 = _182;
    bool _194 = _80 == 192;
    float _196 = _192;
    if (_108)
    {
        _190 = (*spvDescriptorSet0.vp_c14)._m0[274].x;
    }
    float _198 = _190;
    float _200 = log2(_188);
    float _202 = _198;
    if (_108)
    {
        _196 = (*spvDescriptorSet0.vp_c14)._m0[274].z;
    }
    float _204 = _196;
    float _206 = _204;
    if (_136)
    {
        _202 = (*spvDescriptorSet0.vp_c14)._m0[275].x;
    }
    float _208 = _202;
    bool _210 = _80 == 208;
    float _212 = _208;
    if (_136)
    {
        _206 = (*spvDescriptorSet0.vp_c14)._m0[275].z;
    }
    float _214 = _206;
    float _216 = _214;
    if (_154)
    {
        _212 = (*spvDescriptorSet0.vp_c14)._m0[276].x;
    }
    float _218 = _212;
    bool _220 = _80 == 224;
    float _222 = _218;
    if (_154)
    {
        _216 = (*spvDescriptorSet0.vp_c14)._m0[276].z;
    }
    float _224 = _216;
    float _226 = _224;
    if (_166)
    {
        _222 = (*spvDescriptorSet0.vp_c14)._m0[277].x;
    }
    float _228 = _222;
    float _230 = _200 + 1.2999999523162841796875;
    bool _232 = _80 == 240;
    float _234 = _228;
    if (_166)
    {
        _226 = (*spvDescriptorSet0.vp_c14)._m0[277].z;
    }
    float _236 = _226;
    float _238 = _236;
    if (_176)
    {
        _234 = (*spvDescriptorSet0.vp_c14)._m0[278].x;
    }
    float _240 = _234;
    float _242 = trunc(_230);
    int _244 = int(_242);
    bool _246 = _80 == 256;
    float _248 = _240;
    if (_176)
    {
        _238 = (*spvDescriptorSet0.vp_c14)._m0[278].z;
    }
    float _250 = _238;
    float _252 = _250;
    if (_186)
    {
        _248 = (*spvDescriptorSet0.vp_c14)._m0[279].x;
    }
    float _254 = _248;
    bool _256 = _80 == 272;
    float _258 = _254;
    if (_186)
    {
        _252 = (*spvDescriptorSet0.vp_c14)._m0[279].z;
    }
    float _260 = _252;
    float _262 = _260;
    if (_194)
    {
        _258 = (*spvDescriptorSet0.vp_c14)._m0[280].x;
    }
    float _264 = _258;
    bool _266 = _80 == 288;
    float _268 = _264;
    if (_194)
    {
        _262 = (*spvDescriptorSet0.vp_c14)._m0[280].z;
    }
    float _270 = _262;
    int _272 = min(_244, 15);
    bool _274 = _80 == 304;
    float _276 = _270;
    if (_210)
    {
        _268 = (*spvDescriptorSet0.vp_c14)._m0[281].x;
    }
    float _278 = _268;
    float _280 = float(_272);
    float _282 = _278;
    if (_210)
    {
        _276 = (*spvDescriptorSet0.vp_c14)._m0[281].z;
    }
    float _284 = _276;
    int _286 = _272 << 4;
    int _288 = _286 + 4288;
    float _290 = _284;
    if (_220)
    {
        _282 = (*spvDescriptorSet0.vp_c14)._m0[282].x;
    }
    float _292 = _282;
    bool _294 = _80 == 320;
    float _296 = -_280;
    float _298 = _296 + (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _300 = _292;
    if (_220)
    {
        _290 = (*spvDescriptorSet0.vp_c14)._m0[282].z;
    }
    float _302 = _290;
    float _304 = _302;
    if (_232)
    {
        _300 = (*spvDescriptorSet0.vp_c14)._m0[283].x;
    }
    float _306 = _300;
    float _308 = _298 + 1.0;
    bool _310 = _80 == 336;
    float _312 = _306;
    if (_232)
    {
        _304 = (*spvDescriptorSet0.vp_c14)._m0[283].z;
    }
    float _314 = _304;
    float _316 = _314;
    if (_246)
    {
        _312 = (*spvDescriptorSet0.vp_c14)._m0[284].x;
    }
    float _318 = _312;
    float _320 = exp2(_308);
    bool _322 = _80 == 352;
    float _324 = _318;
    if (_246)
    {
        _316 = (*spvDescriptorSet0.vp_c14)._m0[284].z;
    }
    float _326 = _316;
    float _328 = _326;
    if (_256)
    {
        _324 = (*spvDescriptorSet0.vp_c14)._m0[285].x;
    }
    float _330 = _324;
    bool _332 = _80 == 368;
    float _334 = _330;
    if (_256)
    {
        _328 = (*spvDescriptorSet0.vp_c14)._m0[285].z;
    }
    float _336 = _328;
    float _338 = _336;
    if (_266)
    {
        _334 = (*spvDescriptorSet0.vp_c14)._m0[286].x;
    }
    float _340 = _334;
    bool _342 = _80 == 384;
    float _344 = _340;
    if (_266)
    {
        _338 = (*spvDescriptorSet0.vp_c14)._m0[286].z;
    }
    float _346 = _338;
    float _348 = 1.0 / _320;
    float _350 = _346;
    if (_274)
    {
        _344 = (*spvDescriptorSet0.vp_c14)._m0[287].x;
    }
    float _352 = _344;
    bool _354 = _80 == 400;
    float _356 = _352;
    if (_274)
    {
        _350 = (*spvDescriptorSet0.vp_c14)._m0[287].z;
    }
    float _358 = _350;
    bool _360 = _80 == 416;
    float _362 = _358;
    if (_294)
    {
        _356 = (*spvDescriptorSet0.vp_c14)._m0[288].x;
    }
    float _364 = _356;
    float _366 = _364;
    if (_294)
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
    bool _374 = _80 == 432;
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
    bool _384 = _80 == 448;
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
    bool _394 = _80 == 464;
    float _396 = _392;
    if (_332)
    {
        _390 = (*spvDescriptorSet0.vp_c14)._m0[291].z;
    }
    float _398 = _390;
    float _400 = _398;
    if (_342)
    {
        _396 = (*spvDescriptorSet0.vp_c14)._m0[292].x;
    }
    float _402 = _396;
    bool _404 = _80 == 480;
    float _406 = _402;
    if (_342)
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
    bool _414 = _80 == 496;
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
    bool _424 = _80 == 512;
    float _426 = _422;
    if (_360)
    {
        _420 = (*spvDescriptorSet0.vp_c14)._m0[294].z;
    }
    float _428 = _420;
    bool _430 = _80 == 528;
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
    bool _444 = _80 == 544;
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
    bool _454 = _80 == 560;
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
    bool _464 = _80 == 576;
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
    bool _474 = _80 == 592;
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
    bool _484 = _80 == 608;
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
    bool _494 = _80 == 624;
    float _496 = _492;
    if (_430)
    {
        _490 = (*spvDescriptorSet0.vp_c14)._m0[301].z;
    }
    float _498 = _490;
    bool _500 = _80 == 640;
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
    bool _514 = _80 == 656;
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
    bool _524 = _80 == 672;
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
    bool _534 = _80 == 688;
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
    bool _544 = _80 == 704;
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
    bool _554 = _80 == 720;
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
    bool _564 = _80 == 736;
    float _566 = _562;
    if (_500)
    {
        _560 = (*spvDescriptorSet0.vp_c14)._m0[308].z;
    }
    float _568 = _560;
    bool _570 = _80 == 752;
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
    float _600 = _348 * _598;
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
    float _610 = _600 * _67;
    float _612 = _606;
    if (_534)
    {
        _612 = (*spvDescriptorSet0.vp_c14)._m0[311].z;
    }
    float _614 = _612;
    float _616 = floor(_608);
    float _618 = _614;
    if (_544)
    {
        _618 = (*spvDescriptorSet0.vp_c14)._m0[312].z;
    }
    float _620 = _618;
    float _622 = _620;
    if (_554)
    {
        _622 = (*spvDescriptorSet0.vp_c14)._m0[313].z;
    }
    float _624 = _622;
    float _626 = _624;
    if (_564)
    {
        _626 = (*spvDescriptorSet0.vp_c14)._m0[314].z;
    }
    float _628 = _626;
    float _630 = _628;
    if (_570)
    {
        _630 = (*spvDescriptorSet0.vp_c14)._m0[315].z;
    }
    float _632 = _630;
    float _634 = floor(_610);
    float _636 = _320 * _632;
    float _638 = -_616;
    float _640 = _608 + _638;
    float _642 = _640 * 2.0;
    float _644 = -_640;
    float _646 = fma(_636, _644, _65);
    int _648 = _288 + 8;
    uint _651 = uint(int(uint(_648) >> uint(2)));
    uint _653 = uint(int(uint(int(_651)) >> uint(2)));
    int _655 = int(_651) & 3;
    float _657 = (*spvDescriptorSet0.vp_c14)._m0[int(_653)][_655];
    int _659 = int(_651) + 1;
    uint _661 = uint(int(uint(_659) >> uint(2)));
    int _663 = _659 & 3;
    float _665 = (*spvDescriptorSet0.vp_c14)._m0[int(_661)][_663];
    float _667 = -_634;
    float _669 = _610 + _667;
    float _671 = floor(_642);
    float _673 = _669 * 2.0;
    float _675 = -_669;
    float _677 = fma(_636, _675, _67);
    float _679 = floor(_673);
    float _681 = _636 * _671;
    float _683 = _681 * 0.5;
    float _685 = _683 + _646;
    float _687 = fma(_71, _685, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _689 = _636 * _679;
    float _691 = _689 * 0.5;
    float _693 = fma(_78, _685, (*spvDescriptorSet0.vp_c15)._m0[3].z);
    float _695 = fma(_685, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _697 = _691 + _677;
    float _699 = -_687;
    float _701 = _699 + _693;
    float _703 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _705 = _695 + _703;
    float _707 = fma(_697, _701, _687);
    float _709 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _711 = _707 + _709;
    float _713 = fma(_697, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _715 = _711 * _711;
    float _717 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _719 = _713 + _717;
    float _721 = fma(_705, _705, _715);
    float _723 = fma(_719, _719, _721);
    float _725 = sqrt(_723);
    float _727 = -_665;
    float _729 = fma(_725, _657, _727);
    float _731 = precise::clamp(_729, 0.0, 1.0);
    float _733 = -_691;
    float _735 = fma(_733, _731, _697);
    float _737 = -_683;
    float _739 = fma(_737, _731, _685);
    float _741 = fma(_735, (*spvDescriptorSet0.vp_c15)._m0[6].x, (*spvDescriptorSet0.vp_c15)._m0[6].w);
    float _743 = fma(_739, (*spvDescriptorSet0.vp_c15)._m0[6].x, (*spvDescriptorSet0.vp_c15)._m0[6].z);
    float _745 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _741);
    float _747 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _743);
    float2 _2568 = float2(_747, _745);
    float _749 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2568, float2(0.0), isnan(_2568)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2568, float2(0.0), isnan(_2568)), level(0.0)).x;
    float _751 = fma(_735, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _753 = fma(_739, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _755 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _757 = _751 + _755;
    float _759 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _761 = _753 + _759;
    float _763 = _757 * _757;
    float _765 = fma(_761, _761, _763);
    float _767 = sqrt(_765);
    bool _769 = _767 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _771 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _773 = _767 + _771;
    float _775 = (*spvDescriptorSet0.vp_c15)._m0[4].x;
    float _777 = _767;
    float _779 = _669;
    float _781 = _765;
    float _783 = _735;
    if (_769)
    {
        float _785 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        _775 = _785;
    }
    float _787 = _775;
    float _789 = _787;
    float _791 = (*spvDescriptorSet0.vp_c14)._m0[0].y;
    if (_769)
    {
        float _793 = _773 * _787;
        _777 = _793;
    }
    float _795 = _777;
    float _797 = fma(_739, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].z);
    if (_769)
    {
        float _799 = rsqrt(_765);
        _789 = _799;
    }
    float _801 = _789;
    float _803 = fma(_735, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].w);
    float _805 = _801;
    if (_769)
    {
        float _807 = _795 * 0.15915493667125701904296875;
        _779 = _807;
    }
    float _809 = _779;
    float _811 = _795;
    if (_769)
    {
        float _813 = _809 * 6.283185482025146484375;
        float _815 = sin(_813);
        _811 = _815;
    }
    float _817 = _811;
    if (!_769)
    {
        _781 = _753;
    }
    float _819 = _781;
    float _821 = _657;
    float _823 = _819;
    if (_769)
    {
        float _825 = _809 * 6.283185482025146484375;
        float _827 = cos(_825);
        _821 = _827;
    }
    float _829 = _821;
    float _831 = fma(_749, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    if (_769)
    {
        float _833 = _831 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        _791 = _833;
    }
    float _835 = _791;
    float _837 = _831 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _839 = _835;
    if (_769)
    {
        float _841 = fma(_817, _835, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        _839 = _841;
    }
    float _843 = _839;
    float _845 = fma(_739, (*spvDescriptorSet0.vp_c15)._m0[8].x, (*spvDescriptorSet0.vp_c15)._m0[8].z);
    float _847 = fma(_735, (*spvDescriptorSet0.vp_c15)._m0[8].x, (*spvDescriptorSet0.vp_c15)._m0[8].w);
    float _849 = fma(_753, (*spvDescriptorSet0.vp_c4)._m0[2].x, _837);
    float _851 = 0.0;
    float _853 = _843;
    if (_769)
    {
        float _855 = _801 * _843;
        _851 = _855;
    }
    float _857 = _851;
    if (_769)
    {
        float _859 = _829 + (-1.0);
        _853 = _859;
    }
    float _861 = _853;
    float _863 = _861;
    if (!_769)
    {
        _805 = _831;
    }
    float _865 = _805;
    float _867 = fma(_751, (*spvDescriptorSet0.vp_c4)._m0[2].z, _849);
    float _869 = _865;
    if (_769)
    {
        float _871 = fma(_761, _857, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        _823 = _871;
    }
    float _873 = _823;
    float _875 = 0.0;
    if (_769)
    {
        float _877 = _861 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        _875 = _877;
    }
    float _879 = _875;
    if (!_769)
    {
        _863 = _751;
    }
    float _881 = _863;
    float _883 = _881;
    if (_769)
    {
        float _885 = fma(_757, _857, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        _883 = _885;
    }
    float _887 = _883;
    float _889 = _867 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    if (_769)
    {
        float _891 = fma(_831, _829, _879);
        _869 = _891;
    }
    float _893 = _869;
    float _895 = _893 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    if (_769)
    {
        float _897 = _893 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        _783 = _897;
    }
    float _899 = _783;
    float _901 = _893 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _903 = fma(_873, (*spvDescriptorSet0.vp_c4)._m0[1].x, _895);
    float _905 = _899;
    float _907 = _901;
    if (_769)
    {
        float _909 = fma(_873, (*spvDescriptorSet0.vp_c4)._m0[2].x, _899);
        _905 = _909;
    }
    float _911 = _905;
    float _913 = fma(_873, (*spvDescriptorSet0.vp_c4)._m0[0].x, _901);
    float _915 = fma(_887, (*spvDescriptorSet0.vp_c4)._m0[1].z, _903);
    float _917 = _911;
    if (_769)
    {
        float _919 = fma(_887, (*spvDescriptorSet0.vp_c4)._m0[2].z, _911);
        _917 = _919;
    }
    float _921 = _917;
    float _923 = fma(_887, (*spvDescriptorSet0.vp_c4)._m0[0].z, _913);
    int _925 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[40].w) & 2;
    bool _927 = _925 != 0;
    float _929 = _915 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    if (!_769)
    {
        _907 = _889;
    }
    float _931 = _907;
    float _933 = _923 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _935 = _931;
    if (_769)
    {
        float _937 = _921 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _935 = _937;
    }
    float _939 = _935;
    float _941 = _929 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _943 = _929 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _945 = _929 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _947 = _929 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _949 = fma(_933, (*spvDescriptorSet0.vp_c4)._m0[8].x, _941);
    float _951 = fma(_933, (*spvDescriptorSet0.vp_c4)._m0[7].x, _943);
    float _953 = fma(_933, (*spvDescriptorSet0.vp_c4)._m0[9].x, _945);
    float _955 = fma(_933, (*spvDescriptorSet0.vp_c4)._m0[10].x, _947);
    float _957 = fma(_939, (*spvDescriptorSet0.vp_c4)._m0[8].z, _949);
    float _959 = fma(_939, (*spvDescriptorSet0.vp_c4)._m0[7].z, _951);
    float _961 = fma(_939, (*spvDescriptorSet0.vp_c4)._m0[9].z, _953);
    float _963 = fma(_939, (*spvDescriptorSet0.vp_c4)._m0[10].z, _955);
    float _965 = _957 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _967 = _959 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _969 = _961 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _971 = _963 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    bool _973 = !_927;
    float _975;
    float _977;
    float _979;
    int _981;
    int _983;
    int _985;
    int _987;
    int _989;
    int _991;
    int _993;
    int _995;
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
    float _1025;
    float _1027;
    float _1029;
    float _1031;
    int _1033;
    float _1035;
    float _1037;
    if (!_973)
    {
        _975 = (*spvDescriptorSet0.vp_c9)._m0[919].x;
        _977 = (*spvDescriptorSet0.vp_c9)._m0[919].y;
        _979 = (*spvDescriptorSet0.vp_c9)._m0[919].z;
        _981 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[919].w);
        _983 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].x);
        _985 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].y);
        _987 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].z);
        _989 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].w);
        _991 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].x);
        _993 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].y);
        _995 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].w);
        _997 = (*spvDescriptorSet0.vp_c9)._m0[922].y;
        _999 = (*spvDescriptorSet0.vp_c9)._m0[923].y;
        _1001 = (*spvDescriptorSet0.vp_c9)._m0[916].w;
        _1003 = (*spvDescriptorSet0.vp_c9)._m0[917].x;
        _1005 = (*spvDescriptorSet0.vp_c9)._m0[922].x;
        _1007 = (*spvDescriptorSet0.vp_c9)._m0[923].x;
        _1009 = (*spvDescriptorSet0.vp_c9)._m0[916].x;
        _1011 = (*spvDescriptorSet0.vp_c9)._m0[917].y;
        _1013 = (*spvDescriptorSet0.vp_c9)._m0[922].z;
        _1015 = (*spvDescriptorSet0.vp_c9)._m0[923].z;
        _1017 = (*spvDescriptorSet0.vp_c9)._m0[916].y;
        _1019 = (*spvDescriptorSet0.vp_c9)._m0[922].w;
        _1021 = (*spvDescriptorSet0.vp_c9)._m0[923].w;
        _1023 = (*spvDescriptorSet0.vp_c9)._m0[917].z;
        _1025 = (*spvDescriptorSet0.vp_c9)._m0[916].z;
        _1027 = (*spvDescriptorSet0.vp_c9)._m0[917].w;
        _1029 = (*spvDescriptorSet0.vp_c9)._m0[918].y;
        _1031 = (*spvDescriptorSet0.vp_c9)._m0[918].x;
        _1033 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].z);
        _1035 = (*spvDescriptorSet0.vp_c9)._m0[918].z;
        _1037 = (*spvDescriptorSet0.vp_c9)._m0[918].w;
        _1039 = true;
    }
    else
    {
        float _1041 = fma(_753, 6.2500002968590706586837768554688e-05, 0.5);
        float _1043 = fma(_751, 6.2500002968590706586837768554688e-05, 0.5);
        float3 _3091 = float3(_1041, _1043, float(0));
        float3 _3095 = select(_3091, float3(0.0), isnan(_3091));
        float4 _1046 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _3095.xy, uint(rint(_3095.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _3095.xy, uint(rint(_3095.z)), level(0.0)).xyzw;
        float _1048 = _1046.x;
        float _1050 = _1046.y;
        float _1052 = _1046.z;
        float _1054 = _1046.w;
        float3 _3110 = float3(_1041, _1043, float(1));
        float3 _3112 = select(_3110, float3(0.0), isnan(_3110));
        float4 _1056 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _3112.xy, uint(rint(_3112.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _3112.xy, uint(rint(_3112.z)), level(0.0)).xyzw;
        float _1058 = _1056.x;
        float _1060 = _1056.y;
        float _1062 = _1056.z;
        float _1064 = _1056.w;
        float3 _3127 = float3(_1041, _1043, float(2));
        float3 _3129 = select(_3127, float3(0.0), isnan(_3127));
        float4 _1066 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _3129.xy, uint(rint(_3129.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _3129.xy, uint(rint(_3129.z)), level(0.0)).xyzw;
        float _1068 = _1066.x;
        float _1070 = _1066.y;
        float _1072 = _1066.z;
        float _1074 = _1066.w;
        float3 _3144 = float3(_1041, _1043, float(3));
        float3 _3146 = select(_3144, float3(0.0), isnan(_3144));
        float4 _1076 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _3146.xy, uint(rint(_3146.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _3146.xy, uint(rint(_3146.z)), level(0.0)).xyzw;
        float _1078 = _1076.x;
        float _1080 = _1076.y;
        float _1082 = _1076.z;
        float _1084 = _1076.w;
        float3 _3161 = float3(_1041, _1043, float(4));
        float3 _3163 = select(_3161, float3(0.0), isnan(_3161));
        float4 _1086 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _3163.xy, uint(rint(_3163.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _3163.xy, uint(rint(_3163.z)), level(0.0)).xyzw;
        float _1088 = _1086.x;
        float _1090 = _1086.y;
        float _1092 = _1086.z;
        float _1094 = _1086.w;
        float3 _3179 = float3(_1041, _1043, float(5));
        float3 _3181 = select(_3179, float3(0.0), isnan(_3179));
        float4 _1096 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _3181.xy, uint(rint(_3181.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _3181.xy, uint(rint(_3181.z)), level(0.0)).xyzw;
        float _1098 = _1096.x;
        float _1100 = _1096.y;
        float _1102 = _1096.z;
        float _1104 = _1096.w;
        float3 _3196 = float3(_1041, _1043, float(6));
        float3 _3198 = select(_3196, float3(0.0), isnan(_3196));
        float4 _1106 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _3198.xy, uint(rint(_3198.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _3198.xy, uint(rint(_3198.z)), level(0.0)).xyzw;
        float _1108 = _1106.x;
        float _1110 = _1106.y;
        float _1112 = _1106.z;
        float _1114 = _1106.w;
        float3 _3213 = float3(_1041, _1043, float(7));
        float3 _3215 = select(_3213, float3(0.0), isnan(_3213));
        float4 _1116 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _3215.xy, uint(rint(_3215.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _3215.xy, uint(rint(_3215.z)), level(0.0)).xyzw;
        float _1118 = _1116.x;
        float _1120 = _1116.y;
        float _1122 = _1116.z;
        float _1124 = _1116.w;
        _975 = _1078;
        _977 = _1080;
        _979 = _1082;
        _981 = as_type<int>(_1084);
        _983 = as_type<int>(_1088);
        _985 = as_type<int>(_1090);
        _987 = as_type<int>(_1092);
        _989 = as_type<int>(_1094);
        _991 = as_type<int>(_1098);
        _993 = as_type<int>(_1100);
        _995 = as_type<int>(_1104);
        _997 = _1110;
        _999 = _1120;
        _1001 = _1054;
        _1003 = _1058;
        _1005 = _1108;
        _1007 = _1118;
        _1009 = _1048;
        _1011 = _1060;
        _1013 = _1112;
        _1015 = _1122;
        _1017 = _1050;
        _1019 = _1114;
        _1021 = _1124;
        _1023 = _1062;
        _1025 = _1052;
        _1027 = _1064;
        _1029 = _1070;
        _1031 = _1068;
        _1033 = as_type<int>(_1102);
        _1035 = _1072;
        _1037 = _1074;
    }
    _1039 = false;
    float _1126 = _975;
    float _1128 = _977;
    float _1130 = _979;
    int _1132 = _981;
    int _1134 = _983;
    int _1136 = _985;
    int _1138 = _987;
    int _1140 = _989;
    int _1142 = _991;
    int _1144 = _993;
    int _1146 = _995;
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
    float _1176 = _1025;
    float _1178 = _1027;
    float _1180 = _1029;
    float _1182 = _1031;
    int _1184 = _1033;
    float _1186 = _1035;
    float _1188 = _1037;
    float _1190 = -(*spvDescriptorSet0.vp_c4)._m0[12].w;
    float _1192 = _831 + _1190;
    float _1194 = -(*spvDescriptorSet0.vp_c4)._m0[11].w;
    float _1196 = _753 + _1194;
    float _1198 = -(*spvDescriptorSet0.vp_c4)._m0[13].w;
    float _1200 = _751 + _1198;
    out.m_43.x = _753;
    out.m_43.y = _831;
    out.m_43.z = _751;
    float _1202 = _1192 * _1192;
    float _1204 = _1126 * 0.88622701168060302734375;
    float _1206 = _1128 * 0.88622701168060302734375;
    out.m_45.x = _845;
    float _1208 = fma(_1196, _1196, _1202);
    float _1210 = _1130 * 0.88622701168060302734375;
    float _1212 = _927 ? as_type<float>(_1132) : 0.0;
    out.gl_Position.x = _967;
    out.gl_Position.y = _965;
    out.gl_Position.z = _969;
    out.gl_Position.w = _971;
    float _1214 = fma(_1200, _1200, _1208);
    float _1216 = _927 ? _1204 : 0.0;
    float _1218 = _927 ? as_type<float>(_1134) : 0.0;
    out.m_47.z = _797;
    out.m_47.w = _803;
    float _1220 = _927 ? as_type<float>(_1136) : 0.0;
    float _1222 = rsqrt(_1214);
    float _1224 = _927 ? _1206 : 0.0;
    out.m_45.y = _847;
    float _1226 = _927 ? _1210 : 0.0;
    float _1228 = _927 ? as_type<float>(_1138) : 0.0;
    out.m_49.w = _889;
    float _1230 = _927 ? as_type<float>(_1140) : 0.0;
    float _1232 = _927 ? as_type<float>(_1142) : 0.0;
    float _1234 = _927 ? as_type<float>(_1144) : 0.0;
    float _1236 = _927 ? as_type<float>(_1146) : 0.0;
    float _1238 = _1222 * 1.02332699298858642578125;
    float _1240 = _1200 * _1222;
    float _1242 = _1192 * _1238;
    float _1244 = _1240 * (-1.02332699298858642578125);
    float _1246 = _1196 * _1238;
    float _1248 = _1242 * _1148;
    float _1250 = _1242 * _1150;
    float _1252 = _1242 * _1152;
    float _1254 = _1242 * _1154;
    float _1256 = fma(_1156, 0.88622701168060302734375, _1248);
    float _1258 = fma(_1158, 0.88622701168060302734375, _1250);
    float _1260 = fma(_1160, 0.88622701168060302734375, _1252);
    float _1262 = _1242 * _1162;
    float _1264 = fma(_1244, _1164, _1256);
    float _1266 = fma(_1244, _1166, _1258);
    float _1268 = fma(_1212, _1242, _1216);
    float _1270 = fma(_1168, 0.88622701168060302734375, _1254);
    float _1272 = fma(_1246, _1170, _1264);
    float _1274 = fma(_1246, _1172, _1266);
    float _1276 = fma(_1244, _1174, _1260);
    float _1278 = fma(_1176, 0.88622701168060302734375, _1262);
    float _1280 = fma(_1218, _1242, _1224);
    float _1282 = precise::max(0.0, _1272);
    float _1284 = fma(_1220, _1242, _1226);
    float _1286 = precise::max(0.0, _1274);
    float _1288 = fma(_1228, _1244, _1268);
    float _1290 = fma(_1244, _1178, _1270);
    float _1292 = _1282 * 0.31830990314483642578125;
    float _1294 = precise::clamp(_1292, 0.0, 1.0);
    float _1296 = fma(_1246, _1180, _1276);
    float _1298 = _1286 * 0.31830990314483642578125;
    float _1300 = precise::clamp(_1298, 0.0, 1.0);
    float _1302 = fma(_1244, _1182, _1278);
    float _1304 = fma(_1230, _1244, _1280);
    float _1306 = fma(_1232, _1244, _1284);
    float _1308 = _1294 * 0.88622701168060302734375;
    float _1310 = -_1300;
    float _1312 = _1310 + 1.0;
    float _1314 = _927 ? as_type<float>(_1184) : 0.0;
    float _1316 = fma(_1234, _1246, _1288);
    float _1318 = fma(_1246, _1186, _1290);
    float _1320 = precise::max(0.0, _1296);
    float _1322 = fma(_1246, _1188, _1302);
    float _1324 = _1308 * (*spvDescriptorSet0.vp_c9)._m0[991].x;
    float _1326 = fma(_1312, (*spvDescriptorSet0.vp_c9)._m0[37].y, _1300);
    float _1328 = fma(_1314, _1246, _1304);
    float _1330 = fma(_1236, _1246, _1306);
    float _1332 = precise::max(0.0, _1316);
    float _1334 = fma(_1320, (*spvDescriptorSet0.vp_c9)._m0[68].x, _1324);
    float _1336 = precise::max(0.0, _1318);
    float _1338 = _1308 * (*spvDescriptorSet0.vp_c9)._m0[991].y;
    float _1340 = precise::max(0.0, _1322);
    float _1342 = _1326 * (*spvDescriptorSet0.vp_c9)._m0[40].z;
    float _1344 = _1308 * (*spvDescriptorSet0.vp_c9)._m0[991].z;
    float _1346 = precise::max(0.0, _1328);
    float _1348 = fma(_1336, (*spvDescriptorSet0.vp_c9)._m0[68].y, _1338);
    float _1350 = fma(_1332, _1342, _1334);
    float _1352 = precise::max(0.0, _1330);
    float _1354 = fma(_1340, (*spvDescriptorSet0.vp_c9)._m0[68].z, _1344);
    float _1356 = -_889;
    float _1358 = -(*spvDescriptorSet0.vp_c9)._m0[72].y;
    float _1360 = _1356 + _1358;
    float _1362 = fma(_1346, _1342, _1348);
    float _1364 = fma(_1352, _1342, _1354);
    float _1366 = _1360 * (*spvDescriptorSet0.vp_c9)._m0[72].z;
    out.m_45.w = (*spvDescriptorSet0.vp_c15)._m0[7].y;
    out.m_51.w = _1366;
    out.m_49.x = _1350;
    out.m_49.y = _1362;
    out.m_49.z = _1364;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_BaseInstance [[base_instance]])
{
    main0_out out = {};
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1039 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _65 = in.m_40.x;
    float _67 = in.m_40.y;
    float _69 = -(*spvDescriptorSet0.vp_c15)._m0[3].x;
    float _71 = _69 + (*spvDescriptorSet0.vp_c15)._m0[3].y;
    int _74 = 16 + as_type<int>(as_type<float>(gl_BaseInstance));
    float _76 = -(*spvDescriptorSet0.vp_c15)._m0[3].z;
    float _78 = _76 + (*spvDescriptorSet0.vp_c15)._m0[3].w;
    int _80 = _74 << 4;
    bool _84 = _80 == 0;
    bool _86 = _80 == 16;
    bool _88 = _80 == 32;
    bool _90 = _80 == 48;
    bool _92 = _80 == 64;
    float _94 = fma(_71, _65, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _96 = fma(_78, _65, (*spvDescriptorSet0.vp_c15)._m0[3].z);
    bool _98 = _80 == 80;
    float _100 = as_type<float>(gl_BaseInstance);
    if (_84)
    {
        _100 = (*spvDescriptorSet0.vp_c14)._m0[268].x;
    }
    float _102 = _100;
    float _104 = -_94;
    float _106 = _104 + _96;
    bool _108 = _80 == 96;
    float _110 = fma(_106, _67, _94);
    float _112 = fma(_65, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _114 = 0.0;
    float _116 = _102;
    if (_84)
    {
        _114 = (*spvDescriptorSet0.vp_c14)._m0[268].z;
    }
    float _118 = _114;
    float _120 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _122 = _110 + _120;
    float _124 = _118;
    if (_86)
    {
        _116 = (*spvDescriptorSet0.vp_c14)._m0[269].x;
    }
    float _126 = _116;
    float _128 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _130 = _112 + _128;
    float _132 = fma(_67, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _134 = _122 * _122;
    bool _136 = _80 == 112;
    float _138 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _140 = _132 + _138;
    float _142 = fma(_130, _130, _134);
    float _144 = _126;
    if (_86)
    {
        _124 = (*spvDescriptorSet0.vp_c14)._m0[269].z;
    }
    float _146 = _124;
    float _148 = _146;
    if (_88)
    {
        _144 = (*spvDescriptorSet0.vp_c14)._m0[270].x;
    }
    float _150 = _144;
    float _152 = fma(_140, _140, _142);
    bool _154 = _80 == 128;
    float _156 = _150;
    if (_88)
    {
        _148 = (*spvDescriptorSet0.vp_c14)._m0[270].z;
    }
    float _158 = _148;
    float _160 = rsqrt(_152);
    float _162 = _158;
    if (_90)
    {
        _156 = (*spvDescriptorSet0.vp_c14)._m0[271].x;
    }
    float _164 = _156;
    bool _166 = _80 == 144;
    float _168 = _164;
    if (_90)
    {
        _162 = (*spvDescriptorSet0.vp_c14)._m0[271].z;
    }
    float _170 = _162;
    float _172 = _170;
    if (_92)
    {
        _168 = (*spvDescriptorSet0.vp_c14)._m0[272].x;
    }
    float _174 = _168;
    bool _176 = _80 == 160;
    float _178 = _174;
    if (_92)
    {
        _172 = (*spvDescriptorSet0.vp_c14)._m0[272].z;
    }
    float _180 = _172;
    float _182 = _180;
    if (_98)
    {
        _178 = (*spvDescriptorSet0.vp_c14)._m0[273].x;
    }
    float _184 = _178;
    bool _186 = _80 == 176;
    float _188 = _160 * (*spvDescriptorSet0.vp_c14)._m0[268].x;
    float _190 = _184;
    if (_98)
    {
        _182 = (*spvDescriptorSet0.vp_c14)._m0[273].z;
    }
    float _192 = _182;
    bool _194 = _80 == 192;
    float _196 = _192;
    if (_108)
    {
        _190 = (*spvDescriptorSet0.vp_c14)._m0[274].x;
    }
    float _198 = _190;
    float _200 = log2(_188);
    float _202 = _198;
    if (_108)
    {
        _196 = (*spvDescriptorSet0.vp_c14)._m0[274].z;
    }
    float _204 = _196;
    float _206 = _204;
    if (_136)
    {
        _202 = (*spvDescriptorSet0.vp_c14)._m0[275].x;
    }
    float _208 = _202;
    bool _210 = _80 == 208;
    float _212 = _208;
    if (_136)
    {
        _206 = (*spvDescriptorSet0.vp_c14)._m0[275].z;
    }
    float _214 = _206;
    float _216 = _214;
    if (_154)
    {
        _212 = (*spvDescriptorSet0.vp_c14)._m0[276].x;
    }
    float _218 = _212;
    bool _220 = _80 == 224;
    float _222 = _218;
    if (_154)
    {
        _216 = (*spvDescriptorSet0.vp_c14)._m0[276].z;
    }
    float _224 = _216;
    float _226 = _224;
    if (_166)
    {
        _222 = (*spvDescriptorSet0.vp_c14)._m0[277].x;
    }
    float _228 = _222;
    float _230 = _200 + 1.2999999523162841796875;
    bool _232 = _80 == 240;
    float _234 = _228;
    if (_166)
    {
        _226 = (*spvDescriptorSet0.vp_c14)._m0[277].z;
    }
    float _236 = _226;
    float _238 = _236;
    if (_176)
    {
        _234 = (*spvDescriptorSet0.vp_c14)._m0[278].x;
    }
    float _240 = _234;
    float _242 = trunc(_230);
    int _244 = int(_242);
    bool _246 = _80 == 256;
    float _248 = _240;
    if (_176)
    {
        _238 = (*spvDescriptorSet0.vp_c14)._m0[278].z;
    }
    float _250 = _238;
    float _252 = _250;
    if (_186)
    {
        _248 = (*spvDescriptorSet0.vp_c14)._m0[279].x;
    }
    float _254 = _248;
    bool _256 = _80 == 272;
    float _258 = _254;
    if (_186)
    {
        _252 = (*spvDescriptorSet0.vp_c14)._m0[279].z;
    }
    float _260 = _252;
    float _262 = _260;
    if (_194)
    {
        _258 = (*spvDescriptorSet0.vp_c14)._m0[280].x;
    }
    float _264 = _258;
    bool _266 = _80 == 288;
    float _268 = _264;
    if (_194)
    {
        _262 = (*spvDescriptorSet0.vp_c14)._m0[280].z;
    }
    float _270 = _262;
    int _272 = min(_244, 15);
    bool _274 = _80 == 304;
    float _276 = _270;
    if (_210)
    {
        _268 = (*spvDescriptorSet0.vp_c14)._m0[281].x;
    }
    float _278 = _268;
    float _280 = float(_272);
    float _282 = _278;
    if (_210)
    {
        _276 = (*spvDescriptorSet0.vp_c14)._m0[281].z;
    }
    float _284 = _276;
    int _286 = _272 << 4;
    int _288 = _286 + 4288;
    float _290 = _284;
    if (_220)
    {
        _282 = (*spvDescriptorSet0.vp_c14)._m0[282].x;
    }
    float _292 = _282;
    bool _294 = _80 == 320;
    float _296 = -_280;
    float _298 = _296 + (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _300 = _292;
    if (_220)
    {
        _290 = (*spvDescriptorSet0.vp_c14)._m0[282].z;
    }
    float _302 = _290;
    float _304 = _302;
    if (_232)
    {
        _300 = (*spvDescriptorSet0.vp_c14)._m0[283].x;
    }
    float _306 = _300;
    float _308 = _298 + 1.0;
    bool _310 = _80 == 336;
    float _312 = _306;
    if (_232)
    {
        _304 = (*spvDescriptorSet0.vp_c14)._m0[283].z;
    }
    float _314 = _304;
    float _316 = _314;
    if (_246)
    {
        _312 = (*spvDescriptorSet0.vp_c14)._m0[284].x;
    }
    float _318 = _312;
    float _320 = exp2(_308);
    bool _322 = _80 == 352;
    float _324 = _318;
    if (_246)
    {
        _316 = (*spvDescriptorSet0.vp_c14)._m0[284].z;
    }
    float _326 = _316;
    float _328 = _326;
    if (_256)
    {
        _324 = (*spvDescriptorSet0.vp_c14)._m0[285].x;
    }
    float _330 = _324;
    bool _332 = _80 == 368;
    float _334 = _330;
    if (_256)
    {
        _328 = (*spvDescriptorSet0.vp_c14)._m0[285].z;
    }
    float _336 = _328;
    float _338 = _336;
    if (_266)
    {
        _334 = (*spvDescriptorSet0.vp_c14)._m0[286].x;
    }
    float _340 = _334;
    bool _342 = _80 == 384;
    float _344 = _340;
    if (_266)
    {
        _338 = (*spvDescriptorSet0.vp_c14)._m0[286].z;
    }
    float _346 = _338;
    float _348 = 1.0 / _320;
    float _350 = _346;
    if (_274)
    {
        _344 = (*spvDescriptorSet0.vp_c14)._m0[287].x;
    }
    float _352 = _344;
    bool _354 = _80 == 400;
    float _356 = _352;
    if (_274)
    {
        _350 = (*spvDescriptorSet0.vp_c14)._m0[287].z;
    }
    float _358 = _350;
    bool _360 = _80 == 416;
    float _362 = _358;
    if (_294)
    {
        _356 = (*spvDescriptorSet0.vp_c14)._m0[288].x;
    }
    float _364 = _356;
    float _366 = _364;
    if (_294)
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
    bool _374 = _80 == 432;
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
    bool _384 = _80 == 448;
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
    bool _394 = _80 == 464;
    float _396 = _392;
    if (_332)
    {
        _390 = (*spvDescriptorSet0.vp_c14)._m0[291].z;
    }
    float _398 = _390;
    float _400 = _398;
    if (_342)
    {
        _396 = (*spvDescriptorSet0.vp_c14)._m0[292].x;
    }
    float _402 = _396;
    bool _404 = _80 == 480;
    float _406 = _402;
    if (_342)
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
    bool _414 = _80 == 496;
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
    bool _424 = _80 == 512;
    float _426 = _422;
    if (_360)
    {
        _420 = (*spvDescriptorSet0.vp_c14)._m0[294].z;
    }
    float _428 = _420;
    bool _430 = _80 == 528;
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
    bool _444 = _80 == 544;
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
    bool _454 = _80 == 560;
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
    bool _464 = _80 == 576;
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
    bool _474 = _80 == 592;
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
    bool _484 = _80 == 608;
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
    bool _494 = _80 == 624;
    float _496 = _492;
    if (_430)
    {
        _490 = (*spvDescriptorSet0.vp_c14)._m0[301].z;
    }
    float _498 = _490;
    bool _500 = _80 == 640;
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
    bool _514 = _80 == 656;
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
    bool _524 = _80 == 672;
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
    bool _534 = _80 == 688;
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
    bool _544 = _80 == 704;
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
    bool _554 = _80 == 720;
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
    bool _564 = _80 == 736;
    float _566 = _562;
    if (_500)
    {
        _560 = (*spvDescriptorSet0.vp_c14)._m0[308].z;
    }
    float _568 = _560;
    bool _570 = _80 == 752;
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
    float _600 = _348 * _598;
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
    float _610 = _600 * _67;
    float _612 = _606;
    if (_534)
    {
        _612 = (*spvDescriptorSet0.vp_c14)._m0[311].z;
    }
    float _614 = _612;
    float _616 = floor(_608);
    float _618 = _614;
    if (_544)
    {
        _618 = (*spvDescriptorSet0.vp_c14)._m0[312].z;
    }
    float _620 = _618;
    float _622 = _620;
    if (_554)
    {
        _622 = (*spvDescriptorSet0.vp_c14)._m0[313].z;
    }
    float _624 = _622;
    float _626 = _624;
    if (_564)
    {
        _626 = (*spvDescriptorSet0.vp_c14)._m0[314].z;
    }
    float _628 = _626;
    float _630 = _628;
    if (_570)
    {
        _630 = (*spvDescriptorSet0.vp_c14)._m0[315].z;
    }
    float _632 = _630;
    float _634 = floor(_610);
    float _636 = _320 * _632;
    float _638 = -_616;
    float _640 = _608 + _638;
    float _642 = _640 * 2.0;
    float _644 = -_640;
    float _646 = fma(_636, _644, _65);
    int _648 = _288 + 8;
    uint _651 = uint(int(uint(_648) >> uint(2)));
    uint _653 = uint(int(uint(int(_651)) >> uint(2)));
    int _655 = int(_651) & 3;
    float _657 = (*spvDescriptorSet0.vp_c14)._m0[int(_653)][_655];
    int _659 = int(_651) + 1;
    uint _661 = uint(int(uint(_659) >> uint(2)));
    int _663 = _659 & 3;
    float _665 = (*spvDescriptorSet0.vp_c14)._m0[int(_661)][_663];
    float _667 = -_634;
    float _669 = _610 + _667;
    float _671 = floor(_642);
    float _673 = _669 * 2.0;
    float _675 = -_669;
    float _677 = fma(_636, _675, _67);
    float _679 = floor(_673);
    float _681 = _636 * _671;
    float _683 = _681 * 0.5;
    float _685 = _683 + _646;
    float _687 = fma(_71, _685, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _689 = _636 * _679;
    float _691 = _689 * 0.5;
    float _693 = fma(_78, _685, (*spvDescriptorSet0.vp_c15)._m0[3].z);
    float _695 = fma(_685, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _697 = _691 + _677;
    float _699 = -_687;
    float _701 = _699 + _693;
    float _703 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _705 = _695 + _703;
    float _707 = fma(_697, _701, _687);
    float _709 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _711 = _707 + _709;
    float _713 = fma(_697, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _715 = _711 * _711;
    float _717 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _719 = _713 + _717;
    float _721 = fma(_705, _705, _715);
    float _723 = fma(_719, _719, _721);
    float _725 = sqrt(_723);
    float _727 = -_665;
    float _729 = fma(_725, _657, _727);
    float _731 = precise::clamp(_729, 0.0, 1.0);
    float _733 = -_691;
    float _735 = fma(_733, _731, _697);
    float _737 = -_683;
    float _739 = fma(_737, _731, _685);
    float _741 = fma(_735, (*spvDescriptorSet0.vp_c15)._m0[6].x, (*spvDescriptorSet0.vp_c15)._m0[6].w);
    float _743 = fma(_739, (*spvDescriptorSet0.vp_c15)._m0[6].x, (*spvDescriptorSet0.vp_c15)._m0[6].z);
    float _745 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _741);
    float _747 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _743);
    float2 _2568 = float2(_747, _745);
    float _749 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2568, float2(0.0), isnan(_2568)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2568, float2(0.0), isnan(_2568)), level(0.0)).x;
    float _751 = fma(_735, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _753 = fma(_739, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _755 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _757 = _751 + _755;
    float _759 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _761 = _753 + _759;
    float _763 = _757 * _757;
    float _765 = fma(_761, _761, _763);
    float _767 = sqrt(_765);
    bool _769 = _767 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _771 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _773 = _767 + _771;
    float _775 = (*spvDescriptorSet0.vp_c15)._m0[4].x;
    float _777 = _767;
    float _779 = _669;
    float _781 = _765;
    float _783 = _735;
    if (_769)
    {
        float _785 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        _775 = _785;
    }
    float _787 = _775;
    float _789 = _787;
    float _791 = (*spvDescriptorSet0.vp_c14)._m0[0].y;
    if (_769)
    {
        float _793 = _773 * _787;
        _777 = _793;
    }
    float _795 = _777;
    float _797 = fma(_739, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].z);
    if (_769)
    {
        float _799 = rsqrt(_765);
        _789 = _799;
    }
    float _801 = _789;
    float _803 = fma(_735, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].w);
    float _805 = _801;
    if (_769)
    {
        float _807 = _795 * 0.15915493667125701904296875;
        _779 = _807;
    }
    float _809 = _779;
    float _811 = _795;
    if (_769)
    {
        float _813 = _809 * 6.283185482025146484375;
        float _815 = sin(_813);
        _811 = _815;
    }
    float _817 = _811;
    if (!_769)
    {
        _781 = _753;
    }
    float _819 = _781;
    float _821 = _657;
    float _823 = _819;
    if (_769)
    {
        float _825 = _809 * 6.283185482025146484375;
        float _827 = cos(_825);
        _821 = _827;
    }
    float _829 = _821;
    float _831 = fma(_749, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    if (_769)
    {
        float _833 = _831 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        _791 = _833;
    }
    float _835 = _791;
    float _837 = _831 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _839 = _835;
    if (_769)
    {
        float _841 = fma(_817, _835, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        _839 = _841;
    }
    float _843 = _839;
    float _845 = fma(_739, (*spvDescriptorSet0.vp_c15)._m0[8].x, (*spvDescriptorSet0.vp_c15)._m0[8].z);
    float _847 = fma(_735, (*spvDescriptorSet0.vp_c15)._m0[8].x, (*spvDescriptorSet0.vp_c15)._m0[8].w);
    float _849 = fma(_753, (*spvDescriptorSet0.vp_c4)._m0[2].x, _837);
    float _851 = 0.0;
    float _853 = _843;
    if (_769)
    {
        float _855 = _801 * _843;
        _851 = _855;
    }
    float _857 = _851;
    if (_769)
    {
        float _859 = _829 + (-1.0);
        _853 = _859;
    }
    float _861 = _853;
    float _863 = _861;
    if (!_769)
    {
        _805 = _831;
    }
    float _865 = _805;
    float _867 = fma(_751, (*spvDescriptorSet0.vp_c4)._m0[2].z, _849);
    float _869 = _865;
    if (_769)
    {
        float _871 = fma(_761, _857, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        _823 = _871;
    }
    float _873 = _823;
    float _875 = 0.0;
    if (_769)
    {
        float _877 = _861 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        _875 = _877;
    }
    float _879 = _875;
    if (!_769)
    {
        _863 = _751;
    }
    float _881 = _863;
    float _883 = _881;
    if (_769)
    {
        float _885 = fma(_757, _857, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        _883 = _885;
    }
    float _887 = _883;
    float _889 = _867 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    if (_769)
    {
        float _891 = fma(_831, _829, _879);
        _869 = _891;
    }
    float _893 = _869;
    float _895 = _893 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    if (_769)
    {
        float _897 = _893 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        _783 = _897;
    }
    float _899 = _783;
    float _901 = _893 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _903 = fma(_873, (*spvDescriptorSet0.vp_c4)._m0[1].x, _895);
    float _905 = _899;
    float _907 = _901;
    if (_769)
    {
        float _909 = fma(_873, (*spvDescriptorSet0.vp_c4)._m0[2].x, _899);
        _905 = _909;
    }
    float _911 = _905;
    float _913 = fma(_873, (*spvDescriptorSet0.vp_c4)._m0[0].x, _901);
    float _915 = fma(_887, (*spvDescriptorSet0.vp_c4)._m0[1].z, _903);
    float _917 = _911;
    if (_769)
    {
        float _919 = fma(_887, (*spvDescriptorSet0.vp_c4)._m0[2].z, _911);
        _917 = _919;
    }
    float _921 = _917;
    float _923 = fma(_887, (*spvDescriptorSet0.vp_c4)._m0[0].z, _913);
    int _925 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[40].w) & 2;
    bool _927 = _925 != 0;
    float _929 = _915 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    if (!_769)
    {
        _907 = _889;
    }
    float _931 = _907;
    float _933 = _923 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _935 = _931;
    if (_769)
    {
        float _937 = _921 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _935 = _937;
    }
    float _939 = _935;
    float _941 = _929 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _943 = _929 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _945 = _929 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _947 = _929 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _949 = fma(_933, (*spvDescriptorSet0.vp_c4)._m0[8].x, _941);
    float _951 = fma(_933, (*spvDescriptorSet0.vp_c4)._m0[7].x, _943);
    float _953 = fma(_933, (*spvDescriptorSet0.vp_c4)._m0[9].x, _945);
    float _955 = fma(_933, (*spvDescriptorSet0.vp_c4)._m0[10].x, _947);
    float _957 = fma(_939, (*spvDescriptorSet0.vp_c4)._m0[8].z, _949);
    float _959 = fma(_939, (*spvDescriptorSet0.vp_c4)._m0[7].z, _951);
    float _961 = fma(_939, (*spvDescriptorSet0.vp_c4)._m0[9].z, _953);
    float _963 = fma(_939, (*spvDescriptorSet0.vp_c4)._m0[10].z, _955);
    float _965 = _957 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _967 = _959 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _969 = _961 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _971 = _963 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    bool _973 = !_927;
    float _975;
    float _977;
    float _979;
    int _981;
    int _983;
    int _985;
    int _987;
    int _989;
    int _991;
    int _993;
    int _995;
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
    float _1025;
    float _1027;
    float _1029;
    float _1031;
    int _1033;
    float _1035;
    float _1037;
    if (!_973)
    {
        _975 = (*spvDescriptorSet0.vp_c9)._m0[919].x;
        _977 = (*spvDescriptorSet0.vp_c9)._m0[919].y;
        _979 = (*spvDescriptorSet0.vp_c9)._m0[919].z;
        _981 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[919].w);
        _983 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].x);
        _985 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].y);
        _987 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].z);
        _989 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].w);
        _991 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].x);
        _993 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].y);
        _995 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].w);
        _997 = (*spvDescriptorSet0.vp_c9)._m0[922].y;
        _999 = (*spvDescriptorSet0.vp_c9)._m0[923].y;
        _1001 = (*spvDescriptorSet0.vp_c9)._m0[916].w;
        _1003 = (*spvDescriptorSet0.vp_c9)._m0[917].x;
        _1005 = (*spvDescriptorSet0.vp_c9)._m0[922].x;
        _1007 = (*spvDescriptorSet0.vp_c9)._m0[923].x;
        _1009 = (*spvDescriptorSet0.vp_c9)._m0[916].x;
        _1011 = (*spvDescriptorSet0.vp_c9)._m0[917].y;
        _1013 = (*spvDescriptorSet0.vp_c9)._m0[922].z;
        _1015 = (*spvDescriptorSet0.vp_c9)._m0[923].z;
        _1017 = (*spvDescriptorSet0.vp_c9)._m0[916].y;
        _1019 = (*spvDescriptorSet0.vp_c9)._m0[922].w;
        _1021 = (*spvDescriptorSet0.vp_c9)._m0[923].w;
        _1023 = (*spvDescriptorSet0.vp_c9)._m0[917].z;
        _1025 = (*spvDescriptorSet0.vp_c9)._m0[916].z;
        _1027 = (*spvDescriptorSet0.vp_c9)._m0[917].w;
        _1029 = (*spvDescriptorSet0.vp_c9)._m0[918].y;
        _1031 = (*spvDescriptorSet0.vp_c9)._m0[918].x;
        _1033 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].z);
        _1035 = (*spvDescriptorSet0.vp_c9)._m0[918].z;
        _1037 = (*spvDescriptorSet0.vp_c9)._m0[918].w;
        _1039 = true;
    }
    else
    {
        float _1041 = fma(_753, 6.2500002968590706586837768554688e-05, 0.5);
        float _1043 = fma(_751, 6.2500002968590706586837768554688e-05, 0.5);
        float3 _3091 = float3(_1041, _1043, float(0));
        float3 _3095 = select(_3091, float3(0.0), isnan(_3091));
        float4 _1046 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _3095.xy, uint(rint(_3095.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _3095.xy, uint(rint(_3095.z)), level(0.0)).xyzw;
        float _1048 = _1046.x;
        float _1050 = _1046.y;
        float _1052 = _1046.z;
        float _1054 = _1046.w;
        float3 _3110 = float3(_1041, _1043, float(1));
        float3 _3112 = select(_3110, float3(0.0), isnan(_3110));
        float4 _1056 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _3112.xy, uint(rint(_3112.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _3112.xy, uint(rint(_3112.z)), level(0.0)).xyzw;
        float _1058 = _1056.x;
        float _1060 = _1056.y;
        float _1062 = _1056.z;
        float _1064 = _1056.w;
        float3 _3127 = float3(_1041, _1043, float(2));
        float3 _3129 = select(_3127, float3(0.0), isnan(_3127));
        float4 _1066 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _3129.xy, uint(rint(_3129.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _3129.xy, uint(rint(_3129.z)), level(0.0)).xyzw;
        float _1068 = _1066.x;
        float _1070 = _1066.y;
        float _1072 = _1066.z;
        float _1074 = _1066.w;
        float3 _3144 = float3(_1041, _1043, float(3));
        float3 _3146 = select(_3144, float3(0.0), isnan(_3144));
        float4 _1076 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _3146.xy, uint(rint(_3146.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _3146.xy, uint(rint(_3146.z)), level(0.0)).xyzw;
        float _1078 = _1076.x;
        float _1080 = _1076.y;
        float _1082 = _1076.z;
        float _1084 = _1076.w;
        float3 _3161 = float3(_1041, _1043, float(4));
        float3 _3163 = select(_3161, float3(0.0), isnan(_3161));
        float4 _1086 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _3163.xy, uint(rint(_3163.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _3163.xy, uint(rint(_3163.z)), level(0.0)).xyzw;
        float _1088 = _1086.x;
        float _1090 = _1086.y;
        float _1092 = _1086.z;
        float _1094 = _1086.w;
        float3 _3179 = float3(_1041, _1043, float(5));
        float3 _3181 = select(_3179, float3(0.0), isnan(_3179));
        float4 _1096 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _3181.xy, uint(rint(_3181.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _3181.xy, uint(rint(_3181.z)), level(0.0)).xyzw;
        float _1098 = _1096.x;
        float _1100 = _1096.y;
        float _1102 = _1096.z;
        float _1104 = _1096.w;
        float3 _3196 = float3(_1041, _1043, float(6));
        float3 _3198 = select(_3196, float3(0.0), isnan(_3196));
        float4 _1106 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _3198.xy, uint(rint(_3198.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _3198.xy, uint(rint(_3198.z)), level(0.0)).xyzw;
        float _1108 = _1106.x;
        float _1110 = _1106.y;
        float _1112 = _1106.z;
        float _1114 = _1106.w;
        float3 _3213 = float3(_1041, _1043, float(7));
        float3 _3215 = select(_3213, float3(0.0), isnan(_3213));
        float4 _1116 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _3215.xy, uint(rint(_3215.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _3215.xy, uint(rint(_3215.z)), level(0.0)).xyzw;
        float _1118 = _1116.x;
        float _1120 = _1116.y;
        float _1122 = _1116.z;
        float _1124 = _1116.w;
        _975 = _1078;
        _977 = _1080;
        _979 = _1082;
        _981 = as_type<int>(_1084);
        _983 = as_type<int>(_1088);
        _985 = as_type<int>(_1090);
        _987 = as_type<int>(_1092);
        _989 = as_type<int>(_1094);
        _991 = as_type<int>(_1098);
        _993 = as_type<int>(_1100);
        _995 = as_type<int>(_1104);
        _997 = _1110;
        _999 = _1120;
        _1001 = _1054;
        _1003 = _1058;
        _1005 = _1108;
        _1007 = _1118;
        _1009 = _1048;
        _1011 = _1060;
        _1013 = _1112;
        _1015 = _1122;
        _1017 = _1050;
        _1019 = _1114;
        _1021 = _1124;
        _1023 = _1062;
        _1025 = _1052;
        _1027 = _1064;
        _1029 = _1070;
        _1031 = _1068;
        _1033 = as_type<int>(_1102);
        _1035 = _1072;
        _1037 = _1074;
    }
    _1039 = false;
    float _1126 = _975;
    float _1128 = _977;
    float _1130 = _979;
    int _1132 = _981;
    int _1134 = _983;
    int _1136 = _985;
    int _1138 = _987;
    int _1140 = _989;
    int _1142 = _991;
    int _1144 = _993;
    int _1146 = _995;
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
    float _1176 = _1025;
    float _1178 = _1027;
    float _1180 = _1029;
    float _1182 = _1031;
    int _1184 = _1033;
    float _1186 = _1035;
    float _1188 = _1037;
    float _1190 = -(*spvDescriptorSet0.vp_c4)._m0[12].w;
    float _1192 = _831 + _1190;
    float _1194 = -(*spvDescriptorSet0.vp_c4)._m0[11].w;
    float _1196 = _753 + _1194;
    float _1198 = -(*spvDescriptorSet0.vp_c4)._m0[13].w;
    float _1200 = _751 + _1198;
    out.m_43.x = _753;
    out.m_43.y = _831;
    out.m_43.z = _751;
    float _1202 = _1192 * _1192;
    float _1204 = _1126 * 0.88622701168060302734375;
    float _1206 = _1128 * 0.88622701168060302734375;
    out.m_45.x = _845;
    float _1208 = fma(_1196, _1196, _1202);
    float _1210 = _1130 * 0.88622701168060302734375;
    float _1212 = _927 ? as_type<float>(_1132) : 0.0;
    out.gl_Position.x = _967;
    out.gl_Position.y = _965;
    out.gl_Position.z = _969;
    out.gl_Position.w = _971;
    float _1214 = fma(_1200, _1200, _1208);
    float _1216 = _927 ? _1204 : 0.0;
    float _1218 = _927 ? as_type<float>(_1134) : 0.0;
    out.m_47.z = _797;
    out.m_47.w = _803;
    float _1220 = _927 ? as_type<float>(_1136) : 0.0;
    float _1222 = rsqrt(_1214);
    float _1224 = _927 ? _1206 : 0.0;
    out.m_45.y = _847;
    float _1226 = _927 ? _1210 : 0.0;
    float _1228 = _927 ? as_type<float>(_1138) : 0.0;
    out.m_49.w = _889;
    float _1230 = _927 ? as_type<float>(_1140) : 0.0;
    float _1232 = _927 ? as_type<float>(_1142) : 0.0;
    float _1234 = _927 ? as_type<float>(_1144) : 0.0;
    float _1236 = _927 ? as_type<float>(_1146) : 0.0;
    float _1238 = _1222 * 1.02332699298858642578125;
    float _1240 = _1200 * _1222;
    float _1242 = _1192 * _1238;
    float _1244 = _1240 * (-1.02332699298858642578125);
    float _1246 = _1196 * _1238;
    float _1248 = _1242 * _1148;
    float _1250 = _1242 * _1150;
    float _1252 = _1242 * _1152;
    float _1254 = _1242 * _1154;
    float _1256 = fma(_1156, 0.88622701168060302734375, _1248);
    float _1258 = fma(_1158, 0.88622701168060302734375, _1250);
    float _1260 = fma(_1160, 0.88622701168060302734375, _1252);
    float _1262 = _1242 * _1162;
    float _1264 = fma(_1244, _1164, _1256);
    float _1266 = fma(_1244, _1166, _1258);
    float _1268 = fma(_1212, _1242, _1216);
    float _1270 = fma(_1168, 0.88622701168060302734375, _1254);
    float _1272 = fma(_1246, _1170, _1264);
    float _1274 = fma(_1246, _1172, _1266);
    float _1276 = fma(_1244, _1174, _1260);
    float _1278 = fma(_1176, 0.88622701168060302734375, _1262);
    float _1280 = fma(_1218, _1242, _1224);
    float _1282 = precise::max(0.0, _1272);
    float _1284 = fma(_1220, _1242, _1226);
    float _1286 = precise::max(0.0, _1274);
    float _1288 = fma(_1228, _1244, _1268);
    float _1290 = fma(_1244, _1178, _1270);
    float _1292 = _1282 * 0.31830990314483642578125;
    float _1294 = precise::clamp(_1292, 0.0, 1.0);
    float _1296 = fma(_1246, _1180, _1276);
    float _1298 = _1286 * 0.31830990314483642578125;
    float _1300 = precise::clamp(_1298, 0.0, 1.0);
    float _1302 = fma(_1244, _1182, _1278);
    float _1304 = fma(_1230, _1244, _1280);
    float _1306 = fma(_1232, _1244, _1284);
    float _1308 = _1294 * 0.88622701168060302734375;
    float _1310 = -_1300;
    float _1312 = _1310 + 1.0;
    float _1314 = _927 ? as_type<float>(_1184) : 0.0;
    float _1316 = fma(_1234, _1246, _1288);
    float _1318 = fma(_1246, _1186, _1290);
    float _1320 = precise::max(0.0, _1296);
    float _1322 = fma(_1246, _1188, _1302);
    float _1324 = _1308 * (*spvDescriptorSet0.vp_c9)._m0[991].x;
    float _1326 = fma(_1312, (*spvDescriptorSet0.vp_c9)._m0[37].y, _1300);
    float _1328 = fma(_1314, _1246, _1304);
    float _1330 = fma(_1236, _1246, _1306);
    float _1332 = precise::max(0.0, _1316);
    float _1334 = fma(_1320, (*spvDescriptorSet0.vp_c9)._m0[68].x, _1324);
    float _1336 = precise::max(0.0, _1318);
    float _1338 = _1308 * (*spvDescriptorSet0.vp_c9)._m0[991].y;
    float _1340 = precise::max(0.0, _1322);
    float _1342 = _1326 * (*spvDescriptorSet0.vp_c9)._m0[40].z;
    float _1344 = _1308 * (*spvDescriptorSet0.vp_c9)._m0[991].z;
    float _1346 = precise::max(0.0, _1328);
    float _1348 = fma(_1336, (*spvDescriptorSet0.vp_c9)._m0[68].y, _1338);
    float _1350 = fma(_1332, _1342, _1334);
    float _1352 = precise::max(0.0, _1330);
    float _1354 = fma(_1340, (*spvDescriptorSet0.vp_c9)._m0[68].z, _1344);
    float _1356 = -_889;
    float _1358 = -(*spvDescriptorSet0.vp_c9)._m0[72].y;
    float _1360 = _1356 + _1358;
    float _1362 = fma(_1346, _1342, _1348);
    float _1364 = fma(_1352, _1342, _1354);
    float _1366 = _1360 * (*spvDescriptorSet0.vp_c9)._m0[72].z;
    out.m_45.w = (*spvDescriptorSet0.vp_c15)._m0[7].y;
    out.m_51.w = _1366;
    out.m_49.x = _1350;
    out.m_49.y = _1362;
    out.m_49.z = _1364;
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
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1039 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _65 = in.m_40.x;
    float _67 = in.m_40.y;
    float _69 = -(*spvDescriptorSet0.vp_c15)._m0[3].x;
    float _71 = _69 + (*spvDescriptorSet0.vp_c15)._m0[3].y;
    int _74 = 16 + as_type<int>(as_type<float>(gl_BaseInstance));
    float _76 = -(*spvDescriptorSet0.vp_c15)._m0[3].z;
    float _78 = _76 + (*spvDescriptorSet0.vp_c15)._m0[3].w;
    int _80 = _74 << 4;
    bool _84 = _80 == 0;
    bool _86 = _80 == 16;
    bool _88 = _80 == 32;
    bool _90 = _80 == 48;
    bool _92 = _80 == 64;
    float _94 = fma(_71, _65, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _96 = fma(_78, _65, (*spvDescriptorSet0.vp_c15)._m0[3].z);
    bool _98 = _80 == 80;
    float _100 = as_type<float>(gl_BaseInstance);
    if (_84)
    {
        _100 = (*spvDescriptorSet0.vp_c14)._m0[268].x;
    }
    float _102 = _100;
    float _104 = -_94;
    float _106 = _104 + _96;
    bool _108 = _80 == 96;
    float _110 = fma(_106, _67, _94);
    float _112 = fma(_65, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _114 = 0.0;
    float _116 = _102;
    if (_84)
    {
        _114 = (*spvDescriptorSet0.vp_c14)._m0[268].z;
    }
    float _118 = _114;
    float _120 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _122 = _110 + _120;
    float _124 = _118;
    if (_86)
    {
        _116 = (*spvDescriptorSet0.vp_c14)._m0[269].x;
    }
    float _126 = _116;
    float _128 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _130 = _112 + _128;
    float _132 = fma(_67, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _134 = _122 * _122;
    bool _136 = _80 == 112;
    float _138 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _140 = _132 + _138;
    float _142 = fma(_130, _130, _134);
    float _144 = _126;
    if (_86)
    {
        _124 = (*spvDescriptorSet0.vp_c14)._m0[269].z;
    }
    float _146 = _124;
    float _148 = _146;
    if (_88)
    {
        _144 = (*spvDescriptorSet0.vp_c14)._m0[270].x;
    }
    float _150 = _144;
    float _152 = fma(_140, _140, _142);
    bool _154 = _80 == 128;
    float _156 = _150;
    if (_88)
    {
        _148 = (*spvDescriptorSet0.vp_c14)._m0[270].z;
    }
    float _158 = _148;
    float _160 = rsqrt(_152);
    float _162 = _158;
    if (_90)
    {
        _156 = (*spvDescriptorSet0.vp_c14)._m0[271].x;
    }
    float _164 = _156;
    bool _166 = _80 == 144;
    float _168 = _164;
    if (_90)
    {
        _162 = (*spvDescriptorSet0.vp_c14)._m0[271].z;
    }
    float _170 = _162;
    float _172 = _170;
    if (_92)
    {
        _168 = (*spvDescriptorSet0.vp_c14)._m0[272].x;
    }
    float _174 = _168;
    bool _176 = _80 == 160;
    float _178 = _174;
    if (_92)
    {
        _172 = (*spvDescriptorSet0.vp_c14)._m0[272].z;
    }
    float _180 = _172;
    float _182 = _180;
    if (_98)
    {
        _178 = (*spvDescriptorSet0.vp_c14)._m0[273].x;
    }
    float _184 = _178;
    bool _186 = _80 == 176;
    float _188 = _160 * (*spvDescriptorSet0.vp_c14)._m0[268].x;
    float _190 = _184;
    if (_98)
    {
        _182 = (*spvDescriptorSet0.vp_c14)._m0[273].z;
    }
    float _192 = _182;
    bool _194 = _80 == 192;
    float _196 = _192;
    if (_108)
    {
        _190 = (*spvDescriptorSet0.vp_c14)._m0[274].x;
    }
    float _198 = _190;
    float _200 = log2(_188);
    float _202 = _198;
    if (_108)
    {
        _196 = (*spvDescriptorSet0.vp_c14)._m0[274].z;
    }
    float _204 = _196;
    float _206 = _204;
    if (_136)
    {
        _202 = (*spvDescriptorSet0.vp_c14)._m0[275].x;
    }
    float _208 = _202;
    bool _210 = _80 == 208;
    float _212 = _208;
    if (_136)
    {
        _206 = (*spvDescriptorSet0.vp_c14)._m0[275].z;
    }
    float _214 = _206;
    float _216 = _214;
    if (_154)
    {
        _212 = (*spvDescriptorSet0.vp_c14)._m0[276].x;
    }
    float _218 = _212;
    bool _220 = _80 == 224;
    float _222 = _218;
    if (_154)
    {
        _216 = (*spvDescriptorSet0.vp_c14)._m0[276].z;
    }
    float _224 = _216;
    float _226 = _224;
    if (_166)
    {
        _222 = (*spvDescriptorSet0.vp_c14)._m0[277].x;
    }
    float _228 = _222;
    float _230 = _200 + 1.2999999523162841796875;
    bool _232 = _80 == 240;
    float _234 = _228;
    if (_166)
    {
        _226 = (*spvDescriptorSet0.vp_c14)._m0[277].z;
    }
    float _236 = _226;
    float _238 = _236;
    if (_176)
    {
        _234 = (*spvDescriptorSet0.vp_c14)._m0[278].x;
    }
    float _240 = _234;
    float _242 = trunc(_230);
    int _244 = int(_242);
    bool _246 = _80 == 256;
    float _248 = _240;
    if (_176)
    {
        _238 = (*spvDescriptorSet0.vp_c14)._m0[278].z;
    }
    float _250 = _238;
    float _252 = _250;
    if (_186)
    {
        _248 = (*spvDescriptorSet0.vp_c14)._m0[279].x;
    }
    float _254 = _248;
    bool _256 = _80 == 272;
    float _258 = _254;
    if (_186)
    {
        _252 = (*spvDescriptorSet0.vp_c14)._m0[279].z;
    }
    float _260 = _252;
    float _262 = _260;
    if (_194)
    {
        _258 = (*spvDescriptorSet0.vp_c14)._m0[280].x;
    }
    float _264 = _258;
    bool _266 = _80 == 288;
    float _268 = _264;
    if (_194)
    {
        _262 = (*spvDescriptorSet0.vp_c14)._m0[280].z;
    }
    float _270 = _262;
    int _272 = min(_244, 15);
    bool _274 = _80 == 304;
    float _276 = _270;
    if (_210)
    {
        _268 = (*spvDescriptorSet0.vp_c14)._m0[281].x;
    }
    float _278 = _268;
    float _280 = float(_272);
    float _282 = _278;
    if (_210)
    {
        _276 = (*spvDescriptorSet0.vp_c14)._m0[281].z;
    }
    float _284 = _276;
    int _286 = _272 << 4;
    int _288 = _286 + 4288;
    float _290 = _284;
    if (_220)
    {
        _282 = (*spvDescriptorSet0.vp_c14)._m0[282].x;
    }
    float _292 = _282;
    bool _294 = _80 == 320;
    float _296 = -_280;
    float _298 = _296 + (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _300 = _292;
    if (_220)
    {
        _290 = (*spvDescriptorSet0.vp_c14)._m0[282].z;
    }
    float _302 = _290;
    float _304 = _302;
    if (_232)
    {
        _300 = (*spvDescriptorSet0.vp_c14)._m0[283].x;
    }
    float _306 = _300;
    float _308 = _298 + 1.0;
    bool _310 = _80 == 336;
    float _312 = _306;
    if (_232)
    {
        _304 = (*spvDescriptorSet0.vp_c14)._m0[283].z;
    }
    float _314 = _304;
    float _316 = _314;
    if (_246)
    {
        _312 = (*spvDescriptorSet0.vp_c14)._m0[284].x;
    }
    float _318 = _312;
    float _320 = exp2(_308);
    bool _322 = _80 == 352;
    float _324 = _318;
    if (_246)
    {
        _316 = (*spvDescriptorSet0.vp_c14)._m0[284].z;
    }
    float _326 = _316;
    float _328 = _326;
    if (_256)
    {
        _324 = (*spvDescriptorSet0.vp_c14)._m0[285].x;
    }
    float _330 = _324;
    bool _332 = _80 == 368;
    float _334 = _330;
    if (_256)
    {
        _328 = (*spvDescriptorSet0.vp_c14)._m0[285].z;
    }
    float _336 = _328;
    float _338 = _336;
    if (_266)
    {
        _334 = (*spvDescriptorSet0.vp_c14)._m0[286].x;
    }
    float _340 = _334;
    bool _342 = _80 == 384;
    float _344 = _340;
    if (_266)
    {
        _338 = (*spvDescriptorSet0.vp_c14)._m0[286].z;
    }
    float _346 = _338;
    float _348 = 1.0 / _320;
    float _350 = _346;
    if (_274)
    {
        _344 = (*spvDescriptorSet0.vp_c14)._m0[287].x;
    }
    float _352 = _344;
    bool _354 = _80 == 400;
    float _356 = _352;
    if (_274)
    {
        _350 = (*spvDescriptorSet0.vp_c14)._m0[287].z;
    }
    float _358 = _350;
    bool _360 = _80 == 416;
    float _362 = _358;
    if (_294)
    {
        _356 = (*spvDescriptorSet0.vp_c14)._m0[288].x;
    }
    float _364 = _356;
    float _366 = _364;
    if (_294)
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
    bool _374 = _80 == 432;
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
    bool _384 = _80 == 448;
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
    bool _394 = _80 == 464;
    float _396 = _392;
    if (_332)
    {
        _390 = (*spvDescriptorSet0.vp_c14)._m0[291].z;
    }
    float _398 = _390;
    float _400 = _398;
    if (_342)
    {
        _396 = (*spvDescriptorSet0.vp_c14)._m0[292].x;
    }
    float _402 = _396;
    bool _404 = _80 == 480;
    float _406 = _402;
    if (_342)
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
    bool _414 = _80 == 496;
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
    bool _424 = _80 == 512;
    float _426 = _422;
    if (_360)
    {
        _420 = (*spvDescriptorSet0.vp_c14)._m0[294].z;
    }
    float _428 = _420;
    bool _430 = _80 == 528;
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
    bool _444 = _80 == 544;
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
    bool _454 = _80 == 560;
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
    bool _464 = _80 == 576;
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
    bool _474 = _80 == 592;
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
    bool _484 = _80 == 608;
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
    bool _494 = _80 == 624;
    float _496 = _492;
    if (_430)
    {
        _490 = (*spvDescriptorSet0.vp_c14)._m0[301].z;
    }
    float _498 = _490;
    bool _500 = _80 == 640;
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
    bool _514 = _80 == 656;
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
    bool _524 = _80 == 672;
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
    bool _534 = _80 == 688;
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
    bool _544 = _80 == 704;
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
    bool _554 = _80 == 720;
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
    bool _564 = _80 == 736;
    float _566 = _562;
    if (_500)
    {
        _560 = (*spvDescriptorSet0.vp_c14)._m0[308].z;
    }
    float _568 = _560;
    bool _570 = _80 == 752;
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
    float _600 = _348 * _598;
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
    float _610 = _600 * _67;
    float _612 = _606;
    if (_534)
    {
        _612 = (*spvDescriptorSet0.vp_c14)._m0[311].z;
    }
    float _614 = _612;
    float _616 = floor(_608);
    float _618 = _614;
    if (_544)
    {
        _618 = (*spvDescriptorSet0.vp_c14)._m0[312].z;
    }
    float _620 = _618;
    float _622 = _620;
    if (_554)
    {
        _622 = (*spvDescriptorSet0.vp_c14)._m0[313].z;
    }
    float _624 = _622;
    float _626 = _624;
    if (_564)
    {
        _626 = (*spvDescriptorSet0.vp_c14)._m0[314].z;
    }
    float _628 = _626;
    float _630 = _628;
    if (_570)
    {
        _630 = (*spvDescriptorSet0.vp_c14)._m0[315].z;
    }
    float _632 = _630;
    float _634 = floor(_610);
    float _636 = _320 * _632;
    float _638 = -_616;
    float _640 = _608 + _638;
    float _642 = _640 * 2.0;
    float _644 = -_640;
    float _646 = fma(_636, _644, _65);
    int _648 = _288 + 8;
    uint _651 = uint(int(uint(_648) >> uint(2)));
    uint _653 = uint(int(uint(int(_651)) >> uint(2)));
    int _655 = int(_651) & 3;
    float _657 = (*spvDescriptorSet0.vp_c14)._m0[int(_653)][_655];
    int _659 = int(_651) + 1;
    uint _661 = uint(int(uint(_659) >> uint(2)));
    int _663 = _659 & 3;
    float _665 = (*spvDescriptorSet0.vp_c14)._m0[int(_661)][_663];
    float _667 = -_634;
    float _669 = _610 + _667;
    float _671 = floor(_642);
    float _673 = _669 * 2.0;
    float _675 = -_669;
    float _677 = fma(_636, _675, _67);
    float _679 = floor(_673);
    float _681 = _636 * _671;
    float _683 = _681 * 0.5;
    float _685 = _683 + _646;
    float _687 = fma(_71, _685, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _689 = _636 * _679;
    float _691 = _689 * 0.5;
    float _693 = fma(_78, _685, (*spvDescriptorSet0.vp_c15)._m0[3].z);
    float _695 = fma(_685, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _697 = _691 + _677;
    float _699 = -_687;
    float _701 = _699 + _693;
    float _703 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _705 = _695 + _703;
    float _707 = fma(_697, _701, _687);
    float _709 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _711 = _707 + _709;
    float _713 = fma(_697, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _715 = _711 * _711;
    float _717 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _719 = _713 + _717;
    float _721 = fma(_705, _705, _715);
    float _723 = fma(_719, _719, _721);
    float _725 = sqrt(_723);
    float _727 = -_665;
    float _729 = fma(_725, _657, _727);
    float _731 = precise::clamp(_729, 0.0, 1.0);
    float _733 = -_691;
    float _735 = fma(_733, _731, _697);
    float _737 = -_683;
    float _739 = fma(_737, _731, _685);
    float _741 = fma(_735, (*spvDescriptorSet0.vp_c15)._m0[6].x, (*spvDescriptorSet0.vp_c15)._m0[6].w);
    float _743 = fma(_739, (*spvDescriptorSet0.vp_c15)._m0[6].x, (*spvDescriptorSet0.vp_c15)._m0[6].z);
    float _745 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _741);
    float _747 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _743);
    float2 _2568 = float2(_747, _745);
    float _749 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2568, float2(0.0), isnan(_2568)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2568, float2(0.0), isnan(_2568)), level(0.0)).x;
    float _751 = fma(_735, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _753 = fma(_739, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _755 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _757 = _751 + _755;
    float _759 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _761 = _753 + _759;
    float _763 = _757 * _757;
    float _765 = fma(_761, _761, _763);
    float _767 = sqrt(_765);
    bool _769 = _767 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _771 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _773 = _767 + _771;
    float _775 = (*spvDescriptorSet0.vp_c15)._m0[4].x;
    float _777 = _767;
    float _779 = _669;
    float _781 = _765;
    float _783 = _735;
    if (_769)
    {
        float _785 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        _775 = _785;
    }
    float _787 = _775;
    float _789 = _787;
    float _791 = (*spvDescriptorSet0.vp_c14)._m0[0].y;
    if (_769)
    {
        float _793 = _773 * _787;
        _777 = _793;
    }
    float _795 = _777;
    float _797 = fma(_739, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].z);
    if (_769)
    {
        float _799 = rsqrt(_765);
        _789 = _799;
    }
    float _801 = _789;
    float _803 = fma(_735, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].w);
    float _805 = _801;
    if (_769)
    {
        float _807 = _795 * 0.15915493667125701904296875;
        _779 = _807;
    }
    float _809 = _779;
    float _811 = _795;
    if (_769)
    {
        float _813 = _809 * 6.283185482025146484375;
        float _815 = sin(_813);
        _811 = _815;
    }
    float _817 = _811;
    if (!_769)
    {
        _781 = _753;
    }
    float _819 = _781;
    float _821 = _657;
    float _823 = _819;
    if (_769)
    {
        float _825 = _809 * 6.283185482025146484375;
        float _827 = cos(_825);
        _821 = _827;
    }
    float _829 = _821;
    float _831 = fma(_749, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    if (_769)
    {
        float _833 = _831 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        _791 = _833;
    }
    float _835 = _791;
    float _837 = _831 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _839 = _835;
    if (_769)
    {
        float _841 = fma(_817, _835, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        _839 = _841;
    }
    float _843 = _839;
    float _845 = fma(_739, (*spvDescriptorSet0.vp_c15)._m0[8].x, (*spvDescriptorSet0.vp_c15)._m0[8].z);
    float _847 = fma(_735, (*spvDescriptorSet0.vp_c15)._m0[8].x, (*spvDescriptorSet0.vp_c15)._m0[8].w);
    float _849 = fma(_753, (*spvDescriptorSet0.vp_c4)._m0[2].x, _837);
    float _851 = 0.0;
    float _853 = _843;
    if (_769)
    {
        float _855 = _801 * _843;
        _851 = _855;
    }
    float _857 = _851;
    if (_769)
    {
        float _859 = _829 + (-1.0);
        _853 = _859;
    }
    float _861 = _853;
    float _863 = _861;
    if (!_769)
    {
        _805 = _831;
    }
    float _865 = _805;
    float _867 = fma(_751, (*spvDescriptorSet0.vp_c4)._m0[2].z, _849);
    float _869 = _865;
    if (_769)
    {
        float _871 = fma(_761, _857, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        _823 = _871;
    }
    float _873 = _823;
    float _875 = 0.0;
    if (_769)
    {
        float _877 = _861 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        _875 = _877;
    }
    float _879 = _875;
    if (!_769)
    {
        _863 = _751;
    }
    float _881 = _863;
    float _883 = _881;
    if (_769)
    {
        float _885 = fma(_757, _857, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        _883 = _885;
    }
    float _887 = _883;
    float _889 = _867 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    if (_769)
    {
        float _891 = fma(_831, _829, _879);
        _869 = _891;
    }
    float _893 = _869;
    float _895 = _893 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    if (_769)
    {
        float _897 = _893 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        _783 = _897;
    }
    float _899 = _783;
    float _901 = _893 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _903 = fma(_873, (*spvDescriptorSet0.vp_c4)._m0[1].x, _895);
    float _905 = _899;
    float _907 = _901;
    if (_769)
    {
        float _909 = fma(_873, (*spvDescriptorSet0.vp_c4)._m0[2].x, _899);
        _905 = _909;
    }
    float _911 = _905;
    float _913 = fma(_873, (*spvDescriptorSet0.vp_c4)._m0[0].x, _901);
    float _915 = fma(_887, (*spvDescriptorSet0.vp_c4)._m0[1].z, _903);
    float _917 = _911;
    if (_769)
    {
        float _919 = fma(_887, (*spvDescriptorSet0.vp_c4)._m0[2].z, _911);
        _917 = _919;
    }
    float _921 = _917;
    float _923 = fma(_887, (*spvDescriptorSet0.vp_c4)._m0[0].z, _913);
    int _925 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[40].w) & 2;
    bool _927 = _925 != 0;
    float _929 = _915 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    if (!_769)
    {
        _907 = _889;
    }
    float _931 = _907;
    float _933 = _923 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _935 = _931;
    if (_769)
    {
        float _937 = _921 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _935 = _937;
    }
    float _939 = _935;
    float _941 = _929 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _943 = _929 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _945 = _929 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _947 = _929 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _949 = fma(_933, (*spvDescriptorSet0.vp_c4)._m0[8].x, _941);
    float _951 = fma(_933, (*spvDescriptorSet0.vp_c4)._m0[7].x, _943);
    float _953 = fma(_933, (*spvDescriptorSet0.vp_c4)._m0[9].x, _945);
    float _955 = fma(_933, (*spvDescriptorSet0.vp_c4)._m0[10].x, _947);
    float _957 = fma(_939, (*spvDescriptorSet0.vp_c4)._m0[8].z, _949);
    float _959 = fma(_939, (*spvDescriptorSet0.vp_c4)._m0[7].z, _951);
    float _961 = fma(_939, (*spvDescriptorSet0.vp_c4)._m0[9].z, _953);
    float _963 = fma(_939, (*spvDescriptorSet0.vp_c4)._m0[10].z, _955);
    float _965 = _957 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _967 = _959 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _969 = _961 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _971 = _963 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    bool _973 = !_927;
    float _975;
    float _977;
    float _979;
    int _981;
    int _983;
    int _985;
    int _987;
    int _989;
    int _991;
    int _993;
    int _995;
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
    float _1025;
    float _1027;
    float _1029;
    float _1031;
    int _1033;
    float _1035;
    float _1037;
    if (!_973)
    {
        _975 = (*spvDescriptorSet0.vp_c9)._m0[919].x;
        _977 = (*spvDescriptorSet0.vp_c9)._m0[919].y;
        _979 = (*spvDescriptorSet0.vp_c9)._m0[919].z;
        _981 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[919].w);
        _983 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].x);
        _985 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].y);
        _987 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].z);
        _989 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].w);
        _991 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].x);
        _993 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].y);
        _995 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].w);
        _997 = (*spvDescriptorSet0.vp_c9)._m0[922].y;
        _999 = (*spvDescriptorSet0.vp_c9)._m0[923].y;
        _1001 = (*spvDescriptorSet0.vp_c9)._m0[916].w;
        _1003 = (*spvDescriptorSet0.vp_c9)._m0[917].x;
        _1005 = (*spvDescriptorSet0.vp_c9)._m0[922].x;
        _1007 = (*spvDescriptorSet0.vp_c9)._m0[923].x;
        _1009 = (*spvDescriptorSet0.vp_c9)._m0[916].x;
        _1011 = (*spvDescriptorSet0.vp_c9)._m0[917].y;
        _1013 = (*spvDescriptorSet0.vp_c9)._m0[922].z;
        _1015 = (*spvDescriptorSet0.vp_c9)._m0[923].z;
        _1017 = (*spvDescriptorSet0.vp_c9)._m0[916].y;
        _1019 = (*spvDescriptorSet0.vp_c9)._m0[922].w;
        _1021 = (*spvDescriptorSet0.vp_c9)._m0[923].w;
        _1023 = (*spvDescriptorSet0.vp_c9)._m0[917].z;
        _1025 = (*spvDescriptorSet0.vp_c9)._m0[916].z;
        _1027 = (*spvDescriptorSet0.vp_c9)._m0[917].w;
        _1029 = (*spvDescriptorSet0.vp_c9)._m0[918].y;
        _1031 = (*spvDescriptorSet0.vp_c9)._m0[918].x;
        _1033 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].z);
        _1035 = (*spvDescriptorSet0.vp_c9)._m0[918].z;
        _1037 = (*spvDescriptorSet0.vp_c9)._m0[918].w;
        _1039 = true;
    }
    else
    {
        float _1041 = fma(_753, 6.2500002968590706586837768554688e-05, 0.5);
        float _1043 = fma(_751, 6.2500002968590706586837768554688e-05, 0.5);
        float3 _3091 = float3(_1041, _1043, float(0));
        float3 _3095 = select(_3091, float3(0.0), isnan(_3091));
        float4 _1046 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _3095.xy, uint(rint(_3095.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _3095.xy, uint(rint(_3095.z)), level(0.0)).xyzw;
        float _1048 = _1046.x;
        float _1050 = _1046.y;
        float _1052 = _1046.z;
        float _1054 = _1046.w;
        float3 _3110 = float3(_1041, _1043, float(1));
        float3 _3112 = select(_3110, float3(0.0), isnan(_3110));
        float4 _1056 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _3112.xy, uint(rint(_3112.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _3112.xy, uint(rint(_3112.z)), level(0.0)).xyzw;
        float _1058 = _1056.x;
        float _1060 = _1056.y;
        float _1062 = _1056.z;
        float _1064 = _1056.w;
        float3 _3127 = float3(_1041, _1043, float(2));
        float3 _3129 = select(_3127, float3(0.0), isnan(_3127));
        float4 _1066 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _3129.xy, uint(rint(_3129.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _3129.xy, uint(rint(_3129.z)), level(0.0)).xyzw;
        float _1068 = _1066.x;
        float _1070 = _1066.y;
        float _1072 = _1066.z;
        float _1074 = _1066.w;
        float3 _3144 = float3(_1041, _1043, float(3));
        float3 _3146 = select(_3144, float3(0.0), isnan(_3144));
        float4 _1076 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _3146.xy, uint(rint(_3146.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _3146.xy, uint(rint(_3146.z)), level(0.0)).xyzw;
        float _1078 = _1076.x;
        float _1080 = _1076.y;
        float _1082 = _1076.z;
        float _1084 = _1076.w;
        float3 _3161 = float3(_1041, _1043, float(4));
        float3 _3163 = select(_3161, float3(0.0), isnan(_3161));
        float4 _1086 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _3163.xy, uint(rint(_3163.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _3163.xy, uint(rint(_3163.z)), level(0.0)).xyzw;
        float _1088 = _1086.x;
        float _1090 = _1086.y;
        float _1092 = _1086.z;
        float _1094 = _1086.w;
        float3 _3179 = float3(_1041, _1043, float(5));
        float3 _3181 = select(_3179, float3(0.0), isnan(_3179));
        float4 _1096 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _3181.xy, uint(rint(_3181.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _3181.xy, uint(rint(_3181.z)), level(0.0)).xyzw;
        float _1098 = _1096.x;
        float _1100 = _1096.y;
        float _1102 = _1096.z;
        float _1104 = _1096.w;
        float3 _3196 = float3(_1041, _1043, float(6));
        float3 _3198 = select(_3196, float3(0.0), isnan(_3196));
        float4 _1106 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _3198.xy, uint(rint(_3198.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _3198.xy, uint(rint(_3198.z)), level(0.0)).xyzw;
        float _1108 = _1106.x;
        float _1110 = _1106.y;
        float _1112 = _1106.z;
        float _1114 = _1106.w;
        float3 _3213 = float3(_1041, _1043, float(7));
        float3 _3215 = select(_3213, float3(0.0), isnan(_3213));
        float4 _1116 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _3215.xy, uint(rint(_3215.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _3215.xy, uint(rint(_3215.z)), level(0.0)).xyzw;
        float _1118 = _1116.x;
        float _1120 = _1116.y;
        float _1122 = _1116.z;
        float _1124 = _1116.w;
        _975 = _1078;
        _977 = _1080;
        _979 = _1082;
        _981 = as_type<int>(_1084);
        _983 = as_type<int>(_1088);
        _985 = as_type<int>(_1090);
        _987 = as_type<int>(_1092);
        _989 = as_type<int>(_1094);
        _991 = as_type<int>(_1098);
        _993 = as_type<int>(_1100);
        _995 = as_type<int>(_1104);
        _997 = _1110;
        _999 = _1120;
        _1001 = _1054;
        _1003 = _1058;
        _1005 = _1108;
        _1007 = _1118;
        _1009 = _1048;
        _1011 = _1060;
        _1013 = _1112;
        _1015 = _1122;
        _1017 = _1050;
        _1019 = _1114;
        _1021 = _1124;
        _1023 = _1062;
        _1025 = _1052;
        _1027 = _1064;
        _1029 = _1070;
        _1031 = _1068;
        _1033 = as_type<int>(_1102);
        _1035 = _1072;
        _1037 = _1074;
    }
    _1039 = false;
    float _1126 = _975;
    float _1128 = _977;
    float _1130 = _979;
    int _1132 = _981;
    int _1134 = _983;
    int _1136 = _985;
    int _1138 = _987;
    int _1140 = _989;
    int _1142 = _991;
    int _1144 = _993;
    int _1146 = _995;
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
    float _1176 = _1025;
    float _1178 = _1027;
    float _1180 = _1029;
    float _1182 = _1031;
    int _1184 = _1033;
    float _1186 = _1035;
    float _1188 = _1037;
    float _1190 = -(*spvDescriptorSet0.vp_c4)._m0[12].w;
    float _1192 = _831 + _1190;
    float _1194 = -(*spvDescriptorSet0.vp_c4)._m0[11].w;
    float _1196 = _753 + _1194;
    float _1198 = -(*spvDescriptorSet0.vp_c4)._m0[13].w;
    float _1200 = _751 + _1198;
    out.m_43.x = _753;
    out.m_43.y = _831;
    out.m_43.z = _751;
    float _1202 = _1192 * _1192;
    float _1204 = _1126 * 0.88622701168060302734375;
    float _1206 = _1128 * 0.88622701168060302734375;
    out.m_45.x = _845;
    float _1208 = fma(_1196, _1196, _1202);
    float _1210 = _1130 * 0.88622701168060302734375;
    float _1212 = _927 ? as_type<float>(_1132) : 0.0;
    out.gl_Position.x = _967;
    out.gl_Position.y = _965;
    out.gl_Position.z = _969;
    out.gl_Position.w = _971;
    float _1214 = fma(_1200, _1200, _1208);
    float _1216 = _927 ? _1204 : 0.0;
    float _1218 = _927 ? as_type<float>(_1134) : 0.0;
    out.m_47.z = _797;
    out.m_47.w = _803;
    float _1220 = _927 ? as_type<float>(_1136) : 0.0;
    float _1222 = rsqrt(_1214);
    float _1224 = _927 ? _1206 : 0.0;
    out.m_45.y = _847;
    float _1226 = _927 ? _1210 : 0.0;
    float _1228 = _927 ? as_type<float>(_1138) : 0.0;
    out.m_49.w = _889;
    float _1230 = _927 ? as_type<float>(_1140) : 0.0;
    float _1232 = _927 ? as_type<float>(_1142) : 0.0;
    float _1234 = _927 ? as_type<float>(_1144) : 0.0;
    float _1236 = _927 ? as_type<float>(_1146) : 0.0;
    float _1238 = _1222 * 1.02332699298858642578125;
    float _1240 = _1200 * _1222;
    float _1242 = _1192 * _1238;
    float _1244 = _1240 * (-1.02332699298858642578125);
    float _1246 = _1196 * _1238;
    float _1248 = _1242 * _1148;
    float _1250 = _1242 * _1150;
    float _1252 = _1242 * _1152;
    float _1254 = _1242 * _1154;
    float _1256 = fma(_1156, 0.88622701168060302734375, _1248);
    float _1258 = fma(_1158, 0.88622701168060302734375, _1250);
    float _1260 = fma(_1160, 0.88622701168060302734375, _1252);
    float _1262 = _1242 * _1162;
    float _1264 = fma(_1244, _1164, _1256);
    float _1266 = fma(_1244, _1166, _1258);
    float _1268 = fma(_1212, _1242, _1216);
    float _1270 = fma(_1168, 0.88622701168060302734375, _1254);
    float _1272 = fma(_1246, _1170, _1264);
    float _1274 = fma(_1246, _1172, _1266);
    float _1276 = fma(_1244, _1174, _1260);
    float _1278 = fma(_1176, 0.88622701168060302734375, _1262);
    float _1280 = fma(_1218, _1242, _1224);
    float _1282 = precise::max(0.0, _1272);
    float _1284 = fma(_1220, _1242, _1226);
    float _1286 = precise::max(0.0, _1274);
    float _1288 = fma(_1228, _1244, _1268);
    float _1290 = fma(_1244, _1178, _1270);
    float _1292 = _1282 * 0.31830990314483642578125;
    float _1294 = precise::clamp(_1292, 0.0, 1.0);
    float _1296 = fma(_1246, _1180, _1276);
    float _1298 = _1286 * 0.31830990314483642578125;
    float _1300 = precise::clamp(_1298, 0.0, 1.0);
    float _1302 = fma(_1244, _1182, _1278);
    float _1304 = fma(_1230, _1244, _1280);
    float _1306 = fma(_1232, _1244, _1284);
    float _1308 = _1294 * 0.88622701168060302734375;
    float _1310 = -_1300;
    float _1312 = _1310 + 1.0;
    float _1314 = _927 ? as_type<float>(_1184) : 0.0;
    float _1316 = fma(_1234, _1246, _1288);
    float _1318 = fma(_1246, _1186, _1290);
    float _1320 = precise::max(0.0, _1296);
    float _1322 = fma(_1246, _1188, _1302);
    float _1324 = _1308 * (*spvDescriptorSet0.vp_c9)._m0[991].x;
    float _1326 = fma(_1312, (*spvDescriptorSet0.vp_c9)._m0[37].y, _1300);
    float _1328 = fma(_1314, _1246, _1304);
    float _1330 = fma(_1236, _1246, _1306);
    float _1332 = precise::max(0.0, _1316);
    float _1334 = fma(_1320, (*spvDescriptorSet0.vp_c9)._m0[68].x, _1324);
    float _1336 = precise::max(0.0, _1318);
    float _1338 = _1308 * (*spvDescriptorSet0.vp_c9)._m0[991].y;
    float _1340 = precise::max(0.0, _1322);
    float _1342 = _1326 * (*spvDescriptorSet0.vp_c9)._m0[40].z;
    float _1344 = _1308 * (*spvDescriptorSet0.vp_c9)._m0[991].z;
    float _1346 = precise::max(0.0, _1328);
    float _1348 = fma(_1336, (*spvDescriptorSet0.vp_c9)._m0[68].y, _1338);
    float _1350 = fma(_1332, _1342, _1334);
    float _1352 = precise::max(0.0, _1330);
    float _1354 = fma(_1340, (*spvDescriptorSet0.vp_c9)._m0[68].z, _1344);
    float _1356 = -_889;
    float _1358 = -(*spvDescriptorSet0.vp_c9)._m0[72].y;
    float _1360 = _1356 + _1358;
    float _1362 = fma(_1346, _1342, _1348);
    float _1364 = fma(_1352, _1342, _1354);
    float _1366 = _1360 * (*spvDescriptorSet0.vp_c9)._m0[72].z;
    out.m_45.w = (*spvDescriptorSet0.vp_c15)._m0[7].y;
    out.m_51.w = _1366;
    out.m_49.x = _1350;
    out.m_49.y = _1362;
    out.m_49.z = _1364;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

