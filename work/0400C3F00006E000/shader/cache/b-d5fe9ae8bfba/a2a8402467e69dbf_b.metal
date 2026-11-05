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
    sampler vp_t_tcb_8Smplr_w [[id(9)]];
    sampler vp_t_tcb_ASmplr_w [[id(10)]];
    constant dm_border_t* dm_border [[id(11)]];
};

struct main0_out
{
    float4 m_40 [[user(locn0)]];
    float4 m_42 [[user(locn1)]];
    float4 m_48 [[user(locn2)]];
    float4 m_44 [[user(locn3)]];
    float4 m_46 [[user(locn4)]];
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
    out.m_40 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _62 = in.m_37.x;
    float _64 = in.m_37.y;
    float _66 = -(*spvDescriptorSet0.vp_c15)._m0[3].x;
    float _68 = _66 + (*spvDescriptorSet0.vp_c15)._m0[3].y;
    int _71 = 16 + as_type<int>(as_type<float>(gl_BaseInstance));
    int _73 = _71 << 4;
    bool _77 = _73 == 0;
    bool _79 = _73 == 16;
    bool _81 = _73 == 32;
    bool _83 = _73 == 48;
    bool _85 = _73 == 64;
    float _87 = fma(_68, _62, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _89 = fma(_62, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    bool _91 = _73 == 80;
    bool _93 = _64 >= 0.5;
    bool _95 = isnan(_64);
    bool _97 = _93 || _95;
    bool _99 = isnan(0.5);
    bool _101 = _97 || _99;
    float _103 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _105 = _87 + _103;
    float _107 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _109 = _89 + _107;
    float _111 = as_type<float>(gl_BaseInstance);
    if (_77)
    {
        _111 = (*spvDescriptorSet0.vp_c14)._m0[268].x;
    }
    float _113 = _111;
    float _115 = _105 * _105;
    bool _117 = _73 == 96;
    float _119 = 0.0;
    float _121 = _113;
    float _123 = (*spvDescriptorSet0.vp_c15)._m0[5].x;
    if (_77)
    {
        _119 = (*spvDescriptorSet0.vp_c14)._m0[268].z;
    }
    float _125 = _119;
    float _127 = fma(_109, _109, _115);
    float _129 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _131 = (*spvDescriptorSet0.vp_c15)._m0[0].w + _129;
    float _133 = _125;
    if (_79)
    {
        _121 = (*spvDescriptorSet0.vp_c14)._m0[269].x;
    }
    float _135 = _121;
    bool _137 = _73 == 112;
    float _139 = fma(_131, _131, _127);
    float _141 = _135;
    if (_79)
    {
        _133 = (*spvDescriptorSet0.vp_c14)._m0[269].z;
    }
    float _143 = _133;
    float _145 = _143;
    if (_81)
    {
        _141 = (*spvDescriptorSet0.vp_c14)._m0[270].x;
    }
    float _147 = _141;
    bool _149 = _73 == 128;
    float _151 = rsqrt(_139);
    float _153 = _147;
    if (_81)
    {
        _145 = (*spvDescriptorSet0.vp_c14)._m0[270].z;
    }
    float _155 = _145;
    float _157 = _155;
    if (_83)
    {
        _153 = (*spvDescriptorSet0.vp_c14)._m0[271].x;
    }
    float _159 = _153;
    bool _161 = _73 == 144;
    float _163 = _159;
    if (_83)
    {
        _157 = (*spvDescriptorSet0.vp_c14)._m0[271].z;
    }
    float _165 = _157;
    float _167 = _165;
    if (_85)
    {
        _163 = (*spvDescriptorSet0.vp_c14)._m0[272].x;
    }
    float _169 = _163;
    bool _171 = _73 == 160;
    float _173 = _169;
    if (_85)
    {
        _167 = (*spvDescriptorSet0.vp_c14)._m0[272].z;
    }
    float _175 = _167;
    float _177 = _175;
    if (_91)
    {
        _173 = (*spvDescriptorSet0.vp_c14)._m0[273].x;
    }
    float _179 = _173;
    float _181 = _151 * (*spvDescriptorSet0.vp_c14)._m0[268].x;
    bool _183 = _73 == 176;
    float _185 = _179;
    if (_91)
    {
        _177 = (*spvDescriptorSet0.vp_c14)._m0[273].z;
    }
    float _187 = _177;
    bool _189 = _73 == 192;
    float _191 = log2(_181);
    float _193 = _187;
    if (_117)
    {
        _185 = (*spvDescriptorSet0.vp_c14)._m0[274].x;
    }
    float _195 = _185;
    float _197 = _195;
    if (_117)
    {
        _193 = (*spvDescriptorSet0.vp_c14)._m0[274].z;
    }
    float _199 = _193;
    float _201 = _199;
    if (_137)
    {
        _197 = (*spvDescriptorSet0.vp_c14)._m0[275].x;
    }
    float _203 = _197;
    bool _205 = _73 == 208;
    float _207 = _203;
    if (_137)
    {
        _201 = (*spvDescriptorSet0.vp_c14)._m0[275].z;
    }
    float _209 = _201;
    float _211 = _209;
    if (_149)
    {
        _207 = (*spvDescriptorSet0.vp_c14)._m0[276].x;
    }
    float _213 = _207;
    bool _215 = _73 == 224;
    float _217 = _213;
    if (_149)
    {
        _211 = (*spvDescriptorSet0.vp_c14)._m0[276].z;
    }
    float _219 = _211;
    float _221 = _191 + 1.2999999523162841796875;
    float _223 = _219;
    if (_161)
    {
        _217 = (*spvDescriptorSet0.vp_c14)._m0[277].x;
    }
    float _225 = _217;
    bool _227 = _73 == 240;
    float _229 = _225;
    if (_161)
    {
        _223 = (*spvDescriptorSet0.vp_c14)._m0[277].z;
    }
    float _231 = _223;
    float _233 = trunc(_221);
    int _235 = int(_233);
    float _237 = _231;
    if (_171)
    {
        _229 = (*spvDescriptorSet0.vp_c14)._m0[278].x;
    }
    float _239 = _229;
    bool _241 = _73 == 256;
    float _243 = _239;
    if (_171)
    {
        _237 = (*spvDescriptorSet0.vp_c14)._m0[278].z;
    }
    float _245 = _237;
    float _247 = _245;
    if (_183)
    {
        _243 = (*spvDescriptorSet0.vp_c14)._m0[279].x;
    }
    float _249 = _243;
    bool _251 = _73 == 272;
    float _253 = _249;
    if (_183)
    {
        _247 = (*spvDescriptorSet0.vp_c14)._m0[279].z;
    }
    float _255 = _247;
    float _257 = _255;
    if (_189)
    {
        _253 = (*spvDescriptorSet0.vp_c14)._m0[280].x;
    }
    float _259 = _253;
    bool _261 = _73 == 288;
    int _263 = min(_235, 15);
    float _265 = _259;
    if (_189)
    {
        _257 = (*spvDescriptorSet0.vp_c14)._m0[280].z;
    }
    float _267 = _257;
    bool _269 = _73 == 304;
    float _271 = float(_263);
    float _273 = _267;
    if (_205)
    {
        _265 = (*spvDescriptorSet0.vp_c14)._m0[281].x;
    }
    float _275 = _265;
    int _277 = _263 << 4;
    int _279 = _277 + 4288;
    float _281 = _275;
    if (_205)
    {
        _273 = (*spvDescriptorSet0.vp_c14)._m0[281].z;
    }
    float _283 = _273;
    float _285 = _283;
    if (_215)
    {
        _281 = (*spvDescriptorSet0.vp_c14)._m0[282].x;
    }
    float _287 = _281;
    float _289 = -_271;
    float _291 = _289 + (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _293 = _73 == 320;
    int _295 = _279 + 8;
    uint _298 = uint(int(uint(_295) >> uint(2)));
    uint _300 = uint(int(uint(int(_298)) >> uint(2)));
    int _302 = int(_298) & 3;
    float _304 = (*spvDescriptorSet0.vp_c14)._m0[int(_300)][_302];
    int _306 = int(_298) + 1;
    uint _308 = uint(int(uint(_306) >> uint(2)));
    int _310 = _306 & 3;
    float _312 = (*spvDescriptorSet0.vp_c14)._m0[int(_308)][_310];
    float _314 = _287;
    if (_215)
    {
        _285 = (*spvDescriptorSet0.vp_c14)._m0[282].z;
    }
    float _316 = _285;
    float _318 = _291 + 1.0;
    float _320 = _316;
    if (_227)
    {
        _314 = (*spvDescriptorSet0.vp_c14)._m0[283].x;
    }
    float _322 = _314;
    bool _324 = _73 == 336;
    float _326 = _322;
    if (_227)
    {
        _320 = (*spvDescriptorSet0.vp_c14)._m0[283].z;
    }
    float _328 = _320;
    float _330 = exp2(_318);
    float _332 = _328;
    if (_241)
    {
        _326 = (*spvDescriptorSet0.vp_c14)._m0[284].x;
    }
    float _334 = _326;
    float _336 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].w);
    bool _338 = _73 == 352;
    float _340 = _334;
    if (_241)
    {
        _332 = (*spvDescriptorSet0.vp_c14)._m0[284].z;
    }
    float _342 = _332;
    float _344 = _342;
    if (_251)
    {
        _340 = (*spvDescriptorSet0.vp_c14)._m0[285].x;
    }
    float _346 = _340;
    bool _348 = _73 == 368;
    float _350 = _346;
    if (_251)
    {
        _344 = (*spvDescriptorSet0.vp_c14)._m0[285].z;
    }
    float _352 = _344;
    float _354 = _352;
    if (_261)
    {
        _350 = (*spvDescriptorSet0.vp_c14)._m0[286].x;
    }
    float _356 = _350;
    bool _358 = _73 == 384;
    float _360 = 1.0 / _330;
    float _362 = _356;
    float _364 = _330;
    if (_261)
    {
        _354 = (*spvDescriptorSet0.vp_c14)._m0[286].z;
    }
    float _366 = _354;
    float _368 = _366;
    if (_269)
    {
        _362 = (*spvDescriptorSet0.vp_c14)._m0[287].x;
    }
    float _370 = _362;
    bool _372 = _73 == 400;
    float _374 = _370;
    if (_269)
    {
        _368 = (*spvDescriptorSet0.vp_c14)._m0[287].z;
    }
    float _376 = _368;
    bool _378 = _73 == 416;
    float _380 = _376;
    if (_293)
    {
        _374 = (*spvDescriptorSet0.vp_c14)._m0[288].x;
    }
    float _382 = _374;
    float _384 = _382;
    if (_293)
    {
        _380 = (*spvDescriptorSet0.vp_c14)._m0[288].z;
    }
    float _386 = _380;
    float _388 = _386;
    if (_324)
    {
        _384 = (*spvDescriptorSet0.vp_c14)._m0[289].x;
    }
    float _390 = _384;
    bool _392 = _73 == 432;
    float _394 = _390;
    if (_324)
    {
        _388 = (*spvDescriptorSet0.vp_c14)._m0[289].z;
    }
    float _396 = _388;
    float _398 = _396;
    if (_338)
    {
        _394 = (*spvDescriptorSet0.vp_c14)._m0[290].x;
    }
    float _400 = _394;
    bool _402 = _73 == 448;
    float _404 = _400;
    if (_338)
    {
        _398 = (*spvDescriptorSet0.vp_c14)._m0[290].z;
    }
    float _406 = _398;
    float _408 = _406;
    if (_348)
    {
        _404 = (*spvDescriptorSet0.vp_c14)._m0[291].x;
    }
    float _410 = _404;
    bool _412 = _73 == 464;
    float _414 = _410;
    if (_348)
    {
        _408 = (*spvDescriptorSet0.vp_c14)._m0[291].z;
    }
    float _416 = _408;
    float _418 = _416;
    if (_358)
    {
        _414 = (*spvDescriptorSet0.vp_c14)._m0[292].x;
    }
    float _420 = _414;
    bool _422 = _73 == 480;
    float _424 = _420;
    if (_358)
    {
        _418 = (*spvDescriptorSet0.vp_c14)._m0[292].z;
    }
    float _426 = _418;
    float _428 = _426;
    if (_372)
    {
        _424 = (*spvDescriptorSet0.vp_c14)._m0[293].x;
    }
    float _430 = _424;
    bool _432 = _73 == 496;
    float _434 = _430;
    if (_372)
    {
        _428 = (*spvDescriptorSet0.vp_c14)._m0[293].z;
    }
    float _436 = _428;
    float _438 = _436;
    if (_378)
    {
        _434 = (*spvDescriptorSet0.vp_c14)._m0[294].x;
    }
    float _440 = _434;
    bool _442 = _73 == 512;
    float _444 = _440;
    if (_378)
    {
        _438 = (*spvDescriptorSet0.vp_c14)._m0[294].z;
    }
    float _446 = _438;
    bool _448 = _73 == 528;
    float _450 = _446;
    if (_392)
    {
        _444 = (*spvDescriptorSet0.vp_c14)._m0[295].x;
    }
    float _452 = _444;
    float _454 = _452;
    if (_392)
    {
        _450 = (*spvDescriptorSet0.vp_c14)._m0[295].z;
    }
    float _456 = _450;
    float _458 = _456;
    if (_402)
    {
        _454 = (*spvDescriptorSet0.vp_c14)._m0[296].x;
    }
    float _460 = _454;
    bool _462 = _73 == 544;
    float _464 = _460;
    if (_402)
    {
        _458 = (*spvDescriptorSet0.vp_c14)._m0[296].z;
    }
    float _466 = _458;
    float _468 = _466;
    if (_412)
    {
        _464 = (*spvDescriptorSet0.vp_c14)._m0[297].x;
    }
    float _470 = _464;
    bool _472 = _73 == 560;
    float _474 = _470;
    if (_412)
    {
        _468 = (*spvDescriptorSet0.vp_c14)._m0[297].z;
    }
    float _476 = _468;
    float _478 = _476;
    if (_422)
    {
        _474 = (*spvDescriptorSet0.vp_c14)._m0[298].x;
    }
    float _480 = _474;
    bool _482 = _73 == 576;
    float _484 = _480;
    if (_422)
    {
        _478 = (*spvDescriptorSet0.vp_c14)._m0[298].z;
    }
    float _486 = _478;
    float _488 = _486;
    if (_432)
    {
        _484 = (*spvDescriptorSet0.vp_c14)._m0[299].x;
    }
    float _490 = _484;
    bool _492 = _73 == 592;
    float _494 = _490;
    if (_432)
    {
        _488 = (*spvDescriptorSet0.vp_c14)._m0[299].z;
    }
    float _496 = _488;
    float _498 = _496;
    if (_442)
    {
        _494 = (*spvDescriptorSet0.vp_c14)._m0[300].x;
    }
    float _500 = _494;
    bool _502 = _73 == 608;
    float _504 = _500;
    if (_442)
    {
        _498 = (*spvDescriptorSet0.vp_c14)._m0[300].z;
    }
    float _506 = _498;
    float _508 = _506;
    if (_448)
    {
        _504 = (*spvDescriptorSet0.vp_c14)._m0[301].x;
    }
    float _510 = _504;
    bool _512 = _73 == 624;
    float _514 = _510;
    if (_448)
    {
        _508 = (*spvDescriptorSet0.vp_c14)._m0[301].z;
    }
    float _516 = _508;
    bool _518 = _73 == 640;
    float _520 = _516;
    if (_462)
    {
        _514 = (*spvDescriptorSet0.vp_c14)._m0[302].x;
    }
    float _522 = _514;
    float _524 = _522;
    if (_462)
    {
        _520 = (*spvDescriptorSet0.vp_c14)._m0[302].z;
    }
    float _526 = _520;
    float _528 = _526;
    if (_472)
    {
        _524 = (*spvDescriptorSet0.vp_c14)._m0[303].x;
    }
    float _530 = _524;
    bool _532 = _73 == 656;
    float _534 = _530;
    if (_472)
    {
        _528 = (*spvDescriptorSet0.vp_c14)._m0[303].z;
    }
    float _536 = _528;
    float _538 = _536;
    if (_482)
    {
        _534 = (*spvDescriptorSet0.vp_c14)._m0[304].x;
    }
    float _540 = _534;
    bool _542 = _73 == 672;
    float _544 = _540;
    if (_482)
    {
        _538 = (*spvDescriptorSet0.vp_c14)._m0[304].z;
    }
    float _546 = _538;
    float _548 = _546;
    if (_492)
    {
        _544 = (*spvDescriptorSet0.vp_c14)._m0[305].x;
    }
    float _550 = _544;
    bool _552 = _73 == 688;
    float _554 = _550;
    if (_492)
    {
        _548 = (*spvDescriptorSet0.vp_c14)._m0[305].z;
    }
    float _556 = _548;
    float _558 = _556;
    if (_502)
    {
        _554 = (*spvDescriptorSet0.vp_c14)._m0[306].x;
    }
    float _560 = _554;
    bool _562 = _73 == 704;
    float _564 = _560;
    if (_502)
    {
        _558 = (*spvDescriptorSet0.vp_c14)._m0[306].z;
    }
    float _566 = _558;
    float _568 = _566;
    if (_512)
    {
        _564 = (*spvDescriptorSet0.vp_c14)._m0[307].x;
    }
    float _570 = _564;
    bool _572 = _73 == 720;
    float _574 = _570;
    if (_512)
    {
        _568 = (*spvDescriptorSet0.vp_c14)._m0[307].z;
    }
    float _576 = _568;
    float _578 = _576;
    if (_518)
    {
        _574 = (*spvDescriptorSet0.vp_c14)._m0[308].x;
    }
    float _580 = _574;
    bool _582 = _73 == 736;
    float _584 = _580;
    if (_518)
    {
        _578 = (*spvDescriptorSet0.vp_c14)._m0[308].z;
    }
    float _586 = _578;
    bool _588 = _73 == 752;
    float _590 = _586;
    if (_532)
    {
        _584 = (*spvDescriptorSet0.vp_c14)._m0[309].x;
    }
    float _592 = _584;
    float _594 = _592;
    if (_542)
    {
        _594 = (*spvDescriptorSet0.vp_c14)._m0[310].x;
    }
    float _596 = _594;
    float _598 = _596;
    if (_552)
    {
        _598 = (*spvDescriptorSet0.vp_c14)._m0[311].x;
    }
    float _600 = _598;
    float _602 = _600;
    if (_562)
    {
        _602 = (*spvDescriptorSet0.vp_c14)._m0[312].x;
    }
    float _604 = _602;
    float _606 = _604;
    if (_572)
    {
        _606 = (*spvDescriptorSet0.vp_c14)._m0[313].x;
    }
    float _608 = _606;
    float _610 = _608;
    if (_582)
    {
        _610 = (*spvDescriptorSet0.vp_c14)._m0[314].x;
    }
    float _612 = _610;
    float _614 = _612;
    if (_588)
    {
        _614 = (*spvDescriptorSet0.vp_c14)._m0[315].x;
    }
    float _616 = _614;
    float _618 = _360 * _616;
    if (_532)
    {
        _590 = (*spvDescriptorSet0.vp_c14)._m0[309].z;
    }
    float _620 = _590;
    float _622 = _620;
    if (_542)
    {
        _622 = (*spvDescriptorSet0.vp_c14)._m0[310].z;
    }
    float _624 = _622;
    float _626 = _618 * _62;
    float _628 = _624;
    if (_552)
    {
        _628 = (*spvDescriptorSet0.vp_c14)._m0[311].z;
    }
    float _630 = _628;
    float _632 = _630;
    if (_562)
    {
        _632 = (*spvDescriptorSet0.vp_c14)._m0[312].z;
    }
    float _634 = _632;
    float _636 = floor(_626);
    float _638 = _634;
    if (_572)
    {
        _638 = (*spvDescriptorSet0.vp_c14)._m0[313].z;
    }
    float _640 = _638;
    float _642 = _640;
    if (_582)
    {
        _642 = (*spvDescriptorSet0.vp_c14)._m0[314].z;
    }
    float _644 = _642;
    float _646 = _644;
    if (_588)
    {
        _646 = (*spvDescriptorSet0.vp_c14)._m0[315].z;
    }
    float _648 = _646;
    float _650 = -_636;
    float _652 = _626 + _650;
    float _654 = _330 * _648;
    float _656 = _652 * 2.0;
    float _658 = -_652;
    float _660 = fma(_654, _658, _62);
    float _662 = floor(_656);
    float _664 = _654 * _662;
    float _666 = _664 * 0.5;
    float _668 = _654;
    float _670 = _666;
    float _672 = _652;
    if (!_101)
    {
        _668 = (*spvDescriptorSet0.vp_c15)._m0[6].x;
    }
    float _674 = _668;
    float _676 = _666 + _660;
    float _678 = _674;
    if (!_101)
    {
        float _680 = fma(_336, _674, (*spvDescriptorSet0.vp_c15)._m0[6].w);
        _364 = _680;
    }
    float _682 = _364;
    float _684 = fma(_68, _676, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _686 = fma(_676, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _688 = _682;
    if (!_101)
    {
        float _690 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _682);
        _688 = _690;
    }
    float _692 = _688;
    float _694 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _696 = _684 + _694;
    float _698 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _700 = _686 + _698;
    float _702 = _696 * _696;
    float _704 = fma(_700, _700, _702);
    float _706 = fma(_131, _131, _704);
    float _708 = sqrt(_706);
    float _710 = -_312;
    float _712 = fma(_708, _304, _710);
    float _714 = precise::clamp(_712, 0.0, 1.0);
    float _716 = -_666;
    float _718 = fma(_716, _714, _676);
    float _720 = fma(_718, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _722 = fma(_720, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].z);
    float _724 = _706;
    if (!_101)
    {
        float _726 = fma(_722, _674, (*spvDescriptorSet0.vp_c15)._m0[6].z);
        _123 = _726;
    }
    float _728 = _123;
    float _730 = _728;
    if (!_101)
    {
        float _732 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _728);
        _724 = _732;
    }
    float _734 = _724;
    if (!_101)
    {
        float2 _2138 = float2(_734, _692);
        float _736 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2138, float2(0.0), isnan(_2138)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2138, float2(0.0), isnan(_2138)), level(0.0)).x;
        _730 = _736;
    }
    float _738 = _730;
    if (_101)
    {
        _678 = (*spvDescriptorSet0.vp_c15)._m0[14].x;
    }
    float _740 = _678;
    float _742 = _740;
    if (_101)
    {
        _670 = (*spvDescriptorSet0.vp_c15)._m0[15].x;
    }
    float _744 = _670;
    if (_101)
    {
        float _746 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, _740, (*spvDescriptorSet0.vp_c15)._m0[14].w);
        _672 = _746;
    }
    float _748 = _672;
    float _750 = _748;
    if (_101)
    {
        float _752 = fma(_720, _740, (*spvDescriptorSet0.vp_c15)._m0[14].z);
        _742 = _752;
    }
    float _754 = _742;
    float _756 = _754;
    if (_101)
    {
        float _758 = fma(_748, _744, (*spvDescriptorSet0.vp_c15)._m0[15].w);
        _750 = _758;
    }
    float _760 = _750;
    float _762 = _760;
    if (_101)
    {
        float _764 = fma(_754, _744, (*spvDescriptorSet0.vp_c15)._m0[15].z);
        _756 = _764;
    }
    float _766 = _756;
    float _768 = _766;
    if (_101)
    {
        float _770 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _760);
        _762 = _770;
    }
    float _772 = _762;
    if (_101)
    {
        float _774 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _766);
        _768 = _774;
    }
    float _776 = _768;
    float _778 = _738;
    float _780 = _776;
    if (_101)
    {
        float2 _2232 = float2(_776, _772);
        float _782 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_2232, float2(0.0), isnan(_2232)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_2232, float2(0.0), isnan(_2232)), level(0.0)).x;
        _778 = _782;
    }
    float _784 = _778;
    float _786 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _788 = (*spvDescriptorSet0.vp_c15)._m0[0].w + _786;
    float _790 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _792 = _720 + _790;
    float _794 = _788 * _788;
    float _796 = fma(_792, _792, _794);
    float _798 = sqrt(_796);
    float _800 = fma(_336, (*spvDescriptorSet0.vp_c15)._m0[8].x, (*spvDescriptorSet0.vp_c15)._m0[8].w);
    float _802 = fma(_722, (*spvDescriptorSet0.vp_c15)._m0[8].x, (*spvDescriptorSet0.vp_c15)._m0[8].z);
    float _804 = fma(_336, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].w);
    float _806 = fma(_722, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].z);
    bool _808 = _798 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _810 = (*spvDescriptorSet0.vp_c15)._m0[7].x;
    float _812 = (*spvDescriptorSet0.vp_c14)._m0[0].y;
    if (!_808)
    {
        _780 = _720;
    }
    float _814 = _780;
    float _816 = fma(_784, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _818 = _816 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _820 = _814;
    if (!_808)
    {
        _810 = _816;
    }
    float _822 = _810;
    float _824 = fma(_720, (*spvDescriptorSet0.vp_c4)._m0[2].x, _818);
    float _826 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, (*spvDescriptorSet0.vp_c4)._m0[2].z, _824);
    float _828 = _826 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _830 = _826;
    float _832 = _822;
    if (!_808)
    {
        _830 = (*spvDescriptorSet0.vp_c15)._m0[0].w;
    }
    float _834 = _830;
    float _836 = _834;
    if (!_808)
    {
        _812 = _828;
    }
    float _838 = _812;
    bool _840 = !_808;
    float _842 = _838;
    if (!_840)
    {
        float _844 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _846 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _848 = _798 + _846;
        float _850 = _816 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _852 = _848 * _844;
        float _854 = rsqrt(_796);
        float _856 = _852 * 0.15915493667125701904296875;
        float _858 = _856 * 6.283185482025146484375;
        float _860 = cos(_858);
        float _862 = _856 * 6.283185482025146484375;
        float _864 = sin(_862);
        float _866 = _860 + (-1.0);
        float _868 = fma(_864, _850, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _870 = _866 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _872 = _854 * _868;
        float _874 = fma(_816, _860, _870);
        float _876 = fma(_792, _872, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _878 = _874 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _880 = fma(_788, _872, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _882 = fma(_876, (*spvDescriptorSet0.vp_c4)._m0[2].x, _878);
        float _884 = fma(_880, (*spvDescriptorSet0.vp_c4)._m0[2].z, _882);
        float _886 = _884 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _832 = _874;
        _820 = _876;
        _836 = _880;
        _842 = _886;
    }
    float _888 = _832;
    float _890 = _820;
    float _892 = _836;
    float _894 = _842;
    float _896 = _888 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _898 = _888 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    out.m_40.z = _806;
    out.m_40.w = _804;
    float _900 = fma(_890, (*spvDescriptorSet0.vp_c4)._m0[1].x, _896);
    float _902 = fma(_890, (*spvDescriptorSet0.vp_c4)._m0[0].x, _898);
    out.m_42.x = _802;
    float _904 = fma(_892, (*spvDescriptorSet0.vp_c4)._m0[1].z, _900);
    float _906 = fma(_892, (*spvDescriptorSet0.vp_c4)._m0[0].z, _902);
    out.m_42.y = _800;
    float _908 = _904 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _910 = _906 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _912 = -_828;
    float _914 = -(*spvDescriptorSet0.vp_c9)._m0[72].y;
    float _916 = _912 + _914;
    out.m_44.x = _720;
    out.m_44.y = _816;
    out.m_44.z = (*spvDescriptorSet0.vp_c15)._m0[0].w;
    float _918 = _908 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _920 = _908 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _922 = _908 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _924 = _908 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _926 = fma(_910, (*spvDescriptorSet0.vp_c4)._m0[8].x, _918);
    float _928 = fma(_910, (*spvDescriptorSet0.vp_c4)._m0[7].x, _920);
    float _930 = fma(_910, (*spvDescriptorSet0.vp_c4)._m0[9].x, _922);
    float _932 = fma(_910, (*spvDescriptorSet0.vp_c4)._m0[10].x, _924);
    float _934 = fma(_894, (*spvDescriptorSet0.vp_c4)._m0[8].z, _926);
    float _936 = fma(_894, (*spvDescriptorSet0.vp_c4)._m0[7].z, _928);
    float _938 = fma(_894, (*spvDescriptorSet0.vp_c4)._m0[9].z, _930);
    float _940 = fma(_894, (*spvDescriptorSet0.vp_c4)._m0[10].z, _932);
    float _942 = _916 * (*spvDescriptorSet0.vp_c9)._m0[72].z;
    float _944 = _936 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _946 = _934 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _948 = _938 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _950 = _940 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.m_42.w = (*spvDescriptorSet0.vp_c15)._m0[7].y;
    out.m_46.w = _828;
    out.m_48.w = _942;
    out.gl_Position.x = _944;
    out.gl_Position.y = _946;
    out.gl_Position.z = _948;
    out.gl_Position.w = _950;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_BaseInstance [[base_instance]])
{
    main0_out out = {};
    out.m_40 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _62 = in.m_37.x;
    float _64 = in.m_37.y;
    float _66 = -(*spvDescriptorSet0.vp_c15)._m0[3].x;
    float _68 = _66 + (*spvDescriptorSet0.vp_c15)._m0[3].y;
    int _71 = 16 + as_type<int>(as_type<float>(gl_BaseInstance));
    int _73 = _71 << 4;
    bool _77 = _73 == 0;
    bool _79 = _73 == 16;
    bool _81 = _73 == 32;
    bool _83 = _73 == 48;
    bool _85 = _73 == 64;
    float _87 = fma(_68, _62, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _89 = fma(_62, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    bool _91 = _73 == 80;
    bool _93 = _64 >= 0.5;
    bool _95 = isnan(_64);
    bool _97 = _93 || _95;
    bool _99 = isnan(0.5);
    bool _101 = _97 || _99;
    float _103 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _105 = _87 + _103;
    float _107 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _109 = _89 + _107;
    float _111 = as_type<float>(gl_BaseInstance);
    if (_77)
    {
        _111 = (*spvDescriptorSet0.vp_c14)._m0[268].x;
    }
    float _113 = _111;
    float _115 = _105 * _105;
    bool _117 = _73 == 96;
    float _119 = 0.0;
    float _121 = _113;
    float _123 = (*spvDescriptorSet0.vp_c15)._m0[5].x;
    if (_77)
    {
        _119 = (*spvDescriptorSet0.vp_c14)._m0[268].z;
    }
    float _125 = _119;
    float _127 = fma(_109, _109, _115);
    float _129 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _131 = (*spvDescriptorSet0.vp_c15)._m0[0].w + _129;
    float _133 = _125;
    if (_79)
    {
        _121 = (*spvDescriptorSet0.vp_c14)._m0[269].x;
    }
    float _135 = _121;
    bool _137 = _73 == 112;
    float _139 = fma(_131, _131, _127);
    float _141 = _135;
    if (_79)
    {
        _133 = (*spvDescriptorSet0.vp_c14)._m0[269].z;
    }
    float _143 = _133;
    float _145 = _143;
    if (_81)
    {
        _141 = (*spvDescriptorSet0.vp_c14)._m0[270].x;
    }
    float _147 = _141;
    bool _149 = _73 == 128;
    float _151 = rsqrt(_139);
    float _153 = _147;
    if (_81)
    {
        _145 = (*spvDescriptorSet0.vp_c14)._m0[270].z;
    }
    float _155 = _145;
    float _157 = _155;
    if (_83)
    {
        _153 = (*spvDescriptorSet0.vp_c14)._m0[271].x;
    }
    float _159 = _153;
    bool _161 = _73 == 144;
    float _163 = _159;
    if (_83)
    {
        _157 = (*spvDescriptorSet0.vp_c14)._m0[271].z;
    }
    float _165 = _157;
    float _167 = _165;
    if (_85)
    {
        _163 = (*spvDescriptorSet0.vp_c14)._m0[272].x;
    }
    float _169 = _163;
    bool _171 = _73 == 160;
    float _173 = _169;
    if (_85)
    {
        _167 = (*spvDescriptorSet0.vp_c14)._m0[272].z;
    }
    float _175 = _167;
    float _177 = _175;
    if (_91)
    {
        _173 = (*spvDescriptorSet0.vp_c14)._m0[273].x;
    }
    float _179 = _173;
    float _181 = _151 * (*spvDescriptorSet0.vp_c14)._m0[268].x;
    bool _183 = _73 == 176;
    float _185 = _179;
    if (_91)
    {
        _177 = (*spvDescriptorSet0.vp_c14)._m0[273].z;
    }
    float _187 = _177;
    bool _189 = _73 == 192;
    float _191 = log2(_181);
    float _193 = _187;
    if (_117)
    {
        _185 = (*spvDescriptorSet0.vp_c14)._m0[274].x;
    }
    float _195 = _185;
    float _197 = _195;
    if (_117)
    {
        _193 = (*spvDescriptorSet0.vp_c14)._m0[274].z;
    }
    float _199 = _193;
    float _201 = _199;
    if (_137)
    {
        _197 = (*spvDescriptorSet0.vp_c14)._m0[275].x;
    }
    float _203 = _197;
    bool _205 = _73 == 208;
    float _207 = _203;
    if (_137)
    {
        _201 = (*spvDescriptorSet0.vp_c14)._m0[275].z;
    }
    float _209 = _201;
    float _211 = _209;
    if (_149)
    {
        _207 = (*spvDescriptorSet0.vp_c14)._m0[276].x;
    }
    float _213 = _207;
    bool _215 = _73 == 224;
    float _217 = _213;
    if (_149)
    {
        _211 = (*spvDescriptorSet0.vp_c14)._m0[276].z;
    }
    float _219 = _211;
    float _221 = _191 + 1.2999999523162841796875;
    float _223 = _219;
    if (_161)
    {
        _217 = (*spvDescriptorSet0.vp_c14)._m0[277].x;
    }
    float _225 = _217;
    bool _227 = _73 == 240;
    float _229 = _225;
    if (_161)
    {
        _223 = (*spvDescriptorSet0.vp_c14)._m0[277].z;
    }
    float _231 = _223;
    float _233 = trunc(_221);
    int _235 = int(_233);
    float _237 = _231;
    if (_171)
    {
        _229 = (*spvDescriptorSet0.vp_c14)._m0[278].x;
    }
    float _239 = _229;
    bool _241 = _73 == 256;
    float _243 = _239;
    if (_171)
    {
        _237 = (*spvDescriptorSet0.vp_c14)._m0[278].z;
    }
    float _245 = _237;
    float _247 = _245;
    if (_183)
    {
        _243 = (*spvDescriptorSet0.vp_c14)._m0[279].x;
    }
    float _249 = _243;
    bool _251 = _73 == 272;
    float _253 = _249;
    if (_183)
    {
        _247 = (*spvDescriptorSet0.vp_c14)._m0[279].z;
    }
    float _255 = _247;
    float _257 = _255;
    if (_189)
    {
        _253 = (*spvDescriptorSet0.vp_c14)._m0[280].x;
    }
    float _259 = _253;
    bool _261 = _73 == 288;
    int _263 = min(_235, 15);
    float _265 = _259;
    if (_189)
    {
        _257 = (*spvDescriptorSet0.vp_c14)._m0[280].z;
    }
    float _267 = _257;
    bool _269 = _73 == 304;
    float _271 = float(_263);
    float _273 = _267;
    if (_205)
    {
        _265 = (*spvDescriptorSet0.vp_c14)._m0[281].x;
    }
    float _275 = _265;
    int _277 = _263 << 4;
    int _279 = _277 + 4288;
    float _281 = _275;
    if (_205)
    {
        _273 = (*spvDescriptorSet0.vp_c14)._m0[281].z;
    }
    float _283 = _273;
    float _285 = _283;
    if (_215)
    {
        _281 = (*spvDescriptorSet0.vp_c14)._m0[282].x;
    }
    float _287 = _281;
    float _289 = -_271;
    float _291 = _289 + (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _293 = _73 == 320;
    int _295 = _279 + 8;
    uint _298 = uint(int(uint(_295) >> uint(2)));
    uint _300 = uint(int(uint(int(_298)) >> uint(2)));
    int _302 = int(_298) & 3;
    float _304 = (*spvDescriptorSet0.vp_c14)._m0[int(_300)][_302];
    int _306 = int(_298) + 1;
    uint _308 = uint(int(uint(_306) >> uint(2)));
    int _310 = _306 & 3;
    float _312 = (*spvDescriptorSet0.vp_c14)._m0[int(_308)][_310];
    float _314 = _287;
    if (_215)
    {
        _285 = (*spvDescriptorSet0.vp_c14)._m0[282].z;
    }
    float _316 = _285;
    float _318 = _291 + 1.0;
    float _320 = _316;
    if (_227)
    {
        _314 = (*spvDescriptorSet0.vp_c14)._m0[283].x;
    }
    float _322 = _314;
    bool _324 = _73 == 336;
    float _326 = _322;
    if (_227)
    {
        _320 = (*spvDescriptorSet0.vp_c14)._m0[283].z;
    }
    float _328 = _320;
    float _330 = exp2(_318);
    float _332 = _328;
    if (_241)
    {
        _326 = (*spvDescriptorSet0.vp_c14)._m0[284].x;
    }
    float _334 = _326;
    float _336 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].w);
    bool _338 = _73 == 352;
    float _340 = _334;
    if (_241)
    {
        _332 = (*spvDescriptorSet0.vp_c14)._m0[284].z;
    }
    float _342 = _332;
    float _344 = _342;
    if (_251)
    {
        _340 = (*spvDescriptorSet0.vp_c14)._m0[285].x;
    }
    float _346 = _340;
    bool _348 = _73 == 368;
    float _350 = _346;
    if (_251)
    {
        _344 = (*spvDescriptorSet0.vp_c14)._m0[285].z;
    }
    float _352 = _344;
    float _354 = _352;
    if (_261)
    {
        _350 = (*spvDescriptorSet0.vp_c14)._m0[286].x;
    }
    float _356 = _350;
    bool _358 = _73 == 384;
    float _360 = 1.0 / _330;
    float _362 = _356;
    float _364 = _330;
    if (_261)
    {
        _354 = (*spvDescriptorSet0.vp_c14)._m0[286].z;
    }
    float _366 = _354;
    float _368 = _366;
    if (_269)
    {
        _362 = (*spvDescriptorSet0.vp_c14)._m0[287].x;
    }
    float _370 = _362;
    bool _372 = _73 == 400;
    float _374 = _370;
    if (_269)
    {
        _368 = (*spvDescriptorSet0.vp_c14)._m0[287].z;
    }
    float _376 = _368;
    bool _378 = _73 == 416;
    float _380 = _376;
    if (_293)
    {
        _374 = (*spvDescriptorSet0.vp_c14)._m0[288].x;
    }
    float _382 = _374;
    float _384 = _382;
    if (_293)
    {
        _380 = (*spvDescriptorSet0.vp_c14)._m0[288].z;
    }
    float _386 = _380;
    float _388 = _386;
    if (_324)
    {
        _384 = (*spvDescriptorSet0.vp_c14)._m0[289].x;
    }
    float _390 = _384;
    bool _392 = _73 == 432;
    float _394 = _390;
    if (_324)
    {
        _388 = (*spvDescriptorSet0.vp_c14)._m0[289].z;
    }
    float _396 = _388;
    float _398 = _396;
    if (_338)
    {
        _394 = (*spvDescriptorSet0.vp_c14)._m0[290].x;
    }
    float _400 = _394;
    bool _402 = _73 == 448;
    float _404 = _400;
    if (_338)
    {
        _398 = (*spvDescriptorSet0.vp_c14)._m0[290].z;
    }
    float _406 = _398;
    float _408 = _406;
    if (_348)
    {
        _404 = (*spvDescriptorSet0.vp_c14)._m0[291].x;
    }
    float _410 = _404;
    bool _412 = _73 == 464;
    float _414 = _410;
    if (_348)
    {
        _408 = (*spvDescriptorSet0.vp_c14)._m0[291].z;
    }
    float _416 = _408;
    float _418 = _416;
    if (_358)
    {
        _414 = (*spvDescriptorSet0.vp_c14)._m0[292].x;
    }
    float _420 = _414;
    bool _422 = _73 == 480;
    float _424 = _420;
    if (_358)
    {
        _418 = (*spvDescriptorSet0.vp_c14)._m0[292].z;
    }
    float _426 = _418;
    float _428 = _426;
    if (_372)
    {
        _424 = (*spvDescriptorSet0.vp_c14)._m0[293].x;
    }
    float _430 = _424;
    bool _432 = _73 == 496;
    float _434 = _430;
    if (_372)
    {
        _428 = (*spvDescriptorSet0.vp_c14)._m0[293].z;
    }
    float _436 = _428;
    float _438 = _436;
    if (_378)
    {
        _434 = (*spvDescriptorSet0.vp_c14)._m0[294].x;
    }
    float _440 = _434;
    bool _442 = _73 == 512;
    float _444 = _440;
    if (_378)
    {
        _438 = (*spvDescriptorSet0.vp_c14)._m0[294].z;
    }
    float _446 = _438;
    bool _448 = _73 == 528;
    float _450 = _446;
    if (_392)
    {
        _444 = (*spvDescriptorSet0.vp_c14)._m0[295].x;
    }
    float _452 = _444;
    float _454 = _452;
    if (_392)
    {
        _450 = (*spvDescriptorSet0.vp_c14)._m0[295].z;
    }
    float _456 = _450;
    float _458 = _456;
    if (_402)
    {
        _454 = (*spvDescriptorSet0.vp_c14)._m0[296].x;
    }
    float _460 = _454;
    bool _462 = _73 == 544;
    float _464 = _460;
    if (_402)
    {
        _458 = (*spvDescriptorSet0.vp_c14)._m0[296].z;
    }
    float _466 = _458;
    float _468 = _466;
    if (_412)
    {
        _464 = (*spvDescriptorSet0.vp_c14)._m0[297].x;
    }
    float _470 = _464;
    bool _472 = _73 == 560;
    float _474 = _470;
    if (_412)
    {
        _468 = (*spvDescriptorSet0.vp_c14)._m0[297].z;
    }
    float _476 = _468;
    float _478 = _476;
    if (_422)
    {
        _474 = (*spvDescriptorSet0.vp_c14)._m0[298].x;
    }
    float _480 = _474;
    bool _482 = _73 == 576;
    float _484 = _480;
    if (_422)
    {
        _478 = (*spvDescriptorSet0.vp_c14)._m0[298].z;
    }
    float _486 = _478;
    float _488 = _486;
    if (_432)
    {
        _484 = (*spvDescriptorSet0.vp_c14)._m0[299].x;
    }
    float _490 = _484;
    bool _492 = _73 == 592;
    float _494 = _490;
    if (_432)
    {
        _488 = (*spvDescriptorSet0.vp_c14)._m0[299].z;
    }
    float _496 = _488;
    float _498 = _496;
    if (_442)
    {
        _494 = (*spvDescriptorSet0.vp_c14)._m0[300].x;
    }
    float _500 = _494;
    bool _502 = _73 == 608;
    float _504 = _500;
    if (_442)
    {
        _498 = (*spvDescriptorSet0.vp_c14)._m0[300].z;
    }
    float _506 = _498;
    float _508 = _506;
    if (_448)
    {
        _504 = (*spvDescriptorSet0.vp_c14)._m0[301].x;
    }
    float _510 = _504;
    bool _512 = _73 == 624;
    float _514 = _510;
    if (_448)
    {
        _508 = (*spvDescriptorSet0.vp_c14)._m0[301].z;
    }
    float _516 = _508;
    bool _518 = _73 == 640;
    float _520 = _516;
    if (_462)
    {
        _514 = (*spvDescriptorSet0.vp_c14)._m0[302].x;
    }
    float _522 = _514;
    float _524 = _522;
    if (_462)
    {
        _520 = (*spvDescriptorSet0.vp_c14)._m0[302].z;
    }
    float _526 = _520;
    float _528 = _526;
    if (_472)
    {
        _524 = (*spvDescriptorSet0.vp_c14)._m0[303].x;
    }
    float _530 = _524;
    bool _532 = _73 == 656;
    float _534 = _530;
    if (_472)
    {
        _528 = (*spvDescriptorSet0.vp_c14)._m0[303].z;
    }
    float _536 = _528;
    float _538 = _536;
    if (_482)
    {
        _534 = (*spvDescriptorSet0.vp_c14)._m0[304].x;
    }
    float _540 = _534;
    bool _542 = _73 == 672;
    float _544 = _540;
    if (_482)
    {
        _538 = (*spvDescriptorSet0.vp_c14)._m0[304].z;
    }
    float _546 = _538;
    float _548 = _546;
    if (_492)
    {
        _544 = (*spvDescriptorSet0.vp_c14)._m0[305].x;
    }
    float _550 = _544;
    bool _552 = _73 == 688;
    float _554 = _550;
    if (_492)
    {
        _548 = (*spvDescriptorSet0.vp_c14)._m0[305].z;
    }
    float _556 = _548;
    float _558 = _556;
    if (_502)
    {
        _554 = (*spvDescriptorSet0.vp_c14)._m0[306].x;
    }
    float _560 = _554;
    bool _562 = _73 == 704;
    float _564 = _560;
    if (_502)
    {
        _558 = (*spvDescriptorSet0.vp_c14)._m0[306].z;
    }
    float _566 = _558;
    float _568 = _566;
    if (_512)
    {
        _564 = (*spvDescriptorSet0.vp_c14)._m0[307].x;
    }
    float _570 = _564;
    bool _572 = _73 == 720;
    float _574 = _570;
    if (_512)
    {
        _568 = (*spvDescriptorSet0.vp_c14)._m0[307].z;
    }
    float _576 = _568;
    float _578 = _576;
    if (_518)
    {
        _574 = (*spvDescriptorSet0.vp_c14)._m0[308].x;
    }
    float _580 = _574;
    bool _582 = _73 == 736;
    float _584 = _580;
    if (_518)
    {
        _578 = (*spvDescriptorSet0.vp_c14)._m0[308].z;
    }
    float _586 = _578;
    bool _588 = _73 == 752;
    float _590 = _586;
    if (_532)
    {
        _584 = (*spvDescriptorSet0.vp_c14)._m0[309].x;
    }
    float _592 = _584;
    float _594 = _592;
    if (_542)
    {
        _594 = (*spvDescriptorSet0.vp_c14)._m0[310].x;
    }
    float _596 = _594;
    float _598 = _596;
    if (_552)
    {
        _598 = (*spvDescriptorSet0.vp_c14)._m0[311].x;
    }
    float _600 = _598;
    float _602 = _600;
    if (_562)
    {
        _602 = (*spvDescriptorSet0.vp_c14)._m0[312].x;
    }
    float _604 = _602;
    float _606 = _604;
    if (_572)
    {
        _606 = (*spvDescriptorSet0.vp_c14)._m0[313].x;
    }
    float _608 = _606;
    float _610 = _608;
    if (_582)
    {
        _610 = (*spvDescriptorSet0.vp_c14)._m0[314].x;
    }
    float _612 = _610;
    float _614 = _612;
    if (_588)
    {
        _614 = (*spvDescriptorSet0.vp_c14)._m0[315].x;
    }
    float _616 = _614;
    float _618 = _360 * _616;
    if (_532)
    {
        _590 = (*spvDescriptorSet0.vp_c14)._m0[309].z;
    }
    float _620 = _590;
    float _622 = _620;
    if (_542)
    {
        _622 = (*spvDescriptorSet0.vp_c14)._m0[310].z;
    }
    float _624 = _622;
    float _626 = _618 * _62;
    float _628 = _624;
    if (_552)
    {
        _628 = (*spvDescriptorSet0.vp_c14)._m0[311].z;
    }
    float _630 = _628;
    float _632 = _630;
    if (_562)
    {
        _632 = (*spvDescriptorSet0.vp_c14)._m0[312].z;
    }
    float _634 = _632;
    float _636 = floor(_626);
    float _638 = _634;
    if (_572)
    {
        _638 = (*spvDescriptorSet0.vp_c14)._m0[313].z;
    }
    float _640 = _638;
    float _642 = _640;
    if (_582)
    {
        _642 = (*spvDescriptorSet0.vp_c14)._m0[314].z;
    }
    float _644 = _642;
    float _646 = _644;
    if (_588)
    {
        _646 = (*spvDescriptorSet0.vp_c14)._m0[315].z;
    }
    float _648 = _646;
    float _650 = -_636;
    float _652 = _626 + _650;
    float _654 = _330 * _648;
    float _656 = _652 * 2.0;
    float _658 = -_652;
    float _660 = fma(_654, _658, _62);
    float _662 = floor(_656);
    float _664 = _654 * _662;
    float _666 = _664 * 0.5;
    float _668 = _654;
    float _670 = _666;
    float _672 = _652;
    if (!_101)
    {
        _668 = (*spvDescriptorSet0.vp_c15)._m0[6].x;
    }
    float _674 = _668;
    float _676 = _666 + _660;
    float _678 = _674;
    if (!_101)
    {
        float _680 = fma(_336, _674, (*spvDescriptorSet0.vp_c15)._m0[6].w);
        _364 = _680;
    }
    float _682 = _364;
    float _684 = fma(_68, _676, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _686 = fma(_676, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _688 = _682;
    if (!_101)
    {
        float _690 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _682);
        _688 = _690;
    }
    float _692 = _688;
    float _694 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _696 = _684 + _694;
    float _698 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _700 = _686 + _698;
    float _702 = _696 * _696;
    float _704 = fma(_700, _700, _702);
    float _706 = fma(_131, _131, _704);
    float _708 = sqrt(_706);
    float _710 = -_312;
    float _712 = fma(_708, _304, _710);
    float _714 = precise::clamp(_712, 0.0, 1.0);
    float _716 = -_666;
    float _718 = fma(_716, _714, _676);
    float _720 = fma(_718, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _722 = fma(_720, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].z);
    float _724 = _706;
    if (!_101)
    {
        float _726 = fma(_722, _674, (*spvDescriptorSet0.vp_c15)._m0[6].z);
        _123 = _726;
    }
    float _728 = _123;
    float _730 = _728;
    if (!_101)
    {
        float _732 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _728);
        _724 = _732;
    }
    float _734 = _724;
    if (!_101)
    {
        float2 _2138 = float2(_734, _692);
        float _736 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2138, float2(0.0), isnan(_2138)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2138, float2(0.0), isnan(_2138)), level(0.0)).x;
        _730 = _736;
    }
    float _738 = _730;
    if (_101)
    {
        _678 = (*spvDescriptorSet0.vp_c15)._m0[14].x;
    }
    float _740 = _678;
    float _742 = _740;
    if (_101)
    {
        _670 = (*spvDescriptorSet0.vp_c15)._m0[15].x;
    }
    float _744 = _670;
    if (_101)
    {
        float _746 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, _740, (*spvDescriptorSet0.vp_c15)._m0[14].w);
        _672 = _746;
    }
    float _748 = _672;
    float _750 = _748;
    if (_101)
    {
        float _752 = fma(_720, _740, (*spvDescriptorSet0.vp_c15)._m0[14].z);
        _742 = _752;
    }
    float _754 = _742;
    float _756 = _754;
    if (_101)
    {
        float _758 = fma(_748, _744, (*spvDescriptorSet0.vp_c15)._m0[15].w);
        _750 = _758;
    }
    float _760 = _750;
    float _762 = _760;
    if (_101)
    {
        float _764 = fma(_754, _744, (*spvDescriptorSet0.vp_c15)._m0[15].z);
        _756 = _764;
    }
    float _766 = _756;
    float _768 = _766;
    if (_101)
    {
        float _770 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _760);
        _762 = _770;
    }
    float _772 = _762;
    if (_101)
    {
        float _774 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _766);
        _768 = _774;
    }
    float _776 = _768;
    float _778 = _738;
    float _780 = _776;
    if (_101)
    {
        float2 _2232 = float2(_776, _772);
        float _782 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_2232, float2(0.0), isnan(_2232)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_2232, float2(0.0), isnan(_2232)), level(0.0)).x;
        _778 = _782;
    }
    float _784 = _778;
    float _786 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _788 = (*spvDescriptorSet0.vp_c15)._m0[0].w + _786;
    float _790 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _792 = _720 + _790;
    float _794 = _788 * _788;
    float _796 = fma(_792, _792, _794);
    float _798 = sqrt(_796);
    float _800 = fma(_336, (*spvDescriptorSet0.vp_c15)._m0[8].x, (*spvDescriptorSet0.vp_c15)._m0[8].w);
    float _802 = fma(_722, (*spvDescriptorSet0.vp_c15)._m0[8].x, (*spvDescriptorSet0.vp_c15)._m0[8].z);
    float _804 = fma(_336, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].w);
    float _806 = fma(_722, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].z);
    bool _808 = _798 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _810 = (*spvDescriptorSet0.vp_c15)._m0[7].x;
    float _812 = (*spvDescriptorSet0.vp_c14)._m0[0].y;
    if (!_808)
    {
        _780 = _720;
    }
    float _814 = _780;
    float _816 = fma(_784, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _818 = _816 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _820 = _814;
    if (!_808)
    {
        _810 = _816;
    }
    float _822 = _810;
    float _824 = fma(_720, (*spvDescriptorSet0.vp_c4)._m0[2].x, _818);
    float _826 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, (*spvDescriptorSet0.vp_c4)._m0[2].z, _824);
    float _828 = _826 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _830 = _826;
    float _832 = _822;
    if (!_808)
    {
        _830 = (*spvDescriptorSet0.vp_c15)._m0[0].w;
    }
    float _834 = _830;
    float _836 = _834;
    if (!_808)
    {
        _812 = _828;
    }
    float _838 = _812;
    bool _840 = !_808;
    float _842 = _838;
    if (!_840)
    {
        float _844 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _846 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _848 = _798 + _846;
        float _850 = _816 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _852 = _848 * _844;
        float _854 = rsqrt(_796);
        float _856 = _852 * 0.15915493667125701904296875;
        float _858 = _856 * 6.283185482025146484375;
        float _860 = cos(_858);
        float _862 = _856 * 6.283185482025146484375;
        float _864 = sin(_862);
        float _866 = _860 + (-1.0);
        float _868 = fma(_864, _850, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _870 = _866 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _872 = _854 * _868;
        float _874 = fma(_816, _860, _870);
        float _876 = fma(_792, _872, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _878 = _874 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _880 = fma(_788, _872, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _882 = fma(_876, (*spvDescriptorSet0.vp_c4)._m0[2].x, _878);
        float _884 = fma(_880, (*spvDescriptorSet0.vp_c4)._m0[2].z, _882);
        float _886 = _884 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _832 = _874;
        _820 = _876;
        _836 = _880;
        _842 = _886;
    }
    float _888 = _832;
    float _890 = _820;
    float _892 = _836;
    float _894 = _842;
    float _896 = _888 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _898 = _888 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    out.m_40.z = _806;
    out.m_40.w = _804;
    float _900 = fma(_890, (*spvDescriptorSet0.vp_c4)._m0[1].x, _896);
    float _902 = fma(_890, (*spvDescriptorSet0.vp_c4)._m0[0].x, _898);
    out.m_42.x = _802;
    float _904 = fma(_892, (*spvDescriptorSet0.vp_c4)._m0[1].z, _900);
    float _906 = fma(_892, (*spvDescriptorSet0.vp_c4)._m0[0].z, _902);
    out.m_42.y = _800;
    float _908 = _904 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _910 = _906 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _912 = -_828;
    float _914 = -(*spvDescriptorSet0.vp_c9)._m0[72].y;
    float _916 = _912 + _914;
    out.m_44.x = _720;
    out.m_44.y = _816;
    out.m_44.z = (*spvDescriptorSet0.vp_c15)._m0[0].w;
    float _918 = _908 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _920 = _908 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _922 = _908 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _924 = _908 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _926 = fma(_910, (*spvDescriptorSet0.vp_c4)._m0[8].x, _918);
    float _928 = fma(_910, (*spvDescriptorSet0.vp_c4)._m0[7].x, _920);
    float _930 = fma(_910, (*spvDescriptorSet0.vp_c4)._m0[9].x, _922);
    float _932 = fma(_910, (*spvDescriptorSet0.vp_c4)._m0[10].x, _924);
    float _934 = fma(_894, (*spvDescriptorSet0.vp_c4)._m0[8].z, _926);
    float _936 = fma(_894, (*spvDescriptorSet0.vp_c4)._m0[7].z, _928);
    float _938 = fma(_894, (*spvDescriptorSet0.vp_c4)._m0[9].z, _930);
    float _940 = fma(_894, (*spvDescriptorSet0.vp_c4)._m0[10].z, _932);
    float _942 = _916 * (*spvDescriptorSet0.vp_c9)._m0[72].z;
    float _944 = _936 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _946 = _934 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _948 = _938 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _950 = _940 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.m_42.w = (*spvDescriptorSet0.vp_c15)._m0[7].y;
    out.m_46.w = _828;
    out.m_48.w = _942;
    out.gl_Position.x = _944;
    out.gl_Position.y = _946;
    out.gl_Position.z = _948;
    out.gl_Position.w = _950;
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
    out.m_40 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _62 = in.m_37.x;
    float _64 = in.m_37.y;
    float _66 = -(*spvDescriptorSet0.vp_c15)._m0[3].x;
    float _68 = _66 + (*spvDescriptorSet0.vp_c15)._m0[3].y;
    int _71 = 16 + as_type<int>(as_type<float>(gl_BaseInstance));
    int _73 = _71 << 4;
    bool _77 = _73 == 0;
    bool _79 = _73 == 16;
    bool _81 = _73 == 32;
    bool _83 = _73 == 48;
    bool _85 = _73 == 64;
    float _87 = fma(_68, _62, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _89 = fma(_62, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    bool _91 = _73 == 80;
    bool _93 = _64 >= 0.5;
    bool _95 = isnan(_64);
    bool _97 = _93 || _95;
    bool _99 = isnan(0.5);
    bool _101 = _97 || _99;
    float _103 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _105 = _87 + _103;
    float _107 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _109 = _89 + _107;
    float _111 = as_type<float>(gl_BaseInstance);
    if (_77)
    {
        _111 = (*spvDescriptorSet0.vp_c14)._m0[268].x;
    }
    float _113 = _111;
    float _115 = _105 * _105;
    bool _117 = _73 == 96;
    float _119 = 0.0;
    float _121 = _113;
    float _123 = (*spvDescriptorSet0.vp_c15)._m0[5].x;
    if (_77)
    {
        _119 = (*spvDescriptorSet0.vp_c14)._m0[268].z;
    }
    float _125 = _119;
    float _127 = fma(_109, _109, _115);
    float _129 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _131 = (*spvDescriptorSet0.vp_c15)._m0[0].w + _129;
    float _133 = _125;
    if (_79)
    {
        _121 = (*spvDescriptorSet0.vp_c14)._m0[269].x;
    }
    float _135 = _121;
    bool _137 = _73 == 112;
    float _139 = fma(_131, _131, _127);
    float _141 = _135;
    if (_79)
    {
        _133 = (*spvDescriptorSet0.vp_c14)._m0[269].z;
    }
    float _143 = _133;
    float _145 = _143;
    if (_81)
    {
        _141 = (*spvDescriptorSet0.vp_c14)._m0[270].x;
    }
    float _147 = _141;
    bool _149 = _73 == 128;
    float _151 = rsqrt(_139);
    float _153 = _147;
    if (_81)
    {
        _145 = (*spvDescriptorSet0.vp_c14)._m0[270].z;
    }
    float _155 = _145;
    float _157 = _155;
    if (_83)
    {
        _153 = (*spvDescriptorSet0.vp_c14)._m0[271].x;
    }
    float _159 = _153;
    bool _161 = _73 == 144;
    float _163 = _159;
    if (_83)
    {
        _157 = (*spvDescriptorSet0.vp_c14)._m0[271].z;
    }
    float _165 = _157;
    float _167 = _165;
    if (_85)
    {
        _163 = (*spvDescriptorSet0.vp_c14)._m0[272].x;
    }
    float _169 = _163;
    bool _171 = _73 == 160;
    float _173 = _169;
    if (_85)
    {
        _167 = (*spvDescriptorSet0.vp_c14)._m0[272].z;
    }
    float _175 = _167;
    float _177 = _175;
    if (_91)
    {
        _173 = (*spvDescriptorSet0.vp_c14)._m0[273].x;
    }
    float _179 = _173;
    float _181 = _151 * (*spvDescriptorSet0.vp_c14)._m0[268].x;
    bool _183 = _73 == 176;
    float _185 = _179;
    if (_91)
    {
        _177 = (*spvDescriptorSet0.vp_c14)._m0[273].z;
    }
    float _187 = _177;
    bool _189 = _73 == 192;
    float _191 = log2(_181);
    float _193 = _187;
    if (_117)
    {
        _185 = (*spvDescriptorSet0.vp_c14)._m0[274].x;
    }
    float _195 = _185;
    float _197 = _195;
    if (_117)
    {
        _193 = (*spvDescriptorSet0.vp_c14)._m0[274].z;
    }
    float _199 = _193;
    float _201 = _199;
    if (_137)
    {
        _197 = (*spvDescriptorSet0.vp_c14)._m0[275].x;
    }
    float _203 = _197;
    bool _205 = _73 == 208;
    float _207 = _203;
    if (_137)
    {
        _201 = (*spvDescriptorSet0.vp_c14)._m0[275].z;
    }
    float _209 = _201;
    float _211 = _209;
    if (_149)
    {
        _207 = (*spvDescriptorSet0.vp_c14)._m0[276].x;
    }
    float _213 = _207;
    bool _215 = _73 == 224;
    float _217 = _213;
    if (_149)
    {
        _211 = (*spvDescriptorSet0.vp_c14)._m0[276].z;
    }
    float _219 = _211;
    float _221 = _191 + 1.2999999523162841796875;
    float _223 = _219;
    if (_161)
    {
        _217 = (*spvDescriptorSet0.vp_c14)._m0[277].x;
    }
    float _225 = _217;
    bool _227 = _73 == 240;
    float _229 = _225;
    if (_161)
    {
        _223 = (*spvDescriptorSet0.vp_c14)._m0[277].z;
    }
    float _231 = _223;
    float _233 = trunc(_221);
    int _235 = int(_233);
    float _237 = _231;
    if (_171)
    {
        _229 = (*spvDescriptorSet0.vp_c14)._m0[278].x;
    }
    float _239 = _229;
    bool _241 = _73 == 256;
    float _243 = _239;
    if (_171)
    {
        _237 = (*spvDescriptorSet0.vp_c14)._m0[278].z;
    }
    float _245 = _237;
    float _247 = _245;
    if (_183)
    {
        _243 = (*spvDescriptorSet0.vp_c14)._m0[279].x;
    }
    float _249 = _243;
    bool _251 = _73 == 272;
    float _253 = _249;
    if (_183)
    {
        _247 = (*spvDescriptorSet0.vp_c14)._m0[279].z;
    }
    float _255 = _247;
    float _257 = _255;
    if (_189)
    {
        _253 = (*spvDescriptorSet0.vp_c14)._m0[280].x;
    }
    float _259 = _253;
    bool _261 = _73 == 288;
    int _263 = min(_235, 15);
    float _265 = _259;
    if (_189)
    {
        _257 = (*spvDescriptorSet0.vp_c14)._m0[280].z;
    }
    float _267 = _257;
    bool _269 = _73 == 304;
    float _271 = float(_263);
    float _273 = _267;
    if (_205)
    {
        _265 = (*spvDescriptorSet0.vp_c14)._m0[281].x;
    }
    float _275 = _265;
    int _277 = _263 << 4;
    int _279 = _277 + 4288;
    float _281 = _275;
    if (_205)
    {
        _273 = (*spvDescriptorSet0.vp_c14)._m0[281].z;
    }
    float _283 = _273;
    float _285 = _283;
    if (_215)
    {
        _281 = (*spvDescriptorSet0.vp_c14)._m0[282].x;
    }
    float _287 = _281;
    float _289 = -_271;
    float _291 = _289 + (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _293 = _73 == 320;
    int _295 = _279 + 8;
    uint _298 = uint(int(uint(_295) >> uint(2)));
    uint _300 = uint(int(uint(int(_298)) >> uint(2)));
    int _302 = int(_298) & 3;
    float _304 = (*spvDescriptorSet0.vp_c14)._m0[int(_300)][_302];
    int _306 = int(_298) + 1;
    uint _308 = uint(int(uint(_306) >> uint(2)));
    int _310 = _306 & 3;
    float _312 = (*spvDescriptorSet0.vp_c14)._m0[int(_308)][_310];
    float _314 = _287;
    if (_215)
    {
        _285 = (*spvDescriptorSet0.vp_c14)._m0[282].z;
    }
    float _316 = _285;
    float _318 = _291 + 1.0;
    float _320 = _316;
    if (_227)
    {
        _314 = (*spvDescriptorSet0.vp_c14)._m0[283].x;
    }
    float _322 = _314;
    bool _324 = _73 == 336;
    float _326 = _322;
    if (_227)
    {
        _320 = (*spvDescriptorSet0.vp_c14)._m0[283].z;
    }
    float _328 = _320;
    float _330 = exp2(_318);
    float _332 = _328;
    if (_241)
    {
        _326 = (*spvDescriptorSet0.vp_c14)._m0[284].x;
    }
    float _334 = _326;
    float _336 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].w);
    bool _338 = _73 == 352;
    float _340 = _334;
    if (_241)
    {
        _332 = (*spvDescriptorSet0.vp_c14)._m0[284].z;
    }
    float _342 = _332;
    float _344 = _342;
    if (_251)
    {
        _340 = (*spvDescriptorSet0.vp_c14)._m0[285].x;
    }
    float _346 = _340;
    bool _348 = _73 == 368;
    float _350 = _346;
    if (_251)
    {
        _344 = (*spvDescriptorSet0.vp_c14)._m0[285].z;
    }
    float _352 = _344;
    float _354 = _352;
    if (_261)
    {
        _350 = (*spvDescriptorSet0.vp_c14)._m0[286].x;
    }
    float _356 = _350;
    bool _358 = _73 == 384;
    float _360 = 1.0 / _330;
    float _362 = _356;
    float _364 = _330;
    if (_261)
    {
        _354 = (*spvDescriptorSet0.vp_c14)._m0[286].z;
    }
    float _366 = _354;
    float _368 = _366;
    if (_269)
    {
        _362 = (*spvDescriptorSet0.vp_c14)._m0[287].x;
    }
    float _370 = _362;
    bool _372 = _73 == 400;
    float _374 = _370;
    if (_269)
    {
        _368 = (*spvDescriptorSet0.vp_c14)._m0[287].z;
    }
    float _376 = _368;
    bool _378 = _73 == 416;
    float _380 = _376;
    if (_293)
    {
        _374 = (*spvDescriptorSet0.vp_c14)._m0[288].x;
    }
    float _382 = _374;
    float _384 = _382;
    if (_293)
    {
        _380 = (*spvDescriptorSet0.vp_c14)._m0[288].z;
    }
    float _386 = _380;
    float _388 = _386;
    if (_324)
    {
        _384 = (*spvDescriptorSet0.vp_c14)._m0[289].x;
    }
    float _390 = _384;
    bool _392 = _73 == 432;
    float _394 = _390;
    if (_324)
    {
        _388 = (*spvDescriptorSet0.vp_c14)._m0[289].z;
    }
    float _396 = _388;
    float _398 = _396;
    if (_338)
    {
        _394 = (*spvDescriptorSet0.vp_c14)._m0[290].x;
    }
    float _400 = _394;
    bool _402 = _73 == 448;
    float _404 = _400;
    if (_338)
    {
        _398 = (*spvDescriptorSet0.vp_c14)._m0[290].z;
    }
    float _406 = _398;
    float _408 = _406;
    if (_348)
    {
        _404 = (*spvDescriptorSet0.vp_c14)._m0[291].x;
    }
    float _410 = _404;
    bool _412 = _73 == 464;
    float _414 = _410;
    if (_348)
    {
        _408 = (*spvDescriptorSet0.vp_c14)._m0[291].z;
    }
    float _416 = _408;
    float _418 = _416;
    if (_358)
    {
        _414 = (*spvDescriptorSet0.vp_c14)._m0[292].x;
    }
    float _420 = _414;
    bool _422 = _73 == 480;
    float _424 = _420;
    if (_358)
    {
        _418 = (*spvDescriptorSet0.vp_c14)._m0[292].z;
    }
    float _426 = _418;
    float _428 = _426;
    if (_372)
    {
        _424 = (*spvDescriptorSet0.vp_c14)._m0[293].x;
    }
    float _430 = _424;
    bool _432 = _73 == 496;
    float _434 = _430;
    if (_372)
    {
        _428 = (*spvDescriptorSet0.vp_c14)._m0[293].z;
    }
    float _436 = _428;
    float _438 = _436;
    if (_378)
    {
        _434 = (*spvDescriptorSet0.vp_c14)._m0[294].x;
    }
    float _440 = _434;
    bool _442 = _73 == 512;
    float _444 = _440;
    if (_378)
    {
        _438 = (*spvDescriptorSet0.vp_c14)._m0[294].z;
    }
    float _446 = _438;
    bool _448 = _73 == 528;
    float _450 = _446;
    if (_392)
    {
        _444 = (*spvDescriptorSet0.vp_c14)._m0[295].x;
    }
    float _452 = _444;
    float _454 = _452;
    if (_392)
    {
        _450 = (*spvDescriptorSet0.vp_c14)._m0[295].z;
    }
    float _456 = _450;
    float _458 = _456;
    if (_402)
    {
        _454 = (*spvDescriptorSet0.vp_c14)._m0[296].x;
    }
    float _460 = _454;
    bool _462 = _73 == 544;
    float _464 = _460;
    if (_402)
    {
        _458 = (*spvDescriptorSet0.vp_c14)._m0[296].z;
    }
    float _466 = _458;
    float _468 = _466;
    if (_412)
    {
        _464 = (*spvDescriptorSet0.vp_c14)._m0[297].x;
    }
    float _470 = _464;
    bool _472 = _73 == 560;
    float _474 = _470;
    if (_412)
    {
        _468 = (*spvDescriptorSet0.vp_c14)._m0[297].z;
    }
    float _476 = _468;
    float _478 = _476;
    if (_422)
    {
        _474 = (*spvDescriptorSet0.vp_c14)._m0[298].x;
    }
    float _480 = _474;
    bool _482 = _73 == 576;
    float _484 = _480;
    if (_422)
    {
        _478 = (*spvDescriptorSet0.vp_c14)._m0[298].z;
    }
    float _486 = _478;
    float _488 = _486;
    if (_432)
    {
        _484 = (*spvDescriptorSet0.vp_c14)._m0[299].x;
    }
    float _490 = _484;
    bool _492 = _73 == 592;
    float _494 = _490;
    if (_432)
    {
        _488 = (*spvDescriptorSet0.vp_c14)._m0[299].z;
    }
    float _496 = _488;
    float _498 = _496;
    if (_442)
    {
        _494 = (*spvDescriptorSet0.vp_c14)._m0[300].x;
    }
    float _500 = _494;
    bool _502 = _73 == 608;
    float _504 = _500;
    if (_442)
    {
        _498 = (*spvDescriptorSet0.vp_c14)._m0[300].z;
    }
    float _506 = _498;
    float _508 = _506;
    if (_448)
    {
        _504 = (*spvDescriptorSet0.vp_c14)._m0[301].x;
    }
    float _510 = _504;
    bool _512 = _73 == 624;
    float _514 = _510;
    if (_448)
    {
        _508 = (*spvDescriptorSet0.vp_c14)._m0[301].z;
    }
    float _516 = _508;
    bool _518 = _73 == 640;
    float _520 = _516;
    if (_462)
    {
        _514 = (*spvDescriptorSet0.vp_c14)._m0[302].x;
    }
    float _522 = _514;
    float _524 = _522;
    if (_462)
    {
        _520 = (*spvDescriptorSet0.vp_c14)._m0[302].z;
    }
    float _526 = _520;
    float _528 = _526;
    if (_472)
    {
        _524 = (*spvDescriptorSet0.vp_c14)._m0[303].x;
    }
    float _530 = _524;
    bool _532 = _73 == 656;
    float _534 = _530;
    if (_472)
    {
        _528 = (*spvDescriptorSet0.vp_c14)._m0[303].z;
    }
    float _536 = _528;
    float _538 = _536;
    if (_482)
    {
        _534 = (*spvDescriptorSet0.vp_c14)._m0[304].x;
    }
    float _540 = _534;
    bool _542 = _73 == 672;
    float _544 = _540;
    if (_482)
    {
        _538 = (*spvDescriptorSet0.vp_c14)._m0[304].z;
    }
    float _546 = _538;
    float _548 = _546;
    if (_492)
    {
        _544 = (*spvDescriptorSet0.vp_c14)._m0[305].x;
    }
    float _550 = _544;
    bool _552 = _73 == 688;
    float _554 = _550;
    if (_492)
    {
        _548 = (*spvDescriptorSet0.vp_c14)._m0[305].z;
    }
    float _556 = _548;
    float _558 = _556;
    if (_502)
    {
        _554 = (*spvDescriptorSet0.vp_c14)._m0[306].x;
    }
    float _560 = _554;
    bool _562 = _73 == 704;
    float _564 = _560;
    if (_502)
    {
        _558 = (*spvDescriptorSet0.vp_c14)._m0[306].z;
    }
    float _566 = _558;
    float _568 = _566;
    if (_512)
    {
        _564 = (*spvDescriptorSet0.vp_c14)._m0[307].x;
    }
    float _570 = _564;
    bool _572 = _73 == 720;
    float _574 = _570;
    if (_512)
    {
        _568 = (*spvDescriptorSet0.vp_c14)._m0[307].z;
    }
    float _576 = _568;
    float _578 = _576;
    if (_518)
    {
        _574 = (*spvDescriptorSet0.vp_c14)._m0[308].x;
    }
    float _580 = _574;
    bool _582 = _73 == 736;
    float _584 = _580;
    if (_518)
    {
        _578 = (*spvDescriptorSet0.vp_c14)._m0[308].z;
    }
    float _586 = _578;
    bool _588 = _73 == 752;
    float _590 = _586;
    if (_532)
    {
        _584 = (*spvDescriptorSet0.vp_c14)._m0[309].x;
    }
    float _592 = _584;
    float _594 = _592;
    if (_542)
    {
        _594 = (*spvDescriptorSet0.vp_c14)._m0[310].x;
    }
    float _596 = _594;
    float _598 = _596;
    if (_552)
    {
        _598 = (*spvDescriptorSet0.vp_c14)._m0[311].x;
    }
    float _600 = _598;
    float _602 = _600;
    if (_562)
    {
        _602 = (*spvDescriptorSet0.vp_c14)._m0[312].x;
    }
    float _604 = _602;
    float _606 = _604;
    if (_572)
    {
        _606 = (*spvDescriptorSet0.vp_c14)._m0[313].x;
    }
    float _608 = _606;
    float _610 = _608;
    if (_582)
    {
        _610 = (*spvDescriptorSet0.vp_c14)._m0[314].x;
    }
    float _612 = _610;
    float _614 = _612;
    if (_588)
    {
        _614 = (*spvDescriptorSet0.vp_c14)._m0[315].x;
    }
    float _616 = _614;
    float _618 = _360 * _616;
    if (_532)
    {
        _590 = (*spvDescriptorSet0.vp_c14)._m0[309].z;
    }
    float _620 = _590;
    float _622 = _620;
    if (_542)
    {
        _622 = (*spvDescriptorSet0.vp_c14)._m0[310].z;
    }
    float _624 = _622;
    float _626 = _618 * _62;
    float _628 = _624;
    if (_552)
    {
        _628 = (*spvDescriptorSet0.vp_c14)._m0[311].z;
    }
    float _630 = _628;
    float _632 = _630;
    if (_562)
    {
        _632 = (*spvDescriptorSet0.vp_c14)._m0[312].z;
    }
    float _634 = _632;
    float _636 = floor(_626);
    float _638 = _634;
    if (_572)
    {
        _638 = (*spvDescriptorSet0.vp_c14)._m0[313].z;
    }
    float _640 = _638;
    float _642 = _640;
    if (_582)
    {
        _642 = (*spvDescriptorSet0.vp_c14)._m0[314].z;
    }
    float _644 = _642;
    float _646 = _644;
    if (_588)
    {
        _646 = (*spvDescriptorSet0.vp_c14)._m0[315].z;
    }
    float _648 = _646;
    float _650 = -_636;
    float _652 = _626 + _650;
    float _654 = _330 * _648;
    float _656 = _652 * 2.0;
    float _658 = -_652;
    float _660 = fma(_654, _658, _62);
    float _662 = floor(_656);
    float _664 = _654 * _662;
    float _666 = _664 * 0.5;
    float _668 = _654;
    float _670 = _666;
    float _672 = _652;
    if (!_101)
    {
        _668 = (*spvDescriptorSet0.vp_c15)._m0[6].x;
    }
    float _674 = _668;
    float _676 = _666 + _660;
    float _678 = _674;
    if (!_101)
    {
        float _680 = fma(_336, _674, (*spvDescriptorSet0.vp_c15)._m0[6].w);
        _364 = _680;
    }
    float _682 = _364;
    float _684 = fma(_68, _676, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _686 = fma(_676, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _688 = _682;
    if (!_101)
    {
        float _690 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _682);
        _688 = _690;
    }
    float _692 = _688;
    float _694 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _696 = _684 + _694;
    float _698 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _700 = _686 + _698;
    float _702 = _696 * _696;
    float _704 = fma(_700, _700, _702);
    float _706 = fma(_131, _131, _704);
    float _708 = sqrt(_706);
    float _710 = -_312;
    float _712 = fma(_708, _304, _710);
    float _714 = precise::clamp(_712, 0.0, 1.0);
    float _716 = -_666;
    float _718 = fma(_716, _714, _676);
    float _720 = fma(_718, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _722 = fma(_720, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].z);
    float _724 = _706;
    if (!_101)
    {
        float _726 = fma(_722, _674, (*spvDescriptorSet0.vp_c15)._m0[6].z);
        _123 = _726;
    }
    float _728 = _123;
    float _730 = _728;
    if (!_101)
    {
        float _732 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _728);
        _724 = _732;
    }
    float _734 = _724;
    if (!_101)
    {
        float2 _2138 = float2(_734, _692);
        float _736 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2138, float2(0.0), isnan(_2138)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2138, float2(0.0), isnan(_2138)), level(0.0)).x;
        _730 = _736;
    }
    float _738 = _730;
    if (_101)
    {
        _678 = (*spvDescriptorSet0.vp_c15)._m0[14].x;
    }
    float _740 = _678;
    float _742 = _740;
    if (_101)
    {
        _670 = (*spvDescriptorSet0.vp_c15)._m0[15].x;
    }
    float _744 = _670;
    if (_101)
    {
        float _746 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, _740, (*spvDescriptorSet0.vp_c15)._m0[14].w);
        _672 = _746;
    }
    float _748 = _672;
    float _750 = _748;
    if (_101)
    {
        float _752 = fma(_720, _740, (*spvDescriptorSet0.vp_c15)._m0[14].z);
        _742 = _752;
    }
    float _754 = _742;
    float _756 = _754;
    if (_101)
    {
        float _758 = fma(_748, _744, (*spvDescriptorSet0.vp_c15)._m0[15].w);
        _750 = _758;
    }
    float _760 = _750;
    float _762 = _760;
    if (_101)
    {
        float _764 = fma(_754, _744, (*spvDescriptorSet0.vp_c15)._m0[15].z);
        _756 = _764;
    }
    float _766 = _756;
    float _768 = _766;
    if (_101)
    {
        float _770 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _760);
        _762 = _770;
    }
    float _772 = _762;
    if (_101)
    {
        float _774 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _766);
        _768 = _774;
    }
    float _776 = _768;
    float _778 = _738;
    float _780 = _776;
    if (_101)
    {
        float2 _2232 = float2(_776, _772);
        float _782 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_2232, float2(0.0), isnan(_2232)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_2232, float2(0.0), isnan(_2232)), level(0.0)).x;
        _778 = _782;
    }
    float _784 = _778;
    float _786 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _788 = (*spvDescriptorSet0.vp_c15)._m0[0].w + _786;
    float _790 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _792 = _720 + _790;
    float _794 = _788 * _788;
    float _796 = fma(_792, _792, _794);
    float _798 = sqrt(_796);
    float _800 = fma(_336, (*spvDescriptorSet0.vp_c15)._m0[8].x, (*spvDescriptorSet0.vp_c15)._m0[8].w);
    float _802 = fma(_722, (*spvDescriptorSet0.vp_c15)._m0[8].x, (*spvDescriptorSet0.vp_c15)._m0[8].z);
    float _804 = fma(_336, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].w);
    float _806 = fma(_722, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].z);
    bool _808 = _798 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _810 = (*spvDescriptorSet0.vp_c15)._m0[7].x;
    float _812 = (*spvDescriptorSet0.vp_c14)._m0[0].y;
    if (!_808)
    {
        _780 = _720;
    }
    float _814 = _780;
    float _816 = fma(_784, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _818 = _816 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _820 = _814;
    if (!_808)
    {
        _810 = _816;
    }
    float _822 = _810;
    float _824 = fma(_720, (*spvDescriptorSet0.vp_c4)._m0[2].x, _818);
    float _826 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, (*spvDescriptorSet0.vp_c4)._m0[2].z, _824);
    float _828 = _826 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _830 = _826;
    float _832 = _822;
    if (!_808)
    {
        _830 = (*spvDescriptorSet0.vp_c15)._m0[0].w;
    }
    float _834 = _830;
    float _836 = _834;
    if (!_808)
    {
        _812 = _828;
    }
    float _838 = _812;
    bool _840 = !_808;
    float _842 = _838;
    if (!_840)
    {
        float _844 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _846 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _848 = _798 + _846;
        float _850 = _816 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _852 = _848 * _844;
        float _854 = rsqrt(_796);
        float _856 = _852 * 0.15915493667125701904296875;
        float _858 = _856 * 6.283185482025146484375;
        float _860 = cos(_858);
        float _862 = _856 * 6.283185482025146484375;
        float _864 = sin(_862);
        float _866 = _860 + (-1.0);
        float _868 = fma(_864, _850, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _870 = _866 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _872 = _854 * _868;
        float _874 = fma(_816, _860, _870);
        float _876 = fma(_792, _872, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _878 = _874 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _880 = fma(_788, _872, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _882 = fma(_876, (*spvDescriptorSet0.vp_c4)._m0[2].x, _878);
        float _884 = fma(_880, (*spvDescriptorSet0.vp_c4)._m0[2].z, _882);
        float _886 = _884 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _832 = _874;
        _820 = _876;
        _836 = _880;
        _842 = _886;
    }
    float _888 = _832;
    float _890 = _820;
    float _892 = _836;
    float _894 = _842;
    float _896 = _888 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _898 = _888 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    out.m_40.z = _806;
    out.m_40.w = _804;
    float _900 = fma(_890, (*spvDescriptorSet0.vp_c4)._m0[1].x, _896);
    float _902 = fma(_890, (*spvDescriptorSet0.vp_c4)._m0[0].x, _898);
    out.m_42.x = _802;
    float _904 = fma(_892, (*spvDescriptorSet0.vp_c4)._m0[1].z, _900);
    float _906 = fma(_892, (*spvDescriptorSet0.vp_c4)._m0[0].z, _902);
    out.m_42.y = _800;
    float _908 = _904 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _910 = _906 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _912 = -_828;
    float _914 = -(*spvDescriptorSet0.vp_c9)._m0[72].y;
    float _916 = _912 + _914;
    out.m_44.x = _720;
    out.m_44.y = _816;
    out.m_44.z = (*spvDescriptorSet0.vp_c15)._m0[0].w;
    float _918 = _908 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _920 = _908 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _922 = _908 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _924 = _908 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _926 = fma(_910, (*spvDescriptorSet0.vp_c4)._m0[8].x, _918);
    float _928 = fma(_910, (*spvDescriptorSet0.vp_c4)._m0[7].x, _920);
    float _930 = fma(_910, (*spvDescriptorSet0.vp_c4)._m0[9].x, _922);
    float _932 = fma(_910, (*spvDescriptorSet0.vp_c4)._m0[10].x, _924);
    float _934 = fma(_894, (*spvDescriptorSet0.vp_c4)._m0[8].z, _926);
    float _936 = fma(_894, (*spvDescriptorSet0.vp_c4)._m0[7].z, _928);
    float _938 = fma(_894, (*spvDescriptorSet0.vp_c4)._m0[9].z, _930);
    float _940 = fma(_894, (*spvDescriptorSet0.vp_c4)._m0[10].z, _932);
    float _942 = _916 * (*spvDescriptorSet0.vp_c9)._m0[72].z;
    float _944 = _936 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _946 = _934 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _948 = _938 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _950 = _940 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.m_42.w = (*spvDescriptorSet0.vp_c15)._m0[7].y;
    out.m_46.w = _828;
    out.m_48.w = _942;
    out.gl_Position.x = _944;
    out.gl_Position.y = _946;
    out.gl_Position.z = _948;
    out.gl_Position.w = _950;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_40.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_40.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_40.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_40.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

