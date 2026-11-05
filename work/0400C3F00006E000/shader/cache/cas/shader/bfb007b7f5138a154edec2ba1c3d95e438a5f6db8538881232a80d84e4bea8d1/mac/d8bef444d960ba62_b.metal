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
    float4 m_42 [[user(locn0)]];
    float4 m_40 [[user(locn1)]];
    float4 m_46 [[user(locn2)]];
    float4 m_50 [[user(locn3)]];
    float4 m_52 [[user(locn4)]];
    float4 m_54 [[user(locn5)]];
    float4 m_44 [[user(locn6)]];
    float4 m_48 [[user(locn7)]];
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
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_40 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _68 = in.m_37.x;
    float _70 = in.m_37.y;
    float _72 = -(*spvDescriptorSet0.vp_c15)._m0[3].x;
    float _74 = _72 + (*spvDescriptorSet0.vp_c15)._m0[3].y;
    int _77 = 16 + as_type<int>(as_type<float>(gl_BaseInstance));
    int _79 = _77 << 4;
    bool _83 = _79 == 0;
    bool _85 = _79 == 16;
    bool _87 = _79 == 32;
    bool _89 = _79 == 48;
    bool _91 = _79 == 64;
    float _93 = fma(_74, _68, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _95 = fma(_68, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    bool _97 = _79 == 80;
    bool _99 = _70 >= 0.5;
    bool _101 = isnan(_70);
    bool _103 = _99 || _101;
    bool _105 = isnan(0.5);
    bool _107 = _103 || _105;
    float _109 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _111 = _93 + _109;
    float _113 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _115 = _95 + _113;
    float _117 = as_type<float>(gl_BaseInstance);
    if (_83)
    {
        _117 = (*spvDescriptorSet0.vp_c14)._m0[268].x;
    }
    float _119 = _117;
    float _121 = _111 * _111;
    bool _123 = _79 == 96;
    float _125 = 0.0;
    float _127 = _119;
    float _129 = (*spvDescriptorSet0.vp_c15)._m0[5].x;
    if (_83)
    {
        _125 = (*spvDescriptorSet0.vp_c14)._m0[268].z;
    }
    float _131 = _125;
    float _133 = fma(_115, _115, _121);
    float _135 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _137 = (*spvDescriptorSet0.vp_c15)._m0[0].w + _135;
    float _139 = _131;
    float _141 = _137;
    if (_85)
    {
        _127 = (*spvDescriptorSet0.vp_c14)._m0[269].x;
    }
    float _143 = _127;
    bool _145 = _79 == 112;
    float _147 = fma(_137, _137, _133);
    float _149 = _143;
    if (_85)
    {
        _139 = (*spvDescriptorSet0.vp_c14)._m0[269].z;
    }
    float _151 = _139;
    float _153 = _151;
    if (_87)
    {
        _149 = (*spvDescriptorSet0.vp_c14)._m0[270].x;
    }
    float _155 = _149;
    bool _157 = _79 == 128;
    float _159 = rsqrt(_147);
    float _161 = _155;
    if (_87)
    {
        _153 = (*spvDescriptorSet0.vp_c14)._m0[270].z;
    }
    float _163 = _153;
    float _165 = _163;
    if (_89)
    {
        _161 = (*spvDescriptorSet0.vp_c14)._m0[271].x;
    }
    float _167 = _161;
    bool _169 = _79 == 144;
    float _171 = _167;
    if (_89)
    {
        _165 = (*spvDescriptorSet0.vp_c14)._m0[271].z;
    }
    float _173 = _165;
    float _175 = _173;
    if (_91)
    {
        _171 = (*spvDescriptorSet0.vp_c14)._m0[272].x;
    }
    float _177 = _171;
    bool _179 = _79 == 160;
    float _181 = _177;
    if (_91)
    {
        _175 = (*spvDescriptorSet0.vp_c14)._m0[272].z;
    }
    float _183 = _175;
    float _185 = _183;
    if (_97)
    {
        _181 = (*spvDescriptorSet0.vp_c14)._m0[273].x;
    }
    float _187 = _181;
    float _189 = _159 * (*spvDescriptorSet0.vp_c14)._m0[268].x;
    bool _191 = _79 == 176;
    float _193 = _187;
    if (_97)
    {
        _185 = (*spvDescriptorSet0.vp_c14)._m0[273].z;
    }
    float _195 = _185;
    bool _197 = _79 == 192;
    float _199 = log2(_189);
    float _201 = _195;
    if (_123)
    {
        _193 = (*spvDescriptorSet0.vp_c14)._m0[274].x;
    }
    float _203 = _193;
    float _205 = _203;
    if (_123)
    {
        _201 = (*spvDescriptorSet0.vp_c14)._m0[274].z;
    }
    float _207 = _201;
    float _209 = _207;
    if (_145)
    {
        _205 = (*spvDescriptorSet0.vp_c14)._m0[275].x;
    }
    float _211 = _205;
    bool _213 = _79 == 208;
    float _215 = _211;
    if (_145)
    {
        _209 = (*spvDescriptorSet0.vp_c14)._m0[275].z;
    }
    float _217 = _209;
    float _219 = _217;
    if (_157)
    {
        _215 = (*spvDescriptorSet0.vp_c14)._m0[276].x;
    }
    float _221 = _215;
    bool _223 = _79 == 224;
    float _225 = _221;
    if (_157)
    {
        _219 = (*spvDescriptorSet0.vp_c14)._m0[276].z;
    }
    float _227 = _219;
    float _229 = _199 + 1.2999999523162841796875;
    float _231 = _227;
    if (_169)
    {
        _225 = (*spvDescriptorSet0.vp_c14)._m0[277].x;
    }
    float _233 = _225;
    bool _235 = _79 == 240;
    float _237 = _233;
    if (_169)
    {
        _231 = (*spvDescriptorSet0.vp_c14)._m0[277].z;
    }
    float _239 = _231;
    float _241 = trunc(_229);
    int _243 = int(_241);
    float _245 = _239;
    if (_179)
    {
        _237 = (*spvDescriptorSet0.vp_c14)._m0[278].x;
    }
    float _247 = _237;
    bool _249 = _79 == 256;
    float _251 = _247;
    if (_179)
    {
        _245 = (*spvDescriptorSet0.vp_c14)._m0[278].z;
    }
    float _253 = _245;
    float _255 = _253;
    if (_191)
    {
        _251 = (*spvDescriptorSet0.vp_c14)._m0[279].x;
    }
    float _257 = _251;
    bool _259 = _79 == 272;
    float _261 = _257;
    if (_191)
    {
        _255 = (*spvDescriptorSet0.vp_c14)._m0[279].z;
    }
    float _263 = _255;
    float _265 = _263;
    if (_197)
    {
        _261 = (*spvDescriptorSet0.vp_c14)._m0[280].x;
    }
    float _267 = _261;
    bool _269 = _79 == 288;
    int _271 = min(_243, 15);
    float _273 = _267;
    if (_197)
    {
        _265 = (*spvDescriptorSet0.vp_c14)._m0[280].z;
    }
    float _275 = _265;
    bool _277 = _79 == 304;
    float _279 = float(_271);
    float _281 = _275;
    if (_213)
    {
        _273 = (*spvDescriptorSet0.vp_c14)._m0[281].x;
    }
    float _283 = _273;
    int _285 = _271 << 4;
    int _287 = _285 + 4288;
    float _289 = _283;
    float _291 = as_type<float>(_287);
    if (_213)
    {
        _281 = (*spvDescriptorSet0.vp_c14)._m0[281].z;
    }
    float _293 = _281;
    float _295 = _293;
    if (_223)
    {
        _289 = (*spvDescriptorSet0.vp_c14)._m0[282].x;
    }
    float _297 = _289;
    float _299 = -_279;
    float _301 = _299 + (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _303 = _79 == 320;
    int _305 = _287 + 8;
    uint _308 = uint(int(uint(_305) >> uint(2)));
    uint _310 = uint(int(uint(int(_308)) >> uint(2)));
    int _312 = int(_308) & 3;
    float _314 = (*spvDescriptorSet0.vp_c14)._m0[int(_310)][_312];
    int _316 = int(_308) + 1;
    uint _318 = uint(int(uint(_316) >> uint(2)));
    int _320 = _316 & 3;
    float _322 = (*spvDescriptorSet0.vp_c14)._m0[int(_318)][_320];
    float _324 = _297;
    if (_223)
    {
        _295 = (*spvDescriptorSet0.vp_c14)._m0[282].z;
    }
    float _326 = _295;
    float _328 = _301 + 1.0;
    float _330 = _326;
    if (_235)
    {
        _324 = (*spvDescriptorSet0.vp_c14)._m0[283].x;
    }
    float _332 = _324;
    bool _334 = _79 == 336;
    float _336 = _332;
    if (_235)
    {
        _330 = (*spvDescriptorSet0.vp_c14)._m0[283].z;
    }
    float _338 = _330;
    float _340 = exp2(_328);
    float _342 = _338;
    if (_249)
    {
        _336 = (*spvDescriptorSet0.vp_c14)._m0[284].x;
    }
    float _344 = _336;
    bool _346 = _79 == 352;
    float _348 = _344;
    if (_249)
    {
        _342 = (*spvDescriptorSet0.vp_c14)._m0[284].z;
    }
    float _350 = _342;
    float _352 = _350;
    if (_259)
    {
        _348 = (*spvDescriptorSet0.vp_c14)._m0[285].x;
    }
    float _354 = _348;
    bool _356 = _79 == 368;
    float _358 = _354;
    if (_259)
    {
        _352 = (*spvDescriptorSet0.vp_c14)._m0[285].z;
    }
    float _360 = _352;
    float _362 = _360;
    if (_269)
    {
        _358 = (*spvDescriptorSet0.vp_c14)._m0[286].x;
    }
    float _364 = _358;
    bool _366 = _79 == 384;
    float _368 = 1.0 / _340;
    float _370 = _364;
    float _372 = _340;
    if (_269)
    {
        _362 = (*spvDescriptorSet0.vp_c14)._m0[286].z;
    }
    float _374 = _362;
    float _376 = _374;
    if (_277)
    {
        _370 = (*spvDescriptorSet0.vp_c14)._m0[287].x;
    }
    float _378 = _370;
    bool _380 = _79 == 400;
    float _382 = _378;
    if (_277)
    {
        _376 = (*spvDescriptorSet0.vp_c14)._m0[287].z;
    }
    float _384 = _376;
    bool _386 = _79 == 416;
    float _388 = _384;
    if (_303)
    {
        _382 = (*spvDescriptorSet0.vp_c14)._m0[288].x;
    }
    float _390 = _382;
    float _392 = _390;
    if (_303)
    {
        _388 = (*spvDescriptorSet0.vp_c14)._m0[288].z;
    }
    float _394 = _388;
    float _396 = _394;
    if (_334)
    {
        _392 = (*spvDescriptorSet0.vp_c14)._m0[289].x;
    }
    float _398 = _392;
    bool _400 = _79 == 432;
    float _402 = _398;
    if (_334)
    {
        _396 = (*spvDescriptorSet0.vp_c14)._m0[289].z;
    }
    float _404 = _396;
    float _406 = _404;
    if (_346)
    {
        _402 = (*spvDescriptorSet0.vp_c14)._m0[290].x;
    }
    float _408 = _402;
    bool _410 = _79 == 448;
    float _412 = _408;
    if (_346)
    {
        _406 = (*spvDescriptorSet0.vp_c14)._m0[290].z;
    }
    float _414 = _406;
    float _416 = _414;
    if (_356)
    {
        _412 = (*spvDescriptorSet0.vp_c14)._m0[291].x;
    }
    float _418 = _412;
    bool _420 = _79 == 464;
    float _422 = _418;
    if (_356)
    {
        _416 = (*spvDescriptorSet0.vp_c14)._m0[291].z;
    }
    float _424 = _416;
    float _426 = _424;
    if (_366)
    {
        _422 = (*spvDescriptorSet0.vp_c14)._m0[292].x;
    }
    float _428 = _422;
    bool _430 = _79 == 480;
    float _432 = _428;
    if (_366)
    {
        _426 = (*spvDescriptorSet0.vp_c14)._m0[292].z;
    }
    float _434 = _426;
    float _436 = _434;
    if (_380)
    {
        _432 = (*spvDescriptorSet0.vp_c14)._m0[293].x;
    }
    float _438 = _432;
    bool _440 = _79 == 496;
    float _442 = _438;
    if (_380)
    {
        _436 = (*spvDescriptorSet0.vp_c14)._m0[293].z;
    }
    float _444 = _436;
    float _446 = _444;
    if (_386)
    {
        _442 = (*spvDescriptorSet0.vp_c14)._m0[294].x;
    }
    float _448 = _442;
    bool _450 = _79 == 512;
    float _452 = _448;
    if (_386)
    {
        _446 = (*spvDescriptorSet0.vp_c14)._m0[294].z;
    }
    float _454 = _446;
    bool _456 = _79 == 528;
    float _458 = _454;
    if (_400)
    {
        _452 = (*spvDescriptorSet0.vp_c14)._m0[295].x;
    }
    float _460 = _452;
    float _462 = _460;
    if (_400)
    {
        _458 = (*spvDescriptorSet0.vp_c14)._m0[295].z;
    }
    float _464 = _458;
    float _466 = _464;
    if (_410)
    {
        _462 = (*spvDescriptorSet0.vp_c14)._m0[296].x;
    }
    float _468 = _462;
    bool _470 = _79 == 544;
    float _472 = _468;
    if (_410)
    {
        _466 = (*spvDescriptorSet0.vp_c14)._m0[296].z;
    }
    float _474 = _466;
    float _476 = _474;
    if (_420)
    {
        _472 = (*spvDescriptorSet0.vp_c14)._m0[297].x;
    }
    float _478 = _472;
    bool _480 = _79 == 560;
    float _482 = _478;
    if (_420)
    {
        _476 = (*spvDescriptorSet0.vp_c14)._m0[297].z;
    }
    float _484 = _476;
    float _486 = _484;
    if (_430)
    {
        _482 = (*spvDescriptorSet0.vp_c14)._m0[298].x;
    }
    float _488 = _482;
    bool _490 = _79 == 576;
    float _492 = _488;
    if (_430)
    {
        _486 = (*spvDescriptorSet0.vp_c14)._m0[298].z;
    }
    float _494 = _486;
    float _496 = _494;
    if (_440)
    {
        _492 = (*spvDescriptorSet0.vp_c14)._m0[299].x;
    }
    float _498 = _492;
    bool _500 = _79 == 592;
    float _502 = _498;
    if (_440)
    {
        _496 = (*spvDescriptorSet0.vp_c14)._m0[299].z;
    }
    float _504 = _496;
    float _506 = _504;
    if (_450)
    {
        _502 = (*spvDescriptorSet0.vp_c14)._m0[300].x;
    }
    float _508 = _502;
    bool _510 = _79 == 608;
    float _512 = _508;
    if (_450)
    {
        _506 = (*spvDescriptorSet0.vp_c14)._m0[300].z;
    }
    float _514 = _506;
    float _516 = _514;
    if (_456)
    {
        _512 = (*spvDescriptorSet0.vp_c14)._m0[301].x;
    }
    float _518 = _512;
    bool _520 = _79 == 624;
    float _522 = _518;
    if (_456)
    {
        _516 = (*spvDescriptorSet0.vp_c14)._m0[301].z;
    }
    float _524 = _516;
    bool _526 = _79 == 640;
    float _528 = _524;
    if (_470)
    {
        _522 = (*spvDescriptorSet0.vp_c14)._m0[302].x;
    }
    float _530 = _522;
    float _532 = _530;
    if (_470)
    {
        _528 = (*spvDescriptorSet0.vp_c14)._m0[302].z;
    }
    float _534 = _528;
    float _536 = _534;
    if (_480)
    {
        _532 = (*spvDescriptorSet0.vp_c14)._m0[303].x;
    }
    float _538 = _532;
    bool _540 = _79 == 656;
    float _542 = _538;
    if (_480)
    {
        _536 = (*spvDescriptorSet0.vp_c14)._m0[303].z;
    }
    float _544 = _536;
    float _546 = _544;
    if (_490)
    {
        _542 = (*spvDescriptorSet0.vp_c14)._m0[304].x;
    }
    float _548 = _542;
    bool _550 = _79 == 672;
    float _552 = _548;
    if (_490)
    {
        _546 = (*spvDescriptorSet0.vp_c14)._m0[304].z;
    }
    float _554 = _546;
    float _556 = _554;
    if (_500)
    {
        _552 = (*spvDescriptorSet0.vp_c14)._m0[305].x;
    }
    float _558 = _552;
    bool _560 = _79 == 688;
    float _562 = _558;
    if (_500)
    {
        _556 = (*spvDescriptorSet0.vp_c14)._m0[305].z;
    }
    float _564 = _556;
    float _566 = _564;
    if (_510)
    {
        _562 = (*spvDescriptorSet0.vp_c14)._m0[306].x;
    }
    float _568 = _562;
    bool _570 = _79 == 704;
    float _572 = _568;
    if (_510)
    {
        _566 = (*spvDescriptorSet0.vp_c14)._m0[306].z;
    }
    float _574 = _566;
    float _576 = _574;
    if (_520)
    {
        _572 = (*spvDescriptorSet0.vp_c14)._m0[307].x;
    }
    float _578 = _572;
    bool _580 = _79 == 720;
    float _582 = _578;
    if (_520)
    {
        _576 = (*spvDescriptorSet0.vp_c14)._m0[307].z;
    }
    float _584 = _576;
    float _586 = _584;
    if (_526)
    {
        _582 = (*spvDescriptorSet0.vp_c14)._m0[308].x;
    }
    float _588 = _582;
    bool _590 = _79 == 736;
    float _592 = _588;
    if (_526)
    {
        _586 = (*spvDescriptorSet0.vp_c14)._m0[308].z;
    }
    float _594 = _586;
    bool _596 = _79 == 752;
    float _598 = _594;
    if (_540)
    {
        _592 = (*spvDescriptorSet0.vp_c14)._m0[309].x;
    }
    float _600 = _592;
    float _602 = _600;
    if (_550)
    {
        _602 = (*spvDescriptorSet0.vp_c14)._m0[310].x;
    }
    float _604 = _602;
    float _606 = _604;
    if (_560)
    {
        _606 = (*spvDescriptorSet0.vp_c14)._m0[311].x;
    }
    float _608 = _606;
    float _610 = _608;
    if (_570)
    {
        _610 = (*spvDescriptorSet0.vp_c14)._m0[312].x;
    }
    float _612 = _610;
    float _614 = _612;
    if (_580)
    {
        _614 = (*spvDescriptorSet0.vp_c14)._m0[313].x;
    }
    float _616 = _614;
    float _618 = _616;
    if (_590)
    {
        _618 = (*spvDescriptorSet0.vp_c14)._m0[314].x;
    }
    float _620 = _618;
    float _622 = _620;
    if (_596)
    {
        _622 = (*spvDescriptorSet0.vp_c14)._m0[315].x;
    }
    float _624 = _622;
    float _626 = _368 * _624;
    if (_540)
    {
        _598 = (*spvDescriptorSet0.vp_c14)._m0[309].z;
    }
    float _628 = _598;
    float _630 = _628;
    if (_550)
    {
        _630 = (*spvDescriptorSet0.vp_c14)._m0[310].z;
    }
    float _632 = _630;
    float _634 = _626 * _68;
    float _636 = _632;
    if (_560)
    {
        _636 = (*spvDescriptorSet0.vp_c14)._m0[311].z;
    }
    float _638 = _636;
    float _640 = _638;
    if (_570)
    {
        _640 = (*spvDescriptorSet0.vp_c14)._m0[312].z;
    }
    float _642 = _640;
    float _644 = floor(_634);
    float _646 = _642;
    if (_580)
    {
        _646 = (*spvDescriptorSet0.vp_c14)._m0[313].z;
    }
    float _648 = _646;
    float _650 = _648;
    if (_590)
    {
        _650 = (*spvDescriptorSet0.vp_c14)._m0[314].z;
    }
    float _652 = _650;
    float _654 = _652;
    if (_596)
    {
        _654 = (*spvDescriptorSet0.vp_c14)._m0[315].z;
    }
    float _656 = _654;
    float _658 = -_644;
    float _660 = _634 + _658;
    float _662 = _340 * _656;
    if (!_107)
    {
        _372 = (*spvDescriptorSet0.vp_c15)._m0[6].x;
    }
    float _664 = _372;
    float _666 = _660 * 2.0;
    float _668 = -_660;
    float _670 = fma(_662, _668, _68);
    float _672 = floor(_666);
    float _674 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].w);
    float _676 = _662 * _672;
    float _678 = _676 * 0.5;
    float _680 = _678 + _670;
    float _682 = fma(_74, _680, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _684 = fma(_680, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _686 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _688 = _682 + _686;
    float _690 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _692 = _684 + _690;
    float _694 = _688 * _688;
    float _696 = fma(_692, _692, _694);
    float _698 = fma(_137, _137, _696);
    float _700 = _698;
    float _702 = _678;
    float _704 = _664;
    float _706 = _680;
    if (!_107)
    {
        float _708 = fma(_674, _664, (*spvDescriptorSet0.vp_c15)._m0[6].w);
        _141 = _708;
    }
    float _710 = _141;
    float _712 = sqrt(_698);
    float _714 = _710;
    if (!_107)
    {
        float _716 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _710);
        _714 = _716;
    }
    float _718 = _714;
    float _720 = -_322;
    float _722 = fma(_712, _314, _720);
    float _724 = precise::clamp(_722, 0.0, 1.0);
    float _726 = -_678;
    float _728 = fma(_726, _724, _680);
    float _730 = fma(_728, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _732 = fma(_730, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].z);
    if (!_107)
    {
        float _734 = fma(_732, _664, (*spvDescriptorSet0.vp_c15)._m0[6].z);
        _129 = _734;
    }
    float _736 = _129;
    float _738 = _736;
    if (!_107)
    {
        float _740 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _736);
        _700 = _740;
    }
    float _742 = _700;
    if (!_107)
    {
        float2 _2242 = float2(_742, _718);
        float _744 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2242, float2(0.0), isnan(_2242)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2242, float2(0.0), isnan(_2242)), level(0.0)).x;
        _738 = _744;
    }
    float _746 = _738;
    if (_107)
    {
        _291 = (*spvDescriptorSet0.vp_c15)._m0[14].x;
    }
    float _748 = _291;
    float _750 = _748;
    if (_107)
    {
        _702 = (*spvDescriptorSet0.vp_c15)._m0[15].x;
    }
    float _752 = _702;
    if (_107)
    {
        float _754 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, _748, (*spvDescriptorSet0.vp_c15)._m0[14].w);
        _704 = _754;
    }
    float _756 = _704;
    float _758 = _756;
    if (_107)
    {
        float _760 = fma(_730, _748, (*spvDescriptorSet0.vp_c15)._m0[14].z);
        _750 = _760;
    }
    float _762 = _750;
    float _764 = _762;
    if (_107)
    {
        float _766 = fma(_756, _752, (*spvDescriptorSet0.vp_c15)._m0[15].w);
        _758 = _766;
    }
    float _768 = _758;
    float _770 = _768;
    if (_107)
    {
        float _772 = fma(_762, _752, (*spvDescriptorSet0.vp_c15)._m0[15].z);
        _764 = _772;
    }
    float _774 = _764;
    float _776 = _774;
    if (_107)
    {
        float _778 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _768);
        _770 = _778;
    }
    float _780 = _770;
    if (_107)
    {
        float _782 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _774);
        _776 = _782;
    }
    float _784 = _776;
    float _786 = _746;
    float _788 = _784;
    if (_107)
    {
        float2 _2336 = float2(_784, _780);
        float _790 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_2336, float2(0.0), isnan(_2336)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_2336, float2(0.0), isnan(_2336)), level(0.0)).x;
        _786 = _790;
    }
    float _792 = _786;
    float _794 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _796 = (*spvDescriptorSet0.vp_c15)._m0[0].w + _794;
    float _798 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _800 = _730 + _798;
    float _802 = _796 * _796;
    float _804 = fma(_800, _800, _802);
    float _806 = sqrt(_804);
    float _808 = fma(_674, (*spvDescriptorSet0.vp_c15)._m0[8].x, (*spvDescriptorSet0.vp_c15)._m0[8].w);
    float _810 = fma(_732, (*spvDescriptorSet0.vp_c15)._m0[8].x, (*spvDescriptorSet0.vp_c15)._m0[8].z);
    float _812 = fma(_674, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].w);
    float _814 = fma(_732, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].z);
    bool _816 = _806 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _818 = (*spvDescriptorSet0.vp_c14)._m0[0].y;
    float _820 = (*spvDescriptorSet0.vp_c15)._m0[7].x;
    if (!_816)
    {
        _706 = _730;
    }
    float _822 = _706;
    float _824 = _822;
    if (!_816)
    {
        _788 = (*spvDescriptorSet0.vp_c15)._m0[0].w;
    }
    float _826 = _788;
    float _828 = fma(_792, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _830 = _828 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _832 = _826;
    if (!_816)
    {
        _818 = _828;
    }
    float _834 = _818;
    float _836 = fma(_730, (*spvDescriptorSet0.vp_c4)._m0[2].x, _830);
    float _838 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, (*spvDescriptorSet0.vp_c4)._m0[2].z, _836);
    float _840 = _838 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _842 = _834;
    if (!_816)
    {
        _820 = _840;
    }
    float _844 = _820;
    bool _846 = !_816;
    float _848 = _844;
    if (!_846)
    {
        float _850 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _852 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _854 = _806 + _852;
        float _856 = _828 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _858 = _854 * _850;
        float _860 = rsqrt(_804);
        float _862 = _858 * 0.15915493667125701904296875;
        float _864 = _862 * 6.283185482025146484375;
        float _866 = cos(_864);
        float _868 = _862 * 6.283185482025146484375;
        float _870 = sin(_868);
        float _872 = _866 + (-1.0);
        float _874 = fma(_870, _856, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _876 = _872 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _878 = _860 * _874;
        float _880 = fma(_828, _866, _876);
        float _882 = fma(_800, _878, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _884 = _880 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _886 = fma(_796, _878, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _888 = fma(_882, (*spvDescriptorSet0.vp_c4)._m0[2].x, _884);
        float _890 = fma(_886, (*spvDescriptorSet0.vp_c4)._m0[2].z, _888);
        float _892 = _890 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _842 = _880;
        _824 = _882;
        _832 = _886;
        _848 = _892;
    }
    float _894 = _842;
    float _896 = _824;
    float _898 = _832;
    float _900 = _848;
    float _902 = _894 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _904 = _894 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    out.m_40.x = _810;
    out.m_40.y = _808;
    float _906 = _828 * (*spvDescriptorSet0.vp_c4)._m0[43].y;
    float _908 = fma(_896, (*spvDescriptorSet0.vp_c4)._m0[0].x, _902);
    float _910 = fma(_896, (*spvDescriptorSet0.vp_c4)._m0[1].x, _904);
    float _912 = _828 * (*spvDescriptorSet0.vp_c4)._m0[42].y;
    float _914 = _828 * (*spvDescriptorSet0.vp_c4)._m0[44].y;
    float _916 = _828 * (*spvDescriptorSet0.vp_c4)._m0[45].y;
    out.m_42.z = _814;
    out.m_42.w = _812;
    float _918 = fma(_898, (*spvDescriptorSet0.vp_c4)._m0[0].z, _908);
    float _920 = fma(_898, (*spvDescriptorSet0.vp_c4)._m0[1].z, _910);
    float _922 = _828 * (*spvDescriptorSet0.vp_c4)._m0[49].y;
    float _924 = fma(_730, (*spvDescriptorSet0.vp_c4)._m0[42].x, _912);
    float _926 = _828 * (*spvDescriptorSet0.vp_c4)._m0[46].y;
    float _928 = _828 * (*spvDescriptorSet0.vp_c4)._m0[47].y;
    float _930 = _828 * (*spvDescriptorSet0.vp_c4)._m0[50].y;
    float _932 = _828 * (*spvDescriptorSet0.vp_c4)._m0[51].y;
    float _934 = _828 * (*spvDescriptorSet0.vp_c4)._m0[52].y;
    float _936 = _828 * (*spvDescriptorSet0.vp_c4)._m0[48].y;
    float _938 = _828 * (*spvDescriptorSet0.vp_c4)._m0[53].y;
    float _940 = fma(_730, (*spvDescriptorSet0.vp_c4)._m0[43].x, _906);
    float _942 = fma(_730, (*spvDescriptorSet0.vp_c4)._m0[44].x, _914);
    float _944 = fma(_730, (*spvDescriptorSet0.vp_c4)._m0[45].x, _916);
    out.m_44.x = _730;
    out.m_44.y = _828;
    out.m_44.z = (*spvDescriptorSet0.vp_c15)._m0[0].w;
    float _946 = fma(_730, (*spvDescriptorSet0.vp_c4)._m0[49].x, _922);
    float _948 = _920 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _950 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, (*spvDescriptorSet0.vp_c4)._m0[42].z, _924);
    float _952 = fma(_730, (*spvDescriptorSet0.vp_c4)._m0[46].x, _926);
    float _954 = fma(_730, (*spvDescriptorSet0.vp_c4)._m0[47].x, _928);
    float _956 = fma(_730, (*spvDescriptorSet0.vp_c4)._m0[50].x, _930);
    float _958 = fma(_730, (*spvDescriptorSet0.vp_c4)._m0[51].x, _932);
    float _960 = fma(_730, (*spvDescriptorSet0.vp_c4)._m0[52].x, _934);
    float _962 = fma(_730, (*spvDescriptorSet0.vp_c4)._m0[53].x, _938);
    float _964 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, (*spvDescriptorSet0.vp_c4)._m0[44].z, _942);
    float _966 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, (*spvDescriptorSet0.vp_c4)._m0[45].z, _944);
    float _968 = fma(_730, (*spvDescriptorSet0.vp_c4)._m0[48].x, _936);
    float _970 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, (*spvDescriptorSet0.vp_c4)._m0[43].z, _940);
    float _972 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, (*spvDescriptorSet0.vp_c4)._m0[49].z, _946);
    float _974 = _918 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _976 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, (*spvDescriptorSet0.vp_c4)._m0[48].z, _968);
    float _978 = _948 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _980 = _948 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _982 = _948 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _984 = _950 + (*spvDescriptorSet0.vp_c4)._m0[42].w;
    float _986 = _970 + (*spvDescriptorSet0.vp_c4)._m0[43].w;
    float _988 = _964 + (*spvDescriptorSet0.vp_c4)._m0[44].w;
    float _990 = _966 + (*spvDescriptorSet0.vp_c4)._m0[45].w;
    float _992 = _948 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _994 = fma(_974, (*spvDescriptorSet0.vp_c4)._m0[8].x, _978);
    float _996 = fma(_974, (*spvDescriptorSet0.vp_c4)._m0[7].x, _980);
    float _998 = fma(_974, (*spvDescriptorSet0.vp_c4)._m0[9].x, _982);
    float _1000 = fma(_974, (*spvDescriptorSet0.vp_c4)._m0[10].x, _992);
    out.m_46.x = _984;
    out.m_46.y = _986;
    out.m_46.z = _988;
    out.m_46.w = _990;
    float _1002 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, (*spvDescriptorSet0.vp_c4)._m0[46].z, _952);
    float _1004 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, (*spvDescriptorSet0.vp_c4)._m0[47].z, _954);
    float _1006 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, (*spvDescriptorSet0.vp_c4)._m0[50].z, _956);
    float _1008 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, (*spvDescriptorSet0.vp_c4)._m0[51].z, _958);
    float _1010 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, (*spvDescriptorSet0.vp_c4)._m0[52].z, _960);
    float _1012 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, (*spvDescriptorSet0.vp_c4)._m0[53].z, _962);
    float _1014 = fma(_900, (*spvDescriptorSet0.vp_c4)._m0[7].z, _996);
    float _1016 = _976 + (*spvDescriptorSet0.vp_c4)._m0[48].w;
    float _1018 = _1006 + (*spvDescriptorSet0.vp_c4)._m0[50].w;
    float _1020 = _1010 + (*spvDescriptorSet0.vp_c4)._m0[52].w;
    float _1022 = _1012 + (*spvDescriptorSet0.vp_c4)._m0[53].w;
    out.m_48.w = _840;
    float _1024 = fma(_900, (*spvDescriptorSet0.vp_c4)._m0[8].z, _994);
    float _1026 = _972 + (*spvDescriptorSet0.vp_c4)._m0[49].w;
    float _1028 = fma(_900, (*spvDescriptorSet0.vp_c4)._m0[9].z, _998);
    float _1030 = fma(_900, (*spvDescriptorSet0.vp_c4)._m0[10].z, _1000);
    float _1032 = -_840;
    float _1034 = -(*spvDescriptorSet0.vp_c9)._m0[72].y;
    float _1036 = _1032 + _1034;
    float _1038 = _1002 + (*spvDescriptorSet0.vp_c4)._m0[46].w;
    float _1040 = _1004 + (*spvDescriptorSet0.vp_c4)._m0[47].w;
    float _1042 = _1008 + (*spvDescriptorSet0.vp_c4)._m0[51].w;
    float _1044 = _1036 * (*spvDescriptorSet0.vp_c9)._m0[72].z;
    float _1046 = _1014 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _1048 = _1024 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _1050 = _1028 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _1052 = _1030 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.m_50.x = _1038;
    out.m_50.y = _1040;
    out.m_50.z = _1016;
    out.m_50.w = _1026;
    out.m_52.x = _1018;
    out.m_52.y = _1042;
    out.m_52.z = _1020;
    out.m_52.w = _1022;
    out.m_54.w = _1044;
    out.gl_Position.x = _1046;
    out.gl_Position.y = _1048;
    out.gl_Position.z = _1050;
    out.gl_Position.w = _1052;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_BaseInstance [[base_instance]])
{
    main0_out out = {};
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_40 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _68 = in.m_37.x;
    float _70 = in.m_37.y;
    float _72 = -(*spvDescriptorSet0.vp_c15)._m0[3].x;
    float _74 = _72 + (*spvDescriptorSet0.vp_c15)._m0[3].y;
    int _77 = 16 + as_type<int>(as_type<float>(gl_BaseInstance));
    int _79 = _77 << 4;
    bool _83 = _79 == 0;
    bool _85 = _79 == 16;
    bool _87 = _79 == 32;
    bool _89 = _79 == 48;
    bool _91 = _79 == 64;
    float _93 = fma(_74, _68, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _95 = fma(_68, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    bool _97 = _79 == 80;
    bool _99 = _70 >= 0.5;
    bool _101 = isnan(_70);
    bool _103 = _99 || _101;
    bool _105 = isnan(0.5);
    bool _107 = _103 || _105;
    float _109 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _111 = _93 + _109;
    float _113 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _115 = _95 + _113;
    float _117 = as_type<float>(gl_BaseInstance);
    if (_83)
    {
        _117 = (*spvDescriptorSet0.vp_c14)._m0[268].x;
    }
    float _119 = _117;
    float _121 = _111 * _111;
    bool _123 = _79 == 96;
    float _125 = 0.0;
    float _127 = _119;
    float _129 = (*spvDescriptorSet0.vp_c15)._m0[5].x;
    if (_83)
    {
        _125 = (*spvDescriptorSet0.vp_c14)._m0[268].z;
    }
    float _131 = _125;
    float _133 = fma(_115, _115, _121);
    float _135 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _137 = (*spvDescriptorSet0.vp_c15)._m0[0].w + _135;
    float _139 = _131;
    float _141 = _137;
    if (_85)
    {
        _127 = (*spvDescriptorSet0.vp_c14)._m0[269].x;
    }
    float _143 = _127;
    bool _145 = _79 == 112;
    float _147 = fma(_137, _137, _133);
    float _149 = _143;
    if (_85)
    {
        _139 = (*spvDescriptorSet0.vp_c14)._m0[269].z;
    }
    float _151 = _139;
    float _153 = _151;
    if (_87)
    {
        _149 = (*spvDescriptorSet0.vp_c14)._m0[270].x;
    }
    float _155 = _149;
    bool _157 = _79 == 128;
    float _159 = rsqrt(_147);
    float _161 = _155;
    if (_87)
    {
        _153 = (*spvDescriptorSet0.vp_c14)._m0[270].z;
    }
    float _163 = _153;
    float _165 = _163;
    if (_89)
    {
        _161 = (*spvDescriptorSet0.vp_c14)._m0[271].x;
    }
    float _167 = _161;
    bool _169 = _79 == 144;
    float _171 = _167;
    if (_89)
    {
        _165 = (*spvDescriptorSet0.vp_c14)._m0[271].z;
    }
    float _173 = _165;
    float _175 = _173;
    if (_91)
    {
        _171 = (*spvDescriptorSet0.vp_c14)._m0[272].x;
    }
    float _177 = _171;
    bool _179 = _79 == 160;
    float _181 = _177;
    if (_91)
    {
        _175 = (*spvDescriptorSet0.vp_c14)._m0[272].z;
    }
    float _183 = _175;
    float _185 = _183;
    if (_97)
    {
        _181 = (*spvDescriptorSet0.vp_c14)._m0[273].x;
    }
    float _187 = _181;
    float _189 = _159 * (*spvDescriptorSet0.vp_c14)._m0[268].x;
    bool _191 = _79 == 176;
    float _193 = _187;
    if (_97)
    {
        _185 = (*spvDescriptorSet0.vp_c14)._m0[273].z;
    }
    float _195 = _185;
    bool _197 = _79 == 192;
    float _199 = log2(_189);
    float _201 = _195;
    if (_123)
    {
        _193 = (*spvDescriptorSet0.vp_c14)._m0[274].x;
    }
    float _203 = _193;
    float _205 = _203;
    if (_123)
    {
        _201 = (*spvDescriptorSet0.vp_c14)._m0[274].z;
    }
    float _207 = _201;
    float _209 = _207;
    if (_145)
    {
        _205 = (*spvDescriptorSet0.vp_c14)._m0[275].x;
    }
    float _211 = _205;
    bool _213 = _79 == 208;
    float _215 = _211;
    if (_145)
    {
        _209 = (*spvDescriptorSet0.vp_c14)._m0[275].z;
    }
    float _217 = _209;
    float _219 = _217;
    if (_157)
    {
        _215 = (*spvDescriptorSet0.vp_c14)._m0[276].x;
    }
    float _221 = _215;
    bool _223 = _79 == 224;
    float _225 = _221;
    if (_157)
    {
        _219 = (*spvDescriptorSet0.vp_c14)._m0[276].z;
    }
    float _227 = _219;
    float _229 = _199 + 1.2999999523162841796875;
    float _231 = _227;
    if (_169)
    {
        _225 = (*spvDescriptorSet0.vp_c14)._m0[277].x;
    }
    float _233 = _225;
    bool _235 = _79 == 240;
    float _237 = _233;
    if (_169)
    {
        _231 = (*spvDescriptorSet0.vp_c14)._m0[277].z;
    }
    float _239 = _231;
    float _241 = trunc(_229);
    int _243 = int(_241);
    float _245 = _239;
    if (_179)
    {
        _237 = (*spvDescriptorSet0.vp_c14)._m0[278].x;
    }
    float _247 = _237;
    bool _249 = _79 == 256;
    float _251 = _247;
    if (_179)
    {
        _245 = (*spvDescriptorSet0.vp_c14)._m0[278].z;
    }
    float _253 = _245;
    float _255 = _253;
    if (_191)
    {
        _251 = (*spvDescriptorSet0.vp_c14)._m0[279].x;
    }
    float _257 = _251;
    bool _259 = _79 == 272;
    float _261 = _257;
    if (_191)
    {
        _255 = (*spvDescriptorSet0.vp_c14)._m0[279].z;
    }
    float _263 = _255;
    float _265 = _263;
    if (_197)
    {
        _261 = (*spvDescriptorSet0.vp_c14)._m0[280].x;
    }
    float _267 = _261;
    bool _269 = _79 == 288;
    int _271 = min(_243, 15);
    float _273 = _267;
    if (_197)
    {
        _265 = (*spvDescriptorSet0.vp_c14)._m0[280].z;
    }
    float _275 = _265;
    bool _277 = _79 == 304;
    float _279 = float(_271);
    float _281 = _275;
    if (_213)
    {
        _273 = (*spvDescriptorSet0.vp_c14)._m0[281].x;
    }
    float _283 = _273;
    int _285 = _271 << 4;
    int _287 = _285 + 4288;
    float _289 = _283;
    float _291 = as_type<float>(_287);
    if (_213)
    {
        _281 = (*spvDescriptorSet0.vp_c14)._m0[281].z;
    }
    float _293 = _281;
    float _295 = _293;
    if (_223)
    {
        _289 = (*spvDescriptorSet0.vp_c14)._m0[282].x;
    }
    float _297 = _289;
    float _299 = -_279;
    float _301 = _299 + (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _303 = _79 == 320;
    int _305 = _287 + 8;
    uint _308 = uint(int(uint(_305) >> uint(2)));
    uint _310 = uint(int(uint(int(_308)) >> uint(2)));
    int _312 = int(_308) & 3;
    float _314 = (*spvDescriptorSet0.vp_c14)._m0[int(_310)][_312];
    int _316 = int(_308) + 1;
    uint _318 = uint(int(uint(_316) >> uint(2)));
    int _320 = _316 & 3;
    float _322 = (*spvDescriptorSet0.vp_c14)._m0[int(_318)][_320];
    float _324 = _297;
    if (_223)
    {
        _295 = (*spvDescriptorSet0.vp_c14)._m0[282].z;
    }
    float _326 = _295;
    float _328 = _301 + 1.0;
    float _330 = _326;
    if (_235)
    {
        _324 = (*spvDescriptorSet0.vp_c14)._m0[283].x;
    }
    float _332 = _324;
    bool _334 = _79 == 336;
    float _336 = _332;
    if (_235)
    {
        _330 = (*spvDescriptorSet0.vp_c14)._m0[283].z;
    }
    float _338 = _330;
    float _340 = exp2(_328);
    float _342 = _338;
    if (_249)
    {
        _336 = (*spvDescriptorSet0.vp_c14)._m0[284].x;
    }
    float _344 = _336;
    bool _346 = _79 == 352;
    float _348 = _344;
    if (_249)
    {
        _342 = (*spvDescriptorSet0.vp_c14)._m0[284].z;
    }
    float _350 = _342;
    float _352 = _350;
    if (_259)
    {
        _348 = (*spvDescriptorSet0.vp_c14)._m0[285].x;
    }
    float _354 = _348;
    bool _356 = _79 == 368;
    float _358 = _354;
    if (_259)
    {
        _352 = (*spvDescriptorSet0.vp_c14)._m0[285].z;
    }
    float _360 = _352;
    float _362 = _360;
    if (_269)
    {
        _358 = (*spvDescriptorSet0.vp_c14)._m0[286].x;
    }
    float _364 = _358;
    bool _366 = _79 == 384;
    float _368 = 1.0 / _340;
    float _370 = _364;
    float _372 = _340;
    if (_269)
    {
        _362 = (*spvDescriptorSet0.vp_c14)._m0[286].z;
    }
    float _374 = _362;
    float _376 = _374;
    if (_277)
    {
        _370 = (*spvDescriptorSet0.vp_c14)._m0[287].x;
    }
    float _378 = _370;
    bool _380 = _79 == 400;
    float _382 = _378;
    if (_277)
    {
        _376 = (*spvDescriptorSet0.vp_c14)._m0[287].z;
    }
    float _384 = _376;
    bool _386 = _79 == 416;
    float _388 = _384;
    if (_303)
    {
        _382 = (*spvDescriptorSet0.vp_c14)._m0[288].x;
    }
    float _390 = _382;
    float _392 = _390;
    if (_303)
    {
        _388 = (*spvDescriptorSet0.vp_c14)._m0[288].z;
    }
    float _394 = _388;
    float _396 = _394;
    if (_334)
    {
        _392 = (*spvDescriptorSet0.vp_c14)._m0[289].x;
    }
    float _398 = _392;
    bool _400 = _79 == 432;
    float _402 = _398;
    if (_334)
    {
        _396 = (*spvDescriptorSet0.vp_c14)._m0[289].z;
    }
    float _404 = _396;
    float _406 = _404;
    if (_346)
    {
        _402 = (*spvDescriptorSet0.vp_c14)._m0[290].x;
    }
    float _408 = _402;
    bool _410 = _79 == 448;
    float _412 = _408;
    if (_346)
    {
        _406 = (*spvDescriptorSet0.vp_c14)._m0[290].z;
    }
    float _414 = _406;
    float _416 = _414;
    if (_356)
    {
        _412 = (*spvDescriptorSet0.vp_c14)._m0[291].x;
    }
    float _418 = _412;
    bool _420 = _79 == 464;
    float _422 = _418;
    if (_356)
    {
        _416 = (*spvDescriptorSet0.vp_c14)._m0[291].z;
    }
    float _424 = _416;
    float _426 = _424;
    if (_366)
    {
        _422 = (*spvDescriptorSet0.vp_c14)._m0[292].x;
    }
    float _428 = _422;
    bool _430 = _79 == 480;
    float _432 = _428;
    if (_366)
    {
        _426 = (*spvDescriptorSet0.vp_c14)._m0[292].z;
    }
    float _434 = _426;
    float _436 = _434;
    if (_380)
    {
        _432 = (*spvDescriptorSet0.vp_c14)._m0[293].x;
    }
    float _438 = _432;
    bool _440 = _79 == 496;
    float _442 = _438;
    if (_380)
    {
        _436 = (*spvDescriptorSet0.vp_c14)._m0[293].z;
    }
    float _444 = _436;
    float _446 = _444;
    if (_386)
    {
        _442 = (*spvDescriptorSet0.vp_c14)._m0[294].x;
    }
    float _448 = _442;
    bool _450 = _79 == 512;
    float _452 = _448;
    if (_386)
    {
        _446 = (*spvDescriptorSet0.vp_c14)._m0[294].z;
    }
    float _454 = _446;
    bool _456 = _79 == 528;
    float _458 = _454;
    if (_400)
    {
        _452 = (*spvDescriptorSet0.vp_c14)._m0[295].x;
    }
    float _460 = _452;
    float _462 = _460;
    if (_400)
    {
        _458 = (*spvDescriptorSet0.vp_c14)._m0[295].z;
    }
    float _464 = _458;
    float _466 = _464;
    if (_410)
    {
        _462 = (*spvDescriptorSet0.vp_c14)._m0[296].x;
    }
    float _468 = _462;
    bool _470 = _79 == 544;
    float _472 = _468;
    if (_410)
    {
        _466 = (*spvDescriptorSet0.vp_c14)._m0[296].z;
    }
    float _474 = _466;
    float _476 = _474;
    if (_420)
    {
        _472 = (*spvDescriptorSet0.vp_c14)._m0[297].x;
    }
    float _478 = _472;
    bool _480 = _79 == 560;
    float _482 = _478;
    if (_420)
    {
        _476 = (*spvDescriptorSet0.vp_c14)._m0[297].z;
    }
    float _484 = _476;
    float _486 = _484;
    if (_430)
    {
        _482 = (*spvDescriptorSet0.vp_c14)._m0[298].x;
    }
    float _488 = _482;
    bool _490 = _79 == 576;
    float _492 = _488;
    if (_430)
    {
        _486 = (*spvDescriptorSet0.vp_c14)._m0[298].z;
    }
    float _494 = _486;
    float _496 = _494;
    if (_440)
    {
        _492 = (*spvDescriptorSet0.vp_c14)._m0[299].x;
    }
    float _498 = _492;
    bool _500 = _79 == 592;
    float _502 = _498;
    if (_440)
    {
        _496 = (*spvDescriptorSet0.vp_c14)._m0[299].z;
    }
    float _504 = _496;
    float _506 = _504;
    if (_450)
    {
        _502 = (*spvDescriptorSet0.vp_c14)._m0[300].x;
    }
    float _508 = _502;
    bool _510 = _79 == 608;
    float _512 = _508;
    if (_450)
    {
        _506 = (*spvDescriptorSet0.vp_c14)._m0[300].z;
    }
    float _514 = _506;
    float _516 = _514;
    if (_456)
    {
        _512 = (*spvDescriptorSet0.vp_c14)._m0[301].x;
    }
    float _518 = _512;
    bool _520 = _79 == 624;
    float _522 = _518;
    if (_456)
    {
        _516 = (*spvDescriptorSet0.vp_c14)._m0[301].z;
    }
    float _524 = _516;
    bool _526 = _79 == 640;
    float _528 = _524;
    if (_470)
    {
        _522 = (*spvDescriptorSet0.vp_c14)._m0[302].x;
    }
    float _530 = _522;
    float _532 = _530;
    if (_470)
    {
        _528 = (*spvDescriptorSet0.vp_c14)._m0[302].z;
    }
    float _534 = _528;
    float _536 = _534;
    if (_480)
    {
        _532 = (*spvDescriptorSet0.vp_c14)._m0[303].x;
    }
    float _538 = _532;
    bool _540 = _79 == 656;
    float _542 = _538;
    if (_480)
    {
        _536 = (*spvDescriptorSet0.vp_c14)._m0[303].z;
    }
    float _544 = _536;
    float _546 = _544;
    if (_490)
    {
        _542 = (*spvDescriptorSet0.vp_c14)._m0[304].x;
    }
    float _548 = _542;
    bool _550 = _79 == 672;
    float _552 = _548;
    if (_490)
    {
        _546 = (*spvDescriptorSet0.vp_c14)._m0[304].z;
    }
    float _554 = _546;
    float _556 = _554;
    if (_500)
    {
        _552 = (*spvDescriptorSet0.vp_c14)._m0[305].x;
    }
    float _558 = _552;
    bool _560 = _79 == 688;
    float _562 = _558;
    if (_500)
    {
        _556 = (*spvDescriptorSet0.vp_c14)._m0[305].z;
    }
    float _564 = _556;
    float _566 = _564;
    if (_510)
    {
        _562 = (*spvDescriptorSet0.vp_c14)._m0[306].x;
    }
    float _568 = _562;
    bool _570 = _79 == 704;
    float _572 = _568;
    if (_510)
    {
        _566 = (*spvDescriptorSet0.vp_c14)._m0[306].z;
    }
    float _574 = _566;
    float _576 = _574;
    if (_520)
    {
        _572 = (*spvDescriptorSet0.vp_c14)._m0[307].x;
    }
    float _578 = _572;
    bool _580 = _79 == 720;
    float _582 = _578;
    if (_520)
    {
        _576 = (*spvDescriptorSet0.vp_c14)._m0[307].z;
    }
    float _584 = _576;
    float _586 = _584;
    if (_526)
    {
        _582 = (*spvDescriptorSet0.vp_c14)._m0[308].x;
    }
    float _588 = _582;
    bool _590 = _79 == 736;
    float _592 = _588;
    if (_526)
    {
        _586 = (*spvDescriptorSet0.vp_c14)._m0[308].z;
    }
    float _594 = _586;
    bool _596 = _79 == 752;
    float _598 = _594;
    if (_540)
    {
        _592 = (*spvDescriptorSet0.vp_c14)._m0[309].x;
    }
    float _600 = _592;
    float _602 = _600;
    if (_550)
    {
        _602 = (*spvDescriptorSet0.vp_c14)._m0[310].x;
    }
    float _604 = _602;
    float _606 = _604;
    if (_560)
    {
        _606 = (*spvDescriptorSet0.vp_c14)._m0[311].x;
    }
    float _608 = _606;
    float _610 = _608;
    if (_570)
    {
        _610 = (*spvDescriptorSet0.vp_c14)._m0[312].x;
    }
    float _612 = _610;
    float _614 = _612;
    if (_580)
    {
        _614 = (*spvDescriptorSet0.vp_c14)._m0[313].x;
    }
    float _616 = _614;
    float _618 = _616;
    if (_590)
    {
        _618 = (*spvDescriptorSet0.vp_c14)._m0[314].x;
    }
    float _620 = _618;
    float _622 = _620;
    if (_596)
    {
        _622 = (*spvDescriptorSet0.vp_c14)._m0[315].x;
    }
    float _624 = _622;
    float _626 = _368 * _624;
    if (_540)
    {
        _598 = (*spvDescriptorSet0.vp_c14)._m0[309].z;
    }
    float _628 = _598;
    float _630 = _628;
    if (_550)
    {
        _630 = (*spvDescriptorSet0.vp_c14)._m0[310].z;
    }
    float _632 = _630;
    float _634 = _626 * _68;
    float _636 = _632;
    if (_560)
    {
        _636 = (*spvDescriptorSet0.vp_c14)._m0[311].z;
    }
    float _638 = _636;
    float _640 = _638;
    if (_570)
    {
        _640 = (*spvDescriptorSet0.vp_c14)._m0[312].z;
    }
    float _642 = _640;
    float _644 = floor(_634);
    float _646 = _642;
    if (_580)
    {
        _646 = (*spvDescriptorSet0.vp_c14)._m0[313].z;
    }
    float _648 = _646;
    float _650 = _648;
    if (_590)
    {
        _650 = (*spvDescriptorSet0.vp_c14)._m0[314].z;
    }
    float _652 = _650;
    float _654 = _652;
    if (_596)
    {
        _654 = (*spvDescriptorSet0.vp_c14)._m0[315].z;
    }
    float _656 = _654;
    float _658 = -_644;
    float _660 = _634 + _658;
    float _662 = _340 * _656;
    if (!_107)
    {
        _372 = (*spvDescriptorSet0.vp_c15)._m0[6].x;
    }
    float _664 = _372;
    float _666 = _660 * 2.0;
    float _668 = -_660;
    float _670 = fma(_662, _668, _68);
    float _672 = floor(_666);
    float _674 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].w);
    float _676 = _662 * _672;
    float _678 = _676 * 0.5;
    float _680 = _678 + _670;
    float _682 = fma(_74, _680, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _684 = fma(_680, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _686 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _688 = _682 + _686;
    float _690 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _692 = _684 + _690;
    float _694 = _688 * _688;
    float _696 = fma(_692, _692, _694);
    float _698 = fma(_137, _137, _696);
    float _700 = _698;
    float _702 = _678;
    float _704 = _664;
    float _706 = _680;
    if (!_107)
    {
        float _708 = fma(_674, _664, (*spvDescriptorSet0.vp_c15)._m0[6].w);
        _141 = _708;
    }
    float _710 = _141;
    float _712 = sqrt(_698);
    float _714 = _710;
    if (!_107)
    {
        float _716 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _710);
        _714 = _716;
    }
    float _718 = _714;
    float _720 = -_322;
    float _722 = fma(_712, _314, _720);
    float _724 = precise::clamp(_722, 0.0, 1.0);
    float _726 = -_678;
    float _728 = fma(_726, _724, _680);
    float _730 = fma(_728, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _732 = fma(_730, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].z);
    if (!_107)
    {
        float _734 = fma(_732, _664, (*spvDescriptorSet0.vp_c15)._m0[6].z);
        _129 = _734;
    }
    float _736 = _129;
    float _738 = _736;
    if (!_107)
    {
        float _740 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _736);
        _700 = _740;
    }
    float _742 = _700;
    if (!_107)
    {
        float2 _2242 = float2(_742, _718);
        float _744 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2242, float2(0.0), isnan(_2242)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2242, float2(0.0), isnan(_2242)), level(0.0)).x;
        _738 = _744;
    }
    float _746 = _738;
    if (_107)
    {
        _291 = (*spvDescriptorSet0.vp_c15)._m0[14].x;
    }
    float _748 = _291;
    float _750 = _748;
    if (_107)
    {
        _702 = (*spvDescriptorSet0.vp_c15)._m0[15].x;
    }
    float _752 = _702;
    if (_107)
    {
        float _754 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, _748, (*spvDescriptorSet0.vp_c15)._m0[14].w);
        _704 = _754;
    }
    float _756 = _704;
    float _758 = _756;
    if (_107)
    {
        float _760 = fma(_730, _748, (*spvDescriptorSet0.vp_c15)._m0[14].z);
        _750 = _760;
    }
    float _762 = _750;
    float _764 = _762;
    if (_107)
    {
        float _766 = fma(_756, _752, (*spvDescriptorSet0.vp_c15)._m0[15].w);
        _758 = _766;
    }
    float _768 = _758;
    float _770 = _768;
    if (_107)
    {
        float _772 = fma(_762, _752, (*spvDescriptorSet0.vp_c15)._m0[15].z);
        _764 = _772;
    }
    float _774 = _764;
    float _776 = _774;
    if (_107)
    {
        float _778 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _768);
        _770 = _778;
    }
    float _780 = _770;
    if (_107)
    {
        float _782 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _774);
        _776 = _782;
    }
    float _784 = _776;
    float _786 = _746;
    float _788 = _784;
    if (_107)
    {
        float2 _2336 = float2(_784, _780);
        float _790 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_2336, float2(0.0), isnan(_2336)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_2336, float2(0.0), isnan(_2336)), level(0.0)).x;
        _786 = _790;
    }
    float _792 = _786;
    float _794 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _796 = (*spvDescriptorSet0.vp_c15)._m0[0].w + _794;
    float _798 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _800 = _730 + _798;
    float _802 = _796 * _796;
    float _804 = fma(_800, _800, _802);
    float _806 = sqrt(_804);
    float _808 = fma(_674, (*spvDescriptorSet0.vp_c15)._m0[8].x, (*spvDescriptorSet0.vp_c15)._m0[8].w);
    float _810 = fma(_732, (*spvDescriptorSet0.vp_c15)._m0[8].x, (*spvDescriptorSet0.vp_c15)._m0[8].z);
    float _812 = fma(_674, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].w);
    float _814 = fma(_732, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].z);
    bool _816 = _806 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _818 = (*spvDescriptorSet0.vp_c14)._m0[0].y;
    float _820 = (*spvDescriptorSet0.vp_c15)._m0[7].x;
    if (!_816)
    {
        _706 = _730;
    }
    float _822 = _706;
    float _824 = _822;
    if (!_816)
    {
        _788 = (*spvDescriptorSet0.vp_c15)._m0[0].w;
    }
    float _826 = _788;
    float _828 = fma(_792, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _830 = _828 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _832 = _826;
    if (!_816)
    {
        _818 = _828;
    }
    float _834 = _818;
    float _836 = fma(_730, (*spvDescriptorSet0.vp_c4)._m0[2].x, _830);
    float _838 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, (*spvDescriptorSet0.vp_c4)._m0[2].z, _836);
    float _840 = _838 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _842 = _834;
    if (!_816)
    {
        _820 = _840;
    }
    float _844 = _820;
    bool _846 = !_816;
    float _848 = _844;
    if (!_846)
    {
        float _850 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _852 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _854 = _806 + _852;
        float _856 = _828 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _858 = _854 * _850;
        float _860 = rsqrt(_804);
        float _862 = _858 * 0.15915493667125701904296875;
        float _864 = _862 * 6.283185482025146484375;
        float _866 = cos(_864);
        float _868 = _862 * 6.283185482025146484375;
        float _870 = sin(_868);
        float _872 = _866 + (-1.0);
        float _874 = fma(_870, _856, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _876 = _872 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _878 = _860 * _874;
        float _880 = fma(_828, _866, _876);
        float _882 = fma(_800, _878, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _884 = _880 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _886 = fma(_796, _878, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _888 = fma(_882, (*spvDescriptorSet0.vp_c4)._m0[2].x, _884);
        float _890 = fma(_886, (*spvDescriptorSet0.vp_c4)._m0[2].z, _888);
        float _892 = _890 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _842 = _880;
        _824 = _882;
        _832 = _886;
        _848 = _892;
    }
    float _894 = _842;
    float _896 = _824;
    float _898 = _832;
    float _900 = _848;
    float _902 = _894 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _904 = _894 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    out.m_40.x = _810;
    out.m_40.y = _808;
    float _906 = _828 * (*spvDescriptorSet0.vp_c4)._m0[43].y;
    float _908 = fma(_896, (*spvDescriptorSet0.vp_c4)._m0[0].x, _902);
    float _910 = fma(_896, (*spvDescriptorSet0.vp_c4)._m0[1].x, _904);
    float _912 = _828 * (*spvDescriptorSet0.vp_c4)._m0[42].y;
    float _914 = _828 * (*spvDescriptorSet0.vp_c4)._m0[44].y;
    float _916 = _828 * (*spvDescriptorSet0.vp_c4)._m0[45].y;
    out.m_42.z = _814;
    out.m_42.w = _812;
    float _918 = fma(_898, (*spvDescriptorSet0.vp_c4)._m0[0].z, _908);
    float _920 = fma(_898, (*spvDescriptorSet0.vp_c4)._m0[1].z, _910);
    float _922 = _828 * (*spvDescriptorSet0.vp_c4)._m0[49].y;
    float _924 = fma(_730, (*spvDescriptorSet0.vp_c4)._m0[42].x, _912);
    float _926 = _828 * (*spvDescriptorSet0.vp_c4)._m0[46].y;
    float _928 = _828 * (*spvDescriptorSet0.vp_c4)._m0[47].y;
    float _930 = _828 * (*spvDescriptorSet0.vp_c4)._m0[50].y;
    float _932 = _828 * (*spvDescriptorSet0.vp_c4)._m0[51].y;
    float _934 = _828 * (*spvDescriptorSet0.vp_c4)._m0[52].y;
    float _936 = _828 * (*spvDescriptorSet0.vp_c4)._m0[48].y;
    float _938 = _828 * (*spvDescriptorSet0.vp_c4)._m0[53].y;
    float _940 = fma(_730, (*spvDescriptorSet0.vp_c4)._m0[43].x, _906);
    float _942 = fma(_730, (*spvDescriptorSet0.vp_c4)._m0[44].x, _914);
    float _944 = fma(_730, (*spvDescriptorSet0.vp_c4)._m0[45].x, _916);
    out.m_44.x = _730;
    out.m_44.y = _828;
    out.m_44.z = (*spvDescriptorSet0.vp_c15)._m0[0].w;
    float _946 = fma(_730, (*spvDescriptorSet0.vp_c4)._m0[49].x, _922);
    float _948 = _920 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _950 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, (*spvDescriptorSet0.vp_c4)._m0[42].z, _924);
    float _952 = fma(_730, (*spvDescriptorSet0.vp_c4)._m0[46].x, _926);
    float _954 = fma(_730, (*spvDescriptorSet0.vp_c4)._m0[47].x, _928);
    float _956 = fma(_730, (*spvDescriptorSet0.vp_c4)._m0[50].x, _930);
    float _958 = fma(_730, (*spvDescriptorSet0.vp_c4)._m0[51].x, _932);
    float _960 = fma(_730, (*spvDescriptorSet0.vp_c4)._m0[52].x, _934);
    float _962 = fma(_730, (*spvDescriptorSet0.vp_c4)._m0[53].x, _938);
    float _964 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, (*spvDescriptorSet0.vp_c4)._m0[44].z, _942);
    float _966 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, (*spvDescriptorSet0.vp_c4)._m0[45].z, _944);
    float _968 = fma(_730, (*spvDescriptorSet0.vp_c4)._m0[48].x, _936);
    float _970 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, (*spvDescriptorSet0.vp_c4)._m0[43].z, _940);
    float _972 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, (*spvDescriptorSet0.vp_c4)._m0[49].z, _946);
    float _974 = _918 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _976 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, (*spvDescriptorSet0.vp_c4)._m0[48].z, _968);
    float _978 = _948 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _980 = _948 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _982 = _948 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _984 = _950 + (*spvDescriptorSet0.vp_c4)._m0[42].w;
    float _986 = _970 + (*spvDescriptorSet0.vp_c4)._m0[43].w;
    float _988 = _964 + (*spvDescriptorSet0.vp_c4)._m0[44].w;
    float _990 = _966 + (*spvDescriptorSet0.vp_c4)._m0[45].w;
    float _992 = _948 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _994 = fma(_974, (*spvDescriptorSet0.vp_c4)._m0[8].x, _978);
    float _996 = fma(_974, (*spvDescriptorSet0.vp_c4)._m0[7].x, _980);
    float _998 = fma(_974, (*spvDescriptorSet0.vp_c4)._m0[9].x, _982);
    float _1000 = fma(_974, (*spvDescriptorSet0.vp_c4)._m0[10].x, _992);
    out.m_46.x = _984;
    out.m_46.y = _986;
    out.m_46.z = _988;
    out.m_46.w = _990;
    float _1002 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, (*spvDescriptorSet0.vp_c4)._m0[46].z, _952);
    float _1004 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, (*spvDescriptorSet0.vp_c4)._m0[47].z, _954);
    float _1006 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, (*spvDescriptorSet0.vp_c4)._m0[50].z, _956);
    float _1008 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, (*spvDescriptorSet0.vp_c4)._m0[51].z, _958);
    float _1010 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, (*spvDescriptorSet0.vp_c4)._m0[52].z, _960);
    float _1012 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, (*spvDescriptorSet0.vp_c4)._m0[53].z, _962);
    float _1014 = fma(_900, (*spvDescriptorSet0.vp_c4)._m0[7].z, _996);
    float _1016 = _976 + (*spvDescriptorSet0.vp_c4)._m0[48].w;
    float _1018 = _1006 + (*spvDescriptorSet0.vp_c4)._m0[50].w;
    float _1020 = _1010 + (*spvDescriptorSet0.vp_c4)._m0[52].w;
    float _1022 = _1012 + (*spvDescriptorSet0.vp_c4)._m0[53].w;
    out.m_48.w = _840;
    float _1024 = fma(_900, (*spvDescriptorSet0.vp_c4)._m0[8].z, _994);
    float _1026 = _972 + (*spvDescriptorSet0.vp_c4)._m0[49].w;
    float _1028 = fma(_900, (*spvDescriptorSet0.vp_c4)._m0[9].z, _998);
    float _1030 = fma(_900, (*spvDescriptorSet0.vp_c4)._m0[10].z, _1000);
    float _1032 = -_840;
    float _1034 = -(*spvDescriptorSet0.vp_c9)._m0[72].y;
    float _1036 = _1032 + _1034;
    float _1038 = _1002 + (*spvDescriptorSet0.vp_c4)._m0[46].w;
    float _1040 = _1004 + (*spvDescriptorSet0.vp_c4)._m0[47].w;
    float _1042 = _1008 + (*spvDescriptorSet0.vp_c4)._m0[51].w;
    float _1044 = _1036 * (*spvDescriptorSet0.vp_c9)._m0[72].z;
    float _1046 = _1014 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _1048 = _1024 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _1050 = _1028 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _1052 = _1030 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.m_50.x = _1038;
    out.m_50.y = _1040;
    out.m_50.z = _1016;
    out.m_50.w = _1026;
    out.m_52.x = _1018;
    out.m_52.y = _1042;
    out.m_52.z = _1020;
    out.m_52.w = _1022;
    out.m_54.w = _1044;
    out.gl_Position.x = _1046;
    out.gl_Position.y = _1048;
    out.gl_Position.z = _1050;
    out.gl_Position.w = _1052;
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
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_40 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _68 = in.m_37.x;
    float _70 = in.m_37.y;
    float _72 = -(*spvDescriptorSet0.vp_c15)._m0[3].x;
    float _74 = _72 + (*spvDescriptorSet0.vp_c15)._m0[3].y;
    int _77 = 16 + as_type<int>(as_type<float>(gl_BaseInstance));
    int _79 = _77 << 4;
    bool _83 = _79 == 0;
    bool _85 = _79 == 16;
    bool _87 = _79 == 32;
    bool _89 = _79 == 48;
    bool _91 = _79 == 64;
    float _93 = fma(_74, _68, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _95 = fma(_68, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    bool _97 = _79 == 80;
    bool _99 = _70 >= 0.5;
    bool _101 = isnan(_70);
    bool _103 = _99 || _101;
    bool _105 = isnan(0.5);
    bool _107 = _103 || _105;
    float _109 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _111 = _93 + _109;
    float _113 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _115 = _95 + _113;
    float _117 = as_type<float>(gl_BaseInstance);
    if (_83)
    {
        _117 = (*spvDescriptorSet0.vp_c14)._m0[268].x;
    }
    float _119 = _117;
    float _121 = _111 * _111;
    bool _123 = _79 == 96;
    float _125 = 0.0;
    float _127 = _119;
    float _129 = (*spvDescriptorSet0.vp_c15)._m0[5].x;
    if (_83)
    {
        _125 = (*spvDescriptorSet0.vp_c14)._m0[268].z;
    }
    float _131 = _125;
    float _133 = fma(_115, _115, _121);
    float _135 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _137 = (*spvDescriptorSet0.vp_c15)._m0[0].w + _135;
    float _139 = _131;
    float _141 = _137;
    if (_85)
    {
        _127 = (*spvDescriptorSet0.vp_c14)._m0[269].x;
    }
    float _143 = _127;
    bool _145 = _79 == 112;
    float _147 = fma(_137, _137, _133);
    float _149 = _143;
    if (_85)
    {
        _139 = (*spvDescriptorSet0.vp_c14)._m0[269].z;
    }
    float _151 = _139;
    float _153 = _151;
    if (_87)
    {
        _149 = (*spvDescriptorSet0.vp_c14)._m0[270].x;
    }
    float _155 = _149;
    bool _157 = _79 == 128;
    float _159 = rsqrt(_147);
    float _161 = _155;
    if (_87)
    {
        _153 = (*spvDescriptorSet0.vp_c14)._m0[270].z;
    }
    float _163 = _153;
    float _165 = _163;
    if (_89)
    {
        _161 = (*spvDescriptorSet0.vp_c14)._m0[271].x;
    }
    float _167 = _161;
    bool _169 = _79 == 144;
    float _171 = _167;
    if (_89)
    {
        _165 = (*spvDescriptorSet0.vp_c14)._m0[271].z;
    }
    float _173 = _165;
    float _175 = _173;
    if (_91)
    {
        _171 = (*spvDescriptorSet0.vp_c14)._m0[272].x;
    }
    float _177 = _171;
    bool _179 = _79 == 160;
    float _181 = _177;
    if (_91)
    {
        _175 = (*spvDescriptorSet0.vp_c14)._m0[272].z;
    }
    float _183 = _175;
    float _185 = _183;
    if (_97)
    {
        _181 = (*spvDescriptorSet0.vp_c14)._m0[273].x;
    }
    float _187 = _181;
    float _189 = _159 * (*spvDescriptorSet0.vp_c14)._m0[268].x;
    bool _191 = _79 == 176;
    float _193 = _187;
    if (_97)
    {
        _185 = (*spvDescriptorSet0.vp_c14)._m0[273].z;
    }
    float _195 = _185;
    bool _197 = _79 == 192;
    float _199 = log2(_189);
    float _201 = _195;
    if (_123)
    {
        _193 = (*spvDescriptorSet0.vp_c14)._m0[274].x;
    }
    float _203 = _193;
    float _205 = _203;
    if (_123)
    {
        _201 = (*spvDescriptorSet0.vp_c14)._m0[274].z;
    }
    float _207 = _201;
    float _209 = _207;
    if (_145)
    {
        _205 = (*spvDescriptorSet0.vp_c14)._m0[275].x;
    }
    float _211 = _205;
    bool _213 = _79 == 208;
    float _215 = _211;
    if (_145)
    {
        _209 = (*spvDescriptorSet0.vp_c14)._m0[275].z;
    }
    float _217 = _209;
    float _219 = _217;
    if (_157)
    {
        _215 = (*spvDescriptorSet0.vp_c14)._m0[276].x;
    }
    float _221 = _215;
    bool _223 = _79 == 224;
    float _225 = _221;
    if (_157)
    {
        _219 = (*spvDescriptorSet0.vp_c14)._m0[276].z;
    }
    float _227 = _219;
    float _229 = _199 + 1.2999999523162841796875;
    float _231 = _227;
    if (_169)
    {
        _225 = (*spvDescriptorSet0.vp_c14)._m0[277].x;
    }
    float _233 = _225;
    bool _235 = _79 == 240;
    float _237 = _233;
    if (_169)
    {
        _231 = (*spvDescriptorSet0.vp_c14)._m0[277].z;
    }
    float _239 = _231;
    float _241 = trunc(_229);
    int _243 = int(_241);
    float _245 = _239;
    if (_179)
    {
        _237 = (*spvDescriptorSet0.vp_c14)._m0[278].x;
    }
    float _247 = _237;
    bool _249 = _79 == 256;
    float _251 = _247;
    if (_179)
    {
        _245 = (*spvDescriptorSet0.vp_c14)._m0[278].z;
    }
    float _253 = _245;
    float _255 = _253;
    if (_191)
    {
        _251 = (*spvDescriptorSet0.vp_c14)._m0[279].x;
    }
    float _257 = _251;
    bool _259 = _79 == 272;
    float _261 = _257;
    if (_191)
    {
        _255 = (*spvDescriptorSet0.vp_c14)._m0[279].z;
    }
    float _263 = _255;
    float _265 = _263;
    if (_197)
    {
        _261 = (*spvDescriptorSet0.vp_c14)._m0[280].x;
    }
    float _267 = _261;
    bool _269 = _79 == 288;
    int _271 = min(_243, 15);
    float _273 = _267;
    if (_197)
    {
        _265 = (*spvDescriptorSet0.vp_c14)._m0[280].z;
    }
    float _275 = _265;
    bool _277 = _79 == 304;
    float _279 = float(_271);
    float _281 = _275;
    if (_213)
    {
        _273 = (*spvDescriptorSet0.vp_c14)._m0[281].x;
    }
    float _283 = _273;
    int _285 = _271 << 4;
    int _287 = _285 + 4288;
    float _289 = _283;
    float _291 = as_type<float>(_287);
    if (_213)
    {
        _281 = (*spvDescriptorSet0.vp_c14)._m0[281].z;
    }
    float _293 = _281;
    float _295 = _293;
    if (_223)
    {
        _289 = (*spvDescriptorSet0.vp_c14)._m0[282].x;
    }
    float _297 = _289;
    float _299 = -_279;
    float _301 = _299 + (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _303 = _79 == 320;
    int _305 = _287 + 8;
    uint _308 = uint(int(uint(_305) >> uint(2)));
    uint _310 = uint(int(uint(int(_308)) >> uint(2)));
    int _312 = int(_308) & 3;
    float _314 = (*spvDescriptorSet0.vp_c14)._m0[int(_310)][_312];
    int _316 = int(_308) + 1;
    uint _318 = uint(int(uint(_316) >> uint(2)));
    int _320 = _316 & 3;
    float _322 = (*spvDescriptorSet0.vp_c14)._m0[int(_318)][_320];
    float _324 = _297;
    if (_223)
    {
        _295 = (*spvDescriptorSet0.vp_c14)._m0[282].z;
    }
    float _326 = _295;
    float _328 = _301 + 1.0;
    float _330 = _326;
    if (_235)
    {
        _324 = (*spvDescriptorSet0.vp_c14)._m0[283].x;
    }
    float _332 = _324;
    bool _334 = _79 == 336;
    float _336 = _332;
    if (_235)
    {
        _330 = (*spvDescriptorSet0.vp_c14)._m0[283].z;
    }
    float _338 = _330;
    float _340 = exp2(_328);
    float _342 = _338;
    if (_249)
    {
        _336 = (*spvDescriptorSet0.vp_c14)._m0[284].x;
    }
    float _344 = _336;
    bool _346 = _79 == 352;
    float _348 = _344;
    if (_249)
    {
        _342 = (*spvDescriptorSet0.vp_c14)._m0[284].z;
    }
    float _350 = _342;
    float _352 = _350;
    if (_259)
    {
        _348 = (*spvDescriptorSet0.vp_c14)._m0[285].x;
    }
    float _354 = _348;
    bool _356 = _79 == 368;
    float _358 = _354;
    if (_259)
    {
        _352 = (*spvDescriptorSet0.vp_c14)._m0[285].z;
    }
    float _360 = _352;
    float _362 = _360;
    if (_269)
    {
        _358 = (*spvDescriptorSet0.vp_c14)._m0[286].x;
    }
    float _364 = _358;
    bool _366 = _79 == 384;
    float _368 = 1.0 / _340;
    float _370 = _364;
    float _372 = _340;
    if (_269)
    {
        _362 = (*spvDescriptorSet0.vp_c14)._m0[286].z;
    }
    float _374 = _362;
    float _376 = _374;
    if (_277)
    {
        _370 = (*spvDescriptorSet0.vp_c14)._m0[287].x;
    }
    float _378 = _370;
    bool _380 = _79 == 400;
    float _382 = _378;
    if (_277)
    {
        _376 = (*spvDescriptorSet0.vp_c14)._m0[287].z;
    }
    float _384 = _376;
    bool _386 = _79 == 416;
    float _388 = _384;
    if (_303)
    {
        _382 = (*spvDescriptorSet0.vp_c14)._m0[288].x;
    }
    float _390 = _382;
    float _392 = _390;
    if (_303)
    {
        _388 = (*spvDescriptorSet0.vp_c14)._m0[288].z;
    }
    float _394 = _388;
    float _396 = _394;
    if (_334)
    {
        _392 = (*spvDescriptorSet0.vp_c14)._m0[289].x;
    }
    float _398 = _392;
    bool _400 = _79 == 432;
    float _402 = _398;
    if (_334)
    {
        _396 = (*spvDescriptorSet0.vp_c14)._m0[289].z;
    }
    float _404 = _396;
    float _406 = _404;
    if (_346)
    {
        _402 = (*spvDescriptorSet0.vp_c14)._m0[290].x;
    }
    float _408 = _402;
    bool _410 = _79 == 448;
    float _412 = _408;
    if (_346)
    {
        _406 = (*spvDescriptorSet0.vp_c14)._m0[290].z;
    }
    float _414 = _406;
    float _416 = _414;
    if (_356)
    {
        _412 = (*spvDescriptorSet0.vp_c14)._m0[291].x;
    }
    float _418 = _412;
    bool _420 = _79 == 464;
    float _422 = _418;
    if (_356)
    {
        _416 = (*spvDescriptorSet0.vp_c14)._m0[291].z;
    }
    float _424 = _416;
    float _426 = _424;
    if (_366)
    {
        _422 = (*spvDescriptorSet0.vp_c14)._m0[292].x;
    }
    float _428 = _422;
    bool _430 = _79 == 480;
    float _432 = _428;
    if (_366)
    {
        _426 = (*spvDescriptorSet0.vp_c14)._m0[292].z;
    }
    float _434 = _426;
    float _436 = _434;
    if (_380)
    {
        _432 = (*spvDescriptorSet0.vp_c14)._m0[293].x;
    }
    float _438 = _432;
    bool _440 = _79 == 496;
    float _442 = _438;
    if (_380)
    {
        _436 = (*spvDescriptorSet0.vp_c14)._m0[293].z;
    }
    float _444 = _436;
    float _446 = _444;
    if (_386)
    {
        _442 = (*spvDescriptorSet0.vp_c14)._m0[294].x;
    }
    float _448 = _442;
    bool _450 = _79 == 512;
    float _452 = _448;
    if (_386)
    {
        _446 = (*spvDescriptorSet0.vp_c14)._m0[294].z;
    }
    float _454 = _446;
    bool _456 = _79 == 528;
    float _458 = _454;
    if (_400)
    {
        _452 = (*spvDescriptorSet0.vp_c14)._m0[295].x;
    }
    float _460 = _452;
    float _462 = _460;
    if (_400)
    {
        _458 = (*spvDescriptorSet0.vp_c14)._m0[295].z;
    }
    float _464 = _458;
    float _466 = _464;
    if (_410)
    {
        _462 = (*spvDescriptorSet0.vp_c14)._m0[296].x;
    }
    float _468 = _462;
    bool _470 = _79 == 544;
    float _472 = _468;
    if (_410)
    {
        _466 = (*spvDescriptorSet0.vp_c14)._m0[296].z;
    }
    float _474 = _466;
    float _476 = _474;
    if (_420)
    {
        _472 = (*spvDescriptorSet0.vp_c14)._m0[297].x;
    }
    float _478 = _472;
    bool _480 = _79 == 560;
    float _482 = _478;
    if (_420)
    {
        _476 = (*spvDescriptorSet0.vp_c14)._m0[297].z;
    }
    float _484 = _476;
    float _486 = _484;
    if (_430)
    {
        _482 = (*spvDescriptorSet0.vp_c14)._m0[298].x;
    }
    float _488 = _482;
    bool _490 = _79 == 576;
    float _492 = _488;
    if (_430)
    {
        _486 = (*spvDescriptorSet0.vp_c14)._m0[298].z;
    }
    float _494 = _486;
    float _496 = _494;
    if (_440)
    {
        _492 = (*spvDescriptorSet0.vp_c14)._m0[299].x;
    }
    float _498 = _492;
    bool _500 = _79 == 592;
    float _502 = _498;
    if (_440)
    {
        _496 = (*spvDescriptorSet0.vp_c14)._m0[299].z;
    }
    float _504 = _496;
    float _506 = _504;
    if (_450)
    {
        _502 = (*spvDescriptorSet0.vp_c14)._m0[300].x;
    }
    float _508 = _502;
    bool _510 = _79 == 608;
    float _512 = _508;
    if (_450)
    {
        _506 = (*spvDescriptorSet0.vp_c14)._m0[300].z;
    }
    float _514 = _506;
    float _516 = _514;
    if (_456)
    {
        _512 = (*spvDescriptorSet0.vp_c14)._m0[301].x;
    }
    float _518 = _512;
    bool _520 = _79 == 624;
    float _522 = _518;
    if (_456)
    {
        _516 = (*spvDescriptorSet0.vp_c14)._m0[301].z;
    }
    float _524 = _516;
    bool _526 = _79 == 640;
    float _528 = _524;
    if (_470)
    {
        _522 = (*spvDescriptorSet0.vp_c14)._m0[302].x;
    }
    float _530 = _522;
    float _532 = _530;
    if (_470)
    {
        _528 = (*spvDescriptorSet0.vp_c14)._m0[302].z;
    }
    float _534 = _528;
    float _536 = _534;
    if (_480)
    {
        _532 = (*spvDescriptorSet0.vp_c14)._m0[303].x;
    }
    float _538 = _532;
    bool _540 = _79 == 656;
    float _542 = _538;
    if (_480)
    {
        _536 = (*spvDescriptorSet0.vp_c14)._m0[303].z;
    }
    float _544 = _536;
    float _546 = _544;
    if (_490)
    {
        _542 = (*spvDescriptorSet0.vp_c14)._m0[304].x;
    }
    float _548 = _542;
    bool _550 = _79 == 672;
    float _552 = _548;
    if (_490)
    {
        _546 = (*spvDescriptorSet0.vp_c14)._m0[304].z;
    }
    float _554 = _546;
    float _556 = _554;
    if (_500)
    {
        _552 = (*spvDescriptorSet0.vp_c14)._m0[305].x;
    }
    float _558 = _552;
    bool _560 = _79 == 688;
    float _562 = _558;
    if (_500)
    {
        _556 = (*spvDescriptorSet0.vp_c14)._m0[305].z;
    }
    float _564 = _556;
    float _566 = _564;
    if (_510)
    {
        _562 = (*spvDescriptorSet0.vp_c14)._m0[306].x;
    }
    float _568 = _562;
    bool _570 = _79 == 704;
    float _572 = _568;
    if (_510)
    {
        _566 = (*spvDescriptorSet0.vp_c14)._m0[306].z;
    }
    float _574 = _566;
    float _576 = _574;
    if (_520)
    {
        _572 = (*spvDescriptorSet0.vp_c14)._m0[307].x;
    }
    float _578 = _572;
    bool _580 = _79 == 720;
    float _582 = _578;
    if (_520)
    {
        _576 = (*spvDescriptorSet0.vp_c14)._m0[307].z;
    }
    float _584 = _576;
    float _586 = _584;
    if (_526)
    {
        _582 = (*spvDescriptorSet0.vp_c14)._m0[308].x;
    }
    float _588 = _582;
    bool _590 = _79 == 736;
    float _592 = _588;
    if (_526)
    {
        _586 = (*spvDescriptorSet0.vp_c14)._m0[308].z;
    }
    float _594 = _586;
    bool _596 = _79 == 752;
    float _598 = _594;
    if (_540)
    {
        _592 = (*spvDescriptorSet0.vp_c14)._m0[309].x;
    }
    float _600 = _592;
    float _602 = _600;
    if (_550)
    {
        _602 = (*spvDescriptorSet0.vp_c14)._m0[310].x;
    }
    float _604 = _602;
    float _606 = _604;
    if (_560)
    {
        _606 = (*spvDescriptorSet0.vp_c14)._m0[311].x;
    }
    float _608 = _606;
    float _610 = _608;
    if (_570)
    {
        _610 = (*spvDescriptorSet0.vp_c14)._m0[312].x;
    }
    float _612 = _610;
    float _614 = _612;
    if (_580)
    {
        _614 = (*spvDescriptorSet0.vp_c14)._m0[313].x;
    }
    float _616 = _614;
    float _618 = _616;
    if (_590)
    {
        _618 = (*spvDescriptorSet0.vp_c14)._m0[314].x;
    }
    float _620 = _618;
    float _622 = _620;
    if (_596)
    {
        _622 = (*spvDescriptorSet0.vp_c14)._m0[315].x;
    }
    float _624 = _622;
    float _626 = _368 * _624;
    if (_540)
    {
        _598 = (*spvDescriptorSet0.vp_c14)._m0[309].z;
    }
    float _628 = _598;
    float _630 = _628;
    if (_550)
    {
        _630 = (*spvDescriptorSet0.vp_c14)._m0[310].z;
    }
    float _632 = _630;
    float _634 = _626 * _68;
    float _636 = _632;
    if (_560)
    {
        _636 = (*spvDescriptorSet0.vp_c14)._m0[311].z;
    }
    float _638 = _636;
    float _640 = _638;
    if (_570)
    {
        _640 = (*spvDescriptorSet0.vp_c14)._m0[312].z;
    }
    float _642 = _640;
    float _644 = floor(_634);
    float _646 = _642;
    if (_580)
    {
        _646 = (*spvDescriptorSet0.vp_c14)._m0[313].z;
    }
    float _648 = _646;
    float _650 = _648;
    if (_590)
    {
        _650 = (*spvDescriptorSet0.vp_c14)._m0[314].z;
    }
    float _652 = _650;
    float _654 = _652;
    if (_596)
    {
        _654 = (*spvDescriptorSet0.vp_c14)._m0[315].z;
    }
    float _656 = _654;
    float _658 = -_644;
    float _660 = _634 + _658;
    float _662 = _340 * _656;
    if (!_107)
    {
        _372 = (*spvDescriptorSet0.vp_c15)._m0[6].x;
    }
    float _664 = _372;
    float _666 = _660 * 2.0;
    float _668 = -_660;
    float _670 = fma(_662, _668, _68);
    float _672 = floor(_666);
    float _674 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].w);
    float _676 = _662 * _672;
    float _678 = _676 * 0.5;
    float _680 = _678 + _670;
    float _682 = fma(_74, _680, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _684 = fma(_680, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _686 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _688 = _682 + _686;
    float _690 = -(*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _692 = _684 + _690;
    float _694 = _688 * _688;
    float _696 = fma(_692, _692, _694);
    float _698 = fma(_137, _137, _696);
    float _700 = _698;
    float _702 = _678;
    float _704 = _664;
    float _706 = _680;
    if (!_107)
    {
        float _708 = fma(_674, _664, (*spvDescriptorSet0.vp_c15)._m0[6].w);
        _141 = _708;
    }
    float _710 = _141;
    float _712 = sqrt(_698);
    float _714 = _710;
    if (!_107)
    {
        float _716 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _710);
        _714 = _716;
    }
    float _718 = _714;
    float _720 = -_322;
    float _722 = fma(_712, _314, _720);
    float _724 = precise::clamp(_722, 0.0, 1.0);
    float _726 = -_678;
    float _728 = fma(_726, _724, _680);
    float _730 = fma(_728, (*spvDescriptorSet0.vp_c15)._m0[0].x, (*spvDescriptorSet0.vp_c15)._m0[0].z);
    float _732 = fma(_730, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].z);
    if (!_107)
    {
        float _734 = fma(_732, _664, (*spvDescriptorSet0.vp_c15)._m0[6].z);
        _129 = _734;
    }
    float _736 = _129;
    float _738 = _736;
    if (!_107)
    {
        float _740 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _736);
        _700 = _740;
    }
    float _742 = _700;
    if (!_107)
    {
        float2 _2242 = float2(_742, _718);
        float _744 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2242, float2(0.0), isnan(_2242)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2242, float2(0.0), isnan(_2242)), level(0.0)).x;
        _738 = _744;
    }
    float _746 = _738;
    if (_107)
    {
        _291 = (*spvDescriptorSet0.vp_c15)._m0[14].x;
    }
    float _748 = _291;
    float _750 = _748;
    if (_107)
    {
        _702 = (*spvDescriptorSet0.vp_c15)._m0[15].x;
    }
    float _752 = _702;
    if (_107)
    {
        float _754 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, _748, (*spvDescriptorSet0.vp_c15)._m0[14].w);
        _704 = _754;
    }
    float _756 = _704;
    float _758 = _756;
    if (_107)
    {
        float _760 = fma(_730, _748, (*spvDescriptorSet0.vp_c15)._m0[14].z);
        _750 = _760;
    }
    float _762 = _750;
    float _764 = _762;
    if (_107)
    {
        float _766 = fma(_756, _752, (*spvDescriptorSet0.vp_c15)._m0[15].w);
        _758 = _766;
    }
    float _768 = _758;
    float _770 = _768;
    if (_107)
    {
        float _772 = fma(_762, _752, (*spvDescriptorSet0.vp_c15)._m0[15].z);
        _764 = _772;
    }
    float _774 = _764;
    float _776 = _774;
    if (_107)
    {
        float _778 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _768);
        _770 = _778;
    }
    float _780 = _770;
    if (_107)
    {
        float _782 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _774);
        _776 = _782;
    }
    float _784 = _776;
    float _786 = _746;
    float _788 = _784;
    if (_107)
    {
        float2 _2336 = float2(_784, _780);
        float _790 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_2336, float2(0.0), isnan(_2336)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_2336, float2(0.0), isnan(_2336)), level(0.0)).x;
        _786 = _790;
    }
    float _792 = _786;
    float _794 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _796 = (*spvDescriptorSet0.vp_c15)._m0[0].w + _794;
    float _798 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _800 = _730 + _798;
    float _802 = _796 * _796;
    float _804 = fma(_800, _800, _802);
    float _806 = sqrt(_804);
    float _808 = fma(_674, (*spvDescriptorSet0.vp_c15)._m0[8].x, (*spvDescriptorSet0.vp_c15)._m0[8].w);
    float _810 = fma(_732, (*spvDescriptorSet0.vp_c15)._m0[8].x, (*spvDescriptorSet0.vp_c15)._m0[8].z);
    float _812 = fma(_674, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].w);
    float _814 = fma(_732, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].z);
    bool _816 = _806 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _818 = (*spvDescriptorSet0.vp_c14)._m0[0].y;
    float _820 = (*spvDescriptorSet0.vp_c15)._m0[7].x;
    if (!_816)
    {
        _706 = _730;
    }
    float _822 = _706;
    float _824 = _822;
    if (!_816)
    {
        _788 = (*spvDescriptorSet0.vp_c15)._m0[0].w;
    }
    float _826 = _788;
    float _828 = fma(_792, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _830 = _828 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _832 = _826;
    if (!_816)
    {
        _818 = _828;
    }
    float _834 = _818;
    float _836 = fma(_730, (*spvDescriptorSet0.vp_c4)._m0[2].x, _830);
    float _838 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, (*spvDescriptorSet0.vp_c4)._m0[2].z, _836);
    float _840 = _838 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _842 = _834;
    if (!_816)
    {
        _820 = _840;
    }
    float _844 = _820;
    bool _846 = !_816;
    float _848 = _844;
    if (!_846)
    {
        float _850 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _852 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _854 = _806 + _852;
        float _856 = _828 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _858 = _854 * _850;
        float _860 = rsqrt(_804);
        float _862 = _858 * 0.15915493667125701904296875;
        float _864 = _862 * 6.283185482025146484375;
        float _866 = cos(_864);
        float _868 = _862 * 6.283185482025146484375;
        float _870 = sin(_868);
        float _872 = _866 + (-1.0);
        float _874 = fma(_870, _856, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _876 = _872 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _878 = _860 * _874;
        float _880 = fma(_828, _866, _876);
        float _882 = fma(_800, _878, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _884 = _880 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _886 = fma(_796, _878, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _888 = fma(_882, (*spvDescriptorSet0.vp_c4)._m0[2].x, _884);
        float _890 = fma(_886, (*spvDescriptorSet0.vp_c4)._m0[2].z, _888);
        float _892 = _890 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _842 = _880;
        _824 = _882;
        _832 = _886;
        _848 = _892;
    }
    float _894 = _842;
    float _896 = _824;
    float _898 = _832;
    float _900 = _848;
    float _902 = _894 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _904 = _894 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    out.m_40.x = _810;
    out.m_40.y = _808;
    float _906 = _828 * (*spvDescriptorSet0.vp_c4)._m0[43].y;
    float _908 = fma(_896, (*spvDescriptorSet0.vp_c4)._m0[0].x, _902);
    float _910 = fma(_896, (*spvDescriptorSet0.vp_c4)._m0[1].x, _904);
    float _912 = _828 * (*spvDescriptorSet0.vp_c4)._m0[42].y;
    float _914 = _828 * (*spvDescriptorSet0.vp_c4)._m0[44].y;
    float _916 = _828 * (*spvDescriptorSet0.vp_c4)._m0[45].y;
    out.m_42.z = _814;
    out.m_42.w = _812;
    float _918 = fma(_898, (*spvDescriptorSet0.vp_c4)._m0[0].z, _908);
    float _920 = fma(_898, (*spvDescriptorSet0.vp_c4)._m0[1].z, _910);
    float _922 = _828 * (*spvDescriptorSet0.vp_c4)._m0[49].y;
    float _924 = fma(_730, (*spvDescriptorSet0.vp_c4)._m0[42].x, _912);
    float _926 = _828 * (*spvDescriptorSet0.vp_c4)._m0[46].y;
    float _928 = _828 * (*spvDescriptorSet0.vp_c4)._m0[47].y;
    float _930 = _828 * (*spvDescriptorSet0.vp_c4)._m0[50].y;
    float _932 = _828 * (*spvDescriptorSet0.vp_c4)._m0[51].y;
    float _934 = _828 * (*spvDescriptorSet0.vp_c4)._m0[52].y;
    float _936 = _828 * (*spvDescriptorSet0.vp_c4)._m0[48].y;
    float _938 = _828 * (*spvDescriptorSet0.vp_c4)._m0[53].y;
    float _940 = fma(_730, (*spvDescriptorSet0.vp_c4)._m0[43].x, _906);
    float _942 = fma(_730, (*spvDescriptorSet0.vp_c4)._m0[44].x, _914);
    float _944 = fma(_730, (*spvDescriptorSet0.vp_c4)._m0[45].x, _916);
    out.m_44.x = _730;
    out.m_44.y = _828;
    out.m_44.z = (*spvDescriptorSet0.vp_c15)._m0[0].w;
    float _946 = fma(_730, (*spvDescriptorSet0.vp_c4)._m0[49].x, _922);
    float _948 = _920 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _950 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, (*spvDescriptorSet0.vp_c4)._m0[42].z, _924);
    float _952 = fma(_730, (*spvDescriptorSet0.vp_c4)._m0[46].x, _926);
    float _954 = fma(_730, (*spvDescriptorSet0.vp_c4)._m0[47].x, _928);
    float _956 = fma(_730, (*spvDescriptorSet0.vp_c4)._m0[50].x, _930);
    float _958 = fma(_730, (*spvDescriptorSet0.vp_c4)._m0[51].x, _932);
    float _960 = fma(_730, (*spvDescriptorSet0.vp_c4)._m0[52].x, _934);
    float _962 = fma(_730, (*spvDescriptorSet0.vp_c4)._m0[53].x, _938);
    float _964 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, (*spvDescriptorSet0.vp_c4)._m0[44].z, _942);
    float _966 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, (*spvDescriptorSet0.vp_c4)._m0[45].z, _944);
    float _968 = fma(_730, (*spvDescriptorSet0.vp_c4)._m0[48].x, _936);
    float _970 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, (*spvDescriptorSet0.vp_c4)._m0[43].z, _940);
    float _972 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, (*spvDescriptorSet0.vp_c4)._m0[49].z, _946);
    float _974 = _918 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _976 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, (*spvDescriptorSet0.vp_c4)._m0[48].z, _968);
    float _978 = _948 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _980 = _948 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _982 = _948 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _984 = _950 + (*spvDescriptorSet0.vp_c4)._m0[42].w;
    float _986 = _970 + (*spvDescriptorSet0.vp_c4)._m0[43].w;
    float _988 = _964 + (*spvDescriptorSet0.vp_c4)._m0[44].w;
    float _990 = _966 + (*spvDescriptorSet0.vp_c4)._m0[45].w;
    float _992 = _948 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _994 = fma(_974, (*spvDescriptorSet0.vp_c4)._m0[8].x, _978);
    float _996 = fma(_974, (*spvDescriptorSet0.vp_c4)._m0[7].x, _980);
    float _998 = fma(_974, (*spvDescriptorSet0.vp_c4)._m0[9].x, _982);
    float _1000 = fma(_974, (*spvDescriptorSet0.vp_c4)._m0[10].x, _992);
    out.m_46.x = _984;
    out.m_46.y = _986;
    out.m_46.z = _988;
    out.m_46.w = _990;
    float _1002 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, (*spvDescriptorSet0.vp_c4)._m0[46].z, _952);
    float _1004 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, (*spvDescriptorSet0.vp_c4)._m0[47].z, _954);
    float _1006 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, (*spvDescriptorSet0.vp_c4)._m0[50].z, _956);
    float _1008 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, (*spvDescriptorSet0.vp_c4)._m0[51].z, _958);
    float _1010 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, (*spvDescriptorSet0.vp_c4)._m0[52].z, _960);
    float _1012 = fma((*spvDescriptorSet0.vp_c15)._m0[0].w, (*spvDescriptorSet0.vp_c4)._m0[53].z, _962);
    float _1014 = fma(_900, (*spvDescriptorSet0.vp_c4)._m0[7].z, _996);
    float _1016 = _976 + (*spvDescriptorSet0.vp_c4)._m0[48].w;
    float _1018 = _1006 + (*spvDescriptorSet0.vp_c4)._m0[50].w;
    float _1020 = _1010 + (*spvDescriptorSet0.vp_c4)._m0[52].w;
    float _1022 = _1012 + (*spvDescriptorSet0.vp_c4)._m0[53].w;
    out.m_48.w = _840;
    float _1024 = fma(_900, (*spvDescriptorSet0.vp_c4)._m0[8].z, _994);
    float _1026 = _972 + (*spvDescriptorSet0.vp_c4)._m0[49].w;
    float _1028 = fma(_900, (*spvDescriptorSet0.vp_c4)._m0[9].z, _998);
    float _1030 = fma(_900, (*spvDescriptorSet0.vp_c4)._m0[10].z, _1000);
    float _1032 = -_840;
    float _1034 = -(*spvDescriptorSet0.vp_c9)._m0[72].y;
    float _1036 = _1032 + _1034;
    float _1038 = _1002 + (*spvDescriptorSet0.vp_c4)._m0[46].w;
    float _1040 = _1004 + (*spvDescriptorSet0.vp_c4)._m0[47].w;
    float _1042 = _1008 + (*spvDescriptorSet0.vp_c4)._m0[51].w;
    float _1044 = _1036 * (*spvDescriptorSet0.vp_c9)._m0[72].z;
    float _1046 = _1014 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _1048 = _1024 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _1050 = _1028 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _1052 = _1030 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.m_50.x = _1038;
    out.m_50.y = _1040;
    out.m_50.z = _1016;
    out.m_50.w = _1026;
    out.m_52.x = _1018;
    out.m_52.y = _1042;
    out.m_52.z = _1020;
    out.m_52.w = _1022;
    out.m_54.w = _1044;
    out.gl_Position.x = _1046;
    out.gl_Position.y = _1048;
    out.gl_Position.z = _1050;
    out.gl_Position.w = _1052;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_40.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_40.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_40.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_40.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

