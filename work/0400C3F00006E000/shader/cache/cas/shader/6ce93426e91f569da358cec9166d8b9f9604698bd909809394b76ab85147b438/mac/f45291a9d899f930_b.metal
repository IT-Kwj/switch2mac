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
    float _135 = _131;
    if (_79)
    {
        _121 = (*spvDescriptorSet0.vp_c14)._m0[269].x;
    }
    float _137 = _121;
    bool _139 = _73 == 112;
    float _141 = fma(_131, _131, _127);
    float _143 = _137;
    if (_79)
    {
        _133 = (*spvDescriptorSet0.vp_c14)._m0[269].z;
    }
    float _145 = _133;
    float _147 = _145;
    if (_81)
    {
        _143 = (*spvDescriptorSet0.vp_c14)._m0[270].x;
    }
    float _149 = _143;
    bool _151 = _73 == 128;
    float _153 = rsqrt(_141);
    float _155 = _149;
    if (_81)
    {
        _147 = (*spvDescriptorSet0.vp_c14)._m0[270].z;
    }
    float _157 = _147;
    float _159 = _157;
    if (_83)
    {
        _155 = (*spvDescriptorSet0.vp_c14)._m0[271].x;
    }
    float _161 = _155;
    bool _163 = _73 == 144;
    float _165 = _161;
    if (_83)
    {
        _159 = (*spvDescriptorSet0.vp_c14)._m0[271].z;
    }
    float _167 = _159;
    float _169 = _167;
    if (_85)
    {
        _165 = (*spvDescriptorSet0.vp_c14)._m0[272].x;
    }
    float _171 = _165;
    bool _173 = _73 == 160;
    float _175 = _171;
    if (_85)
    {
        _169 = (*spvDescriptorSet0.vp_c14)._m0[272].z;
    }
    float _177 = _169;
    float _179 = _177;
    if (_91)
    {
        _175 = (*spvDescriptorSet0.vp_c14)._m0[273].x;
    }
    float _181 = _175;
    float _183 = _153 * (*spvDescriptorSet0.vp_c14)._m0[268].x;
    bool _185 = _73 == 176;
    float _187 = _181;
    if (_91)
    {
        _179 = (*spvDescriptorSet0.vp_c14)._m0[273].z;
    }
    float _189 = _179;
    bool _191 = _73 == 192;
    float _193 = log2(_183);
    float _195 = _189;
    if (_117)
    {
        _187 = (*spvDescriptorSet0.vp_c14)._m0[274].x;
    }
    float _197 = _187;
    float _199 = _197;
    if (_117)
    {
        _195 = (*spvDescriptorSet0.vp_c14)._m0[274].z;
    }
    float _201 = _195;
    float _203 = _201;
    if (_139)
    {
        _199 = (*spvDescriptorSet0.vp_c14)._m0[275].x;
    }
    float _205 = _199;
    bool _207 = _73 == 208;
    float _209 = _205;
    if (_139)
    {
        _203 = (*spvDescriptorSet0.vp_c14)._m0[275].z;
    }
    float _211 = _203;
    float _213 = _211;
    if (_151)
    {
        _209 = (*spvDescriptorSet0.vp_c14)._m0[276].x;
    }
    float _215 = _209;
    bool _217 = _73 == 224;
    float _219 = _215;
    if (_151)
    {
        _213 = (*spvDescriptorSet0.vp_c14)._m0[276].z;
    }
    float _221 = _213;
    float _223 = _193 + 1.2999999523162841796875;
    float _225 = _221;
    if (_163)
    {
        _219 = (*spvDescriptorSet0.vp_c14)._m0[277].x;
    }
    float _227 = _219;
    bool _229 = _73 == 240;
    float _231 = _227;
    if (_163)
    {
        _225 = (*spvDescriptorSet0.vp_c14)._m0[277].z;
    }
    float _233 = _225;
    float _235 = trunc(_223);
    int _237 = int(_235);
    float _239 = _233;
    if (_173)
    {
        _231 = (*spvDescriptorSet0.vp_c14)._m0[278].x;
    }
    float _241 = _231;
    bool _243 = _73 == 256;
    float _245 = _241;
    if (_173)
    {
        _239 = (*spvDescriptorSet0.vp_c14)._m0[278].z;
    }
    float _247 = _239;
    float _249 = _247;
    if (_185)
    {
        _245 = (*spvDescriptorSet0.vp_c14)._m0[279].x;
    }
    float _251 = _245;
    bool _253 = _73 == 272;
    float _255 = _251;
    if (_185)
    {
        _249 = (*spvDescriptorSet0.vp_c14)._m0[279].z;
    }
    float _257 = _249;
    float _259 = _257;
    if (_191)
    {
        _255 = (*spvDescriptorSet0.vp_c14)._m0[280].x;
    }
    float _261 = _255;
    bool _263 = _73 == 288;
    int _265 = min(_237, 15);
    float _267 = _261;
    if (_191)
    {
        _259 = (*spvDescriptorSet0.vp_c14)._m0[280].z;
    }
    float _269 = _259;
    bool _271 = _73 == 304;
    float _273 = float(_265);
    float _275 = _269;
    if (_207)
    {
        _267 = (*spvDescriptorSet0.vp_c14)._m0[281].x;
    }
    float _277 = _267;
    int _279 = _265 << 4;
    int _281 = _279 + 4288;
    float _283 = _277;
    float _285 = as_type<float>(_281);
    if (_207)
    {
        _275 = (*spvDescriptorSet0.vp_c14)._m0[281].z;
    }
    float _287 = _275;
    float _289 = _287;
    if (_217)
    {
        _283 = (*spvDescriptorSet0.vp_c14)._m0[282].x;
    }
    float _291 = _283;
    float _293 = -_273;
    float _295 = _293 + (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _297 = _73 == 320;
    int _299 = _281 + 8;
    uint _302 = uint(int(uint(_299) >> uint(2)));
    uint _304 = uint(int(uint(int(_302)) >> uint(2)));
    int _306 = int(_302) & 3;
    float _308 = (*spvDescriptorSet0.vp_c14)._m0[int(_304)][_306];
    int _310 = int(_302) + 1;
    uint _312 = uint(int(uint(_310) >> uint(2)));
    int _314 = _310 & 3;
    float _316 = (*spvDescriptorSet0.vp_c14)._m0[int(_312)][_314];
    float _318 = _291;
    if (_217)
    {
        _289 = (*spvDescriptorSet0.vp_c14)._m0[282].z;
    }
    float _320 = _289;
    float _322 = _295 + 1.0;
    float _324 = _320;
    if (_229)
    {
        _318 = (*spvDescriptorSet0.vp_c14)._m0[283].x;
    }
    float _326 = _318;
    bool _328 = _73 == 336;
    float _330 = _326;
    if (_229)
    {
        _324 = (*spvDescriptorSet0.vp_c14)._m0[283].z;
    }
    float _332 = _324;
    float _334 = exp2(_322);
    float _336 = _332;
    if (_243)
    {
        _330 = (*spvDescriptorSet0.vp_c14)._m0[284].x;
    }
    float _338 = _330;
    bool _340 = _73 == 352;
    float _342 = _338;
    if (_243)
    {
        _336 = (*spvDescriptorSet0.vp_c14)._m0[284].z;
    }
    float _344 = _336;
    float _346 = _344;
    if (_253)
    {
        _342 = (*spvDescriptorSet0.vp_c14)._m0[285].x;
    }
    float _348 = _342;
    bool _350 = _73 == 368;
    float _352 = _348;
    if (_253)
    {
        _346 = (*spvDescriptorSet0.vp_c14)._m0[285].z;
    }
    float _354 = _346;
    float _356 = _354;
    if (_263)
    {
        _352 = (*spvDescriptorSet0.vp_c14)._m0[286].x;
    }
    float _358 = _352;
    bool _360 = _73 == 384;
    float _362 = 1.0 / _334;
    float _364 = _358;
    if (_263)
    {
        _356 = (*spvDescriptorSet0.vp_c14)._m0[286].z;
    }
    float _366 = _356;
    float _368 = _366;
    if (_271)
    {
        _364 = (*spvDescriptorSet0.vp_c14)._m0[287].x;
    }
    float _370 = _364;
    bool _372 = _73 == 400;
    float _374 = _370;
    if (_271)
    {
        _368 = (*spvDescriptorSet0.vp_c14)._m0[287].z;
    }
    float _376 = _368;
    bool _378 = _73 == 416;
    float _380 = _376;
    if (_297)
    {
        _374 = (*spvDescriptorSet0.vp_c14)._m0[288].x;
    }
    float _382 = _374;
    float _384 = _382;
    if (_297)
    {
        _380 = (*spvDescriptorSet0.vp_c14)._m0[288].z;
    }
    float _386 = _380;
    float _388 = _386;
    if (_328)
    {
        _384 = (*spvDescriptorSet0.vp_c14)._m0[289].x;
    }
    float _390 = _384;
    bool _392 = _73 == 432;
    float _394 = _390;
    if (_328)
    {
        _388 = (*spvDescriptorSet0.vp_c14)._m0[289].z;
    }
    float _396 = _388;
    float _398 = _396;
    if (_340)
    {
        _394 = (*spvDescriptorSet0.vp_c14)._m0[290].x;
    }
    float _400 = _394;
    bool _402 = _73 == 448;
    float _404 = _400;
    if (_340)
    {
        _398 = (*spvDescriptorSet0.vp_c14)._m0[290].z;
    }
    float _406 = _398;
    float _408 = _406;
    if (_350)
    {
        _404 = (*spvDescriptorSet0.vp_c14)._m0[291].x;
    }
    float _410 = _404;
    bool _412 = _73 == 464;
    float _414 = _410;
    if (_350)
    {
        _408 = (*spvDescriptorSet0.vp_c14)._m0[291].z;
    }
    float _416 = _408;
    float _418 = _416;
    if (_360)
    {
        _414 = (*spvDescriptorSet0.vp_c14)._m0[292].x;
    }
    float _420 = _414;
    bool _422 = _73 == 480;
    float _424 = _420;
    if (_360)
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
    float _618 = _362 * _616;
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
    float _654 = _334 * _648;
    float _656 = _652 * 2.0;
    float _658 = -_652;
    float _660 = fma(_654, _658, _62);
    float _662 = _652;
    if (!_101)
    {
        _662 = (*spvDescriptorSet0.vp_c15)._m0[6].x;
    }
    float _664 = _662;
    float _666 = floor(_656);
    float _668 = _654 * _666;
    float _670 = _668 * 0.5;
    float _672 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].w);
    float _674 = _670 + _660;
    float _676 = fma(_68, _674, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _678 = fma(_674, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _680 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _682 = _676 + _680;
    float _684 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _686 = _678 + _684;
    float _688 = _682 * _682;
    float _690 = fma(_686, _686, _688);
    float _692 = fma(_131, _131, _690);
    float _694 = _692;
    float _696 = _670;
    float _698 = _664;
    float _700 = (*spvDescriptorSet0.vp_c15)._m0[4].x;
    if (!_101)
    {
        float _702 = fma(_672, _664, (*spvDescriptorSet0.vp_c15)._m0[6].w);
        _135 = _702;
    }
    float _704 = _135;
    float _706 = sqrt(_692);
    float _708 = _704;
    if (!_101)
    {
        float _710 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _704);
        _708 = _710;
    }
    float _712 = _708;
    float _714 = -_316;
    float _716 = fma(_706, _308, _714);
    float _718 = precise::clamp(_716, 0.0, 1.0);
    float _720 = -_670;
    float _722 = fma(_720, _718, _674);
    float _724 = fma(_722, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _726 = fma(_724, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].z);
    if (!_101)
    {
        float _728 = fma(_726, _664, (*spvDescriptorSet0.vp_c15)._m0[6].z);
        _123 = _728;
    }
    float _730 = _123;
    float _732 = _730;
    if (!_101)
    {
        float _734 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _730);
        _694 = _734;
    }
    float _736 = _694;
    if (!_101)
    {
        float2 _2141 = float2(_736, _712);
        float _738 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2141, float2(0.0), isnan(_2141)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2141, float2(0.0), isnan(_2141)), level(0.0)).x;
        _732 = _738;
    }
    float _740 = _732;
    if (_101)
    {
        _285 = (*spvDescriptorSet0.vp_c15)._m0[14].x;
    }
    float _742 = _285;
    float _744 = _742;
    if (_101)
    {
        _696 = (*spvDescriptorSet0.vp_c15)._m0[15].x;
    }
    float _746 = _696;
    float _748 = _746;
    if (_101)
    {
        float _750 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, _742, (*spvDescriptorSet0.vp_c15)._m0[14].w);
        _698 = _750;
    }
    float _752 = _698;
    float _754 = _752;
    if (_101)
    {
        float _756 = fma(_724, _742, (*spvDescriptorSet0.vp_c15)._m0[14].z);
        _744 = _756;
    }
    float _758 = _744;
    float _760 = _758;
    if (_101)
    {
        float _762 = fma(_752, _746, (*spvDescriptorSet0.vp_c15)._m0[15].w);
        _754 = _762;
    }
    float _764 = _754;
    float _766 = _764;
    if (_101)
    {
        float _768 = fma(_758, _746, (*spvDescriptorSet0.vp_c15)._m0[15].z);
        _760 = _768;
    }
    float _770 = _760;
    float _772 = _770;
    if (_101)
    {
        float _774 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _764);
        _766 = _774;
    }
    float _776 = _766;
    if (_101)
    {
        float _778 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _770);
        _772 = _778;
    }
    float _780 = _772;
    float _782 = _740;
    if (_101)
    {
        float2 _2235 = float2(_780, _776);
        float _784 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_2235, float2(0.0), isnan(_2235)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_2235, float2(0.0), isnan(_2235)), level(0.0)).x;
        _782 = _784;
    }
    float _786 = _782;
    float _788 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _790 = (*spvDescriptorSet0.vp_c15)._m0[0].w + _788;
    float _792 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _794 = _724 + _792;
    float _796 = _790 * _790;
    float _798 = fma(_794, _794, _796);
    float _800 = sqrt(_798);
    float _802 = fma(_672, (*spvDescriptorSet0.vp_c15)._m0[8].x, (*spvDescriptorSet0.vp_c15)._m0[8].w);
    float _804 = fma(_726, (*spvDescriptorSet0.vp_c15)._m0[8].x, (*spvDescriptorSet0.vp_c15)._m0[8].z);
    float _806 = fma(_672, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].w);
    float _808 = fma(_726, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].z);
    bool _810 = _800 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _812 = (*spvDescriptorSet0.vp_c14)._m0[0].y;
    if (!_810)
    {
        _700 = _724;
    }
    float _814 = _700;
    float _816 = fma(_786, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _818 = _816 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _820 = _814;
    if (!_810)
    {
        _812 = _816;
    }
    float _822 = _812;
    float _824 = fma(_724, (*spvDescriptorSet0.vp_c4)._m0[2].x, _818);
    float _826 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, (*spvDescriptorSet0.vp_c4)._m0[2].z, _824);
    float _828 = _826 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _830 = _826;
    float _832 = _822;
    if (!_810)
    {
        _830 = (*spvDescriptorSet0.vp_c15)._m0[0].w;
    }
    float _834 = _830;
    float _836 = _834;
    if (!_810)
    {
        _748 = _828;
    }
    float _838 = _748;
    bool _840 = !_810;
    float _842 = _838;
    if (!_840)
    {
        float _844 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _846 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _848 = _800 + _846;
        float _850 = _816 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _852 = _848 * _844;
        float _854 = rsqrt(_798);
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
        float _876 = fma(_794, _872, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _878 = _874 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _880 = fma(_790, _872, (*spvDescriptorSet0.vp_c9)._m0[26].z);
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
    out.m_40.z = _808;
    out.m_40.w = _806;
    float _900 = fma(_890, (*spvDescriptorSet0.vp_c4)._m0[1].x, _896);
    float _902 = fma(_890, (*spvDescriptorSet0.vp_c4)._m0[0].x, _898);
    out.m_42.x = _804;
    out.m_42.y = _802;
    float _904 = fma(_892, (*spvDescriptorSet0.vp_c4)._m0[1].z, _900);
    float _906 = fma(_892, (*spvDescriptorSet0.vp_c4)._m0[0].z, _902);
    out.m_44.x = _724;
    out.m_44.y = _816;
    out.m_44.z = (*spvDescriptorSet0.vp_c15)._m0[0].w;
    float _908 = _904 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _910 = _906 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    out.m_46.w = _828;
    float _912 = _908 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _914 = _908 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _916 = _908 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _918 = _908 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _920 = fma(_910, (*spvDescriptorSet0.vp_c4)._m0[7].x, _912);
    float _922 = fma(_910, (*spvDescriptorSet0.vp_c4)._m0[8].x, _914);
    float _924 = fma(_910, (*spvDescriptorSet0.vp_c4)._m0[9].x, _916);
    float _926 = fma(_910, (*spvDescriptorSet0.vp_c4)._m0[10].x, _918);
    float _928 = -_828;
    float _930 = -(*spvDescriptorSet0.vp_c9)._m0[72].y;
    float _932 = _928 + _930;
    float _934 = fma(_894, (*spvDescriptorSet0.vp_c4)._m0[7].z, _920);
    float _936 = fma(_894, (*spvDescriptorSet0.vp_c4)._m0[8].z, _922);
    float _938 = fma(_894, (*spvDescriptorSet0.vp_c4)._m0[9].z, _924);
    float _940 = fma(_894, (*spvDescriptorSet0.vp_c4)._m0[10].z, _926);
    float _942 = _932 * (*spvDescriptorSet0.vp_c9)._m0[72].z;
    float _944 = _934 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _946 = _936 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _948 = _938 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _950 = _940 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
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
    float _135 = _131;
    if (_79)
    {
        _121 = (*spvDescriptorSet0.vp_c14)._m0[269].x;
    }
    float _137 = _121;
    bool _139 = _73 == 112;
    float _141 = fma(_131, _131, _127);
    float _143 = _137;
    if (_79)
    {
        _133 = (*spvDescriptorSet0.vp_c14)._m0[269].z;
    }
    float _145 = _133;
    float _147 = _145;
    if (_81)
    {
        _143 = (*spvDescriptorSet0.vp_c14)._m0[270].x;
    }
    float _149 = _143;
    bool _151 = _73 == 128;
    float _153 = rsqrt(_141);
    float _155 = _149;
    if (_81)
    {
        _147 = (*spvDescriptorSet0.vp_c14)._m0[270].z;
    }
    float _157 = _147;
    float _159 = _157;
    if (_83)
    {
        _155 = (*spvDescriptorSet0.vp_c14)._m0[271].x;
    }
    float _161 = _155;
    bool _163 = _73 == 144;
    float _165 = _161;
    if (_83)
    {
        _159 = (*spvDescriptorSet0.vp_c14)._m0[271].z;
    }
    float _167 = _159;
    float _169 = _167;
    if (_85)
    {
        _165 = (*spvDescriptorSet0.vp_c14)._m0[272].x;
    }
    float _171 = _165;
    bool _173 = _73 == 160;
    float _175 = _171;
    if (_85)
    {
        _169 = (*spvDescriptorSet0.vp_c14)._m0[272].z;
    }
    float _177 = _169;
    float _179 = _177;
    if (_91)
    {
        _175 = (*spvDescriptorSet0.vp_c14)._m0[273].x;
    }
    float _181 = _175;
    float _183 = _153 * (*spvDescriptorSet0.vp_c14)._m0[268].x;
    bool _185 = _73 == 176;
    float _187 = _181;
    if (_91)
    {
        _179 = (*spvDescriptorSet0.vp_c14)._m0[273].z;
    }
    float _189 = _179;
    bool _191 = _73 == 192;
    float _193 = log2(_183);
    float _195 = _189;
    if (_117)
    {
        _187 = (*spvDescriptorSet0.vp_c14)._m0[274].x;
    }
    float _197 = _187;
    float _199 = _197;
    if (_117)
    {
        _195 = (*spvDescriptorSet0.vp_c14)._m0[274].z;
    }
    float _201 = _195;
    float _203 = _201;
    if (_139)
    {
        _199 = (*spvDescriptorSet0.vp_c14)._m0[275].x;
    }
    float _205 = _199;
    bool _207 = _73 == 208;
    float _209 = _205;
    if (_139)
    {
        _203 = (*spvDescriptorSet0.vp_c14)._m0[275].z;
    }
    float _211 = _203;
    float _213 = _211;
    if (_151)
    {
        _209 = (*spvDescriptorSet0.vp_c14)._m0[276].x;
    }
    float _215 = _209;
    bool _217 = _73 == 224;
    float _219 = _215;
    if (_151)
    {
        _213 = (*spvDescriptorSet0.vp_c14)._m0[276].z;
    }
    float _221 = _213;
    float _223 = _193 + 1.2999999523162841796875;
    float _225 = _221;
    if (_163)
    {
        _219 = (*spvDescriptorSet0.vp_c14)._m0[277].x;
    }
    float _227 = _219;
    bool _229 = _73 == 240;
    float _231 = _227;
    if (_163)
    {
        _225 = (*spvDescriptorSet0.vp_c14)._m0[277].z;
    }
    float _233 = _225;
    float _235 = trunc(_223);
    int _237 = int(_235);
    float _239 = _233;
    if (_173)
    {
        _231 = (*spvDescriptorSet0.vp_c14)._m0[278].x;
    }
    float _241 = _231;
    bool _243 = _73 == 256;
    float _245 = _241;
    if (_173)
    {
        _239 = (*spvDescriptorSet0.vp_c14)._m0[278].z;
    }
    float _247 = _239;
    float _249 = _247;
    if (_185)
    {
        _245 = (*spvDescriptorSet0.vp_c14)._m0[279].x;
    }
    float _251 = _245;
    bool _253 = _73 == 272;
    float _255 = _251;
    if (_185)
    {
        _249 = (*spvDescriptorSet0.vp_c14)._m0[279].z;
    }
    float _257 = _249;
    float _259 = _257;
    if (_191)
    {
        _255 = (*spvDescriptorSet0.vp_c14)._m0[280].x;
    }
    float _261 = _255;
    bool _263 = _73 == 288;
    int _265 = min(_237, 15);
    float _267 = _261;
    if (_191)
    {
        _259 = (*spvDescriptorSet0.vp_c14)._m0[280].z;
    }
    float _269 = _259;
    bool _271 = _73 == 304;
    float _273 = float(_265);
    float _275 = _269;
    if (_207)
    {
        _267 = (*spvDescriptorSet0.vp_c14)._m0[281].x;
    }
    float _277 = _267;
    int _279 = _265 << 4;
    int _281 = _279 + 4288;
    float _283 = _277;
    float _285 = as_type<float>(_281);
    if (_207)
    {
        _275 = (*spvDescriptorSet0.vp_c14)._m0[281].z;
    }
    float _287 = _275;
    float _289 = _287;
    if (_217)
    {
        _283 = (*spvDescriptorSet0.vp_c14)._m0[282].x;
    }
    float _291 = _283;
    float _293 = -_273;
    float _295 = _293 + (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _297 = _73 == 320;
    int _299 = _281 + 8;
    uint _302 = uint(int(uint(_299) >> uint(2)));
    uint _304 = uint(int(uint(int(_302)) >> uint(2)));
    int _306 = int(_302) & 3;
    float _308 = (*spvDescriptorSet0.vp_c14)._m0[int(_304)][_306];
    int _310 = int(_302) + 1;
    uint _312 = uint(int(uint(_310) >> uint(2)));
    int _314 = _310 & 3;
    float _316 = (*spvDescriptorSet0.vp_c14)._m0[int(_312)][_314];
    float _318 = _291;
    if (_217)
    {
        _289 = (*spvDescriptorSet0.vp_c14)._m0[282].z;
    }
    float _320 = _289;
    float _322 = _295 + 1.0;
    float _324 = _320;
    if (_229)
    {
        _318 = (*spvDescriptorSet0.vp_c14)._m0[283].x;
    }
    float _326 = _318;
    bool _328 = _73 == 336;
    float _330 = _326;
    if (_229)
    {
        _324 = (*spvDescriptorSet0.vp_c14)._m0[283].z;
    }
    float _332 = _324;
    float _334 = exp2(_322);
    float _336 = _332;
    if (_243)
    {
        _330 = (*spvDescriptorSet0.vp_c14)._m0[284].x;
    }
    float _338 = _330;
    bool _340 = _73 == 352;
    float _342 = _338;
    if (_243)
    {
        _336 = (*spvDescriptorSet0.vp_c14)._m0[284].z;
    }
    float _344 = _336;
    float _346 = _344;
    if (_253)
    {
        _342 = (*spvDescriptorSet0.vp_c14)._m0[285].x;
    }
    float _348 = _342;
    bool _350 = _73 == 368;
    float _352 = _348;
    if (_253)
    {
        _346 = (*spvDescriptorSet0.vp_c14)._m0[285].z;
    }
    float _354 = _346;
    float _356 = _354;
    if (_263)
    {
        _352 = (*spvDescriptorSet0.vp_c14)._m0[286].x;
    }
    float _358 = _352;
    bool _360 = _73 == 384;
    float _362 = 1.0 / _334;
    float _364 = _358;
    if (_263)
    {
        _356 = (*spvDescriptorSet0.vp_c14)._m0[286].z;
    }
    float _366 = _356;
    float _368 = _366;
    if (_271)
    {
        _364 = (*spvDescriptorSet0.vp_c14)._m0[287].x;
    }
    float _370 = _364;
    bool _372 = _73 == 400;
    float _374 = _370;
    if (_271)
    {
        _368 = (*spvDescriptorSet0.vp_c14)._m0[287].z;
    }
    float _376 = _368;
    bool _378 = _73 == 416;
    float _380 = _376;
    if (_297)
    {
        _374 = (*spvDescriptorSet0.vp_c14)._m0[288].x;
    }
    float _382 = _374;
    float _384 = _382;
    if (_297)
    {
        _380 = (*spvDescriptorSet0.vp_c14)._m0[288].z;
    }
    float _386 = _380;
    float _388 = _386;
    if (_328)
    {
        _384 = (*spvDescriptorSet0.vp_c14)._m0[289].x;
    }
    float _390 = _384;
    bool _392 = _73 == 432;
    float _394 = _390;
    if (_328)
    {
        _388 = (*spvDescriptorSet0.vp_c14)._m0[289].z;
    }
    float _396 = _388;
    float _398 = _396;
    if (_340)
    {
        _394 = (*spvDescriptorSet0.vp_c14)._m0[290].x;
    }
    float _400 = _394;
    bool _402 = _73 == 448;
    float _404 = _400;
    if (_340)
    {
        _398 = (*spvDescriptorSet0.vp_c14)._m0[290].z;
    }
    float _406 = _398;
    float _408 = _406;
    if (_350)
    {
        _404 = (*spvDescriptorSet0.vp_c14)._m0[291].x;
    }
    float _410 = _404;
    bool _412 = _73 == 464;
    float _414 = _410;
    if (_350)
    {
        _408 = (*spvDescriptorSet0.vp_c14)._m0[291].z;
    }
    float _416 = _408;
    float _418 = _416;
    if (_360)
    {
        _414 = (*spvDescriptorSet0.vp_c14)._m0[292].x;
    }
    float _420 = _414;
    bool _422 = _73 == 480;
    float _424 = _420;
    if (_360)
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
    float _618 = _362 * _616;
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
    float _654 = _334 * _648;
    float _656 = _652 * 2.0;
    float _658 = -_652;
    float _660 = fma(_654, _658, _62);
    float _662 = _652;
    if (!_101)
    {
        _662 = (*spvDescriptorSet0.vp_c15)._m0[6].x;
    }
    float _664 = _662;
    float _666 = floor(_656);
    float _668 = _654 * _666;
    float _670 = _668 * 0.5;
    float _672 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].w);
    float _674 = _670 + _660;
    float _676 = fma(_68, _674, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _678 = fma(_674, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _680 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _682 = _676 + _680;
    float _684 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _686 = _678 + _684;
    float _688 = _682 * _682;
    float _690 = fma(_686, _686, _688);
    float _692 = fma(_131, _131, _690);
    float _694 = _692;
    float _696 = _670;
    float _698 = _664;
    float _700 = (*spvDescriptorSet0.vp_c15)._m0[4].x;
    if (!_101)
    {
        float _702 = fma(_672, _664, (*spvDescriptorSet0.vp_c15)._m0[6].w);
        _135 = _702;
    }
    float _704 = _135;
    float _706 = sqrt(_692);
    float _708 = _704;
    if (!_101)
    {
        float _710 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _704);
        _708 = _710;
    }
    float _712 = _708;
    float _714 = -_316;
    float _716 = fma(_706, _308, _714);
    float _718 = precise::clamp(_716, 0.0, 1.0);
    float _720 = -_670;
    float _722 = fma(_720, _718, _674);
    float _724 = fma(_722, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _726 = fma(_724, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].z);
    if (!_101)
    {
        float _728 = fma(_726, _664, (*spvDescriptorSet0.vp_c15)._m0[6].z);
        _123 = _728;
    }
    float _730 = _123;
    float _732 = _730;
    if (!_101)
    {
        float _734 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _730);
        _694 = _734;
    }
    float _736 = _694;
    if (!_101)
    {
        float2 _2141 = float2(_736, _712);
        float _738 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2141, float2(0.0), isnan(_2141)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2141, float2(0.0), isnan(_2141)), level(0.0)).x;
        _732 = _738;
    }
    float _740 = _732;
    if (_101)
    {
        _285 = (*spvDescriptorSet0.vp_c15)._m0[14].x;
    }
    float _742 = _285;
    float _744 = _742;
    if (_101)
    {
        _696 = (*spvDescriptorSet0.vp_c15)._m0[15].x;
    }
    float _746 = _696;
    float _748 = _746;
    if (_101)
    {
        float _750 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, _742, (*spvDescriptorSet0.vp_c15)._m0[14].w);
        _698 = _750;
    }
    float _752 = _698;
    float _754 = _752;
    if (_101)
    {
        float _756 = fma(_724, _742, (*spvDescriptorSet0.vp_c15)._m0[14].z);
        _744 = _756;
    }
    float _758 = _744;
    float _760 = _758;
    if (_101)
    {
        float _762 = fma(_752, _746, (*spvDescriptorSet0.vp_c15)._m0[15].w);
        _754 = _762;
    }
    float _764 = _754;
    float _766 = _764;
    if (_101)
    {
        float _768 = fma(_758, _746, (*spvDescriptorSet0.vp_c15)._m0[15].z);
        _760 = _768;
    }
    float _770 = _760;
    float _772 = _770;
    if (_101)
    {
        float _774 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _764);
        _766 = _774;
    }
    float _776 = _766;
    if (_101)
    {
        float _778 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _770);
        _772 = _778;
    }
    float _780 = _772;
    float _782 = _740;
    if (_101)
    {
        float2 _2235 = float2(_780, _776);
        float _784 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_2235, float2(0.0), isnan(_2235)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_2235, float2(0.0), isnan(_2235)), level(0.0)).x;
        _782 = _784;
    }
    float _786 = _782;
    float _788 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _790 = (*spvDescriptorSet0.vp_c15)._m0[0].w + _788;
    float _792 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _794 = _724 + _792;
    float _796 = _790 * _790;
    float _798 = fma(_794, _794, _796);
    float _800 = sqrt(_798);
    float _802 = fma(_672, (*spvDescriptorSet0.vp_c15)._m0[8].x, (*spvDescriptorSet0.vp_c15)._m0[8].w);
    float _804 = fma(_726, (*spvDescriptorSet0.vp_c15)._m0[8].x, (*spvDescriptorSet0.vp_c15)._m0[8].z);
    float _806 = fma(_672, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].w);
    float _808 = fma(_726, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].z);
    bool _810 = _800 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _812 = (*spvDescriptorSet0.vp_c14)._m0[0].y;
    if (!_810)
    {
        _700 = _724;
    }
    float _814 = _700;
    float _816 = fma(_786, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _818 = _816 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _820 = _814;
    if (!_810)
    {
        _812 = _816;
    }
    float _822 = _812;
    float _824 = fma(_724, (*spvDescriptorSet0.vp_c4)._m0[2].x, _818);
    float _826 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, (*spvDescriptorSet0.vp_c4)._m0[2].z, _824);
    float _828 = _826 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _830 = _826;
    float _832 = _822;
    if (!_810)
    {
        _830 = (*spvDescriptorSet0.vp_c15)._m0[0].w;
    }
    float _834 = _830;
    float _836 = _834;
    if (!_810)
    {
        _748 = _828;
    }
    float _838 = _748;
    bool _840 = !_810;
    float _842 = _838;
    if (!_840)
    {
        float _844 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _846 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _848 = _800 + _846;
        float _850 = _816 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _852 = _848 * _844;
        float _854 = rsqrt(_798);
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
        float _876 = fma(_794, _872, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _878 = _874 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _880 = fma(_790, _872, (*spvDescriptorSet0.vp_c9)._m0[26].z);
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
    out.m_40.z = _808;
    out.m_40.w = _806;
    float _900 = fma(_890, (*spvDescriptorSet0.vp_c4)._m0[1].x, _896);
    float _902 = fma(_890, (*spvDescriptorSet0.vp_c4)._m0[0].x, _898);
    out.m_42.x = _804;
    out.m_42.y = _802;
    float _904 = fma(_892, (*spvDescriptorSet0.vp_c4)._m0[1].z, _900);
    float _906 = fma(_892, (*spvDescriptorSet0.vp_c4)._m0[0].z, _902);
    out.m_44.x = _724;
    out.m_44.y = _816;
    out.m_44.z = (*spvDescriptorSet0.vp_c15)._m0[0].w;
    float _908 = _904 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _910 = _906 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    out.m_46.w = _828;
    float _912 = _908 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _914 = _908 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _916 = _908 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _918 = _908 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _920 = fma(_910, (*spvDescriptorSet0.vp_c4)._m0[7].x, _912);
    float _922 = fma(_910, (*spvDescriptorSet0.vp_c4)._m0[8].x, _914);
    float _924 = fma(_910, (*spvDescriptorSet0.vp_c4)._m0[9].x, _916);
    float _926 = fma(_910, (*spvDescriptorSet0.vp_c4)._m0[10].x, _918);
    float _928 = -_828;
    float _930 = -(*spvDescriptorSet0.vp_c9)._m0[72].y;
    float _932 = _928 + _930;
    float _934 = fma(_894, (*spvDescriptorSet0.vp_c4)._m0[7].z, _920);
    float _936 = fma(_894, (*spvDescriptorSet0.vp_c4)._m0[8].z, _922);
    float _938 = fma(_894, (*spvDescriptorSet0.vp_c4)._m0[9].z, _924);
    float _940 = fma(_894, (*spvDescriptorSet0.vp_c4)._m0[10].z, _926);
    float _942 = _932 * (*spvDescriptorSet0.vp_c9)._m0[72].z;
    float _944 = _934 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _946 = _936 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _948 = _938 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _950 = _940 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
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
    float _135 = _131;
    if (_79)
    {
        _121 = (*spvDescriptorSet0.vp_c14)._m0[269].x;
    }
    float _137 = _121;
    bool _139 = _73 == 112;
    float _141 = fma(_131, _131, _127);
    float _143 = _137;
    if (_79)
    {
        _133 = (*spvDescriptorSet0.vp_c14)._m0[269].z;
    }
    float _145 = _133;
    float _147 = _145;
    if (_81)
    {
        _143 = (*spvDescriptorSet0.vp_c14)._m0[270].x;
    }
    float _149 = _143;
    bool _151 = _73 == 128;
    float _153 = rsqrt(_141);
    float _155 = _149;
    if (_81)
    {
        _147 = (*spvDescriptorSet0.vp_c14)._m0[270].z;
    }
    float _157 = _147;
    float _159 = _157;
    if (_83)
    {
        _155 = (*spvDescriptorSet0.vp_c14)._m0[271].x;
    }
    float _161 = _155;
    bool _163 = _73 == 144;
    float _165 = _161;
    if (_83)
    {
        _159 = (*spvDescriptorSet0.vp_c14)._m0[271].z;
    }
    float _167 = _159;
    float _169 = _167;
    if (_85)
    {
        _165 = (*spvDescriptorSet0.vp_c14)._m0[272].x;
    }
    float _171 = _165;
    bool _173 = _73 == 160;
    float _175 = _171;
    if (_85)
    {
        _169 = (*spvDescriptorSet0.vp_c14)._m0[272].z;
    }
    float _177 = _169;
    float _179 = _177;
    if (_91)
    {
        _175 = (*spvDescriptorSet0.vp_c14)._m0[273].x;
    }
    float _181 = _175;
    float _183 = _153 * (*spvDescriptorSet0.vp_c14)._m0[268].x;
    bool _185 = _73 == 176;
    float _187 = _181;
    if (_91)
    {
        _179 = (*spvDescriptorSet0.vp_c14)._m0[273].z;
    }
    float _189 = _179;
    bool _191 = _73 == 192;
    float _193 = log2(_183);
    float _195 = _189;
    if (_117)
    {
        _187 = (*spvDescriptorSet0.vp_c14)._m0[274].x;
    }
    float _197 = _187;
    float _199 = _197;
    if (_117)
    {
        _195 = (*spvDescriptorSet0.vp_c14)._m0[274].z;
    }
    float _201 = _195;
    float _203 = _201;
    if (_139)
    {
        _199 = (*spvDescriptorSet0.vp_c14)._m0[275].x;
    }
    float _205 = _199;
    bool _207 = _73 == 208;
    float _209 = _205;
    if (_139)
    {
        _203 = (*spvDescriptorSet0.vp_c14)._m0[275].z;
    }
    float _211 = _203;
    float _213 = _211;
    if (_151)
    {
        _209 = (*spvDescriptorSet0.vp_c14)._m0[276].x;
    }
    float _215 = _209;
    bool _217 = _73 == 224;
    float _219 = _215;
    if (_151)
    {
        _213 = (*spvDescriptorSet0.vp_c14)._m0[276].z;
    }
    float _221 = _213;
    float _223 = _193 + 1.2999999523162841796875;
    float _225 = _221;
    if (_163)
    {
        _219 = (*spvDescriptorSet0.vp_c14)._m0[277].x;
    }
    float _227 = _219;
    bool _229 = _73 == 240;
    float _231 = _227;
    if (_163)
    {
        _225 = (*spvDescriptorSet0.vp_c14)._m0[277].z;
    }
    float _233 = _225;
    float _235 = trunc(_223);
    int _237 = int(_235);
    float _239 = _233;
    if (_173)
    {
        _231 = (*spvDescriptorSet0.vp_c14)._m0[278].x;
    }
    float _241 = _231;
    bool _243 = _73 == 256;
    float _245 = _241;
    if (_173)
    {
        _239 = (*spvDescriptorSet0.vp_c14)._m0[278].z;
    }
    float _247 = _239;
    float _249 = _247;
    if (_185)
    {
        _245 = (*spvDescriptorSet0.vp_c14)._m0[279].x;
    }
    float _251 = _245;
    bool _253 = _73 == 272;
    float _255 = _251;
    if (_185)
    {
        _249 = (*spvDescriptorSet0.vp_c14)._m0[279].z;
    }
    float _257 = _249;
    float _259 = _257;
    if (_191)
    {
        _255 = (*spvDescriptorSet0.vp_c14)._m0[280].x;
    }
    float _261 = _255;
    bool _263 = _73 == 288;
    int _265 = min(_237, 15);
    float _267 = _261;
    if (_191)
    {
        _259 = (*spvDescriptorSet0.vp_c14)._m0[280].z;
    }
    float _269 = _259;
    bool _271 = _73 == 304;
    float _273 = float(_265);
    float _275 = _269;
    if (_207)
    {
        _267 = (*spvDescriptorSet0.vp_c14)._m0[281].x;
    }
    float _277 = _267;
    int _279 = _265 << 4;
    int _281 = _279 + 4288;
    float _283 = _277;
    float _285 = as_type<float>(_281);
    if (_207)
    {
        _275 = (*spvDescriptorSet0.vp_c14)._m0[281].z;
    }
    float _287 = _275;
    float _289 = _287;
    if (_217)
    {
        _283 = (*spvDescriptorSet0.vp_c14)._m0[282].x;
    }
    float _291 = _283;
    float _293 = -_273;
    float _295 = _293 + (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _297 = _73 == 320;
    int _299 = _281 + 8;
    uint _302 = uint(int(uint(_299) >> uint(2)));
    uint _304 = uint(int(uint(int(_302)) >> uint(2)));
    int _306 = int(_302) & 3;
    float _308 = (*spvDescriptorSet0.vp_c14)._m0[int(_304)][_306];
    int _310 = int(_302) + 1;
    uint _312 = uint(int(uint(_310) >> uint(2)));
    int _314 = _310 & 3;
    float _316 = (*spvDescriptorSet0.vp_c14)._m0[int(_312)][_314];
    float _318 = _291;
    if (_217)
    {
        _289 = (*spvDescriptorSet0.vp_c14)._m0[282].z;
    }
    float _320 = _289;
    float _322 = _295 + 1.0;
    float _324 = _320;
    if (_229)
    {
        _318 = (*spvDescriptorSet0.vp_c14)._m0[283].x;
    }
    float _326 = _318;
    bool _328 = _73 == 336;
    float _330 = _326;
    if (_229)
    {
        _324 = (*spvDescriptorSet0.vp_c14)._m0[283].z;
    }
    float _332 = _324;
    float _334 = exp2(_322);
    float _336 = _332;
    if (_243)
    {
        _330 = (*spvDescriptorSet0.vp_c14)._m0[284].x;
    }
    float _338 = _330;
    bool _340 = _73 == 352;
    float _342 = _338;
    if (_243)
    {
        _336 = (*spvDescriptorSet0.vp_c14)._m0[284].z;
    }
    float _344 = _336;
    float _346 = _344;
    if (_253)
    {
        _342 = (*spvDescriptorSet0.vp_c14)._m0[285].x;
    }
    float _348 = _342;
    bool _350 = _73 == 368;
    float _352 = _348;
    if (_253)
    {
        _346 = (*spvDescriptorSet0.vp_c14)._m0[285].z;
    }
    float _354 = _346;
    float _356 = _354;
    if (_263)
    {
        _352 = (*spvDescriptorSet0.vp_c14)._m0[286].x;
    }
    float _358 = _352;
    bool _360 = _73 == 384;
    float _362 = 1.0 / _334;
    float _364 = _358;
    if (_263)
    {
        _356 = (*spvDescriptorSet0.vp_c14)._m0[286].z;
    }
    float _366 = _356;
    float _368 = _366;
    if (_271)
    {
        _364 = (*spvDescriptorSet0.vp_c14)._m0[287].x;
    }
    float _370 = _364;
    bool _372 = _73 == 400;
    float _374 = _370;
    if (_271)
    {
        _368 = (*spvDescriptorSet0.vp_c14)._m0[287].z;
    }
    float _376 = _368;
    bool _378 = _73 == 416;
    float _380 = _376;
    if (_297)
    {
        _374 = (*spvDescriptorSet0.vp_c14)._m0[288].x;
    }
    float _382 = _374;
    float _384 = _382;
    if (_297)
    {
        _380 = (*spvDescriptorSet0.vp_c14)._m0[288].z;
    }
    float _386 = _380;
    float _388 = _386;
    if (_328)
    {
        _384 = (*spvDescriptorSet0.vp_c14)._m0[289].x;
    }
    float _390 = _384;
    bool _392 = _73 == 432;
    float _394 = _390;
    if (_328)
    {
        _388 = (*spvDescriptorSet0.vp_c14)._m0[289].z;
    }
    float _396 = _388;
    float _398 = _396;
    if (_340)
    {
        _394 = (*spvDescriptorSet0.vp_c14)._m0[290].x;
    }
    float _400 = _394;
    bool _402 = _73 == 448;
    float _404 = _400;
    if (_340)
    {
        _398 = (*spvDescriptorSet0.vp_c14)._m0[290].z;
    }
    float _406 = _398;
    float _408 = _406;
    if (_350)
    {
        _404 = (*spvDescriptorSet0.vp_c14)._m0[291].x;
    }
    float _410 = _404;
    bool _412 = _73 == 464;
    float _414 = _410;
    if (_350)
    {
        _408 = (*spvDescriptorSet0.vp_c14)._m0[291].z;
    }
    float _416 = _408;
    float _418 = _416;
    if (_360)
    {
        _414 = (*spvDescriptorSet0.vp_c14)._m0[292].x;
    }
    float _420 = _414;
    bool _422 = _73 == 480;
    float _424 = _420;
    if (_360)
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
    float _618 = _362 * _616;
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
    float _654 = _334 * _648;
    float _656 = _652 * 2.0;
    float _658 = -_652;
    float _660 = fma(_654, _658, _62);
    float _662 = _652;
    if (!_101)
    {
        _662 = (*spvDescriptorSet0.vp_c15)._m0[6].x;
    }
    float _664 = _662;
    float _666 = floor(_656);
    float _668 = _654 * _666;
    float _670 = _668 * 0.5;
    float _672 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].w);
    float _674 = _670 + _660;
    float _676 = fma(_68, _674, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _678 = fma(_674, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _680 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _682 = _676 + _680;
    float _684 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _686 = _678 + _684;
    float _688 = _682 * _682;
    float _690 = fma(_686, _686, _688);
    float _692 = fma(_131, _131, _690);
    float _694 = _692;
    float _696 = _670;
    float _698 = _664;
    float _700 = (*spvDescriptorSet0.vp_c15)._m0[4].x;
    if (!_101)
    {
        float _702 = fma(_672, _664, (*spvDescriptorSet0.vp_c15)._m0[6].w);
        _135 = _702;
    }
    float _704 = _135;
    float _706 = sqrt(_692);
    float _708 = _704;
    if (!_101)
    {
        float _710 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _704);
        _708 = _710;
    }
    float _712 = _708;
    float _714 = -_316;
    float _716 = fma(_706, _308, _714);
    float _718 = precise::clamp(_716, 0.0, 1.0);
    float _720 = -_670;
    float _722 = fma(_720, _718, _674);
    float _724 = fma(_722, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _726 = fma(_724, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].z);
    if (!_101)
    {
        float _728 = fma(_726, _664, (*spvDescriptorSet0.vp_c15)._m0[6].z);
        _123 = _728;
    }
    float _730 = _123;
    float _732 = _730;
    if (!_101)
    {
        float _734 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _730);
        _694 = _734;
    }
    float _736 = _694;
    if (!_101)
    {
        float2 _2141 = float2(_736, _712);
        float _738 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2141, float2(0.0), isnan(_2141)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2141, float2(0.0), isnan(_2141)), level(0.0)).x;
        _732 = _738;
    }
    float _740 = _732;
    if (_101)
    {
        _285 = (*spvDescriptorSet0.vp_c15)._m0[14].x;
    }
    float _742 = _285;
    float _744 = _742;
    if (_101)
    {
        _696 = (*spvDescriptorSet0.vp_c15)._m0[15].x;
    }
    float _746 = _696;
    float _748 = _746;
    if (_101)
    {
        float _750 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, _742, (*spvDescriptorSet0.vp_c15)._m0[14].w);
        _698 = _750;
    }
    float _752 = _698;
    float _754 = _752;
    if (_101)
    {
        float _756 = fma(_724, _742, (*spvDescriptorSet0.vp_c15)._m0[14].z);
        _744 = _756;
    }
    float _758 = _744;
    float _760 = _758;
    if (_101)
    {
        float _762 = fma(_752, _746, (*spvDescriptorSet0.vp_c15)._m0[15].w);
        _754 = _762;
    }
    float _764 = _754;
    float _766 = _764;
    if (_101)
    {
        float _768 = fma(_758, _746, (*spvDescriptorSet0.vp_c15)._m0[15].z);
        _760 = _768;
    }
    float _770 = _760;
    float _772 = _770;
    if (_101)
    {
        float _774 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _764);
        _766 = _774;
    }
    float _776 = _766;
    if (_101)
    {
        float _778 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _770);
        _772 = _778;
    }
    float _780 = _772;
    float _782 = _740;
    if (_101)
    {
        float2 _2235 = float2(_780, _776);
        float _784 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_2235, float2(0.0), isnan(_2235)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_2235, float2(0.0), isnan(_2235)), level(0.0)).x;
        _782 = _784;
    }
    float _786 = _782;
    float _788 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _790 = (*spvDescriptorSet0.vp_c15)._m0[0].w + _788;
    float _792 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _794 = _724 + _792;
    float _796 = _790 * _790;
    float _798 = fma(_794, _794, _796);
    float _800 = sqrt(_798);
    float _802 = fma(_672, (*spvDescriptorSet0.vp_c15)._m0[8].x, (*spvDescriptorSet0.vp_c15)._m0[8].w);
    float _804 = fma(_726, (*spvDescriptorSet0.vp_c15)._m0[8].x, (*spvDescriptorSet0.vp_c15)._m0[8].z);
    float _806 = fma(_672, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].w);
    float _808 = fma(_726, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].z);
    bool _810 = _800 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _812 = (*spvDescriptorSet0.vp_c14)._m0[0].y;
    if (!_810)
    {
        _700 = _724;
    }
    float _814 = _700;
    float _816 = fma(_786, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _818 = _816 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _820 = _814;
    if (!_810)
    {
        _812 = _816;
    }
    float _822 = _812;
    float _824 = fma(_724, (*spvDescriptorSet0.vp_c4)._m0[2].x, _818);
    float _826 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, (*spvDescriptorSet0.vp_c4)._m0[2].z, _824);
    float _828 = _826 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _830 = _826;
    float _832 = _822;
    if (!_810)
    {
        _830 = (*spvDescriptorSet0.vp_c15)._m0[0].w;
    }
    float _834 = _830;
    float _836 = _834;
    if (!_810)
    {
        _748 = _828;
    }
    float _838 = _748;
    bool _840 = !_810;
    float _842 = _838;
    if (!_840)
    {
        float _844 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _846 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _848 = _800 + _846;
        float _850 = _816 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _852 = _848 * _844;
        float _854 = rsqrt(_798);
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
        float _876 = fma(_794, _872, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _878 = _874 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _880 = fma(_790, _872, (*spvDescriptorSet0.vp_c9)._m0[26].z);
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
    out.m_40.z = _808;
    out.m_40.w = _806;
    float _900 = fma(_890, (*spvDescriptorSet0.vp_c4)._m0[1].x, _896);
    float _902 = fma(_890, (*spvDescriptorSet0.vp_c4)._m0[0].x, _898);
    out.m_42.x = _804;
    out.m_42.y = _802;
    float _904 = fma(_892, (*spvDescriptorSet0.vp_c4)._m0[1].z, _900);
    float _906 = fma(_892, (*spvDescriptorSet0.vp_c4)._m0[0].z, _902);
    out.m_44.x = _724;
    out.m_44.y = _816;
    out.m_44.z = (*spvDescriptorSet0.vp_c15)._m0[0].w;
    float _908 = _904 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _910 = _906 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    out.m_46.w = _828;
    float _912 = _908 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _914 = _908 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _916 = _908 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _918 = _908 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _920 = fma(_910, (*spvDescriptorSet0.vp_c4)._m0[7].x, _912);
    float _922 = fma(_910, (*spvDescriptorSet0.vp_c4)._m0[8].x, _914);
    float _924 = fma(_910, (*spvDescriptorSet0.vp_c4)._m0[9].x, _916);
    float _926 = fma(_910, (*spvDescriptorSet0.vp_c4)._m0[10].x, _918);
    float _928 = -_828;
    float _930 = -(*spvDescriptorSet0.vp_c9)._m0[72].y;
    float _932 = _928 + _930;
    float _934 = fma(_894, (*spvDescriptorSet0.vp_c4)._m0[7].z, _920);
    float _936 = fma(_894, (*spvDescriptorSet0.vp_c4)._m0[8].z, _922);
    float _938 = fma(_894, (*spvDescriptorSet0.vp_c4)._m0[9].z, _924);
    float _940 = fma(_894, (*spvDescriptorSet0.vp_c4)._m0[10].z, _926);
    float _942 = _932 * (*spvDescriptorSet0.vp_c9)._m0[72].z;
    float _944 = _934 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _946 = _936 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _948 = _938 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _950 = _940 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.m_48.w = _942;
    out.gl_Position.x = _944;
    out.gl_Position.y = _946;
    out.gl_Position.z = _948;
    out.gl_Position.w = _950;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_40.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_40.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_40.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_40.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

