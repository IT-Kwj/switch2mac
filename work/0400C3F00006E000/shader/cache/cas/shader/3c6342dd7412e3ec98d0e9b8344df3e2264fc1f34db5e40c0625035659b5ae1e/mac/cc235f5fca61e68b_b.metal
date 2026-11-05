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
    float4 m_40 [[user(locn3)]];
    float4 m_42 [[user(locn4)]];
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
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _56 = in.m_37.x;
    float _58 = in.m_37.y;
    float _60 = -(*spvDescriptorSet0.vp_c15)._m0[3].x;
    float _62 = _60 + (*spvDescriptorSet0.vp_c15)._m0[3].y;
    int _65 = 16 + as_type<int>(as_type<float>(gl_BaseInstance));
    int _67 = _65 << 4;
    bool _71 = _67 == 0;
    bool _73 = _67 == 16;
    bool _75 = _67 == 32;
    bool _77 = _67 == 48;
    bool _79 = _67 == 64;
    float _81 = fma(_62, _56, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _83 = fma(_56, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    bool _85 = _67 == 80;
    bool _87 = _58 >= 0.5;
    bool _89 = isnan(_58);
    bool _91 = _87 || _89;
    bool _93 = isnan(0.5);
    bool _95 = _91 || _93;
    float _97 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _99 = _81 + _97;
    float _101 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _103 = _83 + _101;
    float _105 = as_type<float>(gl_BaseInstance);
    float _107 = _58;
    if (_71)
    {
        _105 = (*spvDescriptorSet0.vp_c14)._m0[268].x;
    }
    float _109 = _105;
    float _111 = _99 * _99;
    bool _113 = _67 == 96;
    float _115 = 0.0;
    float _117 = _109;
    if (_71)
    {
        _115 = (*spvDescriptorSet0.vp_c14)._m0[268].z;
    }
    float _119 = _115;
    float _121 = fma(_103, _103, _111);
    float _123 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _125 = (*spvDescriptorSet0.vp_c15)._m0[0].w + _123;
    float _127 = _119;
    float _129 = _125;
    if (_73)
    {
        _117 = (*spvDescriptorSet0.vp_c14)._m0[269].x;
    }
    float _131 = _117;
    bool _133 = _67 == 112;
    float _135 = fma(_125, _125, _121);
    float _137 = _131;
    if (_73)
    {
        _127 = (*spvDescriptorSet0.vp_c14)._m0[269].z;
    }
    float _139 = _127;
    float _141 = _139;
    if (!_95)
    {
        _107 = (*spvDescriptorSet0.vp_c15)._m0[5].x;
    }
    float _143 = _107;
    float _145 = _143;
    if (_75)
    {
        _137 = (*spvDescriptorSet0.vp_c14)._m0[270].x;
    }
    float _147 = _137;
    bool _149 = _67 == 128;
    float _151 = rsqrt(_135);
    float _153 = _147;
    if (_75)
    {
        _141 = (*spvDescriptorSet0.vp_c14)._m0[270].z;
    }
    float _155 = _141;
    float _157 = _155;
    if (_77)
    {
        _153 = (*spvDescriptorSet0.vp_c14)._m0[271].x;
    }
    float _159 = _153;
    bool _161 = _67 == 144;
    float _163 = _159;
    if (_77)
    {
        _157 = (*spvDescriptorSet0.vp_c14)._m0[271].z;
    }
    float _165 = _157;
    float _167 = _165;
    if (_79)
    {
        _163 = (*spvDescriptorSet0.vp_c14)._m0[272].x;
    }
    float _169 = _163;
    bool _171 = _67 == 160;
    float _173 = _169;
    if (_79)
    {
        _167 = (*spvDescriptorSet0.vp_c14)._m0[272].z;
    }
    float _175 = _167;
    float _177 = _175;
    if (_85)
    {
        _173 = (*spvDescriptorSet0.vp_c14)._m0[273].x;
    }
    float _179 = _173;
    float _181 = _151 * (*spvDescriptorSet0.vp_c14)._m0[268].x;
    bool _183 = _67 == 176;
    float _185 = _179;
    if (_85)
    {
        _177 = (*spvDescriptorSet0.vp_c14)._m0[273].z;
    }
    float _187 = _177;
    bool _189 = _67 == 192;
    float _191 = log2(_181);
    float _193 = _187;
    if (_113)
    {
        _185 = (*spvDescriptorSet0.vp_c14)._m0[274].x;
    }
    float _195 = _185;
    float _197 = _195;
    if (_113)
    {
        _193 = (*spvDescriptorSet0.vp_c14)._m0[274].z;
    }
    float _199 = _193;
    float _201 = _199;
    if (_133)
    {
        _197 = (*spvDescriptorSet0.vp_c14)._m0[275].x;
    }
    float _203 = _197;
    bool _205 = _67 == 208;
    float _207 = _203;
    if (_133)
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
    bool _215 = _67 == 224;
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
    bool _227 = _67 == 240;
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
    bool _241 = _67 == 256;
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
    bool _251 = _67 == 272;
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
    bool _261 = _67 == 288;
    int _263 = min(_235, 15);
    float _265 = _259;
    if (_189)
    {
        _257 = (*spvDescriptorSet0.vp_c14)._m0[280].z;
    }
    float _267 = _257;
    bool _269 = _67 == 304;
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
    float _283 = as_type<float>(_279);
    if (_205)
    {
        _273 = (*spvDescriptorSet0.vp_c14)._m0[281].z;
    }
    float _285 = _273;
    float _287 = _285;
    if (_215)
    {
        _281 = (*spvDescriptorSet0.vp_c14)._m0[282].x;
    }
    float _289 = _281;
    float _291 = -_271;
    float _293 = _291 + (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _295 = _67 == 320;
    int _297 = _279 + 8;
    uint _300 = uint(int(uint(_297) >> uint(2)));
    uint _302 = uint(int(uint(int(_300)) >> uint(2)));
    int _304 = int(_300) & 3;
    float _306 = (*spvDescriptorSet0.vp_c14)._m0[int(_302)][_304];
    int _308 = int(_300) + 1;
    uint _310 = uint(int(uint(_308) >> uint(2)));
    int _312 = _308 & 3;
    float _314 = (*spvDescriptorSet0.vp_c14)._m0[int(_310)][_312];
    float _316 = _289;
    if (_215)
    {
        _287 = (*spvDescriptorSet0.vp_c14)._m0[282].z;
    }
    float _318 = _287;
    float _320 = _293 + 1.0;
    float _322 = _318;
    if (_227)
    {
        _316 = (*spvDescriptorSet0.vp_c14)._m0[283].x;
    }
    float _324 = _316;
    bool _326 = _67 == 336;
    float _328 = _324;
    if (_227)
    {
        _322 = (*spvDescriptorSet0.vp_c14)._m0[283].z;
    }
    float _330 = _322;
    float _332 = exp2(_320);
    float _334 = _330;
    if (_241)
    {
        _328 = (*spvDescriptorSet0.vp_c14)._m0[284].x;
    }
    float _336 = _328;
    bool _338 = _67 == 352;
    float _340 = _336;
    if (_241)
    {
        _334 = (*spvDescriptorSet0.vp_c14)._m0[284].z;
    }
    float _342 = _334;
    float _344 = _342;
    if (_251)
    {
        _340 = (*spvDescriptorSet0.vp_c14)._m0[285].x;
    }
    float _346 = _340;
    bool _348 = _67 == 368;
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
    bool _358 = _67 == 384;
    float _360 = 1.0 / _332;
    float _362 = _356;
    float _364 = _332;
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
    bool _372 = _67 == 400;
    float _374 = _370;
    if (_269)
    {
        _368 = (*spvDescriptorSet0.vp_c14)._m0[287].z;
    }
    float _376 = _368;
    bool _378 = _67 == 416;
    float _380 = _376;
    if (_295)
    {
        _374 = (*spvDescriptorSet0.vp_c14)._m0[288].x;
    }
    float _382 = _374;
    float _384 = _382;
    if (_295)
    {
        _380 = (*spvDescriptorSet0.vp_c14)._m0[288].z;
    }
    float _386 = _380;
    float _388 = _386;
    if (_326)
    {
        _384 = (*spvDescriptorSet0.vp_c14)._m0[289].x;
    }
    float _390 = _384;
    bool _392 = _67 == 432;
    float _394 = _390;
    if (_326)
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
    bool _402 = _67 == 448;
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
    bool _412 = _67 == 464;
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
    bool _422 = _67 == 480;
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
    bool _432 = _67 == 496;
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
    bool _442 = _67 == 512;
    float _444 = _440;
    if (_378)
    {
        _438 = (*spvDescriptorSet0.vp_c14)._m0[294].z;
    }
    float _446 = _438;
    bool _448 = _67 == 528;
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
    bool _462 = _67 == 544;
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
    bool _472 = _67 == 560;
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
    bool _482 = _67 == 576;
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
    bool _492 = _67 == 592;
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
    bool _502 = _67 == 608;
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
    bool _512 = _67 == 624;
    float _514 = _510;
    if (_448)
    {
        _508 = (*spvDescriptorSet0.vp_c14)._m0[301].z;
    }
    float _516 = _508;
    bool _518 = _67 == 640;
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
    bool _532 = _67 == 656;
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
    bool _542 = _67 == 672;
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
    bool _552 = _67 == 688;
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
    bool _562 = _67 == 704;
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
    bool _572 = _67 == 720;
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
    bool _582 = _67 == 736;
    float _584 = _580;
    if (_518)
    {
        _578 = (*spvDescriptorSet0.vp_c14)._m0[308].z;
    }
    float _586 = _578;
    bool _588 = _67 == 752;
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
    float _626 = _618 * _56;
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
    float _654 = _332 * _648;
    float _656 = _652;
    if (!_95)
    {
        _364 = (*spvDescriptorSet0.vp_c15)._m0[6].x;
    }
    float _658 = _364;
    float _660 = _652 * 2.0;
    float _662 = -_652;
    float _664 = fma(_654, _662, _56);
    float _666 = floor(_660);
    float _668 = _654 * _666;
    float _670 = _668 * 0.5;
    float _672 = _670 + _664;
    float _674 = fma(_62, _672, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _676 = fma(_672, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _678 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _680 = _674 + _678;
    float _682 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _684 = _676 + _682;
    float _686 = _680 * _680;
    float _688 = fma(_684, _684, _686);
    float _690 = fma(_125, _125, _688);
    float _692 = _690;
    float _694 = _658;
    if (!_95)
    {
        float _696 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, _143, (*spvDescriptorSet0.vp_c15)._m0[5].w);
        _129 = _696;
    }
    float _698 = _129;
    float _700 = sqrt(_690);
    float _702 = _698;
    if (!_95)
    {
        float _704 = fma(_698, _658, (*spvDescriptorSet0.vp_c15)._m0[6].w);
        _702 = _704;
    }
    float _706 = _702;
    float _708 = _706;
    if (!_95)
    {
        float _710 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _706);
        _708 = _710;
    }
    float _712 = _708;
    float _714 = -_314;
    float _716 = fma(_700, _306, _714);
    float _718 = precise::clamp(_716, 0.0, 1.0);
    float _720 = -_670;
    float _722 = fma(_720, _718, _672);
    float _724 = fma(_722, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    if (!_95)
    {
        float _726 = fma(_724, _143, (*spvDescriptorSet0.vp_c15)._m0[5].z);
        _145 = _726;
    }
    float _728 = _145;
    float _730 = _728;
    if (!_95)
    {
        float _732 = fma(_728, _658, (*spvDescriptorSet0.vp_c15)._m0[6].z);
        _730 = _732;
    }
    float _734 = _730;
    float _736 = _734;
    if (!_95)
    {
        float _738 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _734);
        _692 = _738;
    }
    float _740 = _692;
    if (!_95)
    {
        float2 _2148 = float2(_740, _712);
        float _742 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2148, float2(0.0), isnan(_2148)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2148, float2(0.0), isnan(_2148)), level(0.0)).x;
        _736 = _742;
    }
    float _744 = _736;
    if (_95)
    {
        _283 = (*spvDescriptorSet0.vp_c15)._m0[14].x;
    }
    float _746 = _283;
    float _748 = _746;
    if (_95)
    {
        _656 = (*spvDescriptorSet0.vp_c15)._m0[15].x;
    }
    float _750 = _656;
    if (_95)
    {
        float _752 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, _746, (*spvDescriptorSet0.vp_c15)._m0[14].w);
        _694 = _752;
    }
    float _754 = _694;
    float _756 = _754;
    if (_95)
    {
        float _758 = fma(_724, _746, (*spvDescriptorSet0.vp_c15)._m0[14].z);
        _748 = _758;
    }
    float _760 = _748;
    float _762 = _760;
    if (_95)
    {
        float _764 = fma(_754, _750, (*spvDescriptorSet0.vp_c15)._m0[15].w);
        _756 = _764;
    }
    float _766 = _756;
    float _768 = _766;
    if (_95)
    {
        float _770 = fma(_760, _750, (*spvDescriptorSet0.vp_c15)._m0[15].z);
        _762 = _770;
    }
    float _772 = _762;
    float _774 = _772;
    if (_95)
    {
        float _776 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _766);
        _768 = _776;
    }
    float _778 = _768;
    float _780 = _778;
    if (_95)
    {
        float _782 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _772);
        _774 = _782;
    }
    float _784 = _774;
    float _786 = _744;
    float _788 = _784;
    if (_95)
    {
        float2 _2243 = float2(_784, _778);
        float _790 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_2243, float2(0.0), isnan(_2243)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_2243, float2(0.0), isnan(_2243)), level(0.0)).x;
        _786 = _790;
    }
    float _792 = _786;
    float _794 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _796 = (*spvDescriptorSet0.vp_c15)._m0[0].w + _794;
    float _798 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _800 = _724 + _798;
    float _802 = _796 * _796;
    float _804 = fma(_800, _800, _802);
    float _806 = sqrt(_804);
    bool _808 = _806 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _810 = (*spvDescriptorSet0.vp_c14)._m0[0].y;
    if (!_808)
    {
        _788 = _724;
    }
    float _812 = _788;
    float _814 = fma(_792, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _816 = _814 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _818 = _812;
    if (!_808)
    {
        _810 = _814;
    }
    float _820 = _810;
    float _822 = fma(_724, (*spvDescriptorSet0.vp_c4)._m0[2].x, _816);
    float _824 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, (*spvDescriptorSet0.vp_c4)._m0[2].z, _822);
    float _826 = _824 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _828 = _824;
    float _830 = _820;
    if (!_808)
    {
        _828 = (*spvDescriptorSet0.vp_c15)._m0[0].w;
    }
    float _832 = _828;
    float _834 = _832;
    if (!_808)
    {
        _780 = _826;
    }
    float _836 = _780;
    bool _838 = !_808;
    float _840 = _836;
    if (!_838)
    {
        float _842 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _844 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _846 = _806 + _844;
        float _848 = _814 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _850 = _846 * _842;
        float _852 = rsqrt(_804);
        float _854 = _850 * 0.15915493667125701904296875;
        float _856 = _854 * 6.283185482025146484375;
        float _858 = cos(_856);
        float _860 = _854 * 6.283185482025146484375;
        float _862 = sin(_860);
        float _864 = _858 + (-1.0);
        float _866 = fma(_862, _848, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _868 = _864 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _870 = _852 * _866;
        float _872 = fma(_814, _858, _868);
        float _874 = fma(_800, _870, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _876 = _872 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _878 = fma(_796, _870, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _880 = fma(_874, (*spvDescriptorSet0.vp_c4)._m0[2].x, _876);
        float _882 = fma(_878, (*spvDescriptorSet0.vp_c4)._m0[2].z, _880);
        float _884 = _882 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _830 = _872;
        _818 = _874;
        _834 = _878;
        _840 = _884;
    }
    float _886 = _830;
    float _888 = _818;
    float _890 = _834;
    float _892 = _840;
    float _894 = _886 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _896 = _886 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    out.m_40.x = _724;
    out.m_40.y = _814;
    out.m_40.z = (*spvDescriptorSet0.vp_c15)._m0[0].w;
    float _898 = fma(_888, (*spvDescriptorSet0.vp_c4)._m0[1].x, _894);
    float _900 = fma(_888, (*spvDescriptorSet0.vp_c4)._m0[0].x, _896);
    out.m_42.w = _826;
    float _902 = fma(_890, (*spvDescriptorSet0.vp_c4)._m0[1].z, _898);
    float _904 = fma(_890, (*spvDescriptorSet0.vp_c4)._m0[0].z, _900);
    float _906 = _902 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _908 = _904 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _910 = _906 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _912 = _906 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _914 = _906 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _916 = _906 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _918 = fma(_908, (*spvDescriptorSet0.vp_c4)._m0[9].x, _910);
    float _920 = fma(_908, (*spvDescriptorSet0.vp_c4)._m0[7].x, _912);
    float _922 = fma(_908, (*spvDescriptorSet0.vp_c4)._m0[8].x, _914);
    float _924 = fma(_908, (*spvDescriptorSet0.vp_c4)._m0[10].x, _916);
    float _926 = fma(_892, (*spvDescriptorSet0.vp_c4)._m0[9].z, _918);
    float _928 = fma(_892, (*spvDescriptorSet0.vp_c4)._m0[7].z, _920);
    float _930 = fma(_892, (*spvDescriptorSet0.vp_c4)._m0[8].z, _922);
    float _932 = fma(_892, (*spvDescriptorSet0.vp_c4)._m0[10].z, _924);
    float _934 = _926 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _936 = _928 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _938 = _930 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _940 = _932 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.gl_Position.x = _936;
    out.gl_Position.y = _938;
    out.gl_Position.z = _934;
    out.gl_Position.w = _940;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_BaseInstance [[base_instance]])
{
    main0_out out = {};
    out.m_40 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _56 = in.m_37.x;
    float _58 = in.m_37.y;
    float _60 = -(*spvDescriptorSet0.vp_c15)._m0[3].x;
    float _62 = _60 + (*spvDescriptorSet0.vp_c15)._m0[3].y;
    int _65 = 16 + as_type<int>(as_type<float>(gl_BaseInstance));
    int _67 = _65 << 4;
    bool _71 = _67 == 0;
    bool _73 = _67 == 16;
    bool _75 = _67 == 32;
    bool _77 = _67 == 48;
    bool _79 = _67 == 64;
    float _81 = fma(_62, _56, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _83 = fma(_56, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    bool _85 = _67 == 80;
    bool _87 = _58 >= 0.5;
    bool _89 = isnan(_58);
    bool _91 = _87 || _89;
    bool _93 = isnan(0.5);
    bool _95 = _91 || _93;
    float _97 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _99 = _81 + _97;
    float _101 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _103 = _83 + _101;
    float _105 = as_type<float>(gl_BaseInstance);
    float _107 = _58;
    if (_71)
    {
        _105 = (*spvDescriptorSet0.vp_c14)._m0[268].x;
    }
    float _109 = _105;
    float _111 = _99 * _99;
    bool _113 = _67 == 96;
    float _115 = 0.0;
    float _117 = _109;
    if (_71)
    {
        _115 = (*spvDescriptorSet0.vp_c14)._m0[268].z;
    }
    float _119 = _115;
    float _121 = fma(_103, _103, _111);
    float _123 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _125 = (*spvDescriptorSet0.vp_c15)._m0[0].w + _123;
    float _127 = _119;
    float _129 = _125;
    if (_73)
    {
        _117 = (*spvDescriptorSet0.vp_c14)._m0[269].x;
    }
    float _131 = _117;
    bool _133 = _67 == 112;
    float _135 = fma(_125, _125, _121);
    float _137 = _131;
    if (_73)
    {
        _127 = (*spvDescriptorSet0.vp_c14)._m0[269].z;
    }
    float _139 = _127;
    float _141 = _139;
    if (!_95)
    {
        _107 = (*spvDescriptorSet0.vp_c15)._m0[5].x;
    }
    float _143 = _107;
    float _145 = _143;
    if (_75)
    {
        _137 = (*spvDescriptorSet0.vp_c14)._m0[270].x;
    }
    float _147 = _137;
    bool _149 = _67 == 128;
    float _151 = rsqrt(_135);
    float _153 = _147;
    if (_75)
    {
        _141 = (*spvDescriptorSet0.vp_c14)._m0[270].z;
    }
    float _155 = _141;
    float _157 = _155;
    if (_77)
    {
        _153 = (*spvDescriptorSet0.vp_c14)._m0[271].x;
    }
    float _159 = _153;
    bool _161 = _67 == 144;
    float _163 = _159;
    if (_77)
    {
        _157 = (*spvDescriptorSet0.vp_c14)._m0[271].z;
    }
    float _165 = _157;
    float _167 = _165;
    if (_79)
    {
        _163 = (*spvDescriptorSet0.vp_c14)._m0[272].x;
    }
    float _169 = _163;
    bool _171 = _67 == 160;
    float _173 = _169;
    if (_79)
    {
        _167 = (*spvDescriptorSet0.vp_c14)._m0[272].z;
    }
    float _175 = _167;
    float _177 = _175;
    if (_85)
    {
        _173 = (*spvDescriptorSet0.vp_c14)._m0[273].x;
    }
    float _179 = _173;
    float _181 = _151 * (*spvDescriptorSet0.vp_c14)._m0[268].x;
    bool _183 = _67 == 176;
    float _185 = _179;
    if (_85)
    {
        _177 = (*spvDescriptorSet0.vp_c14)._m0[273].z;
    }
    float _187 = _177;
    bool _189 = _67 == 192;
    float _191 = log2(_181);
    float _193 = _187;
    if (_113)
    {
        _185 = (*spvDescriptorSet0.vp_c14)._m0[274].x;
    }
    float _195 = _185;
    float _197 = _195;
    if (_113)
    {
        _193 = (*spvDescriptorSet0.vp_c14)._m0[274].z;
    }
    float _199 = _193;
    float _201 = _199;
    if (_133)
    {
        _197 = (*spvDescriptorSet0.vp_c14)._m0[275].x;
    }
    float _203 = _197;
    bool _205 = _67 == 208;
    float _207 = _203;
    if (_133)
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
    bool _215 = _67 == 224;
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
    bool _227 = _67 == 240;
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
    bool _241 = _67 == 256;
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
    bool _251 = _67 == 272;
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
    bool _261 = _67 == 288;
    int _263 = min(_235, 15);
    float _265 = _259;
    if (_189)
    {
        _257 = (*spvDescriptorSet0.vp_c14)._m0[280].z;
    }
    float _267 = _257;
    bool _269 = _67 == 304;
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
    float _283 = as_type<float>(_279);
    if (_205)
    {
        _273 = (*spvDescriptorSet0.vp_c14)._m0[281].z;
    }
    float _285 = _273;
    float _287 = _285;
    if (_215)
    {
        _281 = (*spvDescriptorSet0.vp_c14)._m0[282].x;
    }
    float _289 = _281;
    float _291 = -_271;
    float _293 = _291 + (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _295 = _67 == 320;
    int _297 = _279 + 8;
    uint _300 = uint(int(uint(_297) >> uint(2)));
    uint _302 = uint(int(uint(int(_300)) >> uint(2)));
    int _304 = int(_300) & 3;
    float _306 = (*spvDescriptorSet0.vp_c14)._m0[int(_302)][_304];
    int _308 = int(_300) + 1;
    uint _310 = uint(int(uint(_308) >> uint(2)));
    int _312 = _308 & 3;
    float _314 = (*spvDescriptorSet0.vp_c14)._m0[int(_310)][_312];
    float _316 = _289;
    if (_215)
    {
        _287 = (*spvDescriptorSet0.vp_c14)._m0[282].z;
    }
    float _318 = _287;
    float _320 = _293 + 1.0;
    float _322 = _318;
    if (_227)
    {
        _316 = (*spvDescriptorSet0.vp_c14)._m0[283].x;
    }
    float _324 = _316;
    bool _326 = _67 == 336;
    float _328 = _324;
    if (_227)
    {
        _322 = (*spvDescriptorSet0.vp_c14)._m0[283].z;
    }
    float _330 = _322;
    float _332 = exp2(_320);
    float _334 = _330;
    if (_241)
    {
        _328 = (*spvDescriptorSet0.vp_c14)._m0[284].x;
    }
    float _336 = _328;
    bool _338 = _67 == 352;
    float _340 = _336;
    if (_241)
    {
        _334 = (*spvDescriptorSet0.vp_c14)._m0[284].z;
    }
    float _342 = _334;
    float _344 = _342;
    if (_251)
    {
        _340 = (*spvDescriptorSet0.vp_c14)._m0[285].x;
    }
    float _346 = _340;
    bool _348 = _67 == 368;
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
    bool _358 = _67 == 384;
    float _360 = 1.0 / _332;
    float _362 = _356;
    float _364 = _332;
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
    bool _372 = _67 == 400;
    float _374 = _370;
    if (_269)
    {
        _368 = (*spvDescriptorSet0.vp_c14)._m0[287].z;
    }
    float _376 = _368;
    bool _378 = _67 == 416;
    float _380 = _376;
    if (_295)
    {
        _374 = (*spvDescriptorSet0.vp_c14)._m0[288].x;
    }
    float _382 = _374;
    float _384 = _382;
    if (_295)
    {
        _380 = (*spvDescriptorSet0.vp_c14)._m0[288].z;
    }
    float _386 = _380;
    float _388 = _386;
    if (_326)
    {
        _384 = (*spvDescriptorSet0.vp_c14)._m0[289].x;
    }
    float _390 = _384;
    bool _392 = _67 == 432;
    float _394 = _390;
    if (_326)
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
    bool _402 = _67 == 448;
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
    bool _412 = _67 == 464;
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
    bool _422 = _67 == 480;
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
    bool _432 = _67 == 496;
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
    bool _442 = _67 == 512;
    float _444 = _440;
    if (_378)
    {
        _438 = (*spvDescriptorSet0.vp_c14)._m0[294].z;
    }
    float _446 = _438;
    bool _448 = _67 == 528;
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
    bool _462 = _67 == 544;
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
    bool _472 = _67 == 560;
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
    bool _482 = _67 == 576;
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
    bool _492 = _67 == 592;
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
    bool _502 = _67 == 608;
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
    bool _512 = _67 == 624;
    float _514 = _510;
    if (_448)
    {
        _508 = (*spvDescriptorSet0.vp_c14)._m0[301].z;
    }
    float _516 = _508;
    bool _518 = _67 == 640;
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
    bool _532 = _67 == 656;
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
    bool _542 = _67 == 672;
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
    bool _552 = _67 == 688;
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
    bool _562 = _67 == 704;
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
    bool _572 = _67 == 720;
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
    bool _582 = _67 == 736;
    float _584 = _580;
    if (_518)
    {
        _578 = (*spvDescriptorSet0.vp_c14)._m0[308].z;
    }
    float _586 = _578;
    bool _588 = _67 == 752;
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
    float _626 = _618 * _56;
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
    float _654 = _332 * _648;
    float _656 = _652;
    if (!_95)
    {
        _364 = (*spvDescriptorSet0.vp_c15)._m0[6].x;
    }
    float _658 = _364;
    float _660 = _652 * 2.0;
    float _662 = -_652;
    float _664 = fma(_654, _662, _56);
    float _666 = floor(_660);
    float _668 = _654 * _666;
    float _670 = _668 * 0.5;
    float _672 = _670 + _664;
    float _674 = fma(_62, _672, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _676 = fma(_672, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _678 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _680 = _674 + _678;
    float _682 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _684 = _676 + _682;
    float _686 = _680 * _680;
    float _688 = fma(_684, _684, _686);
    float _690 = fma(_125, _125, _688);
    float _692 = _690;
    float _694 = _658;
    if (!_95)
    {
        float _696 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, _143, (*spvDescriptorSet0.vp_c15)._m0[5].w);
        _129 = _696;
    }
    float _698 = _129;
    float _700 = sqrt(_690);
    float _702 = _698;
    if (!_95)
    {
        float _704 = fma(_698, _658, (*spvDescriptorSet0.vp_c15)._m0[6].w);
        _702 = _704;
    }
    float _706 = _702;
    float _708 = _706;
    if (!_95)
    {
        float _710 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _706);
        _708 = _710;
    }
    float _712 = _708;
    float _714 = -_314;
    float _716 = fma(_700, _306, _714);
    float _718 = precise::clamp(_716, 0.0, 1.0);
    float _720 = -_670;
    float _722 = fma(_720, _718, _672);
    float _724 = fma(_722, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    if (!_95)
    {
        float _726 = fma(_724, _143, (*spvDescriptorSet0.vp_c15)._m0[5].z);
        _145 = _726;
    }
    float _728 = _145;
    float _730 = _728;
    if (!_95)
    {
        float _732 = fma(_728, _658, (*spvDescriptorSet0.vp_c15)._m0[6].z);
        _730 = _732;
    }
    float _734 = _730;
    float _736 = _734;
    if (!_95)
    {
        float _738 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _734);
        _692 = _738;
    }
    float _740 = _692;
    if (!_95)
    {
        float2 _2148 = float2(_740, _712);
        float _742 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2148, float2(0.0), isnan(_2148)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2148, float2(0.0), isnan(_2148)), level(0.0)).x;
        _736 = _742;
    }
    float _744 = _736;
    if (_95)
    {
        _283 = (*spvDescriptorSet0.vp_c15)._m0[14].x;
    }
    float _746 = _283;
    float _748 = _746;
    if (_95)
    {
        _656 = (*spvDescriptorSet0.vp_c15)._m0[15].x;
    }
    float _750 = _656;
    if (_95)
    {
        float _752 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, _746, (*spvDescriptorSet0.vp_c15)._m0[14].w);
        _694 = _752;
    }
    float _754 = _694;
    float _756 = _754;
    if (_95)
    {
        float _758 = fma(_724, _746, (*spvDescriptorSet0.vp_c15)._m0[14].z);
        _748 = _758;
    }
    float _760 = _748;
    float _762 = _760;
    if (_95)
    {
        float _764 = fma(_754, _750, (*spvDescriptorSet0.vp_c15)._m0[15].w);
        _756 = _764;
    }
    float _766 = _756;
    float _768 = _766;
    if (_95)
    {
        float _770 = fma(_760, _750, (*spvDescriptorSet0.vp_c15)._m0[15].z);
        _762 = _770;
    }
    float _772 = _762;
    float _774 = _772;
    if (_95)
    {
        float _776 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _766);
        _768 = _776;
    }
    float _778 = _768;
    float _780 = _778;
    if (_95)
    {
        float _782 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _772);
        _774 = _782;
    }
    float _784 = _774;
    float _786 = _744;
    float _788 = _784;
    if (_95)
    {
        float2 _2243 = float2(_784, _778);
        float _790 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_2243, float2(0.0), isnan(_2243)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_2243, float2(0.0), isnan(_2243)), level(0.0)).x;
        _786 = _790;
    }
    float _792 = _786;
    float _794 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _796 = (*spvDescriptorSet0.vp_c15)._m0[0].w + _794;
    float _798 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _800 = _724 + _798;
    float _802 = _796 * _796;
    float _804 = fma(_800, _800, _802);
    float _806 = sqrt(_804);
    bool _808 = _806 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _810 = (*spvDescriptorSet0.vp_c14)._m0[0].y;
    if (!_808)
    {
        _788 = _724;
    }
    float _812 = _788;
    float _814 = fma(_792, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _816 = _814 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _818 = _812;
    if (!_808)
    {
        _810 = _814;
    }
    float _820 = _810;
    float _822 = fma(_724, (*spvDescriptorSet0.vp_c4)._m0[2].x, _816);
    float _824 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, (*spvDescriptorSet0.vp_c4)._m0[2].z, _822);
    float _826 = _824 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _828 = _824;
    float _830 = _820;
    if (!_808)
    {
        _828 = (*spvDescriptorSet0.vp_c15)._m0[0].w;
    }
    float _832 = _828;
    float _834 = _832;
    if (!_808)
    {
        _780 = _826;
    }
    float _836 = _780;
    bool _838 = !_808;
    float _840 = _836;
    if (!_838)
    {
        float _842 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _844 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _846 = _806 + _844;
        float _848 = _814 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _850 = _846 * _842;
        float _852 = rsqrt(_804);
        float _854 = _850 * 0.15915493667125701904296875;
        float _856 = _854 * 6.283185482025146484375;
        float _858 = cos(_856);
        float _860 = _854 * 6.283185482025146484375;
        float _862 = sin(_860);
        float _864 = _858 + (-1.0);
        float _866 = fma(_862, _848, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _868 = _864 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _870 = _852 * _866;
        float _872 = fma(_814, _858, _868);
        float _874 = fma(_800, _870, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _876 = _872 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _878 = fma(_796, _870, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _880 = fma(_874, (*spvDescriptorSet0.vp_c4)._m0[2].x, _876);
        float _882 = fma(_878, (*spvDescriptorSet0.vp_c4)._m0[2].z, _880);
        float _884 = _882 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _830 = _872;
        _818 = _874;
        _834 = _878;
        _840 = _884;
    }
    float _886 = _830;
    float _888 = _818;
    float _890 = _834;
    float _892 = _840;
    float _894 = _886 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _896 = _886 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    out.m_40.x = _724;
    out.m_40.y = _814;
    out.m_40.z = (*spvDescriptorSet0.vp_c15)._m0[0].w;
    float _898 = fma(_888, (*spvDescriptorSet0.vp_c4)._m0[1].x, _894);
    float _900 = fma(_888, (*spvDescriptorSet0.vp_c4)._m0[0].x, _896);
    out.m_42.w = _826;
    float _902 = fma(_890, (*spvDescriptorSet0.vp_c4)._m0[1].z, _898);
    float _904 = fma(_890, (*spvDescriptorSet0.vp_c4)._m0[0].z, _900);
    float _906 = _902 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _908 = _904 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _910 = _906 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _912 = _906 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _914 = _906 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _916 = _906 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _918 = fma(_908, (*spvDescriptorSet0.vp_c4)._m0[9].x, _910);
    float _920 = fma(_908, (*spvDescriptorSet0.vp_c4)._m0[7].x, _912);
    float _922 = fma(_908, (*spvDescriptorSet0.vp_c4)._m0[8].x, _914);
    float _924 = fma(_908, (*spvDescriptorSet0.vp_c4)._m0[10].x, _916);
    float _926 = fma(_892, (*spvDescriptorSet0.vp_c4)._m0[9].z, _918);
    float _928 = fma(_892, (*spvDescriptorSet0.vp_c4)._m0[7].z, _920);
    float _930 = fma(_892, (*spvDescriptorSet0.vp_c4)._m0[8].z, _922);
    float _932 = fma(_892, (*spvDescriptorSet0.vp_c4)._m0[10].z, _924);
    float _934 = _926 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _936 = _928 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _938 = _930 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _940 = _932 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.gl_Position.x = _936;
    out.gl_Position.y = _938;
    out.gl_Position.z = _934;
    out.gl_Position.w = _940;
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
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _56 = in.m_37.x;
    float _58 = in.m_37.y;
    float _60 = -(*spvDescriptorSet0.vp_c15)._m0[3].x;
    float _62 = _60 + (*spvDescriptorSet0.vp_c15)._m0[3].y;
    int _65 = 16 + as_type<int>(as_type<float>(gl_BaseInstance));
    int _67 = _65 << 4;
    bool _71 = _67 == 0;
    bool _73 = _67 == 16;
    bool _75 = _67 == 32;
    bool _77 = _67 == 48;
    bool _79 = _67 == 64;
    float _81 = fma(_62, _56, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _83 = fma(_56, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    bool _85 = _67 == 80;
    bool _87 = _58 >= 0.5;
    bool _89 = isnan(_58);
    bool _91 = _87 || _89;
    bool _93 = isnan(0.5);
    bool _95 = _91 || _93;
    float _97 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _99 = _81 + _97;
    float _101 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _103 = _83 + _101;
    float _105 = as_type<float>(gl_BaseInstance);
    float _107 = _58;
    if (_71)
    {
        _105 = (*spvDescriptorSet0.vp_c14)._m0[268].x;
    }
    float _109 = _105;
    float _111 = _99 * _99;
    bool _113 = _67 == 96;
    float _115 = 0.0;
    float _117 = _109;
    if (_71)
    {
        _115 = (*spvDescriptorSet0.vp_c14)._m0[268].z;
    }
    float _119 = _115;
    float _121 = fma(_103, _103, _111);
    float _123 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _125 = (*spvDescriptorSet0.vp_c15)._m0[0].w + _123;
    float _127 = _119;
    float _129 = _125;
    if (_73)
    {
        _117 = (*spvDescriptorSet0.vp_c14)._m0[269].x;
    }
    float _131 = _117;
    bool _133 = _67 == 112;
    float _135 = fma(_125, _125, _121);
    float _137 = _131;
    if (_73)
    {
        _127 = (*spvDescriptorSet0.vp_c14)._m0[269].z;
    }
    float _139 = _127;
    float _141 = _139;
    if (!_95)
    {
        _107 = (*spvDescriptorSet0.vp_c15)._m0[5].x;
    }
    float _143 = _107;
    float _145 = _143;
    if (_75)
    {
        _137 = (*spvDescriptorSet0.vp_c14)._m0[270].x;
    }
    float _147 = _137;
    bool _149 = _67 == 128;
    float _151 = rsqrt(_135);
    float _153 = _147;
    if (_75)
    {
        _141 = (*spvDescriptorSet0.vp_c14)._m0[270].z;
    }
    float _155 = _141;
    float _157 = _155;
    if (_77)
    {
        _153 = (*spvDescriptorSet0.vp_c14)._m0[271].x;
    }
    float _159 = _153;
    bool _161 = _67 == 144;
    float _163 = _159;
    if (_77)
    {
        _157 = (*spvDescriptorSet0.vp_c14)._m0[271].z;
    }
    float _165 = _157;
    float _167 = _165;
    if (_79)
    {
        _163 = (*spvDescriptorSet0.vp_c14)._m0[272].x;
    }
    float _169 = _163;
    bool _171 = _67 == 160;
    float _173 = _169;
    if (_79)
    {
        _167 = (*spvDescriptorSet0.vp_c14)._m0[272].z;
    }
    float _175 = _167;
    float _177 = _175;
    if (_85)
    {
        _173 = (*spvDescriptorSet0.vp_c14)._m0[273].x;
    }
    float _179 = _173;
    float _181 = _151 * (*spvDescriptorSet0.vp_c14)._m0[268].x;
    bool _183 = _67 == 176;
    float _185 = _179;
    if (_85)
    {
        _177 = (*spvDescriptorSet0.vp_c14)._m0[273].z;
    }
    float _187 = _177;
    bool _189 = _67 == 192;
    float _191 = log2(_181);
    float _193 = _187;
    if (_113)
    {
        _185 = (*spvDescriptorSet0.vp_c14)._m0[274].x;
    }
    float _195 = _185;
    float _197 = _195;
    if (_113)
    {
        _193 = (*spvDescriptorSet0.vp_c14)._m0[274].z;
    }
    float _199 = _193;
    float _201 = _199;
    if (_133)
    {
        _197 = (*spvDescriptorSet0.vp_c14)._m0[275].x;
    }
    float _203 = _197;
    bool _205 = _67 == 208;
    float _207 = _203;
    if (_133)
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
    bool _215 = _67 == 224;
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
    bool _227 = _67 == 240;
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
    bool _241 = _67 == 256;
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
    bool _251 = _67 == 272;
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
    bool _261 = _67 == 288;
    int _263 = min(_235, 15);
    float _265 = _259;
    if (_189)
    {
        _257 = (*spvDescriptorSet0.vp_c14)._m0[280].z;
    }
    float _267 = _257;
    bool _269 = _67 == 304;
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
    float _283 = as_type<float>(_279);
    if (_205)
    {
        _273 = (*spvDescriptorSet0.vp_c14)._m0[281].z;
    }
    float _285 = _273;
    float _287 = _285;
    if (_215)
    {
        _281 = (*spvDescriptorSet0.vp_c14)._m0[282].x;
    }
    float _289 = _281;
    float _291 = -_271;
    float _293 = _291 + (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _295 = _67 == 320;
    int _297 = _279 + 8;
    uint _300 = uint(int(uint(_297) >> uint(2)));
    uint _302 = uint(int(uint(int(_300)) >> uint(2)));
    int _304 = int(_300) & 3;
    float _306 = (*spvDescriptorSet0.vp_c14)._m0[int(_302)][_304];
    int _308 = int(_300) + 1;
    uint _310 = uint(int(uint(_308) >> uint(2)));
    int _312 = _308 & 3;
    float _314 = (*spvDescriptorSet0.vp_c14)._m0[int(_310)][_312];
    float _316 = _289;
    if (_215)
    {
        _287 = (*spvDescriptorSet0.vp_c14)._m0[282].z;
    }
    float _318 = _287;
    float _320 = _293 + 1.0;
    float _322 = _318;
    if (_227)
    {
        _316 = (*spvDescriptorSet0.vp_c14)._m0[283].x;
    }
    float _324 = _316;
    bool _326 = _67 == 336;
    float _328 = _324;
    if (_227)
    {
        _322 = (*spvDescriptorSet0.vp_c14)._m0[283].z;
    }
    float _330 = _322;
    float _332 = exp2(_320);
    float _334 = _330;
    if (_241)
    {
        _328 = (*spvDescriptorSet0.vp_c14)._m0[284].x;
    }
    float _336 = _328;
    bool _338 = _67 == 352;
    float _340 = _336;
    if (_241)
    {
        _334 = (*spvDescriptorSet0.vp_c14)._m0[284].z;
    }
    float _342 = _334;
    float _344 = _342;
    if (_251)
    {
        _340 = (*spvDescriptorSet0.vp_c14)._m0[285].x;
    }
    float _346 = _340;
    bool _348 = _67 == 368;
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
    bool _358 = _67 == 384;
    float _360 = 1.0 / _332;
    float _362 = _356;
    float _364 = _332;
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
    bool _372 = _67 == 400;
    float _374 = _370;
    if (_269)
    {
        _368 = (*spvDescriptorSet0.vp_c14)._m0[287].z;
    }
    float _376 = _368;
    bool _378 = _67 == 416;
    float _380 = _376;
    if (_295)
    {
        _374 = (*spvDescriptorSet0.vp_c14)._m0[288].x;
    }
    float _382 = _374;
    float _384 = _382;
    if (_295)
    {
        _380 = (*spvDescriptorSet0.vp_c14)._m0[288].z;
    }
    float _386 = _380;
    float _388 = _386;
    if (_326)
    {
        _384 = (*spvDescriptorSet0.vp_c14)._m0[289].x;
    }
    float _390 = _384;
    bool _392 = _67 == 432;
    float _394 = _390;
    if (_326)
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
    bool _402 = _67 == 448;
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
    bool _412 = _67 == 464;
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
    bool _422 = _67 == 480;
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
    bool _432 = _67 == 496;
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
    bool _442 = _67 == 512;
    float _444 = _440;
    if (_378)
    {
        _438 = (*spvDescriptorSet0.vp_c14)._m0[294].z;
    }
    float _446 = _438;
    bool _448 = _67 == 528;
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
    bool _462 = _67 == 544;
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
    bool _472 = _67 == 560;
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
    bool _482 = _67 == 576;
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
    bool _492 = _67 == 592;
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
    bool _502 = _67 == 608;
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
    bool _512 = _67 == 624;
    float _514 = _510;
    if (_448)
    {
        _508 = (*spvDescriptorSet0.vp_c14)._m0[301].z;
    }
    float _516 = _508;
    bool _518 = _67 == 640;
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
    bool _532 = _67 == 656;
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
    bool _542 = _67 == 672;
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
    bool _552 = _67 == 688;
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
    bool _562 = _67 == 704;
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
    bool _572 = _67 == 720;
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
    bool _582 = _67 == 736;
    float _584 = _580;
    if (_518)
    {
        _578 = (*spvDescriptorSet0.vp_c14)._m0[308].z;
    }
    float _586 = _578;
    bool _588 = _67 == 752;
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
    float _626 = _618 * _56;
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
    float _654 = _332 * _648;
    float _656 = _652;
    if (!_95)
    {
        _364 = (*spvDescriptorSet0.vp_c15)._m0[6].x;
    }
    float _658 = _364;
    float _660 = _652 * 2.0;
    float _662 = -_652;
    float _664 = fma(_654, _662, _56);
    float _666 = floor(_660);
    float _668 = _654 * _666;
    float _670 = _668 * 0.5;
    float _672 = _670 + _664;
    float _674 = fma(_62, _672, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _676 = fma(_672, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _678 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _680 = _674 + _678;
    float _682 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _684 = _676 + _682;
    float _686 = _680 * _680;
    float _688 = fma(_684, _684, _686);
    float _690 = fma(_125, _125, _688);
    float _692 = _690;
    float _694 = _658;
    if (!_95)
    {
        float _696 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, _143, (*spvDescriptorSet0.vp_c15)._m0[5].w);
        _129 = _696;
    }
    float _698 = _129;
    float _700 = sqrt(_690);
    float _702 = _698;
    if (!_95)
    {
        float _704 = fma(_698, _658, (*spvDescriptorSet0.vp_c15)._m0[6].w);
        _702 = _704;
    }
    float _706 = _702;
    float _708 = _706;
    if (!_95)
    {
        float _710 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _706);
        _708 = _710;
    }
    float _712 = _708;
    float _714 = -_314;
    float _716 = fma(_700, _306, _714);
    float _718 = precise::clamp(_716, 0.0, 1.0);
    float _720 = -_670;
    float _722 = fma(_720, _718, _672);
    float _724 = fma(_722, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    if (!_95)
    {
        float _726 = fma(_724, _143, (*spvDescriptorSet0.vp_c15)._m0[5].z);
        _145 = _726;
    }
    float _728 = _145;
    float _730 = _728;
    if (!_95)
    {
        float _732 = fma(_728, _658, (*spvDescriptorSet0.vp_c15)._m0[6].z);
        _730 = _732;
    }
    float _734 = _730;
    float _736 = _734;
    if (!_95)
    {
        float _738 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _734);
        _692 = _738;
    }
    float _740 = _692;
    if (!_95)
    {
        float2 _2148 = float2(_740, _712);
        float _742 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2148, float2(0.0), isnan(_2148)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2148, float2(0.0), isnan(_2148)), level(0.0)).x;
        _736 = _742;
    }
    float _744 = _736;
    if (_95)
    {
        _283 = (*spvDescriptorSet0.vp_c15)._m0[14].x;
    }
    float _746 = _283;
    float _748 = _746;
    if (_95)
    {
        _656 = (*spvDescriptorSet0.vp_c15)._m0[15].x;
    }
    float _750 = _656;
    if (_95)
    {
        float _752 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, _746, (*spvDescriptorSet0.vp_c15)._m0[14].w);
        _694 = _752;
    }
    float _754 = _694;
    float _756 = _754;
    if (_95)
    {
        float _758 = fma(_724, _746, (*spvDescriptorSet0.vp_c15)._m0[14].z);
        _748 = _758;
    }
    float _760 = _748;
    float _762 = _760;
    if (_95)
    {
        float _764 = fma(_754, _750, (*spvDescriptorSet0.vp_c15)._m0[15].w);
        _756 = _764;
    }
    float _766 = _756;
    float _768 = _766;
    if (_95)
    {
        float _770 = fma(_760, _750, (*spvDescriptorSet0.vp_c15)._m0[15].z);
        _762 = _770;
    }
    float _772 = _762;
    float _774 = _772;
    if (_95)
    {
        float _776 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _766);
        _768 = _776;
    }
    float _778 = _768;
    float _780 = _778;
    if (_95)
    {
        float _782 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _772);
        _774 = _782;
    }
    float _784 = _774;
    float _786 = _744;
    float _788 = _784;
    if (_95)
    {
        float2 _2243 = float2(_784, _778);
        float _790 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_2243, float2(0.0), isnan(_2243)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_2243, float2(0.0), isnan(_2243)), level(0.0)).x;
        _786 = _790;
    }
    float _792 = _786;
    float _794 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _796 = (*spvDescriptorSet0.vp_c15)._m0[0].w + _794;
    float _798 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _800 = _724 + _798;
    float _802 = _796 * _796;
    float _804 = fma(_800, _800, _802);
    float _806 = sqrt(_804);
    bool _808 = _806 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _810 = (*spvDescriptorSet0.vp_c14)._m0[0].y;
    if (!_808)
    {
        _788 = _724;
    }
    float _812 = _788;
    float _814 = fma(_792, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _816 = _814 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _818 = _812;
    if (!_808)
    {
        _810 = _814;
    }
    float _820 = _810;
    float _822 = fma(_724, (*spvDescriptorSet0.vp_c4)._m0[2].x, _816);
    float _824 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, (*spvDescriptorSet0.vp_c4)._m0[2].z, _822);
    float _826 = _824 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _828 = _824;
    float _830 = _820;
    if (!_808)
    {
        _828 = (*spvDescriptorSet0.vp_c15)._m0[0].w;
    }
    float _832 = _828;
    float _834 = _832;
    if (!_808)
    {
        _780 = _826;
    }
    float _836 = _780;
    bool _838 = !_808;
    float _840 = _836;
    if (!_838)
    {
        float _842 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _844 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _846 = _806 + _844;
        float _848 = _814 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _850 = _846 * _842;
        float _852 = rsqrt(_804);
        float _854 = _850 * 0.15915493667125701904296875;
        float _856 = _854 * 6.283185482025146484375;
        float _858 = cos(_856);
        float _860 = _854 * 6.283185482025146484375;
        float _862 = sin(_860);
        float _864 = _858 + (-1.0);
        float _866 = fma(_862, _848, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _868 = _864 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _870 = _852 * _866;
        float _872 = fma(_814, _858, _868);
        float _874 = fma(_800, _870, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _876 = _872 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _878 = fma(_796, _870, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _880 = fma(_874, (*spvDescriptorSet0.vp_c4)._m0[2].x, _876);
        float _882 = fma(_878, (*spvDescriptorSet0.vp_c4)._m0[2].z, _880);
        float _884 = _882 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _830 = _872;
        _818 = _874;
        _834 = _878;
        _840 = _884;
    }
    float _886 = _830;
    float _888 = _818;
    float _890 = _834;
    float _892 = _840;
    float _894 = _886 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _896 = _886 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    out.m_40.x = _724;
    out.m_40.y = _814;
    out.m_40.z = (*spvDescriptorSet0.vp_c15)._m0[0].w;
    float _898 = fma(_888, (*spvDescriptorSet0.vp_c4)._m0[1].x, _894);
    float _900 = fma(_888, (*spvDescriptorSet0.vp_c4)._m0[0].x, _896);
    out.m_42.w = _826;
    float _902 = fma(_890, (*spvDescriptorSet0.vp_c4)._m0[1].z, _898);
    float _904 = fma(_890, (*spvDescriptorSet0.vp_c4)._m0[0].z, _900);
    float _906 = _902 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _908 = _904 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _910 = _906 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _912 = _906 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _914 = _906 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _916 = _906 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _918 = fma(_908, (*spvDescriptorSet0.vp_c4)._m0[9].x, _910);
    float _920 = fma(_908, (*spvDescriptorSet0.vp_c4)._m0[7].x, _912);
    float _922 = fma(_908, (*spvDescriptorSet0.vp_c4)._m0[8].x, _914);
    float _924 = fma(_908, (*spvDescriptorSet0.vp_c4)._m0[10].x, _916);
    float _926 = fma(_892, (*spvDescriptorSet0.vp_c4)._m0[9].z, _918);
    float _928 = fma(_892, (*spvDescriptorSet0.vp_c4)._m0[7].z, _920);
    float _930 = fma(_892, (*spvDescriptorSet0.vp_c4)._m0[8].z, _922);
    float _932 = fma(_892, (*spvDescriptorSet0.vp_c4)._m0[10].z, _924);
    float _934 = _926 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _936 = _928 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _938 = _930 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _940 = _932 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.gl_Position.x = _936;
    out.gl_Position.y = _938;
    out.gl_Position.z = _934;
    out.gl_Position.w = _940;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, 0u); dm_cw(dm_gs, dm_p, 17, 0u); dm_cw(dm_gs, dm_p, 18, 0u); dm_cw(dm_gs, dm_p, 19, 0x3f800000u); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_40.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_40.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_40.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_40.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

