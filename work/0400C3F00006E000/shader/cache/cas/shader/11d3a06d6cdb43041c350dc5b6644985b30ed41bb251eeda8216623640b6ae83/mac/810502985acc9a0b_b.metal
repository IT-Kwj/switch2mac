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
    float _68 = _66 + (*spvDescriptorSet0.vp_c15)._m0[3].z;
    int _71 = 16 + as_type<int>(as_type<float>(gl_BaseInstance));
    float _73 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _75 = (*spvDescriptorSet0.vp_c15)._m0[0].z + _73;
    int _77 = _71 << 4;
    bool _81 = _77 == 0;
    bool _83 = _77 == 16;
    bool _85 = _77 == 32;
    bool _87 = _77 == 48;
    bool _89 = _77 == 64;
    float _91 = fma(_68, _64, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    bool _93 = _77 == 80;
    bool _95 = _62 >= 0.5;
    bool _97 = isnan(_62);
    bool _99 = _95 || _97;
    bool _101 = isnan(0.5);
    bool _103 = _99 || _101;
    float _105 = as_type<float>(gl_BaseInstance);
    float _107 = _62;
    if (_81)
    {
        _105 = (*spvDescriptorSet0.vp_c14)._m0[268].x;
    }
    float _109 = _105;
    float _111 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _113 = _91 + _111;
    float _115 = fma(_64, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    bool _117 = _77 == 96;
    float _119 = _113 * _113;
    float _121 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _123 = _115 + _121;
    float _125 = 0.0;
    float _127 = _109;
    if (_81)
    {
        _125 = (*spvDescriptorSet0.vp_c14)._m0[268].z;
    }
    float _129 = _125;
    float _131 = fma(_75, _75, _119);
    float _133 = _129;
    if (_83)
    {
        _127 = (*spvDescriptorSet0.vp_c14)._m0[269].x;
    }
    float _135 = _127;
    bool _137 = _77 == 112;
    float _139 = fma(_123, _123, _131);
    float _141 = _135;
    if (_83)
    {
        _133 = (*spvDescriptorSet0.vp_c14)._m0[269].z;
    }
    float _143 = _133;
    float _145 = _143;
    if (_85)
    {
        _141 = (*spvDescriptorSet0.vp_c14)._m0[270].x;
    }
    float _147 = _141;
    float _149 = rsqrt(_139);
    bool _151 = _77 == 128;
    float _153 = _147;
    if (_85)
    {
        _145 = (*spvDescriptorSet0.vp_c14)._m0[270].z;
    }
    float _155 = _145;
    float _157 = _155;
    if (_87)
    {
        _153 = (*spvDescriptorSet0.vp_c14)._m0[271].x;
    }
    float _159 = _153;
    bool _161 = _77 == 144;
    float _163 = _159;
    if (_87)
    {
        _157 = (*spvDescriptorSet0.vp_c14)._m0[271].z;
    }
    float _165 = _157;
    float _167 = _165;
    if (_89)
    {
        _163 = (*spvDescriptorSet0.vp_c14)._m0[272].x;
    }
    float _169 = _163;
    bool _171 = _77 == 160;
    float _173 = _169;
    if (_89)
    {
        _167 = (*spvDescriptorSet0.vp_c14)._m0[272].z;
    }
    float _175 = _167;
    float _177 = _149 * (*spvDescriptorSet0.vp_c14)._m0[268].x;
    float _179 = _175;
    if (_93)
    {
        _173 = (*spvDescriptorSet0.vp_c14)._m0[273].x;
    }
    float _181 = _173;
    bool _183 = _77 == 176;
    float _185 = _181;
    if (_93)
    {
        _179 = (*spvDescriptorSet0.vp_c14)._m0[273].z;
    }
    float _187 = _179;
    float _189 = log2(_177);
    bool _191 = _77 == 192;
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
    bool _205 = _77 == 208;
    float _207 = _203;
    if (_137)
    {
        _201 = (*spvDescriptorSet0.vp_c14)._m0[275].z;
    }
    float _209 = _201;
    float _211 = _209;
    if (_151)
    {
        _207 = (*spvDescriptorSet0.vp_c14)._m0[276].x;
    }
    float _213 = _207;
    bool _215 = _77 == 224;
    float _217 = _189 + 1.2999999523162841796875;
    float _219 = _213;
    if (_151)
    {
        _211 = (*spvDescriptorSet0.vp_c14)._m0[276].z;
    }
    float _221 = _211;
    float _223 = _221;
    if (_161)
    {
        _219 = (*spvDescriptorSet0.vp_c14)._m0[277].x;
    }
    float _225 = _219;
    bool _227 = _77 == 240;
    float _229 = trunc(_217);
    int _231 = int(_229);
    float _233 = _225;
    if (_161)
    {
        _223 = (*spvDescriptorSet0.vp_c14)._m0[277].z;
    }
    float _235 = _223;
    float _237 = _235;
    if (_171)
    {
        _233 = (*spvDescriptorSet0.vp_c14)._m0[278].x;
    }
    float _239 = _233;
    bool _241 = _77 == 256;
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
    bool _251 = _77 == 272;
    float _253 = _249;
    if (_183)
    {
        _247 = (*spvDescriptorSet0.vp_c14)._m0[279].z;
    }
    float _255 = _247;
    float _257 = _255;
    if (_191)
    {
        _253 = (*spvDescriptorSet0.vp_c14)._m0[280].x;
    }
    float _259 = _253;
    int _261 = min(_231, 15);
    bool _263 = _77 == 288;
    float _265 = _259;
    if (_191)
    {
        _257 = (*spvDescriptorSet0.vp_c14)._m0[280].z;
    }
    float _267 = _257;
    float _269 = float(_261);
    bool _271 = _77 == 304;
    int _273 = _261 << 4;
    int _275 = _273 + 4288;
    float _277 = _267;
    float _279 = as_type<float>(_275);
    if (_205)
    {
        _265 = (*spvDescriptorSet0.vp_c14)._m0[281].x;
    }
    float _281 = _265;
    float _283 = _281;
    if (_205)
    {
        _277 = (*spvDescriptorSet0.vp_c14)._m0[281].z;
    }
    float _285 = _277;
    float _287 = -_269;
    float _289 = _287 + (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _291 = _285;
    if (_215)
    {
        _283 = (*spvDescriptorSet0.vp_c14)._m0[282].x;
    }
    float _293 = _283;
    int _295 = _275 + 8;
    uint _298 = uint(int(uint(_295) >> uint(2)));
    uint _300 = uint(int(uint(int(_298)) >> uint(2)));
    int _302 = int(_298) & 3;
    float _304 = (*spvDescriptorSet0.vp_c14)._m0[int(_300)][_302];
    int _306 = int(_298) + 1;
    uint _308 = uint(int(uint(_306) >> uint(2)));
    int _310 = _306 & 3;
    float _312 = (*spvDescriptorSet0.vp_c14)._m0[int(_308)][_310];
    bool _314 = _77 == 320;
    float _316 = _289 + 1.0;
    float _318 = _293;
    if (_215)
    {
        _291 = (*spvDescriptorSet0.vp_c14)._m0[282].z;
    }
    float _320 = _291;
    float _322 = _320;
    if (_227)
    {
        _318 = (*spvDescriptorSet0.vp_c14)._m0[283].x;
    }
    float _324 = _318;
    bool _326 = _77 == 336;
    float _328 = exp2(_316);
    float _330 = _324;
    if (_227)
    {
        _322 = (*spvDescriptorSet0.vp_c14)._m0[283].z;
    }
    float _332 = _322;
    float _334 = _332;
    if (_241)
    {
        _330 = (*spvDescriptorSet0.vp_c14)._m0[284].x;
    }
    float _336 = _330;
    bool _338 = _77 == 352;
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
    bool _348 = _77 == 368;
    float _350 = _346;
    if (_251)
    {
        _344 = (*spvDescriptorSet0.vp_c14)._m0[285].z;
    }
    float _352 = _344;
    float _354 = _352;
    if (_263)
    {
        _350 = (*spvDescriptorSet0.vp_c14)._m0[286].x;
    }
    float _356 = _350;
    float _358 = 1.0 / _328;
    bool _360 = _77 == 384;
    float _362 = _356;
    if (_263)
    {
        _354 = (*spvDescriptorSet0.vp_c14)._m0[286].z;
    }
    float _364 = _354;
    float _366 = _364;
    if (_271)
    {
        _362 = (*spvDescriptorSet0.vp_c14)._m0[287].x;
    }
    float _368 = _362;
    bool _370 = _77 == 400;
    float _372 = _368;
    if (_271)
    {
        _366 = (*spvDescriptorSet0.vp_c14)._m0[287].z;
    }
    float _374 = _366;
    bool _376 = _77 == 416;
    float _378 = _374;
    if (_314)
    {
        _372 = (*spvDescriptorSet0.vp_c14)._m0[288].x;
    }
    float _380 = _372;
    float _382 = _380;
    if (_314)
    {
        _378 = (*spvDescriptorSet0.vp_c14)._m0[288].z;
    }
    float _384 = _378;
    float _386 = _384;
    if (_326)
    {
        _382 = (*spvDescriptorSet0.vp_c14)._m0[289].x;
    }
    float _388 = _382;
    bool _390 = _77 == 432;
    float _392 = _388;
    if (_326)
    {
        _386 = (*spvDescriptorSet0.vp_c14)._m0[289].z;
    }
    float _394 = _386;
    float _396 = _394;
    if (_338)
    {
        _392 = (*spvDescriptorSet0.vp_c14)._m0[290].x;
    }
    float _398 = _392;
    bool _400 = _77 == 448;
    float _402 = _398;
    if (_338)
    {
        _396 = (*spvDescriptorSet0.vp_c14)._m0[290].z;
    }
    float _404 = _396;
    float _406 = _404;
    if (_348)
    {
        _402 = (*spvDescriptorSet0.vp_c14)._m0[291].x;
    }
    float _408 = _402;
    bool _410 = _77 == 464;
    float _412 = _408;
    if (_348)
    {
        _406 = (*spvDescriptorSet0.vp_c14)._m0[291].z;
    }
    float _414 = _406;
    float _416 = _414;
    if (_360)
    {
        _412 = (*spvDescriptorSet0.vp_c14)._m0[292].x;
    }
    float _418 = _412;
    bool _420 = _77 == 480;
    float _422 = _418;
    if (_360)
    {
        _416 = (*spvDescriptorSet0.vp_c14)._m0[292].z;
    }
    float _424 = _416;
    float _426 = _424;
    if (_370)
    {
        _422 = (*spvDescriptorSet0.vp_c14)._m0[293].x;
    }
    float _428 = _422;
    bool _430 = _77 == 496;
    float _432 = _428;
    if (_370)
    {
        _426 = (*spvDescriptorSet0.vp_c14)._m0[293].z;
    }
    float _434 = _426;
    float _436 = _434;
    if (_376)
    {
        _432 = (*spvDescriptorSet0.vp_c14)._m0[294].x;
    }
    float _438 = _432;
    bool _440 = _77 == 512;
    float _442 = _438;
    if (_376)
    {
        _436 = (*spvDescriptorSet0.vp_c14)._m0[294].z;
    }
    float _444 = _436;
    bool _446 = _77 == 528;
    float _448 = _444;
    if (_390)
    {
        _442 = (*spvDescriptorSet0.vp_c14)._m0[295].x;
    }
    float _450 = _442;
    float _452 = _450;
    if (_390)
    {
        _448 = (*spvDescriptorSet0.vp_c14)._m0[295].z;
    }
    float _454 = _448;
    float _456 = _454;
    if (_400)
    {
        _452 = (*spvDescriptorSet0.vp_c14)._m0[296].x;
    }
    float _458 = _452;
    bool _460 = _77 == 544;
    float _462 = _458;
    if (_400)
    {
        _456 = (*spvDescriptorSet0.vp_c14)._m0[296].z;
    }
    float _464 = _456;
    float _466 = _464;
    if (_410)
    {
        _462 = (*spvDescriptorSet0.vp_c14)._m0[297].x;
    }
    float _468 = _462;
    bool _470 = _77 == 560;
    float _472 = _468;
    if (_410)
    {
        _466 = (*spvDescriptorSet0.vp_c14)._m0[297].z;
    }
    float _474 = _466;
    float _476 = _474;
    if (_420)
    {
        _472 = (*spvDescriptorSet0.vp_c14)._m0[298].x;
    }
    float _478 = _472;
    bool _480 = _77 == 576;
    float _482 = _478;
    if (_420)
    {
        _476 = (*spvDescriptorSet0.vp_c14)._m0[298].z;
    }
    float _484 = _476;
    float _486 = _484;
    if (_430)
    {
        _482 = (*spvDescriptorSet0.vp_c14)._m0[299].x;
    }
    float _488 = _482;
    bool _490 = _77 == 592;
    float _492 = _488;
    if (_430)
    {
        _486 = (*spvDescriptorSet0.vp_c14)._m0[299].z;
    }
    float _494 = _486;
    float _496 = _494;
    if (_440)
    {
        _492 = (*spvDescriptorSet0.vp_c14)._m0[300].x;
    }
    float _498 = _492;
    bool _500 = _77 == 608;
    float _502 = _498;
    if (_440)
    {
        _496 = (*spvDescriptorSet0.vp_c14)._m0[300].z;
    }
    float _504 = _496;
    float _506 = _504;
    if (_446)
    {
        _502 = (*spvDescriptorSet0.vp_c14)._m0[301].x;
    }
    float _508 = _502;
    bool _510 = _77 == 624;
    float _512 = _508;
    if (_446)
    {
        _506 = (*spvDescriptorSet0.vp_c14)._m0[301].z;
    }
    float _514 = _506;
    bool _516 = _77 == 640;
    float _518 = _514;
    if (_460)
    {
        _512 = (*spvDescriptorSet0.vp_c14)._m0[302].x;
    }
    float _520 = _512;
    float _522 = _520;
    if (_460)
    {
        _518 = (*spvDescriptorSet0.vp_c14)._m0[302].z;
    }
    float _524 = _518;
    float _526 = _524;
    if (_470)
    {
        _522 = (*spvDescriptorSet0.vp_c14)._m0[303].x;
    }
    float _528 = _522;
    bool _530 = _77 == 656;
    float _532 = _528;
    if (_470)
    {
        _526 = (*spvDescriptorSet0.vp_c14)._m0[303].z;
    }
    float _534 = _526;
    float _536 = _534;
    if (_480)
    {
        _532 = (*spvDescriptorSet0.vp_c14)._m0[304].x;
    }
    float _538 = _532;
    bool _540 = _77 == 672;
    float _542 = _538;
    if (_480)
    {
        _536 = (*spvDescriptorSet0.vp_c14)._m0[304].z;
    }
    float _544 = _536;
    float _546 = _544;
    if (_490)
    {
        _542 = (*spvDescriptorSet0.vp_c14)._m0[305].x;
    }
    float _548 = _542;
    bool _550 = _77 == 688;
    float _552 = _548;
    if (_490)
    {
        _546 = (*spvDescriptorSet0.vp_c14)._m0[305].z;
    }
    float _554 = _546;
    float _556 = _554;
    if (_500)
    {
        _552 = (*spvDescriptorSet0.vp_c14)._m0[306].x;
    }
    float _558 = _552;
    bool _560 = _77 == 704;
    float _562 = _558;
    if (_500)
    {
        _556 = (*spvDescriptorSet0.vp_c14)._m0[306].z;
    }
    float _564 = _556;
    float _566 = _564;
    if (_510)
    {
        _562 = (*spvDescriptorSet0.vp_c14)._m0[307].x;
    }
    float _568 = _562;
    bool _570 = _77 == 720;
    float _572 = _568;
    if (_510)
    {
        _566 = (*spvDescriptorSet0.vp_c14)._m0[307].z;
    }
    float _574 = _566;
    float _576 = _574;
    if (_516)
    {
        _572 = (*spvDescriptorSet0.vp_c14)._m0[308].x;
    }
    float _578 = _572;
    bool _580 = _77 == 736;
    float _582 = _578;
    if (_516)
    {
        _576 = (*spvDescriptorSet0.vp_c14)._m0[308].z;
    }
    float _584 = _576;
    bool _586 = _77 == 752;
    float _588 = _584;
    if (_530)
    {
        _582 = (*spvDescriptorSet0.vp_c14)._m0[309].x;
    }
    float _590 = _582;
    float _592 = _590;
    if (_540)
    {
        _592 = (*spvDescriptorSet0.vp_c14)._m0[310].x;
    }
    float _594 = _592;
    float _596 = _594;
    if (_550)
    {
        _596 = (*spvDescriptorSet0.vp_c14)._m0[311].x;
    }
    float _598 = _596;
    float _600 = _598;
    if (_560)
    {
        _600 = (*spvDescriptorSet0.vp_c14)._m0[312].x;
    }
    float _602 = _600;
    float _604 = _602;
    if (_570)
    {
        _604 = (*spvDescriptorSet0.vp_c14)._m0[313].x;
    }
    float _606 = _604;
    float _608 = _606;
    if (_580)
    {
        _608 = (*spvDescriptorSet0.vp_c14)._m0[314].x;
    }
    float _610 = _608;
    float _612 = _610;
    if (_586)
    {
        _612 = (*spvDescriptorSet0.vp_c14)._m0[315].x;
    }
    float _614 = _612;
    float _616 = _358 * _614;
    if (_530)
    {
        _588 = (*spvDescriptorSet0.vp_c14)._m0[309].z;
    }
    float _618 = _588;
    float _620 = _618;
    if (_540)
    {
        _620 = (*spvDescriptorSet0.vp_c14)._m0[310].z;
    }
    float _622 = _620;
    float _624 = _616 * _64;
    float _626 = _622;
    if (_550)
    {
        _626 = (*spvDescriptorSet0.vp_c14)._m0[311].z;
    }
    float _628 = _626;
    float _630 = _628;
    if (_560)
    {
        _630 = (*spvDescriptorSet0.vp_c14)._m0[312].z;
    }
    float _632 = _630;
    float _634 = floor(_624);
    float _636 = _632;
    if (_570)
    {
        _636 = (*spvDescriptorSet0.vp_c14)._m0[313].z;
    }
    float _638 = _636;
    float _640 = _638;
    if (_580)
    {
        _640 = (*spvDescriptorSet0.vp_c14)._m0[314].z;
    }
    float _642 = _640;
    float _644 = _642;
    if (_586)
    {
        _644 = (*spvDescriptorSet0.vp_c14)._m0[315].z;
    }
    float _646 = _644;
    float _648 = -_634;
    float _650 = _624 + _648;
    float _652 = _328 * _646;
    float _654 = _650 * 2.0;
    float _656 = -_650;
    float _658 = fma(_652, _656, _64);
    float _660 = floor(_654);
    float _662 = _652 * _660;
    float _664 = _662 * 0.5;
    float _666 = _664 + _658;
    float _668 = fma(_68, _666, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _670 = fma(_666, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _672 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _674 = _668 + _672;
    float _676 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _678 = _670 + _676;
    float _680 = _674 * _674;
    float _682 = fma(_75, _75, _680);
    float _684 = fma(_678, _678, _682);
    float _686 = sqrt(_684);
    float _688 = -_312;
    float _690 = fma(_686, _304, _688);
    float _692 = precise::clamp(_690, 0.0, 1.0);
    float _694 = -_664;
    float _696 = fma(_694, _692, _666);
    float _698 = _664;
    float _700 = _684;
    float _702 = _660;
    float _704 = _312;
    float _706 = (*spvDescriptorSet0.vp_c15)._m0[4].x;
    if (!_103)
    {
        _698 = (*spvDescriptorSet0.vp_c15)._m0[6].x;
    }
    float _708 = _698;
    float _710 = fma(_696, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _712 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].z);
    float _714 = fma(_710, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].w);
    float _716 = _708;
    if (!_103)
    {
        float _718 = fma(_712, _708, (*spvDescriptorSet0.vp_c15)._m0[6].z);
        _279 = _718;
    }
    float _720 = _279;
    float _722 = _720;
    if (!_103)
    {
        float _724 = fma(_714, _708, (*spvDescriptorSet0.vp_c15)._m0[6].w);
        _700 = _724;
    }
    float _726 = _700;
    float _728 = _726;
    if (!_103)
    {
        float _730 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _720);
        _722 = _730;
    }
    float _732 = _722;
    float _734 = _732;
    if (!_103)
    {
        float _736 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _726);
        _702 = _736;
    }
    float _738 = _702;
    if (!_103)
    {
        float2 _2149 = float2(_732, _738);
        float _740 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2149, float2(0.0), isnan(_2149)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2149, float2(0.0), isnan(_2149)), level(0.0)).x;
        _728 = _740;
    }
    float _742 = _728;
    float _744 = 0.0;
    if (_103)
    {
        _744 = (*spvDescriptorSet0.vp_c15)._m0[14].x;
    }
    float _746 = _744;
    if (_103)
    {
        _704 = (*spvDescriptorSet0.vp_c15)._m0[15].x;
    }
    float _748 = _704;
    if (_103)
    {
        float _750 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, _746, (*spvDescriptorSet0.vp_c15)._m0[14].z);
        _716 = _750;
    }
    float _752 = _716;
    float _754 = _752;
    if (_103)
    {
        float _756 = fma(_710, _746, (*spvDescriptorSet0.vp_c15)._m0[14].w);
        _107 = _756;
    }
    float _758 = _107;
    float _760 = _758;
    if (_103)
    {
        float _762 = fma(_752, _748, (*spvDescriptorSet0.vp_c15)._m0[15].z);
        _754 = _762;
    }
    float _764 = _754;
    float _766 = _764;
    if (_103)
    {
        float _768 = fma(_758, _748, (*spvDescriptorSet0.vp_c15)._m0[15].w);
        _760 = _768;
    }
    float _770 = _760;
    float _772 = _770;
    if (_103)
    {
        float _774 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _764);
        _766 = _774;
    }
    float _776 = _766;
    if (_103)
    {
        float _778 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _770);
        _706 = _778;
    }
    float _780 = _706;
    float _782 = _742;
    if (_103)
    {
        float2 _2241 = float2(_776, _780);
        float _784 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_2241, float2(0.0), isnan(_2241)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_2241, float2(0.0), isnan(_2241)), level(0.0)).x;
        _782 = _784;
    }
    float _786 = _782;
    float _788 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _790 = _710 + _788;
    float _792 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _794 = (*spvDescriptorSet0.vp_c15)._m0[0].z + _792;
    if (!_103)
    {
        _734 = _712;
    }
    float _796 = _734;
    float _798 = _790 * _790;
    float _800 = _796;
    if (_103)
    {
        _800 = _712;
    }
    float _802 = _800;
    float _804 = fma(_794, _794, _798);
    float _806 = sqrt(_804);
    float _808 = fma(_802, (*spvDescriptorSet0.vp_c15)._m0[8].x, (*spvDescriptorSet0.vp_c15)._m0[8].z);
    float _810 = fma(_714, (*spvDescriptorSet0.vp_c15)._m0[8].x, (*spvDescriptorSet0.vp_c15)._m0[8].w);
    float _812 = fma(_802, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].z);
    float _814 = fma(_714, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].w);
    bool _816 = _806 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _818 = (*spvDescriptorSet0.vp_c15)._m0[7].x;
    float _820 = (*spvDescriptorSet0.vp_c14)._m0[0].y;
    if (!_816)
    {
        _818 = (*spvDescriptorSet0.vp_c15)._m0[0].z;
    }
    float _822 = _818;
    float _824 = fma(_786, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _826 = _824 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _828 = _822;
    if (!_816)
    {
        _820 = _824;
    }
    float _830 = _820;
    float _832 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[2].x, _826);
    float _834 = fma(_710, (*spvDescriptorSet0.vp_c4)._m0[2].z, _832);
    float _836 = _834 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _838 = _834;
    float _840 = _830;
    if (!_816)
    {
        _838 = _710;
    }
    float _842 = _838;
    float _844 = _842;
    if (!_816)
    {
        _772 = _836;
    }
    float _846 = _772;
    bool _848 = !_816;
    float _850 = _846;
    if (!_848)
    {
        float _852 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _854 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _856 = _806 + _854;
        float _858 = _824 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _860 = rsqrt(_804);
        float _862 = _856 * _852;
        float _864 = _862 * 0.15915493667125701904296875;
        float _866 = _864 * 6.283185482025146484375;
        float _868 = cos(_866);
        float _870 = _864 * 6.283185482025146484375;
        float _872 = sin(_870);
        float _874 = _868 + (-1.0);
        float _876 = fma(_872, _858, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _878 = _874 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _880 = _860 * _876;
        float _882 = fma(_824, _868, _878);
        float _884 = fma(_794, _880, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _886 = _882 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _888 = fma(_790, _880, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _890 = fma(_884, (*spvDescriptorSet0.vp_c4)._m0[2].x, _886);
        float _892 = fma(_888, (*spvDescriptorSet0.vp_c4)._m0[2].z, _890);
        float _894 = _892 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _840 = _882;
        _828 = _884;
        _844 = _888;
        _850 = _894;
    }
    float _896 = _840;
    float _898 = _828;
    float _900 = _844;
    float _902 = _850;
    float _904 = _896 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _906 = _896 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    out.m_40.z = _812;
    out.m_40.w = _814;
    float _908 = fma(_898, (*spvDescriptorSet0.vp_c4)._m0[1].x, _904);
    float _910 = fma(_898, (*spvDescriptorSet0.vp_c4)._m0[0].x, _906);
    out.m_42.x = _808;
    float _912 = fma(_900, (*spvDescriptorSet0.vp_c4)._m0[1].z, _908);
    float _914 = fma(_900, (*spvDescriptorSet0.vp_c4)._m0[0].z, _910);
    out.m_42.y = _810;
    float _916 = _912 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _918 = _914 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _920 = -_836;
    float _922 = -(*spvDescriptorSet0.vp_c9)._m0[72].y;
    float _924 = _920 + _922;
    out.m_44.x = (*spvDescriptorSet0.vp_c15)._m0[0].z;
    out.m_44.y = _824;
    out.m_44.z = _710;
    float _926 = _916 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _928 = _916 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _930 = _916 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _932 = _916 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _934 = fma(_918, (*spvDescriptorSet0.vp_c4)._m0[8].x, _926);
    float _936 = fma(_918, (*spvDescriptorSet0.vp_c4)._m0[7].x, _928);
    float _938 = fma(_918, (*spvDescriptorSet0.vp_c4)._m0[9].x, _930);
    float _940 = fma(_918, (*spvDescriptorSet0.vp_c4)._m0[10].x, _932);
    float _942 = fma(_902, (*spvDescriptorSet0.vp_c4)._m0[8].z, _934);
    float _944 = fma(_902, (*spvDescriptorSet0.vp_c4)._m0[7].z, _936);
    float _946 = fma(_902, (*spvDescriptorSet0.vp_c4)._m0[9].z, _938);
    float _948 = fma(_902, (*spvDescriptorSet0.vp_c4)._m0[10].z, _940);
    float _950 = _924 * (*spvDescriptorSet0.vp_c9)._m0[72].z;
    float _952 = _944 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _954 = _942 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _956 = _946 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _958 = _948 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.m_42.w = (*spvDescriptorSet0.vp_c15)._m0[7].y;
    out.m_46.w = _836;
    out.m_48.w = _950;
    out.gl_Position.x = _952;
    out.gl_Position.y = _954;
    out.gl_Position.z = _956;
    out.gl_Position.w = _958;
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
    float _68 = _66 + (*spvDescriptorSet0.vp_c15)._m0[3].z;
    int _71 = 16 + as_type<int>(as_type<float>(gl_BaseInstance));
    float _73 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _75 = (*spvDescriptorSet0.vp_c15)._m0[0].z + _73;
    int _77 = _71 << 4;
    bool _81 = _77 == 0;
    bool _83 = _77 == 16;
    bool _85 = _77 == 32;
    bool _87 = _77 == 48;
    bool _89 = _77 == 64;
    float _91 = fma(_68, _64, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    bool _93 = _77 == 80;
    bool _95 = _62 >= 0.5;
    bool _97 = isnan(_62);
    bool _99 = _95 || _97;
    bool _101 = isnan(0.5);
    bool _103 = _99 || _101;
    float _105 = as_type<float>(gl_BaseInstance);
    float _107 = _62;
    if (_81)
    {
        _105 = (*spvDescriptorSet0.vp_c14)._m0[268].x;
    }
    float _109 = _105;
    float _111 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _113 = _91 + _111;
    float _115 = fma(_64, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    bool _117 = _77 == 96;
    float _119 = _113 * _113;
    float _121 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _123 = _115 + _121;
    float _125 = 0.0;
    float _127 = _109;
    if (_81)
    {
        _125 = (*spvDescriptorSet0.vp_c14)._m0[268].z;
    }
    float _129 = _125;
    float _131 = fma(_75, _75, _119);
    float _133 = _129;
    if (_83)
    {
        _127 = (*spvDescriptorSet0.vp_c14)._m0[269].x;
    }
    float _135 = _127;
    bool _137 = _77 == 112;
    float _139 = fma(_123, _123, _131);
    float _141 = _135;
    if (_83)
    {
        _133 = (*spvDescriptorSet0.vp_c14)._m0[269].z;
    }
    float _143 = _133;
    float _145 = _143;
    if (_85)
    {
        _141 = (*spvDescriptorSet0.vp_c14)._m0[270].x;
    }
    float _147 = _141;
    float _149 = rsqrt(_139);
    bool _151 = _77 == 128;
    float _153 = _147;
    if (_85)
    {
        _145 = (*spvDescriptorSet0.vp_c14)._m0[270].z;
    }
    float _155 = _145;
    float _157 = _155;
    if (_87)
    {
        _153 = (*spvDescriptorSet0.vp_c14)._m0[271].x;
    }
    float _159 = _153;
    bool _161 = _77 == 144;
    float _163 = _159;
    if (_87)
    {
        _157 = (*spvDescriptorSet0.vp_c14)._m0[271].z;
    }
    float _165 = _157;
    float _167 = _165;
    if (_89)
    {
        _163 = (*spvDescriptorSet0.vp_c14)._m0[272].x;
    }
    float _169 = _163;
    bool _171 = _77 == 160;
    float _173 = _169;
    if (_89)
    {
        _167 = (*spvDescriptorSet0.vp_c14)._m0[272].z;
    }
    float _175 = _167;
    float _177 = _149 * (*spvDescriptorSet0.vp_c14)._m0[268].x;
    float _179 = _175;
    if (_93)
    {
        _173 = (*spvDescriptorSet0.vp_c14)._m0[273].x;
    }
    float _181 = _173;
    bool _183 = _77 == 176;
    float _185 = _181;
    if (_93)
    {
        _179 = (*spvDescriptorSet0.vp_c14)._m0[273].z;
    }
    float _187 = _179;
    float _189 = log2(_177);
    bool _191 = _77 == 192;
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
    bool _205 = _77 == 208;
    float _207 = _203;
    if (_137)
    {
        _201 = (*spvDescriptorSet0.vp_c14)._m0[275].z;
    }
    float _209 = _201;
    float _211 = _209;
    if (_151)
    {
        _207 = (*spvDescriptorSet0.vp_c14)._m0[276].x;
    }
    float _213 = _207;
    bool _215 = _77 == 224;
    float _217 = _189 + 1.2999999523162841796875;
    float _219 = _213;
    if (_151)
    {
        _211 = (*spvDescriptorSet0.vp_c14)._m0[276].z;
    }
    float _221 = _211;
    float _223 = _221;
    if (_161)
    {
        _219 = (*spvDescriptorSet0.vp_c14)._m0[277].x;
    }
    float _225 = _219;
    bool _227 = _77 == 240;
    float _229 = trunc(_217);
    int _231 = int(_229);
    float _233 = _225;
    if (_161)
    {
        _223 = (*spvDescriptorSet0.vp_c14)._m0[277].z;
    }
    float _235 = _223;
    float _237 = _235;
    if (_171)
    {
        _233 = (*spvDescriptorSet0.vp_c14)._m0[278].x;
    }
    float _239 = _233;
    bool _241 = _77 == 256;
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
    bool _251 = _77 == 272;
    float _253 = _249;
    if (_183)
    {
        _247 = (*spvDescriptorSet0.vp_c14)._m0[279].z;
    }
    float _255 = _247;
    float _257 = _255;
    if (_191)
    {
        _253 = (*spvDescriptorSet0.vp_c14)._m0[280].x;
    }
    float _259 = _253;
    int _261 = min(_231, 15);
    bool _263 = _77 == 288;
    float _265 = _259;
    if (_191)
    {
        _257 = (*spvDescriptorSet0.vp_c14)._m0[280].z;
    }
    float _267 = _257;
    float _269 = float(_261);
    bool _271 = _77 == 304;
    int _273 = _261 << 4;
    int _275 = _273 + 4288;
    float _277 = _267;
    float _279 = as_type<float>(_275);
    if (_205)
    {
        _265 = (*spvDescriptorSet0.vp_c14)._m0[281].x;
    }
    float _281 = _265;
    float _283 = _281;
    if (_205)
    {
        _277 = (*spvDescriptorSet0.vp_c14)._m0[281].z;
    }
    float _285 = _277;
    float _287 = -_269;
    float _289 = _287 + (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _291 = _285;
    if (_215)
    {
        _283 = (*spvDescriptorSet0.vp_c14)._m0[282].x;
    }
    float _293 = _283;
    int _295 = _275 + 8;
    uint _298 = uint(int(uint(_295) >> uint(2)));
    uint _300 = uint(int(uint(int(_298)) >> uint(2)));
    int _302 = int(_298) & 3;
    float _304 = (*spvDescriptorSet0.vp_c14)._m0[int(_300)][_302];
    int _306 = int(_298) + 1;
    uint _308 = uint(int(uint(_306) >> uint(2)));
    int _310 = _306 & 3;
    float _312 = (*spvDescriptorSet0.vp_c14)._m0[int(_308)][_310];
    bool _314 = _77 == 320;
    float _316 = _289 + 1.0;
    float _318 = _293;
    if (_215)
    {
        _291 = (*spvDescriptorSet0.vp_c14)._m0[282].z;
    }
    float _320 = _291;
    float _322 = _320;
    if (_227)
    {
        _318 = (*spvDescriptorSet0.vp_c14)._m0[283].x;
    }
    float _324 = _318;
    bool _326 = _77 == 336;
    float _328 = exp2(_316);
    float _330 = _324;
    if (_227)
    {
        _322 = (*spvDescriptorSet0.vp_c14)._m0[283].z;
    }
    float _332 = _322;
    float _334 = _332;
    if (_241)
    {
        _330 = (*spvDescriptorSet0.vp_c14)._m0[284].x;
    }
    float _336 = _330;
    bool _338 = _77 == 352;
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
    bool _348 = _77 == 368;
    float _350 = _346;
    if (_251)
    {
        _344 = (*spvDescriptorSet0.vp_c14)._m0[285].z;
    }
    float _352 = _344;
    float _354 = _352;
    if (_263)
    {
        _350 = (*spvDescriptorSet0.vp_c14)._m0[286].x;
    }
    float _356 = _350;
    float _358 = 1.0 / _328;
    bool _360 = _77 == 384;
    float _362 = _356;
    if (_263)
    {
        _354 = (*spvDescriptorSet0.vp_c14)._m0[286].z;
    }
    float _364 = _354;
    float _366 = _364;
    if (_271)
    {
        _362 = (*spvDescriptorSet0.vp_c14)._m0[287].x;
    }
    float _368 = _362;
    bool _370 = _77 == 400;
    float _372 = _368;
    if (_271)
    {
        _366 = (*spvDescriptorSet0.vp_c14)._m0[287].z;
    }
    float _374 = _366;
    bool _376 = _77 == 416;
    float _378 = _374;
    if (_314)
    {
        _372 = (*spvDescriptorSet0.vp_c14)._m0[288].x;
    }
    float _380 = _372;
    float _382 = _380;
    if (_314)
    {
        _378 = (*spvDescriptorSet0.vp_c14)._m0[288].z;
    }
    float _384 = _378;
    float _386 = _384;
    if (_326)
    {
        _382 = (*spvDescriptorSet0.vp_c14)._m0[289].x;
    }
    float _388 = _382;
    bool _390 = _77 == 432;
    float _392 = _388;
    if (_326)
    {
        _386 = (*spvDescriptorSet0.vp_c14)._m0[289].z;
    }
    float _394 = _386;
    float _396 = _394;
    if (_338)
    {
        _392 = (*spvDescriptorSet0.vp_c14)._m0[290].x;
    }
    float _398 = _392;
    bool _400 = _77 == 448;
    float _402 = _398;
    if (_338)
    {
        _396 = (*spvDescriptorSet0.vp_c14)._m0[290].z;
    }
    float _404 = _396;
    float _406 = _404;
    if (_348)
    {
        _402 = (*spvDescriptorSet0.vp_c14)._m0[291].x;
    }
    float _408 = _402;
    bool _410 = _77 == 464;
    float _412 = _408;
    if (_348)
    {
        _406 = (*spvDescriptorSet0.vp_c14)._m0[291].z;
    }
    float _414 = _406;
    float _416 = _414;
    if (_360)
    {
        _412 = (*spvDescriptorSet0.vp_c14)._m0[292].x;
    }
    float _418 = _412;
    bool _420 = _77 == 480;
    float _422 = _418;
    if (_360)
    {
        _416 = (*spvDescriptorSet0.vp_c14)._m0[292].z;
    }
    float _424 = _416;
    float _426 = _424;
    if (_370)
    {
        _422 = (*spvDescriptorSet0.vp_c14)._m0[293].x;
    }
    float _428 = _422;
    bool _430 = _77 == 496;
    float _432 = _428;
    if (_370)
    {
        _426 = (*spvDescriptorSet0.vp_c14)._m0[293].z;
    }
    float _434 = _426;
    float _436 = _434;
    if (_376)
    {
        _432 = (*spvDescriptorSet0.vp_c14)._m0[294].x;
    }
    float _438 = _432;
    bool _440 = _77 == 512;
    float _442 = _438;
    if (_376)
    {
        _436 = (*spvDescriptorSet0.vp_c14)._m0[294].z;
    }
    float _444 = _436;
    bool _446 = _77 == 528;
    float _448 = _444;
    if (_390)
    {
        _442 = (*spvDescriptorSet0.vp_c14)._m0[295].x;
    }
    float _450 = _442;
    float _452 = _450;
    if (_390)
    {
        _448 = (*spvDescriptorSet0.vp_c14)._m0[295].z;
    }
    float _454 = _448;
    float _456 = _454;
    if (_400)
    {
        _452 = (*spvDescriptorSet0.vp_c14)._m0[296].x;
    }
    float _458 = _452;
    bool _460 = _77 == 544;
    float _462 = _458;
    if (_400)
    {
        _456 = (*spvDescriptorSet0.vp_c14)._m0[296].z;
    }
    float _464 = _456;
    float _466 = _464;
    if (_410)
    {
        _462 = (*spvDescriptorSet0.vp_c14)._m0[297].x;
    }
    float _468 = _462;
    bool _470 = _77 == 560;
    float _472 = _468;
    if (_410)
    {
        _466 = (*spvDescriptorSet0.vp_c14)._m0[297].z;
    }
    float _474 = _466;
    float _476 = _474;
    if (_420)
    {
        _472 = (*spvDescriptorSet0.vp_c14)._m0[298].x;
    }
    float _478 = _472;
    bool _480 = _77 == 576;
    float _482 = _478;
    if (_420)
    {
        _476 = (*spvDescriptorSet0.vp_c14)._m0[298].z;
    }
    float _484 = _476;
    float _486 = _484;
    if (_430)
    {
        _482 = (*spvDescriptorSet0.vp_c14)._m0[299].x;
    }
    float _488 = _482;
    bool _490 = _77 == 592;
    float _492 = _488;
    if (_430)
    {
        _486 = (*spvDescriptorSet0.vp_c14)._m0[299].z;
    }
    float _494 = _486;
    float _496 = _494;
    if (_440)
    {
        _492 = (*spvDescriptorSet0.vp_c14)._m0[300].x;
    }
    float _498 = _492;
    bool _500 = _77 == 608;
    float _502 = _498;
    if (_440)
    {
        _496 = (*spvDescriptorSet0.vp_c14)._m0[300].z;
    }
    float _504 = _496;
    float _506 = _504;
    if (_446)
    {
        _502 = (*spvDescriptorSet0.vp_c14)._m0[301].x;
    }
    float _508 = _502;
    bool _510 = _77 == 624;
    float _512 = _508;
    if (_446)
    {
        _506 = (*spvDescriptorSet0.vp_c14)._m0[301].z;
    }
    float _514 = _506;
    bool _516 = _77 == 640;
    float _518 = _514;
    if (_460)
    {
        _512 = (*spvDescriptorSet0.vp_c14)._m0[302].x;
    }
    float _520 = _512;
    float _522 = _520;
    if (_460)
    {
        _518 = (*spvDescriptorSet0.vp_c14)._m0[302].z;
    }
    float _524 = _518;
    float _526 = _524;
    if (_470)
    {
        _522 = (*spvDescriptorSet0.vp_c14)._m0[303].x;
    }
    float _528 = _522;
    bool _530 = _77 == 656;
    float _532 = _528;
    if (_470)
    {
        _526 = (*spvDescriptorSet0.vp_c14)._m0[303].z;
    }
    float _534 = _526;
    float _536 = _534;
    if (_480)
    {
        _532 = (*spvDescriptorSet0.vp_c14)._m0[304].x;
    }
    float _538 = _532;
    bool _540 = _77 == 672;
    float _542 = _538;
    if (_480)
    {
        _536 = (*spvDescriptorSet0.vp_c14)._m0[304].z;
    }
    float _544 = _536;
    float _546 = _544;
    if (_490)
    {
        _542 = (*spvDescriptorSet0.vp_c14)._m0[305].x;
    }
    float _548 = _542;
    bool _550 = _77 == 688;
    float _552 = _548;
    if (_490)
    {
        _546 = (*spvDescriptorSet0.vp_c14)._m0[305].z;
    }
    float _554 = _546;
    float _556 = _554;
    if (_500)
    {
        _552 = (*spvDescriptorSet0.vp_c14)._m0[306].x;
    }
    float _558 = _552;
    bool _560 = _77 == 704;
    float _562 = _558;
    if (_500)
    {
        _556 = (*spvDescriptorSet0.vp_c14)._m0[306].z;
    }
    float _564 = _556;
    float _566 = _564;
    if (_510)
    {
        _562 = (*spvDescriptorSet0.vp_c14)._m0[307].x;
    }
    float _568 = _562;
    bool _570 = _77 == 720;
    float _572 = _568;
    if (_510)
    {
        _566 = (*spvDescriptorSet0.vp_c14)._m0[307].z;
    }
    float _574 = _566;
    float _576 = _574;
    if (_516)
    {
        _572 = (*spvDescriptorSet0.vp_c14)._m0[308].x;
    }
    float _578 = _572;
    bool _580 = _77 == 736;
    float _582 = _578;
    if (_516)
    {
        _576 = (*spvDescriptorSet0.vp_c14)._m0[308].z;
    }
    float _584 = _576;
    bool _586 = _77 == 752;
    float _588 = _584;
    if (_530)
    {
        _582 = (*spvDescriptorSet0.vp_c14)._m0[309].x;
    }
    float _590 = _582;
    float _592 = _590;
    if (_540)
    {
        _592 = (*spvDescriptorSet0.vp_c14)._m0[310].x;
    }
    float _594 = _592;
    float _596 = _594;
    if (_550)
    {
        _596 = (*spvDescriptorSet0.vp_c14)._m0[311].x;
    }
    float _598 = _596;
    float _600 = _598;
    if (_560)
    {
        _600 = (*spvDescriptorSet0.vp_c14)._m0[312].x;
    }
    float _602 = _600;
    float _604 = _602;
    if (_570)
    {
        _604 = (*spvDescriptorSet0.vp_c14)._m0[313].x;
    }
    float _606 = _604;
    float _608 = _606;
    if (_580)
    {
        _608 = (*spvDescriptorSet0.vp_c14)._m0[314].x;
    }
    float _610 = _608;
    float _612 = _610;
    if (_586)
    {
        _612 = (*spvDescriptorSet0.vp_c14)._m0[315].x;
    }
    float _614 = _612;
    float _616 = _358 * _614;
    if (_530)
    {
        _588 = (*spvDescriptorSet0.vp_c14)._m0[309].z;
    }
    float _618 = _588;
    float _620 = _618;
    if (_540)
    {
        _620 = (*spvDescriptorSet0.vp_c14)._m0[310].z;
    }
    float _622 = _620;
    float _624 = _616 * _64;
    float _626 = _622;
    if (_550)
    {
        _626 = (*spvDescriptorSet0.vp_c14)._m0[311].z;
    }
    float _628 = _626;
    float _630 = _628;
    if (_560)
    {
        _630 = (*spvDescriptorSet0.vp_c14)._m0[312].z;
    }
    float _632 = _630;
    float _634 = floor(_624);
    float _636 = _632;
    if (_570)
    {
        _636 = (*spvDescriptorSet0.vp_c14)._m0[313].z;
    }
    float _638 = _636;
    float _640 = _638;
    if (_580)
    {
        _640 = (*spvDescriptorSet0.vp_c14)._m0[314].z;
    }
    float _642 = _640;
    float _644 = _642;
    if (_586)
    {
        _644 = (*spvDescriptorSet0.vp_c14)._m0[315].z;
    }
    float _646 = _644;
    float _648 = -_634;
    float _650 = _624 + _648;
    float _652 = _328 * _646;
    float _654 = _650 * 2.0;
    float _656 = -_650;
    float _658 = fma(_652, _656, _64);
    float _660 = floor(_654);
    float _662 = _652 * _660;
    float _664 = _662 * 0.5;
    float _666 = _664 + _658;
    float _668 = fma(_68, _666, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _670 = fma(_666, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _672 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _674 = _668 + _672;
    float _676 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _678 = _670 + _676;
    float _680 = _674 * _674;
    float _682 = fma(_75, _75, _680);
    float _684 = fma(_678, _678, _682);
    float _686 = sqrt(_684);
    float _688 = -_312;
    float _690 = fma(_686, _304, _688);
    float _692 = precise::clamp(_690, 0.0, 1.0);
    float _694 = -_664;
    float _696 = fma(_694, _692, _666);
    float _698 = _664;
    float _700 = _684;
    float _702 = _660;
    float _704 = _312;
    float _706 = (*spvDescriptorSet0.vp_c15)._m0[4].x;
    if (!_103)
    {
        _698 = (*spvDescriptorSet0.vp_c15)._m0[6].x;
    }
    float _708 = _698;
    float _710 = fma(_696, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _712 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].z);
    float _714 = fma(_710, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].w);
    float _716 = _708;
    if (!_103)
    {
        float _718 = fma(_712, _708, (*spvDescriptorSet0.vp_c15)._m0[6].z);
        _279 = _718;
    }
    float _720 = _279;
    float _722 = _720;
    if (!_103)
    {
        float _724 = fma(_714, _708, (*spvDescriptorSet0.vp_c15)._m0[6].w);
        _700 = _724;
    }
    float _726 = _700;
    float _728 = _726;
    if (!_103)
    {
        float _730 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _720);
        _722 = _730;
    }
    float _732 = _722;
    float _734 = _732;
    if (!_103)
    {
        float _736 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _726);
        _702 = _736;
    }
    float _738 = _702;
    if (!_103)
    {
        float2 _2149 = float2(_732, _738);
        float _740 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2149, float2(0.0), isnan(_2149)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2149, float2(0.0), isnan(_2149)), level(0.0)).x;
        _728 = _740;
    }
    float _742 = _728;
    float _744 = 0.0;
    if (_103)
    {
        _744 = (*spvDescriptorSet0.vp_c15)._m0[14].x;
    }
    float _746 = _744;
    if (_103)
    {
        _704 = (*spvDescriptorSet0.vp_c15)._m0[15].x;
    }
    float _748 = _704;
    if (_103)
    {
        float _750 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, _746, (*spvDescriptorSet0.vp_c15)._m0[14].z);
        _716 = _750;
    }
    float _752 = _716;
    float _754 = _752;
    if (_103)
    {
        float _756 = fma(_710, _746, (*spvDescriptorSet0.vp_c15)._m0[14].w);
        _107 = _756;
    }
    float _758 = _107;
    float _760 = _758;
    if (_103)
    {
        float _762 = fma(_752, _748, (*spvDescriptorSet0.vp_c15)._m0[15].z);
        _754 = _762;
    }
    float _764 = _754;
    float _766 = _764;
    if (_103)
    {
        float _768 = fma(_758, _748, (*spvDescriptorSet0.vp_c15)._m0[15].w);
        _760 = _768;
    }
    float _770 = _760;
    float _772 = _770;
    if (_103)
    {
        float _774 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _764);
        _766 = _774;
    }
    float _776 = _766;
    if (_103)
    {
        float _778 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _770);
        _706 = _778;
    }
    float _780 = _706;
    float _782 = _742;
    if (_103)
    {
        float2 _2241 = float2(_776, _780);
        float _784 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_2241, float2(0.0), isnan(_2241)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_2241, float2(0.0), isnan(_2241)), level(0.0)).x;
        _782 = _784;
    }
    float _786 = _782;
    float _788 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _790 = _710 + _788;
    float _792 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _794 = (*spvDescriptorSet0.vp_c15)._m0[0].z + _792;
    if (!_103)
    {
        _734 = _712;
    }
    float _796 = _734;
    float _798 = _790 * _790;
    float _800 = _796;
    if (_103)
    {
        _800 = _712;
    }
    float _802 = _800;
    float _804 = fma(_794, _794, _798);
    float _806 = sqrt(_804);
    float _808 = fma(_802, (*spvDescriptorSet0.vp_c15)._m0[8].x, (*spvDescriptorSet0.vp_c15)._m0[8].z);
    float _810 = fma(_714, (*spvDescriptorSet0.vp_c15)._m0[8].x, (*spvDescriptorSet0.vp_c15)._m0[8].w);
    float _812 = fma(_802, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].z);
    float _814 = fma(_714, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].w);
    bool _816 = _806 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _818 = (*spvDescriptorSet0.vp_c15)._m0[7].x;
    float _820 = (*spvDescriptorSet0.vp_c14)._m0[0].y;
    if (!_816)
    {
        _818 = (*spvDescriptorSet0.vp_c15)._m0[0].z;
    }
    float _822 = _818;
    float _824 = fma(_786, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _826 = _824 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _828 = _822;
    if (!_816)
    {
        _820 = _824;
    }
    float _830 = _820;
    float _832 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[2].x, _826);
    float _834 = fma(_710, (*spvDescriptorSet0.vp_c4)._m0[2].z, _832);
    float _836 = _834 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _838 = _834;
    float _840 = _830;
    if (!_816)
    {
        _838 = _710;
    }
    float _842 = _838;
    float _844 = _842;
    if (!_816)
    {
        _772 = _836;
    }
    float _846 = _772;
    bool _848 = !_816;
    float _850 = _846;
    if (!_848)
    {
        float _852 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _854 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _856 = _806 + _854;
        float _858 = _824 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _860 = rsqrt(_804);
        float _862 = _856 * _852;
        float _864 = _862 * 0.15915493667125701904296875;
        float _866 = _864 * 6.283185482025146484375;
        float _868 = cos(_866);
        float _870 = _864 * 6.283185482025146484375;
        float _872 = sin(_870);
        float _874 = _868 + (-1.0);
        float _876 = fma(_872, _858, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _878 = _874 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _880 = _860 * _876;
        float _882 = fma(_824, _868, _878);
        float _884 = fma(_794, _880, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _886 = _882 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _888 = fma(_790, _880, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _890 = fma(_884, (*spvDescriptorSet0.vp_c4)._m0[2].x, _886);
        float _892 = fma(_888, (*spvDescriptorSet0.vp_c4)._m0[2].z, _890);
        float _894 = _892 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _840 = _882;
        _828 = _884;
        _844 = _888;
        _850 = _894;
    }
    float _896 = _840;
    float _898 = _828;
    float _900 = _844;
    float _902 = _850;
    float _904 = _896 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _906 = _896 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    out.m_40.z = _812;
    out.m_40.w = _814;
    float _908 = fma(_898, (*spvDescriptorSet0.vp_c4)._m0[1].x, _904);
    float _910 = fma(_898, (*spvDescriptorSet0.vp_c4)._m0[0].x, _906);
    out.m_42.x = _808;
    float _912 = fma(_900, (*spvDescriptorSet0.vp_c4)._m0[1].z, _908);
    float _914 = fma(_900, (*spvDescriptorSet0.vp_c4)._m0[0].z, _910);
    out.m_42.y = _810;
    float _916 = _912 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _918 = _914 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _920 = -_836;
    float _922 = -(*spvDescriptorSet0.vp_c9)._m0[72].y;
    float _924 = _920 + _922;
    out.m_44.x = (*spvDescriptorSet0.vp_c15)._m0[0].z;
    out.m_44.y = _824;
    out.m_44.z = _710;
    float _926 = _916 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _928 = _916 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _930 = _916 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _932 = _916 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _934 = fma(_918, (*spvDescriptorSet0.vp_c4)._m0[8].x, _926);
    float _936 = fma(_918, (*spvDescriptorSet0.vp_c4)._m0[7].x, _928);
    float _938 = fma(_918, (*spvDescriptorSet0.vp_c4)._m0[9].x, _930);
    float _940 = fma(_918, (*spvDescriptorSet0.vp_c4)._m0[10].x, _932);
    float _942 = fma(_902, (*spvDescriptorSet0.vp_c4)._m0[8].z, _934);
    float _944 = fma(_902, (*spvDescriptorSet0.vp_c4)._m0[7].z, _936);
    float _946 = fma(_902, (*spvDescriptorSet0.vp_c4)._m0[9].z, _938);
    float _948 = fma(_902, (*spvDescriptorSet0.vp_c4)._m0[10].z, _940);
    float _950 = _924 * (*spvDescriptorSet0.vp_c9)._m0[72].z;
    float _952 = _944 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _954 = _942 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _956 = _946 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _958 = _948 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.m_42.w = (*spvDescriptorSet0.vp_c15)._m0[7].y;
    out.m_46.w = _836;
    out.m_48.w = _950;
    out.gl_Position.x = _952;
    out.gl_Position.y = _954;
    out.gl_Position.z = _956;
    out.gl_Position.w = _958;
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
    float _68 = _66 + (*spvDescriptorSet0.vp_c15)._m0[3].z;
    int _71 = 16 + as_type<int>(as_type<float>(gl_BaseInstance));
    float _73 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _75 = (*spvDescriptorSet0.vp_c15)._m0[0].z + _73;
    int _77 = _71 << 4;
    bool _81 = _77 == 0;
    bool _83 = _77 == 16;
    bool _85 = _77 == 32;
    bool _87 = _77 == 48;
    bool _89 = _77 == 64;
    float _91 = fma(_68, _64, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    bool _93 = _77 == 80;
    bool _95 = _62 >= 0.5;
    bool _97 = isnan(_62);
    bool _99 = _95 || _97;
    bool _101 = isnan(0.5);
    bool _103 = _99 || _101;
    float _105 = as_type<float>(gl_BaseInstance);
    float _107 = _62;
    if (_81)
    {
        _105 = (*spvDescriptorSet0.vp_c14)._m0[268].x;
    }
    float _109 = _105;
    float _111 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _113 = _91 + _111;
    float _115 = fma(_64, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    bool _117 = _77 == 96;
    float _119 = _113 * _113;
    float _121 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _123 = _115 + _121;
    float _125 = 0.0;
    float _127 = _109;
    if (_81)
    {
        _125 = (*spvDescriptorSet0.vp_c14)._m0[268].z;
    }
    float _129 = _125;
    float _131 = fma(_75, _75, _119);
    float _133 = _129;
    if (_83)
    {
        _127 = (*spvDescriptorSet0.vp_c14)._m0[269].x;
    }
    float _135 = _127;
    bool _137 = _77 == 112;
    float _139 = fma(_123, _123, _131);
    float _141 = _135;
    if (_83)
    {
        _133 = (*spvDescriptorSet0.vp_c14)._m0[269].z;
    }
    float _143 = _133;
    float _145 = _143;
    if (_85)
    {
        _141 = (*spvDescriptorSet0.vp_c14)._m0[270].x;
    }
    float _147 = _141;
    float _149 = rsqrt(_139);
    bool _151 = _77 == 128;
    float _153 = _147;
    if (_85)
    {
        _145 = (*spvDescriptorSet0.vp_c14)._m0[270].z;
    }
    float _155 = _145;
    float _157 = _155;
    if (_87)
    {
        _153 = (*spvDescriptorSet0.vp_c14)._m0[271].x;
    }
    float _159 = _153;
    bool _161 = _77 == 144;
    float _163 = _159;
    if (_87)
    {
        _157 = (*spvDescriptorSet0.vp_c14)._m0[271].z;
    }
    float _165 = _157;
    float _167 = _165;
    if (_89)
    {
        _163 = (*spvDescriptorSet0.vp_c14)._m0[272].x;
    }
    float _169 = _163;
    bool _171 = _77 == 160;
    float _173 = _169;
    if (_89)
    {
        _167 = (*spvDescriptorSet0.vp_c14)._m0[272].z;
    }
    float _175 = _167;
    float _177 = _149 * (*spvDescriptorSet0.vp_c14)._m0[268].x;
    float _179 = _175;
    if (_93)
    {
        _173 = (*spvDescriptorSet0.vp_c14)._m0[273].x;
    }
    float _181 = _173;
    bool _183 = _77 == 176;
    float _185 = _181;
    if (_93)
    {
        _179 = (*spvDescriptorSet0.vp_c14)._m0[273].z;
    }
    float _187 = _179;
    float _189 = log2(_177);
    bool _191 = _77 == 192;
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
    bool _205 = _77 == 208;
    float _207 = _203;
    if (_137)
    {
        _201 = (*spvDescriptorSet0.vp_c14)._m0[275].z;
    }
    float _209 = _201;
    float _211 = _209;
    if (_151)
    {
        _207 = (*spvDescriptorSet0.vp_c14)._m0[276].x;
    }
    float _213 = _207;
    bool _215 = _77 == 224;
    float _217 = _189 + 1.2999999523162841796875;
    float _219 = _213;
    if (_151)
    {
        _211 = (*spvDescriptorSet0.vp_c14)._m0[276].z;
    }
    float _221 = _211;
    float _223 = _221;
    if (_161)
    {
        _219 = (*spvDescriptorSet0.vp_c14)._m0[277].x;
    }
    float _225 = _219;
    bool _227 = _77 == 240;
    float _229 = trunc(_217);
    int _231 = int(_229);
    float _233 = _225;
    if (_161)
    {
        _223 = (*spvDescriptorSet0.vp_c14)._m0[277].z;
    }
    float _235 = _223;
    float _237 = _235;
    if (_171)
    {
        _233 = (*spvDescriptorSet0.vp_c14)._m0[278].x;
    }
    float _239 = _233;
    bool _241 = _77 == 256;
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
    bool _251 = _77 == 272;
    float _253 = _249;
    if (_183)
    {
        _247 = (*spvDescriptorSet0.vp_c14)._m0[279].z;
    }
    float _255 = _247;
    float _257 = _255;
    if (_191)
    {
        _253 = (*spvDescriptorSet0.vp_c14)._m0[280].x;
    }
    float _259 = _253;
    int _261 = min(_231, 15);
    bool _263 = _77 == 288;
    float _265 = _259;
    if (_191)
    {
        _257 = (*spvDescriptorSet0.vp_c14)._m0[280].z;
    }
    float _267 = _257;
    float _269 = float(_261);
    bool _271 = _77 == 304;
    int _273 = _261 << 4;
    int _275 = _273 + 4288;
    float _277 = _267;
    float _279 = as_type<float>(_275);
    if (_205)
    {
        _265 = (*spvDescriptorSet0.vp_c14)._m0[281].x;
    }
    float _281 = _265;
    float _283 = _281;
    if (_205)
    {
        _277 = (*spvDescriptorSet0.vp_c14)._m0[281].z;
    }
    float _285 = _277;
    float _287 = -_269;
    float _289 = _287 + (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _291 = _285;
    if (_215)
    {
        _283 = (*spvDescriptorSet0.vp_c14)._m0[282].x;
    }
    float _293 = _283;
    int _295 = _275 + 8;
    uint _298 = uint(int(uint(_295) >> uint(2)));
    uint _300 = uint(int(uint(int(_298)) >> uint(2)));
    int _302 = int(_298) & 3;
    float _304 = (*spvDescriptorSet0.vp_c14)._m0[int(_300)][_302];
    int _306 = int(_298) + 1;
    uint _308 = uint(int(uint(_306) >> uint(2)));
    int _310 = _306 & 3;
    float _312 = (*spvDescriptorSet0.vp_c14)._m0[int(_308)][_310];
    bool _314 = _77 == 320;
    float _316 = _289 + 1.0;
    float _318 = _293;
    if (_215)
    {
        _291 = (*spvDescriptorSet0.vp_c14)._m0[282].z;
    }
    float _320 = _291;
    float _322 = _320;
    if (_227)
    {
        _318 = (*spvDescriptorSet0.vp_c14)._m0[283].x;
    }
    float _324 = _318;
    bool _326 = _77 == 336;
    float _328 = exp2(_316);
    float _330 = _324;
    if (_227)
    {
        _322 = (*spvDescriptorSet0.vp_c14)._m0[283].z;
    }
    float _332 = _322;
    float _334 = _332;
    if (_241)
    {
        _330 = (*spvDescriptorSet0.vp_c14)._m0[284].x;
    }
    float _336 = _330;
    bool _338 = _77 == 352;
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
    bool _348 = _77 == 368;
    float _350 = _346;
    if (_251)
    {
        _344 = (*spvDescriptorSet0.vp_c14)._m0[285].z;
    }
    float _352 = _344;
    float _354 = _352;
    if (_263)
    {
        _350 = (*spvDescriptorSet0.vp_c14)._m0[286].x;
    }
    float _356 = _350;
    float _358 = 1.0 / _328;
    bool _360 = _77 == 384;
    float _362 = _356;
    if (_263)
    {
        _354 = (*spvDescriptorSet0.vp_c14)._m0[286].z;
    }
    float _364 = _354;
    float _366 = _364;
    if (_271)
    {
        _362 = (*spvDescriptorSet0.vp_c14)._m0[287].x;
    }
    float _368 = _362;
    bool _370 = _77 == 400;
    float _372 = _368;
    if (_271)
    {
        _366 = (*spvDescriptorSet0.vp_c14)._m0[287].z;
    }
    float _374 = _366;
    bool _376 = _77 == 416;
    float _378 = _374;
    if (_314)
    {
        _372 = (*spvDescriptorSet0.vp_c14)._m0[288].x;
    }
    float _380 = _372;
    float _382 = _380;
    if (_314)
    {
        _378 = (*spvDescriptorSet0.vp_c14)._m0[288].z;
    }
    float _384 = _378;
    float _386 = _384;
    if (_326)
    {
        _382 = (*spvDescriptorSet0.vp_c14)._m0[289].x;
    }
    float _388 = _382;
    bool _390 = _77 == 432;
    float _392 = _388;
    if (_326)
    {
        _386 = (*spvDescriptorSet0.vp_c14)._m0[289].z;
    }
    float _394 = _386;
    float _396 = _394;
    if (_338)
    {
        _392 = (*spvDescriptorSet0.vp_c14)._m0[290].x;
    }
    float _398 = _392;
    bool _400 = _77 == 448;
    float _402 = _398;
    if (_338)
    {
        _396 = (*spvDescriptorSet0.vp_c14)._m0[290].z;
    }
    float _404 = _396;
    float _406 = _404;
    if (_348)
    {
        _402 = (*spvDescriptorSet0.vp_c14)._m0[291].x;
    }
    float _408 = _402;
    bool _410 = _77 == 464;
    float _412 = _408;
    if (_348)
    {
        _406 = (*spvDescriptorSet0.vp_c14)._m0[291].z;
    }
    float _414 = _406;
    float _416 = _414;
    if (_360)
    {
        _412 = (*spvDescriptorSet0.vp_c14)._m0[292].x;
    }
    float _418 = _412;
    bool _420 = _77 == 480;
    float _422 = _418;
    if (_360)
    {
        _416 = (*spvDescriptorSet0.vp_c14)._m0[292].z;
    }
    float _424 = _416;
    float _426 = _424;
    if (_370)
    {
        _422 = (*spvDescriptorSet0.vp_c14)._m0[293].x;
    }
    float _428 = _422;
    bool _430 = _77 == 496;
    float _432 = _428;
    if (_370)
    {
        _426 = (*spvDescriptorSet0.vp_c14)._m0[293].z;
    }
    float _434 = _426;
    float _436 = _434;
    if (_376)
    {
        _432 = (*spvDescriptorSet0.vp_c14)._m0[294].x;
    }
    float _438 = _432;
    bool _440 = _77 == 512;
    float _442 = _438;
    if (_376)
    {
        _436 = (*spvDescriptorSet0.vp_c14)._m0[294].z;
    }
    float _444 = _436;
    bool _446 = _77 == 528;
    float _448 = _444;
    if (_390)
    {
        _442 = (*spvDescriptorSet0.vp_c14)._m0[295].x;
    }
    float _450 = _442;
    float _452 = _450;
    if (_390)
    {
        _448 = (*spvDescriptorSet0.vp_c14)._m0[295].z;
    }
    float _454 = _448;
    float _456 = _454;
    if (_400)
    {
        _452 = (*spvDescriptorSet0.vp_c14)._m0[296].x;
    }
    float _458 = _452;
    bool _460 = _77 == 544;
    float _462 = _458;
    if (_400)
    {
        _456 = (*spvDescriptorSet0.vp_c14)._m0[296].z;
    }
    float _464 = _456;
    float _466 = _464;
    if (_410)
    {
        _462 = (*spvDescriptorSet0.vp_c14)._m0[297].x;
    }
    float _468 = _462;
    bool _470 = _77 == 560;
    float _472 = _468;
    if (_410)
    {
        _466 = (*spvDescriptorSet0.vp_c14)._m0[297].z;
    }
    float _474 = _466;
    float _476 = _474;
    if (_420)
    {
        _472 = (*spvDescriptorSet0.vp_c14)._m0[298].x;
    }
    float _478 = _472;
    bool _480 = _77 == 576;
    float _482 = _478;
    if (_420)
    {
        _476 = (*spvDescriptorSet0.vp_c14)._m0[298].z;
    }
    float _484 = _476;
    float _486 = _484;
    if (_430)
    {
        _482 = (*spvDescriptorSet0.vp_c14)._m0[299].x;
    }
    float _488 = _482;
    bool _490 = _77 == 592;
    float _492 = _488;
    if (_430)
    {
        _486 = (*spvDescriptorSet0.vp_c14)._m0[299].z;
    }
    float _494 = _486;
    float _496 = _494;
    if (_440)
    {
        _492 = (*spvDescriptorSet0.vp_c14)._m0[300].x;
    }
    float _498 = _492;
    bool _500 = _77 == 608;
    float _502 = _498;
    if (_440)
    {
        _496 = (*spvDescriptorSet0.vp_c14)._m0[300].z;
    }
    float _504 = _496;
    float _506 = _504;
    if (_446)
    {
        _502 = (*spvDescriptorSet0.vp_c14)._m0[301].x;
    }
    float _508 = _502;
    bool _510 = _77 == 624;
    float _512 = _508;
    if (_446)
    {
        _506 = (*spvDescriptorSet0.vp_c14)._m0[301].z;
    }
    float _514 = _506;
    bool _516 = _77 == 640;
    float _518 = _514;
    if (_460)
    {
        _512 = (*spvDescriptorSet0.vp_c14)._m0[302].x;
    }
    float _520 = _512;
    float _522 = _520;
    if (_460)
    {
        _518 = (*spvDescriptorSet0.vp_c14)._m0[302].z;
    }
    float _524 = _518;
    float _526 = _524;
    if (_470)
    {
        _522 = (*spvDescriptorSet0.vp_c14)._m0[303].x;
    }
    float _528 = _522;
    bool _530 = _77 == 656;
    float _532 = _528;
    if (_470)
    {
        _526 = (*spvDescriptorSet0.vp_c14)._m0[303].z;
    }
    float _534 = _526;
    float _536 = _534;
    if (_480)
    {
        _532 = (*spvDescriptorSet0.vp_c14)._m0[304].x;
    }
    float _538 = _532;
    bool _540 = _77 == 672;
    float _542 = _538;
    if (_480)
    {
        _536 = (*spvDescriptorSet0.vp_c14)._m0[304].z;
    }
    float _544 = _536;
    float _546 = _544;
    if (_490)
    {
        _542 = (*spvDescriptorSet0.vp_c14)._m0[305].x;
    }
    float _548 = _542;
    bool _550 = _77 == 688;
    float _552 = _548;
    if (_490)
    {
        _546 = (*spvDescriptorSet0.vp_c14)._m0[305].z;
    }
    float _554 = _546;
    float _556 = _554;
    if (_500)
    {
        _552 = (*spvDescriptorSet0.vp_c14)._m0[306].x;
    }
    float _558 = _552;
    bool _560 = _77 == 704;
    float _562 = _558;
    if (_500)
    {
        _556 = (*spvDescriptorSet0.vp_c14)._m0[306].z;
    }
    float _564 = _556;
    float _566 = _564;
    if (_510)
    {
        _562 = (*spvDescriptorSet0.vp_c14)._m0[307].x;
    }
    float _568 = _562;
    bool _570 = _77 == 720;
    float _572 = _568;
    if (_510)
    {
        _566 = (*spvDescriptorSet0.vp_c14)._m0[307].z;
    }
    float _574 = _566;
    float _576 = _574;
    if (_516)
    {
        _572 = (*spvDescriptorSet0.vp_c14)._m0[308].x;
    }
    float _578 = _572;
    bool _580 = _77 == 736;
    float _582 = _578;
    if (_516)
    {
        _576 = (*spvDescriptorSet0.vp_c14)._m0[308].z;
    }
    float _584 = _576;
    bool _586 = _77 == 752;
    float _588 = _584;
    if (_530)
    {
        _582 = (*spvDescriptorSet0.vp_c14)._m0[309].x;
    }
    float _590 = _582;
    float _592 = _590;
    if (_540)
    {
        _592 = (*spvDescriptorSet0.vp_c14)._m0[310].x;
    }
    float _594 = _592;
    float _596 = _594;
    if (_550)
    {
        _596 = (*spvDescriptorSet0.vp_c14)._m0[311].x;
    }
    float _598 = _596;
    float _600 = _598;
    if (_560)
    {
        _600 = (*spvDescriptorSet0.vp_c14)._m0[312].x;
    }
    float _602 = _600;
    float _604 = _602;
    if (_570)
    {
        _604 = (*spvDescriptorSet0.vp_c14)._m0[313].x;
    }
    float _606 = _604;
    float _608 = _606;
    if (_580)
    {
        _608 = (*spvDescriptorSet0.vp_c14)._m0[314].x;
    }
    float _610 = _608;
    float _612 = _610;
    if (_586)
    {
        _612 = (*spvDescriptorSet0.vp_c14)._m0[315].x;
    }
    float _614 = _612;
    float _616 = _358 * _614;
    if (_530)
    {
        _588 = (*spvDescriptorSet0.vp_c14)._m0[309].z;
    }
    float _618 = _588;
    float _620 = _618;
    if (_540)
    {
        _620 = (*spvDescriptorSet0.vp_c14)._m0[310].z;
    }
    float _622 = _620;
    float _624 = _616 * _64;
    float _626 = _622;
    if (_550)
    {
        _626 = (*spvDescriptorSet0.vp_c14)._m0[311].z;
    }
    float _628 = _626;
    float _630 = _628;
    if (_560)
    {
        _630 = (*spvDescriptorSet0.vp_c14)._m0[312].z;
    }
    float _632 = _630;
    float _634 = floor(_624);
    float _636 = _632;
    if (_570)
    {
        _636 = (*spvDescriptorSet0.vp_c14)._m0[313].z;
    }
    float _638 = _636;
    float _640 = _638;
    if (_580)
    {
        _640 = (*spvDescriptorSet0.vp_c14)._m0[314].z;
    }
    float _642 = _640;
    float _644 = _642;
    if (_586)
    {
        _644 = (*spvDescriptorSet0.vp_c14)._m0[315].z;
    }
    float _646 = _644;
    float _648 = -_634;
    float _650 = _624 + _648;
    float _652 = _328 * _646;
    float _654 = _650 * 2.0;
    float _656 = -_650;
    float _658 = fma(_652, _656, _64);
    float _660 = floor(_654);
    float _662 = _652 * _660;
    float _664 = _662 * 0.5;
    float _666 = _664 + _658;
    float _668 = fma(_68, _666, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _670 = fma(_666, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _672 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _674 = _668 + _672;
    float _676 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _678 = _670 + _676;
    float _680 = _674 * _674;
    float _682 = fma(_75, _75, _680);
    float _684 = fma(_678, _678, _682);
    float _686 = sqrt(_684);
    float _688 = -_312;
    float _690 = fma(_686, _304, _688);
    float _692 = precise::clamp(_690, 0.0, 1.0);
    float _694 = -_664;
    float _696 = fma(_694, _692, _666);
    float _698 = _664;
    float _700 = _684;
    float _702 = _660;
    float _704 = _312;
    float _706 = (*spvDescriptorSet0.vp_c15)._m0[4].x;
    if (!_103)
    {
        _698 = (*spvDescriptorSet0.vp_c15)._m0[6].x;
    }
    float _708 = _698;
    float _710 = fma(_696, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _712 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].z);
    float _714 = fma(_710, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].w);
    float _716 = _708;
    if (!_103)
    {
        float _718 = fma(_712, _708, (*spvDescriptorSet0.vp_c15)._m0[6].z);
        _279 = _718;
    }
    float _720 = _279;
    float _722 = _720;
    if (!_103)
    {
        float _724 = fma(_714, _708, (*spvDescriptorSet0.vp_c15)._m0[6].w);
        _700 = _724;
    }
    float _726 = _700;
    float _728 = _726;
    if (!_103)
    {
        float _730 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _720);
        _722 = _730;
    }
    float _732 = _722;
    float _734 = _732;
    if (!_103)
    {
        float _736 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _726);
        _702 = _736;
    }
    float _738 = _702;
    if (!_103)
    {
        float2 _2149 = float2(_732, _738);
        float _740 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2149, float2(0.0), isnan(_2149)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2149, float2(0.0), isnan(_2149)), level(0.0)).x;
        _728 = _740;
    }
    float _742 = _728;
    float _744 = 0.0;
    if (_103)
    {
        _744 = (*spvDescriptorSet0.vp_c15)._m0[14].x;
    }
    float _746 = _744;
    if (_103)
    {
        _704 = (*spvDescriptorSet0.vp_c15)._m0[15].x;
    }
    float _748 = _704;
    if (_103)
    {
        float _750 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, _746, (*spvDescriptorSet0.vp_c15)._m0[14].z);
        _716 = _750;
    }
    float _752 = _716;
    float _754 = _752;
    if (_103)
    {
        float _756 = fma(_710, _746, (*spvDescriptorSet0.vp_c15)._m0[14].w);
        _107 = _756;
    }
    float _758 = _107;
    float _760 = _758;
    if (_103)
    {
        float _762 = fma(_752, _748, (*spvDescriptorSet0.vp_c15)._m0[15].z);
        _754 = _762;
    }
    float _764 = _754;
    float _766 = _764;
    if (_103)
    {
        float _768 = fma(_758, _748, (*spvDescriptorSet0.vp_c15)._m0[15].w);
        _760 = _768;
    }
    float _770 = _760;
    float _772 = _770;
    if (_103)
    {
        float _774 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _764);
        _766 = _774;
    }
    float _776 = _766;
    if (_103)
    {
        float _778 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _770);
        _706 = _778;
    }
    float _780 = _706;
    float _782 = _742;
    if (_103)
    {
        float2 _2241 = float2(_776, _780);
        float _784 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_2241, float2(0.0), isnan(_2241)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_2241, float2(0.0), isnan(_2241)), level(0.0)).x;
        _782 = _784;
    }
    float _786 = _782;
    float _788 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _790 = _710 + _788;
    float _792 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _794 = (*spvDescriptorSet0.vp_c15)._m0[0].z + _792;
    if (!_103)
    {
        _734 = _712;
    }
    float _796 = _734;
    float _798 = _790 * _790;
    float _800 = _796;
    if (_103)
    {
        _800 = _712;
    }
    float _802 = _800;
    float _804 = fma(_794, _794, _798);
    float _806 = sqrt(_804);
    float _808 = fma(_802, (*spvDescriptorSet0.vp_c15)._m0[8].x, (*spvDescriptorSet0.vp_c15)._m0[8].z);
    float _810 = fma(_714, (*spvDescriptorSet0.vp_c15)._m0[8].x, (*spvDescriptorSet0.vp_c15)._m0[8].w);
    float _812 = fma(_802, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].z);
    float _814 = fma(_714, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].w);
    bool _816 = _806 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _818 = (*spvDescriptorSet0.vp_c15)._m0[7].x;
    float _820 = (*spvDescriptorSet0.vp_c14)._m0[0].y;
    if (!_816)
    {
        _818 = (*spvDescriptorSet0.vp_c15)._m0[0].z;
    }
    float _822 = _818;
    float _824 = fma(_786, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _826 = _824 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _828 = _822;
    if (!_816)
    {
        _820 = _824;
    }
    float _830 = _820;
    float _832 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[2].x, _826);
    float _834 = fma(_710, (*spvDescriptorSet0.vp_c4)._m0[2].z, _832);
    float _836 = _834 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _838 = _834;
    float _840 = _830;
    if (!_816)
    {
        _838 = _710;
    }
    float _842 = _838;
    float _844 = _842;
    if (!_816)
    {
        _772 = _836;
    }
    float _846 = _772;
    bool _848 = !_816;
    float _850 = _846;
    if (!_848)
    {
        float _852 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _854 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _856 = _806 + _854;
        float _858 = _824 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _860 = rsqrt(_804);
        float _862 = _856 * _852;
        float _864 = _862 * 0.15915493667125701904296875;
        float _866 = _864 * 6.283185482025146484375;
        float _868 = cos(_866);
        float _870 = _864 * 6.283185482025146484375;
        float _872 = sin(_870);
        float _874 = _868 + (-1.0);
        float _876 = fma(_872, _858, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _878 = _874 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _880 = _860 * _876;
        float _882 = fma(_824, _868, _878);
        float _884 = fma(_794, _880, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _886 = _882 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _888 = fma(_790, _880, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _890 = fma(_884, (*spvDescriptorSet0.vp_c4)._m0[2].x, _886);
        float _892 = fma(_888, (*spvDescriptorSet0.vp_c4)._m0[2].z, _890);
        float _894 = _892 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _840 = _882;
        _828 = _884;
        _844 = _888;
        _850 = _894;
    }
    float _896 = _840;
    float _898 = _828;
    float _900 = _844;
    float _902 = _850;
    float _904 = _896 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _906 = _896 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    out.m_40.z = _812;
    out.m_40.w = _814;
    float _908 = fma(_898, (*spvDescriptorSet0.vp_c4)._m0[1].x, _904);
    float _910 = fma(_898, (*spvDescriptorSet0.vp_c4)._m0[0].x, _906);
    out.m_42.x = _808;
    float _912 = fma(_900, (*spvDescriptorSet0.vp_c4)._m0[1].z, _908);
    float _914 = fma(_900, (*spvDescriptorSet0.vp_c4)._m0[0].z, _910);
    out.m_42.y = _810;
    float _916 = _912 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _918 = _914 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _920 = -_836;
    float _922 = -(*spvDescriptorSet0.vp_c9)._m0[72].y;
    float _924 = _920 + _922;
    out.m_44.x = (*spvDescriptorSet0.vp_c15)._m0[0].z;
    out.m_44.y = _824;
    out.m_44.z = _710;
    float _926 = _916 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _928 = _916 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _930 = _916 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _932 = _916 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _934 = fma(_918, (*spvDescriptorSet0.vp_c4)._m0[8].x, _926);
    float _936 = fma(_918, (*spvDescriptorSet0.vp_c4)._m0[7].x, _928);
    float _938 = fma(_918, (*spvDescriptorSet0.vp_c4)._m0[9].x, _930);
    float _940 = fma(_918, (*spvDescriptorSet0.vp_c4)._m0[10].x, _932);
    float _942 = fma(_902, (*spvDescriptorSet0.vp_c4)._m0[8].z, _934);
    float _944 = fma(_902, (*spvDescriptorSet0.vp_c4)._m0[7].z, _936);
    float _946 = fma(_902, (*spvDescriptorSet0.vp_c4)._m0[9].z, _938);
    float _948 = fma(_902, (*spvDescriptorSet0.vp_c4)._m0[10].z, _940);
    float _950 = _924 * (*spvDescriptorSet0.vp_c9)._m0[72].z;
    float _952 = _944 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _954 = _942 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _956 = _946 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _958 = _948 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.m_42.w = (*spvDescriptorSet0.vp_c15)._m0[7].y;
    out.m_46.w = _836;
    out.m_48.w = _950;
    out.gl_Position.x = _952;
    out.gl_Position.y = _954;
    out.gl_Position.z = _956;
    out.gl_Position.w = _958;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_40.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_40.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_40.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_40.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

