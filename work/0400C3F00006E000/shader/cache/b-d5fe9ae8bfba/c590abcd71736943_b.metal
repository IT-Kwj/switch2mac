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
    float4 m_47 [[user(locn1)]];
    float4 m_43 [[user(locn5)]];
    float4 m_49 [[user(locn6)]];
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
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    bool _889 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _63 = in.m_40.x;
    float _65 = in.m_40.y;
    float _67 = -(*spvDescriptorSet0.vp_c15)._m0[3].x;
    float _69 = _67 + (*spvDescriptorSet0.vp_c15)._m0[3].y;
    int _72 = 16 + as_type<int>(as_type<float>(gl_BaseInstance));
    float _74 = -(*spvDescriptorSet0.vp_c15)._m0[3].z;
    float _76 = _74 + (*spvDescriptorSet0.vp_c15)._m0[3].w;
    int _78 = _72 << 4;
    bool _82 = _78 == 0;
    bool _84 = _78 == 16;
    bool _86 = _78 == 32;
    bool _88 = _78 == 48;
    bool _90 = _78 == 64;
    float _92 = fma(_69, _63, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _94 = fma(_76, _63, (*spvDescriptorSet0.vp_c15)._m0[3].z);
    bool _96 = _78 == 80;
    float _98 = as_type<float>(gl_BaseInstance);
    if (_82)
    {
        _98 = (*spvDescriptorSet0.vp_c14)._m0[268].x;
    }
    float _100 = _98;
    float _102 = -_92;
    float _104 = _102 + _94;
    bool _106 = _78 == 96;
    float _108 = fma(_104, _65, _92);
    float _110 = 0.0;
    float _112 = _100;
    if (_82)
    {
        _110 = (*spvDescriptorSet0.vp_c14)._m0[268].z;
    }
    float _114 = _110;
    float _116 = fma(_63, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _118 = _114;
    if (_84)
    {
        _112 = (*spvDescriptorSet0.vp_c14)._m0[269].x;
    }
    float _120 = _112;
    float _122 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _124 = _108 + _122;
    bool _126 = _78 == 112;
    float _128 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _130 = _116 + _128;
    float _132 = fma(_65, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _134 = _124 * _124;
    float _136 = _120;
    if (_84)
    {
        _118 = (*spvDescriptorSet0.vp_c14)._m0[269].z;
    }
    float _138 = _118;
    float _140 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _142 = _132 + _140;
    float _144 = fma(_130, _130, _134);
    float _146 = _138;
    if (_86)
    {
        _136 = (*spvDescriptorSet0.vp_c14)._m0[270].x;
    }
    float _148 = _136;
    bool _150 = _78 == 128;
    float _152 = fma(_142, _142, _144);
    float _154 = _148;
    if (_86)
    {
        _146 = (*spvDescriptorSet0.vp_c14)._m0[270].z;
    }
    float _156 = _146;
    float _158 = _156;
    if (_88)
    {
        _154 = (*spvDescriptorSet0.vp_c14)._m0[271].x;
    }
    float _160 = _154;
    float _162 = rsqrt(_152);
    bool _164 = _78 == 144;
    float _166 = _160;
    if (_88)
    {
        _158 = (*spvDescriptorSet0.vp_c14)._m0[271].z;
    }
    float _168 = _158;
    float _170 = _168;
    if (_90)
    {
        _166 = (*spvDescriptorSet0.vp_c14)._m0[272].x;
    }
    float _172 = _166;
    bool _174 = _78 == 160;
    float _176 = _172;
    if (_90)
    {
        _170 = (*spvDescriptorSet0.vp_c14)._m0[272].z;
    }
    float _178 = _170;
    float _180 = _178;
    if (_96)
    {
        _176 = (*spvDescriptorSet0.vp_c14)._m0[273].x;
    }
    float _182 = _176;
    bool _184 = _78 == 176;
    float _186 = _182;
    if (_96)
    {
        _180 = (*spvDescriptorSet0.vp_c14)._m0[273].z;
    }
    float _188 = _180;
    float _190 = _162 * (*spvDescriptorSet0.vp_c14)._m0[268].x;
    bool _192 = _78 == 192;
    float _194 = _188;
    if (_106)
    {
        _186 = (*spvDescriptorSet0.vp_c14)._m0[274].x;
    }
    float _196 = _186;
    float _198 = _196;
    if (_106)
    {
        _194 = (*spvDescriptorSet0.vp_c14)._m0[274].z;
    }
    float _200 = _194;
    float _202 = log2(_190);
    float _204 = _200;
    if (_126)
    {
        _198 = (*spvDescriptorSet0.vp_c14)._m0[275].x;
    }
    float _206 = _198;
    bool _208 = _78 == 208;
    float _210 = _206;
    if (_126)
    {
        _204 = (*spvDescriptorSet0.vp_c14)._m0[275].z;
    }
    float _212 = _204;
    float _214 = _212;
    if (_150)
    {
        _210 = (*spvDescriptorSet0.vp_c14)._m0[276].x;
    }
    float _216 = _210;
    bool _218 = _78 == 224;
    float _220 = _216;
    if (_150)
    {
        _214 = (*spvDescriptorSet0.vp_c14)._m0[276].z;
    }
    float _222 = _214;
    float _224 = _222;
    if (_164)
    {
        _220 = (*spvDescriptorSet0.vp_c14)._m0[277].x;
    }
    float _226 = _220;
    bool _228 = _78 == 240;
    float _230 = _202 + 1.2999999523162841796875;
    float _232 = _226;
    if (_164)
    {
        _224 = (*spvDescriptorSet0.vp_c14)._m0[277].z;
    }
    float _234 = _224;
    float _236 = _234;
    if (_174)
    {
        _232 = (*spvDescriptorSet0.vp_c14)._m0[278].x;
    }
    float _238 = _232;
    bool _240 = _78 == 256;
    float _242 = trunc(_230);
    int _244 = int(_242);
    float _246 = _238;
    if (_174)
    {
        _236 = (*spvDescriptorSet0.vp_c14)._m0[278].z;
    }
    float _248 = _236;
    float _250 = _248;
    if (_184)
    {
        _246 = (*spvDescriptorSet0.vp_c14)._m0[279].x;
    }
    float _252 = _246;
    bool _254 = _78 == 272;
    float _256 = _252;
    if (_184)
    {
        _250 = (*spvDescriptorSet0.vp_c14)._m0[279].z;
    }
    float _258 = _250;
    float _260 = _258;
    if (_192)
    {
        _256 = (*spvDescriptorSet0.vp_c14)._m0[280].x;
    }
    float _262 = _256;
    bool _264 = _78 == 288;
    float _266 = _262;
    if (_192)
    {
        _260 = (*spvDescriptorSet0.vp_c14)._m0[280].z;
    }
    float _268 = _260;
    bool _270 = _78 == 304;
    int _272 = min(_244, 15);
    float _274 = _268;
    if (_208)
    {
        _266 = (*spvDescriptorSet0.vp_c14)._m0[281].x;
    }
    float _276 = _266;
    float _278 = _276;
    if (_208)
    {
        _274 = (*spvDescriptorSet0.vp_c14)._m0[281].z;
    }
    float _280 = _274;
    float _282 = float(_272);
    float _284 = _280;
    if (_218)
    {
        _278 = (*spvDescriptorSet0.vp_c14)._m0[282].x;
    }
    float _286 = _278;
    int _288 = _272 << 4;
    int _290 = _288 + 4288;
    bool _292 = _78 == 320;
    float _294 = _286;
    if (_218)
    {
        _284 = (*spvDescriptorSet0.vp_c14)._m0[282].z;
    }
    float _296 = _284;
    float _298 = -_282;
    float _300 = _298 + (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _302 = _296;
    if (_228)
    {
        _294 = (*spvDescriptorSet0.vp_c14)._m0[283].x;
    }
    float _304 = _294;
    bool _306 = _78 == 336;
    float _308 = _300 + 1.0;
    float _310 = _304;
    if (_228)
    {
        _302 = (*spvDescriptorSet0.vp_c14)._m0[283].z;
    }
    float _312 = _302;
    float _314 = _312;
    if (_240)
    {
        _310 = (*spvDescriptorSet0.vp_c14)._m0[284].x;
    }
    float _316 = _310;
    bool _318 = _78 == 352;
    float _320 = exp2(_308);
    float _322 = _316;
    if (_240)
    {
        _314 = (*spvDescriptorSet0.vp_c14)._m0[284].z;
    }
    float _324 = _314;
    float _326 = _324;
    if (_254)
    {
        _322 = (*spvDescriptorSet0.vp_c14)._m0[285].x;
    }
    float _328 = _322;
    bool _330 = _78 == 368;
    float _332 = _328;
    if (_254)
    {
        _326 = (*spvDescriptorSet0.vp_c14)._m0[285].z;
    }
    float _334 = _326;
    float _336 = _334;
    if (_264)
    {
        _332 = (*spvDescriptorSet0.vp_c14)._m0[286].x;
    }
    float _338 = _332;
    bool _340 = _78 == 384;
    float _342 = _338;
    if (_264)
    {
        _336 = (*spvDescriptorSet0.vp_c14)._m0[286].z;
    }
    float _344 = _336;
    float _346 = _344;
    if (_270)
    {
        _342 = (*spvDescriptorSet0.vp_c14)._m0[287].x;
    }
    float _348 = _342;
    float _350 = 1.0 / _320;
    bool _352 = _78 == 400;
    float _354 = _348;
    if (_270)
    {
        _346 = (*spvDescriptorSet0.vp_c14)._m0[287].z;
    }
    float _356 = _346;
    bool _358 = _78 == 416;
    float _360 = _356;
    if (_292)
    {
        _354 = (*spvDescriptorSet0.vp_c14)._m0[288].x;
    }
    float _362 = _354;
    float _364 = _362;
    if (_292)
    {
        _360 = (*spvDescriptorSet0.vp_c14)._m0[288].z;
    }
    float _366 = _360;
    float _368 = _366;
    if (_306)
    {
        _364 = (*spvDescriptorSet0.vp_c14)._m0[289].x;
    }
    float _370 = _364;
    bool _372 = _78 == 432;
    float _374 = _370;
    if (_306)
    {
        _368 = (*spvDescriptorSet0.vp_c14)._m0[289].z;
    }
    float _376 = _368;
    float _378 = _376;
    if (_318)
    {
        _374 = (*spvDescriptorSet0.vp_c14)._m0[290].x;
    }
    float _380 = _374;
    bool _382 = _78 == 448;
    float _384 = _380;
    if (_318)
    {
        _378 = (*spvDescriptorSet0.vp_c14)._m0[290].z;
    }
    float _386 = _378;
    float _388 = _386;
    if (_330)
    {
        _384 = (*spvDescriptorSet0.vp_c14)._m0[291].x;
    }
    float _390 = _384;
    bool _392 = _78 == 464;
    float _394 = _390;
    if (_330)
    {
        _388 = (*spvDescriptorSet0.vp_c14)._m0[291].z;
    }
    float _396 = _388;
    float _398 = _396;
    if (_340)
    {
        _394 = (*spvDescriptorSet0.vp_c14)._m0[292].x;
    }
    float _400 = _394;
    bool _402 = _78 == 480;
    float _404 = _400;
    if (_340)
    {
        _398 = (*spvDescriptorSet0.vp_c14)._m0[292].z;
    }
    float _406 = _398;
    float _408 = _406;
    if (_352)
    {
        _404 = (*spvDescriptorSet0.vp_c14)._m0[293].x;
    }
    float _410 = _404;
    bool _412 = _78 == 496;
    float _414 = _410;
    if (_352)
    {
        _408 = (*spvDescriptorSet0.vp_c14)._m0[293].z;
    }
    float _416 = _408;
    float _418 = _416;
    if (_358)
    {
        _414 = (*spvDescriptorSet0.vp_c14)._m0[294].x;
    }
    float _420 = _414;
    bool _422 = _78 == 512;
    float _424 = _420;
    if (_358)
    {
        _418 = (*spvDescriptorSet0.vp_c14)._m0[294].z;
    }
    float _426 = _418;
    bool _428 = _78 == 528;
    float _430 = _426;
    if (_372)
    {
        _424 = (*spvDescriptorSet0.vp_c14)._m0[295].x;
    }
    float _432 = _424;
    float _434 = _432;
    if (_372)
    {
        _430 = (*spvDescriptorSet0.vp_c14)._m0[295].z;
    }
    float _436 = _430;
    float _438 = _436;
    if (_382)
    {
        _434 = (*spvDescriptorSet0.vp_c14)._m0[296].x;
    }
    float _440 = _434;
    bool _442 = _78 == 544;
    float _444 = _440;
    if (_382)
    {
        _438 = (*spvDescriptorSet0.vp_c14)._m0[296].z;
    }
    float _446 = _438;
    float _448 = _446;
    if (_392)
    {
        _444 = (*spvDescriptorSet0.vp_c14)._m0[297].x;
    }
    float _450 = _444;
    bool _452 = _78 == 560;
    float _454 = _450;
    if (_392)
    {
        _448 = (*spvDescriptorSet0.vp_c14)._m0[297].z;
    }
    float _456 = _448;
    float _458 = _456;
    if (_402)
    {
        _454 = (*spvDescriptorSet0.vp_c14)._m0[298].x;
    }
    float _460 = _454;
    bool _462 = _78 == 576;
    float _464 = _460;
    if (_402)
    {
        _458 = (*spvDescriptorSet0.vp_c14)._m0[298].z;
    }
    float _466 = _458;
    float _468 = _466;
    if (_412)
    {
        _464 = (*spvDescriptorSet0.vp_c14)._m0[299].x;
    }
    float _470 = _464;
    bool _472 = _78 == 592;
    float _474 = _470;
    if (_412)
    {
        _468 = (*spvDescriptorSet0.vp_c14)._m0[299].z;
    }
    float _476 = _468;
    float _478 = _476;
    if (_422)
    {
        _474 = (*spvDescriptorSet0.vp_c14)._m0[300].x;
    }
    float _480 = _474;
    bool _482 = _78 == 608;
    float _484 = _480;
    if (_422)
    {
        _478 = (*spvDescriptorSet0.vp_c14)._m0[300].z;
    }
    float _486 = _478;
    float _488 = _486;
    if (_428)
    {
        _484 = (*spvDescriptorSet0.vp_c14)._m0[301].x;
    }
    float _490 = _484;
    bool _492 = _78 == 624;
    float _494 = _490;
    if (_428)
    {
        _488 = (*spvDescriptorSet0.vp_c14)._m0[301].z;
    }
    float _496 = _488;
    bool _498 = _78 == 640;
    float _500 = _496;
    if (_442)
    {
        _494 = (*spvDescriptorSet0.vp_c14)._m0[302].x;
    }
    float _502 = _494;
    float _504 = _502;
    if (_442)
    {
        _500 = (*spvDescriptorSet0.vp_c14)._m0[302].z;
    }
    float _506 = _500;
    float _508 = _506;
    if (_452)
    {
        _504 = (*spvDescriptorSet0.vp_c14)._m0[303].x;
    }
    float _510 = _504;
    bool _512 = _78 == 656;
    float _514 = _510;
    if (_452)
    {
        _508 = (*spvDescriptorSet0.vp_c14)._m0[303].z;
    }
    float _516 = _508;
    float _518 = _516;
    if (_462)
    {
        _514 = (*spvDescriptorSet0.vp_c14)._m0[304].x;
    }
    float _520 = _514;
    bool _522 = _78 == 672;
    float _524 = _520;
    if (_462)
    {
        _518 = (*spvDescriptorSet0.vp_c14)._m0[304].z;
    }
    float _526 = _518;
    float _528 = _526;
    if (_472)
    {
        _524 = (*spvDescriptorSet0.vp_c14)._m0[305].x;
    }
    float _530 = _524;
    bool _532 = _78 == 688;
    float _534 = _530;
    if (_472)
    {
        _528 = (*spvDescriptorSet0.vp_c14)._m0[305].z;
    }
    float _536 = _528;
    float _538 = _536;
    if (_482)
    {
        _534 = (*spvDescriptorSet0.vp_c14)._m0[306].x;
    }
    float _540 = _534;
    bool _542 = _78 == 704;
    float _544 = _540;
    if (_482)
    {
        _538 = (*spvDescriptorSet0.vp_c14)._m0[306].z;
    }
    float _546 = _538;
    float _548 = _546;
    if (_492)
    {
        _544 = (*spvDescriptorSet0.vp_c14)._m0[307].x;
    }
    float _550 = _544;
    bool _552 = _78 == 720;
    float _554 = _550;
    if (_492)
    {
        _548 = (*spvDescriptorSet0.vp_c14)._m0[307].z;
    }
    float _556 = _548;
    float _558 = _556;
    if (_498)
    {
        _554 = (*spvDescriptorSet0.vp_c14)._m0[308].x;
    }
    float _560 = _554;
    bool _562 = _78 == 736;
    float _564 = _560;
    if (_498)
    {
        _558 = (*spvDescriptorSet0.vp_c14)._m0[308].z;
    }
    float _566 = _558;
    bool _568 = _78 == 752;
    float _570 = _566;
    if (_512)
    {
        _564 = (*spvDescriptorSet0.vp_c14)._m0[309].x;
    }
    float _572 = _564;
    float _574 = _572;
    if (_522)
    {
        _574 = (*spvDescriptorSet0.vp_c14)._m0[310].x;
    }
    float _576 = _574;
    float _578 = _576;
    if (_532)
    {
        _578 = (*spvDescriptorSet0.vp_c14)._m0[311].x;
    }
    float _580 = _578;
    float _582 = _580;
    if (_542)
    {
        _582 = (*spvDescriptorSet0.vp_c14)._m0[312].x;
    }
    float _584 = _582;
    float _586 = _584;
    if (_552)
    {
        _586 = (*spvDescriptorSet0.vp_c14)._m0[313].x;
    }
    float _588 = _586;
    float _590 = _588;
    if (_562)
    {
        _590 = (*spvDescriptorSet0.vp_c14)._m0[314].x;
    }
    float _592 = _590;
    float _594 = _592;
    if (_568)
    {
        _594 = (*spvDescriptorSet0.vp_c14)._m0[315].x;
    }
    float _596 = _594;
    float _598 = _350 * _596;
    if (_512)
    {
        _570 = (*spvDescriptorSet0.vp_c14)._m0[309].z;
    }
    float _600 = _570;
    float _602 = _600;
    if (_522)
    {
        _602 = (*spvDescriptorSet0.vp_c14)._m0[310].z;
    }
    float _604 = _602;
    float _606 = _598 * _63;
    float _608 = _598 * _65;
    float _610 = _604;
    if (_532)
    {
        _610 = (*spvDescriptorSet0.vp_c14)._m0[311].z;
    }
    float _612 = _610;
    float _614 = floor(_606);
    float _616 = _612;
    if (_542)
    {
        _616 = (*spvDescriptorSet0.vp_c14)._m0[312].z;
    }
    float _618 = _616;
    float _620 = _618;
    if (_552)
    {
        _620 = (*spvDescriptorSet0.vp_c14)._m0[313].z;
    }
    float _622 = _620;
    float _624 = _622;
    if (_562)
    {
        _624 = (*spvDescriptorSet0.vp_c14)._m0[314].z;
    }
    float _626 = _624;
    float _628 = _626;
    if (_568)
    {
        _628 = (*spvDescriptorSet0.vp_c14)._m0[315].z;
    }
    float _630 = _628;
    float _632 = floor(_608);
    float _634 = _320 * _630;
    float _636 = -_614;
    float _638 = _606 + _636;
    float _640 = _638 * 2.0;
    float _642 = -_638;
    float _644 = fma(_634, _642, _63);
    int _646 = _290 + 8;
    uint _649 = uint(int(uint(_646) >> uint(2)));
    uint _651 = uint(int(uint(int(_649)) >> uint(2)));
    int _653 = int(_649) & 3;
    float _655 = (*spvDescriptorSet0.vp_c14)._m0[int(_651)][_653];
    int _657 = int(_649) + 1;
    uint _659 = uint(int(uint(_657) >> uint(2)));
    int _661 = _657 & 3;
    float _663 = (*spvDescriptorSet0.vp_c14)._m0[int(_659)][_661];
    float _665 = -_632;
    float _667 = _608 + _665;
    float _669 = floor(_640);
    float _671 = _667 * 2.0;
    float _673 = -_667;
    float _675 = fma(_634, _673, _65);
    float _677 = floor(_671);
    float _679 = _634 * _669;
    float _681 = _679 * 0.5;
    float _683 = _681 + _644;
    float _685 = fma(_69, _683, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _687 = _634 * _677;
    float _689 = _687 * 0.5;
    float _691 = fma(_76, _683, (*spvDescriptorSet0.vp_c15)._m0[3].z);
    float _693 = fma(_683, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _695 = _689 + _675;
    float _697 = -_685;
    float _699 = _697 + _691;
    float _701 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _703 = _693 + _701;
    float _705 = fma(_695, _699, _685);
    float _707 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _709 = _705 + _707;
    float _711 = fma(_695, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _713 = _709 * _709;
    float _715 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _717 = _711 + _715;
    float _719 = fma(_703, _703, _713);
    float _721 = fma(_717, _717, _719);
    float _723 = sqrt(_721);
    float _725 = -_663;
    float _727 = fma(_723, _655, _725);
    float _729 = precise::clamp(_727, 0.0, 1.0);
    float _731 = -_681;
    float _733 = fma(_731, _729, _683);
    float _735 = -_689;
    float _737 = fma(_735, _729, _695);
    float _739 = fma(_733, (*spvDescriptorSet0.vp_c15)._m0[6].x, (*spvDescriptorSet0.vp_c15)._m0[6].z);
    float _741 = fma(_737, (*spvDescriptorSet0.vp_c15)._m0[6].x, (*spvDescriptorSet0.vp_c15)._m0[6].w);
    float _743 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _739);
    float _745 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _741);
    float2 _2410 = float2(_743, _745);
    float _747 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2410, float2(0.0), isnan(_2410)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2410, float2(0.0), isnan(_2410)), level(0.0)).x;
    float _749 = fma(_733, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _751 = fma(_737, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _753 = fma(_733, (*spvDescriptorSet0.vp_c15)._m0[8].x, (*spvDescriptorSet0.vp_c15)._m0[8].z);
    float _755 = fma(_737, (*spvDescriptorSet0.vp_c15)._m0[8].x, (*spvDescriptorSet0.vp_c15)._m0[8].w);
    float _757 = fma(_733, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].z);
    float _759 = fma(_737, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].w);
    int _761 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[40].w) & 2;
    bool _763 = _761 != 0;
    float _765 = fma(_747, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _767 = _765 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _769 = _765 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _771 = _765 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _773 = fma(_749, (*spvDescriptorSet0.vp_c4)._m0[1].x, _767);
    float _775 = fma(_749, (*spvDescriptorSet0.vp_c4)._m0[0].x, _769);
    float _777 = fma(_749, (*spvDescriptorSet0.vp_c4)._m0[2].x, _771);
    float _779 = fma(_751, (*spvDescriptorSet0.vp_c4)._m0[1].z, _773);
    float _781 = fma(_751, (*spvDescriptorSet0.vp_c4)._m0[0].z, _775);
    float _783 = fma(_751, (*spvDescriptorSet0.vp_c4)._m0[2].z, _777);
    float _785 = _779 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _787 = _781 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _789 = _783 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _791 = _785 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _793 = _785 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _795 = _785 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _797 = _785 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _799 = fma(_787, (*spvDescriptorSet0.vp_c4)._m0[8].x, _791);
    float _801 = fma(_787, (*spvDescriptorSet0.vp_c4)._m0[7].x, _793);
    float _803 = fma(_787, (*spvDescriptorSet0.vp_c4)._m0[9].x, _795);
    float _805 = fma(_787, (*spvDescriptorSet0.vp_c4)._m0[10].x, _797);
    float _807 = fma(_789, (*spvDescriptorSet0.vp_c4)._m0[8].z, _799);
    float _809 = fma(_789, (*spvDescriptorSet0.vp_c4)._m0[7].z, _801);
    float _811 = fma(_789, (*spvDescriptorSet0.vp_c4)._m0[9].z, _803);
    float _813 = fma(_789, (*spvDescriptorSet0.vp_c4)._m0[10].z, _805);
    float _815 = _807 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _817 = _809 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _819 = _811 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _821 = _813 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    bool _823 = !_763;
    float _825;
    float _827;
    float _829;
    int _831;
    int _833;
    int _835;
    int _837;
    int _839;
    int _841;
    int _843;
    int _845;
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
    float _877;
    float _879;
    int _881;
    float _883;
    float _885;
    float _887;
    if (!_823)
    {
        _825 = (*spvDescriptorSet0.vp_c9)._m0[919].x;
        _827 = (*spvDescriptorSet0.vp_c9)._m0[919].y;
        _829 = (*spvDescriptorSet0.vp_c9)._m0[919].z;
        _831 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[919].w);
        _833 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].x);
        _835 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].y);
        _837 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].z);
        _839 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].w);
        _841 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].x);
        _843 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].y);
        _845 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].w);
        _847 = (*spvDescriptorSet0.vp_c9)._m0[923].y;
        _849 = (*spvDescriptorSet0.vp_c9)._m0[922].y;
        _851 = (*spvDescriptorSet0.vp_c9)._m0[917].x;
        _853 = (*spvDescriptorSet0.vp_c9)._m0[916].w;
        _855 = (*spvDescriptorSet0.vp_c9)._m0[923].x;
        _857 = (*spvDescriptorSet0.vp_c9)._m0[922].x;
        _859 = (*spvDescriptorSet0.vp_c9)._m0[917].y;
        _861 = (*spvDescriptorSet0.vp_c9)._m0[916].y;
        _863 = (*spvDescriptorSet0.vp_c9)._m0[923].z;
        _865 = (*spvDescriptorSet0.vp_c9)._m0[922].z;
        _867 = (*spvDescriptorSet0.vp_c9)._m0[916].x;
        _869 = (*spvDescriptorSet0.vp_c9)._m0[916].z;
        _871 = (*spvDescriptorSet0.vp_c9)._m0[923].w;
        _873 = (*spvDescriptorSet0.vp_c9)._m0[922].w;
        _875 = (*spvDescriptorSet0.vp_c9)._m0[917].w;
        _877 = (*spvDescriptorSet0.vp_c9)._m0[917].z;
        _879 = (*spvDescriptorSet0.vp_c9)._m0[918].x;
        _881 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].z);
        _883 = (*spvDescriptorSet0.vp_c9)._m0[918].z;
        _885 = (*spvDescriptorSet0.vp_c9)._m0[918].y;
        _887 = (*spvDescriptorSet0.vp_c9)._m0[918].w;
        _889 = true;
    }
    else
    {
        float _891 = fma(_749, 6.2500002968590706586837768554688e-05, 0.5);
        float _893 = fma(_751, 6.2500002968590706586837768554688e-05, 0.5);
        float3 _2693 = float3(_891, _893, float(0));
        float3 _2697 = select(_2693, float3(0.0), isnan(_2693));
        float4 _896 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _2697.xy, uint(rint(_2697.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _2697.xy, uint(rint(_2697.z)), level(0.0)).xyzw;
        float _898 = _896.x;
        float _900 = _896.y;
        float _902 = _896.z;
        float _904 = _896.w;
        float3 _2712 = float3(_891, _893, float(1));
        float3 _2714 = select(_2712, float3(0.0), isnan(_2712));
        float4 _906 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _2714.xy, uint(rint(_2714.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _2714.xy, uint(rint(_2714.z)), level(0.0)).xyzw;
        float _908 = _906.x;
        float _910 = _906.y;
        float _912 = _906.z;
        float _914 = _906.w;
        float3 _2729 = float3(_891, _893, float(2));
        float3 _2731 = select(_2729, float3(0.0), isnan(_2729));
        float4 _916 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _2731.xy, uint(rint(_2731.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _2731.xy, uint(rint(_2731.z)), level(0.0)).xyzw;
        float _918 = _916.x;
        float _920 = _916.y;
        float _922 = _916.z;
        float _924 = _916.w;
        float3 _2746 = float3(_891, _893, float(3));
        float3 _2748 = select(_2746, float3(0.0), isnan(_2746));
        float4 _926 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _2748.xy, uint(rint(_2748.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _2748.xy, uint(rint(_2748.z)), level(0.0)).xyzw;
        float _928 = _926.x;
        float _930 = _926.y;
        float _932 = _926.z;
        float _934 = _926.w;
        float3 _2763 = float3(_891, _893, float(4));
        float3 _2765 = select(_2763, float3(0.0), isnan(_2763));
        float4 _936 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _2765.xy, uint(rint(_2765.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _2765.xy, uint(rint(_2765.z)), level(0.0)).xyzw;
        float _938 = _936.x;
        float _940 = _936.y;
        float _942 = _936.z;
        float _944 = _936.w;
        float3 _2781 = float3(_891, _893, float(5));
        float3 _2783 = select(_2781, float3(0.0), isnan(_2781));
        float4 _946 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _2783.xy, uint(rint(_2783.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _2783.xy, uint(rint(_2783.z)), level(0.0)).xyzw;
        float _948 = _946.x;
        float _950 = _946.y;
        float _952 = _946.z;
        float _954 = _946.w;
        float3 _2798 = float3(_891, _893, float(6));
        float3 _2800 = select(_2798, float3(0.0), isnan(_2798));
        float4 _956 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _2800.xy, uint(rint(_2800.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _2800.xy, uint(rint(_2800.z)), level(0.0)).xyzw;
        float _958 = _956.x;
        float _960 = _956.y;
        float _962 = _956.z;
        float _964 = _956.w;
        float3 _2815 = float3(_891, _893, float(7));
        float3 _2817 = select(_2815, float3(0.0), isnan(_2815));
        float4 _966 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _2817.xy, uint(rint(_2817.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _2817.xy, uint(rint(_2817.z)), level(0.0)).xyzw;
        float _968 = _966.x;
        float _970 = _966.y;
        float _972 = _966.z;
        float _974 = _966.w;
        _825 = _928;
        _827 = _930;
        _829 = _932;
        _831 = as_type<int>(_934);
        _833 = as_type<int>(_938);
        _835 = as_type<int>(_940);
        _837 = as_type<int>(_942);
        _839 = as_type<int>(_944);
        _841 = as_type<int>(_948);
        _843 = as_type<int>(_950);
        _845 = as_type<int>(_954);
        _847 = _970;
        _849 = _960;
        _851 = _908;
        _853 = _904;
        _855 = _968;
        _857 = _958;
        _859 = _910;
        _861 = _900;
        _863 = _972;
        _865 = _962;
        _867 = _898;
        _869 = _902;
        _871 = _974;
        _873 = _964;
        _875 = _914;
        _877 = _912;
        _879 = _918;
        _881 = as_type<int>(_952);
        _883 = _922;
        _885 = _920;
        _887 = _924;
    }
    _889 = false;
    float _976 = _825;
    float _978 = _827;
    float _980 = _829;
    int _982 = _831;
    int _984 = _833;
    int _986 = _835;
    int _988 = _837;
    int _990 = _839;
    int _992 = _841;
    int _994 = _843;
    int _996 = _845;
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
    float _1028 = _877;
    float _1030 = _879;
    int _1032 = _881;
    float _1034 = _883;
    float _1036 = _885;
    float _1038 = _887;
    float _1040 = -(*spvDescriptorSet0.vp_c4)._m0[12].w;
    float _1042 = _765 + _1040;
    float _1044 = -(*spvDescriptorSet0.vp_c4)._m0[11].w;
    float _1046 = _749 + _1044;
    float _1048 = -(*spvDescriptorSet0.vp_c4)._m0[13].w;
    float _1050 = _751 + _1048;
    out.gl_Position.x = _817;
    out.gl_Position.y = _815;
    out.gl_Position.z = _819;
    out.gl_Position.w = _821;
    float _1052 = _1042 * _1042;
    float _1054 = _976 * 0.88622701168060302734375;
    float _1056 = _978 * 0.88622701168060302734375;
    float _1058 = _980 * 0.88622701168060302734375;
    float _1060 = fma(_1046, _1046, _1052);
    float _1062 = _763 ? as_type<float>(_982) : 0.0;
    out.m_43.x = _749;
    out.m_43.y = _765;
    out.m_43.z = _751;
    float _1064 = _763 ? as_type<float>(_984) : 0.0;
    float _1066 = fma(_1050, _1050, _1060);
    float _1068 = _763 ? as_type<float>(_986) : 0.0;
    out.m_45.z = _757;
    out.m_45.w = _759;
    float _1070 = _763 ? _1054 : 0.0;
    float _1072 = _763 ? _1056 : 0.0;
    float _1074 = rsqrt(_1066);
    float _1076 = _763 ? _1058 : 0.0;
    out.m_47.x = _753;
    float _1078 = _763 ? as_type<float>(_988) : 0.0;
    float _1080 = _763 ? as_type<float>(_990) : 0.0;
    out.m_47.y = _755;
    float _1082 = _763 ? as_type<float>(_992) : 0.0;
    float _1084 = _763 ? as_type<float>(_994) : 0.0;
    float _1086 = _763 ? as_type<float>(_996) : 0.0;
    float _1088 = _1074 * 1.02332699298858642578125;
    float _1090 = _1050 * _1074;
    float _1092 = _1042 * _1088;
    float _1094 = _1090 * (-1.02332699298858642578125);
    float _1096 = _1046 * _1088;
    float _1098 = _1092 * _998;
    float _1100 = _1092 * _1000;
    float _1102 = _1092 * _1002;
    float _1104 = _1092 * _1004;
    float _1106 = fma(_1006, 0.88622701168060302734375, _1098);
    float _1108 = fma(_1008, 0.88622701168060302734375, _1100);
    float _1110 = _1092 * _1010;
    float _1112 = fma(_1012, 0.88622701168060302734375, _1102);
    float _1114 = fma(_1094, _1014, _1106);
    float _1116 = fma(_1094, _1016, _1108);
    float _1118 = fma(_1018, 0.88622701168060302734375, _1104);
    float _1120 = fma(_1020, 0.88622701168060302734375, _1110);
    float _1122 = fma(_1096, _1022, _1114);
    float _1124 = fma(_1096, _1024, _1116);
    float _1126 = fma(_1062, _1092, _1070);
    float _1128 = fma(_1064, _1092, _1072);
    float _1130 = fma(_1068, _1092, _1076);
    float _1132 = precise::max(0.0, _1122);
    float _1134 = fma(_1094, _1026, _1112);
    float _1136 = precise::max(0.0, _1124);
    float _1138 = fma(_1094, _1028, _1118);
    float _1140 = fma(_1094, _1030, _1120);
    float _1142 = _1132 * 0.31830990314483642578125;
    float _1144 = precise::clamp(_1142, 0.0, 1.0);
    float _1146 = fma(_1078, _1094, _1126);
    float _1148 = fma(_1080, _1094, _1128);
    float _1150 = fma(_1082, _1094, _1130);
    float _1152 = _1136 * 0.31830990314483642578125;
    float _1154 = precise::clamp(_1152, 0.0, 1.0);
    float _1156 = _763 ? as_type<float>(_1032) : 0.0;
    float _1158 = fma(_1096, _1034, _1134);
    float _1160 = fma(_1096, _1036, _1138);
    float _1162 = -_1144;
    float _1164 = _1162 + 1.0;
    float _1166 = fma(_1096, _1038, _1140);
    float _1168 = _1154 * 0.88622701168060302734375;
    float _1170 = fma(_1156, _1096, _1148);
    float _1172 = fma(_1084, _1096, _1146);
    float _1174 = fma(_1086, _1096, _1150);
    float _1176 = fma(_1164, (*spvDescriptorSet0.vp_c9)._m0[37].y, _1144);
    float _1178 = precise::max(0.0, _1158);
    float _1180 = _1168 * (*spvDescriptorSet0.vp_c9)._m0[991].y;
    float _1182 = precise::max(0.0, _1160);
    float _1184 = _1168 * (*spvDescriptorSet0.vp_c9)._m0[991].x;
    float _1186 = precise::max(0.0, _1166);
    float _1188 = _1168 * (*spvDescriptorSet0.vp_c9)._m0[991].z;
    float _1190 = precise::max(0.0, _1170);
    float _1192 = _1176 * (*spvDescriptorSet0.vp_c9)._m0[40].z;
    float _1194 = precise::max(0.0, _1172);
    float _1196 = fma(_1178, (*spvDescriptorSet0.vp_c9)._m0[68].y, _1180);
    float _1198 = precise::max(0.0, _1174);
    float _1200 = fma(_1182, (*spvDescriptorSet0.vp_c9)._m0[68].x, _1184);
    float _1202 = fma(_1186, (*spvDescriptorSet0.vp_c9)._m0[68].z, _1188);
    float _1204 = fma(_1190, _1192, _1196);
    float _1206 = fma(_1194, _1192, _1200);
    float _1208 = fma(_1198, _1192, _1202);
    out.m_47.w = (*spvDescriptorSet0.vp_c15)._m0[7].y;
    out.m_49.x = _1206;
    out.m_49.y = _1204;
    out.m_49.z = _1208;
    out.m_49.w = _789;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_BaseInstance [[base_instance]])
{
    main0_out out = {};
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    bool _889 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _63 = in.m_40.x;
    float _65 = in.m_40.y;
    float _67 = -(*spvDescriptorSet0.vp_c15)._m0[3].x;
    float _69 = _67 + (*spvDescriptorSet0.vp_c15)._m0[3].y;
    int _72 = 16 + as_type<int>(as_type<float>(gl_BaseInstance));
    float _74 = -(*spvDescriptorSet0.vp_c15)._m0[3].z;
    float _76 = _74 + (*spvDescriptorSet0.vp_c15)._m0[3].w;
    int _78 = _72 << 4;
    bool _82 = _78 == 0;
    bool _84 = _78 == 16;
    bool _86 = _78 == 32;
    bool _88 = _78 == 48;
    bool _90 = _78 == 64;
    float _92 = fma(_69, _63, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _94 = fma(_76, _63, (*spvDescriptorSet0.vp_c15)._m0[3].z);
    bool _96 = _78 == 80;
    float _98 = as_type<float>(gl_BaseInstance);
    if (_82)
    {
        _98 = (*spvDescriptorSet0.vp_c14)._m0[268].x;
    }
    float _100 = _98;
    float _102 = -_92;
    float _104 = _102 + _94;
    bool _106 = _78 == 96;
    float _108 = fma(_104, _65, _92);
    float _110 = 0.0;
    float _112 = _100;
    if (_82)
    {
        _110 = (*spvDescriptorSet0.vp_c14)._m0[268].z;
    }
    float _114 = _110;
    float _116 = fma(_63, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _118 = _114;
    if (_84)
    {
        _112 = (*spvDescriptorSet0.vp_c14)._m0[269].x;
    }
    float _120 = _112;
    float _122 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _124 = _108 + _122;
    bool _126 = _78 == 112;
    float _128 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _130 = _116 + _128;
    float _132 = fma(_65, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _134 = _124 * _124;
    float _136 = _120;
    if (_84)
    {
        _118 = (*spvDescriptorSet0.vp_c14)._m0[269].z;
    }
    float _138 = _118;
    float _140 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _142 = _132 + _140;
    float _144 = fma(_130, _130, _134);
    float _146 = _138;
    if (_86)
    {
        _136 = (*spvDescriptorSet0.vp_c14)._m0[270].x;
    }
    float _148 = _136;
    bool _150 = _78 == 128;
    float _152 = fma(_142, _142, _144);
    float _154 = _148;
    if (_86)
    {
        _146 = (*spvDescriptorSet0.vp_c14)._m0[270].z;
    }
    float _156 = _146;
    float _158 = _156;
    if (_88)
    {
        _154 = (*spvDescriptorSet0.vp_c14)._m0[271].x;
    }
    float _160 = _154;
    float _162 = rsqrt(_152);
    bool _164 = _78 == 144;
    float _166 = _160;
    if (_88)
    {
        _158 = (*spvDescriptorSet0.vp_c14)._m0[271].z;
    }
    float _168 = _158;
    float _170 = _168;
    if (_90)
    {
        _166 = (*spvDescriptorSet0.vp_c14)._m0[272].x;
    }
    float _172 = _166;
    bool _174 = _78 == 160;
    float _176 = _172;
    if (_90)
    {
        _170 = (*spvDescriptorSet0.vp_c14)._m0[272].z;
    }
    float _178 = _170;
    float _180 = _178;
    if (_96)
    {
        _176 = (*spvDescriptorSet0.vp_c14)._m0[273].x;
    }
    float _182 = _176;
    bool _184 = _78 == 176;
    float _186 = _182;
    if (_96)
    {
        _180 = (*spvDescriptorSet0.vp_c14)._m0[273].z;
    }
    float _188 = _180;
    float _190 = _162 * (*spvDescriptorSet0.vp_c14)._m0[268].x;
    bool _192 = _78 == 192;
    float _194 = _188;
    if (_106)
    {
        _186 = (*spvDescriptorSet0.vp_c14)._m0[274].x;
    }
    float _196 = _186;
    float _198 = _196;
    if (_106)
    {
        _194 = (*spvDescriptorSet0.vp_c14)._m0[274].z;
    }
    float _200 = _194;
    float _202 = log2(_190);
    float _204 = _200;
    if (_126)
    {
        _198 = (*spvDescriptorSet0.vp_c14)._m0[275].x;
    }
    float _206 = _198;
    bool _208 = _78 == 208;
    float _210 = _206;
    if (_126)
    {
        _204 = (*spvDescriptorSet0.vp_c14)._m0[275].z;
    }
    float _212 = _204;
    float _214 = _212;
    if (_150)
    {
        _210 = (*spvDescriptorSet0.vp_c14)._m0[276].x;
    }
    float _216 = _210;
    bool _218 = _78 == 224;
    float _220 = _216;
    if (_150)
    {
        _214 = (*spvDescriptorSet0.vp_c14)._m0[276].z;
    }
    float _222 = _214;
    float _224 = _222;
    if (_164)
    {
        _220 = (*spvDescriptorSet0.vp_c14)._m0[277].x;
    }
    float _226 = _220;
    bool _228 = _78 == 240;
    float _230 = _202 + 1.2999999523162841796875;
    float _232 = _226;
    if (_164)
    {
        _224 = (*spvDescriptorSet0.vp_c14)._m0[277].z;
    }
    float _234 = _224;
    float _236 = _234;
    if (_174)
    {
        _232 = (*spvDescriptorSet0.vp_c14)._m0[278].x;
    }
    float _238 = _232;
    bool _240 = _78 == 256;
    float _242 = trunc(_230);
    int _244 = int(_242);
    float _246 = _238;
    if (_174)
    {
        _236 = (*spvDescriptorSet0.vp_c14)._m0[278].z;
    }
    float _248 = _236;
    float _250 = _248;
    if (_184)
    {
        _246 = (*spvDescriptorSet0.vp_c14)._m0[279].x;
    }
    float _252 = _246;
    bool _254 = _78 == 272;
    float _256 = _252;
    if (_184)
    {
        _250 = (*spvDescriptorSet0.vp_c14)._m0[279].z;
    }
    float _258 = _250;
    float _260 = _258;
    if (_192)
    {
        _256 = (*spvDescriptorSet0.vp_c14)._m0[280].x;
    }
    float _262 = _256;
    bool _264 = _78 == 288;
    float _266 = _262;
    if (_192)
    {
        _260 = (*spvDescriptorSet0.vp_c14)._m0[280].z;
    }
    float _268 = _260;
    bool _270 = _78 == 304;
    int _272 = min(_244, 15);
    float _274 = _268;
    if (_208)
    {
        _266 = (*spvDescriptorSet0.vp_c14)._m0[281].x;
    }
    float _276 = _266;
    float _278 = _276;
    if (_208)
    {
        _274 = (*spvDescriptorSet0.vp_c14)._m0[281].z;
    }
    float _280 = _274;
    float _282 = float(_272);
    float _284 = _280;
    if (_218)
    {
        _278 = (*spvDescriptorSet0.vp_c14)._m0[282].x;
    }
    float _286 = _278;
    int _288 = _272 << 4;
    int _290 = _288 + 4288;
    bool _292 = _78 == 320;
    float _294 = _286;
    if (_218)
    {
        _284 = (*spvDescriptorSet0.vp_c14)._m0[282].z;
    }
    float _296 = _284;
    float _298 = -_282;
    float _300 = _298 + (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _302 = _296;
    if (_228)
    {
        _294 = (*spvDescriptorSet0.vp_c14)._m0[283].x;
    }
    float _304 = _294;
    bool _306 = _78 == 336;
    float _308 = _300 + 1.0;
    float _310 = _304;
    if (_228)
    {
        _302 = (*spvDescriptorSet0.vp_c14)._m0[283].z;
    }
    float _312 = _302;
    float _314 = _312;
    if (_240)
    {
        _310 = (*spvDescriptorSet0.vp_c14)._m0[284].x;
    }
    float _316 = _310;
    bool _318 = _78 == 352;
    float _320 = exp2(_308);
    float _322 = _316;
    if (_240)
    {
        _314 = (*spvDescriptorSet0.vp_c14)._m0[284].z;
    }
    float _324 = _314;
    float _326 = _324;
    if (_254)
    {
        _322 = (*spvDescriptorSet0.vp_c14)._m0[285].x;
    }
    float _328 = _322;
    bool _330 = _78 == 368;
    float _332 = _328;
    if (_254)
    {
        _326 = (*spvDescriptorSet0.vp_c14)._m0[285].z;
    }
    float _334 = _326;
    float _336 = _334;
    if (_264)
    {
        _332 = (*spvDescriptorSet0.vp_c14)._m0[286].x;
    }
    float _338 = _332;
    bool _340 = _78 == 384;
    float _342 = _338;
    if (_264)
    {
        _336 = (*spvDescriptorSet0.vp_c14)._m0[286].z;
    }
    float _344 = _336;
    float _346 = _344;
    if (_270)
    {
        _342 = (*spvDescriptorSet0.vp_c14)._m0[287].x;
    }
    float _348 = _342;
    float _350 = 1.0 / _320;
    bool _352 = _78 == 400;
    float _354 = _348;
    if (_270)
    {
        _346 = (*spvDescriptorSet0.vp_c14)._m0[287].z;
    }
    float _356 = _346;
    bool _358 = _78 == 416;
    float _360 = _356;
    if (_292)
    {
        _354 = (*spvDescriptorSet0.vp_c14)._m0[288].x;
    }
    float _362 = _354;
    float _364 = _362;
    if (_292)
    {
        _360 = (*spvDescriptorSet0.vp_c14)._m0[288].z;
    }
    float _366 = _360;
    float _368 = _366;
    if (_306)
    {
        _364 = (*spvDescriptorSet0.vp_c14)._m0[289].x;
    }
    float _370 = _364;
    bool _372 = _78 == 432;
    float _374 = _370;
    if (_306)
    {
        _368 = (*spvDescriptorSet0.vp_c14)._m0[289].z;
    }
    float _376 = _368;
    float _378 = _376;
    if (_318)
    {
        _374 = (*spvDescriptorSet0.vp_c14)._m0[290].x;
    }
    float _380 = _374;
    bool _382 = _78 == 448;
    float _384 = _380;
    if (_318)
    {
        _378 = (*spvDescriptorSet0.vp_c14)._m0[290].z;
    }
    float _386 = _378;
    float _388 = _386;
    if (_330)
    {
        _384 = (*spvDescriptorSet0.vp_c14)._m0[291].x;
    }
    float _390 = _384;
    bool _392 = _78 == 464;
    float _394 = _390;
    if (_330)
    {
        _388 = (*spvDescriptorSet0.vp_c14)._m0[291].z;
    }
    float _396 = _388;
    float _398 = _396;
    if (_340)
    {
        _394 = (*spvDescriptorSet0.vp_c14)._m0[292].x;
    }
    float _400 = _394;
    bool _402 = _78 == 480;
    float _404 = _400;
    if (_340)
    {
        _398 = (*spvDescriptorSet0.vp_c14)._m0[292].z;
    }
    float _406 = _398;
    float _408 = _406;
    if (_352)
    {
        _404 = (*spvDescriptorSet0.vp_c14)._m0[293].x;
    }
    float _410 = _404;
    bool _412 = _78 == 496;
    float _414 = _410;
    if (_352)
    {
        _408 = (*spvDescriptorSet0.vp_c14)._m0[293].z;
    }
    float _416 = _408;
    float _418 = _416;
    if (_358)
    {
        _414 = (*spvDescriptorSet0.vp_c14)._m0[294].x;
    }
    float _420 = _414;
    bool _422 = _78 == 512;
    float _424 = _420;
    if (_358)
    {
        _418 = (*spvDescriptorSet0.vp_c14)._m0[294].z;
    }
    float _426 = _418;
    bool _428 = _78 == 528;
    float _430 = _426;
    if (_372)
    {
        _424 = (*spvDescriptorSet0.vp_c14)._m0[295].x;
    }
    float _432 = _424;
    float _434 = _432;
    if (_372)
    {
        _430 = (*spvDescriptorSet0.vp_c14)._m0[295].z;
    }
    float _436 = _430;
    float _438 = _436;
    if (_382)
    {
        _434 = (*spvDescriptorSet0.vp_c14)._m0[296].x;
    }
    float _440 = _434;
    bool _442 = _78 == 544;
    float _444 = _440;
    if (_382)
    {
        _438 = (*spvDescriptorSet0.vp_c14)._m0[296].z;
    }
    float _446 = _438;
    float _448 = _446;
    if (_392)
    {
        _444 = (*spvDescriptorSet0.vp_c14)._m0[297].x;
    }
    float _450 = _444;
    bool _452 = _78 == 560;
    float _454 = _450;
    if (_392)
    {
        _448 = (*spvDescriptorSet0.vp_c14)._m0[297].z;
    }
    float _456 = _448;
    float _458 = _456;
    if (_402)
    {
        _454 = (*spvDescriptorSet0.vp_c14)._m0[298].x;
    }
    float _460 = _454;
    bool _462 = _78 == 576;
    float _464 = _460;
    if (_402)
    {
        _458 = (*spvDescriptorSet0.vp_c14)._m0[298].z;
    }
    float _466 = _458;
    float _468 = _466;
    if (_412)
    {
        _464 = (*spvDescriptorSet0.vp_c14)._m0[299].x;
    }
    float _470 = _464;
    bool _472 = _78 == 592;
    float _474 = _470;
    if (_412)
    {
        _468 = (*spvDescriptorSet0.vp_c14)._m0[299].z;
    }
    float _476 = _468;
    float _478 = _476;
    if (_422)
    {
        _474 = (*spvDescriptorSet0.vp_c14)._m0[300].x;
    }
    float _480 = _474;
    bool _482 = _78 == 608;
    float _484 = _480;
    if (_422)
    {
        _478 = (*spvDescriptorSet0.vp_c14)._m0[300].z;
    }
    float _486 = _478;
    float _488 = _486;
    if (_428)
    {
        _484 = (*spvDescriptorSet0.vp_c14)._m0[301].x;
    }
    float _490 = _484;
    bool _492 = _78 == 624;
    float _494 = _490;
    if (_428)
    {
        _488 = (*spvDescriptorSet0.vp_c14)._m0[301].z;
    }
    float _496 = _488;
    bool _498 = _78 == 640;
    float _500 = _496;
    if (_442)
    {
        _494 = (*spvDescriptorSet0.vp_c14)._m0[302].x;
    }
    float _502 = _494;
    float _504 = _502;
    if (_442)
    {
        _500 = (*spvDescriptorSet0.vp_c14)._m0[302].z;
    }
    float _506 = _500;
    float _508 = _506;
    if (_452)
    {
        _504 = (*spvDescriptorSet0.vp_c14)._m0[303].x;
    }
    float _510 = _504;
    bool _512 = _78 == 656;
    float _514 = _510;
    if (_452)
    {
        _508 = (*spvDescriptorSet0.vp_c14)._m0[303].z;
    }
    float _516 = _508;
    float _518 = _516;
    if (_462)
    {
        _514 = (*spvDescriptorSet0.vp_c14)._m0[304].x;
    }
    float _520 = _514;
    bool _522 = _78 == 672;
    float _524 = _520;
    if (_462)
    {
        _518 = (*spvDescriptorSet0.vp_c14)._m0[304].z;
    }
    float _526 = _518;
    float _528 = _526;
    if (_472)
    {
        _524 = (*spvDescriptorSet0.vp_c14)._m0[305].x;
    }
    float _530 = _524;
    bool _532 = _78 == 688;
    float _534 = _530;
    if (_472)
    {
        _528 = (*spvDescriptorSet0.vp_c14)._m0[305].z;
    }
    float _536 = _528;
    float _538 = _536;
    if (_482)
    {
        _534 = (*spvDescriptorSet0.vp_c14)._m0[306].x;
    }
    float _540 = _534;
    bool _542 = _78 == 704;
    float _544 = _540;
    if (_482)
    {
        _538 = (*spvDescriptorSet0.vp_c14)._m0[306].z;
    }
    float _546 = _538;
    float _548 = _546;
    if (_492)
    {
        _544 = (*spvDescriptorSet0.vp_c14)._m0[307].x;
    }
    float _550 = _544;
    bool _552 = _78 == 720;
    float _554 = _550;
    if (_492)
    {
        _548 = (*spvDescriptorSet0.vp_c14)._m0[307].z;
    }
    float _556 = _548;
    float _558 = _556;
    if (_498)
    {
        _554 = (*spvDescriptorSet0.vp_c14)._m0[308].x;
    }
    float _560 = _554;
    bool _562 = _78 == 736;
    float _564 = _560;
    if (_498)
    {
        _558 = (*spvDescriptorSet0.vp_c14)._m0[308].z;
    }
    float _566 = _558;
    bool _568 = _78 == 752;
    float _570 = _566;
    if (_512)
    {
        _564 = (*spvDescriptorSet0.vp_c14)._m0[309].x;
    }
    float _572 = _564;
    float _574 = _572;
    if (_522)
    {
        _574 = (*spvDescriptorSet0.vp_c14)._m0[310].x;
    }
    float _576 = _574;
    float _578 = _576;
    if (_532)
    {
        _578 = (*spvDescriptorSet0.vp_c14)._m0[311].x;
    }
    float _580 = _578;
    float _582 = _580;
    if (_542)
    {
        _582 = (*spvDescriptorSet0.vp_c14)._m0[312].x;
    }
    float _584 = _582;
    float _586 = _584;
    if (_552)
    {
        _586 = (*spvDescriptorSet0.vp_c14)._m0[313].x;
    }
    float _588 = _586;
    float _590 = _588;
    if (_562)
    {
        _590 = (*spvDescriptorSet0.vp_c14)._m0[314].x;
    }
    float _592 = _590;
    float _594 = _592;
    if (_568)
    {
        _594 = (*spvDescriptorSet0.vp_c14)._m0[315].x;
    }
    float _596 = _594;
    float _598 = _350 * _596;
    if (_512)
    {
        _570 = (*spvDescriptorSet0.vp_c14)._m0[309].z;
    }
    float _600 = _570;
    float _602 = _600;
    if (_522)
    {
        _602 = (*spvDescriptorSet0.vp_c14)._m0[310].z;
    }
    float _604 = _602;
    float _606 = _598 * _63;
    float _608 = _598 * _65;
    float _610 = _604;
    if (_532)
    {
        _610 = (*spvDescriptorSet0.vp_c14)._m0[311].z;
    }
    float _612 = _610;
    float _614 = floor(_606);
    float _616 = _612;
    if (_542)
    {
        _616 = (*spvDescriptorSet0.vp_c14)._m0[312].z;
    }
    float _618 = _616;
    float _620 = _618;
    if (_552)
    {
        _620 = (*spvDescriptorSet0.vp_c14)._m0[313].z;
    }
    float _622 = _620;
    float _624 = _622;
    if (_562)
    {
        _624 = (*spvDescriptorSet0.vp_c14)._m0[314].z;
    }
    float _626 = _624;
    float _628 = _626;
    if (_568)
    {
        _628 = (*spvDescriptorSet0.vp_c14)._m0[315].z;
    }
    float _630 = _628;
    float _632 = floor(_608);
    float _634 = _320 * _630;
    float _636 = -_614;
    float _638 = _606 + _636;
    float _640 = _638 * 2.0;
    float _642 = -_638;
    float _644 = fma(_634, _642, _63);
    int _646 = _290 + 8;
    uint _649 = uint(int(uint(_646) >> uint(2)));
    uint _651 = uint(int(uint(int(_649)) >> uint(2)));
    int _653 = int(_649) & 3;
    float _655 = (*spvDescriptorSet0.vp_c14)._m0[int(_651)][_653];
    int _657 = int(_649) + 1;
    uint _659 = uint(int(uint(_657) >> uint(2)));
    int _661 = _657 & 3;
    float _663 = (*spvDescriptorSet0.vp_c14)._m0[int(_659)][_661];
    float _665 = -_632;
    float _667 = _608 + _665;
    float _669 = floor(_640);
    float _671 = _667 * 2.0;
    float _673 = -_667;
    float _675 = fma(_634, _673, _65);
    float _677 = floor(_671);
    float _679 = _634 * _669;
    float _681 = _679 * 0.5;
    float _683 = _681 + _644;
    float _685 = fma(_69, _683, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _687 = _634 * _677;
    float _689 = _687 * 0.5;
    float _691 = fma(_76, _683, (*spvDescriptorSet0.vp_c15)._m0[3].z);
    float _693 = fma(_683, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _695 = _689 + _675;
    float _697 = -_685;
    float _699 = _697 + _691;
    float _701 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _703 = _693 + _701;
    float _705 = fma(_695, _699, _685);
    float _707 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _709 = _705 + _707;
    float _711 = fma(_695, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _713 = _709 * _709;
    float _715 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _717 = _711 + _715;
    float _719 = fma(_703, _703, _713);
    float _721 = fma(_717, _717, _719);
    float _723 = sqrt(_721);
    float _725 = -_663;
    float _727 = fma(_723, _655, _725);
    float _729 = precise::clamp(_727, 0.0, 1.0);
    float _731 = -_681;
    float _733 = fma(_731, _729, _683);
    float _735 = -_689;
    float _737 = fma(_735, _729, _695);
    float _739 = fma(_733, (*spvDescriptorSet0.vp_c15)._m0[6].x, (*spvDescriptorSet0.vp_c15)._m0[6].z);
    float _741 = fma(_737, (*spvDescriptorSet0.vp_c15)._m0[6].x, (*spvDescriptorSet0.vp_c15)._m0[6].w);
    float _743 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _739);
    float _745 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _741);
    float2 _2410 = float2(_743, _745);
    float _747 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2410, float2(0.0), isnan(_2410)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2410, float2(0.0), isnan(_2410)), level(0.0)).x;
    float _749 = fma(_733, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _751 = fma(_737, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _753 = fma(_733, (*spvDescriptorSet0.vp_c15)._m0[8].x, (*spvDescriptorSet0.vp_c15)._m0[8].z);
    float _755 = fma(_737, (*spvDescriptorSet0.vp_c15)._m0[8].x, (*spvDescriptorSet0.vp_c15)._m0[8].w);
    float _757 = fma(_733, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].z);
    float _759 = fma(_737, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].w);
    int _761 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[40].w) & 2;
    bool _763 = _761 != 0;
    float _765 = fma(_747, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _767 = _765 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _769 = _765 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _771 = _765 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _773 = fma(_749, (*spvDescriptorSet0.vp_c4)._m0[1].x, _767);
    float _775 = fma(_749, (*spvDescriptorSet0.vp_c4)._m0[0].x, _769);
    float _777 = fma(_749, (*spvDescriptorSet0.vp_c4)._m0[2].x, _771);
    float _779 = fma(_751, (*spvDescriptorSet0.vp_c4)._m0[1].z, _773);
    float _781 = fma(_751, (*spvDescriptorSet0.vp_c4)._m0[0].z, _775);
    float _783 = fma(_751, (*spvDescriptorSet0.vp_c4)._m0[2].z, _777);
    float _785 = _779 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _787 = _781 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _789 = _783 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _791 = _785 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _793 = _785 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _795 = _785 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _797 = _785 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _799 = fma(_787, (*spvDescriptorSet0.vp_c4)._m0[8].x, _791);
    float _801 = fma(_787, (*spvDescriptorSet0.vp_c4)._m0[7].x, _793);
    float _803 = fma(_787, (*spvDescriptorSet0.vp_c4)._m0[9].x, _795);
    float _805 = fma(_787, (*spvDescriptorSet0.vp_c4)._m0[10].x, _797);
    float _807 = fma(_789, (*spvDescriptorSet0.vp_c4)._m0[8].z, _799);
    float _809 = fma(_789, (*spvDescriptorSet0.vp_c4)._m0[7].z, _801);
    float _811 = fma(_789, (*spvDescriptorSet0.vp_c4)._m0[9].z, _803);
    float _813 = fma(_789, (*spvDescriptorSet0.vp_c4)._m0[10].z, _805);
    float _815 = _807 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _817 = _809 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _819 = _811 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _821 = _813 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    bool _823 = !_763;
    float _825;
    float _827;
    float _829;
    int _831;
    int _833;
    int _835;
    int _837;
    int _839;
    int _841;
    int _843;
    int _845;
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
    float _877;
    float _879;
    int _881;
    float _883;
    float _885;
    float _887;
    if (!_823)
    {
        _825 = (*spvDescriptorSet0.vp_c9)._m0[919].x;
        _827 = (*spvDescriptorSet0.vp_c9)._m0[919].y;
        _829 = (*spvDescriptorSet0.vp_c9)._m0[919].z;
        _831 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[919].w);
        _833 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].x);
        _835 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].y);
        _837 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].z);
        _839 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].w);
        _841 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].x);
        _843 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].y);
        _845 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].w);
        _847 = (*spvDescriptorSet0.vp_c9)._m0[923].y;
        _849 = (*spvDescriptorSet0.vp_c9)._m0[922].y;
        _851 = (*spvDescriptorSet0.vp_c9)._m0[917].x;
        _853 = (*spvDescriptorSet0.vp_c9)._m0[916].w;
        _855 = (*spvDescriptorSet0.vp_c9)._m0[923].x;
        _857 = (*spvDescriptorSet0.vp_c9)._m0[922].x;
        _859 = (*spvDescriptorSet0.vp_c9)._m0[917].y;
        _861 = (*spvDescriptorSet0.vp_c9)._m0[916].y;
        _863 = (*spvDescriptorSet0.vp_c9)._m0[923].z;
        _865 = (*spvDescriptorSet0.vp_c9)._m0[922].z;
        _867 = (*spvDescriptorSet0.vp_c9)._m0[916].x;
        _869 = (*spvDescriptorSet0.vp_c9)._m0[916].z;
        _871 = (*spvDescriptorSet0.vp_c9)._m0[923].w;
        _873 = (*spvDescriptorSet0.vp_c9)._m0[922].w;
        _875 = (*spvDescriptorSet0.vp_c9)._m0[917].w;
        _877 = (*spvDescriptorSet0.vp_c9)._m0[917].z;
        _879 = (*spvDescriptorSet0.vp_c9)._m0[918].x;
        _881 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].z);
        _883 = (*spvDescriptorSet0.vp_c9)._m0[918].z;
        _885 = (*spvDescriptorSet0.vp_c9)._m0[918].y;
        _887 = (*spvDescriptorSet0.vp_c9)._m0[918].w;
        _889 = true;
    }
    else
    {
        float _891 = fma(_749, 6.2500002968590706586837768554688e-05, 0.5);
        float _893 = fma(_751, 6.2500002968590706586837768554688e-05, 0.5);
        float3 _2693 = float3(_891, _893, float(0));
        float3 _2697 = select(_2693, float3(0.0), isnan(_2693));
        float4 _896 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _2697.xy, uint(rint(_2697.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _2697.xy, uint(rint(_2697.z)), level(0.0)).xyzw;
        float _898 = _896.x;
        float _900 = _896.y;
        float _902 = _896.z;
        float _904 = _896.w;
        float3 _2712 = float3(_891, _893, float(1));
        float3 _2714 = select(_2712, float3(0.0), isnan(_2712));
        float4 _906 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _2714.xy, uint(rint(_2714.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _2714.xy, uint(rint(_2714.z)), level(0.0)).xyzw;
        float _908 = _906.x;
        float _910 = _906.y;
        float _912 = _906.z;
        float _914 = _906.w;
        float3 _2729 = float3(_891, _893, float(2));
        float3 _2731 = select(_2729, float3(0.0), isnan(_2729));
        float4 _916 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _2731.xy, uint(rint(_2731.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _2731.xy, uint(rint(_2731.z)), level(0.0)).xyzw;
        float _918 = _916.x;
        float _920 = _916.y;
        float _922 = _916.z;
        float _924 = _916.w;
        float3 _2746 = float3(_891, _893, float(3));
        float3 _2748 = select(_2746, float3(0.0), isnan(_2746));
        float4 _926 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _2748.xy, uint(rint(_2748.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _2748.xy, uint(rint(_2748.z)), level(0.0)).xyzw;
        float _928 = _926.x;
        float _930 = _926.y;
        float _932 = _926.z;
        float _934 = _926.w;
        float3 _2763 = float3(_891, _893, float(4));
        float3 _2765 = select(_2763, float3(0.0), isnan(_2763));
        float4 _936 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _2765.xy, uint(rint(_2765.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _2765.xy, uint(rint(_2765.z)), level(0.0)).xyzw;
        float _938 = _936.x;
        float _940 = _936.y;
        float _942 = _936.z;
        float _944 = _936.w;
        float3 _2781 = float3(_891, _893, float(5));
        float3 _2783 = select(_2781, float3(0.0), isnan(_2781));
        float4 _946 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _2783.xy, uint(rint(_2783.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _2783.xy, uint(rint(_2783.z)), level(0.0)).xyzw;
        float _948 = _946.x;
        float _950 = _946.y;
        float _952 = _946.z;
        float _954 = _946.w;
        float3 _2798 = float3(_891, _893, float(6));
        float3 _2800 = select(_2798, float3(0.0), isnan(_2798));
        float4 _956 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _2800.xy, uint(rint(_2800.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _2800.xy, uint(rint(_2800.z)), level(0.0)).xyzw;
        float _958 = _956.x;
        float _960 = _956.y;
        float _962 = _956.z;
        float _964 = _956.w;
        float3 _2815 = float3(_891, _893, float(7));
        float3 _2817 = select(_2815, float3(0.0), isnan(_2815));
        float4 _966 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _2817.xy, uint(rint(_2817.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _2817.xy, uint(rint(_2817.z)), level(0.0)).xyzw;
        float _968 = _966.x;
        float _970 = _966.y;
        float _972 = _966.z;
        float _974 = _966.w;
        _825 = _928;
        _827 = _930;
        _829 = _932;
        _831 = as_type<int>(_934);
        _833 = as_type<int>(_938);
        _835 = as_type<int>(_940);
        _837 = as_type<int>(_942);
        _839 = as_type<int>(_944);
        _841 = as_type<int>(_948);
        _843 = as_type<int>(_950);
        _845 = as_type<int>(_954);
        _847 = _970;
        _849 = _960;
        _851 = _908;
        _853 = _904;
        _855 = _968;
        _857 = _958;
        _859 = _910;
        _861 = _900;
        _863 = _972;
        _865 = _962;
        _867 = _898;
        _869 = _902;
        _871 = _974;
        _873 = _964;
        _875 = _914;
        _877 = _912;
        _879 = _918;
        _881 = as_type<int>(_952);
        _883 = _922;
        _885 = _920;
        _887 = _924;
    }
    _889 = false;
    float _976 = _825;
    float _978 = _827;
    float _980 = _829;
    int _982 = _831;
    int _984 = _833;
    int _986 = _835;
    int _988 = _837;
    int _990 = _839;
    int _992 = _841;
    int _994 = _843;
    int _996 = _845;
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
    float _1028 = _877;
    float _1030 = _879;
    int _1032 = _881;
    float _1034 = _883;
    float _1036 = _885;
    float _1038 = _887;
    float _1040 = -(*spvDescriptorSet0.vp_c4)._m0[12].w;
    float _1042 = _765 + _1040;
    float _1044 = -(*spvDescriptorSet0.vp_c4)._m0[11].w;
    float _1046 = _749 + _1044;
    float _1048 = -(*spvDescriptorSet0.vp_c4)._m0[13].w;
    float _1050 = _751 + _1048;
    out.gl_Position.x = _817;
    out.gl_Position.y = _815;
    out.gl_Position.z = _819;
    out.gl_Position.w = _821;
    float _1052 = _1042 * _1042;
    float _1054 = _976 * 0.88622701168060302734375;
    float _1056 = _978 * 0.88622701168060302734375;
    float _1058 = _980 * 0.88622701168060302734375;
    float _1060 = fma(_1046, _1046, _1052);
    float _1062 = _763 ? as_type<float>(_982) : 0.0;
    out.m_43.x = _749;
    out.m_43.y = _765;
    out.m_43.z = _751;
    float _1064 = _763 ? as_type<float>(_984) : 0.0;
    float _1066 = fma(_1050, _1050, _1060);
    float _1068 = _763 ? as_type<float>(_986) : 0.0;
    out.m_45.z = _757;
    out.m_45.w = _759;
    float _1070 = _763 ? _1054 : 0.0;
    float _1072 = _763 ? _1056 : 0.0;
    float _1074 = rsqrt(_1066);
    float _1076 = _763 ? _1058 : 0.0;
    out.m_47.x = _753;
    float _1078 = _763 ? as_type<float>(_988) : 0.0;
    float _1080 = _763 ? as_type<float>(_990) : 0.0;
    out.m_47.y = _755;
    float _1082 = _763 ? as_type<float>(_992) : 0.0;
    float _1084 = _763 ? as_type<float>(_994) : 0.0;
    float _1086 = _763 ? as_type<float>(_996) : 0.0;
    float _1088 = _1074 * 1.02332699298858642578125;
    float _1090 = _1050 * _1074;
    float _1092 = _1042 * _1088;
    float _1094 = _1090 * (-1.02332699298858642578125);
    float _1096 = _1046 * _1088;
    float _1098 = _1092 * _998;
    float _1100 = _1092 * _1000;
    float _1102 = _1092 * _1002;
    float _1104 = _1092 * _1004;
    float _1106 = fma(_1006, 0.88622701168060302734375, _1098);
    float _1108 = fma(_1008, 0.88622701168060302734375, _1100);
    float _1110 = _1092 * _1010;
    float _1112 = fma(_1012, 0.88622701168060302734375, _1102);
    float _1114 = fma(_1094, _1014, _1106);
    float _1116 = fma(_1094, _1016, _1108);
    float _1118 = fma(_1018, 0.88622701168060302734375, _1104);
    float _1120 = fma(_1020, 0.88622701168060302734375, _1110);
    float _1122 = fma(_1096, _1022, _1114);
    float _1124 = fma(_1096, _1024, _1116);
    float _1126 = fma(_1062, _1092, _1070);
    float _1128 = fma(_1064, _1092, _1072);
    float _1130 = fma(_1068, _1092, _1076);
    float _1132 = precise::max(0.0, _1122);
    float _1134 = fma(_1094, _1026, _1112);
    float _1136 = precise::max(0.0, _1124);
    float _1138 = fma(_1094, _1028, _1118);
    float _1140 = fma(_1094, _1030, _1120);
    float _1142 = _1132 * 0.31830990314483642578125;
    float _1144 = precise::clamp(_1142, 0.0, 1.0);
    float _1146 = fma(_1078, _1094, _1126);
    float _1148 = fma(_1080, _1094, _1128);
    float _1150 = fma(_1082, _1094, _1130);
    float _1152 = _1136 * 0.31830990314483642578125;
    float _1154 = precise::clamp(_1152, 0.0, 1.0);
    float _1156 = _763 ? as_type<float>(_1032) : 0.0;
    float _1158 = fma(_1096, _1034, _1134);
    float _1160 = fma(_1096, _1036, _1138);
    float _1162 = -_1144;
    float _1164 = _1162 + 1.0;
    float _1166 = fma(_1096, _1038, _1140);
    float _1168 = _1154 * 0.88622701168060302734375;
    float _1170 = fma(_1156, _1096, _1148);
    float _1172 = fma(_1084, _1096, _1146);
    float _1174 = fma(_1086, _1096, _1150);
    float _1176 = fma(_1164, (*spvDescriptorSet0.vp_c9)._m0[37].y, _1144);
    float _1178 = precise::max(0.0, _1158);
    float _1180 = _1168 * (*spvDescriptorSet0.vp_c9)._m0[991].y;
    float _1182 = precise::max(0.0, _1160);
    float _1184 = _1168 * (*spvDescriptorSet0.vp_c9)._m0[991].x;
    float _1186 = precise::max(0.0, _1166);
    float _1188 = _1168 * (*spvDescriptorSet0.vp_c9)._m0[991].z;
    float _1190 = precise::max(0.0, _1170);
    float _1192 = _1176 * (*spvDescriptorSet0.vp_c9)._m0[40].z;
    float _1194 = precise::max(0.0, _1172);
    float _1196 = fma(_1178, (*spvDescriptorSet0.vp_c9)._m0[68].y, _1180);
    float _1198 = precise::max(0.0, _1174);
    float _1200 = fma(_1182, (*spvDescriptorSet0.vp_c9)._m0[68].x, _1184);
    float _1202 = fma(_1186, (*spvDescriptorSet0.vp_c9)._m0[68].z, _1188);
    float _1204 = fma(_1190, _1192, _1196);
    float _1206 = fma(_1194, _1192, _1200);
    float _1208 = fma(_1198, _1192, _1202);
    out.m_47.w = (*spvDescriptorSet0.vp_c15)._m0[7].y;
    out.m_49.x = _1206;
    out.m_49.y = _1204;
    out.m_49.z = _1208;
    out.m_49.w = _789;
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
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    bool _889 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _63 = in.m_40.x;
    float _65 = in.m_40.y;
    float _67 = -(*spvDescriptorSet0.vp_c15)._m0[3].x;
    float _69 = _67 + (*spvDescriptorSet0.vp_c15)._m0[3].y;
    int _72 = 16 + as_type<int>(as_type<float>(gl_BaseInstance));
    float _74 = -(*spvDescriptorSet0.vp_c15)._m0[3].z;
    float _76 = _74 + (*spvDescriptorSet0.vp_c15)._m0[3].w;
    int _78 = _72 << 4;
    bool _82 = _78 == 0;
    bool _84 = _78 == 16;
    bool _86 = _78 == 32;
    bool _88 = _78 == 48;
    bool _90 = _78 == 64;
    float _92 = fma(_69, _63, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _94 = fma(_76, _63, (*spvDescriptorSet0.vp_c15)._m0[3].z);
    bool _96 = _78 == 80;
    float _98 = as_type<float>(gl_BaseInstance);
    if (_82)
    {
        _98 = (*spvDescriptorSet0.vp_c14)._m0[268].x;
    }
    float _100 = _98;
    float _102 = -_92;
    float _104 = _102 + _94;
    bool _106 = _78 == 96;
    float _108 = fma(_104, _65, _92);
    float _110 = 0.0;
    float _112 = _100;
    if (_82)
    {
        _110 = (*spvDescriptorSet0.vp_c14)._m0[268].z;
    }
    float _114 = _110;
    float _116 = fma(_63, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _118 = _114;
    if (_84)
    {
        _112 = (*spvDescriptorSet0.vp_c14)._m0[269].x;
    }
    float _120 = _112;
    float _122 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _124 = _108 + _122;
    bool _126 = _78 == 112;
    float _128 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _130 = _116 + _128;
    float _132 = fma(_65, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _134 = _124 * _124;
    float _136 = _120;
    if (_84)
    {
        _118 = (*spvDescriptorSet0.vp_c14)._m0[269].z;
    }
    float _138 = _118;
    float _140 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _142 = _132 + _140;
    float _144 = fma(_130, _130, _134);
    float _146 = _138;
    if (_86)
    {
        _136 = (*spvDescriptorSet0.vp_c14)._m0[270].x;
    }
    float _148 = _136;
    bool _150 = _78 == 128;
    float _152 = fma(_142, _142, _144);
    float _154 = _148;
    if (_86)
    {
        _146 = (*spvDescriptorSet0.vp_c14)._m0[270].z;
    }
    float _156 = _146;
    float _158 = _156;
    if (_88)
    {
        _154 = (*spvDescriptorSet0.vp_c14)._m0[271].x;
    }
    float _160 = _154;
    float _162 = rsqrt(_152);
    bool _164 = _78 == 144;
    float _166 = _160;
    if (_88)
    {
        _158 = (*spvDescriptorSet0.vp_c14)._m0[271].z;
    }
    float _168 = _158;
    float _170 = _168;
    if (_90)
    {
        _166 = (*spvDescriptorSet0.vp_c14)._m0[272].x;
    }
    float _172 = _166;
    bool _174 = _78 == 160;
    float _176 = _172;
    if (_90)
    {
        _170 = (*spvDescriptorSet0.vp_c14)._m0[272].z;
    }
    float _178 = _170;
    float _180 = _178;
    if (_96)
    {
        _176 = (*spvDescriptorSet0.vp_c14)._m0[273].x;
    }
    float _182 = _176;
    bool _184 = _78 == 176;
    float _186 = _182;
    if (_96)
    {
        _180 = (*spvDescriptorSet0.vp_c14)._m0[273].z;
    }
    float _188 = _180;
    float _190 = _162 * (*spvDescriptorSet0.vp_c14)._m0[268].x;
    bool _192 = _78 == 192;
    float _194 = _188;
    if (_106)
    {
        _186 = (*spvDescriptorSet0.vp_c14)._m0[274].x;
    }
    float _196 = _186;
    float _198 = _196;
    if (_106)
    {
        _194 = (*spvDescriptorSet0.vp_c14)._m0[274].z;
    }
    float _200 = _194;
    float _202 = log2(_190);
    float _204 = _200;
    if (_126)
    {
        _198 = (*spvDescriptorSet0.vp_c14)._m0[275].x;
    }
    float _206 = _198;
    bool _208 = _78 == 208;
    float _210 = _206;
    if (_126)
    {
        _204 = (*spvDescriptorSet0.vp_c14)._m0[275].z;
    }
    float _212 = _204;
    float _214 = _212;
    if (_150)
    {
        _210 = (*spvDescriptorSet0.vp_c14)._m0[276].x;
    }
    float _216 = _210;
    bool _218 = _78 == 224;
    float _220 = _216;
    if (_150)
    {
        _214 = (*spvDescriptorSet0.vp_c14)._m0[276].z;
    }
    float _222 = _214;
    float _224 = _222;
    if (_164)
    {
        _220 = (*spvDescriptorSet0.vp_c14)._m0[277].x;
    }
    float _226 = _220;
    bool _228 = _78 == 240;
    float _230 = _202 + 1.2999999523162841796875;
    float _232 = _226;
    if (_164)
    {
        _224 = (*spvDescriptorSet0.vp_c14)._m0[277].z;
    }
    float _234 = _224;
    float _236 = _234;
    if (_174)
    {
        _232 = (*spvDescriptorSet0.vp_c14)._m0[278].x;
    }
    float _238 = _232;
    bool _240 = _78 == 256;
    float _242 = trunc(_230);
    int _244 = int(_242);
    float _246 = _238;
    if (_174)
    {
        _236 = (*spvDescriptorSet0.vp_c14)._m0[278].z;
    }
    float _248 = _236;
    float _250 = _248;
    if (_184)
    {
        _246 = (*spvDescriptorSet0.vp_c14)._m0[279].x;
    }
    float _252 = _246;
    bool _254 = _78 == 272;
    float _256 = _252;
    if (_184)
    {
        _250 = (*spvDescriptorSet0.vp_c14)._m0[279].z;
    }
    float _258 = _250;
    float _260 = _258;
    if (_192)
    {
        _256 = (*spvDescriptorSet0.vp_c14)._m0[280].x;
    }
    float _262 = _256;
    bool _264 = _78 == 288;
    float _266 = _262;
    if (_192)
    {
        _260 = (*spvDescriptorSet0.vp_c14)._m0[280].z;
    }
    float _268 = _260;
    bool _270 = _78 == 304;
    int _272 = min(_244, 15);
    float _274 = _268;
    if (_208)
    {
        _266 = (*spvDescriptorSet0.vp_c14)._m0[281].x;
    }
    float _276 = _266;
    float _278 = _276;
    if (_208)
    {
        _274 = (*spvDescriptorSet0.vp_c14)._m0[281].z;
    }
    float _280 = _274;
    float _282 = float(_272);
    float _284 = _280;
    if (_218)
    {
        _278 = (*spvDescriptorSet0.vp_c14)._m0[282].x;
    }
    float _286 = _278;
    int _288 = _272 << 4;
    int _290 = _288 + 4288;
    bool _292 = _78 == 320;
    float _294 = _286;
    if (_218)
    {
        _284 = (*spvDescriptorSet0.vp_c14)._m0[282].z;
    }
    float _296 = _284;
    float _298 = -_282;
    float _300 = _298 + (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _302 = _296;
    if (_228)
    {
        _294 = (*spvDescriptorSet0.vp_c14)._m0[283].x;
    }
    float _304 = _294;
    bool _306 = _78 == 336;
    float _308 = _300 + 1.0;
    float _310 = _304;
    if (_228)
    {
        _302 = (*spvDescriptorSet0.vp_c14)._m0[283].z;
    }
    float _312 = _302;
    float _314 = _312;
    if (_240)
    {
        _310 = (*spvDescriptorSet0.vp_c14)._m0[284].x;
    }
    float _316 = _310;
    bool _318 = _78 == 352;
    float _320 = exp2(_308);
    float _322 = _316;
    if (_240)
    {
        _314 = (*spvDescriptorSet0.vp_c14)._m0[284].z;
    }
    float _324 = _314;
    float _326 = _324;
    if (_254)
    {
        _322 = (*spvDescriptorSet0.vp_c14)._m0[285].x;
    }
    float _328 = _322;
    bool _330 = _78 == 368;
    float _332 = _328;
    if (_254)
    {
        _326 = (*spvDescriptorSet0.vp_c14)._m0[285].z;
    }
    float _334 = _326;
    float _336 = _334;
    if (_264)
    {
        _332 = (*spvDescriptorSet0.vp_c14)._m0[286].x;
    }
    float _338 = _332;
    bool _340 = _78 == 384;
    float _342 = _338;
    if (_264)
    {
        _336 = (*spvDescriptorSet0.vp_c14)._m0[286].z;
    }
    float _344 = _336;
    float _346 = _344;
    if (_270)
    {
        _342 = (*spvDescriptorSet0.vp_c14)._m0[287].x;
    }
    float _348 = _342;
    float _350 = 1.0 / _320;
    bool _352 = _78 == 400;
    float _354 = _348;
    if (_270)
    {
        _346 = (*spvDescriptorSet0.vp_c14)._m0[287].z;
    }
    float _356 = _346;
    bool _358 = _78 == 416;
    float _360 = _356;
    if (_292)
    {
        _354 = (*spvDescriptorSet0.vp_c14)._m0[288].x;
    }
    float _362 = _354;
    float _364 = _362;
    if (_292)
    {
        _360 = (*spvDescriptorSet0.vp_c14)._m0[288].z;
    }
    float _366 = _360;
    float _368 = _366;
    if (_306)
    {
        _364 = (*spvDescriptorSet0.vp_c14)._m0[289].x;
    }
    float _370 = _364;
    bool _372 = _78 == 432;
    float _374 = _370;
    if (_306)
    {
        _368 = (*spvDescriptorSet0.vp_c14)._m0[289].z;
    }
    float _376 = _368;
    float _378 = _376;
    if (_318)
    {
        _374 = (*spvDescriptorSet0.vp_c14)._m0[290].x;
    }
    float _380 = _374;
    bool _382 = _78 == 448;
    float _384 = _380;
    if (_318)
    {
        _378 = (*spvDescriptorSet0.vp_c14)._m0[290].z;
    }
    float _386 = _378;
    float _388 = _386;
    if (_330)
    {
        _384 = (*spvDescriptorSet0.vp_c14)._m0[291].x;
    }
    float _390 = _384;
    bool _392 = _78 == 464;
    float _394 = _390;
    if (_330)
    {
        _388 = (*spvDescriptorSet0.vp_c14)._m0[291].z;
    }
    float _396 = _388;
    float _398 = _396;
    if (_340)
    {
        _394 = (*spvDescriptorSet0.vp_c14)._m0[292].x;
    }
    float _400 = _394;
    bool _402 = _78 == 480;
    float _404 = _400;
    if (_340)
    {
        _398 = (*spvDescriptorSet0.vp_c14)._m0[292].z;
    }
    float _406 = _398;
    float _408 = _406;
    if (_352)
    {
        _404 = (*spvDescriptorSet0.vp_c14)._m0[293].x;
    }
    float _410 = _404;
    bool _412 = _78 == 496;
    float _414 = _410;
    if (_352)
    {
        _408 = (*spvDescriptorSet0.vp_c14)._m0[293].z;
    }
    float _416 = _408;
    float _418 = _416;
    if (_358)
    {
        _414 = (*spvDescriptorSet0.vp_c14)._m0[294].x;
    }
    float _420 = _414;
    bool _422 = _78 == 512;
    float _424 = _420;
    if (_358)
    {
        _418 = (*spvDescriptorSet0.vp_c14)._m0[294].z;
    }
    float _426 = _418;
    bool _428 = _78 == 528;
    float _430 = _426;
    if (_372)
    {
        _424 = (*spvDescriptorSet0.vp_c14)._m0[295].x;
    }
    float _432 = _424;
    float _434 = _432;
    if (_372)
    {
        _430 = (*spvDescriptorSet0.vp_c14)._m0[295].z;
    }
    float _436 = _430;
    float _438 = _436;
    if (_382)
    {
        _434 = (*spvDescriptorSet0.vp_c14)._m0[296].x;
    }
    float _440 = _434;
    bool _442 = _78 == 544;
    float _444 = _440;
    if (_382)
    {
        _438 = (*spvDescriptorSet0.vp_c14)._m0[296].z;
    }
    float _446 = _438;
    float _448 = _446;
    if (_392)
    {
        _444 = (*spvDescriptorSet0.vp_c14)._m0[297].x;
    }
    float _450 = _444;
    bool _452 = _78 == 560;
    float _454 = _450;
    if (_392)
    {
        _448 = (*spvDescriptorSet0.vp_c14)._m0[297].z;
    }
    float _456 = _448;
    float _458 = _456;
    if (_402)
    {
        _454 = (*spvDescriptorSet0.vp_c14)._m0[298].x;
    }
    float _460 = _454;
    bool _462 = _78 == 576;
    float _464 = _460;
    if (_402)
    {
        _458 = (*spvDescriptorSet0.vp_c14)._m0[298].z;
    }
    float _466 = _458;
    float _468 = _466;
    if (_412)
    {
        _464 = (*spvDescriptorSet0.vp_c14)._m0[299].x;
    }
    float _470 = _464;
    bool _472 = _78 == 592;
    float _474 = _470;
    if (_412)
    {
        _468 = (*spvDescriptorSet0.vp_c14)._m0[299].z;
    }
    float _476 = _468;
    float _478 = _476;
    if (_422)
    {
        _474 = (*spvDescriptorSet0.vp_c14)._m0[300].x;
    }
    float _480 = _474;
    bool _482 = _78 == 608;
    float _484 = _480;
    if (_422)
    {
        _478 = (*spvDescriptorSet0.vp_c14)._m0[300].z;
    }
    float _486 = _478;
    float _488 = _486;
    if (_428)
    {
        _484 = (*spvDescriptorSet0.vp_c14)._m0[301].x;
    }
    float _490 = _484;
    bool _492 = _78 == 624;
    float _494 = _490;
    if (_428)
    {
        _488 = (*spvDescriptorSet0.vp_c14)._m0[301].z;
    }
    float _496 = _488;
    bool _498 = _78 == 640;
    float _500 = _496;
    if (_442)
    {
        _494 = (*spvDescriptorSet0.vp_c14)._m0[302].x;
    }
    float _502 = _494;
    float _504 = _502;
    if (_442)
    {
        _500 = (*spvDescriptorSet0.vp_c14)._m0[302].z;
    }
    float _506 = _500;
    float _508 = _506;
    if (_452)
    {
        _504 = (*spvDescriptorSet0.vp_c14)._m0[303].x;
    }
    float _510 = _504;
    bool _512 = _78 == 656;
    float _514 = _510;
    if (_452)
    {
        _508 = (*spvDescriptorSet0.vp_c14)._m0[303].z;
    }
    float _516 = _508;
    float _518 = _516;
    if (_462)
    {
        _514 = (*spvDescriptorSet0.vp_c14)._m0[304].x;
    }
    float _520 = _514;
    bool _522 = _78 == 672;
    float _524 = _520;
    if (_462)
    {
        _518 = (*spvDescriptorSet0.vp_c14)._m0[304].z;
    }
    float _526 = _518;
    float _528 = _526;
    if (_472)
    {
        _524 = (*spvDescriptorSet0.vp_c14)._m0[305].x;
    }
    float _530 = _524;
    bool _532 = _78 == 688;
    float _534 = _530;
    if (_472)
    {
        _528 = (*spvDescriptorSet0.vp_c14)._m0[305].z;
    }
    float _536 = _528;
    float _538 = _536;
    if (_482)
    {
        _534 = (*spvDescriptorSet0.vp_c14)._m0[306].x;
    }
    float _540 = _534;
    bool _542 = _78 == 704;
    float _544 = _540;
    if (_482)
    {
        _538 = (*spvDescriptorSet0.vp_c14)._m0[306].z;
    }
    float _546 = _538;
    float _548 = _546;
    if (_492)
    {
        _544 = (*spvDescriptorSet0.vp_c14)._m0[307].x;
    }
    float _550 = _544;
    bool _552 = _78 == 720;
    float _554 = _550;
    if (_492)
    {
        _548 = (*spvDescriptorSet0.vp_c14)._m0[307].z;
    }
    float _556 = _548;
    float _558 = _556;
    if (_498)
    {
        _554 = (*spvDescriptorSet0.vp_c14)._m0[308].x;
    }
    float _560 = _554;
    bool _562 = _78 == 736;
    float _564 = _560;
    if (_498)
    {
        _558 = (*spvDescriptorSet0.vp_c14)._m0[308].z;
    }
    float _566 = _558;
    bool _568 = _78 == 752;
    float _570 = _566;
    if (_512)
    {
        _564 = (*spvDescriptorSet0.vp_c14)._m0[309].x;
    }
    float _572 = _564;
    float _574 = _572;
    if (_522)
    {
        _574 = (*spvDescriptorSet0.vp_c14)._m0[310].x;
    }
    float _576 = _574;
    float _578 = _576;
    if (_532)
    {
        _578 = (*spvDescriptorSet0.vp_c14)._m0[311].x;
    }
    float _580 = _578;
    float _582 = _580;
    if (_542)
    {
        _582 = (*spvDescriptorSet0.vp_c14)._m0[312].x;
    }
    float _584 = _582;
    float _586 = _584;
    if (_552)
    {
        _586 = (*spvDescriptorSet0.vp_c14)._m0[313].x;
    }
    float _588 = _586;
    float _590 = _588;
    if (_562)
    {
        _590 = (*spvDescriptorSet0.vp_c14)._m0[314].x;
    }
    float _592 = _590;
    float _594 = _592;
    if (_568)
    {
        _594 = (*spvDescriptorSet0.vp_c14)._m0[315].x;
    }
    float _596 = _594;
    float _598 = _350 * _596;
    if (_512)
    {
        _570 = (*spvDescriptorSet0.vp_c14)._m0[309].z;
    }
    float _600 = _570;
    float _602 = _600;
    if (_522)
    {
        _602 = (*spvDescriptorSet0.vp_c14)._m0[310].z;
    }
    float _604 = _602;
    float _606 = _598 * _63;
    float _608 = _598 * _65;
    float _610 = _604;
    if (_532)
    {
        _610 = (*spvDescriptorSet0.vp_c14)._m0[311].z;
    }
    float _612 = _610;
    float _614 = floor(_606);
    float _616 = _612;
    if (_542)
    {
        _616 = (*spvDescriptorSet0.vp_c14)._m0[312].z;
    }
    float _618 = _616;
    float _620 = _618;
    if (_552)
    {
        _620 = (*spvDescriptorSet0.vp_c14)._m0[313].z;
    }
    float _622 = _620;
    float _624 = _622;
    if (_562)
    {
        _624 = (*spvDescriptorSet0.vp_c14)._m0[314].z;
    }
    float _626 = _624;
    float _628 = _626;
    if (_568)
    {
        _628 = (*spvDescriptorSet0.vp_c14)._m0[315].z;
    }
    float _630 = _628;
    float _632 = floor(_608);
    float _634 = _320 * _630;
    float _636 = -_614;
    float _638 = _606 + _636;
    float _640 = _638 * 2.0;
    float _642 = -_638;
    float _644 = fma(_634, _642, _63);
    int _646 = _290 + 8;
    uint _649 = uint(int(uint(_646) >> uint(2)));
    uint _651 = uint(int(uint(int(_649)) >> uint(2)));
    int _653 = int(_649) & 3;
    float _655 = (*spvDescriptorSet0.vp_c14)._m0[int(_651)][_653];
    int _657 = int(_649) + 1;
    uint _659 = uint(int(uint(_657) >> uint(2)));
    int _661 = _657 & 3;
    float _663 = (*spvDescriptorSet0.vp_c14)._m0[int(_659)][_661];
    float _665 = -_632;
    float _667 = _608 + _665;
    float _669 = floor(_640);
    float _671 = _667 * 2.0;
    float _673 = -_667;
    float _675 = fma(_634, _673, _65);
    float _677 = floor(_671);
    float _679 = _634 * _669;
    float _681 = _679 * 0.5;
    float _683 = _681 + _644;
    float _685 = fma(_69, _683, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _687 = _634 * _677;
    float _689 = _687 * 0.5;
    float _691 = fma(_76, _683, (*spvDescriptorSet0.vp_c15)._m0[3].z);
    float _693 = fma(_683, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _695 = _689 + _675;
    float _697 = -_685;
    float _699 = _697 + _691;
    float _701 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _703 = _693 + _701;
    float _705 = fma(_695, _699, _685);
    float _707 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _709 = _705 + _707;
    float _711 = fma(_695, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _713 = _709 * _709;
    float _715 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _717 = _711 + _715;
    float _719 = fma(_703, _703, _713);
    float _721 = fma(_717, _717, _719);
    float _723 = sqrt(_721);
    float _725 = -_663;
    float _727 = fma(_723, _655, _725);
    float _729 = precise::clamp(_727, 0.0, 1.0);
    float _731 = -_681;
    float _733 = fma(_731, _729, _683);
    float _735 = -_689;
    float _737 = fma(_735, _729, _695);
    float _739 = fma(_733, (*spvDescriptorSet0.vp_c15)._m0[6].x, (*spvDescriptorSet0.vp_c15)._m0[6].z);
    float _741 = fma(_737, (*spvDescriptorSet0.vp_c15)._m0[6].x, (*spvDescriptorSet0.vp_c15)._m0[6].w);
    float _743 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _739);
    float _745 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _741);
    float2 _2410 = float2(_743, _745);
    float _747 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2410, float2(0.0), isnan(_2410)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2410, float2(0.0), isnan(_2410)), level(0.0)).x;
    float _749 = fma(_733, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _751 = fma(_737, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _753 = fma(_733, (*spvDescriptorSet0.vp_c15)._m0[8].x, (*spvDescriptorSet0.vp_c15)._m0[8].z);
    float _755 = fma(_737, (*spvDescriptorSet0.vp_c15)._m0[8].x, (*spvDescriptorSet0.vp_c15)._m0[8].w);
    float _757 = fma(_733, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].z);
    float _759 = fma(_737, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].w);
    int _761 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[40].w) & 2;
    bool _763 = _761 != 0;
    float _765 = fma(_747, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _767 = _765 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _769 = _765 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _771 = _765 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _773 = fma(_749, (*spvDescriptorSet0.vp_c4)._m0[1].x, _767);
    float _775 = fma(_749, (*spvDescriptorSet0.vp_c4)._m0[0].x, _769);
    float _777 = fma(_749, (*spvDescriptorSet0.vp_c4)._m0[2].x, _771);
    float _779 = fma(_751, (*spvDescriptorSet0.vp_c4)._m0[1].z, _773);
    float _781 = fma(_751, (*spvDescriptorSet0.vp_c4)._m0[0].z, _775);
    float _783 = fma(_751, (*spvDescriptorSet0.vp_c4)._m0[2].z, _777);
    float _785 = _779 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _787 = _781 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _789 = _783 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _791 = _785 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _793 = _785 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _795 = _785 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _797 = _785 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _799 = fma(_787, (*spvDescriptorSet0.vp_c4)._m0[8].x, _791);
    float _801 = fma(_787, (*spvDescriptorSet0.vp_c4)._m0[7].x, _793);
    float _803 = fma(_787, (*spvDescriptorSet0.vp_c4)._m0[9].x, _795);
    float _805 = fma(_787, (*spvDescriptorSet0.vp_c4)._m0[10].x, _797);
    float _807 = fma(_789, (*spvDescriptorSet0.vp_c4)._m0[8].z, _799);
    float _809 = fma(_789, (*spvDescriptorSet0.vp_c4)._m0[7].z, _801);
    float _811 = fma(_789, (*spvDescriptorSet0.vp_c4)._m0[9].z, _803);
    float _813 = fma(_789, (*spvDescriptorSet0.vp_c4)._m0[10].z, _805);
    float _815 = _807 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _817 = _809 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _819 = _811 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _821 = _813 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    bool _823 = !_763;
    float _825;
    float _827;
    float _829;
    int _831;
    int _833;
    int _835;
    int _837;
    int _839;
    int _841;
    int _843;
    int _845;
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
    float _877;
    float _879;
    int _881;
    float _883;
    float _885;
    float _887;
    if (!_823)
    {
        _825 = (*spvDescriptorSet0.vp_c9)._m0[919].x;
        _827 = (*spvDescriptorSet0.vp_c9)._m0[919].y;
        _829 = (*spvDescriptorSet0.vp_c9)._m0[919].z;
        _831 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[919].w);
        _833 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].x);
        _835 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].y);
        _837 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].z);
        _839 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].w);
        _841 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].x);
        _843 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].y);
        _845 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].w);
        _847 = (*spvDescriptorSet0.vp_c9)._m0[923].y;
        _849 = (*spvDescriptorSet0.vp_c9)._m0[922].y;
        _851 = (*spvDescriptorSet0.vp_c9)._m0[917].x;
        _853 = (*spvDescriptorSet0.vp_c9)._m0[916].w;
        _855 = (*spvDescriptorSet0.vp_c9)._m0[923].x;
        _857 = (*spvDescriptorSet0.vp_c9)._m0[922].x;
        _859 = (*spvDescriptorSet0.vp_c9)._m0[917].y;
        _861 = (*spvDescriptorSet0.vp_c9)._m0[916].y;
        _863 = (*spvDescriptorSet0.vp_c9)._m0[923].z;
        _865 = (*spvDescriptorSet0.vp_c9)._m0[922].z;
        _867 = (*spvDescriptorSet0.vp_c9)._m0[916].x;
        _869 = (*spvDescriptorSet0.vp_c9)._m0[916].z;
        _871 = (*spvDescriptorSet0.vp_c9)._m0[923].w;
        _873 = (*spvDescriptorSet0.vp_c9)._m0[922].w;
        _875 = (*spvDescriptorSet0.vp_c9)._m0[917].w;
        _877 = (*spvDescriptorSet0.vp_c9)._m0[917].z;
        _879 = (*spvDescriptorSet0.vp_c9)._m0[918].x;
        _881 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].z);
        _883 = (*spvDescriptorSet0.vp_c9)._m0[918].z;
        _885 = (*spvDescriptorSet0.vp_c9)._m0[918].y;
        _887 = (*spvDescriptorSet0.vp_c9)._m0[918].w;
        _889 = true;
    }
    else
    {
        float _891 = fma(_749, 6.2500002968590706586837768554688e-05, 0.5);
        float _893 = fma(_751, 6.2500002968590706586837768554688e-05, 0.5);
        float3 _2693 = float3(_891, _893, float(0));
        float3 _2697 = select(_2693, float3(0.0), isnan(_2693));
        float4 _896 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _2697.xy, uint(rint(_2697.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _2697.xy, uint(rint(_2697.z)), level(0.0)).xyzw;
        float _898 = _896.x;
        float _900 = _896.y;
        float _902 = _896.z;
        float _904 = _896.w;
        float3 _2712 = float3(_891, _893, float(1));
        float3 _2714 = select(_2712, float3(0.0), isnan(_2712));
        float4 _906 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _2714.xy, uint(rint(_2714.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _2714.xy, uint(rint(_2714.z)), level(0.0)).xyzw;
        float _908 = _906.x;
        float _910 = _906.y;
        float _912 = _906.z;
        float _914 = _906.w;
        float3 _2729 = float3(_891, _893, float(2));
        float3 _2731 = select(_2729, float3(0.0), isnan(_2729));
        float4 _916 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _2731.xy, uint(rint(_2731.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _2731.xy, uint(rint(_2731.z)), level(0.0)).xyzw;
        float _918 = _916.x;
        float _920 = _916.y;
        float _922 = _916.z;
        float _924 = _916.w;
        float3 _2746 = float3(_891, _893, float(3));
        float3 _2748 = select(_2746, float3(0.0), isnan(_2746));
        float4 _926 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _2748.xy, uint(rint(_2748.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _2748.xy, uint(rint(_2748.z)), level(0.0)).xyzw;
        float _928 = _926.x;
        float _930 = _926.y;
        float _932 = _926.z;
        float _934 = _926.w;
        float3 _2763 = float3(_891, _893, float(4));
        float3 _2765 = select(_2763, float3(0.0), isnan(_2763));
        float4 _936 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _2765.xy, uint(rint(_2765.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _2765.xy, uint(rint(_2765.z)), level(0.0)).xyzw;
        float _938 = _936.x;
        float _940 = _936.y;
        float _942 = _936.z;
        float _944 = _936.w;
        float3 _2781 = float3(_891, _893, float(5));
        float3 _2783 = select(_2781, float3(0.0), isnan(_2781));
        float4 _946 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _2783.xy, uint(rint(_2783.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _2783.xy, uint(rint(_2783.z)), level(0.0)).xyzw;
        float _948 = _946.x;
        float _950 = _946.y;
        float _952 = _946.z;
        float _954 = _946.w;
        float3 _2798 = float3(_891, _893, float(6));
        float3 _2800 = select(_2798, float3(0.0), isnan(_2798));
        float4 _956 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _2800.xy, uint(rint(_2800.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _2800.xy, uint(rint(_2800.z)), level(0.0)).xyzw;
        float _958 = _956.x;
        float _960 = _956.y;
        float _962 = _956.z;
        float _964 = _956.w;
        float3 _2815 = float3(_891, _893, float(7));
        float3 _2817 = select(_2815, float3(0.0), isnan(_2815));
        float4 _966 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _2817.xy, uint(rint(_2817.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _2817.xy, uint(rint(_2817.z)), level(0.0)).xyzw;
        float _968 = _966.x;
        float _970 = _966.y;
        float _972 = _966.z;
        float _974 = _966.w;
        _825 = _928;
        _827 = _930;
        _829 = _932;
        _831 = as_type<int>(_934);
        _833 = as_type<int>(_938);
        _835 = as_type<int>(_940);
        _837 = as_type<int>(_942);
        _839 = as_type<int>(_944);
        _841 = as_type<int>(_948);
        _843 = as_type<int>(_950);
        _845 = as_type<int>(_954);
        _847 = _970;
        _849 = _960;
        _851 = _908;
        _853 = _904;
        _855 = _968;
        _857 = _958;
        _859 = _910;
        _861 = _900;
        _863 = _972;
        _865 = _962;
        _867 = _898;
        _869 = _902;
        _871 = _974;
        _873 = _964;
        _875 = _914;
        _877 = _912;
        _879 = _918;
        _881 = as_type<int>(_952);
        _883 = _922;
        _885 = _920;
        _887 = _924;
    }
    _889 = false;
    float _976 = _825;
    float _978 = _827;
    float _980 = _829;
    int _982 = _831;
    int _984 = _833;
    int _986 = _835;
    int _988 = _837;
    int _990 = _839;
    int _992 = _841;
    int _994 = _843;
    int _996 = _845;
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
    float _1028 = _877;
    float _1030 = _879;
    int _1032 = _881;
    float _1034 = _883;
    float _1036 = _885;
    float _1038 = _887;
    float _1040 = -(*spvDescriptorSet0.vp_c4)._m0[12].w;
    float _1042 = _765 + _1040;
    float _1044 = -(*spvDescriptorSet0.vp_c4)._m0[11].w;
    float _1046 = _749 + _1044;
    float _1048 = -(*spvDescriptorSet0.vp_c4)._m0[13].w;
    float _1050 = _751 + _1048;
    out.gl_Position.x = _817;
    out.gl_Position.y = _815;
    out.gl_Position.z = _819;
    out.gl_Position.w = _821;
    float _1052 = _1042 * _1042;
    float _1054 = _976 * 0.88622701168060302734375;
    float _1056 = _978 * 0.88622701168060302734375;
    float _1058 = _980 * 0.88622701168060302734375;
    float _1060 = fma(_1046, _1046, _1052);
    float _1062 = _763 ? as_type<float>(_982) : 0.0;
    out.m_43.x = _749;
    out.m_43.y = _765;
    out.m_43.z = _751;
    float _1064 = _763 ? as_type<float>(_984) : 0.0;
    float _1066 = fma(_1050, _1050, _1060);
    float _1068 = _763 ? as_type<float>(_986) : 0.0;
    out.m_45.z = _757;
    out.m_45.w = _759;
    float _1070 = _763 ? _1054 : 0.0;
    float _1072 = _763 ? _1056 : 0.0;
    float _1074 = rsqrt(_1066);
    float _1076 = _763 ? _1058 : 0.0;
    out.m_47.x = _753;
    float _1078 = _763 ? as_type<float>(_988) : 0.0;
    float _1080 = _763 ? as_type<float>(_990) : 0.0;
    out.m_47.y = _755;
    float _1082 = _763 ? as_type<float>(_992) : 0.0;
    float _1084 = _763 ? as_type<float>(_994) : 0.0;
    float _1086 = _763 ? as_type<float>(_996) : 0.0;
    float _1088 = _1074 * 1.02332699298858642578125;
    float _1090 = _1050 * _1074;
    float _1092 = _1042 * _1088;
    float _1094 = _1090 * (-1.02332699298858642578125);
    float _1096 = _1046 * _1088;
    float _1098 = _1092 * _998;
    float _1100 = _1092 * _1000;
    float _1102 = _1092 * _1002;
    float _1104 = _1092 * _1004;
    float _1106 = fma(_1006, 0.88622701168060302734375, _1098);
    float _1108 = fma(_1008, 0.88622701168060302734375, _1100);
    float _1110 = _1092 * _1010;
    float _1112 = fma(_1012, 0.88622701168060302734375, _1102);
    float _1114 = fma(_1094, _1014, _1106);
    float _1116 = fma(_1094, _1016, _1108);
    float _1118 = fma(_1018, 0.88622701168060302734375, _1104);
    float _1120 = fma(_1020, 0.88622701168060302734375, _1110);
    float _1122 = fma(_1096, _1022, _1114);
    float _1124 = fma(_1096, _1024, _1116);
    float _1126 = fma(_1062, _1092, _1070);
    float _1128 = fma(_1064, _1092, _1072);
    float _1130 = fma(_1068, _1092, _1076);
    float _1132 = precise::max(0.0, _1122);
    float _1134 = fma(_1094, _1026, _1112);
    float _1136 = precise::max(0.0, _1124);
    float _1138 = fma(_1094, _1028, _1118);
    float _1140 = fma(_1094, _1030, _1120);
    float _1142 = _1132 * 0.31830990314483642578125;
    float _1144 = precise::clamp(_1142, 0.0, 1.0);
    float _1146 = fma(_1078, _1094, _1126);
    float _1148 = fma(_1080, _1094, _1128);
    float _1150 = fma(_1082, _1094, _1130);
    float _1152 = _1136 * 0.31830990314483642578125;
    float _1154 = precise::clamp(_1152, 0.0, 1.0);
    float _1156 = _763 ? as_type<float>(_1032) : 0.0;
    float _1158 = fma(_1096, _1034, _1134);
    float _1160 = fma(_1096, _1036, _1138);
    float _1162 = -_1144;
    float _1164 = _1162 + 1.0;
    float _1166 = fma(_1096, _1038, _1140);
    float _1168 = _1154 * 0.88622701168060302734375;
    float _1170 = fma(_1156, _1096, _1148);
    float _1172 = fma(_1084, _1096, _1146);
    float _1174 = fma(_1086, _1096, _1150);
    float _1176 = fma(_1164, (*spvDescriptorSet0.vp_c9)._m0[37].y, _1144);
    float _1178 = precise::max(0.0, _1158);
    float _1180 = _1168 * (*spvDescriptorSet0.vp_c9)._m0[991].y;
    float _1182 = precise::max(0.0, _1160);
    float _1184 = _1168 * (*spvDescriptorSet0.vp_c9)._m0[991].x;
    float _1186 = precise::max(0.0, _1166);
    float _1188 = _1168 * (*spvDescriptorSet0.vp_c9)._m0[991].z;
    float _1190 = precise::max(0.0, _1170);
    float _1192 = _1176 * (*spvDescriptorSet0.vp_c9)._m0[40].z;
    float _1194 = precise::max(0.0, _1172);
    float _1196 = fma(_1178, (*spvDescriptorSet0.vp_c9)._m0[68].y, _1180);
    float _1198 = precise::max(0.0, _1174);
    float _1200 = fma(_1182, (*spvDescriptorSet0.vp_c9)._m0[68].x, _1184);
    float _1202 = fma(_1186, (*spvDescriptorSet0.vp_c9)._m0[68].z, _1188);
    float _1204 = fma(_1190, _1192, _1196);
    float _1206 = fma(_1194, _1192, _1200);
    float _1208 = fma(_1198, _1192, _1202);
    out.m_47.w = (*spvDescriptorSet0.vp_c15)._m0[7].y;
    out.m_49.x = _1206;
    out.m_49.y = _1204;
    out.m_49.z = _1208;
    out.m_49.w = _789;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

