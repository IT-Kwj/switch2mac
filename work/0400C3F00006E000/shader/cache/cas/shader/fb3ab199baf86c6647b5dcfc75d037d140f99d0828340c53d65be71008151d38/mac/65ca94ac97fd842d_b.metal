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
    float _107 = _75;
    float _109 = _64;
    float _111 = _62;
    if (_81)
    {
        _105 = (*spvDescriptorSet0.vp_c14)._m0[268].x;
    }
    float _113 = _105;
    float _115 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _117 = _91 + _115;
    float _119 = fma(_64, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    bool _121 = _77 == 96;
    float _123 = _117 * _117;
    float _125 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _127 = _119 + _125;
    float _129 = 0.0;
    float _131 = _113;
    if (_81)
    {
        _129 = (*spvDescriptorSet0.vp_c14)._m0[268].z;
    }
    float _133 = _129;
    float _135 = fma(_75, _75, _123);
    float _137 = _133;
    if (_83)
    {
        _131 = (*spvDescriptorSet0.vp_c14)._m0[269].x;
    }
    float _139 = _131;
    bool _141 = _77 == 112;
    float _143 = fma(_127, _127, _135);
    float _145 = _139;
    if (_83)
    {
        _137 = (*spvDescriptorSet0.vp_c14)._m0[269].z;
    }
    float _147 = _137;
    float _149 = _147;
    if (_85)
    {
        _145 = (*spvDescriptorSet0.vp_c14)._m0[270].x;
    }
    float _151 = _145;
    float _153 = rsqrt(_143);
    bool _155 = _77 == 128;
    float _157 = _151;
    if (_85)
    {
        _149 = (*spvDescriptorSet0.vp_c14)._m0[270].z;
    }
    float _159 = _149;
    float _161 = _159;
    if (_87)
    {
        _157 = (*spvDescriptorSet0.vp_c14)._m0[271].x;
    }
    float _163 = _157;
    bool _165 = _77 == 144;
    float _167 = _163;
    if (_87)
    {
        _161 = (*spvDescriptorSet0.vp_c14)._m0[271].z;
    }
    float _169 = _161;
    float _171 = _169;
    if (_89)
    {
        _167 = (*spvDescriptorSet0.vp_c14)._m0[272].x;
    }
    float _173 = _167;
    bool _175 = _77 == 160;
    float _177 = _173;
    if (_89)
    {
        _171 = (*spvDescriptorSet0.vp_c14)._m0[272].z;
    }
    float _179 = _171;
    float _181 = _153 * (*spvDescriptorSet0.vp_c14)._m0[268].x;
    float _183 = _179;
    if (_93)
    {
        _177 = (*spvDescriptorSet0.vp_c14)._m0[273].x;
    }
    float _185 = _177;
    bool _187 = _77 == 176;
    float _189 = _185;
    if (_93)
    {
        _183 = (*spvDescriptorSet0.vp_c14)._m0[273].z;
    }
    float _191 = _183;
    float _193 = log2(_181);
    bool _195 = _77 == 192;
    float _197 = _191;
    if (_121)
    {
        _189 = (*spvDescriptorSet0.vp_c14)._m0[274].x;
    }
    float _199 = _189;
    float _201 = _199;
    if (_121)
    {
        _197 = (*spvDescriptorSet0.vp_c14)._m0[274].z;
    }
    float _203 = _197;
    float _205 = _203;
    if (_141)
    {
        _201 = (*spvDescriptorSet0.vp_c14)._m0[275].x;
    }
    float _207 = _201;
    bool _209 = _77 == 208;
    float _211 = _207;
    if (_141)
    {
        _205 = (*spvDescriptorSet0.vp_c14)._m0[275].z;
    }
    float _213 = _205;
    float _215 = _213;
    if (_155)
    {
        _211 = (*spvDescriptorSet0.vp_c14)._m0[276].x;
    }
    float _217 = _211;
    bool _219 = _77 == 224;
    float _221 = _193 + 1.2999999523162841796875;
    float _223 = _217;
    if (_155)
    {
        _215 = (*spvDescriptorSet0.vp_c14)._m0[276].z;
    }
    float _225 = _215;
    float _227 = _225;
    if (_165)
    {
        _223 = (*spvDescriptorSet0.vp_c14)._m0[277].x;
    }
    float _229 = _223;
    bool _231 = _77 == 240;
    float _233 = trunc(_221);
    int _235 = int(_233);
    float _237 = _229;
    if (_165)
    {
        _227 = (*spvDescriptorSet0.vp_c14)._m0[277].z;
    }
    float _239 = _227;
    float _241 = _239;
    if (_175)
    {
        _237 = (*spvDescriptorSet0.vp_c14)._m0[278].x;
    }
    float _243 = _237;
    bool _245 = _77 == 256;
    float _247 = _243;
    if (_175)
    {
        _241 = (*spvDescriptorSet0.vp_c14)._m0[278].z;
    }
    float _249 = _241;
    float _251 = _249;
    if (_187)
    {
        _247 = (*spvDescriptorSet0.vp_c14)._m0[279].x;
    }
    float _253 = _247;
    bool _255 = _77 == 272;
    float _257 = _253;
    if (_187)
    {
        _251 = (*spvDescriptorSet0.vp_c14)._m0[279].z;
    }
    float _259 = _251;
    float _261 = _259;
    if (_195)
    {
        _257 = (*spvDescriptorSet0.vp_c14)._m0[280].x;
    }
    float _263 = _257;
    int _265 = min(_235, 15);
    bool _267 = _77 == 288;
    float _269 = _263;
    if (_195)
    {
        _261 = (*spvDescriptorSet0.vp_c14)._m0[280].z;
    }
    float _271 = _261;
    float _273 = float(_265);
    bool _275 = _77 == 304;
    int _277 = _265 << 4;
    int _279 = _277 + 4288;
    float _281 = _271;
    float _283 = as_type<float>(_279);
    if (_209)
    {
        _269 = (*spvDescriptorSet0.vp_c14)._m0[281].x;
    }
    float _285 = _269;
    float _287 = _285;
    if (_209)
    {
        _281 = (*spvDescriptorSet0.vp_c14)._m0[281].z;
    }
    float _289 = _281;
    float _291 = -_273;
    float _293 = _291 + (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _295 = _289;
    if (_219)
    {
        _287 = (*spvDescriptorSet0.vp_c14)._m0[282].x;
    }
    float _297 = _287;
    int _299 = _279 + 8;
    uint _302 = uint(int(uint(_299) >> uint(2)));
    uint _304 = uint(int(uint(int(_302)) >> uint(2)));
    int _306 = int(_302) & 3;
    float _308 = (*spvDescriptorSet0.vp_c14)._m0[int(_304)][_306];
    int _310 = int(_302) + 1;
    uint _312 = uint(int(uint(_310) >> uint(2)));
    int _314 = _310 & 3;
    float _316 = (*spvDescriptorSet0.vp_c14)._m0[int(_312)][_314];
    bool _318 = _77 == 320;
    float _320 = _293 + 1.0;
    float _322 = _297;
    if (_219)
    {
        _295 = (*spvDescriptorSet0.vp_c14)._m0[282].z;
    }
    float _324 = _295;
    float _326 = _324;
    if (_231)
    {
        _322 = (*spvDescriptorSet0.vp_c14)._m0[283].x;
    }
    float _328 = _322;
    bool _330 = _77 == 336;
    float _332 = exp2(_320);
    float _334 = _328;
    if (_231)
    {
        _326 = (*spvDescriptorSet0.vp_c14)._m0[283].z;
    }
    float _336 = _326;
    float _338 = _336;
    if (_245)
    {
        _334 = (*spvDescriptorSet0.vp_c14)._m0[284].x;
    }
    float _340 = _334;
    bool _342 = _77 == 352;
    float _344 = _340;
    if (_245)
    {
        _338 = (*spvDescriptorSet0.vp_c14)._m0[284].z;
    }
    float _346 = _338;
    float _348 = _346;
    if (_255)
    {
        _344 = (*spvDescriptorSet0.vp_c14)._m0[285].x;
    }
    float _350 = _344;
    bool _352 = _77 == 368;
    float _354 = _350;
    if (_255)
    {
        _348 = (*spvDescriptorSet0.vp_c14)._m0[285].z;
    }
    float _356 = _348;
    float _358 = _356;
    if (_267)
    {
        _354 = (*spvDescriptorSet0.vp_c14)._m0[286].x;
    }
    float _360 = _354;
    float _362 = 1.0 / _332;
    bool _364 = _77 == 384;
    float _366 = _360;
    if (_267)
    {
        _358 = (*spvDescriptorSet0.vp_c14)._m0[286].z;
    }
    float _368 = _358;
    float _370 = _368;
    if (_275)
    {
        _366 = (*spvDescriptorSet0.vp_c14)._m0[287].x;
    }
    float _372 = _366;
    bool _374 = _77 == 400;
    float _376 = _372;
    if (_275)
    {
        _370 = (*spvDescriptorSet0.vp_c14)._m0[287].z;
    }
    float _378 = _370;
    bool _380 = _77 == 416;
    float _382 = _378;
    if (_318)
    {
        _376 = (*spvDescriptorSet0.vp_c14)._m0[288].x;
    }
    float _384 = _376;
    float _386 = _384;
    if (_318)
    {
        _382 = (*spvDescriptorSet0.vp_c14)._m0[288].z;
    }
    float _388 = _382;
    float _390 = _388;
    if (_330)
    {
        _386 = (*spvDescriptorSet0.vp_c14)._m0[289].x;
    }
    float _392 = _386;
    bool _394 = _77 == 432;
    float _396 = _392;
    if (_330)
    {
        _390 = (*spvDescriptorSet0.vp_c14)._m0[289].z;
    }
    float _398 = _390;
    float _400 = _398;
    if (_342)
    {
        _396 = (*spvDescriptorSet0.vp_c14)._m0[290].x;
    }
    float _402 = _396;
    bool _404 = _77 == 448;
    float _406 = _402;
    if (_342)
    {
        _400 = (*spvDescriptorSet0.vp_c14)._m0[290].z;
    }
    float _408 = _400;
    float _410 = _408;
    if (_352)
    {
        _406 = (*spvDescriptorSet0.vp_c14)._m0[291].x;
    }
    float _412 = _406;
    bool _414 = _77 == 464;
    float _416 = _412;
    if (_352)
    {
        _410 = (*spvDescriptorSet0.vp_c14)._m0[291].z;
    }
    float _418 = _410;
    float _420 = _418;
    if (_364)
    {
        _416 = (*spvDescriptorSet0.vp_c14)._m0[292].x;
    }
    float _422 = _416;
    bool _424 = _77 == 480;
    float _426 = _422;
    if (_364)
    {
        _420 = (*spvDescriptorSet0.vp_c14)._m0[292].z;
    }
    float _428 = _420;
    float _430 = _428;
    if (_374)
    {
        _426 = (*spvDescriptorSet0.vp_c14)._m0[293].x;
    }
    float _432 = _426;
    bool _434 = _77 == 496;
    float _436 = _432;
    if (_374)
    {
        _430 = (*spvDescriptorSet0.vp_c14)._m0[293].z;
    }
    float _438 = _430;
    float _440 = _438;
    if (_380)
    {
        _436 = (*spvDescriptorSet0.vp_c14)._m0[294].x;
    }
    float _442 = _436;
    bool _444 = _77 == 512;
    float _446 = _442;
    if (_380)
    {
        _440 = (*spvDescriptorSet0.vp_c14)._m0[294].z;
    }
    float _448 = _440;
    bool _450 = _77 == 528;
    float _452 = _448;
    if (_394)
    {
        _446 = (*spvDescriptorSet0.vp_c14)._m0[295].x;
    }
    float _454 = _446;
    float _456 = _454;
    if (_394)
    {
        _452 = (*spvDescriptorSet0.vp_c14)._m0[295].z;
    }
    float _458 = _452;
    float _460 = _458;
    if (_404)
    {
        _456 = (*spvDescriptorSet0.vp_c14)._m0[296].x;
    }
    float _462 = _456;
    bool _464 = _77 == 544;
    float _466 = _462;
    if (_404)
    {
        _460 = (*spvDescriptorSet0.vp_c14)._m0[296].z;
    }
    float _468 = _460;
    float _470 = _468;
    if (_414)
    {
        _466 = (*spvDescriptorSet0.vp_c14)._m0[297].x;
    }
    float _472 = _466;
    bool _474 = _77 == 560;
    float _476 = _472;
    if (_414)
    {
        _470 = (*spvDescriptorSet0.vp_c14)._m0[297].z;
    }
    float _478 = _470;
    float _480 = _478;
    if (_424)
    {
        _476 = (*spvDescriptorSet0.vp_c14)._m0[298].x;
    }
    float _482 = _476;
    bool _484 = _77 == 576;
    float _486 = _482;
    if (_424)
    {
        _480 = (*spvDescriptorSet0.vp_c14)._m0[298].z;
    }
    float _488 = _480;
    float _490 = _488;
    if (_434)
    {
        _486 = (*spvDescriptorSet0.vp_c14)._m0[299].x;
    }
    float _492 = _486;
    bool _494 = _77 == 592;
    float _496 = _492;
    if (_434)
    {
        _490 = (*spvDescriptorSet0.vp_c14)._m0[299].z;
    }
    float _498 = _490;
    float _500 = _498;
    if (_444)
    {
        _496 = (*spvDescriptorSet0.vp_c14)._m0[300].x;
    }
    float _502 = _496;
    bool _504 = _77 == 608;
    float _506 = _502;
    if (_444)
    {
        _500 = (*spvDescriptorSet0.vp_c14)._m0[300].z;
    }
    float _508 = _500;
    float _510 = _508;
    if (_450)
    {
        _506 = (*spvDescriptorSet0.vp_c14)._m0[301].x;
    }
    float _512 = _506;
    bool _514 = _77 == 624;
    float _516 = _512;
    if (_450)
    {
        _510 = (*spvDescriptorSet0.vp_c14)._m0[301].z;
    }
    float _518 = _510;
    bool _520 = _77 == 640;
    float _522 = _518;
    if (_464)
    {
        _516 = (*spvDescriptorSet0.vp_c14)._m0[302].x;
    }
    float _524 = _516;
    float _526 = _524;
    if (_464)
    {
        _522 = (*spvDescriptorSet0.vp_c14)._m0[302].z;
    }
    float _528 = _522;
    float _530 = _528;
    if (_474)
    {
        _526 = (*spvDescriptorSet0.vp_c14)._m0[303].x;
    }
    float _532 = _526;
    bool _534 = _77 == 656;
    float _536 = _532;
    if (_474)
    {
        _530 = (*spvDescriptorSet0.vp_c14)._m0[303].z;
    }
    float _538 = _530;
    float _540 = _538;
    if (_484)
    {
        _536 = (*spvDescriptorSet0.vp_c14)._m0[304].x;
    }
    float _542 = _536;
    bool _544 = _77 == 672;
    float _546 = _542;
    if (_484)
    {
        _540 = (*spvDescriptorSet0.vp_c14)._m0[304].z;
    }
    float _548 = _540;
    float _550 = _548;
    if (_494)
    {
        _546 = (*spvDescriptorSet0.vp_c14)._m0[305].x;
    }
    float _552 = _546;
    bool _554 = _77 == 688;
    float _556 = _552;
    if (_494)
    {
        _550 = (*spvDescriptorSet0.vp_c14)._m0[305].z;
    }
    float _558 = _550;
    float _560 = _558;
    if (_504)
    {
        _556 = (*spvDescriptorSet0.vp_c14)._m0[306].x;
    }
    float _562 = _556;
    bool _564 = _77 == 704;
    float _566 = _562;
    if (_504)
    {
        _560 = (*spvDescriptorSet0.vp_c14)._m0[306].z;
    }
    float _568 = _560;
    float _570 = _568;
    if (_514)
    {
        _566 = (*spvDescriptorSet0.vp_c14)._m0[307].x;
    }
    float _572 = _566;
    bool _574 = _77 == 720;
    float _576 = _572;
    if (_514)
    {
        _570 = (*spvDescriptorSet0.vp_c14)._m0[307].z;
    }
    float _578 = _570;
    float _580 = _578;
    if (_520)
    {
        _576 = (*spvDescriptorSet0.vp_c14)._m0[308].x;
    }
    float _582 = _576;
    bool _584 = _77 == 736;
    float _586 = _582;
    if (_520)
    {
        _580 = (*spvDescriptorSet0.vp_c14)._m0[308].z;
    }
    float _588 = _580;
    bool _590 = _77 == 752;
    float _592 = _588;
    if (_534)
    {
        _586 = (*spvDescriptorSet0.vp_c14)._m0[309].x;
    }
    float _594 = _586;
    float _596 = _594;
    if (_544)
    {
        _596 = (*spvDescriptorSet0.vp_c14)._m0[310].x;
    }
    float _598 = _596;
    float _600 = _598;
    if (_554)
    {
        _600 = (*spvDescriptorSet0.vp_c14)._m0[311].x;
    }
    float _602 = _600;
    float _604 = _602;
    if (_564)
    {
        _604 = (*spvDescriptorSet0.vp_c14)._m0[312].x;
    }
    float _606 = _604;
    float _608 = _606;
    if (_574)
    {
        _608 = (*spvDescriptorSet0.vp_c14)._m0[313].x;
    }
    float _610 = _608;
    float _612 = _610;
    if (_584)
    {
        _612 = (*spvDescriptorSet0.vp_c14)._m0[314].x;
    }
    float _614 = _612;
    float _616 = _614;
    if (_590)
    {
        _616 = (*spvDescriptorSet0.vp_c14)._m0[315].x;
    }
    float _618 = _616;
    float _620 = _362 * _618;
    if (_534)
    {
        _592 = (*spvDescriptorSet0.vp_c14)._m0[309].z;
    }
    float _622 = _592;
    float _624 = _622;
    if (_544)
    {
        _624 = (*spvDescriptorSet0.vp_c14)._m0[310].z;
    }
    float _626 = _624;
    float _628 = _620 * _64;
    float _630 = _626;
    if (_554)
    {
        _630 = (*spvDescriptorSet0.vp_c14)._m0[311].z;
    }
    float _632 = _630;
    float _634 = _632;
    if (_564)
    {
        _634 = (*spvDescriptorSet0.vp_c14)._m0[312].z;
    }
    float _636 = _634;
    float _638 = floor(_628);
    float _640 = _636;
    if (_574)
    {
        _640 = (*spvDescriptorSet0.vp_c14)._m0[313].z;
    }
    float _642 = _640;
    float _644 = _642;
    if (_584)
    {
        _644 = (*spvDescriptorSet0.vp_c14)._m0[314].z;
    }
    float _646 = _644;
    float _648 = _646;
    if (_590)
    {
        _648 = (*spvDescriptorSet0.vp_c14)._m0[315].z;
    }
    float _650 = _648;
    float _652 = -_638;
    float _654 = _628 + _652;
    float _656 = _332 * _650;
    float _658 = _654 * 2.0;
    float _660 = -_654;
    float _662 = fma(_656, _660, _64);
    float _664 = floor(_658);
    float _666 = _656 * _664;
    float _668 = _666 * 0.5;
    float _670 = _668 + _662;
    float _672 = fma(_68, _670, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _674 = fma(_670, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _676 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _678 = _672 + _676;
    float _680 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _682 = _674 + _680;
    float _684 = _678 * _678;
    float _686 = fma(_75, _75, _684);
    float _688 = fma(_682, _682, _686);
    float _690 = sqrt(_688);
    float _692 = -_316;
    float _694 = fma(_690, _308, _692);
    float _696 = precise::clamp(_694, 0.0, 1.0);
    float _698 = -_668;
    float _700 = fma(_698, _696, _670);
    float _702 = _670;
    float _704 = _688;
    if (!_103)
    {
        _702 = (*spvDescriptorSet0.vp_c15)._m0[6].x;
    }
    float _706 = _702;
    float _708 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].z);
    float _710 = fma(_700, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _712 = _706;
    float _714 = (*spvDescriptorSet0.vp_c15)._m0[4].x;
    if (!_103)
    {
        float _716 = fma(_708, _706, (*spvDescriptorSet0.vp_c15)._m0[6].z);
        _107 = _716;
    }
    float _718 = _107;
    float _720 = fma(_710, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].w);
    float _722 = _718;
    if (!_103)
    {
        float _724 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _718);
        _722 = _724;
    }
    float _726 = _722;
    if (!_103)
    {
        float _728 = fma(_720, _706, (*spvDescriptorSet0.vp_c15)._m0[6].w);
        _704 = _728;
    }
    float _730 = _704;
    float _732 = _730;
    if (!_103)
    {
        float _734 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _730);
        _283 = _734;
    }
    float _736 = _283;
    if (!_103)
    {
        float2 _2140 = float2(_726, _736);
        float _738 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2140, float2(0.0), isnan(_2140)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2140, float2(0.0), isnan(_2140)), level(0.0)).x;
        _732 = _738;
    }
    float _740 = _732;
    if (_103)
    {
        _109 = (*spvDescriptorSet0.vp_c15)._m0[14].x;
    }
    float _742 = _109;
    float _744 = 0.0;
    if (_103)
    {
        _744 = (*spvDescriptorSet0.vp_c15)._m0[15].x;
    }
    float _746 = _744;
    if (_103)
    {
        float _748 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, _742, (*spvDescriptorSet0.vp_c15)._m0[14].z);
        _712 = _748;
    }
    float _750 = _712;
    float _752 = _750;
    if (_103)
    {
        float _754 = fma(_710, _742, (*spvDescriptorSet0.vp_c15)._m0[14].w);
        _111 = _754;
    }
    float _756 = _111;
    float _758 = _756;
    if (_103)
    {
        float _760 = fma(_750, _746, (*spvDescriptorSet0.vp_c15)._m0[15].z);
        _752 = _760;
    }
    float _762 = _752;
    float _764 = _762;
    if (_103)
    {
        float _766 = fma(_756, _746, (*spvDescriptorSet0.vp_c15)._m0[15].w);
        _758 = _766;
    }
    float _768 = _758;
    float _770 = _768;
    if (_103)
    {
        float _772 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _762);
        _764 = _772;
    }
    float _774 = _764;
    if (_103)
    {
        float _776 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _768);
        _770 = _776;
    }
    float _778 = _770;
    float _780 = _740;
    if (_103)
    {
        float2 _2232 = float2(_774, _778);
        float _782 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_2232, float2(0.0), isnan(_2232)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_2232, float2(0.0), isnan(_2232)), level(0.0)).x;
        _780 = _782;
    }
    float _784 = _780;
    float _786 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _788 = _710 + _786;
    float _790 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _792 = (*spvDescriptorSet0.vp_c15)._m0[0].z + _790;
    float _794 = _788 * _788;
    float _796 = fma(_792, _792, _794);
    float _798 = fma(_708, (*spvDescriptorSet0.vp_c15)._m0[8].x, (*spvDescriptorSet0.vp_c15)._m0[8].z);
    float _800 = fma(_720, (*spvDescriptorSet0.vp_c15)._m0[8].x, (*spvDescriptorSet0.vp_c15)._m0[8].w);
    float _802 = sqrt(_796);
    float _804 = fma(_708, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].z);
    float _806 = fma(_720, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].w);
    bool _808 = _802 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _810 = (*spvDescriptorSet0.vp_c15)._m0[7].x;
    float _812 = (*spvDescriptorSet0.vp_c14)._m0[0].y;
    if (!_808)
    {
        _810 = (*spvDescriptorSet0.vp_c15)._m0[0].z;
    }
    float _814 = _810;
    float _816 = fma(_784, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _818 = _816 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _820 = _814;
    if (!_808)
    {
        _812 = _816;
    }
    float _822 = _812;
    float _824 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[2].x, _818);
    float _826 = fma(_710, (*spvDescriptorSet0.vp_c4)._m0[2].z, _824);
    float _828 = _826 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _830 = _826;
    float _832 = _822;
    if (!_808)
    {
        _830 = _710;
    }
    float _834 = _830;
    float _836 = _834;
    if (!_808)
    {
        _714 = _828;
    }
    float _838 = _714;
    bool _840 = !_808;
    float _842 = _838;
    if (!_840)
    {
        float _844 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _846 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _848 = _802 + _846;
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
    out.m_40.z = _804;
    out.m_40.w = _806;
    float _900 = fma(_890, (*spvDescriptorSet0.vp_c4)._m0[1].x, _896);
    float _902 = fma(_890, (*spvDescriptorSet0.vp_c4)._m0[0].x, _898);
    out.m_42.x = _798;
    out.m_42.y = _800;
    float _904 = fma(_892, (*spvDescriptorSet0.vp_c4)._m0[1].z, _900);
    float _906 = fma(_892, (*spvDescriptorSet0.vp_c4)._m0[0].z, _902);
    out.m_44.x = (*spvDescriptorSet0.vp_c15)._m0[0].z;
    out.m_44.y = _816;
    out.m_44.z = _710;
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
    float _107 = _75;
    float _109 = _64;
    float _111 = _62;
    if (_81)
    {
        _105 = (*spvDescriptorSet0.vp_c14)._m0[268].x;
    }
    float _113 = _105;
    float _115 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _117 = _91 + _115;
    float _119 = fma(_64, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    bool _121 = _77 == 96;
    float _123 = _117 * _117;
    float _125 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _127 = _119 + _125;
    float _129 = 0.0;
    float _131 = _113;
    if (_81)
    {
        _129 = (*spvDescriptorSet0.vp_c14)._m0[268].z;
    }
    float _133 = _129;
    float _135 = fma(_75, _75, _123);
    float _137 = _133;
    if (_83)
    {
        _131 = (*spvDescriptorSet0.vp_c14)._m0[269].x;
    }
    float _139 = _131;
    bool _141 = _77 == 112;
    float _143 = fma(_127, _127, _135);
    float _145 = _139;
    if (_83)
    {
        _137 = (*spvDescriptorSet0.vp_c14)._m0[269].z;
    }
    float _147 = _137;
    float _149 = _147;
    if (_85)
    {
        _145 = (*spvDescriptorSet0.vp_c14)._m0[270].x;
    }
    float _151 = _145;
    float _153 = rsqrt(_143);
    bool _155 = _77 == 128;
    float _157 = _151;
    if (_85)
    {
        _149 = (*spvDescriptorSet0.vp_c14)._m0[270].z;
    }
    float _159 = _149;
    float _161 = _159;
    if (_87)
    {
        _157 = (*spvDescriptorSet0.vp_c14)._m0[271].x;
    }
    float _163 = _157;
    bool _165 = _77 == 144;
    float _167 = _163;
    if (_87)
    {
        _161 = (*spvDescriptorSet0.vp_c14)._m0[271].z;
    }
    float _169 = _161;
    float _171 = _169;
    if (_89)
    {
        _167 = (*spvDescriptorSet0.vp_c14)._m0[272].x;
    }
    float _173 = _167;
    bool _175 = _77 == 160;
    float _177 = _173;
    if (_89)
    {
        _171 = (*spvDescriptorSet0.vp_c14)._m0[272].z;
    }
    float _179 = _171;
    float _181 = _153 * (*spvDescriptorSet0.vp_c14)._m0[268].x;
    float _183 = _179;
    if (_93)
    {
        _177 = (*spvDescriptorSet0.vp_c14)._m0[273].x;
    }
    float _185 = _177;
    bool _187 = _77 == 176;
    float _189 = _185;
    if (_93)
    {
        _183 = (*spvDescriptorSet0.vp_c14)._m0[273].z;
    }
    float _191 = _183;
    float _193 = log2(_181);
    bool _195 = _77 == 192;
    float _197 = _191;
    if (_121)
    {
        _189 = (*spvDescriptorSet0.vp_c14)._m0[274].x;
    }
    float _199 = _189;
    float _201 = _199;
    if (_121)
    {
        _197 = (*spvDescriptorSet0.vp_c14)._m0[274].z;
    }
    float _203 = _197;
    float _205 = _203;
    if (_141)
    {
        _201 = (*spvDescriptorSet0.vp_c14)._m0[275].x;
    }
    float _207 = _201;
    bool _209 = _77 == 208;
    float _211 = _207;
    if (_141)
    {
        _205 = (*spvDescriptorSet0.vp_c14)._m0[275].z;
    }
    float _213 = _205;
    float _215 = _213;
    if (_155)
    {
        _211 = (*spvDescriptorSet0.vp_c14)._m0[276].x;
    }
    float _217 = _211;
    bool _219 = _77 == 224;
    float _221 = _193 + 1.2999999523162841796875;
    float _223 = _217;
    if (_155)
    {
        _215 = (*spvDescriptorSet0.vp_c14)._m0[276].z;
    }
    float _225 = _215;
    float _227 = _225;
    if (_165)
    {
        _223 = (*spvDescriptorSet0.vp_c14)._m0[277].x;
    }
    float _229 = _223;
    bool _231 = _77 == 240;
    float _233 = trunc(_221);
    int _235 = int(_233);
    float _237 = _229;
    if (_165)
    {
        _227 = (*spvDescriptorSet0.vp_c14)._m0[277].z;
    }
    float _239 = _227;
    float _241 = _239;
    if (_175)
    {
        _237 = (*spvDescriptorSet0.vp_c14)._m0[278].x;
    }
    float _243 = _237;
    bool _245 = _77 == 256;
    float _247 = _243;
    if (_175)
    {
        _241 = (*spvDescriptorSet0.vp_c14)._m0[278].z;
    }
    float _249 = _241;
    float _251 = _249;
    if (_187)
    {
        _247 = (*spvDescriptorSet0.vp_c14)._m0[279].x;
    }
    float _253 = _247;
    bool _255 = _77 == 272;
    float _257 = _253;
    if (_187)
    {
        _251 = (*spvDescriptorSet0.vp_c14)._m0[279].z;
    }
    float _259 = _251;
    float _261 = _259;
    if (_195)
    {
        _257 = (*spvDescriptorSet0.vp_c14)._m0[280].x;
    }
    float _263 = _257;
    int _265 = min(_235, 15);
    bool _267 = _77 == 288;
    float _269 = _263;
    if (_195)
    {
        _261 = (*spvDescriptorSet0.vp_c14)._m0[280].z;
    }
    float _271 = _261;
    float _273 = float(_265);
    bool _275 = _77 == 304;
    int _277 = _265 << 4;
    int _279 = _277 + 4288;
    float _281 = _271;
    float _283 = as_type<float>(_279);
    if (_209)
    {
        _269 = (*spvDescriptorSet0.vp_c14)._m0[281].x;
    }
    float _285 = _269;
    float _287 = _285;
    if (_209)
    {
        _281 = (*spvDescriptorSet0.vp_c14)._m0[281].z;
    }
    float _289 = _281;
    float _291 = -_273;
    float _293 = _291 + (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _295 = _289;
    if (_219)
    {
        _287 = (*spvDescriptorSet0.vp_c14)._m0[282].x;
    }
    float _297 = _287;
    int _299 = _279 + 8;
    uint _302 = uint(int(uint(_299) >> uint(2)));
    uint _304 = uint(int(uint(int(_302)) >> uint(2)));
    int _306 = int(_302) & 3;
    float _308 = (*spvDescriptorSet0.vp_c14)._m0[int(_304)][_306];
    int _310 = int(_302) + 1;
    uint _312 = uint(int(uint(_310) >> uint(2)));
    int _314 = _310 & 3;
    float _316 = (*spvDescriptorSet0.vp_c14)._m0[int(_312)][_314];
    bool _318 = _77 == 320;
    float _320 = _293 + 1.0;
    float _322 = _297;
    if (_219)
    {
        _295 = (*spvDescriptorSet0.vp_c14)._m0[282].z;
    }
    float _324 = _295;
    float _326 = _324;
    if (_231)
    {
        _322 = (*spvDescriptorSet0.vp_c14)._m0[283].x;
    }
    float _328 = _322;
    bool _330 = _77 == 336;
    float _332 = exp2(_320);
    float _334 = _328;
    if (_231)
    {
        _326 = (*spvDescriptorSet0.vp_c14)._m0[283].z;
    }
    float _336 = _326;
    float _338 = _336;
    if (_245)
    {
        _334 = (*spvDescriptorSet0.vp_c14)._m0[284].x;
    }
    float _340 = _334;
    bool _342 = _77 == 352;
    float _344 = _340;
    if (_245)
    {
        _338 = (*spvDescriptorSet0.vp_c14)._m0[284].z;
    }
    float _346 = _338;
    float _348 = _346;
    if (_255)
    {
        _344 = (*spvDescriptorSet0.vp_c14)._m0[285].x;
    }
    float _350 = _344;
    bool _352 = _77 == 368;
    float _354 = _350;
    if (_255)
    {
        _348 = (*spvDescriptorSet0.vp_c14)._m0[285].z;
    }
    float _356 = _348;
    float _358 = _356;
    if (_267)
    {
        _354 = (*spvDescriptorSet0.vp_c14)._m0[286].x;
    }
    float _360 = _354;
    float _362 = 1.0 / _332;
    bool _364 = _77 == 384;
    float _366 = _360;
    if (_267)
    {
        _358 = (*spvDescriptorSet0.vp_c14)._m0[286].z;
    }
    float _368 = _358;
    float _370 = _368;
    if (_275)
    {
        _366 = (*spvDescriptorSet0.vp_c14)._m0[287].x;
    }
    float _372 = _366;
    bool _374 = _77 == 400;
    float _376 = _372;
    if (_275)
    {
        _370 = (*spvDescriptorSet0.vp_c14)._m0[287].z;
    }
    float _378 = _370;
    bool _380 = _77 == 416;
    float _382 = _378;
    if (_318)
    {
        _376 = (*spvDescriptorSet0.vp_c14)._m0[288].x;
    }
    float _384 = _376;
    float _386 = _384;
    if (_318)
    {
        _382 = (*spvDescriptorSet0.vp_c14)._m0[288].z;
    }
    float _388 = _382;
    float _390 = _388;
    if (_330)
    {
        _386 = (*spvDescriptorSet0.vp_c14)._m0[289].x;
    }
    float _392 = _386;
    bool _394 = _77 == 432;
    float _396 = _392;
    if (_330)
    {
        _390 = (*spvDescriptorSet0.vp_c14)._m0[289].z;
    }
    float _398 = _390;
    float _400 = _398;
    if (_342)
    {
        _396 = (*spvDescriptorSet0.vp_c14)._m0[290].x;
    }
    float _402 = _396;
    bool _404 = _77 == 448;
    float _406 = _402;
    if (_342)
    {
        _400 = (*spvDescriptorSet0.vp_c14)._m0[290].z;
    }
    float _408 = _400;
    float _410 = _408;
    if (_352)
    {
        _406 = (*spvDescriptorSet0.vp_c14)._m0[291].x;
    }
    float _412 = _406;
    bool _414 = _77 == 464;
    float _416 = _412;
    if (_352)
    {
        _410 = (*spvDescriptorSet0.vp_c14)._m0[291].z;
    }
    float _418 = _410;
    float _420 = _418;
    if (_364)
    {
        _416 = (*spvDescriptorSet0.vp_c14)._m0[292].x;
    }
    float _422 = _416;
    bool _424 = _77 == 480;
    float _426 = _422;
    if (_364)
    {
        _420 = (*spvDescriptorSet0.vp_c14)._m0[292].z;
    }
    float _428 = _420;
    float _430 = _428;
    if (_374)
    {
        _426 = (*spvDescriptorSet0.vp_c14)._m0[293].x;
    }
    float _432 = _426;
    bool _434 = _77 == 496;
    float _436 = _432;
    if (_374)
    {
        _430 = (*spvDescriptorSet0.vp_c14)._m0[293].z;
    }
    float _438 = _430;
    float _440 = _438;
    if (_380)
    {
        _436 = (*spvDescriptorSet0.vp_c14)._m0[294].x;
    }
    float _442 = _436;
    bool _444 = _77 == 512;
    float _446 = _442;
    if (_380)
    {
        _440 = (*spvDescriptorSet0.vp_c14)._m0[294].z;
    }
    float _448 = _440;
    bool _450 = _77 == 528;
    float _452 = _448;
    if (_394)
    {
        _446 = (*spvDescriptorSet0.vp_c14)._m0[295].x;
    }
    float _454 = _446;
    float _456 = _454;
    if (_394)
    {
        _452 = (*spvDescriptorSet0.vp_c14)._m0[295].z;
    }
    float _458 = _452;
    float _460 = _458;
    if (_404)
    {
        _456 = (*spvDescriptorSet0.vp_c14)._m0[296].x;
    }
    float _462 = _456;
    bool _464 = _77 == 544;
    float _466 = _462;
    if (_404)
    {
        _460 = (*spvDescriptorSet0.vp_c14)._m0[296].z;
    }
    float _468 = _460;
    float _470 = _468;
    if (_414)
    {
        _466 = (*spvDescriptorSet0.vp_c14)._m0[297].x;
    }
    float _472 = _466;
    bool _474 = _77 == 560;
    float _476 = _472;
    if (_414)
    {
        _470 = (*spvDescriptorSet0.vp_c14)._m0[297].z;
    }
    float _478 = _470;
    float _480 = _478;
    if (_424)
    {
        _476 = (*spvDescriptorSet0.vp_c14)._m0[298].x;
    }
    float _482 = _476;
    bool _484 = _77 == 576;
    float _486 = _482;
    if (_424)
    {
        _480 = (*spvDescriptorSet0.vp_c14)._m0[298].z;
    }
    float _488 = _480;
    float _490 = _488;
    if (_434)
    {
        _486 = (*spvDescriptorSet0.vp_c14)._m0[299].x;
    }
    float _492 = _486;
    bool _494 = _77 == 592;
    float _496 = _492;
    if (_434)
    {
        _490 = (*spvDescriptorSet0.vp_c14)._m0[299].z;
    }
    float _498 = _490;
    float _500 = _498;
    if (_444)
    {
        _496 = (*spvDescriptorSet0.vp_c14)._m0[300].x;
    }
    float _502 = _496;
    bool _504 = _77 == 608;
    float _506 = _502;
    if (_444)
    {
        _500 = (*spvDescriptorSet0.vp_c14)._m0[300].z;
    }
    float _508 = _500;
    float _510 = _508;
    if (_450)
    {
        _506 = (*spvDescriptorSet0.vp_c14)._m0[301].x;
    }
    float _512 = _506;
    bool _514 = _77 == 624;
    float _516 = _512;
    if (_450)
    {
        _510 = (*spvDescriptorSet0.vp_c14)._m0[301].z;
    }
    float _518 = _510;
    bool _520 = _77 == 640;
    float _522 = _518;
    if (_464)
    {
        _516 = (*spvDescriptorSet0.vp_c14)._m0[302].x;
    }
    float _524 = _516;
    float _526 = _524;
    if (_464)
    {
        _522 = (*spvDescriptorSet0.vp_c14)._m0[302].z;
    }
    float _528 = _522;
    float _530 = _528;
    if (_474)
    {
        _526 = (*spvDescriptorSet0.vp_c14)._m0[303].x;
    }
    float _532 = _526;
    bool _534 = _77 == 656;
    float _536 = _532;
    if (_474)
    {
        _530 = (*spvDescriptorSet0.vp_c14)._m0[303].z;
    }
    float _538 = _530;
    float _540 = _538;
    if (_484)
    {
        _536 = (*spvDescriptorSet0.vp_c14)._m0[304].x;
    }
    float _542 = _536;
    bool _544 = _77 == 672;
    float _546 = _542;
    if (_484)
    {
        _540 = (*spvDescriptorSet0.vp_c14)._m0[304].z;
    }
    float _548 = _540;
    float _550 = _548;
    if (_494)
    {
        _546 = (*spvDescriptorSet0.vp_c14)._m0[305].x;
    }
    float _552 = _546;
    bool _554 = _77 == 688;
    float _556 = _552;
    if (_494)
    {
        _550 = (*spvDescriptorSet0.vp_c14)._m0[305].z;
    }
    float _558 = _550;
    float _560 = _558;
    if (_504)
    {
        _556 = (*spvDescriptorSet0.vp_c14)._m0[306].x;
    }
    float _562 = _556;
    bool _564 = _77 == 704;
    float _566 = _562;
    if (_504)
    {
        _560 = (*spvDescriptorSet0.vp_c14)._m0[306].z;
    }
    float _568 = _560;
    float _570 = _568;
    if (_514)
    {
        _566 = (*spvDescriptorSet0.vp_c14)._m0[307].x;
    }
    float _572 = _566;
    bool _574 = _77 == 720;
    float _576 = _572;
    if (_514)
    {
        _570 = (*spvDescriptorSet0.vp_c14)._m0[307].z;
    }
    float _578 = _570;
    float _580 = _578;
    if (_520)
    {
        _576 = (*spvDescriptorSet0.vp_c14)._m0[308].x;
    }
    float _582 = _576;
    bool _584 = _77 == 736;
    float _586 = _582;
    if (_520)
    {
        _580 = (*spvDescriptorSet0.vp_c14)._m0[308].z;
    }
    float _588 = _580;
    bool _590 = _77 == 752;
    float _592 = _588;
    if (_534)
    {
        _586 = (*spvDescriptorSet0.vp_c14)._m0[309].x;
    }
    float _594 = _586;
    float _596 = _594;
    if (_544)
    {
        _596 = (*spvDescriptorSet0.vp_c14)._m0[310].x;
    }
    float _598 = _596;
    float _600 = _598;
    if (_554)
    {
        _600 = (*spvDescriptorSet0.vp_c14)._m0[311].x;
    }
    float _602 = _600;
    float _604 = _602;
    if (_564)
    {
        _604 = (*spvDescriptorSet0.vp_c14)._m0[312].x;
    }
    float _606 = _604;
    float _608 = _606;
    if (_574)
    {
        _608 = (*spvDescriptorSet0.vp_c14)._m0[313].x;
    }
    float _610 = _608;
    float _612 = _610;
    if (_584)
    {
        _612 = (*spvDescriptorSet0.vp_c14)._m0[314].x;
    }
    float _614 = _612;
    float _616 = _614;
    if (_590)
    {
        _616 = (*spvDescriptorSet0.vp_c14)._m0[315].x;
    }
    float _618 = _616;
    float _620 = _362 * _618;
    if (_534)
    {
        _592 = (*spvDescriptorSet0.vp_c14)._m0[309].z;
    }
    float _622 = _592;
    float _624 = _622;
    if (_544)
    {
        _624 = (*spvDescriptorSet0.vp_c14)._m0[310].z;
    }
    float _626 = _624;
    float _628 = _620 * _64;
    float _630 = _626;
    if (_554)
    {
        _630 = (*spvDescriptorSet0.vp_c14)._m0[311].z;
    }
    float _632 = _630;
    float _634 = _632;
    if (_564)
    {
        _634 = (*spvDescriptorSet0.vp_c14)._m0[312].z;
    }
    float _636 = _634;
    float _638 = floor(_628);
    float _640 = _636;
    if (_574)
    {
        _640 = (*spvDescriptorSet0.vp_c14)._m0[313].z;
    }
    float _642 = _640;
    float _644 = _642;
    if (_584)
    {
        _644 = (*spvDescriptorSet0.vp_c14)._m0[314].z;
    }
    float _646 = _644;
    float _648 = _646;
    if (_590)
    {
        _648 = (*spvDescriptorSet0.vp_c14)._m0[315].z;
    }
    float _650 = _648;
    float _652 = -_638;
    float _654 = _628 + _652;
    float _656 = _332 * _650;
    float _658 = _654 * 2.0;
    float _660 = -_654;
    float _662 = fma(_656, _660, _64);
    float _664 = floor(_658);
    float _666 = _656 * _664;
    float _668 = _666 * 0.5;
    float _670 = _668 + _662;
    float _672 = fma(_68, _670, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _674 = fma(_670, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _676 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _678 = _672 + _676;
    float _680 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _682 = _674 + _680;
    float _684 = _678 * _678;
    float _686 = fma(_75, _75, _684);
    float _688 = fma(_682, _682, _686);
    float _690 = sqrt(_688);
    float _692 = -_316;
    float _694 = fma(_690, _308, _692);
    float _696 = precise::clamp(_694, 0.0, 1.0);
    float _698 = -_668;
    float _700 = fma(_698, _696, _670);
    float _702 = _670;
    float _704 = _688;
    if (!_103)
    {
        _702 = (*spvDescriptorSet0.vp_c15)._m0[6].x;
    }
    float _706 = _702;
    float _708 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].z);
    float _710 = fma(_700, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _712 = _706;
    float _714 = (*spvDescriptorSet0.vp_c15)._m0[4].x;
    if (!_103)
    {
        float _716 = fma(_708, _706, (*spvDescriptorSet0.vp_c15)._m0[6].z);
        _107 = _716;
    }
    float _718 = _107;
    float _720 = fma(_710, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].w);
    float _722 = _718;
    if (!_103)
    {
        float _724 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _718);
        _722 = _724;
    }
    float _726 = _722;
    if (!_103)
    {
        float _728 = fma(_720, _706, (*spvDescriptorSet0.vp_c15)._m0[6].w);
        _704 = _728;
    }
    float _730 = _704;
    float _732 = _730;
    if (!_103)
    {
        float _734 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _730);
        _283 = _734;
    }
    float _736 = _283;
    if (!_103)
    {
        float2 _2140 = float2(_726, _736);
        float _738 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2140, float2(0.0), isnan(_2140)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2140, float2(0.0), isnan(_2140)), level(0.0)).x;
        _732 = _738;
    }
    float _740 = _732;
    if (_103)
    {
        _109 = (*spvDescriptorSet0.vp_c15)._m0[14].x;
    }
    float _742 = _109;
    float _744 = 0.0;
    if (_103)
    {
        _744 = (*spvDescriptorSet0.vp_c15)._m0[15].x;
    }
    float _746 = _744;
    if (_103)
    {
        float _748 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, _742, (*spvDescriptorSet0.vp_c15)._m0[14].z);
        _712 = _748;
    }
    float _750 = _712;
    float _752 = _750;
    if (_103)
    {
        float _754 = fma(_710, _742, (*spvDescriptorSet0.vp_c15)._m0[14].w);
        _111 = _754;
    }
    float _756 = _111;
    float _758 = _756;
    if (_103)
    {
        float _760 = fma(_750, _746, (*spvDescriptorSet0.vp_c15)._m0[15].z);
        _752 = _760;
    }
    float _762 = _752;
    float _764 = _762;
    if (_103)
    {
        float _766 = fma(_756, _746, (*spvDescriptorSet0.vp_c15)._m0[15].w);
        _758 = _766;
    }
    float _768 = _758;
    float _770 = _768;
    if (_103)
    {
        float _772 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _762);
        _764 = _772;
    }
    float _774 = _764;
    if (_103)
    {
        float _776 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _768);
        _770 = _776;
    }
    float _778 = _770;
    float _780 = _740;
    if (_103)
    {
        float2 _2232 = float2(_774, _778);
        float _782 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_2232, float2(0.0), isnan(_2232)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_2232, float2(0.0), isnan(_2232)), level(0.0)).x;
        _780 = _782;
    }
    float _784 = _780;
    float _786 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _788 = _710 + _786;
    float _790 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _792 = (*spvDescriptorSet0.vp_c15)._m0[0].z + _790;
    float _794 = _788 * _788;
    float _796 = fma(_792, _792, _794);
    float _798 = fma(_708, (*spvDescriptorSet0.vp_c15)._m0[8].x, (*spvDescriptorSet0.vp_c15)._m0[8].z);
    float _800 = fma(_720, (*spvDescriptorSet0.vp_c15)._m0[8].x, (*spvDescriptorSet0.vp_c15)._m0[8].w);
    float _802 = sqrt(_796);
    float _804 = fma(_708, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].z);
    float _806 = fma(_720, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].w);
    bool _808 = _802 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _810 = (*spvDescriptorSet0.vp_c15)._m0[7].x;
    float _812 = (*spvDescriptorSet0.vp_c14)._m0[0].y;
    if (!_808)
    {
        _810 = (*spvDescriptorSet0.vp_c15)._m0[0].z;
    }
    float _814 = _810;
    float _816 = fma(_784, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _818 = _816 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _820 = _814;
    if (!_808)
    {
        _812 = _816;
    }
    float _822 = _812;
    float _824 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[2].x, _818);
    float _826 = fma(_710, (*spvDescriptorSet0.vp_c4)._m0[2].z, _824);
    float _828 = _826 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _830 = _826;
    float _832 = _822;
    if (!_808)
    {
        _830 = _710;
    }
    float _834 = _830;
    float _836 = _834;
    if (!_808)
    {
        _714 = _828;
    }
    float _838 = _714;
    bool _840 = !_808;
    float _842 = _838;
    if (!_840)
    {
        float _844 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _846 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _848 = _802 + _846;
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
    out.m_40.z = _804;
    out.m_40.w = _806;
    float _900 = fma(_890, (*spvDescriptorSet0.vp_c4)._m0[1].x, _896);
    float _902 = fma(_890, (*spvDescriptorSet0.vp_c4)._m0[0].x, _898);
    out.m_42.x = _798;
    out.m_42.y = _800;
    float _904 = fma(_892, (*spvDescriptorSet0.vp_c4)._m0[1].z, _900);
    float _906 = fma(_892, (*spvDescriptorSet0.vp_c4)._m0[0].z, _902);
    out.m_44.x = (*spvDescriptorSet0.vp_c15)._m0[0].z;
    out.m_44.y = _816;
    out.m_44.z = _710;
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
    float _107 = _75;
    float _109 = _64;
    float _111 = _62;
    if (_81)
    {
        _105 = (*spvDescriptorSet0.vp_c14)._m0[268].x;
    }
    float _113 = _105;
    float _115 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _117 = _91 + _115;
    float _119 = fma(_64, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    bool _121 = _77 == 96;
    float _123 = _117 * _117;
    float _125 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _127 = _119 + _125;
    float _129 = 0.0;
    float _131 = _113;
    if (_81)
    {
        _129 = (*spvDescriptorSet0.vp_c14)._m0[268].z;
    }
    float _133 = _129;
    float _135 = fma(_75, _75, _123);
    float _137 = _133;
    if (_83)
    {
        _131 = (*spvDescriptorSet0.vp_c14)._m0[269].x;
    }
    float _139 = _131;
    bool _141 = _77 == 112;
    float _143 = fma(_127, _127, _135);
    float _145 = _139;
    if (_83)
    {
        _137 = (*spvDescriptorSet0.vp_c14)._m0[269].z;
    }
    float _147 = _137;
    float _149 = _147;
    if (_85)
    {
        _145 = (*spvDescriptorSet0.vp_c14)._m0[270].x;
    }
    float _151 = _145;
    float _153 = rsqrt(_143);
    bool _155 = _77 == 128;
    float _157 = _151;
    if (_85)
    {
        _149 = (*spvDescriptorSet0.vp_c14)._m0[270].z;
    }
    float _159 = _149;
    float _161 = _159;
    if (_87)
    {
        _157 = (*spvDescriptorSet0.vp_c14)._m0[271].x;
    }
    float _163 = _157;
    bool _165 = _77 == 144;
    float _167 = _163;
    if (_87)
    {
        _161 = (*spvDescriptorSet0.vp_c14)._m0[271].z;
    }
    float _169 = _161;
    float _171 = _169;
    if (_89)
    {
        _167 = (*spvDescriptorSet0.vp_c14)._m0[272].x;
    }
    float _173 = _167;
    bool _175 = _77 == 160;
    float _177 = _173;
    if (_89)
    {
        _171 = (*spvDescriptorSet0.vp_c14)._m0[272].z;
    }
    float _179 = _171;
    float _181 = _153 * (*spvDescriptorSet0.vp_c14)._m0[268].x;
    float _183 = _179;
    if (_93)
    {
        _177 = (*spvDescriptorSet0.vp_c14)._m0[273].x;
    }
    float _185 = _177;
    bool _187 = _77 == 176;
    float _189 = _185;
    if (_93)
    {
        _183 = (*spvDescriptorSet0.vp_c14)._m0[273].z;
    }
    float _191 = _183;
    float _193 = log2(_181);
    bool _195 = _77 == 192;
    float _197 = _191;
    if (_121)
    {
        _189 = (*spvDescriptorSet0.vp_c14)._m0[274].x;
    }
    float _199 = _189;
    float _201 = _199;
    if (_121)
    {
        _197 = (*spvDescriptorSet0.vp_c14)._m0[274].z;
    }
    float _203 = _197;
    float _205 = _203;
    if (_141)
    {
        _201 = (*spvDescriptorSet0.vp_c14)._m0[275].x;
    }
    float _207 = _201;
    bool _209 = _77 == 208;
    float _211 = _207;
    if (_141)
    {
        _205 = (*spvDescriptorSet0.vp_c14)._m0[275].z;
    }
    float _213 = _205;
    float _215 = _213;
    if (_155)
    {
        _211 = (*spvDescriptorSet0.vp_c14)._m0[276].x;
    }
    float _217 = _211;
    bool _219 = _77 == 224;
    float _221 = _193 + 1.2999999523162841796875;
    float _223 = _217;
    if (_155)
    {
        _215 = (*spvDescriptorSet0.vp_c14)._m0[276].z;
    }
    float _225 = _215;
    float _227 = _225;
    if (_165)
    {
        _223 = (*spvDescriptorSet0.vp_c14)._m0[277].x;
    }
    float _229 = _223;
    bool _231 = _77 == 240;
    float _233 = trunc(_221);
    int _235 = int(_233);
    float _237 = _229;
    if (_165)
    {
        _227 = (*spvDescriptorSet0.vp_c14)._m0[277].z;
    }
    float _239 = _227;
    float _241 = _239;
    if (_175)
    {
        _237 = (*spvDescriptorSet0.vp_c14)._m0[278].x;
    }
    float _243 = _237;
    bool _245 = _77 == 256;
    float _247 = _243;
    if (_175)
    {
        _241 = (*spvDescriptorSet0.vp_c14)._m0[278].z;
    }
    float _249 = _241;
    float _251 = _249;
    if (_187)
    {
        _247 = (*spvDescriptorSet0.vp_c14)._m0[279].x;
    }
    float _253 = _247;
    bool _255 = _77 == 272;
    float _257 = _253;
    if (_187)
    {
        _251 = (*spvDescriptorSet0.vp_c14)._m0[279].z;
    }
    float _259 = _251;
    float _261 = _259;
    if (_195)
    {
        _257 = (*spvDescriptorSet0.vp_c14)._m0[280].x;
    }
    float _263 = _257;
    int _265 = min(_235, 15);
    bool _267 = _77 == 288;
    float _269 = _263;
    if (_195)
    {
        _261 = (*spvDescriptorSet0.vp_c14)._m0[280].z;
    }
    float _271 = _261;
    float _273 = float(_265);
    bool _275 = _77 == 304;
    int _277 = _265 << 4;
    int _279 = _277 + 4288;
    float _281 = _271;
    float _283 = as_type<float>(_279);
    if (_209)
    {
        _269 = (*spvDescriptorSet0.vp_c14)._m0[281].x;
    }
    float _285 = _269;
    float _287 = _285;
    if (_209)
    {
        _281 = (*spvDescriptorSet0.vp_c14)._m0[281].z;
    }
    float _289 = _281;
    float _291 = -_273;
    float _293 = _291 + (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _295 = _289;
    if (_219)
    {
        _287 = (*spvDescriptorSet0.vp_c14)._m0[282].x;
    }
    float _297 = _287;
    int _299 = _279 + 8;
    uint _302 = uint(int(uint(_299) >> uint(2)));
    uint _304 = uint(int(uint(int(_302)) >> uint(2)));
    int _306 = int(_302) & 3;
    float _308 = (*spvDescriptorSet0.vp_c14)._m0[int(_304)][_306];
    int _310 = int(_302) + 1;
    uint _312 = uint(int(uint(_310) >> uint(2)));
    int _314 = _310 & 3;
    float _316 = (*spvDescriptorSet0.vp_c14)._m0[int(_312)][_314];
    bool _318 = _77 == 320;
    float _320 = _293 + 1.0;
    float _322 = _297;
    if (_219)
    {
        _295 = (*spvDescriptorSet0.vp_c14)._m0[282].z;
    }
    float _324 = _295;
    float _326 = _324;
    if (_231)
    {
        _322 = (*spvDescriptorSet0.vp_c14)._m0[283].x;
    }
    float _328 = _322;
    bool _330 = _77 == 336;
    float _332 = exp2(_320);
    float _334 = _328;
    if (_231)
    {
        _326 = (*spvDescriptorSet0.vp_c14)._m0[283].z;
    }
    float _336 = _326;
    float _338 = _336;
    if (_245)
    {
        _334 = (*spvDescriptorSet0.vp_c14)._m0[284].x;
    }
    float _340 = _334;
    bool _342 = _77 == 352;
    float _344 = _340;
    if (_245)
    {
        _338 = (*spvDescriptorSet0.vp_c14)._m0[284].z;
    }
    float _346 = _338;
    float _348 = _346;
    if (_255)
    {
        _344 = (*spvDescriptorSet0.vp_c14)._m0[285].x;
    }
    float _350 = _344;
    bool _352 = _77 == 368;
    float _354 = _350;
    if (_255)
    {
        _348 = (*spvDescriptorSet0.vp_c14)._m0[285].z;
    }
    float _356 = _348;
    float _358 = _356;
    if (_267)
    {
        _354 = (*spvDescriptorSet0.vp_c14)._m0[286].x;
    }
    float _360 = _354;
    float _362 = 1.0 / _332;
    bool _364 = _77 == 384;
    float _366 = _360;
    if (_267)
    {
        _358 = (*spvDescriptorSet0.vp_c14)._m0[286].z;
    }
    float _368 = _358;
    float _370 = _368;
    if (_275)
    {
        _366 = (*spvDescriptorSet0.vp_c14)._m0[287].x;
    }
    float _372 = _366;
    bool _374 = _77 == 400;
    float _376 = _372;
    if (_275)
    {
        _370 = (*spvDescriptorSet0.vp_c14)._m0[287].z;
    }
    float _378 = _370;
    bool _380 = _77 == 416;
    float _382 = _378;
    if (_318)
    {
        _376 = (*spvDescriptorSet0.vp_c14)._m0[288].x;
    }
    float _384 = _376;
    float _386 = _384;
    if (_318)
    {
        _382 = (*spvDescriptorSet0.vp_c14)._m0[288].z;
    }
    float _388 = _382;
    float _390 = _388;
    if (_330)
    {
        _386 = (*spvDescriptorSet0.vp_c14)._m0[289].x;
    }
    float _392 = _386;
    bool _394 = _77 == 432;
    float _396 = _392;
    if (_330)
    {
        _390 = (*spvDescriptorSet0.vp_c14)._m0[289].z;
    }
    float _398 = _390;
    float _400 = _398;
    if (_342)
    {
        _396 = (*spvDescriptorSet0.vp_c14)._m0[290].x;
    }
    float _402 = _396;
    bool _404 = _77 == 448;
    float _406 = _402;
    if (_342)
    {
        _400 = (*spvDescriptorSet0.vp_c14)._m0[290].z;
    }
    float _408 = _400;
    float _410 = _408;
    if (_352)
    {
        _406 = (*spvDescriptorSet0.vp_c14)._m0[291].x;
    }
    float _412 = _406;
    bool _414 = _77 == 464;
    float _416 = _412;
    if (_352)
    {
        _410 = (*spvDescriptorSet0.vp_c14)._m0[291].z;
    }
    float _418 = _410;
    float _420 = _418;
    if (_364)
    {
        _416 = (*spvDescriptorSet0.vp_c14)._m0[292].x;
    }
    float _422 = _416;
    bool _424 = _77 == 480;
    float _426 = _422;
    if (_364)
    {
        _420 = (*spvDescriptorSet0.vp_c14)._m0[292].z;
    }
    float _428 = _420;
    float _430 = _428;
    if (_374)
    {
        _426 = (*spvDescriptorSet0.vp_c14)._m0[293].x;
    }
    float _432 = _426;
    bool _434 = _77 == 496;
    float _436 = _432;
    if (_374)
    {
        _430 = (*spvDescriptorSet0.vp_c14)._m0[293].z;
    }
    float _438 = _430;
    float _440 = _438;
    if (_380)
    {
        _436 = (*spvDescriptorSet0.vp_c14)._m0[294].x;
    }
    float _442 = _436;
    bool _444 = _77 == 512;
    float _446 = _442;
    if (_380)
    {
        _440 = (*spvDescriptorSet0.vp_c14)._m0[294].z;
    }
    float _448 = _440;
    bool _450 = _77 == 528;
    float _452 = _448;
    if (_394)
    {
        _446 = (*spvDescriptorSet0.vp_c14)._m0[295].x;
    }
    float _454 = _446;
    float _456 = _454;
    if (_394)
    {
        _452 = (*spvDescriptorSet0.vp_c14)._m0[295].z;
    }
    float _458 = _452;
    float _460 = _458;
    if (_404)
    {
        _456 = (*spvDescriptorSet0.vp_c14)._m0[296].x;
    }
    float _462 = _456;
    bool _464 = _77 == 544;
    float _466 = _462;
    if (_404)
    {
        _460 = (*spvDescriptorSet0.vp_c14)._m0[296].z;
    }
    float _468 = _460;
    float _470 = _468;
    if (_414)
    {
        _466 = (*spvDescriptorSet0.vp_c14)._m0[297].x;
    }
    float _472 = _466;
    bool _474 = _77 == 560;
    float _476 = _472;
    if (_414)
    {
        _470 = (*spvDescriptorSet0.vp_c14)._m0[297].z;
    }
    float _478 = _470;
    float _480 = _478;
    if (_424)
    {
        _476 = (*spvDescriptorSet0.vp_c14)._m0[298].x;
    }
    float _482 = _476;
    bool _484 = _77 == 576;
    float _486 = _482;
    if (_424)
    {
        _480 = (*spvDescriptorSet0.vp_c14)._m0[298].z;
    }
    float _488 = _480;
    float _490 = _488;
    if (_434)
    {
        _486 = (*spvDescriptorSet0.vp_c14)._m0[299].x;
    }
    float _492 = _486;
    bool _494 = _77 == 592;
    float _496 = _492;
    if (_434)
    {
        _490 = (*spvDescriptorSet0.vp_c14)._m0[299].z;
    }
    float _498 = _490;
    float _500 = _498;
    if (_444)
    {
        _496 = (*spvDescriptorSet0.vp_c14)._m0[300].x;
    }
    float _502 = _496;
    bool _504 = _77 == 608;
    float _506 = _502;
    if (_444)
    {
        _500 = (*spvDescriptorSet0.vp_c14)._m0[300].z;
    }
    float _508 = _500;
    float _510 = _508;
    if (_450)
    {
        _506 = (*spvDescriptorSet0.vp_c14)._m0[301].x;
    }
    float _512 = _506;
    bool _514 = _77 == 624;
    float _516 = _512;
    if (_450)
    {
        _510 = (*spvDescriptorSet0.vp_c14)._m0[301].z;
    }
    float _518 = _510;
    bool _520 = _77 == 640;
    float _522 = _518;
    if (_464)
    {
        _516 = (*spvDescriptorSet0.vp_c14)._m0[302].x;
    }
    float _524 = _516;
    float _526 = _524;
    if (_464)
    {
        _522 = (*spvDescriptorSet0.vp_c14)._m0[302].z;
    }
    float _528 = _522;
    float _530 = _528;
    if (_474)
    {
        _526 = (*spvDescriptorSet0.vp_c14)._m0[303].x;
    }
    float _532 = _526;
    bool _534 = _77 == 656;
    float _536 = _532;
    if (_474)
    {
        _530 = (*spvDescriptorSet0.vp_c14)._m0[303].z;
    }
    float _538 = _530;
    float _540 = _538;
    if (_484)
    {
        _536 = (*spvDescriptorSet0.vp_c14)._m0[304].x;
    }
    float _542 = _536;
    bool _544 = _77 == 672;
    float _546 = _542;
    if (_484)
    {
        _540 = (*spvDescriptorSet0.vp_c14)._m0[304].z;
    }
    float _548 = _540;
    float _550 = _548;
    if (_494)
    {
        _546 = (*spvDescriptorSet0.vp_c14)._m0[305].x;
    }
    float _552 = _546;
    bool _554 = _77 == 688;
    float _556 = _552;
    if (_494)
    {
        _550 = (*spvDescriptorSet0.vp_c14)._m0[305].z;
    }
    float _558 = _550;
    float _560 = _558;
    if (_504)
    {
        _556 = (*spvDescriptorSet0.vp_c14)._m0[306].x;
    }
    float _562 = _556;
    bool _564 = _77 == 704;
    float _566 = _562;
    if (_504)
    {
        _560 = (*spvDescriptorSet0.vp_c14)._m0[306].z;
    }
    float _568 = _560;
    float _570 = _568;
    if (_514)
    {
        _566 = (*spvDescriptorSet0.vp_c14)._m0[307].x;
    }
    float _572 = _566;
    bool _574 = _77 == 720;
    float _576 = _572;
    if (_514)
    {
        _570 = (*spvDescriptorSet0.vp_c14)._m0[307].z;
    }
    float _578 = _570;
    float _580 = _578;
    if (_520)
    {
        _576 = (*spvDescriptorSet0.vp_c14)._m0[308].x;
    }
    float _582 = _576;
    bool _584 = _77 == 736;
    float _586 = _582;
    if (_520)
    {
        _580 = (*spvDescriptorSet0.vp_c14)._m0[308].z;
    }
    float _588 = _580;
    bool _590 = _77 == 752;
    float _592 = _588;
    if (_534)
    {
        _586 = (*spvDescriptorSet0.vp_c14)._m0[309].x;
    }
    float _594 = _586;
    float _596 = _594;
    if (_544)
    {
        _596 = (*spvDescriptorSet0.vp_c14)._m0[310].x;
    }
    float _598 = _596;
    float _600 = _598;
    if (_554)
    {
        _600 = (*spvDescriptorSet0.vp_c14)._m0[311].x;
    }
    float _602 = _600;
    float _604 = _602;
    if (_564)
    {
        _604 = (*spvDescriptorSet0.vp_c14)._m0[312].x;
    }
    float _606 = _604;
    float _608 = _606;
    if (_574)
    {
        _608 = (*spvDescriptorSet0.vp_c14)._m0[313].x;
    }
    float _610 = _608;
    float _612 = _610;
    if (_584)
    {
        _612 = (*spvDescriptorSet0.vp_c14)._m0[314].x;
    }
    float _614 = _612;
    float _616 = _614;
    if (_590)
    {
        _616 = (*spvDescriptorSet0.vp_c14)._m0[315].x;
    }
    float _618 = _616;
    float _620 = _362 * _618;
    if (_534)
    {
        _592 = (*spvDescriptorSet0.vp_c14)._m0[309].z;
    }
    float _622 = _592;
    float _624 = _622;
    if (_544)
    {
        _624 = (*spvDescriptorSet0.vp_c14)._m0[310].z;
    }
    float _626 = _624;
    float _628 = _620 * _64;
    float _630 = _626;
    if (_554)
    {
        _630 = (*spvDescriptorSet0.vp_c14)._m0[311].z;
    }
    float _632 = _630;
    float _634 = _632;
    if (_564)
    {
        _634 = (*spvDescriptorSet0.vp_c14)._m0[312].z;
    }
    float _636 = _634;
    float _638 = floor(_628);
    float _640 = _636;
    if (_574)
    {
        _640 = (*spvDescriptorSet0.vp_c14)._m0[313].z;
    }
    float _642 = _640;
    float _644 = _642;
    if (_584)
    {
        _644 = (*spvDescriptorSet0.vp_c14)._m0[314].z;
    }
    float _646 = _644;
    float _648 = _646;
    if (_590)
    {
        _648 = (*spvDescriptorSet0.vp_c14)._m0[315].z;
    }
    float _650 = _648;
    float _652 = -_638;
    float _654 = _628 + _652;
    float _656 = _332 * _650;
    float _658 = _654 * 2.0;
    float _660 = -_654;
    float _662 = fma(_656, _660, _64);
    float _664 = floor(_658);
    float _666 = _656 * _664;
    float _668 = _666 * 0.5;
    float _670 = _668 + _662;
    float _672 = fma(_68, _670, (*spvDescriptorSet0.vp_c15)._m0[3].x);
    float _674 = fma(_670, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _676 = -(*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _678 = _672 + _676;
    float _680 = -(*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _682 = _674 + _680;
    float _684 = _678 * _678;
    float _686 = fma(_75, _75, _684);
    float _688 = fma(_682, _682, _686);
    float _690 = sqrt(_688);
    float _692 = -_316;
    float _694 = fma(_690, _308, _692);
    float _696 = precise::clamp(_694, 0.0, 1.0);
    float _698 = -_668;
    float _700 = fma(_698, _696, _670);
    float _702 = _670;
    float _704 = _688;
    if (!_103)
    {
        _702 = (*spvDescriptorSet0.vp_c15)._m0[6].x;
    }
    float _706 = _702;
    float _708 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].z);
    float _710 = fma(_700, (*spvDescriptorSet0.vp_c15)._m0[0].y, (*spvDescriptorSet0.vp_c15)._m0[0].w);
    float _712 = _706;
    float _714 = (*spvDescriptorSet0.vp_c15)._m0[4].x;
    if (!_103)
    {
        float _716 = fma(_708, _706, (*spvDescriptorSet0.vp_c15)._m0[6].z);
        _107 = _716;
    }
    float _718 = _107;
    float _720 = fma(_710, (*spvDescriptorSet0.vp_c15)._m0[5].x, (*spvDescriptorSet0.vp_c15)._m0[5].w);
    float _722 = _718;
    if (!_103)
    {
        float _724 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _718);
        _722 = _724;
    }
    float _726 = _722;
    if (!_103)
    {
        float _728 = fma(_720, _706, (*spvDescriptorSet0.vp_c15)._m0[6].w);
        _704 = _728;
    }
    float _730 = _704;
    float _732 = _730;
    if (!_103)
    {
        float _734 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _730);
        _283 = _734;
    }
    float _736 = _283;
    if (!_103)
    {
        float2 _2140 = float2(_726, _736);
        float _738 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2140, float2(0.0), isnan(_2140)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2140, float2(0.0), isnan(_2140)), level(0.0)).x;
        _732 = _738;
    }
    float _740 = _732;
    if (_103)
    {
        _109 = (*spvDescriptorSet0.vp_c15)._m0[14].x;
    }
    float _742 = _109;
    float _744 = 0.0;
    if (_103)
    {
        _744 = (*spvDescriptorSet0.vp_c15)._m0[15].x;
    }
    float _746 = _744;
    if (_103)
    {
        float _748 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, _742, (*spvDescriptorSet0.vp_c15)._m0[14].z);
        _712 = _748;
    }
    float _750 = _712;
    float _752 = _750;
    if (_103)
    {
        float _754 = fma(_710, _742, (*spvDescriptorSet0.vp_c15)._m0[14].w);
        _111 = _754;
    }
    float _756 = _111;
    float _758 = _756;
    if (_103)
    {
        float _760 = fma(_750, _746, (*spvDescriptorSet0.vp_c15)._m0[15].z);
        _752 = _760;
    }
    float _762 = _752;
    float _764 = _762;
    if (_103)
    {
        float _766 = fma(_756, _746, (*spvDescriptorSet0.vp_c15)._m0[15].w);
        _758 = _766;
    }
    float _768 = _758;
    float _770 = _768;
    if (_103)
    {
        float _772 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _762);
        _764 = _772;
    }
    float _774 = _764;
    if (_103)
    {
        float _776 = fma((*spvDescriptorSet0.vp_c15)._m0[4].x, 0.5, _768);
        _770 = _776;
    }
    float _778 = _770;
    float _780 = _740;
    if (_103)
    {
        float2 _2232 = float2(_774, _778);
        float _782 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_2232, float2(0.0), isnan(_2232)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_2232, float2(0.0), isnan(_2232)), level(0.0)).x;
        _780 = _782;
    }
    float _784 = _780;
    float _786 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _788 = _710 + _786;
    float _790 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _792 = (*spvDescriptorSet0.vp_c15)._m0[0].z + _790;
    float _794 = _788 * _788;
    float _796 = fma(_792, _792, _794);
    float _798 = fma(_708, (*spvDescriptorSet0.vp_c15)._m0[8].x, (*spvDescriptorSet0.vp_c15)._m0[8].z);
    float _800 = fma(_720, (*spvDescriptorSet0.vp_c15)._m0[8].x, (*spvDescriptorSet0.vp_c15)._m0[8].w);
    float _802 = sqrt(_796);
    float _804 = fma(_708, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].z);
    float _806 = fma(_720, (*spvDescriptorSet0.vp_c15)._m0[7].x, (*spvDescriptorSet0.vp_c15)._m0[7].w);
    bool _808 = _802 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _810 = (*spvDescriptorSet0.vp_c15)._m0[7].x;
    float _812 = (*spvDescriptorSet0.vp_c14)._m0[0].y;
    if (!_808)
    {
        _810 = (*spvDescriptorSet0.vp_c15)._m0[0].z;
    }
    float _814 = _810;
    float _816 = fma(_784, (*spvDescriptorSet0.vp_c14)._m0[0].y, (*spvDescriptorSet0.vp_c14)._m0[1].y);
    float _818 = _816 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _820 = _814;
    if (!_808)
    {
        _812 = _816;
    }
    float _822 = _812;
    float _824 = fma((*spvDescriptorSet0.vp_c15)._m0[0].z, (*spvDescriptorSet0.vp_c4)._m0[2].x, _818);
    float _826 = fma(_710, (*spvDescriptorSet0.vp_c4)._m0[2].z, _824);
    float _828 = _826 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _830 = _826;
    float _832 = _822;
    if (!_808)
    {
        _830 = _710;
    }
    float _834 = _830;
    float _836 = _834;
    if (!_808)
    {
        _714 = _828;
    }
    float _838 = _714;
    bool _840 = !_808;
    float _842 = _838;
    if (!_840)
    {
        float _844 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _846 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _848 = _802 + _846;
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
    out.m_40.z = _804;
    out.m_40.w = _806;
    float _900 = fma(_890, (*spvDescriptorSet0.vp_c4)._m0[1].x, _896);
    float _902 = fma(_890, (*spvDescriptorSet0.vp_c4)._m0[0].x, _898);
    out.m_42.x = _798;
    out.m_42.y = _800;
    float _904 = fma(_892, (*spvDescriptorSet0.vp_c4)._m0[1].z, _900);
    float _906 = fma(_892, (*spvDescriptorSet0.vp_c4)._m0[0].z, _902);
    out.m_44.x = (*spvDescriptorSet0.vp_c15)._m0[0].z;
    out.m_44.y = _816;
    out.m_44.z = _710;
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

