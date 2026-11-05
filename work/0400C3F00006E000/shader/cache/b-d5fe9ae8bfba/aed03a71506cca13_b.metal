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
    float4 m_43 [[user(locn2)]];
    float4 m_49 [[user(locn3)]];
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
    bool _1033 = false;
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
    float _110 = fma(_63, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _112 = 0.0;
    float _114 = _100;
    if (_82)
    {
        _112 = (*spvDescriptorSet0.vp_c14)._m0[268].z;
    }
    float _116 = _112;
    float _118 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _120 = _108 + _118;
    float _122 = _116;
    if (_84)
    {
        _114 = (*spvDescriptorSet0.vp_c14)._m0[269].x;
    }
    float _124 = _114;
    float _126 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _128 = _110 + _126;
    float _130 = fma(_65, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _132 = _120 * _120;
    bool _134 = _78 == 112;
    float _136 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _138 = _130 + _136;
    float _140 = fma(_128, _128, _132);
    float _142 = _124;
    if (_84)
    {
        _122 = (*spvDescriptorSet0.vp_c14)._m0[269].z;
    }
    float _144 = _122;
    float _146 = _144;
    if (_86)
    {
        _142 = (*spvDescriptorSet0.vp_c14)._m0[270].x;
    }
    float _148 = _142;
    float _150 = fma(_138, _138, _140);
    bool _152 = _78 == 128;
    float _154 = _148;
    if (_86)
    {
        _146 = (*spvDescriptorSet0.vp_c14)._m0[270].z;
    }
    float _156 = _146;
    float _158 = rsqrt(_150);
    float _160 = _156;
    if (_88)
    {
        _154 = (*spvDescriptorSet0.vp_c14)._m0[271].x;
    }
    float _162 = _154;
    bool _164 = _78 == 144;
    float _166 = _162;
    if (_88)
    {
        _160 = (*spvDescriptorSet0.vp_c14)._m0[271].z;
    }
    float _168 = _160;
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
    float _186 = _158 * (*spvDescriptorSet0.vp_c14)._m0[268].x;
    float _188 = _182;
    if (_96)
    {
        _180 = (*spvDescriptorSet0.vp_c14)._m0[273].z;
    }
    float _190 = _180;
    bool _192 = _78 == 192;
    float _194 = _190;
    if (_106)
    {
        _188 = (*spvDescriptorSet0.vp_c14)._m0[274].x;
    }
    float _196 = _188;
    float _198 = log2(_186);
    float _200 = _196;
    if (_106)
    {
        _194 = (*spvDescriptorSet0.vp_c14)._m0[274].z;
    }
    float _202 = _194;
    float _204 = _202;
    if (_134)
    {
        _200 = (*spvDescriptorSet0.vp_c14)._m0[275].x;
    }
    float _206 = _200;
    bool _208 = _78 == 208;
    float _210 = _206;
    if (_134)
    {
        _204 = (*spvDescriptorSet0.vp_c14)._m0[275].z;
    }
    float _212 = _204;
    float _214 = _212;
    if (_152)
    {
        _210 = (*spvDescriptorSet0.vp_c14)._m0[276].x;
    }
    float _216 = _210;
    bool _218 = _78 == 224;
    float _220 = _216;
    if (_152)
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
    float _228 = _198 + 1.2999999523162841796875;
    bool _230 = _78 == 240;
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
    float _240 = trunc(_228);
    int _242 = int(_240);
    bool _244 = _78 == 256;
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
    int _270 = min(_242, 15);
    bool _272 = _78 == 304;
    float _274 = _268;
    if (_208)
    {
        _266 = (*spvDescriptorSet0.vp_c14)._m0[281].x;
    }
    float _276 = _266;
    float _278 = float(_270);
    float _280 = _276;
    if (_208)
    {
        _274 = (*spvDescriptorSet0.vp_c14)._m0[281].z;
    }
    float _282 = _274;
    int _284 = _270 << 4;
    int _286 = _284 + 4288;
    float _288 = _282;
    if (_218)
    {
        _280 = (*spvDescriptorSet0.vp_c14)._m0[282].x;
    }
    float _290 = _280;
    bool _292 = _78 == 320;
    float _294 = -_278;
    float _296 = _294 + (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _298 = _290;
    if (_218)
    {
        _288 = (*spvDescriptorSet0.vp_c14)._m0[282].z;
    }
    float _300 = _288;
    float _302 = _300;
    if (_230)
    {
        _298 = (*spvDescriptorSet0.vp_c14)._m0[283].x;
    }
    float _304 = _298;
    float _306 = _296 + 1.0;
    bool _308 = _78 == 336;
    float _310 = _304;
    if (_230)
    {
        _302 = (*spvDescriptorSet0.vp_c14)._m0[283].z;
    }
    float _312 = _302;
    float _314 = _312;
    if (_244)
    {
        _310 = (*spvDescriptorSet0.vp_c14)._m0[284].x;
    }
    float _316 = _310;
    float _318 = exp2(_306);
    bool _320 = _78 == 352;
    float _322 = _316;
    if (_244)
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
    float _346 = 1.0 / _318;
    float _348 = _344;
    if (_272)
    {
        _342 = (*spvDescriptorSet0.vp_c14)._m0[287].x;
    }
    float _350 = _342;
    bool _352 = _78 == 400;
    float _354 = _350;
    if (_272)
    {
        _348 = (*spvDescriptorSet0.vp_c14)._m0[287].z;
    }
    float _356 = _348;
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
    if (_308)
    {
        _364 = (*spvDescriptorSet0.vp_c14)._m0[289].x;
    }
    float _370 = _364;
    bool _372 = _78 == 432;
    float _374 = _370;
    if (_308)
    {
        _368 = (*spvDescriptorSet0.vp_c14)._m0[289].z;
    }
    float _376 = _368;
    float _378 = _376;
    if (_320)
    {
        _374 = (*spvDescriptorSet0.vp_c14)._m0[290].x;
    }
    float _380 = _374;
    bool _382 = _78 == 448;
    float _384 = _380;
    if (_320)
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
    float _598 = _346 * _596;
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
    float _634 = _318 * _630;
    float _636 = -_614;
    float _638 = _606 + _636;
    float _640 = _638 * 2.0;
    float _642 = -_638;
    float _644 = fma(_634, _642, _63);
    int _646 = _286 + 8;
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
    float _731 = -_689;
    float _733 = fma(_731, _729, _695);
    float _735 = -_681;
    float _737 = fma(_735, _729, _683);
    float _739 = fma(_733, (*spvDescriptorSet0.vp_c15)._m0[6].x, (*spvDescriptorSet0.vp_c15)._m0[6].w);
    float _741 = fma(_737, (*spvDescriptorSet0.vp_c15)._m0[6].x, (*spvDescriptorSet0.vp_c15)._m0[6].z);
    float _743 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _739);
    float _745 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _741);
    float2 _2554 = float2(_745, _743);
    float _747 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2554, float2(0.0), isnan(_2554)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2554, float2(0.0), isnan(_2554)), level(0.0)).x;
    float _749 = fma(_733, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _751 = fma(_737, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _753 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _755 = _749 + _753;
    float _757 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _759 = _751 + _757;
    float _761 = fma(_737, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].z);
    float _763 = _755 * _755;
    float _765 = fma(_733, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].w);
    float _767 = fma(_759, _759, _763);
    float _769 = sqrt(_767);
    bool _771 = _769 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _773 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _775 = _769 + _773;
    float _777 = (*spvDescriptorSet0.vp_c15)._m0[4].x;
    float _779 = _769;
    float _781 = (*spvDescriptorSet0.vp_c15)._m0[6].x;
    float _783 = _767;
    if (_771)
    {
        float _785 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        _777 = _785;
    }
    float _787 = _777;
    float _789 = _787;
    float _791 = (*spvDescriptorSet0.vp_c14)._m0[0].y;
    if (_771)
    {
        float _793 = _775 * _787;
        _779 = _793;
    }
    float _795 = _779;
    if (_771)
    {
        float _797 = rsqrt(_767);
        _789 = _797;
    }
    float _799 = _789;
    float _801 = _799;
    if (_771)
    {
        float _803 = _795 * 0.15915493667125701904296875;
        _781 = _803;
    }
    float _805 = _781;
    float _807 = _795;
    if (_771)
    {
        float _809 = _805 * 6.283185482025146484375;
        float _811 = sin(_809);
        _807 = _811;
    }
    float _813 = _807;
    float _815 = _775;
    if (_771)
    {
        float _817 = _805 * 6.283185482025146484375;
        float _819 = cos(_817);
        _815 = _819;
    }
    float _821 = _815;
    float _823 = fma(_747, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    if (_771)
    {
        float _825 = _823 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        _791 = _825;
    }
    float _827 = _791;
    float _829 = _823 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _831 = _827;
    float _833 = _813;
    if (_771)
    {
        float _835 = fma(_813, _827, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        _831 = _835;
    }
    float _837 = _831;
    float _839 = _837;
    float _841 = _821;
    if (_771)
    {
        float _843 = _821 + (-1.0);
        _833 = _843;
    }
    float _845 = _833;
    float _847 = fma(_751, (*spvDescriptorSet0.vp_c4)._m0[2].x, _829);
    float _849 = 0.0;
    float _851 = _845;
    if (_771)
    {
        float _853 = _799 * _837;
        _849 = _853;
    }
    float _855 = _849;
    if (_771)
    {
        float _857 = _845 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        _783 = _857;
    }
    float _859 = _783;
    if (!_771)
    {
        _839 = _823;
    }
    float _861 = _839;
    float _863 = fma(_749, (*spvDescriptorSet0.vp_c4)._m0[2].z, _847);
    float _865 = _861;
    if (!_771)
    {
        _801 = _751;
    }
    float _867 = _801;
    float _869 = _867;
    if (_771)
    {
        float _871 = fma(_823, _821, _859);
        _865 = _871;
    }
    float _873 = _865;
    if (_771)
    {
        float _875 = fma(_759, _855, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        _869 = _875;
    }
    float _877 = _869;
    if (!_771)
    {
        _851 = _749;
    }
    float _879 = _851;
    float _881 = _879;
    if (_771)
    {
        float _883 = fma(_755, _855, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        _881 = _883;
    }
    float _885 = _881;
    float _887 = _873 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    if (_771)
    {
        float _889 = _873 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        _841 = _889;
    }
    float _891 = _841;
    float _893 = _873 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _895 = _863 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _897 = fma(_877, (*spvDescriptorSet0.vp_c4)._m0[1].x, _887);
    float _899 = _891;
    float _901 = _893;
    if (_771)
    {
        float _903 = fma(_877, (*spvDescriptorSet0.vp_c4)._m0[2].x, _891);
        _899 = _903;
    }
    float _905 = _899;
    float _907 = fma(_877, (*spvDescriptorSet0.vp_c4)._m0[0].x, _893);
    float _909 = fma(_885, (*spvDescriptorSet0.vp_c4)._m0[1].z, _897);
    float _911 = _905;
    if (_771)
    {
        float _913 = fma(_885, (*spvDescriptorSet0.vp_c4)._m0[2].z, _905);
        _911 = _913;
    }
    float _915 = _911;
    float _917 = fma(_885, (*spvDescriptorSet0.vp_c4)._m0[0].z, _907);
    int _919 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[40].w) & 2;
    bool _921 = _919 != 0;
    float _923 = _909 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    if (!_771)
    {
        _901 = _895;
    }
    float _925 = _901;
    float _927 = _917 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _929 = _925;
    if (_771)
    {
        float _931 = _915 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _929 = _931;
    }
    float _933 = _929;
    float _935 = _923 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _937 = _923 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _939 = _923 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _941 = _923 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _943 = fma(_927, (*spvDescriptorSet0.vp_c4)._m0[7].x, _935);
    float _945 = fma(_927, (*spvDescriptorSet0.vp_c4)._m0[8].x, _937);
    float _947 = fma(_927, (*spvDescriptorSet0.vp_c4)._m0[9].x, _939);
    float _949 = fma(_927, (*spvDescriptorSet0.vp_c4)._m0[10].x, _941);
    float _951 = fma(_933, (*spvDescriptorSet0.vp_c4)._m0[7].z, _943);
    float _953 = fma(_933, (*spvDescriptorSet0.vp_c4)._m0[8].z, _945);
    float _955 = fma(_933, (*spvDescriptorSet0.vp_c4)._m0[9].z, _947);
    float _957 = fma(_933, (*spvDescriptorSet0.vp_c4)._m0[10].z, _949);
    float _959 = _951 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _961 = _953 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _963 = _955 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _965 = _957 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    bool _967 = !_921;
    float _969;
    float _971;
    float _973;
    int _975;
    int _977;
    int _979;
    int _981;
    int _983;
    int _985;
    int _987;
    int _989;
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
    float _1031;
    if (!_967)
    {
        _969 = (*spvDescriptorSet0.vp_c9)._m0[919].z;
        _971 = (*spvDescriptorSet0.vp_c9)._m0[919].x;
        _973 = (*spvDescriptorSet0.vp_c9)._m0[919].y;
        _975 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[919].w);
        _977 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].x);
        _979 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].y);
        _981 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].z);
        _983 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].w);
        _985 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].x);
        _987 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].y);
        _989 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].w);
        _991 = (*spvDescriptorSet0.vp_c9)._m0[922].y;
        _993 = (*spvDescriptorSet0.vp_c9)._m0[923].y;
        _995 = (*spvDescriptorSet0.vp_c9)._m0[917].y;
        _997 = (*spvDescriptorSet0.vp_c9)._m0[916].w;
        _999 = (*spvDescriptorSet0.vp_c9)._m0[922].x;
        _1001 = (*spvDescriptorSet0.vp_c9)._m0[923].x;
        _1003 = (*spvDescriptorSet0.vp_c9)._m0[917].x;
        _1005 = (*spvDescriptorSet0.vp_c9)._m0[916].z;
        _1007 = (*spvDescriptorSet0.vp_c9)._m0[922].z;
        _1009 = (*spvDescriptorSet0.vp_c9)._m0[923].z;
        _1011 = (*spvDescriptorSet0.vp_c9)._m0[916].x;
        _1013 = (*spvDescriptorSet0.vp_c9)._m0[916].y;
        _1015 = (*spvDescriptorSet0.vp_c9)._m0[922].w;
        _1017 = (*spvDescriptorSet0.vp_c9)._m0[923].w;
        _1019 = (*spvDescriptorSet0.vp_c9)._m0[918].x;
        _1021 = (*spvDescriptorSet0.vp_c9)._m0[917].z;
        _1023 = (*spvDescriptorSet0.vp_c9)._m0[917].w;
        _1025 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].z);
        _1027 = (*spvDescriptorSet0.vp_c9)._m0[918].w;
        _1029 = (*spvDescriptorSet0.vp_c9)._m0[918].y;
        _1031 = (*spvDescriptorSet0.vp_c9)._m0[918].z;
        _1033 = true;
    }
    else
    {
        float _1035 = fma(_751, 6.2500002968590706586837768554688e-05, 0.5);
        float _1037 = fma(_749, 6.2500002968590706586837768554688e-05, 0.5);
        float3 _3067 = float3(_1035, _1037, float(0));
        float3 _3071 = select(_3067, float3(0.0), isnan(_3067));
        float4 _1040 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _3071.xy, uint(rint(_3071.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _3071.xy, uint(rint(_3071.z)), level(0.0)).xyzw;
        float _1042 = _1040.x;
        float _1044 = _1040.y;
        float _1046 = _1040.z;
        float _1048 = _1040.w;
        float3 _3086 = float3(_1035, _1037, float(1));
        float3 _3088 = select(_3086, float3(0.0), isnan(_3086));
        float4 _1050 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _3088.xy, uint(rint(_3088.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _3088.xy, uint(rint(_3088.z)), level(0.0)).xyzw;
        float _1052 = _1050.x;
        float _1054 = _1050.y;
        float _1056 = _1050.z;
        float _1058 = _1050.w;
        float3 _3103 = float3(_1035, _1037, float(2));
        float3 _3105 = select(_3103, float3(0.0), isnan(_3103));
        float4 _1060 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _3105.xy, uint(rint(_3105.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _3105.xy, uint(rint(_3105.z)), level(0.0)).xyzw;
        float _1062 = _1060.x;
        float _1064 = _1060.y;
        float _1066 = _1060.z;
        float _1068 = _1060.w;
        float3 _3120 = float3(_1035, _1037, float(3));
        float3 _3122 = select(_3120, float3(0.0), isnan(_3120));
        float4 _1070 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _3122.xy, uint(rint(_3122.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _3122.xy, uint(rint(_3122.z)), level(0.0)).xyzw;
        float _1072 = _1070.x;
        float _1074 = _1070.y;
        float _1076 = _1070.z;
        float _1078 = _1070.w;
        float3 _3137 = float3(_1035, _1037, float(4));
        float3 _3139 = select(_3137, float3(0.0), isnan(_3137));
        float4 _1080 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _3139.xy, uint(rint(_3139.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _3139.xy, uint(rint(_3139.z)), level(0.0)).xyzw;
        float _1082 = _1080.x;
        float _1084 = _1080.y;
        float _1086 = _1080.z;
        float _1088 = _1080.w;
        float3 _3155 = float3(_1035, _1037, float(5));
        float3 _3157 = select(_3155, float3(0.0), isnan(_3155));
        float4 _1090 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _3157.xy, uint(rint(_3157.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _3157.xy, uint(rint(_3157.z)), level(0.0)).xyzw;
        float _1092 = _1090.x;
        float _1094 = _1090.y;
        float _1096 = _1090.z;
        float _1098 = _1090.w;
        float3 _3172 = float3(_1035, _1037, float(6));
        float3 _3174 = select(_3172, float3(0.0), isnan(_3172));
        float4 _1100 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _3174.xy, uint(rint(_3174.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _3174.xy, uint(rint(_3174.z)), level(0.0)).xyzw;
        float _1102 = _1100.x;
        float _1104 = _1100.y;
        float _1106 = _1100.z;
        float _1108 = _1100.w;
        float3 _3189 = float3(_1035, _1037, float(7));
        float3 _3191 = select(_3189, float3(0.0), isnan(_3189));
        float4 _1110 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _3191.xy, uint(rint(_3191.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _3191.xy, uint(rint(_3191.z)), level(0.0)).xyzw;
        float _1112 = _1110.x;
        float _1114 = _1110.y;
        float _1116 = _1110.z;
        float _1118 = _1110.w;
        _969 = _1076;
        _971 = _1072;
        _973 = _1074;
        _975 = as_type<int>(_1078);
        _977 = as_type<int>(_1082);
        _979 = as_type<int>(_1084);
        _981 = as_type<int>(_1086);
        _983 = as_type<int>(_1088);
        _985 = as_type<int>(_1092);
        _987 = as_type<int>(_1094);
        _989 = as_type<int>(_1098);
        _991 = _1104;
        _993 = _1114;
        _995 = _1054;
        _997 = _1048;
        _999 = _1102;
        _1001 = _1112;
        _1003 = _1052;
        _1005 = _1046;
        _1007 = _1106;
        _1009 = _1116;
        _1011 = _1042;
        _1013 = _1044;
        _1015 = _1108;
        _1017 = _1118;
        _1019 = _1062;
        _1021 = _1056;
        _1023 = _1058;
        _1025 = as_type<int>(_1096);
        _1027 = _1068;
        _1029 = _1064;
        _1031 = _1066;
    }
    _1033 = false;
    float _1120 = _969;
    float _1122 = _971;
    float _1124 = _973;
    int _1126 = _975;
    int _1128 = _977;
    int _1130 = _979;
    int _1132 = _981;
    int _1134 = _983;
    int _1136 = _985;
    int _1138 = _987;
    int _1140 = _989;
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
    float _1182 = _1031;
    float _1184 = -(*spvDescriptorSet0.vp_c4)._m0[12].w;
    float _1186 = _823 + _1184;
    float _1188 = -(*spvDescriptorSet0.vp_c4)._m0[11].w;
    float _1190 = _751 + _1188;
    float _1192 = -(*spvDescriptorSet0.vp_c4)._m0[13].w;
    float _1194 = _749 + _1192;
    float _1196 = _1120 * 0.88622701168060302734375;
    float _1198 = _1186 * _1186;
    out.gl_Position.x = _959;
    out.gl_Position.y = _961;
    out.gl_Position.z = _963;
    out.gl_Position.w = _965;
    float _1200 = _1122 * 0.88622701168060302734375;
    float _1202 = _1124 * 0.88622701168060302734375;
    float _1204 = fma(_1190, _1190, _1198);
    float _1206 = _921 ? as_type<float>(_1126) : 0.0;
    out.m_43.x = _751;
    out.m_43.y = _823;
    out.m_43.z = _749;
    float _1208 = _921 ? as_type<float>(_1128) : 0.0;
    float _1210 = fma(_1194, _1194, _1204);
    float _1212 = _921 ? as_type<float>(_1130) : 0.0;
    out.m_45.z = _761;
    out.m_45.w = _765;
    float _1214 = _921 ? _1200 : 0.0;
    float _1216 = _921 ? _1202 : 0.0;
    float _1218 = rsqrt(_1210);
    float _1220 = _921 ? _1196 : 0.0;
    float _1222 = _921 ? as_type<float>(_1132) : 0.0;
    float _1224 = _921 ? as_type<float>(_1134) : 0.0;
    float _1226 = _921 ? as_type<float>(_1136) : 0.0;
    float _1228 = _921 ? as_type<float>(_1138) : 0.0;
    float _1230 = _921 ? as_type<float>(_1140) : 0.0;
    float _1232 = _1218 * 1.02332699298858642578125;
    float _1234 = _1194 * _1218;
    float _1236 = _1186 * _1232;
    float _1238 = _1234 * (-1.02332699298858642578125);
    float _1240 = _1190 * _1232;
    float _1242 = _1236 * _1142;
    float _1244 = _1236 * _1144;
    float _1246 = _1236 * _1146;
    float _1248 = _1236 * _1148;
    float _1250 = fma(_1150, 0.88622701168060302734375, _1242);
    float _1252 = fma(_1152, 0.88622701168060302734375, _1244);
    float _1254 = _1236 * _1154;
    float _1256 = fma(_1156, 0.88622701168060302734375, _1246);
    float _1258 = fma(_1238, _1158, _1250);
    float _1260 = fma(_1238, _1160, _1252);
    float _1262 = fma(_1162, 0.88622701168060302734375, _1248);
    float _1264 = fma(_1164, 0.88622701168060302734375, _1254);
    float _1266 = fma(_1240, _1166, _1258);
    float _1268 = fma(_1240, _1168, _1260);
    float _1270 = fma(_1206, _1236, _1214);
    float _1272 = fma(_1208, _1236, _1216);
    float _1274 = fma(_1212, _1236, _1220);
    float _1276 = precise::max(0.0, _1266);
    float _1278 = fma(_1238, _1170, _1256);
    float _1280 = precise::max(0.0, _1268);
    float _1282 = fma(_1238, _1172, _1262);
    float _1284 = fma(_1238, _1174, _1264);
    float _1286 = _1276 * 0.31830990314483642578125;
    float _1288 = precise::clamp(_1286, 0.0, 1.0);
    float _1290 = fma(_1222, _1238, _1270);
    float _1292 = _1280 * 0.31830990314483642578125;
    float _1294 = precise::clamp(_1292, 0.0, 1.0);
    float _1296 = fma(_1224, _1238, _1272);
    float _1298 = fma(_1226, _1238, _1274);
    float _1300 = _921 ? as_type<float>(_1176) : 0.0;
    float _1302 = fma(_1240, _1178, _1278);
    float _1304 = fma(_1240, _1180, _1282);
    float _1306 = fma(_1240, _1182, _1284);
    float _1308 = _1288 * 0.88622701168060302734375;
    float _1310 = -_1294;
    float _1312 = _1310 + 1.0;
    float _1314 = fma(_1228, _1240, _1290);
    float _1316 = fma(_1300, _1240, _1296);
    float _1318 = fma(_1230, _1240, _1298);
    float _1320 = precise::max(0.0, _1302);
    float _1322 = fma(_1312, (*spvDescriptorSet0.vp_c9)._m0[37].y, _1294);
    float _1324 = precise::max(0.0, _1304);
    float _1326 = _1308 * (*spvDescriptorSet0.vp_c9)._m0[991].z;
    float _1328 = precise::max(0.0, _1306);
    float _1330 = _1308 * (*spvDescriptorSet0.vp_c9)._m0[991].x;
    float _1332 = _1308 * (*spvDescriptorSet0.vp_c9)._m0[991].y;
    float _1334 = precise::max(0.0, _1314);
    float _1336 = fma(_1320, (*spvDescriptorSet0.vp_c9)._m0[68].z, _1326);
    float _1338 = precise::max(0.0, _1316);
    float _1340 = fma(_1324, (*spvDescriptorSet0.vp_c9)._m0[68].x, _1330);
    float _1342 = _1322 * (*spvDescriptorSet0.vp_c9)._m0[40].z;
    float _1344 = fma(_1328, (*spvDescriptorSet0.vp_c9)._m0[68].y, _1332);
    float _1346 = precise::max(0.0, _1318);
    float _1348 = fma(_1334, _1342, _1340);
    float _1350 = fma(_1338, _1342, _1344);
    float _1352 = fma(_1346, _1342, _1336);
    out.m_47.w = (*spvDescriptorSet0.vp_c15)._m0[7].y;
    out.m_49.x = _1348;
    out.m_49.y = _1350;
    out.m_49.z = _1352;
    out.m_49.w = _895;
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
    bool _1033 = false;
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
    float _110 = fma(_63, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _112 = 0.0;
    float _114 = _100;
    if (_82)
    {
        _112 = (*spvDescriptorSet0.vp_c14)._m0[268].z;
    }
    float _116 = _112;
    float _118 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _120 = _108 + _118;
    float _122 = _116;
    if (_84)
    {
        _114 = (*spvDescriptorSet0.vp_c14)._m0[269].x;
    }
    float _124 = _114;
    float _126 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _128 = _110 + _126;
    float _130 = fma(_65, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _132 = _120 * _120;
    bool _134 = _78 == 112;
    float _136 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _138 = _130 + _136;
    float _140 = fma(_128, _128, _132);
    float _142 = _124;
    if (_84)
    {
        _122 = (*spvDescriptorSet0.vp_c14)._m0[269].z;
    }
    float _144 = _122;
    float _146 = _144;
    if (_86)
    {
        _142 = (*spvDescriptorSet0.vp_c14)._m0[270].x;
    }
    float _148 = _142;
    float _150 = fma(_138, _138, _140);
    bool _152 = _78 == 128;
    float _154 = _148;
    if (_86)
    {
        _146 = (*spvDescriptorSet0.vp_c14)._m0[270].z;
    }
    float _156 = _146;
    float _158 = rsqrt(_150);
    float _160 = _156;
    if (_88)
    {
        _154 = (*spvDescriptorSet0.vp_c14)._m0[271].x;
    }
    float _162 = _154;
    bool _164 = _78 == 144;
    float _166 = _162;
    if (_88)
    {
        _160 = (*spvDescriptorSet0.vp_c14)._m0[271].z;
    }
    float _168 = _160;
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
    float _186 = _158 * (*spvDescriptorSet0.vp_c14)._m0[268].x;
    float _188 = _182;
    if (_96)
    {
        _180 = (*spvDescriptorSet0.vp_c14)._m0[273].z;
    }
    float _190 = _180;
    bool _192 = _78 == 192;
    float _194 = _190;
    if (_106)
    {
        _188 = (*spvDescriptorSet0.vp_c14)._m0[274].x;
    }
    float _196 = _188;
    float _198 = log2(_186);
    float _200 = _196;
    if (_106)
    {
        _194 = (*spvDescriptorSet0.vp_c14)._m0[274].z;
    }
    float _202 = _194;
    float _204 = _202;
    if (_134)
    {
        _200 = (*spvDescriptorSet0.vp_c14)._m0[275].x;
    }
    float _206 = _200;
    bool _208 = _78 == 208;
    float _210 = _206;
    if (_134)
    {
        _204 = (*spvDescriptorSet0.vp_c14)._m0[275].z;
    }
    float _212 = _204;
    float _214 = _212;
    if (_152)
    {
        _210 = (*spvDescriptorSet0.vp_c14)._m0[276].x;
    }
    float _216 = _210;
    bool _218 = _78 == 224;
    float _220 = _216;
    if (_152)
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
    float _228 = _198 + 1.2999999523162841796875;
    bool _230 = _78 == 240;
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
    float _240 = trunc(_228);
    int _242 = int(_240);
    bool _244 = _78 == 256;
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
    int _270 = min(_242, 15);
    bool _272 = _78 == 304;
    float _274 = _268;
    if (_208)
    {
        _266 = (*spvDescriptorSet0.vp_c14)._m0[281].x;
    }
    float _276 = _266;
    float _278 = float(_270);
    float _280 = _276;
    if (_208)
    {
        _274 = (*spvDescriptorSet0.vp_c14)._m0[281].z;
    }
    float _282 = _274;
    int _284 = _270 << 4;
    int _286 = _284 + 4288;
    float _288 = _282;
    if (_218)
    {
        _280 = (*spvDescriptorSet0.vp_c14)._m0[282].x;
    }
    float _290 = _280;
    bool _292 = _78 == 320;
    float _294 = -_278;
    float _296 = _294 + (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _298 = _290;
    if (_218)
    {
        _288 = (*spvDescriptorSet0.vp_c14)._m0[282].z;
    }
    float _300 = _288;
    float _302 = _300;
    if (_230)
    {
        _298 = (*spvDescriptorSet0.vp_c14)._m0[283].x;
    }
    float _304 = _298;
    float _306 = _296 + 1.0;
    bool _308 = _78 == 336;
    float _310 = _304;
    if (_230)
    {
        _302 = (*spvDescriptorSet0.vp_c14)._m0[283].z;
    }
    float _312 = _302;
    float _314 = _312;
    if (_244)
    {
        _310 = (*spvDescriptorSet0.vp_c14)._m0[284].x;
    }
    float _316 = _310;
    float _318 = exp2(_306);
    bool _320 = _78 == 352;
    float _322 = _316;
    if (_244)
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
    float _346 = 1.0 / _318;
    float _348 = _344;
    if (_272)
    {
        _342 = (*spvDescriptorSet0.vp_c14)._m0[287].x;
    }
    float _350 = _342;
    bool _352 = _78 == 400;
    float _354 = _350;
    if (_272)
    {
        _348 = (*spvDescriptorSet0.vp_c14)._m0[287].z;
    }
    float _356 = _348;
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
    if (_308)
    {
        _364 = (*spvDescriptorSet0.vp_c14)._m0[289].x;
    }
    float _370 = _364;
    bool _372 = _78 == 432;
    float _374 = _370;
    if (_308)
    {
        _368 = (*spvDescriptorSet0.vp_c14)._m0[289].z;
    }
    float _376 = _368;
    float _378 = _376;
    if (_320)
    {
        _374 = (*spvDescriptorSet0.vp_c14)._m0[290].x;
    }
    float _380 = _374;
    bool _382 = _78 == 448;
    float _384 = _380;
    if (_320)
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
    float _598 = _346 * _596;
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
    float _634 = _318 * _630;
    float _636 = -_614;
    float _638 = _606 + _636;
    float _640 = _638 * 2.0;
    float _642 = -_638;
    float _644 = fma(_634, _642, _63);
    int _646 = _286 + 8;
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
    float _731 = -_689;
    float _733 = fma(_731, _729, _695);
    float _735 = -_681;
    float _737 = fma(_735, _729, _683);
    float _739 = fma(_733, (*spvDescriptorSet0.vp_c15)._m0[6].x, (*spvDescriptorSet0.vp_c15)._m0[6].w);
    float _741 = fma(_737, (*spvDescriptorSet0.vp_c15)._m0[6].x, (*spvDescriptorSet0.vp_c15)._m0[6].z);
    float _743 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _739);
    float _745 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _741);
    float2 _2554 = float2(_745, _743);
    float _747 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2554, float2(0.0), isnan(_2554)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2554, float2(0.0), isnan(_2554)), level(0.0)).x;
    float _749 = fma(_733, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _751 = fma(_737, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _753 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _755 = _749 + _753;
    float _757 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _759 = _751 + _757;
    float _761 = fma(_737, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].z);
    float _763 = _755 * _755;
    float _765 = fma(_733, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].w);
    float _767 = fma(_759, _759, _763);
    float _769 = sqrt(_767);
    bool _771 = _769 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _773 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _775 = _769 + _773;
    float _777 = (*spvDescriptorSet0.vp_c15)._m0[4].x;
    float _779 = _769;
    float _781 = (*spvDescriptorSet0.vp_c15)._m0[6].x;
    float _783 = _767;
    if (_771)
    {
        float _785 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        _777 = _785;
    }
    float _787 = _777;
    float _789 = _787;
    float _791 = (*spvDescriptorSet0.vp_c14)._m0[0].y;
    if (_771)
    {
        float _793 = _775 * _787;
        _779 = _793;
    }
    float _795 = _779;
    if (_771)
    {
        float _797 = rsqrt(_767);
        _789 = _797;
    }
    float _799 = _789;
    float _801 = _799;
    if (_771)
    {
        float _803 = _795 * 0.15915493667125701904296875;
        _781 = _803;
    }
    float _805 = _781;
    float _807 = _795;
    if (_771)
    {
        float _809 = _805 * 6.283185482025146484375;
        float _811 = sin(_809);
        _807 = _811;
    }
    float _813 = _807;
    float _815 = _775;
    if (_771)
    {
        float _817 = _805 * 6.283185482025146484375;
        float _819 = cos(_817);
        _815 = _819;
    }
    float _821 = _815;
    float _823 = fma(_747, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    if (_771)
    {
        float _825 = _823 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        _791 = _825;
    }
    float _827 = _791;
    float _829 = _823 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _831 = _827;
    float _833 = _813;
    if (_771)
    {
        float _835 = fma(_813, _827, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        _831 = _835;
    }
    float _837 = _831;
    float _839 = _837;
    float _841 = _821;
    if (_771)
    {
        float _843 = _821 + (-1.0);
        _833 = _843;
    }
    float _845 = _833;
    float _847 = fma(_751, (*spvDescriptorSet0.vp_c4)._m0[2].x, _829);
    float _849 = 0.0;
    float _851 = _845;
    if (_771)
    {
        float _853 = _799 * _837;
        _849 = _853;
    }
    float _855 = _849;
    if (_771)
    {
        float _857 = _845 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        _783 = _857;
    }
    float _859 = _783;
    if (!_771)
    {
        _839 = _823;
    }
    float _861 = _839;
    float _863 = fma(_749, (*spvDescriptorSet0.vp_c4)._m0[2].z, _847);
    float _865 = _861;
    if (!_771)
    {
        _801 = _751;
    }
    float _867 = _801;
    float _869 = _867;
    if (_771)
    {
        float _871 = fma(_823, _821, _859);
        _865 = _871;
    }
    float _873 = _865;
    if (_771)
    {
        float _875 = fma(_759, _855, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        _869 = _875;
    }
    float _877 = _869;
    if (!_771)
    {
        _851 = _749;
    }
    float _879 = _851;
    float _881 = _879;
    if (_771)
    {
        float _883 = fma(_755, _855, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        _881 = _883;
    }
    float _885 = _881;
    float _887 = _873 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    if (_771)
    {
        float _889 = _873 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        _841 = _889;
    }
    float _891 = _841;
    float _893 = _873 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _895 = _863 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _897 = fma(_877, (*spvDescriptorSet0.vp_c4)._m0[1].x, _887);
    float _899 = _891;
    float _901 = _893;
    if (_771)
    {
        float _903 = fma(_877, (*spvDescriptorSet0.vp_c4)._m0[2].x, _891);
        _899 = _903;
    }
    float _905 = _899;
    float _907 = fma(_877, (*spvDescriptorSet0.vp_c4)._m0[0].x, _893);
    float _909 = fma(_885, (*spvDescriptorSet0.vp_c4)._m0[1].z, _897);
    float _911 = _905;
    if (_771)
    {
        float _913 = fma(_885, (*spvDescriptorSet0.vp_c4)._m0[2].z, _905);
        _911 = _913;
    }
    float _915 = _911;
    float _917 = fma(_885, (*spvDescriptorSet0.vp_c4)._m0[0].z, _907);
    int _919 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[40].w) & 2;
    bool _921 = _919 != 0;
    float _923 = _909 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    if (!_771)
    {
        _901 = _895;
    }
    float _925 = _901;
    float _927 = _917 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _929 = _925;
    if (_771)
    {
        float _931 = _915 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _929 = _931;
    }
    float _933 = _929;
    float _935 = _923 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _937 = _923 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _939 = _923 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _941 = _923 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _943 = fma(_927, (*spvDescriptorSet0.vp_c4)._m0[7].x, _935);
    float _945 = fma(_927, (*spvDescriptorSet0.vp_c4)._m0[8].x, _937);
    float _947 = fma(_927, (*spvDescriptorSet0.vp_c4)._m0[9].x, _939);
    float _949 = fma(_927, (*spvDescriptorSet0.vp_c4)._m0[10].x, _941);
    float _951 = fma(_933, (*spvDescriptorSet0.vp_c4)._m0[7].z, _943);
    float _953 = fma(_933, (*spvDescriptorSet0.vp_c4)._m0[8].z, _945);
    float _955 = fma(_933, (*spvDescriptorSet0.vp_c4)._m0[9].z, _947);
    float _957 = fma(_933, (*spvDescriptorSet0.vp_c4)._m0[10].z, _949);
    float _959 = _951 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _961 = _953 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _963 = _955 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _965 = _957 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    bool _967 = !_921;
    float _969;
    float _971;
    float _973;
    int _975;
    int _977;
    int _979;
    int _981;
    int _983;
    int _985;
    int _987;
    int _989;
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
    float _1031;
    if (!_967)
    {
        _969 = (*spvDescriptorSet0.vp_c9)._m0[919].z;
        _971 = (*spvDescriptorSet0.vp_c9)._m0[919].x;
        _973 = (*spvDescriptorSet0.vp_c9)._m0[919].y;
        _975 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[919].w);
        _977 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].x);
        _979 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].y);
        _981 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].z);
        _983 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].w);
        _985 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].x);
        _987 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].y);
        _989 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].w);
        _991 = (*spvDescriptorSet0.vp_c9)._m0[922].y;
        _993 = (*spvDescriptorSet0.vp_c9)._m0[923].y;
        _995 = (*spvDescriptorSet0.vp_c9)._m0[917].y;
        _997 = (*spvDescriptorSet0.vp_c9)._m0[916].w;
        _999 = (*spvDescriptorSet0.vp_c9)._m0[922].x;
        _1001 = (*spvDescriptorSet0.vp_c9)._m0[923].x;
        _1003 = (*spvDescriptorSet0.vp_c9)._m0[917].x;
        _1005 = (*spvDescriptorSet0.vp_c9)._m0[916].z;
        _1007 = (*spvDescriptorSet0.vp_c9)._m0[922].z;
        _1009 = (*spvDescriptorSet0.vp_c9)._m0[923].z;
        _1011 = (*spvDescriptorSet0.vp_c9)._m0[916].x;
        _1013 = (*spvDescriptorSet0.vp_c9)._m0[916].y;
        _1015 = (*spvDescriptorSet0.vp_c9)._m0[922].w;
        _1017 = (*spvDescriptorSet0.vp_c9)._m0[923].w;
        _1019 = (*spvDescriptorSet0.vp_c9)._m0[918].x;
        _1021 = (*spvDescriptorSet0.vp_c9)._m0[917].z;
        _1023 = (*spvDescriptorSet0.vp_c9)._m0[917].w;
        _1025 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].z);
        _1027 = (*spvDescriptorSet0.vp_c9)._m0[918].w;
        _1029 = (*spvDescriptorSet0.vp_c9)._m0[918].y;
        _1031 = (*spvDescriptorSet0.vp_c9)._m0[918].z;
        _1033 = true;
    }
    else
    {
        float _1035 = fma(_751, 6.2500002968590706586837768554688e-05, 0.5);
        float _1037 = fma(_749, 6.2500002968590706586837768554688e-05, 0.5);
        float3 _3067 = float3(_1035, _1037, float(0));
        float3 _3071 = select(_3067, float3(0.0), isnan(_3067));
        float4 _1040 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _3071.xy, uint(rint(_3071.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _3071.xy, uint(rint(_3071.z)), level(0.0)).xyzw;
        float _1042 = _1040.x;
        float _1044 = _1040.y;
        float _1046 = _1040.z;
        float _1048 = _1040.w;
        float3 _3086 = float3(_1035, _1037, float(1));
        float3 _3088 = select(_3086, float3(0.0), isnan(_3086));
        float4 _1050 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _3088.xy, uint(rint(_3088.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _3088.xy, uint(rint(_3088.z)), level(0.0)).xyzw;
        float _1052 = _1050.x;
        float _1054 = _1050.y;
        float _1056 = _1050.z;
        float _1058 = _1050.w;
        float3 _3103 = float3(_1035, _1037, float(2));
        float3 _3105 = select(_3103, float3(0.0), isnan(_3103));
        float4 _1060 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _3105.xy, uint(rint(_3105.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _3105.xy, uint(rint(_3105.z)), level(0.0)).xyzw;
        float _1062 = _1060.x;
        float _1064 = _1060.y;
        float _1066 = _1060.z;
        float _1068 = _1060.w;
        float3 _3120 = float3(_1035, _1037, float(3));
        float3 _3122 = select(_3120, float3(0.0), isnan(_3120));
        float4 _1070 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _3122.xy, uint(rint(_3122.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _3122.xy, uint(rint(_3122.z)), level(0.0)).xyzw;
        float _1072 = _1070.x;
        float _1074 = _1070.y;
        float _1076 = _1070.z;
        float _1078 = _1070.w;
        float3 _3137 = float3(_1035, _1037, float(4));
        float3 _3139 = select(_3137, float3(0.0), isnan(_3137));
        float4 _1080 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _3139.xy, uint(rint(_3139.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _3139.xy, uint(rint(_3139.z)), level(0.0)).xyzw;
        float _1082 = _1080.x;
        float _1084 = _1080.y;
        float _1086 = _1080.z;
        float _1088 = _1080.w;
        float3 _3155 = float3(_1035, _1037, float(5));
        float3 _3157 = select(_3155, float3(0.0), isnan(_3155));
        float4 _1090 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _3157.xy, uint(rint(_3157.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _3157.xy, uint(rint(_3157.z)), level(0.0)).xyzw;
        float _1092 = _1090.x;
        float _1094 = _1090.y;
        float _1096 = _1090.z;
        float _1098 = _1090.w;
        float3 _3172 = float3(_1035, _1037, float(6));
        float3 _3174 = select(_3172, float3(0.0), isnan(_3172));
        float4 _1100 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _3174.xy, uint(rint(_3174.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _3174.xy, uint(rint(_3174.z)), level(0.0)).xyzw;
        float _1102 = _1100.x;
        float _1104 = _1100.y;
        float _1106 = _1100.z;
        float _1108 = _1100.w;
        float3 _3189 = float3(_1035, _1037, float(7));
        float3 _3191 = select(_3189, float3(0.0), isnan(_3189));
        float4 _1110 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _3191.xy, uint(rint(_3191.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _3191.xy, uint(rint(_3191.z)), level(0.0)).xyzw;
        float _1112 = _1110.x;
        float _1114 = _1110.y;
        float _1116 = _1110.z;
        float _1118 = _1110.w;
        _969 = _1076;
        _971 = _1072;
        _973 = _1074;
        _975 = as_type<int>(_1078);
        _977 = as_type<int>(_1082);
        _979 = as_type<int>(_1084);
        _981 = as_type<int>(_1086);
        _983 = as_type<int>(_1088);
        _985 = as_type<int>(_1092);
        _987 = as_type<int>(_1094);
        _989 = as_type<int>(_1098);
        _991 = _1104;
        _993 = _1114;
        _995 = _1054;
        _997 = _1048;
        _999 = _1102;
        _1001 = _1112;
        _1003 = _1052;
        _1005 = _1046;
        _1007 = _1106;
        _1009 = _1116;
        _1011 = _1042;
        _1013 = _1044;
        _1015 = _1108;
        _1017 = _1118;
        _1019 = _1062;
        _1021 = _1056;
        _1023 = _1058;
        _1025 = as_type<int>(_1096);
        _1027 = _1068;
        _1029 = _1064;
        _1031 = _1066;
    }
    _1033 = false;
    float _1120 = _969;
    float _1122 = _971;
    float _1124 = _973;
    int _1126 = _975;
    int _1128 = _977;
    int _1130 = _979;
    int _1132 = _981;
    int _1134 = _983;
    int _1136 = _985;
    int _1138 = _987;
    int _1140 = _989;
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
    float _1182 = _1031;
    float _1184 = -(*spvDescriptorSet0.vp_c4)._m0[12].w;
    float _1186 = _823 + _1184;
    float _1188 = -(*spvDescriptorSet0.vp_c4)._m0[11].w;
    float _1190 = _751 + _1188;
    float _1192 = -(*spvDescriptorSet0.vp_c4)._m0[13].w;
    float _1194 = _749 + _1192;
    float _1196 = _1120 * 0.88622701168060302734375;
    float _1198 = _1186 * _1186;
    out.gl_Position.x = _959;
    out.gl_Position.y = _961;
    out.gl_Position.z = _963;
    out.gl_Position.w = _965;
    float _1200 = _1122 * 0.88622701168060302734375;
    float _1202 = _1124 * 0.88622701168060302734375;
    float _1204 = fma(_1190, _1190, _1198);
    float _1206 = _921 ? as_type<float>(_1126) : 0.0;
    out.m_43.x = _751;
    out.m_43.y = _823;
    out.m_43.z = _749;
    float _1208 = _921 ? as_type<float>(_1128) : 0.0;
    float _1210 = fma(_1194, _1194, _1204);
    float _1212 = _921 ? as_type<float>(_1130) : 0.0;
    out.m_45.z = _761;
    out.m_45.w = _765;
    float _1214 = _921 ? _1200 : 0.0;
    float _1216 = _921 ? _1202 : 0.0;
    float _1218 = rsqrt(_1210);
    float _1220 = _921 ? _1196 : 0.0;
    float _1222 = _921 ? as_type<float>(_1132) : 0.0;
    float _1224 = _921 ? as_type<float>(_1134) : 0.0;
    float _1226 = _921 ? as_type<float>(_1136) : 0.0;
    float _1228 = _921 ? as_type<float>(_1138) : 0.0;
    float _1230 = _921 ? as_type<float>(_1140) : 0.0;
    float _1232 = _1218 * 1.02332699298858642578125;
    float _1234 = _1194 * _1218;
    float _1236 = _1186 * _1232;
    float _1238 = _1234 * (-1.02332699298858642578125);
    float _1240 = _1190 * _1232;
    float _1242 = _1236 * _1142;
    float _1244 = _1236 * _1144;
    float _1246 = _1236 * _1146;
    float _1248 = _1236 * _1148;
    float _1250 = fma(_1150, 0.88622701168060302734375, _1242);
    float _1252 = fma(_1152, 0.88622701168060302734375, _1244);
    float _1254 = _1236 * _1154;
    float _1256 = fma(_1156, 0.88622701168060302734375, _1246);
    float _1258 = fma(_1238, _1158, _1250);
    float _1260 = fma(_1238, _1160, _1252);
    float _1262 = fma(_1162, 0.88622701168060302734375, _1248);
    float _1264 = fma(_1164, 0.88622701168060302734375, _1254);
    float _1266 = fma(_1240, _1166, _1258);
    float _1268 = fma(_1240, _1168, _1260);
    float _1270 = fma(_1206, _1236, _1214);
    float _1272 = fma(_1208, _1236, _1216);
    float _1274 = fma(_1212, _1236, _1220);
    float _1276 = precise::max(0.0, _1266);
    float _1278 = fma(_1238, _1170, _1256);
    float _1280 = precise::max(0.0, _1268);
    float _1282 = fma(_1238, _1172, _1262);
    float _1284 = fma(_1238, _1174, _1264);
    float _1286 = _1276 * 0.31830990314483642578125;
    float _1288 = precise::clamp(_1286, 0.0, 1.0);
    float _1290 = fma(_1222, _1238, _1270);
    float _1292 = _1280 * 0.31830990314483642578125;
    float _1294 = precise::clamp(_1292, 0.0, 1.0);
    float _1296 = fma(_1224, _1238, _1272);
    float _1298 = fma(_1226, _1238, _1274);
    float _1300 = _921 ? as_type<float>(_1176) : 0.0;
    float _1302 = fma(_1240, _1178, _1278);
    float _1304 = fma(_1240, _1180, _1282);
    float _1306 = fma(_1240, _1182, _1284);
    float _1308 = _1288 * 0.88622701168060302734375;
    float _1310 = -_1294;
    float _1312 = _1310 + 1.0;
    float _1314 = fma(_1228, _1240, _1290);
    float _1316 = fma(_1300, _1240, _1296);
    float _1318 = fma(_1230, _1240, _1298);
    float _1320 = precise::max(0.0, _1302);
    float _1322 = fma(_1312, (*spvDescriptorSet0.vp_c9)._m0[37].y, _1294);
    float _1324 = precise::max(0.0, _1304);
    float _1326 = _1308 * (*spvDescriptorSet0.vp_c9)._m0[991].z;
    float _1328 = precise::max(0.0, _1306);
    float _1330 = _1308 * (*spvDescriptorSet0.vp_c9)._m0[991].x;
    float _1332 = _1308 * (*spvDescriptorSet0.vp_c9)._m0[991].y;
    float _1334 = precise::max(0.0, _1314);
    float _1336 = fma(_1320, (*spvDescriptorSet0.vp_c9)._m0[68].z, _1326);
    float _1338 = precise::max(0.0, _1316);
    float _1340 = fma(_1324, (*spvDescriptorSet0.vp_c9)._m0[68].x, _1330);
    float _1342 = _1322 * (*spvDescriptorSet0.vp_c9)._m0[40].z;
    float _1344 = fma(_1328, (*spvDescriptorSet0.vp_c9)._m0[68].y, _1332);
    float _1346 = precise::max(0.0, _1318);
    float _1348 = fma(_1334, _1342, _1340);
    float _1350 = fma(_1338, _1342, _1344);
    float _1352 = fma(_1346, _1342, _1336);
    out.m_47.w = (*spvDescriptorSet0.vp_c15)._m0[7].y;
    out.m_49.x = _1348;
    out.m_49.y = _1350;
    out.m_49.z = _1352;
    out.m_49.w = _895;
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
    bool _1033 = false;
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
    float _110 = fma(_63, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _112 = 0.0;
    float _114 = _100;
    if (_82)
    {
        _112 = (*spvDescriptorSet0.vp_c14)._m0[268].z;
    }
    float _116 = _112;
    float _118 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _120 = _108 + _118;
    float _122 = _116;
    if (_84)
    {
        _114 = (*spvDescriptorSet0.vp_c14)._m0[269].x;
    }
    float _124 = _114;
    float _126 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _128 = _110 + _126;
    float _130 = fma(_65, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _132 = _120 * _120;
    bool _134 = _78 == 112;
    float _136 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _138 = _130 + _136;
    float _140 = fma(_128, _128, _132);
    float _142 = _124;
    if (_84)
    {
        _122 = (*spvDescriptorSet0.vp_c14)._m0[269].z;
    }
    float _144 = _122;
    float _146 = _144;
    if (_86)
    {
        _142 = (*spvDescriptorSet0.vp_c14)._m0[270].x;
    }
    float _148 = _142;
    float _150 = fma(_138, _138, _140);
    bool _152 = _78 == 128;
    float _154 = _148;
    if (_86)
    {
        _146 = (*spvDescriptorSet0.vp_c14)._m0[270].z;
    }
    float _156 = _146;
    float _158 = rsqrt(_150);
    float _160 = _156;
    if (_88)
    {
        _154 = (*spvDescriptorSet0.vp_c14)._m0[271].x;
    }
    float _162 = _154;
    bool _164 = _78 == 144;
    float _166 = _162;
    if (_88)
    {
        _160 = (*spvDescriptorSet0.vp_c14)._m0[271].z;
    }
    float _168 = _160;
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
    float _186 = _158 * (*spvDescriptorSet0.vp_c14)._m0[268].x;
    float _188 = _182;
    if (_96)
    {
        _180 = (*spvDescriptorSet0.vp_c14)._m0[273].z;
    }
    float _190 = _180;
    bool _192 = _78 == 192;
    float _194 = _190;
    if (_106)
    {
        _188 = (*spvDescriptorSet0.vp_c14)._m0[274].x;
    }
    float _196 = _188;
    float _198 = log2(_186);
    float _200 = _196;
    if (_106)
    {
        _194 = (*spvDescriptorSet0.vp_c14)._m0[274].z;
    }
    float _202 = _194;
    float _204 = _202;
    if (_134)
    {
        _200 = (*spvDescriptorSet0.vp_c14)._m0[275].x;
    }
    float _206 = _200;
    bool _208 = _78 == 208;
    float _210 = _206;
    if (_134)
    {
        _204 = (*spvDescriptorSet0.vp_c14)._m0[275].z;
    }
    float _212 = _204;
    float _214 = _212;
    if (_152)
    {
        _210 = (*spvDescriptorSet0.vp_c14)._m0[276].x;
    }
    float _216 = _210;
    bool _218 = _78 == 224;
    float _220 = _216;
    if (_152)
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
    float _228 = _198 + 1.2999999523162841796875;
    bool _230 = _78 == 240;
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
    float _240 = trunc(_228);
    int _242 = int(_240);
    bool _244 = _78 == 256;
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
    int _270 = min(_242, 15);
    bool _272 = _78 == 304;
    float _274 = _268;
    if (_208)
    {
        _266 = (*spvDescriptorSet0.vp_c14)._m0[281].x;
    }
    float _276 = _266;
    float _278 = float(_270);
    float _280 = _276;
    if (_208)
    {
        _274 = (*spvDescriptorSet0.vp_c14)._m0[281].z;
    }
    float _282 = _274;
    int _284 = _270 << 4;
    int _286 = _284 + 4288;
    float _288 = _282;
    if (_218)
    {
        _280 = (*spvDescriptorSet0.vp_c14)._m0[282].x;
    }
    float _290 = _280;
    bool _292 = _78 == 320;
    float _294 = -_278;
    float _296 = _294 + (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _298 = _290;
    if (_218)
    {
        _288 = (*spvDescriptorSet0.vp_c14)._m0[282].z;
    }
    float _300 = _288;
    float _302 = _300;
    if (_230)
    {
        _298 = (*spvDescriptorSet0.vp_c14)._m0[283].x;
    }
    float _304 = _298;
    float _306 = _296 + 1.0;
    bool _308 = _78 == 336;
    float _310 = _304;
    if (_230)
    {
        _302 = (*spvDescriptorSet0.vp_c14)._m0[283].z;
    }
    float _312 = _302;
    float _314 = _312;
    if (_244)
    {
        _310 = (*spvDescriptorSet0.vp_c14)._m0[284].x;
    }
    float _316 = _310;
    float _318 = exp2(_306);
    bool _320 = _78 == 352;
    float _322 = _316;
    if (_244)
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
    float _346 = 1.0 / _318;
    float _348 = _344;
    if (_272)
    {
        _342 = (*spvDescriptorSet0.vp_c14)._m0[287].x;
    }
    float _350 = _342;
    bool _352 = _78 == 400;
    float _354 = _350;
    if (_272)
    {
        _348 = (*spvDescriptorSet0.vp_c14)._m0[287].z;
    }
    float _356 = _348;
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
    if (_308)
    {
        _364 = (*spvDescriptorSet0.vp_c14)._m0[289].x;
    }
    float _370 = _364;
    bool _372 = _78 == 432;
    float _374 = _370;
    if (_308)
    {
        _368 = (*spvDescriptorSet0.vp_c14)._m0[289].z;
    }
    float _376 = _368;
    float _378 = _376;
    if (_320)
    {
        _374 = (*spvDescriptorSet0.vp_c14)._m0[290].x;
    }
    float _380 = _374;
    bool _382 = _78 == 448;
    float _384 = _380;
    if (_320)
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
    float _598 = _346 * _596;
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
    float _634 = _318 * _630;
    float _636 = -_614;
    float _638 = _606 + _636;
    float _640 = _638 * 2.0;
    float _642 = -_638;
    float _644 = fma(_634, _642, _63);
    int _646 = _286 + 8;
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
    float _731 = -_689;
    float _733 = fma(_731, _729, _695);
    float _735 = -_681;
    float _737 = fma(_735, _729, _683);
    float _739 = fma(_733, (*spvDescriptorSet0.vp_c15)._m0[6].x, (*spvDescriptorSet0.vp_c15)._m0[6].w);
    float _741 = fma(_737, (*spvDescriptorSet0.vp_c15)._m0[6].x, (*spvDescriptorSet0.vp_c15)._m0[6].z);
    float _743 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _739);
    float _745 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _741);
    float2 _2554 = float2(_745, _743);
    float _747 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2554, float2(0.0), isnan(_2554)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2554, float2(0.0), isnan(_2554)), level(0.0)).x;
    float _749 = fma(_733, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _751 = fma(_737, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _753 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _755 = _749 + _753;
    float _757 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _759 = _751 + _757;
    float _761 = fma(_737, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].z);
    float _763 = _755 * _755;
    float _765 = fma(_733, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].w);
    float _767 = fma(_759, _759, _763);
    float _769 = sqrt(_767);
    bool _771 = _769 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _773 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _775 = _769 + _773;
    float _777 = (*spvDescriptorSet0.vp_c15)._m0[4].x;
    float _779 = _769;
    float _781 = (*spvDescriptorSet0.vp_c15)._m0[6].x;
    float _783 = _767;
    if (_771)
    {
        float _785 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        _777 = _785;
    }
    float _787 = _777;
    float _789 = _787;
    float _791 = (*spvDescriptorSet0.vp_c14)._m0[0].y;
    if (_771)
    {
        float _793 = _775 * _787;
        _779 = _793;
    }
    float _795 = _779;
    if (_771)
    {
        float _797 = rsqrt(_767);
        _789 = _797;
    }
    float _799 = _789;
    float _801 = _799;
    if (_771)
    {
        float _803 = _795 * 0.15915493667125701904296875;
        _781 = _803;
    }
    float _805 = _781;
    float _807 = _795;
    if (_771)
    {
        float _809 = _805 * 6.283185482025146484375;
        float _811 = sin(_809);
        _807 = _811;
    }
    float _813 = _807;
    float _815 = _775;
    if (_771)
    {
        float _817 = _805 * 6.283185482025146484375;
        float _819 = cos(_817);
        _815 = _819;
    }
    float _821 = _815;
    float _823 = fma(_747, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    if (_771)
    {
        float _825 = _823 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        _791 = _825;
    }
    float _827 = _791;
    float _829 = _823 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _831 = _827;
    float _833 = _813;
    if (_771)
    {
        float _835 = fma(_813, _827, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        _831 = _835;
    }
    float _837 = _831;
    float _839 = _837;
    float _841 = _821;
    if (_771)
    {
        float _843 = _821 + (-1.0);
        _833 = _843;
    }
    float _845 = _833;
    float _847 = fma(_751, (*spvDescriptorSet0.vp_c4)._m0[2].x, _829);
    float _849 = 0.0;
    float _851 = _845;
    if (_771)
    {
        float _853 = _799 * _837;
        _849 = _853;
    }
    float _855 = _849;
    if (_771)
    {
        float _857 = _845 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        _783 = _857;
    }
    float _859 = _783;
    if (!_771)
    {
        _839 = _823;
    }
    float _861 = _839;
    float _863 = fma(_749, (*spvDescriptorSet0.vp_c4)._m0[2].z, _847);
    float _865 = _861;
    if (!_771)
    {
        _801 = _751;
    }
    float _867 = _801;
    float _869 = _867;
    if (_771)
    {
        float _871 = fma(_823, _821, _859);
        _865 = _871;
    }
    float _873 = _865;
    if (_771)
    {
        float _875 = fma(_759, _855, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        _869 = _875;
    }
    float _877 = _869;
    if (!_771)
    {
        _851 = _749;
    }
    float _879 = _851;
    float _881 = _879;
    if (_771)
    {
        float _883 = fma(_755, _855, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        _881 = _883;
    }
    float _885 = _881;
    float _887 = _873 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    if (_771)
    {
        float _889 = _873 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        _841 = _889;
    }
    float _891 = _841;
    float _893 = _873 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _895 = _863 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _897 = fma(_877, (*spvDescriptorSet0.vp_c4)._m0[1].x, _887);
    float _899 = _891;
    float _901 = _893;
    if (_771)
    {
        float _903 = fma(_877, (*spvDescriptorSet0.vp_c4)._m0[2].x, _891);
        _899 = _903;
    }
    float _905 = _899;
    float _907 = fma(_877, (*spvDescriptorSet0.vp_c4)._m0[0].x, _893);
    float _909 = fma(_885, (*spvDescriptorSet0.vp_c4)._m0[1].z, _897);
    float _911 = _905;
    if (_771)
    {
        float _913 = fma(_885, (*spvDescriptorSet0.vp_c4)._m0[2].z, _905);
        _911 = _913;
    }
    float _915 = _911;
    float _917 = fma(_885, (*spvDescriptorSet0.vp_c4)._m0[0].z, _907);
    int _919 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[40].w) & 2;
    bool _921 = _919 != 0;
    float _923 = _909 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    if (!_771)
    {
        _901 = _895;
    }
    float _925 = _901;
    float _927 = _917 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _929 = _925;
    if (_771)
    {
        float _931 = _915 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _929 = _931;
    }
    float _933 = _929;
    float _935 = _923 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _937 = _923 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _939 = _923 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _941 = _923 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _943 = fma(_927, (*spvDescriptorSet0.vp_c4)._m0[7].x, _935);
    float _945 = fma(_927, (*spvDescriptorSet0.vp_c4)._m0[8].x, _937);
    float _947 = fma(_927, (*spvDescriptorSet0.vp_c4)._m0[9].x, _939);
    float _949 = fma(_927, (*spvDescriptorSet0.vp_c4)._m0[10].x, _941);
    float _951 = fma(_933, (*spvDescriptorSet0.vp_c4)._m0[7].z, _943);
    float _953 = fma(_933, (*spvDescriptorSet0.vp_c4)._m0[8].z, _945);
    float _955 = fma(_933, (*spvDescriptorSet0.vp_c4)._m0[9].z, _947);
    float _957 = fma(_933, (*spvDescriptorSet0.vp_c4)._m0[10].z, _949);
    float _959 = _951 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _961 = _953 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _963 = _955 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _965 = _957 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    bool _967 = !_921;
    float _969;
    float _971;
    float _973;
    int _975;
    int _977;
    int _979;
    int _981;
    int _983;
    int _985;
    int _987;
    int _989;
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
    float _1031;
    if (!_967)
    {
        _969 = (*spvDescriptorSet0.vp_c9)._m0[919].z;
        _971 = (*spvDescriptorSet0.vp_c9)._m0[919].x;
        _973 = (*spvDescriptorSet0.vp_c9)._m0[919].y;
        _975 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[919].w);
        _977 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].x);
        _979 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].y);
        _981 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].z);
        _983 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].w);
        _985 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].x);
        _987 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].y);
        _989 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].w);
        _991 = (*spvDescriptorSet0.vp_c9)._m0[922].y;
        _993 = (*spvDescriptorSet0.vp_c9)._m0[923].y;
        _995 = (*spvDescriptorSet0.vp_c9)._m0[917].y;
        _997 = (*spvDescriptorSet0.vp_c9)._m0[916].w;
        _999 = (*spvDescriptorSet0.vp_c9)._m0[922].x;
        _1001 = (*spvDescriptorSet0.vp_c9)._m0[923].x;
        _1003 = (*spvDescriptorSet0.vp_c9)._m0[917].x;
        _1005 = (*spvDescriptorSet0.vp_c9)._m0[916].z;
        _1007 = (*spvDescriptorSet0.vp_c9)._m0[922].z;
        _1009 = (*spvDescriptorSet0.vp_c9)._m0[923].z;
        _1011 = (*spvDescriptorSet0.vp_c9)._m0[916].x;
        _1013 = (*spvDescriptorSet0.vp_c9)._m0[916].y;
        _1015 = (*spvDescriptorSet0.vp_c9)._m0[922].w;
        _1017 = (*spvDescriptorSet0.vp_c9)._m0[923].w;
        _1019 = (*spvDescriptorSet0.vp_c9)._m0[918].x;
        _1021 = (*spvDescriptorSet0.vp_c9)._m0[917].z;
        _1023 = (*spvDescriptorSet0.vp_c9)._m0[917].w;
        _1025 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].z);
        _1027 = (*spvDescriptorSet0.vp_c9)._m0[918].w;
        _1029 = (*spvDescriptorSet0.vp_c9)._m0[918].y;
        _1031 = (*spvDescriptorSet0.vp_c9)._m0[918].z;
        _1033 = true;
    }
    else
    {
        float _1035 = fma(_751, 6.2500002968590706586837768554688e-05, 0.5);
        float _1037 = fma(_749, 6.2500002968590706586837768554688e-05, 0.5);
        float3 _3067 = float3(_1035, _1037, float(0));
        float3 _3071 = select(_3067, float3(0.0), isnan(_3067));
        float4 _1040 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _3071.xy, uint(rint(_3071.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _3071.xy, uint(rint(_3071.z)), level(0.0)).xyzw;
        float _1042 = _1040.x;
        float _1044 = _1040.y;
        float _1046 = _1040.z;
        float _1048 = _1040.w;
        float3 _3086 = float3(_1035, _1037, float(1));
        float3 _3088 = select(_3086, float3(0.0), isnan(_3086));
        float4 _1050 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _3088.xy, uint(rint(_3088.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _3088.xy, uint(rint(_3088.z)), level(0.0)).xyzw;
        float _1052 = _1050.x;
        float _1054 = _1050.y;
        float _1056 = _1050.z;
        float _1058 = _1050.w;
        float3 _3103 = float3(_1035, _1037, float(2));
        float3 _3105 = select(_3103, float3(0.0), isnan(_3103));
        float4 _1060 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _3105.xy, uint(rint(_3105.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _3105.xy, uint(rint(_3105.z)), level(0.0)).xyzw;
        float _1062 = _1060.x;
        float _1064 = _1060.y;
        float _1066 = _1060.z;
        float _1068 = _1060.w;
        float3 _3120 = float3(_1035, _1037, float(3));
        float3 _3122 = select(_3120, float3(0.0), isnan(_3120));
        float4 _1070 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _3122.xy, uint(rint(_3122.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _3122.xy, uint(rint(_3122.z)), level(0.0)).xyzw;
        float _1072 = _1070.x;
        float _1074 = _1070.y;
        float _1076 = _1070.z;
        float _1078 = _1070.w;
        float3 _3137 = float3(_1035, _1037, float(4));
        float3 _3139 = select(_3137, float3(0.0), isnan(_3137));
        float4 _1080 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _3139.xy, uint(rint(_3139.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _3139.xy, uint(rint(_3139.z)), level(0.0)).xyzw;
        float _1082 = _1080.x;
        float _1084 = _1080.y;
        float _1086 = _1080.z;
        float _1088 = _1080.w;
        float3 _3155 = float3(_1035, _1037, float(5));
        float3 _3157 = select(_3155, float3(0.0), isnan(_3155));
        float4 _1090 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _3157.xy, uint(rint(_3157.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _3157.xy, uint(rint(_3157.z)), level(0.0)).xyzw;
        float _1092 = _1090.x;
        float _1094 = _1090.y;
        float _1096 = _1090.z;
        float _1098 = _1090.w;
        float3 _3172 = float3(_1035, _1037, float(6));
        float3 _3174 = select(_3172, float3(0.0), isnan(_3172));
        float4 _1100 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _3174.xy, uint(rint(_3174.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _3174.xy, uint(rint(_3174.z)), level(0.0)).xyzw;
        float _1102 = _1100.x;
        float _1104 = _1100.y;
        float _1106 = _1100.z;
        float _1108 = _1100.w;
        float3 _3189 = float3(_1035, _1037, float(7));
        float3 _3191 = select(_3189, float3(0.0), isnan(_3189));
        float4 _1110 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, _3191.xy, uint(rint(_3191.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, _3191.xy, uint(rint(_3191.z)), level(0.0)).xyzw;
        float _1112 = _1110.x;
        float _1114 = _1110.y;
        float _1116 = _1110.z;
        float _1118 = _1110.w;
        _969 = _1076;
        _971 = _1072;
        _973 = _1074;
        _975 = as_type<int>(_1078);
        _977 = as_type<int>(_1082);
        _979 = as_type<int>(_1084);
        _981 = as_type<int>(_1086);
        _983 = as_type<int>(_1088);
        _985 = as_type<int>(_1092);
        _987 = as_type<int>(_1094);
        _989 = as_type<int>(_1098);
        _991 = _1104;
        _993 = _1114;
        _995 = _1054;
        _997 = _1048;
        _999 = _1102;
        _1001 = _1112;
        _1003 = _1052;
        _1005 = _1046;
        _1007 = _1106;
        _1009 = _1116;
        _1011 = _1042;
        _1013 = _1044;
        _1015 = _1108;
        _1017 = _1118;
        _1019 = _1062;
        _1021 = _1056;
        _1023 = _1058;
        _1025 = as_type<int>(_1096);
        _1027 = _1068;
        _1029 = _1064;
        _1031 = _1066;
    }
    _1033 = false;
    float _1120 = _969;
    float _1122 = _971;
    float _1124 = _973;
    int _1126 = _975;
    int _1128 = _977;
    int _1130 = _979;
    int _1132 = _981;
    int _1134 = _983;
    int _1136 = _985;
    int _1138 = _987;
    int _1140 = _989;
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
    float _1182 = _1031;
    float _1184 = -(*spvDescriptorSet0.vp_c4)._m0[12].w;
    float _1186 = _823 + _1184;
    float _1188 = -(*spvDescriptorSet0.vp_c4)._m0[11].w;
    float _1190 = _751 + _1188;
    float _1192 = -(*spvDescriptorSet0.vp_c4)._m0[13].w;
    float _1194 = _749 + _1192;
    float _1196 = _1120 * 0.88622701168060302734375;
    float _1198 = _1186 * _1186;
    out.gl_Position.x = _959;
    out.gl_Position.y = _961;
    out.gl_Position.z = _963;
    out.gl_Position.w = _965;
    float _1200 = _1122 * 0.88622701168060302734375;
    float _1202 = _1124 * 0.88622701168060302734375;
    float _1204 = fma(_1190, _1190, _1198);
    float _1206 = _921 ? as_type<float>(_1126) : 0.0;
    out.m_43.x = _751;
    out.m_43.y = _823;
    out.m_43.z = _749;
    float _1208 = _921 ? as_type<float>(_1128) : 0.0;
    float _1210 = fma(_1194, _1194, _1204);
    float _1212 = _921 ? as_type<float>(_1130) : 0.0;
    out.m_45.z = _761;
    out.m_45.w = _765;
    float _1214 = _921 ? _1200 : 0.0;
    float _1216 = _921 ? _1202 : 0.0;
    float _1218 = rsqrt(_1210);
    float _1220 = _921 ? _1196 : 0.0;
    float _1222 = _921 ? as_type<float>(_1132) : 0.0;
    float _1224 = _921 ? as_type<float>(_1134) : 0.0;
    float _1226 = _921 ? as_type<float>(_1136) : 0.0;
    float _1228 = _921 ? as_type<float>(_1138) : 0.0;
    float _1230 = _921 ? as_type<float>(_1140) : 0.0;
    float _1232 = _1218 * 1.02332699298858642578125;
    float _1234 = _1194 * _1218;
    float _1236 = _1186 * _1232;
    float _1238 = _1234 * (-1.02332699298858642578125);
    float _1240 = _1190 * _1232;
    float _1242 = _1236 * _1142;
    float _1244 = _1236 * _1144;
    float _1246 = _1236 * _1146;
    float _1248 = _1236 * _1148;
    float _1250 = fma(_1150, 0.88622701168060302734375, _1242);
    float _1252 = fma(_1152, 0.88622701168060302734375, _1244);
    float _1254 = _1236 * _1154;
    float _1256 = fma(_1156, 0.88622701168060302734375, _1246);
    float _1258 = fma(_1238, _1158, _1250);
    float _1260 = fma(_1238, _1160, _1252);
    float _1262 = fma(_1162, 0.88622701168060302734375, _1248);
    float _1264 = fma(_1164, 0.88622701168060302734375, _1254);
    float _1266 = fma(_1240, _1166, _1258);
    float _1268 = fma(_1240, _1168, _1260);
    float _1270 = fma(_1206, _1236, _1214);
    float _1272 = fma(_1208, _1236, _1216);
    float _1274 = fma(_1212, _1236, _1220);
    float _1276 = precise::max(0.0, _1266);
    float _1278 = fma(_1238, _1170, _1256);
    float _1280 = precise::max(0.0, _1268);
    float _1282 = fma(_1238, _1172, _1262);
    float _1284 = fma(_1238, _1174, _1264);
    float _1286 = _1276 * 0.31830990314483642578125;
    float _1288 = precise::clamp(_1286, 0.0, 1.0);
    float _1290 = fma(_1222, _1238, _1270);
    float _1292 = _1280 * 0.31830990314483642578125;
    float _1294 = precise::clamp(_1292, 0.0, 1.0);
    float _1296 = fma(_1224, _1238, _1272);
    float _1298 = fma(_1226, _1238, _1274);
    float _1300 = _921 ? as_type<float>(_1176) : 0.0;
    float _1302 = fma(_1240, _1178, _1278);
    float _1304 = fma(_1240, _1180, _1282);
    float _1306 = fma(_1240, _1182, _1284);
    float _1308 = _1288 * 0.88622701168060302734375;
    float _1310 = -_1294;
    float _1312 = _1310 + 1.0;
    float _1314 = fma(_1228, _1240, _1290);
    float _1316 = fma(_1300, _1240, _1296);
    float _1318 = fma(_1230, _1240, _1298);
    float _1320 = precise::max(0.0, _1302);
    float _1322 = fma(_1312, (*spvDescriptorSet0.vp_c9)._m0[37].y, _1294);
    float _1324 = precise::max(0.0, _1304);
    float _1326 = _1308 * (*spvDescriptorSet0.vp_c9)._m0[991].z;
    float _1328 = precise::max(0.0, _1306);
    float _1330 = _1308 * (*spvDescriptorSet0.vp_c9)._m0[991].x;
    float _1332 = _1308 * (*spvDescriptorSet0.vp_c9)._m0[991].y;
    float _1334 = precise::max(0.0, _1314);
    float _1336 = fma(_1320, (*spvDescriptorSet0.vp_c9)._m0[68].z, _1326);
    float _1338 = precise::max(0.0, _1316);
    float _1340 = fma(_1324, (*spvDescriptorSet0.vp_c9)._m0[68].x, _1330);
    float _1342 = _1322 * (*spvDescriptorSet0.vp_c9)._m0[40].z;
    float _1344 = fma(_1328, (*spvDescriptorSet0.vp_c9)._m0[68].y, _1332);
    float _1346 = precise::max(0.0, _1318);
    float _1348 = fma(_1334, _1342, _1340);
    float _1350 = fma(_1338, _1342, _1344);
    float _1352 = fma(_1346, _1342, _1336);
    out.m_47.w = (*spvDescriptorSet0.vp_c15)._m0[7].y;
    out.m_49.x = _1348;
    out.m_49.y = _1350;
    out.m_49.z = _1352;
    out.m_49.w = _895;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

